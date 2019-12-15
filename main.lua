Object = require 'lib/classic/classic'
Mine = require 'src/mine'

spriteHeight, spriteWidth = 64, 64
howManyLines, howManyColumns = 8, 8
windowTitle = "Minefield"
howManyMines = 12

-- List of mines on the field
mines = {}

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

  -- Generate mines
  generateMines()
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

-- Generates the mines on random positions
function generateMines()
  local yposition, xposition = 0, 0
  for mineIndex = 1, howManyMines do
    local isGenerated = false
    while not isGenerated do
      -- Generate a random position
      xposition = love.math.random(1, howManyMines)
      yposition = love.math.random(1, howManyLines)
      -- Mount the mine
      local mine = Mine(xposition, yposition)
      local positionHash = mine:getPositionHash()
      -- Based on the hash determines if that position is occupied
      if not mines[positionHash] then
        -- If not occupied add to the list
        mines[positionHash] = mine
        isGenerated = true
      end
    end
  end
end