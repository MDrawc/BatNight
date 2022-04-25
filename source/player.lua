import "arrow"

local pd <const> = playdate
local gfx <const> = pd.graphics

class('Player').extends(gfx.sprite)

function Player:init()
	self:setImage(gfx.image.new("images/player"))
	self:moveTo(30, 120)
	self.moveSpeed = 8
	self.atTheTop = false
	self.atTheBottom = false
	self.arrow = Arrow(self.x + 10, self.y)
	self.arrow:add()
end

function Player:move()
	if self.y < 19 then self.atTheTop = true
	else 
		self.atTheTop = false
	end
	if self.y > 220 then self.atTheBottom = true
	else 
		self.atTheBottom = false
	end
	
	if pd.buttonIsPressed(pd.kButtonUp) and not self.atTheTop then
		self:moveBy(0, -self.moveSpeed)
		self.arrow:moveBy(0, -self.moveSpeed)
	end
	if pd.buttonIsPressed(pd.kButtonDown) and not self.atTheBottom then
		self:moveBy(0, self.moveSpeed)
		self.arrow:moveBy(0, self.moveSpeed)
	end
	if pd.buttonJustPressed(pd.kButtonA) then
		self:shoot()
	end
end

function Player:shoot()	
	self.arrow.isItFlying = true
	self.arrow = Arrow(self.x + 10, self.y)
	self.arrow:add()
end

function Player:changeArrowAngle()
	if pd.buttonJustPressed(pd.kButtonLeft) then
		self.arrow:angleUp()
	end
	if pd.buttonJustPressed(pd.kButtonRight) then
		self.arrow:angleDown()
	end
end

function Player:update()
	Player.super.update(self)
	self:move()
	self:changeArrowAngle()
end