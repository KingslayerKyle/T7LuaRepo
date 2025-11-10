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
	self:setLeftRight( true, false, 0, 150 )
	self:setTopBottom( true, false, 0, 215 )
	self.anyChildUsesUpdateState = true
	
	local Background = LUI.UIImage.new()
	Background:setLeftRight( true, true, 0, 0 )
	Background:setTopBottom( true, true, 0, 0 )
	Background:setRGB( 0, 0, 0 )
	self:addElement( Background )
	self.Background = Background
	
	local Border = CoD.Border.new( menu, controller )
	Border:setLeftRight( true, true, 0, 0 )
	Border:setTopBottom( true, true, 0, 0 )
	self:addElement( Border )
	self.Border = Border
	
	local ChooseCharacterHelpBubbleArrow = CoD.ChooseCharacter_HelpBubble_Arrow.new( menu, controller )
	ChooseCharacterHelpBubbleArrow:setLeftRight( false, true, -62.88, 82.13 )
	ChooseCharacterHelpBubbleArrow:setTopBottom( true, false, 2, 63 )
	self:addElement( ChooseCharacterHelpBubbleArrow )
	self.ChooseCharacterHelpBubbleArrow = ChooseCharacterHelpBubbleArrow
	
	local FETabIdle0 = LUI.UIImage.new()
	FETabIdle0:setLeftRight( true, true, 149.13, -150 )
	FETabIdle0:setTopBottom( true, true, 0, 0 )
	FETabIdle0:setImage( RegisterImage( "uie_t7_menu_cac_buttontabidlefull" ) )
	FETabIdle0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_nineslice_add" ) )
	FETabIdle0:setShaderVector( 0, 0.04, 0.19, 0, 0 )
	FETabIdle0:setupNineSliceShader( 8, 8 )
	self:addElement( FETabIdle0 )
	self.FETabIdle0 = FETabIdle0
	
	local Bottom = LUI.UIImage.new()
	Bottom:setLeftRight( true, true, 0, 0 )
	Bottom:setTopBottom( false, true, -4.11, -0.11 )
	Bottom:setRGB( 1, 0.41, 0 )
	self:addElement( Bottom )
	self.Bottom = Bottom
	
	local Top = LUI.UIImage.new()
	Top:setLeftRight( true, true, 0, 0 )
	Top:setTopBottom( true, false, 0, 4 )
	Top:setRGB( 1, 0.41, 0 )
	self:addElement( Top )
	self.Top = Top
	
	local Description = LUI.UIText.new()
	Description:setLeftRight( true, false, 4.75, 137.25 )
	Description:setTopBottom( true, false, 14, 32.5 )
	Description:setText( Engine.Localize( "MENU_HERO_TUTORIAL_OVERVIEW" ) )
	Description:setTTF( "fonts/escom.ttf" )
	Description:setLetterSpacing( 0.7 )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	Description:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( Description, "setText", function ( element, controller )
		UpdateWidgetHeightToMultilineText( self, element, 24 )
	end )
	self:addElement( Description )
	self.Description = Description
	
	local Glow2 = LUI.UIImage.new()
	Glow2:setLeftRight( true, true, -34, 43 )
	Glow2:setTopBottom( true, false, -2.21, 12.21 )
	Glow2:setRGB( 1, 0.99, 0 )
	Glow2:setAlpha( 0.7 )
	Glow2:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow2 )
	self.Glow2 = Glow2
	
	local Glow1 = LUI.UIImage.new()
	Glow1:setLeftRight( true, true, -34, 43 )
	Glow1:setTopBottom( false, true, -11.32, 3.1 )
	Glow1:setRGB( 1, 0.99, 0 )
	Glow1:setAlpha( 0.7 )
	Glow1:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow1 )
	self.Glow1 = Glow1
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Border:close()
		element.ChooseCharacterHelpBubbleArrow:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

