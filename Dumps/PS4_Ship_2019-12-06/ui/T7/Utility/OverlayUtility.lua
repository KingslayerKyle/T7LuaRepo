require( "lua.Shared.LuaEnums" )

CoD.OverlayUtility = {}
CoD.OverlayUtility.OpenMethods = LuaEnums.createEnum( "Popup", "Overlay" )
CoD.OverlayUtility.OverlayTypes = LuaEnums.createEnum( "GenericMessage", "Connection", "Settings", "Unlock", "Save", "Quit", "Alert", "Error" )
CoD.OverlayUtility.GenericPopupSizes = LuaEnums.createEnum( "Small", "Large" )
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
	"state",
	"cryptokeyType"
}
CoD.OverlayUtility.GoBackPropertyName = "backButtonFn"
CoD.OverlayUtility.ProcessActionPropertyName = "actionButtonFn"
CoD.OverlayUtility.OverlayPropertyFields = {
	CoD.OverlayUtility.GoBackPropertyName,
	CoD.OverlayUtility.ProcessActionPropertyName
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
			return "blacktransparent"
		end
	end,
	frameWidget = function ( f3_arg0, f3_arg1 )
		local f3_local0 = f0_local0( f3_arg0.menuName, f3_arg1 )
		if f3_local0 == "SystemOverlay_Compact" or f3_local0 == "SystemOverlay_MessageDialog" or f3_local0 == "SystemOverlay_NoBG" then
			return "CoD.systemOverlay_Compact_BasicFrame"
		elseif f3_local0 == "SystemOverlay_Full" then
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

CoD.OverlayUtility.DefaultButtonAction = function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3, f6_arg4 )
	GoBack( f6_arg4, f6_arg2 )
end

CoD.OverlayUtility.QueueGoBack = function ()
	return function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3 )
		Engine.LeaveQueue( f8_arg2 )
		GoBack( f8_arg3, f8_arg2 )
	end
	
end

CoD.OverlayUtility.DefaultScriptDialogGoBack = function ( f9_arg0 )
	return function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
		SendMenuResponse( f10_arg3, f9_arg0, "close", f10_arg2 )
		Engine.LockInput( f10_arg2, false )
		Close( f10_arg3, f10_arg2 )
	end
	
end

