local pd <const> = playdate
local gfx <const> = pd.graphics

class('Arrow').extends(gfx.sprite)

local projectileImage = gfx.image.new("images/arrow")

function Arrow:init(x, y)
	-- Arrow.super.init(self) -- is this critical? documentation says so
	self:setImage(projectileImage)
	self:moveTo(x, y)
	self.speed = 20
	self:setCollideRect(0, 0, self:getSize())
	self:setGroups(1)
end

function Arrow:update()
	Arrow.super.update(self)
	self:moveWithCollisions(self.x + self.speed, self.y)
end

