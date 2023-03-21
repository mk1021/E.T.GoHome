import pygame
import socket
from time import time
from pygame.locals import *
from pygame import mixer
import json
import threading

 
BLACK = (0, 0, 0)
WHITE = (255, 255, 255)
BLUE = (65, 105, 225)
GREEN = (0, 255, 0)
RED = (255, 0, 0)
PURPLE = (255, 0, 255)
VIOLET = (138,43,226)
DEEP_PINK = (255, 20, 147)
ORANGE = (255, 228, 181)
font_size = 30





#         >>------------- TCP settings ------------------<<
# Set up the TCP client socket
client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
#the server name and port client wishes to access
server_name = '18.130.254.105'
server_port = 12000
client_socket.connect((server_name, server_port))

# Icon                             

icon = pygame.image.load('alien.png')   

pygame.display.set_icon(icon)

start_time = 0
time_offset = 0
i = 0

active = True

pygame.font.init()
font = pygame.font.Font(None, 36)

def UpdateStartTime(value):
    global start_time 
    start_time = value

def UpdateTime():
    global start_time,  elapsed_time
    elapsed_time = int(time() - start_time + time_offset)
    return elapsed_time 

def UpdateTimeVal(value):
    global start_time
    global time_offset
    time_offset = time_offset + value
    elapsed_time = int(time() - start_time + time_offset)
    countdown_text = font.render("Time Taken: " + str(f"{elapsed_time:03}"), True, WHITE)
    return countdown_text


#def Freeze():

    # Check if player collides with each circle and remove it if it does



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

class PowerUp(pygame.sprite.Sprite):
    """This class represents the bar at the bottom that the player controls """
 
    def __init__(self, x, y, width, height, image_path):
        """ Constructor function """

        # Call the parent's constructor
        super().__init__()

        # Load the image
        self.image = pygame.image.load(image_path).convert_alpha()

        # Scale the image to the specified size
        self.image = pygame.transform.scale(self.image, (width, height))

        # Make our top-left corner the passed-in location.
        self.rect = self.image.get_rect()
        self.rect.y = y
        self.rect.x = x

def receive():
    # Wait for start signal from server
    done = False
    twoplayer = False
    global data, player1_freeze, player2_freeze , player2finished, player1finished, player1_Scoreprint, player2_Scoreprint,leaderboard_score 
    leaderboard_score = "0"
    player1_freeze = False
    player2_freeze = False
    player2finished = False 
    player1finished = False 
    while not done:
            global full_ready, is_player1, is_player2, is_player1_ready, is_player2_ready 
            global connected, ready_num, player_num
            data = client_socket.recv(1024).decode()
          #  print(data)
            while not twoplayer:
              if data.startswith("player"):
                  player_num = int(data.split()[1])
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
    
              elif data.startswith("player"):
                  player_num = int(data.split()[1])
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
    
            if data.startswith("Player1_Freeze"):
                 if player_num == 1:
                   print("im frozen 1")
                   player1_freeze = True 
            if data.startswith("Player2_Freeze"):
                 if player_num == 2:
                   print("im frozen 2")
                   player2_freeze = True 

            if data.startswith('Leaderboard:'):
                leaderboard_score = data
                player2finished = True
                player1finished = True

            if data.startswith('Player2_Score: '):
                if player_num == 1:
                     print("2 score recieving")
                     print(data.split()[1])
                     player2_Scoreprint = (data.split()[1])
                     player2finished = True

                if data.startswith('Player1_Score: '):
                    if player_num == 2:
                         print("2 score recieving")
                         print("Player1 Score: " +(data.split()[1]))
                         player1_Scoreprint = "Player1 Score: " +(data.split()[1])
                         player1finished = True

            elif data == "quit":
                print("receive quit")
                done = True
                break



