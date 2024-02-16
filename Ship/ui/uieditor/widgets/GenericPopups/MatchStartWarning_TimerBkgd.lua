-- 5bc31607713cd469fef96e7512d3a06b
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 80 )
	self:setTopBottom( true, false, 0, 32 )
	self.anyChildUsesUpdateState = true
	
	local BackgroundPattern03 = CoD.BackgroundPattern03.new( menu, controller )
	BackgroundPattern03:setLeftRight( true, false, 0, 80 )
	BackgroundPattern03:setTopBottom( true, false, 0, 32 )
	self:addElement( BackgroundPattern03 )
	self.BackgroundPattern03 = BackgroundPattern03
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BackgroundPattern03:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
