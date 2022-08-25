--love.load
player = {}
player.x = lg.getWidth() / 2
player.y = lg.getHeight() / 2
player.angle = 0
player.rotateSpeed = 4
player.speed = 320
player.speedX = 0
player.speedY = 0
player.sprite = lg.newImage('sprites/redsprite.png')

return player
