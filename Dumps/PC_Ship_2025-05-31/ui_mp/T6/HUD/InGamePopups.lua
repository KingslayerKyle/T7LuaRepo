require( "ui_mp.T6.HUD.InGameMenus" )
require( "ui_mp.T6.HUD.InGamePopupMenu" )

CoD.InGamePopups = {}
LUI.createMenu.QuitGamePopup = function ( f1_arg0 )
	local f1_local0 = Engine.GameModeIsMode( CoD.GAMEMODE_RTS )
	local f1_local1 = nil
	if f1_local0 then
		f1_local1 = "MENU_RTS_QUIT_WARNING_DESC"
	else
		f1_local1 = "MENU_NOPROFILE_QUIT_WARNING_DESC"
	end
	local f1_local2 = CoD.InGamePopupMenu.New( "QuitGamePopup", f1_arg0, "default", Engine.Localize( "MENU_QUIT_WARNING" ), Engine.Localize( f1_local1 ), {
		{
			text = Engine.Localize( "MENU_RESUMEGAME_CAPS" ),
			event = "resume_game"
		},
		{
			text = Engine.Localize( "PLATFORM_QUIT_CAPS" ),
			event = "quit_game"
		}
	}, true )
	f1_local2:registerEventHandler( "quit_game", CoD.InGamePopups.QuitGameEvent )
	f1_local2:registerEventHandler( "resume_game", CoD.InGamePopups.ResumeGameEvent )
	return f1_local2
end

LUI.createMenu.SaveAndQuitGamePopup = function ( f2_arg0 )
	local f2_local0 = nil
	f2_local0 = Engine.Localize( "MENU_SAVEQUIT_TEXT_WITHOUT_DEVICE_CHANGE" )
	local f2_local1, f2_local2 = nil
	f2_local1 = "save_and_quit_available"
	f2_local2 = CoD.InGamePopups.SaveAndQuitGameEvent
	local f2_local3 = CoD.InGamePopupMenu.New( "SaveAndQuitGamePopup", f2_arg0, "default", Engine.Localize( "MENU_CONTINUE_SAVING" ), f2_local0, {
		{
			text = Engine.Localize( "MENU_RESUMEGAME_CAPS" ),
			event = "resume_game"
		},
		{
			text = Engine.Localize( "MENU_SAVE_AND_QUIT_CAPS" ),
			event = f2_local1
		}
	}, true )
	f2_local3:registerEventHandler( "resume_game", CoD.InGamePopups.SaveAndQuitGamePopupResume )
	f2_local3:registerEventHandler( f2_local1, f2_local2 )
	return f2_local3
end

CoD.InGamePopups.SaveAndQuitGamePopupResume = function ( f3_arg0, f3_arg1 )
	CoD.InGamePopups.ResumeGameEvent( f3_arg0, f3_arg1 )
end

LUI.createMenu.SaveGameErrorPopup = function ( f4_arg0, f4_arg1 )
	local f4_local0, f4_local1, f4_local2, f4_local3, f4_local4 = nil
	if Dvar.sv_saveDeviceAvailable:get() then
		f4_local0 = Engine.Localize( "PLATFORM_SAVE_ERROR_NOW_OKAY" )
		f4_local1 = Engine.Localize( "MENU_NO_SAVE_DEVICE_WARNING_NOW_OKAY" )
		f4_local2 = Engine.Localize( "MENU_RETRY_SAVE" )
		f4_local3 = "retry_save_game"
		f4_local4 = CoD.InGamePopups.RetrySaveGameEvent
	else
		f4_local0 = Engine.Localize( "PLATFORM_SAVE_ERROR" )
		f4_local1 = Engine.Localize( "MENU_NO_SAVE_DEVICE_WARNING" )
		f4_local2 = Engine.Localize( "PLATFORM_SELECT_SAVE_DEVICE_CAPS" )
		f4_local3 = "retry_save_game"
		f4_local4 = CoD.InGamePopups.SelectSaveDeviceWarningEvent
	end
	local f4_local5 = {
		{
			text = f4_local2,
			event = f4_local3
		},
		{
			text = Engine.Localize( "MENU_RESUMEGAME_CAPS" ),
			event = "resume_no_save"
		},
		{
			text = Engine.Localize( "MENU_QUIT_NO_SAVE" ),
			event = "quit_no_save"
		}
	}
	if f4_arg1 and f4_arg1.saveGameErrorPopupFromCode then
		local f4_local6 = Engine.Localize( "MENU_QUIT_NO_SAVE" )
		for f4_local7 = 1, #f4_local5, 1 do
			if f4_local5[f4_local7].text == f4_local6 then
				table.remove( f4_local5, f4_local7 )
			end
		end
	end
	local f4_local6 = CoD.InGamePopupMenu.New( "SaveGameErrorPopup", f4_arg0, "default", f4_local0, f4_local1, f4_local5 )
	f4_local6:registerEventHandler( "svSaveDeviceAvailableModified", CoD.InGamePopups.SaveDeviceAvailable )
	f4_local6:registerEventHandler( "resume_no_save", CoD.InGamePopups.NoSaveResumeGameEvent )
	f4_local6:registerEventHandler( "quit_no_save", CoD.InGamePopups.NoSaveQuitGameEvent )
	f4_local6:registerEventHandler( f4_local3, f4_local4 )
	return f4_local6
