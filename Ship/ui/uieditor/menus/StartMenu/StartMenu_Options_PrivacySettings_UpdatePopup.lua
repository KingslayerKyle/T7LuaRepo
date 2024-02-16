-- 17b25b2574503c3a508f53666f908387
-- This hash is used for caching, delete to decompile the file again

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
	local f1_local1 = self
	self.anyChildUsesUpdateState = true
	
	local PrivacySettingsUpdatePopupInternal = CoD.StartMenu_Options_PrivacySettings_UpdatePopupInternal.new( f1_local1, controller )
	PrivacySettingsUpdatePopupInternal:setLeftRight( true, false, 0, 1280 )
	PrivacySettingsUpdatePopupInternal:setTopBottom( true, false, 0, 720 )
	PrivacySettingsUpdatePopupInternal.WorkingTitle:setText( Engine.Localize( "MENU_PRIVACY_SETTINGS_STATE_IN_PROGRESS" ) )
	PrivacySettingsUpdatePopupInternal.Title:setText( Engine.Localize( "" ) )
	PrivacySettingsUpdatePopupInternal.Subtitle:setText( Engine.Localize( "" ) )
	PrivacySettingsUpdatePopupInternal.DoneTitle:setText( Engine.Localize( "MENU_PRIVACY_SETTINGS_STATE_COMPLETE" ) )
	PrivacySettingsUpdatePopupInternal.ErrorSubtitle:setText( Engine.Localize( "MENU_PRIVACY_SETTINGS_STATE_FAILURE" ) )
	self:addElement( PrivacySettingsUpdatePopupInternal )
	self.PrivacySettingsUpdatePopupInternal = PrivacySettingsUpdatePopupInternal
	
	local leftButtonBar = CoD.fe_LeftContainer_NOTLobby.new( f1_local1, controller )
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
		CoD.Menu.UpdateButtonShownState( f2_local0, f1_local1, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
	end )
	f1_local1:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "ENTER", function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
		if not IsModelValueEqualTo( f3_arg2, "PrivacySettingManagementForm.updateProgressState", CoD.OptionsUtility.REGULATION_SET_PREFERENCE_TASK_STATE_IDLE ) and not IsModelValueEqualTo( f3_arg2, "PrivacySettingManagementForm.updateProgressState", CoD.OptionsUtility.REGULATION_SET_PREFERENCE_TASK_STATE_IN_PROGRESS ) then
			GoBackMultiple( self, f3_arg2, "2" )
			return true
		else
			
		end
	end, function ( f4_arg0, f4_arg1, f4_arg2 )
		if not IsModelValueEqualTo( f4_arg2, "PrivacySettingManagementForm.updateProgressState", CoD.OptionsUtility.REGULATION_SET_PREFERENCE_TASK_STATE_IDLE ) and not IsModelValueEqualTo( f4_arg2, "PrivacySettingManagementForm.updateProgressState", CoD.OptionsUtility.REGULATION_SET_PREFERENCE_TASK_STATE_IN_PROGRESS ) then
			CoD.Menu.SetButtonLabel( f4_arg1, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_CONTINUE" )
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
		menu = f1_local1
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

