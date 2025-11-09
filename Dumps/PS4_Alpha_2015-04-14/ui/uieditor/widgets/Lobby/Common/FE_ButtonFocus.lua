CoD.FE_ButtonFocus = InheritFrom( LUI.UIElement )
CoD.FE_ButtonFocus.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_ButtonFocus )
	self.id = "FE_ButtonFocus"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 84 )
	self:setTopBottom( true, false, 0, 28 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, -8, 4 )
	Image0:setTopBottom( false, true, -6, 6 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusll" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, true, 4, -4 )
	Image1:setTopBottom( false, true, -6, 6 )
	Image1:setRGB( 1, 1, 1 )
	Image1:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocuslm" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( false, true, -4, 8 )
	Image2:setTopBottom( false, true, -6, 6 )
	Image2:setRGB( 1, 1, 1 )
	Image2:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocuslr" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, -8, 4 )
	Image3:setTopBottom( true, true, 6, -6 )
	Image3:setRGB( 1, 1, 1 )
	Image3:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusml" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, true, 4, -4 )
	Image4:setTopBottom( true, true, 6, -6 )
	Image4:setRGB( 1, 1, 1 )
	Image4:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusmm" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( false, true, -4, 8 )
	Image5:setTopBottom( true, true, 6, -6 )
	Image5:setRGB( 1, 1, 1 )
	Image5:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusmr" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( true, false, -8, 4 )
	Image6:setTopBottom( true, false, -6, 6 )
	Image6:setRGB( 1, 1, 1 )
	Image6:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusul" ) )
	Image6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Image7 = LUI.UIImage.new()
	Image7:setLeftRight( true, true, 4, -4 )
	Image7:setTopBottom( true, false, -6, 6 )
	Image7:setRGB( 1, 1, 1 )
	Image7:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusum" ) )
	Image7:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image7 )
	self.Image7 = Image7
	
	local Image8 = LUI.UIImage.new()
	Image8:setLeftRight( false, true, -4, 8 )
	Image8:setTopBottom( true, false, -6, 6 )
	Image8:setRGB( 1, 1, 1 )
	Image8:setImage( RegisterImage( "uie_t7_menu_frontend_buttonfocusur" ) )
	Image8:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image8 )
	self.Image8 = Image8
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

