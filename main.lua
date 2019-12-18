Object = require 'lib/classic/classic'
Mine = require 'src/mine'
Field = require 'src/field'

function love.load()
  -- GLOBAL VARIABLES
  spriteHeight, spriteWidth = 64, 64
  howManyLines, howManyColumns = 8, 8
  windowTitle = "Minefield"
  howManyMines = 12

  -- Window configuration
  -- Define window title
  love.window.setTitle(windowTitle)
  -- Define window size
  windowHeight = spriteHeight * howManyLines + 1
  windowWidth = spriteWidth * howManyColumns + 1
  love.window.setMode(windowWidth, windowHeight)

  -- Load sprites
  grass = love.graphics.newImage("assets/grass.png")

  -- Generate mines
  mines = Field.generateMines()
end

function love.update()
end

function love.draw()
  -- Draws every column in a line, before moving to the next one
  for lineCount = 0, howManyLines - 1 do
    -- Gets vertical position based on what line is being drawed
    local yposition = spriteHeight * lineCount
    for columnCount = 0, howManyColumns - 1 do
      -- Gets horizontal position
      local xposition = spriteWidth * columnCount
      -- Draw a grass image
      love.graphics.draw(grass, xposition, yposition)
      -- Do it til the end of the line
    end
    -- Do it til every column in every line is drawed
  end
end