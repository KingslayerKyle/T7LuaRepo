-- cff4301cb348bbe6a8944903e29f13e0
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CPSystems.WeakPoints.weakpoint_NewArrowSmall" )

CoD.weakpoint_NewArrowSmallContainer = InheritFrom( LUI.UIElement )
CoD.weakpoint_NewArrowSmallContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.weakpoint_NewArrowSmallContainer )
	self.id = "weakpoint_NewArrowSmallContainer"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 16 )
	self:setTopBottom( true, false, 0, 192 )
	
	local weakpointNewArrowSmall0 = CoD.weakpoint_NewArrowSmall.new( menu, controller )
	weakpointNewArrowSmall0:setLeftRight( false, false, -8, 8 )
	weakpointNewArrowSmall0:setTopBottom( false, true, -16, 0 )
	self:addElement( weakpointNewArrowSmall0 )
	self.weakpointNewArrowSmall0 = weakpointNewArrowSmall0
	
	local weakpointNewArrowSmall1 = CoD.weakpoint_NewArrowSmall.new( menu, controller )
	weakpointNewArrowSmall1:setLeftRight( false, false, -8, 8 )
	weakpointNewArrowSmall1:setTopBottom( true, false, 0, 16 )
	weakpointNewArrowSmall1:setZRot( -180 )
	self:addElement( weakpointNewArrowSmall1 )
	self.weakpointNewArrowSmall1 = weakpointNewArrowSmall1
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.weakpointNewArrowSmall0:close()
		element.weakpointNewArrowSmall1:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

