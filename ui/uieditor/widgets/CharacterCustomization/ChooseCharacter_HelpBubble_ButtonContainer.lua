-- 3ff81f81940c1ca33a04cb1aac0dcc22
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 149 )
	self:setTopBottom( true, false, 0, 72 )
	self.anyChildUsesUpdateState = true
	
	local ChooseCharacterHelpBubbleButtonLBRB = CoD.ChooseCharacter_HelpBubble_Button_LBRB.new( menu, controller )
	ChooseCharacterHelpBubbleButtonLBRB:setLeftRight( true, true, 0, 0 )
	ChooseCharacterHelpBubbleButtonLBRB:setTopBottom( true, true, 0, 0 )
	self:addElement( ChooseCharacterHelpBubbleButtonLBRB )
	self.ChooseCharacterHelpBubbleButtonLBRB = ChooseCharacterHelpBubbleButtonLBRB
	
	local ChooseCharacterHelpBubbleButtonPC = CoD.ChooseCharacter_HelpBubble_Button_PC.new( menu, controller )
	ChooseCharacterHelpBubbleButtonPC:setLeftRight( true, true, 0, 0 )
	ChooseCharacterHelpBubbleButtonPC:setTopBottom( true, true, 0, 0 )
	ChooseCharacterHelpBubbleButtonPC:setAlpha( 0 )
	self:addElement( ChooseCharacterHelpBubbleButtonPC )
	self.ChooseCharacterHelpBubbleButtonPC = ChooseCharacterHelpBubbleButtonPC
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				ChooseCharacterHelpBubbleButtonLBRB:completeAnimation()
				self.ChooseCharacterHelpBubbleButtonLBRB:setAlpha( 1 )
				self.clipFinished( ChooseCharacterHelpBubbleButtonLBRB, {} )
				ChooseCharacterHelpBubbleButtonPC:completeAnimation()
				self.ChooseCharacterHelpBubbleButtonPC:setAlpha( 0 )
				self.clipFinished( ChooseCharacterHelpBubbleButtonPC, {} )
			end
		},
		PC = {
			DefaultClip = function ()
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
		local f1_local3 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f1_local3( element, event )
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ChooseCharacterHelpBubbleButtonLBRB:close()
		element.ChooseCharacterHelpBubbleButtonPC:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