end

LUI.createMenu.SaveGameWarningPopup = function ( f5_arg0 )
	local f5_local0 = CoD.InGamePopupMenu.New( "SaveGameWarningPopup", f5_arg0, "default", Engine.Localize( "MENU_NOTICE" ), Engine.Localize( "MENU_WARNING_SELECTSAVEDEVICE" ), {
		{
			text = Engine.Localize( "MENU_OK" ),
			event = "force_select_save"
		}
	} )
	f5_local0:registerEventHandler( "force_select_save", CoD.InGamePopups.ForceSelectSaveDeviceEvent )
	return f5_local0
end

LUI.createMenu.SaveDeviceWarningPopup = function ( f6_arg0 )
	local f6_local0 = CoD.InGamePopupMenu.New( "SaveDeviceWarningPopup", f6_arg0, "default", Engine.Localize( "MENU_NOTICE" ), Engine.Localize( "MENU_WARNING_SELECTSAVEDEVICE" ), {
		{
			text = Engine.Localize( "MENU_OK" ),
			event = "force_select_save"
		}
	} )
	f6_local0:registerEventHandler( "force_select_save", CoD.InGamePopups.SaveDeviceWarningEvent )
	f6_local0:registerEventHandler( "button_prompt_back", CoD.InGamePopups.CancelEvent )
	return f6_local0
end

LUI.createMenu.SaveGameSavingPopup = function ( f7_arg0 )
	local f7_local0 = CoD.InGamePopupMenu.New( "SaveGameSavingPopup", f7_arg0, "saving", Engine.Localize( "PLATFORM_NOW_SAVING" ) )
	Engine.SaveGame()
	f7_local0.saveTimeUp = false
	f7_local0.saveSaved = false
	f7_local0.controller = f7_arg0
	f7_local0:registerEventHandler( "notify_save_complete", CoD.InGamePopups.SaveSaved )
	f7_local0:registerEventHandler( "notify_save_timeup", CoD.InGamePopups.SaveTimeUp )
	f7_local0:registerEventHandler( "notify_save_forceclose", CoD.InGamePopups.SaveForceClose )
	f7_local0:addElement( LUI.UITimer.new( 4000, "notify_save_timeup", true, f7_local0 ) )
	f7_local0:setPriority( 10000 )
	return f7_local0
end

LUI.createMenu.RestartLevelPopup = function ( f8_arg0 )
	local f8_local0 = CoD.InGamePopupMenu.New( "RestartLevelPopup", f8_arg0, "default", Engine.Localize( "MENU_CONTINUE_RESTART" ), Engine.Localize( "MENU_RESTART_LEVEL_TEXT" ), {
		{
			text = Engine.Localize( "MENU_RESUMEGAME_CAPS" ),
			event = "resume_game"
		},
		{
			text = Engine.Localize( "MENU_RESTART_LEVEL_CAPS" ),
			event = "restart_level"
		}
	}, true )
	f8_local0:registerEventHandler( "restart_level", CoD.InGamePopups.RestartLevelEvent )
	f8_local0:registerEventHandler( "resume_game", CoD.InGamePopups.ResumeGameEvent )
	return f8_local0
end

LUI.createMenu.RestartFromCheckpointPopup = function ( f9_arg0 )
	local f9_local0 = CoD.InGamePopupMenu.New( "RestartFromCheckpointPopup", f9_arg0, "default", Engine.Localize( "MENU_CONTINUE_RESTART_CHECKPOINT" ), Engine.Localize( "MENU_CHECKPOINT_RESTART_TEXT" ), {
		{
			text = Engine.Localize( "MENU_RESUMEGAME_CAPS" ),
			event = "resume_game"
		},
		{
			text = Engine.Localize( "MENU_RESTART_CHECKPOINT_CAPS" ),
			event = "restart_from_checkpoint"
		}
	}, true )
	f9_local0:registerEventHandler( "restart_from_checkpoint", CoD.InGamePopups.RestartFromCheckpointEvent )
	f9_local0:registerEventHandler( "resume_game", CoD.InGamePopups.ResumeGameEvent )
	return f9_local0
