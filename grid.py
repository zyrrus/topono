import cv2
import numpy as np
from PIL import Image, ImageDraw

img_name = './assets/grid_bg.png'
colors = {
    'fg': (200, 237, 237, 237),
    'bg': (255, 0, 0, 0),
}
circle_size = 1
circle_spacing = 30
width, height = circle_spacing * 10, circle_spacing * 10


img = Image.new('RGBA', (width, height), color=colors['bg'])

draw = ImageDraw.Draw(img)

for x in range(circle_spacing, width + circle_spacing + 1, circle_spacing):
    for y in range(circle_spacing, height + circle_spacing + 1, circle_spacing):
        xp = x - circle_size - (circle_spacing//2)
        yp = y - circle_size - (circle_spacing//2)
        draw.ellipse((xp, yp, xp + circle_size, yp + circle_size), fill=colors['fg'])
        
img.show()
img.save(img_name, format='PNG')