spriteHeight = 64
spriteWidth = 64
howManyLines = 8
howManyColumns = 8
windowTitle = "Minefield"

function love.load()
  -- Window configuration
  -- Define window title
  love.window.setTitle(windowTitle)
  -- Define window size
  windowHeight = spriteHeight * howManyLines + 1
  windowWidth = spriteWidth * howManyColumns + 1
  love.window.setMode(windowWidth, windowHeight)

  -- Load sprites
  grass = love.graphics.newImage("assets/grass.png")
end

function love.update()
end

function love.draw()
  -- Draws every column in a line, before moving to the next one
  for lineCount = 0, howManyLines - 1 do
    -- Gets vertical position based on what line is being drawed
    yposition = spriteHeight * lineCount
    for columnCount = 0, howManyColumns - 1 do
      -- Gets horizontal position
      xposition = spriteWidth * columnCount
      -- Draw a grass image
      love.graphics.draw(grass, xposition, yposition)
      -- Do it til the end of the line
    end
    -- Do it til every column in every line is drawed
  end
end