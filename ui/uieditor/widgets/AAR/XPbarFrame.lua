-- c98e26aad232527bc741c7feef21838a
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 966 )
	self:setTopBottom( true, false, 0, 25 )
	
	local LoadingLine20 = LUI.UIImage.new()
	LoadingLine20:setLeftRight( true, true, 0, 0 )
	LoadingLine20:setTopBottom( false, true, -5.5, 2.5 )
	LoadingLine20:setRGB( 0.9, 0.9, 0.9 )
	LoadingLine20:setAlpha( 0.9 )
	LoadingLine20:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	LoadingLine20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LoadingLine20 )
	self.LoadingLine20 = LoadingLine20
	
	local LoadingLine2 = LUI.UIImage.new()
	LoadingLine2:setLeftRight( true, true, 2, 0 )
	LoadingLine2:setTopBottom( true, false, -2.5, 5.5 )
	LoadingLine2:setRGB( 0.9, 0.9, 0.9 )
	LoadingLine2:setAlpha( 0.9 )
	LoadingLine2:setImage( RegisterImage( "uie_t7_menu_cac_tabline" ) )
	LoadingLine2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( LoadingLine2 )
	self.LoadingLine2 = LoadingLine2
	
	local Pixel2 = LUI.UIImage.new()
	Pixel2:setLeftRight( true, false, -5, 7 )
	Pixel2:setTopBottom( true, false, -5, 8 )
	Pixel2:setAlpha( 0.8 )
	Pixel2:setScale( 0.4 )
	Pixel2:setImage( RegisterImage( "uie_t7_menu_frontend_pixel" ) )
	Pixel2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2 )
	self.Pixel2 = Pixel2
	
	local Pixel20 = LUI.UIImage.new()
	Pixel20:setLeftRight( true, false, -5, 7 )
	Pixel20:setTopBottom( false, true, -8, 5 )
	Pixel20:setAlpha( 0.8 )
	Pixel20:setScale( 0.4 )
	Pixel20:setImage( RegisterImage( "uie_t7_menu_frontend_pixel" ) )
	Pixel20:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20 )
	self.Pixel20 = Pixel20
	
	local Pixel21 = LUI.UIImage.new()
	Pixel21:setLeftRight( false, true, -7, 5 )
	Pixel21:setTopBottom( true, false, -5, 8 )
	Pixel21:setAlpha( 0.8 )
	Pixel21:setScale( 0.4 )
	Pixel21:setImage( RegisterImage( "uie_t7_menu_frontend_pixel" ) )
	Pixel21:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel21 )
	self.Pixel21 = Pixel21
	
	local Pixel200 = LUI.UIImage.new()
	Pixel200:setLeftRight( false, true, -7, 5 )
	Pixel200:setTopBottom( false, true, -8, 5 )
	Pixel200:setAlpha( 0.8 )
	Pixel200:setScale( 0.4 )
	Pixel200:setImage( RegisterImage( "uie_t7_menu_frontend_pixel" ) )
	Pixel200:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel200 )
	self.Pixel200 = Pixel200
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
