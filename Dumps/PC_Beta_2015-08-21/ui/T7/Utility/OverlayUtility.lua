require( "lua.Shared.LuaEnums" )

CoD.OverlayUtility = {}
CoD.OverlayUtility.OpenMethods = LuaEnums.createEnum( "Popup", "Overlay" )
CoD.OverlayUtility.OverlayTypes = LuaEnums.createEnum( "GenericMessage", "Connection", "Settings", "Unlock", "Save", "Quit", "Alert", "Error" )
local f0_local0 = function ( f1_arg0, f1_arg1 )
	if type( f1_arg0 ) == "function" then
		return f1_arg0( unpack( f1_arg1 ) )
	else
		return f1_arg0
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
	image = function ( f2_arg0, f2_arg1 )
		local f2_local0 = f0_local0( f2_arg0.categoryType, f2_arg1 )
		if f2_local0 == CoD.OverlayUtility.OverlayTypes.Connection then
			return "t7_icon_connect_overlays_bkg"
		elseif f2_local0 == CoD.OverlayUtility.OverlayTypes.Error then
			return "t7_icon_error_overlays_bkg"
		elseif f2_local0 == CoD.OverlayUtility.OverlayTypes.Quit then
			return "t7_icon_quit_overlays_bkg"
		elseif f2_local0 == CoD.OverlayUtility.OverlayTypes.Unlock then
			return "t7_icon_unlock_overlays_bkg"
		elseif f2_local0 == CoD.OverlayUtility.OverlayTypes.Save then
			return "t7_icon_save_overlays_bkg"
		elseif f2_local0 == CoD.OverlayUtility.OverlayTypes.Settings then
			return "t7_icon_options_overlays_bkg"
		else
			
		end
	end,
	frameWidget = function ( f3_arg0, f3_arg1 )
		if f3_arg0.menuName == "SystemOverlay_Compact" or f3_arg0.menuName == "SystemOverlay_MessageDialog" then
			return "CoD.systemOverlay_Compact_BasicFrame"
		elseif f3_arg0.menuName == "SystemOverlay_Full" then
			return "CoD.systemOverlay_Full_BasicFrame"
		else
			
		end
	end
}
CoD.OverlayUtility.DefaultPropertyFields = {}
CoD.OverlayUtility.DefaultGoBack = function ()
	return function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		GoBack( f5_arg3, f5_arg2 )
	end
	
end

CoD.OverlayUtility.QueueGoBack = function ()
	return function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
		Engine.LeaveQueue( f7_arg2 )
		GoBack( f7_arg3, f7_arg2 )
	end
	
end

