-- da72cf6919a64b1c62be0718fef73c3d
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.StartMenu.StartMenu_Background" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanelShaderContainer" )
require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.Groups.GroupsSubTitle" )
require( "ui.uieditor.widgets.Groups.GroupsInputButtonScroll" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	local f1_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "steamServer" )
	f1_arg0.nameInput.subscription = f1_arg0.nameInput:subscribeToModel( Engine.CreateModel( f1_local0, "serverName" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f1_arg0.nameInput.verticalScrollingTextBox.textBox:setText( modelValue )
		end
	end )
	f1_arg0.descriptionInput.subscription = f1_arg0.descriptionInput:subscribeToModel( Engine.CreateModel( f1_local0, "gameDescription" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f1_arg0.descriptionInput.verticalScrollingTextBox.textBox:setText( modelValue )
		end
	end )
	f1_arg0.passwordInput.subscription = f1_arg0.passwordInput:subscribeToModel( Engine.CreateModel( f1_local0, "serverPassword" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			f1_arg0.passwordInput.verticalScrollingTextBox.textBox:setText( modelValue )
		end
	end )
end

local PreLoadFunc = function ( self, controller )
	local f5_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "steamServer" )
	Engine.SetModelValue( Engine.CreateModel( f5_local0, "serverName" ), Engine.LiveSteamServer_GetServerName() )
	Engine.SetModelValue( Engine.CreateModel( f5_local0, "gameDescription" ), Engine.LiveSteamServer_GetGameDescription() )
	Engine.SetModelValue( Engine.CreateModel( f5_local0, "serverPassword" ), Engine.LiveSteamServer_GetServerPassword() )
end

LUI.createMenu.ServerSettings = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "ServerSettings" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ServerSettings.buttonPrompts" )
	local f6_local1 = self
	self.anyChildUsesUpdateState = true
	
	local StartMenuBackground0 = CoD.StartMenu_Background.new( f6_local1, controller )
	StartMenuBackground0:setLeftRight( true, true, 0, 0 )
	StartMenuBackground0:setTopBottom( true, true, 0, 0 )
	self:addElement( StartMenuBackground0 )
	self.StartMenuBackground0 = StartMenuBackground0
	
	local FEButtonPanelShaderContainer0 = CoD.FE_ButtonPanelShaderContainer.new( f6_local1, controller )
	FEButtonPanelShaderContainer0:setLeftRight( true, true, 0, 0 )
	FEButtonPanelShaderContainer0:setTopBottom( true, true, 0, 0 )
	FEButtonPanelShaderContainer0:setRGB( 0.31, 0.31, 0.31 )
	self:addElement( FEButtonPanelShaderContainer0 )
	self.FEButtonPanelShaderContainer0 = FEButtonPanelShaderContainer0
	
	local MenuFrame = CoD.GenericMenuFrame.new( f6_local1, controller )
	MenuFrame:setLeftRight( true, true, 0, 0 )
	MenuFrame:setTopBottom( true, true, 0, 0 )
	MenuFrame.titleLabel:setText( Engine.Localize( "PLATFORM_SERVER_SETTINGS_CAPS" ) )
	MenuFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "PLATFORM_SERVER_SETTINGS_CAPS" ) )
	self:addElement( MenuFrame )
	self.MenuFrame = MenuFrame
	
	local nameTitle = CoD.GroupsSubTitle.new( f6_local1, controller )
	nameTitle:setLeftRight( true, false, 93, 261 )
	nameTitle:setTopBottom( true, false, 112, 144 )
	nameTitle.weaponNameLabel:setText( Engine.Localize( "PLATFORM_EDIT_NAME" ) )
	self:addElement( nameTitle )
	self.nameTitle = nameTitle
	
	local nameInput = CoD.GroupsInputButtonScroll.new( f6_local1, controller )
	nameInput:setLeftRight( true, false, 93, 478 )
	nameInput:setTopBottom( true, false, 150, 212.5 )
	nameInput.verticalScrollingTextBox.textBox:setText( Engine.Localize( "" ) )
	nameInput.verticalScrollingTextBox.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	nameInput:registerEventHandler( "gain_focus", function ( element, event )
		local f7_local0 = nil
		if element.gainFocus then
			f7_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f7_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f6_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f7_local0
	end )
	nameInput:registerEventHandler( "lose_focus", function ( element, event )
		local f8_local0 = nil
		if element.loseFocus then
			f8_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f8_local0 = element.super:loseFocus( event )
		end
		return f8_local0
	end )
	f6_local1:AddButtonCallbackFunction( nameInput, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		ServerSettingsEditName( self, f9_arg0, f9_arg2 )
		return true
	end, function ( f10_arg0, f10_arg1, f10_arg2 )
		CoD.Menu.SetButtonLabel( f10_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( nameInput )
	self.nameInput = nameInput
	
	local descriptionTitle = CoD.GroupsSubTitle.new( f6_local1, controller )
	descriptionTitle:setLeftRight( true, false, 93, 261 )
	descriptionTitle:setTopBottom( true, false, 233.43, 265.43 )
	descriptionTitle.weaponNameLabel:setText( Engine.Localize( "GROUPS_EDIT_GROUP_DESCRIPTION" ) )
	self:addElement( descriptionTitle )
	self.descriptionTitle = descriptionTitle
	
	local descriptionInput = CoD.GroupsInputButtonScroll.new( f6_local1, controller )
	descriptionInput:setLeftRight( true, false, 93, 478 )
	descriptionInput:setTopBottom( true, false, 274, 384 )
	descriptionInput.verticalScrollingTextBox.textBox:setText( Engine.Localize( "" ) )
	descriptionInput.verticalScrollingTextBox.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	descriptionInput:registerEventHandler( "gain_focus", function ( element, event )
		local f11_local0 = nil
		if element.gainFocus then
			f11_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f11_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f6_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f11_local0
	end )
	descriptionInput:registerEventHandler( "lose_focus", function ( element, event )
		local f12_local0 = nil
		if element.loseFocus then
			f12_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f12_local0 = element.super:loseFocus( event )
		end
		return f12_local0
	end )
	f6_local1:AddButtonCallbackFunction( descriptionInput, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		ServerSettingsEditDescription( self, f13_arg0, f13_arg2 )
		return true
	end, function ( f14_arg0, f14_arg1, f14_arg2 )
		CoD.Menu.SetButtonLabel( f14_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( descriptionInput )
	self.descriptionInput = descriptionInput
	
	local passwordTitle = CoD.GroupsSubTitle.new( f6_local1, controller )
	passwordTitle:setLeftRight( true, false, 93, 261 )
	passwordTitle:setTopBottom( true, false, 403, 435 )
	passwordTitle.weaponNameLabel:setText( Engine.Localize( "PLATFORM_EDIT_PASSWORD" ) )
	self:addElement( passwordTitle )
	self.passwordTitle = passwordTitle
	
	local passwordInput = CoD.GroupsInputButtonScroll.new( f6_local1, controller )
	passwordInput:setLeftRight( true, false, 93, 478 )
	passwordInput:setTopBottom( true, false, 443, 474.5 )
	passwordInput.verticalScrollingTextBox.textBox:setText( Engine.Localize( "" ) )
	passwordInput.verticalScrollingTextBox.textBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	passwordInput:registerEventHandler( "gain_focus", function ( element, event )
		local f15_local0 = nil
		if element.gainFocus then
			f15_local0 = element:gainFocus( event )
		elseif element.super.gainFocus then
			f15_local0 = element.super:gainFocus( event )
		end
		CoD.Menu.UpdateButtonShownState( element, f6_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
		return f15_local0
	end )
	passwordInput:registerEventHandler( "lose_focus", function ( element, event )
		local f16_local0 = nil
		if element.loseFocus then
			f16_local0 = element:loseFocus( event )
		elseif element.super.loseFocus then
			f16_local0 = element.super:loseFocus( event )
		end
		return f16_local0
	end )
	f6_local1:AddButtonCallbackFunction( passwordInput, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
		ServerSettingsEditPassword( self, f17_arg0, f17_arg2 )
		return true
	end, function ( f18_arg0, f18_arg1, f18_arg2 )
		CoD.Menu.SetButtonLabel( f18_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_SELECT" )
		return true
	end, false )
	self:addElement( passwordInput )
	self.passwordInput = passwordInput
	
	nameInput.navigation = {
		down = descriptionInput
	}
	descriptionInput.navigation = {
		up = nameInput,
		down = passwordInput
	}
	passwordInput.navigation = {
		up = descriptionInput
	}
	CoD.Menu.AddNavigationHandler( f6_local1, self, controller )
	self:registerEventHandler( "ui_keyboard_input", function ( element, event )
		local f19_local0 = nil
		ServerSettingsHandleKeyboardComplete( self, element, controller, event )
		if not f19_local0 then
			f19_local0 = element:dispatchEventToChildren( event )
		end
		return f19_local0
	end )
	f6_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, nil, function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3 )
		GoBack( self, f20_arg2 )
		return true
	end, function ( f21_arg0, f21_arg1, f21_arg2 )
		CoD.Menu.SetButtonLabel( f21_arg1, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "MP_BACK" )
		return true
	end, false )
	MenuFrame:setModel( self.buttonModel, controller )
	nameInput.id = "nameInput"
	descriptionInput.id = "descriptionInput"
	passwordInput.id = "passwordInput"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f6_local1
	} )
	if not self:restoreState() then
		self.nameInput:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.StartMenuBackground0:close()
		element.FEButtonPanelShaderContainer0:close()
		element.MenuFrame:close()
		element.nameTitle:close()
		element.nameInput:close()
		element.descriptionTitle:close()
		element.descriptionInput:close()
		element.passwordTitle:close()
		element.passwordInput:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "ServerSettings.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

