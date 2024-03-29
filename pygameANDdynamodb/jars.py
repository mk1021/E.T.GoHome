import pygame
import socket
from time import time
from pygame.locals import *
from pygame import mixer
import json
import threading

 
BLACK = (0, 0, 0)
WHITE = (255, 255, 255)
BLUE = (0, 0, 255)
GREEN = (0, 255, 0)
RED = (255, 0, 0)
PURPLE = (255, 0, 255)
font_size = 30

#         >>------------- TCP settings ------------------<<
# Set up the TCP client socket
client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
#the server name and port client wishes to access
server_name = '18.132.50.40'
server_port = 12000
client_socket.connect((server_name, server_port))

# Icon                             

icon = pygame.image.load('trekking.png')   

pygame.display.set_icon(icon)

 
class Wall(pygame.sprite.Sprite):
    """This class represents the bar at the bottom that the player controls """
 
    def __init__(self, x, y, width, height, color):
        """ Constructor function """
 
        # Call the parent's constructor
        super().__init__()
 
        # Make a BLUE wall, of the size specified in the parameters
        self.image = pygame.Surface([width, height])
        self.image.fill(color)
 
        # Make our top-left corner the passed-in location.
        self.rect = self.image.get_rect()
        self.rect.y = y
        self.rect.x = x

class Player(pygame.sprite.Sprite):
    """ This class represents the bar at the bottom that the
    player controls """
 
    # Set speed vector
    change_x = 0
    change_y = 0
 
    def __init__(self, x, y):
        """ Constructor function """
 
        # Call the parent's constructor
        super().__init__()
 
        # Set height, width
        self.image = pygame.Surface([15, 15])
        self.image.fill(WHITE)
 
        # Make our top-left corner the passed-in location.
        self.rect = self.image.get_rect()
        self.rect.y = y
        self.rect.x = x
 
    def changespeed(self, x, y):
        """ Change the speed of the player. Called with a keypress. """
        self.change_x += x
        self.change_y += y
 
    def move(self, walls):
        """ Find a new position for the player """
 
        # Move left/right
        self.rect.x += self.change_x
 
        # Did this update cause us to hit a wall?
        block_hit_list = pygame.sprite.spritecollide(self, walls, False)
        for block in block_hit_list:
            # If we are moving right, set our right side to the left side of
            # the item we hit
            if self.change_x > 0:
                self.rect.right = block.rect.left
            else:
                # Otherwise if we are moving left, do the opposite.
                self.rect.left = block.rect.right
 
        # Move up/down
        self.rect.y += self.change_y
 
        # Check and see if we hit anything
        block_hit_list = pygame.sprite.spritecollide(self, walls, False)
        for block in block_hit_list:
 
            # Reset our position based on the top/bottom of the object.
            if self.change_y > 0:
                self.rect.bottom = block.rect.top
            else:
                self.rect.top = block.rect.bottom
 

class Room(object):
    """ Base class for all rooms. """
 
    # Each room has a list of walls, and of enemy sprites.
    wall_list = None
    enemy_sprites = None
 
    def __init__(self):
        """ Constructor, create our lists. """
        self.wall_list = pygame.sprite.Group()
        self.enemy_sprites = pygame.sprite.Group()

class Start(Room):
     """This creates all the walls in room 3"""
     def __init__(self):
        super().__init__()

        font = pygame.font.SysFont(None, 24)
        img = font.render('leaderboard', True, BLUE)
     
 
        walls = walls = [[0, 10, 20, 350, WHITE],
                 [0, 350, 20, 400, WHITE],
                 [780, -100, 20, 250, WHITE],
                 [780, 400, 20, 250, WHITE],
                 [20, 0, 760, 20, WHITE],
                 [20, 580, 760, 20, WHITE],
                ]
        for item in walls:
            wall = Wall(item[0], item[1], item[2], item[3], item[4])
            self.wall_list.add(wall)
 
class Room1(Room):
    """This creates all the walls in room 1"""
    def __init__(self):
        super().__init__()
        # Make the walls. (x_pos, y_pos, width, height)
 
        # This is a list of walls. Each is in the form [x, y, width, height]
        walls = [[0, -100, 20, 250, WHITE],
                 [0, 400, 20, 250, WHITE],
                 [780, -100, 20, 250, WHITE],
                 [780, 400, 20, 250, WHITE],
                 [20, 0, 760, 20, WHITE],
                 [20, 580, 760, 20, WHITE],
                 [390, 100, 20, 400, BLUE]
                ]
 
        # Loop through the list. Create the wall, add it to the list
        for item in walls:
            wall = Wall(item[0], item[1], item[2], item[3], item[4])
            self.wall_list.add(wall)
 
 
