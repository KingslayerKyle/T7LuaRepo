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
	self:setLeftRight( true, false, 0, 104 )
	self:setTopBottom( true, false, 0, 24 )
	
	local Image00 = LUI.UIImage.new()
	Image00:setLeftRight( false, false, -52, 52 )
	Image00:setTopBottom( false, false, -12, 12 )
	Image00:setImage( RegisterImage( "uie_t7_menu_cac_iconnewbanner" ) )
	self:addElement( Image00 )
	self.Image00 = Image00
	
	local itemName = LUI.UIText.new()
	itemName:setLeftRight( false, false, -21.82, 23 )
	itemName:setTopBottom( false, false, -8, 8 )
	itemName:setRGB( 0, 0, 0 )
	itemName:setText( Engine.Localize( LocalizeToUpperString( "MENU_NEW" ) ) )
	itemName:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	itemName:setLetterSpacing( 1.5 )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	itemName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( itemName )
	self.itemName = itemName
	
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

