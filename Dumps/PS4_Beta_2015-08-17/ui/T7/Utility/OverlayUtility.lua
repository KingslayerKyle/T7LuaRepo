require( "lua.Shared.LuaEnums" )

CoD.OverlayUtility = {}
CoD.OverlayUtility.OpenMethods = LuaEnums.createEnum( "Popup", "Overlay" )
CoD.OverlayUtility.OverlayTypes = LuaEnums.createEnum( "GenericMessage", "Connection", "Settings", "Unlock", "Save", "Quit", "Alert", "Error" )
local callFnOrGetValue = function ( item, vargs )
	if type( item ) == "function" then
		return item( unpack( vargs ) )
	else
		return item
	end
end

CoD.OverlayUtility.OverlayModelFields = {
	"title",
	"image",
	"description",
	"supportText",
	"categoryType",
	"listDatasource",
	"frameWidget",
	"state"
}
CoD.OverlayUtility.GoBackPropertyName = "backButtonFn"
CoD.OverlayUtility.OverlayPropertyFields = {
	CoD.OverlayUtility.GoBackPropertyName
}
CoD.OverlayUtility.DefaultModelFields = {
	image = function ( overlayData, vargs )
		local category = callFnOrGetValue( overlayData.categoryType, vargs )
		if category == CoD.OverlayUtility.OverlayTypes.Connection then
			return "t7_icon_connect_overlays_bkg"
		elseif category == CoD.OverlayUtility.OverlayTypes.Error then
			return "t7_icon_error_overlays_bkg"
		elseif category == CoD.OverlayUtility.OverlayTypes.Quit then
			return "t7_icon_quit_overlays_bkg"
		elseif category == CoD.OverlayUtility.OverlayTypes.Unlock then
			return "t7_icon_unlock_overlays_bkg"
		elseif category == CoD.OverlayUtility.OverlayTypes.Save then
			return "t7_icon_save_overlays_bkg"
		elseif category == CoD.OverlayUtility.OverlayTypes.Settings then
			return "t7_icon_options_overlays_bkg"
		else
			
		end
	end,
	frameWidget = function ( overlayData, vargs )
		if overlayData.menuName == "SystemOverlay_Compact" or overlayData.menuName == "SystemOverlay_MessageDialog" then
			return "CoD.systemOverlay_Compact_BasicFrame"
		elseif overlayData.menuName == "SystemOverlay_Full" then
			return "CoD.systemOverlay_Full_BasicFrame"
		else
			
		end
	end
}
CoD.OverlayUtility.DefaultPropertyFields = {}
CoD.OverlayUtility.DefaultGoBack = function ()
	return function ( self, element, controller, menu )
		GoBack( menu, controller )
	end
	
end

CoD.OverlayUtility.QueueGoBack = function ()
	return function ( self, element, controller, menu )
		Engine.LeaveQueue( controller )
		GoBack( menu, controller )
	end
	
end

CoD.OverlayUtility.DefaultScriptDialogGoBack = function ( dialogName )
	return function ( self, element, controller, menu )
		SendMenuResponse( menu, dialogName, "close", controller )
		Engine.LockInput( controller, false )
		Close( menu, controller )
	end
	
end

