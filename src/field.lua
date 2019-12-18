Field = Object:extend()

-- List of mines on the field
Field.mines = {}

function Field.generatePositionHash(x, y)
  return '_' .. x .. ':' .. y
end

-- Generates the mines on random positions
function Field.generateMines()
  local yposition, xposition = 0, 0
  for mineIndex = 1, howManyMines do
    local isGenerated = false
    while not isGenerated do
      -- Generate a random position
      local xposition = love.math.random(1, howManyColumns)
      local yposition = love.math.random(1, howManyLines)
      -- Mount the mine
      local mine = Mine(xposition, yposition)
      local positionHash = mine:getPositionHash()
      -- Based on the hash determines if that position is occupied
      if not Field.mines[positionHash] then
        -- If not occupied add to the list
        Field.mines[positionHash] = mine
        isGenerated = true
      end
    end
  end
end

return Field