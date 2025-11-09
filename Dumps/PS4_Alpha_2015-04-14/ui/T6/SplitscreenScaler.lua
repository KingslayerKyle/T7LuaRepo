CoD.SplitscreenScaler = InheritFrom( LUI.UIElement )
CoD.SplitscreenScaler.new = function ( defaultAnimationState, scale )
	local scaler = LUI.UIElement.new( defaultAnimationState )
	scaler:setClass( CoD.SplitscreenScaler )
	scaler.scale = 1
	if Engine.IsInGame() and 1 < Engine.SplitscreenNum() then
		scaler.scale = scale
		scaler:setScale( scale )
	end
	if Dvar.r_dualPlayEnable:get() == true then
		scaler:setScale( 1 )
	end
	scaler:registerEventHandler( "fullscreen_viewport_start", CoD.SplitscreenScaler.FullscreenViewportStart )
	scaler:registerEventHandler( "fullscreen_viewport_stop", CoD.SplitscreenScaler.FullscreenViewportStop )
	return scaler
end

CoD.SplitscreenScaler.FullscreenViewportStart = function ( self, event )
	self:setScale( 1 )
end

CoD.SplitscreenScaler.FullscreenViewportStop = function ( self, event )
	if self.scale ~= nil then
		self:setScale( self.scale )
	else
		self:setScale( 1 )
	end
	if Dvar.r_dualPlayEnable:get() == true then
		self:setScale( 1 )
	end
end

CoD.SplitscreenScaler.id = "LUIImage"
