-- 05fce12c051a8a5b08968a5440adb1c0
-- This hash is used for caching, delete to decompile the file again

CoD.VehicleGround_VignetteBack = InheritFrom( LUI.UIElement )
CoD.VehicleGround_VignetteBack.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.VehicleGround_VignetteBack )
	self.id = "VehicleGround_VignetteBack"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	
	local VignetteLL = LUI.UIImage.new()
	VignetteLL:setLeftRight( true, false, 0, 656 )
	VignetteLL:setTopBottom( false, false, 0, 380 )
	VignetteLL:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_vignette2" ) )
	VignetteLL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiplyinverse" ) )
	self:addElement( VignetteLL )
	self.VignetteLL = VignetteLL
	
	local VignetteLR = LUI.UIImage.new()
	VignetteLR:setLeftRight( false, true, -656, 0 )
	VignetteLR:setTopBottom( false, false, 0, 380 )
	VignetteLR:setYRot( -180 )
	VignetteLR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_vignette2" ) )
	VignetteLR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiplyinverse" ) )
	self:addElement( VignetteLR )
	self.VignetteLR = VignetteLR
	
	local VignetteUL = LUI.UIImage.new()
	VignetteUL:setLeftRight( true, false, 0, 656 )
	VignetteUL:setTopBottom( false, false, -380, 0 )
	VignetteUL:setXRot( -180 )
	VignetteUL:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_vignette2" ) )
	VignetteUL:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiplyinverse" ) )
	self:addElement( VignetteUL )
	self.VignetteUL = VignetteUL
	
	local VignetteUR = LUI.UIImage.new()
	VignetteUR:setLeftRight( false, true, -656, 0 )
	VignetteUR:setTopBottom( false, false, -380, 0 )
	VignetteUR:setXRot( -180 )
	VignetteUR:setYRot( -180 )
	VignetteUR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_vignette2" ) )
	VignetteUR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiplyinverse" ) )
	self:addElement( VignetteUR )
	self.VignetteUR = VignetteUR
	
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

