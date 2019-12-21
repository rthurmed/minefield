FieldController = Object:extend()

function FieldController.init()
  field = Field(howManyColumns, howManyLines)
  field:generateMines()
end

-- Open a tile of the field this may cause a chain reaction or a mine explosion
function FieldController:openTile(x, y)
  local positionHash = field:getPositionHash(x, y)
  -- If the position has a mine it will return false
  if field:hasMineAt(x, y) then
    return false
  end
  -- Ignore if already opened
  if field:isOpened(x, y) then
    return true
  end
  -- Open the position
  local closeness = field:open(x, y)
  -- If the closeness is zero it will call a chain reaction
  if closeness == 0 then field:callChainReactionAt(x, y) end
  return true
end

return FieldController