end

LUI.createMenu.RestartMissionPopup = function ( f10_arg0 )
	local f10_local0 = CoD.InGamePopupMenu.New( "RestartMissionPopup", f10_arg0, "default", Engine.Localize( "MENU_CONTINUE_RESTART" ), Engine.Localize( "MENU_RESTART_MISSION_TEXT" ), {
		{
			text = Engine.Localize( "MENU_RESUMEGAME_CAPS" ),
			event = "resume_game"
		},
		{
			text = Engine.Localize( "MENU_RESTART_MISSION_CAPS" ),
			event = "restart_mission"
		}
	}, true )
	f10_local0:registerEventHandler( "restart_mission", CoD.InGamePopups.RestartMissionEvent )
	f10_local0:registerEventHandler( "resume_game", CoD.InGamePopups.ResumeGameEvent )
	return f10_local0
end

CoD.InGamePopups.SaveSaved = function ( f11_arg0, f11_arg1 )
	f11_arg0.saveSaved = true
	if f11_arg0.saveTimeUp == true then
		f11_arg0.previousMenuName = nil
		f11_arg0:animateOutAndGoBack()
		f11_arg0 = nil
		Engine.SetDvar( "cl_paused", 0 )
		Engine.Exec( f11_arg1.controller, "disconnect" )
	end
end

CoD.InGamePopups.SaveTimeUp = function ( f12_arg0, f12_arg1 )
	f12_arg0.saveTimeUp = true
	if f12_arg0.saveSaved == true then
		f12_arg0.previousMenuName = nil
		f12_arg0:animateOutAndGoBack()
		f12_arg0 = nil
		Engine.SetDvar( "cl_paused", 0 )
		Engine.Exec( f12_arg1.controller, "disconnect" )
	end
end

CoD.InGamePopups.SaveForceClose = function ( f13_arg0, f13_arg1 )
	f13_arg0.previousMenuName = nil
	f13_arg0:animateOutAndGoBack()
	f13_arg0 = nil
	Engine.SetDvar( "cl_paused", 0 )
end

CoD.InGamePopups.SaveDeviceAvailable = function ( f14_arg0, f14_arg1 )
	f14_arg0:openMenu( "SaveGameErrorPopup", f14_arg1.controller )
	f14_arg0:close()
end

CoD.InGamePopups.ResumeGameEvent = function ( f15_arg0, f15_arg1 )
	Engine.SetDvar( "cl_paused", 0 )
	f15_arg0:processEvent( {
		name = "close_all_ingame_menus",
		controller = f15_arg1.controller
	} )
end

CoD.InGamePopups.RetrySaveGameEvent = function ( f16_arg0, f16_arg1 )
	f16_arg0:openMenu( "SaveGameSavingPopup", f16_arg1.controller )
	f16_arg0:processEvent( {
		name = "close_all_ingame_menus",
		controller = f16_arg1.controller
	} )
end

CoD.InGamePopups.NoSaveResumeGameEvent = function ( f17_arg0, f17_arg1 )
	f17_arg0:processEvent( {
		name = "close_all_ingame_menus",
		controller = f17_arg1.controller
	} )
end

CoD.InGamePopups.NoSaveQuitGameEvent = function ( f18_arg0, f18_arg1 )
	f18_arg0:processEvent( {
		name = "close_all_ingame_menus",
		controller = f18_arg1.controller
	} )
	Engine.SendMenuResponse( f18_arg1.controller, "popup_leavegame", "endround" )
end

CoD.InGamePopups.SelectSaveDeviceWarningEvent = function ( f19_arg0, f19_arg1 )
	f19_arg0:openMenu( "SaveGameWarningPopup", f19_arg1.controller )
	f19_arg0:close()
end

CoD.InGamePopups.ForceSelectSaveDeviceEvent = function ( f20_arg0, f20_arg1 )
	Engine.ExecNow( f20_arg1.controller, "force_select_save_device" )
	f20_arg0:openMenu( "SaveGameErrorPopup", f20_arg1.controller )
	f20_arg0:close()
end

