local Pengzhuangti = import(".Pengzhuangti")
local Yuan = class("Yuan",Pengzhuangti)

function Yuan:ctor()
	Yuan.super.ctor(self)
	self._drawNode = cc.NVGDrawNode:create()
	self._drawNode:setLineWidth(0.5)
	self._drawNode:setLineWidth(5)
	self._drawNode:setFillColor(cc.c4f(0,1,0,1))
	self._drawNode:setFill(true)
	self._drawNode:drawCircle(cc.p(0, 0), 20, cc.c4f(1,0,0,1))
	self._drawNode:addTo(self)
end

return Yuan