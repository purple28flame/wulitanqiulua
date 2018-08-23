
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)
local PengzhuangManager = import("..PengzhuangManager")

local GameLayer = import("..GameLayer")

PM = PengzhuangManager.new()

function MainScene:ctor()
    cc.ui.UILabel.new({
            UILabelType = 2, text = "Hello, World", size = 64})
        :align(display.CENTER, display.cx, display.cy)
        :addTo(self)
    self._layer = GameLayer.new()
    self._layer:addTo(self)
end

function MainScene:onEnter()
end

function MainScene:onExit()
end

return MainScene
