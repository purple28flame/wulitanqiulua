local Xiaoqiu = class("Xiaoqiu", function()
    return display.newNode()
end)

function Xiaoqiu:ctor()
    self._score = 0  -- 逻辑分  半径
    self._preScore = 0  -- 表现分  半径
    self._speedX = 0 -- X速度
    self._speedY = 0 -- X速度
end

-- 碰撞 改变速度
function Xiaoqiu:pengzhuan()

end

-- 到达边缘回去
function Xiaoqiu:huitan()
end

-- 准备开战
function Xiaoqiu:zhunbei()
end

-- 刷新 位置
function Xiaoqiu:update()

end

return Xiaoqiu