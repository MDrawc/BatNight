import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "player"

local pd <const> = playdate
local gfx <const> = pd.graphics

local function initialize()
	local playerInstance = Player()
	playerInstance:add()
end

initialize()

function pd.update()
	gfx.sprite.update()
	pd.timer.updateTimers()
end