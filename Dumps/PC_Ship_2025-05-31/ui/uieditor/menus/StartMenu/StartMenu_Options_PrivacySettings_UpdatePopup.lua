require( "ui.uieditor.widgets.StartMenu.StartMenu_Options_PrivacySettings_UpdatePopupInternal" )
require( "ui.uieditor.widgets.Footer.fe_LeftContainer_NOTLobby" )

LUI.createMenu.StartMenu_Options_PrivacySettings_UpdatePopup = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "StartMenu_Options_PrivacySettings_UpdatePopup" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "StartMenu_Options_PrivacySettings_UpdatePopup.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local PrivacySettingsUpdatePopupInternal = CoD.StartMenu_Options_PrivacySettings_UpdatePopupInternal.new( self, controller )
	PrivacySettingsUpdatePopupInternal:setLeftRight( true, false, 0, 1280 )
	PrivacySettingsUpdatePopupInternal:setTopBottom( true, false, 0, 720 )
	PrivacySettingsUpdatePopupInternal.WorkingTitle:setText( Engine.Localize( "MENU_PRIVACY_SETTINGS_STATE_IN_PROGRESS" ) )
	PrivacySettingsUpdatePopupInternal.Title:setText( Engine.Localize( "" ) )
	PrivacySettingsUpdatePopupInternal.Subtitle:setText( Engine.Localize( "" ) )
	PrivacySettingsUpdatePopupInternal.DoneTitle:setText( Engine.Localize( "MENU_PRIVACY_SETTINGS_STATE_COMPLETE" ) )
	PrivacySettingsUpdatePopupInternal.ErrorSubtitle:setText( Engine.Localize( "MENU_PRIVACY_SETTINGS_STATE_FAILURE" ) )
	self:addElement( PrivacySettingsUpdatePopupInternal )
	self.PrivacySettingsUpdatePopupInternal = PrivacySettingsUpdatePopupInternal
	
	local leftButtonBar = CoD.fe_LeftContainer_NOTLobby.new( self, controller )
	leftButtonBar:setLeftRight( true, false, 64, 496 )
	leftButtonBar:setTopBottom( true, false, 531, 563 )
	self:addElement( leftButtonBar )
	self.leftButtonBar = leftButtonBar
	
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "PrivacySettingManagementForm.updateProgressState" ), function ( model )
		local f2_local0 = self
		local f2_local1 = {
			controller = controller,
			name = "model_validation",
			modelValue = Engine.GetModelValue( model ),
			modelName = "PrivacySettingManagementForm.updateProgressState"
		}
		CoD.Menu.UpdateButtonShownState( f2_local0, self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( element, menu, controller, model )
		if not IsModelValueEqualTo( controller, "PrivacySettingManagementForm.updateProgressState", CoD.OptionsUtility.REGULATION_SET_PREFERENCE_TASK_STATE_IDLE ) and not IsModelValueEqualTo( controller, "PrivacySettingManagementForm.updateProgressState", CoD.OptionsUtility.REGULATION_SET_PREFERENCE_TASK_STATE_IN_PROGRESS ) then
			GoBackMultiple( self, controller, "2" )
			return true
		else
			
		end
	end, function ( element, menu, controller )
		if not IsModelValueEqualTo( controller, "PrivacySettingManagementForm.updateProgressState", CoD.OptionsUtility.REGULATION_SET_PREFERENCE_TASK_STATE_IDLE ) and not IsModelValueEqualTo( controller, "PrivacySettingManagementForm.updateProgressState", CoD.OptionsUtility.REGULATION_SET_PREFERENCE_TASK_STATE_IN_PROGRESS ) then
			CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CONTINUE" )
			return true
		else
			return false
		end
	end, false )
	leftButtonBar:setModel( self.buttonModel, controller )
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.PrivacySettingsUpdatePopupInternal:close()
		element.leftButtonBar:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "StartMenu_Options_PrivacySettings_UpdatePopup.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