class Player(pygame.sprite.Sprite):
    """ This class represents the bar at the bottom that the
    player controls """
 
    # Set speed vector
    change_x = 0
    change_y = 0
 
    def __init__(self, x, y):
        """ Constructor function """
 
        # Call the parent's constructor
        # Call the parent's constructor
        super().__init__()

        # Load the default image
        sprite_image = pygame.image.load("5e8f089aee3ef200041aa0dc.png")

        # Scale the image down to a smaller size
        small_sprite_image = pygame.transform.scale(sprite_image, (35, 35))
        self.image = small_sprite_image
 
        # Make our top-left corner the passed-in location.
        self.rect = self.image.get_rect()
        self.rect.y = y - 7 
        self.rect.x = x - 7

        self.images = {'left': "output-onlinepngtools.png",
               'right': "5e8f089aee3ef200041aa0dc.png",
               'up': "5e8f089aee3ef200041aa0dc.png",
               'down': "5e8f089aee3ef200041aa0dc.png"}
        

    def changespeed(self, x, y):
        """ Change the speed of the player. Called with a keypress. """
                # Update the dictionary of images
        if x > 0:
            self.images['right'] = "5e8f089aee3ef200041aa0dc.png"
        elif x < 0:
            self.images['left'] =  "output-onlinepngtools.png"
        elif y > 0:
            self.images['down'] = "5e8f089aee3ef200041aa0dc.png"
        elif y < 0:
            self.images['up'] = "5e8f089aee3ef200041aa0dc.png"

        self.change_x += x
        self.change_y += y
 
    def move(self, walls, addTime, freeze, subTime):
        """ Find a new position for the player """
        global collide
        collide = False 
        if self.change_x > 0:
            self.image = pygame.transform.scale(pygame.image.load(self.images['right']), (35, 35))
        elif self.change_x < 0:
            self.image = pygame.transform.scale(pygame.image.load(self.images['left']), (35, 35))
        elif self.change_y > 0:
            self.image = pygame.transform.scale(pygame.image.load(self.images['down']), (35, 35))
        elif self.change_y < 0:
            self.image = pygame.transform.scale(pygame.image.load(self.images['up']), (35, 35))
        
        # Move left/right
        self.rect.x += self.change_x
 
        # Did this update cause us to hit a wall?
        block_hit_list = pygame.sprite.spritecollide(self, walls, False)
        powerup_hit_list =  pygame.sprite.spritecollide(self, addTime, False)
        subtime_hit_list =  pygame.sprite.spritecollide(self, subTime, False)
        freeze_hit_list =  pygame.sprite.spritecollide(self, freeze, False)

        for block in block_hit_list:
            # If we are moving right, set our right side to the left side of
            # the item we hit
            if self.change_x > 0:
                self.rect.right = block.rect.left
            
            else:
                # Otherwise if we are moving left, do the opposite.
                self.rect.left = block.rect.right
                

        for block in powerup_hit_list:
            print("collided")
            block.kill() 
            if player_num == 1:
                UpdateTimeVal(5)
                print("player1 time")
            elif player_num == 2:
                UpdateTimeVal(5)
                print("player2 time")

        for block in freeze_hit_list:
            # If we are moving right, set our right side to the left side of
            # the item we hit
            block.kill()
            if player_num == 2:
                print("player1 freeze")
                client_socket.send("Freeze1".encode())
                collide = True
            if player_num == 1:
                print("player2 freeze")
                client_socket.send("Freeze2".encode())
                collide = True

        for block in subtime_hit_list:
            print("collided")
            # If we are moving right, set our right side to the left side of
            # the item we hit
            block.kill() 
            if player_num == 1:
                UpdateTimeVal(-5)
            elif player_num == 2:
                UpdateTimeVal(-5)

 

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

        for block in powerup_hit_list:
            print("collided2")
            # Reset our position based on the top/bottom of the object.
            block.kill()
            print (player_num)
            if player_num == 1:
                UpdateTimeVal(5)
                print("player1 time")
            elif player_num == 2:
                print("player2 time")
                UpdateTimeVal(5)
                print("player2 time")


        for block in freeze_hit_list:
            block.kill()
            if player_num == 2:
                print("player1 freeze")
                client_socket.send("Freeze1".encode())
                collide = True
            if player_num == 1:
                print("player2 freeze")
                client_socket.send("Freeze2".encode())
                collide = True

        for block in powerup_hit_list:
            print("collided2")
            block.kill()
            print (player_num)
            if player_num == 1:
                UpdateTimeVal(-5)
            elif player_num == 2:
                UpdateTimeVal(-5)

            



