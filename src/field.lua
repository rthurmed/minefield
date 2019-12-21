Field = Object:extend()

-- List of mines on the field
Field.mines = {}
-- List of tiles opened by click or by chain reaction
Field.opened = {}

-- Generates the equivalent hash to a especified position on the grid
function Field.generatePositionHash(x, y)
  return '_' .. x .. ':' .. y
end

-- Gives the quantity of mines on the 9 adjacents tiles
-- If the tile has a mine, returns a -1
function Field.getMineClosenessLevelAt(x, y)
  -- Ignore if the tile has a mine in it
  if (Field.hasMineAt(x, y)) then return -1 end
  local mineClosenessLevel = 0
  -- Scans the 9x9 square around the tile
  for relativeXPosition = -1, 1 do
    for relativeYPosition = -1, 1 do
      -- Ignore the central tile
      if not (relativeXPosition == 0 and relativeYPosition == 0) then
        -- Obtain the x and y position the be compare
        local comparisonXPosition = x + relativeXPosition
        local comparisonYPosition = y + relativeYPosition
        -- Verifies if the comparison position has a mine
        if Field.hasMineAt(comparisonXPosition, comparisonYPosition) then
          -- If it does, adds to the closeness level
          mineClosenessLevel = mineClosenessLevel + 1
        end
      end
    end
  end
  -- Returns the total sum of mines
  return mineClosenessLevel
end

-- Verifies whether a position has a mine or not
function Field.hasMineAt(x, y)
  local positionHash = Field.generatePositionHash(x, y)
  return not not Field.mines[positionHash]
end

-- Verifies whether a position is opened
function Field.isOpened(x, y)
  local positionHash = Field.generatePositionHash(x, y)
  return not not Field.opened[positionHash]
end

-- Creates a mine and adds to the list
function Field.addMineAt(x, y)
  -- Mount the mine
  local mine = Mine(x, y)
  local positionHash = mine:getPositionHash()
  -- Add to the list based on the hash
  Field.mines[positionHash] = mine
end

-- Open a tile
function Field.open(x, y)
  local positionHash = Field.getPositionHash(x, y)
  Field.opened[positionHash] = true
end

function Field.callChainReactionAt(x, y)
  -- ToDo
end

-- Generates the mines on random positions
function Field.generateMines()
  local column, line = 0, 0
  for mineIndex = 1, howManyMines do
    local isGenerated = false
    while not isGenerated do
      -- Generate a random position
      local line = love.math.random(1, howManyColumns)
      local column = love.math.random(1, howManyLines)
      -- Verifies if the generated position is already taken
      if not Field.hasMineAt(line, column) then
        -- If not occupied add to the list
        Field.addMineAt(line, column)
        isGenerated = true
      end
    end
  end
end

-- Open a tile of the field this may cause a chain reaction or a mine explosion
function Field.openTile(x, y)
  local positionHash = Field.getPositionHash(x, y)
  -- If the position has a mine it will return false
  if Field.hasMineAt(x, y) then
    return false
  end
  -- Ignore if already opened
  if Field.isOpened(x, y) then
    return true
  end
  -- Open the position
  Field.open(x, y)
  -- If the closeness is zero it will call a chain reaction
  local closeness = Field.getMineClosenessLevelAt(x, y)
  if closeness == 0 then Field.callChainReactionAt(x, y) end
  return true
end

return Field