CoD.OverlayUtility.DefaultScriptDialogGoBack = function ( f8_arg0 )
	return function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
		SendMenuResponse( f9_arg3, f8_arg0, "close", f9_arg2 )
		Engine.LockInput( f9_arg2, false )
		Close( f9_arg3, f9_arg2 )
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
			DataSources.EndGamePopup_List = DataSourceHelpers.ListSetup( "EndGamePopup_List", function ( f13_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3, f14_arg4 )
								GoBack( f14_arg4, f14_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3, f15_arg4 )
								if Engine.CanPauseGame() then
									Engine.SetDvar( "cl_paused", 0 )
								end
								if CoD.isMultiplayer == true then
									
								else
									
								end
								CloseStartMenu( f15_arg4, f15_arg2 )
								CoD.QuitGame( f15_arg2 )
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
			DataSources.SaveAndQuitGamePopup_List = DataSourceHelpers.ListSetup( "SaveAndQuitGamePopup_List", function ( f17_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_RESUMEGAME_CAPS" )
						},
						properties = {
							action = function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3, f18_arg4 )
								Engine.SetDvar( "cl_paused", 0 )
								Engine.LockInput( f18_arg2, false )
								CloseStartMenu( f18_arg4, f18_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_SAVE_AND_QUIT_CAPS" )
						},
						properties = {
							action = function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3, f19_arg4 )
								Engine.Exec( f19_arg2, "updategamerprofile" )
								f19_arg4:openMenu( "SaveGameSavingPopup", f19_arg2 )
								f19_arg4:close()
								CloseStartMenu( f19_arg4, f19_arg2 )
								Engine.SendMenuResponse( f19_arg2, "popup_leavegame", "endround" )
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
			DataSources.QuitGamePopup_List = DataSourceHelpers.ListSetup( "QuitGamePopup_List", function ( f21_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_RESUMEGAME_CAPS" )
						},
						properties = {
							action = function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3, f22_arg4 )
								Engine.SetDvar( "cl_paused", 0 )
								f22_arg4:processEvent( {
									name = "close_all_ingame_menus",
									controller = f22_arg2
								} )
								CloseStartMenu( f22_arg4, f22_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "PLATFORM_QUIT_CAPS" )
						},
						properties = {
							action = function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3, f23_arg4 )
								f23_arg4:processEvent( {
									name = "close_all_ingame_menus",
									controller = f23_arg2
								} )
								if Dvar.ui_singlemission:get() ~= 0 then
									Engine.ExecNow( f23_arg2, "checkinvite" )
								end
								Engine.SetDvar( "cl_paused", 0 )
								Engine.SendMenuResponse( f23_arg2, "popup_leavegame", "endround" )
								Engine.Exec( f23_arg2, "disconnect" )
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
			DataSources.QuitPCGamePopup_List = DataSourceHelpers.ListSetup( "QuitPCGamePopup_List", function ( f25_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3, f26_arg4 )
								GoBack( f26_arg4, f26_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3, f27_arg4 )
								Engine.Exec( f27_arg2, "quit" )
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
			DataSources.RestartCheckpointPopup_List = DataSourceHelpers.ListSetup( "RestartCheckpointPopup_List", function ( f29_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_RESUMEGAME_CAPS" )
						},
						properties = {
							action = function ( f30_arg0, f30_arg1, f30_arg2, f30_arg3, f30_arg4 )
								Engine.SetDvar( "cl_paused", 0 )
								Engine.LockInput( f30_arg2, false )
								CloseStartMenu( f30_arg4, f30_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_RESTART_CHECKPOINT_CAPS" )
						},
						properties = {
							action = function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3, f31_arg4 )
								Dvar.ui_busyBlockIngameMenu:set( 1 )
								f31_arg4:dispatchEventToRoot( {
									name = "flush_dynamic_hud"
								} )
								f31_arg4:processEvent( {
									name = "close_all_ingame_menus",
									controller = f31_arg2
								} )
								Engine.SetDvar( "cl_paused", 0 )
								CloseStartMenu( f31_arg4, f31_arg2 )
								Engine.Exec( f31_arg2, "fade 0 0 0 255 0 0 1" )
								Engine.Exec( f31_arg2, "stopControllerRumble" )
								Engine.Exec( f31_arg2, "silence" )
								Engine.Exec( f31_arg2, "checkpoint_restart" )
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
			DataSources.RestartGamePopup_List = DataSourceHelpers.ListSetup( "RestartGamePopup_List", function ( f33_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f34_arg0, f34_arg1, f34_arg2, f34_arg3, f34_arg4 )
								GoBack( f34_arg4, f34_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f35_arg0, f35_arg1, f35_arg2, f35_arg3, f35_arg4 )
								Engine.SetDvar( "cl_paused", 0 )
								Dvar.ui_busyBlockIngameMenu:set( 1 )
								CloseStartMenu( f35_arg4, f35_arg2 )
								Engine.Exec( f35_arg2, "stopControllerRumble" )
								Engine.Exec( f35_arg2, "fade 0 0 0 255 0 0 1" )
								Engine.Exec( f35_arg2, "silence" )
								if (Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK ) == true) or Engine.SessionModeIsMode( CoD.SESSIONMODE_OFFLINE ) == true then
									Engine.Exec( f35_arg2, "fast_restart" )
								else
									Engine.SendMenuResponse( f35_arg2, "restartgamepopup", "restart_level_zm" )
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
			DataSources.RestartMissionPopup_List = DataSourceHelpers.ListSetup( "RestartMissionPopup_List", function ( f37_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_RESUMEGAME_CAPS" )
						},
						properties = {
							action = function ( f38_arg0, f38_arg1, f38_arg2, f38_arg3, f38_arg4 )
								Engine.SetDvar( "cl_paused", 0 )
								Engine.LockInput( f38_arg2, false )
								CloseStartMenu( f38_arg4, f38_arg2 )
								f38_arg4:processEvent( {
									name = "close_all_ingame_menus",
									controller = f38_arg2
								} )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_RESTART_MISSION_CAPS" )
						},
						properties = {
							action = function ( f39_arg0, f39_arg1, f39_arg2, f39_arg3, f39_arg4 )
								Dvar.ui_busyBlockIngameMenu:set( 1 )
								f39_arg4:processEvent( {
									name = "close_all_ingame_menus",
									controller = f39_arg2
								} )
								Engine.SetDvar( "cl_paused", 0 )
								CloseStartMenu( f39_arg4, f39_arg2 )
								Engine.PlayMenuMusic( "death" )
								Engine.Exec( f39_arg2, "stopControllerRumble" )
								Engine.Exec( f39_arg2, "fade 0 0 0 255 0 0 1" )
								Engine.Exec( f39_arg2, "silence" )
								Engine.Exec( f39_arg2, "mission_restart" )
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
		title = function ( f40_arg0 )
			local f40_local0 = DataSources.MessageDialog.getModel( f40_arg0 )
			local f40_local1 = CoD.SafeGetModelValue( f40_local0, "messageTitle" )
			if f40_local1 == nil or f40_local1 == "" then
				local f40_local2 = Engine.GetModelValue( Engine.GetModel( f40_local0, "messageType" ) )
				if f40_local2 == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_INFO then
					f40_local1 = Engine.Localize( "MENU_INFO" )
				elseif f40_local2 == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_WARNING then
					f40_local1 = Engine.Localize( "MENU_WARNING" )
				elseif f40_local2 == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_ERROR then
					f40_local1 = Engine.Localize( "MENU_ERROR" )
				end
			end
			return Engine.ToUpper( f40_local1 )
		end,
		description = function ( f41_arg0 )
			return Engine.Localize( Engine.GetModelValue( Engine.GetModel( DataSources.MessageDialog.getModel( f41_arg0 ), "message" ) ) or "" )
		end,
		categoryType = function ( f42_arg0 )
			local modelValue = Engine.GetModelValue( Engine.GetModel( DataSources.MessageDialog.getModel( f42_arg0 ), "messageType" ) )
			local f42_local1 = CoD.OverlayUtility.OverlayTypes.GenericMessage
			if modelValue == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_WARNING then
				f42_local1 = CoD.OverlayUtility.OverlayTypes.Alert
			elseif modelValue == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_ERROR then
				f42_local1 = CoD.OverlayUtility.OverlayTypes.Error
			end
			return f42_local1
		end,
		listDatasource = function ( f43_arg0 )
			local f43_local0 = "MessageDialogBoxList" .. Engine.GetModelValue( Engine.GetModel( DataSources.MessageDialog.getModel( f43_arg0 ), "messagePending" ) )
			DataSources[f43_local0] = DataSourceHelpers.ListSetup( f43_local0, function ( f44_arg0 )
				return {
					{
						models = {
							displayText = "OK"
						},
						properties = {
							action = function ( f45_arg0, f45_arg1, f45_arg2, f45_arg3, f45_arg4 )
								LuaUtils.UI_ClearErrorMessageDialog()
								GoBack( f45_arg4, f45_arg2 )
							end
							
						}
					}
				}
			end, true, nil )
			return f43_local0
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ()
			return function ( f47_arg0, f47_arg1, f47_arg2, f47_arg3 )
				LuaUtils.UI_ClearErrorMessageDialog()
				GoBack( f47_arg3, f47_arg2 )
			end
			
		end
	},
	EndDemoPopup = {
		menuName = "SystemOverlay_Compact",
		title = function ()
			local f48_local0 = nil
			local f48_local1 = Engine.IsDemoClipPlaying()
			local f48_local2 = Engine.GameHost()
			if not f48_local1 then
				if f48_local2 then
					f48_local0 = Engine.Localize( "MPUI_LEAVE_FILM" )
				else
					f48_local0 = Engine.Localize( "MPUI_END_FILM" )
				end
			elseif f48_local2 then
				f48_local0 = Engine.Localize( "MPUI_LEAVE_CLIP" )
			else
				f48_local0 = Engine.Localize( "MPUI_END_CLIP" )
			end
			return Engine.ToUpper( f48_local0 )
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
			DataSources.EndDemoPopup_List = DataSourceHelpers.ListSetup( "EndDemoPopup_List", function ( f51_arg0 )
				local f51_local0 = {}
				local f51_local1 = Engine.IsClipModified()
				local f51_local2 = function ()
					if not Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
						Engine.GameModeResetModes()
						Engine.SessionModeResetModes()
						Engine.Exec( f51_arg0, "disconnect" )
					else
						Engine.Exec( f51_arg0, "xpartystopdemo" )
					end
				end
				
				if not f51_local1 then
					table.insert( f51_local0, {
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f53_arg0, f53_arg1, f53_arg2, f53_arg3, f53_arg4 )
								GoBack( f53_arg4, f53_arg2 )
								f51_local2( f53_arg2 )
							end
						}
					} )
					table.insert( f51_local0, {
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f54_arg0, f54_arg1, f54_arg2, f54_arg3, f54_arg4 )
								GoBack( f54_arg4, f54_arg2 )
							end
						}
					} )
				else
					table.insert( f51_local0, {
						models = {
							displayText = Engine.Localize( "MENU_SAVE_CLIP" )
						},
						properties = {
							action = function ( f55_arg0, f55_arg1, f55_arg2, f55_arg3, f55_arg4 )
								GoBack( f55_arg4, f55_arg2 )
							end,
							disabled = true
						}
					} )
					table.insert( f51_local0, {
						models = {
							displayText = Engine.Localize( "MENU_END_FILM_WITHOUT_SAVING" )
						},
						properties = {
							action = function ( f56_arg0, f56_arg1, f56_arg2, f56_arg3, f56_arg4 )
								GoBack( f56_arg4, f56_arg2 )
								f51_local2( f56_arg2 )
							end
						}
					} )
					table.insert( f51_local0, {
						models = {
							displayText = Engine.Localize( "MENU_CANCEL" )
						},
						properties = {
							action = function ( f57_arg0, f57_arg1, f57_arg2, f57_arg3, f57_arg4 )
								GoBack( f57_arg4, f57_arg2 )
							end
						}
					} )
				end
				return f51_local0
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
		postCreateStep = function ( f58_arg0, f58_arg1 )
			local f58_local0 = 0
			if f58_arg0.layout and f58_arg0.layout.frameWidget and f58_arg0.layout.frameWidget.framedWidget then
				f58_arg0.layout.frameWidget.framedWidget:playClip( "LoadingLoop" )
			end
			f58_arg0:addElement( LUI.UITimer.newElementTimer( 400, false, function ( f59_arg0 )
				if Engine.IsDemonwareFetchingDone( f58_arg1 ) then
					Engine.Exec( f58_arg1, "checkForPS3Invites" )
					local f59_local0 = GoBack( f58_arg0, f58_arg1 )
					if f58_arg0.callingMenu ~= nil then
						f59_arg0.controller = f58_arg1
						if f58_arg0.inviteAccepted == nil then
							if f58_arg0.OpenPrivateLobbyMenu == true then
								CoD.MainMenu.OpenPrivateLobbyMenu( f58_arg0.callingMenu, f59_arg0 )
							elseif f58_arg0.openingStore == nil or f58_arg0.openingStore == false then
								CoD.MainMenu.OpenMainLobbyRequested( f58_arg0.callingMenu, f59_arg0 )
							else
								CoD.MainLobby.OpenStore( f58_arg0.callingMenu, f59_arg0 )
							end
						end
					end
					return 
				end
				local f59_local0 = true
				if CoD.isPS3 then
					f59_local0 = Engine.CheckNetConnection()
				end
				if f58_local0 > CoD.Popup.CONNECTINGDW_MAX_WAIT_TIME or f59_local0 == false then
					local f59_local1 = GoBack( f58_arg0, f58_arg1 )
					local f59_local2 = ""
					if f59_local0 == false then
						f59_local2 = "XBOXLIVE_NETCONNECTION"
					else
						f59_local2 = Engine.Localize( "PLATFORM_DEMONWARE_DISCONNECT" ) .. "\n\n" .. Engine.Localize( "MENU_ERROR_CODE", Engine.GetSystemInfo( f58_arg1, CoD.SYSINFO_CONNECTIVITY_INFO ) )
					end
					LuaUtils.UI_ShowErrorMessageDialog( f58_arg1, f59_local2, "MENU_NOTICE_CAPS" )
					CoD.LobbyBase.FailedDWConnection = true
				end
				f58_local0 = f58_local0 + f59_arg0.timeElapsed
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
			DataSources.PublisherFilesChangedButtons = DataSourceHelpers.ListSetup( "PublisherFilesChangedButtons", function ( f61_arg0 )
				return {
					{
						models = {
							displayText = "MENU_CONFIRM_CAPS"
						},
						properties = {
							action = function ( f62_arg0, f62_arg1, f62_arg2, f62_arg3, f62_arg4 )
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
		postCreateStep = function ( f63_arg0, f63_arg1 )
			local f63_local0 = 0
			if f63_arg0.layout and f63_arg0.layout.frameWidget and f63_arg0.layout.frameWidget.framedWidget then
				f63_arg0.layout.frameWidget.framedWidget:playClip( "LoadingLoop" )
			end
			f63_arg0:addElement( LUI.UITimer.newElementTimer( 400, false, function ( f64_arg0 )
				local f64_local0 = Engine.GetPlayerQueueInfo( f63_arg1 )
				if Engine.IsPlayerQueued( f63_arg1 ) then
					if f64_local0 ~= nil then
						local f64_local1 = f64_local0.position
						local f64_local2 = f64_local0.eta
						if f64_local1 > 0 and f64_local2 > 0 then
							local f64_local3 = math.floor( f64_local2 / 60 )
							local f64_local4 = f64_local2 % 60
							local f64_local5 = math.floor( f64_local3 / 60 )
							local f64_local6 = f64_local3 % 60
							local f64_local7 = math.floor( f63_local0 / 1000 / 60 )
							CoD.OverlayUtility.Overlays[f63_arg0.menuName].description = Engine.Localize( "MENU_LOGIN_QUEUE", f64_local1, f64_local5, f64_local6, f64_local4, math.floor( f64_local7 / 60 ), f64_local7 % 60, math.floor( f63_local0 / 1000 ) % 60 )
							f63_arg0:refreshData( nil )
						end
					end
				elseif f64_local0 == nil or not f64_local0.success then
					local f64_local1 = "PLATFORM_DEMONWARE_DISCONNECT"
					local f64_local2 = GoBack( f63_arg0, f63_arg1 )
					LuaUtils.UI_ShowErrorMessageDialog( f63_arg1, f64_local1, "MENU_NOTICE_CAPS" )
					CoD.LobbyBase.FailedDWConnection = true
					Engine.LeaveQueue( f63_arg1 )
				else
					CoD.OverlayUtility.CreateOverlay( f63_arg1, GoBack( f63_arg0, f63_arg1 ), "ConnectingToDemonware" )
				end
				f63_local0 = f63_local0 + f64_arg0.timeElapsed
			end ) )
		end
	},
	ResetPCControls = {
		menuName = "SystemOverlay_Compact",
		title = Engine.Localize( "PLATFORM_RESET_CONTROLS_CONFIRM" ),
		description = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.Settings,
		listDatasource = function ()
			DataSources.ResetPCControls_List = DataSourceHelpers.ListSetup( "ResetPCControls_List", function ( f66_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f67_arg0, f67_arg1, f67_arg2, f67_arg3, f67_arg4 )
								GoBack( f67_arg4, f67_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f68_arg0, f68_arg1, f68_arg2, f68_arg3, f68_arg4 )
								ResetPCControlsToDefault( f68_arg4, f68_arg1, f68_arg2 )
								GoBack( f68_arg4, f68_arg2 )
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
			DataSources.ApplyPCGraphics_List = DataSourceHelpers.ListSetup( "ApplyPCGraphics_List", function ( f70_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f71_arg0, f71_arg1, f71_arg2, f71_arg3, f71_arg4 )
								CoD.PCUtil.FreeOptionsDirtyModel( f71_arg2 )
								GoBack( f71_arg4, f71_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f72_arg0, f72_arg1, f72_arg2, f72_arg3, f72_arg4 )
								ApplyPCGraphicsOptions( f72_arg4, f72_arg1, f72_arg2 )
								UpdateGamerprofile( f72_arg4, f72_arg1, f72_arg2 )
								CoD.PCUtil.FreeOptionsDirtyModel( f72_arg2 )
								GoBack( f72_arg4, f72_arg2 )
							end
							
						}
					}
				}
			end, true, nil )
			return "ApplyPCGraphics_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	ConfirmPCGraphicsChange = {
		menuName = "SystemOverlay_Compact",
		title = Engine.Localize( "PLATFORM_CONFIRM_GRAPHICS_CHANGE" ),
		description = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.Settings,
		listDatasource = function ()
			DataSources.ConfirmPCGraphicsChange_List = DataSourceHelpers.ListSetup( "ConfirmPCGraphicsChange_List", function ( f74_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f75_arg0, f75_arg1, f75_arg2, f75_arg3, f75_arg4 )
								CoD.PCUtil.FreeOptionsDirtyModel( f75_arg2 )
								GoBackMultiple( f75_arg4, f75_arg2, 2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f76_arg0, f76_arg1, f76_arg2, f76_arg3, f76_arg4 )
								ApplyPCGraphicsOptions( f76_arg4, f76_arg1, f76_arg2 )
								UpdateGamerprofile( f76_arg4, f76_arg1, f76_arg2 )
								CoD.PCUtil.FreeOptionsDirtyModel( f76_arg2 )
								GoBack( f76_arg4, f76_arg2 )
							end
							
						}
					}
				}
			end, true, nil )
			return "ConfirmPCGraphicsChange_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	ResetPCGraphics = {
		menuName = "SystemOverlay_Compact",
		title = Engine.Localize( "PLATFORM_RESTORE_GRAPHICS" ),
		description = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.Settings,
		listDatasource = function ()
			DataSources.ResetPCGraphics_List = DataSourceHelpers.ListSetup( "ResetPCGraphics_List", function ( f78_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f79_arg0, f79_arg1, f79_arg2, f79_arg3, f79_arg4 )
								GoBack( f79_arg4, f79_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f80_arg0, f80_arg1, f80_arg2, f80_arg3, f80_arg4 )
								ResetPCGraphicsOptions( f80_arg4, f80_arg1, f80_arg2 )
								UpdateGamerprofile( f80_arg4, f80_arg1, f80_arg2 )
								CoD.PCUtil.FreeOptionsDirtyModel( f80_arg2 )
								GoBack( f80_arg4, f80_arg2 )
							end
							
						}
					}
				}
			end, true, nil )
			return "ResetPCGraphics_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	RegistrationSuccess = {
		menuName = "SystemOverlay_MessageDialog",
		title = Engine.Localize( "MENU_REGISTRATION_SUCCESS_TITLE" ),
		description = Engine.Localize( "MENU_REGISTRATION_SUCCESS" ),
		categoryType = CoD.OverlayUtility.OverlayTypes.Unlock,
		listDatasource = function ()
			DataSources.RegistrationSuccess_List = DataSourceHelpers.ListSetup( "RegistrationSuccess_List", function ( f82_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_OK" )
						},
						properties = {
							action = function ( f83_arg0, f83_arg1, f83_arg2, f83_arg3, f83_arg4 )
								LUI.CoDMetrics.AccountCreated( f83_arg0, f83_arg2, "1", "menu" )
								FinishRegistrationFlow( f83_arg0, f83_arg2, f83_arg4 )
							end
							
						}
					}
				}
			end, true, nil )
			return "RegistrationSuccess_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ()
			return function ( f85_arg0, f85_arg1, f85_arg2, f85_arg3 )
				LUI.CoDMetrics.AccountCreated( f85_arg0, f85_arg2, "1", "menu" )
				FinishRegistrationFlow( f85_arg0, f85_arg2, f85_arg3 )
			end
			
		end
	},
	OptInSuccess = {
		menuName = "SystemOverlay_MessageDialog",
		title = Engine.Localize( "MENU_REGISTRATION_SUCCESS_TITLE" ),
		description = Engine.Localize( "MENU_REGISTRATION_OPTIN_SUCCESS" ),
		categoryType = CoD.OverlayUtility.OverlayTypes.Unlock,
		listDatasource = function ()
			DataSources.OptInSuccess_List = DataSourceHelpers.ListSetup( "OptInSuccess_List", function ( f87_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_OK" )
						},
						properties = {
							action = function ( f88_arg0, f88_arg1, f88_arg2, f88_arg3, f88_arg4 )
								LUI.CoDMetrics.AccountCreated( f88_arg0, f88_arg2, "1", "menu" )
								FinishRegistrationFlow( f88_arg0, f88_arg2, f88_arg4 )
							end
							
						}
					}
				}
			end, true, nil )
			return "OptInSuccess_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ()
			return function ( f90_arg0, f90_arg1, f90_arg2, f90_arg3 )
				LUI.CoDMetrics.AccountCreated( f90_arg0, f90_arg2, "1", "menu" )
				FinishRegistrationFlow( f90_arg0, f90_arg2, f90_arg3 )
			end
			
		end
	}
}
CoD.OverlayUtility.AddSystemOverlay = function ( f91_arg0, f91_arg1 )
	CoD.OverlayUtility.Overlays[f91_arg0] = f91_arg1
