-- f9f29e9cf22b34eb17cfdc51b5ca0b01
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CPSystems.WeakPoints.weakpoint_NewDash" )

CoD.weakpoint_NewDashContainer = InheritFrom( LUI.UIElement )
CoD.weakpoint_NewDashContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.weakpoint_NewDashContainer )
	self.id = "weakpoint_NewDashContainer"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 274 )
	self:setTopBottom( true, false, 0, 130 )
	self.anyChildUsesUpdateState = true
	
	local weakpointNewDash0 = CoD.weakpoint_NewDash.new( menu, controller )
	weakpointNewDash0:setLeftRight( true, false, 0, 24 )
	weakpointNewDash0:setTopBottom( false, true, -48, 0 )
	weakpointNewDash0:setAlpha( 0 )
	self:addElement( weakpointNewDash0 )
	self.weakpointNewDash0 = weakpointNewDash0
	
	local weakpointNewDash1 = CoD.weakpoint_NewDash.new( menu, controller )
	weakpointNewDash1:setLeftRight( false, true, -24, 0 )
	weakpointNewDash1:setTopBottom( false, true, -48, 0 )
	weakpointNewDash1:setAlpha( 0 )
	self:addElement( weakpointNewDash1 )
	self.weakpointNewDash1 = weakpointNewDash1
	
	local weakpointNewDash2 = CoD.weakpoint_NewDash.new( menu, controller )
	weakpointNewDash2:setLeftRight( true, false, 1, 25 )
	weakpointNewDash2:setTopBottom( true, false, 0, 48 )
	weakpointNewDash2:setAlpha( 0 )
	weakpointNewDash2:setZRot( 180 )
	self:addElement( weakpointNewDash2 )
	self.weakpointNewDash2 = weakpointNewDash2
	
	local weakpointNewDash3 = CoD.weakpoint_NewDash.new( menu, controller )
	weakpointNewDash3:setLeftRight( false, true, -24, 0 )
	weakpointNewDash3:setTopBottom( true, false, 0, 48 )
	weakpointNewDash3:setAlpha( 0 )
	weakpointNewDash3:setZRot( 180 )
	self:addElement( weakpointNewDash3 )
	self.weakpointNewDash3 = weakpointNewDash3
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.weakpointNewDash0:close()
		element.weakpointNewDash1:close()
		element.weakpointNewDash2:close()
		element.weakpointNewDash3:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