class Room(object):
    """ Base class for all rooms. """
 
    # Each room has a list of walls, and of enemy sprites.
    wall_list = None
    addTime_list = None
    subTime_list = None
    freeze_list = None
 
    def __init__(self):
        """ Constructor, create our lists. """
        self.wall_list = pygame.sprite.Group()
        self.addTime_list = pygame.sprite.Group()
        self.subTime_list = pygame.sprite.Group()
        self.freeze_list = pygame.sprite.Group()

class Start(Room):
    """This creates all the walls in room 3"""
    def __init__(self):
        super().__init__()

        font = pygame.font.SysFont(None, 24)
        img = font.render('leaderboard', True, BLUE)
        self.background = pygame.image.load("stars-2643089__340.jpeg").convert()

        walls = [[0, 10, 20, 350, WHITE],
                 [0, 350, 20, 400, WHITE],
                 [780, -100, 20, 250, WHITE],
                 [780, 400, 20, 250, WHITE],
                 [20, 0, 760, 20, WHITE],
                 [20, 580, 760, 20, WHITE]
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
        addTime = [[255, 105, 40, 40, "icons8-add-time-32.png"],
                   [255, 455, 40, 40,"icons8-add-time-32.png" ],
                  ]
        
        subTime = [[505, 180, 40, 40, "clock.png"],
                   [505, 380, 40, 40,"clock.png" ],
                  ]
        
        freeze = [[255, 280, 40, 40, "ufo.png"],
                  [555, 280, 40, 40, "ufo.png"],
                 ]
        
        for item in addTime:
            addTime = PowerUp(item[0], item[1], item[2], item[3], item[4])
            self.addTime_list.add(addTime)

        for item in subTime:
            subTime = PowerUp(item[0], item[1], item[2], item[3], item[4])
            self.subTime_list.add(subTime)

        for item in freeze:
            freeze = PowerUp(item[0], item[1], item[2], item[3], item[4])
            self.freeze_list.add(freeze)
 
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
 
        addTime = [[380, 55, 40, 40, "icons8-add-time-32.png"],
                   [380, 280, 40, 40, "icons8-add-time-32.png" ],
                   [380, 505, 40, 40, "icons8-add-time-32.png" ],
                  ]
        
        subTime = [[80, 505, 40, 40, "clock.png"],
                   [680, 55, 40, 40,"clock.png" ],
                  ]
        
        for item in addTime:
            addTime = PowerUp(item[0], item[1], item[2], item[3], item[4])
            self.addTime_list.add(addTime)

        for item in subTime:
            subTime = PowerUp(item[0], item[1], item[2], item[3], item[4])
            self.subTime_list.add(subTime)

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
                wall = Wall(x, y, 10, 200, VIOLET)
                self.wall_list.add(wall)
 
        for x in range(150, 700, 100):
            wall = Wall(x, 200, 10, 200, WHITE)
            self.wall_list.add(wall)

        addTime = [[130, 100, 40, 40, "icons8-add-time-32.png"],
                   [330, 100, 40, 40, "icons8-add-time-32.png" ],
                   [530, 100, 40, 40, "icons8-add-time-32.png" ],
                   [230, 460, 40, 40, "icons8-add-time-32.png"],
                   [430, 460, 40, 40, "icons8-add-time-32.png" ],
                   [630, 460, 40, 40, "icons8-add-time-32.png" ],
                  ]
        
        subTime = [[330, 460, 40, 40, "clock.png"],
                   [530, 460, 40, 40, "clock.png"],
                  ]
        
        freeze = [[40, 40, 40, 40, "ufo.png"],
                  [40, 620, 40, 40, "ufo.png"],
                 ]
        
        for item in addTime:
            addTime = PowerUp(item[0], item[1], item[2], item[3], item[4])
            self.addTime_list.add(addTime)

        for item in subTime:
            subTime = PowerUp(item[0], item[1], item[2], item[3], item[4])
            self.subTime_list.add(subTime)

        for item in freeze:
            freeze = PowerUp(item[0], item[1], item[2], item[3], item[4])
            self.freeze_list.add(freeze)


class Room4(Room):
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
                 [180, 20, 20, 400, DEEP_PINK],
                 [180, 20, 180, 20, DEEP_PINK],
                 [180, 220, 180, 20, DEEP_PINK],
                 [180, 420, 180, 20, DEEP_PINK],
                 [400, 420, 15, 15, DEEP_PINK],
                 [420, 160, 180, 20, DEEP_PINK],
                 [500, 160, 20, 420, DEEP_PINK],
                 [620, 565, 15, 15, DEEP_PINK],
                ]
 
        addTime = [[360, 410, 40, 40, "icons8-add-time-32.png"],
                   [260, 120, 40, 40, "icons8-add-time-32.png" ],
                   [260, 340, 40, 40, "icons8-add-time-32.png" ],
                   [480, 55, 40, 40, "icons8-add-time-32.png" ],
                  ]
        
        subTime = [[55, 55, 40, 40, "clock.png"],
                  ]
        
        freeze = [[550, 540, 40, 40, "ufo.png"],
                 ]
        
        for item in addTime:
            addTime = PowerUp(item[0], item[1], item[2], item[3], item[4])
            self.addTime_list.add(addTime)

        for item in subTime:
            subTime = PowerUp(item[0], item[1], item[2], item[3], item[4])
            self.subTime_list.add(subTime)

        for item in freeze:
            freeze = PowerUp(item[0], item[1], item[2], item[3], item[4])
            self.freeze_list.add(freeze)

        # Loop through the list. Create the wall, add it to the list
        for item in walls:
            wall = Wall(item[0], item[1], item[2], item[3], item[4])
            self.wall_list.add(wall)

