FieldController = Object:extend()

function FieldController.init()
  field = Field(howManyColumns, howManyLines)
  field:generateMines()
end

-- Open a tile of the field this may cause a chain reaction or a mine explosion
function FieldController.openTile(x, y)
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

function FieldController.draw()
  -- Draws every column in a line, before moving to the next one
  for lineCount = 0, field.height - 1 do
    -- Gets vertical position based on what line is being drawed
    local yposition = spriteHeight * lineCount
    for columnCount = 0, field.width - 1 do
      -- Gets horizontal position
      local xposition = spriteWidth * columnCount
      -- Draw a grass image
      love.graphics.draw(sprites.grass, xposition, yposition)
      -- Do it til the end of the line
    end
    -- Do it til every column in every line is drawed
  end
end

return FieldController