-- 463f31282af83029ec14d779789ed914
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ButtonGenericWithMouseFunc" )
require( "ui.uieditor.widgets.Chat.ChatClientInputTextBox" )
require( "ui.uieditor.widgets.Chat.ChatClientChannelSelectorButton" )
require( "ui.uieditor.widgets.Chat.ChatClientSettingContainer" )
require( "ui.uieditor.widgets.Chat.ChatClientChannelSelectorContainer" )

local PostLoadFunc = function ( self, controller, menu )
	ChatClientInputTextFieldUpdatePrompt( self, self.InputText, controller )
	local f1_local0 = function ( f2_arg0, f2_arg1 )
		if not ChatClientIsAvailable( f2_arg0, f2_arg0, f2_arg1.controller ) then
			ChatClientResetSubMenus( f2_arg0, f2_arg0, f2_arg1.controller )
			return true
		elseif f2_arg0.modelToToggle ~= nil then
			if f2_arg0.modelToToggle ~= "menuInputChannelShow" then
				SetSelfModelValue( f2_arg0, f2_arg0, f2_arg1.controller, "menuInputChannelShow", 0 )
			elseif f2_arg0.modelToToggle ~= "menuSettingsShow" then
				SetSelfModelValue( f2_arg0, f2_arg0, f2_arg1.controller, "menuSettingsShow", 0 )
			end
			ToggleSelfModelValueNumber( f2_arg0, f2_arg0, f2_arg1.controller, f2_arg0.modelToToggle )
			return true
		else
			
		end
	end
	
	self.ChatClientChannelSelectorButton:setHandleMouse( true )
	self.ChatClientChannelSelectorButton.modelToToggle = "menuInputChannelShow"
	self.ChatClientChannelSelectorButton:registerEventHandler( "leftmouseup", f1_local0 )
	self.SettingsButton:setHandleMouse( true )
	self.SettingsButton.modelToToggle = "menuSettingsShow"
	self.SettingsButton:registerEventHandler( "leftmouseup", f1_local0 )
	local f1_local1 = function ( f3_arg0, f3_arg1 )
		if not IsSelfModelValueNilOrZero( f3_arg0, f3_arg1.controller, f3_arg0.modelToToggle ) then
			SetSelfModelValue( f3_arg0, f3_arg0, f3_arg1.controller, f3_arg0.modelToToggle, 0 )
		end
	end
	
	local f1_local2 = function ( f4_arg0, f4_arg1 )
	end
	
	self.ChatClientChannelSelectorContainer:setHandleMouse( true )
	self.ChatClientChannelSelectorContainer.modelToToggle = "menuInputChannelShow"
	self.ChatClientChannelSelectorContainer:registerEventHandler( "leftclick_outside", f1_local1 )
	self.ChatClientChannelSelectorContainer:registerEventHandler( "leftmouseup", f1_local2 )
	self.ChatClientSettingContainer:setHandleMouse( true )
	self.ChatClientSettingContainer.modelToToggle = "menuSettingsShow"
	self.ChatClientSettingContainer:registerEventHandler( "leftclick_outside", f1_local1 )
	self.ChatClientSettingContainer:registerEventHandler( "leftmouseup", f1_local2 )
	local f1_local3 = function ( f5_arg0, f5_arg1 )
		ChatClientInputStart( f5_arg0, f5_arg0, f5_arg1.controller, "" )
	end
	
	self.InputText:setHandleMouse( true )
	self.InputText:registerEventHandler( "leftmouseup", f1_local3 )
	self:setForceMouseEventDispatch( true )
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
	self:setLeftRight( true, false, 0, 566 )
	self:setTopBottom( true, false, 0, 164 )
	self.anyChildUsesUpdateState = true
	
	local SettingsButton = CoD.ButtonGenericWithMouseFunc.new( menu, controller )
	SettingsButton:setLeftRight( false, true, -111, -79 )
	SettingsButton:setTopBottom( true, false, 128, 160 )
	SettingsButton:setAlpha( 0.9 )
	SettingsButton.ButtonIcon:setImage( RegisterImage( "uie_chatclient_settings" ) )
	SettingsButton:subscribeToGlobalModel( controller, "ChatClientGlobal", nil, function ( model )
		SettingsButton:setModel( model, controller )
	end )
	self:addElement( SettingsButton )
	self.SettingsButton = SettingsButton
	
	local InputText = CoD.ChatClientInputTextBox.new( menu, controller )
	InputText:setLeftRight( true, false, 110, 456 )
	InputText:setTopBottom( true, false, 128, 160 )
	InputText:subscribeToGlobalModel( controller, "ChatClientGlobal", nil, function ( model )
		InputText:setModel( model, controller )
	end )
	InputText:subscribeToGlobalModel( controller, "ChatClientGlobal", "update", function ( model )
		ChatClientInputTextFieldUpdatePrompt( self, InputText, controller )
	end )
	InputText:mergeStateConditions( {
		{
			stateName = "Chatting",
			condition = function ( menu, element, event )
				return ChatClientIsChatting( controller )
			end
		},
		{
			stateName = "Disabled",
			condition = function ( menu, element, event )
				return not ChatClientIsAvailable( self, element, controller )
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
	ChatClientChannelSelectorButton:setLeftRight( true, false, 78, 110 )
	ChatClientChannelSelectorButton:setTopBottom( true, false, 128, 160 )
	ChatClientChannelSelectorButton:setAlpha( 0.9 )
	ChatClientChannelSelectorButton:subscribeToGlobalModel( controller, "ChatClientGlobal", nil, function ( model )
		ChatClientChannelSelectorButton:setModel( model, controller )
	end )
	self:addElement( ChatClientChannelSelectorButton )
	self.ChatClientChannelSelectorButton = ChatClientChannelSelectorButton
	
	local ChatClientSettingContainer = CoD.ChatClientSettingContainer.new( menu, controller )
	ChatClientSettingContainer:setLeftRight( true, false, 377, 487 )
	ChatClientSettingContainer:setTopBottom( true, false, 3, 125 )
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
	ChatClientChannelSelectorContainer:setLeftRight( true, false, 78, 188 )
	ChatClientChannelSelectorContainer:setTopBottom( true, false, 50, 125 )
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
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.SettingsButton:close()
		element.InputText:close()
		element.ChatClientChannelSelectorButton:close()
		element.ChatClientSettingContainer:close()
		element.ChatClientChannelSelectorContainer:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
