-- f21999d108bc7e9ad60bb71cbd6bd7be
-- This hash is used for caching, delete to decompile the file again

CoD.AbilityWheel_VignetteInternal = InheritFrom( LUI.UIElement )
CoD.AbilityWheel_VignetteInternal.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.AbilityWheel_VignetteInternal )
	self.id = "AbilityWheel_VignetteInternal"
	self.soundSet = "AbilityWheel"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 984 )
	Image0:setTopBottom( false, true, -360, 0 )
	Image0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_vignette2" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiplyinverse" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 0, 984 )
	Image1:setTopBottom( true, false, 0, 360 )
	Image1:setXRot( -180 )
	Image1:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_vignette2" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiplyinverse" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( false, true, -984, 0 )
	Image00:setTopBottom( false, true, -360, 0 )
	Image00:setYRot( -180 )
	Image00:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_vignette2" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiplyinverse" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( false, true, -984, 0 )
	Image10:setTopBottom( true, false, 0, 360 )
	Image10:setXRot( -180 )
	Image10:setYRot( -180 )
	Image10:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_vignette2" ) )
	Image10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiplyinverse" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

