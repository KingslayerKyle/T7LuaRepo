require( "ui_mp.T6.HUD.InGameMenus" )
require( "ui_mp.T6.HUD.InGamePopupMenu" )

CoD.InGamePopups = {}
LUI.createMenu.QuitGamePopup = function ( controller )
	local isRTS = Engine.GameModeIsMode( CoD.GAMEMODE_RTS )
	local quitDescription = nil
	if isRTS then
		quitDescription = "MENU_RTS_QUIT_WARNING_DESC"
	else
		quitDescription = "MENU_NOPROFILE_QUIT_WARNING_DESC"
	end
	local popupMenu = CoD.InGamePopupMenu.New( "QuitGamePopup", controller, "default", Engine.Localize( "MENU_QUIT_WARNING" ), Engine.Localize( quitDescription ), {
		{
			text = Engine.Localize( "MENU_RESUMEGAME_CAPS" ),
			event = "resume_game"
		},
		{
			text = Engine.Localize( "PLATFORM_QUIT_CAPS" ),
			event = "quit_game"
		}
	}, true )
	popupMenu:registerEventHandler( "quit_game", CoD.InGamePopups.QuitGameEvent )
	popupMenu:registerEventHandler( "resume_game", CoD.InGamePopups.ResumeGameEvent )
	return popupMenu
end

LUI.createMenu.SaveAndQuitGamePopup = function ( controller )
	local text = nil
	text = Engine.Localize( "MENU_SAVEQUIT_TEXT_WITHOUT_DEVICE_CHANGE" )
	local yesEvent, yesEventfn = nil
	yesEvent = "save_and_quit_available"
	yesEventfn = CoD.InGamePopups.SaveAndQuitGameEvent
	local popupMenu = CoD.InGamePopupMenu.New( "SaveAndQuitGamePopup", controller, "default", Engine.Localize( "MENU_CONTINUE_SAVING" ), text, {
		{
			text = Engine.Localize( "MENU_RESUMEGAME_CAPS" ),
			event = "resume_game"
		},
		{
			text = Engine.Localize( "MENU_SAVE_AND_QUIT_CAPS" ),
			event = yesEvent
		}
	}, true )
	popupMenu:registerEventHandler( "resume_game", CoD.InGamePopups.SaveAndQuitGamePopupResume )
	popupMenu:registerEventHandler( yesEvent, yesEventfn )
	return popupMenu
end

CoD.InGamePopups.SaveAndQuitGamePopupResume = function ( popupMenu, event )
	CoD.InGamePopups.ResumeGameEvent( popupMenu, event )
end

