import pygame

# Initialize Pygame
pygame.init()

# Set screen dimensions
screen_width = 800
screen_height = 600

# Set font size
font_size = 80

# Set colors
white = (255, 255, 255)
black = (0, 0, 0)

# Set font
font = pygame.font.Font(None, 90)
font2 = pygame.font.Font(None, 40)
font3 = pygame.font.Font(None, 55)
top_scores_font = pygame.font.Font(None, 70)
leaderboard_font = pygame.font.Font('freesansbold.ttf', 56)

# Create screen
screen = pygame.display.set_mode((screen_width, screen_height))
pygame.display.set_caption("Leaderboard")

# Define function to display leaderboard
def display_leaderboard(scores):
    # Clear screen
    screen.fill(black)

    # Display title
    #leaderboard_text = leaderboard_font.render("Scores", True, (147, 112, 219))
    #screen.blit(leaderboard_text, [240, 50])
    title = font.render("Leaderboard", True, (147, 112, 219))
    #title_rect = title.get_rect(center=(screen_width/2, font_size))
    screen.blit(title, [210, 40])

    # Display scores
    #leaderboard_text = leaderboard_font.render("Leaderboard", True, (147, 112, 219))
    #screen.blit(leaderboard_text, [220, 50])
    score_text = font2.render("Player1 Time : 5", True, (147, 112, 219))
    screen.blit(score_text, [50, 120])
    score_text = font2.render("Player2 Time : 2", True, (147, 112, 219))
    screen.blit(score_text, [50, 160])
    score_text = top_scores_font.render("Top Scores", True, (147, 112, 219))
    screen.blit(score_text, [270, 220])
    score_text = font3.render("Player2 : 2", True, (147, 112, 219))
    screen.blit(score_text, [screen_width/2 - 100, 280])
    score_text = font3.render("Bob : 3", True, (147, 112, 219))
    screen.blit(score_text, [screen_width/2 - 100, 340])
    score_text = font3.render("Player1 : 5", True, (147, 112, 219))
    screen.blit(score_text, [screen_width/2 - 100, 400])
    score_text = font3.render("You : 8", True, (147, 112, 219))
    screen.blit(score_text, [screen_width/2 - 100, 460])
    score_text = font3.render("Me : 11", True, (147, 112, 219))
    screen.blit(score_text, [screen_width/2 - 100, 520])

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