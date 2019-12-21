Mine = Object:extend()

function Mine:new(x, y)
  self.x = x or 0
  self.y = y or 0
end

return Mine