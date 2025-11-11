require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacter_HelpBubble_Button_LBRB" )
require( "ui.uieditor.widgets.CharacterCustomization.ChooseCharacter_HelpBubble_Button_PC" )

CoD.ChooseCharacter_HelpBubble_ButtonContainer = InheritFrom( LUI.UIElement )
CoD.ChooseCharacter_HelpBubble_ButtonContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChooseCharacter_HelpBubble_ButtonContainer )
	self.id = "ChooseCharacter_HelpBubble_ButtonContainer"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( 0, 0, 0, 223 )
	self:setTopBottom( 0, 0, 0, 108 )
	self.anyChildUsesUpdateState = true
	
	local ChooseCharacterHelpBubbleButtonLBRB = CoD.ChooseCharacter_HelpBubble_Button_LBRB.new( menu, controller )
	ChooseCharacterHelpBubbleButtonLBRB:setLeftRight( 0, 1, 0, 0 )
	ChooseCharacterHelpBubbleButtonLBRB:setTopBottom( 0, 1, 0, 0 )
	self:addElement( ChooseCharacterHelpBubbleButtonLBRB )
	self.ChooseCharacterHelpBubbleButtonLBRB = ChooseCharacterHelpBubbleButtonLBRB
	
	local ChooseCharacterHelpBubbleButtonPC = CoD.ChooseCharacter_HelpBubble_Button_PC.new( menu, controller )
	ChooseCharacterHelpBubbleButtonPC:setLeftRight( 0, 1, 0, 0 )
	ChooseCharacterHelpBubbleButtonPC:setTopBottom( 0, 1, 0, 0 )
	ChooseCharacterHelpBubbleButtonPC:setAlpha( 0 )
	self:addElement( ChooseCharacterHelpBubbleButtonPC )
	self.ChooseCharacterHelpBubbleButtonPC = ChooseCharacterHelpBubbleButtonPC
	
	self.resetProperties = function ()
		ChooseCharacterHelpBubbleButtonLBRB:completeAnimation()
		ChooseCharacterHelpBubbleButtonPC:completeAnimation()
		ChooseCharacterHelpBubbleButtonLBRB:setAlpha( 1 )
		ChooseCharacterHelpBubbleButtonPC:setAlpha( 0 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		PC = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				ChooseCharacterHelpBubbleButtonLBRB:completeAnimation()
				self.ChooseCharacterHelpBubbleButtonLBRB:setAlpha( 0 )
				self.clipFinished( ChooseCharacterHelpBubbleButtonLBRB, {} )
				ChooseCharacterHelpBubbleButtonPC:completeAnimation()
				self.ChooseCharacterHelpBubbleButtonPC:setAlpha( 1 )
				self.clipFinished( ChooseCharacterHelpBubbleButtonPC, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "PC",
			condition = function ( menu, element, event )
				return IsPC() and not IsGamepad( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local currentEv = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( self, event )
			event.menu = event.menu or menu
			self:updateState( event )
			return currentEv( self, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.ChooseCharacterHelpBubbleButtonLBRB:close()
		self.ChooseCharacterHelpBubbleButtonPC:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

