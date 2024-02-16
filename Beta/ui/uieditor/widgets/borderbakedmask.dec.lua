CoD.BorderBakedMask = InheritFrom( LUI.UIElement )
CoD.BorderBakedMask.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BorderBakedMask )
	self.id = "BorderBakedMask"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 120 )
	self:setTopBottom( true, false, 0, 120 )
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, -3, 13 )
	Image0:setTopBottom( true, false, -3, 13 )
	Image0:setImage( RegisterImage( "uie_img_t7_menu_customclass_boxmaskul" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, true, 13, -13 )
	Image1:setTopBottom( true, false, -3, 13 )
	Image1:setImage( RegisterImage( "uie_img_t7_menu_customclass_boxmaskum" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( false, true, -13, 3 )
	Image2:setTopBottom( true, false, -3, 13 )
	Image2:setImage( RegisterImage( "uie_img_t7_menu_customclass_boxmaskur" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, true, 13, -13 )
	Image3:setTopBottom( false, true, -13, 3 )
	Image3:setImage( RegisterImage( "uie_img_t7_menu_customclass_boxmasklm" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( false, true, -13, 3 )
	Image4:setTopBottom( false, true, -13, 3 )
	Image4:setImage( RegisterImage( "uie_img_t7_menu_customclass_boxmasklr" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, false, -3, 13 )
	Image5:setTopBottom( false, true, -13, 3 )
	Image5:setImage( RegisterImage( "uie_img_t7_menu_customclass_boxmaskll" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	local Image6 = LUI.UIImage.new()
	Image6:setLeftRight( true, false, -3, 13 )
	Image6:setTopBottom( true, true, 13, -13 )
	Image6:setImage( RegisterImage( "uie_img_t7_menu_customclass_boxmaskml" ) )
	self:addElement( Image6 )
	self.Image6 = Image6
	
	local Image7 = LUI.UIImage.new()
	Image7:setLeftRight( false, true, -13, 3 )
	Image7:setTopBottom( true, true, 13, -13 )
	Image7:setImage( RegisterImage( "uie_img_t7_menu_customclass_boxmaskmr" ) )
	self:addElement( Image7 )
	self.Image7 = Image7
	
	local Image8 = LUI.UIImage.new()
	Image8:setLeftRight( true, true, 13, -13 )
	Image8:setTopBottom( true, true, 13, -13 )
	Image8:setImage( RegisterImage( "uie_img_t7_menu_customclass_boxmaskmm" ) )
	self:addElement( Image8 )
	self.Image8 = Image8
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