class Room2(Room):
    """This creates all the walls in room 2"""
    def __init__(self):
        super().__init__()
 
        walls = [[0, -100, 20, 250, WHITE],
                 [0, 400, 20, 250, WHITE],
                 [780, -100, 20, 250, WHITE],
                 [780, 400, 20, 250, WHITE],
                 [20, 0, 760, 20, WHITE],
                 [20, 580, 760, 20, WHITE],
                 [190, 80, 20, 500, GREEN],
                 [590, 20, 20, 500, GREEN]
                ]
 
        for item in walls:
            wall = Wall(item[0], item[1], item[2], item[3], item[4])
            self.wall_list.add(wall)

class Room3(Room):
    """This creates all the walls in room 3"""
    def __init__(self):
        super().__init__()
 
        walls = [[0, -100, 20, 250, WHITE],
                 [0, 400, 20, 250, WHITE],
                 [780, -100, 20, 250, WHITE],
                 [780, 400, 20, 250, WHITE],
                 [20, 0, 760, 20, WHITE],
                 [20, 580, 760, 20, WHITE],
                ]
 
        for item in walls:
            wall = Wall(item[0], item[1], item[2], item[3], item[4])
            self.wall_list.add(wall)
 
        for x in range(100, 800, 100):
            for y in range(20, 451, 360):
                wall = Wall(x, y, 20, 200, RED)
                self.wall_list.add(wall)
 
        for x in range(150, 700, 100):
            wall = Wall(x, 200, 20, 200, WHITE)
            self.wall_list.add(wall)

class Leaderboard(Room):
     """This creates all the walls in room 3"""
     def __init__(self):
        super().__init__()

        font = pygame.font.SysFont(None, 24)
        img = font.render('leaderboard', True, BLUE)
     
 
        walls = [[0, -100, 20, 250, WHITE],
                 [0, 400, 20, 250, WHITE],
                 [780, -100, 20, 250, WHITE],
                 [780, 400, 20, 250, WHITE],
                 [20, 0, 760, 20, WHITE],
                 [20, 580, 760, 20, WHITE],
                ]
 
        for item in walls:
            wall = Wall(item[0], item[1], item[2], item[3], item[4])
            self.wall_list.add(wall)


class Room5(Room):
    """This creates all the walls in room 2"""
    def __init__(self):
        super().__init__()
 
        walls = [[0, -100, 20, 250, WHITE]
                ]
 
        for item in walls:
            wall = Wall(item[0], item[1], item[2], item[3], item[4])
            self.wall_list.add(wall)


def receive():
    # Wait for start signal from server
    twoplayer = False
    while not twoplayer:
            global full_ready, is_player1, is_player2, is_player1_ready, is_player2_ready 
            global connected, ready_num, player_num, level_selected, start1, start2, current_level
            global P1Score, P2Score, GameOver1, GameOver2
            data = client_socket.recv(1024).decode()
            print(data + "wrong")
            if data == "fullready":
                full_ready = True

            if data == "start":
                in_game = True
                #connected = True

            elif data.startswith("player"):
                player_num = int(data.split()[1])
                print(f"hahahha{player_num}")
                if player_num == 1:
                    is_player1 = True
                    #is_player2 = False
                    #client_socket.send("Ready 1")
                    connected = True
                    twoplayer = True
                else:
                    #is_player1 = False
                    is_player2 = True
                    #client_socket.send("Ready 2")
                    connected = True
                    twoplayer = True

            elif data.startswith("ready"):
                ready_num = int(data.split()[1])
                if ready_num == 1:
                    is_player1_ready = True
                    print("received player1 ready")
                    #client_socket.send("Ready 1")
                    #connected = True
                else:
                    is_player2_ready = True
                    print("received player2 ready")
                    #client_socket.send("Ready 2")
                    #connected = True
            elif data.startswith("levelreceive"):
                start_num = int(data.split()[1])
                print("receive levelreceive")
                if start_num == 1:
                    start1 = True   # -------------------need to start from here, start1 and 2 should determined by sending signals
                elif start_num == 2:
                    start2 = True
            
            elif data.startswith("level"):
                    print("recievedlevel")
                    current_level = int(data.split()[1])
                    client_socket.send("LevelS2".encode())
                    level_selected = True

            elif data.isdigit():
                if is_player1:
                    P2Score = int(data)
                    print(P2Score)
                    print(" ")
                elif is_player2:
                    P1Score = int(data)
                    print(P1Score)
                    print(" ")

            elif data == "2GameOver":
                GameOver2 = True
            
            elif data == "1GameOver":
                GameOver1 = True

            elif data == "quit":
                print("receive quit")
                break

connected = False
is_player1 = False
is_player2 = False
is_player1_ready = False
is_player2_ready = False

