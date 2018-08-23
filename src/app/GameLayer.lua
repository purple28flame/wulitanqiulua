local GameLayer = class("GameLayer",function() return display.newLayer() end)


function GameLayer:ctor()
	self:init()
end

function GameLayer:init()
	self:uiInit()
end

function GameLayer:update()
end

function GameLayer:shoot()
end

function GameLayer:gameOver()
end

function GameLayer:gameStart()
	PM:resetAll()
	self:addALine()
end

function GameLayer:addALine()
	local ps = PM:getNewLine(self)
	for k,p in pairs(ps) do 
		p:addTo(self)
	end
end

function GameLayer:uiInit()
	self:gameStart()
end

return GameLayer