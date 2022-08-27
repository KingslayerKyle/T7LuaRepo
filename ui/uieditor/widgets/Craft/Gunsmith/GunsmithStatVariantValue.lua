-- caacdaeda1144783da824b2b05a18ce4
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 100 )
	self:setTopBottom( true, false, 0, 24 )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, false, 0, 24 )
	background:setAlpha( 0.1 )
	self:addElement( background )
	self.background = background
	
	local variantValue = LUI.UIText.new()
	variantValue:setLeftRight( true, true, 0, 0 )
	variantValue:setTopBottom( true, false, 0, 24 )
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

