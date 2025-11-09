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

function OpenGameSettingsOptionsMenu( f55_arg0, f55_arg1, f55_arg2, f55_arg3 )
	CoD.perController[f55_arg2].selectedGameSettingElement = f55_arg1
	f55_arg3:saveState()
	OpenPopup( f55_arg3, "GameSettings_OptionsMenu", f55_arg2 )
end

function ResetGameSettings()
	Engine.SetGametype( Engine.DvarString( nil, "ui_gametype" ) )
	Engine.SetDvar( "bot_maxFree", 0 )
	Engine.SetDvar( "bot_maxAllies", 0 )
	Engine.SetDvar( "bot_maxAxis", 0 )
	Engine.SetDvar( "bot_difficulty", 1 )
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings.Update" ) )
end

function ResetSelectedGameSetting( f57_arg0, f57_arg1, f57_arg2, f57_arg3 )
	local f57_local0 = CoD.perController[f57_arg2].selectedGameSettingElement
	if f57_local0 and f57_local0.revert then
		f57_local0:revert()
	end
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings.Update" ) )
end

function GameSettingsMenuClosed( f58_arg0, f58_arg1 )
	if CoD.perController[f58_arg1].editingPresetClass then
		Engine.StopEditingPresetClass()
		CoD.perController[f58_arg1].isPreset = nil
	end
end

function ButtonListFocused( f59_arg0, f59_arg1, f59_arg2 )
	if f59_arg1.isClassButton then
		local f59_local0 = CoD.perController[f59_arg2]
		f59_local0.classNum = f59_arg1.actionParam
		f59_local0.isPreset = true
		f59_local0.weaponSlot = nil
		f59_local0.grenadeSlot = nil
		f59_local0.perkCategory = nil
		f59_local0.slotIndex = nil
	end
end

function GameSettingsButtonGainFocus( f60_arg0, f60_arg1, f60_arg2 )
	UpdateInfoModels( f60_arg1 )
end

function OpenGameSettings_GameMode( f61_arg0, f61_arg1, f61_arg2, f61_arg3, f61_arg4 )
	f61_arg4:saveState()
	OpenOverlay( f61_arg4, "GameSettings_EditModeSpecificOptions", f61_arg2 )
end

function OpenGameSettings_General( f62_arg0, f62_arg1, f62_arg2, f62_arg3, f62_arg4 )
	f62_arg4:saveState()
	OpenOverlay( f62_arg4, "GameSettings_GeneralSettings", f62_arg2 )
end

function OpenGameSettings_Spawn( f63_arg0, f63_arg1, f63_arg2, f63_arg3, f63_arg4 )
	f63_arg4:saveState()
	OpenOverlay( f63_arg4, "GameSettings_SpawnSettings", f63_arg2 )
end

function OpenGameSettings_HealthAndDamage( f64_arg0, f64_arg1, f64_arg2, f64_arg3, f64_arg4 )
	f64_arg4:saveState()
	OpenOverlay( f64_arg4, "GameSettings_HealthAndDamageSettings", f64_arg2 )
end

function OpenGameSettings_Competitive( f65_arg0, f65_arg1, f65_arg2, f65_arg3, f65_arg4 )
	f65_arg4:saveState()
	OpenOverlay( f65_arg4, "GameSettings_Competitive", f65_arg2 )
end

function OpenGameSettings_CreateAClass( f66_arg0, f66_arg1, f66_arg2, f66_arg3, f66_arg4 )
	f66_arg4:saveState()
	OpenOverlay( f66_arg4, "GameSettings_CreateAClassSettings", f66_arg2 )
end

function PlaySoundSetSound( f67_arg0, f67_arg1 )
	f67_arg0:playSound( f67_arg1 )
end

function PlayMenuMusic( f68_arg0 )
	CoD.PlayFrontendMusic( f68_arg0 )
end

function PlayMenuMusicForCurrentLobby()
	CoD.PlayFrontendMusic()
end

function PlaySoundAlias( f70_arg0 )
	Engine.PlaySound( f70_arg0 )
end

function StopSoundAlias( f71_arg0 )
	Engine.StopSound( f71_arg0 )
end

function PlayMenuTrackedSound( f72_arg0, f72_arg1 )
	StopMenuTrackedSound( f72_arg0 )
	f72_arg0.trackedSound = f72_arg1
	Engine.PlaySound( f72_arg0.trackedSound )
end

function StopMenuTrackedSound( f73_arg0 )
	if f73_arg0.trackedSound then
		Engine.StopSound( f73_arg0.trackedSound )
		f73_arg0.trackedSound = nil
	end
end

function StopSoundFromElementModel( f74_arg0, f74_arg1, f74_arg2 )
	local f74_local0 = CoD.SafeGetModelValue( f74_arg1:getModel(), f74_arg2 )
	if f74_local0 and f74_local0 ~= "" then
		Engine.StopSound( f74_local0 )
	end
end

function PlayMPMusicPreview( f75_arg0, f75_arg1 )
	local f75_local0 = CoD.SafeGetModelValue( f75_arg1:getModel(), "alias" )
	if f75_local0 and f75_local0 ~= "" then
		if f75_arg1.soundTimer then
			Engine.StopSound( f75_local0 )
		end
		CoD.StopFrontendMusic()
		Engine.PlaySound( f75_local0 )
		if not f75_arg1.soundTimer then
			f75_arg1.soundTimer = LUI.UITimer.newElementTimer( Engine.GetSoundPlaybackTime( f75_local0 ), true, function ()
				StopMPMusicPreview( f75_arg0, f75_arg1 )
			end )
			f75_arg1:addElement( f75_arg1.soundTimer )
		else
			f75_arg1.soundTimer:reset()
		end
	end
end

function StopMPMusicPreview( f77_arg0, f77_arg1 )
	local f77_local0 = CoD.SafeGetModelValue( f77_arg1:getModel(), "alias" )
	if f77_local0 and f77_local0 ~= "" and f77_arg1.soundTimer then
		Engine.StopSound( f77_local0 )
		CoD.ResetFrontendMusic()
		f77_arg1.soundTimer:close()
		f77_arg1.soundTimer = nil
	end
end

function StopFrontendMusicForMusicTracks()
	CoD.StopFrontendMusic()
	CoD.musicTracks.queue = {}
end

function ResumeFrontendMusicForMusicTracks( f79_arg0 )
	CoD.ResetFrontendMusic( true )
end

function PlayMusicTrackPreview( f80_arg0, f80_arg1 )
	local f80_local0 = CoD.SafeGetModelValue( f80_arg0:getModel(), "alias" )
	if f80_local0 then
		CoD.StopFrontendMusic()
		CoD.AddMusicTrack( f80_local0, false )
		CoD.NextMenuTrack( true )
	end
end

function UpdateMusicTrackGlobalSetting( f81_arg0 )
	DataSources.MusicTracksBase.updateSettingDescModel( f81_arg0 )
end

function ToggleMusicTrackSelected( f82_arg0, f82_arg1, f82_arg2 )
	local f82_local0 = Engine.StorageGetBuffer( f82_arg0, Enum.StorageFileType.STORAGE_COMMON_SETTINGS )
	local f82_local1 = Engine.GetModel( f82_arg1:getModel(), "trackIndex" )
	local f82_local2
	if f82_local1 then
		f82_local2 = Engine.GetModelValue( f82_local1 )
		if not f82_local2 then
		
		else
			local f82_local3 = Engine.GetModel( f82_arg1:getModel(), "selected" )
			if f82_local0 and f82_local2 and f82_local3 then
				local f82_local4 = not Engine.GetModelValue( f82_local3 )
				local f82_local5 = f82_local0.snd_playMPFrontendMusicTrack[f82_local2]
				local f82_local6 = f82_local5
				f82_local5 = f82_local5.set
				local f82_local7
				if f82_local4 then
					f82_local7 = 1
					if not f82_local7 then
					
					else
						f82_local5( f82_local6, f82_local7 )
						DataSources.MusicTracksBase.updateTotalSelected( f82_arg0, f82_local4 )
						DataSources.MusicTracksBase.updateFilterTotalSelected( f82_arg0, f82_local4 )
						Engine.SetModelValue( f82_local3, f82_local4 )
					end
				end
				f82_local7 = 0
			end
		end
	end
	f82_local2 = nil
end

function SelectAllMusicTracksInFilter( f83_arg0, f83_arg1 )
	local f83_local0 = f83_arg0.ButtonList
	local f83_local1 = Engine.StorageGetBuffer( f83_arg1, Enum.StorageFileType.STORAGE_COMMON_SETTINGS )
	if f83_local0 and f83_local1 then
		local f83_local2 = f83_local0[DataSources.MusicPlayerTracks.trackListDataSourceName]
		if f83_local2 then
			for f83_local6, f83_local7 in ipairs( f83_local2 ) do
				local f83_local8 = CoD.SafeGetModelValue( f83_local7.model, "trackIndex" )
				if f83_local8 and not CoD.SafeGetModelValue( f83_local7.model, "selected" ) then
					f83_local1.snd_playMPFrontendMusicTrack[f83_local8]:set( 1 )
					DataSources.MusicTracksBase.updateTotalSelected( f83_arg1, true )
					DataSources.MusicTracksBase.updateFilterTotalSelected( f83_arg1, true )
					Engine.SetModelValue( Engine.GetModel( f83_local7.model, "selected" ), true )
				end
			end
		end
	end
end

function DeselectAllMusicTracksInFilter( f84_arg0, f84_arg1, f84_arg2 )
	local f84_local0 = f84_arg0.ButtonList
	local f84_local1 = Engine.StorageGetBuffer( f84_arg1, Enum.StorageFileType.STORAGE_COMMON_SETTINGS )
	if f84_local0 and f84_local1 then
		local f84_local2 = Engine.GetModelValue( DataSources.MusicTracksBase.getCurrentFilterTotalSelectedModel( f84_arg1 ) )
		local f84_local3 = Engine.GetModelValue( DataSources.MusicTracksBase.getTotalSelectedModel( f84_arg1 ) )
		local f84_local4 = f84_local0[DataSources.MusicPlayerTracks.trackListDataSourceName]
		if f84_local4 then
			for f84_local8, f84_local9 in ipairs( f84_local4 ) do
				local f84_local10 = CoD.SafeGetModelValue( f84_local9.model, "trackIndex" )
				if f84_local10 and CoD.SafeGetModelValue( f84_local9.model, "selected" ) then
					f84_local1.snd_playMPFrontendMusicTrack[f84_local10]:set( 0 )
					DataSources.MusicTracksBase.updateTotalSelected( f84_arg1, false )
					DataSources.MusicTracksBase.updateFilterTotalSelected( f84_arg1, false )
					Engine.SetModelValue( Engine.GetModel( f84_local9.model, "selected" ), false )
				end
			end
		end
	end
end

function UpdateMusicTrackFilters( f85_arg0, f85_arg1, f85_arg2, f85_arg3, f85_arg4 )
	local f85_local0 = f85_arg1.filter
	if f85_local0 then
		local f85_local1 = DataSources.MusicTracksBase.getCurrentFilterModel( f85_arg2 )
		if f85_local1 then
			Engine.SetModelValue( f85_local1, f85_local0 )
		end
	end
end

function UpdateModel( f86_arg0, f86_arg1, f86_arg2 )
	f86_arg0:setModel( f86_arg1:getModel() )
end

function UpdateElementModelToFocusedElementModel( f87_arg0, f87_arg1, f87_arg2, f87_arg3 )
	if f87_arg0[f87_arg2] then
		local f87_local0 = f87_arg0
		for f87_local4, f87_local5 in pairs( f87_arg3.idStack ) do
			if f87_local5 ~= f87_arg0.id then
				f87_local0 = f87_local0[f87_local5]
			end
		end
		if f87_local0 and f87_local0.id == f87_arg3.id then
			f87_arg0[f87_arg2]:setModel( f87_local0:getModel() )
		end
	end
end

function SetElementModelToFocusedElementModel( f88_arg0, f88_arg1, f88_arg2 )
	local f88_local0 = f88_arg1:getModel()
	if f88_arg0[f88_arg2] and f88_local0 then
		f88_arg0[f88_arg2]:setModel( f88_local0 )
	end
end

function SetSelfModelValue( f89_arg0, f89_arg1, f89_arg2, f89_arg3, f89_arg4 )
	local f89_local0 = f89_arg1:getModel( f89_arg2, f89_arg3 )
	if f89_local0 ~= nil then
		Engine.SetModelValue( f89_local0, f89_arg4 )
	end
end

function ToggleSelfModelValueNumber( f90_arg0, f90_arg1, f90_arg2, f90_arg3 )
	local f90_local0 = f90_arg1:getModel( f90_arg2, f90_arg3 )
	if f90_local0 ~= nil then
		Engine.SetModelValue( f90_local0, 1 - Engine.GetModelValue( f90_local0 ) )
	end
end

function ToggleSelfModelBoolean( f91_arg0, f91_arg1, f91_arg2, f91_arg3 )
	local f91_local0 = f91_arg1:getModel( f91_arg2, f91_arg3 )
	if f91_local0 ~= nil then
		Engine.SetModelValue( f91_local0, not Engine.GetModelValue( f91_local0 ) )
	end
end

function ForceNotifyGlobalModel( f92_arg0, f92_arg1 )
	Engine.ForceNotifyModelSubscriptions( Engine.GetModel( Engine.GetGlobalModel(), f92_arg1 ) )
end

function ForceNotifyControllerModel( f93_arg0, f93_arg1 )
	local f93_local0 = Engine.GetModel( Engine.GetModelForController( f93_arg0 ), f93_arg1 )
	if f93_local0 then
		Engine.ForceNotifyModelSubscriptions( f93_local0 )
	end
end

function ShowKeyboard( f94_arg0, f94_arg1, f94_arg2, f94_arg3 )
	Engine.Exec( f94_arg2, "ui_keyboard_new " .. Enum.KeyboardType[f94_arg3] )
end

function RunClientDemo( f95_arg0, f95_arg1, f95_arg2 )
	local f95_local0 = f95_arg1.gridInfoTable.zeroBasedIndex + 1
	Engine.Exec( f95_arg2, "cl_demo_play " .. Engine.GetModelValue( f95_arg1:getModel( f95_arg2, "fileName" ) ) )
end

function StartGame( f96_arg0, f96_arg1 )
	if Engine.GetGametypeSetting( "teamAssignment" ) == LuaEnums.TEAM_ASSIGNMENT.AUTO then
		Engine.PartyHostReassignTeams()
	end
	Engine.PartyHostToggleStart()
end

function SetPrimary( f97_arg0, f97_arg1 )
	Engine.ExecNow( f97_arg1, "setclientbeingusedandprimary" )
end

function RefreshLobbyGameClient( f98_arg0, f98_arg1 )
	local f98_local0 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.gameClient.update" )
	local f98_local1
	if Engine.GetModelValue( f98_local0 ) == 0 then
		f98_local1 = 1
	else
		f98_local1 = 0
	end
	Engine.SetModelValue( f98_local0, f98_local1 )
end

function ShowHeaderIconOnly( f99_arg0 )
	f99_arg0.showHeaderKicker = false
	f99_arg0.showHeaderIcon = true
end

function ShowHeaderKickerAndIcon( f100_arg0 )
	f100_arg0.showHeaderKicker = true
	f100_arg0.showHeaderIcon = true
end

function ShowHeaderGroupHQ( f101_arg0 )
	f101_arg0.showHeaderKicker = true
	f101_arg0.showHeaderIcon = true
	f101_arg0.showHeaderEmblem = true
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
	local f104_local0 = Engine.CurrentSessionMode()
	if CoD.isFrontend then
		f104_local0 = Enum.eModes.MODE_MULTIPLAYER
	end
	local f104_local1 = CoD.GetCustomization( f104_arg0, "weapon_index" )
	local f104_local2 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerText" )
	if f104_local2 and f104_local1 ~= CoD.CACUtility.EmptyItemIndex then
		local f104_local3 = Engine.ToUpper( Engine.Localize( Engine.GetItemName( f104_local1, f104_local0 ) ) )
		if f104_local2 and f104_local3 then
			Engine.SetModelValue( f104_local2, f104_local3 )
		end
	end
end

function ForceLobbyButtonUpdate( f105_arg0 )
	LuaUtils.ForceLobbyButtonUpdate()
end

function SetButtonRecentlySelected( f106_arg0, f106_arg1, f106_arg2 )
	if f106_arg1 ~= nil and f106_arg1.id ~= nil then
		CoD.LobbyMenus.UpdateHistory( f106_arg2, f106_arg1.id )
	end
end

function OpenChangeRankedSettingsPopup( f107_arg0, f107_arg1, f107_arg2, f107_arg3, f107_arg4 )
	CoD.OverlayUtility.AddSystemOverlay( "ChangeRankedSettingsPopup", {
		menuName = "SystemOverlay_Compact",
		title = "MENU_CHANGE_RANKED_SETTINGS_CAPS",
		description = "MENU_CHANGE_RANKED_SETTINGS_DESC",
		listDatasource = function ()
			DataSources.ChangeRankedSettingssPopup_List = DataSourceHelpers.ListSetup( "ChangeRankedSettingssPopup_List", function ( f109_arg0 )
				local f109_local0 = {}
				local f109_local1 = {
					models = {
						displayText = "MENU_NON_RANKED_GAME_CAPS"
					}
				}
				local f109_local2 = {
					action = function ( f110_arg0, f110_arg1, f110_arg2, f110_arg3, f110_arg4 )
						if Dvar.zm_private_rankedmatch:exists() then
							Dvar.zm_private_rankedmatch:set( false )
							Engine.SetProfileVar( f110_arg2, "com_privategame_ranked_zm", 0 )
							Engine.Exec( f110_arg2, "updategamerprofile" )
						end
						GoBack( f110_arg4, f110_arg2 )
					end
				}
				local f109_local3 = Dvar.zm_private_rankedmatch:exists()
				if f109_local3 then
					f109_local3 = Dvar.zm_private_rankedmatch:get() == false
				end
				f109_local2.selectIndex = f109_local3
				f109_local1.properties = f109_local2
				f109_local2 = {
					models = {
						displayText = "MENU_RANKED_GAME_CAPS"
					}
				}
				f109_local3 = {
					action = function ( f111_arg0, f111_arg1, f111_arg2, f111_arg3, f111_arg4 )
						if Dvar.zm_private_rankedmatch:exists() then
							Dvar.zm_private_rankedmatch:set( true )
							Engine.SetProfileVar( f111_arg2, "com_privategame_ranked_zm", 1 )
							Engine.Exec( f111_arg2, "updategamerprofile" )
						end
						GoBack( f111_arg4, f111_arg2 )
					end
				}
				local f109_local4 = Dvar.zm_private_rankedmatch:exists()
				if f109_local4 then
					f109_local4 = Dvar.zm_private_rankedmatch:get() == true
				end
				f109_local3.selectIndex = f109_local4
				f109_local2.properties = f109_local3
				f109_local0[1] = f109_local1
				f109_local0[2] = f109_local2
				return f109_local0
			end, true, nil )
			return "ChangeRankedSettingssPopup_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage
	} )
	CoD.OverlayUtility.CreateOverlay( f107_arg2, f107_arg0, "ChangeRankedSettingsPopup" )
end

function UpdateQuickJoinFocus( f112_arg0, f112_arg1 )
	if f112_arg0.currentState == "ShowQuickJoin" then
		f112_arg0.friendsAndGroups:makeFocusableWithoutResettingNavigation()
	else
		f112_arg0.friendsAndGroups:makeNotFocusable()
	end
end

function SetPlayerReady( f113_arg0, f113_arg1, f113_arg2 )
	local f113_local0 = false
	if Engine.GetReadyUp then
		f113_local0 = Engine.GetReadyUp( f113_arg2 )
	end
	Engine.SetReadyUp( f113_arg2, not f113_local0 )
end

function RefreshServerList( f114_arg0, f114_arg1 )
	Engine.LobbyServerRefreshLocalServers( f114_arg1 )
end

function JoinSystemLinkServer( f115_arg0, f115_arg1, f115_arg2 )
	if not f115_arg1.gridInfoTable then
		return 
	end
	local f115_local0 = f115_arg1.gridInfoTable.zeroBasedIndex
	local f115_local1 = Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "serverListRoot" ), "server" .. tostring( f115_local0 ) ), "sessionMode" ) )
	local f115_local2 = nil
	if f115_local1 == Enum.eModes.MODE_CAMPAIGN then
		f115_local2 = LobbyData.UITargets.UI_CPLOBBYLANGAME.maxLocalClientsNetwork
	elseif f115_local1 == Enum.eModes.MODE_MULTIPLAYER then
		f115_local2 = LobbyData.UITargets.UI_MPLOBBYLANGAME.maxLocalClientsNetwork
	elseif f115_local1 == Enum.eModes.MODE_ZOMBIES then
		f115_local2 = LobbyData.UITargets.UI_ZMLOBBYLANGAME.maxLocalClientsNetwork
	end
	if f115_local2 == nil then
		f115_local2 = 1
	end
	local f115_local3 = function ( f116_arg0 )
		if f116_arg0 then
			Engine.LobbyServerListJoinServer( f116_arg0.controller, f116_arg0.index )
		end
	end
	
	if f115_local2 < Engine.GetUsedControllerCount() then
		CoD.OverlayUtility.CreateOverlay( f115_arg2, f115_arg0, "LobbyLocalClientWarning", {
			controller = f115_arg2,
			navToMenu = nil,
			popupName = nil,
			openFromMenu = nil,
			actionFunc = f115_local3,
			index = f115_local0
		} )
		return 
	end
	f115_local3( {
		controller = f115_arg2,
		index = f115_local0
	} )
end

function LobbyLANServerPlayerListRefresh( f117_arg0, f117_arg1, f117_arg2 )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "serverPlayerListRoot" ), "selectedServer" ), f117_arg1.gridInfoTable.zeroBasedIndex )
	if f117_arg0.LANServerBrowserDetails and f117_arg0.LANServerBrowserDetails.PlayerList then
		f117_arg0.LANServerBrowserDetails.PlayerList:updateDataSource()
	end
end

function UploadStats( f118_arg0, f118_arg1 )
	Engine.Exec( f118_arg1, "uploadstats" )
	Engine.Exec( f118_arg1, "savegamerprofilestats" )
end

function SaveLoadout( f119_arg0, f119_arg1 )
	local f119_local0 = CoD.CCUtility.customizationMode
	if not f119_local0 then
		f119_local0 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	end
	Engine.Exec( f119_arg1, "saveLoadout " .. f119_local0 )
end

function CustomGameSettingsMenuClosed( f120_arg0, f120_arg1 )
	Engine.LobbyVM_CallFunc( "OnGametypeSettingsChange", {
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyModule = Enum.LobbyModule.LOBBY_MODULE_HOST
	} )
	Engine.LobbyHostSessionSetDirty( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionDirty.SESSION_DIRTY_STATE )
end

function OpenCACItemBansRestrictionsFlyout( f121_arg0, f121_arg1, f121_arg2 )
	SetGlobalModelValueTrue( "lobbyRoot.ShowCACItemBansRestrictionFlyout" )
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.ShowCACItemBansRestrictionFlyout" ) )
end

function AdjustGameSettingsTab( f122_arg0, f122_arg1, f122_arg2, f122_arg3 )
	local f122_local0 = Engine.GetModel( Engine.GetModelForController( f122_arg2 ), "GametypeSettings" )
	local f122_local1 = Engine.CreateModel( f122_local0, "selectedTab" )
	local f122_local2 = Engine.GetModelValue( f122_local1 )
	local f122_local3 = Engine.GetModelValue( Engine.CreateModel( f122_local0, "tabCount" ) )
	local f122_local4 = f122_local2 + tonumber( f122_arg3 )
	if f122_local3 < f122_local4 then
		f122_local4 = 1
	end
	if f122_local4 < 1 then
		f122_local4 = f122_local3
	end
	Engine.SetModelValue( f122_local1, f122_local4 )
end

function AdjustCompetitiveItemSettingsFilter( f123_arg0, f123_arg1, f123_arg2, f123_arg3 )
	local f123_local0 = Engine.GetModel( Engine.GetModelForController( f123_arg2 ), "GametypeSettings" )
	local f123_local1 = Engine.CreateModel( f123_local0, "selectedItemSettingGroup" )
	local f123_local2 = Engine.GetModelValue( f123_local1 )
	local f123_local3 = Engine.GetModelValue( Engine.CreateModel( f123_local0, "selectedItemSettingGroupCount" ) )
	local f123_local4 = f123_local2 + tonumber( f123_arg3 )
	if f123_local3 < f123_local4 then
		f123_local4 = 1
	end
	if f123_local4 < 1 then
		f123_local4 = f123_local3
	end
	Engine.SetModelValue( f123_local1, f123_local4 )
end

function ToggleCompetitiveAttachmentSettingsTab( f124_arg0, f124_arg1, f124_arg2 )
	local f124_local0 = Engine.CreateModel( Engine.GetModel( Engine.GetModelForController( f124_arg2 ), "GametypeSettings" ), "selectedAttachmentTab" )
	local f124_local1 = Engine.GetModelValue( f124_local0 )
	local f124_local2 = 1
	if f124_local1 == 1 then
		f124_local2 = 2
	end
	Engine.SetModelValue( f124_local0, f124_local2 )
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

function SetPregameEditIncomplete( f129_arg0 )
	Engine.SendPregameEditComplete( f129_arg0, false )
end

function AdjustPregameVoteFilter( f130_arg0, f130_arg1, f130_arg2, f130_arg3 )
	local f130_local0 = Engine.CreateModel( Engine.GetModel( Engine.GetModelForController( f130_arg2 ), "Pregame" ), "voteFilter" )
	local f130_local1 = Engine.GetModelValue( f130_local0 ) + tonumber( f130_arg3 )
	if f130_local1 > #CoD.CACUtility.PregameLoadoutFilters then
		f130_local1 = 1
	end
	if f130_local1 < 1 then
		f130_local1 = #CoD.CACUtility.PregameLoadoutFilters
	end
	Engine.SetModelValue( f130_local0, f130_local1 )
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

function ShowPregameVoteOptions( f133_arg0, f133_arg1, f133_arg2 )
	CoD.OverlayUtility.AddSystemOverlay( "PregameVoteOptions", {
		menuName = "FeatureOverlay",
		frameWidget = "CoD.Pregame_ItemVote_BanProtectPopup",
		title = "MENU_BAN_PROTECT_CAPS",
		description = function ( f134_arg0, f134_arg1 )
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f134_arg0 ), "Pregame.selectedItemName" ), Engine.GetModelValue( f134_arg1:getModel( f134_arg0, "name" ) ) )
			local f134_local0 = f133_arg1:getModel( f134_arg0, "loadoutSlot" )
			return "MENU_BAN_PROTECT_DESC"
		end,
		image = function ( f135_arg0, f135_arg1 )
			local f135_local0 = f135_arg1:getModel( f135_arg0, "image" )
			if f135_local0 then
				return Engine.GetModelValue( f135_local0 )
			else
				return ""
			end
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Unlock,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		state = function ( f136_arg0, f136_arg1 )
			if ItemIsBanned( nil, f136_arg1, f136_arg0 ) == true then
				Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f136_arg0 ), "Pregame.itemVotedBy" ), CoD.CACUtility.GetItemVotedBy( CoD.CACUtility.GetItemInfoFromElementModel( f136_arg0, f133_arg1:getModel() ) ) )
				return Enum.VoteType.VOTE_TYPE_BAN
			elseif ItemIsProtected( nil, f136_arg1, f136_arg0 ) == true then
				Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f136_arg0 ), "Pregame.itemVotedBy" ), CoD.CACUtility.GetItemVotedBy( CoD.CACUtility.GetItemInfoFromElementModel( f136_arg0, f133_arg1:getModel() ) ) )
				return Enum.VoteType.VOTE_TYPE_PROTECT
			else
				return Enum.VoteType.VOTE_TYPE_INVALID
			end
		end,
		listDatasource = function ( f137_arg0, f137_arg1 )
			DataSources.PregameVoteButtons = DataSourceHelpers.ListSetup( "PregameVoteButtons", function ( f138_arg0 )
				local f138_local0 = false
				if ItemIsBanned( nil, f137_arg1, f138_arg0 ) then
					f138_local0 = true
				end
				if f138_local0 == false and ItemIsProtected( nil, f137_arg1, f138_arg0 ) then
					f138_local0 = true
				end
				return {
					{
						models = {
							displayText = "MENU_BAN_CAPS",
							disabled = f138_local0
						},
						properties = {
							action = function ( f139_arg0, f139_arg1, f139_arg2, f139_arg3, f139_arg4 )
								SendItemVote( f139_arg0, f137_arg1, f139_arg2, Enum.VoteType.VOTE_TYPE_BAN )
							end
							
						}
					},
					{
						models = {
							displayText = "",
							image = "uie_img_t7_menu_doublearrow",
							disabled = f138_local0
						},
						properties = {
							selectIndex = true
						}
					},
					{
						models = {
							displayText = "MENU_PROTECT_CAPS",
							disabled = f138_local0 or ItemIsInRestrictionState( nil, f137_arg1, f138_arg0, Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_BANONLY )
						},
						properties = {
							action = function ( f140_arg0, f140_arg1, f140_arg2, f140_arg3, f140_arg4 )
								SendItemVote( f140_arg0, f137_arg1, f140_arg2, Enum.VoteType.VOTE_TYPE_PROTECT )
							end
							
						}
					}
				}
			end, nil, nil, function ( f141_arg0, f141_arg1, f141_arg2 )
				local f141_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" )
				if f141_arg1.pregameUpdateSubscription then
					f141_arg1:removeSubscription( f141_arg1.pregameUpdateSubscription )
				end
				f141_arg1.pregameUpdateSubscription = f141_arg1:subscribeToModel( f141_local0, function ()
					f141_arg1:updateDataSource( false, false )
				end, false )
			end )
			return "PregameVoteButtons"
		end
	} )
	local f133_local0 = CoD.OverlayUtility.CreateOverlay( f133_arg2, f133_arg0, "PregameVoteOptions", f133_arg2, f133_arg1 )
	f133_local0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.Pregame.Update" ), function ()
		f133_local0:refreshData( f133_arg2, f133_arg1 )
	end, false )
end

function ConfirmPregameVotePass( f144_arg0, f144_arg1, f144_arg2 )
	CoD.OverlayUtility.AddSystemOverlay( "PregamePassConfirm", {
		menuName = "SystemOverlay_Compact",
		title = "MENU_VOTE_FOREFIT_CAPS",
		description = "MENU_VOTE_FOREFIT_DESC",
		image = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.Alert,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		listDatasource = function ()
			DataSources.PregamePassConfirmButtons = DataSourceHelpers.ListSetup( "PregamePassConfirmButtons", function ( f146_arg0 )
				return {
					{
						models = {
							displayText = "MENU_VOTE_FORFEIT_CANCEL_CAPS"
						},
						properties = {
							action = function ( f147_arg0, f147_arg1, f147_arg2, f147_arg3, f147_arg4 )
								GoBack( f147_arg0, f147_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = "MENU_VOTE_FORFEIT_CONFIRM_CAPS"
						},
						properties = {
							action = function ( f148_arg0, f148_arg1, f148_arg2, f148_arg3, f148_arg4 )
								Engine.SendItemVote( f148_arg2, 0, Enum.VoteType.VOTE_TYPE_INVALID )
								GoBack( f148_arg4, f148_arg2 )
							end
							
						}
					}
				}
			end, true, nil )
			return "PregamePassConfirmButtons"
		end
	} )
	CoD.OverlayUtility.CreateOverlay( f144_arg2, f144_arg0, "PregamePassConfirm" )
end

function ShowCACContentWarning( f149_arg0, f149_arg1, f149_arg2 )
	CoD.OverlayUtility.AddSystemOverlay( "PregameCACWarning", {
		menuName = "SystemOverlay_Pregame",
		openMethod = CoD.OverlayUtility.OpenMethods.Overlay,
		categoryType = function ( f150_arg0 )
			return CoD.OverlayUtility.OverlayTypes.GenericMessage
		end,
		frameWidget = "CoD.Pregame_RestrictedContentWarning"
	} )
	CoD.OverlayUtility.CreateOverlay( f149_arg2, f149_arg0, "PregameCACWarning", f149_arg2 )
end

function ShowStreakContentWarning( f151_arg0, f151_arg1, f151_arg2 )
	CoD.OverlayUtility.AddSystemOverlay( "PregameStreakWarning", {
		menuName = "SystemOverlay_Pregame",
		title = "MENU_STREAK_BANNED_CAPS",
		description = "MENU_CAC_CONTENT_BANNED_DESC",
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		openMethod = CoD.OverlayUtility.OpenMethods.Overlay,
		frameWidget = "CoD.Pregame_RestrictedContentWarning"
	} )
	CoD.OverlayUtility.CreateOverlay( f151_arg2, f151_arg0, "PregameStreakWarning" )
end

function SetInitLobbyMenu( f152_arg0, f152_arg1 )
	CoD.LobbyBase.SetInitLobbyMenu( f152_arg0, f152_arg1 )
end

function LobbyToggleNetwork( f153_arg0, f153_arg1, f153_arg2, f153_arg3 )
	for f153_local0 = 1, Engine.GetMaxControllerCount() - 1, 1 do
		LobbyRemoveLocalClientFromLobby( f153_arg0, f153_local0 )
	end
	if f153_arg3 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		if IsOrbis() then
			if Engine.DisplayNpAvailabilityErrors( f153_arg2 ) then
				return 
			elseif not Engine.DisplayUpsellAndContentWarnings( f153_arg2 ) then
				return 
			end
		end
		if CoD.LobbyBase.ForceOffline() == true then
			CoD.OverlayUtility.CreateOverlay( f153_arg2, f153_arg0, "UpdateNeeded" )
			return 
		elseif not Engine.IsDemonwareFetchingDone( f153_arg2 ) then
			Engine.LiveConnectEnableDemonwareConnect()
			CoD.OverlayUtility.CreateOverlay( f153_arg2, f153_arg0, "ConnectingToDemonware" )
			return 
		end
	end
	Engine.LobbyVM_CallFunc( "NetworkModeChanged", {
		controller = f153_arg2,
		networkMode = f153_arg3
	} )
	local f153_local1 = f153_arg0:getParent()
	f153_arg0:close()
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), true )
end

function OpenLobbyToggleNetworkConfirmation( f154_arg0, f154_arg1, f154_arg2, f154_arg3, f154_arg4 )
	local f154_local0 = {}
	local f154_local1, f154_local2 = nil
	local f154_local3 = Engine.GetLobbyNetworkMode()
	if f154_arg2 ~= 0 then
		LuaUtils.UI_ShowWarningMessageDialog( f154_arg2, "MENU_PRIMARY_CLIENT_ONLY" )
		return 
	elseif f154_local3 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		if not Engine.CheckNetConnection() then
			LuaUtils.UI_ShowErrorMessageDialog( f154_arg2, "XBOXLIVE_NETCONNECTION" )
			return 
		elseif IsOrbis() then
			if not Engine.IsSignedIntoPSN( f154_arg2 ) then
				Engine.DisplayNpError( f154_arg2, "-2141913082" )
				return 
			elseif Engine.DisplayNpAvailabilityErrors( f154_arg2 ) then
				return 
			elseif not Engine.DisplayUpsellAndContentWarnings( f154_arg2 ) then
				return 
			end
		end
		if IsDurango() and not Engine.HasMPPrivileges( f154_arg2 ) then
			Engine.PrivilegeForceCheck( f154_arg2, 254, true )
			return 
		elseif Engine.IsPlayerQueued( f154_arg2 ) then
			CoD.OverlayUtility.CreateOverlay( f154_arg2, f154_arg0, "LoginQueue" )
			return 
		elseif Engine.IsSignedInToLive( f154_arg2 ) == false then
			if IsOrbis() then
				if not Engine.DisplayNpAvailabilityErrors( f154_arg2 ) then
					CoD.OverlayUtility.CreateOverlay( f154_arg2, f154_arg0, "LobbyPlayNetworkModePopup", Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
				end
			elseif IsDurango() and Engine.HasMPPrivileges( f154_arg2 ) then
				CoD.OverlayUtility.CreateOverlay( f154_arg2, f154_arg0, "LobbyPlayNetworkModePopup", Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
			end
		else
			if not Engine.IsDemonwareFetchingDone( f154_arg2 ) then
				Engine.LiveConnectEnableDemonwareConnect()
				Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f154_arg2 ), "lobbyRoot.anticheat" ), "reputation" ), 0 )
				CoD.OverlayUtility.CreateOverlay( f154_arg2, f154_arg0, "ConnectingToDemonware" )
				return 
			end
			CoD.OverlayUtility.CreateOverlay( f154_arg2, f154_arg0, "LobbyPlayNetworkModePopup", Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
		end
	elseif f154_local3 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		CoD.OverlayUtility.CreateOverlay( f154_arg2, f154_arg0, "LobbyPlayNetworkModePopup", Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN )
	end
end

function LobbyNoAction( f155_arg0, f155_arg1, f155_arg2, f155_arg3, f155_arg4 )
	
end

function OpenMPFirstTimeFlow( f156_arg0, f156_arg1, f156_arg2, f156_arg3, f156_arg4 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "heroSelectionTutorial" ), true )
	if f156_arg3 == "goBackFirst" then
		f156_arg4 = GoBack( f156_arg0, f156_arg2 )
	end
	f156_arg4.openOverlayAfterSpinner = "WelcomeMenu"
	f156_arg4.openOverlayAfterSpinnerController = f156_arg2
	NavigateToLobby_FirstTimeFlowMP( f156_arg0, f156_arg1, f156_arg2, f156_arg4 )
end

function OpenCPFirstTimeFlow( f157_arg0, f157_arg1, f157_arg2, f157_arg3, f157_arg4 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "firstTimeFlowCPConfirm" ), false )
	f157_arg4.openOverlayAfterSpinner = "CPWelcomeMenu"
	f157_arg4.openOverlayAfterSpinnerController = f157_arg2
	NavigateToLobby_FirstTimeFlowCP( f157_arg0, f157_arg1, f157_arg2, f157_arg4 )
end

function FirstTimeSetup_SetOverview( f158_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f158_arg0 ), "firstTimeFlowState" ), CoD.CCUtility.FirstTimeFlowState.Overview )
end

function FirstTimeSetup_SetChangedCharacter( f159_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f159_arg0 ), "firstTimeFlowState" ), CoD.CCUtility.FirstTimeFlowState.SelectionChanged )
end

function FirstTimeSetup_SetComplete( f160_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f160_arg0 ), "firstTimeFlowState" ), CoD.CCUtility.FirstTimeFlowState.Complete )
end

function FirstTimeSetup_SetNone( f161_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f161_arg0 ), "firstTimeFlowState" ), CoD.CCUtility.FirstTimeFlowState.None )
end

function ShowReportPlayerDialog( f162_arg0, f162_arg1, f162_arg2, f162_arg3 )
	local f162_local0 = f162_arg3.controller
	local f162_local1 = f162_arg3.xuid
	local f162_local2 = Engine.GetPlayerInfo( f162_local0, f162_local1 )
	local f162_local3 = f162_local2.info.gamertag
	if not f162_local3 or f162_local3 == "" then
		f162_local3 = f162_arg3.gamertag
	end
	CoD.OverlayUtility.CreateOverlay( f162_local0, f162_arg0, "ReportPlayer", f162_local0, f162_arg1, {
		controller = f162_local0,
		xuid = f162_local1,
		gamertag = f162_local3,
		clantag = f162_local2.info.clantag,
		emblemBacking = f162_local2.info.emblemBacking
	} )
end

function CheckIfFeatureIsBanned( f163_arg0, f163_arg1 )
	if Engine.IsDedicatedServer() then
		return false
	else
		local f163_local0, f163_local1 = Engine.IsFeatureBanned( f163_arg0, f163_arg1 )
		if f163_local0 then
			return true
		else
			return false
		end
	end
end

function GetFeatureBanInfo( f164_arg0, f164_arg1 )
	if Engine.IsDedicatedServer() then
		return ""
	end
	local f164_local0 = Engine.IsFeaturePermaBanned( f164_arg0, f164_arg1 )
	local f164_local1 = LuaUtils.GetBanMessageForFeature( f164_arg0, f164_arg1, f164_local0 )
	local f164_local2 = ""
	if not f164_local0 then
		f164_local2 = Engine.GetTimeRemainingString( Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f164_arg0 ), "lobbyRoot.anticheat" ), "featureBans" ), "feature_" .. f164_arg1 .. "_end" ) ) - Engine.SystemTimeUInt64() )
	end
	return string.format( "%s\n\n%s", f164_local1, f164_local2 )
end

function PopAnticheatMessageAndGoForward_MP( f165_arg0, f165_arg1, f165_arg2, f165_arg3 )
	local f165_local0 = GoBack( f165_arg0, f165_arg2 )
	Engine.PopAnticheatMessage( f165_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.MP )
	NavigateCheckForFirstTime( f165_local0, f165_arg1, f165_arg2, {
		targetName = "MPLobbyMain",
		mode = Enum.eModes.MODE_MULTIPLAYER,
		firstTimeFlowAction = OpenMPFirstTimeFlow
	}, f165_local0 )
end

function PopAnticheatMessageAndGoForward_ZM( f166_arg0, f166_arg1, f166_arg2, f166_arg3 )
	local f166_local0 = GoBack( f166_arg0, f166_arg2 )
	Engine.PopAnticheatMessage( f166_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.ZM )
	NavigateToLobby_SelectionList( f166_local0, f166_arg1, f166_arg2, "ZMLobbyOnline", f166_local0 )
end

function PopAnticheatMessageAndGoForward_Paintshop( f167_arg0, f167_arg1, f167_arg2, f167_arg3 )
	local f167_local0 = GoBack( f167_arg0, f167_arg2 )
	Engine.PopAnticheatMessage( f167_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.UGC )
	OpenPaintshop( f167_local0, f167_arg1, f167_arg2, "", f167_local0 )
end

function PopAnticheatMessageAndGoForward_EmblemEditorFromEmblemSelect( f168_arg0, f168_arg1, f168_arg2, f168_arg3 )
	local f168_local0 = GoBack( f168_arg0, f168_arg2 )
	Engine.PopAnticheatMessage( f168_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.UGC )
	OpenEmblemEditor( f168_arg1, f168_local0, f168_arg2, nil, "EmblemSelect" )
end

function PopAnticheatMessageAndGoForward_EmblemEditorFromPaintjobSelect( f169_arg0, f169_arg1, f169_arg2, f169_arg3 )
	local f169_local0 = GoBack( f169_arg0, f169_arg2 )
	Engine.PopAnticheatMessage( f169_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.UGC )
	OpenEmblemEditor( f169_arg1, f169_local0, f169_arg2, nil, "PaintjobSelect" )
end

function PopAnticheatMessageAndGoForward_Loot( f170_arg0, f170_arg1, f170_arg2, f170_arg3 )
	local f170_local0 = GoBack( f170_arg0, f170_arg2 )
	Engine.PopAnticheatMessage( f170_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.LOOT )
	OpenBlackMarket( f170_local0, nil, f170_arg2 )
end

function PopAnticheatMessageAndGoForward_Arena( f171_arg0, f171_arg1, f171_arg2, f171_arg3 )
	local f171_local0 = GoBack( f171_arg0, f171_arg2 )
	Engine.PopAnticheatMessage( f171_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.ARENA )
	NavigateToLobby_SelectionList( f171_local0, f171_arg1, f171_arg2, "MPLobbyOnlineArena", f171_local0 )
end

function GetAnticheatMessageForwardFunction( f172_arg0, f172_arg1, f172_arg2 )
	if f172_arg0 == LuaEnums.ANTICHEAT_MESSAGE_GROUPS.MP then
		return PopAnticheatMessageAndGoForward_MP
	elseif f172_arg0 == LuaEnums.ANTICHEAT_MESSAGE_GROUPS.ZM then
		return PopAnticheatMessageAndGoForward_ZM
	elseif f172_arg0 == LuaEnums.ANTICHEAT_MESSAGE_GROUPS.UGC then
		if f172_arg1 == "EmblemEditor" then
			if f172_arg2 == "EmblemSelect" then
				return PopAnticheatMessageAndGoForward_EmblemEditorFromEmblemSelect
			elseif f172_arg2 == "PaintjobSelect" then
				return PopAnticheatMessageAndGoForward_EmblemEditorFromPaintjobSelect
			end
		elseif f172_arg1 == "Paintshop" then
			return PopAnticheatMessageAndGoForward_Paintshop
		end
	elseif f172_arg0 == LuaEnums.ANTICHEAT_MESSAGE_GROUPS.LOOT then
		return PopAnticheatMessageAndGoForward_Loot
	elseif f172_arg0 == LuaEnums.ANTICHEAT_MESSAGE_GROUPS.ARENA then
		return PopAnticheatMessageAndGoForward_Arena
	end
end

function DisplayAnticheatMessage( f173_arg0, f173_arg1, f173_arg2, f173_arg3, f173_arg4 )
	if Engine.IsDedicatedServer() then
		return 
	else
		local f173_local0 = GetAnticheatMessageForwardFunction( f173_arg2, f173_arg3, f173_arg4 )
		local f173_local1 = Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f173_arg1 ), "lobbyRoot.anticheat" ), "message" )
		CoD.OverlayUtility.CreateOverlay( f173_arg1, f173_arg0, "AnticheatMessage", Engine.GetModelValue( Engine.GetModel( f173_local1, "string" ) ), Engine.GetModelValue( Engine.GetModel( f173_local1, "url" ) ), f173_local0 )
	end
end

function OpenAnticheatPolicyInBrowser( f174_arg0, f174_arg1, f174_arg2, f174_arg3 )
	if Engine.IsDedicatedServer() then
		return 
	else
		Engine.OpenAnticheatPolicyInBrowser( f174_arg2, Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f174_arg2 ), "lobbyRoot.anticheat" ), "message" ), "url" ) ) )
	end
end

function NavigateCheckForFirstTime( f175_arg0, f175_arg1, f175_arg2, f175_arg3, f175_arg4 )
	if f175_arg3.targetName == "MPLobbyMain" then
		if Engine.PushAnticheatMessageToUI( f175_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.MP ) then
			DisplayAnticheatMessage( f175_arg0, f175_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.MP, "", "" )
			return 
		end
		for f175_local0 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
			if CheckIfFeatureIsBanned( f175_local0, LuaEnums.FEATURE_BAN.LIVE_MP ) then
				LuaUtils.UI_ShowErrorMessageDialog( f175_arg2, GetFeatureBanInfo( f175_local0, LuaEnums.FEATURE_BAN.LIVE_MP ) )
				return 
			end
		end
		if Engine.GetUsedControllerCount() > 1 then
			for f175_local1 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
				if CheckIfFeatureIsBanned( f175_local1, LuaEnums.FEATURE_BAN.MP_SPLIT_SCREEN ) then
					LuaUtils.UI_ShowErrorMessageDialog( f175_arg2, GetFeatureBanInfo( f175_local1, LuaEnums.FEATURE_BAN.MP_SPLIT_SCREEN ) )
					return 
				end
			end
		end
	end
	if f175_arg3.targetName == "CPLobbyOnline" then
		for f175_local0 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
			if CheckIfFeatureIsBanned( f175_local0, LuaEnums.FEATURE_BAN.LIVE_CP ) then
				LuaUtils.UI_ShowErrorMessageDialog( f175_arg2, GetFeatureBanInfo( f175_local0, LuaEnums.FEATURE_BAN.LIVE_CP ) )
				return 
			end
		end
		if Engine.GetUsedControllerCount() > 1 then
			for f175_local1 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
				if CheckIfFeatureIsBanned( f175_local1, LuaEnums.FEATURE_BAN.CP_SPLIT_SCREEN ) then
					LuaUtils.UI_ShowErrorMessageDialog( f175_arg2, GetFeatureBanInfo( f175_local1, LuaEnums.FEATURE_BAN.CP_SPLIT_SCREEN ) )
					return 
				end
			end
		end
	end
	if IsFirstTimeSetup( f175_arg2, f175_arg3.mode ) then
		f175_arg3.firstTimeFlowAction( f175_arg0, f175_arg1, f175_arg2, f175_arg3.targetName, f175_arg4 )
	else
		NavigateToLobby_SelectionList( f175_arg0, f175_arg1, f175_arg2, f175_arg3.targetName, f175_arg4 )
	end
end

function ShouldShowNightmares( f176_arg0 )
	return true
end

function OpenChooseCharacterFromFirstTimeFlow( f177_arg0, f177_arg1, f177_arg2, f177_arg3, f177_arg4 )
	CoD.CCUtility.customizationMode = Enum.eModes.MODE_MULTIPLAYER
	local f177_local0 = CoD.LobbyBase.OpenChooseCharacterLoadout( f177_arg4, f177_arg2, LuaEnums.CHOOSE_CHARACTER_OPENED_FROM.FIRST_TIME )
	f177_local0.previousMode = Engine.GetMostRecentPlayedMode( f177_arg2 )
end

function SetCharacterModeToSessionMode( f178_arg0, f178_arg1, f178_arg2, f178_arg3 )
	CoD.CCUtility.customizationMode = f178_arg3
end

function SetCharacterModeToCurrentSessionMode( f179_arg0, f179_arg1, f179_arg2 )
	CoD.CCUtility.customizationMode = Engine.CurrentSessionMode()
end

function SetFirstTimeSetupComplete_MP( f180_arg0, f180_arg1, f180_arg2, f180_arg3, f180_arg4 )
	Engine.SetFirstTimeComplete( f180_arg2, Enum.eModes.MODE_MULTIPLAYER, true )
	FirstTimeSetup_SetNone( f180_arg2 )
end

function OpenFindMatch( f181_arg0, f181_arg1, f181_arg2, f181_arg3, f181_arg4 )
	CoD.LobbyBase.OpenFindMatch( f181_arg4, f181_arg2 )
end

function OpenCompetitivePlaylist( f182_arg0, f182_arg1, f182_arg2, f182_arg3, f182_arg4 )
	CoD.LobbyBase.OpenCompetitivePlaylist( f182_arg4, f182_arg2 )
end

function OpenFreerunMapSelection( f183_arg0, f183_arg1, f183_arg2, f183_arg3, f183_arg4 )
	CoD.LobbyBase.OpenFreerunMapSelection( f183_arg4, f183_arg2 )
end

function OpenMPPublicLobbyLeaderboard( f184_arg0, f184_arg1, f184_arg2, f184_arg3, f184_arg4 )
	CoD.LobbyBase.OpenMPPublicLobbyLeaderboard( f184_arg4, f184_arg2 )
end

function OpenMPCustomLobbyLeaderboard( f185_arg0, f185_arg1, f185_arg2, f185_arg3, f185_arg4 )
	CoD.LobbyBase.OpenMPCustomLobbyLeaderboard( f185_arg4, f185_arg2 )
end

function OpenFreerunLeaderboards( f186_arg0, f186_arg1, f186_arg2, f186_arg3, f186_arg4 )
	CoD.LobbyBase.OpenFreerunLeaderboards( f186_arg4, f186_arg2 )
end

function OpenArenaMasterLeaderboards( f187_arg0, f187_arg1, f187_arg2, f187_arg3, f187_arg4 )
	CoD.LobbyBase.OpenArenaMasterLeaderboards( f187_arg4, f187_arg2 )
end

function OpenDOALeaderboards( f188_arg0, f188_arg1, f188_arg2, f188_arg3, f188_arg4 )
	CoD.LobbyBase.OpenDOALeaderboards( f188_arg4, f188_arg2 )
end

function OpenSetupGameMP( f189_arg0, f189_arg1, f189_arg2, f189_arg3, f189_arg4 )
	CoD.LobbyBase.OpenSetupGame( f189_arg4, f189_arg2, "GameSettingsFlyoutMP" )
end

function OpenBonusModesFlyout( f190_arg0, f190_arg1, f190_arg2, f190_arg3, f190_arg4 )
	CoD.LobbyBase.OpenSetupGame( f190_arg4, f190_arg2, "BonusModesFlyout" )
end

function OpenChangeMapZM( f191_arg0, f191_arg1, f191_arg2, f191_arg3, f191_arg4 )
	CoD.perController[f191_arg2].choosingZMPlaylist = false
	CoD.LobbyBase.ZMOpenChangeMap( f191_arg4, f191_arg2, CoD.LobbyBase.MapSelect.SELECT, nil )
end

function OpenSetupGame( f192_arg0, f192_arg1, f192_arg2, f192_arg3, f192_arg4 )
	CoD.LobbyBase.OpenSetupGame( f192_arg4, f192_arg2, "GameSettingsFlyout" )
end

function OpenBubbleGumPacksMenu( f193_arg0, f193_arg1, f193_arg2, f193_arg3, f193_arg4 )
	CoD.LobbyBase.OpenBubbleGumBuffs( f193_arg4, f193_arg2 )
end

function OpenMegaChewFactorymenu( f194_arg0, f194_arg1, f194_arg2, f194_arg3, f194_arg4 )
	CoD.LobbyBase.OpenMegaChewFactory( f194_arg4, f194_arg2 )
end

function OpenGobbleGumCookbookMenu( f195_arg0, f195_arg1, f195_arg2, f195_arg3, f195_arg4 )
	CoD.LobbyBase.OpenGobbleGumCookbook( f195_arg4, f195_arg2 )
end

function OpenWeaponBuildKits( f196_arg0, f196_arg1, f196_arg2, f196_arg3, f196_arg4 )
	CoD.LobbyBase.OpenWeaponBuildKits( f196_arg4, f196_arg2 )
end

function OpenChangeMap( f197_arg0, f197_arg1, f197_arg2, f197_arg3, f197_arg4 )
	CoD.LobbyBase.OpenChangeMap( f197_arg0, f197_arg2 )
end

function OpenChangeGameMode( f198_arg0, f198_arg1, f198_arg2, f198_arg3, f198_arg4 )
	CoD.LobbyBase.OpenChangeGameMode( f198_arg0, f198_arg2 )
end

function OpenEditGameRules( f199_arg0, f199_arg1, f199_arg2, f199_arg3, f199_arg4 )
	CoD.LobbyBase.OpenEditGameRules( f199_arg0, f199_arg2 )
end

function OpenBotSettings( f200_arg0, f200_arg1, f200_arg2, f200_arg3, f200_arg4 )
	CoD.LobbyBase.OpenBotSettings( f200_arg0, f200_arg2 )
end

function OpenOptions( f201_arg0, f201_arg1, f201_arg2, f201_arg3, f201_arg4 )
	CoD.LobbyBase.OpenOptions( f201_arg4, f201_arg2 )
end

function OpenZMFindMatch( f202_arg0, f202_arg1, f202_arg2, f202_arg3, f202_arg4 )
	CoD.perController[f202_arg2].choosingZMPlaylist = true
	CoD.LobbyBase.OpenFindMatch( f202_arg4, f202_arg2, "ZMMapSelection" )
end

function OpenZMMapSelectLaunch( f203_arg0, f203_arg1, f203_arg2, f203_arg3, f203_arg4 )
	local f203_local0 = {
		controller = f203_arg2,
		actionFunc = function ( f204_arg0 )
			Engine.SetPlaylistID( 150 )
			Engine.RunPlaylistRules( Engine.GetPrimaryController() )
			CoD.perController[Engine.GetPrimaryController()].choosingZMPlaylist = false
			Dvar.zm_private_rankedmatch:set( true )
			CoD.LobbyBase.ZMOpenChangeMap( f203_arg4, Engine.GetPrimaryController(), CoD.LobbyBase.MapSelect.LAUNCH, f204_arg0 )
		end
	}
	if Engine.GetUsedControllerCount() > 1 and Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyClientType.LOBBY_CLIENT_TYPE_ALL ) == Engine.GetUsedControllerCount() then
		CoD.OverlayUtility.CreateOverlay( f203_arg2, f203_arg0, "LobbyLocalClientWarning", f203_local0 )
		return 
	elseif Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) == 0 or Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyClientType.LOBBY_CLIENT_TYPE_ALL ) > 1 then
		LuaUtils.UI_ShowErrorMessageDialog( f203_arg2, "MENU_TOO_MANY_CLIENTS_FOR_SOLO_GAME" )
		return 
	else
		Engine.SetPlaylistID( 150 )
		Engine.RunPlaylistRules( f203_arg2 )
		CoD.perController[f203_arg2].choosingZMPlaylist = false
		Dvar.zm_private_rankedmatch:set( true )
		CoD.LobbyBase.ZMOpenChangeMap( f203_arg4, f203_arg2, CoD.LobbyBase.MapSelect.LAUNCH, f203_arg3 )
	end
end

function OpenZMMapSelectSelect( f205_arg0, f205_arg1, f205_arg2, f205_arg3, f205_arg4 )
	CoD.perController[f205_arg2].choosingZMPlaylist = false
	CoD.LobbyBase.ZMOpenChangeMap( f205_arg4, f205_arg2, CoD.LobbyBase.MapSelect.SELECT, f205_arg3 )
end

function ProcessZMMapSelectListAction( f206_arg0, f206_arg1, f206_arg2, f206_arg3 )
	if f206_arg1.mapId ~= nil then
		SetMap( f206_arg2, f206_arg1.mapId, false )
		f206_arg0.mapSelected = true
	end
	GoBack( f206_arg0, f206_arg2 )
end

function OpenMissionSelect( f207_arg0, f207_arg1, f207_arg2, f207_arg3, f207_arg4 )
	if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "cpLobby" ), "lan" )
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "cpLobby" ), "custom" )
	end
	Engine.SetDvar( "ui_blocksaves", "1" )
	f207_arg4:openPopup( "CPMissionSelect", f207_arg2 )
end

function OpenPublicGameSelect( f208_arg0, f208_arg1, f208_arg2, f208_arg3, f208_arg4 )
	Engine.SetDvar( "ui_blocksaves", "1" )
	f208_arg4:openPopup( "CPPublicGameSelect", f208_arg2 )
end

function OpenMissionOverview( f209_arg0, f209_arg1, f209_arg2, f209_arg3, f209_arg4 )
	f209_arg4:openPopup( "CPMissionOverviewFrontend", f209_arg2 )
end

function OpenDifficultySelect( f210_arg0, f210_arg1, f210_arg2, f210_arg3, f210_arg4 )
	local f210_local0 = f210_arg4:openPopup( "CPSelectDifficulty", f210_arg2 )
	f210_local0.disableConfirmSelection = f210_arg3
end

function OpenCAC( f211_arg0, f211_arg1, f211_arg2, f211_arg3, f211_arg4 )
	CoD.LobbyBase.OpenCAC( f211_arg4, f211_arg2 )
end

function OpenFindLANGame( f212_arg0, f212_arg1, f212_arg2, f212_arg3, f212_arg4 )
	if not Engine.CheckNetConnection() then
		LuaUtils.UI_ShowErrorMessageDialog( f212_arg2, "XBOXLIVE_NETCONNECTION" )
		return 
	elseif Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 2 then
		CoD.OverlayUtility.CreateOverlay( f212_arg2, f212_arg4, "LobbyLocalClientWarning", {
			controller = f212_arg2,
			navToMenu = nil,
			popupName = "LobbyServerBrowserOverlay",
			openFromMenu = f212_arg4
		} )
		return 
	else
		OpenPopup( f212_arg4, "LobbyServerBrowserOverlay", f212_arg2 )
	end
end

function OpenStore( f213_arg0, f213_arg1, f213_arg2, f213_arg3, f213_arg4 )
	if not DisableStore() then
		local f213_local0 = LobbyData:GetCurrentMenuTarget()
		LUI.CoDMetrics.StoreEntry( f213_arg4, f213_arg2, f213_arg3, f213_local0 )
		local f213_local1 = Engine.CreateModel( Engine.GetModelForController( f213_arg2 ), "StoreRoot" )
		Engine.SetModelValue( Engine.CreateModel( f213_local1, "actionSource", true ), f213_arg3 )
		Engine.SetModelValue( Engine.CreateModel( f213_local1, "storeSource", true ), f213_local0.name )
		OpenOverlay( f213_arg4, "Store", f213_arg2 )
	end
end

function SetFocusToCorrectDLCPack( f214_arg0, f214_arg1 )
	if f214_arg0.productList and f214_arg0.productList.itemStencil then
		local f214_local0 = f214_arg0.productList:findItem( {
			productImage = CoD.DLCImages[CoD.DLCFocus]
		}, nil, true, 0 )
	end
end

function OpenDLCStore( f215_arg0, f215_arg1, f215_arg2, f215_arg3, f215_arg4 )
	if not DisableStore() then
		CoD.DLCFocus = 0
		if IsPurchaseExperimentActive( f215_arg2, f215_arg4 ) then
			local f215_local0 = f215_arg1:getModel()
			if not f215_local0 then
				if f215_arg4.selectionList and f215_arg4.selectionList.activeWidget then
					f215_local0 = f215_arg4.selectionList.activeWidget:getModel()
				elseif f215_arg4.MapList and f215_arg4.MapList.activeWidget then
					f215_local0 = f215_arg4.MapList.activeWidget:getModel()
				elseif f215_arg4.mapList and f215_arg4.mapList.activeWidget then
					f215_local0 = f215_arg4.mapList.activeWidget:getModel()
				end
			end
			if f215_local0 then
				local f215_local1 = Engine.GetModel( f215_local0, "dlcIndex" )
				if f215_local1 then
					local f215_local2 = Engine.GetModelValue( f215_local1 )
					local f215_local3 = CoD.DLCBits["CONTENT_DLC" .. f215_local2 - CoD.CONTENT_DLCZM0_INDEX]
					if f215_local2 == CoD.CONTENT_DLC0_INDEX then
						f215_local3 = CoD.DLCBits.CONTENT_DLC0ZM
					end
					CoD.DLCFocus = f215_local3
				end
			elseif f215_arg4.selectionList and f215_arg4.selectionList.activeWidget then
				f215_local0 = f215_arg4.selectionList.activeWidget
			end
		end
		local f215_local0 = OpenOverlay( f215_arg4, "Store_DLC", f215_arg2 )
		local f215_local1 = LobbyData:GetCurrentMenuTarget()
		LUI.CoDMetrics.StoreEntry( f215_arg4, f215_arg2, f215_arg3, f215_local1 )
		local f215_local3 = Engine.CreateModel( Engine.GetModelForController( f215_arg2 ), "StoreRoot" )
		Engine.SetModelValue( Engine.CreateModel( f215_local3, "actionSource", true ), f215_arg3 )
		Engine.SetModelValue( Engine.CreateModel( f215_local3, "storeSource", true ), f215_local1.name )
		if IsPurchaseExperimentActive( f215_arg2, f215_arg4 ) then
			SetFocusToCorrectDLCPack( f215_local0.StoreNonFeaturedFrame, f215_arg2 )
		end
	end
end

function MegaChewOpenCodPointsStore( f216_arg0, f216_arg1, f216_arg2, f216_arg3, f216_arg4 )
	if CoD.NotEnoughLD then
		OpenCodPointsStore( f216_arg0, f216_arg1, f216_arg2, "NotEnoughLiquidDivinum", f216_arg4 )
	else
		OpenCodPointsStore( f216_arg0, f216_arg1, f216_arg2, f216_arg3, f216_arg4 )
	end
end

function OpenCodPointsStore( f217_arg0, f217_arg1, f217_arg2, f217_arg3, f217_arg4 )
	if not DisableStore() then
		OpenOverlay( f217_arg4, "Store_CodPoints", f217_arg2 )
		if f217_arg3 == "menuName" then
			f217_arg3 = f217_arg4.menuName
		end
		local f217_local0 = LobbyData:GetCurrentMenuTarget()
		LUI.CoDMetrics.StoreEntry( f217_arg4, f217_arg2, f217_arg3, f217_local0 )
		local f217_local1 = Engine.CreateModel( Engine.GetModelForController( f217_arg2 ), "StoreRoot" )
		Engine.SetModelValue( Engine.CreateModel( f217_local1, "actionSource", true ), f217_arg3 )
		Engine.SetModelValue( Engine.CreateModel( f217_local1, "storeSource", true ), f217_local0.name )
	end
end

function OpenSteamStore( f218_arg0, f218_arg1, f218_arg2, f218_arg3, f218_arg4 )
	if not DisableSteamStore() then
		Engine.SteamStore( f218_arg2 )
	end
end

function OpenScorestreaks( f219_arg0, f219_arg1, f219_arg2, f219_arg3, f219_arg4 )
	CoD.LobbyBase.OpenScorestreaks( f219_arg4, f219_arg2 )
end

function OpenEditCodcasterSettings( f220_arg0, f220_arg1, f220_arg2, f220_arg3, f220_arg4 )
	CoD.LobbyBase.OpenEditCodcasterSettings( f220_arg4, f220_arg2 )
end

function OpenTest( f221_arg0, f221_arg1, f221_arg2, f221_arg3, f221_arg4 )
	CoD.LobbyBase.OpenTest( f221_arg4, f221_arg2 )
end

function OpenBarracks( f222_arg0, f222_arg1, f222_arg2, f222_arg3, f222_arg4 )
	CoD.LobbyBase.OpenBarracks( f222_arg4, f222_arg2 )
end

function OpenGenders( f223_arg0, f223_arg1, f223_arg2 )
	CoD.LobbyBase.OpenGenders( f223_arg2, f223_arg1 )
end

function OpenQuit( f224_arg0, f224_arg1, f224_arg2, f224_arg3, f224_arg4 )
	CoD.LobbyBase.OpenQuit( f224_arg4, f224_arg2 )
end

function LobbyMapVoteSelectNext( f225_arg0, f225_arg1 )
	CoD.LobbyBase.LobbyMapVoteSelect( f225_arg0, f225_arg1, Enum.LobbyMapVote.LOBBY_MAPVOTE_NEXT )
end

function LobbyMapVoteSelectPrevious( f226_arg0, f226_arg1 )
	CoD.LobbyBase.LobbyMapVoteSelect( f226_arg0, f226_arg1, Enum.LobbyMapVote.LOBBY_MAPVOTE_PREVIOUS )
end

function LobbyMapVoteSelectRandom( f227_arg0, f227_arg1 )
	CoD.LobbyBase.LobbyMapVoteSelect( f227_arg0, f227_arg1, Enum.LobbyMapVote.LOBBY_MAPVOTE_RANDOM )
end

function ShowManagePartyPopup( f228_arg0, f228_arg1, f228_arg2, f228_arg3, f228_arg4 )
	CoD.perController[f228_arg3].Social_Party = f228_arg1
	CoD.perController[f228_arg3].Social_Party_Action = 0
	local f228_local0 = Engine.GetModel( Engine.GetGlobalModel(), "SocialMainMenu.managePartyButtonText" )
	if f228_local0 then
		if f228_arg4 == "PROMOTE" then
			CoD.perController[f228_arg3].Social_Party_Action = 1
			Engine.SetModelValue( f228_local0, Engine.Localize( "MENU_MANAGE_PARTY_PROMOTE_BUTTON" ) )
		elseif f228_arg4 == "KICK" then
			CoD.perController[f228_arg3].Social_Party_Action = 2
			Engine.SetModelValue( f228_local0, Engine.Localize( "MENU_MANAGE_PARTY_KICK_BUTTON" ) )
		else
			return 
		end
		SetState( f228_arg1, "Hidden" )
		OpenPopup( f228_arg0, "Social_Party_ManagePartyPopup", f228_arg3 )
	end
end

function ManagePartyAction( f229_arg0, f229_arg1, f229_arg2, f229_arg3 )
	local f229_local0 = f229_arg2:getModel( f229_arg3, "xuid" )
	if not f229_local0 then
		return 
	end
	local f229_local1 = Engine.GetModelValue( f229_local0 )
	if CoD.perController[f229_arg3].Social_Party_Action == 1 then
		if Engine.StartPrivateLobbyMigrateTo then
			Engine.StartPrivateLobbyMigrateTo( f229_arg3, f229_local1 )
		end
		GoBackToMenu( GoBack( f229_arg1, f229_arg3 ), f229_arg3, "Lobby" )
	elseif CoD.perController[f229_arg3].Social_Party_Action == 2 and Engine.IsLeader( f229_arg3, Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		Engine.LobbyDisconnectClient( f229_arg3, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f229_local1, Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_KICK )
	end
end

function PromoteToLeader( f230_arg0, f230_arg1, f230_arg2, f230_arg3, f230_arg4 )
	Engine.GiveLeadership( f230_arg3.controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f230_arg3.xuid )
	f230_arg4:goBack( f230_arg2 )
end

function DisconnectClient( f231_arg0, f231_arg1, f231_arg2, f231_arg3, f231_arg4 )
	Engine.LobbyDisconnectClient( f231_arg3.controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f231_arg3.xuid, Enum.LobbyDisconnectClient.LOBBY_DISCONNECT_CLIENT_KICK )
	f231_arg4:goBack( f231_arg2 )
end

function MuteLobbyPlayerLAN( f232_arg0, f232_arg1, f232_arg2 )
	local f232_local0 = CoD.SafeGetModelValue( f232_arg0:getModel(), "xuid" )
	if f232_local0 then
		if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f232_local0 ) then
			Engine.MutePlayer( f232_arg1, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f232_local0 )
		end
		if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, f232_local0 ) then
			Engine.MutePlayer( f232_arg1, Enum.LobbyType.LOBBY_TYPE_GAME, f232_local0 )
		end
		UpdateAllMenuButtonPrompts( f232_arg2, f232_arg1 )
	end
end

function UnmuteLobbyPlayerLAN( f233_arg0, f233_arg1, f233_arg2 )
	local f233_local0 = CoD.SafeGetModelValue( f233_arg0:getModel(), "xuid" )
	if f233_local0 then
		if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f233_local0 ) then
			Engine.UnMutePlayer( f233_arg1, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f233_local0 )
		end
		if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, f233_local0 ) then
			Engine.UnMutePlayer( f233_arg1, Enum.LobbyType.LOBBY_TYPE_GAME, f233_local0 )
		end
		UpdateAllMenuButtonPrompts( f233_arg2, f233_arg1 )
	end
end

function MutePlayer( f234_arg0, f234_arg1, f234_arg2, f234_arg3, f234_arg4 )
	if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f234_arg3.xuid ) then
		Engine.MutePlayer( f234_arg3.controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f234_arg3.xuid )
	end
	if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, f234_arg3.xuid ) then
		Engine.MutePlayer( f234_arg3.controller, Enum.LobbyType.LOBBY_TYPE_GAME, f234_arg3.xuid )
	end
	f234_arg4:goBack( f234_arg2 )
end

function UnMutePlayer( f235_arg0, f235_arg1, f235_arg2, f235_arg3, f235_arg4 )
	if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f235_arg3.xuid ) then
		Engine.UnMutePlayer( f235_arg3.controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f235_arg3.xuid )
	end
	if Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, f235_arg3.xuid ) then
		Engine.UnMutePlayer( f235_arg3.controller, Enum.LobbyType.LOBBY_TYPE_GAME, f235_arg3.xuid )
	end
	f235_arg4:goBack( f235_arg2 )
end

function ShowSocialPartyWidget( f236_arg0 )
	if CoD.perController[f236_arg0].Social_Party then
		CoD.perController[f236_arg0].Social_Party:setState( "DefaultState" )
	end
end

function LobbyPartyPrivacy( f237_arg0, f237_arg1, f237_arg2, f237_arg3, f237_arg4 )
	local f237_local0 = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" ), "privacy" )
	local f237_local1 = Engine.GetModelValue( f237_local0 )
	local f237_local2 = 1
	if f237_arg3 == "left" then
		f237_local2 = -1
	elseif f237_arg3 == "right" then
		f237_local2 = 1
	end
	Engine.SetModelValue( f237_local0, (f237_local1 + f237_local2) % Enum.PartyPrivacy.PARTY_PRIVACY_COUNT )
end

function LobbyPartyPrivacyAccept( f238_arg0, f238_arg1, f238_arg2 )
	local f238_local0 = f238_arg1.Slider.activeWidget
	local f238_local1 = f238_local0:getModel( f238_arg2, "action" )
	local f238_local2 = f238_local0:getModel( f238_arg2, "param" )
	local f238_local3, f238_local4 = nil
	if f238_local1 then
		f238_local3 = Engine.GetModelValue( f238_local1 )
		if f238_local2 then
			f238_local4 = Engine.GetModelValue( f238_local2 )
		end
	else
		f238_local3 = f238_local0.action
		f238_local4 = f238_local0.actionParam
	end
	if f238_local3 then
		f238_local3( f238_arg0, f238_local0, f238_arg2, f238_local4, f238_local0.gridInfoTable.parentGrid.menu )
	end
	Engine.Exec( f238_arg2, "updategamerprofile" )
end

function LobbyPartyPrivacyCancel( f239_arg0, f239_arg1, f239_arg2 )
	local f239_local0 = f239_arg1.Slider.activeWidget
	local f239_local1 = f239_local0:getModel( f239_arg2, "action" )
	local f239_local2 = f239_local0:getModel( f239_arg2, "param" )
	local f239_local3 = Engine.GetModelPath( f239_arg1 )
	f239_local3 = Engine.GetModelPath( f239_arg1.Slider )
	f239_local3 = Engine.GetModelPath( f239_arg1.Slider.activeWidget )
	local f239_local4, f239_local5, f239_local6 = nil
	if f239_local1 then
		f239_local4 = Engine.GetModelValue( f239_local1 )
		if f239_local2 then
			f239_local5 = Engine.GetModelValue( f239_local2 )
		end
	else
		f239_local4 = f239_local0.revertAction
		f239_local5 = f239_local0.actionParam
		f239_local6 = f239_arg1:getModel( f239_arg2, "currentSelection" )
	end
	if f239_local4 then
		f239_local4( f239_arg1, f239_local0, f239_arg2, f239_local5, f239_local0.gridInfoTable.parentGrid.menu )
	end
end

function LobbyTeamSelectionLB( f240_arg0, f240_arg1, f240_arg2 )
	local f240_local0 = nil
	local f240_local1 = f240_arg1:getModel( f240_arg2, "xuid" )
	if f240_local1 == nil then
		f240_local0 = Engine.GetXUID64( f240_arg2 )
	else
		f240_local0 = Engine.GetModelValue( f240_local1 )
	end
	if f240_local0 == nil then
		return 
	else
		CoD.LobbyBase.LobbyTeamSelection( f240_arg0, f240_arg2, 0, f240_local0 )
	end
end

function LobbyTeamSelectionRB( f241_arg0, f241_arg1, f241_arg2 )
	local f241_local0 = nil
	local f241_local1 = f241_arg1:getModel( f241_arg2, "xuid" )
	if f241_local1 == nil then
		f241_local0 = Engine.GetXUID64( f241_arg2 )
	else
		f241_local0 = Engine.GetModelValue( f241_local1 )
	end
	if f241_local0 == nil then
		return 
	else
		CoD.LobbyBase.LobbyTeamSelection( f241_arg0, f241_arg2, 1, f241_local0 )
	end
end

function LobbyLANLaunchGame( f242_arg0, f242_arg1, f242_arg2 )
	Engine.SetDvar( "skipto", "" )
	Engine.SetDvar( "sv_saveGameSkipto", "" )
	CoD.LobbyBase.LaunchGame( f242_arg0, f242_arg2, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function LobbyLANServerBrowserSetMainModeFilter( f243_arg0, f243_arg1 )
	CoD.LobbyBase.LobbyLANServerBrowserSetMainModeFilter( f243_arg0, f243_arg1 )
end

function SetTMode( f244_arg0, f244_arg1, f244_arg2 )
	local f244_local0 = f244_arg1:getModel()
	if f244_local0 then
		local f244_local1 = CoD.SafeGetModelValue( f244_local0, "itemIndex" )
		if f244_local1 then
			Engine.SetDvar( "r_tacScan_Layout", f244_local1 )
			CoD.perController[f244_arg2].startMenu_equippedIndex = f244_local1
			f244_arg0.selectionList:updateDataSource()
		end
	end
end

local f0_local0 = function ()
	Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "MapVote.timerActive" ), 1 )
end

function LobbyOnlineCustomLaunchGame_SelectionList( f246_arg0, f246_arg1, f246_arg2 )
	f0_local0()
	Engine.SetDvar( "skipto", "" )
	Engine.SetDvar( "sv_saveGameSkipto", "" )
	CoD.LobbyBase.LaunchGame( f246_arg0, f246_arg2, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function LobbyOnlineCustomLaunchGame( f247_arg0, f247_arg1 )
	CoD.LobbyBase.LaunchGame( f247_arg0, f247_arg1, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function OpenTheaterSelectFilm( f248_arg0, f248_arg1, f248_arg2, f248_arg3, f248_arg4 )
	CoD.FileshareUtility.SetFileshareMode( f248_arg2, Enum.FileshareMode.FILESHARE_MODE_USER )
	CoD.FileshareUtility.SetCurrentUser( Engine.GetXUID64( f248_arg2 ) )
	CoD.FileshareUtility.SetDirty()
	CoD.LobbyBase.OpenTheaterSelectFilm( f248_arg4, f248_arg2 )
end

function LobbyTheaterStartFilm( f249_arg0, f249_arg1, f249_arg2 )
	f0_local0()
	LobbyTheaterLaunchDemo( f249_arg0, f249_arg1, f249_arg2 )
end

function LobbyTheaterCreateHighlightReel( f250_arg0, f250_arg1, f250_arg2 )
	f0_local0()
	LobbyTheaterLaunchDemo( f250_arg0, f250_arg1, f250_arg2, "CreateHighlightReel" )
end

function LobbyTheaterShoutcastFilm( f251_arg0, f251_arg1, f251_arg2 )
	f0_local0()
	LobbyTheaterLaunchDemo( f251_arg0, f251_arg1, f251_arg2, "Shoutcast" )
end

function GoBackAndDisplayModalDialog( f252_arg0, f252_arg1, f252_arg2 )
	f252_arg2( GoBack( f252_arg0, f252_arg1 ), f252_arg1 )
end

function DisplayPlayGoJoinError( f253_arg0, f253_arg1 )
	f253_arg0:OpenModalDialog( f253_arg0, f253_arg1, "", "MENU_CANNOT_JOIN_DURING_INSTALL", {
		"MPUI_OK"
	}, function ( f254_arg0 )
		return true
	end )
end

function LobbyAcceptInvite( f255_arg0, f255_arg1, f255_arg2 )
	local f255_local0 = {
		controller = f255_arg1,
		xuid = f255_arg2.xuid,
		joinType = Enum.JoinType.JOIN_TYPE_INVITE
	}
	if CoD.LobbyBase.ChunkAnyDownloading() then
		DisplayPlayGoJoinError( f255_arg0, f255_arg1 )
		return 
	else
		Engine.LobbyVM_CallFunc( "Join", f255_local0 )
	end
end

function LobbyQuickJoin( f256_arg0, f256_arg1, f256_arg2, f256_arg3, f256_arg4 )
	local f256_local0 = f256_arg4
	if LobbyData.GetLobbyNav() == LobbyData.UITargets.UI_MODESELECT.id and IsFirstTimeSetup( f256_arg2, Enum.eModes.MODE_MULTIPLAYER ) then
		local f256_local1 = Engine.GetModel( f256_arg1:getModel(), "activity" )
		if f256_local1 and GetSessionModeFromPresenceActivity( Engine.GetModelValue( f256_local1 ) ) == Enum.eModes.MODE_MULTIPLAYER then
			if f256_local0 == true then
				GoBackAndOpenOverlayOnParent( f256_arg0, "MPIntroRequired", f256_arg2 )
			else
				OpenOverlay( f256_arg0, "MPIntroRequired", f256_arg2 )
			end
			return 
		end
	end
	local f256_local2 = false
	local f256_local1 = f256_arg1:getModel( f256_arg2, "joinable" )
	if not f256_local1 then
		f256_local1 = f256_arg1:getModel( f256_arg2, "isJoinable" )
	end
	if f256_local1 ~= nil then
		local f256_local3 = Engine.GetModelValue( f256_local1 )
		if f256_local3 ~= nil and (f256_local3 == Enum.LobbyJoinable.LOBBY_JOINABLE_YES or f256_local3 == Enum.LobbyJoinable.LOBBY_JOINABLE_YES_FRIENDS_ONLY and f256_arg3 == Enum.JoinType.JOIN_TYPE_FRIEND) then
			f256_local2 = true
		end
	end
	if CoD.LobbyBase and CoD.LobbyBase.ChunkAnyDownloading() then
		f256_local2 = false
		if f256_local0 == true then
			GoBackAndDisplayModalDialog( f256_arg0, f256_arg2, DisplayPlayGoJoinError )
		else
			DisplayPlayGoJoinError( f256_arg0:getParentMenu(), f256_arg2 )
		end
	end
	if not f256_local2 then
		return 
	end
	f256_local1 = f256_arg1:getModel( f256_arg2, "xuid" )
	if f256_local1 == nil then
		return 
	end
	local f256_local3 = Engine.GetModelValue( f256_local1 )
	if f256_local3 == nil then
		return 
	end
	local f256_local4 = Enum.JoinType.JOIN_TYPE_NORMAL
	if f256_arg3 ~= nil and f256_arg3 >= 0 and f256_arg3 < Enum.JoinType.JOIN_TYPE_COUNT then
		f256_local4 = f256_arg3
	end
	local f256_local5 = f256_arg2
	if CoD.isDurango and Engine.IsUserGuest( f256_arg2 ) then
		f256_local5 = Engine.GetPrimaryController()
	end
	local f256_local6 = {
		controller = f256_local5,
		xuid = f256_local3,
		joinType = f256_local4,
		platform = false
	}
	if f256_local0 ~= nil and f256_local0 == true then
		local f256_local7 = GoBack( f256_arg0, f256_arg2 )
		if f256_local4 == Enum.JoinType.JOIN_TYPE_GROUPS then
			GoBack( f256_local7, f256_arg2 )
		end
	end
	if Engine.IsInGame() then
		if not Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, f256_local6.xuid ) then
			f256_local6.migrating = not CoDShared.QuitGame( f256_arg2 )
			Engine.LobbyVM_CallFunc( "InGameJoin", f256_local6 )
		end
	else
		Engine.LobbyVM_CallFunc( "Join", f256_local6 )
	end
end

function LobbyJoinFromFriendsMenu( f257_arg0, f257_arg1, f257_arg2 )
	local f257_local0 = Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f257_arg2 ), "friends" ), "tab" ) )
	local f257_local1 = nil
	if f257_local0 == "friends" then
		f257_local1 = Enum.JoinType.JOIN_TYPE_FRIEND
	elseif f257_local0 == "recent" then
		f257_local1 = Enum.JoinType.JOIN_TYPE_NORMAL
	elseif f257_local0 == "groups" then
		f257_local1 = Enum.JoinType.JOIN_TYPE_FRIEND
	elseif f257_local0 == "inbox" then
		f257_local1 = Enum.JoinType.JOIN_TYPE_INVITE
	else
		f257_local1 = Enum.JoinType.JOIN_TYPE_NORMAL
	end
	LobbyQuickJoin( f257_arg0, f257_arg1, f257_arg2, f257_local1, true )
end

function LobbyInviteFriend( f258_arg0, f258_arg1, f258_arg2, f258_arg3 )
	local f258_local0, f258_local1 = nil
	if f258_arg3 then
		f258_local0 = f258_arg3.xuid
		f258_local1 = f258_arg3.gamertag
	else
		f258_local0 = Engine.GetModelValue( f258_arg1:getModel( f258_arg2, "xuid" ) )
		f258_local1 = Engine.GetModelValue( f258_arg1:getModel( f258_arg2, "gamertag" ) )
	end
	if f258_local0 ~= nil then
		if CoD.isPC == true then
			CoD.invitePlayer( f258_arg2, f258_local0 )
		else
			CoD.invitePlayerByGamertag( f258_arg2, f258_local0, f258_local1 )
		end
	end
end

function LobbyInviteFriendGoBack( f259_arg0, f259_arg1, f259_arg2, f259_arg3 )
	LobbyInviteFriend( f259_arg0, f259_arg1, f259_arg2, f259_arg3 )
	GoBack( f259_arg0, f259_arg2 )
end

function OnLoadToggleDebug( f260_arg0, f260_arg1 )
	if Dvar.ui_lobbyDebugVis:get() then
		f260_arg0.btnToggleDebug.buttoninternal0.Text0:setText( Engine.Localize( "ON" ) )
	else
		f260_arg0.btnToggleDebug.buttoninternal0.Text0:setText( Engine.Localize( "OFF" ) )
	end
end

function LobbyToggleDebug( f261_arg0, f261_arg1 )
	Dvar.ui_lobbyDebugVis:set( not Dvar.ui_lobbyDebugVis:get() )
	if Dvar.ui_lobbyDebugVis:get() then
		f261_arg0.btnToggleDebug.buttoninternal0.Text0:setText( Engine.Localize( "ON" ) )
	else
		f261_arg0.btnToggleDebug.buttoninternal0.Text0:setText( Engine.Localize( "OFF" ) )
	end
end

function LobbyToggleMsgLevel( f262_arg0, f262_arg1 )
	local f262_local0 = Dvar.ui_lobbyDebugMsgLevel:get() + 1
	if f262_local0 > 2 then
		f262_local0 = 0
	end
	Dvar.ui_lobbyDebugMsgLevel:set( f262_local0 )
	if f262_local0 == 0 then
		f262_arg0.btnToggleMsgLevel.buttoninternal0.Text0:setText( "PAUSED" )
	elseif f262_local0 == 1 then
		f262_arg0.btnToggleMsgLevel.buttoninternal0.Text0:setText( "LIMITED" )
	else
		f262_arg0.btnToggleMsgLevel.buttoninternal0.Text0:setText( "ALL" )
	end
end

function Lobby_SetMaxLocalPlayers( f263_arg0 )
	local f263_local0 = f263_arg0
	local f263_local1 = Engine.GetMaxLocalControllers()
	if f263_local1 < f263_local0 then
		f263_local0 = f263_local1
	end
	Dvar.lobby_maxLocalPlayers:set( f263_local0 )
end

function LobbyAddLocalClient( f264_arg0, f264_arg1 )
	if Dvar.ui_execdemo_beta:get() then
		return 
	elseif Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		if CoD.isPS4 then
			if Engine.DisplayNpAvailabilityErrors( f264_arg1 ) then
				return 
			elseif not Engine.DisplayUpsellAndContentWarnings( f264_arg1 ) then
				return 
			end
		end
		if CoD.isDurango and not Engine.IsUserGuest( f264_arg1 ) and not Engine.HasMPPrivileges( f264_arg1 ) and IsLuaCodeVersionAtLeast( 21 ) then
			if Engine.PrivilegeIsChecked( f264_arg1, 254 ) or not Engine.PrivilegeIsInDisplayInfoCache( f264_arg1, 254 ) then
				LuaUtils.UI_ShowErrorMessageDialog( f264_arg1, "XBOXLIVE_MPNOTALLOWED" )
				return 
			end
		end
	end
	local f264_local0 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f264_local0 = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if Engine.GetLobbyLocalClientCount( f264_local0 ) < Dvar.lobby_maxLocalPlayers:get() then
		local f264_local1 = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" ) )
		local f264_local2 = -1
		if f264_local1 == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
			f264_local2 = LuaEnums.FEATURE_BAN.MP_SPLIT_SCREEN
		elseif f264_local1 == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
			f264_local2 = LuaEnums.FEATURE_BAN.ZM_SPLIT_SCREEN
		elseif f264_local1 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
			f264_local2 = LuaEnums.FEATURE_BAN.CP_SPLIT_SCREEN
		end
		if f264_local2 >= 0 then
			for f264_local3 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
				if CheckIfFeatureIsBanned( f264_local3, f264_local2 ) then
					LuaUtils.UI_ShowErrorMessageDialog( f264_arg1, GetFeatureBanInfo( f264_local3, f264_local2 ) )
					return 
				end
			end
		end
		CoD.LobbyBase.UnusedGamepadButton( f264_arg0, f264_arg1 )
		if Engine.GetUsedControllerCount() == 3 then
			Engine.ExecNow( nil, "canceldemonwareconnect" )
			LuaUtils.UI_ShowWarningMessageDialog( f264_arg1, "MENU_RESTRICTED_TO_LOCAL_GAMES" )
		end
		local f264_local3 = Engine.DvarInt( nil, "bot_maxAllies" )
		local f264_local4 = Engine.DvarInt( nil, "bot_maxAxis" )
		local f264_local5 = Engine.DvarInt( nil, "bot_maxFree" )
		local f264_local6 = CoD.GameSettingsUtility.MaxSplitscreenBots
		if f264_local6 < f264_local3 + f264_local4 then
			Engine.SetDvar( "bot_maxAllies", f264_local6 / 2 )
			Engine.SetDvar( "bot_maxAxis", f264_local6 / 2 )
		end
		if f264_local6 < f264_local5 then
			Engine.SetDvar( "bot_maxFree", f264_local6 )
		end
		CoD.perController[Engine.GetPrimaryController()].localClientChanged = true
		ForceLobbyButtonUpdate( f264_arg1 )
	end
end

function LobbyRemoveLocalClientFromLobby( f265_arg0, f265_arg1 )
	if not Engine.IsControllerBeingUsed( f265_arg1 ) or f265_arg1 == Engine.GetPrimaryController() then
		return 
	else
		CoD.LobbyBase.RemoveLocalPlayerFromTheLobby( f265_arg0, f265_arg1 )
		CoD.perController[Engine.GetPrimaryController()].localClientChanged = true
		ForceLobbyButtonUpdate( f265_arg1 )
	end
end

function GroupCreationChangePrivacy( f266_arg0, f266_arg1, f266_arg2 )
	local f266_local0 = Engine.GetModelValue( f266_arg1:getModel( f266_arg2, "value" ) )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f266_arg2 ), "groups.createGroup.privacy" ), f266_local0 )
	if f266_local0 == Enum.GroupPrivacy.GROUP_PRIVACY_PUBLIC then
		GroupChangeSetTooltip( f266_arg0, f266_arg2, "PUBLIC" )
	elseif f266_local0 == Enum.GroupPrivacy.GROUP_PRIVACY_PRIVATE then
		GroupChangeSetTooltip( f266_arg0, f266_arg2, "PRIVATE" )
	end
end

function GroupsVariableOptionsSet( f267_arg0, f267_arg1, f267_arg2 )
	local f267_local0 = f267_arg1.Slider.activeWidget
	local f267_local1 = f267_local0:getModel( f267_arg2, "action" )
	local f267_local2 = f267_local0:getModel( f267_arg2, "param" )
	local f267_local3, f267_local4 = nil
	if f267_local1 then
		f267_local3 = Engine.GetModelValue( f267_local1 )
		if f267_local2 then
			f267_local4 = Engine.GetModelValue( f267_local2 )
		end
	else
		f267_local3 = f267_local0.action
		f267_local4 = f267_local0.actionParam
	end
	if f267_local3 then
		f267_local3( f267_arg0, f267_local0, f267_arg2, f267_local4, f267_local0.gridInfoTable.parentGrid.menu )
	end
end

function GroupChangePrivacy( f268_arg0, f268_arg1, f268_arg2 )
	if Engine.GetModelValue( Engine.GetModel( CoD.perController[f268_arg2].selectedGroup, "privacy" ) ) ~= f268_arg1.value then
		MarkGroupDataDirty( f268_arg2, "privacy", true )
		Engine.SetModelValue( Engine.GetModel( CoD.perController[f268_arg2].selectedGroup, "privacy" ), f268_arg1.value )
	end
end

function GroupChangeSearchParamGroupSize( f269_arg0, f269_arg1, f269_arg2 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f269_arg2 ), "groups.searchGroupsGroupSize" ), f269_arg1.value )
end

function GroupChangeSearchParamGroupType( f270_arg0, f270_arg1, f270_arg2 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f270_arg2 ), "groups.searchGroupsGroupType" ), f270_arg1.value )
end

function GroupChangeJoinApprovalType( f271_arg0, f271_arg1, f271_arg2 )
	if Engine.GetSelectedGroupJoinApprovalType() ~= f271_arg1.value then
		MarkGroupDataDirty( f271_arg2, "joinApprovalType", true )
		Engine.SetModelValue( Engine.GetModel( CoD.perController[f271_arg2].selectedGroup, "joinApprovalType" ), f271_arg1.value )
	end
end

function GroupChangeSetTooltip( f272_arg0, f272_arg1, f272_arg2 )
	local f272_local0 = Engine.CreateModel( Engine.GetModelForController( f272_arg1 ), "groups.createGroup.tooltip_title" )
	local f272_local1 = Engine.CreateModel( Engine.GetModelForController( f272_arg1 ), "groups.createGroup.tooltip_description" )
	Engine.SetModelValue( f272_local0, Engine.LocalizeWithoutLocsMarkers( "GROUPS_CREATE_" .. f272_arg2 .. "_DESC_TITLE" ) )
	Engine.SetModelValue( f272_local1, Engine.LocalizeWithoutLocsMarkers( "GROUPS_CREATE_" .. f272_arg2 .. "_DESC" ) )
end

function GroupToggleFriendInvite( f273_arg0, f273_arg1, f273_arg2 )
	if f273_arg1 ~= nil then
		local f273_local0 = f273_arg1:getParent()
		f273_local0 = f273_local0:getParent()
		local f273_local1 = f273_arg1:getModel( f273_arg2, "selected" )
		local f273_local2 = f273_arg1:getModel( f273_arg2, "xuid" )
		local f273_local3 = Engine.GetModel( Engine.GetModelForController( f273_arg2 ), "groups.createGroup.friends_invited_count" )
		local f273_local4 = Engine.GetModelValue( f273_local3 )
		if f273_local1 and f273_local2 then
			local f273_local5 = Engine.GetModelValue( f273_local1 )
			Engine.SetModelValue( f273_local1, not f273_local5 )
			local f273_local6 = Engine.GetModelValue( f273_local2 )
			if f273_local5 then
				Engine.SetModelValue( f273_local3, f273_local4 - 1 )
				Engine.AddFriendToInitialGroupInvitesList( f273_local6, true )
			else
				Engine.SetModelValue( f273_local3, f273_local4 + 1 )
				Engine.AddFriendToInitialGroupInvitesList( f273_local6, false )
			end
		end
	end
end

function ClearInitialGroupsInviteList( f274_arg0, f274_arg1, f274_arg2 )
	Engine.ClearInitialGroupInviteList()
end

function SetSelectingGroupEmblem( f275_arg0, f275_arg1, f275_arg2 )
	CoD.perController[f275_arg0].selectingGroupEmblem = f275_arg1
	CoD.perController[f275_arg0].selectingGroupEmblemForGroupCreation = f275_arg2
end

function SetState( f276_arg0, f276_arg1 )
	f276_arg0:setState( f276_arg1 )
end

function PulseElementToStateAndBack( f277_arg0, f277_arg1 )
	local f277_local0 = f277_arg0.currentState
	f277_arg0:setState( f277_arg1 )
	f277_arg0:setState( f277_local0 )
end

function SetMenuState( f278_arg0, f278_arg1 )
	f278_arg0:setState( f278_arg1 )
end

function SetElementState( f279_arg0, f279_arg1, f279_arg2, f279_arg3 )
	f279_arg1:setState( f279_arg3 )
end

function SetElementStateWithNoTransitionClip( f280_arg0, f280_arg1, f280_arg2, f280_arg3 )
	f280_arg1:setState( f280_arg3, true )
end

function SetElementStateByElementName( f281_arg0, f281_arg1, f281_arg2, f281_arg3 )
	if f281_arg0[f281_arg1] then
		f281_arg0[f281_arg1]:setState( f281_arg3 )
	end
end

function SetElementPropertyByElementName( f282_arg0, f282_arg1, f282_arg2, f282_arg3 )
	if f282_arg0[f282_arg1] then
		f282_arg0[f282_arg1][f282_arg2] = f282_arg3
	end
end

function SetElementDataSource( f283_arg0, f283_arg1, f283_arg2 )
	if f283_arg0[f283_arg1] then
		f283_arg0[f283_arg1]:setDataSource( f283_arg2 )
	end
end

function LockInput( f284_arg0, f284_arg1, f284_arg2 )
	if f284_arg2 ~= nil then
		Engine.LockInput( f284_arg1, f284_arg2 )
	end
end

function PrepareOpenMenuInSafehouse( f285_arg0 )
	if not CoD.isSafehouse then
		return 
	else
		CoD.perController[f285_arg0].inSafehouseMenu = true
		Engine.LockInput( f285_arg0, true )
		Engine.SetUIActive( f285_arg0, true )
	end
end

function PrepareCloseMenuInSafehouse( f286_arg0 )
	if not CoD.isSafehouse then
		return 
	else
		CoD.perController[f286_arg0].inSafehouseMenu = nil
		Engine.LockInput( f286_arg0, false )
		Engine.SetUIActive( f286_arg0, false )
	end
end

function SetupAutoHorizontalAlignArabicText( f287_arg0 )
	local f287_local0 = f287_arg0.setAlignment
	f287_arg0.setAlignment = function ( f288_arg0, f288_arg1 )
		if IsCurrentLanguageReversed() then
			if f288_arg1 & Enum.LUIAlignment.LUI_ALIGNMENT_LEFT ~= 0 then
				f288_arg1 = f288_arg1 & Enum.LUIAlignment.LUI_ALIGNMENT_VERTICAL_MASK | Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT
			elseif f288_arg1 & Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT ~= 0 then
				f288_arg1 = f288_arg1 & Enum.LUIAlignment.LUI_ALIGNMENT_VERTICAL_MASK | Enum.LUIAlignment.LUI_ALIGNMENT_LEFT
			end
		end
		f287_local0( f288_arg0, f288_arg1 )
	end
	
	local f287_local1
	if f287_arg0.getAlignment then
		f287_local1 = f287_arg0:getAlignment()
		if not f287_local1 then
		
		else
			f287_arg0:setAlignment( f287_local1 )
		end
	end
	f287_local1 = Enum.LUIAlignment.LUI_ALIGNMENT_LEFT
end

function ScaleWidgetToLabelCentered( f289_arg0, f289_arg1, f289_arg2 )
	if f289_arg1 == nil then
		return 
	else
		local f289_local0, f289_local1, f289_local2, f289_local3 = f289_arg0:getLocalLeftRight()
		local f289_local4, f289_local5, f289_local6, f289_local7 = f289_arg1:getLocalLeftRight()
		local f289_local8 = f289_arg1:getTextWidth()
		local f289_local9 = (f289_local3 + f289_local2) / 2
		local f289_local10 = f289_local8 + f289_arg2 * 2
		f289_arg0:setLeftRight( f289_local0, f289_local1, f289_local9 - f289_local10 / 2, f289_local9 + f289_local10 / 2 )
	end
end

function ScaleWidgetToLargerLabelCentered( f290_arg0, f290_arg1, f290_arg2, f290_arg3 )
	if f290_arg1 == nil or f290_arg2 == nil then
		return 
	else
		local f290_local0, f290_local1, f290_local2, f290_local3 = f290_arg0:getLocalLeftRight()
		local f290_local4 = math.max( f290_arg1:getTextWidth(), f290_arg2:getTextWidth() )
		local f290_local5 = (f290_local3 + f290_local2) / 2
		local f290_local6 = f290_local4 + f290_arg3 * 2
		f290_arg0:setLeftRight( f290_local0, f290_local1, f290_local5 - f290_local6 / 2, f290_local5 + f290_local6 / 2 )
	end
end

function ScaleWidgetToLabelCenteredWithMinimum( f291_arg0, f291_arg1, f291_arg2, f291_arg3 )
	if f291_arg1 == nil then
		return 
	else
		local f291_local0, f291_local1, f291_local2, f291_local3 = f291_arg0:getLocalLeftRight()
		local f291_local4 = f291_arg1:getTextWidth()
		local f291_local5 = (f291_local3 + f291_local2) / 2
		local f291_local6 = math.max( f291_local4 + f291_arg2 * 2, f291_arg3 )
		f291_arg0:setLeftRight( f291_local0, f291_local1, f291_local5 - f291_local6 / 2, f291_local5 + f291_local6 / 2 )
	end
end

function ScaleWidgetToLabelCenteredWrapped( f292_arg0, f292_arg1, f292_arg2, f292_arg3 )
	if f292_arg1 == nil then
		return 
	end
	local f292_local0, f292_local1, f292_local2, f292_local3 = f292_arg0:getLocalLeftRight()
	local f292_local4, f292_local5, f292_local6, f292_local7 = f292_arg1:getLocalLeftRight()
	if not f292_arg0._originalWidth then
		if f292_local4 == 0 and f292_local5 == 1 then
			f292_arg0._originalWidth = f292_local3 - f292_local2 + f292_local7 - f292_local6
		else
			f292_arg0._originalWidth = f292_local7 - f292_local6
		end
	end
	local f292_local8, f292_local9 = f292_arg1:getTextWidthAndHeight( f292_arg0._originalWidth )
	local f292_local10 = (f292_local3 + f292_local2) / 2
	local f292_local11 = f292_local8 + f292_arg2 * 2
	f292_arg0:setLeftRight( f292_local0, f292_local1, f292_local10 - f292_local11 / 2, f292_local10 + f292_local11 / 2 )
	local f292_local12, f292_local13, f292_local14, f292_local15 = f292_arg0:getLocalTopBottom()
	f292_arg0:setTopBottom( f292_local12, f292_local13, f292_local14, f292_local9 + f292_local14 + f292_arg3 )
end

function ScaleWidgetToLabelCore( f293_arg0, f293_arg1, f293_arg2, f293_arg3 )
	if f293_arg1 == nil then
		return 
	end
	local f293_local0, f293_local1, f293_local2, f293_local3 = f293_arg0:getLocalLeftRight()
	local f293_local4 = f293_arg1:getTextWidth()
	if Engine.IsCurrentLanguageReversed() and f293_arg3 then
		if f293_local4 > 0 then
			local f293_local5, f293_local6, f293_local7, f293_local8 = f293_arg1:getLocalLeftRight()
			f293_arg0.savedWidth = f293_local4 + 2 * f293_local7 + f293_arg2
			if not f293_arg0.widthOverridden then
				f293_arg0:setLeftRight( f293_local0, f293_local1, f293_local3 - f293_arg0.savedWidth, f293_local3 )
				if f293_local5 + f293_local6 == 0 then
					f293_arg1:setLeftRight( f293_local5, f293_local6, f293_local7, f293_local7 + f293_local4 )
				elseif f293_local5 == 0 and f293_local6 == 1 then
					f293_arg1:setLeftRight( f293_local5, f293_local6, f293_local7, f293_local8 )
				end
			end
		else
			f293_arg0:setLeftRight( f293_local0, f293_local1, f293_local3, f293_local3 )
		end
		return 
	end
	local f293_local5, f293_local6, f293_local7, f293_local8 = f293_arg1:getLocalLeftRight()
	if f293_local4 > 0 then
		f293_arg0.savedWidth = f293_local4 + 2 * f293_local7 + f293_arg2
		if not f293_arg0.widthOverridden then
			f293_arg0:setLeftRight( f293_local0, f293_local1, f293_local2, f293_local2 + f293_arg0.savedWidth )
		end
	else
		f293_arg0:setLeftRight( f293_local0, f293_local1, f293_local2, f293_local2 )
	end
end

function SetStateFromText( f294_arg0, f294_arg1, f294_arg2, f294_arg3 )
	local f294_local0 = f294_arg3
	if f294_arg1 and f294_arg1:getTextWidth() ~= 0 then
		f294_local0 = f294_arg2
	end
	f294_arg0:setState( f294_local0 )
end

function ScaleWidgetToLabel( f295_arg0, f295_arg1, f295_arg2 )
	ScaleWidgetToLabelCore( f295_arg0, f295_arg1, f295_arg2, true )
end

function ScaleWidgetToLabelLeftJustify( f296_arg0, f296_arg1, f296_arg2 )
	ScaleWidgetToLabelCore( f296_arg0, f296_arg1, f296_arg2, false )
end

function ScaleWidgetToLabelWithMinimum( f297_arg0, f297_arg1, f297_arg2, f297_arg3 )
	ScaleWidgetToLabelCore( f297_arg0, f297_arg1, f297_arg2, true, f297_arg3 )
end

function ScaleWidgetToLabelWrappedWithMinimum( f298_arg0, f298_arg1, f298_arg2, f298_arg3, f298_arg4 )
	if f298_arg1 == nil then
		return 
	end
	local f298_local0, f298_local1, f298_local2, f298_local3 = f298_arg0:getLocalLeftRight()
	local f298_local4, f298_local5, f298_local6, f298_local7 = f298_arg1:getLocalLeftRight()
	if not f298_arg0._originalWidth then
		f298_arg0._originalWidth = f298_local3 - f298_local2
	end
	if not Engine.IsCurrentLanguageReversed() then
		f298_arg1:setLeftRight( true, false, f298_local6, f298_local6 + f298_arg0._originalWidth )
	end
	local f298_local8, f298_local9 = f298_arg1:getTextWidthAndHeight( f298_arg0._originalWidth )
	f298_local8 = math.max( f298_local8, f298_arg4 )
	if Engine.IsCurrentLanguageReversed() then
		if f298_local8 > 0 then
			if f298_arg0._originalWidth < f298_local8 + 2 * f298_local6 + f298_arg2 then
				f298_local8 = f298_arg0._originalWidth - 2 * f298_local6 - f298_arg2
			end
			f298_arg0:setLeftRight( f298_local0, f298_local1, f298_local3 - f298_local8 - f298_local6 - f298_arg2, f298_local3 )
			if f298_local4 + f298_local5 == 0 then
				f298_arg1:setLeftRight( f298_local4, f298_local5, f298_local6, f298_local6 + f298_local8 )
			end
		else
			f298_arg0:setLeftRight( f298_local0, f298_local1, f298_local3, f298_local3 )
		end
	else
		if f298_arg0._originalWidth < f298_local8 then
			f298_local8 = f298_arg0._originalWidth
		end
		if f298_local8 > 0 then
			f298_arg0.savedWidth = f298_local8 + 2 * f298_local6 + f298_arg2
			f298_arg0:setLeftRight( f298_local0, f298_local1, f298_local2, f298_local2 + f298_arg0.savedWidth )
		else
			f298_arg0:setLeftRight( f298_local0, f298_local1, f298_local2, f298_local2 )
		end
	end
	local f298_local10, f298_local11, f298_local12, f298_local13 = f298_arg0:getLocalTopBottom()
	f298_arg0:setTopBottom( f298_local10, f298_local11, f298_local12, f298_local12 + f298_local9 + f298_arg3 )
end

function ScaleWidgetToLabelWrapped( f299_arg0, f299_arg1, f299_arg2, f299_arg3 )
	ScaleWidgetToLabelWrappedWithMinimum( f299_arg0, f299_arg1, f299_arg2, f299_arg3, 0 )
end

function ScaleWidgetToLabelWrappedUp( f300_arg0, f300_arg1, f300_arg2, f300_arg3 )
	if f300_arg1 == nil then
		return 
	end
	local f300_local0, f300_local1, f300_local2, f300_local3 = f300_arg0:getLocalLeftRight()
	local f300_local4, f300_local5, f300_local6, f300_local7 = f300_arg1:getLocalLeftRight()
	if not f300_arg0._originalWidth then
		f300_arg0._originalWidth = f300_local3 - f300_local2
	end
	if not Engine.IsCurrentLanguageReversed() then
		f300_arg1:setLeftRight( true, false, f300_local6, f300_local6 + f300_arg0._originalWidth )
	end
	local f300_local8, f300_local9 = f300_arg1:getTextWidthAndHeight( f300_arg0._originalWidth )
	if Engine.IsCurrentLanguageReversed() then
		if f300_local8 > 0 then
			if f300_arg0._originalWidth < f300_local8 then
				f300_arg0:setLeftRight( f300_local0, f300_local1, f300_local3 - f300_arg0._originalWidth, f300_local3 )
			else
				f300_arg0.savedWidth = f300_local8 + 2 * f300_local6 + f300_arg2
				f300_arg0:setLeftRight( f300_local0, f300_local1, f300_local3 - f300_arg0.savedWidth, f300_local3 )
				if f300_local4 + f300_local5 == 0 then
					f300_arg1:setLeftRight( f300_local4, f300_local5, f300_local6, f300_local6 + f300_local8 )
				end
			end
		else
			f300_arg0:setLeftRight( f300_local0, f300_local1, f300_local3, f300_local3 )
		end
		return 
	elseif f300_arg0._originalWidth < f300_local8 then
		f300_arg0:setLeftRight( f300_local0, f300_local1, f300_local2, f300_local2 + f300_arg0._originalWidth )
	elseif f300_local8 > 0 then
		f300_arg0.savedWidth = f300_local8 + 2 * f300_local6 + f300_arg2
		f300_arg0:setLeftRight( f300_local0, f300_local1, f300_local2, f300_local2 + f300_arg0.savedWidth )
	else
		f300_arg0:setLeftRight( f300_local0, f300_local1, f300_local2, f300_local2 )
	end
	local f300_local10, f300_local11, f300_local12, f300_local13 = f300_arg0:getLocalTopBottom()
	f300_arg0:setTopBottom( f300_local10, f300_local11, f300_local13 - f300_local9 - f300_arg3, f300_local13 )
end

function ScaleWidgetToLabelWrappedLeftAlign( f301_arg0, f301_arg1, f301_arg2, f301_arg3 )
	if not f301_arg1 then
		return 
	end
	local f301_local0, f301_local1, f301_local2, f301_local3 = f301_arg0:getLocalLeftRight()
	local f301_local4, f301_local5, f301_local6, f301_local7 = f301_arg1:getLocalLeftRight()
	if not f301_arg0._originalWidth then
		f301_arg0._originalWidth = f301_local3 - f301_local2
	end
	local f301_local8, f301_local9 = f301_arg1:getTextWidthAndHeight()
	if f301_arg0._originalWidth < f301_local8 or Engine.IsCurrentLanguageReversed() then
		f301_local8 = f301_arg0._originalWidth
	end
	if f301_local8 > 0 then
		f301_arg0.savedWidth = f301_local8 + 2 * f301_local6 + f301_arg2
		f301_arg0:setLeftRight( true, false, 0, f301_arg0.savedWidth )
	else
		f301_arg0:setLeftRight( f301_local0, f301_local1, f301_local2, f301_local2 )
	end
	local f301_local10, f301_local11, f301_local12, f301_local13 = f301_arg0:getLocalTopBottom()
	f301_arg0:setTopBottom( f301_local10, f301_local11, f301_local12, f301_local9 + f301_local12 + f301_arg3 )
end

function ScaleWidgetToLabelWrappedCenterAlign( f302_arg0, f302_arg1, f302_arg2, f302_arg3 )
	if not f302_arg1 then
		return 
	end
	local f302_local0, f302_local1, f302_local2, f302_local3 = f302_arg0:getLocalLeftRight()
	local f302_local4, f302_local5, f302_local6, f302_local7 = f302_arg1:getLocalLeftRight()
	if not f302_arg0._originalWidth then
		f302_arg0._originalWidth = f302_local3 - f302_local2
	end
	local f302_local8, f302_local9 = f302_arg1:getTextWidthAndHeight( f302_arg0._originalWidth )
	if f302_arg0._originalWidth < f302_local8 then
		f302_local8 = f302_arg0._originalWidth
	end
	if f302_local8 > 0 then
		f302_arg0.savedWidth = f302_local8 + 2 * f302_local6 + f302_arg2
		f302_arg0:setLeftRight( false, false, -f302_arg0.savedWidth / 2, f302_arg0.savedWidth / 2 )
	else
		f302_arg0:setLeftRight( f302_local0, f302_local1, f302_local2, f302_local2 )
	end
	local f302_local10, f302_local11, f302_local12, f302_local13 = f302_arg0:getLocalTopBottom()
	f302_arg0:setTopBottom( f302_local10, f302_local11, f302_local12, f302_local9 + f302_local12 + f302_arg3 )
end

function ScaleWidgetToLabelWrappedRightAlign( f303_arg0, f303_arg1, f303_arg2, f303_arg3 )
	if not f303_arg1 then
		return 
	end
	local f303_local0, f303_local1, f303_local2, f303_local3 = f303_arg0:getLocalLeftRight()
	local f303_local4, f303_local5, f303_local6, f303_local7 = f303_arg1:getLocalLeftRight()
	if not f303_arg0._originalWidth then
		f303_arg0._originalWidth = f303_local3 - f303_local2
	end
	local f303_local8, f303_local9 = f303_arg1:getTextWidthAndHeight( f303_arg0._originalWidth )
	if f303_arg0._originalWidth < f303_local8 then
		f303_local8 = f303_arg0._originalWidth
	end
	if f303_local8 > 0 then
		f303_arg0.savedWidth = f303_local8 + 2 * f303_local6 + f303_arg2
		f303_arg0:setLeftRight( false, true, -f303_arg0.savedWidth, 0 )
	else
		f303_arg0:setLeftRight( f303_local0, f303_local1, f303_local2, f303_local2 )
	end
	local f303_local10, f303_local11, f303_local12, f303_local13 = f303_arg0:getLocalTopBottom()
	f303_arg0:setTopBottom( f303_local10, f303_local11, f303_local12, f303_local9 + f303_local12 + f303_arg3 )
end

function UpdateWidgetHeightToMultilineText( f304_arg0, f304_arg1, f304_arg2 )
	local f304_local0, f304_local1 = f304_arg1:getTextWidthAndHeight()
	f304_arg0:setHeight( f304_local1 + f304_arg2 * 2 )
end

function UpdateWidgetHeightToMultilineTextWithMinimum( f305_arg0, f305_arg1, f305_arg2, f305_arg3 )
	local f305_local0, f305_local1 = f305_arg1:getTextWidthAndHeight()
	f305_arg0:setHeight( math.max( f305_local1 + f305_arg2 * 2, f305_arg3 ) )
end

function OverrideWidgetWidth( f306_arg0, f306_arg1 )
	local f306_local0, f306_local1, f306_local2, f306_local3 = f306_arg0:getLocalLeftRight()
	f306_arg0.savedWidth = f306_local3 - f306_local2
	f306_arg0.widthOverridden = true
	if f306_local1 == 0.5 and f306_local0 == 0.5 then
		f306_arg0.savedCenter = (f306_local2 + f306_local3) / 2
		f306_arg0:setLeftRight( f306_local0, f306_local1, f306_arg0.savedCenter - f306_arg1 / 2, f306_arg0.savedCenter + f306_arg1 / 2 )
	else
		f306_arg0.savedCenter = nil
		f306_arg0:setLeftRight( f306_local0, f306_local1, f306_local2, f306_local2 + f306_arg1 )
	end
	local f306_local4 = f306_arg0:getParent()
	if f306_local4 then
		f306_local4:setLayoutCached( false )
	end
end

function RestoreWidgetWidth( f307_arg0 )
	if f307_arg0.savedWidth == nil then
		return 
	end
	f307_arg0.widthOverridden = nil
	local f307_local0, f307_local1, f307_local2, f307_local3 = f307_arg0:getLocalLeftRight()
	if f307_arg0.savedCenter == nil then
		f307_arg0:setLeftRight( f307_local0, f307_local1, f307_local2, f307_local2 + f307_arg0.savedWidth )
	else
		f307_arg0:setLeftRight( f307_local0, f307_local1, f307_arg0.savedCenter - f307_arg0.savedWidth / 2, f307_arg0.savedCenter + f307_arg0.savedWidth / 2 )
	end
end

function SetWidth( f308_arg0, f308_arg1 )
	f308_arg0.savedWidth = f308_arg0:getWidth()
	f308_arg0:setWidth( f308_arg1 )
end

function ScaleToElementWidth( f309_arg0, f309_arg1 )
	local f309_local0, f309_local1, f309_local2, f309_local3 = f309_arg1:getLocalLeftRight()
	f309_arg0:setWidth( f309_local3 - f309_local2 )
end

function TrimLabelIfLanguageReversed( f310_arg0, f310_arg1 )
	if Engine.IsCurrentLanguageReversed() then
		if f310_arg1 == nil then
			return 
		else
			local f310_local0, f310_local1, f310_local2, f310_local3 = f310_arg1:getLocalLeftRight()
			f310_arg1:setLeftRight( f310_local0, f310_local1, f310_local2, f310_local2 + f310_arg1:getTextWidth() + 2 )
			return 
		end
	else
		
	end
end

function ScaleParentWidgetToLabel( f311_arg0, f311_arg1, f311_arg2 )
	local f311_local0 = f311_arg0 and f311_arg0:getParent()
	if f311_arg1 == nil or f311_local0 == nil then
		return 
	elseif f311_local0._originalWidth == nil then
		local f311_local1, f311_local2, f311_local3, f311_local4 = f311_local0:getLocalLeftRight()
		f311_local0._originalWidth = f311_local4 - f311_local3
	end
	if Engine.IsCurrentLanguageReversed() then
		local f311_local1, f311_local2, f311_local3, f311_local4 = f311_arg0:getLocalLeftRight()
		local f311_local5, f311_local6, f311_local7, f311_local8 = f311_local0:getLocalLeftRight()
		local f311_local9, f311_local10, f311_local11, f311_local12 = f311_arg1:getLocalLeftRight()
		local f311_local13 = f311_arg1:getTextWidth()
		f311_local0:setLeftRight( f311_local5, f311_local6, f311_local8 - f311_local13 - 2 * (f311_local3 + f311_local11) - f311_arg2, f311_local8 )
		if f311_local9 + f311_local10 == 0 then
			f311_arg1:setLeftRight( f311_local9, f311_local10, f311_local11, f311_local11 + f311_local13 + 2 )
		end
		return 
	end
	local f311_local1, f311_local2, f311_local3, f311_local4 = f311_arg0:getLocalLeftRight()
	local f311_local5, f311_local6, f311_local7, f311_local8 = f311_local0:getLocalLeftRight()
	local f311_local9, f311_local10, f311_local11, f311_local12 = f311_arg1:getLocalLeftRight()
	f311_local0:setLeftRight( f311_local5, f311_local6, f311_local7, f311_local7 + f311_arg1:getTextWidth() + 2 * (f311_local3 + f311_local11) + f311_arg2 )
end

function ScaleParentWidgetToElementLabel( f312_arg0, f312_arg1, f312_arg2 )
	if f312_arg0[f312_arg1] then
		ScaleParentWidgetToLabel( f312_arg0, f312_arg0[f312_arg1], f312_arg2 )
	end
end

function RestoreParentToOriginalWidth( f313_arg0 )
	local f313_local0 = f313_arg0 and f313_arg0:getParent()
	if f313_local0 and f313_local0._originalWidth ~= nil then
		local f313_local1, f313_local2, f313_local3, f313_local4 = f313_local0:getLocalLeftRight()
		f313_local0:setLeftRight( f313_local1, f313_local2, f313_local3, f313_local3 + f313_local0._originalWidth )
	end
end

function ScaleWidgetToLabelRightAligned( f314_arg0, f314_arg1, f314_arg2 )
	if f314_arg1 == nil then
		return 
	elseif Engine.IsCurrentLanguageReversed() then
		local f314_local0, f314_local1, f314_local2, f314_local3 = f314_arg0:getLocalLeftRight()
		local f314_local4, f314_local5, f314_local6, f314_local7 = f314_arg1:getLocalLeftRight()
		local f314_local8 = f314_arg1:getTextWidth()
		if f314_local4 + f314_local5 == 0 then
			f314_arg0:setLeftRight( f314_local0, f314_local1, f314_local3 - f314_local8 - 2 * f314_local6 - f314_arg2, f314_local3 )
		elseif f314_local5 == 1 then
			f314_arg0:setLeftRight( f314_local0, f314_local1, f314_local3 - f314_local8 + 2 * f314_local7 - f314_arg2, f314_local3 )
			f314_arg1:setLeftRight( f314_local4, f314_local5, f314_local7 - f314_local8 - f314_arg2, f314_local7 )
		end
	else
		local f314_local0, f314_local1, f314_local2, f314_local3 = f314_arg0:getLocalLeftRight()
		local f314_local4, f314_local5, f314_local6, f314_local7 = f314_arg1:getLocalLeftRight()
		f314_arg0:setLeftRight( f314_local0, f314_local1, f314_local3 - f314_arg1:getTextWidth() + 2 * f314_local7 - f314_arg2, f314_local3 )
	end
end

function ScaleWidgetToLabelRightAlignedNoReverse( f315_arg0, f315_arg1, f315_arg2 )
	if f315_arg1 == nil then
		return 
	else
		local f315_local0, f315_local1, f315_local2, f315_local3 = f315_arg0:getLocalLeftRight()
		local f315_local4, f315_local5, f315_local6, f315_local7 = f315_arg1:getLocalLeftRight()
		f315_arg0:setLeftRight( f315_local0, f315_local1, f315_local3 - f315_arg1:getTextWidth() + 2 * f315_local7 - f315_arg2, f315_local3 )
	end
end

function ScaleToFitImageElement( f316_arg0, f316_arg1, f316_arg2 )
	local f316_local0 = f316_arg0[f316_arg2]
	if f316_local0 then
		local f316_local1, f316_local2 = f316_local0:getImageDimensions()
		if f316_local1 > 0 and f316_local2 > 0 then
			local f316_local3, f316_local4, f316_local5 = f316_local0:getLocalLeftRight()
			local f316_local6, f316_local7, f316_local8, f316_local9 = f316_local0:getLocalTopBottom()
			local f316_local10, f316_local11, f316_local12, f316_local13 = f316_arg1:getLocalLeftRight()
			local f316_local14, f316_local15, f316_local16, f316_local17 = f316_arg1:getLocalTopBottom()
			f316_arg1:setLeftRight( true, false, f316_local12, math.floor( (f316_local5 * 2 + (f316_local17 + f316_local9 - f316_local8) * f316_local1 / f316_local2 - 1) / 2 ) * 2 )
			f316_arg1:setTopBottom( true, false, f316_local16, f316_local17 )
		end
	end
end

function CloseInGameMenu( f317_arg0, f317_arg1 )
	CoD.InGameMenu.CloseAllInGameMenus( f317_arg0, f317_arg1 )
end

function SetDOAGameMode( f318_arg0, f318_arg1, f318_arg2 )
	Engine.SetDvar( "cp_queued_level", "" )
	SetMap( f318_arg2, "cp_doa_bo3", false )
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

function StartDOAGame( f319_arg0, f319_arg1, f319_arg2 )
	if Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 4 then
		CoD.OverlayUtility.CreateOverlay( f319_arg2, f319_arg0, "LobbyLocalClientWarning", {
			controller = f319_arg2,
			maxLocalClients = 4
		} )
		return 
	else
		SetDOAGameMode( f319_arg0, f319_arg1, f319_arg2 )
		CoD.LobbyBase.LaunchGame( f319_arg0, f319_arg2, Enum.LobbyType.LOBBY_TYPE_GAME )
	end
end

function StartNewGame( f320_arg0, f320_arg1, f320_arg2 )
	if Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 2 then
		CoD.OverlayUtility.CreateOverlay( f320_arg2, f320_arg0, "LobbyLocalClientWarning", {
			controller = f320_arg2,
			maxLocalClients = 2
		} )
		return 
	else
		Dvar.lobby_maxLocalPlayers:set( 2 )
		Engine.SetDvar( "cp_queued_level", "" )
		SetMap( f320_arg2, LuaUtils.GetDefaultMap( LobbyData.GetCurrentMenuTarget() ), false )
		Engine.SetDvar( "ui_useloadingmovie", "1" )
		Engine.SetDvar( "skipto", "" )
		Engine.SetDvar( "sv_saveGameSkipto", "" )
		Engine.SetDvar( "ui_blocksaves", "0" )
		CoD.LobbyBase.LaunchGame( f320_arg0, f320_arg2, Enum.LobbyType.LOBBY_TYPE_GAME )
	end
end

function ReplaySelectedMission( f321_arg0, f321_arg1, f321_arg2 )
	Engine.SetDvar( "ui_useloadingmovie", "1" )
	Engine.SetDvar( "skipto", "" )
	Engine.SetDvar( "sv_saveGameSkipto", "" )
	Engine.SetDvar( "ui_blocksaves", "1" )
	CoD.LobbyBase.LaunchGame( f321_arg0, f321_arg2, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function ResumeFromCheckpoint( f322_arg0, f322_arg1, f322_arg2 )
	if Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 2 then
		CoD.OverlayUtility.CreateOverlay( f322_arg2, f322_arg0, "LobbyLocalClientWarning", {
			controller = f322_arg2,
			maxLocalClients = 2
		} )
		return 
	end
	Dvar.lobby_maxLocalPlayers:set( 2 )
	Engine.SetDvar( "cp_queued_level", "" )
	if Engine.IsCampaignModeZombies() then
		SetMap( f322_arg2, Engine.GetSavedMap(), false )
	else
		local f322_local0 = Engine.GetSavedMapQueuedMap()
		if f322_local0 ~= "" then
			SetMap( f322_arg2, f322_local0, true )
		else
			SetMap( f322_arg2, Engine.GetSavedMap(), false )
		end
	end
	local f322_local0 = Engine.GetSavedMapSkipto()
	Engine.RestoreSavedWorldObject()
	Engine.SetDvar( "ui_useloadingmovie", "1" )
	Engine.SetDvar( "skipto", f322_local0 )
	Engine.SetDvar( "sv_saveGameSkipto", f322_local0 )
	Engine.SetDvar( "ui_blocksaves", "0" )
	CoD.LobbyBase.LaunchGame( f322_arg0, f322_arg2, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function GotoSafehouse( f323_arg0, f323_arg1, f323_arg2 )
	if Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 2 then
		CoD.OverlayUtility.CreateOverlay( f323_arg2, f323_arg0, "LobbyLocalClientWarning", {
			controller = f323_arg2,
			maxLocalClients = 2
		} )
		return 
	end
	Dvar.lobby_maxLocalPlayers:set( 2 )
	local f323_local0 = Engine.GetSavedMapQueuedMap()
	if f323_local0 ~= "" then
		SetMap( f323_arg2, f323_local0, true )
	else
		SetMap( f323_arg2, Engine.GetSavedMap(), true )
	end
	Engine.RestoreSavedWorldObject()
	Engine.SetDvar( "ui_useloadingmovie", "1" )
	Engine.SetDvar( "skipto", "" )
	Engine.SetDvar( "sv_saveGameSkipto", "" )
	Engine.SetDvar( "ui_blocksaves", "1" )
	CoD.LobbyBase.LaunchGame( f323_arg0, f323_arg2, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function SetLobbyServerBrowserFilterForE3( f324_arg0, f324_arg1, f324_arg2 )
	local f324_local0 = nil
	if Dvar.ui_execdemo_cp:get() == true then
		f324_local0 = Enum.LobbyMainMode.LOBBY_MAINMODE_CP
	elseif Dvar.ui_execdemo_e3:get() == true or Dvar.ui_execdemo_e3_host:get() == true then
		f324_local0 = Enum.LobbyMainMode.LOBBY_MAINMODE_MP
	end
	if f324_local0 == nil then
		return 
	else
		Engine.LobbyServerListSetMainModeFilter( f324_local0 )
		CoD.LobbyBase.LobbyLANServerBrowserFilterUpdateEvent( f324_arg0, f324_arg2 )
	end
end

function CloseAllInGameMenus( f325_arg0, f325_arg1 )
	if not Dvar.ui_isSaving:get() then
		CoD.InGameMenu.CloseAllInGameMenus( f325_arg0, {
			name = "close_all_ingame_menus",
			controller = f325_arg1
		} )
	end
end

function GoBackThroughAllAndClose( f326_arg0, f326_arg1 )
	while f326_arg0 do
		while not f326_arg0.menuName do
			f326_arg0 = f326_arg0:getParent()
		end
		local f326_local0, f326_local1 = CoD.Menu.GetNavigationForMenu( f326_arg1, f326_arg0.menuName )
		if f326_local0 == 1 then
			Close( f326_arg0, f326_arg1 )
			return 
		end
		f326_arg0 = GoBack( f326_arg0, f326_arg1 )
	end
	while not f326_arg0.menuName do
		f326_arg0 = f326_arg0:getParent()
	end
	local f326_local0, f326_local1 = CoD.Menu.GetNavigationForMenu( f326_arg1, f326_arg0.menuName )
	if f326_local0 == 1 then
		Close( f326_arg0, f326_arg1 )
		return 
	end
	f326_arg0 = GoBack( f326_arg0, f326_arg1 )
end

function GoBackThroughAll( f327_arg0, f327_arg1 )
	while f327_arg0 do
		f327_arg0 = GoBack( f327_arg0, f327_arg1 )
	end
end

function LobbyGoBack( f328_arg0, f328_arg1 )
	local f328_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	if f328_local0 and Engine.GetModelValue( f328_local0 ) == LobbyData.UITargets.UI_MODESELECT.id then
		DisableAllMenuInput( f328_arg0, true )
	end
	CoD.LobbyBase.LobbyGoBack( f328_arg0, f328_arg1 )
	f328_arg0:playSound( "menu_go_back" )
end

function DisplayPlayGoWarning( f329_arg0, f329_arg1 )
	local f329_local0 = CoD.OverlayUtility.CreateOverlay( f329_arg1, f329_arg0, "GenericModalDialog", "", "MENU_STILLDOWNLOADING", "t7_icon_connect_overlays_bkg", {
		"MPUI_OK"
	}, function ( f330_arg0 )
		return true
	end )
	f329_local0.anyControllerAllowed = true
	f329_local0.unusedControllerAllowed = true
end

function LobbyBeginPlay( f331_arg0, f331_arg1 )
	if (IsOrbis() or IsDurango()) and (Engine.IsMpStillDownloading() or Engine.IsZmStillDownloading() or Engine.IsCpStillDownloading()) and not CoD.perController[f331_arg1].hasShownPlaygoWarning then
		CoD.perController[f331_arg1].hasShownPlaygoWarning = true
		DisplayPlayGoWarning( f331_arg0, f331_arg1 )
		return false
	else
		CoD.LobbyBase.BeginPlay( f331_arg0, f331_arg1 )
		return true
	end
end

function SizeToSafeArea( f332_arg0, f332_arg1 )
	f332_arg0:sizeToSafeArea( f332_arg1 )
end

function PartyHostSetState( f333_arg0, f333_arg1, f333_arg2 )
	Engine.PartyHostSetUIState( f333_arg2 )
end

function GoBackMultiple( f334_arg0, f334_arg1, f334_arg2 )
	local f334_local0 = f334_arg0
	local f334_local1 = tonumber( f334_arg2 )
	if f334_local1 == nil then
		return 
	end
	while f334_local1 > 0 do
		f334_local0 = GoBack( f334_local0, f334_arg1 )
		f334_local1 = f334_local1 - 1
	end
	return f334_local0
end

function GoBack( f335_arg0, f335_arg1 )
	if Rat and Rat.DisableGoBack then
		return 
	end
	while not f335_arg0.menuName do
		f335_arg0 = f335_arg0:getParent()
	end
	local f335_local0, f335_local1 = CoD.Menu.GetNavigationForMenu( f335_arg1, f335_arg0.menuName )
	if f335_local0 and f335_local1 then
		f335_arg0.previousMenuName = CoD.MenuNavigation[f335_arg1][f335_local0][f335_local1 - 1]
		CoD.MenuNavigation[f335_arg1][f335_local0][f335_local1] = nil
		if #CoD.MenuNavigation[f335_arg1][f335_local0] == 0 then
			table.remove( CoD.MenuNavigation[f335_arg1], f335_local0 )
		else
			
		end
	end
	f335_arg0:saveState()
	return f335_arg0:goBack( f335_arg1 )
end

function DelayGoBack( f336_arg0, f336_arg1 )
	f336_arg0:addElement( LUI.UITimer.newElementTimer( 0, true, function ()
		GoBack( f336_arg0, f336_arg1 )
	end ) )
end

function GoBackToMenu( f338_arg0, f338_arg1, f338_arg2 )
	local f338_local0, f338_local1 = CoD.Menu.GetNavigationForMenuToMenu( f338_arg1, f338_arg0.menuName, f338_arg2 )
	local f338_local2, f338_local3 = CoD.Menu.GetNavigationForMenu( f338_arg1, f338_arg0.menuName )
	local f338_local4, f338_local5 = CoD.Menu.GetNavigationForMenu( f338_arg1, f338_arg2 )
	if not f338_local2 or not f338_local3 or not f338_local4 or not f338_local5 then
		return GoBack( f338_arg0, f338_arg1 )
	elseif f338_arg0.menuName == f338_arg2 then
		return 
	elseif f338_arg0.occludedMenu and f338_arg0.occludedMenu.menuName == f338_arg2 then
		f338_arg0.previousMenuName = nil
		table.remove( CoD.MenuNavigation[f338_arg1], f338_local2 )
	elseif f338_local0 and f338_local1 then
		f338_arg0.previousMenuName = CoD.MenuNavigation[f338_arg1][f338_local0][f338_local1]
		local f338_local6 = #CoD.MenuNavigation[f338_arg1][f338_local0]
		for f338_local7 = f338_local1 + 1, f338_local6, 1 do
			CoD.MenuNavigation[f338_arg1][f338_local0][f338_local7] = nil
		end
		if #CoD.MenuNavigation[f338_arg1][f338_local0] == 0 then
			table.remove( CoD.MenuNavigation[f338_arg1], f338_local0 )
		end
		if f338_local2 ~= f338_local0 then
			table.remove( CoD.MenuNavigation[f338_arg1], f338_local2 )
		end
	elseif f338_arg0.occludedMenu then
		local f338_local6 = f338_arg0
		for f338_local7 = f338_local2, f338_local4 + 1, -1 do
			local f338_local10 = f338_local7
			if not f338_local6.occludedMenu then
				return f338_local6
			end
			f338_local6 = GoBackToMenu( f338_local6, f338_arg1, f338_local6.occludedMenu.menuName )
		end
		if f338_local6.menuName == f338_arg2 then
			return f338_local6
		end
		return GoBackToMenu( f338_local6, f338_arg1, f338_arg2 )
	end
	f338_arg0:saveState()
	return f338_arg0:goBack( f338_arg1 )
end

function GoBackAndUpdateStateOnPreviousMenu( f339_arg0, f339_arg1 )
	local f339_local0 = GoBack( f339_arg0, f339_arg1 )
	f339_local0:processEvent( {
		name = "update_state",
		controller = f339_arg1
	} )
	return f339_local0
end

function GoBackAndUpdateNavigation( f340_arg0, f340_arg1, f340_arg2 )
	local f340_local0 = GoBack( f340_arg0, f340_arg2 )
	if CoD.CACUtility.CustomClass_LastClassNum and f340_local0.menuName == "CustomClass" then
		f340_local0:navigateTo( CoD.CACUtility.CustomClass_LastSelection )
		f340_local0:processEvent( {
			name = "update_state",
			controller = f340_arg2
		} )
	end
	return f340_local0
end

function GoBackToCustomClassMenu( f341_arg0, f341_arg1 )
	local f341_local0 = GoBackToMenu( f341_arg0, f341_arg1, "CustomClass" )
	if f341_local0 then
		f341_local0:processEvent( {
			name = "update_state",
			controller = f341_arg1
		} )
		if f341_local0.menuName == "CustomClass" then
			SetFocusToLoadoutWidgetAfterSetItem( f341_local0 )
		end
	end
end

function Close( f342_arg0, f342_arg1 )
	while not f342_arg0.menuName do
		f342_arg0 = f342_arg0:getParent()
	end
	local f342_local0, f342_local1 = CoD.Menu.GetNavigationForMenu( f342_arg1, f342_arg0.menuName )
	if f342_local0 and f342_local1 then
		f342_arg0.previousMenuName = CoD.MenuNavigation[f342_arg1][f342_local0][f342_local1 - 1]
		CoD.MenuNavigation[f342_arg1][f342_local0][f342_local1] = nil
		if #CoD.MenuNavigation[f342_arg1][f342_local0] == 0 then
			table.remove( CoD.MenuNavigation[f342_arg1], f342_local0 )
		end
	end
	f342_arg0:saveState()
	f342_arg0:close()
end

function NavigateToLobby( f343_arg0, f343_arg1, f343_arg2, f343_arg3 )
	CoD.LobbyBase.NavigateToLobby( f343_arg0, f343_arg1, f343_arg2, f343_arg3 )
end

function NavigateToLobby_OccludedMenu( f344_arg0, f344_arg1, f344_arg2, f344_arg3, f344_arg4 )
	if f344_arg0.occludedMenu ~= nil then
		NavigateToLobby( f344_arg0.occludedMenu, f344_arg3, false, f344_arg2 )
	end
end

function NavigateToLobby_SelectionList( f345_arg0, f345_arg1, f345_arg2, f345_arg3, f345_arg4 )
	if f345_arg3 == "MPLobbyMain" then
		if Engine.PushAnticheatMessageToUI( f345_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.MP ) then
			DisplayAnticheatMessage( f345_arg0, f345_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.MP, "", "" )
			return 
		end
		for f345_local0 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
			if CheckIfFeatureIsBanned( f345_local0, LuaEnums.FEATURE_BAN.LIVE_MP ) then
				LuaUtils.UI_ShowErrorMessageDialog( f345_arg2, GetFeatureBanInfo( f345_local0, LuaEnums.FEATURE_BAN.LIVE_MP ) )
				return 
			end
		end
		if Engine.GetUsedControllerCount() > 1 then
			for f345_local1 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
				if CheckIfFeatureIsBanned( f345_local1, LuaEnums.FEATURE_BAN.MP_SPLIT_SCREEN ) then
					LuaUtils.UI_ShowErrorMessageDialog( f345_arg2, GetFeatureBanInfo( f345_local1, LuaEnums.FEATURE_BAN.MP_SPLIT_SCREEN ) )
					return 
				end
			end
		end
	end
	if f345_arg3 == "ZMLobbyOnline" then
		if Engine.PushAnticheatMessageToUI( f345_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.ZM ) then
			DisplayAnticheatMessage( f345_arg0, f345_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.ZM, "", "" )
			return 
		end
		for f345_local0 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
			if CheckIfFeatureIsBanned( f345_local0, LuaEnums.FEATURE_BAN.LIVE_ZM ) then
				LuaUtils.UI_ShowErrorMessageDialog( f345_arg2, GetFeatureBanInfo( f345_local0, LuaEnums.FEATURE_BAN.LIVE_ZM ) )
				return 
			end
		end
		if Engine.GetUsedControllerCount() > 1 then
			for f345_local1 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
				if CheckIfFeatureIsBanned( f345_local1, LuaEnums.FEATURE_BAN.ZM_SPLIT_SCREEN ) then
					LuaUtils.UI_ShowErrorMessageDialog( f345_arg2, GetFeatureBanInfo( f345_local1, LuaEnums.FEATURE_BAN.ZM_SPLIT_SCREEN ) )
					return 
				end
			end
		end
		local f345_local1 = Engine.StorageGetBuffer( f345_arg2, Enum.StorageFileType.STORAGE_ZM_LOADOUTS )
		if f345_local1 then
			local f345_local2 = f345_local1.cacLoadouts
			if f345_local2 then
				local f345_local3 = #f345_local2.variant
				for f345_local4 = 0, f345_local3 - 1, 1 do
					f345_local2.variant[f345_local4].variantIndex:set( f345_local4 )
				end
			end
		end
	end
	if f345_arg3 == "CPLobbyOnline" or f345_arg3 == "CPDOALobbyOnline" or f345_arg3 == "CP2LobbyOnline" then
		for f345_local0 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
			if CheckIfFeatureIsBanned( f345_local0, LuaEnums.FEATURE_BAN.LIVE_CP ) then
				LuaUtils.UI_ShowErrorMessageDialog( f345_arg2, GetFeatureBanInfo( f345_local0, LuaEnums.FEATURE_BAN.LIVE_CP ) )
				return 
			end
		end
		if Engine.GetUsedControllerCount() > 1 then
			for f345_local1 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
				if CheckIfFeatureIsBanned( f345_local1, LuaEnums.FEATURE_BAN.CP_SPLIT_SCREEN ) then
					LuaUtils.UI_ShowErrorMessageDialog( f345_arg2, GetFeatureBanInfo( f345_local1, LuaEnums.FEATURE_BAN.CP_SPLIT_SCREEN ) )
					return 
				end
			end
		end
	end
	if f345_arg3 == "MPLobbyOnline" then
		for f345_local0 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
			if CheckIfFeatureIsBanned( f345_local0, LuaEnums.FEATURE_BAN.MP_PUBLIC_MATCH ) then
				LuaUtils.UI_ShowErrorMessageDialog( f345_arg2, GetFeatureBanInfo( f345_local0, LuaEnums.FEATURE_BAN.MP_PUBLIC_MATCH ) )
				return 
			end
		end
	end
	if f345_arg3 == "MPLobbyOnlineArena" then
		if Engine.PushAnticheatMessageToUI( f345_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.ARENA ) then
			DisplayAnticheatMessage( f345_arg0, f345_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.ARENA, "", "" )
			return 
		end
		for f345_local0 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
			if CheckIfFeatureIsBanned( f345_local0, LuaEnums.FEATURE_BAN.ARENA_GAMEPLAY ) then
				LuaUtils.UI_ShowErrorMessageDialog( f345_arg2, GetFeatureBanInfo( f345_local0, LuaEnums.FEATURE_BAN.ARENA_GAMEPLAY ) )
				return 
			end
		end
	end
	if f345_arg3 == "MPLobbyOnlineArenaGame" then
		local f345_local1 = Engine.GetPlaylistMaxPartySize( Engine.GetPlaylistID() )
		if f345_local1 < Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyClientType.LOBBY_CLIENT_TYPE_ALL ) then
			LuaUtils.UI_ShowErrorMessageDialog( f345_arg2, Engine.Localize( "MENU_ARENA_TOO_MANY_PLAYERS", f345_local1 ) )
			return 
		end
	end
	if f345_arg3 == "FRLobbyOnlineGame" then
		for f345_local0 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
			if CheckIfFeatureIsBanned( f345_local0, LuaEnums.FEATURE_BAN.FREERUN ) then
				LuaUtils.UI_ShowErrorMessageDialog( f345_arg2, GetFeatureBanInfo( f345_local0, LuaEnums.FEATURE_BAN.FREERUN ) )
				return 
			end
		end
	end
	if f345_arg3 == "ZMLobbyOnlineCustomGame" then
		Dvar.zm_private_rankedmatch:set( Engine.GetProfileVarInt( f345_arg2, "com_privategame_ranked_zm" ) ~= 0 )
		Engine.SetPlaylistID( 150 )
		Engine.RunPlaylistRules( f345_arg2 )
	end
	local f345_local0 = LobbyData:UITargetFromName( f345_arg3 )
	if f345_local0.eGameModes == Enum.eGameModes.MODE_GAME_LEAGUE and Engine.DvarBool( nil, "arena_maintenance" ) == true then
		LuaUtils.UI_ShowErrorMessageDialog( f345_arg2, "MENU_ARENA_MAINTENANCE_DESC", "MENU_ARENA_MAINTENANCE_CAPS" )
		return 
	end
	local f345_local1 = Engine.DvarBool( 0, "probation_public_enabled" )
	local f345_local2 = Engine.DvarBool( 0, "probation_league_enabled" )
	if f345_local0.isGame and (f345_local0.eGameModes == Enum.eGameModes.MODE_GAME_MATCHMAKING_PLAYLIST or f345_local0.eGameModes == Enum.eGameModes.MODE_GAME_LEAGUE) then
		Engine.ProbationCheckForProbation( f345_arg2, f345_local0.eGameModes )
		local f345_local3 = Engine.LobbyClient_GetProbationTime( f345_arg2, f345_local0.eGameModes )
		if f345_local3 > 0 then
			local f345_local4 = Engine.SecondsAsTime( f345_local3 )
			if f345_local1 and f345_local0.eGameModes == Enum.eGameModes.MODE_GAME_MATCHMAKING_PLAYLIST then
				LuaUtils.UI_ShowErrorMessageDialog( f345_arg2, Engine.Localize( "MENU_PROBATION_GIVEN_PUBLIC_MATCH", f345_local4 ), "MENU_PROBATION_CAPS" )
				return 
			elseif f345_local2 and f345_local0.eGameModes == Enum.eGameModes.MODE_GAME_LEAGUE then
				LuaUtils.UI_ShowErrorMessageDialog( f345_arg2, Engine.Localize( "MENU_PROBATION_GIVEN_ARENA_MATCH", f345_local4 ), "MENU_PROBATION_CAPS" )
				return 
			end
		elseif Engine.LobbyHost_AnyClientInProbationForGameMode( f345_local0.eGameModes ) then
			if f345_local1 and f345_local0.eGameModes == Enum.eGameModes.MODE_GAME_MATCHMAKING_PLAYLIST then
				LuaUtils.UI_ShowErrorMessageDialog( f345_arg2, "MENU_PROBATION_PARTY_PUBLIC_MATCH" )
				return 
			elseif f345_local2 and f345_local0.eGameModes == Enum.eGameModes.MODE_GAME_LEAGUE then
				LuaUtils.UI_ShowErrorMessageDialog( f345_arg2, "MENU_PROBATION_PARTY_ARENA_MATCH" )
				return 
			end
		end
	end
	UpdateDifficulty( f345_arg0, f345_arg3, f345_arg2 )
	NavigateToLobby( f345_arg4, f345_arg3, false, f345_arg2 )
end

function NavigateToLobby_FirstTimeFlowMP( f346_arg0, f346_arg1, f346_arg2, f346_arg3 )
	if IsLAN() then
		NavigateToLobby_SelectionList( f346_arg0, f346_arg1, f346_arg2, LobbyData.UITargets.UI_MPLOBBYLANGAME.name, f346_arg3 )
	else
		NavigateToLobby_SelectionList( f346_arg0, f346_arg1, f346_arg2, LobbyData.UITargets.UI_MPLOBBYMAIN.name, f346_arg3 )
	end
end

function NavigateToLobby_FirstTimeFlowCP( f347_arg0, f347_arg1, f347_arg2, f347_arg3 )
	if IsLAN() then
		NavigateToLobby_SelectionList( f347_arg0, f347_arg1, f347_arg2, LobbyData.UITargets.UI_CPLOBBYLANGAME.name, f347_arg3 )
	else
		NavigateToLobby_SelectionList( f347_arg0, f347_arg1, f347_arg2, LobbyData.UITargets.UI_CPLOBBYONLINE.name, f347_arg3 )
	end
end

function NavigateToLobby_SelectionListCampaignZombies( f348_arg0, f348_arg1, f348_arg2, f348_arg3, f348_arg4 )
	if IsLAN() then
		NavigateToLobby_SelectionList( f348_arg0, f348_arg1, f348_arg2, LobbyData.UITargets.UI_CP2LOBBYLANGAME.name, f348_arg4 )
	else
		NavigateToLobby_SelectionList( f348_arg0, f348_arg1, f348_arg2, LobbyData.UITargets.UI_CP2LOBBYONLINE.name, f348_arg4 )
	end
end

function NavigateToLobby_SelectionListDOA( f349_arg0, f349_arg1, f349_arg2, f349_arg3, f349_arg4 )
	if IsLAN() then
		NavigateToLobby_SelectionList( f349_arg0, f349_arg1, f349_arg2, LobbyData.UITargets.UI_DOALOBBYLANGAME.name, f349_arg4 )
	else
		NavigateToLobby_SelectionList( f349_arg0, f349_arg1, f349_arg2, LobbyData.UITargets.UI_DOALOBBYONLINE.name, f349_arg4 )
	end
end

function NavigateToMenu( f350_arg0, f350_arg1, f350_arg2, f350_arg3 )
	while f350_arg0 and not f350_arg0.openMenu do
		f350_arg0 = f350_arg0:getParent()
	end
	if not f350_arg0 then
		return 
	elseif not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	if not CoD.MenuNavigation[f350_arg3] then
		CoD.MenuNavigation[f350_arg3] = {
			{
				f350_arg0.menuName
			}
		}
	end
	local f350_local0, f350_local1 = CoD.Menu.GetNavigationForMenu( f350_arg3, f350_arg0.menuName )
	if not f350_local0 or not f350_local1 then
		CoD.MenuNavigation[f350_arg3] = {
			{
				f350_arg0.menuName
			}
		}
		f350_local0, f350_local1 = CoD.Menu.GetNavigationForMenu( f350_arg3, f350_arg0.menuName )
	end
	local f350_local2 = f350_arg0.userData
	local f350_local3 = f350_arg0.menuName
	local f350_local4 = f350_arg0.occludedMenu
	local f350_local5 = f350_arg0:getParent()
	f350_arg0:saveState()
	f350_arg0:close()
	local f350_local6 = f350_arg0:replaceMenu( f350_arg1, f350_arg3, nil, f350_local2, f350_local3, f350_local4, f350_local5 )
	if f350_local0 and f350_local1 then
		if f350_arg2 then
			table.insert( CoD.MenuNavigation[f350_arg3][f350_local0], f350_local1 + 1, f350_local6.menuName )
		else
			CoD.MenuNavigation[f350_arg3][f350_local0][f350_local1] = f350_local6.menuName
		end
	end
	return f350_local6
end

function NavigateToMenuNoDependency( f351_arg0, f351_arg1, f351_arg2, f351_arg3 )
	NavigateToMenu( f351_arg0, f351_arg1, f351_arg2, f351_arg3 )
end

function OpenPopup( f352_arg0, f352_arg1, f352_arg2, f352_arg3, f352_arg4 )
	local f352_local0 = f352_arg0
	while f352_local0 and not f352_local0.openMenu do
		f352_local0 = f352_local0:getParent()
	end
	if f352_arg3 == "" then
		f352_arg3 = nil
	end
	if f352_arg4 == "" then
		f352_arg4 = nil
	end
	local f352_local1 = f352_local0:openPopup( f352_arg1, f352_arg2, f352_arg3, f352_arg4 )
	if not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	if not CoD.MenuNavigation[f352_arg2] then
		CoD.MenuNavigation[f352_arg2] = {}
	end
	local f352_local2, f352_local3 = CoD.Menu.GetNavigationForMenu( f352_arg2, f352_arg0.menuName )
	if f352_local2 and f352_local3 then
		table.insert( CoD.MenuNavigation[f352_arg2], f352_local2 + 1, {
			f352_local1.menuName
		} )
	else
		table.insert( CoD.MenuNavigation[f352_arg2], {
			f352_local1.menuName
		} )
	end
	return f352_local1
end

function OpenPopup_NoDependency( f353_arg0, f353_arg1, f353_arg2 )
	return OpenPopup( f353_arg0, f353_arg1, f353_arg2 )
end

function OpenPopupWithPriority( f354_arg0, f354_arg1, f354_arg2, f354_arg3 )
	local f354_local0 = OpenPopup( f354_arg0, f354_arg1, f354_arg2 )
	f354_local0:setPriority( f354_arg3 )
end

function OpenOverlay( f355_arg0, f355_arg1, f355_arg2, f355_arg3, f355_arg4 )
	local f355_local0 = f355_arg0
	while f355_local0 and not f355_local0.openMenu do
		f355_local0 = f355_local0:getParent()
	end
	if f355_arg3 == "" then
		f355_arg3 = nil
	end
	if f355_arg4 == "" then
		f355_arg4 = nil
	end
	local f355_local1 = f355_local0.occludedBy
	if f355_local1 then
		f355_local1 = f355_local0.occludedBy.id == "Menu.MessageDialogBox"
	end
	if f355_local1 then
		f355_local0.occludedBy:close()
	end
	local f355_local2 = f355_local0:openOverlay( f355_arg1, f355_arg2, f355_arg3, f355_arg4 )
	if not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	if not CoD.MenuNavigation[f355_arg2] then
		CoD.MenuNavigation[f355_arg2] = {}
	end
	table.insert( CoD.MenuNavigation[f355_arg2], {
		f355_local2.menuName
	} )
	if f355_local1 then
		LuaUtils.MessageDialogForceSubscriptionFire( true )
	end
	return f355_local2
end

function OpenOverlay_NoDependency( f356_arg0, f356_arg1, f356_arg2, f356_arg3, f356_arg4 )
	OpenOverlay( f356_arg0, f356_arg1, f356_arg2, f356_arg3, f356_arg4 )
end

function OpenSystemOverlay( f357_arg0, f357_arg1, f357_arg2, f357_arg3, f357_arg4 )
	CoD.OverlayUtility.CreateOverlay( f357_arg2, f357_arg1, f357_arg3, f357_arg2, f357_arg4 )
end

function OpenBlackMarketUnspentBundlePopupIfNeeded( f358_arg0, f358_arg1 )
	local f358_local0
	if IsBundleActive( f358_arg1 ) or CoD.BlackMarketUtility.GetCurrentBundleCount( f358_arg1 ) <= 0 then
		f358_local0 = false
	else
		f358_local0 = true
	end
	if not f358_local0 then
		if IsHundredBundleActive( f358_arg1 ) or CoD.BlackMarketUtility.GetCurrentHundredBundleCount( f358_arg1 ) <= 0 then
			f358_local0 = false
		else
			f358_local0 = true
		end
	end
	if not f358_local0 then
		if IsRareBundle10for5Active( f358_arg1 ) or CoD.BlackMarketUtility.GetCurrentRareBundle10for5Count( f358_arg1 ) <= 0 then
			f358_local0 = false
		else
			f358_local0 = true
		end
	end
	if f358_local0 then
		CoD.OverlayUtility.CreateOverlay( f358_arg1, f358_arg0, "PurchaseSupplyDropConfirmation", f358_arg1, {
			displayText = "MPUI_BM_RARE_DROP",
			image = "uie_t7_blackmarket_crate_bundle_open",
			itemCost = 0,
			itemCODPointCost = 0,
			supplyDropType = CoD.BlackMarketUtility.DropTypes.BUNDLE
		} )
	end
end

function OpenBlackMarketWeaponContractErrorPopupIfNeeded( f359_arg0, f359_arg1 )
	if Engine.AreStatsFetched( f359_arg1 ) and Engine.IsLootReady( f359_arg1 ) and (LuaUtils.IsWeaponContractNeeded( f359_arg1 ) or (Engine.GetCryptokeysDue( f359_arg1 ) or 0) > 0) then
		local f359_local0 = CoD.OverlayUtility.CreateOverlay( f359_arg1, f359_arg0, "BMContractNotificationPopup", f359_arg1, "MPUI_BM_INCENTIVE_ERROR_TITLE" )
	end
end

function OpenBlackMarketExperimentPromoPopupIfNeeded( f360_arg0, f360_arg1 )
	if IsExperimentPromotionActive( f360_arg1 ) and Engine.AreStatsFetched( f360_arg1 ) and Engine.IsLootReady( f360_arg1 ) then
		local f360_local0 = Engine.StorageGetBuffer( f360_arg1, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		f360_local0 = f360_local0.extraBytes[2]
		if f360_local0:get() < Engine.DvarInt( nil, "loot_experimentpromo_index" ) then
			CoD.OverlayUtility.CreateOverlay( f360_arg1, f360_arg0, "InitialExperimentPromoOverlay", f360_arg1, {
				groupIndex = Engine.ExperimentsGetVariant( f360_arg1, Engine.DvarString( nil, "loot_experimentpromo_name" ) ),
				statToMarkAsSeen = f360_local0
			} )
		end
	end
end

function PerformOverlayBack( f361_arg0, f361_arg1, f361_arg2, f361_arg3 )
	if HasOverlayBackAction( f361_arg3 ) then
		f361_arg3[CoD.OverlayUtility.GoBackPropertyName]( f361_arg0, f361_arg1, f361_arg2, f361_arg3 )
	end
end

function PerformOverlayContinue( f362_arg0, f362_arg1, f362_arg2, f362_arg3 )
	if HasOverlayContinueAction( f362_arg3 ) then
		f362_arg3[CoD.OverlayUtility.ContinuePropertyName]( f362_arg0, f362_arg1, f362_arg2, f362_arg3 )
	end
end

function GoBackAndOpenStoreCodPointsOverlayOnParent( f363_arg0, f363_arg1, f363_arg2 )
	local f363_local0 = GoBack( f363_arg0, f363_arg2 )
	OpenCodPointsStore( f363_local0, f363_local0, f363_arg2, f363_arg1, f363_local0 )
end

function GoBackAndOpenStoreDLCOverlayOnParent( f364_arg0, f364_arg1, f364_arg2 )
	local f364_local0 = GoBack( f364_arg0, f364_arg2 )
	OpenDLCStore( f364_local0, f364_local0, f364_arg2, f364_arg1, f364_local0 )
end

function GoBackAndOpenOverlayOnParent( f365_arg0, f365_arg1, f365_arg2 )
	OpenOverlay( GoBack( f365_arg0, f365_arg2 ), f365_arg1, f365_arg2 )
end

function GoBackAndOpenSystemOverlayOnParent( f366_arg0, f366_arg1, f366_arg2, f366_arg3 )
	OpenSystemOverlay( f366_arg0, GoBack( f366_arg0, f366_arg1 ), f366_arg1, f366_arg2, f366_arg3 )
end

function GoBackAndOpenPopupOnParent( f367_arg0, f367_arg1, f367_arg2 )
	OpenPopup( GoBack( f367_arg0, f367_arg2 ), f367_arg1, f367_arg2 )
end

function GenericSmallPopupGoBack( f368_arg0, f368_arg1 )
	if f368_arg0.customGoBackAction then
		f368_arg0:customGoBackAction( f368_arg1 )
	else
		GoBack( f368_arg0, f368_arg1 )
	end
end

function OpenGenericSmallPopup( f369_arg0, f369_arg1, f369_arg2, f369_arg3, f369_arg4, f369_arg5, f369_arg6, f369_arg7 )
	return CoD.OverlayUtility.CreateOverlay( f369_arg1, f369_arg0, "GenericPopup", CoD.OverlayUtility.GenericPopupSizes.Small, f369_arg2, f369_arg3, f369_arg4, f369_arg5, f369_arg6, f369_arg7 )
end

function OpenGenericLargePopup( f370_arg0, f370_arg1, f370_arg2, f370_arg3, f370_arg4, f370_arg5, f370_arg6, f370_arg7 )
	return CoD.OverlayUtility.CreateOverlay( f370_arg1, f370_arg0, "GenericPopup", CoD.OverlayUtility.GenericPopupSizes.Large, f370_arg2, f370_arg3, f370_arg4, f370_arg5, f370_arg6, f370_arg7 )
end

function SendMenuResponse( f371_arg0, f371_arg1, f371_arg2, f371_arg3 )
	Engine.SendMenuResponse( f371_arg3, f371_arg1, f371_arg2 )
end

function SendMenuResponseExpression( f372_arg0, f372_arg1, f372_arg2 )
	Engine.SendMenuResponse( f372_arg0, f372_arg1, f372_arg2 )
end

function SendOwnMenuResponse( f373_arg0, f373_arg1, f373_arg2 )
	Engine.SendMenuResponse( f373_arg1, f373_arg0.menuName, f373_arg2 )
end

function SendFrontendControllerZeroMenuResponse( f374_arg0, f374_arg1, f374_arg2 )
	if CoD.isFrontend then
		f374_arg0 = 0
	end
	Engine.SendMenuResponse( f374_arg0, f374_arg1, f374_arg2 )
end

function ClearSavedState( f375_arg0, f375_arg1 )
	f375_arg0:clearSavedState()
end

function ClearMenuSavedState( f376_arg0 )
	f376_arg0:clearSavedState()
end

function PlayClip( f377_arg0, f377_arg1, f377_arg2 )
	f377_arg0:playClip( f377_arg1 )
end

function PlayClipOnElement( f378_arg0, f378_arg1, f378_arg2 )
	if f378_arg0[f378_arg1.elementName] then
		f378_arg0[f378_arg1.elementName]:playClip( f378_arg1.clipName )
	end
end

function PlayClipOnListItemElement( f379_arg0, f379_arg1, f379_arg2, f379_arg3 )
	f379_arg1:playClip( f379_arg3 )
end

function SetFocusToElement( f380_arg0, f380_arg1, f380_arg2 )
	if f380_arg0[f380_arg1] then
		f380_arg0[f380_arg1]:processEvent( {
			name = "gain_focus",
			controller = f380_arg2
		} )
	end
end

function SetLoseFocusToElement( f381_arg0, f381_arg1, f381_arg2 )
	if f381_arg0[f381_arg1] then
		f381_arg0[f381_arg1]:processEvent( {
			name = "lose_focus",
			controller = f381_arg2
		} )
	end
end

function MakeElementFocusable( f382_arg0, f382_arg1, f382_arg2 )
	if f382_arg0[f382_arg1] then
		f382_arg0[f382_arg1]:makeFocusableWithoutResettingNavigation( f382_arg0 )
	end
end

function MakeElementNotFocusable( f383_arg0, f383_arg1, f383_arg2 )
	if f383_arg0[f383_arg1] then
		f383_arg0[f383_arg1]:makeNotFocusable( f383_arg0 )
	end
end

function MakeSiblingFocusable( f384_arg0, f384_arg1, f384_arg2 )
	while not f384_arg0.menuName and not f384_arg0[f384_arg1] do
		f384_arg0 = f384_arg0:getParent()
	end
	if f384_arg0[f384_arg1] then
		f384_arg0[f384_arg1]:makeFocusableWithoutResettingNavigation( f384_arg0 )
	end
end

function MakeSiblingNotFocusable( f385_arg0, f385_arg1, f385_arg2 )
	while not f385_arg0.menuName and not f385_arg0[f385_arg1] do
		f385_arg0 = f385_arg0:getParent()
	end
	if f385_arg0[f385_arg1] then
		f385_arg0[f385_arg1]:makeNotFocusable( f385_arg0 )
	end
end

function MakeFocusable( f386_arg0 )
	f386_arg0:makeFocusableWithoutResettingNavigation()
end

function MakeNotFocusable( f387_arg0 )
	f387_arg0:makeNotFocusable()
end

function DisableNavigation( f388_arg0, f388_arg1 )
	f388_arg0[f388_arg1].m_disableNavigation = true
end

function EnableNavigation( f389_arg0, f389_arg1 )
	f389_arg0[f389_arg1].m_disableNavigation = false
end

function DisableAllMenuInput( f390_arg0, f390_arg1 )
	f390_arg0.m_disableAllButtonActions = f390_arg1
end

function ClearNavigationTable( f391_arg0 )
	f391_arg0:clearNavigationTable()
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

function OpenOptionsMenu( f396_arg0, f396_arg1, f396_arg2 )
	local f396_local0 = f396_arg0
	while f396_local0 and not f396_local0.openMenu do
		f396_local0 = f396_local0:getParent()
	end
	f396_local0:saveState()
	f396_local0:openMenu( "OptionsMenu", f396_arg2 )
	f396_local0:close()
end

function LoadSaveGameData( f397_arg0, f397_arg1 )
	Engine.LoadSaveGame()
end

function RestartMission( f398_arg0, f398_arg1, f398_arg2 )
	local f398_local0 = f398_arg0
	while f398_local0 and not f398_local0.openMenu do
		f398_local0 = f398_local0:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( f398_arg2, f398_local0, "RestartMissionPopup" )
end

function EndTrainingSim( f399_arg0, f399_arg1, f399_arg2 )
	Engine.SendMenuResponse( f399_arg2, "StartMenu", "EndTrainingSim" )
	StartMenuResumeGame( f399_arg0, f399_arg2 )
	GoBack( f399_arg0, f399_arg2 )
end

function CPSelectPublicGameGetRandomMap( f400_arg0, f400_arg1, f400_arg2 )
	local f400_local0 = {}
	local f400_local1 = Engine.IsCampaignModeZombies()
	for f400_local6, f400_local7 in LUI.IterateTableBySortedKeys( CoD.mapsTable, function ( f401_arg0, f401_arg1 )
		return CoD.mapsTable[f401_arg0].unique_id < CoD.mapsTable[f401_arg1].unique_id
	end, nil ) do
		local f400_local5
		if f400_local7.campaign_mode ~= Enum.CampaignMode.CAMPAIGNMODE_DEFAULT or f400_local1 then
			if f400_local7.campaign_mode == Enum.CampaignMode.CAMPAIGNMODE_ZOMBIES then
				f400_local5 = f400_local1
			else
				f400_local5 = false
			end
		else
			f400_local5 = true
		end
		if f400_local5 then
			f400_local5 = f400_local6 ~= "cp_doa_bo3"
		end
		if f400_local7.session_mode == Enum.eModes.MODE_CAMPAIGN and f400_local5 and f400_local7.dlc_pack ~= -1 and f400_local7.isSubLevel == false then
			table.insert( f400_local0, {
				properties = {
					mapId = f400_local6
				}
			} )
		end
	end
	if f400_local0 ~= nil and #f400_local0 > 0 then
		f400_local2 = math.random
		f400_local3 = 1
		return f400_local0[f400_local2( 1, #f400_local0 )].properties.mapId
	else
		return LuaUtils.GetDefaultMap( LobbyData.GetCurrentMenuTarget() )
	end
end

function CPSelectPublicGame( f402_arg0, f402_arg1, f402_arg2, f402_arg3, f402_arg4 )
	local f402_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.cpPublicLobbySearchAll" )
	Engine.SetModelValue( f402_local0, false )
	Engine.SetDvar( "ui_useloadingmovie", "1" )
	Engine.SetDvar( "skipto", "" )
	Engine.SetDvar( "sv_saveGameSkipto", "" )
	Engine.SetDvar( "ui_blocksaves", "1" )
	if f402_arg3 == "specificMission" then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "cpLobby" ), "public" )
		GoBackAndOpenPopupOnParent( f402_arg0, "CPMissionSelect", f402_arg2 )
		return 
	elseif f402_arg3 == "anyMission" then
		f402_arg1.mapId = CPSelectPublicGameGetRandomMap( f402_arg0, f402_arg1, f402_arg2 )
	else
		f402_arg1.mapId = Engine.GetSavedMap()
		if CoD.mapsTable[f402_arg1.mapId] ~= nil and CoD.mapsTable[f402_arg1.mapId].isSafeHouse then
			f402_arg1.mapId = Engine.GetSavedMapQueuedMap()
		end
	end
	SetSelectedCPMission( f402_arg0, f402_arg1, f402_arg2 )
	Engine.SetPlaylistID( GetPlaylistIDForSelectedCPMission( f402_arg0, f402_arg1, f402_arg2 ) )
	if f402_arg3 == "anyMission" then
		Engine.SetModelValue( f402_local0, true )
	end
	local f402_local1 = Engine.GetModeName()
	if Engine.IsCampaignModeZombies() then
		f402_local1 = f402_local1 .. "2"
	end
	if f402_local1 == "Invalid" then
		if nil ~= LUI.DEV then
			error( "Invalid mode in matchmaking" )
		else
			return 
		end
	end
	local f402_local2 = f402_local1 .. "LobbyOnlinePublicGame"
	local f402_local3 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	GoBack( f402_arg0, f402_arg2 )
	NavigateToLobby( f402_arg0, f402_local2, false, f402_arg2 )
end

function RestartFromCheckpoint( f403_arg0, f403_arg1, f403_arg2 )
	local f403_local0 = f403_arg0
	while f403_local0 and not f403_local0.openMenu do
		f403_local0 = f403_local0:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( f403_arg2, f403_local0, "RestartCheckpointPopup" )
end

function LaunchLevel( f404_arg0, f404_arg1, f404_arg2 )
	local f404_local0 = Engine.GetModelValue( f404_arg1:getModel( f404_arg2, "devName" ) )
	if f404_local0 ~= "" then
		Engine.Exec( f404_arg2, "devmap " .. f404_local0 )
	end
end

function QuitGame( f405_arg0, f405_arg1, f405_arg2 )
	local f405_local0 = f405_arg0
	while f405_local0 and not f405_local0.openMenu do
		f405_local0 = f405_local0:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( f405_arg2, f405_local0, "QuitGamePopup" )
end

function SaveAndQuitGame( f406_arg0, f406_arg1, f406_arg2 )
	local f406_local0 = f406_arg0
	while f406_local0 and not f406_local0.openMenu do
		f406_local0 = f406_local0:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( f406_arg2, f406_local0, "SaveAndQuitGamePopup" )
end

function LaunchDOAJoin( f407_arg0, f407_arg1, f407_arg2 )
	CoD.LobbyBase.LaunchDOA( f407_arg0, f407_arg2, false )
end

function LaunchDOACreate( f408_arg0, f408_arg1, f408_arg2 )
	CoD.LobbyBase.LaunchDOA( f408_arg0, f408_arg2, true )
end

function LaunchSelectedCPMission( f409_arg0, f409_arg1, f409_arg2 )
	local f409_local0 = Engine.GetModeName()
	if Engine.IsCampaignModeZombies() then
		f409_local0 = f409_local0 .. "2"
	end
	if f409_local0 == "Invalid" then
		if LUI.DEV ~= nil then
			error( "Invalid mode in matchmaking" )
		else
			return 
		end
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

function OpenDailyChallengePopup( f412_arg0, f412_arg1, f412_arg2 )
	CoD.OverlayUtility.CreateOverlay( f412_arg2, f412_arg0, "InspectDailyChallengeOverlay", f412_arg2 )
end

function SetupServerTime( f413_arg0, f413_arg1 )
	if f413_arg1 and f413_arg1:getParent() then
		local f413_local0 = CoD.SafeGetModelValue
		local f413_local1 = f413_arg1:getParent()
		f413_local0 = f413_local0( f413_local1:getModel(), "time" )
		if f413_local0 then
			f413_arg1:setupServerTime( 0 - f413_local0 * 1000 )
		end
	end
end

function ChooseClass( f414_arg0, f414_arg1, f414_arg2 )
	local f414_local0 = f414_arg0
	while f414_local0 and not f414_local0.openMenu do
		f414_local0 = f414_local0:getParent()
	end
	f414_local0:saveState()
	f414_local0:openMenu( "ChooseClass_InGame", f414_arg2 )
	f414_local0:close()
end

function ChooseTeam( f415_arg0, f415_arg1, f415_arg2 )
	local f415_local0 = f415_arg0
	while f415_local0 and not f415_local0.openMenu do
		f415_local0 = f415_local0:getParent()
	end
	f415_local0:saveState()
	local f415_local1 = f415_local0:openMenu( "ChangeTeam", f415_arg2 )
	if f415_local1 then
		f415_local1.previousMenuId = f415_local0.id
	end
	f415_local0:close()
end

function QuitGame_MP( f416_arg0, f416_arg1, f416_arg2 )
	local f416_local0 = f416_arg0
	while f416_local0 and not f416_local0.openMenu do
		f416_local0 = f416_local0:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( f416_arg2, f416_local0, "EndGamePopup" )
end

function SendClientScriptDebugMenuNotify( f417_arg0, f417_arg1, f417_arg2 )
	local f417_local0 = f417_arg0.cscDebugMenuList
	Engine.SendClientScriptNotify( f417_arg2, "script_debug_menu", Engine.GetModelValue( f417_arg1:getModel( f417_arg2, "name" ) ), f417_arg1.gridInfoTable.zeroBasedIndex + 1 )
end

function SendClientScriptDebugMenuCloseMenuNotify( f418_arg0, f418_arg1, f418_arg2 )
	Engine.SendClientScriptNotify( f418_arg2, "script_debug_menu", "close" )
end

function ProcessPlayerCallout( f419_arg0, f419_arg1, f419_arg2 )
	Engine.UpdateCalloutPlayerData( f419_arg1, Engine.GetModelValue( Engine.GetModel( f419_arg2, "arg1" ) ), Engine.GetModelValue( Engine.GetModel( f419_arg2, "arg2" ) ) )
	f419_arg0:playClip( "Side" )
end

function SetMPScoreText( f420_arg0, f420_arg1, f420_arg2, f420_arg3 )
	local f420_local0 = CoD.GetScriptNotifyData( f420_arg3 )
	local f420_local1 = Engine.GetIString( f420_local0[1], "CS_LOCALIZED_STRINGS" )
	local f420_local2 = f420_local0[2]
	if Engine.IsDemoPlaying() == false or CoD.isZombie == false then
		f420_arg1:AddCenterScore( f420_local1, f420_local2 )
		if HasPerk( f420_arg2, "specialty_combat_efficiency" ) then
			local f420_local3 = f420_local0[3]
			if f420_local3 > 0 then
				f420_arg1:AddCombatEfficiencyScore( f420_arg0, f420_local3, f420_arg2 )
			end
			if f420_local3 < f420_local2 then
				f420_arg1:AddCombatEfficiencyScore( f420_arg0, f420_local2 - f420_local3, f420_arg2 )
			end
		end
		if f420_local0[5] ~= nil and f420_local0[5] ~= 0 then
			f420_arg1:AddScoreFeed( Engine.Localize( f420_local1 ), true )
		end
	end
end

function TryBootHUD( f421_arg0, f421_arg1 )
	if not f421_arg0.hasBooted then
		f421_arg0:addElement( LUI.UITimer.new( f421_arg1, "hud_boot", true, f421_arg0 ) )
	end
end

function SetHudHasBooted( f422_arg0 )
	f422_arg0.hasBooted = true
end

function AddKillstreakReceivedNotification( f423_arg0, f423_arg1, f423_arg2, f423_arg3 )
	if IsCodCaster( f423_arg2 ) then
		if not IsCodCasterProfileValueEqualTo( f423_arg2, "shoutcaster_scorestreaks_notification", 1 ) then
			return 
		elseif CoD.SafeGetModelValue( Engine.GetModelForController( f423_arg2 ), "CodCaster.showLoadout" ) then
			return 
		end
	end
	if f423_arg1.appendNotification ~= nil then
		local f423_local0 = CoD.GetScriptNotifyData( f423_arg3 )
		f423_arg1:appendNotification( {
			title = Engine.ToUpper( Engine.Localize( "MENU_KILLSTREAK_READY", Engine.Localize( Engine.GetItemName( f423_local0[1] ) ) ) ),
			description = Engine.Localize( "MENU_ACTIVATE_KILLSTREAK_INSTR" ),
			type = "Killstreak",
			priority = 0
		} )
	end
end

function AddHeroAbilityReceivedNotification( f424_arg0, f424_arg1, f424_arg2, f424_arg3 )
	if IsCodCaster( f424_arg2 ) then
		if not IsCodCasterProfileValueEqualTo( f424_arg2, "shoutcaster_specialist_notification", 1 ) then
			return 
		elseif CoD.SafeGetModelValue( Engine.GetModelForController( f424_arg2 ), "CodCaster.showLoadout" ) then
			return 
		end
	end
	if f424_arg1.appendNotification ~= nil then
		local f424_local0 = CoD.GetScriptNotifyData( f424_arg3 )
		local f424_local1 = Engine.GetItemName( f424_local0[1] )
		local f424_local2 = Engine.ToUpper( Engine.Localize( "MENU_HERO_ABILITY_READY", Engine.ToUpper( Engine.Localize( f424_local1 ) ) ) )
		local f424_local3 = Engine.Localize( "MENU_ACTIVATE_HERO_ABILITY_INSTR" )
		if f424_local1 == "WEAPON_GADGET_RESURRECT" then
			f424_local3 = Engine.Localize( "MENU_ACTIVATE_REJACK_INSTR" )
		end
		if IsBlackMarketSpecialistAnyAbilityActive( f424_arg2 ) then
			f424_arg1:addElement( LUI.UITimer.newElementTimer( 1500, true, function ()
				f424_arg1:appendNotification( {
					title = f424_local2,
					description = f424_local3,
					type = "Ability",
					priority = 1
				} )
			end ) )
		else
			f424_arg1:appendNotification( {
				title = f424_local2,
				description = f424_local3,
				type = "Ability",
				priority = 1
			} )
		end
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

function AddZombieBGBTokenNotification( f428_arg0, f428_arg1, f428_arg2, f428_arg3 )
	f428_arg0:playSound( "zmb_bgb_token" )
	local f428_local0 = "t7_hud_zm_vial_256"
	local f428_local1 = ""
	if IsZMDoubleVialActive( f428_arg2 ) then
		f428_local0 = "uie_t7_icon_zm_double_vial_backer"
		f428_local1 = "MP_X2"
	end
	f428_arg1:appendNotification( {
		clip = "TextandImageBGBToken",
		title = Engine.Localize( "ZMUI_BGB_TOKEN_AWARD_NOTIFICATION_TITLE" ),
		description = Engine.Localize( "ZMUI_BGB_TOKEN_AWARD_NOTIFICATION_DESC" ),
		bgbImage = RegisterImage( f428_local0 ),
		bgbImageText = Engine.Localize( f428_local1 )
	} )
end

function AddZombieTimeAttackNotification( f429_arg0, f429_arg1, f429_arg2 )
	local f429_local0 = CoD.GetScriptNotifyData( f429_arg2 )
	local f429_local1 = Engine.Localize( "DLC3_TIME_ATTACK" )
	local f429_local2 = f429_local0[1]
	local f429_local3 = math.min( 1, math.max( f429_local0[2], 4 ) )
	local f429_local4 = 0
	local f429_local5 = 2 + f429_local3 - 1
	local f429_local6 = "gamedata/tables/zm/" .. Engine.GetCurrentMap() .. "_time_attacks.csv"
	f429_arg1:appendNotification( {
		clip = "TextandTimeAttack",
		title = f429_local1,
		description = Engine.Localize( "DLC3_TIME_ATTACK_SUBTITLE", f429_local2, NumberAsTimeNoMS( tonumber( Engine.TableLookup( nil, f429_local6, f429_local4, f429_local2, f429_local5 ) or 0 ) * 1000 ) ),
		bgbImage = RegisterImage( "blacktransparent" ),
		xpAward = Engine.Localize( "CHALLENGE_UNLOCK_REWARD", Engine.TableLookup( nil, f429_local6, f429_local4, f429_local2, 1 ) or 0 ),
		rewardText = Engine.Localize( "ZMUI_NEW_WEAPON_IN_LOC", Engine.TableLookup( nil, f429_local6, f429_local4, f429_local2, 6 ) )
	} )
end

function CreatePrematchTimer( f430_arg0, f430_arg1, f430_arg2 )
	local f430_local0 = CoD.GetScriptNotifyData( f430_arg2 )
	local f430_local1 = f430_local0[1]
	if f430_local1 and not f430_arg0.PrematchCountdown then
		local f430_local2 = CoD.PrematchCountdown.new( f430_arg0, f430_arg1 )
		f430_local2:setupCountdown( f430_local1, f430_arg1 )
		f430_local2:setLeftRight( false, false, -640, 640 )
		f430_local2:setTopBottom( false, false, -360, 360 )
		f430_local2:addElementBefore( f430_arg0.WaypointBase )
		f430_local2:processEvent( {
			name = "update_state",
			controller = f430_arg1,
			menu = f430_arg0
		} )
		f430_arg0.PrematchCountdown = f430_local2
		LUI.OverrideFunction_CallOriginalSecond( f430_arg0, "close", function ( element )
			if element.PrematchCountdown then
				element.PrematchCountdown:close()
			end
		end )
	end
	if f430_arg0.PrematchWaiting then
		f430_arg0.PrematchWaiting:close()
		f430_arg0.PrematchWaiting = nil
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f430_arg1 ), "isInPrematchPeriod" ), 1 )
end

function PrematchWaitingForPlayers( f432_arg0, f432_arg1 )
	if not f432_arg0.PrematchWaiting then
		local f432_local0 = CoD.Prematch_WaitingForPlayers.new( f432_arg0, f432_arg1 )
		f432_local0:setLeftRight( false, false, -640, 640 )
		f432_local0:setTopBottom( false, false, -360, 360 )
		f432_local0:addElementBefore( f432_arg0.WaypointBase )
		f432_local0:processEvent( {
			name = "update_state",
			controller = f432_arg1,
			menu = f432_arg0
		} )
		f432_arg0.PrematchWaiting = f432_local0
		LUI.OverrideFunction_CallOriginalSecond( f432_arg0, "close", function ( element )
			if element.PrematchCountdown then
				element.PrematchWaiting:close()
			end
		end )
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f432_arg1 ), "isInPrematchPeriod" ), 1 )
end

function CreateRejackTimer( f434_arg0, f434_arg1, f434_arg2 )
	local f434_local0 = CoD.GetScriptNotifyData( f434_arg2 )
	local f434_local1 = f434_local0[1]
	f434_arg0.rejackWidget = CoD.Rejack.new( f434_arg0, f434_arg1 )
	f434_arg0:addElement( f434_arg0.rejackWidget )
	f434_arg0.rejackWidget.RejackInternal:startHeartBeatAnimation( f434_arg1, f434_local1 )
end

function HandleScoreStreakDpadRight( f435_arg0, f435_arg1 )
	if f435_arg0:isInFocus() and not Engine.IsVisibilityBitSet( f435_arg1, Enum.UIVisibilityBit.BIT_GAME_ENDED ) then
		if not f435_arg0:hasClip( "Focus" ) then
			Engine.SwitchToInventoryWeapon( f435_arg1 )
		else
			local f435_local0 = Engine.GetModelValue( Engine.GetModel( f435_arg0:getModel(), "rewardSlot" ) )
			if f435_local0 ~= nil then
				Engine.ActionSlotSelectWeapon( f435_arg1, f435_local0 )
			else
				Engine.SwitchToInventoryWeapon( f435_arg1 )
			end
		end
	end
end

function MakeRaidPurchase( f436_arg0, f436_arg1, f436_arg2 )
	Engine.SendMenuResponse( f436_arg2, "raid_purchase", Engine.GetModelValue( f436_arg1:getModel( f436_arg2, "name" ) ) )
end

function CancelRaidPurchase( f437_arg0, f437_arg1, f437_arg2 )
	Engine.SendMenuResponse( f437_arg2, "raid_purchase", "none" )
end

function UpdateEnabledText( f438_arg0, f438_arg1, f438_arg2 )
	Engine.SetModelValue( f438_arg1:getModel( f438_arg2, "description" ), Engine.Localize( Engine.GetModelValue( f438_arg1:getModel( f438_arg2, "enabledDescription" ) ) ) )
end

function UpdateDisableReason( f439_arg0, f439_arg1, f439_arg2 )
	local f439_local0 = f439_arg0:getModel( f439_arg2, "disable_" .. Engine.GetModelValue( f439_arg1:getModel( f439_arg2, "id" ) ) )
	local f439_local1 = f439_arg1:getModel( f439_arg2, "description" )
	if f439_local0 ~= nil then
		Engine.SetModelValue( f439_local1, Engine.Localize( Engine.GetModelValue( f439_local0 ) ) )
	else
		Engine.SetModelValue( f439_local1, Engine.Localize( Engine.GetModelValue( f439_arg1:getModel( f439_arg2, "enabledDescription" ) ) ) )
	end
end

function SelectNextItemIfPossible( f440_arg0, f440_arg1, f440_arg2 )
	local f440_local0 = GetListItem( f440_arg0, f440_arg1 )
	return f440_local0:navigateItemRight()
end

function SelectNextItemIfPossibleAndNotDisabled( f441_arg0, f441_arg1, f441_arg2 )
	local f441_local0 = GetListItem( f441_arg0, f441_arg1 )
	local f441_local1 = f441_local0:getItemAtOffset( 0, 1 )
	if f441_local1 and Engine.GetModelValue( f441_local1:getModel( f441_arg2, "disabled" ) ) == true then
		return false
	else
		return f441_local0:navigateItemRight()
	end
end

function SelectPreviousItemIfPossible( f442_arg0, f442_arg1, f442_arg2 )
	local f442_local0 = GetListItem( f442_arg0, f442_arg1 )
	if f442_local0.hCount and f442_local0.hCount == 1 then
		return f442_local0:navigateItemUp()
	else
		return f442_local0:navigateItemLeft()
	end
end

function SelectPreviousItemIfPossibleAndNotDisabled( f443_arg0, f443_arg1, f443_arg2 )
	local f443_local0 = GetListItem( f443_arg0, f443_arg1 )
	local f443_local1 = f443_local0:getItemAtOffset( 0, -1 )
	if f443_local1 and Engine.GetModelValue( f443_local1:getModel( f443_arg2, "disabled" ) ) == true then
		return false
	else
		return f443_local0:navigateItemLeft()
	end
end

function SelectAboveItemIfPossible( f444_arg0, f444_arg1, f444_arg2 )
	local f444_local0 = GetListItem( f444_arg0, f444_arg1 )
	return f444_local0:navigateItemUp()
end

function SelectBelowItemIfPossible( f445_arg0, f445_arg1, f445_arg2 )
	local f445_local0 = GetListItem( f445_arg0, f445_arg1 )
	return f445_local0:navigateItemDown()
end

function SelectItemIfPossible( f446_arg0, f446_arg1, f446_arg2, f446_arg3 )
	f446_arg1:setActiveItem( f446_arg3.element )
end

function SelectFirstItemIfPossible( f447_arg0, f447_arg1, f447_arg2 )
	f447_arg1:getFirstSelectableItem( true )
end

function ListElementSelectFirstItemIfPossible( f448_arg0, f448_arg1 )
	if f448_arg0[f448_arg1] then
		f448_arg0[f448_arg1]:getFirstSelectableItem( true )
	end
end

function ProcessListAction( f449_arg0, f449_arg1, f449_arg2 )
	if f449_arg1.disabled then
		return 
	end
	local f449_local0 = f449_arg1:getModel( f449_arg2, "action" )
	local f449_local1 = f449_arg1:getModel( f449_arg2, "param" )
	local f449_local2, f449_local3 = nil
	if f449_local0 then
		f449_local2 = Engine.GetModelValue( f449_local0 )
		if f449_local1 then
			f449_local3 = Engine.GetModelValue( f449_local1 )
		end
	else
		f449_local2 = f449_arg1.action
		f449_local3 = f449_arg1.actionParam
	end
	if f449_local2 then
		local f449_local4 = f449_arg1:getParentMenu()
		if f449_arg1.gridInfoTable then
			f449_local4 = f449_arg1.gridInfoTable.parentGrid.menu
		end
		f449_local2( f449_arg0, f449_arg1, f449_arg2, f449_local3, f449_local4 )
	end
end

function ProcessClassOptionAction( f450_arg0, f450_arg1, f450_arg2, f450_arg3 )
	if f450_arg1.disabled then
		return 
	end
	local f450_local0, f450_local1 = nil
	f450_local0 = f450_arg3.actionButtonFn
	f450_local1 = f450_arg1.actionParam
	if f450_local0 then
		f450_local0( f450_arg0, f450_arg1, f450_arg2, f450_local1, f450_arg1.gridInfoTable.parentGrid.menu )
	end
end

function ProcessKeyboardCompleteAction( f451_arg0, f451_arg1, f451_arg2, f451_arg3 )
	if f451_arg1.disabled then
		return 
	end
	local f451_local0, f451_local1 = nil
	f451_local0 = f451_arg3.keyboardCompleteFn
	if f451_local0 then
		f451_local0( f451_arg0, f451_arg1, f451_arg2, f451_arg3 )
	end
end

function ProcessConfirmVariantNameAction( f452_arg0, f452_arg1, f452_arg2, f452_arg3 )
	if f452_arg1.disabled then
		return 
	end
	local f452_local0, f452_local1 = nil
	f452_local0 = f452_arg3.confirmVariantNameFn
	if f452_local0 then
		f452_local0( f452_arg0, f452_arg1, f452_arg2, f452_arg3 )
	end
end

function UpdateDataSource( f453_arg0, f453_arg1, f453_arg2 )
	f453_arg1:updateDataSource()
end

function UpdateElementDataSource( f454_arg0, f454_arg1 )
	if f454_arg0[f454_arg1] then
		f454_arg0[f454_arg1]:updateDataSource()
	end
end

function SetAsListVerticalCounter( f455_arg0, f455_arg1, f455_arg2 )
	if f455_arg0[f455_arg2] then
		f455_arg0[f455_arg2]:addCustomVerticalCounter( f455_arg1 )
	end
end

function SetAsListHorizontalCounter( f456_arg0, f456_arg1, f456_arg2 )
	if f456_arg0[f456_arg2] then
		f456_arg0[f456_arg2]:addCustomHorizontalCounter( f456_arg1 )
	end
end

function SetupTabs( f457_arg0, f457_arg1, f457_arg2 )
	f457_arg0:AddButtonCallbackFunction( f457_arg0, f457_arg2, Enum.LUIButton.LUI_KEY_LB, nil, function ( element, menu, controller, model )
		if not PropertyIsTrue( f457_arg1, "m_disableNavigation" ) then
			f457_arg1:navigateItemLeft()
		end
	end, AlwaysFalse, false )
	f457_arg0:AddButtonCallbackFunction( f457_arg0, f457_arg2, Enum.LUIButton.LUI_KEY_RB, nil, function ( element, menu, controller, model )
		if not PropertyIsTrue( f457_arg1, "m_disableNavigation" ) then
			f457_arg1:navigateItemRight()
		end
	end, AlwaysFalse, false )
end

function HideWidget( f460_arg0 )
	f460_arg0:setAlpha( 0 )
end

function ShowWidget( f461_arg0 )
	f461_arg0:setAlpha( 1 )
end

function HideElement( f462_arg0, f462_arg1 )
	if f462_arg0[f462_arg1] then
		f462_arg0[f462_arg1]:setAlpha( 0 )
	end
end

function ShowElement( f463_arg0, f463_arg1 )
	if f463_arg0[f463_arg1] then
		f463_arg0[f463_arg1]:setAlpha( 1 )
	end
end

function DisableWidget( f464_arg0, f464_arg1 )
	f464_arg0[f464_arg1].m_disableNavigation = true
	f464_arg0[f464_arg1]:makeNotFocusable()
	f464_arg0[f464_arg1]:setAlpha( 0 )
end

function SetBackFromCustomClass( f465_arg0 )
	CoD.CACUtility.FromCustomClass = true
end

function GetCustomClassModel( f466_arg0 )
	CoD.CACUtility.GetCustomClassModel( f466_arg0, CoD.perController[f466_arg0].classNum, CoD.perController[f466_arg0].classModel )
end

function ResetCustomClassStartingFocus( f467_arg0, f467_arg1, f467_arg2, f467_arg3 )
	local f467_local0 = f467_arg1:getModel()
	if not f467_local0 then
		return 
	end
	if f467_arg3 or Engine.GetModelValue( Engine.GetModel( f467_local0, "classNum" ) ) ~= CoD.CACUtility.CustomClass_LastClassNum then
		CoD.CACUtility.CustomClass_LastClassNum = 0
		CoD.CACUtility.CustomClass_LastSelection = "primary"
		CoD.CACUtility.CustomClass_PerClassLastSelection = {}
	end
end

function SetSeenExtraClassSets( f468_arg0 )
	local f468_local0 = Engine.StorageGetBuffer( f468_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if f468_local0 then
		return f468_local0.extraBools[0]:set( 1 )
	else
		
	end
end

function ChangeClass( f469_arg0, f469_arg1, f469_arg2 )
	f469_arg0:saveState()
	f469_arg0.menuResponseSent = true
	local f469_local0 = Engine.GetModelValue( f469_arg1:getModel( f469_arg2, "classNum" ), nil )
	local f469_local1 = Engine.GetModelValue( f469_arg1:getModel( f469_arg2, "defaultClassName" ), nil )
	local f469_local2 = f469_local0
	local f469_local3 = ""
	if f469_local1 ~= nil then
		f469_local3 = string.lower( f469_local1 )
		f469_local0 = Engine.GetClassIndexFromName( f469_local1 )
	else
		f469_local3 = "custom" .. f469_local0
	end
	local f469_local4 = true
	if CanUseSharedLoadouts( f469_arg2 ) then
		local f469_local5 = Engine.GetModel( Engine.GetModelForController( f469_arg2 ), "ChooseClassCPClientMenu" )
		if f469_local5 then
			local f469_local6 = Engine.CreateModel( f469_local5, "selectedClientIndex" )
			if f469_local6 then
				local f469_local7 = Engine.GetModelValue( f469_local6 )
				if f469_local7 ~= nil then
					local f469_local8 = Engine.GetModel( f469_local5, "client" .. f469_local7 )
					if f469_local8 then
						local f469_local9 = Engine.GetModelValue( Engine.GetModel( f469_local8, "xuid" ) )
						if Engine.IsSharedLoadoutAvailableForClient( f469_arg2, f469_local9 ) then
							f469_local3 = f469_local3 .. "," .. Engine.GetLobbyClientNumByXUID( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME, f469_local9 )
							local f469_local10 = Engine.CreateModel( f469_local5, "myClientIndex" )
							if f469_local10 and f469_local7 ~= Engine.GetModelValue( f469_local10 ) then
								f469_local4 = false
							end
						end
					end
				end
			end
		end
	end
	if CoD.isCampaign and f469_local4 and CoD.perController[f469_arg2].fieldOpsKitClassNum ~= f469_local0 + 1 then
		CoD.CACUtility.SetShowcaseWeaponToClassPrimary( f469_arg2, f469_local0 )
		SaveLoadout( f469_arg0, f469_arg2 )
	end
	Engine.SendMenuResponse( f469_arg2, "ChooseClass_InGame", f469_local3 )
	CoD.CACUtility.SetProfileLoadoutChoice( f469_arg2, f469_local0 )
	HUD_IngameMenuClosed()
	Engine.StreamSetCustomClass( f469_arg2, f469_local2 )
end

function ChangeClass_TrainingSim( f470_arg0, f470_arg1, f470_arg2 )
	f470_arg0:saveState()
	f470_arg0.menuResponseSent = true
	local f470_local0 = 9
	local f470_local1 = f470_local0
	Engine.SendMenuResponse( f470_arg2, "chooseClass_TrainingSim", "custom9" )
	CoD.CACUtility.SetProfileLoadoutChoice( f470_arg2, f470_local0 )
	HUD_IngameMenuClosed()
	Engine.StreamSetCustomClass( f470_arg2, f470_local1 )
end

function CloseChangeClass_TrainingSim( f471_arg0, f471_arg1, f471_arg2 )
	CoD.CACUtility.ResetCPCustomClasses( f471_arg2 )
end

function UpdateParentClassView( f472_arg0, f472_arg1, f472_arg2 )
	local f472_local0 = f472_arg1:getModel()
	CoD.perController[f472_arg2].classModel = f472_local0
	local f472_local1 = f472_arg0:getParent()
	if f472_local1 then
		f472_local1:setModel( f472_local0, f472_arg2 )
	end
end

function SetBubblegumPackIndex( f473_arg0, f473_arg1, f473_arg2 )
	local f473_local0 = f473_arg1:getModel()
	CoD.perController[f473_arg2].bgbPackIndex = f473_arg1.bgbPackIndex
	CoD.perController[f473_arg2].bubbleGumPackModel = f473_local0
	f473_arg0:setModel( f473_local0, f473_arg2 )
end

function SetCustomClassNum( f474_arg0, f474_arg1, f474_arg2 )
	local f474_local0 = f474_arg1:getModel()
	CoD.perController[f474_arg2].classNum = f474_arg1.classNum
	CoD.perController[f474_arg2].classModel = f474_local0
	f474_arg0:setModel( f474_local0, f474_arg2 )
end

function SetCustomParentClassNum( f475_arg0, f475_arg1, f475_arg2 )
	local f475_local0 = f475_arg1:getModel()
	CoD.perController[f475_arg2].classNum = f475_arg1.classNum
	CoD.perController[f475_arg2].classModel = f475_local0
	local f475_local1 = f475_arg0:getParent()
	if f475_local1 then
		f475_local1:setModel( f475_local0, f475_arg2 )
	end
end

function SetCustomClassNum_TrainingSim( f476_arg0, f476_arg1, f476_arg2 )
	local f476_local0 = Engine.GetModel( Engine.GetModelForController( f476_arg2 ), "CustomClassList.class1" )
	CoD.perController[f476_arg2].classNum = 9
	CoD.perController[f476_arg2].classModel = f476_local0
	f476_arg0:setModel( f476_local0, f476_arg2 )
end

function PrestigeWeapon( f477_arg0, f477_arg1, f477_arg2 )
	local f477_local0 = f477_arg1:getModel( f477_arg2, "itemIndex" )
	if f477_local0 then
		CoD.OverlayUtility.CreateOverlay( f477_arg2, f477_arg0, "PrestigeWeapon", f477_arg2, f477_local0 )
	end
end

function NavigateToLoadoutMenu( f478_arg0, f478_arg1 )
	local f478_local0 = f478_arg0.currentActiveSlot
	if f478_local0 then
		CoD.perController[f478_arg1].weaponCategory = f478_local0
		CoD.perController[f478_arg1].weaponClassGroup = f478_local0
		CoD.perController[f478_arg1].CACSpecficModelValueFocusTable = nil
		CoD.perController[f478_arg1].CACWildcardContextualMenu = nil
		CoD.perController[f478_arg1].wildcardOverCapacityRefName = nil
		local f478_local1 = CoD.perController[f478_arg1].classNum
		local f478_local2 = Engine.GetCustomClass( f478_arg1, f478_local1 )
		local f478_local3 = f478_arg0.weaponSlotTable[f478_local0]
		local f478_local4 = CoD.perController[f478_arg1].classModel
		local f478_local5 = true
		local f478_local6, f478_local7 = nil
		local f478_local8, f478_local9, f478_local10 = CoD.CACUtility.GetCACSlotStatus( f478_arg1, f478_local4, f478_local0 )
		if f478_local8 == CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE then
			return 
		elseif f478_local8 == CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD then
			local f478_local11 = nil
			for f478_local15, f478_local16 in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
				if not CoD.CACUtility.ItemEquippedInSlot( f478_local16, f478_arg1, f478_local4 ) then
					f478_local11 = f478_local16
					break
				end
			end
			f478_local12 = CoD.CACUtility.WildcardNeededForSlot( f478_arg1, f478_local0 )
			if f478_local11 then
				CoD.perController[f478_arg1].CACSpecficModelValueFocusTable = {
					ref = f478_local12
				}
				CoD.perController[f478_arg1].CACWildcardContextualMenu = true
				CoD.perController[f478_arg1].weaponCategory = f478_local11
				OpenPopup( f478_arg0, "WildcardSelect", f478_arg1 )
			end
			f478_local13 = Engine.GetItemIndexFromReference( f478_local12 )
			if IsProgressionEnabled( f478_arg1 ) and (Engine.IsItemLocked( f478_arg1, f478_local13 ) or not Engine.IsItemPurchased( f478_arg1, f478_local13 )) then
				return 
			end
			Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f478_arg1 ), "CACMenu.numWildcardItemsToRemove" ), 1 )
			CoD.perController[f478_arg1].wildcardOverCapacityRefName = f478_local12
			f478_local15 = OpenPopup( f478_arg0, "WildcardCapacity", f478_arg1 )
			f478_local15.acceptData = {
				classNum = f478_local1,
				wildcardToReplace = f478_local12
			}
		end
		local f478_local11 = CoD.CACUtility.PrimaryGunfighterEquippedCount( f478_local4 )
		if f478_local0 == "primary" then
			CoD.perController[f478_arg1].weaponSlot = "primary"
			f478_local6 = "PrimaryWeaponSelect"
			f478_local7 = "cac_loadout_edit_select_primary"
		elseif f478_local0 == "primaryattachment1" then
			local f478_local12 = f478_local2.primary
			CoD.perController[f478_arg1].weaponSlot = "primary"
			f478_local7 = "cac_loadout_edit_submenu"
			if f478_local12 then
				CoD.perController[f478_arg1].attachmentType = "optic"
				f478_local6 = "PrimaryOpticSelect"
			end
		elseif not (f478_local0 ~= "primaryattachment2" and f478_local0 ~= "primaryattachment3" and (f478_local0 ~= "primaryattachment4" or f478_local11 < 1)) or not (f478_local0 ~= "primaryattachment5" or f478_local11 < 2) or f478_local0 == "primaryattachment6" and f478_local11 >= 3 then
			if IsPrimaryWeaponAttachmentAvailable( f478_arg1 ) then
				local f478_local12 = f478_local2.primary
				CoD.perController[f478_arg1].weaponSlot = "primary"
				f478_local7 = "cac_loadout_edit_submenu"
				if f478_local12 then
					CoD.perController[f478_arg1].attachmentType = "attachment"
					f478_local6 = "PrimaryAttachmentSelect"
				end
			end
		elseif f478_local0 == "secondary" then
			CoD.perController[f478_arg1].weaponSlot = "secondary"
			f478_local6 = "SecondaryWeaponSelect"
			f478_local7 = "cac_loadout_edit_select_secondary"
			if CoD.CACUtility.IsBonusCardEquippedByName( f478_local2, "bonuscard_overkill" ) == true then
				CoD.perController[f478_arg1].weaponClassGroup = "primary"
				f478_local6 = "PrimaryWeaponSelect"
			end
		elseif f478_local0 == "secondaryattachment1" then
			local f478_local12 = f478_local2.secondary
			CoD.perController[f478_arg1].weaponSlot = "secondary"
			f478_local7 = "cac_loadout_edit_submenu"
			if f478_local12 then
				CoD.perController[f478_arg1].attachmentType = "optic"
				f478_local6 = "SecondaryOpticSelect"
			end
		elseif f478_local0 == "secondaryattachment2" or f478_local0 == "secondaryattachment3" and CoD.CACUtility.SearchForBonusCard( "bonuscard_secondary_gunfighter", f478_arg1 ) ~= "" then
			if IsSecondaryWeaponAttachmentAvailable( f478_arg1 ) then
				local f478_local12 = f478_local2.secondary
				CoD.perController[f478_arg1].weaponSlot = "secondary"
				f478_local7 = "cac_loadout_edit_submenu"
				if f478_local12 then
					CoD.perController[f478_arg1].attachmentType = "attachment"
					f478_local6 = "SecondaryAttachmentSelect"
				end
			end
		elseif f478_local0 == "primarygadget" then
			f478_local6 = "LethalEquipmentSelect"
			f478_local7 = "cac_loadout_edit_submenu"
			if CoD.CACUtility.IsBonusCardEquippedByName( f478_local2, "bonuscard_two_tacticals" ) == true then
				CoD.perController[f478_arg1].weaponClassGroup = "secondarygadget"
				f478_local6 = "TacticalEquipmentSelect"
			end
		elseif f478_local0 == "primarygadgetattachment1" or f478_local0 == "primarygadgetattachment2" or f478_local0 == "primarygadgetattachment3" then
			ToggleGadgetMod( f478_arg0, f478_arg1, f478_local0 )
		elseif f478_local0 == "secondarygadget" then
			f478_local6 = "TacticalEquipmentSelect"
			f478_local7 = "cac_loadout_edit_submenu"
		elseif f478_local0 == "secondarygadgetattachment1" or f478_local0 == "secondarygadgetattachment2" or f478_local0 == "secondarygadgetattachment3" then
			ToggleGadgetMod( f478_arg0, f478_arg1, f478_local0 )
		elseif not (f478_local0 ~= "specialty1" and (f478_local0 ~= "specialty4" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_1_greed", f478_arg1 ) == "")) or not (f478_local0 ~= "specialty2" and (f478_local0 ~= "specialty5" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_2_greed", f478_arg1 ) == "")) or f478_local0 == "specialty3" or f478_local0 == "specialty6" and CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_3_greed", f478_arg1 ) ~= "" then
			f478_local6 = "PerkSelect"
			f478_local7 = "cac_loadout_edit_submenu"
		elseif f478_local0 == "bonuscard1" or f478_local0 == "bonuscard2" or f478_local0 == "bonuscard3" then
			f478_local6 = "WildcardSelect"
			f478_local7 = "cac_loadout_edit_submenu"
		elseif f478_local0 == "cybercom_tacrig1" or f478_local0 == "cybercom_tacrig2" then
			f478_local6 = "TacticalRigSelect"
			f478_local7 = "cac_loadout_edit_submenu"
		end
		if f478_local7 then
			Engine.PlaySound( f478_local7 )
		end
		if f478_local6 then
			if f478_local6 == "WildcardSelect" then
				OpenPopup( f478_arg0, f478_local6, f478_arg1 )
			else
				NavigateToMenu( f478_arg0, f478_local6, f478_local5, f478_arg1 )
			end
		end
	end
end

function NavigateToPersonalizeMenu( f479_arg0, f479_arg1 )
	local f479_local0 = f479_arg0.currentActiveSlot
	local f479_local1 = CoD.perController[f479_arg1].classModel
	local f479_local2 = CoD.CACUtility.GetItemEquippedInSlot( f479_local0, f479_arg1, f479_local1 )
	local f479_local3 = CoD.CACUtility.GetItemRefEquippedInSlot( f479_local0, f479_arg1, f479_local1 )
	local f479_local4 = nil
	local f479_local5 = true
	if not (f479_local0 ~= "primary" or not CoD.CACUtility.ItemEquippedInSlot( "primary", f479_arg1 )) or f479_local0 == "secondary" and CoD.CACUtility.ItemEquippedInSlot( "secondary", f479_arg1 ) then
		f479_local4 = "WeaponCustomization"
	elseif (LUI.startswith( f479_local0, "primaryattachment" ) or LUI.startswith( f479_local0, "secondaryattachment" )) and f479_local0 ~= "primaryattachment1" and f479_local0 ~= "secondaryattachment1" and CoD.CACUtility.ItemEquippedInSlot( f479_local0, f479_arg1 ) and IsLive() and f479_local3 ~= "dw" then
		local f479_local6 = CoD.CACUtility.GetWeaponSlotForAttachmentSlot( f479_local0 )
		if f479_local6 then
			local f479_local7 = Engine.GetAttachmentCosmeticVariantCountForAttachment( CoD.CACUtility.GetItemRefEquippedInSlot( f479_local6, f479_arg1, f479_local1 ), Engine.GetItemAttachment( CoD.CACUtility.GetItemIndexEquippedInSlot( f479_local6, f479_arg1, f479_local1 ), CoD.CACUtility.GetItemIndexEquippedInSlot( f479_local0, f479_arg1, f479_local1 ) ) )
			if f479_local7 and f479_local7 > 0 then
				CoD.WC_Category.ACV.selectedAttachmentIndex = f479_local2
				CoD.WC_Category.ACV.selectedAttachment = f479_local3
				f479_local4 = "AttachmentCosmeticVariantSelect"
			end
		end
	elseif (f479_local0 == "primaryattachment1" or f479_local0 == "secondaryattachment1") and f479_local2 > CoD.CACUtility.EmptyItemIndex and CoD.CACUtility.AttachmentHasCustomReticle( f479_local3 ) then
		CoD.perController[f479_arg1].customReticleAttachmentIndex = f479_local2
		CoD.perController[f479_arg1].customReticleAttachment = f479_local3
		f479_local4 = "ReticleSelect"
	end
	if f479_local4 then
		CoD.perController[f479_arg1].weaponCategory = f479_local0
		NavigateToMenu( f479_arg0, f479_local4, f479_local5, f479_arg1 )
	end
end

function chooseClass_ClientChanged( f480_arg0, f480_arg1, f480_arg2, f480_arg3 )
	local f480_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	local f480_local1 = f480_local0.sessionClients
	local f480_local2 = Engine.GetModel( Engine.GetModelForController( f480_arg2 ), "ChooseClassCPClientMenu" )
	if f480_local2 then
		local f480_local3 = Engine.GetModel( f480_local2, "selectedClientIndex" )
		if f480_local3 then
			local f480_local4 = Engine.GetModel( f480_local2, "numActiveClients" )
			if f480_local4 then
				local f480_local5 = Engine.GetModelValue( f480_local4 )
				local f480_local6 = Engine.GetModelValue( f480_local3 )
				local f480_local7 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
				local f480_local8 = f480_local7.sessionClients
				local f480_local9 = Engine.GetXUID64( f480_arg2 )
				local f480_local10 = false
				repeat
					f480_local6 = f480_local6 + f480_arg3
					if f480_local6 < 1 then
						f480_local6 = f480_local5
					elseif f480_local5 < f480_local6 then
						f480_local6 = 1
					end
					local f480_local11 = Engine.GetModel( f480_local2, "client" .. f480_local6 )
					if f480_local11 then
						local f480_local12 = Engine.GetModelValue( Engine.GetModel( f480_local11, "xuid" ) )
						if f480_local12 == f480_local9 then
							f480_local10 = true
						else
							local f480_local13 = nil
							for f480_local14 = 1, #f480_local8, 1 do
								local f480_local17 = f480_local8[f480_local14]
								if f480_local17.xuid == f480_local12 then
									f480_local13 = f480_local17
									break
								end
							end
							if f480_local13 ~= nil then
								f480_local10 = Engine.IsSharedLoadoutAvailableForClient( f480_arg2, f480_local12 )
							end
							f480_local10 = false
						end
					end
				until f480_local10
				Engine.SetModelValue( f480_local3, f480_local6 )
				f480_arg0.chooseClassCPClientIngame0:setModel( Engine.GetModel( f480_local2, "client" .. f480_local6 ) )
				CoD.CACUtility.ResetCPCustomClasses( f480_arg2 )
				f480_arg0.classList.classList:updateDataSource( true )
				f480_arg0.classList.classList:processEvent( {
					name = "gain_focus",
					controller = f480_arg2
				} )
			end
		end
	end
end

function chooseClass_TabMPClassesListLeft( f481_arg0, f481_arg1 )
	if not f481_arg0.ClassSetTabWidget then
		return 
	else
		return f481_arg0.ClassSetTabWidget.Internal.Tabs:navigateItemLeft()
	end
end

function chooseClass_TabMPClassesListRight( f482_arg0, f482_arg1 )
	if not f482_arg0.ClassSetTabWidget then
		return 
	else
		return f482_arg0.ClassSetTabWidget.Internal.Tabs:navigateItemRight()
	end
end

function CAC_TabChanged( f483_arg0, f483_arg1, f483_arg2 )
	if not f483_arg0.performingSetup then
		DataSources.Unlockables.setCurrentFilterItem( f483_arg1.filter )
		f483_arg0.weaponList:updateDataSource( true )
		local f483_local0 = f483_arg0.weaponList:getItemAt( 1 )
		if f483_local0 then
			f483_arg0.weaponList:setActiveItem( f483_local0, 0, true, true )
		end
	end
end

function Cybercore_TabChanged( f484_arg0, f484_arg1, f484_arg2 )
	local f484_local0 = Engine.GetModel( Engine.GetModelForController( f484_arg2 ), "CybercoreUpgradeMenu" )
	Engine.SetModelValue( Engine.GetModel( f484_local0, "selectedCore" ), f484_arg1.itemRef )
	Engine.SetModelValue( Engine.GetModel( f484_local0, "currentCybercoreName" ), f484_arg1.itemName )
	f484_arg0.upgradeTree:updateTree( f484_arg2 )
	f484_arg0:processEvent( {
		name = "update_state",
		controller = f484_arg2
	} )
end

function SetClassItem( f485_arg0, f485_arg1, f485_arg2 )
	local f485_local0 = CoD.perController[f485_arg2].classNum
	local f485_local1 = CoD.perController[f485_arg2].weaponCategory
	local f485_local2 = f485_arg1:getModel( f485_arg2, "itemIndex" )
	local f485_local3 = 0
	if f485_local2 then
		f485_local3 = Engine.GetModelValue( f485_local2 )
	end
	local f485_local4 = f485_arg1:getModel( f485_arg2, "upgradeItemIndex" )
	local f485_local5 = 0
	if f485_local4 then
		f485_local5 = Engine.GetModelValue( f485_local4 )
	end
	local f485_local6 = f485_local3
	if IsCACItemUpgraded( f485_arg0, f485_arg1, f485_arg2 ) then
		f485_local6 = f485_local5
	end
	if AttemptAttachItem( f485_arg0, f485_arg2, f485_arg0:getModel(), f485_local0, f485_local1, f485_local6 ) then
		if f485_local1 == "primary" or f485_local1 == "secondary" then
			CoD.CACUtility.ForceStreamAttachmentImages( f485_arg2 )
		end
		BreakWeaponVariantLink( f485_arg2 )
		f485_arg0:playSound( "equip_item" )
		local f485_local7 = GoBack( f485_arg0, f485_arg2 )
		if f485_local7 then
			f485_local7:processEvent( {
				name = "update_state",
				controller = f485_arg2
			} )
		end
		return f485_local7
	else
		
	end
end

function SetClassWildcard( f486_arg0, f486_arg1, f486_arg2 )
	local f486_local0 = CoD.perController[f486_arg2].classNum
	local f486_local1 = CoD.perController[f486_arg2].weaponCategory
	local f486_local2 = CoD.perController[f486_arg2].classModel
	local f486_local3 = false
	local f486_local4 = f486_arg1:getModel( f486_arg2, "itemIndex" )
	local f486_local5 = 0
	if f486_local4 then
		f486_local5 = Engine.GetModelValue( f486_local4 )
	end
	local f486_local6 = Engine.GetModel( f486_local2, f486_local1 .. ".itemIndex" )
	if f486_local6 then
		local f486_local7 = Engine.GetModelValue( f486_local6 )
		if CoD.CACUtility.EmptyItemIndex < f486_local7 and f486_local7 == f486_local5 then
			f486_local3 = true
		end
	end
	if f486_local3 or AttemptAttachItem( f486_arg0, f486_arg2, f486_arg0:getModel(), f486_local0, f486_local1, f486_local5 ) then
		f486_arg0:playSound( "equip_item" )
		local f486_local7 = GoBack( f486_arg0, f486_arg2 )
		if CoD.CACUtility.CustomClass_LastClassNum and f486_local7.menuName == "CustomClass" then
			f486_local7:navigateTo( CoD.CACUtility.CustomClass_LastSelection )
			f486_local7:processEvent( {
				name = "update_state",
				controller = f486_arg2
			} )
		end
	end
end

function SetClassAttachment( f487_arg0, f487_arg1, f487_arg2 )
	local f487_local0 = CoD.perController[f487_arg2].classModel
	local f487_local1 = CoD.perController[f487_arg2].classNum
	local f487_local2 = CoD.perController[f487_arg2].weaponCategory
	local f487_local3 = f487_arg1:getModel( f487_arg2, "itemIndex" )
	local f487_local4 = 0
	if f487_local3 then
		f487_local4 = Engine.GetModelValue( f487_local3 )
	end
	if AttemptAttachItem( f487_arg0, f487_arg2, f487_arg0:getModel(), f487_local1, f487_local2, f487_local4, true ) then
		BreakWeaponVariantLink( f487_arg2 )
		CoD.CACUtility.GetCustomClassModel( f487_arg2, f487_local1, f487_local0 )
		f487_arg0:playSound( "equip_item" )
		local f487_local5 = GoBack( f487_arg0, f487_arg2 )
		if f487_local5 then
			f487_local5:processEvent( {
				name = "update_state",
				controller = f487_arg2
			} )
		end
	end
end

function SetWeaponVariant( f488_arg0, f488_arg1, f488_arg2 )
	local f488_local0 = CoD.perController[f488_arg2].classNum
	local f488_local1 = CoD.perController[f488_arg2].classModel
	local f488_local2 = CoD.perController[f488_arg2].weaponCategory
	local f488_local3 = f488_local2 == "primary"
	local f488_local4 = f488_arg1.weaponVariantInfo.weaponIndex
	local f488_local5 = f488_arg1.weaponVariantInfo.attachmentsByIndex
	local f488_local6 = f488_arg1.weaponVariantInfo.unlockedAttachmentsByIndex
	local f488_local7 = f488_arg1.weaponVariantInfo.wildcardNeededCount
	local f488_local8 = f488_arg1.weaponVariantInfo.wildcardNeededFromVariantCount
	local f488_local9 = not f488_arg1.dontRemoveAttachments
	local f488_local10 = false
	local f488_local11 = false
	local f488_local12 = Engine.GetMaxAllocation( f488_arg2 )
	local f488_local13 = Engine.GetModel( f488_local1, "allocationSpent" )
	local f488_local14 = 0
	local f488_local15 = 0
	local f488_local16 = 0
	local f488_local17 = 0
	local f488_local18 = 0
	local f488_local19 = 2
	local f488_local20 = "bonuscard_primary_gunfighter"
	local f488_local21 = CoD.CACUtility.PrimaryAttachmentSlotNameList
	local f488_local22 = 3
	local f488_local23 = CoD.CACUtility.maxPrimaryGunfighters
	if not f488_local3 then
		f488_local19 = 1
		f488_local21 = CoD.CACUtility.SecondaryAttachmentSlotNameList
		f488_local20 = "bonuscard_secondary_gunfighter"
		f488_local22 = 2
		f488_local23 = CoD.CACUtility.maxSecondaryGunfigthers
	end
	if f488_local13 then
		f488_local14 = Engine.GetModelValue( f488_local13 )
	end
	if CoD.CACUtility.EmptyItemIndex < Engine.GetModelValue( Engine.GetModel( f488_local1, f488_local2 .. ".itemIndex" ) ) then
		f488_local15 = 1
	end
	for f488_local27, f488_local28 in ipairs( f488_local21 ) do
		if CoD.CACUtility.EmptyItemIndex < Engine.GetModelValue( Engine.GetModel( f488_local1, f488_local28 .. ".itemIndex" ) ) then
			f488_local16 = f488_local16 + 1
		end
	end
	if f488_local3 then
		f488_local18 = CoD.CACUtility.PrimaryGunfighterEquippedCount( f488_local1 )
	elseif CoD.CACUtility.IsBonusCardEquipped( CoD.CACUtility.bonuscards.secondary_gunfighter, f488_local1 ) then
		f488_local18 = 1
	end
	f488_local17 = f488_local18
	f488_local14 = f488_local14 - f488_local15 - f488_local16 - f488_local17
	f488_local24 = f488_arg1.weaponVariantInfo.camoIndex
	if f488_local24 ~= CoD.CACUtility.GetItemEquippedInSlot( f488_local2 .. "Camo", f488_arg2, f488_local1 ) then
		f488_local26 = Engine.GetWeaponOptionEntitlementString( f488_local24 )
		if not f488_local26 then
			f488_local26 = ""
		end
		if CoD.StoreUtility.DoesInventoryItemExistsByName( f488_local26 ) then
			LUI.CoDMetrics.InventoryItemEquipped( f488_arg2, Engine.GetWeaponOptionName( f488_local24 ), f488_local24, "CamoVariantEquip" )
		end
	end
	f488_local26 = 0
	f488_local27 = 1
	f488_local28 = 0
	local f488_local29 = false
	local f488_local30 = 0
	local f488_local31 = f488_local5
	local f488_local32 = {}
	local f488_local33 = f488_local18
	local f488_local34 = f488_local7 - f488_local18
	if f488_local3 then
		f488_local34 = math.min( math.max( f488_local34, 0 ), CoD.CACUtility.maxPrimaryGunfighters )
	else
		f488_local34 = math.min( math.max( f488_local34, 0 ), CoD.CACUtility.maxSecondaryGunfighters )
	end
	if IsProgressionEnabled( f488_arg2 ) then
		f488_local31 = f488_local6
		if f488_local3 then
			local f488_local35 = 0
			for f488_local42, f488_local43 in ipairs( CoD.CACUtility.PrimaryGunfighterWildcards ) do
				if f488_local8 <= f488_local35 then
					break
				elseif CoD.CACUtility.IsBonusCardEquipped( f488_local43, f488_local1 ) then
					f488_local17 = f488_local17 - 1
				else
					local f488_local39 = Engine.GetItemIndexFromReference( f488_local43 )
					local f488_local40 = Engine.IsItemLocked( f488_arg2, f488_local39 )
					local f488_local41
					if not f488_local40 then
						f488_local41 = not Engine.IsItemPurchased( f488_arg2, f488_local39 )
					else
						f488_local41 = false
					end
					table.insert( f488_local32, {
						ref = f488_local43,
						itemIndex = f488_local39,
						isLocked = f488_local40,
						isPurchasable = f488_local41
					} )
				end
				f488_local35 = f488_local35 + 1
			end
			f488_local33 = f488_local35
		elseif f488_local34 > 0 and f488_local33 < f488_local8 then
			if CoD.CACUtility.IsBonusCardEquipped( f488_local20, f488_local1 ) then
				f488_local17 = f488_local17 - 1
			else
				local f488_local35 = Engine.GetItemIndexFromReference( f488_local20 )
				local f488_local36 = Engine.IsItemLocked( f488_arg2, f488_local35 )
				local f488_local37
				if not f488_local36 then
					f488_local37 = not Engine.IsItemPurchased( f488_arg2, f488_local35 )
				else
					f488_local37 = false
				end
				table.insert( f488_local32, {
					ref = f488_local20,
					itemIndex = f488_local35,
					isLocked = f488_local36,
					isPurchasable = f488_local37
				} )
				f488_local33 = 1
			end
		end
	else
		f488_local34 = f488_local8 - f488_local18
		if f488_local3 then
			f488_local34 = math.min( math.max( f488_local34, 0 ), CoD.CACUtility.maxPrimaryGunfighters )
		else
			f488_local34 = math.min( math.max( f488_local34, 0 ), CoD.CACUtility.maxSecondaryGunfighters )
		end
		if f488_local8 > 0 and f488_local34 > 0 then
			if f488_local3 then
				local f488_local35 = 0
				for f488_local42, f488_local43 in ipairs( CoD.CACUtility.PrimaryGunfighterWildcards ) do
					if f488_local8 <= f488_local35 then
						
					elseif CoD.CACUtility.IsBonusCardEquipped( f488_local43, f488_local1 ) then
						f488_local17 = f488_local17 - 1
					else
						table.insert( f488_local32, {
							ref = f488_local43,
							itemIndex = Engine.GetItemIndexFromReference( f488_local43 ),
							isLocked = false
						} )
					end
					f488_local35 = f488_local35 + 1
				end
			elseif CoD.CACUtility.IsBonusCardEquipped( f488_local20, f488_local1 ) then
				f488_local17 = f488_local17 - 1
			else
				table.insert( f488_local32, {
					ref = f488_local20,
					itemIndex = Engine.GetItemIndexFromReference( f488_local20 ),
					isLocked = false
				} )
			end
		else
			f488_local17 = f488_local17 - f488_local8
		end
		f488_local33 = f488_local8
	end
	local f488_local35 = false
	for f488_local42, f488_local43 in ipairs( f488_local32 ) do
		if f488_local43.isLocked and f488_local9 then
			for f488_local39 = #f488_local31, f488_local22, -1 do
				if f488_local31[f488_local39] ~= CoD.CACUtility.EmptyItemIndex then
					f488_local31[f488_local39] = CoD.CACUtility.EmptyItemIndex
					break
				end
			end
		end
		if f488_local43.isPurchasable then
			f488_local35 = true
		end
	end
	for f488_local42, f488_local43 in ipairs( f488_local31 ) do
		if CoD.CACUtility.EmptyItemIndex < f488_local43 then
			f488_local28 = f488_local28 + 1
		end
	end
	f488_local36 = 1
	while #f488_local32 > 0 and f488_local36 <= #f488_local32 do
		if f488_local32[f488_local36].isLocked then
			table.remove( f488_local32, f488_local36 )
			f488_local34 = f488_local34 - 1
			f488_local33 = f488_local33 - 1
		else
			f488_local36 = f488_local36 + 1
		end
	end
	f488_local26 = f488_local27 + f488_local28 + f488_local33
	f488_local37 = 0
	if f488_local34 > 0 then
		for f488_local39, f488_local40 in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
			if not CoD.CACUtility.ItemEquippedInSlot( f488_local40, f488_arg2, f488_local1 ) then
				f488_local37 = f488_local37 + 1
			end
		end
		if f488_local37 < f488_local34 then
			f488_local11 = true
		end
	end
	if not IsCampaign() and f488_local12 < f488_local14 + f488_local26 + f488_local17 then
		f488_local10 = true
	end
	if f488_local35 then
		f488_local38 = nil
		f488_local42 = true
		f488_local43 = nil
		for f488_local44, f488_local45 in ipairs( f488_local32 ) do
			if f488_local45.isPurchasable then
				f488_local43 = f488_local45
				break
			end
		end
		f488_local39 = CoD.OverlayUtility.CreateOverlay( f488_arg2, f488_arg0, "UnlockClassItem", f488_arg2, f488_local43.itemIndex, f488_local38, f488_local42 )
		f488_local39.acceptData = {
			variantInfoElement = f488_arg1
		}
	elseif f488_local11 then
		CoD.perController[f488_arg2].wildcardOverCapacityRefName = f488_local32[1].ref
		Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f488_arg2 ), "CACMenu.numWildcardItemsToRemove" ), f488_local34 - f488_local37 )
		f488_local42 = OpenPopup( f488_arg0, "WildcardCapacity", f488_arg2 )
		f488_local42.acceptData = {
			classNum = f488_local0,
			variantInfoElement = f488_arg1,
			wildcarUnlockedTable = f488_local32
		}
	elseif f488_local10 then
		Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f488_arg2 ), "CACMenu.numItemsToRemove" ), f488_local14 + f488_local26 + f488_local17 - f488_local12 )
		f488_local43 = OpenPopup( f488_arg0, "RemoveItemFromClass", f488_arg2 )
		f488_local43.acceptData = {
			slotName = f488_local2,
			weaponVariantInfo = f488_arg1.weaponVariantInfo,
			attachmentsByIndex = f488_local31,
			wildcarUnlockedTable = f488_local32,
			bonuscardGunfighterForSlot = f488_local20
		}
	else
		AttachWeaponVariant( f488_arg0, f488_arg2, f488_local2, f488_arg1.weaponVariantInfo, f488_local31, f488_local32, f488_local20 )
		GoBackToCustomClassMenu( f488_arg0, f488_arg2 )
	end
end

function BreakWeaponVariantLink( f489_arg0, f489_arg1 )
	local f489_local0 = CoD.perController[f489_arg0].classNum
	local f489_local1 = CoD.CACUtility.EmptyItemIndex
	local f489_local2 = f489_arg1
	local f489_local3 = nil
	if not f489_arg1 then
		f489_local2 = CoD.perController[f489_arg0].weaponCategory
	end
	f489_local3 = CoD.CACUtility.GetBaseWeaponLoadoutSlotName( f489_local2 )
	if f489_local3 == "primary" or f489_local3 == "secondary" then
		local f489_local4 = CoD.GetClassItem( f489_arg0, f489_local0, f489_local3 .. "gunsmithvariant" )
		if f489_local4 ~= f489_local1 then
			local f489_local5 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f489_arg0, f489_local4 - 1 )
			CoD.OverlayUtility.ShowToast( "BreakVariantLink", Engine.Localize( "MENU_WEAPON_VARIANT_LINK_BROKEN" ), f489_local5.variantName, "uie_t7_mp_icon_header_gunsmith" )
		end
		CoD.SetClassItem( f489_arg0, f489_local0, f489_local3 .. "gunsmithvariant", f489_local1 )
	end
end

function UpdateShownCybercoreXmodel( f490_arg0, f490_arg1 )
	local f490_local0 = f490_arg0:getModel( f490_arg1, "baseItemIndex" )
	local f490_local1 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local f490_local2 = 0
	if f490_local0 then
		Engine.SendClientScriptNotify( f490_arg1, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f490_arg1 ), "cybercore", CoD.CACUtility.GetCybercoreXModel( Engine.GetModelValue( f490_local0 ), f490_local1 ), "select01", nil, nil, IsCybercoreAbilityAvailable( f490_arg0, f490_arg1 ), IsCybercoreAbilityPurchasable( f490_arg0, f490_arg1 ) )
	end
end

function FocusClassItem( f491_arg0, f491_arg1, f491_arg2 )
	local f491_local0 = CoD.perController[f491_arg2].classNum
	local f491_local1 = CoD.perController[f491_arg2].weaponCategory
	local f491_local2 = CoD.perController[f491_arg2].classModel
	local f491_local3 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local f491_local4 = f491_arg1:getModel( f491_arg2, "itemIndex" )
	local f491_local5 = 0
	if f491_local4 then
		f491_local5 = Engine.GetModelValue( f491_local4 )
	elseif f491_arg1.itemIndex then
		f491_local5 = f491_arg1.itemIndex
	end
	local f491_local6 = "select01"
	local f491_local7, f491_local8, f491_local9 = nil
	if LUI.startswith( f491_local1, "primaryattachment" ) then
		f491_local7 = "primary"
		f491_local8 = CoD.CACUtility.PrimaryAttachmentSlotNameList
	elseif LUI.startswith( f491_local1, "secondaryattachment" ) then
		f491_local7 = "secondary"
		f491_local8 = CoD.CACUtility.SecondaryAttachmentSlotNameList
	elseif LUI.startswith( f491_local1, "specialty" ) then
		f491_local7 = "specialty"
		f491_local9 = CoD.CACUtility.GetPerkXModel( f491_local5, f491_local3 )
	elseif LUI.startswith( f491_local1, "bonuscard" ) then
		f491_local7 = "bonuscard"
		f491_local9 = CoD.CACUtility.GetBonuscardXModel( f491_local5, f491_local3 )
	elseif LUI.startswith( f491_local1, "cybercore" ) then
		f491_local7 = "cybercore"
		f491_local9 = CoD.CACUtility.GetCybercoreXModel( f491_local5, f491_local3 )
	elseif LUI.startswith( f491_local1, "cybercom" ) then
		f491_local7 = "cybercom"
		f491_local9 = CoD.CACUtility.GetPerkXModel( f491_local5, f491_local3 )
	end
	local f491_local10 = Engine.GetModel( f491_local2, f491_local7 .. ".itemIndex" )
	local f491_local11 = Engine.GetModel( f491_local2, f491_local1 .. ".itemIndex" )
	if f491_local10 and f491_local11 and f491_local7 ~= "cybercore" then
		local f491_local12 = Engine.GetModelValue( f491_local10 )
		local f491_local13 = Engine.GetAttachmentRef( f491_local12, f491_local5 )
		local f491_local14 = Engine.GetModelValue( f491_local11 )
		local f491_local15 = Engine.GetAttachmentRef( f491_local12, f491_local14 )
		local f491_local16 = Engine.GetItemRef( f491_local12 ) .. "_" .. CoD.gameMode:lower()
		local f491_local17 = {}
		local f491_local18 = false
		for f491_local22, f491_local23 in ipairs( f491_local8 ) do
			local f491_local24 = Engine.GetModelValue( Engine.GetModel( f491_local2, f491_local23 .. ".itemIndex" ) )
			if CoD.CACUtility.EmptyItemIndex < f491_local24 then
				if f491_local24 ~= f491_local14 then
					table.insert( f491_local17, {
						index = f491_local24,
						ref = Engine.GetAttachmentRef( f491_local12, f491_local24 )
					} )
				else
					f491_local18 = true
				end
			end
		end
		for f491_local22, f491_local23 in ipairs( f491_local17 ) do
			local f491_local24 = f491_local23.ref
			local f491_local25 = f491_local23.index
			if (not Engine.IsOptic( f491_local12, f491_local5 ) or not Engine.IsOptic( f491_local12, f491_local25 )) and Engine.AreAttachmentsCompatible( f491_local12, f491_local5, f491_local25 ) then
				f491_local16 = f491_local16 .. "+" .. f491_local24
			end
		end
		f491_local16 = f491_local16 .. "+" .. f491_local13
		if f491_local16 and f491_local16 ~= "" then
			Engine.SendClientScriptNotify( f491_arg2, "CustomClass_focus" .. CoD.GetLocalClientAdjustedNum( f491_arg2 ), f491_local7, f491_local16, f491_local13, "none", CoD.CACUtility.GetACVariantsFromClassExcludeAttachment( f491_arg2, f491_local2, f491_local1, f491_local13 ) .. f491_local13 .. "," .. f491_arg1.acvIndex )
		end
	elseif f491_local11 ~= nil then
		local f491_local12
		if not IsCACItemLocked( f491_arg0, f491_arg1, f491_arg2 ) then
			f491_local12 = not IsSelfModelValueTrue( f491_arg1, f491_arg2, "isBMClassified" )
		else
			f491_local12 = false
		end
		Engine.SendClientScriptNotify( f491_arg2, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f491_arg2 ), f491_local1, f491_local9, f491_local6, nil, nil, f491_local12, not IsCACItemPurchased( f491_arg1, f491_arg2 ) )
	end
end

function FocusWeapon( f492_arg0, f492_arg1, f492_arg2 )
	local f492_local0 = CoD.perController[f492_arg2].classNum
	local f492_local1 = CoD.perController[f492_arg2].weaponCategory
	local f492_local2 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local f492_local3 = f492_arg1:getModel( f492_arg2, "itemIndex" )
	local f492_local4 = 0
	if f492_local3 then
		local f492_local5 = Engine.GetItemRef( Engine.GetModelValue( f492_local3 ), f492_local2 )
		local f492_local6 = f492_local5 .. "_mp"
		if f492_local1 == "secondary" then
			f492_local6 = "none," .. f492_local6
		end
		local f492_local7 = f492_local5 .. "_" .. CoD.gameMode:lower()
		local f492_local8 = CoD.CACUtility.EmptyWeaponOptions()
		local f492_local9 = not IsCACItemLocked( f492_arg0, f492_arg1, f492_arg2 )
		local f492_local10
		if not IsCACItemPurchased( f492_arg1, f492_arg2 ) and not IsSelfModelValueTrue( f492_arg1, f492_arg2, "isBMClassified" ) then
			f492_local10 = not IsSelfModelValueTrue( f492_arg1, f492_arg2, "isContractClassified" )
		else
			f492_local10 = false
		end
		Engine.SendClientScriptNotify( f492_arg2, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f492_arg2 ), f492_local1, f492_local7, "select01", f492_local8, nil, f492_local9, f492_local10 )
	end
end

function FocusWeaponVariant( f493_arg0, f493_arg1, f493_arg2 )
	local f493_local0 = CoD.perController[f493_arg2].classNum
	local f493_local1 = CoD.perController[f493_arg2].weaponCategory
	local f493_local2 = f493_arg1.weaponVariantInfo.weaponIndex
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f493_arg2 ), "CACMenu.curWeaponVariantName" ), f493_arg1.weaponVariantInfo.variantName )
	local f493_local3 = Engine.GetItemRef( f493_local2 ) .. "_" .. CoD.gameMode:lower()
	for f493_local7, f493_local8 in ipairs( f493_arg1.weaponVariantInfo.attachmentsByIndex ) do
		f493_local3 = f493_local3 .. "+" .. Engine.GetAttachmentRef( f493_local2, f493_local8 )
	end
	Engine.SendClientScriptNotify( f493_arg2, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f493_arg2 ), f493_local1, f493_local3, CoD.CACUtility.GetCameraNameForAttachments( f493_local3 ), CoD.CACUtility.GetWeaponOptionsFromVariantInfo( f493_arg2, f493_arg1.weaponVariantInfo ), CoD.CACUtility.GetAttachmentCosmeticVariantsFromVariantInfo( f493_arg1.weaponVariantInfo ) )
end

function MarkCACPaintshopDataDirty( f494_arg0, f494_arg1 )
	Engine.MarkPSDataDirty( f494_arg1, false )
end

function MarkCACPaintshopDataDirtyForEdittingSpecialist( f495_arg0 )
	if IsLuaCodeVersionAtLeast( 20 ) then
		Engine.MarkPSDataDirty( f495_arg0, false, CoD.CCUtility.Heroes.HeroIndexForEdits )
	else
		MarkCACPaintshopDataDirty( nil, f495_arg0 )
	end
end

function ClearLocalPSCharacter( f496_arg0 )
	if IsLuaCodeVersionAtLeast( 20 ) then
		Engine.ClearLocalPSCharacter( f496_arg0 )
	end
end

function RemoveItemFromClass( f497_arg0, f497_arg1, f497_arg2 )
	if f497_arg0.ShowRemovePrompt ~= nil and not f497_arg0:ShowRemovePrompt( f497_arg2 ) then
		return 
	end
	local f497_local0 = CoD.perController[f497_arg2].classNum
	local f497_local1 = CoD.perController[f497_arg2].classModel
	local f497_local2 = f497_arg0.currentActiveSlot
	if f497_local2 and RemoveItemFromClassSlot( f497_local2, f497_arg2 ) then
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
		RemoveItemFromClassSlot( Engine.GetModelValue( f498_local5 ), f498_arg2 )
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
		AttemptAttachItem( f498_arg0, f498_arg2, f498_local0, f498_local1, f498_local2, f498_local3 )
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
			SetFocusToLoadoutWidgetAfterSetItem( f498_local9 )
		end
	end
end

function WeaponVariantRemoveItemFromClass( f499_arg0, f499_arg1, f499_arg2 )
	local f499_local0 = CoD.perController[f499_arg2].classNum
	local f499_local1 = Engine.GetUsedAllocation( f499_arg2, f499_local0 )
	local f499_local2 = f499_arg1:getModel( f499_arg2, "itemSlot" )
	if f499_local2 then
		RemoveItemFromClassSlot( Engine.GetModelValue( f499_local2 ), f499_arg2 )
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
		AttachWeaponVariant( f499_arg0, f499_arg2, f499_arg0.acceptData.slotName, f499_arg0.acceptData.weaponVariantInfo, f499_arg0.acceptData.attachmentsByIndex, f499_arg0.acceptData.wildcarUnlockedTable, f499_arg0.acceptData.bonuscardGunfighterForSlot )
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
		RemoveItemFromClassSlot( f500_local1, f500_arg2 )
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
	AttemptAttachItem( f500_arg0, f500_arg2, f500_local2, f500_local3, f500_local1, f500_local5 )
	f500_arg0.selectionList:updateDataSource()
	local f500_local6 = Engine.GetModel( Engine.GetModelForController( f500_arg2 ), "CACMenu.numWildcardItemsToRemove" )
	local f500_local7 = Engine.GetModelValue( f500_local6 ) - 1
	Engine.SetModelValue( f500_local6, f500_local7 )
	if f500_local7 <= 0 then
		if f500_local4 then
			local f500_local8 = GoBack( f500_arg0, f500_arg2 )
			f500_local4.dontRemoveAttachments = true
			SetWeaponVariant( f500_local8, f500_local4, f500_arg2 )
			f500_local4.dontRemoveAttachments = nil
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
		local f501_local9 = Engine.GetModelValue( f501_local6 )
		if f501_local9 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB then
			local f501_local10 = Engine.GetModelValue( f501_arg1:getModel( f501_arg2, "paintjobIndex" ) )
			CoD.SetClassItem( f501_arg2, f501_local1, f501_local3 .. f501_local7 .. "slot", Engine.GetModelValue( f501_arg1:getModel( f501_arg2, "paintjobSlot" ) ) )
			CoD.SetClassItem( f501_arg2, f501_local1, f501_local3 .. f501_local7 .. "index", f501_local10 )
		else
			if f501_local9 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO and f501_local8 ~= CoD.GetClassItem( f501_arg2, f501_local1, f501_local3 .. f501_local7 ) and CoD.StoreUtility.DoesInventoryItemExistsByName( Engine.GetModelValue( f501_arg1:getModel( f501_arg2, "entitlementString" ) ) ) then
				LUI.CoDMetrics.InventoryItemEquipped( f501_arg2, Engine.GetModelValue( f501_arg1:getModel( f501_arg2, "name" ) ), f501_local8, "CamoCAC" )
			end
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

function ClassOptionsCopyClassSet( f507_arg0, f507_arg1, f507_arg2 )
	local f507_local0 = f507_arg1:getModel( f507_arg2, "classSetId" )
	if f507_local0 then
		local f507_local1 = Engine.GetModelValue( f507_local0 )
		local f507_local2 = Engine.GetCurrentClassSetIndex( f507_arg2 )
		if f507_local1 == f507_local2 then
			return 
		end
		Engine.CopyToClassSet( f507_arg2, f507_local2 )
		Engine.CopyFromClassSetToClassSet( f507_arg2, f507_local2, f507_local1 )
		local f507_local3 = GoBack( f507_arg0, f507_arg2 )
		ClearSavedState( f507_arg0, f507_arg2 )
		f507_local3 = GoBack( f507_local3, f507_arg2 )
		ClearSavedState( f507_local3, f507_arg2 )
		f507_local3:dispatchEventToChildren( {
			name = "class_set_name_change",
			controller = f507_arg2
		} )
	end
end

function ClassOptionsResetToDefault( f508_arg0, f508_arg1, f508_arg2 )
	local f508_local0 = f508_arg0:getModel( f508_arg2, "classNum" )
	if not f508_local0 then
		f508_local0 = Engine.GetModel( CoD.perController[f508_arg2].classModel, "classNum" )
	end
	local f508_local1 = f508_arg1:getModel( f508_arg2, "customClassName" )
	local f508_local2 = f508_arg1:getModel( f508_arg2, "index" )
	if f508_local0 and f508_local1 and f508_local2 then
		local f508_local3 = Engine.GetModelValue( f508_local0 )
		local f508_local4 = Engine.GetModelValue( f508_local1 )
		local f508_local5 = Engine.GetModelValue( f508_local2 )
		local f508_local6 = CoD.CACUtility.GetDefaultLoadoutNameFromIndex( f508_local5 )
		if IsArenaMode() then
			f508_local6 = CoD.CACUtility.GetDefaultArenaLoadoutNameFromIndex( f508_local5 )
		end
		Engine.ExecNow( f508_arg2, "uiEquipDefaultClass " .. f508_local3 .. " " .. f508_local6 )
		local f508_local7 = CoD.CACUtility.GetLoadoutNameFromIndex( f508_arg2, f508_local3 )
		f508_local7:set( f508_local4 )
		CoD.CACUtility.UpdateAllClasses( f508_arg2 )
	end
	local f508_local3 = GoBack( f508_arg0, f508_arg2 )
	ClearSavedState( f508_arg0, f508_arg2 )
	local f508_local4 = GoBack( f508_local3, f508_arg2 )
	ClearSavedState( f508_local3, f508_arg2 )
	if f508_local4 then
		f508_local4:processEvent( {
			name = "update_state",
			controller = f508_arg2
		} )
	end
end

function ClassOptionsClearLoadout( f509_arg0, f509_arg1, f509_arg2 )
	local f509_local0 = CoD.perController[f509_arg2].classNum
	local f509_local1 = CoD.perController[f509_arg2].classModel
	for f509_local2 = 1, #CoD.CACUtility.clearLoadoutSlotOrder, 1 do
		local f509_local5 = CoD.CACUtility.clearLoadoutSlotOrder[f509_local2]
		local f509_local6 = Engine.GetModel( f509_local1, f509_local5 )
		if f509_local6 and CoD.CACUtility.EmptyItemIndex < Engine.GetModelValue( Engine.GetModel( f509_local6, "itemIndex" ) ) then
			CoD.SetClassItem( f509_arg2, f509_local0, f509_local5, CoD.CACUtility.EmptyItemIndex )
		end
	end
	CoD.SetClassItem( f509_arg2, f509_local0, "primarypaintjobslot", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
	CoD.SetClassItem( f509_arg2, f509_local0, "primarypaintjobindex", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
	CoD.SetClassItem( f509_arg2, f509_local0, "secondarypaintjobslot", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
	CoD.SetClassItem( f509_arg2, f509_local0, "secondarypaintjobindex", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
	CoD.CACUtility.GetCustomClassModel( f509_arg2, f509_local0, f509_local1 )
	local f509_local2 = f509_arg0.occludedMenu
	if f509_local2 then
		f509_local2:processEvent( {
			name = "update_state",
			controller = f509_arg2
		} )
	end
end

function ClassOptionsSetHintText( f510_arg0, f510_arg1, f510_arg2 )
	if f510_arg1 and f510_arg1:getModel() and f510_arg1:getModel( f510_arg2, "description" ) then
		Engine.SetModelValue( Engine.CreateModel( CoD.perController[f510_arg2].classModel, "customClassOptionsHintText" ), Engine.GetModelValue( f510_arg1:getModel( f510_arg2, "description" ) ) )
	end
end

function OpenBuyExtraSlotsPackDialog( f511_arg0, f511_arg1, f511_arg2 )
	local f511_local0 = f511_arg1:getModel( f511_arg2, "skuID" )
	if f511_local0 then
		local f511_local1 = Engine.GetModelValue( f511_local0 )
		CoD.OverlayUtility.CreateOverlay( f511_arg2, f511_arg0, "PurchaseExtraSlotsConfirmation", f511_arg2, {
			displayText = "MENU_MEDIA_STORAGE_PACK",
			itemCODPointCost = tonumber( CoD.StoreUtility.GetInventoryItemValueBySkuId( f511_local1, CoD.StoreUtility.InventoryItems.costColumn ) ),
			productDesc = CoD.StoreUtility.GetInventoryItemValueBySkuId( f511_local1, CoD.StoreUtility.InventoryItems.productDescColumn ),
			purchaseSource = "Store"
		} )
	end
end

function OpenBuyInventoryItemDialog( f512_arg0, f512_arg1, f512_arg2, f512_arg3 )
	local f512_local0 = f512_arg1:getModel( f512_arg2, "skuId" )
	if not f512_local0 then
		return 
	end
	local f512_local1 = Engine.GetModelValue( f512_local0 )
	local f512_local2 = CoD.StoreUtility.GetInventoryItemValueBySkuId( f512_local1, CoD.StoreUtility.InventoryItems.costColumn )
	local f512_local3 = CoD.StoreUtility.GetInventoryItemValueBySkuId( f512_local1, CoD.StoreUtility.InventoryItems.nameContextualColumn )
	local f512_local4 = CoD.StoreUtility.GetInventoryItemValueBySkuId( f512_local1, CoD.StoreUtility.InventoryItems.productImageColumn )
	if f512_local4 == "t7_store_product_cwl" and CoD.isPS4 then
		f512_local4 = "t7_store_product_cwl_ps4"
	end
	CoD.OverlayUtility.CreateOverlay( f512_arg2, f512_arg0, "PurchaseInventoryItemConfirmation", f512_arg2, {
		skuId = f512_local1,
		displayText = CoD.StoreUtility.GetInventoryItemValueBySkuId( f512_local1, CoD.StoreUtility.InventoryItems.purchaseConfirmationColumn ),
		itemName = f512_local3,
		itemCODPointCost = tonumber( f512_local2 ),
		image = f512_local4,
		category = CoD.StoreUtility.GetInventoryItemValueBySkuId( f512_local1, CoD.StoreUtility.InventoryItems.categoryColumn ),
		productDesc = CoD.StoreUtility.GetInventoryItemValueBySkuId( f512_local1, CoD.StoreUtility.InventoryItems.productDescColumn ),
		purchaseSource = f512_arg3
	} )
end

function PurchaseItem( f513_arg0, f513_arg1, f513_arg2 )
	local f513_local0 = f513_arg1:getModel()
	if f513_local0 then
		Engine.PurchaseItem( f513_arg2, Engine.GetModelValue( Engine.GetModel( f513_local0, "itemIndex" ) ) )
		Engine.SendClientScriptNotify( f513_arg2, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f513_arg2 ), "purchased" )
	end
end

function SetUnlockConfirmationInfo( f514_arg0, f514_arg1 )
	local f514_local0 = f514_arg0:getModel( f514_arg1, "itemIndex" )
	if f514_local0 then
		SetConfirmationInfoInternal( f514_arg0, f514_arg1, f514_local0 )
	end
end

function SetUpgradeConfirmationInfo( f515_arg0, f515_arg1 )
	local f515_local0 = f515_arg0:getModel( f515_arg1, "upgradeItemIndex" )
	if f515_local0 then
		SetConfirmationInfoInternal( f515_arg0, f515_arg1, f515_local0 )
	end
end

function OpenUnlockClassItemDialog( f516_arg0, f516_arg1, f516_arg2 )
	CoD.OverlayUtility.CreateOverlay( f516_arg2, f516_arg0, "UnlockClassItem", f516_arg2, Engine.GetModelValue( f516_arg1:getModel( f516_arg2, "itemIndex" ) ), nil )
end

function OpenUpgradeClassItemDialog( f517_arg0, f517_arg1, f517_arg2 )
	local f517_local0 = f517_arg1:getModel( f517_arg2, "upgradeItemIndex" )
	if f517_local0 then
		CoD.OverlayUtility.CreateOverlay( f517_arg2, f517_arg0, "UnlockClassItem", f517_arg2, Engine.GetModelValue( f517_arg1:getModel( f517_arg2, "itemIndex" ) ), Engine.GetModelValue( f517_local0 ) )
	end
end

function UnlockItem( f518_arg0, f518_arg1, f518_arg2 )
	local f518_local0 = f518_arg1:getModel( f518_arg2, "itemIndex" )
	local f518_local1 = f518_arg1:getModel( f518_arg2, "upgradeItemIndex" )
	local f518_local2 = nil
	if f518_local1 then
		f518_local2 = Engine.GetModelValue( f518_local1 )
	end
	if f518_local0 then
		local f518_local3 = Engine.GetModelValue( f518_local0 )
		if f518_local2 ~= nil then
			Engine.PurchaseItem( f518_arg2, f518_local2 )
			local f518_local4 = CoD.perController[f518_arg2].weaponCategory
			if f518_local4 then
				CoD.CACUtility.UpgradeEquippedCACItems( f518_arg2, f518_local4, f518_local3, f518_local2 )
			end
		else
			Engine.PurchaseItem( f518_arg2, f518_local3 )
		end
		Engine.SendClientScriptNotify( f518_arg2, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f518_arg2 ), "purchased" )
	end
	SaveLoadout( f518_arg0, f518_arg2 )
	UploadStats( f518_arg0, f518_arg2 )
end

function UnlockAndEquipItem( f519_arg0, f519_arg1, f519_arg2 )
	local f519_local0 = CoD.perController[f519_arg2].weaponCategory
	UnlockItem( f519_arg0, f519_arg1, f519_arg2 )
	local f519_local1 = Engine.GetModelValue( f519_arg1:getModel( f519_arg2, "itemIndex" ) )
	if f519_local0 == "specialist" then
		local f519_local2 = CoD.CCUtility.customizationMode
		local f519_local3 = CoD.CCUtility.Heroes.HeroIndexForEdits
		local f519_local4 = CoD.CCUtility.GetHeroEquippedSlot( f519_arg2, f519_local1 )
		SelectHero( f519_arg0, f519_arg1, f519_arg2 )
		Engine.SetHeroLoadoutItem( f519_arg2, f519_local2, f519_local3, f519_local4 )
	elseif LUI.startswith( f519_local0, "killstreak" ) then
		EquipScorestreak( f519_arg0, f519_arg1, f519_arg2 )
	else
		local f519_local2 = SetClassItem( f519_arg0, f519_arg1, f519_arg2 )
		if LUI.startswith( f519_local0, "bonuscard" ) and not IsCACContextualWildcardOpen( f519_arg2 ) then
			f519_arg1.itemIndex = f519_local1
			FocusClassItem( f519_local2, f519_arg1, f519_arg2 )
		end
		return f519_local2
	end
end

function UnlockAndEquipHeroForMPFirstTimeSetup( f520_arg0, f520_arg1, f520_arg2, f520_arg3, f520_arg4 )
	local f520_local0 = nil
	local f520_local1 = f520_arg1:getModel( f520_arg2, "itemIndex" )
	if f520_local1 then
		f520_local0 = Engine.GetModelValue( f520_local1 )
	end
	if not f520_local0 then
		f520_local0 = f520_arg1.itemIndex
	end
	local f520_local2 = f520_arg4
	if f520_arg3.previousMenu then
		f520_local2 = f520_arg3.previousMenu
	end
	local f520_local3 = CoD.CCUtility.customizationMode
	local f520_local4 = CoD.CCUtility.Heroes.HeroIndexForEdits
	local f520_local5 = CoD.CCUtility.GetHeroEquippedSlot( f520_arg2, f520_local0 )
	if f520_local5 then
		SelectHero( f520_arg0, f520_arg1, f520_arg2 )
		Engine.SetHeroLoadoutItem( f520_arg2, f520_local3, f520_local4, f520_local5 )
		Engine.SetFirstSelectedHeroLoadout( f520_arg2, Enum.CACType.CAC_TYPE_MP_PUBLIC, f520_local4, f520_local5 )
		Engine.SetHeroForCACType( f520_arg2, f520_local3, Enum.CACType.CAC_TYPE_MP_CUSTOM, f520_local4 )
		Engine.SetHeroLoadoutItemForCACType( f520_arg2, f520_local3, Enum.CACType.CAC_TYPE_MP_CUSTOM, f520_local4, f520_local5 )
		Engine.SetFirstSelectedHeroLoadout( f520_arg2, Enum.CACType.CAC_TYPE_MP_CUSTOM, f520_local4, f520_local5 )
		Engine.SetHeroForCACType( f520_arg2, f520_local3, Enum.CACType.CAC_TYPE_MP_ARENA, f520_local4 )
		Engine.SetHeroLoadoutItemForCACType( f520_arg2, f520_local3, Enum.CACType.CAC_TYPE_MP_ARENA, f520_local4, f520_local5 )
		Engine.SetFirstSelectedHeroLoadout( f520_arg2, Enum.CACType.CAC_TYPE_MP_ARENA, f520_local4, f520_local5 )
		SetFirstTimeSetupComplete_MP( f520_arg0, f520_arg1, f520_arg2, "", f520_arg4 )
		SendClientScriptMenuChangeNotify( f520_arg2, f520_local2, false )
		if not IsCACHaveTokens( f520_arg2 ) then
			Engine.ExecNow( f520_arg2, "statWriteMode mp unlocks 1" )
		end
		Engine.PurchaseItem( f520_arg2, f520_local0, f520_local3 )
		SaveLoadout( f520_arg0, f520_arg2 )
	end
end

function TryPurchaseCybercoreAbility( f521_arg0, f521_arg1, f521_arg2 )
	local f521_local0 = f521_arg1:getModel()
	if f521_local0 then
		local f521_local1 = function ( f522_arg0 )
			Engine.SetModelValue( Engine.CreateModel( f521_local0, "itemIndex" ), f522_arg0 )
			SetUnlockConfirmationInfo( f521_arg1, f521_arg2 )
			if not IsCACHaveTokens( f521_arg2 ) then
				OpenPopup( f521_arg0, "OutOfUnlockTokens", f521_arg2 )
			else
				OpenUnlockClassItemDialog( f521_arg0, f521_arg1, f521_arg2 )
			end
		end
		
		local f521_local2 = Engine.GetModelValue( Engine.GetModel( f521_local0, "prereqItemIndex" ) )
		if f521_local2 == -1 or Engine.IsItemPurchased( f521_arg2, f521_local2 ) then
			local f521_local3 = Engine.GetModelValue( Engine.GetModel( f521_local0, "baseItemIndex" ) )
			if not Engine.IsItemPurchased( f521_arg2, f521_local3 ) then
				f521_local1( f521_local3 )
			else
				local f521_local4 = Engine.GetModelValue( Engine.GetModel( f521_local0, "upgradeItemIndex" ) )
				if f521_local4 and not Engine.IsItemPurchased( f521_arg2, f521_local4 ) then
					f521_local1( f521_local4 )
				end
			end
		end
	end
end

function UpdateCybercoreTree( f523_arg0, f523_arg1, f523_arg2 )
	if f523_arg0.upgradeTree then
		f523_arg0.upgradeTree:updateTree( f523_arg2 )
	end
end

function SetCACWeaponAsOld( f524_arg0, f524_arg1, f524_arg2 )
	local f524_local0 = f524_arg1:getModel( f524_arg2, "itemIndex" )
	if CoD.PrestigeUtility.isInPermanentUnlockMenu then
		return 
	elseif f524_local0 then
		local f524_local1 = Engine.GetModelValue( f524_local0 )
		if f524_local1 > CoD.CACUtility.EmptyItemIndex then
			Engine.SetItemAsOld( f524_arg2, f524_local1 )
			if f524_arg0.weaponCategoryList and f524_arg0.weaponCategoryList.Tabs.grid then
				local f524_local2 = f524_arg0.weaponCategoryList.Tabs.grid:getItemAt( f524_arg0.weaponCategoryList.Tabs.grid.savedActiveIndex + 1 )
				if f524_local2 then
					local f524_local3 = f524_local2:getModel( f524_arg2, "breadcrumbCount" )
					if f524_local3 then
						Engine.SetModelValue( f524_local3, Engine.WeaponGroupNewItemCount( f524_arg2, f524_local2.filter ) )
					end
				end
			end
		end
	end
end

function SetCACItemAsOld( f525_arg0, f525_arg1 )
	local f525_local0 = f525_arg0:getModel( f525_arg1, "itemIndex" )
	if CoD.PrestigeUtility.isInPermanentUnlockMenu then
		return 
	elseif f525_local0 then
		local f525_local1 = Engine.GetModelValue( f525_local0 )
		if f525_local1 > CoD.CACUtility.EmptyItemIndex then
			Engine.SetItemAsOld( f525_arg1, f525_local1 )
		end
	end
end

function SetCACAttachmentAsOld( f526_arg0, f526_arg1 )
	local f526_local0 = f526_arg0:getModel( f526_arg1, "itemIndex" )
	if f526_local0 then
		local f526_local1 = Engine.GetModelValue( f526_local0 )
		if f526_local1 > CoD.CACUtility.EmptyItemIndex then
			Engine.SetAttachmentAsOld( f526_arg1, f526_arg0.weaponIndex, f526_local1 )
		end
	end
end

function SetSpecialistAsOld( f527_arg0, f527_arg1, f527_arg2 )
	if CoD.PrestigeUtility.isInPermanentUnlockMenu then
		return 
	elseif IsProgressionEnabled( f527_arg2 ) then
		local f527_local0 = Engine.CurrentSessionMode()
		local f527_local1 = f527_arg1.heroIndex
		if f527_local1 then
			for f527_local2 = 0, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_COUNT - 1, 1 do
				local f527_local5 = Engine.GetLoadoutItemIndexForHero( f527_local0, f527_local1, f527_local2 )
				if CoD.CACUtility.EmptyItemIndex < f527_local5 and Engine.IsItemNew( f527_arg2, f527_local5 ) then
					Engine.SetItemAsOld( f527_arg2, f527_local5 )
					f527_arg0:processEvent( {
						name = "update_state",
						menu = f527_arg0
					} )
				end
			end
		end
	end
end

function SetWeaponOptionAsOld( f528_arg0, f528_arg1, f528_arg2 )
	local f528_local0 = CoD.perController[f528_arg2].classModel
	local f528_local1 = CoD.perController[f528_arg2].weaponCategory
	local f528_local2 = CoD.SafeGetModelValue( f528_local0, f528_local1 .. ".itemIndex" )
	if CoD.SafeGetModelValue( f528_arg1:getModel(), "weaponOptionType" ) == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE then
		f528_local2 = Engine.GetItemAttachment( CoD.SafeGetModelValue( f528_local0, CoD.CACUtility.GetBaseWeaponLoadoutSlotName( f528_local1 ) .. ".itemIndex" ), f528_local2 )
	end
	SetWeaponOptionAsOldInternal( f528_arg0, f528_arg1, f528_arg2, f528_local2 )
end

function SetCACACVAsOld( f529_arg0, f529_arg1 )
	local f529_local0 = CoD.WC_Category.ACV.selectedAttachmentWeaponIndex
	if f529_local0 and f529_arg0.attachmentTableIndex and f529_arg0.variantIndex then
		SetACVASOldInternal( f529_arg1, f529_local0, f529_arg0.attachmentTableIndex, f529_arg0.variantIndex, Engine.CurrentSessionMode() )
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

function CopyLoadoutFromClassSet( f532_arg0 )
	if IsClassSetsAvailableForCurrentGameMode() then
		Engine.CopyFromClassSet( f532_arg0, Engine.GetCurrentClassSetIndex( f532_arg0 ) )
	end
end

function CopyLoadoutToClassSet( f533_arg0 )
	if IsClassSetsAvailableForCurrentGameMode() then
		Engine.CopyToClassSet( f533_arg0, Engine.GetCurrentClassSetIndex( f533_arg0 ) )
	end
end

function IncrementClassSetAndUpdateElementDataSource( f534_arg0, f534_arg1, f534_arg2, f534_arg3, f534_arg4 )
	local f534_local0 = Engine.GetCurrentClassSetIndex( f534_arg1 )
	local f534_local1 = Engine.GetNumberOfClassSetsOwned( f534_arg1 )
	local f534_local2 = f534_local0 + 1
	if f534_local1 <= f534_local2 then
		f534_local2 = f534_local1 - 1
	end
	if f534_local2 ~= f534_local0 then
		Engine.CopyToClassSet( f534_arg1, f534_local0 )
		Engine.SetCurrentClassSetIndex( f534_arg1, f534_local2 )
		Engine.CopyFromClassSet( f534_arg1, f534_local2 )
		CoD.CACUtility.ForceStreamAttachmentImages( f534_arg1 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f534_arg1 ), "currentClassSetIndex" ), f534_local2 )
		chooseClass_TabMPClassesListRight( f534_arg2, f534_arg1 )
		UpdateElementDataSource( f534_arg0[f534_arg3], f534_arg4 )
	end
end

function DecrementClassSetAndUpdateElementDataSource( f535_arg0, f535_arg1, f535_arg2, f535_arg3, f535_arg4 )
	local f535_local0 = Engine.GetCurrentClassSetIndex( f535_arg1 )
	local f535_local1 = f535_local0 - 1
	if f535_local1 < 0 then
		f535_local1 = 0
	end
	if f535_local1 ~= f535_local0 then
		Engine.CopyToClassSet( f535_arg1, f535_local0 )
		Engine.SetCurrentClassSetIndex( f535_arg1, f535_local1 )
		Engine.CopyFromClassSet( f535_arg1, f535_local1 )
		CoD.CACUtility.ForceStreamAttachmentImages( f535_arg1 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f535_arg1 ), "currentClassSetIndex" ), f535_local1 )
		chooseClass_TabMPClassesListLeft( f535_arg2, f535_arg1 )
		UpdateElementDataSource( f535_arg0[f535_arg3], f535_arg4 )
	end
end

function SetChooseClassMenuToExtraSlotPromptState( f536_arg0, f536_arg1, f536_arg2, f536_arg3, f536_arg4 )
	local f536_local0 = Engine.GetModel( Engine.GetModelForController( f536_arg1 ), "currentClassSetIndex" )
	if not f536_local0 then
		return 
	end
	DisableNavigation( f536_arg0[f536_arg3], f536_arg4 )
	local f536_local1 = Engine.GetModelValue( f536_local0 )
	local f536_local2 = Engine.GetNumberOfClassSetsOwned( f536_arg1 )
	local f536_local3 = f536_local1 + 1
	if f536_local3 == f536_local2 then
		Engine.SetModelValue( f536_local0, f536_local3 )
		chooseClass_TabMPClassesListRight( f536_arg2, f536_arg1 )
		f536_arg2:setState( "ExtraSlots" )
	end
end

function SetChooseClassMenuFromExtraSlotPromptState( f537_arg0, f537_arg1, f537_arg2, f537_arg3, f537_arg4 )
	local f537_local0 = Engine.GetModel( Engine.GetModelForController( f537_arg1 ), "currentClassSetIndex" )
	if not f537_local0 then
		return 
	end
	EnableNavigation( f537_arg0[f537_arg3], f537_arg4 )
	local f537_local1 = Engine.GetModelValue( f537_local0 ) - 1
	if f537_local1 == 0 then
		Engine.SetModelValue( f537_local0, f537_local1 )
		chooseClass_TabMPClassesListLeft( f537_arg2, f537_arg1 )
		f537_arg2:setState( "DefaultState" )
	end
end

function OpenPurchaseExtraSlotsOverlay( f538_arg0, f538_arg1, f538_arg2 )
	OpenSystemOverlay( f538_arg0, f538_arg2, f538_arg1, "PurchaseExtraSlotsConfirmation", {
		itemCODPointCost = tonumber( CoD.StoreUtility.GetInventoryItemValueByItemName( CoD.StoreUtility.ExtraSlotsProductDesc, CoD.StoreUtility.InventoryItems.costColumn ) ),
		displayText = "MENU_MEDIA_STORAGE_PACK",
		productDesc = CoD.StoreUtility.ExtraSlotsProductDesc,
		purchaseSource = "CAC"
	} )
end

function OpenGobbleGumRecipe( f539_arg0, f539_arg1, f539_arg2 )
	local f539_local0 = CoD.BubbleGumBuffUtility.GetGobbleGumRecipeInfoModel( f539_arg2 )
	if f539_arg1 then
		local f539_local1 = f539_arg1.recipeIndex
		local f539_local2 = f539_arg1.haveAllIngredients
		Engine.SetModelValue( Engine.CreateModel( f539_local0, "recipeIndex" ), f539_local1 )
		OpenOverlay( f539_arg0, "GobbleGumRecipe", f539_arg2 )
	end
end

function CookGobbleGumRecipe( f540_arg0, f540_arg1 )
	CoD.BubbleGumBuffUtility.CookGobbleGumRecipe( f540_arg0, f540_arg1 )
end

function SetHintText( f541_arg0, f541_arg1, f541_arg2 )
	local f541_local0 = nil
	if f541_arg1 then
		if f541_arg1.hintText then
			f541_local0 = f541_arg1.hintText
		else
			local f541_local1 = f541_arg1:getModel()
			if f541_local1 then
				local f541_local2 = Engine.GetModel( f541_local1, "hintText" )
				if f541_local2 then
					f541_local0 = Engine.GetModelValue( f541_local2 )
				end
			end
		end
	end
	if f541_local0 == nil then
		DataSources.PerController.clearHintText( f541_arg2 )
	else
		DataSources.PerController.setHintText( f541_arg2, f541_local0 )
	end
end

function SetHintTextToString( f542_arg0, f542_arg1 )
	if f542_arg1 == nil or f542_arg1 == "" then
		DataSources.PerController.clearHintText( f542_arg0 )
	else
		DataSources.PerController.setHintText( f542_arg0, f542_arg1 )
	end
end

function PDV_DataVaultOpened( f543_arg0, f543_arg1 )
	Engine.SendMenuResponse( f543_arg1, "PersonalDataVaultMenu", "mainCam" )
	PrepareOpenMenuInSafehouse( f543_arg1 )
	CoD.perController[f543_arg1].InspectingDataVault = true
end

function PDV_DataVaultClosed( f544_arg0, f544_arg1 )
	Engine.SendMenuResponse( f544_arg1, "PersonalDataVaultMenu", "closed" )
	PrepareCloseMenuInSafehouse( f544_arg1 )
	CoD.perController[f544_arg1].InspectingDataVault = false
	f544_arg0:addElement( LUI.UITimer.newElementTimer( 0, true, function ()
		Close( f544_arg0, f544_arg1 )
	end ) )
end

function PDV_ChangeCollectibleArea( f546_arg0, f546_arg1, f546_arg2 )
	Engine.SendClientScriptNotify( f546_arg2, "collectibles_slot_change" .. CoD.GetLocalClientAdjustedNum( f546_arg2 ), f546_arg1.collectibleSize )
	CoD.perController[f546_arg2].inspectingCollectibleSize = f546_arg1.collectibleSize
end

function PDV_ClearCollectible( f547_arg0, f547_arg1, f547_arg2 )
	local f547_local0 = f547_arg1:getModel( f547_arg2, "collectibleSlot" )
	if f547_local0 then
		local f547_local1 = Engine.GetModelValue( f547_local0 )
		Engine.ClearBunkCollectible( f547_arg2, f547_local1 )
		Engine.SendClientScriptNotify( f547_arg2, "collectible_update" .. CoD.GetLocalClientAdjustedNum( f547_arg2 ), "unequip", f547_local1 )
	end
end

function PDV_ClearPreviewCollectible( f548_arg0, f548_arg1, f548_arg2 )
	local f548_local0 = f548_arg1:getModel( f548_arg2, "collectibleSlot" )
	if f548_local0 then
		Engine.SendClientScriptNotify( f548_arg2, "collectible_update" .. CoD.GetLocalClientAdjustedNum( f548_arg2 ), "clear_preview_collectible", Engine.GetModelValue( f548_local0 ) )
	end
end

function PDV_ChangeFocusCollectibleSlot( f549_arg0, f549_arg1, f549_arg2 )
	local f549_local0 = f549_arg1:getModel( f549_arg2, "collectibleSlot" )
	if f549_local0 then
		local f549_local1 = Engine.GetModelValue( f549_local0 )
		for f549_local6, f549_local7 in ipairs( Engine.GetAssetList( CoD.mapsTable[CoD.perController[f549_arg2].placeCollectibleMapName].collectibles ) ) do
			if f549_local7.name == CoD.perController[f549_arg2].placeCollectibleName then
				local f549_local5 = f549_local7.uiModel
				if f549_local7.uiModelWithStand ~= nil then
					f549_local5 = f549_local7.uiModelWithStand
				end
				Engine.SendClientScriptNotify( f549_arg2, "collectible_update" .. CoD.GetLocalClientAdjustedNum( f549_arg2 ), "focus_change", f549_local1, f549_local5 )
			end
		end
	end
end

function PDV_SelectCollectibleSlot( f550_arg0, f550_arg1, f550_arg2 )
	local f550_local0 = f550_arg1:getModel( f550_arg2, "collectibleSlot" )
	if f550_local0 then
		local f550_local1 = Engine.GetModelValue( f550_local0 )
		local f550_local2 = Engine.SetBunkCollectible( f550_arg2, f550_local1, CoD.perController[f550_arg2].placeCollectibleMapName, CoD.perController[f550_arg2].placeCollectibleName )
		if f550_local2 ~= Enum.bunkCollectibleSlots_e.BUNK_INVALID_SLOT then
			Engine.SendClientScriptNotify( f550_arg2, "collectible_update" .. CoD.GetLocalClientAdjustedNum( f550_arg2 ), "unequip", f550_local2 )
		end
		for f550_local7, f550_local8 in ipairs( Engine.GetAssetList( CoD.mapsTable[CoD.perController[f550_arg2].placeCollectibleMapName].collectibles ) ) do
			if f550_local8.name == CoD.perController[f550_arg2].placeCollectibleName then
				local f550_local6 = f550_local8.uiModel
				if f550_local8.uiModelWithStand ~= nil then
					f550_local6 = f550_local8.uiModelWithStand
				end
				Engine.SendClientScriptNotify( f550_arg2, "collectible_update" .. CoD.GetLocalClientAdjustedNum( f550_arg2 ), "equip", f550_local1, f550_local6 )
			end
		end
	end
end

function MRV_SelectReplayMission( f551_arg0, f551_arg1, f551_arg2 )
	local f551_local0 = Engine.GetModel( f551_arg0:getModel(), "selectedMission" )
	if f551_arg1 == nil or f551_arg1.mapId == nil or CoD.mapsTable[f551_arg1.mapId] == nil then
		return 
	end
	local f551_local1 = CoD.mapsTable[f551_arg1.mapId]
	Engine.SetModelValue( Engine.GetModel( f551_local0, "mapName" ), f551_local1.mapName )
	Engine.SetModelValue( Engine.GetModel( f551_local0, "mapNameCaps" ), f551_local1.mapNameCaps )
	Engine.SetModelValue( Engine.GetModel( f551_local0, "previewImage" ), f551_local1.previewImage )
	Engine.SetModelValue( Engine.GetModel( f551_local0, "mapLocation" ), f551_local1.mapLocation )
	Engine.SetModelValue( Engine.GetModel( f551_local0, "mapDescription" ), f551_local1.mapDescription )
	local f551_local2 = 0
	local f551_local3 = 0
	if f551_local1.collectibles then
		local f551_local4 = Engine.GetAssetList( f551_local1.collectibles )
		if f551_local4 ~= nil then
			f551_local2 = #f551_local4
			for f551_local5 = 0, f551_local2 - 1, 1 do
				if Engine.ClientHasCollectible( f551_arg2, f551_arg1.mapId, f551_local5 ) then
					f551_local3 = f551_local3 + 1
				end
			end
		end
	end
	local f551_local4 = Engine.GetPlayerStats( f551_arg2 )
	local f551_local5 = f551_local4.PlayerStatsByMap[f551_local1.rootMapName].highestStats
	Engine.SetModelValue( Engine.GetModel( f551_local0, "collectiblesFound" ), f551_local3 )
	Engine.SetModelValue( Engine.GetModel( f551_local0, "collectiblesTotal" ), f551_local2 )
	Engine.SetModelValue( Engine.GetModel( f551_local0, "highestScore" ), f551_local5.SCORE:get() )
	Engine.SetModelValue( Engine.GetModel( f551_local0, "completionDifficulty" ), f551_local5.HIGHEST_DIFFICULTY:get() )
end

function MRV_ClickReplayMission( f552_arg0, f552_arg1, f552_arg2, f552_arg3 )
	if f552_arg2 == nil or f552_arg2.mapId == nil or CoD.mapsTable[f552_arg2.mapId] == nil then
		return 
	elseif IsElementPropertyValue( f552_arg2, "classified", true ) then
		f552_arg1:OpenModalDialog( f552_arg0, f552_arg3, "MENU_OUTOFORDER_PLAY", "", {
			"MPUI_YES",
			"MPUI_NO"
		}, function ( f553_arg0 )
			if f553_arg0 == 0 then
				local f553_local0 = Engine.GetPlayerStats( f552_arg3, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_CAMPAIGN )
				f553_local0.allMapsUnlocked:set( 1 )
				f552_arg0.MapList:updateDataSource()
			end
			return true
		end )
	else
		local f552_local0 = Engine.GetModel( Engine.GetGlobalModel(), "nextMap" )
		if f552_local0 ~= nil then
			Engine.SetModelValue( f552_local0, f552_arg2.mapId )
			SendMenuResponseExpression( f552_arg3, "MissionRecordVaultMenu", f552_arg2.mapId )
			Engine.SetDvar( "ui_blocksaves", "1" )
			LockInput( f552_arg0, f552_arg3, false )
			SendMenuResponse( f552_arg0, "MissionRecordVaultMenu", "closed", f552_arg3 )
		end
	end
end

function MRV_SelectAccolade( f554_arg0, f554_arg1, f554_arg2 )
	local f554_local0 = f554_arg1:getModel()
	if f554_arg1 == nil or f554_local0 == nil then
		return 
	end
	local f554_local1 = Engine.GetModel( f554_arg0:getModel(), "selectedAccolade" )
	local f554_local2 = {
		"challengeName",
		"challengeDetails",
		"challengeProgressQuantity",
		"rewardImage",
		"rewardName",
		"completed",
		"centerText",
		"challengeWidget"
	}
	for f554_local3 = 1, #f554_local2, 1 do
		local f554_local6 = Engine.GetModel( f554_local0, f554_local2[f554_local3] )
		if f554_local6 then
			f554_local6 = Engine.GetModelValue( f554_local6 )
		end
		if f554_local6 == nil then
			Engine.SetModelValue( Engine.GetModel( f554_local1, f554_local2[f554_local3] ), "" )
		else
			Engine.SetModelValue( Engine.GetModel( f554_local1, f554_local2[f554_local3] ), f554_local6 )
		end
	end
end

function ClearSavedHeroForEdits( f555_arg0 )
	CoD.CCUtility.SetEdittingHero( f555_arg0, nil )
end

function RefreshCharacterCustomization( f556_arg0, f556_arg1, f556_arg2 )
	Engine.SendClientScriptNotify( f556_arg2, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f556_arg2 ), "refresh", Engine.GetLocalClientNum( f556_arg2 ), CoD.CCUtility.customizationMode )
end

function SelectGender( f557_arg0, f557_arg1, f557_arg2 )
	if f557_arg1.gender then
		Engine.SetGender( f557_arg2, f557_arg1.gender )
		RefreshCharacterCustomization( f557_arg0, f557_arg1, f557_arg2 )
	end
end

function SelectHead( f558_arg0, f558_arg1, f558_arg2 )
	if f558_arg1.headIndex then
		Engine.SetHead( f558_arg2, CoD.CCUtility.customizationMode, f558_arg1.headIndex )
		RefreshCharacterCustomization( f558_arg0, f558_arg1, f558_arg2 )
	end
end

function HeadHighlighted( f559_arg0, f559_arg1, f559_arg2 )
	Engine.SendClientScriptNotify( f559_arg2, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f559_arg2 ), "changeHead", f559_arg1.headIndex, CoD.CCUtility.customizationMode )
end

function UpdateDifficulty( f560_arg0, f560_arg1, f560_arg2 )
	local f560_local0 = Engine.GetProfileVarInt( f560_arg2, "g_gameskill" ) or 0
	if f560_arg1 == LobbyData.UITargets.UI_CPLOBBYONLINE.name then
		f560_local0 = GetCPDifficulty( f560_arg2, "g_gameskill_online_cp" ) or f560_local0
	elseif f560_arg1 == LobbyData.UITargets.UI_CPLOBBYLANGAME.name then
		f560_local0 = GetCPDifficulty( f560_arg2, "g_gameskill_offline_cp" ) or f560_local0
	elseif f560_arg1 == LobbyData.UITargets.UI_CP2LOBBYONLINE.name then
		f560_local0 = GetCPDifficulty( f560_arg2, "g_gameskill_online_cpzm" ) or f560_local0
	elseif f560_arg1 == LobbyData.UITargets.UI_CP2LOBBYLANGAME.name then
		f560_local0 = GetCPDifficulty( f560_arg2, "g_gameskill_offline_cpzm" ) or f560_local0
	else
		return 
	end
	Engine.SetProfileVar( f560_arg2, "g_gameskill", f560_local0 )
	Engine.Exec( f560_arg2, "updategamerprofile" )
end

function SetDifficulty( f561_arg0, f561_arg1, f561_arg2 )
	if f561_arg1.difficulty then
		for f561_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
			Engine.SetProfileVar( f561_local0, "g_gameskill", f561_arg1.difficulty )
			if Engine.IsCampaignModeZombies() and not IsLive() then
				SetCPDifficulty( f561_local0, "g_gameskill_offline_cpzm", f561_arg1.difficulty )
			elseif Engine.IsCampaignModeZombies() then
				SetCPDifficulty( f561_local0, "g_gameskill_online_cpzm", f561_arg1.difficulty )
			elseif not IsLive() then
				SetCPDifficulty( f561_local0, "g_gameskill_offline_cp", f561_arg1.difficulty )
			else
				SetCPDifficulty( f561_local0, "g_gameskill_online_cp", f561_arg1.difficulty )
			end
			Engine.Exec( f561_local0, "updategamerprofile" )
			local f561_local3 = Engine.CreateModel( Engine.GetGlobalModel(), "CampaignSettings" )
			Engine.SetModelValue( Engine.CreateModel( f561_local3, "difficulty" ), Engine.Localize( CoD.DIFFICULTY[Engine.GetProfileVarInt( f561_local0, "g_gameskill" )] ) )
			Engine.SetModelValue( Engine.CreateModel( f561_local3, "difficultyIcon" ), CoD.DIFFICULTY_ICON[Engine.GetProfileVarInt( f561_local0, "g_gameskill" )] )
			Engine.SendMenuResponse( f561_local0, "difficulty", f561_arg1.difficulty )
		end
	end
end

function SetSelectedCPMission( f562_arg0, f562_arg1, f562_arg2 )
	if f562_arg1.mapId ~= nil then
		local f562_local0 = f562_arg1.mapId
		if Engine.IsCampaignModeZombies() == true then
			SetMap( f562_arg2, string.gsub( f562_arg1.mapId, "_nightmares", "" ), false )
		else
			SetMap( f562_arg2, f562_local0, true )
		end
	end
end

function SetFirstTimeSetupComplete( f563_arg0, f563_arg1, f563_arg2 )
	Engine.SetFirstTimeComplete( f563_arg2, Enum.eModes.MODE_CAMPAIGN, true )
end

function GetPlaylistIDForSelectedCPMission( f564_arg0, f564_arg1, f564_arg2 )
	if f564_arg1.mapId ~= nil then
		local f564_local0 = f564_arg1.mapId
		local f564_local1 = CoD.mapsTable[f564_local0]
		for f564_local11, f564_local12 in ipairs( Engine.GetPlaylistCategories() ) do
			if not (not Engine.IsCampaignModeZombies() or f564_local12.ref ~= "cp_nightmares_public") or not Engine.IsCampaignModeZombies() and f564_local12.ref == "cp_public" then
				local f564_local5 = f564_local12.playlists
				if f564_local5 then
					for f564_local9, f564_local10 in ipairs( f564_local5 ) do
						if string.find( f564_local10.name, f564_local0 ) ~= nil then
							return f564_local10.index
						end
					end
				end
			end
		end
	end
	local f564_local0 = 0
	if Engine.CurrentSessionMode() == Enum.eModes.MODE_CAMPAIGN then
		if Engine.IsCampaignModeZombies() then
			f564_local0 = 220
		else
			f564_local0 = 200
		end
	end
	return f564_local0
end

function SelectHero( f565_arg0, f565_arg1, f565_arg2 )
	local f565_local0 = nil
	if CoD.CCUtility.Heroes.HeroIndexForEdits then
		local f565_local1 = Engine.GetHeroSelectSoundAlias( CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits )
		if f565_local1 ~= "" then
			f565_local0 = f565_local1
		end
		Engine.SetHero( f565_arg2, CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits )
		local f565_local2 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
		if Engine.InLobbyParty( Enum.LobbyType.LOBBY_TYPE_GAME ) == true then
			f565_local2 = Enum.LobbyType.LOBBY_TYPE_GAME
		end
		if Engine.SendClientHeartbeat then
			Engine.SendClientHeartbeat( f565_arg2, f565_local2 )
		end
	end
	f565_arg1:dispatchEventToChildren( {
		name = "gamepad_button",
		down = true,
		button = "primary",
		isRepeated = false,
		controller = f565_arg2
	} )
	Engine.SendClientScriptNotify( f565_arg2, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f565_arg2 ), "refresh", Engine.GetLocalClientNum( f565_arg2 ), CoD.CCUtility.customizationMode, f565_local0 )
	ClearSavedHeroForEdits( f565_arg2 )
end

function NavigateToNextHeroCard( f566_arg0, f566_arg1, f566_arg2, f566_arg3 )
	if FirstTimeSetup_Overview( f566_arg3 ) then
		FirstTimeSetup_SetChangedCharacter( f566_arg3 )
		if SelectNextItemIfPossibleAndNotDisabled( f566_arg1, f566_arg2, f566_arg3 ) and not IsSelfInState( f566_arg2, "DefaultState" ) and not IsSelfInState( f566_arg2, "Locked" ) then
			SetHeroCardStateToDefault( f566_arg0, f566_arg1, f566_arg2, f566_arg3 )
		end
	elseif FirstTimeSetup_ChangedCharacter( f566_arg3 ) then
		if SelectNextItemIfPossibleAndNotDisabled( f566_arg1, f566_arg2, f566_arg3 ) and not IsSelfInState( f566_arg2, "DefaultState" ) and not IsSelfInState( f566_arg2, "Locked" ) then
			SetHeroCardStateToDefault( f566_arg0, f566_arg1, f566_arg2, f566_arg3 )
		end
	elseif SelectNextItemIfPossible( f566_arg1, f566_arg2, f566_arg3 ) and not IsSelfInState( f566_arg2, "DefaultState" ) and not IsSelfInState( f566_arg2, "Locked" ) then
		SetHeroCardStateToDefault( f566_arg0, f566_arg1, f566_arg2, f566_arg3 )
	end
end

function NavigateToPreviousHeroCard( f567_arg0, f567_arg1, f567_arg2, f567_arg3 )
	if FirstTimeSetup_Overview( f567_arg3 ) then
		FirstTimeSetup_SetChangedCharacter( f567_arg3 )
		if SelectPreviousItemIfPossibleAndNotDisabled( f567_arg1, f567_arg2, f567_arg3 ) and f567_arg2.currentState == "Flipped" then
			SetHeroCardStateToDefault( f567_arg0, f567_arg1, f567_arg2, f567_arg3 )
		end
	elseif FirstTimeSetup_ChangedCharacter( f567_arg3 ) then
		if SelectPreviousItemIfPossibleAndNotDisabled( f567_arg1, f567_arg2, f567_arg3 ) and f567_arg2.currentState == "Flipped" then
			SetHeroCardStateToDefault( f567_arg0, f567_arg1, f567_arg2, f567_arg3 )
		end
	elseif SelectPreviousItemIfPossible( f567_arg1, f567_arg2, f567_arg3 ) and f567_arg2.currentState == "Flipped" then
		SetHeroCardStateToDefault( f567_arg0, f567_arg1, f567_arg2, f567_arg3 )
	end
end

function MarkSpecialistTransmissionOld( f568_arg0, f568_arg1, f568_arg2 )
	if CoD.SafeGetModelValue( f568_arg1:getModel(), "isNew" ) == true then
		local f568_local0 = CoD.SafeGetModelValue( DataSources.StorageGlobal.getModel( f568_arg2 ), "stats_mp" )
		if f568_local0 then
			local f568_local1 = LUI.getTableFromPath( CoD.CCUtility.GetTransmissionNewStatPath( f568_arg1.heroIndex, f568_arg1.transmissionIndex ), Engine.StorageGetBuffer( f568_arg2, f568_local0 ) )
			if f568_local1 then
				f568_local1:set( 1 )
				local f568_local2 = f568_arg1:getModel( f568_arg2, "isNew" )
				if f568_local2 then
					Engine.SetModelValue( f568_local2, false )
				end
				local f568_local3 = f568_arg0:getModel( f568_arg2, "newTransmissions" )
				if f568_local3 then
					Engine.SetModelValue( f568_local3, math.max( 0, Engine.GetModelValue( f568_local3 ) - 1 ) )
				end
			end
		end
	end
end

function PlaySpecialistTransmission( f569_arg0, f569_arg1 )
	StopSpecialistTransmission( f569_arg0, f569_arg1 )
	local f569_local0 = f569_arg0:getModel( f569_arg1, "playingSound" )
	local f569_local1 = CoD.SafeGetModelValue( f569_arg0:getModel(), "alias" )
	if f569_local0 and not Engine.GetModelValue( f569_local0 ) and f569_local1 and f569_local1 ~= "" then
		Engine.SetModelValue( f569_local0, true )
		f569_arg0.soundTimer = LUI.UITimer.newElementTimer( Engine.GetSoundPlaybackTime( f569_local1 ) or 5000, true, function ()
			Engine.SetModelValue( f569_local0, false )
			f569_arg0.soundTimer = nil
		end )
		f569_arg0:addElement( f569_arg0.soundTimer )
		Engine.PlaySound( f569_local1 )
	end
end

function StopSpecialistTransmission( f571_arg0, f571_arg1 )
	local f571_local0 = f571_arg0:getModel( f571_arg1, "playingSound" )
	if f571_local0 and Engine.GetModelValue( f571_local0 ) then
		if f571_arg0.soundTimer then
			f571_arg0.soundTimer:close()
			f571_arg0.soundTimer = nil
		end
		StopSoundFromElementModel( f571_arg1, f571_arg0, "alias" )
		Engine.SetModelValue( f571_local0, false )
	end
end

function SetEdittingHeroFromStats( f572_arg0 )
	CoD.CCUtility.SetEdittingHero( f572_arg0, Engine.GetEquippedHero( f572_arg0, CoD.CCUtility.customizationMode ) )
end

function UpdateEditingHero( f573_arg0, f573_arg1 )
	if f573_arg0.heroIndex then
		CoD.CCUtility.SetEdittingHero( f573_arg1, f573_arg0.heroIndex )
		Engine.SendClientScriptNotify( f573_arg1, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f573_arg1 ), "changeHero", CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.customizationMode )
		NotifyScriptCharacterLoadoutChange( f573_arg1, Engine.GetLoadoutTypeForHero( f573_arg1, f573_arg0.heroIndex ) )
	end
end

function HeroLoadoutPreviewChange( f574_arg0, f574_arg1 )
	if not f574_arg0.disabled then
		NotifyScriptCharacterLoadoutChange( f574_arg1, f574_arg0.equippedSlot )
	end
end

function HeroLoadoutChanged( f575_arg0, f575_arg1, f575_arg2 )
	if not f575_arg1.disabled then
		Engine.SetHeroLoadoutItem( f575_arg2, CoD.CCUtility.customizationMode, f575_arg1.heroIndex, f575_arg1.equippedSlot )
		SaveLoadout( f575_arg0, f575_arg2 )
	end
end

function BeginEdittingHeroOption( f576_arg0, f576_arg1, f576_arg2 )
	if f576_arg0.updateMode then
		local f576_local0 = f576_arg1:getModel( f576_arg2, "colorListDatasource" )
		local f576_local1 = ""
		if f576_local0 then
			f576_local1 = Engine.GetModelValue( f576_local0 )
		end
		f576_arg0.updateMode( CoD.CCUtility.PersonalizeHeroData.Modes.EdittingOption, nil, f576_arg1, f576_local1 ~= "" )
	end
end

function BeginChoosingGestureOption( f577_arg0, f577_arg1 )
	if f577_arg0.updateMode then
		f577_arg0.updateMode( CoD.CCUtility.TauntsData.Modes.EdittingGesture, nil, f577_arg1.gestureType )
	end
end

function CancelChoosingGestureOption( f578_arg0 )
	if f578_arg0.updateMode then
		f578_arg0.updateMode( CoD.CCUtility.TauntsData.Modes.ExploringTaunts, false )
	end
end

function GestureItemSelected( f579_arg0, f579_arg1, f579_arg2 )
	Engine.SelectGesture( f579_arg2, CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.TauntsData.EdittingTauntOrGestureType, f579_arg1.index )
	if f579_arg0.updateMode then
		f579_arg0.updateMode( CoD.CCUtility.TauntsData.Modes.ExploringTaunts, true )
	end
end

function PreviewGesture( f580_arg0, f580_arg1 )
	PreviewGesture_Internal( f580_arg0, f580_arg1.xanim )
end

function BeginChoosingTauntOption( f581_arg0, f581_arg1 )
	if f581_arg0.updateMode then
		f581_arg0.updateMode( CoD.CCUtility.TauntsData.Modes.EdittingTaunt, nil, f581_arg1.tauntType )
	end
end

function CancelChoosingTauntOption( f582_arg0 )
	if f582_arg0.updateMode then
		f582_arg0.updateMode( CoD.CCUtility.TauntsData.Modes.ExploringTaunts, false )
	end
end

function TauntItemSelected( f583_arg0, f583_arg1, f583_arg2 )
	Engine.SelectTaunt( f583_arg2, CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.TauntsData.EdittingTauntOrGestureType, f583_arg1.index )
	if f583_arg0.updateMode then
		f583_arg0.updateMode( CoD.CCUtility.TauntsData.Modes.ExploringTaunts, true )
	end
end

function PreviewTaunt( f584_arg0, f584_arg1 )
	PreviewTaunt_Internal( f584_arg0, f584_arg1.xanim )
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
			local f585_local1 = not IsSelfModelValueTrue( f585_arg1, f585_arg2, "isLocked" )
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

function HeroBlackjackActivateContract( f587_arg0, f587_arg1, f587_arg2 )
	local f587_local0 = Engine.StorageGetBuffer( f587_arg2, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if f587_local0 and f587_local0.TenthSpecialistContract and Engine.ConsumableGet( f587_arg2, "blackjack", "awarded" ) <= Engine.ConsumableGet( f587_arg2, "blackjack", "consumed" ) then
		f587_local0.blackjack_contract_count:set( math.max( 0, f587_local0.blackjack_contract_count:get() - 1 ) )
		f587_local0.TenthSpecialistContract.active:set( 1 )
		f587_local0.TenthSpecialistContract.special_card_earned:set( 0 )
		Engine.ConsumableIncrement( f587_arg2, "blackjack", "awarded", Dvar.tu11_blackjack_contract_time:get() or 3600 )
		Engine.PlaySound( "mpl_bm_specialist_coin_place" )
		local f587_local1 = f587_arg0:getModel( f587_arg2, "contractsRemaining" )
		if f587_local1 then
			Engine.SetModelValue( f587_local1, f587_local0.blackjack_contract_count:get() )
		end
		local f587_local2 = Engine.ConsumableGet( f587_arg2, "blackjack", "awarded" ) - Engine.ConsumableGet( f587_arg2, "blackjack", "consumed" )
		local f587_local3 = f587_arg0:getModel( f587_arg2, "isActivated" )
		if f587_local3 then
			Engine.SetModelValue( f587_local3, f587_local2 > 0 )
		end
		local f587_local4 = f587_arg0:getModel( f587_arg2, "activeTimeRemaining" )
		if f587_local4 then
			Engine.SetModelValue( f587_local4, f587_local2 * 1000 )
		end
	end
	UploadStats( f587_arg0, f587_arg2 )
end

function HeroBlackjackOptionSelected( f588_arg0, f588_arg1 )
	local f588_local0 = CoD.CCUtility.GetBlackjackHeroIndex()
	local f588_local1 = Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET
	local f588_local2 = CoD.SafeGetModelValue( f588_arg0:getModel(), "equippedSlot" )
	if f588_local0 and f588_local2 then
		Engine.SetHeroItem( f588_arg1, CoD.CCUtility.customizationMode, f588_local0, f588_local1, f588_local2 )
	end
	local f588_local3 = "blackjack_coin"
	if f588_local2 == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET then
		f588_local3 = "blackjack_cards"
	end
	local f588_local4 = Engine.GetItemIndexFromReference( f588_local3, CoD.CCUtility.customizationMode )
	if f588_local4 ~= -1 then
		CoD.CCUtility.PersonalizeHeroData.SetHeroShowcaseWeapon( f588_arg1, f588_local4 )
	end
	local f588_local5 = Engine.StorageGetBuffer( f588_arg1, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if f588_local5 and f588_local5.TenthSpecialistContract then
		local f588_local6 = Engine.GetEquippedHero( f588_arg1, Enum.eModes.MODE_MULTIPLAYER )
		if f588_local6 ~= f588_local0 then
			LuaUtils.SetLastSelectedSpecialist( f588_arg1, f588_local6 )
		end
	end
	UploadStats( f588_arg0, f588_arg1 )
end

function HeroColorsSelected( f589_arg0, f589_arg1, f589_arg2 )
	if f589_arg0.updateMode then
		local f589_local0 = nil
		if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
			f589_local0 = CoD.CCUtility.Heroes.selectionTable.selectedBody
		elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
			f589_local0 = CoD.CCUtility.Heroes.selectionTable.selectedHelmet
		end
		for f589_local4, f589_local5 in pairs( CoD.CCUtility.PersonalizeHeroData.CurrentColors ) do
			Engine.SetHeroItem( f589_arg2, CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.PersonalizeHeroData.EdittingArea, f589_local0, f589_local4, f589_local5 )
		end
		f589_arg0.updateMode( CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions, {
			customizationArea = CoD.CCUtility.PersonalizeHeroData.EdittingArea,
			colorRow = true
		} )
	end
end

function HeroColorSectionHighlighted( f590_arg0, f590_arg1, f590_arg2 )
	if CoD.CCUtility.PersonalizeHeroData.EdittingElement and f590_arg1.colorTableIndex then
		CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex = f590_arg1.colorTableIndex
		CoD.CCUtility.PersonalizeHeroData.CurrentColors[f590_arg1.colorTableIndex - 1] = f590_arg1.optionIndex - 1
		local f590_local0 = nil
		if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
			f590_local0 = CoD.CCUtility.Heroes.heroCustomizationTable.bodies[CoD.CCUtility.Heroes.selectionTable.selectedBody + 1].accents
		elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
			f590_local0 = CoD.CCUtility.Heroes.heroCustomizationTable.helmets[CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1].accents
		end
		if f590_local0 then
			local f590_local1 = f590_local0[f590_arg1.colorTableIndex][f590_arg1.optionIndex]
			if f590_local1 and f590_local1.name then
				local f590_local2 = CoD.CCUtility.PersonalizeHeroData.EdittingElement:getModel( f590_arg2, "currentSelectionName" )
				if f590_local2 then
					Engine.SetModelValue( f590_local2, f590_local1.name )
				end
			end
		end
		HeroOptionHighlighted( f590_arg0, f590_arg1, f590_arg2 )
	end
end

function CancelHeroOptionSelection( f591_arg0, f591_arg1 )
	if CoD.CCUtility.PersonalizeHeroData.EdittingElement then
		if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
			local f591_local0, f591_local1 = nil
			if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				f591_local0 = "changeBodyAccentColor"
				f591_local1 = CoD.CCUtility.Heroes.selectionTable.bodyColors[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex]
			elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				f591_local0 = "changeHelmetAccentColor"
				f591_local1 = CoD.CCUtility.Heroes.selectionTable.helmetColors[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex]
			end
			if f591_local0 and f591_local1 then
				Engine.SendClientScriptNotify( f591_arg1, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f591_arg1 ), f591_local0, CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex - 1, f591_local1 )
			end
		else
			local f591_local0, f591_local1 = nil
			if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				f591_local0 = "changeBody"
				f591_local1 = CoD.CCUtility.Heroes.selectionTable.selectedBody
			elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				f591_local0 = "changeHelmet"
				f591_local1 = CoD.CCUtility.Heroes.selectionTable.selectedHelmet
			end
			if f591_local0 and f591_local1 then
				Engine.SendClientScriptNotify( f591_arg1, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f591_arg1 ), f591_local0, f591_local1, CoD.CCUtility.customizationMode )
			end
		end
	end
	if f591_arg0.updateMode then
		f591_arg0.updateMode( CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions )
	end
end

function HeroShowcaseWeaponSelected( f592_arg0, f592_arg1, f592_arg2 )
	if f592_arg0.updateMode then
		local f592_local0 = f592_arg1:getModel()
		if f592_local0 then
			local f592_local1 = Engine.GetModel( f592_local0, "itemIndex" )
			if f592_local1 then
				local f592_local2 = Engine.GetModelValue( f592_local1 )
				CoD.CCUtility.PersonalizeHeroData.SetHeroShowcaseWeapon( f592_arg2, f592_local2 )
				Engine.SendClientScriptNotify( f592_arg2, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f592_arg2 ), "changeShowcaseWeapon", Engine.GetItemRef( f592_local2 ) .. "_" .. CoD.gameMode:lower(), "", "", CoD.CCUtility.customizationMode )
			end
		end
	end
end

function HeroShowcaseWeaponVariantSelected( f593_arg0, f593_arg1, f593_arg2 )
	if f593_arg0.updateMode then
		local f593_local0 = f593_arg1.weaponVariantInfo.variantNameBig
		local f593_local1 = f593_arg1.weaponVariantInfo.weaponIndex
		local f593_local2 = f593_arg1.weaponVariantInfo.attachmentsByIndex
		local f593_local3 = f593_arg1.weaponVariantInfo.attachmentVariant
		local f593_local4 = f593_arg1.weaponVariantInfo.camoIndex
		local f593_local5 = f593_arg1.weaponVariantInfo.paintjobSlot
		local f593_local6 = f593_arg1.weaponVariantInfo.paintjobIndex
		if CoD.CCUtility.PersonalizeHeroData.IsDualWieldWeapon( f593_local1, f593_local2 ) then
			f593_local1 = CoD.CCUtility.PersonalizeHeroData.GetDualWieldVersionOfWeapon( f593_arg2, f593_local1 )
		end
		CoD.CCUtility.PersonalizeHeroData.SetHeroShowcaseWeapon( f593_arg2, f593_local1, f593_local0, f593_local2, f593_local3, f593_local4, f593_local5, f593_local6 )
		Engine.SendClientScriptNotify( f593_arg2, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f593_arg2 ), "changeShowcaseWeapon", CoD.CCUtility.PersonalizeHeroData.GetHeroShowcaseWeaponName( f593_local1, f593_local2 ), CoD.CACUtility.GetAttachmentCosmeticVariantsFromVariantInfo( f593_arg1.weaponVariantInfo ), CoD.CCUtility.PersonalizeHeroData.GetHeroShowcaseWeaponRenderOptions( f593_local4, f593_local5, f593_local6 ), CoD.CCUtility.customizationMode )
	end
end

function SetHeroItemOptionAsOld( f594_arg0, f594_arg1, f594_arg2 )
	local f594_local0 = f594_arg1:getModel( f594_arg2, "optionIndex" )
	if f594_local0 then
		local f594_local1 = Engine.GetModelValue( f594_local0 )
		local f594_local2 = CoD.CCUtility.Heroes.HeroIndexForEdits
		local f594_local3 = CoD.CCUtility.PersonalizeHeroData.EdittingArea
		if f594_local1 and f594_local2 and f594_local3 then
			Engine.SetCharacterCustomizationItemAsOld( f594_arg2, f594_local2, f594_local3, f594_local1 )
			local f594_local4 = CoD.CCUtility.PersonalizeHeroData.EdittingElement:getModel( f594_arg2, "breadcrumbCount" )
			if f594_local4 then
				local f594_local5 = Engine.CharacterCustomizationNewItemCount( f594_arg2, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.PersonalizeHeroData.EdittingArea )
				Engine.SetModelValue( f594_local4, f594_local5.total )
			end
			local f594_local6 = f594_arg0.categoryTabs.Tabs.grid:getItemAt( f594_arg0.categoryTabs.Tabs.grid.savedActiveIndex + 1 )
			if f594_local6 then
				local f594_local7 = Engine.CharacterCustomizationNewItemCount( f594_arg2, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.PersonalizeHeroData.EdittingArea )
				local f594_local8 = f594_local6:getModel( f594_arg2, "breadcrumbCount" )
				if f594_local8 then
					local f594_local9 = 0
					if f594_local6.filterName == "loot" then
						f594_local9 = f594_local7.loot
					else
						f594_local9 = f594_local7.standard
					end
					Engine.SetModelValue( f594_local8, f594_local9 )
				end
			end
		end
	end
end

function SetHeroTauntAsOld( f595_arg0, f595_arg1, f595_arg2 )
	if f595_arg1.index and f595_arg1.tauntType then
		Engine.SetTauntAsOld( f595_arg2, Enum.eModes.MODE_MULTIPLAYER, CoD.CCUtility.Heroes.HeroIndexForEdits, f595_arg1.tauntType, f595_arg1.index )
	end
end

function SetHeroGestureAsOld( f596_arg0, f596_arg1, f596_arg2 )
	if f596_arg1.index and f596_arg1.gestureType then
		Engine.SetGestureAsOld( f596_arg2, Enum.eModes.MODE_MULTIPLAYER, CoD.CCUtility.Heroes.HeroIndexForEdits, f596_arg1.gestureType, f596_arg1.index )
	end
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

function RedeemCode( f605_arg0, f605_arg1, f605_arg2 )
	Engine.ShowRedeemCode( f605_arg2 )
end

function ShowPsStoreIcon( f606_arg0 )
	Store_UpdatePSStoreIconCount( f606_arg0, 1 )
	Engine.ShowPsStoreIcon()
end

function HidePsStoreIcon( f607_arg0 )
	Store_UpdatePSStoreIconCount( f607_arg0, -1 )
	if CoD.perController[f607_arg0].psStoreIconCount ~= nil and CoD.perController[f607_arg0].psStoreIconCount == 0 then
		Engine.HidePsStoreIcon()
		CoD.perController[f607_arg0].selectedStoreCategory = nil
		CoD.perController[f607_arg0].forceFocusCategory = nil
	end
end

function UpdateGlobalDataSource( f608_arg0, f608_arg1 )
	if DataSources[f608_arg1] then
		DataSources[f608_arg1].getModel( f608_arg0 )
	end
end

function SetSelectedStoreCategory( f609_arg0, f609_arg1, f609_arg2 )
	local f609_local0 = f609_arg1:getModel( f609_arg2, "category" )
	if f609_local0 then
		local f609_local1 = Engine.GetModelValue( f609_local0 )
		if CoD.perController[f609_arg2].selectedStoreCategory ~= f609_local1 then
			CoD.perController[f609_arg2].selectedStoreCategory = f609_local1
			local f609_local2 = false
			if not (not Engine.OwnSeasonPass( f609_arg2 ) or f609_local1 ~= "MAPPACKS") or (Engine.OwnSeasonPass( f609_arg2 ) or Engine.HasEntitlementByOwnership( f609_arg2, "zmbundle" )) and f609_local1 == "ZOMBIES" then
				f609_local2 = true
			end
			if f609_local1 == "EXTRASLOTS" or f609_local1 == "ESPORTS" then
				Engine.HidePsStoreIcon()
			else
				Engine.ShowPsStoreIcon()
			end
			Engine.SetStoreCategoryFetchParamaeters( f609_arg2, f609_local1, f609_local2 )
		end
	end
end

function PurchaseProduct( f610_arg0, f610_arg1, f610_arg2 )
	local f610_local0 = CoD.perController[f610_arg2].selectedStoreCategory
	if IsDurango() then
		local f610_local1 = f610_arg1:getModel( f610_arg2, "productID" )
		if f610_local1 then
			local f610_local2 = Engine.GetModelValue( f610_local1 )
			if f610_local2 == "dc41534d-1a0c-49fd-b1bb-9cbe094b876c" or f610_local0 == "FEATURED" or f610_local0 == "BO2" or f610_local0 == "ZOMBIES" then
				Engine.ShowProductDetailsByID( f610_arg2, f610_local0, f610_local2 )
			else
				Engine.PurchaseProductByID( f610_arg2, f610_local0, f610_local2 )
			end
		end
	elseif IsOrbis() then
		local f610_local1 = f610_arg1:getModel( f610_arg2, "serviceLabel" )
		if f610_local1 then
			local f610_local2 = Engine.GetModelValue( f610_local1 )
			if not (not Dvar.live_store_show_details:exists() or not Dvar.live_store_show_details:get()) or f610_local0 == "FEATURED" or f610_local0 == "MAPPACKS" or f610_local0 == "STRONGHOLD" or f610_local0 == "ZOMBIES" then
				local f610_local3 = f610_arg1:getModel( f610_arg2, "productID" )
				if f610_local3 then
					Engine.ShowProductDetailsByID( f610_arg2, f610_local0, Engine.GetModelValue( f610_local3 ), f610_local2 )
				end
			else
				local f610_local3 = f610_arg1:getModel( f610_arg2, "skuID" )
				if f610_local3 then
					Engine.PurchaseProductByID( f610_arg2, f610_local0, Engine.GetModelValue( f610_local3 ), f610_local2 )
				end
			end
		end
	elseif IsPC() then
		local f610_local1 = f610_arg1:getModel( f610_arg2, "skuID" )
		local f610_local2 = f610_arg1:getModel( f610_arg2, "serviceLabel" )
		if f610_local1 and f610_local2 then
			Engine.PurchaseProductByID( f610_arg2, f610_local0, Engine.GetModelValue( f610_local1 ), Engine.GetModelValue( f610_local2 ) )
		end
	end
end

function RecordStoreOnItemGainFocus( f611_arg0, f611_arg1, f611_arg2, f611_arg3 )
	f611_arg1.onGainFocusTime = Engine.milliseconds()
end

function RecordStoreOnItemLoseFocus( f612_arg0, f612_arg1, f612_arg2, f612_arg3 )
	local f612_local0 = CoD.perController[f612_arg2].selectedStoreCategory
	local f612_local1 = f612_arg1.onGainFocusTime
	local f612_local2 = 0
	local f612_local3 = Dvar.store_item_viewed_timer:get()
	if f612_local1 ~= nil then
		f612_local2 = Engine.milliseconds() - f612_local1
	end
	if f612_local3 and f612_local2 < f612_local3 then
		return 
	end
	local f612_local4 = f612_arg1:getModel( f612_arg2, "productID" )
	if f612_local4 then
		LUI.CoDMetrics.StoreItemViewed( f612_arg0, f612_arg2, Engine.GetModelValue( f612_local4 ), f612_local2 )
	end
end

function RecordStoreLastFocusedItemViewed( f613_arg0, f613_arg1, f613_arg2, f613_arg3 )
	RecordStoreOnItemLoseFocus( f613_arg0, f613_arg1, f613_arg2, f613_arg3 )
end

function OpenStoreNonFeatureFrameVOD( f614_arg0, f614_arg1, f614_arg2 )
	local f614_local0 = nil
	if f614_arg0.rightPane.frameWidget.framedWidget and f614_arg0.rightPane.frameWidget.framedWidget.storeMovie then
		f614_local0 = f614_arg0.rightPane.frameWidget.framedWidget.storeMovie
		f614_local0:setupMoviePlayback( "" )
	end
	Engine.SetModelValue( Engine.GetModel( DataSources.VoDViewer.getModel( f614_arg2 ), "stream" ), CoD.SafeGetModelValue( f614_arg1:getModel(), "videoHighResRef" ) )
	LUI.OverrideFunction_CallOriginalFirst( OpenPopup( f614_arg0, "VoDViewer", f614_arg2 ), "close", function ( element )
		if f614_local0 then
			f614_local0:setupMoviePlayback( CoD.SafeGetModelValue( f614_arg1:getModel(), "videoLowResRef" ), false, true )
		end
	end )
end

function StoreFeatureFrameWidgetGainFocus( f616_arg0, f616_arg1, f616_arg2 )
	local f616_local0 = CoD.SafeGetModelValue( f616_arg1:getModel(), "videoLowResRef" )
	if f616_arg1.frameWidget and f616_arg1.frameWidget.framedWidget and f616_local0 and f616_local0 ~= "" then
		if f616_arg0.playMovieDelayTimer then
			f616_arg0.playMovieDelayTimer:close()
			f616_arg0.playMovieDelayTimer = nil
		end
		f616_arg1:registerEventHandler( "play_movie_delay", function ( element, event )
			if element:isInFocus() then
				element.frameWidget:changeFrameWidget( "CoD.StoreFeaturePreviewMovieWidget" )
				element.frameWidgetName = "StoreFeaturePreviewMovieWidget"
				if element.frameWidget.framedWidget.storeMovie then
					element.frameWidget.framedWidget.storeMovie:setupMoviePlayback( f616_local0, false, true )
				end
			end
		end )
		f616_arg0.playMovieDelayTimer = LUI.UITimer.new( 2000, {
			name = "play_movie_delay",
			controller = f616_arg2
		}, true )
		f616_arg0:addElement( f616_arg0.playMovieDelayTimer )
		f616_arg1:registerEventHandler( "finished_movie_playback", function ( element, event )
			if element:isInFocus() and element.frameWidget.framedWidget.storeMovie then
				element.frameWidget.framedWidget.storeMovie:setupMoviePlayback( "" )
				element:addElement( LUI.UITimer.newElementTimer( 1, true, function ()
					element.frameWidget.framedWidget.storeMovie:setupMoviePlayback( f616_local0, false, true )
				end ) )
			end
		end )
	end
end

function StoreFeatureFrameWidgetLoseFocus( f620_arg0, f620_arg1, f620_arg2 )
	local f620_local0 = f620_arg1:getModel()
	if f620_arg1.frameWidget and f620_arg1.frameWidget.framedWidget then
		if f620_arg1.frameWidget.framedWidget.storeMovie then
			f620_arg1.frameWidget.framedWidget.storeMovie:setupMoviePlayback( "" )
		end
		f620_arg1.frameWidget:changeFrameWidget( "CoD.StoreFeaturePreviewImageWidget" )
		f620_arg1.frameWidgetName = "StoreFeaturePreviewImageWidget"
	end
end

function StoreVideoProductFrameWidgetGainFocus( f621_arg0, f621_arg1, f621_arg2 )
	local f621_local0 = CoD.SafeGetModelValue( f621_arg1:getModel(), "videoLowResRef" )
	if f621_arg1.frameWidget and f621_arg1.frameWidget.framedWidget and f621_local0 ~= "" then
		if f621_arg0.playMovieDelayTimer then
			f621_arg0.playMovieDelayTimer:close()
			f621_arg0.playMovieDelayTimer = nil
		end
		f621_arg1:registerEventHandler( "play_movie_delay", function ( element, event )
			if element:isInFocus() then
				element.frameWidget:changeFrameWidget( "CoD.StoreVideoProductButtonMovieWidget" )
				element.frameWidgetName = "StoreVideoProductButtonMovieWidget"
				if element.frameWidget.framedWidget.storeMovie then
					element.frameWidget.framedWidget.storeMovie:setupMoviePlayback( f621_local0 )
				end
			end
		end )
		f621_arg0.playMovieDelayTimer = LUI.UITimer.new( 2000, {
			name = "play_movie_delay",
			controller = f621_arg2
		}, true )
		f621_arg1:addElement( f621_arg0.playMovieDelayTimer )
	end
end

function StoreVideoProductFrameWidgetLoseFocus( f623_arg0, f623_arg1, f623_arg2 )
	local f623_local0 = f623_arg1:getModel()
	if f623_arg1.frameWidget and f623_arg1.frameWidget.framedWidget then
		if f623_arg1.frameWidget.framedWidget.storeMovie then
			f623_arg1.frameWidget.framedWidget.storeMovie:setupMoviePlayback( "" )
		end
		f623_arg1.frameWidget:changeFrameWidget( "CoD.StoreVideoProductButtonImageWidget" )
		f623_arg1.frameWidgetName = "StoreVideoProductButtonImageWidget"
	end
end

function OpenStoreFeatureFrameVOD( f624_arg0, f624_arg1, f624_arg2 )
	local f624_local0 = nil
	if f624_arg1.frameWidget.framedWidget and f624_arg1.frameWidget.framedWidget.storeMovie then
		f624_local0 = f624_arg1.frameWidget.framedWidget.storeMovie
		f624_local0:setupMoviePlayback( "" )
	end
	Engine.SetModelValue( Engine.GetModel( DataSources.VoDViewer.getModel( f624_arg2 ), "stream" ), CoD.SafeGetModelValue( f624_arg1:getModel(), "videoHighResRef" ) )
	LUI.OverrideFunction_CallOriginalFirst( OpenPopup( f624_arg0, "VoDViewer", f624_arg2 ), "close", function ( element )
		if f624_local0 then
			f624_local0:setupMoviePlayback( CoD.SafeGetModelValue( f624_arg1:getModel(), "videoLowResRef" ), false, true )
		end
	end )
end

function EmblemEditor_HandleBackInBrowseMode( f626_arg0, f626_arg1, f626_arg2, f626_arg3 )
	Engine.ExecNow( f626_arg2, "emblemEndEdit" )
	local f626_local0 = GoBack( f626_arg0, f626_arg2 )
	if IsPaintshop( f626_arg2 ) then
		CoD.SetCustomization( f626_arg2, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT, "type" )
		ForceNotifyModel( f626_arg2, "Paintshop.UpdateDataSource" )
	else
		CoD.SetCustomization( f626_arg2, Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM, "type" )
		local f626_local1 = f626_local0.tabList.Tabs.grid
		if f626_local1 and f626_arg3 then
			local f626_local2 = f626_local1:getFirstSelectableItem()
			if f626_local2 then
				f626_local1:setActiveItem( f626_local2 )
			end
		end
		ForceNotifyModel( f626_arg2, "Emblem.UpdateDataSource" )
	end
	CoD.perController[f626_arg2].selectEmblemGroupIndex = nil
	CoD.perController[f626_arg2].selectedLayerIndex = nil
	CoD.perController[f626_arg2].selectedLayerIconID = nil
	CoD.perController[f626_arg2].selectedLayerMaterialID = nil
	CoD.SetEditorProperties( f626_arg2, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_NONE, "editorMode" )
	CoD.SetEditorProperties( f626_arg2, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE, "colorMode" )
	CoD.SetEditorProperties( f626_arg2, CoD.emblem.CLIPBOARDSTATE.EMPTY, "isClipboardEmpty" )
	Engine.CommitProfileChanges( f626_arg2 )
	Engine.ExecNow( f626_arg2, "emblemSetGridSize " .. CoD.GetCustomization( f626_arg2, "type" ) .. " 0" )
end

function EmblemEditor_SetEditMode( f627_arg0 )
	CoD.SetEditorProperties( f627_arg0, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT, "editorMode" )
end

function EmblemEditor_LayerGainFocus( f628_arg0, f628_arg1, f628_arg2, f628_arg3 )
	local f628_local0 = f628_arg2:getModel( f628_arg3, "layerIndex" )
	local f628_local1 = f628_arg2:getModel( f628_arg3, "layerNumberString" )
	local f628_local2 = Engine.GetModelValue( f628_local0 )
	CoD.Menu.SetButtonLabel( f628_arg0, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "PLATFORM_EMBLEM_EDIT_DONE" )
	CoD.Menu.SetButtonLabel( f628_arg1, Enum.LUIButton.LUI_KEY_START, "" )
	local f628_local3 = Engine.GetSelectedLayerIconID( f628_arg3, f628_local2 )
	CoD.perController[f628_arg3].selectedLayerIndex = f628_local2
	CoD.perController[f628_arg3].selectedLayerIconID = f628_local3
	CoD.perController[f628_arg3].selectedLayerMaterialID = Engine.GetSelectedLayerMaterialID( f628_arg3, f628_local2 )
	local f628_local4 = CoD.GetCustomization( f628_arg3, "type" )
	EmblemEditor_SetLayerAndGroupCount( f628_arg3, f628_local4 )
	Engine.ExecNow( f628_arg3, "emblemSelect " .. f628_local2 .. " " .. f628_local4 )
	if CoD.IsLayerEmpty( f628_arg3, CoD.perController[f628_arg3].selectedLayerIndex ) == true then
		CoD.Menu.SetButtonLabel( f628_arg0, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_EMBLEM_CHOOSE_DECAL" )
	else
		CoD.Menu.SetButtonLabel( f628_arg0, Enum.LUIButton.LUI_KEY_XBA_PSCROSS, "MENU_EMBLEM_EDIT_LAYER" )
	end
	CoD.SetEditorProperties( f628_arg3, Engine.GetLinkedLayerCount( f628_arg3, f628_local4 ), "linkedLayerCount" )
	CoD.SetEditorProperties( f628_arg3, f628_local3, "selectedDecalID" )
	Engine.ForceNotifyModelSubscriptions( f628_local1 )
	if CoD.isPC then
		if IsLayerEmpty( f628_arg1, f628_arg2, f628_arg3 ) then
			f628_arg1.actionsListPC:hide()
		else
			f628_arg1.actionsListPC:show()
		end
	end
end

function EmblemEditor_InsertDecalPressed( f629_arg0, f629_arg1, f629_arg2 )
	local f629_local0 = CoD.GetCustomization( f629_arg2, "type" )
	Engine.ExecNow( f629_arg2, "emblemCopyLayer " .. CoD.perController[f629_arg2].selectedLayerIndex )
	Engine.ExecNow( f629_arg2, "emblemInsertLayer " .. f629_local0 .. " " .. CoD.perController[f629_arg2].selectedLayerIndex )
	Engine.ExecNow( f629_arg2, "emblemClearLayerByIndex " .. CoD.perController[f629_arg2].selectedLayerIndex .. " " .. f629_local0 )
	CoD.SetEditorProperties( f629_arg2, CoD.emblem.ADDDECAL.INSERT, "addDecalMode" )
end

function EmblemEditor_SetEditLayerTitle( f630_arg0, f630_arg1 )
	if IsPaintshop( f630_arg1 ) then
		f630_arg0.PaintshopFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( CoD.Paintshop.View[CoD.perController[f630_arg1].viewIndex].edit_side_ref ) )
	else
		f630_arg0.EmblemEditorFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEM_EDIT_LAYER_TITLE" ) )
	end
end

function EmblemEditor_EditSelectedLayer( f631_arg0, f631_arg1, f631_arg2 )
	local f631_local0 = CoD.perController[f631_arg2].selectedLayerIndex
	Engine.ExecNow( f631_arg2, "emblemCopyLayer " .. f631_local0 )
	CoD.SetEditorProperties( f631_arg2, CoD.emblem.CLIPBOARDSTATE.EMPTY, "isClipboardEmpty" )
	EmblemEditor_SetEditLayerTitle( f631_arg0, f631_arg2 )
	CoD.SwapFocusableElements( f631_arg2, f631_arg0.layerCarousel, f631_arg0.emblemDrawWidget )
	EmblemEditor_SetEditMode( f631_arg2 )
	local f631_local1 = Engine.GetSelectedLayerColor( f631_arg2 )
	local f631_local2 = Engine.GetSelectedLayerColor1( f631_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f631_arg2 ), "Emblem.EmblemSelectedLayerProperties.opacity0" ), math.floor( f631_local1.alpha * 100 ) )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f631_arg2 ), "Emblem.EmblemSelectedLayerProperties.opacity1" ), math.floor( f631_local2.alpha * 100 ) )
	Engine.ExecNow( f631_arg2, "emblemBeginEdit" )
	CoD.perController[f631_arg2].selectedLayerMaterialID = Engine.GetSelectedLayerMaterialID( f631_arg2, f631_local0 )
	EmblemEditor_SetScaleMode( f631_arg2, Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED )
	EmblemEditor_SetMaterialScaleMode( f631_arg2, Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED )
end

function EmblemEditor_MoveLayer( f632_arg0, f632_arg1, f632_arg2, f632_arg3 )
	local f632_local0 = f632_arg0.layerCarousel.activeWidget
	local f632_local1 = Engine.GetModelValue( f632_local0:getModel( f632_arg2, "layerIndex" ) )
	local f632_local2 = CoD.GetCustomization( f632_arg2, "type" )
	local f632_local3 = nil
	if f632_local0 ~= nil then
		if f632_arg3 == "left" then
			if f632_local1 > 0 then
				Engine.ExecNow( f632_arg2, "emblemMoveLayerRelative -1 " .. f632_local2 )
				local f632_local4 = f632_arg0.layerCarousel:getItemAtPosition( 1, f632_local0.gridInfoTable.zeroBasedIndex, true )
				if f632_local4 ~= nil then
					DataSources.EmblemLayerList.swapItemInfo( f632_arg2, f632_arg0.layerCarousel, f632_local4, f632_local0 )
					EmblemEditor_SetupDrawEmblem( f632_arg2, f632_local0, f632_local4 )
					f632_arg0.layerCarousel:setActiveItem( f632_local4 )
					EmblemEditor_SetSelectedLayerIndex( f632_arg2, f632_local4 )
					f632_local0.arrows:setState( "DefaultState" )
					if f632_local1 > 1 then
						f632_local4.arrows:setState( "LeftButtonPressed" )
					end
				end
			end
		elseif f632_arg3 == "right" then
			local f632_local4 = Engine.GetUsedLayerCount( f632_arg2, f632_local2, CoD.perController[f632_arg2].totalLayers )
			if f632_local1 + Engine.GetModelValue( f632_local0:getModel( f632_arg2, "groupLayerCount" ) ) < f632_local4 then
				Engine.ExecNow( f632_arg2, "emblemMoveLayerRelative 1 " .. f632_local2 )
				local f632_local5 = f632_arg0.layerCarousel:getItemAtPosition( 1, f632_local0.gridInfoTable.zeroBasedIndex + 2, true )
				if f632_local5 ~= nil then
					DataSources.EmblemLayerList.swapItemInfo( f632_arg2, f632_arg0.layerCarousel, f632_local0, f632_local5 )
					EmblemEditor_SetupDrawEmblem( f632_arg2, f632_local0, f632_local5 )
					f632_arg0.layerCarousel:setActiveItem( f632_local5 )
					EmblemEditor_SetSelectedLayerIndex( f632_arg2, f632_local5 )
					f632_local0.arrows:setState( "DefaultState" )
					if f632_local1 + 2 < f632_local4 then
						f632_local5.arrows:setState( "RightButtonPressed" )
					end
				end
			end
		end
	end
end

function EmblemEditor_CopyLayerToClipboard( f633_arg0, f633_arg1, f633_arg2 )
	Engine.ExecNow( f633_arg2, "emblemCopyLayer " .. CoD.perController[f633_arg2].selectedLayerIndex )
	CoD.SetEditorProperties( f633_arg2, CoD.emblem.CLIPBOARDSTATE.FULL, "isClipboardEmpty" )
	f633_arg0.clipboard:setState( "Visible" )
end

function EmblemEditor_UpdateLayerData( f634_arg0, f634_arg1 )
	local f634_local0 = Engine.GetModelValue( f634_arg0.layerCarousel.activeWidget:getModel( f634_arg1, "layerIndex" ) )
	f634_arg0.layerCarousel:updateDataSource( true )
	local f634_local1 = f634_arg0.layerCarousel:findItem( {
		layerIndex = f634_local0
	}, nil, false, nil )
	if f634_local1 then
		f634_arg0.layerCarousel:processEvent( {
			name = "gain_focus",
			controller = f634_arg1,
			selectIndex = f634_local1.gridInfoTable.zeroBasedIndex,
			overrideScrollTime = 0
		} )
	end
end

function EmblemEditor_InsertLayer( f635_arg0, f635_arg1, f635_arg2 )
	Engine.ExecNow( f635_arg2, "emblemInsertLayer " .. CoD.GetCustomization( f635_arg2, "type" ) .. " " .. CoD.perController[f635_arg2].selectedLayerIndex )
end

function EmblemEditor_HandleBackInEditMode( f636_arg0, f636_arg1, f636_arg2 )
	Engine.ExecNow( f636_arg2, "emblemEndEdit" )
	if IsPaintshop( f636_arg2 ) == true then
		f636_arg0.PaintshopFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_PAINTSHOP_CAPS" ) )
	else
		f636_arg0.EmblemEditorFrame.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "MENU_EMBLEM_EDITOR_CAPS" ) )
	end
	SetBrowseMode( f636_arg2 )
	CoD.SwapFocusableElements( f636_arg2, f636_arg0.emblemDrawWidget, f636_arg0.layerCarousel )
end

function EmblemEditor_SetupEditorBasedOnMode( f637_arg0, f637_arg1, f637_arg2 )
	if IsEditMode( f637_arg2 ) then
		EmblemEditor_EditSelectedLayer( f637_arg0, f637_arg0.layerCarousel:findItem( {
			layerIndex = CoD.perController[f637_arg2].selectedLayerIndex
		}, nil, true, 0 ), f637_arg2 )
	else
		CoD.SwapFocusableElements( f637_arg2, f637_arg0.emblemDrawWidget, f637_arg0.layerCarousel )
	end
end

function EmblemEditor_FlipIcon( f638_arg0, f638_arg1, f638_arg2 )
	Engine.ExecNow( f638_arg2, "emblemToggleFlip" )
end

function EmblemEditor_ToggleOutline( f639_arg0, f639_arg1, f639_arg2 )
	Engine.ExecNow( f639_arg2, "emblemToggleOutline" )
end

function EmblemEditor_EndEdit( f640_arg0, f640_arg1, f640_arg2 )
	Engine.ExecNow( f640_arg2, "emblemEndEdit" )
end

function EmblemEditor_BeginEdit( f641_arg0, f641_arg1, f641_arg2 )
	Engine.ExecNow( f641_arg2, "emblemBeginEdit" )
end

function EmblemEditor_CutLayer( f642_arg0, f642_arg1, f642_arg2 )
	Engine.ExecNow( f642_arg2, "emblemCutLayer " .. CoD.GetCustomization( f642_arg2, "type" ) )
	CoD.SetEditorProperties( f642_arg2, CoD.emblem.CLIPBOARDSTATE.FULL, "isClipboardEmpty" )
	f642_arg0.clipboard:setState( "Visible" )
end

function EmblemEditor_HandleKeyboardComplete( f643_arg0, f643_arg1, f643_arg2, f643_arg3 )
	local f643_local0 = CoD.perController[f643_arg2].selectedEmblemModel
	local f643_local1 = nil
	if not f643_local0 then
		return 
	elseif f643_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_EMBLEMS then
		f643_local1 = Engine.GetModel( f643_local0, "emblemTextEntry" )
		if f643_local1 then
			Engine.SetModelValue( f643_local1, f643_arg3.input )
		end
		local f643_local2 = f643_arg0:getModel( f643_arg2, "inputText" )
		if f643_local2 then
			Engine.SetModelValue( f643_local2, f643_arg3.input )
		end
	end
end

function EmblemEditor_OpenSavePopup( f644_arg0, f644_arg1, f644_arg2, f644_arg3 )
	CoD.OverlayUtility.CreateOverlay( f644_arg2, f644_arg0, "EmblemSave", CoD.perController[f644_arg2].selectedEmblemModel )
end

function EmblemEditor_SaveEmblem( f645_arg0, f645_arg1, f645_arg2, f645_arg3 )
	local f645_local0 = Engine.GetModelValue( Engine.GetModel( f645_arg3, "emblemTextEntry" ) )
	local f645_local1 = Engine.GetModel( f645_arg3, "emblemName" )
	local f645_local2 = MediaManagerGetQuotaForCategory( f645_arg2, "emblem" )
	Engine.SetModelValue( f645_local1, f645_local0 )
	local f645_local3 = false
	EmblemEditor_RecordComScoreEvent( f645_arg0, f645_arg2, f645_local2.categorySlotsUsed, f645_local2.categoryQuota )
	if CoD.perController[f645_arg2].selectedEmblemTabStorageType == Enum.StorageFileType.STORAGE_EMBLEMS then
		CoD.CraftUtility.Emblems.UploadEmblem( f645_arg2, f645_arg3 )
		CoD.CraftUtility.Emblems.ParseDDL( f645_arg2, Enum.StorageFileType.STORAGE_EMBLEMS )
	elseif IsPreBuiltEmblemTab( f645_arg2 ) then
		local f645_local4 = Enum.StorageFileType.STORAGE_EMBLEMS
		CoD.CraftUtility.Emblems.ParseDDL( f645_arg2, f645_local4 )
		CoD.CraftUtility.Emblems.Copy( f645_arg2, f645_arg3, f645_local4 )
		f645_local3 = true
	end
	local f645_local4 = GoBack( f645_arg0, f645_arg2 )
	EmblemEditor_HandleBackInBrowseMode( f645_local4, f645_arg1, f645_arg2, f645_local3 )
	ClearSavedState( f645_local4, f645_arg2 )
end

function EmblemEditor_DiscardChanges( f646_arg0, f646_arg1, f646_arg2, f646_arg3 )
	local f646_local0 = GoBack( f646_arg0, f646_arg2 )
	EmblemEditor_HandleBackInBrowseMode( f646_local0, f646_arg1, f646_arg2 )
	ClearSavedState( f646_local0, f646_arg2 )
end

function EmblemEditor_NoChangesAction( f647_arg0, f647_arg1, f647_arg2, f647_arg3 )
	EmblemEditor_HandleBackInBrowseMode( GoBack( f647_arg0, f647_arg2 ), f647_arg1, f647_arg2 )
end

function EmblemEditor_SaveChangesBack( f648_arg0, f648_arg1, f648_arg2, f648_arg3 )
	local f648_local0 = false
	local f648_local1 = Engine.GetModel( f648_arg3, "emblemIndex" )
	if f648_local1 and CoD.CraftUtility.Emblems.IsEmblemIndexOccupied( Engine.GetModelValue( f648_local1 ) ) then
		f648_local0 = true
	end
	if not f648_local0 then
		Engine.SetModelValue( Engine.GetModel( f648_arg3, "emblemTextEntry" ), "Emblem" )
	end
end

function EmblemEditor_ToggleScaleMode( f649_arg0, f649_arg1, f649_arg2 )
	local f649_local0
	if Engine.GetEmblemScaleMode( f649_arg2 ) == Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED then
		f649_local0 = Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FREE
	else
		f649_local0 = Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED
	end
	CoD.SetEditorProperties( f649_arg2, f649_local0, "scaleMode" )
	Engine.ExecNow( f649_arg2, "emblemSetScaleMode " .. f649_local0 )
end

function EmblemEditor_LinkUnlinkLayers( f650_arg0, f650_arg1, f650_arg2 )
	local f650_local0 = f650_arg1:getModel()
	local f650_local1 = Engine.GetModel( f650_local0, "layerIndex" )
	if f650_local1 then
		local f650_local2 = Engine.GetModelValue( f650_local1 )
		local f650_local3 = CoD.GetCustomization( f650_arg2, "type" )
		local f650_local4 = Engine.GetModel( f650_local0, "isLinked" )
		local f650_local5 = Engine.GetModel( f650_local0, "groupIndex" )
		if f650_local4 then
			if Engine.GetModelValue( f650_local4 ) == true then
				Engine.ExecNow( f650_arg2, "unlinkLayers " .. f650_local3 )
				Engine.SetModelValue( f650_local4, false )
			else
				Engine.ExecNow( f650_arg2, "linkLayers " .. f650_local3 )
				Engine.SetModelValue( f650_local4, true )
			end
			local f650_local6 = Engine.GetSelectedLayerData( f650_arg2, f650_local2, f650_local3 )
			Engine.SetModelValue( f650_local5, f650_local6.groupIndex )
			CoD.SetEditorProperties( f650_arg2, Engine.GetLinkedLayerCount( f650_arg2, f650_local3 ), "linkedLayerCount" )
		end
	end
end

function EmblemEditor_GroupUngroupLayers( f651_arg0, f651_arg1, f651_arg2 )
	local f651_local0 = f651_arg1:getModel()
	local f651_local1 = Engine.GetModel( f651_local0, "layerIndex" )
	if f651_local1 then
		local f651_local2 = Engine.GetModelValue( f651_local1 )
		local f651_local3 = CoD.GetCustomization( f651_arg2, "type" )
		local f651_local4 = Engine.GetModel( f651_local0, "isLinked" )
		local f651_local5 = Engine.GetModel( f651_local0, "isGrouped" )
		local f651_local6 = Engine.GetModel( f651_local0, "groupIndex" )
		if f651_local4 and f651_local5 then
			local f651_local7 = Engine.GetModelValue( f651_local4 )
			local f651_local8 = Engine.GetModelValue( f651_local5 )
			local f651_local9 = Engine.GetSelectedLayerData( f651_arg2, f651_local2, f651_local3 )
			local f651_local10 = CoD.GetEditorProperties( f651_arg2, "linkedLayerCount" )
			if f651_local7 == true then
				if f651_local8 == true then
					Engine.ExecNow( f651_arg2, "ungroupLayers " .. f651_local3 )
					Engine.SetModelValue( f651_local5, false )
					Engine.SetModelValue( f651_local6, f651_local9.groupIndex )
					f651_arg0.layerCarousel:updateDataSource()
				elseif f651_local10 >= 2 and IsGroupSlotAvailable( f651_arg2 ) then
					Engine.ExecNow( f651_arg2, "groupLayers " .. f651_local3 )
					Engine.SetModelValue( f651_local5, true )
					Engine.SetModelValue( f651_local6, f651_local9.groupIndex )
					CoD.perController[f651_arg2].selectEmblemGroupIndex = f651_local9.groupIndex
					f651_arg0.layerCarousel:updateDataSource()
					CoD.perController[f651_arg2].selectEmblemGroupIndex = nil
				end
			end
		end
		CoD.SetEditorProperties( f651_arg2, Engine.GetLinkedLayerCount( f651_arg2, f651_local3 ), "linkedLayerCount" )
	end
end

function EmblemEditor_SaveSelectedGroup( f652_arg0, f652_arg1, f652_arg2, f652_arg3 )
	
end

function Emblems_SetIconOld( f653_arg0, f653_arg1, f653_arg2 )
	local f653_local0 = CoD.SafeGetModelValue( f653_arg1:getModel(), "iconID" )
	if f653_local0 then
		Engine.SetEmblemIconOld( f653_arg2, f653_local0 )
		local f653_local1 = LUI.getTableFromPath( "tabList.Tabs.grid.activeWidget", f653_arg0 )
		if f653_local1 then
			local f653_local2 = f653_local1:getModel( f653_arg2, "breadcrumbCount" )
			if f653_local2 then
				Engine.SetModelValue( f653_local2, math.max( 0, Engine.GetModelValue( f653_local2 ) - 1 ) )
			end
		end
	end
end

function Emblems_SetEmblemOld( f654_arg0, f654_arg1, f654_arg2 )
	local f654_local0 = CoD.SafeGetModelValue( f654_arg1:getModel(), "emblemIndex" )
	if f654_local0 then
		if CoD.perController[f654_arg2].selectedEmblemTabStorageType == Enum.StorageFileType.STORAGE_EMBLEMS_LOOT then
			f654_local0 = CoD.BlackMarketUtility.GetLootEmblemSortIndexFromEmblemId( f654_local0 )
		end
		local f654_local1 = CoD.CraftUtility.Emblems.GetEmblemBreadcrumbRoot( f654_arg2, f654_local0, CoD.perController[f654_arg2].selectedEmblemTabStorageType )
		if f654_local1 then
			f654_local1:set( 1 )
			local f654_local2 = LUI.getTableFromPath( "tabList.Tabs.grid.activeWidget", f654_arg0 )
			if f654_local2 then
				local f654_local3 = f654_local2:getModel( f654_arg2, "breadcrumbCount" )
				if f654_local3 then
					Engine.SetModelValue( f654_local3, math.max( 0, Engine.GetModelValue( f654_local3 ) - 1 ) )
				end
			end
		end
	end
end

function Emblems_SetMaterialOld( f655_arg0, f655_arg1, f655_arg2 )
	local f655_local0 = CoD.SafeGetModelValue( f655_arg1:getModel(), "materialID" )
	if f655_local0 then
		local f655_local1 = CoD.CraftUtility.Emblems.GetEmblemMaterialBreadcrumbRoot( f655_arg2, f655_local0 )
		if f655_local1 then
			f655_local1:set( 1 )
			local f655_local2 = LUI.getTableFromPath( "materialSwatch.tabList.Tabs.grid.activeWidget", f655_arg0 )
			if f655_local2 then
				local f655_local3 = f655_local2:getModel( f655_arg2, "breadcrumbCount" )
				if f655_local3 then
					Engine.SetModelValue( f655_local3, math.max( 0, Engine.GetModelValue( f655_local3 ) - 1 ) )
				end
			end
		end
	end
end

function EmblemChooseIcon_SelectionRejected( f656_arg0, f656_arg1, f656_arg2 )
	local f656_local0 = CoD.GetEditorProperties( f656_arg2, "addDecalMode" )
	if CoD.perController[f656_arg2].selectedLayerIconID == CoD.emblem.INVALID_ID then
		Engine.ExecNow( f656_arg2, "emblemClear " .. CoD.GetCustomization( f656_arg2, "type" ) )
	elseif f656_local0 == CoD.emblem.ADDDECAL.INSERT then
		Engine.ExecNow( f656_arg2, "emblemCutLayer " .. CoD.GetCustomization( f656_arg2, "type" ) )
	else
		Engine.ExecNow( f656_arg2, "emblemSetSelectedLayerIconId " .. CoD.perController[f656_arg2].selectedLayerIconID )
	end
	CoD.SetEditorProperties( f656_arg2, CoD.emblem.ADDDECAL.REPLACE, "addDecalMode" )
	SetBrowseMode( f656_arg2 )
end

function EmblemChooseIcon_SelectionAccepted( f657_arg0, f657_arg1, f657_arg2 )
	if CoD.GetEditorProperties( f657_arg2, "addDecalMode" ) == CoD.emblem.ADDDECAL.INSERT and CoD.perController[f657_arg2].selectedLayerIndex + 1 < CoD.perController[f657_arg2].totalLayers then
		local f657_local0 = CoD.GetCustomization( f657_arg2, "type" )
	end
	CoD.SetEditorProperties( f657_arg2, CoD.emblem.ADDDECAL.REPLACE, "addDecalMode" )
end

function EmblemChooseIcon_SelectionChanged( f658_arg0, f658_arg1, f658_arg2 )
	if IsSelfModelValueTrue( f658_arg1, f658_arg2, "isBMClassified" ) then
		Engine.ExecNow( f658_arg2, "emblemSetSelectedLayerIconId " .. -2 )
	else
		local f658_local0 = Engine.GetModelValue( f658_arg1:getModel( f658_arg2, "iconID" ) )
		Engine.ExecNow( f658_arg2, "emblemSetSelectedLayerIconId " .. f658_local0 )
		CoD.SetEditorProperties( f658_arg2, f658_local0, "selectedDecalID" )
	end
end

function EmblemChooseIcon_TabChanged( f659_arg0, f659_arg1, f659_arg2 )
	CoD.perController[f659_arg2].selectedDecalCategory = f659_arg1.tabCategory
	f659_arg0.emblemIconList:updateDataSource()
end

function EmblemChooseIcon_SetPreviewDecalCamera( f660_arg0, f660_arg1, f660_arg2 )
	CoD.CraftUtility.DisplayWeaponInPaintshop( f660_arg2, "paintshop_preview_" .. CoD.Paintshop.View[CoD.perController[f660_arg2].viewIndex].view_name )
end

function EmblemChooseIcon_RevertPreviewDecalCamera( f661_arg0, f661_arg1, f661_arg2 )
	CoD.CraftUtility.DisplayWeaponInPaintshop( f661_arg2, CoD.Paintshop.View[CoD.perController[f661_arg2].viewIndex].view_name )
end

function EmblemChooseMaterial_TabChanged( f662_arg0, f662_arg1, f662_arg2 )
	CoD.perController[f662_arg2].selectedMaterialCategory = f662_arg1.filter
	f662_arg0.materialSwatch:updateDataSource()
end

function EmblemChooseMaterial_SelectionChanged( f663_arg0, f663_arg1, f663_arg2 )
	if IsSelfModelValueTrue( f663_arg1, f663_arg2, "isBMClassified" ) then
		return true
	end
	local f663_local0 = f663_arg1:getModel( f663_arg2, "materialID" )
	if f663_local0 then
		Engine.ExecNow( f663_arg2, "emblemSetSelectedDecalMaterialId " .. Engine.GetModelValue( f663_local0 ) )
	end
end

function EmblemChooseMaterial_UpdateMaterialAngleByStep( f664_arg0, f664_arg1, f664_arg2, f664_arg3 )
	Engine.ExecNow( f664_arg3, "emblemUpdateMaterialAngle " .. f664_arg2 )
end

function EmblemChooseMaterial_ToggleScaleMode( f665_arg0, f665_arg1, f665_arg2 )
	local f665_local0
	if Engine.GetLayerMaterialScaleMode( f665_arg2 ) == Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED then
		f665_local0 = Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FREE
	else
		f665_local0 = Enum.CustomizationScaleType.CUSTOMIZATION_SCALE_TYPE_FIXED
	end
	CoD.SetEditorProperties( f665_arg2, f665_local0, "materialScaleMode" )
	Engine.ExecNow( f665_arg2, "setMaterialScaleMode " .. f665_local0 )
end

function EmblemChooseColor_ToggleBlend( f666_arg0, f666_arg1, f666_arg2 )
	Engine.ExecNow( f666_arg2, "emblemToggleColorBlend " .. CoD.GetCustomization( f666_arg2, "type" ) )
end

function EmblemChooseColor_ClearSelectedLayerMaterial( f667_arg0, f667_arg1, f667_arg2 )
	Engine.ExecNow( f667_arg2, "emblemClearSelectedLayerMaterialId" )
end

function EmblemChooseColor_SelectionChanged( f668_arg0, f668_arg1, f668_arg2 )
	local f668_local0 = CoD.GetEditorProperties( f668_arg2, "isGradientMode" )
	local f668_local1 = CoD.GetEditorProperties( f668_arg2, "colorNum" )
	local f668_local2 = CoD.NormalizeColor( Engine.GetModelValue( f668_arg1:getModel( f668_arg2, "color" ) ) )
	if f668_local0 == 0 then
		Engine.ExecNow( f668_arg2, "emblemSetLayerColor " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_NONE .. " " .. f668_local2[1] .. " " .. f668_local2[2] .. " " .. f668_local2[3] )
		Engine.ExecNow( f668_arg2, "emblemClearGradient" )
	elseif f668_local0 == 1 then
		if f668_local1 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 then
			Engine.ExecNow( f668_arg2, "emblemSetLayerColor " .. f668_local1 .. " " .. f668_local2[1] .. " " .. f668_local2[2] .. " " .. f668_local2[3] )
			if PropertyIsTrue( f668_arg0, "isColor1NoColor" ) then
				Engine.ExecNow( f668_arg2, "emblemSetLayerColor " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 .. " " .. f668_local2[1] .. " " .. f668_local2[2] .. " " .. f668_local2[3] )
			end
		elseif f668_local1 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
			Engine.ExecNow( f668_arg2, "emblemSetLayerColor " .. f668_local1 .. " " .. f668_local2[1] .. " " .. f668_local2[2] .. " " .. f668_local2[3] )
			if PropertyIsTrue( f668_arg0, "isColor0NoColor" ) then
				Engine.ExecNow( f668_arg2, "emblemSetLayerColor " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 .. " " .. f668_local2[1] .. " " .. f668_local2[2] .. " " .. f668_local2[3] )
			end
		end
	end
end

function EmblemChooseColor_SelectNoColor( f669_arg0, f669_arg1, f669_arg2 )
	local f669_local0 = DataSources.EmblemSelectedLayerNoColor.getModel( f669_arg2 )
	if f669_local0 ~= nil then
		local f669_local1 = CoD.NormalizeColor( Engine.GetModelValue( Engine.GetModel( f669_local0, "color" ) ) )
		f669_arg0.opacity0 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f669_arg2 ), "Emblem.EmblemSelectedLayerProperties.opacity0" ) ) / 100
		f669_arg0.opacity1 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f669_arg2 ), "Emblem.EmblemSelectedLayerProperties.opacity1" ) ) / 100
		local f669_local2 = CoD.GetEditorProperties( f669_arg2, "colorNum" )
		Engine.ExecNow( f669_arg2, "emblemSetLayerColor " .. f669_local2 .. " " .. f669_local1[1] .. " " .. f669_local1[2] .. " " .. f669_local1[3] )
		Engine.ExecNow( f669_arg2, "emblemLayerUpdateOpacity " .. f669_local2 .. " -1.0" )
	end
end

function EmblemChooseColor_NoColorLoseFocus( f670_arg0, f670_arg1, f670_arg2 )
	local f670_local0 = CoD.GetEditorProperties( f670_arg2, "colorNum" )
	if f670_arg0.lastSavedColor:isInFocus() or CoD.isPC then
		if not PropertyIsTrue( f670_arg0, "isColor0NoColor" ) and f670_local0 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 then
			if f670_arg0.opacity0 ~= nil and f670_arg0.opacity0 ~= 0 then
				Engine.ExecNow( f670_arg2, "emblemLayerUpdateOpacity " .. f670_local0 .. " " .. f670_arg0.opacity0 )
			else
				Engine.ExecNow( f670_arg2, "emblemLayerUpdateOpacity " .. f670_local0 .. " 1.0" )
			end
		elseif not PropertyIsTrue( f670_arg0, "isColor1NoColor" ) and f670_local0 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
			if f670_arg0.opacity1 ~= nil and f670_arg0.opacity1 ~= 0 then
				Engine.ExecNow( f670_arg2, "emblemLayerUpdateOpacity " .. f670_local0 .. " " .. f670_arg0.opacity1 )
			else
				Engine.ExecNow( f670_arg2, "emblemLayerUpdateOpacity " .. f670_local0 .. " 1.0" )
			end
		end
	end
end

function EmblemChooseColor_ToggleColorMode( f671_arg0, f671_arg1, f671_arg2 )
	local f671_local0 = CoD.GetEditorProperties( f671_arg2, "colorMode" )
	local f671_local1 = CoD.GetEditorProperties( f671_arg2, "isGradientMode" )
	local f671_local2 = CoD.GetSelectedColor( f671_arg2 )
	if f671_local2 ~= nil then
		EmblemChooseColor_SetShaderParams( f671_arg2, EmblemChooseColor_GetColorMixerElement( f671_arg0, f671_arg2 ), f671_local2 )
	end
	if f671_local0 == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER then
		f671_arg0:updateMode( Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, f671_local1 )
		CoD.SetEditorProperties( f671_arg2, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, "colorMode" )
	elseif f671_local0 == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID then
		CoD.SetNoColorDataModel( f671_arg2 )
		local f671_local3 = CoD.GetEditorProperties( f671_arg2, "isColor0NoColor" )
		local f671_local4 = CoD.GetEditorProperties( f671_arg2, "isColor1NoColor" )
		local f671_local5 = CoD.GetEditorProperties( f671_arg2, "colorNum" )
		if f671_local3 == 1 and f671_local5 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 then
			Engine.ExecNow( f671_arg2, "emblemSetLayerColor " .. f671_local5 .. " 1 1 1" )
			Engine.ExecNow( f671_arg2, "emblemLayerUpdateOpacity " .. f671_local5 .. " 1.0" )
		elseif f671_local4 == 1 and f671_local5 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
			Engine.ExecNow( f671_arg2, "emblemSetLayerColor " .. f671_local5 .. " 1 1 1" )
			Engine.ExecNow( f671_arg2, "emblemLayerUpdateOpacity " .. f671_local5 .. " 1.0" )
		end
		EmblemChooseColor_SetupSelectedLayerColorModel( f671_arg2 )
		f671_arg0:updateMode( Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER, f671_local1 )
		CoD.SetEditorProperties( f671_arg2, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER, "colorMode" )
	end
	EmblemChooseColor_SetupSelectedLayerColorModel( f671_arg2 )
end

function EmblemChooseColor_ToggleGradientMode( f672_arg0, f672_arg1, f672_arg2 )
	local f672_local0 = CoD.GetEditorProperties( f672_arg2, "isGradientMode" )
	local f672_local1 = CoD.GetEditorProperties( f672_arg2, "colorMode" )
	f672_arg0.colorGradientContainer:setState( "DefaultState" )
	if f672_local0 == 1 then
		CoD.SetEditorProperties( f672_arg2, 0, "isGradientMode" )
		CoD.SetNoColorDataModel( f672_arg2 )
		local f672_local2 = CoD.GetEditorProperties( f672_arg2, "isColor0NoColor" )
		if f672_local2 ~= nil and f672_local2 == 1 then
			Engine.ExecNow( f672_arg2, "emblemSetLayerColor " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 .. " 1 1 1" )
			Engine.ExecNow( f672_arg2, "emblemLayerUpdateOpacity " .. CoD.GetEditorProperties( f672_arg2, "colorNum" ) .. " 1.0" )
		end
		EmblemChooseColor_SetupSelectedLayerColorModel( f672_arg2 )
		CoD.SetEditorProperties( f672_arg2, Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_NONE, "colorNum" )
		CoD.SetEditorProperties( f672_arg2, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, "colorMode" )
		f672_arg0:updateMode( Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, 0 )
	elseif f672_local0 == 0 then
		CoD.SetEditorProperties( f672_arg2, 1, "isGradientMode" )
		Engine.ExecNow( f672_arg2, "emblemLayerUpdateOpacity " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 .. " -1" )
		if f672_local1 == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER then
			f672_arg0:updateMode( Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_MIXER, 1 )
		else
			f672_arg0:updateMode( Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, 1 )
		end
	end
	EmblemChooseColor_SetupSelectedLayerColorModel( f672_arg2 )
	local f672_local2 = EmblemChooseColor_GetGradientSliderElement( f672_arg0, f672_arg2 )
	EmblemGradient_UpdateGradientFillByStep( f672_local2, f672_local2, 0, f672_arg2 )
end

function EmblemChooseColor_DecrementColorComponent( f673_arg0, f673_arg1, f673_arg2, f673_arg3 )
	local f673_local0 = f673_arg1:getModel( f673_arg2, f673_arg3 )
	EmblemChooseColor_ModifyColorModelValue( f673_local0, -1 )
	EmblemChooseColor_SetBarProperties( f673_arg0, f673_arg1, f673_local0, f673_arg2 )
end

function EmblemChooseColor_IncrementColorComponent( f674_arg0, f674_arg1, f674_arg2, f674_arg3 )
	local f674_local0 = f674_arg1:getModel( f674_arg2, f674_arg3 )
	EmblemChooseColor_ModifyColorModelValue( f674_local0, 1 )
	EmblemChooseColor_SetBarProperties( f674_arg0, f674_arg1, f674_local0, f674_arg2 )
end

function EmblemChooseColor_SetColorComponent( f675_arg0, f675_arg1, f675_arg2, f675_arg3, f675_arg4 )
	local f675_local0 = f675_arg1:getModel( f675_arg2, f675_arg3 )
	EmblemChooseColor_SetColorModelValue( f675_local0, f675_arg4 )
	EmblemChooseColor_SetBarProperties( f675_arg0, f675_arg1, f675_local0, f675_arg2 )
end

function EmblemChooseColor_UpdateOpacityByStep( f676_arg0, f676_arg1, f676_arg2, f676_arg3 )
	if not IsSelectedColorEmpty( f676_arg1, f676_arg3 ) then
		Engine.ExecNow( f676_arg3, "emblemLayerUpdateOpacity " .. CoD.GetEditorProperties( f676_arg3, "colorNum" ) .. " " .. f676_arg2 )
		CoD.SetNoColorDataModel( f676_arg3 )
		local f676_local0 = EmblemChooseColor_GetGradientSliderElement( f676_arg0, f676_arg3 )
		EmblemGradient_UpdateGradientFillByStep( f676_local0, f676_local0, 0, f676_arg3 )
	end
end

function EmblemChooseColor_SetOpacity( f677_arg0, f677_arg1, f677_arg2, f677_arg3, f677_arg4 )
	local f677_local0 = false
	if f677_arg2 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 then
		f677_local0 = CoD.GetEditorProperties( f677_arg4, "isColor0NoColor" ) == 1
	elseif f677_arg2 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
		f677_local0 = CoD.GetEditorProperties( f677_arg4, "isColor1NoColor" ) == 1
	end
	if not f677_local0 then
		Engine.ExecNow( f677_arg4, "emblemLayerSetOpacity " .. f677_arg2 .. " " .. f677_arg3 )
		CoD.SetNoColorDataModel( f677_arg4 )
		local f677_local1 = EmblemChooseColor_GetGradientSliderElement( f677_arg0, f677_arg4 )
		EmblemGradient_UpdateGradientFillByStep( f677_local1, f677_local1, 0, f677_arg4 )
	end
end

function EmblemChooseColor_UpdateBothColorOpacity( f678_arg0, f678_arg1, f678_arg2, f678_arg3 )
	if Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f678_arg3 ), "Emblem.EmblemSelectedLayerProperties.max_opacity" ) ) + f678_arg2 <= 100 then
		Engine.ExecNow( f678_arg3, "emblemLayerUpdateOpacity " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_NONE .. " " .. f678_arg2 )
	end
end

function EmblemGradient_Color0GainFocus( f679_arg0, f679_arg1, f679_arg2 )
	if CoD.GetEditorProperties( f679_arg2, "colorMode" ) == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE then
		CoD.SetEditorProperties( f679_arg2, Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0, "colorNum" )
	end
end

function EmblemGradient_Color1GainFocus( f680_arg0, f680_arg1, f680_arg2 )
	if CoD.GetEditorProperties( f680_arg2, "colorMode" ) == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE then
		CoD.SetEditorProperties( f680_arg2, Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1, "colorNum" )
	end
end

function EmblemGradient_ColorGradientSliderGainFocus( f681_arg0, f681_arg1, f681_arg2 )
	if CoD.GetEditorProperties( f681_arg2, "colorMode" ) == Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE then
		CoD.SetEditorProperties( f681_arg2, Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_GRADIENT, "colorNum" )
	end
end

function EmblemGradient_ShowSwatchContainer( f682_arg0, f682_arg1, f682_arg2 )
	local f682_local0 = CoD.GetEditorProperties( f682_arg2, "isColor0NoColor" )
	local f682_local1 = CoD.GetEditorProperties( f682_arg2, "isColor1NoColor" )
	local f682_local2 = CoD.GetEditorProperties( f682_arg2, "colorNum" )
	if f682_arg0.colorGradientContainer.gradientColor0:isInFocus() then
		f682_arg0.colorGradientContainer:setState( "Color0State" )
	elseif f682_arg0.colorGradientContainer.gradientColor1:isInFocus() then
		f682_arg0.colorGradientContainer:setState( "Color1State" )
	end
	CoD.SetEditorProperties( f682_arg2, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_SOLID, "colorMode" )
	EmblemGradient_SetupSwatchLastSavedColor( f682_arg0, f682_arg1, f682_arg2 )
	CoD.SwapFocusableElements( f682_arg2, f682_arg0.colorGradientContainer, f682_arg0.colorGradientSwatchContainer )
	if f682_local0 == 1 and f682_local2 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 then
		CoD.SwapFocusableElements( f682_arg2, f682_arg0.colorGradientSwatchContainer.lastSavedColor, f682_arg0.colorGradientSwatchContainer.noColor )
		f682_arg0.colorGradientSwatchContainer.lastSavedColor.m_focusable = true
	elseif f682_local1 == 1 and f682_local2 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
		CoD.SwapFocusableElements( f682_arg2, f682_arg0.colorGradientSwatchContainer.lastSavedColor, f682_arg0.colorGradientSwatchContainer.noColor )
		f682_arg0.colorGradientSwatchContainer.lastSavedColor.m_focusable = true
	end
	f682_arg0.colorGradientContainer:hide()
	f682_arg0.colorGradientSwatchContainer:show()
end

function EmblemGradient_BackFromColorPicker( f683_arg0, f683_arg1, f683_arg2 )
	EmblemChooseColor_SetupSelectedLayerColorModel( f683_arg2 )
	if f683_arg0.colorGradientSwatchContainer.m_focusable then
		CoD.SwapFocusableElements( f683_arg2, f683_arg0.colorGradientSwatchContainer, f683_arg0.colorGradientContainer )
		f683_arg0.colorGradientContainer:show()
		f683_arg0.colorGradientSwatchContainer:hide()
	elseif f683_arg0.colorGradientMixerContainer.m_focusable then
		CoD.SwapFocusableElements( f683_arg2, f683_arg0.colorGradientMixerContainer, f683_arg0.colorGradientContainer )
		f683_arg0.colorGradientContainer:show()
		f683_arg0.colorGradientMixerContainer:hide()
	end
	CoD.SetEditorProperties( f683_arg2, Enum.CustomizationColorMode.CUSTOMIZATION_COLOR_MODE_NONE, "colorMode" )
	local f683_local0 = CoD.GetEditorProperties( f683_arg2, "colorNum" )
	f683_arg0.colorGradientContainer:setState( "DefaultState" )
	if f683_local0 == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 then
		CoD.SwapFocusableElements( f683_arg2, f683_arg0.colorGradientContainer.gradientColor0, f683_arg0.colorGradientContainer.gradientColor1 )
		f683_arg0.colorGradientContainer.gradientColor0.m_focusable = true
	end
	local f683_local1 = EmblemChooseColor_GetGradientSliderElement( f683_arg0, f683_arg2 )
	EmblemGradient_UpdateGradientFillByStep( f683_local1, f683_local1, 0, f683_arg2 )
end

function EmblemGradient_UpdateAngleByStep( f684_arg0, f684_arg1, f684_arg2, f684_arg3 )
	Engine.ExecNow( f684_arg3, "emblemUpdateGradientAngle " .. f684_arg2 )
end

function EmblemGradient_SetAngle( f685_arg0, f685_arg1, f685_arg2, f685_arg3 )
	Engine.ExecNow( f685_arg3, "emblemSetGradientAngle " .. f685_arg2 )
end

function EmblemGradient_ToggleGradientType( f686_arg0, f686_arg1, f686_arg2 )
	Engine.ExecNow( f686_arg2, "emblemToggleGradientType" )
end

function EmblemGradient_UpdateGradientFillByStep( f687_arg0, f687_arg1, f687_arg2, f687_arg3 )
	Engine.ExecNow( f687_arg3, "emblemUpdateGradientFill " .. f687_arg2 )
	EmblemGradient_UpdateGradientVisuals( f687_arg3, f687_arg1 )
end

function EmblemGradient_SetGradientFill( f688_arg0, f688_arg1, f688_arg2, f688_arg3 )
	Engine.ExecNow( f688_arg3, "emblemSetGradientFill " .. f688_arg2 )
	EmblemGradient_UpdateGradientVisuals( f688_arg3, f688_arg1 )
end

function EmblemGradient_BackFromGradientPicker( f689_arg0, f689_arg1, f689_arg2 )
	if CoD.GetEditorProperties( f689_arg2, "isColor0NoColor" ) == 1 and CoD.GetEditorProperties( f689_arg2, "isColor1NoColor" ) == 1 then
		Engine.ExecNow( f689_arg2, "emblemSetLayerColor " .. Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_NONE .. " 1 1 1" )
	end
end

function EmblemSelect_TabChanged( f690_arg0, f690_arg1, f690_arg2 )
	CoD.CraftUtility.Emblems.CachedEmblems = {}
	CoD.CraftUtility.Emblems.CachedEmblemIndexMapping = {}
	CoD.perController[f690_arg2].selectedEmblemTabStorageType = f690_arg1.storageType
	CoD.CraftUtility.Emblems.ParseDDL( f690_arg2, CoD.perController[f690_arg2].selectedEmblemTabStorageType )
	f690_arg0.emblemList:updateDataSource()
	f690_arg0.emblemList:setActiveItem( f690_arg0.emblemList:getFirstSelectableItem() )
	ForceNotifyModel( f690_arg2, "Emblem.UpdateDataSource" )
end

function UpdateSlotCountText( f691_arg0, f691_arg1, f691_arg2, f691_arg3 )
	return f691_arg1:setText( Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION", CoD.CraftUtility.GetUsedSlotsByFileType( f691_arg2, f691_arg3 ), CoD.CraftUtility.GetTotalAllowedSlotsByFileType( f691_arg2, f691_arg3 ) ) )
end

function UploadPublicProfile( f692_arg0, f692_arg1 )
	if CoD.perController[f692_arg1].uploadProfile == true then
		CoD.perController[f692_arg1].uploadProfile = false
		Engine.ExecNow( f692_arg1, "uploadprofile" )
	end
end

function BlackMarketSetAsEmblem( f693_arg0, f693_arg1, f693_arg2 )
	CoD.perController[f693_arg2].selectedEmblemModel = f693_arg1:getModel()
	local f693_local0, f693_local1, f693_local2 = CoD.BlackMarketUtility.GetLootEmblemIndexParams( f693_arg2, Engine.GetModelValue( f693_arg1:getModel( f693_arg2, "emblem" ) ) )
	Engine.SetupEmblemData( f693_local0, f693_local1, f693_local2 )
	if IsLive() then
		Engine.ExecNow( f693_local0, "emblemsetprofile" )
		CoD.perController[f693_local0].uploadProfile = true
	else
		Engine.SetProfileVar( f693_local0, "default_emblem_index", f693_local1 )
		Engine.ExecNow( f693_local0, "invalidateEmblemComponent" )
	end
	ForceNotifyControllerModel( f693_local0, "identityBadge.xuid" )
end

function BlackMarketSetCallingCard( f694_arg0, f694_arg1, f694_arg2 )
	local f694_local0 = Engine.GetModel( f694_arg1:getModel(), "image" )
	if f694_local0 ~= nil then
		local f694_local1 = CoD.BlackMarketUtility.GetLootCallingCardIndex( f694_arg2, Engine.GetModelValue( f694_local0 ) )
		if not f694_local1 then
			return 
		end
		SetEmblemBackground_Internal( f694_arg2, f694_local1 )
	end
	ForceNotifyControllerModel( f694_arg2, "identityBadge.xuid" )
end

function BlackMarketSetTaunt( f695_arg0, f695_arg1, f695_arg2 )
	local f695_local0 = CoD.SafeGetModelValue( f695_arg1:getModel(), "emblem" )
	if f695_local0 then
		local f695_local1 = f695_local0
		local f695_local2, f695_local3 = CoD.CCUtility.GetHeroDisplayNameAndIndexForTaunt( Enum.eModes.MODE_MULTIPLAYER, f695_local1 )
		local f695_local4, f695_local5 = CoD.CCUtility.GetTypeIndexAndIndexForTaunt( Enum.eModes.MODE_MULTIPLAYER, f695_local1, f695_local1 )
		if f695_local5 then
			Engine.SelectTaunt( f695_arg2, Enum.eModes.MODE_MULTIPLAYER, f695_local3, f695_local4, f695_local5 )
			CoD.OverlayUtility.ShowToast( "BlackMarketEquipped", Engine.Localize( "MPUI_EQUIPPED_CAPS" ), CoD.BlackMarketUtility.GetItemTypeStringForLootItem( f695_local0, "taunt" ), CoD.BlackMarketUtility.GetImageForLootItem( f695_local0, "taunt" ) )
		end
	end
end

function BlackMarketSetGesture( f696_arg0, f696_arg1, f696_arg2 )
	local f696_local0 = CoD.SafeGetModelValue( f696_arg1:getModel(), "emblem" )
	if f696_local0 then
		local f696_local1, f696_local2 = CoD.BlackMarketUtility.SplitIdIntoTwoValues( f696_local0 )
		local f696_local3, f696_local4 = CoD.CCUtility.GetHeroDisplayNameAndIndex( Enum.eModes.MODE_MULTIPLAYER, f696_local2 )
		local f696_local5, f696_local6 = CoD.CCUtility.GetTypeIndexAndIndexForGesture( Enum.eModes.MODE_MULTIPLAYER, f696_local2, f696_local1 )
		if f696_local6 then
			Engine.SelectGesture( f696_arg2, Enum.eModes.MODE_MULTIPLAYER, f696_local4, f696_local5, f696_local6 )
			CoD.OverlayUtility.ShowToast( "BlackMarketEquipped", Engine.Localize( "MPUI_EQUIPPED_CAPS" ), CoD.BlackMarketUtility.GetItemTypeStringForLootItem( f696_local0, "gesture" ), CoD.BlackMarketUtility.GetImageForLootItem( f696_local0, "gesture" ) )
		end
	end
end

function BlackMarketSetSpecialistTheme( f697_arg0, f697_arg1, f697_arg2 )
	local f697_local0 = CoD.SafeGetModelValue( f697_arg1:getModel(), "emblem" )
	if f697_local0 then
		local f697_local1, f697_local2 = CoD.BlackMarketUtility.SplitIdIntoTwoValues( f697_local0 )
		local f697_local3, f697_local4 = CoD.CCUtility.GetHeroDisplayNameAndIndex( Enum.eModes.MODE_MULTIPLAYER, f697_local2 )
		local f697_local5 = CoD.BlackMarketUtility.GetSpecialistThemeType( f697_local1 )
		local f697_local6 = CoD.BlackMarketUtility.GetSpecialistOutfitIndexForId( f697_local1, f697_local2 )
		if f697_local6 then
			Engine.SetHeroItem( f697_arg2, Enum.eModes.MODE_MULTIPLAYER, f697_local4, f697_local5, f697_local6 )
			CoD.OverlayUtility.ShowToast( "BlackMarketEquipped", Engine.Localize( "MPUI_EQUIPPED_CAPS" ), CoD.BlackMarketUtility.GetItemTypeStringForLootItem( f697_local0, "specialist_outfit" ), CoD.BlackMarketUtility.GetImageForLootItem( f697_local0, "specialist_outfit" ) )
		end
	end
end

function BlackMarketResultsOnClose( f698_arg0, f698_arg1, f698_arg2 )
	if not IsLive() then
		Engine.CommitProfileChanges( f698_arg2 )
	else
		UploadPublicProfile( f698_arg0, f698_arg2 )
	end
	CoD.perController[f698_arg2].selectedEmblemModel = nil
end

function CommitProfileChanges( f699_arg0 )
	Engine.CommitProfileChanges( f699_arg0 )
end

function EmblemSelect_Back( f700_arg0, f700_arg1, f700_arg2 )
	if not IsLive() then
		Engine.CommitProfileChanges( f700_arg2 )
	else
		UploadPublicProfile( f700_arg0, f700_arg2 )
	end
	CoD.perController[f700_arg2].selectedEmblemModel = nil
	CoD.CraftUtility.Emblems.CachedEmblems = {}
	CoD.CraftUtility.Emblems.CachedEmblemIndexMapping = {}
	ClearSavedState( f700_arg0, f700_arg2 )
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "emblemBreadcrumbChanged" ) )
end

function EmblemSelect_SetAsEmblem( f701_arg0, f701_arg1, f701_arg2 )
	if IsLive() then
		if SelectingGroupEmblem( f701_arg2 ) then
			if SelectingGroupEmblemForGroupCreation( f701_arg2 ) then
				Engine.SetGroupEmblemForGroupCreation( f701_arg2 )
			else
				MarkGroupDataDirty( f701_arg2, "emblem", true )
				Engine.SetGroupEmblem( f701_arg2 )
			end
			GoBack( f701_arg0, f701_arg2 )
			return 
		end
		Engine.ExecNow( f701_arg2, "emblemsetprofile" )
		CoD.perController[f701_arg2].uploadProfile = true
	else
		Engine.SetProfileVar( f701_arg2, "default_emblem_index", Engine.GetModelValue( f701_arg1:getModel( f701_arg2, "emblemIndex" ) ) )
		Engine.ExecNow( f701_arg2, "invalidateEmblemComponent" )
	end
end

function EmblemSelect_GainFocus( f702_arg0, f702_arg1, f702_arg2 )
	CoD.perController[f702_arg2].selectedEmblemModel = f702_arg1:getModel()
	Engine.SetupEmblemData( f702_arg2, Engine.GetModelValue( f702_arg1:getModel( f702_arg2, "emblemIndex" ) ), CoD.perController[f702_arg2].selectedEmblemTabStorageType )
end

function EmblemSelect_ChooseEmblem( f703_arg0, f703_arg1, f703_arg2 )
	CoD.perController[f703_arg2].totalLayers = Enum.CustomizationTypeLayerCount.CUSTOMIZATION_TYPE_EMBLEM_MAX_LAYERS
	CoD.perController[f703_arg2].totalGroups = Enum.CustomizationTypeGroupCount.CUSTOMIZATION_TYPE_MAX_GROUPS
	CoD.SetEditorProperties( f703_arg2, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE, "editorMode" )
	local f703_local0 = Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM
	CoD.SetCustomization( f703_arg2, f703_local0, "type" )
	Engine.SetupEmblemEditBuffer( f703_arg2, f703_local0, 0 )
end

function EmblemSelect_RenameEmblem( f704_arg0, f704_arg1, f704_arg2 )
	local f704_local0 = f704_arg0:getModel()
	CoD.CraftUtility.Emblems.RenameEmblem( f704_arg2, Engine.GetModelValue( Engine.GetModel( f704_local0, "emblemIndex" ) ), Engine.GetModelValue( Engine.GetModel( f704_local0, "emblemName" ) ) )
end

function EmblemSelect_HandleRenameKeyboardComplete( f705_arg0, f705_arg1, f705_arg2, f705_arg3 )
	local f705_local0 = f705_arg0:getModel()
	local f705_local1 = nil
	if not f705_local0 then
		return 
	elseif f705_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_EMBLEMS then
		f705_local1 = Engine.GetModel( f705_local0, "emblemName" )
	end
	if f705_local1 then
		Engine.SetModelValue( f705_local1, f705_arg3.input )
	end
end

function EmblemSelect_ClearEmblem( f706_arg0, f706_arg1, f706_arg2 )
	local f706_local0 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f706_arg2].selectedEmblemModel, "emblemIndex" ) )
	CoD.CraftUtility.Emblems.ClearEmblem( f706_arg2, f706_local0 )
	Engine.UploadEmblemData( f706_arg2, f706_local0 )
	CoD.CraftUtility.Emblems.ParseDDL( f706_arg2, Enum.StorageFileType.STORAGE_EMBLEMS )
	local f706_local1 = nil
	if IsMediaManager() == true then
		f706_local1 = GoBackMultiple( f706_arg0, f706_arg2, 1 )
		MediaManagerMarkDirty( f706_arg2 )
	else
		f706_local1 = GoBackMultiple( f706_arg0, f706_arg2, 2 )
	end
	if f706_local1.emblemList ~= nil then
		f706_local1.emblemList:updateDataSource( true )
		f706_local1.emblemList:setActiveItem( f706_local1.emblemList:getFirstSelectableItem() )
		ForceNotifyModel( f706_arg2, "Emblem.UpdateDataSource" )
	end
end

function EmblemSelect_CopyEmblem( f707_arg0, f707_arg1, f707_arg2, f707_arg3, f707_arg4 )
	local f707_local0 = CoD.CraftUtility.Emblems.Copy( f707_arg2, f707_arg4:getModel(), CoD.perController[f707_arg2].selectedEmblemTabStorageType )
	if f707_local0 then
		CoD.CraftUtility.Emblems.ParseDDL( f707_arg2, Enum.StorageFileType.STORAGE_EMBLEMS )
		local f707_local1 = GoBack( f707_arg4, f707_arg2 )
		f707_local1.emblemList:updateDataSource( true )
		local f707_local2 = f707_local1.emblemList:findItem( {
			emblemIndex = f707_local0
		} )
		if f707_local2 then
			f707_local1.emblemList:setActiveItem( f707_local2 )
		end
		ForceNotifyModel( f707_arg2, "Emblem.UpdateDataSource" )
	end
end

function PaintshopWeaponList_TabChanged( f708_arg0, f708_arg1, f708_arg2 )
	DataSources.CraftWeaponList.setCurrentFilterItem( f708_arg1.filter )
	f708_arg0.weaponList:updateDataSource( true )
	f708_arg0.weaponList:setActiveItem( f708_arg0.weaponList:getFirstSelectableItem() )
	CoD.SetCustomization( f708_arg2, f708_arg0.tabList.Tabs.grid.activeWidget.gridInfoTable.zeroBasedIndex + 1, "category_index" )
end

function PaintshopWeaponList_Back( f709_arg0, f709_arg1, f709_arg2 )
	CoD.perController[f709_arg2].selectedpaintjobModel = nil
	CoD.perController[f709_arg2].paintshopWeaponListIndex = nil
	CoD.CraftUtility.Paintjobs.CachedPaintjobs = {}
end

function PaintshopWeaponList_GainFocus( f710_arg0, f710_arg1, f710_arg2 )
	CoD.SetCustomization( f710_arg2, Engine.GetModelValue( f710_arg1:getModel( f710_arg2, "itemIndex" ) ), "weapon_index" )
	CoD.SetCustomization( f710_arg2, f710_arg0.tabList.Tabs.grid.activeWidget.gridInfoTable.zeroBasedIndex + 1, "category_index" )
	CoD.CraftUtility.Gunsmith.DisplayBaseWeapon( f710_arg0, f710_arg1, f710_arg2 )
end

function PaintshopWeaponList_PressBackOnPaintjobsSelector( f711_arg0, f711_arg1, f711_arg2 )
	CoD.CraftUtility.Gunsmith.DisplayBaseWeapon( f711_arg0, f711_arg1, f711_arg2 )
	f711_arg0:updateMode( Enum.PaintshopMode.PAINTSHOPMODE_WEAPONLIST, f711_arg1 )
	f711_arg0.paintjobSelector.paintjobsList:setActiveItem( f711_arg0.paintjobSelector.paintjobsList:getFirstSelectableItem() )
end

function PaintshopWeaponList_ChooseWeapon( f712_arg0, f712_arg1, f712_arg2 )
	f712_arg0:updateMode( Enum.PaintshopMode.PAINTSHOPMODE_PAINTJOBS, f712_arg1 )
	CoD.perController[f712_arg2].paintshopWeaponListIndex = f712_arg0.weaponList.activeWidget.gridInfoTable.zeroBasedIndex + 1
	f712_arg0.paintjobSelector.paintjobsList:updateDataSource( true )
	f712_arg0.paintjobSelector.paintjobsList:setActiveItem( f712_arg0.paintjobSelector.paintjobsList:getFirstSelectableItem() )
end

function FeaturedCardsActionButtonHandler( f713_arg0, f713_arg1, f713_arg2, f713_arg3, f713_arg4 )
	local f713_local0 = f713_arg0:getParentMenu()
	local f713_local1 = nil
	local f713_local2 = ""
	local f713_local3 = nil
	if FeaturedCards_IsEnabled( f713_arg1, f713_arg2 ) == false then
		return 
	end
	local f713_local4 = nil
	if f713_arg0.LeftContainer.FEFeaturedCardsContainer.CardsList.activeWidget ~= nil then
		f713_local4 = f713_arg0.LeftContainer.FEFeaturedCardsContainer.CardsList.activeWidget:getModel()
	end
	if f713_local4 then
		f713_local2 = CoD.SafeGetModelValue( f713_local4, "action" )
		f713_local3 = CoD.SafeGetModelValue( f713_local4, "isExperimentPromo" )
	end
	if f713_local2 == "openwelcome" then
		OpenOverlay( f713_local0, "WelcomeMenu", f713_arg2 )
	elseif f713_local2 ~= nil and LUI.startswith( f713_local2, "store" ) then
		LUI.CoDMetrics.CRMMessageInteraction( f713_arg0, f713_arg2, "crm_featured" )
		if CoD.isPC then
			OpenSteamStore( f713_arg0, f713_arg1, f713_arg2, "FeaturedWidget", f713_local0 )
		else
			CoD.StoreUtility.SetupFocusCategory( f713_arg2, f713_local2 )
			OpenStore( f713_arg0, f713_arg1, f713_arg2, "FeaturedWidget", f713_local0 )
		end
	elseif f713_local2 == "opengroups" then
		OpenGroups( f713_arg0, f713_arg1, f713_arg2, f713_arg3, f713_local0 )
	elseif f713_local2 == "opencrm" then
		LUI.CoDMetrics.CRMMessageInteraction( f713_arg0, f713_arg2, "crm_featured" )
		local f713_local5 = false
		if f713_local4 then
			local f713_local6 = CoD.SafeGetModelValue( f713_local4, "index" )
			if f713_local6 then
				local f713_local7 = Engine.GetMarketingMessage( f713_arg2, "crm_featured", f713_local6 )
				if f713_local7 and f713_local7.action == "popup_video" and f713_local7.popup_image then
					Engine.SetModelValue( Engine.GetModel( DataSources.VoDViewer.getModel( f713_arg2 ), "stream" ), f713_local7.popup_image )
					OpenPopup( f713_local0, "VoDViewer", f713_arg2 )
					f713_local5 = true
				end
			end
		end
		if not f713_local5 then
			OpenCRMFeaturedPopup( f713_arg0, f713_arg1, f713_arg2, "Featured", f713_local0 )
		end
	elseif f713_local2 == "openmotd" then
		OpenMOTDPopup( f713_arg0, f713_arg1, f713_arg2, "FeaturedWidget", f713_local0 )
	elseif f713_local2 == "liveevent" then
		OpenPopup( f713_local0, "LiveEventViewer", f713_arg2 )
	elseif f713_local2 == "blackmarket" then
		if f713_local3 then
			LUI.CoDMetrics.ExperimentPromoFeatureCardEvent( f713_arg2, Engine.ExperimentsGetVariant( Engine.GetPrimaryController(), "chris_variable_discount" ) )
		else
			LUI.CoDMetrics.CRMMessageInteraction( f713_arg0, f713_arg2, "crm_featured" )
		end
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "blackmarketOpenSource" ), Engine.GetCurrentMode() )
		Engine.SwitchMode( f713_arg2, "mp" )
		OpenBlackMarket( f713_arg0, nil, f713_arg2 )
	elseif f713_local2 == "drmonty" then
		LUI.CoDMetrics.CRMMessageInteraction( f713_arg0, f713_arg2, "crm_featured" )
		CoD.perController[f713_arg2].cameFromFeaturedCard = true
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "megachewOpenSource" ), Engine.GetCurrentMode() )
		Engine.SwitchMode( f713_arg2, "zm" )
		OpenMegaChewFactorymenu( f713_arg0, f713_arg1, f713_arg2, f713_arg3, f713_local0 )
	elseif f713_local2 == "contracts" then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "contractsOpenSource" ), Engine.GetCurrentMode() )
		Engine.SwitchMode( f713_arg2, "mp" )
		LuaUtils.CycleContracts()
		OpenOverlay( f713_arg0, "BM_Contracts", f713_arg2 )
	elseif f713_local2 == "promo" then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "promoOpenSource" ), Engine.GetCurrentMode() )
		Engine.SwitchMode( f713_arg2, "mp" )
		OpenOverlay( f713_arg0, "RoadToCWL", f713_arg2 )
	elseif f713_local2 == "open_daily_challenge" then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "dailyChallengeOpenSource" ), Engine.GetCurrentMode() )
		Engine.SwitchMode( f713_arg2, "zm" )
		CoD.OverlayUtility.CreateOverlay( f713_arg2, f713_arg0, "InspectDailyChallengeOverlay", f713_arg2 )
	elseif f713_local2 == "open_cookbook" then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "cookbookRecipeOpenSource" ), Engine.GetCurrentMode() )
		Engine.SwitchMode( f713_arg2, "zm" )
		OpenGobbleGumCookbookMenu( f713_arg0, f713_arg1, f713_arg2, f713_arg3, f713_local0 )
	elseif f713_local2 == "open_zmhd_thermometer" then
		OpenOverlay( f713_arg0, "ZMHD_Community_Theme", f713_arg2 )
	end
end

function FeaturedCardsResetTimer( f714_arg0, f714_arg1, f714_arg2, f714_arg3, f714_arg4 )
	if f714_arg0.LeftContainer.FEFeaturedCardsContainer.CarouselTimer ~= nil then
		f714_arg0.LeftContainer.FEFeaturedCardsContainer.CarouselTimer:reset()
	end
end

function FeaturedCardsGetNextCard( f715_arg0, f715_arg1, f715_arg2, f715_arg3, f715_arg4 )
	local f715_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "FeaturedCardsRoot", false )
	Engine.SetModelValue( Engine.GetModel( f715_local0, "CardSequence" ), Engine.GetModelValue( Engine.GetModel( f715_local0, "CardSequence" ) ) + 1 )
end

function FeaturedCardsGetPreviousCard( f716_arg0, f716_arg1, f716_arg2, f716_arg3, f716_arg4 )
	local f716_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "FeaturedCardsRoot", false )
	Engine.SetModelValue( Engine.GetModel( f716_local0, "CardSequence" ), Engine.GetModelValue( Engine.GetModel( f716_local0, "CardSequence" ) ) - 1 )
end

function FeaturedCardsUpdateCRMMessage( f717_arg0, f717_arg1, f717_arg2, f717_arg3, f717_arg4 )
	Engine.UpdateFeaturedCardsCRMMessage( f717_arg2 )
end

function FileshareGetSlots( f718_arg0, f718_arg1, f718_arg2 )
	Engine.FileshareStartup( f718_arg2 )
end

function OpenMyShowcase( f719_arg0, f719_arg1, f719_arg2, f719_arg3, f719_arg4 )
	local f719_local0 = {
		xuid = Engine.GetXUID64( f719_arg2 )
	}
	Engine.ExecNow( f719_arg2, "fileshareResetSummaryFiles" )
	OpenPlayerShowcase( f719_arg0, f719_arg1, f719_arg2, f719_local0, f719_arg4 )
end

function OpenShowcase( f720_arg0, f720_arg1, f720_arg2, f720_arg3, f720_arg4 )
	local f720_local0 = CoD.FileshareUtility.GetCurrentCategory()
	local f720_local1 = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	FileshareSetShowcasePublishMode( f720_arg2, false )
	if f720_local0 == "paintjob" then
		OpenShowcasePaintjobs( f720_arg0, f720_arg1, f720_arg2, f720_local1, f720_arg4 )
	elseif f720_local0 == "variant" then
		OpenShowcaseVariants( f720_arg0, f720_arg1, f720_arg2, f720_local1, f720_arg4 )
	elseif f720_local0 == "emblem" then
		OpenShowcaseEmblems( f720_arg0, f720_arg1, f720_arg2, f720_local1, f720_arg4 )
	elseif f720_local0 == "customgame" then
		OpenShowcaseCustomGames( f720_arg0, f720_arg1, f720_arg2, f720_local1, f720_arg4 )
	elseif f720_local0 == "screenshot" then
		OpenShowcaseScreenshots( f720_arg0, f720_arg1, f720_arg2, f720_local1, f720_arg4 )
	elseif f720_local0 == "recentgames" then
		OpenShowcaseRecentGames( f720_arg0, f720_arg1, f720_arg2, f720_local1, f720_arg4 )
	elseif f720_local0 == "clip_private" then
		OpenShowcaseLocalClips( f720_arg0, f720_arg1, f720_arg2, f720_local1, f720_arg4 )
	elseif f720_local0 == "clip" then
		OpenShowcaseClips( f720_arg0, f720_arg1, f720_arg2, f720_local1, f720_arg4 )
	end
end

function OpenPlayerShowcaseOnParent( f721_arg0, f721_arg1, f721_arg2, f721_arg3, f721_arg4 )
	CoD.FileshareUtility.SetCurrentUser( f721_arg3.xuid )
	CoD.FileshareUtility.SetFileshareMode( f721_arg2, Enum.FileshareMode.FILESHARE_MODE_USER )
	FileshareSetShowcasePublishMode( f721_arg2, false )
	CoD.ShowcaseOtherPlayerStats = true
	GoBackAndOpenOverlayOnParent( f721_arg0, "MyShowcase", f721_arg2 )
end

function OpenPlayerShowcase( f722_arg0, f722_arg1, f722_arg2, f722_arg3, f722_arg4 )
	CoD.FileshareUtility.InitModels()
	CoD.FileshareUtility.SetCurrentUser( f722_arg3.xuid )
	CoD.FileshareUtility.SetFileshareMode( f722_arg2, Enum.FileshareMode.FILESHARE_MODE_USER )
	FileshareSetShowcasePublishMode( f722_arg2, false )
	CoD.ShowcaseOtherPlayerStats = false
	OpenOverlay( f722_arg0, "MyShowcase", f722_arg2 )
end

function OpenShowcasePaintjobs( f723_arg0, f723_arg1, f723_arg2, f723_arg3, f723_arg4 )
	CoD.FileshareUtility.SetPreviousCategory( "paintjob" )
	CoD.FileshareUtility.SetCurrentCategory( "paintjob" )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	local f723_local0 = false
	if FileshareIsCurrentUserContext( f723_arg2 ) then
		f723_local0 = true
	end
	CoD.FileshareUtility.SetShowCreateButton( f723_local0 )
	OpenOverlay( f723_arg0, "MyShowcase_Paintjobs", f723_arg2 )
end

function OpenShowcaseVariants( f724_arg0, f724_arg1, f724_arg2, f724_arg3, f724_arg4 )
	CoD.FileshareUtility.SetPreviousCategory( "variant" )
	CoD.FileshareUtility.SetCurrentCategory( "variant" )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	local f724_local0 = false
	if FileshareIsCurrentUserContext( f724_arg2 ) then
		f724_local0 = true
	end
	CoD.FileshareUtility.SetShowCreateButton( f724_local0 )
	OpenOverlay( f724_arg0, "MyShowcase_Variants", f724_arg2 )
end

function OpenShowcaseEmblems( f725_arg0, f725_arg1, f725_arg2, f725_arg3, f725_arg4 )
	CoD.FileshareUtility.SetPreviousCategory( "emblem" )
	CoD.FileshareUtility.SetCurrentCategory( "emblem" )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	local f725_local0 = false
	if FileshareIsCurrentUserContext( f725_arg2 ) then
		f725_local0 = true
	end
	CoD.FileshareUtility.SetShowCreateButton( f725_local0 )
	OpenOverlay( f725_arg0, "MyShowcase_Emblems", f725_arg2 )
end

function OpenLocalClipPublishPrompt( f726_arg0, f726_arg1, f726_arg2, f726_arg3, f726_arg4 )
	local f726_local0 = Engine.LobbyGetDemoInformation()
	if not f726_local0 or f726_local0.fileID ~= CoD.FileshareUtility.GetSelectedItemProperty( "fileId" ) then
		LuaUtils.UI_ShowErrorMessageDialog( f726_arg2, "MENU_FILESHARE_PUBLISH_ONLY_AFTER_DOWNLOADING" )
		return 
	else
		CoD.FileshareUtility.OpenPublishPrompt( f726_arg0, f726_arg2, "clip", CoD.FileshareUtility.GetSelectedItemProperty( "fileName" ), CoD.FileshareUtility.GetSelectedItemProperty( "fileDescription" ), PublishClip )
	end
end

function GetShowcaseManagerCategoryList()
	return CoD.FileshareUtility.ShowcaseManagerTabs
end

function GetShowcaseManagerCategoryCount()
	return #CoD.FileshareUtility.ShowcaseManagerTabs
end

function OpenShowcaseManager( f729_arg0, f729_arg1, f729_arg2, f729_arg3, f729_arg4 )
	CoD.FileshareUtility.SetPreviousCategory( CoD.FileshareUtility.GetCurrentCategory() )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	CoD.FileshareUtility.SetShowCreateButton( FileshareCanBuyMoreSlots( f729_arg2 ) )
	OpenOverlay( f729_arg0, "Fileshare_ShowcaseManager", f729_arg2 )
end

function OpenLocalScreenshots( f730_arg0, f730_arg1 )
	local f730_local0 = "screenshot_private"
	CoD.FileshareUtility.SetCurrentCategory( f730_local0 )
	if f730_local0 ~= CoD.FileshareUtility.GetPreviousCategory() then
		CoD.FileshareUtility.SetDirty()
	end
	CoD.FileshareUtility.ProcessUIIndex( f730_arg1, f730_local0, 0 )
	local f730_local1 = Engine.GetXUID64( f730_arg1 )
	Engine.ExecNow( f730_arg1, "fileshareResetSummaryFiles" )
	CoD.FileshareUtility.SetCurrentUser( f730_local1 )
	CoD.FileshareUtility.SetFileshareMode( f730_arg1, Enum.FileshareMode.FILESHARE_MODE_USER )
	CoD.FileshareUtility.FetchContentForUser( f730_arg1, f730_local1 )
	FileshareSetShowcasePublishMode( f730_arg1, false )
	CoD.FileshareUtility.SetPreviousCategory( f730_local0 )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	CoD.FileshareUtility.SetShowCreateButton( false )
	CoD.FileshareUtility.SetShowFileDetails( false )
	CoD.FileshareUtility.SetShowPublishNewDetails( false )
	CoD.FileshareUtility.SetShowCreateButton( false )
	CoD.FileshareUtility.SetForceRefreshThumbnails( true )
	OpenOverlay( f730_arg0, "LocalScreenshots", f730_arg1 )
	CoD.FileshareUtility.SetForceRefreshThumbnails( false )
end

function OpenLocalScreenshotsPublishPrompt( f731_arg0, f731_arg1, f731_arg2, f731_arg3, f731_arg4 )
	local f731_local0 = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	if Engine.IsScreenshotReady( Enum.ScreenshotViewType.UI_SCREENSHOT_TYPE_SCREENSHOT, f731_local0 ) == false or Engine.IsScreenshotReady( Enum.ScreenshotViewType.UI_SCREENSHOT_TYPE_THUMBNAIL, f731_local0 ) == false then
		LuaUtils.UI_ShowErrorMessageDialog( f731_arg2, "MENU_UPLOAD_FAIL_DUE_TO_SCREENSHOT_DOWNLOAD" )
		return 
	else
		CoD.FileshareUtility.OpenPublishPrompt( f731_arg0, f731_arg2, "screenshot", CoD.FileshareUtility.GetSelectedItemProperty( "fileName" ), CoD.FileshareUtility.GetSelectedItemProperty( "fileDescription" ), PublishScreenshot )
	end
end

function FileshareCloseShowcaseManager( f732_arg0, f732_arg1, f732_arg2 )
	CoD.FileshareUtility.SetInShowcaseManager( f732_arg2, false )
end

function OpenMediaCommunity( f733_arg0, f733_arg1, f733_arg2, f733_arg3, f733_arg4, f733_arg5 )
	CoD.FileshareUtility.InitModels()
	CoD.FileshareUtility.SetCurrentCommunityDataType( f733_arg5 )
	CoD.FileshareUtility.SetFileshareMode( f733_arg2, Enum.FileshareMode.FILESHARE_MODE_COMMUNITY )
	OpenOverlay( f733_arg0, "Community", f733_arg2 )
end

function FilesharePublishedTabChanged( f734_arg0, f734_arg1, f734_arg2 )
	if f734_arg1.fileshareCategory ~= nil then
		CoD.FileshareUtility.SetCurrentCategory( f734_arg1.fileshareCategory )
	else
		CoD.FileshareUtility.SetCurrentCategory( "" )
	end
	if f734_arg1.fileshareKey ~= nil and f734_arg1.fileshareVal ~= nil then
		CoD.FileshareUtility.SetCurrentFilter( f734_arg1.fileshareKey, f734_arg1.fileshareVal )
	else
		CoD.FileshareUtility.SetCurrentFilter( "", "" )
	end
	CoD.FileshareUtility.SetShowFileDetails( false )
	CoD.FileshareUtility.SetDirty()
end

function FileshareShowcaseManagerTabChanged( f735_arg0, f735_arg1, f735_arg2 )
	if f735_arg1.fileshareCategory ~= nil then
		CoD.FileshareUtility.SetCurrentCategory( f735_arg1.fileshareCategory )
	else
		CoD.FileshareUtility.SetCurrentCategory( "" )
	end
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	CoD.FileshareUtility.SetShowFileDetails( false )
	CoD.FileshareUtility.SetShowPublishNewDetails( false )
	CoD.FileshareUtility.SetDirty()
end

function FileshareSetSelectedItemAttachTimer( f736_arg0, f736_arg1, f736_arg2, f736_arg3 )
	local f736_local0 = LUI.UITimer.newElementTimer( 300, true, function ()
		CoD.FileshareUtility.ProcessUIIndex( f736_arg1, f736_arg2, f736_arg3 )
	end, f736_arg0 )
	f736_arg0.processUIIndexTimer = f736_local0
	f736_arg0:addElement( f736_local0 )
end

function FileshareItemLoseFocus( f738_arg0 )
	if f738_arg0.processUIIndexTimer then
		f738_arg0.processUIIndexTimer:close()
		f738_arg0.processUIIndexTimer = nil
	end
end

function FileshareSetSelectedItem( f739_arg0, f739_arg1, f739_arg2, f739_arg3 )
	local f739_local0 = f739_arg1:getModel()
	if f739_local0 == nil then
		CoD.CraftUtility.Fileshare.ClearDisplay( f739_arg2 )
		return 
	end
	CoD.FileshareUtility.SetSelectedItem( f739_local0 )
	local f739_local1 = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	local f739_local2 = CoD.FileshareUtility.GetSelectedItemProperty( "isPublishNew" )
	local f739_local3 = CoD.FileshareUtility.GetCurrentCategory()
	local f739_local4 = f739_arg3 == "true"
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareRoot.SelectedFileID" ), f739_local1 )
	if f739_local2 == true or f739_local1 == 0 then
		CoD.FileshareUtility.SetShowPublishNewDetails( true )
		CoD.CraftUtility.Fileshare.ClearDisplay( f739_arg2 )
		return 
	elseif f739_arg1.gridInfoTable then
		local f739_local5 = f739_arg1.gridInfoTable.zeroBasedIndex
		FileshareSetSelectedItemAttachTimer( f739_arg1, f739_arg2, f739_local3, f739_local5 )
		if FileshareIsCheckingPageFetchThreshold( f739_arg2 ) and Engine.FileshareIsUIIndexBeyondThreshold( f739_local5 ) then
			CoD.FileshareUtility.ProcessUIIndex( f739_arg2, f739_local3, f739_local5 )
		end
	end
	local f739_local5 = Engine.GetFileshareWeaponIndex( f739_arg2, f739_local1 )
	if f739_local3 == "recent" or f739_local3 == "favorites" or f739_local3 == "featured" then
		f739_local3 = CoD.SafeGetModelValue( f739_local0, "fileCategory" )
	end
	if f739_local3 == "paintjob" then
		CoD.CraftUtility.Fileshare.DisplayWeaponWithPaintjob( f739_arg2, f739_local5, f739_local1, f739_local4 )
	elseif f739_local3 == "variant" then
		CoD.CraftUtility.Fileshare.DisplayWeaponVariants( f739_arg2, f739_local5, f739_local1, f739_local4 )
	end
	if CoD.FileshareUtility.ShouldSetPreviewIconSizeShort( f739_local3 ) then
		FileshareSetPreviewIconSizeShort()
	else
		FileshareSetPreviewIconSizeNormal()
	end
end

function FileshareSetSelectedItemCategoryName( f740_arg0, f740_arg1, f740_arg2 )
	local f740_local0 = f740_arg1:getModel()
	if not f740_local0 then
		return 
	end
	local f740_local1 = Engine.GetModel( f740_local0, "fileCategory" )
	if f740_local1 then
		CoD.FileshareUtility.SetCurrentItemCategoryName( Engine.GetModelValue( f740_local1 ) )
	end
end

function FileshareShowcasePublishSetSelectedItem( f741_arg0, f741_arg1, f741_arg2 )
	if CoD.FileshareUtility.GetInShowcaseManager() then
		return 
	end
	local f741_local0 = CoD.FileshareUtility.GetCurrentCategory()
	if f741_local0 == "paintjob" then
		CoD.perController[f741_arg2].selectedpaintjobModel = f741_arg1:getModel()
		CoD.perController[f741_arg2].viewIndex = 1
		CoD.CraftUtility.Fileshare.DisplayWeaponWithPaintjobUsingModel( f741_arg2, f741_arg1:getModel() )
	elseif f741_local0 == "variant" then
		CoD.perController[f741_arg2].gunsmithVariantModel = f741_arg1:getModel()
		CoD.CraftUtility.Fileshare.DisplayWeaponWithVariant( f741_arg2, CoD.perController[f741_arg2].gunsmithVariantModel )
	elseif f741_local0 == "emblem" then
		CoD.perController[f741_arg2].selectedEmblemModel = f741_arg1:getModel()
		Engine.SetupEmblemData( f741_arg2, Engine.GetModelValue( f741_arg1:getModel( f741_arg2, "emblemIndex" ) ), CoD.perController[f741_arg2].selectedEmblemTabStorageType )
	end
end

function FileshareSetShowFileDetails( f742_arg0, f742_arg1 )
	CoD.FileshareUtility.SetShowFileDetails( f742_arg1 )
end

function FileshareSetShowPublishNewDetails( f743_arg0, f743_arg1 )
	CoD.FileshareUtility.SetShowPublishNewDetails( f743_arg1 )
end

function FileshareShowcasePublishSelectedItem( f744_arg0, f744_arg1, f744_arg2 )
	local f744_local0 = CoD.FileshareUtility.GetCurrentCategory()
	if f744_local0 == "screenshot" then
		f744_local0 = "screenshot_private"
		CoD.FileshareUtility.SetCurrentCategory( f744_local0 )
	end
	if f744_local0 == "paintjob" then
		CoD.perController[f744_arg2].selectedpaintjobModel = f744_arg1:getModel()
		CoD.CraftUtility.OpenPublishPromptPaintjob( f744_arg0, f744_arg1, f744_arg2, nil, f744_arg0 )
	elseif f744_local0 == "variant" then
		CoD.perController[f744_arg2].gunsmithVariantModel = f744_arg1:getModel()
		CoD.CraftUtility.OpenPublishPromptGunsmith( f744_arg0, f744_arg1, f744_arg2, nil, f744_arg0 )
	elseif f744_local0 == "emblem" then
		CoD.perController[f744_arg2].selectedEmblemModel = f744_arg1:getModel()
		CoD.CraftUtility.OpenPublishPromptEmblem( f744_arg0, f744_arg1, f744_arg2, nil, f744_arg0 )
	elseif f744_local0 == "customgame" then
		Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" ), "gameType" ), Engine.GetModelValue( Engine.GetModel( f744_arg1:getModel(), "gameType" ) ) )
		SetSelectedCustomGame( f744_arg1, f744_arg2 )
		OpenCustomGamePublishPrompt( f744_arg0, f744_arg1, f744_arg2, nil, f744_arg0 )
	elseif f744_local0 == "screenshot_private" then
		OpenLocalScreenshotsPublishPrompt( f744_arg0, f744_arg1, f744_arg2, nil, nil )
	elseif f744_local0 == "clip_private" then
		OpenLocalClipPublishPrompt( f744_arg0, f744_arg1, f744_arg2, nil, nil )
	end
end

function FileshareSetDirty( f745_arg0 )
	CoD.FileshareUtility.SetDirty()
end

function FileshareCategorySelectorItemSelected( f746_arg0, f746_arg1, f746_arg2 )
	local f746_local0 = Engine.GetModelValue( Engine.GetModel( f746_arg1:getModel(), "category" ) )
	local f746_local1 = CoD.FileshareUtility.GetCurrentCommunityDataType()
	local f746_local2 = false
	local f746_local3 = Engine.GetModel( f746_arg1:getModel(), "communityDataType" )
	if f746_local3 then
		local f746_local4 = CoD.FileshareUtility.GetCurrentCommunityDataType()
		local f746_local5 = Engine.GetModelValue( f746_local3 )
		if f746_local5 ~= nil and f746_local5 ~= "" and f746_local4 ~= f746_local5 then
			CoD.FileshareUtility.SetCurrentCommunityDataType( f746_local5 )
			f746_local1 = f746_local5
			f746_local2 = true
		end
	end
	FileshareCategorySelectorCategoryChanged( f746_arg2, f746_local0, f746_local1, f746_local2 )
end

function FileshareCategorySelectorSetToCategory( f747_arg0, f747_arg1, f747_arg2 )
	FileshareCategorySelectorCategoryChanged( f747_arg0, f747_arg1, nil, f747_arg2 )
end

function FileshareHandleKeyboardComplete( f748_arg0, f748_arg1, f748_arg2, f748_arg3 )
	if f748_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_FILESHARE_PUBLISH_NAME then
		CoD.FileshareUtility.SetPublishName( f748_arg3.input )
	elseif f748_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_FILESHARE_PUBLISH_DESCRIPTION then
		CoD.FileshareUtility.SetPublishDescription( f748_arg3.input )
	elseif f748_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_FILESHARE_PUBLISH_TAGS then
		CoD.FileshareUtility.SetPublishTags( f748_arg3.input )
	elseif f748_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_FILESHARE_DOWNLOAD_NAME then
		CoD.FileshareUtility.SetDownloadFileName( f748_arg3.input )
	end
end

function FileshareEnterDownloadName( f749_arg0, f749_arg1, f749_arg2 )
	ShowKeyboard( f749_arg0, f749_arg1, f749_arg2, "KEYBOARD_TYPE_FILESHARE_DOWNLOAD_NAME" )
end

function FileshareEnterPublishName( f750_arg0, f750_arg1, f750_arg2 )
	ShowKeyboard( f750_arg0, f750_arg1, f750_arg2, "KEYBOARD_TYPE_FILESHARE_PUBLISH_NAME" )
end

function FileshareEnterPublishDescription( f751_arg0, f751_arg1, f751_arg2 )
	ShowKeyboard( f751_arg0, f751_arg1, f751_arg2, "KEYBOARD_TYPE_FILESHARE_PUBLISH_DESCRIPTION" )
end

function FileshareEnterPublishTags( f752_arg0, f752_arg1, f752_arg2 )
	ShowKeyboard( f752_arg0, f752_arg1, f752_arg2, "KEYBOARD_TYPE_FILESHARE_PUBLISH_TAGS" )
end

function FileshareRestoreToPreviousCategory( f753_arg0 )
	if FileshareShowcaseIsPublishMode( nil, f753_arg0 ) then
		return 
	end
	local f753_local0 = CoD.FileshareUtility.GetPreviousCategory()
	if f753_local0 then
		CoD.FileshareUtility.SetCurrentCategory( f753_local0 )
	end
end

function FileshareDeleteCurrentItem( f754_arg0, f754_arg1, f754_arg2, f754_arg3, f754_arg4 )
	CoD.FileshareUtility.Delete( f754_arg0, f754_arg1, f754_arg2, f754_arg3, f754_arg4, true )
end

function FileshareDeleteDone( f755_arg0, f755_arg1, f755_arg2, f755_arg3, f755_arg4 )
	CoD.FileshareUtility.DeleteDone( f755_arg0, f755_arg1, f755_arg2, f755_arg3, f755_arg4 )
end

function FileshareSetPreviewIconSizeNormal()
	local f756_local0 = CoD.FileshareUtility.GetRootModel()
	local f756_local1 = Engine.CreateModel( f756_local0, "isNormalSize", false )
	local f756_local2 = Engine.CreateModel( f756_local0, "listVerticalCount", false )
	Engine.SetModelValue( f756_local1, true )
	Engine.SetModelValue( f756_local2, 2 )
end

function FileshareSetPreviewIconSizeShort()
	local f757_local0 = CoD.FileshareUtility.GetRootModel()
	local f757_local1 = Engine.CreateModel( f757_local0, "isNormalSize", false )
	local f757_local2 = Engine.CreateModel( f757_local0, "listVerticalCount", false )
	Engine.SetModelValue( f757_local1, false )
	Engine.SetModelValue( f757_local2, 3 )
end

function FileshareSummaryFileUpdate( f758_arg0 )
	local f758_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "fileshareRoot", false )
	local f758_local1 = Engine.GetModelValue( Engine.CreateModel( f758_local0, "summaryFileUpdated", false ) )
	if f758_local1 == nil then
		return 
	elseif CoD.FileshareUtility.GetIsFullscreenMode( f758_arg0 ) == true then
		local f758_local2 = CoD.FileshareUtility.GetSelectedItemRootModel()
		if Engine.GetModelValue( Engine.CreateModel( f758_local2, "fileId" ) ) == f758_local1 then
			Engine.SetModelValue( Engine.CreateModel( f758_local2, "renderFileId" ), f758_local1 )
			Engine.SetModelValue( Engine.CreateModel( f758_local2, "showDetailsViewSpinner" ), 0 )
			local f758_local3 = Engine.GetModelValue( Engine.CreateModel( f758_local2, "fileId" ) )
			local f758_local4 = Engine.GetModelValue( Engine.CreateModel( f758_local2, "fileCategory" ) )
			local f758_local5 = Engine.GetFileshareWeaponIndex( f758_arg0, f758_local3 )
			if f758_local4 == "paintjob" then
				CoD.CraftUtility.Fileshare.DisplayWeaponWithPaintjob( f758_arg0, f758_local5, f758_local3, true )
			elseif f758_local4 == "variant" then
				CoD.CraftUtility.Fileshare.DisplayWeaponVariants( f758_arg0, f758_local5, f758_local3, true )
			end
		end
	else
		for f758_local2 = 1, 12, 1 do
			local f758_local3 = "fileshareData_" .. f758_local2
			if FileshareIsCommunityMode( nil, f758_arg0 ) == true then
				f758_local3 = "fileshareData_community_" .. f758_local2
			end
			local f758_local4 = Engine.CreateModel( f758_local0, f758_local3, false )
			local f758_local5 = Engine.CreateModel( f758_local4, "fileID", false )
			local f758_local8 = Engine.CreateModel( f758_local4, "renderFileId", false )
			if Engine.GetModelValue( f758_local5 ) == f758_local1 then
				Engine.SetModelValue( f758_local8, f758_local1 )
				break
			end
		end
	end
end

function FileshareSetCommunityKicker( f759_arg0 )
	SetHeadingKickerText( Engine.Localize( CoD.FileshareUtility.GetCurrentCommunityMenuKicker() ) )
end

function FileshareSetCurrentCategory( f760_arg0, f760_arg1 )
	CoD.FileshareUtility.SetCurrentCategory( f760_arg1 )
end

function FileshareSetShowCreateButton( f761_arg0, f761_arg1 )
	CoD.FileshareUtility.SetShowCreateButton( f761_arg1 )
end

function FileshareDownloadSummary( f762_arg0, f762_arg1, f762_arg2 )
	if Engine.CurrentSessionMode() == Enum.eModes.MODE_INVALID then
		return 
	end
	local f762_local0 = f762_arg1:getModel()
	if f762_local0 then
		local f762_local1 = Engine.GetModelValue( Engine.GetModel( f762_local0, "fileId" ) )
		local f762_local2 = Engine.GetModelValue( Engine.GetModel( f762_local0, "fileSummarySize" ) )
		local f762_local3 = Engine.GetModelValue( Engine.GetModel( f762_local0, "isPooled" ) )
		local f762_local4 = Enum.fileShareLocation.FILESHARE_LOCATION_USERSTORAGE
		if f762_local3 then
			f762_local4 = Enum.fileShareLocation.FILESHARE_LOCATION_POOLEDSTORAGE
		end
		Engine.FileshareDownloadSummary( f762_arg2, f762_local1, f762_local2, f762_local4 )
	end
end

function FileshareAbortSummaryDownload( f763_arg0, f763_arg1, f763_arg2 )
	
end

function FileshareHandleDownloadSummary( f764_arg0, f764_arg1, f764_arg2, f764_arg3 )
	local f764_local0 = f764_arg0:getModel()
	if f764_local0 then
		CoD.FileshareUtility.SetupFileShareSummary( f764_local0, f764_arg3 )
	end
end

function FileshareDownloadScreenshot( f765_arg0, f765_arg1 )
	if f765_arg1 == nil then
		f765_arg1 = 1000
	end
	local f765_local0 = DataSources.FileshareSelectedItem.getModel()
	if f765_local0 then
		local f765_local1 = CoD.SafeGetModelValue( f765_local0, "fileId" )
		if not f765_local1 then
			f765_local1 = Engine.DefaultID64Value()
		end
		if f765_local1 ~= CoD.currentScreenshot then
			FileshareDestroyScreenshot( f765_arg0 )
			local f765_local2 = CoD.SafeGetModelValue( f765_local0, "fileSize" ) or 0
			if f765_local1 ~= Engine.DefaultID64Value() then
				Engine.DownloadScreenshot( f765_arg0, f765_local1, f765_local2, f765_arg1 )
				CoD.currentScreenshot = f765_local1
			end
		end
	end
end

function FileshareDestroyScreenshot( f766_arg0 )
	if CoD.currentScreenshot then
		Engine.DestroyScreenshot( f766_arg0 )
		CoD.currentScreenshot = nil
	end
end

function FileshareBookmarkRecentGame( f767_arg0 )
	local f767_local0 = CoD.GetPlayerStats( f767_arg0 )
	local f767_local1 = f767_local0.AfterActionReportStats.demoFileID:get()
	if f767_local1 ~= nil and f767_local1 ~= "0" then
		Engine.BookmarkRecentGame( f767_arg0, f767_local1 )
		CoD.OverlayUtility.ShowToast( "RecentGameBookmarked", Engine.ToUpper( Engine.Localize( "MENU_NOTICE" ) ), Engine.Localize( "MENU_GAME_BOOKMARKED" ), "uie_bookmark" )
	end
end

function SetFileshareShowcaseKickerText( f768_arg0 )
	local f768_local0 = Engine.GetXUID64( f768_arg0 )
	local f768_local1 = Engine.ToUpper( Engine.Localize( "MENU_SHOWCASE" ) )
	if FileshareGetShowcasePublishMode( f768_arg0 ) == true then
		Engine.ToUpper( Engine.Localize( "MENU_PUBLISH" ) )
	end
	if f768_local0 == CoD.FileshareUtility.GetCurrentUser() then
		f768_local1 = Engine.ToUpper( Engine.Localize( "MENU_MEDIA_MYSHOWCASE" ) )
	end
	if CoD.FileshareUtility.GetIsGroupsMode( f768_arg0 ) then
		f768_local1 = Engine.ToUpper( Engine.Localize( "GROUPS_GROUP_HEADQUARTERS_CAPS" ) )
	end
	SetHeadingKickerText( f768_local1 )
end

function SetIsInFileshare( f769_arg0, f769_arg1 )
	local f769_local0 = false
	if f769_arg1 and f769_arg1 == "true" then
		f769_local0 = true
	end
	CoD.perController[f769_arg0].inFileshare = f769_local0
end

function FileshareSetIsInFullscreenView( f770_arg0, f770_arg1 )
	CoD.FileshareUtility.SetIsFullscreenMode( f770_arg0, f770_arg1 )
end

function FileshareSetShowcasePublishMode( f771_arg0, f771_arg1 )
	local f771_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareRoot", false ), "PublishMode", false )
	local f771_local1 = 0
	if f771_arg1 == true then
		f771_local1 = 1
	end
	Engine.SetModelValue( f771_local0, f771_local1 )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" ), "secondaryListSelected" ), false )
end

function FileshareGetShowcasePublishMode( f772_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareRoot", false ), "PublishMode", false ) ) == 1
end

function FileshareToggleDetailsHiddenMode( f773_arg0 )
	local f773_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareRoot", false ), "DetailsHiddenMode", false )
	Engine.SetModelValue( f773_local0, Negate( Engine.GetModelValue( f773_local0 ) or 0 ) )
end

function FileshareResetDetailsHiddenMode( f774_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareRoot", false ), "DetailsHiddenMode", false ), 0 )
end

function FileshareGetDetailsHiddenMode( f775_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "FileshareRoot", false ), "DetailsHiddenMode", false ) ) == 1
end

function FileshareRecordSaveEvent( f776_arg0 )
	local f776_local0 = CoD.FileshareUtility.GetCurrentCategory()
	local f776_local1 = Engine.FileshareGetQuota( f776_arg0, f776_local0 )
	if not f776_local1 then
		return 
	elseif f776_local0 == "screenshot_private" then
		LUI.CoDMetrics.ScreenshotEvent( f776_arg0, "save", f776_local0, f776_local1.categorySlotsUsed, f776_local1.categoryQuota )
	elseif f776_local0 == "clip_private" then
		LUI.CoDMetrics.ClipsEvent( f776_arg0, "save", f776_local0, f776_local1.categorySlotsUsed, f776_local1.categoryQuota )
	end
end

function FileshareRecordPublishEvent( f777_arg0 )
	local f777_local0 = CoD.FileshareUtility.GetCurrentCategory()
	if f777_local0 == "screenshot_private" then
		f777_local0 = "screenshot"
	elseif f777_local0 == "clip_private" then
		f777_local0 = "clip"
	end
	local f777_local1 = Engine.FileshareGetQuota( f777_arg0, f777_local0 )
	if not f777_local1 then
		return 
	else
		LUI.CoDMetrics.FileshareEvent( f777_arg0, "publish", f777_local0, f777_local1.categorySlotsUsed, f777_local1.categoryQuota )
	end
end

function FileshareMoveToNextItem( f778_arg0, f778_arg1, f778_arg2, f778_arg3 )
	if FileshareDetailsViewCanMoveToNext( f778_arg2 ) then
		FileshareUpdateDetailsViewModel( f778_arg0, f778_arg1, f778_arg2, CoD.FileshareUtility.GetSelectedItemProperty( "codeIndex" ) + 1 )
	end
end

function FileshareMoveToPreviousItem( f779_arg0, f779_arg1, f779_arg2 )
	if FileshareDetailsViewCanMoveToPrevious( f779_arg2 ) then
		FileshareUpdateDetailsViewModel( f779_arg0, f779_arg1, f779_arg2, CoD.FileshareUtility.GetSelectedItemProperty( "codeIndex" ) - 1 )
	end
end

function FileshareShowErrorToast( f780_arg0, f780_arg1, f780_arg2 )
	CoD.FileshareUtility.ShowSimpleToast( f780_arg2, CoD.FileshareUtility.ToastTypes.ERROR )
end

function FileshareLikeVoteSuccessHandler( f781_arg0, f781_arg1, f781_arg2 )
	CoD.FileshareUtility.ShowToast( f781_arg1, CoD.FileshareUtility.ToastTypes.LIKE )
end

function FileshareDisikeVoteSuccessHandler( f782_arg0, f782_arg1, f782_arg2 )
	CoD.FileshareUtility.ShowToast( f782_arg1, CoD.FileshareUtility.ToastTypes.DISLIKE )
end

function FileshareShowPublishSuccessToast( f783_arg0, f783_arg1, f783_arg2 )
	CoD.FileshareUtility.ShowToast( f783_arg2, CoD.FileshareUtility.ToastTypes.PUBLISH )
end

function FileshareShowUploadSuccessToast( f784_arg0, f784_arg1, f784_arg2 )
	CoD.FileshareUtility.ShowToast( f784_arg2, CoD.FileshareUtility.ToastTypes.UPLOAD )
end

function FileshareShowDeleteSuccessToast( f785_arg0, f785_arg1, f785_arg2 )
	CoD.FileshareUtility.ShowToast( f785_arg2, CoD.FileshareUtility.ToastTypes.DELETE )
end

function FileshareShowDownloadSuccessToast( f786_arg0, f786_arg1, f786_arg2 )
	CoD.FileshareUtility.ShowToast( f786_arg2, CoD.FileshareUtility.ToastTypes.DOWNLOAD )
end

function FileshareShowReadonlyToast( f787_arg0, f787_arg1, f787_arg2 )
	CoD.FileshareUtility.ShowSimpleToast( f787_arg2, CoD.FileshareUtility.ToastTypes.READONLY )
end

function CloseLocalScreenshots( f788_arg0 )
	FileshareDestroyScreenshot( f788_arg0 )
	CoD.perController[f788_arg0].combatRecordProfileSnapshot = false
	CombatRecordProfileSnapshotDownloadScreenshot( f788_arg0 )
end

function GetMediaManagerCategoryList()
	return CoD.FileshareUtility.MediaManagerTabs
end

function GetMediaManagerCategoryCount()
	return #CoD.FileshareUtility.MediaManagerTabs
end

function SetIsMediaManager( f791_arg0, f791_arg1, f791_arg2, f791_arg3, f791_arg4 )
	if f791_arg3 then
		local f791_local0 = 0
		if f791_arg3 == "true" then
			f791_local0 = 1
		end
		Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false ), "isMediaManager", false ), f791_local0 )
	end
end

function MediaManagerMarkDirty( f792_arg0 )
	local f792_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false ), "dirty", false )
	ForceNotifyGlobalModel( f792_arg0, "MediaManager.dirty" )
	MediaManagerUpdateSlotsUsed( f792_arg0, CoD.perController[f792_arg0].selectedMediaManagerTab )
end

function MediaManagerClearPaintjob( f793_arg0, f793_arg1, f793_arg2, f793_arg3, f793_arg4 )
	CoD.CraftUtility.PaintjobClear( f793_arg0, f793_arg1, f793_arg2, f793_arg3, f793_arg4 )
end

function MediaManagerClearVariant( f794_arg0, f794_arg1, f794_arg2, f794_arg3, f794_arg4 )
	CoD.CraftUtility.GunsmithClear( f794_arg0, f794_arg1, f794_arg2, f794_arg3, f794_arg4 )
end

function MediaManagerClearEmblem( f795_arg0, f795_arg1, f795_arg2, f795_arg3, f795_arg4 )
	CoD.CraftUtility.EmblemClear( f795_arg0, f795_arg1, f795_arg2, f795_arg3, f795_arg4 )
end

function MediaManagerClearCustomGame( f796_arg0, f796_arg1, f796_arg2, f796_arg3, f796_arg4 )
	CoD.OverlayUtility.CreateOverlay( f796_arg2, f796_arg4, "CustomGameClearConfirmationOverlay" )
end

function MediaManagerDeleteTheaterFile( f797_arg0, f797_arg1, f797_arg2, f797_arg3, f797_arg4 )
	Engine.SetModelValue( CoD.FileshareUtility.GetDeletingModel(), Enum.FileshareTaskUIState.FILESHARE_TASK_UI_IDLE )
	f797_arg4.m_leaveParentOpenAfterDelete = leaveParentOpen
	OpenPopup( f797_arg4, "MediaManagerDeleteTheaterFile", f797_arg2 )
end

function MediaManagerTabChanged( f798_arg0, f798_arg1, f798_arg2 )
	CoD.perController[f798_arg2].selectedMediaManagerTab = f798_arg1.fileshareCategory
	MediaManagerUpdateSlotsUsed( f798_arg2, f798_arg1.fileshareCategory )
	CoD.FileshareUtility.SetCurrentCategory( f798_arg1.fileshareCategory )
	MediaManagerMarkDirty( f798_arg2 )
end

function MediaManagerClearDisplay( f799_arg0, f799_arg1, f799_arg2 )
	if CoD.FileshareUtility.IsCategoryFilm( f799_arg2, f799_arg1 ) or CoD.FileshareUtility.IsCategoryClip( f799_arg2, f799_arg1 ) or CoD.FileshareUtility.IsCategoryScreenshot( f799_arg2, f799_arg1 ) or CoD.FileshareUtility.IsCategoryCustomGames( f799_arg2, f799_arg1 ) then
		return 
	else
		CoD.CraftUtility.Fileshare.ClearDisplay( f799_arg2 )
	end
end

function MediaManagerPaintjobFocusChanged( f800_arg0, f800_arg1, f800_arg2 )
	local f800_local0 = f800_arg1:getModel( f800_arg2, "paintjobSlotAndIndex" )
	local f800_local1 = Engine.GetModelValue( f800_local0 )
	Engine.SetModelValue( f800_local0, f800_local1 )
	CoD.SetCustomization( f800_arg2, Engine.GetModelValue( f800_arg1:getModel( f800_arg2, "weaponIndex" ) ), "weapon_index" )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f800_arg2 ), "MediaManagerSelectedPaintjob" ), "paintjobSlotAndIndex" ), f800_local1 )
	MediaManagerSetSlotModel( f800_arg2, false, Engine.GetModelValue( f800_arg1:getModel( f800_arg2, "createTime" ) ), Engine.GetModelValue( f800_arg1:getModel( f800_arg2, "authorName" ) ) )
end

function MediaManagerVariantFocusChanged( f801_arg0, f801_arg1, f801_arg2 )
	CoD.SetCustomization( f801_arg2, Engine.GetModelValue( f801_arg1:getModel( f801_arg2, "weaponIndex" ) ), "weapon_index" )
	MediaManagerSetSlotModel( f801_arg2, false, Engine.GetModelValue( f801_arg1:getModel( f801_arg2, "createTime" ) ), Engine.GetModelValue( f801_arg1:getModel( f801_arg2, "authorName" ) ) )
end

function MediaManagerEmblemFocusChanged( f802_arg0, f802_arg1, f802_arg2 )
	CoD.SetCustomization( f802_arg2, Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM, "type" )
	CoD.perController[f802_arg2].selectedEmblemModel = f802_arg1:getModel()
	Engine.SetupEmblemData( f802_arg2, Engine.GetModelValue( f802_arg1:getModel( f802_arg2, "emblemIndex" ) ), CoD.perController[f802_arg2].selectedEmblemTabStorageType )
	MediaManagerSetSlotModel( f802_arg2, false, Engine.GetModelValue( f802_arg1:getModel( f802_arg2, "createTime" ) ), Engine.GetModelValue( f802_arg1:getModel( f802_arg2, "authorName" ) ) )
end

function MediaManagerCustomGameFocusChanged( f803_arg0, f803_arg1, f803_arg2 )
	SetSelectedCustomGame( f803_arg1, f803_arg2 )
	MediaManagerSetSlotModel( f803_arg2, false, "", "" )
end

function MediaManagerTheaterFileFocusChanged( f804_arg0, f804_arg1, f804_arg2 )
	MediaManagerSetSlotModel( f804_arg2, false, "", "" )
	FileshareSetSelectedItem( f804_arg0, f804_arg1, f804_arg2, "" )
end

function MediaManagerBuyMoreSlotOnFocus( f805_arg0, f805_arg1, f805_arg2 )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false ), "isBuyMoreSlot", false ), true )
end

function OpenMediaManager( f806_arg0, f806_arg1, f806_arg2, f806_arg3, f806_arg4 )
	CoD.FileshareUtility.SetPreviousCategory( CoD.FileshareUtility.GetCurrentCategory() )
	CoD.FileshareUtility.SetCurrentCategory( f806_arg3 )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false ), "previousWeaponIndex", false ), CoD.GetCustomization( f806_arg2, "weapon_index" ) )
	MediaManagerClearDisplay( f806_arg0, f806_arg1, f806_arg2 )
	OpenOverlay( f806_arg0, "MediaManager", f806_arg2 )
end

function GoBackAndOpenMediaManagerOnParent( f807_arg0, f807_arg1, f807_arg2, f807_arg3, f807_arg4 )
	CoD.FileshareUtility.SetPreviousCategory( CoD.FileshareUtility.GetCurrentCategory() )
	if f807_arg3 ~= nil and f807_arg3 ~= "" then
		CoD.FileshareUtility.SetCurrentCategory( f807_arg3 )
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false ), "previousWeaponIndex", false ), CoD.GetCustomization( f807_arg2, "weapon_index" ) )
	MediaManagerClearDisplay( f807_arg0, f807_arg1, f807_arg2 )
	GoBackAndOpenOverlayOnParent( f807_arg0, "MediaManager", f807_arg2 )
end

function MediaManagerClose( f808_arg0, f808_arg1, f808_arg2 )
	if CoD.perController[f808_arg2].wasGunsmithVariantModelNil then
		CoD.perController[f808_arg2].gunsmithVariantModel = nil
		CoD.perController[f808_arg2].wasGunsmithVariantModelNil = nil
	end
	if CoD.perController[f808_arg2].wasSelectedPaintjobModelNil then
		CoD.perController[f808_arg2].selectedpaintjobModel = nil
		CoD.perController[f808_arg2].wasSelectedPaintjobModelNil = nil
	end
	local f808_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "MediaManager", false ), "previousWeaponIndex", false )
	CoD.FileshareUtility.SetCurrentCategory( CoD.FileshareUtility.GetPreviousCategory() )
	CoD.FileshareUtility.SetDirty()
	CoD.SetCustomization( f808_arg2, Engine.GetModelValue( f808_local0 ), "weapon_index" )
	CoD.CraftUtility.Gunsmith.DisplayBaseWeapon( f808_arg0, f808_arg1, f808_arg2 )
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetModelForController( f808_arg2 ), "Gunsmith.VariantList.ForceUpdate" ) )
end

function MediaManagerReloadWeaponModelIfNeeded( f809_arg0 )
	local f809_local0 = CoD.perController[f809_arg0].gunsmithVariantModel
	if f809_local0 then
		Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f809_arg0 ), "Gunsmith.Mode" ), Enum.GunsmithMode.GUNSMITHMODE_VARIANTS )
		CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f809_arg0, f809_local0 )
	end
	local f809_local1 = CoD.perController[f809_arg0].selectedpaintjobModel
	if f809_local1 then
		Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f809_arg0 ), "Paintshop.Mode" ), Enum.PaintshopMode.PAINTSHOPMODE_PAINTJOBS )
		CoD.perController[f809_arg0].viewIndex = 1
		local f809_local2 = CoD.Paintshop.View[CoD.perController[f809_arg0].viewIndex].customization_type
		CoD.CraftUtility.Gunsmith.DisplayWeaponWithPaintjob( f809_arg0, Engine.GetModelValue( Engine.GetModel( f809_local1, "paintjobIndex" ) ), Engine.GetModelValue( Engine.GetModel( f809_local1, "paintjobSlot" ) ) )
	end
end

function MediaManagerFetchEmblemsData( f810_arg0 )
	CoD.CraftUtility.Emblems.CachedEmblems = {}
	CoD.CraftUtility.Emblems.CachedEmblemIndexMapping = {}
	CoD.perController[f810_arg0].selectedEmblemTabStorageType = Enum.StorageFileType.STORAGE_EMBLEMS
	local f810_local0 = CoD.CraftUtility.Emblems.ParseDDL( f810_arg0, CoD.perController[f810_arg0].selectedEmblemTabStorageType )
end

function MediaManagerUpdateLocalData( f811_arg0 )
	MediaManagerFetchPaintjobsData( f811_arg0 )
	MediaManagerFetchVariantsData( f811_arg0 )
	MediaManagerFetchEmblemsData( f811_arg0 )
end

function PaintjobSelector_GainFocus( f812_arg0, f812_arg1, f812_arg2 )
	CoD.perController[f812_arg2].selectedpaintjobModel = f812_arg1:getModel()
	CoD.perController[f812_arg2].viewIndex = 1
	local f812_local0 = CoD.Paintshop.View[CoD.perController[f812_arg2].viewIndex].customization_type
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithPaintjob( f812_arg2, Engine.GetModelValue( f812_arg1:getModel( f812_arg2, "paintjobIndex" ) ), Engine.GetModelValue( f812_arg1:getModel( f812_arg2, "paintjobSlot" ) ) )
end

function PaintjobSelector_ChoosePaintjob( f813_arg0, f813_arg1, f813_arg2 )
	local f813_local0 = f813_arg1:getModel( f813_arg2, "paintjobSlot" )
	local f813_local1 = f813_arg1:getModel( f813_arg2, "paintjobIndex" )
	CoD.perController[f813_arg2].selectedpaintjobModel = f813_arg1:getModel()
	if f813_local0 and f813_local1 then
		Engine.SetupPaintjobData( f813_arg2, Engine.GetModelValue( f813_local0 ), Engine.GetModelValue( f813_local1 ) )
	end
	CoD.perController[f813_arg2].viewIndex = 1
	local f813_local2 = CoD.Paintshop.View[CoD.perController[f813_arg2].viewIndex].view_name
	local f813_local3 = CoD.Paintshop.View[CoD.perController[f813_arg2].viewIndex].customization_type
	local f813_local4 = CoD.Paintshop.View[CoD.perController[f813_arg2].viewIndex].view_string_ref
	CoD.SetCustomization( f813_arg2, f813_local3, "type" )
	CoD.SetCustomization( f813_arg2, f813_local4, "view_string_ref" )
	Engine.SetupEmblemEditBuffer( f813_arg2, f813_local3, CoD.GetCustomization( f813_arg2, "weapon_index" ) )
	CoD.CraftUtility.DisplayWeaponInPaintshop( f813_arg2, f813_local2 )
	Engine.SendMenuResponse( f813_arg2, "paintshop_light", "far" )
	CoD.SetEditorProperties( f813_arg2, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE, "editorMode" )
end

function FileshareOpenPreviousPublishMenu( f814_arg0, f814_arg1, f814_arg2, f814_arg3 )
	local f814_local0 = CoD.FileshareUtility.GetCurrentCategory()
	if f814_local0 == "paintjob" then
		CoD.CraftUtility.OpenPublishPromptPaintjob( f814_arg0, f814_arg1, f814_arg2, nil, f814_arg3 )
	elseif f814_local0 == "emblem" then
		CoD.CraftUtility.OpenPublishPromptEmblem( f814_arg0, f814_arg1, f814_arg2, nil, f814_arg3 )
	elseif f814_local0 == "variant" then
		CoD.CraftUtility.OpenPublishPromptGunsmith( f814_arg0, f814_arg1, f814_arg2, nil, f814_arg3 )
	end
end

function FileshareOpenFullscreenView( f815_arg0, f815_arg1, f815_arg2, f815_arg3 )
	if f815_arg1.gridInfoTable then
		CoD.FileshareUtility.ReportView( f815_arg2, f815_arg1.gridInfoTable.zeroBasedIndex )
	end
	if FileshareIsCategory( f815_arg2, "screenshot_private" ) or FileshareIsCategory( f815_arg2, "screenshot" ) or IsFileshareCategoryScreenshot( f815_arg0, f815_arg1, f815_arg2 ) then
		CoD.Menu.ModelToUse = f815_arg1:getModel()
		OpenOverlay( f815_arg0, "Fileshare_ScreenshotDetailsView", f815_arg2 )
		CoD.Menu.ModelToUse = nil
	else
		OpenOverlay( f815_arg0, "Fileshare_DetailsView", f815_arg2 )
	end
end

function FilesharePublish( f816_arg0, f816_arg1, f816_arg2 )
	CoD.FileshareUtility.Publish( f816_arg0, f816_arg2 )
end

function FilesharePrivateUpload( f817_arg0, f817_arg1, f817_arg2 )
	CoD.FileshareUtility.PrivateUpload( f817_arg2 )
end

function FileshareDownload( f818_arg0, f818_arg1, f818_arg2 )
	CoD.FileshareUtility.Download( f818_arg2 )
end

function SteamWorkshopPublish( f819_arg0, f819_arg1, f819_arg2 )
	CoD.SteamWorkshopUtility.Publish( f819_arg0, f819_arg1, f819_arg2 )
end

function SteamWorkshopOpenAgreement( f820_arg0, f820_arg1, f820_arg2 )
	CoD.SteamWorkshopUtility.OpenAgreement( f820_arg0, f820_arg1, f820_arg2 )
end

function SteamWorkshopOpenFAQ( f821_arg0, f821_arg1, f821_arg2 )
	CoD.SteamWorkshopUtility.OpenFAQ( f821_arg0, f821_arg1, f821_arg2 )
end

function SteamWorkshopOpenItem( f822_arg0, f822_arg1, f822_arg2 )
	CoD.SteamWorkshopUtility.OpenItemOnSteam( f822_arg0, f822_arg1, f822_arg2 )
end

function SteamWorkshopViewWorkshop( f823_arg0, f823_arg1, f823_arg2 )
	CoD.SteamWorkshopUtility.ViewWorkshop( f823_arg0, f823_arg1, f823_arg2 )
end

function PaintjobSelector_ClearPaintjob( f824_arg0, f824_arg1, f824_arg2, f824_arg3 )
	local f824_local0 = CoD.perController[f824_arg2].selectedpaintjobModel
	CoD.CraftUtility.Paintjobs.ClearPaintjob( f824_arg2, Engine.GetModelValue( Engine.GetModel( f824_local0, "paintjobSlot" ) ), Engine.GetModelValue( Engine.GetModel( f824_local0, "paintjobIndex" ) ) )
	CoD.CraftUtility.Paintjobs.ParseDDL( f824_arg2, Enum.StorageFileType.STORAGE_PAINTJOBS )
	if IsMediaManager() == true then
		GoBackMultiple( f824_arg0, f824_arg2, 1 )
		MediaManagerMarkDirty( f824_arg2 )
	else
		local f824_local1 = GoBackMultiple( f824_arg0, f824_arg2, 2 )
		if f824_local1.paintjobSelector ~= nil then
			f824_local1.paintjobSelector.paintjobsList:updateDataSource( true )
			f824_local1.paintjobSelector.paintjobsList:setActiveItem( f824_local1.paintjobSelector.paintjobsList:getFirstSelectableItem() )
		end
	end
	if Engine.GetModel( Engine.GetModelForController( f824_arg2 ), "Paintshop.UpdateDataSource" ) ~= nil then
		ForceNotifyModel( f824_arg2, "Paintshop.UpdateDataSource" )
	end
end

function PaintjobSelector_CopyPaintjob( f825_arg0, f825_arg1, f825_arg2, f825_arg3, f825_arg4 )
	local f825_local0, f825_local1 = CoD.CraftUtility.Paintjobs.Copy( f825_arg2, f825_arg4:getModel() )
	if f825_local0 and f825_local1 then
		CoD.CraftUtility.Paintjobs.ParseDDL( f825_arg2, Enum.StorageFileType.STORAGE_PAINTJOBS )
		CoD.CraftUtility.InvalidateWCItemRender( f825_local0, f825_local1 )
		local f825_local2 = GoBack( f825_arg4, f825_arg2 )
		local f825_local3 = f825_local2.paintjobSelector.paintjobsList
		f825_local3:updateDataSource( true )
		local f825_local4 = f825_local3:findItem( {
			paintjobSlot = f825_local0,
			paintjobIndex = f825_local1
		} )
		if f825_local4 then
			f825_local3:setActiveItem( f825_local4 )
		end
		ForceNotifyModel( f825_arg2, "Paintshop.UpdateDataSource" )
	end
end

function PaintjobSelector_RenamePaintjob( f826_arg0, f826_arg1, f826_arg2 )
	local f826_local0 = f826_arg0:getModel()
	CoD.CraftUtility.Paintjobs.RenamePaintjob( f826_arg2, Engine.GetModelValue( Engine.GetModel( f826_local0, "paintjobSlot" ) ), Engine.GetModelValue( Engine.GetModel( f826_local0, "paintjobIndex" ) ), Engine.GetModelValue( Engine.GetModel( f826_local0, "paintjobName" ) ) )
end

function PaintjobSelector_HandleRenameKeyboardComplete( f827_arg0, f827_arg1, f827_arg2, f827_arg3 )
	local f827_local0 = f827_arg0:getModel()
	local f827_local1 = nil
	if not f827_local0 then
		return 
	elseif f827_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_PAINTJOB then
		f827_local1 = Engine.GetModel( f827_local0, "paintjobName" )
	end
	if f827_local1 then
		Engine.SetModelValue( f827_local1, f827_arg3.input )
	end
end

function PaintjobEditor_OpenSavePopup( f828_arg0, f828_arg1, f828_arg2, f828_arg3 )
	CoD.OverlayUtility.CreateOverlay( f828_arg2, f828_arg0, "PaintjobSave", CoD.perController[f828_arg2].selectedpaintjobModel )
end

function PaintjobEditor_ToggleGrid( f829_arg0, f829_arg1, f829_arg2, f829_arg3 )
	local f829_local0 = CoD.CraftUtility.GetGridTypeName( f829_arg2 )
	local f829_local1 = 0
	if not IsGridOn( f829_arg2, f829_local0 ) then
		f829_local1 = CoD.CraftUtility.GetGridSize( f829_arg2 )
	end
	SetProfileVar( f829_arg2, f829_local0, f829_local1 )
	Engine.ExecNow( f829_arg2, "emblemSetGridSize " .. CoD.GetCustomization( f829_arg2, "type" ) .. " " .. f829_local1 )
	EmblemEditor_BeginEdit( f829_arg0, f829_arg1, f829_arg2 )
	GoBack( f829_arg0, f829_arg2 )
end

function PaintjobEditor_RemoveGrid( f830_arg0 )
	Engine.ExecNow( f830_arg0, "emblemSetGridSize " .. CoD.GetCustomization( f830_arg0, "type" ) .. " 0" )
end

function PaintjobEditor_RestoreGridState( f831_arg0 )
	Engine.ExecNow( f831_arg0, "emblemSetGridSize " .. CoD.GetCustomization( f831_arg0, "type" ) .. " " .. Engine.GetProfileVarInt( f831_arg0, CoD.CraftUtility.GetGridTypeName( f831_arg0 ) ) )
end

function PaintjobEditor_ChangeViewRightBumper( f832_arg0, f832_arg1, f832_arg2 )
	local f832_local0 = CoD.CraftUtility.Paintjobs.GetNextViewIndex( f832_arg2 )
	CoD.perController[f832_arg2].viewIndex = f832_local0
	local f832_local1 = CoD.Paintshop.View[f832_local0].view_name
	local f832_local2 = CoD.Paintshop.View[f832_local0].customization_type
	local f832_local3 = CoD.Paintshop.View[f832_local0].view_string_ref
	CoD.SetCustomization( f832_arg2, f832_local2, "type" )
	CoD.SetCustomization( f832_arg2, f832_local3, "view_string_ref" )
	Engine.SetupEmblemEditBuffer( f832_arg2, f832_local2, CoD.GetCustomization( f832_arg2, "weapon_index" ) )
	CoD.CraftUtility.DisplayWeaponInPaintshop( f832_arg2, f832_local1 )
	f832_arg0.layerCarousel:updateDataSource()
end

function PaintjobEditor_ChangeViewLeftBumper( f833_arg0, f833_arg1, f833_arg2 )
	local f833_local0 = CoD.CraftUtility.Paintjobs.GetPrevViewIndex( f833_arg2 )
	CoD.perController[f833_arg2].viewIndex = f833_local0
	local f833_local1 = CoD.Paintshop.View[f833_local0].view_name
	local f833_local2 = CoD.Paintshop.View[f833_local0].customization_type
	local f833_local3 = CoD.Paintshop.View[f833_local0].view_string_ref
	CoD.SetCustomization( f833_arg2, f833_local2, "type" )
	CoD.SetCustomization( f833_arg2, f833_local3, "view_string_ref" )
	Engine.SetupEmblemEditBuffer( f833_arg2, f833_local2, CoD.GetCustomization( f833_arg2, "weapon_index" ) )
	CoD.CraftUtility.DisplayWeaponInPaintshop( f833_arg2, f833_local1 )
	f833_arg0.layerCarousel:updateDataSource()
end

function PaintjobEditor_HandleKeyboardComplete( f834_arg0, f834_arg1, f834_arg2, f834_arg3 )
	local f834_local0 = CoD.perController[f834_arg2].selectedpaintjobModel
	local f834_local1 = nil
	if not f834_local0 then
		return 
	elseif f834_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_PAINTJOB then
		f834_local1 = Engine.GetModel( f834_local0, "paintjobTextEntry" )
		if f834_local1 then
			Engine.SetModelValue( f834_local1, f834_arg3.input )
		end
		local f834_local2 = f834_arg0:getModel( f834_arg2, "inputText" )
		if f834_local2 then
			Engine.SetModelValue( f834_local2, f834_arg3.input )
		end
	end
end

function PaintjobEditor_SavePaintjob( f835_arg0, f835_arg1, f835_arg2, f835_arg3 )
	local f835_local0 = Engine.GetModelValue( Engine.GetModel( f835_arg3, "paintjobTextEntry" ) )
	local f835_local1 = Engine.GetModel( f835_arg3, "paintjobName" )
	local f835_local2 = MediaManagerGetQuotaForCategory( f835_arg2, "paintjob" )
	Engine.SetModelValue( f835_local1, f835_local0 )
	CoD.CraftUtility.Paintjobs.UploadPaintjob( f835_arg2, f835_arg3 )
	CoD.CraftUtility.Paintjobs.ParseDDL( f835_arg2, Enum.StorageFileType.STORAGE_PAINTJOBS )
	CoD.CraftUtility.Paintjobs.InvalidateRender( f835_arg2, f835_arg3 )
	PaintJobEditor_RecordComScoreEvent( f835_arg0, f835_arg2, f835_arg3, "save", f835_local2.categorySlotsUsed, f835_local2.categoryQuota )
	local f835_local3 = GoBack( f835_arg0, f835_arg2 )
	EmblemEditor_HandleBackInBrowseMode( f835_local3, f835_arg1, f835_arg2 )
	ClearSavedState( f835_local3, f835_arg2 )
end

function PaintjobEditor_DiscardChanges( f836_arg0, f836_arg1, f836_arg2, f836_arg3 )
	local f836_local0 = GoBack( f836_arg0, f836_arg2 )
	PaintJobEditor_RecordComScoreEvent( f836_arg0, f836_arg2, f836_arg3, "discard" )
	EmblemEditor_HandleBackInBrowseMode( f836_local0, f836_arg1, f836_arg2 )
	ClearSavedState( f836_local0, f836_arg2 )
end

function PaintjobEditor_SaveChangesBack( f837_arg0, f837_arg1, f837_arg2, f837_arg3 )
	if Engine.GetModelValue( Engine.GetModel( f837_arg3, "weaponIndex" ) ) == CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX then
		Engine.SetModelValue( Engine.GetModel( f837_arg3, "paintjobTextEntry" ), "Paintjob" )
	end
end

function HandleSocialMenuBack( f838_arg0, f838_arg1, f838_arg2 )
	if IsLobbyHost() and IsGlobalModelValueTrue( f838_arg1, f838_arg2, "SocialMainMenu.managePartySubListSelected" ) then
		return 
	elseif Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "socialRoot.tab" ) ) == "groups" then
		local f838_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f838_arg2 ), "groups.frameType" ) )
		if f838_local0 == "invites" or f838_local0 == "members" then
			GroupsSocialChangeTabFrameWidget( f838_arg0, f838_arg1, f838_arg2, "main" )
			return 
		end
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "socialRoot.tab" ), "friends" )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f838_arg2 ), "groups.highlightGroupsTabInSocial" ), false )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f838_arg2 ), "groups.frameType" ), "" )
	GoBack( f838_arg0, f838_arg2 )
	ClearSavedState( f838_arg0, f838_arg2 )
end

function SetSocialTab( f839_arg0, f839_arg1, f839_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" ), "tab" ), f839_arg1.tabId )
end

function FetchOnlineFriendsData( f840_arg0, f840_arg1, f840_arg2 )
	if "friends" == f840_arg1.tabId then
		Engine.UpdateFriends( f840_arg2, Enum.PresenceFilter.PRESENCE_FILTER_ONLINE_AND_IN_TITLE )
	end
end

function OpenPlatformProfile( f841_arg0, f841_arg1, f841_arg2, f841_arg3, f841_arg4 )
	local f841_local0 = Engine.GetModelForController( f841_arg2 )
	Engine.ShowPlatformProfile( f841_arg2, Engine.GetModelValue( Engine.CreateModel( f841_local0, "Social.selectedFriendXUID" ) ), Engine.GetModelValue( Engine.CreateModel( f841_local0, "Social.selectedFriendGamertag" ) ) )
end

function OpenPlatformFriendRequest( f842_arg0, f842_arg1, f842_arg2, f842_arg3, f842_arg4 )
	local f842_local0 = Engine.GetModelForController( f842_arg2 )
	Engine.ShowPlatformFriendRequest( f842_arg2, Engine.GetModelValue( Engine.CreateModel( f842_local0, "Social.selectedFriendXUID" ) ), Engine.GetModelValue( Engine.CreateModel( f842_local0, "Social.selectedFriendGamertag" ) ) )
end

function SocialJoin( f843_arg0, f843_arg1, f843_arg2, f843_arg3, f843_arg4 )
	CoD.CACUtility.ValidateMPLootWeapons( f843_arg2 )
	if Engine.IsInGame() then
		if not Engine.LobbyIsPlayerInLobby( Enum.LobbyType.LOBBY_TYPE_GAME, f843_arg3.xuid ) then
			f843_arg3.migrating = not CoDShared.QuitGame( f843_arg2 )
			Engine.LobbyVM_CallFunc( "InGameJoin", f843_arg3 )
		end
	else
		Engine.LobbyVM_CallFunc( "Join", f843_arg3 )
	end
	GoBackToMenu( GoBack( f843_arg0, f843_arg2 ), f843_arg2, "Lobby" )
end

function CacheSocialOnlinePlayersListModels( f844_arg0, f844_arg1, f844_arg2 )
	local f844_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "socialRoot" )
	if Engine.GetModelValue( Engine.CreateModel( f844_local0, "tab" ) ) == "party" then
		local f844_local1 = Engine.GetUserPartyInfo( f844_arg2 )
		if f844_local1 ~= nil then
			local f844_local2 = Engine.CreateModel( f844_local0, "party" )
			Engine.SetModelValue( Engine.CreateModel( f844_local2, "available" ), f844_local1.available )
			if #f844_local1.members then
				for f844_local3 = 1, #f844_local1.members, 1 do
					Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( f844_local2, "pm_" .. f844_local3 ), "gamertag" ), f844_local1.members[f844_local3].gamertag )
				end
			end
		end
		return 
	end
	local f844_local1, f844_local2, f844_local6, f844_local3, f844_local4, f844_local5, f844_local7 = nil
	if f844_arg0.cacheRootModel ~= nil then
		f844_local1 = f844_arg0.cacheXuid
		f844_local2 = f844_arg0.cacheParty
		f844_local6 = f844_arg0.cachePartyUpdate
		f844_local7 = f844_arg0.cachePartyGamertags
		f844_local3 = f844_arg0.cachePartyTotal
		f844_local4 = f844_arg0.cachePartyAvailable
		f844_local5 = f844_arg0.cachePartyLeader
	else
		local f844_local8 = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" )
		f844_local1 = Engine.CreateModel( Engine.CreateModel( f844_local8, "cache" ), "xuid" )
		f844_local2 = Engine.CreateModel( f844_local8, "party" )
		f844_local6 = Engine.CreateModel( f844_local2, "update" )
		f844_local3 = Engine.CreateModel( f844_local2, "total" )
		f844_local4 = Engine.CreateModel( f844_local2, "available" )
		f844_local5 = Engine.CreateModel( f844_local2, "leader" )
		Engine.SetModelValue( f844_local1, Engine.StringToXUIDDecimal( "0" ) )
		f844_local7 = {}
		for f844_local9 = 1, 18, 1 do
			f844_local7[f844_local9] = Engine.CreateModel( Engine.CreateModel( f844_local2, "pm_" .. f844_local9 ), "gamertag" )
			Engine.SetModelValue( f844_local7[f844_local9], "" )
		end
	end
	Engine.SetModelValue( f844_local1, f844_arg1.xuid )
	Engine.SetModelValue( f844_local3, f844_arg1.party.total )
	Engine.SetModelValue( f844_local4, f844_arg1.party.available )
	Engine.SetModelValue( f844_local5, f844_arg1.party.leader )
	if f844_arg1.party ~= nil and f844_arg1.party.members ~= nil then
		for f844_local8 = 1, #f844_local7, 1 do
			local f844_local11 = f844_local7[f844_local8]
			if f844_arg1.party.members[f844_local8] ~= nil then
				Engine.SetModelValue( f844_local11, f844_arg1.party.members[f844_local8].gamertag )
			end
		end
		local f844_local8 = Engine.GetModelValue( f844_local6 )
		if f844_local8 < 100000 then
			f844_local8 = f844_local8 + 1
		else
			f844_local8 = 0
		end
		Engine.SetModelValue( f844_local6, f844_local8 )
	end
end

function CacheLobbyMemberPlayerInfoDetails( f845_arg0, f845_arg1, f845_arg2 )
	local f845_local0 = Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" )
	local f845_local1 = Engine.GetModelValue( Engine.GetModel( f845_arg1:getModel(), "xuid" ) )
	local f845_local2 = Engine.CreateModel( f845_local0, "party" )
	local f845_local3 = Engine.GetLobbyMemberPartyInfo( f845_arg2, f845_local1 )
	if f845_local3 ~= nil then
		Engine.SetModelValue( Engine.CreateModel( f845_local2, "available" ), f845_local3.available )
		if #f845_local3.members then
			for f845_local4 = 1, #f845_local3.members, 1 do
				Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( f845_local2, "pm_" .. f845_local4 ), "gamertag" ), f845_local3.members[f845_local4].gamertag )
			end
		end
	end
end

function ShowcaseOpenPlayerDetails( f846_arg0, f846_arg1, f846_arg2 )
	ShowcaseSetSelectedFriendXUID( f846_arg0, f846_arg1, f846_arg2, true )
	GoBackAndOpenOverlayOnParent( f846_arg0, "Social_PlayerDetailsPopup", f846_arg2 )
end

function SetSelectedFriendXUID( f847_arg0, f847_arg1, f847_arg2 )
	local f847_local0 = nil
	if f847_arg1 ~= nil then
		local f847_local1 = f847_arg1:getModel( f847_arg2, "xuid" )
		if f847_local1 ~= nil then
			f847_local0 = Engine.GetModelValue( f847_local1 )
			local f847_local2 = Engine.GetModelForController( f847_arg2 )
			Engine.SetModelValue( Engine.CreateModel( f847_local2, "Social.selectedFriendXUID" ), f847_local0 )
			local f847_local3 = Engine.GetModelValue( f847_arg1:getModel( f847_arg2, "gamertag" ) )
			Engine.SetModelValue( Engine.CreateModel( f847_local2, "Social.selectedFriendGamertag" ), f847_local3 )
			if Engine.UInt64ToString( f847_local0 ) == "fefefefefefefefe" then
				local f847_local4 = Engine.CreateModel( Engine.GetModelForController( f847_arg2 ), "socialPlayerInfo.identityBadge" )
				Engine.SetModelValue( Engine.CreateModel( f847_local4, "gamertag" ), f847_local3 )
				Engine.SetModelValue( Engine.CreateModel( f847_local4, "clantag" ), "" )
			end
			local f847_local4 = f847_arg1:getModel( f847_arg2, "activity" )
			if f847_local4 ~= nil then
				Engine.SetModelValue( Engine.CreateModel( f847_local2, "Social.selectedFriendInTitle" ), Engine.GetModelValue( f847_local4 ) > Enum.PresenceActivity.PRESENCE_ACTIVITY_ONLINE_NOT_IN_TITLE )
			end
			Engine.SetModelValue( Engine.CreateModel( f847_local2, "Social.hideSelectedFriendShowcase" ), false )
		end
	end
end

function SocialToggleSorting( f848_arg0, f848_arg1, f848_arg2 )
	local f848_local0 = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "socialRoot" ), "sort" )
	local f848_local1 = Engine.GetModelValue( f848_local0 )
	if f848_local1 == Enum.PresenceSorting.PRESENCE_SORTING_ONLINE_MOST_RECENT then
		Engine.SetModelValue( f848_local0, Enum.PresenceSorting.PRESENCE_SORTING_ALPHABETICAL )
		Engine.SortFriends( f848_arg2, Enum.PresenceSorting.PRESENCE_SORTING_ALPHABETICAL )
	elseif f848_local1 == Enum.PresenceSorting.PRESENCE_SORTING_ALPHABETICAL then
		Engine.SetModelValue( f848_local0, Enum.PresenceSorting.PRESENCE_SORTING_ONLINE_MOST_RECENT )
		Engine.SortFriends( f848_arg2, Enum.PresenceSorting.PRESENCE_SORTING_ONLINE_MOST_RECENT )
	end
end

function SocialEnablePresenceCacheAutoupdate( f849_arg0, f849_arg1 )
	if Engine.EnablePresenceCacheAutoupdate ~= nil then
		Engine.EnablePresenceCacheAutoupdate( f849_arg0, f849_arg1 )
	end
end

function UpdateFriends( f850_arg0, f850_arg1, f850_arg2 )
	local f850_local0 = f850_arg0
	Engine.UpdateFriends( f850_arg2, Enum.PresenceFilter.PRESENCE_FILTER_ONLINE_AND_IN_TITLE )
end

function SetFriendsTabName( f851_arg0, f851_arg1, f851_arg2 )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f851_arg2 ), "friends" ), "tab" ), f851_arg1.tabId )
end

function UpdateFriendsData( f852_arg0, f852_arg1, f852_arg2 )
	if "friends" == f852_arg1.tabId then
		Engine.UpdateFriends( f852_arg2, 2 )
	elseif f852_arg1.tabId == "inbox" then
		Engine.UpdateMessages( f852_arg2, 1 )
	end
end

function FriendsInboxOnMessageClick( f853_arg0, f853_arg1, f853_arg2 )
	if Engine.GetModelValue( f853_arg1:getModel( f853_arg2, "xuid" ) ) ~= nil then
		Engine.ReadMessages( f853_arg2, 0 )
	end
end

function SetPrimaryGroup( f854_arg0, f854_arg1, f854_arg2 )
	local f854_local0 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f854_arg2].selectedGroup, "groupId" ) )
	local f854_local1 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f854_arg2].selectedGroup, "name" ) )
	Engine.SetPrimaryGroup( f854_arg2, f854_local0 )
	Engine.SetPrimaryGroupName( f854_arg2, f854_local1 )
	OpenGenericSmallPopup( f854_arg0:getParentMenu(), f854_arg2, "GROUPS_NOTICE_CAPS", "GROUPS_PRIMARY_GROUP_SET", nil, "MENU_OK", nil, nil )
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetModelForController( f854_arg2 ), "groups.groupCount_self" ) )
	GoBack( f854_arg0, f854_arg2 )
end

function GroupInvitesGoBack( f855_arg0, f855_arg1, f855_arg2 )
	local f855_local0 = function ( f856_arg0, f856_arg1, f856_arg2 )
		Engine.ClearLastGroupSearchResults( f856_arg2 )
		GoBack( f856_arg0, f856_arg2 )
	end
	
	if Engine.FetchingGroupPublicProfiles() then
		OpenGroupsNotifyPopup( f855_arg0, f855_arg1, f855_arg2, true, "fetch_profiles_task_complete", f855_local0, true, f855_local0 )
	else
		f855_local0( f855_arg0, f855_arg1, f855_arg2 )
	end
end

function GetProcessingGroupTaskModel( f857_arg0 )
	return Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f857_arg0 ), "groups" ), "processingTask" )
end

function GetCloseAutomaticallyModelForGroupsNotifyPoup( f858_arg0 )
	return Engine.GetModel( Engine.GetModelForController( f858_arg0 ), "groups.closeAutomaticallyAfterEvent" )
end

function ProcessGroupApplication( f859_arg0, f859_arg1, f859_arg2 )
	local f859_local0 = "GROUPS_JOIN_REQUEST_CAPS"
	local f859_local1 = "GROUPS_ACCEPT_JOIN_REQUEST"
	local f859_local2 = f859_arg0:getParentMenu()
	f859_local2:OpenModalDialog( f859_arg0, f859_arg2, f859_local0, f859_local1, {
		"MENU_ACCEPT",
		"GROUPS_REJECT_JOIN_REQUEST",
		"MENU_CANCEL"
	}, function ( f860_arg0 )
		if f859_arg1:getModel() and f859_arg1:getModel( f859_arg2, "xuid" ) then
			local f860_local0 = Engine.GetModelValue( f859_arg1:getModel( f859_arg2, "xuid" ) )
			if f860_arg0 == 0 then
				Engine.AcceptSelectedGroupApplication( f859_arg2, f860_local0 )
				OpenGroupsNotifyPopup( f859_arg0, f859_arg1, f859_arg2, true, "accept_application_task_complete" )
			elseif f860_arg0 == 1 then
				Engine.RejectSelectedGroupApplication( f859_arg2, f860_local0 )
				OpenGroupsNotifyPopup( f859_arg0, f859_arg1, f859_arg2, true, "reject_application_task_complete" )
			end
		end
		return true
	end )
end

function ProcessLeaveSelectedGroup( f861_arg0, f861_arg1, f861_arg2, f861_arg3 )
	local f861_local0 = "GROUPS_LEAVE_GROUP_CAPS"
	local f861_local1 = "GROUPS_LEAVE_SELECTED_GROUP_TITLE"
	local f861_local2 = false
	if IsGroupOwner( f861_arg2 ) then
		f861_local0 = "GROUPS_DELETE_GROUP_CAPS"
		f861_local1 = "GROUPS_DELETE_SELECTED_GROUP_TITLE"
		f861_local2 = true
	end
	local f861_local3 = f861_arg0:getParentMenu()
	f861_local3:OpenModalDialog( f861_arg0, f861_arg2, f861_local0, f861_local1, {
		"MPUI_NO",
		"MPUI_YES"
	}, function ( f862_arg0 )
		if f862_arg0 == 1 then
			if not f861_local2 and IsGroupOwner( f861_arg2 ) then
				ProcessLeaveSelectedGroup( f861_local3, f861_arg1, f861_arg2, f861_arg3 )
				return true
			end
			local f862_local0 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f861_arg2].selectedGroup, "groupId" ) )
			Engine.LeaveGroup( f861_arg2, f862_local0 )
			OpenGroupsNotifyPopup( f861_arg0, f861_arg1, f861_arg2, true, "leave_group_task_complete", function ( f863_arg0, f863_arg1, f863_arg2 )
				Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f863_arg2 ), "groups.highlightGroupsTabInSocial" ), true )
				LUI.CoDMetrics.LeaveGroupEvent( f863_arg2, f862_local0, f861_local2 )
				ClearSelectedGroup( f863_arg0, f863_arg1, f863_arg2 )
				if not f861_arg3 then
					GoBack( f861_local3, f863_arg2 )
				end
			end )
		end
		return true
	end )
end

function OpenGroupOptionsPopup( f864_arg0, f864_arg1, f864_arg2 )
	OpenPopup( f864_arg0, "GroupOptions", f864_arg2 )
end

function OpenGroupFriendsPopup( f865_arg0, f865_arg1, f865_arg2 )
	Engine.FilterFriendsInGroup( f865_arg2, Engine.GetModelValue( f865_arg1:getModel( f865_arg2, "groupId" ) ) )
	OpenPopup( f865_arg0, "GroupFriends", f865_arg2 )
end

function OpenGroupAdminOptionsPopupForGroupMember( f866_arg0, f866_arg1, f866_arg2 )
	OpenPopup( f866_arg0, "GroupAdminOptions", f866_arg2 )
end

function SetGroupInvitePlayerModels( f867_arg0, f867_arg1, f867_arg2 )
	if not f867_arg1:getModel() then
		return 
	end
	local f867_local0 = f867_arg1:getModel( f867_arg2, "sentByXuid" )
	if f867_local0 then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f867_arg2 ), "groups.groupInvites.sentByXuid" ), Engine.GetModelValue( f867_local0 ) )
	end
	local f867_local1 = f867_arg1:getModel( f867_arg2, "sentByGamertag" )
	if f867_local1 then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f867_arg2 ), "groups.groupInvites.sentByGamertag" ), Engine.GetModelValue( f867_local1 ) )
	end
end

function OpenGroupsInviteConfirmation( f868_arg0, f868_arg1, f868_arg2 )
	local f868_local0 = f868_arg0
	if not f868_local0.menuName then
		f868_local0 = f868_arg0:getParentMenu()
	end
	if f868_arg1:getModel() and f868_arg1:getModel( f868_arg2, "groupId" ) then
		local f868_local1 = Engine.GetModelValue( f868_arg1:getModel( f868_arg2, "groupId" ) )
		local f868_local2 = Engine.GetModelValue( f868_arg1:getModel( f868_arg2, "groupName" ) )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f868_arg2 ), "groups.selectedGroup.groupId" ), f868_local1 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f868_arg2 ), "groups.selectedGroup.groupName" ), f868_local2 )
		CoD.OverlayUtility.CreateOverlay( f868_arg2, f868_local0, "GroupsInviteConfirmation", f868_arg2 )
	end
end

function ShowReportGroupDialog( f869_arg0, f869_arg1, f869_arg2, f869_arg3, f869_arg4 )
	local f869_local0 = nil
	if CoD.perController[f869_arg2].selectedGroup then
		f869_local0 = Engine.GetModel( CoD.perController[f869_arg2].selectedGroup, "groupId" )
	else
		f869_local0 = Engine.GetModel( Engine.GetModelForController( f869_arg2 ), "groups.selectedGroup.groupId" )
	end
	CoD.OverlayUtility.CreateOverlay( f869_arg2, f869_arg4, "ReportGroup", f869_arg2, f869_arg1, {
		controller = f869_arg2,
		groupId = Engine.GetModelValue( f869_local0 )
	} )
end

function AcceptGroupInvite( f870_arg0, f870_arg1, f870_arg2 )
	local f870_local0 = Engine.GetModel( Engine.GetModelForController( f870_arg2 ), "groups.selectedGroup.groupId" )
	if f870_local0 then
		Engine.AcceptGroupInvite( f870_arg2, Engine.GetModelValue( f870_local0 ) )
		OpenGroupsNotifyPopup( f870_arg0, f870_arg1, f870_arg2, true, "groupsFetched", function ()
			CoD.OverlayUtility.ShowToast( "Invite", Engine.Localize( "GROUPS_INVITE_ACCEPTED" ), "", LuaEnums.INVITE_TOAST_POPUP_ACCEPTED_ICON )
			LUI.CoDMetrics.JoinGroupEvent( f870_arg2, Engine.GetModelValue( f870_local0 ), "invite" )
			GoBack( f870_arg0, f870_arg2 )
		end, true )
	end
end

function RejectGroupInvite( f872_arg0, f872_arg1, f872_arg2 )
	local f872_local0 = Engine.GetModel( Engine.GetModelForController( f872_arg2 ), "groups.selectedGroup.groupId" )
	if f872_local0 then
		Engine.ClearLastGroupSearchResults( f872_arg2 )
		Engine.RejectGroupInvite( f872_arg2, Engine.GetModelValue( f872_local0 ) )
		OpenGroupsNotifyPopup( f872_arg0, f872_arg1, f872_arg2, true, "refreshInvites", function ()
			CoD.OverlayUtility.ShowToast( "Invite", Engine.Localize( "GROUPS_INVITE_REJECTED" ), "", LuaEnums.INVITE_TOAST_POPUP_REJECTED_ICON )
			GoBack( f872_arg0, f872_arg2 )
		end, true )
	end
end

function FetchHighlightedGroupJoinApprovalType( f874_arg0, f874_arg1, f874_arg2, f874_arg3 )
	if not Engine.IsMainThread() then
		return 
	end
	local f874_local0 = Engine.GetModel( Engine.GetModelForController( f874_arg2 ), "groups.lastGroupIdForJoinApprovalFetch" )
	if not f874_local0 then
		f874_local0 = Engine.CreateModel( Engine.GetModelForController( f874_arg2 ), "groups.lastGroupIdForJoinApprovalFetch" )
		Engine.SetModelValue( f874_local0, Engine.StringToXUIDDecimal( "0" ) )
	end
	local f874_local1 = CoD.SafeGetModelValue( f874_arg1:getModel(), "groupId" )
	local f874_local2 = f874_arg3
	if CoD.SafeGetModelValue( f874_arg1:getModel(), "privacy" ) == Enum.GroupPrivacy.GROUP_PRIVACY_PRIVATE and f874_arg1:getModel( f874_arg2, "joinApprovalType" ) then
		Engine.SetModelValue( f874_arg1:getModel( f874_arg2, "joinApprovalType" ), Enum.GroupJoinApprovalType.GROUP_JOIN_APPROVAL_INVITE_ONLY )
		return 
	end
	local f874_local3 = f874_arg1.gridInfoTable.parentGrid
	if f874_local1 and Engine.GetModelValue( f874_local0 ) ~= f874_local1 then
		if Engine.FetchGroupJoinApprovalTypeByGroupId( f874_arg2, f874_local1, f874_local2 ) then
			Engine.SetModelValue( f874_local0, f874_local1 )
		end
		local f874_local4 = Engine.GetModel( Engine.GetModelForController( f874_arg2 ), "groups.eventUpdate" )
		local f874_local5 = Engine.GetModel( Engine.GetModelForController( f874_arg2 ), "groups.eventName" )
		if not f874_arg0.eventUpdateSubscription then
			f874_arg0.eventUpdateSubscription = f874_arg0:subscribeToModel( f874_local4, function ( model )
				if Engine.GetModelValue( f874_local5 ) == "fetch_join_approval_type_task_complete" then
					local f875_local0 = f874_local3.activeWidget
					if not f875_local0 then
						return 
					elseif f875_local0:getModel() then
						local f875_local1 = f875_local0:getModel( f874_arg2, "joinApprovalType" )
						local f875_local2 = f875_local0:getModel( f874_arg2, "groupId" )
						if f875_local2 and f875_local1 and not Engine.SetModelValue( f875_local0:getModel( f874_arg2, "joinApprovalType" ), Engine.GetGroupJoinApprovalTypeByGroupId( f874_arg2, Engine.GetModelValue( f875_local2 ), f874_local2 ) ) then
							Engine.ForceNotifyModelSubscriptions( f875_local0:getModel( f874_arg2, "joinApprovalType" ) )
						end
					end
				end
			end, false )
		end
		if not f874_arg0.progressSubscription then
			f874_arg0.progressSubscription = f874_arg0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f874_arg2 ), "groups.fetchGroupJoinApprovalTypeInProgress" ), function ( model )
				local f876_local0 = f874_local3.activeWidget
				if f876_local0 and f876_local0:getModel( f874_arg2, "joinApprovalType" ) then
					Engine.ForceNotifyModelSubscriptions( f876_local0:getModel( f874_arg2, "joinApprovalType" ) )
				end
			end, false )
		end
	end
end

function ProcessJoinSelectedGroup( f877_arg0, f877_arg1, f877_arg2 )
	if IsGroupMemberFromElement( f877_arg1, f877_arg2 ) then
		OpenGenericSmallPopup( f877_arg0:getParentMenu(), f877_arg2, "GROUPS_NOTICE_CAPS", "GROUPS_PART_OF_GROUP", nil, "MENU_OK", nil, nil )
		return 
	elseif f877_arg1:getModel() and f877_arg1:getModel( f877_arg2, "privacy" ) and Engine.GetModelValue( f877_arg1:getModel( f877_arg2, "privacy" ) ) == Enum.GroupPrivacy.GROUP_PRIVACY_PRIVATE then
		OpenGenericSmallPopup( f877_arg0:getParentMenu(), f877_arg2, "GROUPS_NOTICE_CAPS", "GROUPS_CANNOT_JOIN_PRIVATE_GROUP", nil, "MENU_OK", nil, nil )
		return 
	else
		local f877_local0 = f877_arg0:getParentMenu()
		Engine.FetchSelectedGroupJoinApprovalType( f877_arg2 )
		OpenGroupsNotifyPopup( f877_arg0, f877_arg1, f877_arg2, true, "fetch_join_approval_type_task_complete", function ()
			if Engine.GetSelectedGroupJoinApprovalType() == Enum.GroupJoinApprovalType.GROUP_JOIN_APPROVAL_OFF then
				f877_local0:OpenModalDialog( f877_arg0, f877_arg2, "GROUPS_JOIN_SELECTED_GROUP_TITLE", "", {
					"MPUI_YES",
					"MPUI_NO"
				}, function ( f879_arg0 )
					if f879_arg0 == 0 then
						local f879_local0 = Engine.GetModelValue( f877_arg1:getModel( f877_arg2, "groupBufferType" ) )
						local f879_local1 = Engine.GetModelValue( f877_arg1:getModel( f877_arg2, "groupId" ) )
						Engine.JoinGroup( f877_arg2, f879_local0, f879_local1 )
						LUI.CoDMetrics.JoinGroupEvent( f877_arg2, f879_local1, "search" )
						OpenGroupsNotifyPopup( f877_arg0, f877_arg1, f877_arg2, true, "join_group_task_complete" )
					end
					return true
				end )
			elseif Engine.GetSelectedGroupJoinApprovalType() == Enum.GroupJoinApprovalType.GROUP_JOIN_APPROVAL_ON then
				f877_local0:OpenModalDialog( f877_arg0, f877_arg2, "GROUPS_SEND_APPLICATION", "GROUPS_SEND_APPLICATION_DESC", {
					"MPUI_YES",
					"MPUI_NO"
				}, function ( f880_arg0 )
					if f880_arg0 == 0 then
						Engine.SendApplicationToSelectedGroup( f877_arg2 )
						local f880_local0 = CoD.SafeGetModelValue( f877_arg1:getModel(), "groupId" )
						if f880_local0 ~= nil then
							LUI.CoDMetrics.JoinGroupEvent( f877_arg2, f880_local0, "application" )
						end
						OpenGroupsNotifyPopup( f877_arg0, f877_arg1, f877_arg2, true, "send_application_task_complete" )
					end
					return true
				end )
			end
		end, true )
	end
end

function GroupInvitesOpenPlayerDetails( f881_arg0, f881_arg1, f881_arg2 )
	local f881_local0 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f881_arg2 ), "groups.groupInvites.sentByXuid" ) )
	local f881_local1 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f881_arg2 ), "groups.groupInvites.sentByGamertag" ) )
	local f881_local2 = Engine.GetModelForController( f881_arg2 )
	local f881_local3 = Engine.CreateModel( f881_local2, "Social.selectedFriendXUID" )
	local f881_local4 = Engine.CreateModel( f881_local2, "Social.selectedFriendGamertag" )
	Engine.SetModelValue( f881_local3, f881_local0 )
	Engine.SetModelValue( f881_local4, f881_local1 )
	GoBackAndOpenOverlayOnParent( f881_arg0, "Social_PlayerDetailsPopup", f881_arg2 )
end

function HandleGroupHeadquartersKeyboardComplete( f882_arg0, f882_arg1, f882_arg2, f882_arg3 )
	local f882_local0 = CoD.perController[f882_arg2].selectedGroup
	local f882_local1 = nil
	if not f882_local0 then
		return 
	elseif f882_arg1:getModel() and f882_arg1:getModel( f882_arg2, "currentText" ) then
		Engine.SetModelValue( f882_arg1:getModel( f882_arg2, "currentText" ), f882_arg3.input )
	end
	if f882_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_GROUP_NAME then
		Engine.SetSelectedGroupName( f882_arg2, f882_arg3.input )
		OpenGroupsNotifyPopup( f882_arg0, f882_arg1, f882_arg2, true, "update_group_name_task_complete", function ( f883_arg0, f883_arg1, f883_arg2 )
			if Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f883_arg2 ), "groups.notificationError" ) ) then
				OpenGroupsNotifyPopup( f883_arg0, f883_arg1, f883_arg2 )
			else
				Engine.SetModelValue( Engine.GetModel( f882_local0, "name" ), f882_arg3.input )
			end
		end, true )
	elseif f882_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_GROUP_MESSAGE then
		Engine.SetSelectedGroupMessage( f882_arg2, f882_arg3.input )
		Engine.SetModelValue( Engine.GetModel( f882_local0, "message" ), f882_arg3.input )
	elseif f882_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_GROUP_DESCRIPTION then
		Engine.SetSelectedGroupDescription( f882_arg2, f882_arg3.input )
		Engine.SetModelValue( Engine.GetModel( f882_local0, "description" ), f882_arg3.input )
	end
end

function HandleGroupsKeyboardComplete( f884_arg0, f884_arg1, f884_arg2, f884_arg3 )
	if f884_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_GROUP_SEARCH_NAME then
		Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f884_arg2 ), "groups.searchGroupsGroupName" ), f884_arg3.input )
	elseif f884_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_GROUP_PLAYER_SEARCH then
		Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f884_arg2 ), "groups.searchGroupsPlayerName" ), f884_arg3.input )
	end
end

function EditSelectedGroupName( f885_arg0, f885_arg1, f885_arg2 )
	ShowKeyboard( f885_arg0, f885_arg1, f885_arg2, "KEYBOARD_TYPE_GROUP_NAME" )
end

function EditSelectedGroupMessage( f886_arg0, f886_arg1, f886_arg2 )
	MarkGroupDataDirty( f886_arg2, "message", true )
	ShowKeyboard( f886_arg0, f886_arg1, f886_arg2, "KEYBOARD_TYPE_GROUP_MESSAGE" )
end

function EditSelectedGroupDescription( f887_arg0, f887_arg1, f887_arg2 )
	MarkGroupDataDirty( f887_arg2, "description", true )
	ShowKeyboard( f887_arg0, f887_arg1, f887_arg2, "KEYBOARD_TYPE_GROUP_DESCRIPTION" )
end

function OpenGroupHeadquarters( f888_arg0, f888_arg1, f888_arg2 )
	local f888_local0 = CoD.perController[f888_arg2].selectedGroup
	if not f888_local0 then
		return 
	end
	local f888_local1 = Engine.GetModelValue( Engine.GetModel( f888_local0, "groupId" ) )
	NavigateToMenu( f888_arg0:getParentMenu(), "GroupHeadquarters", true, f888_arg2 )
	local f888_local2, f888_local3, f888_local4, f888_local5, f888_local6, f888_local7 = Engine.GetGroupLeaderboardInfo()
	SetGroupLeaderboardInfo( f888_arg2, f888_local2, f888_local3, f888_local4, f888_local5, f888_local6, f888_local7, true )
	if IsGroupLeaderboardAvailable() then
		Engine.LoadLeaderboard( f888_local2, f888_local3 )
		Engine.RequestLeaderboardData( f888_arg2, Enum.LbFilter.LB_FILTER_GROUP_MEMBERS )
	end
	Engine.SetCurrentlyOpenedGroup( f888_local1 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f888_arg2 ), "groups.disableViewGroups" ), true )
end

function ClearCurrentlyOpenedGroup( f889_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f889_arg0 ), "groups.disableViewGroups" ), false )
	Engine.SetCurrentlyOpenedGroup( Engine.StringToXUIDDecimal( "0" ) )
end

function UpdateSelectedGroupInfo( f890_arg0, f890_arg1, f890_arg2 )
	if HasAdminPrivilege( f890_arg2, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_TYPE ) then
		if IsGroupDataDirty( f890_arg2, "privacy" ) then
			Engine.SetSelectedGroupType( f890_arg2, Engine.GetModelValue( Engine.GetModel( CoD.perController[f890_arg2].selectedGroup, "privacy" ) ) )
		end
		if IsGroupDataDirty( f890_arg2, "joinApprovalType" ) then
			Engine.SetSelectedGroupJoinApprovalType( f890_arg2, Engine.GetModelValue( Engine.GetModel( CoD.perController[f890_arg2].selectedGroup, "joinApprovalType" ) ) )
		end
	end
	local f890_local0 = false
	if HasAdminPrivilege( f890_arg2, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_DESCRIPTION ) and IsGroupDataDirty( f890_arg2, "description" ) then
		f890_local0 = true
	end
	if HasAdminPrivilege( f890_arg2, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_MESSAGE ) and IsGroupDataDirty( f890_arg2, "message" ) then
		f890_local0 = true
	end
	if HasAdminPrivilege( f890_arg2, Enum.GroupAdminPrivilege.GROUP_ADMIN_PRIVILEGE_EDIT_GROUP_EMBLEM ) and IsGroupDataDirty( f890_arg2, "emblem" ) then
		f890_local0 = true
	end
	if f890_local0 then
		Engine.UpdateSelectedGroupProfile( f890_arg2 )
	end
	ResetGroupDirtyData( f890_arg2 )
end

function SetSelectedGroup( f891_arg0, f891_arg1, f891_arg2 )
	if f891_arg1 and f891_arg1:getModel() then
		CoD.perController[f891_arg2].selectedGroup = f891_arg1:getModel()
		Engine.SetSelectedGroup( f891_arg2, Engine.GetModelValue( f891_arg1:getModel( f891_arg2, "groupBufferType" ) ), Engine.GetModelValue( f891_arg1:getModel( f891_arg2, "groupId" ) ) )
		Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetModelForController( f891_arg2 ), "groups.selectedGroup" ) )
	end
end

function ClearSelectedGroup( f892_arg0, f892_arg1, f892_arg2 )
	CoD.perController[f892_arg2].selectedGroup = nil
	Engine.ClearSelectedGroup()
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetModelForController( f892_arg2 ), "groups.selectedGroup" ) )
end

function SetGroupHeadquarterTabName( f893_arg0, f893_arg1, f893_arg2 )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f893_arg2 ), "groups" ), "grouphqtabname" ), f893_arg1.tabId )
end

function SearchGroupsBySearchType( f894_arg0, f894_arg1, f894_arg2, f894_arg3, f894_arg4 )
	if not f894_arg4 then
		ClearSelectedGroup( f894_arg0, f894_arg1, f894_arg2 )
	end
	Engine.SearchGroups( f894_arg2, f894_arg3 )
end

function ClearLastGroupSearchResults( f895_arg0, f895_arg1, f895_arg2 )
	Engine.ClearLastGroupSearchResults( f895_arg2 )
end

function SearchPlayerByGamertag( f896_arg0, f896_arg1, f896_arg2 )
	local f896_local0 = f896_arg1:getParentMenu()
	local f896_local1 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f896_arg2 ), "groups.searchGroupsPlayerName" ) )
	if f896_local1 == "" then
		return 
	end
	Engine.SearchPlayerByGamertag( f896_arg2, f896_local1 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f896_arg2 ), "groups.searchPlayerResultsVisible" ), true )
	local f896_local2 = f896_arg1:findSibling( "CategoriesList" )
	if f896_local2 then
		f896_local2:processEvent( {
			name = "gain_focus",
			controller = f896_arg2
		} )
	end
	OpenGroupsNotifyPopup( f896_local0, f896_arg1, f896_arg2, true, "search_player_task_complete", function ( f897_arg0, f897_arg1, f897_arg2 )
		local f897_local0 = f897_arg0:findSibling( "CategoriesList" )
		if f897_local0 and f897_local0:getModel() and f897_local0:getModel( f897_arg2, "frameWidget" ) then
			Engine.SetModelValue( f897_local0:getModel( f897_arg2, "frameWidget" ), "CoD.FindGroupsTabSearchPlayerResultsFrame" )
			local f897_local1 = f897_local0:findSibling( "FindGroupsTabFrame" )
			if f897_local1 then
				f897_local1:processEvent( {
					name = "lose_focus",
					controller = f897_arg2
				} )
				f897_local0:processEvent( {
					name = "gain_focus",
					controller = f897_arg2
				} )
			end
		end
	end, true )
end

function SearchGroups( f898_arg0, f898_arg1, f898_arg2 )
	local f898_local0 = f898_arg1:getParentMenu()
	Engine.ClearLastGroupSearchResults( f898_arg2 )
	Engine.SearchGroups( f898_arg2, Enum.GroupSearchType.GROUP_SEARCH_TYPE_SEARCH_BY_PARAMS )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f898_arg2 ), "groups.searchResultsVisible" ), true )
	local f898_local1 = f898_arg1:findSibling( "CategoriesList" )
	if f898_local1 then
		f898_local1:processEvent( {
			name = "gain_focus",
			controller = f898_arg2
		} )
	end
	ClearSelectedGroup( f898_arg0, f898_arg1, f898_arg2 )
	OpenGroupsNotifyPopup( f898_local0, f898_arg1, f898_arg2, true, "search_groups_task_complete", function ( f899_arg0, f899_arg1, f899_arg2 )
		local f899_local0 = f899_arg0:findSibling( "CategoriesList" )
		if f899_local0 and f899_local0:getModel() and f899_local0:getModel( f899_arg2, "frameWidget" ) then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f899_arg2 ), "groups.paramSearchStarted" ), true )
			Engine.SetModelValue( f899_local0:getModel( f899_arg2, "frameWidget" ), "CoD.FindGroupsTabSearchGroupsResultsFrame" )
			local f899_local1 = f899_local0:findSibling( "FindGroupsTabFrame" )
			if f899_local1 then
				f899_local1:processEvent( {
					name = "lose_focus",
					controller = f899_arg2
				} )
				f899_local0:processEvent( {
					name = "gain_focus",
					controller = f899_arg2
				} )
			end
		end
	end, true )
end

function InitializeGroups( f900_arg0, f900_arg1, f900_arg2 )
	local f900_local0 = Engine.CreateModel( Engine.GetModelForController( f900_arg2 ), "groups" )
	Engine.CreateModel( f900_local0, "processingTask" )
	Engine.CreateModel( f900_local0, "grouphqtabname" )
	Engine.CreateModel( f900_local0, "createGroup" )
	local f900_local1 = Engine.CreateModel( f900_local0, "leaderboardmaker" )
	Engine.CreateModel( f900_local1, "startingState" )
	Engine.CreateModel( f900_local1, "state" )
	Engine.SetModelValue( Engine.CreateModel( f900_local1, "lbDef" ), "" )
	Engine.SetModelValue( Engine.CreateModel( f900_local1, "lbDefOriginal" ), "" )
	Engine.SetModelValue( Engine.CreateModel( f900_local1, "lbTimeFrame" ), 0 )
	Engine.SetModelValue( Engine.CreateModel( f900_local1, "lbHardcore" ), false )
	Engine.SetModelValue( Engine.CreateModel( f900_local1, "lbArena" ), false )
	Engine.SetModelValue( Engine.CreateModel( f900_local1, "lbSortType" ), "" )
	Engine.SetModelValue( Engine.CreateModel( f900_local1, "lbInitialized" ), false )
	Engine.CreateModel( f900_local0, "notificationTitle" )
	Engine.CreateModel( f900_local0, "notificationMessage" )
	Engine.CreateModel( f900_local0, "notificationError" )
	Engine.SetModelValue( Engine.CreateModel( f900_local0, "searchGroupsGroupName" ), "" )
	Engine.SetModelValue( Engine.CreateModel( f900_local0, "params.highlightGroupsTabInSocial" ), false )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f900_arg2 ), "groups.searchResultsVisible" ), false )
end

function FetchGroupInviteProfiles( f901_arg0, f901_arg1, f901_arg2 )
	Engine.FetchGroupInviteProfiles( f901_arg2 )
end

function UpdateFindGroupsTabSearchFrameWidget( f902_arg0, f902_arg1, f902_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f902_arg2 ), "groups.searchResultsVisible" ), false )
end

function UpdateFindGroupsTabSearchPlayerFrameWidget( f903_arg0, f903_arg1, f903_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f903_arg2 ), "groups.searchPlayerResultsVisible" ), false )
end

function OpenAdminPrivilegesPopup( f904_arg0, f904_arg1, f904_arg2 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f904_arg2 ), "groups.currentAdminPrivileges" ), Engine.GetGroupAdminPrivileges( f904_arg2, Engine.GetModelValue( Engine.GetModel( CoD.perController[f904_arg2].selectedGroup, "groupId" ) ), Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f904_arg2 ), "Social.selectedFriendXUID" ) ) ) )
	OpenOverlay( f904_arg0, "GroupAdminSettings", f904_arg2 )
end

function PromoteSelectedGroupMemberToAdmin( f905_arg0, f905_arg1, f905_arg2 )
	local f905_local0 = f905_arg1.gridInfoTable.parentGrid.menu
	Engine.FetchSelectedGroupAdmins()
	OpenGroupsNotifyPopup( f905_local0, f905_arg1, f905_arg2, true, "fetch_group_admins_task_complete", function ()
		local f906_local0 = Engine.GetSelectedGroupAdminsCount( f905_arg2 )
		if IsGroupAdmin( f905_arg2 ) then
			f906_local0 = f906_local0 + 1
		end
		if Engine.GetMaxGroupAdminsCount() <= Engine.GetSelectedGroupAdminsCount( f905_arg2 ) then
			OpenGenericSmallPopup( f905_local0, f905_arg2, "GROUPS_NOTICE_CAPS", "GROUPS_MAX_ADMINS_LIMIT_REACHED_DESC", nil, "MENU_OK", nil, nil )
			return 
		else
			f905_local0:OpenModalDialog( f905_arg0, f905_arg2, "GROUPS_PROMOTE_TO_ADMIN_CAPS", "GROUPS_PROMOTE_TO_ADMIN_DESC", {
				"GROUPS_DO_NOT_PROMOTE_CAPS",
				"GROUPS_PROMOTE_CAPS"
			}, function ( f907_arg0 )
				if f907_arg0 == 1 then
					local f907_local0 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f905_arg2].selectedGroup, "groupId" ) )
					Engine.PromoteSelectedGroupMemberToAdmin( f905_arg2, Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f905_arg2 ), "Social.selectedFriendXUID" ) ) )
					OpenGroupsNotifyPopup( f905_local0, f905_arg1, f905_arg2, true, "promote_member_task_complete", function ()
						GoBack( f905_local0, f905_arg2 )
					end, true )
				end
				return true
			end )
		end
	end, true )
end

function PromoteSelectedGroupAdminToOwner( f909_arg0, f909_arg1, f909_arg2 )
	f909_arg1.gridInfoTable.parentGrid.menu:OpenModalDialog( f909_arg0, f909_arg2, "GROUPS_TRANSFER_OWNERSHIP_CAPS", "GROUPS_TRANSFER_OWNERSHIP_DESC", {
		"GROUPS_DO_NOT_TRANSFER_CAPS",
		"GROUPS_WITH_ADMIN_RIGHTS_CAPS",
		"GROUPS_WITHOUT_ADMIN_RIGHTS_CAPS"
	}, function ( f910_arg0 )
		if f910_arg0 == 1 or f910_arg0 == 2 then
			Engine.PromoteGroupAdminToOwner( f909_arg2, Engine.GetModelValue( Engine.GetModel( CoD.perController[f909_arg2].selectedGroup, "groupId" ) ), Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f909_arg2 ), "Social.selectedFriendXUID" ) ), f910_arg0 == 1 )
			OpenGroupsNotifyPopup( REG3, f909_arg1, f909_arg2, true, "promote_member_to_owner_task_complete", function ()
				GoBack( REG3, f909_arg2 )
			end, true )
		end
		return true
	end )
end

function ToggleGroupAdminPrivilege( f912_arg0, f912_arg1, f912_arg2, f912_arg3 )
	Engine.ToggleGroupAdminPrivilege( f912_arg2, f912_arg3 )
end

function UpdateSelectedGroupAdminPrivileges( f913_arg0, f913_arg1, f913_arg2 )
	local f913_local0 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f913_arg2 ), "Social.selectedFriendXUID" ) )
	local f913_local1 = Engine.GetGroupAdminPrivileges( f913_arg2, Engine.GetModelValue( Engine.GetModel( CoD.perController[f913_arg2].selectedGroup, "groupId" ) ), f913_local0 )
	local f913_local2 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f913_arg2 ), "groups.currentAdminPrivileges" ) )
	if f913_local1 ~= f913_local2 then
		Engine.PromoteSelectedGroupMemberToAdmin( f913_arg2, f913_local0, f913_local2 )
	end
end

function BlockPublishedContent( f914_arg0, f914_arg1, f914_arg2 )
	f914_arg1.gridInfoTable.parentGrid.menu:OpenModalDialog( f914_arg0, f914_arg2, "GROUPS_BLOCK_PUBLISHED_CONTENT_CAPS", "GROUPS_BLOCK_PUBLISHED_CONTENT_MESSAGE", {
		"GROUPS_BLOCK_PUBLISHED_CONTENT_CANCEL_CAPS",
		"GROUPS_BLOCK_PUBLISHED_CONTENT_OK_CAPS"
	}, function ( f915_arg0 )
		if f915_arg0 == 1 then
			local f915_local0 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f914_arg2].selectedGroup, "groupId" ) )
			local f915_local1 = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f914_arg2 ), "Social.selectedFriendXUID" ) )
		end
		return true
	end )
end

function RemoveFromGroup( f916_arg0, f916_arg1, f916_arg2 )
	local f916_local0 = f916_arg1:getParentMenu()
	if f916_arg1.gridInfoTable then
		f916_local0 = f916_arg1.gridInfoTable.parentGrid.menu
	end
	f916_local0:OpenModalDialog( f916_arg0, f916_arg2, "GROUPS_REMOVE_FROM_GROUP_CAPS", "GROUPS_REMOVE_FROM_GROUP_MESSAGE", {
		"GROUPS_REMOVE_FROM_GROUP_CANCEL_CAPS",
		"GROUPS_REMOVE_FROM_GROUP_OK_CAPS"
	}, function ( f917_arg0 )
		if f917_arg0 == 1 then
			Engine.KickGroupMember( f916_arg2, Engine.GetModelValue( Engine.GetModel( CoD.perController[f916_arg2].selectedGroup, "groupId" ) ), Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f916_arg2 ), "Social.selectedFriendXUID" ) ) )
			OpenGroupsNotifyPopup( f916_local0, f916_arg1, f916_arg2, true, "fetch_group_members_task_complete", function ()
				GoBack( f916_local0, f916_arg2 )
			end, true )
		end
		return true
	end )
end

function BanFromGroup( f919_arg0, f919_arg1, f919_arg2 )
	local f919_local0 = f919_arg1:getParentMenu()
	if f919_arg1.gridInfoTable then
		f919_local0 = f919_arg1.gridInfoTable.parentGrid.menu
	end
	f919_local0:OpenModalDialog( f919_arg0, f919_arg2, "GROUPS_BAN_FROM_GROUP_CAPS", "GROUPS_BAN_FROM_GROUP_MESSAGE", {
		"GROUPS_BAN_FROM_GROUP_CANCEL_CAPS",
		"GROUPS_BAN_FROM_GROUP_OK_CAPS"
	}, function ( f920_arg0 )
		if f920_arg0 == 1 then
			Engine.BanGroupMember( f919_arg2, Engine.GetModelValue( Engine.GetModel( CoD.perController[f919_arg2].selectedGroup, "groupId" ) ), Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f919_arg2 ), "Social.selectedFriendXUID" ) ) )
			OpenGroupsNotifyPopup( f919_local0, f919_arg1, f919_arg2, true, "fetch_group_members_task_complete", function ()
				GoBack( f919_local0, f919_arg2 )
			end, true )
		end
		return true
	end )
end

function UnBanFromGroup( f922_arg0, f922_arg1, f922_arg2 )
	local f922_local0 = f922_arg1:getParentMenu()
	f922_local0:OpenModalDialog( f922_arg0, f922_arg2, "GROUPS_UNBAN_FROM_GROUP_CAPS", "GROUPS_UNBAN_FROM_GROUP_MESSAGE", {
		"GROUPS_UNBAN_FROM_GROUP_CANCEL_CAPS",
		"GROUPS_UNBAN_FROM_GROUP_OK_CAPS"
	}, function ( f923_arg0 )
		if f923_arg0 == 1 then
			Engine.UnBanGroupMember( f922_arg2, Engine.GetModelValue( Engine.GetModel( CoD.perController[f922_arg2].selectedGroup, "groupId" ) ), Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f922_arg2 ), "Social.selectedFriendXUID" ) ) )
			OpenGroupsNotifyPopup( f922_local0, f922_arg1, f922_arg2, true, "fetch_banned_members_task_complete", function ()
				if Engine.GetSelectedGroupBannedMembersCount( f922_arg2 ) == 0 then
					local f924_local0 = f922_arg0:findSibling( "AdminOptions" )
					if f924_local0 then
						f924_local0:processEvent( {
							name = "gain_focus",
							controller = f922_arg2
						} )
					end
				end
			end, true )
		end
		return true
	end )
end

function DemoteAdminToRegularMember( f925_arg0, f925_arg1, f925_arg2 )
	local f925_local0 = f925_arg1:getParentMenu()
	if f925_arg1.gridInfoTable then
		f925_local0 = f925_arg1.gridInfoTable.parentGrid.menu
	end
	f925_local0:OpenModalDialog( f925_arg0, f925_arg2, "GROUPS_REMOVE_ADMIN_PRIVILEGES_CAPS", "GROUPS_REMOVE_ADMIN_PRIVILEGES_DESC", {
		"GROUPS_DO_NOT_REMOVE_CAPS",
		"GROUPS_REMOVE_CAPS"
	}, function ( f926_arg0 )
		if f926_arg0 == 1 then
			Engine.DemoteGroupAdminToRegularMember( f925_arg2, Engine.GetModelValue( Engine.GetModel( CoD.perController[f925_arg2].selectedGroup, "groupId" ) ), Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f925_arg2 ), "Social.selectedFriendXUID" ) ) )
			OpenGroupsNotifyPopup( f925_local0, f925_arg1, f925_arg2, true, "demote_member_task_complete", function ()
				GoBack( f925_local0, f925_arg2 )
			end, true )
		end
		return true
	end )
end

function OpenGroupSelector( f928_arg0, f928_arg1, f928_arg2 )
	Engine.FetchOutgoingGroupInvites( f928_arg2, Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f928_arg2 ), "Social.selectedFriendXUID" ) ) )
	OpenGroupsNotifyPopup( f928_arg0, f928_arg1, f928_arg2, true, "refreshOutgoingInvites", function ()
		OpenPopup( f928_arg0, "GroupSelectPopup", f928_arg2 )
	end, true )
end

function OpenViewGroups( f930_arg0, f930_arg1, f930_arg2 )
	ClearLastGroupSearchResults( f930_arg0, f930_arg1, f930_arg2 )
	SearchGroupsBySearchType( f930_arg0, f930_arg1, f930_arg2, Enum.GroupSearchType.GROUP_SEARCH_TYPE_SELECTED_FRIEND, true )
	OpenGroupsNotifyPopup( f930_arg0, f930_arg1, f930_arg2, true, "search_groups_task_complete", function ()
		if Engine.GetTotalGroupsCount( f930_arg2, Enum.GroupBufferType.GROUP_BUFFER_TYPE_SEARCH ) == 0 then
			OpenGenericSmallPopup( f930_arg0, f930_arg2, "MENU_NOTICE_CAPS", "GROUPS_NO_FRIENDS_GROUP", nil, "MENU_OK", nil, nil )
		else
			OpenPopup( f930_arg0, "ShowFriendsGroups", f930_arg2 )
		end
	end, true )
end

function InviteToGroup( f932_arg0, f932_arg1, f932_arg2 )
	local f932_local0 = f932_arg1.groupId
	if not f932_arg1.inviteSent then
		Engine.SendGroupInvite( f932_arg2, f932_local0, Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f932_arg2 ), "Social.selectedFriendXUID" ) ) )
		OpenGroupsNotifyPopup( f932_arg0, f932_arg1, f932_arg2, true, "refreshOutgoingInvites", function ()
			if f932_arg1:getModel() and f932_arg1:getModel( f932_arg2, "inviteSent" ) then
				local f933_local0 = Engine.SetModelValue
				local f933_local1 = f932_arg1:getModel()
				if f933_local1 then
					f933_local1 = f932_arg1:getModel( f932_arg2, "inviteSent" )
				end
				f933_local0( f933_local1, true )
			end
			CoD.OverlayUtility.ShowToast( "Invite", Engine.Localize( "MENU_INVITE_SENT" ), "", LuaEnums.INVITE_TOAST_POPUP_ICON )
		end, true )
	end
	return true
end

function CreateNewGroupFlow( f934_arg0, f934_arg1, f934_arg2 )
	ClearSelectedGroup( f934_arg0, f934_arg1, f934_arg2 )
	InitializeCreateGroup( f934_arg0, f934_arg1, f934_arg2 )
	OpenCreateGroupMenu( f934_arg0, f934_arg1, f934_arg2 )
end

function CancelCreateGroup( f935_arg0, f935_arg1, f935_arg2, f935_arg3 )
	f935_arg3:OpenModalDialog( f935_arg0, f935_arg2, "GROUPS_CANCEL_GROUP_CREATION_TITLE", "GROUPS_CANCEL_GROUP_CREATION_SUBTITLE", {
		"MENU_NO_CAPS",
		"MENU_YES_CAPS"
	}, function ( f936_arg0 )
		if f936_arg0 == 1 then
			GoBack( f935_arg3, f935_arg2 )
		end
		return true
	end )
end

function ProcessCreateGroup( f937_arg0, f937_arg1, f937_arg2 )
	if ValidateCreateGroupInformation( f937_arg0, f937_arg1, f937_arg2 ) then
		CreateGroup( f937_arg0, f937_arg1, f937_arg2 )
	end
end

function InviteSelectedFriendsToGroup( f938_arg0, f938_arg1, f938_arg2, f938_arg3 )
	local f938_local0 = f938_arg3
	local f938_local1 = Engine.GetModel( Engine.GetModelForController( f938_arg2 ), "groups.createGroup.createdGroupId" )
	if f938_local0 and f938_local1 then
		Engine.SendGroupBatchInvites( f938_arg2, Engine.GetModelValue( f938_local1 ) )
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f938_arg2 ), "groups.highlightGroupsTabInSocial" ), true )
	OpenGenericSmallPopup( GoBackToMenu( f938_arg0, f938_arg2, "Social_Main" ), f938_arg2, "GROUPS_SUCCESS_CAPS", "GROUPS_CREATE_SUCCESS_MESSAGE", nil, "MENU_OK", nil, nil )
end

function AdminTabMakeNotFocusableIfDisabled( f939_arg0, f939_arg1 )
	f939_arg0:linkToElementModel( f939_arg0, "disabled", true, function ( model )
		if Engine.GetModelValue( model ) then
			f939_arg0:makeNotFocusable()
		end
	end )
end

function CreateGroup( f941_arg0, f941_arg1, f941_arg2 )
	local f941_local0 = Engine.GetModelForController( f941_arg2 )
	local f941_local1 = Engine.GetModelValue( Engine.GetModel( f941_local0, "groups.createGroup.name" ) )
	local f941_local2 = Engine.GetModelValue( Engine.GetModel( f941_local0, "groups.createGroup.description" ) )
	local f941_local3 = Engine.GetModelValue( Engine.GetModel( f941_local0, "groups.createGroup.privacy" ) )
	local f941_local4 = Engine.GetModelValue( Engine.GetModel( f941_local0, "groups.createGroup.emblem" ) )
	Engine.SetModelValue( Engine.CreateModel( f941_local0, "groups.createGroup.failed" ), false )
	Engine.CreateGroup( f941_arg2, f941_local1, f941_local2, f941_local3, f941_local4 )
	OpenGroupsNotifyPopup( f941_arg0, f941_arg1, f941_arg2, true, "create_group_task_complete", function ( f942_arg0, f942_arg1, f942_arg2 )
		local f942_local0 = Engine.GetFriendsCount( f942_arg2, 0 )
		local f942_local1 = Engine.GetModelValue( Engine.GetModel( f941_local0, "groups.createGroup.failed" ) )
		if Engine.GetModelValue( Engine.GetModel( f941_local0, "groups.notificationError" ) ) then
			OpenGroupsNotifyPopup( f942_arg0, f942_arg1, f942_arg2 )
		elseif f942_local0 > 0 and not f942_local1 then
			NavigateToMenu( f942_arg0, "GroupInviteFriends", false, f942_arg2 )
		elseif not f942_local1 then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f942_arg2 ), "groups.highlightGroupsTabInSocial" ), true )
			OpenGenericSmallPopup( GoBackToMenu( f942_arg0, f942_arg2, "Social_Main" ), f942_arg2, "GROUPS_SUCCESS_CAPS", "GROUPS_CREATE_SUCCESS_MESSAGE", nil, "MENU_OK", nil, nil )
		end
		if not f942_local1 then
			local f942_local2 = CoD.SafeGetModelValue( Engine.GetModelForController( f942_arg2 ), "groups.createGroup.createdGroupId" )
			if f942_local2 ~= nil then
				local f942_local3 = "public"
				if f941_local3 == Enum.GroupPrivacy.GROUP_PRIVACY_PRIVATE then
					f942_local3 = "private"
				end
				LUI.CoDMetrics.CreateGroupEvent( f942_arg2, f942_local2, f942_local3 )
			end
		end
	end, true, function ( f943_arg0, f943_arg1, f943_arg2 )
		if CoD.SafeGetModelValue( f941_local0, "groups.notificationMessage" ) == "GROUPS_ERROR_TEAMNAME_ALREADY_EXISTS" then
			Engine.SetModelValue( Engine.GetModel( f941_local0, "groups.notificationTitle" ), "GROUPS_GROUP_NAME_EXISTS_CAPS" )
		end
		Engine.SetModelValue( Engine.CreateModel( f941_local0, "groups.createGroup.failed" ), true )
	end )
end

function OpenLeaderboardResetOverlay( f944_arg0, f944_arg1, f944_arg2, f944_arg3, f944_arg4 )
	OpenSystemOverlay( f944_arg0, f944_arg4, f944_arg2, "LeaderboardClearCustomConfirmationOverlay", {
		resetAction = f944_arg3
	} )
end

function SetDefaultCareerLeaderboard( f945_arg0, f945_arg1, f945_arg2 )
	local f945_local0 = CoD.LeaderboardUtility.GetCareerLeaderboardDef( f945_arg2 )
	local f945_local1 = Enum.LbTrackType.LB_TRK_ALLTIME
	local f945_local2 = false
	local f945_local3 = false
	local f945_local4 = ""
	local f945_local5 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f945_arg2].selectedGroup, "groupId" ) )
	SetGroupLeaderboardInfo( f945_arg2, f945_local0, f945_local1, f945_local2, f945_local3, "", true )
	Engine.SetGroupLeaderboard( f945_arg2, f945_local5, f945_local0, f945_local1, 0 )
	local f945_local6 = Engine.GetModelForController( f945_arg2 )
	f945_arg0:subscribeToModel( Engine.GetModel( f945_local6, "groups.eventUpdate" ), function ( model )
		if Engine.GetModelValue( Engine.GetModel( f945_local6, "groups.eventName" ) ) == "set_leaderboard_task_complete" then
			Engine.LoadLeaderboard( f945_local0, f945_local1 )
			Engine.RequestLeaderboardData( f945_arg2, Enum.LbFilter.LB_FILTER_GROUP_MEMBERS )
		end
	end )
	OpenGroupsNotifyPopup( f945_arg0, f945_arg1, f945_arg2, true, "fetch_group_leaderboard_task_complete", function ( f947_arg0, f947_arg1, f947_arg2 )
		Engine.ForceNotifyModelSubscriptions( Engine.GetModel( Engine.GetModelForController( f947_arg2 ), "groups.leaderboardmaker.lbDef" ) )
		OpenGenericSmallPopup( f947_arg0, f947_arg2, "GROUPS_CONGRATULATIONS_CAPS_TITLE", "GROUPS_DEFAULT_LB_SUCCESS", nil, "MENU_OK", nil, nil )
		Engine.SetModelValue( Engine.GetModel( f945_local6, "groups.leaderboardmaker.state" ), "" )
	end, true )
end

function OpenLeaderboardMaker( f948_arg0, f948_arg1, f948_arg2, f948_arg3 )
	if f948_arg3 == nil then
		error( "OpenLeaderboardMaker(): Invalid starting state specified" )
		return 
	else
		local f948_local0 = Engine.GetModelForController( f948_arg2 )
		Engine.SetModelValue( Engine.GetModel( f948_local0, "groups.leaderboardmaker.startingState" ), f948_arg3 )
		Engine.SetModelValue( Engine.GetModel( f948_local0, "groups.leaderboardmaker.state" ), f948_arg3 )
		local f948_local1 = f948_arg0:getParentMenu()
		f948_local1:openPopup( "LeaderboardMaker", f948_arg2 )
	end
end

function RemoveGroupLeaderboard( f949_arg0, f949_arg1, f949_arg2 )
	f949_arg1.gridInfoTable.parentGrid.menu:OpenModalDialog( f949_arg0, f949_arg2, "GROUPS_REMOVE_LEADERBOARD_CAPS", "GROUPS_REMOVE_LEADERBOARD_DESC", {
		"MPUI_NO",
		"MPUI_YES"
	}, function ( f950_arg0 )
		if f950_arg0 == 1 then
			SetGroupLeaderboardInfo( f949_arg2, "", 0, false, false, "", false )
			Engine.DeleteGroupLeaderboard( f949_arg2, Engine.GetModelValue( Engine.GetModel( CoD.perController[f949_arg2].selectedGroup, "groupId" ) ) )
			OpenGroupsNotifyPopup( REG3, f949_arg1, f949_arg2, true, "delete_leaderboard_task_complete", function ()
				GoBack( REG3, f949_arg2 )
				Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetModelForController( f949_arg2 ), "groups.updateLeaderboardTabNav" ) )
			end, true )
		end
		return true
	end )
end

function ProcessLeaderboardMakerBack( f952_arg0, f952_arg1, f952_arg2 )
	local f952_local0 = Engine.GetModelForController( f952_arg2 )
	local f952_local1 = Engine.GetModelValue( Engine.GetModel( f952_local0, "groups.leaderboardmaker.startingState" ) )
	local f952_local2 = Engine.GetModel( f952_local0, "groups.leaderboardmaker.state" )
	local f952_local3 = Engine.GetModelValue( f952_local2 )
	if f952_local3 == f952_local1 or f952_local3 == "SelectAction" then
		Engine.SetModelValue( f952_local2, "" )
		GoBack( f952_arg0, f952_arg2 )
	elseif f952_local3 == "ChooseBaseLeaderboard" then
		Engine.SetModelValue( f952_local2, "SelectAction" )
	elseif f952_local3 == "ChooseHardcore" then
		Engine.SetModelValue( f952_local2, "ChooseBaseLeaderboard" )
	elseif f952_local3 == "ChooseDefaultSort" then
		Engine.SetModelValue( f952_local2, "ChooseHardcore" )
	elseif f952_local3 == "ChooseTimeFrame" then
		Engine.SetModelValue( f952_local2, "ChooseDefaultSort" )
	end
end

function EditGroupLeaderboard( f953_arg0, f953_arg1, f953_arg2 )
	local f953_local0 = GoBack( f953_arg0, f953_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f953_arg2 ), "groups.leaderboardmaker.state" ), "ChooseBaseLeaderboard" )
	OpenLeaderboardMaker( f953_local0, f953_arg1, f953_arg2, "ChooseBaseLeaderboard" )
end

function ProcessChooseBaseLeaderboard( f954_arg0, f954_arg1, f954_arg2 )
	local f954_local0 = Engine.GetModelForController( f954_arg2 )
	Engine.SetModelValue( Engine.CreateModel( f954_local0, "groups.leaderboardmaker.lbDefOriginal" ), Engine.GetModelValue( f954_arg1:getModel( f954_arg2, "lbDef" ) ) )
	Engine.SetModelValue( Engine.CreateModel( f954_local0, "groups.leaderboardmaker.lbDef" ), Engine.GetModelValue( f954_arg1:getModel( f954_arg2, "lbDef" ) ) )
	Engine.SetModelValue( Engine.GetModel( f954_local0, "groups.leaderboardmaker.state" ), "ChooseHardcore" )
end

function ProcessChooseHardcoreAndArena( f955_arg0, f955_arg1, f955_arg2 )
	local f955_local0 = Engine.GetModelForController( f955_arg2 )
	local f955_local1 = f955_arg1.value
	local f955_local2 = Engine.GetModelValue( Engine.CreateModel( f955_local0, "groups.leaderboardmaker.lbDef" ) )
	Engine.SetModelValue( Engine.CreateModel( f955_local0, "groups.leaderboardmaker.lbHardcore" ), f955_local1 == "HC" )
	Engine.SetModelValue( Engine.CreateModel( f955_local0, "groups.leaderboardmaker.lbArena" ), f955_local1 == "ARENA" )
	if f955_local1 ~= "" then
		f955_local2 = f955_local2 .. "_" .. f955_local1
	end
	Engine.SetModelValue( Engine.CreateModel( f955_local0, "groups.leaderboardmaker.lbDef" ), f955_local2 )
	Engine.SetModelValue( Engine.GetModel( f955_local0, "groups.leaderboardmaker.state" ), "ChooseDefaultSort" )
end

function ProcessChooseDefaultSort( f956_arg0, f956_arg1, f956_arg2 )
	local f956_local0 = Engine.GetModelForController( f956_arg2 )
	Engine.SetModelValue( Engine.CreateModel( f956_local0, "groups.leaderboardmaker.lbSortType" ), f956_arg1.value )
	Engine.SetModelValue( Engine.GetModel( f956_local0, "groups.leaderboardmaker.state" ), "ChooseTimeFrame" )
end

function ProcessChooseTimeFrame( f957_arg0, f957_arg1, f957_arg2 )
	local f957_local0 = Engine.GetModelForController( f957_arg2 )
	local f957_local1 = Engine.GetModelValue( Engine.GetModel( f957_local0, "groups.leaderboardmaker.lbDef" ) )
	local f957_local2 = Engine.GetModelValue( Engine.GetModel( f957_local0, "groups.leaderboardmaker.lbDefOriginal" ) )
	local f957_local3 = Engine.GetModelValue( Engine.GetModel( f957_local0, "groups.leaderboardmaker.lbHardcore" ) )
	local f957_local4 = Engine.GetModelValue( Engine.GetModel( f957_local0, "groups.leaderboardmaker.lbArena" ) )
	local f957_local5 = Engine.GetModelValue( Engine.GetModel( f957_local0, "groups.leaderboardmaker.lbSortType" ) )
	local f957_local6 = f957_arg1.value
	Engine.SetModelValue( Engine.GetModel( f957_local0, "groups.leaderboardmaker.lbTimeFrame" ), f957_local6 )
	local f957_local7 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f957_arg2].selectedGroup, "groupId" ) )
	SetGroupLeaderboardInfo( f957_arg2, f957_local1, f957_local6, f957_local3, f957_local4, f957_local5, true )
	local f957_local8 = 0
	if CoD.LeaderboardUtility.sortColumns[f957_local2] then
		for f957_local12, f957_local13 in ipairs( CoD.LeaderboardUtility.sortColumns[f957_local2] ) do
			if f957_local5 == f957_local13.lbSortType then
				f957_local8 = f957_local13.offset
			end
		end
	end
	Engine.SetGroupLeaderboard( f957_arg2, f957_local7, f957_local1, f957_local6, f957_local8 )
	OpenGroupsNotifyPopup( f957_arg0, f957_arg1, f957_arg2, true, "set_leaderboard_task_complete", function ( f958_arg0, f958_arg1, f958_arg2 )
		Engine.ForceNotifyModelSubscriptions( Engine.GetModel( Engine.GetModelForController( f958_arg2 ), "groups.leaderboardmaker.lbDef" ) )
		Engine.SetModelValue( Engine.GetModel( f957_local0, "groups.leaderboardmaker.state" ), "" )
		Engine.LoadLeaderboard( f957_local1, f957_local6 )
		Engine.RequestLeaderboardData( f958_arg2, Enum.LbFilter.LB_FILTER_GROUP_MEMBERS )
		GoBack( f957_arg0, f958_arg2 )
	end, false, function ()
		SetGroupsNotifyInformation( f957_arg2, "MENU_ERROR_CAPS", "GROUPS_GENERIC_ERROR_MSG", true )
	end, true )
end

function Leaderboard_TabChanged( f960_arg0, f960_arg1, f960_arg2 )
	CoD.perController[f960_arg2].selectedLeaderboardTabId = f960_arg1.tabId
end

function OpenLeaderboardMaintanencePopup( f961_arg0, f961_arg1 )
	CoD.OverlayUtility.CreateOverlay( f961_arg1, f961_arg0, "LeaderboardsDownForMaintanence" )
end

function NavigateToLeaderboardMain( f962_arg0, f962_arg1, f962_arg2 )
	local f962_local0 = NavigateToMenu( f962_arg0, f962_arg1, true, f962_arg2 )
	if LeaderboardsDownForMaintanence() then
		OpenLeaderboardMaintanencePopup( f962_local0, f962_arg2 )
	end
end

function LoadLeaderboard( f963_arg0, f963_arg1 )
	local f963_local0 = IsCustomLeaderboard( f963_arg1 )
	local f963_local1 = IsDOALeaderboard( f963_arg1 )
	local f963_local2 = IsZMMapsLeaderboard( f963_arg1 )
	local f963_local3 = IsLobbyLeaderboard( f963_arg1 )
	local f963_local4 = Engine.GetModelForController( f963_arg1 )
	local f963_local5 = Engine.GetModel( f963_local4, "leaderboards" )
	if f963_local5 == nil then
		f963_local5 = Engine.CreateModel( f963_local4, "leaderboards", true )
		Engine.CreateModel( f963_local5, "leaderboardDurationFilter", true )
		Engine.SetModelValue( Engine.CreateModel( f963_local5, "leaderboardPlayerFilter", true ), Enum.LbFilter.LB_FILTER_FRIENDS )
		Engine.SetModelValue( Engine.CreateModel( f963_local5, "leaderboardZMMapsNumPlayersFilter", true ), CoD.LeaderboardUtility.DEFAULT_ZM_MAPS_NUM_PLAYERS )
		Engine.SetModelValue( Engine.CreateModel( f963_local5, "leaderboardDOANumPlayersFilter", true ), CoD.LeaderboardUtility.DEFAULT_DOA_NUM_PLAYERS )
	end
	local f963_local6 = CoD.SafeGetModelValue( Engine.GetModelForController( f963_arg1 ), "leaderboards.leaderboardPlayerFilter" )
	if not f963_local6 then
		f963_local6 = Enum.LbFilter.LB_FILTER_FRIENDS
	end
	if f963_local6 == Enum.LbFilter.LB_FILTER_GROUP_MEMBERS then
		Engine.SetModelValue( Engine.CreateModel( f963_local5, "leaderboardPlayerFilter", true ), Enum.LbFilter.LB_FILTER_FRIENDS )
		f963_local6 = Enum.LbFilter.LB_FILTER_FRIENDS
		CoD.perController[f963_arg1].leaderboardPlayerFilter = Enum.LbFilter.LB_FILTER_FRIENDS
	end
	local f963_local7 = CoD.SafeGetModelValue( Engine.GetModelForController( f963_arg1 ), "leaderboards.leaderboardZMMapsNumPlayersFilter" )
	if not f963_local7 then
		f963_local7 = CoD.LeaderboardUtility.DEFAULT_ZM_MAPS_NUM_PLAYERS
	end
	local f963_local8 = CoD.SafeGetModelValue( Engine.GetModelForController( f963_arg1 ), "leaderboards.leaderboardDOANumPlayersFilter" )
	if not f963_local8 then
		f963_local8 = CoD.LeaderboardUtility.DEFAULT_DOA_NUM_PLAYERS
	end
	CoD.perController[f963_arg1].pivotPosition = nil
	local f963_local9 = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "leaderboardDef" ) )
	local f963_local10 = CoD.LeaderboardUtility.leaderboardInfo[f963_local9]
	local f963_local11 = CoD.SafeGetModelValue( Engine.GetModelForController( f963_arg1 ), "leaderboards.leaderboardDurationFilter" )
	local f963_local12 = LUI.startswith( f963_local9, "LB_CP_DOA_BO3_SCORE" )
	if not f963_local12 then
		f963_local12 = LUI.startswith( f963_local9, "LB_CP_DOA_BO3_ROUND" )
	end
	if f963_local2 then
		f963_local9 = f963_local9 .. "_" .. tostring( f963_local7 ) .. "PLAYER"
	end
	if f963_local1 and f963_local8 > CoD.LeaderboardUtility.DEFAULT_DOA_NUM_PLAYERS and f963_local12 then
		f963_local9 = f963_local9 .. "_" .. tostring( f963_local8 ) .. "PLAYER"
	end
	if f963_local3 then
		f963_local6 = Enum.LbFilter.LB_FILTER_LOBBY_MEMBERS
	end
	local f963_local13 = false
	for f963_local17, f963_local18 in ipairs( f963_local10.trackTypes ) do
		if f963_local11 == f963_local18 then
			f963_local13 = true
			break
		end
	end
	if f963_local13 == false then
		f963_local11 = f963_local10.trackTypes[1]
	end
	if not Dvar.ui_hideLeaderboards:get() and Engine.LoadLeaderboard( f963_local9, f963_local11 ) == true then
		f963_local15 = false
		if f963_local0 then
			f963_local15 = true
			if f963_local6 == Enum.LbFilter.LB_FILTER_CUSTOM then
				Engine.LobbyVM_CallFunc( "Leaderboard_PopulateCustomList", {
					controller = f963_arg1
				} )
			end
		end
		f963_local16 = false
		for f963_local21, f963_local22 in pairs( CoD.LeaderboardUtility.LeaderboardPlayerFilterList( f963_arg1 ) ) do
			if f963_local22.value == f963_local6 then
				f963_local16 = true
				break
			end
		end
		if f963_local16 == false then
			f963_local6 = Enum.LbFilter.LB_FILTER_FRIENDS
		end
		Engine.RequestLeaderboardData( f963_arg1, f963_local6, f963_local15 )
	end
	f963_local14 = CoD.LeaderboardUtility.GetPlayerFilterString( f963_local6 )
	f963_local15 = CoD.LeaderboardUtility.GetDurationFilterString( f963_local11 )
	f963_local16 = ""
	if f963_local2 == true then
		f963_local16 = Engine.Localize( "MPUI_X_SLASH_Y", CoD.LeaderboardUtility.GetZMMapsNumPlayersFilterString( f963_local7 ), f963_local14 )
	elseif f963_local0 == true then
		f963_local16 = Engine.Localize( "MPUI_X_SLASH_Y", f963_local14, f963_local15 )
	elseif f963_local3 == true then
		f963_local16 = Engine.Localize( f963_local15 )
	elseif #f963_local10.trackTypes > 1 == true then
		f963_local16 = Engine.Localize( "MPUI_X_SLASH_Y", f963_local14, f963_local15 )
	elseif f963_local1 and f963_local12 == true then
		f963_local16 = Engine.Localize( "MPUI_X_SLASH_Y", CoD.LeaderboardUtility.GetDOANumPlayersFilterString( f963_local8 ), f963_local14 )
	else
		f963_local16 = Engine.Localize( f963_local14 )
	end
	SetGlobalModelValue( "FilterInfo", f963_local16 )
end

function Leaderboard_SetLeaderboardDef( f964_arg0, f964_arg1, f964_arg2 )
	SetGlobalModelValue( "leaderboardDef", Engine.GetModelValue( Engine.GetModel( f964_arg1:getModel(), "lbDef" ) ) )
end

function Leaderboard_MoveUp( f965_arg0, f965_arg1, f965_arg2 )
	local f965_local0 = CoD.SafeGetModelValue( Engine.GetModelForController( f965_arg2 ), "leaderboards.leaderboardPlayerFilter" )
	if f965_local0 == Enum.LbFilter.LB_FILTER_NONE or f965_local0 == Enum.LbFilter.LB_FILTER_GROUP_MEMBERS then
		Leaderboard_MoveUp_All( f965_arg0, f965_arg1, f965_arg2 )
	else
		Leaderboard_MoveUp_Friends( f965_arg0, f965_arg1, f965_arg2 )
	end
end

function Leaderboard_MoveDown( f966_arg0, f966_arg1, f966_arg2 )
	local f966_local0 = CoD.SafeGetModelValue( Engine.GetModelForController( f966_arg2 ), "leaderboards.leaderboardPlayerFilter" )
	if f966_local0 == Enum.LbFilter.LB_FILTER_NONE or f966_local0 == Enum.LbFilter.LB_FILTER_GROUP_MEMBERS then
		Leaderboard_MoveDown_All( f966_arg0, f966_arg1, f966_arg2 )
	else
		Leaderboard_MoveDown_Friends( f966_arg0, f966_arg1, f966_arg2 )
	end
end

function Leaderboard_PageUp( f967_arg0, f967_arg1, f967_arg2 )
	local f967_local0 = CoD.SafeGetModelValue( Engine.GetModelForController( f967_arg2 ), "leaderboards.leaderboardPlayerFilter" )
	if f967_local0 == Enum.LbFilter.LB_FILTER_NONE or f967_local0 == Enum.LbFilter.LB_FILTER_GROUP_MEMBERS then
		Leaderboard_PageUp_All( f967_arg0, f967_arg1, f967_arg2 )
	else
		Leaderboard_PageUp_Friends( f967_arg0, f967_arg1, f967_arg2 )
	end
end

function Leaderboard_PageDown( f968_arg0, f968_arg1, f968_arg2 )
	local f968_local0 = CoD.SafeGetModelValue( Engine.GetModelForController( f968_arg2 ), "leaderboards.leaderboardPlayerFilter" )
	if f968_local0 == Enum.LbFilter.LB_FILTER_NONE or f968_local0 == Enum.LbFilter.LB_FILTER_GROUP_MEMBERS then
		Leaderboard_PageDown_All( f968_arg0, f968_arg1, f968_arg2 )
	else
		Leaderboard_PageDown_Friends( f968_arg0, f968_arg1, f968_arg2 )
	end
end

function Leaderboard_GoToTopOfList( f969_arg0, f969_arg1, f969_arg2 )
	local f969_local0 = CoD.SafeGetModelValue( Engine.GetModelForController( f969_arg2 ), "leaderboards.leaderboardPlayerFilter" )
	if f969_local0 == Enum.LbFilter.LB_FILTER_NONE or f969_local0 == Enum.LbFilter.LB_FILTER_GROUP_MEMBERS then
		Leaderboard_GoToTopOfList_All( f969_arg0, f969_arg1, f969_arg2 )
	else
		Leaderboard_GoToTopOfList_Friends( f969_arg0, f969_arg1, f969_arg2 )
	end
end

function Leaderboard_UpdateHeaderModel( f970_arg0, f970_arg1 )
	local f970_local0 = f970_arg0.LeaderboardHeader
	if not f970_local0 then
		return 
	end
	DataSources.LeaderboardHeader.getModel( f970_arg1 )
	if f970_local0.linkedElementModels then
		for f970_local4, f970_local5 in ipairs( f970_local0.linkedElementModels ) do
			f970_local5.element:updateElementLinkedModels( f970_local0 )
		end
	end
end

function Leaderboard_ApplyFilters( f971_arg0, f971_arg1 )
	local f971_local0 = CoD.SafeGetModelValue( Engine.GetModelForController( f971_arg1 ), "leaderboards.leaderboardPlayerFilter" ) == CoD.perController[f971_arg1].leaderboardPlayerFilter
	local f971_local1 = CoD.SafeGetModelValue( Engine.GetModelForController( f971_arg1 ), "leaderboards.leaderboardDurationFilter" ) == CoD.perController[f971_arg1].leaderboardDurationFilter
	local f971_local2 = true
	local f971_local3 = true
	if IsZMMapsLeaderboard( f971_arg1 ) then
		f971_local2 = CoD.SafeGetModelValue( Engine.GetModelForController( f971_arg1 ), "leaderboards.leaderboardZMMapsNumPlayersFilter" ) == CoD.perController[f971_arg1].leaderboardZMMapsNumPlayersFilter
	end
	if IsDOALeaderboard( f971_arg1 ) then
		f971_local3 = CoD.SafeGetModelValue( Engine.GetModelForController( f971_arg1 ), "leaderboards.leaderboardDOANumPlayersFilter" ) == CoD.perController[f971_arg1].leaderboardDOANumPlayersFilter
	end
	if f971_local0 and f971_local1 and f971_local2 and f971_local3 then
		return 
	else
		local f971_local4 = Engine.GetModel( Engine.GetModelForController( f971_arg1 ), "leaderboards" )
		Engine.SetModelValue( Engine.CreateModel( f971_local4, "leaderboardDurationFilter" ), CoD.perController[f971_arg1].leaderboardDurationFilter )
		Engine.SetModelValue( Engine.CreateModel( f971_local4, "leaderboardPlayerFilter" ), CoD.perController[f971_arg1].leaderboardPlayerFilter )
		Engine.SetModelValue( Engine.CreateModel( f971_local4, "leaderboardZMMapsNumPlayersFilter" ), CoD.perController[f971_arg1].leaderboardZMMapsNumPlayersFilter )
		Engine.SetModelValue( Engine.CreateModel( f971_local4, "leaderboardDOANumPlayersFilter" ), CoD.perController[f971_arg1].leaderboardDOANumPlayersFilter )
		LoadLeaderboard( f971_arg0, f971_arg1 )
	end
end

function Leaderboard_OpenPlayerDetails( f972_arg0, f972_arg1, f972_arg2 )
	Leaderboard_SetSelectedFriendXUID( f972_arg0, f972_arg1, f972_arg2 )
	OpenOverlay( f972_arg0, "Social_PlayerDetailsPopup", f972_arg2 )
end

function Leaderboard_SetSelectedFriendXUID( f973_arg0, f973_arg1, f973_arg2 )
	if not f973_arg1:getModel() then
		return 
	else
		local f973_local0 = Engine.GetModelValue( Engine.GetModel( f973_arg1:getModel(), "name" ) )
		local f973_local1 = Engine.GetModelValue( Engine.GetModel( f973_arg1:getModel(), "xuid" ) )
		local f973_local2 = Engine.GetPlayerInfo( f973_arg2, f973_local1 )
		local f973_local3 = Engine.GetModelForController( f973_arg2 )
		Engine.SetModelValue( Engine.CreateModel( f973_local3, "Social.selectedFriendXUID" ), f973_local1 )
		Engine.SetModelValue( Engine.CreateModel( f973_local3, "Social.selectedFriendGamertag" ), f973_local0 )
	end
end

function LeaderboardEnablePCacheBuffer( f974_arg0, f974_arg1, f974_arg2 )
	f974_arg1.setVisibleTimer = LUI.UITimer.newElementTimer( 250, true, function ()
		local f975_local0 = f974_arg0:getParent()
		local f975_local1 = f974_arg0.PlayerProfileInfoWidget
		while f975_local0 and not f975_local1 do
			f975_local1 = f975_local0.PlayerProfileInfoWidget
			f975_local0 = f975_local0:getParent()
		end
		if f975_local1 then
			f975_local1:setState( "Visible" )
		end
		local f975_local2 = f974_arg1:getModel( f974_arg2, "xuid" )
		if f975_local2 then
			f974_arg1:setupPlayerBackgroundIdUpdateByXUID( Engine.GetModelValue( f975_local2 ) )
		end
		f974_arg1.setVisibleTimer = nil
	end )
	f974_arg1:addElement( f974_arg1.setVisibleTimer )
end

function LeaderboardDisablePCacheBuffer( f976_arg0, f976_arg1, f976_arg2 )
	f976_arg1:disablePlayerBackgroundIdUpdate()
	if f976_arg1.setVisibleTimer then
		f976_arg1.setVisibleTimer:close()
		f976_arg1.setVisibleTimer = nil
	end
	local f976_local0 = f976_arg0:getParent()
	local f976_local1 = f976_arg0.PlayerProfileInfoWidget
	while f976_local0 and not f976_local1 do
		f976_local1 = f976_local0.PlayerProfileInfoWidget
		f976_local0 = f976_local0:getParent()
	end
	if f976_local1 then
		f976_local1:setState( "PCacheBuffer" )
	end
end

function SpectateScoreboardPlayer( f977_arg0, f977_arg1, f977_arg2 )
	local f977_local0 = Engine.GetModel( Engine.GetGlobalModel(), "scoreboard." .. f977_arg1 )
	if not f977_local0 then
		return 
	else
		local f977_local1 = Engine.GetModel( f977_local0, "count" )
		if not f977_local1 then
			return 
		else
			local f977_local2 = Engine.GetModelValue( f977_local1 )
			local f977_local3 = tonumber( f977_arg2 )
			if f977_local2 <= f977_local3 then
				return 
			else
				local f977_local4 = Engine.GetModel( f977_local0, f977_local3 )
				if not f977_local4 then
					return 
				else
					local f977_local5 = Engine.GetModel( f977_local4, "clientNum" )
					if not f977_local5 then
						return 
					else
						Engine.SendMenuResponse( f977_arg0, "spectate", Engine.GetModelValue( f977_local5 ) )
					end
				end
			end
		end
	end
end

function SpectateSelectedPlayer( f978_arg0, f978_arg1, f978_arg2 )
	Engine.SendMenuResponse( f978_arg2, "spectate", Engine.GetModelValue( Engine.GetModel( f978_arg1:getModel(), "clientNum" ) ) )
end

function SpectateNextAlivePlayer( f979_arg0 )
	Engine.Exec( f979_arg0, "cmd follownextalive" )
end

function SetShoutcastHighlightedPlayer( f980_arg0, f980_arg1, f980_arg2 )
	Dvar.shoutcastHighlightedClient:set( Engine.GetModelValue( Engine.GetModel( f980_arg1:getModel(), "clientNum" ) ) )
end

function ToggleCodCasterProfileValue( f981_arg0, f981_arg1 )
	if not CoD.ShoutcasterProfileVarBool( f981_arg0, f981_arg1 ) then
		CoD.SetShoutcasterProfileVarValue( f981_arg0, f981_arg1, 1 )
	else
		CoD.SetShoutcasterProfileVarValue( f981_arg0, f981_arg1, 0 )
	end
end

function ToggleCodCasterQuickSettings( f982_arg0, f982_arg1, f982_arg2, f982_arg3 )
	if not f982_arg1.profileVar and not f982_arg3 then
		return 
	end
	local f982_local0 = nil
	if f982_arg3 == nil or f982_arg3 == "" then
		f982_local0 = f982_arg1.profileVar
	else
		f982_local0 = f982_arg3
	end
	ToggleCodCasterProfileValue( f982_arg2, f982_local0 )
	local f982_local1 = f982_arg1:getModel()
	if f982_local1 then
		local f982_local2 = Engine.GetModel( f982_local1, "profileVarValue" )
		if f982_local2 then
			Engine.SetModelValue( f982_local2, CoD.ShoutcasterProfileVarBool( f982_arg2, f982_local0 ) )
		end
	end
	if Engine.IsInGame() and f982_local0 == "shoutcaster_qs_thirdperson" then
		Engine.ExecNow( f982_arg2, "shoutcaster_thirdperson " .. CoD.ShoutcasterProfileVarValue( f982_arg2, f982_local0 ) )
	end
end

function ToggleScoreboard( f983_arg0 )
	Engine.Exec( f983_arg0, "cg_togglescores" )
end

function ToggleInGamePauseMenu( f984_arg0 )
	Engine.Exec( f984_arg0, "togglemenu" )
end

function HandleTeamIdentityKeyboardComplete( f985_arg0, f985_arg1, f985_arg2, f985_arg3 )
	local f985_local0, f985_local1 = nil
	local f985_local2 = Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( f985_arg2 ), "team" ) )
	local f985_local3 = DataSources.TeamIdentityInformation.getModel( f985_arg2, f985_local2 )
	if f985_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_TEAM_IDENTITY_TEAMNAME then
		f985_local0 = Engine.GetModel( f985_local3, "teamName" )
		f985_local1 = "shoutcaster_fe_" .. f985_local2 .. "_name"
	end
	if f985_local0 then
		Engine.SetModelValue( f985_local0, f985_arg3.input )
		CoD.SetShoutcasterProfileVarValue( f985_arg2, f985_local1, f985_arg3.input )
	end
end

function SetTeamIdentityProfileValue( f986_arg0, f986_arg1, f986_arg2, f986_arg3 )
	if not f986_arg3 or f986_arg3 == "" then
		return 
	else
		local f986_local0 = Engine.GetModel( f986_arg1:getModel(), "id" )
		if not f986_local0 then
			return 
		else
			CoD.SetShoutcasterProfileVarValue( f986_arg2, "shoutcaster_fe_" .. Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( f986_arg2 ), "team" ) ) .. "_" .. f986_arg3, Engine.GetModelValue( f986_local0 ) )
		end
	end
end

function SetTeamIdentityTeamLogo( f987_arg0, f987_arg1, f987_arg2 )
	local f987_local0 = DataSources.TeamIdentityInformation.getModel( f987_arg2, Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( f987_arg2 ), "team" ) ) )
	local f987_local1 = Engine.GetModelValue( Engine.GetModel( f987_arg1:getModel(), "ref" ) )
	local f987_local2 = Engine.GetModelValue( Engine.GetModel( f987_arg1:getModel(), "name" ) )
	Engine.SetModelValue( Engine.GetModel( f987_local0, "teamLogo" ), f987_local1 )
	Engine.SetModelValue( Engine.GetModel( f987_local0, "teamLogoName" ), f987_local2 )
end

function SetTeamIdentityTeamColor( f988_arg0, f988_arg1, f988_arg2 )
	Engine.SetModelValue( Engine.GetModel( DataSources.TeamIdentityInformation.getModel( f988_arg2, Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( f988_arg2 ), "team" ) ) ), "teamColor" ), Engine.GetModelValue( Engine.GetModel( f988_arg1:getModel(), "color" ) ) )
end

function UpdateSelectedTeamIdentityColorElement( f989_arg0, f989_arg1, f989_arg2 )
	local f989_local0 = CoD.ShoutcasterProfileVarValue( f989_arg2, "shoutcaster_fe_" .. Engine.GetModelValue( Engine.GetModel( DataSources.TeamIdentity.getModel( f989_arg2 ), "team" ) ) .. "_color" )
	local f989_local1 = Engine.GetModelValue( Engine.GetModel( f989_arg1:getModel(), "id" ) )
	local f989_local2 = f989_arg0.TeamColorList:findItem( {
		id = f989_local0
	} )
	if f989_local2 then
		Engine.SetModelValue( Engine.GetModel( f989_local2:getModel(), "selected" ), false )
	end
	Engine.SetModelValue( Engine.GetModel( f989_arg1:getModel(), "selected" ), true )
end

function SaveShoutcasterSettings( f990_arg0, f990_arg1, f990_arg2 )
	Engine.StorageWrite( f990_arg2, Enum.StorageFileType.STORAGE_PROFILE_SHOUTCASTER )
end

function ChangeAbilityWheelItems( f991_arg0, f991_arg1, f991_arg2 )
	local f991_local0 = Engine.GetModel( Engine.GetModelForController( f991_arg0 ), "hudItems.cybercomRequestedType" )
	local f991_local1 = (Engine.GetModelValue( f991_local0 ) + f991_arg2 + 3) % 3
	Engine.SetModelValue( f991_local0, f991_local1 )
	DataSources.AbilityWheel.getModel( f991_arg0 )
	f991_arg1.updateButtonStates( nil, f991_local1 + 1 )
end

function SetFileShareOverrideXuid( f992_arg0, f992_arg1, f992_arg2 )
	local f992_local0 = f992_arg1:getModel( f992_arg2, "xuid" )
	if f992_local0 ~= nil then
		local f992_local1 = Engine.GetModelValue( f992_local0 )
		Dvar.fshRecentsXUID:set( f992_local1 )
		OpenGenericSmallPopup( f992_arg0, f992_arg2, "Theater Player Overriden", "You will now be able to view fileshare as " .. tostring( f992_local1 ), nil, "MENU_OK" )
	end
end

function OpenCODPointsIntro( f993_arg0, f993_arg1, f993_arg2 )
	local f993_local0 = Engine.StorageGetBuffer( f993_arg2, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if Engine.GetInventoryItemQuantity( f993_arg2, Dvar.initial_cod_points_id:get() ) > 0 and f993_local0 and not IsJapaneseSku() and f993_local0.codPointMsgSeen:get() == 0 then
		CoD.OverlayUtility.CreateOverlay( f993_arg2, f993_arg0, "InitialCODPointsOverlay" )
	end
end

function OpenBlackMarketIncentivePopup( f994_arg0, f994_arg1 )
	if ShouldShowSeasonPassIncentiveOverlay( f994_arg1 ) then
		CoD.OverlayUtility.CreateOverlay( f994_arg1, f994_arg0, "SeasonPassIncentiveOverlay" )
	elseif IsSeasonPassIncentiveExploitPossible( f994_arg1 ) then
		CoD.OverlayUtility.CreateOverlay( f994_arg1, f994_arg0, "SeasonPassExlpoitOverlay" )
	elseif ShouldShowDigitalIncentiveOverlay( f994_arg1 ) then
		CoD.OverlayUtility.CreateOverlay( f994_arg1, f994_arg0, "DigitalIncentiveOverlay" )
	elseif ShouldShowRetailIncentiveOverlay( f994_arg1 ) then
		CoD.OverlayUtility.CreateOverlay( f994_arg1, f994_arg0, "RetailIncentiveOverlay" )
	elseif ShouldShowInitialCodPointsOverlay( f994_arg1 ) then
		CoD.OverlayUtility.CreateOverlay( f994_arg1, f994_arg0, "InitialCODPointsOverlay" )
	else
		local f994_local0 = CoD.StoreUtility.GetMissingCPSkuList( f994_arg1 )
		if #f994_local0 > 0 then
			CoD.OverlayUtility.CreateOverlay( f994_arg1, f994_arg0, "MissingCoDPointsRedemption", f994_arg1, {
				skuList = f994_local0
			} )
		else
			f994_local0 = CoD.StoreUtility.GetMissingCurrencySkuList( f994_arg1 )
			if #f994_local0 > 0 then
				CoD.OverlayUtility.CreateOverlay( f994_arg1, f994_arg0, "MissingCurrencyRedemption", f994_arg1, {
					skuList = f994_local0
				} )
			end
		end
	end
end

function OpenBlackMarket( f995_arg0, f995_arg1, f995_arg2 )
	if Engine.PushAnticheatMessageToUI( f995_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.LOOT ) then
		DisplayAnticheatMessage( f995_arg0, f995_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.LOOT, "", "" )
		return 
	elseif Engine.IsUserGuest( f995_arg2 ) then
		LuaUtils.UI_ShowErrorMessageDialog( f995_arg2, "MENU_GUEST_CONTENT_RESTRICTED" )
		return 
	end
	for f995_local0 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
		if CheckIfFeatureIsBanned( f995_local0, LuaEnums.FEATURE_BAN.LOOT ) then
			LuaUtils.UI_ShowErrorMessageDialog( f995_arg2, GetFeatureBanInfo( f995_local0, LuaEnums.FEATURE_BAN.LOOT ) )
			return 
		end
	end
	OpenOverlay( f995_arg0, "BlackMarket", f995_arg2 )
end

function OpenPCQuit( f996_arg0, f996_arg1, f996_arg2 )
	if CoD.isPC then
		CoD.OverlayUtility.CreateOverlay( f996_arg2, f996_arg0, "QuitPCGamePopup" )
	end
end

function OpenPCResetControlsPopup( f997_arg0, f997_arg1, f997_arg2 )
	if CoD.isPC then
		CoD.OverlayUtility.CreateOverlay( f997_arg2, f997_arg0, "ResetPCControls" )
	end
end

function ResetPCControlsToDefault( f998_arg0, f998_arg1, f998_arg2 )
	if Dvar.ui_execdemo_gamescom:get() then
		Engine.ExecNow( f998_arg2, "resetprofilecommon" )
		Engine.ExecNow( f998_arg2, "updategamerprofile" )
		Engine.ExecNow( f998_arg2, "storagereset stats_mp_offline" )
	end
	Engine.SetProfileVar( f998_arg2, "input_invertpitch", 0 )
	Engine.SetProfileVar( f998_arg2, "gpad_rumble", 1 )
	Engine.SetProfileVar( f998_arg2, "gpad_sticksConfig", CoD.THUMBSTICK_DEFAULT )
	Engine.SetProfileVar( f998_arg2, "gpad_buttonsConfig", CoD.BUTTONS_DEFAULT )
	Engine.SetProfileVar( f998_arg2, "input_viewSensitivity", CoD.SENSITIVITY_2 )
	Engine.SetProfileVar( f998_arg2, "input_viewSensitivityHorizontal", CoD.SENSITIVITY_2 )
	Engine.SetProfileVar( f998_arg2, "input_viewSensitivityVertical", CoD.SENSITIVITY_2 )
	Engine.SetProfileVar( f998_arg2, "mouseSensitivity", 5 )
	Engine.ExecNow( f998_arg2, "defaultbindings" )
	Engine.ExecNow( f998_arg2, "execcontrollerbindings" )
	Engine.SyncHardwareProfileWithDvars()
	f998_arg0:dispatchEventToRoot( {
		name = "options_refresh",
		controller = f998_arg2
	} )
end

function OpenPCApplyGraphicsPopup( f999_arg0, f999_arg1, f999_arg2 )
	if CoD.isPC then
		CoD.OverlayUtility.CreateOverlay( f999_arg2, f999_arg0, "ApplyPCGraphics" )
	end
end

function ApplyPCGraphicsOptions( f1000_arg0, f1000_arg1, f1000_arg2 )
	Engine.ApplyHardwareProfileSettings()
	Engine.SetTextureQuality( tonumber( Engine.GetHardwareProfileValueAsString( "r_picmip" ) ) )
	Engine.SetShadowQuality( CoD.PCUtil.ShadowOptionIndex )
	Engine.SetVolumetricQuality( CoD.PCUtil.VolumetricOptionIndex )
	Engine.SyncHardwareProfileWithDvars()
	Engine.SaveHardwareProfile()
	Engine.Exec( nil, "vid_restart" )
end

function ResetPCGraphicsOptions( f1001_arg0, f1001_arg1, f1001_arg2 )
	Engine.ResetHardwareProfileSettings()
	CoD.PCUtil.ShadowOptionIndex = Engine.GetShadowQuality()
	CoD.PCUtil.VolumetricOptionIndex = Engine.GetVolumetricQuality()
	Engine.Exec( nil, "vid_restart" )
	CoD.PCUtil.RefreshAllOptions( f1001_arg1, f1001_arg2 )
end

function HideIfUsingMouse( f1002_arg0, f1002_arg1 )
	if CoD.isPC then
		if Engine.LastInput_Gamepad() then
			f1002_arg0:setAlpha( 1 )
		else
			f1002_arg0:setAlpha( 0 )
		end
	end
end

function SetVerticaListSpacerHeight( f1003_arg0, f1003_arg1 )
	if f1003_arg1 then
		local f1003_local0 = Engine.GetModelValue( f1003_arg1 )
		if f1003_local0 then
			f1003_arg0:setTopBottom( true, false, 0, f1003_local0 )
		end
	end
end

function ToggleMouse( f1004_arg0, f1004_arg1 )
	f1004_arg0:toggleMouse()
end

function EnableMouseButton( f1005_arg0, f1005_arg1 )
	f1005_arg0:setHandleMouseButton( true )
end

function DisableMouseButton( f1006_arg0, f1006_arg1 )
	f1006_arg0:setHandleMouseButton( false )
end

function EnableMouseButtonOnElement( f1007_arg0, f1007_arg1 )
	f1007_arg0:setHandleMouseButton( true )
end

function ToggleDropdownListInUse_Console( f1008_arg0, f1008_arg1 )
	f1008_arg0.inUse = not f1008_arg0.inUse
	if f1008_arg0.inUse == true then
		if f1008_arg0.DropdownList then
			MakeFocusable( f1008_arg0.DropdownList )
			SetLoseFocusToElement( f1008_arg0, "DropdownRoot", f1008_arg1 )
			SetFocusToElement( f1008_arg0, "DropdownList", f1008_arg1 )
		end
	elseif f1008_arg0.DropdownList then
		SetState( f1008_arg0, "DefaultState" )
		MakeNotFocusable( f1008_arg0.DropdownList )
		MakeFocusable( f1008_arg0.DropdownRoot )
		SetLoseFocusToElement( f1008_arg0, "DropdownList", f1008_arg1 )
		SetFocusToElement( f1008_arg0, "DropdownRoot", f1008_arg1 )
	end
end

function DropDownListItemClick_Console( f1009_arg0, f1009_arg1, f1009_arg2 )
	
end

function Gunsmith_OpenCreateVariantNamePopup( f1010_arg0, f1010_arg1, f1010_arg2 )
	CoD.OverlayUtility.CreateOverlay( f1010_arg2, f1010_arg0, "GunsmithCreateVariantNameOverlay", f1010_arg2, f1010_arg1 )
end

function Gunsmith_OpenSaveVariantPopup( f1011_arg0, f1011_arg1, f1011_arg2, f1011_arg3 )
	CoD.OverlayUtility.CreateOverlay( f1011_arg2, f1011_arg0, "GunsmithSaveVariant", f1011_arg2, f1011_arg1 )
end

function Gunsmith_TabChanged( f1012_arg0, f1012_arg1, f1012_arg2 )
	DataSources.CraftWeaponList.setCurrentFilterItem( f1012_arg1.filter )
	CoD.perController[f1012_arg2].weaponCategory = f1012_arg1.filter
	f1012_arg0.weaponList:updateDataSource( true )
	f1012_arg0.weaponList:setActiveItem( f1012_arg0.weaponList:getFirstSelectableItem() )
	if CoD.perController[f1012_arg2].gunsmithWeaponCategoryRestored == true then
		CoD.SetCustomization( f1012_arg2, f1012_arg0.tabList.Tabs.grid.activeWidget.gridInfoTable.zeroBasedIndex + 1, "category_index" )
	end
end

function Gunsmith_Back( f1013_arg0, f1013_arg1, f1013_arg2 )
	CoD.perController[f1013_arg2].gunsmithWeaponCategoryRestored = nil
	CoD.perController[f1013_arg2].gunsmithWeaponListIndex = nil
	CoD.perController[f1013_arg2].gunsmithAttachmentType = nil
	CoD.perController[f1013_arg2].gunsmithAttachmentModel = nil
	CoD.perController[f1013_arg2].gunsmithCamoIndexModel = nil
	CoD.perController[f1013_arg2].gunsmithReticleIndexModel = nil
	CoD.perController[f1013_arg2].gunsmithVariantModel = nil
	CoD.perController[f1013_arg2].gunsmithAttachmentVariantModel = nil
	CoD.perController[f1013_arg2].emptyVariantSelected = nil
	CoD.CraftUtility.Gunsmith.CachedVariants = {}
end

function Gunsmith_GainFocus( f1014_arg0, f1014_arg1, f1014_arg2 )
	CoD.SetCustomization( f1014_arg2, Engine.GetModelValue( f1014_arg1:getModel( f1014_arg2, "itemIndex" ) ), "weapon_index" )
	if f1014_arg0.tabList then
		CoD.SetCustomization( f1014_arg2, f1014_arg0.tabList.Tabs.grid.activeWidget.gridInfoTable.zeroBasedIndex + 1, "category_index" )
	end
	CoD.CraftUtility.Gunsmith.DisplayBaseWeapon( f1014_arg0, f1014_arg1, f1014_arg2 )
	CoD.GunsmithWeaponOptionsTable = nil
end

function Gunsmith_ChooseWeaponList( f1015_arg0, f1015_arg1, f1015_arg2 )
	f1015_arg0:updateMode( Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST, f1015_arg1 )
	f1015_arg0.variantSelector.variantList:setActiveItem( f1015_arg0.variantSelector.variantList:getFirstSelectableItem() )
end

function Gunsmith_BrowseVariants( f1016_arg0, f1016_arg1, f1016_arg2 )
	f1016_arg0.variantSelector.variantList:updateDataSource( true )
	f1016_arg0:updateMode( Enum.GunsmithMode.GUNSMITHMODE_VARIANTS, f1016_arg1 )
	CoD.perController[f1016_arg2].gunsmithWeaponListIndex = f1016_arg0.weaponList.activeWidget.gridInfoTable.zeroBasedIndex + 1
	CoD.perController[f1016_arg2].gunsmithWeaponCategoryRestored = false
	CoD.perController[f1016_arg2].gunsmithAttachmentType = "attachment"
end

function Gunsmith_HandleKeyboardComplete( f1017_arg0, f1017_arg1, f1017_arg2, f1017_arg3 )
	local f1017_local0 = CoD.perController[f1017_arg2].gunsmithVariantModel
	local f1017_local1 = nil
	if not f1017_local0 then
		return 
	elseif f1017_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_GUNSMITH then
		f1017_local1 = Engine.GetModel( f1017_local0, "variantTextEntry" )
		if f1017_local1 then
			Engine.SetModelValue( f1017_local1, f1017_arg3.input )
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1017_arg2 ), "Gunsmith.validVariantNameEntered" ), true )
		end
		local f1017_local2 = f1017_arg0:getModel( f1017_arg2, "inputText" )
		if f1017_local2 then
			Engine.SetModelValue( f1017_local2, f1017_arg3.input )
		end
	end
end

function Gunsmith_CreateVariantNameBack( f1018_arg0, f1018_arg1, f1018_arg2 )
	Engine.SetModelValue( Engine.GetModel( f1018_arg0:getModel(), "variantTextEntry" ), Engine.Localize( "MENU_GUNSMITH_ENTER_VARIANT_NAME" ) )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1018_arg2 ), "Gunsmith.validVariantNameEntered" ), false )
end

function Gunsmith_FocusOccupiedVariant( f1019_arg0, f1019_arg1, f1019_arg2 )
	CoD.perController[f1019_arg2].gunsmithVariantModel = f1019_arg1:getModel()
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f1019_arg2, CoD.perController[f1019_arg2].gunsmithVariantModel )
end

function Gunsmith_ChooseEmptyVariant( f1020_arg0, f1020_arg1, f1020_arg2 )
	CoD.perController[f1020_arg2].gunsmithVariantModel = f1020_arg1:getModel()
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1020_arg2 ), "Gunsmith.validVariantNameEntered" ), false )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f1020_arg2, CoD.perController[f1020_arg2].gunsmithVariantModel )
	CoD.perController[f1020_arg2].emptyVariantSelected = true
end

function Gunsmith_EditVariant( f1021_arg0, f1021_arg1, f1021_arg2 )
	CoD.perController[f1021_arg2].gunsmithVariantModel = f1021_arg1:getModel()
	CoD.perController[f1021_arg2].confirmVariantNameButtonPressed = true
end

function Gunsmith_ConfirmVariantName( f1022_arg0, f1022_arg1, f1022_arg2, f1022_arg3 )
	local f1022_local0 = f1022_arg0:getModel()
	local f1022_local1 = Engine.GetModelValue( Engine.GetModel( f1022_local0, "variantTextEntry" ) )
	Engine.SetModelValue( Engine.GetModel( f1022_local0, "variantName" ), f1022_local1 )
	local f1022_local2 = GoBack( f1022_arg3, f1022_arg2 )
	if f1022_local2 then
		CoD.perController[f1022_arg2].confirmVariantNameButtonPressed = true
		f1022_local2:openOverlay( "GunsmithCustomizeVariant", f1022_arg2 )
		Engine.SetModelValue( Engine.GetModel( f1022_local0, "variantNameBig" ), f1022_local1 )
	end
end

function Gunsmith_SetWeaponAttachmentType( f1023_arg0, f1023_arg1, f1023_arg2, f1023_arg3, f1023_arg4, f1023_arg5 )
	CoD.perController[f1023_arg5].gunsmithAttachmentType = f1023_arg2
	CoD.perController[f1023_arg5].gunsmithAttachmentIsZombieMode = f1023_arg4
	CoD.perController[f1023_arg5].gunsmithAttachmentModel = f1023_arg0:getModel( f1023_arg5, "attachment" .. f1023_arg3 )
	CoD.perController[f1023_arg5].gunsmithAttachmentVariantModel = f1023_arg0:getModel( f1023_arg5, "attachmentVariant" .. f1023_arg3 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1023_arg5 ), "Gunsmith.GunsmithSelectedItemProperties.attachmentType" ), f1023_arg2 )
end

function Gunsmith_ClearAttachmentSlot( f1024_arg0, f1024_arg1, f1024_arg2, f1024_arg3 )
	Engine.SetModelValue( f1024_arg0:getModel( f1024_arg3, "attachment" .. f1024_arg2 ), CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
	Engine.SetModelValue( f1024_arg0:getModel( f1024_arg3, "attachmentVariant" .. f1024_arg2 ), CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
	if f1024_arg2 == 1 or f1024_arg2 == "1" then
		Engine.SetModelValue( f1024_arg0:getModel( f1024_arg3, "reticleIndex" ), CoD.CraftUtility.Gunsmith.RETICLE_NONE )
	end
	Gunsmith_ClearItemName( f1024_arg3 )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f1024_arg3, f1024_arg0:getModel(), true )
end

function Gunsmith_ClearCamo( f1025_arg0, f1025_arg1, f1025_arg2 )
	Engine.SetModelValue( f1025_arg0:getModel( f1025_arg2, "camoIndex" ), CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
	Gunsmith_ClearItemName( f1025_arg2 )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f1025_arg2, f1025_arg0:getModel(), true )
end

function Gunsmith_ClearVariantPaintjobSlot( f1026_arg0, f1026_arg1, f1026_arg2 )
	local f1026_local0 = f1026_arg0:getModel( f1026_arg2, "paintjobSlot" )
	local f1026_local1 = f1026_arg0:getModel( f1026_arg2, "paintjobIndex" )
	Engine.SetModelValue( f1026_local0, Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
	Engine.SetModelValue( f1026_local1, Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
	Gunsmith_ClearItemName( f1026_arg2 )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f1026_arg2, f1026_arg0:getModel(), true )
end

function Gunsmith_SelectAttachment( f1027_arg0, f1027_arg1, f1027_arg2 )
	local f1027_local0 = f1027_arg1:getModel()
	local f1027_local1 = CoD.perController[f1027_arg2].gunsmithVariantModel
	local f1027_local2 = {}
	if f1027_local0 and f1027_local1 then
		local f1027_local3 = Engine.GetModelValue( Engine.GetModel( f1027_local0, "attachmentIndex" ) )
		local f1027_local4 = Engine.GetModelValue( Engine.GetModel( f1027_local0, "acvIndex" ) )
		local f1027_local5 = 0
		for f1027_local6 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f1027_local9 = Engine.GetModelValue( Engine.GetModel( f1027_local1, "attachment" .. f1027_local6 ) )
			if f1027_local9 > 0 and f1027_local3 ~= f1027_local9 and not Engine.AreAttachmentsCompatibleByAttachmentID( f1027_local3, f1027_local9 ) then
				f1027_local5 = f1027_local9
				table.insert( f1027_local2, f1027_local6 )
			end
		end
		for f1027_local6 = 1, #f1027_local2, 1 do
			local f1027_local9 = Engine.GetModel( f1027_local1, "attachment" .. f1027_local2[f1027_local6] )
			local f1027_local10 = Engine.GetModel( f1027_local1, "attachmentVariant" .. f1027_local2[f1027_local6] )
			Engine.SetModelValue( f1027_local9, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
			Engine.SetModelValue( f1027_local10, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		end
		CoD.CraftUtility.Gunsmith.ClearVariantSlotByAttachmentIndex( f1027_arg2, f1027_local1, f1027_local3 )
		Engine.SetModelValue( f1027_arg0:getModel(), f1027_local3 )
		Engine.SetModelValue( CoD.perController[f1027_arg2].gunsmithAttachmentVariantModel, f1027_local4 )
	end
end

function Gunsmith_FocusAttachment( f1028_arg0, f1028_arg1, f1028_arg2, f1028_arg3 )
	local f1028_local0 = CoD.GetCustomization( f1028_arg2, "weapon_index" )
	local f1028_local1 = Engine.GetModelValue( f1028_arg1:getModel( f1028_arg2, "attachmentIndex" ) )
	local f1028_local2 = Engine.GetAttachmentRefByIndex( f1028_local1 )
	local f1028_local3 = Engine.GetModelValue( f1028_arg0:getModel() )
	local f1028_local4 = Engine.GetAttachmentRefByIndex( f1028_local3 )
	local f1028_local5 = CoD.perController[f1028_arg2].gunsmithVariantModel
	local f1028_local6 = CoD.CraftUtility.GetLoadoutSlot( f1028_arg2 )
	local f1028_local7 = "select01"
	local f1028_local8 = Engine.GetItemRef( f1028_local0, Enum.eModes.MODE_MULTIPLAYER ) .. CoD.CraftUtility.GetModeAbbreviation()
	for f1028_local13, f1028_local14 in ipairs( CoD.CraftUtility.Gunsmith.GetVariantAttachmentList( f1028_arg2, f1028_local5 ) ) do
		if f1028_local14 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
			local f1028_local12 = Engine.GetAttachmentRefByIndex( f1028_local14 )
			if (not Engine.IsOpticByAttachmentIndex( f1028_local1 ) or not Engine.IsOpticByAttachmentIndex( f1028_local14 )) and Engine.AreAttachmentsCompatibleByAttachmentID( f1028_local1, f1028_local14 ) then
				f1028_local8 = f1028_local8 .. "+" .. f1028_local12
			end
		end
	end
	f1028_local8 = f1028_local8 .. "+" .. f1028_local2
	if CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX < f1028_local3 and f1028_local2 ~= f1028_local4 then
		f1028_local8 = string.gsub( f1028_local8, "+" .. f1028_local4, "" )
	end
	f1028_local9 = ""
	if f1028_arg3 == false then
		f1028_local9 = CoD.CraftUtility.Gunsmith.GetWeaponAttachmentStringWithoutVariants( f1028_arg2, f1028_local5 )
	else
		f1028_local9 = CoD.CraftUtility.Gunsmith.GetAttachmentVariantStringWithSelectedVariant( f1028_arg2, f1028_local5, f1028_local3, Engine.GetModelValue( f1028_arg1:getModel( f1028_arg2, "variantIndex" ) ) )
	end
	if not CoD.CraftUtility.Gunsmith.IsFocusAttachmentEquipped( f1028_arg2, f1028_local5, f1028_local1 ) then
		f1028_local9 = f1028_local9 .. f1028_local2 .. ",0"
	end
	f1028_local11 = "none"
	if f1028_local8 and f1028_local8 ~= "" then
		Engine.SendClientScriptNotify( f1028_arg2, "CustomClass_focus" .. CoD.GetLocalClientAdjustedNum( f1028_arg2 ), f1028_local6, f1028_local8, f1028_local2, f1028_local11, f1028_local9 )
	end
end

function Gunsmith_SetAttachmentVariant( f1029_arg0, f1029_arg1, f1029_arg2 )
	local f1029_local0 = f1029_arg1:getModel()
	local f1029_local1 = Engine.GetModelValue( Engine.GetModel( f1029_local0, "variantIndex" ) )
	local f1029_local2 = Engine.GetModelValue( Engine.GetModel( f1029_local0, "attachmentIndex" ) )
	local f1029_local3 = CoD.perController[f1029_arg2].gunsmithVariantModel
	if f1029_local2 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX and CoD.CraftUtility.Gunsmith.IsFocusAttachmentEquipped( f1029_arg2, f1029_local3, f1029_local2 ) then
		CoD.CraftUtility.Gunsmith.SetFocusAttachmentVariant( f1029_arg2, f1029_local3, f1029_local2, f1029_local1 )
	end
end

function Gunsmith_FocusCamo( f1030_arg0, f1030_arg1, f1030_arg2 )
	local f1030_local0 = Engine.GetModelValue( f1030_arg1:getModel( f1030_arg2, "itemIndex" ) )
	if IsGunsmithItemWeaponOptionLocked( f1030_arg0, f1030_arg1, f1030_arg2 ) then
		f1030_local0 = 0
	end
	local f1030_local1 = CoD.perController[f1030_arg2].gunsmithVariantModel
	local f1030_local2 = Engine.GetModelValue( Engine.GetModel( f1030_local1, "paintjobSlot" ) )
	local f1030_local3 = Engine.GetModelValue( Engine.GetModel( f1030_local1, "paintjobIndex" ) )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f1030_arg2, CoD.perController[f1030_arg2].gunsmithVariantModel, false, nil, nil, f1030_local0 )
end

function Gunsmith_SetWeaponCamoModel( f1031_arg0, f1031_arg1, f1031_arg2 )
	CoD.perController[f1031_arg2].gunsmithCamoIndexModel = f1031_arg0:getModel( f1031_arg2, "camoIndex" )
	Engine.SendClientScriptNotify( f1031_arg2, "cam_customization_focus" .. CoD.GetLocalClientAdjustedNum( f1031_arg2 ), "primary", "select01" )
end

function Gunsmith_SelectCamo( f1032_arg0, f1032_arg1, f1032_arg2 )
	local f1032_local0 = f1032_arg1:getModel( f1032_arg2, "itemIndex" )
	if f1032_local0 then
		Engine.SetModelValue( f1032_arg0:getModel(), Engine.GetModelValue( f1032_local0 ) )
	end
end

function Gunsmith_FocusReticle( f1033_arg0, f1033_arg1, f1033_arg2 )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f1033_arg2, CoD.perController[f1033_arg2].gunsmithVariantModel, false, nil, nil, Engine.GetModelValue( Engine.GetModel( CoD.perController[f1033_arg2].gunsmithVariantModel, "camoIndex" ) ) )
end

function Gunsmith_SetWeaponReticleModel( f1034_arg0, f1034_arg1, f1034_arg2 )
	CoD.perController[f1034_arg2].gunsmithReticleIndexModel = f1034_arg0:getModel( f1034_arg2, "reticleIndex" )
	Engine.SendClientScriptNotify( f1034_arg2, "cam_customization_focus", "primary", "select01" )
end

function Gunsmith_SelectReticle( f1035_arg0, f1035_arg1, f1035_arg2 )
	local f1035_local0 = f1035_arg1:getModel( f1035_arg2, "weaponOptionSubIndex" )
	if f1035_local0 then
		Engine.SetModelValue( f1035_arg0:getModel(), Engine.GetModelValue( f1035_local0 ) )
	end
end

function Gunsmith_SetWeaponOptionAsOld( f1036_arg0, f1036_arg1, f1036_arg2 )
	local f1036_local0 = f1036_arg1:getModel()
	local f1036_local1 = CoD.GetCustomization( f1036_arg2, "weapon_index" )
	local f1036_local2 = CoD.SafeGetModelValue( f1036_local0, "weaponOptionType" )
	local f1036_local3 = CoD.SafeGetModelValue( f1036_local0, "filterMode" )
	if f1036_local2 == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE then
		local f1036_local4 = CoD.SafeGetModelValue( CoD.perController[f1036_arg2].gunsmithVariantModel, "attachment1" )
		if f1036_local4 then
			f1036_local1 = f1036_local4
		end
	end
	SetWeaponOptionAsOldInternal( f1036_arg0, f1036_arg1, f1036_arg2, f1036_local1 )
end

function Gunsmith_SetAttachmentAsOld( f1037_arg0, f1037_arg1 )
	local f1037_local0 = CoD.GetCustomization( f1037_arg1, "weapon_index" )
	local f1037_local1 = f1037_arg0:getModel( f1037_arg1, "attachmentIndex" )
	if f1037_local1 then
		local f1037_local2 = Engine.GetAttachmentIndexByAttachmentTableIndex( f1037_local0, Engine.GetModelValue( f1037_local1 ) )
		if CoD.CACUtility.EmptyItemIndex < f1037_local2 then
			Engine.SetAttachmentAsOld( f1037_arg1, f1037_local0, f1037_local2 )
		end
	end
end

function Gunsmith_SetACVASOld( f1038_arg0, f1038_arg1 )
	local f1038_local0 = CoD.GetCustomization( f1038_arg1, "weapon_index" )
	local f1038_local1 = f1038_arg0.attachmentTableIndex
	local f1038_local2 = f1038_arg0.variantIndex
	if f1038_local1 and f1038_local2 then
		SetACVASOldInternal( f1038_arg1, f1038_local0, f1038_local1, f1038_local2, Enum.eModes.MODE_MULTIPLAYER )
	end
end

function Gunsmith_SetSelectedItemName( f1039_arg0, f1039_arg1, f1039_arg2, f1039_arg3, f1039_arg4 )
	if f1039_arg1.m_focusable then
		local f1039_local0 = f1039_arg1:getModel()
		local f1039_local1 = Engine.CreateModel( Engine.GetModelForController( f1039_arg4 ), "Gunsmith.GunsmithSelectedItemProperties.itemName" )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1039_arg4 ), "Gunsmith.GunsmithSelectedItemProperties.attachmentType" ), f1039_arg2 )
		Engine.SetModelValue( f1039_local1, "" )
		if f1039_arg2 == "attachment" or f1039_arg2 == "optic" then
			local f1039_local2 = Engine.GetModelValue( f1039_arg0:getModel( f1039_arg4, "attachment" .. f1039_arg3 ) )
			if f1039_local2 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				Engine.SetModelValue( f1039_local1, Engine.GetAttachmentNameByIndex( f1039_local2 ) )
				Gunsmith_SetWeaponAttachmentType( f1039_arg0, f1039_arg1, f1039_arg2, f1039_arg3, false, f1039_arg4 )
			end
		elseif f1039_arg2 == "camo" and f1039_arg3 == "" then
			local f1039_local2 = Engine.GetModelValue( f1039_arg0:getModel( f1039_arg4, "camoIndex" ) )
			local f1039_local3 = CoD.GetCustomization( f1039_arg4, "weapon_index" )
			if f1039_local2 ~= CoD.CraftUtility.Gunsmith.CAMO_NONE and f1039_local3 > CoD.CACUtility.EmptyItemIndex then
				local f1039_local4 = Engine.GetModel( Engine.GetWeaponOptionsInfoModelByIndex( f1039_arg4, f1039_local2, "WeaponOptions", f1039_local3, 0 ), "name" )
				if f1039_local4 then
					Engine.SetModelValue( f1039_local1, Engine.GetModelValue( f1039_local4 ) )
				end
			end
		elseif f1039_arg2 == "paintjob" and f1039_arg3 == "" then
			local f1039_local2 = Engine.GetModelValue( f1039_arg1:getModel( f1039_arg4, "paintjobSlot" ) )
			local f1039_local5 = Engine.GetModelValue( f1039_arg1:getModel( f1039_arg4, "paintjobIndex" ) )
			if f1039_local2 ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and f1039_local5 ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
				Engine.SetModelValue( f1039_local1, CoD.CraftUtility.Paintjobs.GetPaintjobName( f1039_arg4, f1039_local2, f1039_local5 ) )
			end
		elseif f1039_arg2 == "snapshot" and f1039_arg3 == "" then
			Engine.SetModelValue( f1039_local1, Engine.Localize( "MENU_GUNSMITH_SNAPSHOT_SUBHEADER" ) )
		end
	end
end

function Gunsmith_ClearVariant( f1040_arg0, f1040_arg1, f1040_arg2 )
	CoD.CraftUtility.Gunsmith.ClearVariant( f1040_arg2, Engine.GetModelValue( Engine.GetModel( CoD.perController[f1040_arg2].gunsmithVariantModel, "variantIndex" ) ) )
	local f1040_local0 = nil
	if IsMediaManager() == true then
		f1040_local0 = GoBackMultiple( f1040_arg0, f1040_arg2, 1 )
		MediaManagerMarkDirty( f1040_arg2 )
	else
		f1040_local0 = GoBackMultiple( f1040_arg0, f1040_arg2, 2 )
	end
	if f1040_local0.variantSelector ~= nil and f1040_local0.variantSelector.variantList ~= nil then
		f1040_local0.variantSelector.variantList:updateDataSource( true )
		f1040_local0.variantSelector.variantList:setActiveItem( f1040_local0.variantSelector.variantList:getFirstSelectableItem() )
	end
	if Engine.GetModel( Engine.GetModelForController( f1040_arg2 ), "Gunsmith.UpdateDataSource" ) ~= nil then
		ForceNotifyModel( f1040_arg2, "Gunsmith.UpdateDataSource" )
	end
end

function Gunsmith_CopyVariant( f1041_arg0, f1041_arg1, f1041_arg2, f1041_arg3, f1041_arg4 )
	local f1041_local0 = CoD.CraftUtility.Gunsmith.Copy( f1041_arg2, Engine.GetModelValue( Engine.GetModel( CoD.perController[f1041_arg2].gunsmithVariantModel, "variantIndex" ) ) )
	if f1041_local0 then
		local f1041_local1 = GoBack( f1041_arg4, f1041_arg2 )
		local f1041_local2 = f1041_local1.variantSelector.variantList
		f1041_local2:updateDataSource( true )
		local f1041_local3 = f1041_local2:findItem( {
			variantIndex = f1041_local0
		} )
		if f1041_local3 then
			f1041_local2:setActiveItem( f1041_local3 )
		end
		ForceNotifyModel( f1041_arg2, "Gunsmith.UpdateDataSource" )
	end
end

function Gunsmith_RenameVariant( f1042_arg0, f1042_arg1, f1042_arg2 )
	local f1042_local0 = f1042_arg0:getModel()
	CoD.CraftUtility.Gunsmith.RenameVariant( f1042_arg2, Engine.GetModelValue( Engine.GetModel( f1042_local0, "variantIndex" ) ), Engine.GetModelValue( Engine.GetModel( f1042_local0, "variantName" ) ) )
end

function Gunsmith_HandleRenameKeyboardComplete( f1043_arg0, f1043_arg1, f1043_arg2, f1043_arg3 )
	local f1043_local0 = f1043_arg0:getModel()
	local f1043_local1, f1043_local2 = nil
	if not f1043_local0 then
		return 
	elseif f1043_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_GUNSMITH then
		f1043_local1 = Engine.GetModel( f1043_local0, "variantName" )
		f1043_local2 = Engine.GetModel( f1043_local0, "variantNameBig" )
	end
	if f1043_local1 then
		Engine.SetModelValue( f1043_local1, f1043_arg3.input )
		Gunsmith_ClearSelectedGunsmithVariantStats( f1043_arg2 )
	end
	if f1043_local2 then
		Engine.SetModelValue( f1043_local2, f1043_arg3.input )
	end
end

function Gunsmith_ClearSelectedGunsmithVariantStats( f1044_arg0 )
	local f1044_local0 = CoD.perController[f1044_arg0].gunsmithVariantModel
	if f1044_local0 then
		local f1044_local1 = Engine.GetModelValue( Engine.GetModel( f1044_local0, "variantIndex" ) )
		CoD.CraftUtility.Gunsmith.ClearVariantStats( f1044_arg0, f1044_local1, Enum.eModes.MODE_MULTIPLAYER )
		CoD.CraftUtility.Gunsmith.ClearVariantStats( f1044_arg0, f1044_local1, Enum.eModes.MODE_CAMPAIGN )
	end
end

function Gunsmith_SaveChangesButtonAction( f1045_arg0, f1045_arg1, f1045_arg2, f1045_arg3 )
	local f1045_local0 = CoD.perController[f1045_arg3].gunsmithVariantModel
	local f1045_local1 = MediaManagerGetQuotaForCategory( f1045_arg3, "variant" )
	if f1045_arg2 == "save" then
		CoD.CraftUtility.Gunsmith.WriteVaraintDataToDDL( f1045_arg3, f1045_local0 )
		ForceNotifyModel( f1045_arg3, "Gunsmith.UpdateDataSource" )
		Gunsmith_RecordComScoreEvent( f1045_arg0, f1045_arg3, f1045_local0, "save", f1045_local1.categorySlotsUsed, f1045_local1.categoryQuota )
	else
		Gunsmith_RecordComScoreEvent( f1045_arg0, f1045_arg3, f1045_local0, "discard" )
	end
	local f1045_local2 = GoBack( f1045_arg0, f1045_arg3 )
	local f1045_local3 = GoBack( f1045_local2, f1045_arg3 )
	ClearMenuSavedState( f1045_local2 )
	local f1045_local4 = Engine.GetModelValue( Engine.GetModel( f1045_local0, "variantIndex" ) )
	f1045_local3.variantSelector.variantList:updateDataSource( true )
	f1045_local3.attachmentList:updateDataSource( true )
	f1045_local3.variantSelector.variantList:findItem( {
		variantIndex = f1045_local4
	}, nil, true, nil )
	CoD.perController[f1045_arg3].emptyVariantSelected = false
end

function Gunsmith_PaintjobSelector_GainFocus( f1046_arg0, f1046_arg1, f1046_arg2 )
	CoD.perController[f1046_arg2].selectedpaintjobModel = f1046_arg1:getModel()
	CoD.perController[f1046_arg2].viewIndex = 1
	local f1046_local0 = CoD.Paintshop.View[CoD.perController[f1046_arg2].viewIndex].customization_type
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f1046_arg2, CoD.perController[f1046_arg2].gunsmithVariantModel, false, Engine.GetModelValue( f1046_arg1:getModel( f1046_arg2, "paintjobSlot" ) ), Engine.GetModelValue( f1046_arg1:getModel( f1046_arg2, "paintjobIndex" ) ), nil )
	SetHeadingKickerText( "MENU_GUNSMITH_CAPS" )
end

function Gunsmith_OpenPaintjobSelector( f1047_arg0, f1047_arg1, f1047_arg2 )
	CoD.SetCustomization( f1047_arg2, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT, "type" )
	CoD.perController[f1047_arg2].totalLayers = Enum.CustomizationTypeLayerCount.CUSTOMIZATION_TYPE_PAINTSHOP_MAX_LAYERS
	CoD.perController[f1047_arg2].totalGroups = Enum.CustomizationTypeGroupCount.CUSTOMIZATION_TYPE_MAX_GROUPS
	local f1047_local0 = CoD.CraftUtility.Paintjobs.ParseDDL( f1047_arg2, Enum.StorageFileType.STORAGE_PAINTJOBS )
end

function Gunsmith_PaintjobSelector_ChooseOccupiedPaintjob( f1048_arg0, f1048_arg1, f1048_arg2 )
	local f1048_local0 = Engine.GetModelValue( f1048_arg1:getModel( f1048_arg2, "paintjobSlot" ) )
	local f1048_local1 = Engine.GetModelValue( f1048_arg1:getModel( f1048_arg2, "paintjobIndex" ) )
	local f1048_local2 = f1048_arg0:getModel( f1048_arg2, "paintjobSlot" )
	local f1048_local3 = f1048_arg0:getModel( f1048_arg2, "paintjobIndex" )
	local f1048_local4 = f1048_arg0:getModel( f1048_arg2, "paintjobSlotAndIndex" )
	Engine.SetModelValue( f1048_local2, f1048_local0 )
	Engine.SetModelValue( f1048_local3, f1048_local1 )
	Engine.SetModelValue( f1048_local4, f1048_local0 .. " " .. f1048_local1 )
end

function Gunsmith_ClearCACWithUpdatedVariant( f1049_arg0, f1049_arg1 )
	local f1049_local0 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f1049_arg1].gunsmithVariantModel, "variantIndex" ) ) + 1
	local f1049_local1 = function ( f1050_arg0, f1050_arg1, f1050_arg2 )
		local f1050_local0 = Engine.GetClassItem( f1049_arg1, f1050_arg0, f1050_arg1, f1050_arg2 )
		if f1050_local0 > CoD.CACUtility.EmptyItemIndex and f1050_local0 == f1049_local0 then
			Engine.SetClassItem( f1049_arg1, f1050_arg0, f1050_arg1, CoD.CACUtility.EmptyItemIndex, f1050_arg2 )
		end
	end
	
	local f1049_local2 = function ( f1051_arg0 )
		local f1051_local0 = Engine.GetCustomClassCount( f1049_arg1, f1051_arg0 )
		for f1051_local1 = 1, f1051_local0, 1 do
			local f1051_local4 = f1051_local1 - 1
			f1049_local1( f1051_local4, "primarygunsmithvariant", f1051_arg0 )
			f1049_local1( f1051_local4, "secondarygunsmithvariant", f1051_arg0 )
		end
	end
	
	f1049_local2( Enum.eModes.MODE_CAMPAIGN )
	f1049_local2( Enum.eModes.MODE_MULTIPLAYER )
end

function Gunsmith_SnapshotToggleDisplayProperty( f1052_arg0, f1052_arg1, f1052_arg2 )
	local f1052_local0 = f1052_arg1:getModel( f1052_arg2, "param" )
	if f1052_local0 then
		local f1052_local1 = Engine.GetModelValue( f1052_local0 )
		if f1052_local1 then
			local f1052_local2 = Engine.GetModel( Engine.GetGlobalModel(), f1052_local1 )
			if f1052_local2 then
				Engine.SetModelValue( f1052_local2, (Engine.GetModelValue( f1052_local2 ) + 1) % 2 )
			end
		end
	end
end

function Gunsmith_SnapshotToggleControlsUI( f1053_arg0, f1053_arg1, f1053_arg2 )
	local f1053_local0 = Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.ShowControls" )
	if f1053_local0 then
		Engine.SetModelValue( f1053_local0, (Engine.GetModelValue( f1053_local0 ) + 1) % 2 )
	end
end

function Gunsmith_SnapshotToggleStatsFilter( f1054_arg0, f1054_arg1, f1054_arg2 )
	local f1054_local0 = Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.SessionMode" )
	if f1054_local0 then
		if Engine.GetModelValue( f1054_local0 ) == Enum.eModes.MODE_CAMPAIGN then
			Engine.SetModelValue( f1054_local0, Enum.eModes.MODE_MULTIPLAYER )
		else
			Engine.SetModelValue( f1054_local0, Enum.eModes.MODE_CAMPAIGN )
		end
	end
end

function CopyModelFindElement( f1055_arg0, f1055_arg1, f1055_arg2 )
	local f1055_local0 = f1055_arg1
	while f1055_local0 and not f1055_local0[f1055_arg2] do
		f1055_local0 = f1055_local0:getParent()
	end
	if f1055_local0 and f1055_local0[f1055_arg2] then
		f1055_local0[f1055_arg2]:setModel( f1055_arg1:getModel() )
	end
end

function StartMenuGoBack_ListElement( f1056_arg0, f1056_arg1, f1056_arg2, f1056_arg3, f1056_arg4 )
	StartMenuGoBack( f1056_arg4, f1056_arg2 )
end

function StartMenuGoBack( f1057_arg0, f1057_arg1 )
	StartMenuResumeGame( f1057_arg0, f1057_arg1 )
	GoBack( f1057_arg0, f1057_arg1 )
	ClearSavedState( f1057_arg0, f1057_arg1 )
end

function StartMenuResumeGame( f1058_arg0, f1058_arg1 )
	if Engine.IsInGame() and Engine.CanPauseGame() and not Engine.IsDemoPlaying() then
		Engine.SetDvar( "cl_paused", 0 )
	end
	if Engine.IsInGame() then
		Engine.SetActiveMenu( f1058_arg1, CoD.UIMENU_NONE )
	end
	PrepareCloseMenuInSafehouse( f1058_arg1 )
end

function UnpauseGame( f1059_arg0, f1059_arg1 )
	if Engine.IsInGame() and Engine.CanPauseGame() and not Engine.IsDemoPlaying() then
		Engine.SetDvar( "cl_paused", 0 )
	end
end

function CloseStartMenu( f1060_arg0, f1060_arg1 )
	local f1060_local0 = GoBackToMenu( f1060_arg0, f1060_arg1, "StartMenu_Main" )
	if f1060_local0.menuName == "StartMenu_Main" or f1060_local0.menuName == "DOA_INGAME_PAUSE" then
		StartMenuGoBack( f1060_local0, f1060_arg1 )
	end
end

function RefreshLobbyRoom( f1061_arg0, f1061_arg1 )
	if Engine.IsInGame() then
		return 
	end
	local f1061_local0 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyGameMode" )
	local f1061_local1 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" )
	local f1061_local2 = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.room" )
	if f1061_local2 then
		local f1061_local3 = Engine.GetModelValue( f1061_local2 )
		if f1061_local3 == "auto" then
			f1061_local3 = Engine.GetAbbreviationForMode( Engine.GetMostRecentPlayedMode( f1061_arg1 ) )
			if Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK ) == true then
				f1061_local3 = f1061_local3 .. "_local"
			end
			if IsCustomLobby() then
				f1061_local3 = f1061_local3 .. "_custom"
			end
		end
		SendCustomClientScriptMenuStateChangeNotify( f1061_arg1, "Main", true, f1061_local3 )
		f1061_arg0.previousRoom = f1061_local3
	end
end

function UpdatePlayerInspection( f1062_arg0, f1062_arg1, f1062_arg2 )
	local f1062_local0 = Engine.GetModelValue( Engine.GetModel( f1062_arg1:getModel(), "xuid" ) )
	if Engine.XuidIsValid( f1062_local0 ) then
		Engine.SendClientScriptNotify( f1062_arg2, "inspect_player", Engine.UInt64ToString( f1062_local0 ) )
	end
end

function UpdateGamerprofile( f1063_arg0, f1063_arg1, f1063_arg2 )
	Engine.Exec( f1063_arg2, "updategamerprofile" )
end

function OpenPaintshop( f1064_arg0, f1064_arg1, f1064_arg2, f1064_arg3, f1064_arg4 )
	if Engine.PushAnticheatMessageToUI( f1064_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.UGC ) then
		DisplayAnticheatMessage( f1064_arg0, f1064_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.UGC, "Paintshop", "" )
		return 
	elseif CheckIfFeatureIsBanned( f1064_arg2, LuaEnums.FEATURE_BAN.USER_GENERATED_CONTENT ) then
		LuaUtils.UI_ShowErrorMessageDialog( f1064_arg2, GetFeatureBanInfo( f1064_arg2, LuaEnums.FEATURE_BAN.USER_GENERATED_CONTENT ) )
		return 
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1064_arg2 ), "Paintshop.Mode" ), Enum.PaintshopMode.PAINTSHOPMODE_WEAPONLIST )
	CoD.SetCustomization( f1064_arg2, Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT, "type" )
	CoD.perController[f1064_arg2].totalLayers = Enum.CustomizationTypeLayerCount.CUSTOMIZATION_TYPE_PAINTSHOP_MAX_LAYERS
	CoD.perController[f1064_arg2].totalGroups = Enum.CustomizationTypeGroupCount.CUSTOMIZATION_TYPE_MAX_GROUPS
	if CoD.CraftUtility.Paintjobs.ParseDDL( f1064_arg2, Enum.StorageFileType.STORAGE_PAINTJOBS ) then
		f1064_arg4:openOverlay( "Paintshop", f1064_arg2 )
	end
end

function OpenEmblemSelect( f1065_arg0, f1065_arg1, f1065_arg2, f1065_arg3, f1065_arg4 )
	CoD.SetCustomization( f1065_arg2, Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM, "type" )
	Engine.ExecNow( f1065_arg2, "emblemgetprofile" )
	CoD.perController[f1065_arg2].selectedEmblemTabStorageType = f1065_arg3
	if CoD.CraftUtility.Emblems.ParseDDL( f1065_arg2, CoD.perController[f1065_arg2].selectedEmblemTabStorageType ) then
		f1065_arg4:openOverlay( "EmblemSelect", f1065_arg2 )
	end
end

function OpenEmblemEditor( f1066_arg0, f1066_arg1, f1066_arg2, f1066_arg3, f1066_arg4 )
	if Engine.PushAnticheatMessageToUI( f1066_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.UGC ) then
		DisplayAnticheatMessage( f1066_arg1, f1066_arg2, LuaEnums.ANTICHEAT_MESSAGE_GROUPS.UGC, "EmblemEditor", f1066_arg4 )
		return 
	elseif CheckIfFeatureIsBanned( f1066_arg2, LuaEnums.FEATURE_BAN.USER_GENERATED_CONTENT ) then
		LuaUtils.UI_ShowErrorMessageDialog( f1066_arg2, GetFeatureBanInfo( f1066_arg2, LuaEnums.FEATURE_BAN.USER_GENERATED_CONTENT ) )
		return 
	elseif f1066_arg4 == "EmblemSelect" then
		EmblemSelect_ChooseEmblem( f1066_arg1, f1066_arg0, f1066_arg2 )
		OpenOverlay( f1066_arg1, "EmblemEditor", f1066_arg2, "", "" )
	elseif f1066_arg4 == "PaintjobSelect" then
		PaintjobSelector_ChoosePaintjob( f1066_arg1, f1066_arg0, f1066_arg2 )
		OpenOverlay( f1066_arg1, "EmblemEditor", f1066_arg2, "", "" )
	end
end

function OpenGunsmith( f1067_arg0, f1067_arg1, f1067_arg2, f1067_arg3, f1067_arg4 )
	Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1067_arg2 ), "Gunsmith.Mode" ), Enum.GunsmithMode.GUNSMITHMODE_WEAPONLIST )
	if CoD.CraftUtility.Gunsmith.ParseDDL( f1067_arg2, Enum.StorageFileType.STORAGE_GUNSMITH ) and CoD.CraftUtility.Paintjobs.ParseDDL( f1067_arg2, Enum.StorageFileType.STORAGE_PAINTJOBS ) then
		f1067_arg4:openOverlay( "Gunsmith", f1067_arg2 )
		CoD.perController[f1067_arg2].emptyVariantSelected = false
	end
end

function OpenCallingCards( f1068_arg0, f1068_arg1, f1068_arg2, f1068_arg3, f1068_arg4 )
	f1068_arg4:openOverlay( "CallingCards", f1068_arg2 )
end

function OpenGroups( f1069_arg0, f1069_arg1, f1069_arg2, f1069_arg3, f1069_arg4 )
	if IsGroupsEnabled() then
		InitializeGroups( f1069_arg0, nil, f1069_arg2 )
		GoBackAndOpenOverlayOnParent( f1069_arg0, "Groups", f1069_arg2 )
		CoD.FileshareUtility.SetFileshareMode( f1069_arg2, Enum.FileshareMode.FILESHARE_MODE_GROUPS )
	end
end

function ToggleGroupShowcaseContentFavorite( f1070_arg0, f1070_arg1, f1070_arg2, f1070_arg3, f1070_arg4 )
	local f1070_local0 = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	if f1070_local0 and CoD.perController[f1070_arg2].selectedGroup then
		local f1070_local1 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f1070_arg2].selectedGroup, "groupId" ) )
		if not CoD.FileshareUtility.GetSelectedItemProperty( "favoriteInCurrGroup" ) then
			Engine.FavoriteFileInGroupsShowcase( f1070_arg2, f1070_local1, f1070_local0 )
			OpenGroupsNotifyPopup( f1070_arg4, f1070_arg1, f1070_arg2, true, "favorite_file_in_showcase_task_complete", function ()
				CoD.FileshareUtility.ShowToastForProcessingGroupShowcaseAction( f1070_arg2, CoD.FileshareUtility.ToastTypes.GROUP_FAVORITE )
				Close( f1070_arg0, f1070_arg2 )
			end, true )
		else
			Engine.UnfavoriteFileFromGroupsShowcase( f1070_arg2, f1070_local1, f1070_local0 )
			OpenGroupsNotifyPopup( f1070_arg4, f1070_arg1, f1070_arg2, true, "unfavorite_file_from_showcase_task_complete", function ()
				CoD.FileshareUtility.ShowToastForProcessingGroupShowcaseAction( f1070_arg2, CoD.FileshareUtility.ToastTypes.GROUP_UNFAVORITE )
				Close( f1070_arg0, f1070_arg2 )
			end, true )
		end
	end
end

function ToggleGroupShowcaseContentFeatured( f1073_arg0, f1073_arg1, f1073_arg2, f1073_arg3, f1073_arg4 )
	local f1073_local0 = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	if f1073_local0 and CoD.perController[f1073_arg2].selectedGroup then
		local f1073_local1 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f1073_arg2].selectedGroup, "groupId" ) )
		if not CoD.FileshareUtility.GetSelectedItemProperty( "featuredInCurrGroup" ) then
			Engine.FeatureFileInGroupsShowcase( f1073_arg2, f1073_local1, f1073_local0 )
			OpenGroupsNotifyPopup( f1073_arg4, f1073_arg1, f1073_arg2, true, "feature_file_in_showcase_task_complete", function ()
				RemoveGroupShowcaseItemFromUnfeaturedList( f1073_local1, f1073_local0 )
				CoD.FileshareUtility.ShowToastForProcessingGroupShowcaseAction( f1073_arg2, CoD.FileshareUtility.ToastTypes.GROUP_FEATURE )
				Close( f1073_arg0, f1073_arg2 )
			end, true, function ( f1075_arg0, f1075_arg1, f1075_arg2 )
				if Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( f1075_arg2 ), "groups.notificationMessage" ) ) == "GROUPS_ERROR_TEAM_SHOWCASE_COUNT_EXCEEDED_FEATURE" then
					CoD.perController[f1075_arg2].previousFileId = f1073_local0
					CoD.perController[f1075_arg2].previousFileName = CoD.FileshareUtility.GetSelectedItemProperty( "fileName" )
					CoD.perController[f1075_arg2].previousFileCategory = CoD.FileshareUtility.GetSelectedItemProperty( "fileCategory" )
					local f1075_local0 = GoBack( f1075_arg0, f1075_arg2 )
					OpenPopup( f1073_arg0, "GroupRemoveFeaturedItem", f1075_arg2 )
					Close( f1075_local0, f1075_arg2 )
				end
			end )
		else
			Engine.UnfeatureFileFromGroupsShowcase( f1073_arg2, f1073_local1, f1073_local0 )
			OpenGroupsNotifyPopup( f1073_arg4, f1073_arg1, f1073_arg2, true, "unfeature_file_from_showcase_task_complete", function ()
				AddGroupShowcaseItemToUnfeaturedList( f1073_local1, f1073_local0 )
				CoD.FileshareUtility.ShowToastForProcessingGroupShowcaseAction( f1073_arg2, CoD.FileshareUtility.ToastTypes.GROUP_UNFEATURE )
				Close( f1073_arg0, f1073_arg2 )
			end, true )
		end
	end
end

function SwitchGroupShowcaseContentFeatured( f1077_arg0, f1077_arg1, f1077_arg2, f1077_arg3 )
	local f1077_local0 = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	local f1077_local1 = CoD.perController[f1077_arg2].previousFileId
	local f1077_local2 = CoD.perController[f1077_arg2].previousFileName
	local f1077_local3 = CoD.perController[f1077_arg2].previousFileCategory
	CoD.perController[f1077_arg2].previousFileId = nil
	CoD.perController[f1077_arg2].previousFileName = nil
	CoD.perController[f1077_arg2].previousFileCategory = nil
	if f1077_local0 and f1077_local1 and CoD.perController[f1077_arg2].selectedGroup then
		local f1077_local4 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f1077_arg2].selectedGroup, "groupId" ) )
		Engine.UnfeatureFileFromGroupsShowcase( f1077_arg2, f1077_local4, f1077_local0, f1077_local1 )
		OpenGroupsNotifyPopup( f1077_arg3, f1077_arg1, f1077_arg2, true, "unfeature_file_from_showcase_task_complete", function ( f1078_arg0, f1078_arg1, f1078_arg2 )
			AddGroupShowcaseItemToUnfeaturedList( f1077_local4, f1077_local0 )
			OpenGroupsNotifyPopup( f1078_arg0, f1078_arg1, f1078_arg2, true, "feature_file_in_showcase_task_complete", function ()
				RemoveGroupShowcaseItemFromUnfeaturedList( f1077_local4, f1077_local1 )
				CoD.FileshareUtility.ShowToastForProcessingGroupShowcaseAction( f1078_arg2, CoD.FileshareUtility.ToastTypes.GROUP_FEATURE, f1077_local2, f1077_local3 )
			end, true )
		end, true )
	end
end

function RemoveFileFromGroupsShowcase( f1080_arg0, f1080_arg1, f1080_arg2, f1080_arg3, f1080_arg4 )
	local f1080_local0 = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	local f1080_local1 = Engine.GetModelValue( Engine.GetModel( CoD.perController[f1080_arg2].selectedGroup, "groupId" ) )
	if f1080_local0 then
		Engine.RemoveFileFromGroupsShowcase( f1080_arg2, f1080_local0, f1080_local1 )
		OpenGroupsNotifyPopup( f1080_arg4, f1080_arg1, f1080_arg2, true, "remove_file_from_showcase_task_complete", function ()
			CoD.FileshareUtility.ShowToastForProcessingGroupShowcaseAction( f1080_arg2, CoD.FileshareUtility.ToastTypes.GROUP_REMOVE )
			Close( f1080_arg0, f1080_arg2 )
		end, true )
	end
end

function PublishFileToGroupsShowcase( f1082_arg0, f1082_arg1, f1082_arg2, f1082_arg3, f1082_arg4 )
	local f1082_local0 = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	if f1082_local0 then
		Engine.PublishFileToGroupsShowcase( f1082_arg2, f1082_local0 )
		OpenGroupsNotifyPopup( f1082_arg4, f1082_arg1, f1082_arg2, true, "publish_file_to_showcase_task_complete", function ()
			CoD.FileshareUtility.ShowToastForProcessingGroupShowcaseAction( f1082_arg2, CoD.FileshareUtility.ToastTypes.GROUP_PUBLISH )
			Close( f1082_arg0, f1082_arg2 )
		end, true )
	end
end

function GroupsHandleGoBack( f1084_arg0, f1084_arg1, f1084_arg2 )
	ClearSelectedGroup( f1084_arg0, f1084_arg1, f1084_arg2 )
	CoD.perController[f1084_arg2].openMediaTabAfterClosingGroups = true
	GoBackAndOpenOverlayOnParent( f1084_arg0, "StartMenu_Main", f1084_arg2 )
end

function OpenPersonalizeCharacter( f1085_arg0, f1085_arg1, f1085_arg2, f1085_arg3, f1085_arg4 )
	CoD.LobbyBase.OpenPersonalizeCharacter( f1085_arg4, f1085_arg2 )
end

function OpenChooseCharacterLoadout( f1086_arg0, f1086_arg1, f1086_arg2, f1086_arg3, f1086_arg4 )
	CoD.CCUtility.customizationMode = Enum.eModes.MODE_MULTIPLAYER
	CoD.LobbyBase.OpenChooseCharacterLoadout( f1086_arg4, f1086_arg2, f1086_arg3 )
end

function EditClanTag( f1087_arg0, f1087_arg1, f1087_arg2 )
	ShowKeyboard( f1087_arg0, f1087_arg1, f1087_arg2, "KEYBOARD_TYPE_CLAN_TAG" )
end

function OpenPopupMenuByNameParam( f1088_arg0, f1088_arg1, f1088_arg2, f1088_arg3, f1088_arg4 )
	f1088_arg4:openPopup( f1088_arg3, f1088_arg2 )
end

function HandleDemoKeyboardComplete( f1089_arg0, f1089_arg1, f1089_arg2, f1089_arg3 )
	if f1089_arg3.modeName == f1089_arg1.keyboardName then
		f1089_arg1.Text:setText( f1089_arg3.text )
	end
end

function OpenDemoKeyboard( f1090_arg0, f1090_arg1, f1090_arg2, f1090_arg3, f1090_arg4 )
	if f1090_arg4 and f1090_arg4 ~= "" then
		Engine.Exec( f1090_arg2, "demo_keyboard " .. f1090_arg3 .. " " .. f1090_arg4 )
	else
		Engine.Exec( f1090_arg2, "demo_keyboard " .. f1090_arg3 )
	end
	f1090_arg1.keyboardName = f1090_arg3
end

function OpenDemoSaveKeyboard( f1091_arg0, f1091_arg1, f1091_arg2, f1091_arg3 )
	local f1091_local0 = nil
	local f1091_local1 = CoD.FileshareUtility.GetCurrentCategory()
	if f1091_local1 == "clip_private" then
		if f1091_arg3 == "name" then
			f1091_local0 = "clipName"
		elseif f1091_arg3 == "desc" then
			f1091_local0 = "clipDesc"
		end
	elseif f1091_local1 == "screenshot_private" then
		if f1091_arg3 == "name" then
			f1091_local0 = "screenshotName"
		elseif f1091_arg3 == "desc" then
			f1091_local0 = "screenshotDesc"
		end
	end
	if not f1091_local0 then
		return 
	else
		OpenDemoKeyboard( f1091_arg0, f1091_arg1, f1091_arg2, f1091_local0, "" )
	end
end

function StartMenuUploadClip( f1092_arg0, f1092_arg1, f1092_arg2, f1092_arg3, f1092_arg4 )
	local f1092_local0 = Engine.GetDemoStreamedDownloadProgress()
	if f1092_local0 < 100 then
		CoD.Menu.OpenDemoErrorPopup( f1092_arg0, {
			controller = event.controller,
			titleText = Engine.Localize( "MENU_NOTICE" ),
			messageText = Engine.Localize( "MPUI_DEMO_DOWNLOAD_IN_PROGRESS", math.floor( f1092_local0 ) )
		} )
		return 
	end
	Engine.ExecNow( f1092_arg2, "demo_updatesavepopupuimodels clip" )
	Engine.ExecNow( f1092_arg2, "setupThumbnailForFileshareSave clip" )
	if IsInGame() and ShowOutOfClipsWarning( f1092_arg2 ) then
		CoD.OverlayUtility.CreateOverlay( f1092_arg2, f1092_arg4, "ClipsUnavailableForPurchase" )
	else
		CoD.FileshareUtility.OpenPrivateUploadPopup( f1092_arg0, f1092_arg2, "clip_private", function ( f1093_arg0 )
			Engine.SaveAndUploadClip( f1093_arg0, 0 )
		end )
	end
end

function UploadClip_GoBack( f1094_arg0, f1094_arg1, f1094_arg2, f1094_arg3 )
	local f1094_local0 = GoBack( f1094_arg0, f1094_arg2 )
	ClearMenuSavedState( f1094_arg0 )
	if f1094_local0.menuName == "TimelineEditor" then
		Engine.Exec( f1094_arg2, "setupThumbnailsForManageSegments" )
	else
		ResetThumbnailViewer( f1094_arg2 )
	end
	if Engine.IsClipModified() == false and f1094_local0.menuName == "EndDemoPopup" then
		GoBack( f1094_local0, f1094_arg2 )
	end
	Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.uploadPopupOpen" ), false )
end

function StartMenuOpenManageSegments( f1095_arg0, f1095_arg1, f1095_arg2, f1095_arg3, f1095_arg4 )
	OpenPopupMenuByNameParam( f1095_arg0, f1095_arg1, f1095_arg2, "TimelineEditor", f1095_arg4 )
end

function StartMenuOpenCustomizeHighlightReel( f1096_arg0, f1096_arg1, f1096_arg2, f1096_arg3, f1096_arg4 )
	CoD.OverlayUtility.CreateOverlay( f1096_arg2, f1096_arg0, "DemoCustomizeHighlightReelPopup" )
end

function StartMenuJumpToStart( f1097_arg0, f1097_arg1, f1097_arg2, f1097_arg3, f1097_arg4 )
	Engine.Exec( f1097_arg2, "demo_jumptostart" )
	GoBack( f1097_arg0, f1097_arg2 )
end

function StartMenuEndDemo( f1098_arg0, f1098_arg1, f1098_arg2, f1098_arg3, f1098_arg4 )
	local f1098_local0 = f1098_arg0
	while f1098_local0 and not f1098_local0.openMenu do
		f1098_local0 = f1098_local0:getParent()
	end
	CoD.OverlayUtility.CreateOverlay( f1098_arg2, f1098_local0, "EndDemoPopup" )
end

function DemoSwitchPlayer( f1099_arg0, f1099_arg1 )
	if f1099_arg1 == nil or f1099_arg1 == "" then
		return 
	end
	local f1099_local0 = nil
	if f1099_arg1 == "next" then
		f1099_local0 = 0
	elseif f1099_arg1 == "prev" then
		f1099_local0 = 1
	end
	Engine.Exec( f1099_arg0, "demo_switchplayer " .. f1099_local0 )
end

function UpdateDemoTimeScale( f1100_arg0, f1100_arg1 )
	local f1100_local0 = CoD.DemoUtility.GetRoundedTimeScale()
	local f1100_local1 = tonumber( f1100_arg1 )
	local f1100_local2 = f1100_local0 + f1100_local1
	if not (f1100_local1 <= 0 or f1100_local2 > Dvar.demo_maxTimeScale:get()) or f1100_local1 < 0 and f1100_local2 >= 0.1 then
		Engine.Exec( f1100_arg0, "demo_timescale " .. f1100_local2 )
	end
end

function UpdateDemoCameraMode( f1101_arg0, f1101_arg1 )
	if f1101_arg1 == nil or f1101_arg1 == "" then
		return 
	end
	local f1101_local0 = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.cameraMode" ) )
	local f1101_local1 = nil
	if f1101_arg1 == "next" or f1101_arg1 == "cycle" then
		if f1101_local0 == Enum.demoCameraMode.DEMO_CAMERA_MODE_NONE then
			f1101_local1 = Enum.demoCameraMode.DEMO_CAMERA_MODE_THIRDPERSON
		elseif f1101_local0 == Enum.demoCameraMode.DEMO_CAMERA_MODE_THIRDPERSON then
			f1101_local1 = Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM
		elseif f1101_arg1 == "cycle" then
			f1101_local1 = Enum.demoCameraMode.DEMO_CAMERA_MODE_NONE
		else
			return 
		end
	elseif f1101_arg1 == "prev" then
		if f1101_local0 == Enum.demoCameraMode.DEMO_CAMERA_MODE_THIRDPERSON then
			f1101_local1 = Enum.demoCameraMode.DEMO_CAMERA_MODE_NONE
		elseif f1101_local0 == Enum.demoCameraMode.DEMO_CAMERA_MODE_FREECAM then
			f1101_local1 = Enum.demoCameraMode.DEMO_CAMERA_MODE_THIRDPERSON
		else
			return 
		end
	end
	Engine.SwitchDemoCameraMode( f1101_local1 )
end

function GetNextDemoFastForwardTimeScale()
	local f1102_local0 = CoD.DemoUtility.GetRoundedTimeScale()
	local f1102_local1 = nil
	if f1102_local0 >= 6 then
		f1102_local1 = 1
	elseif f1102_local0 >= 4 then
		f1102_local1 = 6
	elseif f1102_local0 >= 2 then
		f1102_local1 = 4
	elseif f1102_local0 >= 1 then
		f1102_local1 = 2
	else
		f1102_local1 = 1
	end
	return f1102_local1
end

function UpdateDemoFastForward( f1103_arg0 )
	local f1103_local0 = GetNextDemoFastForwardTimeScale()
	Engine.ExecNow( f1103_arg0, "demo_timescale " .. f1103_local0 )
	local f1103_local1 = Engine.GetModel( Engine.GetGlobalModel(), "demo.timeScale" )
	if f1103_local1 then
		Engine.SetModelValue( f1103_local1, f1103_local0 )
	end
	return f1103_local0
end

function DemoJumpBack( f1104_arg0 )
	Engine.Exec( f1104_arg0, "demo_back" )
end

function DemoUpdatePlayPause( f1105_arg0 )
	if Engine.IsDemoClipRecording() then
		Engine.Exec( f1105_arg0, "demo_pausecliprecord" )
	end
	if CoD.DemoUtility.GetRoundedTimeScale() >= 1.1 then
		local f1105_local0 = 1
		Engine.ExecNow( f1105_arg0, "demo_timescale " .. f1105_local0 )
		local f1105_local1 = Engine.GetModel( Engine.GetGlobalModel(), "demo.timeScale" )
		if f1105_local1 then
			Engine.SetModelValue( f1105_local1, f1105_local0 )
		end
	else
		CoD.DemoUtility.RunPauseCommand( f1105_arg0 )
	end
end

function DemoToggleDemoHud( f1106_arg0 )
	Engine.Exec( f1106_arg0, "demo_toggledemohud" )
end

function DemoCancelPreview( f1107_arg0 )
	Engine.Exec( f1107_arg0, "demo_cancelpreview" )
end

function DemoStartAutoDollyCamera( f1108_arg0 )
	CoD.DemoUtility.UnpauseIfPaused( f1108_arg0 )
	Engine.Exec( f1108_arg0, "demo_startautodollycam" )
end

function DemoStopAutoDollyCamera( f1109_arg0 )
	Engine.Exec( f1109_arg0, "demo_stopautodollycam" )
end

function DemoAddDollyCameraMarker( f1110_arg0 )
	Engine.Exec( f1110_arg0, "demo_adddollycammarker" )
end

function DemoEditDollyCameraMarker( f1111_arg0 )
	CoD.DemoUtility.SwitchToDollyCamMarker( f1111_arg0, -1 )
	CoD.DemoUtility.SetEditingDollyCameraMarker( f1111_arg0, true )
end

function DemoExitEditDollyCameraMarker( f1112_arg0 )
	Engine.Exec( f1112_arg0, "demo_updatedollycammarkerparameters " .. Engine.GetHighlightedCameraMarker() )
	CoD.DemoUtility.SetEditingDollyCameraMarker( f1112_arg0, false )
end

function DemoPlaceDollyCameraMarker( f1113_arg0 )
	Engine.Exec( f1113_arg0, "demo_applynewdollycammarkerposition 0" )
end

function DemoCancelPlaceDollyCameraMarker( f1114_arg0 )
	Engine.Exec( f1114_arg0, "demo_applynewdollycammarkerposition 1" )
end

function UpdateDollyCameraTimeScaleMode( f1115_arg0, f1115_arg1 )
	if f1115_arg1 == nil or f1115_arg1 == "" then
		return 
	end
	local f1115_local0 = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentDollyCamMarkerTimeScaleMode" )
	local f1115_local1 = Engine.GetModelValue( f1115_local0 )
	local f1115_local2 = nil
	if f1115_arg1 == "next" then
		if f1115_local1 == Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_MANUAL then
			f1115_local2 = Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_LINEAR
		elseif f1115_local1 == Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_LINEAR then
			f1115_local2 = Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_FIXED
		else
			return 
		end
	elseif f1115_arg1 == "prev" then
		if f1115_local1 == Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_LINEAR then
			f1115_local2 = Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_MANUAL
		elseif f1115_local1 == Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_FIXED then
			f1115_local2 = Enum.demoDollyCameraTimeScaleMode.DEMO_DOLLYCAM_TIMESCALE_MODE_LINEAR
		else
			return 
		end
	end
	Engine.SetModelValue( f1115_local0, f1115_local2 )
end

function UpdateDollyCameraTimeScale( f1116_arg0, f1116_arg1 )
	local f1116_local0 = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentDollyCamMarkerTimeScaleValue" )
	if not f1116_local0 then
		return 
	end
	local f1116_local1 = Engine.GetModelValue( f1116_local0 )
	local f1116_local2 = tonumber( f1116_arg1 )
	local f1116_local3 = f1116_local1 + f1116_local2
	if not (f1116_local2 <= 0 or f1116_local3 > Dvar.demo_maxTimeScale:get()) or f1116_local2 < 0 and f1116_local3 >= 0.1 then
		Engine.SetModelValue( f1116_local0, f1116_local3 )
	end
end

function DemoFreeCameraLockOnObject( f1117_arg0 )
	Engine.Exec( f1117_arg0, "demo_activatefreecameralockon" )
end

function DemoFreeCameraUnlockObject( f1118_arg0 )
	Engine.Exec( f1118_arg0, "demo_deactivatefreecameralockon" )
end

function DemoAddLightmanMarker( f1119_arg0 )
	Engine.Exec( f1119_arg0, "demo_addlightmanmarker" )
end

function DemoEditLightmanMarker( f1120_arg0 )
	CoD.DemoUtility.SwitchToLightmanMarker( f1120_arg0, -1 )
	CoD.DemoUtility.SetEditingLightmanMarker( f1120_arg0, true )
end

function DemoExitEditLightmanMarker( f1121_arg0 )
	Engine.Exec( f1121_arg0, "demo_updatelightmanmarkerparameters " .. Engine.GetHighlightedCameraMarker() )
	CoD.DemoUtility.SetEditingLightmanMarker( f1121_arg0, false )
end

function DemoPlaceLightmanMarker( f1122_arg0 )
	Engine.Exec( f1122_arg0, "demo_applynewlightmanmarkerposition 0" )
end

function DemoCancelPlaceLightmanMarker( f1123_arg0 )
	Engine.Exec( f1123_arg0, "demo_applynewlightmanmarkerposition 1" )
end

function UpdateLightmanLightMode( f1124_arg0, f1124_arg1 )
	if f1124_arg1 == nil or f1124_arg1 == "" then
		return 
	end
	local f1124_local0 = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightMode" )
	local f1124_local1 = Engine.GetModelValue( f1124_local0 )
	local f1124_local2 = nil
	if f1124_arg1 == "next" then
		if f1124_local1 == Enum.demoLightmanLightMode.DEMO_LIGHTMAN_LIGHT_MODE_OMNI then
			f1124_local2 = Enum.demoLightmanLightMode.DEMO_LIGHTMAN_LIGHT_MODE_SPOT
		else
			return 
		end
	elseif f1124_arg1 == "prev" then
		if f1124_local1 == Enum.demoLightmanLightMode.DEMO_LIGHTMAN_LIGHT_MODE_SPOT then
			f1124_local2 = Enum.demoLightmanLightMode.DEMO_LIGHTMAN_LIGHT_MODE_OMNI
		else
			return 
		end
	end
	Engine.SetModelValue( f1124_local0, f1124_local2 )
	Engine.Exec( f1124_arg0, "demo_updatelightmanmarkerparameters " .. Engine.GetHighlightedCameraMarker() )
end

function UpdateLightmanFloatParam( f1125_arg0, f1125_arg1, f1125_arg2 )
	local f1125_local0 = tonumber( f1125_arg2 ) > 0
	if not f1125_arg0.btnId then
		return 
	end
	local f1125_local1, f1125_local2 = nil
	if f1125_local0 then
		f1125_local1 = 0.5
	else
		f1125_local1 = -0.5
	end
	local f1125_local3 = 0.1
	local f1125_local4 = 10
	if f1125_arg0.btnId == "lightmanlightintensity" then
		f1125_local2 = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightIntensity" )
	elseif f1125_arg0.btnId == "lightmanlightrange" then
		f1125_local2 = Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightRange" )
	end
	if not f1125_local1 or not f1125_local2 then
		return 
	end
	local f1125_local5 = Engine.GetModelValue( f1125_local2 ) + f1125_local1
	if not (not f1125_local0 or f1125_local5 > f1125_local4) or not f1125_local0 and f1125_local3 <= f1125_local5 then
		Engine.SetModelValue( f1125_local2, f1125_local5 )
		Engine.Exec( f1125_arg1, "demo_updatelightmanmarkerparameters " .. Engine.GetHighlightedCameraMarker() )
	end
end

function StoreCurrentLightmanColor( f1126_arg0, f1126_arg1, f1126_arg2, f1126_arg3 )
	CoD.DemoUtility.CurrentLightmanColor = string.format( "%d %d %d", Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightColorR" ) ) * 255, Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightColorG" ) ) * 255, Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "demo.currentLightmanMarkerLightColorB" ) ) * 255 )
end

function SelectLightmanColor( f1127_arg0, f1127_arg1, f1127_arg2, f1127_arg3 )
	local f1127_local0 = Engine.GetModel( f1127_arg1:getModel(), "color" )
	if f1127_local0 then
		CoD.DemoUtility.SetCurrentLightmanColor( f1127_arg2, Engine.GetModelValue( f1127_local0 ) )
	end
end

function CancelLightmanColorSelection( f1128_arg0, f1128_arg1, f1128_arg2, f1128_arg3 )
	if not CoD.DemoUtility.CurrentLightmanColor then
		return 
	else
		CoD.DemoUtility.SetCurrentLightmanColor( f1128_arg2, CoD.DemoUtility.CurrentLightmanColor )
	end
end

function UpdateNumHighlightReelMomentsElementColor( f1129_arg0, f1129_arg1 )
	local f1129_local0 = CoD.DemoUtility.GetNumHighlightReelMomentsModel()
	local f1129_local1 = 0
	if f1129_local0 then
		f1129_local1 = Engine.GetModelValue( f1129_local0 )
	end
	if f1129_local1 <= 0 then
		f1129_arg0:setRGB( CoD.red.r, CoD.red.g, CoD.red.b )
	else
		f1129_arg0:setRGB( 1, 1, 1 )
	end
end

function DemoCancelHighlightReelCreation( f1130_arg0 )
	Engine.Exec( f1130_arg0, "demo_cancelhighlightreelcreation" )
end

function ResetThumbnailViewer( f1131_arg0 )
	Engine.ExecNow( f1131_arg0, "resetThumbnailViewer" )
end

function PreserveThumbnails( f1132_arg0, f1132_arg1 )
	if f1132_arg1 == true then
		Engine.ExecNow( f1132_arg0, "preservethumbnails 1" )
	else
		Engine.ExecNow( f1132_arg0, "preservethumbnails 0" )
	end
end

function TimelineEditorRefresh()
	local f1133_local0 = Engine.GetModel( Engine.GetGlobalModel(), "DemoSegments.refresh" )
	Engine.SetModelValue( f1133_local0, Engine.GetModelValue( f1133_local0 ) + 1 )
end

function TimelineEditorPreviewClip( f1134_arg0, f1134_arg1, f1134_arg2 )
	CoD.InGameMenu.CloseAllInGameMenus( f1134_arg0, {
		name = "close_all_ingame_menus",
		controller = f1134_arg2
	} )
	Engine.Exec( f1134_arg2, "demo_previewclip" )
end

function TimelineEditorFilmOptions( f1135_arg0, f1135_arg1, f1135_arg2 )
	OpenPopupWithPriority( f1135_arg0, "TimelineEditorFilmOptions", f1135_arg2, 100 )
end

function TimelineEditorChangeTransition( f1136_arg0, f1136_arg1, f1136_arg2 )
	local f1136_local0 = Engine.GetModel( f1136_arg1:getModel(), "segmentNumber" )
	if f1136_local0 then
		local f1136_local1 = Engine.GetModelValue( f1136_local0 ) - 1
		local f1136_local2 = tonumber( Engine.GetDemoSegmentInformation( f1136_local1, "transitionValue" ) ) + 1
		if f1136_local2 > Enum.demoClipTransition.DEMO_CLIP_TRANSITION_LAST then
			f1136_local2 = Enum.demoClipTransition.DEMO_CLIP_TRANSITION_FIRST
		end
		Engine.ExecNow( f1136_arg2, "demo_switchtransition " .. f1136_local1 .. " " .. f1136_local2 )
	end
end

function TimelineEditorPlaceSegment( f1137_arg0, f1137_arg1, f1137_arg2, f1137_arg3, f1137_arg4 )
	local f1137_local0 = CoD.DemoUtility.Timeline_GetSelectedSegmentModel()
	local f1137_local1 = Engine.GetModelValue( Engine.GetModel( f1137_local0, "segmentNumber" ) )
	if f1137_arg3 then
		local f1137_local2 = Engine.GetModelValue( f1137_arg1:getModel( f1137_arg2, "segmentNumber" ) )
		local f1137_local3 = f1137_local1 - 1
		local f1137_local4 = f1137_local2 - 1
		if f1137_local3 ~= f1137_local4 then
			Engine.ExecNow( f1137_arg4:getOwner(), "demo_movesegment " .. f1137_local3 .. " " .. f1137_local4 )
			CoD.DemoUtility.SetupDemoSegmentModel( f1137_local3 )
			CoD.DemoUtility.SetupDemoSegmentModel( f1137_local4 )
		end
	end
	Engine.SetModelValue( Engine.GetModel( f1137_local0, "selected" ), false )
	CoD.Timeline_RefreshStateAfterMove( f1137_arg4, f1137_arg1:getModel(), f1137_local0, f1137_arg3 )
end

function TimelineEditorSetupMoveSegment( f1138_arg0, f1138_arg1, f1138_arg2, f1138_arg3 )
	local f1138_local0 = f1138_arg1:getModel()
	CoD.DemoUtility.Timeline_SetSelectedSegmentModel( f1138_local0 )
	CoD.Timeline_RefreshState( f1138_arg3, f1138_local0, true )
end

function TimelineEditorUpdateTimeline( f1139_arg0, f1139_arg1, f1139_arg2, f1139_arg3, f1139_arg4 )
	local f1139_local0 = nil
	if f1139_arg3 == "gain_focus" then
		f1139_local0 = true
	else
		f1139_local0 = false
	end
	CoD.Timeline_RefreshState( f1139_arg4, f1139_arg1:getModel(), f1139_local0 )
end

function TimelineEditorUpdateHighlightedSegmentModel( f1140_arg0, f1140_arg1, f1140_arg2, f1140_arg3, f1140_arg4 )
	local f1140_local0 = nil
	if f1140_arg3 == "gain_focus" then
		f1140_local0 = true
	else
		f1140_local0 = false
	end
	local f1140_local1 = f1140_arg1:getModel()
	if not f1140_local1 then
		return 
	else
		Engine.SetModelValue( Engine.CreateModel( f1140_local1, "highlighted" ), f1140_local0 )
	end
end

function TimelineEditorKeyboardComplete( f1141_arg0, f1141_arg1, f1141_arg2, f1141_arg3 )
	Engine.SetModelValue( Engine.GetModel( CoD.DemoUtility.Timeline_GetHighlightedSegmentModel(), "name" ), f1141_arg3.input )
end

function IncreaseSafeAreaVertical( f1142_arg0, f1142_arg1, f1142_arg2 )
	if not CoD.SafeArea or not CoD.SafeArea.Maximum or not CoD.SafeArea.AdjustAmount then
		return 
	end
	local f1142_local0 = tonumber( Engine.ProfileValueAsString( f1142_arg2, "safeAreaTweakable_vertical" ) ) + CoD.SafeArea.AdjustAmount
	if f1142_local0 <= CoD.SafeArea.Maximum then
		Engine.SetProfileVar( f1142_arg2, "safeAreaTweakable_vertical", f1142_local0 )
	end
end

function DecreaseSafeAreaVertical( f1143_arg0, f1143_arg1, f1143_arg2 )
	if not CoD.SafeArea or not CoD.SafeArea.Maximum or not CoD.SafeArea.AdjustAmount then
		return 
	end
	local f1143_local0 = tonumber( Engine.ProfileValueAsString( f1143_arg2, "safeAreaTweakable_vertical" ) ) - CoD.SafeArea.AdjustAmount
	if CoD.SafeArea.Minimum <= f1143_local0 then
		Engine.SetProfileVar( f1143_arg2, "safeAreaTweakable_vertical", f1143_local0 )
	end
end

function IncreaseSafeAreaHorizontal( f1144_arg0, f1144_arg1, f1144_arg2 )
	if not CoD.SafeArea or not CoD.SafeArea.Maximum or not CoD.SafeArea.AdjustAmount then
		return 
	end
	local f1144_local0 = tonumber( Engine.ProfileValueAsString( f1144_arg2, "safeAreaTweakable_horizontal" ) ) + CoD.SafeArea.AdjustAmount
	if f1144_local0 <= CoD.SafeArea.Maximum then
		Engine.SetProfileVar( f1144_arg2, "safeAreaTweakable_horizontal", f1144_local0 )
	end
end

function DecreaseSafeAreaHorizontal( f1145_arg0, f1145_arg1, f1145_arg2 )
	if not CoD.SafeArea or not CoD.SafeArea.Maximum or not CoD.SafeArea.AdjustAmount then
		return 
	end
	local f1145_local0 = tonumber( Engine.ProfileValueAsString( f1145_arg2, "safeAreaTweakable_horizontal" ) ) - CoD.SafeArea.AdjustAmount
	if CoD.SafeArea.Minimum <= f1145_local0 then
		Engine.SetProfileVar( f1145_arg2, "safeAreaTweakable_horizontal", f1145_local0 )
	end
end

function EquipScorestreak( f1146_arg0, f1146_arg1, f1146_arg2 )
	local f1146_local0 = f1146_arg1:getModel( f1146_arg2, "itemIndex" )
	if f1146_local0 then
		local f1146_local1 = Engine.GetModelValue( f1146_local0 )
		if f1146_local1 ~= CoD.CACUtility.EmptyItemIndex then
			local f1146_local2 = CoD.perController[f1146_arg2].classModel
			if not CoD.CACUtility.GetAttachedItemSlot( f1146_local2, f1146_local1, CoD.CACUtility.KillstreakNameList ) then
				local f1146_local3 = CoD.CACUtility.FindFirstEmptySlotInList( f1146_local2, CoD.CACUtility.KillstreakNameList )
				if f1146_local3 then
					CoD.SetClassItem( f1146_arg2, 0, f1146_local3, f1146_local1 )
					CoD.CACUtility.GetCustomClassModel( f1146_arg2, 0, f1146_local2 )
					f1146_arg0:processEvent( {
						name = "update_state",
						menu = f1146_arg0
					} )
				else
					local f1146_local4 = OpenPopup( f1146_arg0, "ScorestreakOverCapacity", f1146_arg2 )
					f1146_local4:setModel( f1146_local2 )
					if f1146_local4.updateSelectedImage then
						f1146_local4:updateSelectedImage( f1146_local1 )
					end
					LUI.OverrideFunction_CallOriginalFirst( f1146_local4, "close", function ()
						if f1146_local4.lastRemovedSlot then
							CoD.SetClassItem( f1146_arg2, 0, f1146_local4.lastRemovedSlot, f1146_local1 )
							CoD.CACUtility.GetCustomClassModel( f1146_arg2, 0, f1146_local2 )
							f1146_arg0:processEvent( {
								name = "update_state",
								menu = f1146_arg0
							} )
						end
					end )
				end
			end
		end
	end
end

function RemoveScorestreak( f1148_arg0, f1148_arg1, f1148_arg2 )
	local f1148_local0 = f1148_arg1:getModel( f1148_arg2, "itemIndex" )
	if f1148_local0 then
		local f1148_local1 = Engine.GetModelValue( f1148_local0 )
		if f1148_local1 ~= CoD.CACUtility.EmptyItemIndex then
			local f1148_local2 = f1148_arg0:getModel()
			local f1148_local3 = CoD.CACUtility.GetAttachedItemSlot( f1148_local2, f1148_local1, CoD.CACUtility.KillstreakNameList )
			if f1148_local3 then
				f1148_arg0.lastRemovedSlot = f1148_local3
				CoD.SetClassItem( f1148_arg2, 0, f1148_local3, CoD.CACUtility.EmptyItemIndex )
				CoD.CACUtility.GetCustomClassModel( f1148_arg2, 0, f1148_local2 )
				f1148_arg0:processEvent( {
					name = "update_state",
					menu = f1148_arg0
				} )
			end
		end
	end
end

function RemoveAllScorestreaks( f1149_arg0, f1149_arg1 )
	local f1149_local0 = f1149_arg0:getModel()
	for f1149_local4, f1149_local5 in ipairs( CoD.CACUtility.KillstreakNameList ) do
		CoD.SetClassItem( f1149_arg1, 0, f1149_local5, CoD.CACUtility.EmptyItemIndex )
	end
	CoD.CACUtility.GetCustomClassModel( f1149_arg1, 0, f1149_local0 )
	f1149_arg0:processEvent( {
		name = "update_state",
		menu = f1149_arg0
	} )
end

function GoBackAndUpdateSelectedChallengesButton( f1150_arg0, f1150_arg1 )
	local f1150_local0 = GoBack( f1150_arg0, f1150_arg1 )
	f1150_local0:processEvent( {
		name = "set_selected_button",
		controller = f1150_arg1
	} )
	return f1150_local0
end

function Challenges_UpdateListFromTabChanged( f1151_arg0, f1151_arg1, f1151_arg2 )
	local f1151_local0 = f1151_arg1:getModel( f1151_arg2, "tabCategory" )
	if f1151_local0 then
		SetGlobalModelValue( "challengeCategory", Engine.GetModelValue( f1151_local0 ) )
		local f1151_local1 = f1151_arg0.TabFrame.framedWidget
		if f1151_local1 then
			f1151_local1 = f1151_arg0.TabFrame.framedWidget.CallingCardGrid
		end
		if f1151_local1 then
			f1151_local1:updateDataSource()
		end
	end
end

function CallingCards_SetPlayerBackground( f1152_arg0, f1152_arg1, f1152_arg2 )
	local f1152_local0 = Engine.GetModel( f1152_arg1:getModel(), "iconId" )
	if f1152_local0 ~= nil then
		local f1152_local1 = Engine.GetModelValue( f1152_local0 )
		if f1152_arg0.callingCardShowcaseSlot then
			Engine.SetCombatRecordBackgroundId( f1152_arg2, f1152_local1, f1152_arg0.callingCardShowcaseSlot )
			local f1152_local2 = Engine.GetModel( Engine.GetGlobalModel(), "CallingCardShowcaseUpdated" )
			if f1152_local2 then
				Engine.ForceNotifyModelSubscriptions( f1152_local2 )
			end
			GoBackToMenu( f1152_arg0, f1152_arg2, "CombatRecordMP" )
			CoD.perController[f1152_arg2].currentCallingCardTabElement = nil
		else
			SetEmblemBackground_Internal( f1152_arg2, f1152_local1 )
		end
		f1152_arg1:playSound( "list_action", f1152_arg2 )
	end
	ForceNotifyControllerModel( f1152_arg2, "identityBadge.xuid" )
end

function CallingCards_EmblemGetProfile( f1153_arg0, f1153_arg1, f1153_arg2 )
	Engine.ExecNow( f1153_arg2, "emblemGetProfile" )
	ForceNotifyControllerModel( f1153_arg2, "identityBadge.xuid" )
end

function CallingCards_GoBack( f1154_arg0, f1154_arg1 )
	if not IsLive() then
		Engine.CommitProfileChanges( f1154_arg1 )
	else
		CallingCard_TrackCWLEquip( f1154_arg1, "CallingCard" )
		UploadPublicProfile( f1154_arg0, f1154_arg1 )
	end
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "callingCardBreadcrumbChanged" ) )
end

function CallingCards_UpdateListFromTabChanged( f1155_arg0, f1155_arg1, f1155_arg2 )
	local f1155_local0 = f1155_arg1:getModel( f1155_arg2, "tabCategory" )
	if f1155_local0 then
		SetGlobalModelValue( "challengeGameMode", Engine.GetModelValue( f1155_local0 ) )
		CoD.perController[f1155_arg2].currentCallingCardTabElement = f1155_arg1
		local f1155_local1 = f1155_arg0.TabFrame.framedWidget
		if f1155_local1 then
			f1155_local1 = f1155_arg0.TabFrame.framedWidget.CallingCardGrid
		end
		if f1155_local1 then
			f1155_local1:updateDataSource()
		end
	end
end

function CallingCards_SetOld( f1156_arg0, f1156_arg1 )
	local f1156_local0 = CoD.SafeGetModelValue( f1156_arg0:getModel(), "iconId" )
	if f1156_local0 then
		Engine.SetEmblemBackgroundAsOld( f1156_arg1, f1156_local0 )
		if CoD.perController[f1156_arg1].currentCallingCardTabElement then
			local f1156_local1 = Engine.GetModel( CoD.perController[f1156_arg1].currentCallingCardTabElement:getModel(), "breadcrumbCount" )
			if f1156_local1 then
				Engine.SetModelValue( f1156_local1, math.max( 0, Engine.GetModelValue( f1156_local1 ) - 1 ) )
			end
		end
		if CoD.perController[f1156_arg1].currentCallingCardBlackMarketElement then
			local f1156_local1 = Engine.GetModel( CoD.perController[f1156_arg1].currentCallingCardBlackMarketElement:getModel(), "newCount" )
			if f1156_local1 then
				Engine.SetModelValue( f1156_local1, math.max( 0, Engine.GetModelValue( f1156_local1 ) - 1 ) )
			end
		end
	end
end

function OpenEnterPrestigeModeMenu( f1157_arg0, f1157_arg1, f1157_arg2 )
	if CheckIfFeatureIsBanned( f1157_arg1, LuaEnums.FEATURE_BAN.PRESTIGE ) then
		LuaUtils.UI_ShowErrorMessageDialog( f1157_arg1, GetFeatureBanInfo( f1157_arg1, LuaEnums.FEATURE_BAN.PRESTIGE ) )
		return 
	else
		OpenSystemOverlay( f1157_arg0, f1157_arg2, f1157_arg1, "EnterPrestigeMode", nil )
	end
end

function OpenPrestigeRefundTokensMenu( f1158_arg0, f1158_arg1, f1158_arg2 )
	if CheckIfFeatureIsBanned( f1158_arg1, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) then
		LuaUtils.UI_ShowErrorMessageDialog( f1158_arg1, GetFeatureBanInfo( f1158_arg1, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) )
		return 
	else
		OpenSystemOverlay( f1158_arg0, f1158_arg2, f1158_arg1, "PrestigeRefundTokens", nil )
	end
end

function OpenPrestigeFreshStartMenu( f1159_arg0, f1159_arg1, f1159_arg2 )
	if CheckIfFeatureIsBanned( f1159_arg1, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) then
		LuaUtils.UI_ShowErrorMessageDialog( f1159_arg1, GetFeatureBanInfo( f1159_arg1, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) )
		return 
	else
		OpenSystemOverlay( f1159_arg0, f1159_arg2, f1159_arg1, "PrestigeFreshStart1", nil )
	end
end

function OpenCustomizePrestigeMenu( f1160_arg0, f1160_arg1, f1160_arg2 )
	if CheckIfFeatureIsBanned( f1160_arg1, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) then
		LuaUtils.UI_ShowErrorMessageDialog( f1160_arg1, GetFeatureBanInfo( f1160_arg1, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) )
		return 
	elseif CoD.PrestigeUtility.GetPrestigeGameMode() == Enum.eModes.MODE_ZOMBIES then
		OpenOverlay( f1160_arg0, "Prestige_CustomizePrestigeIconZM", f1160_arg1, "", "" )
	else
		OpenOverlay( f1160_arg0, "Prestige_CustomizePrestigeIcon", f1160_arg1, "", "" )
	end
end

function OpenPermanentUnlockMenu( f1161_arg0, f1161_arg1, f1161_arg2 )
	if CheckIfFeatureIsBanned( f1161_arg1, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) then
		LuaUtils.UI_ShowErrorMessageDialog( f1161_arg1, GetFeatureBanInfo( f1161_arg1, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) )
		return 
	else
		CoD.PrestigeUtility.previousGameMode = CoD.gameMode
		CoD.PrestigeUtility.previousStatsMilestonePath = CoD.statsMilestonePath
		CoD.gameMode = "MP"
		CoD.statsMilestonePath = "gamedata/stats/mp/statsmilestones"
		SetHeadingKickerText( "MENU_PERMANENT_UNLOCKS" )
		CoD.PrestigeUtility.CreatePermanentUnlockTokenModel( f1161_arg1 )
		local f1161_local0 = Engine.CreateModel( Engine.GetModelForController( f1161_arg1 ), "PermanentlyUnlockClass" )
		CoD.CACUtility.GetCustomClassModel( f1161_arg1, 0, f1161_local0 )
		CoD.perController[f1161_arg1].classModel = f1161_local0
		OpenOverlay( f1161_arg0, "Prestige_PermanentUnlocks", f1161_arg1 )
	end
end

function ClosePermanentUnlockMenu( f1162_arg0, f1162_arg1, f1162_arg2 )
	CoD.gameMode = CoD.PrestigeUtility.previousGameMode
	CoD.statsMilestonePath = CoD.PrestigeUtility.previousStatsMilestonePath
	SendClientScriptNotify( f1162_arg1, "CustomClass_closed" .. CoD.GetLocalClientAdjustedNum( f1162_arg1 ), "" )
	GoBack( f1162_arg0, f1162_arg1 )
end

function OpenPermanentUnlockCategoryMenu( f1163_arg0, f1163_arg1, f1163_arg2, f1163_arg3, f1163_arg4 )
	local f1163_local0 = CoD.PrestigeUtility.GetContentCategoryData( f1163_arg3 )
	CoD.perController[f1163_arg2].weaponCategory = f1163_local0.weaponCategory
	NavigateToMenu( f1163_arg0, f1163_local0.menuName, true, f1163_arg2 )
end

function OpenPermanentWeaponUnlockCategoryMenu( f1164_arg0, f1164_arg1, f1164_arg2, f1164_arg3, f1164_arg4 )
	CoD.CraftUtility.Gunsmith.ParseDDL( f1164_arg2, Enum.StorageFileType.STORAGE_GUNSMITH )
	OpenPermanentUnlockCategoryMenu( f1164_arg0, f1164_arg1, f1164_arg2, f1164_arg3, f1164_arg4 )
end

function SetIsInPrestigeMenu( f1165_arg0 )
	CoD.PrestigeUtility.isInPermanentUnlockMenu = f1165_arg0
end

function OpenPermanentUnlockClassItemDialog( f1166_arg0, f1166_arg1, f1166_arg2 )
	CoD.OverlayUtility.CreateOverlay( f1166_arg2, f1166_arg0, "PermanentUnlockClassItem", f1166_arg2, Engine.GetModelValue( f1166_arg1:getModel( f1166_arg2, "itemIndex" ) ), nil )
end

function OpenPrestigeMasterDialogIfNeeded( f1167_arg0, f1167_arg1, f1167_arg2 )
	if not PlayerGainedPrestigeMaster( f1167_arg1, f1167_arg2 ) then
		return 
	else
		CoD.OverlayUtility.CreateOverlay( f1167_arg1, f1167_arg0, "PrestigeMasterNotification", f1167_arg1, nil )
		Engine.Exec( f1167_arg1, "PrestigeStatsMaster " .. tostring( f1167_arg2 ) )
		SaveLoadout( f1167_arg0, f1167_arg1 )
		Engine.Exec( f1167_arg1, "uploadstats " .. tostring( f1167_arg2 ) )
		Engine.Exec( f1167_arg1, "savegamerprofilestats" )
	end
end

function PermanentlyUnlockItem( f1168_arg0, f1168_arg1, f1168_arg2 )
	local f1168_local0 = nil
	local f1168_local1 = f1168_arg1.itemIndex
	if not f1168_local1 then
		f1168_local0 = f1168_arg1:getModel( f1168_arg2, "itemIndex" )
		if f1168_local0 then
			f1168_local1 = Engine.GetModelValue( f1168_local0 )
		end
	end
	if f1168_local1 then
		Engine.PermanentlyUnlockItem( f1168_arg2, f1168_local1, CoD.PrestigeUtility.GetPrestigeGameMode() )
		SaveLoadout( f1168_arg0, f1168_arg2 )
		UploadStats( f1168_arg0, f1168_arg2 )
		Engine.SendClientScriptNotify( f1168_arg2, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f1168_arg2 ), "purchased" )
	end
end

function SetParagonIcon( f1169_arg0, f1169_arg1, f1169_arg2 )
	local f1169_local0 = f1169_arg1:getModel( f1169_arg2, "iconId" )
	if not f1169_local0 then
		return 
	else
		local f1169_local1 = Engine.GetModelValue( f1169_local0 )
		local f1169_local2 = Engine.GetPlayerStats( f1169_arg2, CoD.STATS_LOCATION_NORMAL, CoD.PrestigeUtility.GetPrestigeGameMode() )
		f1169_local2.PlayerStatsList.PARAGON_ICON_ID.StatValue:set( f1169_local1 )
	end
end

function OpenAARIfNeeded( f1170_arg0, f1170_arg1 )
	if CanShowAAR( f1170_arg1 ) and IsAARValid( f1170_arg1 ) then
		local f1170_local0 = ""
		if IsCustomLobby() then
			f1170_local0 = "custom"
		elseif IsLAN() then
			f1170_local0 = "lan"
		else
			f1170_local0 = "public"
		end
		local f1170_local1 = Engine.GetMaxControllerCount()
		for self = 0, f1170_local1 - 1, 1 do
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( self ), "aarType" ), f1170_local0 )
		end
		if AutomaticallyOpenAAR( f1170_arg1 ) then
			local self = LUI.UITimer.new( 1000, "open_aar", true, f1170_arg0 )
			f1170_arg0:registerEventHandler( "open_aar", function ( element, event )
				if not CanShowAAR( f1170_arg1 ) then
					return 
				end
				Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1170_arg1 ), "doAARXPBarAnimation" ), true )
				if CoD.isZombie then
					if CoD.AARUtility.AnyRewardsEarnedDuringMatch( f1170_arg1 ) then
						OpenPrestigeMasterDialogIfNeeded( OpenOverlay( element, "RewardsOverlay", f1170_arg1 ), f1170_arg1, Enum.eModes.MODE_ZOMBIES )
					else
						OpenPrestigeMasterDialogIfNeeded( OpenOverlay( element, "ZMAAR", f1170_arg1 ), f1170_arg1, Enum.eModes.MODE_ZOMBIES )
					end
				elseif IsArenaMode() then
					OpenOverlay( element, "ArenaResult", f1170_arg1 )
				elseif CoD.AARUtility.AnyRewardsEarnedDuringMatch( f1170_arg1 ) then
					OpenPrestigeMasterDialogIfNeeded( OpenOverlay( element, "RewardsOverlay", f1170_arg1 ), f1170_arg1, Enum.eModes.MODE_MULTIPLAYER )
				else
					OpenPrestigeMasterDialogIfNeeded( OpenOverlay( element, "MPAAR", f1170_arg1 ), f1170_arg1, Enum.eModes.MODE_MULTIPLAYER )
				end
				local f1171_local0 = CoD.GetPlayerStats( f1170_arg1 )
				f1171_local0.AfterActionReportStats.lobbyPopup:set( "" )
			end )
			f1170_arg0:addElement( self )
		end
	end
end

function OpenAAR( f1172_arg0, f1172_arg1 )
	if CoD.isZombie then
		if CoD.AARUtility.AnyRewardsEarnedDuringMatch( f1172_arg1 ) then
			OpenOverlay( f1172_arg0, "RewardsOverlay", f1172_arg1 )
		else
			OpenOverlay( f1172_arg0, "ZMAAR", f1172_arg1 )
		end
	else
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1172_arg1 ), "doAARXPBarAnimation" ), true )
		if IsArenaMode() then
			OpenOverlay( f1172_arg0, "ArenaResult", f1172_arg1 )
		elseif CoD.AARUtility.AnyRewardsEarnedDuringMatch( f1172_arg1 ) then
			OpenOverlay( f1172_arg0, "RewardsOverlay", f1172_arg1 )
		else
			OpenOverlay( f1172_arg0, "MPAAR", f1172_arg1 )
		end
	end
end

function SetStableStatsBuffer( f1173_arg0 )
	Engine.MakeStableStatsBufferForController( f1173_arg0 )
end

function SurveyShouldShow( f1174_arg0 )
	local f1174_local0 = CoD.GetPlayerStats( f1174_arg0 )
	local f1174_local1 = tonumber( f1174_local0.AfterActionReportStats.surveyId:get() )
	if tonumber( f1174_local0.AfterActionReportStats.demoFileID:get() ) == 0 then
		return false
	elseif f1174_local1 == 0 then
		return false
	else
		return true
	end
end

function GoBackAndShowMatchSurveyIfNecessary( f1175_arg0, f1175_arg1 )
	local f1175_local0 = GoBack( f1175_arg0, f1175_arg1 )
	local f1175_local1 = Engine.CreateModel( Engine.GetModelForController( f1175_arg1 ), "lobbyRoot.showPostMatchSurvey" )
	if Engine.GetModelValue( f1175_local1 ) == true and SurveyShouldShow( f1175_arg1 ) == true then
		Engine.SetModelValue( f1175_local1, false )
		CoD.OverlayUtility.CreateOverlay( f1175_arg1, f1175_local0, "PostMatchSurvey" )
	end
end

function CloseCPAAR( f1176_arg0, f1176_arg1 )
	CoD.perController[f1176_arg1].lastAARMapName = Dvar.ui_mapname:get()
	CoD.perController[f1176_arg1].fromMaxLevelMessage = false
end

function PlayArenaChallengeToastsOnClipOver( f1177_arg0, f1177_arg1 )
	if ArenaChallengesEnabled() then
		f1177_arg0:registerEventHandler( "clip_over", function ( element, event )
			CoD.ArenaUtility.PlayRecentArenaChallengeToasts( f1177_arg1 )
		end )
	end
end

function OpenMOTDPopup( f1179_arg0, f1179_arg1, f1179_arg2, f1179_arg3, f1179_arg4 )
	if f1179_arg3 ~= nil then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1179_arg2 ), "MOTDMenu.ActionSource" ), f1179_arg3 )
	end
	local f1179_local0 = f1179_arg4:openOverlay( "MOTD", f1179_arg2 )
	f1179_local0.crm_message_id = Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "MtxCommsMOTD" ), "messageID" ) )
	Engine.ReportMarketingMessageViewed( f1179_arg2, "motd" )
	LUI.CoDMetrics.CRMMessageImpression( f1179_arg0, f1179_arg2, "motd" )
	if not ShouldPresentMOTDBanner( f1179_arg2, f1179_local0 ) then
		f1179_local0.motdFooter:close()
	else
		Engine.ReportMarketingMessageViewed( f1179_arg2, "registration" )
		LUI.CoDMetrics.CRMMessageImpression( f1179_arg0, f1179_arg2, "registration" )
	end
end

function MOTDPopupAcceptAction( f1180_arg0, f1180_arg1, f1180_arg2, f1180_arg3, f1180_arg4 )
	LUI.CoDMetrics.CRMMessageInteraction( f1180_arg0, f1180_arg2, "motd" )
	if Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f1180_arg2 ), "MOTDMenu.ActionSource" ) ) == "FeaturedWidget" then
		GoBack( f1180_arg4, f1180_arg2 )
		return 
	elseif LuaUtils.IsBetaBuild() then
		if IsFirstTimeSetup( f1180_arg2, Enum.eModes.MODE_MULTIPLAYER ) then
			OpenMPFirstTimeFlow( f1180_arg0, nil, f1180_arg2, nil, f1180_arg0 )
		else
			NavigateToLobby_FirstTimeFlowMP( f1180_arg0, nil, f1180_arg2, f1180_arg4 )
		end
	else
		local f1180_local0 = Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f1180_arg2 ), "MOTDMenu.ActionSource" ) )
		if f1180_local0 == "FeaturedWidget" then
			GoBack( f1180_arg4, f1180_arg2 )
			return 
		elseif f1180_local0 == "LoginReward" then
			OpenLoginRewardPopup( GoBack( f1180_arg4, f1180_arg2 ), f1180_arg2 )
			return 
		end
		NavigateToLobby( f1180_arg0, "ModeSelect", false, f1180_arg2 )
	end
	SendClientScriptMenuChangeNotify( f1180_arg2, f1180_arg4, false )
	Close( f1180_arg0, f1180_arg2 )
end

function OpenLoginRewardPopup( f1181_arg0, f1181_arg1 )
	CoD.OverlayUtility.CreateOverlay( f1181_arg1, f1181_arg0, "LoginRewardOverlay" )
end

function OpenZMDLCPurchaseRewardPopup( f1182_arg0, f1182_arg1, f1182_arg2 )
	local f1182_local0 = nil
	if ShouldShowZMHDGobbleGumPopup( f1182_arg1, CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_PS4_INDEX_ID ) then
		f1182_local0 = "ZMHDGobbleGumPS4"
	elseif ShouldShowZMHDGobbleGumPopup( f1182_arg1, CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_XB1_INDEX_ID ) then
		f1182_local0 = "ZMHDGobbleGumXB1"
	elseif ShouldShowURMFirstTimePopup( f1182_arg1 ) then
		f1182_local0 = "URMFirstTime"
	end
	SetNextPreStartPopup( f1182_arg1, f1182_local0 )
	CoD.OverlayUtility.CreateOverlay( f1182_arg1, f1182_arg0, "ZMDLCPurchaseRewardOverlay", f1182_arg1, f1182_arg2 )
end

function OpenZMHDPurchaseRewardPopup( f1183_arg0, f1183_arg1 )
	local f1183_local0 = nil
	if ShouldShowZMHDGobbleGumPopup( f1183_arg1, CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_PS4_INDEX_ID ) then
		f1183_local0 = "ZMHDGobbleGumPS4"
	elseif ShouldShowZMHDGobbleGumPopup( f1183_arg1, CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_XB1_INDEX_ID ) then
		f1183_local0 = "ZMHDGobbleGumXB1"
	elseif ShouldShowURMFirstTimePopup( f1183_arg1 ) then
		f1183_local0 = "URMFirstTime"
	end
	SetNextPreStartPopup( f1183_arg1, f1183_local0 )
	CoD.OverlayUtility.CreateOverlay( f1183_arg1, f1183_arg0, "ZMHDPurchaseRewardOverlay" )
end

function OpenZMHDGobbleGumPopup( f1184_arg0, f1184_arg1, f1184_arg2 )
	local f1184_local0 = nil
	local f1184_local1 = 0
	if f1184_arg2 == CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_PS4_INDEX_ID then
		f1184_local1 = CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_PS4_SKU_ID
		if ShouldShowZMHDGobbleGumPopup( f1184_arg1, CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_XB1_INDEX_ID ) then
			f1184_local0 = "ZMHDGobbleGumXB1"
		elseif ShouldShowURMFirstTimePopup( f1184_arg1 ) then
			f1184_local0 = "URMFirstTime"
		end
	elseif f1184_arg2 == CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_XB1_INDEX_ID then
		f1184_local1 = CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_XB1_SKU_ID
		if ShouldShowURMFirstTimePopup( f1184_arg1 ) then
			f1184_local0 = "URMFirstTime"
		end
	end
	SetNextPreStartPopup( f1184_arg1, f1184_local0 )
	CoD.OverlayUtility.CreateOverlay( f1184_arg1, f1184_arg0, "ZMHDGobbleGumOverlay", f1184_arg1, {
		index = f1184_arg2,
		skuId = f1184_local1
	} )
end

function OpenURMFirstTimePopup( f1185_arg0, f1185_arg1 )
	CoD.OverlayUtility.CreateOverlay( f1185_arg1, f1185_arg0, "UltraRareMegaPurchaseOverlay", f1185_arg1, {
		isFirstTime = true,
		cost = 0,
		skuId = CoD.BubbleGumBuffUtility.URM_FIRST_TIME_SKU_ID
	} )
end

function GoThroughZMHDPopups( f1186_arg0, f1186_arg1 )
	if Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "skipZMHDPopups" ) ) then
		return 
	end
	local f1186_local0 = {}
	if ShouldShowZMDLCPurchaseRewardPopup( f1186_arg1, f1186_local0 ) then
		OpenZMDLCPurchaseRewardPopup( f1186_arg0, f1186_arg1, f1186_local0 )
	elseif ShouldShowZMHDPurchaseRewardPopup( f1186_arg1 ) then
		OpenZMHDPurchaseRewardPopup( f1186_arg0, f1186_arg1 )
	elseif ShouldShowZMHDGobbleGumPopup( f1186_arg1, CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_PS4_INDEX_ID ) then
		OpenZMHDGobbleGumPopup( f1186_arg0, f1186_arg1, CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_PS4_INDEX_ID )
	elseif ShouldShowZMHDGobbleGumPopup( f1186_arg1, CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_XB1_INDEX_ID ) then
		OpenZMHDGobbleGumPopup( f1186_arg0, f1186_arg1, CoD.BubbleGumBuffUtility.ZMHD_RELEASE_PROMO_XB1_INDEX_ID )
	elseif ShouldShowURMFirstTimePopup( f1186_arg1 ) then
		OpenURMFirstTimePopup( f1186_arg0, f1186_arg1 )
	end
end

function OpenCRMFeaturedPopup( f1187_arg0, f1187_arg1, f1187_arg2, f1187_arg3, f1187_arg4 )
	if f1187_arg3 == "MOTDBanner" then
		local f1187_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "CRMPopup" )
		Engine.SetModelValue( Engine.CreateModel( f1187_local0, "location" ), "registration" )
		Engine.SetModelValue( Engine.CreateModel( f1187_local0, "actionSource" ), f1187_arg3 )
	elseif f1187_arg3 == "Featured" then
		local f1187_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "CRMPopup" )
		Engine.SetModelValue( Engine.CreateModel( f1187_local0, "location" ), "crm_featured" )
		Engine.SetModelValue( Engine.CreateModel( f1187_local0, "actionSource" ), f1187_arg3 )
	end
	OpenOverlay( f1187_arg4, "CRMPopup", f1187_arg2 )
end

function CRMFeaturedPopupActionHandler( f1188_arg0, f1188_arg1, f1188_arg2, f1188_arg3, f1188_arg4 )
	local f1188_local0 = nil
	f1188_local0 = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "CRMPopup.action" ) )
	local f1188_local1 = Engine.GetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "CRMPopup.location" ) )
	if f1188_local0 ~= nil and f1188_local0 ~= "" then
		LUI.CoDMetrics.CRMMessageInteraction( f1188_arg0, f1188_arg2, f1188_local1 )
		if LUI.startswith( f1188_local0, "store" ) then
			local f1188_local2 = GoBack( f1188_arg0, f1188_arg2 )
			if CoD.isPC then
				OpenSteamStore( f1188_arg0, f1188_arg1, f1188_arg2, "CRMFeaturedPopup", f1188_local2 )
			else
				CoD.StoreUtility.SetupFocusCategory( f1188_arg2, f1188_local0 )
				OpenStore( f1188_arg0, f1188_arg1, f1188_arg2, "CRMFeaturedPopup", f1188_local2 )
			end
		elseif f1188_local0 == "blackmarket" then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "blackmarketOpenSource" ), Engine.GetCurrentMode() )
			Engine.SwitchMode( f1188_arg2, "mp" )
			OpenBlackMarket( GoBack( f1188_arg0, f1188_arg2 ), nil, f1188_arg2 )
		elseif f1188_local0 == "drmonty" then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "megachewOpenSource" ), Engine.GetCurrentMode() )
			Engine.SwitchMode( f1188_arg2, "zm" )
			local f1188_local2 = GoBack( f1188_arg0, f1188_arg2 )
			OpenMegaChewFactorymenu( f1188_arg0, f1188_arg1, f1188_arg2, f1188_local2.name, f1188_local2 )
		elseif f1188_local0 == "contracts" then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "contractsOpenSource" ), Engine.GetCurrentMode() )
			Engine.SwitchMode( f1188_arg2, "mp" )
			local f1188_local2 = GoBack( f1188_arg0, f1188_arg2 )
			LuaUtils.CycleContracts()
			OpenOverlay( f1188_local2, "BM_Contracts", f1188_arg2 )
		elseif f1188_local0 == "promo" then
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "promoOpenSource" ), Engine.GetCurrentMode() )
			Engine.SwitchMode( f1188_arg2, "mp" )
			OpenOverlay( GoBack( f1188_arg0, f1188_arg2 ), "RoadToCWL", f1188_arg2 )
		end
	end
end

function HandleGoBackFromBlackMarket( f1189_arg0, f1189_arg1, f1189_arg2, f1189_arg3, f1189_arg4 )
	local f1189_local0 = Engine.GetModel( Engine.GetGlobalModel(), "blackmarketOpenSource" )
	local f1189_local1 = Engine.GetCurrentMode()
	if f1189_local0 ~= nil then
		local f1189_local2 = Engine.GetModelValue( f1189_local0 )
		if f1189_local2 ~= f1189_local1 then
			Engine.SwitchMode( f1189_arg2, f1189_local2 )
		end
		Engine.UnsubscribeAndFreeModel( f1189_local0 )
	end
end

function HandleGoBackFromMegaChew( f1190_arg0, f1190_arg1, f1190_arg2, f1190_arg3, f1190_arg4 )
	local f1190_local0 = Engine.GetModel( Engine.GetGlobalModel(), "megachewOpenSource" )
	local f1190_local1 = Engine.GetCurrentMode()
	if f1190_local0 ~= nil then
		local f1190_local2 = Engine.GetModelValue( f1190_local0 )
		if f1190_local2 ~= f1190_local1 then
			Engine.SwitchMode( f1190_arg2, f1190_local2 )
		end
		Engine.UnsubscribeAndFreeModel( f1190_local0 )
	end
end

function HandleGoBackFromCookbook( f1191_arg0, f1191_arg1, f1191_arg2, f1191_arg3, f1191_arg4 )
	local f1191_local0 = Engine.GetModel( Engine.GetGlobalModel(), "cookbookRecipeOpenSource" )
	local f1191_local1 = Engine.GetCurrentMode()
	if f1191_local0 ~= nil then
		local f1191_local2 = Engine.GetModelValue( f1191_local0 )
		if f1191_local2 ~= f1191_local1 then
			Engine.SwitchMode( f1191_arg2, f1191_local2 )
		end
		Engine.UnsubscribeAndFreeModel( f1191_local0 )
	end
end

function HandleGoBackFromDailyChallenge( f1192_arg0, f1192_arg1, f1192_arg2, f1192_arg3, f1192_arg4 )
	local f1192_local0 = Engine.GetModel( Engine.GetGlobalModel(), "dailyChallengeOpenSource" )
	local f1192_local1 = Engine.GetCurrentMode()
	if f1192_local0 ~= nil then
		local f1192_local2 = Engine.GetModelValue( f1192_local0 )
		if f1192_local2 ~= f1192_local1 then
			Engine.SwitchMode( f1192_arg2, f1192_local2 )
		end
		Engine.UnsubscribeAndFreeModel( f1192_local0 )
	end
end

function HandleGoBackFromContracts( f1193_arg0, f1193_arg1, f1193_arg2, f1193_arg3, f1193_arg4 )
	local f1193_local0 = Engine.GetModel( Engine.GetGlobalModel(), "contractsOpenSource" )
	local f1193_local1 = Engine.GetCurrentMode()
	if f1193_local0 ~= nil then
		local f1193_local2 = Engine.GetModelValue( f1193_local0 )
		if f1193_local2 ~= f1193_local1 then
			Engine.SwitchMode( f1193_arg2, f1193_local2 )
		end
		Engine.UnsubscribeAndFreeModel( f1193_local0 )
	end
end

function HandleGoBackFromPromo( f1194_arg0, f1194_arg1, f1194_arg2, f1194_arg3, f1194_arg4 )
	local f1194_local0 = Engine.GetModel( Engine.GetGlobalModel(), "promoOpenSource" )
	local f1194_local1 = Engine.GetCurrentMode()
	if f1194_local0 ~= nil then
		local f1194_local2 = Engine.GetModelValue( f1194_local0 )
		if f1194_local2 ~= f1194_local1 then
			Engine.SwitchMode( f1194_arg2, f1194_local2 )
		end
		Engine.UnsubscribeAndFreeModel( f1194_local0 )
	end
end

function GoToModeSelectFromCRMPopup( f1195_arg0, f1195_arg1, f1195_arg2 )
	if Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f1195_arg1 ), "MOTDMenu.ActionSource" ) ) == "FeaturedWidget" then
		GoBack( f1195_arg2, f1195_arg1 )
		return 
	else
		NavigateToLobby( f1195_arg0, "ModeSelect", false, f1195_arg1 )
		SendClientScriptMenuChangeNotify( f1195_arg1, f1195_arg2, false )
		Close( f1195_arg0, f1195_arg1 )
	end
end

function BubbleGumBuffSelectTabChanged( f1196_arg0, f1196_arg1, f1196_arg2 )
	local f1196_local0 = f1196_arg1.filter
	if f1196_local0 then
		CoD.perController[f1196_arg2].weaponCategory = f1196_local0
		DataSources.Unlockables.setCurrentFilterItem( f1196_local0 )
		f1196_arg0.selectionList:updateDataSource()
	end
end

function EquipBubblegumPack( f1197_arg0, f1197_arg1, f1197_arg2 )
	Engine.EquipBubbleGumPack( f1197_arg2, Engine.GetModelValue( f1197_arg1:getModel( f1197_arg2, "bgbPackIndex" ) ) )
end

function EquipBubblegumBuff( f1198_arg0, f1198_arg1, f1198_arg2 )
	local f1198_local0 = Engine.GetEquippedBubbleGumPack( f1198_arg2 )
	local f1198_local1 = CoD.perController[f1198_arg2].bgbIndex
	local f1198_local2 = Engine.GetModelValue( f1198_arg1:getModel( f1198_arg2, "itemIndex" ) )
	local f1198_local3, f1198_local4 = nil
	for f1198_local5 = 0, CoD.BubbleGumBuffs.NumBuffsPerPack - 1, 1 do
		if Engine.GetBubbleGumBuff( f1198_arg2, f1198_local0, f1198_local5 ) == f1198_local2 then
			f1198_local4 = f1198_local5
			f1198_local3 = Engine.GetBubbleGumBuff( f1198_arg2, f1198_local0, f1198_local1 )
			break
		end
	end
	Engine.SetBubbleGumBuff( f1198_arg2, f1198_local0, f1198_local1, f1198_local2 )
	if f1198_local4 then
		Engine.SetBubbleGumBuff( f1198_arg2, f1198_local0, f1198_local4, f1198_local3 )
	end
end

function ShowBubblegumBuffModel( f1199_arg0, f1199_arg1, f1199_arg2 )
	local f1199_local0 = Engine.GetModelValue( f1199_arg1:getModel( f1199_arg2, "itemIndex" ) )
	Engine.SendClientScriptNotify( f1199_arg2, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f1199_arg2 ), Engine.GetItemGroup( f1199_local0, Enum.eModes.MODE_ZOMBIES ), "p7_" .. Engine.GetItemRef( f1199_local0, Enum.eModes.MODE_ZOMBIES ) .. "_ui", "select01", nil, nil, true, false )
end

function SelectBubblegumBuff( f1200_arg0, f1200_arg1, f1200_arg2 )
	CoD.perController[f1200_arg2].bgbIndex = Engine.GetModelValue( f1200_arg1:getModel( f1200_arg2, "bgbIndex" ) )
end

function SetBubbleGumPackNameFromPackIndex( f1201_arg0, f1201_arg1, f1201_arg2 )
	return Engine.SetBubbleGumPackName( f1201_arg0, f1201_arg1, f1201_arg2 )
end

function MegaChewFactoryFocusChanged( f1202_arg0, f1202_arg1, f1202_arg2 )
	local f1202_local0 = f1202_arg1:getModel( f1202_arg2, "index" )
	if f1202_local0 then
		Engine.SendClientScriptNotify( f1202_arg2, "mega_chew_update", "focus_changed", Engine.GetModelValue( f1202_local0 ) )
	end
end

function MegaChewFactoryPurchase( f1203_arg0, f1203_arg1, f1203_arg2 )
	local f1203_local0 = f1203_arg1:getModel( f1203_arg2, "price" )
	if f1203_local0 and Engine.CreateModel( Engine.CreateModel( Engine.GetModelForController( f1203_arg2 ), "MegaChewFactory" ), "getResultsOrKeepWaiting" ) then
		local f1203_local1 = Engine.GetModelValue( f1203_local0 )
		Engine.SendClientScriptNotify( f1203_arg2, "mega_chew_update", "purchased", Engine.GetModelValue( f1203_local0 ), f1203_arg2 )
	end
end

function UpdateMenuVialModel( f1204_arg0, f1204_arg1, f1204_arg2 )
	local f1204_local0 = Engine.GetModelValue( f1204_arg1:getModel( f1204_arg2, "vials" ) )
	local f1204_local1 = Engine.GetModelValue( f1204_arg1:getModel( f1204_arg2, "image" ) )
	Engine.SetModelValue( f1204_arg0:getModel( f1204_arg2, "vials" ), f1204_local0 )
	Engine.SetModelValue( f1204_arg0:getModel( f1204_arg2, "image" ), f1204_local1 )
end

function UpdateOverlayImageWithElementImage( f1205_arg0, f1205_arg1, f1205_arg2 )
	local f1205_local0 = Engine.GetModelValue( f1205_arg1:getModel( f1205_arg2, "image" ) )
	if f1205_local0 then
		Engine.SetModelValue( f1205_arg0:getModel( f1205_arg2, "image" ), f1205_local0 )
	end
end

function SetSeenMegaChewFactoryFirstTimePopup( f1206_arg0 )
	local f1206_local0 = Engine.StorageGetBuffer( f1206_arg0, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
	if f1206_local0 then
		f1206_local0.extraBools[0]:set( 1 )
	end
end

function SetSeenNewtonsCookbookFirstTimePopup( f1207_arg0 )
	local f1207_local0 = Engine.StorageGetBuffer( f1207_arg0, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
	if f1207_local0 then
		f1207_local0.extraBools[2]:set( 1 )
		UploadStats( nil, f1207_arg0 )
	end
end

function FocusWeaponBuildKit( f1208_arg0, f1208_arg1, f1208_arg2 )
	Gunsmith_GainFocus( f1208_arg0, f1208_arg1, f1208_arg2 )
	local f1208_local0 = CoD.GetCustomization( f1208_arg2, "weapon_index" )
	if not f1208_local0 then
		return 
	else
		local f1208_local1 = CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList( f1208_local0 )
		local f1208_local2 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f1208_arg2, f1208_local1[#f1208_local1].variantIndex )
		local f1208_local3 = Engine.CreateModel( Engine.GetModelForController( f1208_arg2 ), "WeaponBuildKitVariant" )
		DataSources.GunsmithVariantList.createVariantModel( f1208_arg2, f1208_local0, f1208_local2, 1, f1208_local3 )
		CoD.perController[f1208_arg2].gunsmithVariantModel = f1208_local3
		CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f1208_arg2, CoD.perController[f1208_arg2].gunsmithVariantModel )
		f1208_arg0:setModel( f1208_local3 )
		f1208_arg0.WeaponBuildKitsAttachmentsPreview:processEvent( {
			name = "update_state",
			controller = f1208_arg2
		} )
	end
end

function SelectWeaponBuildKitCategory( f1209_arg0, f1209_arg1 )
	local f1209_local0 = Engine.GetModel( f1209_arg0:getModel(), "categoryRef" )
	if f1209_local0 then
		local f1209_local1 = Engine.GetModelValue( f1209_local0 )
		DataSources.Unlockables.setCurrentFilterItem( f1209_local1 )
		CoD.perController[f1209_arg1].weaponCategory = f1209_local1
	end
end

function SelectWeaponBuildKit( f1210_arg0, f1210_arg1, f1210_arg2 )
	Gunsmith_BrowseVariants( f1210_arg0, f1210_arg1, f1210_arg2 )
	local f1210_local0 = CoD.GetCustomization( f1210_arg2, "weapon_index" )
	if not f1210_local0 then
		return 
	end
	local f1210_local1 = CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList( f1210_local0 )
	local f1210_local2 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f1210_arg2, f1210_local1[#f1210_local1].variantIndex )
	local f1210_local3 = Engine.CreateModel( Engine.GetModelForController( f1210_arg2 ), "WeaponBuildKitVariant" )
	DataSources.GunsmithVariantList.createVariantModel( f1210_arg2, f1210_local0, f1210_local2, 1, f1210_local3 )
	CoD.perController[f1210_arg2].gunsmithVariantModel = f1210_local3
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f1210_arg2, CoD.perController[f1210_arg2].gunsmithVariantModel )
	if not CoD.CraftUtility.Gunsmith.IsVariantIndexOccupied( f1210_local2.variantIndex ) then
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1210_arg2 ), "Gunsmith.validVariantNameEntered" ), false )
		local f1210_local4 = Engine.GetModel( f1210_local3, "variantTextEntry" )
		if f1210_local4 then
			Engine.SetModelValue( f1210_local4, "" )
			Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f1210_arg2 ), "Gunsmith.validVariantNameEntered" ), true )
		end
		Engine.SetModelValue( Engine.GetModel( f1210_local3, "variantName" ), Engine.GetModelValue( f1210_local4 ) )
	end
	OpenOverlay( f1210_arg0, "WeaponBuildKitsCustomizeVariant", f1210_arg2 )
	Gunsmith_ChooseWeaponList( f1210_arg0, f1210_arg1, f1210_arg2 )
end

function SaveWeaponBuildKit( f1211_arg0, f1211_arg1, f1211_arg2 )
	local f1211_local0 = CoD.perController[f1211_arg2].gunsmithVariantModel
	CoD.CraftUtility.Gunsmith.WriteVaraintDataToDDL( f1211_arg2, f1211_arg0:getModel() )
	local f1211_local1 = f1211_arg0
	local f1211_local2 = GoBackAndUpdateStateOnPreviousMenu( f1211_local1, f1211_arg2 )
	ClearMenuSavedState( f1211_local1 )
	local f1211_local3 = Engine.GetModelValue( Engine.GetModel( f1211_local0, "variantIndex" ) )
	f1211_local2.variantSelector.variantList:updateDataSource( true )
	f1211_local2.variantSelector.variantList:findItem( {
		variantIndex = f1211_local3
	}, nil, true, nil )
	CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant( f1211_arg2, f1211_local0 )
end

function SetMap( f1212_arg0, f1212_arg1, f1212_arg2 )
	local f1212_local0 = CoD.mapsTable[f1212_arg1]
	if f1212_local0 == nil then
		f1212_arg1 = LuaUtils.GetDefaultMap( LobbyData.GetCurrentMenuTarget() )
		f1212_local0 = CoD.mapsTable[f1212_arg1]
	end
	if f1212_arg2 then
		Engine.SetDvar( "cp_queued_level", f1212_arg1 )
		if f1212_local0.safeHouse then
			f1212_arg1 = f1212_local0.safeHouse
		end
	end
	Engine.GameLobbySetMap( f1212_arg1 )
	if IsFreeRunMap( f1212_arg1 ) then
		Engine.SetProfileVar( f1212_arg0, CoD.profileKey_map_fr, f1212_arg1 )
	else
		Engine.SetProfileVar( f1212_arg0, CoD.profileKey_map, f1212_arg1 )
	end
	Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.selectedMapId" ), f1212_arg1 )
	Engine.CommitProfileChanges( f1212_arg0 )
end

function OpenPurchaseMapPackConfirmation( f1213_arg0, f1213_arg1, f1213_arg2, f1213_arg3 )
	local f1213_local0 = nil
	local f1213_local1 = CoD.SafeGetModelValue( f1213_arg1:getModel(), "dlcIndex" )
	if f1213_local1 and Engine.GetDLCBitForDLCIndex then
		f1213_local0 = Engine.GetDLCBitForDLCIndex( f1213_local1 )
	end
	if not f1213_local0 then
		local f1213_local2 = Engine.GetDLCBitForMapName
		local f1213_local3 = f1213_arg1.mapName
		if not f1213_local3 then
			f1213_local3 = f1213_arg1.mapId or f1213_arg1.id
		end
		f1213_local0 = f1213_local2( f1213_local3 )
	end
	local f1213_local2 = {
		dlcPack = f1213_local0 and CoD.DLCPackFromBit[f1213_local0],
		actionSource = f1213_arg2
	}
	if f1213_local2.dlcPack and f1213_local2.dlcPack == "DLC5" and CoD.isPS4 then
		f1213_local2.dlcPack = "DLC5_ORBIS"
	end
	if f1213_local2.dlcPack then
		CoD.OverlayUtility.CreateOverlay( f1213_arg0, f1213_arg3, "PurchaseMapPackConfirmation", f1213_arg0, f1213_local2 )
	end
end

function MapSelected( f1214_arg0, f1214_arg1 )
	SetMap( f1214_arg1, f1214_arg0.mapName, false )
end

function CustomGamesOpenMyShowcase( f1215_arg0, f1215_arg1 )
	CoD.FileshareUtility.SetFileshareMode( f1215_arg1, Enum.FileshareMode.FILESHARE_MODE_USER )
	FileshareSetShowcasePublishMode( f1215_arg1, false )
	CoD.FileshareUtility.FetchContentForUser( f1215_arg1, Engine.GetXUID64( f1215_arg1 ) )
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	CoD.FileshareUtility.SetShowFileDetails( false )
	CoD.FileshareUtility.SetShowPublishNewDetails( false )
	CoD.FileshareUtility.SetShowCreateButton( false )
	SetInCustomGames( 1 )
	OpenShowcaseCustomGames( f1215_arg0, nil, f1215_arg1, "", nil )
end

function SetInCustomGames( f1216_arg0 )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" ), "inCustomGames" ), f1216_arg0 )
end

function CustomGamesOpenOptions( f1217_arg0, f1217_arg1, f1217_arg2 )
	OpenPopup( f1217_arg0, "CustomGamesOptions", f1217_arg1 )
end

function GetCurrentGameType( f1218_arg0 )
	return Engine.DvarString( nil, "ui_gametype" )
end

function SetCurrentUIGameType( f1219_arg0, f1219_arg1 )
	local f1219_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" )
	Engine.SetModelValue( Engine.CreateModel( f1219_local0, "communityOption" ), false )
	Engine.SetModelValue( Engine.CreateModel( f1219_local0, "showcaseOption" ), false )
	if f1219_arg0.gametype then
		Engine.SetModelValue( Engine.CreateModel( f1219_local0, "gameType" ), f1219_arg0.gametype )
		if CoD.perController[f1219_arg1].previousGameType ~= f1219_arg0.gametype then
			CustomGameMarkDirty( f1219_arg1 )
			CoD.perController[f1219_arg1].previousGameType = ""
		end
	else
		CoD.perController[f1219_arg1].previousGameType = ""
	end
	if f1219_arg0.community or f1219_arg0.showcase then
		Engine.SetModelValue( Engine.CreateModel( f1219_local0, "gameType" ), "" )
		Engine.SetModelValue( Engine.CreateModel( f1219_local0, "communityOption" ), f1219_arg0.community )
		Engine.SetModelValue( Engine.CreateModel( f1219_local0, "showcaseOption" ), f1219_arg0.showcase )
		local f1219_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" )
		if Engine.GetModelValue( Engine.CreateModel( f1219_local1, "secondaryListSelected" ) ) == true then
			Engine.SetModelValue( Engine.CreateModel( f1219_local1, "secondaryListSelected" ), false )
		else
			CustomGameMarkDirty( f1219_arg1 )
		end
	end
end

function GetCurrentUIGameType( f1220_arg0 )
	return Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" ), "gameType" ) ) or "tdm"
end

function LoadCustomGame( f1221_arg0, f1221_arg1 )
	local f1221_local0 = f1221_arg0:getModel( f1221_arg1, "slot" )
	local f1221_local1 = f1221_arg0:getModel( f1221_arg1, "index" )
	local f1221_local2 = f1221_arg0:getModel( f1221_arg1, "gameName" )
	Engine.LobbyHost_SetCustomGameName( "" )
	if f1221_local0 and f1221_local1 then
		local f1221_local3 = false
		local f1221_local4 = f1221_arg0:getModel( f1221_arg1, "isOfficial" )
		if f1221_local4 then
			f1221_local3 = Engine.GetModelValue( f1221_local4 )
		end
		if f1221_local3 then
			Engine.Exec( f1221_arg1, "customgames_loadofficialgame " .. Engine.GetModelValue( f1221_local0 ) .. " " .. Engine.GetModelValue( f1221_local1 ) )
		else
			Engine.Exec( f1221_arg1, "customgames_load " .. Engine.GetModelValue( f1221_local0 ) .. " " .. Engine.GetModelValue( f1221_local1 ) )
		end
		CustomGamesShowLoadSuccessToast( f1221_arg0, f1221_arg1, Engine.GetModelValue( f1221_local2 ) )
	end
end

function LoadFileshareCustomGame( f1222_arg0, f1222_arg1, f1222_arg2 )
	local f1222_local0 = CoD.FileshareUtility.GetSelectedItem()
	local f1222_local1 = CoD.FileshareUtility.GetSelectedItemProperty( "fileId" )
	if f1222_local1 then
		Engine.LoadFileshareCustomGame( f1222_arg2, f1222_local1 )
	end
end

function SaveCustomGame( f1223_arg0, f1223_arg1, f1223_arg2 )
	local f1223_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" )
	local f1223_local1 = Engine.GetModelValue( Engine.CreateModel( f1223_local0, "isOfficial" ) )
	local f1223_local2 = Engine.GetModelValue( Engine.CreateModel( f1223_local0, "slot" ) )
	local f1223_local3 = Engine.GetModelValue( Engine.CreateModel( f1223_local0, "index" ) )
	local f1223_local4 = Engine.GetModelValue( Engine.CreateModel( f1223_local0, "gameName" ) )
	local f1223_local5 = Engine.GetModelValue( Engine.CreateModel( f1223_local0, "gameDescription" ) )
	if not f1223_local4 or f1223_local4 == "" then
		f1223_local4 = "Custom Game"
	end
	if not f1223_local5 or f1223_local5 == "" then
		f1223_local5 = Engine.Localize( Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", GetCurrentGameType(), "description" ) )
	end
	if f1223_local1 == nil or f1223_local1 == 1 or f1223_local1 == true then
		Engine.SetModelValue( Engine.CreateModel( f1223_local0, "gameName" ), "Custom Game" )
		Engine.SetModelValue( Engine.CreateModel( f1223_local0, "gameDescription" ), "Game Description" )
		OpenOverlay( f1223_arg0, "CustomGamesSave", f1223_arg2 )
	else
		Engine.Exec( f1223_arg1, "customgames_save " .. f1223_local2 .. " " .. f1223_local3 .. " " .. GetCurrentGameType() .. " \"" .. f1223_local4 .. "\"" .. " \"" .. f1223_local5 .. "\"" )
	end
end

function CustomGameSelectorLoseFocus( f1224_arg0, f1224_arg1, f1224_arg2, f1224_arg3 )
	CoD.perController[f1224_arg2].previousGameType = GetCurrentUIGameType( f1224_arg2 )
end

function CustomGameSelector_Delete( f1225_arg0, f1225_arg1, f1225_arg2, f1225_arg3, f1225_arg4 )
	DeleteCustomGameYes( f1225_arg0, f1225_arg1, f1225_arg2, f1225_arg3, f1225_arg4 )
	MediaManagerMarkDirty( f1225_arg2 )
end

function SaveCustomGameYes( f1226_arg0, f1226_arg1, f1226_arg2, f1226_arg3, f1226_arg4 )
	local f1226_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" )
	local f1226_local1 = Engine.GetModelValue( Engine.CreateModel( f1226_local0, "gameName" ) )
	local f1226_local2 = Engine.GetModelValue( Engine.CreateModel( f1226_local0, "gameDescription" ) )
	if not f1226_local1 or f1226_local1 == "" then
		f1226_local1 = "Custom Game"
	end
	if not f1226_local2 or f1226_local2 == "" then
		f1226_local2 = Engine.Localize( Engine.StructTableLookupString( CoDShared.gametypesStructTable, "name", GetCurrentGameType(), "description" ) )
	end
	Engine.Exec( f1226_arg2, "customgames_savenew " .. GetCurrentGameType() .. " \"" .. f1226_local1 .. "\"" .. " \"" .. f1226_local2 .. "\"" )
end

function DeleteCustomGame( f1227_arg0, f1227_arg1, f1227_arg2, f1227_arg3, f1227_arg4 )
	if Engine.GetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" ), "isOfficial" ) ) then
		return 
	else
		OpenOverlay( f1227_arg4, "CustomGamesDelete", f1227_arg2 )
	end
end

function DeleteCustomGameYes( f1228_arg0, f1228_arg1, f1228_arg2, f1228_arg3, f1228_arg4 )
	local f1228_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" )
	local f1228_local1 = Engine.GetModelValue( Engine.CreateModel( f1228_local0, "slot" ) )
	local f1228_local2 = Engine.GetModelValue( Engine.CreateModel( f1228_local0, "index" ) )
	GoBack( f1228_arg0, f1228_arg2 )
	Engine.ExecNow( f1228_arg2, "customgames_delete " .. f1228_local1 .. " " .. f1228_local2 )
end

function DeleteCustomGameNo( f1229_arg0, f1229_arg1, f1229_arg2, f1229_arg3, f1229_arg4 )
	GoBack( f1229_arg4, f1229_arg2 )
end

function CustomGamesProcessDeleteSuccess( f1230_arg0, f1230_arg1, f1230_arg2 )
	CustomGameMarkDirty( f1230_arg1 )
	local f1230_local0 = Engine.Localize( "MENU_CUSTOMGAME_DELETED" )
	local f1230_local1 = ""
	if not f1230_arg2 or f1230_arg2 == "" then
		local f1230_local2 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" ), "gameName" )
		if f1230_local2 then
			f1230_local1 = f1230_local2
		end
	else
		f1230_local1 = f1230_arg2
	end
	CoD.OverlayUtility.ShowToast( "Fileshare", f1230_local0, f1230_local1, "uie_t7_mp_icon_header_customgames", "uie_t7_mp_icon_header_customgames" )
end

function OpenCustomGamePublishPrompt( f1231_arg0, f1231_arg1, f1231_arg2, f1231_arg3, f1231_arg4 )
	local f1231_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" )
	local f1231_local1 = Engine.GetModelValue( Engine.CreateModel( f1231_local0, "isOfficial" ) )
	local f1231_local2 = Engine.GetModelValue( Engine.CreateModel( f1231_local0, "gameName" ) )
	local f1231_local3 = Engine.GetModelValue( Engine.CreateModel( f1231_local0, "gameDescription" ) )
	if f1231_local1 then
		return 
	elseif not f1231_local2 then
		f1231_local2 = "Custom Game"
	end
	if not f1231_local3 then
		f1231_local3 = ""
	end
	CoD.FileshareUtility.OpenPublishPrompt( f1231_arg4, f1231_arg2, "customgame", f1231_local2, f1231_local3, PublishCustomGame )
end

function PublishCustomGame( f1232_arg0 )
	local f1232_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" )
	Engine.PublishCustomGame( f1232_arg0, "customgame", Engine.GetModelValue( Engine.CreateModel( f1232_local0, "slot" ) ), Engine.GetModelValue( Engine.CreateModel( f1232_local0, "index" ) ), CoD.FileshareUtility.GetPublishName(), GetCurrentUIGameType( f1232_arg0 ), CoD.FileshareUtility.GetPublishDescription() )
end

function SetSelectedCustomGame( f1233_arg0, f1233_arg1 )
	local f1233_local0 = f1233_arg0:getModel()
	local f1233_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" )
	Engine.SetModelValue( Engine.CreateModel( f1233_local1, "secondaryListSelected" ), true )
	Engine.SetModelValue( Engine.CreateModel( f1233_local1, "slot" ), CoD.SafeGetModelValue( f1233_local0, "slot" ) )
	Engine.SetModelValue( Engine.CreateModel( f1233_local1, "index" ), CoD.SafeGetModelValue( f1233_local0, "index" ) )
	Engine.SetModelValue( Engine.CreateModel( f1233_local1, "uiIndex" ), CoD.SafeGetModelValue( f1233_local0, "uiIndex" ) )
	Engine.SetModelValue( Engine.CreateModel( f1233_local1, "gameName" ), CoD.SafeGetModelValue( f1233_local0, "gameName" ) )
	Engine.SetModelValue( Engine.CreateModel( f1233_local1, "gameDescription" ), CoD.SafeGetModelValue( f1233_local0, "gameDescription" ) )
	Engine.SetModelValue( Engine.CreateModel( f1233_local1, "isOfficial" ), CoD.SafeGetModelValue( f1233_local0, "isOfficial" ) )
end

function SetCurrentCustomGame( f1234_arg0, f1234_arg1 )
	local f1234_local0 = f1234_arg0:getModel( f1234_arg1, "slot" )
	local f1234_local1 = f1234_arg0:getModel( f1234_arg1, "index" )
	local f1234_local2 = f1234_arg0:getModel( f1234_arg1, "isOfficial" )
	local f1234_local3 = f1234_arg0:getModel( f1234_arg1, "gameName" )
	local f1234_local4 = Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" )
	if f1234_local0 and f1234_local1 and f1234_local3 then
		Engine.SetModelValue( Engine.CreateModel( f1234_local4, "slot" ), Engine.GetModelValue( f1234_local0 ) )
		Engine.SetModelValue( Engine.CreateModel( f1234_local4, "index" ), Engine.GetModelValue( f1234_local1 ) )
		Engine.SetModelValue( Engine.CreateModel( f1234_local4, "gameName" ), Engine.GetModelValue( f1234_local3 ) )
	end
	if f1234_local2 then
		Engine.LobbyHost_SetOfficialCustomGame( Engine.GetModelValue( f1234_local2 ) )
	end
end

function CustomGameMarkDirty( f1235_arg0 )
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" ), "dirty" ) )
end

function OpenPopularCustomGames( f1236_arg0, f1236_arg1, f1236_arg2 )
	CoD.FileshareUtility.SetCurrentCommunityDataType( Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_POPULAR )
	CoD.FileshareUtility.SetFileshareMode( f1236_arg2, Enum.FileshareMode.FILESHARE_MODE_COMMUNITY )
	local f1236_local0 = Engine.CreateModel( f1236_arg1:getModel(), "category" )
	local f1236_local1 = Engine.CreateModel( f1236_arg1:getModel(), "communityDataType" )
	Engine.SetModelValue( f1236_local0, "customgame" )
	Engine.SetModelValue( f1236_local1, Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_POPULAR )
	SetInCustomGames( 1 )
	FileshareCategorySelectorItemSelected( f1236_arg0, f1236_arg1, f1236_arg2 )
	CoD.FileshareUtility.SetShowCreateButton( false )
	CoD.FileshareUtility.SetShowFileDetails( false )
	CoD.FileshareUtility.SetShowPublishNewDetails( false )
	OpenShowcase( f1236_arg0, f1236_arg1, f1236_arg2, nil, f1236_arg0 )
end

function OpenTrendingCustomGames( f1237_arg0, f1237_arg1, f1237_arg2 )
	CoD.FileshareUtility.SetCurrentCommunityDataType( Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_TRENDING )
	CoD.FileshareUtility.SetFileshareMode( f1237_arg2, Enum.FileshareMode.FILESHARE_MODE_COMMUNITY )
	local f1237_local0 = Engine.CreateModel( f1237_arg1:getModel(), "category" )
	local f1237_local1 = Engine.CreateModel( f1237_arg1:getModel(), "communityDataType" )
	Engine.SetModelValue( f1237_local0, "customgame" )
	Engine.SetModelValue( f1237_local1, Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_TRENDING )
	SetInCustomGames( 1 )
	FileshareCategorySelectorItemSelected( f1237_arg0, f1237_arg1, f1237_arg2 )
	CoD.FileshareUtility.SetShowCreateButton( false )
	CoD.FileshareUtility.SetShowFileDetails( false )
	CoD.FileshareUtility.SetShowPublishNewDetails( false )
	OpenShowcase( f1237_arg0, f1237_arg1, f1237_arg2, nil, f1237_arg0 )
end

function OpenrRecentCustomGames( f1238_arg0, f1238_arg1, f1238_arg2 )
	CoD.FileshareUtility.SetCurrentCommunityDataType( Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_RECENT )
	CoD.FileshareUtility.SetFileshareMode( f1238_arg2, Enum.FileshareMode.FILESHARE_MODE_COMMUNITY )
	local f1238_local0 = Engine.CreateModel( f1238_arg1:getModel(), "category" )
	local f1238_local1 = Engine.CreateModel( f1238_arg1:getModel(), "communityDataType" )
	Engine.SetModelValue( f1238_local0, "customgame" )
	Engine.SetModelValue( f1238_local1, Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_RECENT )
	SetInCustomGames( 1 )
	FileshareCategorySelectorItemSelected( f1238_arg0, f1238_arg1, f1238_arg2 )
	CoD.FileshareUtility.SetShowCreateButton( false )
	CoD.FileshareUtility.SetShowFileDetails( false )
	CoD.FileshareUtility.SetShowPublishNewDetails( false )
	OpenShowcase( f1238_arg0, f1238_arg1, f1238_arg2, nil, f1238_arg0 )
end

function GameModeSelected( f1239_arg0, f1239_arg1 )
	Engine.Exec( f1239_arg1, "resetCustomGametype" )
	local f1239_local0 = CoDShared.IsGametypeTeamBased()
	local f1239_local1 = GetCurrentUIGameType( f1239_arg1 )
	if f1239_local1 == "" then
		return 
	end
	Engine.SetGametype( f1239_local1 )
	if f1239_local0 ~= CoDShared.IsGametypeTeamBased() then
		Engine.SetDvar( "bot_friends", 0 )
		Engine.SetDvar( "bot_enemies", 0 )
	end
	Engine.Exec( f1239_arg1, "xupdatepartystate" )
	Engine.SetProfileVar( f1239_arg1, CoD.profileKey_gametype, f1239_local1 )
	Engine.PartyHostClearUIState()
	Engine.CommitProfileChanges( f1239_arg1 )
	Engine.SystemNeedsUpdate( nil, "lobby" )
	Engine.Exec( f1239_arg1, "lobby_setgametype " .. f1239_local1 )
	Engine.LobbyVM_CallFunc( "OnGametypeSettingsChange", {
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyModule = Enum.LobbyModule.LOBBY_MODULE_HOST
	} )
end

function GameModeSelectedCommunity( f1240_arg0, f1240_arg1, f1240_arg2 )
	if f1240_arg1.oldTeamBased ~= nil and f1240_arg1.oldTeamBased ~= CoDShared.IsGametypeTeamBased() then
		Engine.SetDvar( "bot_friends", 0 )
		Engine.SetDvar( "bot_enemies", 0 )
	end
	Engine.Exec( f1240_arg2, "xupdatepartystate" )
	Engine.PartyHostClearUIState()
	Engine.CommitProfileChanges( f1240_arg2 )
	Engine.SystemNeedsUpdate( nil, "lobby" )
	Engine.LobbyVM_CallFunc( "OnGametypeSettingsChange", {
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		lobbyModule = Enum.LobbyModule.LOBBY_MODULE_HOST
	} )
end

function CustomGameHandleKeyboardComplete( f1241_arg0, f1241_arg1, f1241_arg2, f1241_arg3 )
	if f1241_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_FILESHARE_PUBLISH_NAME then
		Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" ), "gameName" ), f1241_arg3.input )
	elseif f1241_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_FILESHARE_PUBLISH_DESCRIPTION then
		Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" ), "gameDescription" ), f1241_arg3.input )
	end
end

function CustomGamesShowLoadSuccessToast( f1242_arg0, f1242_arg1, f1242_arg2 )
	local f1242_local0 = Engine.Localize( "MENU_CUSTOMGAMES_LOADED" )
	local f1242_local1 = ""
	if not f1242_arg2 or f1242_arg2 == "" then
		local f1242_local2 = Engine.GetModel( Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" ), "gameName" )
		if f1242_local2 then
			f1242_local1 = Engine.GetModelValue( f1242_local2 )
		end
	else
		f1242_local1 = f1242_arg2
	end
	local f1242_local3 = f1242_arg0:getModel( f1242_arg1, "isOfficial" )
	if f1242_local3 and Engine.GetModelValue( f1242_local3 ) == true then
		f1242_local1 = Engine.Localize( f1242_local1 )
	end
	CoD.OverlayUtility.ShowToast( "Fileshare", f1242_local0, f1242_local1, "uie_t7_mp_icon_header_customgames", "uie_t7_mp_icon_header_customgames" )
end

function CustomGamesShowLoadFailureToast( f1243_arg0, f1243_arg1, f1243_arg2 )
	local f1243_local0 = Engine.Localize( "MENU_CUSTOMGAMES_LOADED_ERROR" )
	local f1243_local1 = ""
	if not f1243_arg2 then
		local f1243_local2 = Engine.GetModel( Engine.CreateModel( Engine.GetGlobalModel(), "CustomGamesRoot" ), "gameName" )
		if f1243_local2 then
			f1243_local1 = Engine.GetModelValue( f1243_local2 )
		end
	else
		f1243_local1 = f1243_arg2
	end
	local f1243_local3 = f1243_arg0:getModel( f1243_arg1, "isOfficial" )
	if f1243_local3 and Engine.GetModelValue( f1243_local3 ) == true then
		f1243_local1 = Engine.Localize( f1243_local1 )
	end
	CoD.OverlayUtility.ShowToast( "Fileshare", f1243_local0, f1243_local1, "uie_t7_icon_error_overlays", "uie_t7_icon_error_overlays" )
end

function CustomGamesShowSaveSuccessToast( f1244_arg0, f1244_arg1, f1244_arg2 )
	local f1244_local0 = Engine.Localize( "MENU_CUSTOMGAME_SAVED" )
	local f1244_local1 = ""
	if not f1244_arg2 or f1244_arg2 == "" then
		local f1244_local2 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" ), "gameName" )
		if f1244_local2 then
			f1244_local1 = f1244_local2
		end
	else
		f1244_local1 = f1244_arg2
	end
	CoD.OverlayUtility.ShowToast( "Fileshare", f1244_local0, f1244_local1, "uie_t7_mp_icon_header_customgames", "uie_t7_mp_icon_header_customgames" )
end

function CustomGamesShowSaveFailureToast( f1245_arg0, f1245_arg1, f1245_arg2 )
	local f1245_local0 = Engine.Localize( "MENU_CUSTOMGAME_SAVE_ERROR" )
	local f1245_local1 = ""
	if not f1245_arg2 or f1245_arg2 == "" then
		local f1245_local2 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "SelectedCustomGame" ), "gameName" )
		if f1245_local2 then
			f1245_local1 = f1245_local2
		end
	else
		f1245_local1 = f1245_arg2
	end
	CoD.OverlayUtility.ShowToast( "Fileshare", f1245_local0, f1245_local1, "uie_t7_icon_error_overlays", "uie_t7_icon_error_overlays" )
end

function CycleContracts( f1246_arg0 )
	LuaUtils.CycleContracts()
end

function PlaylistSelected( f1247_arg0, f1247_arg1, f1247_arg2 )
	local f1247_local0 = f1247_arg1
	local f1247_local1 = f1247_arg1.playlist
	if f1247_local1 then
		f1247_local1 = f1247_local0 and f1247_arg1.playlist.index
	end
	if not f1247_local1 then
		return 
	end
	local f1247_local2 = CoD.PlaylistCategoryFilter or ""
	Engine.SetPlaylistID( f1247_local1 )
	Engine.SetProfileVar( f1247_arg2, "playlist_" .. f1247_local2, tostring( f1247_local1 ) )
	Engine.PartyHostClearUIState()
	CoD.LobbyBase.SetPlaylistName( f1247_arg1.playlist.name )
	local f1247_local3 = f1247_arg0.occludedMenu
	GoBack( f1247_arg0, f1247_arg2 )
	if f1247_local3 then
		f1247_local3:processEvent( {
			name = "playlist_selected",
			controller = f1247_arg2,
			itemInfo = f1247_arg1.playlist
		} )
	end
end

function PlaylistCategorySelected( f1248_arg0, f1248_arg1, f1248_arg2 )
	SetElementPropertyOnPerControllerTable( f1248_arg2, "playlistCategory", f1248_arg1, "category" )
	UpdateElementDataSource( f1248_arg0, "playlistList" )
	SetMenuState( f1248_arg0, "SelectingPlaylist" )
	SetLoseFocusToElement( f1248_arg0, "playlistCategoriesList", f1248_arg2 )
	MakeElementNotFocusable( f1248_arg0, "playlistCategoriesList", f1248_arg2 )
	MakeElementFocusable( f1248_arg0, "playlistList", f1248_arg2 )
	SetFocusToElement( f1248_arg0, "playlistList", f1248_arg2 )
end

function BlockGameFromKeyEvent( f1249_arg0 )
	Engine.BlockGameFromKeyEvent()
end

function ToggleScoreboardClientMute( f1250_arg0, f1250_arg1 )
	Engine.BlockGameFromKeyEvent()
	local f1250_local0 = f1250_arg0:getModel( f1250_arg1, "clientNum" )
	if not f1250_local0 then
		return 
	end
	local f1250_local1 = Engine.GetModelValue( f1250_local0 )
	if f1250_local1 and f1250_local1 >= 0 and Engine.GetClientNum( f1250_arg1 ) ~= f1250_local1 then
		Engine.TogglePlayerMute( f1250_arg1, f1250_local1 )
		UpdateScoreboardClientMuteButtonPrompt( f1250_arg0, f1250_arg1 )
	end
end

function UpdateScoreboardClientMuteButtonPrompt( f1251_arg0, f1251_arg1 )
	local f1251_local0 = f1251_arg0:getModel( f1251_arg1, "clientNum" )
	if not f1251_local0 then
		return 
	end
	local f1251_local1 = Engine.GetModelValue( f1251_local0 )
	local f1251_local2 = Engine.CreateModel( Engine.GetModelForController( f1251_arg1 ), "scoreboardInfo.muteButtonPromptVisible" )
	local f1251_local3 = Engine.CreateModel( Engine.GetModelForController( f1251_arg1 ), "scoreboardInfo.muteButtonPromptText" )
	Engine.SetModelValue( f1251_local2, false )
	if f1251_local1 and f1251_local1 >= 0 then
		if Engine.GetClientNum( f1251_arg1 ) == f1251_local1 then
			return 
		end
		Engine.SetModelValue( f1251_local2, true )
		if Engine.IsPlayerMutedByClientNum( f1251_arg1, Enum.LobbyType.LOBBY_TYPE_GAME, f1251_local1 ) then
			Engine.SetModelValue( f1251_local3, "MENU_UNMUTE_CAPS" )
		else
			Engine.SetModelValue( f1251_local3, "MENU_MUTE_CAPS" )
		end
	end
end

function ShowGamerCardForScoreboardRow( f1252_arg0, f1252_arg1 )
	local f1252_local0 = CoD.SafeGetModelValue( f1252_arg1:getModel(), "clientNum" )
	if not Engine.IsVisibilityBitSet( f1252_arg0, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and CoD.SafeGetModelValue( Engine.GetModelForController( f1252_arg0 ), "forceScoreboard" ) ~= 1 then
		return 
	else
		Engine.ShowGamerCard( f1252_arg0, f1252_local0 )
	end
end

function ShowAccountPicker( f1253_arg0 )
	Engine.ShowAccountPicker( f1253_arg0 )
end

function AdjustBrightness( f1254_arg0, f1254_arg1 )
	local f1254_local0 = f1254_arg0:getModel( f1254_arg1, "value" )
	if f1254_local0 then
		Engine.SetProfileVar( f1254_arg1, "r_sceneBrightness", Engine.GetModelValue( f1254_local0 ) )
		Engine.Exec( f1254_arg1, "updategamerprofile" )
	end
end

function PurchaseDWSKU( f1255_arg0, f1255_arg1, f1255_arg2 )
	local f1255_local0 = f1255_arg1:getModel( f1255_arg2, "skuId" )
	if f1255_local0 then
		Engine.PurchaseDWSKU( f1255_arg2, Engine.GetModelValue( f1255_local0 ) )
		if Engine.GetMarketplaceSize() == 0 then
			f1255_arg0.MarketplaceList:processEvent( {
				name = "lose_focus",
				controller = f1255_arg2
			} )
			f1255_arg0.PlayerInventoryList:processEvent( {
				name = "gain_focus",
				controller = f1255_arg2
			} )
		end
	end
end

function RemoveFromPlayerInventory( f1256_arg0, f1256_arg1, f1256_arg2 )
	local f1256_local0 = f1256_arg1:getModel( f1256_arg2, "itemId" )
	if f1256_local0 then
		Engine.RemoveItemFromInventory( f1256_arg2, Engine.GetModelValue( f1256_local0 ), 1 )
		if Engine.GetPlayerInventorySize( f1256_arg2 ) == 0 then
			f1256_arg0.MarketplaceList:processEvent( {
				name = "gain_focus",
				controller = f1256_arg2
			} )
			f1256_arg0.PlayerInventoryList:processEvent( {
				name = "lose_focus",
				controller = f1256_arg2
			} )
		end
	end
end

function ReportItemUsageTime( f1257_arg0, f1257_arg1, f1257_arg2 )
	Engine.ReportItemUsageTime( f1257_arg2, 10 )
end

function AccountLink_SetAccountLinkViewed( f1258_arg0, f1258_arg1, f1258_arg2 )
	Engine.SetAccountLinkViewed( f1258_arg2, true )
end

function AccountLink_HandleLoginKeyboardComplete( f1259_arg0, f1259_arg1, f1259_arg2, f1259_arg3 )
	local f1259_local0 = Engine.GetModel( Engine.GetGlobalModel(), "AccountLinkLogin" )
	local f1259_local1, f1259_local2 = nil
	if not f1259_local0 then
		return 
	elseif f1259_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_EMAIL then
		f1259_local1 = Engine.GetModel( f1259_local0, "email" )
	end
	if f1259_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_PASSWORD then
		f1259_local2 = Engine.GetModel( f1259_local0, "password" )
	end
	if f1259_local1 then
		Engine.SetModelValue( f1259_local1, f1259_arg3.input )
	end
	if f1259_local2 then
		Engine.SetModelValue( f1259_local2, f1259_arg3.input )
		local f1259_local3 = ""
		for f1259_local4 = 0, string.len( f1259_arg3.input ) - 1, 1 do
			local f1259_local7 = f1259_local4
			f1259_local3 = f1259_local3 .. "*"
		end
		Engine.SetModelValue( Engine.GetModel( f1259_local0, "stars" ), f1259_local3 )
	end
end

function AccountLink_Login( f1260_arg0, f1260_arg1, f1260_arg2 )
	local f1260_local0 = GoBack( f1260_arg0, f1260_arg2 )
	local f1260_local1 = f1260_local0:openOverlay( "Spinner", f1260_arg2 )
	f1260_local1:registerEventHandler( "optin_success", function ( element, event )
		CoD.OverlayUtility.CreateOverlay( f1260_arg2, element, "OptInSuccess" )
		element:close()
	end )
	f1260_local1:registerEventHandler( "registration_failure", function ( element, event, f1262_arg2 )
		FinishRegistrationFlow( element, f1260_arg2, element )
	end )
	local f1260_local2 = Engine.GetModel( Engine.GetGlobalModel(), "AccountLinkLogin" )
	Engine.AccountLinkLogin( f1260_arg2, tostring( Engine.GetModelValue( Engine.GetModel( f1260_local2, "email" ) ) ), tostring( Engine.GetModelValue( Engine.GetModel( f1260_local2, "password" ) ) ) )
end

function AccountLink_HandleRegisterKeyboardComplete( f1263_arg0, f1263_arg1, f1263_arg2, f1263_arg3 )
	local f1263_local0 = Engine.GetModel( Engine.GetModelForController( f1263_arg2 ), "AccountLinkRegister" )
	local f1263_local1, f1263_local2, f1263_local3, f1263_local4, f1263_local5, f1263_local6, f1263_local7 = nil
	if not f1263_local0 then
		return 
	elseif f1263_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_FIRST_NAME then
		f1263_local1 = Engine.GetModel( f1263_local0, "firstName" )
		if f1263_local1 then
			Engine.SetModelValue( f1263_local1, f1263_arg3.input )
		end
	end
	if f1263_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_LAST_NAME then
		f1263_local2 = Engine.GetModel( f1263_local0, "lastName" )
		if f1263_local2 then
			Engine.SetModelValue( f1263_local2, f1263_arg3.input )
		end
	end
	if f1263_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_ZIP_CODE then
		f1263_local3 = Engine.GetModel( f1263_local0, "zipCode" )
		if f1263_local3 then
			Engine.SetModelValue( f1263_local3, f1263_arg3.input )
		end
	end
	if f1263_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_USERNAME then
		f1263_local4 = Engine.GetModel( f1263_local0, "username" )
		if f1263_local4 then
			Engine.SetModelValue( f1263_local4, f1263_arg3.input )
		end
	end
	if f1263_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_EMAIL then
		f1263_local5 = Engine.GetModel( f1263_local0, "email" )
		if f1263_local5 then
			Engine.SetModelValue( f1263_local5, f1263_arg3.input )
		end
	end
	if f1263_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_REGISTER_PASSWORD then
		f1263_local6 = Engine.GetModel( f1263_local0, "password" )
		if f1263_local6 then
			Engine.SetModelValue( f1263_local6, f1263_arg3.input )
			local f1263_local8 = ""
			for f1263_local9 = 0, string.len( f1263_arg3.input ) - 1, 1 do
				local f1263_local12 = f1263_local9
				f1263_local8 = f1263_local8 .. "*"
			end
			Engine.SetModelValue( Engine.GetModel( f1263_local0, "stars" ), f1263_local8 )
		end
	end
	if f1263_arg3.type == Enum.KeyboardType.KEYBOARD_TYPE_CONFIRM_PASSWORD then
		f1263_local7 = Engine.GetModel( f1263_local0, "confirmPass" )
		if f1263_local7 then
			Engine.SetModelValue( f1263_local7, f1263_arg3.input )
			local f1263_local8 = ""
			for f1263_local9 = 0, string.len( f1263_arg3.input ) - 1, 1 do
				local f1263_local12 = f1263_local9
				f1263_local8 = f1263_local8 .. "*"
			end
			Engine.SetModelValue( Engine.GetModel( f1263_local0, "confirmStars" ), f1263_local8 )
		end
	end
end

function AccountLink_SelectRegion( f1264_arg0, f1264_arg1, f1264_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f1264_arg2 ), "AccountLinkRegister" ), "region" ), Engine.GetModelValue( f1264_arg1:getModel( f1264_arg2, "itemName" ) ) )
end

function AccountLink_SelectGender( f1265_arg0, f1265_arg1, f1265_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f1265_arg2 ), "AccountLinkRegister" ), "gender" ), Engine.GetModelValue( f1265_arg1:getModel( f1265_arg2, "gender" ) ) )
end

function AccountLink_SelectMonth( f1266_arg0, f1266_arg1, f1266_arg2 )
	local f1266_local0 = Engine.GetModelValue( f1266_arg1:getModel( f1266_arg2, "month" ) )
	local f1266_local1 = Engine.GetModelValue( f1266_arg1:getModel( f1266_arg2, "monthIndex" ) )
	local f1266_local2 = Engine.GetModel( Engine.GetModelForController( f1266_arg2 ), "AccountLinkRegister" )
	Engine.SetModelValue( Engine.GetModel( f1266_local2, "month" ), f1266_local0 )
	Engine.SetModelValue( Engine.GetModel( f1266_local2, "monthIndex" ), f1266_local1 )
end

function AccountLink_SelectDay( f1267_arg0, f1267_arg1, f1267_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f1267_arg2 ), "AccountLinkRegister" ), "day" ), Engine.GetModelValue( f1267_arg1:getModel( f1267_arg2, "day" ) ) )
end

function AccountLink_SelectYear( f1268_arg0, f1268_arg1, f1268_arg2 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f1268_arg2 ), "AccountLinkRegister" ), "year" ), Engine.GetModelValue( f1268_arg1:getModel( f1268_arg2, "year" ) ) )
end

function AccountLink_Register( f1269_arg0, f1269_arg1, f1269_arg2 )
	local f1269_local0 = Engine.GetModel( Engine.GetModelForController( f1269_arg2 ), "AccountLinkRegister" )
	local f1269_local1 = Engine.GetModelValue( Engine.GetModel( f1269_local0, "firstName" ) )
	local f1269_local2 = Engine.GetModelValue( Engine.GetModel( f1269_local0, "lastName" ) )
	local f1269_local3 = Engine.GetModelValue( Engine.GetModel( f1269_local0, "zipCode" ) )
	local f1269_local4 = Engine.GetModelValue( Engine.GetModel( f1269_local0, "region" ) )
	local f1269_local5 = Engine.GetModelValue( Engine.GetModel( f1269_local0, "username" ) )
	local f1269_local6 = Engine.GetModelValue( Engine.GetModel( f1269_local0, "email" ) )
	local f1269_local7 = Engine.GetModelValue( Engine.GetModel( f1269_local0, "password" ) )
	local f1269_local8 = Engine.GetModelValue( Engine.GetModel( f1269_local0, "confirmPass" ) )
	local f1269_local9 = Engine.GetModelValue( Engine.GetModel( f1269_local0, "gender" ) )
	local f1269_local10 = Engine.GetModelValue( Engine.GetModel( f1269_local0, "monthIndex" ) )
	local f1269_local11 = Engine.GetModelValue( Engine.GetModel( f1269_local0, "day" ) )
	local f1269_local12 = Engine.GetModelValue( Engine.GetModel( f1269_local0, "year" ) )
	local f1269_local13 = {
		firstName = tostring( f1269_local1 ),
		lastName = tostring( f1269_local2 ),
		zipCode = tostring( f1269_local3 ),
		region = tostring( f1269_local4 ),
		username = tostring( f1269_local5 ),
		email = tostring( f1269_local6 ),
		password = tostring( f1269_local7 ),
		confirmPass = tostring( f1269_local8 ),
		gender = tostring( f1269_local9 ),
		month = f1269_local10,
		day = f1269_local11,
		year = f1269_local12
	}
	if f1269_local1 == nil then
		OpenGenericSmallPopup( f1269_arg0, f1269_arg2, "Please enter a valid first name", "Specific Name Constriants Here.", nil, "MENU_OK" )
		return 
	elseif f1269_local2 == nil then
		OpenGenericSmallPopup( f1269_arg0, f1269_arg2, "Please enter a valid last name", "Specific Name Constriants Here.", nil, "MENU_OK" )
		return 
	elseif f1269_local4 == nil then
		OpenGenericSmallPopup( f1269_arg0, f1269_arg2, "Please select a region", "Please select a region", nil, "MENU_OK" )
		return 
	elseif f1269_local3 == nil or string.len( f1269_local3 ) ~= 5 then
		OpenGenericSmallPopup( f1269_arg0, f1269_arg2, "Please enter a valid zip code", "Specific Zip Code Constriants Here.", nil, "MENU_OK" )
		return 
	elseif f1269_local5 == nil then
		OpenGenericSmallPopup( f1269_arg0, f1269_arg2, "Please enter a valid username", "Specific Username Constriants Here.", nil, "MENU_OK" )
		return 
	elseif f1269_local7 == nil then
		OpenGenericSmallPopup( f1269_arg0, f1269_arg2, "Please enter a valid password", "Specific Password Constriants Here.", nil, "MENU_OK" )
		return 
	elseif f1269_local8 == nil or f1269_local7 ~= f1269_local8 then
		OpenGenericSmallPopup( f1269_arg0, f1269_arg2, "Please confirm your password", "Please confirm your password.", nil, "MENU_OK" )
		return 
	elseif f1269_local9 == nil then
		OpenGenericSmallPopup( f1269_arg0, f1269_arg2, "Please select a gender", "Please select a gender.", nil, "MENU_OK" )
		return 
	elseif f1269_local10 == nil then
		OpenGenericSmallPopup( f1269_arg0, f1269_arg2, "Please select a month", "Please select a month.", nil, "MENU_OK" )
		return 
	elseif f1269_local11 == nil then
		OpenGenericSmallPopup( f1269_arg0, f1269_arg2, "Please select a day", "Please select a day.", nil, "MENU_OK" )
		return 
	elseif f1269_local12 == nil then
		OpenGenericSmallPopup( f1269_arg0, f1269_arg2, "Please select a year", "Please select a year.", nil, "MENU_OK" )
		return 
	else
		Engine.AccountLinkRegister( f1269_arg2, f1269_local13 )
	end
end

function OpenRegistrationFlow( f1270_arg0, f1270_arg1, f1270_arg2, f1270_arg3 )
	local f1270_local0 = Engine.GetMarketingMessage( f1270_arg2, "registration" )
	if f1270_local0 == nil or Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "MtxCommsRegistration" ), "locationID" ) ) == 1 then
		local f1270_local1 = Engine.GetMarketingMessage( f1270_arg2, "motd" )
		if f1270_local1 ~= nil and f1270_local1.bannerAction ~= nil and LUI.startswith( f1270_local1.bannerAction, "store" ) then
			local f1270_local2 = GoBack( f1270_arg0, f1270_arg2 )
			CoD.StoreUtility.SetupFocusCategory( f1270_arg2, f1270_local1.bannerAction )
			OpenStore( f1270_arg0, f1270_arg1, f1270_arg2, "MOTDBanner", f1270_local2 )
		end
	else
		local f1270_local1 = f1270_local0.action
		if f1270_local1 ~= nil then
			LUI.CoDMetrics.CRMMessageInteraction( f1270_arg0, f1270_arg2, "registration" )
			if f1270_local1 == "registration" then
				local f1270_local2 = GoBack( f1270_arg0, f1270_arg2 )
				local f1270_local3 = f1270_local2:openOverlay( "InGameRegistration", f1270_arg2 )
				f1270_local3.crm_message_id = f1270_local0.messageID
			elseif f1270_local1 == "opt-in" then
				local f1270_local2 = GoBack( f1270_arg0, f1270_arg2 )
				local f1270_local3 = f1270_local2:openOverlay( "InGameOptIn", f1270_arg2 )
				f1270_local3.crm_message_id = f1270_local0.messageID
			elseif LUI.startswith( f1270_local1, "store" ) then
				local f1270_local2 = GoBack( f1270_arg0, f1270_arg2 )
				if f1270_local0.content_long == "" then
					if CoD.isPC then
						OpenSteamStore( f1270_arg0, f1270_arg1, f1270_arg2, "MOTDBanner", f1270_local2 )
					else
						CoD.StoreUtility.SetupFocusCategory( f1270_arg2, f1270_local1 )
						OpenStore( f1270_arg0, f1270_arg1, f1270_arg2, "MOTDBanner", f1270_local2 )
					end
				else
					OpenCRMFeaturedPopup( f1270_arg0, f1270_arg1, f1270_arg2, "MOTDBanner", f1270_local2 )
				end
			elseif f1270_local1 == "blackmarket" then
				local f1270_local2 = GoBack( f1270_arg0, f1270_arg2 )
				if f1270_local0.content_long == "" then
					Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "blackmarketOpenSource" ), Engine.GetCurrentMode() )
					Engine.SwitchMode( f1270_arg2, "mp" )
					OpenBlackMarket( f1270_local2, nil, f1270_arg2 )
				else
					OpenCRMFeaturedPopup( f1270_arg0, f1270_arg1, f1270_arg2, "MOTDBanner", f1270_local2 )
				end
			elseif f1270_local1 == "drmonty" then
				local f1270_local2 = GoBack( f1270_arg0, f1270_arg2 )
				if f1270_local0.content_long == "" then
					Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "megachewOpenSource" ), Engine.GetCurrentMode() )
					Engine.SwitchMode( f1270_arg2, "zm" )
					OpenMegaChewFactorymenu( f1270_arg0, f1270_arg1, f1270_arg2, f1270_local2.name, f1270_local2 )
				else
					OpenCRMFeaturedPopup( f1270_arg0, f1270_arg1, f1270_arg2, "MOTDBanner", f1270_local2 )
				end
			elseif f1270_local1 == "contracts" then
				local f1270_local2 = GoBack( f1270_arg0, f1270_arg2 )
				if f1270_local0.content_long == "" then
					Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "contractsOpenSource" ), Engine.GetCurrentMode() )
					Engine.SwitchMode( f1270_arg2, "mp" )
					LuaUtils.CycleContracts()
					OpenOverlay( f1270_local2, "BM_Contracts", f1270_arg2 )
				else
					OpenCRMFeaturedPopup( f1270_arg0, f1270_arg1, f1270_arg2, "MOTDBanner", f1270_local2 )
				end
			elseif f1270_local1 == "promo" then
				local f1270_local2 = GoBack( f1270_arg0, f1270_arg2 )
				if f1270_local0.content_long == "" then
					Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "promoOpenSource" ), Engine.GetCurrentMode() )
					Engine.SwitchMode( f1270_arg2, "mp" )
					OpenOverlay( f1270_local2, "RoadToCWL", f1270_arg2 )
				else
					OpenCRMFeaturedPopup( f1270_arg0, f1270_arg1, f1270_arg2, "MOTDBanner", f1270_local2 )
				end
			elseif f1270_local1 == "expand" then
				OpenCRMFeaturedPopup( f1270_arg0, f1270_arg1, f1270_arg2, "MOTDBanner", GoBack( f1270_arg0, f1270_arg2 ) )
			end
		end
	end
end

function OpenRegistrationBrowser( f1271_arg0, f1271_arg1, f1271_arg2, f1271_arg3 )
	local f1271_local0 = GoBack( f1271_arg0, f1271_arg2 )
	local f1271_local1 = f1271_local0:openOverlay( "Spinner", f1271_arg2 )
	f1271_local1:registerEventHandler( "registration_success", function ( element, event )
		CoD.OverlayUtility.CreateOverlay( f1271_arg2, element, "RegistrationSuccess" )
		element:close()
	end )
	f1271_local1:registerEventHandler( "registration_failure", function ( element, event, f1273_arg2 )
		FinishRegistrationFlow( element, f1271_arg2, element )
	end )
	Engine.OpenRegistrationBrowser( f1271_arg2 )
end

function OptInToEmailMarketing( f1274_arg0, f1274_arg1, f1274_arg2, f1274_arg3 )
	local f1274_local0 = GoBack( f1274_arg0, f1274_arg2 )
	local f1274_local1 = f1274_local0:openOverlay( "Spinner", f1274_arg2 )
	f1274_local1:registerEventHandler( "optin_success", function ( element, event )
		CoD.OverlayUtility.CreateOverlay( f1274_arg2, element, "OptInSuccess" )
		element:close()
	end )
	f1274_local1:registerEventHandler( "registration_failure", function ( element, event, f1276_arg2 )
		FinishRegistrationFlow( element, f1274_arg2, element )
	end )
	Engine.OptInToEmailMarketing( f1274_arg2 )
end

function FinishRegistrationFlow( f1277_arg0, f1277_arg1, f1277_arg2 )
	if Dvar.ui_execdemo_beta:get() then
		if IsFirstTimeSetup( f1277_arg1, Enum.eModes.MODE_MULTIPLAYER ) then
			OpenMPFirstTimeFlow( f1277_arg0, nil, f1277_arg1, nil, f1277_arg2 )
		else
			local f1277_local0 = LobbyData:GetCurrentMenuTarget()
			if f1277_local0.id == LobbyData.UITargets.UI_MAIN.id then
				NavigateToLobby_FirstTimeFlowMP( f1277_arg0, nil, f1277_arg1, f1277_arg2 )
			else
				GoBackToMenu( f1277_arg2, f1277_arg1, "Lobby" )
			end
		end
	else
		if Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( f1277_arg1 ), "MOTDMenu.ActionSource" ) ) == "FeaturedWidget" then
			GoBack( f1277_arg2, f1277_arg1 )
			return 
		end
		NavigateToLobby( f1277_arg0, "ModeSelect", false, f1277_arg1 )
	end
	SendClientScriptMenuChangeNotify( f1277_arg1, f1277_arg2, false )
	Close( f1277_arg0, f1277_arg1 )
end

function ChatClientInputStart( f1278_arg0, f1278_arg1, f1278_arg2, f1278_arg3 )
	if not ChatClientIsAvailable( f1278_arg0, f1278_arg1, f1278_arg2 ) then
		return 
	else
		ChatClientInputChannelSet( f1278_arg0, f1278_arg1, f1278_arg2, f1278_arg3 )
		Engine.ChatClient_InputStart( f1278_arg2 )
	end
end

function ChatClientInputChannelSet( f1279_arg0, f1279_arg1, f1279_arg2, f1279_arg3 )
	local f1279_local0 = CoD.ChatClientUtility.GetChannelFromString( f1279_arg3 )
	if f1279_local0 ~= nil then
		Engine.ChatClient_InputChannelSet( f1279_arg2, f1279_local0 )
	end
end

function ChatClientResetSubMenus( f1280_arg0, f1280_arg1, f1280_arg2 )
	CoD.ChatClientUtility.ResetSettingsMenu()
	CoD.ChatClientUtility.ResetInputChannelSelectorMenu()
end

function ChatClientInputArrangeText( f1281_arg0, f1281_arg1, f1281_arg2 )
	if f1281_arg0 and f1281_arg0.arrangeText ~= nil then
		f1281_arg0:arrangeText()
		return 
	end
	local f1281_local0 = f1281_arg0:getParent()
	if f1281_local0 and f1281_local0.arrangeText ~= nil then
		f1281_local0:arrangeText()
	end
end

function ChatClientInputTextFieldUpdatePrompt( f1282_arg0, f1282_arg1, f1282_arg2 )
	if Engine.ChatClient_IsChatting( f1282_arg2 ) then
		local f1282_local0 = Engine.ChatClient_InputChannelGet( f1282_arg2 )
		local f1282_local1 = Engine.Localize( Engine.ChatClient_ChannelStringGet( f1282_local0 ) ) .. ": "
		Engine.SetModelValue( CoD.ChatClientUtility.GetInputChannelColorModel(), Engine.ChatClient_ChannelColorGet( f1282_arg2, f1282_local0 ) )
		Engine.SetModelValue( CoD.ChatClientUtility.GetInputChannelTextModel(), f1282_local1 )
		return 
	else
		Engine.SetModelValue( CoD.ChatClientUtility.GetInputChannelTextModel(), "" )
		if Engine.IsInGame() then
			Engine.SetModelValue( CoD.ChatClientUtility.GetInputTextModel(), "" )
			Engine.SetModelValue( CoD.ChatClientUtility.GetInputChannelTextModel(), "" )
			return 
		elseif not ChatClientEnabled( f1282_arg2 ) then
			Engine.SetModelValue( CoD.ChatClientUtility.GetInputTextModel(), Engine.Localize( "PLATFORM_CHAT_DISABLED" ) )
			return 
		elseif not ChatClientIsAvailable( f1282_arg0, f1282_arg1, f1282_arg2 ) then
			Engine.SetModelValue( CoD.ChatClientUtility.GetInputTextModel(), Engine.Localize( "PLATFORM_CHAT_NOT_AVAILABLE" ) )
			return 
		else
			Engine.SetModelValue( CoD.ChatClientUtility.GetInputTextModel(), Engine.Localize( "PLATFORM_CHAT_CLICK_TO_ENTER_CHAT" ) )
		end
	end
end

function ChatClientFilterChannelSet( f1283_arg0, f1283_arg1, f1283_arg2, f1283_arg3, f1283_arg4 )
	local f1283_local0 = CoD.ChatClientUtility.GetChannelFromString( f1283_arg3 )
	local f1283_local1 = Engine.GetModelValue( f1283_arg4 )
	if f1283_local0 ~= nil and f1283_local1 ~= nil then
		Engine.ChatClient_FilterChannelSet( f1283_arg2, f1283_local0, f1283_local1 )
	end
end

function ChatClientShowTimestampsSet( f1284_arg0, f1284_arg1, f1284_arg2, f1284_arg3 )
	return Engine.ChatClient_ShowTimestampsSet( f1284_arg2, Engine.GetModelValue( f1284_arg3 ) )
end

function ChatClientShowChannelSet( f1285_arg0, f1285_arg1, f1285_arg2, f1285_arg3 )
	return Engine.ChatClient_ShowChannelSet( f1285_arg2, Engine.GetModelValue( f1285_arg3 ) )
end

function ChatClientInputChannelSelectorHide( f1286_arg0, f1286_arg1, f1286_arg2 )
	CoD.ChatClientUtility.ResetInputChannelSelectorMenu()
end

function ChatClientResetState( f1287_arg0, f1287_arg1, f1287_arg2 )
	Engine.ChatClient_ResetState( f1287_arg2 )
end

function RestrictVoiceChatForClient( f1288_arg0, f1288_arg1, f1288_arg2 )
	local f1288_local0 = CoD.SafeGetModelValue( f1288_arg1:getModel(), "xuid" )
	if f1288_local0 then
		Engine.RestrictVoiceChatForClient( Enum.LobbyType.LOBBY_TYPE_GAME, f1288_local0 )
	end
end

function AllowVoiceChatForClient( f1289_arg0, f1289_arg1, f1289_arg2 )
	local f1289_local0 = CoD.SafeGetModelValue( f1289_arg1:getModel(), "xuid" )
	if f1289_local0 then
		Engine.AllowVoiceChatForClient( Enum.LobbyType.LOBBY_TYPE_GAME, f1289_local0 )
	end
end

function ResetControlsToDefault( f1290_arg0, f1290_arg1, f1290_arg2, f1290_arg3 )
	Engine.Exec( f1290_arg2, "resetprofilecommon" )
	Engine.Exec( f1290_arg2, "updategamerprofile" )
	Engine.Exec( f1290_arg2, "storagereset stats_mp_offline" )
	CoD.OverlayUtility.AddSystemOverlay( "ResetControlsToDefault", {
		menuName = "SystemOverlay_Compact",
		title = "MENU_RESET_TO_DEFAULT_CAPS",
		description = "MENU_RESET_TO_DEFAULTS_SUCCESSFUL",
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ()
			DataSources.TestPopup_List = DataSourceHelpers.ListSetup( "ResetControlsToDefault_List", function ( f1292_arg0 )
				return {
					{
						models = {
							displayText = "Yes"
						},
						properties = {
							action = function ( f1293_arg0, f1293_arg1, f1293_arg2, f1293_arg3, f1293_arg4 )
								GoBack( f1293_arg2 )
							end
							
						}
					}
				}
			end, true, nil )
			return "ResetControlsToDefault_List"
		end
	} )
	CoD.OverlayUtility.CreateOverlay( f1290_arg2, f1290_arg3, "ResetControlsToDefault" )
end

function ChangeLanguage( f1294_arg0, f1294_arg1, f1294_arg2, f1294_arg3, f1294_arg4 )
	if f1294_arg3 == Engine.GetLanguage() then
		GoBack( f1294_arg0, f1294_arg2 )
		return 
	else
		Engine.SetLanguage( f1294_arg3 )
		CoD.OverlayUtility.AddSystemOverlay( "Restart_Popup", {
			menuName = "SystemOverlay_Compact",
			title = Engine.Localize( "MENU_NOTICE" ),
			description = Engine.Localize( "MENU_RESTART_WARNING" ),
			categoryType = CoD.OverlayUtility.OverlayTypes.Alert,
			listDatasource = function ()
				DataSources.Restart_Popup = DataSourceHelpers.ListSetup( "Restart_Popup", function ( f1296_arg0 )
					return {
						{
							models = {
								displayText = "OK"
							},
							properties = {
								action = function ( f1297_arg0, f1297_arg1, f1297_arg2, f1297_arg3, f1297_arg4 )
									Engine.RebootGame()
								end
								
							}
						}
					}
				end, true, nil )
				return "Restart_Popup"
			end
		} )
		CoD.OverlayUtility.CreateOverlay( f1294_arg2, f1294_arg4, "Restart_Popup" )
		return true
	end
end

function SetDownloadPreference( f1298_arg0, f1298_arg1 )
	Engine.ChoosePreferredDownloadOrder( f1298_arg0, f1298_arg1 )
end

function SetFirstTimeDurangoDownloadSettingDisplayed( f1299_arg0 )
	CoD.LobbyBase.DisplayedFirstTimeDurangoDownloadSetting = true
end

function ResetCampaign( f1300_arg0, f1300_arg1, f1300_arg2 )
	f1300_arg2:OpenModalDialog( f1300_arg0, f1300_arg1, "MENU_RESET_CAMPAIGN", "MENU_RESET_CAMPAIGN_WARNING", {
		"MPUI_YES",
		"MPUI_NO"
	}, function ( f1301_arg0 )
		if f1301_arg0 == 0 then
			Engine.ResetCampaign()
		end
		return true
	end )
end

function CombatRecordShowModelForItemIndex( f1302_arg0, f1302_arg1 )
	local f1302_local0 = 0
	local f1302_local1 = f1302_arg1:getModel( f1302_arg0, "itemIndex" )
	if f1302_local1 then
		f1302_local0 = Engine.GetModelValue( f1302_local1 )
	end
	Engine.SendClientScriptNotify( f1302_arg0, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f1302_arg0 ), Engine.GetLoadoutSlotForItem( f1302_local0, CoD.GetCombatRecordMode() ), Engine.GetItemRef( f1302_local0, CoD.GetCombatRecordMode() ) .. "_" .. CoD.GetCombatRecordModeAbbreviation(), "select01", "0,0,0", nil, true )
end

function CombatRecordShowModelForBubblegumBuff( f1303_arg0, f1303_arg1 )
	local f1303_local0 = 0
	local f1303_local1 = f1303_arg1:getModel( f1303_arg0, "itemIndex" )
	if f1303_local1 then
		f1303_local0 = Engine.GetModelValue( f1303_local1 )
	end
	Engine.SendClientScriptNotify( f1303_arg0, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f1303_arg0 ), Engine.GetItemGroup( f1303_local0, Enum.eModes.MODE_ZOMBIES ), "p7_" .. Engine.GetItemRef( f1303_local0, Enum.eModes.MODE_ZOMBIES ) .. "_ui", "select01" )
end

function CombatRecordShowCybercoreModelForItemIndex( f1304_arg0, f1304_arg1 )
	local f1304_local0 = 0
	local f1304_local1 = f1304_arg1:getModel( f1304_arg0, "cybercoreIndex" )
	if f1304_local1 then
		f1304_local0 = Engine.GetModelValue( f1304_local1 )
	end
	Engine.SendClientScriptNotify( f1304_arg0, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f1304_arg0 ), Engine.GetLoadoutSlotForItem( f1304_local0, CoD.GetCombatRecordMode() ), CoD.CACUtility.GetCybercoreXModel( f1304_local0, CoD.GetCombatRecordMode() ), "select01", "0,0,0", nil, true )
end

function CombatRecordShowHero( f1305_arg0, f1305_arg1 )
	local f1305_local0 = 0
	local f1305_local1 = f1305_arg1:getModel( f1305_arg0, "heroIndex" )
	if f1305_local1 then
		f1305_local0 = Engine.GetModelValue( f1305_local1 )
	end
	Engine.SendClientScriptNotify( f1305_arg0, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f1305_arg0 ), "changeHero", f1305_local0, CoD.GetCombatRecordMode() )
	if CoD.GetCombatRecordMode() == Enum.eModes.MODE_MULTIPLAYER and f1305_local0 == LuaUtils.GetBlackjackHeroIndex( CoD.GetCombatRecordMode() ) then
		local f1305_local2 = CoD.SafeGetModelValue( f1305_arg1:getModel(), "type" )
		if f1305_local2 then
			Engine.SendClientScriptNotify( f1305_arg0, CoD.CCUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( f1305_arg0 ), "changeHelmet", f1305_local2, CoD.GetCombatRecordMode(), true )
		end
	end
end

function CombatRecordUpdateCollectibles( f1306_arg0, f1306_arg1, f1306_arg2 )
	CoD.perController[f1306_arg1].inspectingMap = CoD.SafeGetModelValue( f1306_arg2:getModel(), "id" )
	f1306_arg0.Collectibles:updateDataSource()
end

function CombatRecordTabChanged( f1307_arg0, f1307_arg1, f1307_arg2 )
	if not CoD.CombatRecordPreventModeChange then
		CoD.CombatRecordMode = f1307_arg1.tabId
	end
end

function CombatRecordMedalsTabChanged( f1308_arg0, f1308_arg1, f1308_arg2 )
	CoD.CombatRecordMedalCategory = f1308_arg1.tabId
	CoD.CombatRecordMedalSortFunc = f1308_arg1.sortFunc
	if f1308_arg0.MedalsGrid then
		f1308_arg0.MedalsGrid:updateDataSource()
	end
end

function CombatRecordAccoladesChangeMap( f1309_arg0, f1309_arg1, f1309_arg2, f1309_arg3 )
	local f1309_local0 = {}
	local f1309_local1 = 0
	local f1309_local2 = 0
	local f1309_local3 = Engine.GetModel( Engine.GetModelForController( f1309_arg1 ), "CombatRecordAccolades" )
	for f1309_local7, f1309_local8 in LUI.IterateTableBySortedKeys( CoD.mapsTable, function ( f1310_arg0, f1310_arg1 )
		return CoD.mapsTable[f1310_arg0].unique_id < CoD.mapsTable[f1310_arg1].unique_id
	end, nil ) do
		if f1309_local8.session_mode == Enum.eModes.MODE_CAMPAIGN and f1309_local8.campaign_mode == 0 and f1309_local8.dlc_pack ~= -1 and f1309_local8.isSubLevel == false then
			table.insert( f1309_local0, f1309_local8.unique_id )
			if CoD.SafeGetModelValue( f1309_local3, "unique_id" ) == f1309_local8.unique_id then
				f1309_local1 = f1309_local2
			end
			f1309_local2 = f1309_local2 + 1
		end
	end
	Engine.SetModelValue( Engine.GetModel( f1309_local3, "unique_id" ), f1309_local0[(f1309_local1 + f1309_arg3) % f1309_local2 + 1] )
end

function CombatRecordOpenCallingCards( f1311_arg0, f1311_arg1, f1311_arg2, f1311_arg3 )
	local f1311_local0 = f1311_arg2:openOverlay( "CallingCards", f1311_arg1 )
	local f1311_local1 = f1311_arg3:getModel( f1311_arg1, "slotIndex" )
	if f1311_local1 then
		f1311_local0.callingCardShowcaseSlot = Engine.GetModelValue( f1311_local1 )
	end
end

function CombatRecordClearCallingCard( f1312_arg0, f1312_arg1, f1312_arg2 )
	local f1312_local0 = CoD.SafeGetModelValue( f1312_arg1:getModel(), "slotIndex" )
	if f1312_local0 then
		Engine.SetCombatRecordBackgroundId( f1312_arg2, 0, f1312_local0 )
		local f1312_local1 = Engine.GetModel( Engine.GetGlobalModel(), "CallingCardShowcaseUpdated" )
		if f1312_local1 then
			Engine.ForceNotifyModelSubscriptions( f1312_local1 )
		end
	end
end

function CombatRecordOpenProfileSnapshot( f1313_arg0, f1313_arg1 )
	CoD.perController[f1313_arg1].combatRecordProfileSnapshot = true
	OpenLocalScreenshots( f1313_arg0, f1313_arg1 )
end

function CombatRecordProfileSnapshotFullscreenView( f1314_arg0, f1314_arg1 )
	CoD.FileshareUtility.SetSelectedItem( DataSources.CombatRecordProfileSnapshot.getModel( f1314_arg1 ) )
	CoD.perController[f1314_arg1].combatRecordProfileSnapshot = true
	CoD.FileshareUtility.SetCurrentCategory( "screenshot_private" )
	OpenOverlay( f1314_arg0, "Fileshare_ScreenshotDetailsView", f1314_arg1 )
end

function CombatRecordSetProfileSnapshot( f1315_arg0 )
	local f1315_local0 = CoD.FileshareUtility.GetSelectedItemProperty( "codeIndex" )
	local f1315_local1 = CoD.FileshareUtility.GetCurrentCategory()
	local f1315_local2, f1315_local3 = CoD.FileshareUtility.GetCurrentFilter()
	local f1315_local4 = Engine.FileshareGetSlotData( f1315_arg0, f1315_local1, f1315_local2, f1315_local3, f1315_local0 )
	if f1315_local4 then
		local f1315_local5 = f1315_local4.fileId
		if not f1315_local5 then
			f1315_local5 = Engine.DefaultID64Value()
		end
		Engine.SetCombatRecordScreenshotInfo( f1315_arg0, f1315_local5, f1315_local4.fileSize or 0, f1315_local4.fileName )
		DataSources.CombatRecordProfileSnapshot.getModel( f1315_arg0 )
	end
end

function CombatRecordClearProfileSnapshot( f1316_arg0 )
	local f1316_local0 = Engine.DefaultID64Value()
	Engine.SetCombatRecordScreenshotInfo( f1316_arg0, f1316_local0, f1316_local0, "" )
	DataSources.CombatRecordProfileSnapshot.getModel( f1316_arg0 )
end

function CombatRecordProfileSnapshotDownloadScreenshot( f1317_arg0 )
	local f1317_local0 = DataSources.CombatRecordProfileSnapshot.getModel( f1317_arg0 )
	if f1317_local0 then
		local f1317_local1 = CoD.SafeGetModelValue( f1317_local0, "fileId" )
		if not f1317_local1 then
			f1317_local1 = Engine.DefaultID64Value()
		end
		if f1317_local1 ~= CoD.currentScreenshot then
			if not Engine.IsScreenshotReady( Enum.ScreenshotViewType.UI_SCREENSHOT_TYPE_SCREENSHOT, f1317_local1 ) then
				Engine.DestroyScreenshot( f1317_arg0 )
			else
				CombatRecordProfileSnapshotDestroyScreenshot( f1317_arg0 )
			end
			local f1317_local2 = CoD.SafeGetModelValue( f1317_local0, "fileSize" )
			if f1317_local1 ~= Engine.DefaultID64Value() and f1317_local2 ~= Engine.DefaultID64Value() then
				Engine.DownloadScreenshot( f1317_arg0, f1317_local1, f1317_local2 )
				CoD.currentScreenshot = f1317_local1
			end
		end
	end
end

function CombatRecordProfileSnapshotDestroyScreenshot( f1318_arg0 )
	if IsCombatRecordForRemotePlayer() or CoD.currentScreenshot then
		Engine.DestroyScreenshot( f1318_arg0 )
		CoD.currentScreenshot = nil
	end
end

function CombatRecordSetHeadingKickerTextToCombatRecordGameMode()
	local f1319_local0 = SessionModeToLocalizedSessionMode( CoD.GetCombatRecordMode() )
	local f1319_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerText" )
	if f1319_local1 then
		Engine.SetModelValue( f1319_local1, Engine.Localize( f1319_local0 ) )
	end
end

function CombatRecordSetHeadingKickerTextToCombatRecordMode()
	if CoD.GetCombatRecordMode() ~= Enum.eModes.MODE_MULTIPLAYER then
		CombatRecordSetHeadingKickerTextToCombatRecordGameMode()
		return 
	end
	local f1320_local0 = Engine.Localize( "MPUI_SUMMARY_CAPS" )
	if CoD.CombatRecordMode == "public" then
		f1320_local0 = Engine.Localize( "MENU_COMBAT_RECORD_TAB_PUBLIC_CAPS" )
	elseif CoD.CombatRecordMode == "arena" then
		f1320_local0 = Engine.Localize( "MENU_ARENA_CAPS" )
	end
	local f1320_local1 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.headingKickerText" )
	if f1320_local1 then
		Engine.SetModelValue( f1320_local1, f1320_local0 )
	end
end

function CombatRecordSetXUIDForLocalController( f1321_arg0 )
	CoD.CombatRecordXUID = Engine.GetXUID64( f1321_arg0 )
	CoD.CombatRecordOtherPlayerStats = false
end

function CombatRecordSetXUIDFromSelectedFriend( f1322_arg0 )
	local f1322_local0 = Engine.GetModel( Engine.GetModelForController( f1322_arg0 ), "Social.selectedFriendXUID" )
	if f1322_local0 then
		CoD.CombatRecordXUID = Engine.GetModelValue( f1322_local0 )
		CoD.CombatRecordMode = "public"
	end
end

function CombatRecordOpenFromPlayerDetails( f1323_arg0, f1323_arg1, f1323_arg2, f1323_arg3, f1323_arg4 )
	CombatRecordSetMenuForPostStatsLoad( f1323_arg0, "ViewRemoteCombatRecord" )
	CombatRecordSetXUIDFromSelectedFriend( f1323_arg2 )
	OpenPopup( f1323_arg0, "Social_InspectPlayerPopupLoading", f1323_arg2 )
	CombatRecordReadOtherPlayerStats( f1323_arg2 )
end

function CombatRecordSetMenuForPostStatsLoad( f1324_arg0, f1324_arg1 )
	CoD.CombatRecordPostStatsLoadMenuName = f1324_arg1
end

function CombatRecordGoBackAndOpenOverlayForPostStatsLoad( f1325_arg0, f1325_arg1 )
	GoBackAndOpenOverlayOnParent( f1325_arg0, CoD.CombatRecordPostStatsLoadMenuName, f1325_arg1 )
end

function CombatRecordReadOtherPlayerStats( f1326_arg0 )
	CoD.CombatRecordOtherPlayerStats = true
	Engine.ReadOtherPlayerStats( f1326_arg0, CoD.CombatRecordXUID, CoD.GetCombatRecordMode() )
end

function CombatRecordCompareAgainstLocalPlayer( f1327_arg0 )
	local f1327_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "OtherPlayerStats" )
	if f1327_local0 then
		local f1327_local1 = Engine.GetGamertagForController( f1327_arg0 )
		if f1327_local1 then
			local f1327_local2 = Engine.CreateModel( f1327_local0, "gamertag" )
			if f1327_local2 then
				Engine.SetModelValue( f1327_local2, f1327_local1 )
			end
		end
		local f1327_local2 = Engine.GetXUID64( f1327_arg0 )
		if f1327_local2 then
			local f1327_local3 = Engine.CreateModel( f1327_local0, "xuid" )
			if f1327_local3 then
				Engine.SetModelValue( f1327_local3, f1327_local2 )
			end
		end
	end
end

function CombatRecordSelectFriend( f1328_arg0, f1328_arg1, f1328_arg2 )
	local f1328_local0 = Engine.CreateModel( Engine.GetGlobalModel(), "OtherPlayerStats" )
	local f1328_local1 = nil
	if f1328_local0 then
		local f1328_local2 = f1328_arg1:getModel( f1328_arg2, "identityBadge.gamertag" )
		if f1328_local2 then
			f1328_local1 = Engine.GetModelValue( f1328_local2 )
		end
	end
	if f1328_local1 then
		local f1328_local2 = Engine.CreateModel( f1328_local0, "gamertag" )
		if f1328_local2 then
			Engine.SetModelValue( f1328_local2, f1328_local1 )
		end
	end
	local f1328_local2 = nil
	local f1328_local3 = f1328_arg1:getModel( f1328_arg2, "identityBadge.xuid" )
	if f1328_local3 then
		f1328_local2 = Engine.GetModelValue( f1328_local3 )
	end
	if f1328_local2 then
		if f1328_local0 then
			local f1328_local4 = Engine.CreateModel( f1328_local0, "XUID" )
			if f1328_local4 then
				Engine.SetModelValue( f1328_local4, f1328_local2 )
			end
		end
		Engine.ReadOtherPlayerStats( f1328_arg2, f1328_local2, CoD.GetCombatRecordMode() )
	end
end

function CombatRecordSetComparing( f1329_arg0, f1329_arg1, f1329_arg2 )
	local f1329_local0 = Engine.CreateModel( Engine.GetModelForController( f1329_arg1 ), "CombatRecordComparing" )
	if f1329_local0 then
		Engine.SetModelValue( f1329_local0, f1329_arg2 )
	end
end

function CombatRecordUpdateSelfIdentityWidget( f1330_arg0, f1330_arg1 )
	if CoD.CombatRecordOtherPlayerStats == true then
		local f1330_local0 = f1330_arg0.MenuFrame
		local f1330_local1 = Engine.GetModelForController( f1330_arg1 )
		local f1330_local2 = Engine.GetModel( f1330_local1, "socialPlayerInfo" )
		local f1330_local3 = Engine.GetModel( f1330_local1, "socialPlayerInfo.identityBadge" )
		if f1330_local0 and f1330_local2 and f1330_local3 then
			if f1330_local0.SelfIdentityBadge then
				f1330_local0.SelfIdentityBadge:setModel( f1330_local3, f1330_arg1 )
			end
			if f1330_local0.SelfIdentityBadge.CallingCard.CallingCardsFrameWidget then
				f1330_local0.SelfIdentityBadge.CallingCard.CallingCardsFrameWidget:setModel( f1330_local2, f1330_arg1 )
			end
		end
	end
end

function ShowcaseUpdateSelfIdentityWidget( f1331_arg0, f1331_arg1 )
	if CoD.ShowcaseOtherPlayerStats == true then
		local f1331_local0 = f1331_arg0.SelfIdentityBadge
		local f1331_local1 = Engine.GetModelForController( f1331_arg1 )
		local f1331_local2 = Engine.GetModel( f1331_local1, "socialPlayerInfo" )
		local f1331_local3 = Engine.GetModel( f1331_local1, "socialPlayerInfo.identityBadge" )
		if f1331_local0 and f1331_local2 and f1331_local3 then
			if f1331_local0 then
				f1331_local0:setModel( f1331_local3, f1331_arg1 )
			end
			if f1331_local0.CallingCard.CallingCardsFrameWidget then
				f1331_local0.CallingCard.CallingCardsFrameWidget:setModel( f1331_local2, f1331_arg1 )
			end
		end
	end
end

function StartLiveEvent( f1332_arg0, f1332_arg1 )
	Engine.Exec( f1332_arg0, "setliveevent " .. (Engine.TableLookup( nil, "gamedata/tables/common/live_event_streamers.csv", 0, f1332_arg1 or 0, 1 ) or "") )
end

function SelectLiveEventQuality( f1333_arg0 )
	SelectLiveEventQuality_Internal( f1333_arg0.qualityId )
end

function ValidateMPLootWeapons( f1334_arg0 )
	CoD.CACUtility.ValidateMPLootWeapons( f1334_arg0 )
end

function ActivateSpecialContract( f1335_arg0, f1335_arg1, f1335_arg2 )
	local f1335_local0 = f1335_arg1.contractIndex
	if not f1335_local0 then
		f1335_local0 = tonumber( Engine.GetModelValue( Engine.GetModel( f1335_arg1:getModel(), "index" ) ) )
	end
	local f1335_local1 = Engine.StorageGetBuffer( f1335_arg2, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	local f1335_local2 = f1335_local1.contracts[LuaUtils.BMContracts.specialContractIndex]
	local f1335_local3 = f1335_local1.weaponContractData
	f1335_local2.active:set( 1 )
	f1335_local2.award_given:set( 0 )
	f1335_local2.index:set( f1335_local0 )
	f1335_local2.progress:set( 0 )
	f1335_local3.currentValue:set( 0 )
	f1335_local3.matchesPlayed:set( 0 )
	f1335_local3.startTimestamp:set( 0 )
end

function ValidateBlackjackPurchase( f1336_arg0 )
	LuaUtils.ValidateBlackjackPurchaseForController( f1336_arg0 )
end

function RedeemWinterRewardAction( f1337_arg0, f1337_arg1, f1337_arg2, f1337_arg3 )
	local f1337_local0 = {
		CoD.BlackMarketUtility.winter_challenge_reward_sku_tier1,
		CoD.BlackMarketUtility.winter_challenge_reward_sku_tier2,
		CoD.BlackMarketUtility.winter_challenge_reward_sku_tier3,
		CoD.BlackMarketUtility.winter_challenge_reward_sku_tier4
	}
	local f1337_local1 = f1337_local0[tonumber( f1337_arg3 )]
	if f1337_local1 == nil or f1337_local1 == 0 or not Engine.PurchaseDWSKU( f1337_arg1, f1337_local1 ) then
		LuaUtils.UI_ShowErrorMessageDialog( f1337_arg1, "GROUPS_GENERIC_ERROR_MSG", "" )
		return 
	elseif not f1337_arg0.ProcessingWidget then
		GoBack( f1337_arg2, f1337_arg1 )
	end
	f1337_arg0:setState( "Purchasing" )
	f1337_arg0.ProcessingWidget:playClip( "StartPurchasing" )
	f1337_arg0.ProcessingWidget.nextClip = "Purchasing"
	DisableAllMenuInput( f1337_arg2, true )
	CoD.Menu.UpdateAllButtonPrompts( f1337_arg2, f1337_arg1 )
	f1337_arg0.ProcessingWidget:registerEventHandler( "clip_over", function ( element, event )
		if Engine.IsInventoryBusy( f1337_arg1 ) or Engine.GetPurchaseDWSKUResult( f1337_arg1 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_INPROGRESS then
			LUI.UIElement.clipOver( element, event )
		else
			element:playClip( "StopPurchasing" )
			element:registerEventHandler( "clip_over", function ( element, event )
				element:registerEventHandler( "clip_over", LUI.UIElement.clipOver )
				f1337_arg0:setState( "DefaultState" )
				DisableAllMenuInput( f1337_arg2, false )
				if Engine.GetPurchaseDWSKUResult( f1337_arg1 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_SUCCESS then
					CoD.OverlayUtility.CreateOverlay( f1337_arg1, f1337_arg2, "WinterCCRedeemRewardSuccessOverlay", f1337_arg1, actionParam )
					CoD.TurnOnRedeemBtnFocus()
				else
					LuaUtils.UI_ShowErrorMessageDialog( f1337_arg1, "GROUPS_GENERIC_ERROR_MSG", "" )
				end
			end )
		end
	end )
end

function RedeemLoginRewardAction( f1340_arg0, f1340_arg1, f1340_arg2 )
	local f1340_local0 = CoD.LoginRewardSKU
	if f1340_local0 == nil or f1340_local0 == 0 or not Engine.PurchaseDWSKU( f1340_arg1, f1340_local0 ) then
		CoD.OverlayUtility.ShowToast( "LootBonusCamo", Engine.Localize( "GROUPS_SERVICE_NOT_AVAILABLE" ), nil, nil, nil, nil, nil )
		Close( f1340_arg0, f1340_arg1 )
		NavigateToLobby( f1340_arg0, "ModeSelect", false, f1340_arg1 )
		SendClientScriptMenuChangeNotify( f1340_arg1, f1340_arg2, false )
		return 
	elseif not f1340_arg0.ProcessingWidget then
		GoBack( f1340_arg2, f1340_arg1 )
	end
	f1340_arg0:setState( "Purchasing" )
	f1340_arg0.ProcessingWidget:playClip( "StartPurchasing" )
	f1340_arg0.ProcessingWidget.nextClip = "Purchasing"
	DisableAllMenuInput( f1340_arg2, true )
	CoD.Menu.UpdateAllButtonPrompts( f1340_arg2, f1340_arg1 )
	f1340_arg0.ProcessingWidget:registerEventHandler( "clip_over", function ( element, event )
		if Engine.IsInventoryBusy( f1340_arg1 ) or Engine.GetPurchaseDWSKUResult( f1340_arg1 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_INPROGRESS then
			LUI.UIElement.clipOver( element, event )
		else
			element:playClip( "StopPurchasing" )
			element:registerEventHandler( "clip_over", function ( element, event )
				element:registerEventHandler( "clip_over", LUI.UIElement.clipOver )
				f1340_arg0:setState( "DefaultState" )
				DisableAllMenuInput( f1340_arg2, false )
				Close( f1340_arg0, f1340_arg1 )
				NavigateToLobby( f1340_arg0, "ModeSelect", false, f1340_arg1 )
				SendClientScriptMenuChangeNotify( f1340_arg1, f1340_arg2, false )
				if Engine.GetPurchaseDWSKUResult( f1340_arg1 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_SUCCESS then
					local f1342_local0 = CoD.attachmentTable
					local f1342_local1 = CoD.LoginRewardEntitlementString
					local f1342_local2 = 21
					local f1342_local3 = 6
					local f1342_local4 = 4
					CoD.OverlayUtility.ShowToast( "LootBonusCamo", Engine.Localize( Engine.TableLookup( nil, f1342_local0, f1342_local2, f1342_local1, 7 ) ), Engine.Localize( "MPUI_CAMO" ), Engine.TableLookup( nil, f1342_local0, f1342_local2, f1342_local1, f1342_local3 ), nil, nil, nil )
				else
					CoD.OverlayUtility.ShowToast( "LootBonusCamo", Engine.Localize( "GROUPS_SERVICE_NOT_AVAILABLE" ), nil, nil, nil, nil, nil )
				end
			end )
		end
	end )
end

