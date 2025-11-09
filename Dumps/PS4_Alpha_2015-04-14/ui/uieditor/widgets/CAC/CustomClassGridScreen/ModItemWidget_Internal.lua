CoD.ModItemWidget_Internal = InheritFrom( LUI.UIElement )
CoD.ModItemWidget_Internal.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ModItemWidget_Internal )
	self.id = "ModItemWidget_Internal"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 135 )
	self:setTopBottom( true, false, 0, 109 )
	
	local iconImage = LUI.UIImage.new()
	iconImage:setLeftRight( false, false, -29.5, 29.5 )
	iconImage:setTopBottom( false, false, -29.5, 29.5 )
	iconImage:setRGB( 1, 1, 1 )
	iconImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( iconImage )
	self.iconImage = iconImage
	
	local nameLabel = LUI.UITightText.new()
	nameLabel:setLeftRight( true, false, 0, 52 )
	nameLabel:setTopBottom( false, true, -25, 0 )
	nameLabel:setRGB( 0.31, 0.31, 0.31 )
	nameLabel:setText( Engine.Localize( "MPUI_REFLEX_CAPS" ) )
	nameLabel:setTTF( "fonts/default.ttf" )
	self:addElement( nameLabel )
	self.nameLabel = nameLabel
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