CoD.OverlayUtility.Overlays = {
	EndGamePopup = {
		menuName = "SystemOverlay_Compact",
		title = function ()
			if not CoD.isHost() and Engine.InPrivateParty() == 1 and not Engine.PrivatePartyHost() and Engine.PrivatePartyHostInLobby() then
				return Engine.Localize( "MENU_LEAVE_GAME_AND_PARTY" )
			elseif not CoD.isRankedGame() and CoD.isHost() then
				return Engine.Localize( "MPUI_END_GAME2" )
			else
				return Engine.Localize( "MENU_QUIT_GAME" )
			end
		end,
		description = function ()
			if not CoD.isRankedGame() then
				return ""
			elseif Engine.ProbationCheckIfPenalizedForQuit( Engine.GetPrimaryController() ) == true then
				return Engine.Localize( "MENU_LEAVE_GAME_RANKED_PROBATION" )
			elseif CoD.isZombie == true then
				return Engine.Localize( "ZOMBIE_LEAVE_GAME_RANKED" )
			elseif Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) == true then
				return Engine.Localize( "MENU_LEAVE_GAME_LEAGUES" )
			else
				return Engine.Localize( "MENU_LEAVE_GAME_RANKED" )
			end
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Quit,
		listDatasource = function ()
			DataSources.EndGamePopup_List = DataSourceHelpers.ListSetup( "EndGamePopup_List", function ( menu )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								GoBack( menu, controller )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								if Engine.CanPauseGame() then
									Engine.SetDvar( "cl_paused", 0 )
								end
								if CoD.isMultiplayer == true then
									
								else
									
								end
								CloseStartMenu( menu, controller )
								CoD.QuitGame( controller )
							end
							
						}
					}
				}
			end, true, nil )
			return "EndGamePopup_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	SaveAndQuitGamePopup = {
		menuName = "SystemOverlay_Compact",
		title = Engine.Localize( "MENU_ARE_YOU_SURE_QUIT" ),
		description = Engine.Localize( "MENU_SAVEQUIT_TEXT_WITHOUT_DEVICE_CHANGE" ),
		categoryType = CoD.OverlayUtility.OverlayTypes.Quit,
		listDatasource = function ()
			DataSources.SaveAndQuitGamePopup_List = DataSourceHelpers.ListSetup( "SaveAndQuitGamePopup_List", function ( controller )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_RESUMEGAME_CAPS" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								Engine.SetDvar( "cl_paused", 0 )
								Engine.LockInput( controller, false )
								CloseStartMenu( menu, controller )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_SAVE_AND_QUIT_CAPS" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								Engine.Exec( controller, "updategamerprofile" )
								menu:openMenu( "SaveGameSavingPopup", controller )
								menu:close()
								CloseStartMenu( menu, controller )
								Engine.SendMenuResponse( controller, "popup_leavegame", "endround" )
							end
							
						}
					}
				}
			end, true, nil )
			return "SaveAndQuitGamePopup_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	QuitGamePopup = {
		menuName = "SystemOverlay_Compact",
		title = Engine.Localize( "MENU_QUIT_WARNING" ),
		description = Engine.Localize( "MENU_NOPROFILE_QUIT_WARNING_DESC" ),
		categoryType = CoD.OverlayUtility.OverlayTypes.Quit,
		listDatasource = function ()
			DataSources.QuitGamePopup_List = DataSourceHelpers.ListSetup( "QuitGamePopup_List", function ( controller )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_RESUMEGAME_CAPS" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								Engine.SetDvar( "cl_paused", 0 )
								menu:processEvent( {
									name = "close_all_ingame_menus",
									controller = controller
								} )
								CloseStartMenu( menu, controller )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "PLATFORM_QUIT_CAPS" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								menu:processEvent( {
									name = "close_all_ingame_menus",
									controller = controller
								} )
								if Dvar.ui_singlemission:get() ~= 0 then
									Engine.ExecNow( controller, "checkinvite" )
								end
								Engine.SetDvar( "cl_paused", 0 )
								Engine.SendMenuResponse( controller, "popup_leavegame", "endround" )
								Engine.Exec( controller, "disconnect" )
							end
							
						}
					}
				}
			end, true, nil )
			return "QuitGamePopup_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	QuitPCGamePopup = {
		menuName = "SystemOverlay_Compact",
		title = Engine.Localize( "MENU_ARE_YOU_SURE_QUIT" ),
		description = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.Quit,
		listDatasource = function ()
			DataSources.QuitPCGamePopup_List = DataSourceHelpers.ListSetup( "QuitPCGamePopup_List", function ( controller )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								GoBack( menu, controller )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								Engine.Exec( controller, "quit" )
							end
							
						}
					}
				}
			end, true, nil )
			return "QuitPCGamePopup_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	RestartCheckpointPopup = {
		menuName = "SystemOverlay_Compact",
		title = Engine.Localize( "MENU_CONTINUE_RESTART_CHECKPOINT" ),
		description = Engine.Localize( "MENU_CHECKPOINT_RESTART_TEXT" ),
		categoryType = CoD.OverlayUtility.OverlayTypes.Quit,
		listDatasource = function ()
			DataSources.RestartCheckpointPopup_List = DataSourceHelpers.ListSetup( "RestartCheckpointPopup_List", function ( controller )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_RESUMEGAME_CAPS" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								Engine.SetDvar( "cl_paused", 0 )
								Engine.LockInput( controller, false )
								CloseStartMenu( menu, controller )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_RESTART_CHECKPOINT_CAPS" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								Dvar.ui_busyBlockIngameMenu:set( 1 )
								menu:dispatchEventToRoot( {
									name = "flush_dynamic_hud"
								} )
								menu:processEvent( {
									name = "close_all_ingame_menus",
									controller = controller
								} )
								Engine.SetDvar( "cl_paused", 0 )
								CloseStartMenu( menu, controller )
								Engine.Exec( controller, "fade 0 0 0 255 0 0 1" )
								Engine.Exec( controller, "stopControllerRumble" )
								Engine.Exec( controller, "silence" )
								Engine.Exec( controller, "checkpoint_restart" )
							end
							
						}
					}
				}
			end, true, nil )
			return "RestartCheckpointPopup_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	RestartGamePopup = {
		menuName = "SystemOverlay_Compact",
		title = Engine.Localize( "MENU_CONTINUE_RESTART" ),
		description = Engine.Localize( "MENU_RESTART_LEVEL_TEXT" ),
		categoryType = CoD.OverlayUtility.OverlayTypes.Quit,
		listDatasource = function ()
			DataSources.RestartGamePopup_List = DataSourceHelpers.ListSetup( "RestartGamePopup_List", function ( controller )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								GoBack( menu, controller )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								Engine.SetDvar( "cl_paused", 0 )
								Dvar.ui_busyBlockIngameMenu:set( 1 )
								CloseStartMenu( menu, controller )
								Engine.Exec( controller, "stopControllerRumble" )
								Engine.Exec( controller, "fade 0 0 0 255 0 0 1" )
								Engine.Exec( controller, "silence" )
								if (Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK ) == true) or Engine.SessionModeIsMode( CoD.SESSIONMODE_OFFLINE ) == true then
									Engine.Exec( controller, "fast_restart" )
								else
									Engine.SendMenuResponse( controller, "restartgamepopup", "restart_level_zm" )
								end
							end
							
						}
					}
				}
			end, true, nil )
			return "RestartGamePopup_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	RestartMissionPopup = {
		menuName = "SystemOverlay_Compact",
		title = Engine.Localize( "MENU_CONTINUE_RESTART" ),
		description = Engine.Localize( "MENU_RESTART_MISSION_TEXT" ),
		categoryType = CoD.OverlayUtility.OverlayTypes.Quit,
		listDatasource = function ()
			DataSources.RestartMissionPopup_List = DataSourceHelpers.ListSetup( "RestartMissionPopup_List", function ( controller )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_RESUMEGAME_CAPS" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								Engine.SetDvar( "cl_paused", 0 )
								Engine.LockInput( controller, false )
								CloseStartMenu( menu, controller )
								menu:processEvent( {
									name = "close_all_ingame_menus",
									controller = controller
								} )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_RESTART_MISSION_CAPS" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								Dvar.ui_busyBlockIngameMenu:set( 1 )
								menu:processEvent( {
									name = "close_all_ingame_menus",
									controller = controller
								} )
								Engine.SetDvar( "cl_paused", 0 )
								CloseStartMenu( menu, controller )
								Engine.PlayMenuMusic( "death" )
								Engine.Exec( controller, "stopControllerRumble" )
								Engine.Exec( controller, "fade 0 0 0 255 0 0 1" )
								Engine.Exec( controller, "silence" )
								Engine.Exec( controller, "mission_restart" )
							end
							
						}
					}
				}
			end, true, nil )
			return "RestartMissionPopup_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	MessageDialogBox = {
		menuName = "SystemOverlay_MessageDialog",
		title = function ( controller )
			local messageModel = DataSources.MessageDialog.getModel( controller )
			local messageTitle = CoD.SafeGetModelValue( messageModel, "messageTitle" )
			if messageTitle == nil or messageTitle == "" then
				local messageType = Engine.GetModelValue( Engine.GetModel( messageModel, "messageType" ) )
				if messageType == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_INFO then
					messageTitle = Engine.Localize( "MENU_INFO" )
				elseif messageType == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_WARNING then
					messageTitle = Engine.Localize( "MENU_WARNING" )
				elseif messageType == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_ERROR then
					messageTitle = Engine.Localize( "MENU_ERROR" )
				end
			end
			return Engine.ToUpper( messageTitle )
		end,
		description = function ( controller )
			return Engine.Localize( Engine.GetModelValue( Engine.GetModel( DataSources.MessageDialog.getModel( controller ), "message" ) ) or "" )
		end,
		categoryType = function ( controller )
			local messageType = Engine.GetModelValue( Engine.GetModel( DataSources.MessageDialog.getModel( controller ), "messageType" ) )
			local categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage
			if messageType == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_WARNING then
				categoryType = CoD.OverlayUtility.OverlayTypes.Alert
			elseif messageType == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_ERROR then
				categoryType = CoD.OverlayUtility.OverlayTypes.Error
			end
			return categoryType
		end,
		listDatasource = function ( controller )
			local dialogIndex = Engine.GetModelValue( Engine.GetModel( DataSources.MessageDialog.getModel( controller ), "messagePending" ) )
			local datasourceName = "MessageDialogBoxList" .. dialogIndex
			DataSources[datasourceName] = DataSourceHelpers.ListSetup( datasourceName, function ( controller )
				return {
					{
						models = {
							displayText = "OK"
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								LuaUtils.UI_ClearErrorMessageDialog()
								GoBack( menu, controller )
							end
							
						}
					}
				}
			end, true, nil )
			return datasourceName
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ()
			return function ( self, element, controller, menu )
				LuaUtils.UI_ClearErrorMessageDialog()
				GoBack( menu, controller )
			end
			
		end
	},
	EndDemoPopup = {
		menuName = "SystemOverlay_Compact",
		title = function ()
			local title = nil
			local isClipPlaying = Engine.IsDemoClipPlaying()
			local isGameHost = Engine.GameHost()
			if not isClipPlaying then
				if isGameHost then
					title = Engine.Localize( "MPUI_LEAVE_FILM" )
				else
					title = Engine.Localize( "MPUI_END_FILM" )
				end
			elseif isGameHost then
				title = Engine.Localize( "MPUI_LEAVE_CLIP" )
			else
				title = Engine.Localize( "MPUI_END_CLIP" )
			end
			return Engine.ToUpper( title )
		end,
		description = function ()
			if isClipModified then
				return Engine.Localize( "MENU_DEMO_UNUPLOADED_CLIP" )
			else
				return ""
			end
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Quit,
		listDatasource = function ()
			DataSources.EndDemoPopup_List = DataSourceHelpers.ListSetup( "EndDemoPopup_List", function ( controller )
				local options = {}
				local isClipModified = Engine.IsClipModified()
				local EndDemoFunc = function ()
					local isGameHost = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
					if not isGameHost then
						Engine.GameModeResetModes()
						Engine.SessionModeResetModes()
						Engine.Exec( controller, "disconnect" )
					else
						Engine.Exec( controller, "xpartystopdemo" )
					end
				end
				
				if not isClipModified then
					table.insert( options, {
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								GoBack( menu, controller )
								EndDemoFunc( controller )
							end
						}
					} )
					table.insert( options, {
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								GoBack( menu, controller )
							end
						}
					} )
				else
					table.insert( options, {
						models = {
							displayText = Engine.Localize( "MENU_SAVE_CLIP" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								GoBack( menu, controller )
							end,
							disabled = true
						}
					} )
					table.insert( options, {
						models = {
							displayText = Engine.Localize( "MENU_END_FILM_WITHOUT_SAVING" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								GoBack( menu, controller )
								EndDemoFunc( controller )
							end
						}
					} )
					table.insert( options, {
						models = {
							displayText = Engine.Localize( "MENU_CANCEL" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								GoBack( menu, controller )
							end
						}
					} )
				end
				return options
			end, true, nil )
			return "EndDemoPopup_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	ScriptMessageDialog_Compact = {
		menuName = "SystemOverlay_Compact",
		title = nil,
		description = nil,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultScriptDialogGoBack( "ScriptMessageDialog_Compact" )
	},
	ConnectingToDemonware = {
		menuName = "SystemOverlay_Compact",
		postCreateStep = function ( overlay, controller )
			local timeSinceStart = 0
			if overlay.layout and overlay.layout.frameWidget and overlay.layout.frameWidget.framedWidget then
				overlay.layout.frameWidget.framedWidget:playClip( "LoadingLoop" )
			end
			overlay:addElement( LUI.UITimer.newElementTimer( 400, false, function ( event )
				if Engine.IsDemonwareFetchingDone( controller ) then
					Engine.Exec( controller, "checkForPS3Invites" )
					local previousMenu = GoBack( overlay, controller )
					if overlay.callingMenu ~= nil then
						event.controller = controller
						if overlay.inviteAccepted == nil then
							if overlay.OpenPrivateLobbyMenu == true then
								CoD.MainMenu.OpenPrivateLobbyMenu( overlay.callingMenu, event )
							elseif overlay.openingStore == nil or overlay.openingStore == false then
								CoD.MainMenu.OpenMainLobbyRequested( overlay.callingMenu, event )
							else
								CoD.MainLobby.OpenStore( overlay.callingMenu, event )
							end
						end
					end
					return 
				end
				local netConnection = true
				if CoD.isPS3 then
					netConnection = Engine.CheckNetConnection()
				end
				if timeSinceStart > CoD.Popup.CONNECTINGDW_MAX_WAIT_TIME or netConnection == false then
					local menu = GoBack( overlay, controller )
					local message = ""
					if netConnection == false then
						message = "XBOXLIVE_NETCONNECTION"
					else
						local info = Engine.GetSystemInfo( controller, CoD.SYSINFO_CONNECTIVITY_INFO )
						message = Engine.Localize( "PLATFORM_DEMONWARE_DISCONNECT" ) .. "\n\n" .. Engine.Localize( "MENU_ERROR_CODE", info )
					end
					LuaUtils.UI_ShowErrorMessageDialog( controller, message, "MENU_NOTICE_CAPS" )
					CoD.LobbyBase.FailedDWConnection = true
				end
				timeSinceStart = timeSinceStart + event.timeElapsed
			end ) )
		end,
		title = "MENU_CONNECTING_DW",
		description = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.Connection,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	PublisherFilesChangedPopup = {
		menuName = "SystemOverlay_Compact",
		title = "MENU_REFETCH_WAD_CONFIRMATION_TITLE",
		description = "MENU_REFETCH_WAD_CONFIRMATION_MESSAGE",
		categoryType = CoD.OverlayUtility.OverlayTypes.Connection,
		listDatasource = function ()
			DataSources.PublisherFilesChangedButtons = DataSourceHelpers.ListSetup( "PublisherFilesChangedButtons", function ( controller )
				return {
					{
						models = {
							displayText = "MENU_CONFIRM_CAPS"
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "pubstorageFilesChanged" ), false )
								Engine.ComError( Enum.errorCode.ERROR_SOFTRESTART_KEEPDW, "" )
							end
							
						}
					}
				}
			end, true, nil )
			return "PublisherFilesChangedButtons"
		end
	},
	LoginQueued = {
		menuName = "SystemOverlay_MessageDialog",
		title = Engine.Localize( "MENU_LOGIN_QUEUE_DEFAULT" ),
		description = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.Connection,
		postCreateStep = function ( overlay, controller )
			local timeWaited = 0
			if overlay.layout and overlay.layout.frameWidget and overlay.layout.frameWidget.framedWidget then
				overlay.layout.frameWidget.framedWidget:playClip( "LoadingLoop" )
			end
			overlay:addElement( LUI.UITimer.newElementTimer( 400, false, function ( event )
				local queueInfo = Engine.GetPlayerQueueInfo( controller )
				if Engine.IsPlayerQueued( controller ) then
					if queueInfo ~= nil then
						local position = queueInfo.position
						local eta = queueInfo.eta
						if position > 0 and eta > 0 then
							local etaMinutes = math.floor( eta / 60 )
							local etaSeconds = eta % 60
							local etaHours = math.floor( etaMinutes / 60 )
							local etaMinutes = etaMinutes % 60
							local waitedMinutes = math.floor( timeWaited / 1000 / 60 )
							local waitedSeconds = math.floor( timeWaited / 1000 ) % 60
							local waitedHours = math.floor( waitedMinutes / 60 )
							local waitedMinutes = waitedMinutes % 60
							local description = Engine.Localize( "MENU_LOGIN_QUEUE", position, etaHours, etaMinutes, etaSeconds, waitedHours, waitedMinutes, waitedSeconds )
							CoD.OverlayUtility.Overlays[overlay.menuName].description = description
							overlay:refreshData( nil )
						end
					end
				elseif queueInfo == nil or not queueInfo.success then
					local message = "PLATFORM_DEMONWARE_DISCONNECT"
					local menu = GoBack( overlay, controller )
					LuaUtils.UI_ShowErrorMessageDialog( controller, message, "MENU_NOTICE_CAPS" )
					CoD.LobbyBase.FailedDWConnection = true
					Engine.LeaveQueue( controller )
				else
					local menu = GoBack( overlay, controller )
					CoD.OverlayUtility.CreateOverlay( controller, menu, "ConnectingToDemonware" )
				end
				timeWaited = timeWaited + event.timeElapsed
			end ) )
		end
	},
	ResetPCControls = {
		menuName = "SystemOverlay_Compact",
		title = Engine.Localize( "PLATFORM_RESET_CONTROLS_CONFIRM" ),
		description = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.Settings,
		listDatasource = function ()
			DataSources.ResetPCControls_List = DataSourceHelpers.ListSetup( "ResetPCControls_List", function ( controller )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								GoBack( menu, controller )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								ResetPCControlsToDefault( menu, element, controller )
								GoBack( menu, controller )
							end
							
						}
					}
				}
			end, true, nil )
			return "ResetPCControls_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	ApplyPCGraphics = {
		menuName = "SystemOverlay_Compact",
		title = Engine.Localize( "PLATFORM_APPLY_GRAPHICS_CONFIRM" ),
		description = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.Settings,
		listDatasource = function ()
			DataSources.ApplyPCGraphics_List = DataSourceHelpers.ListSetup( "ApplyPCGraphics_List", function ( controller )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								GoBack( menu, controller )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								ApplyPCGraphicsOptions( menu, element, controller )
								GoBack( menu, controller )
							end
							
						}
					}
				}
			end, true, nil )
			return "ApplyPCGraphics_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	RegistrationSuccess = {
		menuName = "SystemOverlay_MessageDialog",
		title = Engine.Localize( "MENU_REGISTRATION_SUCCESS_TITLE" ),
		description = Engine.Localize( "MENU_REGISTRATION_SUCCESS" ),
		categoryType = CoD.OverlayUtility.OverlayTypes.Unlock,
		listDatasource = function ()
			DataSources.RegistrationSuccess_List = DataSourceHelpers.ListSetup( "RegistrationSuccess_List", function ( controller )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_OK" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								LUI.CoDMetrics.AccountCreated( self, controller, "1", "menu" )
								FinishRegistrationFlow( self, controller, menu )
							end
							
						}
					}
				}
			end, true, nil )
			return "RegistrationSuccess_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ()
			return function ( self, element, controller, menu )
				LUI.CoDMetrics.AccountCreated( self, controller, "1", "menu" )
				FinishRegistrationFlow( self, controller, menu )
			end
			
		end
	},
	OptInSuccess = {
		menuName = "SystemOverlay_MessageDialog",
		title = Engine.Localize( "MENU_REGISTRATION_SUCCESS_TITLE" ),
		description = Engine.Localize( "MENU_REGISTRATION_OPTIN_SUCCESS" ),
		categoryType = CoD.OverlayUtility.OverlayTypes.Unlock,
		listDatasource = function ()
			DataSources.OptInSuccess_List = DataSourceHelpers.ListSetup( "OptInSuccess_List", function ( controller )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_OK" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								LUI.CoDMetrics.AccountCreated( self, controller, "1", "menu" )
								FinishRegistrationFlow( self, controller, menu )
							end
							
						}
					}
				}
			end, true, nil )
			return "OptInSuccess_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ()
			return function ( self, element, controller, menu )
				LUI.CoDMetrics.AccountCreated( self, controller, "1", "menu" )
				FinishRegistrationFlow( self, controller, menu )
			end
			
		end
	}
}
CoD.OverlayUtility.AddSystemOverlay = function ( overlayName, overlayData )
	CoD.OverlayUtility.Overlays[overlayName] = overlayData
