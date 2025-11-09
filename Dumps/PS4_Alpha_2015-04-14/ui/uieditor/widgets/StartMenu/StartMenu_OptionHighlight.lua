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
	self:setLeftRight( true, false, 0, 146 )
	self:setTopBottom( true, false, 0, 40 )
	
	local StartMenuWhiteGlow = CoD.StartMenu_WhiteGlow.new( menu, controller )
	StartMenuWhiteGlow:setLeftRight( true, true, -3, 4 )
	StartMenuWhiteGlow:setTopBottom( true, true, 0, 0 )
	StartMenuWhiteGlow:setRGB( 1, 1, 1 )
	self:addElement( StartMenuWhiteGlow )
	self.StartMenuWhiteGlow = StartMenuWhiteGlow
	
	local DescTitle = LUI.UITightText.new()
	DescTitle:setLeftRight( true, false, 8, 148 )
	DescTitle:setTopBottom( true, false, 9.5, 34.5 )
	DescTitle:setRGB( 0, 0, 0 )
	DescTitle:setText( Engine.Localize( "Look Inversion" ) )
	DescTitle:setTTF( "fonts/Entovo.ttf" )
	LUI.OverrideFunction_CallOriginalFirst( DescTitle, "setText", function ( element, text )
		ScaleWidgetToLabel( self, element, 2 )
	end )
	self:addElement( DescTitle )
	self.DescTitle = DescTitle
	
	self.close = function ( self )
		self.StartMenuWhiteGlow:close()
		CoD.StartMenu_OptionHighlight.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

