UIController = Object:extend()

function UIController.draw()
  UIController.bottomBar()
end

function UIController.bottomBar()
  -- Background
  love.graphics.setColor(0,0,0,1)
  love.graphics.rectangle("fill", 0, barVerticalOffset, barWidth, barHeight)
  -- Text
  love.graphics.setColor(1,1,1,1)
  local mineCounter = howManyMines .. " mines"
  love.graphics.print(mineCounter, 
    barHorizontalOffset + barTextPadding, 
    barVerticalOffset + barTextPadding)
end

return UIController