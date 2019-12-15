Mine = Object:extend()

function Mine:new(x, y)
  self.x = x or 0
  self.y = y or 0
end

function Mine:getPositionHash()
  return '_' .. self.x .. ':' .. self.y
end

return Mine