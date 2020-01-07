Object = require 'lib/classic/classic'

-- Load classes
Mine = require 'src/mine'
Field = require 'src/field'

-- Load all controllers
SpriteController = require 'src/controllers/sprite'
FieldController = require 'src/controllers/field'
InteractionController = require 'src/controllers/interaction'
GameController = require 'src/controllers/game'
UIController = require 'src/controllers/ui'

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

function love.mousepressed(x, y, button, istouch, presses)
  if button == 1 then
    -- 1 represents left mouse button
    InteractionController.click(x, y)
  elseif button == 2 then
    -- 2 represents right mouse button
    InteractionController.rightClick(x, y)
  end
end

function love.draw()
  FieldController.draw()
  UIController.draw()
end