end

local OverlayCloseMethod = function ( menu, controller )
	return function ()
		ClearMenuSavedState( menu )
		if menu.overlayModelName then
			local model = Engine.GetModel( Engine.GetModelForController( controller ), menu.overlayModelName )
			if model then
				Engine.UnsubscribeAndFreeModel( model )
			end
		end
	end
	
end

local RefreshOverlayModels = function ( baseModel, overlayData, vargs )
	for _, key in ipairs( CoD.OverlayUtility.OverlayModelFields ) do
		local f86_local3 = nil
		local newModel = Engine.CreateModel( baseModel, key )
		f86_local3 = callFnOrGetValue( overlayData[key], vargs )
		if not f86_local3 and CoD.OverlayUtility.DefaultModelFields[key] then
			f86_local3 = callFnOrGetValue( CoD.OverlayUtility.DefaultModelFields[key], {
				overlayData,
				vargs
			} )
		end
		if f86_local3 ~= nil then
			Engine.SetModelValue( newModel, f86_local3 )
		end
	end
end

local RefreshOverlayProperties = function ( overlay, overlayData, vargs )
	for _, key in ipairs( CoD.OverlayUtility.OverlayPropertyFields ) do
		local f87_local3 = nil
		f87_local3 = callFnOrGetValue( overlayData[key], vargs )
		if not f87_local3 and CoD.OverlayUtility.DefaultPropertyFields[key] then
			f87_local3 = callFnOrGetValue( CoD.OverlayUtility.DefaultPropertyFields[key], {
				overlayData,
				vargs
			} )
		end
		overlay[key] = f87_local3
	end
