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
	self:setLeftRight( 0, 0, 0, 414 )
	self:setTopBottom( 0, 0, 0, 45 )
	
	local StartMenuWhiteGlow = CoD.StartMenu_WhiteGlow.new( menu, controller )
	StartMenuWhiteGlow:setLeftRight( 0, 1, -4, 6 )
	StartMenuWhiteGlow:setTopBottom( 0, 1, 0, 0 )
	StartMenuWhiteGlow:setRGB( ColorSet.BadgeText.r, ColorSet.BadgeText.g, ColorSet.BadgeText.b )
	self:addElement( StartMenuWhiteGlow )
	self.StartMenuWhiteGlow = StartMenuWhiteGlow
	
	local DescTitle = LUI.UITightText.new()
	DescTitle:setLeftRight( 0, 0, 2, 414 )
	DescTitle:setTopBottom( 0, 0, 15, 45 )
	DescTitle:setText( Engine.Localize( "Look Inversion" ) )
	DescTitle:setTTF( "fonts/escom.ttf" )
	DescTitle:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_font_cached_glow" ) )
	DescTitle:setShaderVector( 0, 0.08, 0, 0, 0 )
	DescTitle:setShaderVector( 1, 0, 0, 0, 0 )
	DescTitle:setShaderVector( 2, 1, 0, 0, 0 )
	DescTitle:setLetterSpacing( 1 )
	LUI.OverrideFunction_CallOriginalFirst( DescTitle, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( DescTitle )
	self.DescTitle = DescTitle
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.StartMenuWhiteGlow:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

