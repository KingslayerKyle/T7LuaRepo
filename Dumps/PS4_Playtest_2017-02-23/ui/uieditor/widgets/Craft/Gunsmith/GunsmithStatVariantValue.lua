CoD.GunsmithStatVariantValue = InheritFrom( LUI.UIElement )
CoD.GunsmithStatVariantValue.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GunsmithStatVariantValue )
	self.id = "GunsmithStatVariantValue"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 150 )
	self:setTopBottom( 0, 0, 0, 36 )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( 0, 1, 0, 0 )
	background:setTopBottom( 0, 0, 0, 36 )
	background:setAlpha( 0.1 )
	self:addElement( background )
	self.background = background
	
	local variantValue = LUI.UIText.new()
	variantValue:setLeftRight( 0, 1, 0, 0 )
	variantValue:setTopBottom( 0, 0, 0, 36 )
	variantValue:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	variantValue:setTTF( "fonts/escom.ttf" )
	variantValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	variantValue:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( variantValue )
	self.variantValue = variantValue
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

