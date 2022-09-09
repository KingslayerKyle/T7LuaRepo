-- 08cec08aec06b78640330fb11933d112
-- This hash is used for caching, delete to decompile the file again

CoD.vhud_siegebot_missile_label = InheritFrom( LUI.UIElement )
CoD.vhud_siegebot_missile_label.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.vhud_siegebot_missile_label )
	self.id = "vhud_siegebot_missile_label"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 81 )
	self:setTopBottom( true, false, 0, 30 )
	
	local text = LUI.UIText.new()
	text:setLeftRight( false, false, -100, 100 )
	text:setTopBottom( false, false, -8, 8 )
	text:setText( Engine.Localize( "MENU_HUD_VEHICLE_RPM" ) )
	text:setTTF( "fonts/default.ttf" )
	text:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_cheap_blur" ) )
	text:setShaderVector( 0, 0, 1, 0, 0 )
	text:setShaderVector( 1, 0, 0, 0, 0 )
	text:setShaderVector( 2, 0, 0, 0, 0 )
	text:setShaderVector( 3, 0, 0, 0, 0 )
	text:setShaderVector( 4, 0, 0, 0, 0 )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	text:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )

	LUI.OverrideFunction_CallOriginalFirst( text, "setText", function ( element, controller )
		ScaleWidgetToLabelCenteredWithMinimum( self, element, 20, 81 )
	end )
	self:addElement( text )
	self.text = text
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
