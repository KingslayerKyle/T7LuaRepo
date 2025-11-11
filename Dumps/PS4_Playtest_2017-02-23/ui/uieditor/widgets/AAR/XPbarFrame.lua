CoD.XPbarFrame = InheritFrom( LUI.UIElement )
CoD.XPbarFrame.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.XPbarFrame )
	self.id = "XPbarFrame"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1449 )
	self:setTopBottom( 0, 0, 0, 37 )
	
	local LoadingLine20 = LUI.UIImage.new()
	LoadingLine20:setLeftRight( 0, 1, 0, 0 )
	LoadingLine20:setTopBottom( 1, 1, -8, 4 )
	LoadingLine20:setRGB( 0.9, 0.9, 0.9 )
	LoadingLine20:setAlpha( 0.9 )
	LoadingLine20:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	LoadingLine20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LoadingLine20 )
	self.LoadingLine20 = LoadingLine20
	
	local LoadingLine2 = LUI.UIImage.new()
	LoadingLine2:setLeftRight( 0, 1, 4, 0 )
	LoadingLine2:setTopBottom( 0, 0, -4, 8 )
	LoadingLine2:setRGB( 0.9, 0.9, 0.9 )
	LoadingLine2:setAlpha( 0.9 )
	LoadingLine2:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	LoadingLine2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LoadingLine2 )
	self.LoadingLine2 = LoadingLine2
	
	local Pixel2 = LUI.UIImage.new()
	Pixel2:setLeftRight( 0, 0, -7, 11 )
	Pixel2:setTopBottom( 0, 0, -8, 12 )
	Pixel2:setAlpha( 0.8 )
	Pixel2:setScale( 0.4 )
	Pixel2:setImage( RegisterImage( "uie_t7_menu_frontend_pixel" ) )
	Pixel2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2 )
	self.Pixel2 = Pixel2
	
	local Pixel20 = LUI.UIImage.new()
	Pixel20:setLeftRight( 0, 0, -7, 11 )
	Pixel20:setTopBottom( 1, 1, -12, 8 )
	Pixel20:setAlpha( 0.8 )
	Pixel20:setScale( 0.4 )
	Pixel20:setImage( RegisterImage( "uie_t7_menu_frontend_pixel" ) )
	Pixel20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20 )
	self.Pixel20 = Pixel20
	
	local Pixel21 = LUI.UIImage.new()
	Pixel21:setLeftRight( 1, 1, -11, 7 )
	Pixel21:setTopBottom( 0, 0, -8, 12 )
	Pixel21:setAlpha( 0.8 )
	Pixel21:setScale( 0.4 )
	Pixel21:setImage( RegisterImage( "uie_t7_menu_frontend_pixel" ) )
	Pixel21:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel21 )
	self.Pixel21 = Pixel21
	
	local Pixel200 = LUI.UIImage.new()
	Pixel200:setLeftRight( 1, 1, -11, 7 )
	Pixel200:setTopBottom( 1, 1, -12, 8 )
	Pixel200:setAlpha( 0.8 )
	Pixel200:setScale( 0.4 )
	Pixel200:setImage( RegisterImage( "uie_t7_menu_frontend_pixel" ) )
	Pixel200:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel200 )
	self.Pixel200 = Pixel200
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

