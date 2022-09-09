-- e5ea2808d7ab29de502c2e21b0d5f5af
-- This hash is used for caching, delete to decompile the file again

CoD.VehicleGround_ReticleZoom = InheritFrom( LUI.UIElement )
CoD.VehicleGround_ReticleZoom.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.VehicleGround_ReticleZoom )
	self.id = "VehicleGround_ReticleZoom"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	
	local ReticleZoom = LUI.UIImage.new()
	ReticleZoom:setLeftRight( false, false, -223, 225 )
	ReticleZoom:setTopBottom( false, false, -133, 259 )
	ReticleZoom:setAlpha( 0.6 )
	ReticleZoom:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_ground_reticlezoom" ) )
	ReticleZoom:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ReticleZoom )
	self.ReticleZoom = ReticleZoom
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
