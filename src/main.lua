cc.FileUtils:getInstance():addSearchPath("src")
cc.FileUtils:getInstance():addSearchPath("res")

require "config"
require "cocos.init"
	
local function main()

	collectgarbage("collect")
	-- avoid memory leak
	collectgarbage("setpause",100)
	collectgarbage("setstepmul",5000)
	
	local director = cc.Director:getInstance()
	director:getOpenGLView():setDesignResolutionSize( CC_DESIGN_RESOLUTION.width, CC_DESIGN_RESOLUTION.height, 0 )
	director:setDisplayStats(true)
	director:setAnimationInterval(1.0/60)

	local lobbyscene = require("MainScene"):create()
	if cc.Director:getInstance():getRunningScene() then
		cc.Director:getInstance():replaceScene(lobbyscene) 
	else
		cc.Director:getInstance():runWithScene(lobbyscene)
	end

end

local status, msg = xpcall(main, __G__TRACKBACK__)
if not status then
	print(msg)
end
