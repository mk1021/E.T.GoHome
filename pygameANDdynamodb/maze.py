import pygame
import random

# Define constants for the maze size and cell size
MAZE_WIDTH = 20
MAZE_HEIGHT = 15
CELL_SIZE = 40

# Define colors
BLACK = (0, 0, 0)
WHITE = (255, 255, 255)
GREEN = (0, 255, 0)

# Initialize Pygame
pygame.init()

# Create the game window
window = pygame.display.set_mode((MAZE_WIDTH * CELL_SIZE, MAZE_HEIGHT * CELL_SIZE))

# Title and Icon                             
pygame.display.set_caption("Jeff") 
icon = pygame.image.load('trekking.png')    
pygame.display.set_icon(icon)                

# Create the font object for the counter
font = pygame.font.SysFont(None, 30)

# Create a function to draw the maze
def draw_maze(maze):
    for row in range(len(maze)):
        for col in range(len(maze[row])):
            if maze[row][col] == 1:
                pygame.draw.rect(window, BLACK, (col * CELL_SIZE, row * CELL_SIZE, CELL_SIZE, CELL_SIZE))
            elif maze[row][col] == 0:
                pygame.draw.rect(window, WHITE, (col * CELL_SIZE, row * CELL_SIZE, CELL_SIZE, CELL_SIZE))

# Create a function to generate a new maze
def generate_maze():
    maze = [[1] * MAZE_WIDTH for _ in range(MAZE_HEIGHT)]
    for row in range(1, MAZE_HEIGHT - 1, 2):
        for col in range(1, MAZE_WIDTH - 1, 2):
            maze[row][col] = 0
    for row in range(1, MAZE_HEIGHT - 1, 2):
        for col in range(1, MAZE_WIDTH - 1, 2):
            r = row
            c = col
            while r == row or c == col:
                r = row + random.choice([-1, 1])
                c = col + random.choice([-1, 1])
            maze[r][c] = 0
    return maze

# Create a function to run the game
def main():
    level = 1
    maze = generate_maze()
    while True:
        for event in pygame.event.get():
            if event.type == pygame.QUIT:
                pygame.quit()
                return

        # Draw the maze and the counter
        window.fill(WHITE)
        draw_maze(maze)
        counter_text = font.render(f"Level: {level}", True, GREEN)
        window.blit(counter_text, (10, 10))

        # Update the screen
        pygame.display.update()

if __name__ == "__main__":
    main()

