spriteHeight = 64
spriteWidth = 64
howManyLines = 8
howManyColumns = 8
windowTitle = "Minefield"

function love.load()
  -- Defines window title
  love.window.setTitle(windowTitle)
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