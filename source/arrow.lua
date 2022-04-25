local pd <const> = playdate
local gfx <const> = pd.graphics

class('Arrow').extends(gfx.sprite)
Arrow.imageTable = gfx.imagetable.new("images/arrow_table.gif")

function Arrow:init(x, y, angle)
	self.imageIndex = 7
	self:setImage(Arrow.imageTable[self.imageIndex])
	self:setZIndex(2)
	self:moveTo(x, y)
	self:setCollideRect(0, 0, self:getSize())
	self:setGroups(1)
	self.speed = 10
	self.lifeTime = 5*1000
	self.timer = pd.timer.new(self.lifeTime, self.lifeTime)
	self.angle = angle
	self.isItFlying = false
end

function Arrow:destroy()
	if self.timer.value == 0 and self.isItFlying then
		self:remove()
	end
end

function Arrow:angleUp(dAngle)
	self.angle -= 15
	self.imageIndex -= 1
	self:setImage(Arrow.imageTable[self.imageIndex])
end

function Arrow:angleDown(dAngle)
	self.angle += 15
	self.imageIndex += 1
	self:setImage(Arrow.imageTable[self.imageIndex])
end

function Arrow:fly()
	if self.isItFlying then
		local dx = self.speed * math.cos(math.rad(self.angle))
		local dy = self.speed * math.sin(math.rad(self.angle))
		self:moveWithCollisions(self.x + dx, self.y + dy)
	end
end

function Arrow:update()
	Arrow.super.update(self)
	self:fly()
	self:destroy()
end

