require( "ui.uieditor.widgets.Border" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacter_HelpBubble_Arrow" )

CoD.ChooseCharacter_HelpBubble_Container = InheritFrom( LUI.UIElement )
CoD.ChooseCharacter_HelpBubble_Container.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacter_HelpBubble_Container )
	self.id = "ChooseCharacter_HelpBubble_Container"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( 0, 0, 0, 225 )
	self:setTopBottom( 0, 0, 0, 322 )
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( 0, 1, 0, 0 )
	Background:setTopBottom( 0, 1, 0, 0 )
	Background:setRGB( 0, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Border = CoD.Border.new( menu, controller )
	Border:setLeftRight( 0, 1, 0, 0 )
	Border:setTopBottom( 0, 1, 0, 0 )
	self:addElement( Border )
	self.Border = Border
	
	local ChooseCharacterHelpBubbleArrow = CoD.ChooseCharacter_HelpBubble_Arrow.new( menu, controller )
	ChooseCharacterHelpBubbleArrow:setLeftRight( 1, 1, -95, 123 )
	ChooseCharacterHelpBubbleArrow:setTopBottom( 0, 0, 3, 95 )
	self:addElement( ChooseCharacterHelpBubbleArrow )
	self.ChooseCharacterHelpBubbleArrow = ChooseCharacterHelpBubbleArrow
	
	local FETabIdle0 = LUI.UIImage.new()
	FETabIdle0:setLeftRight( 0, 1, 223, -225 )
	FETabIdle0:setTopBottom( 0, 1, 0, 0 )
	FETabIdle0:setImage( RegisterImage( "uie_t7_menu_cac_buttontabidlefull" ) )
	FETabIdle0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FETabIdle0:setShaderVector( 0, 0, 0, 0, 0 )
	FETabIdle0:setupNineSliceShader( 12, 12 )
	self:addElement( FETabIdle0 )
	self.FETabIdle0 = FETabIdle0
	
	local Bottom = LUI.UIImage.new()
	Bottom:setLeftRight( 0, 1, 0, 0 )
	Bottom:setTopBottom( 1, 1, -6, 0 )
	Bottom:setRGB( 1, 0.41, 0 )
	self:addElement( Bottom )
	self.Bottom = Bottom
	
	local Top = LUI.UIImage.new()
	Top:setLeftRight( 0, 1, 0, 0 )
	Top:setTopBottom( 0, 0, 0, 6 )
	Top:setRGB( 1, 0.41, 0 )
	self:addElement( Top )
	self.Top = Top
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( 0, 0, 7, 206 )
	Description:setTopBottom( 0, 0, 21, 49 )
	Description:setText( Engine.Localize( "MENU_HERO_TUTORIAL_OVERVIEW" ) )
	Description:setTTF( "fonts/escom.ttf" )
	Description:setLetterSpacing( 0.7 )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( Description, "setText", function ( element, text )
		UpdateWidgetHeightToMultilineText( self, element, 24 )
	end )
	self:addElement( Description )
	self.Description = Description
	
	local Glow2 = LUI.UIImage.new()
	Glow2:setLeftRight( 0, 1, -51, 65 )
	Glow2:setTopBottom( 0, 0, -3, 19 )
	Glow2:setRGB( 1, 0.99, 0 )
	Glow2:setAlpha( 0.7 )
	Glow2:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow2 )
	self.Glow2 = Glow2
	
	local Glow1 = LUI.UIImage.new()
	Glow1:setLeftRight( 0, 1, -51, 65 )
	Glow1:setTopBottom( 1, 1, -17, 5 )
	Glow1:setRGB( 1, 0.99, 0 )
	Glow1:setAlpha( 0.7 )
	Glow1:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow1 )
	self.Glow1 = Glow1
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.Border:close()
		self.ChooseCharacterHelpBubbleArrow:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

