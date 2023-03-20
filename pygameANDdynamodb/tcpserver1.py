import socket
import boto3
from boto3.dynamodb.conditions import Key

print("We're in tcp server...")
server_port = 12000

welcome_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
welcome_socket.bind(('0.0.0.0', server_port))
welcome_socket.listen(1)

print('Server running on port', server_port)

client_scores = {}

dynamodb = boto3.resource('dynamodb', region_name='us-east-1')
leaderboard_table = dynamodb.Table('PlayerScores')

# Function to store player scores in DynamoDB
def store_player_score(server_name, name, score):
    table = dynamodb.Table('PlayerScores')
    response = table.put_item(
        Item={
            'serverIP': server_name,
            'name': name,
            'score': int(score)
        }
    )
    print("Score stored:", response)

def get_leaderboard(server_name):
    leaderboard_table = dynamodb.Table('PlayerScores')
    response = leaderboard_table.query(
        KeyConditionExpression=Key('serverIP').eq(server_name),
        ProjectionExpression='#n, score',
        ExpressionAttributeNames={'#n': 'name'},
        Limit=5
        )
    items = response['Items']
    leaderboard_sorted = sorted(items, key=lambda x: x['score'], reverse=False)
    print("Leaderboard:")
    for item in leaderboard_sorted:
        print(item['name'], item['score'])


while True:

    connection_socket, caddr = welcome_socket.accept()
    msg = (connection_socket.recv(1024).decode())
    if msg.startswith("serverName"):
        server_name, score, name = msg.split("/")
        store_player_score(server_name, name, score)
        get_leaderboard(server_name)
    
   
    connection_socket.send(msg.encode())
    connection_socket.close()