end

local f0_local1 = function ( f92_arg0, f92_arg1 )
	return function ()
		ClearMenuSavedState( f92_arg0 )
		if f92_arg0.overlayModelName then
			local f93_local0 = Engine.GetModel( Engine.GetModelForController( f92_arg1 ), f92_arg0.overlayModelName )
			if f93_local0 then
				Engine.UnsubscribeAndFreeModel( f93_local0 )
			end
		end
	end
	
end

local f0_local2 = function ( f94_arg0, f94_arg1, f94_arg2 )
	for f94_local4, f94_local5 in ipairs( CoD.OverlayUtility.OverlayModelFields ) do
		local f94_local3 = nil
		local f94_local6 = Engine.CreateModel( f94_arg0, f94_local5 )
		f94_local3 = f0_local0( f94_arg1[f94_local5], f94_arg2 )
		if not f94_local3 and CoD.OverlayUtility.DefaultModelFields[f94_local5] then
			f94_local3 = f0_local0( CoD.OverlayUtility.DefaultModelFields[f94_local5], {
				f94_arg1,
				f94_arg2
			} )
		end
		if f94_local3 ~= nil then
			Engine.SetModelValue( f94_local6, f94_local3 )
		end
	end
end

local f0_local3 = function ( f95_arg0, f95_arg1, f95_arg2 )
	for f95_local4, f95_local5 in ipairs( CoD.OverlayUtility.OverlayPropertyFields ) do
		local f95_local3 = nil
		f95_local3 = f0_local0( f95_arg1[f95_local5], f95_arg2 )
		if not f95_local3 and CoD.OverlayUtility.DefaultPropertyFields[f95_local5] then
			f95_local3 = f0_local0( CoD.OverlayUtility.DefaultPropertyFields[f95_local5], {
				f95_arg1,
				f95_arg2
			} )
		end
		f95_arg0[f95_local5] = f95_local3
	end
