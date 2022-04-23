local pd <const> = playdate
local gfx <const> = pd.graphics

class('Arrow').extends(gfx.sprite)

function Arrow:init(x, y, angle)
	self:setImage(gfx.image.new("images/arrow"))
	self:moveTo(x, y)
	self:setCollideRect(0, 0, self:getSize())
	self:setGroups(1)
	self.speed = 10
	self.lifeTime = 5*1000
	self.timer = pd.timer.new(self.lifeTime, self.lifeTime)
	self.angle = angle
end

function Arrow:destroy()
	if self.timer.value == 0 then
		self:remove()
	end
end

function Arrow:fly()
	local dx = self.speed * math.cos(math.rad(self.angle))
	local dy = self.speed * math.sin(math.rad(self.angle))
	self:moveWithCollisions(self.x + dx, self.y + dy)
end

function Arrow:update()
	Arrow.super.update(self)
	self:fly()
	self:destroy()
end

