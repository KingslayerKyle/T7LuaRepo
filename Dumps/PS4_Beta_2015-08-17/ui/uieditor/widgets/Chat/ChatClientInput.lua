require( "ui.uieditor.widgets.ButtonGenericWithMouseFunc" )
require( "ui.uieditor.widgets.Chat.ChatClientInputTextBox" )
require( "ui.uieditor.widgets.Chat.ChatClientChannelSelectorButton" )
require( "ui.uieditor.widgets.Chat.ChatClientSettingContainer" )
require( "ui.uieditor.widgets.Chat.ChatClientChannelSelectorContainer" )

local PostLoadFunc = function ( self, controller, menu )
	ChatClientInputTextFieldUpdatePrompt( self, self.InputText, controller )
end

CoD.ChatClientInput = InheritFrom( LUI.UIElement )
CoD.ChatClientInput.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ChatClientInput )
	self.id = "ChatClientInput"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 410 )
	self:setTopBottom( true, false, 0, 142 )
	self:makeFocusable()
	self.onlyChildrenFocusable = true
	self.anyChildUsesUpdateState = true
	
	local SettingsButton = CoD.ButtonGenericWithMouseFunc.new( menu, controller )
	SettingsButton:setLeftRight( false, true, -32, 0 )
	SettingsButton:setTopBottom( true, false, 110, 142 )
	SettingsButton.ButtonIcon:setImage( RegisterImage( "uie_chatclient_settings" ) )
	SettingsButton:subscribeToGlobalModel( controller, "ChatClientGlobal", nil, function ( model )
		SettingsButton:setModel( model, controller )
	end )
	SettingsButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	SettingsButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( SettingsButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ToggleSelfModelValueNumber( self, element, controller, "menuSettingsShow" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( SettingsButton )
	self.SettingsButton = SettingsButton
	
	local InputText = CoD.ChatClientInputTextBox.new( menu, controller )
	InputText:setLeftRight( true, false, 32, 378 )
	InputText:setTopBottom( true, false, 110, 142 )
	InputText:subscribeToGlobalModel( controller, "ChatClientGlobal", nil, function ( model )
		InputText:setModel( model, controller )
	end )
	InputText:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		ChatClientInputTextFocusChanged( self, element, controller )
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	InputText:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		ChatClientInputTextFocusChanged( self, element, controller )
		return retVal
	end )
	menu:AddButtonCallbackFunction( InputText, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ChatClientInputStart( self, element, controller, "" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	InputText:subscribeToGlobalModel( controller, "ChatClientGlobal", "update", function ( model )
		local element = InputText
		ChatClientInputTextFieldUpdatePrompt( self, element, controller )
	end )
	InputText:mergeStateConditions( {
		{
			stateName = "Chatting",
			condition = function ( menu, element, event )
				return ChatClientIsChatting( controller )
			end
		}
	} )
	InputText:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "ChatClientGlobal.update" ), function ( model )
		menu:updateElementState( InputText, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "ChatClientGlobal.update"
		} )
	end )
	self:addElement( InputText )
	self.InputText = InputText
	
	local ChatClientChannelSelectorButton = CoD.ChatClientChannelSelectorButton.new( menu, controller )
	ChatClientChannelSelectorButton:setLeftRight( true, false, 0, 32 )
	ChatClientChannelSelectorButton:setTopBottom( true, false, 110, 142 )
	ChatClientChannelSelectorButton:subscribeToGlobalModel( controller, "ChatClientGlobal", nil, function ( model )
		ChatClientChannelSelectorButton:setModel( model, controller )
	end )
	ChatClientChannelSelectorButton:registerEventHandler( "gain_focus", function ( element, event )
		local retVal = nil
		if element.gainFocus then
			retVal = element:gainFocus( event )
		elseif element.super.gainFocus then
			retVal = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, menu, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return retVal
	end )
	ChatClientChannelSelectorButton:registerEventHandler( "lose_focus", function ( element, event )
		local retVal = nil
		if element.loseFocus then
			retVal = element:loseFocus( event )
		elseif element.super.loseFocus then
			retVal = element.super:loseFocus( event )
		end
		return retVal
	end )
	menu:AddButtonCallbackFunction( ChatClientChannelSelectorButton, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		ToggleSelfModelValueNumber( self, element, controller, "menuInputChannelShow" )
		return true
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "" )
		return false
	end, false )
	self:addElement( ChatClientChannelSelectorButton )
	self.ChatClientChannelSelectorButton = ChatClientChannelSelectorButton
	
	local ChatClientSettingContainer = CoD.ChatClientSettingContainer.new( menu, controller )
	ChatClientSettingContainer:setLeftRight( true, false, 300, 410 )
	ChatClientSettingContainer:setTopBottom( true, false, 0, 110 )
	ChatClientSettingContainer:subscribeToGlobalModel( controller, "ChatClientGlobal", nil, function ( model )
		ChatClientSettingContainer:setModel( model, controller )
	end )
	ChatClientSettingContainer:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return IsSelfModelValueNilOrZero( element, controller, "menuSettingsShow" )
			end
		}
	} )
	ChatClientSettingContainer:linkToElementModel( ChatClientSettingContainer, "menuSettingsShow", true, function ( model )
		menu:updateElementState( ChatClientSettingContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "menuSettingsShow"
		} )
	end )
	self:addElement( ChatClientSettingContainer )
	self.ChatClientSettingContainer = ChatClientSettingContainer
	
	local ChatClientChannelSelectorContainer = CoD.ChatClientChannelSelectorContainer.new( menu, controller )
	ChatClientChannelSelectorContainer:setLeftRight( true, false, 0, 110 )
	ChatClientChannelSelectorContainer:setTopBottom( true, false, 46, 110 )
	ChatClientChannelSelectorContainer:subscribeToGlobalModel( controller, "ChatClientGlobal", nil, function ( model )
		ChatClientChannelSelectorContainer:setModel( model, controller )
	end )
	ChatClientChannelSelectorContainer:mergeStateConditions( {
		{
			stateName = "Hide",
			condition = function ( menu, element, event )
				return IsSelfModelValueNilOrZero( element, controller, "menuInputChannelShow" )
			end
		}
	} )
	ChatClientChannelSelectorContainer:linkToElementModel( ChatClientChannelSelectorContainer, "menuInputChannelShow", true, function ( model )
		menu:updateElementState( ChatClientChannelSelectorContainer, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "menuInputChannelShow"
		} )
	end )
	self:addElement( ChatClientChannelSelectorContainer )
	self.ChatClientChannelSelectorContainer = ChatClientChannelSelectorContainer
	
	SettingsButton.navigation = {
		left = InputText
	}
	InputText.navigation = {
		left = ChatClientChannelSelectorButton,
		right = SettingsButton
	}
	ChatClientChannelSelectorButton.navigation = {
		right = InputText
	}
	CoD.Menu.AddNavigationHandler( menu, self, controller )
	SettingsButton.id = "SettingsButton"
	InputText.id = "InputText"
	ChatClientChannelSelectorButton.id = "ChatClientChannelSelectorButton"
	self:registerEventHandler( "gain_focus", function ( self, event )
		if self.m_focusable and self.ChatClientChannelSelectorButton:processEvent( event ) then
			return true
		else
			return LUI.UIElement.gainFocus( self, event )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.SettingsButton:close()
		self.InputText:close()
		self.ChatClientChannelSelectorButton:close()
		self.ChatClientSettingContainer:close()
		self.ChatClientChannelSelectorContainer:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