CoD.InGamePopups.SaveDeviceWarningEvent = function ( f21_arg0, f21_arg1 )
	Engine.ExecNow( f21_arg1.controller, "force_select_save_device" )
	f21_arg0:goBack( f21_arg1.controller )
end

CoD.InGamePopups.CancelEvent = function ( f22_arg0, f22_arg1 )
	f22_arg0:goBack( f22_arg1.controller )
end

CoD.InGamePopups.LowerDifficultyEvent = function ( f23_arg0, f23_arg1 )
	local f23_local0 = Engine.GetProfileVarInt( f23_arg1.controller, "g_gameskill" )
	if f23_local0 > 0 then
		Engine.SetProfileVar( f23_arg1.controller, "g_gameskill", f23_local0 - 1 )
		Dvar.saved_gameskill:set( f23_local0 - 1 .. "" )
	end
	Engine.Exec( f23_arg1.controller, "updategamerprofile" )
	Engine.Exec( f23_arg1.controller, "updateDifficultyFromProfile" )
	f23_arg0:goBack( f23_arg1.controller )
end

CoD.InGamePopups.QuitGameEvent = function ( f24_arg0, f24_arg1 )
	f24_arg0:processEvent( {
		name = "close_all_ingame_menus",
		controller = f24_arg1.controller
	} )
	if Dvar.ui_singlemission:get() ~= 0 then
		Engine.ExecNow( f24_arg1.controller, "checkinvite" )
	end
	Engine.SetDvar( "cl_paused", 0 )
	Engine.SendMenuResponse( f24_arg1.controller, "popup_leavegame", "endround" )
	Engine.Exec( f24_arg1.controller, "disconnect" )
end

CoD.InGamePopups.SaveAndQuitGameEvent = function ( f25_arg0, f25_arg1 )
	Engine.Exec( f25_arg1.controller, "updategamerprofile" )
	f25_arg0:openMenu( "SaveGameSavingPopup", f25_arg1.controller )
	f25_arg0:close()
	Engine.SendMenuResponse( f25_arg1.controller, "popup_leavegame", "endround" )
end

CoD.InGamePopups.SaveAndQuitGameUnavailableEvent = function ( f26_arg0, f26_arg1 )
	f26_arg0:openMenu( "SaveGameErrorPopup", f26_arg1.controller )
	f26_arg0:close()
end

CoD.InGamePopups.RestartMissionEvent = function ( f27_arg0, f27_arg1 )
	Dvar.ui_busyBlockIngameMenu:set( 1 )
	f27_arg0:processEvent( {
		name = "close_all_ingame_menus",
		controller = f27_arg1.controller
	} )
	Engine.SetDvar( "cl_paused", 0 )
	Engine.PlayMenuMusic( "death" )
	Engine.Exec( f27_arg1.controller, "stopControllerRumble" )
	Engine.Exec( f27_arg1.controller, "fade 0 0 0 255 0 0 1" )
	Engine.Exec( f27_arg1.controller, "silence" )
	Engine.Exec( f27_arg1.controller, "mission_restart" )
end

CoD.InGamePopups.RestartLevelEvent = function ( f28_arg0, f28_arg1 )
	Dvar.ui_busyBlockIngameMenu:set( 1 )
	f28_arg0:processEvent( {
		name = "close_all_ingame_menus",
		controller = f28_arg1.controller
	} )
	Engine.SetDvar( "cl_paused", 0 )
	Engine.Exec( f28_arg1.controller, "stopControllerRumble" )
	Engine.Exec( f28_arg1.controller, "fade 0 0 0 255 0 0 1" )
	Engine.Exec( f28_arg1.controller, "silence" )
	Engine.Exec( f28_arg1.controller, "fast_restart" )
end

CoD.InGamePopups.RestartFromCheckpointEvent = function ( f29_arg0, f29_arg1 )
	Dvar.ui_busyBlockIngameMenu:set( 1 )
	f29_arg0:dispatchEventToRoot( {
		name = "flush_dynamic_hud"
	} )
	f29_arg0:processEvent( {
		name = "close_all_ingame_menus",
		controller = f29_arg1.controller
	} )
	Engine.SetDvar( "cl_paused", 0 )
	Engine.Exec( f29_arg1.controller, "fade 0 0 0 255 0 0 1" )
	Engine.Exec( f29_arg1.controller, "stopControllerRumble" )
	Engine.Exec( f29_arg1.controller, "silence" )
	Engine.Exec( f29_arg1.controller, "checkpoint_restart" )
end