end

local f0_local4 = function ( f96_arg0, f96_arg1 )
	return function ()
		f0_local2( f96_arg0:getModel(), CoD.OverlayUtility.Overlays[f96_arg0.menuName], f96_arg1 )
		f0_local3( f96_arg0, CoD.OverlayUtility.Overlays[f96_arg0.menuName], f96_arg1 )
	end
	
end

CoD.OverlayUtility.CreateOverlay = function ( f98_arg0, f98_arg1, f98_arg2, ... )
	local f98_local0 = nil
	local f98_local1 = {
		n = select( "#", ... ),
		...
	}
	local f98_local2 = function ( f99_arg0, f99_arg1 )
		for f99_local4, f99_local5 in ipairs( CoD.OverlayUtility.OverlayModelFields ) do
			local f99_local3 = nil
			local f99_local6 = Engine.CreateModel( f99_arg0, f99_local5 )
			if type( f99_arg1[f99_local5] ) == "function" then
				f99_local3 = f99_arg1[f99_local5]( unpack( f98_local1 ) )
			else
				f99_local3 = f99_arg1[f99_local5]
			end
			if not f99_local3 and CoD.OverlayUtility.DefaultModelFields[f99_local5] then
				f99_local3 = f0_local0( CoD.OverlayUtility.DefaultModelFields[f99_local5], {
					f99_arg1,
					f98_local1
				} )
			end
			if f99_local3 ~= nil then
				Engine.SetModelValue( f99_local6, f99_local3 )
			end
		end
	end
	
	if CoD.OverlayUtility.Overlays[f98_arg2] then
		local f98_local3 = CoD.OverlayUtility.Overlays[f98_arg2]
		local f98_local4 = f0_local0( f98_local3.menuName, f98_local1 )
		if f98_local4 then
			if CoD.Menu.ModelToUse then
				f0_local2( CoD.Menu.ModelToUse, f98_local3, f98_local1 )
			end
			CoD.Menu.OverwriteMenuName = f98_arg2
			if not f98_local3.openMethod or f98_local3.openMethod == CoD.OverlayUtility.OpenMethods.Popup then
				f98_local0 = OpenPopup( f98_arg1, f98_local4, f98_arg0 )
			elseif f98_local3.openMethod == CoD.OverlayUtility.OpenMethods.Overlay then
				f98_local0 = OpenOverlay( f98_arg1, f98_local4, f98_arg0 )
			end
			CoD.Menu.OverwriteMenuName = nil
			if f98_local0 then
				f98_local0.refreshData = f0_local4( f98_local0, f98_local1 )
				f0_local3( f98_local0, f98_local3, f98_local1 )
				if not f98_local0:getModel() then
					f98_local0.overlayModelName = "Overlay." .. f98_arg2
					local f98_local5 = Engine.CreateModel( Engine.GetModelForController( f98_arg0 ), f98_local0.overlayModelName )
					f0_local2( f98_local5, f98_local3, f98_local1 )
					f98_local0:setModel( f98_local5 )
				end
				LUI.OverrideFunction_CallOriginalFirst( f98_local0, "close", f0_local1( f98_local0, f98_arg0 ) )
				if f98_local3.postCreateStep then
					f98_local3.postCreateStep( f98_local0, f98_arg0 )
				end
			end
		end
	end
	return f98_local0
end

