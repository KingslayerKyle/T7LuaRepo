CoD.CACPopupBackground = InheritFrom( LUI.UIElement )
CoD.CACPopupBackground.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CACPopupBackground )
	self.id = "CACPopupBackground"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	
	local bgImage = LUI.UIImage.new()
	bgImage:setLeftRight( true, true, 0, 0 )
	bgImage:setTopBottom( true, true, 0, 0 )
	bgImage:setRGB( 1, 1, 1 )
	bgImage:setImage( RegisterImage( "uie_t7_menu_mp_cac_backdrop" ) )
	bgImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( bgImage )
	self.bgImage = bgImage
	
	local bannerBacking = LUI.UIImage.new()
	bannerBacking:setLeftRight( true, true, 0, 0 )
	bannerBacking:setTopBottom( true, false, 193, 526 )
	bannerBacking:setRGB( 0.82, 0.83, 0.83 )
	bannerBacking:setAlpha( 0.1 )
	bannerBacking:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( bannerBacking )
	self.bannerBacking = bannerBacking
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

