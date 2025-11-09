CoD.FE_FeaturedTag = InheritFrom( LUI.UIElement )
CoD.FE_FeaturedTag.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_FeaturedTag )
	self.id = "FE_FeaturedTag"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 34 )
	self:setTopBottom( true, false, 0, 24 )
	
	local Image32 = LUI.UIImage.new()
	Image32:setLeftRight( true, false, -1, 3 )
	Image32:setTopBottom( false, true, -6, 2 )
	Image32:setRGB( 1, 1, 1 )
	Image32:setImage( RegisterImage( "uie_t7_menu_frontend_featuredtagll" ) )
	Image32:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image32 )
	self.Image32 = Image32
	
	local Image39 = LUI.UIImage.new()
	Image39:setLeftRight( true, true, 3, -3 )
	Image39:setTopBottom( false, true, -6, 2 )
	Image39:setRGB( 1, 1, 1 )
	Image39:setImage( RegisterImage( "uie_t7_menu_frontend_featuredtaglm" ) )
	Image39:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image39 )
	self.Image39 = Image39
	
	local Image40 = LUI.UIImage.new()
	Image40:setLeftRight( false, true, -3, 1 )
	Image40:setTopBottom( false, true, -6, 2 )
	Image40:setRGB( 1, 1, 1 )
	Image40:setImage( RegisterImage( "uie_t7_menu_frontend_featuredtaglr" ) )
	Image40:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image40 )
	self.Image40 = Image40
	
	local Image41 = LUI.UIImage.new()
	Image41:setLeftRight( true, false, -1, 3 )
	Image41:setTopBottom( true, true, 6, -6 )
	Image41:setRGB( 1, 1, 1 )
	Image41:setImage( RegisterImage( "uie_t7_menu_frontend_featuredtagml" ) )
	Image41:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image41 )
	self.Image41 = Image41
	
	local Image42 = LUI.UIImage.new()
	Image42:setLeftRight( false, true, -3, 1 )
	Image42:setTopBottom( true, true, 6, -6 )
	Image42:setRGB( 1, 1, 1 )
	Image42:setImage( RegisterImage( "uie_t7_menu_frontend_featuredtagmr" ) )
	Image42:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image42 )
	self.Image42 = Image42
	
	local Image43 = LUI.UIImage.new()
	Image43:setLeftRight( true, false, -1, 3 )
	Image43:setTopBottom( true, false, -2, 6 )
	Image43:setRGB( 1, 1, 1 )
	Image43:setImage( RegisterImage( "uie_t7_menu_frontend_featuredtagul" ) )
	Image43:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image43 )
	self.Image43 = Image43
	
	local Image44 = LUI.UIImage.new()
	Image44:setLeftRight( true, true, 3, -3 )
	Image44:setTopBottom( true, false, -2, 6 )
	Image44:setRGB( 1, 1, 1 )
	Image44:setImage( RegisterImage( "uie_t7_menu_frontend_featuredtagum" ) )
	Image44:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image44 )
	self.Image44 = Image44
	
	local Image45 = LUI.UIImage.new()
	Image45:setLeftRight( false, true, -3, 1 )
	Image45:setTopBottom( true, false, -2, 6 )
	Image45:setRGB( 1, 1, 1 )
	Image45:setImage( RegisterImage( "uie_t7_menu_frontend_featuredtagur" ) )
	Image45:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image45 )
	self.Image45 = Image45
	
	local Image46 = LUI.UIImage.new()
	Image46:setLeftRight( true, true, 3, -3 )
	Image46:setTopBottom( true, true, 6, -6 )
	Image46:setRGB( 1, 1, 1 )
	Image46:setImage( RegisterImage( "uie_t7_menu_frontend_featuredtagmm" ) )
	Image46:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image46 )
	self.Image46 = Image46
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

