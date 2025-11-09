require( "ui.uieditor.actions_helper" )

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
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f20_arg0 ), f20_arg1 ), f20_arg2 )
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

function SetPrimaryControllerPerControllerTableProperty( f33_arg0, f33_arg1 )
	CoD.perController[Engine.GetPrimaryController()][f33_arg0] = f33_arg1
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

function SendClientScriptPropertyNotify( f43_arg0, f43_arg1, f43_arg2, f43_arg3 )
	if f43_arg1[f43_arg3] then
		Engine.SendClientScriptNotify( f43_arg0, f43_arg2, f43_arg1[f43_arg3] )
	end
end

function SendClientScriptPropertyNotifyForAdjustedClient( f44_arg0, f44_arg1, f44_arg2, f44_arg3 )
	if f44_arg1[f44_arg3] then
		Engine.SendClientScriptNotify( f44_arg0, f44_arg2 .. CoD.GetLocalClientAdjustedNum( f44_arg0 ), f44_arg1[f44_arg3] )
	end
end

function SendClientScriptPropertyNotifyForAdjustedClientTwoParam( f45_arg0, f45_arg1, f45_arg2, f45_arg3, f45_arg4 )
	if f45_arg1[f45_arg4] then
		Engine.SendClientScriptNotify( f45_arg0, f45_arg2 .. CoD.GetLocalClientAdjustedNum( f45_arg0 ), f45_arg3, f45_arg1[f45_arg4] )
	end
end

function SendClientScriptModelNotify( f46_arg0, f46_arg1, f46_arg2, f46_arg3 )
	local f46_local0 = f46_arg1:getModel( f46_arg0, f46_arg3 )
	if f46_local0 then
		Engine.SendClientScriptNotify( f46_arg0, f46_arg2, Engine.GetModelValue( f46_local0 ) )
	end
end

function SendClientScriptModelNotifyForAdjustedClientTwoParam( f47_arg0, f47_arg1, f47_arg2, f47_arg3, f47_arg4 )
	local f47_local0 = f47_arg1:getModel( f47_arg0, f47_arg4 )
	if f47_local0 then
		Engine.SendClientScriptNotify( f47_arg0, f47_arg2 .. CoD.GetLocalClientAdjustedNum( f47_arg0 ), f47_arg3, Engine.GetModelValue( f47_local0 ) )
	end
end

function SendClientScriptMenuChangeNotify( f48_arg0, f48_arg1, f48_arg2 )
	SendClientScriptMenuChangeNotifyHelper( f48_arg0, f48_arg1.menuName, f48_arg2 )
end

function SendCustomClientScriptMenuChangeNotify( f49_arg0, f49_arg1, f49_arg2 )
	SendClientScriptMenuChangeNotifyHelper( f49_arg0, f49_arg1, f49_arg2 )
end

function SendClientScriptMenuStateChangeNotify( f50_arg0, f50_arg1, f50_arg2, f50_arg3 )
	SendClientScriptMenuChangeNotifyHelper( f50_arg0, f50_arg1.menuName, f50_arg2, f50_arg3 )
end

function SendCustomClientScriptMenuStateChangeNotify( f51_arg0, f51_arg1, f51_arg2, f51_arg3 )
	SendClientScriptMenuChangeNotifyHelper( f51_arg0, f51_arg1, f51_arg2, f51_arg3 )
end

function CallCustomElementFunction_Self( f52_arg0, f52_arg1, ... )
	if f52_arg0[f52_arg1] then
		f52_arg0[f52_arg1]( f52_arg0, ... )
	end
end

function CallCustomElementFunction_Element( f53_arg0, f53_arg1, ... )
	if f53_arg0[f53_arg1] then
		f53_arg0[f53_arg1]( f53_arg0, ... )
	end
end

function SetProfileVar( f54_arg0, f54_arg1, f54_arg2 )
	Engine.SetProfileVar( f54_arg0, f54_arg1, f54_arg2 )
end

function CheckGCCatchUp()
	if Engine.CheckGCCatchUp then
		Engine.CheckGCCatchUp()
	end
end

function OpenGameSettingsOptionsMenu( f56_arg0, f56_arg1, f56_arg2, f56_arg3 )
	CoD.perController[f56_arg2].selectedGameSettingElement = f56_arg1
	f56_arg3:saveState()
	OpenPopup( f56_arg3, "GameSettings_OptionsMenu", f56_arg2 )
end

function ResetGameSettings()
	Engine.SetGametype( Engine.DvarString( nil, "ui_gametype" ) )
	Engine.SetDvar( "bot_maxFree", 0 )
	Engine.SetDvar( "bot_maxAllies", 0 )
	Engine.SetDvar( "bot_maxAxis", 0 )
	Engine.SetDvar( "bot_difficulty", 1 )
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings.Update" ) )
end

function ResetSelectedGameSetting( f58_arg0, f58_arg1, f58_arg2, f58_arg3 )
	local f58_local0 = CoD.perController[f58_arg2].selectedGameSettingElement
	if f58_local0 and f58_local0.revert then
		f58_local0:revert()
	end
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings.Update" ) )
end

function GameSettingsMenuClosed( f59_arg0, f59_arg1 )
	if CoD.perController[f59_arg1].editingPresetClass then
		Engine.StopEditingPresetClass()
		CoD.perController[f59_arg1].isPreset = nil
	end
end

function ButtonListFocused( f60_arg0, f60_arg1, f60_arg2 )
	if f60_arg1.isClassButton then
		local f60_local0 = CoD.perController[f60_arg2]
		f60_local0.classNum = f60_arg1.actionParam
		f60_local0.isPreset = true
		f60_local0.weaponSlot = nil
		f60_local0.grenadeSlot = nil
		f60_local0.perkCategory = nil
		f60_local0.slotIndex = nil
	end
end

function GameSettingsButtonGainFocus( f61_arg0, f61_arg1, f61_arg2 )
	UpdateInfoModels( f61_arg1 )
end

function OpenGameSettings_GameMode( f62_arg0, f62_arg1, f62_arg2, f62_arg3, f62_arg4 )
	f62_arg4:saveState()
	OpenOverlay( f62_arg4, "GameSettings_EditModeSpecificOptions", f62_arg2 )
end

function OpenGameSettings_General( f63_arg0, f63_arg1, f63_arg2, f63_arg3, f63_arg4 )
	f63_arg4:saveState()
	OpenOverlay( f63_arg4, "GameSettings_GeneralSettings", f63_arg2 )
end

function OpenGameSettings_Spawn( f64_arg0, f64_arg1, f64_arg2, f64_arg3, f64_arg4 )
	f64_arg4:saveState()
	OpenOverlay( f64_arg4, "GameSettings_SpawnSettings", f64_arg2 )
end

function OpenGameSettings_HealthAndDamage( f65_arg0, f65_arg1, f65_arg2, f65_arg3, f65_arg4 )
	f65_arg4:saveState()
	OpenOverlay( f65_arg4, "GameSettings_HealthAndDamageSettings", f65_arg2 )
end

function OpenGameSettings_Competitive( f66_arg0, f66_arg1, f66_arg2, f66_arg3, f66_arg4 )
	f66_arg4:saveState()
	OpenOverlay( f66_arg4, "GameSettings_Competitive", f66_arg2 )
end

function OpenGameSettings_CreateAClass( f67_arg0, f67_arg1, f67_arg2, f67_arg3, f67_arg4 )
	f67_arg4:saveState()
	OpenOverlay( f67_arg4, "GameSettings_CreateAClassSettings", f67_arg2 )
end

function PlaySoundSetSound( f68_arg0, f68_arg1 )
	f68_arg0:playSound( f68_arg1 )
end

function PlayMenuMusic( f69_arg0 )
	CoD.PlayFrontendMusic( f69_arg0 )
end

function PlayMenuMusicForCurrentLobby()
	CoD.PlayFrontendMusic()
end

function PlaySoundAlias( f71_arg0 )
	Engine.PlaySound( f71_arg0 )
end

function StopSoundAlias( f72_arg0 )
	Engine.StopSound( f72_arg0 )
end

function PlayMenuTrackedSound( f73_arg0, f73_arg1 )
	StopMenuTrackedSound( f73_arg0 )
	f73_arg0.trackedSound = f73_arg1
	Engine.PlaySound( f73_arg0.trackedSound )
end

function StopMenuTrackedSound( f74_arg0 )
	if f74_arg0.trackedSound then
		Engine.StopSound( f74_arg0.trackedSound )
		f74_arg0.trackedSound = nil
	end
end

function StopSoundFromElementModel( f75_arg0, f75_arg1, f75_arg2 )
	local f75_local0 = CoD.SafeGetModelValue( f75_arg1:getModel(), f75_arg2 )
	if f75_local0 and f75_local0 ~= "" then
		Engine.StopSound( f75_local0 )
	end
end

function PlayMPMusicPreview( f76_arg0, f76_arg1 )
	local f76_local0 = CoD.SafeGetModelValue( f76_arg1:getModel(), "alias" )
	if f76_local0 and f76_local0 ~= "" then
		if f76_arg1.soundTimer then
			Engine.StopSound( f76_local0 )
		end
		CoD.StopFrontendMusic()
		Engine.PlaySound( f76_local0 )
		if not f76_arg1.soundTimer then
			f76_arg1.soundTimer = LUI.UITimer.newElementTimer( Engine.GetSoundPlaybackTime( f76_local0 ), true, function ()
				StopMPMusicPreview( f76_arg0, f76_arg1 )
			end )
			f76_arg1:addElement( f76_arg1.soundTimer )
		else
			f76_arg1.soundTimer:reset()
		end
	end
end

function StopMPMusicPreview( f78_arg0, f78_arg1 )
	local f78_local0 = CoD.SafeGetModelValue( f78_arg1:getModel(), "alias" )
	if f78_local0 and f78_local0 ~= "" and f78_arg1.soundTimer then
		Engine.StopSound( f78_local0 )
		CoD.ResetFrontendMusic()
		f78_arg1.soundTimer:close()
		f78_arg1.soundTimer = nil
	end
end

function StopFrontendMusicForMusicTracks()
	CoD.StopFrontendMusic()
	CoD.musicTracks.queue = {}
end

function ResumeFrontendMusicForMusicTracks( f80_arg0 )
	CoD.ResetFrontendMusic( true )
end

function PlayMusicTrackPreview( f81_arg0, f81_arg1 )
	local f81_local0 = CoD.SafeGetModelValue( f81_arg0:getModel(), "alias" )
	if f81_local0 then
		CoD.StopFrontendMusic()
		CoD.AddMusicTrack( f81_local0, false )
		CoD.NextMenuTrack( true )
	end
end

function UpdateMusicTrackGlobalSetting( f82_arg0 )
	DataSources.MusicTracksBase.updateSettingDescModel( f82_arg0 )
end

function ToggleMusicTrackSelected( f83_arg0, f83_arg1, f83_arg2 )
	local f83_local0 = Engine.StorageGetBuffer( f83_arg0, Enum.StorageFileType.STORAGE_COMMON_SETTINGS )
	local f83_local1 = Engine.GetModel( f83_arg1:getModel(), "trackIndex" )
	local f83_local2
	if f83_local1 then
		f83_local2 = Engine.GetModelValue( f83_local1 )
		if not f83_local2 then
		
		else
			local f83_local3 = Engine.GetModel( f83_arg1:getModel(), "selected" )
			if f83_local0 and f83_local2 and f83_local3 then
				local f83_local4 = not Engine.GetModelValue( f83_local3 )
				local f83_local5 = f83_local0.snd_playMPFrontendMusicTrack[f83_local2]
				local f83_local6 = f83_local5
				f83_local5 = f83_local5.set
				local f83_local7
				if f83_local4 then
					f83_local7 = 1
					if not f83_local7 then
					
					else
						f83_local5( f83_local6, f83_local7 )
						DataSources.MusicTracksBase.updateTotalSelected( f83_arg0, f83_local4 )
						DataSources.MusicTracksBase.updateFilterTotalSelected( f83_arg0, f83_local4 )
						Engine.SetModelValue( f83_local3, f83_local4 )
					end
				end
				f83_local7 = 0
			end
		end
	end
	f83_local2 = nil
end

function SelectAllMusicTracksInFilter( f84_arg0, f84_arg1 )
	local f84_local0 = f84_arg0.ButtonList
	local f84_local1 = Engine.StorageGetBuffer( f84_arg1, Enum.StorageFileType.STORAGE_COMMON_SETTINGS )
	if f84_local0 and f84_local1 then
		local f84_local2 = f84_local0[DataSources.MusicPlayerTracks.trackListDataSourceName]
		if f84_local2 then
			for f84_local6, f84_local7 in ipairs( f84_local2 ) do
				local f84_local8 = CoD.SafeGetModelValue( f84_local7.model, "trackIndex" )
				if f84_local8 and not CoD.SafeGetModelValue( f84_local7.model, "selected" ) then
					f84_local1.snd_playMPFrontendMusicTrack[f84_local8]:set( 1 )
					DataSources.MusicTracksBase.updateTotalSelected( f84_arg1, true )
					DataSources.MusicTracksBase.updateFilterTotalSelected( f84_arg1, true )
					Engine.SetModelValue( Engine.GetModel( f84_local7.model, "selected" ), true )
				end
			end
		end
	end
end

function DeselectAllMusicTracksInFilter( f85_arg0, f85_arg1, f85_arg2 )
	local f85_local0 = f85_arg0.ButtonList
	local f85_local1 = Engine.StorageGetBuffer( f85_arg1, Enum.StorageFileType.STORAGE_COMMON_SETTINGS )
	if f85_local0 and f85_local1 then
		local f85_local2 = Engine.GetModelValue( DataSources.MusicTracksBase.getCurrentFilterTotalSelectedModel( f85_arg1 ) )
		local f85_local3 = Engine.GetModelValue( DataSources.MusicTracksBase.getTotalSelectedModel( f85_arg1 ) )
		local f85_local4 = f85_local0[DataSources.MusicPlayerTracks.trackListDataSourceName]
		if f85_local4 then
			for f85_local8, f85_local9 in ipairs( f85_local4 ) do
				local f85_local10 = CoD.SafeGetModelValue( f85_local9.model, "trackIndex" )
				if f85_local10 and CoD.SafeGetModelValue( f85_local9.model, "selected" ) then
					f85_local1.snd_playMPFrontendMusicTrack[f85_local10]:set( 0 )
					DataSources.MusicTracksBase.updateTotalSelected( f85_arg1, false )
					DataSources.MusicTracksBase.updateFilterTotalSelected( f85_arg1, false )
					Engine.SetModelValue( Engine.GetModel( f85_local9.model, "selected" ), false )
				end
			end
		end
	end
end

function UpdateMusicTrackFilters( f86_arg0, f86_arg1, f86_arg2, f86_arg3, f86_arg4 )
	local f86_local0 = f86_arg1.filter
	if f86_local0 then
		local f86_local1 = DataSources.MusicTracksBase.getCurrentFilterModel( f86_arg2 )
		if f86_local1 then
			Engine.SetModelValue( f86_local1, f86_local0 )
		end
	end
end

function UpdateModel( f87_arg0, f87_arg1, f87_arg2 )
	f87_arg0:setModel( f87_arg1:getModel() )
end

function UpdateElementModelToFocusedElementModel( f88_arg0, f88_arg1, f88_arg2, f88_arg3 )
	if f88_arg0[f88_arg2] then
		local f88_local0 = f88_arg0
		for f88_local4, f88_local5 in pairs( f88_arg3.idStack ) do
			if f88_local5 ~= f88_arg0.id then
				f88_local0 = f88_local0[f88_local5]
			end
		end
		if f88_local0 and f88_local0.id == f88_arg3.id then
			f88_arg0[f88_arg2]:setModel( f88_local0:getModel() )
		end
	end
end

function SetElementModelToFocusedElementModel( f89_arg0, f89_arg1, f89_arg2 )
	local f89_local0 = f89_arg1:getModel()
	if f89_arg0[f89_arg2] and f89_local0 then
		f89_arg0[f89_arg2]:setModel( f89_local0 )
	end
end

function SetSelfModelValue( f90_arg0, f90_arg1, f90_arg2, f90_arg3, f90_arg4 )
	local f90_local0 = f90_arg1:getModel( f90_arg2, f90_arg3 )
	if f90_local0 ~= nil then
		Engine.SetModelValue( f90_local0, f90_arg4 )
	end
end

function ToggleSelfModelValueNumber( f91_arg0, f91_arg1, f91_arg2, f91_arg3 )
	local f91_local0 = f91_arg1:getModel( f91_arg2, f91_arg3 )
	if f91_local0 ~= nil then
		Engine.SetModelValue( f91_local0, 1 - Engine.GetModelValue( f91_local0 ) )
	end
end

function ToggleSelfModelBoolean( f92_arg0, f92_arg1, f92_arg2, f92_arg3 )
	local f92_local0 = f92_arg1:getModel( f92_arg2, f92_arg3 )
	if f92_local0 ~= nil then
		Engine.SetModelValue( f92_local0, not Engine.GetModelValue( f92_local0 ) )
	end
end

function ForceNotifyGlobalModel( f93_arg0, f93_arg1 )
	Engine.ForceNotifyModelSubscriptions( Engine.GetModel( Engine.GetGlobalModel(), f93_arg1 ) )
end

function ForceNotifyControllerModel( f94_arg0, f94_arg1 )
	local f94_local0 = Engine.GetModel( Engine.GetModelForController( f94_arg0 ), f94_arg1 )
	if f94_local0 then
		Engine.ForceNotifyModelSubscriptions( f94_local0 )
	end
end

function ShowKeyboard( f95_arg0, f95_arg1, f95_arg2, f95_arg3 )
	Engine.Exec( f95_arg2, "ui_keyboard_new " .. Enum.KeyboardType[f95_arg3] )
end

function RunClientDemo( f96_arg0, f96_arg1, f96_arg2 )
	local f96_local0 = f96_arg1.gridInfoTable.zeroBasedIndex + 1
	Engine.Exec( f96_arg2, "cl_demo_play " .. Engine.GetModelValue( f96_arg1:getModel( f96_arg2, "fileName" ) ) )
end

function StartGame( f97_arg0, f97_arg1 )
	if Engine.GetGametypeSetting( "teamAssignment" ) == LuaEnums.TEAM_ASSIGNMENT.AUTO then
		Engine.PartyHostReassignTeams()
	end
	Engine.PartyHostToggleStart()
end

function SetPrimary( f98_arg0, f98_arg1 )
	Engine.ExecNow( f98_arg1, "setclientbeingusedandprimary" )
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

function ShowHeaderGroupHQ( f102_arg0 )
	f102_arg0.showHeaderKicker = true
	f102_arg0.showHeaderIcon = true
	f102_arg0.showHeaderEmblem = true
end

function SetHeadingKickerText( f103_arg0 )
	local f103_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerText" )
	if f103_local0 then
		Engine.SetModelValue( f103_local0, Engine.Localize( f103_arg0 ) )
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
	local f104_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerMode" )
	local f104_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerText" )
	if f104_local1 then
		local f104_local2 = Engine.SetModelValue
		local f104_local3 = f104_local1
		local f104_local4
		if f104_local0 then
			f104_local4 = Engine.GetModelValue( f104_local0 )
			if not f104_local4 then
			
			else
				f104_local2( f104_local3, f104_local4 )
			end
		end
		f104_local4 = ""
	end
end

function SetHeadingKickerTextToSelectedWeapon( f105_arg0 )
	local f105_local0 = Engine.CurrentSessionMode()
	if CoD.isFrontend then
		f105_local0 = Enum.eModes.MODE_MULTIPLAYER
	end
	local f105_local1 = CoD.GetCustomization( f105_arg0, "weapon_index" )
	local f105_local2 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerText" )
	if f105_local2 and f105_local1 ~= CoD.CACUtility.EmptyItemIndex then
		local f105_local3 = Engine.ToUpper( Engine.Localize( Engine.GetItemName( f105_local1, f105_local0 ) ) )
		if f105_local2 and f105_local3 then
			Engine.SetModelValue( f105_local2, f105_local3 )
		end
	end
end

function ForceLobbyButtonUpdate( f106_arg0 )
	LuaUtils.ForceLobbyButtonUpdate()
end

function SetButtonRecentlySelected( f107_arg0, f107_arg1, f107_arg2 )
	if f107_arg1 ~= nil and f107_arg1.id ~= nil then
		CoD.LobbyMenus.UpdateHistory( f107_arg2, f107_arg1.id )
	end
end

function OpenChangeRankedSettingsPopup( f108_arg0, f108_arg1, f108_arg2, f108_arg3, f108_arg4 )
	CoD.OverlayUtility.AddSystemOverlay( "ChangeRankedSettingsPopup", {
		menuName = "SystemOverlay_Compact",
		title = "MENU_CHANGE_RANKED_SETTINGS_CAPS",
		description = "MENU_CHANGE_RANKED_SETTINGS_DESC",
		listDatasource = function ()
			DataSources.ChangeRankedSettingssPopup_List = DataSourceHelpers.ListSetup( "ChangeRankedSettingssPopup_List", function ( f110_arg0 )
				local f110_local0 = {}
				local f110_local1 = {
					models = {
						displayText = "MENU_NON_RANKED_GAME_CAPS"
					}
				}
				local f110_local2 = {
					action = function ( f111_arg0, f111_arg1, f111_arg2, f111_arg3, f111_arg4 )
						if Dvar.zm_private_rankedmatch:exists() then
							Dvar.zm_private_rankedmatch:set( false )
							Engine.SetProfileVar( f111_arg2, "com_privategame_ranked_zm", 0 )
							Engine.Exec( f111_arg2, "updategamerprofile" )
						end
						GoBack( f111_arg4, f111_arg2 )
					end
				}
				local f110_local3 = Dvar.zm_private_rankedmatch:exists()
				if f110_local3 then
					f110_local3 = Dvar.zm_private_rankedmatch:get() == false
				end
				f110_local2.selectIndex = f110_local3
				f110_local1.properties = f110_local2
				f110_local2 = {
					models = {
						displayText = "MENU_RANKED_GAME_CAPS"
					}
				}
				f110_local3 = {
					action = function ( f112_arg0, f112_arg1, f112_arg2, f112_arg3, f112_arg4 )
						if Dvar.zm_private_rankedmatch:exists() then
							Dvar.zm_private_rankedmatch:set( true )
							Engine.SetProfileVar( f112_arg2, "com_privategame_ranked_zm", 1 )
							Engine.Exec( f112_arg2, "updategamerprofile" )
						end
						GoBack( f112_arg4, f112_arg2 )
					end
				}
				local f110_local4 = Dvar.zm_private_rankedmatch:exists()
				if f110_local4 then
					f110_local4 = Dvar.zm_private_rankedmatch:get() == true
				end
				f110_local3.selectIndex = f110_local4
				f110_local2.properties = f110_local3
				f110_local0[1] = f110_local1
				f110_local0[2] = f110_local2
				return f110_local0
			end, true, nil )
			return "ChangeRankedSettingssPopup_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage
	} )
	CoD.OverlayUtility.CreateOverlay( f108_arg2, f108_arg0, "ChangeRankedSettingsPopup" )
end

function UpdateQuickJoinFocus( f113_arg0, f113_arg1 )
	if f113_arg0.currentState == "ShowQuickJoin" then
		f113_arg0.friendsAndGroups:makeFocusableWithoutResettingNavigation()
	else
		f113_arg0.friendsAndGroups:makeNotFocusable()
	end
end

function SetPlayerReady( f114_arg0, f114_arg1, f114_arg2 )
	local f114_local0 = false
	if Engine.GetReadyUp then
		f114_local0 = Engine.GetReadyUp( f114_arg2 )
	end
	Engine.SetReadyUp( f114_arg2, not f114_local0 )
end

function RefreshServerList( f115_arg0, f115_arg1 )
	Engine.LobbyServerRefreshLocalServers( f115_arg1 )
end

function JoinSystemLinkServer( f116_arg0, f116_arg1, f116_arg2 )
	if not f116_arg1.gridInfoTable then
		return 
	end
	local f116_local0 = f116_arg1.gridInfoTable.zeroBasedIndex
	local f116_local1 = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "serverListRoot" ), "server" .. tostring( f116_local0 ) ), "sessionMode" ) )
	local f116_local2 = nil
	if f116_local1 == Enum.eModes.MODE_CAMPAIGN then
		f116_local2 = LobbyData.UITargets.UI_CPLOBBYLANGAME.maxLocalClientsNetwork
	elseif f116_local1 == Enum.eModes.MODE_MULTIPLAYER then
		f116_local2 = LobbyData.UITargets.UI_MPLOBBYLANGAME.maxLocalClientsNetwork
	elseif f116_local1 == Enum.eModes.MODE_ZOMBIES then
		f116_local2 = LobbyData.UITargets.UI_ZMLOBBYLANGAME.maxLocalClientsNetwork
	end
	if f116_local2 == nil then
		f116_local2 = 1
	end
	local f116_local3 = function ( f117_arg0 )
		if f117_arg0 then
			Engine.LobbyServerListJoinServer( f117_arg0.controller, f117_arg0.index )
		end
	end
	
	if f116_local2 < Engine.GetUsedControllerCount() then
		CoD.OverlayUtility.CreateOverlay( f116_arg2, f116_arg0, "LobbyLocalClientWarning", {
			controller = f116_arg2,
			navToMenu = nil,
			popupName = nil,
			openFromMenu = nil,
			actionFunc = f116_local3,
			index = f116_local0
		} )
		return 
	end
	f116_local3( {
		controller = f116_arg2,
		index = f116_local0
	} )
end

function LobbyLANServerPlayerListRefresh( f118_arg0, f118_arg1, f118_arg2 )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "serverPlayerListRoot" ), "selectedServer" ), f118_arg1.gridInfoTable.zeroBasedIndex )
	if f118_arg0.LANServerBrowserDetails and f118_arg0.LANServerBrowserDetails.PlayerList then
		f118_arg0.LANServerBrowserDetails.PlayerList:updateDataSource()
	end
end

function UploadStats( f119_arg0, f119_arg1 )
	Engine.Exec( f119_arg1, "uploadstats" )
	Engine.Exec( f119_arg1, "savegamerprofilestats" )
end

function SaveLoadout( f120_arg0, f120_arg1 )
	local f120_local0 = CoD.CCUtility.customizationMode
	if not f120_local0 then
		f120_local0 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	end
	Engine.Exec( f120_arg1, "saveLoadout " .. f120_local0 )
end

function CustomGameSettingsMenuClosed( f121_arg0, f121_arg1 )
	Engine.LobbyVM_CallFunc( "OnGametypeSettingsChange", {
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyModule = Enum.LobbyModule.LOBBY_MODULE_HOST
	} )
	Engine.LobbyHostSessionSetDirty( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionDirty.SESSION_DIRTY_STATE )
end

function OpenCACItemBansRestrictionsFlyout( f122_arg0, f122_arg1, f122_arg2 )
	SetGlobalModelValueTrue( "lobbyRoot.ShowCACItemBansRestrictionFlyout" )
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.ShowCACItemBansRestrictionFlyout" ) )
end

function AdjustGameSettingsTab( f123_arg0, f123_arg1, f123_arg2, f123_arg3 )
	local f123_local0 = Engine.GetModel( Engine.GetModelForController( f123_arg2 ), "GametypeSettings" )
	local f123_local1 = Engine.CreateModel( f123_local0, "selectedTab" )
	local f123_local2 = Engine.GetModelValue( f123_local1 )
	local f123_local3 = Engine.GetModelValue( Engine.CreateModel( f123_local0, "tabCount" ) )
	local f123_local4 = f123_local2 + tonumber( f123_arg3 )
	if f123_local3 < f123_local4 then
		f123_local4 = 1
	end
	if f123_local4 < 1 then
		f123_local4 = f123_local3
	end
	Engine.SetModelValue( f123_local1, f123_local4 )
end

function SetGameSettingsTab( f124_arg0, f124_arg1, f124_arg2, f124_arg3 )
	local f124_local0 = Engine.CreateModel( Engine.GetModel( Engine.GetModelForController( f124_arg2 ), "GametypeSettings" ), "selectedTab" )
	if Engine.GetModelValue( f124_local0 ) ~= f124_arg3 then
		Engine.SetModelValue( f124_local0, f124_arg3 )
	end
end

function AdjustCompetitiveItemSettingsFilter( f125_arg0, f125_arg1, f125_arg2, f125_arg3 )
	local f125_local0 = Engine.GetModel( Engine.GetModelForController( f125_arg2 ), "GametypeSettings" )
	local f125_local1 = Engine.CreateModel( f125_local0, "selectedItemSettingGroup" )
	local f125_local2 = Engine.GetModelValue( f125_local1 )
	local f125_local3 = Engine.GetModelValue( Engine.CreateModel( f125_local0, "selectedItemSettingGroupCount" ) )
	local f125_local4 = f125_local2 + tonumber( f125_arg3 )
	if f125_local3 < f125_local4 then
		f125_local4 = 1
	end
	if f125_local4 < 1 then
		f125_local4 = f125_local3
	end
	Engine.SetModelValue( f125_local1, f125_local4 )
end

function SetCompetitiveItemSettingsFilter( f126_arg0, f126_arg1, f126_arg2, f126_arg3 )
	local f126_local0 = Engine.GetModel( Engine.GetModelForController( f126_arg2 ), "GametypeSettings" )
	local f126_local1 = Engine.CreateModel( f126_local0, "selectedItemSettingGroup" )
	local f126_local2 = Engine.GetModelValue( f126_local1 )
	local f126_local3 = Engine.GetModelValue( Engine.CreateModel( f126_local0, "selectedItemSettingGroupCount" ) )
	if f126_local2 ~= f126_arg3 then
		Engine.SetModelValue( f126_local1, f126_arg3 )
	end
end

function ToggleCompetitiveAttachmentSettingsTab( f127_arg0, f127_arg1, f127_arg2 )
	local f127_local0 = Engine.CreateModel( Engine.GetModel( Engine.GetModelForController( f127_arg2 ), "GametypeSettings" ), "selectedAttachmentTab" )
	local f127_local1 = Engine.GetModelValue( f127_local0 )
	local f127_local2 = 1
	if f127_local1 == 1 then
		f127_local2 = 2
	end
	Engine.SetModelValue( f127_local0, f127_local2 )
end

function SetCompetitiveAttachmentSettingsTab( f128_arg0, f128_arg1, f128_arg2, f128_arg3 )
	local f128_local0 = Engine.CreateModel( Engine.GetModel( Engine.GetModelForController( f128_arg2 ), "GametypeSettings" ), "selectedAttachmentTab" )
	local f128_local1 = Engine.GetModelValue( f128_local0 )
	if f128_arg3 ~= selectedAttahmentTab then
		Engine.SetModelValue( f128_local0, f128_arg3 )
	end
end

function UpdateSelectedGametypeSettingModels( f129_arg0, f129_arg1, f129_arg2 )
	local f129_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
	local f129_local1 = f129_arg1:getModel()
	Engine.SetModelValue( Engine.CreateModel( f129_local0, "title" ), Engine.GetModelValue( Engine.GetModel( f129_local1, "title" ) ) )
	Engine.SetModelValue( Engine.CreateModel( f129_local0, "description" ), Engine.GetModelValue( Engine.GetModel( f129_local1, "description" ) ) )
	Engine.SetModelValue( Engine.CreateModel( f129_local0, "image" ), Engine.GetModelValue( Engine.GetModel( f129_local1, "image" ) ) )
end

function OpenAttachmentRestrictionPopup( f130_arg0, f130_arg1, f130_arg2, f130_arg3 )
	f130_arg3:saveState()
	CoD.OverlayUtility.CreateOverlay( f130_arg2, f130_arg0, "RestrictedAttachmentMenu", f130_arg2, f130_arg1 )
end

function CharacterDraftLoadoutSelected( f131_arg0, f131_arg1, f131_arg2 )
	if not CharacterDraftActive() then
		return 
	else
		local f131_local0 = Engine.GetEquippedHero( f131_arg2, CoD.CCUtility.customizationMode )
		Engine.SendCharacterDraftSelection( f131_arg2, f131_local0, Engine.GetLoadoutTypeForHero( f131_arg2, f131_local0 ) )
	end
end

function ForceNotifyPregameUpdate( f132_arg0, f132_arg1, f132_arg2 )
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ) )
end

function SetPregameEditIncomplete( f133_arg0 )
	Engine.SendPregameEditComplete( f133_arg0, false )
end

function AdjustPregameVoteFilter( f134_arg0, f134_arg1, f134_arg2, f134_arg3 )
	local f134_local0 = Engine.CreateModel( Engine.GetModel( Engine.GetModelForController( f134_arg2 ), "Pregame" ), "voteFilter" )
	local f134_local1 = Engine.GetModelValue( f134_local0 ) + tonumber( f134_arg3 )
	if f134_local1 > #CoD.CACUtility.PregameLoadoutFilters then
		f134_local1 = 1
	end
	if f134_local1 < 1 then
		f134_local1 = #CoD.CACUtility.PregameLoadoutFilters
	end
	Engine.SetModelValue( f134_local0, f134_local1 )
end

function SetPregameVoteFilter( f135_arg0, f135_arg1, f135_arg2, f135_arg3 )
	local f135_local0 = Engine.CreateModel( Engine.GetModel( Engine.GetModelForController( f135_arg2 ), "Pregame" ), "voteFilter" )
	if Engine.GetModelValue( f135_local0 ) ~= f135_arg3 then
		Engine.SetModelValue( f135_local0, f135_arg3 )
	end
end

function ToggleRestrictedContentEquippedFilter( f136_arg0 )
	local f136_local0 = Engine.CreateModel( Engine.GetModel( Engine.GetModelForController( f136_arg0 ), "Pregame" ), "equippedFilter" )
	Engine.SetModelValue( f136_local0, not Engine.GetModelValue( f136_local0 ) )
end

function SendItemVote( f137_arg0, f137_arg1, f137_arg2, f137_arg3 )
	local f137_local0 = Engine.GetModelValue( f137_arg1:getModel( f137_arg2, "itemType" ) )
	local f137_local1 = -1
	local f137_local2 = f137_arg1:getModel( f137_arg2, "itemIndex" )
	if f137_local2 then
		f137_local1 = Engine.GetModelValue( f137_local2 )
	end
	local f137_local3 = -1
	local f137_local4 = f137_arg1:getModel( f137_arg2, "attachmentIndex" )
	if f137_local4 then
		f137_local3 = Engine.GetModelValue( f137_local4 )
	end
	local f137_local5 = -1
	local f137_local6 = f137_arg1:getModel( f137_arg2, "itemGroup" )
	if f137_local6 then
		f137_local5 = Engine.GetModelValue( f137_local6 )
	end
	if f137_local0 == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
		Engine.SendItemVote( f137_arg2, f137_local1, f137_arg3 )
	elseif f137_local0 == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
		Engine.SendAttachmentVote( f137_arg2, f137_local3, f137_arg3 )
	elseif f137_local0 == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
		Engine.SendItemAttachmentVote( f137_arg2, f137_local1, f137_local3, f137_arg3 )
	elseif f137_local0 == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
		Engine.SendItemGroupAttachmentVote( f137_arg2, f137_local5, f137_local3, f137_arg3 )
	end
end

function ShowPregameVoteOptions( f138_arg0, f138_arg1, f138_arg2 )
	CoD.OverlayUtility.AddSystemOverlay( "PregameVoteOptions", {
		menuName = "FeatureOverlay",
		frameWidget = "CoD.Pregame_ItemVote_BanProtectPopup",
		title = "MENU_BAN_PROTECT_CAPS",
		description = function ( f139_arg0, f139_arg1 )
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f139_arg0 ), "Pregame.selectedItemName" ), Engine.GetModelValue( f139_arg1:getModel( f139_arg0, "name" ) ) )
			local f139_local0 = f138_arg1:getModel( f139_arg0, "loadoutSlot" )
			return "MENU_BAN_PROTECT_DESC"
		end,
		image = function ( f140_arg0, f140_arg1 )
			local f140_local0 = f140_arg1:getModel( f140_arg0, "image" )
			if f140_local0 then
				return Engine.GetModelValue( f140_local0 )
			else
				return ""
			end
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Unlock,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		state = function ( f141_arg0, f141_arg1 )
			if ItemIsBanned( nil, f141_arg1, f141_arg0 ) == true then
				Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f141_arg0 ), "Pregame.itemVotedBy" ), CoD.CACUtility.GetItemVotedBy( CoD.CACUtility.GetItemInfoFromElementModel( f141_arg0, f138_arg1:getModel() ) ) )
				return Enum.VoteType.VOTE_TYPE_BAN
			elseif ItemIsProtected( nil, f141_arg1, f141_arg0 ) == true then
				Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f141_arg0 ), "Pregame.itemVotedBy" ), CoD.CACUtility.GetItemVotedBy( CoD.CACUtility.GetItemInfoFromElementModel( f141_arg0, f138_arg1:getModel() ) ) )
				return Enum.VoteType.VOTE_TYPE_PROTECT
			else
				return Enum.VoteType.VOTE_TYPE_INVALID
			end
		end,
		listDatasource = function ( f142_arg0, f142_arg1 )
			DataSources.PregameVoteButtons = DataSourceHelpers.ListSetup( "PregameVoteButtons", function ( f143_arg0 )
				local f143_local0 = false
				if ItemIsBanned( nil, f142_arg1, f143_arg0 ) then
					f143_local0 = true
				end
				if f143_local0 == false and ItemIsProtected( nil, f142_arg1, f143_arg0 ) then
					f143_local0 = true
				end
				return {
					{
						models = {
							displayText = "MENU_BAN_CAPS",
							disabled = f143_local0
						},
						properties = {
							action = function ( f144_arg0, f144_arg1, f144_arg2, f144_arg3, f144_arg4 )
								SendItemVote( f144_arg0, f142_arg1, f144_arg2, Enum.VoteType.VOTE_TYPE_BAN )
							end
							
						}
					},
					{
						models = {
							displayText = "",
							image = "uie_img_t7_menu_doublearrow",
							disabled = f143_local0
						},
						properties = {
							selectIndex = true
						}
					},
					{
						models = {
							displayText = "MENU_PROTECT_CAPS",
							disabled = f143_local0 or ItemIsInRestrictionState( nil, f142_arg1, f143_arg0, Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_BANONLY )
						},
						properties = {
							action = function ( f145_arg0, f145_arg1, f145_arg2, f145_arg3, f145_arg4 )
								SendItemVote( f145_arg0, f142_arg1, f145_arg2, Enum.VoteType.VOTE_TYPE_PROTECT )
							end
							
						}
					}
				}
			end, nil, nil, function ( f146_arg0, f146_arg1, f146_arg2 )
				local f146_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
				if f146_arg1.pregameUpdateSubscription then
					f146_arg1:removeSubscription( f146_arg1.pregameUpdateSubscription )
				end
				f146_arg1.pregameUpdateSubscription = f146_arg1:subscribeToModel( f146_local0, function ()
					f146_arg1:updateDataSource( false, false )
				end, false )
			end )
			return "PregameVoteButtons"
		end
	} )
	local f138_local0 = CoD.OverlayUtility.CreateOverlay( f138_arg2, f138_arg0, "PregameVoteOptions", f138_arg2, f138_arg1 )
	f138_local0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ), function ()
		f138_local0:refreshData( f138_arg2, f138_arg1 )
	end, false )
end

function ConfirmPregameVotePass( f149_arg0, f149_arg1, f149_arg2 )
	CoD.OverlayUtility.AddSystemOverlay( "PregamePassConfirm", {
		menuName = "SystemOverlay_Compact",
		title = "MENU_VOTE_FOREFIT_CAPS",
		description = "MENU_VOTE_FOREFIT_DESC",
		image = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.Alert,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		listDatasource = function ()
			DataSources.PregamePassConfirmButtons = DataSourceHelpers.ListSetup( "PregamePassConfirmButtons", function ( f151_arg0 )
				return {
					{
						models = {
							displayText = "MENU_VOTE_FORFEIT_CANCEL_CAPS"
						},
						properties = {
							action = function ( f152_arg0, f152_arg1, f152_arg2, f152_arg3, f152_arg4 )
								GoBack( f152_arg0, f152_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = "MENU_VOTE_FORFEIT_CONFIRM_CAPS"
						},
						properties = {
							action = function ( f153_arg0, f153_arg1, f153_arg2, f153_arg3, f153_arg4 )
								Engine.SendItemVote( f153_arg2, 0, Enum.VoteType.VOTE_TYPE_INVALID )
								GoBack( f153_arg4, f153_arg2 )
							end
							
						}
					}
				}
			end, true, nil )
			return "PregamePassConfirmButtons"
		end
	} )
	CoD.OverlayUtility.CreateOverlay( f149_arg2, f149_arg0, "PregamePassConfirm" )
end

function ShowCACContentWarning( f154_arg0, f154_arg1, f154_arg2 )
	CoD.OverlayUtility.AddSystemOverlay( "PregameCACWarning", {
		menuName = "SystemOverlay_Pregame",
		openMethod = CoD.OverlayUtility.OpenMethods.Overlay,
		categoryType = function ( f155_arg0 )
			return CoD.OverlayUtility.OverlayTypes.GenericMessage
		end,
		frameWidget = "CoD.Pregame_RestrictedContentWarning"
	} )
	CoD.OverlayUtility.CreateOverlay( f154_arg2, f154_arg0, "PregameCACWarning", f154_arg2 )
end

function ShowStreakContentWarning( f156_arg0, f156_arg1, f156_arg2 )
	CoD.OverlayUtility.AddSystemOverlay( "PregameStreakWarning", {
		menuName = "SystemOverlay_Pregame",
		title = "MENU_STREAK_BANNED_CAPS",
		description = "MENU_CAC_CONTENT_BANNED_DESC",
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		openMethod = CoD.OverlayUtility.OpenMethods.Overlay,
		frameWidget = "CoD.Pregame_RestrictedContentWarning"
	} )
	CoD.OverlayUtility.CreateOverlay( f156_arg2, f156_arg0, "PregameStreakWarning" )
end

function SetInitLobbyMenu( f157_arg0, f157_arg1 )
	CoD.LobbyBase.SetInitLobbyMenu( f157_arg0, f157_arg1 )
end

function LobbyToggleNetwork( f158_arg0, f158_arg1, f158_arg2, f158_arg3 )
	for f158_local0 = 1, Engine.GetMaxControllerCount() - 1, 1 do
		LobbyRemoveLocalClientFromLobby( f158_arg0, f158_local0 )
	end
	if f158_arg3 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		if IsOrbis() then
			if Engine.DisplayNpAvailabilityErrors( f158_arg2 ) then
				return 
			elseif not Engine.DisplayUpsellAndContentWarnings( f158_arg2 ) then
				return 
			end
		end
		if CoD.LobbyBase.ForceOffline() == true then
			CoD.OverlayUtility.CreateOverlay( f158_arg2, f158_arg0, "UpdateNeeded" )
			return 
		elseif not Engine.IsDemonwareFetchingDone( f158_arg2 ) then
			Engine.LiveConnectEnableDemonwareConnect()
			CoD.OverlayUtility.CreateOverlay( f158_arg2, f158_arg0, "ConnectingToDemonware" )
			return 
		end
	end
	Engine.LobbyVM_CallFunc( "NetworkModeChanged", {
		controller = f158_arg2,
		networkMode = f158_arg3
	} )
	local f158_local1 = f158_arg0:getParent()
	f158_arg0:close()
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), true )
end

function OpenLobbyToggleNetworkConfirmation( f159_arg0, f159_arg1, f159_arg2, f159_arg3, f159_arg4 )
	local f159_local0 = {}
	local f159_local1, f159_local2 = nil
	local f159_local3 = Engine.GetLobbyNetworkMode()
	if f159_arg2 ~= 0 then
		LuaUtils.UI_ShowWarningMessageDialog( f159_arg2, "MENU_PRIMARY_CLIENT_ONLY" )
		return 
	elseif f159_local3 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		if not Engine.CheckNetConnection() then
			if CoD.isPC then
				LuaUtils.UI_ShowErrorMessageDialog( f159_arg2, "PLATFORM_STEAM_OFFLINE" )
			else
				LuaUtils.UI_ShowErrorMessageDialog( f159_arg2, "XBOXLIVE_NETCONNECTION" )
			end
			return 
		elseif IsOrbis() then
			if not Engine.IsSignedIntoPSN( f159_arg2 ) then
				Engine.DisplayNpError( f159_arg2, "-2141913082" )
				return 
			elseif Engine.DisplayNpAvailabilityErrors( f159_arg2 ) then
				return 
			elseif not Engine.DisplayUpsellAndContentWarnings( f159_arg2 ) then
				return 
			end
		end
		if IsDurango() and not Engine.HasMPPrivileges( f159_arg2 ) then
			Engine.PrivilegeForceCheck( f159_arg2, 254, true )
			return 
		elseif CoD.isPC and Engine.SteamVacBanned( Engine.GetPrimaryController() ) then
			CoD.LobbyBase.FailedDWConnection = true
			LuaUtils.UI_ShowErrorMessageDialog( Engine.GetPrimaryController(), "PLATFORM_VACBANNED" )
			return 
		elseif Engine.IsPlayerQueued( f159_arg2 ) then
			CoD.OverlayUtility.CreateOverlay( f159_arg2, f159_arg0, "LoginQueue" )
			return 
		elseif Engine.IsSignedInToLive( f159_arg2 ) == false then
			if IsOrbis() then
				if not Engine.DisplayNpAvailabilityErrors( f159_arg2 ) then
					CoD.OverlayUtility.CreateOverlay( f159_arg2, f159_arg0, "LobbyPlayNetworkModePopup", Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
				end
			elseif IsDurango() then
				if Engine.HasMPPrivileges( f159_arg2 ) then
					CoD.OverlayUtility.CreateOverlay( f159_arg2, f159_arg0, "LobbyPlayNetworkModePopup", Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
				end
			elseif CoD.isPC then
				if not Engine.IsDemonwareFetchingDone( f159_arg2 ) then
					Engine.LiveConnectEnableDemonwareConnect()
					CoD.OverlayUtility.CreateOverlay( f159_arg2, f159_arg0, "ConnectingToDemonware" )
					return 
				end
				CoD.OverlayUtility.CreateOverlay( f159_arg2, f159_arg0, "LobbyPlayNetworkModePopup", Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
			end
		else
			if not Engine.IsDemonwareFetchingDone( f159_arg2 ) then
				Engine.LiveConnectEnableDemonwareConnect()
				Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f159_arg2 ), "lobbyRoot.anticheat" ), "reputation" ), 0 )
				CoD.OverlayUtility.CreateOverlay( f159_arg2, f159_arg0, "ConnectingToDemonware" )
				return 
			end
			CoD.OverlayUtility.CreateOverlay( f159_arg2, f159_arg0, "LobbyPlayNetworkModePopup", Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
		end
	elseif f159_local3 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		if CheckNavRestrictions( f159_arg0, f159_arg1, f159_arg2, f159_arg4 ) then
			return 
		end
		CoD.OverlayUtility.CreateOverlay( f159_arg2, f159_arg0, "LobbyPlayNetworkModePopup", Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN )
	end
end

function LobbyNoAction( f160_arg0, f160_arg1, f160_arg2, f160_arg3, f160_arg4 )
	
end

function OpenMPFirstTimeFlow( f161_arg0, f161_arg1, f161_arg2, f161_arg3, f161_arg4 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "heroSelectionTutorial" ), true )
	if f161_arg3 == "goBackFirst" then
		f161_arg4 = GoBack( f161_arg0, f161_arg2 )
	end
	f161_arg4.openOverlayAfterSpinner = "WelcomeMenu"
	f161_arg4.openOverlayAfterSpinnerController = f161_arg2
	NavigateToLobby_FirstTimeFlowMP( f161_arg0, f161_arg1, f161_arg2, f161_arg4 )
end

function OpenCPFirstTimeFlow( f162_arg0, f162_arg1, f162_arg2, f162_arg3, f162_arg4 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "firstTimeFlowCPConfirm" ), false )
	f162_arg4.openOverlayAfterSpinner = "CPWelcomeMenu"
	f162_arg4.openOverlayAfterSpinnerController = f162_arg2
	NavigateToLobby_FirstTimeFlowCP( f162_arg0, f162_arg1, f162_arg2, f162_arg4 )
end

function FirstTimeSetup_SetOverview( f163_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f163_arg0 ), "firstTimeFlowState" ), CoD.CCUtility.FirstTimeFlowState.Overview )
end

function FirstTimeSetup_SetChangedCharacter( f164_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f164_arg0 ), "firstTimeFlowState" ), CoD.CCUtility.FirstTimeFlowState.SelectionChanged )
end

function FirstTimeSetup_SetComplete( f165_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f165_arg0 ), "firstTimeFlowState" ), CoD.CCUtility.FirstTimeFlowState.Complete )
end

function FirstTimeSetup_SetNone( f166_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f166_arg0 ), "firstTimeFlowState" ), CoD.CCUtility.FirstTimeFlowState.None )
end

function ShowReportPlayerDialog( f167_arg0, f167_arg1, f167_arg2, f167_arg3 )
	local f167_local0 = f167_arg3.controller
	local f167_local1 = f167_arg3.xuid
	local f167_local2 = Engine.GetPlayerInfo( f167_local0, f167_local1 )
	local f167_local3 = f167_local2.info.gamertag
	if not f167_local3 or f167_local3 == "" then
		f167_local3 = f167_arg3.gamertag
	end
	CoD.OverlayUtility.CreateOverlay( f167_local0, f167_arg0, "ReportPlayer", f167_local0, f167_arg1, {
		controller = f167_local0,
		xuid = f167_local1,
		gamertag = f167_local3,
		clantag = f167_local2.info.clantag,
		emblemBacking = f167_local2.info.emblemBacking
	} )
end

function CheckIfFeatureIsBanned( f168_arg0, f168_arg1 )
	if Engine.IsDedicatedServer() then
		return false
	else
		local f168_local0, f168_local1 = Engine.IsFeatureBanned( f168_arg0, f168_arg1 )
		if f168_local0 then
			return true
		else
			return false
		end
	end
end

function GetFeatureBanInfo( f169_arg0, f169_arg1 )
	if Engine.IsDedicatedServer() then
		return ""
	end
	local f169_local0 = Engine.IsFeaturePermaBanned( f169_arg0, f169_arg1 )
	local f169_local1 = LuaUtils.GetBanMessageForFeature( f169_arg0, f169_arg1, f169_local0 )
	local f169_local2 = ""
	if not f169_local0 then
		f169_local2 = Engine.GetTimeRemainingString( Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f169_arg0 ), "lobbyRoot.anticheat" ), "featureBans" ), "feature_" .. f169_arg1 .. "_end" ) ) - Engine.SystemTimeUInt64() )
	end
	return string.format( "%s\n\n%s", f169_local1, f169_local2 )
end

function PopAnticheatMessageAndGoForward_MP( f170_arg0, f170_arg1, f170_arg2, f170_arg3 )
	local f170_local0 = GoBack( f170_arg0, f170_arg2 )
	Engine.PopAnticheatMessage( f170_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.MP )
	NavigateCheckForFirstTime( f170_local0, f170_arg1, f170_arg2, {
		targetName = "MPLobbyMain",
		mode = Enum.eModes.MODE_MULTIPLAYER,
		firstTimeFlowAction = OpenMPFirstTimeFlow
	}, f170_local0 )
end

function PopAnticheatMessageAndGoForward_ZM( f171_arg0, f171_arg1, f171_arg2, f171_arg3 )
	local f171_local0 = GoBack( f171_arg0, f171_arg2 )
	Engine.PopAnticheatMessage( f171_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.ZM )
	NavigateToLobby_SelectionList( f171_local0, f171_arg1, f171_arg2, "ZMLobbyOnline", f171_local0 )
end

function PopAnticheatMessageAndGoForward_Paintshop( f172_arg0, f172_arg1, f172_arg2, f172_arg3 )
	local f172_local0 = GoBack( f172_arg0, f172_arg2 )
	Engine.PopAnticheatMessage( f172_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.UGC )
	OpenPaintshop( f172_local0, f172_arg1, f172_arg2, "", f172_local0 )
end

function PopAnticheatMessageAndGoForward_EmblemEditorFromEmblemSelect( f173_arg0, f173_arg1, f173_arg2, f173_arg3 )
	local f173_local0 = GoBack( f173_arg0, f173_arg2 )
	Engine.PopAnticheatMessage( f173_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.UGC )
	OpenEmblemEditor( f173_arg1, f173_local0, f173_arg2, nil, "EmblemSelect" )
end

function PopAnticheatMessageAndGoForward_EmblemEditorFromPaintjobSelect( f174_arg0, f174_arg1, f174_arg2, f174_arg3 )
	local f174_local0 = GoBack( f174_arg0, f174_arg2 )
	Engine.PopAnticheatMessage( f174_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.UGC )
	OpenEmblemEditor( f174_arg1, f174_local0, f174_arg2, nil, "PaintjobSelect" )
end

function PopAnticheatMessageAndGoForward_Loot( f175_arg0, f175_arg1, f175_arg2, f175_arg3 )
	local f175_local0 = GoBack( f175_arg0, f175_arg2 )
	Engine.PopAnticheatMessage( f175_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.LOOT )
	OpenBlackMarket( f175_local0, nil, f175_arg2 )
end

function PopAnticheatMessageAndGoForward_Arena( f176_arg0, f176_arg1, f176_arg2, f176_arg3 )
	local f176_local0 = GoBack( f176_arg0, f176_arg2 )
	Engine.PopAnticheatMessage( f176_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.ARENA )
	NavigateToLobby_SelectionList( f176_local0, f176_arg1, f176_arg2, "MPLobbyOnlineArena", f176_local0 )
end

function GetAnticheatMessageForwardFunction( f177_arg0, f177_arg1, f177_arg2 )
	if f177_arg0 == LuaEnums.ANTICHEAT_MESSAGE_GROUPS.MP then
		return PopAnticheatMessageAndGoForward_MP
	elseif f177_arg0 == LuaEnums.ANTICHEAT_MESSAGE_GROUPS.ZM then
		return PopAnticheatMessageAndGoForward_ZM
	elseif f177_arg0 == LuaEnums.ANTICHEAT_MESSAGE_GROUPS.UGC then
		if f177_arg1 == "EmblemEditor" then
			if f177_arg2 == "EmblemSelect" then
				return PopAnticheatMessageAndGoForward_EmblemEditorFromEmblemSelect
			elseif f177_arg2 == "PaintjobSelect" then
				return PopAnticheatMessageAndGoForward_EmblemEditorFromPaintjobSelect
			end
		elseif f177_arg1 == "Paintshop" then
			return PopAnticheatMessageAndGoForward_Paintshop
		end
	elseif f177_arg0 == LuaEnums.ANTICHEAT_MESSAGE_GROUPS.LOOT then
		return PopAnticheatMessageAndGoForward_Loot
	elseif f177_arg0 == LuaEnums.ANTICHEAT_MESSAGE_GROUPS.ARENA then
		return PopAnticheatMessageAndGoForward_Arena
	end
end

function DisplayAnticheatMessage( f178_arg0, f178_arg1, f178_arg2, f178_arg3, f178_arg4 )
	if Engine.IsDedicatedServer() then
		return 
	else
		local f178_local0 = GetAnticheatMessageForwardFunction( f178_arg2, f178_arg3, f178_arg4 )
		local f178_local1 = Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f178_arg1 ), "lobbyRoot.anticheat" ), "message" )
		CoD.OverlayUtility.CreateOverlay( f178_arg1, f178_arg0, "AnticheatMessage", Engine.GetModelValue( Engine.GetModel( f178_local1, "string" ) ), Engine.GetModelValue( Engine.GetModel( f178_local1, "url" ) ), f178_local0 )
	end
end

function OpenAnticheatPolicyInBrowser( f179_arg0, f179_arg1, f179_arg2, f179_arg3 )
	if Engine.IsDedicatedServer() then
		return 
	else
		Engine.OpenAnticheatPolicyInBrowser( f179_arg2, Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f179_arg2 ), "lobbyRoot.anticheat" ), "message" ), "url" ) ) )
	end
end

function NavigateCheckForFirstTime( f180_arg0, f180_arg1, f180_arg2, f180_arg3, f180_arg4 )
	if CheckNavRestrictions( f180_arg0, f180_arg1, f180_arg2, f180_arg4 ) then
		return 
	elseif f180_arg3.targetName == "MPLobbyMain" then
		if Engine.PushAnticheatMessageToUI( f180_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.MP ) then
			DisplayAnticheatMessage( f180_arg0, f180_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.MP, "", "" )
			return 
		end
		for f180_local0 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
			if CheckIfFeatureIsBanned( f180_local0, LuaEnums.FEATURE_BAN.LIVE_MP ) then
				LuaUtils.UI_ShowErrorMessageDialog( f180_arg2, GetFeatureBanInfo( f180_local0, LuaEnums.FEATURE_BAN.LIVE_MP ) )
				return 
			end
		end
		if Engine.GetUsedControllerCount() > 1 then
			for f180_local1 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
				if CheckIfFeatureIsBanned( f180_local1, LuaEnums.FEATURE_BAN.MP_SPLIT_SCREEN ) then
					LuaUtils.UI_ShowErrorMessageDialog( f180_arg2, GetFeatureBanInfo( f180_local1, LuaEnums.FEATURE_BAN.MP_SPLIT_SCREEN ) )
					return 
				end
			end
		end
	end
	if f180_arg3.targetName == "CPLobbyOnline" then
		for f180_local0 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
			if CheckIfFeatureIsBanned( f180_local0, LuaEnums.FEATURE_BAN.LIVE_CP ) then
				LuaUtils.UI_ShowErrorMessageDialog( f180_arg2, GetFeatureBanInfo( f180_local0, LuaEnums.FEATURE_BAN.LIVE_CP ) )
				return 
			end
		end
		if Engine.GetUsedControllerCount() > 1 then
			for f180_local1 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
				if CheckIfFeatureIsBanned( f180_local1, LuaEnums.FEATURE_BAN.CP_SPLIT_SCREEN ) then
					LuaUtils.UI_ShowErrorMessageDialog( f180_arg2, GetFeatureBanInfo( f180_local1, LuaEnums.FEATURE_BAN.CP_SPLIT_SCREEN ) )
					return 
				end
			end
		end
	end
	if IsFirstTimeSetup( f180_arg2, f180_arg3.mode ) then
		f180_arg3.firstTimeFlowAction( f180_arg0, f180_arg1, f180_arg2, f180_arg3.targetName, f180_arg4 )
	else
		NavigateToLobby_SelectionList( f180_arg0, f180_arg1, f180_arg2, f180_arg3.targetName, f180_arg4 )
	end
end

function ShouldShowNightmares( f181_arg0 )
	return true
end

function OpenChooseCharacterFromFirstTimeFlow( f182_arg0, f182_arg1, f182_arg2, f182_arg3, f182_arg4 )
	CoD.CCUtility.customizationMode = Enum.eModes.MODE_MULTIPLAYER
	local f182_local0 = CoD.LobbyBase.OpenChooseCharacterLoadout( f182_arg4, f182_arg2, LuaEnums.CHOOSE_CHARACTER_OPENED_FROM.FIRST_TIME )
	f182_local0.previousMode = Engine.GetMostRecentPlayedMode( f182_arg2 )
end

function SetCharacterModeToSessionMode( f183_arg0, f183_arg1, f183_arg2, f183_arg3 )
	CoD.CCUtility.customizationMode = f183_arg3
end

function SetCharacterModeToCurrentSessionMode( f184_arg0, f184_arg1, f184_arg2 )
	CoD.CCUtility.customizationMode = Engine.CurrentSessionMode()
end

function SetFirstTimeSetupComplete_MP( f185_arg0, f185_arg1, f185_arg2, f185_arg3, f185_arg4 )
	Engine.SetFirstTimeComplete( f185_arg2, Enum.eModes.MODE_MULTIPLAYER, true )
	FirstTimeSetup_SetNone( f185_arg2 )
end

function OpenFindMatch( f186_arg0, f186_arg1, f186_arg2, f186_arg3, f186_arg4 )
	if CheckNavRestrictions( f186_arg0, f186_arg1, f186_arg2, f186_arg4 ) then
		return 
	else
		CoD.LobbyBase.OpenFindMatch( f186_arg4, f186_arg2 )
	end
end

function OpenCompetitivePlaylist( f187_arg0, f187_arg1, f187_arg2, f187_arg3, f187_arg4 )
	CoD.LobbyBase.OpenCompetitivePlaylist( f187_arg4, f187_arg2 )
end

function OpenFreerunMapSelection( f188_arg0, f188_arg1, f188_arg2, f188_arg3, f188_arg4 )
	CoD.LobbyBase.OpenFreerunMapSelection( f188_arg4, f188_arg2 )
end

function OpenMPPublicLobbyLeaderboard( f189_arg0, f189_arg1, f189_arg2, f189_arg3, f189_arg4 )
	CoD.LobbyBase.OpenMPPublicLobbyLeaderboard( f189_arg4, f189_arg2 )
end

function OpenMPCustomLobbyLeaderboard( f190_arg0, f190_arg1, f190_arg2, f190_arg3, f190_arg4 )
	CoD.LobbyBase.OpenMPCustomLobbyLeaderboard( f190_arg4, f190_arg2 )
end

function OpenFreerunLeaderboards( f191_arg0, f191_arg1, f191_arg2, f191_arg3, f191_arg4 )
	CoD.LobbyBase.OpenFreerunLeaderboards( f191_arg4, f191_arg2 )
end

function OpenArenaMasterLeaderboards( f192_arg0, f192_arg1, f192_arg2, f192_arg3, f192_arg4 )
	CoD.LobbyBase.OpenArenaMasterLeaderboards( f192_arg4, f192_arg2 )
end

function OpenDOALeaderboards( f193_arg0, f193_arg1, f193_arg2, f193_arg3, f193_arg4 )
	CoD.LobbyBase.OpenDOALeaderboards( f193_arg4, f193_arg2 )
end

function OpenSetupGameMP( f194_arg0, f194_arg1, f194_arg2, f194_arg3, f194_arg4 )
	CoD.LobbyBase.OpenSetupGame( f194_arg4, f194_arg2, "GameSettingsFlyoutMP" )
end

function OpenBonusModesFlyout( f195_arg0, f195_arg1, f195_arg2, f195_arg3, f195_arg4 )
	CoD.LobbyBase.OpenSetupGame( f195_arg4, f195_arg2, "BonusModesFlyout" )
end

function OpenChangeMapZM( f196_arg0, f196_arg1, f196_arg2, f196_arg3, f196_arg4 )
	CoD.perController[f196_arg2].choosingZMPlaylist = false
	CoD.LobbyBase.ZMOpenChangeMap( f196_arg4, f196_arg2, CoD.LobbyBase.MapSelect.SELECT, nil )
end

function OpenSetupGame( f197_arg0, f197_arg1, f197_arg2, f197_arg3, f197_arg4 )
	CoD.LobbyBase.OpenSetupGame( f197_arg4, f197_arg2, "GameSettingsFlyout" )
end

function OpenBubbleGumPacksMenu( f198_arg0, f198_arg1, f198_arg2, f198_arg3, f198_arg4 )
	CoD.LobbyBase.OpenBubbleGumBuffs( f198_arg4, f198_arg2 )
end

function OpenMegaChewFactorymenu( f199_arg0, f199_arg1, f199_arg2, f199_arg3, f199_arg4 )
	CoD.LobbyBase.OpenMegaChewFactory( f199_arg4, f199_arg2 )
end

function OpenGobbleGumCookbookMenu( f200_arg0, f200_arg1, f200_arg2, f200_arg3, f200_arg4 )
	CoD.LobbyBase.OpenGobbleGumCookbook( f200_arg4, f200_arg2 )
end

function OpenWeaponBuildKits( f201_arg0, f201_arg1, f201_arg2, f201_arg3, f201_arg4 )
	CoD.LobbyBase.OpenWeaponBuildKits( f201_arg4, f201_arg2 )
end

function OpenChangeMap( f202_arg0, f202_arg1, f202_arg2, f202_arg3, f202_arg4 )
	CoD.LobbyBase.OpenChangeMap( f202_arg0, f202_arg2 )
end

function OpenChangeGameMode( f203_arg0, f203_arg1, f203_arg2, f203_arg3, f203_arg4 )
	CoD.LobbyBase.OpenChangeGameMode( f203_arg0, f203_arg2 )
end

function OpenEditGameRules( f204_arg0, f204_arg1, f204_arg2, f204_arg3, f204_arg4 )
	CoD.LobbyBase.OpenEditGameRules( f204_arg0, f204_arg2 )
end

function OpenBotSettings( f205_arg0, f205_arg1, f205_arg2, f205_arg3, f205_arg4 )
	CoD.LobbyBase.OpenBotSettings( f205_arg0, f205_arg2 )
end

function OpenServerSettings( f206_arg0, f206_arg1, f206_arg2, f206_arg3, f206_arg4 )
	CoD.LobbyBase.OpenServerSettings( f206_arg0, f206_arg2 )
end

function OpenOptions( f207_arg0, f207_arg1, f207_arg2, f207_arg3, f207_arg4 )
	CoD.LobbyBase.OpenOptions( f207_arg4, f207_arg2 )
end

function OpenZMFindMatch( f208_arg0, f208_arg1, f208_arg2, f208_arg3, f208_arg4 )
	if CheckNavRestrictions( f208_arg0, f208_arg1, f208_arg2, f208_arg4 ) then
		return 
	else
		CoD.perController[f208_arg2].choosingZMPlaylist = true
		CoD.LobbyBase.OpenFindMatch( f208_arg4, f208_arg2, "ZMMapSelection" )
	end
end

function OpenZMMapSelectLaunch( f209_arg0, f209_arg1, f209_arg2, f209_arg3, f209_arg4 )
	local f209_local0 = {
		controller = f209_arg2,
		actionFunc = function ( f210_arg0 )
			Engine.SetPlaylistID( 150 )
			Engine.RunPlaylistRules( Engine.GetPrimaryController() )
			CoD.perController[Engine.GetPrimaryController()].choosingZMPlaylist = false
			Dvar.zm_private_rankedmatch:set( true )
			CoD.LobbyBase.ZMOpenChangeMap( f209_arg4, Engine.GetPrimaryController(), CoD.LobbyBase.MapSelect.LAUNCH, f210_arg0 )
		end
	}
	if Engine.GetUsedControllerCount() > 1 and Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyClientType.LOBBY_CLIENT_TYPE_ALL ) == Engine.GetUsedControllerCount() then
		CoD.OverlayUtility.CreateOverlay( f209_arg2, f209_arg0, "LobbyLocalClientWarning", f209_local0 )
		return 
	elseif Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) == 0 or Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyClientType.LOBBY_CLIENT_TYPE_ALL ) > 1 then
		LuaUtils.UI_ShowErrorMessageDialog( f209_arg2, "MENU_TOO_MANY_CLIENTS_FOR_SOLO_GAME" )
		return 
	else
		Engine.SetPlaylistID( 150 )
		Engine.RunPlaylistRules( f209_arg2 )
		CoD.perController[f209_arg2].choosingZMPlaylist = false
		Dvar.zm_private_rankedmatch:set( true )
		CoD.LobbyBase.ZMOpenChangeMap( f209_arg4, f209_arg2, CoD.LobbyBase.MapSelect.LAUNCH, f209_arg3 )
	end
end

function OpenZMMapSelectSelect( f211_arg0, f211_arg1, f211_arg2, f211_arg3, f211_arg4 )
	CoD.perController[f211_arg2].choosingZMPlaylist = false
	CoD.LobbyBase.ZMOpenChangeMap( f211_arg4, f211_arg2, CoD.LobbyBase.MapSelect.SELECT, f211_arg3 )
end

function ProcessZMMapSelectListAction( f212_arg0, f212_arg1, f212_arg2, f212_arg3 )
	if f212_arg1.mapId ~= nil then
		SetMap( f212_arg2, f212_arg1.mapId, false )
		f212_arg0.mapSelected = true
	end
	GoBack( f212_arg0, f212_arg2 )
end

function OpenMissionSelect( f213_arg0, f213_arg1, f213_arg2, f213_arg3, f213_arg4 )
	if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "cpLobby" ), "lan" )
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "cpLobby" ), "custom" )
	end
	Engine.SetDvar( "ui_blocksaves", "1" )
	f213_arg4:openPopup( "CPMissionSelect", f213_arg2 )
end

function OpenPublicGameSelect( f214_arg0, f214_arg1, f214_arg2, f214_arg3, f214_arg4 )
	if CheckNavRestrictions( f214_arg0, f214_arg1, f214_arg2, f214_arg4 ) then
		return 
	else
		Engine.SetDvar( "ui_blocksaves", "1" )
		f214_arg4:openPopup( "CPPublicGameSelect", f214_arg2 )
	end
end

function OpenMissionOverview( f215_arg0, f215_arg1, f215_arg2, f215_arg3, f215_arg4 )
	f215_arg4:openPopup( "CPMissionOverviewFrontend", f215_arg2 )
end

function OpenDifficultySelect( f216_arg0, f216_arg1, f216_arg2, f216_arg3, f216_arg4 )
	local f216_local0 = f216_arg4:openPopup( "CPSelectDifficulty", f216_arg2 )
	f216_local0.disableConfirmSelection = f216_arg3
end

function OpenCAC( f217_arg0, f217_arg1, f217_arg2, f217_arg3, f217_arg4 )
	CoD.LobbyBase.OpenCAC( f217_arg4, f217_arg2 )
end

function OpenServerBrowser( f218_arg0, f218_arg1, f218_arg2, f218_arg3, f218_arg4 )
	OpenPopup( f218_arg4, "LobbyServerBrowserOnline", f218_arg2 )
end

function OpenServerBrowserFilters( f219_arg0, f219_arg1, f219_arg2, f219_arg3, f219_arg4 )
	OpenPopup( f219_arg4, "ServerBrowserFilters", f219_arg2 )
end

function JoinServerBrowser( f220_arg0, f220_arg1, f220_arg2, f220_arg3 )
	local f220_local0 = f220_arg1:getModel()
	if f220_local0 then
		local f220_local1 = Engine.GetModelValue( Engine.GetModel( f220_local0, "serverIndex" ) )
		local f220_local2 = Engine.GetModelValue( Engine.GetModel( f220_local0, "connectAddr" ) )
		if f220_local1 and Engine.GetModelValue( Engine.GetModel( f220_local0, "name" ) ) then
			Engine.SteamServerBrowser_AddFavoriteServer( f220_local1, true )
		end
		if f220_local2 then
			Engine.Exec( f220_arg2, "connect " .. f220_local2 )
		end
		GoBack( f220_arg0, f220_arg2 )
	end
end

function OpenFindLANGame( f221_arg0, f221_arg1, f221_arg2, f221_arg3, f221_arg4 )
	if not Engine.CheckNetConnection() then
		LuaUtils.UI_ShowErrorMessageDialog( f221_arg2, "XBOXLIVE_NETCONNECTION" )
		return 
	elseif Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 2 then
		CoD.OverlayUtility.CreateOverlay( f221_arg2, f221_arg4, "LobbyLocalClientWarning", {
			controller = f221_arg2,
			navToMenu = nil,
			popupName = "LobbyServerBrowserOverlay",
			openFromMenu = f221_arg4
		} )
		return 
	else
		OpenPopup( f221_arg4, "LobbyServerBrowserOverlay", f221_arg2 )
	end
end

function OpenStore( f222_arg0, f222_arg1, f222_arg2, f222_arg3, f222_arg4 )
	if not DisableStore() then
		local f222_local0 = LobbyData:GetCurrentMenuTarget()
		LUI.CoDMetrics.StoreEntry( f222_arg4, f222_arg2, f222_arg3, f222_local0 )
		local f222_local1 = Engine.CreateModel( Engine.GetModelForController( f222_arg2 ), "StoreRoot" )
		Engine.SetModelValue( Engine.CreateModel( f222_local1, "actionSource", true ), f222_arg3 )
		Engine.SetModelValue( Engine.CreateModel( f222_local1, "storeSource", true ), f222_local0.name )
		OpenOverlay( f222_arg4, "Store", f222_arg2 )
	elseif CoD.isPC then
		OpenSteamStore( f222_arg0, f222_arg1, f222_arg2, f222_arg3, f222_arg4 )
	end
end

function SetFocusToCorrectDLCPack( f223_arg0, f223_arg1 )
	if f223_arg0.productList and f223_arg0.productList.itemStencil then
		local f223_local0 = f223_arg0.productList:findItem( {
			productImage = CoD.DLCImages[CoD.DLCFocus]
		}, nil, true, 0 )
	end
end

function OpenBO4Store( f224_arg0, f224_arg1, f224_arg2, f224_arg3, f224_arg4 )
	if not DisableStore() then
		CoD.DLCFocus = 0
		local f224_local0 = OpenOverlay( f224_arg4, "Store_BO4", f224_arg2 )
		local f224_local1 = LobbyData:GetCurrentMenuTarget()
		LUI.CoDMetrics.StoreEntry( f224_arg4, f224_arg2, f224_arg3, f224_local1 )
		local f224_local2 = Engine.CreateModel( Engine.GetModelForController( f224_arg2 ), "StoreRoot" )
		Engine.SetModelValue( Engine.CreateModel( f224_local2, "actionSource", true ), f224_arg3 )
		Engine.SetModelValue( Engine.CreateModel( f224_local2, "storeSource", true ), f224_local1.name )
	end
end

function OpenDLCStore( f225_arg0, f225_arg1, f225_arg2, f225_arg3, f225_arg4 )
	if not DisableStore() then
		CoD.DLCFocus = 0
		if IsPurchaseExperimentActive( f225_arg2, f225_arg4 ) then
			local f225_local0 = f225_arg1:getModel()
			if not f225_local0 then
				if f225_arg4.selectionList and f225_arg4.selectionList.activeWidget then
					f225_local0 = f225_arg4.selectionList.activeWidget:getModel()
				elseif f225_arg4.MapList and f225_arg4.MapList.activeWidget then
					f225_local0 = f225_arg4.MapList.activeWidget:getModel()
				elseif f225_arg4.mapList and f225_arg4.mapList.activeWidget then
					f225_local0 = f225_arg4.mapList.activeWidget:getModel()
				end
			end
			if f225_local0 then
				local f225_local1 = Engine.GetModel( f225_local0, "dlcIndex" )
				if f225_local1 then
					local f225_local2 = Engine.GetModelValue( f225_local1 )
					local f225_local3 = CoD.DLCBits["CONTENT_DLC" .. f225_local2 - CoD.CONTENT_DLCZM0_INDEX]
					if f225_local2 == CoD.CONTENT_DLC0_INDEX then
						f225_local3 = CoD.DLCBits.CONTENT_DLC0ZM
					end
					CoD.DLCFocus = f225_local3
				end
			elseif f225_arg4.selectionList and f225_arg4.selectionList.activeWidget then
				f225_local0 = f225_arg4.selectionList.activeWidget
			end
		end
		local f225_local0 = OpenOverlay( f225_arg4, "Store_DLC", f225_arg2 )
		local f225_local1 = LobbyData:GetCurrentMenuTarget()
		LUI.CoDMetrics.StoreEntry( f225_arg4, f225_arg2, f225_arg3, f225_local1 )
		local f225_local3 = Engine.CreateModel( Engine.GetModelForController( f225_arg2 ), "StoreRoot" )
		Engine.SetModelValue( Engine.CreateModel( f225_local3, "actionSource", true ), f225_arg3 )
		Engine.SetModelValue( Engine.CreateModel( f225_local3, "storeSource", true ), f225_local1.name )
		if IsPurchaseExperimentActive( f225_arg2, f225_arg4 ) then
			SetFocusToCorrectDLCPack( f225_local0.StoreNonFeaturedFrame, f225_arg2 )
		end
	end
end

function MegaChewOpenCodPointsStore( f226_arg0, f226_arg1, f226_arg2, f226_arg3, f226_arg4 )
	if CoD.NotEnoughLD then
		OpenCodPointsStore( f226_arg0, f226_arg1, f226_arg2, "NotEnoughLiquidDivinum", f226_arg4 )
	else
		OpenCodPointsStore( f226_arg0, f226_arg1, f226_arg2, f226_arg3, f226_arg4 )
	end
end

function OpenCodPointsStore( f227_arg0, f227_arg1, f227_arg2, f227_arg3, f227_arg4 )
	if not DisableStore() or CoD.isPC then
		OpenOverlay( f227_arg4, "Store_CodPoints", f227_arg2 )
		if f227_arg3 == "menuName" then
			f227_arg3 = f227_arg4.menuName
		end
		local f227_local0 = LobbyData:GetCurrentMenuTarget()
		LUI.CoDMetrics.StoreEntry( f227_arg4, f227_arg2, f227_arg3, f227_local0 )
		local f227_local1 = Engine.CreateModel( Engine.GetModelForController( f227_arg2 ), "StoreRoot" )
		Engine.SetModelValue( Engine.CreateModel( f227_local1, "actionSource", true ), f227_arg3 )
		Engine.SetModelValue( Engine.CreateModel( f227_local1, "storeSource", true ), f227_local0.name )
	end
end

function OpenSteamStore( f228_arg0, f228_arg1, f228_arg2, f228_arg3, f228_arg4 )
	if not DisableSteamStore() then
		if type( f228_arg3 ) == "number" and f228_arg3 == math.floor( f228_arg3 ) then
			Engine.SteamStore( f228_arg2, f228_arg3 )
		else
			Engine.SteamStore( f228_arg2 )
		end
	end
end

function OpenScorestreaks( f229_arg0, f229_arg1, f229_arg2, f229_arg3, f229_arg4 )
	CoD.LobbyBase.OpenScorestreaks( f229_arg4, f229_arg2 )
end

function OpenEditCodcasterSettings( f230_arg0, f230_arg1, f230_arg2, f230_arg3, f230_arg4 )
	CoD.LobbyBase.OpenEditCodcasterSettings( f230_arg4, f230_arg2 )
end

function OpenTest( f231_arg0, f231_arg1, f231_arg2, f231_arg3, f231_arg4 )
	CoD.LobbyBase.OpenTest( f231_arg4, f231_arg2 )
end

function OpenBarracks( f232_arg0, f232_arg1, f232_arg2, f232_arg3, f232_arg4 )
	CoD.LobbyBase.OpenBarracks( f232_arg4, f232_arg2 )
end

function OpenGenders( f233_arg0, f233_arg1, f233_arg2 )
	CoD.LobbyBase.OpenGenders( f233_arg2, f233_arg1 )
end

function OpenQuit( f234_arg0, f234_arg1, f234_arg2, f234_arg3, f234_arg4 )
	CoD.LobbyBase.OpenQuit( f234_arg4, f234_arg2 )
end

function LobbyMapVoteSelectNext( f235_arg0, f235_arg1 )
	CoD.LobbyBase.LobbyMapVoteSelect( f235_arg0, f235_arg1, Enum.LobbyMapVote.LOBBY_MAPVOTE_NEXT )
end

function LobbyMapVoteSelectPrevious( f236_arg0, f236_arg1 )
	CoD.LobbyBase.LobbyMapVoteSelect( f236_arg0, f236_arg1, Enum.LobbyMapVote.LOBBY_MAPVOTE_PREVIOUS )
end

function LobbyMapVoteSelectRandom( f237_arg0, f237_arg1 )
	CoD.LobbyBase.LobbyMapVoteSelect( f237_arg0, f237_arg1, Enum.LobbyMapVote.LOBBY_MAPVOTE_RANDOM )
end

function ShowManagePartyPopup( f238_arg0, f238_arg1, f238_arg2, f238_arg3, f238_arg4 )
	CoD.perController[f238_arg3].Social_Party = f238_arg1
	CoD.perController[f238_arg3].Social_Party_Action = 0
	local f238_local0 = Engine.GetModel( Engine.GetGlobalModel(), "SocialMainMenu.managePartyButtonText" )
	if f238_local0 then
		if f238_arg4 == "PROMOTE" then
			CoD.perController[f238_arg3].Social_Party_Action = 1
			Engine.SetModelValue( f238_local0, Engine.Localize( "MENU_MANAGE_PARTY_PROMOTE_BUTTON" ) )
		elseif f238_arg4 == "KICK" then
			CoD.perController[f238_arg3].Social_Party_Action = 2
			Engine.SetModelValue( f238_local0, Engine.Localize( "MENU_MANAGE_PARTY_KICK_BUTTON" ) )
		else
			return 
		end
		SetState( f238_arg1, "Hidden" )
		OpenPopup( f238_arg0, "Social_Party_ManagePartyPopup", f238_arg3 )
	end
end

function ManagePartyAction( f239_arg0, f239_arg1, f239_arg2, f239_arg3 )
	local f239_local0 = f239_arg2:getModel( f239_arg3, "xuid" )
	if not f239_local0 then
		return 
	end
	local f239_local1 = Engine.GetModelValue( f239_local0 )
	if CoD.perController[f239_arg3].Social_Party_Action == 1 then
		if Engine.StartPrivateLobbyMigrateTo then
			Engine.StartPrivateLobbyMigrateTo( f239_arg3, f239_local1 )
		end
		GoBackToMenu( GoBack( f239_arg1, f239_arg3 ), f239_arg3, "Lobby" )
	elseif CoD.perController[f239_arg3].Social_Party_Action == 2 and Engine.IsLeader( f239_arg3, Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		Engine.LobbyDisconnectClient( f239_arg3, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f239_local1, Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_KICK )
	end
end

function PromoteToLeader( f240_arg0, f240_arg1, f240_arg2, f240_arg3, f240_arg4 )
	Engine.GiveLeadership( f240_arg3.controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f240_arg3.xuid )
	f240_arg4:goBack( f240_arg2 )
end

function DisconnectClient( f241_arg0, f241_arg1, f241_arg2, f241_arg3, f241_arg4 )
	Engine.LobbyDisconnectClient( f241_arg3.controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f241_arg3.xuid, Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_KICK )
	f241_arg4:goBack( f241_arg2 )
end

function MuteLobbyPlayerLAN( f242_arg0, f242_arg1, f242_arg2 )
	local f242_local0 = CoD.SafeGetModelValue( f242_arg0:getModel(), "xuid" )
	if f242_local0 then
		if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f242_local0 ) then
			Engine.MutePlayer( f242_arg1, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f242_local0 )
		end
		if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, f242_local0 ) then
			Engine.MutePlayer( f242_arg1, Enum.LobbyType.LOBBY_TYPE_GAME, f242_local0 )
		end
		UpdateAllMenuButtonPrompts( f242_arg2, f242_arg1 )
	end
end

function UnmuteLobbyPlayerLAN( f243_arg0, f243_arg1, f243_arg2 )
	local f243_local0 = CoD.SafeGetModelValue( f243_arg0:getModel(), "xuid" )
	if f243_local0 then
		if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f243_local0 ) then
			Engine.UnMutePlayer( f243_arg1, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f243_local0 )
		end
		if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, f243_local0 ) then
			Engine.UnMutePlayer( f243_arg1, Enum.LobbyType.LOBBY_TYPE_GAME, f243_local0 )
		end
		UpdateAllMenuButtonPrompts( f243_arg2, f243_arg1 )
	end
end

function MutePlayer( f244_arg0, f244_arg1, f244_arg2, f244_arg3, f244_arg4 )
	if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f244_arg3.xuid ) then
		Engine.MutePlayer( f244_arg3.controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f244_arg3.xuid )
	end
	if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, f244_arg3.xuid ) then
		Engine.MutePlayer( f244_arg3.controller, Enum.LobbyType.LOBBY_TYPE_GAME, f244_arg3.xuid )
	end
	f244_arg4:goBack( f244_arg2 )
end

function UnMutePlayer( f245_arg0, f245_arg1, f245_arg2, f245_arg3, f245_arg4 )
	if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f245_arg3.xuid ) then
		Engine.UnMutePlayer( f245_arg3.controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f245_arg3.xuid )
	end
	if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, f245_arg3.xuid ) then
		Engine.UnMutePlayer( f245_arg3.controller, Enum.LobbyType.LOBBY_TYPE_GAME, f245_arg3.xuid )
	end
	f245_arg4:goBack( f245_arg2 )
end

function ShowSocialPartyWidget( f246_arg0 )
	if CoD.perController[f246_arg0].Social_Party then
		CoD.perController[f246_arg0].Social_Party:setState( "DefaultState" )
	end
end

function LobbyPartyPrivacy( f247_arg0, f247_arg1, f247_arg2, f247_arg3, f247_arg4 )
	local f247_local0 = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" ), "privacy" )
	local f247_local1 = Engine.GetModelValue( f247_local0 )
	local f247_local2 = 1
	if f247_arg3 == "left" then
		f247_local2 = -1
	elseif f247_arg3 == "right" then
		f247_local2 = 1
	end
	Engine.SetModelValue( f247_local0, (f247_local1 + f247_local2) % Enum.PartyPrivacy.PARTY_PRIVACY_COUNT )
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

function LobbyLANLaunchGame( f252_arg0, f252_arg1, f252_arg2 )
	Engine.SetDvar( "skipto", "" )
	Engine.SetDvar( "sv_saveGameSkipto", "" )
	CoD.LobbyBase.LaunchGame( f252_arg0, f252_arg2, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function LobbyLANServerBrowserSetMainModeFilter( f253_arg0, f253_arg1 )
	CoD.LobbyBase.LobbyLANServerBrowserSetMainModeFilter( f253_arg0, f253_arg1 )
end

function SetTMode( f254_arg0, f254_arg1, f254_arg2 )
	local f254_local0 = f254_arg1:getModel()
	if f254_local0 then
		local f254_local1 = CoD.SafeGetModelValue( f254_local0, "itemIndex" )
		if f254_local1 then
			Engine.SetDvar( "r_tacScan_Layout", f254_local1 )
			CoD.perController[f254_arg2].startMenu_equippedIndex = f254_local1
			f254_arg0.selectionList:updateDataSource()
		end
	end
end

local f0_local0 = function ()
	Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "MapVote.timerActive" ), 1 )
end

function LobbyOnlineCustomLaunchGame_SelectionList( f256_arg0, f256_arg1, f256_arg2 )
	if CheckNavRestrictions( f256_arg0, f256_arg1, f256_arg2, f256_arg0 ) then
		return 
	else
		f0_local0()
		Engine.SetDvar( "skipto", "" )
		Engine.SetDvar( "sv_saveGameSkipto", "" )
		CoD.LobbyBase.LaunchGame( f256_arg0, f256_arg2, Enum.LobbyType.LOBBY_TYPE_GAME )
	end
end

function LobbyOnlineCustomLaunchGame( f257_arg0, f257_arg1 )
	CoD.LobbyBase.LaunchGame( f257_arg0, f257_arg1, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function OpenTheaterSelectFilm( f258_arg0, f258_arg1, f258_arg2, f258_arg3, f258_arg4 )
	CoD.FileshareUtility.SetFileshareMode( f258_arg2, Enum.FileshareMode.FILESHARE_MODE_USER )
	CoD.FileshareUtility.SetCurrentUser( Engine.GetXUID64( f258_arg2 ) )
	CoD.FileshareUtility.SetDirty()
	CoD.LobbyBase.OpenTheaterSelectFilm( f258_arg4, f258_arg2 )
end

function LobbyTheaterStartFilm( f259_arg0, f259_arg1, f259_arg2 )
	f0_local0()
	LobbyTheaterLaunchDemo( f259_arg0, f259_arg1, f259_arg2 )
end

function LobbyTheaterCreateHighlightReel( f260_arg0, f260_arg1, f260_arg2 )
	f0_local0()
	LobbyTheaterLaunchDemo( f260_arg0, f260_arg1, f260_arg2, "CreateHighlightReel" )
end

function LobbyTheaterShoutcastFilm( f261_arg0, f261_arg1, f261_arg2 )
	f0_local0()
	LobbyTheaterLaunchDemo( f261_arg0, f261_arg1, f261_arg2, "Shoutcast" )
end

function GoBackAndDisplayModalDialog( f262_arg0, f262_arg1, f262_arg2 )
	f262_arg2( GoBack( f262_arg0, f262_arg1 ), f262_arg1 )
end

function DisplayPlayGoJoinError( f263_arg0, f263_arg1 )
	f263_arg0:OpenModalDialog( f263_arg0, f263_arg1, "", "MENU_CANNOT_JOIN_DURING_INSTALL", {
		"MPUI_OK"
	}, function ( f264_arg0 )
		return true
	end )
end

function LobbyAcceptInvite( f265_arg0, f265_arg1, f265_arg2 )
	local f265_local0 = {
		controller = f265_arg1,
		xuid = f265_arg2.xuid,
		joinType = Enum.JoinType.JOIN_TYPE_INVITE
	}
	if CoD.LobbyBase.ChunkAnyDownloading() then
		DisplayPlayGoJoinError( f265_arg0, f265_arg1 )
		return 
	else
		Engine.LobbyVM_CallFunc( "Join", f265_local0 )
	end
end

function LobbyQuickJoin( f266_arg0, f266_arg1, f266_arg2, f266_arg3, f266_arg4 )
	local f266_local0 = f266_arg4
	if LobbyData.GetLobbyNav() == LobbyData.UITargets.UI_MODESELECT.id and IsFirstTimeSetup( f266_arg2, Enum.eModes.MODE_MULTIPLAYER ) then
		local f266_local1 = Engine.GetModel( f266_arg1:getModel(), "activity" )
		if f266_local1 and GetSessionModeFromPresenceActivity( Engine.GetModelValue( f266_local1 ) ) == Enum.eModes.MODE_MULTIPLAYER then
			if f266_local0 == true then
				GoBackAndOpenOverlayOnParent( f266_arg0, "MPIntroRequired", f266_arg2 )
			else
				OpenOverlay( f266_arg0, "MPIntroRequired", f266_arg2 )
			end
			return 
		end
	end
	local f266_local2 = false
	local f266_local1 = f266_arg1:getModel( f266_arg2, "joinable" )
	if not f266_local1 then
		f266_local1 = f266_arg1:getModel( f266_arg2, "isJoinable" )
	end
	if f266_local1 ~= nil then
		local f266_local3 = Engine.GetModelValue( f266_local1 )
		if f266_local3 ~= nil and (f266_local3 == Enum.LobbyJoinable.LOBBY_JOINABLE_YES or f266_local3 == Enum.LobbyJoinable.LOBBY_JOINABLE_YES_FRIENDS_ONLY and f266_arg3 == Enum.JoinType.JOIN_TYPE_FRIEND) then
			f266_local2 = true
		end
	end
	if CoD.LobbyBase and CoD.LobbyBase.ChunkAnyDownloading() then
		f266_local2 = false
		if f266_local0 == true then
			GoBackAndDisplayModalDialog( f266_arg0, f266_arg2, DisplayPlayGoJoinError )
		else
			DisplayPlayGoJoinError( f266_arg0:getParentMenu(), f266_arg2 )
		end
	end
	if not f266_local2 then
		return 
	end
	f266_local1 = f266_arg1:getModel( f266_arg2, "xuid" )
	if f266_local1 == nil then
		return 
	end
	local f266_local3 = Engine.GetModelValue( f266_local1 )
	if f266_local3 == nil then
		return 
	end
	local f266_local4 = Enum.JoinType.JOIN_TYPE_NORMAL
	if f266_arg3 ~= nil and f266_arg3 >= 0 and f266_arg3 < Enum.JoinType.JOIN_TYPE_COUNT then
		f266_local4 = f266_arg3
	end
	local f266_local5 = f266_arg2
	if CoD.isDurango and Engine.IsUserGuest( f266_arg2 ) then
		f266_local5 = Engine.GetPrimaryController()
	end
	local f266_local6 = {
		controller = f266_local5,
		xuid = f266_local3,
		joinType = f266_local4,
		platform = false
	}
	if f266_local0 ~= nil and f266_local0 == true then
		local f266_local7 = GoBack( f266_arg0, f266_arg2 )
		if f266_local4 == Enum.JoinType.JOIN_TYPE_GROUPS then
			GoBack( f266_local7, f266_arg2 )
		end
	end
	if Engine.IsInGame() then
		if not Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, f266_local6.xuid ) then
			f266_local6.migrating = not CoDShared.QuitGame( f266_arg2 )
			Engine.LobbyVM_CallFunc( "InGameJoin", f266_local6 )
		end
	else
		Engine.LobbyVM_CallFunc( "Join", f266_local6 )
	end
end

function LobbyJoinFromFriendsMenu( f267_arg0, f267_arg1, f267_arg2 )
	local f267_local0 = Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f267_arg2 ), "friends" ), "tab" ) )
	local f267_local1 = nil
	if f267_local0 == "friends" then
		f267_local1 = Enum.JoinType.JOIN_TYPE_FRIEND
	elseif f267_local0 == "recent" then
		f267_local1 = Enum.JoinType.JOIN_TYPE_NORMAL
	elseif f267_local0 == "groups" then
		f267_local1 = Enum.JoinType.JOIN_TYPE_FRIEND
	elseif f267_local0 == "inbox" then
		f267_local1 = Enum.JoinType.JOIN_TYPE_INVITE
	else
		f267_local1 = Enum.JoinType.JOIN_TYPE_NORMAL
	end
	LobbyQuickJoin( f267_arg0, f267_arg1, f267_arg2, f267_local1, true )
end

function LobbyInviteFriend( f268_arg0, f268_arg1, f268_arg2, f268_arg3 )
	local f268_local0, f268_local1 = nil
	if f268_arg3 then
		f268_local0 = f268_arg3.xuid
		f268_local1 = f268_arg3.gamertag
	else
		f268_local0 = Engine.GetModelValue( f268_arg1:getModel( f268_arg2, "xuid" ) )
		f268_local1 = Engine.GetModelValue( f268_arg1:getModel( f268_arg2, "gamertag" ) )
	end
	if f268_local0 ~= nil then
		if CoD.isPC == true then
			CoD.invitePlayer( f268_arg2, f268_local0 )
		else
			CoD.invitePlayerByGamertag( f268_arg2, f268_local0, f268_local1 )
		end
	end
end

function LobbyInviteFriendGoBack( f269_arg0, f269_arg1, f269_arg2, f269_arg3 )
	LobbyInviteFriend( f269_arg0, f269_arg1, f269_arg2, f269_arg3 )
	GoBack( f269_arg0, f269_arg2 )
end

function OnLoadToggleDebug( f270_arg0, f270_arg1 )
	if Dvar.ui_lobbyDebugVis:get() then
		f270_arg0.btnToggleDebug.buttoninternal0.Text0:setText( Engine.Localize( "ON" ) )
	else
		f270_arg0.btnToggleDebug.buttoninternal0.Text0:setText( Engine.Localize( "OFF" ) )
	end
end

function LobbyToggleDebug( f271_arg0, f271_arg1 )
	Dvar.ui_lobbyDebugVis:set( not Dvar.ui_lobbyDebugVis:get() )
	if Dvar.ui_lobbyDebugVis:get() then
		f271_arg0.btnToggleDebug.buttoninternal0.Text0:setText( Engine.Localize( "ON" ) )
	else
		f271_arg0.btnToggleDebug.buttoninternal0.Text0:setText( Engine.Localize( "OFF" ) )
	end
end

function LobbyToggleMsgLevel( f272_arg0, f272_arg1 )
	local f272_local0 = Dvar.ui_lobbyDebugMsgLevel:get() + 1
	if f272_local0 > 2 then
		f272_local0 = 0
	end
	Dvar.ui_lobbyDebugMsgLevel:set( f272_local0 )
	if f272_local0 == 0 then
		f272_arg0.btnToggleMsgLevel.buttoninternal0.Text0:setText( "PAUSED" )
	elseif f272_local0 == 1 then
		f272_arg0.btnToggleMsgLevel.buttoninternal0.Text0:setText( "LIMITED" )
	else
		f272_arg0.btnToggleMsgLevel.buttoninternal0.Text0:setText( "ALL" )
	end
end

function Lobby_SetMaxLocalPlayers( f273_arg0 )
	local f273_local0 = f273_arg0
	local f273_local1 = Engine.GetMaxLocalControllers()
	if f273_local1 < f273_local0 then
		f273_local0 = f273_local1
	end
	Dvar.lobby_maxLocalPlayers:set( f273_local0 )
end

function LobbyAddLocalClient( f274_arg0, f274_arg1 )
	if Dvar.ui_execdemo_beta:get() then
		return 
	elseif CoD.isPC and AllowGuestSplitScreenOnline() == false and Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		return 
	elseif Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		if CoD.isPS4 then
			if Engine.DisplayNpAvailabilityErrors( f274_arg1 ) then
				return 
			elseif not Engine.DisplayUpsellAndContentWarnings( f274_arg1 ) then
				return 
			end
		end
		if CoD.isDurango and not Engine.IsUserGuest( f274_arg1 ) and not Engine.HasMPPrivileges( f274_arg1 ) and IsLuaCodeVersionAtLeast( 21 ) then
			if Engine.PrivilegeIsChecked( f274_arg1, 254 ) or not Engine.PrivilegeIsInDisplayInfoCache( f274_arg1, 254 ) then
				LuaUtils.UI_ShowErrorMessageDialog( f274_arg1, "XBOXLIVE_MPNOTALLOWED" )
				return 
			end
		end
	end
	local f274_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f274_local0 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if Engine.GetLobbyLocalClientCount( f274_local0 ) < Dvar.lobby_maxLocalPlayers:get() then
		local f274_local1 = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" ) )
		local f274_local2 = -1
		if f274_local1 == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
			f274_local2 = LuaEnums.FEATURE_BAN.MP_SPLIT_SCREEN
		elseif f274_local1 == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
			f274_local2 = LuaEnums.FEATURE_BAN.ZM_SPLIT_SCREEN
		elseif f274_local1 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
			f274_local2 = LuaEnums.FEATURE_BAN.CP_SPLIT_SCREEN
		end
		if f274_local2 >= 0 then
			for f274_local3 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
				if CheckIfFeatureIsBanned( f274_local3, f274_local2 ) then
					LuaUtils.UI_ShowErrorMessageDialog( f274_arg1, GetFeatureBanInfo( f274_local3, f274_local2 ) )
					return 
				end
			end
		end
		CoD.LobbyBase.UnusedGamepadButton( f274_arg0, f274_arg1 )
		if Engine.GetUsedControllerCount() == 3 then
			Engine.ExecNow( nil, "canceldemonwareconnect" )
			LuaUtils.UI_ShowWarningMessageDialog( f274_arg1, "MENU_RESTRICTED_TO_LOCAL_GAMES" )
		end
		local f274_local3 = Engine.DvarInt( nil, "bot_maxAllies" )
		local f274_local4 = Engine.DvarInt( nil, "bot_maxAxis" )
		local f274_local5 = Engine.DvarInt( nil, "bot_maxFree" )
		local f274_local6 = CoD.GameSettingsUtility.MaxSplitscreenBots
		if f274_local6 < f274_local3 + f274_local4 then
			Engine.SetDvar( "bot_maxAllies", f274_local6 / 2 )
			Engine.SetDvar( "bot_maxAxis", f274_local6 / 2 )
		end
		if f274_local6 < f274_local5 then
			Engine.SetDvar( "bot_maxFree", f274_local6 )
		end
		CoD.perController[Engine.GetPrimaryController()].localClientChanged = true
		ForceLobbyButtonUpdate( f274_arg1 )
	end
end

function LobbyRemoveLocalClientFromLobby( f275_arg0, f275_arg1 )
	local f275_local0 = Engine.GetPrimaryController()
	if not Engine.IsControllerBeingUsed( f275_arg1 ) or f275_arg1 == f275_local0 then
		return 
	end
	CoD.LobbyBase.RemoveLocalPlayerFromTheLobby( f275_arg0, f275_arg1 )
	CoD.perController[Engine.GetPrimaryController()].localClientChanged = true
	ForceLobbyButtonUpdate( f275_arg1 )
	if CoD.isPC and Engine.GamepadsConnectedIsActive( f275_local0 ) == false then
		CoD.PCUtil.GamepadsMapped( f275_local0 )
	end
end

function LobbySplitscreenToggle( f276_arg0, f276_arg1 )
	local f276_local0 = 1
	if not LuaUtils.LobbyProcessQueueEmpty() then
		return 
	elseif Engine.IsControllerBeingUsed( f276_local0 ) == true then
		LobbyRemoveLocalClientFromLobby( f276_arg0, f276_local0 )
	elseif not CoD.LobbyBase.SplitscreenControllersAllowed() then
		return 
	elseif Engine.GamepadsConnectedIsActive( f276_local0 ) == true then
		LobbyAddLocalClient( f276_arg0, f276_local0 )
	elseif CoD.PCUtil.GamepadsMapped( f276_local0 ) then
		if f276_arg0.login_splitscreen_player_timer then
			f276_arg0.login_splitscreen_player_timer:close()
			f276_arg0.login_splitscreen_player_timer = nil
		end
		f276_arg0.login_splitscreen_player_count = 0
		f276_arg0.login_splitscreen_player_timer = LUI.UITimer.newElementTimer( 500, false, function ()
			if Engine.AreLocalFilesReady( f276_local0 ) == true then
				LobbyAddLocalClient( f276_arg0, f276_local0 )
				f276_arg0.login_splitscreen_player_timer:close()
				f276_arg0.login_splitscreen_player_timer = nil
			end
			if f276_arg0.login_splitscreen_player_count and f276_arg0.login_splitscreen_player_count > 5 then
				f276_arg0.login_splitscreen_player_timer:close()
				f276_arg0.login_splitscreen_player_timer = nil
			end
		end )
		f276_arg0:addElement( f276_arg0.login_splitscreen_player_timer )
	end
end

function GroupCreationChangePrivacy( f278_arg0, f278_arg1, f278_arg2 )
	local f278_local0 = Engine.GetModelValue( f278_arg1:getModel( f278_arg2, "value" ) )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f278_arg2 ), "groups.createGroup.privacy" ), f278_local0 )
	if f278_local0 == Enum.GroupPrivacy.GROUP_PRIVACY_PUBLIC then
		GroupChangeSetTooltip( f278_arg0, f278_arg2, "PUBLIC" )
	elseif f278_local0 == Enum.GroupPrivacy.GROUP_PRIVACY_PRIVATE then
		GroupChangeSetTooltip( f278_arg0, f278_arg2, "PRIVATE" )
	end
end

function GroupsVariableOptionsSet( f279_arg0, f279_arg1, f279_arg2 )
	local f279_local0 = f279_arg1.Slider.activeWidget
	local f279_local1 = f279_local0:getModel( f279_arg2, "action" )
	local f279_local2 = f279_local0:getModel( f279_arg2, "param" )
	local f279_local3, f279_local4 = nil
	if f279_local1 then
		f279_local3 = Engine.GetModelValue( f279_local1 )
		if f279_local2 then
			f279_local4 = Engine.GetModelValue( f279_local2 )
		end
	else
		f279_local3 = f279_local0.action
		f279_local4 = f279_local0.actionParam
	end
	if f279_local3 then
		f279_local3( f279_arg0, f279_local0, f279_arg2, f279_local4, f279_local0.gridInfoTable.parentGrid.menu )
	end
end

function GroupChangePrivacy( f280_arg0, f280_arg1, f280_arg2 )
	if Engine.GetModelValue( Engine.GetModel( CoD.perController[f280_arg2].selectedGroup, "privacy" ) ) ~= f280_arg1.value then
		MarkGroupDataDirty( f280_arg2, "privacy", true )
		Engine.SetModelValue( Engine.GetModel( CoD.perController[f280_arg2].selectedGroup, "privacy" ), f280_arg1.value )
	end
end

function GroupChangeSearchParamGroupSize( f281_arg0, f281_arg1, f281_arg2 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f281_arg2 ), "groups.searchGroupsGroupSize" ), f281_arg1.value )
end

function GroupChangeSearchParamGroupType( f282_arg0, f282_arg1, f282_arg2 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f282_arg2 ), "groups.searchGroupsGroupType" ), f282_arg1.value )
end

function GroupChangeJoinApprovalType( f283_arg0, f283_arg1, f283_arg2 )
	if Engine.GetSelectedGroupJoinApprovalType() ~= f283_arg1.value then
		MarkGroupDataDirty( f283_arg2, "joinApprovalType", true )
		Engine.SetModelValue( Engine.GetModel( CoD.perController[f283_arg2].selectedGroup, "joinApprovalType" ), f283_arg1.value )
	end
end

function GroupChangeSetTooltip( f284_arg0, f284_arg1, f284_arg2 )
	local f284_local0 = Engine.CreateModel( Engine.GetModelForController( f284_arg1 ), "groups.createGroup.tooltip_title" )
	local f284_local1 = Engine.CreateModel( Engine.GetModelForController( f284_arg1 ), "groups.createGroup.tooltip_description" )
	Engine.SetModelValue( f284_local0, Engine.LocalizeWithoutLocsMarkers( "GROUPS_CREATE_" .. f284_arg2 .. "_DESC_TITLE" ) )
	Engine.SetModelValue( f284_local1, Engine.LocalizeWithoutLocsMarkers( "GROUPS_CREATE_" .. f284_arg2 .. "_DESC" ) )
end

function GroupToggleFriendInvite( f285_arg0, f285_arg1, f285_arg2 )
	if f285_arg1 ~= nil then
		local f285_local0 = f285_arg1:getParent()
		f285_local0 = f285_local0:getParent()
		local f285_local1 = f285_arg1:getModel( f285_arg2, "selected" )
		local f285_local2 = f285_arg1:getModel( f285_arg2, "xuid" )
		local f285_local3 = Engine.GetModel( Engine.GetModelForController( f285_arg2 ), "groups.createGroup.friends_invited_count" )
		local f285_local4 = Engine.GetModelValue( f285_local3 )
		if f285_local1 and f285_local2 then
			local f285_local5 = Engine.GetModelValue( f285_local1 )
			Engine.SetModelValue( f285_local1, not f285_local5 )
			local f285_local6 = Engine.GetModelValue( f285_local2 )
			if f285_local5 then
				Engine.SetModelValue( f285_local3, f285_local4 - 1 )
				Engine.AddFriendToInitialGroupInvitesList( f285_local6, true )
			else
				Engine.SetModelValue( f285_local3, f285_local4 + 1 )
				Engine.AddFriendToInitialGroupInvitesList( f285_local6, false )
			end
		end
	end
end

function ClearInitialGroupsInviteList( f286_arg0, f286_arg1, f286_arg2 )
	Engine.ClearInitialGroupInviteList()
end

function SetSelectingGroupEmblem( f287_arg0, f287_arg1, f287_arg2 )
	CoD.perController[f287_arg0].selectingGroupEmblem = f287_arg1
	CoD.perController[f287_arg0].selectingGroupEmblemForGroupCreation = f287_arg2
end

function SetState( f288_arg0, f288_arg1 )
	f288_arg0:setState( f288_arg1 )
end

function PulseElementToStateAndBack( f289_arg0, f289_arg1 )
	local f289_local0 = f289_arg0.currentState
	f289_arg0:setState( f289_arg1 )
	f289_arg0:setState( f289_local0 )
end

function SetMenuState( f290_arg0, f290_arg1 )
	f290_arg0:setState( f290_arg1 )
end

function SetElementState( f291_arg0, f291_arg1, f291_arg2, f291_arg3 )
	f291_arg1:setState( f291_arg3 )
end

function SetElementStateWithNoTransitionClip( f292_arg0, f292_arg1, f292_arg2, f292_arg3 )
	f292_arg1:setState( f292_arg3, true )
end

function SetElementStateByElementName( f293_arg0, f293_arg1, f293_arg2, f293_arg3 )
	if f293_arg0[f293_arg1] then
		f293_arg0[f293_arg1]:setState( f293_arg3 )
	end
end

function SetElementPropertyByElementName( f294_arg0, f294_arg1, f294_arg2, f294_arg3 )
	if f294_arg0[f294_arg1] then
		f294_arg0[f294_arg1][f294_arg2] = f294_arg3
	end
end

function SetElementDataSource( f295_arg0, f295_arg1, f295_arg2 )
	if f295_arg0[f295_arg1] then
		f295_arg0[f295_arg1]:setDataSource( f295_arg2 )
	end
end

function LockInput( f296_arg0, f296_arg1, f296_arg2 )
	if f296_arg2 ~= nil then
		Engine.LockInput( f296_arg1, f296_arg2 )
	end
end

function PrepareOpenMenuInSafehouse( f297_arg0 )
	if not CoD.isSafehouse then
		return 
	else
		CoD.perController[f297_arg0].inSafehouseMenu = true
		Engine.LockInput( f297_arg0, true )
		Engine.SetUIActive( f297_arg0, true )
	end
end

function PrepareCloseMenuInSafehouse( f298_arg0 )
	if not CoD.isSafehouse then
		return 
	else
		CoD.perController[f298_arg0].inSafehouseMenu = nil
		Engine.LockInput( f298_arg0, false )
		Engine.SetUIActive( f298_arg0, false )
	end
end

function SetupAutoHorizontalAlignArabicText( f299_arg0 )
	local f299_local0 = f299_arg0.setAlignment
	f299_arg0.setAlignment = function ( f300_arg0, f300_arg1 )
		if IsCurrentLanguageReversed() then
			if f300_arg1 & Enum.LUIAlignment.LUI_ALIGNMENT_LEFT ~= 0 then
				f300_arg1 = f300_arg1 & Enum.LUIAlignment.LUI_ALIGNMENT_VERTICAL_MASK | Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT
			elseif f300_arg1 & Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT ~= 0 then
				f300_arg1 = f300_arg1 & Enum.LUIAlignment.LUI_ALIGNMENT_VERTICAL_MASK | Enum.LUIAlignment.LUI_ALIGNMENT_LEFT
			end
		end
		f299_local0( f300_arg0, f300_arg1 )
	end
	
	local f299_local1
	if f299_arg0.getAlignment then
		f299_local1 = f299_arg0:getAlignment()
		if not f299_local1 then
		
		else
			f299_arg0:setAlignment( f299_local1 )
		end
	end
	f299_local1 = Enum.LUIAlignment.LUI_ALIGNMENT_LEFT
end

function ScaleWidgetToLabelCentered( f301_arg0, f301_arg1, f301_arg2 )
	if f301_arg1 == nil then
		return 
	else
		local f301_local0, f301_local1, f301_local2, f301_local3 = f301_arg0:getLocalLeftRight()
		local f301_local4, f301_local5, f301_local6, f301_local7 = f301_arg1:getLocalLeftRight()
		local f301_local8 = f301_arg1:getTextWidth()
		local f301_local9 = (f301_local3 + f301_local2) / 2
		local f301_local10 = f301_local8 + f301_arg2 * 2
		f301_arg0:setLeftRight( f301_local0, f301_local1, f301_local9 - f301_local10 / 2, f301_local9 + f301_local10 / 2 )
	end
end

function ScaleWidgetToLargerLabelCentered( f302_arg0, f302_arg1, f302_arg2, f302_arg3 )
	if f302_arg1 == nil or f302_arg2 == nil then
		return 
	else
		local f302_local0, f302_local1, f302_local2, f302_local3 = f302_arg0:getLocalLeftRight()
		local f302_local4 = math.max( f302_arg1:getTextWidth(), f302_arg2:getTextWidth() )
		local f302_local5 = (f302_local3 + f302_local2) / 2
		local f302_local6 = f302_local4 + f302_arg3 * 2
		f302_arg0:setLeftRight( f302_local0, f302_local1, f302_local5 - f302_local6 / 2, f302_local5 + f302_local6 / 2 )
	end
end

function ScaleWidgetToLabelCenteredWithMinimum( f303_arg0, f303_arg1, f303_arg2, f303_arg3 )
	if f303_arg1 == nil then
		return 
	else
		local f303_local0, f303_local1, f303_local2, f303_local3 = f303_arg0:getLocalLeftRight()
		local f303_local4 = f303_arg1:getTextWidth()
		local f303_local5 = (f303_local3 + f303_local2) / 2
		local f303_local6 = math.max( f303_local4 + f303_arg2 * 2, f303_arg3 )
		f303_arg0:setLeftRight( f303_local0, f303_local1, f303_local5 - f303_local6 / 2, f303_local5 + f303_local6 / 2 )
	end
end

function ScaleWidgetToLabelCenteredWrapped( f304_arg0, f304_arg1, f304_arg2, f304_arg3 )
	if f304_arg1 == nil then
		return 
	end
	local f304_local0, f304_local1, f304_local2, f304_local3 = f304_arg0:getLocalLeftRight()
	local f304_local4, f304_local5, f304_local6, f304_local7 = f304_arg1:getLocalLeftRight()
	if not f304_arg0._originalWidth then
		if f304_local4 == 0 and f304_local5 == 1 then
			f304_arg0._originalWidth = f304_local3 - f304_local2 + f304_local7 - f304_local6
		else
			f304_arg0._originalWidth = f304_local7 - f304_local6
		end
	end
	local f304_local8, f304_local9 = f304_arg1:getTextWidthAndHeight( f304_arg0._originalWidth )
	local f304_local10 = (f304_local3 + f304_local2) / 2
	local f304_local11 = f304_local8 + f304_arg2 * 2
	f304_arg0:setLeftRight( f304_local0, f304_local1, f304_local10 - f304_local11 / 2, f304_local10 + f304_local11 / 2 )
	local f304_local12, f304_local13, f304_local14, f304_local15 = f304_arg0:getLocalTopBottom()
	f304_arg0:setTopBottom( f304_local12, f304_local13, f304_local14, f304_local9 + f304_local14 + f304_arg3 )
end

function ScaleWidgetToLabelCore( f305_arg0, f305_arg1, f305_arg2, f305_arg3 )
	if f305_arg1 == nil then
		return 
	end
	local f305_local0, f305_local1, f305_local2, f305_local3 = f305_arg0:getLocalLeftRight()
	local f305_local4 = f305_arg1:getTextWidth()
	if Engine.IsCurrentLanguageReversed() and f305_arg3 then
		if f305_local4 > 0 then
			local f305_local5, f305_local6, f305_local7, f305_local8 = f305_arg1:getLocalLeftRight()
			f305_arg0.savedWidth = f305_local4 + 2 * f305_local7 + f305_arg2
			if not f305_arg0.widthOverridden then
				f305_arg0:setLeftRight( f305_local0, f305_local1, f305_local3 - f305_arg0.savedWidth, f305_local3 )
				if f305_local5 + f305_local6 == 0 then
					f305_arg1:setLeftRight( f305_local5, f305_local6, f305_local7, f305_local7 + f305_local4 )
				elseif f305_local5 == 0 and f305_local6 == 1 then
					f305_arg1:setLeftRight( f305_local5, f305_local6, f305_local7, f305_local8 )
				end
			end
		else
			f305_arg0:setLeftRight( f305_local0, f305_local1, f305_local3, f305_local3 )
		end
		return 
	end
	local f305_local5, f305_local6, f305_local7, f305_local8 = f305_arg1:getLocalLeftRight()
	if f305_local4 > 0 then
		f305_arg0.savedWidth = f305_local4 + 2 * f305_local7 + f305_arg2
		if not f305_arg0.widthOverridden then
			f305_arg0:setLeftRight( f305_local0, f305_local1, f305_local2, f305_local2 + f305_arg0.savedWidth )
		end
	else
		f305_arg0:setLeftRight( f305_local0, f305_local1, f305_local2, f305_local2 )
	end
end

function SetStateFromText( f306_arg0, f306_arg1, f306_arg2, f306_arg3 )
	local f306_local0 = f306_arg3
	if f306_arg1 and f306_arg1:getTextWidth() ~= 0 then
		f306_local0 = f306_arg2
	end
	f306_arg0:setState( f306_local0 )
end

function ScaleWidgetToLabel( f307_arg0, f307_arg1, f307_arg2 )
	ScaleWidgetToLabelCore( f307_arg0, f307_arg1, f307_arg2, true )
end

function ScaleWidgetToLabelLeftJustify( f308_arg0, f308_arg1, f308_arg2 )
	ScaleWidgetToLabelCore( f308_arg0, f308_arg1, f308_arg2, false )
end

function ScaleWidgetToLabelWithMinimum( f309_arg0, f309_arg1, f309_arg2, f309_arg3 )
	ScaleWidgetToLabelCore( f309_arg0, f309_arg1, f309_arg2, true, f309_arg3 )
end

function ScaleWidgetToLabelWrappedWithMinimum( f310_arg0, f310_arg1, f310_arg2, f310_arg3, f310_arg4 )
	if f310_arg1 == nil then
		return 
	end
	local f310_local0, f310_local1, f310_local2, f310_local3 = f310_arg0:getLocalLeftRight()
	local f310_local4, f310_local5, f310_local6, f310_local7 = f310_arg1:getLocalLeftRight()
	if not f310_arg0._originalWidth then
		f310_arg0._originalWidth = f310_local3 - f310_local2
	end
	if not Engine.IsCurrentLanguageReversed() then
		f310_arg1:setLeftRight( true, false, f310_local6, f310_local6 + f310_arg0._originalWidth )
	end
	local f310_local8, f310_local9 = f310_arg1:getTextWidthAndHeight( f310_arg0._originalWidth )
	f310_local8 = math.max( f310_local8, f310_arg4 )
	if Engine.IsCurrentLanguageReversed() then
		if f310_local8 > 0 then
			if f310_arg0._originalWidth < f310_local8 + 2 * f310_local6 + f310_arg2 then
				f310_local8 = f310_arg0._originalWidth - 2 * f310_local6 - f310_arg2
			end
			f310_arg0:setLeftRight( f310_local0, f310_local1, f310_local3 - f310_local8 - f310_local6 - f310_arg2, f310_local3 )
			if f310_local4 + f310_local5 == 0 then
				f310_arg1:setLeftRight( f310_local4, f310_local5, f310_local6, f310_local6 + f310_local8 )
			end
		else
			f310_arg0:setLeftRight( f310_local0, f310_local1, f310_local3, f310_local3 )
		end
	else
		if f310_arg0._originalWidth < f310_local8 then
			f310_local8 = f310_arg0._originalWidth
		end
		if f310_local8 > 0 then
			f310_arg0.savedWidth = f310_local8 + 2 * f310_local6 + f310_arg2
			f310_arg0:setLeftRight( f310_local0, f310_local1, f310_local2, f310_local2 + f310_arg0.savedWidth )
		else
			f310_arg0:setLeftRight( f310_local0, f310_local1, f310_local2, f310_local2 )
		end
	end
	local f310_local10, f310_local11, f310_local12, f310_local13 = f310_arg0:getLocalTopBottom()
	f310_arg0:setTopBottom( f310_local10, f310_local11, f310_local12, f310_local12 + f310_local9 + f310_arg3 )
end

function ScaleWidgetToLabelWrapped( f311_arg0, f311_arg1, f311_arg2, f311_arg3 )
	ScaleWidgetToLabelWrappedWithMinimum( f311_arg0, f311_arg1, f311_arg2, f311_arg3, 0 )
end

function ScaleWidgetToLabelWrappedUp( f312_arg0, f312_arg1, f312_arg2, f312_arg3 )
	if f312_arg1 == nil then
		return 
	end
	local f312_local0, f312_local1, f312_local2, f312_local3 = f312_arg0:getLocalLeftRight()
	local f312_local4, f312_local5, f312_local6, f312_local7 = f312_arg1:getLocalLeftRight()
	if not f312_arg0._originalWidth then
		f312_arg0._originalWidth = f312_local3 - f312_local2
	end
	if not Engine.IsCurrentLanguageReversed() then
		f312_arg1:setLeftRight( true, false, f312_local6, f312_local6 + f312_arg0._originalWidth )
	end
	local f312_local8, f312_local9 = f312_arg1:getTextWidthAndHeight( f312_arg0._originalWidth )
	if Engine.IsCurrentLanguageReversed() then
		if f312_local8 > 0 then
			if f312_arg0._originalWidth < f312_local8 then
				f312_arg0:setLeftRight( f312_local0, f312_local1, f312_local3 - f312_arg0._originalWidth, f312_local3 )
			else
				f312_arg0.savedWidth = f312_local8 + 2 * f312_local6 + f312_arg2
				f312_arg0:setLeftRight( f312_local0, f312_local1, f312_local3 - f312_arg0.savedWidth, f312_local3 )
				if f312_local4 + f312_local5 == 0 then
					f312_arg1:setLeftRight( f312_local4, f312_local5, f312_local6, f312_local6 + f312_local8 )
				end
			end
		else
			f312_arg0:setLeftRight( f312_local0, f312_local1, f312_local3, f312_local3 )
		end
		return 
	elseif f312_arg0._originalWidth < f312_local8 then
		f312_arg0:setLeftRight( f312_local0, f312_local1, f312_local2, f312_local2 + f312_arg0._originalWidth )
	elseif f312_local8 > 0 then
		f312_arg0.savedWidth = f312_local8 + 2 * f312_local6 + f312_arg2
		f312_arg0:setLeftRight( f312_local0, f312_local1, f312_local2, f312_local2 + f312_arg0.savedWidth )
	else
		f312_arg0:setLeftRight( f312_local0, f312_local1, f312_local2, f312_local2 )
	end
	local f312_local10, f312_local11, f312_local12, f312_local13 = f312_arg0:getLocalTopBottom()
	f312_arg0:setTopBottom( f312_local10, f312_local11, f312_local13 - f312_local9 - f312_arg3, f312_local13 )
end

function ScaleWidgetToLabelWrappedLeftAlign( f313_arg0, f313_arg1, f313_arg2, f313_arg3 )
	if not f313_arg1 then
		return 
	end
	local f313_local0, f313_local1, f313_local2, f313_local3 = f313_arg0:getLocalLeftRight()
	local f313_local4, f313_local5, f313_local6, f313_local7 = f313_arg1:getLocalLeftRight()
	if not f313_arg0._originalWidth then
		f313_arg0._originalWidth = f313_local3 - f313_local2
	end
	local f313_local8, f313_local9 = f313_arg1:getTextWidthAndHeight()
	if f313_arg0._originalWidth < f313_local8 or Engine.IsCurrentLanguageReversed() then
		f313_local8 = f313_arg0._originalWidth
	end
	if f313_local8 > 0 then
		f313_arg0.savedWidth = f313_local8 + 2 * f313_local6 + f313_arg2
		f313_arg0:setLeftRight( true, false, 0, f313_arg0.savedWidth )
	else
		f313_arg0:setLeftRight( f313_local0, f313_local1, f313_local2, f313_local2 )
	end
	local f313_local10, f313_local11, f313_local12, f313_local13 = f313_arg0:getLocalTopBottom()
	f313_arg0:setTopBottom( f313_local10, f313_local11, f313_local12, f313_local9 + f313_local12 + f313_arg3 )
end

function ScaleWidgetToLabelWrappedCenterAlign( f314_arg0, f314_arg1, f314_arg2, f314_arg3 )
	if not f314_arg1 then
		return 
	end
	local f314_local0, f314_local1, f314_local2, f314_local3 = f314_arg0:getLocalLeftRight()
	local f314_local4, f314_local5, f314_local6, f314_local7 = f314_arg1:getLocalLeftRight()
	if not f314_arg0._originalWidth then
		f314_arg0._originalWidth = f314_local3 - f314_local2
	end
	local f314_local8, f314_local9 = f314_arg1:getTextWidthAndHeight( f314_arg0._originalWidth )
	if f314_arg0._originalWidth < f314_local8 then
		f314_local8 = f314_arg0._originalWidth
	end
	if f314_local8 > 0 then
		f314_arg0.savedWidth = f314_local8 + 2 * f314_local6 + f314_arg2
		f314_arg0:setLeftRight( false, false, -f314_arg0.savedWidth / 2, f314_arg0.savedWidth / 2 )
	else
		f314_arg0:setLeftRight( f314_local0, f314_local1, f314_local2, f314_local2 )
	end
	local f314_local10, f314_local11, f314_local12, f314_local13 = f314_arg0:getLocalTopBottom()
	f314_arg0:setTopBottom( f314_local10, f314_local11, f314_local12, f314_local9 + f314_local12 + f314_arg3 )
end

function ScaleWidgetToLabelWrappedRightAlign( f315_arg0, f315_arg1, f315_arg2, f315_arg3 )
	if not f315_arg1 then
		return 
	end
	local f315_local0, f315_local1, f315_local2, f315_local3 = f315_arg0:getLocalLeftRight()
	local f315_local4, f315_local5, f315_local6, f315_local7 = f315_arg1:getLocalLeftRight()
	if not f315_arg0._originalWidth then
		f315_arg0._originalWidth = f315_local3 - f315_local2
	end
	local f315_local8, f315_local9 = f315_arg1:getTextWidthAndHeight( f315_arg0._originalWidth )
	if f315_arg0._originalWidth < f315_local8 then
		f315_local8 = f315_arg0._originalWidth
	end
	if f315_local8 > 0 then
		f315_arg0.savedWidth = f315_local8 + 2 * f315_local6 + f315_arg2
		f315_arg0:setLeftRight( false, true, -f315_arg0.savedWidth, 0 )
	else
		f315_arg0:setLeftRight( f315_local0, f315_local1, f315_local2, f315_local2 )
	end
	local f315_local10, f315_local11, f315_local12, f315_local13 = f315_arg0:getLocalTopBottom()
	f315_arg0:setTopBottom( f315_local10, f315_local11, f315_local12, f315_local9 + f315_local12 + f315_arg3 )
end

function UpdateWidgetHeightToMultilineText( f316_arg0, f316_arg1, f316_arg2 )
	local f316_local0, f316_local1 = f316_arg1:getTextWidthAndHeight()
	f316_arg0:setHeight( f316_local1 + f316_arg2 * 2 )
end

function UpdateWidgetHeightToMultilineTextWithMinimum( f317_arg0, f317_arg1, f317_arg2, f317_arg3 )
	local f317_local0, f317_local1 = f317_arg1:getTextWidthAndHeight()
	f317_arg0:setHeight( math.max( f317_local1 + f317_arg2 * 2, f317_arg3 ) )
end

function OverrideWidgetWidth( f318_arg0, f318_arg1 )
	local f318_local0, f318_local1, f318_local2, f318_local3 = f318_arg0:getLocalLeftRight()
	f318_arg0.savedWidth = f318_local3 - f318_local2
	f318_arg0.widthOverridden = true
	if f318_local1 == 0.5 and f318_local0 == 0.5 then
		f318_arg0.savedCenter = (f318_local2 + f318_local3) / 2
		f318_arg0:setLeftRight( f318_local0, f318_local1, f318_arg0.savedCenter - f318_arg1 / 2, f318_arg0.savedCenter + f318_arg1 / 2 )
	else
		f318_arg0.savedCenter = nil
		f318_arg0:setLeftRight( f318_local0, f318_local1, f318_local2, f318_local2 + f318_arg1 )
	end
	local f318_local4 = f318_arg0:getParent()
	if f318_local4 then
		f318_local4:setLayoutCached( false )
	end
end

function RestoreWidgetWidth( f319_arg0 )
	if f319_arg0.savedWidth == nil then
		return 
	end
	f319_arg0.widthOverridden = nil
	local f319_local0, f319_local1, f319_local2, f319_local3 = f319_arg0:getLocalLeftRight()
	if f319_arg0.savedCenter == nil then
		f319_arg0:setLeftRight( f319_local0, f319_local1, f319_local2, f319_local2 + f319_arg0.savedWidth )
	else
		f319_arg0:setLeftRight( f319_local0, f319_local1, f319_arg0.savedCenter - f319_arg0.savedWidth / 2, f319_arg0.savedCenter + f319_arg0.savedWidth / 2 )
	end
end

function SetWidth( f320_arg0, f320_arg1 )
	f320_arg0.savedWidth = f320_arg0:getWidth()
	f320_arg0:setWidth( f320_arg1 )
end

function ScaleToElementWidth( f321_arg0, f321_arg1 )
	local f321_local0, f321_local1, f321_local2, f321_local3 = f321_arg1:getLocalLeftRight()
	f321_arg0:setWidth( f321_local3 - f321_local2 )
end

function TrimLabelIfLanguageReversed( f322_arg0, f322_arg1 )
	if Engine.IsCurrentLanguageReversed() then
		if f322_arg1 == nil then
			return 
		else
			local f322_local0, f322_local1, f322_local2, f322_local3 = f322_arg1:getLocalLeftRight()
			f322_arg1:setLeftRight( f322_local0, f322_local1, f322_local2, f322_local2 + f322_arg1:getTextWidth() + 2 )
			return 
		end
	else
		
	end
end

function ScaleParentWidgetToLabel( f323_arg0, f323_arg1, f323_arg2 )
	local f323_local0 = f323_arg0 and f323_arg0:getParent()
	if f323_arg1 == nil or f323_local0 == nil then
		return 
	elseif f323_local0._originalWidth == nil then
		local f323_local1, f323_local2, f323_local3, f323_local4 = f323_local0:getLocalLeftRight()
		f323_local0._originalWidth = f323_local4 - f323_local3
	end
	if Engine.IsCurrentLanguageReversed() then
		local f323_local1, f323_local2, f323_local3, f323_local4 = f323_arg0:getLocalLeftRight()
		local f323_local5, f323_local6, f323_local7, f323_local8 = f323_local0:getLocalLeftRight()
		local f323_local9, f323_local10, f323_local11, f323_local12 = f323_arg1:getLocalLeftRight()
		local f323_local13 = f323_arg1:getTextWidth()
		f323_local0:setLeftRight( f323_local5, f323_local6, f323_local8 - f323_local13 - 2 * (f323_local3 + f323_local11) - f323_arg2, f323_local8 )
		if f323_local9 + f323_local10 == 0 then
			f323_arg1:setLeftRight( f323_local9, f323_local10, f323_local11, f323_local11 + f323_local13 + 2 )
		end
		return 
	end
	local f323_local1, f323_local2, f323_local3, f323_local4 = f323_arg0:getLocalLeftRight()
	local f323_local5, f323_local6, f323_local7, f323_local8 = f323_local0:getLocalLeftRight()
	local f323_local9, f323_local10, f323_local11, f323_local12 = f323_arg1:getLocalLeftRight()
	f323_local0:setLeftRight( f323_local5, f323_local6, f323_local7, f323_local7 + f323_arg1:getTextWidth() + 2 * (f323_local3 + f323_local11) + f323_arg2 )
end

function ScaleParentWidgetToElementLabel( f324_arg0, f324_arg1, f324_arg2 )
	if f324_arg0[f324_arg1] then
		ScaleParentWidgetToLabel( f324_arg0, f324_arg0[f324_arg1], f324_arg2 )
	end
end

function RestoreParentToOriginalWidth( f325_arg0 )
	local f325_local0 = f325_arg0 and f325_arg0:getParent()
	if f325_local0 and f325_local0._originalWidth ~= nil then
		local f325_local1, f325_local2, f325_local3, f325_local4 = f325_local0:getLocalLeftRight()
		f325_local0:setLeftRight( f325_local1, f325_local2, f325_local3, f325_local3 + f325_local0._originalWidth )
	end
end

function ScaleWidgetToLabelRightAligned( f326_arg0, f326_arg1, f326_arg2 )
	if f326_arg1 == nil then
		return 
	elseif Engine.IsCurrentLanguageReversed() then
		local f326_local0, f326_local1, f326_local2, f326_local3 = f326_arg0:getLocalLeftRight()
		local f326_local4, f326_local5, f326_local6, f326_local7 = f326_arg1:getLocalLeftRight()
		local f326_local8 = f326_arg1:getTextWidth()
		if f326_local4 + f326_local5 == 0 then
			f326_arg0:setLeftRight( f326_local0, f326_local1, f326_local3 - f326_local8 - 2 * f326_local6 - f326_arg2, f326_local3 )
		elseif f326_local5 == 1 then
			f326_arg0:setLeftRight( f326_local0, f326_local1, f326_local3 - f326_local8 + 2 * f326_local7 - f326_arg2, f326_local3 )
			f326_arg1:setLeftRight( f326_local4, f326_local5, f326_local7 - f326_local8 - f326_arg2, f326_local7 )
		end
	else
		local f326_local0, f326_local1, f326_local2, f326_local3 = f326_arg0:getLocalLeftRight()
		local f326_local4, f326_local5, f326_local6, f326_local7 = f326_arg1:getLocalLeftRight()
		f326_arg0:setLeftRight( f326_local0, f326_local1, f326_local3 - f326_arg1:getTextWidth() + 2 * f326_local7 - f326_arg2, f326_local3 )
	end
end

function ScaleWidgetToLabelRightAlignedNoReverse( f327_arg0, f327_arg1, f327_arg2 )
	if f327_arg1 == nil then
		return 
	else
		local f327_local0, f327_local1, f327_local2, f327_local3 = f327_arg0:getLocalLeftRight()
		local f327_local4, f327_local5, f327_local6, f327_local7 = f327_arg1:getLocalLeftRight()
		f327_arg0:setLeftRight( f327_local0, f327_local1, f327_local3 - f327_arg1:getTextWidth() + 2 * f327_local7 - f327_arg2, f327_local3 )
	end
end

function ScaleToFitImageElement( f328_arg0, f328_arg1, f328_arg2 )
	local f328_local0 = f328_arg0[f328_arg2]
	if f328_local0 then
		local f328_local1, f328_local2 = f328_local0:getImageDimensions()
		if f328_local1 > 0 and f328_local2 > 0 then
			local f328_local3, f328_local4, f328_local5 = f328_local0:getLocalLeftRight()
			local f328_local6, f328_local7, f328_local8, f328_local9 = f328_local0:getLocalTopBottom()
			local f328_local10, f328_local11, f328_local12, f328_local13 = f328_arg1:getLocalLeftRight()
			local f328_local14, f328_local15, f328_local16, f328_local17 = f328_arg1:getLocalTopBottom()
			f328_arg1:setLeftRight( true, false, f328_local12, math.floor( (f328_local5 * 2 + (f328_local17 + f328_local9 - f328_local8) * f328_local1 / f328_local2 - 1) / 2 ) * 2 )
			f328_arg1:setTopBottom( true, false, f328_local16, f328_local17 )
		end
	end
end

function CloseInGameMenu( f329_arg0, f329_arg1 )
	CoD.InGameMenu.CloseAllInGameMenus( f329_arg0, f329_arg1 )
end

function SetDOAGameMode( f330_arg0, f330_arg1, f330_arg2 )
	Engine.SetDvar( "cp_queued_level", "" )
	SetMap( f330_arg2, "cp_doa_bo3", false )
	Engine.SetGametype( "doa" )
	Engine.SetDvar( "ui_useloadingmovie", "1" )
	Engine.SetDvar( "skipto", "" )
	Engine.SetDvar( "sv_saveGameSkipto", "" )
	Engine.SetDvar( "ui_blocksaves", "1" )
	if not IsLive() then
		Engine.SetLobbyUIScreen( LobbyData.UITargets.UI_DOALOBBYLANGAME.id )
	else
		Engine.SetLobbyUIScreen( LobbyData.UITargets.UI_DOALOBBYONLINE.id )
	end
end

function StartDOAGame( f331_arg0, f331_arg1, f331_arg2 )
	if Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 4 then
		CoD.OverlayUtility.CreateOverlay( f331_arg2, f331_arg0, "LobbyLocalClientWarning", {
			controller = f331_arg2,
			maxLocalClients = 4
		} )
		return 
	else
		SetDOAGameMode( f331_arg0, f331_arg1, f331_arg2 )
		CoD.LobbyBase.LaunchGame( f331_arg0, f331_arg2, Enum.LobbyType.LOBBY_TYPE_GAME )
	end
end

function StartNewGame( f332_arg0, f332_arg1, f332_arg2 )
	if CheckNavRestrictions( f332_arg0, f332_arg1, f332_arg2, f332_arg0 ) then
		return 
	elseif Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 2 then
		CoD.OverlayUtility.CreateOverlay( f332_arg2, f332_arg0, "LobbyLocalClientWarning", {
			controller = f332_arg2,
			maxLocalClients = 2
		} )
		return 
	else
		Dvar.lobby_maxLocalPlayers:set( 2 )
		Engine.SetDvar( "cp_queued_level", "" )
		SetMap( f332_arg2, LuaUtils.GetDefaultMap( LobbyData.GetCurrentMenuTarget() ), false )
		Engine.SetDvar( "ui_useloadingmovie", "1" )
		Engine.SetDvar( "skipto", "" )
		Engine.SetDvar( "sv_saveGameSkipto", "" )
		Engine.SetDvar( "ui_blocksaves", "0" )
		CoD.LobbyBase.LaunchGame( f332_arg0, f332_arg2, Enum.LobbyType.LOBBY_TYPE_GAME )
	end
end

function ReplaySelectedMission( f333_arg0, f333_arg1, f333_arg2 )
	Engine.SetDvar( "ui_useloadingmovie", "1" )
	Engine.SetDvar( "skipto", "" )
	Engine.SetDvar( "sv_saveGameSkipto", "" )
	Engine.SetDvar( "ui_blocksaves", "1" )
	CoD.LobbyBase.LaunchGame( f333_arg0, f333_arg2, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function ResumeFromCheckpoint( f334_arg0, f334_arg1, f334_arg2 )
	if Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 2 then
		CoD.OverlayUtility.CreateOverlay( f334_arg2, f334_arg0, "LobbyLocalClientWarning", {
			controller = f334_arg2,
			maxLocalClients = 2
		} )
		return 
	end
	Dvar.lobby_maxLocalPlayers:set( 2 )
	Engine.SetDvar( "cp_queued_level", "" )
	if Engine.IsCampaignModeZombies() then
		SetMap( f334_arg2, Engine.GetSavedMap(), false )
	else
		local f334_local0 = Engine.GetSavedMapQueuedMap()
		if f334_local0 ~= "" then
			SetMap( f334_arg2, f334_local0, true )
		else
			SetMap( f334_arg2, Engine.GetSavedMap(), false )
		end
	end
	local f334_local0 = Engine.GetSavedMapSkipto()
	Engine.RestoreSavedWorldObject()
	Engine.SetDvar( "ui_useloadingmovie", "1" )
	Engine.SetDvar( "skipto", f334_local0 )
	Engine.SetDvar( "sv_saveGameSkipto", f334_local0 )
	Engine.SetDvar( "ui_blocksaves", "0" )
	CoD.LobbyBase.LaunchGame( f334_arg0, f334_arg2, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function GotoSafehouse( f335_arg0, f335_arg1, f335_arg2 )
	if Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 2 then
		CoD.OverlayUtility.CreateOverlay( f335_arg2, f335_arg0, "LobbyLocalClientWarning", {
			controller = f335_arg2,
			maxLocalClients = 2
		} )
		return 
	end
	Dvar.lobby_maxLocalPlayers:set( 2 )
	local f335_local0 = Engine.GetSavedMapQueuedMap()
	if f335_local0 ~= "" then
		SetMap( f335_arg2, f335_local0, true )
	else
		SetMap( f335_arg2, Engine.GetSavedMap(), true )
	end
	Engine.RestoreSavedWorldObject()
	Engine.SetDvar( "ui_useloadingmovie", "1" )
	Engine.SetDvar( "skipto", "" )
	Engine.SetDvar( "sv_saveGameSkipto", "" )
	Engine.SetDvar( "ui_blocksaves", "1" )
	CoD.LobbyBase.LaunchGame( f335_arg0, f335_arg2, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function SetLobbyServerBrowserFilterForE3( f336_arg0, f336_arg1, f336_arg2 )
	local f336_local0 = nil
	if Dvar.ui_execdemo_cp:get() == true then
		f336_local0 = Enum.LobbyMainMode.LOBBY_MAINMODE_CP
	elseif Dvar.ui_execdemo_e3:get() == true or Dvar.ui_execdemo_e3_host:get() == true then
		f336_local0 = Enum.LobbyMainMode.LOBBY_MAINMODE_MP
	end
	if f336_local0 == nil then
		return 
	else
		Engine.LobbyServerListSetMainModeFilter( f336_local0 )
		CoD.LobbyBase.LobbyLANServerBrowserFilterUpdateEvent( f336_arg0, f336_arg2 )
	end
end

function CloseAllInGameMenus( f337_arg0, f337_arg1 )
	if not Dvar.ui_isSaving:get() then
		CoD.InGameMenu.CloseAllInGameMenus( f337_arg0, {
			name = "close_all_ingame_menus",
			controller = f337_arg1
		} )
	end
end

function GoBackThroughAllAndClose( f338_arg0, f338_arg1 )
	while f338_arg0 do
		while not f338_arg0.menuName do
			f338_arg0 = f338_arg0:getParent()
		end
		local f338_local0, f338_local1 = CoD.Menu.GetNavigationForMenu( f338_arg1, f338_arg0.menuName )
		if f338_local0 == 1 then
			Close( f338_arg0, f338_arg1 )
			return 
		end
		f338_arg0 = GoBack( f338_arg0, f338_arg1 )
	end
	while not f338_arg0.menuName do
		f338_arg0 = f338_arg0:getParent()
	end
	local f338_local0, f338_local1 = CoD.Menu.GetNavigationForMenu( f338_arg1, f338_arg0.menuName )
	if f338_local0 == 1 then
		Close( f338_arg0, f338_arg1 )
		return 
	end
	f338_arg0 = GoBack( f338_arg0, f338_arg1 )
end

function GoBackThroughAll( f339_arg0, f339_arg1 )
	while f339_arg0 do
		f339_arg0 = GoBack( f339_arg0, f339_arg1 )
	end
end

function LobbyGoBack( f340_arg0, f340_arg1 )
	local f340_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	if f340_local0 and Engine.GetModelValue( f340_local0 ) == LobbyData.UITargets.UI_MODESELECT.id then
		if IsPC() then
			CoD.LobbyBase.LobbyQuitOrLeaveParty( f340_arg0, f340_arg1 )
			return true
		end
		DisableAllMenuInput( f340_arg0, true )
	end
	CoD.LobbyBase.LobbyGoBack( f340_arg0, f340_arg1 )
	f340_arg0:playSound( "menu_go_back" )
end

function DisplayPlayGoWarning( f341_arg0, f341_arg1 )
	local f341_local0 = CoD.OverlayUtility.CreateOverlay( f341_arg1, f341_arg0, "GenericModalDialog", "", "MENU_STILLDOWNLOADING", "t7_icon_connect_overlays_bkg", {
		"MPUI_OK"
	}, function ( f342_arg0 )
		return true
	end )
	f341_local0.anyControllerAllowed = true
	f341_local0.unusedControllerAllowed = true
end

function LobbyBeginPlay( f343_arg0, f343_arg1 )
	if (IsOrbis() or IsDurango()) and (Engine.IsMpStillDownloading() or Engine.IsZmStillDownloading() or Engine.IsCpStillDownloading()) and not CoD.perController[f343_arg1].hasShownPlaygoWarning then
		CoD.perController[f343_arg1].hasShownPlaygoWarning = true
		DisplayPlayGoWarning( f343_arg0, f343_arg1 )
		return false
	else
		CoD.LobbyBase.BeginPlay( f343_arg0, f343_arg1 )
		return true
	end
end

function SizeToSafeArea( f344_arg0, f344_arg1 )
	f344_arg0:sizeToSafeArea( f344_arg1 )
end

function PartyHostSetState( f345_arg0, f345_arg1, f345_arg2 )
	Engine.PartyHostSetUIState( f345_arg2 )
end

function GoBackMultiple( f346_arg0, f346_arg1, f346_arg2 )
	local f346_local0 = f346_arg0
	local f346_local1 = tonumber( f346_arg2 )
	if f346_local1 == nil then
		return 
	end
	while f346_local1 > 0 do
		f346_local0 = GoBack( f346_local0, f346_arg1 )
		f346_local1 = f346_local1 - 1
	end
	return f346_local0
end

function GoBack( f347_arg0, f347_arg1 )
	if Rat and Rat.DisableGoBack then
		return 
	end
	while not f347_arg0.menuName do
		f347_arg0 = f347_arg0:getParent()
	end
	local f347_local0, f347_local1 = CoD.Menu.GetNavigationForMenu( f347_arg1, f347_arg0.menuName )
	if f347_local0 and f347_local1 then
		f347_arg0.previousMenuName = CoD.MenuNavigation[f347_arg1][f347_local0][f347_local1 - 1]
		CoD.MenuNavigation[f347_arg1][f347_local0][f347_local1] = nil
		if #CoD.MenuNavigation[f347_arg1][f347_local0] == 0 then
			table.remove( CoD.MenuNavigation[f347_arg1], f347_local0 )
		else
			
		end
	end
	f347_arg0:saveState()
	return f347_arg0:goBack( f347_arg1 )
end

function DelayGoBack( f348_arg0, f348_arg1 )
	f348_arg0:addElement( LUI.UITimer.newElementTimer( 0, true, function ()
		GoBack( f348_arg0, f348_arg1 )
	end ) )
end

function GoBackToMenu( f350_arg0, f350_arg1, f350_arg2 )
	local f350_local0, f350_local1 = CoD.Menu.GetNavigationForMenuToMenu( f350_arg1, f350_arg0.menuName, f350_arg2 )
	local f350_local2, f350_local3 = CoD.Menu.GetNavigationForMenu( f350_arg1, f350_arg0.menuName )
	local f350_local4, f350_local5 = CoD.Menu.GetNavigationForMenu( f350_arg1, f350_arg2 )
	if not f350_local2 or not f350_local3 or not f350_local4 or not f350_local5 then
		return GoBack( f350_arg0, f350_arg1 )
	elseif f350_arg0.menuName == f350_arg2 then
		return 
	elseif f350_arg0.occludedMenu and f350_arg0.occludedMenu.menuName == f350_arg2 then
		f350_arg0.previousMenuName = nil
		table.remove( CoD.MenuNavigation[f350_arg1], f350_local2 )
	elseif f350_local0 and f350_local1 then
		f350_arg0.previousMenuName = CoD.MenuNavigation[f350_arg1][f350_local0][f350_local1]
		local f350_local6 = #CoD.MenuNavigation[f350_arg1][f350_local0]
		for f350_local7 = f350_local1 + 1, f350_local6, 1 do
			CoD.MenuNavigation[f350_arg1][f350_local0][f350_local7] = nil
		end
		if #CoD.MenuNavigation[f350_arg1][f350_local0] == 0 then
			table.remove( CoD.MenuNavigation[f350_arg1], f350_local0 )
		end
		if f350_local2 ~= f350_local0 then
			table.remove( CoD.MenuNavigation[f350_arg1], f350_local2 )
		end
	elseif f350_arg0.occludedMenu then
		local f350_local6 = f350_arg0
		for f350_local7 = f350_local2, f350_local4 + 1, -1 do
			local f350_local10 = f350_local7
			if not f350_local6.occludedMenu then
				return f350_local6
			end
			f350_local6 = GoBackToMenu( f350_local6, f350_arg1, f350_local6.occludedMenu.menuName )
		end
		if f350_local6.menuName == f350_arg2 then
			return f350_local6
		end
		return GoBackToMenu( f350_local6, f350_arg1, f350_arg2 )
	end
	f350_arg0:saveState()
	return f350_arg0:goBack( f350_arg1 )
end

function GoBackAndUpdateStateOnPreviousMenu( f351_arg0, f351_arg1 )
	local f351_local0 = GoBack( f351_arg0, f351_arg1 )
	f351_local0:processEvent( {
		name = "update_state",
		controller = f351_arg1
	} )
	return f351_local0
end

function GoBackAndUpdateNavigation( f352_arg0, f352_arg1, f352_arg2 )
	local f352_local0 = GoBack( f352_arg0, f352_arg2 )
	if CoD.CACUtility.CustomClass_LastClassNum and f352_local0.menuName == "CustomClass" then
		f352_local0:navigateTo( CoD.CACUtility.CustomClass_LastSelection )
		f352_local0:processEvent( {
			name = "update_state",
			controller = f352_arg2
		} )
	end
	return f352_local0
end

function GoBackToCustomClassMenu( f353_arg0, f353_arg1 )
	local f353_local0 = GoBackToMenu( f353_arg0, f353_arg1, "CustomClass" )
	if f353_local0 then
		f353_local0:processEvent( {
			name = "update_state",
			controller = f353_arg1
		} )
		if f353_local0.menuName == "CustomClass" then
			SetFocusToLoadoutWidgetAfterSetItem( f353_local0 )
		end
	end
end

function Close( f354_arg0, f354_arg1 )
	while not f354_arg0.menuName do
		f354_arg0 = f354_arg0:getParent()
	end
	local f354_local0, f354_local1 = CoD.Menu.GetNavigationForMenu( f354_arg1, f354_arg0.menuName )
	if f354_local0 and f354_local1 then
		f354_arg0.previousMenuName = CoD.MenuNavigation[f354_arg1][f354_local0][f354_local1 - 1]
		CoD.MenuNavigation[f354_arg1][f354_local0][f354_local1] = nil
		if #CoD.MenuNavigation[f354_arg1][f354_local0] == 0 then
			table.remove( CoD.MenuNavigation[f354_arg1], f354_local0 )
		end
	end
	f354_arg0:saveState()
	f354_arg0:close()
end

function NavigateToLobby( f355_arg0, f355_arg1, f355_arg2, f355_arg3 )
	CoD.LobbyBase.NavigateToLobby( f355_arg0, f355_arg1, f355_arg2, f355_arg3 )
end

function NavigateToLobby_OccludedMenu( f356_arg0, f356_arg1, f356_arg2, f356_arg3, f356_arg4 )
	if f356_arg0.occludedMenu ~= nil then
		NavigateToLobby( f356_arg0.occludedMenu, f356_arg3, false, f356_arg2 )
	end
end

function NavigateToLobby_SelectionList( f357_arg0, f357_arg1, f357_arg2, f357_arg3, f357_arg4 )
	if CheckNavRestrictions( f357_arg0, f357_arg1, f357_arg2, f357_arg4 ) then
		return 
	elseif f357_arg3 == "MPLobbyMain" then
		if Engine.PushAnticheatMessageToUI( f357_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.MP ) then
			DisplayAnticheatMessage( f357_arg0, f357_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.MP, "", "" )
			return 
		end
		for f357_local0 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
			if CheckIfFeatureIsBanned( f357_local0, LuaEnums.FEATURE_BAN.LIVE_MP ) then
				LuaUtils.UI_ShowErrorMessageDialog( f357_arg2, GetFeatureBanInfo( f357_local0, LuaEnums.FEATURE_BAN.LIVE_MP ) )
				return 
			end
		end
		if Engine.GetUsedControllerCount() > 1 then
			for f357_local1 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
				if CheckIfFeatureIsBanned( f357_local1, LuaEnums.FEATURE_BAN.MP_SPLIT_SCREEN ) then
					LuaUtils.UI_ShowErrorMessageDialog( f357_arg2, GetFeatureBanInfo( f357_local1, LuaEnums.FEATURE_BAN.MP_SPLIT_SCREEN ) )
					return 
				end
			end
		end
	end
	if f357_arg3 == "ZMLobbyOnline" then
		if Engine.PushAnticheatMessageToUI( f357_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.ZM ) then
			DisplayAnticheatMessage( f357_arg0, f357_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.ZM, "", "" )
			return 
		end
		for f357_local0 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
			if CheckIfFeatureIsBanned( f357_local0, LuaEnums.FEATURE_BAN.LIVE_ZM ) then
				LuaUtils.UI_ShowErrorMessageDialog( f357_arg2, GetFeatureBanInfo( f357_local0, LuaEnums.FEATURE_BAN.LIVE_ZM ) )
				return 
			end
		end
		if Engine.GetUsedControllerCount() > 1 then
			for f357_local1 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
				if CheckIfFeatureIsBanned( f357_local1, LuaEnums.FEATURE_BAN.ZM_SPLIT_SCREEN ) then
					LuaUtils.UI_ShowErrorMessageDialog( f357_arg2, GetFeatureBanInfo( f357_local1, LuaEnums.FEATURE_BAN.ZM_SPLIT_SCREEN ) )
					return 
				end
			end
		end
		local f357_local1 = Engine.StorageGetBuffer( f357_arg2, Enum.StorageFileType.STORAGE_ZM_LOADOUTS )
		if f357_local1 then
			local f357_local2 = f357_local1.cacLoadouts
			if f357_local2 then
				local f357_local3 = #f357_local2.variant
				for f357_local4 = 0, f357_local3 - 1, 1 do
					f357_local2.variant[f357_local4].variantIndex:set( f357_local4 )
				end
			end
		end
	end
	if f357_arg3 == "CPLobbyOnline" or f357_arg3 == "CPDOALobbyOnline" or f357_arg3 == "CP2LobbyOnline" then
		for f357_local0 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
			if CheckIfFeatureIsBanned( f357_local0, LuaEnums.FEATURE_BAN.LIVE_CP ) then
				LuaUtils.UI_ShowErrorMessageDialog( f357_arg2, GetFeatureBanInfo( f357_local0, LuaEnums.FEATURE_BAN.LIVE_CP ) )
				return 
			end
		end
		if Engine.GetUsedControllerCount() > 1 then
			for f357_local1 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
				if CheckIfFeatureIsBanned( f357_local1, LuaEnums.FEATURE_BAN.CP_SPLIT_SCREEN ) then
					LuaUtils.UI_ShowErrorMessageDialog( f357_arg2, GetFeatureBanInfo( f357_local1, LuaEnums.FEATURE_BAN.CP_SPLIT_SCREEN ) )
					return 
				end
			end
		end
	end
	if f357_arg3 == "MPLobbyOnline" then
		for f357_local0 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
			if CheckIfFeatureIsBanned( f357_local0, LuaEnums.FEATURE_BAN.MP_PUBLIC_MATCH ) then
				LuaUtils.UI_ShowErrorMessageDialog( f357_arg2, GetFeatureBanInfo( f357_local0, LuaEnums.FEATURE_BAN.MP_PUBLIC_MATCH ) )
				return 
			end
		end
	end
	if f357_arg3 == "MPLobbyOnlineArena" then
		if Engine.PushAnticheatMessageToUI( f357_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.ARENA ) then
			DisplayAnticheatMessage( f357_arg0, f357_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.ARENA, "", "" )
			return 
		end
		for f357_local0 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
			if CheckIfFeatureIsBanned( f357_local0, LuaEnums.FEATURE_BAN.ARENA_GAMEPLAY ) then
				LuaUtils.UI_ShowErrorMessageDialog( f357_arg2, GetFeatureBanInfo( f357_local0, LuaEnums.FEATURE_BAN.ARENA_GAMEPLAY ) )
				return 
			end
		end
	end
	if f357_arg3 == "MPLobbyOnlineArenaGame" then
		local f357_local1 = Engine.GetPlaylistMaxPartySize( Engine.GetPlaylistID() )
		if f357_local1 < Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyClientType.LOBBY_CLIENT_TYPE_ALL ) then
			LuaUtils.UI_ShowErrorMessageDialog( f357_arg2, Engine.Localize( "MENU_ARENA_TOO_MANY_PLAYERS", f357_local1 ) )
			return 
		end
	end
	if f357_arg3 == "FRLobbyOnlineGame" then
		for f357_local0 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
			if CheckIfFeatureIsBanned( f357_local0, LuaEnums.FEATURE_BAN.FREERUN ) then
				LuaUtils.UI_ShowErrorMessageDialog( f357_arg2, GetFeatureBanInfo( f357_local0, LuaEnums.FEATURE_BAN.FREERUN ) )
				return 
			end
		end
	end
	if f357_arg3 == "ZMLobbyOnlineCustomGame" then
		Dvar.zm_private_rankedmatch:set( Engine.GetProfileVarInt( f357_arg2, "com_privategame_ranked_zm" ) ~= 0 )
		Engine.SetPlaylistID( 150 )
		Engine.RunPlaylistRules( f357_arg2 )
	end
	local f357_local0 = LobbyData:UITargetFromName( f357_arg3 )
	if f357_local0.eGameModes == Enum.eGameModes.MODE_GAME_LEAGUE and Engine.DvarBool( nil, "arena_maintenance" ) == true then
		LuaUtils.UI_ShowErrorMessageDialog( f357_arg2, "MENU_ARENA_MAINTENANCE_DESC", "MENU_ARENA_MAINTENANCE_CAPS" )
		return 
	end
	local f357_local1 = Engine.DvarBool( 0, "probation_public_enabled" )
	local f357_local2 = Engine.DvarBool( 0, "probation_league_enabled" )
	if f357_local0.isGame and (f357_local0.eGameModes == Enum.eGameModes.MODE_GAME_MATCHMAKING_PLAYLIST or f357_local0.eGameModes == Enum.eGameModes.MODE_GAME_LEAGUE) then
		Engine.ProbationCheckForProbation( f357_arg2, f357_local0.eGameModes )
		local f357_local3 = Engine.LobbyClient_GetProbationTime( f357_arg2, f357_local0.eGameModes )
		if f357_local3 > 0 then
			local f357_local4 = Engine.SecondsAsTime( f357_local3 )
			if f357_local1 and f357_local0.eGameModes == Enum.eGameModes.MODE_GAME_MATCHMAKING_PLAYLIST then
				LuaUtils.UI_ShowErrorMessageDialog( f357_arg2, Engine.Localize( "MENU_PROBATION_GIVEN_PUBLIC_MATCH", f357_local4 ), "MENU_PROBATION_CAPS" )
				return 
			elseif f357_local2 and f357_local0.eGameModes == Enum.eGameModes.MODE_GAME_LEAGUE then
				LuaUtils.UI_ShowErrorMessageDialog( f357_arg2, Engine.Localize( "MENU_PROBATION_GIVEN_ARENA_MATCH", f357_local4 ), "MENU_PROBATION_CAPS" )
				return 
			end
		elseif Engine.LobbyHost_AnyClientInProbationForGameMode( f357_local0.eGameModes ) then
			if f357_local1 and f357_local0.eGameModes == Enum.eGameModes.MODE_GAME_MATCHMAKING_PLAYLIST then
				LuaUtils.UI_ShowErrorMessageDialog( f357_arg2, "MENU_PROBATION_PARTY_PUBLIC_MATCH" )
				return 
			elseif f357_local2 and f357_local0.eGameModes == Enum.eGameModes.MODE_GAME_LEAGUE then
				LuaUtils.UI_ShowErrorMessageDialog( f357_arg2, "MENU_PROBATION_PARTY_ARENA_MATCH" )
				return 
			end
		end
	end
	UpdateDifficulty( f357_arg0, f357_arg3, f357_arg2 )
	NavigateToLobby( f357_arg4, f357_arg3, false, f357_arg2 )
end

function NavigateToLobby_FirstTimeFlowMP( f358_arg0, f358_arg1, f358_arg2, f358_arg3 )
	if IsLAN() then
		NavigateToLobby_SelectionList( f358_arg0, f358_arg1, f358_arg2, LobbyData.UITargets.UI_MPLOBBYLANGAME.name, f358_arg3 )
	else
		NavigateToLobby_SelectionList( f358_arg0, f358_arg1, f358_arg2, LobbyData.UITargets.UI_MPLOBBYMAIN.name, f358_arg3 )
	end
end

function NavigateToLobby_FirstTimeFlowCP( f359_arg0, f359_arg1, f359_arg2, f359_arg3 )
	if IsLAN() then
		NavigateToLobby_SelectionList( f359_arg0, f359_arg1, f359_arg2, LobbyData.UITargets.UI_CPLOBBYLANGAME.name, f359_arg3 )
	else
		NavigateToLobby_SelectionList( f359_arg0, f359_arg1, f359_arg2, LobbyData.UITargets.UI_CPLOBBYONLINE.name, f359_arg3 )
	end
end

function NavigateToLobby_SelectionListCampaignZombies( f360_arg0, f360_arg1, f360_arg2, f360_arg3, f360_arg4 )
	if IsLAN() then
		NavigateToLobby_SelectionList( f360_arg0, f360_arg1, f360_arg2, LobbyData.UITargets.UI_CP2LOBBYLANGAME.name, f360_arg4 )
	else
		NavigateToLobby_SelectionList( f360_arg0, f360_arg1, f360_arg2, LobbyData.UITargets.UI_CP2LOBBYONLINE.name, f360_arg4 )
	end
end

function NavigateToLobby_SelectionListDOA( f361_arg0, f361_arg1, f361_arg2, f361_arg3, f361_arg4 )
	if IsLAN() then
		NavigateToLobby_SelectionList( f361_arg0, f361_arg1, f361_arg2, LobbyData.UITargets.UI_DOALOBBYLANGAME.name, f361_arg4 )
	else
		NavigateToLobby_SelectionList( f361_arg0, f361_arg1, f361_arg2, LobbyData.UITargets.UI_DOALOBBYONLINE.name, f361_arg4 )
	end
end

function NavigateToMenu( f362_arg0, f362_arg1, f362_arg2, f362_arg3 )
	while f362_arg0 and not f362_arg0.openMenu do
		f362_arg0 = f362_arg0:getParent()
	end
	if not f362_arg0 then
		return 
	elseif not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	if not CoD.MenuNavigation[f362_arg3] then
		CoD.MenuNavigation[f362_arg3] = {
			{
				f362_arg0.menuName
			}
		}
	end
	local f362_local0, f362_local1 = CoD.Menu.GetNavigationForMenu( f362_arg3, f362_arg0.menuName )
	if not f362_local0 or not f362_local1 then
		CoD.MenuNavigation[f362_arg3] = {
			{
				f362_arg0.menuName
			}
		}
		f362_local0, f362_local1 = CoD.Menu.GetNavigationForMenu( f362_arg3, f362_arg0.menuName )
	end
	local f362_local2 = f362_arg0.userData
	local f362_local3 = f362_arg0.menuName
	local f362_local4 = f362_arg0.occludedMenu
	local f362_local5 = f362_arg0:getParent()
	f362_arg0:saveState()
	f362_arg0:close()
	if f362_arg0.checkGC then
		CheckGCCatchUp()
	end
	local f362_local6 = f362_arg0:replaceMenu( f362_arg1, f362_arg3, nil, f362_local2, f362_local3, f362_local4, f362_local5 )
	if f362_local0 and f362_local1 then
		if f362_arg2 then
			table.insert( CoD.MenuNavigation[f362_arg3][f362_local0], f362_local1 + 1, f362_local6.menuName )
		else
			CoD.MenuNavigation[f362_arg3][f362_local0][f362_local1] = f362_local6.menuName
		end
	end
	return f362_local6
end

function NavigateToMenuNoDependency( f363_arg0, f363_arg1, f363_arg2, f363_arg3 )
	NavigateToMenu( f363_arg0, f363_arg1, f363_arg2, f363_arg3 )
end

function OpenPopup( f364_arg0, f364_arg1, f364_arg2, f364_arg3, f364_arg4 )
	local f364_local0 = f364_arg0
	while f364_local0 and not f364_local0.openMenu do
		f364_local0 = f364_local0:getParent()
	end
	if f364_arg3 == "" then
		f364_arg3 = nil
	end
	if f364_arg4 == "" then
		f364_arg4 = nil
	end
	local f364_local1 = f364_local0:openPopup( f364_arg1, f364_arg2, f364_arg3, f364_arg4 )
	if not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	if not CoD.MenuNavigation[f364_arg2] then
		CoD.MenuNavigation[f364_arg2] = {}
	end
	local f364_local2, f364_local3 = CoD.Menu.GetNavigationForMenu( f364_arg2, f364_arg0.menuName )
	if f364_local2 and f364_local3 then
		table.insert( CoD.MenuNavigation[f364_arg2], f364_local2 + 1, {
			f364_local1.menuName
		} )
	else
		table.insert( CoD.MenuNavigation[f364_arg2], {
			f364_local1.menuName
		} )
	end
	return f364_local1
end

function OpenPopup_NoDependency( f365_arg0, f365_arg1, f365_arg2 )
	return OpenPopup( f365_arg0, f365_arg1, f365_arg2 )
end

function OpenPopupWithPriority( f366_arg0, f366_arg1, f366_arg2, f366_arg3 )
	local f366_local0 = OpenPopup( f366_arg0, f366_arg1, f366_arg2 )
	f366_local0:setPriority( f366_arg3 )
end

function OpenOverlay( f367_arg0, f367_arg1, f367_arg2, f367_arg3, f367_arg4 )
	local f367_local0 = f367_arg0
	while f367_local0 and not f367_local0.openMenu do
		f367_local0 = f367_local0:getParent()
	end
	if f367_arg3 == "" then
		f367_arg3 = nil
	end
	if f367_arg4 == "" then
		f367_arg4 = nil
	end
	local f367_local1 = f367_local0.occludedBy
	if f367_local1 then
		f367_local1 = f367_local0.occludedBy.id == "Menu.MessageDialogBox"
	end
	if f367_local1 then
		f367_local0.occludedBy:close()
	end
	local f367_local2 = f367_local0:openOverlay( f367_arg1, f367_arg2, f367_arg3, f367_arg4 )
	if not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	if not CoD.MenuNavigation[f367_arg2] then
		CoD.MenuNavigation[f367_arg2] = {}
	end
	table.insert( CoD.MenuNavigation[f367_arg2], {
		f367_local2.menuName
	} )
	if f367_local1 then
		LuaUtils.MessageDialogForceSubscriptionFire( true )
	end
	return f367_local2
end

function OpenOverlay_NoDependency( f368_arg0, f368_arg1, f368_arg2, f368_arg3, f368_arg4 )
	OpenOverlay( f368_arg0, f368_arg1, f368_arg2, f368_arg3, f368_arg4 )
end

function OpenSystemOverlay( f369_arg0, f369_arg1, f369_arg2, f369_arg3, f369_arg4 )
	CoD.OverlayUtility.CreateOverlay( f369_arg2, f369_arg1, f369_arg3, f369_arg2, f369_arg4 )
end

function OpenBlackMarketUnspentBundlePopupIfNeeded( f370_arg0, f370_arg1 )
	local f370_local0
	if IsBundleActive( f370_arg1 ) or CoD.BlackMarketUtility.GetCurrentBundleCount( f370_arg1 ) <= 0 then
		f370_local0 = false
	else
		f370_local0 = true
	end
	if not f370_local0 then
		if IsHundredBundleActive( f370_arg1 ) or CoD.BlackMarketUtility.GetCurrentHundredBundleCount( f370_arg1 ) <= 0 then
			f370_local0 = false
		else
			f370_local0 = true
		end
	end
	if not f370_local0 then
		if IsRareBundle10for5Active( f370_arg1 ) or CoD.BlackMarketUtility.GetCurrentRareBundle10for5Count( f370_arg1 ) <= 0 then
			f370_local0 = false
		else
			f370_local0 = true
		end
	end
	if not f370_local0 then
		if IsRare20BundleActive( f370_arg1 ) or CoD.BlackMarketUtility.GetCurrentRare20BundleCount( f370_arg1 ) <= 0 then
			f370_local0 = false
		else
			f370_local0 = true
		end
	end
	if not f370_local0 then
		if IsRare20LDBundleActive( f370_arg1 ) or CoD.BlackMarketUtility.GetCurrentRare20LDBundleCount( f370_arg1 ) <= 0 then
			f370_local0 = false
		else
			f370_local0 = true
		end
	end
	if f370_local0 then
		CoD.OverlayUtility.CreateOverlay( f370_arg1, f370_arg0, "PurchaseSupplyDropConfirmation", f370_arg1, {
			displayText = "MPUI_BM_RARE_DROP",
			image = "uie_t7_blackmarket_crate_bundle_open",
			itemCost = 0,
			itemCODPointCost = 0,
			supplyDropType = CoD.BlackMarketUtility.DropTypes.BUNDLE
		} )
	end
end

function OpenBlackMarketWeaponContractErrorPopupIfNeeded( f371_arg0, f371_arg1 )
	if Engine.AreStatsFetched( f371_arg1 ) and Engine.IsLootReady( f371_arg1 ) and (LuaUtils.IsWeaponContractNeeded( f371_arg1 ) or (Engine.GetCryptokeysDue( f371_arg1 ) or 0) > 0) then
		local f371_local0 = CoD.OverlayUtility.CreateOverlay( f371_arg1, f371_arg0, "BMContractNotificationPopup", f371_arg1, "MPUI_BM_INCENTIVE_ERROR_TITLE" )
	end
end

function OpenBlackMarketExperimentPromoPopupIfNeeded( f372_arg0, f372_arg1 )
	if IsExperimentPromotionActive( f372_arg1 ) and Engine.AreStatsFetched( f372_arg1 ) and Engine.IsLootReady( f372_arg1 ) then
		local f372_local0 = Engine.StorageGetBuffer( f372_arg1, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		f372_local0 = f372_local0.extraBytes[2]
		if f372_local0:get() < Engine.DvarInt( nil, "loot_experimentpromo_index" ) then
			CoD.OverlayUtility.CreateOverlay( f372_arg1, f372_arg0, "InitialExperimentPromoOverlay", f372_arg1, {
				groupIndex = Engine.ExperimentsGetVariant( f372_arg1, Engine.DvarString( nil, "loot_experimentpromo_name" ) ),
				statToMarkAsSeen = f372_local0
			} )
		end
	end
end

function PerformOverlayBack( f373_arg0, f373_arg1, f373_arg2, f373_arg3 )
	if HasOverlayBackAction( f373_arg3 ) then
		f373_arg3[CoD.OverlayUtility.GoBackPropertyName]( f373_arg0, f373_arg1, f373_arg2, f373_arg3 )
	end
end

function PerformOverlayContinue( f374_arg0, f374_arg1, f374_arg2, f374_arg3 )
	if HasOverlayContinueAction( f374_arg3 ) then
		f374_arg3[CoD.OverlayUtility.ContinuePropertyName]( f374_arg0, f374_arg1, f374_arg2, f374_arg3 )
	end
end

function GoBackAndOpenStoreCodPointsOverlayOnParent( f375_arg0, f375_arg1, f375_arg2 )
	local f375_local0 = GoBack( f375_arg0, f375_arg2 )
	OpenCodPointsStore( f375_local0, f375_local0, f375_arg2, f375_arg1, f375_local0 )
end

function GoBackAndOpenStoreBO4OverlayOnParent( f376_arg0, f376_arg1, f376_arg2 )
	local f376_local0 = GoBack( f376_arg0, f376_arg2 )
	OpenBO4Store( f376_local0, f376_local0, f376_arg2, f376_arg1, f376_local0 )
end

function GoBackAndOpenStoreDLCOverlayOnParent( f377_arg0, f377_arg1, f377_arg2 )
	local f377_local0 = GoBack( f377_arg0, f377_arg2 )
	OpenDLCStore( f377_local0, f377_local0, f377_arg2, f377_arg1, f377_local0 )
end

function GoBackAndOpenOverlayOnParent( f378_arg0, f378_arg1, f378_arg2 )
	OpenOverlay( GoBack( f378_arg0, f378_arg2 ), f378_arg1, f378_arg2 )
end

function GoBackAndOpenSystemOverlayOnParent( f379_arg0, f379_arg1, f379_arg2, f379_arg3 )
	OpenSystemOverlay( f379_arg0, GoBack( f379_arg0, f379_arg1 ), f379_arg1, f379_arg2, f379_arg3 )
end

function GoBackAndOpenPopupOnParent( f380_arg0, f380_arg1, f380_arg2 )
	OpenPopup( GoBack( f380_arg0, f380_arg2 ), f380_arg1, f380_arg2 )
end

function GenericSmallPopupGoBack( f381_arg0, f381_arg1 )
	if f381_arg0.customGoBackAction then
		f381_arg0:customGoBackAction( f381_arg1 )
	else
		GoBack( f381_arg0, f381_arg1 )
	end
end

function OpenGenericSmallPopup( f382_arg0, f382_arg1, f382_arg2, f382_arg3, f382_arg4, f382_arg5, f382_arg6, f382_arg7 )
	return CoD.OverlayUtility.CreateOverlay( f382_arg1, f382_arg0, "GenericPopup", CoD.OverlayUtility.GenericPopupSizes.Small, f382_arg2, f382_arg3, f382_arg4, f382_arg5, f382_arg6, f382_arg7 )
end

function OpenGenericLargePopup( f383_arg0, f383_arg1, f383_arg2, f383_arg3, f383_arg4, f383_arg5, f383_arg6, f383_arg7 )
	return CoD.OverlayUtility.CreateOverlay( f383_arg1, f383_arg0, "GenericPopup", CoD.OverlayUtility.GenericPopupSizes.Large, f383_arg2, f383_arg3, f383_arg4, f383_arg5, f383_arg6, f383_arg7 )
end

function SendMenuResponse( f384_arg0, f384_arg1, f384_arg2, f384_arg3 )
	Engine.SendMenuResponse( f384_arg3, f384_arg1, f384_arg2 )
end

function SendMenuResponseExpression( f385_arg0, f385_arg1, f385_arg2 )
	Engine.SendMenuResponse( f385_arg0, f385_arg1, f385_arg2 )
end

function SendOwnMenuResponse( f386_arg0, f386_arg1, f386_arg2 )
	Engine.SendMenuResponse( f386_arg1, f386_arg0.menuName, f386_arg2 )
end

function SendFrontendControllerZeroMenuResponse( f387_arg0, f387_arg1, f387_arg2 )
	if CoD.isFrontend then
		f387_arg0 = 0
	end
	Engine.SendMenuResponse( f387_arg0, f387_arg1, f387_arg2 )
end

function ClearSavedState( f388_arg0, f388_arg1 )
	f388_arg0:clearSavedState()
end

function ClearMenuSavedState( f389_arg0 )
	f389_arg0:clearSavedState()
end

function PlayClip( f390_arg0, f390_arg1, f390_arg2 )
	f390_arg0:playClip( f390_arg1 )
end

function PlayClipOnElement( f391_arg0, f391_arg1, f391_arg2 )
	if f391_arg0[f391_arg1.elementName] then
		f391_arg0[f391_arg1.elementName]:playClip( f391_arg1.clipName )
	end
end

function PlayClipOnListItemElement( f392_arg0, f392_arg1, f392_arg2, f392_arg3 )
	f392_arg1:playClip( f392_arg3 )
end

function SetFocusToElement( f393_arg0, f393_arg1, f393_arg2 )
	if f393_arg0[f393_arg1] then
		f393_arg0[f393_arg1]:processEvent( {
			name = "gain_focus",
			controller = f393_arg2
		} )
	end
end

function SetLoseFocusToElement( f394_arg0, f394_arg1, f394_arg2 )
	if f394_arg0[f394_arg1] then
		f394_arg0[f394_arg1]:processEvent( {
			name = "lose_focus",
			controller = f394_arg2
		} )
	end
end

function MakeElementFocusable( f395_arg0, f395_arg1, f395_arg2 )
	if f395_arg0[f395_arg1] then
		f395_arg0[f395_arg1]:makeFocusableWithoutResettingNavigation( f395_arg0 )
	end
end

function MakeElementNotFocusable( f396_arg0, f396_arg1, f396_arg2 )
	if f396_arg0[f396_arg1] then
		f396_arg0[f396_arg1]:makeNotFocusable( f396_arg0 )
	end
end

function MakeSiblingFocusable( f397_arg0, f397_arg1, f397_arg2 )
	while not f397_arg0.menuName and not f397_arg0[f397_arg1] do
		f397_arg0 = f397_arg0:getParent()
	end
	if f397_arg0[f397_arg1] then
		f397_arg0[f397_arg1]:makeFocusableWithoutResettingNavigation( f397_arg0 )
	end
end

function MakeSiblingNotFocusable( f398_arg0, f398_arg1, f398_arg2 )
	while not f398_arg0.menuName and not f398_arg0[f398_arg1] do
		f398_arg0 = f398_arg0:getParent()
	end
	if f398_arg0[f398_arg1] then
		f398_arg0[f398_arg1]:makeNotFocusable( f398_arg0 )
	end
end

function MakeFocusable( f399_arg0 )
	f399_arg0:makeFocusableWithoutResettingNavigation()
end

function MakeNotFocusable( f400_arg0 )
	f400_arg0:makeNotFocusable()
end

function DisableNavigation( f401_arg0, f401_arg1 )
	f401_arg0[f401_arg1].m_disableNavigation = true
end

function EnableNavigation( f402_arg0, f402_arg1 )
	f402_arg0[f402_arg1].m_disableNavigation = false
end

function DisableAllMenuInput( f403_arg0, f403_arg1 )
	f403_arg0.m_disableAllButtonActions = f403_arg1
end

function ClearNavigationTable( f404_arg0 )
	f404_arg0:clearNavigationTable()
end

function ModalSelectListOption( f405_arg0, f405_arg1, f405_arg2 )
	if CoD.Menu.ModalDialogInfo.Callback ~= nil and CoD.Menu.ModalDialogInfo.Callback( f405_arg1.gridInfoTable.zeroBasedIndex ) == true then
		GoBack( f405_arg0, f405_arg2 )
	end
end

function ModalGoBack( f406_arg0, f406_arg1, f406_arg2 )
	if CoD.Menu.ModalDialogInfo.Callback ~= nil then
		CoD.Menu.ModalDialogInfo.Callback()
	end
	GoBack( f406_arg0, f406_arg2 )
end

function SetResponseYes( f407_arg0, f407_arg1 )
	GoBack( f407_arg0, f407_arg1 )
	if f407_arg0.modalCallback then
		f407_arg0.modalCallback( "yes" )
	end
end

function SetResponseNo( f408_arg0, f408_arg1 )
	GoBack( f408_arg0, f408_arg1 )
	if f408_arg0.modalCallback then
		f408_arg0.modalCallback( "no" )
	end
end

function OpenOptionsMenu( f409_arg0, f409_arg1, f409_arg2 )
	local f409_local0 = f409_arg0
	while f409_local0 and not f409_local0.openMenu do
		f409_local0 = f409_local0:getParent()
	end
	f409_local0:saveState()
	f409_local0:openMenu( "OptionsMenu", f409_arg2 )
	f409_local0:close()
end

function LoadSaveGameData( f410_arg0, f410_arg1 )
	Engine.LoadSaveGame()
end

function RestartMission( f411_arg0, f411_arg1, f411_arg2 )
	local f411_local0 = f411_arg0
	while f411_local0 and not f411_local0.openMenu do
		f411_local0 = f411_local0:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( f411_arg2, f411_local0, "RestartMissionPopup" )
end

function EndTrainingSim( f412_arg0, f412_arg1, f412_arg2 )
	Engine.SendMenuResponse( f412_arg2, "StartMenu", "EndTrainingSim" )
	StartMenuResumeGame( f412_arg0, f412_arg2 )
	GoBack( f412_arg0, f412_arg2 )
end

function CPSelectPublicGameGetRandomMap( f413_arg0, f413_arg1, f413_arg2 )
	local f413_local0 = {}
	local f413_local1 = Engine.IsCampaignModeZombies()
	for f413_local6, f413_local7 in LUI.IterateTableBySortedKeys( CoD.mapsTable, function ( f414_arg0, f414_arg1 )
		return CoD.mapsTable[f414_arg0].unique_id < CoD.mapsTable[f414_arg1].unique_id
	end, nil ) do
		local f413_local5
		if f413_local7.campaign_mode ~= Enum.CampaignMode.CAMPAIGNMODE_DEFAULT or f413_local1 then
			if f413_local7.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_ZOMBIES then
				f413_local5 = f413_local1
			else
				f413_local5 = false
			end
		else
			f413_local5 = true
		end
		if f413_local5 then
			f413_local5 = f413_local6 ~= "cp_doa_bo3"
		end
		if f413_local7.session_mode == Enum.eModes.MODE_CAMPAIGN and f413_local5 and f413_local7.dlc_pack ~= -1 and f413_local7.isSubLevel == false then
			table.insert( f413_local0, {
				properties = {
					mapId = f413_local6
				}
			} )
		end
	end
	if f413_local0 ~= nil and #f413_local0 > 0 then
		f413_local2 = math.random
		f413_local3 = 1
		return f413_local0[f413_local2( 1, #f413_local0 )].properties.mapId
	else
		return LuaUtils.GetDefaultMap( LobbyData.GetCurrentMenuTarget() )
	end
end

function CPSelectPublicGame( f415_arg0, f415_arg1, f415_arg2, f415_arg3, f415_arg4 )
	local f415_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.cpPublicLobbySearchAll" )
	Engine.SetModelValue( f415_local0, false )
	Engine.SetDvar( "ui_useloadingmovie", "1" )
	Engine.SetDvar( "skipto", "" )
	Engine.SetDvar( "sv_saveGameSkipto", "" )
	Engine.SetDvar( "ui_blocksaves", "1" )
	if f415_arg3 == "specificMission" then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "cpLobby" ), "public" )
		GoBackAndOpenPopupOnParent( f415_arg0, "CPMissionSelect", f415_arg2 )
		return 
	elseif f415_arg3 == "anyMission" then
		f415_arg1.mapId = CPSelectPublicGameGetRandomMap( f415_arg0, f415_arg1, f415_arg2 )
	else
		f415_arg1.mapId = Engine.GetSavedMap()
		if CoD.mapsTable[f415_arg1.mapId] ~= nil and CoD.mapsTable[f415_arg1.mapId].isSafeHouse then
			f415_arg1.mapId = Engine.GetSavedMapQueuedMap()
		end
	end
	SetSelectedCPMission( f415_arg0, f415_arg1, f415_arg2 )
	Engine.SetPlaylistID( GetPlaylistIDForSelectedCPMission( f415_arg0, f415_arg1, f415_arg2 ) )
	if f415_arg3 == "anyMission" then
		Engine.SetModelValue( f415_local0, true )
	end
	local f415_local1 = Engine.GetModeName()
	if Engine.IsCampaignModeZombies() then
		f415_local1 = f415_local1 .. "2"
	end
	if f415_local1 == "Invalid" then
		if nil ~= LUI.DEV then
			error( "Invalid mode in matchmaking" )
		else
			return 
		end
	end
	local f415_local2 = f415_local1 .. "LobbyOnlinePublicGame"
	local f415_local3 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	GoBack( f415_arg0, f415_arg2 )
	NavigateToLobby( f415_arg0, f415_local2, false, f415_arg2 )
end

function RestartFromCheckpoint( f416_arg0, f416_arg1, f416_arg2 )
	local f416_local0 = f416_arg0
	while f416_local0 and not f416_local0.openMenu do
		f416_local0 = f416_local0:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( f416_arg2, f416_local0, "RestartCheckpointPopup" )
end

function LaunchLevel( f417_arg0, f417_arg1, f417_arg2 )
	local f417_local0 = Engine.GetModelValue( f417_arg1:getModel( f417_arg2, "devName" ) )
	if f417_local0 ~= "" then
		Engine.Exec( f417_arg2, "devmap " .. f417_local0 )
	end
end

function QuitGame( f418_arg0, f418_arg1, f418_arg2 )
	local f418_local0 = f418_arg0
	while f418_local0 and not f418_local0.openMenu do
		f418_local0 = f418_local0:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( f418_arg2, f418_local0, "QuitGamePopup" )
end

function SaveAndQuitGame( f419_arg0, f419_arg1, f419_arg2 )
	local f419_local0 = f419_arg0
	while f419_local0 and not f419_local0.openMenu do
		f419_local0 = f419_local0:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( f419_arg2, f419_local0, "SaveAndQuitGamePopup" )
end

function LaunchDOAJoin( f420_arg0, f420_arg1, f420_arg2 )
	if CheckNavRestrictions( f420_arg0, f420_arg1, f420_arg2, f420_arg0 ) then
		return 
	else
		CoD.LobbyBase.LaunchDOA( f420_arg0, f420_arg2, false )
	end
end

function LaunchDOACreate( f421_arg0, f421_arg1, f421_arg2 )
	if CheckNavRestrictions( f421_arg0, f421_arg1, f421_arg2, f421_arg0 ) then
		return 
	else
		CoD.LobbyBase.LaunchDOA( f421_arg0, f421_arg2, true )
	end
end

function LaunchSelectedCPMission( f422_arg0, f422_arg1, f422_arg2 )
	local f422_local0 = Engine.GetModeName()
	if Engine.IsCampaignModeZombies() then
		f422_local0 = f422_local0 .. "2"
	end
	if f422_local0 == "Invalid" then
		if LUI.DEV ~= nil then
			error( "Invalid mode in matchmaking" )
		else
			return 
		end
	end
	local f422_local1 = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "cpLobby" ) )
	local f422_local2 = Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
	local f422_local3 = false
	local f422_local4 = "LobbyOnlineCustomGame"
	if f422_local2 == true then
		if f422_local1 == "public" then
			f422_local3 = true
			f422_local4 = "LobbyOnlinePublicGame"
		elseif f422_local1 == "custom" then
			f422_local4 = "LobbyOnlineCustomGame"
		end
	else
		f422_local4 = "LobbyLANCustomGame"
	end
	f422_local4 = f422_local0 .. f422_local4
	if IsElementPropertyValue( f422_arg1, "classified", true ) then
		f422_arg0:OpenModalDialog( f422_arg0, f422_arg2, "MENU_OUTOFORDER_PLAY", "MENU_OUTOFORDER_DESC", {
			"MPUI_YES",
			"MPUI_NO"
		}, function ( f423_arg0 )
			if f423_arg0 == 0 then
				local f423_local0 = Engine.GetPlayerStats( f422_arg2, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_CAMPAIGN )
				f423_local0.allMapsUnlocked:set( 1 )
				f422_arg0.MapList:updateDataSource()
			end
			return true
		end )
	else
		SetSelectedCPMission( f422_arg0, f422_arg1, f422_arg2 )
		if f422_local3 then
			Engine.SetPlaylistID( GetPlaylistIDForSelectedCPMission( f422_arg0, f422_arg1, f422_arg2 ) )
		end
		local f422_local5 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
		if f422_local5 ~= LobbyData.UITargets.UI_CPLOBBYONLINECUSTOMGAME.id and f422_local5 ~= LobbyData.UITargets.UI_CP2LOBBYONLINECUSTOMGAME.id and f422_local5 ~= LobbyData.UITargets.UI_CPLOBBYLANCUSTOMGAME.id and f422_local5 ~= LobbyData.UITargets.UI_CP2LOBBYLANCUSTOMGAME.id then
			NavigateToLobby( f422_arg0, f422_local4, false, f422_arg2 )
		end
		GoBack( f422_arg0, f422_arg2 )
	end
end

function RestartGame( f424_arg0, f424_arg1, f424_arg2 )
	local f424_local0 = f424_arg0
	while f424_local0 and not f424_local0.openMenu do
		f424_local0 = f424_local0:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( f424_arg2, f424_local0, "RestartGamePopup" )
end

function OpenDailyChallengePopup( f425_arg0, f425_arg1, f425_arg2 )
	CoD.OverlayUtility.CreateOverlay( f425_arg2, f425_arg0, "InspectDailyChallengeOverlay", f425_arg2 )
end

function SetupServerTime( f426_arg0, f426_arg1 )
	if f426_arg1 and f426_arg1:getParent() then
		local f426_local0 = CoD.SafeGetModelValue
		local f426_local1 = f426_arg1:getParent()
		f426_local0 = f426_local0( f426_local1:getModel(), "time" )
		if f426_local0 then
			f426_arg1:setupServerTime( 0 - f426_local0 * 1000 )
		end
	end
end

function ChooseClass( f427_arg0, f427_arg1, f427_arg2 )
	local f427_local0 = f427_arg0
	while f427_local0 and not f427_local0.openMenu do
		f427_local0 = f427_local0:getParent()
	end
	f427_local0:saveState()
	f427_local0:openMenu( "ChooseClass_InGame", f427_arg2 )
	f427_local0:close()
end

function ChooseTeam( f428_arg0, f428_arg1, f428_arg2 )
	local f428_local0 = f428_arg0
	while f428_local0 and not f428_local0.openMenu do
		f428_local0 = f428_local0:getParent()
	end
	f428_local0:saveState()
	local f428_local1 = f428_local0:openMenu( "ChangeTeam", f428_arg2 )
	if f428_local1 then
		f428_local1.previousMenuId = f428_local0.id
	end
	f428_local0:close()
end

function QuitGame_MP( f429_arg0, f429_arg1, f429_arg2 )
	local f429_local0 = f429_arg0
	while f429_local0 and not f429_local0.openMenu do
		f429_local0 = f429_local0:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( f429_arg2, f429_local0, "EndGamePopup" )
end

function SendClientScriptDebugMenuNotify( f430_arg0, f430_arg1, f430_arg2 )
	local f430_local0 = f430_arg0.cscDebugMenuList
	Engine.SendClientScriptNotify( f430_arg2, "script_debug_menu", Engine.GetModelValue( f430_arg1:getModel( f430_arg2, "name" ) ), f430_arg1.gridInfoTable.zeroBasedIndex + 1 )
end

function SendClientScriptDebugMenuCloseMenuNotify( f431_arg0, f431_arg1, f431_arg2 )
	Engine.SendClientScriptNotify( f431_arg2, "script_debug_menu", "close" )
end

function ProcessPlayerCallout( f432_arg0, f432_arg1, f432_arg2 )
	Engine.UpdateCalloutPlayerData( f432_arg1, Engine.GetModelValue( Engine.GetModel( f432_arg2, "arg1" ) ), Engine.GetModelValue( Engine.GetModel( f432_arg2, "arg2" ) ) )
	f432_arg0:playClip( "Side" )
end

function SetMPScoreText( f433_arg0, f433_arg1, f433_arg2, f433_arg3 )
	local f433_local0 = CoD.GetScriptNotifyData( f433_arg3 )
	local f433_local1 = Engine.GetIString( f433_local0[1], "CS_LOCALIZED_STRINGS" )
	local f433_local2 = f433_local0[2]
	if Engine.IsDemoPlaying() == false or CoD.isZombie == false then
		f433_arg1:AddCenterScore( f433_local1, f433_local2 )
		if HasPerk( f433_arg2, "specialty_combat_efficiency" ) then
			local f433_local3 = f433_local0[3]
			if f433_local3 > 0 then
				f433_arg1:AddCombatEfficiencyScore( f433_arg0, f433_local3, f433_arg2 )
			end
			if f433_local3 < f433_local2 then
				f433_arg1:AddCombatEfficiencyScore( f433_arg0, f433_local2 - f433_local3, f433_arg2 )
			end
		end
		if f433_local0[5] ~= nil and f433_local0[5] ~= 0 then
			f433_arg1:AddScoreFeed( Engine.Localize( f433_local1 ), true )
		end
	end
end

function TryBootHUD( f434_arg0, f434_arg1 )
	if not f434_arg0.hasBooted then
		f434_arg0:addElement( LUI.UITimer.new( f434_arg1, "hud_boot", true, f434_arg0 ) )
	end
end

function SetHudHasBooted( f435_arg0 )
	f435_arg0.hasBooted = true
end

function AddKillstreakReceivedNotification( f436_arg0, f436_arg1, f436_arg2, f436_arg3 )
	if IsCodCaster( f436_arg2 ) then
		if not IsCodCasterProfileValueEqualTo( f436_arg2, "shoutcaster_scorestreaks_notification", 1 ) then
			return 
		elseif CoD.SafeGetModelValue( Engine.GetModelForController( f436_arg2 ), "CodCaster.showLoadout" ) then
			return 
		end
	end
	if f436_arg1.appendNotification ~= nil then
		local f436_local0 = CoD.GetScriptNotifyData( f436_arg3 )
		f436_arg1:appendNotification( {
			title = Engine.ToUpper( Engine.Localize( "MENU_KILLSTREAK_READY", Engine.Localize( Engine.GetItemName( f436_local0[1] ) ) ) ),
			description = Engine.Localize( "MENU_ACTIVATE_KILLSTREAK_INSTR" ),
			type = "Killstreak",
			priority = 0
		} )
	end
end

function AddHeroAbilityReceivedNotification( f437_arg0, f437_arg1, f437_arg2, f437_arg3 )
	if IsCodCaster( f437_arg2 ) then
		if not IsCodCasterProfileValueEqualTo( f437_arg2, "shoutcaster_specialist_notification", 1 ) then
			return 
		elseif CoD.SafeGetModelValue( Engine.GetModelForController( f437_arg2 ), "CodCaster.showLoadout" ) then
			return 
		end
	end
	if f437_arg1.appendNotification ~= nil then
		local f437_local0 = CoD.GetScriptNotifyData( f437_arg3 )
		local f437_local1 = Engine.GetItemName( f437_local0[1] )
		local f437_local2 = Engine.ToUpper( Engine.Localize( "MENU_HERO_ABILITY_READY", Engine.ToUpper( Engine.Localize( f437_local1 ) ) ) )
		local f437_local3 = Engine.Localize( "MENU_ACTIVATE_HERO_ABILITY_INSTR" )
		if f437_local1 == "WEAPON_GADGET_RESURRECT" then
			f437_local3 = Engine.Localize( "MENU_ACTIVATE_REJACK_INSTR" )
		end
		if IsBlackMarketSpecialistAnyAbilityActive( f437_arg2 ) then
			f437_arg1:addElement( LUI.UITimer.newElementTimer( 1500, true, function ()
				f437_arg1:appendNotification( {
					title = f437_local2,
					description = f437_local3,
					type = "Ability",
					priority = 1
				} )
			end ) )
		else
			f437_arg1:appendNotification( {
				title = f437_local2,
				description = f437_local3,
				type = "Ability",
				priority = 1
			} )
		end
	end
end

function AddZombieNotification( f439_arg0, f439_arg1, f439_arg2 )
	local f439_local0 = CoD.GetScriptNotifyData( f439_arg2 )
	f439_arg1:appendNotification( {
		clip = "TextandImageBasic",
		title = Engine.Localize( Engine.GetIString( f439_local0[1], "CS_LOCALIZED_STRINGS" ) ),
		description = ""
	} )
end

function AddZombieBGBNotification( f440_arg0, f440_arg1, f440_arg2 )
	local f440_local0 = CoD.GetScriptNotifyData( f440_arg2 )
	local f440_local1 = f440_local0[1]
	local f440_local2 = Engine.GetItemName( f440_local1 )
	f440_arg1:appendNotification( {
		clip = "TextandImageBGB",
		title = Engine.Localize( f440_local2 ),
		description = Engine.Localize( f440_local2 .. "_hint" ),
		bgbImage = RegisterImage( GetItemImageFromIndex( f440_local1 ) )
	} )
end

function AddZombieBGBTokenNotification( f441_arg0, f441_arg1, f441_arg2, f441_arg3 )
	f441_arg0:playSound( "zmb_bgb_token" )
	local f441_local0 = "t7_hud_zm_vial_256"
	local f441_local1 = ""
	if IsZMDoubleVialActive( f441_arg2 ) then
		f441_local0 = "uie_t7_icon_zm_double_vial_backer"
		f441_local1 = "MP_X2"
	end
	f441_arg1:appendNotification( {
		clip = "TextandImageBGBToken",
		title = Engine.Localize( "ZMUI_BGB_TOKEN_AWARD_NOTIFICATION_TITLE" ),
		description = Engine.Localize( "ZMUI_BGB_TOKEN_AWARD_NOTIFICATION_DESC" ),
		bgbImage = RegisterImage( f441_local0 ),
		bgbImageText = Engine.Localize( f441_local1 )
	} )
end

function AddZombieTimeAttackNotification( f442_arg0, f442_arg1, f442_arg2 )
	local f442_local0 = CoD.GetScriptNotifyData( f442_arg2 )
	local f442_local1 = Engine.Localize( "DLC3_TIME_ATTACK" )
	local f442_local2 = f442_local0[1]
	local f442_local3 = math.min( 1, math.max( f442_local0[2], 4 ) )
	local f442_local4 = 0
	local f442_local5 = 2 + f442_local3 - 1
	local f442_local6 = "gamedata/tables/zm/" .. Engine.GetCurrentMap() .. "_time_attacks.csv"
	f442_arg1:appendNotification( {
		clip = "TextandTimeAttack",
		title = f442_local1,
		description = Engine.Localize( "DLC3_TIME_ATTACK_SUBTITLE", f442_local2, NumberAsTimeNoMS( tonumber( Engine.TableLookup( nil, f442_local6, f442_local4, f442_local2, f442_local5 ) or 0 ) * 1000 ) ),
		bgbImage = RegisterImage( "blacktransparent" ),
		xpAward = Engine.Localize( "CHALLENGE_UNLOCK_REWARD", Engine.TableLookup( nil, f442_local6, f442_local4, f442_local2, 1 ) or 0 ),
		rewardText = Engine.Localize( "ZMUI_NEW_WEAPON_IN_LOC", Engine.TableLookup( nil, f442_local6, f442_local4, f442_local2, 6 ) )
	} )
end

function CreatePrematchTimer( f443_arg0, f443_arg1, f443_arg2 )
	local f443_local0 = CoD.GetScriptNotifyData( f443_arg2 )
	local f443_local1 = f443_local0[1]
	if f443_local1 and not f443_arg0.PrematchCountdown then
		local f443_local2 = CoD.PrematchCountdown.new( f443_arg0, f443_arg1 )
		f443_local2:setupCountdown( f443_local1, f443_arg1 )
		f443_local2:setLeftRight( false, false, -640, 640 )
		f443_local2:setTopBottom( false, false, -360, 360 )
		f443_local2:addElementBefore( f443_arg0.WaypointBase )
		f443_local2:processEvent( {
			name = "update_state",
			controller = f443_arg1,
			menu = f443_arg0
		} )
		f443_arg0.PrematchCountdown = f443_local2
		LUI.OverrideFunction_CallOriginalSecond( f443_arg0, "close", function ( element )
			if element.PrematchCountdown then
				element.PrematchCountdown:close()
			end
		end )
	end
	if f443_arg0.PrematchWaiting then
		f443_arg0.PrematchWaiting:close()
		f443_arg0.PrematchWaiting = nil
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f443_arg1 ), "isInPrematchPeriod" ), 1 )
end

function PrematchWaitingForPlayers( f445_arg0, f445_arg1 )
	if not f445_arg0.PrematchWaiting then
		local f445_local0 = CoD.Prematch_WaitingForPlayers.new( f445_arg0, f445_arg1 )
		f445_local0:setLeftRight( false, false, -640, 640 )
		f445_local0:setTopBottom( false, false, -360, 360 )
		f445_local0:addElementBefore( f445_arg0.WaypointBase )
		f445_local0:processEvent( {
			name = "update_state",
			controller = f445_arg1,
			menu = f445_arg0
		} )
		f445_arg0.PrematchWaiting = f445_local0
		LUI.OverrideFunction_CallOriginalSecond( f445_arg0, "close", function ( element )
			if element.PrematchCountdown then
				element.PrematchWaiting:close()
			end
		end )
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f445_arg1 ), "isInPrematchPeriod" ), 1 )
end

function CreateRejackTimer( f447_arg0, f447_arg1, f447_arg2 )
	local f447_local0 = CoD.GetScriptNotifyData( f447_arg2 )
	local f447_local1 = f447_local0[1]
	f447_arg0.rejackWidget = CoD.Rejack.new( f447_arg0, f447_arg1 )
	f447_arg0:addElement( f447_arg0.rejackWidget )
	f447_arg0.rejackWidget.RejackInternal:startHeartBeatAnimation( f447_arg1, f447_local1 )
end

function HandleScoreStreakDpadRight( f448_arg0, f448_arg1 )
	if f448_arg0:isInFocus() and not Engine.IsVisibilityBitSet( f448_arg1, Enum.UIVisibilityBit.BIT_GAME_ENDED ) then
		if not f448_arg0:hasClip( "Focus" ) then
			Engine.SwitchToInventoryWeapon( f448_arg1 )
		else
			local f448_local0 = Engine.GetModelValue( Engine.GetModel( f448_arg0:getModel(), "rewardSlot" ) )
			if f448_local0 ~= nil then
				Engine.ActionSlotSelectWeapon( f448_arg1, f448_local0 )
			else
				Engine.SwitchToInventoryWeapon( f448_arg1 )
			end
		end
	end
end

function MakeRaidPurchase( f449_arg0, f449_arg1, f449_arg2 )
	Engine.SendMenuResponse( f449_arg2, "raid_purchase", Engine.GetModelValue( f449_arg1:getModel( f449_arg2, "name" ) ) )
end

function CancelRaidPurchase( f450_arg0, f450_arg1, f450_arg2 )
	Engine.SendMenuResponse( f450_arg2, "raid_purchase", "none" )
end

function UpdateEnabledText( f451_arg0, f451_arg1, f451_arg2 )
	Engine.SetModelValue( f451_arg1:getModel( f451_arg2, "description" ), Engine.Localize( Engine.GetModelValue( f451_arg1:getModel( f451_arg2, "enabledDescription" ) ) ) )
end

function UpdateDisableReason( f452_arg0, f452_arg1, f452_arg2 )
	local f452_local0 = f452_arg0:getModel( f452_arg2, "disable_" .. Engine.GetModelValue( f452_arg1:getModel( f452_arg2, "id" ) ) )
	local f452_local1 = f452_arg1:getModel( f452_arg2, "description" )
	if f452_local0 ~= nil then
		Engine.SetModelValue( f452_local1, Engine.Localize( Engine.GetModelValue( f452_local0 ) ) )
	else
		Engine.SetModelValue( f452_local1, Engine.Localize( Engine.GetModelValue( f452_arg1:getModel( f452_arg2, "enabledDescription" ) ) ) )
	end
end

function SelectNextItemIfPossible( f453_arg0, f453_arg1, f453_arg2 )
	local f453_local0 = GetListItem( f453_arg0, f453_arg1 )
	return f453_local0:navigateItemRight()
end

function SelectNextItemIfPossibleAndNotDisabled( f454_arg0, f454_arg1, f454_arg2 )
	local f454_local0 = GetListItem( f454_arg0, f454_arg1 )
	local f454_local1 = f454_local0:getItemAtOffset( 0, 1 )
	if f454_local1 and Engine.GetModelValue( f454_local1:getModel( f454_arg2, "disabled" ) ) == true then
		return false
	else
		return f454_local0:navigateItemRight()
	end
end

function SelectPreviousItemIfPossible( f455_arg0, f455_arg1, f455_arg2 )
	local f455_local0 = GetListItem( f455_arg0, f455_arg1 )
	if f455_local0.hCount and f455_local0.hCount == 1 then
		return f455_local0:navigateItemUp()
	else
		return f455_local0:navigateItemLeft()
	end
end

function SelectPreviousItemIfPossibleAndNotDisabled( f456_arg0, f456_arg1, f456_arg2 )
	local f456_local0 = GetListItem( f456_arg0, f456_arg1 )
	local f456_local1 = f456_local0:getItemAtOffset( 0, -1 )
	if f456_local1 and Engine.GetModelValue( f456_local1:getModel( f456_arg2, "disabled" ) ) == true then
		return false
	else
		return f456_local0:navigateItemLeft()
	end
end

function SelectAboveItemIfPossible( f457_arg0, f457_arg1, f457_arg2 )
	local f457_local0 = GetListItem( f457_arg0, f457_arg1 )
	return f457_local0:navigateItemUp()
end

function SelectBelowItemIfPossible( f458_arg0, f458_arg1, f458_arg2 )
	local f458_local0 = GetListItem( f458_arg0, f458_arg1 )
	return f458_local0:navigateItemDown()
end

function SelectItemIfPossible( f459_arg0, f459_arg1, f459_arg2, f459_arg3 )
	f459_arg1:setActiveItem( f459_arg3.element )
end

function SelectFirstItemIfPossible( f460_arg0, f460_arg1, f460_arg2 )
	f460_arg1:getFirstSelectableItem( true )
end

function ListElementSelectFirstItemIfPossible( f461_arg0, f461_arg1 )
	if f461_arg0[f461_arg1] then
		f461_arg0[f461_arg1]:getFirstSelectableItem( true )
	end
end

function ProcessListAction( f462_arg0, f462_arg1, f462_arg2 )
	if f462_arg1.disabled then
		return 
	end
	local f462_local0 = f462_arg1:getModel( f462_arg2, "action" )
	local f462_local1 = f462_arg1:getModel( f462_arg2, "param" )
	local f462_local2, f462_local3 = nil
	if f462_local0 then
		f462_local2 = Engine.GetModelValue( f462_local0 )
		if f462_local1 then
			f462_local3 = Engine.GetModelValue( f462_local1 )
		end
	else
		f462_local2 = f462_arg1.action
		f462_local3 = f462_arg1.actionParam
	end
	if f462_local2 then
		local f462_local4 = nil
		if f462_arg1.gridInfoTable then
			f462_local4 = f462_arg1.gridInfoTable.parentGrid.menu
		else
			f462_local4 = f462_arg1:getParentMenu()
		end
		f462_local2( f462_arg0, f462_arg1, f462_arg2, f462_local3, f462_local4 )
	end
end

function ProcessClassOptionAction( f463_arg0, f463_arg1, f463_arg2, f463_arg3 )
	if f463_arg1.disabled then
		return 
	end
	local f463_local0, f463_local1 = nil
	f463_local0 = f463_arg3.actionButtonFn
	f463_local1 = f463_arg1.actionParam
	if f463_local0 then
		f463_local0( f463_arg0, f463_arg1, f463_arg2, f463_local1, f463_arg1.gridInfoTable.parentGrid.menu )
	end
end

function ProcessKeyboardCompleteAction( f464_arg0, f464_arg1, f464_arg2, f464_arg3 )
	if f464_arg1.disabled then
		return 
	end
	local f464_local0, f464_local1 = nil
	f464_local0 = f464_arg3.keyboardCompleteFn
	if f464_local0 then
		f464_local0( f464_arg0, f464_arg1, f464_arg2, f464_arg3 )
	end
end

function ProcessConfirmVariantNameAction( f465_arg0, f465_arg1, f465_arg2, f465_arg3 )
	if f465_arg1.disabled then
		return 
	end
	local f465_local0, f465_local1 = nil
	f465_local0 = f465_arg3.confirmVariantNameFn
	if f465_local0 then
		f465_local0( f465_arg0, f465_arg1, f465_arg2, f465_arg3 )
	end
end

function UpdateDataSource( f466_arg0, f466_arg1, f466_arg2 )
	f466_arg1:updateDataSource()
end

function UpdateElementDataSource( f467_arg0, f467_arg1 )
	if f467_arg0[f467_arg1] then
		f467_arg0[f467_arg1]:updateDataSource()
	end
end

function SetAsListVerticalCounter( f468_arg0, f468_arg1, f468_arg2 )
	if f468_arg0[f468_arg2] then
		f468_arg0[f468_arg2]:addCustomVerticalCounter( f468_arg1 )
	end
end

function SetAsListHorizontalCounter( f469_arg0, f469_arg1, f469_arg2 )
	if f469_arg0[f469_arg2] then
		f469_arg0[f469_arg2]:addCustomHorizontalCounter( f469_arg1 )
	end
end

function SetupTabs( f470_arg0, f470_arg1, f470_arg2 )
	f470_arg0:AddButtonCallbackFunction( f470_arg0, f470_arg2, Enum.LUIButton.LUI_KEY_LB, nil, function ( element, menu, controller, model )
		if not PropertyIsTrue( f470_arg1, "m_disableNavigation" ) then
			f470_arg1:navigateItemLeft()
		end
	end, AlwaysFalse, false )
	f470_arg0:AddButtonCallbackFunction( f470_arg0, f470_arg2, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		if not PropertyIsTrue( f470_arg1, "m_disableNavigation" ) then
			f470_arg1:navigateItemRight()
		end
	end, AlwaysFalse, false )
end

function HideWidget( f473_arg0 )
	f473_arg0:setAlpha( 0 )
end

function ShowWidget( f474_arg0 )
	f474_arg0:setAlpha( 1 )
end

function HideElement( f475_arg0, f475_arg1 )
	if f475_arg0[f475_arg1] then
		f475_arg0[f475_arg1]:setAlpha( 0 )
	end
end

function ShowElement( f476_arg0, f476_arg1 )
	if f476_arg0[f476_arg1] then
		f476_arg0[f476_arg1]:setAlpha( 1 )
	end
end

function DisableWidget( f477_arg0, f477_arg1 )
	f477_arg0[f477_arg1].m_disableNavigation = true
	f477_arg0[f477_arg1]:makeNotFocusable()
	f477_arg0[f477_arg1]:setAlpha( 0 )
end

function SetBackFromCustomClass( f478_arg0 )
	CoD.CACUtility.FromCustomClass = true
end

function GetCustomClassModel( f479_arg0 )
	CoD.CACUtility.GetCustomClassModel( f479_arg0, CoD.perController[f479_arg0].classNum, CoD.perController[f479_arg0].classModel )
end

function ResetCustomClassStartingFocus( f480_arg0, f480_arg1, f480_arg2, f480_arg3 )
	local f480_local0 = f480_arg1:getModel()
	if not f480_local0 then
		return 
	end
	if f480_arg3 or Engine.GetModelValue( Engine.GetModel( f480_local0, "classNum" ) ) ~= CoD.CACUtility.CustomClass_LastClassNum then
		CoD.CACUtility.CustomClass_LastClassNum = 0
		CoD.CACUtility.CustomClass_LastSelection = "primary"
		CoD.CACUtility.CustomClass_PerClassLastSelection = {}
	end
end

function SetSeenExtraClassSets( f481_arg0 )
	local f481_local0 = Engine.StorageGetBuffer( f481_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if f481_local0 then
		return f481_local0.extraBools[0]:set( 1 )
	else
		
	end
end

function ChangeClass( f482_arg0, f482_arg1, f482_arg2 )
	f482_arg0:saveState()
	f482_arg0.menuResponseSent = true
	local f482_local0 = Engine.GetModelValue( f482_arg1:getModel( f482_arg2, "classNum" ), nil )
	local f482_local1 = Engine.GetModelValue( f482_arg1:getModel( f482_arg2, "defaultClassName" ), nil )
	local f482_local2 = f482_local0
	local f482_local3 = ""
	if f482_local1 ~= nil then
		f482_local3 = string.lower( f482_local1 )
		f482_local0 = Engine.GetClassIndexFromName( f482_local1 )
	else
		f482_local3 = "custom" .. f482_local0
	end
	local f482_local4 = true
	if CanUseSharedLoadouts( f482_arg2 ) then
		local f482_local5 = Engine.GetModel( Engine.GetModelForController( f482_arg2 ), "ChooseClassCPClientMenu" )
		if f482_local5 then
			local f482_local6 = Engine.CreateModel( f482_local5, "selectedClientIndex" )
			if f482_local6 then
				local f482_local7 = Engine.GetModelValue( f482_local6 )
				if f482_local7 ~= nil then
					local f482_local8 = Engine.GetModel( f482_local5, "client" .. f482_local7 )
					if f482_local8 then
						local f482_local9 = Engine.GetModelValue( Engine.GetModel( f482_local8, "xuid" ) )
						if Engine.IsSharedLoadoutAvailableForClient( f482_arg2, f482_local9 ) then
							f482_local3 = f482_local3 .. "," .. Engine.GetLobbyClientNumByXUID( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME, f482_local9 )
							local f482_local10 = Engine.CreateModel( f482_local5, "myClientIndex" )
							if f482_local10 and f482_local7 ~= Engine.GetModelValue( f482_local10 ) then
								f482_local4 = false
							end
						end
					end
				end
			end
		end
	end
	if CoD.isCampaign and f482_local4 and CoD.perController[f482_arg2].fieldOpsKitClassNum ~= f482_local0 + 1 then
		CoD.CACUtility.SetShowcaseWeaponToClassPrimary( f482_arg2, f482_local0 )
		SaveLoadout( f482_arg0, f482_arg2 )
	end
	Engine.SendMenuResponse( f482_arg2, "ChooseClass_InGame", f482_local3 )
	CoD.CACUtility.SetProfileLoadoutChoice( f482_arg2, f482_local0 )
	HUD_IngameMenuClosed()
	Engine.StreamSetCustomClass( f482_arg2, f482_local2 )
end

function ChangeClass_TrainingSim( f483_arg0, f483_arg1, f483_arg2 )
	f483_arg0:saveState()
	f483_arg0.menuResponseSent = true
	local f483_local0 = 9
	local f483_local1 = f483_local0
	Engine.SendMenuResponse( f483_arg2, "chooseClass_TrainingSim", "custom9" )
	CoD.CACUtility.SetProfileLoadoutChoice( f483_arg2, f483_local0 )
	HUD_IngameMenuClosed()
	Engine.StreamSetCustomClass( f483_arg2, f483_local1 )
end

function CloseChangeClass_TrainingSim( f484_arg0, f484_arg1, f484_arg2 )
	CoD.CACUtility.ResetCPCustomClasses( f484_arg2 )
end

function UpdateParentClassView( f485_arg0, f485_arg1, f485_arg2 )
	local f485_local0 = f485_arg1:getModel()
	CoD.perController[f485_arg2].classModel = f485_local0
	local f485_local1 = f485_arg0:getParent()
	if f485_local1 then
		f485_local1:setModel( f485_local0, f485_arg2 )
	end
end

function SetBubblegumPackIndex( f486_arg0, f486_arg1, f486_arg2 )
	local f486_local0 = f486_arg1:getModel()
	CoD.perController[f486_arg2].bgbPackIndex = f486_arg1.bgbPackIndex
	CoD.perController[f486_arg2].bubbleGumPackModel = f486_local0
	f486_arg0:setModel( f486_local0, f486_arg2 )
end

function SetCustomClassNum( f487_arg0, f487_arg1, f487_arg2 )
	local f487_local0 = f487_arg1:getModel()
	CoD.perController[f487_arg2].classNum = f487_arg1.classNum
	CoD.perController[f487_arg2].classModel = f487_local0
	f487_arg0:setModel( f487_local0, f487_arg2 )
end

function SetCustomParentClassNum( f488_arg0, f488_arg1, f488_arg2 )
	local f488_local0 = f488_arg1:getModel()
	CoD.perController[f488_arg2].classNum = f488_arg1.classNum
	CoD.perController[f488_arg2].classModel = f488_local0
	local f488_local1 = f488_arg0:getParent()
	if f488_local1 then
		f488_local1:setModel( f488_local0, f488_arg2 )
	end
end

function SetCustomClassNum_TrainingSim( f489_arg0, f489_arg1, f489_arg2 )
	local f489_local0 = Engine.GetModel( Engine.GetModelForController( f489_arg2 ), "CustomClassList.class1" )
	CoD.perController[f489_arg2].classNum = 9
	CoD.perController[f489_arg2].classModel = f489_local0
	f489_arg0:setModel( f489_local0, f489_arg2 )
end

function PrestigeWeapon( f490_arg0, f490_arg1, f490_arg2 )
	local f490_local0 = f490_arg1:getModel( f490_arg2, "itemIndex" )
	if f490_local0 then
		CoD.OverlayUtility.CreateOverlay( f490_arg2, f490_arg0, "PrestigeWeapon", f490_arg2, f490_local0 )
	end
end

function NavigateToLoadoutMenu( f491_arg0, f491_arg1 )
	local f491_local0 = f491_arg0.currentActiveSlot
	if f491_local0 then
		CoD.perController[f491_arg1].weaponCategory = f491_local0
		CoD.perController[f491_arg1].weaponClassGroup = f491_local0
		CoD.perController[f491_arg1].CACSpecficModelValueFocusTable = nil
		CoD.perController[f491_arg1].CACWildcardContextualMenu = nil
		CoD.perController[f491_arg1].wildcardOverCapacityRefName = nil
		local f491_local1 = CoD.perController[f491_arg1].classNum
		local f491_local2 = Engine.GetCustomClass( f491_arg1, f491_local1 )
		local f491_local3 = f491_arg0.weaponSlotTable[f491_local0]
		local f491_local4 = CoD.perController[f491_arg1].classModel
		local f491_local5 = true
		local f491_local6, f491_local7 = nil
		local f491_local8, f491_local9, f491_local10 = CoD.CACUtility.GetCACSlotStatus( f491_arg1, f491_local4, f491_local0 )
		if f491_local8 == CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE then
			return 
		elseif f491_local8 == CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD then
			local f491_local11 = nil
			for f491_local15, f491_local16 in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
				if not CoD.CACUtility.ItemEquippedInSlot( f491_local16, f491_arg1, f491_local4 ) then
					f491_local11 = f491_local16
					break
				end
			end
			f491_local12 = CoD.CACUtility.WildcardNeededForSlot( f491_arg1, f491_local0 )
			if f491_local11 then
				CoD.perController[f491_arg1].CACSpecficModelValueFocusTable = {
					ref = f491_local12
				}
				CoD.perController[f491_arg1].CACWildcardContextualMenu = true
				CoD.perController[f491_arg1].weaponCategory = f491_local11
				OpenPopup( f491_arg0, "WildcardSelect", f491_arg1 )
			end
			f491_local13 = Engine.GetItemIndexFromReference( f491_local12 )
			if IsProgressionEnabled( f491_arg1 ) and (Engine.IsItemLocked( f491_arg1, f491_local13 ) or not Engine.IsItemPurchased( f491_arg1, f491_local13 )) then
				return 
			end
			Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f491_arg1 ), "CACMenu.numWildcardItemsToRemove" ), 1 )
			CoD.perController[f491_arg1].wildcardOverCapacityRefName = f491_local12
			f491_local15 = OpenPopup( f491_arg0, "WildcardCapacity", f491_arg1 )
			f491_local15.acceptData = {
				classNum = f491_local1,
				wildcardToReplace = f491_local12
			}
		end
		local f491_local11 = CoD.CACUtility.PrimaryGunfighterEquippedCount( f491_local4 )
		if f491_local0 == "primary" then
			CoD.perController[f491_arg1].weaponSlot = "primary"
			f491_local6 = "PrimaryWeaponSelect"
			f491_local7 = "cac_loadout_edit_select_primary"
		elseif f491_local0 == "primaryattachment1" then
			local f491_local12 = f491_local2.primary
			CoD.perController[f491_arg1].weaponSlot = "primary"
			f491_local7 = "cac_loadout_edit_submenu"
			if f491_local12 then
				CoD.perController[f491_arg1].attachmentType = "optic"
				f491_local6 = "PrimaryOpticSelect"
			end
		elseif not (f491_local0 ~= "primaryattachment2" and f491_local0 ~= "primaryattachment3" and (f491_local0 ~= "primaryattachment4" or f491_local11 < 1)) or not (f491_local0 ~= "primaryattachment5" or f491_local11 < 2) or f491_local0 == "primaryattachment6" and f491_local11 >= 3 then
			if IsPrimaryWeaponAttachmentAvailable( f491_arg1 ) then
				local f491_local12 = f491_local2.primary
				CoD.perController[f491_arg1].weaponSlot = "primary"
				f491_local7 = "cac_loadout_edit_submenu"
				if f491_local12 then
					CoD.perController[f491_arg1].attachmentType = "attachment"
					f491_local6 = "PrimaryAttachmentSelect"
				end
			end
		elseif f491_local0 == "secondary" then
			CoD.perController[f491_arg1].weaponSlot = "secondary"
			f491_local6 = "SecondaryWeaponSelect"
			f491_local7 = "cac_loadout_edit_select_secondary"
			if CoD.CACUtility.IsBonusCardEquippedByName( f491_local2, "bonuscard_overkill" ) == true then
				CoD.perController[f491_arg1].weaponClassGroup = "primary"
				f491_local6 = "PrimaryWeaponSelect"
			end
		elseif f491_local0 == "secondaryattachment1" then
			local f491_local12 = f491_local2.secondary
			CoD.perController[f491_arg1].weaponSlot = "secondary"
			f491_local7 = "cac_loadout_edit_submenu"
			if f491_local12 then
				CoD.perController[f491_arg1].attachmentType = "optic"
				f491_local6 = "SecondaryOpticSelect"
			end
		elseif f491_local0 == "secondaryattachment2" or f491_local0 == "secondaryattachment3" and CoD.CACUtility.SearchForBonusCard( "bonuscard_secondary_gunfighter", f491_arg1 ) ~= "" then
			if IsSecondaryWeaponAttachmentAvailable( f491_arg1 ) then
				local f491_local12 = f491_local2.secondary
				CoD.perController[f491_arg1].weaponSlot = "secondary"
				f491_local7 = "cac_loadout_edit_submenu"
				if f491_local12 then
					CoD.perController[f491_arg1].attachmentType = "attachment"
					f491_local6 = "SecondaryAttachmentSelect"
				end
			end
		elseif f491_local0 == "primarygadget" then
			f491_local6 = "LethalEquipmentSelect"
			f491_local7 = "cac_loadout_edit_submenu"
			if CoD.CACUtility.IsBonusCardEquippedByName( f491_local2, "bonuscard_two_tacticals" ) == true then
				CoD.perController[f491_arg1].weaponClassGroup = "secondarygadget"
				f491_local6 = "TacticalEquipmentSelect"
			end
		elseif f491_local0 == "primarygadgetattachment1" or f491_local0 == "primarygadgetattachment2" or f491_local0 == "primarygadgetattachment3" then
			ToggleGadgetMod( f491_arg0, f491_arg1, f491_local0 )
		elseif f491_local0 == "secondarygadget" then
			f491_local6 = "TacticalEquipmentSelect"
			f491_local7 = "cac_loadout_edit_submenu"
		elseif f491_local0 == "secondarygadgetattachment1" or f491_local0 == "secondarygadgetattachment2" or f491_local0 == "secondarygadgetattachment3" then
			ToggleGadgetMod( f491_arg0, f491_arg1, f491_local0 )
		elseif not (f491_local0 ~= "specialty1" and (f491_local0 ~= "specialty4" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_1_greed", f491_arg1 ) == "")) or not (f491_local0 ~= "specialty2" and (f491_local0 ~= "specialty5" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_2_greed", f491_arg1 ) == "")) or f491_local0 == "specialty3" or f491_local0 == "specialty6" and CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_3_greed", f491_arg1 ) ~= "" then
			f491_local6 = "PerkSelect"
			f491_local7 = "cac_loadout_edit_submenu"
		elseif f491_local0 == "bonuscard1" or f491_local0 == "bonuscard2" or f491_local0 == "bonuscard3" then
			f491_local6 = "WildcardSelect"
			f491_local7 = "cac_loadout_edit_submenu"
		elseif f491_local0 == "cybercom_tacrig1" or f491_local0 == "cybercom_tacrig2" then
			f491_local6 = "TacticalRigSelect"
			f491_local7 = "cac_loadout_edit_submenu"
		end
		if f491_local7 then
			Engine.PlaySound( f491_local7 )
		end
		if f491_local6 then
			if f491_local6 == "WildcardSelect" then
				CheckGCCatchUp()
				OpenPopup( f491_arg0, f491_local6, f491_arg1 )
			else
				f491_arg0.checkGC = true
				NavigateToMenu( f491_arg0, f491_local6, f491_local5, f491_arg1 )
			end
		end
	end
end

function NavigateToPersonalizeMenu( f492_arg0, f492_arg1 )
	local f492_local0 = f492_arg0.currentActiveSlot
	local f492_local1 = CoD.perController[f492_arg1].classModel
	local f492_local2 = CoD.CACUtility.GetItemEquippedInSlot( f492_local0, f492_arg1, f492_local1 )
	local f492_local3 = CoD.CACUtility.GetItemRefEquippedInSlot( f492_local0, f492_arg1, f492_local1 )
	local f492_local4 = nil
	local f492_local5 = true
	if not (f492_local0 ~= "primary" or not CoD.CACUtility.ItemEquippedInSlot( "primary", f492_arg1 )) or f492_local0 == "secondary" and CoD.CACUtility.ItemEquippedInSlot( "secondary", f492_arg1 ) then
		f492_local4 = "WeaponCustomization"
	elseif (LUI.startswith( f492_local0, "primaryattachment" ) or LUI.startswith( f492_local0, "secondaryattachment" )) and f492_local0 ~= "primaryattachment1" and f492_local0 ~= "secondaryattachment1" and CoD.CACUtility.ItemEquippedInSlot( f492_local0, f492_arg1 ) and IsLive() and f492_local3 ~= "dw" then
		local f492_local6 = CoD.CACUtility.GetWeaponSlotForAttachmentSlot( f492_local0 )
		if f492_local6 then
			local f492_local7 = Engine.GetAttachmentCosmeticVariantCountForAttachment( CoD.CACUtility.GetItemRefEquippedInSlot( f492_local6, f492_arg1, f492_local1 ), Engine.GetItemAttachment( CoD.CACUtility.GetItemIndexEquippedInSlot( f492_local6, f492_arg1, f492_local1 ), CoD.CACUtility.GetItemIndexEquippedInSlot( f492_local0, f492_arg1, f492_local1 ) ) )
			if f492_local7 and f492_local7 > 0 then
				CoD.WC_Category.ACV.selectedAttachmentIndex = f492_local2
				CoD.WC_Category.ACV.selectedAttachment = f492_local3
				f492_local4 = "AttachmentCosmeticVariantSelect"
			end
		end
	elseif (f492_local0 == "primaryattachment1" or f492_local0 == "secondaryattachment1") and f492_local2 > CoD.CACUtility.EmptyItemIndex and CoD.CACUtility.AttachmentHasCustomReticle( f492_local3 ) then
		CoD.perController[f492_arg1].customReticleAttachmentIndex = f492_local2
		CoD.perController[f492_arg1].customReticleAttachment = f492_local3
		f492_local4 = "ReticleSelect"
	end
	if f492_local4 then
		CoD.perController[f492_arg1].weaponCategory = f492_local0
		NavigateToMenu( f492_arg0, f492_local4, f492_local5, f492_arg1 )
	end
end

function chooseClass_ClientChanged( f493_arg0, f493_arg1, f493_arg2, f493_arg3 )
	local f493_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	local f493_local1 = f493_local0.sessionClients
	local f493_local2 = Engine.GetModel( Engine.GetModelForController( f493_arg2 ), "ChooseClassCPClientMenu" )
	if f493_local2 then
		local f493_local3 = Engine.GetModel( f493_local2, "selectedClientIndex" )
		if f493_local3 then
			local f493_local4 = Engine.GetModel( f493_local2, "numActiveClients" )
			if f493_local4 then
				local f493_local5 = Engine.GetModelValue( f493_local4 )
				local f493_local6 = Engine.GetModelValue( f493_local3 )
				local f493_local7 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
				local f493_local8 = f493_local7.sessionClients
				local f493_local9 = Engine.GetXUID64( f493_arg2 )
				local f493_local10 = false
				repeat
					f493_local6 = f493_local6 + f493_arg3
					if f493_local6 < 1 then
						f493_local6 = f493_local5
					elseif f493_local5 < f493_local6 then
						f493_local6 = 1
					end
					local f493_local11 = Engine.GetModel( f493_local2, "client" .. f493_local6 )
					if f493_local11 then
						local f493_local12 = Engine.GetModelValue( Engine.GetModel( f493_local11, "xuid" ) )
						if f493_local12 == f493_local9 then
							f493_local10 = true
						else
							local f493_local13 = nil
							for f493_local14 = 1, #f493_local8, 1 do
								local f493_local17 = f493_local8[f493_local14]
								if f493_local17.xuid == f493_local12 then
									f493_local13 = f493_local17
									break
								end
							end
							if f493_local13 ~= nil then
								f493_local10 = Engine.IsSharedLoadoutAvailableForClient( f493_arg2, f493_local12 )
							end
							f493_local10 = false
						end
					end
				until f493_local10
				Engine.SetModelValue( f493_local3, f493_local6 )
				f493_arg0.chooseClassCPClientIngame0:setModel( Engine.GetModel( f493_local2, "client" .. f493_local6 ) )
				CoD.CACUtility.ResetCPCustomClasses( f493_arg2 )
				f493_arg0.classList.classList:updateDataSource( true )
				f493_arg0.classList.classList:processEvent( {
					name = "gain_focus",
					controller = f493_arg2
				} )
			end
		end
	end
end

function chooseClass_TabMPClassesListLeft( f494_arg0, f494_arg1 )
	if not f494_arg0.ClassSetTabWidget then
		return 
	else
		return f494_arg0.ClassSetTabWidget.Internal.Tabs:navigateItemLeft()
	end
end

function chooseClass_TabMPClassesListRight( f495_arg0, f495_arg1 )
	if not f495_arg0.ClassSetTabWidget then
		return 
	else
		return f495_arg0.ClassSetTabWidget.Internal.Tabs:navigateItemRight()
	end
end

function CAC_TabChanged( f496_arg0, f496_arg1, f496_arg2 )
	if not f496_arg0.performingSetup then
		DataSources.Unlockables.setCurrentFilterItem( f496_arg1.filter )
		f496_arg0.weaponList:updateDataSource( true )
		local f496_local0 = f496_arg0.weaponList:getItemAt( 1 )
		if f496_local0 then
			f496_arg0.weaponList:setActiveItem( f496_local0, 0, true, true )
		end
	end
end

function Cybercore_TabChanged( f497_arg0, f497_arg1, f497_arg2 )
	local f497_local0 = Engine.GetModel( Engine.GetModelForController( f497_arg2 ), "CybercoreUpgradeMenu" )
	Engine.SetModelValue( Engine.GetModel( f497_local0, "selectedCore" ), f497_arg1.itemRef )
	Engine.SetModelValue( Engine.GetModel( f497_local0, "currentCybercoreName" ), f497_arg1.itemName )
	f497_arg0.upgradeTree:updateTree( f497_arg2 )
	f497_arg0:processEvent( {
		name = "update_state",
		controller = f497_arg2
	} )
end

function SetClassItem( f498_arg0, f498_arg1, f498_arg2 )
	local f498_local0 = CoD.perController[f498_arg2].classNum
	local f498_local1 = CoD.perController[f498_arg2].weaponCategory
	local f498_local2 = f498_arg1:getModel( f498_arg2, "itemIndex" )
	local f498_local3 = 0
	if f498_local2 then
		f498_local3 = Engine.GetModelValue( f498_local2 )
	end
	local f498_local4 = f498_arg1:getModel( f498_arg2, "upgradeItemIndex" )
	local f498_local5 = 0
	if f498_local4 then
		f498_local5 = Engine.GetModelValue( f498_local4 )
	end
	local f498_local6 = f498_local3
	if IsCACItemUpgraded( f498_arg0, f498_arg1, f498_arg2 ) then
		f498_local6 = f498_local5
	end
	if AttemptAttachItem( f498_arg0, f498_arg2, f498_arg0:getModel(), f498_local0, f498_local1, f498_local6 ) then
		if f498_local1 == "primary" or f498_local1 == "secondary" then
			CoD.CACUtility.ForceStreamAttachmentImages( f498_arg2 )
		end
		BreakWeaponVariantLink( f498_arg2 )
		f498_arg0:playSound( "equip_item" )
		local f498_local7 = GoBack( f498_arg0, f498_arg2 )
		if f498_local7 then
			f498_local7:processEvent( {
				name = "update_state",
				controller = f498_arg2
			} )
		end
		return f498_local7
	else
		
	end
end

function SetClassWildcard( f499_arg0, f499_arg1, f499_arg2 )
	local f499_local0 = CoD.perController[f499_arg2].classNum
	local f499_local1 = CoD.perController[f499_arg2].weaponCategory
	local f499_local2 = CoD.perController[f499_arg2].classModel
	local f499_local3 = false
	local f499_local4 = f499_arg1:getModel( f499_arg2, "itemIndex" )
	local f499_local5 = 0
	if f499_local4 then
		f499_local5 = Engine.GetModelValue( f499_local4 )
	end
	local f499_local6 = Engine.GetModel( f499_local2, f499_local1 .. ".itemIndex" )
	if f499_local6 then
		local f499_local7 = Engine.GetModelValue( f499_local6 )
		if CoD.CACUtility.EmptyItemIndex < f499_local7 and f499_local7 == f499_local5 then
			f499_local3 = true
		end
	end
	if f499_local3 or AttemptAttachItem( f499_arg0, f499_arg2, f499_arg0:getModel(), f499_local0, f499_local1, f499_local5 ) then
		f499_arg0:playSound( "equip_item" )
		local f499_local7 = GoBack( f499_arg0, f499_arg2 )
		if CoD.CACUtility.CustomClass_LastClassNum and f499_local7.menuName == "CustomClass" then
			f499_local7:navigateTo( CoD.CACUtility.CustomClass_LastSelection )
			f499_local7:processEvent( {
				name = "update_state",
				controller = f499_arg2
			} )
		end
	end
end

function SetClassAttachment( f500_arg0, f500_arg1, f500_arg2 )
	local f500_local0 = CoD.perController[f500_arg2].classModel
	local f500_local1 = CoD.perController[f500_arg2].classNum
	local f500_local2 = CoD.perController[f500_arg2].weaponCategory
	local f500_local3 = f500_arg1:getModel( f500_arg2, "itemIndex" )
	local f500_local4 = 0
	if f500_local3 then
		f500_local4 = Engine.GetModelValue( f500_local3 )
	end
	if AttemptAttachItem( f500_arg0, f500_arg2, f500_arg0:getModel(), f500_local1, f500_local2, f500_local4, true ) then
		BreakWeaponVariantLink( f500_arg2 )
		CoD.CACUtility.GetCustomClassModel( f500_arg2, f500_local1, f500_local0 )
		f500_arg0:playSound( "equip_item" )
		local f500_local5 = GoBack( f500_arg0, f500_arg2 )
		if f500_local5 then
			f500_local5:processEvent( {
				name = "update_state",
				controller = f500_arg2
			} )
		end
	end
end

function SetWeaponVariant( f501_arg0, f501_arg1, f501_arg2 )
	local f501_local0 = CoD.perController[f501_arg2].classNum
	local f501_local1 = CoD.perController[f501_arg2].classModel
	local f501_local2 = CoD.perController[f501_arg2].weaponCategory
	local f501_local3 = f501_local2 == "primary"
	local f501_local4 = f501_arg1.weaponVariantInfo.weaponIndex
	local f501_local5 = f501_arg1.weaponVariantInfo.attachmentsByIndex
	local f501_local6 = f501_arg1.weaponVariantInfo.unlockedAttachmentsByIndex
	local f501_local7 = f501_arg1.weaponVariantInfo.wildcardNeededCount
	local f501_local8 = f501_arg1.weaponVariantInfo.wildcardNeededFromVariantCount
	local f501_local9 = not f501_arg1.dontRemoveAttachments
	local f501_local10 = false
	local f501_local11 = false
	local f501_local12 = Engine.GetMaxAllocation( f501_arg2 )
	local f501_local13 = Engine.GetModel( f501_local1, "allocationSpent" )
	local f501_local14 = 0
	local f501_local15 = 0
	local f501_local16 = 0
	local f501_local17 = 0
	local f501_local18 = 0
	local f501_local19 = 2
	local f501_local20 = "bonuscard_primary_gunfighter"
	local f501_local21 = CoD.CACUtility.PrimaryAttachmentSlotNameList
	local f501_local22 = 3
	local f501_local23 = CoD.CACUtility.maxPrimaryGunfighters
	if not f501_local3 then
		f501_local19 = 1
		f501_local21 = CoD.CACUtility.SecondaryAttachmentSlotNameList
		f501_local20 = "bonuscard_secondary_gunfighter"
		f501_local22 = 2
		f501_local23 = CoD.CACUtility.maxSecondaryGunfigthers
	end
	if f501_local13 then
		f501_local14 = Engine.GetModelValue( f501_local13 )
	end
	if CoD.CACUtility.EmptyItemIndex < Engine.GetModelValue( Engine.GetModel( f501_local1, f501_local2 .. ".itemIndex" ) ) then
		f501_local15 = 1
	end
	for f501_local27, f501_local28 in ipairs( f501_local21 ) do
		if CoD.CACUtility.EmptyItemIndex < Engine.GetModelValue( Engine.GetModel( f501_local1, f501_local28 .. ".itemIndex" ) ) then
			f501_local16 = f501_local16 + 1
		end
	end
	if f501_local3 then
		f501_local18 = CoD.CACUtility.PrimaryGunfighterEquippedCount( f501_local1 )
	elseif CoD.CACUtility.IsBonusCardEquipped( CoD.CACUtility.bonuscards.secondary_gunfighter, f501_local1 ) then
		f501_local18 = 1
	end
	f501_local17 = f501_local18
	f501_local14 = f501_local14 - f501_local15 - f501_local16 - f501_local17
	f501_local24 = f501_arg1.weaponVariantInfo.camoIndex
	if f501_local24 ~= CoD.CACUtility.GetItemEquippedInSlot( f501_local2 .. "Camo", f501_arg2, f501_local1 ) then
		f501_local26 = Engine.GetWeaponOptionEntitlementString( f501_local24 )
		if not f501_local26 then
			f501_local26 = ""
		end
		if CoD.StoreUtility.DoesInventoryItemExistsByName( f501_local26 ) then
			LUI.CoDMetrics.InventoryItemEquipped( f501_arg2, Engine.GetWeaponOptionName( f501_local24 ), f501_local24, "CamoVariantEquip" )
		end
	end
	f501_local26 = 0
	f501_local27 = 1
	f501_local28 = 0
	local f501_local29 = false
	local f501_local30 = 0
	local f501_local31 = f501_local5
	local f501_local32 = {}
	local f501_local33 = f501_local18
	local f501_local34 = f501_local7 - f501_local18
	if f501_local3 then
		f501_local34 = math.min( math.max( f501_local34, 0 ), CoD.CACUtility.maxPrimaryGunfighters )
	else
		f501_local34 = math.min( math.max( f501_local34, 0 ), CoD.CACUtility.maxSecondaryGunfighters )
	end
	if IsProgressionEnabled( f501_arg2 ) then
		f501_local31 = f501_local6
		if f501_local3 then
			local f501_local35 = 0
			for f501_local42, f501_local43 in ipairs( CoD.CACUtility.PrimaryGunfighterWildcards ) do
				if f501_local8 <= f501_local35 then
					break
				elseif CoD.CACUtility.IsBonusCardEquipped( f501_local43, f501_local1 ) then
					f501_local17 = f501_local17 - 1
				else
					local f501_local39 = Engine.GetItemIndexFromReference( f501_local43 )
					local f501_local40 = Engine.IsItemLocked( f501_arg2, f501_local39 )
					local f501_local41
					if not f501_local40 then
						f501_local41 = not Engine.IsItemPurchased( f501_arg2, f501_local39 )
					else
						f501_local41 = false
					end
					table.insert( f501_local32, {
						ref = f501_local43,
						itemIndex = f501_local39,
						isLocked = f501_local40,
						isPurchasable = f501_local41
					} )
				end
				f501_local35 = f501_local35 + 1
			end
			f501_local33 = f501_local35
		elseif f501_local34 > 0 and f501_local33 < f501_local8 then
			if CoD.CACUtility.IsBonusCardEquipped( f501_local20, f501_local1 ) then
				f501_local17 = f501_local17 - 1
			else
				local f501_local35 = Engine.GetItemIndexFromReference( f501_local20 )
				local f501_local36 = Engine.IsItemLocked( f501_arg2, f501_local35 )
				local f501_local37
				if not f501_local36 then
					f501_local37 = not Engine.IsItemPurchased( f501_arg2, f501_local35 )
				else
					f501_local37 = false
				end
				table.insert( f501_local32, {
					ref = f501_local20,
					itemIndex = f501_local35,
					isLocked = f501_local36,
					isPurchasable = f501_local37
				} )
				f501_local33 = 1
			end
		end
	else
		f501_local34 = f501_local8 - f501_local18
		if f501_local3 then
			f501_local34 = math.min( math.max( f501_local34, 0 ), CoD.CACUtility.maxPrimaryGunfighters )
		else
			f501_local34 = math.min( math.max( f501_local34, 0 ), CoD.CACUtility.maxSecondaryGunfighters )
		end
		if f501_local8 > 0 and f501_local34 > 0 then
			if f501_local3 then
				local f501_local35 = 0
				for f501_local42, f501_local43 in ipairs( CoD.CACUtility.PrimaryGunfighterWildcards ) do
					if f501_local8 <= f501_local35 then
						
					elseif CoD.CACUtility.IsBonusCardEquipped( f501_local43, f501_local1 ) then
						f501_local17 = f501_local17 - 1
					else
						table.insert( f501_local32, {
							ref = f501_local43,
							itemIndex = Engine.GetItemIndexFromReference( f501_local43 ),
							isLocked = false
						} )
					end
					f501_local35 = f501_local35 + 1
				end
			elseif CoD.CACUtility.IsBonusCardEquipped( f501_local20, f501_local1 ) then
				f501_local17 = f501_local17 - 1
			else
				table.insert( f501_local32, {
					ref = f501_local20,
					itemIndex = Engine.GetItemIndexFromReference( f501_local20 ),
					isLocked = false
				} )
			end
		else
			f501_local17 = f501_local17 - f501_local8
		end
		f501_local33 = f501_local8
	end
	local f501_local35 = false
	for f501_local42, f501_local43 in ipairs( f501_local32 ) do
		if f501_local43.isLocked and f501_local9 then
			for f501_local39 = #f501_local31, f501_local22, -1 do
				if f501_local31[f501_local39] ~= CoD.CACUtility.EmptyItemIndex then
					f501_local31[f501_local39] = CoD.CACUtility.EmptyItemIndex
					break
				end
			end
		end
		if f501_local43.isPurchasable then
			f501_local35 = true
		end
	end
	for f501_local42, f501_local43 in ipairs( f501_local31 ) do
		if CoD.CACUtility.EmptyItemIndex < f501_local43 then
			f501_local28 = f501_local28 + 1
		end
	end
	f501_local36 = 1
	while #f501_local32 > 0 and f501_local36 <= #f501_local32 do
		if f501_local32[f501_local36].isLocked then
			table.remove( f501_local32, f501_local36 )
			f501_local34 = f501_local34 - 1
			f501_local33 = f501_local33 - 1
		else
			f501_local36 = f501_local36 + 1
		end
	end
	f501_local26 = f501_local27 + f501_local28 + f501_local33
	f501_local37 = 0
	if f501_local34 > 0 then
		for f501_local39, f501_local40 in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
			if not CoD.CACUtility.ItemEquippedInSlot( f501_local40, f501_arg2, f501_local1 ) then
				f501_local37 = f501_local37 + 1
			end
		end
		if f501_local37 < f501_local34 then
			f501_local11 = true
		end
	end
	if not IsCampaign() and f501_local12 < f501_local14 + f501_local26 + f501_local17 then
		f501_local10 = true
	end
	if f501_local35 then
		f501_local38 = nil
		f501_local42 = true
		f501_local43 = nil
		for f501_local44, f501_local45 in ipairs( f501_local32 ) do
			if f501_local45.isPurchasable then
				f501_local43 = f501_local45
				break
			end
		end
		f501_local39 = CoD.OverlayUtility.CreateOverlay( f501_arg2, f501_arg0, "UnlockClassItem", f501_arg2, f501_local43.itemIndex, f501_local38, f501_local42 )
		f501_local39.acceptData = {
			variantInfoElement = f501_arg1
		}
	elseif f501_local11 then
		CoD.perController[f501_arg2].wildcardOverCapacityRefName = f501_local32[1].ref
		Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f501_arg2 ), "CACMenu.numWildcardItemsToRemove" ), f501_local34 - f501_local37 )
		f501_local42 = OpenPopup( f501_arg0, "WildcardCapacity", f501_arg2 )
		f501_local42.acceptData = {
			classNum = f501_local0,
			variantInfoElement = f501_arg1,
			wildcarUnlockedTable = f501_local32
		}
	elseif f501_local10 then
		Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f501_arg2 ), "CACMenu.numItemsToRemove" ), f501_local14 + f501_local26 + f501_local17 - f501_local12 )
		f501_local43 = OpenPopup( f501_arg0, "RemoveItemFromClass", f501_arg2 )
		f501_local43.acceptData = {
			slotName = f501_local2,
			weaponVariantInfo = f501_arg1.weaponVariantInfo,
			attachmentsByIndex = f501_local31,
			wildcarUnlockedTable = f501_local32,
			bonuscardGunfighterForSlot = f501_local20
		}
	else
		AttachWeaponVariant( f501_arg0, f501_arg2, f501_local2, f501_arg1.weaponVariantInfo, f501_local31, f501_local32, f501_local20 )
		GoBackToCustomClassMenu( f501_arg0, f501_arg2 )
	end
end

function BreakWeaponVariantLink( f502_arg0, f502_arg1 )
	local f502_local0 = CoD.perController[f502_arg0].classNum
	local f502_local1 = CoD.CACUtility.EmptyItemIndex
	local f502_local2 = f502_arg1
	local f502_local3 = nil
	if not f502_arg1 then
		f502_local2 = CoD.perController[f502_arg0].weaponCategory
	end
	f502_local3 = CoD.CACUtility.GetBaseWeaponLoadoutSlotName( f502_local2 )
	if f502_local3 == "primary" or f502_local3 == "secondary" then
		local f502_local4 = CoD.GetClassItem( f502_arg0, f502_local0, f502_local3 .. "gunsmithvariant" )
		if f502_local4 ~= f502_local1 then
			local f502_local5 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f502_arg0, f502_local4 - 1 )
			CoD.OverlayUtility.ShowToast( "BreakVariantLink", Engine.Localize( "MENU_WEAPON_VARIANT_LINK_BROKEN" ), f502_local5.variantName, "uie_t7_mp_icon_header_gunsmith" )
		end
		CoD.SetClassItem( f502_arg0, f502_local0, f502_local3 .. "gunsmithvariant", f502_local1 )
	end
end

function UpdateShownCybercoreXmodel( f503_arg0, f503_arg1 )
	local f503_local0 = f503_arg0:getModel( f503_arg1, "baseItemIndex" )
	local f503_local1 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local f503_local2 = 0
	if f503_local0 then
		Engine.SendClientScriptNotify( f503_arg1, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f503_arg1 ), "cybercore", CoD.CACUtility.GetCybercoreXModel( Engine.GetModelValue( f503_local0 ), f503_local1 ), "select01", nil, nil, IsCybercoreAbilityAvailable( f503_arg0, f503_arg1 ), IsCybercoreAbilityPurchasable( f503_arg0, f503_arg1 ) )
	end
end

function FocusClassItem( f504_arg0, f504_arg1, f504_arg2 )
	local f504_local0 = CoD.perController[f504_arg2].classNum
	local f504_local1 = CoD.perController[f504_arg2].weaponCategory
	local f504_local2 = CoD.perController[f504_arg2].classModel
	local f504_local3 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local f504_local4 = f504_arg1:getModel( f504_arg2, "itemIndex" )
	local f504_local5 = 0
	if f504_local4 then
		f504_local5 = Engine.GetModelValue( f504_local4 )
	elseif f504_arg1.itemIndex then
		f504_local5 = f504_arg1.itemIndex
	end
	local f504_local6 = "select01"
	local f504_local7, f504_local8, f504_local9 = nil
	if LUI.startswith( f504_local1, "primaryattachment" ) then
		f504_local7 = "primary"
		f504_local8 = CoD.CACUtility.PrimaryAttachmentSlotNameList
	elseif LUI.startswith( f504_local1, "secondaryattachment" ) then
		f504_local7 = "secondary"
		f504_local8 = CoD.CACUtility.SecondaryAttachmentSlotNameList
	elseif LUI.startswith( f504_local1, "specialty" ) then
		f504_local7 = "specialty"
		f504_local9 = CoD.CACUtility.GetPerkXModel( f504_local5, f504_local3 )
	elseif LUI.startswith( f504_local1, "bonuscard" ) then
		f504_local7 = "bonuscard"
		f504_local9 = CoD.CACUtility.GetBonuscardXModel( f504_local5, f504_local3 )
	elseif LUI.startswith( f504_local1, "cybercore" ) then
		f504_local7 = "cybercore"
		f504_local9 = CoD.CACUtility.GetCybercoreXModel( f504_local5, f504_local3 )
	elseif LUI.startswith( f504_local1, "cybercom" ) then
		f504_local7 = "cybercom"
		f504_local9 = CoD.CACUtility.GetPerkXModel( f504_local5, f504_local3 )
	end
	local f504_local10 = Engine.GetModel( f504_local2, f504_local7 .. ".itemIndex" )
	local f504_local11 = Engine.GetModel( f504_local2, f504_local1 .. ".itemIndex" )
	if f504_local10 and f504_local11 and f504_local7 ~= "cybercore" then
		local f504_local12 = Engine.GetModelValue( f504_local10 )
		local f504_local13 = Engine.GetAttachmentRef( f504_local12, f504_local5 )
		local f504_local14 = Engine.GetModelValue( f504_local11 )
		local f504_local15 = Engine.GetAttachmentRef( f504_local12, f504_local14 )
		local f504_local16 = Engine.GetItemRef( f504_local12 ) .. "_" .. CoD.gameMode:lower()
		local f504_local17 = {}
		local f504_local18 = false
		for f504_local22, f504_local23 in ipairs( f504_local8 ) do
			local f504_local24 = Engine.GetModelValue( Engine.GetModel( f504_local2, f504_local23 .. ".itemIndex" ) )
			if CoD.CACUtility.EmptyItemIndex < f504_local24 then
				if f504_local24 ~= f504_local14 then
					table.insert( f504_local17, {
						index = f504_local24,
						ref = Engine.GetAttachmentRef( f504_local12, f504_local24 )
					} )
				else
					f504_local18 = true
				end
			end
		end
		for f504_local22, f504_local23 in ipairs( f504_local17 ) do
			local f504_local24 = f504_local23.ref
			local f504_local25 = f504_local23.index
			if (not Engine.IsOptic( f504_local12, f504_local5 ) or not Engine.IsOptic( f504_local12, f504_local25 )) and Engine.AreAttachmentsCompatible( f504_local12, f504_local5, f504_local25 ) then
				f504_local16 = f504_local16 .. "+" .. f504_local24
			end
		end
		f504_local16 = f504_local16 .. "+" .. f504_local13
		if f504_local16 and f504_local16 ~= "" then
			Engine.SendClientScriptNotify( f504_arg2, "CustomClass_focus" .. CoD.GetLocalClientAdjustedNum( f504_arg2 ), f504_local7, f504_local16, f504_local13, "none", CoD.CACUtility.GetACVariantsFromClassExcludeAttachment( f504_arg2, f504_local2, f504_local1, f504_local13 ) .. f504_local13 .. "," .. f504_arg1.acvIndex )
		end
	elseif f504_local11 ~= nil then
		local f504_local12
		if not IsCACItemLocked( f504_arg0, f504_arg1, f504_arg2 ) then
			f504_local12 = not IsSelfModelValueTrue( f504_arg1, f504_arg2, "isBMClassified" )
		else
			f504_local12 = false
		end
		Engine.SendClientScriptNotify( f504_arg2, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f504_arg2 ), f504_local1, f504_local9, f504_local6, nil, nil, f504_local12, not IsCACItemPurchased( f504_arg1, f504_arg2 ) )
	end
end

function FocusWeapon( f505_arg0, f505_arg1, f505_arg2 )
	local f505_local0 = CoD.perController[f505_arg2].classNum
	local f505_local1 = CoD.perController[f505_arg2].weaponCategory
	local f505_local2 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local f505_local3 = f505_arg1:getModel( f505_arg2, "itemIndex" )
	local f505_local4 = 0
	if f505_local3 then
		local f505_local5 = Engine.GetItemRef( Engine.GetModelValue( f505_local3 ), f505_local2 )
		local f505_local6 = f505_local5 .. "_mp"
		if f505_local1 == "secondary" then
			f505_local6 = "none," .. f505_local6
		end
		local f505_local7 = f505_local5 .. "_" .. CoD.gameMode:lower()
		local f505_local8 = CoD.CACUtility.EmptyWeaponOptions()
		local f505_local9 = not IsCACItemLocked( f505_arg0, f505_arg1, f505_arg2 )
		local f505_local10
		if not IsCACItemPurchased( f505_arg1, f505_arg2 ) and not IsSelfModelValueTrue( f505_arg1, f505_arg2, "isBMClassified" ) then
			f505_local10 = not IsSelfModelValueTrue( f505_arg1, f505_arg2, "isContractClassified" )
		else
			f505_local10 = false
		end
		Engine.SendClientScriptNotify( f505_arg2, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f505_arg2 ), f505_local1, f505_local7, "select01", f505_local8, nil, f505_local9, f505_local10 )
	end
end

function FocusWeaponVariant( f506_arg0, f506_arg1, f506_arg2 )
	local f506_local0 = CoD.perController[f506_arg2].classNum
	local f506_local1 = CoD.perController[f506_arg2].weaponCategory
	local f506_local2 = f506_arg1.weaponVariantInfo.weaponIndex
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f506_arg2 ), "CACMenu.curWeaponVariantName" ), f506_arg1.weaponVariantInfo.variantName )
	local f506_local3 = Engine.GetItemRef( f506_local2 ) .. "_" .. CoD.gameMode:lower()
	for f506_local7, f506_local8 in ipairs( f506_arg1.weaponVariantInfo.attachmentsByIndex ) do
		f506_local3 = f506_local3 .. "+" .. Engine.GetAttachmentRef( f506_local2, f506_local8 )
	end
	Engine.SendClientScriptNotify( f506_arg2, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f506_arg2 ), f506_local1, f506_local3, CoD.CACUtility.GetCameraNameForAttachments( f506_local3 ), CoD.CACUtility.GetWeaponOptionsFromVariantInfo( f506_arg2, f506_arg1.weaponVariantInfo ), CoD.CACUtility.GetAttachmentCosmeticVariantsFromVariantInfo( f506_arg1.weaponVariantInfo ) )
end

function MarkCACPaintshopDataDirty( f507_arg0, f507_arg1 )
	Engine.MarkPSDataDirty( f507_arg1, false )
end

function MarkCACPaintshopDataDirtyForEdittingSpecialist( f508_arg0 )
	if IsLuaCodeVersionAtLeast( 20 ) then
		Engine.MarkPSDataDirty( f508_arg0, false, CoD.CCUtility.Heroes.HeroIndexForEdits )
	else
		MarkCACPaintshopDataDirty( nil, f508_arg0 )
	end
end

function ClearLocalPSCharacter( f509_arg0 )
	if IsLuaCodeVersionAtLeast( 20 ) then
		Engine.ClearLocalPSCharacter( f509_arg0 )
	end
end

function RemoveItemFromClass( f510_arg0, f510_arg1, f510_arg2 )
	if f510_arg0.ShowRemovePrompt ~= nil and not f510_arg0:ShowRemovePrompt( f510_arg2 ) then
		return 
	end
	local f510_local0 = CoD.perController[f510_arg2].classNum
	local f510_local1 = CoD.perController[f510_arg2].classModel
	local f510_local2 = f510_arg0.currentActiveSlot
	if f510_local2 and RemoveItemFromClassSlot( f510_local2, f510_arg2 ) then
		BreakWeaponVariantLink( f510_arg2, f510_local2 )
		CoD.CACUtility.GetCustomClassModel( f510_arg2, f510_local0, f510_local1 )
		f510_arg0:playSound( "unequip_item" )
		f510_arg0:processEvent( {
			name = "update_state",
			controller = f510_arg2
		} )
		f510_arg0:processEvent( {
			name = "update_button_prompts",
			controller = f510_arg2
		} )
	end
	local f510_local3 = Engine.GetWeaponString( f510_arg2, f510_local0, "primary" )
	local f510_local4 = Engine.GetWeaponString( f510_arg2, f510_local0, "secondary" )
	if f510_local3 ~= "" then
		Engine.SendClientScriptNotify( f510_arg2, "CustomClass_primary", "custom_removeattach", f510_local3 )
	end
	if f510_local4 ~= "" then
		Engine.SendClientScriptNotify( f510_arg2, "CustomClass_secondary", "custom_removeattach", f510_local4 )
	end
	local f510_local5 = nil
	local f510_local6 = CoD.CACUtility.GetBaseWeaponLoadoutSlotName( f510_local2 )
	if f510_local6 and (f510_local6 == "primary" or f510_local6 == "secondary") then
		f510_local5 = Engine.GetWeaponString( f510_arg2, f510_local0, f510_local6 )
	else
		Engine.SendClientScriptNotify( f510_arg2, "CustomClass_remove" .. CoD.GetLocalClientAdjustedNum( f510_arg2 ) )
	end
	if f510_local5 and f510_local5 ~= "" then
		Engine.SendClientScriptNotify( f510_arg2, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f510_arg2 ), f510_local2, f510_local5, CoD.CACUtility.GetCameraNameForAttachments( f510_local5 ), CoD.CACUtility.GetWeaponOptionsFromClass( f510_arg2, f510_local1, f510_local6 ), CoD.CACUtility.GetAttachmentCosmeticVariantsFromClass( f510_arg2, f510_local1, f510_local6 ) )
	else
		Engine.SendClientScriptNotify( f510_arg2, "CustomClass_remove" .. CoD.GetLocalClientAdjustedNum( f510_arg2 ) )
	end
end

function RemoveOverflowItemFromClass( f511_arg0, f511_arg1, f511_arg2 )
	local f511_local0 = CoD.perController[f511_arg2].classModel
	local f511_local1 = f511_arg0.acceptData.classNum
	local f511_local2 = f511_arg0.acceptData.slotName
	local f511_local3 = f511_arg0.acceptData.itemIndex
	local f511_local4 = Engine.GetUsedAllocation( f511_arg2, f511_local1 )
	local f511_local5 = f511_arg1:getModel( f511_arg2, "itemSlot" )
	if f511_local5 then
		RemoveItemFromClassSlot( Engine.GetModelValue( f511_local5 ), f511_arg2 )
	end
	local f511_local6 = Engine.GetUsedAllocation( f511_arg2, f511_local1 )
	local f511_local7 = f511_local4 - f511_local6
	local f511_local8 = Engine.GetMaxAllocation( f511_arg2 )
	if f511_arg0.itemList.activeWidget:isLastItem() then
		f511_arg0.itemList.savedActiveIndex = f511_arg0.itemList.activeWidget.gridInfoTable.zeroBasedIndex - 1
	end
	local f511_local9 = f511_arg0.itemList:getDataSource()
	if f511_local9.getCount( f511_arg0.itemList ) > 1 then
		f511_arg0.itemList:updateDataSource()
	end
	if f511_local6 < f511_local8 then
		AttemptAttachItem( f511_arg0, f511_arg2, f511_local0, f511_local1, f511_local2, f511_local3 )
		BreakWeaponVariantLink( f511_arg2 )
		f511_local9 = GoBack( f511_arg0, f511_arg2 )
		if f511_local9.id ~= "Menu.CustomClass" then
			f511_local9 = GoBack( f511_local9, f511_arg2 )
		else
			local f511_local10 = nil
			local f511_local11 = "select01"
			if LUI.startswith( f511_local2, "primarygadgetattachment" ) then
				f511_local10 = Engine.GetWeaponString( f511_arg2, f511_local1, "primarygadget" )
			elseif LUI.startswith( f511_local2, "secondarygadgetattachment" ) then
				f511_local10 = Engine.GetWeaponString( f511_arg2, f511_local1, "secondarygadget" )
			end
			if f511_local10 and f511_local10 ~= "" then
				Engine.SendClientScriptNotify( f511_arg2, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f511_arg2 ), f511_local2, f511_local10, f511_local11 )
			end
		end
		if f511_local9 then
			f511_local9:processEvent( {
				name = "update_state",
				controller = f511_arg2
			} )
			SetFocusToLoadoutWidgetAfterSetItem( f511_local9 )
		end
	end
end

function WeaponVariantRemoveItemFromClass( f512_arg0, f512_arg1, f512_arg2 )
	local f512_local0 = CoD.perController[f512_arg2].classNum
	local f512_local1 = Engine.GetUsedAllocation( f512_arg2, f512_local0 )
	local f512_local2 = f512_arg1:getModel( f512_arg2, "itemSlot" )
	if f512_local2 then
		RemoveItemFromClassSlot( Engine.GetModelValue( f512_local2 ), f512_arg2 )
	end
	local f512_local3 = f512_local1 - Engine.GetUsedAllocation( f512_arg2, f512_local0 )
	if f512_arg0.itemList.activeWidget:isLastItem() then
		f512_arg0.itemList.savedActiveIndex = f512_arg0.itemList.activeWidget.gridInfoTable.zeroBasedIndex - 1
	end
	local f512_local4 = f512_arg0.itemList:getDataSource()
	if f512_local4.getCount( f512_arg0.itemList ) > 1 then
		f512_arg0.itemList:updateDataSource()
	end
	f512_local4 = Engine.GetModel( Engine.GetModelForController( f512_arg2 ), "CACMenu.numItemsToRemove" )
	local f512_local5 = Engine.GetModelValue( f512_local4 ) - f512_local3
	Engine.SetModelValue( f512_local4, f512_local5 )
	if f512_local5 <= 0 then
		AttachWeaponVariant( f512_arg0, f512_arg2, f512_arg0.acceptData.slotName, f512_arg0.acceptData.weaponVariantInfo, f512_arg0.acceptData.attachmentsByIndex, f512_arg0.acceptData.wildcarUnlockedTable, f512_arg0.acceptData.bonuscardGunfighterForSlot )
		local f512_local6 = GoBack( f512_arg0, f512_arg2 )
		GoBackToCustomClassMenu( f512_local6, f512_arg2 )
		ClearSavedState( f512_local6, f512_arg2 )
	end
end

function RemoveOverflowWildcardFromClass( f513_arg0, f513_arg1, f513_arg2 )
	local f513_local0 = f513_arg1:getModel( f513_arg2, "itemSlot" )
	local f513_local1 = nil
	if f513_local0 then
		f513_local1 = Engine.GetModelValue( f513_local0 )
		RemoveItemFromClassSlot( f513_local1, f513_arg2 )
	end
	local f513_local2 = CoD.perController[f513_arg2].classModel
	local f513_local3 = f513_arg0.acceptData.classNum
	local f513_local4 = f513_arg0.acceptData.variantInfoElement
	local f513_local5 = nil
	if f513_local4 then
		f513_local5 = f513_arg0.acceptData.wildcarUnlockedTable[1].itemIndex
		table.remove( f513_arg0.acceptData.wildcarUnlockedTable, 1 )
		if #f513_arg0.acceptData.wildcarUnlockedTable > 0 then
			CoD.perController[f513_arg2].wildcardOverCapacityRefName = f513_arg0.acceptData.wildcarUnlockedTable[1].ref
			f513_arg0:updateWildcardToReplaceInfo( f513_arg2 )
		end
	else
		f513_local5 = Engine.GetItemIndexFromReference( f513_arg0.acceptData.wildcardToReplace )
	end
	AttemptAttachItem( f513_arg0, f513_arg2, f513_local2, f513_local3, f513_local1, f513_local5 )
	f513_arg0.selectionList:updateDataSource()
	local f513_local6 = Engine.GetModel( Engine.GetModelForController( f513_arg2 ), "CACMenu.numWildcardItemsToRemove" )
	local f513_local7 = Engine.GetModelValue( f513_local6 ) - 1
	Engine.SetModelValue( f513_local6, f513_local7 )
	if f513_local7 <= 0 then
		if f513_local4 then
			local f513_local8 = GoBack( f513_arg0, f513_arg2 )
			f513_local4.dontRemoveAttachments = true
			SetWeaponVariant( f513_local8, f513_local4, f513_arg2 )
			f513_local4.dontRemoveAttachments = nil
		else
			GoBackToCustomClassMenu( f513_arg0, f513_arg2 )
		end
	end
end

function SetWeaponOptionClassItem( f514_arg0, f514_arg1, f514_arg2 )
	local f514_local0 = CoD.perController[f514_arg2].classModel
	local f514_local1 = CoD.perController[f514_arg2].classNum
	local f514_local2 = CoD.perController[f514_arg2].weaponCategory
	local f514_local3 = CoD.CACUtility.GetBaseWeaponLoadoutSlotName( f514_local2 )
	local f514_local4 = f514_arg1:getModel( f514_arg2, "weaponOptionTypeName" )
	local f514_local5 = f514_arg1:getModel( f514_arg2, "weaponOptionSubIndex" )
	local f514_local6 = f514_arg1:getModel( f514_arg2, "weaponOptionType" )
	if f514_local4 and f514_local5 and f514_local6 then
		local f514_local7 = Engine.GetModelValue( f514_local4 )
		local f514_local8 = Engine.GetModelValue( f514_local5 )
		local f514_local9 = Engine.GetModelValue( f514_local6 )
		if f514_local9 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB then
			local f514_local10 = Engine.GetModelValue( f514_arg1:getModel( f514_arg2, "paintjobIndex" ) )
			CoD.SetClassItem( f514_arg2, f514_local1, f514_local3 .. f514_local7 .. "slot", Engine.GetModelValue( f514_arg1:getModel( f514_arg2, "paintjobSlot" ) ) )
			CoD.SetClassItem( f514_arg2, f514_local1, f514_local3 .. f514_local7 .. "index", f514_local10 )
		else
			if f514_local9 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO and f514_local8 ~= CoD.GetClassItem( f514_arg2, f514_local1, f514_local3 .. f514_local7 ) and CoD.StoreUtility.DoesInventoryItemExistsByName( Engine.GetModelValue( f514_arg1:getModel( f514_arg2, "entitlementString" ) ) ) then
				LUI.CoDMetrics.InventoryItemEquipped( f514_arg2, Engine.GetModelValue( f514_arg1:getModel( f514_arg2, "name" ) ), f514_local8, "CamoCAC" )
			end
			CoD.SetClassItem( f514_arg2, f514_local1, f514_local3 .. f514_local7, f514_local8 )
		end
		if f514_local2 == "primary" or f514_local2 == "secondary" then
			CoD.CACUtility.UpdateWeaponOptions( f514_arg2, f514_local0 )
		end
	end
end

function SetAttachmentVariantClassItem( f515_arg0, f515_arg1, f515_arg2 )
	local f515_local0 = CoD.perController[f515_arg2].classModel
	local f515_local1 = CoD.perController[f515_arg2].classNum
	local f515_local2 = CoD.perController[f515_arg2].weaponCategory
	if f515_local2 then
		CoD.SetClassItem( f515_arg2, f515_local1, f515_local2 .. "cosmeticvariant", f515_arg1.variantIndex )
		CoD.CACUtility.UpdateAttachmentCosmeticVariants( f515_arg2, f515_local0 )
		CoD.CACUtility.GetCustomClassModel( f515_arg2, f515_local1, f515_local0 )
	end
end

function UpdateAllocationBar( f516_arg0, f516_arg1, f516_arg2 )
	local f516_local0 = f516_arg1:getModel( f516_arg2, "allocationSpent" )
	if f516_local0 then
		local f516_local1 = Engine.GetModelValue( f516_local0 )
		if f516_local1 >= 0 then
			for f516_local2 = 1, Engine.GetMaxAllocation( f516_arg2 ), 1 do
				local f516_local5 = f516_arg1["AllocationBar" .. f516_local2 - 1]
				if f516_local5 ~= nil then
					if f516_local2 <= f516_local1 then
						f516_local5:playClip( "PointSpent" )
					else
						f516_local5:playClip( "DefaultClip" )
					end
				end
			end
		end
	end
end

function BubblegumPackOptionsRename( f517_arg0, f517_arg1, f517_arg2 )
	local f517_local0 = f517_arg0:getModel( f517_arg2, "bgbPackIndex" )
	if f517_local0 then
		local f517_local1 = Engine.GetModelValue( f517_local0 )
		Engine.Exec( f517_arg2, "ui_keyboard_new " .. Enum.KeyboardType.KEYBOARD_TYPE_BUBBLEGUM_PACK )
	end
end

function BubblegumPackOptionsCopy( f518_arg0, f518_arg1, f518_arg2 )
	local f518_local0 = f518_arg0:getModel( f518_arg2, "bgbPackIndex" )
	local f518_local1 = f518_arg1:getModel( f518_arg2, "bgbPackIndex" )
	if f518_local0 == f518_local1 then
		return 
	elseif f518_local0 and f518_local1 then
		local f518_local2 = Engine.GetModelValue( f518_local0 )
		local f518_local3 = Engine.GetModelValue( f518_local1 )
		if f518_local2 and f518_local3 then
			Engine.ExecNow( f518_arg2, "copybubblegumpack " .. f518_local2 .. " " .. f518_local3 )
			local f518_local4 = f518_arg0.occludedMenu
			GoBack( f518_arg0, f518_arg2 )
			ClearSavedState( f518_arg0, f518_arg2 )
			GoBack( f518_local4, f518_arg2 )
			ClearSavedState( f518_local4, f518_arg2 )
		end
	end
end

function ClassOptionsCopyLoadout( f519_arg0, f519_arg1, f519_arg2 )
	if IsCurrentClassSelectedClass( f519_arg0, f519_arg1 ) == true then
		return 
	end
	local f519_local0 = f519_arg0:getModel( f519_arg2, "classNum" )
	if not f519_local0 then
		f519_local0 = Engine.GetModel( CoD.perController[f519_arg2].classModel, "classNum" )
	end
	local f519_local1 = f519_arg1:getModel( f519_arg2, "classNum" )
	if f519_local0 and f519_local1 then
		local f519_local2 = Engine.GetModelValue( f519_local0 )
		local f519_local3 = Engine.GetModelValue( f519_local1 )
		if f519_local2 and f519_local3 then
			Engine.ExecNow( f519_arg2, "copyClass " .. f519_local2 .. " " .. f519_local3 )
			CoD.CACUtility.UpdateAllClasses( f519_arg2 )
			local f519_local4 = GoBack( f519_arg0, f519_arg2 )
			ClearSavedState( f519_arg0, f519_arg2 )
			GoBack( f519_local4, f519_arg2 )
			ClearSavedState( f519_local4, f519_arg2 )
		end
	end
end

function ClassOptionsCopyClassSet( f520_arg0, f520_arg1, f520_arg2 )
	local f520_local0 = f520_arg1:getModel( f520_arg2, "classSetId" )
	if f520_local0 then
		local f520_local1 = Engine.GetModelValue( f520_local0 )
		local f520_local2 = Engine.GetCurrentClassSetIndex( f520_arg2 )
		if f520_local1 == f520_local2 then
			return 
		end
		Engine.CopyToClassSet( f520_arg2, f520_local2 )
		Engine.CopyFromClassSetToClassSet( f520_arg2, f520_local2, f520_local1 )
		local f520_local3 = GoBack( f520_arg0, f520_arg2 )
		ClearSavedState( f520_arg0, f520_arg2 )
		f520_local3 = GoBack( f520_local3, f520_arg2 )
		ClearSavedState( f520_local3, f520_arg2 )
		f520_local3:dispatchEventToChildren( {
			name = "class_set_name_change",
			controller = f520_arg2
		} )
	end
end

function ClassOptionsResetToDefault( f521_arg0, f521_arg1, f521_arg2 )
	local f521_local0 = f521_arg0:getModel( f521_arg2, "classNum" )
	if not f521_local0 then
		f521_local0 = Engine.GetModel( CoD.perController[f521_arg2].classModel, "classNum" )
	end
	local f521_local1 = f521_arg1:getModel( f521_arg2, "customClassName" )
	local f521_local2 = f521_arg1:getModel( f521_arg2, "index" )
	if f521_local0 and f521_local1 and f521_local2 then
		local f521_local3 = Engine.GetModelValue( f521_local0 )
		local f521_local4 = Engine.GetModelValue( f521_local1 )
		local f521_local5 = Engine.GetModelValue( f521_local2 )
		local f521_local6 = CoD.CACUtility.GetDefaultLoadoutNameFromIndex( f521_local5 )
		if IsArenaMode() then
			f521_local6 = CoD.CACUtility.GetDefaultArenaLoadoutNameFromIndex( f521_local5 )
		end
		Engine.ExecNow( f521_arg2, "uiEquipDefaultClass " .. f521_local3 .. " " .. f521_local6 )
		local f521_local7 = CoD.CACUtility.GetLoadoutNameFromIndex( f521_arg2, f521_local3 )
		f521_local7:set( f521_local4 )
		CoD.CACUtility.UpdateAllClasses( f521_arg2 )
	end
	local f521_local3 = GoBack( f521_arg0, f521_arg2 )
	ClearSavedState( f521_arg0, f521_arg2 )
	local f521_local4 = GoBack( f521_local3, f521_arg2 )
	ClearSavedState( f521_local3, f521_arg2 )
	if f521_local4 then
		f521_local4:processEvent( {
			name = "update_state",
			controller = f521_arg2
		} )
	end
end

function ClassOptionsClearLoadout( f522_arg0, f522_arg1, f522_arg2 )
	local f522_local0 = CoD.perController[f522_arg2].classNum
	local f522_local1 = CoD.perController[f522_arg2].classModel
	for f522_local2 = 1, #CoD.CACUtility.clearLoadoutSlotOrder, 1 do
		local f522_local5 = CoD.CACUtility.clearLoadoutSlotOrder[f522_local2]
		local f522_local6 = Engine.GetModel( f522_local1, f522_local5 )
		if f522_local6 and CoD.CACUtility.EmptyItemIndex < Engine.GetModelValue( Engine.GetModel( f522_local6, "itemIndex" ) ) then
			CoD.SetClassItem( f522_arg2, f522_local0, f522_local5, CoD.CACUtility.EmptyItemIndex )
		end
	end
	CoD.SetClassItem( f522_arg2, f522_local0, "primarypaintjobslot", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
	CoD.SetClassItem( f522_arg2, f522_local0, "primarypaintjobindex", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
	CoD.SetClassItem( f522_arg2, f522_local0, "secondarypaintjobslot", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
	CoD.SetClassItem( f522_arg2, f522_local0, "secondarypaintjobindex", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
	CoD.CACUtility.GetCustomClassModel( f522_arg2, f522_local0, f522_local1 )
	local f522_local2 = f522_arg0.occludedMenu
	if f522_local2 then
		f522_local2:processEvent( {
			name = "update_state",
			controller = f522_arg2
		} )
	end
end

function ClassOptionsSetHintText( f523_arg0, f523_arg1, f523_arg2 )
	if f523_arg1 and f523_arg1:getModel() and f523_arg1:getModel( f523_arg2, "description" ) then
		Engine.SetModelValue( Engine.CreateModel( CoD.perController[f523_arg2].classModel, "customClassOptionsHintText" ), Engine.GetModelValue( f523_arg1:getModel( f523_arg2, "description" ) ) )
	end
end

function OpenBuyExtraSlotsPackDialog( f524_arg0, f524_arg1, f524_arg2 )
	local f524_local0 = f524_arg1:getModel( f524_arg2, "skuID" )
	if f524_local0 then
		local f524_local1 = Engine.GetModelValue( f524_local0 )
		CoD.OverlayUtility.CreateOverlay( f524_arg2, f524_arg0, "PurchaseExtraSlotsConfirmation", f524_arg2, {
			displayText = "MENU_MEDIA_STORAGE_PACK",
			itemCODPointCost = tonumber( CoD.StoreUtility.GetInventoryItemValueBySkuId( f524_local1, CoD.StoreUtility.InventoryItems.costColumn ) ),
			productDesc = CoD.StoreUtility.GetInventoryItemValueBySkuId( f524_local1, CoD.StoreUtility.InventoryItems.productDescColumn ),
			purchaseSource = "Store"
		} )
	end
end

function OpenBuyInventoryItemDialog( f525_arg0, f525_arg1, f525_arg2, f525_arg3 )
	local f525_local0 = f525_arg1:getModel( f525_arg2, "skuId" )
	if not f525_local0 then
		return 
	end
	local f525_local1 = Engine.GetModelValue( f525_local0 )
	if f525_local1 == "99003" then
		CoD.OverlayUtility.CreateOverlay( f525_arg2, f525_arg0, "PurchaseExtraSlotsConfirmation", f525_arg2, {
			displayText = "MENU_MEDIA_STORAGE_PACK",
			itemCODPointCost = tonumber( CoD.StoreUtility.GetInventoryItemValueBySkuId( f525_local1, CoD.StoreUtility.InventoryItems.costColumn ) ),
			productDesc = CoD.StoreUtility.GetInventoryItemValueBySkuId( f525_local1, CoD.StoreUtility.InventoryItems.productDescColumn ),
			purchaseSource = "Store"
		} )
	else
		local f525_local2 = false
		local f525_local3 = CoD.StoreUtility.GetInventoryItemValueBySkuId( f525_local1, CoD.StoreUtility.InventoryItems.costColumn )
		local f525_local4 = CoD.StoreUtility.GetInventoryItemValueBySkuId( f525_local1, CoD.StoreUtility.InventoryItems.nameContextualColumn )
		if f525_local4 == "" then
			f525_local4 = CoD.StoreUtility.GetInventoryItemValueBySkuId( f525_local1, CoD.StoreUtility.InventoryItems.titleColumn )
			f525_local2 = true
		end
		local f525_local5 = CoD.StoreUtility.GetInventoryItemValueBySkuId( f525_local1, CoD.StoreUtility.InventoryItems.productImageColumn )
		if f525_local5 == "t7_store_product_cwl" and CoD.isPS4 then
			f525_local5 = "t7_store_product_cwl_ps4"
		end
		local f525_local6 = {
			skuId = f525_local1,
			displayText = CoD.StoreUtility.GetInventoryItemValueBySkuId( f525_local1, CoD.StoreUtility.InventoryItems.purchaseConfirmationColumn ),
			itemName = f525_local4,
			itemCODPointCost = tonumber( f525_local3 ),
			image = f525_local5,
			category = CoD.StoreUtility.GetInventoryItemValueBySkuId( f525_local1, CoD.StoreUtility.InventoryItems.categoryColumn ),
			productDesc = CoD.StoreUtility.GetInventoryItemValueBySkuId( f525_local1, CoD.StoreUtility.InventoryItems.productDescColumn ),
			purchaseSource = f525_arg3,
			outfitDesc = CoD.StoreUtility.GetInventoryItemValueBySkuId( f525_local1, CoD.StoreUtility.InventoryItems.descColumn )
		}
		if f525_local2 then
			CoD.OverlayUtility.CreateOverlay( f525_arg2, f525_arg0, "PurchaseOutfitItemConfirmation", f525_arg2, f525_local6 )
		else
			CoD.OverlayUtility.CreateOverlay( f525_arg2, f525_arg0, "PurchaseInventoryItemConfirmation", f525_arg2, f525_local6 )
		end
	end
end

function PurchaseItem( f526_arg0, f526_arg1, f526_arg2 )
	local f526_local0 = f526_arg1:getModel()
	if f526_local0 then
		Engine.PurchaseItem( f526_arg2, Engine.GetModelValue( Engine.GetModel( f526_local0, "itemIndex" ) ) )
		Engine.SendClientScriptNotify( f526_arg2, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f526_arg2 ), "purchased" )
	end
end

function SetUnlockConfirmationInfo( f527_arg0, f527_arg1 )
	local f527_local0 = f527_arg0:getModel( f527_arg1, "itemIndex" )
	if f527_local0 then
		SetConfirmationInfoInternal( f527_arg0, f527_arg1, f527_local0 )
	end
end

function SetUpgradeConfirmationInfo( f528_arg0, f528_arg1 )
	local f528_local0 = f528_arg0:getModel( f528_arg1, "upgradeItemIndex" )
	if f528_local0 then
		SetConfirmationInfoInternal( f528_arg0, f528_arg1, f528_local0 )
	end
end

function OpenUnlockClassItemDialog( f529_arg0, f529_arg1, f529_arg2 )
	CoD.OverlayUtility.CreateOverlay( f529_arg2, f529_arg0, "UnlockClassItem", f529_arg2, Engine.GetModelValue( f529_arg1:getModel( f529_arg2, "itemIndex" ) ), nil )
end

function OpenUpgradeClassItemDialog( f530_arg0, f530_arg1, f530_arg2 )
	local f530_local0 = f530_arg1:getModel( f530_arg2, "upgradeItemIndex" )
	if f530_local0 then
		CoD.OverlayUtility.CreateOverlay( f530_arg2, f530_arg0, "UnlockClassItem", f530_arg2, Engine.GetModelValue( f530_arg1:getModel( f530_arg2, "itemIndex" ) ), Engine.GetModelValue( f530_local0 ) )
	end
end

function UnlockItem( f531_arg0, f531_arg1, f531_arg2 )
	local f531_local0 = f531_arg1:getModel( f531_arg2, "itemIndex" )
	local f531_local1 = f531_arg1:getModel( f531_arg2, "upgradeItemIndex" )
	local f531_local2 = nil
	if f531_local1 then
		f531_local2 = Engine.GetModelValue( f531_local1 )
	end
	if f531_local0 then
		local f531_local3 = Engine.GetModelValue( f531_local0 )
		if f531_local2 ~= nil then
			Engine.PurchaseItem( f531_arg2, f531_local2 )
			local f531_local4 = CoD.perController[f531_arg2].weaponCategory
			if f531_local4 then
				CoD.CACUtility.UpgradeEquippedCACItems( f531_arg2, f531_local4, f531_local3, f531_local2 )
			end
		else
			Engine.PurchaseItem( f531_arg2, f531_local3 )
		end
		Engine.SendClientScriptNotify( f531_arg2, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f531_arg2 ), "purchased" )
	end
	SaveLoadout( f531_arg0, f531_arg2 )
	UploadStats( f531_arg0, f531_arg2 )
end

function UnlockAndEquipItem( f532_arg0, f532_arg1, f532_arg2 )
	local f532_local0 = CoD.perController[f532_arg2].weaponCategory
	UnlockItem( f532_arg0, f532_arg1, f532_arg2 )
	local f532_local1 = Engine.GetModelValue( f532_arg1:getModel( f532_arg2, "itemIndex" ) )
	if f532_local0 == "specialist" then
		local f532_local2 = CoD.CCUtility.customizationMode
		local f532_local3 = CoD.CCUtility.Heroes.HeroIndexForEdits
		local f532_local4 = CoD.CCUtility.GetHeroEquippedSlot( f532_arg2, f532_local1 )
		SelectHero( f532_arg0, f532_arg1, f532_arg2 )
		Engine.SetHeroLoadoutItem( f532_arg2, f532_local2, f532_local3, f532_local4 )
	elseif LUI.startswith( f532_local0, "killstreak" ) then
		EquipScorestreak( f532_arg0, f532_arg1, f532_arg2 )
	else
		local f532_local2 = SetClassItem( f532_arg0, f532_arg1, f532_arg2 )
		if LUI.startswith( f532_local0, "bonuscard" ) and not IsCACContextualWildcardOpen( f532_arg2 ) then
			f532_arg1.itemIndex = f532_local1
			FocusClassItem( f532_local2, f532_arg1, f532_arg2 )
		end
		return f532_local2
	end
end

function UnlockAndEquipHeroForMPFirstTimeSetup( f533_arg0, f533_arg1, f533_arg2, f533_arg3, f533_arg4 )
	local f533_local0 = nil
	local f533_local1 = f533_arg1:getModel( f533_arg2, "itemIndex" )
	if f533_local1 then
		f533_local0 = Engine.GetModelValue( f533_local1 )
	end
	if not f533_local0 then
		f533_local0 = f533_arg1.itemIndex
	end
	local f533_local2 = f533_arg4
	if f533_arg3.previousMenu then
		f533_local2 = f533_arg3.previousMenu
	end
	local f533_local3 = CoD.CCUtility.customizationMode
	local f533_local4 = CoD.CCUtility.Heroes.HeroIndexForEdits
	local f533_local5 = CoD.CCUtility.GetHeroEquippedSlot( f533_arg2, f533_local0 )
	if f533_local5 then
		SelectHero( f533_arg0, f533_arg1, f533_arg2 )
		Engine.SetHeroLoadoutItem( f533_arg2, f533_local3, f533_local4, f533_local5 )
		Engine.SetFirstSelectedHeroLoadout( f533_arg2, Enum.CACType.CAC_TYPE_MP_PUBLIC, f533_local4, f533_local5 )
		Engine.SetHeroForCACType( f533_arg2, f533_local3, Enum.CACType.CAC_TYPE_MP_CUSTOM, f533_local4 )
		Engine.SetHeroLoadoutItemForCACType( f533_arg2, f533_local3, Enum.CACType.CAC_TYPE_MP_CUSTOM, f533_local4, f533_local5 )
		Engine.SetFirstSelectedHeroLoadout( f533_arg2, Enum.CACType.CAC_TYPE_MP_CUSTOM, f533_local4, f533_local5 )
		Engine.SetHeroForCACType( f533_arg2, f533_local3, Enum.CACType.CAC_TYPE_MP_ARENA, f533_local4 )
		Engine.SetHeroLoadoutItemForCACType( f533_arg2, f533_local3, Enum.CACType.CAC_TYPE_MP_ARENA, f533_local4, f533_local5 )
		Engine.SetFirstSelectedHeroLoadout( f533_arg2, Enum.CACType.CAC_TYPE_MP_ARENA, f533_local4, f533_local5 )
		SetFirstTimeSetupComplete_MP( f533_arg0, f533_arg1, f533_arg2, "", f533_arg4 )
		SendClientScriptMenuChangeNotify( f533_arg2, f533_local2, false )
		if not IsCACHaveTokens( f533_arg2 ) then
			Engine.ExecNow( f533_arg2, "statWriteMode mp unlocks 1" )
		end
		Engine.PurchaseItem( f533_arg2, f533_local0, f533_local3 )
		SaveLoadout( f533_arg0, f533_arg2 )
	end
end

function TryPurchaseCybercoreAbility( f534_arg0, f534_arg1, f534_arg2 )
	local f534_local0 = f534_arg1:getModel()
	if f534_local0 then
		local f534_local1 = function ( f535_arg0 )
			Engine.SetModelValue( Engine.CreateModel( f534_local0, "itemIndex" ), f535_arg0 )
			SetUnlockConfirmationInfo( f534_arg1, f534_arg2 )
			if not IsCACHaveTokens( f534_arg2 ) then
				OpenPopup( f534_arg0, "OutOfUnlockTokens", f534_arg2 )
			else
				OpenUnlockClassItemDialog( f534_arg0, f534_arg1, f534_arg2 )
			end
		end
		
		local f534_local2 = Engine.GetModelValue( Engine.GetModel( f534_local0, "prereqItemIndex" ) )
		if f534_local2 == -1 or Engine.IsItemPurchased( f534_arg2, f534_local2 ) then
			local f534_local3 = Engine.GetModelValue( Engine.GetModel( f534_local0, "baseItemIndex" ) )
			if not Engine.IsItemPurchased( f534_arg2, f534_local3 ) then
				f534_local1( f534_local3 )
			else
				local f534_local4 = Engine.GetModelValue( Engine.GetModel( f534_local0, "upgradeItemIndex" ) )
				if f534_local4 and not Engine.IsItemPurchased( f534_arg2, f534_local4 ) then
					f534_local1( f534_local4 )
				end
			end
		end
	end
end

function UpdateCybercoreTree( f536_arg0, f536_arg1, f536_arg2 )
	if f536_arg0.upgradeTree then
		f536_arg0.upgradeTree:updateTree( f536_arg2 )
	end
end

function SetCACWeaponAsOld( f537_arg0, f537_arg1, f537_arg2 )
	local f537_local0 = f537_arg1:getModel( f537_arg2, "itemIndex" )
	if CoD.PrestigeUtility.isInPermanentUnlockMenu then
		return 
	elseif f537_local0 then
		local f537_local1 = Engine.GetModelValue( f537_local0 )
		if f537_local1 > CoD.CACUtility.EmptyItemIndex then
			Engine.SetItemAsOld( f537_arg2, f537_local1 )
			if f537_arg0.weaponCategoryList and f537_arg0.weaponCategoryList.Tabs.grid then
				local f537_local2 = f537_arg0.weaponCategoryList.Tabs.grid:getItemAt( f537_arg0.weaponCategoryList.Tabs.grid.savedActiveIndex + 1 )
				if f537_local2 then
					local f537_local3 = f537_local2:getModel( f537_arg2, "breadcrumbCount" )
					if f537_local3 then
						Engine.SetModelValue( f537_local3, Engine.WeaponGroupNewItemCount( f537_arg2, f537_local2.filter ) )
					end
				end
			end
		end
	end
end

function SetCACItemAsOld( f538_arg0, f538_arg1 )
	local f538_local0 = f538_arg0:getModel( f538_arg1, "itemIndex" )
	if CoD.PrestigeUtility.isInPermanentUnlockMenu then
		return 
	elseif f538_local0 then
		local f538_local1 = Engine.GetModelValue( f538_local0 )
		if f538_local1 > CoD.CACUtility.EmptyItemIndex then
			Engine.SetItemAsOld( f538_arg1, f538_local1 )
		end
	end
end

function SetCACAttachmentAsOld( f539_arg0, f539_arg1 )
	local f539_local0 = f539_arg0:getModel( f539_arg1, "itemIndex" )
	if f539_local0 then
		local f539_local1 = Engine.GetModelValue( f539_local0 )
		if f539_local1 > CoD.CACUtility.EmptyItemIndex then
			Engine.SetAttachmentAsOld( f539_arg1, f539_arg0.weaponIndex, f539_local1 )
		end
	end
end

function SetSpecialistAsOld( f540_arg0, f540_arg1, f540_arg2 )
	if CoD.PrestigeUtility.isInPermanentUnlockMenu then
		return 
	elseif IsProgressionEnabled( f540_arg2 ) then
		local f540_local0 = Engine.CurrentSessionMode()
		local f540_local1 = f540_arg1.heroIndex
		if f540_local1 then
			for f540_local2 = 0, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_COUNT - 1, 1 do
				local f540_local5 = Engine.GetLoadoutItemIndexForHero( f540_local0, f540_local1, f540_local2 )
				if CoD.CACUtility.EmptyItemIndex < f540_local5 and Engine.IsItemNew( f540_arg2, f540_local5 ) then
					Engine.SetItemAsOld( f540_arg2, f540_local5 )
					f540_arg0:processEvent( {
						name = "update_state",
						menu = f540_arg0
					} )
				end
			end
		end
	end
end

function SetWeaponOptionAsOld( f541_arg0, f541_arg1, f541_arg2 )
	local f541_local0 = CoD.perController[f541_arg2].classModel
	local f541_local1 = CoD.perController[f541_arg2].weaponCategory
	local f541_local2 = CoD.SafeGetModelValue( f541_local0, f541_local1 .. ".itemIndex" )
	if CoD.SafeGetModelValue( f541_arg1:getModel(), "weaponOptionType" ) == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE then
		f541_local2 = Engine.GetItemAttachment( CoD.SafeGetModelValue( f541_local0, CoD.CACUtility.GetBaseWeaponLoadoutSlotName( f541_local1 ) .. ".itemIndex" ), f541_local2 )
	end
	SetWeaponOptionAsOldInternal( f541_arg0, f541_arg1, f541_arg2, f541_local2 )
end

function SetCACACVAsOld( f542_arg0, f542_arg1 )
	local f542_local0 = CoD.WC_Category.ACV.selectedAttachmentWeaponIndex
	if f542_local0 and f542_arg0.attachmentTableIndex and f542_arg0.variantIndex then
		SetACVASOldInternal( f542_arg1, f542_local0, f542_arg0.attachmentTableIndex, f542_arg0.variantIndex, Engine.CurrentSessionMode() )
	end
end

function DisableProgressionCP( f543_arg0 )
	CoD.perController[f543_arg0].everythingUnlocked = true
	if CoD.perController[f543_arg0].restrictedItemIndices == nil then
		CoD.perController[f543_arg0].restrictedItemIndices = {}
	end
end

function EnableProgressionCP( f544_arg0 )
	CoD.perController[f544_arg0].everythingUnlocked = nil
	if CoD.perController[f544_arg0].restrictedItemIndices ~= nil then
		for f544_local3, f544_local4 in ipairs( CoD.perController[f544_arg0].restrictedItemIndices ) do
			Engine.SetItemRestrictionState( f544_local4, Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_NONE )
		end
		CoD.perController[f544_arg0].restrictedItemIndices = nil
	end
end

function CopyLoadoutFromClassSet( f545_arg0 )
	if IsClassSetsAvailableForCurrentGameMode() then
		Engine.CopyFromClassSet( f545_arg0, Engine.GetCurrentClassSetIndex( f545_arg0 ) )
	end
end

function CopyLoadoutToClassSet( f546_arg0 )
	if IsClassSetsAvailableForCurrentGameMode() then
		Engine.CopyToClassSet( f546_arg0, Engine.GetCurrentClassSetIndex( f546_arg0 ) )
	end
end

function IncrementClassSetAndUpdateElementDataSource( f547_arg0, f547_arg1, f547_arg2, f547_arg3, f547_arg4 )
	local f547_local0 = Engine.GetCurrentClassSetIndex( f547_arg1 )
	local f547_local1 = Engine.GetNumberOfClassSetsOwned( f547_arg1 )
	local f547_local2 = f547_local0 + 1
	if f547_local1 <= f547_local2 then
		f547_local2 = f547_local1 - 1
	end
	if f547_local2 ~= f547_local0 then
		Engine.CopyToClassSet( f547_arg1, f547_local0 )
		Engine.SetCurrentClassSetIndex( f547_arg1, f547_local2 )
		Engine.CopyFromClassSet( f547_arg1, f547_local2 )
		CoD.CACUtility.ForceStreamAttachmentImages( f547_arg1 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f547_arg1 ), "currentClassSetIndex" ), f547_local2 )
		chooseClass_TabMPClassesListRight( f547_arg2, f547_arg1 )
		UpdateElementDataSource( f547_arg0[f547_arg3], f547_arg4 )
	end
end

function DecrementClassSetAndUpdateElementDataSource( f548_arg0, f548_arg1, f548_arg2, f548_arg3, f548_arg4 )
	local f548_local0 = Engine.GetCurrentClassSetIndex( f548_arg1 )
	local f548_local1 = f548_local0 - 1
	if f548_local1 < 0 then
		f548_local1 = 0
	end
	if f548_local1 ~= f548_local0 then
		Engine.CopyToClassSet( f548_arg1, f548_local0 )
		Engine.SetCurrentClassSetIndex( f548_arg1, f548_local1 )
		Engine.CopyFromClassSet( f548_arg1, f548_local1 )
		CoD.CACUtility.ForceStreamAttachmentImages( f548_arg1 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f548_arg1 ), "currentClassSetIndex" ), f548_local1 )
		chooseClass_TabMPClassesListLeft( f548_arg2, f548_arg1 )
		UpdateElementDataSource( f548_arg0[f548_arg3], f548_arg4 )
	end
end

function SetChooseClassMenuToExtraSlotPromptState( f549_arg0, f549_arg1, f549_arg2, f549_arg3, f549_arg4 )
	local f549_local0 = Engine.GetModel( Engine.GetModelForController( f549_arg1 ), "currentClassSetIndex" )
	if not f549_local0 then
		return 
	end
	DisableNavigation( f549_arg0[f549_arg3], f549_arg4 )
	local f549_local1 = Engine.GetModelValue( f549_local0 )
	local f549_local2 = Engine.GetNumberOfClassSetsOwned( f549_arg1 )
	local f549_local3 = f549_local1 + 1
	if f549_local3 == f549_local2 then
		Engine.SetModelValue( f549_local0, f549_local3 )
		chooseClass_TabMPClassesListRight( f549_arg2, f549_arg1 )
		f549_arg2:setState( "ExtraSlots" )
	end
end

function SetChooseClassMenuFromExtraSlotPromptState( f550_arg0, f550_arg1, f550_arg2, f550_arg3, f550_arg4 )
	local f550_local0 = Engine.GetModel( Engine.GetModelForController( f550_arg1 ), "currentClassSetIndex" )
	if not f550_local0 then
		return 
	end
	EnableNavigation( f550_arg0[f550_arg3], f550_arg4 )
	local f550_local1 = Engine.GetModelValue( f550_local0 ) - 1
	if f550_local1 == 0 then
		Engine.SetModelValue( f550_local0, f550_local1 )
		chooseClass_TabMPClassesListLeft( f550_arg2, f550_arg1 )
		f550_arg2:setState( "DefaultState" )
	end
end

function OpenPurchaseExtraSlotsOverlay( f551_arg0, f551_arg1, f551_arg2 )
	OpenSystemOverlay( f551_arg0, f551_arg2, f551_arg1, "PurchaseExtraSlotsConfirmation", {
		itemCODPointCost = tonumber( CoD.StoreUtility.GetInventoryItemValueByItemName( CoD.StoreUtility.ExtraSlotsProductDesc, CoD.StoreUtility.InventoryItems.costColumn ) ),
		displayText = "MENU_MEDIA_STORAGE_PACK",
		productDesc = CoD.StoreUtility.ExtraSlotsProductDesc,
		purchaseSource = "CAC"
	} )
end

function OpenGobbleGumRecipe( f552_arg0, f552_arg1, f552_arg2 )
	local f552_local0 = CoD.BubbleGumBuffUtility.GetGobbleGumRecipeInfoModel( f552_arg2 )
	if f552_arg1 then
		local f552_local1 = f552_arg1.recipeIndex
		local f552_local2 = f552_arg1.haveAllIngredients
		Engine.SetModelValue( Engine.CreateModel( f552_local0, "recipeIndex" ), f552_local1 )
		OpenOverlay( f552_arg0, "GobbleGumRecipe", f552_arg2 )
	end
end

function CookGobbleGumRecipe( f553_arg0, f553_arg1 )
	CoD.BubbleGumBuffUtility.CookGobbleGumRecipe( f553_arg0, f553_arg1 )
end

function SetHintText( f554_arg0, f554_arg1, f554_arg2 )
	local f554_local0 = nil
	if f554_arg1 then
		if f554_arg1.hintText then
			f554_local0 = f554_arg1.hintText
		else
			local f554_local1 = f554_arg1:getModel()
			if f554_local1 then
				local f554_local2 = Engine.GetModel( f554_local1, "hintText" )
				if f554_local2 then
					f554_local0 = Engine.GetModelValue( f554_local2 )
				end
			end
		end
	end
	if f554_local0 == nil then
		DataSources.PerController.clearHintText( f554_arg2 )
	else
		DataSources.PerController.setHintText( f554_arg2, f554_local0 )
	end
end

function SetHintTextToString( f555_arg0, f555_arg1 )
	if f555_arg1 == nil or f555_arg1 == "" then
		DataSources.PerController.clearHintText( f555_arg0 )
	else
		DataSources.PerController.setHintText( f555_arg0, f555_arg1 )
	end
end

function PDV_DataVaultOpened( f556_arg0, f556_arg1 )
	Engine.SendMenuResponse( f556_arg1, "PersonalDataVaultMenu", "mainCam" )
	PrepareOpenMenuInSafehouse( f556_arg1 )
	CoD.perController[f556_arg1].InspectingDataVault = true
end

function PDV_DataVaultClosed( f557_arg0, f557_arg1 )
	Engine.SendMenuResponse( f557_arg1, "PersonalDataVaultMenu", "closed" )
	PrepareCloseMenuInSafehouse( f557_arg1 )
	CoD.perController[f557_arg1].InspectingDataVault = false
	f557_arg0:addElement( LUI.UITimer.newElementTimer( 0, true, function ()
		Close( f557_arg0, f557_arg1 )
	end ) )
end

function PDV_ChangeCollectibleArea( f559_arg0, f559_arg1, f559_arg2 )
	Engine.SendClientScriptNotify( f559_arg2, "collectibles_slot_change" .. CoD.GetLocalClientAdjustedNum( f559_arg2 ), f559_arg1.collectibleSize )
	CoD.perController[f559_arg2].inspectingCollectibleSize = f559_arg1.collectibleSize
end

function PDV_ClearCollectible( f560_arg0, f560_arg1, f560_arg2 )
	local f560_local0 = f560_arg1:getModel( f560_arg2, "collectibleSlot" )
	if f560_local0 then
		local f560_local1 = Engine.GetModelValue( f560_local0 )
		Engine.ClearBunkCollectible( f560_arg2, f560_local1 )
		Engine.SendClientScriptNotify( f560_arg2, "collectible_update" .. CoD.GetLocalClientAdjustedNum( f560_arg2 ), "unequip", f560_local1 )
	end
end

function PDV_ClearPreviewCollectible( f561_arg0, f561_arg1, f561_arg2 )
	local f561_local0 = f561_arg1:getModel( f561_arg2, "collectibleSlot" )
	if f561_local0 then
		Engine.SendClientScriptNotify( f561_arg2, "collectible_update" .. CoD.GetLocalClientAdjustedNum( f561_arg2 ), "clear_preview_collectible", Engine.GetModelValue( f561_local0 ) )
	end
end

function PDV_ChangeFocusCollectibleSlot( f562_arg0, f562_arg1, f562_arg2 )
	local f562_local0 = f562_arg1:getModel( f562_arg2, "collectibleSlot" )
	if f562_local0 then
		local f562_local1 = Engine.GetModelValue( f562_local0 )
		for f562_local6, f562_local7 in ipairs( Engine.GetAssetList( CoD.mapsTable[CoD.perController[f562_arg2].placeCollectibleMapName].collectibles ) ) do
			if f562_local7.name == CoD.perController[f562_arg2].placeCollectibleName then
				local f562_local5 = f562_local7.uiModel
				if f562_local7.uiModelWithStand ~= nil then
					f562_local5 = f562_local7.uiModelWithStand
				end
				Engine.SendClientScriptNotify( f562_arg2, "collectible_update" .. CoD.GetLocalClientAdjustedNum( f562_arg2 ), "focus_change", f562_local1, f562_local5 )
			end
		end
	end
end

function PDV_SelectCollectibleSlot( f563_arg0, f563_arg1, f563_arg2 )
	local f563_local0 = f563_arg1:getModel( f563_arg2, "collectibleSlot" )
	if f563_local0 then
		local f563_local1 = Engine.GetModelValue( f563_local0 )
		local f563_local2 = Engine.SetBunkCollectible( f563_arg2, f563_local1, CoD.perController[f563_arg2].placeCollectibleMapName, CoD.perController[f563_arg2].placeCollectibleName )
		if f563_local2 ~= Enum.bunkCollectibleSlots_e.BUNK_INVALID_SLOT then
			Engine.SendClientScriptNotify( f563_arg2, "collectible_update" .. CoD.GetLocalClientAdjustedNum( f563_arg2 ), "unequip", f563_local2 )
		end
		for f563_local7, f563_local8 in ipairs( Engine.GetAssetList( CoD.mapsTable[CoD.perController[f563_arg2].placeCollectibleMapName].collectibles ) ) do
			if f563_local8.name == CoD.perController[f563_arg2].placeCollectibleName then
				local f563_local6 = f563_local8.uiModel
				if f563_local8.uiModelWithStand ~= nil then
					f563_local6 = f563_local8.uiModelWithStand
				end
				Engine.SendClientScriptNotify( f563_arg2, "collectible_update" .. CoD.GetLocalClientAdjustedNum( f563_arg2 ), "equip", f563_local1, f563_local6 )
			end
		end
	end
end

function MRV_SelectReplayMission( f564_arg0, f564_arg1, f564_arg2 )
	local f564_local0 = Engine.GetModel( f564_arg0:getModel(), "selectedMission" )
	if f564_arg1 == nil or f564_arg1.mapId == nil or CoD.mapsTable[f564_arg1.mapId] == nil then
		return 
	end
	local f564_local1 = CoD.mapsTable[f564_arg1.mapId]
	Engine.SetModelValue( Engine.GetModel( f564_local0, "mapName" ), f564_local1.mapName )
	Engine.SetModelValue( Engine.GetModel( f564_local0, "mapNameCaps" ), f564_local1.mapNameCaps )
	Engine.SetModelValue( Engine.GetModel( f564_local0, "previewImage" ), f564_local1.previewImage )
	Engine.SetModelValue( Engine.GetModel( f564_local0, "mapLocation" ), f564_local1.mapLocation )
	Engine.SetModelValue( Engine.GetModel( f564_local0, "mapDescription" ), f564_local1.mapDescription )
	local f564_local2 = 0
	local f564_local3 = 0
	if f564_local1.collectibles then
		local f564_local4 = Engine.GetAssetList( f564_local1.collectibles )
		if f564_local4 ~= nil then
			f564_local2 = #f564_local4
			for f564_local5 = 0, f564_local2 - 1, 1 do
				if Engine.ClientHasCollectible( f564_arg2, f564_arg1.mapId, f564_local5 ) then
					f564_local3 = f564_local3 + 1
				end
			end
		end
	end
	local f564_local4 = Engine.GetPlayerStats( f564_arg2 )
	local f564_local5 = f564_local4.PlayerStatsByMap[f564_local1.rootMapName].highestStats
	Engine.SetModelValue( Engine.GetModel( f564_local0, "collectiblesFound" ), f564_local3 )
	Engine.SetModelValue( Engine.GetModel( f564_local0, "collectiblesTotal" ), f564_local2 )
	Engine.SetModelValue( Engine.GetModel( f564_local0, "highestScore" ), f564_local5.SCORE:get() )
	Engine.SetModelValue( Engine.GetModel( f564_local0, "completionDifficulty" ), f564_local5.HIGHEST_DIFFICULTY:get() )
end

function MRV_ClickReplayMission( f565_arg0, f565_arg1, f565_arg2, f565_arg3 )
	if f565_arg2 == nil or f565_arg2.mapId == nil or CoD.mapsTable[f565_arg2.mapId] == nil then
		return 
	elseif IsElementPropertyValue( f565_arg2, "classified", true ) then
		f565_arg1:OpenModalDialog( f565_arg0, f565_arg3, "MENU_OUTOFORDER_PLAY", "", {
			"MPUI_YES",
			"MPUI_NO"
		}, function ( f566_arg0 )
			if f566_arg0 == 0 then
				local f566_local0 = Engine.GetPlayerStats( f565_arg3, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_CAMPAIGN )
				f566_local0.allMapsUnlocked:set( 1 )
				f565_arg0.MapList:updateDataSource()
			end
			return true
		end )
	else
		local f565_local0 = Engine.GetModel( Engine.GetGlobalModel(), "nextMap" )
		if f565_local0 ~= nil then
			Engine.SetModelValue( f565_local0, f565_arg2.mapId )
			SendMenuResponseExpression( f565_arg3, "MissionRecordVaultMenu", f565_arg2.mapId )
			Engine.SetDvar( "ui_blocksaves", "1" )
			LockInput( f565_arg0, f565_arg3, false )
			SendMenuResponse( f565_arg0, "MissionRecordVaultMenu", "closed", f565_arg3 )
		end
	end
end

function MRV_SelectAccolade( f567_arg0, f567_arg1, f567_arg2 )
	local f567_local0 = f567_arg1:getModel()
	if f567_arg1 == nil or f567_local0 == nil then
		return 
	end
	local f567_local1 = Engine.GetModel( f567_arg0:getModel(), "selectedAccolade" )
	local f567_local2 = {
		"challengeName",
		"challengeDetails",
		"challengeProgressQuantity",
		"rewardImage",
		"rewardName",
		"completed",
		"centerText",
		"challengeWidget"
	}
	for f567_local3 = 1, #f567_local2, 1 do
		local f567_local6 = Engine.GetModel( f567_local0, f567_local2[f567_local3] )
		if f567_local6 then
			f567_local6 = Engine.GetModelValue( f567_local6 )
		end
		if f567_local6 == nil then
			Engine.SetModelValue( Engine.GetModel( f567_local1, f567_local2[f567_local3] ), "" )
		else
			Engine.SetModelValue( Engine.GetModel( f567_local1, f567_local2[f567_local3] ), f567_local6 )
		end
	end
end

function ClearSavedHeroForEdits( f568_arg0 )
	CoD.CCUtility.SetEdittingHero( f568_arg0, nil )
end

function RefreshCharacterCustomization( f569_arg0, f569_arg1, f569_arg2 )
	Engine.SendClientScriptNotify( f569_arg2, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f569_arg2 ), "refresh", Engine.GetLocalClientNum( f569_arg2 ), CoD.CCUtility.customizationMode )
end

function SelectGender( f570_arg0, f570_arg1, f570_arg2 )
	if f570_arg1.gender then
		Engine.SetGender( f570_arg2, f570_arg1.gender )
		RefreshCharacterCustomization( f570_arg0, f570_arg1, f570_arg2 )
	end
end

function SelectHead( f571_arg0, f571_arg1, f571_arg2 )
	if f571_arg1.headIndex then
		Engine.SetHead( f571_arg2, CoD.CCUtility.customizationMode, f571_arg1.headIndex )
		RefreshCharacterCustomization( f571_arg0, f571_arg1, f571_arg2 )
	end
end

function HeadHighlighted( f572_arg0, f572_arg1, f572_arg2 )
	Engine.SendClientScriptNotify( f572_arg2, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f572_arg2 ), "changeHead", f572_arg1.headIndex, CoD.CCUtility.customizationMode )
end

function UpdateDifficulty( f573_arg0, f573_arg1, f573_arg2 )
	local f573_local0 = Engine.GetProfileVarInt( f573_arg2, "g_gameskill" ) or 0
	if f573_arg1 == LobbyData.UITargets.UI_CPLOBBYONLINE.name then
		f573_local0 = GetCPDifficulty( f573_arg2, "g_gameskill_online_cp" ) or f573_local0
	elseif f573_arg1 == LobbyData.UITargets.UI_CPLOBBYLANGAME.name then
		f573_local0 = GetCPDifficulty( f573_arg2, "g_gameskill_offline_cp" ) or f573_local0
	elseif f573_arg1 == LobbyData.UITargets.UI_CP2LOBBYONLINE.name then
		f573_local0 = GetCPDifficulty( f573_arg2, "g_gameskill_online_cpzm" ) or f573_local0
	elseif f573_arg1 == LobbyData.UITargets.UI_CP2LOBBYLANGAME.name then
		f573_local0 = GetCPDifficulty( f573_arg2, "g_gameskill_offline_cpzm" ) or f573_local0
	else
		return 
	end
	Engine.SetProfileVar( f573_arg2, "g_gameskill", f573_local0 )
	Engine.Exec( f573_arg2, "updategamerprofile" )
end

function SetDifficulty( f574_arg0, f574_arg1, f574_arg2 )
	if f574_arg1.difficulty then
		for f574_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
			Engine.SetProfileVar( f574_local0, "g_gameskill", f574_arg1.difficulty )
			if Engine.IsCampaignModeZombies() and not IsLive() then
				SetCPDifficulty( f574_local0, "g_gameskill_offline_cpzm", f574_arg1.difficulty )
			elseif Engine.IsCampaignModeZombies() then
				SetCPDifficulty( f574_local0, "g_gameskill_online_cpzm", f574_arg1.difficulty )
			elseif not IsLive() then
				SetCPDifficulty( f574_local0, "g_gameskill_offline_cp", f574_arg1.difficulty )
			else
				SetCPDifficulty( f574_local0, "g_gameskill_online_cp", f574_arg1.difficulty )
			end
			Engine.Exec( f574_local0, "updategamerprofile" )
			local f574_local3 = Engine.CreateModel( Engine.GetGlobalModel(), "CampaignSettings" )
			Engine.SetModelValue( Engine.CreateModel( f574_local3, "difficulty" ), Engine.Localize( CoD.DIFFICULTY[Engine.GetProfileVarInt( f574_local0, "g_gameskill" )] ) )
			Engine.SetModelValue( Engine.CreateModel( f574_local3, "difficultyIcon" ), CoD.DIFFICULTY_ICON[Engine.GetProfileVarInt( f574_local0, "g_gameskill" )] )
			Engine.SendMenuResponse( f574_local0, "difficulty", f574_arg1.difficulty )
		end
	end
end

function SetSelectedCPMission( f575_arg0, f575_arg1, f575_arg2 )
	if f575_arg1.mapId ~= nil then
		local f575_local0 = f575_arg1.mapId
		if Engine.IsCampaignModeZombies() == true then
			SetMap( f575_arg2, string.gsub( f575_arg1.mapId, "_nightmares", "" ), false )
		else
			SetMap( f575_arg2, f575_local0, true )
		end
	end
end

function SetFirstTimeSetupComplete( f576_arg0, f576_arg1, f576_arg2 )
	Engine.SetFirstTimeComplete( f576_arg2, Enum.eModes.MODE_CAMPAIGN, true )
end

function GetPlaylistIDForSelectedCPMission( f577_arg0, f577_arg1, f577_arg2 )
	if f577_arg1.mapId ~= nil then
		local f577_local0 = f577_arg1.mapId
		local f577_local1 = CoD.mapsTable[f577_local0]
		for f577_local11, f577_local12 in ipairs( Engine.GetPlaylistCategories() ) do
			if not (not Engine.IsCampaignModeZombies() or f577_local12.ref ~= "cp_nightmares_public") or not Engine.IsCampaignModeZombies() and f577_local12.ref == "cp_public" then
				local f577_local5 = f577_local12.playlists
				if f577_local5 then
					for f577_local9, f577_local10 in ipairs( f577_local5 ) do
						if string.find( f577_local10.name, f577_local0 ) ~= nil then
							return f577_local10.index
						end
					end
				end
			end
		end
	end
	local f577_local0 = 0
	if Engine.CurrentSessionMode() == Enum.eModes.MODE_CAMPAIGN then
		if Engine.IsCampaignModeZombies() then
			f577_local0 = 220
		else
			f577_local0 = 200
		end
	end
	return f577_local0
end

function SelectHero( f578_arg0, f578_arg1, f578_arg2 )
	local f578_local0 = nil
	if CoD.CCUtility.Heroes.HeroIndexForEdits then
		local f578_local1 = Engine.GetHeroSelectSoundAlias( CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits )
		if f578_local1 ~= "" then
			f578_local0 = f578_local1
		end
		Engine.SetHero( f578_arg2, CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits )
		local f578_local2 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
		if Engine.InLobbyParty( Enum.LobbyType.LOBBY_TYPE_GAME ) == true then
			f578_local2 = Enum.LobbyType.LOBBY_TYPE_GAME
		end
		if Engine.SendClientHeartbeat then
			Engine.SendClientHeartbeat( f578_arg2, f578_local2 )
		end
	end
	f578_arg1:dispatchEventToChildren( {
		name = "gamepad_button",
		down = true,
		button = "primary",
		isRepeated = false,
		controller = f578_arg2
	} )
	Engine.SendClientScriptNotify( f578_arg2, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f578_arg2 ), "refresh", Engine.GetLocalClientNum( f578_arg2 ), CoD.CCUtility.customizationMode, f578_local0 )
	ClearSavedHeroForEdits( f578_arg2 )
end

function NavigateToNextHeroCard( f579_arg0, f579_arg1, f579_arg2, f579_arg3 )
	if FirstTimeSetup_Overview( f579_arg3 ) then
		FirstTimeSetup_SetChangedCharacter( f579_arg3 )
		if SelectNextItemIfPossibleAndNotDisabled( f579_arg1, f579_arg2, f579_arg3 ) and not IsSelfInState( f579_arg2, "DefaultState" ) and not IsSelfInState( f579_arg2, "Locked" ) then
			SetHeroCardStateToDefault( f579_arg0, f579_arg1, f579_arg2, f579_arg3 )
		end
	elseif FirstTimeSetup_ChangedCharacter( f579_arg3 ) then
		if SelectNextItemIfPossibleAndNotDisabled( f579_arg1, f579_arg2, f579_arg3 ) and not IsSelfInState( f579_arg2, "DefaultState" ) and not IsSelfInState( f579_arg2, "Locked" ) then
			SetHeroCardStateToDefault( f579_arg0, f579_arg1, f579_arg2, f579_arg3 )
		end
	elseif SelectNextItemIfPossible( f579_arg1, f579_arg2, f579_arg3 ) and not IsSelfInState( f579_arg2, "DefaultState" ) and not IsSelfInState( f579_arg2, "Locked" ) then
		SetHeroCardStateToDefault( f579_arg0, f579_arg1, f579_arg2, f579_arg3 )
	end
end

function NavigateToPreviousHeroCard( f580_arg0, f580_arg1, f580_arg2, f580_arg3 )
	if FirstTimeSetup_Overview( f580_arg3 ) then
		FirstTimeSetup_SetChangedCharacter( f580_arg3 )
		if SelectPreviousItemIfPossibleAndNotDisabled( f580_arg1, f580_arg2, f580_arg3 ) and f580_arg2.currentState == "Flipped" then
			SetHeroCardStateToDefault( f580_arg0, f580_arg1, f580_arg2, f580_arg3 )
		end
	elseif FirstTimeSetup_ChangedCharacter( f580_arg3 ) then
		if SelectPreviousItemIfPossibleAndNotDisabled( f580_arg1, f580_arg2, f580_arg3 ) and f580_arg2.currentState == "Flipped" then
			SetHeroCardStateToDefault( f580_arg0, f580_arg1, f580_arg2, f580_arg3 )
		end
	elseif SelectPreviousItemIfPossible( f580_arg1, f580_arg2, f580_arg3 ) and f580_arg2.currentState == "Flipped" then
		SetHeroCardStateToDefault( f580_arg0, f580_arg1, f580_arg2, f580_arg3 )
	end
end

function MarkSpecialistTransmissionOld( f581_arg0, f581_arg1, f581_arg2 )
	if CoD.SafeGetModelValue( f581_arg1:getModel(), "isNew" ) == true then
		local f581_local0 = CoD.SafeGetModelValue( DataSources.StorageGlobal.getModel( f581_arg2 ), "stats_mp" )
		if f581_local0 then
			local f581_local1 = LUI.getTableFromPath( CoD.CCUtility.GetTransmissionNewStatPath( f581_arg1.heroIndex, f581_arg1.transmissionIndex ), Engine.StorageGetBuffer( f581_arg2, f581_local0 ) )
			if f581_local1 then
				f581_local1:set( 1 )
				local f581_local2 = f581_arg1:getModel( f581_arg2, "isNew" )
				if f581_local2 then
					Engine.SetModelValue( f581_local2, false )
				end
				local f581_local3 = f581_arg0:getModel( f581_arg2, "newTransmissions" )
				if f581_local3 then
					Engine.SetModelValue( f581_local3, math.max( 0, Engine.GetModelValue( f581_local3 ) - 1 ) )
				end
			end
		end
	end
end

function PlaySpecialistTransmission( f582_arg0, f582_arg1 )
	StopSpecialistTransmission( f582_arg0, f582_arg1 )
	local f582_local0 = f582_arg0:getModel( f582_arg1, "playingSound" )
	local f582_local1 = CoD.SafeGetModelValue( f582_arg0:getModel(), "alias" )
	if f582_local0 and not Engine.GetModelValue( f582_local0 ) and f582_local1 and f582_local1 ~= "" then
		Engine.SetModelValue( f582_local0, true )
		f582_arg0.soundTimer = LUI.UITimer.newElementTimer( Engine.GetSoundPlaybackTime( f582_local1 ) or 5000, true, function ()
			Engine.SetModelValue( f582_local0, false )
			f582_arg0.soundTimer = nil
		end )
		f582_arg0:addElement( f582_arg0.soundTimer )
		Engine.PlaySound( f582_local1 )
	end
end

function StopSpecialistTransmission( f584_arg0, f584_arg1 )
	local f584_local0 = f584_arg0:getModel( f584_arg1, "playingSound" )
	if f584_local0 and Engine.GetModelValue( f584_local0 ) then
		if f584_arg0.soundTimer then
			f584_arg0.soundTimer:close()
			f584_arg0.soundTimer = nil
		end
		StopSoundFromElementModel( f584_arg1, f584_arg0, "alias" )
		Engine.SetModelValue( f584_local0, false )
	end
end

function SetEdittingHeroFromStats( f585_arg0 )
	CoD.CCUtility.SetEdittingHero( f585_arg0, Engine.GetEquippedHero( f585_arg0, CoD.CCUtility.customizationMode ) )
end

function UpdateEditingHero( f586_arg0, f586_arg1 )
	if f586_arg0.heroIndex then
		CoD.CCUtility.SetEdittingHero( f586_arg1, f586_arg0.heroIndex )
		Engine.SendClientScriptNotify( f586_arg1, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f586_arg1 ), "changeHero", CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.customizationMode )
		NotifyScriptCharacterLoadoutChange( f586_arg1, Engine.GetLoadoutTypeForHero( f586_arg1, f586_arg0.heroIndex ) )
	end
end

function HeroLoadoutPreviewChange( f587_arg0, f587_arg1 )
	if not f587_arg0.disabled then
		NotifyScriptCharacterLoadoutChange( f587_arg1, f587_arg0.equippedSlot )
	end
end

function HeroLoadoutChanged( f588_arg0, f588_arg1, f588_arg2 )
	if not f588_arg1.disabled then
		Engine.SetHeroLoadoutItem( f588_arg2, CoD.CCUtility.customizationMode, f588_arg1.heroIndex, f588_arg1.equippedSlot )
		SaveLoadout( f588_arg0, f588_arg2 )
	end
end

function BeginEdittingHeroOption( f589_arg0, f589_arg1, f589_arg2 )
	if f589_arg0.updateMode then
		local f589_local0 = f589_arg1:getModel( f589_arg2, "colorListDatasource" )
		local f589_local1 = ""
		if f589_local0 then
			f589_local1 = Engine.GetModelValue( f589_local0 )
		end
		f589_arg0.updateMode( CoD.CCUtility.PersonalizeHeroData.Modes.EdittingOption, nil, f589_arg1, f589_local1 ~= "" )
	end
end

function BeginChoosingGestureOption( f590_arg0, f590_arg1 )
	if f590_arg0.updateMode then
		f590_arg0.updateMode( CoD.CCUtility.TauntsData.Modes.EdittingGesture, nil, f590_arg1.gestureType )
	end
end

function CancelChoosingGestureOption( f591_arg0 )
	if f591_arg0.updateMode then
		f591_arg0.updateMode( CoD.CCUtility.TauntsData.Modes.ExploringTaunts, false )
	end
end

function GestureItemSelected( f592_arg0, f592_arg1, f592_arg2 )
	Engine.SelectGesture( f592_arg2, CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.TauntsData.EdittingTauntOrGestureType, f592_arg1.index )
	if f592_arg0.updateMode then
		f592_arg0.updateMode( CoD.CCUtility.TauntsData.Modes.ExploringTaunts, true )
	end
end

function PreviewGesture( f593_arg0, f593_arg1 )
	PreviewGesture_Internal( f593_arg0, f593_arg1.xanim )
end

function BeginChoosingTauntOption( f594_arg0, f594_arg1 )
	if f594_arg0.updateMode then
		f594_arg0.updateMode( CoD.CCUtility.TauntsData.Modes.EdittingTaunt, nil, f594_arg1.tauntType )
	end
end

function CancelChoosingTauntOption( f595_arg0 )
	if f595_arg0.updateMode then
		f595_arg0.updateMode( CoD.CCUtility.TauntsData.Modes.ExploringTaunts, false )
	end
end

function TauntItemSelected( f596_arg0, f596_arg1, f596_arg2 )
	Engine.SelectTaunt( f596_arg2, CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.TauntsData.EdittingTauntOrGestureType, f596_arg1.index )
	if f596_arg0.updateMode then
		f596_arg0.updateMode( CoD.CCUtility.TauntsData.Modes.ExploringTaunts, true )
	end
end

function PreviewTaunt( f597_arg0, f597_arg1 )
	PreviewTaunt_Internal( f597_arg0, f597_arg1.xanim )
end

function HeroOptionHighlighted( f598_arg0, f598_arg1, f598_arg2 )
	if CoD.CCUtility.PersonalizeHeroData.EdittingElement then
		if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
			local f598_local0 = nil
			if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				f598_local0 = "changeBodyAccentColor"
			elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				f598_local0 = "changeHelmetAccentColor"
			end
			if f598_local0 then
				Engine.SendClientScriptNotify( f598_arg2, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f598_arg2 ), f598_local0, CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex - 1, f598_arg1.optionIndex - 1, CoD.CCUtility.customizationMode )
			end
		else
			local f598_local0 = nil
			local f598_local1 = not IsSelfModelValueTrue( f598_arg1, f598_arg2, "isLocked" )
			if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				f598_local0 = "changeBody"
			elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				f598_local0 = "changeHelmet"
			end
			if f598_local0 then
				Engine.SendClientScriptNotify( f598_arg2, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f598_arg2 ), f598_local0, f598_arg1.optionIndex - 1, CoD.CCUtility.customizationMode, f598_local1 )
			end
		end
	end
end

function HeroOptionSelected( f599_arg0, f599_arg1, f599_arg2 )
	if f599_arg0.updateMode then
		local f599_local0 = nil
		if CoD.CCUtility.PersonalizeHeroData.EdittingElement then
			CoD.CopyModelValue( f599_arg2, f599_arg1, "name", CoD.CCUtility.PersonalizeHeroData.EdittingElement, "currentSelectionName" )
			CoD.CopyModelValue( f599_arg2, f599_arg1, "image", CoD.CCUtility.PersonalizeHeroData.EdittingElement, "image" )
			CoD.CopyModelValue( f599_arg2, f599_arg1, "color", CoD.CCUtility.PersonalizeHeroData.EdittingElement, "color" )
			if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
				local f599_local1, f599_local2 = nil
				if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
					f599_local1 = CoD.CCUtility.Heroes.selectionTable.selectedBody
					f599_local2 = CoD.CCUtility.Heroes.selectionTable.bodyColors
				elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
					f599_local1 = CoD.CCUtility.Heroes.selectionTable.selectedHelmet
					f599_local2 = CoD.CCUtility.Heroes.selectionTable.helmetColors
				end
				if f599_local2 and f599_local2[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex] ~= f599_arg1.optionIndex - 1 then
					Engine.SetHeroItem( f599_arg2, CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.PersonalizeHeroData.EdittingArea, f599_local1, CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex - 1, f599_arg1.optionIndex - 1 )
					Engine.InvalidateCharacterItemRender( CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.PersonalizeHeroData.EdittingArea, f599_local1 )
					Engine.InvalidateCharacterItemRender( CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.PersonalizeHeroData.EdittingArea, f599_local1 )
					if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
						Engine.InvalidateCharacterItemRender( CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET )
					end
				end
			else
				local f599_local1 = nil
				if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
					f599_local1 = CoD.CCUtility.Heroes.selectionTable.selectedBody
				elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
					f599_local1 = CoD.CCUtility.Heroes.selectionTable.selectedHelmet
				end
				if f599_local1 ~= f599_arg1.optionIndex - 1 then
					f599_local0 = CoD.CCUtility.PersonalizeHeroData.EdittingArea
					Engine.SetHeroItem( f599_arg2, CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.PersonalizeHeroData.EdittingArea, f599_arg1.optionIndex - 1 )
					if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
						Engine.InvalidateCharacterItemRender( CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET )
					end
				end
			end
		end
		f599_arg0.updateMode( CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions, {
			customizationArea = CoD.CCUtility.PersonalizeHeroData.EdittingArea,
			colorRow = false
		} )
	end
end

function HeroBlackjackActivateContract( f600_arg0, f600_arg1, f600_arg2 )
	local f600_local0 = Engine.StorageGetBuffer( f600_arg2, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if f600_local0 and f600_local0.TenthSpecialistContract and Engine.ConsumableGet( f600_arg2, "blackjack", "awarded" ) <= Engine.ConsumableGet( f600_arg2, "blackjack", "consumed" ) then
		f600_local0.blackjack_contract_count:set( math.max( 0, f600_local0.blackjack_contract_count:get() - 1 ) )
		f600_local0.TenthSpecialistContract.active:set( 1 )
		f600_local0.TenthSpecialistContract.special_card_earned:set( 0 )
		Engine.ConsumableIncrement( f600_arg2, "blackjack", "awarded", Dvar.tu11_blackjack_contract_time:get() or 3600 )
		Engine.PlaySound( "mpl_bm_specialist_coin_place" )
		local f600_local1 = f600_arg0:getModel( f600_arg2, "contractsRemaining" )
		if f600_local1 then
			Engine.SetModelValue( f600_local1, f600_local0.blackjack_contract_count:get() )
		end
		local f600_local2 = Engine.ConsumableGet( f600_arg2, "blackjack", "awarded" ) - Engine.ConsumableGet( f600_arg2, "blackjack", "consumed" )
		local f600_local3 = f600_arg0:getModel( f600_arg2, "isActivated" )
		if f600_local3 then
			Engine.SetModelValue( f600_local3, f600_local2 > 0 )
		end
		local f600_local4 = f600_arg0:getModel( f600_arg2, "activeTimeRemaining" )
		if f600_local4 then
			Engine.SetModelValue( f600_local4, f600_local2 * 1000 )
		end
	end
	UploadStats( f600_arg0, f600_arg2 )
end

function HeroBlackjackOptionSelected( f601_arg0, f601_arg1 )
	local f601_local0 = CoD.CCUtility.GetBlackjackHeroIndex()
	local f601_local1 = Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET
	local f601_local2 = CoD.SafeGetModelValue( f601_arg0:getModel(), "equippedSlot" )
	if f601_local0 and f601_local2 then
		Engine.SetHeroItem( f601_arg1, CoD.CCUtility.customizationMode, f601_local0, f601_local1, f601_local2 )
	end
	local f601_local3 = "blackjack_coin"
	if f601_local2 == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET then
		f601_local3 = "blackjack_cards"
	end
	local f601_local4 = Engine.GetItemIndexFromReference( f601_local3, CoD.CCUtility.customizationMode )
	if f601_local4 ~= -1 then
		CoD.CCUtility.PersonalizeHeroData.SetHeroShowcaseWeapon( f601_arg1, f601_local4 )
	end
	local f601_local5 = Engine.StorageGetBuffer( f601_arg1, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if f601_local5 and f601_local5.TenthSpecialistContract then
		local f601_local6 = Engine.GetEquippedHero( f601_arg1, Enum.eModes.MODE_MULTIPLAYER )
		if f601_local6 ~= f601_local0 then
			LuaUtils.SetLastSelectedSpecialist( f601_arg1, f601_local6 )
		end
	end
	UploadStats( f601_arg0, f601_arg1 )
end

function HeroColorsSelected( f602_arg0, f602_arg1, f602_arg2 )
	if f602_arg0.updateMode then
		local f602_local0 = nil
		if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
			f602_local0 = CoD.CCUtility.Heroes.selectionTable.selectedBody
		elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
			f602_local0 = CoD.CCUtility.Heroes.selectionTable.selectedHelmet
		end
		for f602_local4, f602_local5 in pairs( CoD.CCUtility.PersonalizeHeroData.CurrentColors ) do
			Engine.SetHeroItem( f602_arg2, CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.PersonalizeHeroData.EdittingArea, f602_local0, f602_local4, f602_local5 )
		end
		f602_arg0.updateMode( CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions, {
			customizationArea = CoD.CCUtility.PersonalizeHeroData.EdittingArea,
			colorRow = true
		} )
	end
end

function HeroColorSectionHighlighted( f603_arg0, f603_arg1, f603_arg2 )
	if CoD.CCUtility.PersonalizeHeroData.EdittingElement and f603_arg1.colorTableIndex then
		CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex = f603_arg1.colorTableIndex
		CoD.CCUtility.PersonalizeHeroData.CurrentColors[f603_arg1.colorTableIndex - 1] = f603_arg1.optionIndex - 1
		local f603_local0 = nil
		if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
			f603_local0 = CoD.CCUtility.Heroes.heroCustomizationTable.bodies[CoD.CCUtility.Heroes.selectionTable.selectedBody + 1].accents
		elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
			f603_local0 = CoD.CCUtility.Heroes.heroCustomizationTable.helmets[CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1].accents
		end
		if f603_local0 then
			local f603_local1 = f603_local0[f603_arg1.colorTableIndex][f603_arg1.optionIndex]
			if f603_local1 and f603_local1.name then
				local f603_local2 = CoD.CCUtility.PersonalizeHeroData.EdittingElement:getModel( f603_arg2, "currentSelectionName" )
				if f603_local2 then
					Engine.SetModelValue( f603_local2, f603_local1.name )
				end
			end
		end
		HeroOptionHighlighted( f603_arg0, f603_arg1, f603_arg2 )
	end
end

function CancelHeroOptionSelection( f604_arg0, f604_arg1 )
	if CoD.CCUtility.PersonalizeHeroData.EdittingElement then
		if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
			local f604_local0, f604_local1 = nil
			if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				f604_local0 = "changeBodyAccentColor"
				f604_local1 = CoD.CCUtility.Heroes.selectionTable.bodyColors[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex]
			elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				f604_local0 = "changeHelmetAccentColor"
				f604_local1 = CoD.CCUtility.Heroes.selectionTable.helmetColors[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex]
			end
			if f604_local0 and f604_local1 then
				Engine.SendClientScriptNotify( f604_arg1, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f604_arg1 ), f604_local0, CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex - 1, f604_local1 )
			end
		else
			local f604_local0, f604_local1 = nil
			if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				f604_local0 = "changeBody"
				f604_local1 = CoD.CCUtility.Heroes.selectionTable.selectedBody
			elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				f604_local0 = "changeHelmet"
				f604_local1 = CoD.CCUtility.Heroes.selectionTable.selectedHelmet
			end
			if f604_local0 and f604_local1 then
				Engine.SendClientScriptNotify( f604_arg1, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f604_arg1 ), f604_local0, f604_local1, CoD.CCUtility.customizationMode )
			end
		end
	end
	if f604_arg0.updateMode then
		f604_arg0.updateMode( CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions )
	end
end

function HeroShowcaseWeaponSelected( f605_arg0, f605_arg1, f605_arg2 )
	if f605_arg0.updateMode then
		local f605_local0 = f605_arg1:getModel()
		if f605_local0 then
			local f605_local1 = Engine.GetModel( f605_local0, "itemIndex" )
			if f605_local1 then
				local f605_local2 = Engine.GetModelValue( f605_local1 )
				CoD.CCUtility.PersonalizeHeroData.SetHeroShowcaseWeapon( f605_arg2, f605_local2 )
				Engine.SendClientScriptNotify( f605_arg2, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f605_arg2 ), "changeShowcaseWeapon", Engine.GetItemRef( f605_local2 ) .. "_" .. CoD.gameMode:lower(), "", "", CoD.CCUtility.customizationMode )
			end
		end
	end
end

function HeroShowcaseWeaponVariantSelected( f606_arg0, f606_arg1, f606_arg2 )
	if f606_arg0.updateMode then
		local f606_local0 = f606_arg1.weaponVariantInfo.variantNameBig
		local f606_local1 = f606_arg1.weaponVariantInfo.weaponIndex
		local f606_local2 = f606_arg1.weaponVariantInfo.attachmentsByIndex
		local f606_local3 = f606_arg1.weaponVariantInfo.attachmentVariant
		local f606_local4 = f606_arg1.weaponVariantInfo.camoIndex
		local f606_local5 = f606_arg1.weaponVariantInfo.paintjobSlot
		local f606_local6 = f606_arg1.weaponVariantInfo.paintjobIndex
		if CoD.CCUtility.PersonalizeHeroData.IsDualWieldWeapon( f606_local1, f606_local2 ) then
			f606_local1 = CoD.CCUtility.PersonalizeHeroData.GetDualWieldVersionOfWeapon( f606_arg2, f606_local1 )
		end
		CoD.CCUtility.PersonalizeHeroData.SetHeroShowcaseWeapon( f606_arg2, f606_local1, f606_local0, f606_local2, f606_local3, f606_local4, f606_local5, f606_local6 )
		Engine.SendClientScriptNotify( f606_arg2, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f606_arg2 ), "changeShowcaseWeapon", CoD.CCUtility.PersonalizeHeroData.GetHeroShowcaseWeaponName( f606_local1, f606_local2 ), CoD.CACUtility.GetAttachmentCosmeticVariantsFromVariantInfo( f606_arg1.weaponVariantInfo ), CoD.CCUtility.PersonalizeHeroData.GetHeroShowcaseWeaponRenderOptions( f606_local4, f606_local5, f606_local6 ), CoD.CCUtility.customizationMode )
	end
end

function SetHeroItemOptionAsOld( f607_arg0, f607_arg1, f607_arg2 )
	local f607_local0 = f607_arg1:getModel( f607_arg2, "optionIndex" )
	if f607_local0 then
		local f607_local1 = Engine.GetModelValue( f607_local0 )
		local f607_local2 = CoD.CCUtility.Heroes.HeroIndexForEdits
		local f607_local3 = CoD.CCUtility.PersonalizeHeroData.EdittingArea
		if f607_local1 and f607_local2 and f607_local3 then
			Engine.SetCharacterCustomizationItemAsOld( f607_arg2, f607_local2, f607_local3, f607_local1 )
			local f607_local4 = CoD.CCUtility.PersonalizeHeroData.EdittingElement:getModel( f607_arg2, "breadcrumbCount" )
			if f607_local4 then
				local f607_local5 = Engine.CharacterCustomizationNewItemCount( f607_arg2, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.PersonalizeHeroData.EdittingArea )
				Engine.SetModelValue( f607_local4, f607_local5.total )
			end
			local f607_local6 = f607_arg0.categoryTabs.Tabs.grid:getItemAt( f607_arg0.categoryTabs.Tabs.grid.savedActiveIndex + 1 )
			if f607_local6 then
				local f607_local7 = Engine.CharacterCustomizationNewItemCount( f607_arg2, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.PersonalizeHeroData.EdittingArea )
				local f607_local8 = f607_local6:getModel( f607_arg2, "breadcrumbCount" )
				if f607_local8 then
					local f607_local9 = 0
					if f607_local6.filterName == "loot" then
						f607_local9 = f607_local7.loot
					else
						f607_local9 = f607_local7.standard
					end
					Engine.SetModelValue( f607_local8, f607_local9 )
				end
			end
		end
	end
end

function SetHeroTauntAsOld( f608_arg0, f608_arg1, f608_arg2 )
	if f608_arg1.index and f608_arg1.tauntType then
		Engine.SetTauntAsOld( f608_arg2, Enum.eModes.MODE_MULTIPLAYER, CoD.CCUtility.Heroes.HeroIndexForEdits, f608_arg1.tauntType, f608_arg1.index )
	end
end

function SetHeroGestureAsOld( f609_arg0, f609_arg1, f609_arg2 )
	if f609_arg1.index and f609_arg1.gestureType then
		Engine.SetGestureAsOld( f609_arg2, Enum.eModes.MODE_MULTIPLAYER, CoD.CCUtility.Heroes.HeroIndexForEdits, f609_arg1.gestureType, f609_arg1.index )
	end
end

function WC_SetChoosingCategory( f610_arg0, f610_arg1, f610_arg2 )
	f610_arg0:processEvent( {
		name = "update_selection_mode",
		mode = CoD.WC_Category.Modes.SELECTING_CATEGORY
	} )
end

function WC_SetSelectingItem( f611_arg0, f611_arg1, f611_arg2 )
	f611_arg0:processEvent( {
		name = "update_selection_mode",
		mode = CoD.WC_Category.Modes.SELECTING_ITEM,
		element = f611_arg1
	} )
end

function WC_SelectingCustomization( f612_arg0, f612_arg1, f612_arg2 )
	f612_arg0:dispatchEventToParent( {
		name = "update_selection_mode",
		mode = CoD.WC_Category.Modes.SELECTING_CATEGORY
	} )
end

function WC_WeaponCustomizationGainFocus( f613_arg0, f613_arg1, f613_arg2 )
	local f613_local0 = CoD.perController[f613_arg2].weaponCategory
	local f613_local1 = f613_arg1.xcamNotetrack
	local f613_local2 = Engine.GetModelValue( f613_arg1:getModel( f613_arg2, "type" ) )
	if f613_local2 ~= CoD.CACUtility.primaryWeaponPrestigeSlot and f613_local2 ~= CoD.CACUtility.secondaryWeaponPrestigeSlot then
		Engine.SendClientScriptNotify( f613_arg2, "cam_customization_focus" .. CoD.GetLocalClientAdjustedNum( f613_arg2 ), f613_local0, f613_local1 )
	end
end

function WC_WeaponOptionGainFocus( f614_arg0, f614_arg1, f614_arg2 )
	local f614_local0 = f614_arg1:getModel( f614_arg2, "weaponOptionTypeName" )
	if f614_local0 then
		local f614_local1 = Engine.GetModelValue( f614_local0 )
		local f614_local2 = f614_arg1:getModel( f614_arg2, "itemIndex" )
		local f614_local3 = Engine.GetModelValue( f614_arg1:getModel( f614_arg2, "weaponOptionType" ) )
		if f614_local3 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB then
			local f614_local4 = Engine.GetModelValue( f614_arg1:getModel( f614_arg2, "paintjobIndex" ) )
			local f614_local5 = Engine.GetModelValue( f614_arg1:getModel( f614_arg2, "paintjobSlot" ) )
			if f614_local5 ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and f614_local4 ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
				Engine.SetupPaintjobData( f614_arg2, f614_local5, f614_local4 )
			end
		end
		if f614_local2 then
			local f614_local4 = Engine.GetModelValue( f614_local2 )
			local f614_local5 = IsItemWeaponOptionLocked( f614_arg0, f614_arg1, f614_arg2 )
			if f614_local3 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_INVALID then
				CoD.CACUtility.UpdateWeaponPrestigeAttachment( f614_arg2, f614_local1, f614_local4 )
			else
				Engine.SendClientScriptNotify( f614_arg2, "cam_customization_wo" .. CoD.GetLocalClientAdjustedNum( f614_arg2 ), f614_local1, f614_local4, f614_local5 )
			end
		end
	end
end

function WC_VariantGainFocus( f615_arg0, f615_arg1, f615_arg2 )
	Engine.SendClientScriptNotify( f615_arg2, "cam_customization_acv" .. CoD.GetLocalClientAdjustedNum( f615_arg2 ), f615_arg1.attachmentRef, f615_arg1.variantIndex )
end

function WC_VariantSelectionCancel( f616_arg0, f616_arg1, f616_arg2 )
	local f616_local0 = CoD.WC_Category.ACV.selectedAttachment
	local f616_local1 = CoD.perController[f616_arg2].classModel
	local f616_local2 = CoD.perController[f616_arg2].weaponCategory
	if CoD.CACUtility.IsAttachmentRefWeaponOption( f616_local0 ) then
		if f616_local0 == CoD.CACUtility.weaponOptionGroupNames[Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB] then
			local f616_local3 = Engine.GetModelValue( Engine.GetModel( f616_local1, f616_local2 .. "paintjobIndex.itemIndex" ) )
			local f616_local4 = Engine.GetModelValue( Engine.GetModel( f616_local1, f616_local2 .. "paintjobSlot.itemIndex" ) )
			if f616_local4 ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and f616_local3 ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
				Engine.SetupPaintjobData( f616_arg2, f616_local4, f616_local3 )
			elseif f616_local4 == Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and f616_local3 == Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
				Engine.ClearPaintjobLayerData()
			end
			Engine.SendClientScriptNotify( f616_arg2, "cam_customization_wo" .. CoD.GetLocalClientAdjustedNum( f616_arg2 ), f616_local0, 1 )
		else
			local f616_local4 = Engine.GetModel( f616_local1, f616_local2 .. f616_local0 .. ".itemIndex" )
			if f616_local4 then
				Engine.SendClientScriptNotify( f616_arg2, "cam_customization_wo" .. CoD.GetLocalClientAdjustedNum( f616_arg2 ), f616_local0, Engine.GetModelValue( f616_local4 ) )
			end
		end
	elseif f616_local0 == CoD.CACUtility.primaryWeaponPrestigeSlot or f616_local0 == CoD.CACUtility.secondaryWeaponPrestigeSlot then
		local f616_local3 = CoD.SafeGetModelValue( f616_local1, f616_local2 .. f616_local0 .. ".itemIndex" )
		if not f616_local3 then
			f616_local3 = CoD.CACUtility.EmptyItemIndex
		end
		CoD.CACUtility.UpdateWeaponPrestigeAttachment( f616_arg2, f616_local0, f616_local3 )
	else
		local f616_local3 = CoD.CACUtility.GetLoadoutSlotForAttachmentName( f616_local1, f616_local2, f616_local0 )
		if f616_local3 then
			local f616_local4 = Engine.GetModel( f616_local1, f616_local3 .. "cosmeticvariant.itemIndex" )
			if f616_local4 then
				Engine.SendClientScriptNotify( f616_arg2, "cam_customization_acv" .. CoD.GetLocalClientAdjustedNum( f616_arg2 ), f616_local0, Engine.GetModelValue( f616_local4 ) )
			end
		end
	end
end

function OpenChooseShowcaseWeapon( f617_arg0, f617_arg1, f617_arg2, f617_arg3, f617_arg4 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f617_arg2 ), "ShowcaseWeapon.Mode" ), Enum.ShowcaseWeaponMode.SHOWCASEWEAPON_WEAPONLIST )
	CoD.CraftUtility.Gunsmith.ParseDDL( f617_arg2, Enum.StorageFileType.STORAGE_GUNSMITH )
	CoD.CraftUtility.Paintjobs.ParseDDL( f617_arg2, Enum.StorageFileType.STORAGE_PAINTJOBS )
	NavigateToMenu( f617_arg0, "ChooseShowcaseWeapon", true, f617_arg2 )
end

function RedeemCode( f618_arg0, f618_arg1, f618_arg2 )
	Engine.ShowRedeemCode( f618_arg2 )
end

function ShowPsStoreIcon( f619_arg0 )
	Store_UpdatePSStoreIconCount( f619_arg0, 1 )
	Engine.ShowPsStoreIcon()
end

function HidePsStoreIcon( f620_arg0 )
	Store_UpdatePSStoreIconCount( f620_arg0, -1 )
	if CoD.perController[f620_arg0].psStoreIconCount ~= nil and CoD.perController[f620_arg0].psStoreIconCount == 0 then
		Engine.HidePsStoreIcon()
		if CoD.perController[f620_arg0].selectedStoreCategory ~= "OUTFITS" then
			CoD.perController[f620_arg0].selectedStoreCategory = nil
		end
		CoD.perController[f620_arg0].forceFocusCategory = nil
	end
end

function UpdateGlobalDataSource( f621_arg0, f621_arg1 )
	if DataSources[f621_arg1] then
		DataSources[f621_arg1].getModel( f621_arg0 )
	end
end

function SetSelectedStoreCategory( f622_arg0, f622_arg1, f622_arg2 )
	local f622_local0 = f622_arg1:getModel( f622_arg2, "category" )
	if f622_local0 then
		local f622_local1 = Engine.GetModelValue( f622_local0 )
		if CoD.perController[f622_arg2].selectedStoreCategory ~= f622_local1 then
			CoD.perController[f622_arg2].selectedStoreCategory = f622_local1
			local f622_local2 = false
			if not (not Engine.OwnSeasonPass( f622_arg2 ) or f622_local1 ~= "MAPPACKS") or (Engine.OwnSeasonPass( f622_arg2 ) or Engine.HasEntitlementByOwnership( f622_arg2, "zmbundle" )) and f622_local1 == "ZOMBIES" then
				f622_local2 = true
			end
			if f622_local1 == "EXTRASLOTS" or f622_local1 == "ESPORTS" or f622_local1 == "OUTFITS" or f622_local1 == "EXTRAPACKS" then
				Engine.HidePsStoreIcon()
			else
				Engine.ShowPsStoreIcon()
			end
			Engine.SetStoreCategoryFetchParamaeters( f622_arg2, f622_local1, f622_local2 )
		end
	end
end

function PurchaseProduct( f623_arg0, f623_arg1, f623_arg2 )
	local f623_local0 = CoD.perController[f623_arg2].selectedStoreCategory
	if IsDurango() then
		local f623_local1 = f623_arg1:getModel( f623_arg2, "productID" )
		if f623_local1 then
			local f623_local2 = Engine.GetModelValue( f623_local1 )
			if f623_local2 == "dc41534d-1a0c-49fd-b1bb-9cbe094b876c" or f623_local0 == "FEATURED" or f623_local0 == "BO2" or f623_local0 == "ZOMBIES" then
				Engine.ShowProductDetailsByID( f623_arg2, f623_local0, f623_local2 )
			else
				Engine.PurchaseProductByID( f623_arg2, f623_local0, f623_local2 )
			end
		end
	elseif IsOrbis() then
		local f623_local1 = f623_arg1:getModel( f623_arg2, "serviceLabel" )
		if f623_local1 then
			local f623_local2 = Engine.GetModelValue( f623_local1 )
			if not (not Dvar.live_store_show_details:exists() or not Dvar.live_store_show_details:get()) or f623_local0 == "FEATURED" or f623_local0 == "MAPPACKS" or f623_local0 == "STRONGHOLD" or f623_local0 == "ZOMBIES" then
				local f623_local3 = f623_arg1:getModel( f623_arg2, "productID" )
				if f623_local3 then
					Engine.ShowProductDetailsByID( f623_arg2, f623_local0, Engine.GetModelValue( f623_local3 ), f623_local2 )
				end
			else
				local f623_local3 = f623_arg1:getModel( f623_arg2, "skuID" )
				if f623_local3 then
					Engine.PurchaseProductByID( f623_arg2, f623_local0, Engine.GetModelValue( f623_local3 ), f623_local2 )
				end
			end
		end
	elseif IsPC() then
		if Engine.IsUserGuest( f623_arg2 ) then
			LuaUtils.UI_ShowErrorMessageDialog( f623_arg2, "MENU_GUEST_CONTENT_RESTRICTED" )
			return 
		end
		local f623_local1 = f623_arg1:getModel( f623_arg2, "skuID" )
		local f623_local2 = f623_arg1:getModel( f623_arg2, "serviceLabel" )
		if f623_local1 and f623_local2 then
			Engine.PurchaseProductByID( f623_arg2, f623_local0, Engine.GetModelValue( f623_local1 ), Engine.GetModelValue( f623_local2 ) )
			CoD.OverlayUtility.CreateOverlay( f623_arg2, f623_arg0, "ProcessingCoDPointsPurchasePC" )
		end
	end
end

function RecordStoreOnItemGainFocus( f624_arg0, f624_arg1, f624_arg2, f624_arg3 )
	f624_arg1.onGainFocusTime = Engine.milliseconds()
end

function RecordStoreOnItemLoseFocus( f625_arg0, f625_arg1, f625_arg2, f625_arg3 )
	local f625_local0 = CoD.perController[f625_arg2].selectedStoreCategory
	local f625_local1 = f625_arg1.onGainFocusTime
	local f625_local2 = 0
	local f625_local3 = Dvar.store_item_viewed_timer:get()
	if f625_local1 ~= nil then
		f625_local2 = Engine.milliseconds() - f625_local1
	end
	if f625_local3 and f625_local2 < f625_local3 then
		return 
	end
	local f625_local4 = f625_arg1:getModel( f625_arg2, "productID" )
	if f625_local4 then
		LUI.CoDMetrics.StoreItemViewed( f625_arg0, f625_arg2, Engine.GetModelValue( f625_local4 ), f625_local2 )
	end
end

function RecordStoreLastFocusedItemViewed( f626_arg0, f626_arg1, f626_arg2, f626_arg3 )
	RecordStoreOnItemLoseFocus( f626_arg0, f626_arg1, f626_arg2, f626_arg3 )
end

function OpenStoreNonFeatureFrameVOD( f627_arg0, f627_arg1, f627_arg2 )
	local f627_local0 = nil
	if f627_arg0.rightPane.frameWidget.framedWidget and f627_arg0.rightPane.frameWidget.framedWidget.storeMovie then
		f627_local0 = f627_arg0.rightPane.frameWidget.framedWidget.storeMovie
		f627_local0:setupMoviePlayback( "" )
	end
	Engine.SetModelValue( Engine.GetModel( DataSources.VoDViewer.getModel( f627_arg2 ), "stream" ), CoD.SafeGetModelValue( f627_arg1:getModel(), "videoHighResRef" ) )
	LUI.OverrideFunction_CallOriginalFirst( OpenPopup( f627_arg0, "VoDViewer", f627_arg2 ), "close", function ( element )
		if f627_local0 then
			f627_local0:setupMoviePlayback( CoD.SafeGetModelValue( f627_arg1:getModel(), "videoLowResRef" ), false, true )
		end
	end )
end

function StoreFeatureFrameWidgetGainFocus( f629_arg0, f629_arg1, f629_arg2 )
	local f629_local0 = CoD.SafeGetModelValue( f629_arg1:getModel(), "videoLowResRef" )
	if f629_arg1.frameWidget and f629_arg1.frameWidget.framedWidget and f629_local0 and f629_local0 ~= "" then
		if f629_arg0.playMovieDelayTimer then
			f629_arg0.playMovieDelayTimer:close()
			f629_arg0.playMovieDelayTimer = nil
		end
		f629_arg1:registerEventHandler( "play_movie_delay", function ( element, event )
			if element:isInFocus() then
				element.frameWidget:changeFrameWidget( "CoD.StoreFeaturePreviewMovieWidget" )
				element.frameWidgetName = "StoreFeaturePreviewMovieWidget"
				if element.frameWidget.framedWidget.storeMovie then
					element.frameWidget.framedWidget.storeMovie:setupMoviePlayback( f629_local0, false, true )
				end
			end
		end )
		f629_arg0.playMovieDelayTimer = LUI.UITimer.new( 2000, {
			name = "play_movie_delay",
			controller = f629_arg2
		}, true )
		f629_arg0:addElement( f629_arg0.playMovieDelayTimer )
		f629_arg1:registerEventHandler( "finished_movie_playback", function ( element, event )
			if element:isInFocus() and element.frameWidget.framedWidget.storeMovie then
				element.frameWidget.framedWidget.storeMovie:setupMoviePlayback( "" )
				element:addElement( LUI.UITimer.newElementTimer( 1, true, function ()
					element.frameWidget.framedWidget.storeMovie:setupMoviePlayback( f629_local0, false, true )
				end ) )
			end
		end )
	end
end

function StoreFeatureFrameWidgetLoseFocus( f633_arg0, f633_arg1, f633_arg2 )
	local f633_local0 = f633_arg1:getModel()
	if f633_arg1.frameWidget and f633_arg1.frameWidget.framedWidget then
		if f633_arg1.frameWidget.framedWidget.storeMovie then
			f633_arg1.frameWidget.framedWidget.storeMovie:setupMoviePlayback( "" )
		end
		f633_arg1.frameWidget:changeFrameWidget( "CoD.StoreFeaturePreviewImageWidget" )
		f633_arg1.frameWidgetName = "StoreFeaturePreviewImageWidget"
	end
end

function StoreVideoProductFrameWidgetGainFocus( f634_arg0, f634_arg1, f634_arg2 )
	local f634_local0 = CoD.SafeGetModelValue( f634_arg1:getModel(), "videoLowResRef" )
	if f634_arg1.frameWidget and f634_arg1.frameWidget.framedWidget and f634_local0 ~= "" then
		if f634_arg0.playMovieDelayTimer then
			f634_arg0.playMovieDelayTimer:close()
			f634_arg0.playMovieDelayTimer = nil
		end
		f634_arg1:registerEventHandler( "play_movie_delay", function ( element, event )
			if element:isInFocus() then
				element.frameWidget:changeFrameWidget( "CoD.StoreVideoProductButtonMovieWidget" )
				element.frameWidgetName = "StoreVideoProductButtonMovieWidget"
				if element.frameWidget.framedWidget.storeMovie then
					element.frameWidget.framedWidget.storeMovie:setupMoviePlayback( f634_local0 )
				end
			end
		end )
		f634_arg0.playMovieDelayTimer = LUI.UITimer.new( 2000, {
			name = "play_movie_delay",
			controller = f634_arg2
		}, true )
		f634_arg1:addElement( f634_arg0.playMovieDelayTimer )
	end
end

function StoreVideoProductFrameWidgetLoseFocus( f636_arg0, f636_arg1, f636_arg2 )
	local f636_local0 = f636_arg1:getModel()
	if f636_arg1.frameWidget and f636_arg1.frameWidget.framedWidget then
		if f636_arg1.frameWidget.framedWidget.storeMovie then
			f636_arg1.frameWidget.framedWidget.storeMovie:setupMoviePlayback( "" )
		end
		f636_arg1.frameWidget:changeFrameWidget( "CoD.StoreVideoProductButtonImageWidget" )
		f636_arg1.frameWidgetName = "StoreVideoProductButtonImageWidget"
	end
end

function OpenStoreFeatureFrameVOD( f637_arg0, f637_arg1, f637_arg2 )
	local f637_local0 = nil
	if f637_arg1.frameWidget.framedWidget and f637_arg1.frameWidget.framedWidget.storeMovie then
		f637_local0 = f637_arg1.frameWidget.framedWidget.storeMovie
		f637_local0:setupMoviePlayback( "" )
	end
	Engine.SetModelValue( Engine.GetModel( DataSources.VoDViewer.getModel( f637_arg2 ), "stream" ), CoD.SafeGetModelValue( f637_arg1:getModel(), "videoHighResRef" ) )
	LUI.OverrideFunction_CallOriginalFirst( OpenPopup( f637_arg0, "VoDViewer", f637_arg2 ), "close", function ( element )
		if f637_local0 then
			f637_local0:setupMoviePlayback( CoD.SafeGetModelValue( f637_arg1:getModel(), "videoLowResRef" ), false, true )
		end
	end )
end

function EmblemEditor_HandleBackInBrowseMode( f639_arg0, f639_arg1, f639_arg2, f639_arg3 )
	Engine.ExecNow( f639_arg2, "emblemEndEdit" )
	local f639_local0 = GoBack( f639_arg0, f639_arg2 )
	if IsPaintshop( f639_arg2 ) then
		CoD.SetCustomization( f639_arg2, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT, "type" )
		ForceNotifyModel( f639_arg2, "Paintshop.UpdateDataSource" )
	else
		CoD.SetCustomization( f639_arg2, Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM, "type" )
		local f639_local1 = f639_local0.tabList.Tabs.grid
		if f639_local1 and f639_arg3 then
			local f639_local2 = f639_local1:getFirstSelectableItem()
			if f639_local2 then
				f639_local1:setActiveItem( f639_local2 )
			end
		end
		ForceNotifyModel( f639_arg2, "Emblem.UpdateDataSource" )
	end
	CoD.perController[f639_arg2].selectEmblemGroupIndex = nil
	CoD.perController[f639_arg2].selectedLayerIndex = nil
	CoD.perController[f639_arg2].selectedLayerIconID = nil
	CoD.perController[f639_arg2].selectedLayerMaterialID = nil
	CoD.SetEditorProperties( f639_arg2, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_NONE, "editorMode" )
	CoD.SetEditorProperties( f639_arg2, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE, "colorMode" )
	CoD.SetEditorProperties( f639_arg2, CoD.emblem.CLIPBOARDSTATE.EMPTY, "isClipboardEmpty" )
	Engine.CommitProfileChanges( f639_arg2 )
	Engine.ExecNow( f639_arg2, "emblemSetGridSize " .. CoD.GetCustomization( f639_arg2, "type" ) .. " 0" )
end

function EmblemEditor_SetEditMode( f640_arg0 )
	CoD.SetEditorProperties( f640_arg0, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT, "editorMode" )
end

function EmblemEditor_LayerGainFocus( f641_arg0, f641_arg1, f641_arg2, f641_arg3 )
	local f641_local0 = f641_arg2:getModel( f641_arg3, "layerIndex" )
	local f641_local1 = f641_arg2:getModel( f641_arg3, "layerNumberString" )
	local f641_local2 = Engine.GetModelValue( f641_local0 )
	CoD.Menu.SetButtonLabel( f641_arg0, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "PLATFORM_EMBLEM_EDIT_DONE" )
	CoD.Menu.SetButtonLabel( f641_arg1, Enum.LUIButton.LUI_KEY_START, "" )
	local f641_local3 = Engine.GetSelectedLayerIconID( f641_arg3, f641_local2 )
	CoD.perController[f641_arg3].selectedLayerIndex = f641_local2
	CoD.perController[f641_arg3].selectedLayerIconID = f641_local3
	CoD.perController[f641_arg3].selectedLayerMaterialID = Engine.GetSelectedLayerMaterialID( f641_arg3, f641_local2 )
	local f641_local4 = CoD.GetCustomization( f641_arg3, "type" )
	EmblemEditor_SetLayerAndGroupCount( f641_arg3, f641_local4 )
	Engine.ExecNow( f641_arg3, "emblemSelect " .. f641_local2 .. " " .. f641_local4 )
	if CoD.IsLayerEmpty( f641_arg3, CoD.perController[f641_arg3].selectedLayerIndex ) == true then
		CoD.Menu.SetButtonLabel( f641_arg0, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_EMBLEM_CHOOSE_DECAL" )
	else
		CoD.Menu.SetButtonLabel( f641_arg0, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_EMBLEM_EDIT_LAYER" )
	end
	CoD.SetEditorProperties( f641_arg3, Engine.GetLinkedLayerCount( f641_arg3, f641_local4 ), "linkedLayerCount" )
	CoD.SetEditorProperties( f641_arg3, f641_local3, "selectedDecalID" )
	Engine.ForceNotifyModelSubscriptions( f641_local1 )
	if CoD.isPC then
		if IsLayerEmpty( f641_arg1, f641_arg2, f641_arg3 ) then
			f641_arg1.actionsListPC:hide()
			f641_arg1.m_layerEmpty = true
		else
			if not Engine.LastInput_Gamepad() then
				f641_arg1.actionsListPC:show()
			end
			f641_arg1.m_layerEmpty = nil
		end
	end
end

function EmblemEditor_InsertDecalPressed( f642_arg0, f642_arg1, f642_arg2 )
	local f642_local0 = CoD.GetCustomization( f642_arg2, "type" )
	Engine.ExecNow( f642_arg2, "emblemCopyLayer " .. CoD.perController[f642_arg2].selectedLayerIndex )
	Engine.ExecNow( f642_arg2, "emblemInsertLayer " .. f642_local0 .. " " .. CoD.perController[f642_arg2].selectedLayerIndex )
	Engine.ExecNow( f642_arg2, "emblemClearLayerByIndex " .. CoD.perController[f642_arg2].selectedLayerIndex .. " " .. f642_local0 )
	CoD.SetEditorProperties( f642_arg2, CoD.emblem.ADDDECAL.INSERT, "addDecalMode" )
end

function EmblemEditor_SetEditLayerTitle( f643_arg0, f643_arg1 )
	if IsPaintshop( f643_arg1 ) then
		f643_arg0.PaintshopFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( CoD.Paintshop.View[CoD.perController[f643_arg1].viewIndex].edit_side_ref ) )
	else
		f643_arg0.EmblemEditorFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEM_EDIT_LAYER_TITLE" ) )
	end
end

function EmblemEditor_EditSelectedLayer( f644_arg0, f644_arg1, f644_arg2 )
	local f644_local0 = CoD.perController[f644_arg2].selectedLayerIndex
	Engine.ExecNow( f644_arg2, "emblemCopyLayer " .. f644_local0 )
	CoD.SetEditorProperties( f644_arg2, CoD.emblem.CLIPBOARDSTATE.EMPTY, "isClipboardEmpty" )
	EmblemEditor_SetEditLayerTitle( f644_arg0, f644_arg2 )
	CoD.SwapFocusableElements( f644_arg2, f644_arg0.layerCarousel, f644_arg0.emblemDrawWidget )
	EmblemEditor_SetEditMode( f644_arg2 )
	local f644_local1 = Engine.GetSelectedLayerColor( f644_arg2 )
	local f644_local2 = Engine.GetSelectedLayerColor1( f644_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f644_arg2 ), "Emblem.EmblemSelectedLayerProperties.opacity0" ), math.floor( f644_local1.alpha * 100 ) )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f644_arg2 ), "Emblem.EmblemSelectedLayerProperties.opacity1" ), math.floor( f644_local2.alpha * 100 ) )
	Engine.ExecNow( f644_arg2, "emblemBeginEdit" )
	CoD.perController[f644_arg2].selectedLayerMaterialID = Engine.GetSelectedLayerMaterialID( f644_arg2, f644_local0 )
	EmblemEditor_SetScaleMode( f644_arg2, Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED )
	EmblemEditor_SetMaterialScaleMode( f644_arg2, Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED )
end

function EmblemEditor_MoveLayer( f645_arg0, f645_arg1, f645_arg2, f645_arg3 )
	local f645_local0 = f645_arg0.layerCarousel.activeWidget
	local f645_local1 = Engine.GetModelValue( f645_local0:getModel( f645_arg2, "layerIndex" ) )
	local f645_local2 = CoD.GetCustomization( f645_arg2, "type" )
	local f645_local3 = nil
	if f645_local0 ~= nil then
		if f645_arg3 == "left" then
			if f645_local1 > 0 then
				Engine.ExecNow( f645_arg2, "emblemMoveLayerRelative -1 " .. f645_local2 )
				local f645_local4 = f645_arg0.layerCarousel:getItemAtPosition( 1, f645_local0.gridInfoTable.zeroBasedIndex, true )
				if f645_local4 ~= nil then
					DataSources.EmblemLayerList.swapItemInfo( f645_arg2, f645_arg0.layerCarousel, f645_local4, f645_local0 )
					EmblemEditor_SetupDrawEmblem( f645_arg2, f645_local0, f645_local4 )
					f645_arg0.layerCarousel:setActiveItem( f645_local4 )
					EmblemEditor_SetSelectedLayerIndex( f645_arg2, f645_local4 )
					f645_local0.arrows:setState( "DefaultState" )
					if f645_local1 > 1 then
						f645_local4.arrows:setState( "LeftButtonPressed" )
					end
				end
			end
		elseif f645_arg3 == "right" then
			local f645_local4 = Engine.GetUsedLayerCount( f645_arg2, f645_local2, CoD.perController[f645_arg2].totalLayers )
			if f645_local1 + Engine.GetModelValue( f645_local0:getModel( f645_arg2, "groupLayerCount" ) ) < f645_local4 then
				Engine.ExecNow( f645_arg2, "emblemMoveLayerRelative 1 " .. f645_local2 )
				local f645_local5 = f645_arg0.layerCarousel:getItemAtPosition( 1, f645_local0.gridInfoTable.zeroBasedIndex + 2, true )
				if f645_local5 ~= nil then
					DataSources.EmblemLayerList.swapItemInfo( f645_arg2, f645_arg0.layerCarousel, f645_local0, f645_local5 )
					EmblemEditor_SetupDrawEmblem( f645_arg2, f645_local0, f645_local5 )
					f645_arg0.layerCarousel:setActiveItem( f645_local5 )
					EmblemEditor_SetSelectedLayerIndex( f645_arg2, f645_local5 )
					f645_local0.arrows:setState( "DefaultState" )
					if f645_local1 + 2 < f645_local4 then
						f645_local5.arrows:setState( "RightButtonPressed" )
					end
				end
			end
		end
	end
end

function EmblemEditor_CopyLayerToClipboard( f646_arg0, f646_arg1, f646_arg2 )
	Engine.ExecNow( f646_arg2, "emblemCopyLayer " .. CoD.perController[f646_arg2].selectedLayerIndex )
	CoD.SetEditorProperties( f646_arg2, CoD.emblem.CLIPBOARDSTATE.FULL, "isClipboardEmpty" )
	f646_arg0.clipboard:setState( "Visible" )
end

function EmblemEditor_UpdateLayerData( f647_arg0, f647_arg1 )
	local f647_local0 = Engine.GetModelValue( f647_arg0.layerCarousel.activeWidget:getModel( f647_arg1, "layerIndex" ) )
	f647_arg0.layerCarousel:updateDataSource( true )
	local f647_local1 = f647_arg0.layerCarousel:findItem( {
		layerIndex = f647_local0
	}, nil, false, nil )
	if f647_local1 then
		f647_arg0.layerCarousel:processEvent( {
			name = "gain_focus",
			controller = f647_arg1,
			selectIndex = f647_local1.gridInfoTable.zeroBasedIndex,
			overrideScrollTime = 0
		} )
	end
end

function EmblemEditor_InsertLayer( f648_arg0, f648_arg1, f648_arg2 )
	Engine.ExecNow( f648_arg2, "emblemInsertLayer " .. CoD.GetCustomization( f648_arg2, "type" ) .. " " .. CoD.perController[f648_arg2].selectedLayerIndex )
end

function EmblemEditor_HandleBackInEditMode( f649_arg0, f649_arg1, f649_arg2 )
	Engine.ExecNow( f649_arg2, "emblemEndEdit" )
	if IsPaintshop( f649_arg2 ) == true then
		f649_arg0.PaintshopFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_PAINTSHOP_CAPS" ) )
	else
		f649_arg0.EmblemEditorFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEM_EDITOR_CAPS" ) )
	end
	SetBrowseMode( f649_arg2 )
	CoD.SwapFocusableElements( f649_arg2, f649_arg0.emblemDrawWidget, f649_arg0.layerCarousel )
end

function EmblemEditor_SetupEditorBasedOnMode( f650_arg0, f650_arg1, f650_arg2 )
	if IsEditMode( f650_arg2 ) then
		EmblemEditor_EditSelectedLayer( f650_arg0, f650_arg0.layerCarousel:findItem( {
			layerIndex = CoD.perController[f650_arg2].selectedLayerIndex
		}, nil, true, 0 ), f650_arg2 )
	else
		CoD.SwapFocusableElements( f650_arg2, f650_arg0.emblemDrawWidget, f650_arg0.layerCarousel )
	end
end

function EmblemEditor_FlipIcon( f651_arg0, f651_arg1, f651_arg2 )
	Engine.ExecNow( f651_arg2, "emblemToggleFlip" )
end

function EmblemEditor_ToggleOutline( f652_arg0, f652_arg1, f652_arg2 )
	Engine.ExecNow( f652_arg2, "emblemToggleOutline" )
end

function EmblemEditor_EndEdit( f653_arg0, f653_arg1, f653_arg2 )
	Engine.ExecNow( f653_arg2, "emblemEndEdit" )
end

function EmblemEditor_BeginEdit( f654_arg0, f654_arg1, f654_arg2 )
	Engine.ExecNow( f654_arg2, "emblemBeginEdit" )
end

function EmblemEditor_CutLayer( f655_arg0, f655_arg1, f655_arg2 )
	Engine.ExecNow( f655_arg2, "emblemCutLayer " .. CoD.GetCustomization( f655_arg2, "type" ) )
	CoD.SetEditorProperties( f655_arg2, CoD.emblem.CLIPBOARDSTATE.FULL, "isClipboardEmpty" )
	f655_arg0.clipboard:setState( "Visible" )
end

function EmblemEditor_HandleKeyboardComplete( f656_arg0, f656_arg1, f656_arg2, f656_arg3 )
	local f656_local0 = CoD.perController[f656_arg2].selectedEmblemModel
	local f656_local1 = nil
	if not f656_local0 then
		return 
	elseif f656_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_EMBLEMS then
		f656_local1 = Engine.GetModel( f656_local0, "emblemTextEntry" )
		if f656_local1 then
			Engine.SetModelValue( f656_local1, f656_arg3.input )
		end
		local f656_local2 = f656_arg0:getModel( f656_arg2, "inputText" )
		if f656_local2 then
			Engine.SetModelValue( f656_local2, f656_arg3.input )
		end
	end
end

function EmblemEditor_OpenSavePopup( f657_arg0, f657_arg1, f657_arg2, f657_arg3 )
	CoD.OverlayUtility.CreateOverlay( f657_arg2, f657_arg0, "EmblemSave", CoD.perController[f657_arg2].selectedEmblemModel )
end

function EmblemEditor_SaveEmblem( f658_arg0, f658_arg1, f658_arg2, f658_arg3 )
	local f658_local0 = Engine.GetModelValue( Engine.GetModel( f658_arg3, "emblemTextEntry" ) )
	local f658_local1 = Engine.GetModel( f658_arg3, "emblemName" )
	local f658_local2 = MediaManagerGetQuotaForCategory( f658_arg2, "emblem" )
	Engine.SetModelValue( f658_local1, f658_local0 )
	local f658_local3 = false
	EmblemEditor_RecordComScoreEvent( f658_arg0, f658_arg2, f658_local2.categorySlotsUsed, f658_local2.categoryQuota )
	if CoD.perController[f658_arg2].selectedEmblemTabStorageType == Enum.StorageFileType.STORAGE_EMBLEMS then
		CoD.CraftUtility.Emblems.UploadEmblem( f658_arg2, f658_arg3 )
		CoD.CraftUtility.Emblems.ParseDDL( f658_arg2, Enum.StorageFileType.STORAGE_EMBLEMS )
	elseif IsPreBuiltEmblemTab( f658_arg2 ) then
		local f658_local4 = Enum.StorageFileType.STORAGE_EMBLEMS
		CoD.CraftUtility.Emblems.ParseDDL( f658_arg2, f658_local4 )
		CoD.CraftUtility.Emblems.Copy( f658_arg2, f658_arg3, f658_local4 )
		f658_local3 = true
	end
	local f658_local4 = GoBack( f658_arg0, f658_arg2 )
	EmblemEditor_HandleBackInBrowseMode( f658_local4, f658_arg1, f658_arg2, f658_local3 )
	ClearSavedState( f658_local4, f658_arg2 )
end

function EmblemEditor_DiscardChanges( f659_arg0, f659_arg1, f659_arg2, f659_arg3 )
	local f659_local0 = GoBack( f659_arg0, f659_arg2 )
	EmblemEditor_HandleBackInBrowseMode( f659_local0, f659_arg1, f659_arg2 )
	ClearSavedState( f659_local0, f659_arg2 )
end

function EmblemEditor_NoChangesAction( f660_arg0, f660_arg1, f660_arg2, f660_arg3 )
	EmblemEditor_HandleBackInBrowseMode( GoBack( f660_arg0, f660_arg2 ), f660_arg1, f660_arg2 )
end

function EmblemEditor_SaveChangesBack( f661_arg0, f661_arg1, f661_arg2, f661_arg3 )
	local f661_local0 = false
	local f661_local1 = Engine.GetModel( f661_arg3, "emblemIndex" )
	if f661_local1 and CoD.CraftUtility.Emblems.IsEmblemIndexOccupied( Engine.GetModelValue( f661_local1 ) ) then
		f661_local0 = true
	end
	if not f661_local0 then
		Engine.SetModelValue( Engine.GetModel( f661_arg3, "emblemTextEntry" ), "Emblem" )
	end
end

function EmblemEditor_ToggleScaleMode( f662_arg0, f662_arg1, f662_arg2 )
	local f662_local0
	if Engine.GetEmblemScaleMode( f662_arg2 ) == Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED then
		f662_local0 = Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FREE
	else
		f662_local0 = Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED
	end
	CoD.SetEditorProperties( f662_arg2, f662_local0, "scaleMode" )
	Engine.ExecNow( f662_arg2, "emblemSetScaleMode " .. f662_local0 )
end

function EmblemEditor_LinkUnlinkLayers( f663_arg0, f663_arg1, f663_arg2 )
	local f663_local0 = f663_arg1:getModel()
	local f663_local1 = Engine.GetModel( f663_local0, "layerIndex" )
	if f663_local1 then
		local f663_local2 = Engine.GetModelValue( f663_local1 )
		local f663_local3 = CoD.GetCustomization( f663_arg2, "type" )
		local f663_local4 = Engine.GetModel( f663_local0, "isLinked" )
		local f663_local5 = Engine.GetModel( f663_local0, "groupIndex" )
		if f663_local4 then
			if Engine.GetModelValue( f663_local4 ) == true then
				Engine.ExecNow( f663_arg2, "unlinkLayers " .. f663_local3 )
				Engine.SetModelValue( f663_local4, false )
			else
				Engine.ExecNow( f663_arg2, "linkLayers " .. f663_local3 )
				Engine.SetModelValue( f663_local4, true )
			end
			local f663_local6 = Engine.GetSelectedLayerData( f663_arg2, f663_local2, f663_local3 )
			Engine.SetModelValue( f663_local5, f663_local6.groupIndex )
			CoD.SetEditorProperties( f663_arg2, Engine.GetLinkedLayerCount( f663_arg2, f663_local3 ), "linkedLayerCount" )
		end
	end
end

function EmblemEditor_GroupUngroupLayers( f664_arg0, f664_arg1, f664_arg2 )
	local f664_local0 = f664_arg1:getModel()
	local f664_local1 = Engine.GetModel( f664_local0, "layerIndex" )
	if f664_local1 then
		local f664_local2 = Engine.GetModelValue( f664_local1 )
		local f664_local3 = CoD.GetCustomization( f664_arg2, "type" )
		local f664_local4 = Engine.GetModel( f664_local0, "isLinked" )
		local f664_local5 = Engine.GetModel( f664_local0, "isGrouped" )
		local f664_local6 = Engine.GetModel( f664_local0, "groupIndex" )
		if f664_local4 and f664_local5 then
			local f664_local7 = Engine.GetModelValue( f664_local4 )
			local f664_local8 = Engine.GetModelValue( f664_local5 )
			local f664_local9 = Engine.GetSelectedLayerData( f664_arg2, f664_local2, f664_local3 )
			local f664_local10 = CoD.GetEditorProperties( f664_arg2, "linkedLayerCount" )
			if f664_local7 == true then
				if f664_local8 == true then
					Engine.ExecNow( f664_arg2, "ungroupLayers " .. f664_local3 )
					Engine.SetModelValue( f664_local5, false )
					Engine.SetModelValue( f664_local6, f664_local9.groupIndex )
					f664_arg0.layerCarousel:updateDataSource()
				elseif f664_local10 >= 2 and IsGroupSlotAvailable( f664_arg2 ) then
					Engine.ExecNow( f664_arg2, "groupLayers " .. f664_local3 )
					Engine.SetModelValue( f664_local5, true )
					Engine.SetModelValue( f664_local6, f664_local9.groupIndex )
					CoD.perController[f664_arg2].selectEmblemGroupIndex = f664_local9.groupIndex
					f664_arg0.layerCarousel:updateDataSource()
					CoD.perController[f664_arg2].selectEmblemGroupIndex = nil
				end
			end
		end
		CoD.SetEditorProperties( f664_arg2, Engine.GetLinkedLayerCount( f664_arg2, f664_local3 ), "linkedLayerCount" )
	end
end

function EmblemEditor_SaveSelectedGroup( f665_arg0, f665_arg1, f665_arg2, f665_arg3 )
	
end

function Emblems_SetIconOld( f666_arg0, f666_arg1, f666_arg2 )
	local f666_local0 = CoD.SafeGetModelValue( f666_arg1:getModel(), "iconID" )
	if f666_local0 then
		Engine.SetEmblemIconOld( f666_arg2, f666_local0 )
		local f666_local1 = LUI.getTableFromPath( "tabList.Tabs.grid.activeWidget", f666_arg0 )
		if f666_local1 then
			local f666_local2 = f666_local1:getModel( f666_arg2, "breadcrumbCount" )
			if f666_local2 then
				Engine.SetModelValue( f666_local2, math.max( 0, Engine.GetModelValue( f666_local2 ) - 1 ) )
			end
		end
	end
end

function Emblems_SetEmblemOld( f667_arg0, f667_arg1, f667_arg2 )
	local f667_local0 = CoD.SafeGetModelValue( f667_arg1:getModel(), "emblemIndex" )
	if f667_local0 then
		if CoD.perController[f667_arg2].selectedEmblemTabStorageType == Enum.StorageFileType.STORAGE_EMBLEMS_LOOT then
			f667_local0 = CoD.BlackMarketUtility.GetLootEmblemSortIndexFromEmblemId( f667_local0 )
		end
		local f667_local1 = CoD.CraftUtility.Emblems.GetEmblemBreadcrumbRoot( f667_arg2, f667_local0, CoD.perController[f667_arg2].selectedEmblemTabStorageType )
		if f667_local1 then
			f667_local1:set( 1 )
			local f667_local2 = LUI.getTableFromPath( "tabList.Tabs.grid.activeWidget", f667_arg0 )
			if f667_local2 then
				local f667_local3 = f667_local2:getModel( f667_arg2, "breadcrumbCount" )
				if f667_local3 then
					Engine.SetModelValue( f667_local3, math.max( 0, Engine.GetModelValue( f667_local3 ) - 1 ) )
				end
			end
		end
	end
end

function Emblems_SetMaterialOld( f668_arg0, f668_arg1, f668_arg2 )
	local f668_local0 = CoD.SafeGetModelValue( f668_arg1:getModel(), "materialID" )
	if f668_local0 then
		local f668_local1 = CoD.CraftUtility.Emblems.GetEmblemMaterialBreadcrumbRoot( f668_arg2, f668_local0 )
		if f668_local1 then
			f668_local1:set( 1 )
			local f668_local2 = LUI.getTableFromPath( "materialSwatch.tabList.Tabs.grid.activeWidget", f668_arg0 )
			if f668_local2 then
				local f668_local3 = f668_local2:getModel( f668_arg2, "breadcrumbCount" )
				if f668_local3 then
					Engine.SetModelValue( f668_local3, math.max( 0, Engine.GetModelValue( f668_local3 ) - 1 ) )
				end
			end
		end
	end
end

function EmblemChooseIcon_SelectionRejected( f669_arg0, f669_arg1, f669_arg2 )
	local f669_local0 = CoD.GetEditorProperties( f669_arg2, "addDecalMode" )
	if CoD.perController[f669_arg2].selectedLayerIconID == CoD.emblem.INVALID_ID then
		Engine.ExecNow( f669_arg2, "emblemClear " .. CoD.GetCustomization( f669_arg2, "type" ) )
	elseif f669_local0 == CoD.emblem.ADDDECAL.INSERT then
		Engine.ExecNow( f669_arg2, "emblemCutLayer " .. CoD.GetCustomization( f669_arg2, "type" ) )
	else
		Engine.ExecNow( f669_arg2, "emblemSetSelectedLayerIconId " .. CoD.perController[f669_arg2].selectedLayerIconID )
	end
	CoD.SetEditorProperties( f669_arg2, CoD.emblem.ADDDECAL.REPLACE, "addDecalMode" )
	SetBrowseMode( f669_arg2 )
end

function EmblemChooseIcon_SelectionAccepted( f670_arg0, f670_arg1, f670_arg2 )
	if CoD.GetEditorProperties( f670_arg2, "addDecalMode" ) == CoD.emblem.ADDDECAL.INSERT and CoD.perController[f670_arg2].selectedLayerIndex + 1 < CoD.perController[f670_arg2].totalLayers then
		local f670_local0 = CoD.GetCustomization( f670_arg2, "type" )
	end
	CoD.SetEditorProperties( f670_arg2, CoD.emblem.ADDDECAL.REPLACE, "addDecalMode" )
end

function EmblemChooseIcon_SelectionChanged( f671_arg0, f671_arg1, f671_arg2 )
	if IsSelfModelValueTrue( f671_arg1, f671_arg2, "isBMClassified" ) then
		Engine.ExecNow( f671_arg2, "emblemSetSelectedLayerIconId " .. -2 )
	else
		local f671_local0 = Engine.GetModelValue( f671_arg1:getModel( f671_arg2, "iconID" ) )
		Engine.ExecNow( f671_arg2, "emblemSetSelectedLayerIconId " .. f671_local0 )
		CoD.SetEditorProperties( f671_arg2, f671_local0, "selectedDecalID" )
	end
end

function EmblemChooseIcon_TabChanged( f672_arg0, f672_arg1, f672_arg2 )
	CoD.perController[f672_arg2].selectedDecalCategory = f672_arg1.tabCategory
	f672_arg0.emblemIconList:updateDataSource()
end

function EmblemChooseIcon_SetPreviewDecalCamera( f673_arg0, f673_arg1, f673_arg2 )
	CoD.CraftUtility.DisplayWeaponInPaintshop( f673_arg2, "paintshop_preview_" .. CoD.Paintshop.View[CoD.perController[f673_arg2].viewIndex].view_name )
end

function EmblemChooseIcon_RevertPreviewDecalCamera( f674_arg0, f674_arg1, f674_arg2 )
	CoD.CraftUtility.DisplayWeaponInPaintshop( f674_arg2, CoD.Paintshop.View[CoD.perController[f674_arg2].viewIndex].view_name )
end

function EmblemChooseMaterial_TabChanged( f675_arg0, f675_arg1, f675_arg2 )
	CoD.perController[f675_arg2].selectedMaterialCategory = f675_arg1.filter
	f675_arg0.materialSwatch:updateDataSource()
end

function EmblemChooseMaterial_SelectionChanged( f676_arg0, f676_arg1, f676_arg2 )
	if IsSelfModelValueTrue( f676_arg1, f676_arg2, "isBMClassified" ) then
		return true
	end
	local f676_local0 = f676_arg1:getModel( f676_arg2, "materialID" )
	if f676_local0 then
		Engine.ExecNow( f676_arg2, "emblemSetSelectedDecalMaterialId " .. Engine.GetModelValue( f676_local0 ) )
	end
end

function EmblemChooseMaterial_UpdateMaterialAngleByStep( f677_arg0, f677_arg1, f677_arg2, f677_arg3 )
	Engine.ExecNow( f677_arg3, "emblemUpdateMaterialAngle " .. f677_arg2 )
end

function EmblemChooseMaterial_ToggleScaleMode( f678_arg0, f678_arg1, f678_arg2 )
	local f678_local0
	if Engine.GetLayerMaterialScaleMode( f678_arg2 ) == Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED then
		f678_local0 = Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FREE
	else
		f678_local0 = Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED
	end
	CoD.SetEditorProperties( f678_arg2, f678_local0, "materialScaleMode" )
	Engine.ExecNow( f678_arg2, "setMaterialScaleMode " .. f678_local0 )
end

function EmblemChooseColor_ToggleBlend( f679_arg0, f679_arg1, f679_arg2 )
	Engine.ExecNow( f679_arg2, "emblemToggleColorBlend " .. CoD.GetCustomization( f679_arg2, "type" ) )
end

function EmblemChooseColor_ClearSelectedLayerMaterial( f680_arg0, f680_arg1, f680_arg2 )
	Engine.ExecNow( f680_arg2, "emblemClearSelectedLayerMaterialId" )
end

function EmblemChooseColor_SelectionChanged( f681_arg0, f681_arg1, f681_arg2 )
	local f681_local0 = CoD.GetEditorProperties( f681_arg2, "isGradientMode" )
	local f681_local1 = CoD.GetEditorProperties( f681_arg2, "colorNum" )
	local f681_local2 = CoD.NormalizeColor( Engine.GetModelValue( f681_arg1:getModel( f681_arg2, "color" ) ) )
	if f681_local0 == 0 then
		Engine.ExecNow( f681_arg2, "emblemSetLayerColor " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_NONE .. " " .. f681_local2[1] .. " " .. f681_local2[2] .. " " .. f681_local2[3] )
		Engine.ExecNow( f681_arg2, "emblemClearGradient" )
	elseif f681_local0 == 1 then
		if f681_local1 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 then
			Engine.ExecNow( f681_arg2, "emblemSetLayerColor " .. f681_local1 .. " " .. f681_local2[1] .. " " .. f681_local2[2] .. " " .. f681_local2[3] )
			if PropertyIsTrue( f681_arg0, "isColor1NoColor" ) then
				Engine.ExecNow( f681_arg2, "emblemSetLayerColor " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 .. " " .. f681_local2[1] .. " " .. f681_local2[2] .. " " .. f681_local2[3] )
			end
		elseif f681_local1 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
			Engine.ExecNow( f681_arg2, "emblemSetLayerColor " .. f681_local1 .. " " .. f681_local2[1] .. " " .. f681_local2[2] .. " " .. f681_local2[3] )
			if PropertyIsTrue( f681_arg0, "isColor0NoColor" ) then
				Engine.ExecNow( f681_arg2, "emblemSetLayerColor " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 .. " " .. f681_local2[1] .. " " .. f681_local2[2] .. " " .. f681_local2[3] )
			end
		end
	end
end

function EmblemChooseColor_SelectNoColor( f682_arg0, f682_arg1, f682_arg2 )
	local f682_local0 = DataSources.EmblemSelectedLayerNoColor.getModel( f682_arg2 )
	if f682_local0 ~= nil then
		local f682_local1 = CoD.NormalizeColor( Engine.GetModelValue( Engine.GetModel( f682_local0, "color" ) ) )
		f682_arg0.opacity0 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f682_arg2 ), "Emblem.EmblemSelectedLayerProperties.opacity0" ) ) / 100
		f682_arg0.opacity1 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f682_arg2 ), "Emblem.EmblemSelectedLayerProperties.opacity1" ) ) / 100
		local f682_local2 = CoD.GetEditorProperties( f682_arg2, "colorNum" )
		Engine.ExecNow( f682_arg2, "emblemSetLayerColor " .. f682_local2 .. " " .. f682_local1[1] .. " " .. f682_local1[2] .. " " .. f682_local1[3] )
		Engine.ExecNow( f682_arg2, "emblemLayerUpdateOpacity " .. f682_local2 .. " -1.0" )
	end
end

function EmblemChooseColor_NoColorLoseFocus( f683_arg0, f683_arg1, f683_arg2 )
	local f683_local0 = CoD.GetEditorProperties( f683_arg2, "colorNum" )
	if f683_arg0.lastSavedColor:isInFocus() or CoD.isPC then
		if not PropertyIsTrue( f683_arg0, "isColor0NoColor" ) and f683_local0 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 then
			if f683_arg0.opacity0 ~= nil and f683_arg0.opacity0 ~= 0 then
				Engine.ExecNow( f683_arg2, "emblemLayerUpdateOpacity " .. f683_local0 .. " " .. f683_arg0.opacity0 )
			else
				Engine.ExecNow( f683_arg2, "emblemLayerUpdateOpacity " .. f683_local0 .. " 1.0" )
			end
		elseif not PropertyIsTrue( f683_arg0, "isColor1NoColor" ) and f683_local0 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
			if f683_arg0.opacity1 ~= nil and f683_arg0.opacity1 ~= 0 then
				Engine.ExecNow( f683_arg2, "emblemLayerUpdateOpacity " .. f683_local0 .. " " .. f683_arg0.opacity1 )
			else
				Engine.ExecNow( f683_arg2, "emblemLayerUpdateOpacity " .. f683_local0 .. " 1.0" )
			end
		end
	end
end

function EmblemChooseColor_ToggleColorMode( f684_arg0, f684_arg1, f684_arg2 )
	local f684_local0 = CoD.GetEditorProperties( f684_arg2, "colorMode" )
	local f684_local1 = CoD.GetEditorProperties( f684_arg2, "isGradientMode" )
	local f684_local2 = CoD.GetSelectedColor( f684_arg2 )
	if f684_local2 ~= nil then
		EmblemChooseColor_SetShaderParams( f684_arg2, EmblemChooseColor_GetColorMixerElement( f684_arg0, f684_arg2 ), f684_local2 )
	end
	if f684_local0 == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER then
		f684_arg0:updateMode( Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, f684_local1 )
		CoD.SetEditorProperties( f684_arg2, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, "colorMode" )
	elseif f684_local0 == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID then
		CoD.SetNoColorDataModel( f684_arg2 )
		local f684_local3 = CoD.GetEditorProperties( f684_arg2, "isColor0NoColor" )
		local f684_local4 = CoD.GetEditorProperties( f684_arg2, "isColor1NoColor" )
		local f684_local5 = CoD.GetEditorProperties( f684_arg2, "colorNum" )
		if f684_local3 == 1 and f684_local5 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 then
			Engine.ExecNow( f684_arg2, "emblemSetLayerColor " .. f684_local5 .. " 1 1 1" )
			Engine.ExecNow( f684_arg2, "emblemLayerUpdateOpacity " .. f684_local5 .. " 1.0" )
		elseif f684_local4 == 1 and f684_local5 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
			Engine.ExecNow( f684_arg2, "emblemSetLayerColor " .. f684_local5 .. " 1 1 1" )
			Engine.ExecNow( f684_arg2, "emblemLayerUpdateOpacity " .. f684_local5 .. " 1.0" )
		end
		EmblemChooseColor_SetupSelectedLayerColorModel( f684_arg2 )
		f684_arg0:updateMode( Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER, f684_local1 )
		CoD.SetEditorProperties( f684_arg2, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER, "colorMode" )
	end
	EmblemChooseColor_SetupSelectedLayerColorModel( f684_arg2 )
end

function EmblemChooseColor_ToggleGradientMode( f685_arg0, f685_arg1, f685_arg2 )
	local f685_local0 = CoD.GetEditorProperties( f685_arg2, "isGradientMode" )
	local f685_local1 = CoD.GetEditorProperties( f685_arg2, "colorMode" )
	f685_arg0.colorGradientContainer:setState( "DefaultState" )
	if f685_local0 == 1 then
		CoD.SetEditorProperties( f685_arg2, 0, "isGradientMode" )
		CoD.SetNoColorDataModel( f685_arg2 )
		local f685_local2 = CoD.GetEditorProperties( f685_arg2, "isColor0NoColor" )
		if f685_local2 ~= nil and f685_local2 == 1 then
			Engine.ExecNow( f685_arg2, "emblemSetLayerColor " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 .. " 1 1 1" )
			Engine.ExecNow( f685_arg2, "emblemLayerUpdateOpacity " .. CoD.GetEditorProperties( f685_arg2, "colorNum" ) .. " 1.0" )
		end
		EmblemChooseColor_SetupSelectedLayerColorModel( f685_arg2 )
		CoD.SetEditorProperties( f685_arg2, Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_NONE, "colorNum" )
		CoD.SetEditorProperties( f685_arg2, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, "colorMode" )
		f685_arg0:updateMode( Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, 0 )
	elseif f685_local0 == 0 then
		CoD.SetEditorProperties( f685_arg2, 1, "isGradientMode" )
		Engine.ExecNow( f685_arg2, "emblemLayerUpdateOpacity " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 .. " -1" )
		if f685_local1 == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER then
			f685_arg0:updateMode( Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER, 1 )
		else
			f685_arg0:updateMode( Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, 1 )
		end
	end
	EmblemChooseColor_SetupSelectedLayerColorModel( f685_arg2 )
	local f685_local2 = EmblemChooseColor_GetGradientSliderElement( f685_arg0, f685_arg2 )
	EmblemGradient_UpdateGradientFillByStep( f685_local2, f685_local2, 0, f685_arg2 )
end

function EmblemChooseColor_DecrementColorComponent( f686_arg0, f686_arg1, f686_arg2, f686_arg3 )
	local f686_local0 = f686_arg1:getModel( f686_arg2, f686_arg3 )
	EmblemChooseColor_ModifyColorModelValue( f686_local0, -1 )
	EmblemChooseColor_SetBarProperties( f686_arg0, f686_arg1, f686_local0, f686_arg2 )
end

function EmblemChooseColor_IncrementColorComponent( f687_arg0, f687_arg1, f687_arg2, f687_arg3 )
	local f687_local0 = f687_arg1:getModel( f687_arg2, f687_arg3 )
	EmblemChooseColor_ModifyColorModelValue( f687_local0, 1 )
	EmblemChooseColor_SetBarProperties( f687_arg0, f687_arg1, f687_local0, f687_arg2 )
end

function EmblemChooseColor_SetColorComponent( f688_arg0, f688_arg1, f688_arg2, f688_arg3, f688_arg4 )
	local f688_local0 = f688_arg1:getModel( f688_arg2, f688_arg3 )
	EmblemChooseColor_SetColorModelValue( f688_local0, f688_arg4 )
	EmblemChooseColor_SetBarProperties( f688_arg0, f688_arg1, f688_local0, f688_arg2 )
end

function EmblemChooseColor_UpdateOpacityByStep( f689_arg0, f689_arg1, f689_arg2, f689_arg3 )
	if not IsSelectedColorEmpty( f689_arg1, f689_arg3 ) then
		Engine.ExecNow( f689_arg3, "emblemLayerUpdateOpacity " .. CoD.GetEditorProperties( f689_arg3, "colorNum" ) .. " " .. f689_arg2 )
		CoD.SetNoColorDataModel( f689_arg3 )
		local f689_local0 = EmblemChooseColor_GetGradientSliderElement( f689_arg0, f689_arg3 )
		EmblemGradient_UpdateGradientFillByStep( f689_local0, f689_local0, 0, f689_arg3 )
	end
end

function EmblemChooseColor_SetOpacity( f690_arg0, f690_arg1, f690_arg2, f690_arg3, f690_arg4 )
	local f690_local0 = false
	if f690_arg2 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 then
		f690_local0 = CoD.GetEditorProperties( f690_arg4, "isColor0NoColor" ) == 1
	elseif f690_arg2 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
		f690_local0 = CoD.GetEditorProperties( f690_arg4, "isColor1NoColor" ) == 1
	end
	if not f690_local0 then
		Engine.ExecNow( f690_arg4, "emblemLayerSetOpacity " .. f690_arg2 .. " " .. f690_arg3 )
		CoD.SetNoColorDataModel( f690_arg4 )
		local f690_local1 = EmblemChooseColor_GetGradientSliderElement( f690_arg0, f690_arg4 )
		EmblemGradient_UpdateGradientFillByStep( f690_local1, f690_local1, 0, f690_arg4 )
	end
end

function EmblemChooseColor_UpdateBothColorOpacity( f691_arg0, f691_arg1, f691_arg2, f691_arg3 )
	if Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f691_arg3 ), "Emblem.EmblemSelectedLayerProperties.max_opacity" ) ) + f691_arg2 <= 100 then
		Engine.ExecNow( f691_arg3, "emblemLayerUpdateOpacity " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_NONE .. " " .. f691_arg2 )
	end
end

function EmblemGradient_Color0GainFocus( f692_arg0, f692_arg1, f692_arg2 )
	if CoD.GetEditorProperties( f692_arg2, "colorMode" ) == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE then
		CoD.SetEditorProperties( f692_arg2, Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0, "colorNum" )
	end
end

function EmblemGradient_Color1GainFocus( f693_arg0, f693_arg1, f693_arg2 )
	if CoD.GetEditorProperties( f693_arg2, "colorMode" ) == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE then
		CoD.SetEditorProperties( f693_arg2, Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1, "colorNum" )
	end
end

function EmblemGradient_ColorGradientSliderGainFocus( f694_arg0, f694_arg1, f694_arg2 )
	if CoD.GetEditorProperties( f694_arg2, "colorMode" ) == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE then
		CoD.SetEditorProperties( f694_arg2, Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_GRADIENT, "colorNum" )
	end
end

function EmblemGradient_ShowSwatchContainer( f695_arg0, f695_arg1, f695_arg2 )
	local f695_local0 = CoD.GetEditorProperties( f695_arg2, "isColor0NoColor" )
	local f695_local1 = CoD.GetEditorProperties( f695_arg2, "isColor1NoColor" )
	local f695_local2 = CoD.GetEditorProperties( f695_arg2, "colorNum" )
	if f695_arg0.colorGradientContainer.gradientColor0:isInFocus() then
		f695_arg0.colorGradientContainer:setState( "Color0State" )
	elseif f695_arg0.colorGradientContainer.gradientColor1:isInFocus() then
		f695_arg0.colorGradientContainer:setState( "Color1State" )
	end
	CoD.SetEditorProperties( f695_arg2, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, "colorMode" )
	EmblemGradient_SetupSwatchLastSavedColor( f695_arg0, f695_arg1, f695_arg2 )
	CoD.SwapFocusableElements( f695_arg2, f695_arg0.colorGradientContainer, f695_arg0.colorGradientSwatchContainer )
	if f695_local0 == 1 and f695_local2 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 then
		CoD.SwapFocusableElements( f695_arg2, f695_arg0.colorGradientSwatchContainer.lastSavedColor, f695_arg0.colorGradientSwatchContainer.noColor )
		f695_arg0.colorGradientSwatchContainer.lastSavedColor.m_focusable = true
	elseif f695_local1 == 1 and f695_local2 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
		CoD.SwapFocusableElements( f695_arg2, f695_arg0.colorGradientSwatchContainer.lastSavedColor, f695_arg0.colorGradientSwatchContainer.noColor )
		f695_arg0.colorGradientSwatchContainer.lastSavedColor.m_focusable = true
	end
	f695_arg0.colorGradientContainer:hide()
	f695_arg0.colorGradientSwatchContainer:show()
end

function EmblemGradient_BackFromColorPicker( f696_arg0, f696_arg1, f696_arg2 )
	EmblemChooseColor_SetupSelectedLayerColorModel( f696_arg2 )
	if f696_arg0.colorGradientSwatchContainer.m_focusable then
		CoD.SwapFocusableElements( f696_arg2, f696_arg0.colorGradientSwatchContainer, f696_arg0.colorGradientContainer )
		f696_arg0.colorGradientContainer:show()
		f696_arg0.colorGradientSwatchContainer:hide()
	elseif f696_arg0.colorGradientMixerContainer.m_focusable then
		CoD.SwapFocusableElements( f696_arg2, f696_arg0.colorGradientMixerContainer, f696_arg0.colorGradientContainer )
		f696_arg0.colorGradientContainer:show()
		f696_arg0.colorGradientMixerContainer:hide()
	end
	CoD.SetEditorProperties( f696_arg2, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE, "colorMode" )
	local f696_local0 = CoD.GetEditorProperties( f696_arg2, "colorNum" )
	f696_arg0.colorGradientContainer:setState( "DefaultState" )
	if f696_local0 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
		CoD.SwapFocusableElements( f696_arg2, f696_arg0.colorGradientContainer.gradientColor0, f696_arg0.colorGradientContainer.gradientColor1 )
		f696_arg0.colorGradientContainer.gradientColor0.m_focusable = true
	end
	local f696_local1 = EmblemChooseColor_GetGradientSliderElement( f696_arg0, f696_arg2 )
	EmblemGradient_UpdateGradientFillByStep( f696_local1, f696_local1, 0, f696_arg2 )
end

function EmblemGradient_UpdateAngleByStep( f697_arg0, f697_arg1, f697_arg2, f697_arg3 )
	Engine.ExecNow( f697_arg3, "emblemUpdateGradientAngle " .. f697_arg2 )
end

function EmblemGradient_SetAngle( f698_arg0, f698_arg1, f698_arg2, f698_arg3 )
	Engine.ExecNow( f698_arg3, "emblemSetGradientAngle " .. f698_arg2 )
end

function EmblemGradient_ToggleGradientType( f699_arg0, f699_arg1, f699_arg2 )
	Engine.ExecNow( f699_arg2, "emblemToggleGradientType" )
end

function EmblemGradient_UpdateGradientFillByStep( f700_arg0, f700_arg1, f700_arg2, f700_arg3 )
	Engine.ExecNow( f700_arg3, "emblemUpdateGradientFill " .. f700_arg2 )
	EmblemGradient_UpdateGradientVisuals( f700_arg3, f700_arg1 )
end

function EmblemGradient_SetGradientFill( f701_arg0, f701_arg1, f701_arg2, f701_arg3 )
	Engine.ExecNow( f701_arg3, "emblemSetGradientFill " .. f701_arg2 )
	EmblemGradient_UpdateGradientVisuals( f701_arg3, f701_arg1 )
end

function EmblemGradient_BackFromGradientPicker( f702_arg0, f702_arg1, f702_arg2 )
	if CoD.GetEditorProperties( f702_arg2, "isColor0NoColor" ) == 1 and CoD.GetEditorProperties( f702_arg2, "isColor1NoColor" ) == 1 then
		Engine.ExecNow( f702_arg2, "emblemSetLayerColor " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_NONE .. " 1 1 1" )
	end
end

function EmblemSelect_TabChanged( f703_arg0, f703_arg1, f703_arg2 )
	CoD.CraftUtility.Emblems.CachedEmblems = {}
	CoD.CraftUtility.Emblems.CachedEmblemIndexMapping = {}
	CoD.perController[f703_arg2].selectedEmblemTabStorageType = f703_arg1.storageType
	CoD.CraftUtility.Emblems.ParseDDL( f703_arg2, CoD.perController[f703_arg2].selectedEmblemTabStorageType )
	f703_arg0.emblemList:updateDataSource()
	f703_arg0.emblemList:setActiveItem( f703_arg0.emblemList:getFirstSelectableItem() )
	ForceNotifyModel( f703_arg2, "Emblem.UpdateDataSource" )
end

function UpdateSlotCountText( f704_arg0, f704_arg1, f704_arg2, f704_arg3 )
	return f704_arg1:setText( Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION", CoD.CraftUtility.GetUsedSlotsByFileType( f704_arg2, f704_arg3 ), CoD.CraftUtility.GetTotalAllowedSlotsByFileType( f704_arg2, f704_arg3 ) ) )
end

function UploadPublicProfile( f705_arg0, f705_arg1 )
	if CoD.perController[f705_arg1].uploadProfile == true then
		CoD.perController[f705_arg1].uploadProfile = false
		Engine.ExecNow( f705_arg1, "uploadprofile" )
	end
end

function BlackMarketSetAsEmblem( f706_arg0, f706_arg1, f706_arg2 )
	CoD.perController[f706_arg2].selectedEmblemModel = f706_arg1:getModel()
	local f706_local0, f706_local1, f706_local2 = CoD.BlackMarketUtility.GetLootEmblemIndexParams( f706_arg2, Engine.GetModelValue( f706_arg1:getModel( f706_arg2, "emblem" ) ) )
	Engine.SetupEmblemData( f706_local0, f706_local1, f706_local2 )
	if IsLive() then
		Engine.ExecNow( f706_local0, "emblemsetprofile" )
		CoD.perController[f706_local0].uploadProfile = true
	else
		Engine.SetProfileVar( f706_local0, "default_emblem_index", f706_local1 )
		Engine.ExecNow( f706_local0, "invalidateEmblemComponent" )
	end
	ForceNotifyControllerModel( f706_local0, "identityBadge.xuid" )
end

function BlackMarketSetCallingCard( f707_arg0, f707_arg1, f707_arg2 )
	local f707_local0 = Engine.GetModel( f707_arg1:getModel(), "image" )
	if f707_local0 ~= nil then
		local f707_local1 = CoD.BlackMarketUtility.GetLootCallingCardIndex( f707_arg2, Engine.GetModelValue( f707_local0 ) )
		if not f707_local1 then
			return 
		end
		SetEmblemBackground_Internal( f707_arg2, f707_local1 )
	end
	ForceNotifyControllerModel( f707_arg2, "identityBadge.xuid" )
end

function BlackMarketSetTaunt( f708_arg0, f708_arg1, f708_arg2 )
	local f708_local0 = CoD.SafeGetModelValue( f708_arg1:getModel(), "emblem" )
	if f708_local0 then
		local f708_local1 = f708_local0
		local f708_local2, f708_local3 = CoD.CCUtility.GetHeroDisplayNameAndIndexForTaunt( Enum.eModes.MODE_MULTIPLAYER, f708_local1 )
		local f708_local4, f708_local5 = CoD.CCUtility.GetTypeIndexAndIndexForTaunt( Enum.eModes.MODE_MULTIPLAYER, f708_local1, f708_local1 )
		if f708_local5 then
			Engine.SelectTaunt( f708_arg2, Enum.eModes.MODE_MULTIPLAYER, f708_local3, f708_local4, f708_local5 )
			CoD.OverlayUtility.ShowToast( "BlackMarketEquipped", Engine.Localize( "MPUI_EQUIPPED_CAPS" ), CoD.BlackMarketUtility.GetItemTypeStringForLootItem( f708_local0, "taunt" ), CoD.BlackMarketUtility.GetImageForLootItem( f708_local0, "taunt" ) )
		end
	end
end

function BlackMarketSetGesture( f709_arg0, f709_arg1, f709_arg2 )
	local f709_local0 = CoD.SafeGetModelValue( f709_arg1:getModel(), "emblem" )
	if f709_local0 then
		local f709_local1, f709_local2 = CoD.BlackMarketUtility.SplitIdIntoTwoValues( f709_local0 )
		local f709_local3, f709_local4 = CoD.CCUtility.GetHeroDisplayNameAndIndex( Enum.eModes.MODE_MULTIPLAYER, f709_local2 )
		local f709_local5, f709_local6 = CoD.CCUtility.GetTypeIndexAndIndexForGesture( Enum.eModes.MODE_MULTIPLAYER, f709_local2, f709_local1 )
		if f709_local6 then
			Engine.SelectGesture( f709_arg2, Enum.eModes.MODE_MULTIPLAYER, f709_local4, f709_local5, f709_local6 )
			CoD.OverlayUtility.ShowToast( "BlackMarketEquipped", Engine.Localize( "MPUI_EQUIPPED_CAPS" ), CoD.BlackMarketUtility.GetItemTypeStringForLootItem( f709_local0, "gesture" ), CoD.BlackMarketUtility.GetImageForLootItem( f709_local0, "gesture" ) )
		end
	end
end

function BlackMarketSetSpecialistTheme( f710_arg0, f710_arg1, f710_arg2 )
	local f710_local0 = CoD.SafeGetModelValue( f710_arg1:getModel(), "emblem" )
	if f710_local0 then
		local f710_local1, f710_local2 = CoD.BlackMarketUtility.SplitIdIntoTwoValues( f710_local0 )
		local f710_local3, f710_local4 = CoD.CCUtility.GetHeroDisplayNameAndIndex( Enum.eModes.MODE_MULTIPLAYER, f710_local2 )
		local f710_local5 = CoD.BlackMarketUtility.GetSpecialistThemeType( f710_local1 )
		local f710_local6 = CoD.BlackMarketUtility.GetSpecialistOutfitIndexForId( f710_local1, f710_local2 )
		if f710_local6 then
			Engine.SetHeroItem( f710_arg2, Enum.eModes.MODE_MULTIPLAYER, f710_local4, f710_local5, f710_local6 )
			CoD.OverlayUtility.ShowToast( "BlackMarketEquipped", Engine.Localize( "MPUI_EQUIPPED_CAPS" ), CoD.BlackMarketUtility.GetItemTypeStringForLootItem( f710_local0, "specialist_outfit" ), CoD.BlackMarketUtility.GetImageForLootItem( f710_local0, "specialist_outfit" ) )
		end
	end
end

function BlackMarketResultsOnClose( f711_arg0, f711_arg1, f711_arg2 )
	if not IsLive() then
		Engine.CommitProfileChanges( f711_arg2 )
	else
		UploadPublicProfile( f711_arg0, f711_arg2 )
	end
	CoD.perController[f711_arg2].selectedEmblemModel = nil
end

function CommitProfileChanges( f712_arg0 )
	Engine.CommitProfileChanges( f712_arg0 )
end

function EmblemSelect_Back( f713_arg0, f713_arg1, f713_arg2 )
	if not IsLive() then
		Engine.CommitProfileChanges( f713_arg2 )
	else
		UploadPublicProfile( f713_arg0, f713_arg2 )
	end
	CoD.perController[f713_arg2].selectedEmblemModel = nil
	CoD.CraftUtility.Emblems.CachedEmblems = {}
	CoD.CraftUtility.Emblems.CachedEmblemIndexMapping = {}
	ClearSavedState( f713_arg0, f713_arg2 )
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "emblemBreadcrumbChanged" ) )
end

function EmblemSelect_SetAsEmblem( f714_arg0, f714_arg1, f714_arg2 )
	if IsLive() then
		if SelectingGroupEmblem( f714_arg2 ) then
			if SelectingGroupEmblemForGroupCreation( f714_arg2 ) then
				Engine.SetGroupEmblemForGroupCreation( f714_arg2 )
			else
				MarkGroupDataDirty( f714_arg2, "emblem", true )
				Engine.SetGroupEmblem( f714_arg2 )
			end
			GoBack( f714_arg0, f714_arg2 )
			return 
		end
		Engine.ExecNow( f714_arg2, "emblemsetprofile" )
		CoD.perController[f714_arg2].uploadProfile = true
	else
		Engine.SetProfileVar( f714_arg2, "default_emblem_index", Engine.GetModelValue( f714_arg1:getModel( f714_arg2, "emblemIndex" ) ) )
		Engine.ExecNow( f714_arg2, "invalidateEmblemComponent" )
	end
end

function EmblemSelect_GainFocus( f715_arg0, f715_arg1, f715_arg2 )
	CoD.perController[f715_arg2].selectedEmblemModel = f715_arg1:getModel()
	Engine.SetupEmblemData( f715_arg2, Engine.GetModelValue( f715_arg1:getModel( f715_arg2, "emblemIndex" ) ), CoD.perController[f715_arg2].selectedEmblemTabStorageType )
end

function EmblemSelect_ChooseEmblem( f716_arg0, f716_arg1, f716_arg2 )
	CoD.perController[f716_arg2].totalLayers = Enum.CustomizationTypeLayerCount.CUSTOMIZATION_TYPE_EMBLEM_MAX_LAYERS
	CoD.perController[f716_arg2].totalGroups = Enum.CustomizationTypeGroupCount.CUSTOMIZATION_TYPE_MAX_GROUPS
	CoD.SetEditorProperties( f716_arg2, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE, "editorMode" )
	local f716_local0 = Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM
	CoD.SetCustomization( f716_arg2, f716_local0, "type" )
	Engine.SetupEmblemEditBuffer( f716_arg2, f716_local0, 0 )
end

function EmblemSelect_RenameEmblem( f717_arg0, f717_arg1, f717_arg2 )
	local f717_local0 = f717_arg0:getModel()
	CoD.CraftUtility.Emblems.RenameEmblem( f717_arg2, Engine.GetModelValue( Engine.GetModel( f717_local0, "emblemIndex" ) ), Engine.GetModelValue( Engine.GetModel( f717_local0, "emblemName" ) ) )
end

function EmblemSelect_HandleRenameKeyboardComplete( f718_arg0, f718_arg1, f718_arg2, f718_arg3 )
	local f718_local0 = f718_arg0:getModel()
	local f718_local1 = nil
	if not f718_local0 then
		return 
	elseif f718_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_EMBLEMS then
		f718_local1 = Engine.GetModel( f718_local0, "emblemName" )
	end
	if f718_local1 then
		Engine.SetModelValue( f718_local1, f718_arg3.input )
	end
end

function EmblemSelect_ClearEmblem( f719_arg0, f719_arg1, f719_arg2 )
	local f719_local0 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f719_arg2].selectedEmblemModel, "emblemIndex" ) )
	CoD.CraftUtility.Emblems.ClearEmblem( f719_arg2, f719_local0 )
	Engine.UploadEmblemData( f719_arg2, f719_local0 )
	CoD.CraftUtility.Emblems.ParseDDL( f719_arg2, Enum.StorageFileType.STORAGE_EMBLEMS )
	local f719_local1 = nil
	if IsMediaManager() == true then
		f719_local1 = GoBackMultiple( f719_arg0, f719_arg2, 1 )
		MediaManagerMarkDirty( f719_arg2 )
	else
		f719_local1 = GoBackMultiple( f719_arg0, f719_arg2, 2 )
	end
	if f719_local1.emblemList ~= nil then
		f719_local1.emblemList:updateDataSource( true )
		f719_local1.emblemList:setActiveItem( f719_local1.emblemList:getFirstSelectableItem() )
		ForceNotifyModel( f719_arg2, "Emblem.UpdateDataSource" )
	end
end

function EmblemSelect_CopyEmblem( f720_arg0, f720_arg1, f720_arg2, f720_arg3, f720_arg4 )
	local f720_local0 = CoD.CraftUtility.Emblems.Copy( f720_arg2, f720_arg4:getModel(), CoD.perController[f720_arg2].selectedEmblemTabStorageType )
	if f720_local0 then
		CoD.CraftUtility.Emblems.ParseDDL( f720_arg2, Enum.StorageFileType.STORAGE_EMBLEMS )
		local f720_local1 = GoBack( f720_arg4, f720_arg2 )
		f720_local1.emblemList:updateDataSource( true )
		local f720_local2 = f720_local1.emblemList:findItem( {
			emblemIndex = f720_local0
		} )
		if f720_local2 then
			f720_local1.emblemList:setActiveItem( f720_local2 )
		end
		ForceNotifyModel( f720_arg2, "Emblem.UpdateDataSource" )
	end
end

function PaintshopWeaponList_TabChanged( f721_arg0, f721_arg1, f721_arg2 )
	DataSources.CraftWeaponList.setCurrentFilterItem( f721_arg1.filter )
	f721_arg0.weaponList:updateDataSource( true )
	f721_arg0.weaponList:setActiveItem( f721_arg0.weaponList:getFirstSelectableItem() )
	CoD.SetCustomization( f721_arg2, f721_arg0.tabList.Tabs.grid.activeWidget.gridInfoTable.zeroBasedIndex + 1, "category_index" )
end

function PaintshopWeaponList_Back( f722_arg0, f722_arg1, f722_arg2 )
	CoD.perController[f722_arg2].selectedpaintjobModel = nil
	CoD.perController[f722_arg2].paintshopWeaponListIndex = nil
	CoD.CraftUtility.Paintjobs.CachedPaintjobs = {}
end

function PaintshopWeaponList_GainFocus( f723_arg0, f723_arg1, f723_arg2 )
	CoD.SetCustomization( f723_arg2, Engine.GetModelValue( f723_arg1:getModel( f723_arg2, "itemIndex" ) ), "weapon_index" )
	CoD.SetCustomization( f723_arg2, f723_arg0.tabList.Tabs.grid.activeWidget.gridInfoTable.zeroBasedIndex + 1, "category_index" )
	CoD.CraftUtility.Gunsmith.DisplayBaseWeapon( f723_arg0, f723_arg1, f723_arg2 )
end

function PaintshopWeaponList_PressBackOnPaintjobsSelector( f724_arg0, f724_arg1, f724_arg2 )
	CoD.CraftUtility.Gunsmith.DisplayBaseWeapon( f724_arg0, f724_arg1, f724_arg2 )
	f724_arg0:updateMode( Enum.PaintshopMode.PAINTSHOPMODE_WEAPONLIST, f724_arg1 )
	f724_arg0.paintjobSelector.paintjobsList:setActiveItem( f724_arg0.paintjobSelector.paintjobsList:getFirstSelectableItem() )
end

function PaintshopWeaponList_ChooseWeapon( f725_arg0, f725_arg1, f725_arg2 )
	f725_arg0:updateMode( Enum.PaintshopMode.PAINTSHOPMODE_PAINTJOBS, f725_arg1 )
	CoD.perController[f725_arg2].paintshopWeaponListIndex = f725_arg0.weaponList.activeWidget.gridInfoTable.zeroBasedIndex + 1
	f725_arg0.paintjobSelector.paintjobsList:updateDataSource( true )
	f725_arg0.paintjobSelector.paintjobsList:setActiveItem( f725_arg0.paintjobSelector.paintjobsList:getFirstSelectableItem() )
end

function FeaturedCardsActionButtonHandler( f726_arg0, f726_arg1, f726_arg2, f726_arg3, f726_arg4 )
	local f726_local0 = f726_arg0:getParentMenu()
	local f726_local1 = nil
	local f726_local2 = ""
	local f726_local3 = nil
	if FeaturedCards_IsEnabled( f726_arg1, f726_arg2 ) == false then
		return 
	end
	local f726_local4 = nil
	if f726_arg0.LeftContainer.FEFeaturedCardsContainer.CardsList.activeWidget ~= nil then
		f726_local4 = f726_arg0.LeftContainer.FEFeaturedCardsContainer.CardsList.activeWidget:getModel()
	end
	if f726_local4 then
		f726_local2 = CoD.SafeGetModelValue( f726_local4, "action" )
		f726_local3 = CoD.SafeGetModelValue( f726_local4, "isExperimentPromo" )
	end
	if f726_local2 == "openwelcome" then
		OpenOverlay( f726_local0, "WelcomeMenu", f726_arg2 )
	elseif f726_local2 ~= nil and LUI.startswith( f726_local2, "store" ) then
		LUI.CoDMetrics.CRMMessageInteraction( f726_arg0, f726_arg2, "crm_featured" )
		if CoD.isPC then
			OpenSteamStore( f726_arg0, f726_arg1, f726_arg2, "FeaturedWidget", f726_local0 )
		else
			CoD.StoreUtility.SetupFocusCategory( f726_arg2, f726_local2 )
			OpenStore( f726_arg0, f726_arg1, f726_arg2, "FeaturedWidget", f726_local0 )
		end
	elseif f726_local2 == "opengroups" then
		OpenGroups( f726_arg0, f726_arg1, f726_arg2, f726_arg3, f726_local0 )
	elseif f726_local2 == "opencrm" then
		LUI.CoDMetrics.CRMMessageInteraction( f726_arg0, f726_arg2, "crm_featured" )
		local f726_local5 = false
		if f726_local4 then
			local f726_local6 = CoD.SafeGetModelValue( f726_local4, "index" )
			if f726_local6 then
				local f726_local7 = Engine.GetMarketingMessage( f726_arg2, "crm_featured", f726_local6 )
				if f726_local7 and f726_local7.action == "popup_video" and f726_local7.popup_image then
					Engine.SetModelValue( Engine.GetModel( DataSources.VoDViewer.getModel( f726_arg2 ), "stream" ), f726_local7.popup_image )
					OpenPopup( f726_local0, "VoDViewer", f726_arg2 )
					f726_local5 = true
				end
			end
		end
		if not f726_local5 then
			OpenCRMFeaturedPopup( f726_arg0, f726_arg1, f726_arg2, "Featured", f726_local0 )
		end
	elseif f726_local2 == "openmotd" then
		OpenMOTDPopup( f726_arg0, f726_arg1, f726_arg2, "FeaturedWidget", f726_local0 )
	elseif f726_local2 == "liveevent" then
		if CoD.isPC then
			local f726_local6 = CoD.SafeGetModelValue( DataSources.LiveEventViewer.getModel( f726_arg2 ), "stream" )
			if f726_local6 and f726_local6 ~= "" then
				Engine.OpenURL( "http://www.twitch.tv/" .. f726_local6 )
			end
		else
			OpenPopup( f726_local0, "LiveEventViewer", f726_arg2 )
		end
	elseif f726_local2 == "blackmarket" then
		if f726_local3 then
			LUI.CoDMetrics.ExperimentPromoFeatureCardEvent( f726_arg2, Engine.ExperimentsGetVariant( Engine.GetPrimaryController(), "chris_variable_discount" ) )
		else
			LUI.CoDMetrics.CRMMessageInteraction( f726_arg0, f726_arg2, "crm_featured" )
		end
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "blackmarketOpenSource" ), Engine.GetCurrentMode() )
		Engine.SwitchMode( f726_arg2, "mp" )
		OpenBlackMarket( f726_arg0, nil, f726_arg2 )
	elseif f726_local2 == "drmonty" then
		LUI.CoDMetrics.CRMMessageInteraction( f726_arg0, f726_arg2, "crm_featured" )
		CoD.perController[f726_arg2].cameFromFeaturedCard = true
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "megachewOpenSource" ), Engine.GetCurrentMode() )
		Engine.SwitchMode( f726_arg2, "zm" )
		OpenMegaChewFactorymenu( f726_arg0, f726_arg1, f726_arg2, f726_arg3, f726_local0 )
	elseif f726_local2 == "contracts" then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "contractsOpenSource" ), Engine.GetCurrentMode() )
		Engine.SwitchMode( f726_arg2, "mp" )
		LuaUtils.CycleContracts()
		OpenOverlay( f726_arg0, "BM_Contracts", f726_arg2 )
	elseif f726_local2 == "promo" then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "promoOpenSource" ), Engine.GetCurrentMode() )
		Engine.SwitchMode( f726_arg2, "mp" )
		OpenOverlay( f726_arg0, "ZMHD_Community_Theme", f726_arg2, "", "" )
	elseif f726_local2 == "open_daily_challenge" then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "dailyChallengeOpenSource" ), Engine.GetCurrentMode() )
		Engine.SwitchMode( f726_arg2, "zm" )
		CoD.OverlayUtility.CreateOverlay( f726_arg2, f726_arg0, "InspectDailyChallengeOverlay", f726_arg2 )
	elseif f726_local2 == "open_cookbook" then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "cookbookRecipeOpenSource" ), Engine.GetCurrentMode() )
		Engine.SwitchMode( f726_arg2, "zm" )
		OpenGobbleGumCookbookMenu( f726_arg0, f726_arg1, f726_arg2, f726_arg3, f726_local0 )
	elseif f726_local2 == "open_zmhd_thermometer" then
		OpenOverlay( f726_arg0, "ZMHD_Community_Theme", f726_arg2 )
	end
end

function FeaturedCardsResetTimer( f727_arg0, f727_arg1, f727_arg2, f727_arg3, f727_arg4 )
	if f727_arg0.LeftContainer.FEFeaturedCardsContainer.CarouselTimer ~= nil then
		f727_arg0.LeftContainer.FEFeaturedCardsContainer.CarouselTimer:reset()
	end
end

function FeaturedCardsGetNextCard( f728_arg0, f728_arg1, f728_arg2, f728_arg3, f728_arg4 )
	local f728_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "FeaturedCardsRoot", false )
	Engine.SetModelValue( Engine.GetModel( f728_local0, "CardSequence" ), Engine.GetModelValue( Engine.GetModel( f728_local0, "CardSequence" ) ) + 1 )
end

function FeaturedCardsGetPreviousCard( f729_arg0, f729_arg1, f729_arg2, f729_arg3, f729_arg4 )
	local f729_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "FeaturedCardsRoot", false )
	Engine.SetModelValue( Engine.GetModel( f729_local0, "CardSequence" ), Engine.GetModelValue( Engine.GetModel( f729_local0, "CardSequence" ) ) - 1 )
end

function FeaturedCardsUpdateCRMMessage( f730_arg0, f730_arg1, f730_arg2, f730_arg3, f730_arg4 )
	Engine.UpdateFeaturedCardsCRMMessage( f730_arg2 )
end

function FileshareGetSlots( f731_arg0, f731_arg1, f731_arg2 )
	Engine.FileshareStartup( f731_arg2 )
end

function OpenMyShowcase( f732_arg0, f732_arg1, f732_arg2, f732_arg3, f732_arg4 )
	local f732_local0 = {
		xuid = Engine.GetXUID64( f732_arg2 )
	}
	Engine.ExecNow( f732_arg2, "fileshareResetSummaryFiles" )
	OpenPlayerShowcase( f732_arg0, f732_arg1, f732_arg2, f732_local0, f732_arg4 )
end

function OpenShowcase( f733_arg0, f733_arg1, f733_arg2, f733_arg3, f733_arg4 )
	local f733_local0 = CoD.FileshareUtility.GetCurrentCategory()
	local f733_local1 = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	FileshareSetShowcasePublishMode( f733_arg2, false )
	if f733_local0 == "paintjob" then
		OpenShowcasePaintjobs( f733_arg0, f733_arg1, f733_arg2, f733_local1, f733_arg4 )
	elseif f733_local0 == "variant" then
		OpenShowcaseVariants( f733_arg0, f733_arg1, f733_arg2, f733_local1, f733_arg4 )
	elseif f733_local0 == "emblem" then
		OpenShowcaseEmblems( f733_arg0, f733_arg1, f733_arg2, f733_local1, f733_arg4 )
	elseif f733_local0 == "customgame" then
		OpenShowcaseCustomGames( f733_arg0, f733_arg1, f733_arg2, f733_local1, f733_arg4 )
	elseif f733_local0 == "screenshot" then
		OpenShowcaseScreenshots( f733_arg0, f733_arg1, f733_arg2, f733_local1, f733_arg4 )
	elseif f733_local0 == "recentgames" then
		OpenShowcaseRecentGames( f733_arg0, f733_arg1, f733_arg2, f733_local1, f733_arg4 )
	elseif f733_local0 == "clip_private" then
		OpenShowcaseLocalClips( f733_arg0, f733_arg1, f733_arg2, f733_local1, f733_arg4 )
	elseif f733_local0 == "clip" then
		OpenShowcaseClips( f733_arg0, f733_arg1, f733_arg2, f733_local1, f733_arg4 )
	end
end

function OpenPlayerShowcaseOnParent( f734_arg0, f734_arg1, f734_arg2, f734_arg3, f734_arg4 )
	CoD.FileshareUtility.SetCurrentUser( f734_arg3.xuid )
	CoD.FileshareUtility.SetFileshareMode( f734_arg2, Enum.FileshareMode.FILESHARE_MODE_USER )
	FileshareSetShowcasePublishMode( f734_arg2, false )
	CoD.ShowcaseOtherPlayerStats = true
	GoBackAndOpenOverlayOnParent( f734_arg0, "MyShowcase", f734_arg2 )
end

function OpenPlayerShowcase( f735_arg0, f735_arg1, f735_arg2, f735_arg3, f735_arg4 )
	CoD.FileshareUtility.InitModels()
	CoD.FileshareUtility.SetCurrentUser( f735_arg3.xuid )
	CoD.FileshareUtility.SetFileshareMode( f735_arg2, Enum.FileshareMode.FILESHARE_MODE_USER )
	FileshareSetShowcasePublishMode( f735_arg2, false )
	CoD.ShowcaseOtherPlayerStats = false
	OpenOverlay( f735_arg0, "MyShowcase", f735_arg2 )
end

function OpenShowcasePaintjobs( f736_arg0, f736_arg1, f736_arg2, f736_arg3, f736_arg4 )
	CoD.FileshareUtility.SetPreviousCategory( "paintjob" )
	CoD.FileshareUtility.SetCurrentCategory( "paintjob" )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	local f736_local0 = false
	if FileshareIsCurrentUserContext( f736_arg2 ) then
		f736_local0 = true
	end
	CoD.FileshareUtility.SetShowCreateButton( f736_local0 )
	OpenOverlay( f736_arg0, "MyShowcase_Paintjobs", f736_arg2 )
end

function OpenShowcaseVariants( f737_arg0, f737_arg1, f737_arg2, f737_arg3, f737_arg4 )
	CoD.FileshareUtility.SetPreviousCategory( "variant" )
	CoD.FileshareUtility.SetCurrentCategory( "variant" )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	local f737_local0 = false
	if FileshareIsCurrentUserContext( f737_arg2 ) then
		f737_local0 = true
	end
	CoD.FileshareUtility.SetShowCreateButton( f737_local0 )
	OpenOverlay( f737_arg0, "MyShowcase_Variants", f737_arg2 )
end

function OpenShowcaseEmblems( f738_arg0, f738_arg1, f738_arg2, f738_arg3, f738_arg4 )
	CoD.FileshareUtility.SetPreviousCategory( "emblem" )
	CoD.FileshareUtility.SetCurrentCategory( "emblem" )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	local f738_local0 = false
	if FileshareIsCurrentUserContext( f738_arg2 ) then
		f738_local0 = true
	end
	CoD.FileshareUtility.SetShowCreateButton( f738_local0 )
	OpenOverlay( f738_arg0, "MyShowcase_Emblems", f738_arg2 )
end

function OpenLocalClipPublishPrompt( f739_arg0, f739_arg1, f739_arg2, f739_arg3, f739_arg4 )
	local f739_local0 = Engine.LobbyGetDemoInformation()
	if not f739_local0 or f739_local0.fileID ~= CoD.FileshareUtility.GetSelectedItemProperty( "fileId" ) then
		LuaUtils.UI_ShowErrorMessageDialog( f739_arg2, "MENU_FILESHARE_PUBLISH_ONLY_AFTER_DOWNLOADING" )
		return 
	else
		CoD.FileshareUtility.OpenPublishPrompt( f739_arg0, f739_arg2, "clip", CoD.FileshareUtility.GetSelectedItemProperty( "fileName" ), CoD.FileshareUtility.GetSelectedItemProperty( "fileDescription" ), PublishClip )
	end
end

function GetShowcaseManagerCategoryList()
	return CoD.FileshareUtility.ShowcaseManagerTabs
end

function GetShowcaseManagerCategoryCount()
	return #CoD.FileshareUtility.ShowcaseManagerTabs
end

function OpenShowcaseManager( f742_arg0, f742_arg1, f742_arg2, f742_arg3, f742_arg4 )
	CoD.FileshareUtility.SetPreviousCategory( CoD.FileshareUtility.GetCurrentCategory() )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	CoD.FileshareUtility.SetShowCreateButton( FileshareCanBuyMoreSlots( f742_arg2 ) )
	OpenOverlay( f742_arg0, "Fileshare_ShowcaseManager", f742_arg2 )
end

function OpenLocalScreenshots( f743_arg0, f743_arg1 )
	local f743_local0 = "screenshot_private"
	CoD.FileshareUtility.SetCurrentCategory( f743_local0 )
	if f743_local0 ~= CoD.FileshareUtility.GetPreviousCategory() then
		CoD.FileshareUtility.SetDirty()
	end
	CoD.FileshareUtility.ProcessUIIndex( f743_arg1, f743_local0, 0 )
	local f743_local1 = Engine.GetXUID64( f743_arg1 )
	Engine.ExecNow( f743_arg1, "fileshareResetSummaryFiles" )
	CoD.FileshareUtility.SetCurrentUser( f743_local1 )
	CoD.FileshareUtility.SetFileshareMode( f743_arg1, Enum.FileshareMode.FILESHARE_MODE_USER )
	CoD.FileshareUtility.FetchContentForUser( f743_arg1, f743_local1 )
	FileshareSetShowcasePublishMode( f743_arg1, false )
	CoD.FileshareUtility.SetPreviousCategory( f743_local0 )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	CoD.FileshareUtility.SetShowCreateButton( false )
	CoD.FileshareUtility.SetShowFileDetails( false )
	CoD.FileshareUtility.SetShowPublishNewDetails( false )
	CoD.FileshareUtility.SetShowCreateButton( false )
	CoD.FileshareUtility.SetForceRefreshThumbnails( true )
	OpenOverlay( f743_arg0, "LocalScreenshots", f743_arg1 )
	CoD.FileshareUtility.SetForceRefreshThumbnails( false )
end

function OpenLocalScreenshotsPublishPrompt( f744_arg0, f744_arg1, f744_arg2, f744_arg3, f744_arg4 )
	local f744_local0 = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	if Engine.IsScreenshotReady( Enum.ScreenshotViewType.UI_SCREENSHOT_TYPE_SCREENSHOT, f744_local0 ) == false or Engine.IsScreenshotReady( Enum.ScreenshotViewType.UI_SCREENSHOT_TYPE_THUMBNAIL, f744_local0 ) == false then
		LuaUtils.UI_ShowErrorMessageDialog( f744_arg2, "MENU_UPLOAD_FAIL_DUE_TO_SCREENSHOT_DOWNLOAD" )
		return 
	else
		CoD.FileshareUtility.OpenPublishPrompt( f744_arg0, f744_arg2, "screenshot", CoD.FileshareUtility.GetSelectedItemProperty( "fileName" ), CoD.FileshareUtility.GetSelectedItemProperty( "fileDescription" ), PublishScreenshot )
	end
end

function FileshareCloseShowcaseManager( f745_arg0, f745_arg1, f745_arg2 )
	CoD.FileshareUtility.SetInShowcaseManager( f745_arg2, false )
end

function OpenMediaCommunity( f746_arg0, f746_arg1, f746_arg2, f746_arg3, f746_arg4, f746_arg5 )
	CoD.FileshareUtility.InitModels()
	CoD.FileshareUtility.SetCurrentCommunityDataType( f746_arg5 )
	CoD.FileshareUtility.SetFileshareMode( f746_arg2, Enum.FileshareMode.FILESHARE_MODE_COMMUNITY )
	OpenOverlay( f746_arg0, "Community", f746_arg2 )
end

function FilesharePublishedTabChanged( f747_arg0, f747_arg1, f747_arg2 )
	if f747_arg1.fileshareCategory ~= nil then
		CoD.FileshareUtility.SetCurrentCategory( f747_arg1.fileshareCategory )
	else
		CoD.FileshareUtility.SetCurrentCategory( "" )
	end
	if f747_arg1.fileshareKey ~= nil and f747_arg1.fileshareVal ~= nil then
		CoD.FileshareUtility.SetCurrentFilter( f747_arg1.fileshareKey, f747_arg1.fileshareVal )
	else
		CoD.FileshareUtility.SetCurrentFilter( "", "" )
	end
	CoD.FileshareUtility.SetShowFileDetails( false )
	CoD.FileshareUtility.SetDirty()
end

function FileshareShowcaseManagerTabChanged( f748_arg0, f748_arg1, f748_arg2 )
	if f748_arg1.fileshareCategory ~= nil then
		CoD.FileshareUtility.SetCurrentCategory( f748_arg1.fileshareCategory )
	else
		CoD.FileshareUtility.SetCurrentCategory( "" )
	end
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	CoD.FileshareUtility.SetShowFileDetails( false )
	CoD.FileshareUtility.SetShowPublishNewDetails( false )
	CoD.FileshareUtility.SetDirty()
end

function FileshareSetSelectedItemAttachTimer( f749_arg0, f749_arg1, f749_arg2, f749_arg3 )
	local f749_local0 = LUI.UITimer.newElementTimer( 300, true, function ()
		CoD.FileshareUtility.ProcessUIIndex( f749_arg1, f749_arg2, f749_arg3 )
	end, f749_arg0 )
	f749_arg0.processUIIndexTimer = f749_local0
	f749_arg0:addElement( f749_local0 )
end

function FileshareItemLoseFocus( f751_arg0 )
	if f751_arg0.processUIIndexTimer then
		f751_arg0.processUIIndexTimer:close()
		f751_arg0.processUIIndexTimer = nil
	end
end

function FileshareSetSelectedItem( f752_arg0, f752_arg1, f752_arg2, f752_arg3 )
	local f752_local0 = f752_arg1:getModel()
	if f752_local0 == nil then
		CoD.CraftUtility.Fileshare.ClearDisplay( f752_arg2 )
		return 
	end
	CoD.FileshareUtility.SetSelectedItem( f752_local0 )
	local f752_local1 = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	local f752_local2 = CoD.FileshareUtility.GetSelectedItemProperty( "isPublishNew" )
	local f752_local3 = CoD.FileshareUtility.GetCurrentCategory()
	local f752_local4 = f752_arg3 == "true"
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareRoot.SelectedFileID" ), f752_local1 )
	if f752_local2 == true or f752_local1 == 0 then
		CoD.FileshareUtility.SetShowPublishNewDetails( true )
		CoD.CraftUtility.Fileshare.ClearDisplay( f752_arg2 )
		return 
	elseif f752_arg1.gridInfoTable then
		local f752_local5 = f752_arg1.gridInfoTable.zeroBasedIndex
		FileshareSetSelectedItemAttachTimer( f752_arg1, f752_arg2, f752_local3, f752_local5 )
		if FileshareIsCheckingPageFetchThreshold( f752_arg2 ) and Engine.FileshareIsUIIndexBeyondThreshold( f752_local5 ) then
			CoD.FileshareUtility.ProcessUIIndex( f752_arg2, f752_local3, f752_local5 )
		end
	end
	local f752_local5 = Engine.GetFileshareWeaponIndex( f752_arg2, f752_local1 )
	if f752_local3 == "recent" or f752_local3 == "favorites" or f752_local3 == "featured" then
		f752_local3 = CoD.SafeGetModelValue( f752_local0, "fileCategory" )
	end
	if f752_local3 == "paintjob" then
		CoD.CraftUtility.Fileshare.DisplayWeaponWithPaintjob( f752_arg2, f752_local5, f752_local1, f752_local4 )
	elseif f752_local3 == "variant" then
		CoD.CraftUtility.Fileshare.DisplayWeaponVariants( f752_arg2, f752_local5, f752_local1, f752_local4 )
	end
	if CoD.FileshareUtility.ShouldSetPreviewIconSizeShort( f752_local3 ) then
		FileshareSetPreviewIconSizeShort()
	else
		FileshareSetPreviewIconSizeNormal()
	end
end

function FileshareSetSelectedItemCategoryName( f753_arg0, f753_arg1, f753_arg2 )
	local f753_local0 = f753_arg1:getModel()
	if not f753_local0 then
		return 
	end
	local f753_local1 = Engine.GetModel( f753_local0, "fileCategory" )
	if f753_local1 then
		CoD.FileshareUtility.SetCurrentItemCategoryName( Engine.GetModelValue( f753_local1 ) )
	end
end

function FileshareShowcasePublishSetSelectedItem( f754_arg0, f754_arg1, f754_arg2 )
	if CoD.FileshareUtility.GetInShowcaseManager() then
		return 
	end
	local f754_local0 = CoD.FileshareUtility.GetCurrentCategory()
	if f754_local0 == "paintjob" then
		CoD.perController[f754_arg2].selectedpaintjobModel = f754_arg1:getModel()
		CoD.perController[f754_arg2].viewIndex = 1
		CoD.CraftUtility.Fileshare.DisplayWeaponWithPaintjobUsingModel( f754_arg2, f754_arg1:getModel() )
	elseif f754_local0 == "variant" then
		CoD.perController[f754_arg2].gunsmithVariantModel = f754_arg1:getModel()
		CoD.CraftUtility.Fileshare.DisplayWeaponWithVariant( f754_arg2, CoD.perController[f754_arg2].gunsmithVariantModel )
	elseif f754_local0 == "emblem" then
		CoD.perController[f754_arg2].selectedEmblemModel = f754_arg1:getModel()
		Engine.SetupEmblemData( f754_arg2, Engine.GetModelValue( f754_arg1:getModel( f754_arg2, "emblemIndex" ) ), CoD.perController[f754_arg2].selectedEmblemTabStorageType )
	end
end

function FileshareSetShowFileDetails( f755_arg0, f755_arg1 )
	CoD.FileshareUtility.SetShowFileDetails( f755_arg1 )
end

function FileshareSetShowPublishNewDetails( f756_arg0, f756_arg1 )
	CoD.FileshareUtility.SetShowPublishNewDetails( f756_arg1 )
end

function FileshareShowcasePublishSelectedItem( f757_arg0, f757_arg1, f757_arg2 )
	local f757_local0 = CoD.FileshareUtility.GetCurrentCategory()
	if f757_local0 == "screenshot" then
		f757_local0 = "screenshot_private"
		CoD.FileshareUtility.SetCurrentCategory( f757_local0 )
	end
	if f757_local0 == "paintjob" then
		CoD.perController[f757_arg2].selectedpaintjobModel = f757_arg1:getModel()
		CoD.CraftUtility.OpenPublishPromptPaintjob( f757_arg0, f757_arg1, f757_arg2, nil, f757_arg0 )
	elseif f757_local0 == "variant" then
		CoD.perController[f757_arg2].gunsmithVariantModel = f757_arg1:getModel()
		CoD.CraftUtility.OpenPublishPromptGunsmith( f757_arg0, f757_arg1, f757_arg2, nil, f757_arg0 )
	elseif f757_local0 == "emblem" then
		CoD.perController[f757_arg2].selectedEmblemModel = f757_arg1:getModel()
		CoD.CraftUtility.OpenPublishPromptEmblem( f757_arg0, f757_arg1, f757_arg2, nil, f757_arg0 )
	elseif f757_local0 == "customgame" then
		Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" ), "gameType" ), Engine.GetModelValue( Engine.GetModel( f757_arg1:getModel(), "gameType" ) ) )
		SetSelectedCustomGame( f757_arg1, f757_arg2 )
		OpenCustomGamePublishPrompt( f757_arg0, f757_arg1, f757_arg2, nil, f757_arg0 )
	elseif f757_local0 == "screenshot_private" then
		OpenLocalScreenshotsPublishPrompt( f757_arg0, f757_arg1, f757_arg2, nil, nil )
	elseif f757_local0 == "clip_private" then
		OpenLocalClipPublishPrompt( f757_arg0, f757_arg1, f757_arg2, nil, nil )
	end
end

function FileshareSetDirty( f758_arg0 )
	CoD.FileshareUtility.SetDirty()
end

function FileshareCategorySelectorItemSelected( f759_arg0, f759_arg1, f759_arg2 )
	local f759_local0 = Engine.GetModelValue( Engine.GetModel( f759_arg1:getModel(), "category" ) )
	local f759_local1 = CoD.FileshareUtility.GetCurrentCommunityDataType()
	local f759_local2 = false
	local f759_local3 = Engine.GetModel( f759_arg1:getModel(), "communityDataType" )
	if f759_local3 then
		local f759_local4 = CoD.FileshareUtility.GetCurrentCommunityDataType()
		local f759_local5 = Engine.GetModelValue( f759_local3 )
		if f759_local5 ~= nil and f759_local5 ~= "" and f759_local4 ~= f759_local5 then
			CoD.FileshareUtility.SetCurrentCommunityDataType( f759_local5 )
			f759_local1 = f759_local5
			f759_local2 = true
		end
	end
	FileshareCategorySelectorCategoryChanged( f759_arg2, f759_local0, f759_local1, f759_local2 )
end

function FileshareCategorySelectorSetToCategory( f760_arg0, f760_arg1, f760_arg2 )
	FileshareCategorySelectorCategoryChanged( f760_arg0, f760_arg1, nil, f760_arg2 )
end

function FileshareHandleKeyboardComplete( f761_arg0, f761_arg1, f761_arg2, f761_arg3 )
	if f761_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_FILESHARE_PUBLISH_NAME then
		CoD.FileshareUtility.SetPublishName( f761_arg3.input )
	elseif f761_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_FILESHARE_PUBLISH_DESCRIPTION then
		CoD.FileshareUtility.SetPublishDescription( f761_arg3.input )
	elseif f761_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_FILESHARE_PUBLISH_TAGS then
		CoD.FileshareUtility.SetPublishTags( f761_arg3.input )
	elseif f761_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_FILESHARE_DOWNLOAD_NAME then
		CoD.FileshareUtility.SetDownloadFileName( f761_arg3.input )
	end
end

function FileshareEnterDownloadName( f762_arg0, f762_arg1, f762_arg2 )
	ShowKeyboard( f762_arg0, f762_arg1, f762_arg2, "KEYBOARD_TYPE_FILESHARE_DOWNLOAD_NAME" )
end

function FileshareEnterPublishName( f763_arg0, f763_arg1, f763_arg2 )
	ShowKeyboard( f763_arg0, f763_arg1, f763_arg2, "KEYBOARD_TYPE_FILESHARE_PUBLISH_NAME" )
end

function FileshareEnterPublishDescription( f764_arg0, f764_arg1, f764_arg2 )
	ShowKeyboard( f764_arg0, f764_arg1, f764_arg2, "KEYBOARD_TYPE_FILESHARE_PUBLISH_DESCRIPTION" )
end

function FileshareEnterPublishTags( f765_arg0, f765_arg1, f765_arg2 )
	ShowKeyboard( f765_arg0, f765_arg1, f765_arg2, "KEYBOARD_TYPE_FILESHARE_PUBLISH_TAGS" )
end

function FileshareRestoreToPreviousCategory( f766_arg0 )
	if FileshareShowcaseIsPublishMode( nil, f766_arg0 ) then
		return 
	end
	local f766_local0 = CoD.FileshareUtility.GetPreviousCategory()
	if f766_local0 then
		CoD.FileshareUtility.SetCurrentCategory( f766_local0 )
	end
end

function FileshareDeleteCurrentItem( f767_arg0, f767_arg1, f767_arg2, f767_arg3, f767_arg4 )
	CoD.FileshareUtility.Delete( f767_arg0, f767_arg1, f767_arg2, f767_arg3, f767_arg4, true )
end

function FileshareDeleteDone( f768_arg0, f768_arg1, f768_arg2, f768_arg3, f768_arg4 )
	CoD.FileshareUtility.DeleteDone( f768_arg0, f768_arg1, f768_arg2, f768_arg3, f768_arg4 )
end

function FileshareSetPreviewIconSizeNormal()
	local f769_local0 = CoD.FileshareUtility.GetRootModel()
	local f769_local1 = Engine.CreateModel( f769_local0, "isNormalSize", false )
	local f769_local2 = Engine.CreateModel( f769_local0, "listVerticalCount", false )
	Engine.SetModelValue( f769_local1, true )
	Engine.SetModelValue( f769_local2, 2 )
end

function FileshareSetPreviewIconSizeShort()
	local f770_local0 = CoD.FileshareUtility.GetRootModel()
	local f770_local1 = Engine.CreateModel( f770_local0, "isNormalSize", false )
	local f770_local2 = Engine.CreateModel( f770_local0, "listVerticalCount", false )
	Engine.SetModelValue( f770_local1, false )
	Engine.SetModelValue( f770_local2, 3 )
end

function FileshareSummaryFileUpdate( f771_arg0 )
	local f771_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "fileshareRoot", false )
	local f771_local1 = Engine.GetModelValue( Engine.CreateModel( f771_local0, "summaryFileUpdated", false ) )
	if f771_local1 == nil then
		return 
	elseif CoD.FileshareUtility.GetIsFullscreenMode( f771_arg0 ) == true then
		local f771_local2 = CoD.FileshareUtility.GetSelectedItemRootModel()
		if Engine.GetModelValue( Engine.CreateModel( f771_local2, "fileId" ) ) == f771_local1 then
			Engine.SetModelValue( Engine.CreateModel( f771_local2, "renderFileId" ), f771_local1 )
			Engine.SetModelValue( Engine.CreateModel( f771_local2, "showDetailsViewSpinner" ), 0 )
			local f771_local3 = Engine.GetModelValue( Engine.CreateModel( f771_local2, "fileId" ) )
			local f771_local4 = Engine.GetModelValue( Engine.CreateModel( f771_local2, "fileCategory" ) )
			local f771_local5 = Engine.GetFileshareWeaponIndex( f771_arg0, f771_local3 )
			if f771_local4 == "paintjob" then
				CoD.CraftUtility.Fileshare.DisplayWeaponWithPaintjob( f771_arg0, f771_local5, f771_local3, true )
			elseif f771_local4 == "variant" then
				CoD.CraftUtility.Fileshare.DisplayWeaponVariants( f771_arg0, f771_local5, f771_local3, true )
			end
		end
	else
		for f771_local2 = 1, 12, 1 do
			local f771_local3 = "fileshareData_" .. f771_local2
			if FileshareIsCommunityMode( nil, f771_arg0 ) == true then
				f771_local3 = "fileshareData_community_" .. f771_local2
			end
			local f771_local4 = Engine.CreateModel( f771_local0, f771_local3, false )
			local f771_local5 = Engine.CreateModel( f771_local4, "fileID", false )
			local f771_local8 = Engine.CreateModel( f771_local4, "renderFileId", false )
			if Engine.GetModelValue( f771_local5 ) == f771_local1 then
				Engine.SetModelValue( f771_local8, f771_local1 )
				break
			end
		end
	end
end

function FileshareSetCommunityKicker( f772_arg0 )
	SetHeadingKickerText( Engine.Localize( CoD.FileshareUtility.GetCurrentCommunityMenuKicker() ) )
end

function FileshareSetCurrentCategory( f773_arg0, f773_arg1 )
	CoD.FileshareUtility.SetCurrentCategory( f773_arg1 )
end

function FileshareSetShowCreateButton( f774_arg0, f774_arg1 )
	CoD.FileshareUtility.SetShowCreateButton( f774_arg1 )
end

function FileshareDownloadSummary( f775_arg0, f775_arg1, f775_arg2 )
	if Engine.CurrentSessionMode() == Enum.eModes.MODE_INVALID then
		return 
	end
	local f775_local0 = f775_arg1:getModel()
	if f775_local0 then
		local f775_local1 = Engine.GetModelValue( Engine.GetModel( f775_local0, "fileId" ) )
		local f775_local2 = Engine.GetModelValue( Engine.GetModel( f775_local0, "fileSummarySize" ) )
		local f775_local3 = Engine.GetModelValue( Engine.GetModel( f775_local0, "isPooled" ) )
		local f775_local4 = Enum.fileShareLocation.FILESHARE_LOCATION_USERSTORAGE
		if f775_local3 then
			f775_local4 = Enum.fileShareLocation.FILESHARE_LOCATION_POOLEDSTORAGE
		end
		Engine.FileshareDownloadSummary( f775_arg2, f775_local1, f775_local2, f775_local4 )
	end
end

function FileshareAbortSummaryDownload( f776_arg0, f776_arg1, f776_arg2 )
	
end

function FileshareHandleDownloadSummary( f777_arg0, f777_arg1, f777_arg2, f777_arg3 )
	local f777_local0 = f777_arg0:getModel()
	if f777_local0 then
		CoD.FileshareUtility.SetupFileShareSummary( f777_local0, f777_arg3 )
	end
end

function FileshareDownloadScreenshot( f778_arg0, f778_arg1 )
	if f778_arg1 == nil then
		f778_arg1 = 1000
	end
	local f778_local0 = DataSources.FileshareSelectedItem.getModel()
	if f778_local0 then
		local f778_local1 = CoD.SafeGetModelValue( f778_local0, "fileId" )
		if not f778_local1 then
			f778_local1 = Engine.DefaultID64Value()
		end
		if f778_local1 ~= CoD.currentScreenshot then
			FileshareDestroyScreenshot( f778_arg0 )
			local f778_local2 = CoD.SafeGetModelValue( f778_local0, "fileSize" ) or 0
			if f778_local1 ~= Engine.DefaultID64Value() then
				Engine.DownloadScreenshot( f778_arg0, f778_local1, f778_local2, f778_arg1 )
				CoD.currentScreenshot = f778_local1
			end
		end
	end
end

function FileshareDestroyScreenshot( f779_arg0 )
	if CoD.currentScreenshot then
		Engine.DestroyScreenshot( f779_arg0 )
		CoD.currentScreenshot = nil
	end
end

function FileshareBookmarkRecentGame( f780_arg0 )
	local f780_local0 = CoD.GetPlayerStats( f780_arg0 )
	local f780_local1 = f780_local0.AfterActionReportStats.demoFileID:get()
	if f780_local1 ~= nil and f780_local1 ~= "0" then
		Engine.BookmarkRecentGame( f780_arg0, f780_local1 )
		CoD.OverlayUtility.ShowToast( "RecentGameBookmarked", Engine.ToUpper( Engine.Localize( "MENU_NOTICE" ) ), Engine.Localize( "MENU_GAME_BOOKMARKED" ), "uie_bookmark" )
	end
end

function SetFileshareShowcaseKickerText( f781_arg0 )
	local f781_local0 = Engine.GetXUID64( f781_arg0 )
	local f781_local1 = Engine.ToUpper( Engine.Localize( "MENU_SHOWCASE" ) )
	if FileshareGetShowcasePublishMode( f781_arg0 ) == true then
		Engine.ToUpper( Engine.Localize( "MENU_PUBLISH" ) )
	end
	if f781_local0 == CoD.FileshareUtility.GetCurrentUser() then
		f781_local1 = Engine.ToUpper( Engine.Localize( "MENU_MEDIA_MYSHOWCASE" ) )
	end
	if CoD.FileshareUtility.GetIsGroupsMode( f781_arg0 ) then
		f781_local1 = Engine.ToUpper( Engine.Localize( "GROUPS_GROUP_HEADQUARTERS_CAPS" ) )
	end
	SetHeadingKickerText( f781_local1 )
end

function SetIsInFileshare( f782_arg0, f782_arg1 )
	local f782_local0 = false
	if f782_arg1 and f782_arg1 == "true" then
		f782_local0 = true
	end
	CoD.perController[f782_arg0].inFileshare = f782_local0
end

function FileshareSetIsInFullscreenView( f783_arg0, f783_arg1 )
	CoD.FileshareUtility.SetIsFullscreenMode( f783_arg0, f783_arg1 )
end

function FileshareSetShowcasePublishMode( f784_arg0, f784_arg1 )
	local f784_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareRoot", false ), "PublishMode", false )
	local f784_local1 = 0
	if f784_arg1 == true then
		f784_local1 = 1
	end
	Engine.SetModelValue( f784_local0, f784_local1 )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" ), "secondaryListSelected" ), false )
end

function FileshareGetShowcasePublishMode( f785_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareRoot", false ), "PublishMode", false ) ) == 1
end

function FileshareToggleDetailsHiddenMode( f786_arg0 )
	local f786_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareRoot", false ), "DetailsHiddenMode", false )
	Engine.SetModelValue( f786_local0, Negate( Engine.GetModelValue( f786_local0 ) or 0 ) )
end

function FileshareResetDetailsHiddenMode( f787_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareRoot", false ), "DetailsHiddenMode", false ), 0 )
end

function FileshareGetDetailsHiddenMode( f788_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareRoot", false ), "DetailsHiddenMode", false ) ) == 1
end

function FileshareRecordSaveEvent( f789_arg0 )
	local f789_local0 = CoD.FileshareUtility.GetCurrentCategory()
	local f789_local1 = Engine.FileshareGetQuota( f789_arg0, f789_local0 )
	if not f789_local1 then
		return 
	elseif f789_local0 == "screenshot_private" then
		LUI.CoDMetrics.ScreenshotEvent( f789_arg0, "save", f789_local0, f789_local1.categorySlotsUsed, f789_local1.categoryQuota )
	elseif f789_local0 == "clip_private" then
		LUI.CoDMetrics.ClipsEvent( f789_arg0, "save", f789_local0, f789_local1.categorySlotsUsed, f789_local1.categoryQuota )
	end
end

function FileshareRecordPublishEvent( f790_arg0 )
	local f790_local0 = CoD.FileshareUtility.GetCurrentCategory()
	if f790_local0 == "screenshot_private" then
		f790_local0 = "screenshot"
	elseif f790_local0 == "clip_private" then
		f790_local0 = "clip"
	end
	local f790_local1 = Engine.FileshareGetQuota( f790_arg0, f790_local0 )
	if not f790_local1 then
		return 
	else
		LUI.CoDMetrics.FileshareEvent( f790_arg0, "publish", f790_local0, f790_local1.categorySlotsUsed, f790_local1.categoryQuota )
	end
end

function FileshareMoveToNextItem( f791_arg0, f791_arg1, f791_arg2, f791_arg3 )
	if FileshareDetailsViewCanMoveToNext( f791_arg2 ) then
		FileshareUpdateDetailsViewModel( f791_arg0, f791_arg1, f791_arg2, CoD.FileshareUtility.GetSelectedItemProperty( "codeIndex" ) + 1 )
	end
end

function FileshareMoveToPreviousItem( f792_arg0, f792_arg1, f792_arg2 )
	if FileshareDetailsViewCanMoveToPrevious( f792_arg2 ) then
		FileshareUpdateDetailsViewModel( f792_arg0, f792_arg1, f792_arg2, CoD.FileshareUtility.GetSelectedItemProperty( "codeIndex" ) - 1 )
	end
end

function FileshareShowErrorToast( f793_arg0, f793_arg1, f793_arg2 )
	CoD.FileshareUtility.ShowSimpleToast( f793_arg2, CoD.FileshareUtility.ToastTypes.ERROR )
end

function FileshareLikeVoteSuccessHandler( f794_arg0, f794_arg1, f794_arg2 )
	CoD.FileshareUtility.ShowToast( f794_arg1, CoD.FileshareUtility.ToastTypes.LIKE )
end

function FileshareDisikeVoteSuccessHandler( f795_arg0, f795_arg1, f795_arg2 )
	CoD.FileshareUtility.ShowToast( f795_arg1, CoD.FileshareUtility.ToastTypes.DISLIKE )
end

function FileshareShowPublishSuccessToast( f796_arg0, f796_arg1, f796_arg2 )
	CoD.FileshareUtility.ShowToast( f796_arg2, CoD.FileshareUtility.ToastTypes.PUBLISH )
end

function FileshareShowUploadSuccessToast( f797_arg0, f797_arg1, f797_arg2 )
	CoD.FileshareUtility.ShowToast( f797_arg2, CoD.FileshareUtility.ToastTypes.UPLOAD )
end

function FileshareShowDeleteSuccessToast( f798_arg0, f798_arg1, f798_arg2 )
	CoD.FileshareUtility.ShowToast( f798_arg2, CoD.FileshareUtility.ToastTypes.DELETE )
end

function FileshareShowDownloadSuccessToast( f799_arg0, f799_arg1, f799_arg2 )
	CoD.FileshareUtility.ShowToast( f799_arg2, CoD.FileshareUtility.ToastTypes.DOWNLOAD )
end

function FileshareShowReadonlyToast( f800_arg0, f800_arg1, f800_arg2 )
	CoD.FileshareUtility.ShowSimpleToast( f800_arg2, CoD.FileshareUtility.ToastTypes.READONLY )
end

function CloseLocalScreenshots( f801_arg0 )
	FileshareDestroyScreenshot( f801_arg0 )
	CoD.perController[f801_arg0].combatRecordProfileSnapshot = false
	CombatRecordProfileSnapshotDownloadScreenshot( f801_arg0 )
end

function GetMediaManagerCategoryList()
	return CoD.FileshareUtility.MediaManagerTabs
end

function GetMediaManagerCategoryCount()
	return #CoD.FileshareUtility.MediaManagerTabs
end

function SetIsMediaManager( f804_arg0, f804_arg1, f804_arg2, f804_arg3, f804_arg4 )
	if f804_arg3 then
		local f804_local0 = 0
		if f804_arg3 == "true" then
			f804_local0 = 1
		end
		Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false ), "isMediaManager", false ), f804_local0 )
	end
end

function MediaManagerMarkDirty( f805_arg0 )
	local f805_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false ), "dirty", false )
	ForceNotifyGlobalModel( f805_arg0, "MediaManager.dirty" )
	MediaManagerUpdateSlotsUsed( f805_arg0, CoD.perController[f805_arg0].selectedMediaManagerTab )
end

function MediaManagerClearPaintjob( f806_arg0, f806_arg1, f806_arg2, f806_arg3, f806_arg4 )
	CoD.CraftUtility.PaintjobClear( f806_arg0, f806_arg1, f806_arg2, f806_arg3, f806_arg4 )
end

function MediaManagerClearVariant( f807_arg0, f807_arg1, f807_arg2, f807_arg3, f807_arg4 )
	CoD.CraftUtility.GunsmithClear( f807_arg0, f807_arg1, f807_arg2, f807_arg3, f807_arg4 )
end

function MediaManagerClearEmblem( f808_arg0, f808_arg1, f808_arg2, f808_arg3, f808_arg4 )
	CoD.CraftUtility.EmblemClear( f808_arg0, f808_arg1, f808_arg2, f808_arg3, f808_arg4 )
end

function MediaManagerClearCustomGame( f809_arg0, f809_arg1, f809_arg2, f809_arg3, f809_arg4 )
	CoD.OverlayUtility.CreateOverlay( f809_arg2, f809_arg4, "CustomGameClearConfirmationOverlay" )
end

function MediaManagerDeleteTheaterFile( f810_arg0, f810_arg1, f810_arg2, f810_arg3, f810_arg4 )
	Engine.SetModelValue( CoD.FileshareUtility.GetDeletingModel(), Enum.FileshareTaskUIState.FILESHARE_TASK_UI_IDLE )
	f810_arg4.m_leaveParentOpenAfterDelete = leaveParentOpen
	OpenPopup( f810_arg4, "MediaManagerDeleteTheaterFile", f810_arg2 )
end

function MediaManagerTabChanged( f811_arg0, f811_arg1, f811_arg2 )
	CoD.perController[f811_arg2].selectedMediaManagerTab = f811_arg1.fileshareCategory
	MediaManagerUpdateSlotsUsed( f811_arg2, f811_arg1.fileshareCategory )
	CoD.FileshareUtility.SetCurrentCategory( f811_arg1.fileshareCategory )
	MediaManagerMarkDirty( f811_arg2 )
end

function MediaManagerClearDisplay( f812_arg0, f812_arg1, f812_arg2 )
	if CoD.FileshareUtility.IsCategoryFilm( f812_arg2, f812_arg1 ) or CoD.FileshareUtility.IsCategoryClip( f812_arg2, f812_arg1 ) or CoD.FileshareUtility.IsCategoryScreenshot( f812_arg2, f812_arg1 ) or CoD.FileshareUtility.IsCategoryCustomGames( f812_arg2, f812_arg1 ) then
		return 
	else
		CoD.CraftUtility.Fileshare.ClearDisplay( f812_arg2 )
	end
end

function MediaManagerPaintjobFocusChanged( f813_arg0, f813_arg1, f813_arg2 )
	local f813_local0 = f813_arg1:getModel( f813_arg2, "paintjobSlotAndIndex" )
	local f813_local1 = Engine.GetModelValue( f813_local0 )
	Engine.SetModelValue( f813_local0, f813_local1 )
	CoD.SetCustomization( f813_arg2, Engine.GetModelValue( f813_arg1:getModel( f813_arg2, "weaponIndex" ) ), "weapon_index" )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f813_arg2 ), "MediaManagerSelectedPaintjob" ), "paintjobSlotAndIndex" ), f813_local1 )
	MediaManagerSetSlotModel( f813_arg2, false, Engine.GetModelValue( f813_arg1:getModel( f813_arg2, "createTime" ) ), Engine.GetModelValue( f813_arg1:getModel( f813_arg2, "authorName" ) ) )
end

function MediaManagerVariantFocusChanged( f814_arg0, f814_arg1, f814_arg2 )
	CoD.SetCustomization( f814_arg2, Engine.GetModelValue( f814_arg1:getModel( f814_arg2, "weaponIndex" ) ), "weapon_index" )
	MediaManagerSetSlotModel( f814_arg2, false, Engine.GetModelValue( f814_arg1:getModel( f814_arg2, "createTime" ) ), Engine.GetModelValue( f814_arg1:getModel( f814_arg2, "authorName" ) ) )
end

function MediaManagerEmblemFocusChanged( f815_arg0, f815_arg1, f815_arg2 )
	CoD.SetCustomization( f815_arg2, Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM, "type" )
	CoD.perController[f815_arg2].selectedEmblemModel = f815_arg1:getModel()
	Engine.SetupEmblemData( f815_arg2, Engine.GetModelValue( f815_arg1:getModel( f815_arg2, "emblemIndex" ) ), CoD.perController[f815_arg2].selectedEmblemTabStorageType )
	MediaManagerSetSlotModel( f815_arg2, false, Engine.GetModelValue( f815_arg1:getModel( f815_arg2, "createTime" ) ), Engine.GetModelValue( f815_arg1:getModel( f815_arg2, "authorName" ) ) )
end

function MediaManagerCustomGameFocusChanged( f816_arg0, f816_arg1, f816_arg2 )
	SetSelectedCustomGame( f816_arg1, f816_arg2 )
	MediaManagerSetSlotModel( f816_arg2, false, "", "" )
end

function MediaManagerTheaterFileFocusChanged( f817_arg0, f817_arg1, f817_arg2 )
	MediaManagerSetSlotModel( f817_arg2, false, "", "" )
	FileshareSetSelectedItem( f817_arg0, f817_arg1, f817_arg2, "" )
end

function MediaManagerBuyMoreSlotOnFocus( f818_arg0, f818_arg1, f818_arg2 )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false ), "isBuyMoreSlot", false ), true )
end

function OpenMediaManager( f819_arg0, f819_arg1, f819_arg2, f819_arg3, f819_arg4 )
	CoD.FileshareUtility.SetPreviousCategory( CoD.FileshareUtility.GetCurrentCategory() )
	CoD.FileshareUtility.SetCurrentCategory( f819_arg3 )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false ), "previousWeaponIndex", false ), CoD.GetCustomization( f819_arg2, "weapon_index" ) )
	MediaManagerClearDisplay( f819_arg0, f819_arg1, f819_arg2 )
	OpenOverlay( f819_arg0, "MediaManager", f819_arg2 )
end

function GoBackAndOpenMediaManagerOnParent( f820_arg0, f820_arg1, f820_arg2, f820_arg3, f820_arg4 )
	CoD.FileshareUtility.SetPreviousCategory( CoD.FileshareUtility.GetCurrentCategory() )
	if f820_arg3 ~= nil and f820_arg3 ~= "" then
		CoD.FileshareUtility.SetCurrentCategory( f820_arg3 )
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false ), "previousWeaponIndex", false ), CoD.GetCustomization( f820_arg2, "weapon_index" ) )
	MediaManagerClearDisplay( f820_arg0, f820_arg1, f820_arg2 )
	GoBackAndOpenOverlayOnParent( f820_arg0, "MediaManager", f820_arg2 )
end

function MediaManagerClose( f821_arg0, f821_arg1, f821_arg2 )
	if CoD.perController[f821_arg2].wasGunsmithVariantModelNil then
		CoD.perController[f821_arg2].gunsmithVariantModel = nil
		CoD.perController[f821_arg2].wasGunsmithVariantModelNil = nil
	end
	if CoD.perController[f821_arg2].wasSelectedPaintjobModelNil then
		CoD.perController[f821_arg2].selectedpaintjobModel = nil
		CoD.perController[f821_arg2].wasSelectedPaintjobModelNil = nil
	end
	local f821_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false ), "previousWeaponIndex", false )
	CoD.FileshareUtility.SetCurrentCategory( CoD.FileshareUtility.GetPreviousCategory() )
	CoD.FileshareUtility.SetDirty()
	CoD.SetCustomization( f821_arg2, Engine.GetModelValue( f821_local0 ), "weapon_index" )
	CoD.CraftUtility.Gunsmith.DisplayBaseWeapon( f821_arg0, f821_arg1, f821_arg2 )
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetModelForController( f821_arg2 ), "Gunsmith.VariantList.ForceUpdate" ) )
end

function MediaManagerReloadWeaponModelIfNeeded( f822_arg0 )
	local f822_local0 = CoD.perController[f822_arg0].gunsmithVariantModel
	if f822_local0 then
		Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f822_arg0 ), "Gunsmith.Mode" ), Enum.GunsmithMode.GUNSMITHMODE_VARIANTS )
		CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f822_arg0, f822_local0 )
	end
	local f822_local1 = CoD.perController[f822_arg0].selectedpaintjobModel
	if f822_local1 then
		Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f822_arg0 ), "Paintshop.Mode" ), Enum.PaintshopMode.PAINTSHOPMODE_PAINTJOBS )
		CoD.perController[f822_arg0].viewIndex = 1
		local f822_local2 = CoD.Paintshop.View[CoD.perController[f822_arg0].viewIndex].customization_type
		CoD.CraftUtility.Gunsmith.DisplayWeaponWithPaintjob( f822_arg0, Engine.GetModelValue( Engine.GetModel( f822_local1, "paintjobIndex" ) ), Engine.GetModelValue( Engine.GetModel( f822_local1, "paintjobSlot" ) ) )
	end
end

function MediaManagerFetchEmblemsData( f823_arg0 )
	CoD.CraftUtility.Emblems.CachedEmblems = {}
	CoD.CraftUtility.Emblems.CachedEmblemIndexMapping = {}
	CoD.perController[f823_arg0].selectedEmblemTabStorageType = Enum.StorageFileType.STORAGE_EMBLEMS
	local f823_local0 = CoD.CraftUtility.Emblems.ParseDDL( f823_arg0, CoD.perController[f823_arg0].selectedEmblemTabStorageType )
end

function MediaManagerUpdateLocalData( f824_arg0 )
	MediaManagerFetchPaintjobsData( f824_arg0 )
	MediaManagerFetchVariantsData( f824_arg0 )
	MediaManagerFetchEmblemsData( f824_arg0 )
end

function PaintjobSelector_GainFocus( f825_arg0, f825_arg1, f825_arg2 )
	CoD.perController[f825_arg2].selectedpaintjobModel = f825_arg1:getModel()
	CoD.perController[f825_arg2].viewIndex = 1
	local f825_local0 = CoD.Paintshop.View[CoD.perController[f825_arg2].viewIndex].customization_type
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithPaintjob( f825_arg2, Engine.GetModelValue( f825_arg1:getModel( f825_arg2, "paintjobIndex" ) ), Engine.GetModelValue( f825_arg1:getModel( f825_arg2, "paintjobSlot" ) ) )
end

function PaintjobSelector_ChoosePaintjob( f826_arg0, f826_arg1, f826_arg2 )
	local f826_local0 = f826_arg1:getModel( f826_arg2, "paintjobSlot" )
	local f826_local1 = f826_arg1:getModel( f826_arg2, "paintjobIndex" )
	CoD.perController[f826_arg2].selectedpaintjobModel = f826_arg1:getModel()
	if f826_local0 and f826_local1 then
		Engine.SetupPaintjobData( f826_arg2, Engine.GetModelValue( f826_local0 ), Engine.GetModelValue( f826_local1 ) )
	end
	CoD.perController[f826_arg2].viewIndex = 1
	local f826_local2 = CoD.Paintshop.View[CoD.perController[f826_arg2].viewIndex].view_name
	local f826_local3 = CoD.Paintshop.View[CoD.perController[f826_arg2].viewIndex].customization_type
	local f826_local4 = CoD.Paintshop.View[CoD.perController[f826_arg2].viewIndex].view_string_ref
	CoD.SetCustomization( f826_arg2, f826_local3, "type" )
	CoD.SetCustomization( f826_arg2, f826_local4, "view_string_ref" )
	Engine.SetupEmblemEditBuffer( f826_arg2, f826_local3, CoD.GetCustomization( f826_arg2, "weapon_index" ) )
	CoD.CraftUtility.DisplayWeaponInPaintshop( f826_arg2, f826_local2 )
	Engine.SendMenuResponse( f826_arg2, "paintshop_light", "far" )
	CoD.SetEditorProperties( f826_arg2, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE, "editorMode" )
end

function FileshareOpenPreviousPublishMenu( f827_arg0, f827_arg1, f827_arg2, f827_arg3 )
	local f827_local0 = CoD.FileshareUtility.GetCurrentCategory()
	if f827_local0 == "paintjob" then
		CoD.CraftUtility.OpenPublishPromptPaintjob( f827_arg0, f827_arg1, f827_arg2, nil, f827_arg3 )
	elseif f827_local0 == "emblem" then
		CoD.CraftUtility.OpenPublishPromptEmblem( f827_arg0, f827_arg1, f827_arg2, nil, f827_arg3 )
	elseif f827_local0 == "variant" then
		CoD.CraftUtility.OpenPublishPromptGunsmith( f827_arg0, f827_arg1, f827_arg2, nil, f827_arg3 )
	end
end

function FileshareOpenFullscreenView( f828_arg0, f828_arg1, f828_arg2, f828_arg3 )
	if f828_arg1.gridInfoTable then
		CoD.FileshareUtility.ReportView( f828_arg2, f828_arg1.gridInfoTable.zeroBasedIndex )
	end
	if FileshareIsCategory( f828_arg2, "screenshot_private" ) or FileshareIsCategory( f828_arg2, "screenshot" ) or IsFileshareCategoryScreenshot( f828_arg0, f828_arg1, f828_arg2 ) then
		CoD.Menu.ModelToUse = f828_arg1:getModel()
		OpenOverlay( f828_arg0, "Fileshare_ScreenshotDetailsView", f828_arg2 )
		CoD.Menu.ModelToUse = nil
	else
		OpenOverlay( f828_arg0, "Fileshare_DetailsView", f828_arg2 )
	end
end

function FilesharePublish( f829_arg0, f829_arg1, f829_arg2 )
	CoD.FileshareUtility.Publish( f829_arg0, f829_arg2 )
end

function FilesharePrivateUpload( f830_arg0, f830_arg1, f830_arg2 )
	CoD.FileshareUtility.PrivateUpload( f830_arg2 )
end

function FileshareDownload( f831_arg0, f831_arg1, f831_arg2 )
	CoD.FileshareUtility.Download( f831_arg2 )
end

function SteamWorkshopPublish( f832_arg0, f832_arg1, f832_arg2 )
	CoD.SteamWorkshopUtility.Publish( f832_arg0, f832_arg1, f832_arg2 )
end

function SteamWorkshopOpenAgreement( f833_arg0, f833_arg1, f833_arg2 )
	CoD.SteamWorkshopUtility.OpenAgreement( f833_arg0, f833_arg1, f833_arg2 )
end

function SteamWorkshopOpenFAQ( f834_arg0, f834_arg1, f834_arg2 )
	CoD.SteamWorkshopUtility.OpenFAQ( f834_arg0, f834_arg1, f834_arg2 )
end

function SteamWorkshopOpenItem( f835_arg0, f835_arg1, f835_arg2 )
	CoD.SteamWorkshopUtility.OpenItemOnSteam( f835_arg0, f835_arg1, f835_arg2 )
end

function SteamWorkshopViewWorkshop( f836_arg0, f836_arg1, f836_arg2 )
	CoD.SteamWorkshopUtility.ViewWorkshop( f836_arg0, f836_arg1, f836_arg2 )
end

function PaintjobSelector_ClearPaintjob( f837_arg0, f837_arg1, f837_arg2, f837_arg3 )
	local f837_local0 = CoD.perController[f837_arg2].selectedpaintjobModel
	CoD.CraftUtility.Paintjobs.ClearPaintjob( f837_arg2, Engine.GetModelValue( Engine.GetModel( f837_local0, "paintjobSlot" ) ), Engine.GetModelValue( Engine.GetModel( f837_local0, "paintjobIndex" ) ) )
	CoD.CraftUtility.Paintjobs.ParseDDL( f837_arg2, Enum.StorageFileType.STORAGE_PAINTJOBS )
	if IsMediaManager() == true then
		GoBackMultiple( f837_arg0, f837_arg2, 1 )
		MediaManagerMarkDirty( f837_arg2 )
	else
		local f837_local1 = GoBackMultiple( f837_arg0, f837_arg2, 2 )
		if f837_local1.paintjobSelector ~= nil then
			f837_local1.paintjobSelector.paintjobsList:updateDataSource( true )
			f837_local1.paintjobSelector.paintjobsList:setActiveItem( f837_local1.paintjobSelector.paintjobsList:getFirstSelectableItem() )
		end
	end
	if Engine.GetModel( Engine.GetModelForController( f837_arg2 ), "Paintshop.UpdateDataSource" ) ~= nil then
		ForceNotifyModel( f837_arg2, "Paintshop.UpdateDataSource" )
	end
end

function PaintjobSelector_CopyPaintjob( f838_arg0, f838_arg1, f838_arg2, f838_arg3, f838_arg4 )
	local f838_local0, f838_local1 = CoD.CraftUtility.Paintjobs.Copy( f838_arg2, f838_arg4:getModel() )
	if f838_local0 and f838_local1 then
		CoD.CraftUtility.Paintjobs.ParseDDL( f838_arg2, Enum.StorageFileType.STORAGE_PAINTJOBS )
		CoD.CraftUtility.InvalidateWCItemRender( f838_local0, f838_local1 )
		local f838_local2 = GoBack( f838_arg4, f838_arg2 )
		local f838_local3 = f838_local2.paintjobSelector.paintjobsList
		f838_local3:updateDataSource( true )
		local f838_local4 = f838_local3:findItem( {
			paintjobSlot = f838_local0,
			paintjobIndex = f838_local1
		} )
		if f838_local4 then
			f838_local3:setActiveItem( f838_local4 )
		end
		ForceNotifyModel( f838_arg2, "Paintshop.UpdateDataSource" )
	end
end

function PaintjobSelector_RenamePaintjob( f839_arg0, f839_arg1, f839_arg2 )
	local f839_local0 = f839_arg0:getModel()
	CoD.CraftUtility.Paintjobs.RenamePaintjob( f839_arg2, Engine.GetModelValue( Engine.GetModel( f839_local0, "paintjobSlot" ) ), Engine.GetModelValue( Engine.GetModel( f839_local0, "paintjobIndex" ) ), Engine.GetModelValue( Engine.GetModel( f839_local0, "paintjobName" ) ) )
end

function PaintjobSelector_HandleRenameKeyboardComplete( f840_arg0, f840_arg1, f840_arg2, f840_arg3 )
	local f840_local0 = f840_arg0:getModel()
	local f840_local1 = nil
	if not f840_local0 then
		return 
	elseif f840_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_PAINTJOB then
		f840_local1 = Engine.GetModel( f840_local0, "paintjobName" )
	end
	if f840_local1 then
		Engine.SetModelValue( f840_local1, f840_arg3.input )
	end
end

function PaintjobEditor_OpenSavePopup( f841_arg0, f841_arg1, f841_arg2, f841_arg3 )
	CoD.OverlayUtility.CreateOverlay( f841_arg2, f841_arg0, "PaintjobSave", CoD.perController[f841_arg2].selectedpaintjobModel )
end

function PaintjobEditor_ToggleGrid( f842_arg0, f842_arg1, f842_arg2, f842_arg3 )
	local f842_local0 = CoD.CraftUtility.GetGridTypeName( f842_arg2 )
	local f842_local1 = 0
	if not IsGridOn( f842_arg2, f842_local0 ) then
		f842_local1 = CoD.CraftUtility.GetGridSize( f842_arg2 )
	end
	SetProfileVar( f842_arg2, f842_local0, f842_local1 )
	Engine.ExecNow( f842_arg2, "emblemSetGridSize " .. CoD.GetCustomization( f842_arg2, "type" ) .. " " .. f842_local1 )
	EmblemEditor_BeginEdit( f842_arg0, f842_arg1, f842_arg2 )
	GoBack( f842_arg0, f842_arg2 )
end

function PaintjobEditor_RemoveGrid( f843_arg0 )
	Engine.ExecNow( f843_arg0, "emblemSetGridSize " .. CoD.GetCustomization( f843_arg0, "type" ) .. " 0" )
end

function PaintjobEditor_RestoreGridState( f844_arg0 )
	Engine.ExecNow( f844_arg0, "emblemSetGridSize " .. CoD.GetCustomization( f844_arg0, "type" ) .. " " .. Engine.GetProfileVarInt( f844_arg0, CoD.CraftUtility.GetGridTypeName( f844_arg0 ) ) )
end

function PaintjobEditor_ChangeViewRightBumper( f845_arg0, f845_arg1, f845_arg2 )
	local f845_local0 = CoD.CraftUtility.Paintjobs.GetNextViewIndex( f845_arg2 )
	CoD.perController[f845_arg2].viewIndex = f845_local0
	local f845_local1 = CoD.Paintshop.View[f845_local0].view_name
	local f845_local2 = CoD.Paintshop.View[f845_local0].customization_type
	local f845_local3 = CoD.Paintshop.View[f845_local0].view_string_ref
	CoD.SetCustomization( f845_arg2, f845_local2, "type" )
	CoD.SetCustomization( f845_arg2, f845_local3, "view_string_ref" )
	Engine.SetupEmblemEditBuffer( f845_arg2, f845_local2, CoD.GetCustomization( f845_arg2, "weapon_index" ) )
	CoD.CraftUtility.DisplayWeaponInPaintshop( f845_arg2, f845_local1 )
	f845_arg0.layerCarousel:updateDataSource()
end

function PaintjobEditor_ChangeViewLeftBumper( f846_arg0, f846_arg1, f846_arg2 )
	local f846_local0 = CoD.CraftUtility.Paintjobs.GetPrevViewIndex( f846_arg2 )
	CoD.perController[f846_arg2].viewIndex = f846_local0
	local f846_local1 = CoD.Paintshop.View[f846_local0].view_name
	local f846_local2 = CoD.Paintshop.View[f846_local0].customization_type
	local f846_local3 = CoD.Paintshop.View[f846_local0].view_string_ref
	CoD.SetCustomization( f846_arg2, f846_local2, "type" )
	CoD.SetCustomization( f846_arg2, f846_local3, "view_string_ref" )
	Engine.SetupEmblemEditBuffer( f846_arg2, f846_local2, CoD.GetCustomization( f846_arg2, "weapon_index" ) )
	CoD.CraftUtility.DisplayWeaponInPaintshop( f846_arg2, f846_local1 )
	f846_arg0.layerCarousel:updateDataSource()
end

function PaintjobEditor_HandleKeyboardComplete( f847_arg0, f847_arg1, f847_arg2, f847_arg3 )
	local f847_local0 = CoD.perController[f847_arg2].selectedpaintjobModel
	local f847_local1 = nil
	if not f847_local0 then
		return 
	elseif f847_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_PAINTJOB then
		f847_local1 = Engine.GetModel( f847_local0, "paintjobTextEntry" )
		if f847_local1 then
			Engine.SetModelValue( f847_local1, f847_arg3.input )
		end
		local f847_local2 = f847_arg0:getModel( f847_arg2, "inputText" )
		if f847_local2 then
			Engine.SetModelValue( f847_local2, f847_arg3.input )
		end
	end
end

function PaintjobEditor_SavePaintjob( f848_arg0, f848_arg1, f848_arg2, f848_arg3 )
	local f848_local0 = Engine.GetModelValue( Engine.GetModel( f848_arg3, "paintjobTextEntry" ) )
	local f848_local1 = Engine.GetModel( f848_arg3, "paintjobName" )
	local f848_local2 = MediaManagerGetQuotaForCategory( f848_arg2, "paintjob" )
	Engine.SetModelValue( f848_local1, f848_local0 )
	CoD.CraftUtility.Paintjobs.UploadPaintjob( f848_arg2, f848_arg3 )
	CoD.CraftUtility.Paintjobs.ParseDDL( f848_arg2, Enum.StorageFileType.STORAGE_PAINTJOBS )
	CoD.CraftUtility.Paintjobs.InvalidateRender( f848_arg2, f848_arg3 )
	PaintJobEditor_RecordComScoreEvent( f848_arg0, f848_arg2, f848_arg3, "save", f848_local2.categorySlotsUsed, f848_local2.categoryQuota )
	local f848_local3 = GoBack( f848_arg0, f848_arg2 )
	EmblemEditor_HandleBackInBrowseMode( f848_local3, f848_arg1, f848_arg2 )
	ClearSavedState( f848_local3, f848_arg2 )
end

function PaintjobEditor_DiscardChanges( f849_arg0, f849_arg1, f849_arg2, f849_arg3 )
	local f849_local0 = GoBack( f849_arg0, f849_arg2 )
	PaintJobEditor_RecordComScoreEvent( f849_arg0, f849_arg2, f849_arg3, "discard" )
	EmblemEditor_HandleBackInBrowseMode( f849_local0, f849_arg1, f849_arg2 )
	ClearSavedState( f849_local0, f849_arg2 )
end

function PaintjobEditor_SaveChangesBack( f850_arg0, f850_arg1, f850_arg2, f850_arg3 )
	if Engine.GetModelValue( Engine.GetModel( f850_arg3, "weaponIndex" ) ) == CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX then
		Engine.SetModelValue( Engine.GetModel( f850_arg3, "paintjobTextEntry" ), "Paintjob" )
	end
end

function HandleSocialMenuBack( f851_arg0, f851_arg1, f851_arg2 )
	if IsLobbyHost() and IsGlobalModelValueTrue( f851_arg1, f851_arg2, "SocialMainMenu.managePartySubListSelected" ) then
		return 
	elseif Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "socialRoot.tab" ) ) == "groups" then
		local f851_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f851_arg2 ), "groups.frameType" ) )
		if f851_local0 == "invites" or f851_local0 == "members" then
			GroupsSocialChangeTabFrameWidget( f851_arg0, f851_arg1, f851_arg2, "main" )
			return 
		end
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "socialRoot.tab" ), "friends" )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f851_arg2 ), "groups.highlightGroupsTabInSocial" ), false )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f851_arg2 ), "groups.frameType" ), "" )
	GoBack( f851_arg0, f851_arg2 )
	ClearSavedState( f851_arg0, f851_arg2 )
end

function SetSocialTab( f852_arg0, f852_arg1, f852_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" ), "tab" ), f852_arg1.tabId )
end

function FetchOnlineFriendsData( f853_arg0, f853_arg1, f853_arg2 )
	if "friends" == f853_arg1.tabId then
		Engine.UpdateFriends( f853_arg2, Enum.PresenceFilter.PRESENCE_FILTER_ONLINE_AND_IN_TITLE )
	end
end

function OpenPlatformProfile( f854_arg0, f854_arg1, f854_arg2, f854_arg3, f854_arg4 )
	local f854_local0 = Engine.GetModelForController( f854_arg2 )
	Engine.ShowPlatformProfile( f854_arg2, Engine.GetModelValue( Engine.CreateModel( f854_local0, "Social.selectedFriendXUID" ) ), Engine.GetModelValue( Engine.CreateModel( f854_local0, "Social.selectedFriendGamertag" ) ) )
end

function OpenPlatformFriendRequest( f855_arg0, f855_arg1, f855_arg2, f855_arg3, f855_arg4 )
	local f855_local0 = Engine.GetModelForController( f855_arg2 )
	Engine.ShowPlatformFriendRequest( f855_arg2, Engine.GetModelValue( Engine.CreateModel( f855_local0, "Social.selectedFriendXUID" ) ), Engine.GetModelValue( Engine.CreateModel( f855_local0, "Social.selectedFriendGamertag" ) ) )
end

function SocialJoin( f856_arg0, f856_arg1, f856_arg2, f856_arg3, f856_arg4 )
	CoD.CACUtility.ValidateMPLootWeapons( f856_arg2 )
	if Engine.IsInGame() then
		if not Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, f856_arg3.xuid ) then
			f856_arg3.migrating = not CoDShared.QuitGame( f856_arg2 )
			Engine.LobbyVM_CallFunc( "InGameJoin", f856_arg3 )
		end
	else
		Engine.LobbyVM_CallFunc( "Join", f856_arg3 )
	end
	GoBackToMenu( GoBack( f856_arg0, f856_arg2 ), f856_arg2, "Lobby" )
end

function CacheSocialOnlinePlayersListModels( f857_arg0, f857_arg1, f857_arg2 )
	local f857_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "socialRoot" )
	if Engine.GetModelValue( Engine.CreateModel( f857_local0, "tab" ) ) == "party" then
		local f857_local1 = Engine.GetUserPartyInfo( f857_arg2 )
		if f857_local1 ~= nil then
			local f857_local2 = Engine.CreateModel( f857_local0, "party" )
			Engine.SetModelValue( Engine.CreateModel( f857_local2, "available" ), f857_local1.available )
			if #f857_local1.members then
				for f857_local3 = 1, #f857_local1.members, 1 do
					Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( f857_local2, "pm_" .. f857_local3 ), "gamertag" ), f857_local1.members[f857_local3].gamertag )
				end
			end
		end
		return 
	end
	local f857_local1, f857_local2, f857_local6, f857_local3, f857_local4, f857_local5, f857_local7 = nil
	if f857_arg0.cacheRootModel ~= nil then
		f857_local1 = f857_arg0.cacheXuid
		f857_local2 = f857_arg0.cacheParty
		f857_local6 = f857_arg0.cachePartyUpdate
		f857_local7 = f857_arg0.cachePartyGamertags
		f857_local3 = f857_arg0.cachePartyTotal
		f857_local4 = f857_arg0.cachePartyAvailable
		f857_local5 = f857_arg0.cachePartyLeader
	else
		local f857_local8 = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" )
		f857_local1 = Engine.CreateModel( Engine.CreateModel( f857_local8, "cache" ), "xuid" )
		f857_local2 = Engine.CreateModel( f857_local8, "party" )
		f857_local6 = Engine.CreateModel( f857_local2, "update" )
		f857_local3 = Engine.CreateModel( f857_local2, "total" )
		f857_local4 = Engine.CreateModel( f857_local2, "available" )
		f857_local5 = Engine.CreateModel( f857_local2, "leader" )
		Engine.SetModelValue( f857_local1, Engine.StringToXUIDDecimal( "0" ) )
		f857_local7 = {}
		for f857_local9 = 1, 18, 1 do
			f857_local7[f857_local9] = Engine.CreateModel( Engine.CreateModel( f857_local2, "pm_" .. f857_local9 ), "gamertag" )
			Engine.SetModelValue( f857_local7[f857_local9], "" )
		end
	end
	Engine.SetModelValue( f857_local1, f857_arg1.xuid )
	Engine.SetModelValue( f857_local3, f857_arg1.party.total )
	Engine.SetModelValue( f857_local4, f857_arg1.party.available )
	Engine.SetModelValue( f857_local5, f857_arg1.party.leader )
	if f857_arg1.party ~= nil and f857_arg1.party.members ~= nil then
		for f857_local8 = 1, #f857_local7, 1 do
			local f857_local11 = f857_local7[f857_local8]
			if f857_arg1.party.members[f857_local8] ~= nil then
				Engine.SetModelValue( f857_local11, f857_arg1.party.members[f857_local8].gamertag )
			end
		end
		local f857_local8 = Engine.GetModelValue( f857_local6 )
		if f857_local8 < 100000 then
			f857_local8 = f857_local8 + 1
		else
			f857_local8 = 0
		end
		Engine.SetModelValue( f857_local6, f857_local8 )
	end
end

function CacheLobbyMemberPlayerInfoDetails( f858_arg0, f858_arg1, f858_arg2 )
	local f858_local0 = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" )
	local f858_local1 = Engine.GetModelValue( Engine.GetModel( f858_arg1:getModel(), "xuid" ) )
	local f858_local2 = Engine.CreateModel( f858_local0, "party" )
	local f858_local3 = Engine.GetLobbyMemberPartyInfo( f858_arg2, f858_local1 )
	if f858_local3 ~= nil then
		Engine.SetModelValue( Engine.CreateModel( f858_local2, "available" ), f858_local3.available )
		if #f858_local3.members then
			for f858_local4 = 1, #f858_local3.members, 1 do
				Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( f858_local2, "pm_" .. f858_local4 ), "gamertag" ), f858_local3.members[f858_local4].gamertag )
			end
		end
	end
end

function ShowcaseOpenPlayerDetails( f859_arg0, f859_arg1, f859_arg2 )
	ShowcaseSetSelectedFriendXUID( f859_arg0, f859_arg1, f859_arg2, true )
	GoBackAndOpenOverlayOnParent( f859_arg0, "Social_PlayerDetailsPopup", f859_arg2 )
end

function SetSelectedFriendXUID( f860_arg0, f860_arg1, f860_arg2 )
	local f860_local0 = nil
	if f860_arg1 ~= nil then
		local f860_local1 = f860_arg1:getModel( f860_arg2, "xuid" )
		if f860_local1 ~= nil then
			f860_local0 = Engine.GetModelValue( f860_local1 )
			local f860_local2 = Engine.GetModelForController( f860_arg2 )
			Engine.SetModelValue( Engine.CreateModel( f860_local2, "Social.selectedFriendXUID" ), f860_local0 )
			local f860_local3 = Engine.GetModelValue( f860_arg1:getModel( f860_arg2, "gamertag" ) )
			Engine.SetModelValue( Engine.CreateModel( f860_local2, "Social.selectedFriendGamertag" ), f860_local3 )
			if Engine.UInt64ToString( f860_local0 ) == "fefefefefefefefe" then
				local f860_local4 = Engine.CreateModel( Engine.GetModelForController( f860_arg2 ), "socialPlayerInfo.identityBadge" )
				Engine.SetModelValue( Engine.CreateModel( f860_local4, "gamertag" ), f860_local3 )
				Engine.SetModelValue( Engine.CreateModel( f860_local4, "clantag" ), "" )
			end
			local f860_local4 = f860_arg1:getModel( f860_arg2, "activity" )
			if f860_local4 ~= nil then
				Engine.SetModelValue( Engine.CreateModel( f860_local2, "Social.selectedFriendInTitle" ), Engine.GetModelValue( f860_local4 ) > Enum.PresenceActivity.PRESENCE_ACTIVITY_ONLINE_NOT_IN_TITLE )
			end
			Engine.SetModelValue( Engine.CreateModel( f860_local2, "Social.hideSelectedFriendShowcase" ), false )
		end
	end
end

function SocialToggleSorting( f861_arg0, f861_arg1, f861_arg2 )
	local f861_local0 = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" ), "sort" )
	local f861_local1 = Engine.GetModelValue( f861_local0 )
	if f861_local1 == Enum.PresenceSorting.PRESENCE_SORTING_ONLINE_MOST_RECENT then
		Engine.SetModelValue( f861_local0, Enum.PresenceSorting.PRESENCE_SORTING_ALPHABETICAL )
		Engine.SortFriends( f861_arg2, Enum.PresenceSorting.PRESENCE_SORTING_ALPHABETICAL )
	elseif f861_local1 == Enum.PresenceSorting.PRESENCE_SORTING_ALPHABETICAL then
		Engine.SetModelValue( f861_local0, Enum.PresenceSorting.PRESENCE_SORTING_ONLINE_MOST_RECENT )
		Engine.SortFriends( f861_arg2, Enum.PresenceSorting.PRESENCE_SORTING_ONLINE_MOST_RECENT )
	end
end

function SocialEnablePresenceCacheAutoupdate( f862_arg0, f862_arg1 )
	if Engine.EnablePresenceCacheAutoupdate ~= nil then
		Engine.EnablePresenceCacheAutoupdate( f862_arg0, f862_arg1 )
	end
end

function UpdateFriends( f863_arg0, f863_arg1, f863_arg2 )
	local f863_local0 = f863_arg0
	Engine.UpdateFriends( f863_arg2, Enum.PresenceFilter.PRESENCE_FILTER_ONLINE_AND_IN_TITLE )
end

function SetFriendsTabName( f864_arg0, f864_arg1, f864_arg2 )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f864_arg2 ), "friends" ), "tab" ), f864_arg1.tabId )
end

function UpdateFriendsData( f865_arg0, f865_arg1, f865_arg2 )
	if "friends" == f865_arg1.tabId then
		Engine.UpdateFriends( f865_arg2, 2 )
	elseif f865_arg1.tabId == "inbox" then
		Engine.UpdateMessages( f865_arg2, 1 )
	end
end

function FriendsInboxOnMessageClick( f866_arg0, f866_arg1, f866_arg2 )
	if Engine.GetModelValue( f866_arg1:getModel( f866_arg2, "xuid" ) ) ~= nil then
		Engine.ReadMessages( f866_arg2, 0 )
	end
end

function SetPrimaryGroup( f867_arg0, f867_arg1, f867_arg2 )
	local f867_local0 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f867_arg2].selectedGroup, "groupId" ) )
	local f867_local1 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f867_arg2].selectedGroup, "name" ) )
	Engine.SetPrimaryGroup( f867_arg2, f867_local0 )
	Engine.SetPrimaryGroupName( f867_arg2, f867_local1 )
	OpenGenericSmallPopup( f867_arg0:getParentMenu(), f867_arg2, "GROUPS_NOTICE_CAPS", "GROUPS_PRIMARY_GROUP_SET", nil, "MENU_OK", nil, nil )
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetModelForController( f867_arg2 ), "groups.groupCount_self" ) )
	GoBack( f867_arg0, f867_arg2 )
end

function GroupInvitesGoBack( f868_arg0, f868_arg1, f868_arg2 )
	local f868_local0 = function ( f869_arg0, f869_arg1, f869_arg2 )
		Engine.ClearLastGroupSearchResults( f869_arg2 )
		GoBack( f869_arg0, f869_arg2 )
	end
	
	if Engine.FetchingGroupPublicProfiles() then
		OpenGroupsNotifyPopup( f868_arg0, f868_arg1, f868_arg2, true, "fetch_profiles_task_complete", f868_local0, true, f868_local0 )
	else
		f868_local0( f868_arg0, f868_arg1, f868_arg2 )
	end
end

function GetProcessingGroupTaskModel( f870_arg0 )
	return Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f870_arg0 ), "groups" ), "processingTask" )
end

function GetCloseAutomaticallyModelForGroupsNotifyPoup( f871_arg0 )
	return Engine.GetModel( Engine.GetModelForController( f871_arg0 ), "groups.closeAutomaticallyAfterEvent" )
end

function ProcessGroupApplication( f872_arg0, f872_arg1, f872_arg2 )
	local f872_local0 = "GROUPS_JOIN_REQUEST_CAPS"
	local f872_local1 = "GROUPS_ACCEPT_JOIN_REQUEST"
	local f872_local2 = f872_arg0:getParentMenu()
	f872_local2:OpenModalDialog( f872_arg0, f872_arg2, f872_local0, f872_local1, {
		"MENU_ACCEPT",
		"GROUPS_REJECT_JOIN_REQUEST",
		"MENU_CANCEL"
	}, function ( f873_arg0 )
		if f872_arg1:getModel() and f872_arg1:getModel( f872_arg2, "xuid" ) then
			local f873_local0 = Engine.GetModelValue( f872_arg1:getModel( f872_arg2, "xuid" ) )
			if f873_arg0 == 0 then
				Engine.AcceptSelectedGroupApplication( f872_arg2, f873_local0 )
				OpenGroupsNotifyPopup( f872_arg0, f872_arg1, f872_arg2, true, "accept_application_task_complete" )
			elseif f873_arg0 == 1 then
				Engine.RejectSelectedGroupApplication( f872_arg2, f873_local0 )
				OpenGroupsNotifyPopup( f872_arg0, f872_arg1, f872_arg2, true, "reject_application_task_complete" )
			end
		end
		return true
	end )
end

function ProcessLeaveSelectedGroup( f874_arg0, f874_arg1, f874_arg2, f874_arg3 )
	local f874_local0 = "GROUPS_LEAVE_GROUP_CAPS"
	local f874_local1 = "GROUPS_LEAVE_SELECTED_GROUP_TITLE"
	local f874_local2 = false
	if IsGroupOwner( f874_arg2 ) then
		f874_local0 = "GROUPS_DELETE_GROUP_CAPS"
		f874_local1 = "GROUPS_DELETE_SELECTED_GROUP_TITLE"
		f874_local2 = true
	end
	local f874_local3 = f874_arg0:getParentMenu()
	f874_local3:OpenModalDialog( f874_arg0, f874_arg2, f874_local0, f874_local1, {
		"MPUI_NO",
		"MPUI_YES"
	}, function ( f875_arg0 )
		if f875_arg0 == 1 then
			if not f874_local2 and IsGroupOwner( f874_arg2 ) then
				ProcessLeaveSelectedGroup( f874_local3, f874_arg1, f874_arg2, f874_arg3 )
				return true
			end
			local f875_local0 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f874_arg2].selectedGroup, "groupId" ) )
			Engine.LeaveGroup( f874_arg2, f875_local0 )
			OpenGroupsNotifyPopup( f874_arg0, f874_arg1, f874_arg2, true, "leave_group_task_complete", function ( f876_arg0, f876_arg1, f876_arg2 )
				Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f876_arg2 ), "groups.highlightGroupsTabInSocial" ), true )
				LUI.CoDMetrics.LeaveGroupEvent( f876_arg2, f875_local0, f874_local2 )
				ClearSelectedGroup( f876_arg0, f876_arg1, f876_arg2 )
				if not f874_arg3 then
					GoBack( f874_local3, f876_arg2 )
				end
			end )
		end
		return true
	end )
end

function OpenGroupOptionsPopup( f877_arg0, f877_arg1, f877_arg2 )
	OpenPopup( f877_arg0, "GroupOptions", f877_arg2 )
end

function OpenGroupFriendsPopup( f878_arg0, f878_arg1, f878_arg2 )
	Engine.FilterFriendsInGroup( f878_arg2, Engine.GetModelValue( f878_arg1:getModel( f878_arg2, "groupId" ) ) )
	OpenPopup( f878_arg0, "GroupFriends", f878_arg2 )
end

function OpenGroupAdminOptionsPopupForGroupMember( f879_arg0, f879_arg1, f879_arg2 )
	OpenPopup( f879_arg0, "GroupAdminOptions", f879_arg2 )
end

function SetGroupInvitePlayerModels( f880_arg0, f880_arg1, f880_arg2 )
	if not f880_arg1:getModel() then
		return 
	end
	local f880_local0 = f880_arg1:getModel( f880_arg2, "sentByXuid" )
	if f880_local0 then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f880_arg2 ), "groups.groupInvites.sentByXuid" ), Engine.GetModelValue( f880_local0 ) )
	end
	local f880_local1 = f880_arg1:getModel( f880_arg2, "sentByGamertag" )
	if f880_local1 then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f880_arg2 ), "groups.groupInvites.sentByGamertag" ), Engine.GetModelValue( f880_local1 ) )
	end
end

function OpenGroupsInviteConfirmation( f881_arg0, f881_arg1, f881_arg2 )
	local f881_local0 = f881_arg0
	if not f881_local0.menuName then
		f881_local0 = f881_arg0:getParentMenu()
	end
	if f881_arg1:getModel() and f881_arg1:getModel( f881_arg2, "groupId" ) then
		local f881_local1 = Engine.GetModelValue( f881_arg1:getModel( f881_arg2, "groupId" ) )
		local f881_local2 = Engine.GetModelValue( f881_arg1:getModel( f881_arg2, "groupName" ) )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f881_arg2 ), "groups.selectedGroup.groupId" ), f881_local1 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f881_arg2 ), "groups.selectedGroup.groupName" ), f881_local2 )
		CoD.OverlayUtility.CreateOverlay( f881_arg2, f881_local0, "GroupsInviteConfirmation", f881_arg2 )
	end
end

function ShowReportGroupDialog( f882_arg0, f882_arg1, f882_arg2, f882_arg3, f882_arg4 )
	local f882_local0 = nil
	if CoD.perController[f882_arg2].selectedGroup then
		f882_local0 = Engine.GetModel( CoD.perController[f882_arg2].selectedGroup, "groupId" )
	else
		f882_local0 = Engine.GetModel( Engine.GetModelForController( f882_arg2 ), "groups.selectedGroup.groupId" )
	end
	CoD.OverlayUtility.CreateOverlay( f882_arg2, f882_arg4, "ReportGroup", f882_arg2, f882_arg1, {
		controller = f882_arg2,
		groupId = Engine.GetModelValue( f882_local0 )
	} )
end

function AcceptGroupInvite( f883_arg0, f883_arg1, f883_arg2 )
	local f883_local0 = Engine.GetModel( Engine.GetModelForController( f883_arg2 ), "groups.selectedGroup.groupId" )
	if f883_local0 then
		Engine.AcceptGroupInvite( f883_arg2, Engine.GetModelValue( f883_local0 ) )
		OpenGroupsNotifyPopup( f883_arg0, f883_arg1, f883_arg2, true, "groupsFetched", function ()
			CoD.OverlayUtility.ShowToast( "Invite", Engine.Localize( "GROUPS_INVITE_ACCEPTED" ), "", LuaEnums.INVITE_TOAST_POPUP_ACCEPTED_ICON )
			LUI.CoDMetrics.JoinGroupEvent( f883_arg2, Engine.GetModelValue( f883_local0 ), "invite" )
			GoBack( f883_arg0, f883_arg2 )
		end, true )
	end
end

function RejectGroupInvite( f885_arg0, f885_arg1, f885_arg2 )
	local f885_local0 = Engine.GetModel( Engine.GetModelForController( f885_arg2 ), "groups.selectedGroup.groupId" )
	if f885_local0 then
		Engine.ClearLastGroupSearchResults( f885_arg2 )
		Engine.RejectGroupInvite( f885_arg2, Engine.GetModelValue( f885_local0 ) )
		OpenGroupsNotifyPopup( f885_arg0, f885_arg1, f885_arg2, true, "refreshInvites", function ()
			CoD.OverlayUtility.ShowToast( "Invite", Engine.Localize( "GROUPS_INVITE_REJECTED" ), "", LuaEnums.INVITE_TOAST_POPUP_REJECTED_ICON )
			GoBack( f885_arg0, f885_arg2 )
		end, true )
	end
end

function FetchHighlightedGroupJoinApprovalType( f887_arg0, f887_arg1, f887_arg2, f887_arg3 )
	if not Engine.IsMainThread() then
		return 
	end
	local f887_local0 = Engine.GetModel( Engine.GetModelForController( f887_arg2 ), "groups.lastGroupIdForJoinApprovalFetch" )
	if not f887_local0 then
		f887_local0 = Engine.CreateModel( Engine.GetModelForController( f887_arg2 ), "groups.lastGroupIdForJoinApprovalFetch" )
		Engine.SetModelValue( f887_local0, Engine.StringToXUIDDecimal( "0" ) )
	end
	local f887_local1 = CoD.SafeGetModelValue( f887_arg1:getModel(), "groupId" )
	local f887_local2 = f887_arg3
	if CoD.SafeGetModelValue( f887_arg1:getModel(), "privacy" ) == Enum.GroupPrivacy.GROUP_PRIVACY_PRIVATE and f887_arg1:getModel( f887_arg2, "joinApprovalType" ) then
		Engine.SetModelValue( f887_arg1:getModel( f887_arg2, "joinApprovalType" ), Enum.GroupJoinApprovalType.GROUP_JOIN_APPROVAL_INVITE_ONLY )
		return 
	end
	local f887_local3 = f887_arg1.gridInfoTable.parentGrid
	if f887_local1 and Engine.GetModelValue( f887_local0 ) ~= f887_local1 then
		if Engine.FetchGroupJoinApprovalTypeByGroupId( f887_arg2, f887_local1, f887_local2 ) then
			Engine.SetModelValue( f887_local0, f887_local1 )
		end
		local f887_local4 = Engine.GetModel( Engine.GetModelForController( f887_arg2 ), "groups.eventUpdate" )
		local f887_local5 = Engine.GetModel( Engine.GetModelForController( f887_arg2 ), "groups.eventName" )
		if not f887_arg0.eventUpdateSubscription then
			f887_arg0.eventUpdateSubscription = f887_arg0:subscribeToModel( f887_local4, function ( model )
				if Engine.GetModelValue( f887_local5 ) == "fetch_join_approval_type_task_complete" then
					local f888_local0 = f887_local3.activeWidget
					if not f888_local0 then
						return 
					elseif f888_local0:getModel() then
						local f888_local1 = f888_local0:getModel( f887_arg2, "joinApprovalType" )
						local f888_local2 = f888_local0:getModel( f887_arg2, "groupId" )
						if f888_local2 and f888_local1 and not Engine.SetModelValue( f888_local0:getModel( f887_arg2, "joinApprovalType" ), Engine.GetGroupJoinApprovalTypeByGroupId( f887_arg2, Engine.GetModelValue( f888_local2 ), f887_local2 ) ) then
							Engine.ForceNotifyModelSubscriptions( f888_local0:getModel( f887_arg2, "joinApprovalType" ) )
						end
					end
				end
			end, false )
		end
		if not f887_arg0.progressSubscription then
			f887_arg0.progressSubscription = f887_arg0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f887_arg2 ), "groups.fetchGroupJoinApprovalTypeInProgress" ), function ( model )
				local f889_local0 = f887_local3.activeWidget
				if f889_local0 and f889_local0:getModel( f887_arg2, "joinApprovalType" ) then
					Engine.ForceNotifyModelSubscriptions( f889_local0:getModel( f887_arg2, "joinApprovalType" ) )
				end
			end, false )
		end
	end
end

function ProcessJoinSelectedGroup( f890_arg0, f890_arg1, f890_arg2 )
	if IsGroupMemberFromElement( f890_arg1, f890_arg2 ) then
		OpenGenericSmallPopup( f890_arg0:getParentMenu(), f890_arg2, "GROUPS_NOTICE_CAPS", "GROUPS_PART_OF_GROUP", nil, "MENU_OK", nil, nil )
		return 
	elseif f890_arg1:getModel() and f890_arg1:getModel( f890_arg2, "privacy" ) and Engine.GetModelValue( f890_arg1:getModel( f890_arg2, "privacy" ) ) == Enum.GroupPrivacy.GROUP_PRIVACY_PRIVATE then
		OpenGenericSmallPopup( f890_arg0:getParentMenu(), f890_arg2, "GROUPS_NOTICE_CAPS", "GROUPS_CANNOT_JOIN_PRIVATE_GROUP", nil, "MENU_OK", nil, nil )
		return 
	else
		local f890_local0 = f890_arg0:getParentMenu()
		Engine.FetchSelectedGroupJoinApprovalType( f890_arg2 )
		OpenGroupsNotifyPopup( f890_arg0, f890_arg1, f890_arg2, true, "fetch_join_approval_type_task_complete", function ()
			if Engine.GetSelectedGroupJoinApprovalType() == Enum.GroupJoinApprovalType.GROUP_JOIN_APPROVAL_OFF then
				f890_local0:OpenModalDialog( f890_arg0, f890_arg2, "GROUPS_JOIN_SELECTED_GROUP_TITLE", "", {
					"MPUI_YES",
					"MPUI_NO"
				}, function ( f892_arg0 )
					if f892_arg0 == 0 then
						local f892_local0 = Engine.GetModelValue( f890_arg1:getModel( f890_arg2, "groupBufferType" ) )
						local f892_local1 = Engine.GetModelValue( f890_arg1:getModel( f890_arg2, "groupId" ) )
						Engine.JoinGroup( f890_arg2, f892_local0, f892_local1 )
						LUI.CoDMetrics.JoinGroupEvent( f890_arg2, f892_local1, "search" )
						OpenGroupsNotifyPopup( f890_arg0, f890_arg1, f890_arg2, true, "join_group_task_complete" )
					end
					return true
				end )
			elseif Engine.GetSelectedGroupJoinApprovalType() == Enum.GroupJoinApprovalType.GROUP_JOIN_APPROVAL_ON then
				f890_local0:OpenModalDialog( f890_arg0, f890_arg2, "GROUPS_SEND_APPLICATION", "GROUPS_SEND_APPLICATION_DESC", {
					"MPUI_YES",
					"MPUI_NO"
				}, function ( f893_arg0 )
					if f893_arg0 == 0 then
						Engine.SendApplicationToSelectedGroup( f890_arg2 )
						local f893_local0 = CoD.SafeGetModelValue( f890_arg1:getModel(), "groupId" )
						if f893_local0 ~= nil then
							LUI.CoDMetrics.JoinGroupEvent( f890_arg2, f893_local0, "application" )
						end
						OpenGroupsNotifyPopup( f890_arg0, f890_arg1, f890_arg2, true, "send_application_task_complete" )
					end
					return true
				end )
			end
		end, true )
	end
end

function GroupInvitesOpenPlayerDetails( f894_arg0, f894_arg1, f894_arg2 )
	local f894_local0 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f894_arg2 ), "groups.groupInvites.sentByXuid" ) )
	local f894_local1 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f894_arg2 ), "groups.groupInvites.sentByGamertag" ) )
	local f894_local2 = Engine.GetModelForController( f894_arg2 )
	local f894_local3 = Engine.CreateModel( f894_local2, "Social.selectedFriendXUID" )
	local f894_local4 = Engine.CreateModel( f894_local2, "Social.selectedFriendGamertag" )
	Engine.SetModelValue( f894_local3, f894_local0 )
	Engine.SetModelValue( f894_local4, f894_local1 )
	GoBackAndOpenOverlayOnParent( f894_arg0, "Social_PlayerDetailsPopup", f894_arg2 )
end

function HandleGroupHeadquartersKeyboardComplete( f895_arg0, f895_arg1, f895_arg2, f895_arg3 )
	local f895_local0 = CoD.perController[f895_arg2].selectedGroup
	local f895_local1 = nil
	if not f895_local0 then
		return 
	elseif f895_arg1:getModel() and f895_arg1:getModel( f895_arg2, "currentText" ) then
		Engine.SetModelValue( f895_arg1:getModel( f895_arg2, "currentText" ), f895_arg3.input )
	end
	if f895_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_GROUP_NAME then
		Engine.SetSelectedGroupName( f895_arg2, f895_arg3.input )
		OpenGroupsNotifyPopup( f895_arg0, f895_arg1, f895_arg2, true, "update_group_name_task_complete", function ( f896_arg0, f896_arg1, f896_arg2 )
			if Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f896_arg2 ), "groups.notificationError" ) ) then
				OpenGroupsNotifyPopup( f896_arg0, f896_arg1, f896_arg2 )
			else
				Engine.SetModelValue( Engine.GetModel( f895_local0, "name" ), f895_arg3.input )
			end
		end, true )
	elseif f895_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_GROUP_MESSAGE then
		Engine.SetSelectedGroupMessage( f895_arg2, f895_arg3.input )
		Engine.SetModelValue( Engine.GetModel( f895_local0, "message" ), f895_arg3.input )
	elseif f895_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_GROUP_DESCRIPTION then
		Engine.SetSelectedGroupDescription( f895_arg2, f895_arg3.input )
		Engine.SetModelValue( Engine.GetModel( f895_local0, "description" ), f895_arg3.input )
	end
end

function HandleGroupsKeyboardComplete( f897_arg0, f897_arg1, f897_arg2, f897_arg3 )
	if f897_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_GROUP_SEARCH_NAME then
		Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f897_arg2 ), "groups.searchGroupsGroupName" ), f897_arg3.input )
	elseif f897_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_GROUP_PLAYER_SEARCH then
		Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f897_arg2 ), "groups.searchGroupsPlayerName" ), f897_arg3.input )
	end
end

function EditSelectedGroupName( f898_arg0, f898_arg1, f898_arg2 )
	ShowKeyboard( f898_arg0, f898_arg1, f898_arg2, "KEYBOARD_TYPE_GROUP_NAME" )
end

function EditSelectedGroupMessage( f899_arg0, f899_arg1, f899_arg2 )
	MarkGroupDataDirty( f899_arg2, "message", true )
	ShowKeyboard( f899_arg0, f899_arg1, f899_arg2, "KEYBOARD_TYPE_GROUP_MESSAGE" )
end

function EditSelectedGroupDescription( f900_arg0, f900_arg1, f900_arg2 )
	MarkGroupDataDirty( f900_arg2, "description", true )
	ShowKeyboard( f900_arg0, f900_arg1, f900_arg2, "KEYBOARD_TYPE_GROUP_DESCRIPTION" )
end

function OpenGroupHeadquarters( f901_arg0, f901_arg1, f901_arg2 )
	local f901_local0 = CoD.perController[f901_arg2].selectedGroup
	if not f901_local0 then
		return 
	end
	local f901_local1 = Engine.GetModelValue( Engine.GetModel( f901_local0, "groupId" ) )
	NavigateToMenu( f901_arg0:getParentMenu(), "GroupHeadquarters", true, f901_arg2 )
	local f901_local2, f901_local3, f901_local4, f901_local5, f901_local6, f901_local7 = Engine.GetGroupLeaderboardInfo()
	SetGroupLeaderboardInfo( f901_arg2, f901_local2, f901_local3, f901_local4, f901_local5, f901_local6, f901_local7, true )
	if IsGroupLeaderboardAvailable() then
		Engine.LoadLeaderboard( f901_local2, f901_local3 )
		Engine.RequestLeaderboardData( f901_arg2, Enum.LbFilter.LB_FILTER_GROUP_MEMBERS )
	end
	Engine.SetCurrentlyOpenedGroup( f901_local1 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f901_arg2 ), "groups.disableViewGroups" ), true )
end

function ClearCurrentlyOpenedGroup( f902_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f902_arg0 ), "groups.disableViewGroups" ), false )
	Engine.SetCurrentlyOpenedGroup( Engine.StringToXUIDDecimal( "0" ) )
end

function UpdateSelectedGroupInfo( f903_arg0, f903_arg1, f903_arg2 )
	if HasAdminPrivilege( f903_arg2, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_TYPE ) then
		if IsGroupDataDirty( f903_arg2, "privacy" ) then
			Engine.SetSelectedGroupType( f903_arg2, Engine.GetModelValue( Engine.GetModel( CoD.perController[f903_arg2].selectedGroup, "privacy" ) ) )
		end
		if IsGroupDataDirty( f903_arg2, "joinApprovalType" ) then
			Engine.SetSelectedGroupJoinApprovalType( f903_arg2, Engine.GetModelValue( Engine.GetModel( CoD.perController[f903_arg2].selectedGroup, "joinApprovalType" ) ) )
		end
	end
	local f903_local0 = false
	if HasAdminPrivilege( f903_arg2, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_DESCRIPTION ) and IsGroupDataDirty( f903_arg2, "description" ) then
		f903_local0 = true
	end
	if HasAdminPrivilege( f903_arg2, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_MESSAGE ) and IsGroupDataDirty( f903_arg2, "message" ) then
		f903_local0 = true
	end
	if HasAdminPrivilege( f903_arg2, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_EMBLEM ) and IsGroupDataDirty( f903_arg2, "emblem" ) then
		f903_local0 = true
	end
	if f903_local0 then
		Engine.UpdateSelectedGroupProfile( f903_arg2 )
	end
	ResetGroupDirtyData( f903_arg2 )
end

function SetSelectedGroup( f904_arg0, f904_arg1, f904_arg2 )
	if f904_arg1 and f904_arg1:getModel() then
		CoD.perController[f904_arg2].selectedGroup = f904_arg1:getModel()
		Engine.SetSelectedGroup( f904_arg2, Engine.GetModelValue( f904_arg1:getModel( f904_arg2, "groupBufferType" ) ), Engine.GetModelValue( f904_arg1:getModel( f904_arg2, "groupId" ) ) )
		Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetModelForController( f904_arg2 ), "groups.selectedGroup" ) )
	end
end

function ClearSelectedGroup( f905_arg0, f905_arg1, f905_arg2 )
	CoD.perController[f905_arg2].selectedGroup = nil
	Engine.ClearSelectedGroup()
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetModelForController( f905_arg2 ), "groups.selectedGroup" ) )
end

function SetGroupHeadquarterTabName( f906_arg0, f906_arg1, f906_arg2 )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f906_arg2 ), "groups" ), "grouphqtabname" ), f906_arg1.tabId )
end

function SearchGroupsBySearchType( f907_arg0, f907_arg1, f907_arg2, f907_arg3, f907_arg4 )
	if not f907_arg4 then
		ClearSelectedGroup( f907_arg0, f907_arg1, f907_arg2 )
	end
	Engine.SearchGroups( f907_arg2, f907_arg3 )
end

function ClearLastGroupSearchResults( f908_arg0, f908_arg1, f908_arg2 )
	Engine.ClearLastGroupSearchResults( f908_arg2 )
end

function SearchPlayerByGamertag( f909_arg0, f909_arg1, f909_arg2 )
	local f909_local0 = f909_arg1:getParentMenu()
	local f909_local1 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f909_arg2 ), "groups.searchGroupsPlayerName" ) )
	if f909_local1 == "" then
		return 
	end
	Engine.SearchPlayerByGamertag( f909_arg2, f909_local1 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f909_arg2 ), "groups.searchPlayerResultsVisible" ), true )
	local f909_local2 = f909_arg1:findSibling( "CategoriesList" )
	if f909_local2 then
		f909_local2:processEvent( {
			name = "gain_focus",
			controller = f909_arg2
		} )
	end
	OpenGroupsNotifyPopup( f909_local0, f909_arg1, f909_arg2, true, "search_player_task_complete", function ( f910_arg0, f910_arg1, f910_arg2 )
		local f910_local0 = f910_arg0:findSibling( "CategoriesList" )
		if f910_local0 and f910_local0:getModel() and f910_local0:getModel( f910_arg2, "frameWidget" ) then
			Engine.SetModelValue( f910_local0:getModel( f910_arg2, "frameWidget" ), "CoD.FindGroupsTabSearchPlayerResultsFrame" )
			local f910_local1 = f910_local0:findSibling( "FindGroupsTabFrame" )
			if f910_local1 then
				f910_local1:processEvent( {
					name = "lose_focus",
					controller = f910_arg2
				} )
				f910_local0:processEvent( {
					name = "gain_focus",
					controller = f910_arg2
				} )
			end
		end
	end, true )
end

function SearchGroups( f911_arg0, f911_arg1, f911_arg2 )
	local f911_local0 = f911_arg1:getParentMenu()
	Engine.ClearLastGroupSearchResults( f911_arg2 )
	Engine.SearchGroups( f911_arg2, Enum.GroupSearchType.GROUP_SEARCH_TYPE_SEARCH_BY_PARAMS )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f911_arg2 ), "groups.searchResultsVisible" ), true )
	local f911_local1 = f911_arg1:findSibling( "CategoriesList" )
	if f911_local1 then
		f911_local1:processEvent( {
			name = "gain_focus",
			controller = f911_arg2
		} )
	end
	ClearSelectedGroup( f911_arg0, f911_arg1, f911_arg2 )
	OpenGroupsNotifyPopup( f911_local0, f911_arg1, f911_arg2, true, "search_groups_task_complete", function ( f912_arg0, f912_arg1, f912_arg2 )
		local f912_local0 = f912_arg0:findSibling( "CategoriesList" )
		if f912_local0 and f912_local0:getModel() and f912_local0:getModel( f912_arg2, "frameWidget" ) then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f912_arg2 ), "groups.paramSearchStarted" ), true )
			Engine.SetModelValue( f912_local0:getModel( f912_arg2, "frameWidget" ), "CoD.FindGroupsTabSearchGroupsResultsFrame" )
			local f912_local1 = f912_local0:findSibling( "FindGroupsTabFrame" )
			if f912_local1 then
				f912_local1:processEvent( {
					name = "lose_focus",
					controller = f912_arg2
				} )
				f912_local0:processEvent( {
					name = "gain_focus",
					controller = f912_arg2
				} )
			end
		end
	end, true )
end

function InitializeGroups( f913_arg0, f913_arg1, f913_arg2 )
	local f913_local0 = Engine.CreateModel( Engine.GetModelForController( f913_arg2 ), "groups" )
	Engine.CreateModel( f913_local0, "processingTask" )
	Engine.CreateModel( f913_local0, "grouphqtabname" )
	Engine.CreateModel( f913_local0, "createGroup" )
	local f913_local1 = Engine.CreateModel( f913_local0, "leaderboardmaker" )
	Engine.CreateModel( f913_local1, "startingState" )
	Engine.CreateModel( f913_local1, "state" )
	Engine.SetModelValue( Engine.CreateModel( f913_local1, "lbDef" ), "" )
	Engine.SetModelValue( Engine.CreateModel( f913_local1, "lbDefOriginal" ), "" )
	Engine.SetModelValue( Engine.CreateModel( f913_local1, "lbTimeFrame" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( f913_local1, "lbHardcore" ), false )
	Engine.SetModelValue( Engine.CreateModel( f913_local1, "lbArena" ), false )
	Engine.SetModelValue( Engine.CreateModel( f913_local1, "lbSortType" ), "" )
	Engine.SetModelValue( Engine.CreateModel( f913_local1, "lbInitialized" ), false )
	Engine.CreateModel( f913_local0, "notificationTitle" )
	Engine.CreateModel( f913_local0, "notificationMessage" )
	Engine.CreateModel( f913_local0, "notificationError" )
	Engine.SetModelValue( Engine.CreateModel( f913_local0, "searchGroupsGroupName" ), "" )
	Engine.SetModelValue( Engine.CreateModel( f913_local0, "params.highlightGroupsTabInSocial" ), false )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f913_arg2 ), "groups.searchResultsVisible" ), false )
end

function FetchGroupInviteProfiles( f914_arg0, f914_arg1, f914_arg2 )
	Engine.FetchGroupInviteProfiles( f914_arg2 )
end

function UpdateFindGroupsTabSearchFrameWidget( f915_arg0, f915_arg1, f915_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f915_arg2 ), "groups.searchResultsVisible" ), false )
end

function UpdateFindGroupsTabSearchPlayerFrameWidget( f916_arg0, f916_arg1, f916_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f916_arg2 ), "groups.searchPlayerResultsVisible" ), false )
end

function OpenAdminPrivilegesPopup( f917_arg0, f917_arg1, f917_arg2 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f917_arg2 ), "groups.currentAdminPrivileges" ), Engine.GetGroupAdminPrivileges( f917_arg2, Engine.GetModelValue( Engine.GetModel( CoD.perController[f917_arg2].selectedGroup, "groupId" ) ), Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f917_arg2 ), "Social.selectedFriendXUID" ) ) ) )
	OpenOverlay( f917_arg0, "GroupAdminSettings", f917_arg2 )
end

function PromoteSelectedGroupMemberToAdmin( f918_arg0, f918_arg1, f918_arg2 )
	local f918_local0 = f918_arg1.gridInfoTable.parentGrid.menu
	Engine.FetchSelectedGroupAdmins()
	OpenGroupsNotifyPopup( f918_local0, f918_arg1, f918_arg2, true, "fetch_group_admins_task_complete", function ()
		local f919_local0 = Engine.GetSelectedGroupAdminsCount( f918_arg2 )
		if IsGroupAdmin( f918_arg2 ) then
			f919_local0 = f919_local0 + 1
		end
		if Engine.GetMaxGroupAdminsCount() <= Engine.GetSelectedGroupAdminsCount( f918_arg2 ) then
			OpenGenericSmallPopup( f918_local0, f918_arg2, "GROUPS_NOTICE_CAPS", "GROUPS_MAX_ADMINS_LIMIT_REACHED_DESC", nil, "MENU_OK", nil, nil )
			return 
		else
			f918_local0:OpenModalDialog( f918_arg0, f918_arg2, "GROUPS_PROMOTE_TO_ADMIN_CAPS", "GROUPS_PROMOTE_TO_ADMIN_DESC", {
				"GROUPS_DO_NOT_PROMOTE_CAPS",
				"GROUPS_PROMOTE_CAPS"
			}, function ( f920_arg0 )
				if f920_arg0 == 1 then
					local f920_local0 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f918_arg2].selectedGroup, "groupId" ) )
					Engine.PromoteSelectedGroupMemberToAdmin( f918_arg2, Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f918_arg2 ), "Social.selectedFriendXUID" ) ) )
					OpenGroupsNotifyPopup( f918_local0, f918_arg1, f918_arg2, true, "promote_member_task_complete", function ()
						GoBack( f918_local0, f918_arg2 )
					end, true )
				end
				return true
			end )
		end
	end, true )
end

function PromoteSelectedGroupAdminToOwner( f922_arg0, f922_arg1, f922_arg2 )
	f922_arg1.gridInfoTable.parentGrid.menu:OpenModalDialog( f922_arg0, f922_arg2, "GROUPS_TRANSFER_OWNERSHIP_CAPS", "GROUPS_TRANSFER_OWNERSHIP_DESC", {
		"GROUPS_DO_NOT_TRANSFER_CAPS",
		"GROUPS_WITH_ADMIN_RIGHTS_CAPS",
		"GROUPS_WITHOUT_ADMIN_RIGHTS_CAPS"
	}, function ( f923_arg0 )
		if f923_arg0 == 1 or f923_arg0 == 2 then
			Engine.PromoteGroupAdminToOwner( f922_arg2, Engine.GetModelValue( Engine.GetModel( CoD.perController[f922_arg2].selectedGroup, "groupId" ) ), Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f922_arg2 ), "Social.selectedFriendXUID" ) ), f923_arg0 == 1 )
			OpenGroupsNotifyPopup( REG3, f922_arg1, f922_arg2, true, "promote_member_to_owner_task_complete", function ()
				GoBack( REG3, f922_arg2 )
			end, true )
		end
		return true
	end )
end

function ToggleGroupAdminPrivilege( f925_arg0, f925_arg1, f925_arg2, f925_arg3 )
	Engine.ToggleGroupAdminPrivilege( f925_arg2, f925_arg3 )
end

function UpdateSelectedGroupAdminPrivileges( f926_arg0, f926_arg1, f926_arg2 )
	local f926_local0 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f926_arg2 ), "Social.selectedFriendXUID" ) )
	local f926_local1 = Engine.GetGroupAdminPrivileges( f926_arg2, Engine.GetModelValue( Engine.GetModel( CoD.perController[f926_arg2].selectedGroup, "groupId" ) ), f926_local0 )
	local f926_local2 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f926_arg2 ), "groups.currentAdminPrivileges" ) )
	if f926_local1 ~= f926_local2 then
		Engine.PromoteSelectedGroupMemberToAdmin( f926_arg2, f926_local0, f926_local2 )
	end
end

function BlockPublishedContent( f927_arg0, f927_arg1, f927_arg2 )
	f927_arg1.gridInfoTable.parentGrid.menu:OpenModalDialog( f927_arg0, f927_arg2, "GROUPS_BLOCK_PUBLISHED_CONTENT_CAPS", "GROUPS_BLOCK_PUBLISHED_CONTENT_MESSAGE", {
		"GROUPS_BLOCK_PUBLISHED_CONTENT_CANCEL_CAPS",
		"GROUPS_BLOCK_PUBLISHED_CONTENT_OK_CAPS"
	}, function ( f928_arg0 )
		if f928_arg0 == 1 then
			local f928_local0 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f927_arg2].selectedGroup, "groupId" ) )
			local f928_local1 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f927_arg2 ), "Social.selectedFriendXUID" ) )
		end
		return true
	end )
end

function RemoveFromGroup( f929_arg0, f929_arg1, f929_arg2 )
	local f929_local0 = f929_arg1:getParentMenu()
	if f929_arg1.gridInfoTable then
		f929_local0 = f929_arg1.gridInfoTable.parentGrid.menu
	end
	f929_local0:OpenModalDialog( f929_arg0, f929_arg2, "GROUPS_REMOVE_FROM_GROUP_CAPS", "GROUPS_REMOVE_FROM_GROUP_MESSAGE", {
		"GROUPS_REMOVE_FROM_GROUP_CANCEL_CAPS",
		"GROUPS_REMOVE_FROM_GROUP_OK_CAPS"
	}, function ( f930_arg0 )
		if f930_arg0 == 1 then
			Engine.KickGroupMember( f929_arg2, Engine.GetModelValue( Engine.GetModel( CoD.perController[f929_arg2].selectedGroup, "groupId" ) ), Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f929_arg2 ), "Social.selectedFriendXUID" ) ) )
			OpenGroupsNotifyPopup( f929_local0, f929_arg1, f929_arg2, true, "fetch_group_members_task_complete", function ()
				GoBack( f929_local0, f929_arg2 )
			end, true )
		end
		return true
	end )
end

function BanFromGroup( f932_arg0, f932_arg1, f932_arg2 )
	local f932_local0 = f932_arg1:getParentMenu()
	if f932_arg1.gridInfoTable then
		f932_local0 = f932_arg1.gridInfoTable.parentGrid.menu
	end
	f932_local0:OpenModalDialog( f932_arg0, f932_arg2, "GROUPS_BAN_FROM_GROUP_CAPS", "GROUPS_BAN_FROM_GROUP_MESSAGE", {
		"GROUPS_BAN_FROM_GROUP_CANCEL_CAPS",
		"GROUPS_BAN_FROM_GROUP_OK_CAPS"
	}, function ( f933_arg0 )
		if f933_arg0 == 1 then
			Engine.BanGroupMember( f932_arg2, Engine.GetModelValue( Engine.GetModel( CoD.perController[f932_arg2].selectedGroup, "groupId" ) ), Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f932_arg2 ), "Social.selectedFriendXUID" ) ) )
			OpenGroupsNotifyPopup( f932_local0, f932_arg1, f932_arg2, true, "fetch_group_members_task_complete", function ()
				GoBack( f932_local0, f932_arg2 )
			end, true )
		end
		return true
	end )
end

function UnBanFromGroup( f935_arg0, f935_arg1, f935_arg2 )
	local f935_local0 = f935_arg1:getParentMenu()
	f935_local0:OpenModalDialog( f935_arg0, f935_arg2, "GROUPS_UNBAN_FROM_GROUP_CAPS", "GROUPS_UNBAN_FROM_GROUP_MESSAGE", {
		"GROUPS_UNBAN_FROM_GROUP_CANCEL_CAPS",
		"GROUPS_UNBAN_FROM_GROUP_OK_CAPS"
	}, function ( f936_arg0 )
		if f936_arg0 == 1 then
			Engine.UnBanGroupMember( f935_arg2, Engine.GetModelValue( Engine.GetModel( CoD.perController[f935_arg2].selectedGroup, "groupId" ) ), Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f935_arg2 ), "Social.selectedFriendXUID" ) ) )
			OpenGroupsNotifyPopup( f935_local0, f935_arg1, f935_arg2, true, "fetch_banned_members_task_complete", function ()
				if Engine.GetSelectedGroupBannedMembersCount( f935_arg2 ) == 0 then
					local f937_local0 = f935_arg0:findSibling( "AdminOptions" )
					if f937_local0 then
						f937_local0:processEvent( {
							name = "gain_focus",
							controller = f935_arg2
						} )
					end
				end
			end, true )
		end
		return true
	end )
end

function DemoteAdminToRegularMember( f938_arg0, f938_arg1, f938_arg2 )
	local f938_local0 = f938_arg1:getParentMenu()
	if f938_arg1.gridInfoTable then
		f938_local0 = f938_arg1.gridInfoTable.parentGrid.menu
	end
	f938_local0:OpenModalDialog( f938_arg0, f938_arg2, "GROUPS_REMOVE_ADMIN_PRIVILEGES_CAPS", "GROUPS_REMOVE_ADMIN_PRIVILEGES_DESC", {
		"GROUPS_DO_NOT_REMOVE_CAPS",
		"GROUPS_REMOVE_CAPS"
	}, function ( f939_arg0 )
		if f939_arg0 == 1 then
			Engine.DemoteGroupAdminToRegularMember( f938_arg2, Engine.GetModelValue( Engine.GetModel( CoD.perController[f938_arg2].selectedGroup, "groupId" ) ), Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f938_arg2 ), "Social.selectedFriendXUID" ) ) )
			OpenGroupsNotifyPopup( f938_local0, f938_arg1, f938_arg2, true, "demote_member_task_complete", function ()
				GoBack( f938_local0, f938_arg2 )
			end, true )
		end
		return true
	end )
end

function OpenGroupSelector( f941_arg0, f941_arg1, f941_arg2 )
	Engine.FetchOutgoingGroupInvites( f941_arg2, Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f941_arg2 ), "Social.selectedFriendXUID" ) ) )
	OpenGroupsNotifyPopup( f941_arg0, f941_arg1, f941_arg2, true, "refreshOutgoingInvites", function ()
		OpenPopup( f941_arg0, "GroupSelectPopup", f941_arg2 )
	end, true )
end

function OpenViewGroups( f943_arg0, f943_arg1, f943_arg2 )
	ClearLastGroupSearchResults( f943_arg0, f943_arg1, f943_arg2 )
	SearchGroupsBySearchType( f943_arg0, f943_arg1, f943_arg2, Enum.GroupSearchType.GROUP_SEARCH_TYPE_SELECTED_FRIEND, true )
	OpenGroupsNotifyPopup( f943_arg0, f943_arg1, f943_arg2, true, "search_groups_task_complete", function ()
		if Engine.GetTotalGroupsCount( f943_arg2, Enum.GroupBufferType.GROUP_BUFFER_TYPE_SEARCH ) == 0 then
			OpenGenericSmallPopup( f943_arg0, f943_arg2, "MENU_NOTICE_CAPS", "GROUPS_NO_FRIENDS_GROUP", nil, "MENU_OK", nil, nil )
		else
			OpenPopup( f943_arg0, "ShowFriendsGroups", f943_arg2 )
		end
	end, true )
end

function InviteToGroup( f945_arg0, f945_arg1, f945_arg2 )
	local f945_local0 = f945_arg1.groupId
	if not f945_arg1.inviteSent then
		Engine.SendGroupInvite( f945_arg2, f945_local0, Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f945_arg2 ), "Social.selectedFriendXUID" ) ) )
		OpenGroupsNotifyPopup( f945_arg0, f945_arg1, f945_arg2, true, "refreshOutgoingInvites", function ()
			if f945_arg1:getModel() and f945_arg1:getModel( f945_arg2, "inviteSent" ) then
				local f946_local0 = Engine.SetModelValue
				local f946_local1 = f945_arg1:getModel()
				if f946_local1 then
					f946_local1 = f945_arg1:getModel( f945_arg2, "inviteSent" )
				end
				f946_local0( f946_local1, true )
			end
			CoD.OverlayUtility.ShowToast( "Invite", Engine.Localize( "MENU_INVITE_SENT" ), "", LuaEnums.INVITE_TOAST_POPUP_ICON )
		end, true )
	end
	return true
end

function CreateNewGroupFlow( f947_arg0, f947_arg1, f947_arg2 )
	ClearSelectedGroup( f947_arg0, f947_arg1, f947_arg2 )
	InitializeCreateGroup( f947_arg0, f947_arg1, f947_arg2 )
	OpenCreateGroupMenu( f947_arg0, f947_arg1, f947_arg2 )
end

function CancelCreateGroup( f948_arg0, f948_arg1, f948_arg2, f948_arg3 )
	f948_arg3:OpenModalDialog( f948_arg0, f948_arg2, "GROUPS_CANCEL_GROUP_CREATION_TITLE", "GROUPS_CANCEL_GROUP_CREATION_SUBTITLE", {
		"MENU_NO_CAPS",
		"MENU_YES_CAPS"
	}, function ( f949_arg0 )
		if f949_arg0 == 1 then
			GoBack( f948_arg3, f948_arg2 )
		end
		return true
	end )
end

function ProcessCreateGroup( f950_arg0, f950_arg1, f950_arg2 )
	if ValidateCreateGroupInformation( f950_arg0, f950_arg1, f950_arg2 ) then
		CreateGroup( f950_arg0, f950_arg1, f950_arg2 )
	end
end

function InviteSelectedFriendsToGroup( f951_arg0, f951_arg1, f951_arg2, f951_arg3 )
	local f951_local0 = f951_arg3
	local f951_local1 = Engine.GetModel( Engine.GetModelForController( f951_arg2 ), "groups.createGroup.createdGroupId" )
	if f951_local0 and f951_local1 then
		Engine.SendGroupBatchInvites( f951_arg2, Engine.GetModelValue( f951_local1 ) )
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f951_arg2 ), "groups.highlightGroupsTabInSocial" ), true )
	OpenGenericSmallPopup( GoBackToMenu( f951_arg0, f951_arg2, "Social_Main" ), f951_arg2, "GROUPS_SUCCESS_CAPS", "GROUPS_CREATE_SUCCESS_MESSAGE", nil, "MENU_OK", nil, nil )
end

function AdminTabMakeNotFocusableIfDisabled( f952_arg0, f952_arg1 )
	f952_arg0:linkToElementModel( f952_arg0, "disabled", true, function ( model )
		if Engine.GetModelValue( model ) then
			f952_arg0:makeNotFocusable()
		end
	end )
end

function CreateGroup( f954_arg0, f954_arg1, f954_arg2 )
	local f954_local0 = Engine.GetModelForController( f954_arg2 )
	local f954_local1 = Engine.GetModelValue( Engine.GetModel( f954_local0, "groups.createGroup.name" ) )
	local f954_local2 = Engine.GetModelValue( Engine.GetModel( f954_local0, "groups.createGroup.description" ) )
	local f954_local3 = Engine.GetModelValue( Engine.GetModel( f954_local0, "groups.createGroup.privacy" ) )
	local f954_local4 = Engine.GetModelValue( Engine.GetModel( f954_local0, "groups.createGroup.emblem" ) )
	Engine.SetModelValue( Engine.CreateModel( f954_local0, "groups.createGroup.failed" ), false )
	Engine.CreateGroup( f954_arg2, f954_local1, f954_local2, f954_local3, f954_local4 )
	OpenGroupsNotifyPopup( f954_arg0, f954_arg1, f954_arg2, true, "create_group_task_complete", function ( f955_arg0, f955_arg1, f955_arg2 )
		local f955_local0 = Engine.GetFriendsCount( f955_arg2, 0 )
		local f955_local1 = Engine.GetModelValue( Engine.GetModel( f954_local0, "groups.createGroup.failed" ) )
		if Engine.GetModelValue( Engine.GetModel( f954_local0, "groups.notificationError" ) ) then
			OpenGroupsNotifyPopup( f955_arg0, f955_arg1, f955_arg2 )
		elseif f955_local0 > 0 and not f955_local1 then
			NavigateToMenu( f955_arg0, "GroupInviteFriends", false, f955_arg2 )
		elseif not f955_local1 then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f955_arg2 ), "groups.highlightGroupsTabInSocial" ), true )
			OpenGenericSmallPopup( GoBackToMenu( f955_arg0, f955_arg2, "Social_Main" ), f955_arg2, "GROUPS_SUCCESS_CAPS", "GROUPS_CREATE_SUCCESS_MESSAGE", nil, "MENU_OK", nil, nil )
		end
		if not f955_local1 then
			local f955_local2 = CoD.SafeGetModelValue( Engine.GetModelForController( f955_arg2 ), "groups.createGroup.createdGroupId" )
			if f955_local2 ~= nil then
				local f955_local3 = "public"
				if f954_local3 == Enum.GroupPrivacy.GROUP_PRIVACY_PRIVATE then
					f955_local3 = "private"
				end
				LUI.CoDMetrics.CreateGroupEvent( f955_arg2, f955_local2, f955_local3 )
			end
		end
	end, true, function ( f956_arg0, f956_arg1, f956_arg2 )
		if CoD.SafeGetModelValue( f954_local0, "groups.notificationMessage" ) == "GROUPS_ERROR_TEAMNAME_ALREADY_EXISTS" then
			Engine.SetModelValue( Engine.GetModel( f954_local0, "groups.notificationTitle" ), "GROUPS_GROUP_NAME_EXISTS_CAPS" )
		end
		Engine.SetModelValue( Engine.CreateModel( f954_local0, "groups.createGroup.failed" ), true )
	end )
end

function OpenLeaderboardResetOverlay( f957_arg0, f957_arg1, f957_arg2, f957_arg3, f957_arg4 )
	OpenSystemOverlay( f957_arg0, f957_arg4, f957_arg2, "LeaderboardClearCustomConfirmationOverlay", {
		resetAction = f957_arg3
	} )
end

function SetDefaultCareerLeaderboard( f958_arg0, f958_arg1, f958_arg2 )
	local f958_local0 = CoD.LeaderboardUtility.GetCareerLeaderboardDef( f958_arg2 )
	local f958_local1 = Enum.LbTrackType.LB_TRK_ALLTIME
	local f958_local2 = false
	local f958_local3 = false
	local f958_local4 = ""
	local f958_local5 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f958_arg2].selectedGroup, "groupId" ) )
	SetGroupLeaderboardInfo( f958_arg2, f958_local0, f958_local1, f958_local2, f958_local3, "", true )
	Engine.SetGroupLeaderboard( f958_arg2, f958_local5, f958_local0, f958_local1, 0 )
	local f958_local6 = Engine.GetModelForController( f958_arg2 )
	f958_arg0:subscribeToModel( Engine.GetModel( f958_local6, "groups.eventUpdate" ), function ( model )
		if Engine.GetModelValue( Engine.GetModel( f958_local6, "groups.eventName" ) ) == "set_leaderboard_task_complete" then
			Engine.LoadLeaderboard( f958_local0, f958_local1 )
			Engine.RequestLeaderboardData( f958_arg2, Enum.LbFilter.LB_FILTER_GROUP_MEMBERS )
		end
	end )
	OpenGroupsNotifyPopup( f958_arg0, f958_arg1, f958_arg2, true, "fetch_group_leaderboard_task_complete", function ( f960_arg0, f960_arg1, f960_arg2 )
		Engine.ForceNotifyModelSubscriptions( Engine.GetModel( Engine.GetModelForController( f960_arg2 ), "groups.leaderboardmaker.lbDef" ) )
		OpenGenericSmallPopup( f960_arg0, f960_arg2, "GROUPS_CONGRATULATIONS_CAPS_TITLE", "GROUPS_DEFAULT_LB_SUCCESS", nil, "MENU_OK", nil, nil )
		Engine.SetModelValue( Engine.GetModel( f958_local6, "groups.leaderboardmaker.state" ), "" )
	end, true )
end

function OpenLeaderboardMaker( f961_arg0, f961_arg1, f961_arg2, f961_arg3 )
	if f961_arg3 == nil then
		error( "OpenLeaderboardMaker(): Invalid starting state specified" )
		return 
	else
		local f961_local0 = Engine.GetModelForController( f961_arg2 )
		Engine.SetModelValue( Engine.GetModel( f961_local0, "groups.leaderboardmaker.startingState" ), f961_arg3 )
		Engine.SetModelValue( Engine.GetModel( f961_local0, "groups.leaderboardmaker.state" ), f961_arg3 )
		local f961_local1 = f961_arg0:getParentMenu()
		f961_local1:openPopup( "LeaderboardMaker", f961_arg2 )
	end
end

function RemoveGroupLeaderboard( f962_arg0, f962_arg1, f962_arg2 )
	f962_arg1.gridInfoTable.parentGrid.menu:OpenModalDialog( f962_arg0, f962_arg2, "GROUPS_REMOVE_LEADERBOARD_CAPS", "GROUPS_REMOVE_LEADERBOARD_DESC", {
		"MPUI_NO",
		"MPUI_YES"
	}, function ( f963_arg0 )
		if f963_arg0 == 1 then
			SetGroupLeaderboardInfo( f962_arg2, "", 0, false, false, "", false )
			Engine.DeleteGroupLeaderboard( f962_arg2, Engine.GetModelValue( Engine.GetModel( CoD.perController[f962_arg2].selectedGroup, "groupId" ) ) )
			OpenGroupsNotifyPopup( REG3, f962_arg1, f962_arg2, true, "delete_leaderboard_task_complete", function ()
				GoBack( REG3, f962_arg2 )
				Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetModelForController( f962_arg2 ), "groups.updateLeaderboardTabNav" ) )
			end, true )
		end
		return true
	end )
end

function ProcessLeaderboardMakerBack( f965_arg0, f965_arg1, f965_arg2 )
	local f965_local0 = Engine.GetModelForController( f965_arg2 )
	local f965_local1 = Engine.GetModelValue( Engine.GetModel( f965_local0, "groups.leaderboardmaker.startingState" ) )
	local f965_local2 = Engine.GetModel( f965_local0, "groups.leaderboardmaker.state" )
	local f965_local3 = Engine.GetModelValue( f965_local2 )
	if f965_local3 == f965_local1 or f965_local3 == "SelectAction" then
		Engine.SetModelValue( f965_local2, "" )
		GoBack( f965_arg0, f965_arg2 )
	elseif f965_local3 == "ChooseBaseLeaderboard" then
		Engine.SetModelValue( f965_local2, "SelectAction" )
	elseif f965_local3 == "ChooseHardcore" then
		Engine.SetModelValue( f965_local2, "ChooseBaseLeaderboard" )
	elseif f965_local3 == "ChooseDefaultSort" then
		Engine.SetModelValue( f965_local2, "ChooseHardcore" )
	elseif f965_local3 == "ChooseTimeFrame" then
		Engine.SetModelValue( f965_local2, "ChooseDefaultSort" )
	end
end

function EditGroupLeaderboard( f966_arg0, f966_arg1, f966_arg2 )
	local f966_local0 = GoBack( f966_arg0, f966_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f966_arg2 ), "groups.leaderboardmaker.state" ), "ChooseBaseLeaderboard" )
	OpenLeaderboardMaker( f966_local0, f966_arg1, f966_arg2, "ChooseBaseLeaderboard" )
end

function ProcessChooseBaseLeaderboard( f967_arg0, f967_arg1, f967_arg2 )
	local f967_local0 = Engine.GetModelForController( f967_arg2 )
	Engine.SetModelValue( Engine.CreateModel( f967_local0, "groups.leaderboardmaker.lbDefOriginal" ), Engine.GetModelValue( f967_arg1:getModel( f967_arg2, "lbDef" ) ) )
	Engine.SetModelValue( Engine.CreateModel( f967_local0, "groups.leaderboardmaker.lbDef" ), Engine.GetModelValue( f967_arg1:getModel( f967_arg2, "lbDef" ) ) )
	Engine.SetModelValue( Engine.GetModel( f967_local0, "groups.leaderboardmaker.state" ), "ChooseHardcore" )
end

function ProcessChooseHardcoreAndArena( f968_arg0, f968_arg1, f968_arg2 )
	local f968_local0 = Engine.GetModelForController( f968_arg2 )
	local f968_local1 = f968_arg1.value
	local f968_local2 = Engine.GetModelValue( Engine.CreateModel( f968_local0, "groups.leaderboardmaker.lbDef" ) )
	Engine.SetModelValue( Engine.CreateModel( f968_local0, "groups.leaderboardmaker.lbHardcore" ), f968_local1 == "HC" )
	Engine.SetModelValue( Engine.CreateModel( f968_local0, "groups.leaderboardmaker.lbArena" ), f968_local1 == "ARENA" )
	if f968_local1 ~= "" then
		f968_local2 = f968_local2 .. "_" .. f968_local1
	end
	Engine.SetModelValue( Engine.CreateModel( f968_local0, "groups.leaderboardmaker.lbDef" ), f968_local2 )
	Engine.SetModelValue( Engine.GetModel( f968_local0, "groups.leaderboardmaker.state" ), "ChooseDefaultSort" )
end

function ProcessChooseDefaultSort( f969_arg0, f969_arg1, f969_arg2 )
	local f969_local0 = Engine.GetModelForController( f969_arg2 )
	Engine.SetModelValue( Engine.CreateModel( f969_local0, "groups.leaderboardmaker.lbSortType" ), f969_arg1.value )
	Engine.SetModelValue( Engine.GetModel( f969_local0, "groups.leaderboardmaker.state" ), "ChooseTimeFrame" )
end

function ProcessChooseTimeFrame( f970_arg0, f970_arg1, f970_arg2 )
	local f970_local0 = Engine.GetModelForController( f970_arg2 )
	local f970_local1 = Engine.GetModelValue( Engine.GetModel( f970_local0, "groups.leaderboardmaker.lbDef" ) )
	local f970_local2 = Engine.GetModelValue( Engine.GetModel( f970_local0, "groups.leaderboardmaker.lbDefOriginal" ) )
	local f970_local3 = Engine.GetModelValue( Engine.GetModel( f970_local0, "groups.leaderboardmaker.lbHardcore" ) )
	local f970_local4 = Engine.GetModelValue( Engine.GetModel( f970_local0, "groups.leaderboardmaker.lbArena" ) )
	local f970_local5 = Engine.GetModelValue( Engine.GetModel( f970_local0, "groups.leaderboardmaker.lbSortType" ) )
	local f970_local6 = f970_arg1.value
	Engine.SetModelValue( Engine.GetModel( f970_local0, "groups.leaderboardmaker.lbTimeFrame" ), f970_local6 )
	local f970_local7 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f970_arg2].selectedGroup, "groupId" ) )
	SetGroupLeaderboardInfo( f970_arg2, f970_local1, f970_local6, f970_local3, f970_local4, f970_local5, true )
	local f970_local8 = 0
	if CoD.LeaderboardUtility.sortColumns[f970_local2] then
		for f970_local12, f970_local13 in ipairs( CoD.LeaderboardUtility.sortColumns[f970_local2] ) do
			if f970_local5 == f970_local13.lbSortType then
				f970_local8 = f970_local13.offset
			end
		end
	end
	Engine.SetGroupLeaderboard( f970_arg2, f970_local7, f970_local1, f970_local6, f970_local8 )
	OpenGroupsNotifyPopup( f970_arg0, f970_arg1, f970_arg2, true, "set_leaderboard_task_complete", function ( f971_arg0, f971_arg1, f971_arg2 )
		Engine.ForceNotifyModelSubscriptions( Engine.GetModel( Engine.GetModelForController( f971_arg2 ), "groups.leaderboardmaker.lbDef" ) )
		Engine.SetModelValue( Engine.GetModel( f970_local0, "groups.leaderboardmaker.state" ), "" )
		Engine.LoadLeaderboard( f970_local1, f970_local6 )
		Engine.RequestLeaderboardData( f971_arg2, Enum.LbFilter.LB_FILTER_GROUP_MEMBERS )
		GoBack( f970_arg0, f971_arg2 )
	end, false, function ()
		SetGroupsNotifyInformation( f970_arg2, "MENU_ERROR_CAPS", "GROUPS_GENERIC_ERROR_MSG", true )
	end, true )
end

function Leaderboard_TabChanged( f973_arg0, f973_arg1, f973_arg2 )
	CoD.perController[f973_arg2].selectedLeaderboardTabId = f973_arg1.tabId
end

function OpenLeaderboardMaintanencePopup( f974_arg0, f974_arg1 )
	CoD.OverlayUtility.CreateOverlay( f974_arg1, f974_arg0, "LeaderboardsDownForMaintanence" )
end

function NavigateToLeaderboardMain( f975_arg0, f975_arg1, f975_arg2 )
	local f975_local0 = NavigateToMenu( f975_arg0, f975_arg1, true, f975_arg2 )
	if LeaderboardsDownForMaintanence() then
		OpenLeaderboardMaintanencePopup( f975_local0, f975_arg2 )
	end
end

function LoadLeaderboard( f976_arg0, f976_arg1 )
	local f976_local0 = IsCustomLeaderboard( f976_arg1 )
	local f976_local1 = IsDOALeaderboard( f976_arg1 )
	local f976_local2 = IsZMMapsLeaderboard( f976_arg1 )
	local f976_local3 = IsLobbyLeaderboard( f976_arg1 )
	local f976_local4 = Engine.GetModelForController( f976_arg1 )
	local f976_local5 = Engine.GetModel( f976_local4, "leaderboards" )
	if f976_local5 == nil then
		f976_local5 = Engine.CreateModel( f976_local4, "leaderboards", true )
		Engine.CreateModel( f976_local5, "leaderboardDurationFilter", true )
		Engine.SetModelValue( Engine.CreateModel( f976_local5, "leaderboardPlayerFilter", true ), Enum.LbFilter.LB_FILTER_FRIENDS )
		Engine.SetModelValue( Engine.CreateModel( f976_local5, "leaderboardZMMapsNumPlayersFilter", true ), CoD.LeaderboardUtility.DEFAULT_ZM_MAPS_NUM_PLAYERS )
		Engine.SetModelValue( Engine.CreateModel( f976_local5, "leaderboardDOANumPlayersFilter", true ), CoD.LeaderboardUtility.DEFAULT_DOA_NUM_PLAYERS )
	end
	local f976_local6 = CoD.SafeGetModelValue( Engine.GetModelForController( f976_arg1 ), "leaderboards.leaderboardPlayerFilter" )
	if not f976_local6 then
		f976_local6 = Enum.LbFilter.LB_FILTER_FRIENDS
	end
	if f976_local6 == Enum.LbFilter.LB_FILTER_GROUP_MEMBERS then
		Engine.SetModelValue( Engine.CreateModel( f976_local5, "leaderboardPlayerFilter", true ), Enum.LbFilter.LB_FILTER_FRIENDS )
		f976_local6 = Enum.LbFilter.LB_FILTER_FRIENDS
		CoD.perController[f976_arg1].leaderboardPlayerFilter = Enum.LbFilter.LB_FILTER_FRIENDS
	end
	local f976_local7 = CoD.SafeGetModelValue( Engine.GetModelForController( f976_arg1 ), "leaderboards.leaderboardZMMapsNumPlayersFilter" )
	if not f976_local7 then
		f976_local7 = CoD.LeaderboardUtility.DEFAULT_ZM_MAPS_NUM_PLAYERS
	end
	local f976_local8 = CoD.SafeGetModelValue( Engine.GetModelForController( f976_arg1 ), "leaderboards.leaderboardDOANumPlayersFilter" )
	if not f976_local8 then
		f976_local8 = CoD.LeaderboardUtility.DEFAULT_DOA_NUM_PLAYERS
	end
	CoD.perController[f976_arg1].pivotPosition = nil
	local f976_local9 = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "leaderboardDef" ) )
	local f976_local10 = CoD.LeaderboardUtility.leaderboardInfo[f976_local9]
	local f976_local11 = CoD.SafeGetModelValue( Engine.GetModelForController( f976_arg1 ), "leaderboards.leaderboardDurationFilter" )
	local f976_local12 = LUI.startswith( f976_local9, "LB_CP_DOA_BO3_SCORE" )
	if not f976_local12 then
		f976_local12 = LUI.startswith( f976_local9, "LB_CP_DOA_BO3_ROUND" )
	end
	if f976_local2 then
		f976_local9 = f976_local9 .. "_" .. tostring( f976_local7 ) .. "PLAYER"
	end
	if f976_local1 and f976_local8 > CoD.LeaderboardUtility.DEFAULT_DOA_NUM_PLAYERS and f976_local12 then
		f976_local9 = f976_local9 .. "_" .. tostring( f976_local8 ) .. "PLAYER"
	end
	if f976_local3 then
		f976_local6 = Enum.LbFilter.LB_FILTER_LOBBY_MEMBERS
	end
	local f976_local13 = false
	for f976_local17, f976_local18 in ipairs( f976_local10.trackTypes ) do
		if f976_local11 == f976_local18 then
			f976_local13 = true
			break
		end
	end
	if f976_local13 == false then
		f976_local11 = f976_local10.trackTypes[1]
	end
	if not Dvar.ui_hideLeaderboards:get() and Engine.LoadLeaderboard( f976_local9, f976_local11 ) == true then
		f976_local15 = false
		if f976_local0 then
			f976_local15 = true
			if f976_local6 == Enum.LbFilter.LB_FILTER_CUSTOM then
				Engine.LobbyVM_CallFunc( "Leaderboard_PopulateCustomList", {
					controller = f976_arg1
				} )
			end
		end
		f976_local16 = false
		for f976_local21, f976_local22 in pairs( CoD.LeaderboardUtility.LeaderboardPlayerFilterList( f976_arg1 ) ) do
			if f976_local22.value == f976_local6 then
				f976_local16 = true
				break
			end
		end
		if f976_local16 == false then
			f976_local6 = Enum.LbFilter.LB_FILTER_FRIENDS
		end
		Engine.RequestLeaderboardData( f976_arg1, f976_local6, f976_local15 )
	end
	f976_local14 = CoD.LeaderboardUtility.GetPlayerFilterString( f976_local6 )
	f976_local15 = CoD.LeaderboardUtility.GetDurationFilterString( f976_local11 )
	f976_local16 = ""
	if f976_local2 == true then
		f976_local16 = Engine.Localize( "MPUI_X_SLASH_Y", CoD.LeaderboardUtility.GetZMMapsNumPlayersFilterString( f976_local7 ), f976_local14 )
	elseif f976_local0 == true then
		f976_local16 = Engine.Localize( "MPUI_X_SLASH_Y", f976_local14, f976_local15 )
	elseif f976_local3 == true then
		f976_local16 = Engine.Localize( f976_local15 )
	elseif #f976_local10.trackTypes > 1 == true then
		f976_local16 = Engine.Localize( "MPUI_X_SLASH_Y", f976_local14, f976_local15 )
	elseif f976_local1 and f976_local12 == true then
		f976_local16 = Engine.Localize( "MPUI_X_SLASH_Y", CoD.LeaderboardUtility.GetDOANumPlayersFilterString( f976_local8 ), f976_local14 )
	else
		f976_local16 = Engine.Localize( f976_local14 )
	end
	SetGlobalModelValue( "FilterInfo", f976_local16 )
end

function Leaderboard_SetLeaderboardDef( f977_arg0, f977_arg1, f977_arg2 )
	SetGlobalModelValue( "leaderboardDef", Engine.GetModelValue( Engine.GetModel( f977_arg1:getModel(), "lbDef" ) ) )
end

function Leaderboard_MoveUp( f978_arg0, f978_arg1, f978_arg2 )
	local f978_local0 = CoD.SafeGetModelValue( Engine.GetModelForController( f978_arg2 ), "leaderboards.leaderboardPlayerFilter" )
	if f978_local0 == Enum.LbFilter.LB_FILTER_NONE or f978_local0 == Enum.LbFilter.LB_FILTER_GROUP_MEMBERS then
		Leaderboard_MoveUp_All( f978_arg0, f978_arg1, f978_arg2 )
	else
		Leaderboard_MoveUp_Friends( f978_arg0, f978_arg1, f978_arg2 )
	end
end

function Leaderboard_MoveDown( f979_arg0, f979_arg1, f979_arg2 )
	local f979_local0 = CoD.SafeGetModelValue( Engine.GetModelForController( f979_arg2 ), "leaderboards.leaderboardPlayerFilter" )
	if f979_local0 == Enum.LbFilter.LB_FILTER_NONE or f979_local0 == Enum.LbFilter.LB_FILTER_GROUP_MEMBERS then
		Leaderboard_MoveDown_All( f979_arg0, f979_arg1, f979_arg2 )
	else
		Leaderboard_MoveDown_Friends( f979_arg0, f979_arg1, f979_arg2 )
	end
end

function Leaderboard_PageUp( f980_arg0, f980_arg1, f980_arg2 )
	local f980_local0 = CoD.SafeGetModelValue( Engine.GetModelForController( f980_arg2 ), "leaderboards.leaderboardPlayerFilter" )
	if f980_local0 == Enum.LbFilter.LB_FILTER_NONE or f980_local0 == Enum.LbFilter.LB_FILTER_GROUP_MEMBERS then
		Leaderboard_PageUp_All( f980_arg0, f980_arg1, f980_arg2 )
	else
		Leaderboard_PageUp_Friends( f980_arg0, f980_arg1, f980_arg2 )
	end
end

function Leaderboard_PageDown( f981_arg0, f981_arg1, f981_arg2 )
	local f981_local0 = CoD.SafeGetModelValue( Engine.GetModelForController( f981_arg2 ), "leaderboards.leaderboardPlayerFilter" )
	if f981_local0 == Enum.LbFilter.LB_FILTER_NONE or f981_local0 == Enum.LbFilter.LB_FILTER_GROUP_MEMBERS then
		Leaderboard_PageDown_All( f981_arg0, f981_arg1, f981_arg2 )
	else
		Leaderboard_PageDown_Friends( f981_arg0, f981_arg1, f981_arg2 )
	end
end

function Leaderboard_GoToTopOfList( f982_arg0, f982_arg1, f982_arg2 )
	local f982_local0 = CoD.SafeGetModelValue( Engine.GetModelForController( f982_arg2 ), "leaderboards.leaderboardPlayerFilter" )
	if f982_local0 == Enum.LbFilter.LB_FILTER_NONE or f982_local0 == Enum.LbFilter.LB_FILTER_GROUP_MEMBERS then
		Leaderboard_GoToTopOfList_All( f982_arg0, f982_arg1, f982_arg2 )
	else
		Leaderboard_GoToTopOfList_Friends( f982_arg0, f982_arg1, f982_arg2 )
	end
end

function Leaderboard_UpdateHeaderModel( f983_arg0, f983_arg1 )
	local f983_local0 = f983_arg0.LeaderboardHeader
	if not f983_local0 then
		return 
	end
	DataSources.LeaderboardHeader.getModel( f983_arg1 )
	if f983_local0.linkedElementModels then
		for f983_local4, f983_local5 in ipairs( f983_local0.linkedElementModels ) do
			f983_local5.element:updateElementLinkedModels( f983_local0 )
		end
	end
end

function Leaderboard_ApplyFilters( f984_arg0, f984_arg1 )
	local f984_local0 = CoD.SafeGetModelValue( Engine.GetModelForController( f984_arg1 ), "leaderboards.leaderboardPlayerFilter" ) == CoD.perController[f984_arg1].leaderboardPlayerFilter
	local f984_local1 = CoD.SafeGetModelValue( Engine.GetModelForController( f984_arg1 ), "leaderboards.leaderboardDurationFilter" ) == CoD.perController[f984_arg1].leaderboardDurationFilter
	local f984_local2 = true
	local f984_local3 = true
	if IsZMMapsLeaderboard( f984_arg1 ) then
		f984_local2 = CoD.SafeGetModelValue( Engine.GetModelForController( f984_arg1 ), "leaderboards.leaderboardZMMapsNumPlayersFilter" ) == CoD.perController[f984_arg1].leaderboardZMMapsNumPlayersFilter
	end
	if IsDOALeaderboard( f984_arg1 ) then
		f984_local3 = CoD.SafeGetModelValue( Engine.GetModelForController( f984_arg1 ), "leaderboards.leaderboardDOANumPlayersFilter" ) == CoD.perController[f984_arg1].leaderboardDOANumPlayersFilter
	end
	if f984_local0 and f984_local1 and f984_local2 and f984_local3 then
		return 
	else
		local f984_local4 = Engine.GetModel( Engine.GetModelForController( f984_arg1 ), "leaderboards" )
		Engine.SetModelValue( Engine.CreateModel( f984_local4, "leaderboardDurationFilter" ), CoD.perController[f984_arg1].leaderboardDurationFilter )
		Engine.SetModelValue( Engine.CreateModel( f984_local4, "leaderboardPlayerFilter" ), CoD.perController[f984_arg1].leaderboardPlayerFilter )
		Engine.SetModelValue( Engine.CreateModel( f984_local4, "leaderboardZMMapsNumPlayersFilter" ), CoD.perController[f984_arg1].leaderboardZMMapsNumPlayersFilter )
		Engine.SetModelValue( Engine.CreateModel( f984_local4, "leaderboardDOANumPlayersFilter" ), CoD.perController[f984_arg1].leaderboardDOANumPlayersFilter )
		LoadLeaderboard( f984_arg0, f984_arg1 )
	end
end

function Leaderboard_OpenPlayerDetails( f985_arg0, f985_arg1, f985_arg2 )
	Leaderboard_SetSelectedFriendXUID( f985_arg0, f985_arg1, f985_arg2 )
	OpenOverlay( f985_arg0, "Social_PlayerDetailsPopup", f985_arg2 )
end

function Leaderboard_SetSelectedFriendXUID( f986_arg0, f986_arg1, f986_arg2 )
	if not f986_arg1:getModel() then
		return 
	else
		local f986_local0 = Engine.GetModelValue( Engine.GetModel( f986_arg1:getModel(), "name" ) )
		local f986_local1 = Engine.GetModelValue( Engine.GetModel( f986_arg1:getModel(), "xuid" ) )
		local f986_local2 = Engine.GetPlayerInfo( f986_arg2, f986_local1 )
		local f986_local3 = Engine.GetModelForController( f986_arg2 )
		Engine.SetModelValue( Engine.CreateModel( f986_local3, "Social.selectedFriendXUID" ), f986_local1 )
		Engine.SetModelValue( Engine.CreateModel( f986_local3, "Social.selectedFriendGamertag" ), f986_local0 )
	end
end

function LeaderboardEnablePCacheBuffer( f987_arg0, f987_arg1, f987_arg2 )
	f987_arg1.setVisibleTimer = LUI.UITimer.newElementTimer( 250, true, function ()
		local f988_local0 = f987_arg0:getParent()
		local f988_local1 = f987_arg0.PlayerProfileInfoWidget
		while f988_local0 and not f988_local1 do
			f988_local1 = f988_local0.PlayerProfileInfoWidget
			f988_local0 = f988_local0:getParent()
		end
		if f988_local1 then
			f988_local1:setState( "Visible" )
		end
		local f988_local2 = f987_arg1:getModel( f987_arg2, "xuid" )
		if f988_local2 then
			f987_arg1:setupPlayerBackgroundIdUpdateByXUID( Engine.GetModelValue( f988_local2 ) )
		end
		f987_arg1.setVisibleTimer = nil
	end )
	f987_arg1:addElement( f987_arg1.setVisibleTimer )
end

function LeaderboardDisablePCacheBuffer( f989_arg0, f989_arg1, f989_arg2 )
	f989_arg1:disablePlayerBackgroundIdUpdate()
	if f989_arg1.setVisibleTimer then
		f989_arg1.setVisibleTimer:close()
		f989_arg1.setVisibleTimer = nil
	end
	local f989_local0 = f989_arg0:getParent()
	local f989_local1 = f989_arg0.PlayerProfileInfoWidget
	while f989_local0 and not f989_local1 do
		f989_local1 = f989_local0.PlayerProfileInfoWidget
		f989_local0 = f989_local0:getParent()
	end
	if f989_local1 then
		f989_local1:setState( "PCacheBuffer" )
	end
end

function SpectateScoreboardPlayer( f990_arg0, f990_arg1, f990_arg2 )
	local f990_local0 = Engine.GetModel( Engine.GetGlobalModel(), "scoreboard." .. f990_arg1 )
	if not f990_local0 then
		return 
	else
		local f990_local1 = Engine.GetModel( f990_local0, "count" )
		if not f990_local1 then
			return 
		else
			local f990_local2 = Engine.GetModelValue( f990_local1 )
			local f990_local3 = tonumber( f990_arg2 )
			if f990_local2 <= f990_local3 then
				return 
			else
				local f990_local4 = Engine.GetModel( f990_local0, f990_local3 )
				if not f990_local4 then
					return 
				else
					local f990_local5 = Engine.GetModel( f990_local4, "clientNum" )
					if not f990_local5 then
						return 
					else
						Engine.SendMenuResponse( f990_arg0, "spectate", Engine.GetModelValue( f990_local5 ) )
					end
				end
			end
		end
	end
end

function SpectateSelectedPlayer( f991_arg0, f991_arg1, f991_arg2 )
	Engine.SendMenuResponse( f991_arg2, "spectate", Engine.GetModelValue( Engine.GetModel( f991_arg1:getModel(), "clientNum" ) ) )
end

function SpectateNextAlivePlayer( f992_arg0 )
	Engine.Exec( f992_arg0, "cmd follownextalive" )
end

function SetShoutcastHighlightedPlayer( f993_arg0, f993_arg1, f993_arg2 )
	Dvar.shoutcastHighlightedClient:set( Engine.GetModelValue( Engine.GetModel( f993_arg1:getModel(), "clientNum" ) ) )
end

function ToggleCodCasterProfileValue( f994_arg0, f994_arg1 )
	if not CoD.ShoutcasterProfileVarBool( f994_arg0, f994_arg1 ) then
		CoD.SetShoutcasterProfileVarValue( f994_arg0, f994_arg1, 1 )
	else
		CoD.SetShoutcasterProfileVarValue( f994_arg0, f994_arg1, 0 )
	end
end

function ToggleCodCasterQuickSettings( f995_arg0, f995_arg1, f995_arg2, f995_arg3 )
	if not f995_arg1.profileVar and not f995_arg3 then
		return 
	end
	local f995_local0 = nil
	if f995_arg3 == nil or f995_arg3 == "" then
		f995_local0 = f995_arg1.profileVar
	else
		f995_local0 = f995_arg3
	end
	ToggleCodCasterProfileValue( f995_arg2, f995_local0 )
	local f995_local1 = f995_arg1:getModel()
	if f995_local1 then
		local f995_local2 = Engine.GetModel( f995_local1, "profileVarValue" )
		if f995_local2 then
			Engine.SetModelValue( f995_local2, CoD.ShoutcasterProfileVarBool( f995_arg2, f995_local0 ) )
		end
	end
	if Engine.IsInGame() and f995_local0 == "shoutcaster_qs_thirdperson" then
		Engine.ExecNow( f995_arg2, "shoutcaster_thirdperson " .. CoD.ShoutcasterProfileVarValue( f995_arg2, f995_local0 ) )
	end
end

function ToggleScoreboard( f996_arg0 )
	Engine.Exec( f996_arg0, "cg_togglescores" )
end

function ToggleInGamePauseMenu( f997_arg0 )
	Engine.Exec( f997_arg0, "togglemenu" )
end

function HandleTeamIdentityKeyboardComplete( f998_arg0, f998_arg1, f998_arg2, f998_arg3 )
	local f998_local0, f998_local1 = nil
	local f998_local2 = Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( f998_arg2 ), "team" ) )
	local f998_local3 = DataSources.TeamIdentityInformation.getModel( f998_arg2, f998_local2 )
	if f998_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_TEAM_IDENTITY_TEAMNAME then
		f998_local0 = Engine.GetModel( f998_local3, "teamName" )
		f998_local1 = "shoutcaster_fe_" .. f998_local2 .. "_name"
	end
	if f998_local0 then
		Engine.SetModelValue( f998_local0, f998_arg3.input )
		CoD.SetShoutcasterProfileVarValue( f998_arg2, f998_local1, f998_arg3.input )
	end
end

function SetTeamIdentityProfileValue( f999_arg0, f999_arg1, f999_arg2, f999_arg3 )
	if not f999_arg3 or f999_arg3 == "" then
		return 
	else
		local f999_local0 = Engine.GetModel( f999_arg1:getModel(), "id" )
		if not f999_local0 then
			return 
		else
			CoD.SetShoutcasterProfileVarValue( f999_arg2, "shoutcaster_fe_" .. Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( f999_arg2 ), "team" ) ) .. "_" .. f999_arg3, Engine.GetModelValue( f999_local0 ) )
		end
	end
end

function SetTeamIdentityTeamLogo( f1000_arg0, f1000_arg1, f1000_arg2 )
	local f1000_local0 = DataSources.TeamIdentityInformation.getModel( f1000_arg2, Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( f1000_arg2 ), "team" ) ) )
	local f1000_local1 = Engine.GetModelValue( Engine.GetModel( f1000_arg1:getModel(), "ref" ) )
	local f1000_local2 = Engine.GetModelValue( Engine.GetModel( f1000_arg1:getModel(), "name" ) )
	Engine.SetModelValue( Engine.GetModel( f1000_local0, "teamLogo" ), f1000_local1 )
	Engine.SetModelValue( Engine.GetModel( f1000_local0, "teamLogoName" ), f1000_local2 )
end

function SetTeamIdentityTeamColor( f1001_arg0, f1001_arg1, f1001_arg2 )
	Engine.SetModelValue( Engine.GetModel( DataSources.TeamIdentityInformation.getModel( f1001_arg2, Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( f1001_arg2 ), "team" ) ) ), "teamColor" ), Engine.GetModelValue( Engine.GetModel( f1001_arg1:getModel(), "color" ) ) )
end

function UpdateSelectedTeamIdentityColorElement( f1002_arg0, f1002_arg1, f1002_arg2 )
	local f1002_local0 = CoD.ShoutcasterProfileVarValue( f1002_arg2, "shoutcaster_fe_" .. Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( f1002_arg2 ), "team" ) ) .. "_color" )
	local f1002_local1 = Engine.GetModelValue( Engine.GetModel( f1002_arg1:getModel(), "id" ) )
	local f1002_local2 = f1002_arg0.TeamColorList:findItem( {
		id = f1002_local0
	} )
	if f1002_local2 then
		Engine.SetModelValue( Engine.GetModel( f1002_local2:getModel(), "selected" ), false )
	end
	Engine.SetModelValue( Engine.GetModel( f1002_arg1:getModel(), "selected" ), true )
end

function SaveShoutcasterSettings( f1003_arg0, f1003_arg1, f1003_arg2 )
	Engine.StorageWrite( f1003_arg2, Enum.StorageFileType.STORAGE_PROFILE_SHOUTCASTER )
end

function ChangeAbilityWheelItems( f1004_arg0, f1004_arg1, f1004_arg2 )
	local f1004_local0 = Engine.GetModel( Engine.GetModelForController( f1004_arg0 ), "hudItems.cybercomRequestedType" )
	local f1004_local1 = (Engine.GetModelValue( f1004_local0 ) + f1004_arg2 + 3) % 3
	Engine.SetModelValue( f1004_local0, f1004_local1 )
	DataSources.AbilityWheel.getModel( f1004_arg0 )
	f1004_arg1.updateButtonStates( nil, f1004_local1 + 1 )
end

function SetFileShareOverrideXuid( f1005_arg0, f1005_arg1, f1005_arg2 )
	local f1005_local0 = f1005_arg1:getModel( f1005_arg2, "xuid" )
	if f1005_local0 ~= nil then
		local f1005_local1 = Engine.GetModelValue( f1005_local0 )
		Dvar.fshRecentsXUID:set( f1005_local1 )
		OpenGenericSmallPopup( f1005_arg0, f1005_arg2, "Theater Player Overriden", "You will now be able to view fileshare as " .. tostring( f1005_local1 ), nil, "MENU_OK" )
	end
end

function OpenCODPointsIntro( f1006_arg0, f1006_arg1, f1006_arg2 )
	local f1006_local0 = Engine.StorageGetBuffer( f1006_arg2, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if Engine.GetInventoryItemQuantity( f1006_arg2, Dvar.initial_cod_points_id:get() ) > 0 and f1006_local0 and not IsJapaneseSku() and f1006_local0.codPointMsgSeen:get() == 0 then
		CoD.OverlayUtility.CreateOverlay( f1006_arg2, f1006_arg0, "InitialCODPointsOverlay" )
	end
end

function OpenBlackMarketIncentivePopup( f1007_arg0, f1007_arg1 )
	if ShouldShowSeasonPassIncentiveOverlay( f1007_arg1 ) then
		CoD.OverlayUtility.CreateOverlay( f1007_arg1, f1007_arg0, "SeasonPassIncentiveOverlay" )
	elseif IsSeasonPassIncentiveExploitPossible( f1007_arg1 ) and not CoD.isPC then
		CoD.OverlayUtility.CreateOverlay( f1007_arg1, f1007_arg0, "SeasonPassExlpoitOverlay" )
	elseif ShouldShowDigitalIncentiveOverlay( f1007_arg1 ) then
		CoD.OverlayUtility.CreateOverlay( f1007_arg1, f1007_arg0, "DigitalIncentiveOverlay" )
	elseif ShouldShowRetailIncentiveOverlay( f1007_arg1 ) then
		CoD.OverlayUtility.CreateOverlay( f1007_arg1, f1007_arg0, "RetailIncentiveOverlay" )
	elseif ShouldShowInitialCodPointsOverlay( f1007_arg1 ) then
		CoD.OverlayUtility.CreateOverlay( f1007_arg1, f1007_arg0, "InitialCODPointsOverlay" )
	else
		local f1007_local0 = CoD.StoreUtility.GetMissingCPSkuList( f1007_arg1 )
		if #f1007_local0 > 0 then
			CoD.OverlayUtility.CreateOverlay( f1007_arg1, f1007_arg0, "MissingCoDPointsRedemption", f1007_arg1, {
				skuList = f1007_local0
			} )
		else
			f1007_local0 = CoD.StoreUtility.GetMissingCurrencySkuList( f1007_arg1 )
			if #f1007_local0 > 0 then
				CoD.OverlayUtility.CreateOverlay( f1007_arg1, f1007_arg0, "MissingCurrencyRedemption", f1007_arg1, {
					skuList = f1007_local0
				} )
			end
		end
	end
end

function OpenBlackMarket( f1008_arg0, f1008_arg1, f1008_arg2 )
	if Engine.PushAnticheatMessageToUI( f1008_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.LOOT ) then
		DisplayAnticheatMessage( f1008_arg0, f1008_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.LOOT, "", "" )
		return 
	elseif Engine.IsUserGuest( f1008_arg2 ) then
		LuaUtils.UI_ShowErrorMessageDialog( f1008_arg2, "MENU_GUEST_CONTENT_RESTRICTED" )
		return 
	end
	for f1008_local0 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
		if CheckIfFeatureIsBanned( f1008_local0, LuaEnums.FEATURE_BAN.LOOT ) then
			LuaUtils.UI_ShowErrorMessageDialog( f1008_arg2, GetFeatureBanInfo( f1008_local0, LuaEnums.FEATURE_BAN.LOOT ) )
			return 
		end
	end
	OpenOverlay( f1008_arg0, "BlackMarket", f1008_arg2 )
end

function OpenPCQuit( f1009_arg0, f1009_arg1, f1009_arg2 )
	if CoD.isPC then
		CoD.OverlayUtility.CreateOverlay( f1009_arg2, f1009_arg0, "QuitPCGamePopup" )
	end
end

function OpenPCResetControlsPopup( f1010_arg0, f1010_arg1, f1010_arg2 )
	if CoD.isPC then
		CoD.OverlayUtility.CreateOverlay( f1010_arg2, f1010_arg0, "ResetPCControls" )
	end
end

function ResetPCControlsToDefault( f1011_arg0, f1011_arg1, f1011_arg2 )
	if Dvar.ui_execdemo_gamescom:get() then
		Engine.ExecNow( f1011_arg2, "resetprofilecommon" )
		Engine.ExecNow( f1011_arg2, "updategamerprofile" )
		Engine.ExecNow( f1011_arg2, "storagereset stats_mp_offline" )
	end
	Engine.SetProfileVar( f1011_arg2, "input_invertpitch", 0 )
	Engine.SetProfileVar( f1011_arg2, "gpad_rumble", 1 )
	Engine.SetProfileVar( f1011_arg2, "gpad_sticksConfig", CoD.THUMBSTICK_DEFAULT )
	Engine.SetProfileVar( f1011_arg2, "gpad_buttonsConfig", CoD.BUTTONS_DEFAULT )
	Engine.SetProfileVar( f1011_arg2, "input_viewSensitivity", CoD.SENSITIVITY_2 )
	Engine.SetProfileVar( f1011_arg2, "input_viewSensitivityHorizontal", CoD.SENSITIVITY_2 )
	Engine.SetProfileVar( f1011_arg2, "input_viewSensitivityVertical", CoD.SENSITIVITY_2 )
	Engine.SetProfileVar( f1011_arg2, "flipped_control_config", 0 )
	Engine.SetProfileVar( f1011_arg2, "mouseSensitivity", 5 )
	Engine.ExecNow( f1011_arg2, "defaultbindings" )
	Engine.ExecNow( f1011_arg2, "execcontrollerbindings" )
	Engine.SyncHardwareProfileWithDvars()
	f1011_arg0:dispatchEventToRoot( {
		name = "options_refresh",
		controller = f1011_arg2
	} )
end

function OpenPCApplyGraphicsPopup( f1012_arg0, f1012_arg1, f1012_arg2 )
	if CoD.isPC then
		CoD.OverlayUtility.CreateOverlay( f1012_arg2, f1012_arg0, "ApplyPCGraphics" )
	end
end

function ApplyPCGraphicsOptions( f1013_arg0, f1013_arg1, f1013_arg2 )
	Engine.ApplyHardwareProfileSettings()
	Engine.SetTextureQuality( tonumber( Engine.GetHardwareProfileValueAsString( "r_picmip" ) ) )
	Engine.SetShadowQuality( CoD.PCUtil.ShadowOptionIndex )
	Engine.SetVolumetricQuality( CoD.PCUtil.VolumetricOptionIndex )
	Engine.SyncHardwareProfileWithDvars()
	Engine.SaveHardwareProfile()
	Engine.Exec( nil, "vid_restart" )
	if f1013_arg0.occludedMenu and f1013_arg0.occludedMenu.id == "Menu.StartMenu_Options_Graphics_PC" then
		f1013_arg0.occludedMenu:addElement( LUI.UITimer.newElementTimer( 500, true, function ()
			Engine.SyncHardwareProfileWithDvars()
			Engine.SaveHardwareProfile()
			CoD.PCUtil.RefreshAllOptions( f1013_arg0.occludedMenu, f1013_arg2 )
		end ) )
	end
end

function ResetPCGraphicsOptions( f1015_arg0, f1015_arg1, f1015_arg2 )
	Engine.ResetHardwareProfileSettings()
	CoD.PCUtil.ShadowOptionIndex = Engine.GetShadowQuality()
	CoD.PCUtil.VolumetricOptionIndex = Engine.GetVolumetricQuality()
	Engine.Exec( nil, "vid_restart" )
	CoD.PCUtil.RefreshAllOptions( f1015_arg1, f1015_arg2 )
end

function HideIfUsingMouse( f1016_arg0, f1016_arg1 )
	if CoD.isPC then
		if Engine.LastInput_Gamepad() then
			f1016_arg0:setAlpha( 1 )
		else
			f1016_arg0:setAlpha( 0 )
		end
	end
end

function HideMouseCursor( f1017_arg0 )
	if CoD.isPC then
		Engine.HideMouseCursor()
		f1017_arg0.mouseCursorHidden = true
	end
end

function ShowMouseCursor( f1018_arg0 )
	if CoD.isPC then
		Engine.ShowMouseCursor()
		f1018_arg0.mouseCursorHidden = nil
	end
end

function UIKeyboardCancel( f1019_arg0, f1019_arg1 )
	Engine.Exec( f1019_arg1, "ui_keyboard_cancel" )
end

function UIKeyboardComplete( f1020_arg0, f1020_arg1 )
	Engine.Exec( f1020_arg1, "ui_keyboard_complete" )
end

function ServerBrowserQuickRefresh( f1021_arg0, f1021_arg1 )
	Engine.SteamServerBrowser_QuickRefresh()
end

function ServerBrowserCancelRequest( f1022_arg0 )
	Engine.SteamServerBrowser_CancelServerRequest()
end

function RefreshLobbyServerBrowser( f1023_arg0 )
	if f1023_arg0.serverType then
		Engine.SteamServerBrowser_RequestServers( f1023_arg0.serverType )
	else
		Engine.SteamServerBrowser_RequestServers( Engine.SteamServerBrowser_GetCurrentServerRequestType() )
	end
end

function ServerBrowserRefreshServer( f1024_arg0, f1024_arg1, f1024_arg2, f1024_arg3 )
	local f1024_local0 = f1024_arg1:getModel()
	if f1024_local0 then
		Engine.SteamServerBrowser_RefreshServer( Engine.GetModelValue( Engine.GetModel( f1024_local0, "serverIndex" ) ) )
	end
end

function ServerBrowserSetFavorite( f1025_arg0, f1025_arg1, f1025_arg2, f1025_arg3 )
	local f1025_local0 = f1025_arg1:getModel()
	if f1025_local0 then
		local f1025_local1 = Engine.GetModelValue( Engine.GetModel( f1025_local0, "serverIndex" ) )
		local f1025_local2 = Engine.GetModelValue( Engine.GetModel( f1025_local0, "name" ) )
		if f1025_arg2.serverType == Enum.SteamServerRequestType.STEAM_SERVER_REQUEST_TYPE_FAVORITES then
			Engine.SteamServerBrowser_RemoveFavoriteServer( f1025_local1, false )
			CoD.OverlayUtility.ShowToast( "DefaultState", Engine.Localize( "PLATFORM_SERVER_REMOVED_FROM_FAVORITES" ), f1025_local2 )
		elseif f1025_arg2.serverType == Enum.SteamServerRequestType.STEAM_SERVER_REQUEST_TYPE_HISTORY then
			Engine.SteamServerBrowser_RemoveFavoriteServer( f1025_local1, true )
			CoD.OverlayUtility.ShowToast( "DefaultState", Engine.Localize( "PLATFORM_SERVER_REMOVED_FROM_HISTORY" ), f1025_local2 )
		else
			Engine.SteamServerBrowser_AddFavoriteServer( f1025_local1, false )
			CoD.OverlayUtility.ShowToast( "DefaultState", Engine.Localize( "PLATFORM_SERVER_ADDED_TO_FAVORITES" ), f1025_local2 )
		end
	end
end

function ServerBrowserToggleFilter( f1026_arg0, f1026_arg1, f1026_arg2, f1026_arg3 )
	local f1026_local0 = f1026_arg1:getModel()
	if f1026_local0 then
		local f1026_local1 = Engine.GetModel( f1026_local0, "attribute" )
		if f1026_local1 then
			local f1026_local2 = Engine.GetModelValue( f1026_local1 )
			if f1026_local2 == "any" then
				Engine.SteamServerBrowser_ClearAttributeFilters()
			else
				Engine.SteamServerBrowser_SetAttributeFilter( f1026_local2, not Engine.SteamServerBrowser_IsAttributeFilterActive( f1026_local2 ) )
			end
		else
			local f1026_local2 = Engine.GetModelValue( Engine.GetModel( f1026_local0, "type" ) )
			local f1026_local3 = Engine.GetModelValue( Engine.GetModel( f1026_local0, "id" ) )
			if f1026_local3 == "any" then
				Engine.SteamServerBrowser_ClearFilter( f1026_local2 )
			elseif Engine.SteamServerBrowser_IsFilterActive( f1026_local2, f1026_local3 ) then
				Engine.SteamServerBrowser_RemoveFilter( f1026_local2, f1026_local3 )
			else
				Engine.SteamServerBrowser_AddFilter( f1026_local2, f1026_local3 )
			end
		end
	end
end

function ServerSettingsEditName( f1027_arg0, f1027_arg1, f1027_arg2 )
	ShowKeyboard( f1027_arg0, f1027_arg1, f1027_arg2, "KEYBOARD_TYPE_SERVER_NAME" )
end

function ServerSettingsEditDescription( f1028_arg0, f1028_arg1, f1028_arg2 )
	ShowKeyboard( f1028_arg0, f1028_arg1, f1028_arg2, "KEYBOARD_TYPE_SERVER_DESCRIPTION" )
end

function ServerSettingsEditPassword( f1029_arg0, f1029_arg1, f1029_arg2 )
	ShowKeyboard( f1029_arg0, f1029_arg1, f1029_arg2, "KEYBOARD_TYPE_SERVER_PASSWORD" )
end

function ServerSettingsHandleKeyboardComplete( f1030_arg0, f1030_arg1, f1030_arg2, f1030_arg3 )
	if f1030_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_SERVER_NAME then
		Dvar.live_steam_server_name:set( f1030_arg3.input )
	elseif f1030_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_SERVER_DESCRIPTION then
		Dvar.live_steam_server_description:set( f1030_arg3.input )
	elseif f1030_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_SERVER_PASSWORD then
		Dvar.live_steam_server_password:set( f1030_arg3.input )
	end
end

function ServerBrowserRequestPlayersList( f1031_arg0, f1031_arg1 )
	local f1031_local0 = f1031_arg0:getModel()
	if f1031_local0 then
		Engine.SteamServerBrowser_RequestPlayersInfo( Engine.GetModelValue( Engine.GetModel( f1031_local0, "serverIndex" ) ) )
	end
end

function ServerFiltersEditKeywords( f1032_arg0, f1032_arg1, f1032_arg2 )
	ShowKeyboard( f1032_arg0, f1032_arg1, f1032_arg2, "KEYBOARD_TYPE_SERVER_FILTER_KEYWORDS" )
end

function ServerFiltersHandleKeyboardComplete( f1033_arg0, f1033_arg1, f1033_arg2, f1033_arg3 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "steamServer.keywordsFilter" ), f1033_arg3.input )
	CoD.PCUtil.SetServerKeywordsFilter( f1033_arg3.input )
end

function SetVerticaListSpacerHeight( f1034_arg0, f1034_arg1 )
	if f1034_arg1 then
		local f1034_local0 = Engine.GetModelValue( f1034_arg1 )
		if f1034_local0 then
			f1034_arg0:setTopBottom( true, false, 0, f1034_local0 )
		end
	end
end

function ToggleMouse( f1035_arg0, f1035_arg1 )
	f1035_arg0:toggleMouse()
end

function EnableMouseButton( f1036_arg0, f1036_arg1 )
	f1036_arg0:setHandleMouseButton( true )
end

function DisableMouseButton( f1037_arg0, f1037_arg1 )
	f1037_arg0:setHandleMouseButton( false )
end

function EnableMouseButtonOnElement( f1038_arg0, f1038_arg1 )
	f1038_arg0:setHandleMouseButton( true )
end

function DisableMouseButtonOnElement( f1039_arg0, f1039_arg1 )
	f1039_arg0:setHandleMouseButton( false )
end

function DisableMouseOnElement( f1040_arg0, f1040_arg1, f1040_arg2 )
	if f1040_arg0[f1040_arg1] then
		f1040_arg0[f1040_arg1]:setMouseDisabled( true )
	end
end

function EnableMouseOnElement( f1041_arg0, f1041_arg1, f1041_arg2 )
	if f1041_arg0[f1041_arg1] then
		f1041_arg0[f1041_arg1]:setMouseDisabled( false )
	end
end

function DisableMouseOnMenuElement( f1042_arg0, f1042_arg1, f1042_arg2 )
	if f1042_arg0[f1042_arg1] then
		f1042_arg0[f1042_arg1]:setMouseDisabled( true )
	end
end

function EnableMouseOnMenuElement( f1043_arg0, f1043_arg1, f1043_arg2 )
	if f1043_arg0[f1043_arg1] then
		f1043_arg0[f1043_arg1]:setMouseDisabled( false )
	end
end

function ToggleDropdownListInUse_Console( f1044_arg0, f1044_arg1 )
	f1044_arg0.inUse = not f1044_arg0.inUse
	if f1044_arg0.inUse == true then
		if f1044_arg0.DropdownList then
			MakeFocusable( f1044_arg0.DropdownList )
			SetLoseFocusToElement( f1044_arg0, "DropdownRoot", f1044_arg1 )
			SetFocusToElement( f1044_arg0, "DropdownList", f1044_arg1 )
		end
	elseif f1044_arg0.DropdownList then
		SetState( f1044_arg0, "DefaultState" )
		MakeNotFocusable( f1044_arg0.DropdownList )
		MakeFocusable( f1044_arg0.DropdownRoot )
		SetLoseFocusToElement( f1044_arg0, "DropdownList", f1044_arg1 )
		SetFocusToElement( f1044_arg0, "DropdownRoot", f1044_arg1 )
	end
end

function DropDownListItemClick_Console( f1045_arg0, f1045_arg1, f1045_arg2 )
	
end

function Gunsmith_OpenCreateVariantNamePopup( f1046_arg0, f1046_arg1, f1046_arg2 )
	CoD.OverlayUtility.CreateOverlay( f1046_arg2, f1046_arg0, "GunsmithCreateVariantNameOverlay", f1046_arg2, f1046_arg1 )
end

function Gunsmith_OpenSaveVariantPopup( f1047_arg0, f1047_arg1, f1047_arg2, f1047_arg3 )
	CoD.OverlayUtility.CreateOverlay( f1047_arg2, f1047_arg0, "GunsmithSaveVariant", f1047_arg2, f1047_arg1 )
end

function Gunsmith_TabChanged( f1048_arg0, f1048_arg1, f1048_arg2 )
	DataSources.CraftWeaponList.setCurrentFilterItem( f1048_arg1.filter )
	CoD.perController[f1048_arg2].weaponCategory = f1048_arg1.filter
	f1048_arg0.weaponList:updateDataSource( true )
	f1048_arg0.weaponList:setActiveItem( f1048_arg0.weaponList:getFirstSelectableItem() )
	if CoD.perController[f1048_arg2].gunsmithWeaponCategoryRestored == true then
		CoD.SetCustomization( f1048_arg2, f1048_arg0.tabList.Tabs.grid.activeWidget.gridInfoTable.zeroBasedIndex + 1, "category_index" )
	end
end

function Gunsmith_Back( f1049_arg0, f1049_arg1, f1049_arg2 )
	CoD.perController[f1049_arg2].gunsmithWeaponCategoryRestored = nil
	CoD.perController[f1049_arg2].gunsmithWeaponListIndex = nil
	CoD.perController[f1049_arg2].gunsmithAttachmentType = nil
	CoD.perController[f1049_arg2].gunsmithAttachmentModel = nil
	CoD.perController[f1049_arg2].gunsmithCamoIndexModel = nil
	CoD.perController[f1049_arg2].gunsmithReticleIndexModel = nil
	CoD.perController[f1049_arg2].gunsmithVariantModel = nil
	CoD.perController[f1049_arg2].gunsmithAttachmentVariantModel = nil
	CoD.perController[f1049_arg2].emptyVariantSelected = nil
	CoD.CraftUtility.Gunsmith.CachedVariants = {}
end

function Gunsmith_GainFocus( f1050_arg0, f1050_arg1, f1050_arg2 )
	CoD.SetCustomization( f1050_arg2, Engine.GetModelValue( f1050_arg1:getModel( f1050_arg2, "itemIndex" ) ), "weapon_index" )
	if f1050_arg0.tabList then
		CoD.SetCustomization( f1050_arg2, f1050_arg0.tabList.Tabs.grid.activeWidget.gridInfoTable.zeroBasedIndex + 1, "category_index" )
	end
	CoD.CraftUtility.Gunsmith.DisplayBaseWeapon( f1050_arg0, f1050_arg1, f1050_arg2 )
	CoD.GunsmithWeaponOptionsTable = nil
end

function Gunsmith_ChooseWeaponList( f1051_arg0, f1051_arg1, f1051_arg2 )
	f1051_arg0:updateMode( Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST, f1051_arg1 )
	f1051_arg0.variantSelector.variantList:setActiveItem( f1051_arg0.variantSelector.variantList:getFirstSelectableItem() )
end

function Gunsmith_BrowseVariants( f1052_arg0, f1052_arg1, f1052_arg2 )
	f1052_arg0.variantSelector.variantList:updateDataSource( true )
	f1052_arg0:updateMode( Enum.GunsmithMode.GUNSMITHMODE_VARIANTS, f1052_arg1 )
	CoD.perController[f1052_arg2].gunsmithWeaponListIndex = f1052_arg0.weaponList.activeWidget.gridInfoTable.zeroBasedIndex + 1
	CoD.perController[f1052_arg2].gunsmithWeaponCategoryRestored = false
	CoD.perController[f1052_arg2].gunsmithAttachmentType = "attachment"
end

function Gunsmith_HandleKeyboardComplete( f1053_arg0, f1053_arg1, f1053_arg2, f1053_arg3 )
	local f1053_local0 = CoD.perController[f1053_arg2].gunsmithVariantModel
	local f1053_local1 = nil
	if not f1053_local0 then
		return 
	elseif f1053_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_GUNSMITH then
		f1053_local1 = Engine.GetModel( f1053_local0, "variantTextEntry" )
		if f1053_local1 then
			Engine.SetModelValue( f1053_local1, f1053_arg3.input )
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1053_arg2 ), "Gunsmith.validVariantNameEntered" ), true )
		end
		local f1053_local2 = f1053_arg0:getModel( f1053_arg2, "inputText" )
		if f1053_local2 then
			Engine.SetModelValue( f1053_local2, f1053_arg3.input )
		end
	end
end

function Gunsmith_CreateVariantNameBack( f1054_arg0, f1054_arg1, f1054_arg2 )
	Engine.SetModelValue( Engine.GetModel( f1054_arg0:getModel(), "variantTextEntry" ), Engine.Localize( "MENU_GUNSMITH_ENTER_VARIANT_NAME" ) )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1054_arg2 ), "Gunsmith.validVariantNameEntered" ), false )
end

function Gunsmith_FocusOccupiedVariant( f1055_arg0, f1055_arg1, f1055_arg2 )
	CoD.perController[f1055_arg2].gunsmithVariantModel = f1055_arg1:getModel()
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f1055_arg2, CoD.perController[f1055_arg2].gunsmithVariantModel )
end

function Gunsmith_ChooseEmptyVariant( f1056_arg0, f1056_arg1, f1056_arg2 )
	CoD.perController[f1056_arg2].gunsmithVariantModel = f1056_arg1:getModel()
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1056_arg2 ), "Gunsmith.validVariantNameEntered" ), false )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f1056_arg2, CoD.perController[f1056_arg2].gunsmithVariantModel )
	CoD.perController[f1056_arg2].emptyVariantSelected = true
end

function Gunsmith_EditVariant( f1057_arg0, f1057_arg1, f1057_arg2 )
	CoD.perController[f1057_arg2].gunsmithVariantModel = f1057_arg1:getModel()
	CoD.perController[f1057_arg2].confirmVariantNameButtonPressed = true
end

function Gunsmith_ConfirmVariantName( f1058_arg0, f1058_arg1, f1058_arg2, f1058_arg3 )
	local f1058_local0 = f1058_arg0:getModel()
	local f1058_local1 = Engine.GetModelValue( Engine.GetModel( f1058_local0, "variantTextEntry" ) )
	Engine.SetModelValue( Engine.GetModel( f1058_local0, "variantName" ), f1058_local1 )
	local f1058_local2 = GoBack( f1058_arg3, f1058_arg2 )
	if f1058_local2 then
		CoD.perController[f1058_arg2].confirmVariantNameButtonPressed = true
		f1058_local2:openOverlay( "GunsmithCustomizeVariant", f1058_arg2 )
		Engine.SetModelValue( Engine.GetModel( f1058_local0, "variantNameBig" ), f1058_local1 )
	end
end

function Gunsmith_SetWeaponAttachmentType( f1059_arg0, f1059_arg1, f1059_arg2, f1059_arg3, f1059_arg4, f1059_arg5 )
	CoD.perController[f1059_arg5].gunsmithAttachmentType = f1059_arg2
	CoD.perController[f1059_arg5].gunsmithAttachmentIsZombieMode = f1059_arg4
	CoD.perController[f1059_arg5].gunsmithAttachmentModel = f1059_arg0:getModel( f1059_arg5, "attachment" .. f1059_arg3 )
	CoD.perController[f1059_arg5].gunsmithAttachmentVariantModel = f1059_arg0:getModel( f1059_arg5, "attachmentVariant" .. f1059_arg3 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1059_arg5 ), "Gunsmith.GunsmithSelectedItemProperties.attachmentType" ), f1059_arg2 )
end

function Gunsmith_ClearAttachmentSlot( f1060_arg0, f1060_arg1, f1060_arg2, f1060_arg3 )
	Engine.SetModelValue( f1060_arg0:getModel( f1060_arg3, "attachment" .. f1060_arg2 ), CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
	Engine.SetModelValue( f1060_arg0:getModel( f1060_arg3, "attachmentVariant" .. f1060_arg2 ), CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
	if f1060_arg2 == 1 or f1060_arg2 == "1" then
		Engine.SetModelValue( f1060_arg0:getModel( f1060_arg3, "reticleIndex" ), CoD.CraftUtility.Gunsmith.RETICLE_NONE )
	end
	Gunsmith_ClearItemName( f1060_arg3 )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f1060_arg3, f1060_arg0:getModel(), true )
end

function Gunsmith_ClearCamo( f1061_arg0, f1061_arg1, f1061_arg2 )
	Engine.SetModelValue( f1061_arg0:getModel( f1061_arg2, "camoIndex" ), CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
	Gunsmith_ClearItemName( f1061_arg2 )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f1061_arg2, f1061_arg0:getModel(), true )
end

function Gunsmith_ClearVariantPaintjobSlot( f1062_arg0, f1062_arg1, f1062_arg2 )
	local f1062_local0 = f1062_arg0:getModel( f1062_arg2, "paintjobSlot" )
	local f1062_local1 = f1062_arg0:getModel( f1062_arg2, "paintjobIndex" )
	Engine.SetModelValue( f1062_local0, Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
	Engine.SetModelValue( f1062_local1, Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
	Gunsmith_ClearItemName( f1062_arg2 )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f1062_arg2, f1062_arg0:getModel(), true )
end

function Gunsmith_SelectAttachment( f1063_arg0, f1063_arg1, f1063_arg2 )
	local f1063_local0 = f1063_arg1:getModel()
	local f1063_local1 = CoD.perController[f1063_arg2].gunsmithVariantModel
	local f1063_local2 = {}
	if f1063_local0 and f1063_local1 then
		local f1063_local3 = Engine.GetModelValue( Engine.GetModel( f1063_local0, "attachmentIndex" ) )
		local f1063_local4 = Engine.GetModelValue( Engine.GetModel( f1063_local0, "acvIndex" ) )
		local f1063_local5 = 0
		for f1063_local6 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f1063_local9 = Engine.GetModelValue( Engine.GetModel( f1063_local1, "attachment" .. f1063_local6 ) )
			if f1063_local9 > 0 and f1063_local3 ~= f1063_local9 and not Engine.AreAttachmentsCompatibleByAttachmentID( f1063_local3, f1063_local9 ) then
				f1063_local5 = f1063_local9
				table.insert( f1063_local2, f1063_local6 )
			end
		end
		for f1063_local6 = 1, #f1063_local2, 1 do
			local f1063_local9 = Engine.GetModel( f1063_local1, "attachment" .. f1063_local2[f1063_local6] )
			local f1063_local10 = Engine.GetModel( f1063_local1, "attachmentVariant" .. f1063_local2[f1063_local6] )
			Engine.SetModelValue( f1063_local9, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
			Engine.SetModelValue( f1063_local10, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		end
		CoD.CraftUtility.Gunsmith.ClearVariantSlotByAttachmentIndex( f1063_arg2, f1063_local1, f1063_local3 )
		Engine.SetModelValue( f1063_arg0:getModel(), f1063_local3 )
		Engine.SetModelValue( CoD.perController[f1063_arg2].gunsmithAttachmentVariantModel, f1063_local4 )
	end
end

function Gunsmith_FocusAttachment( f1064_arg0, f1064_arg1, f1064_arg2, f1064_arg3 )
	local f1064_local0 = CoD.GetCustomization( f1064_arg2, "weapon_index" )
	local f1064_local1 = Engine.GetModelValue( f1064_arg1:getModel( f1064_arg2, "attachmentIndex" ) )
	local f1064_local2 = Engine.GetAttachmentRefByIndex( f1064_local1 )
	local f1064_local3 = Engine.GetModelValue( f1064_arg0:getModel() )
	local f1064_local4 = Engine.GetAttachmentRefByIndex( f1064_local3 )
	local f1064_local5 = CoD.perController[f1064_arg2].gunsmithVariantModel
	local f1064_local6 = CoD.CraftUtility.GetLoadoutSlot( f1064_arg2 )
	local f1064_local7 = "select01"
	local f1064_local8 = Engine.GetItemRef( f1064_local0, Enum.eModes.MODE_MULTIPLAYER ) .. CoD.CraftUtility.GetModeAbbreviation()
	for f1064_local13, f1064_local14 in ipairs( CoD.CraftUtility.Gunsmith.GetVariantAttachmentList( f1064_arg2, f1064_local5 ) ) do
		if f1064_local14 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
			local f1064_local12 = Engine.GetAttachmentRefByIndex( f1064_local14 )
			if (not Engine.IsOpticByAttachmentIndex( f1064_local1 ) or not Engine.IsOpticByAttachmentIndex( f1064_local14 )) and Engine.AreAttachmentsCompatibleByAttachmentID( f1064_local1, f1064_local14 ) then
				f1064_local8 = f1064_local8 .. "+" .. f1064_local12
			end
		end
	end
	f1064_local8 = f1064_local8 .. "+" .. f1064_local2
	if CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX < f1064_local3 and f1064_local2 ~= f1064_local4 then
		f1064_local8 = string.gsub( f1064_local8, "+" .. f1064_local4, "" )
	end
	f1064_local9 = ""
	if f1064_arg3 == false then
		f1064_local9 = CoD.CraftUtility.Gunsmith.GetWeaponAttachmentStringWithoutVariants( f1064_arg2, f1064_local5 )
	else
		f1064_local9 = CoD.CraftUtility.Gunsmith.GetAttachmentVariantStringWithSelectedVariant( f1064_arg2, f1064_local5, f1064_local3, Engine.GetModelValue( f1064_arg1:getModel( f1064_arg2, "variantIndex" ) ) )
	end
	if not CoD.CraftUtility.Gunsmith.IsFocusAttachmentEquipped( f1064_arg2, f1064_local5, f1064_local1 ) then
		f1064_local9 = f1064_local9 .. f1064_local2 .. ",0"
	end
	f1064_local11 = "none"
	if f1064_local8 and f1064_local8 ~= "" then
		Engine.SendClientScriptNotify( f1064_arg2, "CustomClass_focus" .. CoD.GetLocalClientAdjustedNum( f1064_arg2 ), f1064_local6, f1064_local8, f1064_local2, f1064_local11, f1064_local9 )
	end
end

function Gunsmith_SetAttachmentVariant( f1065_arg0, f1065_arg1, f1065_arg2 )
	local f1065_local0 = f1065_arg1:getModel()
	local f1065_local1 = Engine.GetModelValue( Engine.GetModel( f1065_local0, "variantIndex" ) )
	local f1065_local2 = Engine.GetModelValue( Engine.GetModel( f1065_local0, "attachmentIndex" ) )
	local f1065_local3 = CoD.perController[f1065_arg2].gunsmithVariantModel
	if f1065_local2 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX and CoD.CraftUtility.Gunsmith.IsFocusAttachmentEquipped( f1065_arg2, f1065_local3, f1065_local2 ) then
		CoD.CraftUtility.Gunsmith.SetFocusAttachmentVariant( f1065_arg2, f1065_local3, f1065_local2, f1065_local1 )
	end
end

function Gunsmith_FocusCamo( f1066_arg0, f1066_arg1, f1066_arg2 )
	local f1066_local0 = Engine.GetModelValue( f1066_arg1:getModel( f1066_arg2, "itemIndex" ) )
	if IsGunsmithItemWeaponOptionLocked( f1066_arg0, f1066_arg1, f1066_arg2 ) then
		f1066_local0 = 0
	end
	local f1066_local1 = CoD.perController[f1066_arg2].gunsmithVariantModel
	local f1066_local2 = Engine.GetModelValue( Engine.GetModel( f1066_local1, "paintjobSlot" ) )
	local f1066_local3 = Engine.GetModelValue( Engine.GetModel( f1066_local1, "paintjobIndex" ) )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f1066_arg2, CoD.perController[f1066_arg2].gunsmithVariantModel, false, nil, nil, f1066_local0 )
end

function Gunsmith_SetWeaponCamoModel( f1067_arg0, f1067_arg1, f1067_arg2 )
	CoD.perController[f1067_arg2].gunsmithCamoIndexModel = f1067_arg0:getModel( f1067_arg2, "camoIndex" )
	Engine.SendClientScriptNotify( f1067_arg2, "cam_customization_focus" .. CoD.GetLocalClientAdjustedNum( f1067_arg2 ), "primary", "select01" )
end

function Gunsmith_SelectCamo( f1068_arg0, f1068_arg1, f1068_arg2 )
	local f1068_local0 = f1068_arg1:getModel( f1068_arg2, "itemIndex" )
	if f1068_local0 then
		Engine.SetModelValue( f1068_arg0:getModel(), Engine.GetModelValue( f1068_local0 ) )
	end
end

function Gunsmith_FocusReticle( f1069_arg0, f1069_arg1, f1069_arg2 )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f1069_arg2, CoD.perController[f1069_arg2].gunsmithVariantModel, false, nil, nil, Engine.GetModelValue( Engine.GetModel( CoD.perController[f1069_arg2].gunsmithVariantModel, "camoIndex" ) ) )
end

function Gunsmith_SetWeaponReticleModel( f1070_arg0, f1070_arg1, f1070_arg2 )
	CoD.perController[f1070_arg2].gunsmithReticleIndexModel = f1070_arg0:getModel( f1070_arg2, "reticleIndex" )
	Engine.SendClientScriptNotify( f1070_arg2, "cam_customization_focus", "primary", "select01" )
end

function Gunsmith_SelectReticle( f1071_arg0, f1071_arg1, f1071_arg2 )
	local f1071_local0 = f1071_arg1:getModel( f1071_arg2, "weaponOptionSubIndex" )
	if f1071_local0 then
		Engine.SetModelValue( f1071_arg0:getModel(), Engine.GetModelValue( f1071_local0 ) )
	end
end

function Gunsmith_SetWeaponOptionAsOld( f1072_arg0, f1072_arg1, f1072_arg2 )
	local f1072_local0 = f1072_arg1:getModel()
	local f1072_local1 = CoD.GetCustomization( f1072_arg2, "weapon_index" )
	local f1072_local2 = CoD.SafeGetModelValue( f1072_local0, "weaponOptionType" )
	local f1072_local3 = CoD.SafeGetModelValue( f1072_local0, "filterMode" )
	if f1072_local2 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE then
		local f1072_local4 = CoD.SafeGetModelValue( CoD.perController[f1072_arg2].gunsmithVariantModel, "attachment1" )
		if f1072_local4 then
			f1072_local1 = f1072_local4
		end
	end
	SetWeaponOptionAsOldInternal( f1072_arg0, f1072_arg1, f1072_arg2, f1072_local1 )
end

function Gunsmith_SetAttachmentAsOld( f1073_arg0, f1073_arg1 )
	local f1073_local0 = CoD.GetCustomization( f1073_arg1, "weapon_index" )
	local f1073_local1 = f1073_arg0:getModel( f1073_arg1, "attachmentIndex" )
	if f1073_local1 then
		local f1073_local2 = Engine.GetAttachmentIndexByAttachmentTableIndex( f1073_local0, Engine.GetModelValue( f1073_local1 ) )
		if CoD.CACUtility.EmptyItemIndex < f1073_local2 then
			Engine.SetAttachmentAsOld( f1073_arg1, f1073_local0, f1073_local2 )
		end
	end
end

function Gunsmith_SetACVASOld( f1074_arg0, f1074_arg1 )
	local f1074_local0 = CoD.GetCustomization( f1074_arg1, "weapon_index" )
	local f1074_local1 = f1074_arg0.attachmentTableIndex
	local f1074_local2 = f1074_arg0.variantIndex
	if f1074_local1 and f1074_local2 then
		SetACVASOldInternal( f1074_arg1, f1074_local0, f1074_local1, f1074_local2, Enum.eModes.MODE_MULTIPLAYER )
	end
end

function Gunsmith_SetSelectedItemName( f1075_arg0, f1075_arg1, f1075_arg2, f1075_arg3, f1075_arg4 )
	if f1075_arg1.m_focusable then
		local f1075_local0 = f1075_arg1:getModel()
		local f1075_local1 = Engine.CreateModel( Engine.GetModelForController( f1075_arg4 ), "Gunsmith.GunsmithSelectedItemProperties.itemName" )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1075_arg4 ), "Gunsmith.GunsmithSelectedItemProperties.attachmentType" ), f1075_arg2 )
		Engine.SetModelValue( f1075_local1, "" )
		if f1075_arg2 == "attachment" or f1075_arg2 == "optic" then
			local f1075_local2 = Engine.GetModelValue( f1075_arg0:getModel( f1075_arg4, "attachment" .. f1075_arg3 ) )
			if f1075_local2 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				Engine.SetModelValue( f1075_local1, Engine.GetAttachmentNameByIndex( f1075_local2 ) )
				Gunsmith_SetWeaponAttachmentType( f1075_arg0, f1075_arg1, f1075_arg2, f1075_arg3, false, f1075_arg4 )
			end
		elseif f1075_arg2 == "camo" and f1075_arg3 == "" then
			local f1075_local2 = Engine.GetModelValue( f1075_arg0:getModel( f1075_arg4, "camoIndex" ) )
			local f1075_local3 = CoD.GetCustomization( f1075_arg4, "weapon_index" )
			if f1075_local2 ~= CoD.CraftUtility.Gunsmith.CAMO_NONE and f1075_local3 > CoD.CACUtility.EmptyItemIndex then
				local f1075_local4 = Engine.GetModel( Engine.GetWeaponOptionsInfoModelByIndex( f1075_arg4, f1075_local2, "WeaponOptions", f1075_local3, 0 ), "name" )
				if f1075_local4 then
					Engine.SetModelValue( f1075_local1, Engine.GetModelValue( f1075_local4 ) )
				end
			end
		elseif f1075_arg2 == "paintjob" and f1075_arg3 == "" then
			local f1075_local2 = Engine.GetModelValue( f1075_arg1:getModel( f1075_arg4, "paintjobSlot" ) )
			local f1075_local5 = Engine.GetModelValue( f1075_arg1:getModel( f1075_arg4, "paintjobIndex" ) )
			if f1075_local2 ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and f1075_local5 ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
				Engine.SetModelValue( f1075_local1, CoD.CraftUtility.Paintjobs.GetPaintjobName( f1075_arg4, f1075_local2, f1075_local5 ) )
			end
		elseif f1075_arg2 == "snapshot" and f1075_arg3 == "" then
			Engine.SetModelValue( f1075_local1, Engine.Localize( "MENU_GUNSMITH_SNAPSHOT_SUBHEADER" ) )
		end
	end
end

function Gunsmith_ClearVariant( f1076_arg0, f1076_arg1, f1076_arg2 )
	CoD.CraftUtility.Gunsmith.ClearVariant( f1076_arg2, Engine.GetModelValue( Engine.GetModel( CoD.perController[f1076_arg2].gunsmithVariantModel, "variantIndex" ) ) )
	local f1076_local0 = nil
	if IsMediaManager() == true then
		f1076_local0 = GoBackMultiple( f1076_arg0, f1076_arg2, 1 )
		MediaManagerMarkDirty( f1076_arg2 )
	else
		f1076_local0 = GoBackMultiple( f1076_arg0, f1076_arg2, 2 )
	end
	if f1076_local0.variantSelector ~= nil and f1076_local0.variantSelector.variantList ~= nil then
		f1076_local0.variantSelector.variantList:updateDataSource( true )
		f1076_local0.variantSelector.variantList:setActiveItem( f1076_local0.variantSelector.variantList:getFirstSelectableItem() )
	end
	if Engine.GetModel( Engine.GetModelForController( f1076_arg2 ), "Gunsmith.UpdateDataSource" ) ~= nil then
		ForceNotifyModel( f1076_arg2, "Gunsmith.UpdateDataSource" )
	end
end

function Gunsmith_CopyVariant( f1077_arg0, f1077_arg1, f1077_arg2, f1077_arg3, f1077_arg4 )
	local f1077_local0 = CoD.CraftUtility.Gunsmith.Copy( f1077_arg2, Engine.GetModelValue( Engine.GetModel( CoD.perController[f1077_arg2].gunsmithVariantModel, "variantIndex" ) ) )
	if f1077_local0 then
		local f1077_local1 = GoBack( f1077_arg4, f1077_arg2 )
		local f1077_local2 = f1077_local1.variantSelector.variantList
		f1077_local2:updateDataSource( true )
		local f1077_local3 = f1077_local2:findItem( {
			variantIndex = f1077_local0
		} )
		if f1077_local3 then
			f1077_local2:setActiveItem( f1077_local3 )
		end
		ForceNotifyModel( f1077_arg2, "Gunsmith.UpdateDataSource" )
	end
end

function Gunsmith_RenameVariant( f1078_arg0, f1078_arg1, f1078_arg2 )
	local f1078_local0 = f1078_arg0:getModel()
	CoD.CraftUtility.Gunsmith.RenameVariant( f1078_arg2, Engine.GetModelValue( Engine.GetModel( f1078_local0, "variantIndex" ) ), Engine.GetModelValue( Engine.GetModel( f1078_local0, "variantName" ) ) )
end

function Gunsmith_HandleRenameKeyboardComplete( f1079_arg0, f1079_arg1, f1079_arg2, f1079_arg3 )
	local f1079_local0 = f1079_arg0:getModel()
	local f1079_local1, f1079_local2 = nil
	if not f1079_local0 then
		return 
	elseif f1079_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_GUNSMITH then
		f1079_local1 = Engine.GetModel( f1079_local0, "variantName" )
		f1079_local2 = Engine.GetModel( f1079_local0, "variantNameBig" )
	end
	if f1079_local1 then
		Engine.SetModelValue( f1079_local1, f1079_arg3.input )
		Gunsmith_ClearSelectedGunsmithVariantStats( f1079_arg2 )
	end
	if f1079_local2 then
		Engine.SetModelValue( f1079_local2, f1079_arg3.input )
	end
end

function Gunsmith_ClearSelectedGunsmithVariantStats( f1080_arg0 )
	local f1080_local0 = CoD.perController[f1080_arg0].gunsmithVariantModel
	if f1080_local0 then
		local f1080_local1 = Engine.GetModelValue( Engine.GetModel( f1080_local0, "variantIndex" ) )
		CoD.CraftUtility.Gunsmith.ClearVariantStats( f1080_arg0, f1080_local1, Enum.eModes.MODE_MULTIPLAYER )
		CoD.CraftUtility.Gunsmith.ClearVariantStats( f1080_arg0, f1080_local1, Enum.eModes.MODE_CAMPAIGN )
	end
end

function Gunsmith_SaveChangesButtonAction( f1081_arg0, f1081_arg1, f1081_arg2, f1081_arg3 )
	local f1081_local0 = CoD.perController[f1081_arg3].gunsmithVariantModel
	local f1081_local1 = MediaManagerGetQuotaForCategory( f1081_arg3, "variant" )
	if f1081_arg2 == "save" then
		CoD.CraftUtility.Gunsmith.WriteVaraintDataToDDL( f1081_arg3, f1081_local0 )
		ForceNotifyModel( f1081_arg3, "Gunsmith.UpdateDataSource" )
		Gunsmith_RecordComScoreEvent( f1081_arg0, f1081_arg3, f1081_local0, "save", f1081_local1.categorySlotsUsed, f1081_local1.categoryQuota )
	else
		Gunsmith_RecordComScoreEvent( f1081_arg0, f1081_arg3, f1081_local0, "discard" )
	end
	local f1081_local2 = GoBack( f1081_arg0, f1081_arg3 )
	local f1081_local3 = GoBack( f1081_local2, f1081_arg3 )
	ClearMenuSavedState( f1081_local2 )
	local f1081_local4 = Engine.GetModelValue( Engine.GetModel( f1081_local0, "variantIndex" ) )
	f1081_local3.variantSelector.variantList:updateDataSource( true )
	f1081_local3.attachmentList:updateDataSource( true )
	f1081_local3.variantSelector.variantList:findItem( {
		variantIndex = f1081_local4
	}, nil, true, nil )
	CoD.perController[f1081_arg3].emptyVariantSelected = false
end

function Gunsmith_PaintjobSelector_GainFocus( f1082_arg0, f1082_arg1, f1082_arg2 )
	CoD.perController[f1082_arg2].selectedpaintjobModel = f1082_arg1:getModel()
	CoD.perController[f1082_arg2].viewIndex = 1
	local f1082_local0 = CoD.Paintshop.View[CoD.perController[f1082_arg2].viewIndex].customization_type
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f1082_arg2, CoD.perController[f1082_arg2].gunsmithVariantModel, false, Engine.GetModelValue( f1082_arg1:getModel( f1082_arg2, "paintjobSlot" ) ), Engine.GetModelValue( f1082_arg1:getModel( f1082_arg2, "paintjobIndex" ) ), nil )
	SetHeadingKickerText( "MENU_GUNSMITH_CAPS" )
end

function Gunsmith_OpenPaintjobSelector( f1083_arg0, f1083_arg1, f1083_arg2 )
	CoD.SetCustomization( f1083_arg2, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT, "type" )
	CoD.perController[f1083_arg2].totalLayers = Enum.CustomizationTypeLayerCount.CUSTOMIZATION_TYPE_PAINTSHOP_MAX_LAYERS
	CoD.perController[f1083_arg2].totalGroups = Enum.CustomizationTypeGroupCount.CUSTOMIZATION_TYPE_MAX_GROUPS
	local f1083_local0 = CoD.CraftUtility.Paintjobs.ParseDDL( f1083_arg2, Enum.StorageFileType.STORAGE_PAINTJOBS )
end

function Gunsmith_PaintjobSelector_ChooseOccupiedPaintjob( f1084_arg0, f1084_arg1, f1084_arg2 )
	local f1084_local0 = Engine.GetModelValue( f1084_arg1:getModel( f1084_arg2, "paintjobSlot" ) )
	local f1084_local1 = Engine.GetModelValue( f1084_arg1:getModel( f1084_arg2, "paintjobIndex" ) )
	local f1084_local2 = f1084_arg0:getModel( f1084_arg2, "paintjobSlot" )
	local f1084_local3 = f1084_arg0:getModel( f1084_arg2, "paintjobIndex" )
	local f1084_local4 = f1084_arg0:getModel( f1084_arg2, "paintjobSlotAndIndex" )
	Engine.SetModelValue( f1084_local2, f1084_local0 )
	Engine.SetModelValue( f1084_local3, f1084_local1 )
	Engine.SetModelValue( f1084_local4, f1084_local0 .. " " .. f1084_local1 )
end

function Gunsmith_ClearCACWithUpdatedVariant( f1085_arg0, f1085_arg1 )
	local f1085_local0 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f1085_arg1].gunsmithVariantModel, "variantIndex" ) ) + 1
	local f1085_local1 = function ( f1086_arg0, f1086_arg1, f1086_arg2 )
		local f1086_local0 = Engine.GetClassItem( f1085_arg1, f1086_arg0, f1086_arg1, f1086_arg2 )
		if f1086_local0 > CoD.CACUtility.EmptyItemIndex and f1086_local0 == f1085_local0 then
			Engine.SetClassItem( f1085_arg1, f1086_arg0, f1086_arg1, CoD.CACUtility.EmptyItemIndex, f1086_arg2 )
		end
	end
	
	local f1085_local2 = function ( f1087_arg0 )
		local f1087_local0 = Engine.GetCustomClassCount( f1085_arg1, f1087_arg0 )
		for f1087_local1 = 1, f1087_local0, 1 do
			local f1087_local4 = f1087_local1 - 1
			f1085_local1( f1087_local4, "primarygunsmithvariant", f1087_arg0 )
			f1085_local1( f1087_local4, "secondarygunsmithvariant", f1087_arg0 )
		end
	end
	
	f1085_local2( Enum.eModes.MODE_CAMPAIGN )
	f1085_local2( Enum.eModes.MODE_MULTIPLAYER )
end

function Gunsmith_SnapshotToggleDisplayProperty( f1088_arg0, f1088_arg1, f1088_arg2 )
	local f1088_local0 = f1088_arg1:getModel( f1088_arg2, "param" )
	if f1088_local0 then
		local f1088_local1 = Engine.GetModelValue( f1088_local0 )
		if f1088_local1 then
			local f1088_local2 = Engine.GetModel( Engine.GetGlobalModel(), f1088_local1 )
			if f1088_local2 then
				Engine.SetModelValue( f1088_local2, (Engine.GetModelValue( f1088_local2 ) + 1) % 2 )
			end
		end
	end
end

function Gunsmith_SnapshotToggleControlsUI( f1089_arg0, f1089_arg1, f1089_arg2 )
	local f1089_local0 = Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.ShowControls" )
	if f1089_local0 then
		Engine.SetModelValue( f1089_local0, (Engine.GetModelValue( f1089_local0 ) + 1) % 2 )
	end
end

function Gunsmith_SnapshotToggleStatsFilter( f1090_arg0, f1090_arg1, f1090_arg2 )
	local f1090_local0 = Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.SessionMode" )
	if f1090_local0 then
		if Engine.GetModelValue( f1090_local0 ) == Enum.eModes.MODE_CAMPAIGN then
			Engine.SetModelValue( f1090_local0, Enum.eModes.MODE_MULTIPLAYER )
		else
			Engine.SetModelValue( f1090_local0, Enum.eModes.MODE_CAMPAIGN )
		end
	end
end

function CopyModelFindElement( f1091_arg0, f1091_arg1, f1091_arg2 )
	local f1091_local0 = f1091_arg1
	while f1091_local0 and not f1091_local0[f1091_arg2] do
		f1091_local0 = f1091_local0:getParent()
	end
	if f1091_local0 and f1091_local0[f1091_arg2] then
		f1091_local0[f1091_arg2]:setModel( f1091_arg1:getModel() )
	end
end

function StartMenuGoBack_ListElement( f1092_arg0, f1092_arg1, f1092_arg2, f1092_arg3, f1092_arg4 )
	StartMenuGoBack( f1092_arg4, f1092_arg2 )
end

function StartMenuGoBack( f1093_arg0, f1093_arg1 )
	StartMenuResumeGame( f1093_arg0, f1093_arg1 )
	GoBack( f1093_arg0, f1093_arg1 )
	ClearSavedState( f1093_arg0, f1093_arg1 )
end

function StartMenuResumeGame( f1094_arg0, f1094_arg1 )
	if Engine.IsInGame() and Engine.CanPauseGame() and not Engine.IsDemoPlaying() then
		Engine.SetDvar( "cl_paused", 0 )
	end
	if Engine.IsInGame() then
		Engine.SetActiveMenu( f1094_arg1, CoD.UIMENU_NONE )
	end
	PrepareCloseMenuInSafehouse( f1094_arg1 )
end

function UnpauseGame( f1095_arg0, f1095_arg1 )
	if Engine.IsInGame() and Engine.CanPauseGame() and not Engine.IsDemoPlaying() then
		Engine.SetDvar( "cl_paused", 0 )
	end
end

function CloseStartMenu( f1096_arg0, f1096_arg1 )
	local f1096_local0 = GoBackToMenu( f1096_arg0, f1096_arg1, "StartMenu_Main" )
	if f1096_local0.menuName == "StartMenu_Main" or f1096_local0.menuName == "DOA_INGAME_PAUSE" then
		StartMenuGoBack( f1096_local0, f1096_arg1 )
	end
end

function RefreshLobbyRoom( f1097_arg0, f1097_arg1 )
	if Engine.IsInGame() then
		return 
	end
	local f1097_local0 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyGameMode" )
	local f1097_local1 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" )
	local f1097_local2 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.room" )
	if f1097_local2 then
		local f1097_local3 = Engine.GetModelValue( f1097_local2 )
		if f1097_local3 == "auto" then
			f1097_local3 = Engine.GetAbbreviationForMode( Engine.GetMostRecentPlayedMode( f1097_arg1 ) )
			if Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK ) == true then
				f1097_local3 = f1097_local3 .. "_local"
			end
			if IsCustomLobby() then
				f1097_local3 = f1097_local3 .. "_custom"
			end
		end
		SendCustomClientScriptMenuStateChangeNotify( f1097_arg1, "Main", true, f1097_local3 )
		f1097_arg0.previousRoom = f1097_local3
	end
end

function UpdatePlayerInspection( f1098_arg0, f1098_arg1, f1098_arg2 )
	local f1098_local0 = Engine.GetModelValue( Engine.GetModel( f1098_arg1:getModel(), "xuid" ) )
	if Engine.XuidIsValid( f1098_local0 ) then
		Engine.SendClientScriptNotify( f1098_arg2, "inspect_player", Engine.UInt64ToString( f1098_local0 ) )
	end
end

function UpdateGamerprofile( f1099_arg0, f1099_arg1, f1099_arg2 )
	Engine.Exec( f1099_arg2, "updategamerprofile" )
end

function OpenPaintshop( f1100_arg0, f1100_arg1, f1100_arg2, f1100_arg3, f1100_arg4 )
	if Engine.PushAnticheatMessageToUI( f1100_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.UGC ) then
		DisplayAnticheatMessage( f1100_arg0, f1100_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.UGC, "Paintshop", "" )
		return 
	elseif CheckIfFeatureIsBanned( f1100_arg2, LuaEnums.FEATURE_BAN.USER_GENERATED_CONTENT ) then
		LuaUtils.UI_ShowErrorMessageDialog( f1100_arg2, GetFeatureBanInfo( f1100_arg2, LuaEnums.FEATURE_BAN.USER_GENERATED_CONTENT ) )
		return 
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1100_arg2 ), "Paintshop.Mode" ), Enum.PaintshopMode.PAINTSHOPMODE_WEAPONLIST )
	CoD.SetCustomization( f1100_arg2, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT, "type" )
	CoD.perController[f1100_arg2].totalLayers = Enum.CustomizationTypeLayerCount.CUSTOMIZATION_TYPE_PAINTSHOP_MAX_LAYERS
	CoD.perController[f1100_arg2].totalGroups = Enum.CustomizationTypeGroupCount.CUSTOMIZATION_TYPE_MAX_GROUPS
	if CoD.CraftUtility.Paintjobs.ParseDDL( f1100_arg2, Enum.StorageFileType.STORAGE_PAINTJOBS ) then
		f1100_arg4:openOverlay( "Paintshop", f1100_arg2 )
	end
end

function OpenEmblemSelect( f1101_arg0, f1101_arg1, f1101_arg2, f1101_arg3, f1101_arg4 )
	CoD.SetCustomization( f1101_arg2, Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM, "type" )
	Engine.ExecNow( f1101_arg2, "emblemgetprofile" )
	CoD.perController[f1101_arg2].selectedEmblemTabStorageType = f1101_arg3
	if CoD.CraftUtility.Emblems.ParseDDL( f1101_arg2, CoD.perController[f1101_arg2].selectedEmblemTabStorageType ) then
		f1101_arg4:openOverlay( "EmblemSelect", f1101_arg2 )
	end
end

function OpenEmblemEditor( f1102_arg0, f1102_arg1, f1102_arg2, f1102_arg3, f1102_arg4 )
	if Engine.PushAnticheatMessageToUI( f1102_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.UGC ) then
		DisplayAnticheatMessage( f1102_arg1, f1102_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.UGC, "EmblemEditor", f1102_arg4 )
		return 
	elseif CheckIfFeatureIsBanned( f1102_arg2, LuaEnums.FEATURE_BAN.USER_GENERATED_CONTENT ) then
		LuaUtils.UI_ShowErrorMessageDialog( f1102_arg2, GetFeatureBanInfo( f1102_arg2, LuaEnums.FEATURE_BAN.USER_GENERATED_CONTENT ) )
		return 
	elseif f1102_arg4 == "EmblemSelect" then
		EmblemSelect_ChooseEmblem( f1102_arg1, f1102_arg0, f1102_arg2 )
		OpenOverlay( f1102_arg1, "EmblemEditor", f1102_arg2, "", "" )
	elseif f1102_arg4 == "PaintjobSelect" then
		PaintjobSelector_ChoosePaintjob( f1102_arg1, f1102_arg0, f1102_arg2 )
		OpenOverlay( f1102_arg1, "EmblemEditor", f1102_arg2, "", "" )
	end
end

function OpenGunsmith( f1103_arg0, f1103_arg1, f1103_arg2, f1103_arg3, f1103_arg4 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1103_arg2 ), "Gunsmith.Mode" ), Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST )
	if CoD.CraftUtility.Gunsmith.ParseDDL( f1103_arg2, Enum.StorageFileType.STORAGE_GUNSMITH ) and CoD.CraftUtility.Paintjobs.ParseDDL( f1103_arg2, Enum.StorageFileType.STORAGE_PAINTJOBS ) then
		f1103_arg4:openOverlay( "Gunsmith", f1103_arg2 )
		CoD.perController[f1103_arg2].emptyVariantSelected = false
	end
end

function OpenCallingCards( f1104_arg0, f1104_arg1, f1104_arg2, f1104_arg3, f1104_arg4 )
	f1104_arg4:openOverlay( "CallingCards", f1104_arg2 )
end

function OpenGroups( f1105_arg0, f1105_arg1, f1105_arg2, f1105_arg3, f1105_arg4 )
	if IsGroupsEnabled() then
		InitializeGroups( f1105_arg0, nil, f1105_arg2 )
		GoBackAndOpenOverlayOnParent( f1105_arg0, "Groups", f1105_arg2 )
		CoD.FileshareUtility.SetFileshareMode( f1105_arg2, Enum.FileshareMode.FILESHARE_MODE_GROUPS )
	end
end

function ToggleGroupShowcaseContentFavorite( f1106_arg0, f1106_arg1, f1106_arg2, f1106_arg3, f1106_arg4 )
	local f1106_local0 = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	if f1106_local0 and CoD.perController[f1106_arg2].selectedGroup then
		local f1106_local1 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f1106_arg2].selectedGroup, "groupId" ) )
		if not CoD.FileshareUtility.GetSelectedItemProperty( "favoriteInCurrGroup" ) then
			Engine.FavoriteFileInGroupsShowcase( f1106_arg2, f1106_local1, f1106_local0 )
			OpenGroupsNotifyPopup( f1106_arg4, f1106_arg1, f1106_arg2, true, "favorite_file_in_showcase_task_complete", function ()
				CoD.FileshareUtility.ShowToastForProcessingGroupShowcaseAction( f1106_arg2, CoD.FileshareUtility.ToastTypes.GROUP_FAVORITE )
				Close( f1106_arg0, f1106_arg2 )
			end, true )
		else
			Engine.UnfavoriteFileFromGroupsShowcase( f1106_arg2, f1106_local1, f1106_local0 )
			OpenGroupsNotifyPopup( f1106_arg4, f1106_arg1, f1106_arg2, true, "unfavorite_file_from_showcase_task_complete", function ()
				CoD.FileshareUtility.ShowToastForProcessingGroupShowcaseAction( f1106_arg2, CoD.FileshareUtility.ToastTypes.GROUP_UNFAVORITE )
				Close( f1106_arg0, f1106_arg2 )
			end, true )
		end
	end
end

function ToggleGroupShowcaseContentFeatured( f1109_arg0, f1109_arg1, f1109_arg2, f1109_arg3, f1109_arg4 )
	local f1109_local0 = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	if f1109_local0 and CoD.perController[f1109_arg2].selectedGroup then
		local f1109_local1 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f1109_arg2].selectedGroup, "groupId" ) )
		if not CoD.FileshareUtility.GetSelectedItemProperty( "featuredInCurrGroup" ) then
			Engine.FeatureFileInGroupsShowcase( f1109_arg2, f1109_local1, f1109_local0 )
			OpenGroupsNotifyPopup( f1109_arg4, f1109_arg1, f1109_arg2, true, "feature_file_in_showcase_task_complete", function ()
				RemoveGroupShowcaseItemFromUnfeaturedList( f1109_local1, f1109_local0 )
				CoD.FileshareUtility.ShowToastForProcessingGroupShowcaseAction( f1109_arg2, CoD.FileshareUtility.ToastTypes.GROUP_FEATURE )
				Close( f1109_arg0, f1109_arg2 )
			end, true, function ( f1111_arg0, f1111_arg1, f1111_arg2 )
				if Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f1111_arg2 ), "groups.notificationMessage" ) ) == "GROUPS_ERROR_TEAM_SHOWCASE_COUNT_EXCEEDED_FEATURE" then
					CoD.perController[f1111_arg2].previousFileId = f1109_local0
					CoD.perController[f1111_arg2].previousFileName = CoD.FileshareUtility.GetSelectedItemProperty( "fileName" )
					CoD.perController[f1111_arg2].previousFileCategory = CoD.FileshareUtility.GetSelectedItemProperty( "fileCategory" )
					local f1111_local0 = GoBack( f1111_arg0, f1111_arg2 )
					OpenPopup( f1109_arg0, "GroupRemoveFeaturedItem", f1111_arg2 )
					Close( f1111_local0, f1111_arg2 )
				end
			end )
		else
			Engine.UnfeatureFileFromGroupsShowcase( f1109_arg2, f1109_local1, f1109_local0 )
			OpenGroupsNotifyPopup( f1109_arg4, f1109_arg1, f1109_arg2, true, "unfeature_file_from_showcase_task_complete", function ()
				AddGroupShowcaseItemToUnfeaturedList( f1109_local1, f1109_local0 )
				CoD.FileshareUtility.ShowToastForProcessingGroupShowcaseAction( f1109_arg2, CoD.FileshareUtility.ToastTypes.GROUP_UNFEATURE )
				Close( f1109_arg0, f1109_arg2 )
			end, true )
		end
	end
end

function SwitchGroupShowcaseContentFeatured( f1113_arg0, f1113_arg1, f1113_arg2, f1113_arg3 )
	local f1113_local0 = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	local f1113_local1 = CoD.perController[f1113_arg2].previousFileId
	local f1113_local2 = CoD.perController[f1113_arg2].previousFileName
	local f1113_local3 = CoD.perController[f1113_arg2].previousFileCategory
	CoD.perController[f1113_arg2].previousFileId = nil
	CoD.perController[f1113_arg2].previousFileName = nil
	CoD.perController[f1113_arg2].previousFileCategory = nil
	if f1113_local0 and f1113_local1 and CoD.perController[f1113_arg2].selectedGroup then
		local f1113_local4 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f1113_arg2].selectedGroup, "groupId" ) )
		Engine.UnfeatureFileFromGroupsShowcase( f1113_arg2, f1113_local4, f1113_local0, f1113_local1 )
		OpenGroupsNotifyPopup( f1113_arg3, f1113_arg1, f1113_arg2, true, "unfeature_file_from_showcase_task_complete", function ( f1114_arg0, f1114_arg1, f1114_arg2 )
			AddGroupShowcaseItemToUnfeaturedList( f1113_local4, f1113_local0 )
			OpenGroupsNotifyPopup( f1114_arg0, f1114_arg1, f1114_arg2, true, "feature_file_in_showcase_task_complete", function ()
				RemoveGroupShowcaseItemFromUnfeaturedList( f1113_local4, f1113_local1 )
				CoD.FileshareUtility.ShowToastForProcessingGroupShowcaseAction( f1114_arg2, CoD.FileshareUtility.ToastTypes.GROUP_FEATURE, f1113_local2, f1113_local3 )
			end, true )
		end, true )
	end
end

function RemoveFileFromGroupsShowcase( f1116_arg0, f1116_arg1, f1116_arg2, f1116_arg3, f1116_arg4 )
	local f1116_local0 = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	local f1116_local1 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f1116_arg2].selectedGroup, "groupId" ) )
	if f1116_local0 then
		Engine.RemoveFileFromGroupsShowcase( f1116_arg2, f1116_local0, f1116_local1 )
		OpenGroupsNotifyPopup( f1116_arg4, f1116_arg1, f1116_arg2, true, "remove_file_from_showcase_task_complete", function ()
			CoD.FileshareUtility.ShowToastForProcessingGroupShowcaseAction( f1116_arg2, CoD.FileshareUtility.ToastTypes.GROUP_REMOVE )
			Close( f1116_arg0, f1116_arg2 )
		end, true )
	end
end

function PublishFileToGroupsShowcase( f1118_arg0, f1118_arg1, f1118_arg2, f1118_arg3, f1118_arg4 )
	local f1118_local0 = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	if f1118_local0 then
		Engine.PublishFileToGroupsShowcase( f1118_arg2, f1118_local0 )
		OpenGroupsNotifyPopup( f1118_arg4, f1118_arg1, f1118_arg2, true, "publish_file_to_showcase_task_complete", function ()
			CoD.FileshareUtility.ShowToastForProcessingGroupShowcaseAction( f1118_arg2, CoD.FileshareUtility.ToastTypes.GROUP_PUBLISH )
			Close( f1118_arg0, f1118_arg2 )
		end, true )
	end
end

function GroupsHandleGoBack( f1120_arg0, f1120_arg1, f1120_arg2 )
	ClearSelectedGroup( f1120_arg0, f1120_arg1, f1120_arg2 )
	CoD.perController[f1120_arg2].openMediaTabAfterClosingGroups = true
	GoBackAndOpenOverlayOnParent( f1120_arg0, "StartMenu_Main", f1120_arg2 )
end

function OpenPersonalizeCharacter( f1121_arg0, f1121_arg1, f1121_arg2, f1121_arg3, f1121_arg4 )
	CoD.LobbyBase.OpenPersonalizeCharacter( f1121_arg4, f1121_arg2 )
end

function OpenChooseCharacterLoadout( f1122_arg0, f1122_arg1, f1122_arg2, f1122_arg3, f1122_arg4 )
	CoD.CCUtility.customizationMode = Enum.eModes.MODE_MULTIPLAYER
	CoD.LobbyBase.OpenChooseCharacterLoadout( f1122_arg4, f1122_arg2, f1122_arg3 )
end

function EditClanTag( f1123_arg0, f1123_arg1, f1123_arg2 )
	ShowKeyboard( f1123_arg0, f1123_arg1, f1123_arg2, "KEYBOARD_TYPE_CLAN_TAG" )
end

function OpenPopupMenuByNameParam( f1124_arg0, f1124_arg1, f1124_arg2, f1124_arg3, f1124_arg4 )
	f1124_arg4:openPopup( f1124_arg3, f1124_arg2 )
end

function HandleDemoKeyboardComplete( f1125_arg0, f1125_arg1, f1125_arg2, f1125_arg3 )
	if f1125_arg3.modeName == f1125_arg1.keyboardName then
		f1125_arg1.Text:setText( f1125_arg3.text )
	end
end

function OpenDemoKeyboard( f1126_arg0, f1126_arg1, f1126_arg2, f1126_arg3, f1126_arg4 )
	if f1126_arg4 and f1126_arg4 ~= "" then
		Engine.Exec( f1126_arg2, "demo_keyboard " .. f1126_arg3 .. " " .. f1126_arg4 )
	else
		Engine.Exec( f1126_arg2, "demo_keyboard " .. f1126_arg3 )
	end
	f1126_arg1.keyboardName = f1126_arg3
end

function OpenDemoSaveKeyboard( f1127_arg0, f1127_arg1, f1127_arg2, f1127_arg3 )
	local f1127_local0 = nil
	local f1127_local1 = CoD.FileshareUtility.GetCurrentCategory()
	if f1127_local1 == "clip_private" then
		if f1127_arg3 == "name" then
			f1127_local0 = "clipName"
		elseif f1127_arg3 == "desc" then
			f1127_local0 = "clipDesc"
		end
	elseif f1127_local1 == "screenshot_private" then
		if f1127_arg3 == "name" then
			f1127_local0 = "screenshotName"
		elseif f1127_arg3 == "desc" then
			f1127_local0 = "screenshotDesc"
		end
	end
	if not f1127_local0 then
		return 
	else
		OpenDemoKeyboard( f1127_arg0, f1127_arg1, f1127_arg2, f1127_local0, "" )
	end
end

function StartMenuUploadClip( f1128_arg0, f1128_arg1, f1128_arg2, f1128_arg3, f1128_arg4 )
	local f1128_local0 = Engine.GetDemoStreamedDownloadProgress()
	if f1128_local0 < 100 then
		CoD.Menu.OpenDemoErrorPopup( f1128_arg0, {
			controller = event.controller,
			titleText = Engine.Localize( "MENU_NOTICE" ),
			messageText = Engine.Localize( "MPUI_DEMO_DOWNLOAD_IN_PROGRESS", math.floor( f1128_local0 ) )
		} )
		return 
	end
	Engine.ExecNow( f1128_arg2, "demo_updatesavepopupuimodels clip" )
	Engine.ExecNow( f1128_arg2, "setupThumbnailForFileshareSave clip" )
	if IsInGame() and ShowOutOfClipsWarning( f1128_arg2 ) then
		CoD.OverlayUtility.CreateOverlay( f1128_arg2, f1128_arg4, "ClipsUnavailableForPurchase" )
	else
		CoD.FileshareUtility.OpenPrivateUploadPopup( f1128_arg0, f1128_arg2, "clip_private", function ( f1129_arg0 )
			Engine.SaveAndUploadClip( f1129_arg0, 0 )
		end )
	end
end

function UploadClip_GoBack( f1130_arg0, f1130_arg1, f1130_arg2, f1130_arg3 )
	local f1130_local0 = GoBack( f1130_arg0, f1130_arg2 )
	ClearMenuSavedState( f1130_arg0 )
	if f1130_local0.menuName == "TimelineEditor" then
		Engine.Exec( f1130_arg2, "setupThumbnailsForManageSegments" )
	else
		ResetThumbnailViewer( f1130_arg2 )
	end
	if Engine.IsClipModified() == false and f1130_local0.menuName == "EndDemoPopup" then
		GoBack( f1130_local0, f1130_arg2 )
	end
	Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.uploadPopupOpen" ), false )
end

function StartMenuOpenManageSegments( f1131_arg0, f1131_arg1, f1131_arg2, f1131_arg3, f1131_arg4 )
	OpenPopupMenuByNameParam( f1131_arg0, f1131_arg1, f1131_arg2, "TimelineEditor", f1131_arg4 )
end

function StartMenuOpenCustomizeHighlightReel( f1132_arg0, f1132_arg1, f1132_arg2, f1132_arg3, f1132_arg4 )
	CoD.OverlayUtility.CreateOverlay( f1132_arg2, f1132_arg0, "DemoCustomizeHighlightReelPopup" )
end

function StartMenuJumpToStart( f1133_arg0, f1133_arg1, f1133_arg2, f1133_arg3, f1133_arg4 )
	Engine.Exec( f1133_arg2, "demo_jumptostart" )
	GoBack( f1133_arg0, f1133_arg2 )
end

function StartMenuEndDemo( f1134_arg0, f1134_arg1, f1134_arg2, f1134_arg3, f1134_arg4 )
	local f1134_local0 = f1134_arg0
	while f1134_local0 and not f1134_local0.openMenu do
		f1134_local0 = f1134_local0:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( f1134_arg2, f1134_local0, "EndDemoPopup" )
end

function DemoSwitchPlayer( f1135_arg0, f1135_arg1 )
	if f1135_arg1 == nil or f1135_arg1 == "" then
		return 
	end
	local f1135_local0 = nil
	if f1135_arg1 == "next" then
		f1135_local0 = 0
	elseif f1135_arg1 == "prev" then
		f1135_local0 = 1
	end
	Engine.Exec( f1135_arg0, "demo_switchplayer " .. f1135_local0 )
end

function UpdateDemoTimeScale( f1136_arg0, f1136_arg1 )
	local f1136_local0 = CoD.DemoUtility.GetRoundedTimeScale()
	local f1136_local1 = tonumber( f1136_arg1 )
	local f1136_local2 = f1136_local0 + f1136_local1
	if not (f1136_local1 <= 0 or f1136_local2 > Dvar.demo_maxTimeScale:get()) or f1136_local1 < 0 and f1136_local2 >= 0.1 then
		Engine.Exec( f1136_arg0, "demo_timescale " .. f1136_local2 )
	end
end

function UpdateDemoCameraMode( f1137_arg0, f1137_arg1 )
	if f1137_arg1 == nil or f1137_arg1 == "" then
		return 
	end
	local f1137_local0 = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.cameraMode" ) )
	local f1137_local1 = nil
	if f1137_arg1 == "next" or f1137_arg1 == "cycle" then
		if f1137_local0 == Enum.demoCameraMode.DEMO_CAMERA_MODE_NONE then
			f1137_local1 = Enum.demoCameraMode.DEMO_CAMERA_MODE_THIRDPERSON
		elseif f1137_local0 == Enum.demoCameraMode.DEMO_CAMERA_MODE_THIRDPERSON then
			f1137_local1 = Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM
		elseif f1137_arg1 == "cycle" then
			f1137_local1 = Enum.demoCameraMode.DEMO_CAMERA_MODE_NONE
		else
			return 
		end
	elseif f1137_arg1 == "prev" then
		if f1137_local0 == Enum.demoCameraMode.DEMO_CAMERA_MODE_THIRDPERSON then
			f1137_local1 = Enum.demoCameraMode.DEMO_CAMERA_MODE_NONE
		elseif f1137_local0 == Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM then
			f1137_local1 = Enum.demoCameraMode.DEMO_CAMERA_MODE_THIRDPERSON
		else
			return 
		end
	end
	Engine.SwitchDemoCameraMode( f1137_local1 )
end

function GetNextDemoFastForwardTimeScale()
	local f1138_local0 = CoD.DemoUtility.GetRoundedTimeScale()
	local f1138_local1 = nil
	if f1138_local0 >= 6 then
		f1138_local1 = 1
	elseif f1138_local0 >= 4 then
		f1138_local1 = 6
	elseif f1138_local0 >= 2 then
		f1138_local1 = 4
	elseif f1138_local0 >= 1 then
		f1138_local1 = 2
	else
		f1138_local1 = 1
	end
	return f1138_local1
end

function UpdateDemoFastForward( f1139_arg0 )
	local f1139_local0 = GetNextDemoFastForwardTimeScale()
	Engine.ExecNow( f1139_arg0, "demo_timescale " .. f1139_local0 )
	local f1139_local1 = Engine.GetModel( Engine.GetGlobalModel(), "demo.timeScale" )
	if f1139_local1 then
		Engine.SetModelValue( f1139_local1, f1139_local0 )
	end
	return f1139_local0
end

function DemoJumpBack( f1140_arg0 )
	Engine.Exec( f1140_arg0, "demo_back" )
end

function DemoUpdatePlayPause( f1141_arg0 )
	if Engine.IsDemoClipRecording() then
		Engine.Exec( f1141_arg0, "demo_pausecliprecord" )
	end
	if CoD.DemoUtility.GetRoundedTimeScale() >= 1.1 then
		local f1141_local0 = 1
		Engine.ExecNow( f1141_arg0, "demo_timescale " .. f1141_local0 )
		local f1141_local1 = Engine.GetModel( Engine.GetGlobalModel(), "demo.timeScale" )
		if f1141_local1 then
			Engine.SetModelValue( f1141_local1, f1141_local0 )
		end
	else
		CoD.DemoUtility.RunPauseCommand( f1141_arg0 )
	end
end

function DemoToggleDemoHud( f1142_arg0 )
	Engine.Exec( f1142_arg0, "demo_toggledemohud" )
end

function DemoCancelPreview( f1143_arg0 )
	Engine.Exec( f1143_arg0, "demo_cancelpreview" )
end

function DemoStartAutoDollyCamera( f1144_arg0 )
	CoD.DemoUtility.UnpauseIfPaused( f1144_arg0 )
	Engine.Exec( f1144_arg0, "demo_startautodollycam" )
end

function DemoStopAutoDollyCamera( f1145_arg0 )
	Engine.Exec( f1145_arg0, "demo_stopautodollycam" )
end

function DemoAddDollyCameraMarker( f1146_arg0 )
	Engine.Exec( f1146_arg0, "demo_adddollycammarker" )
end

function DemoEditDollyCameraMarker( f1147_arg0 )
	CoD.DemoUtility.SwitchToDollyCamMarker( f1147_arg0, -1 )
	CoD.DemoUtility.SetEditingDollyCameraMarker( f1147_arg0, true )
end

function DemoExitEditDollyCameraMarker( f1148_arg0 )
	Engine.Exec( f1148_arg0, "demo_updatedollycammarkerparameters " .. Engine.GetHighlightedCameraMarker() )
	CoD.DemoUtility.SetEditingDollyCameraMarker( f1148_arg0, false )
end

function DemoPlaceDollyCameraMarker( f1149_arg0 )
	Engine.Exec( f1149_arg0, "demo_applynewdollycammarkerposition 0" )
end

function DemoCancelPlaceDollyCameraMarker( f1150_arg0 )
	Engine.Exec( f1150_arg0, "demo_applynewdollycammarkerposition 1" )
end

function UpdateDollyCameraTimeScaleMode( f1151_arg0, f1151_arg1 )
	if f1151_arg1 == nil or f1151_arg1 == "" then
		return 
	end
	local f1151_local0 = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentDollyCamMarkerTimeScaleMode" )
	local f1151_local1 = Engine.GetModelValue( f1151_local0 )
	local f1151_local2 = nil
	if f1151_arg1 == "next" then
		if f1151_local1 == Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_MANUAL then
			f1151_local2 = Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_LINEAR
		elseif f1151_local1 == Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_LINEAR then
			f1151_local2 = Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_FIXED
		else
			return 
		end
	elseif f1151_arg1 == "prev" then
		if f1151_local1 == Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_LINEAR then
			f1151_local2 = Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_MANUAL
		elseif f1151_local1 == Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_FIXED then
			f1151_local2 = Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_LINEAR
		else
			return 
		end
	end
	Engine.SetModelValue( f1151_local0, f1151_local2 )
end

function UpdateDollyCameraTimeScale( f1152_arg0, f1152_arg1 )
	local f1152_local0 = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentDollyCamMarkerTimeScaleValue" )
	if not f1152_local0 then
		return 
	end
	local f1152_local1 = Engine.GetModelValue( f1152_local0 )
	local f1152_local2 = tonumber( f1152_arg1 )
	local f1152_local3 = f1152_local1 + f1152_local2
	if not (f1152_local2 <= 0 or f1152_local3 > Dvar.demo_maxTimeScale:get()) or f1152_local2 < 0 and f1152_local3 >= 0.1 then
		Engine.SetModelValue( f1152_local0, f1152_local3 )
	end
end

function DemoFreeCameraLockOnObject( f1153_arg0 )
	Engine.Exec( f1153_arg0, "demo_activatefreecameralockon" )
end

function DemoFreeCameraUnlockObject( f1154_arg0 )
	Engine.Exec( f1154_arg0, "demo_deactivatefreecameralockon" )
end

function DemoAddLightmanMarker( f1155_arg0 )
	Engine.Exec( f1155_arg0, "demo_addlightmanmarker" )
end

function DemoEditLightmanMarker( f1156_arg0 )
	CoD.DemoUtility.SwitchToLightmanMarker( f1156_arg0, -1 )
	CoD.DemoUtility.SetEditingLightmanMarker( f1156_arg0, true )
end

function DemoExitEditLightmanMarker( f1157_arg0 )
	Engine.Exec( f1157_arg0, "demo_updatelightmanmarkerparameters " .. Engine.GetHighlightedCameraMarker() )
	CoD.DemoUtility.SetEditingLightmanMarker( f1157_arg0, false )
end

function DemoPlaceLightmanMarker( f1158_arg0 )
	Engine.Exec( f1158_arg0, "demo_applynewlightmanmarkerposition 0" )
end

function DemoCancelPlaceLightmanMarker( f1159_arg0 )
	Engine.Exec( f1159_arg0, "demo_applynewlightmanmarkerposition 1" )
end

function UpdateLightmanLightMode( f1160_arg0, f1160_arg1 )
	if f1160_arg1 == nil or f1160_arg1 == "" then
		return 
	end
	local f1160_local0 = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightMode" )
	local f1160_local1 = Engine.GetModelValue( f1160_local0 )
	local f1160_local2 = nil
	if f1160_arg1 == "next" then
		if f1160_local1 == Enum.demoLightmanLightMode.DEMO_LIGHTMAN_LIGHT_MODE_OMNI then
			f1160_local2 = Enum.demoLightmanLightMode.DEMO_LIGHTMAN_LIGHT_MODE_SPOT
		else
			return 
		end
	elseif f1160_arg1 == "prev" then
		if f1160_local1 == Enum.demoLightmanLightMode.DEMO_LIGHTMAN_LIGHT_MODE_SPOT then
			f1160_local2 = Enum.demoLightmanLightMode.DEMO_LIGHTMAN_LIGHT_MODE_OMNI
		else
			return 
		end
	end
	Engine.SetModelValue( f1160_local0, f1160_local2 )
	Engine.Exec( f1160_arg0, "demo_updatelightmanmarkerparameters " .. Engine.GetHighlightedCameraMarker() )
end

function UpdateLightmanFloatParam( f1161_arg0, f1161_arg1, f1161_arg2 )
	local f1161_local0 = tonumber( f1161_arg2 ) > 0
	if not f1161_arg0.btnId then
		return 
	end
	local f1161_local1, f1161_local2 = nil
	if f1161_local0 then
		f1161_local1 = 0.5
	else
		f1161_local1 = -0.5
	end
	local f1161_local3 = 0.1
	local f1161_local4 = 10
	if f1161_arg0.btnId == "lightmanlightintensity" then
		f1161_local2 = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightIntensity" )
	elseif f1161_arg0.btnId == "lightmanlightrange" then
		f1161_local2 = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightRange" )
	end
	if not f1161_local1 or not f1161_local2 then
		return 
	end
	local f1161_local5 = Engine.GetModelValue( f1161_local2 ) + f1161_local1
	if not (not f1161_local0 or f1161_local5 > f1161_local4) or not f1161_local0 and f1161_local3 <= f1161_local5 then
		Engine.SetModelValue( f1161_local2, f1161_local5 )
		Engine.Exec( f1161_arg1, "demo_updatelightmanmarkerparameters " .. Engine.GetHighlightedCameraMarker() )
	end
end

function StoreCurrentLightmanColor( f1162_arg0, f1162_arg1, f1162_arg2, f1162_arg3 )
	CoD.DemoUtility.CurrentLightmanColor = string.format( "%d %d %d", Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightColorR" ) ) * 255, Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightColorG" ) ) * 255, Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightColorB" ) ) * 255 )
end

function SelectLightmanColor( f1163_arg0, f1163_arg1, f1163_arg2, f1163_arg3 )
	local f1163_local0 = Engine.GetModel( f1163_arg1:getModel(), "color" )
	if f1163_local0 then
		CoD.DemoUtility.SetCurrentLightmanColor( f1163_arg2, Engine.GetModelValue( f1163_local0 ) )
	end
end

function CancelLightmanColorSelection( f1164_arg0, f1164_arg1, f1164_arg2, f1164_arg3 )
	if not CoD.DemoUtility.CurrentLightmanColor then
		return 
	else
		CoD.DemoUtility.SetCurrentLightmanColor( f1164_arg2, CoD.DemoUtility.CurrentLightmanColor )
	end
end

function UpdateNumHighlightReelMomentsElementColor( f1165_arg0, f1165_arg1 )
	local f1165_local0 = CoD.DemoUtility.GetNumHighlightReelMomentsModel()
	local f1165_local1 = 0
	if f1165_local0 then
		f1165_local1 = Engine.GetModelValue( f1165_local0 )
	end
	if f1165_local1 <= 0 then
		f1165_arg0:setRGB( CoD.red.r, CoD.red.g, CoD.red.b )
	else
		f1165_arg0:setRGB( 1, 1, 1 )
	end
end

function DemoCancelHighlightReelCreation( f1166_arg0 )
	Engine.Exec( f1166_arg0, "demo_cancelhighlightreelcreation" )
end

function ResetThumbnailViewer( f1167_arg0 )
	Engine.ExecNow( f1167_arg0, "resetThumbnailViewer" )
end

function PreserveThumbnails( f1168_arg0, f1168_arg1 )
	if f1168_arg1 == true then
		Engine.ExecNow( f1168_arg0, "preservethumbnails 1" )
	else
		Engine.ExecNow( f1168_arg0, "preservethumbnails 0" )
	end
end

function TimelineEditorRefresh()
	local f1169_local0 = Engine.GetModel( Engine.GetGlobalModel(), "DemoSegments.refresh" )
	Engine.SetModelValue( f1169_local0, Engine.GetModelValue( f1169_local0 ) + 1 )
end

function TimelineEditorPreviewClip( f1170_arg0, f1170_arg1, f1170_arg2 )
	CoD.InGameMenu.CloseAllInGameMenus( f1170_arg0, {
		name = "close_all_ingame_menus",
		controller = f1170_arg2
	} )
	Engine.Exec( f1170_arg2, "demo_previewclip" )
end

function TimelineEditorFilmOptions( f1171_arg0, f1171_arg1, f1171_arg2 )
	OpenPopupWithPriority( f1171_arg0, "TimelineEditorFilmOptions", f1171_arg2, 100 )
end

function TimelineEditorChangeTransition( f1172_arg0, f1172_arg1, f1172_arg2 )
	local f1172_local0 = Engine.GetModel( f1172_arg1:getModel(), "segmentNumber" )
	if f1172_local0 then
		local f1172_local1 = Engine.GetModelValue( f1172_local0 ) - 1
		local f1172_local2 = tonumber( Engine.GetDemoSegmentInformation( f1172_local1, "transitionValue" ) ) + 1
		if f1172_local2 > Enum.demoClipTransition.DEMO_CLIP_TRANSITION_LAST then
			f1172_local2 = Enum.demoClipTransition.DEMO_CLIP_TRANSITION_FIRST
		end
		Engine.ExecNow( f1172_arg2, "demo_switchtransition " .. f1172_local1 .. " " .. f1172_local2 )
	end
end

function TimelineEditorPlaceSegment( f1173_arg0, f1173_arg1, f1173_arg2, f1173_arg3, f1173_arg4 )
	local f1173_local0 = CoD.DemoUtility.Timeline_GetSelectedSegmentModel()
	local f1173_local1 = Engine.GetModelValue( Engine.GetModel( f1173_local0, "segmentNumber" ) )
	if f1173_arg3 then
		local f1173_local2 = Engine.GetModelValue( f1173_arg1:getModel( f1173_arg2, "segmentNumber" ) )
		local f1173_local3 = f1173_local1 - 1
		local f1173_local4 = f1173_local2 - 1
		if f1173_local3 ~= f1173_local4 then
			Engine.ExecNow( f1173_arg4:getOwner(), "demo_movesegment " .. f1173_local3 .. " " .. f1173_local4 )
			CoD.DemoUtility.SetupDemoSegmentModel( f1173_local3 )
			CoD.DemoUtility.SetupDemoSegmentModel( f1173_local4 )
		end
	end
	Engine.SetModelValue( Engine.GetModel( f1173_local0, "selected" ), false )
	CoD.Timeline_RefreshStateAfterMove( f1173_arg4, f1173_arg1:getModel(), f1173_local0, f1173_arg3 )
end

function TimelineEditorSetupMoveSegment( f1174_arg0, f1174_arg1, f1174_arg2, f1174_arg3 )
	local f1174_local0 = f1174_arg1:getModel()
	CoD.DemoUtility.Timeline_SetSelectedSegmentModel( f1174_local0 )
	CoD.Timeline_RefreshState( f1174_arg3, f1174_local0, true )
end

function TimelineEditorUpdateTimeline( f1175_arg0, f1175_arg1, f1175_arg2, f1175_arg3, f1175_arg4 )
	local f1175_local0 = nil
	if f1175_arg3 == "gain_focus" then
		f1175_local0 = true
	else
		f1175_local0 = false
	end
	CoD.Timeline_RefreshState( f1175_arg4, f1175_arg1:getModel(), f1175_local0 )
end

function TimelineEditorUpdateHighlightedSegmentModel( f1176_arg0, f1176_arg1, f1176_arg2, f1176_arg3, f1176_arg4 )
	local f1176_local0 = nil
	if f1176_arg3 == "gain_focus" then
		f1176_local0 = true
	else
		f1176_local0 = false
	end
	local f1176_local1 = f1176_arg1:getModel()
	if not f1176_local1 then
		return 
	else
		Engine.SetModelValue( Engine.CreateModel( f1176_local1, "highlighted" ), f1176_local0 )
	end
end

function TimelineEditorKeyboardComplete( f1177_arg0, f1177_arg1, f1177_arg2, f1177_arg3 )
	Engine.SetModelValue( Engine.GetModel( CoD.DemoUtility.Timeline_GetHighlightedSegmentModel(), "name" ), f1177_arg3.input )
end

function IncreaseSafeAreaVertical( f1178_arg0, f1178_arg1, f1178_arg2 )
	if not CoD.SafeArea or not CoD.SafeArea.Maximum or not CoD.SafeArea.AdjustAmount then
		return 
	end
	local f1178_local0 = tonumber( Engine.ProfileValueAsString( f1178_arg2, "safeAreaTweakable_vertical" ) ) + CoD.SafeArea.AdjustAmount
	if f1178_local0 <= CoD.SafeArea.Maximum then
		Engine.SetProfileVar( f1178_arg2, "safeAreaTweakable_vertical", f1178_local0 )
	end
end

function DecreaseSafeAreaVertical( f1179_arg0, f1179_arg1, f1179_arg2 )
	if not CoD.SafeArea or not CoD.SafeArea.Maximum or not CoD.SafeArea.AdjustAmount then
		return 
	end
	local f1179_local0 = tonumber( Engine.ProfileValueAsString( f1179_arg2, "safeAreaTweakable_vertical" ) ) - CoD.SafeArea.AdjustAmount
	if CoD.SafeArea.Minimum <= f1179_local0 then
		Engine.SetProfileVar( f1179_arg2, "safeAreaTweakable_vertical", f1179_local0 )
	end
end

function IncreaseSafeAreaHorizontal( f1180_arg0, f1180_arg1, f1180_arg2 )
	if not CoD.SafeArea or not CoD.SafeArea.Maximum or not CoD.SafeArea.AdjustAmount then
		return 
	end
	local f1180_local0 = tonumber( Engine.ProfileValueAsString( f1180_arg2, "safeAreaTweakable_horizontal" ) ) + CoD.SafeArea.AdjustAmount
	if f1180_local0 <= CoD.SafeArea.Maximum then
		Engine.SetProfileVar( f1180_arg2, "safeAreaTweakable_horizontal", f1180_local0 )
	end
end

function DecreaseSafeAreaHorizontal( f1181_arg0, f1181_arg1, f1181_arg2 )
	if not CoD.SafeArea or not CoD.SafeArea.Maximum or not CoD.SafeArea.AdjustAmount then
		return 
	end
	local f1181_local0 = tonumber( Engine.ProfileValueAsString( f1181_arg2, "safeAreaTweakable_horizontal" ) ) - CoD.SafeArea.AdjustAmount
	if CoD.SafeArea.Minimum <= f1181_local0 then
		Engine.SetProfileVar( f1181_arg2, "safeAreaTweakable_horizontal", f1181_local0 )
	end
end

function EquipScorestreak( f1182_arg0, f1182_arg1, f1182_arg2 )
	local f1182_local0 = f1182_arg1:getModel( f1182_arg2, "itemIndex" )
	if f1182_local0 then
		local f1182_local1 = Engine.GetModelValue( f1182_local0 )
		if f1182_local1 ~= CoD.CACUtility.EmptyItemIndex then
			local f1182_local2 = CoD.perController[f1182_arg2].classModel
			if not CoD.CACUtility.GetAttachedItemSlot( f1182_local2, f1182_local1, CoD.CACUtility.KillstreakNameList ) then
				local f1182_local3 = CoD.CACUtility.FindFirstEmptySlotInList( f1182_local2, CoD.CACUtility.KillstreakNameList )
				if f1182_local3 then
					CoD.SetClassItem( f1182_arg2, 0, f1182_local3, f1182_local1 )
					CoD.CACUtility.GetCustomClassModel( f1182_arg2, 0, f1182_local2 )
					f1182_arg0:processEvent( {
						name = "update_state",
						menu = f1182_arg0
					} )
				else
					local f1182_local4 = OpenPopup( f1182_arg0, "ScorestreakOverCapacity", f1182_arg2 )
					f1182_local4:setModel( f1182_local2 )
					if f1182_local4.updateSelectedImage then
						f1182_local4:updateSelectedImage( f1182_local1 )
					end
					LUI.OverrideFunction_CallOriginalFirst( f1182_local4, "close", function ()
						if f1182_local4.lastRemovedSlot then
							CoD.SetClassItem( f1182_arg2, 0, f1182_local4.lastRemovedSlot, f1182_local1 )
							CoD.CACUtility.GetCustomClassModel( f1182_arg2, 0, f1182_local2 )
							f1182_arg0:processEvent( {
								name = "update_state",
								menu = f1182_arg0
							} )
						end
					end )
				end
			end
		end
	end
end

function RemoveScorestreak( f1184_arg0, f1184_arg1, f1184_arg2 )
	local f1184_local0 = f1184_arg1:getModel( f1184_arg2, "itemIndex" )
	if f1184_local0 then
		local f1184_local1 = Engine.GetModelValue( f1184_local0 )
		if f1184_local1 ~= CoD.CACUtility.EmptyItemIndex then
			local f1184_local2 = f1184_arg0:getModel()
			local f1184_local3 = CoD.CACUtility.GetAttachedItemSlot( f1184_local2, f1184_local1, CoD.CACUtility.KillstreakNameList )
			if f1184_local3 then
				f1184_arg0.lastRemovedSlot = f1184_local3
				CoD.SetClassItem( f1184_arg2, 0, f1184_local3, CoD.CACUtility.EmptyItemIndex )
				CoD.CACUtility.GetCustomClassModel( f1184_arg2, 0, f1184_local2 )
				f1184_arg0:processEvent( {
					name = "update_state",
					menu = f1184_arg0
				} )
			end
		end
	end
end

function RemoveAllScorestreaks( f1185_arg0, f1185_arg1 )
	local f1185_local0 = f1185_arg0:getModel()
	for f1185_local4, f1185_local5 in ipairs( CoD.CACUtility.KillstreakNameList ) do
		CoD.SetClassItem( f1185_arg1, 0, f1185_local5, CoD.CACUtility.EmptyItemIndex )
	end
	CoD.CACUtility.GetCustomClassModel( f1185_arg1, 0, f1185_local0 )
	f1185_arg0:processEvent( {
		name = "update_state",
		menu = f1185_arg0
	} )
end

function GoBackAndUpdateSelectedChallengesButton( f1186_arg0, f1186_arg1 )
	local f1186_local0 = GoBack( f1186_arg0, f1186_arg1 )
	f1186_local0:processEvent( {
		name = "set_selected_button",
		controller = f1186_arg1
	} )
	return f1186_local0
end

function Challenges_UpdateListFromTabChanged( f1187_arg0, f1187_arg1, f1187_arg2 )
	local f1187_local0 = f1187_arg1:getModel( f1187_arg2, "tabCategory" )
	if f1187_local0 then
		SetGlobalModelValue( "challengeCategory", Engine.GetModelValue( f1187_local0 ) )
		local f1187_local1 = f1187_arg0.TabFrame.framedWidget
		if f1187_local1 then
			f1187_local1 = f1187_arg0.TabFrame.framedWidget.CallingCardGrid
		end
		if f1187_local1 then
			f1187_local1:updateDataSource()
		end
	end
end

function CallingCards_SetPlayerBackground( f1188_arg0, f1188_arg1, f1188_arg2 )
	local f1188_local0 = Engine.GetModel( f1188_arg1:getModel(), "iconId" )
	if f1188_local0 ~= nil then
		local f1188_local1 = Engine.GetModelValue( f1188_local0 )
		if f1188_arg0.callingCardShowcaseSlot then
			Engine.SetCombatRecordBackgroundId( f1188_arg2, f1188_local1, f1188_arg0.callingCardShowcaseSlot )
			local f1188_local2 = Engine.GetModel( Engine.GetGlobalModel(), "CallingCardShowcaseUpdated" )
			if f1188_local2 then
				Engine.ForceNotifyModelSubscriptions( f1188_local2 )
			end
			GoBackToMenu( f1188_arg0, f1188_arg2, "CombatRecordMP" )
			CoD.perController[f1188_arg2].currentCallingCardTabElement = nil
		else
			SetEmblemBackground_Internal( f1188_arg2, f1188_local1 )
		end
		f1188_arg1:playSound( "list_action", f1188_arg2 )
	end
	ForceNotifyControllerModel( f1188_arg2, "identityBadge.xuid" )
end

function CallingCards_EmblemGetProfile( f1189_arg0, f1189_arg1, f1189_arg2 )
	Engine.ExecNow( f1189_arg2, "emblemGetProfile" )
	ForceNotifyControllerModel( f1189_arg2, "identityBadge.xuid" )
end

function CallingCards_GoBack( f1190_arg0, f1190_arg1 )
	if not IsLive() then
		Engine.CommitProfileChanges( f1190_arg1 )
	else
		CallingCard_TrackCWLEquip( f1190_arg1, "CallingCard" )
		UploadPublicProfile( f1190_arg0, f1190_arg1 )
	end
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "callingCardBreadcrumbChanged" ) )
end

function CallingCards_UpdateListFromTabChanged( f1191_arg0, f1191_arg1, f1191_arg2 )
	local f1191_local0 = f1191_arg1:getModel( f1191_arg2, "tabCategory" )
	if f1191_local0 then
		SetGlobalModelValue( "challengeGameMode", Engine.GetModelValue( f1191_local0 ) )
		CoD.perController[f1191_arg2].currentCallingCardTabElement = f1191_arg1
		local f1191_local1 = f1191_arg0.TabFrame.framedWidget
		if f1191_local1 then
			f1191_local1 = f1191_arg0.TabFrame.framedWidget.CallingCardGrid
		end
		if f1191_local1 then
			f1191_local1:updateDataSource()
		end
	end
end

function CallingCards_SetOld( f1192_arg0, f1192_arg1 )
	local f1192_local0 = CoD.SafeGetModelValue( f1192_arg0:getModel(), "iconId" )
	if f1192_local0 then
		Engine.SetEmblemBackgroundAsOld( f1192_arg1, f1192_local0 )
		if CoD.perController[f1192_arg1].currentCallingCardTabElement then
			local f1192_local1 = Engine.GetModel( CoD.perController[f1192_arg1].currentCallingCardTabElement:getModel(), "breadcrumbCount" )
			if f1192_local1 then
				Engine.SetModelValue( f1192_local1, math.max( 0, Engine.GetModelValue( f1192_local1 ) - 1 ) )
			end
		end
		if CoD.perController[f1192_arg1].currentCallingCardBlackMarketElement then
			local f1192_local1 = Engine.GetModel( CoD.perController[f1192_arg1].currentCallingCardBlackMarketElement:getModel(), "newCount" )
			if f1192_local1 then
				Engine.SetModelValue( f1192_local1, math.max( 0, Engine.GetModelValue( f1192_local1 ) - 1 ) )
			end
		end
	end
end

function OpenEnterPrestigeModeMenu( f1193_arg0, f1193_arg1, f1193_arg2 )
	if CheckIfFeatureIsBanned( f1193_arg1, LuaEnums.FEATURE_BAN.PRESTIGE ) then
		LuaUtils.UI_ShowErrorMessageDialog( f1193_arg1, GetFeatureBanInfo( f1193_arg1, LuaEnums.FEATURE_BAN.PRESTIGE ) )
		return 
	else
		OpenSystemOverlay( f1193_arg0, f1193_arg2, f1193_arg1, "EnterPrestigeMode", nil )
	end
end

function OpenPrestigeRefundTokensMenu( f1194_arg0, f1194_arg1, f1194_arg2 )
	if CheckIfFeatureIsBanned( f1194_arg1, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) then
		LuaUtils.UI_ShowErrorMessageDialog( f1194_arg1, GetFeatureBanInfo( f1194_arg1, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) )
		return 
	else
		OpenSystemOverlay( f1194_arg0, f1194_arg2, f1194_arg1, "PrestigeRefundTokens", nil )
	end
end

function OpenPrestigeFreshStartMenu( f1195_arg0, f1195_arg1, f1195_arg2 )
	if CheckIfFeatureIsBanned( f1195_arg1, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) then
		LuaUtils.UI_ShowErrorMessageDialog( f1195_arg1, GetFeatureBanInfo( f1195_arg1, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) )
		return 
	else
		OpenSystemOverlay( f1195_arg0, f1195_arg2, f1195_arg1, "PrestigeFreshStart1", nil )
	end
end

function OpenCustomizePrestigeMenu( f1196_arg0, f1196_arg1, f1196_arg2 )
	if CheckIfFeatureIsBanned( f1196_arg1, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) then
		LuaUtils.UI_ShowErrorMessageDialog( f1196_arg1, GetFeatureBanInfo( f1196_arg1, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) )
		return 
	elseif CoD.PrestigeUtility.GetPrestigeGameMode() == Enum.eModes.MODE_ZOMBIES then
		OpenOverlay( f1196_arg0, "Prestige_CustomizePrestigeIconZM", f1196_arg1, "", "" )
	else
		OpenOverlay( f1196_arg0, "Prestige_CustomizePrestigeIcon", f1196_arg1, "", "" )
	end
end

function OpenPermanentUnlockMenu( f1197_arg0, f1197_arg1, f1197_arg2 )
	if CheckIfFeatureIsBanned( f1197_arg1, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) then
		LuaUtils.UI_ShowErrorMessageDialog( f1197_arg1, GetFeatureBanInfo( f1197_arg1, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) )
		return 
	else
		CoD.PrestigeUtility.previousGameMode = CoD.gameMode
		CoD.PrestigeUtility.previousStatsMilestonePath = CoD.statsMilestonePath
		CoD.gameMode = "MP"
		CoD.statsMilestonePath = "gamedata/stats/mp/statsmilestones"
		SetHeadingKickerText( "MENU_PERMANENT_UNLOCKS" )
		CoD.PrestigeUtility.CreatePermanentUnlockTokenModel( f1197_arg1 )
		local f1197_local0 = Engine.CreateModel( Engine.GetModelForController( f1197_arg1 ), "PermanentlyUnlockClass" )
		CoD.CACUtility.GetCustomClassModel( f1197_arg1, 0, f1197_local0 )
		CoD.perController[f1197_arg1].classModel = f1197_local0
		OpenOverlay( f1197_arg0, "Prestige_PermanentUnlocks", f1197_arg1 )
	end
end

function ClosePermanentUnlockMenu( f1198_arg0, f1198_arg1, f1198_arg2 )
	CoD.gameMode = CoD.PrestigeUtility.previousGameMode
	CoD.statsMilestonePath = CoD.PrestigeUtility.previousStatsMilestonePath
	SendClientScriptNotify( f1198_arg1, "CustomClass_closed" .. CoD.GetLocalClientAdjustedNum( f1198_arg1 ), "" )
	GoBack( f1198_arg0, f1198_arg1 )
end

function OpenPermanentUnlockCategoryMenu( f1199_arg0, f1199_arg1, f1199_arg2, f1199_arg3, f1199_arg4 )
	local f1199_local0 = CoD.PrestigeUtility.GetContentCategoryData( f1199_arg3 )
	CoD.perController[f1199_arg2].weaponCategory = f1199_local0.weaponCategory
	NavigateToMenu( f1199_arg0, f1199_local0.menuName, true, f1199_arg2 )
end

function OpenPermanentWeaponUnlockCategoryMenu( f1200_arg0, f1200_arg1, f1200_arg2, f1200_arg3, f1200_arg4 )
	CoD.CraftUtility.Gunsmith.ParseDDL( f1200_arg2, Enum.StorageFileType.STORAGE_GUNSMITH )
	OpenPermanentUnlockCategoryMenu( f1200_arg0, f1200_arg1, f1200_arg2, f1200_arg3, f1200_arg4 )
end

function SetIsInPrestigeMenu( f1201_arg0 )
	CoD.PrestigeUtility.isInPermanentUnlockMenu = f1201_arg0
end

function OpenPermanentUnlockClassItemDialog( f1202_arg0, f1202_arg1, f1202_arg2 )
	CoD.OverlayUtility.CreateOverlay( f1202_arg2, f1202_arg0, "PermanentUnlockClassItem", f1202_arg2, Engine.GetModelValue( f1202_arg1:getModel( f1202_arg2, "itemIndex" ) ), nil )
end

function OpenPrestigeMasterDialogIfNeeded( f1203_arg0, f1203_arg1, f1203_arg2 )
	if not PlayerGainedPrestigeMaster( f1203_arg1, f1203_arg2 ) then
		return 
	else
		CoD.OverlayUtility.CreateOverlay( f1203_arg1, f1203_arg0, "PrestigeMasterNotification", f1203_arg1, nil )
		Engine.Exec( f1203_arg1, "PrestigeStatsMaster " .. tostring( f1203_arg2 ) )
		SaveLoadout( f1203_arg0, f1203_arg1 )
		Engine.Exec( f1203_arg1, "uploadstats " .. tostring( f1203_arg2 ) )
		Engine.Exec( f1203_arg1, "savegamerprofilestats" )
	end
end

function PermanentlyUnlockItem( f1204_arg0, f1204_arg1, f1204_arg2 )
	local f1204_local0 = nil
	local f1204_local1 = f1204_arg1.itemIndex
	if not f1204_local1 then
		f1204_local0 = f1204_arg1:getModel( f1204_arg2, "itemIndex" )
		if f1204_local0 then
			f1204_local1 = Engine.GetModelValue( f1204_local0 )
		end
	end
	if f1204_local1 then
		Engine.PermanentlyUnlockItem( f1204_arg2, f1204_local1, CoD.PrestigeUtility.GetPrestigeGameMode() )
		SaveLoadout( f1204_arg0, f1204_arg2 )
		UploadStats( f1204_arg0, f1204_arg2 )
		Engine.SendClientScriptNotify( f1204_arg2, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f1204_arg2 ), "purchased" )
	end
end

function SetParagonIcon( f1205_arg0, f1205_arg1, f1205_arg2 )
	local f1205_local0 = f1205_arg1:getModel( f1205_arg2, "iconId" )
	if not f1205_local0 then
		return 
	else
		local f1205_local1 = Engine.GetModelValue( f1205_local0 )
		local f1205_local2 = Engine.GetPlayerStats( f1205_arg2, CoD.STATS_LOCATION_NORMAL, CoD.PrestigeUtility.GetPrestigeGameMode() )
		f1205_local2.PlayerStatsList.PARAGON_ICON_ID.StatValue:set( f1205_local1 )
	end
end

function OpenAARIfNeeded( f1206_arg0, f1206_arg1 )
	if CanShowAAR( f1206_arg1 ) and IsAARValid( f1206_arg1 ) then
		local f1206_local0 = ""
		if IsCustomLobby() then
			f1206_local0 = "custom"
		elseif IsLAN() then
			f1206_local0 = "lan"
		else
			f1206_local0 = "public"
		end
		local f1206_local1 = Engine.GetMaxControllerCount()
		for self = 0, f1206_local1 - 1, 1 do
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( self ), "aarType" ), f1206_local0 )
		end
		if AutomaticallyOpenAAR( f1206_arg1 ) then
			local self = LUI.UITimer.new( 1000, "open_aar", true, f1206_arg0 )
			f1206_arg0:registerEventHandler( "open_aar", function ( element, event )
				if not CanShowAAR( f1206_arg1 ) then
					return 
				elseif not IsAARValid( f1206_arg1 ) then
					return 
				end
				Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1206_arg1 ), "doAARXPBarAnimation" ), true )
				if CoD.isZombie then
					if CoD.AARUtility.AnyRewardsEarnedDuringMatch( f1206_arg1 ) then
						OpenPrestigeMasterDialogIfNeeded( OpenOverlay( element, "RewardsOverlay", f1206_arg1 ), f1206_arg1, Enum.eModes.MODE_ZOMBIES )
					else
						OpenPrestigeMasterDialogIfNeeded( OpenOverlay( element, "ZMAAR", f1206_arg1 ), f1206_arg1, Enum.eModes.MODE_ZOMBIES )
					end
				elseif IsArenaMode() then
					OpenOverlay( element, "ArenaResult", f1206_arg1 )
				elseif CoD.AARUtility.AnyRewardsEarnedDuringMatch( f1206_arg1 ) then
					OpenPrestigeMasterDialogIfNeeded( OpenOverlay( element, "RewardsOverlay", f1206_arg1 ), f1206_arg1, Enum.eModes.MODE_MULTIPLAYER )
				else
					OpenPrestigeMasterDialogIfNeeded( OpenOverlay( element, "MPAAR", f1206_arg1 ), f1206_arg1, Enum.eModes.MODE_MULTIPLAYER )
				end
				local f1207_local0 = CoD.GetPlayerStats( f1206_arg1 )
				f1207_local0.AfterActionReportStats.lobbyPopup:set( "" )
			end )
			f1206_arg0:addElement( self )
		end
	end
end

function OpenAAR( f1208_arg0, f1208_arg1 )
	if CoD.isZombie then
		if CoD.AARUtility.AnyRewardsEarnedDuringMatch( f1208_arg1 ) then
			OpenOverlay( f1208_arg0, "RewardsOverlay", f1208_arg1 )
		else
			OpenOverlay( f1208_arg0, "ZMAAR", f1208_arg1 )
		end
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1208_arg1 ), "doAARXPBarAnimation" ), true )
		if IsArenaMode() then
			OpenOverlay( f1208_arg0, "ArenaResult", f1208_arg1 )
		elseif CoD.AARUtility.AnyRewardsEarnedDuringMatch( f1208_arg1 ) then
			OpenOverlay( f1208_arg0, "RewardsOverlay", f1208_arg1 )
		else
			OpenOverlay( f1208_arg0, "MPAAR", f1208_arg1 )
		end
	end
end

function SetStableStatsBuffer( f1209_arg0 )
	Engine.MakeStableStatsBufferForController( f1209_arg0 )
end

function SurveyShouldShow( f1210_arg0 )
	local f1210_local0 = CoD.GetPlayerStats( f1210_arg0 )
	local f1210_local1 = tonumber( f1210_local0.AfterActionReportStats.surveyId:get() )
	if tonumber( f1210_local0.AfterActionReportStats.demoFileID:get() ) == 0 then
		return false
	elseif f1210_local1 == 0 then
		return false
	else
		return true
	end
end

function GoBackAndShowMatchSurveyIfNecessary( f1211_arg0, f1211_arg1 )
	local f1211_local0 = GoBack( f1211_arg0, f1211_arg1 )
	local f1211_local1 = Engine.CreateModel( Engine.GetModelForController( f1211_arg1 ), "lobbyRoot.showPostMatchSurvey" )
	if Engine.GetModelValue( f1211_local1 ) == true and SurveyShouldShow( f1211_arg1 ) == true then
		Engine.SetModelValue( f1211_local1, false )
		CoD.OverlayUtility.CreateOverlay( f1211_arg1, f1211_local0, "PostMatchSurvey" )
	end
end

function CloseCPAAR( f1212_arg0, f1212_arg1 )
	CoD.perController[f1212_arg1].lastAARMapName = Dvar.ui_mapname:get()
	CoD.perController[f1212_arg1].fromMaxLevelMessage = false
end

function PlayArenaChallengeToastsOnClipOver( f1213_arg0, f1213_arg1 )
	if ArenaChallengesEnabled() then
		f1213_arg0:registerEventHandler( "clip_over", function ( element, event )
			CoD.ArenaUtility.PlayRecentArenaChallengeToasts( f1213_arg1 )
		end )
	end
end

function OpenMOTDPopup( f1215_arg0, f1215_arg1, f1215_arg2, f1215_arg3, f1215_arg4 )
	if f1215_arg3 ~= nil then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1215_arg2 ), "MOTDMenu.ActionSource" ), f1215_arg3 )
	end
	local f1215_local0 = f1215_arg4:openOverlay( "MOTD", f1215_arg2 )
	f1215_local0.crm_message_id = Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "MtxCommsMOTD" ), "messageID" ) )
	Engine.ReportMarketingMessageViewed( f1215_arg2, "motd" )
	LUI.CoDMetrics.CRMMessageImpression( f1215_arg0, f1215_arg2, "motd" )
	if not ShouldPresentMOTDBanner( f1215_arg2, f1215_local0 ) then
		f1215_local0.motdFooter:close()
	else
		Engine.ReportMarketingMessageViewed( f1215_arg2, "registration" )
		LUI.CoDMetrics.CRMMessageImpression( f1215_arg0, f1215_arg2, "registration" )
	end
end

function MOTDPopupAcceptAction( f1216_arg0, f1216_arg1, f1216_arg2, f1216_arg3, f1216_arg4 )
	LUI.CoDMetrics.CRMMessageInteraction( f1216_arg0, f1216_arg2, "motd" )
	if Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f1216_arg2 ), "MOTDMenu.ActionSource" ) ) == "FeaturedWidget" then
		GoBack( f1216_arg4, f1216_arg2 )
		return 
	elseif LuaUtils.IsBetaBuild() then
		if IsFirstTimeSetup( f1216_arg2, Enum.eModes.MODE_MULTIPLAYER ) then
			OpenMPFirstTimeFlow( f1216_arg0, nil, f1216_arg2, nil, f1216_arg0 )
		else
			NavigateToLobby_FirstTimeFlowMP( f1216_arg0, nil, f1216_arg2, f1216_arg4 )
		end
	else
		local f1216_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f1216_arg2 ), "MOTDMenu.ActionSource" ) )
		if f1216_local0 == "FeaturedWidget" then
			GoBack( f1216_arg4, f1216_arg2 )
			return 
		elseif f1216_local0 == "LoginReward" then
			OpenLoginRewardPopup( GoBack( f1216_arg4, f1216_arg2 ), f1216_arg2 )
			return 
		end
		NavigateToLobby( f1216_arg0, "ModeSelect", false, f1216_arg2 )
	end
	SendClientScriptMenuChangeNotify( f1216_arg2, f1216_arg4, false )
	Close( f1216_arg0, f1216_arg2 )
end

function OpenLoginRewardPopup( f1217_arg0, f1217_arg1 )
	CoD.OverlayUtility.CreateOverlay( f1217_arg1, f1217_arg0, "LoginRewardOverlay" )
end

function OpenZMDLCPurchaseRewardPopup( f1218_arg0, f1218_arg1, f1218_arg2 )
	local f1218_local0 = nil
	if ShouldShowZMHDGobbleGumPopup( f1218_arg1, CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_PS4_INDEX_ID ) then
		f1218_local0 = "ZMHDGobbleGumPS4"
	elseif ShouldShowZMHDGobbleGumPopup( f1218_arg1, CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_XB1_INDEX_ID ) then
		f1218_local0 = "ZMHDGobbleGumXB1"
	elseif ShouldShowURMFirstTimePopup( f1218_arg1 ) then
		f1218_local0 = "URMFirstTime"
	end
	SetNextPreStartPopup( f1218_arg1, f1218_local0 )
	CoD.OverlayUtility.CreateOverlay( f1218_arg1, f1218_arg0, "ZMDLCPurchaseRewardOverlay", f1218_arg1, f1218_arg2 )
end

function OpenZMHDPurchaseRewardPopup( f1219_arg0, f1219_arg1 )
	local f1219_local0 = nil
	if ShouldShowZMHDGobbleGumPopup( f1219_arg1, CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_PS4_INDEX_ID ) then
		f1219_local0 = "ZMHDGobbleGumPS4"
	elseif ShouldShowZMHDGobbleGumPopup( f1219_arg1, CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_XB1_INDEX_ID ) then
		f1219_local0 = "ZMHDGobbleGumXB1"
	elseif ShouldShowURMFirstTimePopup( f1219_arg1 ) then
		f1219_local0 = "URMFirstTime"
	end
	SetNextPreStartPopup( f1219_arg1, f1219_local0 )
	CoD.OverlayUtility.CreateOverlay( f1219_arg1, f1219_arg0, "ZMHDPurchaseRewardOverlay" )
end

function OpenZMHDGobbleGumPopup( f1220_arg0, f1220_arg1, f1220_arg2 )
	local f1220_local0 = nil
	local f1220_local1 = 0
	if f1220_arg2 == CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_PS4_INDEX_ID then
		f1220_local1 = CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_PS4_SKU_ID
		if ShouldShowZMHDGobbleGumPopup( f1220_arg1, CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_XB1_INDEX_ID ) then
			f1220_local0 = "ZMHDGobbleGumXB1"
		elseif ShouldShowURMFirstTimePopup( f1220_arg1 ) then
			f1220_local0 = "URMFirstTime"
		end
	elseif f1220_arg2 == CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_XB1_INDEX_ID then
		f1220_local1 = CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_XB1_SKU_ID
		if ShouldShowURMFirstTimePopup( f1220_arg1 ) then
			f1220_local0 = "URMFirstTime"
		end
	end
	SetNextPreStartPopup( f1220_arg1, f1220_local0 )
	CoD.OverlayUtility.CreateOverlay( f1220_arg1, f1220_arg0, "ZMHDGobbleGumOverlay", f1220_arg1, {
		index = f1220_arg2,
		skuId = f1220_local1
	} )
end

function OpenURMFirstTimePopup( f1221_arg0, f1221_arg1 )
	CoD.OverlayUtility.CreateOverlay( f1221_arg1, f1221_arg0, "UltraRareMegaPurchaseOverlay", f1221_arg1, {
		isFirstTime = true,
		cost = 0,
		skuId = CoD.BubbleGumBuffUtility.URM_FIRST_TIME_SKU_ID
	} )
end

function GoThroughZMHDPopups( f1222_arg0, f1222_arg1 )
	if Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "skipZMHDPopups" ) ) then
		return 
	end
	local f1222_local0 = {}
	if ShouldShowZMDLCPurchaseRewardPopup( f1222_arg1, f1222_local0 ) then
		OpenZMDLCPurchaseRewardPopup( f1222_arg0, f1222_arg1, f1222_local0 )
	elseif ShouldShowZMHDPurchaseRewardPopup( f1222_arg1 ) then
		OpenZMHDPurchaseRewardPopup( f1222_arg0, f1222_arg1 )
	elseif ShouldShowZMHDGobbleGumPopup( f1222_arg1, CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_PS4_INDEX_ID ) then
		OpenZMHDGobbleGumPopup( f1222_arg0, f1222_arg1, CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_PS4_INDEX_ID )
	elseif ShouldShowZMHDGobbleGumPopup( f1222_arg1, CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_XB1_INDEX_ID ) then
		OpenZMHDGobbleGumPopup( f1222_arg0, f1222_arg1, CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_XB1_INDEX_ID )
	elseif ShouldShowURMFirstTimePopup( f1222_arg1 ) then
		OpenURMFirstTimePopup( f1222_arg0, f1222_arg1 )
	end
end

function OpenCRMFeaturedPopup( f1223_arg0, f1223_arg1, f1223_arg2, f1223_arg3, f1223_arg4 )
	if f1223_arg3 == "MOTDBanner" then
		local f1223_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "CRMPopup" )
		Engine.SetModelValue( Engine.CreateModel( f1223_local0, "location" ), "registration" )
		Engine.SetModelValue( Engine.CreateModel( f1223_local0, "actionSource" ), f1223_arg3 )
	elseif f1223_arg3 == "Featured" then
		local f1223_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "CRMPopup" )
		Engine.SetModelValue( Engine.CreateModel( f1223_local0, "location" ), "crm_featured" )
		Engine.SetModelValue( Engine.CreateModel( f1223_local0, "actionSource" ), f1223_arg3 )
	end
	OpenOverlay( f1223_arg4, "CRMPopup", f1223_arg2 )
end

function CRMFeaturedPopupActionHandler( f1224_arg0, f1224_arg1, f1224_arg2, f1224_arg3, f1224_arg4 )
	local f1224_local0 = nil
	f1224_local0 = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "CRMPopup.action" ) )
	local f1224_local1 = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "CRMPopup.location" ) )
	if f1224_local0 ~= nil and f1224_local0 ~= "" then
		LUI.CoDMetrics.CRMMessageInteraction( f1224_arg0, f1224_arg2, f1224_local1 )
		if LUI.startswith( f1224_local0, "store" ) then
			local f1224_local2 = GoBack( f1224_arg0, f1224_arg2 )
			if CoD.isPC then
				OpenSteamStore( f1224_arg0, f1224_arg1, f1224_arg2, "CRMFeaturedPopup", f1224_local2 )
			else
				CoD.StoreUtility.SetupFocusCategory( f1224_arg2, f1224_local0 )
				OpenStore( f1224_arg0, f1224_arg1, f1224_arg2, "CRMFeaturedPopup", f1224_local2 )
			end
		elseif f1224_local0 == "blackmarket" then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "blackmarketOpenSource" ), Engine.GetCurrentMode() )
			Engine.SwitchMode( f1224_arg2, "mp" )
			OpenBlackMarket( GoBack( f1224_arg0, f1224_arg2 ), nil, f1224_arg2 )
		elseif f1224_local0 == "drmonty" then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "megachewOpenSource" ), Engine.GetCurrentMode() )
			Engine.SwitchMode( f1224_arg2, "zm" )
			local f1224_local2 = GoBack( f1224_arg0, f1224_arg2 )
			OpenMegaChewFactorymenu( f1224_arg0, f1224_arg1, f1224_arg2, f1224_local2.name, f1224_local2 )
		elseif f1224_local0 == "contracts" then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "contractsOpenSource" ), Engine.GetCurrentMode() )
			Engine.SwitchMode( f1224_arg2, "mp" )
			local f1224_local2 = GoBack( f1224_arg0, f1224_arg2 )
			LuaUtils.CycleContracts()
			OpenOverlay( f1224_local2, "BM_Contracts", f1224_arg2 )
		elseif f1224_local0 == "promo" then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "promoOpenSource" ), Engine.GetCurrentMode() )
			Engine.SwitchMode( f1224_arg2, "mp" )
			OpenOverlay( GoBack( f1224_arg0, f1224_arg2 ), "ZMHD_Community_Theme", f1224_arg2, "", "" )
		end
	end
end

function HandleGoBackFromBlackMarket( f1225_arg0, f1225_arg1, f1225_arg2, f1225_arg3, f1225_arg4 )
	local f1225_local0 = Engine.GetModel( Engine.GetGlobalModel(), "blackmarketOpenSource" )
	local f1225_local1 = Engine.GetCurrentMode()
	if f1225_local0 ~= nil then
		local f1225_local2 = Engine.GetModelValue( f1225_local0 )
		if f1225_local2 ~= f1225_local1 then
			Engine.SwitchMode( f1225_arg2, f1225_local2 )
		end
		Engine.UnsubscribeAndFreeModel( f1225_local0 )
	end
end

function HandleGoBackFromMegaChew( f1226_arg0, f1226_arg1, f1226_arg2, f1226_arg3, f1226_arg4 )
	local f1226_local0 = Engine.GetModel( Engine.GetGlobalModel(), "megachewOpenSource" )
	local f1226_local1 = Engine.GetCurrentMode()
	if f1226_local0 ~= nil then
		local f1226_local2 = Engine.GetModelValue( f1226_local0 )
		if f1226_local2 ~= f1226_local1 then
			Engine.SwitchMode( f1226_arg2, f1226_local2 )
		end
		Engine.UnsubscribeAndFreeModel( f1226_local0 )
	end
end

function HandleGoBackFromCookbook( f1227_arg0, f1227_arg1, f1227_arg2, f1227_arg3, f1227_arg4 )
	local f1227_local0 = Engine.GetModel( Engine.GetGlobalModel(), "cookbookRecipeOpenSource" )
	local f1227_local1 = Engine.GetCurrentMode()
	if f1227_local0 ~= nil then
		local f1227_local2 = Engine.GetModelValue( f1227_local0 )
		if f1227_local2 ~= f1227_local1 then
			Engine.SwitchMode( f1227_arg2, f1227_local2 )
		end
		Engine.UnsubscribeAndFreeModel( f1227_local0 )
	end
end

function HandleGoBackFromDailyChallenge( f1228_arg0, f1228_arg1, f1228_arg2, f1228_arg3, f1228_arg4 )
	local f1228_local0 = Engine.GetModel( Engine.GetGlobalModel(), "dailyChallengeOpenSource" )
	local f1228_local1 = Engine.GetCurrentMode()
	if f1228_local0 ~= nil then
		local f1228_local2 = Engine.GetModelValue( f1228_local0 )
		if f1228_local2 ~= f1228_local1 then
			Engine.SwitchMode( f1228_arg2, f1228_local2 )
		end
		Engine.UnsubscribeAndFreeModel( f1228_local0 )
	end
end

function HandleGoBackFromContracts( f1229_arg0, f1229_arg1, f1229_arg2, f1229_arg3, f1229_arg4 )
	local f1229_local0 = Engine.GetModel( Engine.GetGlobalModel(), "contractsOpenSource" )
	local f1229_local1 = Engine.GetCurrentMode()
	if f1229_local0 ~= nil then
		local f1229_local2 = Engine.GetModelValue( f1229_local0 )
		if f1229_local2 ~= f1229_local1 then
			Engine.SwitchMode( f1229_arg2, f1229_local2 )
		end
		Engine.UnsubscribeAndFreeModel( f1229_local0 )
	end
end

function HandleGoBackFromPromo( f1230_arg0, f1230_arg1, f1230_arg2, f1230_arg3, f1230_arg4 )
	local f1230_local0 = Engine.GetModel( Engine.GetGlobalModel(), "promoOpenSource" )
	local f1230_local1 = Engine.GetCurrentMode()
	if f1230_local0 ~= nil then
		local f1230_local2 = Engine.GetModelValue( f1230_local0 )
		if f1230_local2 ~= f1230_local1 then
			Engine.SwitchMode( f1230_arg2, f1230_local2 )
		end
		Engine.UnsubscribeAndFreeModel( f1230_local0 )
	end
end

function GoToModeSelectFromCRMPopup( f1231_arg0, f1231_arg1, f1231_arg2 )
	if Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f1231_arg1 ), "MOTDMenu.ActionSource" ) ) == "FeaturedWidget" then
		GoBack( f1231_arg2, f1231_arg1 )
		return 
	else
		NavigateToLobby( f1231_arg0, "ModeSelect", false, f1231_arg1 )
		SendClientScriptMenuChangeNotify( f1231_arg1, f1231_arg2, false )
		Close( f1231_arg0, f1231_arg1 )
	end
end

function BubbleGumBuffSelectTabChanged( f1232_arg0, f1232_arg1, f1232_arg2 )
	local f1232_local0 = f1232_arg1.filter
	if f1232_local0 then
		CoD.perController[f1232_arg2].weaponCategory = f1232_local0
		DataSources.Unlockables.setCurrentFilterItem( f1232_local0 )
		f1232_arg0.selectionList:updateDataSource()
	end
end

function EquipBubblegumPack( f1233_arg0, f1233_arg1, f1233_arg2 )
	Engine.EquipBubbleGumPack( f1233_arg2, Engine.GetModelValue( f1233_arg1:getModel( f1233_arg2, "bgbPackIndex" ) ) )
end

function EquipBubblegumBuff( f1234_arg0, f1234_arg1, f1234_arg2 )
	local f1234_local0 = Engine.GetEquippedBubbleGumPack( f1234_arg2 )
	local f1234_local1 = CoD.perController[f1234_arg2].bgbIndex
	local f1234_local2 = Engine.GetModelValue( f1234_arg1:getModel( f1234_arg2, "itemIndex" ) )
	local f1234_local3, f1234_local4 = nil
	for f1234_local5 = 0, CoD.BubbleGumBuffs.NumBuffsPerPack - 1, 1 do
		if Engine.GetBubbleGumBuff( f1234_arg2, f1234_local0, f1234_local5 ) == f1234_local2 then
			f1234_local4 = f1234_local5
			f1234_local3 = Engine.GetBubbleGumBuff( f1234_arg2, f1234_local0, f1234_local1 )
			break
		end
	end
	Engine.SetBubbleGumBuff( f1234_arg2, f1234_local0, f1234_local1, f1234_local2 )
	if f1234_local4 then
		Engine.SetBubbleGumBuff( f1234_arg2, f1234_local0, f1234_local4, f1234_local3 )
	end
end

function ShowBubblegumBuffModel( f1235_arg0, f1235_arg1, f1235_arg2 )
	local f1235_local0 = Engine.GetModelValue( f1235_arg1:getModel( f1235_arg2, "itemIndex" ) )
	Engine.SendClientScriptNotify( f1235_arg2, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f1235_arg2 ), Engine.GetItemGroup( f1235_local0, Enum.eModes.MODE_ZOMBIES ), "p7_" .. Engine.GetItemRef( f1235_local0, Enum.eModes.MODE_ZOMBIES ) .. "_ui", "select01", nil, nil, true, false )
end

function SelectBubblegumBuff( f1236_arg0, f1236_arg1, f1236_arg2 )
	CoD.perController[f1236_arg2].bgbIndex = Engine.GetModelValue( f1236_arg1:getModel( f1236_arg2, "bgbIndex" ) )
end

function SetBubbleGumPackNameFromPackIndex( f1237_arg0, f1237_arg1, f1237_arg2 )
	return Engine.SetBubbleGumPackName( f1237_arg0, f1237_arg1, f1237_arg2 )
end

function MegaChewFactoryFocusChanged( f1238_arg0, f1238_arg1, f1238_arg2 )
	local f1238_local0 = f1238_arg1:getModel( f1238_arg2, "index" )
	if f1238_local0 then
		Engine.SendClientScriptNotify( f1238_arg2, "mega_chew_update", "focus_changed", Engine.GetModelValue( f1238_local0 ) )
	end
end

function MegaChewFactoryPurchase( f1239_arg0, f1239_arg1, f1239_arg2 )
	local f1239_local0 = f1239_arg1:getModel( f1239_arg2, "price" )
	if f1239_local0 and Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f1239_arg2 ), "MegaChewFactory" ), "getResultsOrKeepWaiting" ) then
		local f1239_local1 = Engine.GetModelValue( f1239_local0 )
		Engine.SendClientScriptNotify( f1239_arg2, "mega_chew_update", "purchased", Engine.GetModelValue( f1239_local0 ), f1239_arg2 )
	end
end

function UpdateMenuVialModel( f1240_arg0, f1240_arg1, f1240_arg2 )
	local f1240_local0 = Engine.GetModelValue( f1240_arg1:getModel( f1240_arg2, "vials" ) )
	local f1240_local1 = Engine.GetModelValue( f1240_arg1:getModel( f1240_arg2, "image" ) )
	Engine.SetModelValue( f1240_arg0:getModel( f1240_arg2, "vials" ), f1240_local0 )
	Engine.SetModelValue( f1240_arg0:getModel( f1240_arg2, "image" ), f1240_local1 )
end

function UpdateOverlayImageWithElementImage( f1241_arg0, f1241_arg1, f1241_arg2 )
	local f1241_local0 = Engine.GetModelValue( f1241_arg1:getModel( f1241_arg2, "image" ) )
	if f1241_local0 then
		Engine.SetModelValue( f1241_arg0:getModel( f1241_arg2, "image" ), f1241_local0 )
	end
end

function SetSeenMegaChewFactoryFirstTimePopup( f1242_arg0 )
	local f1242_local0 = Engine.StorageGetBuffer( f1242_arg0, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
	if f1242_local0 then
		f1242_local0.extraBools[0]:set( 1 )
	end
end

function SetSeenNewtonsCookbookFirstTimePopup( f1243_arg0 )
	local f1243_local0 = Engine.StorageGetBuffer( f1243_arg0, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
	if f1243_local0 then
		f1243_local0.extraBools[2]:set( 1 )
		UploadStats( nil, f1243_arg0 )
	end
end

function FocusWeaponBuildKit( f1244_arg0, f1244_arg1, f1244_arg2 )
	Gunsmith_GainFocus( f1244_arg0, f1244_arg1, f1244_arg2 )
	local f1244_local0 = CoD.GetCustomization( f1244_arg2, "weapon_index" )
	if not f1244_local0 then
		return 
	else
		local f1244_local1 = CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList( f1244_local0 )
		local f1244_local2 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f1244_arg2, f1244_local1[#f1244_local1].variantIndex )
		local f1244_local3 = Engine.CreateModel( Engine.GetModelForController( f1244_arg2 ), "WeaponBuildKitVariant" )
		DataSources.GunsmithVariantList.createVariantModel( f1244_arg2, f1244_local0, f1244_local2, 1, f1244_local3 )
		CoD.perController[f1244_arg2].gunsmithVariantModel = f1244_local3
		CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f1244_arg2, CoD.perController[f1244_arg2].gunsmithVariantModel )
		f1244_arg0:setModel( f1244_local3 )
		f1244_arg0.WeaponBuildKitsAttachmentsPreview:processEvent( {
			name = "update_state",
			controller = f1244_arg2
		} )
	end
end

function SelectWeaponBuildKitCategory( f1245_arg0, f1245_arg1 )
	local f1245_local0 = Engine.GetModel( f1245_arg0:getModel(), "categoryRef" )
	if f1245_local0 then
		local f1245_local1 = Engine.GetModelValue( f1245_local0 )
		DataSources.Unlockables.setCurrentFilterItem( f1245_local1 )
		CoD.perController[f1245_arg1].weaponCategory = f1245_local1
	end
end

function SelectWeaponBuildKit( f1246_arg0, f1246_arg1, f1246_arg2 )
	Gunsmith_BrowseVariants( f1246_arg0, f1246_arg1, f1246_arg2 )
	local f1246_local0 = CoD.GetCustomization( f1246_arg2, "weapon_index" )
	if not f1246_local0 then
		return 
	end
	local f1246_local1 = CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList( f1246_local0 )
	local f1246_local2 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f1246_arg2, f1246_local1[#f1246_local1].variantIndex )
	local f1246_local3 = Engine.CreateModel( Engine.GetModelForController( f1246_arg2 ), "WeaponBuildKitVariant" )
	DataSources.GunsmithVariantList.createVariantModel( f1246_arg2, f1246_local0, f1246_local2, 1, f1246_local3 )
	CoD.perController[f1246_arg2].gunsmithVariantModel = f1246_local3
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f1246_arg2, CoD.perController[f1246_arg2].gunsmithVariantModel )
	if not CoD.CraftUtility.Gunsmith.IsVariantIndexOccupied( f1246_local2.variantIndex ) then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1246_arg2 ), "Gunsmith.validVariantNameEntered" ), false )
		local f1246_local4 = Engine.GetModel( f1246_local3, "variantTextEntry" )
		if f1246_local4 then
			Engine.SetModelValue( f1246_local4, "" )
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1246_arg2 ), "Gunsmith.validVariantNameEntered" ), true )
		end
		Engine.SetModelValue( Engine.GetModel( f1246_local3, "variantName" ), Engine.GetModelValue( f1246_local4 ) )
	end
	OpenOverlay( f1246_arg0, "WeaponBuildKitsCustomizeVariant", f1246_arg2 )
	Gunsmith_ChooseWeaponList( f1246_arg0, f1246_arg1, f1246_arg2 )
end

function SaveWeaponBuildKit( f1247_arg0, f1247_arg1, f1247_arg2 )
	local f1247_local0 = CoD.perController[f1247_arg2].gunsmithVariantModel
	CoD.CraftUtility.Gunsmith.WriteVaraintDataToDDL( f1247_arg2, f1247_arg0:getModel() )
	local f1247_local1 = f1247_arg0
	local f1247_local2 = GoBackAndUpdateStateOnPreviousMenu( f1247_local1, f1247_arg2 )
	ClearMenuSavedState( f1247_local1 )
	local f1247_local3 = Engine.GetModelValue( Engine.GetModel( f1247_local0, "variantIndex" ) )
	f1247_local2.variantSelector.variantList:updateDataSource( true )
	f1247_local2.variantSelector.variantList:findItem( {
		variantIndex = f1247_local3
	}, nil, true, nil )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f1247_arg2, f1247_local0 )
end

function SetMap( f1248_arg0, f1248_arg1, f1248_arg2 )
	local f1248_local0 = CoD.mapsTable[f1248_arg1]
	if f1248_local0 == nil then
		if Mods_Enabled() then
			if not Mods_IsUsingMods() then
				Engine.LobbyVM_CallFunc( "LoadMod", {
					ugcName = LuaEnums.DEFAULT_MOD_NAME,
					ugcType = LuaEnums.MODS_BASE_PATH,
					ugcVersion = 1
				} )
			end
			local f1248_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.selectedMapId" )
			Engine.GameLobbySetMap( f1248_arg1 )
			Engine.SetModelValue( f1248_local1, f1248_arg1 )
			return 
		end
		f1248_arg1 = LuaUtils.GetDefaultMap( LobbyData.GetCurrentMenuTarget() )
		f1248_local0 = CoD.mapsTable[f1248_arg1]
	end
	if f1248_arg2 then
		Engine.SetDvar( "cp_queued_level", f1248_arg1 )
		if f1248_local0.safeHouse then
			f1248_arg1 = f1248_local0.safeHouse
		end
	end
	Engine.GameLobbySetMap( f1248_arg1 )
	if IsFreeRunMap( f1248_arg1 ) then
		Engine.SetProfileVar( f1248_arg0, CoD.profileKey_map_fr, f1248_arg1 )
	else
		Engine.SetProfileVar( f1248_arg0, CoD.profileKey_map, f1248_arg1 )
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.selectedMapId" ), f1248_arg1 )
	Engine.CommitProfileChanges( f1248_arg0 )
end

function OpenPurchaseMapPackConfirmation( f1249_arg0, f1249_arg1, f1249_arg2, f1249_arg3 )
	local f1249_local0 = nil
	local f1249_local1 = CoD.SafeGetModelValue( f1249_arg1:getModel(), "dlcIndex" )
	if f1249_local1 and Engine.GetDLCBitForDLCIndex then
		f1249_local0 = Engine.GetDLCBitForDLCIndex( f1249_local1 )
	end
	if not f1249_local0 then
		local f1249_local2 = Engine.GetDLCBitForMapName
		local f1249_local3 = f1249_arg1.mapName
		if not f1249_local3 then
			f1249_local3 = f1249_arg1.mapId or f1249_arg1.id
		end
		f1249_local0 = f1249_local2( f1249_local3 )
	end
	local f1249_local2 = {
		dlcPack = f1249_local0 and CoD.DLCPackFromBit[f1249_local0],
		actionSource = f1249_arg2
	}
	if f1249_local2.dlcPack and f1249_local2.dlcPack == "DLC5" and CoD.isPS4 then
		f1249_local2.dlcPack = "DLC5_ORBIS"
	end
	if f1249_local2.dlcPack then
		CoD.OverlayUtility.CreateOverlay( f1249_arg0, f1249_arg3, "PurchaseMapPackConfirmation", f1249_arg0, f1249_local2 )
	end
end

function MapSelected( f1250_arg0, f1250_arg1 )
	SetMap( f1250_arg1, f1250_arg0.mapName, false )
end

function CustomGamesOpenMyShowcase( f1251_arg0, f1251_arg1 )
	CoD.FileshareUtility.SetFileshareMode( f1251_arg1, Enum.FileshareMode.FILESHARE_MODE_USER )
	FileshareSetShowcasePublishMode( f1251_arg1, false )
	CoD.FileshareUtility.FetchContentForUser( f1251_arg1, Engine.GetXUID64( f1251_arg1 ) )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	CoD.FileshareUtility.SetShowFileDetails( false )
	CoD.FileshareUtility.SetShowPublishNewDetails( false )
	CoD.FileshareUtility.SetShowCreateButton( false )
	SetInCustomGames( 1 )
	OpenShowcaseCustomGames( f1251_arg0, nil, f1251_arg1, "", nil )
end

function SetInCustomGames( f1252_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" ), "inCustomGames" ), f1252_arg0 )
end

function CustomGamesOpenOptions( f1253_arg0, f1253_arg1, f1253_arg2 )
	OpenPopup( f1253_arg0, "CustomGamesOptions", f1253_arg1 )
end

function GetCurrentGameType( f1254_arg0 )
	return Engine.DvarString( nil, "ui_gametype" )
end

function SetCurrentUIGameType( f1255_arg0, f1255_arg1 )
	local f1255_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" )
	Engine.SetModelValue( Engine.CreateModel( f1255_local0, "communityOption" ), false )
	Engine.SetModelValue( Engine.CreateModel( f1255_local0, "showcaseOption" ), false )
	if f1255_arg0.gametype then
		Engine.SetModelValue( Engine.CreateModel( f1255_local0, "gameType" ), f1255_arg0.gametype )
		if CoD.perController[f1255_arg1].previousGameType ~= f1255_arg0.gametype then
			CustomGameMarkDirty( f1255_arg1 )
			CoD.perController[f1255_arg1].previousGameType = ""
		end
	else
		CoD.perController[f1255_arg1].previousGameType = ""
	end
	if f1255_arg0.community or f1255_arg0.showcase then
		Engine.SetModelValue( Engine.CreateModel( f1255_local0, "gameType" ), "" )
		Engine.SetModelValue( Engine.CreateModel( f1255_local0, "communityOption" ), f1255_arg0.community )
		Engine.SetModelValue( Engine.CreateModel( f1255_local0, "showcaseOption" ), f1255_arg0.showcase )
		local f1255_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" )
		if Engine.GetModelValue( Engine.CreateModel( f1255_local1, "secondaryListSelected" ) ) == true then
			Engine.SetModelValue( Engine.CreateModel( f1255_local1, "secondaryListSelected" ), false )
		else
			CustomGameMarkDirty( f1255_arg1 )
		end
	end
end

function GetCurrentUIGameType( f1256_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" ), "gameType" ) ) or "tdm"
end

function LoadCustomGame( f1257_arg0, f1257_arg1 )
	local f1257_local0 = f1257_arg0:getModel( f1257_arg1, "slot" )
	local f1257_local1 = f1257_arg0:getModel( f1257_arg1, "index" )
	local f1257_local2 = f1257_arg0:getModel( f1257_arg1, "gameName" )
	Engine.LobbyHost_SetCustomGameName( "" )
	if f1257_local0 and f1257_local1 then
		local f1257_local3 = false
		local f1257_local4 = f1257_arg0:getModel( f1257_arg1, "isOfficial" )
		if f1257_local4 then
			f1257_local3 = Engine.GetModelValue( f1257_local4 )
		end
		if f1257_local3 then
			Engine.Exec( f1257_arg1, "customgames_loadofficialgame " .. Engine.GetModelValue( f1257_local0 ) .. " " .. Engine.GetModelValue( f1257_local1 ) )
		else
			Engine.Exec( f1257_arg1, "customgames_load " .. Engine.GetModelValue( f1257_local0 ) .. " " .. Engine.GetModelValue( f1257_local1 ) )
		end
		CustomGamesShowLoadSuccessToast( f1257_arg0, f1257_arg1, Engine.GetModelValue( f1257_local2 ) )
	end
end

function LoadFileshareCustomGame( f1258_arg0, f1258_arg1, f1258_arg2 )
	local f1258_local0 = CoD.FileshareUtility.GetSelectedItem()
	local f1258_local1 = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	if f1258_local1 then
		Engine.LoadFileshareCustomGame( f1258_arg2, f1258_local1 )
	end
end

function SaveCustomGame( f1259_arg0, f1259_arg1, f1259_arg2 )
	local f1259_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" )
	local f1259_local1 = Engine.GetModelValue( Engine.CreateModel( f1259_local0, "isOfficial" ) )
	local f1259_local2 = Engine.GetModelValue( Engine.CreateModel( f1259_local0, "slot" ) )
	local f1259_local3 = Engine.GetModelValue( Engine.CreateModel( f1259_local0, "index" ) )
	local f1259_local4 = Engine.GetModelValue( Engine.CreateModel( f1259_local0, "gameName" ) )
	local f1259_local5 = Engine.GetModelValue( Engine.CreateModel( f1259_local0, "gameDescription" ) )
	if not f1259_local4 or f1259_local4 == "" then
		f1259_local4 = "Custom Game"
	end
	if not f1259_local5 or f1259_local5 == "" then
		f1259_local5 = Engine.Localize( Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", GetCurrentGameType(), "description" ) )
	end
	if f1259_local1 == nil or f1259_local1 == 1 or f1259_local1 == true then
		Engine.SetModelValue( Engine.CreateModel( f1259_local0, "gameName" ), "Custom Game" )
		Engine.SetModelValue( Engine.CreateModel( f1259_local0, "gameDescription" ), "Game Description" )
		OpenOverlay( f1259_arg0, "CustomGamesSave", f1259_arg2 )
	else
		Engine.Exec( f1259_arg1, "customgames_save " .. f1259_local2 .. " " .. f1259_local3 .. " " .. GetCurrentGameType() .. " \"" .. f1259_local4 .. "\"" .. " \"" .. f1259_local5 .. "\"" )
	end
end

function CustomGameSelectorLoseFocus( f1260_arg0, f1260_arg1, f1260_arg2, f1260_arg3 )
	CoD.perController[f1260_arg2].previousGameType = GetCurrentUIGameType( f1260_arg2 )
end

function CustomGameSelector_Delete( f1261_arg0, f1261_arg1, f1261_arg2, f1261_arg3, f1261_arg4 )
	DeleteCustomGameYes( f1261_arg0, f1261_arg1, f1261_arg2, f1261_arg3, f1261_arg4 )
	MediaManagerMarkDirty( f1261_arg2 )
end

function SaveCustomGameYes( f1262_arg0, f1262_arg1, f1262_arg2, f1262_arg3, f1262_arg4 )
	local f1262_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" )
	local f1262_local1 = Engine.GetModelValue( Engine.CreateModel( f1262_local0, "gameName" ) )
	local f1262_local2 = Engine.GetModelValue( Engine.CreateModel( f1262_local0, "gameDescription" ) )
	if not f1262_local1 or f1262_local1 == "" then
		f1262_local1 = "Custom Game"
	end
	if not f1262_local2 or f1262_local2 == "" then
		f1262_local2 = Engine.Localize( Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", GetCurrentGameType(), "description" ) )
	end
	Engine.Exec( f1262_arg2, "customgames_savenew " .. GetCurrentGameType() .. " \"" .. f1262_local1 .. "\"" .. " \"" .. f1262_local2 .. "\"" )
end

function DeleteCustomGame( f1263_arg0, f1263_arg1, f1263_arg2, f1263_arg3, f1263_arg4 )
	if Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" ), "isOfficial" ) ) then
		return 
	else
		OpenOverlay( f1263_arg4, "CustomGamesDelete", f1263_arg2 )
	end
end

function DeleteCustomGameYes( f1264_arg0, f1264_arg1, f1264_arg2, f1264_arg3, f1264_arg4 )
	local f1264_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" )
	local f1264_local1 = Engine.GetModelValue( Engine.CreateModel( f1264_local0, "slot" ) )
	local f1264_local2 = Engine.GetModelValue( Engine.CreateModel( f1264_local0, "index" ) )
	GoBack( f1264_arg0, f1264_arg2 )
	Engine.ExecNow( f1264_arg2, "customgames_delete " .. f1264_local1 .. " " .. f1264_local2 )
end

function DeleteCustomGameNo( f1265_arg0, f1265_arg1, f1265_arg2, f1265_arg3, f1265_arg4 )
	GoBack( f1265_arg4, f1265_arg2 )
end

function CustomGamesProcessDeleteSuccess( f1266_arg0, f1266_arg1, f1266_arg2 )
	CustomGameMarkDirty( f1266_arg1 )
	local f1266_local0 = Engine.Localize( "MENU_CUSTOMGAME_DELETED" )
	local f1266_local1 = ""
	if not f1266_arg2 or f1266_arg2 == "" then
		local f1266_local2 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" ), "gameName" )
		if f1266_local2 then
			f1266_local1 = f1266_local2
		end
	else
		f1266_local1 = f1266_arg2
	end
	CoD.OverlayUtility.ShowToast( "Fileshare", f1266_local0, f1266_local1, "uie_t7_mp_icon_header_customgames", "uie_t7_mp_icon_header_customgames" )
end

function OpenCustomGamePublishPrompt( f1267_arg0, f1267_arg1, f1267_arg2, f1267_arg3, f1267_arg4 )
	local f1267_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" )
	local f1267_local1 = Engine.GetModelValue( Engine.CreateModel( f1267_local0, "isOfficial" ) )
	local f1267_local2 = Engine.GetModelValue( Engine.CreateModel( f1267_local0, "gameName" ) )
	local f1267_local3 = Engine.GetModelValue( Engine.CreateModel( f1267_local0, "gameDescription" ) )
	if f1267_local1 then
		return 
	elseif not f1267_local2 then
		f1267_local2 = "Custom Game"
	end
	if not f1267_local3 then
		f1267_local3 = ""
	end
	CoD.FileshareUtility.OpenPublishPrompt( f1267_arg4, f1267_arg2, "customgame", f1267_local2, f1267_local3, PublishCustomGame )
end

function PublishCustomGame( f1268_arg0 )
	local f1268_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" )
	Engine.PublishCustomGame( f1268_arg0, "customgame", Engine.GetModelValue( Engine.CreateModel( f1268_local0, "slot" ) ), Engine.GetModelValue( Engine.CreateModel( f1268_local0, "index" ) ), CoD.FileshareUtility.GetPublishName(), GetCurrentUIGameType( f1268_arg0 ), CoD.FileshareUtility.GetPublishDescription() )
end

function SetSelectedCustomGame( f1269_arg0, f1269_arg1 )
	local f1269_local0 = f1269_arg0:getModel()
	local f1269_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" )
	Engine.SetModelValue( Engine.CreateModel( f1269_local1, "secondaryListSelected" ), true )
	Engine.SetModelValue( Engine.CreateModel( f1269_local1, "slot" ), CoD.SafeGetModelValue( f1269_local0, "slot" ) )
	Engine.SetModelValue( Engine.CreateModel( f1269_local1, "index" ), CoD.SafeGetModelValue( f1269_local0, "index" ) )
	Engine.SetModelValue( Engine.CreateModel( f1269_local1, "uiIndex" ), CoD.SafeGetModelValue( f1269_local0, "uiIndex" ) )
	Engine.SetModelValue( Engine.CreateModel( f1269_local1, "gameName" ), CoD.SafeGetModelValue( f1269_local0, "gameName" ) )
	Engine.SetModelValue( Engine.CreateModel( f1269_local1, "gameDescription" ), CoD.SafeGetModelValue( f1269_local0, "gameDescription" ) )
	Engine.SetModelValue( Engine.CreateModel( f1269_local1, "isOfficial" ), CoD.SafeGetModelValue( f1269_local0, "isOfficial" ) )
end

function SetCurrentCustomGame( f1270_arg0, f1270_arg1 )
	local f1270_local0 = f1270_arg0:getModel( f1270_arg1, "slot" )
	local f1270_local1 = f1270_arg0:getModel( f1270_arg1, "index" )
	local f1270_local2 = f1270_arg0:getModel( f1270_arg1, "isOfficial" )
	local f1270_local3 = f1270_arg0:getModel( f1270_arg1, "gameName" )
	local f1270_local4 = Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" )
	if f1270_local0 and f1270_local1 and f1270_local3 then
		Engine.SetModelValue( Engine.CreateModel( f1270_local4, "slot" ), Engine.GetModelValue( f1270_local0 ) )
		Engine.SetModelValue( Engine.CreateModel( f1270_local4, "index" ), Engine.GetModelValue( f1270_local1 ) )
		Engine.SetModelValue( Engine.CreateModel( f1270_local4, "gameName" ), Engine.GetModelValue( f1270_local3 ) )
	end
	if f1270_local2 then
		Engine.LobbyHost_SetOfficialCustomGame( Engine.GetModelValue( f1270_local2 ) )
	end
end

function CustomGameMarkDirty( f1271_arg0 )
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" ), "dirty" ) )
end

function OpenPopularCustomGames( f1272_arg0, f1272_arg1, f1272_arg2 )
	CoD.FileshareUtility.SetCurrentCommunityDataType( Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_POPULAR )
	CoD.FileshareUtility.SetFileshareMode( f1272_arg2, Enum.FileshareMode.FILESHARE_MODE_COMMUNITY )
	local f1272_local0 = Engine.CreateModel( f1272_arg1:getModel(), "category" )
	local f1272_local1 = Engine.CreateModel( f1272_arg1:getModel(), "communityDataType" )
	Engine.SetModelValue( f1272_local0, "customgame" )
	Engine.SetModelValue( f1272_local1, Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_POPULAR )
	SetInCustomGames( 1 )
	FileshareCategorySelectorItemSelected( f1272_arg0, f1272_arg1, f1272_arg2 )
	CoD.FileshareUtility.SetShowCreateButton( false )
	CoD.FileshareUtility.SetShowFileDetails( false )
	CoD.FileshareUtility.SetShowPublishNewDetails( false )
	OpenShowcase( f1272_arg0, f1272_arg1, f1272_arg2, nil, f1272_arg0 )
end

function OpenTrendingCustomGames( f1273_arg0, f1273_arg1, f1273_arg2 )
	CoD.FileshareUtility.SetCurrentCommunityDataType( Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_TRENDING )
	CoD.FileshareUtility.SetFileshareMode( f1273_arg2, Enum.FileshareMode.FILESHARE_MODE_COMMUNITY )
	local f1273_local0 = Engine.CreateModel( f1273_arg1:getModel(), "category" )
	local f1273_local1 = Engine.CreateModel( f1273_arg1:getModel(), "communityDataType" )
	Engine.SetModelValue( f1273_local0, "customgame" )
	Engine.SetModelValue( f1273_local1, Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_TRENDING )
	SetInCustomGames( 1 )
	FileshareCategorySelectorItemSelected( f1273_arg0, f1273_arg1, f1273_arg2 )
	CoD.FileshareUtility.SetShowCreateButton( false )
	CoD.FileshareUtility.SetShowFileDetails( false )
	CoD.FileshareUtility.SetShowPublishNewDetails( false )
	OpenShowcase( f1273_arg0, f1273_arg1, f1273_arg2, nil, f1273_arg0 )
end

function OpenrRecentCustomGames( f1274_arg0, f1274_arg1, f1274_arg2 )
	CoD.FileshareUtility.SetCurrentCommunityDataType( Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_RECENT )
	CoD.FileshareUtility.SetFileshareMode( f1274_arg2, Enum.FileshareMode.FILESHARE_MODE_COMMUNITY )
	local f1274_local0 = Engine.CreateModel( f1274_arg1:getModel(), "category" )
	local f1274_local1 = Engine.CreateModel( f1274_arg1:getModel(), "communityDataType" )
	Engine.SetModelValue( f1274_local0, "customgame" )
	Engine.SetModelValue( f1274_local1, Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_RECENT )
	SetInCustomGames( 1 )
	FileshareCategorySelectorItemSelected( f1274_arg0, f1274_arg1, f1274_arg2 )
	CoD.FileshareUtility.SetShowCreateButton( false )
	CoD.FileshareUtility.SetShowFileDetails( false )
	CoD.FileshareUtility.SetShowPublishNewDetails( false )
	OpenShowcase( f1274_arg0, f1274_arg1, f1274_arg2, nil, f1274_arg0 )
end

function GameModeSelected( f1275_arg0, f1275_arg1 )
	Engine.Exec( f1275_arg1, "resetCustomGametype" )
	local f1275_local0 = CoDShared.IsGametypeTeamBased()
	local f1275_local1 = GetCurrentUIGameType( f1275_arg1 )
	if f1275_local1 == "" then
		return 
	end
	Engine.SetGametype( f1275_local1 )
	if f1275_local0 ~= CoDShared.IsGametypeTeamBased() then
		Engine.SetDvar( "bot_friends", 0 )
		Engine.SetDvar( "bot_enemies", 0 )
	end
	Engine.Exec( f1275_arg1, "xupdatepartystate" )
	Engine.SetProfileVar( f1275_arg1, CoD.profileKey_gametype, f1275_local1 )
	Engine.PartyHostClearUIState()
	Engine.CommitProfileChanges( f1275_arg1 )
	Engine.SystemNeedsUpdate( nil, "lobby" )
	Engine.LobbyVM_CallFunc( "OnGametypeSettingsChange", {
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyModule = Enum.LobbyModule.LOBBY_MODULE_HOST
	} )
end

function GameModeSelectedCommunity( f1276_arg0, f1276_arg1, f1276_arg2 )
	if f1276_arg1.oldTeamBased ~= nil and f1276_arg1.oldTeamBased ~= CoDShared.IsGametypeTeamBased() then
		Engine.SetDvar( "bot_friends", 0 )
		Engine.SetDvar( "bot_enemies", 0 )
	end
	Engine.Exec( f1276_arg2, "xupdatepartystate" )
	Engine.PartyHostClearUIState()
	Engine.CommitProfileChanges( f1276_arg2 )
	Engine.SystemNeedsUpdate( nil, "lobby" )
	Engine.LobbyVM_CallFunc( "OnGametypeSettingsChange", {
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyModule = Enum.LobbyModule.LOBBY_MODULE_HOST
	} )
end

function CustomGameHandleKeyboardComplete( f1277_arg0, f1277_arg1, f1277_arg2, f1277_arg3 )
	if f1277_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_FILESHARE_PUBLISH_NAME then
		Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" ), "gameName" ), f1277_arg3.input )
	elseif f1277_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_FILESHARE_PUBLISH_DESCRIPTION then
		Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" ), "gameDescription" ), f1277_arg3.input )
	end
end

function CustomGamesShowLoadSuccessToast( f1278_arg0, f1278_arg1, f1278_arg2 )
	local f1278_local0 = Engine.Localize( "MENU_CUSTOMGAMES_LOADED" )
	local f1278_local1 = ""
	if not f1278_arg2 or f1278_arg2 == "" then
		local f1278_local2 = Engine.GetModel( Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" ), "gameName" )
		if f1278_local2 then
			f1278_local1 = Engine.GetModelValue( f1278_local2 )
		end
	else
		f1278_local1 = f1278_arg2
	end
	local f1278_local3 = f1278_arg0:getModel( f1278_arg1, "isOfficial" )
	if f1278_local3 and Engine.GetModelValue( f1278_local3 ) == true then
		f1278_local1 = Engine.Localize( f1278_local1 )
	end
	CoD.OverlayUtility.ShowToast( "Fileshare", f1278_local0, f1278_local1, "uie_t7_mp_icon_header_customgames", "uie_t7_mp_icon_header_customgames" )
end

function CustomGamesShowLoadFailureToast( f1279_arg0, f1279_arg1, f1279_arg2 )
	local f1279_local0 = Engine.Localize( "MENU_CUSTOMGAMES_LOADED_ERROR" )
	local f1279_local1 = ""
	if not f1279_arg2 then
		local f1279_local2 = Engine.GetModel( Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" ), "gameName" )
		if f1279_local2 then
			f1279_local1 = Engine.GetModelValue( f1279_local2 )
		end
	else
		f1279_local1 = f1279_arg2
	end
	local f1279_local3 = f1279_arg0:getModel( f1279_arg1, "isOfficial" )
	if f1279_local3 and Engine.GetModelValue( f1279_local3 ) == true then
		f1279_local1 = Engine.Localize( f1279_local1 )
	end
	CoD.OverlayUtility.ShowToast( "Fileshare", f1279_local0, f1279_local1, "uie_t7_icon_error_overlays", "uie_t7_icon_error_overlays" )
end

function CustomGamesShowSaveSuccessToast( f1280_arg0, f1280_arg1, f1280_arg2 )
	local f1280_local0 = Engine.Localize( "MENU_CUSTOMGAME_SAVED" )
	local f1280_local1 = ""
	if not f1280_arg2 or f1280_arg2 == "" then
		local f1280_local2 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" ), "gameName" )
		if f1280_local2 then
			f1280_local1 = f1280_local2
		end
	else
		f1280_local1 = f1280_arg2
	end
	CoD.OverlayUtility.ShowToast( "Fileshare", f1280_local0, f1280_local1, "uie_t7_mp_icon_header_customgames", "uie_t7_mp_icon_header_customgames" )
end

function CustomGamesShowSaveFailureToast( f1281_arg0, f1281_arg1, f1281_arg2 )
	local f1281_local0 = Engine.Localize( "MENU_CUSTOMGAME_SAVE_ERROR" )
	local f1281_local1 = ""
	if not f1281_arg2 or f1281_arg2 == "" then
		local f1281_local2 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" ), "gameName" )
		if f1281_local2 then
			f1281_local1 = f1281_local2
		end
	else
		f1281_local1 = f1281_arg2
	end
	CoD.OverlayUtility.ShowToast( "Fileshare", f1281_local0, f1281_local1, "uie_t7_icon_error_overlays", "uie_t7_icon_error_overlays" )
end

function CycleContracts( f1282_arg0 )
	LuaUtils.CycleContracts()
end

function PlaylistSelected( f1283_arg0, f1283_arg1, f1283_arg2 )
	local f1283_local0 = f1283_arg1
	local f1283_local1 = f1283_arg1.playlist
	if f1283_local1 then
		f1283_local1 = f1283_local0 and f1283_arg1.playlist.index
	end
	if not f1283_local1 then
		return 
	end
	local f1283_local2 = CoD.PlaylistCategoryFilter or ""
	Engine.SetPlaylistID( f1283_local1 )
	Engine.SetProfileVar( f1283_arg2, "playlist_" .. f1283_local2, tostring( f1283_local1 ) )
	Engine.PartyHostClearUIState()
	CoD.LobbyBase.SetPlaylistName( f1283_arg1.playlist.name )
	local f1283_local3 = f1283_arg0.occludedMenu
	GoBack( f1283_arg0, f1283_arg2 )
	if f1283_local3 then
		f1283_local3:processEvent( {
			name = "playlist_selected",
			controller = f1283_arg2,
			itemInfo = f1283_arg1.playlist
		} )
	end
end

function PlaylistCategorySelected( f1284_arg0, f1284_arg1, f1284_arg2 )
	SetElementPropertyOnPerControllerTable( f1284_arg2, "playlistCategory", f1284_arg1, "category" )
	UpdateElementDataSource( f1284_arg0, "playlistList" )
	SetMenuState( f1284_arg0, "SelectingPlaylist" )
	SetLoseFocusToElement( f1284_arg0, "playlistCategoriesList", f1284_arg2 )
	MakeElementNotFocusable( f1284_arg0, "playlistCategoriesList", f1284_arg2 )
	MakeElementFocusable( f1284_arg0, "playlistList", f1284_arg2 )
	SetFocusToElement( f1284_arg0, "playlistList", f1284_arg2 )
end

function BlockGameFromKeyEvent( f1285_arg0 )
	Engine.BlockGameFromKeyEvent()
end

function ToggleScoreboardClientMute( f1286_arg0, f1286_arg1 )
	Engine.BlockGameFromKeyEvent()
	local f1286_local0 = f1286_arg0:getModel( f1286_arg1, "clientNum" )
	if not f1286_local0 then
		return 
	end
	local f1286_local1 = Engine.GetModelValue( f1286_local0 )
	if f1286_local1 and f1286_local1 >= 0 and Engine.GetClientNum( f1286_arg1 ) ~= f1286_local1 then
		Engine.TogglePlayerMute( f1286_arg1, f1286_local1 )
		UpdateScoreboardClientMuteButtonPrompt( f1286_arg0, f1286_arg1 )
	end
end

function UpdateScoreboardClientMuteButtonPrompt( f1287_arg0, f1287_arg1 )
	local f1287_local0 = f1287_arg0:getModel( f1287_arg1, "clientNum" )
	if not f1287_local0 then
		return 
	end
	local f1287_local1 = Engine.GetModelValue( f1287_local0 )
	local f1287_local2 = Engine.CreateModel( Engine.GetModelForController( f1287_arg1 ), "scoreboardInfo.muteButtonPromptVisible" )
	local f1287_local3 = Engine.CreateModel( Engine.GetModelForController( f1287_arg1 ), "scoreboardInfo.muteButtonPromptText" )
	Engine.SetModelValue( f1287_local2, false )
	if f1287_local1 and f1287_local1 >= 0 then
		if Engine.GetClientNum( f1287_arg1 ) == f1287_local1 then
			return 
		end
		Engine.SetModelValue( f1287_local2, true )
		if Engine.IsPlayerMutedByClientNum( f1287_arg1, Enum.LobbyType.LOBBY_TYPE_GAME, f1287_local1 ) then
			Engine.SetModelValue( f1287_local3, "MENU_UNMUTE_CAPS" )
		else
			Engine.SetModelValue( f1287_local3, "MENU_MUTE_CAPS" )
		end
	end
end

function ShowGamerCardForScoreboardRow( f1288_arg0, f1288_arg1 )
	local f1288_local0 = CoD.SafeGetModelValue( f1288_arg1:getModel(), "clientNum" )
	if not Engine.IsVisibilityBitSet( f1288_arg0, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and CoD.SafeGetModelValue( Engine.GetModelForController( f1288_arg0 ), "forceScoreboard" ) ~= 1 then
		return 
	else
		Engine.ShowGamerCard( f1288_arg0, f1288_local0 )
	end
end

function ShowAccountPicker( f1289_arg0 )
	Engine.ShowAccountPicker( f1289_arg0 )
end

function AdjustBrightness( f1290_arg0, f1290_arg1 )
	local f1290_local0 = f1290_arg0:getModel( f1290_arg1, "value" )
	if f1290_local0 then
		Engine.SetProfileVar( f1290_arg1, "r_sceneBrightness", Engine.GetModelValue( f1290_local0 ) )
		Engine.Exec( f1290_arg1, "updategamerprofile" )
	end
end

function PurchaseDWSKU( f1291_arg0, f1291_arg1, f1291_arg2 )
	local f1291_local0 = f1291_arg1:getModel( f1291_arg2, "skuId" )
	if f1291_local0 then
		Engine.PurchaseDWSKU( f1291_arg2, Engine.GetModelValue( f1291_local0 ) )
		if Engine.GetMarketplaceSize() == 0 then
			f1291_arg0.MarketplaceList:processEvent( {
				name = "lose_focus",
				controller = f1291_arg2
			} )
			f1291_arg0.PlayerInventoryList:processEvent( {
				name = "gain_focus",
				controller = f1291_arg2
			} )
		end
	end
end

function RemoveFromPlayerInventory( f1292_arg0, f1292_arg1, f1292_arg2 )
	local f1292_local0 = f1292_arg1:getModel( f1292_arg2, "itemId" )
	if f1292_local0 then
		Engine.RemoveItemFromInventory( f1292_arg2, Engine.GetModelValue( f1292_local0 ), 1 )
		if Engine.GetPlayerInventorySize( f1292_arg2 ) == 0 then
			f1292_arg0.MarketplaceList:processEvent( {
				name = "gain_focus",
				controller = f1292_arg2
			} )
			f1292_arg0.PlayerInventoryList:processEvent( {
				name = "lose_focus",
				controller = f1292_arg2
			} )
		end
	end
end

function ReportItemUsageTime( f1293_arg0, f1293_arg1, f1293_arg2 )
	Engine.ReportItemUsageTime( f1293_arg2, 10 )
end

function AccountLink_SetAccountLinkViewed( f1294_arg0, f1294_arg1, f1294_arg2 )
	Engine.SetAccountLinkViewed( f1294_arg2, true )
end

function AccountLink_HandleLoginKeyboardComplete( f1295_arg0, f1295_arg1, f1295_arg2, f1295_arg3 )
	local f1295_local0 = Engine.GetModel( Engine.GetGlobalModel(), "AccountLinkLogin" )
	local f1295_local1, f1295_local2 = nil
	if not f1295_local0 then
		return 
	elseif f1295_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_EMAIL then
		f1295_local1 = Engine.GetModel( f1295_local0, "email" )
	end
	if f1295_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_PASSWORD then
		f1295_local2 = Engine.GetModel( f1295_local0, "password" )
	end
	if f1295_local1 then
		Engine.SetModelValue( f1295_local1, f1295_arg3.input )
	end
	if f1295_local2 then
		Engine.SetModelValue( f1295_local2, f1295_arg3.input )
		local f1295_local3 = ""
		for f1295_local4 = 0, string.len( f1295_arg3.input ) - 1, 1 do
			local f1295_local7 = f1295_local4
			f1295_local3 = f1295_local3 .. "*"
		end
		Engine.SetModelValue( Engine.GetModel( f1295_local0, "stars" ), f1295_local3 )
	end
end

function AccountLink_Login( f1296_arg0, f1296_arg1, f1296_arg2 )
	local f1296_local0 = GoBack( f1296_arg0, f1296_arg2 )
	local f1296_local1 = f1296_local0:openOverlay( "Spinner", f1296_arg2 )
	f1296_local1:registerEventHandler( "optin_success", function ( element, event )
		CoD.OverlayUtility.CreateOverlay( f1296_arg2, element, "OptInSuccess" )
		element:close()
	end )
	f1296_local1:registerEventHandler( "registration_failure", function ( element, event, f1298_arg2 )
		FinishRegistrationFlow( element, f1296_arg2, element )
	end )
	local f1296_local2 = Engine.GetModel( Engine.GetGlobalModel(), "AccountLinkLogin" )
	Engine.AccountLinkLogin( f1296_arg2, tostring( Engine.GetModelValue( Engine.GetModel( f1296_local2, "email" ) ) ), tostring( Engine.GetModelValue( Engine.GetModel( f1296_local2, "password" ) ) ) )
end

function AccountLink_HandleRegisterKeyboardComplete( f1299_arg0, f1299_arg1, f1299_arg2, f1299_arg3 )
	local f1299_local0 = Engine.GetModel( Engine.GetModelForController( f1299_arg2 ), "AccountLinkRegister" )
	local f1299_local1, f1299_local2, f1299_local3, f1299_local4, f1299_local5, f1299_local6, f1299_local7 = nil
	if not f1299_local0 then
		return 
	elseif f1299_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_FIRST_NAME then
		f1299_local1 = Engine.GetModel( f1299_local0, "firstName" )
		if f1299_local1 then
			Engine.SetModelValue( f1299_local1, f1299_arg3.input )
		end
	end
	if f1299_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_LAST_NAME then
		f1299_local2 = Engine.GetModel( f1299_local0, "lastName" )
		if f1299_local2 then
			Engine.SetModelValue( f1299_local2, f1299_arg3.input )
		end
	end
	if f1299_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_ZIP_CODE then
		f1299_local3 = Engine.GetModel( f1299_local0, "zipCode" )
		if f1299_local3 then
			Engine.SetModelValue( f1299_local3, f1299_arg3.input )
		end
	end
	if f1299_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_USERNAME then
		f1299_local4 = Engine.GetModel( f1299_local0, "username" )
		if f1299_local4 then
			Engine.SetModelValue( f1299_local4, f1299_arg3.input )
		end
	end
	if f1299_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_EMAIL then
		f1299_local5 = Engine.GetModel( f1299_local0, "email" )
		if f1299_local5 then
			Engine.SetModelValue( f1299_local5, f1299_arg3.input )
		end
	end
	if f1299_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_PASSWORD then
		f1299_local6 = Engine.GetModel( f1299_local0, "password" )
		if f1299_local6 then
			Engine.SetModelValue( f1299_local6, f1299_arg3.input )
			local f1299_local8 = ""
			for f1299_local9 = 0, string.len( f1299_arg3.input ) - 1, 1 do
				local f1299_local12 = f1299_local9
				f1299_local8 = f1299_local8 .. "*"
			end
			Engine.SetModelValue( Engine.GetModel( f1299_local0, "stars" ), f1299_local8 )
		end
	end
	if f1299_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_CONFIRM_PASSWORD then
		f1299_local7 = Engine.GetModel( f1299_local0, "confirmPass" )
		if f1299_local7 then
			Engine.SetModelValue( f1299_local7, f1299_arg3.input )
			local f1299_local8 = ""
			for f1299_local9 = 0, string.len( f1299_arg3.input ) - 1, 1 do
				local f1299_local12 = f1299_local9
				f1299_local8 = f1299_local8 .. "*"
			end
			Engine.SetModelValue( Engine.GetModel( f1299_local0, "confirmStars" ), f1299_local8 )
		end
	end
end

function AccountLink_SelectRegion( f1300_arg0, f1300_arg1, f1300_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f1300_arg2 ), "AccountLinkRegister" ), "region" ), Engine.GetModelValue( f1300_arg1:getModel( f1300_arg2, "itemName" ) ) )
end

function AccountLink_SelectGender( f1301_arg0, f1301_arg1, f1301_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f1301_arg2 ), "AccountLinkRegister" ), "gender" ), Engine.GetModelValue( f1301_arg1:getModel( f1301_arg2, "gender" ) ) )
end

function AccountLink_SelectMonth( f1302_arg0, f1302_arg1, f1302_arg2 )
	local f1302_local0 = Engine.GetModelValue( f1302_arg1:getModel( f1302_arg2, "month" ) )
	local f1302_local1 = Engine.GetModelValue( f1302_arg1:getModel( f1302_arg2, "monthIndex" ) )
	local f1302_local2 = Engine.GetModel( Engine.GetModelForController( f1302_arg2 ), "AccountLinkRegister" )
	Engine.SetModelValue( Engine.GetModel( f1302_local2, "month" ), f1302_local0 )
	Engine.SetModelValue( Engine.GetModel( f1302_local2, "monthIndex" ), f1302_local1 )
end

function AccountLink_SelectDay( f1303_arg0, f1303_arg1, f1303_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f1303_arg2 ), "AccountLinkRegister" ), "day" ), Engine.GetModelValue( f1303_arg1:getModel( f1303_arg2, "day" ) ) )
end

function AccountLink_SelectYear( f1304_arg0, f1304_arg1, f1304_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f1304_arg2 ), "AccountLinkRegister" ), "year" ), Engine.GetModelValue( f1304_arg1:getModel( f1304_arg2, "year" ) ) )
end

function AccountLink_Register( f1305_arg0, f1305_arg1, f1305_arg2 )
	local f1305_local0 = Engine.GetModel( Engine.GetModelForController( f1305_arg2 ), "AccountLinkRegister" )
	local f1305_local1 = Engine.GetModelValue( Engine.GetModel( f1305_local0, "firstName" ) )
	local f1305_local2 = Engine.GetModelValue( Engine.GetModel( f1305_local0, "lastName" ) )
	local f1305_local3 = Engine.GetModelValue( Engine.GetModel( f1305_local0, "zipCode" ) )
	local f1305_local4 = Engine.GetModelValue( Engine.GetModel( f1305_local0, "region" ) )
	local f1305_local5 = Engine.GetModelValue( Engine.GetModel( f1305_local0, "username" ) )
	local f1305_local6 = Engine.GetModelValue( Engine.GetModel( f1305_local0, "email" ) )
	local f1305_local7 = Engine.GetModelValue( Engine.GetModel( f1305_local0, "password" ) )
	local f1305_local8 = Engine.GetModelValue( Engine.GetModel( f1305_local0, "confirmPass" ) )
	local f1305_local9 = Engine.GetModelValue( Engine.GetModel( f1305_local0, "gender" ) )
	local f1305_local10 = Engine.GetModelValue( Engine.GetModel( f1305_local0, "monthIndex" ) )
	local f1305_local11 = Engine.GetModelValue( Engine.GetModel( f1305_local0, "day" ) )
	local f1305_local12 = Engine.GetModelValue( Engine.GetModel( f1305_local0, "year" ) )
	local f1305_local13 = {
		firstName = tostring( f1305_local1 ),
		lastName = tostring( f1305_local2 ),
		zipCode = tostring( f1305_local3 ),
		region = tostring( f1305_local4 ),
		username = tostring( f1305_local5 ),
		email = tostring( f1305_local6 ),
		password = tostring( f1305_local7 ),
		confirmPass = tostring( f1305_local8 ),
		gender = tostring( f1305_local9 ),
		month = f1305_local10,
		day = f1305_local11,
		year = f1305_local12
	}
	if f1305_local1 == nil then
		OpenGenericSmallPopup( f1305_arg0, f1305_arg2, "Please enter a valid first name", "Specific Name Constriants Here.", nil, "MENU_OK" )
		return 
	elseif f1305_local2 == nil then
		OpenGenericSmallPopup( f1305_arg0, f1305_arg2, "Please enter a valid last name", "Specific Name Constriants Here.", nil, "MENU_OK" )
		return 
	elseif f1305_local4 == nil then
		OpenGenericSmallPopup( f1305_arg0, f1305_arg2, "Please select a region", "Please select a region", nil, "MENU_OK" )
		return 
	elseif f1305_local3 == nil or string.len( f1305_local3 ) ~= 5 then
		OpenGenericSmallPopup( f1305_arg0, f1305_arg2, "Please enter a valid zip code", "Specific Zip Code Constriants Here.", nil, "MENU_OK" )
		return 
	elseif f1305_local5 == nil then
		OpenGenericSmallPopup( f1305_arg0, f1305_arg2, "Please enter a valid username", "Specific Username Constriants Here.", nil, "MENU_OK" )
		return 
	elseif f1305_local7 == nil then
		OpenGenericSmallPopup( f1305_arg0, f1305_arg2, "Please enter a valid password", "Specific Password Constriants Here.", nil, "MENU_OK" )
		return 
	elseif f1305_local8 == nil or f1305_local7 ~= f1305_local8 then
		OpenGenericSmallPopup( f1305_arg0, f1305_arg2, "Please confirm your password", "Please confirm your password.", nil, "MENU_OK" )
		return 
	elseif f1305_local9 == nil then
		OpenGenericSmallPopup( f1305_arg0, f1305_arg2, "Please select a gender", "Please select a gender.", nil, "MENU_OK" )
		return 
	elseif f1305_local10 == nil then
		OpenGenericSmallPopup( f1305_arg0, f1305_arg2, "Please select a month", "Please select a month.", nil, "MENU_OK" )
		return 
	elseif f1305_local11 == nil then
		OpenGenericSmallPopup( f1305_arg0, f1305_arg2, "Please select a day", "Please select a day.", nil, "MENU_OK" )
		return 
	elseif f1305_local12 == nil then
		OpenGenericSmallPopup( f1305_arg0, f1305_arg2, "Please select a year", "Please select a year.", nil, "MENU_OK" )
		return 
	else
		Engine.AccountLinkRegister( f1305_arg2, f1305_local13 )
	end
end

function OpenRegistrationFlow( f1306_arg0, f1306_arg1, f1306_arg2, f1306_arg3 )
	local f1306_local0 = Engine.GetMarketingMessage( f1306_arg2, "registration" )
	if f1306_local0 == nil or Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "MtxCommsRegistration" ), "locationID" ) ) == 1 then
		local f1306_local1 = Engine.GetMarketingMessage( f1306_arg2, "motd" )
		if f1306_local1 ~= nil and f1306_local1.bannerAction ~= nil and LUI.startswith( f1306_local1.bannerAction, "store" ) then
			local f1306_local2 = GoBack( f1306_arg0, f1306_arg2 )
			CoD.StoreUtility.SetupFocusCategory( f1306_arg2, f1306_local1.bannerAction )
			OpenStore( f1306_arg0, f1306_arg1, f1306_arg2, "MOTDBanner", f1306_local2 )
		end
	else
		local f1306_local1 = f1306_local0.action
		if f1306_local1 ~= nil then
			LUI.CoDMetrics.CRMMessageInteraction( f1306_arg0, f1306_arg2, "registration" )
			if f1306_local1 == "registration" then
				local f1306_local2 = GoBack( f1306_arg0, f1306_arg2 )
				local f1306_local3 = f1306_local2:openOverlay( "InGameRegistration", f1306_arg2 )
				f1306_local3.crm_message_id = f1306_local0.messageID
			elseif f1306_local1 == "opt-in" then
				local f1306_local2 = GoBack( f1306_arg0, f1306_arg2 )
				local f1306_local3 = f1306_local2:openOverlay( "InGameOptIn", f1306_arg2 )
				f1306_local3.crm_message_id = f1306_local0.messageID
			elseif LUI.startswith( f1306_local1, "store" ) then
				local f1306_local2 = GoBack( f1306_arg0, f1306_arg2 )
				if f1306_local0.content_long == "" then
					if CoD.isPC then
						OpenSteamStore( f1306_arg0, f1306_arg1, f1306_arg2, "MOTDBanner", f1306_local2 )
					else
						CoD.StoreUtility.SetupFocusCategory( f1306_arg2, f1306_local1 )
						OpenStore( f1306_arg0, f1306_arg1, f1306_arg2, "MOTDBanner", f1306_local2 )
					end
				else
					OpenCRMFeaturedPopup( f1306_arg0, f1306_arg1, f1306_arg2, "MOTDBanner", f1306_local2 )
				end
			elseif f1306_local1 == "blackmarket" then
				local f1306_local2 = GoBack( f1306_arg0, f1306_arg2 )
				if f1306_local0.content_long == "" then
					Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "blackmarketOpenSource" ), Engine.GetCurrentMode() )
					Engine.SwitchMode( f1306_arg2, "mp" )
					OpenBlackMarket( f1306_local2, nil, f1306_arg2 )
				else
					OpenCRMFeaturedPopup( f1306_arg0, f1306_arg1, f1306_arg2, "MOTDBanner", f1306_local2 )
				end
			elseif f1306_local1 == "drmonty" then
				local f1306_local2 = GoBack( f1306_arg0, f1306_arg2 )
				if f1306_local0.content_long == "" then
					Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "megachewOpenSource" ), Engine.GetCurrentMode() )
					Engine.SwitchMode( f1306_arg2, "zm" )
					OpenMegaChewFactorymenu( f1306_arg0, f1306_arg1, f1306_arg2, f1306_local2.name, f1306_local2 )
				else
					OpenCRMFeaturedPopup( f1306_arg0, f1306_arg1, f1306_arg2, "MOTDBanner", f1306_local2 )
				end
			elseif f1306_local1 == "contracts" then
				local f1306_local2 = GoBack( f1306_arg0, f1306_arg2 )
				if f1306_local0.content_long == "" then
					Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "contractsOpenSource" ), Engine.GetCurrentMode() )
					Engine.SwitchMode( f1306_arg2, "mp" )
					LuaUtils.CycleContracts()
					OpenOverlay( f1306_local2, "BM_Contracts", f1306_arg2 )
				else
					OpenCRMFeaturedPopup( f1306_arg0, f1306_arg1, f1306_arg2, "MOTDBanner", f1306_local2 )
				end
			elseif f1306_local1 == "promo" then
				local f1306_local2 = GoBack( f1306_arg0, f1306_arg2 )
				if f1306_local0.content_long == "" then
					Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "promoOpenSource" ), Engine.GetCurrentMode() )
					Engine.SwitchMode( f1306_arg2, "mp" )
					OpenOverlay( f1306_local2, "ZMHD_Community_Theme", f1306_arg2, "", "" )
				else
					OpenCRMFeaturedPopup( f1306_arg0, f1306_arg1, f1306_arg2, "MOTDBanner", f1306_local2 )
				end
			elseif f1306_local1 == "expand" then
				OpenCRMFeaturedPopup( f1306_arg0, f1306_arg1, f1306_arg2, "MOTDBanner", GoBack( f1306_arg0, f1306_arg2 ) )
			end
		end
	end
end

function OpenRegistrationBrowser( f1307_arg0, f1307_arg1, f1307_arg2, f1307_arg3 )
	local f1307_local0 = GoBack( f1307_arg0, f1307_arg2 )
	local f1307_local1 = f1307_local0:openOverlay( "Spinner", f1307_arg2 )
	f1307_local1:registerEventHandler( "registration_success", function ( element, event )
		CoD.OverlayUtility.CreateOverlay( f1307_arg2, element, "RegistrationSuccess" )
		element:close()
	end )
	f1307_local1:registerEventHandler( "registration_failure", function ( element, event, f1309_arg2 )
		FinishRegistrationFlow( element, f1307_arg2, element )
	end )
	Engine.OpenRegistrationBrowser( f1307_arg2 )
end

function OptInToEmailMarketing( f1310_arg0, f1310_arg1, f1310_arg2, f1310_arg3 )
	local f1310_local0 = GoBack( f1310_arg0, f1310_arg2 )
	local f1310_local1 = f1310_local0:openOverlay( "Spinner", f1310_arg2 )
	f1310_local1:registerEventHandler( "optin_success", function ( element, event )
		CoD.OverlayUtility.CreateOverlay( f1310_arg2, element, "OptInSuccess" )
		element:close()
	end )
	f1310_local1:registerEventHandler( "registration_failure", function ( element, event, f1312_arg2 )
		FinishRegistrationFlow( element, f1310_arg2, element )
	end )
	Engine.OptInToEmailMarketing( f1310_arg2 )
end

function FinishRegistrationFlow( f1313_arg0, f1313_arg1, f1313_arg2 )
	if Dvar.ui_execdemo_beta:get() then
		if IsFirstTimeSetup( f1313_arg1, Enum.eModes.MODE_MULTIPLAYER ) then
			OpenMPFirstTimeFlow( f1313_arg0, nil, f1313_arg1, nil, f1313_arg2 )
		else
			local f1313_local0 = LobbyData:GetCurrentMenuTarget()
			if f1313_local0.id == LobbyData.UITargets.UI_MAIN.id then
				NavigateToLobby_FirstTimeFlowMP( f1313_arg0, nil, f1313_arg1, f1313_arg2 )
			else
				GoBackToMenu( f1313_arg2, f1313_arg1, "Lobby" )
			end
		end
	else
		if Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f1313_arg1 ), "MOTDMenu.ActionSource" ) ) == "FeaturedWidget" then
			GoBack( f1313_arg2, f1313_arg1 )
			return 
		end
		NavigateToLobby( f1313_arg0, "ModeSelect", false, f1313_arg1 )
	end
	SendClientScriptMenuChangeNotify( f1313_arg1, f1313_arg2, false )
	Close( f1313_arg0, f1313_arg1 )
end

function ChatClientInputStart( f1314_arg0, f1314_arg1, f1314_arg2, f1314_arg3 )
	if not ChatClientIsAvailable( f1314_arg0, f1314_arg1, f1314_arg2 ) then
		return 
	else
		ChatClientInputChannelSet( f1314_arg0, f1314_arg1, f1314_arg2, f1314_arg3 )
		Engine.ChatClient_InputStart( f1314_arg2 )
	end
end

function ChatClientInputChannelSet( f1315_arg0, f1315_arg1, f1315_arg2, f1315_arg3 )
	local f1315_local0 = CoD.ChatClientUtility.GetChannelFromString( f1315_arg3 )
	if f1315_local0 ~= nil then
		Engine.ChatClient_InputChannelSet( f1315_arg2, f1315_local0 )
	end
end

function ChatClientResetSubMenus( f1316_arg0, f1316_arg1, f1316_arg2 )
	CoD.ChatClientUtility.ResetSettingsMenu()
	CoD.ChatClientUtility.ResetInputChannelSelectorMenu()
end

function ChatClientInputArrangeText( f1317_arg0, f1317_arg1, f1317_arg2 )
	if f1317_arg0 and f1317_arg0.arrangeText ~= nil then
		f1317_arg0:arrangeText()
		return 
	end
	local f1317_local0 = f1317_arg0:getParent()
	if f1317_local0 and f1317_local0.arrangeText ~= nil then
		f1317_local0:arrangeText()
	end
end

function ChatClientInputTextFieldUpdatePrompt( f1318_arg0, f1318_arg1, f1318_arg2 )
	if Engine.ChatClient_IsChatting( f1318_arg2 ) then
		local f1318_local0 = Engine.ChatClient_InputChannelGet( f1318_arg2 )
		local f1318_local1 = Engine.Localize( Engine.ChatClient_ChannelStringGet( f1318_local0 ) ) .. ": "
		Engine.SetModelValue( CoD.ChatClientUtility.GetInputChannelColorModel(), Engine.ChatClient_ChannelColorGet( f1318_arg2, f1318_local0 ) )
		Engine.SetModelValue( CoD.ChatClientUtility.GetInputChannelTextModel(), f1318_local1 )
		return 
	else
		Engine.SetModelValue( CoD.ChatClientUtility.GetInputChannelTextModel(), "" )
		if Engine.IsInGame() then
			Engine.SetModelValue( CoD.ChatClientUtility.GetInputTextModel(), "" )
			Engine.SetModelValue( CoD.ChatClientUtility.GetInputChannelTextModel(), "" )
			return 
		elseif not ChatClientEnabled( f1318_arg2 ) then
			Engine.SetModelValue( CoD.ChatClientUtility.GetInputTextModel(), Engine.Localize( "PLATFORM_CHAT_DISABLED" ) )
			return 
		elseif not ChatClientIsAvailable( f1318_arg0, f1318_arg1, f1318_arg2 ) then
			Engine.SetModelValue( CoD.ChatClientUtility.GetInputTextModel(), Engine.Localize( "PLATFORM_CHAT_NOT_AVAILABLE" ) )
			return 
		else
			Engine.SetModelValue( CoD.ChatClientUtility.GetInputTextModel(), Engine.Localize( "PLATFORM_CHAT_CLICK_TO_ENTER_CHAT" ) )
		end
	end
end

function ChatClientFilterChannelSet( f1319_arg0, f1319_arg1, f1319_arg2, f1319_arg3, f1319_arg4 )
	local f1319_local0 = CoD.ChatClientUtility.GetChannelFromString( f1319_arg3 )
	local f1319_local1 = Engine.GetModelValue( f1319_arg4 )
	if f1319_local0 ~= nil and f1319_local1 ~= nil then
		Engine.ChatClient_FilterChannelSet( f1319_arg2, f1319_local0, f1319_local1 )
	end
end

function ChatClientShowTimestampsSet( f1320_arg0, f1320_arg1, f1320_arg2, f1320_arg3 )
	return Engine.ChatClient_ShowTimestampsSet( f1320_arg2, Engine.GetModelValue( f1320_arg3 ) )
end

function ChatClientShowChannelSet( f1321_arg0, f1321_arg1, f1321_arg2, f1321_arg3 )
	return Engine.ChatClient_ShowChannelSet( f1321_arg2, Engine.GetModelValue( f1321_arg3 ) )
end

function ChatClientInputChannelSelectorHide( f1322_arg0, f1322_arg1, f1322_arg2 )
	CoD.ChatClientUtility.ResetInputChannelSelectorMenu()
end

function ChatClientResetState( f1323_arg0, f1323_arg1, f1323_arg2 )
	Engine.ChatClient_ResetState( f1323_arg2 )
end

function RestrictVoiceChatForClient( f1324_arg0, f1324_arg1, f1324_arg2 )
	local f1324_local0 = CoD.SafeGetModelValue( f1324_arg1:getModel(), "xuid" )
	if f1324_local0 then
		Engine.RestrictVoiceChatForClient( Enum.LobbyType.LOBBY_TYPE_GAME, f1324_local0 )
	end
end

function AllowVoiceChatForClient( f1325_arg0, f1325_arg1, f1325_arg2 )
	local f1325_local0 = CoD.SafeGetModelValue( f1325_arg1:getModel(), "xuid" )
	if f1325_local0 then
		Engine.AllowVoiceChatForClient( Enum.LobbyType.LOBBY_TYPE_GAME, f1325_local0 )
	end
end

function ResetControlsToDefault( f1326_arg0, f1326_arg1, f1326_arg2, f1326_arg3 )
	Engine.Exec( f1326_arg2, "resetprofilecommon" )
	Engine.Exec( f1326_arg2, "updategamerprofile" )
	Engine.Exec( f1326_arg2, "storagereset stats_mp_offline" )
	CoD.OverlayUtility.AddSystemOverlay( "ResetControlsToDefault", {
		menuName = "SystemOverlay_Compact",
		title = "MENU_RESET_TO_DEFAULT_CAPS",
		description = "MENU_RESET_TO_DEFAULTS_SUCCESSFUL",
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ()
			DataSources.TestPopup_List = DataSourceHelpers.ListSetup( "ResetControlsToDefault_List", function ( f1328_arg0 )
				return {
					{
						models = {
							displayText = "Yes"
						},
						properties = {
							action = function ( f1329_arg0, f1329_arg1, f1329_arg2, f1329_arg3, f1329_arg4 )
								GoBack( f1329_arg2 )
							end
							
						}
					}
				}
			end, true, nil )
			return "ResetControlsToDefault_List"
		end
	} )
	CoD.OverlayUtility.CreateOverlay( f1326_arg2, f1326_arg3, "ResetControlsToDefault" )
end

function ChangeLanguage( f1330_arg0, f1330_arg1, f1330_arg2, f1330_arg3, f1330_arg4 )
	if f1330_arg3 == Engine.GetLanguage() then
		GoBack( f1330_arg0, f1330_arg2 )
		return 
	else
		Engine.SetLanguage( f1330_arg3 )
		CoD.OverlayUtility.AddSystemOverlay( "Restart_Popup", {
			menuName = "SystemOverlay_Compact",
			title = Engine.Localize( "MENU_NOTICE" ),
			description = Engine.Localize( "MENU_RESTART_WARNING" ),
			categoryType = CoD.OverlayUtility.OverlayTypes.Alert,
			listDatasource = function ()
				DataSources.Restart_Popup = DataSourceHelpers.ListSetup( "Restart_Popup", function ( f1332_arg0 )
					return {
						{
							models = {
								displayText = "OK"
							},
							properties = {
								action = function ( f1333_arg0, f1333_arg1, f1333_arg2, f1333_arg3, f1333_arg4 )
									Engine.RebootGame()
								end
								
							}
						}
					}
				end, true, nil )
				return "Restart_Popup"
			end
		} )
		CoD.OverlayUtility.CreateOverlay( f1330_arg2, f1330_arg4, "Restart_Popup" )
		return true
	end
end

function SetDownloadPreference( f1334_arg0, f1334_arg1 )
	Engine.ChoosePreferredDownloadOrder( f1334_arg0, f1334_arg1 )
end

function SetFirstTimeDurangoDownloadSettingDisplayed( f1335_arg0 )
	CoD.LobbyBase.DisplayedFirstTimeDurangoDownloadSetting = true
end

function ResetCampaign( f1336_arg0, f1336_arg1, f1336_arg2 )
	f1336_arg2:OpenModalDialog( f1336_arg0, f1336_arg1, "MENU_RESET_CAMPAIGN", "MENU_RESET_CAMPAIGN_WARNING", {
		"MPUI_YES",
		"MPUI_NO"
	}, function ( f1337_arg0 )
		if f1337_arg0 == 0 then
			Engine.ResetCampaign()
		end
		return true
	end )
end

function CombatRecordShowModelForItemIndex( f1338_arg0, f1338_arg1 )
	local f1338_local0 = 0
	local f1338_local1 = f1338_arg1:getModel( f1338_arg0, "itemIndex" )
	if f1338_local1 then
		f1338_local0 = Engine.GetModelValue( f1338_local1 )
	end
	Engine.SendClientScriptNotify( f1338_arg0, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f1338_arg0 ), Engine.GetLoadoutSlotForItem( f1338_local0, CoD.GetCombatRecordMode() ), Engine.GetItemRef( f1338_local0, CoD.GetCombatRecordMode() ) .. "_" .. CoD.GetCombatRecordModeAbbreviation(), "select01", "0,0,0", nil, true )
end

function CombatRecordShowModelForBubblegumBuff( f1339_arg0, f1339_arg1 )
	local f1339_local0 = 0
	local f1339_local1 = f1339_arg1:getModel( f1339_arg0, "itemIndex" )
	if f1339_local1 then
		f1339_local0 = Engine.GetModelValue( f1339_local1 )
	end
	Engine.SendClientScriptNotify( f1339_arg0, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f1339_arg0 ), Engine.GetItemGroup( f1339_local0, Enum.eModes.MODE_ZOMBIES ), "p7_" .. Engine.GetItemRef( f1339_local0, Enum.eModes.MODE_ZOMBIES ) .. "_ui", "select01" )
end

function CombatRecordShowCybercoreModelForItemIndex( f1340_arg0, f1340_arg1 )
	local f1340_local0 = 0
	local f1340_local1 = f1340_arg1:getModel( f1340_arg0, "cybercoreIndex" )
	if f1340_local1 then
		f1340_local0 = Engine.GetModelValue( f1340_local1 )
	end
	Engine.SendClientScriptNotify( f1340_arg0, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f1340_arg0 ), Engine.GetLoadoutSlotForItem( f1340_local0, CoD.GetCombatRecordMode() ), CoD.CACUtility.GetCybercoreXModel( f1340_local0, CoD.GetCombatRecordMode() ), "select01", "0,0,0", nil, true )
end

function CombatRecordShowHero( f1341_arg0, f1341_arg1 )
	local f1341_local0 = 0
	local f1341_local1 = f1341_arg1:getModel( f1341_arg0, "heroIndex" )
	if f1341_local1 then
		f1341_local0 = Engine.GetModelValue( f1341_local1 )
	end
	Engine.SendClientScriptNotify( f1341_arg0, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f1341_arg0 ), "changeHero", f1341_local0, CoD.GetCombatRecordMode() )
	if CoD.GetCombatRecordMode() == Enum.eModes.MODE_MULTIPLAYER and f1341_local0 == LuaUtils.GetBlackjackHeroIndex( CoD.GetCombatRecordMode() ) then
		local f1341_local2 = CoD.SafeGetModelValue( f1341_arg1:getModel(), "type" )
		if f1341_local2 then
			Engine.SendClientScriptNotify( f1341_arg0, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f1341_arg0 ), "changeHelmet", f1341_local2, CoD.GetCombatRecordMode(), true )
		end
	end
end

function CombatRecordUpdateCollectibles( f1342_arg0, f1342_arg1, f1342_arg2 )
	CoD.perController[f1342_arg1].inspectingMap = CoD.SafeGetModelValue( f1342_arg2:getModel(), "id" )
	f1342_arg0.Collectibles:updateDataSource()
end

function CombatRecordTabChanged( f1343_arg0, f1343_arg1, f1343_arg2 )
	if not CoD.CombatRecordPreventModeChange then
		CoD.CombatRecordMode = f1343_arg1.tabId
	end
end

function CombatRecordMedalsTabChanged( f1344_arg0, f1344_arg1, f1344_arg2 )
	CoD.CombatRecordMedalCategory = f1344_arg1.tabId
	CoD.CombatRecordMedalSortFunc = f1344_arg1.sortFunc
	if f1344_arg0.MedalsGrid then
		f1344_arg0.MedalsGrid:updateDataSource()
	end
end

function CombatRecordAccoladesChangeMap( f1345_arg0, f1345_arg1, f1345_arg2, f1345_arg3 )
	local f1345_local0 = {}
	local f1345_local1 = 0
	local f1345_local2 = 0
	local f1345_local3 = Engine.GetModel( Engine.GetModelForController( f1345_arg1 ), "CombatRecordAccolades" )
	for f1345_local7, f1345_local8 in LUI.IterateTableBySortedKeys( CoD.mapsTable, function ( f1346_arg0, f1346_arg1 )
		return CoD.mapsTable[f1346_arg0].unique_id < CoD.mapsTable[f1346_arg1].unique_id
	end, nil ) do
		if f1345_local8.session_mode == Enum.eModes.MODE_CAMPAIGN and f1345_local8.campaign_mode == 0 and f1345_local8.dlc_pack ~= -1 and f1345_local8.isSubLevel == false then
			table.insert( f1345_local0, f1345_local8.unique_id )
			if CoD.SafeGetModelValue( f1345_local3, "unique_id" ) == f1345_local8.unique_id then
				f1345_local1 = f1345_local2
			end
			f1345_local2 = f1345_local2 + 1
		end
	end
	Engine.SetModelValue( Engine.GetModel( f1345_local3, "unique_id" ), f1345_local0[(f1345_local1 + f1345_arg3) % f1345_local2 + 1] )
end

function CombatRecordOpenCallingCards( f1347_arg0, f1347_arg1, f1347_arg2, f1347_arg3 )
	local f1347_local0 = f1347_arg2:openOverlay( "CallingCards", f1347_arg1 )
	local f1347_local1 = f1347_arg3:getModel( f1347_arg1, "slotIndex" )
	if f1347_local1 then
		f1347_local0.callingCardShowcaseSlot = Engine.GetModelValue( f1347_local1 )
	end
end

function CombatRecordClearCallingCard( f1348_arg0, f1348_arg1, f1348_arg2 )
	local f1348_local0 = CoD.SafeGetModelValue( f1348_arg1:getModel(), "slotIndex" )
	if f1348_local0 then
		Engine.SetCombatRecordBackgroundId( f1348_arg2, 0, f1348_local0 )
		local f1348_local1 = Engine.GetModel( Engine.GetGlobalModel(), "CallingCardShowcaseUpdated" )
		if f1348_local1 then
			Engine.ForceNotifyModelSubscriptions( f1348_local1 )
		end
	end
end

function CombatRecordOpenProfileSnapshot( f1349_arg0, f1349_arg1 )
	CoD.perController[f1349_arg1].combatRecordProfileSnapshot = true
	OpenLocalScreenshots( f1349_arg0, f1349_arg1 )
end

function CombatRecordProfileSnapshotFullscreenView( f1350_arg0, f1350_arg1 )
	CoD.FileshareUtility.SetSelectedItem( DataSources.CombatRecordProfileSnapshot.getModel( f1350_arg1 ) )
	CoD.perController[f1350_arg1].combatRecordProfileSnapshot = true
	CoD.FileshareUtility.SetCurrentCategory( "screenshot_private" )
	OpenOverlay( f1350_arg0, "Fileshare_ScreenshotDetailsView", f1350_arg1 )
end

function CombatRecordSetProfileSnapshot( f1351_arg0 )
	local f1351_local0 = CoD.FileshareUtility.GetSelectedItemProperty( "codeIndex" )
	local f1351_local1 = CoD.FileshareUtility.GetCurrentCategory()
	local f1351_local2, f1351_local3 = CoD.FileshareUtility.GetCurrentFilter()
	local f1351_local4 = Engine.FileshareGetSlotData( f1351_arg0, f1351_local1, f1351_local2, f1351_local3, f1351_local0 )
	if f1351_local4 then
		local f1351_local5 = f1351_local4.fileId
		if not f1351_local5 then
			f1351_local5 = Engine.DefaultID64Value()
		end
		Engine.SetCombatRecordScreenshotInfo( f1351_arg0, f1351_local5, f1351_local4.fileSize or 0, f1351_local4.fileName )
		DataSources.CombatRecordProfileSnapshot.getModel( f1351_arg0 )
	end
end

function CombatRecordClearProfileSnapshot( f1352_arg0 )
	local f1352_local0 = Engine.DefaultID64Value()
	Engine.SetCombatRecordScreenshotInfo( f1352_arg0, f1352_local0, f1352_local0, "" )
	DataSources.CombatRecordProfileSnapshot.getModel( f1352_arg0 )
end

function CombatRecordProfileSnapshotDownloadScreenshot( f1353_arg0 )
	local f1353_local0 = DataSources.CombatRecordProfileSnapshot.getModel( f1353_arg0 )
	if f1353_local0 then
		local f1353_local1 = CoD.SafeGetModelValue( f1353_local0, "fileId" )
		if not f1353_local1 then
			f1353_local1 = Engine.DefaultID64Value()
		end
		if f1353_local1 ~= CoD.currentScreenshot then
			if not Engine.IsScreenshotReady( Enum.ScreenshotViewType.UI_SCREENSHOT_TYPE_SCREENSHOT, f1353_local1 ) then
				Engine.DestroyScreenshot( f1353_arg0 )
			else
				CombatRecordProfileSnapshotDestroyScreenshot( f1353_arg0 )
			end
			local f1353_local2 = CoD.SafeGetModelValue( f1353_local0, "fileSize" )
			if f1353_local1 ~= Engine.DefaultID64Value() and f1353_local2 ~= Engine.DefaultID64Value() then
				Engine.DownloadScreenshot( f1353_arg0, f1353_local1, f1353_local2 )
				CoD.currentScreenshot = f1353_local1
			end
		end
	end
end

function CombatRecordProfileSnapshotDestroyScreenshot( f1354_arg0 )
	if IsCombatRecordForRemotePlayer() or CoD.currentScreenshot then
		Engine.DestroyScreenshot( f1354_arg0 )
		CoD.currentScreenshot = nil
	end
end

function CombatRecordSetHeadingKickerTextToCombatRecordGameMode()
	local f1355_local0 = SessionModeToLocalizedSessionMode( CoD.GetCombatRecordMode() )
	local f1355_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerText" )
	if f1355_local1 then
		Engine.SetModelValue( f1355_local1, Engine.Localize( f1355_local0 ) )
	end
end

function CombatRecordSetHeadingKickerTextToCombatRecordMode()
	if CoD.GetCombatRecordMode() ~= Enum.eModes.MODE_MULTIPLAYER then
		CombatRecordSetHeadingKickerTextToCombatRecordGameMode()
		return 
	end
	local f1356_local0 = Engine.Localize( "MPUI_SUMMARY_CAPS" )
	if CoD.CombatRecordMode == "public" then
		f1356_local0 = Engine.Localize( "MENU_COMBAT_RECORD_TAB_PUBLIC_CAPS" )
	elseif CoD.CombatRecordMode == "arena" then
		f1356_local0 = Engine.Localize( "MENU_ARENA_CAPS" )
	end
	local f1356_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerText" )
	if f1356_local1 then
		Engine.SetModelValue( f1356_local1, f1356_local0 )
	end
end

function CombatRecordSetXUIDForLocalController( f1357_arg0 )
	CoD.CombatRecordXUID = Engine.GetXUID64( f1357_arg0 )
	CoD.CombatRecordOtherPlayerStats = false
end

function CombatRecordSetXUIDFromSelectedFriend( f1358_arg0 )
	local f1358_local0 = Engine.GetModel( Engine.GetModelForController( f1358_arg0 ), "Social.selectedFriendXUID" )
	if f1358_local0 then
		CoD.CombatRecordXUID = Engine.GetModelValue( f1358_local0 )
		CoD.CombatRecordMode = "public"
	end
end

function CombatRecordOpenFromPlayerDetails( f1359_arg0, f1359_arg1, f1359_arg2, f1359_arg3, f1359_arg4 )
	CombatRecordSetMenuForPostStatsLoad( f1359_arg0, "ViewRemoteCombatRecord" )
	CombatRecordSetXUIDFromSelectedFriend( f1359_arg2 )
	OpenPopup( f1359_arg0, "Social_InspectPlayerPopupLoading", f1359_arg2 )
	CombatRecordReadOtherPlayerStats( f1359_arg2 )
end

function CombatRecordSetMenuForPostStatsLoad( f1360_arg0, f1360_arg1 )
	CoD.CombatRecordPostStatsLoadMenuName = f1360_arg1
end

function CombatRecordGoBackAndOpenOverlayForPostStatsLoad( f1361_arg0, f1361_arg1 )
	GoBackAndOpenOverlayOnParent( f1361_arg0, CoD.CombatRecordPostStatsLoadMenuName, f1361_arg1 )
end

function CombatRecordReadOtherPlayerStats( f1362_arg0 )
	CoD.CombatRecordOtherPlayerStats = true
	Engine.ReadOtherPlayerStats( f1362_arg0, CoD.CombatRecordXUID, CoD.GetCombatRecordMode() )
end

function CombatRecordCompareAgainstLocalPlayer( f1363_arg0 )
	local f1363_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "OtherPlayerStats" )
	if f1363_local0 then
		local f1363_local1 = Engine.GetGamertagForController( f1363_arg0 )
		if f1363_local1 then
			local f1363_local2 = Engine.CreateModel( f1363_local0, "gamertag" )
			if f1363_local2 then
				Engine.SetModelValue( f1363_local2, f1363_local1 )
			end
		end
		local f1363_local2 = Engine.GetXUID64( f1363_arg0 )
		if f1363_local2 then
			local f1363_local3 = Engine.CreateModel( f1363_local0, "xuid" )
			if f1363_local3 then
				Engine.SetModelValue( f1363_local3, f1363_local2 )
			end
		end
	end
end

function CombatRecordSelectFriend( f1364_arg0, f1364_arg1, f1364_arg2 )
	local f1364_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "OtherPlayerStats" )
	local f1364_local1 = nil
	if f1364_local0 then
		local f1364_local2 = f1364_arg1:getModel( f1364_arg2, "identityBadge.gamertag" )
		if f1364_local2 then
			f1364_local1 = Engine.GetModelValue( f1364_local2 )
		end
	end
	if f1364_local1 then
		local f1364_local2 = Engine.CreateModel( f1364_local0, "gamertag" )
		if f1364_local2 then
			Engine.SetModelValue( f1364_local2, f1364_local1 )
		end
	end
	local f1364_local2 = nil
	local f1364_local3 = f1364_arg1:getModel( f1364_arg2, "identityBadge.xuid" )
	if f1364_local3 then
		f1364_local2 = Engine.GetModelValue( f1364_local3 )
	end
	if f1364_local2 then
		if f1364_local0 then
			local f1364_local4 = Engine.CreateModel( f1364_local0, "XUID" )
			if f1364_local4 then
				Engine.SetModelValue( f1364_local4, f1364_local2 )
			end
		end
		Engine.ReadOtherPlayerStats( f1364_arg2, f1364_local2, CoD.GetCombatRecordMode() )
	end
end

function CombatRecordSetComparing( f1365_arg0, f1365_arg1, f1365_arg2 )
	local f1365_local0 = Engine.CreateModel( Engine.GetModelForController( f1365_arg1 ), "CombatRecordComparing" )
	if f1365_local0 then
		Engine.SetModelValue( f1365_local0, f1365_arg2 )
	end
end

function CombatRecordUpdateSelfIdentityWidget( f1366_arg0, f1366_arg1 )
	if CoD.CombatRecordOtherPlayerStats == true then
		local f1366_local0 = f1366_arg0.MenuFrame
		local f1366_local1 = Engine.GetModelForController( f1366_arg1 )
		local f1366_local2 = Engine.GetModel( f1366_local1, "socialPlayerInfo" )
		local f1366_local3 = Engine.GetModel( f1366_local1, "socialPlayerInfo.identityBadge" )
		if f1366_local0 and f1366_local2 and f1366_local3 then
			if f1366_local0.SelfIdentityBadge then
				f1366_local0.SelfIdentityBadge:setModel( f1366_local3, f1366_arg1 )
			end
			if f1366_local0.SelfIdentityBadge.CallingCard.CallingCardsFrameWidget then
				f1366_local0.SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( f1366_local2, f1366_arg1 )
			end
		end
	end
end

function ShowcaseUpdateSelfIdentityWidget( f1367_arg0, f1367_arg1 )
	if CoD.ShowcaseOtherPlayerStats == true then
		local f1367_local0 = f1367_arg0.SelfIdentityBadge
		local f1367_local1 = Engine.GetModelForController( f1367_arg1 )
		local f1367_local2 = Engine.GetModel( f1367_local1, "socialPlayerInfo" )
		local f1367_local3 = Engine.GetModel( f1367_local1, "socialPlayerInfo.identityBadge" )
		if f1367_local0 and f1367_local2 and f1367_local3 then
			if f1367_local0 then
				f1367_local0:setModel( f1367_local3, f1367_arg1 )
			end
			if f1367_local0.CallingCard.CallingCardsFrameWidget then
				f1367_local0.CallingCard.CallingCardsFrameWidget:setModel( f1367_local2, f1367_arg1 )
			end
		end
	end
end

function SetNetworkMode( f1368_arg0, f1368_arg1 )
	LuaUtils.SetNetworkMode( f1368_arg0, f1368_arg1 )
end

function Mods_OpenLoadMenu( f1369_arg0, f1369_arg1, f1369_arg2, f1369_arg3, f1369_arg4 )
	if CheckNavRestrictions( f1369_arg0, f1369_arg1, f1369_arg2, f1369_arg4 ) then
		return 
	else
		OpenPopup( f1369_arg4, "MenuModsLoad", f1369_arg2 )
	end
end

function Mods_LoadMod( f1370_arg0, f1370_arg1 )
	Engine.LobbyVM_CallFunc( "LoadMod", {
		ugcName = CoD.SafeGetModelValue( f1370_arg1:getModel(), "ugcName" ),
		ugcType = LuaEnums.MODS_BASE_PATH,
		ugcVersion = 1
	} )
end

function Mods_Unload( f1371_arg0, f1371_arg1 )
	Engine.LobbyVM_CallFunc( "LoadMod", {
		ugcName = "",
		ugcType = LuaEnums.MODS_BASE_PATH,
		ugcVersion = 1
	} )
end

function Mods_RefreshListMods( f1372_arg0, f1372_arg1 )
	CoD.ModsUtility.Mods_Lists_Refresh( LuaEnums.MODS_BASE_PATH )
end

function Mods_RefreshListUsermaps( f1373_arg0, f1373_arg1 )
	CoD.ModsUtility.Mods_Lists_Refresh( LuaEnums.USERMAP_BASE_PATH )
end

function Mods_Enabled()
	return CoD.ModsUtility.ModsEnabled()
end

function StarterParckPurchase( f1375_arg0, f1375_arg1, f1375_arg2 )
	CoD.StarterPackUtil.UpgradeNotice( f1375_arg0, f1375_arg1, f1375_arg2 )
end

function StartLiveEvent( f1376_arg0, f1376_arg1 )
	Engine.Exec( f1376_arg0, "setliveevent " .. (Engine.TableLookup( nil, "gamedata/tables/common/live_event_streamers.csv", 0, f1376_arg1 or 0, 1 ) or "") )
end

function SelectLiveEventQuality( f1377_arg0 )
	SelectLiveEventQuality_Internal( f1377_arg0.qualityId )
end

function ValidateMPLootWeapons( f1378_arg0 )
	CoD.CACUtility.ValidateMPLootWeapons( f1378_arg0 )
end

function ActivateSpecialContract( f1379_arg0, f1379_arg1, f1379_arg2 )
	local f1379_local0 = f1379_arg1.contractIndex
	if not f1379_local0 then
		f1379_local0 = tonumber( Engine.GetModelValue( Engine.GetModel( f1379_arg1:getModel(), "index" ) ) )
	end
	local f1379_local1 = Engine.StorageGetBuffer( f1379_arg2, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	local f1379_local2 = f1379_local1.contracts[LuaUtils.BMContracts.specialContractIndex]
	local f1379_local3 = f1379_local1.weaponContractData
	f1379_local2.active:set( 1 )
	f1379_local2.award_given:set( 0 )
	f1379_local2.index:set( f1379_local0 )
	f1379_local2.progress:set( 0 )
	f1379_local3.currentValue:set( 0 )
	f1379_local3.matchesPlayed:set( 0 )
	f1379_local3.startTimestamp:set( 0 )
end

function ValidateBlackjackPurchase( f1380_arg0 )
	LuaUtils.ValidateBlackjackPurchaseForController( f1380_arg0 )
end

function RedeemRewardAction( f1381_arg0, f1381_arg1, f1381_arg2, f1381_arg3 )
	local f1381_local0 = {
		CoD.BlackMarketUtility.mar2018_challenge_reward_sku_tier1,
		CoD.BlackMarketUtility.mar2018_challenge_reward_sku_tier2,
		CoD.BlackMarketUtility.mar2018_challenge_reward_sku_tier3,
		CoD.BlackMarketUtility.mar2018_challenge_reward_sku_tier4
	}
	local f1381_local1 = {
		"RedeemBtn0",
		"RedeemBtn1",
		"RedeemBtn2",
		"RedeemBtn3"
	}
	local f1381_local2 = tonumber( f1381_arg3 )
	local f1381_local3 = f1381_local0[f1381_local2]
	if f1381_local3 == nil or f1381_local3 == 0 or not Engine.PurchaseDWSKU( f1381_arg1, f1381_local3 ) then
		LuaUtils.UI_ShowErrorMessageDialog( f1381_arg1, "GROUPS_GENERIC_ERROR_MSG", "" )
		return 
	elseif not f1381_arg0.ProcessingWidget then
		GoBack( f1381_arg2, f1381_arg1 )
	end
	f1381_arg0:setState( "Purchasing" )
	f1381_arg0.ProcessingWidget:playClip( "StartPurchasing" )
	f1381_arg0.ProcessingWidget.nextClip = "Purchasing"
	DisableAllMenuInput( f1381_arg2, true )
	CoD.Menu.UpdateAllButtonPrompts( f1381_arg2, f1381_arg1 )
	f1381_arg0.ProcessingWidget:registerEventHandler( "clip_over", function ( element, event )
		if Engine.IsInventoryBusy( f1381_arg1 ) or Engine.GetPurchaseDWSKUResult( f1381_arg1 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_INPROGRESS then
			LUI.UIElement.clipOver( element, event )
		else
			element:playClip( "StopPurchasing" )
			element:registerEventHandler( "clip_over", function ( element, event )
				element:registerEventHandler( "clip_over", LUI.UIElement.clipOver )
				f1381_arg0:setState( "DefaultState" )
				DisableAllMenuInput( f1381_arg2, false )
				if Engine.GetPurchaseDWSKUResult( f1381_arg1 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_SUCCESS then
					CoD.OverlayUtility.CreateOverlay( f1381_arg1, f1381_arg2, "WinterCCRedeemRewardSuccessOverlay", f1381_arg1, actionParam )
					local f1383_local0 = f1381_arg2.PromoZMHDCommunityWidget.PromoZMHDThermometerAndRewards
					MakeElementNotFocusable( f1383_local0, f1381_local1[f1381_local2], f1381_arg1 )
					HideElement( f1383_local0, f1381_local1[f1381_local2] )
					CoD.TurnOnRedeemBtnFocus()
				else
					LuaUtils.UI_ShowErrorMessageDialog( f1381_arg1, "GROUPS_GENERIC_ERROR_MSG", "" )
				end
			end )
		end
	end )
end

function RedeemLoginRewardAction( f1384_arg0, f1384_arg1, f1384_arg2 )
	local f1384_local0 = CoD.LoginRewardSKU
	if f1384_local0 == nil or f1384_local0 == 0 or not Engine.PurchaseDWSKU( f1384_arg1, f1384_local0 ) then
		CoD.OverlayUtility.ShowToast( "LootBonusCallingCard", Engine.Localize( "GROUPS_SERVICE_NOT_AVAILABLE" ), nil, nil, nil, nil, nil )
		Close( f1384_arg0, f1384_arg1 )
		NavigateToLobby( f1384_arg0, "ModeSelect", false, f1384_arg1 )
		SendClientScriptMenuChangeNotify( f1384_arg1, f1384_arg2, false )
		return 
	elseif not f1384_arg0.ProcessingWidget then
		GoBack( f1384_arg2, f1384_arg1 )
	end
	f1384_arg0:setState( "Purchasing" )
	f1384_arg0.ProcessingWidget:playClip( "StartPurchasing" )
	f1384_arg0.ProcessingWidget.nextClip = "Purchasing"
	DisableAllMenuInput( f1384_arg2, true )
	CoD.Menu.UpdateAllButtonPrompts( f1384_arg2, f1384_arg1 )
	f1384_arg0.ProcessingWidget:registerEventHandler( "clip_over", function ( element, event )
		if Engine.IsInventoryBusy( f1384_arg1 ) or Engine.GetPurchaseDWSKUResult( f1384_arg1 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_INPROGRESS then
			LUI.UIElement.clipOver( element, event )
		else
			element:playClip( "StopPurchasing" )
			element:registerEventHandler( "clip_over", function ( element, event )
				element:registerEventHandler( "clip_over", LUI.UIElement.clipOver )
				f1384_arg0:setState( "DefaultState" )
				DisableAllMenuInput( f1384_arg2, false )
				Close( f1384_arg0, f1384_arg1 )
				NavigateToLobby( f1384_arg0, "ModeSelect", false, f1384_arg1 )
				SendClientScriptMenuChangeNotify( f1384_arg1, f1384_arg2, false )
				if Engine.GetPurchaseDWSKUResult( f1384_arg1 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_SUCCESS then
					local f1386_local0 = CoD.attachmentTable
					local f1386_local1 = CoD.LoginRewardEntitlementString
					local f1386_local2 = 21
					local f1386_local3 = 6
					local f1386_local4 = 4
					local f1386_local5 = 7
					if CoD.LoginRewardCamo == true then
						CoD.OverlayUtility.ShowToast( "LootBonusCamo", Engine.Localize( Engine.TableLookup( nil, f1386_local0, f1386_local2, f1386_local1, f1386_local5 ) ), Engine.Localize( "MPUI_CAMO" ), Engine.TableLookup( nil, f1386_local0, f1386_local2, f1386_local1, f1386_local3 ), nil, nil, nil )
					else
						CoD.OverlayUtility.ShowToast( "LootBonusCallingCard", "", Engine.Localize( "MPUI_BM_BRIBE_CALLINGCARD" ), nil, nil, nil, CoD.LoginRewardToastImage )
					end
				elseif true == CodD.LoginRewardCamo then
					CoD.OverlayUtility.ShowToast( "LootBonusCamo", Engine.Localize( "GROUPS_SERVICE_NOT_AVAILABLE" ), nil, nil, nil, nil, nil )
				else
					CoD.OverlayUtility.ShowToast( "LootBonusCallingCard", Engine.Localize( "GROUPS_SERVICE_NOT_AVAILABLE" ), nil, nil, nil, nil, nil )
				end
			end )
		end
	end )
end

function CheckAndShowBonusCryptoKeys( f1387_arg0, f1387_arg1 )
	if IsModelValueGreaterThan( f1387_arg1, "CryptoKeyProgress.bonusKeysAwarded", 0 ) then
		SetElementStateByElementName( f1387_arg0, "BMDecryptionBonusKeys", f1387_arg1, "Bonus" )
	end
end

function CheckAndShowGunMeter( f1388_arg0, f1388_arg1, f1388_arg2 )
	if ShouldShowGunMeter( f1388_arg0, f1388_arg1 ) then
		f1388_arg0.BMGunMeter0:setAlpha( 1 )
	end
end

function SetFocusToSpecialistOutfit( f1389_arg0, f1389_arg1 )
	local f1389_local0 = 0
	if f1389_arg0.productList and f1389_arg0.productList.itemStencil then
		for f1389_local4, f1389_local5 in ipairs( CoD.BlackMarketUtility.UniqueSpecialistOutfits ) do
			if string.find( CoD.StoreUtility.HighlightOutfit, f1389_local5.specialist ) then
				if Dvar.store_hideOutfitPurchase:exists() and Dvar.store_hideOutfitPurchase:get() == "1" then
					f1389_local0 = f1389_local5.skuContractId
					break
				end
				f1389_local0 = f1389_local5.skuId
			end
		end
		f1389_local1 = f1389_arg0.productList:findItem( {
			skuID = tostring( f1389_local0 )
		}, nil, true, 0 )
	end
end

function OpenOutfitStore( f1390_arg0, f1390_arg1, f1390_arg2, f1390_arg3, f1390_arg4 )
	if not DisableStore() or CoD.isPC then
		CoD.StoreUtility.HighlightOutfit = ""
		local f1390_local0 = Engine.GetModelForController( f1390_arg2 )
		if f1390_local0 then
			local f1390_local1 = Engine.GetModel( f1390_local0, "HeroCustomizationOptionList" )
			if f1390_local1 then
				local f1390_local2 = Engine.GetModel( f1390_local1, "1" )
				if f1390_local2 then
					local f1390_local3 = Engine.GetModel( f1390_local2, "image" )
					if f1390_local3 then
						CoD.StoreUtility.HighlightOutfit = Engine.GetModelValue( f1390_local3 )
					end
				end
			end
		end
		local f1390_local1 = OpenOverlay( f1390_arg4, "Store_Outfits", f1390_arg2 )
		local f1390_local2 = LobbyData:GetCurrentMenuTarget()
		LUI.CoDMetrics.StoreEntry( f1390_arg4, f1390_arg2, f1390_arg3, f1390_local2 )
		local f1390_local4 = Engine.CreateModel( Engine.GetModelForController( f1390_arg2 ), "StoreRoot" )
		Engine.SetModelValue( Engine.CreateModel( f1390_local4, "actionSource", true ), f1390_arg3 )
		Engine.SetModelValue( Engine.CreateModel( f1390_local4, "storeSource", true ), f1390_local2.name )
		if CoD.StoreUtility.HighlightOutfit ~= "" then
			SetFocusToSpecialistOutfit( f1390_local1.StoreNonFeaturedFrame, f1390_arg2 )
		end
	end
end

function OnPrivacySettingItemFocusChange( f1391_arg0, f1391_arg1, f1391_arg2 )
	local f1391_local0 = DataSources.PrivacySettingManagementForm.getModel( f1391_arg0 )
	if f1391_arg1.descTextList then
		f1391_arg2._currentPrivacySettingDescTextList = f1391_arg1.descTextList
		Engine.SetModelValue( Engine.GetModel( f1391_local0, "descText" ), f1391_arg1.descTextList[1] or "" )
		Engine.SetModelValue( Engine.GetModel( f1391_local0, "currentPage" ), 1 )
		Engine.SetModelValue( Engine.GetModel( f1391_local0, "lastPage" ), #f1391_arg1.descTextList )
	else
		f1391_arg2._currentPrivacySettingDescTextList = {}
		Engine.SetModelValue( Engine.GetModel( f1391_local0, "descText" ), "" )
		Engine.SetModelValue( Engine.GetModel( f1391_local0, "currentPage" ), 1 )
		Engine.SetModelValue( Engine.GetModel( f1391_local0, "lastPage" ), 1 )
	end
end

function ChangePrivacySettingDescPage( f1392_arg0, f1392_arg1, f1392_arg2 )
	local f1392_local0 = DataSources.PrivacySettingManagementForm.getModel( f1392_arg0 )
	local f1392_local1 = Engine.GetModel( f1392_local0, "currentPage" )
	local f1392_local2 = Engine.GetModelValue( f1392_local1 ) + (tonumber( f1392_arg2 ) or 0)
	if f1392_arg1._currentPrivacySettingDescTextList and f1392_arg1._currentPrivacySettingDescTextList[f1392_local2] then
		Engine.SetModelValue( Engine.GetModel( f1392_local0, "descText" ), f1392_arg1._currentPrivacySettingDescTextList[f1392_local2] )
		Engine.SetModelValue( f1392_local1, f1392_local2 )
	end
end

