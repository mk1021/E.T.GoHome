import socket
import boto3
import threading
import time
from boto3.dynamodb.conditions import Key

print("We're in tcp server...")
server_port = 12000

welcome_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
welcome_socket.bind(('0.0.0.0', server_port))
welcome_socket.listen(2)

print('Server running on port', server_port)

connected_clients = []
connection_times = []
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
    leaderboard_str = "Leaderboard:\n"
    for item in leaderboard_sorted:
        leaderboard_str += f"{item['name']} {item['score']}\n"
    return leaderboard_str

# Define a function to handle a client connection
def handle_client(conn,addr):
    global connected_clients, connection_times, player1_conn, player2_conn, ready1, ready2, LevelS1, LevelS2, client_scores
    global P1Score, P2Score
    q = False
    w = False
    while True:            
            data = conn.recv(1024).decode()
            if data == 'Quit':
             print ("hehe ")
             conn.close()
             if conn in connected_clients:

                        connection_times.remove(connection_times[connected_clients.index(conn)])

                        connected_clients.remove(conn)

                        print(f'Disconnected by {addr}')

                        print(connected_clients)

                        print(connection_times)                      

             break
            elif data.startswith("Player1_Score: "):
                Player1_Score = int(data.split()[1])
                print(data)
                print((data.split()[1]))
                player2_conn.send(("Player1_Score: " + str(data.split()[1])).encode())
            elif data.startswith('Player2_Score: '):
                Player2_Score = int(data.split()[1])
                print(data)
                print((data.split()[1]))
                player1_conn.send(("Player2_Score: " + str(data.split()[1])).encode())
                                  
            elif data == 'request':
              
              
              print("receive request")
              # Add the client and its connection time to the lists
              if conn not in connected_clients:
                  connected_clients.append(conn)
                  connection_times.append(time.time())
                  
              if len(connected_clients) == 2:
                  # Determine which client connected first and assign player 1 and player 2
                  if connection_times[0] < connection_times[1]:
                      player1_conn = connected_clients[0]
                      player2_conn = connected_clients[1]
                  else:
                      player1_conn = connected_clients[1]
                      player2_conn = connected_clients[0]
                  # Send player assignments to the clients
                  player1_conn.send('player 1'.encode())
                  player2_conn.send('player 2'.encode())
                  
              elif len(connected_clients) != 2:
                  print("not two players")
            
            elif data.startswith("serverName"):
                print("receiving")
                server_name, score, name = data.split("/")
                store_player_score(server_name, name, score)
                get_leaderboard(server_name)
                leaderboard = get_leaderboard(server_name)
                player1_conn.send(leaderboard.encode())
                player2_conn.send(leaderboard.encode())

            elif data.startswith("Freeze2"):
                print(data)
                player2_conn.send(('Player2_Freeze').encode())
                player2_conn.send(('Player2_Freeze').encode())
                player2_conn.send(('Player2_Freeze').encode())
            elif data.startswith("Freeze1"):
                print(data)
                player1_conn.send(('Player1_Freeze').encode())
                player1_conn.send(('Player1_Freeze').encode())
                player1_conn.send(('Player1_Freeze').encode())


while True:
    conn, addr = welcome_socket.accept()
    print(f'Connected by {addr}')
    thread = threading.Thread(target=handle_client, args=(conn,addr))
    thread.start()
   


 #   connection_socket.close()