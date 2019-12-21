-- Window configuration

-- Define window title
windowTitle = "Minefield"
love.window.setTitle(windowTitle)

-- Define window size
windowHeight = spriteHeight * howManyLines + 1
windowWidth = spriteWidth * howManyColumns + 1
love.window.setMode(windowWidth, windowHeight)

-- Sets background color to green
love.graphics.setBackgroundColor(0/255, 194/255, 19/255)