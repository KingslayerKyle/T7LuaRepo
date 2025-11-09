require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacter_HelpBubble_Container" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacter_HelpBubble_ButtonContainer" )

CoD.ChooseCharacter_HelpBubbleWidget = InheritFrom( LUI.UIElement )
CoD.ChooseCharacter_HelpBubbleWidget.new = function ( menu, controller )
	local self = LUI.UIVerticalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 0
	} )
	self:setAlignment( LUI.Alignment.Top )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacter_HelpBubbleWidget )
	self.id = "ChooseCharacter_HelpBubbleWidget"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( true, false, 0, 150 )
	self:setTopBottom( true, false, 0, 135 )
	self.anyChildUsesUpdateState = true
	
	local ChooseCharacterHelpBubbleContainer = CoD.ChooseCharacter_HelpBubble_Container.new( menu, controller )
	ChooseCharacterHelpBubbleContainer:setLeftRight( true, false, 1.19, 150 )
	ChooseCharacterHelpBubbleContainer:setTopBottom( true, false, 0, 135.45 )
	ChooseCharacterHelpBubbleContainer.Description:setText( Engine.Localize( "MENU_HERO_TUTORIAL_OVERVIEW" ) )
	self:addElement( ChooseCharacterHelpBubbleContainer )
	self.ChooseCharacterHelpBubbleContainer = ChooseCharacterHelpBubbleContainer
	
	local ChooseCharacterHelpBubbleButtonContainer = CoD.ChooseCharacter_HelpBubble_ButtonContainer.new( menu, controller )
	ChooseCharacterHelpBubbleButtonContainer:setLeftRight( true, true, 0, -1 )
	ChooseCharacterHelpBubbleButtonContainer:setTopBottom( true, false, 135.45, 217.45 )
	self:addElement( ChooseCharacterHelpBubbleButtonContainer )
	self.ChooseCharacterHelpBubbleButtonContainer = ChooseCharacterHelpBubbleButtonContainer
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ChooseCharacterHelpBubbleContainer:close()
		element.ChooseCharacterHelpBubbleButtonContainer:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

