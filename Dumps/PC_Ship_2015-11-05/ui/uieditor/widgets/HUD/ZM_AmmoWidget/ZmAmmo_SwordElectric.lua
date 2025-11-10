CoD.ZmAmmo_SwordElectric = InheritFrom( LUI.UIElement )
CoD.ZmAmmo_SwordElectric.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZmAmmo_SwordElectric )
	self.id = "ZmAmmo_SwordElectric"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 32 )
	
	local Sword0 = LUI.UIImage.new()
	Sword0:setLeftRight( true, false, -12, 140 )
	Sword0:setTopBottom( true, false, -12, 44 )
	Sword0:setRGB( 1, 0.15, 0 )
	Sword0:setAlpha( 0.47 )
	Sword0:setScale( 0.8 )
	Sword0:setImage( RegisterImage( "uie_t7_zm_hud_ammo_swordback" ) )
	self:addElement( Sword0 )
	self.Sword0 = Sword0
	
	local Sword = LUI.UIImage.new()
	Sword:setLeftRight( true, false, 0, 128 )
	Sword:setTopBottom( true, false, 0, 32 )
	Sword:setRGB( 1, 0.99, 0.93 )
	Sword:setScale( 0.8 )
	Sword:setImage( RegisterImage( "uie_t7_zm_hud_ammo_swordelectric" ) )
	self:addElement( Sword )
	self.Sword = Sword
	
	local ClipGlow = LUI.UIImage.new()
	ClipGlow:setLeftRight( true, false, -38.39, 171.39 )
	ClipGlow:setTopBottom( true, false, -27.25, 59.25 )
	ClipGlow:setRGB( 0.79, 0.48, 0.25 )
	ClipGlow:setAlpha( 0.42 )
	ClipGlow:setZRot( -4 )
	ClipGlow:setScale( 0.9 )
	ClipGlow:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	ClipGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( ClipGlow )
	self.ClipGlow = ClipGlow
	
	local ClipGlowTop = LUI.UIImage.new()
	ClipGlowTop:setLeftRight( true, false, -31.1, 164.1 )
	ClipGlowTop:setTopBottom( true, false, -15.5, 47.5 )
	ClipGlowTop:setRGB( 1, 0.97, 0.33 )
	ClipGlowTop:setAlpha( 0.25 )
	ClipGlowTop:setZRot( -4 )
	ClipGlowTop:setScale( 0.9 )
	ClipGlowTop:setImage( RegisterImage( "uie_t7_core_hud_mapwidget_panelglow" ) )
	self:addElement( ClipGlowTop )
	self.ClipGlowTop = ClipGlowTop
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

