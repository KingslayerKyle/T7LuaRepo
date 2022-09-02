-- 179a62172dac12945674a5b1ff484d44
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_agr_ReticleHairlineBottom = InheritFrom( LUI.UIElement )
CoD.vhud_agr_ReticleHairlineBottom.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( true )
	self:setClass( CoD.vhud_agr_ReticleHairlineBottom )
	self.id = "vhud_agr_ReticleHairlineBottom"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 16 )
	self:setTopBottom( true, false, 0, 40 )
	
	local agrReticleHairlineBottom0 = LUI.UIImage.new()
	agrReticleHairlineBottom0:setLeftRight( true, true, 0, 0 )
	agrReticleHairlineBottom0:setTopBottom( true, true, 0, 0 )
	agrReticleHairlineBottom0:setAlpha( 0.15 )
	agrReticleHairlineBottom0:setZRot( -180 )
	agrReticleHairlineBottom0:setZoom( -50 )
	agrReticleHairlineBottom0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_reticlehairlinetop" ) )
	agrReticleHairlineBottom0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrReticleHairlineBottom0 )
	self.agrReticleHairlineBottom0 = agrReticleHairlineBottom0
	
	local agrReticleHairlineBottom = LUI.UIImage.new()
	agrReticleHairlineBottom:setLeftRight( true, true, 0, 0 )
	agrReticleHairlineBottom:setTopBottom( true, true, 0, 0 )
	agrReticleHairlineBottom:setAlpha( 0.8 )
	agrReticleHairlineBottom:setZRot( -180 )
	agrReticleHairlineBottom:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_reticlehairlinetop" ) )
	agrReticleHairlineBottom:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrReticleHairlineBottom )
	self.agrReticleHairlineBottom = agrReticleHairlineBottom
	
	local agrReticleHairlineBottomBlur = LUI.UIImage.new()
	agrReticleHairlineBottomBlur:setLeftRight( true, true, -4, 4 )
	agrReticleHairlineBottomBlur:setTopBottom( false, true, 0, 60 )
	agrReticleHairlineBottomBlur:setAlpha( 0.15 )
	agrReticleHairlineBottomBlur:setZRot( -180 )
	agrReticleHairlineBottomBlur:setZoom( 100 )
	agrReticleHairlineBottomBlur:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_reticlehairlinetopblur" ) )
	agrReticleHairlineBottomBlur:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrReticleHairlineBottomBlur )
	self.agrReticleHairlineBottomBlur = agrReticleHairlineBottomBlur
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

