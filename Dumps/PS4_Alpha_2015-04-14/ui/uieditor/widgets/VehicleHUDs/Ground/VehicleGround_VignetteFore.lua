CoD.VehicleGround_VignetteFore = InheritFrom( LUI.UIElement )
CoD.VehicleGround_VignetteFore.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.VehicleGround_VignetteFore )
	self.id = "VehicleGround_VignetteFore"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 400 )
	Image0:setTopBottom( false, true, -344, 0 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_vignette" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, true, -400, 0 )
	Image1:setTopBottom( false, true, -344, 0 )
	Image1:setRGB( 1, 1, 1 )
	Image1:setYRot( -180 )
	Image1:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_vignette" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, false, 0, 400 )
	Image2:setTopBottom( true, false, 0, 344 )
	Image2:setRGB( 1, 1, 1 )
	Image2:setXRot( -180 )
	Image2:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_vignette" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( false, true, -400, 0 )
	Image3:setTopBottom( true, false, 0, 344 )
	Image3:setRGB( 1, 1, 1 )
	Image3:setXRot( -180 )
	Image3:setYRot( -180 )
	Image3:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_vignette" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	self:mergeStateConditions( {
		{
			stateName = "LeavingOperationalZone",
			condition = function ( menu, element, event )
				return IsSelfModelValueTrue( element, controller, "outOfRange" )
			end
		}
	} )
	self:linkToElementModel( self, "outOfRange", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "outOfRange"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

