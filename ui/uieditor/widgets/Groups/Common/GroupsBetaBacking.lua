-- 781a31a086c10e35e6f7b55f43de040f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BorderBakedSolid" )

CoD.GroupsBetaBacking = InheritFrom( LUI.UIElement )
CoD.GroupsBetaBacking.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GroupsBetaBacking )
	self.id = "GroupsBetaBacking"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 200 )
	self:setTopBottom( true, false, 0, 22 )
	self.anyChildUsesUpdateState = true
	
	local timerBackground = LUI.UIImage.new()
	timerBackground:setLeftRight( true, true, 0, 0 )
	timerBackground:setTopBottom( true, true, 0, 0 )
	timerBackground:setRGB( 0.37, 0.1, 0 )
	self:addElement( timerBackground )
	self.timerBackground = timerBackground
	
	local BorderBakedSolid00 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid00:setLeftRight( true, true, -2, 2 )
	BorderBakedSolid00:setTopBottom( true, true, -1, 3 )
	BorderBakedSolid00:setRGB( 1, 0, 0 )
	self:addElement( BorderBakedSolid00 )
	self.BorderBakedSolid00 = BorderBakedSolid00
	
	local BorderBakedSolid000 = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid000:setLeftRight( true, true, -2, 2 )
	BorderBakedSolid000:setTopBottom( true, true, -1, 3 )
	BorderBakedSolid000:setRGB( 1, 0, 0 )
	self:addElement( BorderBakedSolid000 )
	self.BorderBakedSolid000 = BorderBakedSolid000
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BorderBakedSolid00:close()
		element.BorderBakedSolid000:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

