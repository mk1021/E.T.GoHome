import socket
print("We're in tcp server...");
#select a server port
server_port = 12000
#create a welcoming socket
welcome_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
#bind the server to the localhost at port server_port
welcome_socket.bind(('0.0.0.0',server_port))
welcome_socket.listen(1)
#ready message
print('Server running on port ', server_port)
#Now the main server loop
CurrentScore = []
Dummylist = []
while True:
    connection_socket, caddr = welcome_socket.accept()
    #notice recv and send instead of recvto and sendto
    cmsg = connection_socket.recv(1024)
    cmsg = cmsg.decode()
    CurrentScore.append(cmsg)
    CurrentScore.sort(reverse=True)
    Dummylist.append(CurrentScore[0:9])
   # Dummylist.append(CurrentScore[1])
   # Dummylist.append(CurrentScore[2])
   # Dummylist.append(CurrentScore[3])
   # Dummylist.append(CurrentScore[4])
   # Dummylist.append(CurrentScore[5])
   # Dummylist.append(CurrentScore[6])
   # Dummylist.append(CurrentScore[7])
   # Dummylist.append(CurrentScore[8])
   # Dummylist.append(CurrentScore[9])





    connection_socket.send(str(CurrentScore).encode()) 

