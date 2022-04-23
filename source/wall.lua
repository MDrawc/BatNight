local pd <const> = playdate
local gfx <const> = pd.graphics

class('Wall').extends(gfx.sprite)

function Wall:init()
	self:moveTo(320, 200)
	local projectileImage = gfx.image.new("images/wall")
	self:setImage(projectileImage)
	self:setCollideRect(0, 0, self:getSize())
end
function Arrow:collisionResponse(other)
	return arrowCollisionResponse
end