CoD.OverlayUtility.AutoSizeMenuFromDescription = function ( f11_arg0 )
	return function ( ... )
		if Engine.GetNumTextLines( f0_local0( CoD.OverlayUtility.Overlays[f11_arg0].description, {
			n = select( "#", ... ),
			...
		} ), CoD.fonts.Default, 20, 660 ) > 3 then
			return "SystemOverlay_Full"
		else
			return "SystemOverlay_Compact"
		end
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
			DataSources.EndGamePopup_List = DataSourceHelpers.ListSetup( "EndGamePopup_List", function ( f16_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3, f17_arg4 )
								if Engine.CanPauseGame() then
									Engine.SetDvar( "cl_paused", 0 )
								end
								if CoD.isMultiplayer == true then
									
								else
									
								end
								CloseStartMenu( f17_arg4, f17_arg2 )
								CoD.QuitGame( f17_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3, f18_arg4 )
								GoBack( f18_arg4, f18_arg2 )
							end
							,
							selectIndex = true
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
		description = function ()
			if not Engine.DvarBool( 0, "ui_blocksaves" ) then
				return Engine.Localize( "MENU_SAVEQUIT_TEXT_WITHOUT_DEVICE_CHANGE" )
			else
				return ""
			end
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Quit,
		listDatasource = function ()
			DataSources.SaveAndQuitGamePopup_List = DataSourceHelpers.ListSetup( "SaveAndQuitGamePopup_List", function ( f21_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_RESUMEGAME_CAPS" )
						},
						properties = {
							action = function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3, f22_arg4 )
								Engine.SetDvar( "cl_paused", 0 )
								Engine.LockInput( f22_arg2, false )
								CloseStartMenu( f22_arg4, f22_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_SAVE_AND_QUIT_CAPS" )
						},
						properties = {
							action = function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3, f23_arg4 )
								Engine.Exec( f23_arg2, "updategamerprofile" )
								f23_arg4:openMenu( "SaveGameSavingPopup", f23_arg2 )
								f23_arg4:close()
								CloseStartMenu( f23_arg4, f23_arg2 )
								Engine.SendMenuResponse( f23_arg2, "popup_leavegame", "endround" )
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
			DataSources.QuitGamePopup_List = DataSourceHelpers.ListSetup( "QuitGamePopup_List", function ( f25_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_RESUMEGAME_CAPS" )
						},
						properties = {
							action = function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3, f26_arg4 )
								Engine.SetDvar( "cl_paused", 0 )
								f26_arg4:processEvent( {
									name = "close_all_ingame_menus",
									controller = f26_arg2
								} )
								CloseStartMenu( f26_arg4, f26_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "PLATFORM_QUIT_CAPS" )
						},
						properties = {
							action = function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3, f27_arg4 )
								f27_arg4:processEvent( {
									name = "close_all_ingame_menus",
									controller = f27_arg2
								} )
								Engine.SetDvar( "cl_paused", 0 )
								Engine.SendMenuResponse( f27_arg2, "popup_leavegame", "endround" )
								Engine.Exec( f27_arg2, "disconnect" )
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
			DataSources.QuitPCGamePopup_List = DataSourceHelpers.ListSetup( "QuitPCGamePopup_List", function ( f29_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f30_arg0, f30_arg1, f30_arg2, f30_arg3, f30_arg4 )
								GoBack( f30_arg4, f30_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3, f31_arg4 )
								Engine.Exec( f31_arg2, "quit" )
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
			DataSources.RestartCheckpointPopup_List = DataSourceHelpers.ListSetup( "RestartCheckpointPopup_List", function ( f33_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_RESUMEGAME_CAPS" )
						},
						properties = {
							action = function ( f34_arg0, f34_arg1, f34_arg2, f34_arg3, f34_arg4 )
								Engine.SetDvar( "cl_paused", 0 )
								Engine.LockInput( f34_arg2, false )
								CloseStartMenu( f34_arg4, f34_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_RESTART_CHECKPOINT_CAPS" )
						},
						properties = {
							action = function ( f35_arg0, f35_arg1, f35_arg2, f35_arg3, f35_arg4 )
								Dvar.ui_busyBlockIngameMenu:set( 1 )
								f35_arg4:dispatchEventToRoot( {
									name = "flush_dynamic_hud"
								} )
								f35_arg4:processEvent( {
									name = "close_all_ingame_menus",
									controller = f35_arg2
								} )
								Engine.SetDvar( "cl_paused", 0 )
								CloseStartMenu( f35_arg4, f35_arg2 )
								Engine.Exec( f35_arg2, "fade 0 0 0 255 0 0 1" )
								Engine.Exec( f35_arg2, "stopControllerRumble" )
								Engine.Exec( f35_arg2, "silence" )
								Engine.Exec( f35_arg2, "checkpoint_restart" )
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
			DataSources.RestartGamePopup_List = DataSourceHelpers.ListSetup( "RestartGamePopup_List", function ( f37_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f38_arg0, f38_arg1, f38_arg2, f38_arg3, f38_arg4 )
								GoBack( f38_arg4, f38_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f39_arg0, f39_arg1, f39_arg2, f39_arg3, f39_arg4 )
								Engine.SetDvar( "cl_paused", 0 )
								Dvar.ui_busyBlockIngameMenu:set( 1 )
								CloseStartMenu( f39_arg4, f39_arg2 )
								Engine.Exec( f39_arg2, "stopControllerRumble" )
								Engine.Exec( f39_arg2, "fade 0 0 0 255 0 0 1" )
								Engine.Exec( f39_arg2, "silence" )
								if (Engine.SessionModeIsMode( CoD.SESSIONMODE_SYSTEMLINK ) == true) or Engine.SessionModeIsMode( CoD.SESSIONMODE_OFFLINE ) == true then
									Engine.Exec( f39_arg2, "fast_restart" )
								else
									Engine.SendMenuResponse( f39_arg2, "restartgamepopup", "restart_level_zm" )
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
			DataSources.RestartMissionPopup_List = DataSourceHelpers.ListSetup( "RestartMissionPopup_List", function ( f41_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_RESUMEGAME_CAPS" )
						},
						properties = {
							action = function ( f42_arg0, f42_arg1, f42_arg2, f42_arg3, f42_arg4 )
								Engine.SetDvar( "cl_paused", 0 )
								Engine.LockInput( f42_arg2, false )
								CloseStartMenu( f42_arg4, f42_arg2 )
								f42_arg4:processEvent( {
									name = "close_all_ingame_menus",
									controller = f42_arg2
								} )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_RESTART_MISSION_CAPS" )
						},
						properties = {
							action = function ( f43_arg0, f43_arg1, f43_arg2, f43_arg3, f43_arg4 )
								Dvar.ui_busyBlockIngameMenu:set( 1 )
								f43_arg4:processEvent( {
									name = "close_all_ingame_menus",
									controller = f43_arg2
								} )
								Engine.SetDvar( "cl_paused", 0 )
								Engine.SendMenuResponse( f43_arg2, "StartMenu_Main", "restartmission" )
								CloseStartMenu( f43_arg4, f43_arg2 )
								Engine.PlayMenuMusic( "death" )
								Engine.Exec( f43_arg2, "stopControllerRumble" )
								Engine.Exec( f43_arg2, "fade 0 0 0 255 0 0 1" )
								Engine.Exec( f43_arg2, "silence" )
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
		getStringRef = function ( f44_arg0 )
			return Engine.GetModelValue( Engine.GetModel( DataSources.MessageDialog.getModel( f44_arg0 ), "message" ) ) or ""
		end,
		title = function ( f45_arg0 )
			local f45_local0 = DataSources.MessageDialog.getModel( f45_arg0 )
			local f45_local1 = CoD.SafeGetModelValue( f45_local0, "messageTitle" )
			if f45_local1 == nil or f45_local1 == "" then
				local f45_local2 = Engine.GetModelValue( Engine.GetModel( f45_local0, "messageType" ) )
				if f45_local2 == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_INFO then
					f45_local1 = Engine.Localize( "MENU_INFO" )
				elseif f45_local2 == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_WARNING then
					f45_local1 = Engine.Localize( "MENU_WARNING" )
				elseif f45_local2 == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_ERROR then
					f45_local1 = Engine.Localize( "MENU_ERROR" )
				elseif f45_local2 == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_NOTICE then
					f45_local1 = Engine.Localize( "MENU_NOTICE" )
				end
			end
			return Engine.ToUpper( f45_local1 )
		end,
		description = function ( f46_arg0 )
			return Engine.Localize( CoD.OverlayUtility.Overlays.MessageDialogBox.getStringRef( f46_arg0 ) )
		end,
		categoryType = function ( f47_arg0 )
			local modelValue = Engine.GetModelValue( Engine.GetModel( DataSources.MessageDialog.getModel( f47_arg0 ), "messageType" ) )
			local f47_local1 = CoD.OverlayUtility.OverlayTypes.GenericMessage
			if modelValue == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_WARNING then
				f47_local1 = CoD.OverlayUtility.OverlayTypes.Alert
			elseif modelValue == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_ERROR then
				f47_local1 = CoD.OverlayUtility.OverlayTypes.Error
			end
			return f47_local1
		end,
		listDatasource = function ( f48_arg0 )
			local f48_local0 = "MessageDialogBoxList" .. Engine.GetModelValue( Engine.GetModel( DataSources.MessageDialog.getModel( f48_arg0 ), "messagePending" ) )
			DataSources[f48_local0] = DataSourceHelpers.ListSetup( f48_local0, function ( f49_arg0 )
				return {
					{
						models = {
							displayText = "OK"
						},
						properties = {
							action = function ( f50_arg0, f50_arg1, f50_arg2, f50_arg3, f50_arg4 )
								LuaUtils.UI_ClearErrorMessageDialog()
								GoBack( f50_arg4, f50_arg2 )
							end
							
						}
					}
				}
			end, true, nil )
			return f48_local0
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ( f51_arg0 )
			local f51_local0 = CoD.OverlayUtility.Overlays.MessageDialogBox.getStringRef( f51_arg0 )
			if CoD.OverlayUtility.Overlays.MessageDialogBox.getStringRef( f51_arg0 ) ~= "PLATFORM_SAVEDATA_CORRUPT" then
				return function ( f52_arg0, f52_arg1, f52_arg2, f52_arg3 )
					LuaUtils.UI_ClearErrorMessageDialog()
					GoBack( f52_arg3, f52_arg2 )
				end
				
			else
				
			end
		end
	},
	DemoSaveClipPopup = {
		menuName = "SystemOverlay_Full",
		title = function ()
			return Engine.ToUpper( Engine.Localize( "MENU_KEEP_SEGMENT" ) )
		end,
		description = function ()
			return Engine.Localize( "DEMO_KEEP_SEGMENT_HINT" )
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Save,
		listDatasource = function ()
			DataSources.DemoSaveClipPopup_List = DataSourceHelpers.ListSetup( "DemoSaveClipPopup_List", function ( f56_arg0 )
				local f56_local0 = {}
				table.insert( f56_local0, {
					models = {
						displayText = Engine.Localize( "MENU_AUTONAME_SEGMENT" )
					},
					properties = {
						action = function ( f57_arg0, f57_arg1, f57_arg2, f57_arg3, f57_arg4 )
							Engine.Exec( f57_arg2, "demo_savesegment 0" )
							GoBack( f57_arg4, f57_arg2 )
						end
					}
				} )
				table.insert( f56_local0, {
					models = {
						displayText = Engine.Localize( "MENU_NAME_SEGMENT" )
					},
					properties = {
						action = function ( f58_arg0, f58_arg1, f58_arg2, f58_arg3, f58_arg4 )
							Engine.Exec( f58_arg2, "demo_keyboard segmentName" )
						end
					}
				} )
				table.insert( f56_local0, {
					models = {
						displayText = Engine.Localize( "MENU_PREVIEW_SEGMENT" )
					},
					properties = {
						action = function ( f59_arg0, f59_arg1, f59_arg2, f59_arg3, f59_arg4 )
							Engine.Exec( f59_arg2, "demo_previewsegment" )
							GoBack( f59_arg4, f59_arg2 )
						end
					}
				} )
				table.insert( f56_local0, {
					models = {
						displayText = Engine.Localize( "MENU_DISCARD_SEGMENT" )
					},
					properties = {
						action = function ( f60_arg0, f60_arg1, f60_arg2, f60_arg3, f60_arg4 )
							Engine.Exec( f60_arg2, "demo_savesegment 1" )
							GoBack( f60_arg4, f60_arg2 )
						end
					}
				} )
				return f56_local0
			end, true, nil )
			return "DemoSaveClipPopup_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = nil
	},
	DemoDeleteAllDollyCameraMarkers = {
		menuName = "SystemOverlay_Compact",
		title = function ()
			return Engine.ToUpper( Engine.Localize( "DEMO_DELETE_ALL_KEYFRAMES" ) )
		end,
		description = function ()
			return Engine.Localize( "DEMO_DELETE_ALL_KEYFRAMES_HINT" )
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Alert,
		listDatasource = function ()
			DataSources.DemoDeleteAllDollyCameraMarkers_List = DataSourceHelpers.ListSetup( "DemoDeleteAllDollyCameraMarkers_List", function ( f64_arg0 )
				local f64_local0 = {}
				table.insert( f64_local0, {
					models = {
						displayText = Engine.Localize( "DEMO_DELETE_ALL" )
					},
					properties = {
						action = function ( f65_arg0, f65_arg1, f65_arg2, f65_arg3, f65_arg4 )
							CoD.DemoUtility.RemoveDollyCamMarker( f65_arg2, -1 )
							CoD.DemoUtility.SetEditingMode( f65_arg2, false )
							GoBack( f65_arg4, f65_arg2 )
						end
					}
				} )
				table.insert( f64_local0, {
					models = {
						displayText = Engine.Localize( "MENU_CANCEL" )
					},
					properties = {
						action = function ( f66_arg0, f66_arg1, f66_arg2, f66_arg3, f66_arg4 )
							GoBack( f66_arg4, f66_arg2 )
						end
					}
				} )
				return f64_local0
			end, true, nil )
			return "DemoDeleteAllDollyCameraMarkers_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = nil
	},
	EndDemoPopup = {
		menuName = "SystemOverlay_Compact",
		title = function ()
			local f67_local0 = nil
			local f67_local1 = Engine.IsDemoClipPlaying()
			local f67_local2 = Engine.GameHost()
			if not f67_local1 then
				if f67_local2 then
					f67_local0 = Engine.Localize( "MPUI_LEAVE_FILM" )
				else
					f67_local0 = Engine.Localize( "MPUI_END_FILM" )
				end
			elseif f67_local2 then
				f67_local0 = Engine.Localize( "MPUI_LEAVE_CLIP" )
			else
				f67_local0 = Engine.Localize( "MPUI_END_CLIP" )
			end
			return Engine.ToUpper( f67_local0 )
		end,
		description = function ()
			if Engine.IsClipModified() then
				return Engine.Localize( "MENU_DEMO_UNUPLOADED_CLIP" )
			else
				return ""
			end
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Quit,
		listDatasource = function ()
			DataSources.EndDemoPopup_List = DataSourceHelpers.ListSetup( "EndDemoPopup_List", function ( f70_arg0 )
				local f70_local0 = {}
				local f70_local1 = Engine.IsClipModified()
				local f70_local2 = function ()
					if not Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
						Engine.GameModeResetModes()
						Engine.SessionModeResetModes()
						Engine.Exec( f70_arg0, "disconnect" )
					else
						Engine.Exec( f70_arg0, "xpartystopdemo" )
					end
				end
				
				if not f70_local1 then
					table.insert( f70_local0, {
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f72_arg0, f72_arg1, f72_arg2, f72_arg3, f72_arg4 )
								GoBack( f72_arg4, f72_arg2 )
								f70_local2( f72_arg2 )
							end
						}
					} )
					table.insert( f70_local0, {
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f73_arg0, f73_arg1, f73_arg2, f73_arg3, f73_arg4 )
								GoBack( f73_arg4, f73_arg2 )
							end
						}
					} )
				else
					table.insert( f70_local0, {
						models = {
							displayText = Engine.Localize( "MENU_SAVE_CLIP" )
						},
						properties = {
							action = function ( f74_arg0, f74_arg1, f74_arg2, f74_arg3, f74_arg4 )
								GoBack( f74_arg4, f74_arg2 )
							end,
							disabled = true
						}
					} )
					table.insert( f70_local0, {
						models = {
							displayText = Engine.Localize( "MENU_END_FILM_WITHOUT_SAVING" )
						},
						properties = {
							action = function ( f75_arg0, f75_arg1, f75_arg2, f75_arg3, f75_arg4 )
								GoBack( f75_arg4, f75_arg2 )
								f70_local2( f75_arg2 )
							end
						}
					} )
					table.insert( f70_local0, {
						models = {
							displayText = Engine.Localize( "MENU_CANCEL" )
						},
						properties = {
							action = function ( f76_arg0, f76_arg1, f76_arg2, f76_arg3, f76_arg4 )
								GoBack( f76_arg4, f76_arg2 )
							end
						}
					} )
				end
				return f70_local0
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
	UpdateNeeded = {
		menuName = "SystemOverlay_Compact",
		title = "MENU_NOTICE",
		description = "MENU_UPDATE_NEEDED",
		categoryType = CoD.OverlayUtility.OverlayTypes.Connection,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		listDatasource = function ( f77_arg0 )
			DataSources.UpdateNeededPopupList = DataSourceHelpers.ListSetup( "UpdateNeededPopupList", function ( f78_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_OK" )
						},
						properties = {
							action = function ( f79_arg0, f79_arg1, f79_arg2, f79_arg3, f79_arg4 )
								CoD.LobbyBase.FailedDWConnection = true
								GoBack( f79_arg4, f79_arg2 )
							end
							
						}
					}
				}
			end, true, nil )
			return "UpdateNeededPopupList"
		end
	},
	LoadingProfile = {
		menuName = "SystemOverlay_Compact",
		postCreateStep = function ( f80_arg0, f80_arg1 )
			local f80_local0 = 0
			if f80_arg0.layout and f80_arg0.layout.frameWidget and f80_arg0.layout.frameWidget.framedWidget then
				f80_arg0.layout.frameWidget.framedWidget:playClip( "LoadingLoop" )
			end
			f80_arg0:addElement( LUI.UITimer.newElementTimer( 400, false, function ( f81_arg0 )
				if Engine.AreLocalFilesReady( f80_arg1 ) == true then
					GoBack( f80_arg0, f80_arg1 )
					return 
				elseif f80_local0 > CoD.Popup.LOCAL_FILES_FETCH_WAIT_TIME then
					GoBack( f80_arg0, f80_arg1 )
					return 
				else
					f80_local0 = f80_local0 + f81_arg0.timeElapsed
				end
			end ) )
		end,
		title = "MENU_LOADING_PROFILE",
		description = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.Connection,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	ConnectingToDemonware = {
		menuName = "SystemOverlay_Compact",
		postCreateStep = function ( f82_arg0, f82_arg1 )
			local f82_local0 = 0
			if f82_arg0.layout and f82_arg0.layout.frameWidget and f82_arg0.layout.frameWidget.framedWidget then
				f82_arg0.layout.frameWidget.framedWidget:playClip( "LoadingLoop" )
			end
			f82_arg0:addElement( LUI.UITimer.newElementTimer( 400, false, function ( f83_arg0 )
				if Engine.IsDemonwareFetchingDone( f82_arg1 ) then
					GoBack( f82_arg0, f82_arg1 )
					return 
				end
				local f83_local0 = true
				if CoD.isPS3 then
					f83_local0 = Engine.CheckNetConnection()
				end
				if f82_local0 > CoD.Popup.CONNECTINGDW_MAX_WAIT_TIME or f83_local0 == false then
					local f83_local1 = GoBack( f82_arg0, f82_arg1 )
					local f83_local2 = ""
					if f83_local0 == false then
						f83_local2 = "XBOXLIVE_NETCONNECTION"
					else
						local f83_local3, f83_local4 = Engine.GetSystemInfo( f82_arg1, CoD.SYSINFO_CONNECTIVITY_INFO )
						f83_local2 = Engine.Localize( "PLATFORM_DEMONWARE_DISCONNECT" ) .. "\n\n" .. Engine.Localize( "MENU_ERROR_CODE", f83_local3 )
						if Engine.IsShipBuild() == false then
							f83_local2 = f83_local2 .. "\n\n\tDEBUG INFO:\n" .. f83_local4
						end
					end
					LuaUtils.UI_ShowErrorMessageDialog( f82_arg1, f83_local2, "MENU_NOTICE_CAPS" )
					CoD.LobbyBase.FailedDWConnection = true
				end
				f82_local0 = f82_local0 + f83_arg0.timeElapsed
			end ) )
		end,
		title = "MENU_CONNECTING_DW",
		description = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.Connection,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	LobbyPlayNetworkModePopup = {
		menuName = CoD.OverlayUtility.AutoSizeMenuFromDescription( "LobbyPlayNetworkModePopup" ),
		title = function ( f84_arg0 )
			local f84_local0 = ""
			if f84_arg0 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
				f84_local0 = "PLATFORM_XBOX_LIVE_CAPS"
			elseif f84_arg0 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
				f84_local0 = "MENU_PLAY_LOCAL_CAPS"
			end
			return Engine.Localize( f84_local0 )
		end,
		description = function ( f85_arg0 )
			local f85_local0 = ""
			if f85_arg0 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
				if Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 1 then
					f85_local0 = "XBOXLIVE_PLAY_ONLINE_AND_DISBAND_DESC"
				else
					f85_local0 = "XBOXLIVE_PLAY_ONLINE_DESC"
				end
			elseif f85_arg0 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
				if Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 1 then
					f85_local0 = "XBOXLIVE_DISBAND_AND_PLAY_LOCAL_DESC"
				else
					f85_local0 = "XBOXLIVE_PLAY_LOCAL_DESC"
				end
			end
			return Engine.Localize( f85_local0 )
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Connection,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		listDatasource = function ( f86_arg0 )
			DataSources.LobbyPlayNetworkModePopupButtons = DataSourceHelpers.ListSetup( "LobbyPlayNetworkModePopupButtons", function ( f87_arg0 )
				local f87_local0 = ""
				if f86_arg0 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
					f87_local0 = "XBOXLIVE_PLAY_ONLINE"
				elseif f86_arg0 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
					f87_local0 = "MENU_PLAY_LOCAL"
				end
				return {
					{
						models = {
							displayText = Engine.Localize( f87_local0 )
						},
						properties = {
							action = function ( f88_arg0, f88_arg1, f88_arg2, f88_arg3, f88_arg4 )
								LobbyToggleNetwork( f88_arg0, f88_arg1, f88_arg2, f88_arg3 )
								GoBack( f88_arg4, f88_arg2 )
							end
							,
							actionParam = f86_arg0
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_CANCEL" )
						},
						properties = {
							action = function ( f89_arg0, f89_arg1, f89_arg2, f89_arg3, f89_arg4 )
								GoBack( f89_arg4, f89_arg2 )
							end
							
						}
					}
				}
			end, true, nil )
			return "LobbyPlayNetworkModePopupButtons"
		end
	},
	FreerunEndGamePopup = {
		menuName = "SystemOverlay_NoBG",
		title = "MENU_PLAY_AGAIN",
		description = "",
		image = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ()
			DataSources.FreerunEndGameButtons = DataSourceHelpers.ListSetup( "FreerunEndGameButtons", function ( f91_arg0 )
				return {
					{
						models = {
							displayText = "MENU_FR_RESTART_COURSE"
						},
						properties = {
							action = function ( f92_arg0, f92_arg1, f92_arg2, f92_arg3, f92_arg4 )
								GoBack( f92_arg0, f92_arg2 )
								Engine.SendMenuResponse( f92_arg2, "freerun_endgame_popup", "fr_restart" )
							end
							
						}
					},
					{
						models = {
							displayText = "MENU_QUIT_GAME_CAPS"
						},
						properties = {
							action = function ( f93_arg0, f93_arg1, f93_arg2, f93_arg3, f93_arg4 )
								GoBack( f93_arg0, f93_arg2 )
								CoD.QuitGame( f93_arg2 )
							end
							
						}
					}
				}
			end, true, nil )
			return "FreerunEndGameButtons"
		end
	},
	RestrictedAttachmentMenu = {
		menuName = "FeatureOverlay",
		title = function ( f94_arg0, f94_arg1 )
			return "MENU_ATTACHMENT_RESTRICTION_OPTIONS"
		end,
		description = function ( f95_arg0, f95_arg1 )
			return ""
		end,
		image = function ( f96_arg0, f96_arg1 )
			local f96_local0 = f96_arg1:getModel()
			if f96_local0 then
				return Engine.GetModelValue( Engine.GetModel( f96_local0, "image" ) )
			else
				return ""
			end
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		openMethod = CoD.OverlayUtility.OpenMethods.Overlay,
		frameWidget = "CoD.GameSettings_AttachmentOptionsPopup",
		[CoD.OverlayUtility.GoBackPropertyName] = function ()
			return function ( f98_arg0, f98_arg1, f98_arg2, f98_arg3 )
				Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings.Update" ) )
				GoBack( f98_arg0, f98_arg2 )
			end
			
		end,
		listDatasource = function ( f99_arg0, f99_arg1 )
			DataSources.CompetitiveSettingsAttachment = DataSourceHelpers.ListSetup( "CompetitiveSettingsAttachment", function ()
				local f100_local0 = f99_arg1:getModel()
				local f100_local1 = Engine.GetModelValue( Engine.GetModel( f100_local0, "attachmentIndex" ) )
				local f100_local2 = Engine.GetModelValue( Engine.GetModel( f100_local0, "title" ) )
				local f100_local3 = Engine.GetModelValue( Engine.GetModel( f100_local0, "description" ) )
				local f100_local4 = Engine.GetModelValue( Engine.GetModel( f100_local0, "image" ) )
				local f100_local5 = {}
				table.insert( f100_local5, CoD.OptionsUtility.CreateItemRestrictionSettings( f99_arg0, f100_local2, "", "Attachment_" .. f100_local2, CoD.GameSettingsUtility.GetGroupRestrictionOptions(), f100_local4, CoD.OptionsUtility.GametypeSettingsSetAttachmentRestrictionState, {
					attachmentIndex = f100_local1
				}, function ( f101_arg0 )
					if Engine.AttachmentRestrictionStateChangedForAnyWeapon( f101_arg0.attachmentIndex ) == true then
						return -1
					else
						return Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_NONE
					end
				end ) )
				return f100_local5
			end, nil, nil, function ( f102_arg0, f102_arg1, f102_arg2 )
				local f102_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" ), "Update" )
				if f102_arg1.updateSubscription then
					f102_arg1:removeSubscription( f102_arg1.updateSubscription )
				end
				f102_arg1.updateSubscription = f102_arg1:subscribeToModel( f102_local0, function ()
					f102_arg1:updateDataSource( false )
				end, false )
			end )
			return "CompetitiveSettingsAttachment"
		end
	},
	LoginQueued = {
		menuName = "SystemOverlay_MessageDialog",
		title = Engine.Localize( "MENU_LOGIN_QUEUE_DEFAULT" ),
		description = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.Connection,
		postCreateStep = function ( f104_arg0, f104_arg1 )
			local f104_local0 = 0
			if f104_arg0.layout and f104_arg0.layout.frameWidget and f104_arg0.layout.frameWidget.framedWidget then
				f104_arg0.layout.frameWidget.framedWidget:playClip( "LoadingLoop" )
			end
			f104_arg0:addElement( LUI.UITimer.newElementTimer( 400, false, function ( f105_arg0 )
				local f105_local0 = Engine.GetPlayerQueueInfo( f104_arg1 )
				if Engine.IsPlayerQueued( f104_arg1 ) then
					if f105_local0 ~= nil then
						local f105_local1 = f105_local0.position
						local f105_local2 = f105_local0.eta
						if f105_local1 > 0 and f105_local2 > 0 then
							local f105_local3 = math.floor( f105_local2 / 60 )
							local f105_local4 = f105_local2 % 60
							local f105_local5 = math.floor( f105_local3 / 60 )
							local f105_local6 = f105_local3 % 60
							local f105_local7 = math.floor( f104_local0 / 1000 / 60 )
							CoD.OverlayUtility.Overlays[f104_arg0.menuName].description = Engine.Localize( "MENU_LOGIN_QUEUE", f105_local1, f105_local5, f105_local6, f105_local4, math.floor( f105_local7 / 60 ), f105_local7 % 60, math.floor( f104_local0 / 1000 ) % 60 )
							f104_arg0:refreshData( nil )
						end
					end
				elseif f105_local0 == nil or not f105_local0.success then
					local f105_local1 = "PLATFORM_DEMONWARE_DISCONNECT"
					local f105_local2 = GoBack( f104_arg0, f104_arg1 )
					LuaUtils.UI_ShowErrorMessageDialog( f104_arg1, f105_local1, "MENU_NOTICE_CAPS" )
					CoD.LobbyBase.FailedDWConnection = true
					Engine.LeaveQueue( f104_arg1 )
				else
					CoD.OverlayUtility.CreateOverlay( f104_arg1, GoBack( f104_arg0, f104_arg1 ), "ConnectingToDemonware" )
				end
				f104_local0 = f104_local0 + f105_arg0.timeElapsed
			end ) )
		end
	},
	CraftNoChangesNotification = {
		menuName = "SystemOverlay_Compact",
		title = "MENU_EMBLEM_NO_CHANGES_TITLE",
		description = "MENU_EMBLEM_NO_CHANGES_DESC",
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ()
			DataSources.CraftNoChangesNotification = DataSourceHelpers.ListSetup( "CraftNoChangesNotification", function ( f107_arg0 )
				return {
					{
						models = {
							displayText = "MENU_OK_CAPS"
						},
						properties = {
							action = function ( f108_arg0, f108_arg1, f108_arg2, f108_arg3, f108_arg4 )
								EmblemEditor_NoChangesAction( f108_arg0, f108_arg1, f108_arg2, f108_arg4 )
							end
							
						}
					}
				}
			end, true, nil )
			return "CraftNoChangesNotification"
		end
	},
	PublisherFilesChangedPopup = {
		menuName = "SystemOverlay_Compact",
		title = "MENU_REFETCH_WAD_CONFIRMATION_TITLE",
		description = "MENU_REFETCH_WAD_CONFIRMATION_MESSAGE",
		categoryType = CoD.OverlayUtility.OverlayTypes.Connection,
		listDatasource = function ()
			DataSources.PublisherFilesChangedButtons = DataSourceHelpers.ListSetup( "PublisherFilesChangedButtons", function ( f110_arg0 )
				return {
					{
						models = {
							displayText = "MENU_CONFIRM_CAPS"
						},
						properties = {
							action = function ( f111_arg0, f111_arg1, f111_arg2, f111_arg3, f111_arg4 )
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
	ResetPCControls = {
		menuName = "SystemOverlay_Compact",
		title = Engine.Localize( "PLATFORM_RESET_CONTROLS_CONFIRM" ),
		description = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.Settings,
		listDatasource = function ()
			DataSources.ResetPCControls_List = DataSourceHelpers.ListSetup( "ResetPCControls_List", function ( f113_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f114_arg0, f114_arg1, f114_arg2, f114_arg3, f114_arg4 )
								GoBack( f114_arg4, f114_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f115_arg0, f115_arg1, f115_arg2, f115_arg3, f115_arg4 )
								ResetPCControlsToDefault( f115_arg4, f115_arg1, f115_arg2 )
								GoBack( f115_arg4, f115_arg2 )
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
			DataSources.ApplyPCGraphics_List = DataSourceHelpers.ListSetup( "ApplyPCGraphics_List", function ( f117_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f118_arg0, f118_arg1, f118_arg2, f118_arg3, f118_arg4 )
								CoD.PCUtil.FreeOptionsDirtyModel( f118_arg2 )
								GoBack( f118_arg4, f118_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f119_arg0, f119_arg1, f119_arg2, f119_arg3, f119_arg4 )
								ApplyPCGraphicsOptions( f119_arg4, f119_arg1, f119_arg2 )
								UpdateGamerprofile( f119_arg4, f119_arg1, f119_arg2 )
								CoD.PCUtil.FreeOptionsDirtyModel( f119_arg2 )
								GoBack( f119_arg4, f119_arg2 )
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
			DataSources.RegistrationSuccess_List = DataSourceHelpers.ListSetup( "RegistrationSuccess_List", function ( f121_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_OK" )
						},
						properties = {
							action = function ( f122_arg0, f122_arg1, f122_arg2, f122_arg3, f122_arg4 )
								LUI.CoDMetrics.AccountCreated( f122_arg0, f122_arg2, "1", "menu" )
								FinishRegistrationFlow( f122_arg0, f122_arg2, f122_arg4 )
							end
							
						}
					}
				}
			end, true, nil )
			return "RegistrationSuccess_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ()
			return function ( f124_arg0, f124_arg1, f124_arg2, f124_arg3 )
				LUI.CoDMetrics.AccountCreated( f124_arg0, f124_arg2, "1", "menu" )
				FinishRegistrationFlow( f124_arg0, f124_arg2, f124_arg3 )
			end
			
		end
	},
	OptInSuccess = {
		menuName = "SystemOverlay_MessageDialog",
		title = Engine.Localize( "MENU_REGISTRATION_SUCCESS_TITLE" ),
		description = Engine.Localize( "MENU_REGISTRATION_OPTIN_SUCCESS" ),
		categoryType = CoD.OverlayUtility.OverlayTypes.Unlock,
		listDatasource = function ()
			DataSources.OptInSuccess_List = DataSourceHelpers.ListSetup( "OptInSuccess_List", function ( f126_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_OK" )
						},
						properties = {
							action = function ( f127_arg0, f127_arg1, f127_arg2, f127_arg3, f127_arg4 )
								LUI.CoDMetrics.AccountCreated( f127_arg0, f127_arg2, "1", "menu" )
								FinishRegistrationFlow( f127_arg0, f127_arg2, f127_arg4 )
							end
							
						}
					}
				}
			end, true, nil )
			return "OptInSuccess_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ()
			return function ( f129_arg0, f129_arg1, f129_arg2, f129_arg3 )
				LUI.CoDMetrics.AccountCreated( f129_arg0, f129_arg2, "1", "menu" )
				FinishRegistrationFlow( f129_arg0, f129_arg2, f129_arg3 )
			end
			
		end
	},
	ConfirmPCGraphicsChange = {
		menuName = "SystemOverlay_Compact",
		title = Engine.Localize( "PLATFORM_CONFIRM_GRAPHICS_CHANGE" ),
		description = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.Settings,
		listDatasource = function ()
			DataSources.ConfirmPCGraphicsChange_List = DataSourceHelpers.ListSetup( "ConfirmPCGraphicsChange_List", function ( f131_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f132_arg0, f132_arg1, f132_arg2, f132_arg3, f132_arg4 )
								CoD.PCUtil.FreeOptionsDirtyModel( f132_arg2 )
								GoBackMultiple( f132_arg4, f132_arg2, 2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f133_arg0, f133_arg1, f133_arg2, f133_arg3, f133_arg4 )
								ApplyPCGraphicsOptions( f133_arg4, f133_arg1, f133_arg2 )
								UpdateGamerprofile( f133_arg4, f133_arg1, f133_arg2 )
								CoD.PCUtil.FreeOptionsDirtyModel( f133_arg2 )
								GoBack( f133_arg4, f133_arg2 )
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
			DataSources.ResetPCGraphics_List = DataSourceHelpers.ListSetup( "ResetPCGraphics_List", function ( f135_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f136_arg0, f136_arg1, f136_arg2, f136_arg3, f136_arg4 )
								GoBack( f136_arg4, f136_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f137_arg0, f137_arg1, f137_arg2, f137_arg3, f137_arg4 )
								ResetPCGraphicsOptions( f137_arg4, f137_arg1, f137_arg2 )
								UpdateGamerprofile( f137_arg4, f137_arg1, f137_arg2 )
								CoD.PCUtil.FreeOptionsDirtyModel( f137_arg2 )
								GoBack( f137_arg4, f137_arg2 )
							end
							
						}
					}
				}
			end, true, nil )
			return "ResetPCGraphics_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	GenericPopup = {
		menuName = function ( f138_arg0, f138_arg1, f138_arg2, f138_arg3, f138_arg4, f138_arg5, f138_arg6 )
			if f138_arg0 == CoD.OverlayUtility.GenericPopupSizes.Small then
				return "SystemOverlay_Compact"
			elseif f138_arg0 == CoD.OverlayUtility.GenericPopupSizes.Large then
				return "SystemOverlay_Full"
			else
				
			end
		end,
		title = function ( f139_arg0, f139_arg1, f139_arg2, f139_arg3, f139_arg4, f139_arg5, f139_arg6 )
			return Engine.Localize( f139_arg1 )
		end,
		description = function ( f140_arg0, f140_arg1, f140_arg2, f140_arg3, f140_arg4, f140_arg5, f140_arg6 )
			return Engine.Localize( f140_arg2 )
		end,
		image = function ( f141_arg0, f141_arg1, f141_arg2, f141_arg3, f141_arg4, f141_arg5, f141_arg6 )
			if f141_arg3 and f141_arg3 ~= "" then
				return f141_arg3
			else
				
			end
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ( f142_arg0, f142_arg1, f142_arg2, f142_arg3, f142_arg4, f142_arg5, f142_arg6 )
			if f142_arg4 then
				local f142_local0 = "GenericPopup_" .. f142_arg1
				DataSources[f142_local0] = DataSourceHelpers.ListSetup( f142_local0 .. "_List", function ( f143_arg0 )
					local f143_local0 = f142_arg5
					if not f143_local0 or type( f143_local0 ) ~= "function" then
						f143_local0 = CoD.OverlayUtility.DefaultButtonAction
					end
					return {
						{
							models = {
								displayText = Engine.Localize( f142_arg4 )
							},
							properties = {
								action = f143_local0
							}
						}
					}
				end, true, nil )
				return f142_local0
			else
				
			end
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ( f144_arg0, f144_arg1, f144_arg2, f144_arg3, f144_arg4, f144_arg5, f144_arg6 )
			if f144_arg6 and type( f144_arg6 ) == "function" then
				return f144_arg6
			else
				return CoD.OverlayUtility.DefaultGoBack()
			end
		end
	},
	GenericModalDialog = {
		menuName = CoD.OverlayUtility.AutoSizeMenuFromDescription( "GenericModalDialog" ),
		title = function ( f145_arg0, f145_arg1, f145_arg2, f145_arg3, f145_arg4 )
			return Engine.Localize( f145_arg0 )
		end,
		description = function ( f146_arg0, f146_arg1, f146_arg2, f146_arg3, f146_arg4 )
			return Engine.Localize( f146_arg1 )
		end,
		image = function ( f147_arg0, f147_arg1, f147_arg2, f147_arg3, f147_arg4 )
			if f147_arg2 and f147_arg2 ~= "" then
				return f147_arg2
			else
				
			end
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ( f148_arg0, f148_arg1, f148_arg2, f148_arg3, f148_arg4 )
			local f148_local0 = "GenericModalDialog" .. f148_arg0
			DataSources[f148_local0] = DataSourceHelpers.ListSetup( f148_local0 .. "_List", function ( f149_arg0 )
				local f149_local0 = {}
				for f149_local4, f149_local5 in ipairs( f148_arg3 ) do
					table.insert( f149_local0, {
						models = {
							displayText = Engine.Localize( f149_local5 )
						},
						properties = {
							action = function ( f150_arg0, f150_arg1, f150_arg2, f150_arg3, f150_arg4 )
								if not f148_arg4 or f148_arg4( f149_local4 - 1 ) then
									GoBack( f150_arg4, f150_arg2 )
								end
							end
						}
					} )
				end
				return f149_local0
			end, true, nil )
			return f148_local0
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ( f151_arg0, f151_arg1, f151_arg2, f151_arg3, f151_arg4 )
			return function ( f152_arg0, f152_arg1, f152_arg2, f152_arg3 )
				if f151_arg4 then
					f151_arg4()
				end
				GoBack( f152_arg3, f152_arg2 )
			end
			
		end
	},
	LobbyLeavePopup = {
		menuName = CoD.OverlayUtility.AutoSizeMenuFromDescription( "LobbyLeavePopup" ),
		title = function ( f153_arg0 )
			local f153_local0 = ""
			if f153_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_PARTY then
				f153_local0 = "MENU_LEAVE_LOBBY_LEAVE_PARTY_TITLE"
			elseif f153_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_AND_DISBAND_PARTY then
				f153_local0 = "MENU_LEAVE_LOBBY_DISBAND_FROM_PARTY_TITLE"
			elseif f153_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY then
				f153_local0 = "MENU_LEAVE_LOBBY_LEAVE_LOBBY_TITLE"
			elseif f153_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY then
				f153_local0 = "MENU_LEAVE_LOBBY_LEAVE_PARTY_TITLE"
			elseif f153_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.BRING_PARTY_LEAVE_ALONE then
				f153_local0 = "MENU_LEAVE_LOBBY_LEAVE_LOBBY_TITLE"
			elseif f153_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.MANAGE_PARTY_LEAVE then
				f153_local0 = "MENU_LEAVE_LOBBY_MANAGE_PARTY_LEAVE_TITLE"
			end
			return Engine.Localize( f153_local0 )
		end,
		description = function ( f154_arg0 )
			local f154_local0 = ""
			if f154_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_PARTY then
				f154_local0 = "MENU_LEAVE_LOBBY_LEAVE_PARTY_HINT"
			elseif f154_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_AND_DISBAND_PARTY then
				f154_local0 = "MENU_LEAVE_LOBBY_DISBAND_FROM_PARTY_HINT"
			elseif f154_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY then
				f154_local0 = "MENU_LEAVE_LOBBY_LEAVE_PARTY_HINT"
			elseif f154_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.MANAGE_PARTY_LEAVE then
				f154_local0 = "MENU_LEAVE_LOBBY_MANAGE_PARTY_LEAVE_HINT"
			end
			return Engine.Localize( f154_local0 )
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Quit,
		listDatasource = function ( f155_arg0 )
			DataSources.LeaveLobbyPopupButtons = DataSourceHelpers.ListSetup( "LeaveLobbyPopupButtons", function ( f156_arg0 )
				local f156_local0 = {
					controller = f156_arg0
				}
				local f156_local1 = function ( f157_arg0, f157_arg1, f157_arg2, f157_arg3, f157_arg4 )
					local f157_local0 = GoBack( f157_arg4, f157_arg2 )
					if f157_arg3 == nil then
						return 
					else
						f157_local0.ClientList:processEvent( {
							name = "lose_focus",
							controller = f157_arg2
						} )
						f156_local0.withParty = f157_arg3
						Engine.LobbyVM_CallFunc( "GoBack", f156_local0 )
					end
				end
				
				local f156_local2 = function ( f158_arg0, f158_arg1, f158_arg2, f158_arg3, f158_arg4 )
					GoBack( f158_arg4, f158_arg2 )
					Engine.LobbyVM_CallFunc( "ManagePartyLeave", f156_local0 )
				end
				
				local f156_local3 = function ( f159_arg0, f159_arg1, f159_arg2, f159_arg3, f159_arg4 )
					table.insert( f159_arg0, {
						optionDisplay = f159_arg2,
						action = f159_arg3,
						param = f159_arg4,
						customId = f159_arg1,
						isLargeButton = true,
						isLastButtonInGroup = false,
						disabled = false
					} )
				end
				
				local f156_local4 = {}
				if f155_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_PARTY then
					f156_local3( f156_local4, "btnWithout", "MENU_LEAVE_LOBBY_LEAVE_PARTY", f156_local1, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
				elseif f155_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_AND_DISBAND_PARTY then
					f156_local3( f156_local4, "btnWithout", "MENU_LEAVE_LOBBY_LEAVE_AND_DISBAND_PARTY", f156_local1, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
				elseif f155_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY then
					f156_local3( f156_local4, "btnWithout", "MENU_LEAVE_LOBBY_LEAVE_LOBBY", f156_local1, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
				elseif f155_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY then
					f156_local3( f156_local4, "btnWithout", "MENU_LEAVE_LOBBY_LEAVE_LOBBY_AND_PARTY", f156_local1, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
				elseif f155_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.BRING_PARTY_LEAVE_ALONE then
					f156_local3( f156_local4, "btnWithout", "MENU_LEAVE_LOBBY_LEAVE_ALONE", f156_local1, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
					f156_local3( f156_local4, "btnWith", "MENU_LEAVE_LOBBY_BRING_PARTY", f156_local1, LuaEnums.LEAVE_WITH_PARTY.WITH )
				elseif f155_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.MANAGE_PARTY_LEAVE then
					f156_local3( f156_local4, "btnWithout", "MENU_CONFIRM_CAPS", f156_local2, nil )
				end
				f156_local3( f156_local4, "btnCancel", "MENU_LEAVE_LOBBY_CANCEL", f156_local1, nil )
				local f156_local5 = {}
				for f156_local9, f156_local10 in ipairs( f156_local4 ) do
					table.insert( f156_local5, {
						models = {
							displayText = Engine.Localize( f156_local10.optionDisplay ),
							customId = f156_local10.customId
						},
						properties = {
							disabled = f156_local10.disabled,
							action = f156_local10.action,
							actionParam = f156_local10.param,
							isLastButtonInGroup = f156_local10.isLastButtonInGroup
						}
					} )
				end
				return f156_local5
			end )
			return "LeaveLobbyPopupButtons"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	LobbyLocalClientWarning = {
		menuName = CoD.OverlayUtility.AutoSizeMenuFromDescription( "LobbyLocalClientWarning" ),
		title = "MENU_DISBAND_PARTY_CAPS",
		description = "MENU_NO_SPLITSCREEN_ALLOWED_DESC",
		image = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.Alert,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		listDatasource = function ( f160_arg0 )
			DataSources.LobbyLocalClientWarningButtons = DataSourceHelpers.ListSetup( "LobbyLocalClientWarningButtons", function ()
				return {
					{
						models = {
							displayText = "MENU_CONTINUE_AND_DISBAND"
						},
						properties = {
							action = function ( f162_arg0, f162_arg1, f162_arg2, f162_arg3, f162_arg4 )
								GoBack( f162_arg4, f162_arg2 )
								f160_arg0.disbandParty = true
								if f160_arg0.navToMenu ~= nil then
									Lobby_SetMaxLocalPlayers( f160_arg0.maxLocalClients )
									Engine.LobbyVM_CallFunc( "GoForward", f160_arg0 )
								else
									for f162_local0 = 1, Engine.GetMaxControllerCount() - 1, 1 do
										LobbyRemoveLocalClientFromLobby( f162_arg0, f162_local0 )
									end
									if f160_arg0.popupName ~= nil and f160_arg0.openFromMenu ~= nil then
										OpenPopup( f160_arg0.openFromMenu, f160_arg0.popupName, 0 )
									elseif f160_arg0.actionFunc ~= nil then
										f160_arg0:actionFunc()
									end
								end
							end
							
						}
					},
					{
						models = {
							displayText = "MENU_CANCEL"
						},
						properties = {
							action = function ( f163_arg0, f163_arg1, f163_arg2, f163_arg3, f163_arg4 )
								if f163_arg4.occludedMenu and f163_arg4.occludedMenu.openOverlayAfterSpinner then
									f163_arg4.occludedMenu.openOverlayAfterSpinner = nil
								end
								GoBack( f163_arg4, f163_arg2 )
							end
							
						}
					}
				}
			end, true, nil )
			return "LobbyLocalClientWarningButtons"
		end
	},
	CPMaxLevelNotification = {
		menuName = "SystemOverlay_Full",
		openMethod = CoD.OverlayUtility.OpenMethods.Overlay,
		frameWidget = "CoD.cpReachedMaxLevelOverlayFrame",
		maxRankName = function ()
			return Engine.Localize( Engine.TableLookup( 0, CoD.rankTable, 0, CoD.MAX_RANK, 5 ) )
		end,
		title = function ()
			return CoD.OverlayUtility.Overlays.CPMaxLevelNotification.maxRankName()
		end,
		description = function ()
			return Engine.Localize( "CPUI_MAX_RANK_MESSAGE", CoD.OverlayUtility.Overlays.CPMaxLevelNotification.maxRankName() )
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Unlock
	}
}
CoD.OverlayUtility.AddSystemOverlay = function ( f167_arg0, f167_arg1 )
	CoD.OverlayUtility.Overlays[f167_arg0] = f167_arg1
end

local f0_local1 = function ( f168_arg0, f168_arg1 )
	return function ()
		ClearMenuSavedState( f168_arg0 )
		if f168_arg0.overlayModelName then
			local f169_local0 = Engine.GetModel( Engine.GetModelForController( f168_arg1 ), f168_arg0.overlayModelName )
			if f169_local0 then
				Engine.UnsubscribeAndFreeModel( f169_local0 )
			end
		end
	end
	
end

local f0_local2 = function ( f170_arg0, f170_arg1, f170_arg2 )
	for f170_local4, f170_local5 in ipairs( CoD.OverlayUtility.OverlayModelFields ) do
		local f170_local3 = nil
		local f170_local6 = Engine.CreateModel( f170_arg0, f170_local5 )
		f170_local3 = f0_local0( f170_arg1[f170_local5], f170_arg2 )
		if not f170_local3 and CoD.OverlayUtility.DefaultModelFields[f170_local5] then
			f170_local3 = f0_local0( CoD.OverlayUtility.DefaultModelFields[f170_local5], {
				f170_arg1,
				f170_arg2
			} )
		end
		if f170_local3 ~= nil then
			Engine.SetModelValue( f170_local6, f170_local3 )
		end
	end
end

local f0_local3 = function ( f171_arg0, f171_arg1, f171_arg2 )
	for f171_local4, f171_local5 in ipairs( CoD.OverlayUtility.OverlayPropertyFields ) do
		local f171_local3 = nil
		f171_local3 = f0_local0( f171_arg1[f171_local5], f171_arg2 )
		if not f171_local3 and CoD.OverlayUtility.DefaultPropertyFields[f171_local5] then
			f171_local3 = f0_local0( CoD.OverlayUtility.DefaultPropertyFields[f171_local5], {
				f171_arg1,
				f171_arg2
			} )
		end
		f171_arg0[f171_local5] = f171_local3
	end
end

local f0_local4 = function ( f172_arg0, f172_arg1 )
	return function ()
		f0_local2( f172_arg0:getModel(), CoD.OverlayUtility.Overlays[f172_arg0.menuName], f172_arg1 )
		f0_local3( f172_arg0, CoD.OverlayUtility.Overlays[f172_arg0.menuName], f172_arg1 )
	end
	
end

CoD.OverlayUtility.CreateOverlay = function ( f174_arg0, f174_arg1, f174_arg2, ... )
	local f174_local0 = nil
	local f174_local1 = {
		n = select( "#", ... ),
		...
	}
	local f174_local2 = function ( f175_arg0, f175_arg1 )
		for f175_local4, f175_local5 in ipairs( CoD.OverlayUtility.OverlayModelFields ) do
			local f175_local3 = nil
			local f175_local6 = Engine.CreateModel( f175_arg0, f175_local5 )
			if type( f175_arg1[f175_local5] ) == "function" then
				f175_local3 = f175_arg1[f175_local5]( unpack( f174_local1 ) )
			else
				f175_local3 = f175_arg1[f175_local5]
			end
			if not f175_local3 and CoD.OverlayUtility.DefaultModelFields[f175_local5] then
				f175_local3 = f0_local0( CoD.OverlayUtility.DefaultModelFields[f175_local5], {
					f175_arg1,
					f174_local1
				} )
			end
			if f175_local3 ~= nil then
				Engine.SetModelValue( f175_local6, f175_local3 )
			end
		end
	end
	
	if CoD.OverlayUtility.Overlays[f174_arg2] then
		local f174_local3 = CoD.OverlayUtility.Overlays[f174_arg2]
		local f174_local4 = f0_local0( f174_local3.menuName, f174_local1 )
		if f174_local4 then
			if CoD.Menu.ModelToUse then
				f0_local2( CoD.Menu.ModelToUse, f174_local3, f174_local1 )
			end
			CoD.Menu.OverwriteMenuName = f174_arg2
			if not f174_local3.openMethod or f174_local3.openMethod == CoD.OverlayUtility.OpenMethods.Popup then
				f174_local0 = OpenPopup( f174_arg1, f174_local4, f174_arg0 )
			elseif f174_local3.openMethod == CoD.OverlayUtility.OpenMethods.Overlay then
				f174_local0 = OpenOverlay( f174_arg1, f174_local4, f174_arg0 )
			end
			CoD.Menu.OverwriteMenuName = nil
			if f174_local0 then
				f174_local0.refreshData = f0_local4( f174_local0, f174_local1 )
				f0_local3( f174_local0, f174_local3, f174_local1 )
				if not f174_local0:getModel() then
					f174_local0.overlayModelName = "Overlay." .. f174_arg2
					local f174_local5 = Engine.CreateModel( Engine.GetModelForController( f174_arg0 ), f174_local0.overlayModelName )
					f0_local2( f174_local5, f174_local3, f174_local1 )
					f174_local0:setModel( f174_local5 )
				end
				LUI.OverrideFunction_CallOriginalFirst( f174_local0, "close", f0_local1( f174_local0, f174_arg0 ) )
				if f174_local3.postCreateStep then
					f174_local3.postCreateStep( f174_local0, f174_arg0 )
				end
				f174_local0:UpdateAllButtonPrompts( f174_arg0 )
			end
		end
	end
	return f174_local0
end

