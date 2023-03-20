import pygame
pygame.init()

# Set up the display
screen = pygame.display.set_mode((1000, 1000))

# Define the player class
class Player(pygame.sprite.Sprite):
    def __init__(self):
        super().__init__()
        self.image = pygame.Surface((50, 50))
        self.image.fill((255, 0, 0))
        self.rect = self.image.get_rect()
        self.rect.center = (screen.get_width() // 2, screen.get_height() // 2)
        self.speed_x = 0
        self.speed_y = 0

    def update(self):
        self.rect.x += self.speed_x
        self.rect.y += self.speed_y

    def changespeed(self, speed):
        self.speed_x += speed[0]
        self.speed_y += speed[1]

# Create the player object
player = Player()
all_sprites = pygame.sprite.Group()
all_sprites.add(player)

# Define the predetermined motion array
motion_array = ['r','l','l']

# Define the character array to change the speed
speeds = {
    'l': (-2, 0),
    'r': (2, 0),
    'u': (0, -2),
    'd': (0, 2)
}

# Game loop
running = True
i = 0  # Index into the motion array
while running:
    # Event handling
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False

    # Update the game state
    if i < len(motion_array):
        if motion_array[i] in speeds:
            player.changespeed(speeds[motion_array[i]])
        i += 1
    all_sprites.update()

    # Draw the screen
    screen.fill((255, 255, 255))
    all_sprites.draw(screen)
    pygame.display.flip()

    # Slow down the speed of the player
    pygame.time.wait(20)

# Clean up the game
pygame.quit()