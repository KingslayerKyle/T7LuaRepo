require( "ui.uieditor.actions_helper" )

function UpdateState( self, event )
	local evCopy = {}
	if event ~= nil then
		evCopy = LUI.ShallowCopy( event )
	end
	evCopy.name = "update_state"
	self:processEvent( evCopy )
end

function UpdateMenuState( menu, event )
	local evCopy = {}
	if event ~= nil then
		evCopy = LUI.ShallowCopy( event )
	end
	evCopy.name = "update_state"
	menu:updateElementState( menu, evCopy )
end

function UpdateElementState( self, elementName, controller )
	if self[elementName] then
		self[elementName]:processEvent( {
			name = "update_state",
			controller = controller
		} )
	end
end

function UpdateSelfElementState( menu, element, controller )
	element:processEvent( {
		name = "update_state",
		menu = menu,
		controller = controller
	} )
end

function UpdateSelfState( self, controller )
	self:processEvent( {
		name = "update_state",
		controller = controller
	} )
end

function SetLuiKeyCatcher( booleanArg )
	Engine.SetLuiKeyCatcher( booleanArg )
end

function EngineExec( controller, execCommand )
	Engine.Exec( controller, execCommand )
end

function EngineExecArgs( controller, execCommand, ... )
	local vargs = {
		n = select( "#", ... ),
		...
	}
	Engine.Exec( controller, execCommand, unpack( vargs ) )
end

function UpdateAllMenuButtonPrompts( menu, controller )
	menu:UpdateAllButtonPrompts( controller )
end

function UpdateButtonPrompt( self, buttonPrompt, controller )
	if not self.buttonPromptAddFunctions then
		return 
	elseif not self.buttonPromptAddFunctions[buttonPrompt] or not self.buttonPromptAddFunctions[buttonPrompt]( self, self, {
		controller = controller
	} ) then
		self:removeButtonPrompt( buttonPrompt, self )
	end
end

function SetButtonPromptEnabled( menu, enumValue )
	menu:SetButtonPromptState( enumValue, Enum.LUIButtonPromptStates.FLAG_ENABLE_PROMPTS )
end

function SetButtonPromptDisabled( menu, enumValue )
	menu:SetButtonPromptState( enumValue, Enum.LUIButtonPromptStates.FLAG_DISABLE_PROMPTS )
end

function SetButtonPromptHidden( menu, enumValue )
	menu:SetButtonPromptState( enumValue, Enum.LUIButtonPromptStates.FLAG_HIDE_PROMPTS )
end

function UpdateButtonPromptState( menu, element, controller, enumValue )
	CoD.Menu.UpdateButtonShownState( element, menu, controller, enumValue )
end

function SendButtonPressToSiblingMenu( menu, siblingMenuName, controller, model, enumValue )
	local siblingMenu = menu:getParent()
	siblingMenu = siblingMenu and siblingMenu[siblingMenuName]
	if siblingMenu then
		CoD.Menu.HandleButtonPress( siblingMenu, controller, enumValue, model )
	end
end

function SendButtonPressToOccludedMenu( menu, controller, model, enumValue )
	local occludedMenu = menu.occludedMenu
	if occludedMenu then
		CoD.Menu.HandleButtonPress( occludedMenu, controller, enumValue, model )
	end
end

function SendButtonPressToMenu( menu, controller, model, enumValue )
	CoD.Menu.HandleButtonPress( menu, controller, enumValue, model )
end

function SendButtonPressToMenuEx( menu, controller, enumValue )
	local buttonBitModel = Engine.GetModel( Engine.GetModelForController( controller ), "ButtonBits." .. enumValue )
	if buttonBitModel then
		Engine.SetModelValue( buttonBitModel, Enum.LUIButtonFlags.FLAG_DOWN )
		Engine.SetModelValue( buttonBitModel, 0 )
	end
end

function SetProperty( self, propertyName, expressionArg )
	self[propertyName] = expressionArg
end

function SetElementProperty( element, propertyName, expressionArg )
	element[propertyName] = expressionArg
end

function ForceNotifyModel( controller, modelName )
	Engine.ForceNotifyModelSubscriptions( Engine.GetModel( Engine.GetModelForController( controller ), modelName ) )
end

function ForceNotifyElementModel( element, modelName )
	if element == nil then
		return 
	end
	local elementModel = element:getModel()
	if elementModel == nil then
		return 
	end
	local model = elementModel[modelName]
	if model ~= nil then
		Engine.ForceNotifyModelSubscriptions( model )
	end
end

function SetControllerModelValue( controller, modelName, expressionArg )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), modelName ), expressionArg )
end

function ToggleControllerModelValueBoolean( controller, modelName )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelName )
	Engine.SetModelValue( model, not Engine.GetModelValue( model ) )
end

function ToggleControllerModelValueNumber( controller, modelName )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelName )
	Engine.SetModelValue( model, 1 - Engine.GetModelValue( model ) )
end

function SetControllerModelValueNumberIncrement( controller, modelName, expressionArg_maxValue )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelName )
	local newValue = Engine.GetModelValue( model ) + 1
	if expressionArg_maxValue then
		newValue = math.min( newValue, expressionArg_maxValue )
	end
	Engine.SetModelValue( model, newValue )
end

function SetControllerModelValueNumberDecrement( controller, modelName, expressionArg_minValue )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelName )
	local newValue = Engine.GetModelValue( model ) - 1
	if expressionArg_minValue then
		newValue = math.max( newValue, expressionArg_minValue )
	end
	Engine.SetModelValue( model, newValue )
end

function SetMenuModelValue( menu, modelName, expressionArg )
	Engine.SetModelValue( Engine.GetModel( menu:getModel(), modelName ), expressionArg )
end

function ToggleGlobalModelValueBoolean( modelName )
	local model = Engine.CreateModel( Engine.GetGlobalModel(), modelName )
	Engine.SetModelValue( model, not Engine.GetModelValue( model ) )
end

function SetGlobalModelValueTrue( modelName )
	local model = Engine.CreateModel( Engine.GetGlobalModel(), modelName )
	Engine.SetModelValue( model, true )
end

function SetGlobalModelValueFalse( modelName )
	local model = Engine.CreateModel( Engine.GetGlobalModel(), modelName )
	Engine.SetModelValue( model, false )
end

function SetGlobalModelValue( modelName, modelValue )
	local model = Engine.CreateModel( Engine.GetGlobalModel(), modelName )
	Engine.SetModelValue( model, modelValue )
end

function SetGlobalModelValueArg( modelName, expressionArg )
	local model = Engine.CreateModel( Engine.GetGlobalModel(), modelName )
	Engine.SetModelValue( model, expressionArg )
end

function SetElementModelValue( element, modelName, expressionArg )
	Engine.SetModelValue( Engine.GetModel( element:getModel(), modelName ), expressionArg )
end

function DispatchEventToChildren( element, eventName, controller )
	return element:dispatchEventToChildren( {
		name = eventName,
		controller = controller
	} )
end

function DispatchEventToRoot( element, eventName, controller )
	return element:dispatchEventToRoot( {
		name = eventName,
		controller = controller
	} )
end

function SetPerControllerTableProperty( controller, propertyName, expressionArg )
	CoD.perController[controller][propertyName] = expressionArg
end

function SetPrimaryControllerPerControllerTableProperty( propertyName, expressionArg )
	local primaryController = Engine.GetPrimaryController()
	CoD.perController[primaryController][propertyName] = expressionArg
end

function SetPerControllerTablePropertyEnum( controller, propertyName, enumValue )
	CoD.perController[controller][propertyName] = enumValue
end

function SetElementModelOnPerControllerTable( controller, propertyName, element, elementModelName )
	local value = nil
	local elementModel = element:getModel( controller, elementModelName )
	if elementModel then
		value = Engine.GetModelValue( elementModel )
	end
	CoD.perController[controller][propertyName] = value
end

function SetElementSubModelOnPerControllerTable( controller, propertyName, element, elementModelName )
	CoD.perController[controller][propertyName] = element:getModel( controller, elementModelName )
end

function CopyElementModelToPerControllerTable( controller, propertyName, element )
	CoD.perController[controller][propertyName] = element:getModel()
end

function SetElementPropertyOnPerControllerTable( controller, propertyName, element, elementProperty )
	CoD.perController[controller][propertyName] = element[elementProperty]
end

function SetModelFromPerControllerTable( controller, self, propertyName )
	self:setModel( CoD.perController[controller][propertyName] )
end

function CopyElementToPerControllerTable( controller, element, propertyName )
	CoD.perController[controller][propertyName] = element
end

function SendClientScriptNotify( controller, notifyName, param1 )
	Engine.SendClientScriptNotify( controller, notifyName, {
		param1 = param1
	} )
end

function SendClientScriptNotifyForAdjustedClient( controller, notifyName, param1 )
	Engine.SendClientScriptNotify( controller, notifyName, {
		param1 = param1 .. CoD.GetLocalClientAdjustedNum( controller )
	} )
end

function SendCustomClientScriptNotify( controller, notifyName, ... )
	Engine.SendClientScriptNotify( controller, notifyName, ... )
end

function SendCustomClientScriptNotifyForAdjustedClient( controller, notifyName, ... )
	Engine.SendClientScriptNotify( controller, notifyName .. CoD.GetLocalClientAdjustedNum( controller ), ... )
end

function SendClientScriptEnumNotify( controller, notifyName, enumValue )
	Engine.SendClientScriptNotify( controller, notifyName, enumValue )
end

function SendClientScriptEnumNotifyForAdjustedClient( controller, notifyName, enumValue )
	Engine.SendClientScriptNotify( controller, notifyName .. CoD.GetLocalClientAdjustedNum( controller ), enumValue )
end

function SendClientScriptEnumNotifyTwoParam( controller, notifyName, param1, enumValue )
	Engine.SendClientScriptNotify( controller, notifyName, param1, enumValue )
end

function SendClientScriptCustomPropertyNotify( controller, element, notifyName, property, ... )
	if element[property] then
		Engine.SendClientScriptNotify( controller, notifyName, element[property], ... )
	end
end

function SendClientScriptPropertyNotify( controller, element, notifyName, property )
	if element[property] then
		Engine.SendClientScriptNotify( controller, notifyName, element[property] )
	end
end

function SendClientScriptPropertyNotifyForAdjustedClient( controller, element, notifyName, property )
	if element[property] then
		Engine.SendClientScriptNotify( controller, notifyName .. CoD.GetLocalClientAdjustedNum( controller ), element[property] )
	end
end

function SendClientScriptPropertyNotifyTwoParam( controller, element, notifyName, param1, property )
	if element[property] then
		Engine.SendClientScriptNotify( controller, notifyName, param1, element[property] )
	end
end

function SendClientScriptPropertyNotifyForAdjustedClientTwoParam( controller, element, notifyName, param1, property )
	if element[property] then
		Engine.SendClientScriptNotify( controller, notifyName .. CoD.GetLocalClientAdjustedNum( controller ), param1, element[property] )
	end
end

function SendClientScriptModelNotify( controller, element, notifyName, modelName )
	local eModel = element:getModel( controller, modelName )
	if eModel then
		Engine.SendClientScriptNotify( controller, notifyName, Engine.GetModelValue( eModel ) )
	end
end

function SendClientScriptModelNotifyTwoParam( controller, element, notifyName, param1, modelName )
	local eModel = element:getModel( controller, modelName )
	if eModel then
		Engine.SendClientScriptNotify( controller, notifyName, param1, Engine.GetModelValue( eModel ) )
	end
end

function SendClientScriptModelNotifyForAdjustedClientTwoParam( controller, element, notifyName, param1, modelName )
	local eModel = element:getModel( controller, modelName )
	if eModel then
		Engine.SendClientScriptNotify( controller, notifyName .. CoD.GetLocalClientAdjustedNum( controller ), param1, Engine.GetModelValue( eModel ) )
	end
end

function SendClientScriptMultiModelNotify( controller, element, notifyName, ... )
	local models = {}
	for _, item in ipairs( {
		n = select( "#", ... ),
		...
	} ) do
		local eModel = element:getModel( controller, item )
		if not eModel then
			return 
		end
		table.insert( models, Engine.GetModelValue( eModel ) )
	end
	Engine.SendClientScriptNotify( controller, notifyName, table.unpack( models ) )
end

function SendClientScriptMultiModelNotifyTwoParam( controller, element, notifyName, param1, ... )
	local models = {}
	for _, item in ipairs( {
		n = select( "#", ... ),
		...
	} ) do
		local eModel = element:getModel( controller, item )
		if not eModel then
			return 
		end
		table.insert( models, Engine.GetModelValue( eModel ) )
	end
	Engine.SendClientScriptNotify( controller, notifyName, param1, table.unpack( models ) )
end

function SendClientScriptCustomNotify( controller, ... )
	Engine.SendClientScriptNotify( controller, ... )
end

function SendClientScriptMenuChangeNotify( controller, menu, booleanArg )
	SendClientScriptMenuChangeNotifyHelper( controller, menu.menuName, booleanArg )
end

function SendCustomClientScriptMenuChangeNotify( controller, name, booleanArg )
	SendClientScriptMenuChangeNotifyHelper( controller, name, booleanArg )
end

function SendClientScriptMenuStateChangeNotify( controller, menu, booleanArg, state )
	SendClientScriptMenuChangeNotifyHelper( controller, menu.menuName, booleanArg, state )
end

function SendCustomClientScriptMenuStateChangeNotify( controller, name, booleanArg, state )
	SendClientScriptMenuChangeNotifyHelper( controller, name, booleanArg, state )
end

function CallCustomElementFunction_Self( self, functionName, ... )
	local vargs = {
		n = select( "#", ... ),
		...
	}
	if self[functionName] then
		if not vargs or #vargs == 1 and vargs[1] == nil then
			self[functionName]( self )
		else
			self[functionName]( self, ... )
		end
	end
end

function CallCustomElementFunction_Element( element, functionName, ... )
	if element[functionName] then
		element[functionName]( element, ... )
	end
end

function SetProfileVar( controller, profileVarName, expressionArg )
	Engine.SetProfileVar( controller, profileVarName, expressionArg )
end

function SetupDynamicContainer( self )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		local child = self:getFirstChild()
		while child ~= nil do
			local nextChild = child:getNextSibling()
			child:close()
			child = nextChild
		end
	end )
end

function OpenGameSettingsOptionsMenu( self, element, controller, menu )
	CoD.perController[controller].selectedGameSettingElement = element
	menu:saveState()
	OpenPopup( menu, "GameSettings_OptionsMenu", controller )
end

function ResetGameSettings()
	Engine.SetGametype( Engine.GetDvarString( "ui_gametype" ) )
	Engine.SetDvar( "bot_maxFree", 0 )
	Engine.SetDvar( "bot_maxAllies", 0 )
	Engine.SetDvar( "bot_maxAxis", 0 )
	Engine.SetDvar( "bot_difficulty", 1 )
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings.Update" ) )
end

function ResetSelectedGameSetting( self, element, controller, param )
	local selectedElement = CoD.perController[controller].selectedGameSettingElement
	if selectedElement and selectedElement.revert then
		selectedElement:revert()
	end
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings.Update" ) )
end

function CloseTeamSettingsButtons( self, element, menu, controller )
	local createAClassEditSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "CreateAClassEditSettingsName" )
	local nameModel = Engine.CreateModel( createAClassEditSettingsModel, "name" )
	Engine.SetModelValue( nameModel, "MENU_CREATE_A_CLASS_SETTINGS" )
end

function GameSettingsMenuClosed( self, controller )
	if CoD.perController[controller].editingPresetClass then
		Engine.StopEditingPresetClass()
		CoD.perController[controller].isPreset = nil
	end
end

function ButtonListFocused( self, element, controller )
	if element.isClassButton then
		local perControllerData = CoD.perController[controller]
		perControllerData.classNum = element.actionParam
		perControllerData.isPreset = true
		perControllerData.weaponSlot = nil
		perControllerData.grenadeSlot = nil
		perControllerData.perkCategory = nil
		perControllerData.slotIndex = nil
	end
end

function GameSettingsButtonGainFocus( self, element, controller )
	CoD.OptionsUtility.UpdateInfoModels( element )
end

function OpenGameSettings_GameMode( self, element, controller, param, menu )
	menu:saveState()
	OpenOverlay( menu, "GameSettings_EditModeSpecificOptions", controller )
end

function OpenGameSettings_General( self, element, controller, param, menu )
	menu:saveState()
	OpenOverlay( menu, "GameSettings_GeneralSettings", controller )
end

function OpenGameSettings_Spawn( self, element, controller, param, menu )
	menu:saveState()
	OpenOverlay( menu, "GameSettings_SpawnSettings", controller )
end

function OpenGameSettings_HealthAndDamage( self, element, controller, param, menu )
	menu:saveState()
	OpenOverlay( menu, "GameSettings_HealthAndDamageSettings", controller )
end

function OpenGameSettings_Competitive( self, element, controller, param, menu )
	menu:saveState()
	OpenOverlay( menu, "GameSettings_Competitive", controller )
end

function OpenGameSettings_CreateAClass( self, element, controller, param, menu )
	menu:saveState()
	OpenOverlay( menu, "GameSettings_CreateAClassSettings", controller )
end

function PlaySoundSetSound( self, soundSetElem )
	self:playSound( soundSetElem )
end

function PlayMenuMusic( musicAlias )
	Engine.PlayMenuMusic( musicAlias )
end

function PlaySoundAlias( soundAlias )
	Engine.PlaySound( soundAlias )
end

function PlaySoundFromElementModel( controller, element, modelPath )
	local alias = CoD.SafeGetModelValue( element:getModel(), modelPath )
	if alias and alias ~= "" then
		Engine.PlaySound( alias )
	end
end

function StopSoundAlias( soundAlias )
	Engine.StopSound( soundAlias )
end

function StopSoundFromElementModel( controller, element, modelPath )
	local alias = CoD.SafeGetModelValue( element:getModel(), modelPath )
	if alias and alias ~= "" then
		Engine.StopSound( alias )
	end
end

function PlayMPMusicPreview( controller, element )
	local alias = CoD.SafeGetModelValue( element:getModel(), "alias" )
	if alias and alias ~= "" then
		CoD.StopFrontendMusic()
		Engine.PlaySound( alias )
		if not element.soundTimer then
			element.soundTimer = LUI.UITimer.newElementTimer( Engine.GetSoundPlaybackTime( alias ), true, function ()
				StopMPMusicPreview( controller, element )
			end )
			element:addElement( element.soundTimer )
		else
			element.soundTimer:reset()
		end
	end
end

function StopMPMusicPreview( controller, element )
	local alias = CoD.SafeGetModelValue( element:getModel(), "alias" )
	if alias and alias ~= "" then
		Engine.StopSound( alias )
		CoD.ResetFrontendMusic()
		if element.soundTimer then
			element.soundTimer:close()
			element.soundTimer = nil
		end
	end
end

function UpdateModel( self, element, controller )
	self:setModel( element:getModel() )
end

function UpdateElementModelToFocusedElementModel( self, element, elementName, event )
	if self[elementName] then
		local focusedElement = self
		for index, value in pairs( event.idStack ) do
			if value ~= self.id then
				focusedElement = focusedElement[value]
			end
		end
		if focusedElement and focusedElement.id == event.id then
			self[elementName]:setModel( focusedElement:getModel() )
		end
	end
end

function SetElementModelToFocusedElementModel( self, element, elementName )
	local elementModel = element:getModel()
	if self[elementName] and elementModel then
		self[elementName]:setModel( elementModel )
	end
end

function SetElementModelToSelfModelValue( self, element, controller, modelName )
	local f98_local0 = self:getModel()
	local model = f98_local0[modelName]
	if model then
		local modelValue = model:get()
		if type( modelValue ) == "userdata" then
			element:setModel( modelValue )
		end
	end
end

function CreateModelOnSelfModel( self, element, modelName )
	local model = element:getModel( controller, modelName )
	if model ~= nil then
		Engine.CreateModel( model, modelName )
	end
end

function SetSelfModelValue( self, element, controller, modelName, expressionArg )
	local model = element:getModel( controller, modelName )
	if model ~= nil then
		Engine.SetModelValue( model, expressionArg )
	end
end

function ToggleSelfModelValueNumber( self, element, controller, modelName )
	local model = element:getModel( controller, modelName )
	if model ~= nil then
		Engine.SetModelValue( model, 1 - Engine.GetModelValue( model ) )
	end
end

function ToggleSelfModelBoolean( self, element, controller, modelName )
	local model = element:getModel( controller, modelName )
	if model ~= nil then
		Engine.SetModelValue( model, not Engine.GetModelValue( model ) )
	end
end

function ForceNotifyGlobalModel( controller, modelName )
	Engine.ForceNotifyModelSubscriptions( Engine.GetModel( Engine.GetGlobalModel(), modelName ) )
end

function ForceNotifyControllerModel( controller, modelPath )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
	if model then
		Engine.ForceNotifyModelSubscriptions( model )
	end
end

function DataSourceHelperRecreate( controller, dataSourceName )
	DataSources[dataSourceName].recreate( controller )
end

function DataSourceHelperInvalidate( controller, dataSourceName )
	DataSources[dataSourceName].invalidate( controller )
end

function ShowKeyboard( self, element, controller, keyboardName )
	Engine.Exec( controller, "ui_keyboard_new " .. Enum.KeyboardType[keyboardName] )
end

function RunClientDemo( self, element, controller )
	local index = element.gridInfoTable.zeroBasedIndex + 1
	local model = element:getModel( controller, "fileName" )
	local fileName = Engine.GetModelValue( model )
	Engine.Exec( controller, "cl_demo_play " .. fileName )
end

function SetPrimary( self, controller )
	Engine.ExecNow( controller, "setclientbeingusedandprimary" )
end

function SwitchToMainMenu( self, controller )
	Engine.SessionModeResetModes()
	if CoD.isPS3 then
		Engine.Exec( controller, "signoutSubUsers" )
	end
end

function SwitchToSystemLinkLobby( self, controller )
	Engine.ExecNow( controller, "disableallclients" )
	Engine.ExecNow( controller, "setclientbeingusedandprimary" )
	SwitchLobbies_InitializeLobby( controller, Engine.GetDvarInt( "party_maxplayers_systemlink" ), Engine.GetDvarInt( "party_maxlocalplayers_systemlink" ), false )
	Engine.SessionModeSetOnlineGame( false )
	Engine.SessionModeSetSystemLink( true )
	Engine.ExecNow( controller, "exec gamedata/configs/common/default_private.cfg" )
	Engine.SetGametype( SwitchLobbies_GetGametype( controller ) )
	Engine.ExecNow( controller, "ui_mapname " .. SwitchLobbies_GetMap( controller ) )
	Dvar.party_maxplayers:set( Dvar.party_maxplayers_systemlink:get() )
end

function RefreshLobbyGameClient( self, controller )
	local gameClientUpdateModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.gameClient.update" )
	local update = Engine.GetModelValue( gameClientUpdateModel )
	if update == 0 then
		update = 1
	else
		update = 0
	end
	Engine.SetModelValue( gameClientUpdateModel, update )
end

function ShowHeaderIconOnly( menu )
	menu.showHeaderKicker = false
	menu.showHeaderIcon = true
end

function ShowHeaderKickerAndIcon( menu )
	menu.showHeaderKicker = true
	menu.showHeaderIcon = true
end

function SetHeadingKickerText( newValue )
	local headingKickerTextModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerText" )
	if headingKickerTextModel then
		Engine.SetModelValue( headingKickerTextModel, Engine.Localize( newValue ) )
	end
end

function SetHeadingKickerTextToGameMode()
	if CoD.PrestigeUtility.isInPermanentUnlockMenu then
		SetHeadingKickerText( "MENU_PERMANENT_UNLOCKS" )
		return 
	elseif PregameActive() then
		SetHeadingKickerText( GetGameMode() )
		return 
	end
	local modeModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerMode" )
	local textModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerText" )
	if textModel then
		local f116_local0 = Engine.SetModelValue
		local f116_local1 = textModel
		local f116_local2
		if modeModel then
			f116_local2 = Engine.GetModelValue( modeModel )
			if not f116_local2 then
			
			else
				f116_local0( f116_local1, f116_local2 )
			end
		end
		f116_local2 = ""
	end
end

function SetHeadingKickerTextToSelectedWeapon( controller )
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	local textModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerText" )
	if textModel and weaponIndex ~= CoD.CACUtility.EmptyItemIndex then
		local weapon_ref = Engine.GetItemRef( weaponIndex )
		local weaponName = Engine.ToUpper( Engine.Localize( Engine.GetItemName( weaponIndex ) ) )
		if textModel and weaponName then
			Engine.SetModelValue( textModel, weaponName )
		end
	end
end

function ForceLobbyButtonUpdate( controller )
	LuaUtils.ForceLobbyButtonUpdate()
end

function SetButtonRecentlySelected( self, element, controller )
	if element ~= nil and element.id ~= nil then
		CoD.LobbyMenus.UpdateHistory( controller, element.id )
	end
end

function OpenChangeRankedSettingsPopup( self, element, controller, param, menu )
	CoD.OverlayUtility.AddSystemOverlay( "ChangeRankedSettingsPopup", {
		menuName = "SystemOverlay_Compact",
		title = "MENU_CHANGE_RANKED_SETTINGS_CAPS",
		description = "MENU_CHANGE_RANKED_SETTINGS_DESC",
		listDatasource = function ()
			DataSources.ChangeRankedSettingssPopup_List = DataSourceHelpers.ListSetup( "ChangeRankedSettingssPopup_List", function ( controller )
				local f122_local0 = {}
				local f122_local1 = {
					models = {
						displayText = "MENU_NON_RANKED_GAME_CAPS"
					}
				}
				local f122_local2 = {
					action = function ( self, element, controller, actionParam, menu )
						if Dvar.zm_private_rankedmatch:exists() then
							Dvar.zm_private_rankedmatch:set( false )
							Engine.SetProfileVar( controller, "com_privategame_ranked_zm", 0 )
							Engine.Exec( controller, "updategamerprofile" )
						end
						GoBack( menu, controller )
					end
				}
				local f122_local3 = Dvar.zm_private_rankedmatch:exists()
				if f122_local3 then
					f122_local3 = Dvar.zm_private_rankedmatch:get() == false
				end
				f122_local2.selectIndex = f122_local3
				f122_local1.properties = f122_local2
				f122_local2 = {
					models = {
						displayText = "MENU_RANKED_GAME_CAPS"
					}
				}
				f122_local3 = {
					action = function ( self, element, controller, actionParam, menu )
						if Dvar.zm_private_rankedmatch:exists() then
							Dvar.zm_private_rankedmatch:set( true )
							Engine.SetProfileVar( controller, "com_privategame_ranked_zm", 1 )
							Engine.Exec( controller, "updategamerprofile" )
						end
						GoBack( menu, controller )
					end
				}
				local f122_local4 = Dvar.zm_private_rankedmatch:exists()
				if f122_local4 then
					f122_local4 = Dvar.zm_private_rankedmatch:get() == true
				end
				f122_local3.selectIndex = f122_local4
				f122_local2.properties = f122_local3
				f122_local0[1] = f122_local1
				f122_local0[2] = f122_local2
				return f122_local0
			end, true, nil )
			return "ChangeRankedSettingssPopup_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage
	} )
	CoD.OverlayUtility.CreateOverlay( controller, self, "ChangeRankedSettingsPopup" )
end

function UpdateQuickJoinFocus( self, element )
	if self.currentState == "ShowQuickJoin" then
		self.friendsAndGroups:makeFocusableWithoutResettingNavigation()
	else
		self.friendsAndGroups:makeNotFocusable()
	end
end

function SetPlayerReady( self, element, controller )
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
	local readyUp = Engine.GetReadyUp( Enum.LobbyModule.LOBBY_MODULE_CLIENT, lobbyType, controller )
	Engine.SetReadyUp( controller, lobbyType, not readyUp )
end

function RefreshServerList( self, controller )
	Engine.LobbyServerRefreshLocalServers( controller )
end

function JoinSystemLinkServer( self, element, controller )
	if not element.gridInfoTable then
		return 
	end
	local index = element.gridInfoTable.zeroBasedIndex
	local serverModel = Engine.CreateModel( Engine.GetGlobalModel(), "serverListRoot" )
	local selectedServerModel = Engine.CreateModel( serverModel, "server" .. tostring( index ) )
	local sessionModeModel = Engine.CreateModel( selectedServerModel, "sessionMode" )
	local sessionMode = Engine.GetModelValue( sessionModeModel )
	local maxLocalClients = nil
	if sessionMode == Enum.eModes.MODE_CAMPAIGN then
		if not Engine.IsFirstTimeComplete( controller, Enum.eModes.MODE_CAMPAIGN ) then
			CoD.OverlayUtility.CreateOverlay( controller, self, "CompleteCPFirstTimeFlow" )
			return 
		end
		local f128_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP )
		maxLocalClients = f128_local0.maxLocalClientsNetwork
	elseif sessionMode == Enum.eModes.MODE_MULTIPLAYER then
		local f128_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_MP )
		maxLocalClients = f128_local0.maxLocalClientsNetwork
	elseif sessionMode == Enum.eModes.MODE_ZOMBIES then
		local f128_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_ZM )
		maxLocalClients = f128_local0.maxLocalClientsNetwork
	end
	if maxLocalClients == nil then
		maxLocalClients = 1
	end
	local lobbyServerListJoinServer = function ( data )
		if data then
			Engine.LobbyServerListJoinServer( data.controller, data.index )
		end
	end
	
	if maxLocalClients < Engine.GetUsedControllerCount() then
		local data = {
			controller = controller,
			navToMenu = nil,
			popupName = nil,
			openFromMenu = nil,
			actionFunc = lobbyServerListJoinServer,
			index = index
		}
		CoD.OverlayUtility.CreateOverlay( controller, self, "LobbyLocalClientWarning", data )
		return 
	end
	lobbyServerListJoinServer( {
		controller = controller,
		index = index
	} )
end

function LobbyLANServerPlayerListRefresh( self, element, controller )
	local index = element.gridInfoTable.zeroBasedIndex
	local serverModel = Engine.CreateModel( Engine.GetGlobalModel(), "serverPlayerListRoot" )
	local selectedServerModel = Engine.CreateModel( serverModel, "selectedServer" )
	Engine.SetModelValue( selectedServerModel, index )
	if self.LANServerBrowserDetails and self.LANServerBrowserDetails.PlayerList then
		self.LANServerBrowserDetails.PlayerList:updateDataSource()
	end
end

function UploadStats( self, controller )
	Engine.Exec( controller, "uploadstats" )
	Engine.Exec( controller, "savegamerprofilestats" )
end

function SaveLoadout( self, controller )
	local customizationMode = CoD.PlayerRoleUtility.customizationMode
	if not customizationMode then
		customizationMode = CoD.PrestigeUtility.GetPermanentUnlockMode()
	end
	local characterIndex = Engine.GetCharacterIndexForClientNum( controller, Engine.GetClientNum( controller ) )
	if characterIndex ~= nil then
		Engine.SetHero( controller, customizationMode, characterIndex )
		Engine.Exec( controller, "saveLoadout " .. customizationMode )
	end
end

function SaveLoadoutGeneric( controller )
	local customizationMode = CoD.PlayerRoleUtility.customizationMode
	if not customizationMode then
		customizationMode = CoD.PrestigeUtility.GetPermanentUnlockMode()
	end
	Engine.Exec( controller, "saveLoadout " .. customizationMode )
end

function ChangeCharacter( self, element, controller, expressionArg )
	Engine.SendMenuResponse( controller, CoD.CACUtility.PositionDraftMenuName, "changecharacter" )
	local f134_local0 = Engine.GetModelForController( controller )
	f134_local0 = f134_local0:create( "PositionDraft.focusedCharacterIndex" )
	f134_local0:set( 0 )
	f134_local0 = Engine.GetModelForController( controller )
	f134_local0 = f134_local0:create( "PositionDraft.focusedCharacterWeapon" )
	f134_local0:set( "" )
	Engine.SendClientScriptNotify( controller, "PositionDraft_Update" )
end

function PositionDraftOnFocusCharacter( self, element, controller )
	local weaponName = ""
	local classIndex = Engine.GetPostionRoleCustomClassIndex( Engine.CurrentSessionMode(), element.characterIndex )
	if classIndex and classIndex >= 0 then
		local customClass = Engine.GetCustomClass( controller, classIndex )
		if customClass then
			local itemIndex = customClass.primary
			if itemIndex then
				local itemInfo = Engine.GetUnlockableInfoByIndex( itemIndex, Engine.CurrentSessionMode() )
				if itemInfo then
					weaponName = itemInfo.ref
				end
			end
		end
	end
	local f135_local0 = Engine.GetModelForController( controller )
	f135_local0 = f135_local0:create( "PositionDraft.focusedCharacterIndex" )
	f135_local0:set( element.characterIndex )
	f135_local0 = Engine.GetModelForController( controller )
	f135_local0 = f135_local0:create( "PositionDraft.focusedCharacterWeapon" )
	f135_local0:set( weaponName )
	Engine.SendClientScriptNotify( controller, "PositionDraft_Update" )
end

function PositionDraftOnFocusCharacterLost( self, element, controller, expressionArg )
	if not (not element or element.gridInfoTable == nil or element.gridInfoTable.parentGrid.activeWidget ~= element) or expressionArg == true then
		local f136_local0 = Engine.GetModelForController( controller )
		f136_local0 = f136_local0:create( "PositionDraft.focusedCharacterIndex" )
		f136_local0:set( 0 )
		f136_local0 = Engine.GetModelForController( controller )
		f136_local0 = f136_local0:create( "PositionDraft.focusedCharacterWeapon" )
		f136_local0:set( "" )
		Engine.SendClientScriptNotify( controller, "PositionDraft_Update" )
	end
end

function PositionDraftSelectCharacter( self, element, controller )
	local f137_local0 = element:getModel()
	f137_local0 = f137_local0:create( "disabled" )
	if f137_local0:get() == false then
		Engine.SendMenuResponse( controller, CoD.CACUtility.PositionDraftMenuName, "draft" .. element.characterIndex )
		f137_local0 = Engine.GetModelForController( controller )
		f137_local0 = f137_local0:create( "PositionDraft.focusedCharacterIndex" )
		f137_local0:set( 0 )
		f137_local0 = Engine.GetModelForController( controller )
		f137_local0 = f137_local0:create( "PositionDraft.focusedCharacterWeapon" )
		f137_local0:set( "" )
	end
end

function PositionDraftOnLoadoutChanged( self, element, controller )
	local weaponName = ""
	local characterIndex = GetCharacterIndexForClientNum( controller, Engine.GetClientNum( controller ) )
	if characterIndex and characterIndex >= 0 then
		local customClass = Engine.GetCustomClass( controller, characterIndex )
		if customClass then
			local itemIndex = customClass.primary
			if itemIndex then
				local itemInfo = Engine.GetUnlockableInfoByIndex( itemIndex, Engine.CurrentSessionMode() )
				if itemInfo then
					weaponName = itemInfo.ref
				end
			end
		end
	end
	Engine.SendClientScriptNotify( controller, "PositionDraft_FocusCharacter", {
		character_index = characterIndex,
		weapon = weaponName
	} )
end

function CustomGameSettingsMenuClosed( self, controller )
	Engine.LobbyEvent( "OnGametypeSettingsChange", {
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyModule = Enum.LobbyModule.LOBBY_MODULE_HOST
	} )
	Engine.LobbyHostSessionSetDirty( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionDirty.SESSION_DIRTY_STATE )
end

function OpenCACItemBansRestrictionsFlyout( self, element, controller )
	SetGlobalModelValueTrue( "lobbyRoot.ShowCACItemBansRestrictionFlyout" )
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.ShowCACItemBansRestrictionFlyout" ) )
end

function AdjustGameSettingsTab( self, element, controller, param )
	local gametypeSettingsModel = Engine.GetModel( Engine.GetModelForController( controller ), "GametypeSettings" )
	local selectedTabModel = Engine.CreateModel( gametypeSettingsModel, "selectedTab" )
	local tabIndex = Engine.GetModelValue( selectedTabModel )
	local tabCount = Engine.GetModelValue( Engine.CreateModel( gametypeSettingsModel, "tabCount" ) )
	local nextFilter = tabIndex + tonumber( param )
	if tabCount < nextFilter then
		nextFilter = 1
	end
	if nextFilter < 1 then
		nextFilter = tabCount
	end
	Engine.SetModelValue( selectedTabModel, nextFilter )
end

function AdjustCompetitiveItemSettingsFilter( self, element, controller, param )
	local gametypeSettingsModel = Engine.GetModel( Engine.GetModelForController( controller ), "GametypeSettings" )
	local selectedItemSettingGroupModel = Engine.CreateModel( gametypeSettingsModel, "selectedItemSettingGroup" )
	local currentFilterIndex = Engine.GetModelValue( selectedItemSettingGroupModel )
	local selectedItemSettingGroupCountModel = Engine.CreateModel( gametypeSettingsModel, "selectedItemSettingGroupCount" )
	local selectedItemSettingGroupCount = Engine.GetModelValue( selectedItemSettingGroupCountModel )
	local nextFilter = currentFilterIndex + tonumber( param )
	if selectedItemSettingGroupCount < nextFilter then
		nextFilter = 1
	end
	if nextFilter < 1 then
		nextFilter = selectedItemSettingGroupCount
	end
	Engine.SetModelValue( selectedItemSettingGroupModel, nextFilter )
end

function ToggleCompetitiveAttachmentSettingsTab( self, element, controller )
	local gametypeSettingsModel = Engine.GetModel( Engine.GetModelForController( controller ), "GametypeSettings" )
	local selectedAttachmentTabModel = Engine.CreateModel( gametypeSettingsModel, "selectedAttachmentTab" )
	local selectedAttachmentTab = Engine.GetModelValue( selectedAttachmentTabModel )
	local nextTab = 1
	if selectedAttachmentTab == 1 then
		nextTab = 2
	end
	Engine.SetModelValue( selectedAttachmentTabModel, nextTab )
end

function UpdateSelectedGametypeSettingModels( self, element, controller )
	local gametypeSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
	local elementModel = element:getModel()
	local titleModel = Engine.CreateModel( gametypeSettingsModel, "title" )
	local title = Engine.GetModelValue( Engine.GetModel( elementModel, "title" ) )
	Engine.SetModelValue( titleModel, title )
	local descriptionModel = Engine.CreateModel( gametypeSettingsModel, "description" )
	local description = Engine.GetModelValue( Engine.GetModel( elementModel, "description" ) )
	Engine.SetModelValue( descriptionModel, description )
	local imageModel = Engine.CreateModel( gametypeSettingsModel, "image" )
	local image = Engine.GetModelValue( Engine.GetModel( elementModel, "image" ) )
	Engine.SetModelValue( imageModel, image )
end

function OpenAttachmentRestrictionPopup( self, element, controller, menu )
	menu:saveState()
	CoD.OverlayUtility.CreateOverlay( controller, self, "RestrictedAttachmentMenu", controller, element )
end

function CharacterDraftLoadoutSelected( self, element, controller )
	if not CharacterDraftActive() then
		return 
	else
		local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
		local mode = CoD.PlayerRoleUtility.customizationMode
		local selectedCharacter = Engine.GetEquippedHero( controller, mode )
		Engine.SendCharacterDraftSelection( controller, lobbyType, selectedCharacter, Engine.GetLoadoutTypeForHero( controller, selectedCharacter ) )
	end
end

function ForceNotifyPregameUpdate( self, element, controller )
	local pregameUpdateModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
	Engine.ForceNotifyModelSubscriptions( pregameUpdateModel )
end

function SetPregameEditIncomplete( controller )
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
	Engine.SendPregameEditComplete( controller, lobbyType, false )
end

function AdjustPregameVoteFilter( self, element, controller, param )
	local pregameModel = Engine.GetModel( Engine.GetModelForController( controller ), "Pregame" )
	local voteFilterModel = Engine.CreateModel( pregameModel, "voteFilter" )
	local currentFilterIndex = Engine.GetModelValue( voteFilterModel )
	local nextFilter = currentFilterIndex + tonumber( param )
	if nextFilter > #CoD.CACUtility.PregameLoadoutFilters then
		nextFilter = 1
	end
	if nextFilter < 1 then
		nextFilter = #CoD.CACUtility.PregameLoadoutFilters
	end
	Engine.SetModelValue( voteFilterModel, nextFilter )
end

function ToggleRestrictedContentEquippedFilter( controller )
	local pregameModel = Engine.GetModel( Engine.GetModelForController( controller ), "Pregame" )
	local equippedFilterModel = Engine.CreateModel( pregameModel, "equippedFilter" )
	Engine.SetModelValue( equippedFilterModel, not Engine.GetModelValue( equippedFilterModel ) )
end

function SendItemVote( self, element, controller, enumValue )
	local itemTypeModel = element:getModel( controller, "itemType" )
	local itemType = Engine.GetModelValue( itemTypeModel )
	local itemIndex = -1
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	if itemIndexModel then
		itemIndex = Engine.GetModelValue( itemIndexModel )
	end
	local attachmentIndex = -1
	local attachmentIndexModel = element:getModel( controller, "attachmentIndex" )
	if attachmentIndexModel then
		attachmentIndex = Engine.GetModelValue( attachmentIndexModel )
	end
	local itemGroup = -1
	local itemGroupModel = element:getModel( controller, "itemGroup" )
	if itemGroupModel then
		itemGroup = Engine.GetModelValue( itemGroupModel )
	end
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
	if itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
		Engine.SendItemVote( controller, lobbyType, itemIndex, enumValue )
	elseif itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
		Engine.SendAttachmentVote( controller, lobbyType, attachmentIndex, enumValue )
	elseif itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
		Engine.SendItemAttachmentVote( controller, lobbyType, itemIndex, attachmentIndex, enumValue )
	elseif itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
		Engine.SendItemGroupAttachmentVote( controller, lobbyType, itemGroup, attachmentIndex, enumValue )
	end
end

function VoteBanItem( self, element, controller )
	SendItemVote( self, element, controller, Enum.VoteType.VOTE_TYPE_BAN )
end

function VoteProtectItem( self, element, controller )
	SendItemVote( self, element, controller, Enum.VoteType.VOTE_TYPE_PROTECT )
end

function ShowPregameVoteOptions( self, element, controller )
	CoD.OverlayUtility.AddSystemOverlay( "PregameVoteOptions", {
		menuName = "FeatureOverlay",
		frameWidget = "CoD.Pregame_ItemVote_BanProtectPopup",
		title = "MENU_BAN_PROTECT_CAPS",
		description = function ( controller, selectedListElement )
			local nameModel = selectedListElement:getModel( controller, "name" )
			local name = Engine.GetModelValue( nameModel )
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "Pregame.selectedItemName" ), name )
			local loadoutSlotModel = element:getModel( controller, "loadoutSlot" )
			return "MENU_BAN_PROTECT_DESC"
		end,
		image = function ( controller, selectedListElement )
			local imageModel = selectedListElement:getModel( controller, "image" )
			if imageModel then
				return Engine.GetModelValue( imageModel )
			else
				return ""
			end
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Unlock,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		state = function ( controller, selectedListElement )
			local banned = ItemIsBanned( nil, selectedListElement, controller )
			if banned == true then
				local itemInfo = CoD.CACUtility.GetItemInfoFromElementModel( controller, element:getModel() )
				local gamertag = CoD.CACUtility.GetItemVotedBy( itemInfo )
				Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "Pregame.itemVotedBy" ), gamertag )
				return Enum.VoteType.VOTE_TYPE_BAN
			else
				local protected = ItemIsProtected( nil, selectedListElement, controller )
				if protected == true then
					local itemInfo = CoD.CACUtility.GetItemInfoFromElementModel( controller, element:getModel() )
					local gamertag = CoD.CACUtility.GetItemVotedBy( itemInfo )
					Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "Pregame.itemVotedBy" ), gamertag )
					return Enum.VoteType.VOTE_TYPE_PROTECT
				else
					return Enum.VoteType.VOTE_TYPE_INVALID
				end
			end
		end,
		listDatasource = function ( controller, selectedListElement )
			DataSources.PregameVoteButtons = DataSourceHelpers.ListSetup( "PregameVoteButtons", function ( controller )
				local disabled = false
				if ItemIsBanned( nil, selectedListElement, controller ) then
					disabled = true
				end
				if disabled == false and ItemIsProtected( nil, selectedListElement, controller ) then
					disabled = true
				end
				local result = {
					{
						models = {
							displayText = "MENU_BAN_CAPS",
							disabled = disabled
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								SendItemVote( self, selectedListElement, controller, Enum.VoteType.VOTE_TYPE_BAN )
							end
						}
					},
					{
						models = {
							displayText = "",
							image = "uie_img_t7_menu_doublearrow",
							disabled = disabled
						},
						properties = {
							selectIndex = true
						}
					},
					{
						models = {
							displayText = "MENU_PROTECT_CAPS",
							disabled = disabled or ItemIsInRestrictionState( nil, selectedListElement, controller, Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_BANONLY )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								SendItemVote( self, selectedListElement, controller, Enum.VoteType.VOTE_TYPE_PROTECT )
							end
						}
					}
				}
				return result
			end, nil, nil, function ( controller, list, listModel )
				local pregameUpdateModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
				if list.pregameUpdateSubscription then
					list:removeSubscription( list.pregameUpdateSubscription )
				end
				list.pregameUpdateSubscription = list:subscribeToModel( pregameUpdateModel, function ()
					list:updateDataSource( false, false )
				end, false )
			end )
			return "PregameVoteButtons"
		end
	} )
	local overlay = CoD.OverlayUtility.CreateOverlay( controller, self, "PregameVoteOptions", controller, element )
	local pregameUpdateModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
	overlay:subscribeToModel( pregameUpdateModel, function ()
		overlay:refreshData( controller, element )
	end, false )
end

function ConfirmPregameVotePass( self, element, controller )
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
	CoD.OverlayUtility.AddSystemOverlay( "PregamePassConfirm", {
		menuName = "SystemOverlay_Compact",
		title = "MENU_VOTE_FOREFIT_CAPS",
		description = "MENU_VOTE_FOREFIT_DESC",
		image = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.Alert,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		listDatasource = function ()
			DataSources.PregamePassConfirmButtons = DataSourceHelpers.ListSetup( "PregamePassConfirmButtons", function ( controller )
				return {
					{
						models = {
							displayText = "MENU_VOTE_FORFEIT_CANCEL_CAPS"
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								GoBack( self, controller )
							end
							
						}
					},
					{
						models = {
							displayText = "MENU_VOTE_FORFEIT_CONFIRM_CAPS"
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								Engine.SendItemVote( controller, lobbyType, 0, Enum.VoteType.VOTE_TYPE_INVALID )
								GoBack( menu, controller )
							end
							
						}
					}
				}
			end, true, nil )
			return "PregamePassConfirmButtons"
		end
	} )
	CoD.OverlayUtility.CreateOverlay( controller, self, "PregamePassConfirm" )
end

function ShowCACContentWarning( self, element, controller )
	CoD.OverlayUtility.AddSystemOverlay( "PregameCACWarning", {
		menuName = "SystemOverlay_Pregame",
		openMethod = CoD.OverlayUtility.OpenMethods.Overlay,
		categoryType = function ( controller )
			return CoD.OverlayUtility.OverlayTypes.GenericMessage
		end,
		frameWidget = "CoD.Pregame_RestrictedContentWarning"
	} )
	CoD.OverlayUtility.CreateOverlay( controller, self, "PregameCACWarning", controller )
end

function ShowStreakContentWarning( self, element, controller )
	CoD.OverlayUtility.AddSystemOverlay( "PregameStreakWarning", {
		menuName = "SystemOverlay_Pregame",
		title = "MENU_STREAK_BANNED_CAPS",
		description = "MENU_CAC_CONTENT_BANNED_DESC",
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		openMethod = CoD.OverlayUtility.OpenMethods.Overlay,
		frameWidget = "CoD.Pregame_RestrictedContentWarning"
	} )
	CoD.OverlayUtility.CreateOverlay( controller, self, "PregameStreakWarning" )
end

function LobbyToggleNetwork( self, element, controller, param )
	for subController = 1, Engine.GetMaxControllerCount() - 1, 1 do
		LobbyRemoveLocalClientFromLobby( self, subController )
	end
	if param == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		if IsOrbis() then
			if Engine.DisplayNpAvailabilityErrors( controller ) then
				return 
			elseif not Engine.DisplayUpsellAndContentWarnings( controller ) then
				return 
			end
		end
		if CoD.LobbyUtility.ForceOffline() == true then
			CoD.OverlayUtility.CreateOverlay( controller, self, "UpdateNeeded" )
			return 
		elseif not Engine.IsDemonwareFetchingDone( controller ) then
			Engine.LiveConnectEnableDemonwareConnect()
			CoD.OverlayUtility.CreateOverlay( controller, self, "ConnectingToDemonware" )
			return 
		end
	end
	local menuName = LuaEnum.UI.MODE_SELECT_LAN
	if param == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		menuName = LuaEnum.UI.MODE_SELECT_ONLINE
	end
	local data = {
		controller = controller,
		navToMenu = menuName
	}
	Engine.LobbyEvent( "OnGoForward", data )
	local parent = self:getParent()
	self:close()
end

function LaunchGamePrototype( self, element, controller )
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	local f174_local0 = {}
	local f174_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_CUSTOM )
	f174_local0[f174_local1.id] = LobbyOnlineCustomLaunchGame_SelectionList
	f174_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_MP )
	f174_local0[f174_local1.id] = LobbyOnlineCustomLaunchGame_SelectionList
	f174_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP )
	f174_local0[f174_local1.id] = ReplaySelectedMission
	f174_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP_CUSTOM )
	f174_local0[f174_local1.id] = ReplaySelectedMission
	if f174_local0[lobbyNav] then
		f174_local0[lobbyNav]( self, element, controller )
	end
end

function GenericPopupClose( self, element, controller, param )
	GoBack( self, controller )
end

function OpenLobbyToggleNetworkConfirmation( self, element, controller, param, menu )
	local options = {}
	local title, description = nil
	local networkMode = Engine.GetLobbyNetworkMode()
	if controller ~= 0 then
		LuaUtils.UI_ShowWarningMessageDialog( controller, "MENU_PRIMARY_CLIENT_ONLY" )
		return 
	elseif networkMode == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		if not Engine.CheckNetConnection() then
			LuaUtils.UI_ShowErrorMessageDialog( controller, "XBOXLIVE_NETCONNECTION" )
			return 
		elseif IsOrbis() then
			if not Engine.IsSignedIntoPSN( controller ) then
				Engine.DisplayNpError( controller, "-2141913082" )
				return 
			elseif Engine.DisplayNpAvailabilityErrors( controller ) then
				return 
			elseif not Engine.DisplayUpsellAndContentWarnings( controller ) then
				return 
			end
		end
		if IsDurango() and not Engine.HasMPPrivileges( controller ) then
			LuaUtils.UI_ShowErrorMessageDialog( controller, "XBOXLIVE_MPNOTALLOWED" )
			return 
		elseif Engine.IsPlayerQueued( controller ) then
			CoD.OverlayUtility.CreateOverlay( controller, self, "LoginQueue" )
			return 
		elseif Engine.IsSignedInToLive( controller ) == false then
			if IsOrbis() then
				if not Engine.DisplayNpAvailabilityErrors( controller ) then
					CoD.OverlayUtility.CreateOverlay( controller, self, "LobbyPlayNetworkModePopup", Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
				end
			elseif IsDurango() and Engine.HasMPPrivileges( controller ) then
				CoD.OverlayUtility.CreateOverlay( controller, self, "LobbyPlayNetworkModePopup", Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
			end
		else
			if not Engine.IsDemonwareFetchingDone( controller ) then
				Engine.LiveConnectEnableDemonwareConnect()
				local anticheatRoot = Engine.GetModel( Engine.GetModelForController( controller ), "lobbyRoot.anticheat" )
				Engine.SetModelValue( Engine.GetModel( anticheatRoot, "reputation" ), 0 )
				CoD.OverlayUtility.CreateOverlay( controller, self, "ConnectingToDemonware" )
				return 
			end
			CoD.OverlayUtility.CreateOverlay( controller, self, "LobbyPlayNetworkModePopup", Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
		end
	elseif networkMode == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		CoD.OverlayUtility.CreateOverlay( controller, self, "LobbyPlayNetworkModePopup", Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN )
	end
end

function LobbyNoAction( self, element, controller, param, menu )
	
end

function OpenMPFirstTimeFlow( self, element, controller, param, menu )
	local tutorialModel = Engine.CreateModel( Engine.GetGlobalModel(), "heroSelectionTutorial" )
	Engine.SetModelValue( tutorialModel, true )
	if param == "goBackFirst" then
		menu = GoBack( self, controller )
	end
	menu.openOverlayAfterSpinner = "WelcomeMenu"
	menu.openOverlayAfterSpinnerController = controller
	NavigateToLobby_FirstTimeFlowMP( self, element, controller, menu )
end

function OpenCPFirstTimeFlow( self, element, controller, param, menu )
	local firstTimeFlowModel = Engine.CreateModel( Engine.GetGlobalModel(), "firstTimeFlowCPConfirm" )
	Engine.SetModelValue( firstTimeFlowModel, false )
	menu.openOverlayAfterSpinner = "ChooseGender"
	menu.openOverlayAfterSpinnerController = controller
	NavigateToLobby_FirstTimeFlowCP( self, element, controller, menu )
end

function FirstTimeSetup_SetOverview( controller )
	local firstTimeFlowStateModel = Engine.CreateModel( Engine.GetModelForController( controller ), "firstTimeFlowState" )
	Engine.SetModelValue( firstTimeFlowStateModel, CoD.PlayerRoleUtility.FirstTimeFlowState.Overview )
end

function FirstTimeSetup_SetChangedCharacter( controller )
	local firstTimeFlowStateModel = Engine.CreateModel( Engine.GetModelForController( controller ), "firstTimeFlowState" )
	Engine.SetModelValue( firstTimeFlowStateModel, CoD.PlayerRoleUtility.FirstTimeFlowState.SelectionChanged )
end

function FirstTimeSetup_SetComplete( controller )
	local firstTimeFlowStateModel = Engine.CreateModel( Engine.GetModelForController( controller ), "firstTimeFlowState" )
	Engine.SetModelValue( firstTimeFlowStateModel, CoD.PlayerRoleUtility.FirstTimeFlowState.Complete )
end

function FirstTimeSetup_SetNone( controller )
	local firstTimeFlowStateModel = Engine.CreateModel( Engine.GetModelForController( controller ), "firstTimeFlowState" )
	Engine.SetModelValue( firstTimeFlowStateModel, CoD.PlayerRoleUtility.FirstTimeFlowState.None )
end

function ShowReportPlayerDialog( self, element, controller, actionParam )
	local controller = actionParam.controller
	local xuid = actionParam.xuid
	local playerInfo = Engine.GetPlayerInfo( controller, xuid )
	local gamertag = playerInfo.info.gamertag
	if not gamertag or gamertag == "" then
		gamertag = actionParam.gamertag
	end
	local data = {
		controller = controller,
		xuid = xuid,
		gamertag = gamertag,
		clantag = playerInfo.info.clantag,
		emblemBacking = playerInfo.info.emblemBacking
	}
	CoD.OverlayUtility.CreateOverlay( controller, self, "ReportPlayer", controller, element, data )
end

function CheckIfFeatureIsBanned( controller, feature )
	if Engine.IsDedicatedServer() then
		return false
	else
		local banned, message = Engine.IsFeatureBanned( controller, feature )
		if banned then
			return true
		else
			return false
		end
	end
end

function GetFeatureBanInfo( controller, feature )
	if Engine.IsDedicatedServer() then
		return ""
	end
	local isPermaBanned = Engine.IsFeaturePermaBanned( controller, feature )
	local banString = LuaUtils.GetBanMessageForFeature( controller, feature, isPermaBanned )
	local timeString = ""
	if not isPermaBanned then
		local anticheatRoot = Engine.GetModel( Engine.GetModelForController( controller ), "lobbyRoot.anticheat" )
		local featureBanModel = Engine.GetModel( anticheatRoot, "featureBans" )
		local endTime = Engine.GetModelValue( Engine.GetModel( featureBanModel, "feature_" .. feature .. "_end" ) )
		local secondsRemaining = endTime - Engine.SystemTimeUInt64()
		timeString = Engine.GetTimeRemainingString( secondsRemaining )
	end
	return string.format( "%s\n\n%s", banString, timeString )
end

function PopAnticheatMessageAndGoForward_MP( self, element, controller, menu )
	local parent = GoBack( self, controller )
	Engine.PopAnticheatMessage( controller, LuaEnum.ANTICHEAT_MESSAGE_GROUPS.MP )
	local param = {
		targetName = "MPLobbyMain",
		mode = Enum.eModes.MODE_MULTIPLAYER,
		firstTimeFlowAction = OpenMPFirstTimeFlow
	}
	NavigateCheckForFirstTime( parent, element, controller, param, parent )
end

function PopAnticheatMessageAndGoForward_ZM( self, element, controller, menu )
	local parent = GoBack( self, controller )
	Engine.PopAnticheatMessage( controller, LuaEnum.ANTICHEAT_MESSAGE_GROUPS.ZM )
	NavigateToLobby_SelectionList( parent, element, controller, "ZMLobbyOnline", parent )
end

function PopAnticheatMessageAndGoForward_Paintshop( self, element, controller, menu )
	local parent = GoBack( self, controller )
	Engine.PopAnticheatMessage( controller, LuaEnum.ANTICHEAT_MESSAGE_GROUPS.UGC )
	OpenPaintshop( parent, element, controller, "", parent )
end

function PopAnticheatMessageAndGoForward_EmblemEditorFromEmblemSelect( self, element, controller, menu )
	local parent = GoBack( self, controller )
	Engine.PopAnticheatMessage( controller, LuaEnum.ANTICHEAT_MESSAGE_GROUPS.UGC )
	OpenEmblemEditor( element, parent, controller, nil, "EmblemSelect" )
end

function PopAnticheatMessageAndGoForward_EmblemEditorFromPaintjobSelect( self, element, controller, menu )
	local parent = GoBack( self, controller )
	Engine.PopAnticheatMessage( controller, LuaEnum.ANTICHEAT_MESSAGE_GROUPS.UGC )
	OpenEmblemEditor( element, parent, controller, nil, "PaintjobSelect" )
end

function PopAnticheatMessageAndGoForward_Loot( self, element, controller, menu )
	local parent = GoBack( self, controller )
	Engine.PopAnticheatMessage( controller, LuaEnum.ANTICHEAT_MESSAGE_GROUPS.LOOT )
	OpenBlackMarket( parent, nil, controller )
end

function PopAnticheatMessageAndGoForward_Arena( self, element, controller, menu )
	local parent = GoBack( self, controller )
	Engine.PopAnticheatMessage( controller, LuaEnum.ANTICHEAT_MESSAGE_GROUPS.ARENA )
	NavigateToLobby_SelectionList( parent, element, controller, "MPLobbyOnlineArena", parent )
end

function GetAnticheatMessageForwardFunction( messageGroup, target, source )
	if messageGroup == LuaEnum.ANTICHEAT_MESSAGE_GROUPS.MP then
		return PopAnticheatMessageAndGoForward_MP
	elseif messageGroup == LuaEnum.ANTICHEAT_MESSAGE_GROUPS.ZM then
		return PopAnticheatMessageAndGoForward_ZM
	elseif messageGroup == LuaEnum.ANTICHEAT_MESSAGE_GROUPS.UGC then
		if target == "EmblemEditor" then
			if source == "EmblemSelect" then
				return PopAnticheatMessageAndGoForward_EmblemEditorFromEmblemSelect
			elseif source == "PaintjobSelect" then
				return PopAnticheatMessageAndGoForward_EmblemEditorFromPaintjobSelect
			end
		elseif target == "Paintshop" then
			return PopAnticheatMessageAndGoForward_Paintshop
		end
	elseif messageGroup == LuaEnum.ANTICHEAT_MESSAGE_GROUPS.LOOT then
		return PopAnticheatMessageAndGoForward_Loot
	elseif messageGroup == LuaEnum.ANTICHEAT_MESSAGE_GROUPS.ARENA then
		return PopAnticheatMessageAndGoForward_Arena
	end
end

function DisplayAnticheatMessage( self, controller, messageGroup, target, source )
	if Engine.IsDedicatedServer() then
		return 
	else
		local forwardFn = GetAnticheatMessageForwardFunction( messageGroup, target, source )
		local anticheatRoot = Engine.GetModel( Engine.GetModelForController( controller ), "lobbyRoot.anticheat" )
		local messageModel = Engine.GetModel( anticheatRoot, "message" )
		local stringRef = Engine.GetModelValue( Engine.GetModel( messageModel, "string" ) )
		local url = Engine.GetModelValue( Engine.GetModel( messageModel, "url" ) )
		CoD.OverlayUtility.CreateOverlay( controller, self, "AnticheatMessage", stringRef, url, forwardFn )
	end
end

function OpenAnticheatPolicyInBrowser( self, element, controller, menu )
	if Engine.IsDedicatedServer() then
		return 
	else
		local anticheatRoot = Engine.GetModel( Engine.GetModelForController( controller ), "lobbyRoot.anticheat" )
		local messageModel = Engine.GetModel( anticheatRoot, "message" )
		local url = Engine.GetModelValue( Engine.GetModel( messageModel, "url" ) )
		Engine.OpenAnticheatPolicyInBrowser( controller, url )
	end
end

function NavigateCheckForFirstTime( self, element, controller, param, menu )
	if param.targetName == LuaEnum.UI.ONLINE_MP then
		if Engine.PushAnticheatMessageToUI( controller, LuaEnum.ANTICHEAT_MESSAGE_GROUPS.MP ) then
			DisplayAnticheatMessage( self, controller, LuaEnum.ANTICHEAT_MESSAGE_GROUPS.MP, "", "" )
			return 
		end
		for i = 0, LuaDefine.MAX_CONTROLLER_COUNT - 1, 1 do
			if CheckIfFeatureIsBanned( i, LuaEnum.FEATURE_BAN.LIVE_MP ) then
				LuaUtils.UI_ShowErrorMessageDialog( controller, GetFeatureBanInfo( i, LuaEnum.FEATURE_BAN.LIVE_MP ) )
				return 
			end
		end
		local numClients = Engine.GetUsedControllerCount()
		if numClients > 1 then
			for i = 0, LuaDefine.MAX_CONTROLLER_COUNT - 1, 1 do
				if CheckIfFeatureIsBanned( i, LuaEnum.FEATURE_BAN.MP_SPLIT_SCREEN ) then
					LuaUtils.UI_ShowErrorMessageDialog( controller, GetFeatureBanInfo( i, LuaEnum.FEATURE_BAN.MP_SPLIT_SCREEN ) )
					return 
				end
			end
		end
	end
	if param.targetName == LuaEnum.UI.ONLINE_CP then
		for i = 0, LuaDefine.MAX_CONTROLLER_COUNT - 1, 1 do
			if CheckIfFeatureIsBanned( i, LuaEnum.FEATURE_BAN.LIVE_CP ) then
				LuaUtils.UI_ShowErrorMessageDialog( controller, GetFeatureBanInfo( i, LuaEnum.FEATURE_BAN.LIVE_CP ) )
				return 
			end
		end
		local numClients = Engine.GetUsedControllerCount()
		if numClients > 1 then
			for i = 0, LuaDefine.MAX_CONTROLLER_COUNT - 1, 1 do
				if CheckIfFeatureIsBanned( i, LuaEnum.FEATURE_BAN.CP_SPLIT_SCREEN ) then
					LuaUtils.UI_ShowErrorMessageDialog( controller, GetFeatureBanInfo( i, LuaEnum.FEATURE_BAN.CP_SPLIT_SCREEN ) )
					return 
				end
			end
		end
	end
	if IsFirstTimeSetup( controller, param.mode ) then
		param.firstTimeFlowAction( self, element, controller, param.targetName, menu )
	else
		NavigateToLobby_SelectionList( self, element, controller, param.targetName, menu )
	end
end

function ShouldShowNightmares( controller )
	return true
end

function OpenChooseCharacterFromFirstTimeFlow( self, element, controller, param, menu )
	CoD.PlayerRoleUtility.customizationMode = Enum.eModes.MODE_MULTIPLAYER
	local menu = CoD.LobbyUtility.OpenChooseCharacterLoadout( menu, controller, LuaEnum.CHOOSE_CHARACTER_OPENED_FROM.FIRST_TIME )
	menu.previousMode = Engine.GetMostRecentPlayedMode( controller )
end

function FirstTimeFlowResetCharacterMode( self, element, controller, param, menu )
	Engine.SetMostRecentPlayedMode( menu.previousMode )
	Engine.SwitchMode( controller, "" )
end

function SetCharacterModeToSessionMode( self, element, controller, enumValue )
	CoD.PlayerRoleUtility.customizationMode = enumValue
end

function SetCharacterModeToCurrentSessionMode( self, element, controller )
	CoD.PlayerRoleUtility.customizationMode = Engine.CurrentSessionMode()
end

function SetFirstTimeSetupComplete_MP( self, element, controller, param, menu )
	Engine.SetFirstTimeComplete( controller, Enum.eModes.MODE_MULTIPLAYER, true )
	FirstTimeSetup_SetNone( controller )
end

function CloseMPFirstTimeFlow( self, element, controller, param, menu )
	GoBack( self, controller )
end

function OpenFindMatch( self, element, controller, param, menu )
	CoD.LobbyUtility.OpenFindMatch( menu, controller )
end

function OpenCompetitivePlaylist( self, element, controller, param, menu )
	CoD.LobbyUtility.OpenCompetitivePlaylist( menu, controller )
end

function OpenFreerunMapSelection( self, element, controller, param, menu )
	CoD.LobbyUtility.OpenFreerunMapSelection( menu, controller )
end

function OpenMPLobbyLeaderboard( self, element, controller, param, menu )
	CoD.LobbyUtility.OpenMPLobbyLeaderboard( menu, controller )
end

function OpenFreerunLeaderboards( self, element, controller, param, menu )
	CoD.LobbyUtility.OpenFreerunLeaderboards( menu, controller )
end

function OpenArenaMasterLeaderboards( self, element, controller, param, menu )
	CoD.LobbyUtility.OpenArenaMasterLeaderboards( menu, controller )
end

function OpenDOALeaderboards( self, element, controller, param, menu )
	CoD.LobbyUtility.OpenDOALeaderboards( menu, controller )
end

function OpenSetupGameMP( self, element, controller, param, menu )
	CoD.LobbyUtility.OpenSetupGame( menu, controller, "GameSettingsFlyoutMP" )
end

function OpenBonusModesFlyout( self, element, controller, param, menu )
	CoD.LobbyUtility.OpenSetupGame( menu, controller, "BonusModesFlyout" )
end

function OpenChangeMapZM( self, element, controller, param, menu )
	CoD.perController[controller].choosingZMPlaylist = false
	CoD.LobbyUtility.ZMOpenChangeMap( menu, controller, CoD.LobbyUtility.MapSelect.SELECT, nil )
end

function OpenSetupGame( self, element, controller, param, menu )
	CoD.LobbyUtility.OpenSetupGame( menu, controller, "GameSettingsFlyout" )
end

function OpenBubbleGumPacksMenu( self, element, controller, param, menu )
	CoD.LobbyUtility.OpenBubbleGumBuffs( menu, controller )
end

function OpenMegaChewFactorymenu( self, element, controller, param, menu )
	CoD.LobbyUtility.OpenMegaChewFactory( menu, controller )
end

function OpenWeaponBuildKits( self, element, controller, param, menu )
	CoD.LobbyUtility.OpenWeaponBuildKits( menu, controller )
end

function OpenChangeMap( self, element, controller, param, menu )
	CoD.LobbyUtility.OpenChangeMap( self, controller )
end

function OpenChangeGameMode( self, element, controller, param, menu )
	CoD.LobbyUtility.OpenChangeGameMode( self, controller )
end

function OpenEditGameRules( self, element, controller, param, menu )
	CoD.LobbyUtility.OpenEditGameRules( self, controller )
end

function OpenBotSettings( self, element, controller, param, menu )
	CoD.LobbyUtility.OpenBotSettings( self, controller )
end

function OpenOptions( self, element, controller, param, menu )
	CoD.LobbyUtility.OpenOptions( menu, controller )
end

function AddLobbyBots( self, element, controller, param, menu )
	CoD.LobbyUtility.AddLobbyBot( menu, controller )
end

function RemoveLobbyBots( self, element, controller, param, menu )
	CoD.LobbyUtility.RemoveLobbyBot( menu, controller )
end

function OpenZMFindMatch( self, element, controller, data, menu )
	CoD.perController[controller].choosingZMPlaylist = true
	CoD.LobbyUtility.OpenFindMatch( menu, controller, "ZMMapSelection" )
end

function OpenZMMapSelectLaunch( self, element, controller, data, menu )
	local overlayData = {
		controller = controller,
		actionFunc = function ( data )
			Engine.RunPlaylistRules( Engine.GetPrimaryController() )
			CoD.perController[Engine.GetPrimaryController()].choosingZMPlaylist = false
			Dvar.zm_private_rankedmatch:set( true )
			CoD.LobbyUtility.ZMOpenChangeMap( menu, Engine.GetPrimaryController(), CoD.LobbyUtility.MapSelect.LAUNCH, data )
		end
	}
	if Engine.GetUsedControllerCount() > 1 and Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyClientFilterType.LOBBY_CLIENT_FILTER_TYPE_ALL ) == Engine.GetUsedControllerCount() then
		CoD.OverlayUtility.CreateOverlay( controller, self, "LobbyLocalClientWarning", overlayData )
		return 
	elseif Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) == 0 or Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyClientFilterType.LOBBY_CLIENT_FILTER_TYPE_ALL ) > 1 then
		LuaUtils.UI_ShowErrorMessageDialog( controller, "MENU_TOO_MANY_CLIENTS_FOR_SOLO_GAME" )
		return 
	else
		Engine.RunPlaylistRules( controller )
		CoD.perController[controller].choosingZMPlaylist = false
		Dvar.zm_private_rankedmatch:set( true )
		CoD.LobbyUtility.ZMOpenChangeMap( menu, controller, CoD.LobbyUtility.MapSelect.LAUNCH, data )
	end
end

function OpenZMMapSelectNavigate( self, element, controller, data, menu )
	CoD.perController[controller].choosingZMPlaylist = false
	CoD.LobbyUtility.ZMOpenChangeMap( menu, controller, CoD.LobbyUtility.MapSelect.NAVIGATE, data )
end

function OpenZMMapSelectSelect( self, element, controller, data, menu )
	CoD.perController[controller].choosingZMPlaylist = false
	CoD.LobbyUtility.ZMOpenChangeMap( menu, controller, CoD.LobbyUtility.MapSelect.SELECT, data )
end

function ProcessZMMapSelectListAction( self, element, controller, menu )
	if element.mapId ~= nil then
		SetMap( controller, element.mapId, false )
		self.mapSelected = true
	end
	GoBack( self, controller )
end

function OpenMissionSelect( self, element, controller, param, menu )
	if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "cpLobby" ), "lan" )
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "cpLobby" ), "custom" )
	end
	Engine.SetDvar( "ui_blocksaves", "1" )
	menu:openPopup( "CPMissionSelect", controller )
end

function DOAJoinPublicGame( self, element, controller, param, menu )
	
end

function OpenPublicGameSelect( self, element, controller, param, menu )
	Engine.SetDvar( "ui_blocksaves", "1" )
	menu:openPopup( "CPPublicGameSelect", controller )
end

function OpenMissionOverview( self, element, controller, param, menu )
	menu:openPopup( "CPMissionOverviewFrontend", controller )
end

function OpenDifficultySelect( self, element, controller, param, menu )
	local selectDifficultyMenu = menu:openPopup( "CPSelectDifficulty", controller )
	selectDifficultyMenu.disableConfirmSelection = param
end

function OpenChangeFaction( self, element, controller, param, menu )
	OpenOverlay( menu, "ChooseFaction", controller )
end

function OpenChangeCompanion( self, element, controller, param, menu )
	OpenOverlay( menu, "ChooseCompanion", controller )
end

function OpenCAC( self, element, controller, param, menu )
	CoD.LobbyUtility.OpenCAC( menu, controller )
end

function OpenFindLANGame( self, element, controller, param, menu )
	local hasNetworkConnection = Engine.CheckNetConnection()
	if not hasNetworkConnection then
		LuaUtils.UI_ShowErrorMessageDialog( controller, "XBOXLIVE_NETCONNECTION" )
		return 
	elseif Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 2 then
		local data = {
			controller = controller,
			navToMenu = nil,
			popupName = "LobbyServerBrowserOverlay",
			openFromMenu = menu
		}
		CoD.OverlayUtility.CreateOverlay( controller, menu, "LobbyLocalClientWarning", data )
		return 
	else
		OpenPopup( menu, "LobbyServerBrowserOverlay", controller )
	end
end

function OpenStore( self, element, controller, param, menu )
	if not DisableStore() then
		OpenOverlay( menu, "Store", controller )
		local currentLobbyMenu = LobbyData:GetCurrentMenuTarget()
		CoD.MetricsUtility.StoreEntry( menu, controller, param, currentLobbyMenu )
		local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "StoreRoot" )
		Engine.SetModelValue( Engine.CreateModel( rootModel, "actionSource", true ), param )
		Engine.SetModelValue( Engine.CreateModel( rootModel, "storeSource", true ), currentLobbyMenu.name )
	end
end

function OpenSteamStore( self, element, controller, param, menu )
	if not DisableSteamStore() then
		Engine.SteamStore( controller )
	end
end

function OpenFindLANGameFromPrompt( self, element )
	OpenPopup( self, "LobbyServerBrowserOverlay", self:getOwner() )
end

function OpenScorestreaks( self, element, controller, param, menu )
	CoD.LobbyUtility.OpenScorestreaks( menu, controller )
end

function OpenEditCodcasterSettings( self, element, controller, param, menu )
	CoD.LobbyUtility.OpenEditCodcasterSettings( menu, controller )
end

function OpenTest( self, element, controller, param, menu )
	CoD.LobbyUtility.OpenTest( menu, controller )
end

function OpenBarracks( self, element, controller, param, menu )
	CoD.LobbyUtility.OpenBarracks( menu, controller )
end

function OpenGenders( self, controller, menu )
	CoD.LobbyUtility.OpenGenders( menu, controller )
end

function OpenQuit( self, element, controller, param, menu )
	CoD.LobbyUtility.OpenQuit( menu, controller )
end

function OpenFriends( self, element, controller, param, menu )
	
end

function OpenSocial( self, element, controller, param, menu )
	menu:openPopup( "Friends", controller )
end

function OpenLANPlayers( self, element, controller, param, menu )
	
end

function OpenConnectingSpinner( self, element, controller )
	CoD.OverlayUtility.CreateOverlay( controller, self, "ConnectingToDemonware" )
end

function LobbyMapVoteSelectNext( self, controller )
	CoD.LobbyUtility.LobbyMapVoteSelect( self, controller, Enum.LobbyMapVote.LOBBY_MAPVOTE_NEXT )
end

function LobbyMapVoteSelectPrevious( self, controller )
	CoD.LobbyUtility.LobbyMapVoteSelect( self, controller, Enum.LobbyMapVote.LOBBY_MAPVOTE_PREVIOUS )
end

function LobbyMapVoteSelectRandom( self, controller )
	CoD.LobbyUtility.LobbyMapVoteSelect( self, controller, Enum.LobbyMapVote.LOBBY_MAPVOTE_RANDOM )
end

function ShowManagePartyPopup( menu, self, element, controller, param )
	CoD.perController[controller].Social_Party = self
	CoD.perController[controller].Social_Party_Action = 0
	local model = Engine.GetModel( Engine.GetGlobalModel(), "SocialMainMenu.managePartyButtonText" )
	if model then
		if param == "PROMOTE" then
			CoD.perController[controller].Social_Party_Action = 1
			Engine.SetModelValue( model, Engine.Localize( "MENU_MANAGE_PARTY_PROMOTE_BUTTON" ) )
		elseif param == "KICK" then
			CoD.perController[controller].Social_Party_Action = 2
			Engine.SetModelValue( model, Engine.Localize( "MENU_MANAGE_PARTY_KICK_BUTTON" ) )
		else
			return 
		end
		SetState( self, "Hidden" )
		OpenPopup( menu, "Social_Party_ManagePartyPopup", controller )
	end
end

function ManagePartyAction( menu, self, element, controller )
	local xuid = Engine.GetModelValue( element:getModel( controller, "xuid" ) )
	if CoD.perController[controller].Social_Party_Action == 1 then
		if Engine.StartPrivateLobbyMigrateTo then
			Engine.StartPrivateLobbyMigrateTo( controller, xuid )
		end
		local previousMenu = GoBack( self, controller )
		GoBackToMenu( previousMenu, controller, "Lobby" )
	elseif CoD.perController[controller].Social_Party_Action == 2 and Engine.IsLeader( controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		Engine.DisconnectClientFromLobby( controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, xuid, Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_KICK )
	end
end

function PromoteToLeader( self, element, controller, params, menu )
	Engine.GiveLeadership( params.controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, params.xuid )
	menu:goBack( controller )
end

function DisconnectClient( self, element, controller, params, menu )
	Engine.DisconnectClientFromLobby( params.controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, params.xuid, Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_KICK )
	menu:goBack( controller )
end

function MutePlayer( self, element, controller, params, menu )
	if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_PRIVATE, params.xuid ) then
		Engine.MutePlayer( params.controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, params.xuid )
	end
	if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, params.xuid ) then
		Engine.MutePlayer( params.controller, Enum.LobbyType.LOBBY_TYPE_GAME, params.xuid )
	end
	menu:goBack( controller )
end

function UnMutePlayer( self, element, controller, params, menu )
	if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_PRIVATE, params.xuid ) then
		Engine.UnMutePlayer( params.controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, params.xuid )
	end
	if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, params.xuid ) then
		Engine.UnMutePlayer( params.controller, Enum.LobbyType.LOBBY_TYPE_GAME, params.xuid )
	end
	menu:goBack( controller )
end

function ShowSocialPartyWidget( controller )
	if CoD.perController[controller].Social_Party then
		CoD.perController[controller].Social_Party:setState( "DefaultState" )
	end
end

function LobbyPartyPrivacy( self, element, controller, param, menu )
	local partyPrivacyModel = Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" )
	local privacyModel = Engine.GetModel( partyPrivacyModel, "privacy" )
	local privacy = Engine.GetModelValue( privacyModel )
	local move = 1
	if param == "left" then
		move = -1
	elseif param == "right" then
		move = 1
	end
	Engine.SetModelValue( privacyModel, (privacy + move) % Enum.PartyPrivacy.PARTY_PRIVACY_COUNT )
end

function LobbyPartyPrivacyMaxPlayers( self, element, controller, param, menu )
	local currentMenuIdx = Engine.GetLobbyUIScreen()
	local currentMenu = LobbyData.GetLobbyMenuByID( currentMenuIdx )
	local clientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	if Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME ) then
		clientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	local partyPrivacyModel = Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" )
	local maxPlayersModel = Engine.GetModel( partyPrivacyModel, "maxPlayers" )
	local maxPlayers = Engine.GetModelValue( maxPlayersModel )
	local move = 1
	if param == "left" then
		move = -1
	elseif param == "right" then
		move = 1
	end
	Engine.SetModelValue( maxPlayersModel, math.min( math.max( clientCount, maxPlayers + move ), currentMenu.maxClients ) )
end

function LobbyPartyPrivacyMaxPlayersOnClientAdded( self, controller )
	local currentMenuIdx = Engine.GetLobbyUIScreen()
	local currentMenu = LobbyData.GetLobbyMenuByID( currentMenuIdx )
	local clientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	if Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME ) then
		clientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	local partyPrivacyModel = Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" )
	local maxPlayersModel = Engine.GetModel( partyPrivacyModel, "maxPlayers" )
	local maxPlayers = Engine.GetModelValue( maxPlayersModel )
	Engine.SetModelValue( maxPlayersModel, math.min( math.max( clientCount, maxPlayers ), currentMenu.maxClients ) )
end

function LobbyPartyPrivacySave( self, controller )
	local lobbyType = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME ) then
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	local partyPrivacyModel = Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" )
	local privacy = Engine.GetModelValue( Engine.GetModel( partyPrivacyModel, "privacy" ) )
	local maxPlayers = Engine.GetModelValue( Engine.GetModel( partyPrivacyModel, "maxPlayers" ) )
	Engine.SetModelValue( Engine.GetModel( partyPrivacyModel, "privacyStatus" ), PartyPrivacy( privacy ) )
	if Dvar.tu4_partyPrivacyUseGlobal:exists() == false or Dvar.tu4_partyPrivacyUseGlobal:get() == true then
		Engine.SetPartyPrivacy( privacy )
	elseif Engine.SetSessionPartyPrivacy then
		Engine.SetSessionPartyPrivacy( Enum.LobbyType.LOBBY_TYPE_PRIVATE, privacy )
	end
	Engine.SetLobbyMaxClients( lobbyType, maxPlayers )
	Engine.SetProfileVar( controller, "party_privacyStatus", privacy )
	Engine.SetProfileVar( controller, "party_maxplayers", maxPlayers )
	Engine.Exec( controller, "updategamerprofile" )
	GoBack( self, controller )
end

function LobbyPartyPrivacyAccept( self, element, controller )
	local activeWidget = element.Slider.activeWidget
	local actionModel = activeWidget:getModel( controller, "action" )
	local paramModel = activeWidget:getModel( controller, "param" )
	local actionFn, actionParam = nil
	if actionModel then
		actionFn = Engine.GetModelValue( actionModel )
		if paramModel then
			actionParam = Engine.GetModelValue( paramModel )
		end
	else
		actionFn = activeWidget.action
		actionParam = activeWidget.actionParam
	end
	if actionFn then
		actionFn( self, activeWidget, controller, actionParam, activeWidget.gridInfoTable.parentGrid.menu )
	end
	Engine.Exec( controller, "updategamerprofile" )
end

function LobbyPartyPrivacyCancel( self, element, controller )
	local activeWidget = element.Slider.activeWidget
	local actionModel = activeWidget:getModel( controller, "action" )
	local paramModel = activeWidget:getModel( controller, "param" )
	local path = Engine.GetModelPath( element )
	path = Engine.GetModelPath( element.Slider )
	path = Engine.GetModelPath( element.Slider.activeWidget )
	local actionFn, actionParam, model = nil
	if actionModel then
		actionFn = Engine.GetModelValue( actionModel )
		if paramModel then
			actionParam = Engine.GetModelValue( paramModel )
		end
	else
		actionFn = activeWidget.revertAction
		actionParam = activeWidget.actionParam
		model = element:getModel( controller, "currentSelection" )
	end
	if actionFn then
		actionFn( element, activeWidget, controller, actionParam, activeWidget.gridInfoTable.parentGrid.menu )
	end
end

function LobbyTeamSelectionLB( self, element, controller )
	local xuid = nil
	local model = element:getModel( controller, "xuid" )
	if model == nil then
		xuid = Engine.GetXUID64( controller )
	else
		xuid = Engine.GetModelValue( model )
	end
	if xuid == nil then
		return 
	end
	local elementModel = element:getModel()
	if elementModel ~= nil then
		local lobbyClientTypeModel = Engine.GetModel( elementModel, "lobbyClientType" )
		local lobbyClientType = Enum.LobbyClientType.LOBBY_CLIENT_TYPE_NORMAL
		if lobbyClientTypeModel ~= nil then
			lobbyClientType = Engine.GetModelValue( lobbyClientTypeModel )
		end
		CoD.LobbyUtility.LobbyTeamSelection( self, controller, 0, xuid, lobbyClientType )
	end
end

function LobbyTeamSelectionRB( self, element, controller )
	local xuid = nil
	local model = element:getModel( controller, "xuid" )
	if model == nil then
		xuid = Engine.GetXUID64( controller )
	else
		xuid = Engine.GetModelValue( model )
	end
	if xuid == nil then
		return 
	end
	local elementModel = element:getModel()
	if elementModel ~= nil then
		local lobbyClientTypeModel = Engine.GetModel( elementModel, "lobbyClientType" )
		local lobbyClientType = Enum.LobbyClientType.LOBBY_CLIENT_TYPE_NORMAL
		if lobbyClientTypeModel ~= nil then
			lobbyClientType = Engine.GetModelValue( lobbyClientTypeModel )
		end
		CoD.LobbyUtility.LobbyTeamSelection( self, controller, 1, xuid, lobbyClientType )
	end
end

function LobbyLocalLaunchGame( self, controller )
	CoD.LobbyUtility.LaunchGame( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function LobbyLANLaunchGame( self, element, controller )
	Engine.SetDvar( "skipto", "" )
	Engine.SetDvar( "sv_saveGameSkipto", "" )
	CoD.LobbyUtility.LaunchGame( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function LobbyOnlinePublicLaunchGame_SelectionList( self, element, controller )
	CoD.LobbyUtility.LaunchGame( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function LobbyOnlinePublicLaunchGame( self, controller )
	CoD.LobbyUtility.LaunchGame( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function SetTMode( self, element, controller )
	local elementModel = element:getModel()
	if elementModel then
		local itemIndex = CoD.SafeGetModelValue( elementModel, "itemIndex" )
		if itemIndex then
			Engine.SetDvar( "r_tacScan_Layout", itemIndex )
			CoD.perController[controller].startMenu_equippedIndex = itemIndex
			self.selectionList:updateDataSource()
		end
	end
end

function LobbyOnlineCustomLaunchGame_SelectionList( self, element, controller )
	local timerActiveModel = Engine.GetModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	Engine.SetModelValue( timerActiveModel, 1 )
	Engine.SetDvar( "skipto", "" )
	Engine.SetDvar( "sv_saveGameSkipto", "" )
	CoD.LobbyUtility.LaunchGame( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function LobbyOnlineCustomLaunchGame( self, controller )
	CoD.LobbyUtility.LaunchGame( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function OpenTheaterSelectFilm( self, element, controller, param, menu )
	CoD.FileshareUtility.SetFileshareMode( controller, Enum.FileshareMode.FILESHARE_MODE_USER )
	CoD.FileshareUtility.SetCurrentUser( Engine.GetXUID64( controller ) )
	CoD.FileshareUtility.SetDirty()
	CoD.LobbyUtility.OpenTheaterSelectFilm( menu, controller )
end

function LobbyTheaterStartFilm( self, element, controller )
	LobbyTheaterLaunchDemo( self, element, controller )
end

function LobbyTheaterCreateHighlightReel( self, element, controller )
	LobbyTheaterLaunchDemo( self, element, controller, "CreateHighlightReel" )
end

function LobbyTheaterShoutcastFilm( self, element, controller )
	LobbyTheaterLaunchDemo( self, element, controller, "Shoutcast" )
end

function GoBackAndDisplayModalDialog( self, controller, func )
	local menu = GoBack( self, controller )
	func( menu, controller )
end

function DisplayPlayGoJoinError( self, controller )
	self:OpenModalDialog( self, controller, "", "MENU_CANNOT_JOIN_DURING_INSTALL", {
		"MPUI_OK"
	}, function ( modalResult )
		return true
	end )
end

function LobbyAcceptInvite( self, controller, event )
	local xuid = event.xuid
	local data = {
		controller = controller,
		xuid = xuid,
		joinType = Enum.JoinType.JOIN_TYPE_INVITE
	}
	if CoD.LobbyUtility.ChunkAnyDownloading() then
		DisplayPlayGoJoinError( self, controller )
		return 
	else
		Engine.LobbyEvent( "OnJoin", data )
	end
end

function LobbyQuickJoin( self, element, controller, expressionArg, booleanArg )
	local menuID = LobbyData.GetLobbyNav()
	local f287_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_ONLINE )
	if menuID == f287_local0.id and IsFirstTimeSetup( controller, Enum.eModes.MODE_MULTIPLAYER ) then
		local elementModel = element:getModel()
		local activityModel = Engine.GetModel( elementModel, "activity" )
		if activityModel and GetSessionModeFromPresenceActivity( Engine.GetModelValue( activityModel ) ) == Enum.eModes.MODE_MULTIPLAYER then
			if booleanArg == true then
				GoBackAndOpenOverlayOnParent( self, "MPIntroRequired", controller )
			else
				OpenOverlay( self, "MPIntroRequired", controller )
			end
			return 
		end
	end
	local joinable = false
	local f287_local1 = element:getModel( controller, "joinable" )
	if not f287_local1 then
		local model = element:getModel( controller, "isJoinable" )
	end
	if f287_local1 ~= nil then
		local value = Engine.GetModelValue( f287_local1 )
		if value ~= nil and (value == Enum.LobbyJoinable.LOBBY_JOINABLE_YES or value == Enum.LobbyJoinable.LOBBY_JOINABLE_YES_FRIENDS_ONLY) then
			joinable = true
		end
	end
	if CoD.LobbyUtility and CoD.LobbyUtility.ChunkAnyDownloading() then
		joinable = false
		GoBackAndDisplayModalDialog( self, controller, DisplayPlayGoJoinError )
	end
	if not joinable then
		return 
	end
	f287_local1 = element:getModel( controller, "xuid" )
	if f287_local1 == nil then
		return 
	end
	local xuid = Engine.GetModelValue( f287_local1 )
	if xuid == nil then
		return 
	end
	local joinType = nil
	if expressionArg ~= nil and expressionArg >= 0 and expressionArg < Enum.JoinType.JOIN_TYPE_COUNT then
		joinType = expressionArg
	else
		joinType = Enum.JoinType.JOIN_TYPE_NORMAL
	end
	local data = {
		controller = controller,
		xuid = xuid,
		joinType = joinType,
		platform = false
	}
	if booleanArg ~= nil and booleanArg == true then
		GoBack( self, controller )
	end
	if Engine.IsInGame() then
		if not Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, data.xuid ) then
			data.migrating = not CoDShared.QuitGame( controller )
			Engine.LobbyEvent( "OnInGameJoin", data )
		end
	else
		Engine.LobbyEvent( "OnJoin", data )
	end
end

function LobbyJoinFromFriendsMenu( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local friendsModel = Engine.GetModel( perControllerModel, "friends" )
	local tabModel = Engine.GetModel( friendsModel, "tab" )
	local tabId = Engine.GetModelValue( tabModel )
	local joinType = nil
	if tabId == "friends" then
		joinType = Enum.JoinType.JOIN_TYPE_FRIEND
	elseif tabId == "recent" then
		joinType = Enum.JoinType.JOIN_TYPE_NORMAL
	elseif tabId == "groups" then
		joinType = Enum.JoinType.JOIN_TYPE_FRIEND
	elseif tabId == "inbox" then
		joinType = Enum.JoinType.JOIN_TYPE_INVITE
	else
		joinType = Enum.JoinType.JOIN_TYPE_NORMAL
	end
	LobbyQuickJoin( self, element, controller, joinType, true )
end

function LobbyInviteFriend( self, element, controller, params )
	local xuid, gamertag = nil
	if params then
		xuid = params.xuid
		gamertag = params.gamertag
	else
		xuid = Engine.GetModelValue( element:getModel( controller, "xuid" ) )
		gamertag = Engine.GetModelValue( element:getModel( controller, "gamertag" ) )
	end
	if xuid ~= nil then
		if CoD.isPC == true then
			CoD.invitePlayer( controller, xuid )
		else
			CoD.invitePlayerByGamertag( controller, xuid, gamertag )
		end
	end
end

function LobbyInviteFriendGoBack( self, element, controller, params )
	LobbyInviteFriend( self, element, controller, params )
	GoBack( self, controller )
end

function OnLoadToggleDebug( self, controller )
	if Dvar.ui_lobbyDebugVis:get() then
		self.btnToggleDebug.buttoninternal0.Text0:setText( Engine.Localize( "ON" ) )
	else
		self.btnToggleDebug.buttoninternal0.Text0:setText( Engine.Localize( "OFF" ) )
	end
end

function LobbyToggleDebug( self, controller )
	Dvar.ui_lobbyDebugVis:set( not Dvar.ui_lobbyDebugVis:get() )
	if Dvar.ui_lobbyDebugVis:get() then
		self.btnToggleDebug.buttoninternal0.Text0:setText( Engine.Localize( "ON" ) )
	else
		self.btnToggleDebug.buttoninternal0.Text0:setText( Engine.Localize( "OFF" ) )
	end
end

function LobbyToggleMsgLevel( self, controller )
	local currentLevel = Dvar.ui_lobbyDebugMsgLevel:get()
	currentLevel = currentLevel + 1
	if currentLevel > 2 then
		currentLevel = 0
	end
	Dvar.ui_lobbyDebugMsgLevel:set( currentLevel )
	if currentLevel == 0 then
		self.btnToggleMsgLevel.buttoninternal0.Text0:setText( "PAUSED" )
	elseif currentLevel == 1 then
		self.btnToggleMsgLevel.buttoninternal0.Text0:setText( "LIMITED" )
	else
		self.btnToggleMsgLevel.buttoninternal0.Text0:setText( "ALL" )
	end
end

function Lobby_SetMaxLocalPlayers( value )
	local val = value
	local max = Engine.GetMaxLocalControllers()
	if max < val then
		val = max
	end
	Dvar.lobby_maxLocalPlayers:set( val )
end

function LobbyAddLocalClient( self, controller )
	if Dvar.ui_execdemo_beta:get() then
		return 
	elseif CoD.isPS4 and Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		if Engine.DisplayNpAvailabilityErrors( controller ) then
			return 
		elseif not Engine.DisplayUpsellAndContentWarnings( controller ) then
			return 
		end
	end
	local lobbyType = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME ) then
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if Engine.GetLobbyLocalClientCount( lobbyType ) < Dvar.lobby_maxLocalPlayers:get() then
		local lobbyMainModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" )
		local mainMode = Engine.GetModelValue( lobbyMainModeModel )
		local featureBan = -1
		if mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
			featureBan = LuaEnum.FEATURE_BAN.MP_SPLIT_SCREEN
		elseif mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
			featureBan = LuaEnum.FEATURE_BAN.ZM_SPLIT_SCREEN
		elseif mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
			featureBan = LuaEnum.FEATURE_BAN.CP_SPLIT_SCREEN
		end
		if featureBan >= 0 then
			for i = 0, LuaDefine.MAX_CONTROLLER_COUNT - 1, 1 do
				if CheckIfFeatureIsBanned( i, featureBan ) then
					LuaUtils.UI_ShowErrorMessageDialog( controller, GetFeatureBanInfo( i, featureBan ) )
					return 
				end
			end
		end
		CoD.LobbyUtility.UnusedGamepadButton( self, controller )
		if Engine.GetLobbyLocalClientCount( lobbyType ) == 2 then
			Engine.ExecNow( nil, "canceldemonwareconnect" )
			LuaUtils.UI_ShowWarningMessageDialog( controller, "MENU_RESTRICTED_TO_LOCAL_GAMES" )
		end
		local allies = Engine.GetDvarInt( "bot_maxAllies" )
		local axis = Engine.GetDvarInt( "bot_maxAxis" )
		local free = Engine.GetDvarInt( "bot_maxFree" )
		local maxBots = CoD.GameSettingsUtility.MaxSplitscreenBots
		if maxBots < allies + axis then
			Engine.SetDvar( "bot_maxAllies", maxBots / 2 )
			Engine.SetDvar( "bot_maxAxis", maxBots / 2 )
		end
		if maxBots < free then
			Engine.SetDvar( "bot_maxFree", maxBots )
		end
		CoD.perController[Engine.GetPrimaryController()].localClientChanged = true
		ForceLobbyButtonUpdate( controller )
	end
end

function LobbyRemoveLocalClientFromLobby( self, controller )
	if not Engine.IsControllerBeingUsed( controller ) or controller == Engine.GetPrimaryController() then
		return 
	else
		CoD.LobbyUtility.RemoveLocalPlayerFromTheLobby( self, controller )
		CoD.perController[Engine.GetPrimaryController()].localClientChanged = true
		ForceLobbyButtonUpdate( controller )
	end
end

function GroupCreationChangePrivacy( self, element, controller )
	local value = Engine.GetModelValue( element:getModel( controller, "value" ) )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), "groups.createGroup.privacy" )
	Engine.SetModelValue( model, value )
	if value == Enum.GroupPrivacy.GROUP_PRIVACY_PUBLIC then
		GroupChangeSetTooltip( self, controller, "PUBLIC" )
	elseif value == Enum.GroupPrivacy.GROUP_PRIVACY_PRIVATE then
		GroupChangeSetTooltip( self, controller, "PRIVATE" )
	end
end

function GroupChangePrivacy( self, element, controller )
	Engine.SetModelValue( Engine.GetModel( CoD.perController[controller].selectedGroup, "privacy" ), element.value )
end

function GroupChangeJoinApprovalType( self, element, controller )
	Engine.SetModelValue( Engine.GetModel( CoD.perController[controller].selectedGroup, "joinApprovalType" ), element.value )
end

function GroupChangeSetTooltip( self, controller, item )
	local tooltipTitle = Engine.GetModel( Engine.GetModelForController( controller ), "groups.createGroup.tooltip_title" )
	local tooltipDesc = Engine.GetModel( Engine.GetModelForController( controller ), "groups.createGroup.tooltip_description" )
	Engine.SetModelValue( tooltipTitle, Engine.LocalizeWithoutLocsMarkers( "GROUPS_CREATE_" .. item .. "_DESC_TITLE" ) )
	Engine.SetModelValue( tooltipDesc, Engine.LocalizeWithoutLocsMarkers( "GROUPS_CREATE_" .. item .. "_DESC" ) )
end

function GroupToggleFriendInvite( self, element, controller )
	if element ~= nil then
		local f301_local0 = element:getParent()
		local listElement = f301_local0:getParent()
		local selectedModel = element:getModel( controller, "selected" )
		local xuidModel = element:getModel( controller, "xuid" )
		local inviteCountModel = Engine.GetModel( Engine.GetModelForController( controller ), "groups.createGroup.friends_invited_count" )
		local inviteCount = Engine.GetModelValue( inviteCountModel )
		if selectedModel and xuidModel then
			local wasSelected = Engine.GetModelValue( selectedModel )
			Engine.SetModelValue( selectedModel, not wasSelected )
			local xuid = Engine.GetModelValue( xuidModel )
			if wasSelected then
				Engine.SetModelValue( inviteCountModel, inviteCount - 1 )
				Engine.AddFriendToInitialGroupInvitesList( xuid, true )
			else
				Engine.SetModelValue( inviteCountModel, inviteCount + 1 )
				Engine.AddFriendToInitialGroupInvitesList( xuid, false )
			end
		end
	end
end

function ClearInitialGroupsInviteList( self, element, controller )
	Engine.ClearInitialGroupInviteList()
end

function SetSelectingGroupEmblem( controller, selectingGroupEmblem, creatingGroup )
	CoD.perController[controller].selectingGroupEmblem = selectingGroupEmblem
	CoD.perController[controller].selectingGroupEmblemForGroupCreation = creatingGroup
end

function SetState( self, newState )
	self:setState( newState )
end

function PulseElementToStateAndBack( element, newState )
	local prevState = element.currentState
	element:setState( newState )
	element:setState( prevState )
end

function SetMenuState( menu, newState )
	menu:setState( newState )
end

function SetElementState( self, element, controller, newState )
	element:setState( newState )
end

function SetElementStateByElementName( self, elementName, controller, newState )
	if self[elementName] then
		self[elementName]:setState( newState )
	end
end

function SetElementDataSource( self, elementName, stringArg )
	if self[elementName] then
		self[elementName]:setDataSource( stringArg )
	end
end

function LockInput( self, controller, booleanArg )
	if booleanArg ~= nil then
		Engine.LockInput( controller, booleanArg )
	end
end

function PrepareOpenMenuInSafehouse( controller )
	if not CoD.isSafehouse then
		return 
	else
		CoD.perController[controller].inSafehouseMenu = true
		Engine.LockInput( controller, true )
		Engine.SetUIActive( controller, true )
	end
end

function PrepareCloseMenuInSafehouse( controller )
	if not CoD.isSafehouse then
		return 
	else
		CoD.perController[controller].inSafehouseMenu = nil
		Engine.LockInput( controller, false )
		Engine.SetUIActive( controller, false )
	end
end

function SetupAutoHorizontalAlignArabicText( element )
	local elementSetAlignment = element.setAlignment
	element.setAlignment = function ( element, alignment )
		if IsCurrentLanguageReversed() then
			if alignment & Enum.LUIAlignment.LUI_ALIGNMENT_LEFT ~= 0 then
				alignment = alignment & Enum.LUIAlignment.LUI_ALIGNMENT_VERTICAL_MASK | Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT
			elseif alignment & Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT ~= 0 then
				alignment = alignment & Enum.LUIAlignment.LUI_ALIGNMENT_VERTICAL_MASK | Enum.LUIAlignment.LUI_ALIGNMENT_LEFT
			end
		end
		elementSetAlignment( element, alignment )
	end
	
	if element.getAlignment then
		local f313_local0 = element:getAlignment()
		if not f313_local0 then
		
		else
			element:setAlignment( f313_local0 )
		end
	end
	local currentAlignment = Enum.LUIAlignment.LUI_ALIGNMENT_LEFT
end

function ScaleWidgetToLabelCentered( self, element, exprPadding )
	if element == nil then
		return 
	else
		local leftanchor, rightanchor, left, right = self:getLocalLeftRight()
		local _, _, elementLeft, _ = element:getLocalLeftRight()
		local textWidth = element:getTextWidth()
		local center = (right + left) / 2
		local width = textWidth + exprPadding * 2
		self:setLeftRight( leftanchor, rightanchor, center - width / 2, center + width / 2 )
	end
end

function ScaleWidgetToLargerLabelCentered( self, element1, element2, exprPadding )
	if element1 == nil or element2 == nil then
		return 
	else
		local leftanchor, rightanchor, left, right = self:getLocalLeftRight()
		local textWidth = math.max( element1:getTextWidth(), element2:getTextWidth() )
		local center = (right + left) / 2
		local width = textWidth + exprPadding * 2
		self:setLeftRight( leftanchor, rightanchor, center - width / 2, center + width / 2 )
	end
end

function ScaleWidgetToLabelCenteredWithMinimum( self, element, exprPadding, exprMinimum )
	if element == nil then
		return 
	else
		local leftanchor, rightanchor, left, right = self:getLocalLeftRight()
		local textWidth = element:getTextWidth()
		local center = (right + left) / 2
		local width = math.max( textWidth + exprPadding * 2, exprMinimum )
		self:setLeftRight( leftanchor, rightanchor, center - width / 2, center + width / 2 )
	end
end

function ScaleWidgetToLabelCenteredWrapped( self, element, exprPadding, exprPaddingTopBottom )
	if element == nil then
		return 
	end
	local leftanchor, rightanchor, left, right = self:getLocalLeftRight()
	local elementLeftanchor, elementRightanchor, elementLeft, elementRight = element:getLocalLeftRight()
	if not self._originalWidth then
		if elementLeftanchor == 0 and elementRightanchor == 1 then
			local widgetWidth = right - left
			self._originalWidth = widgetWidth + elementRight - elementLeft
		else
			self._originalWidth = elementRight - elementLeft
		end
	end
	local textWidth, textHeight = element:getTextWidthAndHeight( self._originalWidth )
	local center = (right + left) / 2
	local width = textWidth + exprPadding * 2
	self:setLeftRight( leftanchor, rightanchor, center - width / 2, center + width / 2 )
	local topanchor, bottomanchor, top, _ = self:getLocalTopBottom()
	self:setTopBottom( topanchor, bottomanchor, top, textHeight + top + exprPaddingTopBottom )
end

function ScaleWidgetToLabelCore( self, element, exprPadding, languageJustify )
	if element == nil then
		return 
	end
	local leftanchor, rightanchor, left, right = self:getLocalLeftRight()
	local textWidth = element:getTextWidth()
	if Engine.IsCurrentLanguageReversed() and languageJustify then
		if textWidth > 0 then
			local elemleftanchor, elemrightanchor, elementLeft, elementRight = element:getLocalLeftRight()
			self.savedWidth = textWidth + 2 * elementLeft + exprPadding
			if not self.widthOverridden then
				self:setLeftRight( leftanchor, rightanchor, right - self.savedWidth, right )
				if elemleftanchor + elemrightanchor == 0 then
					element:setLeftRight( elemleftanchor, elemrightanchor, elementLeft, elementLeft + textWidth )
				elseif elemleftanchor == 0 and elemrightanchor == 1 then
					element:setLeftRight( elemleftanchor, elemrightanchor, elementLeft, elementRight )
				end
			end
		else
			self:setLeftRight( leftanchor, rightanchor, right, right )
		end
		return 
	end
	local _, elemrightanchor, elementLeft, elementRight = element:getLocalLeftRight()
	if textWidth > 0 then
		self.savedWidth = textWidth + 2 * elementLeft + exprPadding
		if not self.widthOverridden then
			self:setLeftRight( leftanchor, rightanchor, left, left + self.savedWidth )
		end
	else
		self:setLeftRight( leftanchor, rightanchor, left, left )
	end
end

function SetStateFromText( self, element, hasTextState, noTextState )
	local state = noTextState
	if element and element:getTextWidth() ~= 0 then
		state = hasTextState
	end
	self:setState( state )
end

function ScaleWidgetToLabel( self, element, exprPadding )
	ScaleWidgetToLabelCore( self, element, exprPadding, true )
end

function ScaleWidgetToLabelLeftJustify( self, element, exprPadding )
	ScaleWidgetToLabelCore( self, element, exprPadding, false )
end

function ScaleWidgetToLabelWrapped( self, element, exprPadding, exprPaddingTopBottom )
	if element == nil then
		return 
	end
	local leftanchor, rightanchor, left, right = self:getLocalLeftRight()
	local elemAnchorLeft, elemAnchorRight, elementLeft, elementRight = element:getLocalLeftRight()
	if not self._originalWidth then
		self._originalWidth = right - left
	end
	if not Engine.IsCurrentLanguageReversed() then
		element:setLeftRight( true, false, elementLeft, elementLeft + self._originalWidth )
	end
	local textWidth, textHeight = element:getTextWidthAndHeight( self._originalWidth )
	if Engine.IsCurrentLanguageReversed() then
		if textWidth > 0 then
			if self._originalWidth < textWidth + 2 * elementLeft + exprPadding then
				textWidth = self._originalWidth - 2 * elementLeft - exprPadding
			end
			self:setLeftRight( leftanchor, rightanchor, right - textWidth - elementLeft - exprPadding, right )
			if elemAnchorLeft + elemAnchorRight == 0 then
				element:setLeftRight( elemAnchorLeft, elemAnchorRight, elementLeft, elementLeft + textWidth )
			end
		else
			self:setLeftRight( leftanchor, rightanchor, right, right )
		end
	else
		if self._originalWidth < textWidth then
			textWidth = self._originalWidth
		end
		if textWidth > 0 then
			self.savedWidth = textWidth + 2 * elementLeft + exprPadding
			self:setLeftRight( leftanchor, rightanchor, left, left + self.savedWidth )
		else
			self:setLeftRight( leftanchor, rightanchor, left, left )
		end
	end
	local topanchor, bottomanchor, top, _ = self:getLocalTopBottom()
	self:setTopBottom( topanchor, bottomanchor, top, top + textHeight + exprPaddingTopBottom )
end

function ScaleWidgetToLabelWrappedUp( self, element, exprPadding, exprPaddingTopBottom )
	if element == nil then
		return 
	end
	local leftanchor, rightanchor, left, right = self:getLocalLeftRight()
	local elemAnchorLeft, elemAnchorRight, elementLeft, elementRight = element:getLocalLeftRight()
	if not self._originalWidth then
		self._originalWidth = right - left
	end
	if not Engine.IsCurrentLanguageReversed() then
		element:setLeftRight( true, false, elementLeft, elementLeft + self._originalWidth )
	end
	local textWidth, textHeight = element:getTextWidthAndHeight( self._originalWidth )
	if Engine.IsCurrentLanguageReversed() then
		if textWidth > 0 then
			if self._originalWidth < textWidth then
				self:setLeftRight( leftanchor, rightanchor, right - self._originalWidth, right )
			else
				self.savedWidth = textWidth + 2 * elementLeft + exprPadding
				self:setLeftRight( leftanchor, rightanchor, right - self.savedWidth, right )
				if elemAnchorLeft + elemAnchorRight == 0 then
					element:setLeftRight( elemAnchorLeft, elemAnchorRight, elementLeft, elementLeft + textWidth )
				end
			end
		else
			self:setLeftRight( leftanchor, rightanchor, right, right )
		end
		return 
	elseif self._originalWidth < textWidth then
		self:setLeftRight( leftanchor, rightanchor, left, left + self._originalWidth )
	elseif textWidth > 0 then
		self.savedWidth = textWidth + 2 * elementLeft + exprPadding
		self:setLeftRight( leftanchor, rightanchor, left, left + self.savedWidth )
	else
		self:setLeftRight( leftanchor, rightanchor, left, left )
	end
	local topanchor, bottomanchor, top, bottom = self:getLocalTopBottom()
	self:setTopBottom( topanchor, bottomanchor, bottom - textHeight - exprPaddingTopBottom, bottom )
end

function ScaleWidgetToLabelWrappedLeftAlign( self, element, exprPadding, exprPaddingTopBottom )
	if not element then
		return 
	end
	local leftanchor, rightanchor, left, right = self:getLocalLeftRight()
	local _, _, elementLeft, _ = element:getLocalLeftRight()
	if not self._originalWidth then
		self._originalWidth = right - left
	end
	local textWidth, textHeight = element:getTextWidthAndHeight()
	if self._originalWidth < textWidth or Engine.IsCurrentLanguageReversed() then
		textWidth = self._originalWidth
	end
	if textWidth > 0 then
		self.savedWidth = textWidth + 2 * elementLeft + exprPadding
		self:setLeftRight( true, false, 0, self.savedWidth )
	else
		self:setLeftRight( leftanchor, rightanchor, left, left )
	end
	local topanchor, bottomanchor, top, _ = self:getLocalTopBottom()
	self:setTopBottom( topanchor, bottomanchor, top, textHeight + top + exprPaddingTopBottom )
end

function ScaleWidgetToLabelWrappedCenterAlign( self, element, exprPadding, exprPaddingTopBottom )
	if not element then
		return 
	end
	local leftanchor, rightanchor, left, right = self:getLocalLeftRight()
	local _, _, elementLeft, _ = element:getLocalLeftRight()
	if not self._originalWidth then
		self._originalWidth = right - left
	end
	local textWidth, textHeight = element:getTextWidthAndHeight( self._originalWidth )
	if self._originalWidth < textWidth then
		textWidth = self._originalWidth
	end
	if textWidth > 0 then
		self.savedWidth = textWidth + 2 * elementLeft + exprPadding
		self:setLeftRight( false, false, -self.savedWidth / 2, self.savedWidth / 2 )
	else
		self:setLeftRight( leftanchor, rightanchor, left, left )
	end
	local topanchor, bottomanchor, top, _ = self:getLocalTopBottom()
	self:setTopBottom( topanchor, bottomanchor, top, textHeight + top + exprPaddingTopBottom )
end

function ScaleWidgetToLabelWrappedRightAlign( self, element, exprPadding, exprPaddingTopBottom )
	if not element then
		return 
	end
	local leftanchor, rightanchor, left, right = self:getLocalLeftRight()
	local _, _, elementLeft, _ = element:getLocalLeftRight()
	if not self._originalWidth then
		self._originalWidth = right - left
	end
	local textWidth, textHeight = element:getTextWidthAndHeight( self._originalWidth )
	if self._originalWidth < textWidth then
		textWidth = self._originalWidth
	end
	if textWidth > 0 then
		self.savedWidth = textWidth + 2 * elementLeft + exprPadding
		self:setLeftRight( false, true, -self.savedWidth, 0 )
	else
		self:setLeftRight( leftanchor, rightanchor, left, left )
	end
	local topanchor, bottomanchor, top, _ = self:getLocalTopBottom()
	self:setTopBottom( topanchor, bottomanchor, top, textHeight + top + exprPaddingTopBottom )
end

function UpdateWidgetHeightToMultilineText( self, element, exprPadding )
	local _, textHeight = element:getTextWidthAndHeight()
	if textHeight > 0 then
		self:setHeight( textHeight + exprPadding * 2 )
	else
		self:setHeight( 0 )
	end
end

function UpdateWidgetHeightToMultilineTextWithMinimum( self, element, exprPadding, exprMinimumHeight )
	local _, textHeight = element:getTextWidthAndHeight()
	self:setHeight( math.max( textHeight + exprPadding * 2, exprMinimumHeight ) )
end

function OverrideWidgetWidth( self, newWidth )
	local leftanchor, rightanchor, left, right = self:getLocalLeftRight()
	self.savedWidth = right - left
	self.widthOverridden = true
	self:setWidth( newWidth )
end

function RestoreWidgetWidth( self )
	if self.savedWidth == nil then
		return 
	else
		self.widthOverridden = nil
		self:setWidth( self.savedWidth )
		self.savedWidth = nil
	end
end

function SetWidth( self, newWidth )
	self.savedWidth = self:getWidth()
	self:setWidth( newWidth )
end

function SetHeight( self, expressionArg )
	self:setHeight( expressionArg )
end

function ScaleToElementWidth( self, element )
	local leftanchor, rightanchor, left, right = element:getLocalLeftRight()
	self:setWidth( right - left )
end

function ScaleToElementHeight( self, element, exprPaddingBottom )
	local leftanchor, rightanchor, top, bottom = element:getLocalTopBottom()
	self:setHeight( bottom - top + exprPaddingBottom )
end

function RecalculateHeight( self )
	local height = 0
	local child = self:getFirstChild()
	while child ~= nil do
		local leftanchor, rightanchor, top, bottom = child:getLocalTopBottom()
		height = height + bottom - top
		child = child:getNextSibling()
	end
	self:setHeight( height )
end

function TrimLabelIfLanguageReversed( self, element )
	if Engine.IsCurrentLanguageReversed() then
		if element == nil then
			return 
		else
			local elemleftanchor, elemrightanchor, elementLeft, elementRight = element:getLocalLeftRight()
			local textWidth = element:getTextWidth()
			element:setLeftRight( elemleftanchor, elemrightanchor, elementLeft, elementLeft + textWidth + 2 )
			return 
		end
	else
		
	end
end

function ScaleParentWidgetToLabel( self, element, exprPadding )
	local f338_local0 = self
	local parent = self:getParent()
	local f338_local1 = f338_local0 and parent
	if element == nil or f338_local1 == nil then
		return 
	elseif f338_local1._originalWidth == nil then
		local _, _, left, right = f338_local1:getLocalLeftRight()
		f338_local1._originalWidth = right - left
	end
	if Engine.IsCurrentLanguageReversed() then
		local selfLeftAnchor, _, left, right = self:getLocalLeftRight()
		local leftanchor, rightanchor, left, right = f338_local1:getLocalLeftRight()
		local elemleftanchor, elemrightanchor, elementLeft, elementRight = element:getLocalLeftRight()
		local textWidth = element:getTextWidth()
		f338_local1:setLeftRight( leftanchor, rightanchor, right - textWidth - 2 * (left + elementLeft) - exprPadding, right )
		if elemleftanchor + elemrightanchor == 0 then
			element:setLeftRight( elemleftanchor, elemrightanchor, elementLeft, elementLeft + textWidth + 2 )
		end
		return 
	end
	local _, _, left, right = self:getLocalLeftRight()
	local leftanchor, rightanchor, left, right = f338_local1:getLocalLeftRight()
	local _, elemrightanchor, elementLeft, elementRight = element:getLocalLeftRight()
	local textWidth = element:getTextWidth()
	f338_local1:setLeftRight( leftanchor, rightanchor, left, left + textWidth + 2 * (left + elementLeft) + exprPadding )
end

function ScaleParentWidgetToElementLabel( self, elementName, exprPadding )
	if self[elementName] then
		ScaleParentWidgetToLabel( self, self[elementName], exprPadding )
	end
end

function RestoreParentToOriginalWidth( self )
	local f340_local0 = self
	local parent = self:getParent()
	local f340_local1 = f340_local0 and parent
	if f340_local1 and f340_local1._originalWidth ~= nil then
		local leftanchor, rightanchor, left, _ = f340_local1:getLocalLeftRight()
		f340_local1:setLeftRight( leftanchor, rightanchor, left, left + f340_local1._originalWidth )
	end
end

function ScaleWidgetToLabelRightAligned( self, element, exprPadding )
	if element == nil then
		return 
	elseif Engine.IsCurrentLanguageReversed() then
		local leftanchor, rightanchor, left, right = self:getLocalLeftRight()
		local elemLeftAnchor, elemRightAnchor, elementLeft, elementRight = element:getLocalLeftRight()
		local textWidth = element:getTextWidth()
		if elemLeftAnchor + elemRightAnchor == 0 then
			self:setLeftRight( leftanchor, rightanchor, right - textWidth - 2 * elementLeft - exprPadding, right )
		elseif elemRightAnchor == 1 then
			self:setLeftRight( leftanchor, rightanchor, right - textWidth + 2 * elementRight - exprPadding, right )
			element:setLeftRight( elemLeftAnchor, elemRightAnchor, elementRight - textWidth - exprPadding, elementRight )
		end
	else
		local leftanchor, rightanchor, left, right = self:getLocalLeftRight()
		local _, elemRightAnchor, elementLeft, elementRight = element:getLocalLeftRight()
		local textWidth = element:getTextWidth()
		self:setLeftRight( leftanchor, rightanchor, right - textWidth + 2 * elementRight - exprPadding, right )
	end
end

function SetParentWidgetWidth( self, element, exprWidth )
	local f342_local0 = self
	local parent = self:getParent()
	local f342_local1 = f342_local0 and parent
	if f342_local1 == nil then
		return 
	else
		local leftanchor, rightanchor, left, right = f342_local1:getLocalLeftRight()
		f342_local1:setLeftRight( leftanchor, rightanchor, left, left + exprWidth )
	end
end

function ScaleToFitImageElement( self, element, imageElementName )
	local imageElement = self[imageElementName]
	if imageElement then
		local w, h = imageElement:getImageDimensions()
		if w > 0 and h > 0 then
			local _, _, imageOffsetLeft = imageElement:getLocalLeftRight()
			local _, _, imageOffsetTop, imageOffsetBottom = imageElement:getLocalTopBottom()
			local _, _, elementLeft, _ = element:getLocalLeftRight()
			local _, _, elementTop, elementBottom = element:getLocalTopBottom()
			local imageHeight = elementBottom + imageOffsetBottom - imageOffsetTop
			local imageWidth = imageOffsetLeft * 2 + imageHeight * w / h
			local imageWidthRounded = math.floor( (imageWidth - 1) / 2 ) * 2
			element:setLeftRight( true, false, elementLeft, imageWidthRounded )
			element:setTopBottom( true, false, elementTop, elementBottom )
		end
	end
end

function CloseInGameMenu( self, event )
	CoD.InGameMenu.CloseAllInGameMenus( self, event )
end

function PacifierSetMessage( self, controller, msg )
	self.lblMessage.Text0.setText( msg )
end

function SetDOAGameMode( self, element, controller )
	Engine.SetDvar( "cp_queued_level", "" )
	SetMap( controller, "cp_doa_bo3", false )
	Engine.SetGametype( "doa" )
	Engine.SetDvar( "ui_useloadingmovie", "1" )
	Engine.SetDvar( "skipto", "" )
	Engine.SetDvar( "sv_saveGameSkipto", "" )
	Engine.SetDvar( "ui_blocksaves", "1" )
	if not IsLive() then
		local f346_local0 = Engine.SetLobbyUIScreen
		local f346_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_DOA )
		f346_local0( f346_local1.id )
	else
		local f346_local0 = Engine.SetLobbyUIScreen
		local f346_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_DOA )
		f346_local0( f346_local1.id )
	end
end

function StartDOAGame( self, element, controller )
	if Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 4 then
		local data = {
			controller = controller,
			maxLocalClients = 4
		}
		CoD.OverlayUtility.CreateOverlay( controller, self, "LobbyLocalClientWarning", data )
		return 
	else
		SetDOAGameMode( self, element, controller )
		CoD.LobbyUtility.LaunchGame( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
	end
end

function StartNewGame( self, element, controller )
	if Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 2 then
		local data = {
			controller = controller,
			maxLocalClients = 2
		}
		CoD.OverlayUtility.CreateOverlay( controller, self, "LobbyLocalClientWarning", data )
		return 
	else
		Engine.SetDvar( "cp_queued_level", "" )
		local defaultMap = LuaUtils.GetDefaultMap( LobbyData.GetCurrentMenuTarget() )
		SetMap( controller, defaultMap, false )
		Engine.SetDvar( "ui_useloadingmovie", "1" )
		Engine.SetDvar( "skipto", "" )
		Engine.SetDvar( "sv_saveGameSkipto", "" )
		Engine.SetDvar( "ui_blocksaves", "0" )
		CoD.LobbyUtility.LaunchGame( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
	end
end

function ReplaySelectedMission( self, element, controller )
	Engine.SetDvar( "ui_useloadingmovie", "1" )
	Engine.SetDvar( "skipto", "" )
	Engine.SetDvar( "sv_saveGameSkipto", "" )
	Engine.SetDvar( "ui_blocksaves", "0" )
	CoD.LobbyUtility.LaunchGame( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function ResumeFromCheckpoint( self, element, controller )
	if Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 2 then
		local data = {
			controller = controller,
			maxLocalClients = 2
		}
		CoD.OverlayUtility.CreateOverlay( controller, self, "LobbyLocalClientWarning", data )
		return 
	end
	Engine.SetDvar( "cp_queued_level", "" )
	if Engine.IsCampaignModeZombies() then
		SetMap( controller, Engine.GetSavedMap(), false )
	else
		local map = Engine.GetSavedMapQueuedMap()
		if map ~= "" then
			SetMap( controller, map, true )
		else
			SetMap( controller, Engine.GetSavedMap(), false )
		end
	end
	local skipto = Engine.GetSavedMapSkipto()
	Engine.RestoreSavedWorldObject()
	Engine.SetDvar( "ui_useloadingmovie", "1" )
	Engine.SetDvar( "skipto", skipto )
	Engine.SetDvar( "sv_saveGameSkipto", skipto )
	Engine.SetDvar( "ui_blocksaves", "0" )
	CoD.LobbyUtility.LaunchGame( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function GotoSafehouse( self, element, controller )
	if Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 2 then
		local data = {
			controller = controller,
			maxLocalClients = 2
		}
		CoD.OverlayUtility.CreateOverlay( controller, self, "LobbyLocalClientWarning", data )
		return 
	end
	local map = Engine.GetSavedMapQueuedMap()
	if map ~= "" then
		SetMap( controller, map, true )
	else
		SetMap( controller, Engine.GetSavedMap(), true )
	end
	Engine.RestoreSavedWorldObject()
	Engine.SetDvar( "ui_useloadingmovie", "1" )
	Engine.SetDvar( "skipto", "" )
	Engine.SetDvar( "sv_saveGameSkipto", "" )
	Engine.SetDvar( "ui_blocksaves", "1" )
	CoD.LobbyUtility.LaunchGame( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function SetLobbyServerBrowserFilterForE3( self, element, controller )
	local filter = nil
	if Dvar.ui_execdemo_cp:get() == true then
		filter = Enum.LobbyMainMode.LOBBY_MAINMODE_CP
	elseif Dvar.ui_execdemo_e3:get() == true or Dvar.ui_execdemo_e3_host:get() == true then
		filter = Enum.LobbyMainMode.LOBBY_MAINMODE_MP
	end
	if filter == nil then
		return 
	else
		Engine.LobbyServerListSetMainModeFilter( filter )
		CoD.LobbyUtility.LobbyLANServerBrowserFilterUpdateEvent( self, controller )
	end
end

function CloseAllInGameMenus( self, controller )
	if not Dvar.ui_isSaving:get() then
		CoD.InGameMenu.CloseAllInGameMenus( self, {
			name = "close_all_ingame_menus",
			controller = controller
		} )
	end
end

function GoBackThroughAllAndClose( menu, controller )
	while menu do
		while not menu.menuName do
			menu = menu:getParent()
		end
		local navStackIndex, menuIndex = CoD.Menu.GetNavigationForMenu( controller, menu.menuName )
		if navStackIndex == 1 then
			Close( menu, controller )
			return 
		end
		menu = GoBack( menu, controller )
	end
	while not menu.menuName do
		menu = menu:getParent()
	end
	local navStackIndex, menuIndex = CoD.Menu.GetNavigationForMenu( controller, menu.menuName )
	if navStackIndex == 1 then
		Close( menu, controller )
		return 
	end
	menu = GoBack( menu, controller )
end

function GoBackThroughAll( menu, controller )
	while menu do
		menu = GoBack( menu, controller )
	end
end

function LobbyGoBack( self, controller )
	local lobbyNav = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local uiID = Engine.GetModelValue( lobbyNav )
	if lobbyNav then
		local f356_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_LAN )
		if uiID ~= f356_local0.id then
			f356_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_ONLINE )
			if uiID ~= f356_local0.id then
				f356_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.DIRECTOR_ONLINE )
				if uiID == f356_local0.id then
				
				else
					CoD.LobbyUtility.LobbyGoBack( self, controller )
					self:playSound( "menu_go_back" )
				end
			end
		end
		DisableAllMenuInput( self, true )
	end
	CoD.LobbyUtility.LobbyGoBack( self, controller )
	self:playSound( "menu_go_back" )
end

function DisplayPlayGoWarning( self, controller )
	local popup = CoD.OverlayUtility.CreateOverlay( controller, self, "GenericModalDialog", "", "MENU_STILLDOWNLOADING", "t7_icon_connect_overlays_bkg", {
		"MPUI_OK"
	}, function ( modalResult )
		return true
	end )
	popup.anyControllerAllowed = true
	popup.unusedControllerAllowed = true
end

function LobbyBeginPlay( self, controller )
	if (IsOrbis() or IsDurango()) and (Engine.IsMpStillDownloading() or Engine.IsZmStillDownloading() or Engine.IsCpStillDownloading()) and not CoD.perController[controller].hasShownPlaygoWarning then
		CoD.perController[controller].hasShownPlaygoWarning = true
		DisplayPlayGoWarning( self, controller )
		return false
	else
		CoD.LobbyUtility.BeginPlay( self, controller )
		return true
	end
end

function GoBackAndLobbyBeginPlay( self, controller )
	local menu = GoBack( self, controller )
	LobbyBeginPlay( menu, controller )
end

function SizeToSafeArea( element, controller )
	element:sizeToSafeArea( controller )
end

function GoBackMultiple( self, controller, param )
	local menu = self
	local numPopups = tonumber( param )
	if numPopups == nil then
		return 
	end
	while numPopups > 0 do
		menu = GoBack( menu, controller )
		numPopups = numPopups - 1
	end
	return menu
end

function GoBack( self, controller )
	if Rat and Rat.DisableGoBack then
		return 
	end
	while not self.menuName do
		self = self:getParent()
	end
	local navStackIndex, menuIndex = CoD.Menu.GetNavigationForMenu( controller, self.menuName )
	if navStackIndex and menuIndex then
		self.previousMenuName = CoD.MenuNavigation[controller][navStackIndex][menuIndex - 1]
		CoD.MenuNavigation[controller][navStackIndex][menuIndex] = nil
		if #CoD.MenuNavigation[controller][navStackIndex] == 0 then
			table.remove( CoD.MenuNavigation[controller], navStackIndex )
		else
			
		end
	end
	self:saveState()
	return self:goBack( controller )
end

function DelayGoBack( menu, controller )
	local timer = LUI.UITimer.newElementTimer( 0, true, function ()
		GoBack( menu, controller )
	end )
	menu:addElement( timer )
end

function GoBackToMenu( menu, controller, noDependencyMenuName )
	local navStackIndex, navMenuIndex = CoD.Menu.GetNavigationForMenuToMenu( controller, menu.menuName, noDependencyMenuName )
	local ourStackIndex, ourMenuIndex = CoD.Menu.GetNavigationForMenu( controller, menu.menuName )
	local menuStackIndex, menuIndex = CoD.Menu.GetNavigationForMenu( controller, noDependencyMenuName )
	if not ourStackIndex or not ourMenuIndex or not menuStackIndex or not menuIndex then
		return GoBack( menu, controller )
	elseif menu.menuName == noDependencyMenuName then
		return 
	elseif menu.occludedMenu and menu.occludedMenu.menuName == noDependencyMenuName then
		menu.previousMenuName = nil
		table.remove( CoD.MenuNavigation[controller], ourStackIndex )
	elseif navStackIndex and navMenuIndex then
		menu.previousMenuName = CoD.MenuNavigation[controller][navStackIndex][navMenuIndex]
		local stackSize = #CoD.MenuNavigation[controller][navStackIndex]
		for i = navMenuIndex + 1, stackSize, 1 do
			CoD.MenuNavigation[controller][navStackIndex][i] = nil
		end
		if #CoD.MenuNavigation[controller][navStackIndex] == 0 then
			table.remove( CoD.MenuNavigation[controller], navStackIndex )
		end
		if ourStackIndex ~= navStackIndex then
			table.remove( CoD.MenuNavigation[controller], ourStackIndex )
		end
	elseif menu.occludedMenu then
		local currentMenu = menu
		for stack = ourStackIndex, menuStackIndex + 1, -1 do
			local f366_local2 = stack
			if not currentMenu.occludedMenu then
				return currentMenu
			end
			currentMenu = GoBackToMenu( currentMenu, controller, currentMenu.occludedMenu.menuName )
		end
		if currentMenu.menuName == noDependencyMenuName then
			return currentMenu
		end
		return GoBackToMenu( currentMenu, controller, noDependencyMenuName )
	end
	menu:saveState()
	return menu:goBack( controller )
end

function GoBackAndUpdateStateOnPreviousMenu( self, controller )
	local previousMenu = GoBack( self, controller )
	previousMenu:processEvent( {
		name = "update_state",
		controller = controller
	} )
	return previousMenu
end

function GoBackAndSetClassItem( self, element, controller )
	local previousMenu = GoBack( self, controller )
	SetClassItem( previousMenu, element, controller )
	previousMenu:processEvent( {
		name = "update_state",
		controller = controller
	} )
	return previousMenu
end

function GoBackAndUpdateNavigation( self, element, controller )
	local previousMenu = GoBack( self, controller )
	if CoD.CACUtility.CustomClass_LastClassNum and previousMenu.menuName == "CustomClass" then
		previousMenu:navigateTo( CoD.CACUtility.CustomClass_LastSelection )
		previousMenu:processEvent( {
			name = "update_state",
			controller = controller
		} )
	end
	return previousMenu
end

function GoBackToCustomClassMenu( self, controller )
	local customClassMenu = GoBackToMenu( self, controller, "CustomClass" )
	if customClassMenu then
		customClassMenu:processEvent( {
			name = "update_state",
			controller = controller
		} )
		if customClassMenu.menuName == "CustomClass" then
			SetFocusToLoadoutWidgetAfterSetItem( customClassMenu )
		end
	end
end

function Close( self, controller )
	while not self.menuName do
		self = self:getParent()
	end
	local navStackIndex, menuIndex = CoD.Menu.GetNavigationForMenu( controller, self.menuName )
	if navStackIndex and menuIndex then
		self.previousMenuName = CoD.MenuNavigation[controller][navStackIndex][menuIndex - 1]
		CoD.MenuNavigation[controller][navStackIndex][menuIndex] = nil
		if #CoD.MenuNavigation[controller][navStackIndex] == 0 then
			table.remove( CoD.MenuNavigation[controller], navStackIndex )
		end
	end
	self:saveState()
	self:close()
end

function NavigateToLobbyCustom( self, controller, expressionArg )
	if IsIntDvarNonZero( "mp_prototype" ) and Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 1 then
		CoD.OverlayUtility.CreateOverlay( controller, self, "LobbyLeavePopup", LuaEnum.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY, expressionArg )
		return 
	else
		CoD.LobbyUtility.NavigateToLobby( self, expressionArg, false, controller )
	end
end

function NavigateToLobby_OccludedMenu( self, element, controller, param, menu )
	if self.occludedMenu ~= nil then
		CoD.LobbyUtility.NavigateToLobby( self.occludedMenu, param, false, controller )
	end
end

function NavigateToLobby_SelectionList( self, element, controller, param, menu )
	if param == LuaEnum.UI.ONLINE_MP then
		if Engine.PushAnticheatMessageToUI( controller, LuaEnum.ANTICHEAT_MESSAGE_GROUPS.MP ) then
			DisplayAnticheatMessage( self, controller, LuaEnum.ANTICHEAT_MESSAGE_GROUPS.MP, "", "" )
			return 
		end
		for i = 0, LuaDefine.MAX_CONTROLLER_COUNT - 1, 1 do
			if CheckIfFeatureIsBanned( i, LuaEnum.FEATURE_BAN.LIVE_MP ) then
				LuaUtils.UI_ShowErrorMessageDialog( controller, GetFeatureBanInfo( i, LuaEnum.FEATURE_BAN.LIVE_MP ) )
				return 
			end
		end
		local numClients = Engine.GetUsedControllerCount()
		if numClients > 1 then
			for i = 0, LuaDefine.MAX_CONTROLLER_COUNT - 1, 1 do
				if CheckIfFeatureIsBanned( i, LuaEnum.FEATURE_BAN.MP_SPLIT_SCREEN ) then
					LuaUtils.UI_ShowErrorMessageDialog( controller, GetFeatureBanInfo( i, LuaEnum.FEATURE_BAN.MP_SPLIT_SCREEN ) )
					return 
				end
			end
		end
	end
	if param == LuaEnum.UI.ONLINE_ZM then
		if Engine.PushAnticheatMessageToUI( controller, LuaEnum.ANTICHEAT_MESSAGE_GROUPS.ZM ) then
			DisplayAnticheatMessage( self, controller, LuaEnum.ANTICHEAT_MESSAGE_GROUPS.ZM, "", "" )
			return 
		end
		for i = 0, LuaDefine.MAX_CONTROLLER_COUNT - 1, 1 do
			if CheckIfFeatureIsBanned( i, LuaEnum.FEATURE_BAN.LIVE_ZM ) then
				LuaUtils.UI_ShowErrorMessageDialog( controller, GetFeatureBanInfo( i, LuaEnum.FEATURE_BAN.LIVE_ZM ) )
				return 
			end
		end
		local numClients = Engine.GetUsedControllerCount()
		if numClients > 1 then
			for i = 0, LuaDefine.MAX_CONTROLLER_COUNT - 1, 1 do
				if CheckIfFeatureIsBanned( i, LuaEnum.FEATURE_BAN.ZM_SPLIT_SCREEN ) then
					LuaUtils.UI_ShowErrorMessageDialog( controller, GetFeatureBanInfo( i, LuaEnum.FEATURE_BAN.ZM_SPLIT_SCREEN ) )
					return 
				end
			end
		end
		local buffer = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_ZM_LOADOUTS )
		if buffer then
			local cacLoadouts = buffer.cacLoadouts
			if cacLoadouts then
				local totalVariants = #cacLoadouts.variant
				for index = 0, totalVariants - 1, 1 do
					local variantState = cacLoadouts.variant[index]
					variantState.variantIndex:set( index )
				end
			end
		end
	end
	if param == LuaEnum.UI.ONLINE_CP or param == LuaEnum.UI.ONLINE_CP2 or param == LuaEnum.UI.ONLINE_DOA then
		for i = 0, LuaDefine.MAX_CONTROLLER_COUNT - 1, 1 do
			if CheckIfFeatureIsBanned( i, LuaEnum.FEATURE_BAN.LIVE_CP ) then
				LuaUtils.UI_ShowErrorMessageDialog( controller, GetFeatureBanInfo( i, LuaEnum.FEATURE_BAN.LIVE_CP ) )
				return 
			end
		end
		local numClients = Engine.GetUsedControllerCount()
		if numClients > 1 then
			for i = 0, LuaDefine.MAX_CONTROLLER_COUNT - 1, 1 do
				if CheckIfFeatureIsBanned( i, LuaEnum.FEATURE_BAN.CP_SPLIT_SCREEN ) then
					LuaUtils.UI_ShowErrorMessageDialog( controller, GetFeatureBanInfo( i, LuaEnum.FEATURE_BAN.CP_SPLIT_SCREEN ) )
					return 
				end
			end
		end
	end
	if param == LuaEnum.UI.ONLINE_MP_PUBLIC_STAGING then
		for i = 0, LuaDefine.MAX_CONTROLLER_COUNT - 1, 1 do
			if CheckIfFeatureIsBanned( i, LuaEnum.FEATURE_BAN.MP_PUBLIC_MATCH ) then
				LuaUtils.UI_ShowErrorMessageDialog( controller, GetFeatureBanInfo( i, LuaEnum.FEATURE_BAN.MP_PUBLIC_MATCH ) )
				return 
			end
		end
	end
	if param == LuaEnum.UI.ONLINE_MP_ARENA_STAGING then
		if Engine.PushAnticheatMessageToUI( controller, LuaEnum.ANTICHEAT_MESSAGE_GROUPS.ARENA ) then
			DisplayAnticheatMessage( self, controller, LuaEnum.ANTICHEAT_MESSAGE_GROUPS.ARENA, "", "" )
			return 
		end
		for i = 0, LuaDefine.MAX_CONTROLLER_COUNT - 1, 1 do
			if CheckIfFeatureIsBanned( i, LuaEnum.FEATURE_BAN.ARENA_GAMEPLAY ) then
				LuaUtils.UI_ShowErrorMessageDialog( controller, GetFeatureBanInfo( i, LuaEnum.FEATURE_BAN.ARENA_GAMEPLAY ) )
				return 
			end
		end
	end
	if param == LuaEnum.UI.ONLINE_MP_ARENA then
		local playlistID = Engine.GetPlaylistID()
		local maxParty = Engine.GetPlaylistMaxPartySize( playlistID )
		local clientCount = Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyClientFilterType.LOBBY_CLIENT_FILTER_TYPE_ALL )
		if maxParty < clientCount then
			LuaUtils.UI_ShowErrorMessageDialog( controller, Engine.Localize( "MENU_ARENA_TOO_MANY_PLAYERS", maxParty ) )
			return 
		end
	end
	if param == LuaEnum.UI.ONLINE_FR then
		for i = 0, LuaDefine.MAX_CONTROLLER_COUNT - 1, 1 do
			if CheckIfFeatureIsBanned( i, LuaEnum.FEATURE_BAN.FREERUN ) then
				LuaUtils.UI_ShowErrorMessageDialog( controller, GetFeatureBanInfo( i, LuaEnum.FEATURE_BAN.FREERUN ) )
				return 
			end
		end
	end
	if param == LuaEnum.UI.ONLINE_ZM_CUSTOM then
		local lastprivate = Engine.GetProfileVarInt( controller, "com_privategame_ranked_zm" )
		Dvar.zm_private_rankedmatch:set( lastprivate ~= 0 )
		Engine.RunPlaylistRules( controller )
	end
	local toTarget = LobbyData.GetLobbyMenuByName( param )
	if toTarget.eGameModes == Enum.eGameModes.MODE_GAME_LEAGUE and Engine.GetDvarBool( "arena_maintenance" ) == true then
		LuaUtils.UI_ShowErrorMessageDialog( controller, "MENU_ARENA_MAINTENANCE_DESC", "MENU_ARENA_MAINTENANCE_CAPS" )
		return 
	end
	local publicProbationEnabled = Engine.GetDvarBool( "probation_public_enabled" )
	local leagueProbationEnabled = Engine.GetDvarBool( "probation_league_enabled" )
	if toTarget.isGame and (toTarget.eGameModes == Enum.eGameModes.MODE_GAME_MATCHMAKING_PLAYLIST or toTarget.eGameModes == Enum.eGameModes.MODE_GAME_LEAGUE) then
		Engine.ProbationCheckForProbation( controller, toTarget.eGameModes )
		local probationTime = Engine.LobbyClient_GetProbationTime( controller, toTarget.eGameModes )
		if probationTime > 0 then
			local probationTimeString = Engine.SecondsAsTime( probationTime )
			if publicProbationEnabled and toTarget.eGameModes == Enum.eGameModes.MODE_GAME_MATCHMAKING_PLAYLIST then
				LuaUtils.UI_ShowErrorMessageDialog( controller, Engine.Localize( "MENU_PROBATION_GIVEN_PUBLIC_MATCH", probationTimeString ), "MENU_PROBATION_CAPS" )
				return 
			elseif leagueProbationEnabled and toTarget.eGameModes == Enum.eGameModes.MODE_GAME_LEAGUE then
				LuaUtils.UI_ShowErrorMessageDialog( controller, Engine.Localize( "MENU_PROBATION_GIVEN_ARENA_MATCH", probationTimeString ), "MENU_PROBATION_CAPS" )
				return 
			end
		elseif Engine.LobbyHost_AnyClientInProbationForGameMode( toTarget.eGameModes ) then
			if publicProbationEnabled and toTarget.eGameModes == Enum.eGameModes.MODE_GAME_MATCHMAKING_PLAYLIST then
				LuaUtils.UI_ShowErrorMessageDialog( controller, "MENU_PROBATION_PARTY_PUBLIC_MATCH" )
				return 
			elseif leagueProbationEnabled and toTarget.eGameModes == Enum.eGameModes.MODE_GAME_LEAGUE then
				LuaUtils.UI_ShowErrorMessageDialog( controller, "MENU_PROBATION_PARTY_ARENA_MATCH" )
				return 
			end
		end
	end
	UpdateDifficulty( self, param, controller )
	CoD.LobbyUtility.NavigateToLobby( menu, param, false, controller )
end

function NavigateToLobby_FirstTimeFlowMP( self, element, controller, menu )
	if IsLAN() then
		local f375_local0 = NavigateToLobby_SelectionList
		local f375_local1 = self
		local f375_local2 = element
		local f375_local3 = controller
		local f375_local4 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_MP )
		f375_local0( f375_local1, f375_local2, f375_local3, f375_local4.name, menu )
	else
		local f375_local0 = NavigateToLobby_SelectionList
		local f375_local1 = self
		local f375_local2 = element
		local f375_local3 = controller
		local f375_local4 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP )
		f375_local0( f375_local1, f375_local2, f375_local3, f375_local4.name, menu )
	end
end

function NavigateToLobby_FirstTimeFlowCP( self, element, controller, menu )
	if IsLAN() then
		local f376_local0 = NavigateToLobby_SelectionList
		local f376_local1 = self
		local f376_local2 = element
		local f376_local3 = controller
		local f376_local4 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP )
		f376_local0( f376_local1, f376_local2, f376_local3, f376_local4.name, menu )
	else
		local f376_local0 = NavigateToLobby_SelectionList
		local f376_local1 = self
		local f376_local2 = element
		local f376_local3 = controller
		local f376_local4 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP )
		f376_local0( f376_local1, f376_local2, f376_local3, f376_local4.name, menu )
	end
end

function NavigateToLobby_SelectionListCampaignZombies( self, element, controller, param, menu )
	if IsLAN() then
		local f377_local0 = NavigateToLobby_SelectionList
		local f377_local1 = self
		local f377_local2 = element
		local f377_local3 = controller
		local f377_local4 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP2 )
		f377_local0( f377_local1, f377_local2, f377_local3, f377_local4.name, menu )
	else
		local f377_local0 = NavigateToLobby_SelectionList
		local f377_local1 = self
		local f377_local2 = element
		local f377_local3 = controller
		local f377_local4 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP2 )
		f377_local0( f377_local1, f377_local2, f377_local3, f377_local4.name, menu )
	end
end

function NavigateToLobby_SelectionListDOA( self, element, controller, param, menu )
	if IsLAN() then
		local f378_local0 = NavigateToLobby_SelectionList
		local f378_local1 = self
		local f378_local2 = element
		local f378_local3 = controller
		local f378_local4 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_DOA )
		f378_local0( f378_local1, f378_local2, f378_local3, f378_local4.name, menu )
	else
		local f378_local0 = NavigateToLobby_SelectionList
		local f378_local1 = self
		local f378_local2 = element
		local f378_local3 = controller
		local f378_local4 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_DOA )
		f378_local0( f378_local1, f378_local2, f378_local3, f378_local4.name, menu )
	end
end

function NavigateToMenu( self, menuName, leaveBreadcrumb, controller )
	while self and not self.openMenu do
		self = self:getParent()
	end
	if not self then
		return 
	elseif not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	if not CoD.MenuNavigation[controller] then
		CoD.MenuNavigation[controller] = {
			{
				self.menuName
			}
		}
	end
	local navStackIndex, menuIndex = CoD.Menu.GetNavigationForMenu( controller, self.menuName )
	if not navStackIndex or not menuIndex then
		CoD.MenuNavigation[controller] = {
			{
				self.menuName
			}
		}
		navStackIndex, menuIndex = CoD.Menu.GetNavigationForMenu( controller, self.menuName )
	end
	local userData = self.userData
	local oldMenuName = self.menuName
	local occludedMenu = self.occludedMenu
	local parent = self:getParent()
	self:saveState()
	self:close()
	local newMenu = self:replaceMenu( menuName, controller, nil, userData, oldMenuName, occludedMenu, parent )
	if navStackIndex and menuIndex then
		if leaveBreadcrumb then
			table.insert( CoD.MenuNavigation[controller][navStackIndex], menuIndex + 1, newMenu.menuName )
		else
			CoD.MenuNavigation[controller][navStackIndex][menuIndex] = newMenu.menuName
		end
	end
	return newMenu
end

function NavigateToMenuNoDependency( self, noDependencyMenuName, leaveBreadcrumb, controller )
	NavigateToMenu( self, noDependencyMenuName, leaveBreadcrumb, controller )
end

function OpenPopup( self, menuName, controller, userData, parentMenu )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	if userData == "" then
		userData = nil
	end
	if parentMenu == "" then
		parentMenu = nil
	end
	local newMenu = menu:openPopup( menuName, controller, userData, parentMenu )
	if not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	if not CoD.MenuNavigation[controller] then
		CoD.MenuNavigation[controller] = {}
	end
	local navStackIndex, menuIndex = CoD.Menu.GetNavigationForMenu( controller, self.menuName )
	if navStackIndex and menuIndex then
		table.insert( CoD.MenuNavigation[controller], navStackIndex + 1, {
			newMenu.menuName
		} )
	else
		table.insert( CoD.MenuNavigation[controller], {
			newMenu.menuName
		} )
	end
	return newMenu
end

function OpenPopup_NoDependency( menu, noDependencyMenuName, controller )
	return OpenPopup( menu, noDependencyMenuName, controller )
end

function OpenPopupWithPriority( self, menuName, controller, expressionArg )
	local popup = OpenPopup( self, menuName, controller )
	popup:setPriority( expressionArg )
end

function OpenOverlay( self, menuName, controller, userData, parentMenu )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	if userData == "" then
		userData = nil
	end
	if parentMenu == "" then
		parentMenu = nil
	end
	local newMenu = menu:openOverlay( menuName, controller, userData, parentMenu )
	if not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	if not CoD.MenuNavigation[controller] then
		CoD.MenuNavigation[controller] = {}
	end
	table.insert( CoD.MenuNavigation[controller], {
		newMenu.menuName
	} )
	return newMenu
end

function OpenOverlay_NoDependency( self, noDependencyMenuName, controller, userData, parentMenu )
	OpenOverlay( self, noDependencyMenuName, controller, userData, parentMenu )
end

function OpenSystemOverlay( self, menu, controller, overlayName, expressionArg )
	CoD.OverlayUtility.CreateOverlay( controller, menu, overlayName, controller, expressionArg )
end

function PerformOverlayBack( self, element, controller, menu )
	if HasOverlayBackAction( menu ) then
		menu[CoD.OverlayUtility.GoBackPropertyName]( self, element, controller, menu )
	end
end

function PerformOverlayContinue( self, element, controller, menu )
	if HasOverlayContinueAction( menu ) then
		menu[CoD.OverlayUtility.ContinuePropertyName]( self, element, controller, menu )
	end
end

function GoBackAndOpenOverlayOnParent( self, menuName, controller )
	local previousMenu = GoBack( self, controller )
	previousMenu:openOverlay( menuName, controller )
end

function GoBackAndOpenPopupOnParent( self, menuName, controller )
	local previousMenu = GoBack( self, controller )
	previousMenu:openPopup( menuName, controller )
end

function GenericSmallPopupGoBack( self, controller )
	if self.customGoBackAction then
		self:customGoBackAction( controller )
	else
		GoBack( self, controller )
	end
end

function OpenGenericSmallPopup( menu, controller, contentText, subContentText, image, buttonText, optionalActionOnButtonPress, optionalGoBackAction )
	return CoD.OverlayUtility.CreateOverlay( controller, menu, "GenericPopup", CoD.OverlayUtility.GenericPopupSizes.Small, contentText, subContentText, image, buttonText, optionalActionOnButtonPress, optionalGoBackAction )
end

function OpenGenericLargePopup( menu, controller, contentText, subContentText, image, buttonText, optionalActionOnButtonPress, optionalGoBackAction )
	return CoD.OverlayUtility.CreateOverlay( controller, menu, "GenericPopup", CoD.OverlayUtility.GenericPopupSizes.Large, contentText, subContentText, image, buttonText, optionalActionOnButtonPress, optionalGoBackAction )
end

function SendMenuResponse( self, noDependencyMenuName, response, controller )
	Engine.SendMenuResponse( controller, noDependencyMenuName, response )
end

function SendMenuResponseExpression( controller, customMenuName, expressionArg )
	Engine.SendMenuResponse( controller, customMenuName, expressionArg )
end

function SendOwnMenuResponse( menu, controller, response )
	Engine.SendMenuResponse( controller, menu.menuName, response )
end

function SendFrontendControllerZeroMenuResponse( controller, noDependencyMenuName, response )
	if CoD.isFrontend then
		controller = 0
	end
	Engine.SendMenuResponse( controller, noDependencyMenuName, response )
end

function ClearSavedState( self, controller )
	self:clearSavedState()
end

function ClearMenuSavedState( menu )
	menu:clearSavedState()
end

function PlayClip( self, clipName, controller )
	self:playClip( clipName )
end

function PlayClipOnElement( self, elementAndClip, controller )
	if self[elementAndClip.elementName] then
		self[elementAndClip.elementName]:playClip( elementAndClip.clipName )
	end
end

function PlayClipOnListItemElement( self, element, controller, newClipName )
	element:playClip( newClipName )
end

function SetFocusToElement( self, focusableElementName, controller )
	if self[focusableElementName] then
		self[focusableElementName]:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
end

function SetLoseFocusToElement( self, focusableElementName, controller )
	if self[focusableElementName] then
		self[focusableElementName]:processEvent( {
			name = "lose_focus",
			controller = controller
		} )
	end
end

function SetFocusToSelf( self, controller )
	self:processEvent( {
		name = "gain_focus",
		controller = controller
	} )
end

function SetLoseFocusToSelf( self, controller )
	self:processEvent( {
		name = "lose_focus",
		controller = controller
	} )
end

function SetTextToElement( self, elementName, stringArg )
	if self[elementName] then
		self[elementName]:setText( Engine.Localize( stringArg ) )
	end
end

function MakeElementFocusable( self, elementName, controller )
	if self[elementName] then
		self[elementName]:makeFocusableWithoutResettingNavigation( self )
	end
end

function MakeElementNotFocusable( self, elementName, controller )
	if self[elementName] then
		self[elementName]:makeNotFocusable( self )
	end
end

function MakeFocusable( element )
	element:makeFocusableWithoutResettingNavigation()
end

function MakeNotFocusable( element, controller )
	element:makeNotFocusable()
	if element:isInFocus() then
		element:processEvent( {
			name = "lose_focus",
			controller = controller
		} )
	end
end

function DisableNavigation( self, elementName )
	self[elementName].m_disableNavigation = true
end

function EnableNavigation( self, elementName )
	self[elementName].m_disableNavigation = false
end

function DisableAllMenuInput( menu, booleanArg )
	menu.m_disableAllButtonActions = booleanArg
end

function ClearRecordedFocus( menu, controller )
	CoD.Menu.ClearRecordedFocus( menu, {
		controller = controller
	} )
end

function ModalSelectListOption( self, element, controller )
	if CoD.Menu.ModalDialogInfo.Callback ~= nil and CoD.Menu.ModalDialogInfo.Callback( element.gridInfoTable.zeroBasedIndex ) == true then
		GoBack( self, controller )
	end
end

function ModalGoBack( self, element, controller )
	if CoD.Menu.ModalDialogInfo.Callback ~= nil then
		CoD.Menu.ModalDialogInfo.Callback()
	end
	GoBack( self, controller )
end

function SetResponseYes( self, controller )
	GoBack( self, controller )
	if self.modalCallback then
		self.modalCallback( "yes" )
	end
end

function SetResponseNo( self, controller )
	GoBack( self, controller )
	if self.modalCallback then
		self.modalCallback( "no" )
	end
end

function SetResponseCancel( self, controller )
	GoBack( self, controller )
	if self.modalCallback then
		self.modalCallback( "cancel" )
	end
end

function OpenOptionsMenu( self, element, controller )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	menu:saveState()
	menu:openMenu( "OptionsMenu", controller )
	menu:close()
end

function LoadSaveGameData( self, controller )
	Engine.LoadSaveGame()
end

function RestartMission( self, element, controller )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( controller, menu, "RestartMissionPopup" )
end

function EndTrainingSim( self, element, controller )
	Engine.SendMenuResponse( controller, "StartMenu", "EndTrainingSim" )
	StartMenuResumeGame( self, controller )
	GoBack( self, controller )
end

function CPSelectPublicGameGetRandomMap( self, element, controller )
	local mapsList = {}
	local campaignZombies = Engine.IsCampaignModeZombies()
	local sortMaps = function ( a, b )
		return CoD.MapUtility.MapsTable[a].unique_id < CoD.MapUtility.MapsTable[b].unique_id
	end
	
	for id, mapData in LUI.IterateTableBySortedKeys( CoD.MapUtility.MapsTable, sortMaps, nil ) do
		local f425_local3
		if mapData.campaign_mode ~= Enum.CampaignMode.CAMPAIGNMODE_DEFAULT or campaignZombies then
			if mapData.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_ZOMBIES then
				f425_local3 = campaignZombies
			else
				f425_local3 = false
			end
		else
			local mapValid = true
		end
		if f425_local3 then
			f425_local3 = id ~= "cp_doa_bo3"
		end
		if mapData.session_mode == Enum.eModes.MODE_CAMPAIGN and f425_local3 and mapData.dlc_pack ~= -1 and mapData.isSubLevel == false then
			table.insert( mapsList, {
				properties = {
					mapId = id
				}
			} )
		end
	end
	if mapsList ~= nil and #mapsList > 0 then
		local randomIndex = math.random( 1, #mapsList )
		return mapsList[randomIndex].properties.mapId
	else
		return LuaUtils.GetDefaultMap( LobbyData.GetCurrentMenuTarget() )
	end
end

function CPSelectPublicGame( self, element, controller, param, menu )
	local cpPublicLobbySearchAllModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.cpPublicLobbySearchAll" )
	Engine.SetModelValue( cpPublicLobbySearchAllModel, false )
	Engine.SetDvar( "ui_useloadingmovie", "1" )
	Engine.SetDvar( "skipto", "" )
	Engine.SetDvar( "sv_saveGameSkipto", "" )
	Engine.SetDvar( "ui_blocksaves", "1" )
	if param == "specificMission" then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "cpLobby" ), "public" )
		GoBackAndOpenPopupOnParent( self, "CPMissionSelect", controller )
		return 
	elseif param == "anyMission" then
		element.mapId = CPSelectPublicGameGetRandomMap( self, element, controller )
	else
		element.mapId = Engine.GetSavedMap()
		if CoD.MapUtility.MapsTable[element.mapId] ~= nil and CoD.MapUtility.MapsTable[element.mapId].isSafeHouse then
			element.mapId = Engine.GetSavedMapQueuedMap()
		end
	end
	SetSelectedCPMission( self, element, controller )
	Engine.SetPlaylistID( GetPlaylistIDForSelectedCPMission( self, element, controller ) )
	if param == "anyMission" then
		Engine.SetModelValue( cpPublicLobbySearchAllModel, true )
	end
	local modeAbbr = Engine.GetModeName()
	if Engine.IsCampaignModeZombies() then
		modeAbbr = modeAbbr .. "2"
	end
	if modeAbbr == "Invalid" then
		error( "Invalid mode in matchmaking" )
	end
	local menu = modeAbbr .. "LobbyOnlinePublicGame"
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	GoBack( self, controller )
	CoD.LobbyUtility.NavigateToLobby( self, menu, false, controller )
end

function RestartFromCheckpoint( self, element, controller )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( controller, menu, "RestartCheckpointPopup" )
end

function LaunchLevel( self, element, controller )
	local devmapName = Engine.GetModelValue( element:getModel( controller, "devName" ) )
	if devmapName ~= "" then
		Engine.Exec( controller, "devmap " .. devmapName )
	end
end

function QuitGame( self, element, controller )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( controller, menu, "QuitGamePopup" )
end

function SaveAndQuitGame( self, element, controller )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( controller, menu, "SaveAndQuitGamePopup" )
end

function LaunchSideMission( self, element, controller )
	local mapName = Engine.GetModelValue( element:getModel( controller, "mapName" ) )
	local missionType = Engine.GetModelValue( element:getModel( controller, "missionTypeInternal" ) )
	local missionIndex = Engine.GetModelValue( element:getModel( controller, "missionIndex" ) )
	local lighting = Engine.GetModelValue( element:getModel( controller, "lighting" ) )
	Engine.Exec( controller, "loadside " .. missionIndex .. " " .. mapName .. " " .. missionType .. " " .. lighting )
end

function LaunchDOA( self, element, controller )
	local modeAbbr = Engine.GetModeName()
	modeAbbr = modeAbbr .. "DOA"
	if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "cpLobby" ), "lan" )
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "cpLobby" ), "public" )
	end
	local cpLobbyModel = Engine.GetModel( Engine.GetGlobalModel(), "cpLobby" )
	local cpLobby = Engine.GetModelValue( cpLobbyModel )
	local f433_local0 = Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
	local isPublic = false
	local menu = "LobbyOnlineCustomGame"
	if f433_local0 == true then
		if cpLobby == "public" then
			isPublic = true
			menu = LuaEnum.UI.ONLINE_DOA_PUBLIC
		elseif cpLobby == "custom" then
			menu = LuaEnum.UI.ONLINE_DOA
		end
	else
		menu = LuaEnum.UI.LAN_DOA_CUSTOM
	end
	SetMap( controller, "cp_doa_bo3", true )
	Engine.SetGametype( "doa" )
	local f433_local1 = Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
	local isPublic = false
	if f433_local1 == true then
		local cpLobbyModel = Engine.GetModel( Engine.GetGlobalModel(), "cpLobby" )
		local cpLobby = Engine.GetModelValue( cpLobbyModel )
		if cpLobby == "public" then
			isPublic = true
		end
	end
	CoD.LobbyUtility.NavigateToLobby( self, menu, true, controller )
end

function LaunchSelectedCPMission( self, element, controller )
	local modeAbbr = Engine.GetModeName()
	if Engine.IsCampaignModeZombies() then
		modeAbbr = modeAbbr .. "2"
	end
	if modeAbbr == "Invalid" then
		error( "Invalid mode in matchmaking" )
	end
	local cpLobbyModel = Engine.GetModel( Engine.GetGlobalModel(), "cpLobby" )
	local cpLobby = Engine.GetModelValue( cpLobbyModel )
	local f434_local0 = Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
	local isPublic = false
	local cpzm = ""
	if Engine.IsCampaignModeZombies() then
		cpzm = "2"
	end
	local menu = LuaEnum.UI.ONLINE_CP_CUSTOM
	if f434_local0 == true then
		if cpLobby == "public" then
			isPublic = true
			menu = LuaEnum.UI.ONLINE_CP .. cpzm .. "_public"
		elseif cpLobby == "custom" then
			menu = LuaEnum.UI.ONLINE_CP .. cpzm .. "_custom"
		end
	else
		menu = LuaEnum.UI.LAN_CP .. cpzm .. "_custom"
	end
	if IsElementPropertyValue( element, "classified", true ) then
		self:OpenModalDialog( self, controller, "MENU_OUTOFORDER_PLAY", "MENU_OUTOFORDER_DESC", {
			"MPUI_YES",
			"MPUI_NO"
		}, function ( modalResult )
			if modalResult == 0 then
				local currentStats = Engine.GetPlayerStats( controller, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_CAMPAIGN )
				currentStats.allMapsUnlocked:set( 1 )
				self.MapList:updateDataSource()
			end
			return true
		end )
	else
		SetSelectedCPMission( self, element, controller )
		if isPublic then
			Engine.SetPlaylistID( GetPlaylistIDForSelectedCPMission( self, element, controller ) )
		end
		local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
		local lobbyNav = Engine.GetModelValue( lobbyNavModel )
		local f434_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP_CUSTOM )
		if lobbyNav ~= f434_local1.id then
			f434_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP2_CUSTOM )
			if lobbyNav ~= f434_local1.id then
				f434_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP_CUSTOM )
				if lobbyNav ~= f434_local1.id then
					f434_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP2_CUSTOM )
					if lobbyNav ~= f434_local1.id then
						CoD.LobbyUtility.NavigateToLobby( self, menu, false, controller )
					end
				end
			end
		end
		GoBack( self, controller )
	end
end

function RestartGame( self, element, controller )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( controller, menu, "RestartGamePopup" )
end

function OpenDailyChallengePopup( self, element, controller )
	CoD.OverlayUtility.CreateOverlay( controller, self, "InspectDailyChallengeOverlay", controller )
end

function ChooseClass( self, element, controller, actionParam, menu )
	menu:saveState()
	if IsIntDvarNonZero( "mp_prototype" ) and IsMultiplayer() then
		Engine.SendMenuResponse( controller, "PositionDraft", "opendraft" )
		menu:openMenu( CoD.CACUtility.PositionDraftMenuName, controller )
	else
		menu:openMenu( CoD.CACUtility.ChangeClassMenuName, controller )
	end
	menu:close()
end

function ChooseTeam( self, element, controller, actionParam, menu )
	menu:saveState()
	local changeTeamMenu = menu:openMenu( "ChangeTeam", controller )
	if changeTeamMenu then
		changeTeamMenu.previousMenuId = menu.id
	end
	menu:close()
end

function QuitGame_MP( self, element, controller, actionParam, menu )
	CoD.OverlayUtility.CreateOverlay( controller, menu, "EndGamePopup" )
end

function SendClientScriptDebugMenuNotify( self, element, controller )
	local list = self.cscDebugMenuList
	local index = element.gridInfoTable.zeroBasedIndex + 1
	local model = element:getModel( controller, "name" )
	Engine.SendClientScriptNotify( controller, "script_debug_menu", {
		param1 = Engine.GetModelValue( model ),
		param2 = index
	} )
end

function SendClientScriptDebugMenuCloseMenuNotify( self, element, controller )
	Engine.SendClientScriptNotify( controller, "script_debug_menu", {
		param1 = "close"
	} )
end

function ProcessPlayerCallout( element, controller, model )
	if not IsIntDvarNonZero( "mp_prototype" ) then
		Engine.UpdateCalloutPlayerData( controller, Engine.GetModelValue( Engine.GetModel( model, "arg1" ) ), Engine.GetModelValue( Engine.GetModel( model, "arg2" ) ) )
		element:playClip( "Side" )
	end
end

function ProcessPlayerObituaryCallout( self, element, controller )
	self:playClip( "SlideUp" )
end

function SetMPScoreText( menu, element, controller, model )
	local data = CoD.GetScriptNotifyData( model )
	local scoreName = Engine.GetIString( data[1], "CS_LOCALIZED_STRINGS" )
	local score = data[2]
	if Engine.IsDemoPlaying() == false or CoD.isZombie == false then
		element:AddCenterScore( scoreName, score, data[4] )
		if IsSpecificGadgetInUse( controller, element, "gadget_combat_efficiency" ) then
			local combatEfficiencyScore = data[3]
			if combatEfficiencyScore > 0 then
				element:AddCombatEfficiencyScore( menu, combatEfficiencyScore, controller )
			end
			if combatEfficiencyScore < score then
				element:AddCombatEfficiencyScore( menu, score - combatEfficiencyScore, controller )
			end
		end
	end
end

function SetupStageResultsWidget( self, controller )
	local globalModel = Engine.GetGlobalModel()
	globalModel:create( "StageResults" )
	local f446_local0 = globalModel.StageResults:create( "winningTeam" )
	f446_local0:set( Enum.team_t.TEAM_FREE )
	f446_local0 = globalModel.StageResults:create( "outcomeText" )
	f446_local0:set( "" )
	self:subscribeToGlobalModel( controller, "PerController", "scriptNotify", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue == "show_stage_completion_ui" then
			local data = CoD.GetScriptNotifyData( model )
			local winningTeam = data[1]
			globalModel.StageResults.winningTeam:set( winningTeam )
			local winningTeamOutcomeText = Engine.GetIString( data[2], "CS_LOCALIZED_STRINGS" )
			local losingTeamOutcomeText = Engine.GetIString( data[3], "CS_LOCALIZED_STRINGS" )
			local outcomeText = losingTeamOutcomeText
			if CoD.TeamUtility.GetTeamID( controller ) == winningTeam then
				outcomeText = winningTeamOutcomeText
			end
			globalModel.StageResults.outcomeText:set( outcomeText )
		end
	end )
end

function SetupObjectiveNotificationWidget( self, controller )
	self.ignoreCurrentStateCheck = true
	local perControllerModel = Engine.GetModelForController( controller )
	local f448_local0 = perControllerModel:create( "showGametypeObjectiveHint" )
	f448_local0:set( false )
	f448_local0 = perControllerModel:create( "gametypeObjectiveHint" )
	f448_local0:set( "" )
	f448_local0 = perControllerModel:create( "gametypeObjective" )
	f448_local0:set( "" )
	f448_local0 = perControllerModel:create( "gametypeAttackers" )
	f448_local0:set( false )
	f448_local0 = perControllerModel:create( "gameTypeObjectiveIcon" )
	f448_local0:set( "" )
	self:subscribeToGlobalModel( controller, "PerController", "scriptNotify", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue == "show_gametype_objective_hint" then
			local event = {
				controller = controller,
				name = modelValue,
				data = CoD.GetScriptNotifyData( model )
			}
			perControllerModel.gametypeObjectiveHint:set( Engine.GetIString( event.data[1], "CS_LOCALIZED_STRINGS" ) )
			local f449_local0 = event.data[2]
			if f449_local0 then
				local currentMissionType = Engine.GetIString( event.data[2], "CS_LOCALIZED_STRINGS" )
			end
			perControllerModel.gametypeAttackers:set( event.data[3] == 1 )
			local f449_local1 = f449_local0
			local missionInfo = CoD.WarUtility.MissionInfo[f449_local0]
			local f449_local2 = f449_local1 and missionInfo
			if f449_local2 then
				perControllerModel.gametypeObjective:set( f449_local2.header )
				perControllerModel.gametypeObjectiveIcon:set( f449_local2.icon )
			end
			if not perControllerModel.showGametypeObjectiveHint:set( true ) then
				perControllerModel.showGametypeObjectiveHint:forceNotifySubscriptions()
			end
		end
	end )
end

function TryBootHUD( self, delayMS )
	if not self.hasBooted then
		self:addElement( LUI.UITimer.new( delayMS, "hud_boot", true, self ) )
	end
end

function SetHudHasBooted( self )
	self.hasBooted = true
end

function AddResourceEnergyBar( self, element, controller, event )
	local buttonID = string.sub( event.name, -1, -1 )
	if event.newValue == 1 then
		local energyBar = CoD.ResourceEnergyBar.new()
		energyBar:setupEntity( controller, event.entNum, buttonID )
		self:addElement( energyBar )
	elseif event.newValue == 0 then
		element:removeEntity( event.entNum )
	end
end

function AddWarlordArmorRegenerationBar( self, element, controller, event )
	local buttonID = string.sub( event.name, -1, -1 )
	if event.newValue == 1 then
		local armorRegenerationBar = CoD.WarlordArmorRegenerationBar.new()
		armorRegenerationBar:setupEntity( controller, event.entNum, buttonID )
		self:addElement( armorRegenerationBar )
	elseif event.newValue == 0 then
		element:removeEntity( event.entNum )
	end
end

function AddKillstreakReceivedNotification( self, element, controller, model )
	if IsCodCaster( controller ) then
		if not IsCodCasterProfileValueEqualTo( controller, "shoutcaster_scorestreaks_notification", 1 ) then
			return 
		elseif CoD.SafeGetModelValue( Engine.GetModelForController( controller ), "CodCaster.showLoadout" ) then
			return 
		end
	end
	if element.appendNotification ~= nil then
		local data = CoD.GetScriptNotifyData( model )
		local killstreakIndex = data[1]
		local killstreakName = Engine.Localize( Engine.GetItemName( killstreakIndex ) )
		local notifyString = Engine.ToUpper( Engine.Localize( "MENU_KILLSTREAK_READY", killstreakName ) )
		local descriptionString = Engine.Localize( "MENU_ACTIVATE_KILLSTREAK_INSTR" )
		element:appendNotification( {
			title = notifyString,
			description = descriptionString,
			type = "Killstreak",
			priority = 0
		} )
	end
end

function AddHeroAbilityReceivedNotification( self, element, controller, model )
	if IsCodCaster( controller ) then
		if not IsCodCasterProfileValueEqualTo( controller, "shoutcaster_specialist_notification", 1 ) then
			return 
		elseif CoD.SafeGetModelValue( Engine.GetModelForController( controller ), "CodCaster.showLoadout" ) then
			return 
		end
	end
	if element.appendNotification ~= nil then
		local data = CoD.GetScriptNotifyData( model )
		local heroWeaponIndex = data[1]
		local heroWeaponNameRef = Engine.GetItemName( heroWeaponIndex )
		local heroWeaponName = Engine.ToUpper( Engine.Localize( heroWeaponNameRef ) )
		local notifyString = Engine.ToUpper( Engine.Localize( "MENU_HERO_ABILITY_READY", heroWeaponName ) )
		local descriptionString = Engine.Localize( "MENU_ACTIVATE_HERO_ABILITY_INSTR" )
		if heroWeaponNameRef == "WEAPON_GADGET_RESURRECT" then
			descriptionString = Engine.Localize( "MENU_ACTIVATE_REJACK_INSTR" )
		end
		if Engine.HoldTriangleForWeapon( Engine.GetItemRef( heroWeaponIndex ) ) then
			descriptionString = Engine.Localize( "MENU_ACTIVATE_HERO_WEAPON_INSTR" )
		end
		element:appendNotification( {
			title = notifyString,
			description = descriptionString,
			type = "Ability",
			priority = 1
		} )
	end
end

function AddSlotUnlockedNotification( self, element, controller, model )
	if not IsGametypeSettingsValue( "escalationEnabled", 1 ) then
		return 
	elseif IsCodCaster( controller ) then
		if not IsCodCasterProfileValueEqualTo( controller, "shoutcaster_scorestreaks_notification", 1 ) then
			return 
		elseif CoD.SafeGetModelValue( Engine.GetModelForController( controller ), "CodCaster.showLoadout" ) then
			return 
		end
	end
	if element.appendNotification ~= nil then
		local data = CoD.GetScriptNotifyData( model )
		local slotId = data[1]
		local itemInfo = Engine.GetUnlockableInfoByIndex( slotId )
		if itemInfo then
			local f456_local0 = itemInfo.name
			if not f456_local0 then
			
			else
				local title = Engine.ToUpper( Engine.Localize( "MPUI_X_IS_UNLOCKED", f456_local0 ) )
				element:appendNotification( {
					title = title,
					description = "",
					type = "Slot",
					priority = 0
				} )
			end
		end
		local itemName = ""
	end
end

function AddZombieNotification( self, element, model )
	local data = CoD.GetScriptNotifyData( model )
	element:appendNotification( {
		clip = "TextandImageBasic",
		title = Engine.Localize( Engine.GetIString( data[1], "CS_LOCALIZED_STRINGS" ) ),
		description = ""
	} )
end

function AddZombieBGBNotification( self, element, model )
	local data = CoD.GetScriptNotifyData( model )
	local bgbIndex = data[1]
	local bgbNameLocRef = Engine.GetItemName( bgbIndex )
	local bgbName = Engine.Localize( bgbNameLocRef )
	local bgbDescriptionString = Engine.Localize( bgbNameLocRef .. "_hint" )
	local bgbImage = RegisterImage( GetItemImageFromIndex( bgbIndex ) )
	element:appendNotification( {
		clip = "TextandImageBGB",
		title = bgbName,
		description = bgbDescriptionString,
		bgbImage = bgbImage
	} )
end

function AddZombieBGBTokenNotification( self, element, model )
	self:playSound( "zmb_bgb_token" )
	element:appendNotification( {
		clip = "TextandImageBGBToken",
		title = Engine.Localize( "ZMUI_BGB_TOKEN_AWARD_NOTIFICATION_TITLE" ),
		description = Engine.Localize( "ZMUI_BGB_TOKEN_AWARD_NOTIFICATION_DESC" ),
		bgbImage = RegisterImage( "t7_hud_zm_vial_256" )
	} )
end

function CreatePrematchDraft( self, controller, model )
	if not self.PositionDraft then
		local positionDraft = OpenOverlay( self, "PositionDraft", controller )
		positionDraft:processEvent( {
			name = "update_state",
			controller = controller,
			menu = self
		} )
		self.PositionDraft = positionDraft
		LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
			if self.PositionDraft then
				self.PositionDraft:close()
			end
		end )
		LUI.OverrideFunction_CallOriginalSecond( positionDraft, "close", function ()
			if self.PositionDraft then
				self.PositionDraft = nil
			end
		end )
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "isInPrematchPeriod" ), 1 )
end

function CreatePrematchTimer( self, controller, model )
	local data = CoD.GetScriptNotifyData( model )
	local endTime = data[1]
	if endTime and not self.PrematchCountdown then
		local prematchCountdown = CoD.PrematchCountdown.new( self, controller )
		prematchCountdown:setupCountdown( endTime, controller )
		prematchCountdown:setLeftRight( 0, 1, 0, 0 )
		prematchCountdown:setTopBottom( 0, 1, 0, 0 )
		prematchCountdown:addElementBefore( self.WaypointContainer )
		prematchCountdown:processEvent( {
			name = "update_state",
			controller = controller,
			menu = self
		} )
		self.PrematchCountdown = prematchCountdown
		LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
			if self.PrematchCountdown then
				self.PrematchCountdown:close()
			end
		end )
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "isInPrematchPeriod" ), 1 )
end

function CreateRejackTimer( self, controller, model )
	local data = CoD.GetScriptNotifyData( model )
	local endTime = data[1]
	self.rejackWidget = CoD.Rejack.new( self, controller )
	self:addElement( self.rejackWidget )
	self.rejackWidget.RejackInternal:startHeartBeatAnimation( controller, endTime )
end

function HandleScoreStreakDpadRight( self, controller )
	if self:isInFocus() then
		if not self:hasClip( "Focus" ) then
			Engine.SwitchToInventoryWeapon( controller )
		else
			local slotIndex = Engine.GetModelValue( Engine.GetModel( self:getModel(), "rewardSlot" ) )
			if slotIndex ~= nil then
				Engine.ActionSlotSelectWeapon( controller, slotIndex )
			else
				Engine.SwitchToInventoryWeapon( controller )
			end
		end
	end
end

function SaveCurrentListSelection( element )
	element:setRetainedFocusElement( element.activeWidget )
end

function ClearSavedListSelection( element )
	element:setRetainedFocusElement( nil )
end

function SelectNextItemIfPossible( self, element, controller )
	local elementToNavigate = GetListItem( self, element )
	return elementToNavigate:navigateItemRight()
end

function SelectNextItemIfPossibleAndNotDisabled( self, element, controller )
	local elementToNavigate = GetListItem( self, element )
	local nextItem = elementToNavigate:getItemAtOffset( 0, 1 )
	if nextItem then
		local disabledModel = nextItem:getModel( controller, "disabled" )
		local disabled = Engine.GetModelValue( disabledModel )
		if disabled == true then
			return false
		end
	end
	return elementToNavigate:navigateItemRight()
end

function SelectPreviousItemIfPossible( self, element, controller )
	local elementToNavigate = GetListItem( self, element )
	if elementToNavigate.hCount and elementToNavigate.hCount == 1 then
		return elementToNavigate:navigateItemUp()
	else
		return elementToNavigate:navigateItemLeft()
	end
end

function SelectPreviousItemIfPossibleAndNotDisabled( self, element, controller )
	local elementToNavigate = GetListItem( self, element )
	local previousItem = elementToNavigate:getItemAtOffset( 0, -1 )
	if previousItem then
		local disabledModel = previousItem:getModel( controller, "disabled" )
		local disabled = Engine.GetModelValue( disabledModel )
		if disabled == true then
			return false
		end
	end
	return elementToNavigate:navigateItemLeft()
end

function SelectAboveItemIfPossible( self, element, controller )
	local elementToNavigate = GetListItem( self, element )
	return elementToNavigate:navigateItemUp()
end

function SelectAboveItemIfPossibleAndNotDisabled( self, element, controller )
	local elementToNavigate = GetListItem( self, element )
	local aboveItem = elementToNavigate:getItemAtOffset( -1, 0 )
	if aboveItem then
		local disabledModel = aboveItem:getModel( controller, "disabled" )
		local disabled = Engine.GetModelValue( disabledModel )
		if disabled == true then
			return false
		end
	end
	return elementToNavigate:navigateItemUp()
end

function SelectBelowItemIfPossible( self, element, controller )
	local elementToNavigate = GetListItem( self, element )
	return elementToNavigate:navigateItemDown()
end

function SelectBelowItemIfPossibleAndNotDisabled( self, element, controller )
	local elementToNavigate = GetListItem( self, element )
	local belowItem = elementToNavigate:getItemAtOffset( 1, 0 )
	if belowItem then
		local disabledModel = belowItem:getModel( controller, "disabled" )
		local disabled = Engine.GetModelValue( disabledModel )
		if disabled == true then
			return false
		end
	end
	return elementToNavigate:navigateItemDown()
end

function SelectItemIfPossible( self, element, controller, event )
	element:setActiveItem( event.element )
end

function CallElementModel( self, element, controller, modelName )
	if element then
		local model = element:getModel( controller, modelName )
		if model then
			local fn = model:get()
			if fn then
				fn( self, element, controller )
			end
		end
	end
end

function ProcessListAction( self, element, controller )
	if element.disabled then
		return 
	end
	local actionModel = element:getModel( controller, "action" )
	local paramModel = element:getModel( controller, "param" )
	local actionFn, actionParam = nil
	if actionModel then
		actionFn = Engine.GetModelValue( actionModel )
		if paramModel then
			actionParam = Engine.GetModelValue( paramModel )
		end
	else
		actionFn = element.action
		actionParam = element.actionParam
	end
	if actionFn then
		local menu = element:getParentMenu()
		if element.gridInfoTable then
			menu = element.gridInfoTable.parentGrid.menu
		end
		actionFn( self, element, controller, actionParam, menu )
	end
end

function ProcessListItemGainFocusAction( menu, self, element, controller )
	local actionModel = element:getModel( controller, "itemGainFocusAction" )
	local paramModel = element:getModel( controller, "param" )
	local actionFn, actionParam = nil
	if actionModel then
		actionFn = Engine.GetModelValue( actionModel )
		if paramModel then
			actionParam = Engine.GetModelValue( paramModel )
		end
	else
		actionFn = element.itemGainFocusAction
		actionParam = element.actionParam
	end
	if actionFn then
		actionFn( self, element, controller, actionParam, menu )
	end
end

function ProcessListGainFocusAction( menu, self, element, controller )
	local actionModel = element:getModel( controller, "gainFocusAction" )
	local paramModel = element:getModel( controller, "param" )
	local actionFn, actionParam = nil
	if actionModel then
		actionFn = Engine.GetModelValue( actionModel )
		if paramModel then
			actionParam = Engine.GetModelValue( paramModel )
		end
	else
		actionFn = element.gainFocusAction
		actionParam = element.actionParam
	end
	if actionFn then
		actionFn( self, element, controller, actionParam, menu )
	end
end

function ProcessListItemLoseFocusAction( menu, self, element, controller )
	local actionModel = element:getModel( controller, "itemLoseFocusAction" )
	local paramModel = element:getModel( controller, "param" )
	local actionFn, actionParam = nil
	if actionModel then
		actionFn = Engine.GetModelValue( actionModel )
		if paramModel then
			actionParam = Engine.GetModelValue( paramModel )
		end
	else
		actionFn = element.itemLoseFocusAction
		actionParam = element.actionParam
	end
	if actionFn then
		actionFn( self, element, controller, actionParam, menu )
	end
end

function ProcessListLoseFocusAction( menu, self, element, controller )
	local actionModel = element:getModel( controller, "loseFocusAction" )
	local paramModel = element:getModel( controller, "param" )
	local actionFn, actionParam = nil
	if actionModel then
		actionFn = Engine.GetModelValue( actionModel )
		if paramModel then
			actionParam = Engine.GetModelValue( paramModel )
		end
	else
		actionFn = element.loseFocusAction
		actionParam = element.actionParam
	end
	if actionFn then
		actionFn( self, element, controller, actionParam, menu )
	end
end

function ProcessClassOptionAction( self, element, controller, menu )
	if element.disabled then
		return 
	end
	local actionFn, actionParam = nil
	actionFn = menu.actionButtonFn
	actionParam = element.actionParam
	if actionFn then
		actionFn( self, element, controller, actionParam, element.gridInfoTable.parentGrid.menu )
	end
end

function ProcessKeyboardCompleteAction( self, element, controller, menu )
	if element.disabled then
		return 
	end
	local actionFn, actionParam = nil
	actionFn = menu.keyboardCompleteFn
	if actionFn then
		actionFn( self, element, controller, menu )
	end
end

function ProcessConfirmVariantNameAction( self, element, controller, menu )
	if element.disabled then
		return 
	end
	local actionFn, actionParam = nil
	actionFn = menu.confirmVariantNameFn
	if actionFn then
		actionFn( self, element, controller, menu )
	end
end

function UpdateDataSource( self, element, controller )
	element:updateDataSource()
end

function UpdateElementDataSource( self, listElementName )
	if self[listElementName] then
		self[listElementName]:updateDataSource()
	end
end

function SetAsListVerticalCounter( self, element, listElementName )
	if self[listElementName] then
		self[listElementName]:addCustomVerticalCounter( element )
	end
end

function SetAsListHorizontalCounter( self, element, listElementName )
	if self[listElementName] then
		self[listElementName]:addCustomHorizontalCounter( element )
	end
end

function DisableDPadNavigation( self, listElementName, booleanArg )
	if self[listElementName] then
		self[listElementName]:disableDPadNav( booleanArg )
	end
end

function NavigateScrollButtonUp( element )
	if element and element.listWidget then
		element.listWidget:pageUp()
	end
end

function NavigateScrollButtonDown( element )
	if element and element.listWidget then
		element.listWidget:pageDown()
	end
end

function NavigateScrollButtonLeft( element )
	if element and element.listWidget then
		element.listWidget:navigateItemLeft()
	end
end

function NavigateScrollButtonRight( element )
	if element and element.listWidget then
		element.listWidget:navigateItemRight()
	end
end

function SetupTabs( menu, element, controller )
	menu:AddButtonCallbackFunction( menu, controller, Enum.LUIButton.LUI_KEY_LB, nil, function ( listElement, menu, controller, model )
		if not PropertyIsTrue( element, "m_disableNavigation" ) then
			element:navigateItemLeft()
		end
	end, AlwaysFalse, false )
	menu:AddButtonCallbackFunction( menu, controller, Enum.LUIButton.LUI_KEY_RB, nil, function ( listElement, menu, controller, model )
		if not PropertyIsTrue( element, "m_disableNavigation" ) then
			element:navigateItemRight()
		end
	end, AlwaysFalse, false )
end

function ForceListDispatchMouseEvents( element )
	element:setForceMouseEventDispatch( true )
	element.itemStencil:setForceMouseEventDispatch( true )
end

function HideWidget( self )
	self:setAlpha( 0 )
end

function ShowWidget( self )
	self:setAlpha( 1 )
end

function DisableWidget( self, elementName )
	self[elementName].m_disableNavigation = true
	self[elementName]:makeNotFocusable()
	self[elementName]:setAlpha( 0 )
end

function SetBackFromCustomClass( self )
	CoD.CACUtility.FromCustomClass = true
end

function GetCustomClassModel( controller )
	local classNum = CoD.perController[controller].classNum
	local classModel = CoD.perController[controller].classModel
	CoD.CACUtility.GetCustomClassModel( controller, classNum, classModel )
end

function OpenEditWeaponAttachmentsMenu( menu, self, element, controller )
	CoD.perController[controller].weaponSlot = self.slot
	OpenOverlay( menu, "EditWeaponAttachments", controller )
end

function SetupWeaponAttachmentsMenuCamera( menu, controller )
	local classModel = CoD.perController[controller].classModel
	local classNum = CoD.perController[controller].classNum
	local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local slot = CoD.perController[controller].weaponSlot
	local weaponName = Engine.GetWeaponString( controller, classNum, slot, mode )
	if weaponName ~= "" then
		local weaponOptions = CoD.CACUtility.GetWeaponOptionsFromClass( controller, classModel, slot )
		local attachmentInfo = CoD.CACUtility.GetAttachmentCosmeticVariantsFromClass( controller, classModel, slot )
		local camera = CoD.CACUtility.GetCameraNameForAttachments( weaponName )
		Engine.SendClientScriptNotify( controller, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( controller ), {
			base_weapon_slot = slot,
			weapon = weaponName,
			camera = camera,
			options = weaponOptions,
			acv = attachmentInfo
		} )
	end
end

function ChangeCustomClassPane( self, controller, direction )
	local moverWidget = self.CustomClassPanelMover0
	if moverWidget then
		if moverWidget.elementsPlayingClips > 0 then
			return 
		end
		local currentState = moverWidget.currentState
		local nextState = nil
		if currentState == "Wildcards" then
			if direction == "right" then
				nextState = "Weapons"
			end
		elseif currentState == "Weapons" then
			if direction == "left" then
				nextState = "Wildcards"
			elseif direction == "right" then
				nextState = "Equipment"
			end
		elseif currentState == "Equipment" then
			if direction == "left" then
				nextState = "Weapons"
			elseif direction == "right" then
				nextState = "Perks"
			end
		elseif currentState == "Perks" and direction == "left" then
			nextState = "Equipment"
		end
		if nextState then
			self:navigateToTab( nextState, direction )
		end
	end
end

function ResetCustomClassStartingFocus( self, element, controller, booleanArg )
	local model = element:getModel()
	if not model then
		return 
	end
	local classNum = Engine.GetModelValue( Engine.GetModel( model, "classNum" ) )
	if booleanArg or classNum ~= CoD.CACUtility.CustomClass_LastClassNum then
		CoD.CACUtility.CustomClass_LastClassNum = 0
		CoD.CACUtility.CustomClass_LastSelection = "primary"
		CoD.CACUtility.CustomClass_PerClassLastSelection = {}
	end
end

function SetSeenExtraClassSets( controller )
	local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if stats then
		return stats.extraBools[0]:set( 1 )
	else
		
	end
end

function ChangeClass( self, element, controller )
	self:saveState()
	self.menuResponseSent = true
	local selectedClassIndex = Engine.GetModelValue( element:getModel( controller, "classNum" ), nil )
	local selectedClassName = Engine.GetModelValue( element:getModel( controller, "defaultClassName" ), nil )
	if selectedClassIndex == nil and IsIntDvarNonZero( "mp_prototype" ) and IsMultiplayer() then
		selectedClassIndex = element.characterIndex
	end
	local originalClassIndex = selectedClassIndex
	local menuResponse = ""
	if selectedClassName ~= nil then
		menuResponse = string.lower( selectedClassName )
		selectedClassIndex = Engine.GetClassIndexFromName( selectedClassName )
	else
		menuResponse = "custom" .. selectedClassIndex
	end
	local useOwnLoadout = true
	if CanUseSharedLoadouts( controller ) then
		local cpClientLoadoutMenuModel = Engine.GetModel( Engine.GetModelForController( controller ), "ChooseClassCPClientMenu" )
		if cpClientLoadoutMenuModel then
			local selectedClientModel = Engine.CreateModel( cpClientLoadoutMenuModel, "selectedClientIndex" )
			if selectedClientModel then
				local selectedClientIndex = Engine.GetModelValue( selectedClientModel )
				if selectedClientIndex ~= nil then
					local clientModel = Engine.GetModel( cpClientLoadoutMenuModel, "client" .. selectedClientIndex )
					if clientModel then
						local xuid = Engine.GetModelValue( Engine.GetModel( clientModel, "xuid" ) )
						if Engine.IsSharedLoadoutAvailableForClient( controller, xuid ) then
							local clientNum = Engine.GetLobbyClientNumByXUID( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME, xuid )
							menuResponse = menuResponse .. "," .. clientNum
							local myClientModel = Engine.CreateModel( cpClientLoadoutMenuModel, "myClientIndex" )
							if myClientModel then
								local myClientIndex = Engine.GetModelValue( myClientModel )
								if selectedClientIndex ~= myClientIndex then
									useOwnLoadout = false
								end
							end
						end
					end
				end
			end
		end
	end
	if CoD.isCampaign and useOwnLoadout and CoD.perController[controller].fieldOpsKitClassNum ~= selectedClassIndex + 1 then
		CoD.CACUtility.SetShowcaseWeaponToClassPrimary( controller, selectedClassIndex )
		SaveLoadout( self, controller )
	end
	if IsIntDvarNonZero( "mp_prototype" ) and IsMultiplayer() then
		Engine.SendMenuResponse( controller, CoD.CACUtility.PositionDraftMenuName, menuResponse )
	else
		Engine.SendMenuResponse( controller, CoD.CACUtility.ChangeClassMenuName, menuResponse )
	end
	CoD.CACUtility.SetProfileLoadoutChoice( controller, selectedClassIndex )
	HUD_IngameMenuClosed()
	Engine.StreamSetCustomClass( controller, originalClassIndex )
end

function ChangeClass_TrainingSim( self, element, controller )
	self:saveState()
	self.menuResponseSent = true
	local selectedClassIndex = 9
	local originalClassIndex = selectedClassIndex
	Engine.SendMenuResponse( controller, "chooseClass_TrainingSim", "custom9" )
	CoD.CACUtility.SetProfileLoadoutChoice( controller, selectedClassIndex )
	HUD_IngameMenuClosed()
	Engine.StreamSetCustomClass( controller, originalClassIndex )
end

function CloseChangeClass_TrainingSim( self, element, controller )
	CoD.CACUtility.ResetCPCustomClasses( controller )
end

function UpdateClassView( self, element, controller )
	local newModel = element:getModel()
	CoD.perController[controller].classModel = newModel
	self:setModel( newModel, controller )
end

function UpdateParentClassView( self, element, controller )
	local newModel = element:getModel()
	CoD.perController[controller].classModel = newModel
	local parent = self:getParent()
	if parent then
		parent:setModel( newModel, controller )
	end
end

function SetBubblegumPackIndex( self, element, controller )
	local newModel = element:getModel()
	CoD.perController[controller].bgbPackIndex = element.bgbPackIndex
	CoD.perController[controller].bubbleGumPackModel = newModel
	self:setModel( newModel, controller )
end

function SetCustomClassNum( self, element, controller )
	local newModel = element:getModel()
	CoD.perController[controller].classNum = element.classNum
	CoD.perController[controller].classModel = newModel
	self:setModel( newModel, controller )
end

function SetCustomParentClassNum( self, element, controller )
	local newModel = element:getModel()
	CoD.perController[controller].classNum = element.classNum
	CoD.perController[controller].classModel = newModel
	local parent = self:getParent()
	if parent then
		parent:setModel( newModel, controller )
	end
end

function SetMenuCustomClassData( menu, element, controller )
	local newModel = element:getModel()
	CoD.perController[controller].classNum = element.classNum
	CoD.perController[controller].classModel = newModel
	menu:setModel( newModel, controller )
end

function SetCustomClassNum_TrainingSim( self, element, controller )
	local newModel = Engine.GetModel( Engine.GetModelForController( controller ), "CustomClassList.class1" )
	local index = 9
	CoD.perController[controller].classNum = index
	CoD.perController[controller].classModel = newModel
	self:setModel( newModel, controller )
end

function PrestigeWeapon( menu, element, controller )
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	if itemIndexModel then
		CoD.OverlayUtility.CreateOverlay( controller, menu, "PrestigeWeapon", controller, itemIndexModel )
	end
end

function NavigateToLoadoutMenu( self, controller )
	local loadoutSlotName = self.currentActiveSlot
	if loadoutSlotName then
		CoD.perController[controller].weaponCategory = loadoutSlotName
		CoD.perController[controller].weaponClassGroup = loadoutSlotName
		CoD.perController[controller].CACSpecficModelValueFocusTable = nil
		CoD.perController[controller].CACWildcardContextualMenu = nil
		CoD.perController[controller].wildcardOverCapacityRefName = nil
		local classNum = CoD.perController[controller].classNum
		local class = Engine.GetCustomClass( controller, classNum )
		local weaponSlot = self.weaponSlotTable[loadoutSlotName]
		local classModel = CoD.perController[controller].classModel
		local leaveBreadcrumb = true
		local menuName, menuSound = nil
		local availability, equipped, hintText = CoD.CACUtility.GetCACSlotStatus( controller, classModel, loadoutSlotName )
		if availability == CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE then
			return 
		elseif availability == CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD then
			local itemSlot = nil
			for _, slotName in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
				if not CoD.CACUtility.ItemEquippedInSlot( slotName, controller, classModel ) then
					itemSlot = slotName
					break
				end
			end
			local wildcardNeeded = CoD.CACUtility.WildcardNeededForSlot( controller, loadoutSlotName )
			if itemSlot then
				CoD.perController[controller].CACSpecficModelValueFocusTable = {
					ref = wildcardNeeded
				}
				CoD.perController[controller].CACWildcardContextualMenu = true
				CoD.perController[controller].weaponCategory = itemSlot
				OpenPopup( self, "WildcardSelect", controller )
			end
			local wildcardItemIndex = Engine.GetItemIndexFromReference( wildcardNeeded )
			if IsProgressionEnabled( controller ) and Engine.IsItemLocked( controller, wildcardItemIndex ) then
				return 
			end
			local numWildcardItemToRemoveModel = Engine.GetModel( Engine.GetModelForController( controller ), "CACMenu.numWildcardItemsToRemove" )
			Engine.SetModelValue( numWildcardItemToRemoveModel, 1 )
			CoD.perController[controller].wildcardOverCapacityRefName = wildcardNeeded
			local overCapacityPopup = OpenPopup( self, "WildcardCapacity", controller )
			overCapacityPopup.acceptData = {
				classNum = classNum,
				wildcardToReplace = wildcardNeeded
			}
		end
		local primaryGunfighterCount = CoD.CACUtility.PrimaryGunfighterEquippedCount( classModel )
		if loadoutSlotName == "primary" then
			CoD.perController[controller].weaponSlot = "primary"
			menuName = "PrimaryWeaponSelect"
			menuSound = "cac_loadout_edit_select_primary"
		elseif loadoutSlotName == "primaryattachment1" then
			local weaponItemIndex = class.primary
			CoD.perController[controller].weaponSlot = "primary"
			menuSound = "cac_loadout_edit_submenu"
			if weaponItemIndex then
				CoD.perController[controller].attachmentType = "optic"
				menuName = "PrimaryOpticSelect"
			end
		elseif not (loadoutSlotName ~= "primaryattachment2" and loadoutSlotName ~= "primaryattachment3" and (loadoutSlotName ~= "primaryattachment4" or primaryGunfighterCount < 1)) or not (loadoutSlotName ~= "primaryattachment5" or primaryGunfighterCount < 2) or loadoutSlotName == "primaryattachment6" and primaryGunfighterCount >= 3 then
			if IsPrimaryWeaponAttachmentAvailable( controller ) then
				local weaponItemIndex = class.primary
				CoD.perController[controller].weaponSlot = "primary"
				menuSound = "cac_loadout_edit_submenu"
				if weaponItemIndex then
					CoD.perController[controller].attachmentType = "attachment"
					menuName = "PrimaryAttachmentSelect"
				end
			end
		elseif loadoutSlotName == "secondary" then
			CoD.perController[controller].weaponSlot = "secondary"
			menuName = "SecondaryWeaponSelect"
			menuSound = "cac_loadout_edit_select_secondary"
			local isUsingOverkill = CoD.CACUtility.IsBonusCardEquippedByName( class, "bonuscard_overkill" )
			if isUsingOverkill == true then
				CoD.perController[controller].weaponClassGroup = "primary"
				menuName = "PrimaryWeaponSelect"
			end
		elseif loadoutSlotName == "secondaryattachment1" then
			local weaponItemIndex = class.secondary
			CoD.perController[controller].weaponSlot = "secondary"
			menuSound = "cac_loadout_edit_submenu"
			if weaponItemIndex then
				CoD.perController[controller].attachmentType = "optic"
				menuName = "SecondaryOpticSelect"
			end
		elseif loadoutSlotName == "secondaryattachment2" or loadoutSlotName == "secondaryattachment3" and CoD.CACUtility.SearchForBonusCard( "bonuscard_secondary_gunfighter", controller ) ~= "" then
			if IsSecondaryWeaponAttachmentAvailable( controller ) then
				local weaponItemIndex = class.secondary
				CoD.perController[controller].weaponSlot = "secondary"
				menuSound = "cac_loadout_edit_submenu"
				if weaponItemIndex then
					CoD.perController[controller].attachmentType = "attachment"
					menuName = "SecondaryAttachmentSelect"
				end
			end
		elseif loadoutSlotName == "primarygadget" or loadoutSlotName == "primarygrenade" then
			menuName = "LethalEquipmentSelect"
			menuSound = "cac_loadout_edit_submenu"
			local isUsingTwoTacticals = CoD.CACUtility.IsBonusCardEquippedByName( class, "bonuscard_two_tacticals" )
			if isUsingTwoTacticals == true then
				CoD.perController[controller].weaponClassGroup = "secondarygadget"
				menuName = "TacticalEquipmentSelect"
			end
		elseif loadoutSlotName == "primarygadgetattachment1" or loadoutSlotName == "primarygadgetattachment2" or loadoutSlotName == "primarygadgetattachment3" then
			ToggleGadgetMod( self, controller, loadoutSlotName )
		elseif loadoutSlotName == "secondarygadget" or loadoutSlotName == "specialgrenade" then
			menuName = "TacticalEquipmentSelect"
			menuSound = "cac_loadout_edit_submenu"
		elseif loadoutSlotName == "secondarygadgetattachment1" or loadoutSlotName == "secondarygadgetattachment2" or loadoutSlotName == "secondarygadgetattachment3" then
			ToggleGadgetMod( self, controller, loadoutSlotName )
		elseif not (loadoutSlotName ~= "specialty1" and (loadoutSlotName ~= "specialty4" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_1_greed", controller ) == "")) or not (loadoutSlotName ~= "specialty2" and (loadoutSlotName ~= "specialty5" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_2_greed", controller ) == "")) or loadoutSlotName == "specialty3" or loadoutSlotName == "specialty6" and CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_3_greed", controller ) ~= "" then
			menuName = "PerkSelect"
			menuSound = "cac_loadout_edit_submenu"
		elseif loadoutSlotName == "bonuscard1" or loadoutSlotName == "bonuscard2" or loadoutSlotName == "bonuscard3" then
			menuName = "WildcardSelect"
			menuSound = "cac_loadout_edit_submenu"
		elseif loadoutSlotName == "cybercom_tacrig1" or loadoutSlotName == "cybercom_tacrig2" then
			menuName = "TacticalRigSelect"
			menuSound = "cac_loadout_edit_submenu"
		end
		if menuSound then
			Engine.PlaySound( menuSound )
		end
		if menuName then
			if menuName == "WildcardSelect" then
				OpenPopup( self, menuName, controller )
			else
				NavigateToMenu( self, menuName, leaveBreadcrumb, controller )
			end
		end
	end
end

function NavigateToPersonalizeMenu( self, controller )
	local loadoutSlotName = self.currentActiveSlot
	local classModel = CoD.perController[controller].classModel
	local itemIndex = CoD.CACUtility.GetItemEquippedInSlot( loadoutSlotName, controller, classModel )
	local itemRef = CoD.CACUtility.GetItemRefEquippedInSlot( loadoutSlotName, controller, classModel )
	local menuName = nil
	local leaveBreadcrumb = true
	if not (loadoutSlotName ~= "primary" or not CoD.CACUtility.ItemEquippedInSlot( "primary", controller )) or loadoutSlotName == "secondary" and CoD.CACUtility.ItemEquippedInSlot( "secondary", controller ) then
		menuName = "WeaponCustomization"
	elseif (LUI.startswith( loadoutSlotName, "primaryattachment" ) or LUI.startswith( loadoutSlotName, "secondaryattachment" )) and loadoutSlotName ~= "primaryattachment1" and loadoutSlotName ~= "secondaryattachment1" and CoD.CACUtility.ItemEquippedInSlot( loadoutSlotName, controller ) and IsLive() and itemRef ~= "dw" then
		local weaponSlot = CoD.CACUtility.GetWeaponSlotForAttachmentSlot( loadoutSlotName )
		if weaponSlot then
			local weaponRef = CoD.CACUtility.GetItemRefEquippedInSlot( weaponSlot, controller, classModel )
			local weaponIndex = CoD.CACUtility.GetItemIndexEquippedInSlot( weaponSlot, controller, classModel )
			local attachmentIndex = CoD.CACUtility.GetItemIndexEquippedInSlot( loadoutSlotName, controller, classModel )
			local attachmentTableIndex = Engine.GetItemAttachment( weaponIndex, attachmentIndex )
			local acvCount = Engine.GetAttachmentCosmeticVariantCountForAttachment( weaponRef, attachmentTableIndex )
			if acvCount and acvCount > 0 then
				CoD.WC_Category.ACV.selectedAttachmentIndex = itemIndex
				CoD.WC_Category.ACV.selectedAttachment = itemRef
				menuName = "AttachmentCosmeticVariantSelect"
			end
		end
	elseif (loadoutSlotName == "primaryattachment1" or loadoutSlotName == "secondaryattachment1") and itemIndex > CoD.CACUtility.EmptyItemIndex and CoD.CACUtility.AttachmentHasCustomReticle( itemRef ) then
		CoD.perController[controller].customReticleAttachmentIndex = itemIndex
		CoD.perController[controller].customReticleAttachment = itemRef
		menuName = "ReticleSelect"
	end
	if menuName then
		CoD.perController[controller].weaponCategory = loadoutSlotName
		NavigateToMenu( self, menuName, leaveBreadcrumb, controller )
	end
end

function chooseClass_ClientChanged( self, element, controller, param )
	local session = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	local clients = session.sessionClients
	local cpClientLoadoutMenuModel = Engine.GetModel( Engine.GetModelForController( controller ), "ChooseClassCPClientMenu" )
	if cpClientLoadoutMenuModel then
		local selectedClientModel = Engine.GetModel( cpClientLoadoutMenuModel, "selectedClientIndex" )
		if selectedClientModel then
			local numClientsModel = Engine.GetModel( cpClientLoadoutMenuModel, "numActiveClients" )
			if numClientsModel then
				local numClients = Engine.GetModelValue( numClientsModel )
				local selectedClientIndex = Engine.GetModelValue( selectedClientModel )
				local session = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
				local clients = session.sessionClients
				local myXuid = Engine.GetXUID64( controller )
				local isValidSelectedIndex = false
				repeat
					selectedClientIndex = selectedClientIndex + param
					if selectedClientIndex < 1 then
						selectedClientIndex = numClients
					elseif numClients < selectedClientIndex then
						selectedClientIndex = 1
					end
					local clientModel = Engine.GetModel( cpClientLoadoutMenuModel, "client" .. selectedClientIndex )
					if clientModel then
						local xuid = Engine.GetModelValue( Engine.GetModel( clientModel, "xuid" ) )
						if xuid == myXuid then
							isValidSelectedIndex = true
						else
							local nowClient = nil
							for index = 1, #clients, 1 do
								local client = clients[index]
								if client.xuid == xuid then
									nowClient = client
									break
								end
							end
							if nowClient ~= nil then
								isValidSelectedIndex = Engine.IsSharedLoadoutAvailableForClient( controller, xuid )
							end
							isValidSelectedIndex = false
						end
					end
				until isValidSelectedIndex
				Engine.SetModelValue( selectedClientModel, selectedClientIndex )
				local clientModel = Engine.GetModel( cpClientLoadoutMenuModel, "client" .. selectedClientIndex )
				self.chooseClassCPClientIngame0:setModel( clientModel )
				CoD.CACUtility.ResetCPCustomClasses( controller )
				self.classList.classList:updateDataSource( true )
				self.classList.classList:processEvent( {
					name = "gain_focus",
					controller = controller
				} )
			end
		end
	end
end

function chooseClass_TabMPClassesListLeft( self, controller )
	if not self.ClassSetTabWidget then
		return 
	else
		return self.ClassSetTabWidget.Internal.Tabs:navigateItemLeft()
	end
end

function chooseClass_TabMPClassesListRight( self, controller )
	if not self.ClassSetTabWidget then
		return 
	else
		return self.ClassSetTabWidget.Internal.Tabs:navigateItemRight()
	end
end

function CAC_TabChanged( self, element, controller )
	if not self.performingSetup then
		local categoryGroup = element.filter
		DataSources.Unlockables.setCurrentFilterItem( categoryGroup )
		self.weaponList:updateDataSource( true )
		local lastIndex = 1
		local weaponWidget = self.weaponList:getItemAt( lastIndex )
		if weaponWidget then
			self.weaponList:setActiveItem( weaponWidget, 0, true, true )
		end
	end
end

function Cybercore_TabChanged( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local cybercoreUpgradeMenuModel = Engine.GetModel( perControllerModel, "CybercoreUpgradeMenu" )
	local coreModel = Engine.GetModel( cybercoreUpgradeMenuModel, "selectedCore" )
	Engine.SetModelValue( coreModel, element.itemRef )
	Engine.SetModelValue( Engine.GetModel( cybercoreUpgradeMenuModel, "currentCybercoreName" ), element.itemName )
	self.upgradeTree:updateTree( controller )
	self:processEvent( {
		name = "update_state",
		controller = controller
	} )
end

function SetClassItem( self, element, controller )
	local classNum = CoD.perController[controller].classNum
	local slotName = CoD.perController[controller].weaponCategory
	local elementModel = element:getModel()
	local itemIndex = CoD.SafeGetModelValue( elementModel, "itemIndex" ) or 0
	local upgradeItemIndex = CoD.SafeGetModelValue( elementModel, "upgradeItemIndex" ) or 0
	local itemCount = CoD.SafeGetModelValue( elementModel, "count" )
	local itemToAttach = itemIndex
	if IsCACItemUpgraded( self, element, controller ) then
		itemToAttach = upgradeItemIndex
	end
	if AttemptAttachItem( self, controller, self:getModel(), classNum, slotName, itemToAttach, itemCount ) then
		BreakWeaponVariantLink( controller )
		self:playSound( "equip_item" )
		if not IsIntDvarNonZero( "mp_prototype" ) and IsMultiplayer() then
			local previousMenu = GoBack( self, controller )
			if previousMenu then
				previousMenu:processEvent( {
					name = "update_state",
					controller = controller
				} )
			end
			return previousMenu
		end
	end
end

function SetClassWildcard( self, element, controller )
	local classNum = CoD.perController[controller].classNum
	local slotName = CoD.perController[controller].weaponCategory
	local classModel = CoD.perController[controller].classModel
	local selectingSameItem = false
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	local itemIndex = 0
	if itemIndexModel then
		itemIndex = Engine.GetModelValue( itemIndexModel )
	end
	local currentEquippedIndexModel = Engine.GetModel( classModel, slotName .. ".itemIndex" )
	if currentEquippedIndexModel then
		local currentEquippedIndex = Engine.GetModelValue( currentEquippedIndexModel )
		if CoD.CACUtility.EmptyItemIndex < currentEquippedIndex and currentEquippedIndex == itemIndex then
			selectingSameItem = true
		end
	end
	if selectingSameItem or AttemptAttachItem( self, controller, self:getModel(), classNum, slotName, itemIndex, nil ) then
		self:playSound( "equip_item" )
		local previousMenu = GoBack( self, controller )
		if CoD.CACUtility.CustomClass_LastClassNum and previousMenu.menuName == "CustomClass" then
			previousMenu:navigateTo( CoD.CACUtility.CustomClass_LastSelection )
			previousMenu:processEvent( {
				name = "update_state",
				controller = controller
			} )
		end
	end
end

function SetClassAttachment( self, element, controller )
	local classModel = CoD.perController[controller].classModel
	local classNum = CoD.perController[controller].classNum
	local slotName = CoD.perController[controller].weaponCategory
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	local itemIndex = 0
	if itemIndexModel then
		itemIndex = Engine.GetModelValue( itemIndexModel )
	end
	local ignoreGetCustomClassModel = true
	if AttemptAttachItem( self, controller, self:getModel(), classNum, slotName, itemIndex, nil, ignoreGetCustomClassModel ) then
		BreakWeaponVariantLink( controller )
		CoD.CACUtility.GetCustomClassModel( controller, classNum, classModel )
		self:playSound( "equip_item" )
		local previousMenu = GoBack( self, controller )
		if previousMenu then
			previousMenu:processEvent( {
				name = "update_state",
				controller = controller
			} )
		end
	end
end

function SetWeaponVariant( self, element, controller )
	local classNum = CoD.perController[controller].classNum
	local classModel = CoD.perController[controller].classModel
	local slotName = CoD.perController[controller].weaponCategory
	local f531_local0 = slotName == "primary"
	local weaponIndex = element.weaponVariantInfo.weaponIndex
	local attachmentsByIndex = element.weaponVariantInfo.attachmentsByIndex
	local unlockedAttachmentsByIndex = element.weaponVariantInfo.unlockedAttachmentsByIndex
	local wildcardNeededCount = element.weaponVariantInfo.wildcardNeededCount
	local wildcardNeededFromVariantCount = element.weaponVariantInfo.wildcardNeededFromVariantCount
	local removeAttachments = not element.dontRemoveAttachments
	local removeItemFromClassMenu = false
	local openWildcardCapacityMenu = false
	local maxAllocation = Engine.GetMaxAllocation( controller )
	local allocationSpentModel = Engine.GetModel( classModel, "allocationSpent" )
	local currentClassAllocation = 0
	local currentWeaponAllocation = 0
	local currentAttachmentsAllocation = 0
	local currentWildcardAllocation = 0
	local equippedGunfighterCount = 0
	local maxNonOpticsAttachmentsWithoutWildcard = 2
	local bonuscardGunfighterForSlot = "bonuscard_primary_gunfighter"
	local attachmentList = CoD.CACUtility.PrimaryAttachmentSlotNameList
	local maxAttachmentBeforeWildcard = 3
	local maxGunfighters = CoD.CACUtility.maxPrimaryGunfighters
	if not f531_local0 then
		maxNonOpticsAttachmentsWithoutWildcard = 1
		attachmentList = CoD.CACUtility.SecondaryAttachmentSlotNameList
		bonuscardGunfighterForSlot = "bonuscard_secondary_gunfighter"
		maxAttachmentBeforeWildcard = 2
		maxGunfighters = CoD.CACUtility.maxSecondaryGunfigthers
	end
	if allocationSpentModel then
		currentClassAllocation = Engine.GetModelValue( allocationSpentModel )
	end
	local currentWeaponItemIndex = Engine.GetModelValue( Engine.GetModel( classModel, slotName .. ".itemIndex" ) )
	if CoD.CACUtility.EmptyItemIndex < currentWeaponItemIndex then
		currentWeaponAllocation = 1
	end
	for index, attachmentSlotName in ipairs( attachmentList ) do
		local attachmentItemIndex = Engine.GetModelValue( Engine.GetModel( classModel, attachmentSlotName .. ".itemIndex" ) )
		if CoD.CACUtility.EmptyItemIndex < attachmentItemIndex then
			currentAttachmentsAllocation = currentAttachmentsAllocation + 1
		end
	end
	if f531_local0 then
		equippedGunfighterCount = CoD.CACUtility.PrimaryGunfighterEquippedCount( classModel )
	elseif CoD.CACUtility.IsBonusCardEquipped( CoD.CACUtility.bonuscards.secondary_gunfighter, classModel ) then
		equippedGunfighterCount = 1
	end
	currentWildcardAllocation = equippedGunfighterCount
	currentClassAllocation = currentClassAllocation - currentWeaponAllocation - currentAttachmentsAllocation - currentWildcardAllocation
	local variantAllocationCost = 0
	local weaponAllocationCost = 1
	local attachmentAllocationCost = 0
	local variantHasOpticAttachment = false
	local numLockedAttachments = 0
	local variantInfoAttachmentsByIndex = attachmentsByIndex
	local wildcarUnlockedTable = {}
	local wildcardForVariantAllocationCost = equippedGunfighterCount
	local numWildcardToEquip = wildcardNeededCount - equippedGunfighterCount
	if f531_local0 then
		numWildcardToEquip = math.min( math.max( numWildcardToEquip, 0 ), CoD.CACUtility.maxPrimaryGunfighters )
	else
		numWildcardToEquip = math.min( math.max( numWildcardToEquip, 0 ), CoD.CACUtility.maxSecondaryGunfighters )
	end
	if IsProgressionEnabled( controller ) then
		variantInfoAttachmentsByIndex = unlockedAttachmentsByIndex
		if f531_local0 then
			local wildcardAddedCount = 0
			for _, gunfighterName in ipairs( CoD.CACUtility.PrimaryGunfighterWildcards ) do
				if wildcardNeededFromVariantCount <= wildcardAddedCount then
					break
				elseif CoD.CACUtility.IsBonusCardEquipped( gunfighterName, classModel ) then
					currentWildcardAllocation = currentWildcardAllocation - 1
				else
					local itemIndex = Engine.GetItemIndexFromReference( gunfighterName )
					local isLocked = Engine.IsItemLocked( controller, itemIndex )
					local f531_local7
					if not isLocked then
						f531_local7 = not Engine.IsItemPurchased( controller, itemIndex )
					else
						f531_local7 = false
					end
					table.insert( wildcarUnlockedTable, {
						ref = gunfighterName,
						itemIndex = itemIndex,
						isLocked = isLocked,
						isPurchasable = f531_local7
					} )
				end
				wildcardAddedCount = wildcardAddedCount + 1
			end
			wildcardForVariantAllocationCost = wildcardAddedCount
		elseif numWildcardToEquip > 0 and wildcardForVariantAllocationCost < wildcardNeededFromVariantCount then
			if CoD.CACUtility.IsBonusCardEquipped( bonuscardGunfighterForSlot, classModel ) then
				currentWildcardAllocation = currentWildcardAllocation - 1
			else
				local itemIndex = Engine.GetItemIndexFromReference( bonuscardGunfighterForSlot )
				local isLocked = Engine.IsItemLocked( controller, itemIndex )
				local f531_local5
				if not isLocked then
					f531_local5 = not Engine.IsItemPurchased( controller, itemIndex )
				else
					f531_local5 = false
				end
				table.insert( wildcarUnlockedTable, {
					ref = bonuscardGunfighterForSlot,
					itemIndex = itemIndex,
					isLocked = isLocked,
					isPurchasable = f531_local5
				} )
				wildcardForVariantAllocationCost = 1
			end
		end
	else
		numWildcardToEquip = wildcardNeededFromVariantCount - equippedGunfighterCount
		if f531_local0 then
			numWildcardToEquip = math.min( math.max( numWildcardToEquip, 0 ), CoD.CACUtility.maxPrimaryGunfighters )
		else
			numWildcardToEquip = math.min( math.max( numWildcardToEquip, 0 ), CoD.CACUtility.maxSecondaryGunfighters )
		end
		if wildcardNeededFromVariantCount > 0 and numWildcardToEquip > 0 then
			if f531_local0 then
				local wildcardAddedCount = 0
				for _, gunfighterName in ipairs( CoD.CACUtility.PrimaryGunfighterWildcards ) do
					if wildcardNeededFromVariantCount <= wildcardAddedCount then
						
					elseif CoD.CACUtility.IsBonusCardEquipped( gunfighterName, classModel ) then
						currentWildcardAllocation = currentWildcardAllocation - 1
					else
						local itemIndex = Engine.GetItemIndexFromReference( gunfighterName )
						table.insert( wildcarUnlockedTable, {
							ref = gunfighterName,
							itemIndex = itemIndex,
							isLocked = false
						} )
					end
					wildcardAddedCount = wildcardAddedCount + 1
				end
			elseif CoD.CACUtility.IsBonusCardEquipped( bonuscardGunfighterForSlot, classModel ) then
				currentWildcardAllocation = currentWildcardAllocation - 1
			else
				local itemIndex = Engine.GetItemIndexFromReference( bonuscardGunfighterForSlot )
				table.insert( wildcarUnlockedTable, {
					ref = bonuscardGunfighterForSlot,
					itemIndex = itemIndex,
					isLocked = false
				} )
			end
		else
			currentWildcardAllocation = currentWildcardAllocation - wildcardNeededFromVariantCount
		end
		wildcardForVariantAllocationCost = wildcardNeededFromVariantCount
	end
	local atLeastOnePurchasableWildcard = false
	for index, gunfighterName in ipairs( wildcarUnlockedTable ) do
		if gunfighterName.isLocked and removeAttachments then
			for i = #variantInfoAttachmentsByIndex, maxAttachmentBeforeWildcard, -1 do
				if variantInfoAttachmentsByIndex[i] ~= CoD.CACUtility.EmptyItemIndex then
					variantInfoAttachmentsByIndex[i] = CoD.CACUtility.EmptyItemIndex
					break
				end
			end
		end
		if gunfighterName.isPurchasable then
			atLeastOnePurchasableWildcard = true
		end
	end
	for _, gunfighterName in ipairs( variantInfoAttachmentsByIndex ) do
		if CoD.CACUtility.EmptyItemIndex < gunfighterName then
			attachmentAllocationCost = attachmentAllocationCost + 1
		end
	end
	local currentIndex = 1
	while #wildcarUnlockedTable > 0 and currentIndex <= #wildcarUnlockedTable do
		if wildcarUnlockedTable[currentIndex].isLocked then
			table.remove( wildcarUnlockedTable, currentIndex )
			numWildcardToEquip = numWildcardToEquip - 1
			wildcardForVariantAllocationCost = wildcardForVariantAllocationCost - 1
		else
			currentIndex = currentIndex + 1
		end
	end
	variantAllocationCost = weaponAllocationCost + attachmentAllocationCost + wildcardForVariantAllocationCost
	local availableBonusCardSlots = 0
	if numWildcardToEquip > 0 then
		for _, f531_local8 in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
			if not CoD.CACUtility.ItemEquippedInSlot( f531_local8, controller, classModel ) then
				availableBonusCardSlots = availableBonusCardSlots + 1
			end
		end
		if availableBonusCardSlots < numWildcardToEquip then
			openWildcardCapacityMenu = true
		end
	end
	if not IsCampaign() and maxAllocation < currentClassAllocation + variantAllocationCost + currentWildcardAllocation then
		removeItemFromClassMenu = true
	end
	if atLeastOnePurchasableWildcard then
		local upgradeItemIndex = nil
		local weaponVariantEquip = true
		local wildcardToPurchase = nil
		for index, wildcardInfo in ipairs( wildcarUnlockedTable ) do
			if wildcardInfo.isPurchasable then
				wildcardToPurchase = wildcardInfo
				break
			end
		end
		local unlockItemOverlay = CoD.OverlayUtility.CreateOverlay( controller, self, "UnlockClassItem", controller, wildcardToPurchase.itemIndex, upgradeItemIndex, weaponVariantEquip )
		unlockItemOverlay.acceptData = {
			variantInfoElement = element
		}
	elseif openWildcardCapacityMenu then
		CoD.perController[controller].wildcardOverCapacityRefName = wildcarUnlockedTable[1].ref
		local numWildcardItemToRemoveModel = Engine.GetModel( Engine.GetModelForController( controller ), "CACMenu.numWildcardItemsToRemove" )
		Engine.SetModelValue( numWildcardItemToRemoveModel, numWildcardToEquip - availableBonusCardSlots )
		local overCapacityPopup = OpenPopup( self, "WildcardCapacity", controller )
		overCapacityPopup.acceptData = {
			classNum = classNum,
			variantInfoElement = element,
			wildcarUnlockedTable = wildcarUnlockedTable
		}
	elseif removeItemFromClassMenu then
		local numItemsToRemove = currentClassAllocation + variantAllocationCost + currentWildcardAllocation - maxAllocation
		local numItemsToRemoveModel = Engine.GetModel( Engine.GetModelForController( controller ), "CACMenu.numItemsToRemove" )
		Engine.SetModelValue( numItemsToRemoveModel, numItemsToRemove )
		local removeItemPopup = OpenPopup( self, "RemoveItemFromClass", controller )
		removeItemPopup.acceptData = {
			slotName = slotName,
			weaponVariantInfo = element.weaponVariantInfo,
			attachmentsByIndex = variantInfoAttachmentsByIndex,
			wildcarUnlockedTable = wildcarUnlockedTable,
			bonuscardGunfighterForSlot = bonuscardGunfighterForSlot
		}
	else
		AttachWeaponVariant( self, controller, slotName, element.weaponVariantInfo, variantInfoAttachmentsByIndex, wildcarUnlockedTable, bonuscardGunfighterForSlot )
		GoBackToCustomClassMenu( self, controller )
	end
end

function BreakWeaponVariantLink( controller, loadoutSlotStringArg )
	local classNum = CoD.perController[controller].classNum
	local emptyWeaponVariant = CoD.CACUtility.EmptyItemIndex
	local loadoutSlotName = loadoutSlotStringArg
	local baseWeaponLoaodutSlot = nil
	if not loadoutSlotStringArg then
		loadoutSlotName = CoD.perController[controller].weaponCategory
	end
	baseWeaponLoaodutSlot = CoD.CACUtility.GetBaseWeaponLoadoutSlotName( loadoutSlotName )
	if baseWeaponLoaodutSlot == "primary" or baseWeaponLoaodutSlot == "secondary" then
		local variantIndex = CoD.CACUtility.GetClassItem( controller, classNum, baseWeaponLoaodutSlot .. "gunsmithvariant" )
		if variantIndex ~= emptyWeaponVariant then
			local variant = CoD.CraftUtility.Gunsmith.GetVariantByIndex( controller, variantIndex - 1 )
			CoD.OverlayUtility.ShowToast( "BreakVariantLink", Engine.Localize( "MENU_WEAPON_VARIANT_LINK_BROKEN" ), variant.variantName, "uie_t7_mp_icon_header_gunsmith" )
		end
		CoD.CACUtility.SetClassItem( controller, classNum, baseWeaponLoaodutSlot .. "gunsmithvariant", emptyWeaponVariant )
	end
end

function UpdateShownCybercoreXmodel( self, controller )
	local itemIndexModel = self:getModel( controller, "baseItemIndex" )
	local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local curFocusAttachmentIndex = 0
	if itemIndexModel then
		curFocusAttachmentIndex = Engine.GetModelValue( itemIndexModel )
		local camera = "select01"
		local modelName = CoD.CACUtility.GetCybercoreXModel( curFocusAttachmentIndex, mode )
		local weaponOptions, acvi = nil
		local isItemUnlocked = IsCybercoreAbilityAvailable( self, controller )
		local isItemTokenLocked = IsCybercoreAbilityPurchasable( self, controller )
		Engine.SendClientScriptNotify( controller, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( controller ), {
			base_weapon_slot = "cybercore",
			weapon = modelName,
			camera = camera,
			options = weaponOptions,
			acv = acvi,
			is_item_unlocked = isItemUnlocked,
			is_item_tokenlocked = isItemTokenLocked
		} )
	end
end

function FocusClassItem( self, element, controller )
	local classNum = CoD.perController[controller].classNum
	local slotName = CoD.perController[controller].weaponCategory
	local classModel = CoD.perController[controller].classModel
	local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	local curFocusAttachmentIndex = 0
	if itemIndexModel then
		curFocusAttachmentIndex = Engine.GetModelValue( itemIndexModel )
	elseif element.itemIndex then
		curFocusAttachmentIndex = element.itemIndex
	end
	local camera = "select01"
	local baseWeaponSlotName, attachmentList, modelName = nil
	if LUI.startswith( slotName, "primaryattachment" ) then
		baseWeaponSlotName = "primary"
		attachmentList = CoD.CACUtility.PrimaryAttachmentSlotNameList
	elseif LUI.startswith( slotName, "secondaryattachment" ) then
		baseWeaponSlotName = "secondary"
		attachmentList = CoD.CACUtility.SecondaryAttachmentSlotNameList
	elseif LUI.startswith( slotName, "specialty" ) then
		baseWeaponSlotName = "specialty"
		modelName = CoD.CACUtility.GetPerkXModel( curFocusAttachmentIndex, mode )
	elseif LUI.startswith( slotName, "bonuscard" ) then
		baseWeaponSlotName = "bonuscard"
		modelName = CoD.CACUtility.GetBonuscardXModel( curFocusAttachmentIndex, mode )
	elseif LUI.startswith( slotName, "cybercore" ) then
		baseWeaponSlotName = "cybercore"
		modelName = CoD.CACUtility.GetCybercoreXModel( curFocusAttachmentIndex, mode )
	elseif LUI.startswith( slotName, "cybercom" ) then
		baseWeaponSlotName = "cybercom"
		modelName = CoD.CACUtility.GetPerkXModel( curFocusAttachmentIndex, mode )
	end
	local weaponIndexModel = Engine.GetModel( classModel, baseWeaponSlotName .. ".itemIndex" )
	local slotIndexModel = Engine.GetModel( classModel, slotName .. ".itemIndex" )
	if weaponIndexModel and slotIndexModel and baseWeaponSlotName ~= "cybercore" then
		local weaponIndex = Engine.GetModelValue( weaponIndexModel )
		local focusAttachmentRef = Engine.GetAttachmentRef( weaponIndex, curFocusAttachmentIndex )
		local curSlotAttachmentIndex = Engine.GetModelValue( slotIndexModel )
		local curAttachmentName = Engine.GetAttachmentRef( weaponIndex, curSlotAttachmentIndex )
		local weaponName = Engine.GetItemRef( weaponIndex ) .. "_" .. CoD.gameMode:lower()
		local cacAttachmentList = {}
		local focusAttachmentFound = false
		for index, attachmentSlot in ipairs( attachmentList ) do
			local cacAttachmentIndex = Engine.GetModelValue( Engine.GetModel( classModel, attachmentSlot .. ".itemIndex" ) )
			if CoD.CACUtility.EmptyItemIndex < cacAttachmentIndex then
				if cacAttachmentIndex ~= curSlotAttachmentIndex then
					local tempCACAttachmentRef = Engine.GetAttachmentRef( weaponIndex, cacAttachmentIndex )
					local tempAttachmentData = {
						index = cacAttachmentIndex,
						ref = tempCACAttachmentRef
					}
					table.insert( cacAttachmentList, tempAttachmentData )
				else
					focusAttachmentFound = true
				end
			end
		end
		for _, attachmentSlot in ipairs( cacAttachmentList ) do
			local attachmentRef = attachmentSlot.ref
			local attachmentIndex = attachmentSlot.index
			local isFocusAttachmentOptic = Engine.IsOptic( weaponIndex, curFocusAttachmentIndex )
			local isAttachmentOptic = Engine.IsOptic( weaponIndex, attachmentIndex )
			if (not isFocusAttachmentOptic or not isAttachmentOptic) and Engine.AreAttachmentsCompatible( weaponIndex, curFocusAttachmentIndex, attachmentIndex ) then
				weaponName = weaponName .. "+" .. attachmentRef
			end
		end
		weaponName = weaponName .. "+" .. focusAttachmentRef
		if weaponName and weaponName ~= "" then
			local attachmentInfo = CoD.CACUtility.GetACVariantsFromClassExcludeAttachment( controller, classModel, slotName, focusAttachmentRef )
			local focusACVIndex = element.acvIndex
			local focusACVInfo = focusAttachmentRef .. "," .. focusACVIndex
			attachmentInfo = attachmentInfo .. focusACVInfo
			local weaponOptions = "none"
			Engine.SendClientScriptNotify( controller, "CustomClass_focus" .. CoD.GetLocalClientAdjustedNum( controller ), {
				base_weapon_slot = baseWeaponSlotName,
				weapon = weaponName,
				attachment = focusAttachmentRef,
				options = weaponOptions,
				acv = attachmentInfo
			} )
		end
	elseif slotIndexModel ~= nil then
		local f534_local3
		if not IsCACItemLocked( self, element, controller ) then
			f534_local3 = not IsSelfModelValueTrue( element, controller, "isBMClassified" )
		else
			f534_local3 = false
		end
		local isItemTokenLocked = not IsCACItemPurchased( element, controller )
		local weaponOptions, acvi = nil
		Engine.SendClientScriptNotify( controller, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( controller ), {
			base_weapon_slot = slotName,
			weapon = modelName,
			camera = camera,
			options = weaponOptions,
			acv = acvi,
			is_item_unlocked = f534_local3,
			is_item_tokenlocked = isItemTokenLocked
		} )
	end
end

function FocusWeapon( self, element, controller )
	local classNum = CoD.perController[controller].classNum
	local slotName = CoD.perController[controller].weaponCategory
	local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	local itemIndex = 0
	if itemIndexModel then
		local itemName = Engine.GetItemRef( Engine.GetModelValue( itemIndexModel ), mode )
		local menuResponseItemName = itemName .. "_mp"
		if slotName == "secondary" then
			menuResponseItemName = "none," .. menuResponseItemName
		end
		local postFix = CoD.gameMode:lower()
		local weaponName = itemName .. "_" .. postFix
		local weaponOptions = CoD.CACUtility.EmptyWeaponOptions()
		local f535_local0
		if not IsCACItemLocked( self, element, controller ) then
			f535_local0 = not IsSelfModelValueTrue( element, controller, "isBMClassified" )
		else
			f535_local0 = false
		end
		local isItemTokenLocked = not IsCACItemPurchased( element, controller )
		local acvi = nil
		Engine.SendClientScriptNotify( controller, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( controller ), {
			base_weapon_slot = slotName,
			weapon = weaponName,
			camera = "select01",
			options = weaponOptions,
			acv = acvi,
			is_item_unlocked = f535_local0,
			is_item_tokenlocked = isItemTokenLocked
		} )
	end
end

function FocusWeaponVariant( self, element, controller )
	local classNum = CoD.perController[controller].classNum
	local slotName = CoD.perController[controller].weaponCategory
	local weaponIndex = element.weaponVariantInfo.weaponIndex
	local variantNameModel = Engine.GetModel( Engine.GetModelForController( controller ), "CACMenu.curWeaponVariantName" )
	Engine.SetModelValue( variantNameModel, element.weaponVariantInfo.variantName )
	local itemName = Engine.GetItemRef( weaponIndex )
	local postFix = CoD.gameMode:lower()
	local weaponName = itemName .. "_" .. postFix
	for i, attachmentIndex in ipairs( element.weaponVariantInfo.attachmentsByIndex ) do
		local tempAttachmentName = Engine.GetAttachmentRef( weaponIndex, attachmentIndex )
		weaponName = weaponName .. "+" .. tempAttachmentName
	end
	local camera = CoD.CACUtility.GetCameraNameForAttachments( weaponName )
	local weaponOptions = CoD.CACUtility.GetWeaponOptionsFromVariantInfo( controller, element.weaponVariantInfo )
	local attachmentInfo = CoD.CACUtility.GetAttachmentCosmeticVariantsFromVariantInfo( element.weaponVariantInfo )
	Engine.SendClientScriptNotify( controller, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( controller ), {
		base_weapon_slot = slotName,
		weapon = weaponName,
		camera = camera,
		options = weaponOptions,
		acv = attachmentInfo
	} )
end

function MarkCACPaintshopDataDirty( self, controller )
	Engine.MarkPSDataDirty( controller, false )
end

function MarkCACPaintshopDataDirtyForEdittingSpecialist( controller )
	Engine.MarkPSDataDirty( controller, false, CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits )
end

function ClearLocalPSCharacter( controller )
	Engine.ClearLocalPSCharacter( controller )
end

function RemoveItemFromClass( self, element, controller )
	if self.ShowRemovePrompt ~= nil and not self:ShowRemovePrompt( controller ) then
		return 
	end
	local classNum = CoD.perController[controller].classNum
	local classModel = CoD.perController[controller].classModel
	local loadoutSlotName = self.currentActiveSlot
	loadoutSlotName = loadoutSlotName or element.weaponSlot
	if loadoutSlotName and RemoveItemFromClassSlot( loadoutSlotName, controller ) then
		BreakWeaponVariantLink( controller, loadoutSlotName )
		CoD.CACUtility.GetCustomClassModel( controller, classNum, classModel )
		self:playSound( "unequip_item" )
		self:processEvent( {
			name = "update_state",
			controller = controller
		} )
		self:processEvent( {
			name = "update_button_prompts",
			controller = controller
		} )
	end
	local primaryWeaponString = Engine.GetWeaponString( controller, classNum, "primary" )
	local secondaryWeaponString = Engine.GetWeaponString( controller, classNum, "secondary" )
	if primaryWeaponString ~= "" then
		Engine.SendClientScriptNotify( controller, "CustomClass_primary", {
			param1 = "custom_removeattach",
			param2 = primaryWeaponString
		} )
	end
	if secondaryWeaponString ~= "" then
		Engine.SendClientScriptNotify( controller, "CustomClass_secondary", {
			param1 = "custom_removeattach",
			param2 = secondaryWeaponString
		} )
	end
	local weaponName = nil
	local baseWeaponLoadoutSlot = CoD.CACUtility.GetBaseWeaponLoadoutSlotName( loadoutSlotName )
	if baseWeaponLoadoutSlot and (baseWeaponLoadoutSlot == "primary" or baseWeaponLoadoutSlot == "secondary") then
		weaponName = Engine.GetWeaponString( controller, classNum, baseWeaponLoadoutSlot )
	else
		Engine.SendClientScriptNotify( controller, "CustomClass_remove" .. CoD.GetLocalClientAdjustedNum( controller ), {} )
	end
	if weaponName and weaponName ~= "" then
		local weaponOptions = CoD.CACUtility.GetWeaponOptionsFromClass( controller, classModel, baseWeaponLoadoutSlot )
		local attachmentInfo = CoD.CACUtility.GetAttachmentCosmeticVariantsFromClass( controller, classModel, baseWeaponLoadoutSlot )
		local camera = CoD.CACUtility.GetCameraNameForAttachments( weaponName )
		Engine.SendClientScriptNotify( controller, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( controller ), {
			base_weapon_slot = loadoutSlotName,
			weapon = weaponName,
			camera = camera,
			options = weaponOptions,
			acv = attachmentInfo
		} )
	else
		Engine.SendClientScriptNotify( controller, "CustomClass_remove" .. CoD.GetLocalClientAdjustedNum( controller ), {} )
	end
end

function RemoveOverflowItemFromClass( self, element, controller )
	local classModel = CoD.perController[controller].classModel
	local classNum = self.acceptData.classNum
	local slotName = self.acceptData.slotName
	local itemIndex = self.acceptData.itemIndex
	local currentAllocation = Engine.GetUsedAllocation( controller, classNum )
	local loadSlot = element:getModel( controller, "itemSlot" )
	if loadSlot then
		local loadoutSlotName = Engine.GetModelValue( loadSlot )
		RemoveItemFromClassSlot( loadoutSlotName, controller )
	end
	local allocationAfterRemoval = Engine.GetUsedAllocation( controller, classNum )
	local numItemsToRemove = currentAllocation - allocationAfterRemoval
	local maxAllocation = Engine.GetMaxAllocation( controller )
	if self.itemList.activeWidget:isLastItem() then
		self.itemList.savedActiveIndex = self.itemList.activeWidget.gridInfoTable.zeroBasedIndex - 1
	end
	local f541_local0 = self.itemList:getDataSource()
	if f541_local0.getCount( self.itemList ) > 1 then
		self.itemList:updateDataSource()
	end
	if allocationAfterRemoval < maxAllocation then
		AttemptAttachItem( self, controller, classModel, classNum, slotName, itemIndex, nil )
		BreakWeaponVariantLink( controller )
		local customClassMenu = GoBack( self, controller )
		if customClassMenu.id ~= "Menu.CustomClass" then
			customClassMenu = GoBack( customClassMenu, controller )
		else
			local weaponName = nil
			local camera = "select01"
			if LUI.startswith( slotName, "primarygadgetattachment" ) then
				weaponName = Engine.GetWeaponString( controller, classNum, "primarygadget" )
			elseif LUI.startswith( slotName, "secondarygadgetattachment" ) then
				weaponName = Engine.GetWeaponString( controller, classNum, "secondarygadget" )
			end
			if weaponName and weaponName ~= "" then
				Engine.SendClientScriptNotify( controller, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( controller ), {
					base_weapon_slot = slotName,
					weapon = weaponName,
					camera = camera
				} )
			end
		end
		if customClassMenu then
			customClassMenu:processEvent( {
				name = "update_state",
				controller = controller
			} )
			SetFocusToLoadoutWidgetAfterSetItem( customClassMenu )
		end
	end
end

function SwapOverflowItemInClass( self, element, controller )
	local classModel = CoD.perController[controller].classModel
	local classNum = CoD.perController[controller].classNum
	local itemIndex = CoD.perController[controller].overCapacityItemIndex
	local f542_local0 = element:getModel()
	local slotName = f542_local0.slotName:get()
	CoD.CACUtility.SetClassItem( controller, classNum, slotName, itemIndex )
	CoD.CACUtility.GetCustomClassModel( controller, classNum, classModel )
end

function WeaponVariantRemoveItemFromClass( self, element, controller )
	local classNum = CoD.perController[controller].classNum
	local currentAllocation = Engine.GetUsedAllocation( controller, classNum )
	local loadSlot = element:getModel( controller, "itemSlot" )
	if loadSlot then
		local loadoutSlotName = Engine.GetModelValue( loadSlot )
		RemoveItemFromClassSlot( loadoutSlotName, controller )
	end
	local allocationAfterRemoval = Engine.GetUsedAllocation( controller, classNum )
	local itemsRemoved = currentAllocation - allocationAfterRemoval
	if self.itemList.activeWidget:isLastItem() then
		self.itemList.savedActiveIndex = self.itemList.activeWidget.gridInfoTable.zeroBasedIndex - 1
	end
	local f543_local0 = self.itemList:getDataSource()
	if f543_local0.getCount( self.itemList ) > 1 then
		self.itemList:updateDataSource()
	end
	local numItemsToRemoveModel = Engine.GetModel( Engine.GetModelForController( controller ), "CACMenu.numItemsToRemove" )
	local numItemsToRemove = Engine.GetModelValue( numItemsToRemoveModel ) - itemsRemoved
	Engine.SetModelValue( numItemsToRemoveModel, numItemsToRemove )
	if numItemsToRemove <= 0 then
		local slotName = self.acceptData.slotName
		local weaponVariantInfo = self.acceptData.weaponVariantInfo
		local attachmentsByIndex = self.acceptData.attachmentsByIndex
		local wildcarUnlockedTable = self.acceptData.wildcarUnlockedTable
		local bonuscardGunfighterForSlot = self.acceptData.bonuscardGunfighterForSlot
		AttachWeaponVariant( self, controller, slotName, weaponVariantInfo, attachmentsByIndex, wildcarUnlockedTable, bonuscardGunfighterForSlot )
		local previousMenu = GoBack( self, controller )
		GoBackToCustomClassMenu( previousMenu, controller )
		ClearSavedState( previousMenu, controller )
	end
end

function RemoveOverflowWildcardFromClass( self, element, controller )
	local loadSlot = element:getModel( controller, "itemSlot" )
	local loadoutSlotName = nil
	if loadSlot then
		loadoutSlotName = Engine.GetModelValue( loadSlot )
		RemoveItemFromClassSlot( loadoutSlotName, controller )
	end
	local classModel = CoD.perController[controller].classModel
	local classNum = self.acceptData.classNum
	local variantInfoElement = self.acceptData.variantInfoElement
	local itemIndex = nil
	if variantInfoElement then
		itemIndex = self.acceptData.wildcarUnlockedTable[1].itemIndex
		table.remove( self.acceptData.wildcarUnlockedTable, 1 )
		if #self.acceptData.wildcarUnlockedTable > 0 then
			CoD.perController[controller].wildcardOverCapacityRefName = self.acceptData.wildcarUnlockedTable[1].ref
			self:updateWildcardToReplaceInfo( controller )
		end
	else
		itemIndex = Engine.GetItemIndexFromReference( self.acceptData.wildcardToReplace )
	end
	AttemptAttachItem( self, controller, classModel, classNum, loadoutSlotName, itemIndex, nil )
	self.selectionList:updateDataSource()
	local numWildcardToRemoveModel = Engine.GetModel( Engine.GetModelForController( controller ), "CACMenu.numWildcardItemsToRemove" )
	local numWildcardToRemove = Engine.GetModelValue( numWildcardToRemoveModel ) - 1
	Engine.SetModelValue( numWildcardToRemoveModel, numWildcardToRemove )
	if numWildcardToRemove <= 0 then
		if variantInfoElement then
			local previousMenu = GoBack( self, controller )
			variantInfoElement.dontRemoveAttachments = true
			SetWeaponVariant( previousMenu, variantInfoElement, controller )
			variantInfoElement.dontRemoveAttachments = nil
		else
			GoBackToCustomClassMenu( self, controller )
		end
	end
end

function SetWeaponOptionClassItem( self, element, controller )
	local classModel = CoD.perController[controller].classModel
	local classNum = CoD.perController[controller].classNum
	local loadoutSlotName = CoD.perController[controller].weaponCategory
	local baseLoadoutSlotName = CoD.CACUtility.GetBaseWeaponLoadoutSlotName( loadoutSlotName )
	local weaponOptionNameModel = element:getModel( controller, "weaponOptionTypeName" )
	local weaponOptionIndexModel = element:getModel( controller, "weaponOptionSubIndex" )
	local weaponOptionTypeModel = element:getModel( controller, "weaponOptionType" )
	if weaponOptionNameModel and weaponOptionIndexModel and weaponOptionTypeModel then
		local weaponOptionName = Engine.GetModelValue( weaponOptionNameModel )
		local weaponOptionIndex = Engine.GetModelValue( weaponOptionIndexModel )
		local weaponOptionType = Engine.GetModelValue( weaponOptionTypeModel )
		if weaponOptionType == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB then
			local paintjobIndex = Engine.GetModelValue( element:getModel( controller, "paintjobIndex" ) )
			local paintjobSlot = Engine.GetModelValue( element:getModel( controller, "paintjobSlot" ) )
			CoD.CACUtility.SetClassItem( controller, classNum, baseLoadoutSlotName .. weaponOptionName .. "slot", paintjobSlot )
			CoD.CACUtility.SetClassItem( controller, classNum, baseLoadoutSlotName .. weaponOptionName .. "index", paintjobIndex )
		else
			CoD.CACUtility.SetClassItem( controller, classNum, baseLoadoutSlotName .. weaponOptionName, weaponOptionIndex )
		end
		if loadoutSlotName == "primary" or loadoutSlotName == "secondary" then
			CoD.CACUtility.UpdateWeaponOptions( controller, classModel )
		end
	end
end

function SetAttachmentVariantClassItem( self, element, controller )
	local classModel = CoD.perController[controller].classModel
	local classNum = CoD.perController[controller].classNum
	local loadoutSlotName = CoD.perController[controller].weaponCategory
	if loadoutSlotName then
		CoD.CACUtility.SetClassItem( controller, classNum, loadoutSlotName .. "cosmeticvariant", element.variantIndex )
		CoD.CACUtility.UpdateAttachmentCosmeticVariants( controller, classModel )
		CoD.CACUtility.GetCustomClassModel( controller, classNum, classModel )
	end
end

function UpdateAllocationBar( self, element, controller )
	local allocationModel = element:getModel( controller, "allocationSpent" )
	if allocationModel then
		local allocationSpent = Engine.GetModelValue( allocationModel )
		if allocationSpent >= 0 then
			for i = 1, Engine.GetMaxAllocation( controller ), 1 do
				local allocationBarElement = element["AllocationBar" .. i - 1]
				if allocationBarElement ~= nil then
					if i <= allocationSpent then
						allocationBarElement:playClip( "PointSpent" )
					else
						allocationBarElement:playClip( "DefaultClip" )
					end
				end
			end
		end
	end
end

function BubblegumPackOptionsRename( self, element, controller )
	local bgbPackIndexModel = self:getModel( controller, "bgbPackIndex" )
	if bgbPackIndexModel then
		local bgbPackIndex = Engine.GetModelValue( bgbPackIndexModel )
		Engine.Exec( controller, "ui_keyboard_new " .. Enum.KeyboardType.KEYBOARD_TYPE_BUBBLEGUM_PACK )
	end
end

function BubblegumPackOptionsCopy( self, element, controller )
	local currentBubbleGumPackIndexModel = self:getModel( controller, "bgbPackIndex" )
	local elementBubbleGumPackIndexModel = element:getModel( controller, "bgbPackIndex" )
	if currentBubbleGumPackIndexModel == elementBubbleGumPackIndexModel then
		return 
	elseif currentBubbleGumPackIndexModel and elementBubbleGumPackIndexModel then
		local currentBubbleGumPackIndex = Engine.GetModelValue( currentBubbleGumPackIndexModel )
		local elementBubbleGumPackIndex = Engine.GetModelValue( elementBubbleGumPackIndexModel )
		if currentBubbleGumPackIndex and elementBubbleGumPackIndex then
			Engine.ExecNow( controller, "copybubblegumpack " .. currentBubbleGumPackIndex .. " " .. elementBubbleGumPackIndex )
			local occludedMenu = self.occludedMenu
			GoBack( self, controller )
			ClearSavedState( self, controller )
			GoBack( occludedMenu, controller )
			ClearSavedState( occludedMenu, controller )
		end
	end
end

function ClassOptionsCopyLoadout( self, element, controller )
	local isCurrentSelectedClass = IsCurrentClassSelectedClass( self, element )
	if isCurrentSelectedClass == true then
		return 
	end
	local currentClassNumModel = self:getModel( controller, "classNum" )
	if not currentClassNumModel then
		currentClassNumModel = Engine.GetModel( CoD.perController[controller].classModel, "classNum" )
	end
	local elementClassNumModel = element:getModel( controller, "classNum" )
	if currentClassNumModel and elementClassNumModel then
		local currentClassNum = Engine.GetModelValue( currentClassNumModel )
		local elementClassNum = Engine.GetModelValue( elementClassNumModel )
		if currentClassNum and elementClassNum then
			Engine.ExecNow( controller, "copyClass " .. currentClassNum .. " " .. elementClassNum )
			CoD.CACUtility.UpdateAllClasses( controller )
			local previousMenu = GoBack( self, controller )
			ClearSavedState( self, controller )
			GoBack( previousMenu, controller )
			ClearSavedState( previousMenu, controller )
		end
	end
end

function ClassOptionsCopyClassSet( self, element, controller )
	local selectedClassSetIndexModel = element:getModel( controller, "classSetId" )
	if selectedClassSetIndexModel then
		local selectedClassSetIndex = Engine.GetModelValue( selectedClassSetIndexModel )
		local currentClassSetIndex = Engine.GetCurrentClassSetIndex( controller )
		if selectedClassSetIndex == currentClassSetIndex then
			return 
		end
		Engine.CopyToClassSet( controller, currentClassSetIndex )
		Engine.CopyFromClassSetToClassSet( controller, currentClassSetIndex, selectedClassSetIndex )
		local previousMenu = GoBack( self, controller )
		ClearSavedState( self, controller )
		previousMenu = GoBack( previousMenu, controller )
		ClearSavedState( previousMenu, controller )
		previousMenu:dispatchEventToChildren( {
			name = "class_set_name_change",
			controller = controller
		} )
	end
end

function ClassOptionsResetToDefault( self, element, controller )
	local currentClassNumModel = self:getModel( controller, "classNum" )
	if not currentClassNumModel then
		currentClassNumModel = Engine.GetModel( CoD.perController[controller].classModel, "classNum" )
	end
	local defaultClassNameTextModel = element:getModel( controller, "customClassName" )
	local defaultClassIndexModel = element:getModel( controller, "index" )
	if currentClassNumModel and defaultClassNameTextModel and defaultClassIndexModel then
		local classNumToReplace = Engine.GetModelValue( currentClassNumModel )
		local defaultClassTextName = Engine.GetModelValue( defaultClassNameTextModel )
		local defaultClassIndex = Engine.GetModelValue( defaultClassIndexModel )
		local defaultClassName = CoD.CACUtility.GetDefaultLoadoutNameFromIndex( defaultClassIndex )
		if IsArenaMode() then
			defaultClassName = CoD.CACUtility.GetDefaultArenaLoadoutNameFromIndex( defaultClassIndex )
		end
		Engine.ExecNow( controller, "uiEquipDefaultClass " .. classNumToReplace .. " " .. defaultClassName )
		local f552_local0 = CoD.CACUtility.GetLoadoutNameFromIndex( controller, classNumToReplace )
		f552_local0:set( defaultClassTextName )
		CoD.CACUtility.UpdateAllClasses( controller )
	end
	local previousMenu = GoBack( self, controller )
	ClearSavedState( self, controller )
	local chooseClassMenu = GoBack( previousMenu, controller )
	ClearSavedState( previousMenu, controller )
	if chooseClassMenu then
		chooseClassMenu:processEvent( {
			name = "update_state",
			controller = controller
		} )
	end
end

function ClassOptionsClearLoadout( self, element, controller )
	local classNum = CoD.perController[controller].classNum
	local classModel = CoD.perController[controller].classModel
	for i = 1, #CoD.CACUtility.clearLoadoutSlotOrder, 1 do
		local loadoutSlotName = CoD.CACUtility.clearLoadoutSlotOrder[i]
		local slotModel = Engine.GetModel( classModel, loadoutSlotName )
		if slotModel then
			local itemIndex = Engine.GetModelValue( Engine.GetModel( slotModel, "itemIndex" ) )
			if CoD.CACUtility.EmptyItemIndex < itemIndex then
				CoD.CACUtility.SetClassItem( controller, classNum, loadoutSlotName, CoD.CACUtility.EmptyItemIndex )
			end
		end
	end
	CoD.CACUtility.SetClassItem( controller, classNum, "primarypaintjobslot", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
	CoD.CACUtility.SetClassItem( controller, classNum, "primarypaintjobindex", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
	CoD.CACUtility.SetClassItem( controller, classNum, "secondarypaintjobslot", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
	CoD.CACUtility.SetClassItem( controller, classNum, "secondarypaintjobindex", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
	CoD.CACUtility.GetCustomClassModel( controller, classNum, classModel )
	local chooseClassMenu = self.occludedMenu
	if chooseClassMenu then
		chooseClassMenu:processEvent( {
			name = "update_state",
			controller = controller
		} )
	end
end

function ClassOptionsSetHintText( self, element, controller )
	if element and element:getModel() and element:getModel( controller, "description" ) then
		local classModel = CoD.perController[controller].classModel
		Engine.SetModelValue( Engine.CreateModel( classModel, "customClassOptionsHintText" ), Engine.GetModelValue( element:getModel( controller, "description" ) ) )
	end
end

function OpenBuyExtraSlotsPackDialog( self, element, controller )
	local actionParam = {
		displayText = "MENU_MEDIA_STORAGE_PACK",
		itemCODPointCost = CoD.CACUtility.GetExtraSlotCODPointCost()
	}
	CoD.OverlayUtility.CreateOverlay( controller, self, "PurchaseExtraSlotsConfirmation", controller, actionParam )
end

function PurchaseItem( self, element, controller )
	local elementModel = element:getModel()
	if elementModel then
		local indexModel = Engine.GetModel( elementModel, "itemIndex" )
		local itemIndex = Engine.GetModelValue( indexModel )
		Engine.PurchaseItem( controller, itemIndex )
		Engine.SendClientScriptNotify( controller, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( controller ), {
			base_weapon_slot = "purchased"
		} )
	end
end

function SetUnlockConfirmationInfo( element, controller )
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	if itemIndexModel then
		SetConfirmationInfoInternal( element, controller, itemIndexModel )
	end
end

function SetUpgradeConfirmationInfo( element, controller )
	local upgradeItemIndexModel = element:getModel( controller, "upgradeItemIndex" )
	if upgradeItemIndexModel then
		SetConfirmationInfoInternal( element, controller, upgradeItemIndexModel )
	end
end

function OpenUnlockClassItemDialog( menu, element, controller )
	CoD.OverlayUtility.CreateOverlay( controller, menu, "UnlockClassItem", controller, Engine.GetModelValue( element:getModel( controller, "itemIndex" ) ), nil )
end

function OpenUpgradeClassItemDialog( menu, element, controller )
	local upgradeItemIndexModel = element:getModel( controller, "upgradeItemIndex" )
	if upgradeItemIndexModel then
		CoD.OverlayUtility.CreateOverlay( controller, menu, "UnlockClassItem", controller, Engine.GetModelValue( element:getModel( controller, "itemIndex" ) ), Engine.GetModelValue( upgradeItemIndexModel ) )
	end
end

function UnlockItem( self, element, controller )
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	local upgradeItemIndexModel = element:getModel( controller, "upgradeItemIndex" )
	local upgradeItemIndex = nil
	if upgradeItemIndexModel then
		upgradeItemIndex = Engine.GetModelValue( upgradeItemIndexModel )
	end
	if itemIndexModel then
		local itemIndex = Engine.GetModelValue( itemIndexModel )
		if upgradeItemIndex ~= nil then
			Engine.PurchaseItem( controller, upgradeItemIndex )
			local weaponCategory = CoD.perController[controller].weaponCategory
			if weaponCategory then
				CoD.CACUtility.UpgradeEquippedCACItems( controller, weaponCategory, itemIndex, upgradeItemIndex )
			end
		else
			Engine.PurchaseItem( controller, itemIndex )
		end
		Engine.SendClientScriptNotify( controller, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( controller ), {
			base_weapon_slot = "purchased"
		} )
	end
	SaveLoadout( self, controller )
	UploadStats( self, controller )
end

function UnlockAndEquipItem( self, element, controller )
	local weaponCategory = CoD.perController[controller].weaponCategory
	UnlockItem( self, element, controller )
	local itemIndex = Engine.GetModelValue( element:getModel( controller, "itemIndex" ) )
	if weaponCategory == "specialist" then
		local mode = CoD.PlayerRoleUtility.customizationMode
		local heroIndex = CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits
		local equippedSlot = CoD.PlayerRoleUtility.GetHeroEquippedSlot( controller, itemIndex )
		SelectHero( self, element, controller )
		Engine.SetHeroLoadoutItem( controller, mode, heroIndex, equippedSlot )
	elseif LUI.startswith( weaponCategory, "killstreak" ) then
		EquipScorestreak( self, element, controller )
	else
		local newMenu = SetClassItem( self, element, controller )
		if LUI.startswith( weaponCategory, "bonuscard" ) and not IsCACContextualWildcardOpen( controller ) then
			element.itemIndex = itemIndex
			FocusClassItem( newMenu, element, controller )
		end
		return newMenu
	end
end

function UnlockAndEquipHeroForMPFirstTimeSetup( self, element, controller, actionParam, menu )
	local itemIndex = nil
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	if itemIndexModel then
		itemIndex = Engine.GetModelValue( itemIndexModel )
	end
	if not itemIndex then
		itemIndex = element.itemIndex
	end
	local menuToSendScriptNotify = menu
	if actionParam.previousMenu then
		menuToSendScriptNotify = actionParam.previousMenu
	end
	local mode = CoD.PlayerRoleUtility.customizationMode
	local heroIndex = CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits
	local equippedSlot = CoD.PlayerRoleUtility.GetHeroEquippedSlot( controller, itemIndex )
	if equippedSlot then
		SelectHero( self, element, controller )
		Engine.SetHeroLoadoutItem( controller, mode, heroIndex, equippedSlot )
		Engine.SetFirstSelectedHeroLoadout( controller, Enum.CACType.CAC_TYPE_MP_PUBLIC, heroIndex, equippedSlot )
		Engine.SetHeroForCACType( controller, mode, Enum.CACType.CAC_TYPE_MP_CUSTOM, heroIndex )
		Engine.SetHeroLoadoutItemForCACType( controller, mode, Enum.CACType.CAC_TYPE_MP_CUSTOM, heroIndex, equippedSlot )
		Engine.SetFirstSelectedHeroLoadout( controller, Enum.CACType.CAC_TYPE_MP_CUSTOM, heroIndex, equippedSlot )
		Engine.SetHeroForCACType( controller, mode, Enum.CACType.CAC_TYPE_MP_ARENA, heroIndex )
		Engine.SetHeroLoadoutItemForCACType( controller, mode, Enum.CACType.CAC_TYPE_MP_ARENA, heroIndex, equippedSlot )
		Engine.SetFirstSelectedHeroLoadout( controller, Enum.CACType.CAC_TYPE_MP_ARENA, heroIndex, equippedSlot )
		SetFirstTimeSetupComplete_MP( self, element, controller, "", menu )
		SendClientScriptMenuChangeNotify( controller, menuToSendScriptNotify, false )
		if not IsCACHaveTokens( controller ) then
			Engine.ExecNow( controller, "statWriteMode mp unlocks 1" )
		end
		Engine.PurchaseItem( controller, itemIndex, mode )
		SaveLoadout( self, controller )
	end
end

function TryPurchaseCybercoreAbility( self, element, controller )
	local elementModel = element:getModel()
	if elementModel then
		local ConfirmPurchase = function ( itemIndex )
			Engine.SetModelValue( Engine.CreateModel( elementModel, "itemIndex" ), itemIndex )
			SetUnlockConfirmationInfo( element, controller )
			if not IsCACHaveTokens( controller ) then
				OpenPopup( self, "OutOfUnlockTokens", controller )
			else
				OpenUnlockClassItemDialog( self, element, controller )
			end
		end
		
		local prereqItemIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "prereqItemIndex" ) )
		if prereqItemIndex == -1 or Engine.IsItemPurchased( controller, prereqItemIndex ) then
			local baseItemIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "baseItemIndex" ) )
			if not Engine.IsItemPurchased( controller, baseItemIndex ) then
				ConfirmPurchase( baseItemIndex )
			else
				local upgradeItemIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "upgradeItemIndex" ) )
				if upgradeItemIndex and not Engine.IsItemPurchased( controller, upgradeItemIndex ) then
					ConfirmPurchase( upgradeItemIndex )
				end
			end
		end
	end
end

function UpdateCybercoreTree( self, element, controller )
	if self.upgradeTree then
		self.upgradeTree:updateTree( controller )
	end
end

function ToggleAttachmentCosmeticVariant( self, element, controller )
	local classModel = self:getModel()
	local weaponSlot = CoD.perController[controller].weaponSlot
	local classNum = CoD.perController[controller].classNum
	local elementModel = element:getModel()
	local acvList = CoD.CACUtility.GetCACWeaponACVList( weaponSlot )
	if elementModel then
		local attachmentIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "itemIndex" ) )
		local attachmentTableIndex = element.attachmentTableIndex
		if attachmentTableIndex == nil and element:getParent() then
			local f567_local0 = element:getParent()
			attachmentTableIndex = f567_local0.attachmentTableIndex
		end
		if Engine.GetAttachmentRefByIndex( attachmentTableIndex ) == "dw" then
			return 
		elseif CoD.CACUtility.DoesWeaponHaveDWInSlot( weaponSlot, controller, classModel ) then
			return 
		end
		local cacSlotAttachmentIndex = CoD.CACUtility.AttachmentEquippedInCACSlot( controller, weaponSlot, attachmentIndex )
		local weaponIndex = Engine.GetModelValue( Engine.GetModel( classModel, weaponSlot .. ".itemIndex" ) )
		local weaponName = Engine.GetWeaponString( controller, classNum, weaponSlot )
		if weaponIndex then
			local attachmentNameModel = Engine.GetModel( elementModel, "name" )
			local attachmentImageModel = Engine.GetModel( elementModel, "image" )
			if element.acvIndex == 0 then
				local acv = Engine.GetAttachmentCosmeticVariant( weaponName, attachmentTableIndex )
				if acv then
					Engine.SetModelValue( attachmentNameModel, acv.name )
					Engine.SetModelValue( attachmentImageModel, acv.image )
					element.acvIndex = 1
				end
			else
				local defaultName = Engine.GetAttachmentNameByIndex( attachmentTableIndex )
				Engine.SetModelValue( attachmentNameModel, defaultName )
				local defaultImage = Engine.GetAttachmentUniqueImageByIndex( weaponIndex, attachmentIndex )
				Engine.SetModelValue( attachmentImageModel, defaultImage )
				element.acvIndex = 0
			end
			if cacSlotAttachmentIndex then
				CoD.CACUtility.SetClassItem( controller, classNum, acvList[cacSlotAttachmentIndex], element.acvIndex )
			end
			self:playSound( "toggle_switch" )
			FocusClassItem( self, element, controller )
		end
	end
end

function SetCACWeaponAsOld( self, element, controller )
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	if CoD.PrestigeUtility.isInPermanentUnlockMenu then
		return 
	elseif itemIndexModel then
		local itemIndex = Engine.GetModelValue( itemIndexModel )
		if itemIndex > CoD.CACUtility.EmptyItemIndex then
			Engine.SetItemAsOld( controller, itemIndex )
			if self.weaponCategoryList and self.weaponCategoryList.Tabs.grid then
				local activeIndex = self.weaponCategoryList.Tabs.grid.savedActiveIndex
				local widget = self.weaponCategoryList.Tabs.grid:getItemAt( activeIndex + 1 )
				if widget then
					local breadcrumbCountModel = widget:getModel( controller, "breadcrumbCount" )
					if breadcrumbCountModel then
						local newItemCount = Engine.WeaponGroupNewItemCount( controller, widget.filter )
						Engine.SetModelValue( breadcrumbCountModel, newItemCount )
					end
				end
			end
		end
	end
end

function SetCACItemAsOld( element, controller )
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	if CoD.PrestigeUtility.isInPermanentUnlockMenu then
		return 
	elseif itemIndexModel then
		local itemIndex = Engine.GetModelValue( itemIndexModel )
		if itemIndex > CoD.CACUtility.EmptyItemIndex then
			Engine.SetItemAsOld( controller, itemIndex )
		end
	end
end

function SetCACAttachmentAsOld( element, controller )
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	if itemIndexModel then
		local attachmentIndex = Engine.GetModelValue( itemIndexModel )
		if attachmentIndex > CoD.CACUtility.EmptyItemIndex then
			Engine.SetAttachmentAsOld( controller, element.weaponIndex, attachmentIndex )
		end
	end
end

function SetSpecialistAsOld( self, element, controller )
	if CoD.PrestigeUtility.isInPermanentUnlockMenu then
		return 
	elseif IsProgressionEnabled( controller ) then
		local mode = Engine.CurrentSessionMode()
		local heroIndex = element.heroIndex
		if heroIndex then
			for loadoutTypeIndex = 0, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_COUNT - 1, 1 do
				local itemIndex = Engine.GetLoadoutItemIndexForHero( mode, heroIndex, loadoutTypeIndex )
				if CoD.CACUtility.EmptyItemIndex < itemIndex and Engine.IsItemNew( controller, itemIndex ) then
					Engine.SetItemAsOld( controller, itemIndex )
					self:processEvent( {
						name = "update_state",
						menu = self
					} )
				end
			end
		end
	end
end

function SetWeaponOptionAsOld( menu, element, controller )
	local classModel = CoD.perController[controller].classModel
	local loadoutSlotName = CoD.perController[controller].weaponCategory
	local itemIndex = CoD.SafeGetModelValue( classModel, loadoutSlotName .. ".itemIndex" )
	local weaponOptionType = CoD.SafeGetModelValue( element:getModel(), "weaponOptionType" )
	if weaponOptionType == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE then
		local weaponType = CoD.CACUtility.GetBaseWeaponLoadoutSlotName( loadoutSlotName )
		local weaponIndex = CoD.SafeGetModelValue( classModel, weaponType .. ".itemIndex" )
		itemIndex = Engine.GetItemAttachment( weaponIndex, itemIndex )
	end
	SetWeaponOptionAsOldInternal( menu, element, controller, itemIndex )
end

function SetCACACVAsOld( element, controller )
	local weaponIndex = CoD.WC_Category.ACV.selectedAttachmentWeaponIndex
	if weaponIndex and element.attachmentTableIndex and element.variantIndex then
		local mode = Engine.CurrentSessionMode()
		SetACVASOldInternal( controller, weaponIndex, element.attachmentTableIndex, element.variantIndex, mode )
	end
end

function DisableProgressionCP( controller )
	CoD.perController[controller].everythingUnlocked = true
	if CoD.perController[controller].restrictedItemIndices == nil then
		CoD.perController[controller].restrictedItemIndices = {}
	end
end

function EnableProgressionCP( controller )
	CoD.perController[controller].everythingUnlocked = nil
	if CoD.perController[controller].restrictedItemIndices ~= nil then
		for index, restrictedIdx in ipairs( CoD.perController[controller].restrictedItemIndices ) do
			Engine.SetItemRestrictionState( restrictedIdx, Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_NONE )
		end
		CoD.perController[controller].restrictedItemIndices = nil
	end
end

function CopyLoadoutFromClassSet( controller )
	if IsClassSetsAvailableForCurrentGameMode() then
		local currentClassSetIndex = Engine.GetCurrentClassSetIndex( controller )
		Engine.CopyFromClassSet( controller, currentClassSetIndex )
	end
end

function CopyLoadoutToClassSet( controller )
	if IsClassSetsAvailableForCurrentGameMode() then
		local currentClassSetIndex = Engine.GetCurrentClassSetIndex( controller )
		Engine.CopyToClassSet( controller, currentClassSetIndex )
	end
end

function IncrementClassSetAndUpdateElementDataSource( self, controller, menu, elementName, childListElementName )
	local currentClassSetIndex = Engine.GetCurrentClassSetIndex( controller )
	local numClassSetsOwned = Engine.GetNumberOfClassSetsOwned( controller )
	local newClassSetIndex = currentClassSetIndex + 1
	if numClassSetsOwned <= newClassSetIndex then
		newClassSetIndex = numClassSetsOwned - 1
	end
	if newClassSetIndex ~= currentClassSetIndex then
		Engine.CopyToClassSet( controller, currentClassSetIndex )
		Engine.SetCurrentClassSetIndex( controller, newClassSetIndex )
		Engine.CopyFromClassSet( controller, newClassSetIndex )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "currentClassSetIndex" ), newClassSetIndex )
		chooseClass_TabMPClassesListRight( menu, controller )
		UpdateElementDataSource( self[elementName], childListElementName )
	end
end

function DecrementClassSetAndUpdateElementDataSource( self, controller, menu, elementName, childListElementName )
	local currentClassSetIndex = Engine.GetCurrentClassSetIndex( controller )
	local newClassSetIndex = currentClassSetIndex - 1
	if newClassSetIndex < 0 then
		newClassSetIndex = 0
	end
	if newClassSetIndex ~= currentClassSetIndex then
		Engine.CopyToClassSet( controller, currentClassSetIndex )
		Engine.SetCurrentClassSetIndex( controller, newClassSetIndex )
		Engine.CopyFromClassSet( controller, newClassSetIndex )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "currentClassSetIndex" ), newClassSetIndex )
		chooseClass_TabMPClassesListLeft( menu, controller )
		UpdateElementDataSource( self[elementName], childListElementName )
	end
end

function SetChooseClassMenuToExtraSlotPromptState( self, controller, menu, elementName, childListElementName )
	local currentClassSetIndexModel = Engine.GetModel( Engine.GetModelForController( controller ), "currentClassSetIndex" )
	if not currentClassSetIndexModel then
		return 
	end
	DisableNavigation( self[elementName], childListElementName )
	local currentClassSetIndex = Engine.GetModelValue( currentClassSetIndexModel )
	local numClassSetsOwned = Engine.GetNumberOfClassSetsOwned( controller )
	local newClassSetIndex = currentClassSetIndex + 1
	if newClassSetIndex == numClassSetsOwned then
		Engine.SetModelValue( currentClassSetIndexModel, newClassSetIndex )
		chooseClass_TabMPClassesListRight( menu, controller )
		menu:setState( "ExtraSlots" )
	end
end

function SetChooseClassMenuFromExtraSlotPromptState( self, controller, menu, elementName, childListElementName )
	local currentClassSetIndexModel = Engine.GetModel( Engine.GetModelForController( controller ), "currentClassSetIndex" )
	if not currentClassSetIndexModel then
		return 
	end
	EnableNavigation( self[elementName], childListElementName )
	local currentClassSetIndex = Engine.GetModelValue( currentClassSetIndexModel )
	local newClassSetIndex = currentClassSetIndex - 1
	if newClassSetIndex == 0 then
		Engine.SetModelValue( currentClassSetIndexModel, newClassSetIndex )
		chooseClass_TabMPClassesListLeft( menu, controller )
		menu:setState( "DefaultState" )
	end
end

function OpenPurchaseExtraSlotsOverlay( self, controller, menu )
	OpenSystemOverlay( self, menu, controller, "PurchaseExtraSlotsConfirmation", {
		itemCODPointCost = CoD.CACUtility.EXTRA_SLOTS_COD_POINTS_COST,
		displayText = "MENU_MEDIA_STORAGE_PACK"
	} )
end

function SetHintText( self, element, controller )
	local hintText = nil
	if element then
		if element.hintText then
			hintText = element.hintText
		else
			local elementModel = element:getModel()
			if elementModel then
				local hintTextModel = Engine.GetModel( elementModel, "hintText" )
				if hintTextModel then
					hintText = Engine.GetModelValue( hintTextModel )
				end
			end
		end
	end
	if hintText == nil then
		DataSources.PerController.clearHintText( controller )
	else
		DataSources.PerController.setHintText( controller, hintText )
	end
end

function PDV_DataVaultOpened( self, controller )
	Engine.SendMenuResponse( controller, "PersonalDataVaultMenu", "mainCam" )
	PrepareOpenMenuInSafehouse( controller )
	CoD.perController[controller].InspectingDataVault = true
end

function PDV_DataVaultClosed( self, controller )
	Engine.SendMenuResponse( controller, "PersonalDataVaultMenu", "closed" )
	PrepareCloseMenuInSafehouse( controller )
	CoD.perController[controller].InspectingDataVault = false
	self:addElement( LUI.UITimer.newElementTimer( 0, true, function ()
		Close( self, controller )
	end ) )
end

function PDV_SetChoosingMap( self, element, controller )
	self:updateMode( CoD.PDV_Collectibles.Modes.SELECTING_MISSION, element )
end

function PDV_SetChoosingCollectible( self, element, controller )
	self:updateMode( CoD.PDV_Collectibles.Modes.SELECTING_COLLECTIBLE, element )
end

function PDV_SetInspectingCollectible( self, element, controller )
	self:updateMode( CoD.PDV_Collectibles.Modes.INSPECTING_COLLECTIBLE, element )
end

function PDV_ChangeCollectibleArea( self, element, controller )
	Engine.SendClientScriptNotify( controller, "collectibles_slot_change" .. CoD.GetLocalClientAdjustedNum( controller ), {
		param1 = element.collectibleSize
	} )
	CoD.perController[controller].inspectingCollectibleSize = element.collectibleSize
end

function PDV_ClearCollectible( self, element, controller )
	local collectibleSlotModel = element:getModel( controller, "collectibleSlot" )
	if collectibleSlotModel then
		local collectibleSlot = Engine.GetModelValue( collectibleSlotModel )
		Engine.ClearBunkCollectible( controller, collectibleSlot )
		Engine.SendClientScriptNotify( controller, "collectible_update" .. CoD.GetLocalClientAdjustedNum( controller ), {
			param1 = "unequip",
			param2 = collectibleSlot
		} )
	end
end

function PDV_ClearPreviewCollectible( self, element, controller )
	local collectibleSlotModel = element:getModel( controller, "collectibleSlot" )
	if collectibleSlotModel then
		local collectibleSlot = Engine.GetModelValue( collectibleSlotModel )
		Engine.SendClientScriptNotify( controller, "collectible_update" .. CoD.GetLocalClientAdjustedNum( controller ), {
			param1 = "clear_preview_collectible",
			param2 = collectibleSlot
		} )
	end
end

function PDV_ChangeFocusCollectibleSlot( self, element, controller )
	local collectibleSlotModel = element:getModel( controller, "collectibleSlot" )
	if collectibleSlotModel then
		local collectibleSlot = Engine.GetModelValue( collectibleSlotModel )
		local mapData = CoD.MapUtility.MapsTable[CoD.perController[controller].placeCollectibleMapName]
		local collectibleList = Engine.GetAssetList( mapData.collectibles )
		for index, collectible in ipairs( collectibleList ) do
			if collectible.name == CoD.perController[controller].placeCollectibleName then
				local collectibleModel = collectible.uiModel
				if collectible.uiModelWithStand ~= nil then
					collectibleModel = collectible.uiModelWithStand
				end
				Engine.SendClientScriptNotify( controller, "collectible_update" .. CoD.GetLocalClientAdjustedNum( controller ), {
					param1 = "focus_change",
					param2 = collectibleSlot,
					param3 = collectibleModel
				} )
			end
		end
	end
end

function PDV_SelectCollectibleSlot( self, element, controller )
	local collectibleSlotModel = element:getModel( controller, "collectibleSlot" )
	if collectibleSlotModel then
		local collectibleSlot = Engine.GetModelValue( collectibleSlotModel )
		local removedSlot = Engine.SetBunkCollectible( controller, collectibleSlot, CoD.perController[controller].placeCollectibleMapName, CoD.perController[controller].placeCollectibleName )
		if removedSlot ~= Enum.bunkCollectibleSlots_e.BUNK_INVALID_SLOT then
			Engine.SendClientScriptNotify( controller, "collectible_update" .. CoD.GetLocalClientAdjustedNum( controller ), {
				param1 = "unequip",
				param2 = removedSlot
			} )
		end
		local mapData = CoD.MapUtility.MapsTable[CoD.perController[controller].placeCollectibleMapName]
		local collectibleList = Engine.GetAssetList( mapData.collectibles )
		for index, collectible in ipairs( collectibleList ) do
			if collectible.name == CoD.perController[controller].placeCollectibleName then
				local collectibleModel = collectible.uiModel
				if collectible.uiModelWithStand ~= nil then
					collectibleModel = collectible.uiModelWithStand
				end
				Engine.SendClientScriptNotify( controller, "collectible_update" .. CoD.GetLocalClientAdjustedNum( controller ), {
					param1 = "equip",
					param2 = collectibleSlot,
					param3 = collectibleModel
				} )
			end
		end
	end
end

function MRV_SelectReplayMission( menu, element, controller )
	local selectedMissionModel = Engine.GetModel( menu:getModel(), "selectedMission" )
	if element == nil or element.mapId == nil or CoD.MapUtility.MapsTable[element.mapId] == nil then
		return 
	end
	local mapInfo = CoD.MapUtility.MapsTable[element.mapId]
	Engine.SetModelValue( Engine.GetModel( selectedMissionModel, "mapName" ), mapInfo.mapName )
	Engine.SetModelValue( Engine.GetModel( selectedMissionModel, "mapNameCaps" ), mapInfo.mapNameCaps )
	Engine.SetModelValue( Engine.GetModel( selectedMissionModel, "previewImage" ), mapInfo.previewImage )
	Engine.SetModelValue( Engine.GetModel( selectedMissionModel, "mapLocation" ), mapInfo.mapLocation )
	Engine.SetModelValue( Engine.GetModel( selectedMissionModel, "mapDescription" ), mapInfo.mapDescription )
	local collectibleCount = 0
	local collectedCollectibleCount = 0
	if mapInfo.collectibles then
		local iteratedList = Engine.GetAssetList( mapInfo.collectibles )
		if iteratedList ~= nil then
			collectibleCount = #iteratedList
			for i = 0, collectibleCount - 1, 1 do
				if Engine.ClientHasCollectible( controller, element.mapId, i ) then
					collectedCollectibleCount = collectedCollectibleCount + 1
				end
			end
		end
	end
	local currentStats = Engine.GetPlayerStats( controller )
	local mapHighestStats = currentStats.PlayerStatsByMap[mapInfo.rootMapName].highestStats
	Engine.SetModelValue( Engine.GetModel( selectedMissionModel, "collectiblesFound" ), collectedCollectibleCount )
	Engine.SetModelValue( Engine.GetModel( selectedMissionModel, "collectiblesTotal" ), collectibleCount )
	Engine.SetModelValue( Engine.GetModel( selectedMissionModel, "highestScore" ), mapHighestStats.SCORE:get() )
	local completionDifficulty = mapHighestStats.HIGHEST_DIFFICULTY:get()
	Engine.SetModelValue( Engine.GetModel( selectedMissionModel, "completionDifficulty" ), completionDifficulty )
end

function MRV_ClickReplayMission( self, menu, element, controller )
	if element == nil or element.mapId == nil or CoD.MapUtility.MapsTable[element.mapId] == nil then
		return 
	elseif IsElementPropertyValue( element, "classified", true ) then
		menu:OpenModalDialog( self, controller, "MENU_OUTOFORDER_PLAY", "", {
			"MPUI_YES",
			"MPUI_NO"
		}, function ( modalResult )
			if modalResult == 0 then
				local currentStats = Engine.GetPlayerStats( controller, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_CAMPAIGN )
				currentStats.allMapsUnlocked:set( 1 )
				self.MapList:updateDataSource()
			end
			return true
		end )
	else
		local nextMapNameModel = Engine.GetModel( Engine.GetGlobalModel(), "nextMap" )
		if nextMapNameModel ~= nil then
			Engine.SetModelValue( nextMapNameModel, element.mapId )
			SendMenuResponseExpression( controller, "MissionRecordVaultMenu", element.mapId )
			Engine.SetDvar( "ui_blocksaves", "1" )
			LockInput( self, controller, false )
			SendMenuResponse( self, "MissionRecordVaultMenu", "closed", controller )
		end
	end
end

function MRV_SelectAccolade( menu, element, controller )
	local elementModel = element:getModel()
	if element == nil or elementModel == nil then
		return 
	end
	local selectedAccoladeModel = Engine.GetModel( menu:getModel(), "selectedAccolade" )
	local detailsFields = {
		"challengeName",
		"challengeDetails",
		"challengeProgressQuantity",
		"rewardImage",
		"rewardName",
		"completed",
		"centerText",
		"challengeWidget"
	}
	for i = 1, #detailsFields, 1 do
		local elementValue = Engine.GetModel( elementModel, detailsFields[i] )
		if elementValue then
			elementValue = Engine.GetModelValue( elementValue )
		end
		if elementValue == nil then
			Engine.SetModelValue( Engine.GetModel( selectedAccoladeModel, detailsFields[i] ), "" )
		else
			Engine.SetModelValue( Engine.GetModel( selectedAccoladeModel, detailsFields[i] ), elementValue )
		end
	end
end

function ClearSavedHeroForEdits( controller )
	CoD.PlayerRoleUtility.SetEdittingHero( controller, nil )
end

function RefreshCharacterCustomization( self, element, controller )
	Engine.SendClientScriptNotify( controller, CoD.PlayerRoleUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( controller ), {
		param1 = "refresh",
		param2 = Engine.GetLocalClientNum( controller ),
		param3 = CoD.PlayerRoleUtility.customizationMode
	} )
end

function SelectGender( self, element, controller )
	if element.gender then
		Engine.SetGender( controller, element.gender )
		Engine.SendClientScriptNotify( controller, CoD.CPUtility.FrontendPlayerCharacterUpdate, {
			param1 = "refresh",
			param2 = Engine.GetLocalClientNum( controller ),
			param3 = CoD.PlayerRoleUtility.customizationMode
		} )
	end
end

function SelectHead( self, element, controller )
	if element.headIndex then
		Engine.SetHead( controller, CoD.PlayerRoleUtility.customizationMode, element.headIndex )
		Engine.SendClientScriptNotify( controller, CoD.CPUtility.FrontendPlayerCharacterUpdate, {
			param1 = "refresh",
			param2 = Engine.GetLocalClientNum( controller ),
			param3 = CoD.PlayerRoleUtility.customizationMode
		} )
	end
end

function HeadHighlighted( menu, element, controller )
	Engine.SendClientScriptNotify( controller, CoD.PlayerRoleUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( controller ), {
		param1 = "changeHead",
		param2 = element.headIndex,
		param3 = CoD.PlayerRoleUtility.customizationMode
	} )
end

function CancelHeadSelection( menu, controller )
	Engine.SendClientScriptNotify( controller, CoD.PlayerRoleUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( controller ), {
		param1 = "changeHead",
		param2 = CoD.PlayerRoleUtility.Heroes.selectedHead
	} )
end

function UpdateDifficulty( self, lobbyType, controller )
	local difficulty = Engine.GetProfileVarInt( controller, "g_gameskill" ) or 0
	local f605_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP )
	if lobbyType == f605_local0.name then
		difficulty = GetCPDifficulty( controller, "g_gameskill_online_cp" ) or difficulty
	else
		f605_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP )
		if lobbyType == f605_local0.name then
			difficulty = GetCPDifficulty( controller, "g_gameskill_offline_cp" ) or difficulty
		else
			f605_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_CP2 )
			if lobbyType == f605_local0.name then
				difficulty = GetCPDifficulty( controller, "g_gameskill_online_cpzm" ) or difficulty
			else
				f605_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP2 )
				if lobbyType == f605_local0.name then
					difficulty = GetCPDifficulty( controller, "g_gameskill_offline_cpzm" ) or difficulty
				else
					return 
				end
			end
		end
	end
	Engine.SetProfileVar( controller, "g_gameskill", difficulty )
	Engine.Exec( controller, "updategamerprofile" )
end

function SetDifficulty( self, element, controller )
	if element.difficulty then
		for subController = 0, Engine.GetMaxControllerCount() - 1, 1 do
			Engine.SetProfileVar( subController, "g_gameskill", element.difficulty )
			if Engine.IsCampaignModeZombies() and not IsLive() then
				SetCPDifficulty( subController, "g_gameskill_offline_cpzm", element.difficulty )
			elseif Engine.IsCampaignModeZombies() then
				SetCPDifficulty( subController, "g_gameskill_online_cpzm", element.difficulty )
			elseif not IsLive() then
				SetCPDifficulty( subController, "g_gameskill_offline_cp", element.difficulty )
			else
				SetCPDifficulty( subController, "g_gameskill_online_cp", element.difficulty )
			end
			Engine.Exec( subController, "updategamerprofile" )
			local cpSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "CampaignSettings" )
			Engine.SetModelValue( Engine.CreateModel( cpSettingsModel, "difficulty" ), Engine.Localize( CoD.CPUtility.DIFFICULTY[Engine.GetProfileVarInt( subController, "g_gameskill" )] ) )
			Engine.SetModelValue( Engine.CreateModel( cpSettingsModel, "difficultyIcon" ), CoD.CPUtility.DIFFICULTY_ICON[Engine.GetProfileVarInt( subController, "g_gameskill" )] )
			Engine.SendMenuResponse( subController, "difficulty", element.difficulty )
		end
	end
end

function SetSelectedCPMission( self, element, controller )
	if element.mapId ~= nil then
		local mapId = element.mapId
		if Engine.IsCampaignModeZombies() == true then
			SetMap( controller, string.gsub( element.mapId, "_nightmares", "" ), false )
		else
			SetMap( controller, mapId, true )
		end
		local gametype = CoD.BaseUtility.GetMapValue( element.mapId, "gametype" )
		if gametype ~= nil and gametype ~= "" then
			Engine.SetGametype( gametype )
		end
	end
end

function SetFirstTimeSetupComplete( self, element, controller )
	Engine.SetFirstTimeComplete( controller, Enum.eModes.MODE_CAMPAIGN, true )
	local f608_local0 = Engine.GetGlobalModel()
	f608_local0 = f608_local0:create( "lobbyRoot.lobbyNav" )
	f608_local0:forceNotifySubscriptions()
end

function GetPlaylistIDForSelectedCPMission( self, element, controller )
	if element.mapId ~= nil then
		local mapId = element.mapId
		local mapData = CoD.MapUtility.MapsTable[mapId]
		local playlistCategories = Engine.GetPlaylistCategories()
		for index, category in ipairs( playlistCategories ) do
			if not (not Engine.IsCampaignModeZombies() or category.ref ~= "cp_nightmares_public") or not Engine.IsCampaignModeZombies() and category.ref == "cp_public" then
				local playlists = category.playlists
				if playlists then
					for playlistsIndex, playlist in ipairs( playlists ) do
						if string.find( playlist.name, mapId ) ~= nil then
							return playlist.index
						end
					end
				end
			end
		end
	end
	local playlistIndex = 0
	if Engine.CurrentSessionMode() == Enum.eModes.MODE_CAMPAIGN then
		if Engine.IsCampaignModeZombies() then
			playlistIndex = 220
		else
			playlistIndex = 200
		end
	end
	return playlistIndex
end

function SelectHero( self, element, controller )
	local soundToPlay = nil
	if CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits then
		local selectAlias = Engine.GetHeroSelectSoundAlias( CoD.PlayerRoleUtility.customizationMode, CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits )
		if selectAlias ~= "" then
			soundToPlay = selectAlias
		end
		Engine.SetHero( controller, CoD.PlayerRoleUtility.customizationMode, CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits )
		local lobbyType = Enum.LobbyType.LOBBY_TYPE_PRIVATE
		if Engine.InLobbyParty( Enum.LobbyType.LOBBY_TYPE_GAME ) == true then
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		end
		if Engine.SendClientHeartbeat then
			Engine.SendClientHeartbeat( controller, lobbyType )
		end
	end
	element:dispatchEventToChildren( {
		name = "gamepad_button",
		down = true,
		button = "primary",
		isRepeated = false,
		controller = controller
	} )
	Engine.SendClientScriptNotify( controller, CoD.PlayerRoleUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( controller ), {
		param1 = "refresh",
		param2 = Engine.GetLocalClientNum( controller ),
		param3 = CoD.PlayerRoleUtility.customizationMode,
		param4 = soundToPlay
	} )
	ClearSavedHeroForEdits( controller )
end

function NavigateToNextHeroCard( menu, self, element, controller )
	if FirstTimeSetup_Overview( controller ) then
		FirstTimeSetup_SetChangedCharacter( controller )
		if SelectNextItemIfPossibleAndNotDisabled( self, element, controller ) and element.currentState == "Flipped" then
			SetHeroCardStateToDefault( menu, self, element, controller )
		end
	elseif FirstTimeSetup_ChangedCharacter( controller ) then
		if SelectNextItemIfPossibleAndNotDisabled( self, element, controller ) and element.currentState == "Flipped" then
			SetHeroCardStateToDefault( menu, self, element, controller )
		end
	elseif SelectNextItemIfPossible( self, element, controller ) and element.currentState == "Flipped" then
		SetHeroCardStateToDefault( menu, self, element, controller )
	end
end

function NavigateToPreviousHeroCard( menu, self, element, controller )
	if FirstTimeSetup_Overview( controller ) then
		FirstTimeSetup_SetChangedCharacter( controller )
		if SelectPreviousItemIfPossibleAndNotDisabled( self, element, controller ) and element.currentState == "Flipped" then
			SetHeroCardStateToDefault( menu, self, element, controller )
		end
	elseif FirstTimeSetup_ChangedCharacter( controller ) then
		if SelectPreviousItemIfPossibleAndNotDisabled( self, element, controller ) and element.currentState == "Flipped" then
			SetHeroCardStateToDefault( menu, self, element, controller )
		end
	elseif SelectPreviousItemIfPossible( self, element, controller ) and element.currentState == "Flipped" then
		SetHeroCardStateToDefault( menu, self, element, controller )
	end
end

function MarkSpecialistTransmissionOld( self, element, controller )
	if CoD.SafeGetModelValue( element:getModel(), "isNew" ) == true then
		local storageBase = DataSources.StorageGlobal.getModel( controller )
		local storageModelValue = CoD.SafeGetModelValue( storageBase, "stats_mp" )
		if storageModelValue then
			local state = Engine.StorageGetBuffer( controller, storageModelValue )
			state = LUI.getTableFromPath( CoD.PlayerRoleUtility.GetTransmissionNewStatPath( element.heroIndex, element.transmissionIndex ), state )
			if state then
				state:set( 1 )
				local newModel = element:getModel( controller, "isNew" )
				if newModel then
					Engine.SetModelValue( newModel, false )
				end
				local cardNewTransmissionCountModel = self:getModel( controller, "newTransmissions" )
				if cardNewTransmissionCountModel then
					Engine.SetModelValue( cardNewTransmissionCountModel, math.max( 0, Engine.GetModelValue( cardNewTransmissionCountModel ) - 1 ) )
				end
			end
		end
	end
end

function PlaySpecialistTransmission( element, controller )
	StopSpecialistTransmission( element, controller )
	local playingModel = element:getModel( controller, "playingSound" )
	local alias = CoD.SafeGetModelValue( element:getModel(), "alias" )
	if playingModel and not Engine.GetModelValue( playingModel ) and alias and alias ~= "" then
		Engine.SetModelValue( playingModel, true )
		local aliasDuration = Engine.GetSoundPlaybackTime( alias ) or 5000
		element.soundTimer = LUI.UITimer.newElementTimer( aliasDuration, true, function ()
			Engine.SetModelValue( playingModel, false )
			element.soundTimer = nil
		end )
		element:addElement( element.soundTimer )
		Engine.PlaySound( alias )
	end
end

function StopSpecialistTransmission( element, controller )
	local playingModel = element:getModel( controller, "playingSound" )
	if playingModel and Engine.GetModelValue( playingModel ) then
		if element.soundTimer then
			element.soundTimer:close()
			element.soundTimer = nil
		end
		StopSoundFromElementModel( controller, element, "alias" )
		Engine.SetModelValue( playingModel, false )
	end
end

function SetEdittingHeroFromStats( controller )
	CoD.PlayerRoleUtility.SetEdittingHero( controller, Engine.GetEquippedHero( controller, CoD.PlayerRoleUtility.customizationMode ) )
end

function UpdateEditingHero( element, controller )
	if element.heroIndex then
		CoD.PlayerRoleUtility.SetEdittingHero( controller, element.heroIndex )
		Engine.SendClientScriptNotify( controller, CoD.PlayerRoleUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( controller ), {
			param1 = "changeHero",
			param2 = CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits,
			param3 = CoD.PlayerRoleUtility.customizationMode
		} )
		NotifyScriptCharacterLoadoutChange( controller, Engine.GetLoadoutTypeForHero( controller, element.heroIndex ) )
	end
end

function HeroLoadoutPreviewChange( element, controller )
	if not element.disabled then
		NotifyScriptCharacterLoadoutChange( controller, element.equippedSlot )
	end
end

function HeroLoadoutChanged( self, element, controller )
	if not element.disabled then
		Engine.SetHeroLoadoutItem( controller, CoD.PlayerRoleUtility.customizationMode, element.heroIndex, element.equippedSlot )
		SaveLoadout( self, controller )
	end
end

function BeginEdittingHeroOption( menu, element, controller )
	if menu.updateMode then
		local colorDatasourceModel = element:getModel( controller, "colorListDatasource" )
		local colorDataSource = ""
		if colorDatasourceModel then
			colorDataSource = Engine.GetModelValue( colorDatasourceModel )
		end
		menu.updateMode( CoD.PlayerRoleUtility.PersonalizeHeroData.Modes.EdittingOption, nil, element, colorDataSource ~= "" )
	end
end

function BeginChoosingGestureOption( menu, element )
	if menu.updateMode then
		menu.updateMode( CoD.PlayerRoleUtility.TauntsData.Modes.EdittingGesture, nil, element.gestureType )
	end
end

function CancelChoosingGestureOption( menu )
	if menu.updateMode then
		menu.updateMode( CoD.PlayerRoleUtility.TauntsData.Modes.ExploringTaunts, false )
	end
end

function GestureItemSelected( menu, element, controller )
	Engine.SelectGesture( controller, CoD.PlayerRoleUtility.customizationMode, CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits, CoD.PlayerRoleUtility.TauntsData.EdittingTauntOrGestureType, element.index )
	if menu.updateMode then
		menu.updateMode( CoD.PlayerRoleUtility.TauntsData.Modes.ExploringTaunts, true )
	end
end

function PreviewGesture( controller, element )
	PreviewGesture_Internal( controller, element.xanim )
end

function PreviewGestureForStyle( controller, enumValue )
	local heroData = Engine.GetHeroBundleInfo( CoD.PlayerRoleUtility.customizationMode, CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits )
	if CoD.PlayerRoleUtility.TauntsData.GetGestureCount( heroData, enumValue ) > 0 then
		local selectedGesture = Engine.GetSelectedGestureForHero( controller, CoD.PlayerRoleUtility.customizationMode, CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits, enumValue )
		PreviewGesture_Internal( controller, CoD.PlayerRoleUtility.TauntsData.GetGestureXAnim( heroData, enumValue, selectedGesture ) )
	end
end

function PerformGestureForStyle( menu, controller, enumValue )
	SendOwnMenuResponse( menu, controller, "gesture" .. enumValue )
end

function BeginChoosingTauntOption( menu, element )
	if menu.updateMode then
		menu.updateMode( CoD.PlayerRoleUtility.TauntsData.Modes.EdittingTaunt, nil, element.tauntType )
	end
end

function CancelChoosingTauntOption( menu )
	if menu.updateMode then
		menu.updateMode( CoD.PlayerRoleUtility.TauntsData.Modes.ExploringTaunts, false )
	end
end

function TauntItemSelected( menu, element, controller )
	Engine.SelectTaunt( controller, CoD.PlayerRoleUtility.customizationMode, CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits, CoD.PlayerRoleUtility.TauntsData.EdittingTauntOrGestureType, element.index )
	if menu.updateMode then
		menu.updateMode( CoD.PlayerRoleUtility.TauntsData.Modes.ExploringTaunts, true )
	end
end

function PreviewTaunt( controller, element )
	PreviewTaunt_Internal( controller, element.xanim )
end

function HeroOptionHighlighted( menu, element, controller )
	if CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingElement then
		if CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingAreaItemIndex then
			local responseName = nil
			if CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				responseName = "changeBodyAccentColor"
			elseif CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				responseName = "changeHelmetAccentColor"
			end
			if responseName then
				Engine.SendClientScriptNotify( controller, CoD.PlayerRoleUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( controller ), {
					param1 = responseName,
					param2 = CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingAreaItemIndex - 1,
					param3 = element.optionIndex - 1,
					[1] = CoD.PlayerRoleUtility.customizationMode
				} )
			end
		else
			local responseName = nil
			local f632_local0
			if not IsSelfModelValueTrue( element, controller, "isLocked" ) then
				f632_local0 = not IsSelfModelValueTrue( element, controller, "isBMClassified" )
			else
				f632_local0 = false
			end
			if CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				responseName = "changeBody"
			elseif CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				responseName = "changeHelmet"
			end
			if responseName then
				Engine.SendClientScriptNotify( controller, CoD.PlayerRoleUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( controller ), {
					param1 = responseName,
					param2 = element.optionIndex - 1,
					param3 = CoD.PlayerRoleUtility.customizationMode,
					param4 = f632_local0
				} )
			end
		end
	end
end

function HeroOptionSelected( menu, element, controller )
	if menu.updateMode then
		local listUpdateAndSelectCategory = nil
		if CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingElement then
			CoD.CopyModelValue( controller, element, "name", CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingElement, "currentSelectionName" )
			CoD.CopyModelValue( controller, element, "image", CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingElement, "image" )
			CoD.CopyModelValue( controller, element, "color", CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingElement, "color" )
			if CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingAreaItemIndex then
				local selectedBaseItem, selectionTable = nil
				if CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
					selectedBaseItem = CoD.PlayerRoleUtility.Heroes.selectionTable.selectedBody
					selectionTable = CoD.PlayerRoleUtility.Heroes.selectionTable.bodyColors
				elseif CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
					selectedBaseItem = CoD.PlayerRoleUtility.Heroes.selectionTable.selectedHelmet
					selectionTable = CoD.PlayerRoleUtility.Heroes.selectionTable.helmetColors
				end
				if selectionTable and selectionTable[CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingAreaItemIndex] ~= element.optionIndex - 1 then
					Engine.SetHeroItem( controller, CoD.PlayerRoleUtility.customizationMode, CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits, CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea, selectedBaseItem, CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingAreaItemIndex - 1, element.optionIndex - 1 )
					Engine.InvalidateCharacterItemRender( CoD.PlayerRoleUtility.customizationMode, CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits, CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea, selectedBaseItem )
					Engine.InvalidateCharacterItemRender( CoD.PlayerRoleUtility.customizationMode, CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits, CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea, selectedBaseItem )
					if CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
						Engine.InvalidateCharacterItemRender( CoD.PlayerRoleUtility.customizationMode, CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET )
					end
				end
			else
				local selectedBaseItem = nil
				if CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
					selectedBaseItem = CoD.PlayerRoleUtility.Heroes.selectionTable.selectedBody
				elseif CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
					selectedBaseItem = CoD.PlayerRoleUtility.Heroes.selectionTable.selectedHelmet
				end
				if selectedBaseItem ~= element.optionIndex - 1 then
					listUpdateAndSelectCategory = CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea
					Engine.SetHeroItem( controller, CoD.PlayerRoleUtility.customizationMode, CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits, CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea, element.optionIndex - 1 )
					if CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
						Engine.InvalidateCharacterItemRender( CoD.PlayerRoleUtility.customizationMode, CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET )
					end
				end
			end
		end
		menu.updateMode( CoD.PlayerRoleUtility.PersonalizeHeroData.Modes.ExploringOptions, {
			customizationArea = CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea,
			colorRow = false
		} )
	end
end

function HeroColorsSelected( menu, element, controller )
	if menu.updateMode then
		local selectedBaseItem = nil
		if CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
			selectedBaseItem = CoD.PlayerRoleUtility.Heroes.selectionTable.selectedBody
		elseif CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
			selectedBaseItem = CoD.PlayerRoleUtility.Heroes.selectionTable.selectedHelmet
		end
		for index, colorIndex in pairs( CoD.PlayerRoleUtility.PersonalizeHeroData.CurrentColors ) do
			Engine.SetHeroItem( controller, CoD.PlayerRoleUtility.customizationMode, CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits, CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea, selectedBaseItem, index, colorIndex )
		end
		menu.updateMode( CoD.PlayerRoleUtility.PersonalizeHeroData.Modes.ExploringOptions, {
			customizationArea = CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea,
			colorRow = true
		} )
	end
end

function HeroColorSectionHighlighted( menu, element, controller )
	if CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingElement and element.colorTableIndex then
		CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingAreaItemIndex = element.colorTableIndex
		CoD.PlayerRoleUtility.PersonalizeHeroData.CurrentColors[element.colorTableIndex - 1] = element.optionIndex - 1
		local baseCustomizationTable = nil
		if CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
			baseCustomizationTable = CoD.PlayerRoleUtility.Heroes.heroCustomizationTable.bodies[CoD.PlayerRoleUtility.Heroes.selectionTable.selectedBody + 1].accents
		elseif CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
			baseCustomizationTable = CoD.PlayerRoleUtility.Heroes.heroCustomizationTable.helmets[CoD.PlayerRoleUtility.Heroes.selectionTable.selectedHelmet + 1].accents
		end
		if baseCustomizationTable then
			local colorItem = baseCustomizationTable[element.colorTableIndex][element.optionIndex]
			if colorItem and colorItem.name then
				local currentSelectionNameModel = CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingElement:getModel( controller, "currentSelectionName" )
				if currentSelectionNameModel then
					Engine.SetModelValue( currentSelectionNameModel, colorItem.name )
				end
			end
		end
		HeroOptionHighlighted( menu, element, controller )
	end
end

function CancelHeroOptionSelection( menu, controller )
	if CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingElement then
		if CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingAreaItemIndex then
			local responseName, currentSelection = nil
			if CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				responseName = "changeBodyAccentColor"
				currentSelection = CoD.PlayerRoleUtility.Heroes.selectionTable.bodyColors[CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingAreaItemIndex]
			elseif CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				responseName = "changeHelmetAccentColor"
				currentSelection = CoD.PlayerRoleUtility.Heroes.selectionTable.helmetColors[CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingAreaItemIndex]
			end
			if responseName and currentSelection then
				Engine.SendClientScriptNotify( controller, CoD.PlayerRoleUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( controller ), {
					param1 = responseName,
					param2 = CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingAreaItemIndex - 1,
					param3 = currentSelection
				} )
			end
		else
			local responseName, currentSelection = nil
			if CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				responseName = "changeBody"
				currentSelection = CoD.PlayerRoleUtility.Heroes.selectionTable.selectedBody
			elseif CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				responseName = "changeHelmet"
				currentSelection = CoD.PlayerRoleUtility.Heroes.selectionTable.selectedHelmet
			end
			if responseName and currentSelection then
				Engine.SendClientScriptNotify( controller, CoD.PlayerRoleUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( controller ), {
					param1 = responseName,
					param2 = currentSelection,
					param3 = CoD.PlayerRoleUtility.customizationMode
				} )
			end
		end
	end
	if menu.updateMode then
		menu.updateMode( CoD.PlayerRoleUtility.PersonalizeHeroData.Modes.ExploringOptions )
	end
end

function HeroShowcaseWeaponSelected( menu, element, controller )
	if menu.updateMode then
		local elementModel = element:getModel()
		if elementModel then
			local itemIndexModel = Engine.GetModel( elementModel, "itemIndex" )
			if itemIndexModel then
				local itemIndex = Engine.GetModelValue( itemIndexModel )
				CoD.PlayerRoleUtility.PersonalizeHeroData.SetHeroShowcaseWeapon( controller, itemIndex )
				local weaponName = Engine.GetItemRef( itemIndex ) .. "_" .. CoD.gameMode:lower()
				Engine.SendClientScriptNotify( controller, CoD.PlayerRoleUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( controller ), {
					param1 = "changeShowcaseWeapon",
					param2 = weaponName,
					param3 = "",
					param4 = "",
					param5 = CoD.PlayerRoleUtility.customizationMode
				} )
			end
		end
	end
end

function HeroShowcaseWeaponVariantSelected( menu, element, controller )
	if menu.updateMode then
		local variantName = element.weaponVariantInfo.variantNameBig
		local weaponIndex = element.weaponVariantInfo.weaponIndex
		local attachmentTable = element.weaponVariantInfo.attachmentsByIndex
		local attachmentVariantTable = element.weaponVariantInfo.attachmentVariant
		local camoIndex = element.weaponVariantInfo.camoIndex
		local paintjobSlot = element.weaponVariantInfo.paintjobSlot
		local paintjobIndex = element.weaponVariantInfo.paintjobIndex
		if CoD.PlayerRoleUtility.PersonalizeHeroData.IsDualWieldWeapon( weaponIndex, attachmentTable ) then
			weaponIndex = CoD.PlayerRoleUtility.PersonalizeHeroData.GetDualWieldVersionOfWeapon( controller, weaponIndex )
		end
		CoD.PlayerRoleUtility.PersonalizeHeroData.SetHeroShowcaseWeapon( controller, weaponIndex, variantName, attachmentTable, attachmentVariantTable, camoIndex, paintjobSlot, paintjobIndex )
		local weaponName = CoD.PlayerRoleUtility.PersonalizeHeroData.GetHeroShowcaseWeaponName( weaponIndex, attachmentTable )
		local attachmentInfo = CoD.CACUtility.GetAttachmentCosmeticVariantsFromVariantInfo( element.weaponVariantInfo )
		local weaponRenderOptions = CoD.PlayerRoleUtility.PersonalizeHeroData.GetHeroShowcaseWeaponRenderOptions( camoIndex, paintjobSlot, paintjobIndex )
		Engine.SendClientScriptNotify( controller, CoD.PlayerRoleUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( controller ), {
			param1 = "changeShowcaseWeapon",
			param2 = weaponName,
			param3 = attachmentInfo,
			param4 = weaponRenderOptions,
			param5 = CoD.PlayerRoleUtility.customizationMode
		} )
	end
end

function SetHeroItemOptionAsOld( menu, element, controller )
	local optionIndexModel = element:getModel( controller, "optionIndex" )
	if optionIndexModel then
		local optionIndex = Engine.GetModelValue( optionIndexModel )
		local characterIndex = CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits
		local characterItemType = CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea
		if optionIndex and characterIndex and characterItemType then
			Engine.SetCharacterCustomizationItemAsOld( controller, characterIndex, characterItemType, optionIndex )
			local itemBreadcrumbCountModel = CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingElement:getModel( controller, "breadcrumbCount" )
			if itemBreadcrumbCountModel then
				local newItemCountTable = Engine.CharacterCustomizationNewItemCount( controller, CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits, CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea )
				Engine.SetModelValue( itemBreadcrumbCountModel, newItemCountTable.total )
			end
			local activeIndex = menu.categoryTabs.Tabs.grid.savedActiveIndex
			local widget = menu.categoryTabs.Tabs.grid:getItemAt( activeIndex + 1 )
			if widget then
				local newItemCountTable = Engine.CharacterCustomizationNewItemCount( controller, CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits, CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea )
				local breadcrumbCountModel = widget:getModel( controller, "breadcrumbCount" )
				if breadcrumbCountModel then
					local newItemCount = 0
					if widget.filterName == "loot" then
						newItemCount = newItemCountTable.loot
					else
						newItemCount = newItemCountTable.standard
					end
					Engine.SetModelValue( breadcrumbCountModel, newItemCount )
				end
			end
		end
	end
end

function SetHeroTauntAsOld( self, element, controller )
	if element.index and element.tauntType then
		local mode = Enum.eModes.MODE_MULTIPLAYER
		local heroIndex = CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits
		Engine.SetTauntAsOld( controller, mode, heroIndex, element.tauntType, element.index )
	end
end

function SetHeroGestureAsOld( self, element, controller )
	if element.index and element.gestureType then
		local mode = Enum.eModes.MODE_MULTIPLAYER
		local heroIndex = CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits
		Engine.SetGestureAsOld( controller, mode, heroIndex, element.gestureType, element.index )
	end
end

function GetHeroPersonalizationNewCount( element, controller )
	local newCount = 0
	if element.heroIndex then
		newCount = CoD.PlayerRoleUtility.Heroes.GetPersonalizationNewCount( controller, element.heroIndex )
	end
	return newCount
end

function ListUpdateSelectionMode( self, element, expressionArg )
	self:updateMode( expressionArg, element )
end

function WC_SetChoosingCategory( self, element, controller )
	self:processEvent( {
		name = "update_selection_mode",
		mode = CoD.WC_Category.Modes.SELECTING_CATEGORY
	} )
end

function WC_SetSelectingItem( self, element, controller )
	self:processEvent( {
		name = "update_selection_mode",
		mode = CoD.WC_Category.Modes.SELECTING_ITEM,
		element = element
	} )
end

function WC_SelectingCustomization( self, element, controller )
	self:dispatchEventToParent( {
		name = "update_selection_mode",
		mode = CoD.WC_Category.Modes.SELECTING_CATEGORY
	} )
end

function WC_WeaponCustomizationGainFocus( self, element, controller )
	local baseWeaponSlot = CoD.perController[controller].weaponCategory
	local notetrack = element.xcamNotetrack
	local attachmentRef = Engine.GetModelValue( element:getModel( controller, "type" ) )
	if attachmentRef ~= CoD.CACUtility.primaryWeaponPrestigeSlot and attachmentRef ~= CoD.CACUtility.secondaryWeaponPrestigeSlot then
		Engine.SendClientScriptNotify( controller, "cam_customization_focus" .. CoD.GetLocalClientAdjustedNum( controller ), {
			base_weapon_slot = baseWeaponSlot,
			notetrack = notetrack
		} )
	end
end

function WC_WeaponOptionGainFocus( self, element, controller )
	local weaponOptionTypeNameModel = element:getModel( controller, "weaponOptionTypeName" )
	if weaponOptionTypeNameModel then
		local weaponOptionTypeName = Engine.GetModelValue( weaponOptionTypeNameModel )
		local itemIndexModel = element:getModel( controller, "itemIndex" )
		local weaponOptionTypeModel = element:getModel( controller, "weaponOptionType" )
		local weaponOptionType = Engine.GetModelValue( weaponOptionTypeModel )
		if weaponOptionType == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB then
			local paintjobIndex = Engine.GetModelValue( element:getModel( controller, "paintjobIndex" ) )
			local paintjobSlot = Engine.GetModelValue( element:getModel( controller, "paintjobSlot" ) )
			if paintjobSlot ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and paintjobIndex ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
				Engine.SetupPaintjobData( controller, paintjobSlot, paintjobIndex )
			end
		end
		if itemIndexModel then
			local itemIndex = Engine.GetModelValue( itemIndexModel )
			local f648_local0 = IsItemWeaponOptionLocked( self, element, controller )
			if not f648_local0 then
				local isItemLocked = IsSelfModelValueTrue( element, controller, "isBMClassified" )
			end
			if weaponOptionType == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_INVALID then
				CoD.CACUtility.UpdateWeaponPrestigeAttachment( controller, weaponOptionTypeName, itemIndex )
			else
				Engine.SendClientScriptNotify( controller, "cam_customization_wo" .. CoD.GetLocalClientAdjustedNum( controller ), {
					weapon_option = weaponOptionTypeName,
					weapon_option_new_index = itemIndex,
					is_item_locked = f648_local0
				} )
			end
		end
	end
end

function WC_VariantGainFocus( self, element, controller )
	Engine.SendClientScriptNotify( controller, "cam_customization_acv" .. CoD.GetLocalClientAdjustedNum( controller ), {
		weapon_attachment_name = element.attachmentRef,
		acv_index = element.variantIndex
	} )
end

function WC_VariantSelectionCancel( self, element, controller )
	local customCategory = CoD.WC_Category.ACV.selectedAttachment
	local classModel = CoD.perController[controller].classModel
	local loadoutSlotName = CoD.perController[controller].weaponCategory
	if CoD.CACUtility.IsAttachmentRefWeaponOption( customCategory ) then
		if customCategory == CoD.CACUtility.weaponOptionGroupNames[Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB] then
			local paintjobIndex = Engine.GetModelValue( Engine.GetModel( classModel, loadoutSlotName .. "paintjobIndex.itemIndex" ) )
			local paintjobSlot = Engine.GetModelValue( Engine.GetModel( classModel, loadoutSlotName .. "paintjobSlot.itemIndex" ) )
			if paintjobSlot ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and paintjobIndex ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
				Engine.SetupPaintjobData( controller, paintjobSlot, paintjobIndex )
			elseif paintjobSlot == Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and paintjobIndex == Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
				Engine.ClearPaintjobLayerData()
			end
			Engine.SendClientScriptNotify( controller, "cam_customization_wo" .. CoD.GetLocalClientAdjustedNum( controller ), {
				weapon_option = customCategory,
				weapon_option_new_index = 1
			} )
		else
			local weaponOptionName = loadoutSlotName .. customCategory
			local woIndexModel = Engine.GetModel( classModel, weaponOptionName .. ".itemIndex" )
			if woIndexModel then
				local woIndex = Engine.GetModelValue( woIndexModel )
				Engine.SendClientScriptNotify( controller, "cam_customization_wo" .. CoD.GetLocalClientAdjustedNum( controller ), {
					weapon_option = customCategory,
					weapon_option_new_index = woIndex
				} )
			end
		end
	elseif customCategory == CoD.CACUtility.primaryWeaponPrestigeSlot or customCategory == CoD.CACUtility.secondaryWeaponPrestigeSlot then
		local f650_local0 = CoD.SafeGetModelValue( classModel, loadoutSlotName .. customCategory .. ".itemIndex" )
		if not f650_local0 then
			local itemIndex = CoD.CACUtility.EmptyItemIndex
		end
		CoD.CACUtility.UpdateWeaponPrestigeAttachment( controller, customCategory, f650_local0 )
	else
		local attachmentSlotName = CoD.CACUtility.GetLoadoutSlotForAttachmentName( classModel, loadoutSlotName, customCategory )
		if attachmentSlotName then
			local acvIndexModel = Engine.GetModel( classModel, attachmentSlotName .. "cosmeticvariant.itemIndex" )
			if acvIndexModel then
				local acvIndex = Engine.GetModelValue( acvIndexModel )
				Engine.SendClientScriptNotify( controller, "cam_customization_acv" .. CoD.GetLocalClientAdjustedNum( controller ), {
					weapon_attachment_name = customCategory,
					acv_index = acvIndex
				} )
			end
		end
	end
end

function OpenChooseShowcaseWeapon( self, element, controller, param, menu )
	local showcaseWeaponModeModel = Engine.CreateModel( Engine.GetModelForController( controller ), "ShowcaseWeapon.Mode" )
	Engine.SetModelValue( showcaseWeaponModeModel, Enum.ShowcaseWeaponMode.SHOWCASEWEAPON_WEAPONLIST )
	CoD.CraftUtility.Gunsmith.ParseDDL( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
	CoD.CraftUtility.Paintjobs.ParseDDL( controller, Enum.StorageFileType.STORAGE_PAINTJOBS )
	NavigateToMenu( self, "ChooseShowcaseWeapon", true, controller )
end

function ShowcaseWeapon_TabChanged( self, element, controller )
	DataSources.Unlockables.setCurrentFilterItem( element.filter )
	CoD.perController[controller].weaponCategory = element.filter
	self.weaponList:updateDataSource( true )
	local firstFocusable = self.weaponList:getFirstSelectableItem()
	self.weaponList:setActiveItem( firstFocusable )
	if CoD.perController[controller].gunsmithWeaponCategoryRestored == true then
		local category_index = self.tabList.grid.activeWidget.gridInfoTable.zeroBasedIndex + 1
		CoD.SetCustomization( controller, category_index, "category_index" )
	end
end

function RedeemCode( self, element, controller )
	Engine.ShowRedeemCode( controller )
end

function ShowPsStoreIcon( controller )
	Store_UpdatePSStoreIconCount( controller, 1 )
	Engine.ShowPsStoreIcon()
end

function HidePsStoreIcon( controller )
	Store_UpdatePSStoreIconCount( controller, -1 )
	if CoD.perController[controller].psStoreIconCount ~= nil and CoD.perController[controller].psStoreIconCount == 0 then
		Engine.HidePsStoreIcon()
		CoD.perController[controller].selectedStoreCategory = nil
	end
end

function UpdateGlobalDataSource( controller, datasourceName )
	if DataSources[datasourceName] then
		DataSources[datasourceName].getModel( controller )
	end
end

function SetSelectedStoreCategory( self, element, controller )
	local categoryModel = element:getModel( controller, "category" )
	if categoryModel then
		local category = Engine.GetModelValue( categoryModel )
		if CoD.perController[controller].selectedStoreCategory ~= category then
			CoD.perController[controller].selectedStoreCategory = category
			local forceUpdateCategory = false
			if Engine.OwnSeasonPass( controller ) and category == "MAPPACKS" then
				forceUpdateCategory = true
			end
			if category == "EXTRASLOTS" then
				Engine.HidePsStoreIcon()
			else
				Engine.ShowPsStoreIcon()
			end
			Engine.FetchStoreProductsByCategory( controller, category, forceUpdateCategory )
		end
	end
end

function PurchaseProduct( self, element, controller )
	local category = CoD.perController[controller].selectedStoreCategory
	if IsDurango() then
		local productIDModel = element:getModel( controller, "productID" )
		if productIDModel then
			local productID = Engine.GetModelValue( productIDModel )
			if productID == "dc41534d-1a0c-49fd-b1bb-9cbe094b876c" or productID == "cdacbf1e-b4a0-4302-a445-1139d70326bb" or productID == "8dfcc3a9-5522-41fd-b39a-e3d9215bbb06" or category == "FEATURED" then
				Engine.ShowProductDetailsByID( controller, category, productID )
			else
				Engine.PurchaseProductByID( controller, category, productID )
			end
		end
	elseif IsOrbis() then
		local serviceLabelModel = element:getModel( controller, "serviceLabel" )
		if serviceLabelModel then
			local serviceLabel = Engine.GetModelValue( serviceLabelModel )
			if not (not Dvar.live_store_show_details:exists() or not Dvar.live_store_show_details:get()) or category == "FEATURED" or category == "MAPPACKS" then
				local productIDModel = element:getModel( controller, "productID" )
				if productIDModel then
					local productID = Engine.GetModelValue( productIDModel )
					Engine.ShowProductDetailsByID( controller, category, productID, serviceLabel )
				end
			else
				local skuIDModel = element:getModel( controller, "skuID" )
				if skuIDModel then
					local skuID = Engine.GetModelValue( skuIDModel )
					Engine.PurchaseProductByID( controller, category, skuID, serviceLabel )
				end
			end
		end
	elseif IsPC() then
		local skuIDModel = element:getModel( controller, "skuID" )
		local serviceLabelModel = element:getModel( controller, "serviceLabel" )
		if skuIDModel and serviceLabelModel then
			local skuID = Engine.GetModelValue( skuIDModel )
			local serviceLabel = Engine.GetModelValue( serviceLabelModel )
			Engine.PurchaseProductByID( controller, category, skuID, serviceLabel )
		end
	end
end

function RecordStoreOnItemGainFocus( self, element, controller, menu )
	element.onGainFocusTime = Engine.milliseconds()
end

function RecordStoreOnItemLoseFocus( self, element, controller, menu )
	local category = CoD.perController[controller].selectedStoreCategory
	local onFocusTime = element.onGainFocusTime
	local duration = 0
	local minimumDuration = Dvar.store_item_viewed_timer:get()
	if onFocusTime ~= nil then
		duration = Engine.milliseconds() - onFocusTime
	end
	if minimumDuration and duration < minimumDuration then
		return 
	end
	local productIDModel = element:getModel( controller, "productID" )
	if productIDModel then
		local productID = Engine.GetModelValue( productIDModel )
		CoD.MetricsUtility.StoreItemViewed( self, controller, productID, duration )
	end
end

function RecordStoreLastFocusedItemViewed( self, element, controller, menu )
	RecordStoreOnItemLoseFocus( self, element, controller, menu )
end

function EmblemEditor_HandleBackInBrowseMode( self, element, controller, focusFirstTab )
	Engine.ExecNow( controller, "emblemEndEdit" )
	local menu = GoBack( self, controller )
	if IsPaintshop( controller ) then
		CoD.SetCustomization( controller, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT, "type" )
		ForceNotifyModel( controller, "Paintshop.UpdateDataSource" )
	else
		CoD.SetCustomization( controller, Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM, "type" )
		local tabGridLayout = menu.tabList.Tabs.grid
		if tabGridLayout and focusFirstTab then
			local firstFocusable = tabGridLayout:getFirstSelectableItem()
			if firstFocusable then
				tabGridLayout:setActiveItem( firstFocusable )
			end
		end
		ForceNotifyModel( controller, "Emblem.UpdateDataSource" )
	end
	CoD.perController[controller].selectEmblemGroupIndex = nil
	CoD.perController[controller].selectedLayerIndex = nil
	CoD.perController[controller].selectedLayerIconID = nil
	CoD.perController[controller].selectedLayerMaterialID = nil
	CoD.SetEditorProperties( controller, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_NONE, "editorMode" )
	CoD.SetEditorProperties( controller, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE, "colorMode" )
	CoD.SetEditorProperties( controller, CoD.CraftUtility.EMBLEM_CLIPBOARDSTATE.EMPTY, "isClipboardEmpty" )
	Engine.CommitProfileChanges( controller )
	local customizationType = CoD.GetCustomization( controller, "type" )
	Engine.ExecNow( controller, "emblemSetGridSize " .. customizationType .. " 0" )
end

function EmblemEditor_SetEditMode( controller )
	CoD.SetEditorProperties( controller, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT, "editorMode" )
end

function EmblemEditor_LayerGainFocus( menu, self, element, controller )
	local layerIndexModel = element:getModel( controller, "layerIndex" )
	local layerNumberStringModel = element:getModel( controller, "layerNumberString" )
	local index = Engine.GetModelValue( layerIndexModel )
	CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "PLATFORM_EMBLEM_EDIT_DONE" )
	CoD.Menu.SetButtonLabel( self, Enum.LUIButton.LUI_KEY_START, "" )
	local selectedLayerIconID = Engine.GetSelectedLayerIconID( controller, index )
	CoD.perController[controller].selectedLayerIndex = index
	CoD.perController[controller].selectedLayerIconID = selectedLayerIconID
	CoD.perController[controller].selectedLayerMaterialID = Engine.GetSelectedLayerMaterialID( controller, index )
	local customizationType = CoD.GetCustomization( controller, "type" )
	EmblemEditor_SetLayerAndGroupCount( controller, customizationType )
	Engine.ExecNow( controller, "emblemSelect " .. index .. " " .. customizationType )
	if CoD.IsLayerEmpty( controller, CoD.perController[controller].selectedLayerIndex ) == true then
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_EMBLEM_CHOOSE_DECAL" )
	else
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_EMBLEM_EDIT_LAYER" )
	end
	local linkedLayerCount = Engine.GetLinkedLayerCount( controller, customizationType )
	CoD.SetEditorProperties( controller, linkedLayerCount, "linkedLayerCount" )
	CoD.SetEditorProperties( controller, selectedLayerIconID, "selectedDecalID" )
	Engine.ForceNotifyModelSubscriptions( layerNumberStringModel )
	if CoD.isPC then
		if IsLayerEmpty( self, element, controller ) then
			self.actionsListPC:hide()
		else
			self.actionsListPC:show()
		end
	end
end

function EmblemEditor_InsertDecalPressed( self, element, controller )
	local customizationType = CoD.GetCustomization( controller, "type" )
	Engine.ExecNow( controller, "emblemCopyLayer " .. CoD.perController[controller].selectedLayerIndex )
	Engine.ExecNow( controller, "emblemInsertLayer " .. customizationType .. " " .. CoD.perController[controller].selectedLayerIndex )
	Engine.ExecNow( controller, "emblemClearLayerByIndex " .. CoD.perController[controller].selectedLayerIndex .. " " .. customizationType )
	CoD.SetEditorProperties( controller, CoD.CraftUtility.EMBLEM_ADDDECAL.INSERT, "addDecalMode" )
end

function EmblemEditor_SetEditLayerTitle( self, controller )
	local isPaintshop = IsPaintshop( controller )
	if isPaintshop then
		local editSideString = CoD.CraftUtility.PaintshopView[CoD.perController[controller].viewIndex].edit_side_ref
		self.PaintshopFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( editSideString ) )
	else
		self.EmblemEditorFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEM_EDIT_LAYER_TITLE" ) )
	end
end

function EmblemEditor_EditSelectedLayer( self, element, controller )
	local selectedLayerIndex = CoD.perController[controller].selectedLayerIndex
	Engine.ExecNow( controller, "emblemCopyLayer " .. selectedLayerIndex )
	CoD.SetEditorProperties( controller, CoD.CraftUtility.EMBLEM_CLIPBOARDSTATE.EMPTY, "isClipboardEmpty" )
	EmblemEditor_SetEditLayerTitle( self, controller )
	CoD.SwapFocusableElements( controller, self.layerCarousel, self.emblemDrawWidget )
	EmblemEditor_SetEditMode( controller )
	local color = Engine.GetSelectedLayerColor( controller )
	local color1 = Engine.GetSelectedLayerColor1( controller )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemSelectedLayerProperties.opacity0" ), math.floor( color.alpha * 100 ) )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemSelectedLayerProperties.opacity1" ), math.floor( color1.alpha * 100 ) )
	Engine.ExecNow( controller, "emblemBeginEdit" )
	CoD.perController[controller].selectedLayerMaterialID = Engine.GetSelectedLayerMaterialID( controller, selectedLayerIndex )
	EmblemEditor_SetScaleMode( controller, Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED )
	EmblemEditor_SetMaterialScaleMode( controller, Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED )
end

function EmblemEditor_MoveLayer( self, element, controller, direction )
	local activeWidget = self.layerCarousel.activeWidget
	local layerIndexModel = activeWidget:getModel( controller, "layerIndex" )
	local layerIndex = Engine.GetModelValue( layerIndexModel )
	local customizationType = CoD.GetCustomization( controller, "type" )
	local layerAndGroupIndex = nil
	if activeWidget ~= nil then
		if direction == "left" then
			if layerIndex > 0 then
				Engine.ExecNow( controller, "emblemMoveLayerRelative -1 " .. customizationType )
				local previousItemWidget = self.layerCarousel:getItemAtPosition( 1, activeWidget.gridInfoTable.zeroBasedIndex, true )
				if previousItemWidget ~= nil then
					DataSources.EmblemLayerList.swapItemInfo( controller, self.layerCarousel, previousItemWidget, activeWidget )
					EmblemEditor_SetupDrawEmblem( controller, activeWidget, previousItemWidget )
					self.layerCarousel:setActiveItem( previousItemWidget )
					EmblemEditor_SetSelectedLayerIndex( controller, previousItemWidget )
					activeWidget.arrows:setState( "DefaultState" )
					if layerIndex > 1 then
						previousItemWidget.arrows:setState( "LeftButtonPressed" )
					end
				end
			end
		elseif direction == "right" then
			local totalUsedLayers = Engine.GetUsedLayerCount( controller, customizationType, CoD.perController[controller].totalLayers )
			local groupLayerCountModel = activeWidget:getModel( controller, "groupLayerCount" )
			local groupLayerCount = Engine.GetModelValue( groupLayerCountModel )
			if layerIndex + groupLayerCount < totalUsedLayers then
				Engine.ExecNow( controller, "emblemMoveLayerRelative 1 " .. customizationType )
				local nextItemWidget = self.layerCarousel:getItemAtPosition( 1, activeWidget.gridInfoTable.zeroBasedIndex + 2, true )
				if nextItemWidget ~= nil then
					DataSources.EmblemLayerList.swapItemInfo( controller, self.layerCarousel, activeWidget, nextItemWidget )
					EmblemEditor_SetupDrawEmblem( controller, activeWidget, nextItemWidget )
					self.layerCarousel:setActiveItem( nextItemWidget )
					EmblemEditor_SetSelectedLayerIndex( controller, nextItemWidget )
					activeWidget.arrows:setState( "DefaultState" )
					if layerIndex + 2 < totalUsedLayers then
						nextItemWidget.arrows:setState( "RightButtonPressed" )
					end
				end
			end
		end
	end
end

function EmblemEditor_CopyLayerToClipboard( self, element, controller )
	Engine.ExecNow( controller, "emblemCopyLayer " .. CoD.perController[controller].selectedLayerIndex )
	CoD.SetEditorProperties( controller, CoD.CraftUtility.EMBLEM_CLIPBOARDSTATE.FULL, "isClipboardEmpty" )
	self.clipboard:setState( "Visible" )
end

function EmblemEditor_UpdateLayerData( self, controller )
	local layerIndexModel = self.layerCarousel.activeWidget:getModel( controller, "layerIndex" )
	local index = Engine.GetModelValue( layerIndexModel )
	self.layerCarousel:updateDataSource( true )
	local focusedWidget = self.layerCarousel:findItem( {
		layerIndex = index
	}, nil, false, nil )
	if focusedWidget then
		self.layerCarousel:processEvent( {
			name = "gain_focus",
			controller = controller,
			selectIndex = focusedWidget.gridInfoTable.zeroBasedIndex,
			overrideScrollTime = 0
		} )
	end
end

function EmblemEditor_InsertLayer( self, element, controller )
	local customizationType = CoD.GetCustomization( controller, "type" )
	Engine.ExecNow( controller, "emblemInsertLayer " .. customizationType .. " " .. CoD.perController[controller].selectedLayerIndex )
end

function EmblemEditor_HandleBackInEditMode( self, element, controller )
	Engine.ExecNow( controller, "emblemEndEdit" )
	local isPaintshop = IsPaintshop( controller )
	if isPaintshop == true then
		local paintshopTitleString = Engine.Localize( "MENU_PAINTSHOP_CAPS" )
		self.PaintshopFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( paintshopTitleString )
	else
		self.EmblemEditorFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEM_EDITOR_CAPS" ) )
	end
	SetBrowseMode( controller )
	CoD.SwapFocusableElements( controller, self.emblemDrawWidget, self.layerCarousel )
end

function EmblemEditor_SetupEditorBasedOnMode( self, element, controller )
	if IsEditMode( controller ) then
		local selectedWidget = self.layerCarousel:findItem( {
			layerIndex = CoD.perController[controller].selectedLayerIndex
		}, nil, true, 0 )
		EmblemEditor_EditSelectedLayer( self, selectedWidget, controller )
	else
		CoD.SwapFocusableElements( controller, self.emblemDrawWidget, self.layerCarousel )
	end
end

function EmblemEditor_FlipIcon( self, element, controller )
	Engine.ExecNow( controller, "emblemToggleFlip" )
end

function EmblemEditor_ToggleOutline( self, element, controller )
	Engine.ExecNow( controller, "emblemToggleOutline" )
end

function EmblemEditor_EndEdit( self, element, controller )
	Engine.ExecNow( controller, "emblemEndEdit" )
end

function EmblemEditor_BeginEdit( self, element, controller )
	Engine.ExecNow( controller, "emblemBeginEdit" )
end

function EmblemEditor_CutLayer( self, element, controller )
	local customizationType = CoD.GetCustomization( controller, "type" )
	Engine.ExecNow( controller, "emblemCutLayer " .. customizationType )
	CoD.SetEditorProperties( controller, CoD.CraftUtility.EMBLEM_CLIPBOARDSTATE.FULL, "isClipboardEmpty" )
	self.clipboard:setState( "Visible" )
end

function EmblemEditor_OpenLayerOptionsPopup( self, element, controller )
	self:OpenModalDialog( self, controller, "MENU_TAB_OPTIONS", "", {
		"MENU_EMBLEM_RESET_LAYER"
	}, function ( modalResult )
		if modalResult == 0 then
			local customizationType = CoD.GetCustomization( controller, "type" )
			Engine.ExecNow( controller, "emblemRevertLayerChanges " .. CoD.perController[controller].selectedLayerIndex .. " " .. customizationType )
			EmblemEditor_BeginEdit( self, element, controller )
			return true
		elseif modalResult == nil then
			EmblemEditor_BeginEdit( self, element, controller )
			return true
		else
			
		end
	end )
end

function EmblemEditor_HandleKeyboardComplete( self, element, controller, event )
	local selectedEmblemModel = CoD.perController[controller].selectedEmblemModel
	local emblemTextEntryModel = nil
	if not selectedEmblemModel then
		return 
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_EMBLEMS then
		emblemTextEntryModel = Engine.GetModel( selectedEmblemModel, "emblemTextEntry" )
		if emblemTextEntryModel then
			Engine.SetModelValue( emblemTextEntryModel, event.input )
		end
		local inputTextModel = self:getModel( controller, "inputText" )
		if inputTextModel then
			Engine.SetModelValue( inputTextModel, event.input )
		end
	end
end

function EmblemEditor_OpenSavePopup( self, element, controller, menu )
	CoD.OverlayUtility.CreateOverlay( controller, self, "EmblemSave", CoD.perController[controller].selectedEmblemModel )
end

function EmblemEditor_SaveEmblem( self, element, controller, selectedEmblemModel )
	local emblemTextEntry = Engine.GetModelValue( Engine.GetModel( selectedEmblemModel, "emblemTextEntry" ) )
	local emblemNameModel = Engine.GetModel( selectedEmblemModel, "emblemName" )
	local quota = Engine.MediaManagerGetQuota( controller, "emblem" )
	Engine.SetModelValue( emblemNameModel, emblemTextEntry )
	local focusFirstTab = false
	EmblemEditor_RecordComScoreEvent( self, controller, quota.categorySlotsUsed, quota.categoryQuota )
	if CoD.perController[controller].selectedEmblemTabStorageType == Enum.StorageFileType.STORAGE_EMBLEMS then
		CoD.CraftUtility.Emblems.UploadEmblem( controller, selectedEmblemModel )
		CoD.CraftUtility.Emblems.ParseDDL( controller, Enum.StorageFileType.STORAGE_EMBLEMS )
	elseif IsPreBuiltEmblemTab( controller ) then
		local storageFileType = Enum.StorageFileType.STORAGE_EMBLEMS
		CoD.CraftUtility.Emblems.ParseDDL( controller, storageFileType )
		CoD.CraftUtility.Emblems.Copy( controller, selectedEmblemModel, storageFileType )
		focusFirstTab = true
	end
	local emblemEditorMenu = GoBack( self, controller )
	EmblemEditor_HandleBackInBrowseMode( emblemEditorMenu, element, controller, focusFirstTab )
	ClearSavedState( emblemEditorMenu, controller )
end

function EmblemEditor_DiscardChanges( self, element, controller, selectedEmblemModel )
	local emblemEditorMenu = GoBack( self, controller )
	EmblemEditor_HandleBackInBrowseMode( emblemEditorMenu, element, controller )
	ClearSavedState( emblemEditorMenu, controller )
end

function EmblemEditor_NoChangesAction( self, element, controller, menu )
	local baseMenu = GoBack( self, controller )
	EmblemEditor_HandleBackInBrowseMode( baseMenu, element, controller )
end

function EmblemEditor_SaveChangesBack( self, element, controller, selectedEmblemModel )
	local isEmblemOccupied = false
	local emblemIndexModel = Engine.GetModel( selectedEmblemModel, "emblemIndex" )
	if emblemIndexModel then
		local emblemIndex = Engine.GetModelValue( emblemIndexModel )
		if CoD.CraftUtility.Emblems.IsEmblemIndexOccupied( emblemIndex ) then
			isEmblemOccupied = true
		end
	end
	if not isEmblemOccupied then
		local emblemTextEntryModel = Engine.GetModel( selectedEmblemModel, "emblemTextEntry" )
		Engine.SetModelValue( emblemTextEntryModel, "Emblem" )
	end
end

function EmblemEditor_ToggleScaleMode( self, element, controller )
	local scaleMode = Engine.GetEmblemScaleMode( controller )
	if scaleMode == Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED then
		scaleMode = Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FREE
	else
		scaleMode = Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED
	end
	CoD.SetEditorProperties( controller, scaleMode, "scaleMode" )
	Engine.ExecNow( controller, "emblemSetScaleMode " .. scaleMode )
end

function EmblemEditor_LinkUnlinkLayers( self, element, controller )
	local layerModel = element:getModel()
	local layerIndexModel = Engine.GetModel( layerModel, "layerIndex" )
	if layerIndexModel then
		local layerIndex = Engine.GetModelValue( layerIndexModel )
		local customizationType = CoD.GetCustomization( controller, "type" )
		local isLayerLinkedModel = Engine.GetModel( layerModel, "isLinked" )
		local groupIndexModel = Engine.GetModel( layerModel, "groupIndex" )
		if isLayerLinkedModel then
			local isLayerLinked = Engine.GetModelValue( isLayerLinkedModel )
			if isLayerLinked == true then
				Engine.ExecNow( controller, "unlinkLayers " .. customizationType )
				Engine.SetModelValue( isLayerLinkedModel, false )
			else
				Engine.ExecNow( controller, "linkLayers " .. customizationType )
				Engine.SetModelValue( isLayerLinkedModel, true )
			end
			local layerData = Engine.GetSelectedLayerData( controller, layerIndex, customizationType )
			Engine.SetModelValue( groupIndexModel, layerData.groupIndex )
			local linkedLayerCount = Engine.GetLinkedLayerCount( controller, customizationType )
			CoD.SetEditorProperties( controller, linkedLayerCount, "linkedLayerCount" )
		end
	end
end

function EmblemEditor_GroupUngroupLayers( self, element, controller )
	local layerModel = element:getModel()
	local layerIndexModel = Engine.GetModel( layerModel, "layerIndex" )
	if layerIndexModel then
		local layerIndex = Engine.GetModelValue( layerIndexModel )
		local customizationType = CoD.GetCustomization( controller, "type" )
		local isLayerLinkedModel = Engine.GetModel( layerModel, "isLinked" )
		local isGroupedModel = Engine.GetModel( layerModel, "isGrouped" )
		local groupIndexModel = Engine.GetModel( layerModel, "groupIndex" )
		if isLayerLinkedModel and isGroupedModel then
			local isLayerLinked = Engine.GetModelValue( isLayerLinkedModel )
			local isGrouped = Engine.GetModelValue( isGroupedModel )
			local layerData = Engine.GetSelectedLayerData( controller, layerIndex, customizationType )
			local linkedLayerCount = CoD.GetEditorProperties( controller, "linkedLayerCount" )
			if isLayerLinked == true then
				if isGrouped == true then
					Engine.ExecNow( controller, "ungroupLayers " .. customizationType )
					Engine.SetModelValue( isGroupedModel, false )
					Engine.SetModelValue( groupIndexModel, layerData.groupIndex )
					self.layerCarousel:updateDataSource()
				elseif linkedLayerCount >= 2 and IsGroupSlotAvailable( controller ) then
					Engine.ExecNow( controller, "groupLayers " .. customizationType )
					Engine.SetModelValue( isGroupedModel, true )
					Engine.SetModelValue( groupIndexModel, layerData.groupIndex )
					CoD.perController[controller].selectEmblemGroupIndex = layerData.groupIndex
					self.layerCarousel:updateDataSource()
					CoD.perController[controller].selectEmblemGroupIndex = nil
				end
			end
		end
		local linkedLayerCount = Engine.GetLinkedLayerCount( controller, customizationType )
		CoD.SetEditorProperties( controller, linkedLayerCount, "linkedLayerCount" )
	end
end

function EmblemEditor_SaveSelectedGroup( self, element, controller, event )
	
end

function Emblems_SetIconOld( menu, element, controller )
	local iconID = CoD.SafeGetModelValue( element:getModel(), "iconID" )
	if iconID then
		Engine.SetEmblemIconOld( controller, iconID )
		local currentTab = LUI.getTableFromPath( "tabList.Tabs.grid.activeWidget", menu )
		if currentTab then
			local breadcrumbModel = currentTab:getModel( controller, "breadcrumbCount" )
			if breadcrumbModel then
				Engine.SetModelValue( breadcrumbModel, math.max( 0, Engine.GetModelValue( breadcrumbModel ) - 1 ) )
			end
		end
	end
end

function Emblems_SetEmblemOld( menu, element, controller )
	local emblemIndex = CoD.SafeGetModelValue( element:getModel(), "emblemIndex" )
	if emblemIndex then
		local crumbRoot = CoD.CraftUtility.Emblems.GetEmblemBreadcrumbRoot( controller, emblemIndex, CoD.perController[controller].selectedEmblemTabStorageType )
		if crumbRoot then
			crumbRoot:set( 1 )
			local currentTab = LUI.getTableFromPath( "tabList.Tabs.grid.activeWidget", menu )
			if currentTab then
				local breadcrumbModel = currentTab:getModel( controller, "breadcrumbCount" )
				if breadcrumbModel then
					Engine.SetModelValue( breadcrumbModel, math.max( 0, Engine.GetModelValue( breadcrumbModel ) - 1 ) )
				end
			end
		end
	end
end

function Emblems_SetMaterialOld( menu, element, controller )
	local materialID = CoD.SafeGetModelValue( element:getModel(), "materialID" )
	if materialID then
		local crumbRoot = CoD.CraftUtility.Emblems.GetEmblemMaterialBreadcrumbRoot( controller, materialID )
		if crumbRoot then
			crumbRoot:set( 1 )
			local currentTab = LUI.getTableFromPath( "materialSwatch.tabList.Tabs.grid.activeWidget", menu )
			if currentTab then
				local breadcrumbModel = currentTab:getModel( controller, "breadcrumbCount" )
				if breadcrumbModel then
					Engine.SetModelValue( breadcrumbModel, math.max( 0, Engine.GetModelValue( breadcrumbModel ) - 1 ) )
				end
			end
		end
	end
end

function EmblemChooseIcon_SelectionRejected( self, element, controller )
	local addDecalMode = CoD.GetEditorProperties( controller, "addDecalMode" )
	if CoD.perController[controller].selectedLayerIconID == CoD.CraftUtility.EMBLEM_INVALID_ID then
		local customizationType = CoD.GetCustomization( controller, "type" )
		Engine.ExecNow( controller, "emblemClear " .. customizationType )
	elseif addDecalMode == CoD.CraftUtility.EMBLEM_ADDDECAL.INSERT then
		local customizationType = CoD.GetCustomization( controller, "type" )
		Engine.ExecNow( controller, "emblemCutLayer " .. customizationType )
	else
		Engine.ExecNow( controller, "emblemSetSelectedLayerIconId " .. CoD.perController[controller].selectedLayerIconID )
	end
	CoD.SetEditorProperties( controller, CoD.CraftUtility.EMBLEM_ADDDECAL.REPLACE, "addDecalMode" )
	SetBrowseMode( controller )
end

function EmblemChooseIcon_SelectionAccepted( self, element, controller )
	local addDecalMode = CoD.GetEditorProperties( controller, "addDecalMode" )
	local totalLayers = CoD.perController[controller].totalLayers
	if addDecalMode == CoD.CraftUtility.EMBLEM_ADDDECAL.INSERT and CoD.perController[controller].selectedLayerIndex + 1 < totalLayers then
		local customizationType = CoD.GetCustomization( controller, "type" )
	end
	CoD.SetEditorProperties( controller, CoD.CraftUtility.EMBLEM_ADDDECAL.REPLACE, "addDecalMode" )
end

function EmblemChooseIcon_SelectionChanged( self, element, controller )
	if IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
		local bmClassifiedEmblemIconID = -2
		Engine.ExecNow( controller, "emblemSetSelectedLayerIconId " .. bmClassifiedEmblemIconID )
	else
		local iconIDModel = element:getModel( controller, "iconID" )
		local selectedIconID = Engine.GetModelValue( iconIDModel )
		Engine.ExecNow( controller, "emblemSetSelectedLayerIconId " .. selectedIconID )
		CoD.SetEditorProperties( controller, selectedIconID, "selectedDecalID" )
	end
end

function EmblemChooseIcon_TabChanged( self, element, controller )
	CoD.perController[controller].selectedDecalCategory = element.tabCategory
	self.emblemIconList:updateDataSource()
end

function EmblemChooseIcon_SetPreviewDecalCamera( self, element, controller )
	local view_index = CoD.perController[controller].viewIndex
	local view_name = CoD.CraftUtility.PaintshopView[view_index].view_name
	CoD.CraftUtility.DisplayWeaponInPaintshop( controller, "paintshop_preview_" .. view_name )
end

function EmblemChooseIcon_RevertPreviewDecalCamera( self, element, controller )
	local view_index = CoD.perController[controller].viewIndex
	local view_name = CoD.CraftUtility.PaintshopView[view_index].view_name
	CoD.CraftUtility.DisplayWeaponInPaintshop( controller, view_name )
end

function EmblemChooseMaterial_TabChanged( self, element, controller )
	CoD.perController[controller].selectedMaterialCategory = element.filter
	self.materialSwatch:updateDataSource()
end

function EmblemChooseMaterial_SelectionChanged( self, element, controller )
	if IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
		return true
	end
	local materialModel = element:getModel( controller, "materialID" )
	if materialModel then
		local materialID = Engine.GetModelValue( materialModel )
		Engine.ExecNow( controller, "emblemSetSelectedDecalMaterialId " .. materialID )
	end
end

function EmblemChooseMaterial_UpdateMaterialAngleByStep( self, element, step, controller )
	Engine.ExecNow( controller, "emblemUpdateMaterialAngle " .. step )
end

function EmblemChooseMaterial_ToggleScaleMode( self, element, controller )
	local scaleMode = Engine.GetLayerMaterialScaleMode( controller )
	if scaleMode == Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED then
		scaleMode = Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FREE
	else
		scaleMode = Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED
	end
	CoD.SetEditorProperties( controller, scaleMode, "materialScaleMode" )
	Engine.ExecNow( controller, "setMaterialScaleMode " .. scaleMode )
end

function EmblemChooseColor_ToggleBlend( self, element, controller )
	local customizationType = CoD.GetCustomization( controller, "type" )
	Engine.ExecNow( controller, "emblemToggleColorBlend " .. customizationType )
end

function EmblemChooseColor_ClearSelectedLayerMaterial( self, element, controller )
	Engine.ExecNow( controller, "emblemClearSelectedLayerMaterialId" )
end

function EmblemChooseColor_SelectionChanged( self, element, controller )
	local isGradientMode = CoD.GetEditorProperties( controller, "isGradientMode" )
	local colorNum = CoD.GetEditorProperties( controller, "colorNum" )
	local colorModel = element:getModel( controller, "color" )
	local colorValue = Engine.GetModelValue( colorModel )
	local normalizedColor = CoD.ColorUtility.NormalizeColor( colorValue )
	if isGradientMode == 0 then
		Engine.ExecNow( controller, "emblemSetLayerColor " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_NONE .. " " .. normalizedColor[1] .. " " .. normalizedColor[2] .. " " .. normalizedColor[3] )
		Engine.ExecNow( controller, "emblemClearGradient" )
	elseif isGradientMode == 1 then
		if colorNum == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 then
			Engine.ExecNow( controller, "emblemSetLayerColor " .. colorNum .. " " .. normalizedColor[1] .. " " .. normalizedColor[2] .. " " .. normalizedColor[3] )
			if PropertyIsTrue( self, "isColor1NoColor" ) then
				Engine.ExecNow( controller, "emblemSetLayerColor " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 .. " " .. normalizedColor[1] .. " " .. normalizedColor[2] .. " " .. normalizedColor[3] )
			end
		elseif colorNum == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
			Engine.ExecNow( controller, "emblemSetLayerColor " .. colorNum .. " " .. normalizedColor[1] .. " " .. normalizedColor[2] .. " " .. normalizedColor[3] )
			if PropertyIsTrue( self, "isColor0NoColor" ) then
				Engine.ExecNow( controller, "emblemSetLayerColor " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 .. " " .. normalizedColor[1] .. " " .. normalizedColor[2] .. " " .. normalizedColor[3] )
			end
		end
	end
end

function EmblemChooseColor_SelectNoColor( self, element, controller )
	local selectedLayerNoColorModel = DataSources.EmblemSelectedLayerNoColor.getModel( controller )
	if selectedLayerNoColorModel ~= nil then
		local noColorValue = Engine.GetModelValue( Engine.GetModel( selectedLayerNoColorModel, "color" ) )
		local normalizedNoColor = CoD.ColorUtility.NormalizeColor( noColorValue )
		self.opacity0 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemSelectedLayerProperties.opacity0" ) ) / 100
		self.opacity1 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemSelectedLayerProperties.opacity1" ) ) / 100
		local colorNum = CoD.GetEditorProperties( controller, "colorNum" )
		Engine.ExecNow( controller, "emblemSetLayerColor " .. colorNum .. " " .. normalizedNoColor[1] .. " " .. normalizedNoColor[2] .. " " .. normalizedNoColor[3] )
		Engine.ExecNow( controller, "emblemLayerUpdateOpacity " .. colorNum .. " -1.0" )
	end
end

function EmblemChooseColor_NoColorLoseFocus( self, element, controller )
	local colorNum = CoD.GetEditorProperties( controller, "colorNum" )
	local lastSavedColorIsInFocus = self.lastSavedColor:isInFocus()
	if lastSavedColorIsInFocus or CoD.isPC then
		if not PropertyIsTrue( self, "isColor0NoColor" ) and colorNum == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 then
			if self.opacity0 ~= nil and self.opacity0 ~= 0 then
				Engine.ExecNow( controller, "emblemLayerUpdateOpacity " .. colorNum .. " " .. self.opacity0 )
			else
				Engine.ExecNow( controller, "emblemLayerUpdateOpacity " .. colorNum .. " 1.0" )
			end
		elseif not PropertyIsTrue( self, "isColor1NoColor" ) and colorNum == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
			if self.opacity1 ~= nil and self.opacity1 ~= 0 then
				Engine.ExecNow( controller, "emblemLayerUpdateOpacity " .. colorNum .. " " .. self.opacity1 )
			else
				Engine.ExecNow( controller, "emblemLayerUpdateOpacity " .. colorNum .. " 1.0" )
			end
		end
	end
end

function EmblemChooseColor_ToggleColorMode( self, element, controller )
	local colorModeValue = CoD.GetEditorProperties( controller, "colorMode" )
	local isGradientMode = CoD.GetEditorProperties( controller, "isGradientMode" )
	local selectedColor = CoD.GetSelectedColor( controller )
	if selectedColor ~= nil then
		EmblemChooseColor_SetShaderParams( controller, EmblemChooseColor_GetColorMixerElement( self, controller ), selectedColor )
	end
	if colorModeValue == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER then
		self:updateMode( Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, isGradientMode )
		CoD.SetEditorProperties( controller, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, "colorMode" )
	elseif colorModeValue == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID then
		CoD.SetNoColorDataModel( controller )
		local isColor0NoColor = CoD.GetEditorProperties( controller, "isColor0NoColor" )
		local isColor1NoColor = CoD.GetEditorProperties( controller, "isColor1NoColor" )
		local colorNum = CoD.GetEditorProperties( controller, "colorNum" )
		if isColor0NoColor == 1 and colorNum == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 then
			Engine.ExecNow( controller, "emblemSetLayerColor " .. colorNum .. " 1 1 1" )
			Engine.ExecNow( controller, "emblemLayerUpdateOpacity " .. colorNum .. " 1.0" )
		elseif isColor1NoColor == 1 and colorNum == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
			Engine.ExecNow( controller, "emblemSetLayerColor " .. colorNum .. " 1 1 1" )
			Engine.ExecNow( controller, "emblemLayerUpdateOpacity " .. colorNum .. " 1.0" )
		end
		EmblemChooseColor_SetupSelectedLayerColorModel( controller )
		self:updateMode( Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER, isGradientMode )
		CoD.SetEditorProperties( controller, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER, "colorMode" )
	end
	EmblemChooseColor_SetupSelectedLayerColorModel( controller )
end

function EmblemChooseColor_ToggleGradientMode( self, element, controller )
	local isGradientMode = CoD.GetEditorProperties( controller, "isGradientMode" )
	local colorModeValue = CoD.GetEditorProperties( controller, "colorMode" )
	self.colorGradientContainer:setState( "DefaultState" )
	if isGradientMode == 1 then
		CoD.SetEditorProperties( controller, 0, "isGradientMode" )
		CoD.SetNoColorDataModel( controller )
		local isColor0NoColor = CoD.GetEditorProperties( controller, "isColor0NoColor" )
		if isColor0NoColor ~= nil and isColor0NoColor == 1 then
			Engine.ExecNow( controller, "emblemSetLayerColor " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 .. " 1 1 1" )
			local colorNum = CoD.GetEditorProperties( controller, "colorNum" )
			Engine.ExecNow( controller, "emblemLayerUpdateOpacity " .. colorNum .. " 1.0" )
		end
		EmblemChooseColor_SetupSelectedLayerColorModel( controller )
		CoD.SetEditorProperties( controller, Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_NONE, "colorNum" )
		CoD.SetEditorProperties( controller, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, "colorMode" )
		self:updateMode( Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, 0 )
	elseif isGradientMode == 0 then
		CoD.SetEditorProperties( controller, 1, "isGradientMode" )
		Engine.ExecNow( controller, "emblemLayerUpdateOpacity " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 .. " -1" )
		if colorModeValue == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER then
			self:updateMode( Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER, 1 )
		else
			self:updateMode( Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, 1 )
		end
	end
	EmblemChooseColor_SetupSelectedLayerColorModel( controller )
	local gradientSlider = EmblemChooseColor_GetGradientSliderElement( self, controller )
	EmblemGradient_UpdateGradientFillByStep( gradientSlider, gradientSlider, 0, controller )
end

function EmblemChooseColor_DecrementColorComponent( self, element, controller, colorName )
	local colorModel = element:getModel( controller, colorName )
	EmblemChooseColor_ModifyColorModelValue( colorModel, -1 )
	EmblemChooseColor_SetBarProperties( self, element, colorModel, controller )
end

function EmblemChooseColor_IncrementColorComponent( self, element, controller, colorName )
	local colorModel = element:getModel( controller, colorName )
	EmblemChooseColor_ModifyColorModelValue( colorModel, 1 )
	EmblemChooseColor_SetBarProperties( self, element, colorModel, controller )
end

function EmblemChooseColor_SetColorComponent( self, element, controller, colorName, newColorValue )
	local colorModel = element:getModel( controller, colorName )
	EmblemChooseColor_SetColorModelValue( colorModel, newColorValue )
	EmblemChooseColor_SetBarProperties( self, element, colorModel, controller )
end

function EmblemChooseColor_UpdateOpacityByStep( self, element, step, controller )
	local isSelectedColorEmpty = IsSelectedColorEmpty( element, controller )
	if not isSelectedColorEmpty then
		local colorNum = CoD.GetEditorProperties( controller, "colorNum" )
		Engine.ExecNow( controller, "emblemLayerUpdateOpacity " .. colorNum .. " " .. step )
		CoD.SetNoColorDataModel( controller )
		local gradientSlider = EmblemChooseColor_GetGradientSliderElement( self, controller )
		EmblemGradient_UpdateGradientFillByStep( gradientSlider, gradientSlider, 0, controller )
	end
end

function EmblemChooseColor_SetOpacity( self, element, colorNum, opacity, controller )
	local isColorEmpty = false
	if colorNum == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 then
		isColorEmpty = CoD.GetEditorProperties( controller, "isColor0NoColor" ) == 1
	elseif colorNum == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
		isColorEmpty = CoD.GetEditorProperties( controller, "isColor1NoColor" ) == 1
	end
	if not isColorEmpty then
		Engine.ExecNow( controller, "emblemLayerSetOpacity " .. colorNum .. " " .. opacity )
		CoD.SetNoColorDataModel( controller )
		local gradientSlider = EmblemChooseColor_GetGradientSliderElement( self, controller )
		EmblemGradient_UpdateGradientFillByStep( gradientSlider, gradientSlider, 0, controller )
	end
end

function EmblemChooseColor_UpdateBothColorOpacity( self, element, step, controller )
	local max_opacity = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemSelectedLayerProperties.max_opacity" ) ) + step
	if max_opacity <= 100 then
		Engine.ExecNow( controller, "emblemLayerUpdateOpacity " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_NONE .. " " .. step )
	end
end

function EmblemGradient_Color0GainFocus( self, element, controller )
	local colorMode = CoD.GetEditorProperties( controller, "colorMode" )
	if colorMode == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE then
		CoD.SetEditorProperties( controller, Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0, "colorNum" )
	end
end

function EmblemGradient_Color1GainFocus( self, element, controller )
	local colorMode = CoD.GetEditorProperties( controller, "colorMode" )
	if colorMode == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE then
		CoD.SetEditorProperties( controller, Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1, "colorNum" )
	end
end

function EmblemGradient_ColorGradientSliderGainFocus( self, element, controller )
	local colorMode = CoD.GetEditorProperties( controller, "colorMode" )
	if colorMode == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE then
		CoD.SetEditorProperties( controller, Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_GRADIENT, "colorNum" )
	end
end

function EmblemGradient_ShowSwatchContainer( self, element, controller )
	local isColor0NoColor = CoD.GetEditorProperties( controller, "isColor0NoColor" )
	local isColor1NoColor = CoD.GetEditorProperties( controller, "isColor1NoColor" )
	local colorNum = CoD.GetEditorProperties( controller, "colorNum" )
	if self.colorGradientContainer.gradientColor0:isInFocus() then
		self.colorGradientContainer:setState( "Color0State" )
	elseif self.colorGradientContainer.gradientColor1:isInFocus() then
		self.colorGradientContainer:setState( "Color1State" )
	end
	CoD.SetEditorProperties( controller, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, "colorMode" )
	EmblemGradient_SetupSwatchLastSavedColor( self, element, controller )
	CoD.SwapFocusableElements( controller, self.colorGradientContainer, self.colorGradientSwatchContainer )
	if isColor0NoColor == 1 and colorNum == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 then
		CoD.SwapFocusableElements( controller, self.colorGradientSwatchContainer.lastSavedColor, self.colorGradientSwatchContainer.noColor )
		self.colorGradientSwatchContainer.lastSavedColor.m_focusable = true
	elseif isColor1NoColor == 1 and colorNum == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
		CoD.SwapFocusableElements( controller, self.colorGradientSwatchContainer.lastSavedColor, self.colorGradientSwatchContainer.noColor )
		self.colorGradientSwatchContainer.lastSavedColor.m_focusable = true
	end
	self.colorGradientContainer:hide()
	self.colorGradientSwatchContainer:show()
end

function EmblemGradient_BackFromColorPicker( self, element, controller )
	EmblemChooseColor_SetupSelectedLayerColorModel( controller )
	if self.colorGradientSwatchContainer.m_focusable then
		CoD.SwapFocusableElements( controller, self.colorGradientSwatchContainer, self.colorGradientContainer )
		self.colorGradientContainer:show()
		self.colorGradientSwatchContainer:hide()
	elseif self.colorGradientMixerContainer.m_focusable then
		CoD.SwapFocusableElements( controller, self.colorGradientMixerContainer, self.colorGradientContainer )
		self.colorGradientContainer:show()
		self.colorGradientMixerContainer:hide()
	end
	CoD.SetEditorProperties( controller, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE, "colorMode" )
	local colorNum = CoD.GetEditorProperties( controller, "colorNum" )
	self.colorGradientContainer:setState( "DefaultState" )
	if colorNum == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
		CoD.SwapFocusableElements( controller, self.colorGradientContainer.gradientColor0, self.colorGradientContainer.gradientColor1 )
		self.colorGradientContainer.gradientColor0.m_focusable = true
	end
	local gradientSlider = EmblemChooseColor_GetGradientSliderElement( self, controller )
	EmblemGradient_UpdateGradientFillByStep( gradientSlider, gradientSlider, 0, controller )
end

function EmblemGradient_UpdateAngleByStep( self, element, angleStep, controller )
	Engine.ExecNow( controller, "emblemUpdateGradientAngle " .. angleStep )
end

function EmblemGradient_SetAngle( self, element, angle, controller )
	Engine.ExecNow( controller, "emblemSetGradientAngle " .. angle )
end

function EmblemGradient_ToggleGradientType( self, element, controller )
	Engine.ExecNow( controller, "emblemToggleGradientType" )
end

function EmblemGradient_UpdateGradientFillByStep( self, element, step, controller )
	Engine.ExecNow( controller, "emblemUpdateGradientFill " .. step )
	EmblemGradient_UpdateGradientVisuals( controller, element )
end

function EmblemGradient_SetGradientFill( self, element, value, controller )
	Engine.ExecNow( controller, "emblemSetGradientFill " .. value )
	EmblemGradient_UpdateGradientVisuals( controller, element )
end

function EmblemGradient_BackFromGradientPicker( self, element, controller )
	local isColor0NoColor = CoD.GetEditorProperties( controller, "isColor0NoColor" )
	local isColor1NoColor = CoD.GetEditorProperties( controller, "isColor1NoColor" )
	if isColor0NoColor == 1 and isColor1NoColor == 1 then
		Engine.ExecNow( controller, "emblemSetLayerColor " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_NONE .. " 1 1 1" )
	end
end

function EmblemSelect_TabChanged( self, element, controller )
	CoD.CraftUtility.Emblems.CachedEmblems = {}
	CoD.perController[controller].selectedEmblemTabStorageType = element.storageType
	CoD.CraftUtility.Emblems.ParseDDL( controller, CoD.perController[controller].selectedEmblemTabStorageType )
	self.emblemList:updateDataSource()
	local firstFocusable = self.emblemList:getFirstSelectableItem()
	self.emblemList:setActiveItem( firstFocusable )
	ForceNotifyModel( controller, "Emblem.UpdateDataSource" )
end

function UpdateSlotCountText( self, element, controller, enumValue )
	local usedSlots = CoD.CraftUtility.GetUsedSlotsByFileType( controller, enumValue )
	local allowedSlots = CoD.CraftUtility.GetTotalAllowedSlotsByFileType( controller, enumValue )
	return element:setText( Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION", usedSlots, allowedSlots ) )
end

function UploadPublicProfile( self, controller )
	if CoD.perController[controller].uploadProfile == true then
		CoD.perController[controller].uploadProfile = false
		Engine.ExecNow( controller, "uploadprofile" )
	end
end

function BlackMarketSetAsEmblem( self, element, controller )
	CoD.perController[controller].selectedEmblemModel = element:getModel()
	local emblemIndexModel = element:getModel( controller, "emblem" )
	local emblemIndex = Engine.GetModelValue( emblemIndexModel )
	local controller, emblemId, storageFileType = CoD.BlackMarketUtility.GetLootEmblemIndexParams( controller, emblemIndex )
	Engine.SetupEmblemData( controller, emblemId, storageFileType )
	if IsLive() then
		Engine.ExecNow( controller, "emblemsetprofile" )
		CoD.perController[controller].uploadProfile = true
	else
		Engine.SetProfileVar( controller, "default_emblem_index", emblemId )
		Engine.ExecNow( controller, "invalidateEmblemComponent" )
	end
	ForceNotifyControllerModel( controller, "identityBadge.xuid" )
end

function BlackMarketSetCallingCard( self, element, controller )
	local imageModel = Engine.GetModel( element:getModel(), "image" )
	if imageModel ~= nil then
		local imageName = Engine.GetModelValue( imageModel )
		local backgroundId = CoD.BlackMarketUtility.GetLootCallingCardIndex( controller, imageName )
		if not backgroundId then
			return 
		end
		SetEmblemBackground_Internal( controller, backgroundId )
	end
	ForceNotifyControllerModel( controller, "identityBadge.xuid" )
end

function BlackMarketSetTaunt( self, element, controller )
	local blackMarketItem = CoD.SafeGetModelValue( element:getModel(), "emblem" )
	if blackMarketItem then
		local tauntId = blackMarketItem
		local heroName, heroIndex = CoD.PlayerRoleUtility.GetHeroDisplayNameAndIndexForTaunt( Enum.eModes.MODE_MULTIPLAYER, tauntId )
		local tauntType, tauntIndex = CoD.PlayerRoleUtility.GetTypeIndexAndIndexForTaunt( Enum.eModes.MODE_MULTIPLAYER, tauntId, tauntId )
		if tauntIndex then
			Engine.SelectTaunt( controller, Enum.eModes.MODE_MULTIPLAYER, heroIndex, tauntType, tauntIndex )
			local description = CoD.BlackMarketUtility.GetItemTypeStringForLootItem( blackMarketItem, "taunt" )
			local image = CoD.BlackMarketUtility.GetImageForLootItem( blackMarketItem, "taunt" )
			CoD.OverlayUtility.ShowToast( "BlackMarketEquipped", Engine.Localize( "MPUI_EQUIPPED_CAPS" ), description, image )
		end
	end
end

function BlackMarketSetGesture( self, element, controller )
	local blackMarketItem = CoD.SafeGetModelValue( element:getModel(), "emblem" )
	if blackMarketItem then
		local gestureId, heroAsset = CoD.BlackMarketUtility.SplitIdIntoTwoValues( blackMarketItem )
		local heroName, heroIndex = CoD.PlayerRoleUtility.GetHeroDisplayNameAndIndex( Enum.eModes.MODE_MULTIPLAYER, heroAsset )
		local gestureType, gestureIndex = CoD.PlayerRoleUtility.GetTypeIndexAndIndexForGesture( Enum.eModes.MODE_MULTIPLAYER, heroAsset, gestureId )
		if gestureIndex then
			Engine.SelectGesture( controller, Enum.eModes.MODE_MULTIPLAYER, heroIndex, gestureType, gestureIndex )
			local description = CoD.BlackMarketUtility.GetItemTypeStringForLootItem( blackMarketItem, "gesture" )
			local image = CoD.BlackMarketUtility.GetImageForLootItem( blackMarketItem, "gesture" )
			CoD.OverlayUtility.ShowToast( "BlackMarketEquipped", Engine.Localize( "MPUI_EQUIPPED_CAPS" ), description, image )
		end
	end
end

function BlackMarketSetSpecialistTheme( self, element, controller )
	local blackMarketItem = CoD.SafeGetModelValue( element:getModel(), "emblem" )
	if blackMarketItem then
		local themeId, heroAsset = CoD.BlackMarketUtility.SplitIdIntoTwoValues( blackMarketItem )
		local heroName, heroIndex = CoD.PlayerRoleUtility.GetHeroDisplayNameAndIndex( Enum.eModes.MODE_MULTIPLAYER, heroAsset )
		local characterItemType = CoD.BlackMarketUtility.GetSpecialistThemeType( themeId )
		local itemIndex = CoD.BlackMarketUtility.GetSpecialistOutfitIndexForId( themeId, heroAsset )
		if itemIndex then
			Engine.SetHeroItem( controller, Enum.eModes.MODE_MULTIPLAYER, heroIndex, characterItemType, itemIndex )
			local description = CoD.BlackMarketUtility.GetItemTypeStringForLootItem( blackMarketItem, "specialist_outfit" )
			local image = CoD.BlackMarketUtility.GetImageForLootItem( blackMarketItem, "specialist_outfit" )
			CoD.OverlayUtility.ShowToast( "BlackMarketEquipped", Engine.Localize( "MPUI_EQUIPPED_CAPS" ), description, image )
		end
	end
end

function BlackMarketResultsOnClose( self, element, controller )
	if not IsLive() then
		Engine.CommitProfileChanges( controller )
	else
		UploadPublicProfile( self, controller )
	end
	CoD.perController[controller].selectedEmblemModel = nil
end

function CommitProfileChanges( controller )
	Engine.CommitProfileChanges( controller )
end

function EmblemSelect_Back( self, element, controller )
	if not IsLive() then
		Engine.CommitProfileChanges( controller )
	else
		UploadPublicProfile( self, controller )
	end
	CoD.perController[controller].selectedEmblemModel = nil
	CoD.CraftUtility.Emblems.CachedEmblems = {}
	ClearSavedState( self, controller )
end

function EmblemSelect_SetAsEmblem( self, element, controller )
	if IsLive() then
		if SelectingGroupEmblem( controller ) then
			if SelectingGroupEmblemForGroupCreation( controller ) then
				Engine.SetGroupEmblemForGroupCreation( controller )
				GoBack( self, controller )
				return 
			end
			Engine.SetGroupEmblem( controller )
			OpenGenericSmallPopup( self, controller, "GROUPS_EMBLEM_SET_CAPS", "GROUPS_EMBLEM_SET_MESSAGE", nil, "MENU_OK", nil, nil )
		else
			Engine.ExecNow( controller, "emblemsetprofile" )
			CoD.perController[controller].uploadProfile = true
		end
	else
		local emblemIndexModel = element:getModel( controller, "emblemIndex" )
		local emblemIndex = Engine.GetModelValue( emblemIndexModel )
		Engine.SetProfileVar( controller, "default_emblem_index", emblemIndex )
		Engine.ExecNow( controller, "invalidateEmblemComponent" )
	end
end

function EmblemSelect_GainFocus( self, element, controller )
	CoD.perController[controller].selectedEmblemModel = element:getModel()
	local emblemIndexModel = element:getModel( controller, "emblemIndex" )
	local emblemIndex = Engine.GetModelValue( emblemIndexModel )
	Engine.SetupEmblemData( controller, emblemIndex, CoD.perController[controller].selectedEmblemTabStorageType )
end

function EmblemSelect_ChooseEmblem( self, element, controller )
	CoD.perController[controller].totalLayers = Enum.CustomizationTypeLayerCount.CUSTOMIZATION_TYPE_EMBLEM_MAX_LAYERS
	CoD.perController[controller].totalGroups = Enum.CustomizationTypeGroupCount.CUSTOMIZATION_TYPE_MAX_GROUPS
	CoD.SetEditorProperties( controller, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE, "editorMode" )
	local customizationType = Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM
	CoD.SetCustomization( controller, customizationType, "type" )
	Engine.SetupEmblemEditBuffer( controller, customizationType, 0 )
end

function EmblemSelect_RenameEmblem( self, element, controller )
	local emblemModel = self:getModel()
	local emblemIndex = Engine.GetModelValue( Engine.GetModel( emblemModel, "emblemIndex" ) )
	local emblemName = Engine.GetModelValue( Engine.GetModel( emblemModel, "emblemName" ) )
	CoD.CraftUtility.Emblems.RenameEmblem( controller, emblemIndex, emblemName )
end

function EmblemSelect_HandleRenameKeyboardComplete( self, element, controller, event )
	local selectedEmblemModel = self:getModel()
	local emblemNameModel = nil
	if not selectedEmblemModel then
		return 
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_EMBLEMS then
		emblemNameModel = Engine.GetModel( selectedEmblemModel, "emblemName" )
	end
	if emblemNameModel then
		Engine.SetModelValue( emblemNameModel, event.input )
	end
end

function EmblemSelect_ClearEmblem( self, element, controller )
	local selectedEmblemModel = CoD.perController[controller].selectedEmblemModel
	local emblemIndex = Engine.GetModelValue( Engine.GetModel( selectedEmblemModel, "emblemIndex" ) )
	CoD.CraftUtility.Emblems.ClearEmblem( controller, emblemIndex )
	Engine.UploadEmblemData( controller, emblemIndex )
	CoD.CraftUtility.Emblems.ParseDDL( controller, Enum.StorageFileType.STORAGE_EMBLEMS )
	local emblemSelectMenu = nil
	if IsMediaManager() == true then
		emblemSelectMenu = GoBackMultiple( self, controller, 1 )
		MediaManagerMarkDirty( controller )
	else
		emblemSelectMenu = GoBackMultiple( self, controller, 2 )
	end
	if emblemSelectMenu.emblemList ~= nil then
		emblemSelectMenu.emblemList:updateDataSource( true )
		local firstFocusable = emblemSelectMenu.emblemList:getFirstSelectableItem()
		emblemSelectMenu.emblemList:setActiveItem( firstFocusable )
		ForceNotifyModel( controller, "Emblem.UpdateDataSource" )
	end
end

function EmblemSelect_CopyEmblem( self, element, controller, param, menu )
	local selectedEmblemModel = menu:getModel()
	local destEmblemIndex = CoD.CraftUtility.Emblems.Copy( controller, selectedEmblemModel, CoD.perController[controller].selectedEmblemTabStorageType )
	if destEmblemIndex then
		CoD.CraftUtility.Emblems.ParseDDL( controller, Enum.StorageFileType.STORAGE_EMBLEMS )
		local emblemSelectMenu = GoBack( menu, controller )
		emblemSelectMenu.emblemList:updateDataSource( true )
		local copiedIntoElement = emblemSelectMenu.emblemList:findItem( {
			emblemIndex = destEmblemIndex
		} )
		if copiedIntoElement then
			emblemSelectMenu.emblemList:setActiveItem( copiedIntoElement )
		end
		ForceNotifyModel( controller, "Emblem.UpdateDataSource" )
	end
end

function PaintshopWeaponList_TabChanged( self, element, controller )
	DataSources.CraftWeaponList.setCurrentFilterItem( element.filter )
	self.weaponList:updateDataSource( true )
	local firstFocusable = self.weaponList:getFirstSelectableItem()
	self.weaponList:setActiveItem( firstFocusable )
	local category_index = self.tabList.Tabs.grid.activeWidget.gridInfoTable.zeroBasedIndex + 1
	CoD.SetCustomization( controller, category_index, "category_index" )
end

function PaintshopWeaponList_Back( self, element, controller )
	CoD.perController[controller].selectedpaintjobModel = nil
	CoD.perController[controller].paintshopWeaponListIndex = nil
	CoD.CraftUtility.Paintjobs.CachedPaintjobs = {}
end

function PaintshopWeaponList_GainFocus( self, element, controller )
	local weaponIndex = Engine.GetModelValue( element:getModel( controller, "itemIndex" ) )
	CoD.SetCustomization( controller, weaponIndex, "weapon_index" )
	local category_index = self.tabList.Tabs.grid.activeWidget.gridInfoTable.zeroBasedIndex + 1
	CoD.SetCustomization( controller, category_index, "category_index" )
	CoD.CraftUtility.Gunsmith.DisplayBaseWeapon( self, element, controller )
end

function PaintshopWeaponList_PressBackOnPaintjobsSelector( self, element, controller )
	CoD.CraftUtility.Gunsmith.DisplayBaseWeapon( self, element, controller )
	self:updateMode( Enum.PaintshopMode.PAINTSHOPMODE_WEAPONLIST, element )
	local firstFocusable = self.paintjobSelector.paintjobsList:getFirstSelectableItem()
	self.paintjobSelector.paintjobsList:setActiveItem( firstFocusable )
end

function PaintshopWeaponList_ChooseWeapon( self, element, controller )
	self:updateMode( Enum.PaintshopMode.PAINTSHOPMODE_PAINTJOBS, element )
	CoD.perController[controller].paintshopWeaponListIndex = self.weaponList.activeWidget.gridInfoTable.zeroBasedIndex + 1
	self.paintjobSelector.paintjobsList:updateDataSource( true )
	local firstFocusable = self.paintjobSelector.paintjobsList:getFirstSelectableItem()
	self.paintjobSelector.paintjobsList:setActiveItem( firstFocusable )
end

function FeaturedCardsActionButtonHandler( self, element, controller, param, menu )
	local menu = self:getParentMenu()
	local card = nil
	local action = ""
	if FeaturedCards_IsEnabled( element, controller ) == false then
		return 
	elseif self.LeftContainer.FEFeaturedCardsContainer.CardsList.activeWidget ~= nil then
		action = CoD.SafeGetModelValue( self.LeftContainer.FEFeaturedCardsContainer.CardsList.activeWidget:getModel(), "action" )
	end
	if action == "openwelcome" then
		OpenOverlay( menu, "WelcomeMenu", controller )
	elseif action == "store" then
		CoD.MetricsUtility.CRMMessageInteraction( self, controller, "crm_featured" )
		if CoD.isPC then
			OpenSteamStore( self, element, controller, "FeaturedWidget", menu )
		else
			OpenStore( self, element, controller, "FeaturedWidget", menu )
		end
	elseif action == "opengroups" then
		OpenGroups( self, element, controller, param, menu )
	elseif action == "opencrm" then
		CoD.MetricsUtility.CRMMessageInteraction( self, controller, "crm_featured" )
		OpenCRMFeaturedPopup( self, element, controller, "Featured", menu )
	elseif action == "openmotd" then
		OpenMOTDPopup( self, element, controller, "FeaturedWidget", menu )
	elseif action == "liveevent" then
		OpenPopup( menu, "LiveEventViewer", controller )
	elseif action == "blackmarket" then
		CoD.MetricsUtility.CRMMessageInteraction( self, controller, "crm_featured" )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "blackmarketOpenSource" ), Engine.GetCurrentMode() )
		Engine.SwitchMode( controller, "mp" )
		OpenBlackMarket( self, nil, controller )
	elseif action == "drmonty" then
		CoD.MetricsUtility.CRMMessageInteraction( self, controller, "crm_featured" )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "megachewOpenSource" ), Engine.GetCurrentMode() )
		Engine.SwitchMode( controller, "zm" )
		OpenMegaChewFactorymenu( self, element, controller, param, menu )
	end
end

function FeaturedCardsResetTimer( self, element, controller, param, menu )
	if self.LeftContainer.FEFeaturedCardsContainer.CarouselTimer ~= nil then
		self.LeftContainer.FEFeaturedCardsContainer.CarouselTimer:reset()
	end
end

function FeaturedCardsGetNextCard( self, element, controller, param, menu )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "FeaturedCardsRoot", false )
	local cardSequence = Engine.GetModelValue( Engine.GetModel( rootModel, "CardSequence" ) )
	Engine.SetModelValue( Engine.GetModel( rootModel, "CardSequence" ), cardSequence + 1 )
end

function FeaturedCardsGetPreviousCard( self, element, controller, param, menu )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "FeaturedCardsRoot", false )
	local cardSequence = Engine.GetModelValue( Engine.GetModel( rootModel, "CardSequence" ) )
	Engine.SetModelValue( Engine.GetModel( rootModel, "CardSequence" ), cardSequence - 1 )
end

function FeaturedCardsUpdateCRMMessage( self, element, controller, param, menu )
	Engine.UpdateFeaturedCardsCRMMessage( controller )
end

function OpenPopularShowcase( self, element, controller, param, menu )
	menu:openOverlay( "MyShowcase", controller )
end

function FileshareGetSlots( self, element, controller )
	Engine.FileshareStartup( controller )
end

function OpenMyShowcase( self, element, controller, param, menu )
	local params = {
		xuid = Engine.GetXUID64( controller )
	}
	Engine.ExecNow( controller, "fileshareResetSummaryFiles" )
	OpenPlayerShowcase( self, element, controller, params, menu )
end

function OpenShowcase( self, element, controller, param, menu )
	local category = CoD.FileshareUtility.GetCurrentCategory()
	local fileId = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	FileshareSetShowcasePublishMode( controller, false )
	if category == "paintjob" then
		OpenShowcasePaintjobs( self, element, controller, fileId, menu )
	elseif category == "variant" then
		OpenShowcaseVariants( self, element, controller, fileId, menu )
	elseif category == "emblem" then
		OpenShowcaseEmblems( self, element, controller, fileId, menu )
	elseif category == "customgame" then
		OpenShowcaseCustomGames( self, element, controller, fileId, menu )
	elseif category == "screenshot" then
		OpenShowcaseScreenshots( self, element, controller, fileId, menu )
	elseif category == "recentgames" then
		OpenShowcaseRecentGames( self, element, controller, fileId, menu )
	elseif category == "clip_private" then
		OpenShowcaseLocalClips( self, element, controller, fileId, menu )
	elseif category == "clip" then
		OpenShowcaseClips( self, element, controller, fileId, menu )
	end
end

function OpenPlayerShowcaseOnParent( self, element, controller, params, menu )
	CoD.FileshareUtility.SetCurrentUser( params.xuid )
	CoD.FileshareUtility.SetFileshareMode( controller, Enum.FileshareMode.FILESHARE_MODE_USER )
	FileshareSetShowcasePublishMode( controller, false )
	GoBackAndOpenOverlayOnParent( self, "MyShowcase", controller )
end

function OpenPlayerShowcase( self, element, controller, params, menu )
	CoD.FileshareUtility.InitModels()
	CoD.FileshareUtility.SetCurrentUser( params.xuid )
	CoD.FileshareUtility.SetFileshareMode( controller, Enum.FileshareMode.FILESHARE_MODE_USER )
	FileshareSetShowcasePublishMode( controller, false )
	OpenOverlay( self, "MyShowcase", controller )
end

function OpenShowcasePaintjobs( self, element, controller, param, menu )
	CoD.FileshareUtility.SetPreviousCategory( "paintjob" )
	CoD.FileshareUtility.SetCurrentCategory( "paintjob" )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	local showCreateButton = false
	if FileshareIsCurrentUserContext( controller ) then
		showCreateButton = true
	end
	CoD.FileshareUtility.SetShowCreateButton( showCreateButton )
	OpenOverlay( self, "MyShowcase_Paintjobs", controller )
end

function OpenShowcaseVariants( self, element, controller, param, menu )
	CoD.FileshareUtility.SetPreviousCategory( "variant" )
	CoD.FileshareUtility.SetCurrentCategory( "variant" )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	local showCreateButton = false
	if FileshareIsCurrentUserContext( controller ) then
		showCreateButton = true
	end
	CoD.FileshareUtility.SetShowCreateButton( showCreateButton )
	OpenOverlay( self, "MyShowcase_Variants", controller )
end

function OpenShowcaseEmblems( self, element, controller, param, menu )
	CoD.FileshareUtility.SetPreviousCategory( "emblem" )
	CoD.FileshareUtility.SetCurrentCategory( "emblem" )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	local showCreateButton = false
	if FileshareIsCurrentUserContext( controller ) then
		showCreateButton = true
	end
	CoD.FileshareUtility.SetShowCreateButton( showCreateButton )
	OpenOverlay( self, "MyShowcase_Emblems", controller )
end

function OpenShowcaseCustomGames( self, element, controller, param, menu )
	CoD.FileshareUtility.SetPreviousCategory( "customgame" )
	CoD.FileshareUtility.SetCurrentCategory( "customgame" )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	local showCreateButton = false
	if FileshareIsCurrentUserContext( controller ) and CoD.FileshareUtility.GetIsCommunityMode( controller ) == false then
		showCreateButton = true
	end
	CoD.FileshareUtility.SetShowCreateButton( showCreateButton )
	OpenOverlay( self, "MyShowcase_CustomGames", controller )
end

function OpenShowcaseScreenshots( self, element, controller, param, menu )
	CoD.FileshareUtility.SetPreviousCategory( "screenshot" )
	CoD.FileshareUtility.SetCurrentCategory( "screenshot" )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	local showCreateButton = false
	if FileshareIsCurrentUserContext( controller ) then
		showCreateButton = true
	end
	CoD.FileshareUtility.SetShowCreateButton( showCreateButton )
	OpenOverlay( self, "MyShowcase_Screenshots", controller )
end

function OpenShowcaseRecentGames( self, element, controller, param, menu )
	CoD.FileshareUtility.SetPreviousCategory( "recentgames" )
	CoD.FileshareUtility.SetCurrentCategory( "recentgames" )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	local showCreateButton = false
	if FileshareIsCurrentUserContext( controller ) then
		showCreateButton = true
	end
	CoD.FileshareUtility.SetShowCreateButton( false )
	OpenOverlay( menu, "MyShowcase_RecentGames", controller )
end

function OpenShowcaseClips( self, element, controller, param, menu )
	CoD.FileshareUtility.SetPreviousCategory( "clip" )
	CoD.FileshareUtility.SetCurrentCategory( "clip" )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	local showCreateButton = false
	if FileshareIsCurrentUserContext( controller ) then
		showCreateButton = true
	end
	CoD.FileshareUtility.SetShowCreateButton( showCreateButton )
	PreserveThumbnails( controller, true )
	OpenOverlay( menu, "MyShowcase_Clips", controller )
	PreserveThumbnails( controller, false )
end

function OpenShowcaseLocalClips( self, element, controller, param, menu )
	CoD.FileshareUtility.SetPreviousCategory( "clip_private" )
	CoD.FileshareUtility.SetCurrentCategory( "clip_private" )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	local showCreateButton = false
	if FileshareIsCurrentUserContext( controller ) then
		showCreateButton = true
	end
	CoD.FileshareUtility.SetShowCreateButton( false )
	PreserveThumbnails( controller, true )
	OpenOverlay( menu, "MyShowcase_Clips", controller )
	PreserveThumbnails( controller, false )
end

function PublishClip( controller )
	local fileId = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	local publishName = CoD.FileshareUtility.GetPublishName()
	local publishDescription = CoD.FileshareUtility.GetPublishDescription()
	local isCommunity = CoD.FileshareUtility.GetIsCommunityMode( controller )
	if Engine.SetupTransferData( controller, "clip_private", fileId, isCommunity ) then
		Engine.PublishClip( controller, "clip", fileId, publishName, publishDescription )
		
	else
		local publishTaskStateModel = Engine.GetModel( CoD.FileshareUtility.GetPublishingModel() )
		Engine.SetModelValue( publishTaskStateModel, Enum.FileshareTaskUIState.FILESHARE_TASK_UI_ERROR )
	end
end

function OpenLocalClipPublishPrompt( self, element, controller, param, menu )
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
	local info = Engine.LobbyGetDemoInformation( Enum.LobbyModule.LOBBY_MODULE_CLIENT, lobbyType )
	if info.fileID ~= CoD.FileshareUtility.GetSelectedItemProperty( "fileId" ) then
		LuaUtils.UI_ShowErrorMessageDialog( controller, "MENU_FILESHARE_PUBLISH_ONLY_AFTER_DOWNLOADING" )
		return 
	else
		local fileName = CoD.FileshareUtility.GetSelectedItemProperty( "fileName" )
		local fileDescription = CoD.FileshareUtility.GetSelectedItemProperty( "fileDescription" )
		CoD.FileshareUtility.OpenPublishPrompt( self, controller, "clip", fileName, fileDescription, PublishClip )
	end
end

function OpenShowcaseManager( self, element, controller, param, menu )
	local currentCategory = CoD.FileshareUtility.GetCurrentCategory()
	CoD.FileshareUtility.SetPreviousCategory( currentCategory )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	CoD.FileshareUtility.SetShowCreateButton( FileshareCanBuyMoreSlots( controller ) )
	OpenOverlay( self, "Fileshare_ShowcaseManager", controller )
end

function OpenLocalScreenshots( menu, controller )
	local category = "screenshot_private"
	CoD.FileshareUtility.SetCurrentCategory( category )
	local previousCategory = CoD.FileshareUtility.GetPreviousCategory()
	if previousCategory ~= category then
		CoD.FileshareUtility.SetDirty()
	end
	CoD.FileshareUtility.ProcessUIIndex( controller, category, 0 )
	local playerXUID = Engine.GetXUID64( controller )
	Engine.ExecNow( controller, "fileshareResetSummaryFiles" )
	CoD.FileshareUtility.SetCurrentUser( playerXUID )
	CoD.FileshareUtility.SetFileshareMode( controller, Enum.FileshareMode.FILESHARE_MODE_USER )
	CoD.FileshareUtility.FetchContentForUser( controller, playerXUID )
	FileshareSetShowcasePublishMode( controller, false )
	CoD.FileshareUtility.SetPreviousCategory( category )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	CoD.FileshareUtility.SetShowCreateButton( false )
	CoD.FileshareUtility.SetShowFileDetails( false )
	CoD.FileshareUtility.SetShowPublishNewDetails( false )
	CoD.FileshareUtility.SetShowCreateButton( false )
	OpenOverlay( menu, "LocalScreenshots", controller )
end

function PublishScreenshot( controller )
	local fileId = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	local publishName = CoD.FileshareUtility.GetPublishName()
	local publishDescription = CoD.FileshareUtility.GetPublishDescription()
	local isCommunity = CoD.FileshareUtility.GetIsCommunityMode( controller )
	if Engine.SetupTransferData( controller, "screenshot_private", fileId, isCommunity ) then
		Engine.PublishScreenshot( controller, "screenshot", fileId, publishName, publishDescription )
		
	else
		local publishTaskStateModel = Engine.GetModel( CoD.FileshareUtility.GetPublishingModel() )
		Engine.SetModelValue( publishTaskStateModel, Enum.FileshareTaskUIState.FILESHARE_TASK_UI_ERROR )
	end
end

function OpenLocalScreenshotsPublishPrompt( self, element, controller, param, menu )
	local fileID = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	if Engine.IsScreenshotReady( Enum.ScreenshotViewType.UI_SCREENSHOT_TYPE_SCREENSHOT, fileID ) == false or Engine.IsScreenshotReady( Enum.ScreenshotViewType.UI_SCREENSHOT_TYPE_THUMBNAIL, fileID ) == false then
		LuaUtils.UI_ShowErrorMessageDialog( controller, "MENU_UPLOAD_FAIL_DUE_TO_SCREENSHOT_DOWNLOAD" )
		return 
	else
		local fileName = CoD.FileshareUtility.GetSelectedItemProperty( "fileName" )
		local fileDescription = CoD.FileshareUtility.GetSelectedItemProperty( "fileDescription" )
		CoD.FileshareUtility.OpenPublishPrompt( self, controller, "screenshot", fileName, fileDescription, PublishScreenshot )
	end
end

function FileshareCloseShowcaseManager( self, element, controller )
	CoD.FileshareUtility.SetInShowcaseManager( controller, false )
end

function FileshareOpenPublishMenu( self, element, controller, param, menu )
	local category = CoD.FileshareUtility.GetCurrentCategory()
	if category == "paintjob" then
		OpenPaintshop( self, element, controller, param, menu )
	elseif category == "variant" then
		OpenGunsmith( self, element, controller, param, menu )
	elseif category == "emblem" then
		OpenEmblemSelect( self, element, controller, CoD.FileshareUtility.GetLocalStorageType( category ), menu )
	end
end

function OpenMediaManagerSlotsFull( self, element, controller, param, menu )
	if param == nil or param == "" then
		param = "paintjob"
	end
	CoD.FileshareUtility.SetCurrentCategory( param )
	OpenPopup( self, "MediaManagerSlotsFull", controller )
end

function OpenMediaCommunity( self, element, controller, param, menu, enumValue )
	CoD.FileshareUtility.InitModels()
	CoD.FileshareUtility.SetCurrentCommunityDataType( enumValue )
	CoD.FileshareUtility.SetFileshareMode( controller, Enum.FileshareMode.FILESHARE_MODE_COMMUNITY )
	OpenOverlay( self, "Community", controller )
end

function FilesharePublishedTabChanged( self, element, controller )
	if element.fileshareCategory ~= nil then
		CoD.FileshareUtility.SetCurrentCategory( element.fileshareCategory )
	else
		CoD.FileshareUtility.SetCurrentCategory( "" )
	end
	if element.fileshareKey ~= nil and element.fileshareVal ~= nil then
		CoD.FileshareUtility.SetCurrentFilter( element.fileshareKey, element.fileshareVal )
	else
		CoD.FileshareUtility.SetCurrentFilter( "", "" )
	end
	CoD.FileshareUtility.SetShowFileDetails( false )
	CoD.FileshareUtility.SetDirty()
end

function FileshareShowcaseManagerTabChanged( self, element, controller )
	if element.fileshareCategory ~= nil then
		CoD.FileshareUtility.SetCurrentCategory( element.fileshareCategory )
	else
		CoD.FileshareUtility.SetCurrentCategory( "" )
	end
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	CoD.FileshareUtility.SetShowFileDetails( false )
	CoD.FileshareUtility.SetShowPublishNewDetails( false )
	CoD.FileshareUtility.SetDirty()
end

function FileshareSetSelectedItemAttachTimer( element, controller, category, uiIndex )
	local timer = LUI.UITimer.newElementTimer( 300, true, function ()
		CoD.FileshareUtility.ProcessUIIndex( controller, category, uiIndex )
	end, element )
	element.processUIIndexTimer = timer
	element:addElement( timer )
end

function FileshareItemLoseFocus( element )
	if element.processUIIndexTimer then
		element.processUIIndexTimer:close()
		element.processUIIndexTimer = nil
	end
end

function FileshareSetSelectedItem( self, element, controller, param )
	local elementModel = element:getModel()
	if elementModel == nil then
		CoD.CraftUtility.Fileshare.ClearDisplay( controller )
		return 
	end
	CoD.FileshareUtility.SetSelectedItem( elementModel )
	local fileId = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	local isPublishNew = CoD.FileshareUtility.GetSelectedItemProperty( "isPublishNew" )
	local category = CoD.FileshareUtility.GetCurrentCategory()
	local f785_local0 = param == "true"
	if isPublishNew == true or fileId == 0 then
		CoD.FileshareUtility.SetShowPublishNewDetails( true )
		CoD.CraftUtility.Fileshare.ClearDisplay( controller )
		return 
	elseif element.gridInfoTable then
		FileshareSetSelectedItemAttachTimer( element, controller, category, element.gridInfoTable.zeroBasedIndex )
	end
	local weaponIndex = Engine.GetFileshareWeaponIndex( controller, fileId )
	if category == "paintjob" then
		CoD.CraftUtility.Fileshare.DisplayWeaponWithPaintjob( controller, weaponIndex, fileId, f785_local0 )
	elseif category == "variant" then
		CoD.CraftUtility.Fileshare.DisplayWeaponVariants( controller, weaponIndex, fileId, f785_local0 )
	end
	if CoD.FileshareUtility.ShouldSetPreviewIconSizeShort( category ) then
		FileshareSetPreviewIconSizeShort()
	else
		FileshareSetPreviewIconSizeNormal()
	end
end

function FileshareShowcasePublishSetSelectedItem( self, element, controller )
	if CoD.FileshareUtility.GetInShowcaseManager() then
		return 
	end
	local category = CoD.FileshareUtility.GetCurrentCategory()
	if category == "paintjob" then
		CoD.perController[controller].selectedpaintjobModel = element:getModel()
		CoD.perController[controller].viewIndex = 1
		CoD.CraftUtility.Fileshare.DisplayWeaponWithPaintjobUsingModel( controller, element:getModel() )
	elseif category == "variant" then
		CoD.perController[controller].gunsmithVariantModel = element:getModel()
		CoD.CraftUtility.Fileshare.DisplayWeaponWithVariant( controller, CoD.perController[controller].gunsmithVariantModel )
	elseif category == "emblem" then
		CoD.perController[controller].selectedEmblemModel = element:getModel()
		local emblemIndexModel = element:getModel( controller, "emblemIndex" )
		local emblemIndex = Engine.GetModelValue( emblemIndexModel )
		Engine.SetupEmblemData( controller, emblemIndex, CoD.perController[controller].selectedEmblemTabStorageType )
	end
end

function FileshareSetShowFileDetails( controller, booleanArg )
	CoD.FileshareUtility.SetShowFileDetails( booleanArg )
end

function FileshareSetShowPublishNewDetails( controller, booleanArg )
	CoD.FileshareUtility.SetShowPublishNewDetails( booleanArg )
end

function FileshareShowcasePublishSelectedItem( self, element, controller )
	local category = CoD.FileshareUtility.GetCurrentCategory()
	if category == "screenshot" then
		category = "screenshot_private"
		CoD.FileshareUtility.SetCurrentCategory( category )
	end
	if category == "paintjob" then
		CoD.perController[controller].selectedpaintjobModel = element:getModel()
		CoD.CraftUtility.OpenPublishPromptPaintjob( self, element, controller, nil, self )
	elseif category == "variant" then
		CoD.perController[controller].gunsmithVariantModel = element:getModel()
		CoD.CraftUtility.OpenPublishPromptGunsmith( self, element, controller, nil, self )
	elseif category == "emblem" then
		CoD.perController[controller].selectedEmblemModel = element:getModel()
		CoD.CraftUtility.OpenPublishPromptEmblem( self, element, controller, nil, self )
	elseif category == "customgame" then
		local root = Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" )
		local gameTypeModel = Engine.GetModel( element:getModel(), "gameType" )
		Engine.SetModelValue( Engine.CreateModel( root, "gameType" ), Engine.GetModelValue( gameTypeModel ) )
		SetSelectedCustomGame( element, controller )
		OpenCustomGamePublishPrompt( self, element, controller, nil, self )
	elseif category == "screenshot_private" then
		OpenLocalScreenshotsPublishPrompt( self, element, controller, nil, nil )
	end
end

function FileshareUpdateCurrentQuota( self, controller )
	CoD.FileshareUtility.UpdateCurrentQuota( controller )
end

function FileshareSetDirty( controller )
	CoD.FileshareUtility.SetDirty()
end

function FileshareCategorySelectorItemSelected( self, element, controller )
	local categoryModel = Engine.GetModel( element:getModel(), "category" )
	local category = Engine.GetModelValue( categoryModel )
	local communityDataType = CoD.FileshareUtility.GetCurrentCommunityDataType()
	local communityDataTypeChanged = false
	local communityDataTypeModel = Engine.GetModel( element:getModel(), "communityDataType" )
	if communityDataTypeModel then
		local currentCommunityDataType = CoD.FileshareUtility.GetCurrentCommunityDataType()
		local newCommunityDataType = Engine.GetModelValue( communityDataTypeModel )
		if newCommunityDataType ~= nil and newCommunityDataType ~= "" and currentCommunityDataType ~= newCommunityDataType then
			CoD.FileshareUtility.SetCurrentCommunityDataType( newCommunityDataType )
			communityDataType = newCommunityDataType
			communityDataTypeChanged = true
		end
	end
	FileshareCategorySelectorCategoryChanged( controller, category, communityDataType, communityDataTypeChanged )
end

function FileshareHandleKeyboardComplete( self, element, controller, event )
	if event.type == Enum.KeyboardType.KEYBOARD_TYPE_FILESHARE_PUBLISH_NAME then
		CoD.FileshareUtility.SetPublishName( event.input )
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_FILESHARE_PUBLISH_DESCRIPTION then
		CoD.FileshareUtility.SetPublishDescription( event.input )
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_FILESHARE_PUBLISH_TAGS then
		CoD.FileshareUtility.SetPublishTags( event.input )
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_FILESHARE_DOWNLOAD_NAME then
		CoD.FileshareUtility.SetDownloadFileName( event.input )
	end
end

function FileshareEnterDownloadName( self, element, controller )
	ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_FILESHARE_DOWNLOAD_NAME" )
end

function FileshareEnterPublishName( self, element, controller )
	ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_FILESHARE_PUBLISH_NAME" )
end

function FileshareEnterPublishDescription( self, element, controller )
	ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_FILESHARE_PUBLISH_DESCRIPTION" )
end

function FileshareEnterPublishTags( self, element, controller )
	ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_FILESHARE_PUBLISH_TAGS" )
end

function FileshareResetPublishingModel( self, element, controller )
	CoD.FileshareUtility.ResetPublishingModel()
end

function FileshareRestoreToPreviousCategory( controller )
	local previousCategory = CoD.FileshareUtility.GetPreviousCategory()
	if previousCategory then
		CoD.FileshareUtility.SetCurrentCategory( previousCategory )
	end
end

function FileshareToggleAllowDownload( self, element, controller )
	if CoD.FileshareUtility.GetPublishAllowDownload() then
		CoD.FileshareUtility.SetPublishAllowDownload( false )
	else
		CoD.FileshareUtility.SetPublishAllowDownload( true )
	end
end

function FileshareDeleteCurrentItem( self, element, controller, param, menu )
	CoD.FileshareUtility.Delete( self, element, controller, param, menu, true )
end

function FileshareDeleteDone( self, element, controller, param, menu )
	CoD.FileshareUtility.DeleteDone( self, element, controller, param, menu )
end

function FileshareSetPreviewIconSizeNormal()
	local rootModel = CoD.FileshareUtility.GetRootModel()
	local sizeModel = Engine.CreateModel( rootModel, "isNormalSize", false )
	local verticalCountModel = Engine.CreateModel( rootModel, "listVerticalCount", false )
	Engine.SetModelValue( sizeModel, true )
	Engine.SetModelValue( verticalCountModel, 2 )
end

function FileshareSetPreviewIconSizeShort()
	local rootModel = CoD.FileshareUtility.GetRootModel()
	local sizeModel = Engine.CreateModel( rootModel, "isNormalSize", false )
	local verticalCountModel = Engine.CreateModel( rootModel, "listVerticalCount", false )
	Engine.SetModelValue( sizeModel, false )
	Engine.SetModelValue( verticalCountModel, 3 )
end

function FileshareSummaryFileUpdate( controller )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "fileshareRoot", false )
	local myModel = Engine.CreateModel( rootModel, "summaryFileUpdated", false )
	local fileId = Engine.GetModelValue( myModel )
	if fileId == nil then
		return 
	elseif CoD.FileshareUtility.GetIsFullscreenMode( controller ) == true then
		local selectedItemModel = CoD.FileshareUtility.GetSelectedItemRootModel()
		local selectedItemFileId = Engine.GetModelValue( Engine.CreateModel( selectedItemModel, "fileId" ) )
		if selectedItemFileId == fileId then
			local selectedItemRenderFileIdModel = Engine.CreateModel( selectedItemModel, "renderFileId" )
			Engine.SetModelValue( selectedItemRenderFileIdModel, fileId )
			local showDetailsViewSpinnerModel = Engine.CreateModel( selectedItemModel, "showDetailsViewSpinner" )
			Engine.SetModelValue( showDetailsViewSpinnerModel, 0 )
			local fileId = Engine.GetModelValue( Engine.CreateModel( selectedItemModel, "fileId" ) )
			local category = Engine.GetModelValue( Engine.CreateModel( selectedItemModel, "fileCategory" ) )
			local weaponIndex = Engine.GetFileshareWeaponIndex( controller, fileId )
			if category == "paintjob" then
				CoD.CraftUtility.Fileshare.DisplayWeaponWithPaintjob( controller, weaponIndex, fileId, true )
			elseif category == "variant" then
				CoD.CraftUtility.Fileshare.DisplayWeaponVariants( controller, weaponIndex, fileId, true )
			end
		end
	else
		for i = 1, 12, 1 do
			local listItemModel = "fileshareData_" .. i
			if FileshareIsCommunityMode( nil, controller ) == true then
				listItemModel = "fileshareData_community_" .. i
			end
			local model = Engine.CreateModel( rootModel, listItemModel, false )
			local fileIdModel = Engine.CreateModel( model, "fileID", false )
			local renderFileIdModel = Engine.CreateModel( model, "renderFileId", false )
			local modelFileId = Engine.GetModelValue( fileIdModel )
			if modelFileId == fileId then
				Engine.SetModelValue( renderFileIdModel, fileId )
				break
			end
		end
	end
end

function FileshareSetCommunityKicker( controller )
	SetHeadingKickerText( Engine.Localize( CoD.FileshareUtility.GetCurrentCommunityMenuKicker() ) )
end

function FileshareSetCurrentCategory( controller, stringArg )
	CoD.FileshareUtility.SetCurrentCategory( stringArg )
end

function FileshareSetShowCreateButton( controller, booleanArg )
	CoD.FileshareUtility.SetShowCreateButton( booleanArg )
end

function FileshareDownloadSummary( self, element, controller )
	if Engine.CurrentSessionMode() == Enum.eModes.MODE_INVALID then
		return 
	end
	local elementModel = element:getModel()
	if elementModel then
		local fileId = Engine.GetModelValue( Engine.GetModel( elementModel, "fileId" ) )
		local summaryFileSize = Engine.GetModelValue( Engine.GetModel( elementModel, "fileSummarySize" ) )
		local isPooled = Engine.GetModelValue( Engine.GetModel( elementModel, "isPooled" ) )
		local location = Enum.fileShareLocation.FILESHARE_LOCATION_USERSTORAGE
		if isPooled then
			location = Enum.fileShareLocation.FILESHARE_LOCATION_POOLEDSTORAGE
		end
		Engine.FileshareDownloadSummary( controller, fileId, summaryFileSize, location )
	end
end

function FileshareAbortSummaryDownload( self, element, controller )
	
end

function FileshareHandleDownloadSummary( self, element, controller, event )
	local model = self:getModel()
	if model then
		CoD.FileshareUtility.SetupFileShareSummary( model, event )
	end
end

function FileshareDownloadScreenshot( controller )
	local model = DataSources.FileshareSelectedItem.getModel()
	if model then
		local fileId = CoD.SafeGetModelValue( model, "fileId" ) or 0
		if fileId ~= CoD.currentScreenshot then
			FileshareDestroyScreenshot( controller )
			local fileSize = CoD.SafeGetModelValue( model, "fileSize" ) or 0
			if fileId ~= 0 then
				Engine.DownloadScreenshot( controller, fileId, fileSize )
				CoD.currentScreenshot = fileId
			end
		end
	end
end

function FileshareDestroyScreenshot( controller )
	if CoD.currentScreenshot then
		Engine.DestroyScreenshot( controller )
		CoD.currentScreenshot = nil
	end
end

function FileshareBookmarkRecentGame( controller )
	local currentStats = CoD.GetPlayerStats( controller )
	local aarStats = currentStats.AfterActionReportStats
	local demoFileID = aarStats.demoFileID:get()
	if demoFileID ~= nil and demoFileID ~= "0" then
		Engine.BookmarkRecentGame( controller, demoFileID )
		CoD.OverlayUtility.ShowToast( "RecentGameBookmarked", Engine.ToUpper( Engine.Localize( "MENU_NOTICE" ) ), Engine.Localize( "MENU_GAME_BOOKMARKED" ), "uie_bookmark" )
	end
end

function SetFileshareShowcaseKickerText( controller )
	local xuid = Engine.GetXUID64( controller )
	local kicker = Engine.ToUpper( Engine.Localize( "MENU_SHOWCASE" ) )
	if FileshareGetShowcasePublishMode( controller ) == true then
		Engine.ToUpper( Engine.Localize( "MENU_PUBLISH" ) )
	end
	if xuid == CoD.FileshareUtility.GetCurrentUser() then
		kicker = Engine.ToUpper( Engine.Localize( "MENU_MEDIA_MYSHOWCASE" ) )
	end
	SetHeadingKickerText( kicker )
end

function SetIsInFileshare( controller, param )
	local inFileshare = false
	if param and param == "true" then
		inFileshare = true
	end
	CoD.perController[controller].inFileshare = inFileshare
end

function FileshareSetIsInFullscreenView( controller, booleanArg )
	CoD.FileshareUtility.SetIsFullscreenMode( controller, booleanArg )
end

function FileshareSetShowcasePublishMode( controller, booleanArg )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "FileshareRoot", false )
	local publishModel = Engine.CreateModel( rootModel, "PublishMode", false )
	local publishMode = 0
	if booleanArg == true then
		publishMode = 1
	end
	Engine.SetModelValue( publishModel, publishMode )
end

function FileshareGetShowcasePublishMode( controller )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "FileshareRoot", false )
	local publishModel = Engine.CreateModel( rootModel, "PublishMode", false )
	return Engine.GetModelValue( publishModel ) == 1
end

function FileshareToggleDetailsHiddenMode( controller )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "FileshareRoot", false )
	local detailsHiddenModel = Engine.CreateModel( rootModel, "DetailsHiddenMode", false )
	local value = Engine.GetModelValue( detailsHiddenModel )
	Engine.SetModelValue( detailsHiddenModel, Negate( value or 0 ) )
end

function FileshareResetDetailsHiddenMode( controller )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "FileshareRoot", false )
	local detailsHiddenModel = Engine.CreateModel( rootModel, "DetailsHiddenMode", false )
	Engine.SetModelValue( detailsHiddenModel, 0 )
end

function FileshareGetDetailsHiddenMode( controller )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "FileshareRoot", false )
	local detailsHiddenModel = Engine.CreateModel( rootModel, "DetailsHiddenMode", false )
	return Engine.GetModelValue( detailsHiddenModel ) == 1
end

function FileshareRecordSaveEvent( controller )
	local category = CoD.FileshareUtility.GetCurrentCategory()
	local quota = Engine.FileshareGetQuota( controller, category )
	if not quota then
		return 
	elseif category == "screenshot_private" then
		CoD.MetricsUtility.ScreenshotEvent( controller, "save", category, quota.categorySlotsUsed, quota.categoryQuota )
	elseif category == "clip_private" then
		CoD.MetricsUtility.ClipsEvent( controller, "save", category, quota.categorySlotsUsed, quota.categoryQuota )
	end
end

function FileshareRecordPublishEvent( controller )
	local category = CoD.FileshareUtility.GetCurrentCategory()
	if category == "screenshot_private" then
		category = "screenshot"
	elseif category == "clip_private" then
		category = "clip"
	end
	local quota = Engine.FileshareGetQuota( controller, category )
	if not quota then
		return 
	else
		CoD.MetricsUtility.FileshareEvent( controller, "publish", category, quota.categorySlotsUsed, quota.categoryQuota )
	end
end

function FileshareUpdateDetailsViewModel( self, element, controller, codeIndex )
	local category = CoD.FileshareUtility.GetCurrentCategory()
	local key, val = CoD.FileshareUtility.GetCurrentFilter()
	local isCommunityMode = CoD.FileshareUtility.GetIsCommunityMode( controller )
	local slotData = nil
	if isCommunityMode then
		slotData = Engine.FileshareGetCommunitySlotData( controller, category, key, val, codeIndex )
	else
		slotData = Engine.FileshareGetSlotData( controller, category, key, val, codeIndex )
	end
	local itemModel = Engine.CreateModel( Engine.GetGlobalModel(), "FileshareSelectedItem", false )
	for _, v in ipairs( CoD.FileshareUtility.FileProperties ) do
		if slotData[v] ~= nil then
			local valueModel = Engine.CreateModel( itemModel, v )
			Engine.SetModelValue( valueModel, slotData[v] )
		end
	end
	local codeIndexModel = Engine.CreateModel( itemModel, "codeIndex" )
	Engine.SetModelValue( codeIndexModel, codeIndex )
	local showDetailsViewSpinnerModel = Engine.CreateModel( itemModel, "showDetailsViewSpinner" )
	local renderFileId = Engine.GetModelValue( Engine.CreateModel( itemModel, "renderFileId" ) )
	local fileId = Engine.GetModelValue( Engine.CreateModel( itemModel, "fileId" ) )
	if renderFileId == fileId then
		Engine.SetModelValue( showDetailsViewSpinnerModel, 0 )
	elseif category ~= "emblem" then
		Engine.SetModelValue( showDetailsViewSpinnerModel, 1 )
	end
	CoD.FileshareUtility.SetSelectedItem( itemModel )
	self:setModel( itemModel, controller )
	FileshareSetSelectedItem( self, element, controller, "true" )
	CoD.FileshareUtility.ProcessUIIndex( controller, category, codeIndex )
end

function FileshareMoveToNextItem( self, element, controller, menu )
	if FileshareDetailsViewCanMoveToNext( controller ) then
		local codeIndex = CoD.FileshareUtility.GetSelectedItemProperty( "codeIndex" )
		FileshareUpdateDetailsViewModel( self, element, controller, codeIndex + 1 )
	end
end

function FileshareMoveToPreviousItem( self, element, controller )
	if FileshareDetailsViewCanMoveToPrevious( controller ) then
		local codeIndex = CoD.FileshareUtility.GetSelectedItemProperty( "codeIndex" )
		FileshareUpdateDetailsViewModel( self, element, controller, codeIndex - 1 )
	end
end

function FileshareShowErrorToast( self, element, controller )
	CoD.FileshareUtility.ShowSimpleToast( controller, CoD.FileshareUtility.ToastTypes.ERROR )
end

function FileshareLikeVoteSuccessHandler( self, controller, event )
	CoD.FileshareUtility.ShowToast( controller, CoD.FileshareUtility.ToastTypes.LIKE )
end

function FileshareDisikeVoteSuccessHandler( self, controller, event )
	CoD.FileshareUtility.ShowToast( controller, CoD.FileshareUtility.ToastTypes.DISLIKE )
end

function FileshareShowPublishSuccessToast( self, element, controller )
	CoD.FileshareUtility.ShowToast( controller, CoD.FileshareUtility.ToastTypes.PUBLISH )
end

function FileshareShowUploadSuccessToast( self, element, controller )
	CoD.FileshareUtility.ShowToast( controller, CoD.FileshareUtility.ToastTypes.UPLOAD )
end

function FileshareShowDeleteSuccessToast( self, element, controller )
	CoD.FileshareUtility.ShowToast( controller, CoD.FileshareUtility.ToastTypes.DELETE )
end

function FileshareShowDownloadSuccessToast( self, element, controller )
	CoD.FileshareUtility.ShowToast( controller, CoD.FileshareUtility.ToastTypes.DOWNLOAD )
end

function FileshareShowReadonlyToast( self, element, controller )
	CoD.FileshareUtility.ShowSimpleToast( controller, CoD.FileshareUtility.ToastTypes.READONLY )
end

function FileshareShowReportSuccessToast( self, element, controller )
	CoD.FileshareUtility.ShowToast( controller, CoD.FileshareUtility.ToastTypes.REPORT )
end

function GetMediaManagerCategoryCount()
	return #CoD.FileshareUtility.ShowcaseManagerTabs
end

function SetIsMediaManager( self, element, controller, param, menu )
	if param then
		local val = 0
		if param == "true" then
			val = 1
		end
		local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false )
		Engine.SetModelValue( Engine.CreateModel( rootModel, "isMediaManager", false ), val )
	end
end

function MediaManagerMarkDirty( controller )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false )
	local model = Engine.CreateModel( rootModel, "dirty", false )
	ForceNotifyGlobalModel( controller, "MediaManager.dirty" )
	MediaManagerUpdateSlotsUsed( controller, CoD.perController[controller].selectedMediaManagerTab )
end

function MediaManagerClearPaintjob( self, element, controller, param, menu )
	CoD.CraftUtility.PaintjobClear( self, element, controller, param, menu )
end

function MediaManagerClearVariant( self, element, controller, param, menu )
	CoD.CraftUtility.GunsmithClear( self, element, controller, param, menu )
end

function MediaManagerClearEmblem( self, element, controller, param, menu )
	CoD.CraftUtility.EmblemClear( self, element, controller, param, menu )
end

function MediaManagerTabChanged( self, element, controller )
	CoD.perController[controller].selectedMediaManagerTab = element.fileshareCategory
	MediaManagerUpdateSlotsUsed( controller, element.fileshareCategory )
	CoD.FileshareUtility.SetCurrentCategory( element.fileshareCategory )
end

function MediaManagerUpdateSlotsUsed( controller, category )
	if category then
		local quota = Engine.MediaManagerGetQuota( controller, category )
		local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false )
		local slotsUsedModel = Engine.CreateModel( rootModel, "slotsUsed", false )
		Engine.SetModelValue( slotsUsedModel, quota.categorySlotsUsed )
	end
end

function MediaManagerClearDisplay( self, element, controller )
	if CoD.FileshareUtility.IsCategoryFilm( controller, element ) or CoD.FileshareUtility.IsCategoryClip( controller, element ) or CoD.FileshareUtility.IsCategoryScreenshot( controller, element ) or CoD.FileshareUtility.IsCategoryCustomGames( controller, element ) then
		return 
	else
		CoD.CraftUtility.Fileshare.ClearDisplay( controller )
	end
end

function MediaManagerSetSlotModel( controller, isBuyMore, createTime, authorName )
	local mediaManagerRootModel = Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false )
	local isBuyMoreSlotModel = Engine.CreateModel( mediaManagerRootModel, "isBuyMoreSlot", false )
	local createTimeModel = Engine.CreateModel( mediaManagerRootModel, "createTime", false )
	local authorNameModel = Engine.CreateModel( mediaManagerRootModel, "authorName", false )
	Engine.SetModelValue( isBuyMoreSlotModel, isBuyMore )
	Engine.SetModelValue( createTimeModel, createTime )
	Engine.SetModelValue( authorNameModel, authorName )
	ForceNotifyGlobalModel( controller, "MediaManager.createTime" )
	ForceNotifyGlobalModel( controller, "MediaManager.authorName" )
end

function MediaManagerPaintjobFocusChanged( self, element, controller )
	local paintjobSlotAndIndexModel = element:getModel( controller, "paintjobSlotAndIndex" )
	local slotAndIndex = Engine.GetModelValue( paintjobSlotAndIndexModel )
	Engine.SetModelValue( paintjobSlotAndIndexModel, slotAndIndex )
	local weaponIndexModel = element:getModel( controller, "weaponIndex" )
	local weaponIndex = Engine.GetModelValue( weaponIndexModel )
	CoD.SetCustomization( controller, weaponIndex, "weapon_index" )
	local selectedPaintjobRootModel = Engine.CreateModel( Engine.GetModelForController( controller ), "MediaManagerSelectedPaintjob" )
	local model = Engine.CreateModel( selectedPaintjobRootModel, "paintjobSlotAndIndex" )
	Engine.SetModelValue( model, slotAndIndex )
	local authorNameModel = element:getModel( controller, "authorName" )
	local authorName = Engine.GetModelValue( authorNameModel )
	local createTimeModel = element:getModel( controller, "createTime" )
	local createTime = Engine.GetModelValue( createTimeModel )
	MediaManagerSetSlotModel( controller, false, createTime, authorName )
end

function MediaManagerVariantFocusChanged( self, element, controller )
	local weaponIndexModel = element:getModel( controller, "weaponIndex" )
	local weaponIndex = Engine.GetModelValue( weaponIndexModel )
	CoD.SetCustomization( controller, weaponIndex, "weapon_index" )
	local authorNameModel = element:getModel( controller, "authorName" )
	local authorName = Engine.GetModelValue( authorNameModel )
	local createTimeModel = element:getModel( controller, "createTime" )
	local createTime = Engine.GetModelValue( createTimeModel )
	MediaManagerSetSlotModel( controller, false, createTime, authorName )
end

function MediaManagerEmblemFocusChanged( self, element, controller )
	CoD.SetCustomization( controller, Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM, "type" )
	CoD.perController[controller].selectedEmblemModel = element:getModel()
	local emblemIndexModel = element:getModel( controller, "emblemIndex" )
	local emblemIndex = Engine.GetModelValue( emblemIndexModel )
	Engine.SetupEmblemData( controller, emblemIndex, CoD.perController[controller].selectedEmblemTabStorageType )
	local authorNameModel = element:getModel( controller, "authorName" )
	local authorName = Engine.GetModelValue( authorNameModel )
	local createTimeModel = element:getModel( controller, "createTime" )
	local createTime = Engine.GetModelValue( createTimeModel )
	MediaManagerSetSlotModel( controller, false, createTime, authorName )
end

function MediaManagerBuyMoreSlotOnFocus( self, element, controller )
	local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false )
	local model = Engine.CreateModel( rootModel, "isBuyMoreSlot", false )
	Engine.SetModelValue( model, true )
end

function OpenMediaManager( self, element, controller, param, menu )
	local currentCategory = CoD.FileshareUtility.GetCurrentCategory()
	CoD.FileshareUtility.SetPreviousCategory( currentCategory )
	CoD.FileshareUtility.SetCurrentCategory( param )
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	local mediaManagerRootModel = Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false )
	local model = Engine.CreateModel( mediaManagerRootModel, "previousWeaponIndex", false )
	Engine.SetModelValue( model, weaponIndex )
	MediaManagerClearDisplay( self, element, controller )
	OpenOverlay( self, "MediaManager", controller )
end

function GoBackAndOpenMediaManagerOnParent( self, element, controller, param, menu )
	local currentCategory = CoD.FileshareUtility.GetCurrentCategory()
	CoD.FileshareUtility.SetPreviousCategory( currentCategory )
	if param ~= nil and param ~= "" then
		CoD.FileshareUtility.SetCurrentCategory( param )
	end
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	local mediaManagerRootModel = Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false )
	local model = Engine.CreateModel( mediaManagerRootModel, "previousWeaponIndex", false )
	Engine.SetModelValue( model, weaponIndex )
	MediaManagerClearDisplay( self, element, controller )
	GoBackAndOpenOverlayOnParent( self, "MediaManager", controller )
end

function MediaManagerClose( self, element, controller )
	local mediaManagerRootModel = Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false )
	local model = Engine.CreateModel( mediaManagerRootModel, "previousWeaponIndex", false )
	local previousCategory = CoD.FileshareUtility.GetPreviousCategory()
	CoD.FileshareUtility.SetCurrentCategory( previousCategory )
	CoD.FileshareUtility.SetDirty()
	local weaponIndex = Engine.GetModelValue( model )
	CoD.SetCustomization( controller, weaponIndex, "weapon_index" )
	CoD.CraftUtility.Gunsmith.DisplayBaseWeapon( self, element, controller )
end

function MediaManagerFetchPaintjobsData( controller )
	local paintshopModeModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Paintshop.Mode" )
	Engine.SetModelValue( paintshopModeModel, Enum.PaintshopMode.PAINTSHOPMODE_WEAPONLIST )
	local customizationType = Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT
	CoD.SetCustomization( controller, customizationType, "type" )
	CoD.perController[controller].totalLayers = Enum.CustomizationTypeLayerCount.CUSTOMIZATION_TYPE_PAINTSHOP_MAX_LAYERS
	CoD.perController[controller].totalGroups = Enum.CustomizationTypeGroupCount.CUSTOMIZATION_TYPE_MAX_GROUPS
	local parsingDone = CoD.CraftUtility.Paintjobs.ParseDDL( controller, Enum.StorageFileType.STORAGE_PAINTJOBS )
end

function MediaManagerFetchVariantsData( controller )
	local gunsmithModeModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.Mode" )
	Engine.SetModelValue( gunsmithModeModel, Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST )
	local variantParsingDone = CoD.CraftUtility.Gunsmith.ParseDDL( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
end

function MediaManagerFetchEmblemsData( controller )
	CoD.perController[controller].selectedEmblemTabStorageType = Enum.StorageFileType.STORAGE_EMBLEMS
	local parsingDone = CoD.CraftUtility.Emblems.ParseDDL( controller, CoD.perController[controller].selectedEmblemTabStorageType )
end

function MediaManagerUpdateLocalData( controller )
	MediaManagerFetchPaintjobsData( controller )
	MediaManagerFetchVariantsData( controller )
	MediaManagerFetchEmblemsData( controller )
end

function PaintjobSelector_GainFocus( self, element, controller )
	CoD.perController[controller].selectedpaintjobModel = element:getModel()
	CoD.perController[controller].viewIndex = 1
	local customizationType = CoD.CraftUtility.PaintshopView[CoD.perController[controller].viewIndex].customization_type
	local paintjobSlotModel = element:getModel( controller, "paintjobSlot" )
	local paintjobSlot = Engine.GetModelValue( paintjobSlotModel )
	local paintjobIndexModel = element:getModel( controller, "paintjobIndex" )
	local paintjobIndex = Engine.GetModelValue( paintjobIndexModel )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithPaintjob( controller, paintjobIndex, paintjobSlot )
end

function PaintjobSelector_ChoosePaintjob( self, element, controller )
	local paintjobSlotModel = element:getModel( controller, "paintjobSlot" )
	local paintjobIndexModel = element:getModel( controller, "paintjobIndex" )
	CoD.perController[controller].selectedpaintjobModel = element:getModel()
	if paintjobSlotModel and paintjobIndexModel then
		local paintjobIndex = Engine.GetModelValue( paintjobIndexModel )
		local paintjobSlot = Engine.GetModelValue( paintjobSlotModel )
		Engine.SetupPaintjobData( controller, paintjobSlot, paintjobIndex )
	end
	CoD.perController[controller].viewIndex = 1
	local view_name = CoD.CraftUtility.PaintshopView[CoD.perController[controller].viewIndex].view_name
	local customizationType = CoD.CraftUtility.PaintshopView[CoD.perController[controller].viewIndex].customization_type
	local customizationStringRef = CoD.CraftUtility.PaintshopView[CoD.perController[controller].viewIndex].view_string_ref
	CoD.SetCustomization( controller, customizationType, "type" )
	CoD.SetCustomization( controller, customizationStringRef, "view_string_ref" )
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	Engine.SetupEmblemEditBuffer( controller, customizationType, weaponIndex )
	CoD.CraftUtility.DisplayWeaponInPaintshop( controller, view_name )
	Engine.SendMenuResponse( controller, "paintshop_light", "far" )
	CoD.SetEditorProperties( controller, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE, "editorMode" )
end

function FileshareOpenPreviousPublishMenu( self, element, controller, menu )
	local category = CoD.FileshareUtility.GetCurrentCategory()
	if category == "paintjob" then
		CoD.CraftUtility.OpenPublishPromptPaintjob( self, element, controller, nil, menu )
	elseif category == "emblem" then
		CoD.CraftUtility.OpenPublishPromptEmblem( self, element, controller, nil, menu )
	elseif category == "variant" then
		CoD.CraftUtility.OpenPublishPromptGunsmith( self, element, controller, nil, menu )
	end
end

function FileshareOpenFullscreenView( self, element, controller, menu )
	if element.gridInfoTable then
		CoD.FileshareUtility.ReportView( controller, element.gridInfoTable.zeroBasedIndex )
	end
	if FileshareIsCategory( controller, "screenshot_private" ) or FileshareIsCategory( controller, "screenshot" ) then
		CoD.Menu.ModelToUse = element:getModel()
		OpenOverlay( self, "Fileshare_ScreenshotDetailsView", controller )
		CoD.Menu.ModelToUse = nil
	else
		OpenOverlay( self, "Fileshare_DetailsView", controller )
	end
end

function FilesharePublish( self, element, controller )
	CoD.FileshareUtility.Publish( controller )
end

function FilesharePrivateUpload( self, element, controller )
	CoD.FileshareUtility.PrivateUpload( controller )
end

function FileshareDownload( self, element, controller )
	CoD.FileshareUtility.Download( controller )
end

function SteamWorkshopPublish( self, element, controller )
	CoD.SteamWorkshopUtility.Publish( self, element, controller )
end

function SteamWorkshopOpenAgreement( self, element, controller )
	CoD.SteamWorkshopUtility.OpenAgreement( self, element, controller )
end

function SteamWorkshopOpenFAQ( self, element, controller )
	CoD.SteamWorkshopUtility.OpenFAQ( self, element, controller )
end

function SteamWorkshopOpenItem( self, element, controller )
	CoD.SteamWorkshopUtility.OpenItemOnSteam( self, element, controller )
end

function SteamWorkshopViewWorkshop( self, element, controller )
	CoD.SteamWorkshopUtility.ViewWorkshop( self, element, controller )
end

function PaintjobSelector_ClearPaintjob( self, element, controller, param )
	local paintjobModel = CoD.perController[controller].selectedpaintjobModel
	local paintjobSlot = Engine.GetModelValue( Engine.GetModel( paintjobModel, "paintjobSlot" ) )
	local paintjobIndex = Engine.GetModelValue( Engine.GetModel( paintjobModel, "paintjobIndex" ) )
	CoD.CraftUtility.Paintjobs.ClearPaintjob( controller, paintjobSlot, paintjobIndex )
	CoD.CraftUtility.Paintjobs.ParseDDL( controller, Enum.StorageFileType.STORAGE_PAINTJOBS )
	if IsMediaManager() == true then
		GoBackMultiple( self, controller, 1 )
		MediaManagerMarkDirty( controller )
	else
		local baseMenu = GoBackMultiple( self, controller, 2 )
		if baseMenu.paintjobSelector ~= nil then
			baseMenu.paintjobSelector.paintjobsList:updateDataSource( true )
			local firstFocusable = baseMenu.paintjobSelector.paintjobsList:getFirstSelectableItem()
			baseMenu.paintjobSelector.paintjobsList:setActiveItem( firstFocusable )
		end
	end
	local updateDataSourceModel = Engine.GetModel( Engine.GetModelForController( controller ), "Paintshop.UpdateDataSource" )
	if updateDataSourceModel ~= nil then
		ForceNotifyModel( controller, "Paintshop.UpdateDataSource" )
	end
end

function PaintjobSelector_CopyPaintjob( self, element, controller, param, menu )
	local paintjobModel = menu:getModel()
	local slot, index = CoD.CraftUtility.Paintjobs.Copy( controller, paintjobModel )
	if slot and index then
		CoD.CraftUtility.Paintjobs.ParseDDL( controller, Enum.StorageFileType.STORAGE_PAINTJOBS )
		CoD.CraftUtility.InvalidateWCItemRender( slot, index )
		local paintjobSelectMenu = GoBack( menu, controller )
		local paintjobListElement = paintjobSelectMenu.paintjobSelector.paintjobsList
		paintjobListElement:updateDataSource( true )
		local copiedIntoElement = paintjobListElement:findItem( {
			paintjobSlot = slot,
			paintjobIndex = index
		} )
		if copiedIntoElement then
			paintjobListElement:setActiveItem( copiedIntoElement )
		end
		ForceNotifyModel( controller, "Paintshop.UpdateDataSource" )
	end
end

function PaintjobSelector_RenamePaintjob( self, element, controller )
	local paintjobModel = self:getModel()
	local paintjobSlot = Engine.GetModelValue( Engine.GetModel( paintjobModel, "paintjobSlot" ) )
	local paintjobIndex = Engine.GetModelValue( Engine.GetModel( paintjobModel, "paintjobIndex" ) )
	local paintjobName = Engine.GetModelValue( Engine.GetModel( paintjobModel, "paintjobName" ) )
	CoD.CraftUtility.Paintjobs.RenamePaintjob( controller, paintjobSlot, paintjobIndex, paintjobName )
end

function PaintjobSelector_HandleRenameKeyboardComplete( self, element, controller, event )
	local selectedPaintjobModel = self:getModel()
	local paintjobNameModel = nil
	if not selectedPaintjobModel then
		return 
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_PAINTJOB then
		paintjobNameModel = Engine.GetModel( selectedPaintjobModel, "paintjobName" )
	end
	if paintjobNameModel then
		Engine.SetModelValue( paintjobNameModel, event.input )
	end
end

function PaintjobEditor_OpenSavePopup( self, element, controller, menu )
	CoD.OverlayUtility.CreateOverlay( controller, self, "PaintjobSave", CoD.perController[controller].selectedpaintjobModel )
end

function PaintjobEditor_ResetLayer( self, element, controller, menu )
	local customizationType = CoD.GetCustomization( controller, "type" )
	Engine.ExecNow( controller, "emblemRevertLayerChanges " .. CoD.perController[controller].selectedLayerIndex .. " " .. customizationType )
	EmblemEditor_BeginEdit( self, element, controller )
	GoBack( self, controller )
end

function PaintjobEditor_ToggleGrid( self, element, controller, menu )
	local gridTypeName = CoD.CraftUtility.GetGridTypeName( controller )
	local gridSize = 0
	if not IsGridOn( controller, gridTypeName ) then
		gridSize = CoD.CraftUtility.GetGridSize( controller )
	end
	SetProfileVar( controller, gridTypeName, gridSize )
	local customizationType = CoD.GetCustomization( controller, "type" )
	Engine.ExecNow( controller, "emblemSetGridSize " .. customizationType .. " " .. gridSize )
	EmblemEditor_BeginEdit( self, element, controller )
	GoBack( self, controller )
end

function PaintjobEditor_RemoveGrid( controller )
	local customizationType = CoD.GetCustomization( controller, "type" )
	Engine.ExecNow( controller, "emblemSetGridSize " .. customizationType .. " 0" )
end

function PaintjobEditor_RestoreGridState( controller )
	local customizationType = CoD.GetCustomization( controller, "type" )
	local gridTypeName = CoD.CraftUtility.GetGridTypeName( controller )
	local gridSize = Engine.GetProfileVarInt( controller, gridTypeName )
	Engine.ExecNow( controller, "emblemSetGridSize " .. customizationType .. " " .. gridSize )
end

function PaintjobEditor_ChangeViewRightBumper( self, element, controller )
	local view_index = CoD.CraftUtility.Paintjobs.GetNextViewIndex( controller )
	CoD.perController[controller].viewIndex = view_index
	local view_name = CoD.CraftUtility.PaintshopView[view_index].view_name
	local customizationType = CoD.CraftUtility.PaintshopView[view_index].customization_type
	local customizationStringRef = CoD.CraftUtility.PaintshopView[view_index].view_string_ref
	CoD.SetCustomization( controller, customizationType, "type" )
	CoD.SetCustomization( controller, customizationStringRef, "view_string_ref" )
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	Engine.SetupEmblemEditBuffer( controller, customizationType, weaponIndex )
	CoD.CraftUtility.DisplayWeaponInPaintshop( controller, view_name )
	self.layerCarousel:updateDataSource()
end

function PaintjobEditor_ChangeViewLeftBumper( self, element, controller )
	local view_index = CoD.CraftUtility.Paintjobs.GetPrevViewIndex( controller )
	CoD.perController[controller].viewIndex = view_index
	local view_name = CoD.CraftUtility.PaintshopView[view_index].view_name
	local customizationType = CoD.CraftUtility.PaintshopView[view_index].customization_type
	local customizationStringRef = CoD.CraftUtility.PaintshopView[view_index].view_string_ref
	CoD.SetCustomization( controller, customizationType, "type" )
	CoD.SetCustomization( controller, customizationStringRef, "view_string_ref" )
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	Engine.SetupEmblemEditBuffer( controller, customizationType, weaponIndex )
	CoD.CraftUtility.DisplayWeaponInPaintshop( controller, view_name )
	self.layerCarousel:updateDataSource()
end

function PaintjobEditor_HandleKeyboardComplete( self, element, controller, event )
	local selectedpaintjobModel = CoD.perController[controller].selectedpaintjobModel
	local paintjobTextEntryModel = nil
	if not selectedpaintjobModel then
		return 
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_PAINTJOB then
		paintjobTextEntryModel = Engine.GetModel( selectedpaintjobModel, "paintjobTextEntry" )
		if paintjobTextEntryModel then
			Engine.SetModelValue( paintjobTextEntryModel, event.input )
		end
		local inputTextModel = self:getModel( controller, "inputText" )
		if inputTextModel then
			Engine.SetModelValue( inputTextModel, event.input )
		end
	end
end

function PaintjobEditor_SavePaintjob( self, element, controller, selectedPaintjobModel )
	local paintjobTextEntry = Engine.GetModelValue( Engine.GetModel( selectedPaintjobModel, "paintjobTextEntry" ) )
	local paintjobNameModel = Engine.GetModel( selectedPaintjobModel, "paintjobName" )
	local quota = Engine.MediaManagerGetQuota( controller, "paintjob" )
	Engine.SetModelValue( paintjobNameModel, paintjobTextEntry )
	CoD.CraftUtility.Paintjobs.UploadPaintjob( controller, selectedPaintjobModel )
	CoD.CraftUtility.Paintjobs.ParseDDL( controller, Enum.StorageFileType.STORAGE_PAINTJOBS )
	CoD.CraftUtility.Paintjobs.InvalidateRender( controller, selectedPaintjobModel )
	PaintJobEditor_RecordComScoreEvent( self, controller, selectedPaintjobModel, "save", quota.categorySlotsUsed, quota.categoryQuota )
	local paintshopMenu = GoBack( self, controller )
	EmblemEditor_HandleBackInBrowseMode( paintshopMenu, element, controller )
	ClearSavedState( paintshopMenu, controller )
end

function PaintjobEditor_DiscardChanges( self, element, controller, selectedPaintjobModel )
	local paintshopMenu = GoBack( self, controller )
	PaintJobEditor_RecordComScoreEvent( self, controller, selectedPaintjobModel, "discard" )
	EmblemEditor_HandleBackInBrowseMode( paintshopMenu, element, controller )
	ClearSavedState( paintshopMenu, controller )
end

function PaintjobEditor_SaveChangesBack( self, element, controller, selectedPaintjobModel )
	local weaponIndex = Engine.GetModelValue( Engine.GetModel( selectedPaintjobModel, "weaponIndex" ) )
	if weaponIndex == CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX then
		local paintjobTextEntryModel = Engine.GetModel( selectedPaintjobModel, "paintjobTextEntry" )
		Engine.SetModelValue( paintjobTextEntryModel, "Paintjob" )
	end
end

function HandleSocialMenuBack( self, element, controller )
	if IsLobbyHost() and IsGlobalModelValueTrue( element, controller, "SocialMainMenu.managePartySubListSelected" ) then
		return 
	elseif Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "socialRoot.tab" ) ) == "groups" then
		local frameType = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "groups.frameType" ) )
		if frameType == "invites" or frameType == "members" then
			GroupsSocialChangeTabFrameWidget( self, element, controller, "main" )
			return 
		end
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "groups.frameType" ), "" )
	GoBack( self, controller )
end

function SetSocialTab( self, element, controller )
	local socialRootModel = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" )
	local tabModel = Engine.GetModel( socialRootModel, "tab" )
	Engine.SetModelValue( tabModel, element.tabId )
end

function FetchOnlineFriendsData( self, element, controller )
	if "friends" == element.tabId then
		Engine.UpdateFriends( controller, Enum.PresenceFilter.PRESENCE_FILTER_ONLINE_AND_IN_TITLE )
	end
end

function OpenPlatformProfile( self, element, controller, params, menu )
	local controllerModel = Engine.GetModelForController( controller )
	local selectedXuid = Engine.GetModelValue( Engine.CreateModel( controllerModel, "Social.selectedFriendXUID" ) )
	local selectedGamertag = Engine.GetModelValue( Engine.CreateModel( controllerModel, "Social.selectedFriendGamertag" ) )
	Engine.ShowPlatformProfile( controller, selectedXuid, selectedGamertag )
end

function OpenPlatformFriendRequest( self, element, controller, params, menu )
	local controllerModel = Engine.GetModelForController( controller )
	local selectedXuid = Engine.GetModelValue( Engine.CreateModel( controllerModel, "Social.selectedFriendXUID" ) )
	local selectedGamertag = Engine.GetModelValue( Engine.CreateModel( controllerModel, "Social.selectedFriendGamertag" ) )
	Engine.ShowPlatformFriendRequest( controller, selectedXuid, selectedGamertag )
end

function SocialJoin( self, element, controller, params, menu )
	CoD.CACUtility.ValidateMPLootWeapons( controller )
	if Engine.IsInGame() then
		if not Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, params.xuid ) then
			params.migrating = not CoDShared.QuitGame( controller )
			Engine.LobbyEvent( "OnInGameJoin", params )
		end
	else
		Engine.LobbyEvent( "OnJoin", params )
	end
	local previousMenu = GoBack( self, controller )
	GoBackToMenu( previousMenu, controller, "Lobby" )
end

function CacheSocialOnlinePlayersListModels( self, element, controller )
	local socialRootModel = Engine.CreateModel( Engine.GetGlobalModel(), "socialRoot" )
	local tabModel = Engine.CreateModel( socialRootModel, "tab" )
	local lastSelected = Engine.GetModelValue( tabModel )
	if lastSelected == "party" then
		return 
	end
	local cacheXuid, cacheParty, cachePartyUpdate, cachePartyTotal, cachePartyAvailable, cachePartyLeader, cachePartyGamertags = nil
	if self.cacheRootModel ~= nil then
		cacheXuid = self.cacheXuid
		cacheParty = self.cacheParty
		cachePartyUpdate = self.cachePartyUpdate
		cachePartyGamertags = self.cachePartyGamertags
		cachePartyTotal = self.cachePartyTotal
		cachePartyAvailable = self.cachePartyAvailable
		cachePartyLeader = self.cachePartyLeader
	else
		local socialRootModel = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" )
		local cacheModel = Engine.CreateModel( socialRootModel, "cache" )
		cacheXuid = Engine.CreateModel( cacheModel, "xuid" )
		cacheParty = Engine.CreateModel( socialRootModel, "party" )
		cachePartyUpdate = Engine.CreateModel( cacheParty, "update" )
		cachePartyTotal = Engine.CreateModel( cacheParty, "total" )
		cachePartyAvailable = Engine.CreateModel( cacheParty, "available" )
		cachePartyLeader = Engine.CreateModel( cacheParty, "leader" )
		Engine.SetModelValue( cacheXuid, Engine.StringToXUIDDecimal( "0" ) )
		cachePartyGamertags = {}
		for i = 1, 18, 1 do
			local pm = Engine.CreateModel( cacheParty, "pm_" .. i )
			cachePartyGamertags[i] = Engine.CreateModel( pm, "gamertag" )
			Engine.SetModelValue( cachePartyGamertags[i], "" )
		end
	end
	Engine.SetModelValue( cacheXuid, element.xuid )
	Engine.SetModelValue( cachePartyTotal, element.party.total )
	Engine.SetModelValue( cachePartyAvailable, element.party.available )
	Engine.SetModelValue( cachePartyLeader, element.party.leader )
	if element.party ~= nil and element.party.members ~= nil then
		for i = 1, #cachePartyGamertags, 1 do
			local model = cachePartyGamertags[i]
			if element.party.members[i] ~= nil then
				Engine.SetModelValue( model, element.party.members[i].gamertag )
			end
		end
		local update = Engine.GetModelValue( cachePartyUpdate )
		if update < 100000 then
			update = update + 1
		else
			update = 0
		end
		Engine.SetModelValue( cachePartyUpdate, update )
	end
end

function RefreshSocialPlayerParty( self, controller )
	local model = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot.party.update" )
	local update = Engine.GetModelValue( cachePartyUpdate )
	if update < 100000 then
		update = update + 1
	else
		update = 0
	end
	Engine.SetModelValue( cachePartyUpdate, update )
end

function ShowcaseOpenPlayerDetails( self, element, controller )
	ShowcaseSetSelectedFriendXUID( self, element, controller )
	GoBackAndOpenOverlayOnParent( self, "Social_PlayerDetailsPopup", controller )
end

function ShowcaseSetSelectedFriendXUID( self, element, controller )
	local gamertag = CoD.FileshareUtility.GetSelectedItemProperty( "fileAuthorName" )
	local xuid = CoD.FileshareUtility.GetSelectedItemProperty( "fileAuthorXuid" )
	local playerInfo = Engine.GetPlayerInfo( controller, xuid )
	local controllerModel = Engine.GetModelForController( controller )
	local selectedFriendModel = Engine.CreateModel( controllerModel, "Social.selectedFriendXUID" )
	Engine.SetModelValue( selectedFriendModel, xuid )
	local selectedFriendGamertagModel = Engine.CreateModel( controllerModel, "Social.selectedFriendGamertag" )
	Engine.SetModelValue( selectedFriendGamertagModel, gamertag )
end

function SetSelectedFriendXUID( self, element, controller )
	local xuid = nil
	if element ~= nil then
		local xuidModel = element:getModel( controller, "xuid" )
		if xuidModel ~= nil then
			xuid = Engine.GetModelValue( xuidModel )
			local controllerModel = Engine.GetModelForController( controller )
			local selectedFriendModel = Engine.CreateModel( controllerModel, "Social.selectedFriendXUID" )
			Engine.SetModelValue( selectedFriendModel, xuid )
			local gamertagModel = element:getModel( controller, "gamertag" )
			local gamertag = Engine.GetModelValue( gamertagModel )
			local selectedFriendGamertagModel = Engine.CreateModel( controllerModel, "Social.selectedFriendGamertag" )
			Engine.SetModelValue( selectedFriendGamertagModel, gamertag )
			local xuidString = Engine.UInt64ToString( xuid )
			if xuidString == "fefefefefefefefe" then
				local identityBadgeModel = Engine.CreateModel( Engine.GetModelForController( controller ), "socialPlayerInfo.identityBadge" )
				Engine.SetModelValue( Engine.CreateModel( identityBadgeModel, "gamertag" ), gamertag )
				Engine.SetModelValue( Engine.CreateModel( identityBadgeModel, "clantag" ), "" )
			end
			local activityModel = element:getModel( controller, "activity" )
			if activityModel ~= nil then
				local activity = Engine.GetModelValue( activityModel )
				local selectedFriendInTitleModel = Engine.CreateModel( controllerModel, "Social.selectedFriendInTitle" )
				Engine.SetModelValue( selectedFriendInTitleModel, activity > Enum.PresenceActivity.PRESENCE_ACTIVITY_ONLINE_NOT_IN_TITLE )
			end
		end
	end
end

function OpenSocialPlayerPopup( self, element, controller )
	local popup = OpenOverlay( self, "Social_PlayerDetailsPopup", controller )
	popup.playerInfo:setModel( element:getModel() )
end

function SocialToggleSorting( self, element, controller )
	local socialRootModel = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" )
	local sortModel = Engine.GetModel( socialRootModel, "sort" )
	local sortValue = Engine.GetModelValue( sortModel )
	if sortValue == Enum.PresenceSorting.PRESENCE_SORTING_ONLINE_MOST_RECENT then
		Engine.SetModelValue( sortModel, Enum.PresenceSorting.PRESENCE_SORTING_ALPHABETICAL )
		Engine.SortFriends( controller, Enum.PresenceSorting.PRESENCE_SORTING_ALPHABETICAL )
	elseif sortValue == Enum.PresenceSorting.PRESENCE_SORTING_ALPHABETICAL then
		Engine.SetModelValue( sortModel, Enum.PresenceSorting.PRESENCE_SORTING_ONLINE_MOST_RECENT )
		Engine.SortFriends( controller, Enum.PresenceSorting.PRESENCE_SORTING_ONLINE_MOST_RECENT )
	end
end

function SocialEnablePresenceCacheAutoupdate( controller, booleanArg )
	if Engine.EnablePresenceCacheAutoupdate ~= nil then
		Engine.EnablePresenceCacheAutoupdate( controller, booleanArg )
	end
end

function UpdateFriends( self, element, controller )
	local menu = self
	Engine.UpdateFriends( controller, Enum.PresenceFilter.PRESENCE_FILTER_ONLINE_AND_IN_TITLE )
end

function SetFriendsTabName( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local friendsModel = Engine.CreateModel( perControllerModel, "friends" )
	local tabModel = Engine.CreateModel( friendsModel, "tab" )
	Engine.SetModelValue( tabModel, element.tabId )
end

function UpdateFriendsData( self, element, controller )
	if "friends" == element.tabId then
		Engine.UpdateFriends( controller, 2 )
	elseif element.tabId == "inbox" then
		Engine.UpdateMessages( controller, 1 )
	end
end

function FriendsInboxOnMessageClick( self, element, controller )
	local xuid = Engine.GetModelValue( element:getModel( controller, "xuid" ) )
	if xuid ~= nil then
		Engine.ReadMessages( controller, 0 )
	end
end

function ChangeFindGroupsCategory( self, element, controller )
	if element and element.category then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "groups.findGroupsCategory" ), element.category )
	end
end

function GetProcessingGroupTaskModel( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local groupsModel = Engine.CreateModel( perControllerModel, "groups" )
	local processingGroupTaskModel = Engine.CreateModel( groupsModel, "processingTask" )
	return processingGroupTaskModel
end

function FetchGroups( self, element, controller )
	Engine.FetchGroups( controller )
end

function FetchGroupsInfo( self, element, controller )
	
end

function GroupsSocialChangeTabFrameWidget( self, element, controller, frame )
	if not frame then
		return 
	end
	local frameWidgetModel = Engine.GetModel( Engine.GetModelForController( controller ), "groups.frameWidget" )
	local frameTypeModel = Engine.GetModel( Engine.GetModelForController( controller ), "groups.frameType" )
	Engine.SetModelValue( frameTypeModel, frame )
	if frame == "main" then
		Engine.SetModelValue( frameWidgetModel, "CoD.GroupsSocialMainFrameWidget" )
	elseif frame == "members" then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "socialRoot.tab" ), "groupMembers" )
		Engine.SetModelValue( frameWidgetModel, "CoD.GroupsSocialMembersFrameWidget" )
	elseif frame == "invites" then
		Engine.SetModelValue( frameWidgetModel, "CoD.GroupsSocialInvitesFrameWidget" )
	end
end

function GroupNotifyPopupButtonAction( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local groupsModel = Engine.CreateModel( perControllerModel, "groups" )
	local error = Engine.GetModelValue( Engine.CreateModel( groupsModel, "notificationError" ) )
	local isProcessing = IsProcessingGroupTask( controller )
	if isProcessing then
		return 
	elseif not error then
		if self.onSuccessAction then
			self:onSuccessAction( element, controller )
		end
		local menu = self.occludedMenu
		if menu and menu.menuName ~= "Groups" then
			GoBack( menu, controller )
		end
	end
	GoBack( self, controller )
end

function OpenGroupsNotifyPopup( self, element, controller, isProcessing, eventName, onSuccessAction, closeAutomaticallyAfterEvent )
	local buttonText = "MENU_OK"
	if closeAutomaticallyAfterEvent then
		buttonText = nil
	end
	if isProcessing then
		local processingTaskModel = GetProcessingGroupTaskModel( controller )
		Engine.SetModelValue( processingTaskModel, true )
	end
	local processingTaskModel = CoD.OverlayUtility.CreateOverlay( controller, self, "GroupsNotificationPopup", controller, "$(groups.notificationTitle)", "$(groups.notificationMessage)", nil, buttonText, function ( self, element, controller, actionParam, menu )
		GroupNotifyPopupButtonAction( menu, element, controller )
	end, function ( self, element, controller, menu )
		GroupNotifyPopupButtonAction( menu, nil, controller )
	end )
	processingTaskModel.onSuccessAction = onSuccessAction
	local eventUpdateModel = Engine.GetModel( Engine.GetModelForController( controller ), "groups.eventUpdate" )
	local eventNameModel = Engine.GetModel( Engine.GetModelForController( controller ), "groups.eventName" )
	if isProcessing then
		processingTaskModel:subscribeToModel( eventUpdateModel, function ( model )
			if Engine.GetModelValue( eventNameModel ) == eventName then
				processingTaskModel:addElement( LUI.UITimer.newElementTimer( 500, false, function ( event )
					Engine.SetModelValue( GetProcessingGroupTaskModel( controller ), false )
					if closeAutomaticallyAfterEvent then
						local prevMenu = GoBack( processingTaskModel, controller )
						onSuccessAction( prevMenu, element, controller )
					end
				end ) )
			end
		end )
	end
end

function ProcessGroupApplication( self, element, controller )
	local title = "GROUPS_JOIN_REQUEST_CAPS"
	local desc = "GROUPS_ACCEPT_JOIN_REQUEST"
	local menu = self:getParentMenu()
	menu:OpenModalDialog( self, controller, title, desc, {
		"GROUPS_ACCEPT_JOIN_REQUEST",
		"GROUPS_REJECT_JOIN_REQUEST",
		"MENU_CANCEL"
	}, function ( modalResult )
		if element:getModel() and element:getModel( controller, "xuid" ) then
			local applicantXuid = Engine.GetModelValue( element:getModel( controller, "xuid" ) )
			if modalResult == 0 then
				Engine.AcceptSelectedGroupApplication( controller, applicantXuid )
				OpenGroupsNotifyPopup( self, element, controller, true, "accept_application_task_complete" )
			elseif modalResult == 1 then
				Engine.RejectSelectedGroupApplication( controller, applicantXuid )
				OpenGroupsNotifyPopup( self, element, controller, true, "reject_application_task_complete" )
			end
		end
		return true
	end )
end

function ProcessLeaveSelectedGroup( self, element, controller )
	local title = "GROUPS_LEAVE_GROUP_CAPS"
	local desc = "GROUPS_LEAVE_SELECTED_GROUP_TITLE"
	if IsGroupOwner( nil, controller ) then
		title = "GROUPS_DELETE_GROUP_CAPS"
		desc = "GROUPS_DELETE_SELECTED_GROUP_TITLE"
	end
	local menu = self:getParentMenu()
	menu:OpenModalDialog( self, controller, title, desc, {
		"MPUI_NO",
		"MPUI_YES"
	}, function ( modalResult )
		if modalResult == 1 then
			local groupId = Engine.GetModelValue( Engine.GetModel( CoD.perController[controller].selectedGroup, "groupId" ) )
			Engine.LeaveGroup( controller, groupId )
			OpenGroupsNotifyPopup( self, element, controller, true, "leave_group_task_complete", function ( self, element, controller )
				ClearSelectedGroup( self, element, controller )
				GoBack( self, controller )
			end )
		end
		return true
	end )
end

function OpenGroupOptionsPopup( self, element, controller )
	local controllerModel = Engine.GetModelForController( controller )
	local groupHeadquartersTabNameModel = Engine.GetModel( controllerModel, "groups.grouphqtabname" )
	local selectedXuid = Engine.GetModelValue( Engine.CreateModel( controllerModel, "Social.selectedFriendXUID" ) )
	local controllerXuid = Engine.GetXUID64( controller )
	local f919_local0 = selectedXuid == controllerXuid
	if groupHeadquartersTabNameModel then
		local currTab = Engine.GetModelValue( groupHeadquartersTabNameModel )
		if currTab == "overview" and not IsGroupOwner( nil, controller ) then
			OpenPopup( self, "GroupOptions", controller )
		elseif currTab == "roster" and IsGroupOwner( nil, controller ) and not f919_local0 then
			OpenPopup( self, "GroupAdminOptions", controller )
		end
	end
end

function OpenGroupsInviteConfirmation( self, element, controller )
	local menu = self
	if not menu.menuName then
		menu = self:getParentMenu()
	end
	if element:getModel() and element:getModel( controller, "groupId" ) then
		local groupId = Engine.GetModelValue( element:getModel( controller, "groupId" ) )
		local groupName = Engine.GetModelValue( element:getModel( controller, "groupName" ) )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "groups.selectedGroup.groupId" ), groupId )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "groups.selectedGroup.groupName" ), groupName )
		CoD.OverlayUtility.CreateOverlay( controller, menu, "GroupsInviteConfirmation", controller )
	end
end

function UpdateSearchGroupType( self, element, controller )
	if element and element.category then
		
	else
		
	end
end

function AcceptGroupInvite( self, element, controller )
	local selectedGroupIdModel = Engine.GetModel( Engine.GetModelForController( controller ), "groups.selectedGroup.groupId" )
	if selectedGroupIdModel then
		Engine.AcceptGroupInvite( controller, Engine.GetModelValue( selectedGroupIdModel ) )
		OpenGroupsNotifyPopup( self, element, controller, true, "groupsFetched", function ()
			CoD.OverlayUtility.ShowToast( "Invite", Engine.Localize( "GROUPS_INVITE_ACCEPTED" ), "", LuaDefine.INVITE_TOAST_POPUP_ACCEPTED_ICON )
			GoBack( self, controller )
		end, true )
	end
end

function RejectGroupInvite( self, element, controller )
	local selectedGroupIdModel = Engine.GetModel( Engine.GetModelForController( controller ), "groups.selectedGroup.groupId" )
	if selectedGroupIdModel then
		Engine.RejectGroupInvite( controller, Engine.GetModelValue( selectedGroupIdModel ) )
		OpenGroupsNotifyPopup( self, element, controller, true, "refreshInvites", function ()
			CoD.OverlayUtility.ShowToast( "Invite", Engine.Localize( "GROUPS_INVITE_REJECTED" ), "", LuaDefine.INVITE_TOAST_POPUP_REJECTED_ICON )
			GoBack( self, controller )
		end, true )
	end
end

function ProcessJoinSelectedGroup( self, element, controller )
	local menu = self:getParentMenu()
	Engine.FetchSelectedGroupJoinApprovalType( controller )
	OpenGroupsNotifyPopup( self, element, controller, true, "fetch_join_approval_type_task_complete", function ()
		if Engine.GetSelectedGroupJoinApprovalType() == Enum.GroupJoinApprovalType.GROUP_JOIN_APPROVAL_OFF then
			menu:OpenModalDialog( self, controller, "GROUPS_JOIN_SELECTED_GROUP_TITLE", "", {
				"MPUI_YES",
				"MPUI_NO"
			}, function ( modalResult )
				if modalResult == 0 then
					local groupBufferType = Engine.GetModelValue( element:getModel( controller, "groupBufferType" ) )
					local groupId = Engine.GetModelValue( element:getModel( controller, "groupId" ) )
					Engine.JoinGroup( controller, groupBufferType, groupId )
					OpenGroupsNotifyPopup( self, element, controller, true, "join_group_task_complete" )
					return true
				else
					
				end
			end )
		elseif Engine.GetSelectedGroupJoinApprovalType() == Enum.GroupJoinApprovalType.GROUP_JOIN_APPROVAL_ON then
			menu:OpenModalDialog( self, controller, "GROUPS_SEND_APPLICATION", "GROUPS_SEND_APPLICATION_DESC", {
				"MPUI_YES",
				"MPUI_NO"
			}, function ( modalResult )
				if modalResult == 0 then
					Engine.SendApplicationToSelectedGroup( controller )
					OpenGroupsNotifyPopup( self, element, controller, true, "send_application_task_complete" )
					return true
				else
					
				end
			end )
		end
	end, true )
end

function HandleGroupHeadquartersKeyboardComplete( self, element, controller, event )
	local selectedGroupModel = CoD.perController[controller].selectedGroup
	local model = nil
	if not selectedGroupModel then
		return 
	elseif element:getModel() and element:getModel( controller, "currentText" ) then
		Engine.SetModelValue( element:getModel( controller, "currentText" ), event.input )
	end
	if event.type == Enum.KeyboardType.KEYBOARD_TYPE_GROUP_NAME then
		Engine.SetSelectedGroupName( controller, event.input )
		OpenGroupsNotifyPopup( self, element, controller, true, "update_group_name_task_complete", function ( self, element, controller )
			if Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "groups.notificationError" ) ) then
				OpenGroupsNotifyPopup( self, element, controller )
			else
				Engine.SetModelValue( Engine.GetModel( selectedGroupModel, "name" ), event.input )
			end
		end, true )
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_GROUP_MESSAGE then
		Engine.SetSelectedGroupMessage( controller, event.input )
		Engine.SetModelValue( Engine.GetModel( selectedGroupModel, "message" ), event.input )
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_GROUP_DESCRIPTION then
		Engine.SetSelectedGroupDescription( controller, event.input )
		Engine.SetModelValue( Engine.GetModel( selectedGroupModel, "description" ), event.input )
	end
end

function EditSelectedGroupName( self, element, controller )
	ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_GROUP_NAME" )
end

function EditSelectedGroupMessage( self, element, controller )
	ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_GROUP_MESSAGE" )
end

function EditSelectedGroupDescription( self, element, controller )
	ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_GROUP_DESCRIPTION" )
end

function EditSelectedGroupEmblem( self, element, controller )
	local menu = self:getParentMenu()
	menu:OpenModalDialog( self, controller, "GROUPS_SET_GROUP_EMBLEM_TITLE", "GROUPS_SET_GROUP_EMBLEM_DESC", {
		"MPUI_NO",
		"MPUI_YES"
	}, function ( modalResult )
		if modalResult == 1 then
			Engine.SetGroupEmblem( controller )
			return true
		else
			
		end
	end )
end

function SetGroupSocialMenuFrameToMembers( self, element, controller )
	CoD.perController[controller].selectedGroup = element.model
	local groupId = Engine.GetModelValue( Engine.GetModel( element.model, "groupId" ) )
	local groupBufferType = Engine.GetModelValue( Engine.GetModel( element.model, "groupBufferType" ) )
	Engine.SetSelectedGroup( controller, groupBufferType, groupId )
	GroupsSocialChangeTabFrameWidget( self, element, controller, "members" )
end

function SetGroupsNotifyPopupTitleAndDescription( controller, title, description )
	if title then
		Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "groups.notificationTitle" ), title )
	end
	if description then
		Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "groups.notificationMessage" ), description )
	end
end

function OpenGroupHeadquarters( self, element, controller )
	if not IsGroupMember( element, controller ) then
		if element:getModel() and element:getModel( controller, "privacy" ) and Engine.GetModelValue( element:getModel( controller, "privacy" ) ) == Enum.GroupPrivacy.GROUP_PRIVACY_PRIVATE then
			SetGroupsNotifyPopupTitleAndDescription( controller, Engine.Localize( "GROUPS_NOTICE" ), Engine.Localize( "GROUPS_CANNOT_JOIN_PRIVATE_GROUP" ) )
			OpenGroupsNotifyPopup( self, element, controller )
		else
			ProcessJoinSelectedGroup( self, element, controller )
		end
	else
		CoD.perController[controller].selectedGroup = element.model
		local groupId = Engine.GetModelValue( Engine.GetModel( element.model, "groupId" ) )
		local groupBufferType = Engine.GetModelValue( Engine.GetModel( element.model, "groupBufferType" ) )
		Engine.SetSelectedGroup( controller, groupBufferType, groupId )
		local menu = self:getParentMenu()
		NavigateToMenu( menu, "GroupHeadquarters", true, controller )
	end
end

function UpdateSelectedGroupInfo( self, element, controller )
	Engine.SetSelectedGroupType( controller, Engine.GetModelValue( Engine.GetModel( CoD.perController[controller].selectedGroup, "privacy" ) ) )
	Engine.SetSelectedGroupJoinApprovalType( controller, Engine.GetModelValue( Engine.GetModel( CoD.perController[controller].selectedGroup, "joinApprovalType" ) ) )
	Engine.UpdateSelectedGroupProfile( controller )
end

function SetSelectedGroup( self, element, controller )
	if element and element:getModel() and element.model then
		CoD.perController[controller].selectedGroup = element.model
		local groupId = Engine.GetModelValue( Engine.GetModel( element.model, "groupId" ) )
		local groupBufferType = Engine.GetModelValue( Engine.GetModel( element.model, "groupBufferType" ) )
		Engine.SetSelectedGroup( controller, groupBufferType, groupId )
		Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetModelForController( controller ), "groups.selectedGroup" ) )
	end
end

function ClearSelectedGroup( self, element, controller )
	CoD.perController[controller].selectedGroup = nil
	Engine.ClearSelectedGroup()
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetModelForController( controller ), "groups.selectedGroup" ) )
end

function SetGroupHeadquarterTabName( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local groupsModel = Engine.CreateModel( perControllerModel, "groups" )
	local groupHqTabName = Engine.CreateModel( groupsModel, "grouphqtabname" )
	Engine.SetModelValue( groupHqTabName, element.tabId )
end

function SearchGroups( self, element, controller )
	
end

function InitializeGroups( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local groupsModel = Engine.CreateModel( perControllerModel, "groups" )
	Engine.CreateModel( groupsModel, "processingTask" )
	Engine.CreateModel( groupsModel, "grouphqtabname" )
	Engine.CreateModel( groupsModel, "createGroup" )
	local leaderboardMakerModel = Engine.CreateModel( groupsModel, "leaderboardmaker" )
	Engine.CreateModel( leaderboardMakerModel, "startingState" )
	Engine.CreateModel( leaderboardMakerModel, "state" )
	Engine.CreateModel( leaderboardMakerModel, "lbIndex" )
	Engine.CreateModel( leaderboardMakerModel, "lbSortColumn" )
	Engine.CreateModel( leaderboardMakerModel, "lbTimeFrame" )
	Engine.CreateModel( groupsModel, "notificationTitle" )
	Engine.CreateModel( groupsModel, "notificationMessage" )
	Engine.CreateModel( groupsModel, "notificationError" )
end

function OpenCreateGroupMenu( self, element, controller )
	local menu = self:getParentMenu()
	NavigateToMenu( menu, "CreateGroup", true, controller )
end

function BlockPublishedContent( self, element, controller )
	element.gridInfoTable.parentGrid.menu:OpenModalDialog( self, controller, "GROUPS_BLOCK_PUBLISHED_CONTENT_CAPS", "GROUPS_BLOCK_PUBLISHED_CONTENT_MESSAGE", {
		"GROUPS_BLOCK_PUBLISHED_CONTENT_CANCEL_CAPS",
		"GROUPS_BLOCK_PUBLISHED_CONTENT_OK_CAPS"
	}, function ( modalResult )
		if modalResult == 1 then
			local groupId = Engine.GetModelValue( Engine.GetModel( CoD.perController[controller].selectedGroup, "groupId" ) )
			local xuid = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "Social.selectedFriendXUID" ) )
		end
		return true
	end )
end

function RemoveFromGroup( self, element, controller )
	element.gridInfoTable.parentGrid.menu:OpenModalDialog( self, controller, "GROUPS_REMOVE_FROM_GROUP_CAPS", "GROUPS_REMOVE_FROM_GROUP_MESSAGE", {
		"GROUPS_REMOVE_FROM_GROUP_CANCEL_CAPS",
		"GROUPS_REMOVE_FROM_GROUP_OK_CAPS"
	}, function ( modalResult )
		if modalResult == 1 then
			local groupId = Engine.GetModelValue( Engine.GetModel( CoD.perController[controller].selectedGroup, "groupId" ) )
			local xuid = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "Social.selectedFriendXUID" ) )
			Engine.KickGroupMember( controller, groupId, xuid )
			OpenGroupsNotifyPopup( REG3, element, controller, true, "fetch_group_members_task_complete", function ()
				GoBack( REG3, controller )
			end, true )
		end
		return true
	end )
end

function BanFromGroup( self, element, controller )
	element.gridInfoTable.parentGrid.menu:OpenModalDialog( self, controller, "GROUPS_BAN_FROM_GROUP_CAPS", "GROUPS_BAN_FROM_GROUP_MESSAGE", {
		"GROUPS_BAN_FROM_GROUP_CANCEL_CAPS",
		"GROUPS_BAN_FROM_GROUP_OK_CAPS"
	}, function ( modalResult )
		if modalResult == 1 then
			local groupId = Engine.GetModelValue( Engine.GetModel( CoD.perController[controller].selectedGroup, "groupId" ) )
			local xuid = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "Social.selectedFriendXUID" ) )
			Engine.BanGroupMember( controller, groupId, xuid )
			OpenGroupsNotifyPopup( REG3, element, controller, true, "fetch_group_members_task_complete", function ()
				GoBack( REG3, controller )
			end, true )
		end
		return true
	end )
end

function OpenGroupSelector( self, element, controller )
	OpenPopup( self, "GroupSelectPopup", controller )
end

function InviteToGroup( self, element, controller )
	local groupId = element.groupId
	local inviteSent = element.inviteSent
	if not inviteSent then
		local xuid = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "Social.selectedFriendXUID" ) )
		Engine.SendGroupInvite( controller, groupId, xuid )
		OpenGroupsNotifyPopup( self, element, controller, true, "refreshOutgoingInvites", function ()
			CoD.OverlayUtility.ShowToast( "Invite", Engine.Localize( "MENU_INVITE_SENT" ), "", LuaDefine.INVITE_TOAST_POPUP_ICON )
		end, true )
	end
	return true
end

function InitializeCreateGroup( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local createGroupModel = Engine.GetModel( perControllerModel, "groups.createGroup" )
	Engine.SetModelValue( Engine.CreateModel( createGroupModel, "name" ), "" )
	Engine.SetModelValue( Engine.CreateModel( createGroupModel, "default_name" ), Engine.LocalizeWithoutLocsMarkers( "GROUPS_DEFAULT_NAME" ) )
	Engine.SetModelValue( Engine.CreateModel( createGroupModel, "privacy" ), Enum.GroupPrivacy.GROUP_PRIVACY_PUBLIC )
	Engine.SetModelValue( Engine.CreateModel( createGroupModel, "description" ), "" )
	Engine.SetModelValue( Engine.CreateModel( createGroupModel, "default_description" ), Engine.LocalizeWithoutLocsMarkers( "GROUPS_DEFAULT_DESCRIPTION" ) )
	Engine.SetModelValue( Engine.CreateModel( createGroupModel, "emblem" ), "uie_t7_medal_baked" )
	Engine.SetModelValue( Engine.CreateModel( createGroupModel, "tooltip_title" ), "" )
	Engine.SetModelValue( Engine.CreateModel( createGroupModel, "tooltip_description" ), "" )
	Engine.SetModelValue( Engine.CreateModel( createGroupModel, "friends_invited_count" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( createGroupModel, "friends_count" ), 0 )
	Engine.CreateModel( createGroupModel, "createdGroupId" )
	Engine.ExecNow( controller, "emblemgetprofile" )
	Engine.SetGroupEmblemForGroupCreation( controller )
end

function CreateNewGroupFlow( self, element, controller )
	InitializeCreateGroup( self, element, controller )
	OpenCreateGroupMenu( self, element, controller )
end

function CancelCreateGroup( self, element, controller, menu )
	menu:OpenModalDialog( self, controller, "GROUPS_CANCEL_GROUP_CREATION_TITLE", "GROUPS_CANCEL_GROUP_CREATION_SUBTITLE", {
		"MENU_NO_CAPS",
		"MENU_YES_CAPS"
	}, function ( modalResult )
		if modalResult == 1 then
			GoBack( menu, controller )
		end
		return true
	end )
end

function ProcessCreateGroup( self, element, controller )
	if ValidateCreateGroupInformation( self, element, controller ) then
		CreateGroup( self, element, controller )
	end
end

function InviteSelectedFriendsToGroup( self, element, controller, booleanArg )
	local inviteSelectedFriendsToGroup = booleanArg
	local createdGroupIdModel = Engine.GetModel( Engine.GetModelForController( controller ), "groups.createGroup.createdGroupId" )
	if inviteSelectedFriendsToGroup and createdGroupIdModel then
		Engine.SendGroupBatchInvites( controller, Engine.GetModelValue( createdGroupIdModel ) )
	end
	local groupsMenu = GoBackToMenu( self, controller, "Groups" )
	OpenGenericSmallPopup( groupsMenu, controller, "GROUPS_SUCCESS_CAPS", "GROUPS_CREATE_SUCCESS_MESSAGE", nil, "MENU_OK", nil, nil )
end

function CreateGroup( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local name = Engine.GetModelValue( Engine.GetModel( perControllerModel, "groups.createGroup.name" ) )
	local description = Engine.GetModelValue( Engine.GetModel( perControllerModel, "groups.createGroup.description" ) )
	local privacy = Engine.GetModelValue( Engine.GetModel( perControllerModel, "groups.createGroup.privacy" ) )
	local emblem = Engine.GetModelValue( Engine.GetModel( perControllerModel, "groups.createGroup.emblem" ) )
	Engine.CreateGroup( controller, name, description, privacy, emblem )
	OpenGroupsNotifyPopup( self, element, controller, true, "create_group_task_complete", function ( self, element, controller )
		local numFriends = Engine.GetFriendsCount( controller, 0 )
		if Engine.GetModelValue( Engine.GetModel( perControllerModel, "groups.notificationError" ) ) then
			OpenGroupsNotifyPopup( self, element, controller )
		elseif numFriends > 0 then
			NavigateToMenu( self, "GroupInviteFriends", false, controller )
		else
			local groupsMenu = GoBackToMenu( self, controller, "Groups" )
			OpenGenericSmallPopup( groupsMenu, controller, "GROUPS_SUCCESS_CAPS", "GROUPS_CREATE_SUCCESS_MESSAGE", nil, "MENU_OK", nil, nil )
		end
	end, true )
end

function SetGroupLeaderboardInfo( controller, leaderboardIndex, sortColumnIndex, timeFrameIndex, hardcore )
	local selectedGroupModel = CoD.perController[controller].selectedGroup
	if not selectedGroupModel then
		return 
	else
		Engine.SetGroupLeaderboardInfo( controller, leaderboardIndex, sortColumnIndex, timeFrameIndex, hardcore )
		Engine.SetModelValue( Engine.GetModel( selectedGroupModel, "lbIndex" ), leaderboardIndex )
		Engine.SetModelValue( Engine.GetModel( selectedGroupModel, "lbSortColumn" ), sortColumnIndex )
		Engine.SetModelValue( Engine.GetModel( selectedGroupModel, "lbTimeFrame" ), timeFrameIndex )
		Engine.SetModelValue( Engine.GetModel( selectedGroupModel, "lbHardcore" ), hardcore )
		Engine.SetModelValue( Engine.GetModel( selectedGroupModel, "lbInitialized" ), true )
	end
end

function SetDefaultCareerLeaderboard( self, element, controller )
	local leaderboardIndex = CoD.Leaderboard_MP.GetLeaderboardIndex( "CAREER" )
	local sortColumnIndex = CoD.Leaderboard_MP.GetSortColumnIndex( leaderboardIndex, "SPM" )
	local timeFrameIndex = Enum.LbTrackType.LB_TRK_ALLTIME
	local hardcore = false
	SetGroupLeaderboardInfo( controller, leaderboardIndex, sortColumnIndex, timeFrameIndex, hardcore )
	DataSources.LeaderboardHeader.getModel( controller )
	if self.UpdateNavigation then
		self:UpdateNavigation( controller )
	end
end

function OpenLeaderboardMaker( self, element, controller, startingState )
	if startingState == nil then
		error( "OpenLeaderboardMaker(): Invalid starting state specified" )
		return 
	else
		local perControllerModel = Engine.GetModelForController( controller )
		Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.startingState" ), startingState )
		Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.state" ), startingState )
		local menu = self:getParentMenu()
		menu:openPopup( "LeaderboardMaker", controller )
	end
end

function ProcessRemoveGroupLeaderboard( self, element, controller )
	self:OpenModalDialog( element, "GROUPS_REMOVE_LEADERBOARD_CONFIRMATION_TITLE", "GROUPS_REMOVE_LEADERBOARD_CONFIRMATION_SUBTITLE", {
		"MPUI_NO",
		"MPUI_YES"
	}, function ( modalResult )
		if modalResult == 1 then
			SetGroupLeaderboardInfo( controller, 0, 0, 0, false )
			GoBack( self, controller )
			return true
		else
			
		end
	end )
end

function ProcessLeaderboardMakerBack( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local startingState = Engine.GetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.startingState" ) )
	local stateModel = Engine.GetModel( perControllerModel, "groups.leaderboardmaker.state" )
	local state = Engine.GetModelValue( stateModel )
	if state == startingState or state == "SelectAction" then
		Engine.SetModelValue( stateModel, "" )
		GoBack( self, controller )
	elseif state == "ChooseBaseLeaderboard" then
		Engine.SetModelValue( stateModel, "SelectAction" )
	elseif state == "ChooseDefaultSort" then
		Engine.SetModelValue( stateModel, "ChooseBaseLeaderboard" )
	elseif state == "ChooseTimeFrame" then
		Engine.SetModelValue( stateModel, "ChooseDefaultSort" )
	end
end

function ProcessEditGroupLeaderboard( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.state" ), "ChooseBaseLeaderboard" )
end

function ProcessChooseBaseLeaderboard( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local leaderboardIndex = CoD.Leaderboard_MP.GetLeaderboardIndex( element.btnId )
	Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.lbIndex" ), leaderboardIndex )
	Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.state" ), "ChooseDefaultSort" )
end

function ProcessChooseDefaultSort( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local leaderboardIndex = Engine.GetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.lbIndex" ) )
	local sortColumnIndex = CoD.Leaderboard_MP.GetSortColumnIndex( leaderboardIndex, element.btnId )
	Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.lbSortColumn" ), sortColumnIndex )
	Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.state" ), "ChooseTimeFrame" )
end

function ProcessChooseTimeFrame( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local leaderboardIndex = Engine.GetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.lbIndex" ) )
	local sortColumnIndex = Engine.GetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.lbSortColumn" ) )
	local isHardcore = false
	local timeFrameData = CoD.Leaderboard_MP.GetTimeFrameDataFromName( element.btnId )
	local timeFrameValue = timeFrameData.value
	Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.lbTimeFrame" ), timeFrameValue )
	SetGroupLeaderboardInfo( controller, leaderboardIndex, sortColumnIndex, timeFrameValue, isHardcore )
	local leaderboardDefName = CoD.Leaderboard_MP.GetLeaderboardDefName( leaderboardIndex, sortColumnIndex, isHardcore )
	Engine.LoadLeaderboard( leaderboardDefName, timeFrameValue )
	DataSources.LeaderboardRows.refresh( controller )
	SetGroupsNotifyInformation( controller, Engine.Localize( "GROUPS_CONGRATULATIONS_CAPS_TITLE" ), Engine.Localize( "GROUPS_LBMAKER_UPDATE_SUCCESS" ), false )
	OpenGroupsNotifyPopup( self, element, controller, false )
	Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.leaderboardmaker.state" ), "" )
end

function JoinSessionInProgressOnGroupMember( self, element, controller )
	local menu = GoBack( self, controller )
	GoBack( menu, controller )
	LobbyQuickJoin( menu, element, controller, Enum.JoinType.JOIN_TYPE_FRIEND, false )
end

function LoadLeaderboard( self, controller )
	local isDOALeaderboard = IsDOALeaderboard( controller )
	local isZMMaps = IsZMMapsLeaderboard( controller )
	local isLobbyLeaderboard = IsLobbyLeaderboard( controller )
	if not CoD.perController[controller].leaderboardPlayerFilter then
		local filter = Enum.LbFilter.LB_FILTER_FRIENDS
	end
	local f977_local0 = CoD.perController[controller].leaderboardZMMapsNumPlayersFilter
	if not f977_local0 then
		local zmMapsNumPlayers = CoD.LeaderboardUtility.DEFAULT_ZM_MAPS_NUM_PLAYERS
	end
	local f977_local1 = CoD.perController[controller].leaderboardDOANumPlayersFilter
	if not f977_local1 then
		local doaNumPlayers = CoD.LeaderboardUtility.DEFAULT_DOA_NUM_PLAYERS
	end
	CoD.perController[controller].pivotPosition = nil
	local leaderboardDef = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "leaderboardDef" ) )
	local leaderboardInfo = CoD.LeaderboardUtility.leaderboardInfo[leaderboardDef]
	local trackType = CoD.perController[controller].leaderboardDurationFilter
	local f977_local2 = LUI.startswith( leaderboardDef, "LB_CP_DOA_BO3_SCORE" )
	if not f977_local2 then
		local showDOAPlayerNumFilter = LUI.startswith( leaderboardDef, "LB_CP_DOA_BO3_ROUND" )
	end
	if isZMMaps then
		leaderboardDef = leaderboardDef .. "_" .. tostring( f977_local0 ) .. "PLAYER"
	end
	if isDOALeaderboard and f977_local1 > CoD.LeaderboardUtility.DEFAULT_DOA_NUM_PLAYERS and f977_local2 then
		leaderboardDef = leaderboardDef .. "_" .. tostring( f977_local1 ) .. "PLAYER"
	end
	if isLobbyLeaderboard then
		local f977_local3 = Enum.LbFilter.LB_FILTER_LOBBY_MEMBERS
	end
	local trackTypeValid = false
	for index, validTrackType in ipairs( leaderboardInfo.trackTypes ) do
		if trackType == validTrackType then
			trackTypeValid = true
			break
		end
	end
	if trackTypeValid == false then
		trackType = leaderboardInfo.trackTypes[1]
	end
	if not Dvar.ui_hideLeaderboards:get() then
		local leaderboardLoaded = Engine.LoadLeaderboard( leaderboardDef, trackType )
		if leaderboardLoaded == true then
			DataSources.LeaderboardRows.refresh( controller )
		end
	end
	local playerFilterString = CoD.LeaderboardUtility.GetPlayerFilterString( f977_local3 )
	local durationFilterString = CoD.LeaderboardUtility.GetDurationFilterString( trackType )
	local filterInfoString = ""
	if isZMMaps then
		local zmMapsFilterString = CoD.LeaderboardUtility.GetZMMapsNumPlayersFilterString( f977_local0 )
		filterInfoString = Engine.Localize( "MPUI_X_SLASH_Y", zmMapsFilterString, playerFilterString )
	elseif isLobbyLeaderboard then
		filterInfoString = Engine.Localize( durationFilterString )
	elseif #leaderboardInfo.trackTypes > 1 then
		filterInfoString = Engine.Localize( "MPUI_X_SLASH_Y", playerFilterString, durationFilterString )
	elseif isDOALeaderboard and f977_local2 then
		local doaFilterString = CoD.LeaderboardUtility.GetDOANumPlayersFilterString( f977_local1 )
		filterInfoString = Engine.Localize( "MPUI_X_SLASH_Y", doaFilterString, playerFilterString )
	else
		filterInfoString = Engine.Localize( playerFilterString )
	end
	SetGlobalModelValue( "FilterInfo", filterInfoString )
end

function Leaderboard_SetLeaderboardDef( self, element, controller )
	local leaderboardDef = Engine.GetModelValue( Engine.GetModel( element:getModel(), "lbDef" ) )
	SetGlobalModelValue( "leaderboardDef", leaderboardDef )
end

function Leaderboard_PageUp( self, element, controller )
	if CoD.perController[controller].leaderboardPlayerFilter == Enum.LbFilter.LB_FILTER_NONE then
		Leaderboard_PageUp_All( self, element, controller )
	else
		Leaderboard_PageUp_Friends( self, element, controller )
	end
end

function Leaderboard_PageDown( self, element, controller )
	if CoD.perController[controller].leaderboardPlayerFilter == Enum.LbFilter.LB_FILTER_NONE then
		Leaderboard_PageDown_All( self, element, controller )
	else
		Leaderboard_PageDown_Friends( self, element, controller )
	end
end

function Leaderboard_GoToTopOfList( self, element, controller )
	if CoD.perController[controller].leaderboardPlayerFilter == Enum.LbFilter.LB_FILTER_NONE then
		Leaderboard_GoToTopOfList_All( self, element, controller )
	else
		Leaderboard_GoToTopOfList_Friends( self, element, controller )
	end
end

function Leaderboard_UpdateHeaderModel( self, controller )
	local leaderboardHeader = self.LeaderboardHeader
	if not leaderboardHeader then
		return 
	end
	DataSources.LeaderboardHeader.getModel( controller )
	if leaderboardHeader.linkedElementModels then
		for index, elementTable in ipairs( leaderboardHeader.linkedElementModels ) do
			elementTable.element:updateElementLinkedModels( leaderboardHeader )
		end
	end
end

function Leaderboard_ApplyFilters( self, controller )
	local f983_local0 = CoD.perController[controller].leaderboardPlayerFilter == CoD.perController[controller].leaderboardPlayerFilterTemp
	local f983_local1 = CoD.perController[controller].leaderboardDurationFilter == CoD.perController[controller].leaderboardDurationFilterTemp
	local sameZMMapsNumPlayerFilter = true
	local sameDOANumPlayerFilter = true
	if IsZMMapsLeaderboard( controller ) then
		sameZMMapsNumPlayerFilter = CoD.perController[controller].leaderboardZMMapsNumPlayersFilter == CoD.perController[controller].leaderboardZMMapsNumPlayersFilterTemp
	end
	if IsDOALeaderboard( controller ) then
		sameDOANumPlayerFilter = CoD.perController[controller].leaderboardDOANumPlayersFilter == CoD.perController[controller].leaderboardDOANumPlayersFilterTemp
	end
	if f983_local0 and f983_local1 and sameZMMapsNumPlayerFilter and sameDOANumPlayerFilter then
		return 
	else
		CoD.perController[controller].leaderboardPlayerFilter = CoD.perController[controller].leaderboardPlayerFilterTemp
		CoD.perController[controller].leaderboardDurationFilter = CoD.perController[controller].leaderboardDurationFilterTemp
		CoD.perController[controller].leaderboardZMMapsNumPlayersFilter = CoD.perController[controller].leaderboardZMMapsNumPlayersFilterTemp
		CoD.perController[controller].leaderboardDOANumPlayersFilter = CoD.perController[controller].leaderboardDOANumPlayersFilterTemp
		LoadLeaderboard( self, controller )
	end
end

function Leaderboard_OpenPlayerDetails( self, element, controller )
	Leaderboard_SetSelectedFriendXUID( self, element, controller )
	OpenOverlay( self, "Social_PlayerDetailsPopup", controller )
end

function Leaderboard_SetSelectedFriendXUID( self, element, controller )
	if not element:getModel() then
		return 
	else
		local gamertag = Engine.GetModelValue( Engine.GetModel( element:getModel(), "name" ) )
		local xuid = Engine.GetModelValue( Engine.GetModel( element:getModel(), "xuid" ) )
		local playerInfo = Engine.GetPlayerInfo( controller, xuid )
		local controllerModel = Engine.GetModelForController( controller )
		local selectedFriendModel = Engine.CreateModel( controllerModel, "Social.selectedFriendXUID" )
		Engine.SetModelValue( selectedFriendModel, xuid )
		local selectedFriendGamertagModel = Engine.CreateModel( controllerModel, "Social.selectedFriendGamertag" )
		Engine.SetModelValue( selectedFriendGamertagModel, gamertag )
	end
end

function LeaderboardEnablePCacheBuffer( self, element, controller )
	local millisecondsUntilSetVisible = 250
	element.setVisibleTimer = LUI.UITimer.newElementTimer( millisecondsUntilSetVisible, true, function ()
		local parent = self:getParent()
		local playerProfileInfoWidget = self.PlayerProfileInfoWidget
		while parent and not playerProfileInfoWidget do
			playerProfileInfoWidget = parent.PlayerProfileInfoWidget
			parent = parent:getParent()
		end
		if playerProfileInfoWidget then
			playerProfileInfoWidget:setState( "Visible" )
		end
		local xuidModel = element:getModel( controller, "xuid" )
		if xuidModel then
			local xuid = Engine.GetModelValue( xuidModel )
			element:setupPlayerBackgroundIdUpdateByXUID( xuid )
		end
		element.setVisibleTimer = nil
	end )
	element:addElement( element.setVisibleTimer )
end

function LeaderboardDisablePCacheBuffer( self, element, controller )
	element:disablePlayerBackgroundIdUpdate()
	if element.setVisibleTimer then
		element.setVisibleTimer:close()
		element.setVisibleTimer = nil
	end
	local parent = self:getParent()
	local playerProfileInfoWidget = self.PlayerProfileInfoWidget
	while parent and not playerProfileInfoWidget do
		playerProfileInfoWidget = parent.PlayerProfileInfoWidget
		parent = parent:getParent()
	end
	if playerProfileInfoWidget then
		playerProfileInfoWidget:setState( "PCacheBuffer" )
	end
end

function SpectateSelectedPlayer( self, element, controller )
	local clientNum = Engine.GetModelValue( Engine.GetModel( element:getModel(), "clientNum" ) )
	Engine.SendMenuResponse( controller, "spectate", clientNum )
end

function SetShoutcastHighlightedPlayer( self, element, controller )
	local clientNum = Engine.GetModelValue( Engine.GetModel( element:getModel(), "clientNum" ) )
	Dvar.shoutcastHighlightedClient:set( clientNum )
end

function ToggleCodCasterQuickSettings( self, element, controller )
	if not element.profileVar then
		return 
	end
	local value = CoD.ShoutcasterProfileVarBool( controller, element.profileVar )
	if not value then
		CoD.SetShoutcasterProfileVarValue( controller, element.profileVar, 1 )
	else
		CoD.SetShoutcasterProfileVarValue( controller, element.profileVar, 0 )
	end
	Engine.SetModelValue( Engine.GetModel( element:getModel(), "profileVarValue" ), CoD.ShoutcasterProfileVarBool( controller, element.profileVar ) )
	if Engine.IsInGame() and element.profileVar == "shoutcaster_qs_thirdperson" then
		Engine.ExecNow( controller, "shoutcaster_thirdperson " .. CoD.ShoutcasterProfileVarValue( controller, element.profileVar ) )
	end
end

function SetCodCasterProfileValue( self, element, controller, profileVar, value )
	CoD.SetShoutcasterProfileVarValue( controller, profileVar, value )
end

function AdjustShoutcasterTeam( self, element, controller, value )
	local teams = CoD.TeamUtility.GetTeams()
	local currentTeam = CoD.ShoutcasterProfileVarValue( controller, "shoutcaster_team" )
	local teamIndex = 0
	for index, teamID in pairs( teams ) do
		if teamID == currentTeam then
			teamIndex = index - 1
			break
		end
	end
	local newTeamIndex = (teamIndex + value) % #teams
	local newTeam = teams[newTeamIndex + 1]
	if newTeam then
		CoD.SetShoutcasterProfileVarValue( controller, "shoutcaster_team", newTeam )
	end
end

function HandleTeamIdentityKeyboardComplete( self, element, controller, event )
	local model, profileVarName = nil
	local team = Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( controller ), "team" ) )
	local teamIdentityInformationModel = DataSources.TeamIdentityInformation.getModel( controller, team )
	if event.type == Enum.KeyboardType.KEYBOARD_TYPE_TEAM_IDENTITY_TEAMNAME then
		model = Engine.GetModel( teamIdentityInformationModel, "teamName" )
		profileVarName = "shoutcaster_fe_" .. team .. "_name"
	end
	if model then
		Engine.SetModelValue( model, event.input )
		CoD.SetShoutcasterProfileVarValue( controller, profileVarName, event.input )
	end
end

function SetTeamIdentityProfileValue( self, element, controller, key )
	if not key or key == "" then
		return 
	else
		local idModel = Engine.GetModel( element:getModel(), "id" )
		if not idModel then
			return 
		else
			local team = Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( controller ), "team" ) )
			local id = Engine.GetModelValue( idModel )
			local profileVarName = "shoutcaster_fe_" .. team .. "_" .. key
			CoD.SetShoutcasterProfileVarValue( controller, profileVarName, id )
		end
	end
end

function SetTeamIdentityTeamLogo( self, element, controller )
	local team = Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( controller ), "team" ) )
	local teamIdentityInformationModel = DataSources.TeamIdentityInformation.getModel( controller, team )
	local teamLogo = Engine.GetModelValue( Engine.GetModel( element:getModel(), "ref" ) )
	local teamLogoName = Engine.GetModelValue( Engine.GetModel( element:getModel(), "name" ) )
	Engine.SetModelValue( Engine.GetModel( teamIdentityInformationModel, "teamLogo" ), teamLogo )
	Engine.SetModelValue( Engine.GetModel( teamIdentityInformationModel, "teamLogoName" ), teamLogoName )
end

function SetTeamIdentityTeamColor( self, element, controller )
	local team = Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( controller ), "team" ) )
	local teamIdentityInformationModel = DataSources.TeamIdentityInformation.getModel( controller, team )
	local teamColor = Engine.GetModelValue( Engine.GetModel( element:getModel(), "color" ) )
	Engine.SetModelValue( Engine.GetModel( teamIdentityInformationModel, "teamColor" ), teamColor )
end

function UpdateSelectedTeamIdentityColorElement( self, element, controller )
	local team = Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( controller ), "team" ) )
	local profileVarName = "shoutcaster_fe_" .. team .. "_color"
	local previousSelectedColorIndex = CoD.ShoutcasterProfileVarValue( controller, profileVarName )
	local newSelectedColorIndex = Engine.GetModelValue( Engine.GetModel( element:getModel(), "id" ) )
	local previousSelectedElement = self.TeamColorList:findItem( {
		id = previousSelectedColorIndex
	} )
	if previousSelectedElement then
		local selectedModel = Engine.GetModel( previousSelectedElement:getModel(), "selected" )
		Engine.SetModelValue( selectedModel, false )
	end
	Engine.SetModelValue( Engine.GetModel( element:getModel(), "selected" ), true )
end

function SaveShoutcasterSettings( self, element, controller )
	Engine.StorageWrite( controller, Enum.StorageFileType.STORAGE_PROFILE_SHOUTCASTER )
end

function ChangeAbilityWheelItems( controller, menu, expressionArg )
	local typeModel = Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.cybercomRequestedType" )
	local typeModelValue = Engine.GetModelValue( typeModel )
	local newType = (typeModelValue + expressionArg + 3) % 3
	Engine.SetModelValue( typeModel, newType )
	DataSources.AbilityWheel.getModel( controller )
	menu.updateButtonStates( nil, newType + 1 )
end

function SetFileShareOverrideXuid( self, element, controller )
	local xuidModel = element:getModel( controller, "xuid" )
	if xuidModel ~= nil then
		local xuid = Engine.GetModelValue( xuidModel )
		Dvar.fshRecentsXUID:set( xuid )
		OpenGenericSmallPopup( self, controller, "Theater Player Overriden", "You will now be able to view fileshare as " .. tostring( xuid ), nil, "MENU_OK" )
	end
end

function OpenCODPointsIntro( self, element, controller )
	local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if Engine.GetInventoryItemQuantity( controller, Dvar.initial_cod_points_id:get() ) > 0 and stats and stats.codPointMsgSeen:get() == 0 then
		CoD.OverlayUtility.CreateOverlay( controller, self, "InitialCODPointsOverlay" )
	end
end

function OpenBlackMarket( self, element, controller )
	if Engine.PushAnticheatMessageToUI( controller, LuaEnum.ANTICHEAT_MESSAGE_GROUPS.LOOT ) then
		DisplayAnticheatMessage( self, controller, LuaEnum.ANTICHEAT_MESSAGE_GROUPS.LOOT, "", "" )
		return 
	end
	for i = 0, LuaDefine.MAX_CONTROLLER_COUNT - 1, 1 do
		if CheckIfFeatureIsBanned( i, LuaEnum.FEATURE_BAN.LOOT ) then
			LuaUtils.UI_ShowErrorMessageDialog( controller, GetFeatureBanInfo( i, LuaEnum.FEATURE_BAN.LOOT ) )
			return 
		end
	end
	OpenOverlay( self, "BlackMarket", controller )
end

function OpenPCQuit( self, element, controller )
	if CoD.isPC then
		CoD.OverlayUtility.CreateOverlay( controller, self, "QuitPCGamePopup" )
	end
end

function OpenPCResetControlsPopup( self, element, controller )
	if CoD.isPC then
		CoD.OverlayUtility.CreateOverlay( controller, self, "ResetPCControls" )
	end
end

function ResetPCControlsToDefault( self, element, controller )
	if Dvar.ui_execdemo_gamescom:get() then
		Engine.ExecNow( controller, "resetprofilecommon" )
		Engine.ExecNow( controller, "updategamerprofile" )
		Engine.ExecNow( controller, "storagereset stats_mp_offline" )
	end
	Engine.SetProfileVar( controller, "input_invertpitch", 0 )
	Engine.SetProfileVar( controller, "gpad_rumble", 1 )
	Engine.SetProfileVar( controller, "gpad_sticksConfig", Enum.GPadStickConfigs.THUMBSTICK_DEFAULT )
	Engine.SetProfileVar( controller, "gpad_buttonsConfig", Enum.GPadButtonConfigs.BUTTONS_DEFAULT )
	Engine.SetProfileVar( controller, "input_viewSensitivity", CoD.OptionsUtility.SENSITIVITY_2 )
	Engine.SetProfileVar( controller, "input_viewSensitivityHorizontal", CoD.OptionsUtility.SENSITIVITY_2 )
	Engine.SetProfileVar( controller, "input_viewSensitivityVertical", CoD.OptionsUtility.SENSITIVITY_2 )
	Engine.SetProfileVar( controller, "mouseSensitivity", 5 )
	Engine.ExecNow( controller, "defaultbindings" )
	Engine.ExecNow( controller, "execcontrollerbindings" )
	Engine.SyncHardwareProfileWithDvars()
	self:dispatchEventToRoot( {
		name = "options_refresh",
		controller = controller
	} )
end

function OpenPCApplyGraphicsPopup( self, element, controller )
	if CoD.isPC then
		CoD.OverlayUtility.CreateOverlay( controller, self, "ApplyPCGraphics" )
	end
end

function ApplyPCGraphicsOptions( self, element, controller )
	Engine.ApplyHardwareProfileSettings()
	local textureQuality = tonumber( Engine.GetHardwareProfileValueAsString( "r_picmip" ) )
	Engine.SetTextureQuality( textureQuality )
	Engine.SetShadowQuality( CoD.PCUtil.ShadowOptionIndex )
	Engine.SetVolumetricQuality( CoD.PCUtil.VolumetricOptionIndex )
	Engine.SyncHardwareProfileWithDvars()
	Engine.SaveHardwareProfile()
	Engine.Exec( nil, "vid_restart" )
end

function OpenPCResetGraphics( self, element, controller )
	if CoD.isPC then
		CoD.OverlayUtility.CreateOverlay( controller, self, "ResetPCGraphics" )
	end
end

function ResetPCGraphicsOptions( self, element, controller )
	Engine.ResetHardwareProfileSettings()
	CoD.PCUtil.ShadowOptionIndex = Engine.GetShadowQuality()
	CoD.PCUtil.VolumetricOptionIndex = Engine.GetVolumetricQuality()
	Engine.Exec( nil, "vid_restart" )
	CoD.PCUtil.RefreshAllOptions( element, controller )
end

function HideIfUsingMouse( element, event )
	if CoD.isPC then
		if Engine.LastInput_Gamepad() then
			element:setAlpha( 1 )
		else
			element:setAlpha( 0 )
		end
	end
end

function ToggleDropDownListInUse( self, controller )
	self.inUse = not self.inUse
	if self.DropDownList then
		MakeFocusable( self.DropDownList )
		SetFocusToElement( self, "DropDownList", controller )
	end
end

function SetVerticaListSpacerHeight( self, model )
	if model then
		local height = Engine.GetModelValue( model )
		if height then
			self:setTopBottom( true, false, 0, height )
		end
	end
end

function ToggleMouse( self, controller )
	self:toggleMouse()
end

function ToggleHandleMouse( self, controller )
	self:toggleHandleMouse()
end

function EnableMouseButton( self, controller )
	self:setHandleMouseButton( true )
end

function DisableMouseButton( self, controller )
	self:setHandleMouseButton( false )
end

function ToggleHandleMouseButton( self, controller )
	self:toggleHandleMouseButton( self, controller )
end

function EnableMouseMove( self, controller )
	self:setHandleMouseMove( true )
end

function DisableMouseMove( self, controller )
	self:setHandleMouseMove( false )
end

function ToggleHandleMouseMove( self, controller )
	self:toggleHandleMouseMove()
end

function EnableMouseButtonOnElement( element, controller )
	element:setHandleMouseButton( true )
end

function DisableMouseButtonOnElement( element, controller )
	element:setHandleMouseButton( false )
end

function ToggleDropdownListInUse_Console( self, controller )
	self.inUse = not self.inUse
	if self.inUse == true then
		if self.DropdownList then
			MakeFocusable( self.DropdownList )
			SetLoseFocusToElement( self, "DropdownRoot", controller )
			SetFocusToElement( self, "DropdownList", controller )
		end
	elseif self.DropdownList then
		SetState( self, "DefaultState" )
		MakeNotFocusable( self.DropdownList )
		MakeFocusable( self.DropdownRoot )
		SetLoseFocusToElement( self, "DropdownList", controller )
		SetFocusToElement( self, "DropdownRoot", controller )
	end
end

function DropDownListItemClick_Console( self, element, controller )
	
end

function Gunsmith_OpenCreateVariantNamePopup( self, element, controller )
	CoD.OverlayUtility.CreateOverlay( controller, self, "GunsmithCreateVariantNameOverlay", controller, element )
end

function Gunsmith_OpenSaveVariantPopup( self, element, controller, menu )
	CoD.OverlayUtility.CreateOverlay( controller, self, "GunsmithSaveVariant", controller, element )
end

function Gunsmith_TabChanged( self, element, controller )
	DataSources.CraftWeaponList.setCurrentFilterItem( element.filter )
	CoD.perController[controller].weaponCategory = element.filter
	self.weaponList:updateDataSource( true )
	local firstFocusable = self.weaponList:getFirstSelectableItem()
	self.weaponList:setActiveItem( firstFocusable )
	if CoD.perController[controller].gunsmithWeaponCategoryRestored == true then
		local category_index = self.tabList.Tabs.grid.activeWidget.gridInfoTable.zeroBasedIndex + 1
		CoD.SetCustomization( controller, category_index, "category_index" )
	end
end

function Gunsmith_Back( self, element, controller )
	CoD.perController[controller].gunsmithWeaponCategoryRestored = nil
	CoD.perController[controller].gunsmithWeaponListIndex = nil
	CoD.perController[controller].gunsmithAttachmentType = nil
	CoD.perController[controller].gunsmithAttachmentModel = nil
	CoD.perController[controller].gunsmithCamoIndexModel = nil
	CoD.perController[controller].gunsmithReticleIndexModel = nil
	CoD.perController[controller].gunsmithVariantModel = nil
	CoD.perController[controller].gunsmithAttachmentVariantModel = nil
	CoD.perController[controller].emptyVariantSelected = nil
	CoD.CraftUtility.Gunsmith.CachedVariants = {}
end

function Gunsmith_GainFocus( self, element, controller )
	local weaponIndex = Engine.GetModelValue( element:getModel( controller, "itemIndex" ) )
	CoD.SetCustomization( controller, weaponIndex, "weapon_index" )
	if self.tabList then
		local category_index = self.tabList.Tabs.grid.activeWidget.gridInfoTable.zeroBasedIndex + 1
		CoD.SetCustomization( controller, category_index, "category_index" )
	end
	CoD.CraftUtility.Gunsmith.DisplayBaseWeapon( self, element, controller )
	CoD.CACUtility.GunsmithWeaponOptionsTable = nil
end

function Gunsmith_ChooseWeaponList( self, element, controller )
	self:updateMode( Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST, element )
	local firstFocusable = self.variantSelector.variantList:getFirstSelectableItem()
	self.variantSelector.variantList:setActiveItem( firstFocusable )
end

function Gunsmith_BrowseVariants( self, element, controller )
	self.variantSelector.variantList:updateDataSource( true )
	self:updateMode( Enum.GunsmithMode.GUNSMITHMODE_VARIANTS, element )
	CoD.perController[controller].gunsmithWeaponListIndex = self.weaponList.activeWidget.gridInfoTable.zeroBasedIndex + 1
	CoD.perController[controller].gunsmithWeaponCategoryRestored = false
	CoD.perController[controller].gunsmithAttachmentType = "attachment"
end

function Gunsmith_HandleKeyboardComplete( self, element, controller, event )
	local selectedVariantModel = CoD.perController[controller].gunsmithVariantModel
	local variantTextEntryModel = nil
	if not selectedVariantModel then
		return 
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_GUNSMITH then
		variantTextEntryModel = Engine.GetModel( selectedVariantModel, "variantTextEntry" )
		if variantTextEntryModel then
			Engine.SetModelValue( variantTextEntryModel, event.input )
			local validVariantNameModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.validVariantNameEntered" )
			Engine.SetModelValue( validVariantNameModel, true )
		end
		local inputTextModel = self:getModel( controller, "inputText" )
		if inputTextModel then
			Engine.SetModelValue( inputTextModel, event.input )
		end
	end
end

function Gunsmith_CreateVariantNameBack( self, element, controller )
	local selectedVariantModel = self:getModel()
	local variantTextEntryModel = Engine.GetModel( selectedVariantModel, "variantTextEntry" )
	Engine.SetModelValue( variantTextEntryModel, Engine.Localize( "MENU_GUNSMITH_ENTER_VARIANT_NAME" ) )
	local validVariantNameModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.validVariantNameEntered" )
	Engine.SetModelValue( validVariantNameModel, false )
end

function Gunsmith_FocusOccupiedVariant( self, element, controller )
	CoD.perController[controller].gunsmithVariantModel = element:getModel()
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( controller, CoD.perController[controller].gunsmithVariantModel )
end

function Gunsmith_ChooseEmptyVariant( self, element, controller )
	CoD.perController[controller].gunsmithVariantModel = element:getModel()
	local validVariantNameModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.validVariantNameEntered" )
	Engine.SetModelValue( validVariantNameModel, false )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( controller, CoD.perController[controller].gunsmithVariantModel )
	CoD.perController[controller].emptyVariantSelected = true
end

function Gunsmith_EditVariant( self, element, controller )
	CoD.perController[controller].gunsmithVariantModel = element:getModel()
	CoD.perController[controller].confirmVariantNameButtonPressed = true
end

function Gunsmith_ConfirmVariantName( self, element, controller, menu )
	local selectedVariantModel = self:getModel()
	local variantTextEntry = Engine.GetModelValue( Engine.GetModel( selectedVariantModel, "variantTextEntry" ) )
	local variantNameModel = Engine.GetModel( selectedVariantModel, "variantName" )
	Engine.SetModelValue( variantNameModel, variantTextEntry )
	local baseMenu = GoBack( menu, controller )
	if baseMenu then
		CoD.perController[controller].confirmVariantNameButtonPressed = true
		baseMenu:openOverlay( "GunsmithCustomizeVariant", controller )
		local variantNameBigModel = Engine.GetModel( selectedVariantModel, "variantNameBig" )
		Engine.SetModelValue( variantNameBigModel, variantTextEntry )
	end
end

function Gunsmith_SetWeaponAttachmentType( self, element, attachmentType, attachmentNum, isZombieMode, controller )
	CoD.perController[controller].gunsmithAttachmentType = attachmentType
	CoD.perController[controller].gunsmithAttachmentIsZombieMode = isZombieMode
	CoD.perController[controller].gunsmithAttachmentModel = self:getModel( controller, "attachment" .. attachmentNum )
	CoD.perController[controller].gunsmithAttachmentVariantModel = self:getModel( controller, "attachmentVariant" .. attachmentNum )
	local attachmentTypeModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.GunsmithSelectedItemProperties.attachmentType" )
	Engine.SetModelValue( attachmentTypeModel, attachmentType )
end

function Gunsmith_ClearAttachmentSlot( self, element, attachmentNum, controller )
	local attachmentModel = self:getModel( controller, "attachment" .. attachmentNum )
	Engine.SetModelValue( attachmentModel, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
	local attachmentVariantModel = self:getModel( controller, "attachmentVariant" .. attachmentNum )
	Engine.SetModelValue( attachmentVariantModel, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
	if attachmentNum == 1 or attachmentNum == "1" then
		local reticleIndexModel = self:getModel( controller, "reticleIndex" )
		Engine.SetModelValue( reticleIndexModel, CoD.CraftUtility.Gunsmith.RETICLE_NONE )
	end
	Gunsmith_ClearItemName( controller )
	local variantModel = self:getModel()
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( controller, variantModel, true )
end

function Gunsmith_ClearCamo( self, element, controller )
	local camoIndexModel = self:getModel( controller, "camoIndex" )
	Engine.SetModelValue( camoIndexModel, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
	Gunsmith_ClearItemName( controller )
	local variantModel = self:getModel()
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( controller, variantModel, true )
end

function Gunsmith_ClearVariantPaintjobSlot( self, element, controller )
	local paintjobSlotModel = self:getModel( controller, "paintjobSlot" )
	local paintjobIndexModel = self:getModel( controller, "paintjobIndex" )
	Engine.SetModelValue( paintjobSlotModel, Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
	Engine.SetModelValue( paintjobIndexModel, Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
	Gunsmith_ClearItemName( controller )
	local variantModel = self:getModel()
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( controller, variantModel, true )
end

function Gunsmith_SelectAttachment( self, element, controller )
	local elementModel = element:getModel()
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	local mutuallyExclusiveSlotTable = {}
	if elementModel and variantModel then
		local attachmentID = Engine.GetModelValue( Engine.GetModel( elementModel, "attachmentIndex" ) )
		local acvIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "acvIndex" ) )
		local selectedAttachmentID = 0
		for attachmentIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local equippedAttachmentID = Engine.GetModelValue( Engine.GetModel( variantModel, "attachment" .. attachmentIndex ) )
			if equippedAttachmentID > 0 and attachmentID ~= equippedAttachmentID and not Engine.AreAttachmentsCompatibleByAttachmentID( attachmentID, equippedAttachmentID ) then
				selectedAttachmentID = equippedAttachmentID
				table.insert( mutuallyExclusiveSlotTable, attachmentIndex )
			end
		end
		for i = 1, #mutuallyExclusiveSlotTable, 1 do
			local attachmentModel = Engine.GetModel( variantModel, "attachment" .. mutuallyExclusiveSlotTable[i] )
			local attachmentVariantModel = Engine.GetModel( variantModel, "attachmentVariant" .. mutuallyExclusiveSlotTable[i] )
			Engine.SetModelValue( attachmentModel, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
			Engine.SetModelValue( attachmentVariantModel, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		end
		CoD.CraftUtility.Gunsmith.ClearVariantSlotByAttachmentIndex( controller, variantModel, attachmentID )
		local variantAttachmentModel = self:getModel()
		Engine.SetModelValue( variantAttachmentModel, attachmentID )
		local attachmentVariantModel = CoD.perController[controller].gunsmithAttachmentVariantModel
		Engine.SetModelValue( attachmentVariantModel, acvIndex )
	end
end

function Gunsmith_FocusAttachment( self, element, controller, booleanArg )
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	local selectedattachmentIndexModel = element:getModel( controller, "attachmentIndex" )
	local focusAttachmentID = Engine.GetModelValue( selectedattachmentIndexModel )
	local attachmentRef = Engine.GetAttachmentRefByIndex( focusAttachmentID )
	local variantAttachmentModel = self:getModel()
	local variantAttachmentID = Engine.GetModelValue( variantAttachmentModel )
	local variantAttachmentRef = Engine.GetAttachmentRefByIndex( variantAttachmentID )
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	local loadoutSlot = CoD.CraftUtility.GetLoadoutSlot( controller )
	local camera = "select01"
	local mode = Enum.eModes.MODE_MULTIPLAYER
	local weaponNamePlusAttachments = Engine.GetItemRef( weaponIndex, mode ) .. CoD.CraftUtility.GetModeAbbreviation()
	local attachmentList = CoD.CraftUtility.Gunsmith.GetVariantAttachmentList( controller, variantModel )
	for _, attachmentID in ipairs( attachmentList ) do
		if attachmentID ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
			local attachmentDataRef = Engine.GetAttachmentRefByIndex( attachmentID )
			local isFocusAttachmentOptic = Engine.IsOpticByAttachmentIndex( focusAttachmentID )
			local isAttachmentOptic = Engine.IsOpticByAttachmentIndex( attachmentID )
			if (not isFocusAttachmentOptic or not isAttachmentOptic) and Engine.AreAttachmentsCompatibleByAttachmentID( focusAttachmentID, attachmentID ) then
				weaponNamePlusAttachments = weaponNamePlusAttachments .. "+" .. attachmentDataRef
			end
		end
	end
	weaponNamePlusAttachments = weaponNamePlusAttachments .. "+" .. attachmentRef
	if CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX < variantAttachmentID and attachmentRef ~= variantAttachmentRef then
		weaponNamePlusAttachments = string.gsub( weaponNamePlusAttachments, "+" .. variantAttachmentRef, "" )
	end
	local attachmentVariantString = ""
	if booleanArg == false then
		attachmentVariantString = CoD.CraftUtility.Gunsmith.GetWeaponAttachmentStringWithoutVariants( controller, variantModel )
	else
		local selectedAttachmentVariantIndex = Engine.GetModelValue( element:getModel( controller, "variantIndex" ) )
		attachmentVariantString = CoD.CraftUtility.Gunsmith.GetAttachmentVariantStringWithSelectedVariant( controller, variantModel, variantAttachmentID, selectedAttachmentVariantIndex )
	end
	local focusAttachmentFound = CoD.CraftUtility.Gunsmith.IsFocusAttachmentEquipped( controller, variantModel, focusAttachmentID )
	if not focusAttachmentFound then
		local focusACVInfo = attachmentRef .. ",0"
		attachmentVariantString = attachmentVariantString .. focusACVInfo
	end
	local weaponOptions = "none"
	if weaponNamePlusAttachments and weaponNamePlusAttachments ~= "" then
		Engine.SendClientScriptNotify( controller, "CustomClass_focus" .. CoD.GetLocalClientAdjustedNum( controller ), {
			base_weapon_slot = loadoutSlot,
			weapon = weaponNamePlusAttachments,
			attachment = attachmentRef,
			options = weaponOptions,
			acv = attachmentVariantString
		} )
	end
end

function Gunsmith_SetAttachmentVariant( self, element, controller )
	local elementModel = element:getModel()
	local selectedAttachmentVariantIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "variantIndex" ) )
	local attachmentIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "attachmentIndex" ) )
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	if attachmentIndex ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX and CoD.CraftUtility.Gunsmith.IsFocusAttachmentEquipped( controller, variantModel, attachmentIndex ) then
		CoD.CraftUtility.Gunsmith.SetFocusAttachmentVariant( controller, variantModel, attachmentIndex, selectedAttachmentVariantIndex )
	end
end

function Gunsmith_FocusCamo( self, element, controller )
	local selectedItemIndexModel = element:getModel( controller, "itemIndex" )
	local camoIndex = Engine.GetModelValue( selectedItemIndexModel )
	local f1046_local0 = IsGunsmithItemWeaponOptionLocked( self, element, controller )
	if not f1046_local0 then
		local isItemLocked = IsSelfModelValueTrue( element, controller, "isBMClassified" )
	end
	if f1046_local0 then
		camoIndex = 0
	end
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	local paintjobSlot = Engine.GetModelValue( Engine.GetModel( variantModel, "paintjobSlot" ) )
	local paintjobIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "paintjobIndex" ) )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( controller, CoD.perController[controller].gunsmithVariantModel, false, nil, nil, camoIndex )
end

function Gunsmith_SetWeaponCamoModel( self, element, controller )
	CoD.perController[controller].gunsmithCamoIndexModel = self:getModel( controller, "camoIndex" )
	local baseWeaponSlot = "primary"
	local notetrack = "select01"
	Engine.SendClientScriptNotify( controller, "cam_customization_focus" .. CoD.GetLocalClientAdjustedNum( controller ), {
		base_weapon_slot = baseWeaponSlot,
		notetrack = notetrack
	} )
end

function Gunsmith_SelectCamo( self, element, controller )
	local selectedItemIndexModel = element:getModel( controller, "itemIndex" )
	if selectedItemIndexModel then
		local itemIndex = Engine.GetModelValue( selectedItemIndexModel )
		local camoModel = self:getModel()
		Engine.SetModelValue( camoModel, itemIndex )
	end
end

function Gunsmith_FocusReticle( self, element, controller )
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	local camoIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "camoIndex" ) )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( controller, CoD.perController[controller].gunsmithVariantModel, false, nil, nil, camoIndex )
end

function Gunsmith_SetWeaponReticleModel( self, element, controller )
	CoD.perController[controller].gunsmithReticleIndexModel = self:getModel( controller, "reticleIndex" )
	local baseWeaponSlot = "primary"
	local notetrack = "select01"
	Engine.SendClientScriptNotify( controller, "cam_customization_focus", {
		base_weapon_slot = baseWeaponSlot,
		notetrack = notetrack
	} )
end

function Gunsmith_SelectReticle( self, element, controller )
	local selectedItemIndexModel = element:getModel( controller, "weaponOptionSubIndex" )
	if selectedItemIndexModel then
		local itemIndex = Engine.GetModelValue( selectedItemIndexModel )
		local reticleModel = self:getModel()
		Engine.SetModelValue( reticleModel, itemIndex )
	end
end

function Gunsmith_SetWeaponOptionAsOld( menu, element, controller )
	local elementModel = element:getModel()
	local weaponItemIndex = CoD.GetCustomization( controller, "weapon_index" )
	local weaponOptionType = CoD.SafeGetModelValue( elementModel, "weaponOptionType" )
	local filterMode = CoD.SafeGetModelValue( elementModel, "filterMode" )
	if weaponOptionType == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE then
		local opticIndex = CoD.SafeGetModelValue( CoD.perController[controller].gunsmithVariantModel, "attachment1" )
		if opticIndex then
			weaponItemIndex = opticIndex
		end
	end
	SetWeaponOptionAsOldInternal( menu, element, controller, weaponItemIndex )
end

function Gunsmith_SetAttachmentAsOld( element, controller )
	local weaponItemIndex = CoD.GetCustomization( controller, "weapon_index" )
	local itemIndexModel = element:getModel( controller, "attachmentIndex" )
	if itemIndexModel then
		local attachmentIndex = Engine.GetModelValue( itemIndexModel )
		local attachmentTableAttachmentIndex = Engine.GetAttachmentIndexByAttachmentTableIndex( weaponItemIndex, attachmentIndex )
		if CoD.CACUtility.EmptyItemIndex < attachmentTableAttachmentIndex then
			Engine.SetAttachmentAsOld( controller, weaponItemIndex, attachmentTableAttachmentIndex )
		end
	end
end

function Gunsmith_SetACVASOld( element, controller )
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	local attachmentTableIndex = element.attachmentTableIndex
	local variantIndex = element.variantIndex
	if attachmentTableIndex and variantIndex then
		local mode = Enum.eModes.MODE_MULTIPLAYER
		SetACVASOldInternal( controller, weaponIndex, attachmentTableIndex, variantIndex, mode )
	end
end

function Gunsmith_SetSelectedItemName( self, element, slotType, attachmentNum, controller )
	if element.m_focusable then
		local variantModel = element:getModel()
		local itemNameModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.GunsmithSelectedItemProperties.itemName" )
		local attachmentTypeModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.GunsmithSelectedItemProperties.attachmentType" )
		Engine.SetModelValue( attachmentTypeModel, slotType )
		Engine.SetModelValue( itemNameModel, "" )
		if slotType == "attachment" or slotType == "optic" then
			local attachmentModel = self:getModel( controller, "attachment" .. attachmentNum )
			local attachmentIndex = Engine.GetModelValue( attachmentModel )
			if attachmentIndex ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				local attachmentName = Engine.GetAttachmentNameByIndex( attachmentIndex )
				Engine.SetModelValue( itemNameModel, attachmentName )
				Gunsmith_SetWeaponAttachmentType( self, element, slotType, attachmentNum, false, controller )
			end
		elseif slotType == "camo" and attachmentNum == "" then
			local camoIndexModel = self:getModel( controller, "camoIndex" )
			local camoIndex = Engine.GetModelValue( camoIndexModel )
			local weaponItemIndex = CoD.GetCustomization( controller, "weapon_index" )
			if camoIndex ~= CoD.CraftUtility.Gunsmith.CAMO_NONE and weaponItemIndex > CoD.CACUtility.EmptyItemIndex then
				local optionInfoModel = Engine.GetWeaponOptionsInfoModelByIndex( controller, camoIndex, "WeaponOptions", weaponItemIndex, 0 )
				local camoNameModel = Engine.GetModel( optionInfoModel, "name" )
				if camoNameModel then
					local camoName = Engine.GetModelValue( camoNameModel )
					Engine.SetModelValue( itemNameModel, camoName )
				end
			end
		elseif slotType == "paintjob" and attachmentNum == "" then
			local paintjobSlotModel = element:getModel( controller, "paintjobSlot" )
			local paintjobSlot = Engine.GetModelValue( paintjobSlotModel )
			local paintjobIndexModel = element:getModel( controller, "paintjobIndex" )
			local paintjobIndex = Engine.GetModelValue( paintjobIndexModel )
			if paintjobSlot ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and paintjobIndex ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
				local paintjobName = CoD.CraftUtility.Paintjobs.GetPaintjobName( controller, paintjobSlot, paintjobIndex )
				Engine.SetModelValue( itemNameModel, paintjobName )
			end
		elseif slotType == "snapshot" and attachmentNum == "" then
			Engine.SetModelValue( itemNameModel, Engine.Localize( "MENU_GUNSMITH_SNAPSHOT_SUBHEADER" ) )
		end
	end
end

function Gunsmith_ClearVariant( self, element, controller )
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	local variantIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "variantIndex" ) )
	CoD.CraftUtility.Gunsmith.ClearVariant( controller, variantIndex )
	local baseMenu = nil
	if IsMediaManager() == true then
		baseMenu = GoBackMultiple( self, controller, 1 )
		MediaManagerMarkDirty( controller )
	else
		baseMenu = GoBackMultiple( self, controller, 2 )
	end
	if baseMenu.variantSelector ~= nil and baseMenu.variantSelector.variantList ~= nil then
		baseMenu.variantSelector.variantList:updateDataSource( true )
		local firstFocusable = baseMenu.variantSelector.variantList:getFirstSelectableItem()
		baseMenu.variantSelector.variantList:setActiveItem( firstFocusable )
		ForceNotifyModel( controller, "Gunsmith.UpdateDataSource" )
	end
end

function Gunsmith_CopyVariant( self, element, controller, param, menu )
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	local variantIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "variantIndex" ) )
	local destVariantIndex = CoD.CraftUtility.Gunsmith.Copy( controller, variantIndex )
	if destVariantIndex then
		local variantSelectMenu = GoBack( menu, controller )
		local variantListElement = variantSelectMenu.variantSelector.variantList
		variantListElement:updateDataSource( true )
		local copiedIntoElement = variantListElement:findItem( {
			variantIndex = destVariantIndex
		} )
		if copiedIntoElement then
			variantListElement:setActiveItem( copiedIntoElement )
		end
		ForceNotifyModel( controller, "Gunsmith.UpdateDataSource" )
	end
end

function Gunsmith_RenameVariant( self, element, controller )
	local variantModel = self:getModel()
	local variantIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "variantIndex" ) )
	local variantName = Engine.GetModelValue( Engine.GetModel( variantModel, "variantName" ) )
	CoD.CraftUtility.Gunsmith.RenameVariant( controller, variantIndex, variantName )
end

function Gunsmith_HandleRenameKeyboardComplete( self, element, controller, event )
	local selectedVariantModel = self:getModel()
	local variantNameModel, variantNameBigModel = nil
	if not selectedVariantModel then
		return 
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_GUNSMITH then
		variantNameModel = Engine.GetModel( selectedVariantModel, "variantName" )
		variantNameBigModel = Engine.GetModel( selectedVariantModel, "variantNameBig" )
	end
	if variantNameModel then
		Engine.SetModelValue( variantNameModel, event.input )
		Gunsmith_ClearSelectedGunsmithVariantStats( controller )
	end
	if variantNameBigModel then
		Engine.SetModelValue( variantNameBigModel, event.input )
	end
end

function Gunsmith_ClearSelectedGunsmithVariantStats( controller )
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	if variantModel then
		local variantIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "variantIndex" ) )
		CoD.CraftUtility.Gunsmith.ClearVariantStats( controller, variantIndex, Enum.eModes.MODE_MULTIPLAYER )
		CoD.CraftUtility.Gunsmith.ClearVariantStats( controller, variantIndex, Enum.eModes.MODE_CAMPAIGN )
	end
end

function Gunsmith_SaveChangesButtonAction( self, element, buttonAction, controller )
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	local quota = Engine.MediaManagerGetQuota( controller, "variant" )
	if buttonAction == "save" then
		CoD.CraftUtility.Gunsmith.WriteVaraintDataToDDL( controller, variantModel )
		ForceNotifyModel( controller, "Gunsmith.UpdateDataSource" )
		Gunsmith_RecordComScoreEvent( self, controller, variantModel, "save", quota.categorySlotsUsed, quota.categoryQuota )
	else
		Gunsmith_RecordComScoreEvent( self, controller, variantModel, "discard" )
	end
	local customizeVariantMenu = GoBack( self, controller )
	local gunsmithMenu = GoBack( customizeVariantMenu, controller )
	ClearMenuSavedState( customizeVariantMenu )
	local variantIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "variantIndex" ) )
	gunsmithMenu.variantSelector.variantList:updateDataSource( true )
	gunsmithMenu.attachmentList:updateDataSource( true )
	gunsmithMenu.variantSelector.variantList:findItem( {
		variantIndex = variantIndex
	}, nil, true, nil )
	CoD.perController[controller].emptyVariantSelected = false
end

function Gunsmith_PaintjobSelector_GainFocus( self, element, controller )
	CoD.perController[controller].selectedpaintjobModel = element:getModel()
	CoD.perController[controller].viewIndex = 1
	local customizationType = CoD.CraftUtility.PaintshopView[CoD.perController[controller].viewIndex].customization_type
	local paintjobSlotModel = element:getModel( controller, "paintjobSlot" )
	local paintjobSlot = Engine.GetModelValue( paintjobSlotModel )
	local paintjobIndexModel = element:getModel( controller, "paintjobIndex" )
	local paintjobIndex = Engine.GetModelValue( paintjobIndexModel )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( controller, CoD.perController[controller].gunsmithVariantModel, false, paintjobSlot, paintjobIndex, nil )
	SetHeadingKickerText( "MENU_GUNSMITH_CAPS" )
end

function Gunsmith_OpenPaintjobSelector( self, element, controller )
	local customizationType = Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT
	CoD.SetCustomization( controller, customizationType, "type" )
	CoD.perController[controller].totalLayers = Enum.CustomizationTypeLayerCount.CUSTOMIZATION_TYPE_PAINTSHOP_MAX_LAYERS
	CoD.perController[controller].totalGroups = Enum.CustomizationTypeGroupCount.CUSTOMIZATION_TYPE_MAX_GROUPS
	local parsingDone = CoD.CraftUtility.Paintjobs.ParseDDL( controller, Enum.StorageFileType.STORAGE_PAINTJOBS )
end

function Gunsmith_PaintjobSelector_ChooseOccupiedPaintjob( self, element, controller )
	local paintjobSlot = Engine.GetModelValue( element:getModel( controller, "paintjobSlot" ) )
	local paintjobIndex = Engine.GetModelValue( element:getModel( controller, "paintjobIndex" ) )
	local variantPaintjobSlotModel = self:getModel( controller, "paintjobSlot" )
	local variantPaintjobIndexModel = self:getModel( controller, "paintjobIndex" )
	local variantPaintjobSlotAndIndexModel = self:getModel( controller, "paintjobSlotAndIndex" )
	Engine.SetModelValue( variantPaintjobSlotModel, paintjobSlot )
	Engine.SetModelValue( variantPaintjobIndexModel, paintjobIndex )
	Engine.SetModelValue( variantPaintjobSlotAndIndexModel, paintjobSlot .. " " .. paintjobIndex )
end

function Gunsmith_ClearCACWithUpdatedVariant( self, controller )
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	local variantIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "variantIndex" ) ) + 1
	local checkLoadoutForGunsmithVariant = function ( classNum, loadoutSlot, mode )
		local classItemIndex = Engine.GetClassItem( controller, classNum, loadoutSlot, mode )
		if classItemIndex > CoD.CACUtility.EmptyItemIndex and classItemIndex == variantIndex then
			Engine.SetClassItem( controller, classNum, loadoutSlot, CoD.CACUtility.EmptyItemIndex, mode )
		end
	end
	
	local updateWeaponVariantSlotInClasses = function ( sessionMode )
		local classCount = Engine.GetCustomClassCount( controller, sessionMode )
		for index = 1, classCount, 1 do
			local classNum = index - 1
			checkLoadoutForGunsmithVariant( classNum, "primarygunsmithvariant", sessionMode )
			checkLoadoutForGunsmithVariant( classNum, "secondarygunsmithvariant", sessionMode )
		end
	end
	
	updateWeaponVariantSlotInClasses( Enum.eModes.MODE_CAMPAIGN )
	updateWeaponVariantSlotInClasses( Enum.eModes.MODE_MULTIPLAYER )
end

function Gunsmith_SnapshotToggleDisplayProperty( menu, element, controller )
	local paramModel = element:getModel( controller, "param" )
	if paramModel then
		local modelName = Engine.GetModelValue( paramModel )
		if modelName then
			local model = Engine.GetModel( Engine.GetGlobalModel(), modelName )
			if model then
				local value = Engine.GetModelValue( model )
				Engine.SetModelValue( model, (value + 1) % 2 )
			end
		end
	end
end

function Gunsmith_SnapshotToggleControlsUI( menu, element, controller )
	local model = Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.ShowControls" )
	if model then
		local value = Engine.GetModelValue( model )
		Engine.SetModelValue( model, (value + 1) % 2 )
	end
end

function Gunsmith_SnapshotToggleStatsFilter( menu, element, controller )
	local sessionModeModel = Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.SessionMode" )
	if sessionModeModel then
		local sessionModeValue = Engine.GetModelValue( sessionModeModel )
		if sessionModeValue == Enum.eModes.MODE_CAMPAIGN then
			Engine.SetModelValue( sessionModeModel, Enum.eModes.MODE_MULTIPLAYER )
		else
			Engine.SetModelValue( sessionModeModel, Enum.eModes.MODE_CAMPAIGN )
		end
	end
end

function CopyModelFindElement( menu, element, stringArg )
	local newElement = element
	while newElement and not newElement[stringArg] do
		newElement = newElement:getParent()
	end
	if newElement and newElement[stringArg] then
		newElement[stringArg]:setModel( element:getModel() )
	end
end

function StartMenuGoBack_ListElement( self, element, controller, actionParam, menu )
	StartMenuGoBack( menu, controller )
end

function StartMenuGoBack( menu, controller )
	StartMenuResumeGame( menu, controller )
	GoBack( menu, controller )
	ClearSavedState( menu, controller )
end

function StartMenuResumeGame( menu, controller )
	if Engine.IsInGame() and Engine.CanPauseGame() and not Engine.IsDemoPlaying() then
		Engine.SetDvar( "cl_paused", 0 )
	end
	if Engine.IsInGame() then
		Engine.SetActiveMenu( controller, Enum.uiMenuCommand_t.UIMENU_NONE )
	end
	PrepareCloseMenuInSafehouse( controller )
end

function UnpauseGame( menu, controller )
	if Engine.IsInGame() and Engine.CanPauseGame() and not Engine.IsDemoPlaying() then
		Engine.SetDvar( "cl_paused", 0 )
	end
end

function CloseStartMenu( menu, controller )
	local startMenu = GoBackToMenu( menu, controller, "StartMenu_Main" )
	if startMenu.menuName == "StartMenu_Main" or startMenu.menuName == "DOA_INGAME_PAUSE" then
		StartMenuGoBack( startMenu, controller )
	end
end

function RefreshLobbyRoom( menu, controller )
	if Engine.IsInGame() then
		return 
	end
	local lobbyGameModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyGameMode" )
	local lobbyMainModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" )
	local roomModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.room" )
	if roomModel then
		local room = Engine.GetModelValue( roomModel )
		if room == "auto" then
			local mode = Engine.GetMostRecentPlayedMode( controller )
			room = Engine.GetAbbreviationForMode( mode )
			if Engine.SessionModeIsMode( Enum.eNetworkModes.MODE_NETWORK_SYSTEMLINK ) == true then
				room = room .. "_local"
			end
			if IsCustomLobby() then
				room = room .. "_custom"
			end
		end
		SendCustomClientScriptMenuStateChangeNotify( controller, "Main", true, room )
		menu.previousRoom = room
	end
	if LuaUtils.LobbyMainModeToEModes( lobbyMainModeModel:get() ) == Enum.eModes.MODE_CAMPAIGN and not IsFirstTimeSetup( controller, Enum.eModes.MODE_CAMPAIGN ) then
		CoD.CPUtility.EnteredCP_FlowComplete( controller )
	end
end

function UpdatePlayerInspection( self, element, controller )
	if not IsFreeCursorPrototypeBuild( controller ) then
		local xuid = Engine.GetModelValue( Engine.GetModel( element:getModel(), "xuid" ) )
		if Engine.XuidIsValid( xuid ) then
			Engine.SendClientScriptNotify( controller, "inspect_player", {
				xuid = Engine.UInt64ToString( xuid )
			} )
		end
	end
end

function UpdateGamerprofile( self, element, controller )
	Engine.Exec( controller, "updategamerprofile" )
end

function OpenPaintshop( self, element, controller, param, menu )
	if Engine.PushAnticheatMessageToUI( controller, LuaEnum.ANTICHEAT_MESSAGE_GROUPS.UGC ) then
		DisplayAnticheatMessage( self, controller, LuaEnum.ANTICHEAT_MESSAGE_GROUPS.UGC, "Paintshop", "" )
		return 
	elseif CheckIfFeatureIsBanned( controller, LuaEnum.FEATURE_BAN.USER_GENERATED_CONTENT ) then
		LuaUtils.UI_ShowErrorMessageDialog( controller, GetFeatureBanInfo( controller, LuaEnum.FEATURE_BAN.USER_GENERATED_CONTENT ) )
		return 
	end
	local paintshopModeModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Paintshop.Mode" )
	Engine.SetModelValue( paintshopModeModel, Enum.PaintshopMode.PAINTSHOPMODE_WEAPONLIST )
	local customizationType = Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT
	CoD.SetCustomization( controller, customizationType, "type" )
	CoD.perController[controller].totalLayers = Enum.CustomizationTypeLayerCount.CUSTOMIZATION_TYPE_PAINTSHOP_MAX_LAYERS
	CoD.perController[controller].totalGroups = Enum.CustomizationTypeGroupCount.CUSTOMIZATION_TYPE_MAX_GROUPS
	local parsingDone = CoD.CraftUtility.Paintjobs.ParseDDL( controller, Enum.StorageFileType.STORAGE_PAINTJOBS )
	if parsingDone then
		menu:openOverlay( "Paintshop", controller )
	end
end

function OpenEmblemSelect( self, element, controller, enumValue, menu )
	CoD.SetCustomization( controller, Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM, "type" )
	Engine.ExecNow( controller, "emblemgetprofile" )
	CoD.perController[controller].selectedEmblemTabStorageType = enumValue
	local parsingDone = CoD.CraftUtility.Emblems.ParseDDL( controller, CoD.perController[controller].selectedEmblemTabStorageType )
	if parsingDone then
		menu:openOverlay( "EmblemSelect", controller )
	end
end

function OpenEmblemEditor( element, menu, controller, model, param )
	if Engine.PushAnticheatMessageToUI( controller, LuaEnum.ANTICHEAT_MESSAGE_GROUPS.UGC ) then
		DisplayAnticheatMessage( menu, controller, LuaEnum.ANTICHEAT_MESSAGE_GROUPS.UGC, "EmblemEditor", param )
		return 
	elseif CheckIfFeatureIsBanned( controller, LuaEnum.FEATURE_BAN.USER_GENERATED_CONTENT ) then
		LuaUtils.UI_ShowErrorMessageDialog( controller, GetFeatureBanInfo( controller, LuaEnum.FEATURE_BAN.USER_GENERATED_CONTENT ) )
		return 
	elseif param == "EmblemSelect" then
		EmblemSelect_ChooseEmblem( menu, element, controller )
		OpenOverlay( menu, "EmblemEditor", controller, "", "" )
	elseif param == "PaintjobSelect" then
		PaintjobSelector_ChoosePaintjob( menu, element, controller )
		OpenOverlay( menu, "EmblemEditor", controller, "", "" )
	end
end

function OpenGunsmith( self, element, controller, param, menu )
	local gunsmithModeModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.Mode" )
	Engine.SetModelValue( gunsmithModeModel, Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST )
	local variantParsingDone = CoD.CraftUtility.Gunsmith.ParseDDL( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
	local paintjobParsingDone = CoD.CraftUtility.Paintjobs.ParseDDL( controller, Enum.StorageFileType.STORAGE_PAINTJOBS )
	if variantParsingDone and paintjobParsingDone then
		menu:openOverlay( "Gunsmith", controller )
		CoD.perController[controller].emptyVariantSelected = false
	end
end

function OpenEditLoadout( self, element, controller, param, menu, enumValue )
	if enumValue == Enum.eModes.MODE_CAMPAIGN then
		Engine.SwitchMode( controller, "cp" )
	elseif enumValue == Enum.eModes.MODE_MULTIPLAYER then
		Engine.SwitchMode( controller, "mp" )
	elseif enumValue == Enum.eModes.MODE_ZOMBIES then
		Engine.SwitchMode( controller, "zm" )
	end
	CoD.PlayerRoleUtility.customizationMode = enumValue
	menu:openOverlay( "PositionsLoadout", controller )
end

function OpenCallingCards( self, element, controller, param, menu )
	menu:openOverlay( "CallingCards", controller )
end

function OpenGroups( self, element, controller, param, menu )
	if IsGroupsEnabled() then
		InitializeGroups( self, nil, controller )
		GoBackAndOpenOverlayOnParent( self, "Groups", controller )
		CoD.FileshareUtility.SetFileshareMode( controller, Enum.FileshareMode.FILESHARE_MODE_GROUPS )
	end
end

function GroupsHandleGoBack( self, element, controller )
	ClearSelectedGroup( self, element, controller )
	CoD.perController[controller].openMediaTabAfterClosingGroups = true
	GoBackAndOpenOverlayOnParent( self, "StartMenu_Main", controller )
end

function OpenPersonalizeCharacter( self, element, controller, param, menu )
	CoD.LobbyUtility.OpenPersonalizeCharacter( menu, controller )
end

function OpenChooseCharacterLoadout( self, element, controller, param, menu )
	CoD.PlayerRoleUtility.customizationMode = Enum.eModes.MODE_MULTIPLAYER
	CoD.LobbyUtility.OpenChooseCharacterLoadout( menu, controller, param )
end

function OpenChoosePositionLoadout( self, element, controller, param, menu )
	CoD.PlayerRoleUtility.customizationMode = Enum.eModes.MODE_MULTIPLAYER
	CoD.LobbyUtility.OpenChoosePositionLoadout( menu, controller, param )
end

function EditClanTag( self, element, controller )
	ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_CLAN_TAG" )
end

function OpenControlerSettings( self, element, controller, param, menu )
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	menu:saveState()
	menu:openMenu( "OptionsMenu", controller )
	menu:close()
end

function ProcessStartMenuButtonPress( self, element, controller )
	if element.currentMode == CoD.HeroCarouselItemStates.Inspecting then
		if element.cardFront and element.cardFront.selectionList and element.cardFront.selectionList.activeWidget and not IsDisabled( self, element.cardFront.selectionList.activeWidget, {
			controller = controller
		} ) then
			ProcessListAction( self, element.cardFront.selectionList.activeWidget, controller )
		end
	elseif CoD.PlayerRoleUtility.Heroes.edittingLoadoutForWidget then
		local element = CoD.PlayerRoleUtility.Heroes.edittingLoadoutForWidget
		if element.cardBack and element.cardBack.selectionList and element.cardBack.selectionList.activeWidget and not IsDisabled( self, element.cardBack.selectionList.activeWidget, {
			controller = controller
		} ) then
			EquipHeroLoadoutItem( element, element.cardBack.selectionList.activeWidget, controller )
		end
	end
end

function OpenMenuByNameParam( self, element, controller, param, menu )
	NavigateToMenu( self, param, true, controller )
end

function OpenPopupMenuByNameParam( self, element, controller, param, menu )
	menu:openPopup( param, controller )
end

function HandleDemoKeyboardComplete( self, element, controller, event )
	if event.modeName == element.keyboardName then
		element.Text:setText( event.text )
	end
end

function OpenDemoKeyboard( self, element, controller, keyboardName, extraArg )
	if extraArg and extraArg ~= "" then
		Engine.Exec( controller, "demo_keyboard " .. keyboardName .. " " .. extraArg )
	else
		Engine.Exec( controller, "demo_keyboard " .. keyboardName )
	end
	element.keyboardName = keyboardName
end

function OpenDemoSaveKeyboard( self, element, controller, type )
	local keyboardName = nil
	local category = CoD.FileshareUtility.GetCurrentCategory()
	if category == "clip_private" then
		if type == "name" then
			keyboardName = "clipName"
		elseif type == "desc" then
			keyboardName = "clipDesc"
		end
	elseif category == "screenshot_private" then
		if type == "name" then
			keyboardName = "screenshotName"
		elseif type == "desc" then
			keyboardName = "screenshotDesc"
		end
	end
	if not keyboardName then
		return 
	else
		OpenDemoKeyboard( self, element, controller, keyboardName, "" )
	end
end

function StartMenuUploadClip( self, element, controller, param, menu )
	local downloadProgress = Engine.GetDemoStreamedDownloadProgress()
	if downloadProgress < 100 then
		local titleText = Engine.Localize( "MENU_NOTICE" )
		local messageText = Engine.Localize( "MPUI_DEMO_DOWNLOAD_IN_PROGRESS", math.floor( downloadProgress ) )
		CoD.Menu.OpenDemoErrorPopup( self, {
			controller = event.controller,
			titleText = titleText,
			messageText = messageText
		} )
		return 
	else
		Engine.ExecNow( controller, "demo_updatesavepopupuimodels clip" )
		Engine.ExecNow( controller, "setupThumbnailForFileshareSave clip" )
		CoD.FileshareUtility.OpenPrivateUploadPopup( self, controller, "clip_private", function ( controller )
			Engine.SaveAndUploadClip( controller, 0 )
		end )
	end
end

function UploadClip_GoBack( self, element, controller, menu )
	local occludedMenu = GoBack( self, controller )
	ClearMenuSavedState( self )
	if occludedMenu.menuName == "TimelineEditor" then
		Engine.Exec( controller, "setupThumbnailsForManageSegments" )
	else
		ResetThumbnailViewer( controller )
	end
	if Engine.IsClipModified() == false and occludedMenu.menuName == "EndDemoPopup" then
		GoBack( occludedMenu, controller )
	end
end

function StartMenuOpenManageSegments( self, element, controller, param, menu )
	OpenPopupMenuByNameParam( self, element, controller, "TimelineEditor", menu )
end

function StartMenuOpenCustomizeHighlightReel( self, element, controller, param, menu )
	CoD.OverlayUtility.CreateOverlay( controller, self, "DemoCustomizeHighlightReelPopup" )
end

function StartMenuJumpToStart( self, element, controller, param, menu )
	Engine.Exec( controller, "demo_jumptostart" )
	GoBack( self, controller )
end

function StartMenuEndDemo( self, element, controller, param, menu )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( controller, menu, "EndDemoPopup" )
end

function DemoSwitchPlayer( controller, cycleParam )
	if cycleParam == nil or cycleParam == "" then
		return 
	end
	local anticlockwise = nil
	if cycleParam == "next" then
		anticlockwise = 0
	elseif cycleParam == "prev" then
		anticlockwise = 1
	end
	Engine.Exec( controller, "demo_switchplayer " .. anticlockwise )
end

function UpdateDemoTimeScale( controller, delta )
	local currentTimeScale = CoD.DemoUtility.GetRoundedTimeScale()
	local numDelta = tonumber( delta )
	local newTimeScale = currentTimeScale + numDelta
	local minValue = 0.1
	local maxValue = Dvar.demo_maxTimeScale:get()
	if not (numDelta <= 0 or newTimeScale > maxValue) or numDelta < 0 and minValue <= newTimeScale then
		Engine.Exec( controller, "demo_timescale " .. newTimeScale )
	end
end

function UpdateDemoCameraMode( controller, cycleParam )
	if cycleParam == nil or cycleParam == "" then
		return 
	end
	local currentCameraMode = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.cameraMode" ) )
	local nextCameraMode = nil
	if cycleParam == "next" or cycleParam == "cycle" then
		if currentCameraMode == Enum.demoCameraMode.DEMO_CAMERA_MODE_NONE then
			nextCameraMode = Enum.demoCameraMode.DEMO_CAMERA_MODE_THIRDPERSON
		elseif currentCameraMode == Enum.demoCameraMode.DEMO_CAMERA_MODE_THIRDPERSON then
			nextCameraMode = Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM
		elseif cycleParam == "cycle" then
			nextCameraMode = Enum.demoCameraMode.DEMO_CAMERA_MODE_NONE
		else
			return 
		end
	elseif cycleParam == "prev" then
		if currentCameraMode == Enum.demoCameraMode.DEMO_CAMERA_MODE_THIRDPERSON then
			nextCameraMode = Enum.demoCameraMode.DEMO_CAMERA_MODE_NONE
		elseif currentCameraMode == Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM then
			nextCameraMode = Enum.demoCameraMode.DEMO_CAMERA_MODE_THIRDPERSON
		else
			return 
		end
	end
	Engine.SwitchDemoCameraMode( nextCameraMode )
end

function UpdateDemoFastForward( controller )
	local roundedTimeScale = CoD.DemoUtility.GetRoundedTimeScale()
	local newTimeScaleValue = nil
	if roundedTimeScale >= 6 then
		newTimeScaleValue = 1
	elseif roundedTimeScale >= 4 then
		newTimeScaleValue = 6
	elseif roundedTimeScale >= 2 then
		newTimeScaleValue = 4
	elseif roundedTimeScale >= 1 then
		newTimeScaleValue = 2
	else
		newTimeScaleValue = 1
	end
	Engine.ExecNow( controller, "demo_timescale " .. newTimeScaleValue )
	local timeScaleModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.timeScale" )
	if timeScaleModel then
		Engine.SetModelValue( timeScaleModel, newTimeScaleValue )
	end
	return newTimeScaleValue
end

function DemoJumpBack( controller )
	Engine.Exec( controller, "demo_back" )
end

function DemoToggleGameHud( controller )
	Engine.Exec( controller, "demo_togglegamehud" )
end

function DemoToggleDemoHud( controller )
	Engine.Exec( controller, "demo_toggledemohud" )
end

function DemoCancelPreview( controller )
	Engine.Exec( controller, "demo_cancelpreview" )
end

function DemoAddDollyCameraMarker( controller )
	Engine.Exec( controller, "demo_adddollycammarker" )
end

function DemoEditDollyCameraMarker( controller )
	CoD.DemoUtility.SwitchToDollyCamMarker( controller, -1 )
	CoD.DemoUtility.SetEditingDollyCameraMarker( controller, true )
end

function DemoExitEditDollyCameraMarker( controller )
	local getHighlightedMarker = Engine.GetHighlightedCameraMarker()
	Engine.Exec( controller, "demo_updatedollycammarkerparameters " .. getHighlightedMarker )
	CoD.DemoUtility.SetEditingDollyCameraMarker( controller, false )
end

function DemoPlaceDollyCameraMarker( controller )
	Engine.Exec( controller, "demo_applynewdollycammarkerposition 0" )
end

function DemoCancelPlaceDollyCameraMarker( controller )
	Engine.Exec( controller, "demo_applynewdollycammarkerposition 1" )
end

function UpdateDollyCameraTimeScaleMode( controller, cycleParam )
	if cycleParam == nil or cycleParam == "" then
		return 
	end
	local currentTimeScaleModeModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentDollyCamMarkerTimeScaleMode" )
	local currentTimeScaleMode = Engine.GetModelValue( currentTimeScaleModeModel )
	local nextTimeScaleMode = nil
	if cycleParam == "next" then
		if currentTimeScaleMode == Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_MANUAL then
			nextTimeScaleMode = Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_LINEAR
		elseif currentTimeScaleMode == Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_LINEAR then
			nextTimeScaleMode = Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_FIXED
		else
			return 
		end
	elseif cycleParam == "prev" then
		if currentTimeScaleMode == Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_LINEAR then
			nextTimeScaleMode = Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_MANUAL
		elseif currentTimeScaleMode == Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_FIXED then
			nextTimeScaleMode = Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_LINEAR
		else
			return 
		end
	end
	Engine.SetModelValue( currentTimeScaleModeModel, nextTimeScaleMode )
end

function UpdateDollyCameraTimeScale( controller, delta )
	local currentTimeScaleModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentDollyCamMarkerTimeScaleValue" )
	if not currentTimeScaleModel then
		return 
	end
	local currentTimeScale = Engine.GetModelValue( currentTimeScaleModel )
	local numDelta = tonumber( delta )
	local newTimeScale = currentTimeScale + numDelta
	local minValue = 0.1
	local maxValue = Dvar.demo_maxTimeScale:get()
	if not (numDelta <= 0 or newTimeScale > maxValue) or numDelta < 0 and minValue <= newTimeScale then
		Engine.SetModelValue( currentTimeScaleModel, newTimeScale )
	end
end

function DemoFreeCameraLockOnObject( controller )
	Engine.Exec( controller, "demo_activatefreecameralockon" )
end

function DemoFreeCameraUnlockObject( controller )
	Engine.Exec( controller, "demo_deactivatefreecameralockon" )
end

function DemoAddLightmanMarker( controller )
	Engine.Exec( controller, "demo_addlightmanmarker" )
end

function DemoEditLightmanMarker( controller )
	CoD.DemoUtility.SwitchToLightmanMarker( controller, -1 )
	CoD.DemoUtility.SetEditingLightmanMarker( controller, true )
end

function DemoExitEditLightmanMarker( controller )
	local getHighlightedMarker = Engine.GetHighlightedCameraMarker()
	Engine.Exec( controller, "demo_updatelightmanmarkerparameters " .. getHighlightedMarker )
	CoD.DemoUtility.SetEditingLightmanMarker( controller, false )
end

function DemoPlaceLightmanMarker( controller )
	Engine.Exec( controller, "demo_applynewlightmanmarkerposition 0" )
end

function DemoCancelPlaceLightmanMarker( controller )
	Engine.Exec( controller, "demo_applynewlightmanmarkerposition 1" )
end

function UpdateLightmanLightMode( controller, cycleParam )
	if cycleParam == nil or cycleParam == "" then
		return 
	end
	local currentLightModeModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightMode" )
	local currentLightMode = Engine.GetModelValue( currentLightModeModel )
	local nextLightMode = nil
	if cycleParam == "next" then
		if currentLightMode == Enum.demoLightmanLightMode.DEMO_LIGHTMAN_LIGHT_MODE_OMNI then
			nextLightMode = Enum.demoLightmanLightMode.DEMO_LIGHTMAN_LIGHT_MODE_SPOT
		else
			return 
		end
	elseif cycleParam == "prev" then
		if currentLightMode == Enum.demoLightmanLightMode.DEMO_LIGHTMAN_LIGHT_MODE_SPOT then
			nextLightMode = Enum.demoLightmanLightMode.DEMO_LIGHTMAN_LIGHT_MODE_OMNI
		else
			return 
		end
	end
	Engine.SetModelValue( currentLightModeModel, nextLightMode )
	local getHighlightedMarker = Engine.GetHighlightedCameraMarker()
	Engine.Exec( controller, "demo_updatelightmanmarkerparameters " .. getHighlightedMarker )
end

function UpdateLightmanFloatParam( element, controller, delta )
	local f1129_local0 = tonumber( delta ) > 0
	if not element.btnId then
		return 
	end
	local numDelta, currentValueModel = nil
	if f1129_local0 then
		numDelta = 0.5
	else
		numDelta = -0.5
	end
	local minValue = 0.1
	local maxValue = 10
	if element.btnId == "lightmanlightintensity" then
		currentValueModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightIntensity" )
	elseif element.btnId == "lightmanlightrange" then
		currentValueModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightRange" )
	end
	if not numDelta or not currentValueModel then
		return 
	end
	local currentValue = Engine.GetModelValue( currentValueModel )
	local newValue = currentValue + numDelta
	if not (not f1129_local0 or newValue > maxValue) or not f1129_local0 and minValue <= newValue then
		Engine.SetModelValue( currentValueModel, newValue )
		local getHighlightedMarker = Engine.GetHighlightedCameraMarker()
		Engine.Exec( controller, "demo_updatelightmanmarkerparameters " .. getHighlightedMarker )
	end
end

function StoreCurrentLightmanColor( self, element, controller, menu )
	local r = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightColorR" ) )
	local g = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightColorG" ) )
	local b = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightColorB" ) )
	CoD.DemoUtility.CurrentLightmanColor = string.format( "%d %d %d", r * 255, g * 255, b * 255 )
end

function SelectLightmanColor( self, element, controller, menu )
	local colorModel = Engine.GetModel( element:getModel(), "color" )
	if colorModel then
		CoD.DemoUtility.SetCurrentLightmanColor( controller, Engine.GetModelValue( colorModel ) )
	end
end

function CancelLightmanColorSelection( self, element, controller, menu )
	if not CoD.DemoUtility.CurrentLightmanColor then
		return 
	else
		CoD.DemoUtility.SetCurrentLightmanColor( controller, CoD.DemoUtility.CurrentLightmanColor )
	end
end

function UpdateNumHighlightReelMomentsElementColor( element, controller )
	local model = CoD.DemoUtility.GetNumHighlightReelMomentsModel()
	local numAvailableMoments = 0
	if model then
		numAvailableMoments = Engine.GetModelValue( model )
	end
	if numAvailableMoments <= 0 then
		element:setRGB( ColorSet.InsufficientFunds.r, ColorSet.InsufficientFunds.g, ColorSet.InsufficientFunds.b )
	else
		element:setRGB( 1, 1, 1 )
	end
end

function DemoCancelHighlightReelCreation( controller )
	Engine.Exec( controller, "demo_cancelhighlightreelcreation" )
end

function ResetThumbnailViewer( controller )
	Engine.ExecNow( controller, "resetThumbnailViewer" )
end

function PreserveThumbnails( controller, booleanArg )
	if booleanArg == true then
		Engine.ExecNow( controller, "preservethumbnails 1" )
	else
		Engine.ExecNow( controller, "preservethumbnails 0" )
	end
end

function TimelineEditorRefresh()
	local demoSegmentsRefreshModel = Engine.GetModel( Engine.GetGlobalModel(), "DemoSegments.refresh" )
	local refreshCount = Engine.GetModelValue( demoSegmentsRefreshModel )
	Engine.SetModelValue( demoSegmentsRefreshModel, refreshCount + 1 )
end

function TimelineEditorPreviewClip( self, element, controller )
	CoD.InGameMenu.CloseAllInGameMenus( self, {
		name = "close_all_ingame_menus",
		controller = controller
	} )
	Engine.Exec( controller, "demo_previewclip" )
end

function TimelineEditorFilmOptions( self, element, controller )
	OpenPopupWithPriority( self, "TimelineEditorFilmOptions", controller, 100 )
end

function TimelineEditorChangeTransition( self, element, controller )
	local segmentNumberModel = Engine.GetModel( element:getModel(), "segmentNumber" )
	if segmentNumberModel then
		local segmentIndex = Engine.GetModelValue( segmentNumberModel ) - 1
		local currentTransitionValue = tonumber( Engine.GetDemoSegmentInformation( segmentIndex, "transitionValue" ) )
		local newTransitionValue = currentTransitionValue + 1
		if newTransitionValue > Enum.demoClipTransition.DEMO_CLIP_TRANSITION_LAST then
			newTransitionValue = Enum.demoClipTransition.DEMO_CLIP_TRANSITION_FIRST
		end
		Engine.ExecNow( controller, "demo_switchtransition " .. segmentIndex .. " " .. newTransitionValue )
	end
end

function TimelineEditorPlaceSegment( self, element, controller, success, menu )
	local selectedSegmentModel = CoD.DemoUtility.Timeline_GetSelectedSegmentModel()
	local selectedSegmentNumber = Engine.GetModelValue( Engine.GetModel( selectedSegmentModel, "segmentNumber" ) )
	if success then
		local segmentNumber = Engine.GetModelValue( element:getModel( controller, "segmentNumber" ) )
		local fromSegmentIndex = selectedSegmentNumber - 1
		local toSegmentIndex = segmentNumber - 1
		if fromSegmentIndex ~= toSegmentIndex then
			Engine.ExecNow( menu:getOwner(), "demo_movesegment " .. fromSegmentIndex .. " " .. toSegmentIndex )
			CoD.DemoUtility.SetupDemoSegmentModel( fromSegmentIndex )
			CoD.DemoUtility.SetupDemoSegmentModel( toSegmentIndex )
		end
	end
	Engine.SetModelValue( Engine.GetModel( selectedSegmentModel, "selected" ), false )
	CoD.Timeline_RefreshStateAfterMove( menu, element:getModel(), selectedSegmentModel, success )
end

function TimelineEditorSetupMoveSegment( self, element, controller, menu )
	local model = element:getModel()
	CoD.DemoUtility.Timeline_SetSelectedSegmentModel( model )
	CoD.Timeline_RefreshState( menu, model, true )
end

function TimelineEditorUpdateTimeline( self, element, controller, param, menu )
	local focussed = nil
	if param == "gain_focus" then
		focussed = true
	else
		focussed = false
	end
	CoD.Timeline_RefreshState( menu, element:getModel(), focussed )
end

function TimelineEditorUpdateHighlightedSegmentModel( self, element, controller, param, menu )
	local focussed = nil
	if param == "gain_focus" then
		focussed = true
	else
		focussed = false
	end
	local model = element:getModel()
	if not model then
		return 
	else
		local highlightedModel = Engine.CreateModel( model, "highlighted" )
		Engine.SetModelValue( highlightedModel, focussed )
	end
end

function TimelineEditorKeyboardComplete( self, element, controller, event )
	local highlightedSegmentModel = CoD.DemoUtility.Timeline_GetHighlightedSegmentModel()
	Engine.SetModelValue( Engine.GetModel( highlightedSegmentModel, "name" ), event.input )
end

function IncreaseSafeAreaVertical( self, element, controller )
	if not CoD.SafeArea or not CoD.SafeArea.Maximum or not CoD.SafeArea.AdjustAmount then
		return 
	end
	local currentVertical = tonumber( Engine.ProfileValueAsString( controller, "safeAreaTweakable_vertical" ) )
	local newVertical = currentVertical + CoD.SafeArea.AdjustAmount
	if newVertical <= CoD.SafeArea.Maximum then
		Engine.SetProfileVar( controller, "safeAreaTweakable_vertical", newVertical )
	end
end

function DecreaseSafeAreaVertical( self, element, controller )
	if not CoD.SafeArea or not CoD.SafeArea.Maximum or not CoD.SafeArea.AdjustAmount then
		return 
	end
	local currentVertical = tonumber( Engine.ProfileValueAsString( controller, "safeAreaTweakable_vertical" ) )
	local newVertical = currentVertical - CoD.SafeArea.AdjustAmount
	if CoD.SafeArea.Minimum <= newVertical then
		Engine.SetProfileVar( controller, "safeAreaTweakable_vertical", newVertical )
	end
end

function IncreaseSafeAreaHorizontal( self, element, controller )
	if not CoD.SafeArea or not CoD.SafeArea.Maximum or not CoD.SafeArea.AdjustAmount then
		return 
	end
	local currentHorizontal = tonumber( Engine.ProfileValueAsString( controller, "safeAreaTweakable_horizontal" ) )
	local newHorizontal = currentHorizontal + CoD.SafeArea.AdjustAmount
	if newHorizontal <= CoD.SafeArea.Maximum then
		Engine.SetProfileVar( controller, "safeAreaTweakable_horizontal", newHorizontal )
	end
end

function DecreaseSafeAreaHorizontal( self, element, controller )
	if not CoD.SafeArea or not CoD.SafeArea.Maximum or not CoD.SafeArea.AdjustAmount then
		return 
	end
	local currentHorizontal = tonumber( Engine.ProfileValueAsString( controller, "safeAreaTweakable_horizontal" ) )
	local newHorizontal = currentHorizontal - CoD.SafeArea.AdjustAmount
	if CoD.SafeArea.Minimum <= newHorizontal then
		Engine.SetProfileVar( controller, "safeAreaTweakable_horizontal", newHorizontal )
	end
end

function EquipScorestreak( menu, element, controller )
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	if itemIndexModel then
		local itemIndex = Engine.GetModelValue( itemIndexModel )
		if itemIndex ~= CoD.CACUtility.EmptyItemIndex then
			local classModel = CoD.perController[controller].classModel
			local attachedSlot = CoD.CACUtility.GetAttachedItemSlot( classModel, itemIndex, CoD.CACUtility.KillstreakNameList )
			if not attachedSlot then
				local newSlot = CoD.CACUtility.FindFirstEmptySlotInList( classModel, CoD.CACUtility.KillstreakNameList )
				if newSlot then
					CoD.CACUtility.SetClassItem( controller, 0, newSlot, itemIndex )
					CoD.CACUtility.GetCustomClassModel( controller, 0, classModel )
					menu:processEvent( {
						name = "update_state",
						menu = menu
					} )
				else
					local popup = OpenPopup( menu, "ScorestreakOverCapacity", controller )
					popup:setModel( classModel )
					if popup.updateSelectedImage then
						popup:updateSelectedImage( itemIndex )
					end
					LUI.OverrideFunction_CallOriginalFirst( popup, "close", function ()
						if popup.lastRemovedSlot then
							CoD.CACUtility.SetClassItem( controller, 0, popup.lastRemovedSlot, itemIndex )
							CoD.CACUtility.GetCustomClassModel( controller, 0, classModel )
							menu:processEvent( {
								name = "update_state",
								menu = menu
							} )
						end
					end )
				end
			end
		end
	end
end

function RemoveScorestreak( menu, element, controller )
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	if itemIndexModel then
		local itemIndex = Engine.GetModelValue( itemIndexModel )
		if itemIndex ~= CoD.CACUtility.EmptyItemIndex then
			local classModel = menu:getModel()
			local attachedSlot = CoD.CACUtility.GetAttachedItemSlot( classModel, itemIndex, CoD.CACUtility.KillstreakNameList )
			if attachedSlot then
				menu.lastRemovedSlot = attachedSlot
				CoD.CACUtility.SetClassItem( controller, 0, attachedSlot, CoD.CACUtility.EmptyItemIndex )
				CoD.CACUtility.GetCustomClassModel( controller, 0, classModel )
				menu:processEvent( {
					name = "update_state",
					menu = menu
				} )
			end
		end
	end
end

function RemoveAllScorestreaks( menu, controller )
	local classModel = menu:getModel()
	for _, loadoutSlot in ipairs( CoD.CACUtility.KillstreakNameList ) do
		CoD.CACUtility.SetClassItem( controller, 0, loadoutSlot, CoD.CACUtility.EmptyItemIndex )
	end
	CoD.CACUtility.GetCustomClassModel( controller, 0, classModel )
	menu:processEvent( {
		name = "update_state",
		menu = menu
	} )
end

function GoBackAndUpdateSelectedChallengesButton( menu, controller )
	local previousMenu = GoBack( menu, controller )
	previousMenu:processEvent( {
		name = "set_selected_button",
		controller = controller
	} )
	return previousMenu
end

function Challenges_UpdateListFromTabChanged( menu, element, controller )
	local tabCategoryModel = element:getModel( controller, "tabCategory" )
	if tabCategoryModel then
		local tabCategory = Engine.GetModelValue( tabCategoryModel )
		SetGlobalModelValue( "challengeCategory", tabCategory )
		local f1155_local0 = menu.TabFrame.framedWidget
		if f1155_local0 then
			local callingCardGrid = menu.TabFrame.framedWidget.CallingCardGrid
		end
		if f1155_local0 then
			f1155_local0:updateDataSource()
		end
	end
end

function CallingCards_SetPlayerBackground( menu, element, controller )
	local backgroundIdModel = Engine.GetModel( element:getModel(), "iconId" )
	if backgroundIdModel ~= nil then
		local backgroundId = Engine.GetModelValue( backgroundIdModel )
		if menu.callingCardShowcaseSlot then
			Engine.SetCombatRecordBackgroundId( controller, backgroundId, menu.callingCardShowcaseSlot )
			local showcaseUpdateModel = Engine.GetModel( Engine.GetGlobalModel(), "CallingCardShowcaseUpdated" )
			if showcaseUpdateModel then
				Engine.ForceNotifyModelSubscriptions( showcaseUpdateModel )
			end
			GoBackToMenu( menu, controller, "CombatRecordMP" )
			CoD.perController[controller].currentCallingCardTabElement = nil
		else
			SetEmblemBackground_Internal( controller, backgroundId )
		end
		element:playSound( "list_action", controller )
	end
	ForceNotifyControllerModel( controller, "identityBadge.xuid" )
end

function CallingCards_EmblemGetProfile( menu, element, controller )
	Engine.ExecNow( controller, "emblemGetProfile" )
	ForceNotifyControllerModel( controller, "identityBadge.xuid" )
end

function CallingCards_GoBack( self, controller )
	if not IsLive() then
		Engine.CommitProfileChanges( controller )
	else
		UploadPublicProfile( self, controller )
	end
end

function CallingCards_UpdateListFromTabChanged( menu, element, controller )
	local tabCategoryModel = element:getModel( controller, "tabCategory" )
	if tabCategoryModel then
		local tabCategory = Engine.GetModelValue( tabCategoryModel )
		SetGlobalModelValue( "challengeGameMode", tabCategory )
		CoD.perController[controller].currentCallingCardTabElement = element
		local f1159_local0 = menu.TabFrame.framedWidget
		if f1159_local0 then
			local callingCardGrid = menu.TabFrame.framedWidget.CallingCardGrid
		end
		if f1159_local0 then
			f1159_local0:updateDataSource()
		end
	end
end

function CallingCards_SetOld( element, controller )
	local id = CoD.SafeGetModelValue( element:getModel(), "iconId" )
	if id then
		Engine.SetEmblemBackgroundAsOld( controller, id )
		if CoD.perController[controller].currentCallingCardTabElement then
			local breadcrumbModel = Engine.GetModel( CoD.perController[controller].currentCallingCardTabElement:getModel(), "breadcrumbCount" )
			if breadcrumbModel then
				Engine.SetModelValue( breadcrumbModel, math.max( 0, Engine.GetModelValue( breadcrumbModel ) - 1 ) )
			end
		end
		if CoD.perController[controller].currentCallingCardBlackMarketElement then
			local breadcrumbModel = Engine.GetModel( CoD.perController[controller].currentCallingCardBlackMarketElement:getModel(), "newCount" )
			if breadcrumbModel then
				Engine.SetModelValue( breadcrumbModel, math.max( 0, Engine.GetModelValue( breadcrumbModel ) - 1 ) )
			end
		end
	end
end

function OpenEnterPrestigeModeMenu( self, controller, menu )
	if CheckIfFeatureIsBanned( controller, LuaEnum.FEATURE_BAN.PRESTIGE ) then
		LuaUtils.UI_ShowErrorMessageDialog( controller, GetFeatureBanInfo( controller, LuaEnum.FEATURE_BAN.PRESTIGE ) )
		return 
	else
		OpenSystemOverlay( self, menu, controller, "EnterPrestigeMode", nil )
	end
end

function OpenPrestigeRefundTokensMenu( self, controller, menu )
	if CheckIfFeatureIsBanned( controller, LuaEnum.FEATURE_BAN.PRESTIGE_EXTRAS ) then
		LuaUtils.UI_ShowErrorMessageDialog( controller, GetFeatureBanInfo( controller, LuaEnum.FEATURE_BAN.PRESTIGE_EXTRAS ) )
		return 
	else
		OpenSystemOverlay( self, menu, controller, "PrestigeRefundTokens", nil )
	end
end

function OpenPrestigeFreshStartMenu( self, controller, menu )
	if CheckIfFeatureIsBanned( controller, LuaEnum.FEATURE_BAN.PRESTIGE_EXTRAS ) then
		LuaUtils.UI_ShowErrorMessageDialog( controller, GetFeatureBanInfo( controller, LuaEnum.FEATURE_BAN.PRESTIGE_EXTRAS ) )
		return 
	else
		OpenSystemOverlay( self, menu, controller, "PrestigeFreshStart1", nil )
	end
end

function OpenCustomizePrestigeMenu( self, controller, menu )
	if CheckIfFeatureIsBanned( controller, LuaEnum.FEATURE_BAN.PRESTIGE_EXTRAS ) then
		LuaUtils.UI_ShowErrorMessageDialog( controller, GetFeatureBanInfo( controller, LuaEnum.FEATURE_BAN.PRESTIGE_EXTRAS ) )
		return 
	elseif CoD.PrestigeUtility.GetPrestigeGameMode() == Enum.eModes.MODE_ZOMBIES then
		OpenOverlay( self, "Prestige_CustomizePrestigeIconZM", controller, "", "" )
	else
		OpenOverlay( self, "Prestige_CustomizePrestigeIcon", controller, "", "" )
	end
end

function OpenPermanentUnlockMenu( self, controller, menu )
	if CheckIfFeatureIsBanned( controller, LuaEnum.FEATURE_BAN.PRESTIGE_EXTRAS ) then
		LuaUtils.UI_ShowErrorMessageDialog( controller, GetFeatureBanInfo( controller, LuaEnum.FEATURE_BAN.PRESTIGE_EXTRAS ) )
		return 
	else
		CoD.PrestigeUtility.previousGameMode = CoD.gameMode
		CoD.PrestigeUtility.previousStatsMilestonePath = CoD.statsMilestonePath
		CoD.gameMode = "MP"
		CoD.statsMilestonePath = "gamedata/stats/mp/statsmilestones"
		SetHeadingKickerText( "MENU_PERMANENT_UNLOCKS" )
		CoD.PrestigeUtility.CreatePermanentUnlockTokenModel( controller )
		local classModel = Engine.CreateModel( Engine.GetModelForController( controller ), "PermanentlyUnlockClass" )
		CoD.CACUtility.GetCustomClassModel( controller, 0, classModel )
		CoD.perController[controller].classModel = classModel
		OpenOverlay( self, "Prestige_PermanentUnlocks", controller )
	end
end

function ClosePermanentUnlockMenu( self, controller, menu )
	CoD.gameMode = CoD.PrestigeUtility.previousGameMode
	CoD.statsMilestonePath = CoD.PrestigeUtility.previousStatsMilestonePath
	SendClientScriptNotify( controller, "CustomClass_closed" .. CoD.GetLocalClientAdjustedNum( controller ) )
	GoBack( self, controller )
end

function OpenPermanentUnlockCategoryMenu( self, element, controller, param, menu )
	local categoryData = CoD.PrestigeUtility.GetContentCategoryData( param )
	CoD.perController[controller].weaponCategory = categoryData.weaponCategory
	NavigateToMenu( self, categoryData.menuName, true, controller )
end

function OpenPermanentWeaponUnlockCategoryMenu( self, element, controller, param, menu )
	CoD.CraftUtility.Gunsmith.ParseDDL( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
	OpenPermanentUnlockCategoryMenu( self, element, controller, param, menu )
end

function SetIsInPrestigeMenu( booleanArg )
	CoD.PrestigeUtility.isInPermanentUnlockMenu = booleanArg
end

function OpenPermanentUnlockClassItemDialog( menu, element, controller )
	CoD.OverlayUtility.CreateOverlay( controller, menu, "PermanentUnlockClassItem", controller, Engine.GetModelValue( element:getModel( controller, "itemIndex" ) ), nil )
end

function OpenPrestigeMasterDialogIfNeeded( menu, controller, mode )
	if not PlayerGainedPrestigeMaster( controller, mode ) then
		return 
	else
		CoD.OverlayUtility.CreateOverlay( controller, menu, "PrestigeMasterNotification", controller, nil )
		Engine.Exec( controller, "PrestigeStatsMaster " .. tostring( mode ) )
		SaveLoadout( menu, controller )
		Engine.Exec( controller, "uploadstats " .. tostring( mode ) )
		Engine.Exec( controller, "savegamerprofilestats" )
	end
end

function PermanentlyUnlockItem( self, element, controller )
	local itemIndexModel = nil
	local itemIndex = element.itemIndex
	if not itemIndex then
		itemIndexModel = element:getModel( controller, "itemIndex" )
		if itemIndexModel then
			itemIndex = Engine.GetModelValue( itemIndexModel )
		end
	end
	if itemIndex then
		Engine.PermanentlyUnlockItem( controller, itemIndex, CoD.PrestigeUtility.GetPrestigeGameMode() )
		SaveLoadout( self, controller )
		UploadStats( self, controller )
		Engine.SendClientScriptNotify( controller, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( controller ), {
			base_weapon_slot = "purchased"
		} )
	end
end

function SetParagonIcon( self, element, controller )
	local iconIdModel = element:getModel( controller, "iconId" )
	if not iconIdModel then
		return 
	else
		local iconId = Engine.GetModelValue( iconIdModel )
		local currentStats = Engine.GetPlayerStats( controller, CoD.STATS_LOCATION_NORMAL, CoD.PrestigeUtility.GetPrestigeGameMode() )
		currentStats.PlayerStatsList.PARAGON_ICON_ID.StatValue:set( iconId )
	end
end

function OpenAARIfNeeded( menu, controller )
	if CanShowAAR( controller ) and IsAARValid( controller ) then
		local aarType = ""
		if IsCustomLobby() then
			aarType = "custom"
		elseif IsLAN() then
			aarType = "lan"
		else
			aarType = "public"
		end
		local maxControllers = Engine.GetMaxControllerCount()
		for i = 0, maxControllers - 1, 1 do
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( i ), "aarType" ), aarType )
		end
		if AutomaticallyOpenAAR( controller ) then
			local menuOpeningTimer = LUI.UITimer.new( 1000, "open_aar", true, menu )
			menu:registerEventHandler( "open_aar", function ( menu, event )
				if not CanShowAAR( controller ) then
					return 
				end
				Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "doAARXPBarAnimation" ), true )
				if CoD.isZombie then
					if CoD.AARUtility.AnyRewardsEarnedDuringMatch( controller ) then
						local overlay = OpenOverlay( menu, "RewardsOverlay", controller )
						OpenPrestigeMasterDialogIfNeeded( overlay, controller, Enum.eModes.MODE_ZOMBIES )
					else
						local overlay = OpenOverlay( menu, "ZMAAR", controller )
						OpenPrestigeMasterDialogIfNeeded( overlay, controller, Enum.eModes.MODE_ZOMBIES )
					end
				elseif IsArenaMode() then
					OpenOverlay( menu, "ArenaResult", controller )
				elseif CoD.AARUtility.AnyRewardsEarnedDuringMatch( controller ) then
					local overlay = OpenOverlay( menu, "RewardsOverlay", controller )
					OpenPrestigeMasterDialogIfNeeded( overlay, controller, Enum.eModes.MODE_MULTIPLAYER )
				else
					local overlay = OpenOverlay( menu, "MPAAR", controller )
					OpenPrestigeMasterDialogIfNeeded( overlay, controller, Enum.eModes.MODE_MULTIPLAYER )
				end
				local stats = CoD.GetPlayerStats( controller )
				stats.AfterActionReportStats.lobbyPopup:set( "" )
			end )
			menu:addElement( menuOpeningTimer )
		end
	end
end

function OpenAAR( menu, controller )
	if CoD.isZombie then
		if CoD.AARUtility.AnyRewardsEarnedDuringMatch( controller ) then
			OpenOverlay( menu, "RewardsOverlay", controller )
		else
			OpenOverlay( menu, "ZMAAR", controller )
		end
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "doAARXPBarAnimation" ), true )
		if IsArenaMode() then
			OpenOverlay( menu, "ArenaResult", controller )
		elseif CoD.AARUtility.AnyRewardsEarnedDuringMatch( controller ) then
			OpenOverlay( menu, "RewardsOverlay", controller )
		else
			OpenOverlay( menu, "MPAAR", controller )
		end
	end
end

function SetStableStatsBuffer( controller )
	Engine.MakeStableStatsBufferForController( controller )
end

function SurveyShouldShow( controller )
	local stats = CoD.GetPlayerStats( controller )
	local value = tonumber( stats.AfterActionReportStats.surveyId:get() )
	local matchid = tonumber( stats.AfterActionReportStats.demoFileID:get() )
	if matchid == 0 then
		return false
	elseif value == 0 then
		return false
	else
		return true
	end
end

function GoBackAndShowMatchSurveyIfNecessary( menu, controller )
	local parent = GoBack( menu, controller )
	local showMatchSurveyModel = Engine.CreateModel( Engine.GetModelForController( controller ), "lobbyRoot.showPostMatchSurvey" )
	local showMatchSurvey = Engine.GetModelValue( showMatchSurveyModel )
	local serverSurvey = SurveyShouldShow( controller )
	if showMatchSurvey == true and serverSurvey == true then
		Engine.SetModelValue( showMatchSurveyModel, false )
		CoD.OverlayUtility.CreateOverlay( controller, parent, "PostMatchSurvey" )
	end
end

function CloseCPAAR( menu, controller )
	CoD.perController[controller].lastAARMapName = Dvar.ui_mapname:get()
	CoD.perController[controller].fromMaxLevelMessage = false
end

function OpenMOTDPopup( self, element, controller, param, menu )
	if param ~= nil then
		local controllerModel = Engine.GetModelForController( controller )
		Engine.SetModelValue( Engine.CreateModel( controllerModel, "MOTDMenu.ActionSource" ), param )
	end
	local overlay = menu:openOverlay( "MOTD", controller )
	local model = Engine.GetModel( Engine.GetGlobalModel(), "MtxCommsMOTD" )
	overlay.crm_message_id = Engine.GetModelValue( Engine.GetModel( model, "messageID" ) )
	Engine.ReportMarketingMessageViewed( controller, "motd" )
	CoD.MetricsUtility.CRMMessageImpression( self, controller, "motd" )
	if not ShouldPresentMOTDBanner( controller, overlay ) then
		overlay.motdFooter:close()
	else
		Engine.ReportMarketingMessageViewed( controller, "registration" )
		CoD.MetricsUtility.CRMMessageImpression( self, controller, "registration" )
	end
end

function MOTDPopupAcceptAction( self, element, controller, param, menu )
	CoD.MetricsUtility.CRMMessageInteraction( self, controller, "motd" )
	local model = Engine.CreateModel( Engine.GetModelForController( controller ), "MOTDMenu.ActionSource" )
	local actionSource = Engine.GetModelValue( model )
	if actionSource == "FeaturedWidget" then
		GoBack( menu, controller )
		return 
	elseif LuaUtils.IsBetaBuild() then
		if IsFirstTimeSetup( controller, Enum.eModes.MODE_MULTIPLAYER ) then
			OpenMPFirstTimeFlow( self, nil, controller, nil, self )
		else
			NavigateToLobby_FirstTimeFlowMP( self, nil, controller, menu )
		end
	else
		CoD.LobbyUtility.NavigateToLobby( self, "ModeSelect", false, controller )
	end
	SendClientScriptMenuChangeNotify( controller, menu, false )
	Close( self, controller )
end

function OpenCRMFeaturedPopup( self, element, controller, param, menu )
	if param == "MOTDBanner" then
		local popupModel = Engine.CreateModel( Engine.GetGlobalModel(), "CRMPopup" )
		Engine.SetModelValue( Engine.CreateModel( popupModel, "location" ), "registration" )
		Engine.SetModelValue( Engine.CreateModel( popupModel, "actionSource" ), param )
	elseif param == "Featured" then
		local popupModel = Engine.CreateModel( Engine.GetGlobalModel(), "CRMPopup" )
		Engine.SetModelValue( Engine.CreateModel( popupModel, "location" ), "crm_featured" )
		Engine.SetModelValue( Engine.CreateModel( popupModel, "actionSource" ), param )
	end
	OpenOverlay( menu, "CRMPopup", controller )
end

function CRMFeaturedPopupActionHandler( self, element, controller, param, menu )
	local action = nil
	action = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "CRMPopup.action" ) )
	local location = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "CRMPopup.location" ) )
	if action ~= nil and action ~= "" then
		CoD.MetricsUtility.CRMMessageInteraction( self, controller, location )
		if action == "store" then
			local previousMenu = GoBack( self, controller )
			if CoD.isPC then
				OpenSteamStore( self, element, controller, previousMenu.name, previousMenu )
			else
				OpenStore( self, element, controller, previousMenu.name, previousMenu )
			end
		elseif action == "blackmarket" then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "blackmarketOpenSource" ), Engine.GetCurrentMode() )
			Engine.SwitchMode( controller, "mp" )
			local previousMenu = GoBack( self, controller )
			OpenBlackMarket( previousMenu, nil, controller )
		elseif action == "drmonty" then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "megachewOpenSource" ), Engine.GetCurrentMode() )
			Engine.SwitchMode( controller, "zm" )
			local previousMenu = GoBack( self, controller )
			OpenMegaChewFactorymenu( self, element, controller, previousMenu.name, previousMenu )
		end
	end
end

function HandleGoBackFromBlackMarket( self, element, controller, param, menu )
	local model = Engine.GetModel( Engine.GetGlobalModel(), "blackmarketOpenSource" )
	local currentMode = Engine.GetCurrentMode()
	if model ~= nil then
		local sourceMode = Engine.GetModelValue( model )
		if sourceMode ~= currentMode then
			Engine.SwitchMode( controller, sourceMode )
		end
		Engine.UnsubscribeAndFreeModel( model )
	end
end

function HandleGoBackFromMegaChew( self, element, controller, param, menu )
	local model = Engine.GetModel( Engine.GetGlobalModel(), "megachewOpenSource" )
	if model ~= nil then
		local sourceMode = Engine.GetModelValue( model )
		if sourceMode ~= currentMode then
			Engine.SwitchMode( controller, sourceMode )
		end
		Engine.UnsubscribeAndFreeModel( model )
	end
end

function GoToModeSelectFromCRMPopup( self, controller, menu )
	local model = Engine.CreateModel( Engine.GetModelForController( controller ), "MOTDMenu.ActionSource" )
	local actionSource = Engine.GetModelValue( model )
	if actionSource == "FeaturedWidget" then
		GoBack( menu, controller )
		return 
	else
		CoD.LobbyUtility.NavigateToLobby( self, "ModeSelect", false, controller )
		SendClientScriptMenuChangeNotify( controller, menu, false )
		Close( self, controller )
	end
end

function BubbleGumBuffSelectTabChanged( self, element, controller )
	local itemGroup = element.filter
	if itemGroup then
		CoD.perController[controller].weaponCategory = itemGroup
		DataSources.Unlockables.setCurrentFilterItem( itemGroup )
		self.selectionList:updateDataSource()
	end
end

function EquipBubblegumPack( self, element, controller )
	local bgbPackIndexModel = element:getModel( controller, "bgbPackIndex" )
	local bgbPackIndex = Engine.GetModelValue( bgbPackIndexModel )
	Engine.EquipBubbleGumPack( controller, bgbPackIndex )
end

function EquipBubblegumBuff( self, element, controller )
	local bgbPackIndex = Engine.GetEquippedBubbleGumPack( controller )
	local bgbIndex = CoD.perController[controller].bgbIndex
	local itemIndex = Engine.GetModelValue( element:getModel( controller, "itemIndex" ) )
	local swapItemIndex, swapBGBIndex = nil
	for currentBGBIndex = 0, CoD.BGBUtility.NumBuffsPerPack - 1, 1 do
		local equippedItemIndex = Engine.GetBubbleGumBuff( controller, bgbPackIndex, currentBGBIndex )
		if equippedItemIndex == itemIndex then
			swapBGBIndex = currentBGBIndex
			swapItemIndex = Engine.GetBubbleGumBuff( controller, bgbPackIndex, bgbIndex )
			break
		end
	end
	Engine.SetBubbleGumBuff( controller, bgbPackIndex, bgbIndex, itemIndex )
	if swapBGBIndex then
		Engine.SetBubbleGumBuff( controller, bgbPackIndex, swapBGBIndex, swapItemIndex )
	end
end

function ShowBubblegumBuffModel( self, element, controller )
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	local itemIndex = Engine.GetModelValue( itemIndexModel )
	local slotName = Engine.GetItemGroup( itemIndex, Enum.eModes.MODE_ZOMBIES )
	local isItemUnlocked = not IsBGBItemLocked( self, element, controller )
	local isItemTokenLocked = not IsCACItemPurchased( element, controller )
	local camera = "select01"
	local modelName = "p7_" .. Engine.GetItemRef( itemIndex, Enum.eModes.MODE_ZOMBIES ) .. "_ui"
	Engine.SendClientScriptNotify( controller, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( controller ), {
		base_weapon_slot = slotName,
		weapon = modelName,
		camera = camera,
		is_item_unlocked = isItemUnlocked,
		is_item_tokenlocked = isItemTokenLocked
	} )
end

function SelectBubblegumBuff( self, element, controller )
	local bgbIndex = Engine.GetModelValue( element:getModel( controller, "bgbIndex" ) )
	CoD.perController[controller].bgbIndex = bgbIndex
end

function SetBubbleGumPackNameFromPackIndex( controllerArg, packIndex, packName )
	return Engine.SetBubbleGumPackName( controllerArg, packIndex, packName )
end

function MegaChewFactoryFocusChanged( self, element, controller )
	local machineIndexModel = element:getModel( controller, "index" )
	if machineIndexModel then
		Engine.SendClientScriptNotify( controller, "mega_chew_update", {
			event = "focus_changed",
			index = Engine.GetModelValue( machineIndexModel )
		} )
	end
end

function MegaChewFactoryMachineSelect( self, element, controller )
	PlaySoundAlias( "uin_bm_denied" )
	LuaUtils.UI_ShowInfoMessageDialog( controller, Engine.Localize( "MENU_BGB_FACTORY_ERR_INSUFFICIENT_FUNDS" ) )
end

function MegaChewFactoryPurchase( self, element, controller )
	local machinePriceModel = element:getModel( controller, "price" )
	local controllerModel = Engine.GetModelForController( controller )
	local megaChewFactoryModel = Engine.CreateModel( controllerModel, "MegaChewFactory" )
	local getResultsOrKeepWaitingModel = Engine.CreateModel( megaChewFactoryModel, "getResultsOrKeepWaiting" )
	if machinePriceModel and getResultsOrKeepWaitingModel then
		local machinePrice = Engine.GetModelValue( machinePriceModel )
		Engine.SendClientScriptNotify( controller, "mega_chew_update", {
			event = "purchased",
			index = Engine.GetModelValue( machinePriceModel ),
			controller = controller
		} )
	end
end

function FocusWeaponBuildKit( self, element, controller )
	Gunsmith_GainFocus( self, element, controller )
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	if not weaponIndex then
		return 
	else
		local variantList = CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList( weaponIndex )
		local variant = CoD.CraftUtility.Gunsmith.GetVariantByIndex( controller, variantList[#variantList].variantIndex )
		local variantModel = Engine.CreateModel( Engine.GetModelForController( controller ), "WeaponBuildKitVariant" )
		DataSources.GunsmithVariantList.createVariantModel( controller, weaponIndex, variant, 1, variantModel )
		CoD.perController[controller].gunsmithVariantModel = variantModel
		CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( controller, CoD.perController[controller].gunsmithVariantModel )
		self:setModel( variantModel )
		self.WeaponBuildKitsAttachmentsPreview:processEvent( {
			name = "update_state",
			controller = controller
		} )
	end
end

function SelectWeaponBuildKitCategory( element, controller )
	local categoryModel = Engine.GetModel( element:getModel(), "categoryRef" )
	if categoryModel then
		local category = Engine.GetModelValue( categoryModel )
		DataSources.Unlockables.setCurrentFilterItem( category )
		CoD.perController[controller].weaponCategory = category
	end
end

function SelectWeaponBuildKit( self, element, controller )
	Gunsmith_BrowseVariants( self, element, controller )
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	if not weaponIndex then
		return 
	end
	local variantList = CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList( weaponIndex )
	local variant = CoD.CraftUtility.Gunsmith.GetVariantByIndex( controller, variantList[#variantList].variantIndex )
	local variantModel = Engine.CreateModel( Engine.GetModelForController( controller ), "WeaponBuildKitVariant" )
	DataSources.GunsmithVariantList.createVariantModel( controller, weaponIndex, variant, 1, variantModel )
	CoD.perController[controller].gunsmithVariantModel = variantModel
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( controller, CoD.perController[controller].gunsmithVariantModel )
	if not CoD.CraftUtility.Gunsmith.IsVariantIndexOccupied( variant.variantIndex ) then
		local validVariantNameModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.validVariantNameEntered" )
		Engine.SetModelValue( validVariantNameModel, false )
		local variantTextEntryModel = Engine.GetModel( variantModel, "variantTextEntry" )
		if variantTextEntryModel then
			Engine.SetModelValue( variantTextEntryModel, "" )
			local validVariantNameModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.validVariantNameEntered" )
			Engine.SetModelValue( validVariantNameModel, true )
		end
		local variantTextEntry = Engine.GetModelValue( variantTextEntryModel )
		local variantNameModel = Engine.GetModel( variantModel, "variantName" )
		Engine.SetModelValue( variantNameModel, variantTextEntry )
	end
	OpenOverlay( self, "WeaponBuildKitsCustomizeVariant", controller )
	Gunsmith_ChooseWeaponList( self, element, controller )
end

function SaveWeaponBuildKit( self, element, controller )
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	CoD.CraftUtility.Gunsmith.WriteVaraintDataToDDL( controller, self:getModel() )
	local customizeVariantMenu = self
	local gunsmithMenu = GoBackAndUpdateStateOnPreviousMenu( customizeVariantMenu, controller )
	ClearMenuSavedState( customizeVariantMenu )
	local variantIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "variantIndex" ) )
	gunsmithMenu.variantSelector.variantList:updateDataSource( true )
	gunsmithMenu.variantSelector.variantList:findItem( {
		variantIndex = variantIndex
	}, nil, true, nil )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( controller, variantModel )
end

function SetMap( controller, mapName, loadIntoSafehouse )
	local mapData = CoD.MapUtility.MapsTable[mapName]
	if mapData == nil then
		mapName = LuaUtils.GetDefaultMap( LobbyData.GetCurrentMenuTarget() )
		mapData = CoD.MapUtility.MapsTable[mapName]
	end
	if mapData.serverCmds and mapData.serverCmds ~= "" then
		Engine.Exec( controller, mapData.serverCmds )
	end
	if loadIntoSafehouse then
		Engine.SetDvar( "cp_queued_level", mapName )
		if mapData.safeHouse then
			mapName = mapData.safeHouse
		end
	end
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST )
	if mapData.baseMapId and mapData.baseMapId ~= "" then
		Engine.LobbySetMap( lobbyType, mapData.baseMapId )
	else
		Engine.LobbySetMap( lobbyType, mapName )
	end
	if IsFreeRunMap( mapName ) then
		Engine.SetProfileVar( controller, CoD.profileKey_map_fr, mapName )
	else
		Engine.SetProfileVar( controller, CoD.profileKey_map, mapName )
	end
	local selectedMapModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.selectedMapId" )
	Engine.SetModelValue( selectedMapModel, mapName )
	Engine.CommitProfileChanges( controller )
end

function OpenPurchaseMapPackConfirmation( controller, element, menu )
	local f1202_local0 = Engine.GetDLCBitForMapName
	local f1202_local1 = element.mapName
	if not f1202_local1 then
		f1202_local1 = element.mapId or element.id
	end
	local dlcBit = f1202_local0( f1202_local1 )
	local actionParam = {
		dlcPack = dlcBit and CoD.DLCPackFromBit[dlcBit]
	}
	CoD.OverlayUtility.CreateOverlay( controller, menu, "PurchaseMapPackConfirmation", controller, actionParam )
end

function MapSelected( element, controller )
	SetMap( controller, element.mapName, false )
end

function CustomGamesOpenMyShowcase( self, controller )
	CoD.FileshareUtility.SetFileshareMode( controller, Enum.FileshareMode.FILESHARE_MODE_USER )
	FileshareSetShowcasePublishMode( controller, false )
	local xuid = Engine.GetXUID64( controller )
	CoD.FileshareUtility.FetchContentForUser( controller, xuid )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	CoD.FileshareUtility.SetShowFileDetails( false )
	CoD.FileshareUtility.SetShowPublishNewDetails( false )
	CoD.FileshareUtility.SetShowCreateButton( false )
	SetInCustomGames( 1 )
	OpenShowcaseCustomGames( self, nil, controller, "", nil )
end

function SetInCustomGames( booleanArg )
	local root = Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" )
	Engine.SetModelValue( Engine.CreateModel( root, "inCustomGames" ), booleanArg )
end

function CustomGamesOpenOptions( self, controller, menu )
	OpenPopup( self, "CustomGamesOptions", controller )
end

function GetCurrentGameType( controller )
	return Engine.GetDvarString( "ui_gametype" )
end

function SetCurrentUIGameType( element, controller )
	local root = Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" )
	Engine.SetModelValue( Engine.CreateModel( root, "communityOption" ), false )
	Engine.SetModelValue( Engine.CreateModel( root, "showcaseOption" ), false )
	if element.gametype then
		Engine.SetModelValue( Engine.CreateModel( root, "gameType" ), element.gametype )
		if CoD.perController[controller].previousGameType ~= element.gametype then
			CustomGameMarkDirty( controller )
			CoD.perController[controller].previousGameType = ""
		end
	end
	if element.community or element.showcase then
		Engine.SetModelValue( Engine.CreateModel( root, "gameType" ), "" )
		Engine.SetModelValue( Engine.CreateModel( root, "communityOption" ), element.community )
		Engine.SetModelValue( Engine.CreateModel( root, "showcaseOption" ), element.showcase )
		local selectedRoot = Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" )
		if Engine.GetModelValue( Engine.CreateModel( selectedRoot, "secondaryListSelected" ) ) == true then
			Engine.SetModelValue( Engine.CreateModel( selectedRoot, "secondaryListSelected" ), false )
		else
			CustomGameMarkDirty( controller )
		end
	end
end

function GetCurrentUIGameType( controller )
	local root = Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" )
	local gameType = Engine.GetModelValue( Engine.CreateModel( root, "gameType" ) )
	return gameType or "tdm"
end

function LoadCustomGame( element, controller )
	local slotModel = element:getModel( controller, "slot" )
	local indexModel = element:getModel( controller, "index" )
	local nameModel = element:getModel( controller, "gameName" )
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST )
	Engine.LobbyHostSetCustomGameName( lobbyType, "" )
	if slotModel and indexModel then
		local isOfficial = false
		local isOfficialModel = element:getModel( controller, "isOfficial" )
		if isOfficialModel then
			isOfficial = Engine.GetModelValue( isOfficialModel )
		end
		if isOfficial then
			Engine.Exec( controller, "customgames_loadofficialgame " .. Engine.GetModelValue( slotModel ) .. " " .. Engine.GetModelValue( indexModel ) )
		else
			Engine.Exec( controller, "customgames_load " .. Engine.GetModelValue( slotModel ) .. " " .. Engine.GetModelValue( indexModel ) )
		end
		CustomGamesShowLoadSuccessToast( element, controller, Engine.GetModelValue( nameModel ) )
	end
end

function LoadFileshareCustomGame( self, element, controller )
	local itemModel = CoD.FileshareUtility.GetSelectedItem()
	local fileId = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	if fileId then
		Engine.LoadFileshareCustomGame( controller, fileId )
	end
end

function SaveCustomGame( self, controller, menu )
	local root = Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" )
	local isOfficial = Engine.GetModelValue( Engine.CreateModel( root, "isOfficial" ) )
	local slot = Engine.GetModelValue( Engine.CreateModel( root, "slot" ) )
	local index = Engine.GetModelValue( Engine.CreateModel( root, "index" ) )
	local name = Engine.GetModelValue( Engine.CreateModel( root, "gameName" ) )
	local description = Engine.GetModelValue( Engine.CreateModel( root, "gameDescription" ) )
	if not name or name == "" then
		name = "Custom Game"
	end
	if not description or description == "" then
		local gameTypeInfo = Engine.GetGameTypeInfo( GetCurrentGameType() )
		description = Engine.Localize( gameTypeInfo.descriptionRef )
	end
	if isOfficial == nil or isOfficial == 1 or isOfficial == true then
		Engine.SetModelValue( Engine.CreateModel( root, "gameName" ), "Custom Game" )
		Engine.SetModelValue( Engine.CreateModel( root, "gameDescription" ), "Game Description" )
		OpenOverlay( self, "CustomGamesSave", menu )
	else
		Engine.Exec( controller, "customgames_save " .. slot .. " " .. index .. " " .. GetCurrentGameType() .. " \"" .. name .. "\"" .. " \"" .. description .. "\"" )
	end
end

function CustomGameSelectorLoseFocus( self, element, controller, menu )
	CoD.perController[controller].previousGameType = GetCurrentUIGameType( controller )
end

function SaveCustomGameYes( self, element, controller, param, menu )
	local root = Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" )
	local name = Engine.GetModelValue( Engine.CreateModel( root, "gameName" ) )
	local description = Engine.GetModelValue( Engine.CreateModel( root, "gameDescription" ) )
	if not name or name == "" then
		name = "Custom Game"
	end
	if not description or description == "" then
		local gameTypeInfo = Engine.GetGameTypeInfo( GetCurrentGameType() )
		description = Engine.Localize( gameTypeInfo.descriptionRef )
	end
	Engine.Exec( controller, "customgames_savenew " .. GetCurrentGameType() .. " \"" .. name .. "\"" .. " \"" .. description .. "\"" )
end

function DeleteCustomGame( self, element, controller, param, menu )
	local root = Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" )
	local isOfficial = Engine.GetModelValue( Engine.CreateModel( root, "isOfficial" ) )
	if isOfficial then
		return 
	else
		OpenOverlay( menu, "CustomGamesDelete", controller )
	end
end

function DeleteCustomGameYes( self, element, controller, param, menu )
	local root = Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" )
	local slot = Engine.GetModelValue( Engine.CreateModel( root, "slot" ) )
	local index = Engine.GetModelValue( Engine.CreateModel( root, "index" ) )
	GoBack( self, controller )
	Engine.Exec( controller, "customgames_delete " .. slot .. " " .. index )
end

function DeleteCustomGameNo( self, element, controller, param, menu )
	GoBack( menu, controller )
end

function CustomGamesProcessDeleteSuccess( self, controller, param )
	CustomGameMarkDirty( controller )
	local kicker = Engine.Localize( "MENU_CUSTOMGAME_DELETED" )
	local description = ""
	if not param or param == "" then
		local root = Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" )
		local gameName = Engine.GetModelValue( root, "gameName" )
		if gameName then
			description = gameName
		end
	else
		description = param
	end
	CoD.OverlayUtility.ShowToast( "Fileshare", kicker, description, "uie_t7_mp_icon_header_customgames", "uie_t7_mp_icon_header_customgames" )
end

function OpenCustomGamePublishPrompt( self, element, controller, param, menu )
	local root = Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" )
	local isOfficial = Engine.GetModelValue( Engine.CreateModel( root, "isOfficial" ) )
	local gameName = Engine.GetModelValue( Engine.CreateModel( root, "gameName" ) )
	local description = Engine.GetModelValue( Engine.CreateModel( root, "gameDescription" ) )
	if isOfficial then
		return 
	elseif not gameName then
		gameName = "Custom Game"
	end
	if not description then
		description = ""
	end
	CoD.FileshareUtility.OpenPublishPrompt( menu, controller, "customgame", gameName, description, PublishCustomGame )
end

function PublishCustomGame( controller )
	local root = Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" )
	local slot = Engine.GetModelValue( Engine.CreateModel( root, "slot" ) )
	local index = Engine.GetModelValue( Engine.CreateModel( root, "index" ) )
	local publishName = CoD.FileshareUtility.GetPublishName()
	local description = CoD.FileshareUtility.GetPublishDescription()
	Engine.PublishCustomGame( controller, "customgame", slot, index, publishName, GetCurrentUIGameType( controller ), description )
end

function SetSelectedCustomGame( element, controller )
	local elementModel = element:getModel()
	local root = Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" )
	Engine.SetModelValue( Engine.CreateModel( root, "secondaryListSelected" ), true )
	Engine.SetModelValue( Engine.CreateModel( root, "slot" ), CoD.SafeGetModelValue( elementModel, "slot" ) )
	Engine.SetModelValue( Engine.CreateModel( root, "index" ), CoD.SafeGetModelValue( elementModel, "index" ) )
	Engine.SetModelValue( Engine.CreateModel( root, "uiIndex" ), CoD.SafeGetModelValue( elementModel, "uiIndex" ) )
	Engine.SetModelValue( Engine.CreateModel( root, "gameName" ), CoD.SafeGetModelValue( elementModel, "gameName" ) )
	Engine.SetModelValue( Engine.CreateModel( root, "gameDescription" ), CoD.SafeGetModelValue( elementModel, "gameDescription" ) )
	Engine.SetModelValue( Engine.CreateModel( root, "isOfficial" ), CoD.SafeGetModelValue( elementModel, "isOfficial" ) )
end

function GetSelectedCustomGameModel( controller )
	return Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" )
end

function SetCurrentCustomGame( element, controller )
	local slotModel = element:getModel( controller, "slot" )
	local indexModel = element:getModel( controller, "index" )
	local isOfficialModel = element:getModel( controller, "isOfficial" )
	local gameNameModel = element:getModel( controller, "gameName" )
	local root = Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" )
	if slotModel and indexModel and gameNameModel then
		Engine.SetModelValue( Engine.CreateModel( root, "slot" ), Engine.GetModelValue( slotModel ) )
		Engine.SetModelValue( Engine.CreateModel( root, "index" ), Engine.GetModelValue( indexModel ) )
		Engine.SetModelValue( Engine.CreateModel( root, "gameName" ), Engine.GetModelValue( gameNameModel ) )
	end
	if isOfficialModel then
		local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST )
		local isOfficial = Engine.GetModelValue( isOfficialModel )
		Engine.LobbyHostSetOfficialCustomGame( lobbyType, isOfficial )
	end
end

function CustomGameMarkDirty( controller )
	local root = Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" )
	local dirtyModel = Engine.CreateModel( root, "dirty" )
	Engine.ForceNotifyModelSubscriptions( dirtyModel )
end

function OpenPopularCustomGames( self, element, controller )
	CoD.FileshareUtility.SetCurrentCommunityDataType( Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_POPULAR )
	CoD.FileshareUtility.SetFileshareMode( controller, Enum.FileshareMode.FILESHARE_MODE_COMMUNITY )
	local categoryModel = Engine.CreateModel( element:getModel(), "category" )
	local communityDataTypeModel = Engine.CreateModel( element:getModel(), "communityDataType" )
	Engine.SetModelValue( categoryModel, "customgame" )
	Engine.SetModelValue( communityDataTypeModel, Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_POPULAR )
	SetInCustomGames( 1 )
	FileshareCategorySelectorItemSelected( self, element, controller )
	CoD.FileshareUtility.SetShowCreateButton( false )
	CoD.FileshareUtility.SetShowFileDetails( false )
	CoD.FileshareUtility.SetShowPublishNewDetails( false )
	OpenShowcase( self, element, controller, nil, self )
end

function OpenTrendingCustomGames( self, element, controller )
	CoD.FileshareUtility.SetCurrentCommunityDataType( Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_TRENDING )
	CoD.FileshareUtility.SetFileshareMode( controller, Enum.FileshareMode.FILESHARE_MODE_COMMUNITY )
	local categoryModel = Engine.CreateModel( element:getModel(), "category" )
	local communityDataTypeModel = Engine.CreateModel( element:getModel(), "communityDataType" )
	Engine.SetModelValue( categoryModel, "customgame" )
	Engine.SetModelValue( communityDataTypeModel, Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_TRENDING )
	SetInCustomGames( 1 )
	FileshareCategorySelectorItemSelected( self, element, controller )
	CoD.FileshareUtility.SetShowCreateButton( false )
	CoD.FileshareUtility.SetShowFileDetails( false )
	CoD.FileshareUtility.SetShowPublishNewDetails( false )
	OpenShowcase( self, element, controller, nil, self )
end

function OpenrRecentCustomGames( self, element, controller )
	CoD.FileshareUtility.SetCurrentCommunityDataType( Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_RECENT )
	CoD.FileshareUtility.SetFileshareMode( controller, Enum.FileshareMode.FILESHARE_MODE_COMMUNITY )
	local categoryModel = Engine.CreateModel( element:getModel(), "category" )
	local communityDataTypeModel = Engine.CreateModel( element:getModel(), "communityDataType" )
	Engine.SetModelValue( categoryModel, "customgame" )
	Engine.SetModelValue( communityDataTypeModel, Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_RECENT )
	SetInCustomGames( 1 )
	FileshareCategorySelectorItemSelected( self, element, controller )
	CoD.FileshareUtility.SetShowCreateButton( false )
	CoD.FileshareUtility.SetShowFileDetails( false )
	CoD.FileshareUtility.SetShowPublishNewDetails( false )
	OpenShowcase( self, element, controller, nil, self )
end

function SetGameType( controller, gametype )
	Engine.Exec( controller, "resetCustomGametype" )
	local oldTeamBased = CoDShared.IsGametypeTeamBased()
	if gametype == "" then
		return 
	end
	Engine.SetGametype( gametype )
	local newTeamBased = CoDShared.IsGametypeTeamBased()
	if oldTeamBased ~= newTeamBased then
		Engine.SetDvar( "bot_friends", 0 )
		Engine.SetDvar( "bot_enemies", 0 )
	end
	Engine.Exec( controller, "xupdatepartystate" )
	Engine.SetProfileVar( controller, CoD.profileKey_gametype, gametype )
	Engine.CommitProfileChanges( controller )
	Engine.Exec( controller, "lobby_setgametype " .. gametype )
	Engine.LobbyEvent( "OnGametypeSettingsChange", {
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyModule = Enum.LobbyModule.LOBBY_MODULE_HOST
	} )
end

function GameModeSelected( element, controller )
	local gametype = GetCurrentUIGameType( controller )
	SetGameType( controller, gametype )
end

function CustomGameHandleKeyboardComplete( self, element, controller, event )
	if event.type == Enum.KeyboardType.KEYBOARD_TYPE_FILESHARE_PUBLISH_NAME then
		local root = Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" )
		Engine.SetModelValue( Engine.CreateModel( root, "gameName" ), event.input )
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_FILESHARE_PUBLISH_DESCRIPTION then
		local root = Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" )
		Engine.SetModelValue( Engine.CreateModel( root, "gameDescription" ), event.input )
	end
end

function CustomGamesShowLoadSuccessToast( self, controller, param )
	local kicker = Engine.Localize( "MENU_CUSTOMGAMES_LOADED" )
	local description = ""
	if not param or param == "" then
		local root = Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" )
		local gameName = Engine.GetModelValue( root, "gameName" )
		if gameName then
			description = gameName
		end
	else
		description = Engine.Localize( param )
	end
	CoD.OverlayUtility.ShowToast( "Fileshare", kicker, description, "uie_t7_mp_icon_header_customgames", "uie_t7_mp_icon_header_customgames" )
end

function CustomGamesShowLoadFailureToast( self, controller, param )
	local kicker = Engine.Localize( "MENU_CUSTOMGAMES_LOADED_ERROR" )
	local description = ""
	if not param then
		local root = Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" )
		local gameName = Engine.GetModelValue( root, "gameName" )
		if gameName then
			description = gameName
		end
	else
		description = param
	end
	CoD.OverlayUtility.ShowToast( "Fileshare", kicker, description, "uie_t7_icon_error_overlays", "uie_t7_icon_error_overlays" )
end

function CustomGamesShowSaveSuccessToast( self, controller, param )
	local kicker = Engine.Localize( "MENU_CUSTOMGAME_SAVED" )
	local description = ""
	if not param or param == "" then
		local root = Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" )
		local gameName = Engine.GetModelValue( root, "gameName" )
		if gameName then
			description = gameName
		end
	else
		description = param
	end
	CoD.OverlayUtility.ShowToast( "Fileshare", kicker, description, "uie_t7_mp_icon_header_customgames", "uie_t7_mp_icon_header_customgames" )
end

function CustomGamesShowSaveFailureToast( self, controller, param )
	local kicker = Engine.Localize( "MENU_CUSTOMGAME_SAVE_ERROR" )
	local description = ""
	if not param or param == "" then
		local root = Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" )
		local gameName = Engine.GetModelValue( root, "gameName" )
		if gameName then
			description = gameName
		end
	else
		description = param
	end
	CoD.OverlayUtility.ShowToast( "Fileshare", kicker, description, "uie_t7_icon_error_overlays", "uie_t7_icon_error_overlays" )
end

function PlaylistSelected( menu, element, controller )
	local filter = CoD.PlaylistCategoryFilter or ""
	Engine.SetPlaylistID( element.playlist.index )
	Engine.SetProfileVar( controller, "playlist_" .. filter, tostring( element.playlist.index ) )
	CoD.LobbyUtility.SetPlaylistName( element.playlist.name )
	local occludedMenu = menu.occludedMenu
	GoBack( menu, controller )
	if occludedMenu then
		occludedMenu:processEvent( {
			name = "playlist_selected",
			controller = controller,
			itemInfo = element.playlist
		} )
	end
end

function PlaylistCategorySelected( menu, element, controller )
	SetElementPropertyOnPerControllerTable( controller, "playlistCategory", element, "category" )
	UpdateElementDataSource( menu, "playlistList" )
	SetMenuState( menu, "SelectingPlaylist" )
	SetLoseFocusToElement( menu, "playlistCategoriesList", controller )
	MakeElementNotFocusable( menu, "playlistCategoriesList", controller )
	MakeElementFocusable( menu, "playlistList", controller )
	SetFocusToElement( menu, "playlistList", controller )
end

function BlockGameFromKeyEvent( controller )
	Engine.BlockGameFromKeyEvent()
end

function ToggleScoreboardClientMute( element, controller )
	Engine.BlockGameFromKeyEvent()
	local clientNumModel = element:getModel( controller, "clientNum" )
	if not clientNumModel then
		return 
	end
	local clientNum = Engine.GetModelValue( clientNumModel )
	if clientNum and clientNum >= 0 and Engine.GetClientNum( controller ) ~= clientNum then
		Engine.TogglePlayerMute( controller, clientNum )
		UpdateScoreboardClientMuteButtonPrompt( element, controller )
	end
end

function UpdateScoreboardClientMuteButtonPrompt( element, controller )
	local clientNumModel = element:getModel( controller, "clientNum" )
	if not clientNumModel then
		return 
	end
	local clientNum = Engine.GetModelValue( clientNumModel )
	local scoreboardButtonPromptVisibleModel = Engine.CreateModel( Engine.GetModelForController( controller ), "scoreboardInfo.muteButtonPromptVisible" )
	local scoreboardButtonPromptTextModel = Engine.CreateModel( Engine.GetModelForController( controller ), "scoreboardInfo.muteButtonPromptText" )
	Engine.SetModelValue( scoreboardButtonPromptVisibleModel, false )
	if clientNum and clientNum >= 0 then
		if Engine.GetClientNum( controller ) == clientNum then
			return 
		end
		Engine.SetModelValue( scoreboardButtonPromptVisibleModel, true )
		if Engine.IsPlayerMutedByClientNum( controller, Enum.LobbyType.LOBBY_TYPE_GAME, clientNum ) then
			Engine.SetModelValue( scoreboardButtonPromptTextModel, "MENU_UNMUTE_CAPS" )
		else
			Engine.SetModelValue( scoreboardButtonPromptTextModel, "MENU_MUTE_CAPS" )
		end
	end
end

function ShowGamerCardForScoreboardRow( controller, element )
	local clientNum = CoD.SafeGetModelValue( element:getModel(), "clientNum" )
	if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and CoD.SafeGetModelValue( Engine.GetModelForController( controller ), "forceScoreboard" ) ~= 1 then
		return 
	else
		Engine.ShowGamerCard( controller, clientNum )
	end
end

function ShowAccountPicker( controller )
	Engine.ShowAccountPicker( controller )
end

function AdjustBrightness( element, controller )
	local valueModel = element:getModel( controller, "value" )
	if valueModel then
		Engine.SetProfileVar( controller, "r_sceneBrightness", Engine.GetModelValue( valueModel ) )
		Engine.Exec( controller, "updategamerprofile" )
	end
end

function PurchaseDWSKU( self, element, controller )
	local skuIdModel = element:getModel( controller, "skuId" )
	if skuIdModel then
		local skuId = Engine.GetModelValue( skuIdModel )
		Engine.PurchaseDWSKU( controller, skuId )
		if Engine.GetMarketplaceSize() == 0 then
			self.MarketplaceList:processEvent( {
				name = "lose_focus",
				controller = controller
			} )
			self.PlayerInventoryList:processEvent( {
				name = "gain_focus",
				controller = controller
			} )
		end
	end
end

function RemoveFromPlayerInventory( self, element, controller )
	local itemIdModel = element:getModel( controller, "itemId" )
	if itemIdModel then
		local itemId = Engine.GetModelValue( itemIdModel )
		local itemQuantity = 1
		Engine.RemoveItemFromInventory( controller, itemId, itemQuantity )
		if Engine.GetPlayerInventorySize( controller ) == 0 then
			self.MarketplaceList:processEvent( {
				name = "gain_focus",
				controller = controller
			} )
			self.PlayerInventoryList:processEvent( {
				name = "lose_focus",
				controller = controller
			} )
		end
	end
end

function ReportItemUsageTime( self, element, controller )
	local usageTimeSeconds = 10
	Engine.ReportItemUsageTime( controller, usageTimeSeconds )
end

function AccountLink_SetAccountLinkViewed( self, element, controller )
	Engine.SetAccountLinkViewed( controller, true )
end

function AccountLink_HandleLoginKeyboardComplete( self, element, controller, event )
	local loginModel = Engine.GetModel( Engine.GetGlobalModel(), "AccountLinkLogin" )
	local emailModel, passwordModel = nil
	if not loginModel then
		return 
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_EMAIL then
		emailModel = Engine.GetModel( loginModel, "email" )
	end
	if event.type == Enum.KeyboardType.KEYBOARD_TYPE_PASSWORD then
		passwordModel = Engine.GetModel( loginModel, "password" )
	end
	if emailModel then
		Engine.SetModelValue( emailModel, event.input )
	end
	if passwordModel then
		Engine.SetModelValue( passwordModel, event.input )
		local s = ""
		for i = 0, string.len( event.input ) - 1, 1 do
			local f1247_local2 = i
			s = s .. "*"
		end
		Engine.SetModelValue( Engine.GetModel( loginModel, "stars" ), s )
	end
end

function AccountLink_Login( self, element, controller )
	local previousMenu = GoBack( self, controller )
	previousMenu:registerEventHandler( "optin_success", function ( self, event )
		CoD.OverlayUtility.CreateOverlay( controller, self, "OptInSuccess" )
	end )
	previousMenu:registerEventHandler( "registration_failure", function ( self, element, event )
		FinishRegistrationFlow( self, controller, self )
	end )
	local loginModel = Engine.GetModel( Engine.GetGlobalModel(), "AccountLinkLogin" )
	local password = Engine.GetModelValue( Engine.GetModel( loginModel, "password" ) )
	local email = Engine.GetModelValue( Engine.GetModel( loginModel, "email" ) )
	Engine.AccountLinkLogin( controller, tostring( email ), tostring( password ) )
end

function AccountLink_HandleRegisterKeyboardComplete( self, element, controller, event )
	local registerModel = Engine.GetModel( Engine.GetModelForController( controller ), "AccountLinkRegister" )
	local firstNameModel, lastNameModel, zipCodeModel, usernameModel, emailModel, passwordModel, confirmPassModel = nil
	if not registerModel then
		return 
	elseif event.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_FIRST_NAME then
		firstNameModel = Engine.GetModel( registerModel, "firstName" )
		if firstNameModel then
			Engine.SetModelValue( firstNameModel, event.input )
		end
	end
	if event.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_LAST_NAME then
		lastNameModel = Engine.GetModel( registerModel, "lastName" )
		if lastNameModel then
			Engine.SetModelValue( lastNameModel, event.input )
		end
	end
	if event.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_ZIP_CODE then
		zipCodeModel = Engine.GetModel( registerModel, "zipCode" )
		if zipCodeModel then
			Engine.SetModelValue( zipCodeModel, event.input )
		end
	end
	if event.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_USERNAME then
		usernameModel = Engine.GetModel( registerModel, "username" )
		if usernameModel then
			Engine.SetModelValue( usernameModel, event.input )
		end
	end
	if event.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_EMAIL then
		emailModel = Engine.GetModel( registerModel, "email" )
		if emailModel then
			Engine.SetModelValue( emailModel, event.input )
		end
	end
	if event.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_PASSWORD then
		passwordModel = Engine.GetModel( registerModel, "password" )
		if passwordModel then
			Engine.SetModelValue( passwordModel, event.input )
			local s = ""
			for i = 0, string.len( event.input ) - 1, 1 do
				local f1251_local2 = i
				s = s .. "*"
			end
			Engine.SetModelValue( Engine.GetModel( registerModel, "stars" ), s )
		end
	end
	if event.type == Enum.KeyboardType.KEYBOARD_TYPE_CONFIRM_PASSWORD then
		confirmPassModel = Engine.GetModel( registerModel, "confirmPass" )
		if confirmPassModel then
			Engine.SetModelValue( confirmPassModel, event.input )
			local s = ""
			for i = 0, string.len( event.input ) - 1, 1 do
				local f1251_local2 = i
				s = s .. "*"
			end
			Engine.SetModelValue( Engine.GetModel( registerModel, "confirmStars" ), s )
		end
	end
end

function AccountLink_SelectRegion( self, element, controller )
	local val = Engine.GetModelValue( element:getModel( controller, "itemName" ) )
	local registerModel = Engine.GetModel( Engine.GetModelForController( controller ), "AccountLinkRegister" )
	Engine.SetModelValue( Engine.GetModel( registerModel, "region" ), val )
end

function AccountLink_SelectGender( self, element, controller )
	local val = Engine.GetModelValue( element:getModel( controller, "gender" ) )
	local registerModel = Engine.GetModel( Engine.GetModelForController( controller ), "AccountLinkRegister" )
	Engine.SetModelValue( Engine.GetModel( registerModel, "gender" ), val )
end

function AccountLink_SelectMonth( self, element, controller )
	local string = Engine.GetModelValue( element:getModel( controller, "month" ) )
	local index = Engine.GetModelValue( element:getModel( controller, "monthIndex" ) )
	local registerModel = Engine.GetModel( Engine.GetModelForController( controller ), "AccountLinkRegister" )
	Engine.SetModelValue( Engine.GetModel( registerModel, "month" ), string )
	Engine.SetModelValue( Engine.GetModel( registerModel, "monthIndex" ), index )
end

function AccountLink_SelectDay( self, element, controller )
	local val = Engine.GetModelValue( element:getModel( controller, "day" ) )
	local registerModel = Engine.GetModel( Engine.GetModelForController( controller ), "AccountLinkRegister" )
	Engine.SetModelValue( Engine.GetModel( registerModel, "day" ), val )
end

function AccountLink_SelectYear( self, element, controller )
	local val = Engine.GetModelValue( element:getModel( controller, "year" ) )
	local registerModel = Engine.GetModel( Engine.GetModelForController( controller ), "AccountLinkRegister" )
	Engine.SetModelValue( Engine.GetModel( registerModel, "year" ), val )
end

function AccountLink_Register( self, element, controller )
	local registerModel = Engine.GetModel( Engine.GetModelForController( controller ), "AccountLinkRegister" )
	local fname = Engine.GetModelValue( Engine.GetModel( registerModel, "firstName" ) )
	local lname = Engine.GetModelValue( Engine.GetModel( registerModel, "lastName" ) )
	local zip = Engine.GetModelValue( Engine.GetModel( registerModel, "zipCode" ) )
	local region = Engine.GetModelValue( Engine.GetModel( registerModel, "region" ) )
	local username = Engine.GetModelValue( Engine.GetModel( registerModel, "username" ) )
	local email = Engine.GetModelValue( Engine.GetModel( registerModel, "email" ) )
	local password = Engine.GetModelValue( Engine.GetModel( registerModel, "password" ) )
	local confirmPassword = Engine.GetModelValue( Engine.GetModel( registerModel, "confirmPass" ) )
	local gender = Engine.GetModelValue( Engine.GetModel( registerModel, "gender" ) )
	local month = Engine.GetModelValue( Engine.GetModel( registerModel, "monthIndex" ) )
	local day = Engine.GetModelValue( Engine.GetModel( registerModel, "day" ) )
	local year = Engine.GetModelValue( Engine.GetModel( registerModel, "year" ) )
	local registerInfo = {
		firstName = tostring( fname ),
		lastName = tostring( lname ),
		zipCode = tostring( zip ),
		region = tostring( region ),
		username = tostring( username ),
		email = tostring( email ),
		password = tostring( password ),
		confirmPass = tostring( confirmPassword ),
		gender = tostring( gender ),
		month = month,
		day = day,
		year = year
	}
	if fname == nil then
		OpenGenericSmallPopup( self, controller, "Please enter a valid first name", "Specific Name Constriants Here.", nil, "MENU_OK" )
		return 
	elseif lname == nil then
		OpenGenericSmallPopup( self, controller, "Please enter a valid last name", "Specific Name Constriants Here.", nil, "MENU_OK" )
		return 
	elseif region == nil then
		OpenGenericSmallPopup( self, controller, "Please select a region", "Please select a region", nil, "MENU_OK" )
		return 
	elseif zip == nil or string.len( zip ) ~= 5 then
		OpenGenericSmallPopup( self, controller, "Please enter a valid zip code", "Specific Zip Code Constriants Here.", nil, "MENU_OK" )
		return 
	elseif username == nil then
		OpenGenericSmallPopup( self, controller, "Please enter a valid username", "Specific Username Constriants Here.", nil, "MENU_OK" )
		return 
	elseif password == nil then
		OpenGenericSmallPopup( self, controller, "Please enter a valid password", "Specific Password Constriants Here.", nil, "MENU_OK" )
		return 
	elseif confirmPassword == nil or password ~= confirmPassword then
		OpenGenericSmallPopup( self, controller, "Please confirm your password", "Please confirm your password.", nil, "MENU_OK" )
		return 
	elseif gender == nil then
		OpenGenericSmallPopup( self, controller, "Please select a gender", "Please select a gender.", nil, "MENU_OK" )
		return 
	elseif month == nil then
		OpenGenericSmallPopup( self, controller, "Please select a month", "Please select a month.", nil, "MENU_OK" )
		return 
	elseif day == nil then
		OpenGenericSmallPopup( self, controller, "Please select a day", "Please select a day.", nil, "MENU_OK" )
		return 
	elseif year == nil then
		OpenGenericSmallPopup( self, controller, "Please select a year", "Please select a year.", nil, "MENU_OK" )
		return 
	else
		Engine.AccountLinkRegister( controller, registerInfo )
	end
end

function OpenRegistrationFlow( self, element, controller, menu )
	if ShouldPresentMOTDBanner( controller, nil ) then
		local marketingData = Engine.GetMarketingMessage( controller, "registration" )
		local model = Engine.GetModel( Engine.GetGlobalModel(), "MtxCommsRegistration" )
		local location = Engine.GetModelValue( Engine.GetModel( model, "locationID" ) )
		if marketingData == nil or location == 1 then
			local motdData = Engine.GetMarketingMessage( controller, "motd" )
			if motdData ~= nil and motdData.bannerAction ~= nil and motdData.bannerAction == "store" then
				local previousMenu = GoBack( self, controller )
				OpenStore( self, element, controller, previousMenu.name, previousMenu )
			end
		else
			local action = marketingData.action
			if action ~= nil then
				CoD.MetricsUtility.CRMMessageInteraction( self, controller, "registration" )
				if action == "registration" then
					local previousMenu = GoBack( self, controller )
					local overlay = previousMenu:openOverlay( "InGameRegistration", controller )
					overlay.crm_message_id = marketingData.messageID
				elseif action == "opt-in" then
					local previousMenu = GoBack( self, controller )
					local overlay = previousMenu:openOverlay( "InGameOptIn", controller )
					overlay.crm_message_id = marketingData.messageID
				elseif action == "store" then
					local previousMenu = GoBack( self, controller )
					if marketingData.content_long == "" then
						if CoD.isPC then
							OpenSteamStore( self, element, controller, previousMenu.name, previousMenu )
						else
							OpenStore( self, element, controller, previousMenu.name, previousMenu )
						end
					else
						OpenCRMFeaturedPopup( self, element, controller, "MOTDBanner", previousMenu )
					end
				elseif action == "blackmarket" then
					local previousMenu = GoBack( self, controller )
					if marketingData.content_long == "" then
						Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "blackmarketOpenSource" ), Engine.GetCurrentMode() )
						Engine.SwitchMode( controller, "mp" )
						OpenBlackMarket( previousMenu, nil, controller )
					else
						OpenCRMFeaturedPopup( self, element, controller, "MOTDBanner", previousMenu )
					end
				elseif action == "drmonty" then
					local previousMenu = GoBack( self, controller )
					if marketingData.content_long == "" then
						Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "megachewOpenSource" ), Engine.GetCurrentMode() )
						Engine.SwitchMode( controller, "zm" )
						OpenMegaChewFactorymenu( self, element, controller, previousMenu.name, previousMenu )
					else
						OpenCRMFeaturedPopup( self, element, controller, "MOTDBanner", previousMenu )
					end
				elseif action == "expand" then
					local previousMenu = GoBack( self, controller )
					OpenCRMFeaturedPopup( self, element, controller, "MOTDBanner", previousMenu )
				end
			end
		end
	end
end

function OpenRegistrationBrowser( self, element, controller, menu )
	local previousMenu = GoBack( self, controller )
	previousMenu:registerEventHandler( "registration_success", function ( self, event )
		CoD.OverlayUtility.CreateOverlay( controller, self, "RegistrationSuccess" )
	end )
	previousMenu:registerEventHandler( "registration_failure", function ( self, element, event )
		FinishRegistrationFlow( self, controller, self )
	end )
	Engine.OpenRegistrationBrowser( controller )
end

function OptInToEmailMarketing( self, element, controller, menu )
	local previousMenu = GoBack( self, controller )
	previousMenu:registerEventHandler( "optin_success", function ( self, event )
		CoD.OverlayUtility.CreateOverlay( controller, self, "OptInSuccess" )
	end )
	previousMenu:registerEventHandler( "registration_failure", function ( self, element, event )
		FinishRegistrationFlow( self, controller, self )
	end )
	Engine.OptInToEmailMarketing( controller )
end

function FinishRegistrationFlow( self, controller, menu )
	CoD.LobbyUtility.NavigateToLobby( self, "ModeSelect", false, controller )
	SendClientScriptMenuChangeNotify( controller, menu, false )
end

function ChatClientEntriesFocused( self, element, controller )
	local channel = Engine.ChatClient_InputChannelGet( controller )
end

function ChatClientInputStart( self, element, controller, stringArg )
	if not ChatClientIsAvailable( self, element, controller ) then
		return 
	else
		ChatClientInputChannelSet( self, element, controller, stringArg )
		Engine.ChatClient_InputStart( controller )
	end
end

function ChatClientInputChannelSet( self, element, controller, stringArg )
	local channel = CoD.ChatClientUtility.GetChannelFromString( stringArg )
	if channel ~= nil then
		Engine.ChatClient_InputChannelSet( controller, channel )
	end
end

function ChatClientResetSubMenus( self, element, controller )
	CoD.ChatClientUtility.ResetSettingsMenu()
	CoD.ChatClientUtility.ResetInputChannelSelectorMenu()
end

function ChatClientHandleEscape( self, element, controller )
	if not IsPrimaryControllerIndex( controller ) or IsGlobalModelValueEqualTo( element, controller, "lobbyRoot.hideMenusForGameStart", 1 ) then
		return 
	end
	local shouldHide = ChatClientAnySubMenuOpen( controller )
	if shouldHide then
		ChatClientResetSubMenus( self, element, controller )
	else
		local parent = self:getParent()
		LobbyGoBack( parent, controller )
	end
end

function ChatClientInputArrangeText( self, element, controller )
	if self and self.arrangeText ~= nil then
		self:arrangeText()
		return 
	end
	local parent = self:getParent()
	if parent and parent.arrangeText ~= nil then
		parent:arrangeText()
	end
end

function ChatClientInputTextFieldUpdatePrompt( self, element, controller )
	if Engine.ChatClient_IsChatting( controller ) then
		local channel = Engine.ChatClient_InputChannelGet( controller )
		local channelString = Engine.Localize( Engine.ChatClient_ChannelStringGet( channel ) ) .. ": "
		local channelColor = Engine.ChatClient_ChannelColorGet( controller, channel )
		Engine.SetModelValue( CoD.ChatClientUtility.GetInputChannelColorModel(), channelColor )
		Engine.SetModelValue( CoD.ChatClientUtility.GetInputChannelTextModel(), channelString )
		return 
	else
		Engine.SetModelValue( CoD.ChatClientUtility.GetInputChannelTextModel(), "" )
		if Engine.IsInGame() then
			Engine.SetModelValue( CoD.ChatClientUtility.GetInputTextModel(), "" )
			Engine.SetModelValue( CoD.ChatClientUtility.GetInputChannelTextModel(), "" )
			return 
		elseif not ChatClientEnabled( controller ) then
			Engine.SetModelValue( CoD.ChatClientUtility.GetInputTextModel(), Engine.Localize( "PLATFORM_CHAT_DISABLED" ) )
			return 
		elseif not ChatClientIsAvailable( self, element, controller ) then
			Engine.SetModelValue( CoD.ChatClientUtility.GetInputTextModel(), Engine.Localize( "PLATFORM_CHAT_NOT_AVAILABLE" ) )
			return 
		else
			Engine.SetModelValue( CoD.ChatClientUtility.GetInputTextModel(), Engine.Localize( "PLATFORM_CHAT_CLICK_TO_ENTER_CHAT" ) )
		end
	end
end

function ChatClientInputTextFocusChanged( self, element, controller )
	ChatClientInputTextFieldUpdatePrompt( self, element, controller )
end

function ChatClientFilterChannelSet( self, element, controller, stringArg, expressionArg )
	local channel = CoD.ChatClientUtility.GetChannelFromString( stringArg )
	local modelValue = Engine.GetModelValue( expressionArg )
	if channel ~= nil and modelValue ~= nil then
		Engine.ChatClient_FilterChannelSet( controller, channel, modelValue )
	end
end

function ChatClientShowTimestampsSet( self, element, controller, expressionArg )
	local modelValue = Engine.GetModelValue( expressionArg )
	return Engine.ChatClient_ShowTimestampsSet( controller, modelValue )
end

function ChatClientShowChannelSet( self, element, controller, expressionArg )
	local modelValue = Engine.GetModelValue( expressionArg )
	return Engine.ChatClient_ShowChannelSet( controller, modelValue )
end

function ChatClientSettingsHide( self, element, controller )
	CoD.ChatClientUtility.ResetSettingsMenu()
end

function ChatClientInputChannelSelectorHide( self, element, controller )
	CoD.ChatClientUtility.ResetInputChannelSelectorMenu()
end

function ChatClientResetState( self, element, controller )
	Engine.ChatClient_ResetState( controller )
end

function RestrictVoiceChatForClient( self, element, controller )
	local xuid = CoD.SafeGetModelValue( element:getModel(), "xuid" )
	if xuid then
		Engine.RestrictVoiceChatForClient( Enum.LobbyType.LOBBY_TYPE_GAME, xuid )
	end
end

function AllowVoiceChatForClient( self, element, controller )
	local xuid = CoD.SafeGetModelValue( element:getModel(), "xuid" )
	if xuid then
		Engine.AllowVoiceChatForClient( Enum.LobbyType.LOBBY_TYPE_GAME, xuid )
	end
end

function AllowVoiceChatForAllClients()
	Engine.AllowVoiceChatForAll( Enum.LobbyType.LOBBY_TYPE_GAME )
end

function ResetControlsToDefault( self, element, controller, menu )
	Engine.Exec( controller, "resetprofilecommon" )
	Engine.Exec( controller, "updategamerprofile" )
	Engine.Exec( controller, "storagereset stats_mp_offline" )
	CoD.OverlayUtility.AddSystemOverlay( "ResetControlsToDefault", {
		menuName = "SystemOverlay_Compact",
		title = "MENU_RESET_TO_DEFAULT_CAPS",
		description = "MENU_RESET_TO_DEFAULTS_SUCCESSFUL",
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ()
			DataSources.TestPopup_List = DataSourceHelpers.ListSetup( "ResetControlsToDefault_List", function ( controller )
				return {
					{
						models = {
							displayText = "Yes"
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								GoBack( controller )
							end
							
						}
					}
				}
			end, true, nil )
			return "ResetControlsToDefault_List"
		end
	} )
	CoD.OverlayUtility.CreateOverlay( controller, menu, "ResetControlsToDefault" )
end

function ChangeLanguage( self, element, controller, param, menu )
	local curLang = Engine.GetLanguage()
	if param == curLang then
		GoBack( self, controller )
		return 
	else
		Engine.SetLanguage( param )
		CoD.OverlayUtility.AddSystemOverlay( "Restart_Popup", {
			menuName = "SystemOverlay_Compact",
			title = Engine.Localize( "MENU_NOTICE" ),
			description = Engine.Localize( "MENU_RESTART_WARNING" ),
			categoryType = CoD.OverlayUtility.OverlayTypes.Alert,
			listDatasource = function ()
				DataSources.Restart_Popup = DataSourceHelpers.ListSetup( "Restart_Popup", function ( controller )
					return {
						{
							models = {
								displayText = "OK"
							},
							properties = {
								action = function ( self, element, controller, actionParam, menu )
									Engine.RebootGame()
								end
								
							}
						}
					}
				end, true, nil )
				return "Restart_Popup"
			end
		} )
		CoD.OverlayUtility.CreateOverlay( controller, menu, "Restart_Popup" )
		return true
	end
end

function ChangeAutoScrollStartDelay( element, expr_StartDelayMS )
	element.autoScrollStartDelay = expr_StartDelayMS
end

function ChangeAutoScrollEndDelay( element, expr_EndDelayMS )
	element.autoScrollEndDelay = expr_EndDelayMS
end

function ChangeAutoScrollSpeed( element, expr_Speed )
	element.autoScrollSpeed = expr_Speed
end

function ChangeRightStickScrollSpeed( element, expr_Speed )
	element.rightStickScrollSpeed = expr_Speed
end

function EnableAutoScrolling( element, booleanArg )
	element.allowAutoScrolling = booleanArg
end

function EnableRightStickScrolling( element, booleanArg )
	element.allowRightStickScrolling = booleanArg
end

function SetDownloadPreference( controller, enumValue )
	Engine.ChoosePreferredDownloadOrder( controller, enumValue )
end

function SetFirstTimeDurangoDownloadSettingDisplayed( controller )
	CoD.LobbyUtility.DisplayedFirstTimeDurangoDownloadSetting = true
end

function ResetCampaign( self, controller, menu )
	menu:OpenModalDialog( self, controller, "MENU_RESET_CAMPAIGN", "MENU_RESET_CAMPAIGN_WARNING", {
		"MPUI_YES",
		"MPUI_NO"
	}, function ( modalResult )
		if modalResult == 0 then
			Engine.ResetCampaign()
		end
		return true
	end )
end

function CombatRecordShowModelForItemIndex( controller, element )
	local itemIndex = 0
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	if itemIndexModel then
		itemIndex = Engine.GetModelValue( itemIndexModel )
	end
	local loadoutSlot = Engine.GetLoadoutSlotForItem( itemIndex, CoD.GetCombatRecordMode() )
	local itemRef = Engine.GetItemRef( itemIndex, CoD.GetCombatRecordMode() )
	local itemName = itemRef .. "_" .. CoD.GetCombatRecordModeAbbreviation()
	local isUnlocked = not CoD.SafeGetModelValue( element:getModel(), "isBMClassified" )
	Engine.SendClientScriptNotify( controller, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( controller ), {
		base_weapon_slot = loadoutSlot,
		weapon = itemName,
		camera = "select01",
		options = "0,0,0",
		is_item_unlocked = isUnlocked
	} )
end

function CombatRecordShowModelForBubblegumBuff( controller, element )
	local itemIndex = 0
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	if itemIndexModel then
		itemIndex = Engine.GetModelValue( itemIndexModel )
	end
	local slotName = Engine.GetItemGroup( itemIndex, Enum.eModes.MODE_ZOMBIES )
	local camera = "select01"
	local modelName = "p7_" .. Engine.GetItemRef( itemIndex, Enum.eModes.MODE_ZOMBIES ) .. "_ui"
	Engine.SendClientScriptNotify( controller, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( controller ), {
		base_weapon_slot = slotName,
		weapon = modelName,
		camera = camera
	} )
end

function CombatRecordShowCybercoreModelForItemIndex( controller, element )
	local itemIndex = 0
	local itemIndexModel = element:getModel( controller, "cybercoreIndex" )
	if itemIndexModel then
		itemIndex = Engine.GetModelValue( itemIndexModel )
	end
	local loadoutSlot = Engine.GetLoadoutSlotForItem( itemIndex, CoD.GetCombatRecordMode() )
	local itemName = CoD.CACUtility.GetCybercoreXModel( itemIndex, CoD.GetCombatRecordMode() )
	Engine.SendClientScriptNotify( controller, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( controller ), {
		base_weapon_slot = loadoutSlot,
		weapon = itemName,
		camera = "select01",
		options = "0,0,0",
		is_item_unlocked = true
	} )
end

function CombatRecordSetHero( controller )
	local heroIndex = 0
	local favoriteSpecalistModel = Engine.GetModel( Engine.GetModelForController( controller ), "FavoriteSpecialist" )
	if favoriteSpecalistModel then
		heroIndex = Engine.GetModelValue( Engine.GetModel( favoriteSpecalistModel, "heroIndex" ) )
	end
	Engine.SendClientScriptNotify( controller, CoD.PlayerRoleUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( controller ), {
		param1 = "changeHero",
		param2 = heroIndex,
		param3 = CoD.GetCombatRecordMode()
	} )
end

function CombatRecordShowHero( controller, element )
	local heroIndex = 0
	local heroIndexModel = element:getModel( controller, "heroIndex" )
	if heroIndexModel then
		heroIndex = Engine.GetModelValue( heroIndexModel )
	end
	Engine.SendClientScriptNotify( controller, CoD.PlayerRoleUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( controller ), {
		param1 = "changeHero",
		param2 = heroIndex,
		param3 = CoD.GetCombatRecordMode()
	} )
end

function CombatRecordUpdateCollectibles( self, controller, element )
	local mapId = CoD.SafeGetModelValue( element:getModel(), "id" )
	CoD.perController[controller].inspectingMap = mapId
	self.Collectibles:updateDataSource()
end

function CombatRecordTabChanged( self, element, controller )
	if not CoD.CombatRecordPreventModeChange then
		CoD.CombatRecordMode = element.tabId
	end
end

function CombatRecordMedalsTabChanged( self, element, controller )
	CoD.CombatRecordMedalCategory = element.tabId
	if self.MedalsGrid then
		self.MedalsGrid:updateDataSource()
	end
end

function CombatRecordAccoladesChangeMap( self, controller, element, param )
	local cpMapsTable = {}
	local currentIndex = 0
	local numMaps = 0
	local controllerModel = Engine.GetModelForController( controller )
	local combatRecordAccoladesModel = Engine.GetModel( controllerModel, "CombatRecordAccolades" )
	local sortMaps = function ( a, b )
		return CoD.MapUtility.MapsTable[a].unique_id < CoD.MapUtility.MapsTable[b].unique_id
	end
	
	for id, mapData in LUI.IterateTableBySortedKeys( CoD.MapUtility.MapsTable, sortMaps, nil ) do
		if mapData.session_mode == Enum.eModes.MODE_CAMPAIGN and mapData.campaign_mode == 0 and mapData.dlc_pack ~= -1 and mapData.isSubLevel == false then
			table.insert( cpMapsTable, mapData.unique_id )
			if CoD.SafeGetModelValue( combatRecordAccoladesModel, "unique_id" ) == mapData.unique_id then
				currentIndex = numMaps
			end
			numMaps = numMaps + 1
		end
	end
	Engine.SetModelValue( Engine.GetModel( combatRecordAccoladesModel, "unique_id" ), cpMapsTable[(currentIndex + param) % numMaps + 1] )
end

function CombatRecordOpenCallingCards( self, controller, menu, element )
	local callingCardsMenu = menu:openOverlay( "CallingCards", controller )
	local slotIndexModel = element:getModel( controller, "slotIndex" )
	if slotIndexModel then
		callingCardsMenu.callingCardShowcaseSlot = Engine.GetModelValue( slotIndexModel )
	end
end

function CombatRecordSetHeadingKickerTextToCombatRecordGameMode()
	local modeName = SessionModeToLocalizedSessionMode( CoD.GetCombatRecordMode() )
	local textModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerText" )
	if textModel then
		Engine.SetModelValue( textModel, Engine.Localize( modeName ) )
	end
end

function CombatRecordSetHeadingKickerTextToCombatRecordMode()
	if CoD.GetCombatRecordMode() ~= Enum.eModes.MODE_MULTIPLAYER then
		CombatRecordSetHeadingKickerTextToCombatRecordGameMode()
		return 
	end
	local kickerText = Engine.Localize( "MPUI_SUMMARY_CAPS" )
	if CoD.CombatRecordMode == "public" then
		kickerText = Engine.Localize( "MENU_COMBAT_RECORD_TAB_PUBLIC_CAPS" )
	elseif CoD.CombatRecordMode == "arena" then
		kickerText = Engine.Localize( "MENU_ARENA_CAPS" )
	end
	local textModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerText" )
	if textModel then
		Engine.SetModelValue( textModel, kickerText )
	end
end

function CombatRecordSetXUIDForLocalController( controller )
	CoD.CombatRecordXUID = Engine.GetXUID64( controller )
	CoD.CombatRecordOtherPlayerStats = false
end

function CombatRecordSetXUIDFromSelectedFriend( controller )
	local controllerModel = Engine.GetModelForController( controller )
	local selectedFriendModel = Engine.GetModel( controllerModel, "Social.selectedFriendXUID" )
	if selectedFriendModel then
		CoD.CombatRecordXUID = Engine.GetModelValue( selectedFriendModel )
		CoD.CombatRecordMode = "public"
	end
end

function CombatRecordOpenFromPlayerDetails( self, element, controller, params, menu )
	CombatRecordSetMenuForPostStatsLoad( self, "ViewRemoteCombatRecord" )
	CombatRecordSetXUIDFromSelectedFriend( controller )
	OpenPopup( self, "Social_InspectPlayerPopupLoading", controller )
	CombatRecordReadOtherPlayerStats( controller )
end

function CombatRecordSetMenuForPostStatsLoad( self, menuName )
	CoD.CombatRecordPostStatsLoadMenuName = menuName
end

function CombatRecordGoBackAndOpenOverlayForPostStatsLoad( self, controller )
	GoBackAndOpenOverlayOnParent( self, CoD.CombatRecordPostStatsLoadMenuName, controller )
end

function CombatRecordReadOtherPlayerStats( controller )
	CoD.CombatRecordOtherPlayerStats = true
	Engine.ReadOtherPlayerStats( controller, CoD.CombatRecordXUID, CoD.GetCombatRecordMode() )
end

function CombatRecordCompareAgainstLocalPlayer( controller )
	local otherPlayerStatsModel = Engine.CreateModel( Engine.GetGlobalModel(), "OtherPlayerStats" )
	if otherPlayerStatsModel then
		local gamertag = Engine.GetGamertagForController( controller )
		if gamertag then
			local gamertagModel = Engine.CreateModel( otherPlayerStatsModel, "gamertag" )
			if gamertagModel then
				Engine.SetModelValue( gamertagModel, gamertag )
			end
		end
		local xuid = Engine.GetXUID64( controller )
		if xuid then
			local xuidModel = Engine.CreateModel( otherPlayerStatsModel, "xuid" )
			if xuidModel then
				Engine.SetModelValue( xuidModel, xuid )
			end
		end
	end
end

function CombatRecordSelectFriend( self, element, controller )
	local otherPlayerStatsModel = Engine.CreateModel( Engine.GetGlobalModel(), "OtherPlayerStats" )
	local gamertag = nil
	if otherPlayerStatsModel then
		local gamertagModel = element:getModel( controller, "identityBadge.gamertag" )
		if gamertagModel then
			gamertag = Engine.GetModelValue( gamertagModel )
		end
	end
	if gamertag then
		local otherPlayerGamertagModel = Engine.CreateModel( otherPlayerStatsModel, "gamertag" )
		if otherPlayerGamertagModel then
			Engine.SetModelValue( otherPlayerGamertagModel, gamertag )
		end
	end
	local xuid = nil
	local xuidModel = element:getModel( controller, "identityBadge.xuid" )
	if xuidModel then
		xuid = Engine.GetModelValue( xuidModel )
	end
	if xuid then
		if otherPlayerStatsModel then
			local otherPlayerXUIDModel = Engine.CreateModel( otherPlayerStatsModel, "XUID" )
			if otherPlayerXUIDModel then
				Engine.SetModelValue( otherPlayerXUIDModel, xuid )
			end
		end
		Engine.ReadOtherPlayerStats( controller, xuid, CoD.GetCombatRecordMode() )
	end
end

function CombatRecordSetComparing( self, controller, booleanArg )
	local combatRecordComparingModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CombatRecordComparing" )
	if combatRecordComparingModel then
		Engine.SetModelValue( combatRecordComparingModel, booleanArg )
	end
end

function CombatRecordUpdateSelfIdentityWidget( self, controller )
	if CoD.CombatRecordOtherPlayerStats == true then
		local menuFrame = self.MenuFrame
		local controllerModel = Engine.GetModelForController( controller )
		local socialPlayerInfoModel = Engine.GetModel( controllerModel, "socialPlayerInfo" )
		local identityModel = Engine.GetModel( controllerModel, "socialPlayerInfo.identityBadge" )
		if menuFrame and socialPlayerInfoModel and identityModel then
			if menuFrame.SelfIdentityBadge then
				menuFrame.SelfIdentityBadge:setModel( identityModel, controller )
			end
			if menuFrame.SelfIdentityBadge.CallingCard.CallingCardsFrameWidget then
				menuFrame.SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( socialPlayerInfoModel, controller )
			end
		end
	end
end

function StartLiveEvent( controller, liveEventStreamerIndex )
	local liveEventStreamers = "gamedata/tables/common/live_event_streamers.csv"
	local streamerName = Engine.TableLookup( liveEventStreamers, 1, 0, liveEventStreamerIndex or 0 ) or ""
	Engine.Exec( controller, "setliveevent " .. streamerName )
end

function EndLiveEvent( controller )
	StartLiveEvent( controller, 0 )
end

function SelectLiveEventQuality( element )
	SelectLiveEventQuality_Internal( element.qualityId )
end

function ValidateMPLootWeapons( controller )
	CoD.CACUtility.ValidateMPLootWeapons( controller )
end

function CollapseFreeCursorElement( self )
	if not self._originalHeight then
		local widgetWidth, widgetHeight = self:getLocalSize()
		self._originalHeight = widgetHeight
	end
	self:setHeight( 0 )
end

function ExpandFreeCursorElement( self )
	if self._originalHeight then
		self:setHeight( self._originalHeight )
	end
end

function DisableRestoreState( self )
	self.restoreState = AlwaysTrue
	self:registerEventHandler( "gain_focus", function ()
		return true
	end )
end

function DisableDefaultGainFocus( self, controller )
	if Engine.UsingFreeCursor() then
		self:registerEventHandler( "gain_focus", function ( self )
			local root = self:getRoot()
			local f1333_local0 = Engine.GetModelForController( 0 )
			local f1333_local0, y = f1333_local0.FreeCursor.position:get()
			self:addElement( LUI.UITimer.newElementTimer( self.disablePopupOpenCloseAnim and 0 or 250, true, function ()
				local rootName = "UIRoot" .. controller
				root:processEvent( {
					name = "mousemove",
					controller = controller,
					rootName = rootName,
					x = f1333_local0,
					y = y
				} )
			end ) )
		end )
	end
end

function MenuHidesFreeCursor( menu, controller )
	if Engine.UsingFreeCursor() then
		if menu._delayedUnlockAndUnhideTimer ~= nil then
			menu._delayedUnlockAndUnhideTimer:close()
			menu._delayedUnlockAndUnhideTimer = nil
			LockInput( menu, controller, false )
		end
		if not menu.hasHidingFreeCursorClose then
			menu.hasHidingFreeCursorClose = true
			LUI.OverrideFunction_CallOriginalFirst( menu, "close", function ()
				MenuUnhideFreeCursor( menu, controller )
			end )
		end
		if not menu.hidFreeCursor then
			local f1335_local0 = DataSources.FreeCursor.getModel( controller )
			local hiddenModel = f1335_local0.hidden
			menu.hidFreeCursor = true
			hiddenModel:set( hiddenModel:get() + 1 )
		end
	end
end

function MenuUnhideFreeCursor( menu, controller )
	if Engine.UsingFreeCursor() then
		local f1337_local0 = DataSources.FreeCursor.getModel( controller )
		local hiddenModel = f1337_local0.hidden
		if menu.hidFreeCursor then
			hiddenModel:set( hiddenModel:get() - 1 )
			menu.hidFreeCursor = false
		end
		if menu._delayedUnlockAndUnhideTimer ~= nil then
			menu._delayedUnlockAndUnhideTimer:close()
			menu._delayedUnlockAndUnhideTimer = nil
			LockInput( menu, controller, false )
		end
	end
end

function MenuDelayedUnlockInputAndUnhideCursor( menu, controller, exprDelayMs )
	if Engine.UsingFreeCursor() then
		if menu._delayedUnlockAndUnhideTimer ~= nil then
			menu._delayedUnlockAndUnhideTimer:close()
			menu._delayedUnlockAndUnhideTimer = nil
			LockInput( menu, controller, false )
		end
		menu._delayedUnlockAndUnhideTimer = LUI.UITimer.newElementTimer( exprDelayMs, true, function ()
			LockInput( menu, controller, false )
			MenuUnhideFreeCursor( menu, controller )
		end )
		menu:addElement( menu._delayedUnlockAndUnhideTimer )
	end
end

function T8Prototype_StartCareer( self, menu, element, controller )
	CoD.LobbyButtons.CP_LAN.action( self, element, controller, CoD.LobbyButtons.CP_LAN.param, menu )
end

function T8Prototype_StartMP( self, menu, element, controller )
	CoD.LobbyButtons.MP_LAN.action( self, element, controller, CoD.LobbyButtons.MP_LAN.param, menu )
end

function T8Prototype_StartLAN( self, menu, element, controller )
	CoD.LobbyButtons.FIND_LAN_GAME.action( self, element, controller, CoD.LobbyButtons.FIND_LAN_GAME.param, menu )
end

