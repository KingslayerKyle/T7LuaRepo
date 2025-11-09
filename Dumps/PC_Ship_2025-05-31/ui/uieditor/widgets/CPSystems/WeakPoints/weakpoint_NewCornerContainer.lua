require( "ui.uieditor.widgets.CPSystems.WeakPoints.weakpoint_NewCorner" )

CoD.weakpoint_NewCornerContainer = InheritFrom( LUI.UIElement )
CoD.weakpoint_NewCornerContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.weakpoint_NewCornerContainer )
	self.id = "weakpoint_NewCornerContainer"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 269 )
	self:setTopBottom( true, false, 0, 160 )
	self.anyChildUsesUpdateState = true
	
	local weakpointNewCorner0 = CoD.weakpoint_NewCorner.new( menu, controller )
	weakpointNewCorner0:setLeftRight( true, false, 0, 36 )
	weakpointNewCorner0:setTopBottom( true, false, 0, 24 )
	self:addElement( weakpointNewCorner0 )
	self.weakpointNewCorner0 = weakpointNewCorner0
	
	local weakpointNewCorner1 = CoD.weakpoint_NewCorner.new( menu, controller )
	weakpointNewCorner1:setLeftRight( false, true, -36, 0 )
	weakpointNewCorner1:setTopBottom( true, false, 0, 25 )
	weakpointNewCorner1:setZRot( -80 )
	self:addElement( weakpointNewCorner1 )
	self.weakpointNewCorner1 = weakpointNewCorner1
	
	local weakpointNewCorner2 = CoD.weakpoint_NewCorner.new( menu, controller )
	weakpointNewCorner2:setLeftRight( true, false, 0, 36 )
	weakpointNewCorner2:setTopBottom( false, true, -25, -1 )
	weakpointNewCorner2:setZRot( 103 )
	self:addElement( weakpointNewCorner2 )
	self.weakpointNewCorner2 = weakpointNewCorner2
	
	local weakpointNewCorner3 = CoD.weakpoint_NewCorner.new( menu, controller )
	weakpointNewCorner3:setLeftRight( false, true, -37, -1 )
	weakpointNewCorner3:setTopBottom( false, true, -24, 0 )
	weakpointNewCorner3:setZRot( 176 )
	self:addElement( weakpointNewCorner3 )
	self.weakpointNewCorner3 = weakpointNewCorner3
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.weakpointNewCorner0:close()
		element.weakpointNewCorner1:close()
		element.weakpointNewCorner2:close()
		element.weakpointNewCorner3:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