end

local RefreshOverlayDataFunction = function ( overlay, vargs )
	return function ()
		RefreshOverlayModels( overlay:getModel(), CoD.OverlayUtility.Overlays[overlay.menuName], vargs )
		RefreshOverlayProperties( overlay, CoD.OverlayUtility.Overlays[overlay.menuName], vargs )
	end
	
end

CoD.OverlayUtility.CreateOverlay = function ( controller, currentMenu, overlayName, ... )
	local menu = nil
	local vargs = {
		n = select( "#", ... ),
		...
	}
	local setupModels = function ( baseModel, overlayData )
		for _, key in ipairs( CoD.OverlayUtility.OverlayModelFields ) do
			local f91_local3 = nil
			local newModel = Engine.CreateModel( baseModel, key )
			if type( overlayData[key] ) == "function" then
				f91_local3 = overlayData[key]( unpack( vargs ) )
			else
				f91_local3 = overlayData[key]
			end
			if not f91_local3 and CoD.OverlayUtility.DefaultModelFields[key] then
				f91_local3 = callFnOrGetValue( CoD.OverlayUtility.DefaultModelFields[key], {
					overlayData,
					vargs
				} )
			end
			if f91_local3 ~= nil then
				Engine.SetModelValue( newModel, f91_local3 )
			end
		end
	end
	
	if CoD.OverlayUtility.Overlays[overlayName] then
		local overlayData = CoD.OverlayUtility.Overlays[overlayName]
		local menuName = callFnOrGetValue( overlayData.menuName, vargs )
		if menuName then
			if CoD.Menu.ModelToUse then
				RefreshOverlayModels( CoD.Menu.ModelToUse, overlayData, vargs )
			end
			CoD.Menu.OverwriteMenuName = overlayName
			if not overlayData.openMethod or overlayData.openMethod == CoD.OverlayUtility.OpenMethods.Popup then
				menu = OpenPopup( currentMenu, menuName, controller )
			elseif overlayData.openMethod == CoD.OverlayUtility.OpenMethods.Overlay then
				menu = OpenOverlay( currentMenu, menuName, controller )
			end
			CoD.Menu.OverwriteMenuName = nil
			if menu then
				menu.refreshData = RefreshOverlayDataFunction( menu, vargs )
				RefreshOverlayProperties( menu, overlayData, vargs )
				local menuModel = menu:getModel()
				if not menuModel then
					menu.overlayModelName = "Overlay." .. overlayName
					menuModel = Engine.CreateModel( Engine.GetModelForController( controller ), menu.overlayModelName )
					RefreshOverlayModels( menuModel, overlayData, vargs )
					menu:setModel( menuModel )
				end
				LUI.OverrideFunction_CallOriginalFirst( menu, "close", OverlayCloseMethod( menu, controller ) )
				if overlayData.postCreateStep then
					overlayData.postCreateStep( menu, controller )
				end
			end
		end
	end
	return menu
end

