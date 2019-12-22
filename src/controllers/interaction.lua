InteractionController = Object:extend()

InteractionController.enabled = true

-- The click action is used to open tiles
function InteractionController.click(x, y)
  -- Ignores if interaction is disabled
  if not InteractionController.enabled then return end
  local tileX, tileY = 0, 0
  tileX = math.floor(x / spriteWidth)
  tileY = math.floor(y / spriteHeight)
  local fine = FieldController.openTile(tileX, tileY)
  if not fine then
    GameController.finish()
  end
end

return InteractionController