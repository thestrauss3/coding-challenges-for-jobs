# BitMap Image Editing
#
# This will take you back to the wonderful days of KidPix, MacPaint, and MSPaint.
#
# In contrast to vector images, bitmap images are essentially 2 dimensional arrays of color values. JPEG, PNG, TIFF, and GIFF are all friendly examples of bitmap images (though the data is compressed to speed up transfer over the internet).
#
# Programs that edit bitmap images typically have a variety of tools — the pencil, the pen, the eraser, and everyone’s favorite — the spilling paint bucket. This is the tool that lets you click on a contiguous region of pixels that are all of the same color, and replace it with a new color that you’ve specified.
#
# Important note — this is not the same thing as a “find and replace” for colors! Picture an image that has a square with a black outline and white interior. Inside that, there's a circle with a black outline and white interior. Clicking inside the square but outside the circle should leave the interior of the circle white.
#
# You challenge is to implement the backend of this feature, by writing a function “fill”, together with any helper functions you think are needed, which takes a 2d array of color values, the pixel the user clicked on, and the color they want to replace it with. Don’t worry about making it object oriented or anything — you’re just writing one or more functions, in whatever language you like.
#
# This is a deceptively simple problem and can be done in less than 30 lines of code, excluding comments. Beware of edge cases, and remember, no googling!

## arr_cont is an array of arrays
## each array in arr_cont is an array of strings representing colors (hex)

# image_width = 200
# image_height = 200

# arr_cont = Array.new(image_width)
# arr_cont.each do |arr|
#     arr = Array.new(image_height)
# end

# Assuming the 2d array of colors are already created with the name image

def paint(image, x, y, new_color)
    old_color = image[x][y]
    image[x][y] = new_color
    change_adj_colors(image, x, y, old_color, new_color)
end

def change_adj_colors(image, x, y, old_color, new_color)
    # assuming two diagonal points complete an outline and therefore break a fill-space
    # this should loop and branch in all directions until it reaches a dead end
    if image[x+1][y] == old_color
        image[x+1][y] = new_color
        change_adj_colors(image, x+1, y, old_color, new_color)
    end
    if image[x-1][y] == old_color
        image[x-1][y] = new_color
        change_adj_colors(image, x-1, y, old_color, new_color)
    end
    if image[x][y+1] == old_color
        image[x][y+1] = new_color
        change_adj_colors(image, x, y+1, old_color, new_color)
    end
    if image[x][y-1] == old_color
        image[x][y-1] = new_color
        change_adj_colors(image, x, y-1, old_color, new_color)
    end
end
