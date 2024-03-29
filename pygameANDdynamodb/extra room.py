import pygame
import socket
from time import time
from pygame.locals import *
from pygame import mixer
import random
 
BLACK = (0, 0, 0)
WHITE = (255, 255, 255)
BLUE = (30,144,255)
GREEN = (46, 139, 87)
RED = (138, 43, 226)
PURPLE = (255, 0, 255)
PINK = (255, 192, 203)
DEEP_PINK = (255, 20, 147)
ORANGE = (255, 228, 181)
RED2 = (205, 92, 92)
font_size = 30

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

class MovingWall(pygame.sprite.Sprite):
    """This class represents the bar at the bottom that the player controls """
 
    change_y = 0

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

    def changespeed(self, y):
        """ Change the speed of the player. Called with a keypress. """
        self.change_y += y

    def move(self, walls):
        """ Find a new position for the player """
 
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
 
class Room1(Room):
    """This creates all the walls in room 1"""
    def __init__(self):
        super().__init__()
        # Make the walls. (x_pos, y_pos, width, height)
 
        # This is a list of walls. Each is in the form [x, y, width, height]
        walls = [[0, 10, 20, 350, WHITE],
                 [0, 350, 20, 400, WHITE],
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

class Room4(Room):
    """This creates all the walls in room 4"""
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
 
        # Loop through the list. Create the wall, add it to the list
        for item in walls:
            wall = Wall(item[0], item[1], item[2], item[3], item[4])
            self.wall_list.add(wall)

class Room6(Room):
    """This creates all the walls in room 6"""

    change_y = 0

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
                ]
 
        # Loop through the list. Create the wall, add it to the list
        for item in walls:
            wall = Wall(item[0], item[1], item[2], item[3], item[4])
            self.wall_list.add(wall)

        for x in range(100, 800, 100):
            for y in range(20, 451, 360):
                wall = Wall(x, y, 20, 200, RED2)
                self.wall_list.add(wall)

    #def changespeed(self, y):
    #    """ Change the speed of the player. Called with a keypress. """
    #    self.change_y += y
    #    Room6.changespeed(0, 5)
    #    Room6.changespeed(0, -5)
#
    #def move(self, walls):
    #    """ Find a new position for the player """
 #
    #    # Move up/down
    #    self.rect.y += self.change_y
 #
    #    # Check and see if we hit anything
    #    block_hit_list = pygame.sprite.spritecollide(self, walls, False)
    #    for block in block_hit_list:
 #
    #        # Reset our position based on the top/bottom of the object.
    #        if self.change_y > 0:
    #            self.rect.bottom = block.rect.top
    #        else:
    #            self.rect.top = block.rect.bottom


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


class Room7(Room):
    """This creates all the walls in room 2"""
    def __init__(self):
        super().__init__()
 
        walls = [[0, -100, 20, 250, WHITE]
                ]
 
        for item in walls:
            wall = Wall(item[0], item[1], item[2], item[3], item[4])
            self.wall_list.add(wall)

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

    room = Room6()
    rooms.append(room)

    room = Leaderboard()
    rooms.append(room)

    room = Room7()
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

    while not done:
 
        # --- Event Processing ---
 
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                done = True
 
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
            if current_room_no == 0:
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
                player.rect.x = 0
            elif current_room_no == 5:
                current_room_no = 6
                current_room = rooms[current_room_no]
                player.rect.x = 0
            elif current_room_no == 6:
                current_room_no = 7
                current_room = rooms[current_room_no]
                player.rect.x = 0
            else:
                current_room_no = 0
                current_room = rooms[current_room_no]
                player.rect.x = 0
        if current_room_no == 6:
                    game_state = "game_over"


 
        # --- Drawing ---
        screen.fill(BLACK)
        movingsprites.draw(screen)
        current_room.wall_list.draw(screen)

          # Draw the countdown timer
        if current_room_no == 6:
            elapsed_time = elapsed_time
            #         >>------------- TCP settings ------------------<<
            # Set up the TCP client socket
            client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            #the server name and port client wishes to access
            print("We're in tcp client...")
            server_name = '13.41.110.172'
            server_port = 12000
            
            client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            client_socket.connect((server_name, server_port))

            if i == 0:
             name = input("Enter your name: ")
             client_socket.send(("serverName"+"/"+str(f"{remaining_time:02}")+"/"+name).encode())
             i =+ 1
            else:
             print("hi")
             leaderboard_str= client_socket.recv(1024).decode()
 
             print(leaderboard_str)
            
             client_socket.close()


            leaderboard_text = leaderboard_font.render("Leaderboard", True, (147, 112, 219))
            screen.blit(leaderboard_text, [220, 50])
            score_text = font.render("Your Time : " + str(f"{remaining_time:02}"), True, (147, 112, 219))
            screen.blit(score_text, [50, 130])
            score_text = font.render("Top Scores : ", True, (147, 112, 219))
            screen.blit(score_text, [50, 200])
         #   score_text = font.render( leaderboard_str , True, (147, 112, 219))
          #  screen.blit(score_text, [200, 200])
        #    if len(msg.decode()) == 0:
        #      score_text = font.render("1 : " + msg.decode()[2]+ msg.decode()[3], True, (147, 112, 219))
        #      screen.blit(score_text, [200, 240])
        #    elif len(msg.decode()) == 1:
        #     score_text = font.render("2 : " + msg.decode()[8]+ msg.decode()[9], True, (147, 112, 219))
        #     screen.blit(score_text, [200, 280])
        #    elif len(msg.decode()) == 2:
        #     score_text = font.render("3 : " + msg.decode()[14]+ msg.decode()[15], True, (147, 112, 219))
        #     screen.blit(score_text, [200, 320])
        #    elif len(msg.decode()) == 3:
        #     score_text = font.render("4 : " + msg.decode()[20]+ msg.decode()[21], True, (147, 112, 219))
        #     screen.blit(score_text, [200, 360])
        #    else :
        #     score_text = font.render("5 : " + msg.decode()[26]+ msg.decode()[27], True, (147, 112, 219))

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
                    pygame.quit()
 
        pygame.display.flip()


        clock.tick(70)
   
 
 
    pygame.quit()
 
if __name__ == "__main__":
    main()

