lg = love.graphics

local player = require "player"

function love.load()
	gunShot = love.audio.newSource("sounds/gunshot.mp3", "stream")
end

function love.update(dt)
  if love.keyboard.isDown("right", "d") then
    player.x = player.x + player.speed * dt
  end

  if love.keyboard.isDown("left", "a") then
    player.x = player.x - player.speed * dt
  end

  if love.keyboard.isDown("up", "w") then
    player.y = player.y - player.speed * dt
  end

  if love.keyboard.isDown("down", "s") then
    player.y = player.y + player.speed * dt
  end

	if love.keyboard.isDown("space") then
		love.audio.play(gunShot)
	end
end

function love.draw()
	lg.draw(player.sprite, player.x, player.y, player.angle, 2, 2, player.sprite:getWidth() / 2, player.sprite:getHeight() / 2)
end
