Field = Object:extend()

function Field:new(width, height)
  -- Set dimensions
  self.width = width
  self.height = height
  -- List of mines on the field, the index is the positionHash
  self.mines = {}
  -- List of tiles opened by click or by chain reaction
  self.opened = {}
end

-- Generates the equivalent hash to a especified position on the grid
function Field.generatePositionHash(x, y)
  return '_' .. x .. ':' .. y
end

-- Gives the quantity of mines on the 9 adjacents tiles
-- If the tile has a mine, returns a -1
function Field:getMineClosenessLevelAt(x, y)
  -- Ignore if the tile has a mine in it
  if self:hasMineAt(x, y) then return -1 end
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
        if self:hasMineAt(comparisonXPosition, comparisonYPosition) then
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
function Field:hasMineAt(x, y)
  local positionHash = Field.generatePositionHash(x, y)
  return not not self.mines[positionHash]
end

-- Verifies whether a position is opened
function Field:isOpened(x, y)
  local positionHash = Field.generatePositionHash(x, y)
  return not not self.opened[positionHash]
end

-- Creates a mine and adds to the list
function Field:addMineAt(x, y)
  -- Mount the mine
  local mine = Mine(x, y)
  local positionHash = Field.generatePositionHash(x, y)
  -- Add to the list based on the hash
  self.mines[positionHash] = mine
end

-- Open a tile
function Field:open(x, y)
  local positionHash = Field.generatePositionHash(x, y)
  local closeness = self:getMineClosenessLevelAt(x, y)
  self.opened[positionHash] = closeness
  return closeness
end

-- Calls a chain reaction that opens certain adjacent tiles
function Field:callChainReactionAt(x, y)
  -- Scans the 9x9 square around the tile
  for relativeXPosition = -1, 1 do
    for relativeYPosition = -1, 1 do
      -- Ignore the central tile
      if not (relativeXPosition == 0 and relativeYPosition == 0) then
        -- Obtain the x and y position the be opened
        local toOpenXPosition = x + relativeXPosition
        local toOpenYPosition = y + relativeYPosition
        -- Opens that position
        local closeness = self:open(toOpenXPosition, toOpenYPosition)
        -- If the tile has no mine close to, it calls the chain reaction to that position
        if closeness == 0 then
          self:callChainReactionAt(toOpenXPosition, toOpenYPosition)
        end
      end
    end
  end
end

-- Generates the mines on random positions
function Field:generateMines()
  local column, line = 0, 0
  for mineIndex = 1, howManyMines do
    local isGenerated = false
    while not isGenerated do
      -- Generate a random position
      local column = love.math.random(1, self.width)
      local line = love.math.random(1, self.height)
      -- Verifies if the generated position is already taken
      if not self:hasMineAt(column, line) then
        -- If not occupied add to the list
        self:addMineAt(column, line)
        isGenerated = true
      end
    end
  end
end

return Field