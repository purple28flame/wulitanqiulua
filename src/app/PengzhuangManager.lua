local PengzhuangManager = class("PengzhuangManager")

-- 取table 随机一个元素
function table.random(t)
	local c = table.values(t)
	return c[math.random(1,#c)]
end

-- 从table 中随机取一个 并踢出
function table.rPop(t)
	local c = table.values(t)
	local v = c[math.random(1,#c)]
	table.removebyvalue(t,v,false)
	return v
end

function PengzhuangManager:ctor()
end

-- 映射对应的类 后续增加
local PTYPES = {"Sanjiaoxing"}  
-- ,"Fangkuai","Wubianxing"
-- 一行的最大数量
local MAXINLINE = 6

-- 刷一行碰撞体
function PengzhuangManager:getNewLine(pm)
	-- 随机数量 位置
	local ran = math.random(1,MAXINLINE)
	local typeP,pos,p,score
	-- 全部位置  横坐标
	local POSXALL = {100,200,300,400,500,600}
	local ps = {}
	for i = 1,ran do
		typeP = table.random(PTYPES)
		pos = table.rPop(POSXALL)
		score = math.random(1,200)
		p = self:getNewPengzhuangti(typeP)
		p:setScore(score)
		p:setPosX(pos)
		table.insert(self._active,p) 
		table.insert(ps,p)
	end
	return ps
end

function PengzhuangManager:resetAll()
	self._active = {}
	self._line = 0
	self._pool = {}  
end

function PengzhuangManager:getNewPengzhuangti(typeP)
	local p 
	if self._pool[typeP] == nil then 
		self._pool[typeP] = {}
	end
	if #self._pool[typeP] > 0 then
		p = table.remove(self._pool,1)
	else
		local pClassName = app.packageRoot ..".".. typeP
		local pClass = require(pClassName)
		p = pClass.new()
	end
	p:active()
	return p
end

function PengzhuangManager:releaseActive()
	for k,p in pairs(self._active) do 
		self:releaseOne(p)
	end
end

function PengzhuangManager:releaseOne(p)
	typeP = p._typeP
	p:retain()
	p:removeFromParent()
	if self._pool[typeP] == nil then 
		self._pool[typeP] = {}
	end
	table.insert(self._pool[typeP],p)
end

function PengzhuangManager:getActivePengzhuangti()
end

function PengzhuangManager:releaseAll()
	for k,v in pairs(self._pool) do 
		for _,p in pairs(v) do 
			self:releaseOne(p)
		end
	end
end
return PengzhuangManager