function UpdateState( f1_arg0, f1_arg1 )
	local f1_local0 = {}
	if f1_arg1 ~= nil then
		f1_local0 = LUI.ShallowCopy( f1_arg1 )
	end
	f1_local0.name = "update_state"
	f1_arg0:processEvent( f1_local0 )
end

function UpdateMenuState( f2_arg0, f2_arg1 )
	local f2_local0 = {}
	if f2_arg1 ~= nil then
		f2_local0 = LUI.ShallowCopy( f2_arg1 )
	end
	f2_local0.name = "update_state"
	f2_arg0:updateElementState( f2_arg0, f2_local0 )
end

function UpdateElementState( f3_arg0, f3_arg1, f3_arg2 )
	if f3_arg0[f3_arg1] then
		f3_arg0[f3_arg1]:processEvent( {
			name = "update_state",
			controller = f3_arg2
		} )
	end
end

function UpdateSelfElementState( f4_arg0, f4_arg1, f4_arg2 )
	f4_arg1:processEvent( {
		name = "update_state",
		menu = f4_arg0,
		controller = f4_arg2
	} )
end

function UpdateSelfState( f5_arg0, f5_arg1 )
	f5_arg0:processEvent( {
		name = "update_state",
		controller = f5_arg1
	} )
end

function SetLuiKeyCatcher( f6_arg0 )
	Engine.SetLuiKeyCatcher( f6_arg0 )
end

function UpdateAllMenuButtonPrompts( f7_arg0, f7_arg1 )
	f7_arg0:UpdateAllButtonPrompts( f7_arg1 )
end

function UpdateButtonPrompt( f8_arg0, f8_arg1, f8_arg2 )
	if not f8_arg0.buttonPromptAddFunctions then
		return 
	elseif not f8_arg0.buttonPromptAddFunctions[f8_arg1] or not f8_arg0.buttonPromptAddFunctions[f8_arg1]( f8_arg0, f8_arg0, {
		controller = f8_arg2
	} ) then
		f8_arg0:removeButtonPrompt( f8_arg1, f8_arg0 )
	end
end

function SetButtonPromptEnabled( f9_arg0, f9_arg1 )
	f9_arg0:SetButtonPromptState( f9_arg1, Enum.LUIButtonPromptStates.FLAG_ENABLE_PROMPTS )
end

function SetButtonPromptDisabled( f10_arg0, f10_arg1 )
	f10_arg0:SetButtonPromptState( f10_arg1, Enum.LUIButtonPromptStates.FLAG_DISABLE_PROMPTS )
end

function SetButtonPromptHidden( f11_arg0, f11_arg1 )
	f11_arg0:SetButtonPromptState( f11_arg1, Enum.LUIButtonPromptStates.FLAG_HIDE_PROMPTS )
end

function UpdateButtonPromptState( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
	CoD.Menu.UpdateButtonShownState( f12_arg1, f12_arg0, f12_arg2, f12_arg3 )
end

function SendButtonPressToSiblingMenu( f13_arg0, f13_arg1, f13_arg2, f13_arg3, f13_arg4 )
	local f13_local0 = f13_arg0:getParent()
	f13_local0 = f13_local0 and f13_local0[f13_arg1]
	if f13_local0 then
		CoD.Menu.HandleButtonPress( f13_local0, f13_arg2, f13_arg4, f13_arg3 )
	end
end

function SendButtonPressToOccludedMenu( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
	local f14_local0 = f14_arg0.occludedMenu
	if f14_local0 then
		CoD.Menu.HandleButtonPress( f14_local0, f14_arg1, f14_arg3, f14_arg2 )
	end
end

function SendButtonPressToMenu( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
	CoD.Menu.HandleButtonPress( f15_arg0, f15_arg1, f15_arg3, f15_arg2 )
end

function SendButtonPressToMenuEx( f16_arg0, f16_arg1, f16_arg2 )
	local f16_local0 = Engine.GetModel( Engine.GetModelForController( f16_arg1 ), "ButtonBits." .. f16_arg2 )
	if f16_local0 then
		Engine.SetModelValue( f16_local0, Enum.LUIButtonFlags.FLAG_DOWN )
		Engine.SetModelValue( f16_local0, 0 )
	end
end

function SetProperty( f17_arg0, f17_arg1, f17_arg2 )
	f17_arg0[f17_arg1] = f17_arg2
end

function SetElementProperty( f18_arg0, f18_arg1, f18_arg2 )
	f18_arg0[f18_arg1] = f18_arg2
end

function ForceNotifyModel( f19_arg0, f19_arg1 )
	Engine.ForceNotifyModelSubscriptions( Engine.GetModel( Engine.GetModelForController( f19_arg0 ), f19_arg1 ) )
end

function SetControllerModelValue( f20_arg0, f20_arg1, f20_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f20_arg0 ), f20_arg1 ), f20_arg2 )
end

function ToggleControllerModelValueBoolean( f21_arg0, f21_arg1 )
	local f21_local0 = Engine.GetModel( Engine.GetModelForController( f21_arg0 ), f21_arg1 )
	Engine.SetModelValue( f21_local0, not Engine.GetModelValue( f21_local0 ) )
end

function ToggleControllerModelValueNumber( f22_arg0, f22_arg1 )
	local f22_local0 = Engine.GetModel( Engine.GetModelForController( f22_arg0 ), f22_arg1 )
	Engine.SetModelValue( f22_local0, 1 - Engine.GetModelValue( f22_local0 ) )
end

function SetMenuModelValue( f23_arg0, f23_arg1, f23_arg2 )
	Engine.SetModelValue( Engine.GetModel( f23_arg0:getModel(), f23_arg1 ), f23_arg2 )
end

function ToggleGlobalModelValueBoolean( f24_arg0 )
	local f24_local0 = Engine.CreateModel( Engine.GetGlobalModel(), f24_arg0 )
	Engine.SetModelValue( f24_local0, not Engine.GetModelValue( f24_local0 ) )
end

function SetGlobalModelValueTrue( f25_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), f25_arg0 ), true )
end

function SetGlobalModelValueFalse( f26_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), f26_arg0 ), false )
end

function SetGlobalModelValue( f27_arg0, f27_arg1 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), f27_arg0 ), f27_arg1 )
end

function SetGlobalModelValueArg( f28_arg0, f28_arg1 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), f28_arg0 ), f28_arg1 )
end

function SetElementModelValue( f29_arg0, f29_arg1, f29_arg2 )
	Engine.SetModelValue( Engine.GetModel( f29_arg0:getModel(), f29_arg1 ), f29_arg2 )
end

function DispatchEventToChildren( f30_arg0, f30_arg1, f30_arg2 )
	return f30_arg0:dispatchEventToChildren( {
		name = f30_arg1,
		controller = f30_arg2
	} )
end

function DispatchEventToRoot( f31_arg0, f31_arg1, f31_arg2 )
	return f31_arg0:dispatchEventToRoot( {
		name = f31_arg1,
		controller = f31_arg2
	} )
end

function SetPerControllerTableProperty( f32_arg0, f32_arg1, f32_arg2 )
	CoD.perController[f32_arg0][f32_arg1] = f32_arg2
end

function SetPerControllerTablePropertyEnum( f33_arg0, f33_arg1, f33_arg2 )
	CoD.perController[f33_arg0][f33_arg1] = f33_arg2
end

function SetElementModelOnPerControllerTable( f34_arg0, f34_arg1, f34_arg2, f34_arg3 )
	local f34_local0 = nil
	local f34_local1 = f34_arg2:getModel( f34_arg0, f34_arg3 )
	if f34_local1 then
		f34_local0 = Engine.GetModelValue( f34_local1 )
	end
	CoD.perController[f34_arg0][f34_arg1] = f34_local0
end

function CopyElementModelToPerControllerTable( f35_arg0, f35_arg1, f35_arg2 )
	CoD.perController[f35_arg0][f35_arg1] = f35_arg2:getModel()
end

function SetElementPropertyOnPerControllerTable( f36_arg0, f36_arg1, f36_arg2, f36_arg3 )
	CoD.perController[f36_arg0][f36_arg1] = f36_arg2[f36_arg3]
end

function SetModelFromPerControllerTable( f37_arg0, f37_arg1, f37_arg2 )
	f37_arg1:setModel( CoD.perController[f37_arg0][f37_arg2] )
end

function CopyElementToPerControllerTable( f38_arg0, f38_arg1, f38_arg2 )
	CoD.perController[f38_arg0][f38_arg2] = f38_arg1
end

function SendClientScriptNotify( f39_arg0, f39_arg1, f39_arg2 )
	Engine.SendClientScriptNotify( f39_arg0, f39_arg1, f39_arg2 )
end

function SendClientScriptNotifyForAdjustedClient( f40_arg0, f40_arg1, f40_arg2 )
	Engine.SendClientScriptNotify( f40_arg0, f40_arg1 .. CoD.GetLocalClientAdjustedNum( f40_arg0 ), f40_arg2 )
end

function SendClientScriptEnumNotify( f41_arg0, f41_arg1, f41_arg2 )
	Engine.SendClientScriptNotify( f41_arg0, f41_arg1, f41_arg2 )
end

function SendClientScriptEnumNotifyForAdjustedClient( f42_arg0, f42_arg1, f42_arg2 )
	Engine.SendClientScriptNotify( f42_arg0, f42_arg1 .. CoD.GetLocalClientAdjustedNum( f42_arg0 ), f42_arg2 )
end

function SendClientScriptEnumNotifyTwoParam( f43_arg0, f43_arg1, f43_arg2, f43_arg3 )
	Engine.SendClientScriptNotify( f43_arg0, f43_arg1, f43_arg2, f43_arg3 )
end

function SendClientScriptCustomPropertyNotify( f44_arg0, f44_arg1, f44_arg2, f44_arg3, ... )
	if f44_arg1[f44_arg3] then
		Engine.SendClientScriptNotify( f44_arg0, f44_arg2, f44_arg1[f44_arg3], ... )
	end
end

function SendClientScriptPropertyNotify( f45_arg0, f45_arg1, f45_arg2, f45_arg3 )
	if f45_arg1[f45_arg3] then
		Engine.SendClientScriptNotify( f45_arg0, f45_arg2, f45_arg1[f45_arg3] )
	end
end

function SendClientScriptPropertyNotifyForAdjustedClient( f46_arg0, f46_arg1, f46_arg2, f46_arg3 )
	if f46_arg1[f46_arg3] then
		Engine.SendClientScriptNotify( f46_arg0, f46_arg2 .. CoD.GetLocalClientAdjustedNum( f46_arg0 ), f46_arg1[f46_arg3] )
	end
end

function SendClientScriptPropertyNotifyTwoParam( f47_arg0, f47_arg1, f47_arg2, f47_arg3, f47_arg4 )
	if f47_arg1[f47_arg4] then
		Engine.SendClientScriptNotify( f47_arg0, f47_arg2, f47_arg3, f47_arg1[f47_arg4] )
	end
end

function SendClientScriptPropertyNotifyForAdjustedClientTwoParam( f48_arg0, f48_arg1, f48_arg2, f48_arg3, f48_arg4 )
	if f48_arg1[f48_arg4] then
		Engine.SendClientScriptNotify( f48_arg0, f48_arg2 .. CoD.GetLocalClientAdjustedNum( f48_arg0 ), f48_arg3, f48_arg1[f48_arg4] )
	end
end

function SendClientScriptModelNotify( f49_arg0, f49_arg1, f49_arg2, f49_arg3 )
	local f49_local0 = f49_arg1:getModel( f49_arg0, f49_arg3 )
	if f49_local0 then
		Engine.SendClientScriptNotify( f49_arg0, f49_arg2, Engine.GetModelValue( f49_local0 ) )
	end
end

function SendClientScriptModelNotifyTwoParam( f50_arg0, f50_arg1, f50_arg2, f50_arg3, f50_arg4 )
	local f50_local0 = f50_arg1:getModel( f50_arg0, f50_arg4 )
	if f50_local0 then
		Engine.SendClientScriptNotify( f50_arg0, f50_arg2, f50_arg3, Engine.GetModelValue( f50_local0 ) )
	end
end

function SendClientScriptModelNotifyForAdjustedClientTwoParam( f51_arg0, f51_arg1, f51_arg2, f51_arg3, f51_arg4 )
	local f51_local0 = f51_arg1:getModel( f51_arg0, f51_arg4 )
	if f51_local0 then
		Engine.SendClientScriptNotify( f51_arg0, f51_arg2 .. CoD.GetLocalClientAdjustedNum( f51_arg0 ), f51_arg3, Engine.GetModelValue( f51_local0 ) )
	end
end

function SendClientScriptMultiModelNotify( f52_arg0, f52_arg1, f52_arg2, ... )
	local f52_local0 = {}
	for f52_local4, f52_local5 in ipairs( {
		n = select( "#", ... ),
		...
	} ) do
		local f52_local6 = f52_arg1:getModel( f52_arg0, f52_local5 )
		if not f52_local6 then
			return 
		end
		table.insert( f52_local0, Engine.GetModelValue( f52_local6 ) )
	end
	Engine.SendClientScriptNotify( f52_arg0, f52_arg2, table.unpack( f52_local0 ) )
end

function SendClientScriptMultiModelNotifyTwoParam( f53_arg0, f53_arg1, f53_arg2, f53_arg3, ... )
	local f53_local0 = {}
	for f53_local4, f53_local5 in ipairs( {
		n = select( "#", ... ),
		...
	} ) do
		local f53_local6 = f53_arg1:getModel( f53_arg0, f53_local5 )
		if not f53_local6 then
			return 
		end
		table.insert( f53_local0, Engine.GetModelValue( f53_local6 ) )
	end
	Engine.SendClientScriptNotify( f53_arg0, f53_arg2, f53_arg3, table.unpack( f53_local0 ) )
end

local f0_local0 = function ( f54_arg0, f54_arg1, f54_arg2, f54_arg3 )
	local f54_local0 = "closed"
	if f54_arg2 then
		f54_local0 = "opened"
	end
	if f54_arg3 then
		Engine.SendClientScriptNotify( f54_arg0, "menu_change" .. CoD.GetLocalClientAdjustedNum( f54_arg0 ), f54_arg1, f54_local0, f54_arg3 )
	else
		Engine.SendClientScriptNotify( f54_arg0, "menu_change" .. CoD.GetLocalClientAdjustedNum( f54_arg0 ), f54_arg1, f54_local0 )
	end
end

function SendClientScriptMenuChangeNotify( f55_arg0, f55_arg1, f55_arg2 )
	f0_local0( f55_arg0, f55_arg1.menuName, f55_arg2 )
end

function SendCustomClientScriptMenuChangeNotify( f56_arg0, f56_arg1, f56_arg2 )
	f0_local0( f56_arg0, f56_arg1, f56_arg2 )
end

function SendClientScriptMenuStateChangeNotify( f57_arg0, f57_arg1, f57_arg2, f57_arg3 )
	f0_local0( f57_arg0, f57_arg1.menuName, f57_arg2, f57_arg3 )
end

function SendCustomClientScriptMenuStateChangeNotify( f58_arg0, f58_arg1, f58_arg2, f58_arg3 )
	f0_local0( f58_arg0, f58_arg1, f58_arg2, f58_arg3 )
end

function CallCustomElementFunction_Self( f59_arg0, f59_arg1, ... )
	if f59_arg0[f59_arg1] then
		f59_arg0[f59_arg1]( f59_arg0, ... )
	end
end

function CallCustomElementFunction_Element( f60_arg0, f60_arg1, ... )
	if f60_arg0[f60_arg1] then
		f60_arg0[f60_arg1]( f60_arg0, ... )
	end
end

function SetProfileVar( f61_arg0, f61_arg1, f61_arg2 )
	Engine.SetProfileVar( f61_arg0, f61_arg1, f61_arg2 )
end

function OpenGameSettingsOptionsMenu( f62_arg0, f62_arg1, f62_arg2, f62_arg3 )
	CoD.perController[f62_arg2].selectedGameSettingElement = f62_arg1
	f62_arg3:saveState()
	OpenPopup( f62_arg3, "GameSettings_OptionsMenu", f62_arg2 )
end

function ResetGameSettings()
	Engine.SetGametype( Engine.DvarString( nil, "ui_gametype" ) )
	Engine.SetDvar( "bot_maxFree", 0 )
	Engine.SetDvar( "bot_maxAllies", 0 )
	Engine.SetDvar( "bot_maxAxis", 0 )
	Engine.SetDvar( "bot_difficulty", 1 )
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings.Update" ) )
end

function ResetSelectedGameSetting( f64_arg0, f64_arg1, f64_arg2, f64_arg3 )
	local f64_local0 = CoD.perController[f64_arg2].selectedGameSettingElement
	if f64_local0 and f64_local0.revert then
		f64_local0:revert()
	end
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings.Update" ) )
end

function CloseTeamSettingsButtons( f65_arg0, f65_arg1, f65_arg2, f65_arg3 )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "CreateAClassEditSettingsName" ), "name" ), "MENU_CREATE_A_CLASS_SETTINGS" )
end

function GameSettingsMenuClosed( f66_arg0, f66_arg1 )
	if CoD.perController[f66_arg1].editingPresetClass then
		Engine.StopEditingPresetClass()
		CoD.perController[f66_arg1].isPreset = nil
	end
end

function ButtonListFocused( f67_arg0, f67_arg1, f67_arg2 )
	if f67_arg1.isClassButton then
		local f67_local0 = CoD.perController[f67_arg2]
		f67_local0.classNum = f67_arg1.actionParam
		f67_local0.isPreset = true
		f67_local0.weaponSlot = nil
		f67_local0.grenadeSlot = nil
		f67_local0.perkCategory = nil
		f67_local0.slotIndex = nil
	end
end

function GameSettingsButtonGainFocus( f68_arg0, f68_arg1, f68_arg2 )
	UpdateInfoModels( f68_arg1 )
end

function OpenGameSettings_GameMode( f69_arg0, f69_arg1, f69_arg2, f69_arg3, f69_arg4 )
	f69_arg4:saveState()
	OpenOverlay( f69_arg4, "GameSettings_EditModeSpecificOptions", f69_arg2 )
end

function OpenGameSettings_General( f70_arg0, f70_arg1, f70_arg2, f70_arg3, f70_arg4 )
	f70_arg4:saveState()
	OpenOverlay( f70_arg4, "GameSettings_GeneralSettings", f70_arg2 )
end

function OpenGameSettings_Spawn( f71_arg0, f71_arg1, f71_arg2, f71_arg3, f71_arg4 )
	f71_arg4:saveState()
	OpenOverlay( f71_arg4, "GameSettings_SpawnSettings", f71_arg2 )
end

function OpenGameSettings_HealthAndDamage( f72_arg0, f72_arg1, f72_arg2, f72_arg3, f72_arg4 )
	f72_arg4:saveState()
	OpenOverlay( f72_arg4, "GameSettings_HealthAndDamageSettings", f72_arg2 )
end

function OpenGameSettings_Competitive( f73_arg0, f73_arg1, f73_arg2, f73_arg3, f73_arg4 )
	f73_arg4:saveState()
	OpenOverlay( f73_arg4, "GameSettings_Competitive", f73_arg2 )
end

function OpenGameSettings_CreateAClass( f74_arg0, f74_arg1, f74_arg2, f74_arg3, f74_arg4 )
	f74_arg4:saveState()
	OpenOverlay( f74_arg4, "GameSettings_CreateAClassSettings", f74_arg2 )
end

function PlaySoundSetSound( f75_arg0, f75_arg1 )
	f75_arg0:playSound( f75_arg1 )
end

function PlayMenuMusic( f76_arg0 )
	Engine.PlayMenuMusic( f76_arg0 )
end

function PlaySoundAlias( f77_arg0 )
	Engine.PlaySound( f77_arg0 )
end

function PlaySoundFromElementModel( f78_arg0, f78_arg1, f78_arg2 )
	local f78_local0 = f78_arg1:getModel( f78_arg0, f78_arg2 )
	if f78_local0 then
		Engine.PlaySound( Engine.GetModelValue( f78_local0 ) )
	end
end

function StopSoundAlias( f79_arg0 )
	Engine.StopSound( f79_arg0 )
end

function StopSoundFromElementModel( f80_arg0, f80_arg1, f80_arg2 )
	local f80_local0 = f80_arg1:getModel( f80_arg0, f80_arg2 )
	if f80_local0 then
		Engine.StopSound( Engine.GetModelValue( f80_local0 ) )
	end
end

function UpdateModel( f81_arg0, f81_arg1, f81_arg2 )
	f81_arg0:setModel( f81_arg1:getModel() )
end

function UpdateElementModelToFocusedElementModel( f82_arg0, f82_arg1, f82_arg2, f82_arg3 )
	if f82_arg0[f82_arg2] then
		local f82_local0 = f82_arg0
		for f82_local4, f82_local5 in pairs( f82_arg3.idStack ) do
			if f82_local5 ~= f82_arg0.id then
				f82_local0 = f82_local0[f82_local5]
			end
		end
		if f82_local0 and f82_local0.id == f82_arg3.id then
			f82_arg0[f82_arg2]:setModel( f82_local0:getModel() )
		end
	end
end

function SetElementModelToFocusedElementModel( f83_arg0, f83_arg1, f83_arg2 )
	local f83_local0 = f83_arg1:getModel()
	if f83_arg0[f83_arg2] and f83_local0 then
		f83_arg0[f83_arg2]:setModel( f83_local0 )
	end
end

function CreateModelOnSelfModel( f84_arg0, f84_arg1, f84_arg2 )
	local f84_local0 = f84_arg1:getModel( controller, f84_arg2 )
	if f84_local0 ~= nil then
		Engine.CreateModel( f84_local0, f84_arg2 )
	end
end

function SetSelfModelValue( f85_arg0, f85_arg1, f85_arg2, f85_arg3, f85_arg4 )
	local f85_local0 = f85_arg1:getModel( f85_arg2, f85_arg3 )
	if f85_local0 ~= nil then
		Engine.SetModelValue( f85_local0, f85_arg4 )
	end
end

function ToggleSelfModelValueNumber( f86_arg0, f86_arg1, f86_arg2, f86_arg3 )
	local f86_local0 = f86_arg1:getModel( f86_arg2, f86_arg3 )
	if f86_local0 ~= nil then
		Engine.SetModelValue( f86_local0, 1 - Engine.GetModelValue( f86_local0 ) )
	end
end

function ToggleSelfModelBoolean( f87_arg0, f87_arg1, f87_arg2, f87_arg3 )
	local f87_local0 = f87_arg1:getModel( f87_arg2, f87_arg3 )
	if f87_local0 ~= nil then
		Engine.SetModelValue( f87_local0, not Engine.GetModelValue( f87_local0 ) )
	end
end

function ForceNotifyGlobalModel( f88_arg0, f88_arg1 )
	Engine.ForceNotifyModelSubscriptions( Engine.GetModel( Engine.GetGlobalModel(), f88_arg1 ) )
end

function ForceNotifyControllerModel( f89_arg0, f89_arg1 )
	local f89_local0 = Engine.GetModel( Engine.GetModelForController( f89_arg0 ), f89_arg1 )
	if f89_local0 then
		Engine.ForceNotifyModelSubscriptions( f89_local0 )
	end
end

function ShowKeyboard( f90_arg0, f90_arg1, f90_arg2, f90_arg3 )
	Engine.Exec( f90_arg2, "ui_keyboard_new " .. Enum.KeyboardType[f90_arg3] )
end

function RunClientDemo( f91_arg0, f91_arg1, f91_arg2 )
	local f91_local0 = f91_arg1.gridInfoTable.zeroBasedIndex + 1
	Engine.Exec( f91_arg2, "cl_demo_play " .. Engine.GetModelValue( f91_arg1:getModel( f91_arg2, "fileName" ) ) )
end

function LobbySetLeaderActivity( f92_arg0, f92_arg1, f92_arg2 )
	CoD.LobbyBase.SetLeaderActivity( f92_arg1, CoD.LobbyBase.LeaderActivity[f92_arg2] )
end

function LobbyResetLeaderActivity( f93_arg0, f93_arg1 )
	CoD.LobbyBase.ResetLeaderActivity( f93_arg1 )
end

function StartGame( f94_arg0, f94_arg1 )
	if Engine.GetGametypeSetting( "teamAssignment" ) == LuaEnums.TEAM_ASSIGNMENT.AUTO then
		Engine.PartyHostReassignTeams()
	end
	Engine.PartyHostToggleStart()
end

function SetPrimary( f95_arg0, f95_arg1 )
	Engine.ExecNow( f95_arg1, "setclientbeingusedandprimary" )
end

function SwitchToMainLobby( f96_arg0, f96_arg1 )
	Engine.SessionModeSetOnlineGame( true )
	Engine.Exec( f96_arg1, "xstartprivateparty" )
	Engine.Exec( f96_arg1, "party_statechanged" )
	Engine.ExecNow( f96_arg1, "disableallclients" )
	Engine.ExecNow( f96_arg1, "setclientbeingusedandprimary" )
	Engine.Exec( f96_arg1, "session_rejoinsession " .. CoD.SESSION_REJOIN_CHECK_FOR_SESSION )
end

function SwitchToMainMenu( f97_arg0, f97_arg1 )
	Engine.SessionModeResetModes()
	Engine.Exec( f97_arg1, "xstopprivateparty" )
	if CoD.isPS3 then
		Engine.Exec( f97_arg1, "signoutSubUsers" )
	end
end

function SwitchToSystemLinkLobby( f98_arg0, f98_arg1 )
	Engine.ExecNow( f98_arg1, "disableallclients" )
	Engine.ExecNow( f98_arg1, "setclientbeingusedandprimary" )
	Engine.ExecNow( f98_arg1, "leaveAllParties" )
	SwitchLobbies_InitializeLobby( f98_arg1, Engine.DvarInt( f98_arg1, "party_maxplayers_systemlink" ), Engine.DvarInt( f98_arg1, "party_maxlocalplayers_systemlink" ), false )
	Engine.SessionModeSetOnlineGame( false )
	Engine.SessionModeSetSystemLink( true )
	Engine.GameModeSetMode( CoD.GAMEMODE_PRIVATE_MATCH, true )
	Engine.ExecNow( f98_arg1, "exec gamedata/configs/common/default_private.cfg" )
	Engine.SetGametype( SwitchLobbies_GetGametype( f98_arg1 ) )
	Engine.ExecNow( f98_arg1, "ui_mapname " .. SwitchLobbies_GetMap( f98_arg1 ) )
	Engine.Exec( f98_arg1, "xstartlocalprivateparty" )
	Engine.Exec( f98_arg1, "xstartpartyhost" )
	Dvar.party_maxplayers:set( Dvar.party_maxplayers_systemlink:get() )
	Engine.Exec( f98_arg1, "party_statechanged" )
end

function RefreshLobbyGameClient( f99_arg0, f99_arg1 )
	local f99_local0 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.gameClient.update" )
	local f99_local1
	if Engine.GetModelValue( f99_local0 ) == 0 then
		f99_local1 = 1
	else
		f99_local1 = 0
	end
	Engine.SetModelValue( f99_local0, f99_local1 )
end

function ShowHeaderIconOnly( f100_arg0 )
	f100_arg0.showHeaderKicker = false
	f100_arg0.showHeaderIcon = true
end

function ShowHeaderKickerAndIcon( f101_arg0 )
	f101_arg0.showHeaderKicker = true
	f101_arg0.showHeaderIcon = true
end

function SetHeadingKickerText( f102_arg0 )
	local f102_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerText" )
	if f102_local0 then
		Engine.SetModelValue( f102_local0, Engine.Localize( f102_arg0 ) )
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
	local f103_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerMode" )
	local f103_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerText" )
	if f103_local1 then
		local f103_local2 = Engine.SetModelValue
		local f103_local3 = f103_local1
		local f103_local4
		if f103_local0 then
			f103_local4 = Engine.GetModelValue( f103_local0 )
			if not f103_local4 then
			
			else
				f103_local2( f103_local3, f103_local4 )
			end
		end
		f103_local4 = ""
	end
end

function SetHeadingKickerTextToSelectedWeapon( f104_arg0 )
	local f104_local0 = CoD.GetCustomization( f104_arg0, "weapon_index" )
	local f104_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerText" )
	if f104_local1 and f104_local0 ~= CoD.CACUtility.EmptyItemIndex then
		local f104_local2 = Engine.GetItemRef( f104_local0 )
		local f104_local3 = Engine.ToUpper( Engine.Localize( Engine.GetItemName( f104_local0 ) ) )
		if f104_local1 and f104_local3 then
			Engine.SetModelValue( f104_local1, f104_local3 )
		end
	end
end

function ForceLobbyButtonUpdate( f105_arg0 )
	LuaUtils.ForceLobbyButtonUpdate()
end

function OpenChangeRankedSettingsPopup( f106_arg0, f106_arg1, f106_arg2, f106_arg3, f106_arg4 )
	CoD.OverlayUtility.AddSystemOverlay( "ChangeRankedSettingsPopup", {
		menuName = "SystemOverlay_Compact",
		title = "MENU_CHANGE_RANKED_SETTINGS_CAPS",
		description = "MENU_CHANGE_RANKED_SETTINGS_DESC",
		listDatasource = function ()
			DataSources.ChangeRankedSettingssPopup_List = DataSourceHelpers.ListSetup( "ChangeRankedSettingssPopup_List", function ( f108_arg0 )
				local f108_local0 = {}
				local f108_local1 = {
					models = {
						displayText = "MENU_NON_RANKED_GAME_CAPS"
					}
				}
				local f108_local2 = {
					action = function ( f109_arg0, f109_arg1, f109_arg2, f109_arg3, f109_arg4 )
						if Dvar.zm_private_rankedmatch:exists() then
							Dvar.zm_private_rankedmatch:set( false )
							Engine.SetProfileVar( f109_arg2, "com_privategame_ranked_zm", 0 )
							Engine.Exec( f109_arg2, "updategamerprofile" )
						end
						GoBack( f109_arg4, f109_arg2 )
					end
				}
				local f108_local3 = Dvar.zm_private_rankedmatch:exists()
				if f108_local3 then
					f108_local3 = Dvar.zm_private_rankedmatch:get() == false
				end
				f108_local2.selectIndex = f108_local3
				f108_local1.properties = f108_local2
				f108_local2 = {
					models = {
						displayText = "MENU_RANKED_GAME_CAPS"
					}
				}
				f108_local3 = {
					action = function ( f110_arg0, f110_arg1, f110_arg2, f110_arg3, f110_arg4 )
						if Dvar.zm_private_rankedmatch:exists() then
							Dvar.zm_private_rankedmatch:set( true )
							Engine.SetProfileVar( f110_arg2, "com_privategame_ranked_zm", 1 )
							Engine.Exec( f110_arg2, "updategamerprofile" )
						end
						GoBack( f110_arg4, f110_arg2 )
					end
				}
				local f108_local4 = Dvar.zm_private_rankedmatch:exists()
				if f108_local4 then
					f108_local4 = Dvar.zm_private_rankedmatch:get() == true
				end
				f108_local3.selectIndex = f108_local4
				f108_local2.properties = f108_local3
				f108_local0[1] = f108_local1
				f108_local0[2] = f108_local2
				return f108_local0
			end, true, nil )
			return "ChangeRankedSettingssPopup_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage
	} )
	CoD.OverlayUtility.CreateOverlay( f106_arg2, f106_arg0, "ChangeRankedSettingsPopup" )
end

function RefreshServerList( f111_arg0, f111_arg1 )
	Engine.LobbyServerRefreshLocalServers( f111_arg1 )
end

function JoinSystemLinkServer( f112_arg0, f112_arg1, f112_arg2 )
	if not f112_arg1.gridInfoTable then
		return 
	end
	local f112_local0 = f112_arg1.gridInfoTable.zeroBasedIndex
	local f112_local1 = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "serverListRoot" ), "server" .. tostring( f112_local0 ) ), "sessionMode" ) )
	local f112_local2 = nil
	if f112_local1 == Enum.eModes.MODE_CAMPAIGN then
		f112_local2 = LobbyData.UITargets.UI_CPLOBBYLANGAME.maxLocalClientsNetwork
	elseif f112_local1 == Enum.eModes.MODE_MULTIPLAYER then
		f112_local2 = LobbyData.UITargets.UI_MPLOBBYLANGAME.maxLocalClientsNetwork
	elseif f112_local1 == Enum.eModes.MODE_ZOMBIES then
		f112_local2 = LobbyData.UITargets.UI_ZMLOBBYLANGAME.maxLocalClientsNetwork
	end
	if f112_local2 == nil then
		f112_local2 = 1
	end
	local f112_local3 = function ( f113_arg0 )
		if f113_arg0 then
			Engine.LobbyServerListJoinServer( f113_arg0.controller, f113_arg0.index )
		end
	end
	
	if f112_local2 < Engine.GetUsedControllerCount() then
		CoD.OverlayUtility.CreateOverlay( f112_arg2, f112_arg0, "LobbyLocalClientWarning", {
			controller = f112_arg2,
			navToMenu = nil,
			popupName = nil,
			openFromMenu = nil,
			actionFunc = f112_local3,
			index = f112_local0
		} )
		return 
	end
	f112_local3( {
		controller = f112_arg2,
		index = f112_local0
	} )
end

function LobbyLANServerPlayerListRefresh( f114_arg0, f114_arg1, f114_arg2 )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "serverPlayerListRoot" ), "selectedServer" ), f114_arg1.gridInfoTable.zeroBasedIndex )
	if f114_arg0.LANServerBrowserDetails and f114_arg0.LANServerBrowserDetails.PlayerList then
		f114_arg0.LANServerBrowserDetails.PlayerList:updateDataSource()
	end
end

function UploadStats( f115_arg0, f115_arg1 )
	Engine.Exec( f115_arg1, "uploadstats" )
	Engine.Exec( f115_arg1, "savegamerprofilestats" )
end

function SaveLoadout( f116_arg0, f116_arg1 )
	local f116_local0 = CoD.CCUtility.customizationMode
	if not f116_local0 then
		f116_local0 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	end
	Engine.Exec( f116_arg1, "saveLoadout " .. f116_local0 )
end

function CustomGameSettingsMenuClosed( f117_arg0, f117_arg1 )
	Engine.LobbyVM_CallFunc( "OnGametypeSettingsChange", {
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyModule = Enum.LobbyModule.LOBBY_MODULE_HOST
	} )
	Engine.LobbyHostSessionSetDirty( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionDirty.SESSION_DIRTY_STATE )
end

function OpenCACItemBansRestrictionsFlyout( f118_arg0, f118_arg1, f118_arg2 )
	SetGlobalModelValueTrue( "lobbyRoot.ShowCACItemBansRestrictionFlyout" )
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.ShowCACItemBansRestrictionFlyout" ) )
end

function AdjustGameSettingsTab( f119_arg0, f119_arg1, f119_arg2, f119_arg3 )
	local f119_local0 = Engine.GetModel( Engine.GetModelForController( f119_arg2 ), "GametypeSettings" )
	local f119_local1 = Engine.CreateModel( f119_local0, "selectedTab" )
	local f119_local2 = Engine.GetModelValue( f119_local1 )
	local f119_local3 = Engine.GetModelValue( Engine.CreateModel( f119_local0, "tabCount" ) )
	local f119_local4 = f119_local2 + tonumber( f119_arg3 )
	if f119_local3 < f119_local4 then
		f119_local4 = 1
	end
	if f119_local4 < 1 then
		f119_local4 = f119_local3
	end
	Engine.SetModelValue( f119_local1, f119_local4 )
end

function SetGameSettingsTab( f120_arg0, f120_arg1, f120_arg2, f120_arg3 )
	local f120_local0 = Engine.CreateModel( Engine.GetModel( Engine.GetModelForController( f120_arg2 ), "GametypeSettings" ), "selectedTab" )
	if Engine.GetModelValue( f120_local0 ) ~= f120_arg3 then
		Engine.SetModelValue( f120_local0, f120_arg3 )
	end
end

function AdjustCompetitiveItemSettingsFilter( f121_arg0, f121_arg1, f121_arg2, f121_arg3 )
	local f121_local0 = Engine.GetModel( Engine.GetModelForController( f121_arg2 ), "GametypeSettings" )
	local f121_local1 = Engine.CreateModel( f121_local0, "selectedItemSettingGroup" )
	local f121_local2 = Engine.GetModelValue( f121_local1 )
	local f121_local3 = Engine.GetModelValue( Engine.CreateModel( f121_local0, "selectedItemSettingGroupCount" ) )
	local f121_local4 = f121_local2 + tonumber( f121_arg3 )
	if f121_local3 < f121_local4 then
		f121_local4 = 1
	end
	if f121_local4 < 1 then
		f121_local4 = f121_local3
	end
	Engine.SetModelValue( f121_local1, f121_local4 )
end

function SetCompetitiveItemSettingsFilter( f122_arg0, f122_arg1, f122_arg2, f122_arg3 )
	local f122_local0 = Engine.GetModel( Engine.GetModelForController( f122_arg2 ), "GametypeSettings" )
	local f122_local1 = Engine.CreateModel( f122_local0, "selectedItemSettingGroup" )
	local f122_local2 = Engine.GetModelValue( f122_local1 )
	local f122_local3 = Engine.GetModelValue( Engine.CreateModel( f122_local0, "selectedItemSettingGroupCount" ) )
	if f122_local2 ~= f122_arg3 then
		Engine.SetModelValue( f122_local1, f122_arg3 )
	end
end

function ToggleCompetitiveAttachmentSettingsTab( f123_arg0, f123_arg1, f123_arg2 )
	local f123_local0 = Engine.CreateModel( Engine.GetModel( Engine.GetModelForController( f123_arg2 ), "GametypeSettings" ), "selectedAttachmentTab" )
	local f123_local1 = Engine.GetModelValue( f123_local0 )
	local f123_local2 = 1
	if f123_local1 == 1 then
		f123_local2 = 2
	end
	Engine.SetModelValue( f123_local0, f123_local2 )
end

function SetCompetitiveAttachmentSettingsTab( f124_arg0, f124_arg1, f124_arg2, f124_arg3 )
	local f124_local0 = Engine.CreateModel( Engine.GetModel( Engine.GetModelForController( f124_arg2 ), "GametypeSettings" ), "selectedAttachmentTab" )
	local f124_local1 = Engine.GetModelValue( f124_local0 )
	if f124_arg3 ~= selectedAttahmentTab then
		Engine.SetModelValue( f124_local0, f124_arg3 )
	end
end

function UpdateSelectedGametypeSettingModels( f125_arg0, f125_arg1, f125_arg2 )
	local f125_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
	local f125_local1 = f125_arg1:getModel()
	Engine.SetModelValue( Engine.CreateModel( f125_local0, "title" ), Engine.GetModelValue( Engine.GetModel( f125_local1, "title" ) ) )
	Engine.SetModelValue( Engine.CreateModel( f125_local0, "description" ), Engine.GetModelValue( Engine.GetModel( f125_local1, "description" ) ) )
	Engine.SetModelValue( Engine.CreateModel( f125_local0, "image" ), Engine.GetModelValue( Engine.GetModel( f125_local1, "image" ) ) )
end

function OpenAttachmentRestrictionPopup( f126_arg0, f126_arg1, f126_arg2, f126_arg3 )
	f126_arg3:saveState()
	CoD.OverlayUtility.CreateOverlay( f126_arg2, f126_arg0, "RestrictedAttachmentMenu", f126_arg2, f126_arg1 )
end

function CharacterDraftLoadoutSelected( f127_arg0, f127_arg1, f127_arg2 )
	if not CharacterDraftActive() then
		return 
	else
		local f127_local0 = Engine.GetEquippedHero( f127_arg2, CoD.CCUtility.customizationMode )
		Engine.SendCharacterDraftSelection( f127_arg2, f127_local0, Engine.GetLoadoutTypeForHero( f127_arg2, f127_local0 ) )
	end
end

function ForceNotifyPregameUpdate( f128_arg0, f128_arg1, f128_arg2 )
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ) )
end

function AdjustPregameVoteFilter( f129_arg0, f129_arg1, f129_arg2, f129_arg3 )
	local f129_local0 = Engine.CreateModel( Engine.GetModel( Engine.GetModelForController( f129_arg2 ), "Pregame" ), "voteFilter" )
	local f129_local1 = Engine.GetModelValue( f129_local0 ) + tonumber( f129_arg3 )
	if f129_local1 > #CoD.CACUtility.PregameLoadoutFilters then
		f129_local1 = 1
	end
	if f129_local1 < 1 then
		f129_local1 = #CoD.CACUtility.PregameLoadoutFilters
	end
	Engine.SetModelValue( f129_local0, f129_local1 )
end

function SetPregameVoteFilter( f130_arg0, f130_arg1, f130_arg2, f130_arg3 )
	local f130_local0 = Engine.CreateModel( Engine.GetModel( Engine.GetModelForController( f130_arg2 ), "Pregame" ), "voteFilter" )
	if Engine.GetModelValue( f130_local0 ) ~= f130_arg3 then
		Engine.SetModelValue( f130_local0, f130_arg3 )
	end
end

function ToggleRestrictedContentEquippedFilter( f131_arg0 )
	local f131_local0 = Engine.CreateModel( Engine.GetModel( Engine.GetModelForController( f131_arg0 ), "Pregame" ), "equippedFilter" )
	Engine.SetModelValue( f131_local0, not Engine.GetModelValue( f131_local0 ) )
end

function SendItemVote( f132_arg0, f132_arg1, f132_arg2, f132_arg3 )
	local f132_local0 = Engine.GetModelValue( f132_arg1:getModel( f132_arg2, "itemType" ) )
	local f132_local1 = -1
	local f132_local2 = f132_arg1:getModel( f132_arg2, "itemIndex" )
	if f132_local2 then
		f132_local1 = Engine.GetModelValue( f132_local2 )
	end
	local f132_local3 = -1
	local f132_local4 = f132_arg1:getModel( f132_arg2, "attachmentIndex" )
	if f132_local4 then
		f132_local3 = Engine.GetModelValue( f132_local4 )
	end
	local f132_local5 = -1
	local f132_local6 = f132_arg1:getModel( f132_arg2, "itemGroup" )
	if f132_local6 then
		f132_local5 = Engine.GetModelValue( f132_local6 )
	end
	if f132_local0 == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
		Engine.SendItemVote( f132_arg2, f132_local1, f132_arg3 )
	elseif f132_local0 == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
		Engine.SendAttachmentVote( f132_arg2, f132_local3, f132_arg3 )
	elseif f132_local0 == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
		Engine.SendItemAttachmentVote( f132_arg2, f132_local1, f132_local3, f132_arg3 )
	elseif f132_local0 == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
		Engine.SendItemGroupAttachmentVote( f132_arg2, f132_local5, f132_local3, f132_arg3 )
	end
end

function VoteBanItem( f133_arg0, f133_arg1, f133_arg2 )
	SendItemVote( f133_arg0, f133_arg1, f133_arg2, Enum.VoteType.VOTE_TYPE_BAN )
end

function VoteProtectItem( f134_arg0, f134_arg1, f134_arg2 )
	SendItemVote( f134_arg0, f134_arg1, f134_arg2, Enum.VoteType.VOTE_TYPE_PROTECT )
end

function ShowPregameVoteOptions( f135_arg0, f135_arg1, f135_arg2 )
	CoD.OverlayUtility.AddSystemOverlay( "PregameVoteOptions", {
		menuName = "FeatureOverlay",
		frameWidget = "CoD.Pregame_ItemVote_BanProtectPopup",
		title = "MENU_BAN_PROTECT_CAPS",
		description = function ( f136_arg0, f136_arg1 )
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f136_arg0 ), "Pregame.selectedItemName" ), Engine.GetModelValue( f135_arg1:getModel( f136_arg0, "name" ) ) )
			local f136_local0 = f135_arg1:getModel( f136_arg0, "loadoutSlot" )
			return "MENU_BAN_PROTECT_DESC"
		end,
		image = function ( f137_arg0 )
			local f137_local0 = f135_arg1:getModel( f137_arg0, "image" )
			if f137_local0 then
				return Engine.GetModelValue( f137_local0 )
			else
				return ""
			end
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Unlock,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		state = function ( f138_arg0, f138_arg1 )
			if ItemIsBanned( nil, f138_arg1, f138_arg0 ) == true then
				Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f138_arg0 ), "Pregame.itemVotedBy" ), CoD.CACUtility.GetItemVotedBy( CoD.CACUtility.GetItemInfoFromElementModel( f138_arg0, f135_arg1:getModel() ) ) )
				return Enum.VoteType.VOTE_TYPE_BAN
			elseif ItemIsProtected( nil, f138_arg1, f138_arg0 ) == true then
				Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f138_arg0 ), "Pregame.itemVotedBy" ), CoD.CACUtility.GetItemVotedBy( CoD.CACUtility.GetItemInfoFromElementModel( f138_arg0, f135_arg1:getModel() ) ) )
				return Enum.VoteType.VOTE_TYPE_PROTECT
			else
				return Enum.VoteType.VOTE_TYPE_INVALID
			end
		end,
		listDatasource = function ( f139_arg0, f139_arg1 )
			DataSources.PregameVoteButtons = DataSourceHelpers.ListSetup( "PregameVoteButtons", function ( f140_arg0 )
				local f140_local0 = false
				if ItemIsBanned( nil, f139_arg1, f140_arg0 ) then
					f140_local0 = true
				end
				if f140_local0 == false and ItemIsProtected( nil, f139_arg1, f140_arg0 ) then
					f140_local0 = true
				end
				return {
					{
						models = {
							displayText = "MENU_BAN_CAPS",
							disabled = f140_local0
						},
						properties = {
							action = function ( f141_arg0, f141_arg1, f141_arg2, f141_arg3, f141_arg4 )
								SendItemVote( f141_arg0, f139_arg1, f141_arg2, Enum.VoteType.VOTE_TYPE_BAN )
							end
							
						}
					},
					{
						models = {
							displayText = "MENU_PROTECT_CAPS",
							disabled = f140_local0 or ItemIsInRestrictionState( nil, f139_arg1, f140_arg0, Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_BANONLY )
						},
						properties = {
							action = function ( f142_arg0, f142_arg1, f142_arg2, f142_arg3, f142_arg4 )
								SendItemVote( f142_arg0, f139_arg1, f142_arg2, Enum.VoteType.VOTE_TYPE_PROTECT )
							end
							
						}
					}
				}
			end, nil, nil, function ( f143_arg0, f143_arg1, f143_arg2 )
				local f143_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
				if f143_arg1.pregameUpdateSubscription then
					f143_arg1:removeSubscription( f143_arg1.pregameUpdateSubscription )
				end
				f143_arg1.pregameUpdateSubscription = f143_arg1:subscribeToModel( f143_local0, function ()
					f143_arg1:updateDataSource( false, false )
				end, false )
			end )
			return "PregameVoteButtons"
		end
	} )
	local f135_local0 = CoD.OverlayUtility.CreateOverlay( f135_arg2, f135_arg0, "PregameVoteOptions", f135_arg2, f135_arg1 )
	f135_local0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ), function ()
		f135_local0:refreshData( f135_arg2, f135_arg1 )
	end, false )
end

function ConfirmPregameVotePass( f146_arg0, f146_arg1, f146_arg2 )
	CoD.OverlayUtility.AddSystemOverlay( "PregamePassConfirm", {
		menuName = "SystemOverlay_Compact",
		title = "MENU_VOTE_FOREFIT_CAPS",
		description = "MENU_VOTE_FOREFIT_DESC",
		image = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.Alert,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		listDatasource = function ()
			DataSources.PregamePassConfirmButtons = DataSourceHelpers.ListSetup( "PregamePassConfirmButtons", function ( f148_arg0 )
				return {
					{
						models = {
							displayText = "MENU_VOTE_FORFEIT_CANCEL_CAPS"
						},
						properties = {
							action = function ( f149_arg0, f149_arg1, f149_arg2, f149_arg3, f149_arg4 )
								GoBack( f149_arg0, f149_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = "MENU_VOTE_FORFEIT_CONFIRM_CAPS"
						},
						properties = {
							action = function ( f150_arg0, f150_arg1, f150_arg2, f150_arg3, f150_arg4 )
								Engine.SendItemVote( f150_arg2, 0, Enum.VoteType.VOTE_TYPE_INVALID )
								GoBack( f150_arg4, f150_arg2 )
							end
							
						}
					}
				}
			end, true, nil )
			return "PregamePassConfirmButtons"
		end
	} )
	CoD.OverlayUtility.CreateOverlay( f146_arg2, f146_arg0, "PregamePassConfirm" )
end

function ShowCACContentWarning( f151_arg0, f151_arg1, f151_arg2 )
	CoD.OverlayUtility.AddSystemOverlay( "PregameCACWarning", {
		menuName = "SystemOverlay_Pregame",
		openMethod = CoD.OverlayUtility.OpenMethods.Overlay,
		categoryType = function ( f152_arg0 )
			return CoD.OverlayUtility.OverlayTypes.GenericMessage
		end,
		frameWidget = "CoD.Pregame_RestrictedContentWarning"
	} )
	CoD.OverlayUtility.CreateOverlay( f151_arg2, f151_arg0, "PregameCACWarning", f151_arg2 )
end

function ShowStreakContentWarning( f153_arg0, f153_arg1, f153_arg2 )
	CoD.OverlayUtility.AddSystemOverlay( "PregameStreakWarning", {
		menuName = "SystemOverlay_Pregame",
		title = "MENU_STREAK_BANNED_CAPS",
		description = "MENU_CAC_CONTENT_BANNED_DESC",
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		openMethod = CoD.OverlayUtility.OpenMethods.Overlay,
		frameWidget = "CoD.Pregame_RestrictedContentWarning"
	} )
	CoD.OverlayUtility.CreateOverlay( f153_arg2, f153_arg0, "PregameStreakWarning" )
end

function SetInitLobbyMenu( f154_arg0, f154_arg1 )
	CoD.LobbyBase.SetInitLobbyMenu( f154_arg0, f154_arg1 )
end

function LobbyToggleNetwork( f155_arg0, f155_arg1, f155_arg2, f155_arg3 )
	for f155_local0 = 1, Engine.GetMaxControllerCount() - 1, 1 do
		LobbyRemoveLocalClientFromLobby( f155_arg0, f155_local0 )
	end
	if f155_arg3 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		if IsOrbis() then
			if Engine.DisplayNpAvailabilityErrors( f155_arg2 ) then
				return 
			elseif not Engine.DisplayUpsellAndContentWarnings( f155_arg2 ) then
				return 
			end
		end
		if CoD.LobbyBase.ForceOffline() == true then
			CoD.OverlayUtility.CreateOverlay( f155_arg2, f155_arg0, "UpdateNeeded" )
			return 
		elseif not Engine.IsDemonwareFetchingDone( f155_arg2 ) then
			Engine.LiveConnectEnableDemonwareConnect()
			CoD.OverlayUtility.CreateOverlay( f155_arg2, f155_arg0, "ConnectingToDemonware" )
			return 
		end
	end
	Engine.LobbyVM_CallFunc( "NetworkModeChanged", {
		controller = f155_arg2,
		networkMode = f155_arg3
	} )
	local f155_local1 = f155_arg0:getParent()
	f155_arg0:close()
	f155_local1:processEvent( {
		name = "lobby_spinner_popup",
		openPopup = true
	} )
end

function GenericPopupClose( f156_arg0, f156_arg1, f156_arg2, f156_arg3 )
	GoBack( f156_arg0, f156_arg2 )
end

function OpenLobbyToggleNetworkConfirmation( f157_arg0, f157_arg1, f157_arg2, f157_arg3, f157_arg4 )
	local f157_local0 = {}
	local f157_local1, f157_local2 = nil
	local f157_local3 = Engine.GetLobbyNetworkMode()
	if f157_arg2 ~= 0 then
		LuaUtils.UI_ShowWarningMessageDialog( f157_arg2, "MENU_PRIMARY_CLIENT_ONLY" )
		return 
	elseif f157_local3 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		if not Engine.CheckNetConnection() then
			if CoD.isPC then
				LuaUtils.UI_ShowErrorMessageDialog( f157_arg2, "PLATFORM_STEAM_OFFLINE" )
			else
				LuaUtils.UI_ShowErrorMessageDialog( f157_arg2, "XBOXLIVE_NETCONNECTION" )
			end
			return 
		elseif IsOrbis() then
			if not Engine.IsSignedIntoPSN( f157_arg2 ) then
				Engine.DisplayNpError( f157_arg2, "-2141913082" )
				return 
			elseif Engine.DisplayNpAvailabilityErrors( f157_arg2 ) then
				return 
			elseif not Engine.DisplayUpsellAndContentWarnings( f157_arg2 ) then
				return 
			end
		end
		if IsDurango() and not Engine.HasMPPrivileges( f157_arg2 ) then
			LuaUtils.UI_ShowErrorMessageDialog( f157_arg2, "XBOXLIVE_MPNOTALLOWED" )
			return 
		elseif Engine.IsPlayerQueued( f157_arg2 ) then
			CoD.OverlayUtility.CreateOverlay( f157_arg2, f157_arg0, "LoginQueue" )
			return 
		elseif Engine.IsSignedInToLive( f157_arg2 ) == false then
			if IsOrbis() then
				if not Engine.DisplayNpAvailabilityErrors( f157_arg2 ) then
					CoD.OverlayUtility.CreateOverlay( f157_arg2, f157_arg0, "LobbyPlayNetworkModePopup", Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
				end
			elseif IsDurango() then
				if Engine.HasMPPrivileges( f157_arg2 ) then
					CoD.OverlayUtility.CreateOverlay( f157_arg2, f157_arg0, "LobbyPlayNetworkModePopup", Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
				end
			elseif CoD.isPC then
				if not Engine.IsDemonwareFetchingDone( f157_arg2 ) then
					Engine.LiveConnectEnableDemonwareConnect()
					CoD.OverlayUtility.CreateOverlay( f157_arg2, f157_arg0, "ConnectingToDemonware" )
					return 
				end
				CoD.OverlayUtility.CreateOverlay( f157_arg2, f157_arg0, "LobbyPlayNetworkModePopup", Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
			end
		else
			if not Engine.IsDemonwareFetchingDone( f157_arg2 ) then
				Engine.LiveConnectEnableDemonwareConnect()
				Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f157_arg2 ), "lobbyRoot.anticheat" ), "reputation" ), 0 )
				CoD.OverlayUtility.CreateOverlay( f157_arg2, f157_arg0, "ConnectingToDemonware" )
				return 
			end
			CoD.OverlayUtility.CreateOverlay( f157_arg2, f157_arg0, "LobbyPlayNetworkModePopup", Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
		end
	elseif f157_local3 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		CoD.OverlayUtility.CreateOverlay( f157_arg2, f157_arg0, "LobbyPlayNetworkModePopup", Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN )
	end
end

function LobbyNoAction( f158_arg0, f158_arg1, f158_arg2, f158_arg3, f158_arg4 )
	
end

function LobbyGiveLeadership( f159_arg0, f159_arg1, f159_arg2, f159_arg3, f159_arg4 )
	CoD.LobbyBase.GiveLeadership( f159_arg4, f159_arg1, f159_arg2 )
end

function OpenMPFirstTimeFlow( f160_arg0, f160_arg1, f160_arg2, f160_arg3, f160_arg4 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "heroSelectionTutorial" ), true )
	if f160_arg3 == "goBackFirst" then
		f160_arg4 = GoBack( f160_arg0, f160_arg2 )
	end
	f160_arg4.openOverlayAfterSpinner = "WelcomeMenu"
	f160_arg4.openOverlayAfterSpinnerController = f160_arg2
	NavigateToLobby_FirstTimeFlowMP( f160_arg0, f160_arg1, f160_arg2, f160_arg4 )
end

function OpenCPFirstTimeFlow( f161_arg0, f161_arg1, f161_arg2, f161_arg3, f161_arg4 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "firstTimeFlowCPConfirm" ), false )
	f161_arg4.openOverlayAfterSpinner = "CPWelcomeMenu"
	f161_arg4.openOverlayAfterSpinnerController = f161_arg2
	NavigateToLobby_FirstTimeFlowCP( f161_arg0, f161_arg1, f161_arg2, f161_arg4 )
end

function FirstTimeSetup_SetOverview( f162_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f162_arg0 ), "firstTimeFlowState" ), CoD.CCUtility.FirstTimeFlowState.Overview )
end

function FirstTimeSetup_SetChangedCharacter( f163_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f163_arg0 ), "firstTimeFlowState" ), CoD.CCUtility.FirstTimeFlowState.SelectionChanged )
end

function FirstTimeSetup_SetComplete( f164_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f164_arg0 ), "firstTimeFlowState" ), CoD.CCUtility.FirstTimeFlowState.Complete )
end

function FirstTimeSetup_SetNone( f165_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f165_arg0 ), "firstTimeFlowState" ), CoD.CCUtility.FirstTimeFlowState.None )
end

function ShowReportPlayerDialog( f166_arg0, f166_arg1, f166_arg2, f166_arg3 )
	local f166_local0 = f166_arg3.controller
	local f166_local1 = f166_arg3.xuid
	local f166_local2 = Engine.GetPlayerInfo( f166_local0, f166_local1 )
	CoD.OverlayUtility.AddSystemOverlay( "ReportPlayer", {
		menuName = "FeatureOverlay",
		frameWidget = "CoD.systemOverlay_reportPlayer",
		xuid = f166_local1,
		gamertag = f166_local2.info.gamertag,
		clantag = f166_local2.info.clantag,
		emblemBacking = f166_local2.info.emblemBacking,
		categoryType = CoD.OverlayUtility.OverlayTypes.Unlock,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		listDatasource = function ()
			DataSources.ReportOptions = DataSourceHelpers.ListSetup( "ReportOptions", function ( f168_arg0 )
				return {
					{
						models = {
							displayText = "MENU_REPORT_USER_OFFENSIVE_CAPS"
						},
						properties = {
							action = function ( f169_arg0, f169_arg1, f169_arg2, f169_arg3, f169_arg4 )
								Engine.ReportUser( f169_arg3, "offensive", 1, true )
								GoBack( f169_arg0, f169_arg2 )
							end
							,
							actionParam = f166_local1
						}
					},
					{
						models = {
							displayText = "MENU_REPORT_USER_OFFENSIVE_EMBLEM_CAPS"
						},
						properties = {
							action = function ( f170_arg0, f170_arg1, f170_arg2, f170_arg3, f170_arg4 )
								Engine.ReportUser( f170_arg3, "offensive_emblem", 1, true )
								GoBack( f170_arg0, f170_arg2 )
							end
							,
							actionParam = f166_local1
						}
					},
					{
						models = {
							displayText = "MENU_REPORT_USER_OFFENSIVE_PAINTJOB_CAPS"
						},
						properties = {
							action = function ( f171_arg0, f171_arg1, f171_arg2, f171_arg3, f171_arg4 )
								Engine.ReportUser( f171_arg3, "offensive_paintjob", 1, true )
								GoBack( f171_arg0, f171_arg2 )
							end
							,
							actionParam = f166_local1
						}
					},
					{
						models = {
							displayText = "MENU_REPORT_USER_CHEATER_CAPS"
						},
						properties = {
							action = function ( f172_arg0, f172_arg1, f172_arg2, f172_arg3, f172_arg4 )
								Engine.ReportUser( f172_arg3, "cheater", 1, true )
								GoBack( f172_arg0, f172_arg2 )
							end
							,
							actionParam = f166_local1
						}
					},
					{
						models = {
							displayText = "MENU_REPORT_USER_BOOSTER_CAPS"
						},
						properties = {
							action = function ( f173_arg0, f173_arg1, f173_arg2, f173_arg3, f173_arg4 )
								Engine.ReportUser( f173_arg3, "booster", 1, true )
								GoBack( f173_arg0, f173_arg2 )
							end
							,
							actionParam = f166_local1
						}
					}
				}
			end )
			return "ReportOptions"
		end
	} )
	CoD.OverlayUtility.CreateOverlay( f166_local0, f166_arg0, "ReportPlayer", f166_local0, f166_arg1 )
end

function CheckIfFeatureIsBanned( f174_arg0, f174_arg1 )
	if Engine.IsDedicatedServer() then
		return false
	else
		local f174_local0, f174_local1 = Engine.IsFeatureBanned( f174_arg0, f174_arg1 )
		if f174_local0 then
			return true
		else
			return false
		end
	end
end

function GetFeatureBanInfo( f175_arg0, f175_arg1 )
	if Engine.IsDedicatedServer() then
		return ""
	end
	local f175_local0 = Engine.IsFeaturePermaBanned( f175_arg0, f175_arg1 )
	local f175_local1 = LuaUtils.GetBanMessageForFeature( f175_arg0, f175_arg1, f175_local0 )
	local f175_local2 = ""
	if not f175_local0 then
		f175_local2 = Engine.GetTimeRemainingString( Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f175_arg0 ), "lobbyRoot.anticheat" ), "featureBans" ), "feature_" .. f175_arg1 .. "_end" ) ) - Engine.SystemTimeUInt64() )
	end
	return string.format( "%s\n\n%s", f175_local1, f175_local2 )
end

function PopAnticheatMessageAndGoForward_MP( f176_arg0, f176_arg1, f176_arg2, f176_arg3 )
	local f176_local0 = GoBack( f176_arg0, f176_arg2 )
	Engine.PopAnticheatMessage( f176_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.MP )
	NavigateCheckForFirstTime( f176_local0, f176_arg1, f176_arg2, {
		targetName = "MPLobbyMain",
		mode = Enum.eModes.MODE_MULTIPLAYER,
		firstTimeFlowAction = OpenMPFirstTimeFlow
	}, f176_local0 )
end

function PopAnticheatMessageAndGoForward_ZM( f177_arg0, f177_arg1, f177_arg2, f177_arg3 )
	local f177_local0 = GoBack( f177_arg0, f177_arg2 )
	Engine.PopAnticheatMessage( f177_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.ZM )
	NavigateToLobby_SelectionList( f177_local0, f177_arg1, f177_arg2, "ZMLobbyOnline", f177_local0 )
end

function PopAnticheatMessageAndGoForward_Paintshop( f178_arg0, f178_arg1, f178_arg2, f178_arg3 )
	local f178_local0 = GoBack( f178_arg0, f178_arg2 )
	Engine.PopAnticheatMessage( f178_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.UGC )
	OpenPaintshop( f178_local0, f178_arg1, f178_arg2, "", f178_local0 )
end

function PopAnticheatMessageAndGoForward_EmblemEditorFromEmblemSelect( f179_arg0, f179_arg1, f179_arg2, f179_arg3 )
	local f179_local0 = GoBack( f179_arg0, f179_arg2 )
	Engine.PopAnticheatMessage( f179_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.UGC )
	OpenEmblemEditor( f179_arg1, f179_local0, f179_arg2, nil, "EmblemSelect" )
end

function PopAnticheatMessageAndGoForward_EmblemEditorFromPaintjobSelect( f180_arg0, f180_arg1, f180_arg2, f180_arg3 )
	local f180_local0 = GoBack( f180_arg0, f180_arg2 )
	Engine.PopAnticheatMessage( f180_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.UGC )
	OpenEmblemEditor( f180_arg1, f180_local0, f180_arg2, nil, "PaintjobSelect" )
end

function PopAnticheatMessageAndGoForward_Loot( f181_arg0, f181_arg1, f181_arg2, f181_arg3 )
	local f181_local0 = GoBack( f181_arg0, f181_arg2 )
	Engine.PopAnticheatMessage( f181_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.LOOT )
	OpenBlackMarket( f181_local0, nil, f181_arg2 )
end

function PopAnticheatMessageAndGoForward_Arena( f182_arg0, f182_arg1, f182_arg2, f182_arg3 )
	local f182_local0 = GoBack( f182_arg0, f182_arg2 )
	Engine.PopAnticheatMessage( f182_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.ARENA )
	NavigateToLobby_SelectionList( f182_local0, f182_arg1, f182_arg2, "MPLobbyOnlineArena", f182_local0 )
end

function GetAnticheatMessageForwardFunction( f183_arg0, f183_arg1, f183_arg2 )
	if f183_arg0 == LuaEnums.ANTICHEAT_MESSAGE_GROUPS.MP then
		return PopAnticheatMessageAndGoForward_MP
	elseif f183_arg0 == LuaEnums.ANTICHEAT_MESSAGE_GROUPS.ZM then
		return PopAnticheatMessageAndGoForward_ZM
	elseif f183_arg0 == LuaEnums.ANTICHEAT_MESSAGE_GROUPS.UGC then
		if f183_arg1 == "EmblemEditor" then
			if f183_arg2 == "EmblemSelect" then
				return PopAnticheatMessageAndGoForward_EmblemEditorFromEmblemSelect
			elseif f183_arg2 == "PaintjobSelect" then
				return PopAnticheatMessageAndGoForward_EmblemEditorFromPaintjobSelect
			end
		elseif f183_arg1 == "Paintshop" then
			return PopAnticheatMessageAndGoForward_Paintshop
		end
	elseif f183_arg0 == LuaEnums.ANTICHEAT_MESSAGE_GROUPS.LOOT then
		return PopAnticheatMessageAndGoForward_Loot
	elseif f183_arg0 == LuaEnums.ANTICHEAT_MESSAGE_GROUPS.ARENA then
		return PopAnticheatMessageAndGoForward_Arena
	end
end

function DisplayAnticheatMessage( f184_arg0, f184_arg1, f184_arg2, f184_arg3, f184_arg4 )
	if Engine.IsDedicatedServer() then
		return 
	else
		local f184_local0 = GetAnticheatMessageForwardFunction( f184_arg2, f184_arg3, f184_arg4 )
		local f184_local1 = Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f184_arg1 ), "lobbyRoot.anticheat" ), "message" )
		CoD.OverlayUtility.CreateOverlay( f184_arg1, f184_arg0, "AnticheatMessage", Engine.GetModelValue( Engine.GetModel( f184_local1, "string" ) ), Engine.GetModelValue( Engine.GetModel( f184_local1, "url" ) ), f184_local0 )
	end
end

function OpenAnticheatPolicyInBrowser( f185_arg0, f185_arg1, f185_arg2, f185_arg3 )
	if Engine.IsDedicatedServer() then
		return 
	else
		Engine.OpenAnticheatPolicyInBrowser( f185_arg2, Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f185_arg2 ), "lobbyRoot.anticheat" ), "message" ), "url" ) ) )
	end
end

function NavigateCheckForFirstTime( f186_arg0, f186_arg1, f186_arg2, f186_arg3, f186_arg4 )
	if f186_arg3.targetName == "MPLobbyMain" then
		if Engine.PushAnticheatMessageToUI( f186_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.MP ) then
			DisplayAnticheatMessage( f186_arg0, f186_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.MP, "", "" )
			return 
		end
		for f186_local0 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
			if CheckIfFeatureIsBanned( f186_local0, LuaEnums.FEATURE_BAN.LIVE_MP ) then
				LuaUtils.UI_ShowErrorMessageDialog( f186_arg2, GetFeatureBanInfo( f186_local0, LuaEnums.FEATURE_BAN.LIVE_MP ) )
				return 
			end
		end
		if Engine.GetUsedControllerCount() > 1 then
			for f186_local1 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
				if CheckIfFeatureIsBanned( f186_local1, LuaEnums.FEATURE_BAN.MP_SPLIT_SCREEN ) then
					LuaUtils.UI_ShowErrorMessageDialog( f186_arg2, GetFeatureBanInfo( f186_local1, LuaEnums.FEATURE_BAN.MP_SPLIT_SCREEN ) )
					return 
				end
			end
		end
	end
	if f186_arg3.targetName == "CPLobbyOnline" then
		for f186_local0 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
			if CheckIfFeatureIsBanned( f186_local0, LuaEnums.FEATURE_BAN.LIVE_CP ) then
				LuaUtils.UI_ShowErrorMessageDialog( f186_arg2, GetFeatureBanInfo( f186_local0, LuaEnums.FEATURE_BAN.LIVE_CP ) )
				return 
			end
		end
		if Engine.GetUsedControllerCount() > 1 then
			for f186_local1 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
				if CheckIfFeatureIsBanned( f186_local1, LuaEnums.FEATURE_BAN.CP_SPLIT_SCREEN ) then
					LuaUtils.UI_ShowErrorMessageDialog( f186_arg2, GetFeatureBanInfo( f186_local1, LuaEnums.FEATURE_BAN.CP_SPLIT_SCREEN ) )
					return 
				end
			end
		end
	end
	if IsFirstTimeSetup( f186_arg2, f186_arg3.mode ) then
		f186_arg3.firstTimeFlowAction( f186_arg0, f186_arg1, f186_arg2, f186_arg3.targetName, f186_arg4 )
	else
		NavigateToLobby_SelectionList( f186_arg0, f186_arg1, f186_arg2, f186_arg3.targetName, f186_arg4 )
	end
end

function ShouldShowNightmares( f187_arg0 )
	return true
end

function OpenChooseCharacterFromFirstTimeFlow( f188_arg0, f188_arg1, f188_arg2, f188_arg3, f188_arg4 )
	CoD.CCUtility.customizationMode = Enum.eModes.MODE_MULTIPLAYER
	local f188_local0 = CoD.LobbyBase.OpenChooseCharacterLoadout( f188_arg4, f188_arg2, LuaEnums.CHOOSE_CHARACTER_OPENED_FROM.FIRST_TIME )
	f188_local0.previousMode = Engine.GetMostRecentPlayedMode( f188_arg2 )
end

function FirstTimeFlowResetCharacterMode( f189_arg0, f189_arg1, f189_arg2, f189_arg3, f189_arg4 )
	Engine.SetMostRecentPlayedMode( f189_arg4.previousMode )
	Engine.SwitchMode( f189_arg2, "" )
end

function SetCharacterModeToSessionMode( f190_arg0, f190_arg1, f190_arg2, f190_arg3 )
	CoD.CCUtility.customizationMode = f190_arg3
end

function SetCharacterModeToCurrentSessionMode( f191_arg0, f191_arg1, f191_arg2 )
	CoD.CCUtility.customizationMode = Engine.CurrentSessionMode()
end

function SetFirstTimeSetupComplete_MP( f192_arg0, f192_arg1, f192_arg2, f192_arg3, f192_arg4 )
	Engine.SetFirstTimeComplete( f192_arg2, Enum.eModes.MODE_MULTIPLAYER, true )
	FirstTimeSetup_SetNone( f192_arg2 )
end

function CloseMPFirstTimeFlow( f193_arg0, f193_arg1, f193_arg2, f193_arg3, f193_arg4 )
	GoBack( f193_arg0, f193_arg2 )
end

function OpenFindMatch( f194_arg0, f194_arg1, f194_arg2, f194_arg3, f194_arg4 )
	CoD.LobbyBase.OpenFindMatch( f194_arg4, f194_arg2 )
end

function OpenCompetitivePlaylist( f195_arg0, f195_arg1, f195_arg2, f195_arg3, f195_arg4 )
	CoD.LobbyBase.OpenCompetitivePlaylist( f195_arg4, f195_arg2 )
end

function OpenFreerunMapSelection( f196_arg0, f196_arg1, f196_arg2, f196_arg3, f196_arg4 )
	CoD.LobbyBase.OpenFreerunMapSelection( f196_arg4, f196_arg2 )
end

function OpenFreerunLeaderboards( f197_arg0, f197_arg1, f197_arg2, f197_arg3, f197_arg4 )
	CoD.LobbyBase.OpenFreerunLeaderboards( f197_arg4, f197_arg2 )
end

function OpenArenaMasterLeaderboards( f198_arg0, f198_arg1, f198_arg2, f198_arg3, f198_arg4 )
	CoD.LobbyBase.OpenArenaMasterLeaderboards( f198_arg4, f198_arg2 )
end

function OpenSetupGameMP( f199_arg0, f199_arg1, f199_arg2, f199_arg3, f199_arg4 )
	CoD.LobbyBase.OpenSetupGame( f199_arg4, f199_arg2, "GameSettingsFlyoutMP" )
end

function OpenChangeMapZM( f200_arg0, f200_arg1, f200_arg2, f200_arg3, f200_arg4 )
	CoD.perController[f200_arg2].choosingZMPlaylist = false
	CoD.LobbyBase.ZMOpenChangeMap( f200_arg4, f200_arg2, CoD.LobbyBase.MapSelect.SELECT, data )
end

function OpenSetupGame( f201_arg0, f201_arg1, f201_arg2, f201_arg3, f201_arg4 )
	CoD.LobbyBase.OpenSetupGame( f201_arg4, f201_arg2, "GameSettingsFlyout" )
end

function OpenBubbleGumPacksMenu( f202_arg0, f202_arg1, f202_arg2, f202_arg3, f202_arg4 )
	CoD.LobbyBase.OpenBubbleGumBuffs( f202_arg4, f202_arg2 )
end

function OpenMegaChewFactorymenu( f203_arg0, f203_arg1, f203_arg2, f203_arg3, f203_arg4 )
	CoD.LobbyBase.OpenMegaChewFactory( f203_arg4, f203_arg2 )
end

function OpenWeaponBuildKits( f204_arg0, f204_arg1, f204_arg2, f204_arg3, f204_arg4 )
	CoD.LobbyBase.OpenWeaponBuildKits( f204_arg4, f204_arg2 )
end

function OpenChangeMap( f205_arg0, f205_arg1, f205_arg2, f205_arg3, f205_arg4 )
	CoD.LobbyBase.OpenChangeMap( f205_arg0, f205_arg2 )
end

function OpenChangeGameMode( f206_arg0, f206_arg1, f206_arg2, f206_arg3, f206_arg4 )
	CoD.LobbyBase.OpenChangeGameMode( f206_arg0, f206_arg2 )
end

function OpenEditGameRules( f207_arg0, f207_arg1, f207_arg2, f207_arg3, f207_arg4 )
	CoD.LobbyBase.OpenEditGameRules( f207_arg0, f207_arg2 )
end

function OpenBotSettings( f208_arg0, f208_arg1, f208_arg2, f208_arg3, f208_arg4 )
	CoD.LobbyBase.OpenBotSettings( f208_arg0, f208_arg2 )
end

function OpenOptions( f209_arg0, f209_arg1, f209_arg2, f209_arg3, f209_arg4 )
	CoD.LobbyBase.OpenOptions( f209_arg4, f209_arg2 )
end

function OpenZMFindMatch( f210_arg0, f210_arg1, f210_arg2, f210_arg3, f210_arg4 )
	CoD.perController[f210_arg2].choosingZMPlaylist = true
	CoD.LobbyBase.OpenFindMatch( f210_arg4, f210_arg2, "ZMMapSelection" )
end

function OpenZMMapSelectLaunch( f211_arg0, f211_arg1, f211_arg2, f211_arg3, f211_arg4 )
	if Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyClientType.LOBBY_CLIENT_TYPE_ALL ) > 1 then
		LuaUtils.UI_ShowErrorMessageDialog( f211_arg2, "MENU_TOO_MANY_CLIENTS_FOR_SOLO_GAME" )
		return 
	else
		CoD.perController[f211_arg2].choosingZMPlaylist = false
		Dvar.zm_private_rankedmatch:set( true )
		CoD.LobbyBase.ZMOpenChangeMap( f211_arg4, f211_arg2, CoD.LobbyBase.MapSelect.LAUNCH, f211_arg3 )
	end
end

function OpenZMMapSelectNavigate( f212_arg0, f212_arg1, f212_arg2, f212_arg3, f212_arg4 )
	CoD.perController[f212_arg2].choosingZMPlaylist = false
	CoD.LobbyBase.ZMOpenChangeMap( f212_arg4, f212_arg2, CoD.LobbyBase.MapSelect.NAVIGATE, f212_arg3 )
end

function OpenZMMapSelectSelect( f213_arg0, f213_arg1, f213_arg2, f213_arg3, f213_arg4 )
	CoD.perController[f213_arg2].choosingZMPlaylist = false
	CoD.LobbyBase.ZMOpenChangeMap( f213_arg4, f213_arg2, CoD.LobbyBase.MapSelect.SELECT, f213_arg3 )
end

function ProcessZMMapSelectListAction( f214_arg0, f214_arg1, f214_arg2, f214_arg3 )
	if f214_arg1.mapId ~= nil then
		SetMap( f214_arg2, f214_arg1.mapId, false )
		f214_arg0.mapSelected = true
	end
	GoBack( f214_arg0, f214_arg2 )
end

function OpenMissionSelect( f215_arg0, f215_arg1, f215_arg2, f215_arg3, f215_arg4 )
	if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "cpLobby" ), "lan" )
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "cpLobby" ), "custom" )
	end
	Engine.SetDvar( "ui_blocksaves", "1" )
	f215_arg4:openPopup( "CPMissionSelect", f215_arg2 )
end

function OpenPublicGameSelect( f216_arg0, f216_arg1, f216_arg2, f216_arg3, f216_arg4 )
	Engine.SetDvar( "ui_blocksaves", "1" )
	f216_arg4:openPopup( "CPPublicGameSelect", f216_arg2 )
end

function OpenMissionOverview( f217_arg0, f217_arg1, f217_arg2, f217_arg3, f217_arg4 )
	f217_arg4:openPopup( "CPMissionOverviewFrontend", f217_arg2 )
end

function OpenDifficultySelect( f218_arg0, f218_arg1, f218_arg2, f218_arg3, f218_arg4 )
	local f218_local0 = f218_arg4:openPopup( "CPSelectDifficulty", f218_arg2 )
	f218_local0.disableConfirmSelection = f218_arg3
end

function OpenCAC( f219_arg0, f219_arg1, f219_arg2, f219_arg3, f219_arg4 )
	CoD.LobbyBase.OpenCAC( f219_arg4, f219_arg2 )
end

function OpenFindLANGame( f220_arg0, f220_arg1, f220_arg2, f220_arg3, f220_arg4 )
	if not Engine.CheckNetConnection() then
		LuaUtils.UI_ShowErrorMessageDialog( f220_arg2, "XBOXLIVE_NETCONNECTION" )
		return 
	elseif Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 2 then
		CoD.OverlayUtility.CreateOverlay( f220_arg2, f220_arg4, "LobbyLocalClientWarning", {
			controller = f220_arg2,
			navToMenu = nil,
			popupName = "LobbyServerBrowserOverlay",
			openFromMenu = f220_arg4
		} )
		return 
	else
		OpenPopup( f220_arg4, "LobbyServerBrowserOverlay", f220_arg2 )
	end
end

function OpenStore( f221_arg0, f221_arg1, f221_arg2, f221_arg3, f221_arg4 )
	if not DisableStore() then
		OpenOverlay( f221_arg4, "Store", f221_arg2 )
		local f221_local0 = LobbyData:GetCurrentMenuTarget()
		LUI.CoDMetrics.StoreEntry( f221_arg4, f221_arg2, f221_arg3, f221_local0 )
		local f221_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "StoreRoot" )
		Engine.SetModelValue( Engine.CreateModel( f221_local1, "actionSource", true ), f221_arg3 )
		Engine.SetModelValue( Engine.CreateModel( f221_local1, "storeSource", true ), f221_local0.name )
	end
end

function OpenSteamStore( f222_arg0, f222_arg1, f222_arg2, f222_arg3, f222_arg4 )
	if not DisableSteamStore() then
		Engine.SteamStore( f222_arg2 )
	end
end

function OpenFindLANGameFromPrompt( f223_arg0, f223_arg1 )
	OpenPopup( f223_arg0, "LobbyServerBrowserOverlay", f223_arg0:getOwner() )
end

function OpenScorestreaks( f224_arg0, f224_arg1, f224_arg2, f224_arg3, f224_arg4 )
	CoD.LobbyBase.OpenScorestreaks( f224_arg4, f224_arg2 )
end

function OpenEditCodcasterSettings( f225_arg0, f225_arg1, f225_arg2, f225_arg3, f225_arg4 )
	CoD.LobbyBase.OpenEditCodcasterSettings( f225_arg4, f225_arg2 )
end

function OpenTest( f226_arg0, f226_arg1, f226_arg2, f226_arg3, f226_arg4 )
	CoD.LobbyBase.OpenTest( f226_arg4, f226_arg2 )
end

function OpenBarracks( f227_arg0, f227_arg1, f227_arg2, f227_arg3, f227_arg4 )
	CoD.LobbyBase.OpenBarracks( f227_arg4, f227_arg2 )
end

function OpenGenders( f228_arg0, f228_arg1, f228_arg2 )
	CoD.LobbyBase.OpenGenders( f228_arg2, f228_arg1 )
end

function OpenQuit( f229_arg0, f229_arg1, f229_arg2, f229_arg3, f229_arg4 )
	CoD.LobbyBase.OpenQuit( f229_arg4, f229_arg2 )
end

function OpenFriends( f230_arg0, f230_arg1, f230_arg2, f230_arg3, f230_arg4 )
	
end

function OpenSocial( f231_arg0, f231_arg1, f231_arg2, f231_arg3, f231_arg4 )
	f231_arg4:openPopup( "Friends", f231_arg2 )
end

function OpenLANPlayers( f232_arg0, f232_arg1, f232_arg2, f232_arg3, f232_arg4 )
	
end

function OpenConnectingSpinner( f233_arg0, f233_arg1, f233_arg2 )
	CoD.OverlayUtility.CreateOverlay( f233_arg2, f233_arg0, "ConnectingToDemonware" )
end

function LobbyMapVoteSelectNext( f234_arg0, f234_arg1 )
	CoD.LobbyBase.LobbyMapVoteSelect( f234_arg0, f234_arg1, Enum.LobbyMapVote.LOBBY_MAPVOTE_NEXT )
end

function LobbyMapVoteSelectPrevious( f235_arg0, f235_arg1 )
	CoD.LobbyBase.LobbyMapVoteSelect( f235_arg0, f235_arg1, Enum.LobbyMapVote.LOBBY_MAPVOTE_PREVIOUS )
end

function LobbyMapVoteSelectRandom( f236_arg0, f236_arg1 )
	CoD.LobbyBase.LobbyMapVoteSelect( f236_arg0, f236_arg1, Enum.LobbyMapVote.LOBBY_MAPVOTE_RANDOM )
end

function ShowManagePartyPopup( f237_arg0, f237_arg1, f237_arg2, f237_arg3, f237_arg4 )
	CoD.perController[f237_arg3].Social_Party = f237_arg1
	CoD.perController[f237_arg3].Social_Party_Action = 0
	local f237_local0 = Engine.GetModel( Engine.GetGlobalModel(), "SocialMainMenu.managePartyButtonText" )
	if f237_local0 then
		if f237_arg4 == "PROMOTE" then
			CoD.perController[f237_arg3].Social_Party_Action = 1
			Engine.SetModelValue( f237_local0, Engine.Localize( "MENU_MANAGE_PARTY_PROMOTE_BUTTON" ) )
		elseif f237_arg4 == "KICK" then
			CoD.perController[f237_arg3].Social_Party_Action = 2
			Engine.SetModelValue( f237_local0, Engine.Localize( "MENU_MANAGE_PARTY_KICK_BUTTON" ) )
		else
			return 
		end
		SetState( f237_arg1, "Hidden" )
		OpenPopup( f237_arg0, "Social_Party_ManagePartyPopup", f237_arg3 )
	end
end

function ManagePartyAction( f238_arg0, f238_arg1, f238_arg2, f238_arg3 )
	local f238_local0 = Engine.GetModelValue( f238_arg2:getModel( f238_arg3, "xuid" ) )
	if CoD.perController[f238_arg3].Social_Party_Action == 1 then
		if Engine.StartPrivateLobbyMigrateTo then
			Engine.StartPrivateLobbyMigrateTo( f238_arg3, f238_local0 )
		end
		GoBackToMenu( GoBack( f238_arg1, f238_arg3 ), f238_arg3, "Lobby" )
	elseif CoD.perController[f238_arg3].Social_Party_Action == 2 and Engine.IsLeader( f238_arg3, Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		Engine.LobbyDisconnectClient( f238_arg3, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f238_local0, Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_KICK )
	end
end

function PromoteToLeader( f239_arg0, f239_arg1, f239_arg2, f239_arg3, f239_arg4 )
	Engine.GiveLeadership( f239_arg3.controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f239_arg3.xuid )
	f239_arg4:goBack( f239_arg2 )
end

function DisconnectClient( f240_arg0, f240_arg1, f240_arg2, f240_arg3, f240_arg4 )
	Engine.LobbyDisconnectClient( f240_arg3.controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f240_arg3.xuid, Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_KICK )
	f240_arg4:goBack( f240_arg2 )
end

function MutePlayer( f241_arg0, f241_arg1, f241_arg2, f241_arg3, f241_arg4 )
	if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f241_arg3.xuid ) then
		Engine.MutePlayer( f241_arg3.controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f241_arg3.xuid )
	end
	if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, f241_arg3.xuid ) then
		Engine.MutePlayer( f241_arg3.controller, Enum.LobbyType.LOBBY_TYPE_GAME, f241_arg3.xuid )
	end
	f241_arg4:goBack( f241_arg2 )
end

function UnMutePlayer( f242_arg0, f242_arg1, f242_arg2, f242_arg3, f242_arg4 )
	if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f242_arg3.xuid ) then
		Engine.UnMutePlayer( f242_arg3.controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f242_arg3.xuid )
	end
	if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, f242_arg3.xuid ) then
		Engine.UnMutePlayer( f242_arg3.controller, Enum.LobbyType.LOBBY_TYPE_GAME, f242_arg3.xuid )
	end
	f242_arg4:goBack( f242_arg2 )
end

function ShowSocialPartyWidget( f243_arg0 )
	if CoD.perController[f243_arg0].Social_Party then
		CoD.perController[f243_arg0].Social_Party:setState( "DefaultState" )
	end
end

function LobbyPartyPrivacy( f244_arg0, f244_arg1, f244_arg2, f244_arg3, f244_arg4 )
	local f244_local0 = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" ), "privacy" )
	local f244_local1 = Engine.GetModelValue( f244_local0 )
	local f244_local2 = 1
	if f244_arg3 == "left" then
		f244_local2 = -1
	elseif f244_arg3 == "right" then
		f244_local2 = 1
	end
	Engine.SetModelValue( f244_local0, (f244_local1 + f244_local2) % Enum.PartyPrivacy.PARTY_PRIVACY_COUNT )
end

function LobbyPartyPrivacyMaxPlayers( f245_arg0, f245_arg1, f245_arg2, f245_arg3, f245_arg4 )
	local f245_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f245_local1 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f245_local1 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	local f245_local2 = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" ), "maxPlayers" )
	local f245_local3 = Engine.GetModelValue( f245_local2 )
	local f245_local4 = 1
	if f245_arg3 == "left" then
		f245_local4 = -1
	elseif f245_arg3 == "right" then
		f245_local4 = 1
	end
	Engine.SetModelValue( f245_local2, math.min( math.max( f245_local1, f245_local3 + f245_local4 ), f245_local0.maxClients ) )
end

function LobbyPartyPrivacyMaxPlayersOnClientAdded( f246_arg0, f246_arg1 )
	local f246_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f246_local1 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f246_local1 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	local f246_local2 = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" ), "maxPlayers" )
	Engine.SetModelValue( f246_local2, math.min( math.max( f246_local1, Engine.GetModelValue( f246_local2 ) ), f246_local0.maxClients ) )
end

function LobbyPartyPrivacySave( f247_arg0, f247_arg1 )
	local f247_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f247_local0 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	local f247_local1 = Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" )
	local f247_local2 = Engine.GetModelValue( Engine.GetModel( f247_local1, "privacy" ) )
	local f247_local3 = Engine.GetModelValue( Engine.GetModel( f247_local1, "maxPlayers" ) )
	Engine.SetModelValue( Engine.GetModel( f247_local1, "privacyStatus" ), PartyPrivacy( f247_local2 ) )
	Engine.SetPartyPrivacy( f247_local2 )
	Engine.SetLobbyMaxClients( f247_local0, f247_local3 )
	Engine.SetProfileVar( f247_arg1, "party_privacyStatus", f247_local2 )
	Engine.SetProfileVar( f247_arg1, "party_maxplayers", f247_local3 )
	Engine.Exec( f247_arg1, "updategamerprofile" )
	GoBack( f247_arg0, f247_arg1 )
end

function LobbyPartyPrivacyAccept( f248_arg0, f248_arg1, f248_arg2 )
	local f248_local0 = f248_arg1.Slider.activeWidget
	local f248_local1 = f248_local0:getModel( f248_arg2, "action" )
	local f248_local2 = f248_local0:getModel( f248_arg2, "param" )
	local f248_local3, f248_local4 = nil
	if f248_local1 then
		f248_local3 = Engine.GetModelValue( f248_local1 )
		if f248_local2 then
			f248_local4 = Engine.GetModelValue( f248_local2 )
		end
	else
		f248_local3 = f248_local0.action
		f248_local4 = f248_local0.actionParam
	end
	if f248_local3 then
		f248_local3( f248_arg0, f248_local0, f248_arg2, f248_local4, f248_local0.gridInfoTable.parentGrid.menu )
	end
	Engine.Exec( f248_arg2, "updategamerprofile" )
end

function LobbyPartyPrivacyCancel( f249_arg0, f249_arg1, f249_arg2 )
	local f249_local0 = f249_arg1.Slider.activeWidget
	local f249_local1 = f249_local0:getModel( f249_arg2, "action" )
	local f249_local2 = f249_local0:getModel( f249_arg2, "param" )
	local f249_local3 = Engine.GetModelPath( f249_arg1 )
	f249_local3 = Engine.GetModelPath( f249_arg1.Slider )
	f249_local3 = Engine.GetModelPath( f249_arg1.Slider.activeWidget )
	local f249_local4, f249_local5, f249_local6 = nil
	if f249_local1 then
		f249_local4 = Engine.GetModelValue( f249_local1 )
		if f249_local2 then
			f249_local5 = Engine.GetModelValue( f249_local2 )
		end
	else
		f249_local4 = f249_local0.revertAction
		f249_local5 = f249_local0.actionParam
		f249_local6 = f249_arg1:getModel( f249_arg2, "currentSelection" )
	end
	if f249_local4 then
		f249_local4( f249_arg1, f249_local0, f249_arg2, f249_local5, f249_local0.gridInfoTable.parentGrid.menu )
	end
end

function LobbyTeamSelectionLB( f250_arg0, f250_arg1, f250_arg2 )
	local f250_local0 = nil
	local f250_local1 = f250_arg1:getModel( f250_arg2, "xuid" )
	if f250_local1 == nil then
		f250_local0 = Engine.GetXUID64( f250_arg2 )
	else
		f250_local0 = Engine.GetModelValue( f250_local1 )
	end
	if f250_local0 == nil then
		return 
	else
		CoD.LobbyBase.LobbyTeamSelection( f250_arg0, f250_arg2, 0, f250_local0 )
	end
end

function LobbyTeamSelectionRB( f251_arg0, f251_arg1, f251_arg2 )
	local f251_local0 = nil
	local f251_local1 = f251_arg1:getModel( f251_arg2, "xuid" )
	if f251_local1 == nil then
		f251_local0 = Engine.GetXUID64( f251_arg2 )
	else
		f251_local0 = Engine.GetModelValue( f251_local1 )
	end
	if f251_local0 == nil then
		return 
	else
		CoD.LobbyBase.LobbyTeamSelection( f251_arg0, f251_arg2, 1, f251_local0 )
	end
end

function LobbyLocalLaunchGame( f252_arg0, f252_arg1 )
	CoD.LobbyBase.LaunchGame( f252_arg0, f252_arg1, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function LobbyLANLaunchGame( f253_arg0, f253_arg1, f253_arg2 )
	Engine.SetDvar( "skipto", "" )
	Engine.SetDvar( "sv_saveGameSkipto", "" )
	CoD.LobbyBase.LaunchGame( f253_arg0, f253_arg2, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function LobbyLANServerBrowserSetMainModeFilter( f254_arg0, f254_arg1 )
	CoD.LobbyBase.LobbyLANServerBrowserSetMainModeFilter( f254_arg0, f254_arg1 )
end

function LobbyOnlinePublicLaunchGame_SelectionList( f255_arg0, f255_arg1, f255_arg2 )
	CoD.LobbyBase.LaunchGame( f255_arg0, f255_arg2, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function LobbyOnlinePublicLaunchGame( f256_arg0, f256_arg1 )
	CoD.LobbyBase.LaunchGame( f256_arg0, f256_arg1, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function SetTMode( f257_arg0, f257_arg1, f257_arg2 )
	local f257_local0 = f257_arg1:getModel()
	if f257_local0 then
		local f257_local1 = CoD.SafeGetModelValue( f257_local0, "itemIndex" )
		if f257_local1 then
			Engine.SetDvar( "r_tacScan_Layout", f257_local1 )
			CoD.perController[f257_arg2].startMenu_equippedIndex = f257_local1
			f257_arg0.selectionList:updateDataSource()
		end
	end
end

function LobbyOnlineCustomLaunchGame_SelectionList( f258_arg0, f258_arg1, f258_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "MapVote.timerActive" ), 1 )
	Engine.SetDvar( "skipto", "" )
	Engine.SetDvar( "sv_saveGameSkipto", "" )
	CoD.LobbyBase.LaunchGame( f258_arg0, f258_arg2, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function LobbyOnlineCustomLaunchGame( f259_arg0, f259_arg1 )
	CoD.LobbyBase.LaunchGame( f259_arg0, f259_arg1, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function OpenTheaterSelectFilm( f260_arg0, f260_arg1, f260_arg2, f260_arg3, f260_arg4 )
	CoD.FileshareUtility.SetCurrentCommunityDataType( Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_RECENT )
	CoD.FileshareUtility.SetIsCommunityMode( f260_arg2, false )
	CoD.FileshareUtility.SetCurrentUser( Engine.GetXUID64( f260_arg2 ) )
	CoD.FileshareUtility.SetDirty()
	CoD.LobbyBase.OpenTheaterSelectFilm( f260_arg4, f260_arg2 )
end

local f0_local1 = function ( f261_arg0, f261_arg1, f261_arg2, f261_arg3 )
	local f261_local0 = Engine.LobbyGetDemoInformation()
	if not f261_local0 then
		return 
	elseif f261_arg3 == nil then
		f261_arg3 = ""
	end
	if not Engine.IsMapValid( Dvar.ui_mapname:get() ) then
		LuaUtils.UI_ShowErrorMessageDialog( f261_arg2, "MENU_DLC_WARNING_MISSING_MAP_PACK_THEATER" )
		return 
	elseif f261_local0.mainMode ~= Enum.eModes.MODE_INVALID then
		Engine.SwitchMode( f261_arg2, Engine.GetAbbreviationForMode( f261_local0.mainMode ) )
	end
	CoD.LobbyBase.LaunchDemo( f261_arg0, f261_arg2, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function LobbyTheaterStartFilm( f262_arg0, f262_arg1, f262_arg2 )
	f0_local1( f262_arg0, f262_arg1, f262_arg2 )
end

function LobbyTheaterCreateHighlightReel( f263_arg0, f263_arg1, f263_arg2 )
	f0_local1( f263_arg0, f263_arg1, f263_arg2, "CreateHighlightReel" )
end

function LobbyTheaterShoutcastFilm( f264_arg0, f264_arg1, f264_arg2 )
	f0_local1( f264_arg0, f264_arg1, f264_arg2, "Shoutcast" )
end

function GoBackAndDisplayModalDialog( f265_arg0, f265_arg1, f265_arg2 )
	f265_arg2( GoBack( f265_arg0, f265_arg1 ), f265_arg1 )
end

function DisplayPlayGoJoinError( f266_arg0, f266_arg1 )
	f266_arg0:OpenModalDialog( f266_arg0, f266_arg1, "", "MENU_CANNOT_JOIN_DURING_INSTALL", {
		"MPUI_OK"
	}, function ( f267_arg0 )
		return true
	end )
end

function LobbyAcceptInvite( f268_arg0, f268_arg1, f268_arg2 )
	local f268_local0 = {
		controller = f268_arg1,
		xuid = f268_arg2.xuid,
		joinType = Enum.JoinType.JOIN_TYPE_INVITE
	}
	if CoD.LobbyBase.ChunkAnyDownloading() then
		DisplayPlayGoJoinError( f268_arg0, f268_arg1 )
		return 
	else
		Engine.LobbyVM_CallFunc( "Join", f268_local0 )
	end
end

local f0_local2 = function ( f269_arg0 )
	if f269_arg0 == Enum.PresenceActivity.PRESENCE_ACTIVITY_OFFLINE then
		return Enum.eModes.MODE_INVALID
	elseif Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY <= f269_arg0 and f269_arg0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_LAST then
		return Enum.eModes.MODE_INVALID
	elseif Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_FIRST <= f269_arg0 and f269_arg0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_LAST then
		return Enum.eModes.MODE_CAMPAIGN
	elseif Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_FIRST <= f269_arg0 and f269_arg0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_LAST then
		return Enum.eModes.MODE_MULTIPLAYER
	elseif Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_FIRST <= f269_arg0 and f269_arg0 <= Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_LAST then
		return Enum.eModes.MODE_ZOMBIES
	else
		
	end
end

function LobbyQuickJoin( f270_arg0, f270_arg1, f270_arg2, f270_arg3, f270_arg4 )
	if LobbyData.GetLobbyNav() == LobbyData.UITargets.UI_MODESELECT.id and IsFirstTimeSetup( f270_arg2, Enum.eModes.MODE_MULTIPLAYER ) then
		local f270_local0 = Engine.GetModel( f270_arg1:getModel(), "activity" )
		if f270_local0 and f0_local2( Engine.GetModelValue( f270_local0 ) ) == Enum.eModes.MODE_MULTIPLAYER then
			GoBackAndOpenOverlayOnParent( f270_arg0, "MPIntroRequired", f270_arg2 )
			return 
		end
	end
	local f270_local1 = false
	local f270_local0 = f270_arg1:getModel( f270_arg2, "joinable" )
	if not f270_local0 then
		f270_local0 = f270_arg1:getModel( f270_arg2, "isJoinable" )
	end
	if f270_local0 ~= nil then
		local f270_local2 = Engine.GetModelValue( f270_local0 )
		if f270_local2 ~= nil and (f270_local2 == Enum.LobbyJoinable.LOBBY_JOINABLE_YES or f270_local2 == Enum.LobbyJoinable.LOBBY_JOINABLE_YES_FRIENDS_ONLY) then
			f270_local1 = true
		end
	end
	if CoD.LobbyBase and CoD.LobbyBase.ChunkAnyDownloading() then
		f270_local1 = false
		GoBackAndDisplayModalDialog( f270_arg0, f270_arg2, DisplayPlayGoJoinError )
	end
	if not f270_local1 then
		return 
	end
	f270_local0 = f270_arg1:getModel( f270_arg2, "xuid" )
	if f270_local0 == nil then
		return 
	end
	local f270_local2 = Engine.GetModelValue( f270_local0 )
	if f270_local2 == nil then
		return 
	end
	local f270_local3 = nil
	if f270_arg3 ~= nil and f270_arg3 >= 0 and f270_arg3 < Enum.JoinType.JOIN_TYPE_COUNT then
		f270_local3 = f270_arg3
	else
		f270_local3 = Enum.JoinType.JOIN_TYPE_NORMAL
	end
	local f270_local4 = {
		controller = f270_arg2,
		xuid = f270_local2,
		joinType = f270_local3,
		platform = false
	}
	if f270_arg4 ~= nil and f270_arg4 == true then
		GoBack( f270_arg0, f270_arg2 )
	end
	if Engine.IsInGame() then
		if not Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, f270_local4.xuid ) then
			f270_local4.migrating = not CoD.QuitGame( f270_arg2 )
			Engine.LobbyVM_CallFunc( "InGameJoin", f270_local4 )
		end
	else
		Engine.LobbyVM_CallFunc( "Join", f270_local4 )
	end
end

function LobbyJoinFromFriendsMenu( f271_arg0, f271_arg1, f271_arg2 )
	local f271_local0 = Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f271_arg2 ), "friends" ), "tab" ) )
	local f271_local1 = nil
	if f271_local0 == "friends" then
		f271_local1 = Enum.JoinType.JOIN_TYPE_FRIEND
	elseif f271_local0 == "recent" then
		f271_local1 = Enum.JoinType.JOIN_TYPE_NORMAL
	elseif f271_local0 == "groups" then
		f271_local1 = Enum.JoinType.JOIN_TYPE_FRIEND
	elseif f271_local0 == "inbox" then
		f271_local1 = Enum.JoinType.JOIN_TYPE_INVITE
	else
		f271_local1 = Enum.JoinType.JOIN_TYPE_NORMAL
	end
	LobbyQuickJoin( f271_arg0, f271_arg1, f271_arg2, f271_local1, true )
end

function LobbyInviteFriend( f272_arg0, f272_arg1, f272_arg2, f272_arg3 )
	local f272_local0, f272_local1 = nil
	if f272_arg3 then
		f272_local0 = f272_arg3.xuid
		f272_local1 = f272_arg3.gamertag
	else
		f272_local0 = Engine.GetModelValue( f272_arg1:getModel( f272_arg2, "xuid" ) )
		f272_local1 = Engine.GetModelValue( f272_arg1:getModel( f272_arg2, "gamertag" ) )
	end
	if f272_local0 ~= nil then
		if CoD.isPC == true then
			CoD.invitePlayer( f272_arg2, f272_local0 )
		else
			CoD.invitePlayerByGamertag( f272_arg2, f272_local0, f272_local1 )
		end
	end
end

function LobbyInviteFriendGoBack( f273_arg0, f273_arg1, f273_arg2, f273_arg3 )
	LobbyInviteFriend( f273_arg0, f273_arg1, f273_arg2, f273_arg3 )
	GoBack( f273_arg0, f273_arg2 )
end

function OnLoadToggleDebug( f274_arg0, f274_arg1 )
	if Dvar.ui_lobbyDebugVis:get() then
		f274_arg0.btnToggleDebug.buttoninternal0.Text0:setText( Engine.Localize( "ON" ) )
	else
		f274_arg0.btnToggleDebug.buttoninternal0.Text0:setText( Engine.Localize( "OFF" ) )
	end
end

function LobbyToggleDebug( f275_arg0, f275_arg1 )
	Dvar.ui_lobbyDebugVis:set( not Dvar.ui_lobbyDebugVis:get() )
	if Dvar.ui_lobbyDebugVis:get() then
		f275_arg0.btnToggleDebug.buttoninternal0.Text0:setText( Engine.Localize( "ON" ) )
	else
		f275_arg0.btnToggleDebug.buttoninternal0.Text0:setText( Engine.Localize( "OFF" ) )
	end
end

function LobbyToggleMsgLevel( f276_arg0, f276_arg1 )
	local f276_local0 = Dvar.ui_lobbyDebugMsgLevel:get() + 1
	if f276_local0 > 2 then
		f276_local0 = 0
	end
	Dvar.ui_lobbyDebugMsgLevel:set( f276_local0 )
	if f276_local0 == 0 then
		f276_arg0.btnToggleMsgLevel.buttoninternal0.Text0:setText( "PAUSED" )
	elseif f276_local0 == 1 then
		f276_arg0.btnToggleMsgLevel.buttoninternal0.Text0:setText( "LIMITED" )
	else
		f276_arg0.btnToggleMsgLevel.buttoninternal0.Text0:setText( "ALL" )
	end
end

function Lobby_SetMaxLocalPlayers( f277_arg0 )
	local f277_local0 = f277_arg0
	local f277_local1 = Engine.GetMaxLocalControllers()
	if f277_local1 < f277_local0 then
		f277_local0 = f277_local1
	end
	Dvar.lobby_maxLocalPlayers:set( f277_local0 )
end

function LobbyAddLocalClient( f278_arg0, f278_arg1 )
	if Dvar.ui_execdemo_beta:get() then
		return 
	elseif IsTu1Build() == true and Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		return 
	elseif CoD.isPS4 and Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		if Engine.DisplayNpAvailabilityErrors( f278_arg1 ) then
			return 
		elseif not Engine.DisplayUpsellAndContentWarnings( f278_arg1 ) then
			return 
		end
	end
	if not CoD.isPC and Engine.IsUserGuest( f278_arg1 ) then
		LuaUtils.UI_ShowErrorMessageDialog( f278_arg1, "MENU_GUEST_CONTENT_RESTRICTED" )
		return 
	end
	local f278_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f278_local0 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if Engine.GetLobbyLocalClientCount( f278_local0 ) < Dvar.lobby_maxLocalPlayers:get() then
		local f278_local1 = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" ) )
		local f278_local2 = -1
		if f278_local1 == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
			f278_local2 = LuaEnums.FEATURE_BAN.MP_SPLIT_SCREEN
		elseif f278_local1 == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
			f278_local2 = LuaEnums.FEATURE_BAN.ZM_SPLIT_SCREEN
		elseif f278_local1 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
			f278_local2 = LuaEnums.FEATURE_BAN.CP_SPLIT_SCREEN
		end
		if f278_local2 >= 0 then
			for f278_local3 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
				if CheckIfFeatureIsBanned( f278_local3, f278_local2 ) then
					LuaUtils.UI_ShowErrorMessageDialog( f278_arg1, GetFeatureBanInfo( f278_local3, f278_local2 ) )
					return 
				end
			end
		end
		CoD.LobbyBase.UnusedGamepadButton( f278_arg0, f278_arg1 )
		if Engine.GetLobbyLocalClientCount( f278_local0 ) == 2 then
			Engine.ExecNow( nil, "canceldemonwareconnect" )
			LuaUtils.UI_ShowWarningMessageDialog( f278_arg1, "MENU_RESTRICTED_TO_LOCAL_GAMES" )
		end
		local f278_local3 = Engine.DvarInt( nil, "bot_maxAllies" )
		local f278_local4 = Engine.DvarInt( nil, "bot_maxAxis" )
		local f278_local5 = CoD.GameSettingsUtility.MaxSplitscreenBots
		if f278_local5 < f278_local3 + f278_local4 then
			Engine.SetDvar( "bot_maxAllies", f278_local5 / 2 )
			Engine.SetDvar( "bot_maxAxis", f278_local5 / 2 )
		end
		ForceLobbyButtonUpdate( f278_arg1 )
	end
end

function LobbyRemoveLocalClientFromLobby( f279_arg0, f279_arg1 )
	local f279_local0 = Engine.GetPrimaryController()
	if not Engine.IsControllerBeingUsed( f279_arg1 ) or f279_arg1 == f279_local0 then
		return 
	end
	CoD.LobbyBase.RemoveLocalPlayerFromTheLobby( f279_arg0, f279_arg1 )
	ForceLobbyButtonUpdate( f279_arg1 )
	if CoD.isPC and Engine.GamepadsConnectedIsActive( f279_local0 ) == false then
		CoD.PCUtil.GamepadsMapped( f279_local0 )
	end
end

function LobbySplitscreenToggle( f280_arg0, f280_arg1 )
	local f280_local0 = 1
	if Engine.IsControllerBeingUsed( f280_local0 ) == true then
		LobbyRemoveLocalClientFromLobby( f280_arg0, f280_local0 )
	elseif Engine.GamepadsConnectedIsActive( f280_local0 ) == true then
		LobbyAddLocalClient( f280_arg0, f280_local0 )
	elseif CoD.PCUtil.GamepadsMapped( f280_local0 ) then
		if f280_arg0.login_splitscreen_player_timer then
			f280_arg0.login_splitscreen_player_timer:close()
			f280_arg0.login_splitscreen_player_timer = nil
		end
		f280_arg0.login_splitscreen_player_count = 0
		f280_arg0.login_splitscreen_player_timer = LUI.UITimer.newElementTimer( 500, false, function ()
			if Engine.AreLocalFilesReady( f280_local0 ) == true then
				LobbyAddLocalClient( f280_arg0, f280_local0 )
				f280_arg0.login_splitscreen_player_timer:close()
				f280_arg0.login_splitscreen_player_timer = nil
			end
			if f280_arg0.login_splitscreen_player_count and f280_arg0.login_splitscreen_player_count > 5 then
				f280_arg0.login_splitscreen_player_timer:close()
				f280_arg0.login_splitscreen_player_timer = nil
			end
		end )
		f280_arg0:addElement( f280_arg0.login_splitscreen_player_timer )
	end
end

function GroupChangePrivacy( f282_arg0, f282_arg1, f282_arg2 )
	local f282_local0 = Engine.GetModelValue( f282_arg1:getModel( f282_arg2, "value" ) )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f282_arg2 ), "groups.createGroup.privacy" ), f282_local0 )
	if f282_local0 == Enum.GroupPrivacy.GROUP_PRIVACY_PUBLIC then
		GroupChangeSetTooltip( f282_arg0, f282_arg2, "PUBLIC" )
	elseif f282_local0 == Enum.GroupPrivacy.GROUP_PRIVACY_PRIVATE then
		GroupChangeSetTooltip( f282_arg0, f282_arg2, "PRIVATE" )
	end
end

function GroupChangeSetTooltip( f283_arg0, f283_arg1, f283_arg2 )
	local f283_local0 = Engine.GetModel( Engine.GetModelForController( f283_arg1 ), "groups.createGroup.tooltip_title" )
	local f283_local1 = Engine.GetModel( Engine.GetModelForController( f283_arg1 ), "groups.createGroup.tooltip_description" )
	Engine.SetModelValue( f283_local0, Engine.LocalizeWithoutLocsMarkers( "GROUPS_CREATE_" .. f283_arg2 .. "_DESC_TITLE" ) )
	Engine.SetModelValue( f283_local1, Engine.LocalizeWithoutLocsMarkers( "GROUPS_CREATE_" .. f283_arg2 .. "_DESC" ) )
end

function GroupToggleFriendInvite( f284_arg0, f284_arg1, f284_arg2 )
	if f284_arg1 ~= nil then
		local f284_local0 = f284_arg1:getParent()
		f284_local0 = f284_local0:getParent()
		local f284_local1 = f284_arg1:getModel( f284_arg2, "selected" )
		local f284_local2 = Engine.GetModel( Engine.GetModelForController( f284_arg2 ), "groups.createGroup.friends_invited_count" )
		local f284_local3 = Engine.GetModelValue( f284_local2 )
		if f284_local1 ~= nil then
			local f284_local4 = Engine.GetModelValue( f284_local1 )
			Engine.SetModelValue( f284_local1, not f284_local4 )
			if f284_local4 then
				Engine.SetModelValue( f284_local2, f284_local3 - 1 )
			else
				Engine.SetModelValue( f284_local2, f284_local3 + 1 )
			end
		end
	end
end

function GroupToggleAllFriendInvites( f285_arg0, f285_arg1, f285_arg2 )
	
end

function GroupEmblemSelect_Open( f286_arg0, f286_arg1, f286_arg2, f286_arg3 )
	if CoD.CraftUtility.Emblems.ParseDDL( f286_arg2, Enum.StorageFileType.STORAGE_EMBLEMS ) then
		f286_arg3:openOverlay( "GroupEmblemSelect", f286_arg2 )
	end
end

function GroupEmblemSelect_Back( f287_arg0, f287_arg1, f287_arg2, f287_arg3 )
	CoD.perController[f287_arg2].isGroupEmblemSelect = false
end

function GroupEmblemSelect_SetAsEmblem( f288_arg0, f288_arg1, f288_arg2 )
	Engine.SetGroupEmblem( f288_arg2 )
end

function SetState( f289_arg0, f289_arg1 )
	f289_arg0:setState( f289_arg1 )
end

function PulseElementToStateAndBack( f290_arg0, f290_arg1 )
	local f290_local0 = f290_arg0.currentState
	f290_arg0:setState( f290_arg1 )
	f290_arg0:setState( f290_local0 )
end

function SetMenuState( f291_arg0, f291_arg1 )
	f291_arg0:setState( f291_arg1 )
end

function SetElementState( f292_arg0, f292_arg1, f292_arg2, f292_arg3 )
	f292_arg1:setState( f292_arg3 )
end

function SetElementStateByElementName( f293_arg0, f293_arg1, f293_arg2, f293_arg3 )
	if f293_arg0[f293_arg1] then
		f293_arg0[f293_arg1]:setState( f293_arg3 )
	end
end

function SetElementDataSource( f294_arg0, f294_arg1, f294_arg2 )
	if f294_arg0[f294_arg1] then
		f294_arg0[f294_arg1]:setDataSource( f294_arg2 )
	end
end

function LockInput( f295_arg0, f295_arg1, f295_arg2 )
	if f295_arg2 ~= nil then
		Engine.LockInput( f295_arg1, f295_arg2 )
	end
end

function PrepareOpenMenuInSafehouse( f296_arg0 )
	if not CoD.isSafehouse then
		return 
	else
		CoD.perController[f296_arg0].inSafehouseMenu = true
		Engine.LockInput( f296_arg0, true )
		Engine.SetUIActive( f296_arg0, true )
	end
end

function PrepareCloseMenuInSafehouse( f297_arg0 )
	if not CoD.isSafehouse then
		return 
	else
		CoD.perController[f297_arg0].inSafehouseMenu = nil
		Engine.LockInput( f297_arg0, false )
		Engine.SetUIActive( f297_arg0, false )
	end
end

function SetupAutoHorizontalAlignArabicText( f298_arg0 )
	local f298_local0 = f298_arg0.setAlignment
	f298_arg0.setAlignment = function ( f299_arg0, f299_arg1 )
		if IsCurrentLanguageReversed() then
			if f299_arg1 & Enum.LUIAlignment.LUI_ALIGNMENT_LEFT ~= 0 then
				f299_arg1 = f299_arg1 & Enum.LUIAlignment.LUI_ALIGNMENT_VERTICAL_MASK | Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT
			elseif f299_arg1 & Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT ~= 0 then
				f299_arg1 = f299_arg1 & Enum.LUIAlignment.LUI_ALIGNMENT_VERTICAL_MASK | Enum.LUIAlignment.LUI_ALIGNMENT_LEFT
			end
		end
		f298_local0( f299_arg0, f299_arg1 )
	end
	
	local f298_local1
	if f298_arg0.getAlignment then
		f298_local1 = f298_arg0:getAlignment()
		if not f298_local1 then
		
		else
			f298_arg0:setAlignment( f298_local1 )
		end
	end
	f298_local1 = Enum.LUIAlignment.LUI_ALIGNMENT_LEFT
end

function ScaleWidgetToLabelCentered( f300_arg0, f300_arg1, f300_arg2 )
	if f300_arg1 == nil then
		return 
	else
		local f300_local0, f300_local1, f300_local2, f300_local3 = f300_arg0:getLocalLeftRight()
		local f300_local4, f300_local5, f300_local6, f300_local7 = f300_arg1:getLocalLeftRight()
		local f300_local8 = f300_arg1:getTextWidth()
		local f300_local9 = (f300_local3 + f300_local2) / 2
		local f300_local10 = f300_local8 + f300_arg2 * 2
		f300_arg0:setLeftRight( f300_local0, f300_local1, f300_local9 - f300_local10 / 2, f300_local9 + f300_local10 / 2 )
	end
end

function ScaleWidgetToLargerLabelCentered( f301_arg0, f301_arg1, f301_arg2, f301_arg3 )
	if f301_arg1 == nil or f301_arg2 == nil then
		return 
	else
		local f301_local0, f301_local1, f301_local2, f301_local3 = f301_arg0:getLocalLeftRight()
		local f301_local4 = math.max( f301_arg1:getTextWidth(), f301_arg2:getTextWidth() )
		local f301_local5 = (f301_local3 + f301_local2) / 2
		local f301_local6 = f301_local4 + f301_arg3 * 2
		f301_arg0:setLeftRight( f301_local0, f301_local1, f301_local5 - f301_local6 / 2, f301_local5 + f301_local6 / 2 )
	end
end

function ScaleWidgetToLabelCenteredWithMinimum( f302_arg0, f302_arg1, f302_arg2, f302_arg3 )
	if f302_arg1 == nil then
		return 
	else
		local f302_local0, f302_local1, f302_local2, f302_local3 = f302_arg0:getLocalLeftRight()
		local f302_local4 = f302_arg1:getTextWidth()
		local f302_local5 = (f302_local3 + f302_local2) / 2
		local f302_local6 = math.max( f302_local4 + f302_arg2 * 2, f302_arg3 )
		f302_arg0:setLeftRight( f302_local0, f302_local1, f302_local5 - f302_local6 / 2, f302_local5 + f302_local6 / 2 )
	end
end

function ScaleWidgetToLabelCenteredWrapped( f303_arg0, f303_arg1, f303_arg2, f303_arg3 )
	if f303_arg1 == nil then
		return 
	end
	local f303_local0, f303_local1, f303_local2, f303_local3 = f303_arg0:getLocalLeftRight()
	local f303_local4, f303_local5, f303_local6, f303_local7 = f303_arg1:getLocalLeftRight()
	if not f303_arg0._originalWidth then
		f303_arg0._originalWidth = f303_local7 - f303_local6
	end
	local f303_local8, f303_local9 = f303_arg1:getTextWidthAndHeight( f303_arg0._originalWidth )
	local f303_local10 = (f303_local3 + f303_local2) / 2
	local f303_local11 = f303_local8 + f303_arg2 * 2
	f303_arg0:setLeftRight( f303_local0, f303_local1, f303_local10 - f303_local11 / 2, f303_local10 + f303_local11 / 2 )
	local f303_local12, f303_local13, f303_local14, f303_local15 = f303_arg0:getLocalTopBottom()
	f303_arg0:setTopBottom( f303_local12, f303_local13, f303_local14, f303_local9 + f303_local14 + f303_arg3 )
end

function ScaleWidgetToLabelCore( f304_arg0, f304_arg1, f304_arg2, f304_arg3 )
	if f304_arg1 == nil then
		return 
	end
	local f304_local0, f304_local1, f304_local2, f304_local3 = f304_arg0:getLocalLeftRight()
	local f304_local4 = f304_arg1:getTextWidth()
	if Engine.IsCurrentLanguageReversed() and f304_arg3 then
		if f304_local4 > 0 then
			local f304_local5, f304_local6, f304_local7, f304_local8 = f304_arg1:getLocalLeftRight()
			f304_arg0.savedWidth = f304_local4 + 2 * f304_local7 + f304_arg2
			if not f304_arg0.widthOverridden then
				f304_arg0:setLeftRight( f304_local0, f304_local1, f304_local3 - f304_arg0.savedWidth, f304_local3 )
				if f304_local5 + f304_local6 == 0 then
					f304_arg1:setLeftRight( f304_local5, f304_local6, f304_local7, f304_local7 + f304_local4 )
				elseif f304_local5 == 0 and f304_local6 == 1 then
					f304_arg1:setLeftRight( f304_local5, f304_local6, f304_local7, f304_local8 )
				end
			end
		else
			f304_arg0:setLeftRight( f304_local0, f304_local1, f304_local3, f304_local3 )
		end
		return 
	end
	local f304_local5, f304_local6, f304_local7, f304_local8 = f304_arg1:getLocalLeftRight()
	if f304_local4 > 0 then
		f304_arg0.savedWidth = f304_local4 + 2 * f304_local7 + f304_arg2
		if not f304_arg0.widthOverridden then
			f304_arg0:setLeftRight( f304_local0, f304_local1, f304_local2, f304_local2 + f304_arg0.savedWidth )
		end
	else
		f304_arg0:setLeftRight( f304_local0, f304_local1, f304_local2, f304_local2 )
	end
end

function SetStateFromText( f305_arg0, f305_arg1, f305_arg2, f305_arg3 )
	local f305_local0 = f305_arg3
	if f305_arg1 and f305_arg1:getTextWidth() ~= 0 then
		f305_local0 = f305_arg2
	end
	f305_arg0:setState( f305_local0 )
end

function ScaleWidgetToLabel( f306_arg0, f306_arg1, f306_arg2 )
	ScaleWidgetToLabelCore( f306_arg0, f306_arg1, f306_arg2, true )
end

function ScaleWidgetToLabelLeftJustify( f307_arg0, f307_arg1, f307_arg2 )
	ScaleWidgetToLabelCore( f307_arg0, f307_arg1, f307_arg2, false )
end

function ScaleWidgetToLabelWrapped( f308_arg0, f308_arg1, f308_arg2, f308_arg3 )
	if f308_arg1 == nil then
		return 
	end
	local f308_local0, f308_local1, f308_local2, f308_local3 = f308_arg0:getLocalLeftRight()
	local f308_local4, f308_local5, f308_local6, f308_local7 = f308_arg1:getLocalLeftRight()
	if not f308_arg0._originalWidth then
		f308_arg0._originalWidth = f308_local3 - f308_local2
	end
	if not Engine.IsCurrentLanguageReversed() then
		f308_arg1:setLeftRight( true, false, f308_local6, f308_local6 + f308_arg0._originalWidth )
	end
	local f308_local8, f308_local9 = f308_arg1:getTextWidthAndHeight( f308_arg0._originalWidth )
	if Engine.IsCurrentLanguageReversed() then
		if f308_local8 > 0 then
			if f308_arg0._originalWidth < f308_local8 + 2 * f308_local6 + f308_arg2 then
				f308_local8 = f308_arg0._originalWidth - 2 * f308_local6 - f308_arg2
			end
			f308_arg0:setLeftRight( f308_local0, f308_local1, f308_local3 - f308_local8 - f308_local6 - f308_arg2, f308_local3 )
			if f308_local4 + f308_local5 == 0 then
				f308_arg1:setLeftRight( f308_local4, f308_local5, f308_local6, f308_local6 + f308_local8 )
			end
		else
			f308_arg0:setLeftRight( f308_local0, f308_local1, f308_local3, f308_local3 )
		end
	else
		if f308_arg0._originalWidth < f308_local8 then
			f308_local8 = f308_arg0._originalWidth
		end
		if f308_local8 > 0 then
			f308_arg0.savedWidth = f308_local8 + 2 * f308_local6 + f308_arg2
			f308_arg0:setLeftRight( f308_local0, f308_local1, f308_local2, f308_local2 + f308_arg0.savedWidth )
		else
			f308_arg0:setLeftRight( f308_local0, f308_local1, f308_local2, f308_local2 )
		end
	end
	local f308_local10, f308_local11, f308_local12, f308_local13 = f308_arg0:getLocalTopBottom()
	f308_arg0:setTopBottom( f308_local10, f308_local11, f308_local12, f308_local12 + f308_local9 + f308_arg3 )
end

function ScaleWidgetToLabelWrappedUp( f309_arg0, f309_arg1, f309_arg2, f309_arg3 )
	if f309_arg1 == nil then
		return 
	end
	local f309_local0, f309_local1, f309_local2, f309_local3 = f309_arg0:getLocalLeftRight()
	local f309_local4, f309_local5, f309_local6, f309_local7 = f309_arg1:getLocalLeftRight()
	if not f309_arg0._originalWidth then
		f309_arg0._originalWidth = f309_local3 - f309_local2
	end
	if not Engine.IsCurrentLanguageReversed() then
		f309_arg1:setLeftRight( true, false, f309_local6, f309_local6 + f309_arg0._originalWidth )
	end
	local f309_local8, f309_local9 = f309_arg1:getTextWidthAndHeight( f309_arg0._originalWidth )
	if Engine.IsCurrentLanguageReversed() then
		if f309_local8 > 0 then
			if f309_arg0._originalWidth < f309_local8 then
				f309_arg0:setLeftRight( f309_local0, f309_local1, f309_local3 - f309_arg0._originalWidth, f309_local3 )
			else
				f309_arg0.savedWidth = f309_local8 + 2 * f309_local6 + f309_arg2
				f309_arg0:setLeftRight( f309_local0, f309_local1, f309_local3 - f309_arg0.savedWidth, f309_local3 )
				if f309_local4 + f309_local5 == 0 then
					f309_arg1:setLeftRight( f309_local4, f309_local5, f309_local6, f309_local6 + f309_local8 )
				end
			end
		else
			f309_arg0:setLeftRight( f309_local0, f309_local1, f309_local3, f309_local3 )
		end
		return 
	elseif f309_arg0._originalWidth < f309_local8 then
		f309_arg0:setLeftRight( f309_local0, f309_local1, f309_local2, f309_local2 + f309_arg0._originalWidth )
	elseif f309_local8 > 0 then
		f309_arg0.savedWidth = f309_local8 + 2 * f309_local6 + f309_arg2
		f309_arg0:setLeftRight( f309_local0, f309_local1, f309_local2, f309_local2 + f309_arg0.savedWidth )
	else
		f309_arg0:setLeftRight( f309_local0, f309_local1, f309_local2, f309_local2 )
	end
	local f309_local10, f309_local11, f309_local12, f309_local13 = f309_arg0:getLocalTopBottom()
	f309_arg0:setTopBottom( f309_local10, f309_local11, f309_local13 - f309_local9 - f309_arg3, f309_local13 )
end

function ScaleWidgetToLabelWrappedLeftAlign( f310_arg0, f310_arg1, f310_arg2, f310_arg3 )
	if not f310_arg1 then
		return 
	end
	local f310_local0, f310_local1, f310_local2, f310_local3 = f310_arg0:getLocalLeftRight()
	local f310_local4, f310_local5, f310_local6, f310_local7 = f310_arg1:getLocalLeftRight()
	if not f310_arg0._originalWidth then
		f310_arg0._originalWidth = f310_local3 - f310_local2
	end
	local f310_local8, f310_local9 = f310_arg1:getTextWidthAndHeight()
	if f310_arg0._originalWidth < f310_local8 or Engine.IsCurrentLanguageReversed() then
		f310_local8 = f310_arg0._originalWidth
	end
	if f310_local8 > 0 then
		f310_arg0.savedWidth = f310_local8 + 2 * f310_local6 + f310_arg2
		f310_arg0:setLeftRight( true, false, 0, f310_arg0.savedWidth )
	else
		f310_arg0:setLeftRight( f310_local0, f310_local1, f310_local2, f310_local2 )
	end
	local f310_local10, f310_local11, f310_local12, f310_local13 = f310_arg0:getLocalTopBottom()
	f310_arg0:setTopBottom( f310_local10, f310_local11, f310_local12, f310_local9 + f310_local12 + f310_arg3 )
end

function ScaleWidgetToLabelWrappedCenterAlign( f311_arg0, f311_arg1, f311_arg2, f311_arg3 )
	if not f311_arg1 then
		return 
	end
	local f311_local0, f311_local1, f311_local2, f311_local3 = f311_arg0:getLocalLeftRight()
	local f311_local4, f311_local5, f311_local6, f311_local7 = f311_arg1:getLocalLeftRight()
	if not f311_arg0._originalWidth then
		f311_arg0._originalWidth = f311_local3 - f311_local2
	end
	local f311_local8, f311_local9 = f311_arg1:getTextWidthAndHeight( f311_arg0._originalWidth )
	if f311_arg0._originalWidth < f311_local8 then
		f311_local8 = f311_arg0._originalWidth
	end
	if f311_local8 > 0 then
		f311_arg0.savedWidth = f311_local8 + 2 * f311_local6 + f311_arg2
		f311_arg0:setLeftRight( false, false, -f311_arg0.savedWidth / 2, f311_arg0.savedWidth / 2 )
	else
		f311_arg0:setLeftRight( f311_local0, f311_local1, f311_local2, f311_local2 )
	end
	local f311_local10, f311_local11, f311_local12, f311_local13 = f311_arg0:getLocalTopBottom()
	f311_arg0:setTopBottom( f311_local10, f311_local11, f311_local12, f311_local9 + f311_local12 + f311_arg3 )
end

function ScaleWidgetToLabelWrappedRightAlign( f312_arg0, f312_arg1, f312_arg2, f312_arg3 )
	if not f312_arg1 then
		return 
	end
	local f312_local0, f312_local1, f312_local2, f312_local3 = f312_arg0:getLocalLeftRight()
	local f312_local4, f312_local5, f312_local6, f312_local7 = f312_arg1:getLocalLeftRight()
	if not f312_arg0._originalWidth then
		f312_arg0._originalWidth = f312_local3 - f312_local2
	end
	local f312_local8, f312_local9 = f312_arg1:getTextWidthAndHeight( f312_arg0._originalWidth )
	if f312_arg0._originalWidth < f312_local8 then
		f312_local8 = f312_arg0._originalWidth
	end
	if f312_local8 > 0 then
		f312_arg0.savedWidth = f312_local8 + 2 * f312_local6 + f312_arg2
		f312_arg0:setLeftRight( false, true, -f312_arg0.savedWidth, 0 )
	else
		f312_arg0:setLeftRight( f312_local0, f312_local1, f312_local2, f312_local2 )
	end
	local f312_local10, f312_local11, f312_local12, f312_local13 = f312_arg0:getLocalTopBottom()
	f312_arg0:setTopBottom( f312_local10, f312_local11, f312_local12, f312_local9 + f312_local12 + f312_arg3 )
end

function UpdateWidgetHeightToMultilineText( f313_arg0, f313_arg1, f313_arg2 )
	local f313_local0, f313_local1 = f313_arg1:getTextWidthAndHeight()
	f313_arg0:setHeight( f313_local1 + f313_arg2 * 2 )
end

function UpdateWidgetHeightToMultilineTextWithMinimum( f314_arg0, f314_arg1, f314_arg2, f314_arg3 )
	local f314_local0, f314_local1 = f314_arg1:getTextWidthAndHeight()
	f314_arg0:setHeight( math.max( f314_local1 + f314_arg2 * 2, f314_arg3 ) )
end

function OverrideWidgetWidth( f315_arg0, f315_arg1 )
	local f315_local0, f315_local1, f315_local2, f315_local3 = f315_arg0:getLocalLeftRight()
	f315_arg0.savedWidth = f315_local3 - f315_local2
	f315_arg0.widthOverridden = true
	if f315_local1 == 0.5 and f315_local0 == 0.5 then
		f315_arg0.savedCenter = (f315_local2 + f315_local3) / 2
		f315_arg0:setLeftRight( f315_local0, f315_local1, f315_arg0.savedCenter - f315_arg1 / 2, f315_arg0.savedCenter + f315_arg1 / 2 )
	else
		f315_arg0.savedCenter = nil
		f315_arg0:setLeftRight( f315_local0, f315_local1, f315_local2, f315_local2 + f315_arg1 )
	end
	local f315_local4 = f315_arg0:getParent()
	if f315_local4 then
		f315_local4:setLayoutCached( false )
	end
end

function RestoreWidgetWidth( f316_arg0 )
	if f316_arg0.savedWidth == nil then
		return 
	end
	f316_arg0.widthOverridden = nil
	local f316_local0, f316_local1, f316_local2, f316_local3 = f316_arg0:getLocalLeftRight()
	if f316_arg0.savedCenter == nil then
		f316_arg0:setLeftRight( f316_local0, f316_local1, f316_local2, f316_local2 + f316_arg0.savedWidth )
	else
		f316_arg0:setLeftRight( f316_local0, f316_local1, f316_arg0.savedCenter - f316_arg0.savedWidth / 2, f316_arg0.savedCenter + f316_arg0.savedWidth / 2 )
	end
end

function SetWidth( f317_arg0, f317_arg1 )
	f317_arg0.savedWidth = f317_arg0:getWidth()
	f317_arg0:setWidth( f317_arg1 )
end

function ScaleToElementWidth( f318_arg0, f318_arg1 )
	local f318_local0, f318_local1, f318_local2, f318_local3 = f318_arg1:getLocalLeftRight()
	f318_arg0:setWidth( f318_local3 - f318_local2 )
end

function TrimLabelIfLanguageReversed( f319_arg0, f319_arg1 )
	if Engine.IsCurrentLanguageReversed() then
		if f319_arg1 == nil then
			return 
		else
			local f319_local0, f319_local1, f319_local2, f319_local3 = f319_arg1:getLocalLeftRight()
			f319_arg1:setLeftRight( f319_local0, f319_local1, f319_local2, f319_local2 + f319_arg1:getTextWidth() + 2 )
			return 
		end
	else
		
	end
end

function ScaleParentWidgetToLabel( f320_arg0, f320_arg1, f320_arg2 )
	local f320_local0 = f320_arg0 and f320_arg0:getParent()
	if f320_arg1 == nil or f320_local0 == nil then
		return 
	elseif f320_local0._originalWidth == nil then
		local f320_local1, f320_local2, f320_local3, f320_local4 = f320_local0:getLocalLeftRight()
		f320_local0._originalWidth = f320_local4 - f320_local3
	end
	if Engine.IsCurrentLanguageReversed() then
		local f320_local1, f320_local2, f320_local3, f320_local4 = f320_arg0:getLocalLeftRight()
		local f320_local5, f320_local6, f320_local7, f320_local8 = f320_local0:getLocalLeftRight()
		local f320_local9, f320_local10, f320_local11, f320_local12 = f320_arg1:getLocalLeftRight()
		local f320_local13 = f320_arg1:getTextWidth()
		f320_local0:setLeftRight( f320_local5, f320_local6, f320_local8 - f320_local13 - 2 * (f320_local3 + f320_local11) - f320_arg2, f320_local8 )
		if f320_local9 + f320_local10 == 0 then
			f320_arg1:setLeftRight( f320_local9, f320_local10, f320_local11, f320_local11 + f320_local13 + 2 )
		end
		return 
	end
	local f320_local1, f320_local2, f320_local3, f320_local4 = f320_arg0:getLocalLeftRight()
	local f320_local5, f320_local6, f320_local7, f320_local8 = f320_local0:getLocalLeftRight()
	local f320_local9, f320_local10, f320_local11, f320_local12 = f320_arg1:getLocalLeftRight()
	f320_local0:setLeftRight( f320_local5, f320_local6, f320_local7, f320_local7 + f320_arg1:getTextWidth() + 2 * (f320_local3 + f320_local11) + f320_arg2 )
end

function ScaleParentWidgetToElementLabel( f321_arg0, f321_arg1, f321_arg2 )
	if f321_arg0[f321_arg1] then
		ScaleParentWidgetToLabel( f321_arg0, f321_arg0[f321_arg1], f321_arg2 )
	end
end

function RestoreParentToOriginalWidth( f322_arg0 )
	local f322_local0 = f322_arg0 and f322_arg0:getParent()
	if f322_local0 and f322_local0._originalWidth ~= nil then
		local f322_local1, f322_local2, f322_local3, f322_local4 = f322_local0:getLocalLeftRight()
		f322_local0:setLeftRight( f322_local1, f322_local2, f322_local3, f322_local3 + f322_local0._originalWidth )
	end
end

function ScaleWidgetToLabelRightAligned( f323_arg0, f323_arg1, f323_arg2 )
	if f323_arg1 == nil then
		return 
	elseif Engine.IsCurrentLanguageReversed() then
		local f323_local0, f323_local1, f323_local2, f323_local3 = f323_arg0:getLocalLeftRight()
		local f323_local4, f323_local5, f323_local6, f323_local7 = f323_arg1:getLocalLeftRight()
		local f323_local8 = f323_arg1:getTextWidth()
		if f323_local4 + f323_local5 == 0 then
			f323_arg0:setLeftRight( f323_local0, f323_local1, f323_local3 - f323_local8 - 2 * f323_local6 - f323_arg2, f323_local3 )
		elseif f323_local5 == 1 then
			f323_arg0:setLeftRight( f323_local0, f323_local1, f323_local3 - f323_local8 + 2 * f323_local7 - f323_arg2, f323_local3 )
			f323_arg1:setLeftRight( f323_local4, f323_local5, f323_local7 - f323_local8 - f323_arg2, f323_local7 )
		end
	else
		local f323_local0, f323_local1, f323_local2, f323_local3 = f323_arg0:getLocalLeftRight()
		local f323_local4, f323_local5, f323_local6, f323_local7 = f323_arg1:getLocalLeftRight()
		f323_arg0:setLeftRight( f323_local0, f323_local1, f323_local3 - f323_arg1:getTextWidth() + 2 * f323_local7 - f323_arg2, f323_local3 )
	end
end

function SetParentWidgetWidth( f324_arg0, f324_arg1, f324_arg2 )
	local f324_local0 = f324_arg0 and f324_arg0:getParent()
	if f324_local0 == nil then
		return 
	else
		local f324_local1, f324_local2, f324_local3, f324_local4 = f324_local0:getLocalLeftRight()
		f324_local0:setLeftRight( f324_local1, f324_local2, f324_local3, f324_local3 + f324_arg2 )
	end
end

function ScaleToFitImageElement( f325_arg0, f325_arg1, f325_arg2 )
	local f325_local0 = f325_arg0[f325_arg2]
	if f325_local0 then
		local f325_local1, f325_local2 = f325_local0:getImageDimensions()
		if f325_local1 > 0 and f325_local2 > 0 then
			local f325_local3, f325_local4, f325_local5 = f325_local0:getLocalLeftRight()
			local f325_local6, f325_local7, f325_local8, f325_local9 = f325_local0:getLocalTopBottom()
			local f325_local10, f325_local11, f325_local12, f325_local13 = f325_arg1:getLocalLeftRight()
			local f325_local14, f325_local15, f325_local16, f325_local17 = f325_arg1:getLocalTopBottom()
			f325_arg1:setLeftRight( true, false, f325_local12, math.floor( (f325_local5 * 2 + (f325_local17 + f325_local9 - f325_local8) * f325_local1 / f325_local2 - 1) / 2 ) * 2 )
			f325_arg1:setTopBottom( true, false, f325_local16, f325_local17 )
		end
	end
end

function CloseInGameMenu( f326_arg0, f326_arg1 )
	CoD.InGameMenu.CloseAllInGameMenus( f326_arg0, f326_arg1 )
end

function PacifierSetMessage( f327_arg0, f327_arg1, f327_arg2 )
	f327_arg0.lblMessage.Text0.setText( f327_arg2 )
end

function StartNewGame( f328_arg0, f328_arg1, f328_arg2 )
	if Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 2 then
		CoD.OverlayUtility.CreateOverlay( f328_arg2, f328_arg0, "LobbyLocalClientWarning", {
			controller = f328_arg2,
			maxLocalClients = 2
		} )
		return 
	else
		Engine.SetDvar( "cp_queued_level", "" )
		SetMap( f328_arg2, LuaUtils.GetDefaultMap( LobbyData.GetCurrentMenuTarget() ), false )
		Engine.SetDvar( "ui_useloadingmovie", "1" )
		Engine.SetDvar( "skipto", "" )
		Engine.SetDvar( "sv_saveGameSkipto", "" )
		Engine.SetDvar( "ui_blocksaves", "0" )
		CoD.LobbyBase.LaunchGame( f328_arg0, f328_arg2, Enum.LobbyType.LOBBY_TYPE_GAME )
	end
end

function ReplaySelectedMission( f329_arg0, f329_arg1, f329_arg2 )
	Engine.SetDvar( "ui_useloadingmovie", "1" )
	Engine.SetDvar( "skipto", "" )
	Engine.SetDvar( "sv_saveGameSkipto", "" )
	Engine.SetDvar( "ui_blocksaves", "1" )
	CoD.LobbyBase.LaunchGame( f329_arg0, f329_arg2, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function ResumeFromCheckpoint( f330_arg0, f330_arg1, f330_arg2 )
	if Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 2 then
		CoD.OverlayUtility.CreateOverlay( f330_arg2, f330_arg0, "LobbyLocalClientWarning", {
			controller = f330_arg2,
			maxLocalClients = 2
		} )
		return 
	end
	Engine.SetDvar( "cp_queued_level", "" )
	if Engine.IsCampaignModeZombies() then
		SetMap( f330_arg2, Engine.GetSavedMap(), false )
	else
		local f330_local0 = Engine.GetSavedMapQueuedMap()
		if f330_local0 ~= "" then
			SetMap( f330_arg2, f330_local0, true )
		else
			SetMap( f330_arg2, Engine.GetSavedMap(), false )
		end
	end
	local f330_local0 = Engine.GetSavedMapSkipto()
	Engine.RestoreSavedWorldObject()
	Engine.SetDvar( "ui_useloadingmovie", "1" )
	Engine.SetDvar( "skipto", f330_local0 )
	Engine.SetDvar( "sv_saveGameSkipto", f330_local0 )
	Engine.SetDvar( "ui_blocksaves", "0" )
	CoD.LobbyBase.LaunchGame( f330_arg0, f330_arg2, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function GotoSafehouse( f331_arg0, f331_arg1, f331_arg2 )
	if Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 2 then
		CoD.OverlayUtility.CreateOverlay( f331_arg2, f331_arg0, "LobbyLocalClientWarning", {
			controller = f331_arg2,
			maxLocalClients = 2
		} )
		return 
	end
	local f331_local0 = Engine.GetSavedMapQueuedMap()
	if f331_local0 ~= "" then
		SetMap( f331_arg2, f331_local0, true )
	else
		SetMap( f331_arg2, Engine.GetSavedMap(), true )
	end
	Engine.RestoreSavedWorldObject()
	Engine.SetDvar( "ui_useloadingmovie", "1" )
	Engine.SetDvar( "skipto", "" )
	Engine.SetDvar( "sv_saveGameSkipto", "" )
	Engine.SetDvar( "ui_blocksaves", "1" )
	CoD.LobbyBase.LaunchGame( f331_arg0, f331_arg2, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function SetLobbyServerBrowserFilterForE3( f332_arg0, f332_arg1, f332_arg2 )
	local f332_local0 = nil
	if Dvar.ui_execdemo_cp:get() == true then
		f332_local0 = Enum.LobbyMainMode.LOBBY_MAINMODE_CP
	elseif Dvar.ui_execdemo_e3:get() == true or Dvar.ui_execdemo_e3_host:get() == true then
		f332_local0 = Enum.LobbyMainMode.LOBBY_MAINMODE_MP
	end
	if f332_local0 == nil then
		return 
	else
		Engine.LobbyServerListSetMainModeFilter( f332_local0 )
		CoD.LobbyBase.LobbyLANServerBrowserFilterUpdateEvent( f332_arg0, f332_arg2 )
	end
end

function CloseAllInGameMenus( f333_arg0, f333_arg1 )
	if not Dvar.ui_isSaving:get() then
		CoD.InGameMenu.CloseAllInGameMenus( f333_arg0, {
			name = "close_all_ingame_menus",
			controller = f333_arg1
		} )
	end
end

function GoBackThroughAllAndClose( f334_arg0, f334_arg1 )
	while f334_arg0 do
		while not f334_arg0.menuName do
			f334_arg0 = f334_arg0:getParent()
		end
		local f334_local0, f334_local1 = CoD.Menu.GetNavigationForMenu( f334_arg1, f334_arg0.menuName )
		if f334_local0 == 1 then
			Close( f334_arg0, f334_arg1 )
			return 
		end
		f334_arg0 = GoBack( f334_arg0, f334_arg1 )
	end
	while not f334_arg0.menuName do
		f334_arg0 = f334_arg0:getParent()
	end
	local f334_local0, f334_local1 = CoD.Menu.GetNavigationForMenu( f334_arg1, f334_arg0.menuName )
	if f334_local0 == 1 then
		Close( f334_arg0, f334_arg1 )
		return 
	end
	f334_arg0 = GoBack( f334_arg0, f334_arg1 )
end

function GoBackThroughAll( f335_arg0, f335_arg1 )
	while f335_arg0 do
		f335_arg0 = GoBack( f335_arg0, f335_arg1 )
	end
end

function LobbyGoBack( f336_arg0, f336_arg1 )
	local f336_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	if f336_local0 and Engine.GetModelValue( f336_local0 ) == LobbyData.UITargets.UI_MODESELECT.id then
		if IsPC() then
			CoD.LobbyBase.LobbyQuitOrLeaveParty( f336_arg0, f336_arg1 )
			return true
		end
		DisableAllMenuInput( f336_arg0, true )
	end
	CoD.LobbyBase.LobbyGoBack( f336_arg0, f336_arg1 )
	f336_arg0:playSound( "menu_go_back" )
end

function DisplayPlayGoWarning( f337_arg0, f337_arg1 )
	local f337_local0 = CoD.OverlayUtility.CreateOverlay( f337_arg1, f337_arg0, "GenericModalDialog", "", "MENU_STILLDOWNLOADING", "t7_icon_connect_overlays_bkg", {
		"MPUI_OK"
	}, function ( f338_arg0 )
		return true
	end )
	f337_local0.anyControllerAllowed = true
	f337_local0.unusedControllerAllowed = true
end

function LobbyBeginPlay( f339_arg0, f339_arg1 )
	if (IsOrbis() or IsDurango()) and (Engine.IsMpStillDownloading() or Engine.IsZmStillDownloading() or Engine.IsCpStillDownloading()) and not CoD.perController[f339_arg1].hasShownPlaygoWarning then
		CoD.perController[f339_arg1].hasShownPlaygoWarning = true
		DisplayPlayGoWarning( f339_arg0, f339_arg1 )
		return false
	else
		CoD.LobbyBase.BeginPlay( f339_arg0, f339_arg1 )
		return true
	end
end

function GoBackAndLobbyBeginPlay( f340_arg0, f340_arg1 )
	LobbyBeginPlay( GoBack( f340_arg0, f340_arg1 ), f340_arg1 )
end

function SizeToSafeArea( f341_arg0, f341_arg1 )
	f341_arg0:sizeToSafeArea( f341_arg1 )
end

function PartyHostSetState( f342_arg0, f342_arg1, f342_arg2 )
	Engine.PartyHostSetUIState( f342_arg2 )
end

function GoBackMultiple( f343_arg0, f343_arg1, f343_arg2 )
	local f343_local0 = f343_arg0
	local f343_local1 = tonumber( f343_arg2 )
	if f343_local1 == nil then
		return 
	end
	while f343_local1 > 0 do
		f343_local0 = GoBack( f343_local0, f343_arg1 )
		f343_local1 = f343_local1 - 1
	end
	return f343_local0
end

function GoBack( f344_arg0, f344_arg1 )
	if Rat and Rat.DisableGoBack then
		return 
	end
	while not f344_arg0.menuName do
		f344_arg0 = f344_arg0:getParent()
	end
	local f344_local0, f344_local1 = CoD.Menu.GetNavigationForMenu( f344_arg1, f344_arg0.menuName )
	if f344_local0 and f344_local1 then
		f344_arg0.previousMenuName = CoD.MenuNavigation[f344_arg1][f344_local0][f344_local1 - 1]
		CoD.MenuNavigation[f344_arg1][f344_local0][f344_local1] = nil
		if #CoD.MenuNavigation[f344_arg1][f344_local0] == 0 then
			table.remove( CoD.MenuNavigation[f344_arg1], f344_local0 )
		else
			
		end
	end
	f344_arg0:saveState()
	return f344_arg0:goBack( f344_arg1 )
end

function GoBackToMenu( f345_arg0, f345_arg1, f345_arg2 )
	local f345_local0, f345_local1 = CoD.Menu.GetNavigationForMenuToMenu( f345_arg1, f345_arg0.menuName, f345_arg2 )
	local f345_local2, f345_local3 = CoD.Menu.GetNavigationForMenu( f345_arg1, f345_arg0.menuName )
	local f345_local4, f345_local5 = CoD.Menu.GetNavigationForMenu( f345_arg1, f345_arg2 )
	if not f345_local2 or not f345_local3 or not f345_local4 or not f345_local5 then
		return GoBack( f345_arg0, f345_arg1 )
	elseif f345_arg0.menuName == f345_arg2 then
		return 
	elseif f345_arg0.occludedMenu and f345_arg0.occludedMenu.menuName == f345_arg2 then
		f345_arg0.previousMenuName = nil
		table.remove( CoD.MenuNavigation[f345_arg1], f345_local2 )
	elseif f345_local0 and f345_local1 then
		f345_arg0.previousMenuName = CoD.MenuNavigation[f345_arg1][f345_local0][f345_local1]
		local f345_local6 = #CoD.MenuNavigation[f345_arg1][f345_local0]
		for f345_local7 = f345_local1 + 1, f345_local6, 1 do
			CoD.MenuNavigation[f345_arg1][f345_local0][f345_local7] = nil
		end
		if #CoD.MenuNavigation[f345_arg1][f345_local0] == 0 then
			table.remove( CoD.MenuNavigation[f345_arg1], f345_local0 )
		end
		if f345_local2 ~= f345_local0 then
			table.remove( CoD.MenuNavigation[f345_arg1], f345_local2 )
		end
	elseif f345_arg0.occludedMenu then
		local f345_local6 = f345_arg0
		for f345_local7 = f345_local2, f345_local4 + 1, -1 do
			local f345_local10 = f345_local7
			if not f345_local6.occludedMenu then
				return f345_local6
			end
			f345_local6 = GoBackToMenu( f345_local6, f345_arg1, f345_local6.occludedMenu.menuName )
		end
		if f345_local6.menuName == f345_arg2 then
			return f345_local6
		end
		return GoBackToMenu( f345_local6, f345_arg1, f345_arg2 )
	end
	f345_arg0:saveState()
	return f345_arg0:goBack( f345_arg1 )
end

function GoBackAndUpdateStateOnPreviousMenu( f346_arg0, f346_arg1 )
	local f346_local0 = GoBack( f346_arg0, f346_arg1 )
	f346_local0:processEvent( {
		name = "update_state",
		controller = f346_arg1
	} )
	return f346_local0
end

function GoBackAndSetClassItem( f347_arg0, f347_arg1, f347_arg2 )
	local f347_local0 = GoBack( f347_arg0, f347_arg2 )
	SetClassItem( f347_local0, f347_arg1, f347_arg2 )
	f347_local0:processEvent( {
		name = "update_state",
		controller = f347_arg2
	} )
	return f347_local0
end

function GoBackAndUpdateNavigation( f348_arg0, f348_arg1, f348_arg2 )
	local f348_local0 = GoBack( f348_arg0, f348_arg2 )
	if CoD.CACUtility.CustomClass_LastClassNum and f348_local0.menuName == "CustomClass" then
		f348_local0:navigateTo( CoD.CACUtility.CustomClass_LastSelection )
		f348_local0:processEvent( {
			name = "update_state",
			controller = f348_arg2
		} )
	end
	return f348_local0
end

local f0_local3 = function ( f349_arg0 )
	if f349_arg0.weaponSlotTable and f349_arg0.currentActiveSlot and f349_arg0.weaponSlotTable[f349_arg0.currentActiveSlot] then
		local f349_local0 = f349_arg0.weaponSlotTable[f349_arg0.currentActiveSlot]
		if f349_local0 then
			if f349_local0.widget then
				f349_local0.widget:processEvent( {
					name = "gain_focus",
					skipGainFocus = true
				} )
			else
				f349_local0:dispatchEventToParent( {
					name = "gain_focus",
					skipGainFocus = true
				} )
			end
		end
	end
end

function GoBackToCustomClassMenu( f350_arg0, f350_arg1 )
	local f350_local0 = GoBackToMenu( f350_arg0, f350_arg1, "CustomClass" )
	if f350_local0 then
		f350_local0:processEvent( {
			name = "update_state",
			controller = f350_arg1
		} )
		if f350_local0.menuName == "CustomClass" then
			f0_local3( f350_local0 )
		end
	end
end

function Close( f351_arg0, f351_arg1 )
	while not f351_arg0.menuName do
		f351_arg0 = f351_arg0:getParent()
	end
	local f351_local0, f351_local1 = CoD.Menu.GetNavigationForMenu( f351_arg1, f351_arg0.menuName )
	if f351_local0 and f351_local1 then
		f351_arg0.previousMenuName = CoD.MenuNavigation[f351_arg1][f351_local0][f351_local1 - 1]
		CoD.MenuNavigation[f351_arg1][f351_local0][f351_local1] = nil
		if #CoD.MenuNavigation[f351_arg1][f351_local0] == 0 then
			table.remove( CoD.MenuNavigation[f351_arg1], f351_local0 )
		end
	end
	f351_arg0:saveState()
	f351_arg0:close()
end

function NavigateToLobby( f352_arg0, f352_arg1, f352_arg2, f352_arg3 )
	CoD.LobbyBase.NavigateToLobby( f352_arg0, f352_arg1, f352_arg2, f352_arg3 )
end

function NavigateToLobby_OccludedMenu( f353_arg0, f353_arg1, f353_arg2, f353_arg3, f353_arg4 )
	if f353_arg0.occludedMenu ~= nil then
		NavigateToLobby( f353_arg0.occludedMenu, f353_arg3, false, f353_arg2 )
	end
end

function NavigateToLobby_SelectionList( f354_arg0, f354_arg1, f354_arg2, f354_arg3, f354_arg4 )
	if f354_arg3 == "MPLobbyMain" then
		if Engine.PushAnticheatMessageToUI( f354_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.MP ) then
			DisplayAnticheatMessage( f354_arg0, f354_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.MP, "", "" )
			return 
		end
		for f354_local0 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
			if CheckIfFeatureIsBanned( f354_local0, LuaEnums.FEATURE_BAN.LIVE_MP ) then
				LuaUtils.UI_ShowErrorMessageDialog( f354_arg2, GetFeatureBanInfo( f354_local0, LuaEnums.FEATURE_BAN.LIVE_MP ) )
				return 
			end
		end
		if Engine.GetUsedControllerCount() > 1 then
			for f354_local1 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
				if CheckIfFeatureIsBanned( f354_local1, LuaEnums.FEATURE_BAN.MP_SPLIT_SCREEN ) then
					LuaUtils.UI_ShowErrorMessageDialog( f354_arg2, GetFeatureBanInfo( f354_local1, LuaEnums.FEATURE_BAN.MP_SPLIT_SCREEN ) )
					return 
				end
			end
		end
	end
	if f354_arg3 == "ZMLobbyOnline" then
		if Engine.PushAnticheatMessageToUI( f354_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.ZM ) then
			DisplayAnticheatMessage( f354_arg0, f354_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.ZM, "", "" )
			return 
		end
		for f354_local0 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
			if CheckIfFeatureIsBanned( f354_local0, LuaEnums.FEATURE_BAN.LIVE_ZM ) then
				LuaUtils.UI_ShowErrorMessageDialog( f354_arg2, GetFeatureBanInfo( f354_local0, LuaEnums.FEATURE_BAN.LIVE_ZM ) )
				return 
			end
		end
		if Engine.GetUsedControllerCount() > 1 then
			for f354_local1 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
				if CheckIfFeatureIsBanned( f354_local1, LuaEnums.FEATURE_BAN.ZM_SPLIT_SCREEN ) then
					LuaUtils.UI_ShowErrorMessageDialog( f354_arg2, GetFeatureBanInfo( f354_local1, LuaEnums.FEATURE_BAN.ZM_SPLIT_SCREEN ) )
					return 
				end
			end
		end
	end
	if f354_arg3 == "CPLobbyOnline" then
		for f354_local0 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
			if CheckIfFeatureIsBanned( f354_local0, LuaEnums.FEATURE_BAN.LIVE_CP ) then
				LuaUtils.UI_ShowErrorMessageDialog( f354_arg2, GetFeatureBanInfo( f354_local0, LuaEnums.FEATURE_BAN.LIVE_CP ) )
				return 
			end
		end
		if Engine.GetUsedControllerCount() > 1 then
			for f354_local1 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
				if CheckIfFeatureIsBanned( f354_local1, LuaEnums.FEATURE_BAN.CP_SPLIT_SCREEN ) then
					LuaUtils.UI_ShowErrorMessageDialog( f354_arg2, GetFeatureBanInfo( f354_local1, LuaEnums.FEATURE_BAN.CP_SPLIT_SCREEN ) )
					return 
				end
			end
		end
	end
	if f354_arg3 == "MPLobbyOnlineArena" then
		if Engine.PushAnticheatMessageToUI( f354_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.ARENA ) then
			DisplayAnticheatMessage( f354_arg0, f354_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.ARENA, "", "" )
			return 
		end
		for f354_local0 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
			if CheckIfFeatureIsBanned( f354_local0, LuaEnums.FEATURE_BAN.ARENA_GAMEPLAY ) then
				LuaUtils.UI_ShowErrorMessageDialog( f354_arg2, GetFeatureBanInfo( f354_local0, LuaEnums.FEATURE_BAN.ARENA_GAMEPLAY ) )
				return 
			end
		end
	end
	if f354_arg3 == "ZMLobbyOnlineCustomGame" then
		Dvar.zm_private_rankedmatch:set( Engine.GetProfileVarInt( f354_arg2, "com_privategame_ranked_zm" ) ~= 0 )
	end
	UpdateDifficulty( f354_arg0, f354_arg3, f354_arg2 )
	NavigateToLobby( f354_arg4, f354_arg3, false, f354_arg2 )
end

function NavigateToLobby_FirstTimeFlowMP( f355_arg0, f355_arg1, f355_arg2, f355_arg3 )
	if IsLAN() then
		NavigateToLobby_SelectionList( f355_arg0, f355_arg1, f355_arg2, LobbyData.UITargets.UI_MPLOBBYLANGAME.name, f355_arg3 )
	else
		NavigateToLobby_SelectionList( f355_arg0, f355_arg1, f355_arg2, LobbyData.UITargets.UI_MPLOBBYMAIN.name, f355_arg3 )
	end
end

function NavigateToLobby_FirstTimeFlowCP( f356_arg0, f356_arg1, f356_arg2, f356_arg3 )
	if IsLAN() then
		NavigateToLobby_SelectionList( f356_arg0, f356_arg1, f356_arg2, LobbyData.UITargets.UI_CPLOBBYLANGAME.name, f356_arg3 )
	else
		NavigateToLobby_SelectionList( f356_arg0, f356_arg1, f356_arg2, LobbyData.UITargets.UI_CPLOBBYONLINE.name, f356_arg3 )
	end
end

function NavigateToLobby_SelectionListCampaignZombies( f357_arg0, f357_arg1, f357_arg2, f357_arg3, f357_arg4 )
	if IsLAN() then
		NavigateToLobby_SelectionList( f357_arg0, f357_arg1, f357_arg2, LobbyData.UITargets.UI_CP2LOBBYLANGAME.name, f357_arg4 )
	else
		NavigateToLobby_SelectionList( f357_arg0, f357_arg1, f357_arg2, LobbyData.UITargets.UI_CP2LOBBYONLINE.name, f357_arg4 )
	end
end

function NavigateToMenu( f358_arg0, f358_arg1, f358_arg2, f358_arg3 )
	while f358_arg0 and not f358_arg0.openMenu do
		f358_arg0 = f358_arg0:getParent()
	end
	if not f358_arg0 then
		return 
	elseif not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	if not CoD.MenuNavigation[f358_arg3] then
		CoD.MenuNavigation[f358_arg3] = {
			{
				f358_arg0.menuName
			}
		}
	end
	local f358_local0, f358_local1 = CoD.Menu.GetNavigationForMenu( f358_arg3, f358_arg0.menuName )
	if not f358_local0 or not f358_local1 then
		CoD.MenuNavigation[f358_arg3] = {
			{
				f358_arg0.menuName
			}
		}
		f358_local0, f358_local1 = CoD.Menu.GetNavigationForMenu( f358_arg3, f358_arg0.menuName )
	end
	local f358_local2 = f358_arg0.userData
	local f358_local3 = f358_arg0.menuName
	local f358_local4 = f358_arg0.occludedMenu
	local f358_local5 = f358_arg0:getParent()
	f358_arg0:saveState()
	f358_arg0:close()
	local f358_local6 = f358_arg0:replaceMenu( f358_arg1, f358_arg3, nil, f358_local2, f358_local3, f358_local4, f358_local5 )
	if f358_local0 and f358_local1 then
		if f358_arg2 then
			table.insert( CoD.MenuNavigation[f358_arg3][f358_local0], f358_local1 + 1, f358_local6.menuName )
		else
			CoD.MenuNavigation[f358_arg3][f358_local0][f358_local1] = f358_local6.menuName
		end
	end
	return f358_local6
end

function NavigateToMenuNoDependency( f359_arg0, f359_arg1, f359_arg2, f359_arg3 )
	NavigateToMenu( f359_arg0, f359_arg1, f359_arg2, f359_arg3 )
end

function OpenPopup( f360_arg0, f360_arg1, f360_arg2 )
	local f360_local0 = f360_arg0
	while f360_local0 and not f360_local0.openMenu do
		f360_local0 = f360_local0:getParent()
	end
	local f360_local1 = f360_local0:openPopup( f360_arg1, f360_arg2 )
	if not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	if not CoD.MenuNavigation[f360_arg2] then
		CoD.MenuNavigation[f360_arg2] = {}
	end
	table.insert( CoD.MenuNavigation[f360_arg2], {
		f360_local1.menuName
	} )
	return f360_local1
end

function OpenPopup_NoDependency( f361_arg0, f361_arg1, f361_arg2 )
	return OpenPopup( f361_arg0, f361_arg1, f361_arg2 )
end

function OpenPopupWithPriority( f362_arg0, f362_arg1, f362_arg2, f362_arg3 )
	local f362_local0 = OpenPopup( f362_arg0, f362_arg1, f362_arg2 )
	f362_local0:setPriority( f362_arg3 )
end

function OpenOverlay( f363_arg0, f363_arg1, f363_arg2, f363_arg3, f363_arg4 )
	local f363_local0 = f363_arg0
	while f363_local0 and not f363_local0.openMenu do
		f363_local0 = f363_local0:getParent()
	end
	if f363_arg3 == "" then
		f363_arg3 = nil
	end
	if f363_arg4 == "" then
		f363_arg4 = nil
	end
	local f363_local1 = f363_local0:openOverlay( f363_arg1, f363_arg2, f363_arg3, f363_arg4 )
	if not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	if not CoD.MenuNavigation[f363_arg2] then
		CoD.MenuNavigation[f363_arg2] = {}
	end
	table.insert( CoD.MenuNavigation[f363_arg2], {
		f363_local1.menuName
	} )
	return f363_local1
end

function OpenSystemOverlay( f364_arg0, f364_arg1, f364_arg2, f364_arg3, f364_arg4 )
	CoD.OverlayUtility.CreateOverlay( f364_arg2, f364_arg1, f364_arg3, f364_arg2, f364_arg4 )
end

function PerformOverlayBack( f365_arg0, f365_arg1, f365_arg2, f365_arg3 )
	if HasOverlayBackAction( f365_arg3 ) then
		f365_arg3[CoD.OverlayUtility.GoBackPropertyName]( f365_arg0, f365_arg1, f365_arg2, f365_arg3 )
	end
end

function PerformOverlayContinue( f366_arg0, f366_arg1, f366_arg2, f366_arg3 )
	if HasOverlayContinueAction( f366_arg3 ) then
		f366_arg3[CoD.OverlayUtility.ContinuePropertyName]( f366_arg0, f366_arg1, f366_arg2, f366_arg3 )
	end
end

function GoBackAndOpenOverlayOnParent( f367_arg0, f367_arg1, f367_arg2 )
	local f367_local0 = GoBack( f367_arg0, f367_arg2 )
	f367_local0:openOverlay( f367_arg1, f367_arg2 )
end

function GoBackAndOpenPopupOnParent( f368_arg0, f368_arg1, f368_arg2 )
	local f368_local0 = GoBack( f368_arg0, f368_arg2 )
	f368_local0:openPopup( f368_arg1, f368_arg2 )
end

local f0_local4 = function ( f369_arg0, f369_arg1, f369_arg2, f369_arg3, f369_arg4, f369_arg5, f369_arg6 )
	local f369_local0 = f369_arg0
	while f369_local0 and not f369_local0.openMenu do
		f369_local0 = f369_local0:getParent()
	end
	local f369_local1 = f369_local0:openPopup( f369_arg2, f369_arg1 )
	if not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	if not CoD.MenuNavigation[f369_arg1] then
		CoD.MenuNavigation[f369_arg1] = {}
	end
	table.insert( CoD.MenuNavigation[f369_arg1], {
		f369_local1.menuName
	} )
	if f369_arg3 and f369_arg3 ~= "" then
		f369_local1:setContent( Engine.Localize( f369_arg3 ) )
	end
	if f369_arg4 and f369_arg4 ~= "" then
		f369_local1:setSubContent( Engine.Localize( f369_arg4 ) )
	end
	if f369_arg5 and f369_arg5 ~= "" then
		f369_local1:setButton1Text( Engine.Localize( f369_arg5 ) )
	end
	local f369_local2 = f369_arg6
	if f369_arg6 and type( f369_arg6 ) == "string" and f369_arg6 ~= "" and _G[f369_arg6] then
		f369_local2 = _G[f369_arg6]
	end
	if type( f369_local2 ) == "function" then
		f369_local1:setButton1Action( f369_arg6 )
	end
	return f369_local1
end

function GenericSmallPopupGoBack( f370_arg0, f370_arg1 )
	if f370_arg0.customGoBackAction then
		f370_arg0:customGoBackAction( f370_arg1 )
	else
		GoBack( f370_arg0, f370_arg1 )
	end
end

function OpenGenericSmallPopup( f371_arg0, f371_arg1, f371_arg2, f371_arg3, f371_arg4, f371_arg5, f371_arg6, f371_arg7 )
	return CoD.OverlayUtility.CreateOverlay( f371_arg1, f371_arg0, "GenericPopup", CoD.OverlayUtility.GenericPopupSizes.Small, f371_arg2, f371_arg3, f371_arg4, f371_arg5, f371_arg6, f371_arg7 )
end

function OpenGenericLargePopup( f372_arg0, f372_arg1, f372_arg2, f372_arg3, f372_arg4, f372_arg5, f372_arg6, f372_arg7 )
	return CoD.OverlayUtility.CreateOverlay( f372_arg1, f372_arg0, "GenericPopup", CoD.OverlayUtility.GenericPopupSizes.Large, f372_arg2, f372_arg3, f372_arg4, f372_arg5, f372_arg6, f372_arg7 )
end

function SendMenuResponse( f373_arg0, f373_arg1, f373_arg2, f373_arg3 )
	Engine.SendMenuResponse( f373_arg3, f373_arg1, f373_arg2 )
end

function SendMenuResponseExpression( f374_arg0, f374_arg1, f374_arg2 )
	Engine.SendMenuResponse( f374_arg0, f374_arg1, f374_arg2 )
end

function SendOwnMenuResponse( f375_arg0, f375_arg1, f375_arg2 )
	Engine.SendMenuResponse( f375_arg1, f375_arg0.menuName, f375_arg2 )
end

function SendFrontendControllerZeroMenuResponse( f376_arg0, f376_arg1, f376_arg2 )
	if CoD.isFrontend then
		f376_arg0 = 0
	end
	Engine.SendMenuResponse( f376_arg0, f376_arg1, f376_arg2 )
end

function ClearSavedState( f377_arg0, f377_arg1 )
	f377_arg0:clearSavedState()
end

function ClearMenuSavedState( f378_arg0 )
	f378_arg0:clearSavedState()
end

function PlayClip( f379_arg0, f379_arg1, f379_arg2 )
	f379_arg0:playClip( f379_arg1 )
end

function PlayClipOnElement( f380_arg0, f380_arg1, f380_arg2 )
	if f380_arg0[f380_arg1.elementName] then
		f380_arg0[f380_arg1.elementName]:playClip( f380_arg1.clipName )
	end
end

function PlayClipOnListItemElement( f381_arg0, f381_arg1, f381_arg2, f381_arg3 )
	f381_arg1:playClip( f381_arg3 )
end

function SetFocusToElement( f382_arg0, f382_arg1, f382_arg2 )
	if f382_arg0[f382_arg1] then
		f382_arg0[f382_arg1]:processEvent( {
			name = "gain_focus",
			controller = f382_arg2
		} )
	end
end

function SetLoseFocusToElement( f383_arg0, f383_arg1, f383_arg2 )
	if f383_arg0[f383_arg1] then
		f383_arg0[f383_arg1]:processEvent( {
			name = "lose_focus",
			controller = f383_arg2
		} )
	end
end

function SetTextToElement( f384_arg0, f384_arg1, f384_arg2 )
	if f384_arg0[f384_arg1] then
		f384_arg0[f384_arg1]:setText( Engine.Localize( f384_arg2 ) )
	end
end

function MakeElementFocusable( f385_arg0, f385_arg1, f385_arg2 )
	if f385_arg0[f385_arg1] then
		f385_arg0[f385_arg1]:makeFocusableWithoutResettingNavigation( f385_arg0 )
	end
end

function MakeElementNotFocusable( f386_arg0, f386_arg1, f386_arg2 )
	if f386_arg0[f386_arg1] then
		f386_arg0[f386_arg1]:makeNotFocusable( f386_arg0 )
	end
end

function MakeFocusable( f387_arg0 )
	f387_arg0:makeFocusableWithoutResettingNavigation()
end

function MakeNotFocusable( f388_arg0 )
	f388_arg0:makeNotFocusable()
end

function DisableNavigation( f389_arg0, f389_arg1 )
	f389_arg0[f389_arg1].m_disableNavigation = true
end

function EnableNavigation( f390_arg0, f390_arg1 )
	f390_arg0[f390_arg1].m_disableNavigation = false
end

function DisableAllMenuInput( f391_arg0, f391_arg1 )
	f391_arg0.m_disableAllButtonActions = f391_arg1
end

function ModalSelectListOption( f392_arg0, f392_arg1, f392_arg2 )
	if CoD.Menu.ModalDialogInfo.Callback ~= nil and CoD.Menu.ModalDialogInfo.Callback( f392_arg1.gridInfoTable.zeroBasedIndex ) == true then
		GoBack( f392_arg0, f392_arg2 )
	end
end

function ModalGoBack( f393_arg0, f393_arg1, f393_arg2 )
	if CoD.Menu.ModalDialogInfo.Callback ~= nil then
		CoD.Menu.ModalDialogInfo.Callback()
	end
	GoBack( f393_arg0, f393_arg2 )
end

function SetResponseYes( f394_arg0, f394_arg1 )
	GoBack( f394_arg0, f394_arg1 )
	if f394_arg0.modalCallback then
		f394_arg0.modalCallback( "yes" )
	end
end

function SetResponseNo( f395_arg0, f395_arg1 )
	GoBack( f395_arg0, f395_arg1 )
	if f395_arg0.modalCallback then
		f395_arg0.modalCallback( "no" )
	end
end

function SetResponseCancel( f396_arg0, f396_arg1 )
	GoBack( f396_arg0, f396_arg1 )
	if f396_arg0.modalCallback then
		f396_arg0.modalCallback( "cancel" )
	end
end

function OpenOptionsMenu( f397_arg0, f397_arg1, f397_arg2 )
	local f397_local0 = f397_arg0
	while f397_local0 and not f397_local0.openMenu do
		f397_local0 = f397_local0:getParent()
	end
	f397_local0:saveState()
	f397_local0:openMenu( "OptionsMenu", f397_arg2 )
	f397_local0:close()
end

function LoadSaveGameData( f398_arg0, f398_arg1 )
	Engine.LoadSaveGame()
end

function RestartMission( f399_arg0, f399_arg1, f399_arg2 )
	local f399_local0 = f399_arg0
	while f399_local0 and not f399_local0.openMenu do
		f399_local0 = f399_local0:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( f399_arg2, f399_local0, "RestartMissionPopup" )
end

function EndTrainingSim( f400_arg0, f400_arg1, f400_arg2 )
	Engine.SendMenuResponse( f400_arg2, "StartMenu", "EndTrainingSim" )
	StartMenuResumeGame( f400_arg0, f400_arg2 )
	GoBack( f400_arg0, f400_arg2 )
end

function CPSelectPublicGameGetRandomMap( f401_arg0, f401_arg1, f401_arg2 )
	local f401_local0 = {}
	local f401_local1 = Engine.IsCampaignModeZombies()
	for f401_local6, f401_local7 in LUI.IterateTableBySortedKeys( CoD.mapsTable, function ( f402_arg0, f402_arg1 )
		return CoD.mapsTable[f402_arg0].unique_id < CoD.mapsTable[f402_arg1].unique_id
	end, nil ) do
		local f401_local5
		if f401_local7.campaign_mode ~= Enum.CampaignMode.CAMPAIGNMODE_DEFAULT or f401_local1 then
			if f401_local7.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_ZOMBIES then
				f401_local5 = f401_local1
			else
				f401_local5 = false
			end
		else
			f401_local5 = true
		end
		if f401_local5 then
			f401_local5 = f401_local6 ~= "cp_doa_bo3"
		end
		if f401_local7.session_mode == Enum.eModes.MODE_CAMPAIGN and f401_local5 and f401_local7.dlc_pack ~= -1 and f401_local7.isSubLevel == false then
			table.insert( f401_local0, {
				properties = {
					mapId = f401_local6
				}
			} )
		end
	end
	if f401_local0 ~= nil and #f401_local0 > 0 then
		f401_local2 = math.random
		f401_local3 = 1
		return f401_local0[f401_local2( 1, #f401_local0 )].properties.mapId
	else
		return LuaUtils.GetDefaultMap( LobbyData.GetCurrentMenuTarget() )
	end
end

function CPSelectPublicGame( f403_arg0, f403_arg1, f403_arg2, f403_arg3, f403_arg4 )
	local f403_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.cpPublicLobbySearchAll" )
	Engine.SetModelValue( f403_local0, false )
	Engine.SetDvar( "ui_useloadingmovie", "1" )
	Engine.SetDvar( "skipto", "" )
	Engine.SetDvar( "sv_saveGameSkipto", "" )
	Engine.SetDvar( "ui_blocksaves", "1" )
	if f403_arg3 == "specificMission" then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "cpLobby" ), "public" )
		GoBackAndOpenPopupOnParent( f403_arg0, "CPMissionSelect", f403_arg2 )
		return 
	elseif f403_arg3 == "anyMission" then
		f403_arg1.mapId = CPSelectPublicGameGetRandomMap( f403_arg0, f403_arg1, f403_arg2 )
	else
		f403_arg1.mapId = Engine.GetSavedMap()
	end
	SetSelectedCPMission( f403_arg0, f403_arg1, f403_arg2 )
	Engine.SetPlaylistID( GetPlaylistIDForSelectedCPMission( f403_arg0, f403_arg1, f403_arg2 ) )
	if f403_arg3 == "anyMission" then
		Engine.SetModelValue( f403_local0, true )
	end
	local f403_local1 = Engine.GetModeName()
	if Engine.IsCampaignModeZombies() then
		f403_local1 = f403_local1 .. "2"
	end
	if f403_local1 == "Invalid" then
		error( "Invalid mode in matchmaking" )
	end
	local f403_local2 = f403_local1 .. "LobbyOnlinePublicGame"
	local f403_local3 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	GoBack( f403_arg0, f403_arg2 )
	NavigateToLobby( f403_arg0, f403_local2, false, f403_arg2 )
end

function RestartFromCheckpoint( f404_arg0, f404_arg1, f404_arg2 )
	local f404_local0 = f404_arg0
	while f404_local0 and not f404_local0.openMenu do
		f404_local0 = f404_local0:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( f404_arg2, f404_local0, "RestartCheckpointPopup" )
end

function LaunchLevel( f405_arg0, f405_arg1, f405_arg2 )
	local f405_local0 = Engine.GetModelValue( f405_arg1:getModel( f405_arg2, "devName" ) )
	if f405_local0 ~= "" then
		Engine.Exec( f405_arg2, "devmap " .. f405_local0 )
	end
end

function QuitGame( f406_arg0, f406_arg1, f406_arg2 )
	local f406_local0 = f406_arg0
	while f406_local0 and not f406_local0.openMenu do
		f406_local0 = f406_local0:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( f406_arg2, f406_local0, "QuitGamePopup" )
end

function SaveAndQuitGame( f407_arg0, f407_arg1, f407_arg2 )
	local f407_local0 = f407_arg0
	while f407_local0 and not f407_local0.openMenu do
		f407_local0 = f407_local0:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( f407_arg2, f407_local0, "SaveAndQuitGamePopup" )
end

function LaunchSideMission( f408_arg0, f408_arg1, f408_arg2 )
	Engine.Exec( f408_arg2, "loadside " .. Engine.GetModelValue( f408_arg1:getModel( f408_arg2, "missionIndex" ) ) .. " " .. Engine.GetModelValue( f408_arg1:getModel( f408_arg2, "mapName" ) ) .. " " .. Engine.GetModelValue( f408_arg1:getModel( f408_arg2, "missionTypeInternal" ) ) .. " " .. Engine.GetModelValue( f408_arg1:getModel( f408_arg2, "lighting" ) ) )
end

function LaunchSelectedCPMission( f409_arg0, f409_arg1, f409_arg2 )
	local f409_local0 = Engine.GetModeName()
	if Engine.IsCampaignModeZombies() then
		f409_local0 = f409_local0 .. "2"
	end
	if f409_local0 == "Invalid" then
		error( "Invalid mode in matchmaking" )
	end
	local f409_local1 = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "cpLobby" ) )
	local f409_local2 = Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
	local f409_local3 = false
	local f409_local4 = "LobbyOnlineCustomGame"
	if f409_local2 == true then
		if f409_local1 == "public" then
			f409_local3 = true
			f409_local4 = "LobbyOnlinePublicGame"
		elseif f409_local1 == "custom" then
			f409_local4 = "LobbyOnlineCustomGame"
		end
	else
		f409_local4 = "LobbyLANCustomGame"
	end
	f409_local4 = f409_local0 .. f409_local4
	if IsElementPropertyValue( f409_arg1, "classified", true ) then
		f409_arg0:OpenModalDialog( f409_arg0, f409_arg2, "MENU_OUTOFORDER_PLAY", "MENU_OUTOFORDER_DESC", {
			"MPUI_YES",
			"MPUI_NO"
		}, function ( f410_arg0 )
			if f410_arg0 == 0 then
				local f410_local0 = Engine.GetPlayerStats( f409_arg2, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_CAMPAIGN )
				f410_local0.allMapsUnlocked:set( 1 )
				f409_arg0.MapList:updateDataSource()
			end
			return true
		end )
	else
		SetSelectedCPMission( f409_arg0, f409_arg1, f409_arg2 )
		if f409_local3 then
			Engine.SetPlaylistID( GetPlaylistIDForSelectedCPMission( f409_arg0, f409_arg1, f409_arg2 ) )
		end
		local f409_local5 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
		if f409_local5 ~= LobbyData.UITargets.UI_CPLOBBYONLINECUSTOMGAME.id and f409_local5 ~= LobbyData.UITargets.UI_CP2LOBBYONLINECUSTOMGAME.id and f409_local5 ~= LobbyData.UITargets.UI_CPLOBBYLANCUSTOMGAME.id and f409_local5 ~= LobbyData.UITargets.UI_CP2LOBBYLANCUSTOMGAME.id then
			NavigateToLobby( f409_arg0, f409_local4, false, f409_arg2 )
		end
		GoBack( f409_arg0, f409_arg2 )
	end
end

function RestartGame( f411_arg0, f411_arg1, f411_arg2 )
	local f411_local0 = f411_arg0
	while f411_local0 and not f411_local0.openMenu do
		f411_local0 = f411_local0:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( f411_arg2, f411_local0, "RestartGamePopup" )
end

function ChooseClass( f412_arg0, f412_arg1, f412_arg2 )
	local f412_local0 = f412_arg0
	while f412_local0 and not f412_local0.openMenu do
		f412_local0 = f412_local0:getParent()
	end
	f412_local0:saveState()
	f412_local0:openMenu( CoD.ChangeClassMenuName, f412_arg2 )
	f412_local0:close()
end

function ChooseTeam( f413_arg0, f413_arg1, f413_arg2 )
	local f413_local0 = f413_arg0
	while f413_local0 and not f413_local0.openMenu do
		f413_local0 = f413_local0:getParent()
	end
	f413_local0:saveState()
	local f413_local1 = f413_local0:openMenu( "ChangeTeam", f413_arg2 )
	if f413_local1 then
		f413_local1.previousMenuId = f413_local0.id
	end
	f413_local0:close()
end

function QuitGame_MP( f414_arg0, f414_arg1, f414_arg2 )
	local f414_local0 = f414_arg0
	while f414_local0 and not f414_local0.openMenu do
		f414_local0 = f414_local0:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( f414_arg2, f414_local0, "EndGamePopup" )
end

function SendClientScriptDebugMenuNotify( f415_arg0, f415_arg1, f415_arg2 )
	local f415_local0 = f415_arg0.cscDebugMenuList
	Engine.SendClientScriptNotify( f415_arg2, "script_debug_menu", Engine.GetModelValue( f415_arg1:getModel( f415_arg2, "name" ) ), f415_arg1.gridInfoTable.zeroBasedIndex + 1 )
end

function SendClientScriptDebugMenuCloseMenuNotify( f416_arg0, f416_arg1, f416_arg2 )
	Engine.SendClientScriptNotify( f416_arg2, "script_debug_menu", "close" )
end

function ProcessPlayerCallout( f417_arg0, f417_arg1, f417_arg2 )
	Engine.UpdateCalloutPlayerData( f417_arg1, Engine.GetModelValue( Engine.GetModel( f417_arg2, "arg1" ) ), Engine.GetModelValue( Engine.GetModel( f417_arg2, "arg2" ) ) )
	f417_arg0:playClip( "Side" )
end

function ProcessPlayerObituaryCallout( f418_arg0, f418_arg1, f418_arg2 )
	f418_arg0:playClip( "SlideUp" )
end

function SetMPScoreText( f419_arg0, f419_arg1, f419_arg2, f419_arg3 )
	local f419_local0 = CoD.GetScriptNotifyData( f419_arg3 )
	local f419_local1 = Engine.GetIString( f419_local0[1], "CS_LOCALIZED_STRINGS" )
	local f419_local2 = f419_local0[2]
	if Engine.IsDemoPlaying() == false or CoD.isZombie == false then
		f419_arg1:AddCenterScore( f419_local1, f419_local2 )
		if HasPerk( f419_arg2, "specialty_combat_efficiency" ) then
			local f419_local3 = f419_local0[3]
			if f419_local3 > 0 then
				f419_arg1:AddCombatEfficiencyScore( f419_arg0, f419_local3, f419_arg2 )
			end
			if f419_local3 < f419_local2 then
				f419_arg1:AddCombatEfficiencyScore( f419_arg0, f419_local2 - f419_local3, f419_arg2 )
			end
		end
	end
end

function TryBootHUD( f420_arg0, f420_arg1 )
	if not f420_arg0.hasBooted then
		f420_arg0:addElement( LUI.UITimer.new( f420_arg1, "hud_boot", true, f420_arg0 ) )
	end
end

function SetHudHasBooted( f421_arg0 )
	f421_arg0.hasBooted = true
end

function AddResourceEnergyBar( f422_arg0, f422_arg1, f422_arg2, f422_arg3 )
	local f422_local0 = string.sub( f422_arg3.name, -1, -1 )
	if f422_arg3.newValue == 1 then
		local f422_local1 = CoD.ResourceEnergyBar.new()
		f422_local1:setupEntity( f422_arg2, f422_arg3.entNum, f422_local0 )
		f422_arg0:addElement( f422_local1 )
	elseif f422_arg3.newValue == 0 then
		f422_arg1:removeEntity( f422_arg3.entNum )
	end
end

function AddWarlordArmorRegenerationBar( f423_arg0, f423_arg1, f423_arg2, f423_arg3 )
	local f423_local0 = string.sub( f423_arg3.name, -1, -1 )
	if f423_arg3.newValue == 1 then
		local f423_local1 = CoD.WarlordArmorRegenerationBar.new()
		f423_local1:setupEntity( f423_arg2, f423_arg3.entNum, f423_local0 )
		f423_arg0:addElement( f423_local1 )
	elseif f423_arg3.newValue == 0 then
		f423_arg1:removeEntity( f423_arg3.entNum )
	end
end

function AddKillstreakReceivedNotification( f424_arg0, f424_arg1, f424_arg2, f424_arg3 )
	if IsCodCaster( f424_arg2 ) and not IsCodCasterProfileValueEqualTo( f424_arg2, "shoutcaster_scorestreaks_notification", 1 ) then
		return 
	elseif f424_arg1.appendNotification ~= nil then
		local f424_local0 = CoD.GetScriptNotifyData( f424_arg3 )
		f424_arg1:appendNotification( {
			title = Engine.ToUpper( Engine.Localize( "MENU_KILLSTREAK_READY", Engine.Localize( Engine.GetItemName( f424_local0[1] ) ) ) ),
			description = Engine.Localize( "MENU_ACTIVATE_KILLSTREAK_INSTR" ),
			type = "Killstreak",
			priority = 0
		} )
	end
end

function AddHeroAbilityReceivedNotification( f425_arg0, f425_arg1, f425_arg2, f425_arg3 )
	if IsCodCaster( f425_arg2 ) and not IsCodCasterProfileValueEqualTo( f425_arg2, "shoutcaster_specialist_notification", 1 ) then
		return 
	elseif f425_arg1.appendNotification ~= nil then
		local f425_local0 = CoD.GetScriptNotifyData( f425_arg3 )
		local f425_local1 = Engine.GetItemName( f425_local0[1] )
		local f425_local2 = Engine.ToUpper( Engine.Localize( "MENU_HERO_ABILITY_READY", Engine.ToUpper( Engine.Localize( f425_local1 ) ) ) )
		local f425_local3 = Engine.Localize( "MENU_ACTIVATE_HERO_ABILITY_INSTR" )
		if f425_local1 == "WEAPON_GADGET_RESURRECT" then
			f425_local3 = Engine.Localize( "MENU_ACTIVATE_REJACK_INSTR" )
		end
		f425_arg1:appendNotification( {
			title = f425_local2,
			description = f425_local3,
			type = "Ability",
			priority = 1
		} )
	end
end

function AddZombieNotification( f426_arg0, f426_arg1, f426_arg2 )
	local f426_local0 = CoD.GetScriptNotifyData( f426_arg2 )
	f426_arg1:appendNotification( {
		clip = "TextandImageBasic",
		title = Engine.Localize( Engine.GetIString( f426_local0[1], "CS_LOCALIZED_STRINGS" ) ),
		description = ""
	} )
end

function AddZombieBGBNotification( f427_arg0, f427_arg1, f427_arg2 )
	local f427_local0 = CoD.GetScriptNotifyData( f427_arg2 )
	local f427_local1 = f427_local0[1]
	local f427_local2 = Engine.GetItemName( f427_local1 )
	f427_arg1:appendNotification( {
		clip = "TextandImageBGB",
		title = Engine.Localize( f427_local2 ),
		description = Engine.Localize( f427_local2 .. "_hint" ),
		bgbImage = RegisterImage( GetItemImageFromIndex( f427_local1 ) )
	} )
end

function AddZombieBGBTokenNotification( f428_arg0, f428_arg1, f428_arg2 )
	f428_arg0:playSound( "zmb_bgb_token" )
	f428_arg1:appendNotification( {
		clip = "TextandImageBGBToken",
		title = Engine.Localize( "ZMUI_BGB_TOKEN_AWARD_NOTIFICATION_TITLE" ),
		description = Engine.Localize( "ZMUI_BGB_TOKEN_AWARD_NOTIFICATION_DESC" ),
		bgbImage = RegisterImage( "t7_hud_zm_vial_256" )
	} )
end

function CreatePrematchTimer( f429_arg0, f429_arg1, f429_arg2 )
	local f429_local0 = CoD.GetScriptNotifyData( f429_arg2 )
	local f429_local1 = f429_local0[1]
	if f429_local1 and not f429_arg0.PrematchCountdown then
		local f429_local2 = CoD.PrematchCountdown.new( f429_arg0, f429_arg1 )
		f429_local2:setupCountdown( f429_local1, f429_arg1 )
		f429_local2:setLeftRight( false, false, -640, 640 )
		f429_local2:setTopBottom( false, false, -360, 360 )
		f429_local2:addElementBefore( f429_arg0.WaypointBase )
		f429_arg0.PrematchCountdown = f429_local2
		LUI.OverrideFunction_CallOriginalSecond( f429_arg0, "close", function ( element )
			if element.PrematchCountdown then
				element.PrematchCountdown:close()
			end
		end )
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f429_arg1 ), "isInPrematchPeriod" ), 1 )
end

function CreateRejackTimer( f431_arg0, f431_arg1, f431_arg2 )
	local f431_local0 = CoD.GetScriptNotifyData( f431_arg2 )
	local f431_local1 = f431_local0[1]
	f431_arg0.rejackWidget = CoD.Rejack.new( f431_arg0, f431_arg1 )
	f431_arg0:addElement( f431_arg0.rejackWidget )
	f431_arg0.rejackWidget.RejackInternal:startHeartBeatAnimation( f431_arg1, f431_local1 )
end

function HandleScoreStreakDpadRight( f432_arg0, f432_arg1 )
	if f432_arg0:isInFocus() then
		if not f432_arg0:hasClip( "Focus" ) then
			Engine.SwitchToInventoryWeapon( f432_arg1 )
		else
			local f432_local0 = Engine.GetModelValue( Engine.GetModel( f432_arg0:getModel(), "rewardSlot" ) )
			if f432_local0 ~= nil then
				Engine.ActionSlotSelectWeapon( f432_arg1, f432_local0 )
			else
				Engine.SwitchToInventoryWeapon( f432_arg1 )
			end
		end
	end
end

function MakeRaidPurchase( f433_arg0, f433_arg1, f433_arg2 )
	Engine.SendMenuResponse( f433_arg2, "raid_purchase", Engine.GetModelValue( f433_arg1:getModel( f433_arg2, "name" ) ) )
end

function CancelRaidPurchase( f434_arg0, f434_arg1, f434_arg2 )
	Engine.SendMenuResponse( f434_arg2, "raid_purchase", "none" )
end

function UpdateEnabledText( f435_arg0, f435_arg1, f435_arg2 )
	Engine.SetModelValue( f435_arg1:getModel( f435_arg2, "description" ), Engine.Localize( Engine.GetModelValue( f435_arg1:getModel( f435_arg2, "enabledDescription" ) ) ) )
end

function UpdateDisableReason( f436_arg0, f436_arg1, f436_arg2 )
	local f436_local0 = f436_arg0:getModel( f436_arg2, "disable_" .. Engine.GetModelValue( f436_arg1:getModel( f436_arg2, "id" ) ) )
	local f436_local1 = f436_arg1:getModel( f436_arg2, "description" )
	if f436_local0 ~= nil then
		Engine.SetModelValue( f436_local1, Engine.Localize( Engine.GetModelValue( f436_local0 ) ) )
	else
		Engine.SetModelValue( f436_local1, Engine.Localize( Engine.GetModelValue( f436_arg1:getModel( f436_arg2, "enabledDescription" ) ) ) )
	end
end

local f0_local5 = function ( f437_arg0, f437_arg1 )
	local f437_local0 = {}
	while f437_arg1 and f437_arg1 ~= f437_arg0 do
		table.insert( f437_local0, f437_arg1 )
		f437_arg1 = f437_arg1:getParent()
	end
	if #f437_local0 >= 1 then
		return f437_local0[#f437_local0]
	else
		return initialElement
	end
end

function SelectNextItemIfPossible( f438_arg0, f438_arg1, f438_arg2 )
	local f438_local0 = f0_local5( f438_arg0, f438_arg1 )
	return f438_local0:navigateItemRight()
end

function SelectNextItemIfPossibleAndNotDisabled( f439_arg0, f439_arg1, f439_arg2 )
	local f439_local0 = f0_local5( f439_arg0, f439_arg1 )
	local f439_local1 = f439_local0:getItemAtOffset( 0, 1 )
	if f439_local1 and Engine.GetModelValue( f439_local1:getModel( f439_arg2, "disabled" ) ) == true then
		return false
	else
		return f439_local0:navigateItemRight()
	end
end

function SelectPreviousItemIfPossible( f440_arg0, f440_arg1, f440_arg2 )
	local f440_local0 = f0_local5( f440_arg0, f440_arg1 )
	if f440_local0.hCount and f440_local0.hCount == 1 then
		return f440_local0:navigateItemUp()
	else
		return f440_local0:navigateItemLeft()
	end
end

function SelectPreviousItemIfPossibleAndNotDisabled( f441_arg0, f441_arg1, f441_arg2 )
	local f441_local0 = f0_local5( f441_arg0, f441_arg1 )
	local f441_local1 = f441_local0:getItemAtOffset( 0, -1 )
	if f441_local1 and Engine.GetModelValue( f441_local1:getModel( f441_arg2, "disabled" ) ) == true then
		return false
	else
		return f441_local0:navigateItemLeft()
	end
end

function SelectAboveItemIfPossible( f442_arg0, f442_arg1, f442_arg2 )
	local f442_local0 = f0_local5( f442_arg0, f442_arg1 )
	return f442_local0:navigateItemUp()
end

function SelectAboveItemIfPossibleAndNotDisabled( f443_arg0, f443_arg1, f443_arg2 )
	local f443_local0 = f0_local5( f443_arg0, f443_arg1 )
	local f443_local1 = f443_local0:getItemAtOffset( -1, 0 )
	if f443_local1 and Engine.GetModelValue( f443_local1:getModel( f443_arg2, "disabled" ) ) == true then
		return false
	else
		return f443_local0:navigateItemUp()
	end
end

function SelectBelowItemIfPossible( f444_arg0, f444_arg1, f444_arg2 )
	local f444_local0 = f0_local5( f444_arg0, f444_arg1 )
	return f444_local0:navigateItemDown()
end

function SelectBelowItemIfPossibleAndNotDisabled( f445_arg0, f445_arg1, f445_arg2 )
	local f445_local0 = f0_local5( f445_arg0, f445_arg1 )
	local f445_local1 = f445_local0:getItemAtOffset( 1, 0 )
	if f445_local1 and Engine.GetModelValue( f445_local1:getModel( f445_arg2, "disabled" ) ) == true then
		return false
	else
		return f445_local0:navigateItemDown()
	end
end

function SelectItemIfPossible( f446_arg0, f446_arg1, f446_arg2, f446_arg3 )
	f446_arg1:setActiveItem( f446_arg3.element )
end

function ProcessListAction( f447_arg0, f447_arg1, f447_arg2 )
	if f447_arg1.disabled then
		return 
	end
	local f447_local0 = f447_arg1:getModel( f447_arg2, "action" )
	local f447_local1 = f447_arg1:getModel( f447_arg2, "param" )
	local f447_local2, f447_local3 = nil
	if f447_local0 then
		f447_local2 = Engine.GetModelValue( f447_local0 )
		if f447_local1 then
			f447_local3 = Engine.GetModelValue( f447_local1 )
		end
	else
		f447_local2 = f447_arg1.action
		f447_local3 = f447_arg1.actionParam
	end
	if f447_local2 then
		f447_local2( f447_arg0, f447_arg1, f447_arg2, f447_local3, f447_arg1.gridInfoTable.parentGrid.menu )
	end
end

function ProcessClassOptionAction( f448_arg0, f448_arg1, f448_arg2, f448_arg3 )
	if f448_arg1.disabled then
		return 
	end
	local f448_local0, f448_local1 = nil
	f448_local0 = f448_arg3.actionButtonFn
	f448_local1 = f448_arg1.actionParam
	if f448_local0 then
		f448_local0( f448_arg0, f448_arg1, f448_arg2, f448_local1, f448_arg1.gridInfoTable.parentGrid.menu )
	end
end

function ProcessKeyboardCompleteAction( f449_arg0, f449_arg1, f449_arg2, f449_arg3 )
	if f449_arg1.disabled then
		return 
	end
	local f449_local0, f449_local1 = nil
	f449_local0 = f449_arg3.keyboardCompleteFn
	if f449_local0 then
		f449_local0( f449_arg0, f449_arg1, f449_arg2, f449_arg3 )
	end
end

function ProcessConfirmVariantNameAction( f450_arg0, f450_arg1, f450_arg2, f450_arg3 )
	if f450_arg1.disabled then
		return 
	end
	local f450_local0, f450_local1 = nil
	f450_local0 = f450_arg3.confirmVariantNameFn
	if f450_local0 then
		f450_local0( f450_arg0, f450_arg1, f450_arg2, f450_arg3 )
	end
end

function UpdateDataSource( f451_arg0, f451_arg1, f451_arg2 )
	f451_arg1:updateDataSource()
end

function UpdateElementDataSource( f452_arg0, f452_arg1 )
	if f452_arg0[f452_arg1] then
		f452_arg0[f452_arg1]:updateDataSource()
	end
end

function SetAsListVerticalCounter( f453_arg0, f453_arg1, f453_arg2 )
	if f453_arg0[f453_arg2] then
		f453_arg0[f453_arg2]:addCustomVerticalCounter( f453_arg1 )
	end
end

function SetAsListHorizontalCounter( f454_arg0, f454_arg1, f454_arg2 )
	if f454_arg0[f454_arg2] then
		f454_arg0[f454_arg2]:addCustomHorizontalCounter( f454_arg1 )
	end
end

function DisableDPadNavigation( f455_arg0, f455_arg1, f455_arg2 )
	if f455_arg0[f455_arg1] then
		f455_arg0[f455_arg1]:disableDPadNav( f455_arg2 )
	end
end

function SetupTabs( f456_arg0, f456_arg1, f456_arg2 )
	f456_arg0:AddButtonCallbackFunction( f456_arg0, f456_arg2, Enum.LUIButton.LUI_KEY_LB, nil, function ( element, menu, controller, model )
		if not PropertyIsTrue( f456_arg1, "m_disableNavigation" ) then
			f456_arg1:navigateItemLeft()
		end
	end, AlwaysFalse, false )
	f456_arg0:AddButtonCallbackFunction( f456_arg0, f456_arg2, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		if not PropertyIsTrue( f456_arg1, "m_disableNavigation" ) then
			f456_arg1:navigateItemRight()
		end
	end, AlwaysFalse, false )
end

function HideWidget( f459_arg0 )
	f459_arg0:setAlpha( 0 )
end

function ShowWidget( f460_arg0 )
	f460_arg0:setAlpha( 1 )
end

function DisableWidget( f461_arg0, f461_arg1 )
	f461_arg0[f461_arg1].m_disableNavigation = true
	f461_arg0[f461_arg1]:makeNotFocusable()
	f461_arg0[f461_arg1]:setAlpha( 0 )
end

function SetBackFromCustomClass( f462_arg0 )
	CoD.CACUtility.FromCustomClass = true
end

function GetCustomClassModel( f463_arg0 )
	CoD.CACUtility.GetCustomClassModel( f463_arg0, CoD.perController[f463_arg0].classNum, CoD.perController[f463_arg0].classModel )
end

function ChangeCustomClassPane( f464_arg0, f464_arg1, f464_arg2 )
	local f464_local0 = f464_arg0.CustomClassPanelMover0
	if f464_local0 then
		if f464_local0.elementsPlayingClips > 0 then
			return 
		end
		local f464_local1 = f464_local0.currentState
		local f464_local2 = nil
		if f464_local1 == "Wildcards" then
			if f464_arg2 == "right" then
				f464_local2 = "Weapons"
			end
		elseif f464_local1 == "Weapons" then
			if f464_arg2 == "left" then
				f464_local2 = "Wildcards"
			elseif f464_arg2 == "right" then
				f464_local2 = "Equipment"
			end
		elseif f464_local1 == "Equipment" then
			if f464_arg2 == "left" then
				f464_local2 = "Weapons"
			elseif f464_arg2 == "right" then
				f464_local2 = "Perks"
			end
		elseif f464_local1 == "Perks" and f464_arg2 == "left" then
			f464_local2 = "Equipment"
		end
		if f464_local2 then
			f464_arg0:navigateToTab( f464_local2, f464_arg2 )
		end
	end
end

function ResetCustomClassStartingFocus( f465_arg0, f465_arg1, f465_arg2, f465_arg3 )
	if f465_arg3 or Engine.GetModelValue( Engine.GetModel( f465_arg1:getModel(), "classNum" ) ) ~= CoD.CACUtility.CustomClass_LastClassNum then
		CoD.CACUtility.CustomClass_LastClassNum = 0
		CoD.CACUtility.CustomClass_LastSelection = "primary"
		CoD.CACUtility.CustomClass_PerClassLastSelection = {}
	end
end

function ChangeClass( f466_arg0, f466_arg1, f466_arg2 )
	f466_arg0:saveState()
	f466_arg0.menuResponseSent = true
	local f466_local0 = Engine.GetModelValue( f466_arg1:getModel( f466_arg2, "classNum" ), nil )
	local f466_local1 = Engine.GetModelValue( f466_arg1:getModel( f466_arg2, "defaultClassName" ), nil )
	local f466_local2 = f466_local0
	local f466_local3 = ""
	if f466_local1 ~= nil then
		f466_local3 = string.lower( f466_local1 )
		f466_local0 = Engine.GetClassIndexFromName( f466_local1 )
	else
		f466_local3 = "custom" .. f466_local0
	end
	if CanUseSharedLoadouts( f466_arg2 ) then
		local f466_local4 = Engine.GetModel( Engine.GetModelForController( f466_arg2 ), "ChooseClassCPClientMenu" )
		if f466_local4 then
			local f466_local5 = Engine.CreateModel( f466_local4, "selectedClientIndex" )
			if f466_local5 then
				local f466_local6 = Engine.GetModelValue( f466_local5 )
				if f466_local6 ~= nil then
					local f466_local7 = Engine.GetModel( f466_local4, "client" .. f466_local6 )
					if f466_local7 then
						local f466_local8 = Engine.GetModelValue( Engine.GetModel( f466_local7, "xuid" ) )
						if Engine.IsSharedLoadoutAvailableForClient( f466_arg2, f466_local8 ) then
							f466_local3 = f466_local3 .. "," .. Engine.GetLobbyClientNumByXUID( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME, f466_local8 )
						end
					end
				end
			end
		end
	end
	Engine.SendMenuResponse( f466_arg2, CoD.ChangeClassMenuName, f466_local3 )
	CoD.CACUtility.SetProfileLoadoutChoice( f466_arg2, f466_local0 )
	HUD_IngameMenuClosed()
	Engine.StreamSetCustomClass( f466_arg2, f466_local2 )
end

function ChangeClass_TrainingSim( f467_arg0, f467_arg1, f467_arg2 )
	f467_arg0:saveState()
	f467_arg0.menuResponseSent = true
	local f467_local0 = 9
	local f467_local1 = f467_local0
	Engine.SendMenuResponse( f467_arg2, "chooseClass_TrainingSim", "custom9" )
	CoD.CACUtility.SetProfileLoadoutChoice( f467_arg2, f467_local0 )
	HUD_IngameMenuClosed()
	Engine.StreamSetCustomClass( f467_arg2, f467_local1 )
end

function CloseChangeClass_TrainingSim( f468_arg0, f468_arg1, f468_arg2 )
	CoD.CACUtility.ResetCPCustomClasses( f468_arg2 )
end

function UpdateClassView( f469_arg0, f469_arg1, f469_arg2 )
	local f469_local0 = f469_arg1:getModel()
	CoD.perController[f469_arg2].classModel = f469_local0
	f469_arg0:setModel( f469_local0, f469_arg2 )
end

function SetBubblegumPackIndex( f470_arg0, f470_arg1, f470_arg2 )
	local f470_local0 = f470_arg1:getModel()
	CoD.perController[f470_arg2].bgbPackIndex = f470_arg1.bgbPackIndex
	CoD.perController[f470_arg2].bubbleGumPackModel = f470_local0
	f470_arg0:setModel( f470_local0, f470_arg2 )
end

function SetCustomClassNum( f471_arg0, f471_arg1, f471_arg2 )
	local f471_local0 = f471_arg1:getModel()
	CoD.perController[f471_arg2].classNum = f471_arg1.classNum
	CoD.perController[f471_arg2].classModel = f471_local0
	f471_arg0:setModel( f471_local0, f471_arg2 )
end

function SetCustomParentClassNum( f472_arg0, f472_arg1, f472_arg2 )
	local f472_local0 = f472_arg1:getModel()
	CoD.perController[f472_arg2].classNum = f472_arg1.classNum
	CoD.perController[f472_arg2].classModel = f472_local0
	local f472_local1 = f472_arg0:getParent()
	if f472_local1 then
		f472_local1:setModel( f472_local0, f472_arg2 )
	end
end

local f0_local6 = function ( f473_arg0, f473_arg1, f473_arg2 )
	local f473_local0 = Engine.GetModel( Engine.GetModelForController( f473_arg2 ), "CustomClassList.class1" )
	CoD.perController[f473_arg2].classNum = 9
	CoD.perController[f473_arg2].classModel = f473_local0
	f473_arg0:setModel( f473_local0, f473_arg2 )
end

SetCustomClassNum_TrainingSim = f0_local6
f0_local6 = function ( f474_arg0, f474_arg1, f474_arg2 )
	local f474_local0 = CoD.perController[f474_arg1].classNum
	local f474_local1 = CoD.perController[f474_arg1].classModel
	local f474_local2 = Engine.GetModelValue( Engine.GetModel( Engine.GetModel( f474_local1, f474_arg0 ), "itemIndex" ) )
	if CoD.CACUtility.EmptyItemIndex < f474_local2 then
		local f474_local3 = Engine.GetItemRef( f474_local2 )
		CoD.SetClassItem( f474_arg1, f474_local0, f474_arg0, CoD.CACUtility.EmptyItemIndex )
		if f474_local3 == "bonuscard_perk_1_greed" and not f474_arg2 then
			f0_local6( "specialty4", f474_arg1 )
		elseif f474_local3 == "bonuscard_perk_2_greed" and not f474_arg2 then
			f0_local6( "specialty5", f474_arg1 )
		elseif f474_local3 == "bonuscard_perk_3_greed" and not f474_arg2 then
			f0_local6( "specialty6", f474_arg1 )
		elseif LUI.startswith( f474_local3, "bonuscard_primary_gunfighter" ) then
			local f474_local4 = CoD.CACUtility.PrimaryGunfighterEquippedCount( f474_local1 )
			f0_local6( "primaryattachment6", f474_arg1 )
			if f474_local4 < 2 then
				f0_local6( "primaryattachment5", f474_arg1 )
				if f474_local4 < 1 then
					f0_local6( "primaryattachment4", f474_arg1 )
				end
			end
		elseif f474_local3 == "bonuscard_secondary_gunfighter" then
			f0_local6( "secondaryattachment3", f474_arg1 )
		elseif f474_local3 == "bonuscard_overkill" then
			f0_local6( "secondary", f474_arg1 )
			if Engine.IsCampaignGame() then
				CoD.SetClassItem( f474_arg1, f474_local0, "secondary", tonumber( Engine.TableLookup( f474_arg1, CoD.statsTable, 4, "pistol_standard", 0 ) ) )
			end
		elseif f474_local3 == "bonuscard_two_tacticals" then
			f0_local6( "primarygadget", f474_arg1 )
		elseif f474_local3 == "bonuscard_danger_close" then
			if not CoD.CACUtility.IsBonusCardEquipped( "bonuscard_two_tacticals", f474_local1 ) then
				f0_local6( "primarygadgetattachment1", f474_arg1 )
			end
		elseif f474_arg0 == "primary" or f474_arg0 == "secondary" then
			for f474_local8, f474_local9 in ipairs( CoD.CACUtility.GetAttachmentListForSlot( f474_arg0 ) ) do
				f0_local6( f474_local9, f474_arg1 )
			end
			for f474_local8, f474_local9 in pairs( CoD.CACUtility.weaponOptionGroupNames ) do
				local f474_local10 = f474_arg0 .. f474_local9
				if Engine.GetModel( f474_local1, f474_local10 ) then
					CoD.SetClassItem( f474_arg1, f474_local0, f474_local10, CoD.CACUtility.EmptyItemIndex )
				end
			end
			for f474_local9, f474_local10 in ipairs( CoD.CACUtility.GetCACWeaponACVList( f474_arg0 ) ) do
				f0_local6( f474_local10, f474_arg1 )
			end
			CoD.SetClassItem( f474_arg1, f474_local0, f474_arg0 .. "paintjobslot", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
			CoD.SetClassItem( f474_arg1, f474_local0, f474_arg0 .. "paintjobindex", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
			CoD.SetClassItem( f474_arg1, f474_local0, f474_arg0 .. CoD.CACUtility[f474_arg0 .. "WeaponPrestigeSlot"], CoD.CACUtility.EmptyItemIndex )
		elseif f474_arg0 == "primarygadget" or f474_arg0 == "secondarygadget" or f474_arg0 == "specialgadget" then
			local f474_local4 = CoD.CACUtility.PrimaryGadgetAttachmentSlotNameList
			if f474_arg0 == "secondarygadget" then
				f474_local4 = CoD.CACUtility.SecondaryGadgetAttachmentSlotNameList
			elseif f474_arg0 == "specialgadget" then
				f474_local4 = CoD.CACUtility.SpecialGadgetAttachmentSlotNameList
			end
			for f474_local8, f474_local9 in ipairs( f474_local4 ) do
				f0_local6( f474_local9, f474_arg1 )
			end
		elseif LUI.startswith( f474_arg0, "primaryattachment" ) or LUI.startswith( f474_arg0, "secondaryattachment" ) then
			local f474_local4 = "primary"
			if LUI.startswith( f474_arg0, "secondary" ) then
				f474_local4 = "secondary"
			end
			local f474_local5 = Engine.GetModel( f474_local1, f474_local4 .. ".itemIndex" )
			if f474_local5 then
				local f474_local7 = Engine.GetAttachmentRef( Engine.GetModelValue( f474_local5 ), f474_local2 )
				if f474_local7 then
					local f474_local8 = f474_local4 .. f474_local7
					if CoD.CACUtility.AttachmentHasCustomReticle( f474_local7 ) then
						f474_local8 = f474_local4 .. "reticle"
					end
					if Engine.GetModel( f474_local1, f474_local8 ) then
						CoD.SetClassItem( f474_arg1, f474_local0, f474_local8, CoD.CACUtility.EmptyItemIndex )
					end
				end
			end
			local f474_local6 = f474_arg0 .. "cosmeticvariant"
			if Engine.GetModel( f474_local1, f474_local6 ) then
				CoD.SetClassItem( f474_arg1, f474_local0, f474_local6, CoD.CACUtility.EmptyItemIndex )
			end
		end
		CoD.CACUtility.GetCustomClassModel( f474_arg1, f474_local0, f474_local1 )
		return true
	else
		return false
	end
end

local f0_local7 = function ( f475_arg0, f475_arg1 )
	if not LUI.startswith( f475_arg0, "bonuscard" ) then
		return false
	elseif Engine.GetItemRef( f475_arg1 ) == "bonuscard_primary_gunfighter" then
		return true
	else
		return false
	end
end

local f0_local8 = function ( f476_arg0, f476_arg1, f476_arg2, f476_arg3, f476_arg4, f476_arg5, f476_arg6 )
	local f476_local0 = CoD.perController[f476_arg1].classModel
	local f476_local1 = false
	local f476_local2 = nil
	if f476_arg0.getEquippedLoadoutSlot then
		f476_local2 = f476_arg0:getEquippedLoadoutSlot( f476_arg1, f476_arg5 )
	end
	local f476_local3 = Engine.GetModel( f476_arg2, "allocationSpent" )
	if not f476_local3 then
		f476_local3 = Engine.GetModel( f476_local0, "allocationSpent" )
	end
	local f476_local4 = CoD.CACUtility.GetMutuallyExclusiveSlotName( f476_arg4, f476_arg1, f476_arg5 )
	for f476_local5 = 1, #f476_local4, 1 do
		local f476_local8 = f476_local4[f476_local5]
		if f476_local8 ~= "" and (not f476_local2 or f476_local2 ~= mutuallyExclusiveItemSlot) then
			if Engine.IsCampaignGame() and (f476_local8 == "primary" or f476_local8 == "secondary") then
				return true
			end
			f0_local6( f476_local8, f476_arg1 )
		end
	end
	local f476_local5 = CoD.GetClassItem( f476_arg1, f476_arg3, f476_arg4 )
	CoD.perController[f476_arg1].overCapacityItemIndex = nil
	local f476_local6 = false
	if CoD.CACUtility.EmptyItemIndex < f476_local5 or f476_local2 then
		f476_local6 = true
		if not f476_local2 then
			f476_local2 = f476_arg4
		end
		local f476_local7 = Engine.GetItemRef( f476_local5 )
		if f476_local7 == "bonuscard_perk_1_greed" then
			f0_local6( "specialty4", f476_arg1 )
		elseif f476_local7 == "bonuscard_perk_2_greed" then
			f0_local6( "specialty5", f476_arg1 )
		elseif f476_local7 == "bonuscard_perk_3_greed" then
			f0_local6( "specialty6", f476_arg1 )
		elseif f476_local7 == "bonuscard_primary_gunfighter" then
			local f476_local9 = CoD.CACUtility.SpecificWildcardEquippedCount( f476_local0, "bonuscard_primary_gunfighter" )
			f0_local6( "primaryattachment6", f476_arg1 )
			if f476_local9 <= 2 then
				f0_local6( "primaryattachment5", f476_arg1 )
				if f476_local9 <= 1 then
					f0_local6( "primaryattachment4", f476_arg1 )
				end
			end
		elseif f476_local7 == "bonuscard_secondary_gunfighter" then
			f0_local6( "secondaryattachment3", f476_arg1 )
		elseif f476_local7 == "bonuscard_overkill" then
			f0_local6( "secondary", f476_arg1 )
			if Engine.IsCampaignGame() then
				CoD.SetClassItem( f476_arg1, f476_arg3, "secondary", tonumber( Engine.TableLookup( f476_arg1, CoD.statsTable, 4, "pistol_standard", 0 ) ) )
			end
		elseif f476_local7 == "bonuscard_two_tacticals" then
			f0_local6( "primarygadget", f476_arg1 )
		elseif f476_local7 == "bonuscard_danger_close" and not CoD.CACUtility.IsBonusCardEquipped( "bonuscard_two_tacticals", f476_local0 ) then
			f0_local6( "primarygadgetattachment1", f476_arg1 )
		end
		f0_local6( f476_local2, f476_arg1, f476_local6 )
		f476_local1 = true
	end
	if not f476_local6 then
		if IsCampaign() or Engine.GetModelValue( f476_local3 ) < Engine.GetMaxAllocation( f476_arg1 ) then
			f476_local1 = true
		else
			CoD.perController[f476_arg1].overCapacityItemIndex = f476_arg5
			local f476_local9 = OpenPopup( f476_arg0, "OverCapacity", f476_arg1 )
			f476_local9.acceptData = {
				classNum = f476_arg3,
				slotName = f476_arg4,
				itemIndex = f476_arg5
			}
			return false
		end
	end
	if f476_local1 == true and CoD.CACUtility.EmptyItemIndex < f476_arg5 then
		f476_local7 = Engine.GetItemRef( f476_arg5 )
		if f476_local7 == "bonuscard_overkill" then
			f0_local6( "secondary", f476_arg1 )
			if Engine.IsCampaignGame() then
				local f476_local8 = CoD.GetClassItem( f476_arg1, f476_arg3, CoD.CACUtility.loadoutSlotNames.primaryWeapon )
				local f476_local10 = tonumber( Engine.TableLookup( f476_arg1, CoD.statsTable, 4, "smg_standard", 0 ) )
				if f476_local8 == f476_local10 then
					CoD.SetClassItem( f476_arg1, f476_arg3, "secondary", tonumber( Engine.TableLookup( f476_arg1, CoD.statsTable, 4, "ar_standard", 0 ) ) )
				else
					CoD.SetClassItem( f476_arg1, f476_arg3, "secondary", f476_local10 )
				end
			end
		elseif f476_local7 == "bonuscard_two_tacticals" then
			f0_local6( "primarygadget", f476_arg1 )
		end
		CoD.SetClassItem( f476_arg1, f476_arg3, f476_arg4, f476_arg5 )
	end
	if not f476_arg6 then
		CoD.CACUtility.GetCustomClassModel( f476_arg1, f476_arg3, f476_local0 )
	end
	return f476_local1
end

function PrestigeWeapon( f477_arg0, f477_arg1, f477_arg2 )
	local f477_local0 = f477_arg1:getModel( f477_arg2, "itemIndex" )
	if f477_local0 then
		CoD.OverlayUtility.CreateOverlay( f477_arg2, f477_arg0, "PrestigeWeapon", f477_arg2, f477_local0 )
	end
end

local f0_local9 = function ( f478_arg0, f478_arg1, f478_arg2 )
	local f478_local0 = f478_arg0.weaponSlotTable[f478_arg2]
	if not f478_local0 then
		return 
	end
	local f478_local1 = f478_local0.widget:getModel( f478_arg1, "weaponSlot" )
	local f478_local2 = f478_arg0:getModel()
	if f478_local1 and f478_local2 then
		local f478_local3 = Engine.GetModelValue( f478_local1 )
		local f478_local4, f478_local5, f478_local6 = CoD.CACUtility.GetCACSlotStatus( f478_arg1, f478_local2, f478_local3 )
		local f478_local7 = CoD.perController[f478_arg1].classNum
		local f478_local8 = false
		if f478_local4 == CoD.CACUtility.CACStatusAvailable.AVAILABLE then
			if f478_local5 then
				f0_local6( f478_local3, f478_arg1 )
				f478_arg0:playSound( "unequip_item" )
			else
				local f478_local9 = "primarygadget"
				if not LUI.startswith( f478_local3, f478_local9 ) then
					f478_local9 = "secondarygadget"
				end
				local f478_local10 = f478_arg0:getModel( f478_arg1, f478_local9 .. ".itemIndex" )
				if f478_local10 then
					local f478_local11 = Engine.GetModelValue( f478_local10 )
					local f478_local12 = Engine.GetNumGadgetAttachments( f478_local11, false )
					for f478_local13 = 1, f478_local12, 1 do
						if Engine.IsTakeTwoGadgetAttachment( f478_local11, f478_local13 ) then
							f478_local8 = f0_local8( f478_arg0, f478_arg1, f478_local2, f478_local7, f478_local3, f478_local13 )
							UpdateButtonPromptState( f478_arg0, element, f478_arg1, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
							f478_arg0:playSound( "equip_mod" )
						end
					end
				end
			end
			f478_arg0:processEvent( {
				name = "update_state",
				controller = f478_arg1
			} )
			f478_arg0:processEvent( {
				name = "update_button_prompts",
				controller = f478_arg1
			} )
			local f478_local9 = nil
			local f478_local10 = "select01"
			if LUI.startswith( f478_arg2, "primarygadgetattachment" ) then
				f478_local9 = Engine.GetWeaponString( f478_arg1, f478_local7, "primarygadget" )
			elseif LUI.startswith( f478_arg2, "secondarygadgetattachment" ) then
				f478_local9 = Engine.GetWeaponString( f478_arg1, f478_local7, "secondarygadget" )
			end
			if f478_local5 or f478_local8 == false then
				Engine.SendClientScriptNotify( f478_arg1, "CustomClass_remove" .. CoD.GetLocalClientAdjustedNum( f478_arg1 ) )
			elseif f478_local9 and f478_local9 ~= "" then
				Engine.SendClientScriptNotify( f478_arg1, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f478_arg1 ), f478_arg2, f478_local9, f478_local10 )
			end
		end
	end
end

function NavigateToLoadoutMenu( f479_arg0, f479_arg1 )
	local f479_local0 = f479_arg0.currentActiveSlot
	if f479_local0 then
		CoD.perController[f479_arg1].weaponCategory = f479_local0
		CoD.perController[f479_arg1].weaponClassGroup = f479_local0
		CoD.perController[f479_arg1].CACSpecficModelValueFocusTable = nil
		CoD.perController[f479_arg1].CACWildcardContextualMenu = nil
		CoD.perController[f479_arg1].wildcardOverCapacityRefName = nil
		local f479_local1 = CoD.perController[f479_arg1].classNum
		local f479_local2 = Engine.GetCustomClass( f479_arg1, f479_local1 )
		local f479_local3 = f479_arg0.weaponSlotTable[f479_local0]
		local f479_local4 = CoD.perController[f479_arg1].classModel
		local f479_local5 = true
		local f479_local6, f479_local7 = nil
		local f479_local8, f479_local9, f479_local10 = CoD.CACUtility.GetCACSlotStatus( f479_arg1, f479_local4, f479_local0 )
		if f479_local8 == CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE then
			return 
		elseif f479_local8 == CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD then
			local f479_local11 = nil
			for f479_local15, f479_local16 in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
				if not CoD.CACUtility.ItemEquippedInSlot( f479_local16, f479_arg1, f479_local4 ) then
					f479_local11 = f479_local16
					break
				end
			end
			f479_local12 = CoD.CACUtility.WildcardNeededForSlot( f479_arg1, f479_local0 )
			if f479_local11 then
				CoD.perController[f479_arg1].CACSpecficModelValueFocusTable = {
					ref = f479_local12
				}
				CoD.perController[f479_arg1].CACWildcardContextualMenu = true
				CoD.perController[f479_arg1].weaponCategory = f479_local11
				OpenPopup( f479_arg0, "WildcardSelect", f479_arg1 )
			end
			Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f479_arg1 ), "CACMenu.numWildcardItemsToRemove" ), 1 )
			CoD.perController[f479_arg1].wildcardOverCapacityRefName = f479_local12
			f479_local14 = OpenPopup( f479_arg0, "WildcardCapacity", f479_arg1 )
			f479_local14.acceptData = {
				classNum = f479_local1,
				wildcardToReplace = f479_local12
			}
		end
		local f479_local11 = CoD.CACUtility.PrimaryGunfighterEquippedCount( f479_local4 )
		if f479_local0 == "primary" then
			CoD.perController[f479_arg1].weaponSlot = "primary"
			f479_local6 = "PrimaryWeaponSelect"
			f479_local7 = "cac_loadout_edit_select_primary"
		elseif f479_local0 == "primaryattachment1" then
			local f479_local12 = f479_local2.primary
			CoD.perController[f479_arg1].weaponSlot = "primary"
			f479_local7 = "cac_loadout_edit_submenu"
			if f479_local12 then
				CoD.perController[f479_arg1].attachmentType = "optic"
				f479_local6 = "PrimaryOpticSelect"
			end
		elseif not (f479_local0 ~= "primaryattachment2" and f479_local0 ~= "primaryattachment3" and (f479_local0 ~= "primaryattachment4" or f479_local11 < 1)) or not (f479_local0 ~= "primaryattachment5" or f479_local11 < 2) or f479_local0 == "primaryattachment6" and f479_local11 >= 3 then
			if IsPrimaryWeaponAttachmentAvailable( f479_arg1 ) then
				local f479_local12 = f479_local2.primary
				CoD.perController[f479_arg1].weaponSlot = "primary"
				f479_local7 = "cac_loadout_edit_submenu"
				if f479_local12 then
					CoD.perController[f479_arg1].attachmentType = "attachment"
					f479_local6 = "PrimaryAttachmentSelect"
				end
			end
		elseif f479_local0 == "secondary" then
			CoD.perController[f479_arg1].weaponSlot = "secondary"
			f479_local6 = "SecondaryWeaponSelect"
			f479_local7 = "cac_loadout_edit_select_secondary"
			if CoD.CACUtility.IsBonusCardEquippedByName( f479_local2, "bonuscard_overkill" ) == true then
				CoD.perController[f479_arg1].weaponClassGroup = "primary"
				f479_local6 = "PrimaryWeaponSelect"
			end
		elseif f479_local0 == "secondaryattachment1" then
			local f479_local12 = f479_local2.secondary
			CoD.perController[f479_arg1].weaponSlot = "secondary"
			f479_local7 = "cac_loadout_edit_submenu"
			if f479_local12 then
				CoD.perController[f479_arg1].attachmentType = "optic"
				f479_local6 = "SecondaryOpticSelect"
			end
		elseif f479_local0 == "secondaryattachment2" or f479_local0 == "secondaryattachment3" and CoD.CACUtility.SearchForBonusCard( "bonuscard_secondary_gunfighter", f479_arg1 ) ~= "" then
			if IsSecondaryWeaponAttachmentAvailable( f479_arg1 ) then
				local f479_local12 = f479_local2.secondary
				CoD.perController[f479_arg1].weaponSlot = "secondary"
				f479_local7 = "cac_loadout_edit_submenu"
				if f479_local12 then
					CoD.perController[f479_arg1].attachmentType = "attachment"
					f479_local6 = "SecondaryAttachmentSelect"
				end
			end
		elseif f479_local0 == "primarygadget" then
			f479_local6 = "LethalEquipmentSelect"
			f479_local7 = "cac_loadout_edit_submenu"
			if CoD.CACUtility.IsBonusCardEquippedByName( f479_local2, "bonuscard_two_tacticals" ) == true then
				CoD.perController[f479_arg1].weaponClassGroup = "secondarygadget"
				f479_local6 = "TacticalEquipmentSelect"
			end
		elseif f479_local0 == "primarygadgetattachment1" or f479_local0 == "primarygadgetattachment2" or f479_local0 == "primarygadgetattachment3" then
			f0_local9( f479_arg0, f479_arg1, f479_local0 )
		elseif f479_local0 == "secondarygadget" then
			f479_local6 = "TacticalEquipmentSelect"
			f479_local7 = "cac_loadout_edit_submenu"
		elseif f479_local0 == "secondarygadgetattachment1" or f479_local0 == "secondarygadgetattachment2" or f479_local0 == "secondarygadgetattachment3" then
			f0_local9( f479_arg0, f479_arg1, f479_local0 )
		elseif not (f479_local0 ~= "specialty1" and (f479_local0 ~= "specialty4" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_1_greed", f479_arg1 ) == "")) or not (f479_local0 ~= "specialty2" and (f479_local0 ~= "specialty5" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_2_greed", f479_arg1 ) == "")) or f479_local0 == "specialty3" or f479_local0 == "specialty6" and CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_3_greed", f479_arg1 ) ~= "" then
			f479_local6 = "PerkSelect"
			f479_local7 = "cac_loadout_edit_submenu"
		elseif f479_local0 == "bonuscard1" or f479_local0 == "bonuscard2" or f479_local0 == "bonuscard3" then
			f479_local6 = "WildcardSelect"
			f479_local7 = "cac_loadout_edit_submenu"
		elseif f479_local0 == "cybercom_tacrig1" or f479_local0 == "cybercom_tacrig2" then
			f479_local6 = "TacticalRigSelect"
			f479_local7 = "cac_loadout_edit_submenu"
		end
		if f479_local7 then
			Engine.PlaySound( f479_local7 )
		end
		if f479_local6 then
			if f479_local6 == "WildcardSelect" then
				OpenPopup( f479_arg0, f479_local6, f479_arg1 )
			else
				NavigateToMenu( f479_arg0, f479_local6, f479_local5, f479_arg1 )
			end
		end
	end
end

function NavigateToPersonalizeMenu( f480_arg0, f480_arg1 )
	local f480_local0 = f480_arg0.currentActiveSlot
	local f480_local1 = CoD.perController[f480_arg1].classModel
	local f480_local2 = CoD.CACUtility.GetItemEquippedInSlot( f480_local0, f480_arg1, f480_local1 )
	local f480_local3 = CoD.CACUtility.GetItemRefEquippedInSlot( f480_local0, f480_arg1, f480_local1 )
	local f480_local4 = nil
	local f480_local5 = true
	if not (f480_local0 ~= "primary" or not CoD.CACUtility.ItemEquippedInSlot( "primary", f480_arg1 )) or f480_local0 == "secondary" and CoD.CACUtility.ItemEquippedInSlot( "secondary", f480_arg1 ) then
		f480_local4 = "WeaponCustomization"
	elseif (LUI.startswith( f480_local0, "primaryattachment" ) or LUI.startswith( f480_local0, "secondaryattachment" )) and f480_local0 ~= "primaryattachment1" and f480_local0 ~= "secondaryattachment1" and CoD.CACUtility.ItemEquippedInSlot( f480_local0, f480_arg1 ) and IsLive() and f480_local3 ~= "dw" then
		CoD.WC_Category.ACV.selectedAttachmentIndex = f480_local2
		CoD.WC_Category.ACV.selectedAttachment = f480_local3
		f480_local4 = "AttachmentCosmeticVariantSelect"
	elseif (f480_local0 == "primaryattachment1" or f480_local0 == "secondaryattachment1") and f480_local2 > CoD.CACUtility.EmptyItemIndex and CoD.CACUtility.AttachmentHasCustomReticle( f480_local3 ) then
		CoD.perController[f480_arg1].customReticleAttachmentIndex = f480_local2
		CoD.perController[f480_arg1].customReticleAttachment = f480_local3
		f480_local4 = "ReticleSelect"
	end
	if f480_local4 then
		CoD.perController[f480_arg1].weaponCategory = f480_local0
		NavigateToMenu( f480_arg0, f480_local4, f480_local5, f480_arg1 )
	end
end

function chooseClass_ClientChanged( f481_arg0, f481_arg1, f481_arg2, f481_arg3 )
	local f481_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	local f481_local1 = f481_local0.sessionClients
	local f481_local2 = Engine.GetModel( Engine.GetModelForController( f481_arg2 ), "ChooseClassCPClientMenu" )
	if f481_local2 then
		local f481_local3 = Engine.GetModel( f481_local2, "selectedClientIndex" )
		if f481_local3 then
			local f481_local4 = Engine.GetModel( f481_local2, "numActiveClients" )
			if f481_local4 then
				local f481_local5 = Engine.GetModelValue( f481_local4 )
				local f481_local6 = Engine.GetModelValue( f481_local3 )
				local f481_local7 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
				local f481_local8 = f481_local7.sessionClients
				local f481_local9 = Engine.GetXUID64( f481_arg2 )
				local f481_local10 = false
				repeat
					f481_local6 = f481_local6 + f481_arg3
					if f481_local6 < 1 then
						f481_local6 = f481_local5
					elseif f481_local5 < f481_local6 then
						f481_local6 = 1
					end
					local f481_local11 = Engine.GetModel( f481_local2, "client" .. f481_local6 )
					if f481_local11 then
						local f481_local12 = Engine.GetModelValue( Engine.GetModel( f481_local11, "xuid" ) )
						if Engine.CompareUInt64( f481_local12, f481_local9, "=" ) then
							f481_local10 = true
						else
							local f481_local13 = nil
							for f481_local14 = 1, #f481_local8, 1 do
								local f481_local17 = f481_local8[f481_local14]
								if f481_local17.xuid == f481_local12 then
									f481_local13 = f481_local17
									break
								end
							end
							if f481_local13 ~= nil then
								f481_local10 = Engine.IsSharedLoadoutAvailableForClient( f481_arg2, f481_local12 )
							end
							f481_local10 = false
						end
					end
				until f481_local10
				Engine.SetModelValue( f481_local3, f481_local6 )
				f481_arg0.chooseClassCPClientIngame0:setModel( Engine.GetModel( f481_local2, "client" .. f481_local6 ) )
				CoD.CACUtility.ResetCPCustomClasses( f481_arg2 )
				f481_arg0.classList:updateDataSource( true )
				f481_arg0.classList:processEvent( {
					name = "gain_focus",
					controller = f481_arg2
				} )
			end
		end
	end
end

function chooseClass_TabMPClassesListLeft( f482_arg0, f482_arg1 )
	if not f482_arg0.ClassSetTabWidget then
		return 
	else
		return f482_arg0.ClassSetTabWidget.Internal.Tabs.grid:navigateItemLeft()
	end
end

function chooseClass_TabMPClassesListRight( f483_arg0, f483_arg1 )
	if not f483_arg0.ClassSetTabWidget then
		return 
	else
		return f483_arg0.ClassSetTabWidget.Internal.Tabs.grid:navigateItemRight()
	end
end

function CAC_TabChanged( f484_arg0, f484_arg1, f484_arg2 )
	if not f484_arg0.performingSetup then
		DataSources.Unlockables.setCurrentFilterItem( f484_arg1.filter )
		f484_arg0.weaponList:updateDataSource( true )
		local f484_local0 = f484_arg0.weaponList:getItemAt( 1 )
		if f484_local0 then
			f484_arg0.weaponList:setActiveItem( f484_local0, 0, true, true )
		end
	end
end

function Cybercore_TabChanged( f485_arg0, f485_arg1, f485_arg2 )
	local f485_local0 = Engine.GetModel( Engine.GetModelForController( f485_arg2 ), "CybercoreUpgradeMenu" )
	Engine.SetModelValue( Engine.GetModel( f485_local0, "selectedCore" ), f485_arg1.itemRef )
	Engine.SetModelValue( Engine.GetModel( f485_local0, "currentCybercoreName" ), f485_arg1.itemName )
	f485_arg0.upgradeTree:updateTree( f485_arg2 )
	f485_arg0:processEvent( {
		name = "update_state",
		controller = f485_arg2
	} )
end

function SetClassItem( f486_arg0, f486_arg1, f486_arg2 )
	local f486_local0 = CoD.perController[f486_arg2].classNum
	local f486_local1 = CoD.perController[f486_arg2].weaponCategory
	local f486_local2 = f486_arg1:getModel( f486_arg2, "itemIndex" )
	local f486_local3 = 0
	if f486_local2 then
		f486_local3 = Engine.GetModelValue( f486_local2 )
	end
	local f486_local4 = f486_arg1:getModel( f486_arg2, "upgradeItemIndex" )
	local f486_local5 = 0
	if f486_local4 then
		f486_local5 = Engine.GetModelValue( f486_local4 )
	end
	local f486_local6 = f486_local3
	if IsCACItemUpgraded( f486_arg0, f486_arg1, f486_arg2 ) then
		f486_local6 = f486_local5
	end
	if f0_local8( f486_arg0, f486_arg2, f486_arg0:getModel(), f486_local0, f486_local1, f486_local6 ) then
		BreakWeaponVariantLink( f486_arg2 )
		f486_arg0:playSound( "equip_item" )
		local f486_local7 = GoBack( f486_arg0, f486_arg2 )
		if f486_local7 then
			f486_local7:processEvent( {
				name = "update_state",
				controller = f486_arg2
			} )
		end
		return f486_local7
	else
		
	end
end

function SetClassWildcard( f487_arg0, f487_arg1, f487_arg2 )
	local f487_local0 = CoD.perController[f487_arg2].classNum
	local f487_local1 = CoD.perController[f487_arg2].weaponCategory
	local f487_local2 = CoD.perController[f487_arg2].classModel
	local f487_local3 = false
	local f487_local4 = f487_arg1:getModel( f487_arg2, "itemIndex" )
	local f487_local5 = 0
	if f487_local4 then
		f487_local5 = Engine.GetModelValue( f487_local4 )
	end
	local f487_local6 = Engine.GetModel( f487_local2, f487_local1 .. ".itemIndex" )
	if f487_local6 then
		local f487_local7 = Engine.GetModelValue( f487_local6 )
		if CoD.CACUtility.EmptyItemIndex < f487_local7 and f487_local7 == f487_local5 then
			f487_local3 = true
		end
	end
	if f487_local3 or f0_local8( f487_arg0, f487_arg2, f487_arg0:getModel(), f487_local0, f487_local1, f487_local5 ) then
		f487_arg0:playSound( "equip_item" )
		local f487_local7 = GoBack( f487_arg0, f487_arg2 )
		if CoD.CACUtility.CustomClass_LastClassNum and f487_local7.menuName == "CustomClass" then
			f487_local7:navigateTo( CoD.CACUtility.CustomClass_LastSelection )
			f487_local7:processEvent( {
				name = "update_state",
				controller = f487_arg2
			} )
		end
	end
end

function SetClassAttachment( f488_arg0, f488_arg1, f488_arg2 )
	local f488_local0 = CoD.perController[f488_arg2].classModel
	local f488_local1 = CoD.perController[f488_arg2].classNum
	local f488_local2 = CoD.perController[f488_arg2].weaponCategory
	local f488_local3 = f488_arg1:getModel( f488_arg2, "itemIndex" )
	local f488_local4 = 0
	if f488_local3 then
		f488_local4 = Engine.GetModelValue( f488_local3 )
	end
	if f0_local8( f488_arg0, f488_arg2, f488_arg0:getModel(), f488_local1, f488_local2, f488_local4, true ) then
		BreakWeaponVariantLink( f488_arg2 )
		CoD.CACUtility.GetCustomClassModel( f488_arg2, f488_local1, f488_local0 )
		f488_arg0:playSound( "equip_item" )
		local f488_local5 = GoBack( f488_arg0, f488_arg2 )
		if f488_local5 then
			f488_local5:processEvent( {
				name = "update_state",
				controller = f488_arg2
			} )
		end
	end
end

local f0_local10 = function ( f489_arg0, f489_arg1, f489_arg2, f489_arg3, f489_arg4, f489_arg5, f489_arg6 )
	local f489_local0 = CoD.perController[f489_arg1].classModel
	local f489_local1 = CoD.perController[f489_arg1].classNum
	local f489_local2 = f489_arg3.weaponIndex
	local f489_local3 = f489_arg3.cacVariantIndex
	local f489_local4 = f489_arg3.attachmentVariant
	local f489_local5 = true
	if not IsProgressionEnabled( f489_arg1 ) or not f489_arg3.isVariantLinkBroken then
		CoD.SetClassItem( f489_arg1, f489_local1, f489_arg2 .. "gunsmithvariant", f489_local3 )
	end
	f0_local6( f489_arg2, f489_arg1 )
	f0_local8( f489_arg0, f489_arg1, f489_local0, f489_local1, f489_arg2, f489_local2, f489_local5 )
	CoD.SetClassItem( f489_arg1, f489_local1, f489_arg2 .. "camo", f489_arg3.camoIndex )
	CoD.SetClassItem( f489_arg1, f489_local1, f489_arg2 .. "reticle", f489_arg3.reticleIndex )
	local f489_local6 = f489_arg3.paintjobSlot
	if f489_local6 and f489_local6 ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and f489_arg3.paintjobIndex ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
		CoD.SetClassItem( f489_arg1, f489_local1, f489_arg2 .. "paintjobslot", f489_arg3.paintjobSlot )
		CoD.SetClassItem( f489_arg1, f489_local1, f489_arg2 .. "paintjobindex", f489_arg3.paintjobIndex )
	end
	for f489_local16, f489_local17 in ipairs( f489_arg5 ) do
		if not f489_local17.isLocked then
			local f489_local10 = nil
			for f489_local14, f489_local15 in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
				if not CoD.CACUtility.ItemEquippedInSlot( f489_local15, f489_arg1, f489_local0 ) then
					f489_local10 = f489_local15
					break
				end
			end
			if f489_local10 then
				f0_local8( f489_arg0, f489_arg1, f489_local0, f489_local1, f489_local10, f489_local17.itemIndex, f489_local5 )
			end
		end
	end
	for f489_local16, f489_local17 in ipairs( f489_arg4 ) do
		local f489_local10 = f489_arg2 .. "attachment" .. f489_local16
		if CoD.CACUtility.EmptyItemIndex < f489_local17 then
			f0_local8( f489_arg0, f489_arg1, f489_local0, f489_local1, f489_local10, f489_local17, f489_local5 )
			CoD.SetClassItem( f489_arg1, f489_local1, f489_local10 .. "cosmeticvariant", f489_local4[f489_local16] )
		end
	end
	CoD.CACUtility.GetCustomClassModel( f489_arg1, f489_local1, CoD.perController[f489_arg1].classModel )
end

function SetWeaponVariant( f490_arg0, f490_arg1, f490_arg2 )
	local f490_local0 = CoD.perController[f490_arg2].classNum
	local f490_local1 = CoD.perController[f490_arg2].classModel
	local f490_local2 = CoD.perController[f490_arg2].weaponCategory
	local f490_local3 = f490_local2 == "primary"
	local f490_local4 = f490_arg1.weaponVariantInfo.weaponIndex
	local f490_local5 = f490_arg1.weaponVariantInfo.attachmentsByIndex
	local f490_local6 = f490_arg1.weaponVariantInfo.unlockedAttachmentsByIndex
	local f490_local7 = f490_arg1.weaponVariantInfo.wildcardNeededCount
	local f490_local8 = f490_arg1.weaponVariantInfo.wildcardNeededFromVariantCount
	local f490_local9 = false
	local f490_local10 = false
	local f490_local11 = Engine.GetMaxAllocation( f490_arg2 )
	local f490_local12 = Engine.GetModel( f490_local1, "allocationSpent" )
	local f490_local13 = 0
	local f490_local14 = 0
	local f490_local15 = 0
	local f490_local16 = 0
	local f490_local17 = 0
	local f490_local18 = 2
	local f490_local19 = "bonuscard_primary_gunfighter"
	local f490_local20 = CoD.CACUtility.PrimaryAttachmentSlotNameList
	local f490_local21 = 3
	local f490_local22 = CoD.CACUtility.maxPrimaryGunfighters
	if not f490_local3 then
		f490_local18 = 1
		f490_local20 = CoD.CACUtility.SecondaryAttachmentSlotNameList
		f490_local19 = "bonuscard_secondary_gunfighter"
		f490_local21 = 2
		f490_local22 = CoD.CACUtility.maxSecondaryGunfigthers
	end
	if f490_local12 then
		f490_local13 = Engine.GetModelValue( f490_local12 )
	end
	if CoD.CACUtility.EmptyItemIndex < Engine.GetModelValue( Engine.GetModel( f490_local1, f490_local2 .. ".itemIndex" ) ) then
		f490_local14 = 1
	end
	for f490_local26, f490_local27 in ipairs( f490_local20 ) do
		if CoD.CACUtility.EmptyItemIndex < Engine.GetModelValue( Engine.GetModel( f490_local1, f490_local27 .. ".itemIndex" ) ) then
			f490_local15 = f490_local15 + 1
		end
	end
	if f490_local3 then
		f490_local17 = CoD.CACUtility.PrimaryGunfighterEquippedCount( f490_local1 )
	elseif CoD.CACUtility.IsBonusCardEquipped( CoD.CACUtility.bonuscards.secondary_gunfighter, f490_local1 ) then
		f490_local17 = 1
	end
	f490_local16 = f490_local17
	f490_local13 = f490_local13 - f490_local14 - f490_local15 - f490_local16
	f490_local23 = 0
	f490_local24 = 1
	f490_local25 = 0
	f490_local26 = false
	f490_local27 = 0
	local f490_local28 = f490_local5
	local f490_local29 = {}
	local f490_local30 = f490_local17
	local f490_local31 = f490_local7 - f490_local17
	if f490_local3 then
		f490_local31 = math.min( math.max( f490_local31, 0 ), CoD.CACUtility.maxPrimaryGunfighters )
	else
		f490_local31 = math.min( math.max( f490_local31, 0 ), CoD.CACUtility.maxSecondaryGunfighters )
	end
	if IsProgressionEnabled( f490_arg2 ) then
		f490_local28 = f490_local6
		if f490_local3 then
			local f490_local32 = 0
			for f490_local39, f490_local40 in ipairs( CoD.CACUtility.PrimaryGunfighterWildcards ) do
				if f490_local8 <= f490_local32 then
					break
				elseif CoD.CACUtility.IsBonusCardEquipped( f490_local40, f490_local1 ) then
					f490_local16 = f490_local16 - 1
				else
					local f490_local36 = Engine.GetItemIndexFromReference( f490_local40 )
					local f490_local37 = Engine.IsItemLocked( f490_arg2, f490_local36 )
					local f490_local38
					if not f490_local37 then
						f490_local38 = not Engine.IsItemPurchased( f490_arg2, f490_local36 )
					else
						f490_local38 = false
					end
					table.insert( f490_local29, {
						ref = f490_local40,
						itemIndex = f490_local36,
						isLocked = f490_local37,
						isPurchasable = f490_local38
					} )
				end
				f490_local32 = f490_local32 + 1
			end
			f490_local30 = f490_local32
		elseif f490_local31 > 0 and f490_local30 < f490_local8 then
			if CoD.CACUtility.IsBonusCardEquipped( f490_local19, f490_local1 ) then
				f490_local16 = f490_local16 - 1
			else
				local f490_local32 = Engine.GetItemIndexFromReference( f490_local19 )
				local f490_local33 = Engine.IsItemLocked( f490_arg2, f490_local32 )
				local f490_local34
				if not f490_local33 then
					f490_local34 = not Engine.IsItemPurchased( f490_arg2, f490_local32 )
				else
					f490_local34 = false
				end
				table.insert( f490_local29, {
					ref = f490_local19,
					itemIndex = f490_local32,
					isLocked = f490_local33,
					isPurchasable = f490_local34
				} )
				f490_local30 = 1
			end
		end
	else
		f490_local31 = f490_local8 - f490_local17
		if f490_local3 then
			f490_local31 = math.min( math.max( f490_local31, 0 ), CoD.CACUtility.maxPrimaryGunfighters )
		else
			f490_local31 = math.min( math.max( f490_local31, 0 ), CoD.CACUtility.maxSecondaryGunfighters )
		end
		if f490_local8 > 0 and f490_local31 > 0 then
			if f490_local3 then
				local f490_local32 = 0
				for f490_local39, f490_local40 in ipairs( CoD.CACUtility.PrimaryGunfighterWildcards ) do
					if f490_local8 <= f490_local32 then
						
					elseif CoD.CACUtility.IsBonusCardEquipped( f490_local40, f490_local1 ) then
						f490_local16 = f490_local16 - 1
					else
						table.insert( f490_local29, {
							ref = f490_local40,
							itemIndex = Engine.GetItemIndexFromReference( f490_local40 ),
							isLocked = false
						} )
					end
					f490_local32 = f490_local32 + 1
				end
			elseif CoD.CACUtility.IsBonusCardEquipped( f490_local19, f490_local1 ) then
				f490_local16 = f490_local16 - 1
			else
				table.insert( f490_local29, {
					ref = f490_local19,
					itemIndex = Engine.GetItemIndexFromReference( f490_local19 ),
					isLocked = false
				} )
			end
		else
			f490_local16 = f490_local16 - f490_local8
		end
		f490_local30 = f490_local8
	end
	local f490_local32 = false
	for f490_local39, f490_local40 in ipairs( f490_local29 ) do
		if f490_local40.isLocked then
			for f490_local36 = #f490_local28, f490_local21, -1 do
				if f490_local28[f490_local36] ~= CoD.CACUtility.EmptyItemIndex then
					f490_local28[f490_local36] = CoD.CACUtility.EmptyItemIndex
					break
				end
			end
		end
		if f490_local40.isPurchasable then
			f490_local32 = true
		end
	end
	for f490_local39, f490_local40 in ipairs( f490_local28 ) do
		if CoD.CACUtility.EmptyItemIndex < f490_local40 then
			f490_local25 = f490_local25 + 1
		end
	end
	f490_local23 = f490_local24 + f490_local25 + f490_local30
	if f490_local31 > 0 then
		f490_local33 = nil
		for f490_local40, f490_local36 in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
			if not CoD.CACUtility.ItemEquippedInSlot( f490_local36, f490_arg2, f490_local1 ) then
				f490_local33 = f490_local36
				break
			end
		end
		if not f490_local33 then
			f490_local10 = true
		end
	end
	if not IsCampaign() and f490_local11 < f490_local13 + f490_local23 + f490_local16 then
		f490_local9 = true
	end
	if f490_local32 then
		f490_local33 = nil
		f490_local34 = true
		f490_local35 = nil
		for f490_local37, f490_local38 in ipairs( f490_local29 ) do
			if f490_local38.isPurchasable then
				f490_local35 = f490_local38
				break
			end
		end
		f490_local39 = CoD.OverlayUtility.CreateOverlay( f490_arg2, f490_arg0, "UnlockClassItem", f490_arg2, f490_local35.itemIndex, f490_local33, f490_local34 )
		f490_local39.acceptData = {
			variantInfoElement = f490_arg1
		}
	elseif f490_local10 then
		CoD.perController[f490_arg2].wildcardOverCapacityRefName = f490_local29[1].ref
		Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f490_arg2 ), "CACMenu.numWildcardItemsToRemove" ), f490_local31 )
		f490_local34 = OpenPopup( f490_arg0, "WildcardCapacity", f490_arg2 )
		f490_local34.acceptData = {
			classNum = f490_local0,
			variantInfoElement = f490_arg1,
			wildcarUnlockedTable = f490_local29
		}
	elseif f490_local9 then
		Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f490_arg2 ), "CACMenu.numItemsToRemove" ), f490_local13 + f490_local23 + f490_local16 - f490_local11 )
		f490_local35 = OpenPopup( f490_arg0, "RemoveItemFromClass", f490_arg2 )
		f490_local35.acceptData = {
			slotName = f490_local2,
			weaponVariantInfo = f490_arg1.weaponVariantInfo,
			attachmentsByIndex = f490_local28,
			wildcarUnlockedTable = f490_local29,
			bonuscardGunfighterForSlot = f490_local19
		}
	else
		f0_local10( f490_arg0, f490_arg2, f490_local2, f490_arg1.weaponVariantInfo, f490_local28, f490_local29, f490_local19 )
		GoBackToCustomClassMenu( f490_arg0, f490_arg2 )
	end
end

function BreakWeaponVariantLink( f491_arg0, f491_arg1 )
	local f491_local0 = CoD.perController[f491_arg0].classNum
	local f491_local1 = CoD.CACUtility.EmptyItemIndex
	local f491_local2 = f491_arg1
	local f491_local3 = nil
	if not f491_arg1 then
		f491_local2 = CoD.perController[f491_arg0].weaponCategory
	end
	f491_local3 = CoD.CACUtility.GetBaseWeaponLoadoutSlotName( f491_local2 )
	if f491_local3 == "primary" or f491_local3 == "secondary" then
		local f491_local4 = CoD.GetClassItem( f491_arg0, f491_local0, f491_local3 .. "gunsmithvariant" )
		if f491_local4 ~= f491_local1 then
			local f491_local5 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f491_arg0, f491_local4 - 1 )
			CoD.OverlayUtility.ShowToast( "BreakVariantLink", Engine.Localize( "MENU_WEAPON_VARIANT_LINK_BROKEN" ), f491_local5.variantName, "uie_t7_mp_icon_header_gunsmith" )
		end
		CoD.SetClassItem( f491_arg0, f491_local0, f491_local3 .. "gunsmithvariant", f491_local1 )
	end
end

function UpdateShownCybercoreXmodel( f492_arg0, f492_arg1 )
	local f492_local0 = f492_arg0:getModel( f492_arg1, "baseItemIndex" )
	local f492_local1 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local f492_local2 = 0
	if f492_local0 then
		Engine.SendClientScriptNotify( f492_arg1, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f492_arg1 ), "cybercore", CoD.CACUtility.GetCybercoreXModel( Engine.GetModelValue( f492_local0 ), f492_local1 ), "select01", nil, nil, IsCybercoreAbilityAvailable( f492_arg0, f492_arg1 ), IsCybercoreAbilityPurchasable( f492_arg0, f492_arg1 ) )
	end
end

function FocusClassItem( f493_arg0, f493_arg1, f493_arg2 )
	local f493_local0 = CoD.perController[f493_arg2].classNum
	local f493_local1 = CoD.perController[f493_arg2].weaponCategory
	local f493_local2 = CoD.perController[f493_arg2].classModel
	local f493_local3 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local f493_local4 = f493_arg1:getModel( f493_arg2, "itemIndex" )
	local f493_local5 = 0
	if f493_local4 then
		f493_local5 = Engine.GetModelValue( f493_local4 )
	elseif f493_arg1.itemIndex then
		f493_local5 = f493_arg1.itemIndex
	end
	local f493_local6 = "select01"
	local f493_local7, f493_local8, f493_local9 = nil
	if LUI.startswith( f493_local1, "primaryattachment" ) then
		f493_local7 = "primary"
		f493_local8 = CoD.CACUtility.PrimaryAttachmentSlotNameList
	elseif LUI.startswith( f493_local1, "secondaryattachment" ) then
		f493_local7 = "secondary"
		f493_local8 = CoD.CACUtility.SecondaryAttachmentSlotNameList
	elseif LUI.startswith( f493_local1, "specialty" ) then
		f493_local7 = "specialty"
		f493_local9 = CoD.CACUtility.GetPerkXModel( f493_local5, f493_local3 )
	elseif LUI.startswith( f493_local1, "bonuscard" ) then
		f493_local7 = "bonuscard"
		f493_local9 = CoD.CACUtility.GetBonuscardXModel( f493_local5, f493_local3 )
	elseif LUI.startswith( f493_local1, "cybercore" ) then
		f493_local7 = "cybercore"
		f493_local9 = CoD.CACUtility.GetCybercoreXModel( f493_local5, f493_local3 )
	elseif LUI.startswith( f493_local1, "cybercom" ) then
		f493_local7 = "cybercom"
		f493_local9 = CoD.CACUtility.GetPerkXModel( f493_local5, f493_local3 )
	end
	local f493_local10 = Engine.GetModel( f493_local2, f493_local7 .. ".itemIndex" )
	local f493_local11 = Engine.GetModel( f493_local2, f493_local1 .. ".itemIndex" )
	if f493_local10 and f493_local11 and f493_local7 ~= "cybercore" then
		local f493_local12 = Engine.GetModelValue( f493_local10 )
		local f493_local13 = Engine.GetAttachmentRef( f493_local12, f493_local5 )
		local f493_local14 = Engine.GetModelValue( f493_local11 )
		local f493_local15 = Engine.GetAttachmentRef( f493_local12, f493_local14 )
		local f493_local16 = Engine.GetItemRef( f493_local12 ) .. "_" .. CoD.gameMode:lower()
		local f493_local17 = {}
		local f493_local18 = false
		for f493_local22, f493_local23 in ipairs( f493_local8 ) do
			local f493_local24 = Engine.GetModelValue( Engine.GetModel( f493_local2, f493_local23 .. ".itemIndex" ) )
			if CoD.CACUtility.EmptyItemIndex < f493_local24 then
				if f493_local24 ~= f493_local14 then
					table.insert( f493_local17, {
						index = f493_local24,
						ref = Engine.GetAttachmentRef( f493_local12, f493_local24 )
					} )
				else
					f493_local18 = true
				end
			end
		end
		for f493_local22, f493_local23 in ipairs( f493_local17 ) do
			local f493_local24 = f493_local23.ref
			local f493_local25 = f493_local23.index
			if (not Engine.IsOptic( f493_local12, f493_local5 ) or not Engine.IsOptic( f493_local12, f493_local25 )) and Engine.AreAttachmentsCompatible( f493_local12, f493_local5, f493_local25 ) then
				f493_local16 = f493_local16 .. "+" .. f493_local24
			end
		end
		f493_local16 = f493_local16 .. "+" .. f493_local13
		if f493_local16 and f493_local16 ~= "" then
			Engine.SendClientScriptNotify( f493_arg2, "CustomClass_focus" .. CoD.GetLocalClientAdjustedNum( f493_arg2 ), f493_local7, f493_local16, f493_local13, "none", CoD.CACUtility.GetACVariantsFromClassExcludeAttachment( f493_arg2, f493_local2, f493_local1, f493_local13 ) .. f493_local13 .. "," .. f493_arg1.acvIndex )
		end
	elseif f493_local11 ~= nil then
		Engine.SendClientScriptNotify( f493_arg2, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f493_arg2 ), f493_local1, f493_local9, f493_local6, nil, nil, not IsCACItemLocked( f493_arg0, f493_arg1, f493_arg2 ), not IsCACItemPurchased( f493_arg1, f493_arg2 ) )
	end
end

function FocusWeapon( f494_arg0, f494_arg1, f494_arg2 )
	local f494_local0 = CoD.perController[f494_arg2].classNum
	local f494_local1 = CoD.perController[f494_arg2].weaponCategory
	local f494_local2 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local f494_local3 = f494_arg1:getModel( f494_arg2, "itemIndex" )
	local f494_local4 = 0
	if f494_local3 then
		local f494_local5 = Engine.GetItemRef( Engine.GetModelValue( f494_local3 ), f494_local2 )
		local f494_local6 = f494_local5 .. "_mp"
		if f494_local1 == "secondary" then
			f494_local6 = "none," .. f494_local6
		end
		Engine.SendClientScriptNotify( f494_arg2, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f494_arg2 ), f494_local1, f494_local5 .. "_" .. CoD.gameMode:lower(), "select01", CoD.CACUtility.EmptyWeaponOptions(), nil, not IsCACItemLocked( f494_arg0, f494_arg1, f494_arg2 ), not IsCACItemPurchased( f494_arg1, f494_arg2 ) )
	end
end

function FocusWeaponVariant( f495_arg0, f495_arg1, f495_arg2 )
	local f495_local0 = CoD.perController[f495_arg2].classNum
	local f495_local1 = CoD.perController[f495_arg2].weaponCategory
	local f495_local2 = f495_arg1.weaponVariantInfo.weaponIndex
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f495_arg2 ), "CACMenu.curWeaponVariantName" ), f495_arg1.weaponVariantInfo.variantName )
	local f495_local3 = Engine.GetItemRef( f495_local2 ) .. "_" .. CoD.gameMode:lower()
	for f495_local7, f495_local8 in ipairs( f495_arg1.weaponVariantInfo.attachmentsByIndex ) do
		f495_local3 = f495_local3 .. "+" .. Engine.GetAttachmentRef( f495_local2, f495_local8 )
	end
	Engine.SendClientScriptNotify( f495_arg2, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f495_arg2 ), f495_local1, f495_local3, CoD.CACUtility.GetCameraNameForAttachments( f495_local3 ), CoD.CACUtility.GetWeaponOptionsFromVariantInfo( f495_arg2, f495_arg1.weaponVariantInfo ), CoD.CACUtility.GetAttachmentCosmeticVariantsFromVariantInfo( f495_arg1.weaponVariantInfo ) )
end

function MarkCACPaintshopDataDirty( f496_arg0, f496_arg1 )
	Engine.MarkPSDataDirty( f496_arg1, false )
end

function RemoveItemFromClass( f497_arg0, f497_arg1, f497_arg2 )
	if f497_arg0.ShowRemovePrompt ~= nil and not f497_arg0:ShowRemovePrompt( f497_arg2 ) then
		return 
	end
	local f497_local0 = CoD.perController[f497_arg2].classNum
	local f497_local1 = CoD.perController[f497_arg2].classModel
	local f497_local2 = f497_arg0.currentActiveSlot
	if f497_local2 and f0_local6( f497_local2, f497_arg2 ) then
		BreakWeaponVariantLink( f497_arg2, f497_local2 )
		CoD.CACUtility.GetCustomClassModel( f497_arg2, f497_local0, f497_local1 )
		f497_arg0:playSound( "unequip_item" )
		f497_arg0:processEvent( {
			name = "update_state",
			controller = f497_arg2
		} )
		f497_arg0:processEvent( {
			name = "update_button_prompts",
			controller = f497_arg2
		} )
	end
	local f497_local3 = Engine.GetWeaponString( f497_arg2, f497_local0, "primary" )
	local f497_local4 = Engine.GetWeaponString( f497_arg2, f497_local0, "secondary" )
	if f497_local3 ~= "" then
		Engine.SendClientScriptNotify( f497_arg2, "CustomClass_primary", "custom_removeattach", f497_local3 )
	end
	if f497_local4 ~= "" then
		Engine.SendClientScriptNotify( f497_arg2, "CustomClass_secondary", "custom_removeattach", f497_local4 )
	end
	local f497_local5 = nil
	local f497_local6 = CoD.CACUtility.GetBaseWeaponLoadoutSlotName( f497_local2 )
	if f497_local6 and (f497_local6 == "primary" or f497_local6 == "secondary") then
		f497_local5 = Engine.GetWeaponString( f497_arg2, f497_local0, f497_local6 )
	else
		Engine.SendClientScriptNotify( f497_arg2, "CustomClass_remove" .. CoD.GetLocalClientAdjustedNum( f497_arg2 ) )
	end
	if f497_local5 and f497_local5 ~= "" then
		Engine.SendClientScriptNotify( f497_arg2, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f497_arg2 ), f497_local2, f497_local5, CoD.CACUtility.GetCameraNameForAttachments( f497_local5 ), CoD.CACUtility.GetWeaponOptionsFromClass( f497_arg2, f497_local1, f497_local6 ), CoD.CACUtility.GetAttachmentCosmeticVariantsFromClass( f497_arg2, f497_local1, f497_local6 ) )
	else
		Engine.SendClientScriptNotify( f497_arg2, "CustomClass_remove" .. CoD.GetLocalClientAdjustedNum( f497_arg2 ) )
	end
end

function RemoveOverflowItemFromClass( f498_arg0, f498_arg1, f498_arg2 )
	local f498_local0 = CoD.perController[f498_arg2].classModel
	local f498_local1 = f498_arg0.acceptData.classNum
	local f498_local2 = f498_arg0.acceptData.slotName
	local f498_local3 = f498_arg0.acceptData.itemIndex
	local f498_local4 = Engine.GetUsedAllocation( f498_arg2, f498_local1 )
	local f498_local5 = f498_arg1:getModel( f498_arg2, "itemSlot" )
	if f498_local5 then
		f0_local6( Engine.GetModelValue( f498_local5 ), f498_arg2 )
	end
	local f498_local6 = Engine.GetUsedAllocation( f498_arg2, f498_local1 )
	local f498_local7 = f498_local4 - f498_local6
	local f498_local8 = Engine.GetMaxAllocation( f498_arg2 )
	if f498_arg0.itemList.activeWidget:isLastItem() then
		f498_arg0.itemList.savedActiveIndex = f498_arg0.itemList.activeWidget.gridInfoTable.zeroBasedIndex - 1
	end
	local f498_local9 = f498_arg0.itemList:getDataSource()
	if f498_local9.getCount( f498_arg0.itemList ) > 1 then
		f498_arg0.itemList:updateDataSource()
	end
	if f498_local6 < f498_local8 then
		f0_local8( f498_arg0, f498_arg2, f498_local0, f498_local1, f498_local2, f498_local3 )
		BreakWeaponVariantLink( f498_arg2 )
		f498_local9 = GoBack( f498_arg0, f498_arg2 )
		if f498_local9.id ~= "Menu.CustomClass" then
			f498_local9 = GoBack( f498_local9, f498_arg2 )
		else
			local f498_local10 = nil
			local f498_local11 = "select01"
			if LUI.startswith( f498_local2, "primarygadgetattachment" ) then
				f498_local10 = Engine.GetWeaponString( f498_arg2, f498_local1, "primarygadget" )
			elseif LUI.startswith( f498_local2, "secondarygadgetattachment" ) then
				f498_local10 = Engine.GetWeaponString( f498_arg2, f498_local1, "secondarygadget" )
			end
			if f498_local10 and f498_local10 ~= "" then
				Engine.SendClientScriptNotify( f498_arg2, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f498_arg2 ), f498_local2, f498_local10, f498_local11 )
			end
		end
		if f498_local9 then
			f498_local9:processEvent( {
				name = "update_state",
				controller = f498_arg2
			} )
			f0_local3( f498_local9 )
		end
	end
end

function WeaponVariantRemoveItemFromClass( f499_arg0, f499_arg1, f499_arg2 )
	local f499_local0 = CoD.perController[f499_arg2].classNum
	local f499_local1 = Engine.GetUsedAllocation( f499_arg2, f499_local0 )
	local f499_local2 = f499_arg1:getModel( f499_arg2, "itemSlot" )
	if f499_local2 then
		f0_local6( Engine.GetModelValue( f499_local2 ), f499_arg2 )
	end
	local f499_local3 = f499_local1 - Engine.GetUsedAllocation( f499_arg2, f499_local0 )
	if f499_arg0.itemList.activeWidget:isLastItem() then
		f499_arg0.itemList.savedActiveIndex = f499_arg0.itemList.activeWidget.gridInfoTable.zeroBasedIndex - 1
	end
	local f499_local4 = f499_arg0.itemList:getDataSource()
	if f499_local4.getCount( f499_arg0.itemList ) > 1 then
		f499_arg0.itemList:updateDataSource()
	end
	f499_local4 = Engine.GetModel( Engine.GetModelForController( f499_arg2 ), "CACMenu.numItemsToRemove" )
	local f499_local5 = Engine.GetModelValue( f499_local4 ) - f499_local3
	Engine.SetModelValue( f499_local4, f499_local5 )
	if f499_local5 <= 0 then
		f0_local10( f499_arg0, f499_arg2, f499_arg0.acceptData.slotName, f499_arg0.acceptData.weaponVariantInfo, f499_arg0.acceptData.attachmentsByIndex, f499_arg0.acceptData.wildcarUnlockedTable, f499_arg0.acceptData.bonuscardGunfighterForSlot )
		local f499_local6 = GoBack( f499_arg0, f499_arg2 )
		GoBackToCustomClassMenu( f499_local6, f499_arg2 )
		ClearSavedState( f499_local6, f499_arg2 )
	end
end

function RemoveOverflowWildcardFromClass( f500_arg0, f500_arg1, f500_arg2 )
	local f500_local0 = f500_arg1:getModel( f500_arg2, "itemSlot" )
	local f500_local1 = nil
	if f500_local0 then
		f500_local1 = Engine.GetModelValue( f500_local0 )
		f0_local6( f500_local1, f500_arg2 )
	end
	local f500_local2 = CoD.perController[f500_arg2].classModel
	local f500_local3 = f500_arg0.acceptData.classNum
	local f500_local4 = f500_arg0.acceptData.variantInfoElement
	local f500_local5 = nil
	if f500_local4 then
		f500_local5 = f500_arg0.acceptData.wildcarUnlockedTable[1].itemIndex
		table.remove( f500_arg0.acceptData.wildcarUnlockedTable, 1 )
		if #f500_arg0.acceptData.wildcarUnlockedTable > 0 then
			CoD.perController[f500_arg2].wildcardOverCapacityRefName = f500_arg0.acceptData.wildcarUnlockedTable[1].ref
			f500_arg0:updateWildcardToReplaceInfo( f500_arg2 )
		end
	else
		f500_local5 = Engine.GetItemIndexFromReference( f500_arg0.acceptData.wildcardToReplace )
	end
	f0_local8( f500_arg0, f500_arg2, f500_local2, f500_local3, f500_local1, f500_local5 )
	f500_arg0.selectionList:updateDataSource()
	local f500_local6 = Engine.GetModel( Engine.GetModelForController( f500_arg2 ), "CACMenu.numWildcardItemsToRemove" )
	local f500_local7 = Engine.GetModelValue( f500_local6 ) - 1
	Engine.SetModelValue( f500_local6, f500_local7 )
	if f500_local7 <= 0 then
		if f500_local4 then
			SetWeaponVariant( GoBack( f500_arg0, f500_arg2 ), f500_local4, f500_arg2 )
		else
			GoBackToCustomClassMenu( f500_arg0, f500_arg2 )
		end
	end
end

function SetWeaponOptionClassItem( f501_arg0, f501_arg1, f501_arg2 )
	local f501_local0 = CoD.perController[f501_arg2].classModel
	local f501_local1 = CoD.perController[f501_arg2].classNum
	local f501_local2 = CoD.perController[f501_arg2].weaponCategory
	local f501_local3 = CoD.CACUtility.GetBaseWeaponLoadoutSlotName( f501_local2 )
	local f501_local4 = f501_arg1:getModel( f501_arg2, "weaponOptionTypeName" )
	local f501_local5 = f501_arg1:getModel( f501_arg2, "weaponOptionSubIndex" )
	local f501_local6 = f501_arg1:getModel( f501_arg2, "weaponOptionType" )
	if f501_local4 and f501_local5 and f501_local6 then
		local f501_local7 = Engine.GetModelValue( f501_local4 )
		local f501_local8 = Engine.GetModelValue( f501_local5 )
		if Engine.GetModelValue( f501_local6 ) == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB then
			local f501_local9 = Engine.GetModelValue( f501_arg1:getModel( f501_arg2, "paintjobIndex" ) )
			CoD.SetClassItem( f501_arg2, f501_local1, f501_local3 .. f501_local7 .. "slot", Engine.GetModelValue( f501_arg1:getModel( f501_arg2, "paintjobSlot" ) ) )
			CoD.SetClassItem( f501_arg2, f501_local1, f501_local3 .. f501_local7 .. "index", f501_local9 )
		else
			CoD.SetClassItem( f501_arg2, f501_local1, f501_local3 .. f501_local7, f501_local8 )
		end
		if f501_local2 == "primary" or f501_local2 == "secondary" then
			CoD.CACUtility.UpdateWeaponOptions( f501_arg2, f501_local0 )
		end
	end
end

function SetAttachmentVariantClassItem( f502_arg0, f502_arg1, f502_arg2 )
	local f502_local0 = CoD.perController[f502_arg2].classModel
	local f502_local1 = CoD.perController[f502_arg2].classNum
	local f502_local2 = CoD.perController[f502_arg2].weaponCategory
	if f502_local2 then
		CoD.SetClassItem( f502_arg2, f502_local1, f502_local2 .. "cosmeticvariant", f502_arg1.variantIndex )
		CoD.CACUtility.UpdateAttachmentCosmeticVariants( f502_arg2, f502_local0 )
		CoD.CACUtility.GetCustomClassModel( f502_arg2, f502_local1, f502_local0 )
	end
end

function UpdateAllocationBar( f503_arg0, f503_arg1, f503_arg2 )
	local f503_local0 = f503_arg1:getModel( f503_arg2, "allocationSpent" )
	if f503_local0 then
		local f503_local1 = Engine.GetModelValue( f503_local0 )
		if f503_local1 >= 0 then
			for f503_local2 = 1, Engine.GetMaxAllocation( f503_arg2 ), 1 do
				local f503_local5 = f503_arg1["AllocationBar" .. f503_local2 - 1]
				if f503_local5 ~= nil then
					if f503_local2 <= f503_local1 then
						f503_local5:playClip( "PointSpent" )
					else
						f503_local5:playClip( "DefaultClip" )
					end
				end
			end
		end
	end
end

function BubblegumPackOptionsRename( f504_arg0, f504_arg1, f504_arg2 )
	local f504_local0 = f504_arg0:getModel( f504_arg2, "bgbPackIndex" )
	if f504_local0 then
		local f504_local1 = Engine.GetModelValue( f504_local0 )
		Engine.Exec( f504_arg2, "ui_keyboard_new " .. Enum.KeyboardType.KEYBOARD_TYPE_BUBBLEGUM_PACK )
	end
end

function BubblegumPackOptionsCopy( f505_arg0, f505_arg1, f505_arg2 )
	local f505_local0 = f505_arg0:getModel( f505_arg2, "bgbPackIndex" )
	local f505_local1 = f505_arg1:getModel( f505_arg2, "bgbPackIndex" )
	if f505_local0 == f505_local1 then
		return 
	elseif f505_local0 and f505_local1 then
		local f505_local2 = Engine.GetModelValue( f505_local0 )
		local f505_local3 = Engine.GetModelValue( f505_local1 )
		if f505_local2 and f505_local3 then
			Engine.ExecNow( f505_arg2, "copybubblegumpack " .. f505_local2 .. " " .. f505_local3 )
			local f505_local4 = f505_arg0.occludedMenu
			GoBack( f505_arg0, f505_arg2 )
			ClearSavedState( f505_arg0, f505_arg2 )
			GoBack( f505_local4, f505_arg2 )
			ClearSavedState( f505_local4, f505_arg2 )
		end
	end
end

function ClassOptionsCopyLoadout( f506_arg0, f506_arg1, f506_arg2 )
	if IsCurrentClassSelectedClass( f506_arg0, f506_arg1 ) == true then
		return 
	end
	local f506_local0 = f506_arg0:getModel( f506_arg2, "classNum" )
	if not f506_local0 then
		f506_local0 = Engine.GetModel( CoD.perController[f506_arg2].classModel, "classNum" )
	end
	local f506_local1 = f506_arg1:getModel( f506_arg2, "classNum" )
	if f506_local0 and f506_local1 then
		local f506_local2 = Engine.GetModelValue( f506_local0 )
		local f506_local3 = Engine.GetModelValue( f506_local1 )
		if f506_local2 and f506_local3 then
			Engine.ExecNow( f506_arg2, "copyClass " .. f506_local2 .. " " .. f506_local3 )
			CoD.CACUtility.UpdateAllClasses( f506_arg2 )
			local f506_local4 = GoBack( f506_arg0, f506_arg2 )
			ClearSavedState( f506_arg0, f506_arg2 )
			GoBack( f506_local4, f506_arg2 )
			ClearSavedState( f506_local4, f506_arg2 )
		end
	end
end

function ClassOptionsResetToDefault( f507_arg0, f507_arg1, f507_arg2 )
	local f507_local0 = f507_arg0:getModel( f507_arg2, "classNum" )
	if not f507_local0 then
		f507_local0 = Engine.GetModel( CoD.perController[f507_arg2].classModel, "classNum" )
	end
	local f507_local1 = f507_arg1:getModel( f507_arg2, "customClassName" )
	local f507_local2 = f507_arg1:getModel( f507_arg2, "index" )
	if f507_local0 and f507_local1 and f507_local2 then
		local f507_local3 = Engine.GetModelValue( f507_local0 )
		local f507_local4 = Engine.GetModelValue( f507_local1 )
		Engine.ExecNow( f507_arg2, "uiEquipDefaultClass " .. f507_local3 .. " " .. CoD.CACUtility.GetDefaultLoadoutNameFromIndex( Engine.GetModelValue( f507_local2 ) ) )
		local f507_local5 = CoD.CACUtility.GetLoadoutNameFromIndex( f507_arg2, f507_local3 )
		f507_local5:set( f507_local4 )
		CoD.CACUtility.UpdateAllClasses( f507_arg2 )
	end
	local f507_local3 = GoBack( f507_arg0, f507_arg2 )
	ClearSavedState( f507_arg0, f507_arg2 )
	local f507_local4 = GoBack( f507_local3, f507_arg2 )
	ClearSavedState( f507_local3, f507_arg2 )
	if f507_local4 then
		f507_local4:processEvent( {
			name = "update_state",
			controller = f507_arg2
		} )
	end
end

function ClassOptionsClearLoadout( f508_arg0, f508_arg1, f508_arg2 )
	local f508_local0 = CoD.perController[f508_arg2].classNum
	local f508_local1 = CoD.perController[f508_arg2].classModel
	for f508_local2 = 1, #CoD.CACUtility.clearLoadoutSlotOrder, 1 do
		local f508_local5 = CoD.CACUtility.clearLoadoutSlotOrder[f508_local2]
		local f508_local6 = Engine.GetModel( f508_local1, f508_local5 )
		if f508_local6 and CoD.CACUtility.EmptyItemIndex < Engine.GetModelValue( Engine.GetModel( f508_local6, "itemIndex" ) ) then
			CoD.SetClassItem( f508_arg2, f508_local0, f508_local5, CoD.CACUtility.EmptyItemIndex )
		end
	end
	CoD.SetClassItem( f508_arg2, f508_local0, "primarypaintjobslot", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
	CoD.SetClassItem( f508_arg2, f508_local0, "primarypaintjobindex", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
	CoD.SetClassItem( f508_arg2, f508_local0, "secondarypaintjobslot", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
	CoD.SetClassItem( f508_arg2, f508_local0, "secondarypaintjobindex", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
	CoD.CACUtility.GetCustomClassModel( f508_arg2, f508_local0, f508_local1 )
	local f508_local2 = f508_arg0.occludedMenu
	if f508_local2 then
		f508_local2:processEvent( {
			name = "update_state",
			controller = f508_arg2
		} )
	end
end

function PurchaseItem( f509_arg0, f509_arg1, f509_arg2 )
	local f509_local0 = f509_arg1:getModel()
	if f509_local0 then
		Engine.PurchaseItem( f509_arg2, Engine.GetModelValue( Engine.GetModel( f509_local0, "itemIndex" ) ) )
		Engine.SendClientScriptNotify( f509_arg2, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f509_arg2 ), "purchased" )
	end
end

local f0_local11 = function ( f510_arg0, f510_arg1, f510_arg2 )
	local f510_local0 = Engine.GetModelValue( f510_arg2 )
	local f510_local1 = Engine.GetModel( Engine.GetModelForController( f510_arg1 ), "UnlockTokenInfo" )
	Engine.SetModelValue( Engine.GetModel( f510_local1, "itemIndex" ), f510_local0 )
	local f510_local2 = Engine.GetModel( f510_local1, "xpBarInfo" )
	if f510_local2 then
		local f510_local3 = CoD.GetPlayerStats( f510_arg1 )
		local f510_local4 = f510_local3.PlayerStatsList.RANKXP.StatValue:get()
		local f510_local5 = f510_local3.PlayerStatsList.RANK.StatValue:get()
		local f510_local6 = f510_local3.PlayerStatsList.PLEVEL.StatValue:get()
		local f510_local7, f510_local8 = CoD.AARUtility.GetMinMaxXPForRank( f510_local5, f510_arg1 )
		if not f510_local8 then
			f510_local8 = f510_local4
		end
		local f510_local9, f510_local10 = CoD.AARUtility.GetLevelAndLevelIconForRank( f510_local5, f510_local6 )
		local f510_local11, f510_local12 = CoD.AARUtility.GetLevelAndLevelIconForRank( f510_local5 + 1, f510_local6 )
		Engine.SetModelValue( Engine.GetModel( f510_local2, "rankXP" ), f510_local4 )
		Engine.SetModelValue( Engine.GetModel( f510_local2, "xpEarned" ), 0 )
		Engine.SetModelValue( Engine.GetModel( f510_local2, "xpNeeded" ), f510_local8 - f510_local4 )
		Engine.SetModelValue( Engine.GetModel( f510_local2, "currLevel" ), f510_local9 )
		Engine.SetModelValue( Engine.GetModel( f510_local2, "currLevelIcon" ), f510_local10 )
		Engine.SetModelValue( Engine.GetModel( f510_local2, "nextLevel" ), f510_local11 )
		Engine.SetModelValue( Engine.GetModel( f510_local2, "nextLevelIcon" ), f510_local12 )
	end
	CoD.perController[f510_arg1].UnlockTokenInfo = f510_local1
end

function SetUnlockConfirmationInfo( f511_arg0, f511_arg1 )
	local f511_local0 = f511_arg0:getModel( f511_arg1, "itemIndex" )
	if f511_local0 then
		f0_local11( f511_arg0, f511_arg1, f511_local0 )
	end
end

function SetUpgradeConfirmationInfo( f512_arg0, f512_arg1 )
	local f512_local0 = f512_arg0:getModel( f512_arg1, "upgradeItemIndex" )
	if f512_local0 then
		f0_local11( f512_arg0, f512_arg1, f512_local0 )
	end
end

function OpenUnlockClassItemDialog( f513_arg0, f513_arg1, f513_arg2 )
	CoD.OverlayUtility.CreateOverlay( f513_arg2, f513_arg0, "UnlockClassItem", f513_arg2, Engine.GetModelValue( f513_arg1:getModel( f513_arg2, "itemIndex" ) ), nil )
end

function OpenUpgradeClassItemDialog( f514_arg0, f514_arg1, f514_arg2 )
	local f514_local0 = f514_arg1:getModel( f514_arg2, "upgradeItemIndex" )
	if f514_local0 then
		CoD.OverlayUtility.CreateOverlay( f514_arg2, f514_arg0, "UnlockClassItem", f514_arg2, Engine.GetModelValue( f514_arg1:getModel( f514_arg2, "itemIndex" ) ), Engine.GetModelValue( f514_local0 ) )
	end
end

function UnlockItem( f515_arg0, f515_arg1, f515_arg2 )
	local f515_local0 = f515_arg1:getModel( f515_arg2, "itemIndex" )
	local f515_local1 = f515_arg1:getModel( f515_arg2, "upgradeItemIndex" )
	local f515_local2 = nil
	if f515_local1 then
		f515_local2 = Engine.GetModelValue( f515_local1 )
	end
	if f515_local0 then
		local f515_local3 = Engine.GetModelValue( f515_local0 )
		if f515_local2 ~= nil then
			Engine.PurchaseItem( f515_arg2, f515_local2 )
			local f515_local4 = CoD.perController[f515_arg2].weaponCategory
			if f515_local4 then
				CoD.CACUtility.UpgradeEquippedCACItems( f515_arg2, f515_local4, f515_local3, f515_local2 )
			end
		else
			Engine.PurchaseItem( f515_arg2, f515_local3 )
		end
		Engine.SendClientScriptNotify( f515_arg2, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f515_arg2 ), "purchased" )
	end
	SaveLoadout( f515_arg0, f515_arg2 )
	UploadStats( f515_arg0, f515_arg2 )
end

function UnlockAndEquipItem( f516_arg0, f516_arg1, f516_arg2 )
	local f516_local0 = CoD.perController[f516_arg2].weaponCategory
	UnlockItem( f516_arg0, f516_arg1, f516_arg2 )
	local f516_local1 = Engine.GetModelValue( f516_arg1:getModel( f516_arg2, "itemIndex" ) )
	if f516_local0 == "specialist" then
		local f516_local2 = CoD.CCUtility.customizationMode
		local f516_local3 = CoD.CCUtility.Heroes.HeroIndexForEdits
		local f516_local4 = CoD.CCUtility.GetHeroEquippedSlot( f516_arg2, f516_local1 )
		SelectHero( f516_arg0, f516_arg1, f516_arg2 )
		Engine.SetHeroLoadoutItem( f516_arg2, f516_local2, f516_local3, f516_local4 )
	elseif LUI.startswith( f516_local0, "killstreak" ) then
		EquipScorestreak( f516_arg0, f516_arg1, f516_arg2 )
	else
		local f516_local2 = SetClassItem( f516_arg0, f516_arg1, f516_arg2 )
		if LUI.startswith( f516_local0, "bonuscard" ) and not IsCACContextualWildcardOpen( f516_arg2 ) then
			f516_arg1.itemIndex = f516_local1
			FocusClassItem( f516_local2, f516_arg1, f516_arg2 )
		end
		return f516_local2
	end
end

function UnlockAndEquipHeroForMPFirstTimeSetup( f517_arg0, f517_arg1, f517_arg2, f517_arg3, f517_arg4 )
	local f517_local0 = nil
	local f517_local1 = f517_arg1:getModel( f517_arg2, "itemIndex" )
	if f517_local1 then
		f517_local0 = Engine.GetModelValue( f517_local1 )
	end
	if not f517_local0 then
		f517_local0 = f517_arg1.itemIndex
	end
	local f517_local2 = f517_arg4
	if f517_arg3.previousMenu then
		f517_local2 = f517_arg3.previousMenu
	end
	local f517_local3 = CoD.CCUtility.customizationMode
	local f517_local4 = CoD.CCUtility.Heroes.HeroIndexForEdits
	local f517_local5 = CoD.CCUtility.GetHeroEquippedSlot( f517_arg2, f517_local0 )
	if f517_local5 then
		SelectHero( f517_arg0, f517_arg1, f517_arg2 )
		Engine.SetHeroLoadoutItem( f517_arg2, f517_local3, f517_local4, f517_local5 )
		Engine.SetFirstSelectedHeroLoadout( f517_arg2, Enum.CACType.CAC_TYPE_MP_PUBLIC, f517_local4, f517_local5 )
		Engine.SetHeroForCACType( f517_arg2, f517_local3, Enum.CACType.CAC_TYPE_MP_CUSTOM, f517_local4 )
		Engine.SetHeroLoadoutItemForCACType( f517_arg2, f517_local3, Enum.CACType.CAC_TYPE_MP_CUSTOM, f517_local4, f517_local5 )
		Engine.SetFirstSelectedHeroLoadout( f517_arg2, Enum.CACType.CAC_TYPE_MP_CUSTOM, f517_local4, f517_local5 )
		Engine.SetHeroForCACType( f517_arg2, f517_local3, Enum.CACType.CAC_TYPE_MP_ARENA, f517_local4 )
		Engine.SetHeroLoadoutItemForCACType( f517_arg2, f517_local3, Enum.CACType.CAC_TYPE_MP_ARENA, f517_local4, f517_local5 )
		Engine.SetFirstSelectedHeroLoadout( f517_arg2, Enum.CACType.CAC_TYPE_MP_ARENA, f517_local4, f517_local5 )
		SetFirstTimeSetupComplete_MP( f517_arg0, f517_arg1, f517_arg2, "", f517_arg4 )
		SendClientScriptMenuChangeNotify( f517_arg2, f517_local2, false )
		if not IsCACHaveTokens( f517_arg2 ) then
			Engine.ExecNow( f517_arg2, "statWriteMode mp unlocks 1" )
		end
		Engine.PurchaseItem( f517_arg2, f517_local0, f517_local3 )
		SaveLoadout( f517_arg0, f517_arg2 )
	end
end

function TryPurchaseCybercoreAbility( f518_arg0, f518_arg1, f518_arg2 )
	local f518_local0 = f518_arg1:getModel()
	if f518_local0 then
		local f518_local1 = function ( f519_arg0 )
			Engine.SetModelValue( Engine.CreateModel( f518_local0, "itemIndex" ), f519_arg0 )
			SetUnlockConfirmationInfo( f518_arg1, f518_arg2 )
			if not IsCACHaveTokens( f518_arg2 ) then
				OpenPopup( f518_arg0, "OutOfUnlockTokens", f518_arg2 )
			else
				OpenUnlockClassItemDialog( f518_arg0, f518_arg1, f518_arg2 )
			end
		end
		
		local f518_local2 = Engine.GetModelValue( Engine.GetModel( f518_local0, "prereqItemIndex" ) )
		if f518_local2 == -1 or Engine.IsItemPurchased( f518_arg2, f518_local2 ) then
			local f518_local3 = Engine.GetModelValue( Engine.GetModel( f518_local0, "baseItemIndex" ) )
			if not Engine.IsItemPurchased( f518_arg2, f518_local3 ) then
				f518_local1( f518_local3 )
			else
				local f518_local4 = Engine.GetModelValue( Engine.GetModel( f518_local0, "upgradeItemIndex" ) )
				if f518_local4 and not Engine.IsItemPurchased( f518_arg2, f518_local4 ) then
					f518_local1( f518_local4 )
				end
			end
		end
	end
end

function UpdateCybercoreTree( f520_arg0, f520_arg1, f520_arg2 )
	if f520_arg0.upgradeTree then
		f520_arg0.upgradeTree:updateTree( f520_arg2 )
	end
end

function ToggleAttachmentCosmeticVariant( f521_arg0, f521_arg1, f521_arg2 )
	local f521_local0 = f521_arg0:getModel()
	local f521_local1 = CoD.perController[f521_arg2].weaponSlot
	local f521_local2 = CoD.perController[f521_arg2].classNum
	local f521_local3 = f521_arg1:getModel()
	local f521_local4 = CoD.CACUtility.GetCACWeaponACVList( f521_local1 )
	if f521_local3 then
		local f521_local5 = Engine.GetModelValue( Engine.GetModel( f521_local3, "itemIndex" ) )
		local f521_local6 = f521_arg1.attachmentTableIndex
		if f521_local6 == nil and f521_arg1:getParent() then
			local f521_local7 = f521_arg1:getParent()
			f521_local6 = f521_local7.attachmentTableIndex
		end
		if Engine.GetAttachmentRefByIndex( f521_local6 ) == "dw" then
			return 
		elseif CoD.CACUtility.DoesWeaponHaveDWInSlot( f521_local1, f521_arg2, f521_local0 ) then
			return 
		end
		local f521_local7 = CoD.CACUtility.AttachmentEquippedInCACSlot( f521_arg2, f521_local1, f521_local5 )
		local f521_local8 = Engine.GetModelValue( Engine.GetModel( f521_local0, f521_local1 .. ".itemIndex" ) )
		local f521_local9 = Engine.GetWeaponString( f521_arg2, f521_local2, f521_local1 )
		if f521_local8 then
			local f521_local10 = Engine.GetModel( f521_local3, "name" )
			local f521_local11 = Engine.GetModel( f521_local3, "image" )
			if f521_arg1.acvIndex == 0 then
				local f521_local12 = Engine.GetAttachmentCosmeticVariant( f521_local9, f521_local6 )
				if f521_local12 then
					Engine.SetModelValue( f521_local10, f521_local12.name )
					Engine.SetModelValue( f521_local11, f521_local12.image )
					f521_arg1.acvIndex = 1
				end
			else
				Engine.SetModelValue( f521_local10, Engine.GetAttachmentNameByIndex( f521_local6 ) )
				Engine.SetModelValue( f521_local11, Engine.GetAttachmentUniqueImageByIndex( f521_local8, f521_local5 ) )
				f521_arg1.acvIndex = 0
			end
			if f521_local7 then
				CoD.SetClassItem( f521_arg2, f521_local2, f521_local4[f521_local7], f521_arg1.acvIndex )
			end
			f521_arg0:playSound( "toggle_switch" )
			FocusClassItem( f521_arg0, f521_arg1, f521_arg2 )
		end
	end
end

function SetCACWeaponAsOld( f522_arg0, f522_arg1, f522_arg2 )
	local f522_local0 = f522_arg1:getModel( f522_arg2, "itemIndex" )
	if CoD.PrestigeUtility.isInPermanentUnlockMenu then
		return 
	elseif f522_local0 then
		local f522_local1 = Engine.GetModelValue( f522_local0 )
		if f522_local1 > CoD.CACUtility.EmptyItemIndex then
			Engine.SetItemAsOld( f522_arg2, f522_local1 )
			if f522_arg0.weaponCategoryList and f522_arg0.weaponCategoryList.Tabs.grid then
				local f522_local2 = f522_arg0.weaponCategoryList.Tabs.grid:getItemAt( f522_arg0.weaponCategoryList.Tabs.grid.savedActiveIndex + 1 )
				if f522_local2 then
					local f522_local3 = f522_local2:getModel( f522_arg2, "breadcrumbCount" )
					if f522_local3 then
						Engine.SetModelValue( f522_local3, Engine.WeaponGroupNewItemCount( f522_arg2, f522_local2.filter ) )
					end
				end
			end
		end
	end
end

function SetCACItemAsOld( f523_arg0, f523_arg1 )
	local f523_local0 = f523_arg0:getModel( f523_arg1, "itemIndex" )
	if CoD.PrestigeUtility.isInPermanentUnlockMenu then
		return 
	elseif f523_local0 then
		local f523_local1 = Engine.GetModelValue( f523_local0 )
		if f523_local1 > CoD.CACUtility.EmptyItemIndex then
			Engine.SetItemAsOld( f523_arg1, f523_local1 )
		end
	end
end

function SetCACAttachmentAsOld( f524_arg0, f524_arg1 )
	local f524_local0 = f524_arg0:getModel( f524_arg1, "itemIndex" )
	if f524_local0 then
		local f524_local1 = Engine.GetModelValue( f524_local0 )
		if f524_local1 > CoD.CACUtility.EmptyItemIndex then
			Engine.SetAttachmentAsOld( f524_arg1, f524_arg0.weaponIndex, f524_local1 )
		end
	end
end

function SetSpecialistAsOld( f525_arg0, f525_arg1, f525_arg2 )
	if CoD.PrestigeUtility.isInPermanentUnlockMenu then
		return 
	elseif IsProgressionEnabled( f525_arg2 ) then
		local f525_local0 = Engine.CurrentSessionMode()
		local f525_local1 = f525_arg1.heroIndex
		if f525_local1 then
			for f525_local2 = 0, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_COUNT - 1, 1 do
				local f525_local5 = Engine.GetLoadoutItemIndexForHero( f525_local0, f525_local1, f525_local2 )
				if CoD.CACUtility.EmptyItemIndex < f525_local5 and Engine.IsItemNew( f525_arg2, f525_local5 ) then
					Engine.SetItemAsOld( f525_arg2, f525_local5 )
					f525_arg0:processEvent( {
						name = "update_state",
						menu = f525_arg0
					} )
				end
			end
		end
	end
end

local f0_local12 = function ( f526_arg0, f526_arg1, f526_arg2, f526_arg3 )
	local f526_local0 = f526_arg1:getModel( f526_arg2, "weaponOptionSubIndex" )
	local f526_local1 = f526_arg1:getModel( f526_arg2, "weaponOptionType" )
	local f526_local2 = f526_arg1:getModel( f526_arg2, "unlockSessionMode" )
	if f526_local0 and f526_local1 and f526_local2 then
		local f526_local3 = Engine.GetModelValue( f526_local0 )
		local f526_local4 = Engine.GetModelValue( f526_local1 )
		local f526_local5 = Engine.GetModelValue( f526_local2 )
		if f526_local4 ~= Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB and f526_local4 ~= Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_INVALID and f526_local3 > CoD.CACUtility.EmptyItemIndex then
			Engine.SetWeaponOptionAsOld( f526_arg2, f526_arg3, Engine.GetWeaponOptionGroupIndex( f526_local3, f526_local4 ), f526_local5 )
			if f526_arg0.categoryTabs and f526_arg0.categoryTabs.Tabs.grid then
				local f526_local6 = f526_arg0.categoryTabs.Tabs.grid:getItemAt( f526_arg0.categoryTabs.Tabs.grid.savedActiveIndex + 1 )
				if f526_local6 then
					local f526_local7 = f526_local6:getModel( f526_arg2, "breadcrumbCount" )
					if f526_local7 then
						local f526_local8 = 0
						if f526_local6.filterEnum < Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_MODE_COUNT then
							f526_local8 = Engine.WeaponOptionNewItemCount( f526_arg2, f526_arg3, f526_local4, f526_local6.filterEnum )
						else
							f526_local8 = Engine.WeaponOptionNewModeAgnosticItemCount( f526_arg2, f526_arg3, f526_local4, f526_local6.filterEnum )
						end
						Engine.SetModelValue( f526_local7, f526_local8 )
					end
				end
			end
		end
	end
end

function SetWeaponOptionAsOld( f527_arg0, f527_arg1, f527_arg2 )
	f0_local12( f527_arg0, f527_arg1, f527_arg2, Engine.GetModelValue( Engine.GetModel( CoD.perController[f527_arg2].classModel, CoD.perController[f527_arg2].weaponCategory .. ".itemIndex" ) ) )
end

local f0_local13 = function ( f528_arg0, f528_arg1, f528_arg2, f528_arg3, f528_arg4 )
	Engine.SetACVItemOld( f528_arg0, f528_arg1, f528_arg2, f528_arg3, f528_arg4 )
end

function SetCACACVAsOld( f529_arg0, f529_arg1 )
	local f529_local0 = CoD.WC_Category.ACV.selectedAttachmentWeaponIndex
	if f529_local0 and f529_arg0.attachmentRef and f529_arg0.variantIndex then
		f0_local13( f529_arg1, f529_local0, f529_arg0.attachmentRef, f529_arg0.variantIndex, Engine.CurrentSessionMode() )
	end
end

function DisableProgressionCP( f530_arg0 )
	CoD.perController[f530_arg0].everythingUnlocked = true
	if CoD.perController[f530_arg0].restrictedItemIndices == nil then
		CoD.perController[f530_arg0].restrictedItemIndices = {}
	end
end

function EnableProgressionCP( f531_arg0 )
	CoD.perController[f531_arg0].everythingUnlocked = nil
	if CoD.perController[f531_arg0].restrictedItemIndices ~= nil then
		for f531_local3, f531_local4 in ipairs( CoD.perController[f531_arg0].restrictedItemIndices ) do
			Engine.SetItemRestrictionState( f531_local4, Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_NONE )
		end
		CoD.perController[f531_arg0].restrictedItemIndices = nil
	end
end

function SetHintText( f532_arg0, f532_arg1, f532_arg2 )
	local f532_local0 = nil
	if f532_arg1 then
		if f532_arg1.hintText then
			f532_local0 = f532_arg1.hintText
		else
			local f532_local1 = f532_arg1:getModel()
			if f532_local1 then
				local f532_local2 = Engine.GetModel( f532_local1, "hintText" )
				if f532_local2 then
					f532_local0 = Engine.GetModelValue( f532_local2 )
				end
			end
		end
	end
	if f532_local0 == nil then
		DataSources.PerController.clearHintText( f532_arg2 )
	else
		DataSources.PerController.setHintText( f532_arg2, f532_local0 )
	end
end

function PDV_DataVaultOpened( f533_arg0, f533_arg1 )
	Engine.SendMenuResponse( f533_arg1, "PersonalDataVaultMenu", "mainCam" )
	PrepareOpenMenuInSafehouse( f533_arg1 )
	CoD.perController[f533_arg1].InspectingDataVault = true
end

function PDV_DataVaultClosed( f534_arg0, f534_arg1 )
	Engine.SendMenuResponse( f534_arg1, "PersonalDataVaultMenu", "closed" )
	PrepareCloseMenuInSafehouse( f534_arg1 )
	CoD.perController[f534_arg1].InspectingDataVault = false
	Close( f534_arg0, f534_arg1 )
end

function PDV_SetChoosingMap( f535_arg0, f535_arg1, f535_arg2 )
	f535_arg0:updateMode( CoD.PDV_Collectibles.Modes.SELECTING_MISSION, f535_arg1 )
end

function PDV_SetChoosingCollectible( f536_arg0, f536_arg1, f536_arg2 )
	f536_arg0:updateMode( CoD.PDV_Collectibles.Modes.SELECTING_COLLECTIBLE, f536_arg1 )
end

function PDV_SetInspectingCollectible( f537_arg0, f537_arg1, f537_arg2 )
	f537_arg0:updateMode( CoD.PDV_Collectibles.Modes.INSPECTING_COLLECTIBLE, f537_arg1 )
end

function PDV_ChangeCollectibleArea( f538_arg0, f538_arg1, f538_arg2 )
	Engine.SendClientScriptNotify( f538_arg2, "collectibles_slot_change" .. CoD.GetLocalClientAdjustedNum( f538_arg2 ), f538_arg1.collectibleSize )
	CoD.perController[f538_arg2].inspectingCollectibleSize = f538_arg1.collectibleSize
end

function PDV_ClearCollectible( f539_arg0, f539_arg1, f539_arg2 )
	local f539_local0 = f539_arg1:getModel( f539_arg2, "collectibleSlot" )
	if f539_local0 then
		local f539_local1 = Engine.GetModelValue( f539_local0 )
		Engine.ClearBunkCollectible( f539_arg2, f539_local1 )
		Engine.SendClientScriptNotify( f539_arg2, "collectible_update" .. CoD.GetLocalClientAdjustedNum( f539_arg2 ), "unequip", f539_local1 )
	end
end

function PDV_ClearPreviewCollectible( f540_arg0, f540_arg1, f540_arg2 )
	local f540_local0 = f540_arg1:getModel( f540_arg2, "collectibleSlot" )
	if f540_local0 then
		Engine.SendClientScriptNotify( f540_arg2, "collectible_update" .. CoD.GetLocalClientAdjustedNum( f540_arg2 ), "clear_preview_collectible", Engine.GetModelValue( f540_local0 ) )
	end
end

function PDV_ChangeFocusCollectibleSlot( f541_arg0, f541_arg1, f541_arg2 )
	local f541_local0 = f541_arg1:getModel( f541_arg2, "collectibleSlot" )
	if f541_local0 then
		local f541_local1 = Engine.GetModelValue( f541_local0 )
		for f541_local6, f541_local7 in ipairs( Engine.GetAssetList( CoD.mapsTable[CoD.perController[f541_arg2].placeCollectibleMapName].collectibles ) ) do
			if f541_local7.name == CoD.perController[f541_arg2].placeCollectibleName then
				local f541_local5 = f541_local7.uiModel
				if f541_local7.uiModelWithStand ~= nil then
					f541_local5 = f541_local7.uiModelWithStand
				end
				Engine.SendClientScriptNotify( f541_arg2, "collectible_update" .. CoD.GetLocalClientAdjustedNum( f541_arg2 ), "focus_change", f541_local1, f541_local5 )
			end
		end
	end
end

function PDV_SelectCollectibleSlot( f542_arg0, f542_arg1, f542_arg2 )
	local f542_local0 = f542_arg1:getModel( f542_arg2, "collectibleSlot" )
	if f542_local0 then
		local f542_local1 = Engine.GetModelValue( f542_local0 )
		local f542_local2 = Engine.SetBunkCollectible( f542_arg2, f542_local1, CoD.perController[f542_arg2].placeCollectibleMapName, CoD.perController[f542_arg2].placeCollectibleName )
		if f542_local2 ~= Enum.bunkCollectibleSlots_e.BUNK_INVALID_SLOT then
			Engine.SendClientScriptNotify( f542_arg2, "collectible_update" .. CoD.GetLocalClientAdjustedNum( f542_arg2 ), "unequip", f542_local2 )
		end
		for f542_local7, f542_local8 in ipairs( Engine.GetAssetList( CoD.mapsTable[CoD.perController[f542_arg2].placeCollectibleMapName].collectibles ) ) do
			if f542_local8.name == CoD.perController[f542_arg2].placeCollectibleName then
				local f542_local6 = f542_local8.uiModel
				if f542_local8.uiModelWithStand ~= nil then
					f542_local6 = f542_local8.uiModelWithStand
				end
				Engine.SendClientScriptNotify( f542_arg2, "collectible_update" .. CoD.GetLocalClientAdjustedNum( f542_arg2 ), "equip", f542_local1, f542_local6 )
			end
		end
	end
end

function MRV_SelectReplayMission( f543_arg0, f543_arg1, f543_arg2 )
	local f543_local0 = Engine.GetModel( f543_arg0:getModel(), "selectedMission" )
	if f543_arg1 == nil or f543_arg1.mapId == nil or CoD.mapsTable[f543_arg1.mapId] == nil then
		return 
	end
	local f543_local1 = CoD.mapsTable[f543_arg1.mapId]
	Engine.SetModelValue( Engine.GetModel( f543_local0, "mapName" ), f543_local1.mapName )
	Engine.SetModelValue( Engine.GetModel( f543_local0, "mapNameCaps" ), f543_local1.mapNameCaps )
	Engine.SetModelValue( Engine.GetModel( f543_local0, "previewImage" ), f543_local1.previewImage )
	Engine.SetModelValue( Engine.GetModel( f543_local0, "mapLocation" ), f543_local1.mapLocation )
	Engine.SetModelValue( Engine.GetModel( f543_local0, "mapDescription" ), f543_local1.mapDescription )
	local f543_local2 = 0
	local f543_local3 = 0
	if f543_local1.collectibles then
		local f543_local4 = Engine.GetAssetList( f543_local1.collectibles )
		if f543_local4 ~= nil then
			f543_local2 = #f543_local4
			for f543_local5 = 0, f543_local2 - 1, 1 do
				if Engine.ClientHasCollectible( f543_arg2, f543_arg1.mapId, f543_local5 ) then
					f543_local3 = f543_local3 + 1
				end
			end
		end
	end
	local f543_local4 = Engine.GetPlayerStats( f543_arg2 )
	local f543_local5 = f543_local4.PlayerStatsByMap[f543_local1.rootMapName].highestStats
	Engine.SetModelValue( Engine.GetModel( f543_local0, "collectiblesFound" ), f543_local3 )
	Engine.SetModelValue( Engine.GetModel( f543_local0, "collectiblesTotal" ), f543_local2 )
	Engine.SetModelValue( Engine.GetModel( f543_local0, "highestScore" ), f543_local5.SCORE:get() )
	Engine.SetModelValue( Engine.GetModel( f543_local0, "completionDifficulty" ), f543_local5.HIGHEST_DIFFICULTY:get() )
end

function MRV_ClickReplayMission( f544_arg0, f544_arg1, f544_arg2, f544_arg3 )
	if f544_arg2 == nil or f544_arg2.mapId == nil or CoD.mapsTable[f544_arg2.mapId] == nil then
		return 
	elseif IsElementPropertyValue( f544_arg2, "classified", true ) then
		f544_arg1:OpenModalDialog( f544_arg0, f544_arg3, "MENU_OUTOFORDER_PLAY", "", {
			"MPUI_YES",
			"MPUI_NO"
		}, function ( f545_arg0 )
			if f545_arg0 == 0 then
				local f545_local0 = Engine.GetPlayerStats( f544_arg3, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_CAMPAIGN )
				f545_local0.allMapsUnlocked:set( 1 )
				f544_arg0.MapList:updateDataSource()
			end
			return true
		end )
	else
		local f544_local0 = Engine.GetModel( Engine.GetGlobalModel(), "nextMap" )
		if f544_local0 ~= nil then
			Engine.SetModelValue( f544_local0, f544_arg2.mapId )
			SendMenuResponseExpression( f544_arg3, "MissionRecordVaultMenu", f544_arg2.mapId )
			Engine.SetDvar( "ui_blocksaves", "1" )
			LockInput( f544_arg0, f544_arg3, false )
			SendMenuResponse( f544_arg0, "MissionRecordVaultMenu", "closed", f544_arg3 )
		end
	end
end

function MRV_SelectAccolade( f546_arg0, f546_arg1, f546_arg2 )
	local f546_local0 = f546_arg1:getModel()
	if f546_arg1 == nil or f546_local0 == nil then
		return 
	end
	local f546_local1 = Engine.GetModel( f546_arg0:getModel(), "selectedAccolade" )
	local f546_local2 = {
		"challengeName",
		"challengeDetails",
		"challengeProgressQuantity",
		"rewardImage",
		"rewardName",
		"completed",
		"centerText",
		"challengeWidget"
	}
	for f546_local3 = 1, #f546_local2, 1 do
		local f546_local6 = Engine.GetModel( f546_local0, f546_local2[f546_local3] )
		if f546_local6 then
			f546_local6 = Engine.GetModelValue( f546_local6 )
		end
		if f546_local6 == nil then
			Engine.SetModelValue( Engine.GetModel( f546_local1, f546_local2[f546_local3] ), "" )
		else
			Engine.SetModelValue( Engine.GetModel( f546_local1, f546_local2[f546_local3] ), f546_local6 )
		end
	end
end

function ClearSavedHeroForEdits( f547_arg0 )
	CoD.CCUtility.Heroes.HeroIndexForEdits = nil
end

function RefreshCharacterCustomization( f548_arg0, f548_arg1, f548_arg2 )
	Engine.SendClientScriptNotify( f548_arg2, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f548_arg2 ), "refresh", Engine.GetLocalClientNum( f548_arg2 ), CoD.CCUtility.customizationMode )
end

function SelectGender( f549_arg0, f549_arg1, f549_arg2 )
	if f549_arg1.gender then
		Engine.SetGender( f549_arg2, f549_arg1.gender )
		RefreshCharacterCustomization( f549_arg0, f549_arg1, f549_arg2 )
	end
end

function SelectHead( f550_arg0, f550_arg1, f550_arg2 )
	if f550_arg1.headIndex then
		Engine.SetHead( f550_arg2, CoD.CCUtility.customizationMode, f550_arg1.headIndex )
		RefreshCharacterCustomization( f550_arg0, f550_arg1, f550_arg2 )
	end
end

function HeadHighlighted( f551_arg0, f551_arg1, f551_arg2 )
	Engine.SendClientScriptNotify( f551_arg2, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f551_arg2 ), "changeHead", f551_arg1.headIndex, CoD.CCUtility.customizationMode )
end

function CancelHeadSelection( f552_arg0, f552_arg1 )
	Engine.SendClientScriptNotify( f552_arg1, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f552_arg1 ), "changeHead", CoD.CCUtility.Heroes.selectedHead )
end

local f0_local14 = function ( f553_arg0, f553_arg1 )
	local f553_local0 = Engine.GetProfileVarInt( f553_arg0, f553_arg1 )
	if f553_local0 ~= 0 then
		return f553_local0 - 1
	else
		
	end
end

local f0_local15 = function ( f554_arg0, f554_arg1, f554_arg2 )
	Engine.SetProfileVar( f554_arg0, f554_arg1, f554_arg2 + 1 )
end

function UpdateDifficulty( f555_arg0, f555_arg1, f555_arg2 )
	local f555_local0 = Engine.GetProfileVarInt( f555_arg2, "g_gameskill" ) or 0
	if f555_arg1 == LobbyData.UITargets.UI_CPLOBBYONLINE.name then
		f555_local0 = f0_local14( f555_arg2, "g_gameskill_online_cp" ) or f555_local0
	elseif f555_arg1 == LobbyData.UITargets.UI_CPLOBBYLANGAME.name then
		f555_local0 = f0_local14( f555_arg2, "g_gameskill_offline_cp" ) or f555_local0
	elseif f555_arg1 == LobbyData.UITargets.UI_CP2LOBBYONLINE.name then
		f555_local0 = f0_local14( f555_arg2, "g_gameskill_online_cpzm" ) or f555_local0
	elseif f555_arg1 == LobbyData.UITargets.UI_CP2LOBBYLANGAME.name then
		f555_local0 = f0_local14( f555_arg2, "g_gameskill_offline_cpzm" ) or f555_local0
	else
		return 
	end
	Engine.SetProfileVar( f555_arg2, "g_gameskill", f555_local0 )
	Engine.Exec( f555_arg2, "updategamerprofile" )
end

function SetDifficulty( f556_arg0, f556_arg1, f556_arg2 )
	if f556_arg1.difficulty then
		Engine.SetProfileVar( f556_arg2, "g_gameskill", f556_arg1.difficulty )
		if Engine.IsCampaignModeZombies() and not IsLive() then
			f0_local15( f556_arg2, "g_gameskill_offline_cpzm", f556_arg1.difficulty )
		elseif Engine.IsCampaignModeZombies() then
			f0_local15( f556_arg2, "g_gameskill_online_cpzm", f556_arg1.difficulty )
		elseif not IsLive() then
			f0_local15( f556_arg2, "g_gameskill_offline_cp", f556_arg1.difficulty )
		else
			f0_local15( f556_arg2, "g_gameskill_online_cp", f556_arg1.difficulty )
		end
		Engine.Exec( f556_arg2, "updategamerprofile" )
		local f556_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "CampaignSettings" )
		Engine.SetModelValue( Engine.CreateModel( f556_local0, "difficulty" ), Engine.Localize( CoD.DIFFICULTY[Engine.GetProfileVarInt( f556_arg2, "g_gameskill" )] ) )
		Engine.SetModelValue( Engine.CreateModel( f556_local0, "difficultyIcon" ), CoD.DIFFICULTY_ICON[Engine.GetProfileVarInt( f556_arg2, "g_gameskill" )] )
		Engine.SendMenuResponse( f556_arg2, "difficulty", f556_arg1.difficulty )
	end
end

function SetSelectedCPMission( f557_arg0, f557_arg1, f557_arg2 )
	if f557_arg1.mapId ~= nil then
		local f557_local0 = f557_arg1.mapId
		if Engine.IsCampaignModeZombies() == true then
			SetMap( f557_arg2, string.gsub( f557_arg1.mapId, "_nightmares", "" ), false )
		else
			SetMap( f557_arg2, f557_local0, true )
		end
	end
end

function SetFirstTimeSetupComplete( f558_arg0, f558_arg1, f558_arg2 )
	Engine.SetFirstTimeComplete( f558_arg2, Enum.eModes.MODE_CAMPAIGN, true )
end

function GetPlaylistIDForSelectedCPMission( f559_arg0, f559_arg1, f559_arg2 )
	if f559_arg1.mapId ~= nil then
		local f559_local0 = f559_arg1.mapId
		local f559_local1 = CoD.mapsTable[f559_local0]
		for f559_local11, f559_local12 in ipairs( Engine.GetPlaylistCategories() ) do
			if not (not Engine.IsCampaignModeZombies() or f559_local12.ref ~= "cp_nightmares_public") or not Engine.IsCampaignModeZombies() and f559_local12.ref == "cp_public" then
				local f559_local5 = f559_local12.playlists
				if f559_local5 then
					for f559_local9, f559_local10 in ipairs( f559_local5 ) do
						if string.find( f559_local10.name, f559_local0 ) ~= nil then
							return f559_local10.index
						end
					end
				end
			end
		end
	end
	return 0
end

function SelectHero( f560_arg0, f560_arg1, f560_arg2 )
	local f560_local0 = nil
	if CoD.CCUtility.Heroes.HeroIndexForEdits then
		local f560_local1 = Engine.GetHeroSelectSoundAlias( CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits )
		if f560_local1 ~= "" then
			f560_local0 = f560_local1
		end
		Engine.SetHero( f560_arg2, CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits )
		local f560_local2 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
		if Engine.InLobbyParty( Enum.LobbyType.LOBBY_TYPE_GAME ) == true then
			f560_local2 = Enum.LobbyType.LOBBY_TYPE_GAME
		end
		if Engine.SendClientHeartbeat then
			Engine.SendClientHeartbeat( f560_arg2, f560_local2 )
		end
	end
	f560_arg1:dispatchEventToChildren( {
		name = "gamepad_button",
		down = true,
		button = "primary",
		isRepeated = false,
		controller = f560_arg2
	} )
	Engine.SendClientScriptNotify( f560_arg2, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f560_arg2 ), "refresh", Engine.GetLocalClientNum( f560_arg2 ), CoD.CCUtility.customizationMode, f560_local0 )
	ClearSavedHeroForEdits( f560_arg2 )
end

local f0_local16 = function ( f561_arg0, f561_arg1, f561_arg2, f561_arg3 )
	local f561_local0 = f0_local5( f561_arg1, f561_arg2 )
	local f561_local1 = f561_local0.activeWidget
	f561_arg2:setState( "DefaultState", true )
	if f561_local1 then
		f561_local0:setActiveItem( f561_local1 )
	end
end

function NavigateToNextHeroCard( f562_arg0, f562_arg1, f562_arg2, f562_arg3 )
	if FirstTimeSetup_Overview( f562_arg3 ) then
		FirstTimeSetup_SetChangedCharacter( f562_arg3 )
		if SelectNextItemIfPossibleAndNotDisabled( f562_arg1, f562_arg2, f562_arg3 ) and f562_arg2.currentState == "Flipped" then
			f0_local16( f562_arg0, f562_arg1, f562_arg2, f562_arg3 )
		end
	elseif FirstTimeSetup_ChangedCharacter( f562_arg3 ) then
		if SelectNextItemIfPossibleAndNotDisabled( f562_arg1, f562_arg2, f562_arg3 ) and f562_arg2.currentState == "Flipped" then
			f0_local16( f562_arg0, f562_arg1, f562_arg2, f562_arg3 )
		end
	elseif SelectNextItemIfPossible( f562_arg1, f562_arg2, f562_arg3 ) and f562_arg2.currentState == "Flipped" then
		f0_local16( f562_arg0, f562_arg1, f562_arg2, f562_arg3 )
	end
end

function NavigateToPreviousHeroCard( f563_arg0, f563_arg1, f563_arg2, f563_arg3 )
	if FirstTimeSetup_Overview( f563_arg3 ) then
		FirstTimeSetup_SetChangedCharacter( f563_arg3 )
		if SelectPreviousItemIfPossibleAndNotDisabled( f563_arg1, f563_arg2, f563_arg3 ) and f563_arg2.currentState == "Flipped" then
			f0_local16( f563_arg0, f563_arg1, f563_arg2, f563_arg3 )
		end
	elseif FirstTimeSetup_ChangedCharacter( f563_arg3 ) then
		if SelectPreviousItemIfPossibleAndNotDisabled( f563_arg1, f563_arg2, f563_arg3 ) and f563_arg2.currentState == "Flipped" then
			f0_local16( f563_arg0, f563_arg1, f563_arg2, f563_arg3 )
		end
	elseif SelectPreviousItemIfPossible( f563_arg1, f563_arg2, f563_arg3 ) and f563_arg2.currentState == "Flipped" then
		f0_local16( f563_arg0, f563_arg1, f563_arg2, f563_arg3 )
	end
end

function PlaySpecialistTransmission( f564_arg0, f564_arg1 )
	StopSpecialistTransmission( f564_arg0, f564_arg1 )
	local f564_local0 = f564_arg0:getModel( f564_arg1, "playingSound" )
	local f564_local1 = CoD.SafeGetModelValue( f564_arg0:getModel(), "alias" )
	if f564_local0 and not Engine.GetModelValue( f564_local0 ) and f564_local1 and f564_local1 ~= "" then
		Engine.SetModelValue( f564_local0, true )
		f564_arg0.soundTimer = LUI.UITimer.newElementTimer( Engine.GetSoundPlaybackTime( f564_local1 ) or 5000, true, function ()
			Engine.SetModelValue( f564_local0, false )
			f564_arg0.soundTimer = nil
		end )
		f564_arg0:addElement( f564_arg0.soundTimer )
		Engine.PlaySound( f564_local1 )
	end
end

function StopSpecialistTransmission( f566_arg0, f566_arg1 )
	local f566_local0 = f566_arg0:getModel( f566_arg1, "playingSound" )
	if f566_local0 and Engine.GetModelValue( f566_local0 ) then
		if f566_arg0.soundTimer then
			f566_arg0.soundTimer:close()
			f566_arg0.soundTimer = nil
		end
		StopSoundFromElementModel( f566_arg1, f566_arg0, "alias" )
		Engine.SetModelValue( f566_local0, false )
	end
end

function SetEdittingHeroFromStats( f567_arg0 )
	CoD.CCUtility.Heroes.HeroIndexForEdits = Engine.GetEquippedHero( f567_arg0, CoD.CCUtility.customizationMode )
end

local f0_local17 = function ( f568_arg0, f568_arg1 )
	local f568_local0 = "weapon"
	if f568_arg1 == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET then
		f568_local0 = "ability"
	end
	Engine.SendClientScriptNotify( f568_arg0, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f568_arg0 ), "changeFrozenMoment", f568_local0 )
end

function UpdateEditingHero( f569_arg0, f569_arg1 )
	if f569_arg0.heroIndex then
		CoD.CCUtility.Heroes.HeroIndexForEdits = f569_arg0.heroIndex
		Engine.SendClientScriptNotify( f569_arg1, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f569_arg1 ), "changeHero", CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.customizationMode )
		f0_local17( f569_arg1, Engine.GetLoadoutTypeForHero( f569_arg1, f569_arg0.heroIndex ) )
	end
end

function HeroLoadoutPreviewChange( f570_arg0, f570_arg1 )
	if not f570_arg0.disabled then
		f0_local17( f570_arg1, f570_arg0.equippedSlot )
	end
end

function HeroLoadoutChanged( f571_arg0, f571_arg1, f571_arg2 )
	if not f571_arg1.disabled then
		Engine.SetHeroLoadoutItem( f571_arg2, CoD.CCUtility.customizationMode, f571_arg1.heroIndex, f571_arg1.equippedSlot )
		SaveLoadout( f571_arg0, f571_arg2 )
	end
end

function BeginEdittingHeroOption( f572_arg0, f572_arg1, f572_arg2 )
	if f572_arg0.updateMode then
		local f572_local0 = f572_arg1:getModel( f572_arg2, "colorListDatasource" )
		local f572_local1 = ""
		if f572_local0 then
			f572_local1 = Engine.GetModelValue( f572_local0 )
		end
		f572_arg0.updateMode( CoD.CCUtility.PersonalizeHeroData.Modes.EdittingOption, nil, f572_arg1, f572_local1 ~= "" )
	end
end

function BeginChoosingGestureOption( f573_arg0, f573_arg1 )
	if f573_arg0.updateMode then
		f573_arg0.updateMode( CoD.CCUtility.TauntsData.Modes.EdittingGesture, nil, f573_arg1.gestureType )
	end
end

function CancelChoosingGestureOption( f574_arg0 )
	if f574_arg0.updateMode then
		f574_arg0.updateMode( CoD.CCUtility.TauntsData.Modes.ExploringTaunts, false )
	end
end

function GestureItemSelected( f575_arg0, f575_arg1, f575_arg2 )
	Engine.SelectGesture( f575_arg2, CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.TauntsData.EdittingTauntOrGestureType, f575_arg1.index )
	if f575_arg0.updateMode then
		f575_arg0.updateMode( CoD.CCUtility.TauntsData.Modes.ExploringTaunts, true )
	end
end

local f0_local18 = function ( f576_arg0, f576_arg1 )
	Engine.SendClientScriptNotify( f576_arg0, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f576_arg0 ), "previewGesture", f576_arg1 )
end

function PreviewGesture( f577_arg0, f577_arg1 )
	f0_local18( f577_arg0, f577_arg1.xanim )
end

function PreviewGestureForStyle( f578_arg0, f578_arg1 )
	local f578_local0 = Engine.GetHeroBundleInfo( CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits )
	if CoD.CCUtility.TauntsData.GetGestureCount( f578_local0, f578_arg1 ) > 0 then
		f0_local18( f578_arg0, CoD.CCUtility.TauntsData.GetGestureXAnim( f578_local0, f578_arg1, Engine.GetSelectedGestureForHero( f578_arg0, CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits, f578_arg1 ) ) )
	end
end

function PerformGestureForStyle( f579_arg0, f579_arg1, f579_arg2 )
	SendOwnMenuResponse( f579_arg0, f579_arg1, "gesture" .. f579_arg2 )
end

function BeginChoosingTauntOption( f580_arg0, f580_arg1 )
	if f580_arg0.updateMode then
		f580_arg0.updateMode( CoD.CCUtility.TauntsData.Modes.EdittingTaunt, nil, f580_arg1.tauntType )
	end
end

function CancelChoosingTauntOption( f581_arg0 )
	if f581_arg0.updateMode then
		f581_arg0.updateMode( CoD.CCUtility.TauntsData.Modes.ExploringTaunts, false )
	end
end

function TauntItemSelected( f582_arg0, f582_arg1, f582_arg2 )
	Engine.SelectTaunt( f582_arg2, CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.TauntsData.EdittingTauntOrGestureType, f582_arg1.index )
	if f582_arg0.updateMode then
		f582_arg0.updateMode( CoD.CCUtility.TauntsData.Modes.ExploringTaunts, true )
	end
end

local f0_local19 = function ( f583_arg0, f583_arg1 )
	Engine.SendClientScriptNotify( f583_arg0, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f583_arg0 ), "previewTaunt", f583_arg1 )
end

function PreviewTaunt( f584_arg0, f584_arg1 )
	f0_local19( f584_arg0, f584_arg1.xanim )
end

function HeroOptionHighlighted( f585_arg0, f585_arg1, f585_arg2 )
	if CoD.CCUtility.PersonalizeHeroData.EdittingElement then
		if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
			local f585_local0 = nil
			if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				f585_local0 = "changeBodyAccentColor"
			elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				f585_local0 = "changeHelmetAccentColor"
			end
			if f585_local0 then
				Engine.SendClientScriptNotify( f585_arg2, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f585_arg2 ), f585_local0, CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex - 1, f585_arg1.optionIndex - 1, CoD.CCUtility.customizationMode )
			end
		else
			local f585_local0 = nil
			local f585_local1
			if not IsSelfModelValueTrue( f585_arg1, f585_arg2, "isLocked" ) then
				f585_local1 = not IsSelfModelValueTrue( f585_arg1, f585_arg2, "isBMClassified" )
			else
				f585_local1 = false
			end
			if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				f585_local0 = "changeBody"
			elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				f585_local0 = "changeHelmet"
			end
			if f585_local0 then
				Engine.SendClientScriptNotify( f585_arg2, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f585_arg2 ), f585_local0, f585_arg1.optionIndex - 1, CoD.CCUtility.customizationMode, f585_local1 )
			end
		end
	end
end

function HeroOptionSelected( f586_arg0, f586_arg1, f586_arg2 )
	if f586_arg0.updateMode then
		local f586_local0 = nil
		if CoD.CCUtility.PersonalizeHeroData.EdittingElement then
			CoD.CopyModelValue( f586_arg2, f586_arg1, "name", CoD.CCUtility.PersonalizeHeroData.EdittingElement, "currentSelectionName" )
			CoD.CopyModelValue( f586_arg2, f586_arg1, "image", CoD.CCUtility.PersonalizeHeroData.EdittingElement, "image" )
			CoD.CopyModelValue( f586_arg2, f586_arg1, "color", CoD.CCUtility.PersonalizeHeroData.EdittingElement, "color" )
			if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
				local f586_local1, f586_local2 = nil
				if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
					f586_local1 = CoD.CCUtility.Heroes.selectionTable.selectedBody
					f586_local2 = CoD.CCUtility.Heroes.selectionTable.bodyColors
				elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
					f586_local1 = CoD.CCUtility.Heroes.selectionTable.selectedHelmet
					f586_local2 = CoD.CCUtility.Heroes.selectionTable.helmetColors
				end
				if f586_local2 and f586_local2[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex] ~= f586_arg1.optionIndex - 1 then
					Engine.SetHeroItem( f586_arg2, CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.PersonalizeHeroData.EdittingArea, f586_local1, CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex - 1, f586_arg1.optionIndex - 1 )
					Engine.InvalidateCharacterItemRender( CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.PersonalizeHeroData.EdittingArea, f586_local1 )
					Engine.InvalidateCharacterItemRender( CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.PersonalizeHeroData.EdittingArea, f586_local1 )
					if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
						Engine.InvalidateCharacterItemRender( CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET )
					end
				end
			else
				local f586_local1 = nil
				if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
					f586_local1 = CoD.CCUtility.Heroes.selectionTable.selectedBody
				elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
					f586_local1 = CoD.CCUtility.Heroes.selectionTable.selectedHelmet
				end
				if f586_local1 ~= f586_arg1.optionIndex - 1 then
					f586_local0 = CoD.CCUtility.PersonalizeHeroData.EdittingArea
					Engine.SetHeroItem( f586_arg2, CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.PersonalizeHeroData.EdittingArea, f586_arg1.optionIndex - 1 )
					if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
						Engine.InvalidateCharacterItemRender( CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET )
					end
				end
			end
		end
		f586_arg0.updateMode( CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions, {
			customizationArea = CoD.CCUtility.PersonalizeHeroData.EdittingArea,
			colorRow = false
		} )
	end
end

function HeroColorsSelected( f587_arg0, f587_arg1, f587_arg2 )
	if f587_arg0.updateMode then
		local f587_local0 = nil
		if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
			f587_local0 = CoD.CCUtility.Heroes.selectionTable.selectedBody
		elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
			f587_local0 = CoD.CCUtility.Heroes.selectionTable.selectedHelmet
		end
		for f587_local4, f587_local5 in pairs( CoD.CCUtility.PersonalizeHeroData.CurrentColors ) do
			Engine.SetHeroItem( f587_arg2, CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.PersonalizeHeroData.EdittingArea, f587_local0, f587_local4, f587_local5 )
		end
		f587_arg0.updateMode( CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions, {
			customizationArea = CoD.CCUtility.PersonalizeHeroData.EdittingArea,
			colorRow = true
		} )
	end
end

function HeroColorSectionHighlighted( f588_arg0, f588_arg1, f588_arg2 )
	if CoD.CCUtility.PersonalizeHeroData.EdittingElement and f588_arg1.colorTableIndex then
		CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex = f588_arg1.colorTableIndex
		CoD.CCUtility.PersonalizeHeroData.CurrentColors[f588_arg1.colorTableIndex - 1] = f588_arg1.optionIndex - 1
		local f588_local0 = nil
		if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
			f588_local0 = CoD.CCUtility.Heroes.heroCustomizationTable.bodies[CoD.CCUtility.Heroes.selectionTable.selectedBody + 1].accents
		elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
			f588_local0 = CoD.CCUtility.Heroes.heroCustomizationTable.helmets[CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1].accents
		end
		if f588_local0 then
			local f588_local1 = f588_local0[f588_arg1.colorTableIndex][f588_arg1.optionIndex]
			if f588_local1 and f588_local1.name then
				local f588_local2 = CoD.CCUtility.PersonalizeHeroData.EdittingElement:getModel( f588_arg2, "currentSelectionName" )
				if f588_local2 then
					Engine.SetModelValue( f588_local2, f588_local1.name )
				end
			end
		end
		HeroOptionHighlighted( f588_arg0, f588_arg1, f588_arg2 )
	end
end

function CancelHeroOptionSelection( f589_arg0, f589_arg1 )
	if CoD.CCUtility.PersonalizeHeroData.EdittingElement then
		if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
			local f589_local0, f589_local1 = nil
			if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				f589_local0 = "changeBodyAccentColor"
				f589_local1 = CoD.CCUtility.Heroes.selectionTable.bodyColors[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex]
			elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				f589_local0 = "changeHelmetAccentColor"
				f589_local1 = CoD.CCUtility.Heroes.selectionTable.helmetColors[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex]
			end
			if f589_local0 and f589_local1 then
				Engine.SendClientScriptNotify( f589_arg1, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f589_arg1 ), f589_local0, CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex - 1, f589_local1 )
			end
		else
			local f589_local0, f589_local1 = nil
			if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				f589_local0 = "changeBody"
				f589_local1 = CoD.CCUtility.Heroes.selectionTable.selectedBody
			elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				f589_local0 = "changeHelmet"
				f589_local1 = CoD.CCUtility.Heroes.selectionTable.selectedHelmet
			end
			if f589_local0 and f589_local1 then
				Engine.SendClientScriptNotify( f589_arg1, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f589_arg1 ), f589_local0, f589_local1, CoD.CCUtility.customizationMode )
			end
		end
	end
	if f589_arg0.updateMode then
		f589_arg0.updateMode( CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions )
	end
end

function HeroShowcaseWeaponSelected( f590_arg0, f590_arg1, f590_arg2 )
	if f590_arg0.updateMode then
		local f590_local0 = f590_arg1:getModel()
		if f590_local0 then
			local f590_local1 = Engine.GetModel( f590_local0, "itemIndex" )
			if f590_local1 then
				local f590_local2 = Engine.GetModelValue( f590_local1 )
				CoD.CCUtility.PersonalizeHeroData.SetHeroShowcaseWeapon( f590_arg2, f590_local2 )
				Engine.SendClientScriptNotify( f590_arg2, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f590_arg2 ), "changeShowcaseWeapon", Engine.GetItemRef( f590_local2 ) .. "_" .. CoD.gameMode:lower(), "", "", CoD.CCUtility.customizationMode )
			end
		end
	end
end

function HeroShowcaseWeaponVariantSelected( f591_arg0, f591_arg1, f591_arg2 )
	if f591_arg0.updateMode then
		local f591_local0 = f591_arg1.weaponVariantInfo.variantNameBig
		local f591_local1 = f591_arg1.weaponVariantInfo.weaponIndex
		local f591_local2 = f591_arg1.weaponVariantInfo.attachmentsByIndex
		local f591_local3 = f591_arg1.weaponVariantInfo.attachmentVariant
		local f591_local4 = f591_arg1.weaponVariantInfo.camoIndex
		local f591_local5 = f591_arg1.weaponVariantInfo.paintjobSlot
		local f591_local6 = f591_arg1.weaponVariantInfo.paintjobIndex
		if CoD.CCUtility.PersonalizeHeroData.IsDualWieldWeapon( f591_local1, f591_local2 ) then
			f591_local1 = CoD.CCUtility.PersonalizeHeroData.GetDualWieldVersionOfWeapon( f591_arg2, f591_local1 )
		end
		CoD.CCUtility.PersonalizeHeroData.SetHeroShowcaseWeapon( f591_arg2, f591_local1, f591_local0, f591_local2, f591_local3, f591_local4, f591_local5, f591_local6 )
		Engine.SendClientScriptNotify( f591_arg2, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f591_arg2 ), "changeShowcaseWeapon", CoD.CCUtility.PersonalizeHeroData.GetHeroShowcaseWeaponName( f591_local1, f591_local2 ), CoD.CACUtility.GetAttachmentCosmeticVariantsFromVariantInfo( f591_arg1.weaponVariantInfo ), CoD.CCUtility.PersonalizeHeroData.GetHeroShowcaseWeaponRenderOptions( f591_local4, f591_local5, f591_local6 ), CoD.CCUtility.customizationMode )
	end
end

function SetHeroItemOptionAsOld( f592_arg0, f592_arg1, f592_arg2 )
	local f592_local0 = f592_arg1:getModel( f592_arg2, "optionIndex" )
	if f592_local0 then
		local f592_local1 = Engine.GetModelValue( f592_local0 )
		local f592_local2 = CoD.CCUtility.Heroes.HeroIndexForEdits
		local f592_local3 = CoD.CCUtility.PersonalizeHeroData.EdittingArea
		if f592_local1 and f592_local2 and f592_local3 then
			Engine.SetCharacterCustomizationItemAsOld( f592_arg2, f592_local2, f592_local3, f592_local1 )
			local f592_local4 = CoD.CCUtility.PersonalizeHeroData.EdittingElement:getModel( f592_arg2, "breadcrumbCount" )
			if f592_local4 then
				local f592_local5 = Engine.CharacterCustomizationNewItemCount( f592_arg2, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.PersonalizeHeroData.EdittingArea )
				Engine.SetModelValue( f592_local4, type( f592_local5 ) and f592_local5.total or 0 )
			end
			local f592_local6 = f592_arg0.categoryTabs.Tabs.grid:getItemAt( f592_arg0.categoryTabs.Tabs.grid.savedActiveIndex + 1 )
			if f592_local6 then
				local f592_local7 = Engine.CharacterCustomizationNewItemCount( f592_arg2, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.PersonalizeHeroData.EdittingArea )
				local f592_local8 = f592_local6:getModel( f592_arg2, "breadcrumbCount" )
				if f592_local8 then
					local f592_local9 = 0
					if f592_local6.filterName == "loot" then
						if type( f592_local7 ) == "table" then
							local f592_local10 = f592_local7.loot
						end
						f592_local9 = f592_local10 or 0
					else
						if type( f592_local7 ) == "table" then
							local f592_local11 = f592_local7.standard
						end
						f592_local9 = f592_local11 or 0
					end
					Engine.SetModelValue( f592_local8, f592_local9 )
				end
			end
		end
	end
end

function SetHeroTauntAsOld( f593_arg0, f593_arg1, f593_arg2 )
	if f593_arg1.index and f593_arg1.tauntType then
		Engine.SetTauntAsOld( f593_arg2, Enum.eModes.MODE_MULTIPLAYER, CoD.CCUtility.Heroes.HeroIndexForEdits, f593_arg1.tauntType, f593_arg1.index )
	end
end

function SetHeroGestureAsOld( f594_arg0, f594_arg1, f594_arg2 )
	if f594_arg1.index and f594_arg1.gestureType then
		Engine.SetGestureAsOld( f594_arg2, Enum.eModes.MODE_MULTIPLAYER, CoD.CCUtility.Heroes.HeroIndexForEdits, f594_arg1.gestureType, f594_arg1.index )
	end
end

function GetHeroPersonalizationNewCount( f595_arg0, f595_arg1 )
	local f595_local0 = 0
	if f595_arg0.heroIndex then
		f595_local0 = CoD.CCUtility.Heroes.GetPersonalizationNewCount( f595_arg1, f595_arg0.heroIndex )
	end
	return f595_local0
end

function ListUpdateSelectionMode( f596_arg0, f596_arg1, f596_arg2 )
	f596_arg0:updateMode( f596_arg2, f596_arg1 )
end

function WC_SetChoosingCategory( f597_arg0, f597_arg1, f597_arg2 )
	f597_arg0:processEvent( {
		name = "update_selection_mode",
		mode = CoD.WC_Category.Modes.SELECTING_CATEGORY
	} )
end

function WC_SetSelectingItem( f598_arg0, f598_arg1, f598_arg2 )
	f598_arg0:processEvent( {
		name = "update_selection_mode",
		mode = CoD.WC_Category.Modes.SELECTING_ITEM,
		element = f598_arg1
	} )
end

function WC_SelectingCustomization( f599_arg0, f599_arg1, f599_arg2 )
	f599_arg0:dispatchEventToParent( {
		name = "update_selection_mode",
		mode = CoD.WC_Category.Modes.SELECTING_CATEGORY
	} )
end

function WC_WeaponCustomizationGainFocus( f600_arg0, f600_arg1, f600_arg2 )
	local f600_local0 = CoD.perController[f600_arg2].weaponCategory
	local f600_local1 = f600_arg1.xcamNotetrack
	local f600_local2 = Engine.GetModelValue( f600_arg1:getModel( f600_arg2, "type" ) )
	if f600_local2 ~= CoD.CACUtility.primaryWeaponPrestigeSlot and f600_local2 ~= CoD.CACUtility.secondaryWeaponPrestigeSlot then
		Engine.SendClientScriptNotify( f600_arg2, "cam_customization_focus" .. CoD.GetLocalClientAdjustedNum( f600_arg2 ), f600_local0, f600_local1 )
	end
end

function WC_WeaponOptionGainFocus( f601_arg0, f601_arg1, f601_arg2 )
	local f601_local0 = f601_arg1:getModel( f601_arg2, "weaponOptionTypeName" )
	if f601_local0 then
		local f601_local1 = Engine.GetModelValue( f601_local0 )
		local f601_local2 = f601_arg1:getModel( f601_arg2, "itemIndex" )
		local f601_local3 = Engine.GetModelValue( f601_arg1:getModel( f601_arg2, "weaponOptionType" ) )
		if f601_local3 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB then
			local f601_local4 = Engine.GetModelValue( f601_arg1:getModel( f601_arg2, "paintjobIndex" ) )
			local f601_local5 = Engine.GetModelValue( f601_arg1:getModel( f601_arg2, "paintjobSlot" ) )
			if f601_local5 ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and f601_local4 ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
				Engine.SetupPaintjobData( f601_arg2, f601_local5, f601_local4 )
			end
		end
		if f601_local2 then
			local f601_local4 = Engine.GetModelValue( f601_local2 )
			local f601_local5 = IsItemWeaponOptionLocked( f601_arg0, f601_arg1, f601_arg2 )
			if not f601_local5 then
				f601_local5 = IsSelfModelValueTrue( f601_arg1, f601_arg2, "isBMClassified" )
			end
			if f601_local3 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_INVALID then
				CoD.CACUtility.UpdateWeaponPrestigeAttachment( f601_arg2, f601_local1, f601_local4 )
			else
				Engine.SendClientScriptNotify( f601_arg2, "cam_customization_wo" .. CoD.GetLocalClientAdjustedNum( f601_arg2 ), f601_local1, f601_local4, f601_local5 )
			end
		end
	end
end

function WC_VariantGainFocus( f602_arg0, f602_arg1, f602_arg2 )
	Engine.SendClientScriptNotify( f602_arg2, "cam_customization_acv" .. CoD.GetLocalClientAdjustedNum( f602_arg2 ), f602_arg1.attachmentRef, f602_arg1.variantIndex )
end

function WC_VariantSelectionCancel( f603_arg0, f603_arg1, f603_arg2 )
	local f603_local0 = CoD.WC_Category.ACV.selectedAttachment
	local f603_local1 = CoD.perController[f603_arg2].classModel
	local f603_local2 = CoD.perController[f603_arg2].weaponCategory
	if CoD.CACUtility.IsAttachmentRefWeaponOption( f603_local0 ) then
		if f603_local0 == CoD.CACUtility.weaponOptionGroupNames[Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB] then
			local f603_local3 = Engine.GetModelValue( Engine.GetModel( f603_local1, f603_local2 .. "paintjobIndex.itemIndex" ) )
			local f603_local4 = Engine.GetModelValue( Engine.GetModel( f603_local1, f603_local2 .. "paintjobSlot.itemIndex" ) )
			if f603_local4 ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and f603_local3 ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
				Engine.SetupPaintjobData( f603_arg2, f603_local4, f603_local3 )
			elseif f603_local4 == Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and f603_local3 == Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
				Engine.ClearPaintjobLayerData()
			end
			Engine.SendClientScriptNotify( f603_arg2, "cam_customization_wo" .. CoD.GetLocalClientAdjustedNum( f603_arg2 ), f603_local0, 1 )
		else
			local f603_local4 = Engine.GetModel( f603_local1, f603_local2 .. f603_local0 .. ".itemIndex" )
			if f603_local4 then
				Engine.SendClientScriptNotify( f603_arg2, "cam_customization_wo" .. CoD.GetLocalClientAdjustedNum( f603_arg2 ), f603_local0, Engine.GetModelValue( f603_local4 ) )
			end
		end
	elseif f603_local0 == CoD.CACUtility.primaryWeaponPrestigeSlot or f603_local0 == CoD.CACUtility.secondaryWeaponPrestigeSlot then
		local f603_local3 = CoD.SafeGetModelValue( f603_local1, f603_local2 .. f603_local0 .. ".itemIndex" )
		if not f603_local3 then
			f603_local3 = CoD.CACUtility.EmptyItemIndex
		end
		CoD.CACUtility.UpdateWeaponPrestigeAttachment( f603_arg2, f603_local0, f603_local3 )
	else
		local f603_local3 = CoD.CACUtility.GetLoadoutSlotForAttachmentName( f603_local1, f603_local2, f603_local0 )
		if f603_local3 then
			local f603_local4 = Engine.GetModel( f603_local1, f603_local3 .. "cosmeticvariant.itemIndex" )
			if f603_local4 then
				Engine.SendClientScriptNotify( f603_arg2, "cam_customization_acv" .. CoD.GetLocalClientAdjustedNum( f603_arg2 ), f603_local0, Engine.GetModelValue( f603_local4 ) )
			end
		end
	end
end

function OpenChooseShowcaseWeapon( f604_arg0, f604_arg1, f604_arg2, f604_arg3, f604_arg4 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f604_arg2 ), "ShowcaseWeapon.Mode" ), Enum.ShowcaseWeaponMode.SHOWCASEWEAPON_WEAPONLIST )
	CoD.CraftUtility.Gunsmith.ParseDDL( f604_arg2, Enum.StorageFileType.STORAGE_GUNSMITH )
	CoD.CraftUtility.Paintjobs.ParseDDL( f604_arg2, Enum.StorageFileType.STORAGE_PAINTJOBS )
	NavigateToMenu( f604_arg0, "ChooseShowcaseWeapon", true, f604_arg2 )
end

function ShowcaseWeapon_TabChanged( f605_arg0, f605_arg1, f605_arg2 )
	DataSources.Unlockables.setCurrentFilterItem( f605_arg1.filter )
	CoD.perController[f605_arg2].weaponCategory = f605_arg1.filter
	f605_arg0.weaponList:updateDataSource( true )
	f605_arg0.weaponList:setActiveItem( f605_arg0.weaponList:getFirstSelectableItem() )
	if CoD.perController[f605_arg2].gunsmithWeaponCategoryRestored == true then
		CoD.SetCustomization( f605_arg2, f605_arg0.tabList.grid.activeWidget.gridInfoTable.zeroBasedIndex + 1, "category_index" )
	end
end

function RedeemCode( f606_arg0, f606_arg1, f606_arg2 )
	Engine.ShowRedeemCode( f606_arg2 )
end

function ShowPsStoreIcon( f607_arg0 )
	Engine.ShowPsStoreIcon()
end

function HidePsStoreIcon( f608_arg0 )
	Engine.HidePsStoreIcon()
end

function PurchaseProduct( f609_arg0, f609_arg1, f609_arg2 )
	local f609_local0 = CoD.SelectedStoreCategory
	if IsDurango() then
		local f609_local1 = f609_arg1:getModel( f609_arg2, "productID" )
		if f609_local1 then
			local f609_local2 = Engine.GetModelValue( f609_local1 )
			if Dvar.live_store_show_details:exists() and Dvar.live_store_show_details:get() then
				Engine.ShowProductDetailsByID( f609_arg2, f609_local0, f609_local2 )
			else
				Engine.PurchaseProductByID( f609_arg2, f609_local0, f609_local2 )
			end
		end
	elseif IsOrbis() then
		local f609_local1 = f609_arg1:getModel( f609_arg2, "serviceLabel" )
		if f609_local1 then
			local f609_local2 = Engine.GetModelValue( f609_local1 )
			if Dvar.live_store_show_details:exists() and Dvar.live_store_show_details:get() then
				local f609_local3 = f609_arg1:getModel( f609_arg2, "productID" )
				if f609_local3 then
					Engine.ShowProductDetailsByID( f609_arg2, f609_local0, Engine.GetModelValue( f609_local3 ), f609_local2 )
				end
			else
				local f609_local3 = f609_arg1:getModel( f609_arg2, "skuID" )
				if f609_local3 then
					Engine.PurchaseProductByID( f609_arg2, f609_local0, Engine.GetModelValue( f609_local3 ), f609_local2 )
				end
			end
		end
	elseif IsPC() then
		local f609_local1 = f609_arg1:getModel( f609_arg2, "skuID" )
		local f609_local2 = f609_arg1:getModel( f609_arg2, "serviceLabel" )
		if f609_local1 and f609_local2 then
			Engine.PurchaseProductByID( f609_arg2, f609_local0, Engine.GetModelValue( f609_local1 ), Engine.GetModelValue( f609_local2 ) )
		end
	end
end

function RecordStoreOnItemGainFocus( f610_arg0, f610_arg1, f610_arg2, f610_arg3 )
	f610_arg1.onGainFocusTime = Engine.milliseconds()
end

function RecordStoreOnItemLoseFocus( f611_arg0, f611_arg1, f611_arg2, f611_arg3 )
	local f611_local0 = CoD.SelectedStoreCategory
	local f611_local1 = f611_arg1.onGainFocusTime
	local f611_local2 = 0
	local f611_local3 = Dvar.store_item_viewed_timer:get()
	if f611_local1 ~= nil then
		f611_local2 = Engine.milliseconds() - f611_local1
	end
	if f611_local3 and f611_local2 < f611_local3 then
		return 
	end
	local f611_local4 = f611_arg1:getModel( f611_arg2, "productID" )
	if f611_local4 then
		LUI.CoDMetrics.StoreItemViewed( f611_arg0, f611_arg2, Engine.GetModelValue( f611_local4 ), f611_local2 )
	end
end

function RecordStoreLastFocusedItemViewed( f612_arg0, f612_arg1, f612_arg2, f612_arg3 )
	RecordStoreOnItemLoseFocus( f612_arg0, f612_arg1, f612_arg2, f612_arg3 )
end

function EmblemEditor_HandleBackInBrowseMode( f613_arg0, f613_arg1, f613_arg2, f613_arg3 )
	Engine.ExecNow( f613_arg2, "emblemEndEdit" )
	local f613_local0 = GoBack( f613_arg0, f613_arg2 )
	if IsPaintshop( f613_arg2 ) then
		CoD.SetCustomization( f613_arg2, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT, "type" )
		ForceNotifyModel( f613_arg2, "Paintshop.UpdateDataSource" )
	else
		CoD.SetCustomization( f613_arg2, Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM, "type" )
		local f613_local1 = f613_local0.tabList.Tabs.grid
		if f613_local1 and f613_arg3 then
			local f613_local2 = f613_local1:getFirstSelectableItem()
			if f613_local2 then
				f613_local1:setActiveItem( f613_local2 )
			end
		end
		ForceNotifyModel( f613_arg2, "Emblem.UpdateDataSource" )
	end
	CoD.perController[f613_arg2].selectEmblemGroupIndex = nil
	CoD.perController[f613_arg2].selectedLayerIndex = nil
	CoD.perController[f613_arg2].selectedLayerIconID = nil
	CoD.perController[f613_arg2].selectedLayerMaterialID = nil
	CoD.SetEditorProperties( f613_arg2, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_NONE, "editorMode" )
	CoD.SetEditorProperties( f613_arg2, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE, "colorMode" )
	CoD.SetEditorProperties( f613_arg2, CoD.emblem.CLIPBOARDSTATE.EMPTY, "isClipboardEmpty" )
	Engine.CommitProfileChanges( f613_arg2 )
	Engine.ExecNow( f613_arg2, "emblemSetGridSize " .. CoD.GetCustomization( f613_arg2, "type" ) .. " 0" )
end

function EmblemEditor_SetEditMode( f614_arg0 )
	CoD.SetEditorProperties( f614_arg0, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT, "editorMode" )
end

local f0_local20 = function ( f615_arg0 )
	CoD.SetEditorProperties( f615_arg0, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE, "editorMode" )
end

local f0_local21 = function ( f616_arg0, f616_arg1 )
	local f616_local0 = CoD.perController[f616_arg0].totalLayers
	local f616_local1 = Engine.GetUsedLayerCount( f616_arg0, f616_arg1, f616_local0 )
	CoD.SetEditorProperties( f616_arg0, Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION", f616_local1, f616_local0 ), "layersUsedFraction" )
	CoD.SetEditorProperties( f616_arg0, f616_local1, "layersUsed" )
	local f616_local2 = CoD.perController[f616_arg0].totalGroups
	local f616_local3 = Engine.GetUsedGroupCount( f616_arg0, f616_arg1, f616_local2 )
	CoD.SetEditorProperties( f616_arg0, Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION", f616_local3, f616_local2 - 1 ), "groupsUsedFraction" )
	CoD.SetEditorProperties( f616_arg0, f616_local3, "groupsUsed" )
end

function EmblemEditor_LayerGainFocus( f617_arg0, f617_arg1, f617_arg2, f617_arg3 )
	local f617_local0 = f617_arg2:getModel( f617_arg3, "layerIndex" )
	local f617_local1 = f617_arg2:getModel( f617_arg3, "layerNumberString" )
	local f617_local2 = Engine.GetModelValue( f617_local0 )
	CoD.Menu.SetButtonLabel( f617_arg0, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "PLATFORM_EMBLEM_EDIT_DONE" )
	CoD.Menu.SetButtonLabel( f617_arg1, Enum.LUIButton.LUI_KEY_START, "" )
	local f617_local3 = Engine.GetSelectedLayerIconID( f617_arg3, f617_local2 )
	CoD.perController[f617_arg3].selectedLayerIndex = f617_local2
	CoD.perController[f617_arg3].selectedLayerIconID = f617_local3
	CoD.perController[f617_arg3].selectedLayerMaterialID = Engine.GetSelectedLayerMaterialID( f617_arg3, f617_local2 )
	local f617_local4 = CoD.GetCustomization( f617_arg3, "type" )
	f0_local21( f617_arg3, f617_local4 )
	Engine.ExecNow( f617_arg3, "emblemSelect " .. f617_local2 .. " " .. f617_local4 )
	if CoD.IsLayerEmpty( f617_arg3, CoD.perController[f617_arg3].selectedLayerIndex ) == true then
		CoD.Menu.SetButtonLabel( f617_arg0, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_EMBLEM_CHOOSE_DECAL" )
	else
		CoD.Menu.SetButtonLabel( f617_arg0, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_EMBLEM_EDIT_LAYER" )
	end
	CoD.SetEditorProperties( f617_arg3, Engine.GetLinkedLayerCount( f617_arg3, f617_local4 ), "linkedLayerCount" )
	CoD.SetEditorProperties( f617_arg3, f617_local3, "selectedDecalID" )
	Engine.ForceNotifyModelSubscriptions( f617_local1 )
	if CoD.isPC then
		if IsLayerEmpty( f617_arg1, f617_arg2, f617_arg3 ) then
			f617_arg1.actionsListPC:hide()
			f617_arg1.m_layerEmpty = true
		else
			if not Engine.LastInput_Gamepad() then
				f617_arg1.actionsListPC:show()
			end
			f617_arg1.m_layerEmpty = nil
		end
	end
end

function EmblemEditor_InsertDecalPressed( f618_arg0, f618_arg1, f618_arg2 )
	local f618_local0 = CoD.GetCustomization( f618_arg2, "type" )
	Engine.ExecNow( f618_arg2, "emblemCopyLayer " .. CoD.perController[f618_arg2].selectedLayerIndex )
	Engine.ExecNow( f618_arg2, "emblemInsertLayer " .. f618_local0 .. " " .. CoD.perController[f618_arg2].selectedLayerIndex )
	Engine.ExecNow( f618_arg2, "emblemClearLayerByIndex " .. CoD.perController[f618_arg2].selectedLayerIndex .. " " .. f618_local0 )
	CoD.SetEditorProperties( f618_arg2, CoD.emblem.ADDDECAL.INSERT, "addDecalMode" )
end

function EmblemEditor_SetEditLayerTitle( f619_arg0, f619_arg1 )
	if IsPaintshop( f619_arg1 ) then
		f619_arg0.PaintshopFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( CoD.Paintshop.View[CoD.perController[f619_arg1].viewIndex].edit_side_ref ) )
	else
		f619_arg0.EmblemEditorFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEM_EDIT_LAYER_TITLE" ) )
	end
end

local f0_local22 = function ( f620_arg0, f620_arg1 )
	CoD.SetEditorProperties( f620_arg0, f620_arg1, "scaleMode" )
	Engine.ExecNow( f620_arg0, "emblemSetScaleMode " .. f620_arg1 )
end

local f0_local23 = function ( f621_arg0, f621_arg1 )
	CoD.SetEditorProperties( f621_arg0, f621_arg1, "materialScaleMode" )
	Engine.ExecNow( f621_arg0, "setMaterialScaleMode " .. f621_arg1 )
end

function EmblemEditor_EditSelectedLayer( f622_arg0, f622_arg1, f622_arg2 )
	local f622_local0 = CoD.perController[f622_arg2].selectedLayerIndex
	Engine.ExecNow( f622_arg2, "emblemCopyLayer " .. f622_local0 )
	CoD.SetEditorProperties( f622_arg2, CoD.emblem.CLIPBOARDSTATE.EMPTY, "isClipboardEmpty" )
	EmblemEditor_SetEditLayerTitle( f622_arg0, f622_arg2 )
	CoD.SwapFocusableElements( f622_arg2, f622_arg0.layerCarousel, f622_arg0.emblemDrawWidget )
	EmblemEditor_SetEditMode( f622_arg2 )
	local f622_local1 = Engine.GetSelectedLayerColor( f622_arg2 )
	local f622_local2 = Engine.GetSelectedLayerColor1( f622_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f622_arg2 ), "Emblem.EmblemSelectedLayerProperties.opacity0" ), math.floor( f622_local1.alpha * 100 ) )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f622_arg2 ), "Emblem.EmblemSelectedLayerProperties.opacity1" ), math.floor( f622_local2.alpha * 100 ) )
	Engine.ExecNow( f622_arg2, "emblemBeginEdit" )
	CoD.perController[f622_arg2].selectedLayerMaterialID = Engine.GetSelectedLayerMaterialID( f622_arg2, f622_local0 )
	f0_local22( f622_arg2, Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED )
	f0_local23( f622_arg2, Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED )
end

local f0_local24 = function ( f623_arg0, f623_arg1 )
	return Engine.GetModelValue( f623_arg0:getModel( f623_arg1, "layerIndex" ) ) .. " " .. Engine.GetModelValue( f623_arg0:getModel( f623_arg1, "groupIndex" ) )
end

local f0_local25 = function ( f624_arg0, f624_arg1, f624_arg2 )
	f624_arg1.emblemLayer.layerIcon.layerIcon:setupDrawEmblemLayer( GetEmblemLayerAndGroupIndex( f624_arg0, f0_local24( f624_arg1, f624_arg0 ) ) )
	f624_arg2.emblemLayer.layerIcon.layerIcon:setupDrawEmblemLayer( GetEmblemLayerAndGroupIndex( f624_arg0, f0_local24( f624_arg2, f624_arg0 ) ) )
end

local f0_local26 = function ( f625_arg0, f625_arg1 )
	local f625_local0 = f625_arg1:getModel( f625_arg0, "layerIndex" )
	if f625_local0 then
		CoD.perController[f625_arg0].selectedLayerIndex = Engine.GetModelValue( f625_local0 )
	end
end

function EmblemEditor_MoveLayer( f626_arg0, f626_arg1, f626_arg2, f626_arg3 )
	local f626_local0 = f626_arg0.layerCarousel.activeWidget
	local f626_local1 = Engine.GetModelValue( f626_local0:getModel( f626_arg2, "layerIndex" ) )
	local f626_local2 = CoD.GetCustomization( f626_arg2, "type" )
	local f626_local3 = nil
	if f626_local0 ~= nil then
		if f626_arg3 == "left" then
			if f626_local1 > 0 then
				Engine.ExecNow( f626_arg2, "emblemMoveLayerRelative -1 " .. f626_local2 )
				local f626_local4 = f626_arg0.layerCarousel:getItemAtPosition( 1, f626_local0.gridInfoTable.zeroBasedIndex, true )
				if f626_local4 ~= nil then
					DataSources.EmblemLayerList.swapItemInfo( f626_arg2, f626_arg0.layerCarousel, f626_local4, f626_local0 )
					f0_local25( f626_arg2, f626_local0, f626_local4 )
					f626_arg0.layerCarousel:setActiveItem( f626_local4 )
					f0_local26( f626_arg2, f626_local4 )
					f626_local0.arrows:setState( "DefaultState" )
					if f626_local1 > 1 then
						f626_local4.arrows:setState( "LeftButtonPressed" )
					end
				end
			end
		elseif f626_arg3 == "right" then
			local f626_local4 = Engine.GetUsedLayerCount( f626_arg2, f626_local2, CoD.perController[f626_arg2].totalLayers )
			if f626_local1 + Engine.GetModelValue( f626_local0:getModel( f626_arg2, "groupLayerCount" ) ) < f626_local4 then
				Engine.ExecNow( f626_arg2, "emblemMoveLayerRelative 1 " .. f626_local2 )
				local f626_local5 = f626_arg0.layerCarousel:getItemAtPosition( 1, f626_local0.gridInfoTable.zeroBasedIndex + 2, true )
				if f626_local5 ~= nil then
					DataSources.EmblemLayerList.swapItemInfo( f626_arg2, f626_arg0.layerCarousel, f626_local0, f626_local5 )
					f0_local25( f626_arg2, f626_local0, f626_local5 )
					f626_arg0.layerCarousel:setActiveItem( f626_local5 )
					f0_local26( f626_arg2, f626_local5 )
					f626_local0.arrows:setState( "DefaultState" )
					if f626_local1 + 2 < f626_local4 then
						f626_local5.arrows:setState( "RightButtonPressed" )
					end
				end
			end
		end
	end
end

function EmblemEditor_CopyLayerToClipboard( f627_arg0, f627_arg1, f627_arg2 )
	Engine.ExecNow( f627_arg2, "emblemCopyLayer " .. CoD.perController[f627_arg2].selectedLayerIndex )
	CoD.SetEditorProperties( f627_arg2, CoD.emblem.CLIPBOARDSTATE.FULL, "isClipboardEmpty" )
	f627_arg0.clipboard:setState( "Visible" )
end

function EmblemEditor_UpdateLayerData( f628_arg0, f628_arg1 )
	local f628_local0 = Engine.GetModelValue( f628_arg0.layerCarousel.activeWidget:getModel( f628_arg1, "layerIndex" ) )
	f628_arg0.layerCarousel:updateDataSource( true )
	local f628_local1 = f628_arg0.layerCarousel:findItem( {
		layerIndex = f628_local0
	}, nil, false, nil )
	if f628_local1 then
		f628_arg0.layerCarousel:processEvent( {
			name = "gain_focus",
			controller = f628_arg1,
			selectIndex = f628_local1.gridInfoTable.zeroBasedIndex,
			overrideScrollTime = 0
		} )
	end
end

function EmblemEditor_InsertLayer( f629_arg0, f629_arg1, f629_arg2 )
	Engine.ExecNow( f629_arg2, "emblemInsertLayer " .. CoD.GetCustomization( f629_arg2, "type" ) .. " " .. CoD.perController[f629_arg2].selectedLayerIndex )
end

function EmblemEditor_HandleBackInEditMode( f630_arg0, f630_arg1, f630_arg2 )
	Engine.ExecNow( f630_arg2, "emblemEndEdit" )
	if IsPaintshop( f630_arg2 ) == true then
		f630_arg0.PaintshopFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_PAINTSHOP_CAPS" ) )
	else
		f630_arg0.EmblemEditorFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEM_EDITOR_CAPS" ) )
	end
	f0_local20( f630_arg2 )
	CoD.SwapFocusableElements( f630_arg2, f630_arg0.emblemDrawWidget, f630_arg0.layerCarousel )
end

function EmblemEditor_SetupEditorBasedOnMode( f631_arg0, f631_arg1, f631_arg2 )
	if IsEditMode( f631_arg2 ) then
		EmblemEditor_EditSelectedLayer( f631_arg0, f631_arg0.layerCarousel:findItem( {
			layerIndex = CoD.perController[f631_arg2].selectedLayerIndex
		}, nil, true, 0 ), f631_arg2 )
	else
		CoD.SwapFocusableElements( f631_arg2, f631_arg0.emblemDrawWidget, f631_arg0.layerCarousel )
	end
end

function EmblemEditor_FlipIcon( f632_arg0, f632_arg1, f632_arg2 )
	Engine.ExecNow( f632_arg2, "emblemToggleFlip" )
end

function EmblemEditor_ToggleOutline( f633_arg0, f633_arg1, f633_arg2 )
	Engine.ExecNow( f633_arg2, "emblemToggleOutline" )
end

function EmblemEditor_EndEdit( f634_arg0, f634_arg1, f634_arg2 )
	Engine.ExecNow( f634_arg2, "emblemEndEdit" )
end

function EmblemEditor_BeginEdit( f635_arg0, f635_arg1, f635_arg2 )
	Engine.ExecNow( f635_arg2, "emblemBeginEdit" )
end

function EmblemEditor_CutLayer( f636_arg0, f636_arg1, f636_arg2 )
	Engine.ExecNow( f636_arg2, "emblemCutLayer " .. CoD.GetCustomization( f636_arg2, "type" ) )
	CoD.SetEditorProperties( f636_arg2, CoD.emblem.CLIPBOARDSTATE.FULL, "isClipboardEmpty" )
	f636_arg0.clipboard:setState( "Visible" )
end

function EmblemEditor_OpenLayerOptionsPopup( f637_arg0, f637_arg1, f637_arg2 )
	f637_arg0:OpenModalDialog( f637_arg0, f637_arg2, "MENU_TAB_OPTIONS", "", {
		"MENU_EMBLEM_RESET_LAYER"
	}, function ( f638_arg0 )
		if f638_arg0 == 0 then
			Engine.ExecNow( f637_arg2, "emblemRevertLayerChanges " .. CoD.perController[f637_arg2].selectedLayerIndex .. " " .. CoD.GetCustomization( f637_arg2, "type" ) )
			EmblemEditor_BeginEdit( f637_arg0, f637_arg1, f637_arg2 )
			return true
		elseif f638_arg0 == nil then
			EmblemEditor_BeginEdit( f637_arg0, f637_arg1, f637_arg2 )
			return true
		else
			
		end
	end )
end

function EmblemEditor_HandleKeyboardComplete( f639_arg0, f639_arg1, f639_arg2, f639_arg3 )
	local f639_local0 = CoD.perController[f639_arg2].selectedEmblemModel
	local f639_local1 = nil
	if not f639_local0 then
		return 
	elseif f639_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_EMBLEMS then
		f639_local1 = Engine.GetModel( f639_local0, "emblemTextEntry" )
		if f639_local1 then
			Engine.SetModelValue( f639_local1, f639_arg3.input )
		end
		local f639_local2 = f639_arg0:getModel( f639_arg2, "inputText" )
		if f639_local2 then
			Engine.SetModelValue( f639_local2, f639_arg3.input )
		end
	end
end

function EmblemEditor_OpenSavePopup( f640_arg0, f640_arg1, f640_arg2, f640_arg3 )
	CoD.OverlayUtility.CreateOverlay( f640_arg2, f640_arg0, "EmblemSave", CoD.perController[f640_arg2].selectedEmblemModel )
end

local f0_local27 = function ( f641_arg0, f641_arg1 )
	local f641_local0 = 0
	if f641_arg0.occludedMenu and f641_arg0.occludedMenu.openTime then
		f641_local0 = Engine.milliseconds() - f641_arg0.occludedMenu.openTime
	end
	LUI.CoDMetrics.EmblemEvent( f641_arg1, f641_local0, Engine.GetEmblemSummaryString() )
end

function EmblemEditor_SaveEmblem( f642_arg0, f642_arg1, f642_arg2, f642_arg3 )
	Engine.SetModelValue( Engine.GetModel( f642_arg3, "emblemName" ), Engine.GetModelValue( Engine.GetModel( f642_arg3, "emblemTextEntry" ) ) )
	local f642_local0 = false
	f0_local27( f642_arg0, f642_arg2 )
	if CoD.perController[f642_arg2].selectedEmblemTabStorageType == Enum.StorageFileType.STORAGE_EMBLEMS then
		CoD.CraftUtility.Emblems.UploadEmblem( f642_arg2, f642_arg3 )
		CoD.CraftUtility.Emblems.ParseDDL( f642_arg2, Enum.StorageFileType.STORAGE_EMBLEMS )
	elseif IsPreBuiltEmblemTab( f642_arg2 ) then
		local f642_local1 = Enum.StorageFileType.STORAGE_EMBLEMS
		CoD.CraftUtility.Emblems.ParseDDL( f642_arg2, f642_local1 )
		CoD.CraftUtility.Emblems.Copy( f642_arg2, f642_arg3, f642_local1 )
		f642_local0 = true
	end
	local f642_local1 = GoBack( f642_arg0, f642_arg2 )
	EmblemEditor_HandleBackInBrowseMode( f642_local1, f642_arg1, f642_arg2, f642_local0 )
	ClearSavedState( f642_local1, f642_arg2 )
end

function EmblemEditor_DiscardChanges( f643_arg0, f643_arg1, f643_arg2, f643_arg3 )
	local f643_local0 = GoBack( f643_arg0, f643_arg2 )
	EmblemEditor_HandleBackInBrowseMode( f643_local0, f643_arg1, f643_arg2 )
	ClearSavedState( f643_local0, f643_arg2 )
end

function EmblemEditor_NoChangesAction( f644_arg0, f644_arg1, f644_arg2, f644_arg3 )
	EmblemEditor_HandleBackInBrowseMode( GoBack( f644_arg0, f644_arg2 ), f644_arg1, f644_arg2 )
end

function EmblemEditor_SaveChangesBack( f645_arg0, f645_arg1, f645_arg2, f645_arg3 )
	local f645_local0 = false
	local f645_local1 = Engine.GetModel( f645_arg3, "emblemIndex" )
	if f645_local1 and CoD.CraftUtility.Emblems.IsEmblemIndexOccupied( Engine.GetModelValue( f645_local1 ) ) then
		f645_local0 = true
	end
	if not f645_local0 then
		Engine.SetModelValue( Engine.GetModel( f645_arg3, "emblemTextEntry" ), "Emblem" )
	end
end

function EmblemEditor_ToggleScaleMode( f646_arg0, f646_arg1, f646_arg2 )
	local f646_local0
	if Engine.GetEmblemScaleMode( f646_arg2 ) == Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED then
		f646_local0 = Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FREE
	else
		f646_local0 = Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED
	end
	CoD.SetEditorProperties( f646_arg2, f646_local0, "scaleMode" )
	Engine.ExecNow( f646_arg2, "emblemSetScaleMode " .. f646_local0 )
end

function EmblemEditor_LinkUnlinkLayers( f647_arg0, f647_arg1, f647_arg2 )
	local f647_local0 = f647_arg1:getModel()
	local f647_local1 = Engine.GetModel( f647_local0, "layerIndex" )
	if f647_local1 then
		local f647_local2 = Engine.GetModelValue( f647_local1 )
		local f647_local3 = CoD.GetCustomization( f647_arg2, "type" )
		local f647_local4 = Engine.GetModel( f647_local0, "isLinked" )
		local f647_local5 = Engine.GetModel( f647_local0, "groupIndex" )
		if f647_local4 then
			if Engine.GetModelValue( f647_local4 ) == true then
				Engine.ExecNow( f647_arg2, "unlinkLayers " .. f647_local3 )
				Engine.SetModelValue( f647_local4, false )
			else
				Engine.ExecNow( f647_arg2, "linkLayers " .. f647_local3 )
				Engine.SetModelValue( f647_local4, true )
			end
			local f647_local6 = Engine.GetSelectedLayerData( f647_arg2, f647_local2, f647_local3 )
			Engine.SetModelValue( f647_local5, f647_local6.groupIndex )
			CoD.SetEditorProperties( f647_arg2, Engine.GetLinkedLayerCount( f647_arg2, f647_local3 ), "linkedLayerCount" )
		end
	end
end

function EmblemEditor_GroupUngroupLayers( f648_arg0, f648_arg1, f648_arg2 )
	local f648_local0 = f648_arg1:getModel()
	local f648_local1 = Engine.GetModel( f648_local0, "layerIndex" )
	if f648_local1 then
		local f648_local2 = Engine.GetModelValue( f648_local1 )
		local f648_local3 = CoD.GetCustomization( f648_arg2, "type" )
		local f648_local4 = Engine.GetModel( f648_local0, "isLinked" )
		local f648_local5 = Engine.GetModel( f648_local0, "isGrouped" )
		local f648_local6 = Engine.GetModel( f648_local0, "groupIndex" )
		if f648_local4 and f648_local5 then
			local f648_local7 = Engine.GetModelValue( f648_local4 )
			local f648_local8 = Engine.GetModelValue( f648_local5 )
			local f648_local9 = Engine.GetSelectedLayerData( f648_arg2, f648_local2, f648_local3 )
			local f648_local10 = CoD.GetEditorProperties( f648_arg2, "linkedLayerCount" )
			if f648_local7 == true then
				if f648_local8 == true then
					Engine.ExecNow( f648_arg2, "ungroupLayers " .. f648_local3 )
					Engine.SetModelValue( f648_local5, false )
					Engine.SetModelValue( f648_local6, f648_local9.groupIndex )
					f648_arg0.layerCarousel:updateDataSource()
				elseif f648_local10 >= 2 and IsGroupSlotAvailable( f648_arg2 ) then
					Engine.ExecNow( f648_arg2, "groupLayers " .. f648_local3 )
					Engine.SetModelValue( f648_local5, true )
					Engine.SetModelValue( f648_local6, f648_local9.groupIndex )
					CoD.perController[f648_arg2].selectEmblemGroupIndex = f648_local9.groupIndex
					f648_arg0.layerCarousel:updateDataSource()
					CoD.perController[f648_arg2].selectEmblemGroupIndex = nil
				end
			end
		end
		CoD.SetEditorProperties( f648_arg2, Engine.GetLinkedLayerCount( f648_arg2, f648_local3 ), "linkedLayerCount" )
	end
end

function EmblemEditor_SaveSelectedGroup( f649_arg0, f649_arg1, f649_arg2, f649_arg3 )
	
end

function Emblems_SetIconOld( f650_arg0, f650_arg1, f650_arg2 )
	local f650_local0 = CoD.SafeGetModelValue( f650_arg1:getModel(), "iconID" )
	if f650_local0 then
		Engine.SetEmblemIconOld( f650_arg2, f650_local0 )
		local f650_local1 = LUI.getTableFromPath( "tabList.Tabs.grid.activeWidget", f650_arg0 )
		if f650_local1 then
			local f650_local2 = f650_local1:getModel( f650_arg2, "breadcrumbCount" )
			if f650_local2 then
				Engine.SetModelValue( f650_local2, math.max( 0, Engine.GetModelValue( f650_local2 ) - 1 ) )
			end
		end
	end
end

function Emblems_SetEmblemOld( f651_arg0, f651_arg1, f651_arg2 )
	local f651_local0 = CoD.SafeGetModelValue( f651_arg1:getModel(), "emblemIndex" )
	if f651_local0 then
		local f651_local1 = CoD.CraftUtility.Emblems.GetEmblemBreadcrumbRoot( f651_arg2, f651_local0, CoD.perController[f651_arg2].selectedEmblemTabStorageType )
		if f651_local1 then
			f651_local1:set( 1 )
			local f651_local2 = LUI.getTableFromPath( "tabList.Tabs.grid.activeWidget", f651_arg0 )
			if f651_local2 then
				local f651_local3 = f651_local2:getModel( f651_arg2, "breadcrumbCount" )
				if f651_local3 then
					Engine.SetModelValue( f651_local3, math.max( 0, Engine.GetModelValue( f651_local3 ) - 1 ) )
				end
			end
		end
	end
end

function Emblems_SetMaterialOld( f652_arg0, f652_arg1, f652_arg2 )
	local f652_local0 = CoD.SafeGetModelValue( f652_arg1:getModel(), "materialID" )
	if f652_local0 then
		local f652_local1 = CoD.CraftUtility.Emblems.GetEmblemMaterialBreadcrumbRoot( f652_arg2, f652_local0 )
		if f652_local1 then
			f652_local1:set( 1 )
			local f652_local2 = LUI.getTableFromPath( "materialSwatch.tabList.Tabs.grid.activeWidget", f652_arg0 )
			if f652_local2 then
				local f652_local3 = f652_local2:getModel( f652_arg2, "breadcrumbCount" )
				if f652_local3 then
					Engine.SetModelValue( f652_local3, math.max( 0, Engine.GetModelValue( f652_local3 ) - 1 ) )
				end
			end
		end
	end
end

function EmblemChooseIcon_SelectionRejected( f653_arg0, f653_arg1, f653_arg2 )
	local f653_local0 = CoD.GetEditorProperties( f653_arg2, "addDecalMode" )
	if CoD.perController[f653_arg2].selectedLayerIconID == CoD.emblem.INVALID_ID then
		Engine.ExecNow( f653_arg2, "emblemClear " .. CoD.GetCustomization( f653_arg2, "type" ) )
	elseif f653_local0 == CoD.emblem.ADDDECAL.INSERT then
		Engine.ExecNow( f653_arg2, "emblemCutLayer " .. CoD.GetCustomization( f653_arg2, "type" ) )
	else
		Engine.ExecNow( f653_arg2, "emblemSetSelectedLayerIconId " .. CoD.perController[f653_arg2].selectedLayerIconID )
	end
	CoD.SetEditorProperties( f653_arg2, CoD.emblem.ADDDECAL.REPLACE, "addDecalMode" )
	f0_local20( f653_arg2 )
end

function EmblemChooseIcon_SelectionAccepted( f654_arg0, f654_arg1, f654_arg2 )
	if CoD.GetEditorProperties( f654_arg2, "addDecalMode" ) == CoD.emblem.ADDDECAL.INSERT and CoD.perController[f654_arg2].selectedLayerIndex + 1 < CoD.perController[f654_arg2].totalLayers then
		local f654_local0 = CoD.GetCustomization( f654_arg2, "type" )
	end
	CoD.SetEditorProperties( f654_arg2, CoD.emblem.ADDDECAL.REPLACE, "addDecalMode" )
end

function EmblemChooseIcon_SelectionChanged( f655_arg0, f655_arg1, f655_arg2 )
	if IsSelfModelValueTrue( f655_arg1, f655_arg2, "isBMClassified" ) then
		Engine.ExecNow( f655_arg2, "emblemSetSelectedLayerIconId " .. -2 )
	else
		local f655_local0 = Engine.GetModelValue( f655_arg1:getModel( f655_arg2, "iconID" ) )
		Engine.ExecNow( f655_arg2, "emblemSetSelectedLayerIconId " .. f655_local0 )
		CoD.SetEditorProperties( f655_arg2, f655_local0, "selectedDecalID" )
	end
end

function EmblemChooseIcon_TabChanged( f656_arg0, f656_arg1, f656_arg2 )
	CoD.perController[f656_arg2].selectedDecalCategory = f656_arg1.tabCategory
	f656_arg0.emblemIconList:updateDataSource()
end

function EmblemChooseIcon_SetPreviewDecalCamera( f657_arg0, f657_arg1, f657_arg2 )
	CoD.CraftUtility.DisplayWeaponInPaintshop( f657_arg2, "paintshop_preview_" .. CoD.Paintshop.View[CoD.perController[f657_arg2].viewIndex].view_name )
end

function EmblemChooseIcon_RevertPreviewDecalCamera( f658_arg0, f658_arg1, f658_arg2 )
	CoD.CraftUtility.DisplayWeaponInPaintshop( f658_arg2, CoD.Paintshop.View[CoD.perController[f658_arg2].viewIndex].view_name )
end

function EmblemChooseMaterial_TabChanged( f659_arg0, f659_arg1, f659_arg2 )
	CoD.perController[f659_arg2].selectedMaterialCategory = f659_arg1.filter
	f659_arg0.materialSwatch:updateDataSource()
end

function EmblemChooseMaterial_SelectionChanged( f660_arg0, f660_arg1, f660_arg2 )
	if IsSelfModelValueTrue( f660_arg1, f660_arg2, "isBMClassified" ) then
		return true
	end
	local f660_local0 = f660_arg1:getModel( f660_arg2, "materialID" )
	if f660_local0 then
		Engine.ExecNow( f660_arg2, "emblemSetSelectedDecalMaterialId " .. Engine.GetModelValue( f660_local0 ) )
	end
end

function EmblemChooseMaterial_UpdateMaterialAngleByStep( f661_arg0, f661_arg1, f661_arg2, f661_arg3 )
	Engine.ExecNow( f661_arg3, "emblemUpdateMaterialAngle " .. f661_arg2 )
end

function EmblemChooseMaterial_ToggleScaleMode( f662_arg0, f662_arg1, f662_arg2 )
	local f662_local0
	if Engine.GetLayerMaterialScaleMode( f662_arg2 ) == Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED then
		f662_local0 = Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FREE
	else
		f662_local0 = Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED
	end
	CoD.SetEditorProperties( f662_arg2, f662_local0, "materialScaleMode" )
	Engine.ExecNow( f662_arg2, "setMaterialScaleMode " .. f662_local0 )
end

function EmblemChooseColor_ToggleBlend( f663_arg0, f663_arg1, f663_arg2 )
	Engine.ExecNow( f663_arg2, "emblemToggleColorBlend " .. CoD.GetCustomization( f663_arg2, "type" ) )
end

local f0_local28 = function ( f664_arg0 )
	local f664_local0 = Engine.GetModelForController( f664_arg0 )
	local f664_local1 = Engine.GetSelectedLayerColor( f664_arg0 )
	local f664_local2 = CoD.ConvertColor( f664_local1.red, f664_local1.green, f664_local1.blue )
	local f664_local3 = Engine.GetModel( f664_local0, "Emblem.EmblemSelectedLayerColor" )
	Engine.SetModelValue( Engine.GetModel( f664_local3, "color" ), f664_local2 )
	Engine.SetModelValue( Engine.GetModel( f664_local3, "red" ), f664_local1.red * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
	Engine.SetModelValue( Engine.GetModel( f664_local3, "green" ), f664_local1.green * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
	Engine.SetModelValue( Engine.GetModel( f664_local3, "blue" ), f664_local1.blue * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
	local f664_local4 = Engine.GetSelectedLayerColor1( f664_arg0 )
	local f664_local5 = CoD.ConvertColor( f664_local4.red, f664_local4.green, f664_local4.blue )
	local f664_local6 = Engine.GetModel( f664_local0, "Emblem.EmblemSelectedLayerColor1" )
	Engine.SetModelValue( Engine.GetModel( f664_local6, "color" ), f664_local5 )
	Engine.SetModelValue( Engine.GetModel( f664_local6, "red" ), f664_local4.red * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
	Engine.SetModelValue( Engine.GetModel( f664_local6, "green" ), f664_local4.green * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
	Engine.SetModelValue( Engine.GetModel( f664_local6, "blue" ), f664_local4.blue * CoD.emblem.MAX_COLOR_COMPONENT_VALUE )
	CoD.SetNoColorDataModel( f664_arg0 )
end

function EmblemChooseColor_ClearSelectedLayerMaterial( f665_arg0, f665_arg1, f665_arg2 )
	Engine.ExecNow( f665_arg2, "emblemClearSelectedLayerMaterialId" )
end

function EmblemChooseColor_SelectionChanged( f666_arg0, f666_arg1, f666_arg2 )
	local f666_local0 = CoD.GetEditorProperties( f666_arg2, "isGradientMode" )
	local f666_local1 = CoD.GetEditorProperties( f666_arg2, "colorNum" )
	local f666_local2 = CoD.NormalizeColor( Engine.GetModelValue( f666_arg1:getModel( f666_arg2, "color" ) ) )
	if f666_local0 == 0 then
		Engine.ExecNow( f666_arg2, "emblemSetLayerColor " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_NONE .. " " .. f666_local2[1] .. " " .. f666_local2[2] .. " " .. f666_local2[3] )
		Engine.ExecNow( f666_arg2, "emblemClearGradient" )
	elseif f666_local0 == 1 then
		if f666_local1 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 then
			Engine.ExecNow( f666_arg2, "emblemSetLayerColor " .. f666_local1 .. " " .. f666_local2[1] .. " " .. f666_local2[2] .. " " .. f666_local2[3] )
			if PropertyIsTrue( f666_arg0, "isColor1NoColor" ) then
				Engine.ExecNow( f666_arg2, "emblemSetLayerColor " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 .. " " .. f666_local2[1] .. " " .. f666_local2[2] .. " " .. f666_local2[3] )
			end
		elseif f666_local1 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
			Engine.ExecNow( f666_arg2, "emblemSetLayerColor " .. f666_local1 .. " " .. f666_local2[1] .. " " .. f666_local2[2] .. " " .. f666_local2[3] )
			if PropertyIsTrue( f666_arg0, "isColor0NoColor" ) then
				Engine.ExecNow( f666_arg2, "emblemSetLayerColor " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 .. " " .. f666_local2[1] .. " " .. f666_local2[2] .. " " .. f666_local2[3] )
			end
		end
	end
end

function EmblemChooseColor_SelectNoColor( f667_arg0, f667_arg1, f667_arg2 )
	local f667_local0 = DataSources.EmblemSelectedLayerNoColor.getModel( f667_arg2 )
	if f667_local0 ~= nil then
		local f667_local1 = CoD.NormalizeColor( Engine.GetModelValue( Engine.GetModel( f667_local0, "color" ) ) )
		f667_arg0.opacity0 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f667_arg2 ), "Emblem.EmblemSelectedLayerProperties.opacity0" ) ) / 100
		f667_arg0.opacity1 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f667_arg2 ), "Emblem.EmblemSelectedLayerProperties.opacity1" ) ) / 100
		local f667_local2 = CoD.GetEditorProperties( f667_arg2, "colorNum" )
		Engine.ExecNow( f667_arg2, "emblemSetLayerColor " .. f667_local2 .. " " .. f667_local1[1] .. " " .. f667_local1[2] .. " " .. f667_local1[3] )
		Engine.ExecNow( f667_arg2, "emblemLayerUpdateOpacity " .. f667_local2 .. " -1.0" )
	end
end

function EmblemChooseColor_NoColorLoseFocus( f668_arg0, f668_arg1, f668_arg2 )
	local f668_local0 = CoD.GetEditorProperties( f668_arg2, "colorNum" )
	if f668_arg0.lastSavedColor:isInFocus() or CoD.isPC then
		if not PropertyIsTrue( f668_arg0, "isColor0NoColor" ) and f668_local0 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 then
			if f668_arg0.opacity0 ~= nil and f668_arg0.opacity0 ~= 0 then
				Engine.ExecNow( f668_arg2, "emblemLayerUpdateOpacity " .. f668_local0 .. " " .. f668_arg0.opacity0 )
			else
				Engine.ExecNow( f668_arg2, "emblemLayerUpdateOpacity " .. f668_local0 .. " 1.0" )
			end
		elseif not PropertyIsTrue( f668_arg0, "isColor1NoColor" ) and f668_local0 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
			if f668_arg0.opacity1 ~= nil and f668_arg0.opacity1 ~= 0 then
				Engine.ExecNow( f668_arg2, "emblemLayerUpdateOpacity " .. f668_local0 .. " " .. f668_arg0.opacity1 )
			else
				Engine.ExecNow( f668_arg2, "emblemLayerUpdateOpacity " .. f668_local0 .. " 1.0" )
			end
		end
	end
end

local f0_local29 = function ( f669_arg0, f669_arg1 )
	local f669_local0, f669_local1 = f669_arg0:getLocalSize()
	local f669_local2 = f669_local0 * f669_arg1
	f669_arg0.pointer:setLeftRight( true, false, f669_local2, f669_local2 + 2 )
end

local f0_local30 = function ( f670_arg0, f670_arg1 )
	local f670_local0 = CoD.GetSelectedColor( f670_arg0 )
	if f670_local0 ~= nil then
		f670_arg1.redBar.bar:setShaderVector( 0, 0, f670_local0.green, f670_local0.blue, 1 )
		f670_arg1.redBar.bar:setShaderVector( 1, 1, f670_local0.green, f670_local0.blue, 1 )
		f0_local29( f670_arg1.redBar, f670_local0.red )
		f670_arg1.greenBar.bar:setShaderVector( 0, f670_local0.red, 0, f670_local0.blue, 1 )
		f670_arg1.greenBar.bar:setShaderVector( 1, f670_local0.red, 1, f670_local0.blue, 1 )
		f0_local29( f670_arg1.greenBar, f670_local0.green )
		f670_arg1.blueBar.bar:setShaderVector( 0, f670_local0.red, f670_local0.green, 0, 1 )
		f670_arg1.blueBar.bar:setShaderVector( 1, f670_local0.red, f670_local0.green, 1, 1 )
		f0_local29( f670_arg1.blueBar, f670_local0.blue )
	end
end

local f0_local31 = function ( f671_arg0, f671_arg1 )
	if CoD.GetEditorProperties( f671_arg1, "isGradientMode" ) == 0 then
		return f671_arg0.colorMixerContainer.colorMixer
	else
		return f671_arg0.colorGradientMixerContainer.colorMixer
	end
end

function EmblemChooseColor_ToggleColorMode( f672_arg0, f672_arg1, f672_arg2 )
	local f672_local0 = CoD.GetEditorProperties( f672_arg2, "colorMode" )
	local f672_local1 = CoD.GetEditorProperties( f672_arg2, "isGradientMode" )
	local f672_local2 = CoD.GetSelectedColor( f672_arg2 )
	if f672_local2 ~= nil then
		f0_local30( f672_arg2, f0_local31( f672_arg0, f672_arg2 ), f672_local2 )
	end
	if f672_local0 == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER then
		f672_arg0:updateMode( Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, f672_local1 )
		CoD.SetEditorProperties( f672_arg2, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, "colorMode" )
	elseif f672_local0 == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID then
		CoD.SetNoColorDataModel( f672_arg2 )
		local f672_local3 = CoD.GetEditorProperties( f672_arg2, "isColor0NoColor" )
		local f672_local4 = CoD.GetEditorProperties( f672_arg2, "isColor1NoColor" )
		local f672_local5 = CoD.GetEditorProperties( f672_arg2, "colorNum" )
		if f672_local3 == 1 and f672_local5 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 then
			Engine.ExecNow( f672_arg2, "emblemSetLayerColor " .. f672_local5 .. " 1 1 1" )
			Engine.ExecNow( f672_arg2, "emblemLayerUpdateOpacity " .. f672_local5 .. " 1.0" )
		elseif f672_local4 == 1 and f672_local5 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
			Engine.ExecNow( f672_arg2, "emblemSetLayerColor " .. f672_local5 .. " 1 1 1" )
			Engine.ExecNow( f672_arg2, "emblemLayerUpdateOpacity " .. f672_local5 .. " 1.0" )
		end
		f0_local28( f672_arg2 )
		f672_arg0:updateMode( Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER, f672_local1 )
		CoD.SetEditorProperties( f672_arg2, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER, "colorMode" )
	end
	f0_local28( f672_arg2 )
end

local f0_local32 = function ( f673_arg0, f673_arg1 )
	return f673_arg0.colorGradientContainer.gradientSlider
end

function EmblemChooseColor_ToggleGradientMode( f674_arg0, f674_arg1, f674_arg2 )
	local f674_local0 = CoD.GetEditorProperties( f674_arg2, "isGradientMode" )
	local f674_local1 = CoD.GetEditorProperties( f674_arg2, "colorMode" )
	f674_arg0.colorGradientContainer:setState( "DefaultState" )
	if f674_local0 == 1 then
		CoD.SetEditorProperties( f674_arg2, 0, "isGradientMode" )
		CoD.SetNoColorDataModel( f674_arg2 )
		local f674_local2 = CoD.GetEditorProperties( f674_arg2, "isColor0NoColor" )
		if f674_local2 ~= nil and f674_local2 == 1 then
			Engine.ExecNow( f674_arg2, "emblemSetLayerColor " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 .. " 1 1 1" )
			Engine.ExecNow( f674_arg2, "emblemLayerUpdateOpacity " .. CoD.GetEditorProperties( f674_arg2, "colorNum" ) .. " 1.0" )
		end
		f0_local28( f674_arg2 )
		CoD.SetEditorProperties( f674_arg2, Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_NONE, "colorNum" )
		CoD.SetEditorProperties( f674_arg2, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, "colorMode" )
		f674_arg0:updateMode( Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, 0 )
	elseif f674_local0 == 0 then
		CoD.SetEditorProperties( f674_arg2, 1, "isGradientMode" )
		Engine.ExecNow( f674_arg2, "emblemLayerUpdateOpacity " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 .. " -1" )
		if f674_local1 == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER then
			f674_arg0:updateMode( Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER, 1 )
		else
			f674_arg0:updateMode( Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, 1 )
		end
	end
	f0_local28( f674_arg2 )
	local f674_local2 = f0_local32( f674_arg0, f674_arg2 )
	EmblemGradient_UpdateGradientFillByStep( f674_local2, f674_local2, 0, f674_arg2 )
end

local f0_local33 = function ( f675_arg0, f675_arg1 )
	Engine.SetModelValue( f675_arg0, CoD.ClampColor( Engine.GetModelValue( f675_arg0 ) + f675_arg1, 0, 255 ) )
end

local f0_local34 = function ( f676_arg0, f676_arg1 )
	Engine.SetModelValue( f676_arg0, CoD.ClampColor( f676_arg1, 0, 255 ) )
end

local f0_local35 = function ( f677_arg0, f677_arg1 )
	local f677_local0 = Engine.GetModelValue( f677_arg0:getModel( f677_arg1, "red" ) )
	local f677_local1 = Engine.GetModelValue( f677_arg0:getModel( f677_arg1, "green" ) )
	local f677_local2 = Engine.GetModelValue( f677_arg0:getModel( f677_arg1, "blue" ) )
	local f677_local3 = 1 / CoD.emblem.MAX_COLOR_COMPONENT_VALUE
	Engine.ExecNow( f677_arg1, "emblemSetLayerColor " .. CoD.GetEditorProperties( f677_arg1, "colorNum" ) .. " " .. f677_local0 * f677_local3 .. " " .. f677_local1 * f677_local3 .. " " .. f677_local2 * f677_local3 )
end

local f0_local36 = function ( f678_arg0, f678_arg1 )
	local f678_local0 = Engine.GetModelForController( f678_arg1 )
	local f678_local1 = CoD.GetSelectedColor( f678_arg1 )
	if f678_local1 ~= nil then
		Engine.SetModelValue( f678_arg0:getModel( f678_arg1, "color" ), CoD.ConvertColor( f678_local1.red, f678_local1.green, f678_local1.blue ) )
	end
end

local f0_local37 = function ( f679_arg0, f679_arg1, f679_arg2, f679_arg3 )
	f0_local35( f679_arg1, f679_arg3 )
	f0_local36( f679_arg1, f679_arg3 )
	f0_local30( f679_arg3, f679_arg0 )
end

function EmblemChooseColor_DecrementColorComponent( f680_arg0, f680_arg1, f680_arg2, f680_arg3 )
	local f680_local0 = f680_arg1:getModel( f680_arg2, f680_arg3 )
	f0_local33( f680_local0, -1 )
	f0_local37( f680_arg0, f680_arg1, f680_local0, f680_arg2 )
end

function EmblemChooseColor_IncrementColorComponent( f681_arg0, f681_arg1, f681_arg2, f681_arg3 )
	local f681_local0 = f681_arg1:getModel( f681_arg2, f681_arg3 )
	f0_local33( f681_local0, 1 )
	f0_local37( f681_arg0, f681_arg1, f681_local0, f681_arg2 )
end

function EmblemChooseColor_SetColorComponent( f682_arg0, f682_arg1, f682_arg2, f682_arg3, f682_arg4 )
	local f682_local0 = f682_arg1:getModel( f682_arg2, f682_arg3 )
	f0_local34( f682_local0, f682_arg4 )
	f0_local37( f682_arg0, f682_arg1, f682_local0, f682_arg2 )
end

function EmblemChooseColor_UpdateOpacityByStep( f683_arg0, f683_arg1, f683_arg2, f683_arg3 )
	if not IsSelectedColorEmpty( f683_arg1, f683_arg3 ) then
		Engine.ExecNow( f683_arg3, "emblemLayerUpdateOpacity " .. CoD.GetEditorProperties( f683_arg3, "colorNum" ) .. " " .. f683_arg2 )
		CoD.SetNoColorDataModel( f683_arg3 )
		local f683_local0 = f0_local32( f683_arg0, f683_arg3 )
		EmblemGradient_UpdateGradientFillByStep( f683_local0, f683_local0, 0, f683_arg3 )
	end
end

function EmblemChooseColor_SetOpacity( f684_arg0, f684_arg1, f684_arg2, f684_arg3, f684_arg4 )
	local f684_local0 = false
	if f684_arg2 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 then
		f684_local0 = CoD.GetEditorProperties( f684_arg4, "isColor0NoColor" ) == 1
	elseif f684_arg2 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
		f684_local0 = CoD.GetEditorProperties( f684_arg4, "isColor1NoColor" ) == 1
	end
	if not f684_local0 then
		Engine.ExecNow( f684_arg4, "emblemLayerSetOpacity " .. f684_arg2 .. " " .. f684_arg3 )
		CoD.SetNoColorDataModel( f684_arg4 )
		local f684_local1 = f0_local32( f684_arg0, f684_arg4 )
		EmblemGradient_UpdateGradientFillByStep( f684_local1, f684_local1, 0, f684_arg4 )
	end
end

function EmblemChooseColor_UpdateBothColorOpacity( f685_arg0, f685_arg1, f685_arg2, f685_arg3 )
	if Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f685_arg3 ), "Emblem.EmblemSelectedLayerProperties.max_opacity" ) ) + f685_arg2 <= 100 then
		Engine.ExecNow( f685_arg3, "emblemLayerUpdateOpacity " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_NONE .. " " .. f685_arg2 )
	end
end

function EmblemGradient_Color0GainFocus( f686_arg0, f686_arg1, f686_arg2 )
	if CoD.GetEditorProperties( f686_arg2, "colorMode" ) == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE then
		CoD.SetEditorProperties( f686_arg2, Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0, "colorNum" )
	end
end

function EmblemGradient_Color1GainFocus( f687_arg0, f687_arg1, f687_arg2 )
	if CoD.GetEditorProperties( f687_arg2, "colorMode" ) == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE then
		CoD.SetEditorProperties( f687_arg2, Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1, "colorNum" )
	end
end

function EmblemGradient_ColorGradientSliderGainFocus( f688_arg0, f688_arg1, f688_arg2 )
	if CoD.GetEditorProperties( f688_arg2, "colorMode" ) == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE then
		CoD.SetEditorProperties( f688_arg2, Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_GRADIENT, "colorNum" )
	end
end

local f0_local38 = function ( f689_arg0, f689_arg1, f689_arg2 )
	local f689_local0 = DataSources.EmblemSelectedLayerEdittingColor.getModel( f689_arg2 )
	f689_arg0.colorGradientSwatchContainer:setModel( f689_local0 )
	f689_arg0.colorGradientMixerContainer.colorMixer:setModel( f689_local0 )
end

function EmblemGradient_ShowSwatchContainer( f690_arg0, f690_arg1, f690_arg2 )
	local f690_local0 = CoD.GetEditorProperties( f690_arg2, "isColor0NoColor" )
	local f690_local1 = CoD.GetEditorProperties( f690_arg2, "isColor1NoColor" )
	local f690_local2 = CoD.GetEditorProperties( f690_arg2, "colorNum" )
	if f690_arg0.colorGradientContainer.gradientColor0:isInFocus() then
		f690_arg0.colorGradientContainer:setState( "Color0State" )
	elseif f690_arg0.colorGradientContainer.gradientColor1:isInFocus() then
		f690_arg0.colorGradientContainer:setState( "Color1State" )
	end
	CoD.SetEditorProperties( f690_arg2, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, "colorMode" )
	f0_local38( f690_arg0, f690_arg1, f690_arg2 )
	CoD.SwapFocusableElements( f690_arg2, f690_arg0.colorGradientContainer, f690_arg0.colorGradientSwatchContainer )
	if f690_local0 == 1 and f690_local2 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 then
		CoD.SwapFocusableElements( f690_arg2, f690_arg0.colorGradientSwatchContainer.lastSavedColor, f690_arg0.colorGradientSwatchContainer.noColor )
		f690_arg0.colorGradientSwatchContainer.lastSavedColor.m_focusable = true
	elseif f690_local1 == 1 and f690_local2 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
		CoD.SwapFocusableElements( f690_arg2, f690_arg0.colorGradientSwatchContainer.lastSavedColor, f690_arg0.colorGradientSwatchContainer.noColor )
		f690_arg0.colorGradientSwatchContainer.lastSavedColor.m_focusable = true
	end
	f690_arg0.colorGradientContainer:hide()
	f690_arg0.colorGradientSwatchContainer:show()
end

function EmblemGradient_BackFromColorPicker( f691_arg0, f691_arg1, f691_arg2 )
	f0_local28( f691_arg2 )
	if f691_arg0.colorGradientSwatchContainer.m_focusable then
		CoD.SwapFocusableElements( f691_arg2, f691_arg0.colorGradientSwatchContainer, f691_arg0.colorGradientContainer )
		f691_arg0.colorGradientContainer:show()
		f691_arg0.colorGradientSwatchContainer:hide()
	elseif f691_arg0.colorGradientMixerContainer.m_focusable then
		CoD.SwapFocusableElements( f691_arg2, f691_arg0.colorGradientMixerContainer, f691_arg0.colorGradientContainer )
		f691_arg0.colorGradientContainer:show()
		f691_arg0.colorGradientMixerContainer:hide()
	end
	CoD.SetEditorProperties( f691_arg2, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE, "colorMode" )
	local f691_local0 = CoD.GetEditorProperties( f691_arg2, "colorNum" )
	f691_arg0.colorGradientContainer:setState( "DefaultState" )
	if f691_local0 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
		CoD.SwapFocusableElements( f691_arg2, f691_arg0.colorGradientContainer.gradientColor0, f691_arg0.colorGradientContainer.gradientColor1 )
		f691_arg0.colorGradientContainer.gradientColor0.m_focusable = true
	end
	local f691_local1 = f0_local32( f691_arg0, f691_arg2 )
	EmblemGradient_UpdateGradientFillByStep( f691_local1, f691_local1, 0, f691_arg2 )
end

function EmblemGradient_UpdateAngleByStep( f692_arg0, f692_arg1, f692_arg2, f692_arg3 )
	Engine.ExecNow( f692_arg3, "emblemUpdateGradientAngle " .. f692_arg2 )
end

function EmblemGradient_SetAngle( f693_arg0, f693_arg1, f693_arg2, f693_arg3 )
	Engine.ExecNow( f693_arg3, "emblemSetGradientAngle " .. f693_arg2 )
end

function EmblemGradient_ToggleGradientType( f694_arg0, f694_arg1, f694_arg2 )
	Engine.ExecNow( f694_arg2, "emblemToggleGradientType" )
end

local f0_local39 = function ( f695_arg0, f695_arg1 )
	local f695_local0 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f695_arg0 ), "Emblem.EmblemSelectedLayerProperties.gradient_fill" ) ) / CoD.emblem.MAX_GRADIENT_SLIDER_VALUE
	local f695_local1 = Engine.GetSelectedLayerColor( f695_arg0 )
	local f695_local2 = Engine.GetSelectedLayerColor1( f695_arg0 )
	f0_local29( f695_arg1, f695_local0 )
	if f695_local1 ~= nil and f695_local2 ~= nil then
		f695_arg1.bar:setShaderVector( 0, f695_local1.red, f695_local1.green, f695_local1.blue, f695_local1.alpha )
		f695_arg1.bar:setShaderVector( 1, f695_local2.red, f695_local2.green, f695_local2.blue, f695_local2.alpha )
		f695_arg1.bar:setShaderVector( 2, f695_local0, 0, 0, 0 )
	end
end

function EmblemGradient_UpdateGradientFillByStep( f696_arg0, f696_arg1, f696_arg2, f696_arg3 )
	Engine.ExecNow( f696_arg3, "emblemUpdateGradientFill " .. f696_arg2 )
	f0_local39( f696_arg3, f696_arg1 )
end

function EmblemGradient_SetGradientFill( f697_arg0, f697_arg1, f697_arg2, f697_arg3 )
	Engine.ExecNow( f697_arg3, "emblemSetGradientFill " .. f697_arg2 )
	f0_local39( f697_arg3, f697_arg1 )
end

function EmblemGradient_BackFromGradientPicker( f698_arg0, f698_arg1, f698_arg2 )
	if CoD.GetEditorProperties( f698_arg2, "isColor0NoColor" ) == 1 and CoD.GetEditorProperties( f698_arg2, "isColor1NoColor" ) == 1 then
		Engine.ExecNow( f698_arg2, "emblemSetLayerColor " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_NONE .. " 1 1 1" )
	end
end

function EmblemSelect_TabChanged( f699_arg0, f699_arg1, f699_arg2 )
	CoD.CraftUtility.Emblems.CachedEmblems = {}
	CoD.perController[f699_arg2].selectedEmblemTabStorageType = f699_arg1.storageType
	CoD.CraftUtility.Emblems.ParseDDL( f699_arg2, CoD.perController[f699_arg2].selectedEmblemTabStorageType )
	f699_arg0.emblemList:updateDataSource()
	f699_arg0.emblemList:setActiveItem( f699_arg0.emblemList:getFirstSelectableItem() )
	ForceNotifyModel( f699_arg2, "Emblem.UpdateDataSource" )
end

function UpdateSlotCountText( f700_arg0, f700_arg1, f700_arg2, f700_arg3 )
	return f700_arg1:setText( Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION", CoD.CraftUtility.GetUsedSlotsByFileType( f700_arg2, f700_arg3 ), CoD.CraftUtility.GetTotalAllowedSlotsByFileType( f700_arg2, f700_arg3 ) ) )
end

function UploadPublicProfile( f701_arg0, f701_arg1 )
	if f701_arg0.uploadProfile ~= nil and f701_arg0.uploadProfile == true then
		Engine.ExecNow( f701_arg1, "uploadprofile" )
	end
end

function BlackMarketSetAsEmblem( f702_arg0, f702_arg1, f702_arg2 )
	CoD.perController[f702_arg2].selectedEmblemModel = f702_arg1:getModel()
	local f702_local0, f702_local1, f702_local2 = CoD.BlackMarketUtility.GetLootEmblemIndexParams( f702_arg2, Engine.GetModelValue( f702_arg1:getModel( f702_arg2, "emblem" ) ) )
	Engine.SetupEmblemData( f702_local0, f702_local1, f702_local2 )
	if IsLive() then
		Engine.ExecNow( f702_local0, "emblemsetprofile" )
		f702_arg0.uploadProfile = true
	else
		Engine.SetProfileVar( f702_local0, "default_emblem_index", f702_local1 )
		Engine.ExecNow( f702_local0, "invalidateEmblemComponent" )
	end
end

function BlackMarketSetCallingCard( f703_arg0, f703_arg1, f703_arg2 )
	local f703_local0 = Engine.GetModel( f703_arg1:getModel(), "image" )
	if f703_local0 ~= nil then
		local f703_local1 = CoD.BlackMarketUtility.GetLootCallingCardIndex( f703_arg2, Engine.GetModelValue( f703_local0 ) )
		if not f703_local1 then
			return 
		end
		Engine.ExecNow( f703_arg2, "emblemSelectBackground " .. f703_local1 )
		if IsLive() then
			f703_arg0.uploadProfile = true
			Engine.ExecNow( f703_arg2, "emblemSetProfile" )
		else
			Engine.SetProfileVar( f703_arg2, "default_background_index", f703_local1 )
			Engine.ExecNow( f703_arg2, "invalidateEmblemComponent" )
		end
	end
	ForceNotifyControllerModel( f703_arg2, "xuid" )
end

function BlackMarketResultsOnClose( f704_arg0, f704_arg1, f704_arg2 )
	if not IsLive() then
		Engine.CommitProfileChanges( f704_arg2 )
	else
		UploadPublicProfile( f704_arg0, f704_arg2 )
	end
	CoD.perController[f704_arg2].selectedEmblemModel = nil
end

function CommitProfileChanges( f705_arg0 )
	Engine.CommitProfileChanges( f705_arg0 )
end

function EmblemSelect_Back( f706_arg0, f706_arg1, f706_arg2 )
	if not IsLive() then
		Engine.CommitProfileChanges( f706_arg2 )
	else
		UploadPublicProfile( f706_arg0, f706_arg2 )
	end
	CoD.perController[f706_arg2].selectedEmblemModel = nil
	CoD.CraftUtility.Emblems.CachedEmblems = {}
	ClearSavedState( f706_arg0, f706_arg2 )
end

function EmblemSelect_SetAsEmblem( f707_arg0, f707_arg1, f707_arg2 )
	if IsLive() then
		Engine.ExecNow( f707_arg2, "emblemsetprofile" )
		f707_arg0.uploadProfile = true
	else
		Engine.SetProfileVar( f707_arg2, "default_emblem_index", Engine.GetModelValue( f707_arg1:getModel( f707_arg2, "emblemIndex" ) ) )
		Engine.ExecNow( f707_arg2, "invalidateEmblemComponent" )
	end
end

function EmblemSelect_GainFocus( f708_arg0, f708_arg1, f708_arg2 )
	CoD.perController[f708_arg2].selectedEmblemModel = f708_arg1:getModel()
	Engine.SetupEmblemData( f708_arg2, Engine.GetModelValue( f708_arg1:getModel( f708_arg2, "emblemIndex" ) ), CoD.perController[f708_arg2].selectedEmblemTabStorageType )
end

function EmblemSelect_ChooseEmblem( f709_arg0, f709_arg1, f709_arg2 )
	CoD.perController[f709_arg2].totalLayers = Enum.CustomizationTypeLayerCount.CUSTOMIZATION_TYPE_EMBLEM_MAX_LAYERS
	CoD.perController[f709_arg2].totalGroups = Enum.CustomizationTypeGroupCount.CUSTOMIZATION_TYPE_MAX_GROUPS
	CoD.SetEditorProperties( f709_arg2, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE, "editorMode" )
	local f709_local0 = Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM
	CoD.SetCustomization( f709_arg2, f709_local0, "type" )
	Engine.SetupEmblemEditBuffer( f709_arg2, f709_local0, 0 )
end

function EmblemSelect_RenameEmblem( f710_arg0, f710_arg1, f710_arg2 )
	local f710_local0 = f710_arg0:getModel()
	CoD.CraftUtility.Emblems.RenameEmblem( f710_arg2, Engine.GetModelValue( Engine.GetModel( f710_local0, "emblemIndex" ) ), Engine.GetModelValue( Engine.GetModel( f710_local0, "emblemName" ) ) )
end

function EmblemSelect_HandleRenameKeyboardComplete( f711_arg0, f711_arg1, f711_arg2, f711_arg3 )
	local f711_local0 = f711_arg0:getModel()
	local f711_local1 = nil
	if not f711_local0 then
		return 
	elseif f711_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_EMBLEMS then
		f711_local1 = Engine.GetModel( f711_local0, "emblemName" )
	end
	if f711_local1 then
		Engine.SetModelValue( f711_local1, f711_arg3.input )
	end
end

function EmblemSelect_ClearEmblem( f712_arg0, f712_arg1, f712_arg2 )
	local f712_local0 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f712_arg2].selectedEmblemModel, "emblemIndex" ) )
	CoD.CraftUtility.Emblems.ClearEmblem( f712_arg2, f712_local0 )
	Engine.UploadEmblemData( f712_arg2, f712_local0 )
	CoD.CraftUtility.Emblems.ParseDDL( f712_arg2, Enum.StorageFileType.STORAGE_EMBLEMS )
	local f712_local1 = nil
	if IsMediaManager() == true then
		f712_local1 = GoBackMultiple( f712_arg0, f712_arg2, 1 )
		MediaManagerMarkDirty( f712_arg2 )
	else
		f712_local1 = GoBackMultiple( f712_arg0, f712_arg2, 2 )
	end
	if f712_local1.emblemList ~= nil then
		f712_local1.emblemList:updateDataSource( true )
		f712_local1.emblemList:setActiveItem( f712_local1.emblemList:getFirstSelectableItem() )
		ForceNotifyModel( f712_arg2, "Emblem.UpdateDataSource" )
	end
end

function EmblemSelect_CopyEmblem( f713_arg0, f713_arg1, f713_arg2, f713_arg3, f713_arg4 )
	local f713_local0 = CoD.CraftUtility.Emblems.Copy( f713_arg2, f713_arg4:getModel(), CoD.perController[f713_arg2].selectedEmblemTabStorageType )
	if f713_local0 then
		CoD.CraftUtility.Emblems.ParseDDL( f713_arg2, Enum.StorageFileType.STORAGE_EMBLEMS )
		local f713_local1 = GoBack( f713_arg4, f713_arg2 )
		f713_local1.emblemList:updateDataSource( true )
		local f713_local2 = f713_local1.emblemList:findItem( {
			emblemIndex = f713_local0
		} )
		if f713_local2 then
			f713_local1.emblemList:setActiveItem( f713_local2 )
		end
		ForceNotifyModel( f713_arg2, "Emblem.UpdateDataSource" )
	end
end

function PaintshopWeaponList_TabChanged( f714_arg0, f714_arg1, f714_arg2 )
	DataSources.CraftWeaponList.setCurrentFilterItem( f714_arg1.filter )
	f714_arg0.weaponList:updateDataSource( true )
	f714_arg0.weaponList:setActiveItem( f714_arg0.weaponList:getFirstSelectableItem() )
	CoD.SetCustomization( f714_arg2, f714_arg0.tabList.Tabs.grid.activeWidget.gridInfoTable.zeroBasedIndex + 1, "category_index" )
end

function PaintshopWeaponList_Back( f715_arg0, f715_arg1, f715_arg2 )
	CoD.perController[f715_arg2].selectedpaintjobModel = nil
	CoD.perController[f715_arg2].paintshopWeaponListIndex = nil
	CoD.CraftUtility.Paintjobs.CachedPaintjobs = {}
end

function PaintshopWeaponList_GainFocus( f716_arg0, f716_arg1, f716_arg2 )
	CoD.SetCustomization( f716_arg2, Engine.GetModelValue( f716_arg1:getModel( f716_arg2, "itemIndex" ) ), "weapon_index" )
	CoD.SetCustomization( f716_arg2, f716_arg0.tabList.Tabs.grid.activeWidget.gridInfoTable.zeroBasedIndex + 1, "category_index" )
	CoD.CraftUtility.Gunsmith.DisplayBaseWeapon( f716_arg0, f716_arg1, f716_arg2 )
end

function PaintshopWeaponList_PressBackOnPaintjobsSelector( f717_arg0, f717_arg1, f717_arg2 )
	CoD.CraftUtility.Gunsmith.DisplayBaseWeapon( f717_arg0, f717_arg1, f717_arg2 )
	f717_arg0:updateMode( Enum.PaintshopMode.PAINTSHOPMODE_WEAPONLIST, f717_arg1 )
	f717_arg0.paintjobSelector.paintjobsList:setActiveItem( f717_arg0.paintjobSelector.paintjobsList:getFirstSelectableItem() )
end

function PaintshopWeaponList_ChooseWeapon( f718_arg0, f718_arg1, f718_arg2 )
	f718_arg0:updateMode( Enum.PaintshopMode.PAINTSHOPMODE_PAINTJOBS, f718_arg1 )
	CoD.perController[f718_arg2].paintshopWeaponListIndex = f718_arg0.weaponList.activeWidget.gridInfoTable.zeroBasedIndex + 1
	f718_arg0.paintjobSelector.paintjobsList:updateDataSource( true )
	f718_arg0.paintjobSelector.paintjobsList:setActiveItem( f718_arg0.paintjobSelector.paintjobsList:getFirstSelectableItem() )
end

function FeaturedCardsActionButtonHandler( f719_arg0, f719_arg1, f719_arg2, f719_arg3, f719_arg4 )
	local f719_local0 = f719_arg0:getParentMenu()
	local f719_local1 = nil
	local f719_local2 = ""
	if FeaturedCards_IsEnabled( f719_arg1, f719_arg2 ) == false then
		return 
	elseif f719_arg0.LeftContainer.FEFeaturedCardsContainer.CardsList.activeWidget ~= nil then
		f719_local1 = Engine.GetFeaturedCard( f719_arg0.LeftContainer.FEFeaturedCardsContainer.CardsList.activeWidget.gridInfoTable.zeroBasedIndex )
		f719_local2 = string.lower( f719_local1.action )
	end
	if f719_local2 == "openwelcome" then
		OpenOverlay( f719_local0, "WelcomeMenu", f719_arg2 )
	elseif f719_local2 == "store" then
		if CoD.isPC then
			OpenSteamStore( f719_arg0, f719_arg1, f719_arg2, "FeaturedWidget", f719_local0 )
		else
			OpenStore( f719_arg0, f719_arg1, f719_arg2, "FeaturedWidget", f719_local0 )
		end
	elseif f719_local2 == "opengroups" then
		OpenGroups( f719_arg0, f719_arg1, f719_arg2, f719_arg3, f719_local0 )
	elseif f719_local2 == "openCRM" then
		
	elseif f719_local2 == "openmotd" then
		OpenMOTDPopup( f719_arg0, f719_arg1, f719_arg2, "FeaturedWidget", f719_local0 )
	end
end

function FeaturedCardsResetTimer( f720_arg0, f720_arg1, f720_arg2, f720_arg3, f720_arg4 )
	if f720_arg0.LeftContainer.FEFeaturedCardsContainer.CarouselTimer ~= nil then
		f720_arg0.LeftContainer.FEFeaturedCardsContainer.CarouselTimer:reset()
	end
end

function FeaturedCardsGetNextCard( f721_arg0, f721_arg1, f721_arg2, f721_arg3, f721_arg4 )
	local f721_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "FeaturedCardsRoot", false )
	Engine.SetModelValue( Engine.GetModel( f721_local0, "CardSequence" ), Engine.GetModelValue( Engine.GetModel( f721_local0, "CardSequence" ) ) + 1 )
end

function FeaturedCardsGetPreviousCard( f722_arg0, f722_arg1, f722_arg2, f722_arg3, f722_arg4 )
	local f722_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "FeaturedCardsRoot", false )
	Engine.SetModelValue( Engine.GetModel( f722_local0, "CardSequence" ), Engine.GetModelValue( Engine.GetModel( f722_local0, "CardSequence" ) ) - 1 )
end

function FeaturedCardsUpdateCRMMessage( f723_arg0, f723_arg1, f723_arg2, f723_arg3, f723_arg4 )
	Engine.UpdateFeaturedCardsCRMMessage( f723_arg2 )
end

function OpenPopularShowcase( f724_arg0, f724_arg1, f724_arg2, f724_arg3, f724_arg4 )
	f724_arg4:openOverlay( "MyShowcase", f724_arg2 )
end

function FileshareGetSlots( f725_arg0, f725_arg1, f725_arg2 )
	Engine.FileshareStartup( f725_arg2 )
end

function OpenMyShowcase( f726_arg0, f726_arg1, f726_arg2, f726_arg3, f726_arg4 )
	OpenPlayerShowcase( f726_arg0, f726_arg1, f726_arg2, {
		xuid = Engine.GetXUID64( f726_arg2 )
	}, f726_arg4 )
end

function OpenShowcase( f727_arg0, f727_arg1, f727_arg2, f727_arg3, f727_arg4 )
	local f727_local0 = CoD.FileshareUtility.GetCurrentCategory()
	local f727_local1 = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	if f727_local0 == "paintjob" then
		OpenShowcasePaintjobs( f727_arg0, f727_arg1, f727_arg2, f727_local1, f727_arg4 )
	elseif f727_local0 == "variant" then
		OpenShowcaseVariants( f727_arg0, f727_arg1, f727_arg2, f727_local1, f727_arg4 )
	elseif f727_local0 == "emblem" then
		OpenShowcaseEmblems( f727_arg0, f727_arg1, f727_arg2, f727_local1, f727_arg4 )
	elseif f727_local0 == "film" then
		OpenShowcaseRecentGames( f727_arg0, f727_arg1, f727_arg2, f727_local1, f727_arg4 )
	end
end

function OpenPlayerShowcaseOnParent( f728_arg0, f728_arg1, f728_arg2, f728_arg3, f728_arg4 )
	CoD.FileshareUtility.SetCurrentUser( f728_arg3.xuid )
	CoD.FileshareUtility.SetIsUserMode( f728_arg2, true )
	GoBackAndOpenOverlayOnParent( f728_arg0, "MyShowcase", f728_arg2 )
end

function OpenPlayerShowcase( f729_arg0, f729_arg1, f729_arg2, f729_arg3, f729_arg4 )
	CoD.FileshareUtility.SetCurrentUser( f729_arg3.xuid )
	CoD.FileshareUtility.SetIsUserMode( f729_arg2, true )
	OpenOverlay( f729_arg0, "MyShowcase", f729_arg2 )
end

function OpenShowcasePaintjobs( f730_arg0, f730_arg1, f730_arg2, f730_arg3, f730_arg4 )
	CoD.FileshareUtility.SetPreviousCategory( "paintjob" )
	CoD.FileshareUtility.SetCurrentCategory( "paintjob" )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	local f730_local0 = false
	if FileshareIsCurrentUserContext( f730_arg2 ) then
		f730_local0 = true
	end
	CoD.FileshareUtility.SetShowCreateButton( false )
	OpenOverlay( f730_arg0, "MyShowcase_Paintjobs", f730_arg2 )
end

function OpenShowcaseVariants( f731_arg0, f731_arg1, f731_arg2, f731_arg3, f731_arg4 )
	CoD.FileshareUtility.SetPreviousCategory( "variant" )
	CoD.FileshareUtility.SetCurrentCategory( "variant" )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	local f731_local0 = false
	if FileshareIsCurrentUserContext( f731_arg2 ) then
		f731_local0 = true
	end
	CoD.FileshareUtility.SetShowCreateButton( false )
	OpenOverlay( f731_arg0, "MyShowcase_Variants", f731_arg2 )
end

function OpenShowcaseEmblems( f732_arg0, f732_arg1, f732_arg2, f732_arg3, f732_arg4 )
	CoD.FileshareUtility.SetPreviousCategory( "emblem" )
	CoD.FileshareUtility.SetCurrentCategory( "emblem" )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	local f732_local0 = false
	if FileshareIsCurrentUserContext( f732_arg2 ) then
		f732_local0 = true
	end
	CoD.FileshareUtility.SetShowCreateButton( false )
	OpenOverlay( f732_arg0, "MyShowcase_Emblems", f732_arg2 )
end

function OpenShowcaseRecentGames( f733_arg0, f733_arg1, f733_arg2, f733_arg3, f733_arg4 )
	CoD.FileshareUtility.SetPreviousCategory( "film" )
	CoD.FileshareUtility.SetCurrentCategory( "film" )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	local f733_local0 = false
	if FileshareIsCurrentUserContext( f733_arg2 ) then
		f733_local0 = true
	end
	CoD.FileshareUtility.SetShowCreateButton( false )
	OpenOverlay( f733_arg0, "MyShowcase_RecentGames", f733_arg2 )
end

function OpenShowcaseManager( f734_arg0, f734_arg1, f734_arg2, f734_arg3, f734_arg4 )
	CoD.FileshareUtility.SetPreviousCategory( CoD.FileshareUtility.GetCurrentCategory() )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	CoD.FileshareUtility.SetShowCreateButton( FileshareCanBuyMoreSlots( f734_arg2 ) )
	OpenOverlay( f734_arg0, "Fileshare_ShowcaseManager", f734_arg2 )
end

function FileshareCloseShowcaseManager( f735_arg0, f735_arg1, f735_arg2 )
	CoD.FileshareUtility.SetInShowcaseManager( f735_arg2, false )
end

function FileshareOpenPublishMenu( f736_arg0, f736_arg1, f736_arg2, f736_arg3, f736_arg4 )
	local f736_local0 = CoD.FileshareUtility.GetCurrentCategory()
	if f736_local0 == "paintjob" then
		OpenPaintshop( f736_arg0, f736_arg1, f736_arg2, f736_arg3, f736_arg4 )
	elseif f736_local0 == "variant" then
		OpenGunsmith( f736_arg0, f736_arg1, f736_arg2, f736_arg3, f736_arg4 )
	elseif f736_local0 == "emblem" then
		OpenEmblemSelect( f736_arg0, f736_arg1, f736_arg2, CoD.FileshareUtility.GetLocalStorageType( f736_local0 ), f736_arg4 )
	end
end

function OpenMediaManagerSlotsFull( f737_arg0, f737_arg1, f737_arg2, f737_arg3, f737_arg4 )
	if f737_arg3 == nil or f737_arg3 == "" then
		f737_arg3 = "paintjob"
	end
	CoD.FileshareUtility.SetCurrentCategory( f737_arg3 )
	OpenPopup( f737_arg0, "MediaManagerSlotsFull", f737_arg2 )
end

function OpenMediaCommunity( f738_arg0, f738_arg1, f738_arg2, f738_arg3, f738_arg4, f738_arg5 )
	CoD.FileshareUtility.SetCurrentCommunityDataType( f738_arg5 )
	CoD.FileshareUtility.SetIsCommunityMode( f738_arg2, true )
	OpenOverlay( f738_arg0, "Community", f738_arg2 )
end

function FilesharePublishedTabChanged( f739_arg0, f739_arg1, f739_arg2 )
	if f739_arg1.fileshareCategory ~= nil then
		CoD.FileshareUtility.SetCurrentCategory( f739_arg1.fileshareCategory )
	else
		CoD.FileshareUtility.SetCurrentCategory( "" )
	end
	if f739_arg1.fileshareKey ~= nil and f739_arg1.fileshareVal ~= nil then
		CoD.FileshareUtility.SetCurrentFilter( f739_arg1.fileshareKey, f739_arg1.fileshareVal )
	else
		CoD.FileshareUtility.SetCurrentFilter( "", "" )
	end
	CoD.FileshareUtility.SetShowFileDetails( false )
	CoD.FileshareUtility.SetShowPublishNewDetails( false )
	CoD.FileshareUtility.SetDirty()
end

function FileshareShowcaseManagerTabChanged( f740_arg0, f740_arg1, f740_arg2 )
	if f740_arg1.fileshareCategory ~= nil then
		CoD.FileshareUtility.SetCurrentCategory( f740_arg1.fileshareCategory )
	else
		CoD.FileshareUtility.SetCurrentCategory( "" )
	end
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	CoD.FileshareUtility.SetShowFileDetails( false )
	CoD.FileshareUtility.SetShowPublishNewDetails( false )
	CoD.FileshareUtility.SetDirty()
end

function FileshareSetSelectedItemAttachTimer( f741_arg0, f741_arg1, f741_arg2, f741_arg3 )
	local f741_local0 = LUI.UITimer.newElementTimer( 300, true, function ()
		CoD.FileshareUtility.ProcessUIIndex( f741_arg1, f741_arg2, f741_arg3 )
	end, f741_arg0 )
	f741_arg0.processUIIndexTimer = f741_local0
	f741_arg0:addElement( f741_local0 )
end

function FileshareItemLoseFocus( f743_arg0 )
	if f743_arg0.processUIIndexTimer then
		f743_arg0.processUIIndexTimer:close()
		f743_arg0.processUIIndexTimer = nil
	end
end

function FileshareSetSelectedItem( f744_arg0, f744_arg1, f744_arg2, f744_arg3 )
	CoD.FileshareUtility.SetSelectedItem( f744_arg1:getModel() )
	local f744_local0 = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	local f744_local1 = CoD.FileshareUtility.GetSelectedItemProperty( "isPublishNew" )
	local f744_local2 = CoD.FileshareUtility.GetCurrentCategory()
	local f744_local3 = f744_arg3 == "true"
	if f744_local1 == true or f744_local0 == 0 then
		CoD.CraftUtility.Fileshare.ClearDisplay( f744_arg2 )
		return 
	elseif f744_arg1.gridInfoTable then
		FileshareSetSelectedItemAttachTimer( f744_arg1, f744_arg2, f744_local2, f744_arg1.gridInfoTable.zeroBasedIndex )
	end
	local f744_local4 = Engine.GetFileshareWeaponIndex( f744_arg2, f744_local0 )
	if f744_local2 == "paintjob" then
		CoD.CraftUtility.Fileshare.DisplayWeaponWithPaintjob( f744_arg2, f744_local4, f744_local0, f744_local3 )
	elseif f744_local2 == "variant" then
		CoD.CraftUtility.Fileshare.DisplayWeaponVariants( f744_arg2, f744_local4, f744_local0, f744_local3 )
	end
	if f744_local2 == "emblem" or f744_local2 == "film" then
		FileshareSetPreviewIconSizeShort()
	else
		FileshareSetPreviewIconSizeNormal()
	end
end

function FileshareCategorySelectorItemSelected( f745_arg0, f745_arg1, f745_arg2 )
	local f745_local0 = Engine.GetModelValue( Engine.GetModel( f745_arg1:getModel(), "category" ) )
	local f745_local1 = CoD.FileshareUtility.GetCurrentCommunityDataType()
	if f745_local0 ~= nil and f745_local0 ~= "" then
		CoD.FileshareUtility.SetCurrentCategory( f745_local0 )
	else
		CoD.FileshareUtility.SetCurrentCategory( "paintjob" )
	end
	if CoD.FileshareUtility.GetIsCommunityMode( f745_arg2 ) then
		Engine.FileshareFetchCommunityContent( f745_arg2, f745_local0, f745_local1 )
	elseif CoD.FileshareUtility.GetIsUserMode( f745_arg2 ) then
		local f745_local2 = CoD.FileshareUtility.GetCurrentUser()
		if f745_local0 == "film" then
			Engine.FileshareFetchCommunityContent( f745_arg2, f745_local0, Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_RECENT, f745_local2 )
		else
			CoD.FileshareUtility.FetchContentForUser( f745_arg2, f745_local2 )
		end
	end
	if f745_local0 ~= CoD.FileshareUtility.GetPreviousCategory() then
		CoD.FileshareUtility.SetDirty()
	end
	CoD.FileshareUtility.ProcessUIIndex( f745_arg2, f745_local0, 0 )
	CoD.FileshareUtility.SetPreviousCategory( f745_local0 )
	if f745_local0 == "emblem" or f745_local0 == "film" then
		FileshareSetPreviewIconSizeShort()
	else
		FileshareSetPreviewIconSizeNormal()
	end
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	CoD.FileshareUtility.SetShowFileDetails( false )
	CoD.FileshareUtility.SetShowPublishNewDetails( false )
	CoD.FileshareUtility.SetShowCreateButton( false )
end

function FileshareHandleKeyboardComplete( f746_arg0, f746_arg1, f746_arg2, f746_arg3 )
	if f746_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_FILESHARE_PUBLISH_NAME then
		CoD.FileshareUtility.SetPublishName( f746_arg3.input )
	elseif f746_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_FILESHARE_PUBLISH_DESCRIPTION then
		CoD.FileshareUtility.SetPublishDescription( f746_arg3.input )
	elseif f746_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_FILESHARE_PUBLISH_TAGS then
		CoD.FileshareUtility.SetPublishTags( f746_arg3.input )
	elseif f746_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_FILESHARE_DOWNLOAD_NAME then
		CoD.FileshareUtility.SetDownloadFileName( f746_arg3.input )
	end
end

function FileshareEnterDownloadName( f747_arg0, f747_arg1, f747_arg2 )
	ShowKeyboard( f747_arg0, f747_arg1, f747_arg2, "KEYBOARD_TYPE_FILESHARE_DOWNLOAD_NAME" )
end

function FileshareEnterPublishName( f748_arg0, f748_arg1, f748_arg2 )
	ShowKeyboard( f748_arg0, f748_arg1, f748_arg2, "KEYBOARD_TYPE_FILESHARE_PUBLISH_NAME" )
end

function FileshareEnterPublishDescription( f749_arg0, f749_arg1, f749_arg2 )
	ShowKeyboard( f749_arg0, f749_arg1, f749_arg2, "KEYBOARD_TYPE_FILESHARE_PUBLISH_DESCRIPTION" )
end

function FileshareEnterPublishTags( f750_arg0, f750_arg1, f750_arg2 )
	ShowKeyboard( f750_arg0, f750_arg1, f750_arg2, "KEYBOARD_TYPE_FILESHARE_PUBLISH_TAGS" )
end

function FileshareResetPublishingModel( f751_arg0, f751_arg1, f751_arg2 )
	CoD.FileshareUtility.ResetPublishingModel()
end

function FileshareToggleAllowDownload( f752_arg0, f752_arg1, f752_arg2 )
	if CoD.FileshareUtility.GetPublishAllowDownload() then
		CoD.FileshareUtility.SetPublishAllowDownload( false )
	else
		CoD.FileshareUtility.SetPublishAllowDownload( true )
	end
end

function FileshareDeleteCurrentItem( f753_arg0, f753_arg1, f753_arg2, f753_arg3, f753_arg4 )
	CoD.FileshareUtility.Delete( f753_arg0, f753_arg1, f753_arg2, f753_arg3, f753_arg4, true )
end

function FileshareDeleteDone( f754_arg0, f754_arg1, f754_arg2, f754_arg3, f754_arg4 )
	CoD.FileshareUtility.DeleteDone( f754_arg0, f754_arg1, f754_arg2, f754_arg3, f754_arg4 )
end

function FileshareSetPreviewIconSizeNormal()
	local f755_local0 = CoD.FileshareUtility.GetRootModel()
	local f755_local1 = Engine.CreateModel( f755_local0, "isNormalSize", false )
	local f755_local2 = Engine.CreateModel( f755_local0, "listVerticalCount", false )
	Engine.SetModelValue( f755_local1, true )
	Engine.SetModelValue( f755_local2, 2 )
end

function FileshareSetPreviewIconSizeShort()
	local f756_local0 = CoD.FileshareUtility.GetRootModel()
	local f756_local1 = Engine.CreateModel( f756_local0, "isNormalSize", false )
	local f756_local2 = Engine.CreateModel( f756_local0, "listVerticalCount", false )
	Engine.SetModelValue( f756_local1, false )
	Engine.SetModelValue( f756_local2, 3 )
end

function FileshareSummaryFileUpdate( f757_arg0 )
	local f757_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "fileshareRoot", false )
	local f757_local1 = Engine.GetModelValue( Engine.CreateModel( f757_local0, "summaryFileUpdated", false ) )
	if f757_local1 == nil then
		return 
	end
	for f757_local2 = 1, 9, 1 do
		local f757_local5 = Engine.CreateModel( f757_local0, "fileshareData_" .. f757_local2, false )
		local f757_local6 = Engine.CreateModel( f757_local5, "fileID", false )
		local f757_local7 = Engine.CreateModel( f757_local5, "renderFileId", false )
		if Engine.GetModelValue( f757_local6 ) == f757_local1 then
			Engine.SetModelValue( f757_local7, f757_local1 )
			break
		end
	end
end

function FileshareSetCommunityKicker( f758_arg0 )
	SetHeadingKickerText( Engine.Localize( CoD.FileshareUtility.GetCurrentCommunityMenuKicker() ) )
end

function FileshareDownloadSummary( f759_arg0, f759_arg1, f759_arg2 )
	local f759_local0 = f759_arg1:getModel()
	if f759_local0 then
		local f759_local1 = Engine.GetModelValue( Engine.GetModel( f759_local0, "fileId" ) )
		local f759_local2 = Engine.GetModelValue( Engine.GetModel( f759_local0, "fileSummarySize" ) )
		local f759_local3 = Engine.GetModelValue( Engine.GetModel( f759_local0, "isPooled" ) )
		local f759_local4 = Enum.fileShareLocation.FILESHARE_LOCATION_USERSTORAGE
		if f759_local3 then
			f759_local4 = Enum.fileShareLocation.FILESHARE_LOCATION_POOLEDSTORAGE
		end
		Engine.FileshareDownloadSummary( f759_arg2, f759_local1, f759_local2, f759_local4 )
	end
end

function FileshareAbortSummaryDownload( f760_arg0, f760_arg1, f760_arg2 )
	Engine.ExecNow( f760_arg2, "fileshareAbortSummary" )
end

function FileshareHandleDownloadSummary( f761_arg0, f761_arg1, f761_arg2, f761_arg3 )
	local f761_local0 = f761_arg0:getModel()
	if f761_local0 then
		CoD.FileshareUtility.SetupFileShareSummary( f761_local0, f761_arg3 )
	end
end

function FileshareBookmarkRecentGame( f762_arg0 )
	local f762_local0 = CoD.GetPlayerStats( f762_arg0 )
	local f762_local1 = f762_local0.AfterActionReportStats.demoFileID:get()
	if f762_local1 ~= nil and f762_local1 ~= "0" then
		Engine.BookmarkRecentGame( f762_arg0, f762_local1 )
		CoD.OverlayUtility.ShowToast( "RecentGameBookmarked", Engine.ToUpper( Engine.Localize( "MENU_NOTICE" ) ), Engine.Localize( "MENU_GAME_BOOKMARKED" ), "uie_bookmark" )
	end
end

function SetFileshareShowcaseKickerText( f763_arg0 )
	local f763_local0 = Engine.GetXUID64( f763_arg0 )
	local f763_local1 = Engine.ToUpper( Engine.Localize( "MENU_SHOWCASE" ) )
	if f763_local0 == CoD.FileshareUtility.GetCurrentUser() then
		f763_local1 = Engine.ToUpper( Engine.Localize( "MENU_MEDIA_MYSHOWCASE" ) )
	end
	SetHeadingKickerText( f763_local1 )
end

function SetIsInFileshare( f764_arg0, f764_arg1 )
	local f764_local0 = false
	if f764_arg1 and f764_arg1 == "true" then
		f764_local0 = true
	end
	CoD.perController[f764_arg0].inFileshare = f764_local0
end

function FileshareShowErrorToast( f765_arg0, f765_arg1, f765_arg2 )
	CoD.FileshareUtility.ShowSimpleToast( f765_arg2, CoD.FileshareUtility.ToastTypes.ERROR )
end

function FileshareLikeVoteSuccessHandler( f766_arg0, f766_arg1, f766_arg2 )
	CoD.FileshareUtility.ShowToast( f766_arg1, CoD.FileshareUtility.ToastTypes.LIKE )
end

function FileshareDisikeVoteSuccessHandler( f767_arg0, f767_arg1, f767_arg2 )
	CoD.FileshareUtility.ShowToast( f767_arg1, CoD.FileshareUtility.ToastTypes.DISLIKE )
end

function FileshareShowPublishSuccessToast( f768_arg0, f768_arg1, f768_arg2 )
	CoD.FileshareUtility.ShowToast( f768_arg2, CoD.FileshareUtility.ToastTypes.PUBLISH )
end

function FileshareShowDeleteSuccessToast( f769_arg0, f769_arg1, f769_arg2 )
	CoD.FileshareUtility.ShowToast( f769_arg2, CoD.FileshareUtility.ToastTypes.DELETE )
end

function FileshareShowDownloadSuccessToast( f770_arg0, f770_arg1, f770_arg2 )
	CoD.FileshareUtility.ShowToast( f770_arg2, CoD.FileshareUtility.ToastTypes.DOWNLOAD )
end

function FileshareShowReadonlyToast( f771_arg0, f771_arg1, f771_arg2 )
	CoD.FileshareUtility.ShowSimpleToast( f771_arg2, CoD.FileshareUtility.ToastTypes.READONLY )
end

function FileshareShowReportSuccessToast( f772_arg0, f772_arg1, f772_arg2 )
	CoD.FileshareUtility.ShowToast( f772_arg2, CoD.FileshareUtility.ToastTypes.REPORT )
end

function SetIsMediaManager( f773_arg0, f773_arg1, f773_arg2, f773_arg3, f773_arg4 )
	if f773_arg3 then
		local f773_local0 = 0
		if f773_arg3 == "true" then
			f773_local0 = 1
		end
		Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false ), "isMediaManager", false ), f773_local0 )
	end
end

function MediaManagerMarkDirty( f774_arg0 )
	local f774_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false ), "dirty", false )
	ForceNotifyGlobalModel( f774_arg0, "MediaManager.dirty" )
end

function MediaManagerClearPaintjob( f775_arg0, f775_arg1, f775_arg2, f775_arg3, f775_arg4 )
	CoD.CraftUtility.PaintjobClear( f775_arg0, f775_arg1, f775_arg2, f775_arg3, f775_arg4 )
end

function MediaManagerClearVariant( f776_arg0, f776_arg1, f776_arg2, f776_arg3, f776_arg4 )
	CoD.CraftUtility.GunsmithClear( f776_arg0, f776_arg1, f776_arg2, f776_arg3, f776_arg4 )
end

function MediaManagerClearEmblem( f777_arg0, f777_arg1, f777_arg2, f777_arg3, f777_arg4 )
	CoD.CraftUtility.EmblemClear( f777_arg0, f777_arg1, f777_arg2, f777_arg3, f777_arg4 )
end

function MediaManagerTabChanged( f778_arg0, f778_arg1, f778_arg2 )
	CoD.perController[f778_arg2].selectedMediaManagerTab = f778_arg1.fileshareCategory
	CoD.FileshareUtility.SetCurrentCategory( f778_arg1.fileshareCategory )
end

function MediaManagerClearDisplay( f779_arg0, f779_arg1, f779_arg2 )
	if CoD.FileshareUtility.IsCategoryFilm( f779_arg2, f779_arg1 ) then
		return 
	else
		CoD.CraftUtility.Fileshare.ClearDisplay( f779_arg2 )
	end
end

function MediaManagerSetSlotModel( f780_arg0, f780_arg1, f780_arg2, f780_arg3 )
	local f780_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false )
	local f780_local1 = Engine.CreateModel( f780_local0, "isBuyMoreSlot", false )
	local f780_local2 = Engine.CreateModel( f780_local0, "createTime", false )
	local f780_local3 = Engine.CreateModel( f780_local0, "authorName", false )
	Engine.SetModelValue( f780_local1, f780_arg1 )
	Engine.SetModelValue( f780_local2, f780_arg2 )
	Engine.SetModelValue( f780_local3, f780_arg3 )
	ForceNotifyGlobalModel( f780_arg0, "MediaManager.createTime" )
	ForceNotifyGlobalModel( f780_arg0, "MediaManager.authorName" )
end

function MediaManagerPaintjobFocusChanged( f781_arg0, f781_arg1, f781_arg2 )
	local f781_local0 = f781_arg1:getModel( f781_arg2, "paintjobSlotAndIndex" )
	local f781_local1 = Engine.GetModelValue( f781_local0 )
	Engine.SetModelValue( f781_local0, f781_local1 )
	CoD.SetCustomization( f781_arg2, Engine.GetModelValue( f781_arg1:getModel( f781_arg2, "weaponIndex" ) ), "weapon_index" )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f781_arg2 ), "MediaManagerSelectedPaintjob" ), "paintjobSlotAndIndex" ), f781_local1 )
	MediaManagerSetSlotModel( f781_arg2, false, Engine.GetModelValue( f781_arg1:getModel( f781_arg2, "createTime" ) ), Engine.GetModelValue( f781_arg1:getModel( f781_arg2, "authorName" ) ) )
end

function MediaManagerVariantFocusChanged( f782_arg0, f782_arg1, f782_arg2 )
	CoD.SetCustomization( f782_arg2, Engine.GetModelValue( f782_arg1:getModel( f782_arg2, "weaponIndex" ) ), "weapon_index" )
	MediaManagerSetSlotModel( f782_arg2, false, Engine.GetModelValue( f782_arg1:getModel( f782_arg2, "createTime" ) ), Engine.GetModelValue( f782_arg1:getModel( f782_arg2, "authorName" ) ) )
end

function MediaManagerEmblemFocusChanged( f783_arg0, f783_arg1, f783_arg2 )
	CoD.SetCustomization( f783_arg2, Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM, "type" )
	CoD.perController[f783_arg2].selectedEmblemModel = f783_arg1:getModel()
	Engine.SetupEmblemData( f783_arg2, Engine.GetModelValue( f783_arg1:getModel( f783_arg2, "emblemIndex" ) ), CoD.perController[f783_arg2].selectedEmblemTabStorageType )
	MediaManagerSetSlotModel( f783_arg2, false, Engine.GetModelValue( f783_arg1:getModel( f783_arg2, "createTime" ) ), Engine.GetModelValue( f783_arg1:getModel( f783_arg2, "authorName" ) ) )
end

function MediaManagerBuyMoreSlotOnFocus( f784_arg0, f784_arg1, f784_arg2 )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false ), "isBuyMoreSlot", false ), true )
end

function OpenMediaManager( f785_arg0, f785_arg1, f785_arg2, f785_arg3, f785_arg4 )
	CoD.FileshareUtility.SetPreviousCategory( CoD.FileshareUtility.GetCurrentCategory() )
	CoD.FileshareUtility.SetCurrentCategory( f785_arg3 )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false ), "previousWeaponIndex", false ), CoD.GetCustomization( f785_arg2, "weapon_index" ) )
	MediaManagerClearDisplay( f785_arg0, f785_arg1, f785_arg2 )
	OpenOverlay( f785_arg0, "MediaManager", f785_arg2 )
end

function GoBackAndOpenMediaManagerOnParent( f786_arg0, f786_arg1, f786_arg2, f786_arg3, f786_arg4 )
	CoD.FileshareUtility.SetPreviousCategory( CoD.FileshareUtility.GetCurrentCategory() )
	if f786_arg3 ~= nil and f786_arg3 ~= "" then
		CoD.FileshareUtility.SetCurrentCategory( f786_arg3 )
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false ), "previousWeaponIndex", false ), CoD.GetCustomization( f786_arg2, "weapon_index" ) )
	MediaManagerClearDisplay( f786_arg0, f786_arg1, f786_arg2 )
	GoBackAndOpenOverlayOnParent( f786_arg0, "MediaManager", f786_arg2 )
end

function MediaManagerClose( f787_arg0, f787_arg1, f787_arg2 )
	local f787_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false ), "previousWeaponIndex", false )
	CoD.FileshareUtility.SetCurrentCategory( CoD.FileshareUtility.GetPreviousCategory() )
	CoD.FileshareUtility.SetDirty()
	CoD.SetCustomization( f787_arg2, Engine.GetModelValue( f787_local0 ), "weapon_index" )
	CoD.CraftUtility.Gunsmith.DisplayBaseWeapon( f787_arg0, f787_arg1, f787_arg2 )
end

function MediaManagerFetchPaintjobsData( f788_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f788_arg0 ), "Paintshop.Mode" ), Enum.PaintshopMode.PAINTSHOPMODE_WEAPONLIST )
	CoD.SetCustomization( f788_arg0, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT, "type" )
	CoD.perController[f788_arg0].totalLayers = Enum.CustomizationTypeLayerCount.CUSTOMIZATION_TYPE_PAINTSHOP_MAX_LAYERS
	CoD.perController[f788_arg0].totalGroups = Enum.CustomizationTypeGroupCount.CUSTOMIZATION_TYPE_MAX_GROUPS
	local f788_local0 = CoD.CraftUtility.Paintjobs.ParseDDL( f788_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS )
end

function MediaManagerFetchVariantsData( f789_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f789_arg0 ), "Gunsmith.Mode" ), Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST )
	local f789_local0 = CoD.CraftUtility.Gunsmith.ParseDDL( f789_arg0, Enum.StorageFileType.STORAGE_GUNSMITH )
end

function MediaManagerFetchEmblemsData( f790_arg0 )
	CoD.perController[f790_arg0].selectedEmblemTabStorageType = Enum.StorageFileType.STORAGE_EMBLEMS
	local f790_local0 = CoD.CraftUtility.Emblems.ParseDDL( f790_arg0, CoD.perController[f790_arg0].selectedEmblemTabStorageType )
end

function MediaManagerUpdateLocalData( f791_arg0 )
	MediaManagerFetchPaintjobsData( f791_arg0 )
	MediaManagerFetchVariantsData( f791_arg0 )
	MediaManagerFetchEmblemsData( f791_arg0 )
end

function PaintjobSelector_GainFocus( f792_arg0, f792_arg1, f792_arg2 )
	CoD.perController[f792_arg2].selectedpaintjobModel = f792_arg1:getModel()
	CoD.perController[f792_arg2].viewIndex = 1
	local f792_local0 = CoD.Paintshop.View[CoD.perController[f792_arg2].viewIndex].customization_type
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithPaintjob( f792_arg2, Engine.GetModelValue( f792_arg1:getModel( f792_arg2, "paintjobIndex" ) ), Engine.GetModelValue( f792_arg1:getModel( f792_arg2, "paintjobSlot" ) ) )
end

function PaintjobSelector_ChoosePaintjob( f793_arg0, f793_arg1, f793_arg2 )
	CoD.perController[f793_arg2].viewIndex = 1
	local f793_local0 = CoD.Paintshop.View[CoD.perController[f793_arg2].viewIndex].view_name
	local f793_local1 = CoD.Paintshop.View[CoD.perController[f793_arg2].viewIndex].customization_type
	local f793_local2 = CoD.Paintshop.View[CoD.perController[f793_arg2].viewIndex].view_string_ref
	CoD.SetCustomization( f793_arg2, f793_local1, "type" )
	CoD.SetCustomization( f793_arg2, f793_local2, "view_string_ref" )
	Engine.SetupEmblemEditBuffer( f793_arg2, f793_local1, CoD.GetCustomization( f793_arg2, "weapon_index" ) )
	CoD.CraftUtility.DisplayWeaponInPaintshop( f793_arg2, f793_local0 )
	Engine.SendMenuResponse( f793_arg2, "paintshop_light", "far" )
	CoD.SetEditorProperties( f793_arg2, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE, "editorMode" )
end

function FileshareOpenPreviousPublishMenu( f794_arg0, f794_arg1, f794_arg2, f794_arg3 )
	local f794_local0 = CoD.FileshareUtility.GetCurrentCategory()
	if f794_local0 == "paintjob" then
		CoD.CraftUtility.OpenPublishPromptPaintjob( f794_arg0, f794_arg1, f794_arg2, nil, f794_arg3 )
	elseif f794_local0 == "emblem" then
		CoD.CraftUtility.OpenPublishPromptEmblem( f794_arg0, f794_arg1, f794_arg2, nil, f794_arg3 )
	elseif f794_local0 == "variant" then
		CoD.CraftUtility.OpenPublishPromptGunsmith( f794_arg0, f794_arg1, f794_arg2, nil, f794_arg3 )
	end
end

function FileshareOpenFullscreenView( f795_arg0, f795_arg1, f795_arg2, f795_arg3 )
	if f795_arg1.gridInfoTable then
		CoD.FileshareUtility.ReportView( f795_arg2, f795_arg1.gridInfoTable.zeroBasedIndex )
	end
	OpenMenuByNameParam( f795_arg0, f795_arg1, f795_arg2, "Fileshare_DetailsView", f795_arg3 )
end

function FilesharePublish( f796_arg0, f796_arg1, f796_arg2 )
	CoD.FileshareUtility.Publish( f796_arg2 )
end

function FileshareDownload( f797_arg0, f797_arg1, f797_arg2 )
	CoD.FileshareUtility.Download( f797_arg2 )
end

function SteamWorkshopPublish( f798_arg0, f798_arg1, f798_arg2 )
	CoD.SteamWorkshopUtility.Publish( f798_arg0, f798_arg1, f798_arg2 )
end

function SteamWorkshopOpenAgreement( f799_arg0, f799_arg1, f799_arg2 )
	CoD.SteamWorkshopUtility.OpenAgreement( f799_arg0, f799_arg1, f799_arg2 )
end

function SteamWorkshopOpenFAQ( f800_arg0, f800_arg1, f800_arg2 )
	CoD.SteamWorkshopUtility.OpenFAQ( f800_arg0, f800_arg1, f800_arg2 )
end

function SteamWorkshopOpenItem( f801_arg0, f801_arg1, f801_arg2 )
	CoD.SteamWorkshopUtility.OpenItemOnSteam( f801_arg0, f801_arg1, f801_arg2 )
end

function SteamWorkshopViewWorkshop( f802_arg0, f802_arg1, f802_arg2 )
	CoD.SteamWorkshopUtility.ViewWorkshop( f802_arg0, f802_arg1, f802_arg2 )
end

function PaintjobSelector_ClearPaintjob( f803_arg0, f803_arg1, f803_arg2, f803_arg3 )
	local f803_local0 = CoD.perController[f803_arg2].selectedpaintjobModel
	CoD.CraftUtility.Paintjobs.ClearPaintjob( f803_arg2, Engine.GetModelValue( Engine.GetModel( f803_local0, "paintjobSlot" ) ), Engine.GetModelValue( Engine.GetModel( f803_local0, "paintjobIndex" ) ) )
	CoD.CraftUtility.Paintjobs.ParseDDL( f803_arg2, Enum.StorageFileType.STORAGE_PAINTJOBS )
	if IsMediaManager() == true then
		GoBackMultiple( f803_arg0, f803_arg2, 1 )
		MediaManagerMarkDirty( f803_arg2 )
	else
		local f803_local1 = GoBackMultiple( f803_arg0, f803_arg2, 2 )
		if f803_local1.paintjobSelector ~= nil then
			f803_local1.paintjobSelector.paintjobsList:updateDataSource( true )
			f803_local1.paintjobSelector.paintjobsList:setActiveItem( f803_local1.paintjobSelector.paintjobsList:getFirstSelectableItem() )
		end
	end
	if Engine.GetModel( Engine.GetModelForController( f803_arg2 ), "Paintshop.UpdateDataSource" ) ~= nil then
		ForceNotifyModel( f803_arg2, "Paintshop.UpdateDataSource" )
	end
end

function PaintjobSelector_CopyPaintjob( f804_arg0, f804_arg1, f804_arg2, f804_arg3, f804_arg4 )
	local f804_local0, f804_local1 = CoD.CraftUtility.Paintjobs.Copy( f804_arg2, f804_arg4:getModel() )
	if f804_local0 and f804_local1 then
		CoD.CraftUtility.Paintjobs.ParseDDL( f804_arg2, Enum.StorageFileType.STORAGE_PAINTJOBS )
		CoD.CraftUtility.InvalidateWCItemRender( f804_local0, f804_local1 )
		local f804_local2 = GoBack( f804_arg4, f804_arg2 )
		local f804_local3 = f804_local2.paintjobSelector.paintjobsList
		f804_local3:updateDataSource( true )
		local f804_local4 = f804_local3:findItem( {
			paintjobSlot = f804_local0,
			paintjobIndex = f804_local1
		} )
		if f804_local4 then
			f804_local3:setActiveItem( f804_local4 )
		end
		ForceNotifyModel( f804_arg2, "Paintshop.UpdateDataSource" )
	end
end

function PaintjobSelector_RenamePaintjob( f805_arg0, f805_arg1, f805_arg2 )
	local f805_local0 = f805_arg0:getModel()
	CoD.CraftUtility.Paintjobs.RenamePaintjob( f805_arg2, Engine.GetModelValue( Engine.GetModel( f805_local0, "paintjobSlot" ) ), Engine.GetModelValue( Engine.GetModel( f805_local0, "paintjobIndex" ) ), Engine.GetModelValue( Engine.GetModel( f805_local0, "paintjobName" ) ) )
end

function PaintjobSelector_HandleRenameKeyboardComplete( f806_arg0, f806_arg1, f806_arg2, f806_arg3 )
	local f806_local0 = f806_arg0:getModel()
	local f806_local1 = nil
	if not f806_local0 then
		return 
	elseif f806_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_PAINTJOB then
		f806_local1 = Engine.GetModel( f806_local0, "paintjobName" )
	end
	if f806_local1 then
		Engine.SetModelValue( f806_local1, f806_arg3.input )
	end
end

function PaintjobEditor_OpenSavePopup( f807_arg0, f807_arg1, f807_arg2, f807_arg3 )
	CoD.OverlayUtility.CreateOverlay( f807_arg2, f807_arg0, "PaintjobSave", CoD.perController[f807_arg2].selectedpaintjobModel )
end

function PaintjobEditor_ResetLayer( f808_arg0, f808_arg1, f808_arg2, f808_arg3 )
	Engine.ExecNow( f808_arg2, "emblemRevertLayerChanges " .. CoD.perController[f808_arg2].selectedLayerIndex .. " " .. CoD.GetCustomization( f808_arg2, "type" ) )
	EmblemEditor_BeginEdit( f808_arg0, f808_arg1, f808_arg2 )
	GoBack( f808_arg0, f808_arg2 )
end

function PaintjobEditor_ToggleGrid( f809_arg0, f809_arg1, f809_arg2, f809_arg3 )
	local f809_local0 = CoD.CraftUtility.GetGridTypeName( f809_arg2 )
	local f809_local1 = 0
	if not IsGridOn( f809_arg2, f809_local0 ) then
		f809_local1 = CoD.CraftUtility.GetGridSize( f809_arg2 )
	end
	SetProfileVar( f809_arg2, f809_local0, f809_local1 )
	Engine.ExecNow( f809_arg2, "emblemSetGridSize " .. CoD.GetCustomization( f809_arg2, "type" ) .. " " .. f809_local1 )
	EmblemEditor_BeginEdit( f809_arg0, f809_arg1, f809_arg2 )
	GoBack( f809_arg0, f809_arg2 )
end

function PaintjobEditor_RemoveGrid( f810_arg0 )
	Engine.ExecNow( f810_arg0, "emblemSetGridSize " .. CoD.GetCustomization( f810_arg0, "type" ) .. " 0" )
end

function PaintjobEditor_RestoreGridState( f811_arg0 )
	Engine.ExecNow( f811_arg0, "emblemSetGridSize " .. CoD.GetCustomization( f811_arg0, "type" ) .. " " .. Engine.GetProfileVarInt( f811_arg0, CoD.CraftUtility.GetGridTypeName( f811_arg0 ) ) )
end

function PaintjobEditor_ChangeViewRightBumper( f812_arg0, f812_arg1, f812_arg2 )
	local f812_local0 = CoD.CraftUtility.Paintjobs.GetNextViewIndex( f812_arg2 )
	CoD.perController[f812_arg2].viewIndex = f812_local0
	local f812_local1 = CoD.Paintshop.View[f812_local0].view_name
	local f812_local2 = CoD.Paintshop.View[f812_local0].customization_type
	local f812_local3 = CoD.Paintshop.View[f812_local0].view_string_ref
	CoD.SetCustomization( f812_arg2, f812_local2, "type" )
	CoD.SetCustomization( f812_arg2, f812_local3, "view_string_ref" )
	Engine.SetupEmblemEditBuffer( f812_arg2, f812_local2, CoD.GetCustomization( f812_arg2, "weapon_index" ) )
	CoD.CraftUtility.DisplayWeaponInPaintshop( f812_arg2, f812_local1 )
	f812_arg0.layerCarousel:updateDataSource()
end

function PaintjobEditor_ChangeViewLeftBumper( f813_arg0, f813_arg1, f813_arg2 )
	local f813_local0 = CoD.CraftUtility.Paintjobs.GetPrevViewIndex( f813_arg2 )
	CoD.perController[f813_arg2].viewIndex = f813_local0
	local f813_local1 = CoD.Paintshop.View[f813_local0].view_name
	local f813_local2 = CoD.Paintshop.View[f813_local0].customization_type
	local f813_local3 = CoD.Paintshop.View[f813_local0].view_string_ref
	CoD.SetCustomization( f813_arg2, f813_local2, "type" )
	CoD.SetCustomization( f813_arg2, f813_local3, "view_string_ref" )
	Engine.SetupEmblemEditBuffer( f813_arg2, f813_local2, CoD.GetCustomization( f813_arg2, "weapon_index" ) )
	CoD.CraftUtility.DisplayWeaponInPaintshop( f813_arg2, f813_local1 )
	f813_arg0.layerCarousel:updateDataSource()
end

function PaintjobEditor_HandleKeyboardComplete( f814_arg0, f814_arg1, f814_arg2, f814_arg3 )
	local f814_local0 = CoD.perController[f814_arg2].selectedpaintjobModel
	local f814_local1 = nil
	if not f814_local0 then
		return 
	elseif f814_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_PAINTJOB then
		f814_local1 = Engine.GetModel( f814_local0, "paintjobTextEntry" )
		if f814_local1 then
			Engine.SetModelValue( f814_local1, f814_arg3.input )
		end
		local f814_local2 = f814_arg0:getModel( f814_arg2, "inputText" )
		if f814_local2 then
			Engine.SetModelValue( f814_local2, f814_arg3.input )
		end
	end
end

local f0_local40 = function ( f815_arg0, f815_arg1, f815_arg2, f815_arg3 )
	local f815_local0 = 0
	if f815_arg0.occludedMenu and f815_arg0.occludedMenu.openTime then
		f815_local0 = Engine.milliseconds() - f815_arg0.occludedMenu.openTime
	end
	LUI.CoDMetrics.PaintshopEvent( f815_arg1, f815_arg3, f815_local0, Engine.GetModelValue( Engine.GetModel( f815_arg2, "weaponIndex" ) ), Engine.GetModelValue( Engine.GetModel( f815_arg2, "paintjobName" ) ), Engine.GetPaintshopSummaryString() )
end

function PaintjobEditor_SavePaintjob( f816_arg0, f816_arg1, f816_arg2, f816_arg3 )
	Engine.SetModelValue( Engine.GetModel( f816_arg3, "paintjobName" ), Engine.GetModelValue( Engine.GetModel( f816_arg3, "paintjobTextEntry" ) ) )
	CoD.CraftUtility.Paintjobs.UploadPaintjob( f816_arg2, f816_arg3 )
	CoD.CraftUtility.Paintjobs.ParseDDL( f816_arg2, Enum.StorageFileType.STORAGE_PAINTJOBS )
	CoD.CraftUtility.Paintjobs.InvalidateRender( f816_arg2, f816_arg3 )
	f0_local40( f816_arg0, f816_arg2, f816_arg3, "save" )
	local f816_local0 = GoBack( f816_arg0, f816_arg2 )
	EmblemEditor_HandleBackInBrowseMode( f816_local0, f816_arg1, f816_arg2 )
	ClearSavedState( f816_local0, f816_arg2 )
end

function PaintjobEditor_DiscardChanges( f817_arg0, f817_arg1, f817_arg2, f817_arg3 )
	local f817_local0 = GoBack( f817_arg0, f817_arg2 )
	f0_local40( f817_arg0, f817_arg2, f817_arg3, "discard" )
	EmblemEditor_HandleBackInBrowseMode( f817_local0, f817_arg1, f817_arg2 )
	ClearSavedState( f817_local0, f817_arg2 )
end

function PaintjobEditor_SaveChangesBack( f818_arg0, f818_arg1, f818_arg2, f818_arg3 )
	if Engine.GetModelValue( Engine.GetModel( f818_arg3, "weaponIndex" ) ) == CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX then
		Engine.SetModelValue( Engine.GetModel( f818_arg3, "paintjobTextEntry" ), "Paintjob" )
	end
end

function SetSocialTab( f819_arg0, f819_arg1, f819_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" ), "tab" ), f819_arg1.tabId )
end

function FetchOnlineFriendsData( f820_arg0, f820_arg1, f820_arg2 )
	if "friends" == f820_arg1.tabId then
		Engine.UpdateFriends( f820_arg2, Enum.PresenceFilter.PRESENCE_FILTER_ONLINE_AND_IN_TITLE )
	end
end

function OpenPlatformProfile( f821_arg0, f821_arg1, f821_arg2, f821_arg3, f821_arg4 )
	local f821_local0 = Engine.GetModelForController( f821_arg2 )
	Engine.ShowPlatformProfile( f821_arg2, Engine.GetModelValue( Engine.CreateModel( f821_local0, "Social.selectedFriendXUID" ) ), Engine.GetModelValue( Engine.CreateModel( f821_local0, "Social.selectedFriendGamertag" ) ) )
end

function OpenPlatformFriendRequest( f822_arg0, f822_arg1, f822_arg2, f822_arg3, f822_arg4 )
	local f822_local0 = Engine.GetModelForController( f822_arg2 )
	Engine.ShowPlatformFriendRequest( f822_arg2, Engine.GetModelValue( Engine.CreateModel( f822_local0, "Social.selectedFriendXUID" ) ), Engine.GetModelValue( Engine.CreateModel( f822_local0, "Social.selectedFriendGamertag" ) ) )
end

function SocialJoin( f823_arg0, f823_arg1, f823_arg2, f823_arg3, f823_arg4 )
	if Engine.IsInGame() then
		if not Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, f823_arg3.xuid ) then
			f823_arg3.migrating = not CoD.QuitGame( f823_arg2 )
			Engine.LobbyVM_CallFunc( "InGameJoin", f823_arg3 )
		end
	else
		Engine.LobbyVM_CallFunc( "Join", f823_arg3 )
	end
	GoBackToMenu( GoBack( f823_arg0, f823_arg2 ), f823_arg2, "Lobby" )
end

function CacheSocialOnlinePlayersListModels( f824_arg0, f824_arg1, f824_arg2 )
	if Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "socialRoot" ), "tab" ) ) == "party" then
		return 
	end
	local f824_local0, f824_local1, f824_local2, f824_local3, f824_local4, f824_local5, f824_local6, f824_local7, f824_local8, f824_local9, f824_local10 = nil
	if f824_arg0.cacheRootModel ~= nil then
		f824_local1 = f824_arg0.cacheGametype
		f824_local0 = f824_arg0.cacheXuid
		f824_local2 = f824_arg0.cacheMapid
		f824_local4 = f824_arg0.cacheDifficulty
		f824_local3 = f824_arg0.cachePlaylist
		f824_local5 = f824_arg0.cacheParty
		f824_local6 = f824_arg0.cachePartyUpdate
		f824_local10 = f824_arg0.cachePartyGamertags
		f824_local7 = f824_arg0.cachePartyTotal
		f824_local8 = f824_arg0.cachePartyAvailable
		f824_local9 = f824_arg0.cachePartyLeader
	else
		local f824_local11 = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" )
		local f824_local12 = Engine.CreateModel( f824_local11, "cache" )
		f824_local0 = Engine.CreateModel( f824_local12, "xuid" )
		f824_local1 = Engine.CreateModel( f824_local12, "gametype" )
		f824_local2 = Engine.CreateModel( f824_local12, "mapid" )
		f824_local4 = Engine.CreateModel( f824_local12, "difficulty" )
		f824_local3 = Engine.CreateModel( f824_local12, "playlist" )
		f824_local5 = Engine.CreateModel( f824_local11, "party" )
		f824_local6 = Engine.CreateModel( f824_local5, "update" )
		f824_local7 = Engine.CreateModel( f824_local5, "total" )
		f824_local8 = Engine.CreateModel( f824_local5, "avalaible" )
		f824_local9 = Engine.CreateModel( f824_local5, "leader" )
		Engine.SetModelValue( f824_local0, Engine.StringToXUIDDecimal( "0" ) )
		f824_local10 = {}
		for f824_local13 = 1, 18, 1 do
			f824_local10[f824_local13] = Engine.CreateModel( Engine.CreateModel( f824_arg0.cacheParty, "pm_" .. f824_local13 ), "gamertag" )
			Engine.SetModelValue( f824_local10[f824_local13], "" )
		end
	end
	Engine.SetModelValue( f824_local0, f824_arg1.xuid )
	Engine.SetModelValue( f824_local1, f824_arg1.gametype )
	Engine.SetModelValue( f824_local2, f824_arg1.mapid )
	Engine.SetModelValue( f824_local3, f824_arg1.playlist )
	Engine.SetModelValue( f824_local4, f824_arg1.difficulty )
	Engine.SetModelValue( f824_local7, f824_arg1.party.total )
	Engine.SetModelValue( f824_local8, f824_arg1.party.available )
	Engine.SetModelValue( f824_local9, f824_arg1.party.leader )
	if f824_arg1.party ~= nil and f824_arg1.party.members ~= nil then
		for f824_local11 = 1, #f824_local10, 1 do
			local f824_local15 = f824_local10[f824_local11]
			if f824_arg1.party.members[f824_local11] ~= nil then
				Engine.SetModelValue( f824_local15, f824_arg1.party.members[f824_local11].gamertag )
			end
		end
		local f824_local11 = Engine.GetModelValue( f824_local6 )
		if f824_local11 < 100000 then
			f824_local11 = f824_local11 + 1
		else
			f824_local11 = 0
		end
		Engine.SetModelValue( f824_local6, f824_local11 )
	end
end

function RefreshSocialPlayerParty( f825_arg0, f825_arg1 )
	local f825_local0 = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot.party.update" )
	local f825_local1 = Engine.GetModelValue( cachePartyUpdate )
	if f825_local1 < 100000 then
		f825_local1 = f825_local1 + 1
	else
		f825_local1 = 0
	end
	Engine.SetModelValue( cachePartyUpdate, f825_local1 )
end

function ShowcaseOpenPlayerDetails( f826_arg0, f826_arg1, f826_arg2 )
	ShowcaseSetSelectedFriendXUID( f826_arg0, f826_arg1, f826_arg2 )
	GoBackAndOpenOverlayOnParent( f826_arg0, "Social_PlayerDetailsPopup", f826_arg2 )
end

function ShowcaseSetSelectedFriendXUID( f827_arg0, f827_arg1, f827_arg2 )
	local f827_local0 = CoD.FileshareUtility.GetSelectedItemProperty( "fileAuthorName" )
	local f827_local1 = CoD.FileshareUtility.GetSelectedItemProperty( "fileAuthorXuid" )
	local f827_local2 = Engine.GetPlayerInfo( f827_arg2, f827_local1 )
	local f827_local3 = Engine.GetModelForController( f827_arg2 )
	Engine.SetModelValue( Engine.CreateModel( f827_local3, "Social.selectedFriendXUID" ), f827_local1 )
	Engine.SetModelValue( Engine.CreateModel( f827_local3, "Social.selectedFriendGamertag" ), f827_local0 )
end

function SetSelectedFriendXUID( f828_arg0, f828_arg1, f828_arg2 )
	local f828_local0 = nil
	if f828_arg1 ~= nil then
		local f828_local1 = f828_arg1:getModel( f828_arg2, "xuid" )
		if f828_local1 ~= nil then
			f828_local0 = Engine.GetModelValue( f828_local1 )
			local f828_local2 = Engine.GetModelForController( f828_arg2 )
			Engine.SetModelValue( Engine.CreateModel( f828_local2, "Social.selectedFriendXUID" ), f828_local0 )
			Engine.SetModelValue( Engine.CreateModel( f828_local2, "Social.selectedFriendGamertag" ), Engine.GetModelValue( f828_arg1:getModel( f828_arg2, "gamertag" ) ) )
			local f828_local3 = f828_arg1:getModel( f828_arg2, "activity" )
			if f828_local3 ~= nil then
				Engine.SetModelValue( Engine.CreateModel( f828_local2, "Social.selectedFriendInTitle" ), Engine.GetModelValue( f828_local3 ) > Enum.PresenceActivity.PRESENCE_ACTIVITY_ONLINE_NOT_IN_TITLE )
			end
		end
	end
end

function OpenSocialPlayerPopup( f829_arg0, f829_arg1, f829_arg2 )
	local f829_local0 = OpenPopup( f829_arg0, "Social_PlayerDetailsPopup", f829_arg2 )
	f829_local0.playerInfo:setModel( f829_arg1:getModel() )
end

function SocialToggleSorting( f830_arg0, f830_arg1, f830_arg2 )
	local f830_local0 = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" ), "sort" )
	local f830_local1 = Engine.GetModelValue( f830_local0 )
	if f830_local1 == Enum.PresenceSorting.PRESENCE_SORTING_ONLINE_MOST_RECENT then
		Engine.SetModelValue( f830_local0, Enum.PresenceSorting.PRESENCE_SORTING_ALPHABETICAL )
		Engine.SortFriends( f830_arg2, Enum.PresenceSorting.PRESENCE_SORTING_ALPHABETICAL )
	elseif f830_local1 == Enum.PresenceSorting.PRESENCE_SORTING_ALPHABETICAL then
		Engine.SetModelValue( f830_local0, Enum.PresenceSorting.PRESENCE_SORTING_ONLINE_MOST_RECENT )
		Engine.SortFriends( f830_arg2, Enum.PresenceSorting.PRESENCE_SORTING_ONLINE_MOST_RECENT )
	end
end

function SocialEnablePresenceCacheAutoupdate( f831_arg0, f831_arg1 )
	if Engine.EnablePresenceCacheAutoupdate ~= nil then
		Engine.EnablePresenceCacheAutoupdate( f831_arg0, f831_arg1 )
	end
end

function UpdateFriends( f832_arg0, f832_arg1, f832_arg2 )
	local f832_local0 = f832_arg0
	Engine.UpdateFriends( f832_arg2, 2 )
end

function SetFriendsTabName( f833_arg0, f833_arg1, f833_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f833_arg2 ), "friends" ), "tab" ), f833_arg1.tabId )
end

function UpdateFriendsData( f834_arg0, f834_arg1, f834_arg2 )
	if "friends" == f834_arg1.tabId then
		Engine.UpdateFriends( f834_arg2, 2 )
	elseif f834_arg1.tabId == "inbox" then
		Engine.UpdateMessages( f834_arg2, 1 )
	end
end

function FriendsInboxOnMessageClick( f835_arg0, f835_arg1, f835_arg2 )
	if Engine.GetModelValue( f835_arg1:getModel( f835_arg2, "xuid" ) ) ~= nil then
		Engine.ReadMessages( f835_arg2, 0 )
	end
end

function GetProcessingGroupTaskModel( f836_arg0 )
	return Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f836_arg0 ), "groups" ), "processingTask" )
end

function GroupNotifyPopupButtonAction( f837_arg0, f837_arg1, f837_arg2 )
	local f837_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f837_arg2 ), "groups" ), "notificationError" ) )
	if IsProcessingGroupTask( f837_arg2 ) then
		return 
	elseif not f837_local0 then
		if f837_arg0.onSuccessAction then
			f837_arg0:onSuccessAction( f837_arg1, f837_arg2 )
		end
		local f837_local1 = f837_arg0.occludedMenu
		if f837_local1 and f837_local1.menuName ~= "Groups" then
			GoBack( f837_local1, f837_arg2 )
		end
	end
	GoBack( f837_arg0, f837_arg2 )
end

local f0_local41 = function ( f838_arg0, f838_arg1, f838_arg2, f838_arg3 )
	local f838_local0 = Engine.GetModelForController( f838_arg0 )
	Engine.SetModelValue( Engine.GetModel( f838_local0, "groups.notificationTitle" ), f838_arg1 )
	Engine.SetModelValue( Engine.GetModel( f838_local0, "groups.notificationMessage" ), f838_arg2 )
	Engine.SetModelValue( Engine.GetModel( f838_local0, "groups.notificationError" ), f838_arg3 )
end

function OpenGroupsNotifyPopup( f839_arg0, f839_arg1, f839_arg2, f839_arg3, f839_arg4, f839_arg5 )
	local f839_local0 = OpenGenericSmallPopup( f839_arg0, f839_arg2, "$(groups.notificationTitle)", "$(groups.notificationMessage)", "MENU_OK", function ( f840_arg0, f840_arg1, f840_arg2, f840_arg3, f840_arg4 )
		GroupNotifyPopupButtonAction( f840_arg0, f840_arg1, f840_arg2 )
	end, function ( f841_arg0, f841_arg1, f841_arg2, f841_arg3 )
		GroupNotifyPopupButtonAction( f841_arg0, nil, f841_arg2 )
	end )
	f839_local0.onSuccessAction = f839_arg5
	if f839_arg3 then
		f839_local0:setState( "Processing" )
		f839_local0:registerEventHandler( f839_arg4, function ( element, event )
			f839_local0:setState( "DefaultState" )
			Engine.SetModelValue( GetProcessingGroupTaskModel( f839_arg2 ), false )
		end )
	else
		f839_local0:setState( "DefaultState" )
	end
end

function ProcessLeaveSelectedGroup( f843_arg0, f843_arg1, f843_arg2 )
	f843_arg1.gridInfoTable.parentGrid.menu:OpenModalDialog( f843_arg0, f843_arg2, "GROUPS_LEAVE_GROUP_CAPS", "GROUPS_LEAVE_SELECTED_GROUP_TITLE", {
		"MPUI_NO",
		"MPUI_YES"
	}, function ( f844_arg0 )
		if f844_arg0 == 1 then
			Engine.LeaveGroup( f843_arg2, Engine.GetModelValue( Engine.GetModel( CoD.perController[f843_arg2].selectedGroup, "groupId" ) ) )
			OpenGroupsNotifyPopup( f843_arg0, f843_arg1, f843_arg2, true, "leave_group_task_complete", function ( f845_arg0, f845_arg1, f845_arg2 )
				ClearSelectedGroup( f845_arg0, f845_arg1, f845_arg2 )
			end )
		end
		return true
	end )
end

function ProcessJoinSelectedGroup( f846_arg0, f846_arg1, f846_arg2 )
	local f846_local0 = f846_arg0:getParentMenu()
	f846_local0:OpenModalDialog( f846_arg0, f846_arg2, "GROUPS_JOIN_SELECTED_GROUP_TITLE", "", {
		"MPUI_YES",
		"MPUI_NO"
	}, function ( f847_arg0 )
		if f847_arg0 == 0 then
			Engine.JoinGroup( f846_arg2, Engine.GetModelValue( f846_arg1:getModel( f846_arg2, "groupBufferType" ) ), Engine.GetModelValue( f846_arg1:getModel( f846_arg2, "groupId" ) ) )
			OpenGroupsNotifyPopup( f846_arg0, f846_arg1, f846_arg2, true, "join_group_task_complete" )
			return true
		else
			
		end
	end )
end

function HandleGroupHeadquartersKeyboardComplete( f848_arg0, f848_arg1, f848_arg2, f848_arg3 )
	local f848_local0 = CoD.perController[f848_arg2].selectedGroup
	local f848_local1 = nil
	if not f848_local0 then
		return 
	elseif f848_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_GROUP_NAME then
		f848_local1 = Engine.GetModel( f848_local0, "name" )
	elseif f848_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_GROUP_MESSAGE then
		f848_local1 = Engine.GetModel( f848_local0, "message" )
	elseif f848_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_GROUP_DESCRIPTION then
		f848_local1 = Engine.GetModel( f848_local0, "description" )
	elseif f848_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_GROUP_CLAN_TAG then
		f848_local1 = Engine.GetModel( f848_local0, "clanTag" )
	end
	if f848_local1 then
		Engine.SetModelValue( f848_local1, f848_arg3.input )
	end
end

function EditSelectedGroupName( f849_arg0, f849_arg1, f849_arg2 )
	ShowKeyboard( f849_arg0, f849_arg1, f849_arg2, "KEYBOARD_TYPE_GROUP_NAME" )
end

function EditSelectedGroupMessage( f850_arg0, f850_arg1, f850_arg2 )
	ShowKeyboard( f850_arg0, f850_arg1, f850_arg2, "KEYBOARD_TYPE_GROUP_MESSAGE" )
end

function EditSelectedGroupDescription( f851_arg0, f851_arg1, f851_arg2 )
	ShowKeyboard( f851_arg0, f851_arg1, f851_arg2, "KEYBOARD_TYPE_GROUP_DESCRIPTION" )
end

function EditSelectedGroupClanTag( f852_arg0, f852_arg1, f852_arg2 )
	ShowKeyboard( f852_arg0, f852_arg1, f852_arg2, "KEYBOARD_TYPE_GROUP_CLAN_TAG" )
end

function EditSelectedGroupEmblem( f853_arg0, f853_arg1, f853_arg2 )
	local f853_local0 = f853_arg0:getParentMenu()
	f853_local0:OpenModalDialog( f853_arg0, f853_arg2, "GROUPS_SET_GROUP_EMBLEM_TITLE", "GROUPS_SET_GROUP_EMBLEM_DESC", {
		"MPUI_NO",
		"MPUI_YES"
	}, function ( f854_arg0 )
		if f854_arg0 == 1 then
			Engine.SetGroupEmblem( f853_arg2 )
			return true
		else
			
		end
	end )
end

function OpenGroupHeadquarters( f855_arg0, f855_arg1, f855_arg2 )
	if IsNotAGroupMember( f855_arg1, f855_arg2 ) then
		ProcessJoinSelectedGroup( f855_arg0, f855_arg1, f855_arg2 )
	else
		CoD.perController[f855_arg2].selectedGroup = f855_arg1.model
		Engine.SetSelectedGroup( f855_arg2, Engine.GetModelValue( Engine.GetModel( f855_arg1.model, "groupBufferType" ) ), Engine.GetModelValue( Engine.GetModel( f855_arg1.model, "groupId" ) ) )
		NavigateToMenu( f855_arg0:getParentMenu(), "GroupHeadquarters", true, f855_arg2 )
		local f855_local0, f855_local1, f855_local2, f855_local3, f855_local4 = Engine.GetGroupLeaderboardInfo()
		if f855_local0 ~= nil and f855_local0 > 0 then
			Engine.LoadLeaderboard( CoD.Leaderboard_MP.GetLeaderboardDefName( f855_local0, f855_local1, f855_local3 ), f855_local2 )
			Engine.RequestLeaderboardData( f855_arg2, Enum.LbFilter.LB_FILTER_GROUP_MEMBERS )
		else
			local f855_local5 = CoD.Leaderboard_MP.GetLeaderboardIndex( "CAREER" )
			Engine.LoadLeaderboard( CoD.Leaderboard_MP.GetLeaderboardDefName( f855_local5, CoD.Leaderboard_MP.GetSortColumnIndex( f855_local5, "SCORE" ), false ), Enum.LbTrackType.LB_TRK_ALLTIME )
			Engine.RequestLeaderboardData( f855_arg2, Enum.LbFilter.LB_FILTER_GROUP_MEMBERS )
		end
	end
end

function ClearSelectedGroup( f856_arg0, f856_arg1, f856_arg2 )
	CoD.perController[f856_arg2].selectedGroup = nil
	Engine.ClearSelectedGroup()
end

function SetGroupHeadquarterTabName( f857_arg0, f857_arg1, f857_arg2 )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f857_arg2 ), "groups" ), "grouphqtabname" ), f857_arg1.tabId )
end

function SearchGroups( f858_arg0, f858_arg1, f858_arg2 )
	Engine.FindGroups( f858_arg2, Enum.GroupBufferType.GROUP_BUFFER_TYPE_SEARCH )
end

function InitializeGroups( f859_arg0, f859_arg1, f859_arg2 )
	local f859_local0 = Engine.CreateModel( Engine.GetModelForController( f859_arg2 ), "groups" )
	Engine.CreateModel( f859_local0, "processingTask" )
	Engine.CreateModel( f859_local0, "grouphqtabname" )
	Engine.CreateModel( f859_local0, "createGroup" )
	local f859_local1 = Engine.CreateModel( f859_local0, "leaderboardmaker" )
	Engine.CreateModel( f859_local1, "startingState" )
	Engine.CreateModel( f859_local1, "state" )
	Engine.CreateModel( f859_local1, "lbIndex" )
	Engine.CreateModel( f859_local1, "lbSortColumn" )
	Engine.CreateModel( f859_local1, "lbTimeFrame" )
	Engine.CreateModel( f859_local0, "notificationTitle" )
	Engine.CreateModel( f859_local0, "notificationMessage" )
	Engine.CreateModel( f859_local0, "notificationError" )
end

function OpenCreateGroupMenu( f860_arg0, f860_arg1, f860_arg2 )
	NavigateToMenu( f860_arg0:getParentMenu(), "CreateGroup", true, f860_arg2 )
end

function BlockPublishedContent( f861_arg0, f861_arg1, f861_arg2 )
	f861_arg1.gridInfoTable.parentGrid.menu:OpenModalDialog( f861_arg0, f861_arg2, "GROUPS_BLOCK_PUBLISHED_CONTENT_CAPS", "GROUPS_BLOCK_PUBLISHED_CONTENT_MESSAGE", {
		"GROUPS_BLOCK_PUBLISHED_CONTENT_CANCEL_CAPS",
		"GROUPS_BLOCK_PUBLISHED_CONTENT_OK_CAPS"
	}, function ( f862_arg0 )
		if f862_arg0 == 1 then
			local f862_local0 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f861_arg2].selectedGroup, "groupId" ) )
			local f862_local1 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f861_arg2 ), "Social.selectedFriendXUID" ) )
		end
		return true
	end )
end

function RemoveFromGroup( f863_arg0, f863_arg1, f863_arg2 )
	f863_arg1.gridInfoTable.parentGrid.menu:OpenModalDialog( f863_arg0, f863_arg2, "GROUPS_REMOVE_FROM_GROUP_CAPS", "GROUPS_REMOVE_FROM_GROUP_MESSAGE", {
		"GROUPS_REMOVE_FROM_GROUP_CANCEL_CAPS",
		"GROUPS_REMOVE_FROM_GROUP_OK_CAPS"
	}, function ( f864_arg0 )
		if f864_arg0 == 1 then
			local f864_local0 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f863_arg2].selectedGroup, "groupId" ) )
			local f864_local1 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f863_arg2 ), "Social.selectedFriendXUID" ) )
		end
		return true
	end )
end

function BanFromGroup( f865_arg0, f865_arg1, f865_arg2 )
	f865_arg1.gridInfoTable.parentGrid.menu:OpenModalDialog( f865_arg0, f865_arg2, "GROUPS_BAN_FROM_GROUP_CAPS", "GROUPS_BAN_FROM_GROUP_MESSAGE", {
		"GROUPS_BAN_FROM_GROUP_CANCEL_CAPS",
		"GROUPS_BAN_FROM_GROUP_OK_CAPS"
	}, function ( f866_arg0 )
		if f866_arg0 == 1 then
			local f866_local0 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f865_arg2].selectedGroup, "groupId" ) )
			local f866_local1 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f865_arg2 ), "Social.selectedFriendXUID" ) )
		end
		return true
	end )
end

function OpenGroupSelector( f867_arg0, f867_arg1, f867_arg2 )
	OpenPopup( f867_arg0, "GroupSelectPopup", f867_arg2 )
end

function InviteToGroup( f868_arg0, f868_arg1, f868_arg2 )
	local f868_local0 = f868_arg1.groupId
	local f868_local1 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f868_arg2 ), "Social.selectedFriendXUID" ) )
	return true
end

function InitializeCreateGroup( f869_arg0, f869_arg1, f869_arg2 )
	local f869_local0 = Engine.GetModel( Engine.GetModelForController( f869_arg2 ), "groups.createGroup" )
	Engine.SetModelValue( Engine.CreateModel( f869_local0, "name" ), "" )
	Engine.SetModelValue( Engine.CreateModel( f869_local0, "default_name" ), Engine.LocalizeWithoutLocsMarkers( "GROUPS_DEFAULT_NAME" ) )
	Engine.SetModelValue( Engine.CreateModel( f869_local0, "privacy" ), Enum.GroupPrivacy.GROUP_PRIVACY_PUBLIC )
	Engine.SetModelValue( Engine.CreateModel( f869_local0, "description" ), "" )
	Engine.SetModelValue( Engine.CreateModel( f869_local0, "default_description" ), Engine.LocalizeWithoutLocsMarkers( "GROUPS_DEFAULT_DESCRIPTION" ) )
	Engine.SetModelValue( Engine.CreateModel( f869_local0, "emblem" ), "uie_t7_medal_baked" )
	Engine.SetModelValue( Engine.CreateModel( f869_local0, "tooltip_title" ), "" )
	Engine.SetModelValue( Engine.CreateModel( f869_local0, "tooltip_description" ), "" )
	Engine.SetModelValue( Engine.CreateModel( f869_local0, "friends_invited_count" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( f869_local0, "friends_count" ), 0 )
	Engine.ExecNow( f869_arg2, "emblemgetprofile" )
end

function CreateNewGroupFlow( f870_arg0, f870_arg1, f870_arg2 )
	InitializeCreateGroup( f870_arg0, f870_arg1, f870_arg2 )
	OpenCreateGroupMenu( f870_arg0, f870_arg1, f870_arg2 )
end

local f0_local42 = function ( f871_arg0, f871_arg1, f871_arg2 )
	local f871_local0 = Engine.GetModelForController( f871_arg2 )
	local f871_local1 = Engine.GetModelValue( Engine.GetModel( f871_local0, "groups.createGroup.name" ) )
	local f871_local2 = Engine.GetModelValue( Engine.GetModel( f871_local0, "groups.createGroup.description" ) )
	if f871_local1 == "" then
		OpenGenericSmallPopup( f871_arg0, f871_arg2, "GROUPS_MISSING_GROUP_NAME_TITLE", "GROUPS_MISSING_GROUP_NAME_TEXT", nil, "MENU_OK" )
		return false
	else
		return true
	end
end

function CancelCreateGroup( f872_arg0, f872_arg1, f872_arg2 )
	GoBack( f872_arg0, f872_arg1 )
end

function ProcessCreateGroup( f873_arg0, f873_arg1, f873_arg2 )
	if f0_local42( f873_arg0, f873_arg1, f873_arg2 ) then
		NavigateToMenu( f873_arg0, "GroupInviteFriends", true, f873_arg2 )
	end
end

function CreateGroup( f874_arg0, f874_arg1, f874_arg2 )
	if f0_local42( f874_arg0, f874_arg1, f874_arg2 ) then
		local f874_local0 = Engine.GetModelForController( f874_arg2 )
		Engine.CreateGroup( f874_arg2, Engine.GetModelValue( Engine.GetModel( f874_local0, "groups.createGroup.name" ) ), Engine.GetModelValue( Engine.GetModel( f874_local0, "groups.createGroup.description" ) ), Engine.GetModelValue( Engine.GetModel( f874_local0, "groups.createGroup.privacy" ) ), Engine.GetModelValue( Engine.GetModel( f874_local0, "groups.createGroup.emblem" ) ) )
	end
end

function SetGroupLeaderboardInfo( f875_arg0, f875_arg1, f875_arg2, f875_arg3, f875_arg4 )
	local f875_local0 = CoD.perController[f875_arg0].selectedGroup
	if not f875_local0 then
		return 
	else
		Engine.SetGroupLeaderboardInfo( f875_arg0, f875_arg1, f875_arg2, f875_arg3, f875_arg4 )
		Engine.SetModelValue( Engine.GetModel( f875_local0, "lbIndex" ), f875_arg1 )
		Engine.SetModelValue( Engine.GetModel( f875_local0, "lbSortColumn" ), f875_arg2 )
		Engine.SetModelValue( Engine.GetModel( f875_local0, "lbTimeFrame" ), f875_arg3 )
		Engine.SetModelValue( Engine.GetModel( f875_local0, "lbHardcore" ), f875_arg4 )
		Engine.SetModelValue( Engine.GetModel( f875_local0, "lbInitialized" ), true )
	end
end

function SetDefaultCareerLeaderboard( f876_arg0, f876_arg1, f876_arg2 )
	local f876_local0 = CoD.Leaderboard_MP.GetLeaderboardIndex( "CAREER" )
	SetGroupLeaderboardInfo( f876_arg2, f876_local0, CoD.Leaderboard_MP.GetSortColumnIndex( f876_local0, "SPM" ), Enum.LbTrackType.LB_TRK_ALLTIME, false )
	DataSources.LeaderboardHeader.getModel( f876_arg2 )
	if f876_arg0.UpdateNavigation then
		f876_arg0:UpdateNavigation( f876_arg2 )
	end
end

function OpenLeaderboardMaker( f877_arg0, f877_arg1, f877_arg2, f877_arg3 )
	if f877_arg3 == nil then
		error( "OpenLeaderboardMaker(): Invalid starting state specified" )
		return 
	else
		local f877_local0 = Engine.GetModelForController( f877_arg2 )
		Engine.SetModelValue( Engine.GetModel( f877_local0, "groups.leaderboardmaker.startingState" ), f877_arg3 )
		Engine.SetModelValue( Engine.GetModel( f877_local0, "groups.leaderboardmaker.state" ), f877_arg3 )
		local f877_local1 = f877_arg0:getParentMenu()
		f877_local1:openPopup( "LeaderboardMaker", f877_arg2 )
	end
end

function ProcessRemoveGroupLeaderboard( f878_arg0, f878_arg1, f878_arg2 )
	f878_arg0:OpenModalDialog( f878_arg1, "GROUPS_REMOVE_LEADERBOARD_CONFIRMATION_TITLE", "GROUPS_REMOVE_LEADERBOARD_CONFIRMATION_SUBTITLE", {
		"MPUI_NO",
		"MPUI_YES"
	}, function ( f879_arg0 )
		if f879_arg0 == 1 then
			SetGroupLeaderboardInfo( f878_arg2, 0, 0, 0, false )
			GoBack( f878_arg0, f878_arg2 )
			return true
		else
			
		end
	end )
end

function ProcessLeaderboardMakerBack( f880_arg0, f880_arg1, f880_arg2 )
	local f880_local0 = Engine.GetModelForController( f880_arg2 )
	local f880_local1 = Engine.GetModelValue( Engine.GetModel( f880_local0, "groups.leaderboardmaker.startingState" ) )
	local f880_local2 = Engine.GetModel( f880_local0, "groups.leaderboardmaker.state" )
	local f880_local3 = Engine.GetModelValue( f880_local2 )
	if f880_local3 == f880_local1 or f880_local3 == "SelectAction" then
		Engine.SetModelValue( f880_local2, "" )
		GoBack( f880_arg0, f880_arg2 )
	elseif f880_local3 == "ChooseBaseLeaderboard" then
		Engine.SetModelValue( f880_local2, "SelectAction" )
	elseif f880_local3 == "ChooseDefaultSort" then
		Engine.SetModelValue( f880_local2, "ChooseBaseLeaderboard" )
	elseif f880_local3 == "ChooseTimeFrame" then
		Engine.SetModelValue( f880_local2, "ChooseDefaultSort" )
	end
end

function ProcessEditGroupLeaderboard( f881_arg0, f881_arg1, f881_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f881_arg2 ), "groups.leaderboardmaker.state" ), "ChooseBaseLeaderboard" )
end

function ProcessChooseBaseLeaderboard( f882_arg0, f882_arg1, f882_arg2 )
	local f882_local0 = Engine.GetModelForController( f882_arg2 )
	Engine.SetModelValue( Engine.GetModel( f882_local0, "groups.leaderboardmaker.lbIndex" ), CoD.Leaderboard_MP.GetLeaderboardIndex( f882_arg1.btnId ) )
	Engine.SetModelValue( Engine.GetModel( f882_local0, "groups.leaderboardmaker.state" ), "ChooseDefaultSort" )
end

function ProcessChooseDefaultSort( f883_arg0, f883_arg1, f883_arg2 )
	local f883_local0 = Engine.GetModelForController( f883_arg2 )
	Engine.SetModelValue( Engine.GetModel( f883_local0, "groups.leaderboardmaker.lbSortColumn" ), CoD.Leaderboard_MP.GetSortColumnIndex( Engine.GetModelValue( Engine.GetModel( f883_local0, "groups.leaderboardmaker.lbIndex" ) ), f883_arg1.btnId ) )
	Engine.SetModelValue( Engine.GetModel( f883_local0, "groups.leaderboardmaker.state" ), "ChooseTimeFrame" )
end

function ProcessChooseTimeFrame( f884_arg0, f884_arg1, f884_arg2 )
	local f884_local0 = Engine.GetModelForController( f884_arg2 )
	local f884_local1 = Engine.GetModelValue( Engine.GetModel( f884_local0, "groups.leaderboardmaker.lbIndex" ) )
	local f884_local2 = Engine.GetModelValue( Engine.GetModel( f884_local0, "groups.leaderboardmaker.lbSortColumn" ) )
	local f884_local3 = false
	local f884_local4 = CoD.Leaderboard_MP.GetTimeFrameDataFromName( f884_arg1.btnId )
	local f884_local5 = f884_local4.value
	Engine.SetModelValue( Engine.GetModel( f884_local0, "groups.leaderboardmaker.lbTimeFrame" ), f884_local5 )
	SetGroupLeaderboardInfo( f884_arg2, f884_local1, f884_local2, f884_local5, f884_local3 )
	Engine.LoadLeaderboard( CoD.Leaderboard_MP.GetLeaderboardDefName( f884_local1, f884_local2, f884_local3 ), f884_local5 )
	Engine.RequestLeaderboardData( f884_arg2, Enum.LbFilter.LB_FILTER_GROUP_MEMBERS )
	f0_local41( f884_arg2, Engine.Localize( "GROUPS_CONGRATULATIONS_CAPS_TITLE" ), Engine.Localize( "GROUPS_LBMAKER_UPDATE_SUCCESS" ), false )
	OpenGroupsNotifyPopup( f884_arg0, f884_arg1, f884_arg2, false )
	Engine.SetModelValue( Engine.GetModel( f884_local0, "groups.leaderboardmaker.state" ), "" )
end

function JoinSessionInProgressOnGroupMember( f885_arg0, f885_arg1, f885_arg2 )
	local f885_local0 = GoBack( f885_arg0, f885_arg2 )
	GoBack( f885_local0, f885_arg2 )
	LobbyQuickJoin( f885_local0, f885_arg1, f885_arg2, Enum.JoinType.JOIN_TYPE_FRIEND, false )
end

function LoadLeaderboard( f886_arg0, f886_arg1 )
	local f886_local0 = IsZMMapsLeaderboard( f886_arg1 )
	local f886_local1 = CoD.perController[f886_arg1].leaderboardPlayerFilter
	if not f886_local1 then
		f886_local1 = Enum.LbFilter.LB_FILTER_FRIENDS
	end
	local f886_local2 = CoD.perController[f886_arg1].leaderboardZMMapsNumPlayersFilter
	if not f886_local2 then
		f886_local2 = CoD.LeaderboardUtility.DEFAULT_ZM_MAPS_NUM_PLAYERS
	end
	CoD.perController[f886_arg1].pivotPosition = nil
	local f886_local3 = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "leaderboardDef" ) )
	local f886_local4 = CoD.LeaderboardUtility.leaderboardInfo[f886_local3]
	local f886_local5 = CoD.perController[f886_arg1].leaderboardDurationFilter
	if f886_local0 then
		f886_local3 = f886_local3 .. "_" .. tostring( f886_local2 ) .. "PLAYER"
	end
	local f886_local6 = false
	for f886_local10, f886_local11 in ipairs( f886_local4.trackTypes ) do
		if f886_local5 == f886_local11 then
			f886_local6 = true
			break
		end
	end
	if f886_local6 == false then
		f886_local5 = f886_local4.trackTypes[1]
	end
	if Engine.LoadLeaderboard( f886_local3, f886_local5 ) == true then
		Engine.RequestLeaderboardData( f886_arg1, f886_local1 )
	end
	f886_local8 = CoD.LeaderboardUtility.GetPlayerFilterString( f886_local1 )
	f886_local9 = CoD.LeaderboardUtility.GetDurationFilterString( f886_local5 )
	f886_local10 = ""
	if f886_local0 then
		f886_local10 = Engine.Localize( "MPUI_X_SLASH_Y", CoD.LeaderboardUtility.GetZMMapsNumPlayersFilterString( f886_local2 ), f886_local8 )
	elseif #f886_local4.trackTypes > 1 then
		f886_local10 = Engine.Localize( "MPUI_X_SLASH_Y", f886_local8, f886_local9 )
	else
		f886_local10 = Engine.Localize( f886_local8 )
	end
	SetGlobalModelValue( "FilterInfo", f886_local10 )
end

function Leaderboard_SetLeaderboardDef( f887_arg0, f887_arg1, f887_arg2 )
	SetGlobalModelValue( "leaderboardDef", Engine.GetModelValue( Engine.GetModel( f887_arg1:getModel(), "lbDef" ) ) )
end

local f0_local43 = function ( f888_arg0, f888_arg1, f888_arg2 )
	SelectAboveItemIfPossible( f888_arg0, f888_arg1, f888_arg2 )
end

local f0_local44 = function ( f889_arg0, f889_arg1, f889_arg2 )
	if SelectAboveItemIfPossible( f889_arg0, f889_arg1, f889_arg2 ) then
		return 
	elseif not f889_arg1:getModel() then
		return 
	end
	local f889_local0 = tonumber( Engine.GetModelValue( Engine.GetModel( f889_arg1:getModel(), "position" ) ) )
	if f889_local0 > 1 then
		CoD.perController[f889_arg2].pivotPosition = f889_local0 - 1
		CoD.perController[f889_arg2].leaderboardTopOrBottom = CoD.LeaderboardUtility.BOTTOM
		Engine.GetLeaderboardRow( f889_arg2, f889_local0 - 1, CoD.GetCombatRecordMode() )
	end
end

function Leaderboard_MoveUp( f890_arg0, f890_arg1, f890_arg2 )
	if CoD.perController[f890_arg2].leaderboardPlayerFilter == Enum.LbFilter.LB_FILTER_NONE then
		f0_local44( f890_arg0, f890_arg1, f890_arg2 )
	else
		f0_local43( f890_arg0, f890_arg1, f890_arg2 )
	end
end

local f0_local45 = function ( f891_arg0, f891_arg1, f891_arg2 )
	SelectBelowItemIfPossible( f891_arg0, f891_arg1, f891_arg2 )
end

local f0_local46 = function ( f892_arg0, f892_arg1, f892_arg2 )
	if SelectBelowItemIfPossible( f892_arg0, f892_arg1, f892_arg2 ) then
		return 
	elseif not f892_arg1:getModel() then
		return 
	end
	local f892_local0 = Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "leaderboard" ), "totalResults" ) )
	local f892_local1 = tonumber( Engine.GetModelValue( Engine.GetModel( f892_arg1:getModel(), "position" ) ) )
	if f892_local1 < f892_local0 then
		CoD.perController[f892_arg2].pivotPosition = f892_local1 + 1
		CoD.perController[f892_arg2].leaderboardTopOrBottom = CoD.LeaderboardUtility.TOP
		Engine.GetLeaderboardRow( f892_arg2, f892_local1 + 1, CoD.GetCombatRecordMode() )
	end
end

function Leaderboard_MoveDown( f893_arg0, f893_arg1, f893_arg2 )
	if CoD.perController[f893_arg2].leaderboardPlayerFilter == Enum.LbFilter.LB_FILTER_NONE then
		f0_local46( f893_arg0, f893_arg1, f893_arg2 )
	else
		f0_local45( f893_arg0, f893_arg1, f893_arg2 )
	end
end

local f0_local47 = function ( f894_arg0, f894_arg1, f894_arg2 )
	local f894_local0 = f0_local5( f894_arg0, f894_arg1 )
	local f894_local1 = nil
	if f894_local0.activeWidget ~= nil then
		local f894_local2 = f894_local0.vCount
		local f894_local3 = f894_local0.activeWidget.gridInfoTable.gridRowIndex
		if f894_local3 == 1 then
			return 
		end
		f894_local1 = f894_local0:getItemAtPosition( math.max( f894_local3 - f894_local2, 1 ), 1, true )
	end
	if f894_local1 then
		f894_local0:setActiveItem( f894_local1 )
	end
end

local f0_local48 = function ( f895_arg0, f895_arg1, f895_arg2 )
	local f895_local0 = f0_local5( f895_arg0, f895_arg1 )
	local f895_local1 = nil
	if not f895_local0.activeWidget then
		return 
	else
		local f895_local2 = f895_local0.vCount
		local f895_local3 = f895_local0.activeWidget.gridInfoTable.gridRowIndex - f895_local2
		if f895_local3 > 0 then
			f895_local0:setActiveItem( f895_local0:getItemAtPosition( f895_local3, 1, true ) )
			return 
		elseif not f895_arg1:getModel() then
			return 
		else
			local f895_local4 = tonumber( Engine.GetModelValue( Engine.GetModel( f895_arg1:getModel(), "position" ) ) )
			local f895_local5 = f895_local4 - f895_local2
			if f895_local4 == 1 then
				return 
			elseif f895_local5 < 1 then
				f895_local0:setActiveItem( f895_local0:getItemAtPosition( 1, 1, true ) )
				return 
			else
				CoD.perController[f895_arg2].pivotPosition = f895_local5
				CoD.perController[f895_arg2].leaderboardTopOrBottom = CoD.LeaderboardUtility.TOP
				Engine.GetLeaderboardRow( f895_arg2, f895_local5, CoD.GetCombatRecordMode() )
			end
		end
	end
end

function Leaderboard_PageUp( f896_arg0, f896_arg1, f896_arg2 )
	if CoD.perController[f896_arg2].leaderboardPlayerFilter == Enum.LbFilter.LB_FILTER_NONE then
		f0_local48( f896_arg0, f896_arg1, f896_arg2 )
	else
		f0_local47( f896_arg0, f896_arg1, f896_arg2 )
	end
end

local f0_local49 = function ( f897_arg0, f897_arg1, f897_arg2 )
	local f897_local0 = f0_local5( f897_arg0, f897_arg1 )
	local f897_local1 = nil
	if f897_local0.activeWidget ~= nil then
		local f897_local2 = f897_local0.vCount
		local f897_local3 = f897_local0.activeWidget.gridInfoTable.gridRowIndex
		if f897_local3 == f897_local0.requestedRowCount then
			return 
		end
		f897_local1 = f897_local0:getItemAtPosition( math.min( f897_local3 + f897_local2, f897_local0.requestedRowCount ), 1, true )
	end
	if f897_local1 then
		f897_local0:setActiveItem( f897_local1 )
	end
end

local f0_local50 = function ( f898_arg0, f898_arg1, f898_arg2 )
	local f898_local0 = f0_local5( f898_arg0, f898_arg1 )
	local f898_local1 = nil
	if not f898_local0.activeWidget then
		return 
	else
		local f898_local2 = f898_local0.vCount
		local f898_local3 = f898_local0.activeWidget.gridInfoTable.gridRowIndex + f898_local2
		if f898_local3 <= f898_local0.requestedRowCount then
			f898_local0:setActiveItem( f898_local0:getItemAtPosition( f898_local3, 1, true ) )
			return 
		elseif not f898_arg1:getModel() then
			return 
		else
			local f898_local4 = Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "leaderboard" ), "totalResults" ) )
			local f898_local5 = tonumber( Engine.GetModelValue( Engine.GetModel( f898_arg1:getModel(), "position" ) ) )
			local f898_local6 = f898_local5 + f898_local2
			if f898_local5 == f898_local4 then
				return 
			elseif f898_local4 < f898_local6 then
				f898_local0:setActiveItem( f898_local0:getItemAtPosition( f898_local0.requestedRowCount, 1, true ) )
				return 
			else
				CoD.perController[f898_arg2].pivotPosition = f898_local6
				CoD.perController[f898_arg2].leaderboardTopOrBottom = CoD.LeaderboardUtility.BOTTOM
				Engine.GetLeaderboardRow( f898_arg2, f898_local6, CoD.GetCombatRecordMode() )
			end
		end
	end
end

function Leaderboard_PageDown( f899_arg0, f899_arg1, f899_arg2 )
	if CoD.perController[f899_arg2].leaderboardPlayerFilter == Enum.LbFilter.LB_FILTER_NONE then
		f0_local50( f899_arg0, f899_arg1, f899_arg2 )
	else
		f0_local49( f899_arg0, f899_arg1, f899_arg2 )
	end
end

local f0_local51 = function ( f900_arg0, f900_arg1, f900_arg2 )
	local f900_local0 = f0_local5( f900_arg0, f900_arg1 )
	local f900_local1 = f900_local0:getItemAtPosition( 1, 1, true )
	if f900_local1 == f900_arg1 then
		return 
	elseif f900_local1 then
		f900_local0:setActiveItem( f900_local1 )
	end
end

local f0_local52 = function ( f901_arg0, f901_arg1, f901_arg2 )
	local f901_local0 = f0_local5( f901_arg0, f901_arg1 )
	local f901_local1 = f901_local0:getItemAtPosition( 1, 1, true )
	if tonumber( Engine.GetModelValue( Engine.GetModel( f901_local1:getModel(), "position" ) ) ) == 1 then
		if f901_local1 ~= f901_arg1 then
			f901_local0:setActiveItem( f901_local1 )
		end
		return 
	else
		CoD.perController[f901_arg2].pivotPosition = 1
		CoD.perController[f901_arg2].leaderboardTopOrBottom = CoD.LeaderboardUtility.TOP
		Engine.GetLeaderboardRow( f901_arg2, 1, CoD.GetCombatRecordMode() )
	end
end

function Leaderboard_GoToTopOfList( f902_arg0, f902_arg1, f902_arg2 )
	if CoD.perController[f902_arg2].leaderboardPlayerFilter == Enum.LbFilter.LB_FILTER_NONE then
		f0_local52( f902_arg0, f902_arg1, f902_arg2 )
	else
		f0_local51( f902_arg0, f902_arg1, f902_arg2 )
	end
end

function Leaderboard_UpdateHeaderModel( f903_arg0, f903_arg1 )
	local f903_local0 = f903_arg0.LeaderboardHeader
	if not f903_local0 then
		return 
	end
	DataSources.LeaderboardHeader.getModel( f903_arg1 )
	if f903_local0.linkedElementModels then
		for f903_local4, f903_local5 in ipairs( f903_local0.linkedElementModels ) do
			f903_local5.element:updateElementLinkedModels( f903_local0 )
		end
	end
end

function Leaderboard_ApplyFilters( f904_arg0, f904_arg1 )
	local f904_local0 = CoD.perController[f904_arg1].leaderboardPlayerFilter == CoD.perController[f904_arg1].leaderboardPlayerFilterTemp
	local f904_local1 = CoD.perController[f904_arg1].leaderboardDurationFilter == CoD.perController[f904_arg1].leaderboardDurationFilterTemp
	local f904_local2 = true
	if IsZMMapsLeaderboard( f904_arg1 ) then
		f904_local2 = CoD.perController[f904_arg1].leaderboardZMMapsNumPlayersFilter == CoD.perController[f904_arg1].leaderboardZMMapsNumPlayersFilterTemp
	end
	if f904_local0 and f904_local1 and f904_local2 then
		return 
	else
		CoD.perController[f904_arg1].leaderboardPlayerFilter = CoD.perController[f904_arg1].leaderboardPlayerFilterTemp
		CoD.perController[f904_arg1].leaderboardDurationFilter = CoD.perController[f904_arg1].leaderboardDurationFilterTemp
		CoD.perController[f904_arg1].leaderboardZMMapsNumPlayersFilter = CoD.perController[f904_arg1].leaderboardZMMapsNumPlayersFilterTemp
		LoadLeaderboard( f904_arg0, f904_arg1 )
	end
end

function Leaderboard_OpenPlayerDetails( f905_arg0, f905_arg1, f905_arg2 )
	Leaderboard_SetSelectedFriendXUID( f905_arg0, f905_arg1, f905_arg2 )
	OpenPopup( f905_arg0, "Social_PlayerDetailsPopup", f905_arg2 )
end

function Leaderboard_SetSelectedFriendXUID( f906_arg0, f906_arg1, f906_arg2 )
	if not f906_arg1:getModel() then
		return 
	else
		local f906_local0 = Engine.GetModelValue( Engine.GetModel( f906_arg1:getModel(), "name" ) )
		local f906_local1 = Engine.GetModelValue( Engine.GetModel( f906_arg1:getModel(), "xuid" ) )
		local f906_local2 = Engine.GetPlayerInfo( f906_arg2, f906_local1 )
		local f906_local3 = Engine.GetModelForController( f906_arg2 )
		Engine.SetModelValue( Engine.CreateModel( f906_local3, "Social.selectedFriendXUID" ), f906_local1 )
		Engine.SetModelValue( Engine.CreateModel( f906_local3, "Social.selectedFriendGamertag" ), f906_local0 )
	end
end

function SpectateSelectedPlayer( f907_arg0, f907_arg1, f907_arg2 )
	Engine.SendMenuResponse( f907_arg2, "spectate", Engine.GetModelValue( Engine.GetModel( f907_arg1:getModel(), "clientNum" ) ) )
end

function SetShoutcastHighlightedPlayer( f908_arg0, f908_arg1, f908_arg2 )
	Dvar.shoutcastHighlightedClient:set( Engine.GetModelValue( Engine.GetModel( f908_arg1:getModel(), "clientNum" ) ) )
end

function ToggleCodCasterQuickSettings( f909_arg0, f909_arg1, f909_arg2 )
	if not f909_arg1.profileVar then
		return 
	elseif not CoD.ShoutcasterProfileVarBool( f909_arg2, f909_arg1.profileVar ) then
		CoD.SetShoutcasterProfileVarValue( f909_arg2, f909_arg1.profileVar, 1 )
	else
		CoD.SetShoutcasterProfileVarValue( f909_arg2, f909_arg1.profileVar, 0 )
	end
	Engine.SetModelValue( Engine.GetModel( f909_arg1:getModel(), "profileVarValue" ), CoD.ShoutcasterProfileVarBool( f909_arg2, f909_arg1.profileVar ) )
	if Engine.IsInGame() and f909_arg1.profileVar == "shoutcaster_qs_thirdperson" then
		Engine.ExecNow( f909_arg2, "shoutcaster_thirdperson " .. CoD.ShoutcasterProfileVarValue( f909_arg2, f909_arg1.profileVar ) )
	end
end

function SetCodCasterProfileValue( f910_arg0, f910_arg1, f910_arg2, f910_arg3, f910_arg4 )
	CoD.SetShoutcasterProfileVarValue( f910_arg2, f910_arg3, f910_arg4 )
end

function HandleTeamIdentityKeyboardComplete( f911_arg0, f911_arg1, f911_arg2, f911_arg3 )
	local f911_local0, f911_local1 = nil
	local f911_local2 = Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( f911_arg2 ), "team" ) )
	local f911_local3 = DataSources.TeamIdentityInformation.getModel( f911_arg2, f911_local2 )
	if f911_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_TEAM_IDENTITY_TEAMNAME then
		f911_local0 = Engine.GetModel( f911_local3, "teamName" )
		f911_local1 = "shoutcaster_fe_" .. f911_local2 .. "_name"
	end
	if f911_local0 then
		Engine.SetModelValue( f911_local0, f911_arg3.input )
		CoD.SetShoutcasterProfileVarValue( f911_arg2, f911_local1, f911_arg3.input )
	end
end

function SetTeamIdentityProfileValue( f912_arg0, f912_arg1, f912_arg2, f912_arg3 )
	if not f912_arg3 or f912_arg3 == "" then
		return 
	else
		local f912_local0 = Engine.GetModel( f912_arg1:getModel(), "id" )
		if not f912_local0 then
			return 
		else
			CoD.SetShoutcasterProfileVarValue( f912_arg2, "shoutcaster_fe_" .. Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( f912_arg2 ), "team" ) ) .. "_" .. f912_arg3, Engine.GetModelValue( f912_local0 ) )
		end
	end
end

function SetTeamIdentityTeamLogo( f913_arg0, f913_arg1, f913_arg2 )
	local f913_local0 = DataSources.TeamIdentityInformation.getModel( f913_arg2, Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( f913_arg2 ), "team" ) ) )
	local f913_local1 = Engine.GetModelValue( Engine.GetModel( f913_arg1:getModel(), "ref" ) )
	local f913_local2 = Engine.GetModelValue( Engine.GetModel( f913_arg1:getModel(), "name" ) )
	Engine.SetModelValue( Engine.GetModel( f913_local0, "teamLogo" ), f913_local1 )
	Engine.SetModelValue( Engine.GetModel( f913_local0, "teamLogoName" ), f913_local2 )
end

function SetTeamIdentityTeamColor( f914_arg0, f914_arg1, f914_arg2 )
	Engine.SetModelValue( Engine.GetModel( DataSources.TeamIdentityInformation.getModel( f914_arg2, Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( f914_arg2 ), "team" ) ) ), "teamColor" ), Engine.GetModelValue( Engine.GetModel( f914_arg1:getModel(), "color" ) ) )
end

function UpdateSelectedTeamIdentityColorElement( f915_arg0, f915_arg1, f915_arg2 )
	local f915_local0 = CoD.ShoutcasterProfileVarValue( f915_arg2, "shoutcaster_fe_" .. Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( f915_arg2 ), "team" ) ) .. "_color" )
	local f915_local1 = Engine.GetModelValue( Engine.GetModel( f915_arg1:getModel(), "id" ) )
	local f915_local2 = f915_arg0.TeamColorList:findItem( {
		id = f915_local0
	} )
	if f915_local2 then
		Engine.SetModelValue( Engine.GetModel( f915_local2:getModel(), "selected" ), false )
	end
	Engine.SetModelValue( Engine.GetModel( f915_arg1:getModel(), "selected" ), true )
end

function SaveShoutcasterSettings( f916_arg0, f916_arg1, f916_arg2 )
	Engine.StorageWrite( f916_arg2, Enum.StorageFileType.STORAGE_PROFILE_SHOUTCASTER )
end

function ChangeAbilityWheelItems( f917_arg0, f917_arg1, f917_arg2 )
	local f917_local0 = Engine.GetModel( Engine.GetModelForController( f917_arg0 ), "hudItems.cybercomRequestedType" )
	local f917_local1 = (Engine.GetModelValue( f917_local0 ) + f917_arg2 + 3) % 3
	Engine.SetModelValue( f917_local0, f917_local1 )
	DataSources.AbilityWheel.getModel( f917_arg0 )
	f917_arg1.updateButtonStates( nil, f917_local1 + 1 )
end

function SetFileShareOverrideXuid( f918_arg0, f918_arg1, f918_arg2 )
	local f918_local0 = f918_arg1:getModel( f918_arg2, "xuid" )
	if f918_local0 ~= nil then
		local f918_local1 = Engine.GetModelValue( f918_local0 )
		Dvar.fshRecentsXUID:set( f918_local1 )
		OpenGenericSmallPopup( f918_arg0, f918_arg2, "Theater Player Overriden", "You will now be able to view fileshare as " .. tostring( f918_local1 ), nil, "MENU_OK" )
	end
end

function OpenBlackMarket( f919_arg0, f919_arg1, f919_arg2 )
	if Engine.PushAnticheatMessageToUI( f919_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.LOOT ) then
		DisplayAnticheatMessage( f919_arg0, f919_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.LOOT, "", "" )
		return 
	end
	for f919_local0 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
		if CheckIfFeatureIsBanned( f919_local0, LuaEnums.FEATURE_BAN.LOOT ) then
			LuaUtils.UI_ShowErrorMessageDialog( f919_arg2, GetFeatureBanInfo( f919_local0, LuaEnums.FEATURE_BAN.LOOT ) )
			return 
		end
	end
	OpenOverlay( f919_arg0, "BlackMarket", f919_arg2 )
end

function OpenPCQuit( f920_arg0, f920_arg1, f920_arg2 )
	if CoD.isPC then
		CoD.OverlayUtility.CreateOverlay( f920_arg2, f920_arg0, "QuitPCGamePopup" )
	end
end

function OpenPCResetControlsPopup( f921_arg0, f921_arg1, f921_arg2 )
	if CoD.isPC then
		CoD.OverlayUtility.CreateOverlay( f921_arg2, f921_arg0, "ResetPCControls" )
	end
end

function ResetPCControlsToDefault( f922_arg0, f922_arg1, f922_arg2 )
	if Dvar.ui_execdemo_gamescom:get() then
		Engine.ExecNow( f922_arg2, "resetprofilecommon" )
		Engine.ExecNow( f922_arg2, "updategamerprofile" )
		Engine.ExecNow( f922_arg2, "storagereset stats_mp_offline" )
	end
	Engine.SetProfileVar( f922_arg2, "input_invertpitch", 0 )
	Engine.SetProfileVar( f922_arg2, "gpad_rumble", 1 )
	Engine.SetProfileVar( f922_arg2, "gpad_sticksConfig", CoD.THUMBSTICK_DEFAULT )
	Engine.SetProfileVar( f922_arg2, "gpad_buttonsConfig", CoD.BUTTONS_DEFAULT )
	Engine.SetProfileVar( f922_arg2, "input_viewSensitivity", CoD.SENSITIVITY_2 )
	Engine.SetProfileVar( f922_arg2, "input_viewSensitivityHorizontal", CoD.SENSITIVITY_2 )
	Engine.SetProfileVar( f922_arg2, "input_viewSensitivityVertical", CoD.SENSITIVITY_2 )
	Engine.SetProfileVar( f922_arg2, "mouseSensitivity", 5 )
	Engine.ExecNow( f922_arg2, "defaultbindings" )
	Engine.ExecNow( f922_arg2, "execcontrollerbindings" )
	Engine.SyncHardwareProfileWithDvars()
	f922_arg0:dispatchEventToRoot( {
		name = "options_refresh",
		controller = f922_arg2
	} )
end

function OpenPCApplyGraphicsPopup( f923_arg0, f923_arg1, f923_arg2 )
	if CoD.isPC then
		CoD.OverlayUtility.CreateOverlay( f923_arg2, f923_arg0, "ApplyPCGraphics" )
	end
end

function ApplyPCGraphicsOptions( f924_arg0, f924_arg1, f924_arg2 )
	Engine.ApplyHardwareProfileSettings()
	Engine.SetTextureQuality( tonumber( Engine.GetHardwareProfileValueAsString( "r_picmip" ) ) )
	Engine.SetShadowQuality( CoD.PCUtil.ShadowOptionIndex )
	Engine.SetVolumetricQuality( CoD.PCUtil.VolumetricOptionIndex )
	Engine.SyncHardwareProfileWithDvars()
	Engine.SaveHardwareProfile()
	Engine.Exec( nil, "vid_restart" )
end

function OpenPCResetGraphics( f925_arg0, f925_arg1, f925_arg2 )
	if CoD.isPC then
		CoD.OverlayUtility.CreateOverlay( f925_arg2, f925_arg0, "ResetPCGraphics" )
	end
end

function ResetPCGraphicsOptions( f926_arg0, f926_arg1, f926_arg2 )
	Engine.ResetHardwareProfileSettings()
	CoD.PCUtil.ShadowOptionIndex = Engine.GetShadowQuality()
	CoD.PCUtil.VolumetricOptionIndex = Engine.GetVolumetricQuality()
	Engine.Exec( nil, "vid_restart" )
	CoD.PCUtil.RefreshAllOptions( f926_arg1, f926_arg2 )
end

function HideIfUsingMouse( f927_arg0, f927_arg1 )
	if CoD.isPC then
		if Engine.LastInput_Gamepad() then
			f927_arg0:setAlpha( 1 )
		else
			f927_arg0:setAlpha( 0 )
		end
	end
end

function HideMouseCursor( f928_arg0 )
	if CoD.isPC then
		Engine.HideMouseCursor()
		f928_arg0.mouseCursorHidden = true
	end
end

function ShowMouseCursor( f929_arg0 )
	if CoD.isPC then
		Engine.ShowMouseCursor()
		f929_arg0.mouseCursorHidden = nil
	end
end

function UIKeyboardCancel( f930_arg0, f930_arg1 )
	Engine.Exec( f930_arg1, "ui_keyboard_cancel" )
end

function UIKeyboardComplete( f931_arg0, f931_arg1 )
	Engine.Exec( f931_arg1, "ui_keyboard_complete" )
end

function ToggleDropDownListInUse( f932_arg0, f932_arg1 )
	f932_arg0.inUse = not f932_arg0.inUse
	if f932_arg0.DropDownList then
		MakeFocusable( f932_arg0.DropDownList )
		SetFocusToElement( f932_arg0, "DropDownList", f932_arg1 )
	end
end

function SetVerticaListSpacerHeight( f933_arg0, f933_arg1 )
	if f933_arg1 then
		local f933_local0 = Engine.GetModelValue( f933_arg1 )
		if f933_local0 then
			f933_arg0:setTopBottom( true, false, 0, f933_local0 )
		end
	end
end

function ToggleMouse( f934_arg0, f934_arg1 )
	f934_arg0:toggleMouse()
end

function ToggleHandleMouse( f935_arg0, f935_arg1 )
	f935_arg0:toggleHandleMouse()
end

function EnableMouseButton( f936_arg0, f936_arg1 )
	f936_arg0:setHandleMouseButton( true )
end

function DisableMouseButton( f937_arg0, f937_arg1 )
	f937_arg0:setHandleMouseButton( false )
end

function ToggleHandleMouseButton( f938_arg0, f938_arg1 )
	f938_arg0:toggleHandleMouseButton( f938_arg0, f938_arg1 )
end

function EnableMouseMove( f939_arg0, f939_arg1 )
	f939_arg0:setHandleMouseMove( true )
end

function DisableMouseMove( f940_arg0, f940_arg1 )
	f940_arg0:setHandleMouseMove( false )
end

function ToggleHandleMouseMove( f941_arg0, f941_arg1 )
	f941_arg0:toggleHandleMouseMove()
end

function EnableMouseButtonOnElement( f942_arg0, f942_arg1 )
	f942_arg0:setHandleMouseButton( true )
end

function DisableMouseButtonOnElement( f943_arg0, f943_arg1 )
	f943_arg0:setHandleMouseButton( false )
end

function DisableMouseOnElement( f944_arg0, f944_arg1, f944_arg2 )
	if f944_arg0[f944_arg1] then
		f944_arg0[f944_arg1]:setMouseDisabled( true )
	end
end

function EnableMouseOnElement( f945_arg0, f945_arg1, f945_arg2 )
	if f945_arg0[f945_arg1] then
		f945_arg0[f945_arg1]:setMouseDisabled( false )
	end
end

function ToggleDropdownListInUse_Console( f946_arg0, f946_arg1 )
	f946_arg0.inUse = not f946_arg0.inUse
	if f946_arg0.inUse == true then
		if f946_arg0.DropdownList then
			MakeFocusable( f946_arg0.DropdownList )
			SetLoseFocusToElement( f946_arg0, "DropdownRoot", f946_arg1 )
			SetFocusToElement( f946_arg0, "DropdownList", f946_arg1 )
		end
	elseif f946_arg0.DropdownList then
		SetState( f946_arg0, "DefaultState" )
		MakeNotFocusable( f946_arg0.DropdownList )
		MakeFocusable( f946_arg0.DropdownRoot )
		SetLoseFocusToElement( f946_arg0, "DropdownList", f946_arg1 )
		SetFocusToElement( f946_arg0, "DropdownRoot", f946_arg1 )
	end
end

function DropDownListItemClick_Console( f947_arg0, f947_arg1, f947_arg2 )
	
end

function Gunsmith_OpenCreateVariantNamePopup( f948_arg0, f948_arg1, f948_arg2 )
	CoD.OverlayUtility.CreateOverlay( f948_arg2, f948_arg0, "GunsmithCreateVariantNameOverlay", f948_arg2, f948_arg1 )
end

function Gunsmith_OpenSaveVariantPopup( f949_arg0, f949_arg1, f949_arg2, f949_arg3 )
	CoD.OverlayUtility.CreateOverlay( f949_arg2, f949_arg0, "GunsmithSaveVariant", f949_arg2, f949_arg1 )
end

function Gunsmith_TabChanged( f950_arg0, f950_arg1, f950_arg2 )
	DataSources.CraftWeaponList.setCurrentFilterItem( f950_arg1.filter )
	CoD.perController[f950_arg2].weaponCategory = f950_arg1.filter
	f950_arg0.weaponList:updateDataSource( true )
	f950_arg0.weaponList:setActiveItem( f950_arg0.weaponList:getFirstSelectableItem() )
	if CoD.perController[f950_arg2].gunsmithWeaponCategoryRestored == true then
		CoD.SetCustomization( f950_arg2, f950_arg0.tabList.Tabs.grid.activeWidget.gridInfoTable.zeroBasedIndex + 1, "category_index" )
	end
end

function Gunsmith_Back( f951_arg0, f951_arg1, f951_arg2 )
	CoD.perController[f951_arg2].gunsmithWeaponCategoryRestored = nil
	CoD.perController[f951_arg2].gunsmithWeaponListIndex = nil
	CoD.perController[f951_arg2].gunsmithAttachmentType = nil
	CoD.perController[f951_arg2].gunsmithAttachmentModel = nil
	CoD.perController[f951_arg2].gunsmithCamoIndexModel = nil
	CoD.perController[f951_arg2].gunsmithReticleIndexModel = nil
	CoD.perController[f951_arg2].gunsmithVariantModel = nil
	CoD.perController[f951_arg2].gunsmithAttachmentVariantModel = nil
	CoD.perController[f951_arg2].emptyVariantSelected = nil
	CoD.CraftUtility.Gunsmith.CachedVariants = {}
end

function Gunsmith_GainFocus( f952_arg0, f952_arg1, f952_arg2 )
	CoD.SetCustomization( f952_arg2, Engine.GetModelValue( f952_arg1:getModel( f952_arg2, "itemIndex" ) ), "weapon_index" )
	if f952_arg0.tabList then
		CoD.SetCustomization( f952_arg2, f952_arg0.tabList.Tabs.grid.activeWidget.gridInfoTable.zeroBasedIndex + 1, "category_index" )
	end
	CoD.CraftUtility.Gunsmith.DisplayBaseWeapon( f952_arg0, f952_arg1, f952_arg2 )
	CoD.GunsmithWeaponOptionsTable = nil
end

function Gunsmith_ChooseWeaponList( f953_arg0, f953_arg1, f953_arg2 )
	f953_arg0:updateMode( Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST, f953_arg1 )
	f953_arg0.variantSelector.variantList:setActiveItem( f953_arg0.variantSelector.variantList:getFirstSelectableItem() )
end

function Gunsmith_BrowseVariants( f954_arg0, f954_arg1, f954_arg2 )
	f954_arg0.variantSelector.variantList:updateDataSource( true )
	f954_arg0:updateMode( Enum.GunsmithMode.GUNSMITHMODE_VARIANTS, f954_arg1 )
	CoD.perController[f954_arg2].gunsmithWeaponListIndex = f954_arg0.weaponList.activeWidget.gridInfoTable.zeroBasedIndex + 1
	CoD.perController[f954_arg2].gunsmithWeaponCategoryRestored = false
	CoD.perController[f954_arg2].gunsmithAttachmentType = "attachment"
end

function Gunsmith_HandleKeyboardComplete( f955_arg0, f955_arg1, f955_arg2, f955_arg3 )
	local f955_local0 = CoD.perController[f955_arg2].gunsmithVariantModel
	local f955_local1 = nil
	if not f955_local0 then
		return 
	elseif f955_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_GUNSMITH then
		f955_local1 = Engine.GetModel( f955_local0, "variantTextEntry" )
		if f955_local1 then
			Engine.SetModelValue( f955_local1, f955_arg3.input )
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f955_arg2 ), "Gunsmith.validVariantNameEntered" ), true )
		end
		local f955_local2 = f955_arg0:getModel( f955_arg2, "inputText" )
		if f955_local2 then
			Engine.SetModelValue( f955_local2, f955_arg3.input )
		end
	end
end

function Gunsmith_CreateVariantNameBack( f956_arg0, f956_arg1, f956_arg2 )
	Engine.SetModelValue( Engine.GetModel( f956_arg0:getModel(), "variantTextEntry" ), Engine.Localize( "MENU_GUNSMITH_ENTER_VARIANT_NAME" ) )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f956_arg2 ), "Gunsmith.validVariantNameEntered" ), false )
end

function Gunsmith_FocusOccupiedVariant( f957_arg0, f957_arg1, f957_arg2 )
	CoD.perController[f957_arg2].gunsmithVariantModel = f957_arg1:getModel()
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f957_arg2, CoD.perController[f957_arg2].gunsmithVariantModel )
end

function Gunsmith_ChooseEmptyVariant( f958_arg0, f958_arg1, f958_arg2 )
	CoD.perController[f958_arg2].gunsmithVariantModel = f958_arg1:getModel()
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f958_arg2 ), "Gunsmith.validVariantNameEntered" ), false )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f958_arg2, CoD.perController[f958_arg2].gunsmithVariantModel )
	CoD.perController[f958_arg2].emptyVariantSelected = true
end

function Gunsmith_EditVariant( f959_arg0 )
	CoD.perController[f959_arg0].confirmVariantNameButtonPressed = true
end

function Gunsmith_ConfirmVariantName( f960_arg0, f960_arg1, f960_arg2, f960_arg3 )
	local f960_local0 = f960_arg0:getModel()
	local f960_local1 = Engine.GetModelValue( Engine.GetModel( f960_local0, "variantTextEntry" ) )
	Engine.SetModelValue( Engine.GetModel( f960_local0, "variantName" ), f960_local1 )
	local f960_local2 = GoBack( f960_arg3, f960_arg2 )
	if f960_local2 then
		Gunsmith_EditVariant( f960_arg2 )
		f960_local2:openOverlay( "GunsmithCustomizeVariant", f960_arg2 )
		Engine.SetModelValue( Engine.GetModel( f960_local0, "variantNameBig" ), f960_local1 )
	end
end

function Gunsmith_SetWeaponAttachmentType( f961_arg0, f961_arg1, f961_arg2, f961_arg3, f961_arg4, f961_arg5 )
	CoD.perController[f961_arg5].gunsmithAttachmentType = f961_arg2
	CoD.perController[f961_arg5].gunsmithAttachmentIsZombieMode = f961_arg4
	CoD.perController[f961_arg5].gunsmithAttachmentModel = f961_arg0:getModel( f961_arg5, "attachment" .. f961_arg3 )
	CoD.perController[f961_arg5].gunsmithAttachmentVariantModel = f961_arg0:getModel( f961_arg5, "attachmentVariant" .. f961_arg3 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f961_arg5 ), "Gunsmith.GunsmithSelectedItemProperties.attachmentType" ), f961_arg2 )
end

local f0_local53 = function ( f962_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f962_arg0 ), "Gunsmith.GunsmithSelectedItemProperties.itemName" ), "" )
end

function Gunsmith_ClearAttachmentSlot( f963_arg0, f963_arg1, f963_arg2, f963_arg3 )
	Engine.SetModelValue( f963_arg0:getModel( f963_arg3, "attachment" .. f963_arg2 ), CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
	Engine.SetModelValue( f963_arg0:getModel( f963_arg3, "attachmentVariant" .. f963_arg2 ), CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
	if f963_arg2 == 1 or f963_arg2 == "1" then
		Engine.SetModelValue( f963_arg0:getModel( f963_arg3, "reticleIndex" ), CoD.CraftUtility.Gunsmith.RETICLE_NONE )
	end
	f0_local53( f963_arg3 )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f963_arg3, f963_arg0:getModel(), true )
end

function Gunsmith_ClearCamo( f964_arg0, f964_arg1, f964_arg2 )
	Engine.SetModelValue( f964_arg0:getModel( f964_arg2, "camoIndex" ), CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
	f0_local53( f964_arg2 )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f964_arg2, f964_arg0:getModel(), true )
end

function Gunsmith_ClearVariantPaintjobSlot( f965_arg0, f965_arg1, f965_arg2 )
	local f965_local0 = f965_arg0:getModel( f965_arg2, "paintjobSlot" )
	local f965_local1 = f965_arg0:getModel( f965_arg2, "paintjobIndex" )
	Engine.SetModelValue( f965_local0, Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
	Engine.SetModelValue( f965_local1, Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
	f0_local53( f965_arg2 )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f965_arg2, f965_arg0:getModel(), true )
end

function Gunsmith_SelectAttachment( f966_arg0, f966_arg1, f966_arg2 )
	local f966_local0 = f966_arg1:getModel()
	local f966_local1 = CoD.perController[f966_arg2].gunsmithVariantModel
	if f966_local0 and f966_local1 then
		local f966_local2 = Engine.GetModelValue( Engine.GetModel( f966_local0, "attachmentIndex" ) )
		local f966_local3 = Engine.GetModelValue( Engine.GetModel( f966_local0, "acvIndex" ) )
		local f966_local4 = 0
		for f966_local5 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f966_local8 = Engine.GetModelValue( Engine.GetModel( f966_local1, "attachment" .. f966_local5 ) )
			if f966_local8 > 0 and f966_local2 ~= f966_local8 and not Engine.AreAttachmentsCompatibleByAttachmentID( f966_local2, f966_local8 ) then
				f966_local4 = f966_local8
				break
			end
		end
		if f966_local4 > 0 then
			CoD.CraftUtility.Gunsmith.ClearVariantSlotByAttachmentIndex( f966_arg2, f966_local1, f966_local4 )
		end
		CoD.CraftUtility.Gunsmith.ClearVariantSlotByAttachmentIndex( f966_arg2, f966_local1, f966_local2 )
		Engine.SetModelValue( f966_arg0:getModel(), f966_local2 )
		Engine.SetModelValue( CoD.perController[f966_arg2].gunsmithAttachmentVariantModel, f966_local3 )
	end
end

function Gunsmith_FocusAttachment( f967_arg0, f967_arg1, f967_arg2, f967_arg3 )
	local f967_local0 = CoD.GetCustomization( f967_arg2, "weapon_index" )
	local f967_local1 = Engine.GetModelValue( f967_arg1:getModel( f967_arg2, "attachmentIndex" ) )
	local f967_local2 = Engine.GetAttachmentRefByIndex( f967_local1 )
	local f967_local3 = Engine.GetModelValue( f967_arg0:getModel() )
	local f967_local4 = Engine.GetAttachmentRefByIndex( f967_local3 )
	local f967_local5 = CoD.perController[f967_arg2].gunsmithVariantModel
	local f967_local6 = CoD.CraftUtility.GetLoadoutSlot( f967_arg2 )
	local f967_local7 = "select01"
	local f967_local8 = Engine.GetItemRef( f967_local0, Enum.eModes.MODE_MULTIPLAYER ) .. CoD.CraftUtility.GetModeAbbreviation()
	for f967_local13, f967_local14 in ipairs( CoD.CraftUtility.Gunsmith.GetVariantAttachmentList( f967_arg2, f967_local5 ) ) do
		if f967_local14 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
			local f967_local12 = Engine.GetAttachmentRefByIndex( f967_local14 )
			if (not Engine.IsOpticByAttachmentIndex( f967_local1 ) or not Engine.IsOpticByAttachmentIndex( f967_local14 )) and Engine.AreAttachmentsCompatibleByAttachmentID( f967_local1, f967_local14 ) then
				f967_local8 = f967_local8 .. "+" .. f967_local12
			end
		end
	end
	f967_local8 = f967_local8 .. "+" .. f967_local2
	if CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX < f967_local3 and f967_local2 ~= f967_local4 then
		f967_local8 = string.gsub( f967_local8, "+" .. f967_local4, "" )
	end
	f967_local9 = ""
	if f967_arg3 == false then
		f967_local9 = CoD.CraftUtility.Gunsmith.GetWeaponAttachmentStringWithoutVariants( f967_arg2, f967_local5 )
	else
		f967_local9 = CoD.CraftUtility.Gunsmith.GetAttachmentVariantStringWithSelectedVariant( f967_arg2, f967_local5, f967_local3, Engine.GetModelValue( f967_arg1:getModel( f967_arg2, "variantIndex" ) ) )
	end
	if not CoD.CraftUtility.Gunsmith.IsFocusAttachmentEquipped( f967_arg2, f967_local5, f967_local1 ) then
		f967_local9 = f967_local9 .. f967_local2 .. ",0"
	end
	f967_local11 = "none"
	if f967_local8 and f967_local8 ~= "" then
		Engine.SendClientScriptNotify( f967_arg2, "CustomClass_focus" .. CoD.GetLocalClientAdjustedNum( f967_arg2 ), f967_local6, f967_local8, f967_local2, f967_local11, f967_local9 )
	end
end

function Gunsmith_SetAttachmentVariant( f968_arg0, f968_arg1, f968_arg2 )
	local f968_local0 = f968_arg1:getModel()
	local f968_local1 = Engine.GetModelValue( Engine.GetModel( f968_local0, "variantIndex" ) )
	local f968_local2 = Engine.GetModelValue( Engine.GetModel( f968_local0, "attachmentIndex" ) )
	local f968_local3 = CoD.perController[f968_arg2].gunsmithVariantModel
	if f968_local2 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX and CoD.CraftUtility.Gunsmith.IsFocusAttachmentEquipped( f968_arg2, f968_local3, f968_local2 ) then
		CoD.CraftUtility.Gunsmith.SetFocusAttachmentVariant( f968_arg2, f968_local3, f968_local2, f968_local1 )
	end
end

function Gunsmith_FocusCamo( f969_arg0, f969_arg1, f969_arg2 )
	local f969_local0 = Engine.GetModelValue( f969_arg1:getModel( f969_arg2, "itemIndex" ) )
	local f969_local1 = IsGunsmithItemWeaponOptionLocked( f969_arg0, f969_arg1, f969_arg2 )
	if not f969_local1 then
		f969_local1 = IsSelfModelValueTrue( f969_arg1, f969_arg2, "isBMClassified" )
	end
	if f969_local1 then
		f969_local0 = 0
	end
	local f969_local2 = CoD.perController[f969_arg2].gunsmithVariantModel
	local f969_local3 = Engine.GetModelValue( Engine.GetModel( f969_local2, "paintjobSlot" ) )
	local f969_local4 = Engine.GetModelValue( Engine.GetModel( f969_local2, "paintjobIndex" ) )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f969_arg2, CoD.perController[f969_arg2].gunsmithVariantModel, false, nil, nil, f969_local0 )
end

function Gunsmith_SetWeaponCamoModel( f970_arg0, f970_arg1, f970_arg2 )
	CoD.perController[f970_arg2].gunsmithCamoIndexModel = f970_arg0:getModel( f970_arg2, "camoIndex" )
	Engine.SendClientScriptNotify( f970_arg2, "cam_customization_focus" .. CoD.GetLocalClientAdjustedNum( f970_arg2 ), "primary", "select01" )
end

function Gunsmith_SelectCamo( f971_arg0, f971_arg1, f971_arg2 )
	local f971_local0 = f971_arg1:getModel( f971_arg2, "itemIndex" )
	if f971_local0 then
		Engine.SetModelValue( f971_arg0:getModel(), Engine.GetModelValue( f971_local0 ) )
	end
end

function Gunsmith_FocusReticle( f972_arg0, f972_arg1, f972_arg2 )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f972_arg2, CoD.perController[f972_arg2].gunsmithVariantModel, false, nil, nil, Engine.GetModelValue( Engine.GetModel( CoD.perController[f972_arg2].gunsmithVariantModel, "camoIndex" ) ) )
end

function Gunsmith_SetWeaponReticleModel( f973_arg0, f973_arg1, f973_arg2 )
	CoD.perController[f973_arg2].gunsmithReticleIndexModel = f973_arg0:getModel( f973_arg2, "reticleIndex" )
	Engine.SendClientScriptNotify( f973_arg2, "cam_customization_focus", "primary", "select01" )
end

function Gunsmith_SelectReticle( f974_arg0, f974_arg1, f974_arg2 )
	local f974_local0 = f974_arg1:getModel( f974_arg2, "weaponOptionSubIndex" )
	if f974_local0 then
		Engine.SetModelValue( f974_arg0:getModel(), Engine.GetModelValue( f974_local0 ) )
	end
end

function Gunsmith_SetWeaponOptionAsOld( f975_arg0, f975_arg1, f975_arg2 )
	f0_local12( f975_arg0, f975_arg1, f975_arg2, CoD.GetCustomization( f975_arg2, "weapon_index" ) )
end

function Gunsmith_SetAttachmentAsOld( f976_arg0, f976_arg1 )
	local f976_local0 = CoD.GetCustomization( f976_arg1, "weapon_index" )
	local f976_local1 = f976_arg0:getModel( f976_arg1, "attachmentIndex" )
	if f976_local1 then
		local f976_local2 = Engine.GetAttachmentIndexByAttachmentTableIndex( f976_local0, Engine.GetModelValue( f976_local1 ) )
		if CoD.CACUtility.EmptyItemIndex < f976_local2 then
			Engine.SetAttachmentAsOld( f976_arg1, f976_local0, f976_local2 )
		end
	end
end

function Gunsmith_SetACVASOld( f977_arg0, f977_arg1 )
	local f977_local0 = CoD.GetCustomization( f977_arg1, "weapon_index" )
	local f977_local1 = f977_arg0.attachmentRef
	local f977_local2 = f977_arg0.variantIndex
	if f977_local1 and f977_local2 then
		Engine.SetACVItemOld( f977_arg1, f977_local0, f977_local1, f977_local2, Enum.eModes.MODE_MULTIPLAYER )
	end
end

function Gunsmith_SetSelectedItemName( f978_arg0, f978_arg1, f978_arg2, f978_arg3, f978_arg4 )
	if f978_arg1.m_focusable then
		local f978_local0 = f978_arg1:getModel()
		local f978_local1 = Engine.CreateModel( Engine.GetModelForController( f978_arg4 ), "Gunsmith.GunsmithSelectedItemProperties.itemName" )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f978_arg4 ), "Gunsmith.GunsmithSelectedItemProperties.attachmentType" ), f978_arg2 )
		Engine.SetModelValue( f978_local1, "" )
		if f978_arg2 == "attachment" or f978_arg2 == "optic" then
			local f978_local2 = Engine.GetModelValue( f978_arg0:getModel( f978_arg4, "attachment" .. f978_arg3 ) )
			if f978_local2 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				Engine.SetModelValue( f978_local1, Engine.GetAttachmentNameByIndex( f978_local2 ) )
				Gunsmith_SetWeaponAttachmentType( f978_arg0, f978_arg1, f978_arg2, f978_arg3, false, f978_arg4 )
			end
		elseif f978_arg2 == "camo" and f978_arg3 == "" then
			local f978_local2 = Engine.GetModelValue( f978_arg0:getModel( f978_arg4, "camoIndex" ) )
			local f978_local3 = CoD.GetCustomization( f978_arg4, "weapon_index" )
			if f978_local2 ~= CoD.CraftUtility.Gunsmith.CAMO_NONE and f978_local3 > CoD.CACUtility.EmptyItemIndex then
				local f978_local4 = Engine.GetModel( Engine.GetWeaponOptionsInfoModelByIndex( f978_arg4, f978_local2, "WeaponOptions", f978_local3, 0 ), "name" )
				if f978_local4 then
					Engine.SetModelValue( f978_local1, Engine.GetModelValue( f978_local4 ) )
				end
			end
		elseif f978_arg2 == "paintjob" and f978_arg3 == "" then
			local f978_local2 = Engine.GetModelValue( f978_arg1:getModel( f978_arg4, "paintjobSlot" ) )
			local f978_local5 = Engine.GetModelValue( f978_arg1:getModel( f978_arg4, "paintjobIndex" ) )
			if f978_local2 ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and f978_local5 ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
				Engine.SetModelValue( f978_local1, CoD.CraftUtility.Paintjobs.GetPaintjobName( f978_arg4, f978_local2, f978_local5 ) )
			end
		elseif f978_arg2 == "snapshot" and f978_arg3 == "" then
			Engine.SetModelValue( f978_local1, Engine.Localize( "MENU_GUNSMITH_SNAPSHOT_SUBHEADER" ) )
		end
	end
end

function Gunsmith_ClearVariant( f979_arg0, f979_arg1, f979_arg2 )
	CoD.CraftUtility.Gunsmith.ClearVariant( f979_arg2, Engine.GetModelValue( Engine.GetModel( CoD.perController[f979_arg2].gunsmithVariantModel, "variantIndex" ) ) )
	local f979_local0 = nil
	if IsMediaManager() == true then
		f979_local0 = GoBackMultiple( f979_arg0, f979_arg2, 1 )
		MediaManagerMarkDirty( f979_arg2 )
	else
		f979_local0 = GoBackMultiple( f979_arg0, f979_arg2, 2 )
	end
	if f979_local0.variantSelector ~= nil and f979_local0.variantSelector.variantList ~= nil then
		f979_local0.variantSelector.variantList:updateDataSource( true )
		f979_local0.variantSelector.variantList:setActiveItem( f979_local0.variantSelector.variantList:getFirstSelectableItem() )
		ForceNotifyModel( f979_arg2, "Gunsmith.UpdateDataSource" )
	end
end

function Gunsmith_CopyVariant( f980_arg0, f980_arg1, f980_arg2, f980_arg3, f980_arg4 )
	local f980_local0 = CoD.CraftUtility.Gunsmith.Copy( f980_arg2, Engine.GetModelValue( Engine.GetModel( CoD.perController[f980_arg2].gunsmithVariantModel, "variantIndex" ) ) )
	if f980_local0 then
		local f980_local1 = GoBack( f980_arg4, f980_arg2 )
		local f980_local2 = f980_local1.variantSelector.variantList
		f980_local2:updateDataSource( true )
		local f980_local3 = f980_local2:findItem( {
			variantIndex = f980_local0
		} )
		if f980_local3 then
			f980_local2:setActiveItem( f980_local3 )
		end
		ForceNotifyModel( f980_arg2, "Gunsmith.UpdateDataSource" )
	end
end

function Gunsmith_RenameVariant( f981_arg0, f981_arg1, f981_arg2 )
	local f981_local0 = f981_arg0:getModel()
	CoD.CraftUtility.Gunsmith.RenameVariant( f981_arg2, Engine.GetModelValue( Engine.GetModel( f981_local0, "variantIndex" ) ), Engine.GetModelValue( Engine.GetModel( f981_local0, "variantName" ) ) )
end

function Gunsmith_HandleRenameKeyboardComplete( f982_arg0, f982_arg1, f982_arg2, f982_arg3 )
	local f982_local0 = f982_arg0:getModel()
	local f982_local1, f982_local2 = nil
	if not f982_local0 then
		return 
	elseif f982_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_GUNSMITH then
		f982_local1 = Engine.GetModel( f982_local0, "variantName" )
		f982_local2 = Engine.GetModel( f982_local0, "variantNameBig" )
	end
	if f982_local1 then
		Engine.SetModelValue( f982_local1, f982_arg3.input )
		Gunsmith_ClearSelectedGunsmithVariantStats( f982_arg2 )
	end
	if f982_local2 then
		Engine.SetModelValue( f982_local2, f982_arg3.input )
	end
end

function Gunsmith_ClearSelectedGunsmithVariantStats( f983_arg0 )
	local f983_local0 = CoD.perController[f983_arg0].gunsmithVariantModel
	if f983_local0 then
		local f983_local1 = Engine.GetModelValue( Engine.GetModel( f983_local0, "variantIndex" ) )
		CoD.CraftUtility.Gunsmith.ClearVariantStats( f983_arg0, f983_local1, Enum.eModes.MODE_MULTIPLAYER )
		CoD.CraftUtility.Gunsmith.ClearVariantStats( f983_arg0, f983_local1, Enum.eModes.MODE_CAMPAIGN )
	end
end

local f0_local54 = function ( f984_arg0, f984_arg1, f984_arg2, f984_arg3 )
	local f984_local0 = 0
	if f984_arg0.occludedMenu and f984_arg0.occludedMenu.openTime then
		f984_local0 = Engine.milliseconds() - f984_arg0.occludedMenu.openTime
	end
	local f984_local1 = Engine.GetModelValue( Engine.GetModel( f984_arg2, "variantName" ) )
	local f984_local2 = Engine.GetModelValue( Engine.GetModel( f984_arg2, "weaponIndex" ) )
	local f984_local3 = CoD.CraftUtility.GetDDLRoot( f984_arg1, CoD.CraftUtility.Gunsmith.GetFileType() )
	local f984_local4 = ""
	local f984_local5 = Engine.GetModelValue( Engine.GetModel( f984_arg2, "variantIndex" ) )
	local f984_local6 = CoD.CraftUtility.Gunsmith.GetSortedAttachmentList( f984_arg1, CoD.perController[f984_arg1].gunsmithVariantModel )
	for f984_local7 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
		local f984_local10 = f984_local6.baseAttachmentList[f984_local7]
		if 0 < f984_local10 then
			if 0 < string.len( f984_local4 ) then
				f984_local4 = f984_local4 .. ","
			end
			f984_local4 = f984_local4 .. f984_local10
		end
	end
	LUI.CoDMetrics.GunsmithEvent( f984_arg1, f984_arg3, f984_local0, f984_local2, f984_local1, f984_local4 )
end

function Gunsmith_SaveChangesButtonAction( f985_arg0, f985_arg1, f985_arg2, f985_arg3 )
	local f985_local0 = CoD.perController[f985_arg3].gunsmithVariantModel
	if f985_arg2 == "save" then
		CoD.CraftUtility.Gunsmith.WriteVaraintDataToDDL( f985_arg3, f985_local0 )
		ForceNotifyModel( f985_arg3, "Gunsmith.UpdateDataSource" )
		f0_local54( f985_arg0, f985_arg3, f985_local0, "save" )
	else
		f0_local54( f985_arg0, f985_arg3, f985_local0, "discard" )
	end
	local f985_local1 = GoBack( f985_arg0, f985_arg3 )
	local f985_local2 = GoBack( f985_local1, f985_arg3 )
	ClearMenuSavedState( f985_local1 )
	local f985_local3 = Engine.GetModelValue( Engine.GetModel( f985_local0, "variantIndex" ) )
	f985_local2.variantSelector.variantList:updateDataSource( true )
	f985_local2.attachmentList:updateDataSource( true )
	f985_local2.variantSelector.variantList:findItem( {
		variantIndex = f985_local3
	}, nil, true, nil )
	CoD.perController[f985_arg3].emptyVariantSelected = false
end

function Gunsmith_PaintjobSelector_GainFocus( f986_arg0, f986_arg1, f986_arg2 )
	CoD.perController[f986_arg2].selectedpaintjobModel = f986_arg1:getModel()
	CoD.perController[f986_arg2].viewIndex = 1
	local f986_local0 = CoD.Paintshop.View[CoD.perController[f986_arg2].viewIndex].customization_type
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f986_arg2, CoD.perController[f986_arg2].gunsmithVariantModel, false, Engine.GetModelValue( f986_arg1:getModel( f986_arg2, "paintjobSlot" ) ), Engine.GetModelValue( f986_arg1:getModel( f986_arg2, "paintjobIndex" ) ), nil )
	SetHeadingKickerText( "MENU_GUNSMITH_CAPS" )
end

function Gunsmith_OpenPaintjobSelector( f987_arg0, f987_arg1, f987_arg2 )
	CoD.SetCustomization( f987_arg2, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT, "type" )
	CoD.perController[f987_arg2].totalLayers = Enum.CustomizationTypeLayerCount.CUSTOMIZATION_TYPE_PAINTSHOP_MAX_LAYERS
	CoD.perController[f987_arg2].totalGroups = Enum.CustomizationTypeGroupCount.CUSTOMIZATION_TYPE_MAX_GROUPS
	local f987_local0 = CoD.CraftUtility.Paintjobs.ParseDDL( f987_arg2, Enum.StorageFileType.STORAGE_PAINTJOBS )
end

function Gunsmith_PaintjobSelector_ChooseOccupiedPaintjob( f988_arg0, f988_arg1, f988_arg2 )
	local f988_local0 = Engine.GetModelValue( f988_arg1:getModel( f988_arg2, "paintjobSlot" ) )
	local f988_local1 = Engine.GetModelValue( f988_arg1:getModel( f988_arg2, "paintjobIndex" ) )
	local f988_local2 = f988_arg0:getModel( f988_arg2, "paintjobSlot" )
	local f988_local3 = f988_arg0:getModel( f988_arg2, "paintjobIndex" )
	local f988_local4 = f988_arg0:getModel( f988_arg2, "paintjobSlotAndIndex" )
	Engine.SetModelValue( f988_local2, f988_local0 )
	Engine.SetModelValue( f988_local3, f988_local1 )
	Engine.SetModelValue( f988_local4, f988_local0 .. " " .. f988_local1 )
end

function Gunsmith_ClearCACWithUpdatedVariant( f989_arg0, f989_arg1 )
	local f989_local0 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f989_arg1].gunsmithVariantModel, "variantIndex" ) ) + 1
	local f989_local1 = function ( f990_arg0, f990_arg1, f990_arg2 )
		local f990_local0 = Engine.GetClassItem( f989_arg1, f990_arg0, f990_arg1, f990_arg2 )
		if f990_local0 > CoD.CACUtility.EmptyItemIndex and f990_local0 == f989_local0 then
			Engine.SetClassItem( f989_arg1, f990_arg0, f990_arg1, CoD.CACUtility.EmptyItemIndex, f990_arg2 )
		end
	end
	
	local f989_local2 = function ( f991_arg0 )
		local f991_local0 = Engine.GetCustomClassCount( f989_arg1, f991_arg0 )
		for f991_local1 = 1, f991_local0, 1 do
			local f991_local4 = f991_local1 - 1
			f989_local1( f991_local4, "primarygunsmithvariant", f991_arg0 )
			f989_local1( f991_local4, "secondarygunsmithvariant", f991_arg0 )
		end
	end
	
	f989_local2( Enum.eModes.MODE_CAMPAIGN )
	f989_local2( Enum.eModes.MODE_MULTIPLAYER )
end

function Gunsmith_SnapshotToggleDisplayProperty( f992_arg0, f992_arg1, f992_arg2 )
	local f992_local0 = f992_arg1:getModel( f992_arg2, "param" )
	if f992_local0 then
		local f992_local1 = Engine.GetModelValue( f992_local0 )
		if f992_local1 then
			local f992_local2 = Engine.GetModel( Engine.GetGlobalModel(), f992_local1 )
			if f992_local2 then
				Engine.SetModelValue( f992_local2, (Engine.GetModelValue( f992_local2 ) + 1) % 2 )
			end
		end
	end
end

function Gunsmith_SnapshotToggleControlsUI( f993_arg0, f993_arg1, f993_arg2 )
	local f993_local0 = Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.ShowControls" )
	if f993_local0 then
		Engine.SetModelValue( f993_local0, (Engine.GetModelValue( f993_local0 ) + 1) % 2 )
	end
end

function Gunsmith_SnapshotToggleStatsFilter( f994_arg0, f994_arg1, f994_arg2 )
	local f994_local0 = Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.SessionMode" )
	if f994_local0 then
		if Engine.GetModelValue( f994_local0 ) == Enum.eModes.MODE_CAMPAIGN then
			Engine.SetModelValue( f994_local0, Enum.eModes.MODE_MULTIPLAYER )
		else
			Engine.SetModelValue( f994_local0, Enum.eModes.MODE_CAMPAIGN )
		end
	end
end

function CopyModelFindElement( f995_arg0, f995_arg1, f995_arg2 )
	local f995_local0 = f995_arg1
	while f995_local0 and not f995_local0[f995_arg2] do
		f995_local0 = f995_local0:getParent()
	end
	if f995_local0 and f995_local0[f995_arg2] then
		f995_local0[f995_arg2]:setModel( f995_arg1:getModel() )
	end
end

function StartMenuGoBack_ListElement( f996_arg0, f996_arg1, f996_arg2, f996_arg3, f996_arg4 )
	StartMenuGoBack( f996_arg4, f996_arg2 )
end

function StartMenuGoBack( f997_arg0, f997_arg1 )
	StartMenuResumeGame( f997_arg0, f997_arg1 )
	GoBack( f997_arg0, f997_arg1 )
	ClearSavedState( f997_arg0, f997_arg1 )
end

function StartMenuResumeGame( f998_arg0, f998_arg1 )
	if Engine.IsInGame() and Engine.CanPauseGame() and not Engine.IsDemoPlaying() then
		Engine.SetDvar( "cl_paused", 0 )
	end
	if Engine.IsInGame() then
		Engine.SetActiveMenu( f998_arg1, CoD.UIMENU_NONE )
	end
	PrepareCloseMenuInSafehouse( f998_arg1 )
end

function UnpauseGame( f999_arg0, f999_arg1 )
	if Engine.IsInGame() and Engine.CanPauseGame() and not Engine.IsDemoPlaying() then
		Engine.SetDvar( "cl_paused", 0 )
	end
end

function CloseStartMenu( f1000_arg0, f1000_arg1 )
	local f1000_local0 = GoBackToMenu( f1000_arg0, f1000_arg1, "StartMenu_Main" )
	if f1000_local0.menuName == "StartMenu_Main" or f1000_local0.menuName == "DOA_INGAME_PAUSE" then
		StartMenuGoBack( f1000_local0, f1000_arg1 )
	end
end

function RefreshLobbyRoom( f1001_arg0, f1001_arg1 )
	if Engine.IsInGame() then
		return 
	end
	local f1001_local0 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyGameMode" )
	local f1001_local1 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" )
	local f1001_local2 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.room" )
	if f1001_local2 then
		local f1001_local3 = Engine.GetModelValue( f1001_local2 )
		if f1001_local3 == "auto" then
			f1001_local3 = Engine.GetAbbreviationForMode( Engine.GetMostRecentPlayedMode( f1001_arg1 ) )
			if Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK ) == true then
				f1001_local3 = f1001_local3 .. "_local"
			end
			if IsCustomLobby() then
				f1001_local3 = f1001_local3 .. "_custom"
			end
		end
		SendCustomClientScriptMenuStateChangeNotify( f1001_arg1, "Main", true, f1001_local3 )
		f1001_arg0.previousRoom = f1001_local3
	end
end

function UpdatePlayerInspection( f1002_arg0, f1002_arg1, f1002_arg2 )
	local f1002_local0 = Engine.GetModelValue( Engine.GetModel( f1002_arg1:getModel(), "xuid" ) )
	if Engine.XuidIsValid( f1002_local0 ) then
		Engine.SendClientScriptNotify( f1002_arg2, "inspect_player", Engine.UInt64ToString( f1002_local0 ) )
	end
end

function UpdateGamerprofile( f1003_arg0, f1003_arg1, f1003_arg2 )
	Engine.Exec( f1003_arg2, "updategamerprofile" )
end

function OpenPaintshop( f1004_arg0, f1004_arg1, f1004_arg2, f1004_arg3, f1004_arg4 )
	if Engine.PushAnticheatMessageToUI( f1004_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.UGC ) then
		DisplayAnticheatMessage( f1004_arg0, f1004_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.UGC, "Paintshop", "" )
		return 
	elseif CheckIfFeatureIsBanned( f1004_arg2, LuaEnums.FEATURE_BAN.USER_GENERATED_CONTENT ) then
		LuaUtils.UI_ShowErrorMessageDialog( f1004_arg2, GetFeatureBanInfo( f1004_arg2, LuaEnums.FEATURE_BAN.USER_GENERATED_CONTENT ) )
		return 
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1004_arg2 ), "Paintshop.Mode" ), Enum.PaintshopMode.PAINTSHOPMODE_WEAPONLIST )
	CoD.SetCustomization( f1004_arg2, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT, "type" )
	CoD.perController[f1004_arg2].totalLayers = Enum.CustomizationTypeLayerCount.CUSTOMIZATION_TYPE_PAINTSHOP_MAX_LAYERS
	CoD.perController[f1004_arg2].totalGroups = Enum.CustomizationTypeGroupCount.CUSTOMIZATION_TYPE_MAX_GROUPS
	if CoD.CraftUtility.Paintjobs.ParseDDL( f1004_arg2, Enum.StorageFileType.STORAGE_PAINTJOBS ) then
		f1004_arg4:openOverlay( "Paintshop", f1004_arg2 )
	end
end

function OpenEmblemSelect( f1005_arg0, f1005_arg1, f1005_arg2, f1005_arg3, f1005_arg4 )
	CoD.SetCustomization( f1005_arg2, Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM, "type" )
	Engine.ExecNow( f1005_arg2, "emblemgetprofile" )
	CoD.perController[f1005_arg2].selectedEmblemTabStorageType = f1005_arg3
	if CoD.CraftUtility.Emblems.ParseDDL( f1005_arg2, CoD.perController[f1005_arg2].selectedEmblemTabStorageType ) then
		f1005_arg4:openOverlay( "EmblemSelect", f1005_arg2 )
	end
end

function OpenEmblemEditor( f1006_arg0, f1006_arg1, f1006_arg2, f1006_arg3, f1006_arg4 )
	if Engine.PushAnticheatMessageToUI( f1006_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.UGC ) then
		DisplayAnticheatMessage( f1006_arg1, f1006_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.UGC, "EmblemEditor", f1006_arg4 )
		return 
	elseif CheckIfFeatureIsBanned( f1006_arg2, LuaEnums.FEATURE_BAN.USER_GENERATED_CONTENT ) then
		LuaUtils.UI_ShowErrorMessageDialog( f1006_arg2, GetFeatureBanInfo( f1006_arg2, LuaEnums.FEATURE_BAN.USER_GENERATED_CONTENT ) )
		return 
	elseif f1006_arg4 == "EmblemSelect" then
		EmblemSelect_ChooseEmblem( f1006_arg1, f1006_arg0, f1006_arg2 )
		OpenOverlay( f1006_arg1, "EmblemEditor", f1006_arg2, "", "" )
	elseif f1006_arg4 == "PaintjobSelect" then
		PaintjobSelector_ChoosePaintjob( f1006_arg1, f1006_arg0, f1006_arg2 )
		OpenOverlay( f1006_arg1, "EmblemEditor", f1006_arg2, "", "" )
	end
end

function OpenGunsmith( f1007_arg0, f1007_arg1, f1007_arg2, f1007_arg3, f1007_arg4 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1007_arg2 ), "Gunsmith.Mode" ), Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST )
	if CoD.CraftUtility.Gunsmith.ParseDDL( f1007_arg2, Enum.StorageFileType.STORAGE_GUNSMITH ) and CoD.CraftUtility.Paintjobs.ParseDDL( f1007_arg2, Enum.StorageFileType.STORAGE_PAINTJOBS ) then
		f1007_arg4:openOverlay( "Gunsmith", f1007_arg2 )
		CoD.perController[f1007_arg2].emptyVariantSelected = false
	end
end

function OpenCallingCards( f1008_arg0, f1008_arg1, f1008_arg2, f1008_arg3, f1008_arg4 )
	f1008_arg4:openOverlay( "CallingCards", f1008_arg2 )
end

function OpenGroups( f1009_arg0, f1009_arg1, f1009_arg2, f1009_arg3, f1009_arg4 )
	if IsGroupsEnabled() then
		Engine.SwitchMode( f1009_arg2, "mp" )
		CoD.LobbyBase.OpenGroups( f1009_arg4, f1009_arg2 )
	end
end

function OpenPersonalizeCharacter( f1010_arg0, f1010_arg1, f1010_arg2, f1010_arg3, f1010_arg4 )
	CoD.LobbyBase.OpenPersonalizeCharacter( f1010_arg4, f1010_arg2 )
end

function OpenChooseCharacterLoadout( f1011_arg0, f1011_arg1, f1011_arg2, f1011_arg3, f1011_arg4 )
	CoD.CCUtility.customizationMode = Enum.eModes.MODE_MULTIPLAYER
	CoD.LobbyBase.OpenChooseCharacterLoadout( f1011_arg4, f1011_arg2, f1011_arg3 )
end

function EditClanTag( f1012_arg0, f1012_arg1, f1012_arg2 )
	ShowKeyboard( f1012_arg0, f1012_arg1, f1012_arg2, "KEYBOARD_TYPE_CLAN_TAG" )
end

function OpenControlerSettings( f1013_arg0, f1013_arg1, f1013_arg2, f1013_arg3, f1013_arg4 )
	while f1013_arg4 and not f1013_arg4.openMenu do
		f1013_arg4 = f1013_arg4:getParent()
	end
	f1013_arg4:saveState()
	f1013_arg4:openMenu( "OptionsMenu", f1013_arg2 )
	f1013_arg4:close()
end

function ProcessStartMenuButtonPress( f1014_arg0, f1014_arg1, f1014_arg2 )
	if f1014_arg1.currentMode == CoD.HeroCarouselItemStates.Inspecting then
		if f1014_arg1.cardFront and f1014_arg1.cardFront.selectionList and f1014_arg1.cardFront.selectionList.activeWidget and not IsDisabled( f1014_arg0, f1014_arg1.cardFront.selectionList.activeWidget, {
			controller = f1014_arg2
		} ) then
			ProcessListAction( f1014_arg0, f1014_arg1.cardFront.selectionList.activeWidget, f1014_arg2 )
		end
	elseif CoD.CCUtility.Heroes.edittingLoadoutForWidget then
		local f1014_local0 = CoD.CCUtility.Heroes.edittingLoadoutForWidget
		if f1014_local0.cardBack and f1014_local0.cardBack.selectionList and f1014_local0.cardBack.selectionList.activeWidget and not IsDisabled( f1014_arg0, f1014_local0.cardBack.selectionList.activeWidget, {
			controller = f1014_arg2
		} ) then
			EquipHeroLoadoutItem( f1014_local0, f1014_local0.cardBack.selectionList.activeWidget, f1014_arg2 )
		end
	end
end

function OpenMenuByNameParam( f1015_arg0, f1015_arg1, f1015_arg2, f1015_arg3, f1015_arg4 )
	NavigateToMenu( f1015_arg0, f1015_arg3, true, f1015_arg2 )
end

function OpenPopupMenuByNameParam( f1016_arg0, f1016_arg1, f1016_arg2, f1016_arg3, f1016_arg4 )
	f1016_arg4:openPopup( f1016_arg3, f1016_arg2 )
end

function StartMenuUploadClip( f1017_arg0, f1017_arg1, f1017_arg2, f1017_arg3, f1017_arg4 )
	local f1017_local0 = Engine.GetDemoStreamedDownloadProgress()
	if f1017_local0 < 100 then
		CoD.Menu.OpenDemoErrorPopup( f1017_arg0, {
			controller = event.controller,
			titleText = Engine.Localize( "MENU_NOTICE" ),
			messageText = Engine.Localize( "MPUI_DEMO_DOWNLOAD_IN_PROGRESS", math.floor( f1017_local0 ) )
		} )
		return 
	else
		CoD.DemoPopup.isClipSaveScreen = true
		CoD.perController[f1017_arg2].fileshareSaveCategory = "clip"
		CoD.perController[f1017_arg2].fileshareSaveIsCopy = false
		CoD.perController[f1017_arg2].fileshareSaveIsPooled = false
	end
end

function StartMenuOpenManageSegments( f1018_arg0, f1018_arg1, f1018_arg2, f1018_arg3, f1018_arg4 )
	OpenPopupMenuByNameParam( f1018_arg0, f1018_arg1, f1018_arg2, "TimelineEditor", f1018_arg4 )
end

function StartMenuOpenCustomizeHighlightReel( f1019_arg0, f1019_arg1, f1019_arg2, f1019_arg3, f1019_arg4 )
	OpenPopupMenuByNameParam( f1019_arg0, f1019_arg1, f1019_arg2, "CustomizeHighlightReel", f1019_arg4 )
end

function StartMenuJumpToStart( f1020_arg0, f1020_arg1, f1020_arg2, f1020_arg3, f1020_arg4 )
	Engine.Exec( f1020_arg2, "demo_jumptostart" )
	GoBack( f1020_arg0, f1020_arg2 )
end

function StartMenuEndDemo( f1021_arg0, f1021_arg1, f1021_arg2, f1021_arg3, f1021_arg4 )
	local f1021_local0 = f1021_arg0
	while f1021_local0 and not f1021_local0.openMenu do
		f1021_local0 = f1021_local0:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( f1021_arg2, f1021_local0, "EndDemoPopup" )
end

function DemoSwitchPlayer( f1022_arg0, f1022_arg1 )
	if f1022_arg1 == nil or f1022_arg1 == "" then
		return 
	end
	local f1022_local0 = nil
	if f1022_arg1 == "next" then
		f1022_local0 = 0
	elseif f1022_arg1 == "prev" then
		f1022_local0 = 1
	end
	Engine.Exec( f1022_arg0, "demo_switchplayer " .. f1022_local0 )
end

function UpdateDemoTimeScale( f1023_arg0, f1023_arg1 )
	local f1023_local0 = CoD.DemoUtility.GetRoundedTimeScale()
	local f1023_local1 = tonumber( f1023_arg1 )
	local f1023_local2 = f1023_local0 + f1023_local1
	if not (f1023_local1 <= 0 or f1023_local2 > Dvar.demo_maxTimeScale:get()) or f1023_local1 < 0 and f1023_local2 >= 0.1 then
		Engine.Exec( f1023_arg0, "demo_timescale " .. f1023_local2 )
	end
end

function UpdateDemoCameraMode( f1024_arg0, f1024_arg1 )
	if f1024_arg1 == nil or f1024_arg1 == "" then
		return 
	end
	local f1024_local0 = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.cameraMode" ) )
	local f1024_local1 = nil
	if f1024_arg1 == "next" or f1024_arg1 == "cycle" then
		if f1024_local0 == Enum.demoCameraMode.DEMO_CAMERA_MODE_NONE then
			f1024_local1 = Enum.demoCameraMode.DEMO_CAMERA_MODE_THIRDPERSON
		elseif f1024_local0 == Enum.demoCameraMode.DEMO_CAMERA_MODE_THIRDPERSON then
			f1024_local1 = Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM
		elseif f1024_arg1 == "cycle" then
			f1024_local1 = Enum.demoCameraMode.DEMO_CAMERA_MODE_NONE
		else
			return 
		end
	elseif f1024_arg1 == "prev" then
		if f1024_local0 == Enum.demoCameraMode.DEMO_CAMERA_MODE_THIRDPERSON then
			f1024_local1 = Enum.demoCameraMode.DEMO_CAMERA_MODE_NONE
		elseif f1024_local0 == Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM then
			f1024_local1 = Enum.demoCameraMode.DEMO_CAMERA_MODE_THIRDPERSON
		else
			return 
		end
	end
	Engine.SwitchDemoCameraMode( f1024_local1 )
end

function UpdateDemoFastForward( f1025_arg0 )
	local f1025_local0 = CoD.DemoUtility.GetRoundedTimeScale()
	local f1025_local1 = nil
	if f1025_local0 >= 6 then
		f1025_local1 = 1
	elseif f1025_local0 >= 4 then
		f1025_local1 = 6
	elseif f1025_local0 >= 2 then
		f1025_local1 = 4
	elseif f1025_local0 >= 1 then
		f1025_local1 = 2
	else
		f1025_local1 = 1
	end
	Engine.ExecNow( f1025_arg0, "demo_timescale " .. f1025_local1 )
	local f1025_local2 = Engine.GetModel( Engine.GetGlobalModel(), "demo.timeScale" )
	if f1025_local2 then
		Engine.SetModelValue( f1025_local2, f1025_local1 )
	end
	return f1025_local1
end

function DemoJumpBack( f1026_arg0 )
	Engine.Exec( f1026_arg0, "demo_back" )
end

function DemoToggleGameHud( f1027_arg0 )
	Engine.Exec( f1027_arg0, "demo_togglegamehud" )
end

function DemoToggleDemoHud( f1028_arg0 )
	Engine.Exec( f1028_arg0, "demo_toggledemohud" )
end

function DemoCancelPreview( f1029_arg0 )
	Engine.Exec( f1029_arg0, "demo_cancelpreview" )
end

function DemoAddDollyCameraMarker( f1030_arg0 )
	Engine.Exec( f1030_arg0, "demo_adddollycammarker" )
end

function DemoEditDollyCameraMarker( f1031_arg0 )
	CoD.DemoUtility.SwitchToDollyCamMarker( f1031_arg0, -1 )
	CoD.DemoUtility.SetEditingDollyCameraMarker( f1031_arg0, true )
end

function DemoExitEditDollyCameraMarker( f1032_arg0 )
	Engine.Exec( f1032_arg0, "demo_updatedollycammarkerparameters " .. Engine.GetHighlightedCameraMarker() )
	CoD.DemoUtility.SetEditingDollyCameraMarker( f1032_arg0, false )
end

function DemoPlaceDollyCameraMarker( f1033_arg0 )
	Engine.Exec( f1033_arg0, "demo_applynewdollycammarkerposition 0" )
end

function DemoCancelPlaceDollyCameraMarker( f1034_arg0 )
	Engine.Exec( f1034_arg0, "demo_applynewdollycammarkerposition 1" )
end

function UpdateDollyCameraTimeScaleMode( f1035_arg0, f1035_arg1 )
	if f1035_arg1 == nil or f1035_arg1 == "" then
		return 
	end
	local f1035_local0 = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentDollyCamMarkerTimeScaleMode" )
	local f1035_local1 = Engine.GetModelValue( f1035_local0 )
	local f1035_local2 = nil
	if f1035_arg1 == "next" then
		if f1035_local1 == Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_MANUAL then
			f1035_local2 = Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_LINEAR
		elseif f1035_local1 == Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_LINEAR then
			f1035_local2 = Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_FIXED
		else
			return 
		end
	elseif f1035_arg1 == "prev" then
		if f1035_local1 == Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_LINEAR then
			f1035_local2 = Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_MANUAL
		elseif f1035_local1 == Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_FIXED then
			f1035_local2 = Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_LINEAR
		else
			return 
		end
	end
	Engine.SetModelValue( f1035_local0, f1035_local2 )
end

function UpdateDollyCameraTimeScale( f1036_arg0, f1036_arg1 )
	local f1036_local0 = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentDollyCamMarkerTimeScaleValue" )
	if not f1036_local0 then
		return 
	end
	local f1036_local1 = Engine.GetModelValue( f1036_local0 )
	local f1036_local2 = tonumber( f1036_arg1 )
	local f1036_local3 = f1036_local1 + f1036_local2
	if not (f1036_local2 <= 0 or f1036_local3 > Dvar.demo_maxTimeScale:get()) or f1036_local2 < 0 and f1036_local3 >= 0.1 then
		Engine.SetModelValue( f1036_local0, f1036_local3 )
	end
end

function DemoFreeCameraLockOnObject( f1037_arg0 )
	Engine.Exec( f1037_arg0, "demo_activatefreecameralockon" )
end

function DemoFreeCameraUnlockObject( f1038_arg0 )
	Engine.Exec( f1038_arg0, "demo_deactivatefreecameralockon" )
end

function DemoAddLightmanMarker( f1039_arg0 )
	Engine.Exec( f1039_arg0, "demo_addlightmanmarker" )
end

function DemoEditLightmanMarker( f1040_arg0 )
	CoD.DemoUtility.SwitchToLightmanMarker( f1040_arg0, -1 )
	CoD.DemoUtility.SetEditingLightmanMarker( f1040_arg0, true )
end

function DemoExitEditLightmanMarker( f1041_arg0 )
	Engine.Exec( f1041_arg0, "demo_updatelightmanmarkerparameters " .. Engine.GetHighlightedCameraMarker() )
	CoD.DemoUtility.SetEditingLightmanMarker( f1041_arg0, false )
end

function DemoPlaceLightmanMarker( f1042_arg0 )
	Engine.Exec( f1042_arg0, "demo_applynewlightmanmarkerposition 0" )
end

function DemoCancelPlaceLightmanMarker( f1043_arg0 )
	Engine.Exec( f1043_arg0, "demo_applynewlightmanmarkerposition 1" )
end

function UpdateLightmanLightMode( f1044_arg0, f1044_arg1 )
	if f1044_arg1 == nil or f1044_arg1 == "" then
		return 
	end
	local f1044_local0 = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightMode" )
	local f1044_local1 = Engine.GetModelValue( f1044_local0 )
	local f1044_local2 = nil
	if f1044_arg1 == "next" then
		if f1044_local1 == Enum.demoLightmanLightMode.DEMO_LIGHTMAN_LIGHT_MODE_OMNI then
			f1044_local2 = Enum.demoLightmanLightMode.DEMO_LIGHTMAN_LIGHT_MODE_SPOT
		else
			return 
		end
	elseif f1044_arg1 == "prev" then
		if f1044_local1 == Enum.demoLightmanLightMode.DEMO_LIGHTMAN_LIGHT_MODE_SPOT then
			f1044_local2 = Enum.demoLightmanLightMode.DEMO_LIGHTMAN_LIGHT_MODE_OMNI
		else
			return 
		end
	end
	Engine.SetModelValue( f1044_local0, f1044_local2 )
	Engine.Exec( f1044_arg0, "demo_updatelightmanmarkerparameters " .. Engine.GetHighlightedCameraMarker() )
end

function UpdateLightmanFloatParam( f1045_arg0, f1045_arg1, f1045_arg2 )
	local f1045_local0 = tonumber( f1045_arg2 ) > 0
	if not f1045_arg0.btnId then
		return 
	end
	local f1045_local1, f1045_local2 = nil
	if f1045_local0 then
		f1045_local1 = 0.5
	else
		f1045_local1 = -0.5
	end
	local f1045_local3 = 0.1
	local f1045_local4 = 10
	if f1045_arg0.btnId == "lightmanlightintensity" then
		f1045_local2 = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightIntensity" )
	elseif f1045_arg0.btnId == "lightmanlightrange" then
		f1045_local2 = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightRange" )
	end
	if not f1045_local1 or not f1045_local2 then
		return 
	end
	local f1045_local5 = Engine.GetModelValue( f1045_local2 ) + f1045_local1
	if not (not f1045_local0 or f1045_local5 > f1045_local4) or not f1045_local0 and f1045_local3 <= f1045_local5 then
		Engine.SetModelValue( f1045_local2, f1045_local5 )
		Engine.Exec( f1045_arg1, "demo_updatelightmanmarkerparameters " .. Engine.GetHighlightedCameraMarker() )
	end
end

function StoreCurrentLightmanColor( f1046_arg0, f1046_arg1, f1046_arg2, f1046_arg3 )
	CoD.DemoUtility.CurrentLightmanColor = string.format( "%d %d %d", Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightColorR" ) ) * 255, Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightColorG" ) ) * 255, Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightColorB" ) ) * 255 )
end

function SelectLightmanColor( f1047_arg0, f1047_arg1, f1047_arg2, f1047_arg3 )
	local f1047_local0 = Engine.GetModel( f1047_arg1:getModel(), "color" )
	if f1047_local0 then
		CoD.DemoUtility.SetCurrentLightmanColor( f1047_arg2, Engine.GetModelValue( f1047_local0 ) )
	end
end

function CancelLightmanColorSelection( f1048_arg0, f1048_arg1, f1048_arg2, f1048_arg3 )
	if not CoD.DemoUtility.CurrentLightmanColor then
		return 
	else
		CoD.DemoUtility.SetCurrentLightmanColor( f1048_arg2, CoD.DemoUtility.CurrentLightmanColor )
	end
end

function ResetThumbnailViewer( f1049_arg0 )
	Engine.Exec( f1049_arg0, "resetThumbnailViewer" )
end

function TimelineEditorRefresh()
	local f1050_local0 = Engine.GetModel( Engine.GetGlobalModel(), "DemoSegments.refresh" )
	Engine.SetModelValue( f1050_local0, Engine.GetModelValue( f1050_local0 ) + 1 )
end

function TimelineEditorPreviewClip( f1051_arg0, f1051_arg1, f1051_arg2 )
	CoD.InGameMenu.CloseAllInGameMenus( f1051_arg0, {
		name = "close_all_ingame_menus",
		controller = f1051_arg2
	} )
	Engine.Exec( f1051_arg2, "demo_previewclip" )
end

function TimelineEditorFilmOptions( f1052_arg0, f1052_arg1, f1052_arg2 )
	OpenPopupWithPriority( f1052_arg0, "TimelineEditorFilmOptions", f1052_arg2, 100 )
end

local f0_local55 = function ( f1053_arg0, f1053_arg1, f1053_arg2, f1053_arg3, f1053_arg4 )
	
end

local f0_local56 = function ( f1054_arg0, f1054_arg1, f1054_arg2, f1054_arg3, f1054_arg4 )
	local f1054_local0 = CoD.Timeline_GetSelectedSegmentModel()
	local f1054_local1 = Engine.GetModelValue( Engine.GetModel( f1054_local0, "segmentNumber" ) )
	if f1054_arg3 then
		local f1054_local2 = Engine.GetModelValue( f1054_arg1:getModel( f1054_arg2, "segmentNumber" ) )
		local f1054_local3 = f1054_local1 - 1
		local f1054_local4 = f1054_local2 - 1
		if f1054_local3 ~= f1054_local4 then
			Engine.ExecNow( f1054_arg4:getOwner(), "demo_movesegment " .. f1054_local3 .. " " .. f1054_local4 )
		end
	end
	Engine.SetModelValue( Engine.GetModel( f1054_local0, "selected" ), false )
	CoD.perController[f1054_arg2].selectedSegment = nil
	TimelineEditorRefresh()
	CoD.Timeline_RefreshStateAfterMove( f1054_arg4, f1054_arg1:getModel(), f1054_local0, f1054_arg3 )
end

function TimelineEditorGoBack( f1055_arg0, f1055_arg1, f1055_arg2 )
	if CoD.Timeline_GetSelectedSegmentModel() then
		f0_local56( f1055_arg0, f1055_arg1, f1055_arg2, false, f1055_arg0 )
	else
		GoBack( f1055_arg0, f1055_arg2 )
	end
end

function TimelineEditorSelectAction( f1056_arg0, f1056_arg1, f1056_arg2 )
	if CoD.Timeline_GetSelectedSegmentModel() then
		f0_local56( f1056_arg0, f1056_arg1, f1056_arg2, true, f1056_arg0 )
	else
		f0_local55( f1056_arg0, f1056_arg1, f1056_arg2, nil, f1056_arg0 )
	end
end

function TimelineEditorUpdateTimeline( f1057_arg0, f1057_arg1, f1057_arg2, f1057_arg3, f1057_arg4 )
	local f1057_local0 = nil
	if f1057_arg3 == "gain_focus" then
		f1057_local0 = true
	else
		f1057_local0 = false
	end
	CoD.Timeline_RefreshState( f1057_arg4, f1057_arg1:getModel(), f1057_local0 )
end

function TimelineEditorUpdateHighlightedSegmentModel( f1058_arg0, f1058_arg1, f1058_arg2, f1058_arg3, f1058_arg4 )
	local f1058_local0 = nil
	if f1058_arg3 == "gain_focus" then
		f1058_local0 = true
	else
		f1058_local0 = false
	end
	local f1058_local1 = f1058_arg1:getModel()
	if not f1058_local1 then
		return 
	else
		Engine.SetModelValue( Engine.CreateModel( f1058_local1, "highlighted" ), f1058_local0 )
	end
end

function TimelineEditorKeyboardComplete( f1059_arg0, f1059_arg1, f1059_arg2, f1059_arg3 )
	Engine.SetModelValue( Engine.GetModel( CoD.Timeline_GetHighlightedSegmentModel(), "name" ), f1059_arg3.input )
end

function IncreaseSafeAreaVertical( f1060_arg0, f1060_arg1, f1060_arg2 )
	if not CoD.SafeArea or not CoD.SafeArea.Maximum or not CoD.SafeArea.AdjustAmount then
		return 
	end
	local f1060_local0 = tonumber( Engine.ProfileValueAsString( f1060_arg2, "safeAreaTweakable_vertical" ) ) + CoD.SafeArea.AdjustAmount
	if f1060_local0 <= CoD.SafeArea.Maximum then
		Engine.SetProfileVar( f1060_arg2, "safeAreaTweakable_vertical", f1060_local0 )
	end
end

function DecreaseSafeAreaVertical( f1061_arg0, f1061_arg1, f1061_arg2 )
	if not CoD.SafeArea or not CoD.SafeArea.Maximum or not CoD.SafeArea.AdjustAmount then
		return 
	end
	local f1061_local0 = tonumber( Engine.ProfileValueAsString( f1061_arg2, "safeAreaTweakable_vertical" ) ) - CoD.SafeArea.AdjustAmount
	if CoD.SafeArea.Minimum <= f1061_local0 then
		Engine.SetProfileVar( f1061_arg2, "safeAreaTweakable_vertical", f1061_local0 )
	end
end

function IncreaseSafeAreaHorizontal( f1062_arg0, f1062_arg1, f1062_arg2 )
	if not CoD.SafeArea or not CoD.SafeArea.Maximum or not CoD.SafeArea.AdjustAmount then
		return 
	end
	local f1062_local0 = tonumber( Engine.ProfileValueAsString( f1062_arg2, "safeAreaTweakable_horizontal" ) ) + CoD.SafeArea.AdjustAmount
	if f1062_local0 <= CoD.SafeArea.Maximum then
		Engine.SetProfileVar( f1062_arg2, "safeAreaTweakable_horizontal", f1062_local0 )
	end
end

function DecreaseSafeAreaHorizontal( f1063_arg0, f1063_arg1, f1063_arg2 )
	if not CoD.SafeArea or not CoD.SafeArea.Maximum or not CoD.SafeArea.AdjustAmount then
		return 
	end
	local f1063_local0 = tonumber( Engine.ProfileValueAsString( f1063_arg2, "safeAreaTweakable_horizontal" ) ) - CoD.SafeArea.AdjustAmount
	if CoD.SafeArea.Minimum <= f1063_local0 then
		Engine.SetProfileVar( f1063_arg2, "safeAreaTweakable_horizontal", f1063_local0 )
	end
end

function EquipScorestreak( f1064_arg0, f1064_arg1, f1064_arg2 )
	local f1064_local0 = f1064_arg1:getModel( f1064_arg2, "itemIndex" )
	if f1064_local0 then
		local f1064_local1 = Engine.GetModelValue( f1064_local0 )
		if f1064_local1 ~= CoD.CACUtility.EmptyItemIndex then
			local f1064_local2 = CoD.perController[f1064_arg2].classModel
			if not CoD.CACUtility.GetAttachedItemSlot( f1064_local2, f1064_local1, CoD.CACUtility.KillstreakNameList ) then
				local f1064_local3 = CoD.CACUtility.FindFirstEmptySlotInList( f1064_local2, CoD.CACUtility.KillstreakNameList )
				if f1064_local3 then
					CoD.SetClassItem( f1064_arg2, 0, f1064_local3, f1064_local1 )
					CoD.CACUtility.GetCustomClassModel( f1064_arg2, 0, f1064_local2 )
					f1064_arg0:processEvent( {
						name = "update_state",
						menu = f1064_arg0
					} )
				else
					local f1064_local4 = OpenPopup( f1064_arg0, "ScorestreakOverCapacity", f1064_arg2 )
					f1064_local4:setModel( f1064_local2 )
					if f1064_local4.updateSelectedImage then
						f1064_local4:updateSelectedImage( f1064_local1 )
					end
					LUI.OverrideFunction_CallOriginalFirst( f1064_local4, "close", function ()
						if f1064_local4.lastRemovedSlot then
							CoD.SetClassItem( f1064_arg2, 0, f1064_local4.lastRemovedSlot, f1064_local1 )
							CoD.CACUtility.GetCustomClassModel( f1064_arg2, 0, f1064_local2 )
							f1064_arg0:processEvent( {
								name = "update_state",
								menu = f1064_arg0
							} )
						end
					end )
				end
			end
		end
	end
end

function RemoveScorestreak( f1066_arg0, f1066_arg1, f1066_arg2 )
	local f1066_local0 = f1066_arg1:getModel( f1066_arg2, "itemIndex" )
	if f1066_local0 then
		local f1066_local1 = Engine.GetModelValue( f1066_local0 )
		if f1066_local1 ~= CoD.CACUtility.EmptyItemIndex then
			local f1066_local2 = f1066_arg0:getModel()
			local f1066_local3 = CoD.CACUtility.GetAttachedItemSlot( f1066_local2, f1066_local1, CoD.CACUtility.KillstreakNameList )
			if f1066_local3 then
				f1066_arg0.lastRemovedSlot = f1066_local3
				CoD.SetClassItem( f1066_arg2, 0, f1066_local3, CoD.CACUtility.EmptyItemIndex )
				CoD.CACUtility.GetCustomClassModel( f1066_arg2, 0, f1066_local2 )
				f1066_arg0:processEvent( {
					name = "update_state",
					menu = f1066_arg0
				} )
			end
		end
	end
end

function RemoveAllScorestreaks( f1067_arg0, f1067_arg1 )
	local f1067_local0 = f1067_arg0:getModel()
	for f1067_local4, f1067_local5 in ipairs( CoD.CACUtility.KillstreakNameList ) do
		CoD.SetClassItem( f1067_arg1, 0, f1067_local5, CoD.CACUtility.EmptyItemIndex )
	end
	CoD.CACUtility.GetCustomClassModel( f1067_arg1, 0, f1067_local0 )
	f1067_arg0:processEvent( {
		name = "update_state",
		menu = f1067_arg0
	} )
end

function GoBackAndUpdateSelectedChallengesButton( f1068_arg0, f1068_arg1 )
	local f1068_local0 = GoBack( f1068_arg0, f1068_arg1 )
	f1068_local0:processEvent( {
		name = "set_selected_button",
		controller = f1068_arg1
	} )
	return f1068_local0
end

function Challenges_UpdateListFromTabChanged( f1069_arg0, f1069_arg1, f1069_arg2 )
	local f1069_local0 = f1069_arg1:getModel( f1069_arg2, "tabCategory" )
	if f1069_local0 then
		SetGlobalModelValue( "challengeCategory", Engine.GetModelValue( f1069_local0 ) )
		local f1069_local1 = f1069_arg0.TabFrame.framedWidget
		if f1069_local1 then
			f1069_local1 = f1069_arg0.TabFrame.framedWidget.CallingCardGrid
		end
		if f1069_local1 then
			f1069_local1:updateDataSource()
		end
	end
end

function CallingCards_SetPlayerBackground( f1070_arg0, f1070_arg1, f1070_arg2 )
	local f1070_local0 = Engine.GetModel( f1070_arg1:getModel(), "iconId" )
	if f1070_local0 ~= nil then
		local f1070_local1 = Engine.GetModelValue( f1070_local0 )
		Engine.ExecNow( f1070_arg2, "emblemSelectBackground " .. f1070_local1 )
		if IsLive() then
			f1070_arg0.uploadProfile = true
			Engine.ExecNow( f1070_arg2, "emblemSetProfile" )
		else
			Engine.SetProfileVar( f1070_arg2, "default_background_index", f1070_local1 )
			Engine.ExecNow( f1070_arg2, "invalidateEmblemComponent" )
		end
	end
	ForceNotifyControllerModel( f1070_arg2, "xuid" )
end

function CallingCards_EmblemGetProfile( f1071_arg0, f1071_arg1, f1071_arg2 )
	Engine.ExecNow( f1071_arg2, "emblemGetProfile" )
	ForceNotifyControllerModel( f1071_arg2, "xuid" )
end

function CallingCards_GoBack( f1072_arg0, f1072_arg1 )
	if not IsLive() then
		Engine.CommitProfileChanges( f1072_arg1 )
	else
		UploadPublicProfile( f1072_arg0, f1072_arg1 )
	end
end

function CallingCards_UpdateListFromTabChanged( f1073_arg0, f1073_arg1, f1073_arg2 )
	local f1073_local0 = f1073_arg1:getModel( f1073_arg2, "tabCategory" )
	if f1073_local0 then
		SetGlobalModelValue( "challengeGameMode", Engine.GetModelValue( f1073_local0 ) )
		CoD.perController[f1073_arg2].currentCallingCardTabElement = f1073_arg1
		local f1073_local1 = f1073_arg0.TabFrame.framedWidget
		if f1073_local1 then
			f1073_local1 = f1073_arg0.TabFrame.framedWidget.CallingCardGrid
		end
		if f1073_local1 then
			f1073_local1:updateDataSource()
		end
	end
end

function CallingCards_SetOld( f1074_arg0, f1074_arg1 )
	local f1074_local0 = CoD.SafeGetModelValue( f1074_arg0:getModel(), "iconId" )
	if f1074_local0 then
		Engine.SetEmblemBackgroundAsOld( f1074_arg1, f1074_local0 )
		if CoD.perController[f1074_arg1].currentCallingCardTabElement then
			local f1074_local1 = Engine.GetModel( CoD.perController[f1074_arg1].currentCallingCardTabElement:getModel(), "breadcrumbCount" )
			if f1074_local1 then
				Engine.SetModelValue( f1074_local1, math.max( 0, Engine.GetModelValue( f1074_local1 ) - 1 ) )
			end
		end
		if CoD.perController[f1074_arg1].currentCallingCardBlackMarketElement then
			local f1074_local1 = Engine.GetModel( CoD.perController[f1074_arg1].currentCallingCardBlackMarketElement:getModel(), "newCount" )
			if f1074_local1 then
				Engine.SetModelValue( f1074_local1, math.max( 0, Engine.GetModelValue( f1074_local1 ) - 1 ) )
			end
		end
	end
end

function OpenEnterPrestigeModeMenu( f1075_arg0, f1075_arg1, f1075_arg2 )
	if CheckIfFeatureIsBanned( f1075_arg1, LuaEnums.FEATURE_BAN.PRESTIGE ) then
		LuaUtils.UI_ShowErrorMessageDialog( f1075_arg1, GetFeatureBanInfo( f1075_arg1, LuaEnums.FEATURE_BAN.PRESTIGE ) )
		return 
	else
		OpenSystemOverlay( f1075_arg0, f1075_arg2, f1075_arg1, "EnterPrestigeMode", nil )
	end
end

function OpenPrestigeRefundTokensMenu( f1076_arg0, f1076_arg1, f1076_arg2 )
	if CheckIfFeatureIsBanned( f1076_arg1, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) then
		LuaUtils.UI_ShowErrorMessageDialog( f1076_arg1, GetFeatureBanInfo( f1076_arg1, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) )
		return 
	else
		OpenSystemOverlay( f1076_arg0, f1076_arg2, f1076_arg1, "PrestigeRefundTokens", nil )
	end
end

function OpenPrestigeFreshStartMenu( f1077_arg0, f1077_arg1, f1077_arg2 )
	if CheckIfFeatureIsBanned( f1077_arg1, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) then
		LuaUtils.UI_ShowErrorMessageDialog( f1077_arg1, GetFeatureBanInfo( f1077_arg1, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) )
		return 
	else
		OpenSystemOverlay( f1077_arg0, f1077_arg2, f1077_arg1, "PrestigeFreshStart1", nil )
	end
end

function OpenCustomizePrestigeMenu( f1078_arg0, f1078_arg1, f1078_arg2 )
	if CheckIfFeatureIsBanned( f1078_arg1, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) then
		LuaUtils.UI_ShowErrorMessageDialog( f1078_arg1, GetFeatureBanInfo( f1078_arg1, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) )
		return 
	else
		OpenOverlay( f1078_arg0, "Prestige_CustomizePrestigeIcon", f1078_arg1, "", "" )
	end
end

function OpenPermanentUnlockMenu( f1079_arg0, f1079_arg1, f1079_arg2 )
	if CheckIfFeatureIsBanned( f1079_arg1, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) then
		LuaUtils.UI_ShowErrorMessageDialog( f1079_arg1, GetFeatureBanInfo( f1079_arg1, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) )
		return 
	else
		CoD.PrestigeUtility.previousGameMode = CoD.gameMode
		CoD.PrestigeUtility.previousStatsMilestonePath = CoD.statsMilestonePath
		CoD.gameMode = "MP"
		CoD.statsMilestonePath = "gamedata/stats/mp/statsmilestones"
		SetHeadingKickerText( "MENU_PERMANENT_UNLOCKS" )
		CoD.PrestigeUtility.CreatePermanentUnlockTokenModel( f1079_arg1 )
		local f1079_local0 = Engine.CreateModel( Engine.GetModelForController( f1079_arg1 ), "PermanentlyUnlockClass" )
		CoD.CACUtility.GetCustomClassModel( f1079_arg1, 0, f1079_local0 )
		CoD.perController[f1079_arg1].classModel = f1079_local0
		OpenOverlay( f1079_arg0, "Prestige_PermanentUnlocks", f1079_arg1 )
	end
end

function ClosePermanentUnlockMenu( f1080_arg0, f1080_arg1, f1080_arg2 )
	CoD.gameMode = CoD.PrestigeUtility.previousGameMode
	CoD.statsMilestonePath = CoD.PrestigeUtility.previousStatsMilestonePath
	SendClientScriptNotify( f1080_arg1, "CustomClass_closed" .. CoD.GetLocalClientAdjustedNum( f1080_arg1 ), "" )
	GoBack( f1080_arg0, f1080_arg1 )
end

function OpenPermanentUnlockCategoryMenu( f1081_arg0, f1081_arg1, f1081_arg2, f1081_arg3, f1081_arg4 )
	local f1081_local0 = CoD.PrestigeUtility.GetContentCategoryData( f1081_arg3 )
	CoD.perController[f1081_arg2].weaponCategory = f1081_local0.weaponCategory
	NavigateToMenu( f1081_arg0, f1081_local0.menuName, true, f1081_arg2 )
end

function SetIsInPrestigeMenu( f1082_arg0 )
	CoD.PrestigeUtility.isInPermanentUnlockMenu = f1082_arg0
end

function OpenPermanentUnlockClassItemDialog( f1083_arg0, f1083_arg1, f1083_arg2 )
	CoD.OverlayUtility.CreateOverlay( f1083_arg2, f1083_arg0, "PermanentUnlockClassItem", f1083_arg2, Engine.GetModelValue( f1083_arg1:getModel( f1083_arg2, "itemIndex" ) ), nil )
end

function OpenPrestigeMasterDialogIfNeeded( f1084_arg0, f1084_arg1 )
	if not PlayerGainedPrestigeMaster( f1084_arg1 ) then
		return 
	else
		CoD.OverlayUtility.CreateOverlay( f1084_arg1, f1084_arg0, "PrestigeMasterNotification", f1084_arg1, nil )
		Engine.Exec( f1084_arg1, "PrestigeStatsMaster " .. tostring( Enum.eModes.MODE_MULTIPLAYER ) )
		SaveLoadout( f1084_arg0, f1084_arg1 )
		Engine.Exec( f1084_arg1, "uploadstats " .. tostring( Enum.eModes.MODE_MULTIPLAYER ) )
		Engine.Exec( f1084_arg1, "savegamerprofilestats" )
	end
end

function PermanentlyUnlockItem( f1085_arg0, f1085_arg1, f1085_arg2 )
	local f1085_local0 = nil
	local f1085_local1 = f1085_arg1.itemIndex
	if not f1085_local1 then
		f1085_local0 = f1085_arg1:getModel( f1085_arg2, "itemIndex" )
		if f1085_local0 then
			f1085_local1 = Engine.GetModelValue( f1085_local0 )
		end
	end
	if f1085_local1 then
		Engine.PermanentlyUnlockItem( f1085_arg2, f1085_local1, CoD.PrestigeUtility.GetPrestigeGameMode() )
		SaveLoadout( f1085_arg0, f1085_arg2 )
		UploadStats( f1085_arg0, f1085_arg2 )
		Engine.SendClientScriptNotify( f1085_arg2, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f1085_arg2 ), "purchased" )
	end
end

function OpenAARIfNeeded( f1086_arg0, f1086_arg1 )
	if CanShowAAR( f1086_arg1 ) and IsAARValid( f1086_arg1 ) then
		local f1086_local0 = ""
		if IsCustomLobby() then
			f1086_local0 = "custom"
		elseif IsLAN() then
			f1086_local0 = "lan"
		else
			f1086_local0 = "public"
		end
		local f1086_local1 = Engine.GetMaxControllerCount()
		for self = 0, f1086_local1 - 1, 1 do
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( self ), "aarType" ), f1086_local0 )
		end
		if AutomaticallyOpenAAR( f1086_arg1 ) then
			local self = LUI.UITimer.new( 1000, "open_aar", true, f1086_arg0 )
			f1086_arg0:registerEventHandler( "open_aar", function ( element, event )
				if not CanShowAAR( f1086_arg1 ) then
					return 
				end
				Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1086_arg1 ), "doAARXPBarAnimation" ), true )
				if CoD.isZombie then
					if CoD.AARUtility.AnyRewardsEarnedDuringMatch( f1086_arg1 ) then
						OpenOverlay( element, "RewardsOverlay", f1086_arg1 )
					else
						OpenOverlay( element, "ZMAAR", f1086_arg1 )
					end
				elseif IsArenaMode() then
					OpenOverlay( element, "ArenaResult", f1086_arg1 )
				elseif CoD.AARUtility.AnyRewardsEarnedDuringMatch( f1086_arg1 ) then
					OpenPrestigeMasterDialogIfNeeded( OpenOverlay( element, "RewardsOverlay", f1086_arg1 ), f1086_arg1 )
				else
					OpenPrestigeMasterDialogIfNeeded( OpenOverlay( element, "MPAAR", f1086_arg1 ), f1086_arg1 )
				end
				local f1087_local0 = CoD.GetPlayerStats( f1086_arg1 )
				f1087_local0.AfterActionReportStats.lobbyPopup:set( "" )
			end )
			f1086_arg0:addElement( self )
		end
	else
		local f1086_local0 = LUI.UITimer.new( 1000, "open_prestigeMaster", true, f1086_arg0 )
		f1086_arg0:registerEventHandler( "open_prestigeMaster", function ( element, event )
			OpenPrestigeMasterDialogIfNeeded( element, f1086_arg1 )
		end )
		f1086_arg0:addElement( f1086_local0 )
	end
end

function OpenAAR( f1089_arg0, f1089_arg1 )
	if CoD.isZombie then
		if CoD.AARUtility.AnyRewardsEarnedDuringMatch( f1089_arg1 ) then
			OpenOverlay( f1089_arg0, "RewardsOverlay", f1089_arg1 )
		else
			OpenOverlay( f1089_arg0, "ZMAAR", f1089_arg1 )
		end
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1089_arg1 ), "doAARXPBarAnimation" ), true )
		if IsArenaMode() then
			OpenOverlay( f1089_arg0, "ArenaResult", f1089_arg1 )
		elseif CoD.AARUtility.AnyRewardsEarnedDuringMatch( f1089_arg1 ) then
			OpenOverlay( f1089_arg0, "RewardsOverlay", f1089_arg1 )
		else
			OpenOverlay( f1089_arg0, "MPAAR", f1089_arg1 )
		end
	end
end

function SetStableStatsBuffer( f1090_arg0 )
	Engine.MakeStableStatsBufferForController( f1090_arg0 )
end

function SurveyShouldShow( f1091_arg0 )
	local f1091_local0 = CoD.GetPlayerStats( f1091_arg0 )
	local f1091_local1 = tonumber( f1091_local0.AfterActionReportStats.surveyId:get() )
	if tonumber( f1091_local0.AfterActionReportStats.demoFileID:get() ) == 0 then
		return false
	elseif f1091_local1 == 0 then
		return false
	else
		return true
	end
end

function GoBackAndShowMatchSurveyIfNecessary( f1092_arg0, f1092_arg1 )
	local f1092_local0 = GoBack( f1092_arg0, f1092_arg1 )
	local f1092_local1 = Engine.CreateModel( Engine.GetModelForController( f1092_arg1 ), "lobbyRoot.showPostMatchSurvey" )
	if Engine.GetModelValue( f1092_local1 ) == true and SurveyShouldShow( f1092_arg1 ) == true then
		Engine.SetModelValue( f1092_local1, false )
		CoD.OverlayUtility.CreateOverlay( f1092_arg1, f1092_local0, "PostMatchSurvey" )
	end
end

function CloseCPAAR( f1093_arg0, f1093_arg1 )
	if CoD.AARUtilityCP ~= nil then
		CoD.AARUtilityCP.lastMapName = Dvar.ui_mapname:get()
	end
	CoD.perController[f1093_arg1].fromMaxLevelMessage = false
end

function OpenMOTDPopup( f1094_arg0, f1094_arg1, f1094_arg2, f1094_arg3, f1094_arg4 )
	if f1094_arg3 ~= nil then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1094_arg2 ), "MOTDMenu.ActionSource" ), f1094_arg3 )
	end
	local f1094_local0 = f1094_arg4:openOverlay( "MOTD", f1094_arg2 )
	local f1094_local1 = Engine.GetModel( Engine.GetGlobalModel(), "MtxCommsMOTD" )
	if f1094_local1 then
		f1094_local0.crm_message_id = Engine.GetModelValue( Engine.GetModel( f1094_local1, "messageID" ) )
		if not ShouldPresentRegistration( f1094_arg2 ) and not ShouldPresentMOTDBanner( f1094_arg2, f1094_local0 ) then
			f1094_local0.motdFooter:close()
		end
	end
end

function MOTDPopupAcceptAction( f1095_arg0, f1095_arg1, f1095_arg2, f1095_arg3, f1095_arg4 )
	local f1095_local0 = "motd"
	Engine.ReportMarketingMessageViewed( f1095_arg2, f1095_local0 )
	LUI.CoDMetrics.CRMMessageImpression( f1095_arg0, f1095_arg2, f1095_local0 )
	if Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f1095_arg2 ), "MOTDMenu.ActionSource" ) ) == "FeaturedWidget" then
		GoBack( f1095_arg4, f1095_arg2 )
		return 
	elseif LuaUtils.IsBetaBuild() then
		if IsFirstTimeSetup( f1095_arg2, Enum.eModes.MODE_MULTIPLAYER ) then
			OpenMPFirstTimeFlow( f1095_arg0, nil, f1095_arg2, nil, f1095_arg0 )
		else
			NavigateToLobby_FirstTimeFlowMP( f1095_arg0, nil, f1095_arg2, f1095_arg4 )
		end
	else
		NavigateToLobby( f1095_arg0, "ModeSelect", false, f1095_arg2 )
	end
	SendClientScriptMenuChangeNotify( f1095_arg2, f1095_arg4, false )
	Close( f1095_arg0, f1095_arg2 )
end

function BubbleGumBuffSelectTabChanged( f1096_arg0, f1096_arg1, f1096_arg2 )
	local f1096_local0 = f1096_arg1.filter
	CoD.perController[f1096_arg2].weaponCategory = f1096_local0
	DataSources.Unlockables.setCurrentFilterItem( f1096_local0 )
	f1096_arg0.selectionList:updateDataSource()
end

function EquipBubblegumPack( f1097_arg0, f1097_arg1, f1097_arg2 )
	Engine.EquipBubbleGumPack( f1097_arg2, Engine.GetModelValue( f1097_arg1:getModel( f1097_arg2, "bgbPackIndex" ) ) )
end

function EquipBubblegumBuff( f1098_arg0, f1098_arg1, f1098_arg2 )
	local f1098_local0 = Engine.GetEquippedBubbleGumPack( f1098_arg2 )
	local f1098_local1 = CoD.perController[f1098_arg2].bgbIndex
	local f1098_local2 = Engine.GetModelValue( f1098_arg1:getModel( f1098_arg2, "itemIndex" ) )
	local f1098_local3, f1098_local4 = nil
	for f1098_local5 = 0, CoD.BubbleGumBuffs.NumBuffsPerPack - 1, 1 do
		if Engine.GetBubbleGumBuff( f1098_arg2, f1098_local0, f1098_local5 ) == f1098_local2 then
			f1098_local4 = f1098_local5
			f1098_local3 = Engine.GetBubbleGumBuff( f1098_arg2, f1098_local0, f1098_local1 )
			break
		end
	end
	Engine.SetBubbleGumBuff( f1098_arg2, f1098_local0, f1098_local1, f1098_local2 )
	if f1098_local4 then
		Engine.SetBubbleGumBuff( f1098_arg2, f1098_local0, f1098_local4, f1098_local3 )
	end
end

function ShowBubblegumBuffModel( f1099_arg0, f1099_arg1, f1099_arg2 )
	local f1099_local0 = Engine.GetModelValue( f1099_arg1:getModel( f1099_arg2, "itemIndex" ) )
	Engine.SendClientScriptNotify( f1099_arg2, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f1099_arg2 ), Engine.GetItemGroup( f1099_local0, Enum.eModes.MODE_ZOMBIES ), "p7_" .. Engine.GetItemRef( f1099_local0, Enum.eModes.MODE_ZOMBIES ) .. "_ui", "select01", nil, nil, not IsCACItemLocked( f1099_arg0, f1099_arg1, f1099_arg2 ), not IsCACItemPurchased( f1099_arg1, f1099_arg2 ) )
end

function SelectBubblegumBuff( f1100_arg0, f1100_arg1, f1100_arg2 )
	CoD.perController[f1100_arg2].bgbIndex = Engine.GetModelValue( f1100_arg1:getModel( f1100_arg2, "bgbIndex" ) )
end

function SetBubbleGumPackNameFromPackIndex( f1101_arg0, f1101_arg1, f1101_arg2 )
	return Engine.SetBubbleGumPackName( f1101_arg0, f1101_arg1, f1101_arg2 )
end

function MegaChewFactoryFocusChanged( f1102_arg0, f1102_arg1, f1102_arg2 )
	local f1102_local0 = f1102_arg1:getModel( f1102_arg2, "index" )
	if f1102_local0 then
		Engine.SendClientScriptNotify( f1102_arg2, "mega_chew_update", "focus_changed", Engine.GetModelValue( f1102_local0 ) )
	end
end

function MegaChewFactoryMachineSelect( f1103_arg0, f1103_arg1, f1103_arg2 )
	PlaySoundAlias( "uin_bm_denied" )
	LuaUtils.UI_ShowInfoMessageDialog( f1103_arg2, Engine.Localize( "MENU_BGB_FACTORY_ERR_INSUFFICIENT_FUNDS" ) )
end

function MegaChewFactoryPurchase( f1104_arg0, f1104_arg1, f1104_arg2 )
	local f1104_local0 = f1104_arg1:getModel( f1104_arg2, "price" )
	local f1104_local1 = Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f1104_arg2 ), "MegaChewFactory" ), "getResultsOrKeepWaiting" )
	if f1104_local0 and f1104_local1 then
		if not Engine.SpendZMVials( f1104_arg2, Engine.GetModelValue( f1104_local0 ) ) then
			PlaySoundAlias( "uin_bm_denied" )
			LuaUtils.UI_ShowErrorMessageDialog( f1104_arg2, Engine.Localize( "MENU_BGB_FACTORY_ERR_NO_RESULT" ) )
			return 
		end
		Engine.SetModelValue( f1104_local1, 1 )
		Engine.SendClientScriptNotify( f1104_arg2, "mega_chew_update", "purchased", Engine.GetModelValue( f1104_local0 ) )
	end
end

function FocusWeaponBuildKit( f1105_arg0, f1105_arg1, f1105_arg2 )
	Gunsmith_GainFocus( f1105_arg0, f1105_arg1, f1105_arg2 )
	local f1105_local0 = CoD.GetCustomization( f1105_arg2, "weapon_index" )
	if not f1105_local0 then
		return 
	else
		local f1105_local1 = CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList( f1105_local0 )
		local f1105_local2 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f1105_arg2, f1105_local1[#f1105_local1].variantIndex )
		local f1105_local3 = Engine.CreateModel( Engine.GetModelForController( f1105_arg2 ), "WeaponBuildKitVariant" )
		DataSources.GunsmithVariantList.createVariantModel( f1105_arg2, f1105_local0, f1105_local2, 1, f1105_local3 )
		CoD.perController[f1105_arg2].gunsmithVariantModel = f1105_local3
		CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f1105_arg2, CoD.perController[f1105_arg2].gunsmithVariantModel )
		f1105_arg0:setModel( f1105_local3 )
		f1105_arg0.WeaponBuildKitsAttachmentsPreview:processEvent( {
			name = "update_state",
			controller = f1105_arg2
		} )
	end
end

function SelectWeaponBuildKitCategory( f1106_arg0, f1106_arg1 )
	local f1106_local0 = Engine.GetModel( f1106_arg0:getModel(), "categoryRef" )
	if f1106_local0 then
		local f1106_local1 = Engine.GetModelValue( f1106_local0 )
		DataSources.Unlockables.setCurrentFilterItem( f1106_local1 )
		CoD.perController[f1106_arg1].weaponCategory = f1106_local1
	end
end

function SelectWeaponBuildKit( f1107_arg0, f1107_arg1, f1107_arg2 )
	Gunsmith_BrowseVariants( f1107_arg0, f1107_arg1, f1107_arg2 )
	local f1107_local0 = CoD.GetCustomization( f1107_arg2, "weapon_index" )
	if not f1107_local0 then
		return 
	end
	local f1107_local1 = CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList( f1107_local0 )
	local f1107_local2 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f1107_arg2, f1107_local1[#f1107_local1].variantIndex )
	local f1107_local3 = Engine.CreateModel( Engine.GetModelForController( f1107_arg2 ), "WeaponBuildKitVariant" )
	DataSources.GunsmithVariantList.createVariantModel( f1107_arg2, f1107_local0, f1107_local2, 1, f1107_local3 )
	CoD.perController[f1107_arg2].gunsmithVariantModel = f1107_local3
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f1107_arg2, CoD.perController[f1107_arg2].gunsmithVariantModel )
	if not CoD.CraftUtility.Gunsmith.IsVariantIndexOccupied( f1107_local2.variantIndex ) then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1107_arg2 ), "Gunsmith.validVariantNameEntered" ), false )
		local f1107_local4 = Engine.GetModel( f1107_local3, "variantTextEntry" )
		if f1107_local4 then
			Engine.SetModelValue( f1107_local4, "" )
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1107_arg2 ), "Gunsmith.validVariantNameEntered" ), true )
		end
		Engine.SetModelValue( Engine.GetModel( f1107_local3, "variantName" ), Engine.GetModelValue( f1107_local4 ) )
	end
	OpenOverlay( f1107_arg0, "WeaponBuildKitsCustomizeVariant", f1107_arg2 )
	Gunsmith_ChooseWeaponList( f1107_arg0, f1107_arg1, f1107_arg2 )
end

function SaveWeaponBuildKit( f1108_arg0, f1108_arg1, f1108_arg2 )
	local f1108_local0 = CoD.perController[f1108_arg2].gunsmithVariantModel
	CoD.CraftUtility.Gunsmith.WriteVaraintDataToDDL( f1108_arg2, f1108_arg0:getModel() )
	local f1108_local1 = f1108_arg0
	local f1108_local2 = GoBackAndUpdateStateOnPreviousMenu( f1108_local1, f1108_arg2 )
	ClearMenuSavedState( f1108_local1 )
	local f1108_local3 = Engine.GetModelValue( Engine.GetModel( f1108_local0, "variantIndex" ) )
	f1108_local2.variantSelector.variantList:updateDataSource( true )
	f1108_local2.variantSelector.variantList:findItem( {
		variantIndex = f1108_local3
	}, nil, true, nil )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f1108_arg2, f1108_local0 )
end

function SetMap( f1109_arg0, f1109_arg1, f1109_arg2 )
	local f1109_local0 = CoD.mapsTable[f1109_arg1]
	if f1109_local0 == nil then
		f1109_arg1 = LuaUtils.GetDefaultMap( LobbyData.GetCurrentMenuTarget() )
		f1109_local0 = CoD.mapsTable[f1109_arg1]
	end
	if f1109_arg2 then
		Engine.SetDvar( "cp_queued_level", f1109_arg1 )
		if f1109_local0.safeHouse then
			f1109_arg1 = f1109_local0.safeHouse
		end
	end
	Engine.GameLobbySetMap( f1109_arg1 )
	if IsFreeRunMap( f1109_arg1 ) then
		Engine.SetProfileVar( f1109_arg0, CoD.profileKey_map_fr, f1109_arg1 )
	else
		Engine.SetProfileVar( f1109_arg0, CoD.profileKey_map, f1109_arg1 )
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.selectedMapId" ), f1109_arg1 )
	Engine.CommitProfileChanges( f1109_arg0 )
end

function MapSelected( f1110_arg0, f1110_arg1 )
	SetMap( f1110_arg1, f1110_arg0.mapName, false )
end

function GameModeSelected( f1111_arg0, f1111_arg1 )
	Engine.Exec( f1111_arg1, "resetCustomGametype" )
	local f1111_local0 = CoDShared.IsGametypeTeamBased()
	Engine.SetGametype( f1111_arg0.gametype )
	if f1111_local0 ~= CoDShared.IsGametypeTeamBased() then
		Engine.SetDvar( "bot_friends", 0 )
		Engine.SetDvar( "bot_enemies", 0 )
	end
	Engine.Exec( f1111_arg1, "xupdatepartystate" )
	Engine.SetProfileVar( f1111_arg1, CoD.profileKey_gametype, f1111_arg0.gametype )
	Engine.PartyHostClearUIState()
	Engine.CommitProfileChanges( f1111_arg1 )
	Engine.SystemNeedsUpdate( nil, "lobby" )
	Engine.Exec( f1111_arg1, "lobby_setgametype " .. f1111_arg0.gametype )
	Engine.LobbyVM_CallFunc( "OnGametypeSettingsChange", {
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyModule = Enum.LobbyModule.LOBBY_MODULE_HOST
	} )
end

function PlaylistSelected( f1112_arg0, f1112_arg1, f1112_arg2 )
	local f1112_local0 = CoD.PlaylistCategoryFilter or ""
	Engine.SetPlaylistID( f1112_arg1.playlist.index )
	Engine.SetProfileVar( f1112_arg2, "playlist_" .. f1112_local0, tostring( f1112_arg1.playlist.index ) )
	Engine.PartyHostClearUIState()
	CoD.LobbyBase.SetPlaylistName( f1112_arg1.playlist.name )
	local f1112_local1 = f1112_arg0.occludedMenu
	GoBack( f1112_arg0, f1112_arg2 )
	if f1112_local1 then
		f1112_local1:processEvent( {
			name = "playlist_selected",
			controller = f1112_arg2,
			itemInfo = f1112_arg1.playlist
		} )
	end
end

function PlaylistCategorySelected( f1113_arg0, f1113_arg1, f1113_arg2 )
	SetElementPropertyOnPerControllerTable( f1113_arg2, "playlistCategory", f1113_arg1, "category" )
	UpdateElementDataSource( f1113_arg0, "playlistList" )
	SetMenuState( f1113_arg0, "SelectingPlaylist" )
	SetLoseFocusToElement( f1113_arg0, "playlistCategoriesList", f1113_arg2 )
	MakeElementNotFocusable( f1113_arg0, "playlistCategoriesList", f1113_arg2 )
	MakeElementFocusable( f1113_arg0, "playlistList", f1113_arg2 )
	SetFocusToElement( f1113_arg0, "playlistList", f1113_arg2 )
end

function BlockGameFromKeyEvent( f1114_arg0 )
	Engine.BlockGameFromKeyEvent()
end

function ToggleScoreboardClientMute( f1115_arg0, f1115_arg1 )
	Engine.BlockGameFromKeyEvent()
	local f1115_local0 = f1115_arg0:getModel( f1115_arg1, "clientNum" )
	if not f1115_local0 then
		return 
	end
	local f1115_local1 = Engine.GetModelValue( f1115_local0 )
	if f1115_local1 and f1115_local1 >= 0 and Engine.GetClientNum( f1115_arg1 ) ~= f1115_local1 then
		Engine.TogglePlayerMute( f1115_arg1, f1115_local1 )
		UpdateScoreboardClientMuteButtonPrompt( f1115_arg0, f1115_arg1 )
	end
end

function UpdateScoreboardClientMuteButtonPrompt( f1116_arg0, f1116_arg1 )
	local f1116_local0 = f1116_arg0:getModel( f1116_arg1, "clientNum" )
	if not f1116_local0 then
		return 
	end
	local f1116_local1 = Engine.GetModelValue( f1116_local0 )
	local f1116_local2 = Engine.CreateModel( Engine.GetModelForController( f1116_arg1 ), "scoreboardInfo.muteButtonPromptVisible" )
	local f1116_local3 = Engine.CreateModel( Engine.GetModelForController( f1116_arg1 ), "scoreboardInfo.muteButtonPromptText" )
	Engine.SetModelValue( f1116_local2, false )
	if f1116_local1 and f1116_local1 >= 0 then
		if Engine.GetClientNum( f1116_arg1 ) == f1116_local1 then
			return 
		end
		Engine.SetModelValue( f1116_local2, true )
		if Engine.IsPlayerMutedByClientNum( f1116_arg1, Enum.LobbyType.LOBBY_TYPE_GAME, f1116_local1 ) then
			Engine.SetModelValue( f1116_local3, "MENU_UNMUTE_CAPS" )
		else
			Engine.SetModelValue( f1116_local3, "MENU_MUTE_CAPS" )
		end
	end
end

function ShowGamerCardForScoreboardRow( f1117_arg0, f1117_arg1 )
	local f1117_local0 = CoD.SafeGetModelValue( f1117_arg1:getModel(), "clientNum" )
	if not Engine.IsVisibilityBitSet( f1117_arg0, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
		return 
	else
		Engine.ShowGamerCard( f1117_arg0, f1117_local0 )
	end
end

function ShowAccountPicker( f1118_arg0 )
	Engine.ShowAccountPicker( f1118_arg0 )
end

function AdjustBrightness( f1119_arg0, f1119_arg1 )
	local f1119_local0 = f1119_arg0:getModel( f1119_arg1, "value" )
	if f1119_local0 then
		Engine.SetProfileVar( f1119_arg1, "r_sceneBrightness", Engine.GetModelValue( f1119_local0 ) )
		Engine.Exec( f1119_arg1, "updategamerprofile" )
	end
end

function AddToPlayerInventory( f1120_arg0, f1120_arg1, f1120_arg2 )
	local f1120_local0 = f1120_arg1:getModel( f1120_arg2, "skuId" )
	if f1120_local0 then
		Engine.AddItemToInventory( f1120_arg2, Engine.GetModelValue( f1120_local0 ) )
		if Engine.GetMarketplaceSize() == 0 then
			f1120_arg0.MarketplaceList:processEvent( {
				name = "lose_focus",
				controller = f1120_arg2
			} )
			f1120_arg0.PlayerInventoryList:processEvent( {
				name = "gain_focus",
				controller = f1120_arg2
			} )
		end
	end
end

function RemoveFromPlayerInventory( f1121_arg0, f1121_arg1, f1121_arg2 )
	local f1121_local0 = f1121_arg1:getModel( f1121_arg2, "itemId" )
	if f1121_local0 then
		Engine.RemoveItemFromInventory( f1121_arg2, Engine.GetModelValue( f1121_local0 ), 1 )
		if Engine.GetPlayerInventorySize( f1121_arg2 ) == 0 then
			f1121_arg0.MarketplaceList:processEvent( {
				name = "gain_focus",
				controller = f1121_arg2
			} )
			f1121_arg0.PlayerInventoryList:processEvent( {
				name = "lose_focus",
				controller = f1121_arg2
			} )
		end
	end
end

function ReportItemUsageTime( f1122_arg0, f1122_arg1, f1122_arg2 )
	Engine.ReportItemUsageTime( f1122_arg2, 10 )
end

function AccountLink_SetAccountLinkViewed( f1123_arg0, f1123_arg1, f1123_arg2 )
	Engine.SetAccountLinkViewed( f1123_arg2, true )
end

function AccountLink_HandleLoginKeyboardComplete( f1124_arg0, f1124_arg1, f1124_arg2, f1124_arg3 )
	local f1124_local0 = Engine.GetModel( Engine.GetGlobalModel(), "AccountLinkLogin" )
	local f1124_local1, f1124_local2 = nil
	if not f1124_local0 then
		return 
	elseif f1124_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_EMAIL then
		f1124_local1 = Engine.GetModel( f1124_local0, "email" )
	end
	if f1124_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_PASSWORD then
		f1124_local2 = Engine.GetModel( f1124_local0, "password" )
	end
	if f1124_local1 then
		Engine.SetModelValue( f1124_local1, f1124_arg3.input )
	end
	if f1124_local2 then
		Engine.SetModelValue( f1124_local2, f1124_arg3.input )
		local f1124_local3 = ""
		for f1124_local4 = 0, string.len( f1124_arg3.input ) - 1, 1 do
			local f1124_local7 = f1124_local4
			f1124_local3 = f1124_local3 .. "*"
		end
		Engine.SetModelValue( Engine.GetModel( f1124_local0, "stars" ), f1124_local3 )
	end
end

function AccountLink_Login( f1125_arg0, f1125_arg1, f1125_arg2 )
	local f1125_local0 = GoBack( f1125_arg0, f1125_arg2 )
	local f1125_local1 = f1125_local0:openOverlay( "Spinner", f1125_arg2 )
	f1125_local1:registerEventHandler( "optin_success", function ( element, event )
		CoD.OverlayUtility.CreateOverlay( f1125_arg2, element, "OptInSuccess" )
		element:close()
	end )
	f1125_local1:registerEventHandler( "registration_failure", function ( element, event, f1127_arg2 )
		FinishRegistrationFlow( element, f1125_arg2, element )
	end )
	local f1125_local2 = Engine.GetModel( Engine.GetGlobalModel(), "AccountLinkLogin" )
	Engine.AccountLinkLogin( f1125_arg2, tostring( Engine.GetModelValue( Engine.GetModel( f1125_local2, "email" ) ) ), tostring( Engine.GetModelValue( Engine.GetModel( f1125_local2, "password" ) ) ) )
end

function AccountLink_HandleRegisterKeyboardComplete( f1128_arg0, f1128_arg1, f1128_arg2, f1128_arg3 )
	local f1128_local0 = Engine.GetModel( Engine.GetModelForController( f1128_arg2 ), "AccountLinkRegister" )
	local f1128_local1, f1128_local2, f1128_local3, f1128_local4, f1128_local5, f1128_local6, f1128_local7 = nil
	if not f1128_local0 then
		return 
	elseif f1128_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_FIRST_NAME then
		f1128_local1 = Engine.GetModel( f1128_local0, "firstName" )
		if f1128_local1 then
			Engine.SetModelValue( f1128_local1, f1128_arg3.input )
		end
	end
	if f1128_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_LAST_NAME then
		f1128_local2 = Engine.GetModel( f1128_local0, "lastName" )
		if f1128_local2 then
			Engine.SetModelValue( f1128_local2, f1128_arg3.input )
		end
	end
	if f1128_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_ZIP_CODE then
		f1128_local3 = Engine.GetModel( f1128_local0, "zipCode" )
		if f1128_local3 then
			Engine.SetModelValue( f1128_local3, f1128_arg3.input )
		end
	end
	if f1128_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_USERNAME then
		f1128_local4 = Engine.GetModel( f1128_local0, "username" )
		if f1128_local4 then
			Engine.SetModelValue( f1128_local4, f1128_arg3.input )
		end
	end
	if f1128_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_EMAIL then
		f1128_local5 = Engine.GetModel( f1128_local0, "email" )
		if f1128_local5 then
			Engine.SetModelValue( f1128_local5, f1128_arg3.input )
		end
	end
	if f1128_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_PASSWORD then
		f1128_local6 = Engine.GetModel( f1128_local0, "password" )
		if f1128_local6 then
			Engine.SetModelValue( f1128_local6, f1128_arg3.input )
			local f1128_local8 = ""
			for f1128_local9 = 0, string.len( f1128_arg3.input ) - 1, 1 do
				local f1128_local12 = f1128_local9
				f1128_local8 = f1128_local8 .. "*"
			end
			Engine.SetModelValue( Engine.GetModel( f1128_local0, "stars" ), f1128_local8 )
		end
	end
	if f1128_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_CONFIRM_PASSWORD then
		f1128_local7 = Engine.GetModel( f1128_local0, "confirmPass" )
		if f1128_local7 then
			Engine.SetModelValue( f1128_local7, f1128_arg3.input )
			local f1128_local8 = ""
			for f1128_local9 = 0, string.len( f1128_arg3.input ) - 1, 1 do
				local f1128_local12 = f1128_local9
				f1128_local8 = f1128_local8 .. "*"
			end
			Engine.SetModelValue( Engine.GetModel( f1128_local0, "confirmStars" ), f1128_local8 )
		end
	end
end

function AccountLink_SelectRegion( f1129_arg0, f1129_arg1, f1129_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f1129_arg2 ), "AccountLinkRegister" ), "region" ), Engine.GetModelValue( f1129_arg1:getModel( f1129_arg2, "itemName" ) ) )
end

function AccountLink_SelectGender( f1130_arg0, f1130_arg1, f1130_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f1130_arg2 ), "AccountLinkRegister" ), "gender" ), Engine.GetModelValue( f1130_arg1:getModel( f1130_arg2, "gender" ) ) )
end

function AccountLink_SelectMonth( f1131_arg0, f1131_arg1, f1131_arg2 )
	local f1131_local0 = Engine.GetModelValue( f1131_arg1:getModel( f1131_arg2, "month" ) )
	local f1131_local1 = Engine.GetModelValue( f1131_arg1:getModel( f1131_arg2, "monthIndex" ) )
	local f1131_local2 = Engine.GetModel( Engine.GetModelForController( f1131_arg2 ), "AccountLinkRegister" )
	Engine.SetModelValue( Engine.GetModel( f1131_local2, "month" ), f1131_local0 )
	Engine.SetModelValue( Engine.GetModel( f1131_local2, "monthIndex" ), f1131_local1 )
end

function AccountLink_SelectDay( f1132_arg0, f1132_arg1, f1132_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f1132_arg2 ), "AccountLinkRegister" ), "day" ), Engine.GetModelValue( f1132_arg1:getModel( f1132_arg2, "day" ) ) )
end

function AccountLink_SelectYear( f1133_arg0, f1133_arg1, f1133_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f1133_arg2 ), "AccountLinkRegister" ), "year" ), Engine.GetModelValue( f1133_arg1:getModel( f1133_arg2, "year" ) ) )
end

function AccountLink_Register( f1134_arg0, f1134_arg1, f1134_arg2 )
	local f1134_local0 = Engine.GetModel( Engine.GetModelForController( f1134_arg2 ), "AccountLinkRegister" )
	local f1134_local1 = Engine.GetModelValue( Engine.GetModel( f1134_local0, "firstName" ) )
	local f1134_local2 = Engine.GetModelValue( Engine.GetModel( f1134_local0, "lastName" ) )
	local f1134_local3 = Engine.GetModelValue( Engine.GetModel( f1134_local0, "zipCode" ) )
	local f1134_local4 = Engine.GetModelValue( Engine.GetModel( f1134_local0, "region" ) )
	local f1134_local5 = Engine.GetModelValue( Engine.GetModel( f1134_local0, "username" ) )
	local f1134_local6 = Engine.GetModelValue( Engine.GetModel( f1134_local0, "email" ) )
	local f1134_local7 = Engine.GetModelValue( Engine.GetModel( f1134_local0, "password" ) )
	local f1134_local8 = Engine.GetModelValue( Engine.GetModel( f1134_local0, "confirmPass" ) )
	local f1134_local9 = Engine.GetModelValue( Engine.GetModel( f1134_local0, "gender" ) )
	local f1134_local10 = Engine.GetModelValue( Engine.GetModel( f1134_local0, "monthIndex" ) )
	local f1134_local11 = Engine.GetModelValue( Engine.GetModel( f1134_local0, "day" ) )
	local f1134_local12 = Engine.GetModelValue( Engine.GetModel( f1134_local0, "year" ) )
	local f1134_local13 = {
		firstName = tostring( f1134_local1 ),
		lastName = tostring( f1134_local2 ),
		zipCode = tostring( f1134_local3 ),
		region = tostring( f1134_local4 ),
		username = tostring( f1134_local5 ),
		email = tostring( f1134_local6 ),
		password = tostring( f1134_local7 ),
		confirmPass = tostring( f1134_local8 ),
		gender = tostring( f1134_local9 ),
		month = f1134_local10,
		day = f1134_local11,
		year = f1134_local12
	}
	if f1134_local1 == nil then
		OpenGenericSmallPopup( f1134_arg0, f1134_arg2, "Please enter a valid first name", "Specific Name Constriants Here.", nil, "MENU_OK" )
		return 
	elseif f1134_local2 == nil then
		OpenGenericSmallPopup( f1134_arg0, f1134_arg2, "Please enter a valid last name", "Specific Name Constriants Here.", nil, "MENU_OK" )
		return 
	elseif f1134_local4 == nil then
		OpenGenericSmallPopup( f1134_arg0, f1134_arg2, "Please select a region", "Please select a region", nil, "MENU_OK" )
		return 
	elseif f1134_local3 == nil or string.len( f1134_local3 ) ~= 5 then
		OpenGenericSmallPopup( f1134_arg0, f1134_arg2, "Please enter a valid zip code", "Specific Zip Code Constriants Here.", nil, "MENU_OK" )
		return 
	elseif f1134_local5 == nil then
		OpenGenericSmallPopup( f1134_arg0, f1134_arg2, "Please enter a valid username", "Specific Username Constriants Here.", nil, "MENU_OK" )
		return 
	elseif f1134_local7 == nil then
		OpenGenericSmallPopup( f1134_arg0, f1134_arg2, "Please enter a valid password", "Specific Password Constriants Here.", nil, "MENU_OK" )
		return 
	elseif f1134_local8 == nil or f1134_local7 ~= f1134_local8 then
		OpenGenericSmallPopup( f1134_arg0, f1134_arg2, "Please confirm your password", "Please confirm your password.", nil, "MENU_OK" )
		return 
	elseif f1134_local9 == nil then
		OpenGenericSmallPopup( f1134_arg0, f1134_arg2, "Please select a gender", "Please select a gender.", nil, "MENU_OK" )
		return 
	elseif f1134_local10 == nil then
		OpenGenericSmallPopup( f1134_arg0, f1134_arg2, "Please select a month", "Please select a month.", nil, "MENU_OK" )
		return 
	elseif f1134_local11 == nil then
		OpenGenericSmallPopup( f1134_arg0, f1134_arg2, "Please select a day", "Please select a day.", nil, "MENU_OK" )
		return 
	elseif f1134_local12 == nil then
		OpenGenericSmallPopup( f1134_arg0, f1134_arg2, "Please select a year", "Please select a year.", nil, "MENU_OK" )
		return 
	else
		Engine.AccountLinkRegister( f1134_arg2, f1134_local13 )
	end
end

function OpenRegistrationFlow( f1135_arg0, f1135_arg1, f1135_arg2, f1135_arg3 )
	if Dvar.live_useInGameRegistration:exists() and Dvar.live_useInGameRegistration:get() then
		local f1135_local0 = Engine.GetMarketingMessage( f1135_arg2, "registration" )
		local f1135_local1 = nil
		if f1135_local0 == nil then
			f1135_local0 = Engine.GetMarketingMessage( f1135_arg2, "motd" )
			if f1135_local0 ~= nil and f1135_local0.bannerAction ~= nil then
				f1135_local1 = f1135_local0.bannerAction
			end
		elseif f1135_local0.action ~= nil then
			f1135_local1 = f1135_local0.action
		end
		if f1135_local1 ~= nil then
			if f1135_local1 == "registration" then
				local f1135_local2 = GoBack( f1135_arg0, f1135_arg2 )
				local f1135_local3 = f1135_local2:openOverlay( "InGameRegistration", f1135_arg2 )
				f1135_local3.crm_message_id = f1135_local0.messageID
				LUI.CoDMetrics.CRMMessageInteraction( f1135_arg0, f1135_arg2, "registration" )
			elseif f1135_local1 == "opt-in" then
				local f1135_local2 = GoBack( f1135_arg0, f1135_arg2 )
				local f1135_local3 = f1135_local2:openOverlay( "InGameOptIn", f1135_arg2 )
				f1135_local3.crm_message_id = f1135_local0.messageID
				LUI.CoDMetrics.CRMMessageInteraction( f1135_arg0, f1135_arg2, "registration" )
			elseif f1135_local1 == "store" then
				local f1135_local2 = GoBack( f1135_arg0, f1135_arg2 )
				if CoD.isPC then
					OpenSteamStore( f1135_arg0, f1135_arg1, f1135_arg2, f1135_local2.name, f1135_local2 )
				else
					OpenStore( f1135_arg0, f1135_arg1, f1135_arg2, f1135_local2.name, f1135_local2 )
				end
			end
		end
	end
end

function OpenRegistrationBrowser( f1136_arg0, f1136_arg1, f1136_arg2, f1136_arg3 )
	local f1136_local0 = GoBack( f1136_arg0, f1136_arg2 )
	local f1136_local1 = f1136_local0:openOverlay( "Spinner", f1136_arg2 )
	f1136_local1:registerEventHandler( "registration_success", function ( element, event )
		CoD.OverlayUtility.CreateOverlay( f1136_arg2, element, "RegistrationSuccess" )
		element:close()
	end )
	f1136_local1:registerEventHandler( "registration_failure", function ( element, event, f1138_arg2 )
		FinishRegistrationFlow( element, f1136_arg2, element )
	end )
	Engine.OpenRegistrationBrowser( f1136_arg2 )
end

function OptInToEmailMarketing( f1139_arg0, f1139_arg1, f1139_arg2, f1139_arg3 )
	local f1139_local0 = GoBack( f1139_arg0, f1139_arg2 )
	local f1139_local1 = f1139_local0:openOverlay( "Spinner", f1139_arg2 )
	f1139_local1:registerEventHandler( "optin_success", function ( element, event )
		CoD.OverlayUtility.CreateOverlay( f1139_arg2, element, "OptInSuccess" )
		element:close()
	end )
	f1139_local1:registerEventHandler( "registration_failure", function ( element, event, f1141_arg2 )
		FinishRegistrationFlow( element, f1139_arg2, element )
	end )
	Engine.OptInToEmailMarketing( f1139_arg2 )
end

function FinishRegistrationFlow( f1142_arg0, f1142_arg1, f1142_arg2 )
	local f1142_local0 = "registration"
	Engine.ReportMarketingMessageViewed( f1142_arg1, f1142_local0 )
	LUI.CoDMetrics.CRMMessageImpression( f1142_arg0, f1142_arg1, f1142_local0 )
	if Dvar.ui_execdemo_beta:get() then
		if IsFirstTimeSetup( f1142_arg1, Enum.eModes.MODE_MULTIPLAYER ) then
			OpenMPFirstTimeFlow( f1142_arg0, nil, f1142_arg1, nil, f1142_arg2 )
		else
			local f1142_local1 = LobbyData:GetCurrentMenuTarget()
			if f1142_local1.id == LobbyData.UITargets.UI_MAIN.id then
				NavigateToLobby_FirstTimeFlowMP( f1142_arg0, nil, f1142_arg1, f1142_arg2 )
			else
				GoBackToMenu( f1142_arg2, f1142_arg1, "Lobby" )
			end
		end
	else
		NavigateToLobby( f1142_arg0, "ModeSelect", false, f1142_arg1 )
	end
	SendClientScriptMenuChangeNotify( f1142_arg1, f1142_arg2, false )
	Close( f1142_arg0, f1142_arg1 )
end

function ChatClientEntriesFocused( f1143_arg0, f1143_arg1, f1143_arg2 )
	local f1143_local0 = Engine.ChatClient_InputChannelGet( f1143_arg2 )
end

function ChatClientInputStart( f1144_arg0, f1144_arg1, f1144_arg2, f1144_arg3 )
	if not ChatClientIsAvailable( f1144_arg0, f1144_arg1, f1144_arg2 ) then
		return 
	else
		ChatClientInputChannelSet( f1144_arg0, f1144_arg1, f1144_arg2, f1144_arg3 )
		Engine.ChatClient_InputStart( f1144_arg2 )
	end
end

function ChatClientInputChannelSet( f1145_arg0, f1145_arg1, f1145_arg2, f1145_arg3 )
	local f1145_local0 = CoD.ChatClientUtility.GetChannelFromString( f1145_arg3 )
	if f1145_local0 ~= nil then
		Engine.ChatClient_InputChannelSet( f1145_arg2, f1145_local0 )
	end
end

function ChatClientResetSubMenus( f1146_arg0, f1146_arg1, f1146_arg2 )
	CoD.ChatClientUtility.ResetSettingsMenu()
	CoD.ChatClientUtility.ResetInputChannelSelectorMenu()
end

function ChatClientHandleEscape( f1147_arg0, f1147_arg1, f1147_arg2 )
	if not IsPrimaryControllerIndex( f1147_arg2 ) or IsGlobalModelValueEqualTo( f1147_arg1, f1147_arg2, "lobbyRoot.hideMenusForGameStart", 1 ) then
		return 
	elseif ChatClientAnySubMenuOpen( f1147_arg2 ) then
		ChatClientResetSubMenus( f1147_arg0, f1147_arg1, f1147_arg2 )
	else
		LobbyGoBack( f1147_arg0:getParent(), f1147_arg2 )
	end
end

function ChatClientInputArrangeText( f1148_arg0, f1148_arg1, f1148_arg2 )
	if f1148_arg0 and f1148_arg0.arrangeText ~= nil then
		f1148_arg0:arrangeText()
		return 
	end
	local f1148_local0 = f1148_arg0:getParent()
	if f1148_local0 and f1148_local0.arrangeText ~= nil then
		f1148_local0:arrangeText()
	end
end

function ChatClientInputTextFieldUpdatePrompt( f1149_arg0, f1149_arg1, f1149_arg2 )
	if Engine.ChatClient_IsChatting( f1149_arg2 ) then
		local f1149_local0 = Engine.ChatClient_InputChannelGet( f1149_arg2 )
		local f1149_local1 = Engine.Localize( Engine.ChatClient_ChannelStringGet( f1149_local0 ) ) .. ": "
		Engine.SetModelValue( CoD.ChatClientUtility.GetInputChannelColorModel(), Engine.ChatClient_ChannelColorGet( f1149_arg2, f1149_local0 ) )
		Engine.SetModelValue( CoD.ChatClientUtility.GetInputChannelTextModel(), f1149_local1 )
		return 
	else
		Engine.SetModelValue( CoD.ChatClientUtility.GetInputChannelTextModel(), "" )
		if Engine.IsInGame() then
			Engine.SetModelValue( CoD.ChatClientUtility.GetInputTextModel(), "" )
			Engine.SetModelValue( CoD.ChatClientUtility.GetInputChannelTextModel(), "" )
			return 
		elseif not ChatClientEnabled( f1149_arg2 ) then
			Engine.SetModelValue( CoD.ChatClientUtility.GetInputTextModel(), Engine.Localize( "PLATFORM_CHAT_DISABLED" ) )
			return 
		elseif not ChatClientIsAvailable( f1149_arg0, f1149_arg1, f1149_arg2 ) then
			Engine.SetModelValue( CoD.ChatClientUtility.GetInputTextModel(), Engine.Localize( "PLATFORM_CHAT_NOT_AVAILABLE" ) )
			return 
		else
			Engine.SetModelValue( CoD.ChatClientUtility.GetInputTextModel(), Engine.Localize( "PLATFORM_CHAT_CLICK_TO_ENTER_CHAT" ) )
		end
	end
end

function ChatClientInputTextFocusChanged( f1150_arg0, f1150_arg1, f1150_arg2 )
	ChatClientInputTextFieldUpdatePrompt( f1150_arg0, f1150_arg1, f1150_arg2 )
end

function ChatClientFilterChannelSet( f1151_arg0, f1151_arg1, f1151_arg2, f1151_arg3, f1151_arg4 )
	local f1151_local0 = CoD.ChatClientUtility.GetChannelFromString( f1151_arg3 )
	local f1151_local1 = Engine.GetModelValue( f1151_arg4 )
	if f1151_local0 ~= nil and f1151_local1 ~= nil then
		Engine.ChatClient_FilterChannelSet( f1151_arg2, f1151_local0, f1151_local1 )
	end
end

function ChatClientShowTimestampsSet( f1152_arg0, f1152_arg1, f1152_arg2, f1152_arg3 )
	return Engine.ChatClient_ShowTimestampsSet( f1152_arg2, Engine.GetModelValue( f1152_arg3 ) )
end

function ChatClientShowChannelSet( f1153_arg0, f1153_arg1, f1153_arg2, f1153_arg3 )
	return Engine.ChatClient_ShowChannelSet( f1153_arg2, Engine.GetModelValue( f1153_arg3 ) )
end

function ChatClientSettingsHide( f1154_arg0, f1154_arg1, f1154_arg2 )
	CoD.ChatClientUtility.ResetSettingsMenu()
end

function ChatClientInputChannelSelectorHide( f1155_arg0, f1155_arg1, f1155_arg2 )
	CoD.ChatClientUtility.ResetInputChannelSelectorMenu()
end

function ChatClientResetState( f1156_arg0, f1156_arg1, f1156_arg2 )
	Engine.ChatClient_ResetState( f1156_arg2 )
end

function ResetControlsToDefault( f1157_arg0, f1157_arg1, f1157_arg2, f1157_arg3 )
	Engine.Exec( f1157_arg2, "resetprofilecommon" )
	Engine.Exec( f1157_arg2, "updategamerprofile" )
	Engine.Exec( f1157_arg2, "storagereset stats_mp_offline" )
	CoD.OverlayUtility.AddSystemOverlay( "ResetControlsToDefault", {
		menuName = "SystemOverlay_Compact",
		title = "MENU_RESET_TO_DEFAULT_CAPS",
		description = "MENU_RESET_TO_DEFAULTS_SUCCESSFUL",
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ()
			DataSources.TestPopup_List = DataSourceHelpers.ListSetup( "ResetControlsToDefault_List", function ( f1159_arg0 )
				return {
					{
						models = {
							displayText = "Yes"
						},
						properties = {
							action = function ( f1160_arg0, f1160_arg1, f1160_arg2, f1160_arg3, f1160_arg4 )
								GoBack( f1160_arg2 )
							end
							
						}
					}
				}
			end, true, nil )
			return "ResetControlsToDefault_List"
		end
	} )
	CoD.OverlayUtility.CreateOverlay( f1157_arg2, f1157_arg3, "ResetControlsToDefault" )
end

function ChangeLanguage( f1161_arg0, f1161_arg1, f1161_arg2, f1161_arg3, f1161_arg4 )
	if f1161_arg3 == Engine.GetLanguage() then
		GoBack( f1161_arg0, f1161_arg2 )
		return 
	else
		Engine.SetLanguage( f1161_arg3 )
		CoD.OverlayUtility.AddSystemOverlay( "Restart_Popup", {
			menuName = "SystemOverlay_Compact",
			title = Engine.Localize( "MENU_NOTICE" ),
			description = Engine.Localize( "MENU_RESTART_WARNING" ),
			categoryType = CoD.OverlayUtility.OverlayTypes.Alert,
			listDatasource = function ()
				DataSources.Restart_Popup = DataSourceHelpers.ListSetup( "Restart_Popup", function ( f1163_arg0 )
					return {
						{
							models = {
								displayText = "OK"
							},
							properties = {
								action = function ( f1164_arg0, f1164_arg1, f1164_arg2, f1164_arg3, f1164_arg4 )
									Engine.RebootGame()
								end
								
							}
						}
					}
				end, true, nil )
				return "Restart_Popup"
			end
		} )
		CoD.OverlayUtility.CreateOverlay( f1161_arg2, f1161_arg4, "Restart_Popup" )
		return true
	end
end

function ChangeAutoScrollStartDelay( f1165_arg0, f1165_arg1 )
	f1165_arg0.autoScrollStartDelay = f1165_arg1
end

function ChangeAutoScrollEndDelay( f1166_arg0, f1166_arg1 )
	f1166_arg0.autoScrollEndDelay = f1166_arg1
end

function ChangeAutoScrollSpeed( f1167_arg0, f1167_arg1 )
	f1167_arg0.autoScrollSpeed = f1167_arg1
end

function ChangeRightStickScrollSpeed( f1168_arg0, f1168_arg1 )
	f1168_arg0.rightStickScrollSpeed = f1168_arg1
end

function EnableAutoScrolling( f1169_arg0, f1169_arg1 )
	f1169_arg0.allowAutoScrolling = f1169_arg1
end

function EnableRightStickScrolling( f1170_arg0, f1170_arg1 )
	f1170_arg0.allowRightStickScrolling = f1170_arg1
end

function SetDownloadPreference( f1171_arg0, f1171_arg1 )
	Engine.ChoosePreferredDownloadOrder( f1171_arg0, f1171_arg1 )
end

function SetFirstTimeDurangoDownloadSettingDisplayed( f1172_arg0 )
	CoD.LobbyBase.DisplayedFirstTimeDurangoDownloadSetting = true
end

function ResetCampaign( f1173_arg0, f1173_arg1, f1173_arg2 )
	f1173_arg2:OpenModalDialog( f1173_arg0, f1173_arg1, "MENU_RESET_CAMPAIGN", "MENU_RESET_CAMPAIGN_WARNING", {
		"MPUI_YES",
		"MPUI_NO"
	}, function ( f1174_arg0 )
		if f1174_arg0 == 0 then
			Engine.ResetCampaign()
		end
		return true
	end )
end

function CombatRecordShowModelForItemIndex( f1175_arg0, f1175_arg1 )
	local f1175_local0 = 0
	local f1175_local1 = f1175_arg1:getModel( f1175_arg0, "itemIndex" )
	if f1175_local1 then
		f1175_local0 = Engine.GetModelValue( f1175_local1 )
	end
	Engine.SendClientScriptNotify( f1175_arg0, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f1175_arg0 ), Engine.GetLoadoutSlotForItem( f1175_local0, CoD.GetCombatRecordMode() ), Engine.GetItemRef( f1175_local0, CoD.GetCombatRecordMode() ) .. "_" .. CoD.GetCombatRecordModeAbbreviation(), "select01", "0,0,0", nil, true )
end

function CombatRecordShowModelForBubblegumBuff( f1176_arg0, f1176_arg1 )
	local f1176_local0 = 0
	local f1176_local1 = f1176_arg1:getModel( f1176_arg0, "itemIndex" )
	if f1176_local1 then
		f1176_local0 = Engine.GetModelValue( f1176_local1 )
	end
	Engine.SendClientScriptNotify( f1176_arg0, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f1176_arg0 ), Engine.GetItemGroup( f1176_local0, Enum.eModes.MODE_ZOMBIES ), "p7_" .. Engine.GetItemRef( f1176_local0, Enum.eModes.MODE_ZOMBIES ) .. "_ui", "select01" )
end

function CombatRecordShowCybercoreModelForItemIndex( f1177_arg0, f1177_arg1 )
	local f1177_local0 = 0
	local f1177_local1 = f1177_arg1:getModel( f1177_arg0, "cybercoreIndex" )
	if f1177_local1 then
		f1177_local0 = Engine.GetModelValue( f1177_local1 )
	end
	Engine.SendClientScriptNotify( f1177_arg0, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f1177_arg0 ), Engine.GetLoadoutSlotForItem( f1177_local0, CoD.GetCombatRecordMode() ), CoD.CACUtility.GetCybercoreXModel( f1177_local0, CoD.GetCombatRecordMode() ), "select01", "0,0,0", nil, true )
end

function CombatRecordSetHero( f1178_arg0 )
	local f1178_local0 = 0
	local f1178_local1 = Engine.GetModel( Engine.GetModelForController( f1178_arg0 ), "FavoriteSpecialist" )
	if f1178_local1 then
		f1178_local0 = Engine.GetModelValue( Engine.GetModel( f1178_local1, "heroIndex" ) )
	end
	Engine.SendClientScriptNotify( f1178_arg0, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f1178_arg0 ), "changeHero", f1178_local0, CoD.GetCombatRecordMode() )
end

function CombatRecordShowHero( f1179_arg0, f1179_arg1 )
	local f1179_local0 = 0
	local f1179_local1 = f1179_arg1:getModel( f1179_arg0, "heroIndex" )
	if f1179_local1 then
		f1179_local0 = Engine.GetModelValue( f1179_local1 )
	end
	Engine.SendClientScriptNotify( f1179_arg0, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f1179_arg0 ), "changeHero", f1179_local0, CoD.GetCombatRecordMode() )
end

function CombatRecordUpdateCollectibles( f1180_arg0, f1180_arg1, f1180_arg2 )
	CoD.perController[f1180_arg1].inspectingMap = CoD.SafeGetModelValue( f1180_arg2:getModel(), "id" )
	f1180_arg0.Collectibles:updateDataSource()
end

function CombatRecordTabChanged( f1181_arg0, f1181_arg1, f1181_arg2 )
	if not CoD.CombatRecordPreventModeChange then
		CoD.CombatRecordMode = f1181_arg1.tabId
	end
end

function CombatRecordMedalsTabChanged( f1182_arg0, f1182_arg1, f1182_arg2 )
	CoD.CombatRecordMedalCategory = f1182_arg1.tabId
	if f1182_arg0.MedalsGrid then
		f1182_arg0.MedalsGrid:updateDataSource()
	end
end

function CombatRecordAccoladesChangeMap( f1183_arg0, f1183_arg1, f1183_arg2, f1183_arg3 )
	local f1183_local0 = {}
	local f1183_local1 = 0
	local f1183_local2 = 0
	local f1183_local3 = Engine.GetModel( Engine.GetModelForController( f1183_arg1 ), "CombatRecordAccolades" )
	for f1183_local7, f1183_local8 in LUI.IterateTableBySortedKeys( CoD.mapsTable, function ( f1184_arg0, f1184_arg1 )
		return CoD.mapsTable[f1184_arg0].unique_id < CoD.mapsTable[f1184_arg1].unique_id
	end, nil ) do
		if f1183_local8.session_mode == Enum.eModes.MODE_CAMPAIGN and f1183_local8.campaign_mode == 0 and f1183_local8.dlc_pack ~= -1 and f1183_local8.isSubLevel == false then
			table.insert( f1183_local0, f1183_local8.unique_id )
			if CoD.SafeGetModelValue( f1183_local3, "unique_id" ) == f1183_local8.unique_id then
				f1183_local1 = f1183_local2
			end
			f1183_local2 = f1183_local2 + 1
		end
	end
	Engine.SetModelValue( Engine.GetModel( f1183_local3, "unique_id" ), f1183_local0[(f1183_local1 + f1183_arg3) % f1183_local2 + 1] )
end

function CombatRecordSetHeadingKickerTextToCombatRecordGameMode()
	local f1185_local0 = SessionModeToLocalizedSessionMode( CoD.GetCombatRecordMode() )
	local f1185_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerText" )
	if f1185_local1 then
		Engine.SetModelValue( f1185_local1, Engine.Localize( f1185_local0 ) )
	end
end

function CombatRecordSetHeadingKickerTextToCombatRecordMode()
	if CoD.GetCombatRecordMode() ~= Enum.eModes.MODE_MULTIPLAYER then
		CombatRecordSetHeadingKickerTextToCombatRecordGameMode()
		return 
	end
	local f1186_local0 = Engine.Localize( "MENU_COMBAT_RECORD_TAB_PUBLIC_CAPS" )
	if CoD.CombatRecordMode == "public" then
		f1186_local0 = Engine.Localize( "MENU_COMBAT_RECORD_TAB_PUBLIC_CAPS" )
	elseif CoD.CombatRecordMode == "arena" then
		f1186_local0 = Engine.Localize( "MENU_ARENA_CAPS" )
	end
	local f1186_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerText" )
	if f1186_local1 then
		Engine.SetModelValue( f1186_local1, f1186_local0 )
	end
end

