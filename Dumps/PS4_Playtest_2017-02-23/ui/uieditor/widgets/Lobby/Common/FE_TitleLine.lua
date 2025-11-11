CoD.FE_TitleLine = InheritFrom( LUI.UIElement )
CoD.FE_TitleLine.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_TitleLine )
	self.id = "FE_TitleLine"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 60 )
	self:setTopBottom( 0, 0, 0, 6 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( 0, 0, -11, 7 )
	Image0:setTopBottom( 0.5, 0.5, -3, 3 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinel" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( 0, 1, 8, -8 )
	Image1:setTopBottom( 0.5, 0.5, -3, 3 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinem" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( 1, 1, -7, 11 )
	Image2:setTopBottom( 0.5, 0.5, -3, 3 )
	Image2:setImage( RegisterImage( "uie_t7_menu_frontend_titleliner" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( 0, 0, -39, 3 )
	Image3:setTopBottom( 0.5, 0.5, -3, 3 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_pixelframe" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( 0, 0, -11, 7 )
	Image00:setTopBottom( 0.5, 0.5, -3, 3 )
	Image00:setAlpha( 0 )
	Image00:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinel" ) )
	Image00:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local Image10 = LUI.UIImage.new()
	Image10:setLeftRight( 0, 1, 8, -8 )
	Image10:setTopBottom( 0.5, 0.5, -3, 3 )
	Image10:setAlpha( 0 )
	Image10:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinem" ) )
	Image10:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image10 )
	self.Image10 = Image10
	
	local Image20 = LUI.UIImage.new()
	Image20:setLeftRight( 1, 1, -7, 11 )
	Image20:setTopBottom( 0.5, 0.5, -3, 3 )
	Image20:setAlpha( 0 )
	Image20:setImage( RegisterImage( "uie_t7_menu_frontend_titleliner" ) )
	Image20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image20 )
	self.Image20 = Image20
	
	local Image000 = LUI.UIImage.new()
	Image000:setLeftRight( 0, 0, -11, 7 )
	Image000:setTopBottom( 0.5, 0.5, -3, 3 )
	Image000:setAlpha( 0 )
	Image000:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinel" ) )
	Image000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image000 )
	self.Image000 = Image000
	
	local Image100 = LUI.UIImage.new()
	Image100:setLeftRight( 0, 1, 8, -8 )
	Image100:setTopBottom( 0.5, 0.5, -3, 3 )
	Image100:setAlpha( 0 )
	Image100:setImage( RegisterImage( "uie_t7_menu_frontend_titlelinem" ) )
	Image100:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image100 )
	self.Image100 = Image100
	
	local Image200 = LUI.UIImage.new()
	Image200:setLeftRight( 1, 1, -7, 11 )
	Image200:setTopBottom( 0.5, 0.5, -3, 3 )
	Image200:setAlpha( 0 )
	Image200:setImage( RegisterImage( "uie_t7_menu_frontend_titleliner" ) )
	Image200:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image200 )
	self.Image200 = Image200
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

