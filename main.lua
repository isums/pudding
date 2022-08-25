lg = love.graphics

local player = require "player"

function love.load()
	background = lg.newImage('sprites/theskeldbg.png')
end

function love.update(dt)
  if love.keyboard.isDown("right") then
    player.x = player.x + player.speed * dt
  end

  if love.keyboard.isDown("left") then
    player.x = player.x - player.speed * dt
  end

  if love.keyboard.isDown("up") then
    player.y = player.y - player.speed * dt
  end

  if love.keyboard.isDown("down") then
    player.y = player.y + player.speed * dt
  end
end

function love.draw()
	lg.draw(player.sprite, player.x, player.y, player.angle, 0.1, 0.1, player.sprite:getWidth() / 2, player.sprite:getHeight() / 2)
end

return main
