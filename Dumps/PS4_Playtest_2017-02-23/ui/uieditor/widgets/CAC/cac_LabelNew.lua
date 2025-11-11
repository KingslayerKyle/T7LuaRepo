CoD.cac_LabelNew = InheritFrom( LUI.UIElement )
CoD.cac_LabelNew.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.cac_LabelNew )
	self.id = "cac_LabelNew"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 156 )
	self:setTopBottom( 0, 0, 0, 36 )
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( 0.5, 0.5, -78, 78 )
	Image00:setTopBottom( 0.5, 0.5, -18, 18 )
	Image00:setImage( RegisterImage( "uie_t7_menu_cac_iconnewbanner" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local itemName = LUI.UIText.new()
	itemName:setLeftRight( 0.5, 0.5, -33, 34 )
	itemName:setTopBottom( 0.5, 0.5, -12, 12 )
	itemName:setRGB( 0, 0, 0 )
	itemName:setText( LocalizeToUpperString( "MENU_NEW" ) )
	itemName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	itemName:setLetterSpacing( 1.5 )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( itemName )
	self.itemName = itemName
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