class Room5(Room):
    """This creates all the walls in room 5"""
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
                 [100, 80, 680, 20, ORANGE],
                 [100, 500, 680, 20, ORANGE],
                 [100, 100, 20, 150, ORANGE],
                 [100, 350, 20, 150, ORANGE],
                 [220, 100, 20, 250, ORANGE],
                 [330, 250, 20, 250, ORANGE],
                 [440, 100, 20, 250, ORANGE],
                 [550, 250, 20, 250, ORANGE],
                 [660, 100, 20, 250, ORANGE],
                ]
            
        addTime = [[210, 405, 40, 40, "icons8-add-time-32.png"],
                   [320, 155, 40, 40, "icons8-add-time-32.png" ],
                   [430, 405, 40, 40, "icons8-add-time-32.png" ],
                   [540, 155, 40, 40, "icons8-add-time-32.png" ],
                   [650, 405, 40, 40, "icons8-add-time-32.png" ],
                  ]
        
        subTime = [[730, 530, 40, 40, "clock.png"],
                  ]
        
        freeze = [[730, 30, 40, 40, "ufo.png"],
                 ]

        for item in addTime:
            addTime = PowerUp(item[0], item[1], item[2], item[3], item[4])
            self.addTime_list.add(addTime)

        for item in subTime:
            subTime = PowerUp(item[0], item[1], item[2], item[3], item[4])
            self.subTime_list.add(subTime)

        for item in freeze:
            freeze = PowerUp(item[0], item[1], item[2], item[3], item[4])
            self.freeze_list.add(freeze)

        # Loop through the list. Create the wall, add it to the list
        for item in walls:
            wall = Wall(item[0], item[1], item[2], item[3], item[4])
            self.wall_list.add(wall)


class Leaderboard(Room):
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

class PlayerScores(Room):
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


class Room6(Room):
    """This creates all the walls in room 2"""
    def __init__(self):
        super().__init__()
 
        walls = [[0, -100, 20, 250, WHITE]
                ]
 
        for item in walls:
            wall = Wall(item[0], item[1], item[2], item[3], item[4])
            self.wall_list.add(wall)




connected = False
is_player1 = False
is_player2 = False
is_player1_ready = False
is_player2_ready = False

