-- 7f3dc823b70dd5a6f6d69c78ecf4783a
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_WhiteGlow" )

CoD.StartMenu_OptionHighlight = InheritFrom( LUI.UIElement )
CoD.StartMenu_OptionHighlight.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.StartMenu_OptionHighlight )
	self.id = "StartMenu_OptionHighlight"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 276 )
	self:setTopBottom( true, false, 0, 30 )
	
	local StartMenuWhiteGlow = CoD.StartMenu_WhiteGlow.new( menu, controller )
	StartMenuWhiteGlow:setLeftRight( true, true, -3, 4 )
	StartMenuWhiteGlow:setTopBottom( true, true, 0, 0 )
	StartMenuWhiteGlow:setRGB( ColorSet.BadgeText.r, ColorSet.BadgeText.g, ColorSet.BadgeText.b )
	self:addElement( StartMenuWhiteGlow )
	self.StartMenuWhiteGlow = StartMenuWhiteGlow
	
	local DescTitle = LUI.UITightText.new()
	DescTitle:setLeftRight( true, false, 1, 276 )
	DescTitle:setTopBottom( true, false, 10, 30 )
	DescTitle:setText( Engine.Localize( "Look Inversion" ) )
	DescTitle:setTTF( "fonts/escom.ttf" )
	DescTitle:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	DescTitle:setShaderVector( 0, 0.08, 0, 0, 0 )
	DescTitle:setShaderVector( 1, 0, 0, 0, 0 )
	DescTitle:setShaderVector( 2, 1, 0, 0, 0 )
	DescTitle:setLetterSpacing( 1 )
	LUI.OverrideFunction_CallOriginalFirst( DescTitle, "setText", function ( element, controller )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( DescTitle )
	self.DescTitle = DescTitle
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuWhiteGlow:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

