lg = love.graphics

--camera
Camera = require "hump.camera"

--player table
local player = require "gameitem.player"

--enemy tables
local mouldyPuddlingOne = require "gameitem.enemy.mouldyPuddlingOne"
local lightningPuddlingOne = require "gameitem.enemy.lightningPuddlingOne"

--weapons tables
local figgyDagger = require "gameitem.weapons.figgyDagger"
local figgyMace = require "gameitem.weapons.figgyMace"

--background
local background = lg.newImage('sprites/background.png')

--menu???
local gameStart = true

--load, update and draw
function love.load()
  camera = Camera(player.x, player.y)
	gunShot = love.audio.newSource("sounds/gunshot.mp3", "stream")
end

function love.update(dt)
  if love.keyboard.isDown("lshift") then
    player.speed = 1000
  else
    player.speed = 320
  end


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


  --mouldyPuddlingOne follow player
  if mouldyPuddlingOne.x < player.x then
    mouldyPuddlingOne.x = mouldyPuddlingOne.x + mouldyPuddlingOne.speed * dt
  end

  if mouldyPuddlingOne.x > player.x then
    mouldyPuddlingOne.x = mouldyPuddlingOne.x - mouldyPuddlingOne.speed * dt
  end

  if mouldyPuddlingOne.y < player.y then
    mouldyPuddlingOne.y = mouldyPuddlingOne.y + mouldyPuddlingOne.speed * dt
  end

  if mouldyPuddlingOne.y > player.y then
    mouldyPuddlingOne.y = mouldyPuddlingOne.y - mouldyPuddlingOne.speed * dt
  end


  --lightningPuddlingOne follow player
  if lightningPuddlingOne.x < player.x then
    lightningPuddlingOne.x = lightningPuddlingOne.x + lightningPuddlingOne.speed * dt
  end

  if lightningPuddlingOne.x > player.x then
    lightningPuddlingOne.x = lightningPuddlingOne.x - lightningPuddlingOne.speed * dt
  end

  if lightningPuddlingOne.y < player.y then
    lightningPuddlingOne.y = lightningPuddlingOne.y + lightningPuddlingOne.speed * dt
  end

  if lightningPuddlingOne.y > player.y then
    lightningPuddlingOne.y = lightningPuddlingOne.y - lightningPuddlingOne.speed * dt
  end


  if figgyDagger.x ~= player.x then figgyDagger.x = player.x end
  if figgyDagger.y ~= player.y then figgyDagger.y = player.y end

  camera:lookAt(player.x, player.y)

end

function love.draw()
  camera:attach()
  lg.draw(background)
  lg.draw(mouldyPuddlingOne.sprite, mouldyPuddlingOne.x, mouldyPuddlingOne.y, nil, 0.06, 0.06)
  lg.draw(lightningPuddlingOne.sprite, lightningPuddlingOne.x, lightningPuddlingOne.y, nil, 0.2, 0.2)
  lg.draw(player.sprite, player.x, player.y, player.angle, 2, 2, player.sprite:getWidth() / 2, player.sprite:getHeight() / 2)
  --figgy dagger draw: lg.draw(figgyDagger.sprite, figgyDagger.x, figgyDagger.y, nil, 0.08, 0.08)
  --mace draw : lg.draw(mace.sprite, mace.x, mace.y, nil, 0.07, 0.07)
  camera:detach()
end
