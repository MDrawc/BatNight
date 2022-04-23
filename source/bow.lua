local pd <const> = playdate
local gfx <const> = pd.graphics

class('Bow').extends(gfx.sprite)

function Bow:init(x, y)
	self:setImage(gfx.image.new("images/bow"))
	self:setZIndex(3)
	self:moveTo(x, y)
end
