CoD.FE_FeaturedFrame = InheritFrom( LUI.UIElement )
CoD.FE_FeaturedFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_FeaturedFrame )
	self.id = "FE_FeaturedFrame"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 50 )
	self:setTopBottom( true, false, 0, 34 )
	
	local Image27 = LUI.UIImage.new()
	Image27:setLeftRight( true, false, -1, 3 )
	Image27:setTopBottom( false, true, -3, 1 )
	Image27:setRGB( 1, 1, 1 )
	Image27:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframell" ) )
	Image27:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image27 )
	self.Image27 = Image27
	
	local Image28 = LUI.UIImage.new()
	Image28:setLeftRight( true, true, 3, -3 )
	Image28:setTopBottom( false, true, -3, 1 )
	Image28:setRGB( 1, 1, 1 )
	Image28:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframelm" ) )
	Image28:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image28 )
	self.Image28 = Image28
	
	local Image29 = LUI.UIImage.new()
	Image29:setLeftRight( false, true, -3, 1 )
	Image29:setTopBottom( false, true, -3, 1 )
	Image29:setRGB( 1, 1, 1 )
	Image29:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframelr" ) )
	Image29:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image29 )
	self.Image29 = Image29
	
	local Image30 = LUI.UIImage.new()
	Image30:setLeftRight( true, false, -1, 3 )
	Image30:setTopBottom( true, true, 3, -3 )
	Image30:setRGB( 1, 1, 1 )
	Image30:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframeml" ) )
	Image30:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image30 )
	self.Image30 = Image30
	
	local Image31 = LUI.UIImage.new()
	Image31:setLeftRight( false, true, -3, 1 )
	Image31:setTopBottom( true, true, 3, -3 )
	Image31:setRGB( 1, 1, 1 )
	Image31:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframemr" ) )
	Image31:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image31 )
	self.Image31 = Image31
	
	local Image33 = LUI.UIImage.new()
	Image33:setLeftRight( true, false, -1, 3 )
	Image33:setTopBottom( true, false, -1, 3 )
	Image33:setRGB( 1, 1, 1 )
	Image33:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframeul" ) )
	Image33:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image33 )
	self.Image33 = Image33
	
	local Image34 = LUI.UIImage.new()
	Image34:setLeftRight( true, true, 3, -3 )
	Image34:setTopBottom( true, false, -1, 3 )
	Image34:setRGB( 1, 1, 1 )
	Image34:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframeum" ) )
	Image34:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image34 )
	self.Image34 = Image34
	
	local Image35 = LUI.UIImage.new()
	Image35:setLeftRight( false, true, -3, 1 )
	Image35:setTopBottom( true, false, -1, 3 )
	Image35:setRGB( 1, 1, 1 )
	Image35:setImage( RegisterImage( "uie_t7_menu_frontend_featuredframeur" ) )
	Image35:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image35 )
	self.Image35 = Image35
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

