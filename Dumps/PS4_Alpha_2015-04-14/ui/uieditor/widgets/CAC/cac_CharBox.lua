CoD.cac_CharBox = InheritFrom( LUI.UIElement )
CoD.cac_CharBox.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.cac_CharBox )
	self.id = "cac_CharBox"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 72 )
	self:setTopBottom( true, false, 0, 64 )
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 0, 16 )
	Image1:setTopBottom( true, false, 0, 16 )
	Image1:setImage( RegisterImage( "uie_t7_menu_cac_characterboxul" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, true, 16, -16 )
	Image2:setTopBottom( true, false, 0, 16 )
	Image2:setRGB( 1, 1, 1 )
	Image2:setImage( RegisterImage( "uie_t7_menu_cac_characterboxum" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( false, true, -16, 0 )
	Image3:setTopBottom( true, false, 0, 16 )
	Image3:setRGB( 1, 1, 1 )
	Image3:setImage( RegisterImage( "uie_t7_menu_cac_characterboxur" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( true, false, 0, 16 )
	Image4:setTopBottom( true, true, 16, -16 )
	Image4:setRGB( 1, 1, 1 )
	Image4:setImage( RegisterImage( "uie_t7_menu_cac_characterboxml" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( false, true, -16, 0 )
	Image5:setTopBottom( true, true, 16, -16 )
	Image5:setRGB( 1, 1, 1 )
	Image5:setImage( RegisterImage( "uie_t7_menu_cac_characterboxmr" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( true, false, 0, 16 )
	Image6:setTopBottom( false, true, -16, 0 )
	Image6:setRGB( 1, 1, 1 )
	Image6:setImage( RegisterImage( "uie_t7_menu_cac_characterboxll" ) )
	Image6:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Image7 = LUI.UIImage.new()
	Image7:setLeftRight( true, true, 16, -16 )
	Image7:setTopBottom( false, true, -16, 0 )
	Image7:setRGB( 1, 1, 1 )
	Image7:setImage( RegisterImage( "uie_t7_menu_cac_characterboxlm" ) )
	Image7:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image7 )
	self.Image7 = Image7
	
	local Image8 = LUI.UIImage.new()
	Image8:setLeftRight( false, true, -16, 0 )
	Image8:setTopBottom( false, true, -16, 0 )
	Image8:setRGB( 1, 1, 1 )
	Image8:setImage( RegisterImage( "uie_t7_menu_cac_characterboxlr" ) )
	Image8:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image8 )
	self.Image8 = Image8
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

