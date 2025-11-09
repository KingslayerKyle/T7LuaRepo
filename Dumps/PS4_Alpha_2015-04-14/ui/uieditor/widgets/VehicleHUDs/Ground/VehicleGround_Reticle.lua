CoD.VehicleGround_Reticle = InheritFrom( LUI.UIElement )
CoD.VehicleGround_Reticle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.VehicleGround_Reticle )
	self.id = "VehicleGround_Reticle"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 56 )
	self:setTopBottom( true, false, 0, 64 )
	
	local Reticle = LUI.UIImage.new()
	Reticle:setLeftRight( false, false, -28, 28 )
	Reticle:setTopBottom( false, false, -32, 32 )
	Reticle:setRGB( 0.74, 0.94, 0.99 )
	Reticle:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_reticle" ) )
	Reticle:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Reticle )
	self.Reticle = Reticle
	
	local Reticle0 = LUI.UIImage.new()
	Reticle0:setLeftRight( false, false, -28, 28 )
	Reticle0:setTopBottom( false, false, -32, 32 )
	Reticle0:setRGB( 0.74, 0.94, 0.99 )
	Reticle0:setAlpha( 0.3 )
	Reticle0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_reticlesemi" ) )
	Reticle0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Reticle0 )
	self.Reticle0 = Reticle0
	
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

