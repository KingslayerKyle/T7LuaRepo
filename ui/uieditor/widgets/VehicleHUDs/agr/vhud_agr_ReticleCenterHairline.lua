-- 4db8b5a3f5adaff6c9883b1936c77a5c
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_agr_ReticleCenterHairline = InheritFrom( LUI.UIElement )
CoD.vhud_agr_ReticleCenterHairline.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.vhud_agr_ReticleCenterHairline )
	self.id = "vhud_agr_ReticleCenterHairline"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 17 )
	self:setTopBottom( true, false, 0, 9 )
	
	local agrReticleHairlineRight0 = LUI.UIImage.new()
	agrReticleHairlineRight0:setLeftRight( true, true, 0, 0 )
	agrReticleHairlineRight0:setTopBottom( true, true, 0, 0 )
	agrReticleHairlineRight0:setAlpha( 0.15 )
	agrReticleHairlineRight0:setZoom( -50 )
	agrReticleHairlineRight0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_reticlehairlineside" ) )
	agrReticleHairlineRight0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrReticleHairlineRight0 )
	self.agrReticleHairlineRight0 = agrReticleHairlineRight0
	
	local agrReticleHairlineRight = LUI.UIImage.new()
	agrReticleHairlineRight:setLeftRight( true, true, 0, 0 )
	agrReticleHairlineRight:setTopBottom( true, true, 0, 0 )
	agrReticleHairlineRight:setAlpha( 0.5 )
	agrReticleHairlineRight:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_reticlehairlineside" ) )
	agrReticleHairlineRight:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrReticleHairlineRight )
	self.agrReticleHairlineRight = agrReticleHairlineRight
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

