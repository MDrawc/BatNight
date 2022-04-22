local pd <const> = playdate
local gfx <const> = pd.graphics

class('Arrow').extends(gfx.sprite)

function Arrow:init(x, y)
	self:moveTo(x, y)
	local projectileImage = gfx.image.new("images/arrow")
	self:setImage(projectileImage)
	self.speed = 4
end

function Arrow:update()
	Arrow.super.update(self)
	self:moveBy(self.speed, 0)
end