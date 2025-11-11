require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacter_HelpBubble_ButtonContainer" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacter_HelpBubble_Container" )

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
	self:setLeftRight( 0, 0, 0, 225 )
	self:setTopBottom( 0, 0, 0, 202 )
	self.anyChildUsesUpdateState = true
	
	local ChooseCharacterHelpBubbleContainer = CoD.ChooseCharacter_HelpBubble_Container.new( menu, controller )
	ChooseCharacterHelpBubbleContainer:setLeftRight( 0, 0, 2, 225 )
	ChooseCharacterHelpBubbleContainer:setTopBottom( 0, 0, 0, 203 )
	ChooseCharacterHelpBubbleContainer.Description:setText( Engine.Localize( "MENU_HERO_TUTORIAL_OVERVIEW" ) )
	self:addElement( ChooseCharacterHelpBubbleContainer )
	self.ChooseCharacterHelpBubbleContainer = ChooseCharacterHelpBubbleContainer
	
	local ChooseCharacterHelpBubbleButtonContainer = CoD.ChooseCharacter_HelpBubble_ButtonContainer.new( menu, controller )
	ChooseCharacterHelpBubbleButtonContainer:setLeftRight( 0, 1, 0, -2 )
	ChooseCharacterHelpBubbleButtonContainer:setTopBottom( 0, 0, 203, 326 )
	self:addElement( ChooseCharacterHelpBubbleButtonContainer )
	self.ChooseCharacterHelpBubbleButtonContainer = ChooseCharacterHelpBubbleButtonContainer
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ChooseCharacterHelpBubbleContainer:close()
		self.ChooseCharacterHelpBubbleButtonContainer:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

