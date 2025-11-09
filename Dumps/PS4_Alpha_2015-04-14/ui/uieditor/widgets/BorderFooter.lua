CoD.BorderFooter = InheritFrom( LUI.UIElement )
CoD.BorderFooter.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BorderFooter )
	self.id = "BorderFooter"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 5 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 0, 16 )
	Image0:setTopBottom( false, false, -2.5, 2.84 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setImage( RegisterImage( "uie_img_t7_menu_customclass_focusfooterl" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( false, true, -16, 0 )
	Image1:setTopBottom( false, false, -2.5, 2.84 )
	Image1:setRGB( 1, 1, 1 )
	Image1:setImage( RegisterImage( "uie_img_t7_menu_customclass_focusfooterr" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, true, 16, -16 )
	Image2:setTopBottom( false, false, -2.5, 2.84 )
	Image2:setRGB( 1, 1, 1 )
	Image2:setImage( RegisterImage( "uie_img_t7_menu_customclass_focusfooterm" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