def main():
    """ Main Program """
    global collide
    collide = False 
    global player2_freeze
    player2_freeze = False 
    global player1_freeze
    player1_freeze = False 
    # Call this function so the Pygame library can initialize itself
    pygame.init()
    Scoreprint = 0
 
    # Create an 800x600 sized screen
    screen_width = 800
    screen_height = 600
    screen = pygame.display.set_mode([screen_width, screen_height])
 
    # Set the title of the window
    pygame.display.set_caption('Help E.T.!')
 
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

    room = Room4()
    rooms.append(room)

    room = Room5()
    rooms.append(room)

    room = PlayerScores()
    rooms.append(room)

    room = Leaderboard()
    rooms.append(room)

    room = Room6()
    rooms.append(room)
 
    current_room_no = 0
    current_room = rooms[current_room_no]
 
    clock = pygame.time.Clock()
 
    done = False

    leaderboard_font = pygame.font.Font('freesansbold.ttf', 56)
    game_state = "playing"
    #mixer.init()
    #mixer.music.load('bensound-summer_mp3_music.mp3')
    #mixer.music.play() 
    i = 0
    x = 0
    y = 0
    r = 0
    q = 0
    a = 0
  

    # Start the receive data thread
    receive_thread = threading.Thread(target=receive)
    #receive_thread.setDaemon(True)
    receive_thread.start()

    # Load the image to use as the background
    background_image = pygame.image.load("etfinal.png")
    
    # Get the dimensions of the image
    image_width, image_height = background_image.get_size()
    
    # Calculate the scaling factors to fill the screen
    scale_width = screen_width / image_width
    scale_height = screen_height / image_height
    scale = max(scale_width, scale_height)
    
    # Scale the image
    background_image = pygame.transform.scale(background_image, (int(image_width * scale), int(image_height * scale)))
    
    # Get the dimensions of the scaled image
    image_width, image_height = background_image.get_size()
    
    # Calculate the position to center the image on the screen
    x = (screen_width - image_width) / 2
    y = (screen_height - image_height) / 2
    
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
 
        player.move(current_room.wall_list,current_room.addTime_list, current_room.freeze_list, current_room.subTime_list)
 
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
                current_room_no = 6
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
                player.rect.x = 0
            elif current_room_no == 5:
                current_room_no = 6
                current_room = rooms[current_room_no]
                player.rect.x = 0
            elif current_room_no == 6:
                current_room_no = 7
                current_room = rooms[current_room_no]
                player.rect.x = 0
            elif current_room_no == 7:
                current_room_no = 8
                current_room = rooms[current_room_no]
                player.rect.x = 0
            else:
                current_room_no = 0
                current_room = rooms[current_room_no]
                player.rect.x = 0
        if current_room_no == 8:
                    game_state = "game_over"
 
        # --- Drawing ---
        screen.blit(background_image, (x, y))
        movingsprites.draw(screen)
        current_room.wall_list.draw(screen)
        current_room.addTime_list.draw(screen)
        current_room.subTime_list.draw(screen)
        current_room.freeze_list.draw(screen)

        if current_room_no == 0:
         while not connected:
             print('other player not connected')
             client_socket.send("request".encode())
             # Load the image to use as the background
         UpdateStartTime(int(time()))
         #start_time = time() 
         #elapsed_time = int(time() - start_time)
         #remaining_time = max( elapsed_time, 0)
         countdown_text = font.render("Time Taken: " + str(f"{00:03}"), True, WHITE)
         screen.blit(countdown_text, [550, 20])
        


          # Draw the countdown timer
        elif current_room_no == 7:
            background_image = pygame.image.load("Scores.jpg")
            image_width, image_height = background_image.get_size()
       
            # Calculate the scaling factors to fill the screen
            scale_width = screen_width / image_width
            scale_height = screen_height / image_height
            scale = max(scale_width, scale_height)
            
            # Scale the image
            background_image = pygame.transform.scale(background_image, (int(image_width * scale), int(image_height * scale)))
            
            # Get the dimensions of the scaled image
            image_width, image_height = background_image.get_size()
            
            # Calculate the position to center the image on the screen
            x = (screen_width - image_width) / 2
            y = (screen_height - image_height) / 2
 
            if q == 0:
             timef = timefinal
             timef = timef
             q+=1
            
            #         >>------------- TCP settings ------------------<< 
      
        #PLAYER 1====================================
            if player_num == 1:
              if i == 0:
               name = input("Enter your name: ")
               client_socket.send(("serverName"+"/"+str(f"{timef:03}")+"/"+name).encode())
               i += 1
  
             # client_socket.send(("Player1_Score: " + str(f"{timef:03}")).encode())
            
              score_text = font.render("Your Time : " + str(f"{timef:03}"), True, WHITE)
              screen.blit(score_text, [70, 200])
              print (leaderboard_score)
              leaderboard_lines = leaderboard_score.split("\n")


              if player2finished: 
                leaderboard_lines = leaderboard_score.split("\n")
                print ("p2 finished")
                for i in range(6):
                    line = leaderboard_lines[i]
                    text = font.render(line, True, WHITE)
                    screen.blit(text, (70,300 + i * 25))
         #       print(Scoreprint)
         #       scores =( "Player2 Score: " + Scoreprint)
         #       print("the other player finished")
         #       score_text = font.render(scores, True, WHITE)
                 
                 
        
        #PLAYER 2====================================
            if player_num == 2:
              if i == 0:
               name = input("Enter your name: ")
               client_socket.send(("serverName"+"/"+str(f"{timef:03}")+"/"+name).encode())
               i += 1

         
              #client_socket.send(("Player2_Score: " + str(f"{timef:03}")).encode())

              score_text = font.render("Your Time : " + str(f"{timef:03}"), True, WHITE)
              screen.blit(score_text, [70, 200])
              print (leaderboard_score)
              leaderboard_lines = leaderboard_score.split("\n")


              if player1finished: 
               print ("p1 finished")
               for i in range(6):
                    line = leaderboard_lines[i]
                    text = font.render(line, True, WHITE)
                    screen.blit(text, (70,300 + i * 25))
           #    print(Scoreprint)
           #    scores =( "Player2 Score: " + Scoreprint)
           #    print("the other player finished")
           #    score_text = font.render(scores, True, WHITE)
           #    screen.blit(score_text, [70, 240])  
               

            #print("out of loop")
            
   

          # Get the dimensions of the image
        elif current_room_no == 6:
            if r == 0:
             leaderboard = " "
             timefinal = UpdateTime() 
             timefinal = timefinal
             r+=1
            countdown_text = font.render("Time Taken: " + str(f"{timefinal:03}"), True, WHITE)
            screen.blit(countdown_text, [screen_width - 250, 20])
            background_image = pygame.image.load("home.jpeg")
            image_width, image_height = background_image.get_size()
    
            # Calculate the scaling factors to fill the screen
            scale_width = screen_width / image_width
            scale_height = screen_height / image_height
            scale = max(scale_width, scale_height)
            
            # Scale the image
            background_image = pygame.transform.scale(background_image, (int(image_width * scale), int(image_height * scale)))
            
            # Get the dimensions of the scaled image
            image_width, image_height = background_image.get_size()
            
            # Calculate the position to center the image on the screen
            x = (screen_width - image_width) / 2
            y = (screen_height - image_height) / 2
        else:
         #elapsed_time = int(time() - start_time)
         #remaining_time = max( elapsed_time, 0)
         #countdown_text = font.render("Time Taken: " + str(f"{remaining_time:03}"), True, WHITE)
         countdown_text = font.render("Time Taken: " + str(f"{UpdateTime():03}"), True, WHITE)
         screen.blit(countdown_text, [screen_width - 250, 20])
         background_image = pygame.image.load("background.jpg")
         image_width, image_height = background_image.get_size()
    
         # Calculate the scaling factors to fill the screen
         scale_width = screen_width / image_width
         scale_height = screen_height / image_height
         scale = max(scale_width, scale_height)
         
         # Scale the image
         background_image = pygame.transform.scale(background_image, (int(image_width * scale), int(image_height * scale)))
         
         # Get the dimensions of the scaled image
         image_width, image_height = background_image.get_size()
         
         # Calculate the position to center the image on the screen
         x = (screen_width - image_width) / 2
         y = (screen_height - image_height) / 2

         if player2_freeze:
             if a == 0:
                 time_freeze = UpdateTime()
                 a += 1
                 while (UpdateTime() < (time_freeze+3)):
                     player.changespeed(0, 0)
             a = 0
             player2_freeze = False


         if player1_freeze:
             if a == 0:
                 time_freeze = UpdateTime()
                 a += 1
                 while (UpdateTime() < (time_freeze+3)):
                     print (time_freeze)
                     player.changespeed(0, 0)
             a = 0
             player1_freeze = False
              



 
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
