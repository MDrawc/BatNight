import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "player"
import "wall"

local pd <const> = playdate
local gfx <const> = pd.graphics

local function initialize()
	local playerInstance = Player()
	local wallInstance = Wall()
	playerInstance:add()
	wallInstance:add()
end

initialize()

function pd.update()
	gfx.sprite.update()
	pd.timer.updateTimers()
end