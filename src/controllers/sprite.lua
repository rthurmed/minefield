SpriteController = Object:extend()

-- Load all sprites
function SpriteController.load()
  local sprites = {}
  sprites.grass = SpriteController.loadSprite("grass")
  sprites.flag = SpriteController.loadSprite("flag")
  sprites.exploding1 = SpriteController.loadSprite("exploding1")
  return sprites
end

-- Load one sprite from the assets folder
function SpriteController.loadSprite(name)
  return love.graphics.newImage("assets/" .. name .. ".png")
end

return SpriteController