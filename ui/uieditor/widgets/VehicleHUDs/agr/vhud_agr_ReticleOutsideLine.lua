-- 26a2d16207fd7af04d4b8ffff10a7609
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_agr_ReticleOutsideLine = InheritFrom( LUI.UIElement )
CoD.vhud_agr_ReticleOutsideLine.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.vhud_agr_ReticleOutsideLine )
	self.id = "vhud_agr_ReticleOutsideLine"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 72 )
	self:setTopBottom( true, false, 0, 56 )
	
	local agrReticleOutsideLineUR0 = LUI.UIImage.new()
	agrReticleOutsideLineUR0:setLeftRight( true, true, 0, 0 )
	agrReticleOutsideLineUR0:setTopBottom( true, true, 0, 0 )
	agrReticleOutsideLineUR0:setAlpha( 0.15 )
	agrReticleOutsideLineUR0:setZoom( -50 )
	agrReticleOutsideLineUR0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_reticleoutsideline" ) )
	agrReticleOutsideLineUR0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrReticleOutsideLineUR0 )
	self.agrReticleOutsideLineUR0 = agrReticleOutsideLineUR0
	
	local agrReticleOutsideLineUR = LUI.UIImage.new()
	agrReticleOutsideLineUR:setLeftRight( true, true, 0, 0 )
	agrReticleOutsideLineUR:setTopBottom( true, true, 0, 0 )
	agrReticleOutsideLineUR:setAlpha( 0.8 )
	agrReticleOutsideLineUR:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_agr_reticleoutsideline" ) )
	agrReticleOutsideLineUR:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( agrReticleOutsideLineUR )
	self.agrReticleOutsideLineUR = agrReticleOutsideLineUR
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

