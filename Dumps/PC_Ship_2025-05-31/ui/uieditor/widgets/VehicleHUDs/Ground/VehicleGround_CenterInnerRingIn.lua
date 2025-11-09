CoD.VehicleGround_CenterInnerRingIn = InheritFrom( LUI.UIElement )
CoD.VehicleGround_CenterInnerRingIn.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.VehicleGround_CenterInnerRingIn )
	self.id = "VehicleGround_CenterInnerRingIn"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 608 )
	self:setTopBottom( true, false, 0, 608 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( false, false, -304, 0 )
	Image0:setTopBottom( false, false, 0, 304 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_centerooutterringout" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( false, false, 0, 304 )
	Image2:setTopBottom( false, false, 0, 304 )
	Image2:setZRot( 90 )
	Image2:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_centerooutterringout" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( false, false, -304, 0 )
	Image3:setTopBottom( false, false, -304, 0 )
	Image3:setZRot( -90 )
	Image3:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_centerooutterringout" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( false, false, 0, 304 )
	Image4:setTopBottom( false, false, -304, 0 )
	Image4:setZRot( 180 )
	Image4:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_centerooutterringout" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	self:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return HideVehicleReticle( self, controller, event )
			end
		}
	} )
	self:linkToElementModel( self, "vehicleType", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "vehicleType"
		} )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

