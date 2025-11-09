CoD.AmmoWidget_HeroAbilityRingGold = InheritFrom( LUI.UIElement )
CoD.AmmoWidget_HeroAbilityRingGold.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.AmmoWidget_HeroAbilityRingGold )
	self.id = "AmmoWidget_HeroAbilityRingGold"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 120 )
	
	local imgHeroRingGoldWpn = LUI.UIImage.new()
	imgHeroRingGoldWpn:setLeftRight( true, true, 14, -14 )
	imgHeroRingGoldWpn:setTopBottom( true, true, 14, -14 )
	imgHeroRingGoldWpn:setRGB( 0.95, 0.8, 0 )
	imgHeroRingGoldWpn:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_ringpattern" ) )
	imgHeroRingGoldWpn:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( imgHeroRingGoldWpn )
	self.imgHeroRingGoldWpn = imgHeroRingGoldWpn
	
	local imgHeroRingGoldWpn0 = LUI.UIImage.new()
	imgHeroRingGoldWpn0:setLeftRight( true, true, 14, -14 )
	imgHeroRingGoldWpn0:setTopBottom( true, true, 14, -14 )
	imgHeroRingGoldWpn0:setRGB( 0.95, 0.8, 0 )
	imgHeroRingGoldWpn0:setImage( RegisterImage( "uie_t7_core_hud_ammowidget_ringpattern" ) )
	imgHeroRingGoldWpn0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( imgHeroRingGoldWpn0 )
	self.imgHeroRingGoldWpn0 = imgHeroRingGoldWpn0
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

