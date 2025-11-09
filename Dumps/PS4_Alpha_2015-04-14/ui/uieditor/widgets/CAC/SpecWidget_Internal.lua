CoD.SpecWidget_Internal = InheritFrom( LUI.UIElement )
CoD.SpecWidget_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SpecWidget_Internal )
	self.id = "SpecWidget_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 70 )
	self:setTopBottom( true, false, 0, 35 )
	
	local bgImage = LUI.UIImage.new()
	bgImage:setLeftRight( true, true, 0, 0 )
	bgImage:setTopBottom( true, true, 0, 0 )
	bgImage:setRGB( 0.87, 0.88, 0.88 )
	bgImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( bgImage )
	self.bgImage = bgImage
	
	local iconImage = LUI.UIImage.new()
	iconImage:setLeftRight( true, false, 4, 34 )
	iconImage:setTopBottom( true, false, 2.5, 32.5 )
	iconImage:setRGB( 1, 1, 1 )
	iconImage:setImage( RegisterImage( "uie_t7_menu_mod_spec_token" ) )
	iconImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( iconImage )
	self.iconImage = iconImage
	
	local valueText = LUI.UITightText.new()
	valueText:setLeftRight( false, true, -17, -3 )
	valueText:setTopBottom( true, false, 2.5, 32.5 )
	valueText:setRGB( 0.24, 0.24, 0.24 )
	valueText:setText( Engine.Localize( "5" ) )
	valueText:setTTF( "fonts/default.ttf" )
	self:addElement( valueText )
	self.valueText = valueText
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

