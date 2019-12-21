Object = require 'lib/classic/classic'

-- Load classes
Mine = require 'src/mine'
Field = require 'src/field'

-- Load all controllers
SpriteController = require 'src/controllers/sprite'
FieldController = require 'src/controllers/field'
InteractionController = require 'src/controllers/interaction'

function love.load()
  -- Init game

  -- Configure game variables
  require 'config/game'
  -- Configure window
  require 'config/window'

  -- Load all sprites
  sprites = SpriteController.load()

  -- Starts the field with mines
  FieldController.init()
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
      love.graphics.draw(sprites.grass, xposition, yposition)
      -- Do it til the end of the line
    end
    -- Do it til every column in every line is drawed
  end
end