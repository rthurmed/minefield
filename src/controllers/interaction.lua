InteractionController = Object:extend()

-- The click action is used to open tiles
function InteractionController.click(x, y)
  local tileX, tileY = 0, 0
  tileX = math.floor(x / spriteWidth)
  tileY = math.floor(y / spriteHeight)
  local fine = FieldController.openTile(tileX, tileY)
  -- Until a proper game over screen is done it closes the window when a mine 
  -- is opened
  if not fine then
    love.window.close()
  end
end

return InteractionController