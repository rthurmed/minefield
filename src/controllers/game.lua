GameController = Object:extend()

function GameController.finish()
  -- Disable user actions
  InteractionController.enabled = false
  -- Show all mines
  FieldController.showMines = true
end

return GameController