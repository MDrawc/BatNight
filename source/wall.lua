local pd <const> = playdate
local gfx <const> = pd.graphics

class('Wall').extends(gfx.sprite)

function Wall:init()
	self:moveTo(380, 200)
	self:setImage(gfx.image.new("images/wall"))
	self:setCollideRect(0, 0, self:getSize())
end