def main():
    """ Main Program """
 
    # Call this function so the Pygame library can initialize itself
    pygame.init()
 
    # Create an 800x600 sized screen
    screen_width = 800
    screen_height = 600
    screen = pygame.display.set_mode([screen_width, screen_height])
 
    # Set the title of the window
    pygame.display.set_caption('Hello Jeff')
 
    # Create the player paddle object
    player = Player(50, 50)
    movingsprites = pygame.sprite.Group()
    movingsprites.add(player)
 
    rooms = []

    room = Start()
    rooms.append(room)
 
    room = Room1()
    rooms.append(room)
 
    room = Room2()
    rooms.append(room)
 
    room = Room3()
    rooms.append(room)

    room = Leaderboard()
    rooms.append(room)

    room = Room5()
    rooms.append(room)
 
    current_room_no = 0
    current_room = rooms[current_room_no]
 
    clock = pygame.time.Clock()
 
    done = False

    start_time = time()
    font = pygame.font.Font(None, 36)
    leaderboard_font = pygame.font.Font('freesansbold.ttf', 56)
    game_state = "playing"
    mixer.init()
    mixer.music.load('bensound-summer_mp3_music.mp3')
    mixer.music.play() 
    i = 0

    # Start the receive data thread
    receive_thread = threading.Thread(target=receive)
    #receive_thread.setDaemon(True)
    receive_thread.start()
    
    while not done:
        game_over = False
        in_game = False
        full_ready = False
        both_game_over = False
        GameOver1 = False
        GameOver2 = False   
        start1 = False
        start2 = False
        
 
        # --- Event Processing ---
 
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                print("im trying to quit")
                client_socket.send(("Quit").encode())
                client_socket.close()
                pygame.quit()
                quit()
 
            if event.type == pygame.KEYDOWN:
                if event.key == pygame.K_LEFT:
                    player.changespeed(-5, 0)
                if event.key == pygame.K_RIGHT:
                    player.changespeed(5, 0)
                if event.key == pygame.K_UP:
                    player.changespeed(0, -5)
                if event.key == pygame.K_DOWN:
                    player.changespeed(0, 5)
            if event.type == pygame.KEYUP:
                if event.key == pygame.K_LEFT:
                    player.changespeed(5, 0)
                if event.key == pygame.K_RIGHT:
                    player.changespeed(-5, 0)
                if event.key == pygame.K_UP:
                    player.changespeed(0, 5)
                if event.key == pygame.K_DOWN:
                    player.changespeed(0, -5)
                

        # --- Game Logic ---
 
        player.move(current_room.wall_list)
 
        if player.rect.x < -15:
            if current_room_no == 0:
                current_room_no = 2
                current_room = rooms[current_room_no]
                player.rect.x = 790
            elif current_room_no == 2:
                current_room_no = 1
                current_room = rooms[current_room_no]
                player.rect.x = 790
            else:
                current_room_no = 0
                current_room = rooms[current_room_no]
                player.rect.x = 790
 
        if player.rect.x > 801:
            if (current_room_no == 0 and connected):
                current_room_no = 1
                current_room = rooms[current_room_no]
                player.rect.x = 0
            elif current_room_no == 1:
                current_room_no = 2
                current_room = rooms[current_room_no]
                player.rect.x = 0
            elif current_room_no == 2:
                current_room_no = 3
                current_room = rooms[current_room_no]
                player.rect.x = 0
            elif current_room_no == 3:
                current_room_no = 4
                current_room = rooms[current_room_no]
                player.rect.x = 0
            elif current_room_no == 4:
                current_room_no = 5
                current_room = rooms[current_room_no]
            else:
                current_room_no = 0
                current_room = rooms[current_room_no]
                player.rect.x = 0
        if current_room_no == 5:
                    game_state = "game_over"
 
        # --- Drawing ---
        screen.fill(BLACK)
        movingsprites.draw(screen)
        current_room.wall_list.draw(screen)

        if current_room_no == 0:
         while not connected:
             print('other player not connected')
             client_socket.send("request".encode())


          # Draw the countdown timer
        if current_room_no == 4:
            elapsed_time = elapsed_time
            #         >>------------- TCP settings ------------------<< 
            if i == 0:
              name = input("Enter your name: ")
              client_socket.send(("serverName"+"/"+str(f"{remaining_time:02}")+"/"+name).encode())
              leaderboard_str= client_socket.recv(1024).decode()
              print("in loop")
             # print(leaderboard_str)

              i =+ 1 
            leaderboard_text = leaderboard_font.render("Scores", True, (147, 112, 219))
            screen.blit(leaderboard_text, [240, 50])
            score_text = font.render("Your Time : " + str(f"{remaining_time:02}"), True, (147, 112, 219))
            screen.blit(score_text, [50, 130])
            score_text = font.render(leaderboard_str, True, (147, 112, 219))
            screen.blit(score_text, [50, 200])  
            print("out of loop")
            
   

        elif current_room_no == 0: 
          start_time = time()
        else:
         elapsed_time = int(time() - start_time)
         remaining_time = max( elapsed_time, 0)
         countdown_text = font.render("Time Taken: " + str(f"{remaining_time:02}"), True, WHITE)
         screen.blit(countdown_text, [screen_width - 250, 20])
 
        # If the game state is "game_over", wait for the user to close the window
        if game_state == "game_over":

         while True:
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    client_socket.close()
                    pygame.quit()
 
        pygame.display.flip()


        clock.tick(70)
   
 
 
    pygame.quit()
 
if __name__ == "__main__":
    main()

