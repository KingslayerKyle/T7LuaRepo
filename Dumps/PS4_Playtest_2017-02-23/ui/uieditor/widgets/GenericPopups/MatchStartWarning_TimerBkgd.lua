require( "ui.uieditor.widgets.BackgroundFrames.BackgroundPattern03" )

CoD.MatchStartWarning_TimerBkgd = InheritFrom( LUI.UIElement )
CoD.MatchStartWarning_TimerBkgd.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.MatchStartWarning_TimerBkgd )
	self.id = "MatchStartWarning_TimerBkgd"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 120 )
	self:setTopBottom( 0, 0, 0, 48 )
	
	local BackgroundPattern03 = CoD.BackgroundPattern03.new( menu, controller )
	BackgroundPattern03:setLeftRight( 0, 0, 0, 120 )
	BackgroundPattern03:setTopBottom( 0, 0, 0, 48 )
	self:addElement( BackgroundPattern03 )
	self.BackgroundPattern03 = BackgroundPattern03
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.BackgroundPattern03:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

