local MainLayer = class("MainLayer")
MainLayer.__index = MainLayer

local UI_CSB_FILE = "res/MainLayer.csb"

function MainLayer:create()
	local studioNode = cc.CSLoader:createNode( UI_CSB_FILE )
	local view = self:extend( studioNode )
	view:ctor()
	return view
end

function MainLayer:extend( target )
	local t = tolua.getpeer( target )
	if not t then
		t = {}
		tolua.setpeer( target, t )
	end
	setmetatable( t, self )
	return target
end

function MainLayer:ctor()
	printInfo("MainLayer:ctor()")
	self:enableNodeEvents()
end

function MainLayer:onEnter()  
    printInfo("MainLayer:onEnter()")
end

function MainLayer:onExit()  
    printInfo("MainLayer:onExit()")  
end

return MainLayer