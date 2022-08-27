-- 8ed521951863ea70d45c9fdd94d2dd20
-- This hash is used for caching, delete to decompile the file again

CoD.SplitscreenScaler = InheritFrom( LUI.UIElement )
CoD.SplitscreenScaler.new = function ( menu, controller )
	local self = LUI.UIElement.new( menu )
	self:setClass( CoD.SplitscreenScaler )
	self.scale = 1
	if Engine.IsInGame() and 1 < Engine.SplitscreenNum() then
		self.scale = controller
		self:setScale( controller )
	end
	if Dvar.r_dualPlayEnable:get() == true then
		self:setScale( 1 )
	end
	self:registerEventHandler( "fullscreen_viewport_start", CoD.SplitscreenScaler.FullscreenViewportStart )
	self:registerEventHandler( "fullscreen_viewport_stop", CoD.SplitscreenScaler.FullscreenViewportStop )
	return self
end

CoD.SplitscreenScaler.FullscreenViewportStart = function ( f2_arg0, f2_arg1 )
	f2_arg0:setScale( 1 )
end

CoD.SplitscreenScaler.FullscreenViewportStop = function ( f3_arg0, f3_arg1 )
	if f3_arg0.scale ~= nil then
		f3_arg0:setScale( f3_arg0.scale )
	else
		f3_arg0:setScale( 1 )
	end
	if Dvar.r_dualPlayEnable:get() == true then
		f3_arg0:setScale( 1 )
	end
end

CoD.SplitscreenScaler.id = "LUIImage"
