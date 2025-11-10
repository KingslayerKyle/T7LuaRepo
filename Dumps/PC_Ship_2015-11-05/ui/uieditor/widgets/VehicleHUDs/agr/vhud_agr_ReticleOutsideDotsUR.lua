CoD.vhud_agr_ReticleOutsideDotsUR = InheritFrom( LUI.UIElement )
CoD.vhud_agr_ReticleOutsideDotsUR.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.vhud_agr_ReticleOutsideDotsUR )
	self.id = "vhud_agr_ReticleOutsideDotsUR"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 32 )
	
	local agrReticleOutsideDotsUR0 = LUI.UIImage.new()
	agrReticleOutsideDotsUR0:setLeftRight( true, true, 0, 0 )
	agrReticleOutsideDotsUR0:setTopBottom( true, true, 0, 0 )
	agrReticleOutsideDotsUR0:setAlpha( 0.15 )
	agrReticleOutsideDotsUR0:setZoom( -50 )
	agrReticleOutsideDotsUR0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_reticleoutsidedots" ) )
	agrReticleOutsideDotsUR0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrReticleOutsideDotsUR0 )
	self.agrReticleOutsideDotsUR0 = agrReticleOutsideDotsUR0
	
	local agrReticleOutsideDotsUR = LUI.UIImage.new()
	agrReticleOutsideDotsUR:setLeftRight( true, true, 0, 0 )
	agrReticleOutsideDotsUR:setTopBottom( true, true, 0, 0 )
	agrReticleOutsideDotsUR:setAlpha( 0.7 )
	agrReticleOutsideDotsUR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_reticleoutsidedots" ) )
	agrReticleOutsideDotsUR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrReticleOutsideDotsUR )
	self.agrReticleOutsideDotsUR = agrReticleOutsideDotsUR
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

