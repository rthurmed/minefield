FieldController = Object:extend()

FieldController.showMines = false

function FieldController.init()
  field = Field(howManyColumns, howManyLines)
  field:generateMines()
end

-- Open a tile of the field this may cause a chain reaction or a mine explosion
function FieldController.openTile(x, y)
  -- Ignore if already opened or has a flag
  if field:isOpened(x, y) or field:hasFlagAt(x, y) then
    return true
  end
  -- If the position has a mine it will return false
  if field:hasMineAt(x, y) then
    return false
  end
  -- Open the position
  local closeness = field:open(x, y)
  -- If the closeness is zero it will call a chain reaction
  if closeness == 0 then field:callChainReactionAt(x, y) end
  return true
end

function FieldController.flag(x, y)
  -- Cannot put a flag on a opened tile
  if field:isOpened(x, y) then return end
  -- Set the flag
  field:flag(x, y)
end

-- Returns what tile is on a position of the screen
function FieldController.whichTile(screenX, screenY)
  local tileX, tileY = 0, 0
  tileX = math.floor(screenX / spriteWidth)
  tileY = math.floor(screenY / spriteHeight)
  return tileX, tileY
end

function FieldController.draw()
  love.graphics.setColor(1,1,1,1)
  -- Draws every column in a line, before moving to the next one
  for lineCount = 0, field.height - 1 do
    -- Gets vertical position based on what line is being drawed
    local yposition = spriteHeight * lineCount
    for columnCount = 0, field.width - 1 do
      -- Gets horizontal position
      local xposition = spriteWidth * columnCount
      if field:isOpened(columnCount, lineCount) then
        -- Draw a opened grass image
        love.graphics.draw(sprites.empty, xposition, yposition)
        local closeness = field:getMineClosenessLevelAt(columnCount, lineCount)
        -- Only draw number of close mines if is more than none
        if closeness > 0 then
          -- Centers number on the empty space in the sprite
          local numberX = xposition + (spriteWidth / 2) - 5
          local numberY = yposition + (spriteHeight / 2) + 8
          love.graphics.print(closeness, numberX, numberY)
        end
      elseif field:hasFlagAt(columnCount, lineCount) then
        -- Draw a flag
        love.graphics.draw(sprites.flag, xposition, yposition)
      elseif FieldController.showMines 
        and field:hasMineAt(columnCount, lineCount) then
          -- Draw a mine exploding
          love.graphics.draw(sprites.exploding1, xposition, yposition)  
      else
        -- Draw a grass image
        love.graphics.draw(sprites.grass, xposition, yposition)
      end
      -- Do it til the end of the line
    end
    -- Do it til every column in every line is drawed
  end
end

return FieldController