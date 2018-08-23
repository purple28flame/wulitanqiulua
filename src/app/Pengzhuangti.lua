local Pengzhuangti = class("Pengzhuangti", function()
    return display.newNode()
end)

function Pengzhuangti:ctor()
    self._score = 0  -- 逻辑分
    self._preScore = 0  -- 表现分
    -- self._label  -- 文字
    -- self._drawNode  -- 图形
    -- self._posx -- 横坐标
    -- self._posy -- 纵坐标
    -- self._type -- 类型
    -- self._rotate -- 选择角度
    self._label = cc.ui.UILabel.new({
            UILabelType = 2,
            text = "",
            size = 20
        }):addTo(self,1):align(display.CENTER)
end

-- 爆炸效果  退出释放
function Pengzhuangti:baozha()
	self:removeNodeEventListener(cc.NODE_ENTER_FRAME_EVENT)
	self._label:hide()
end

-- 移动 向上
function Pengzhuangti:move()
end

-- 碰撞检测 返回是否碰撞 碰撞法线 额外逻辑
function Pengzhuangti:check()
end

-- 设置分数
function Pengzhuangti:setScore(score)
	self._score = score
end

-- 激活
function Pengzhuangti:active()
	self:addNodeEventListener(cc.NODE_ENTER_FRAME_EVENT, function(dt) self:update(dt) end)
	self:scheduleUpdate()
end

-- 刷新
function Pengzhuangti:update()
	if self._score ~= self._preScore then
		self._preScore = self._score
		self._label:setString(self._score)
	end
end

-- 设置横坐标
function Pengzhuangti:setPosX(posX)
	self._posX = posX
	self:setPositionX(posX)
end



return Pengzhuangti