local pd <const> = playdate
local gfx <const> = pd.graphics

class('Player').extends(gfx.sprite)

function Player:init(x, y)
	local playerImage = gfx.image.new("images/player")
	self:setImage(playerImage)
	self:moveTo(x, y)
	self.moveSpeed = 1
end