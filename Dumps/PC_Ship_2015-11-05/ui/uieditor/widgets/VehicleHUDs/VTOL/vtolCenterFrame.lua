require( "ui.uieditor.widgets.VehicleHUDs.VTOL.vtolCenterMissiles" )

CoD.vtolCenterFrame = InheritFrom( LUI.UIElement )
CoD.vtolCenterFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vtolCenterFrame )
	self.id = "vtolCenterFrame"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local missiles = CoD.vtolCenterMissiles.new( menu, controller )
	missiles:setLeftRight( true, true, 0, 0 )
	missiles:setTopBottom( true, true, 0, 0 )
	self:addElement( missiles )
	self.missiles = missiles
	
	local compass = LUI.UIImage.new()
	compass:setLeftRight( false, false, -266.67, 266.67 )
	compass:setTopBottom( false, false, -262.67, -196 )
	compass:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_vtol_compass" ) )
	self:addElement( compass )
	self.compass = compass
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.missiles:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

