-- 2aa19e44c576e8387e970c5a4bbd301c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.CP_DamageWidget.DamageWidget_PanelNoBlur" )

CoD.CommsWidget_CharacterText = InheritFrom( LUI.UIElement )
CoD.CommsWidget_CharacterText.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CommsWidget_CharacterText )
	self.id = "CommsWidget_CharacterText"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 105 )
	self:setTopBottom( true, false, 0, 22 )
	
	local DamageWidgetPanel2 = CoD.DamageWidget_PanelNoBlur.new( menu, controller )
	DamageWidgetPanel2:setLeftRight( true, true, 0, 0 )
	DamageWidgetPanel2:setTopBottom( true, true, 0, 0 )
	DamageWidgetPanel2:setRGB( 0, 0, 0 )
	DamageWidgetPanel2:setAlpha( 0.2 )
	self:addElement( DamageWidgetPanel2 )
	self.DamageWidgetPanel2 = DamageWidgetPanel2
	
	local CommsName = LUI.UIText.new()
	CommsName:setLeftRight( true, true, 5.22, -2.54 )
	CommsName:setTopBottom( true, false, 3, 19 )
	CommsName:setText( Engine.Localize( "Kayne, Rachel" ) )
	CommsName:setTTF( "fonts/escom.ttf" )
	CommsName:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_aberration_no_blur" ) )
	CommsName:setShaderVector( 0, 0.1, 1, 0, 0 )
	CommsName:setShaderVector( 1, 0, 0, 0, 0 )
	CommsName:setShaderVector( 2, 0, 0, 0, 0 )
	CommsName:setShaderVector( 3, 0, 0, 0, 0 )
	CommsName:setShaderVector( 4, 0, 0, 0, 0 )
	CommsName:setLetterSpacing( 0.4 )
	CommsName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	CommsName:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( CommsName )
	self.CommsName = CommsName
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.DamageWidgetPanel2:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

