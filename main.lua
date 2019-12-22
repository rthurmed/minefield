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
  FieldController.draw()
end