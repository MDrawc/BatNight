local pd <const> = playdate
local gfx <const> = pd.graphics

class('Wall').extends(gfx.sprite)

function Wall:init()
	self:moveTo(380, 200)
	local projectileImage = gfx.image.new("images/wall")
	self:setImage(projectileImage)
end
