import "bow"
import "arrow"


local pd <const> = playdate
local gfx <const> = pd.graphics

class('Player').extends(gfx.sprite)

function Player:init()
	self:setImage(gfx.image.new("images/player"))
	self:moveTo(30, 120)
	self.moveSpeed = 6
	self.atTheTop = false
	self.atTheBottom = false
	self.bowAngle = 15
	local bowInstance = Bow(self.x, self.y)
	bowInstance:add()
end

function Player:checkTopAndBottom()
	if self.y < 19 then self.atTheTop = true
	else 
		self.atTheTop = false
	end
	if self.y > 220 then self.atTheBottom = true
	else 
		self.atTheBottom = false
	end
end

function Player:shoot()	
	local arrowInstance = Arrow(self.x + 40, self.y, self.bowAngle)
	arrowInstance:add()
end

function Player:update()
	Player.super.update(self)
	self:checkTopAndBottom()
	if pd.buttonIsPressed(pd.kButtonUp) and not self.atTheTop then
		self:moveBy(0, -self.moveSpeed)
	end
	if pd.buttonIsPressed(pd.kButtonDown) and not self.atTheBottom then
		self:moveBy(0, self.moveSpeed)
	end
	if pd.buttonJustPressed(pd.kButtonA) then
		self:shoot()
	end
end