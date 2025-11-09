CoD.vhud_agr_ReticleOutsideDotsLR = InheritFrom( LUI.UIElement )
CoD.vhud_agr_ReticleOutsideDotsLR.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.vhud_agr_ReticleOutsideDotsLR )
	self.id = "vhud_agr_ReticleOutsideDotsLR"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 32 )
	
	local agrReticleOutsideDotsLR0 = LUI.UIImage.new()
	agrReticleOutsideDotsLR0:setLeftRight( true, true, 0, 0 )
	agrReticleOutsideDotsLR0:setTopBottom( true, true, 0, 0 )
	agrReticleOutsideDotsLR0:setAlpha( 0.15 )
	agrReticleOutsideDotsLR0:setXRot( -180 )
	agrReticleOutsideDotsLR0:setZoom( -50 )
	agrReticleOutsideDotsLR0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_reticleoutsidedots" ) )
	agrReticleOutsideDotsLR0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrReticleOutsideDotsLR0 )
	self.agrReticleOutsideDotsLR0 = agrReticleOutsideDotsLR0
	
	local agrReticleOutsideDotsLR = LUI.UIImage.new()
	agrReticleOutsideDotsLR:setLeftRight( true, true, 0, 0 )
	agrReticleOutsideDotsLR:setTopBottom( true, true, 0, -0.2 )
	agrReticleOutsideDotsLR:setAlpha( 0.7 )
	agrReticleOutsideDotsLR:setXRot( -180 )
	agrReticleOutsideDotsLR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_reticleoutsidedots" ) )
	agrReticleOutsideDotsLR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrReticleOutsideDotsLR )
	self.agrReticleOutsideDotsLR = agrReticleOutsideDotsLR
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

