CoD.SmallFrameWithBG = InheritFrom( LUI.UIElement )
CoD.SmallFrameWithBG.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SmallFrameWithBG )
	self.id = "SmallFrameWithBG"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 82 )
	self:setTopBottom( true, false, 0, 22 )
	
	local TempBackground = LUI.UIImage.new()
	TempBackground:setLeftRight( true, true, 0, 0 )
	TempBackground:setTopBottom( true, true, 22, -22 )
	TempBackground:setRGB( 0, 0, 0 )
	TempBackground:setAlpha( 0.6 )
	self:addElement( TempBackground )
	self.TempBackground = TempBackground
	
	local Image92 = LUI.UIImage.new()
	Image92:setLeftRight( true, false, -1, 3 )
	Image92:setTopBottom( false, true, -3, 1 )
	Image92:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrll" ) )
	Image92:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image92 )
	self.Image92 = Image92
	
	local Image93 = LUI.UIImage.new()
	Image93:setLeftRight( true, true, 3, -3 )
	Image93:setTopBottom( false, true, -3, 1 )
	Image93:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlm" ) )
	Image93:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image93 )
	self.Image93 = Image93
	
	local Image94 = LUI.UIImage.new()
	Image94:setLeftRight( false, true, -3, 1 )
	Image94:setTopBottom( false, true, -3, 1 )
	Image94:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrlr" ) )
	Image94:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image94 )
	self.Image94 = Image94
	
	local Image95 = LUI.UIImage.new()
	Image95:setLeftRight( true, false, -1, 3 )
	Image95:setTopBottom( true, true, 3, -3 )
	Image95:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrml" ) )
	Image95:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image95 )
	self.Image95 = Image95
	
	local Image97 = LUI.UIImage.new()
	Image97:setLeftRight( true, false, -1, 3 )
	Image97:setTopBottom( true, false, -1, 3 )
	Image97:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrul" ) )
	Image97:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image97 )
	self.Image97 = Image97
	
	local Image98 = LUI.UIImage.new()
	Image98:setLeftRight( true, true, 3, -3 )
	Image98:setTopBottom( true, false, -1, 3 )
	Image98:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrum" ) )
	Image98:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image98 )
	self.Image98 = Image98
	
	local Image99 = LUI.UIImage.new()
	Image99:setLeftRight( false, true, -3, 1 )
	Image99:setTopBottom( true, false, -1, 3 )
	Image99:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrur" ) )
	Image99:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image99 )
	self.Image99 = Image99
	
	local Image100 = LUI.UIImage.new()
	Image100:setLeftRight( false, true, -3, 1 )
	Image100:setTopBottom( true, true, 3, -3 )
	Image100:setImage( RegisterImage( "uie_t7_menu_frontend_titlenumbrdrmr" ) )
	Image100:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image100 )
	self.Image100 = Image100
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

