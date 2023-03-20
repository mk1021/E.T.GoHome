import pygame

# Initialize Pygame
pygame.init()

# Set screen dimensions
screen_width = 400
screen_height = 600

# Set font size
font_size = 30

# Set colors
white = (255, 255, 255)
black = (0, 0, 0)

# Set font
font = pygame.font.SysFont(None, font_size)

# Create screen
screen = pygame.display.set_mode((screen_width, screen_height))
pygame.display.set_caption("Leaderboard")

# Define function to display leaderboard
def display_leaderboard(scores):
    # Clear screen
    screen.fill(white)

    # Display title
    title = font.render("Leaderboard", True, black)
    title_rect = title.get_rect(center=(screen_width/2, font_size))
    screen.blit(title, title_rect)

    # Display scores
    y = 2 * font_size
    for score in scores:
        score_text = font.render(score, True, black)
        score_rect = score_text.get_rect(center=(screen_width/2, y))
        screen.blit(score_text, score_rect)
        y += font_size

    # Update screen
    pygame.display.update()

# Test leaderboard display
scores = ["Score 1: 100", "Score 2: 50", "Score 3: 25"]
display_leaderboard(scores)

# Main game loop
running = True
while running:
    # Handle events
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    # Update screen
    pygame.display.update()

# Quit Pygame
pygame.quit()