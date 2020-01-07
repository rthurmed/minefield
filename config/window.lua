-- Window configuration

-- Define window title
windowTitle = "Minefield"
love.window.setTitle(windowTitle)

-- Define field size
fieldHeight = spriteHeight * howManyLines + 1
fieldWidth = spriteWidth * howManyColumns + 1

-- Define bottom bar position and size
barHeight = 20
barWidth = fieldWidth
barVerticalOffset = fieldHeight
barHorizontalOffset = 0
barTextPadding = 2

-- Define window size
windowWidth = fieldWidth
windowHeight = fieldHeight + barHeight
love.window.setMode(windowWidth, windowHeight)

-- Sets background color to green
love.graphics.setBackgroundColor(0/255, 194/255, 19/255)