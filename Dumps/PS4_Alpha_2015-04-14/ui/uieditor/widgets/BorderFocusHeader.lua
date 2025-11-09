CoD.BorderFocusHeader = InheritFrom( LUI.UIElement )
CoD.BorderFocusHeader.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BorderFocusHeader )
	self.id = "BorderFocusHeader"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 40 )
	self:setTopBottom( true, false, 0, 5 )
	
	local Image3 = LUI.UIImage.new()
	Image3:setLeftRight( true, false, 0, 10.67 )
	Image3:setTopBottom( true, false, 0, 5.34 )
	Image3:setRGB( 1, 1, 1 )
	Image3:setImage( RegisterImage( "uie_img_t7_menu_customclass_boxtitlefocusheaderl" ) )
	Image3:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image3 )
	self.Image3 = Image3
	
	local Image4 = LUI.UIImage.new()
	Image4:setLeftRight( false, true, -10.67, 0 )
	Image4:setTopBottom( true, false, 0, 5.34 )
	Image4:setRGB( 1, 1, 1 )
	Image4:setImage( RegisterImage( "uie_img_t7_menu_customclass_boxtitlefocusheaderr" ) )
	Image4:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image4 )
	self.Image4 = Image4
	
	local Image5 = LUI.UIImage.new()
	Image5:setLeftRight( true, true, 10.67, -10.67 )
	Image5:setTopBottom( true, false, 0, 5.34 )
	Image5:setRGB( 1, 1, 1 )
	Image5:setImage( RegisterImage( "uie_img_t7_menu_customclass_boxtitlefocusheaderm" ) )
	Image5:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image5 )
	self.Image5 = Image5
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