LUI.createMenu.SaveGameErrorPopup = function ( controller, userData )
	local title, description, text1, event1, eventfn1 = nil
	if Dvar.sv_saveDeviceAvailable:get() then
		title = Engine.Localize( "PLATFORM_SAVE_ERROR_NOW_OKAY" )
		description = Engine.Localize( "MENU_NO_SAVE_DEVICE_WARNING_NOW_OKAY" )
		text1 = Engine.Localize( "MENU_RETRY_SAVE" )
		event1 = "retry_save_game"
		eventfn1 = CoD.InGamePopups.RetrySaveGameEvent
	elseif not CoD.isPS3 then
		title = Engine.Localize( "PLATFORM_SAVE_ERROR" )
		description = Engine.Localize( "MENU_NO_SAVE_DEVICE_WARNING" )
		text1 = Engine.Localize( "PLATFORM_SELECT_SAVE_DEVICE_CAPS" )
		event1 = "retry_save_game"
		eventfn1 = CoD.InGamePopups.SelectSaveDeviceWarningEvent
	end
	local buttonData = {
		{
			text = text1,
			event = event1
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
	if userData and userData.saveGameErrorPopupFromCode then
		local textToRemove = Engine.Localize( "MENU_QUIT_NO_SAVE" )
		for i = 1, #buttonData, 1 do
			if buttonData[i].text == textToRemove then
				table.remove( buttonData, i )
			end
		end
	end
	local popupMenu = CoD.InGamePopupMenu.New( "SaveGameErrorPopup", controller, "default", title, description, buttonData )
	popupMenu:registerEventHandler( "svSaveDeviceAvailableModified", CoD.InGamePopups.SaveDeviceAvailable )
	popupMenu:registerEventHandler( "resume_no_save", CoD.InGamePopups.NoSaveResumeGameEvent )
	popupMenu:registerEventHandler( "quit_no_save", CoD.InGamePopups.NoSaveQuitGameEvent )
	popupMenu:registerEventHandler( event1, eventfn1 )
	return popupMenu
end

LUI.createMenu.SaveGameWarningPopup = function ( controller )
	local popupMenu = CoD.InGamePopupMenu.New( "SaveGameWarningPopup", controller, "default", Engine.Localize( "MENU_NOTICE" ), Engine.Localize( "MENU_WARNING_SELECTSAVEDEVICE" ), {
		{
			text = Engine.Localize( "MENU_OK" ),
			event = "force_select_save"
		}
	} )
	popupMenu:registerEventHandler( "force_select_save", CoD.InGamePopups.ForceSelectSaveDeviceEvent )
	return popupMenu
end

LUI.createMenu.SaveDeviceWarningPopup = function ( controller )
	local popupMenu = CoD.InGamePopupMenu.New( "SaveDeviceWarningPopup", controller, "default", Engine.Localize( "MENU_NOTICE" ), Engine.Localize( "MENU_WARNING_SELECTSAVEDEVICE" ), {
		{
			text = Engine.Localize( "MENU_OK" ),
			event = "force_select_save"
		}
	} )
	popupMenu:registerEventHandler( "force_select_save", CoD.InGamePopups.SaveDeviceWarningEvent )
	popupMenu:registerEventHandler( "button_prompt_back", CoD.InGamePopups.CancelEvent )
	return popupMenu
end

LUI.createMenu.SaveGameSavingPopup = function ( controller )
	local popupMenu = CoD.InGamePopupMenu.New( "SaveGameSavingPopup", controller, "saving", Engine.Localize( "PLATFORM_NOW_SAVING" ) )
	Engine.SaveGame()
	popupMenu.saveTimeUp = false
	popupMenu.saveSaved = false
	popupMenu.controller = controller
	popupMenu:registerEventHandler( "notify_save_complete", CoD.InGamePopups.SaveSaved )
	popupMenu:registerEventHandler( "notify_save_timeup", CoD.InGamePopups.SaveTimeUp )
	popupMenu:registerEventHandler( "notify_save_forceclose", CoD.InGamePopups.SaveForceClose )
	popupMenu:addElement( LUI.UITimer.new( 4000, "notify_save_timeup", true, popupMenu ) )
	popupMenu:setPriority( 10000 )
	return popupMenu
end

LUI.createMenu.RestartLevelPopup = function ( controller )
	local popupMenu = CoD.InGamePopupMenu.New( "RestartLevelPopup", controller, "default", Engine.Localize( "MENU_CONTINUE_RESTART" ), Engine.Localize( "MENU_RESTART_LEVEL_TEXT" ), {
		{
			text = Engine.Localize( "MENU_RESUMEGAME_CAPS" ),
			event = "resume_game"
		},
		{
			text = Engine.Localize( "MENU_RESTART_LEVEL_CAPS" ),
			event = "restart_level"
		}
	}, true )
	popupMenu:registerEventHandler( "restart_level", CoD.InGamePopups.RestartLevelEvent )
	popupMenu:registerEventHandler( "resume_game", CoD.InGamePopups.ResumeGameEvent )
	return popupMenu
end

LUI.createMenu.RestartFromCheckpointPopup = function ( controller )
	local popupMenu = CoD.InGamePopupMenu.New( "RestartFromCheckpointPopup", controller, "default", Engine.Localize( "MENU_CONTINUE_RESTART_CHECKPOINT" ), Engine.Localize( "MENU_CHECKPOINT_RESTART_TEXT" ), {
		{
			text = Engine.Localize( "MENU_RESUMEGAME_CAPS" ),
			event = "resume_game"
		},
		{
			text = Engine.Localize( "MENU_RESTART_CHECKPOINT_CAPS" ),
			event = "restart_from_checkpoint"
		}
	}, true )
	popupMenu:registerEventHandler( "restart_from_checkpoint", CoD.InGamePopups.RestartFromCheckpointEvent )
	popupMenu:registerEventHandler( "resume_game", CoD.InGamePopups.ResumeGameEvent )
	return popupMenu
end

LUI.createMenu.RestartMissionPopup = function ( controller )
	local popupMenu = CoD.InGamePopupMenu.New( "RestartMissionPopup", controller, "default", Engine.Localize( "MENU_CONTINUE_RESTART" ), Engine.Localize( "MENU_RESTART_MISSION_TEXT" ), {
		{
			text = Engine.Localize( "MENU_RESUMEGAME_CAPS" ),
			event = "resume_game"
		},
		{
			text = Engine.Localize( "MENU_RESTART_MISSION_CAPS" ),
			event = "restart_mission"
		}
	}, true )
	popupMenu:registerEventHandler( "restart_mission", CoD.InGamePopups.RestartMissionEvent )
	popupMenu:registerEventHandler( "resume_game", CoD.InGamePopups.ResumeGameEvent )
	return popupMenu
end

CoD.InGamePopups.SaveSaved = function ( popupMenu, event )
	popupMenu.saveSaved = true
	if popupMenu.saveTimeUp == true then
		popupMenu.previousMenuName = nil
		popupMenu:animateOutAndGoBack()
		popupMenu = nil
		Engine.SetDvar( "cl_paused", 0 )
		Engine.Exec( event.controller, "disconnect" )
	end
end

CoD.InGamePopups.SaveTimeUp = function ( popupMenu, event )
	popupMenu.saveTimeUp = true
	if popupMenu.saveSaved == true then
		popupMenu.previousMenuName = nil
		popupMenu:animateOutAndGoBack()
		popupMenu = nil
		Engine.SetDvar( "cl_paused", 0 )
		Engine.Exec( event.controller, "disconnect" )
	end
end

CoD.InGamePopups.SaveForceClose = function ( popupMenu, event )
	popupMenu.previousMenuName = nil
	popupMenu:animateOutAndGoBack()
	popupMenu = nil
	Engine.SetDvar( "cl_paused", 0 )
end

CoD.InGamePopups.SaveDeviceAvailable = function ( popupMenu, event )
	popupMenu:openMenu( "SaveGameErrorPopup", event.controller )
	popupMenu:close()
end

CoD.InGamePopups.ResumeGameEvent = function ( popupMenu, event )
	Engine.SetDvar( "cl_paused", 0 )
	popupMenu:processEvent( {
		name = "close_all_ingame_menus",
		controller = event.controller
	} )
end

CoD.InGamePopups.RetrySaveGameEvent = function ( popupMenu, event )
	popupMenu:openMenu( "SaveGameSavingPopup", event.controller )
	popupMenu:processEvent( {
		name = "close_all_ingame_menus",
		controller = event.controller
	} )
end

CoD.InGamePopups.NoSaveResumeGameEvent = function ( popupMenu, event )
	popupMenu:processEvent( {
		name = "close_all_ingame_menus",
		controller = event.controller
	} )
end

CoD.InGamePopups.NoSaveQuitGameEvent = function ( popupMenu, event )
	popupMenu:processEvent( {
		name = "close_all_ingame_menus",
		controller = event.controller
	} )
	Engine.SendMenuResponse( event.controller, "popup_leavegame", "endround" )
end

CoD.InGamePopups.SelectSaveDeviceWarningEvent = function ( popupMenu, event )
	popupMenu:openMenu( "SaveGameWarningPopup", event.controller )
	popupMenu:close()
end

CoD.InGamePopups.ForceSelectSaveDeviceEvent = function ( popupMenu, event )
	Engine.ExecNow( event.controller, "force_select_save_device" )
	popupMenu:openMenu( "SaveGameErrorPopup", event.controller )
	popupMenu:close()
end

CoD.InGamePopups.SaveDeviceWarningEvent = function ( popupMenu, event )
	Engine.ExecNow( event.controller, "force_select_save_device" )
	popupMenu:goBack( event.controller )
end

CoD.InGamePopups.CancelEvent = function ( popupMenu, event )
	popupMenu:goBack( event.controller )
end

CoD.InGamePopups.LowerDifficultyEvent = function ( popupMenu, event )
	local current = Engine.GetProfileVarInt( event.controller, "g_gameskill" )
	if current > 0 then
		Engine.SetProfileVar( event.controller, "g_gameskill", current - 1 )
		Dvar.saved_gameskill:set( current - 1 .. "" )
	end
	Engine.Exec( event.controller, "updategamerprofile" )
	Engine.Exec( event.controller, "updateDifficultyFromProfile" )
	popupMenu:goBack( event.controller )
end

CoD.InGamePopups.QuitGameEvent = function ( popupMenu, event )
	popupMenu:processEvent( {
		name = "close_all_ingame_menus",
		controller = event.controller
	} )
	if Dvar.ui_singlemission:get() ~= 0 then
		Engine.ExecNow( event.controller, "checkinvite" )
	end
	Engine.SetDvar( "cl_paused", 0 )
	Engine.SendMenuResponse( event.controller, "popup_leavegame", "endround" )
	Engine.Exec( event.controller, "disconnect" )
end

CoD.InGamePopups.SaveAndQuitGameEvent = function ( popupMenu, event )
	Engine.Exec( event.controller, "updategamerprofile" )
	popupMenu:openMenu( "SaveGameSavingPopup", event.controller )
	popupMenu:close()
	Engine.SendMenuResponse( event.controller, "popup_leavegame", "endround" )
end

CoD.InGamePopups.SaveAndQuitGameUnavailableEvent = function ( popupMenu, event )
	popupMenu:openMenu( "SaveGameErrorPopup", event.controller )
	popupMenu:close()
end

CoD.InGamePopups.RestartMissionEvent = function ( popupMenu, event )
	Dvar.ui_busyBlockIngameMenu:set( 1 )
	popupMenu:processEvent( {
		name = "close_all_ingame_menus",
		controller = event.controller
	} )
	Engine.SetDvar( "cl_paused", 0 )
	Engine.PlayMenuMusic( "death" )
	Engine.Exec( event.controller, "stopControllerRumble" )
	Engine.Exec( event.controller, "fade 0 0 0 255 0 0 1" )
	Engine.Exec( event.controller, "silence" )
	Engine.Exec( event.controller, "mission_restart" )
end

CoD.InGamePopups.RestartLevelEvent = function ( popupMenu, event )
	Dvar.ui_busyBlockIngameMenu:set( 1 )
	popupMenu:processEvent( {
		name = "close_all_ingame_menus",
		controller = event.controller
	} )
	Engine.SetDvar( "cl_paused", 0 )
	Engine.Exec( event.controller, "stopControllerRumble" )
	Engine.Exec( event.controller, "fade 0 0 0 255 0 0 1" )
	Engine.Exec( event.controller, "silence" )
	Engine.Exec( event.controller, "fast_restart" )
end

CoD.InGamePopups.RestartFromCheckpointEvent = function ( popupMenu, event )
	Dvar.ui_busyBlockIngameMenu:set( 1 )
	popupMenu:dispatchEventToRoot( {
		name = "flush_dynamic_hud"
	} )
	popupMenu:processEvent( {
		name = "close_all_ingame_menus",
		controller = event.controller
	} )
	Engine.SetDvar( "cl_paused", 0 )
	Engine.Exec( event.controller, "fade 0 0 0 255 0 0 1" )
	Engine.Exec( event.controller, "stopControllerRumble" )
	Engine.Exec( event.controller, "silence" )
	Engine.Exec( event.controller, "checkpoint_restart" )
end

