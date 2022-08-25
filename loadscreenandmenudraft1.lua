Gamestate = require "hump.gamestate"
lg = love.graphics

local loadScreen = {}
local menu = {} -- previously: Gamestate.new()

fontOne = lg.newFont("/fonts/helium.ttf", 20)
fontTwo = lg.newFont("/fonts/helium.ttf", 10)

function loadScreen:init()
	amongUsLogo = lg.newImage("/sprites/amongus.png")
end

function loadScreen:draw()
	lg.draw(amongUsLogo, 500, 36)
	lg.setFont(fontOne)
	lg.print("Among Sus!", 600, 280)

	lg.setFont(fontOne)
	lg.print("A knockoff Among Us! game", 470, 400)
	lg.print("by jetixirGames!", 580, 430)
	lg.print("Press the SPACEBAR to continue.", 300, 500)
	lg.setFont(fontTwo)
	lg.print("Copyright jetixirGames Ltd.", 550, 600)
end

function menu:init()
	amongUsLogo = lg.newImage("/sprites/amongus.png")
end

function menu:draw()
	lg.draw(amongUsLogo, 500, 36)
end

function love.load()
	loadScreen:init()
	menu:init()
end

function love.update(dt)
end

function love.draw()
	loadScreen:draw()
end
