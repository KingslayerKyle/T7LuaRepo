-- 61ceb8784ad9601cf493ae5ed630c2a7
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_dart_CenterReticleHorizonLine = InheritFrom( LUI.UIElement )
CoD.vhud_dart_CenterReticleHorizonLine.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_dart_CenterReticleHorizonLine )
	self.id = "vhud_dart_CenterReticleHorizonLine"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 458 )
	self:setTopBottom( true, false, 0, 209 )
	
	local CenterReticle = LUI.UIImage.new()
	CenterReticle:setLeftRight( false, false, -229, 229 )
	CenterReticle:setTopBottom( false, false, -12.05, 12.05 )
	CenterReticle:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_reticlehorizonlines" ) )
	CenterReticle:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterReticle )
	self.CenterReticle = CenterReticle
	
	local CenterReticle0 = LUI.UIImage.new()
	CenterReticle0:setLeftRight( false, false, -229, 229 )
	CenterReticle0:setTopBottom( false, false, -12.05, 12.05 )
	CenterReticle0:setAlpha( 0.08 )
	CenterReticle0:setZoom( -40 )
	CenterReticle0:setImage( RegisterImage( "uie_t7_cp_hud_vehicle_dart_reticlehorizonlines" ) )
	CenterReticle0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( CenterReticle0 )
	self.CenterReticle0 = CenterReticle0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
