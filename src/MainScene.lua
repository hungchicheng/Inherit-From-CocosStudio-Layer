
local MainScene = class( "MainScene", function() 
	return cc.Scene:create()
end)

function MainScene:create()
	local view = MainScene:new()
    return view
end

function MainScene:ctor()
	printInfo("MainScene:ctor()")
	self:enableNodeEvents()
	
end

function MainScene:onEnter()  
    printInfo("MainScene:onEnter()")

    -- add layer
    self.mainLayer = require("MainLayer"):create()
	self:addChild( self.mainLayer )

    --[[
    -- remove layer
    dump(self.mainLayer)
    self.mainLayer:removeFromParent()
    self.mainLayer = nil
    dump(self.mainLayer)

    -- add new layer
    self.mainLayer = require("MainLayer"):create()
    self:addChild( self.mainLayer )
    ]]
end

function MainScene:onExit()
    printInfo("MainScene:onExit()") 
end

return MainScene