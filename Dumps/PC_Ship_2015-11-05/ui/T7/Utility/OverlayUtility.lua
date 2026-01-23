require( "lua.Shared.LuaEnums" )

CoD.OverlayUtility = {}
CoD.OverlayUtility.OpenMethods = LuaEnums.createEnum( "Popup", "Overlay" )
CoD.OverlayUtility.OverlayTypes = LuaEnums.createEnum( "GenericMessage", "Connection", "Settings", "Unlock", "Save", "Quit", "Alert", "Error", "Info", "Notice" )
CoD.OverlayUtility.GenericPopupSizes = LuaEnums.createEnum( "Small", "Large" )
CoD.OverlayUtility.LOCAL_FILES_FETCH_WAIT_TIME = 20000
CoD.OverlayUtility.CONNECTINGDW_MAX_WAIT_TIME = 30000
if Engine.GetCurrentPlatform() == "orbis" then
	CoD.OverlayUtility.CONNECTINGDW_MAX_WAIT_TIME = 40000
end
if Engine.GetCurrentPlatform() == "durango" then
	CoD.OverlayUtility.CONNECTINGDW_MAX_WAIT_TIME = 60000
end
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
	"cryptoKeyType.rarity",
	"cost",
	"totalDuplicates",
	"commonDuplicates",
	"rareDuplicates",
	"legendaryDuplicates",
	"epicDuplicates",
	"variantName",
	"weaponName",
	"inputText",
	"backgroundId",
	"xuid",
	"gamertag",
	"clantag",
	"emblemBacking"
}
CoD.OverlayUtility.GoBackPropertyName = "backButtonFn"
CoD.OverlayUtility.ContinuePropertyName = "continueButtonFn"
CoD.OverlayUtility.ProcessActionPropertyName = "actionButtonFn"
CoD.OverlayUtility.ProcessActionKeyboardComplete = "keyboardCompleteFn"
CoD.OverlayUtility.ProcessConfirmVariantName = "confirmVariantNameFn"
CoD.OverlayUtility.OverlayPropertyFields = {
	CoD.OverlayUtility.GoBackPropertyName,
	CoD.OverlayUtility.ContinuePropertyName,
	CoD.OverlayUtility.ProcessActionPropertyName,
	CoD.OverlayUtility.ProcessActionKeyboardComplete,
	CoD.OverlayUtility.ProcessConfirmVariantName
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
		elseif f2_local0 == CoD.OverlayUtility.OverlayTypes.Info or f2_local0 == CoD.OverlayUtility.OverlayTypes.GenericMessage then
			return "t7_icon_info_overlays_bkg"
		elseif f2_local0 == CoD.OverlayUtility.OverlayTypes.Notice then
			return "t7_icon_notice_overlays_bkg"
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
			elseif Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_FREERUN ) then
				return ""
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
								local f27_local0 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
								if IsGameTypeDOA() then
									if not f27_local0 then
										Engine.Exec( f27_arg2, "disconnect" )
									end
								else
									Engine.Exec( f27_arg2, "disconnect" )
								end
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
					if CoD.OverlayUtility.Overlays.MessageDialogBox.getStringRef( f45_arg0 ) == "PLATFORM_PROFILE_CHANGE_MESSAGE" then
						f45_local1 = Engine.Localize( "PLATFORM_PROFILE_CHANGE_CAPS" )
					else
						f45_local1 = Engine.Localize( "MENU_NOTICE" )
					end
				end
			end
			return Engine.ToUpper( f45_local1 )
		end,
		description = function ( f46_arg0 )
			return Engine.Localize( CoD.OverlayUtility.Overlays.MessageDialogBox.getStringRef( f46_arg0 ) )
		end,
		image = function ( f47_arg0 )
			local f47_local0 = CoD.SafeGetModelValue( DataSources.MessageDialog.getModel( f47_arg0 ), "messageImage" )
			if f47_local0 ~= nil and f47_local0 ~= "" then
				return f47_local0
			else
				return nil
			end
		end,
		categoryType = function ( f48_arg0 )
			local modelValue = Engine.GetModelValue( Engine.GetModel( DataSources.MessageDialog.getModel( f48_arg0 ), "messageType" ) )
			local f48_local1 = CoD.OverlayUtility.OverlayTypes.GenericMessage
			if modelValue == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_WARNING then
				f48_local1 = CoD.OverlayUtility.OverlayTypes.Alert
			elseif modelValue == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_ERROR then
				f48_local1 = CoD.OverlayUtility.OverlayTypes.Error
			elseif modelValue == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_INFO then
				f48_local1 = CoD.OverlayUtility.OverlayTypes.Info
			elseif modelValue == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_NOTICE then
				f48_local1 = CoD.OverlayUtility.OverlayTypes.Notice
			end
			return f48_local1
		end,
		listDatasource = function ( f49_arg0 )
			local f49_local0 = "MessageDialogBoxList" .. Engine.GetModelValue( Engine.GetModel( DataSources.MessageDialog.getModel( f49_arg0 ), "messagePending" ) )
			DataSources[f49_local0] = DataSourceHelpers.ListSetup( f49_local0, function ( f50_arg0 )
				if CoD.OverlayUtility.Overlays.MessageDialogBox.getStringRef( f50_arg0 ) == "PLATFORM_PROFILE_CHANGE_MESSAGE" then
					return {
						{
							models = {
								displayText = Engine.Localize( "PLATFORM_CONTINUE_AS_USERNAME", Engine.GetGamertagWhoStolePrimaryController() )
							},
							properties = {
								action = function ( f51_arg0, f51_arg1, f51_arg2, f51_arg3, f51_arg4 )
									LuaUtils.UI_ClearErrorMessageDialog()
									LuaUtils.UI_SetSignedInGamertagModel( Engine.GetGamertagWhoStolePrimaryController() )
									GoBack( f51_arg4, f51_arg2 )
									Engine.Durango_ContinueAs()
									Engine.ComError( Enum.errorCode.ERROR_SOFTRESTART_KEEPDW, "" )
								end
								
							}
						},
						{
							models = {
								displayText = Engine.Localize( "PLATFORM_SWITCH_USER" )
							},
							properties = {
								action = function ( f52_arg0, f52_arg1, f52_arg2, f52_arg3, f52_arg4 )
									Engine.ShowAccountPicker( f52_arg2 )
									LuaUtils.UI_ClearErrorMessageDialog()
									GoBack( f52_arg4, f52_arg2 )
								end
								
							}
						}
					}
				else
					return {
						{
							models = {
								displayText = Engine.Localize( "MENU_OK" )
							},
							properties = {
								action = function ( f53_arg0, f53_arg1, f53_arg2, f53_arg3, f53_arg4 )
									LuaUtils.UI_ClearErrorMessageDialog()
									GoBack( f53_arg4, f53_arg2 )
								end
								
							}
						}
					}
				end
			end, true, nil )
			return f49_local0
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ( f54_arg0 )
			local f54_local0 = CoD.OverlayUtility.Overlays.MessageDialogBox.getStringRef( f54_arg0 )
			if f54_local0 ~= "PLATFORM_PROFILE_CHANGE_MESSAGE" and f54_local0 ~= "PLATFORM_SAVEDATA_CORRUPT" then
				return function ( f55_arg0, f55_arg1, f55_arg2, f55_arg3 )
					LuaUtils.UI_ClearErrorMessageDialog()
					GoBack( f55_arg3, f55_arg2 )
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
			DataSources.DemoSaveClipPopup_List = DataSourceHelpers.ListSetup( "DemoSaveClipPopup_List", function ( f59_arg0 )
				local f59_local0 = {}
				table.insert( f59_local0, {
					models = {
						displayText = Engine.Localize( "MENU_AUTONAME_SEGMENT" )
					},
					properties = {
						action = function ( f60_arg0, f60_arg1, f60_arg2, f60_arg3, f60_arg4 )
							Engine.Exec( f60_arg2, "demo_savesegment 0" )
							GoBack( f60_arg4, f60_arg2 )
						end
					}
				} )
				table.insert( f59_local0, {
					models = {
						displayText = Engine.Localize( "MENU_NAME_SEGMENT" )
					},
					properties = {
						action = function ( f61_arg0, f61_arg1, f61_arg2, f61_arg3, f61_arg4 )
							Engine.Exec( f61_arg2, "demo_keyboard segmentName" )
						end
					}
				} )
				table.insert( f59_local0, {
					models = {
						displayText = Engine.Localize( "MENU_PREVIEW_SEGMENT" )
					},
					properties = {
						action = function ( f62_arg0, f62_arg1, f62_arg2, f62_arg3, f62_arg4 )
							Engine.Exec( f62_arg2, "demo_previewsegment" )
							GoBack( f62_arg4, f62_arg2 )
						end
					}
				} )
				table.insert( f59_local0, {
					models = {
						displayText = Engine.Localize( "MENU_DISCARD_SEGMENT" )
					},
					properties = {
						action = function ( f63_arg0, f63_arg1, f63_arg2, f63_arg3, f63_arg4 )
							Engine.Exec( f63_arg2, "demo_savesegment 1" )
							GoBack( f63_arg4, f63_arg2 )
						end
					}
				} )
				return f59_local0
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
			DataSources.DemoDeleteAllDollyCameraMarkers_List = DataSourceHelpers.ListSetup( "DemoDeleteAllDollyCameraMarkers_List", function ( f67_arg0 )
				local f67_local0 = {}
				table.insert( f67_local0, {
					models = {
						displayText = Engine.Localize( "DEMO_DELETE_ALL" )
					},
					properties = {
						action = function ( f68_arg0, f68_arg1, f68_arg2, f68_arg3, f68_arg4 )
							CoD.DemoUtility.RemoveDollyCamMarker( f68_arg2, -1 )
							CoD.DemoUtility.SetEditingDollyCameraMarker( f68_arg2, false )
							GoBack( f68_arg4, f68_arg2 )
						end
					}
				} )
				table.insert( f67_local0, {
					models = {
						displayText = Engine.Localize( "MENU_CANCEL" )
					},
					properties = {
						action = function ( f69_arg0, f69_arg1, f69_arg2, f69_arg3, f69_arg4 )
							GoBack( f69_arg4, f69_arg2 )
						end
					}
				} )
				return f67_local0
			end, true, nil )
			return "DemoDeleteAllDollyCameraMarkers_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = nil
	},
	DemoDeleteAllLightmanMarkers = {
		menuName = "SystemOverlay_Compact",
		title = function ()
			return Engine.ToUpper( Engine.Localize( "DEMO_DELETE_ALL_LIGHTS" ) )
		end,
		description = function ()
			return Engine.Localize( "DEMO_DELETE_ALL_LIGHTS_HINT" )
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Alert,
		listDatasource = function ()
			DataSources.DemoDeleteAllLightmanMarkers_List = DataSourceHelpers.ListSetup( "DemoDeleteAllLightmanMarkers_List", function ( f73_arg0 )
				local f73_local0 = {}
				table.insert( f73_local0, {
					models = {
						displayText = Engine.Localize( "DEMO_DELETE_ALL" )
					},
					properties = {
						action = function ( f74_arg0, f74_arg1, f74_arg2, f74_arg3, f74_arg4 )
							CoD.DemoUtility.RemoveLightmanMarker( f74_arg2, -1 )
							CoD.DemoUtility.SetEditingLightmanMarker( f74_arg2, false )
							GoBack( f74_arg4, f74_arg2 )
						end
					}
				} )
				table.insert( f73_local0, {
					models = {
						displayText = Engine.Localize( "MENU_CANCEL" )
					},
					properties = {
						action = function ( f75_arg0, f75_arg1, f75_arg2, f75_arg3, f75_arg4 )
							GoBack( f75_arg4, f75_arg2 )
						end
					}
				} )
				return f73_local0
			end, true, nil )
			return "DemoDeleteAllLightmanMarkers_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = nil
	},
	DemoDeleteSegment = {
		menuName = "SystemOverlay_Compact",
		title = function ()
			return Engine.ToUpper( Engine.Localize( "MENU_DELETE_SEGMENT" ) )
		end,
		description = function ()
			return Engine.Localize( "MENU_DELETE_SEGMENT_CONFIRMATION" )
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Alert,
		listDatasource = function ()
			DataSources.DemoDeleteSegment_List = DataSourceHelpers.ListSetup( "DemoDeleteSegment_List", function ( f79_arg0 )
				local f79_local0 = {}
				table.insert( f79_local0, {
					models = {
						displayText = Engine.Localize( "MENU_YES" )
					},
					properties = {
						action = function ( f80_arg0, f80_arg1, f80_arg2, f80_arg3, f80_arg4 )
							Engine.ExecNow( f80_arg2, "demo_deletesegment " .. Engine.GetModelValue( Engine.GetModel( CoD.Timeline_GetHighlightedSegmentModel(), "segmentNumber" ) ) - 1 )
							TimelineEditorRefresh()
							GoBack( f80_arg4, f80_arg2 )
						end
					}
				} )
				table.insert( f79_local0, {
					models = {
						displayText = Engine.Localize( "MENU_CANCEL" )
					},
					properties = {
						action = function ( f81_arg0, f81_arg1, f81_arg2, f81_arg3, f81_arg4 )
							GoBack( f81_arg4, f81_arg2 )
						end
					}
				} )
				return f79_local0
			end, true, nil )
			return "DemoDeleteSegment_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = nil
	},
	DemoDeleteAllSegments = {
		menuName = "SystemOverlay_Compact",
		title = function ()
			return Engine.ToUpper( Engine.Localize( "MENU_DELETE_ALL_SEGMENTS" ) )
		end,
		description = function ()
			return Engine.Localize( "MENU_DELETE_ALL_SEGMENTS_CONFIRMATION" )
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Alert,
		listDatasource = function ()
			DataSources.DemoDeleteAllSegments_List = DataSourceHelpers.ListSetup( "DemoDeleteAllSegments_List", function ( f85_arg0 )
				local f85_local0 = {}
				table.insert( f85_local0, {
					models = {
						displayText = Engine.Localize( "MENU_YES" )
					},
					properties = {
						action = function ( f86_arg0, f86_arg1, f86_arg2, f86_arg3, f86_arg4 )
							Engine.ExecNow( f86_arg2, "demo_deleteclip" )
							TimelineEditorRefresh()
							GoBack( f86_arg4, f86_arg2 )
						end
					}
				} )
				table.insert( f85_local0, {
					models = {
						displayText = Engine.Localize( "MENU_CANCEL" )
					},
					properties = {
						action = function ( f87_arg0, f87_arg1, f87_arg2, f87_arg3, f87_arg4 )
							GoBack( f87_arg4, f87_arg2 )
						end
					}
				} )
				return f85_local0
			end, true, nil )
			return "DemoDeleteAllSegments_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = nil
	},
	DemoMergeAllSegments = {
		menuName = "SystemOverlay_Compact",
		title = function ()
			return Engine.ToUpper( Engine.Localize( "MENU_MERGE_ALL_SEGMENTS" ) )
		end,
		description = function ()
			return Engine.Localize( "MENU_MERGE_ALL_SEGMENTS_CONFIRMATION" )
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Alert,
		listDatasource = function ()
			DataSources.DemoMergeAllSegments_List = DataSourceHelpers.ListSetup( "DemoMergeAllSegments_List", function ( f91_arg0 )
				local f91_local0 = {}
				table.insert( f91_local0, {
					models = {
						displayText = Engine.Localize( "MENU_YES" )
					},
					properties = {
						action = function ( f92_arg0, f92_arg1, f92_arg2, f92_arg3, f92_arg4 )
							Engine.ExecNow( f92_arg2, "demo_mergesegments" )
							TimelineEditorRefresh()
							GoBack( f92_arg4, f92_arg2 )
						end
					}
				} )
				table.insert( f91_local0, {
					models = {
						displayText = Engine.Localize( "MENU_CANCEL" )
					},
					properties = {
						action = function ( f93_arg0, f93_arg1, f93_arg2, f93_arg3, f93_arg4 )
							GoBack( f93_arg4, f93_arg2 )
						end
					}
				} )
				return f91_local0
			end, true, nil )
			return "DemoMergeAllSegments_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = nil
	},
	EndDemoPopup = {
		menuName = "SystemOverlay_Compact",
		title = function ()
			local f94_local0 = nil
			local f94_local1 = Engine.IsDemoClipPlaying()
			local f94_local2 = Engine.GameHost()
			if not f94_local1 then
				if f94_local2 then
					f94_local0 = Engine.Localize( "MPUI_LEAVE_FILM" )
				else
					f94_local0 = Engine.Localize( "MPUI_END_FILM" )
				end
			elseif f94_local2 then
				f94_local0 = Engine.Localize( "MPUI_LEAVE_CLIP" )
			else
				f94_local0 = Engine.Localize( "MPUI_END_CLIP" )
			end
			return Engine.ToUpper( f94_local0 )
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
			DataSources.EndDemoPopup_List = DataSourceHelpers.ListSetup( "EndDemoPopup_List", function ( f97_arg0 )
				local f97_local0 = {}
				local f97_local1 = Engine.IsClipModified()
				local f97_local2 = function ()
					if not Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
						Engine.GameModeResetModes()
						Engine.SessionModeResetModes()
						Engine.Exec( f97_arg0, "disconnect" )
					else
						Engine.Exec( f97_arg0, "xpartystopdemo" )
					end
				end
				
				if not f97_local1 then
					table.insert( f97_local0, {
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f99_arg0, f99_arg1, f99_arg2, f99_arg3, f99_arg4 )
								GoBack( f99_arg4, f99_arg2 )
								f97_local2( f99_arg2 )
							end
						}
					} )
					table.insert( f97_local0, {
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f100_arg0, f100_arg1, f100_arg2, f100_arg3, f100_arg4 )
								GoBack( f100_arg4, f100_arg2 )
							end,
							selectIndex = true
						}
					} )
				else
					table.insert( f97_local0, {
						models = {
							displayText = Engine.Localize( "MENU_SAVE_CLIP" )
						},
						properties = {
							action = function ( f101_arg0, f101_arg1, f101_arg2, f101_arg3, f101_arg4 )
								GoBack( f101_arg4, f101_arg2 )
							end,
							disabled = true
						}
					} )
					table.insert( f97_local0, {
						models = {
							displayText = Engine.Localize( "MENU_END_FILM_WITHOUT_SAVING" )
						},
						properties = {
							action = function ( f102_arg0, f102_arg1, f102_arg2, f102_arg3, f102_arg4 )
								GoBack( f102_arg4, f102_arg2 )
								f97_local2( f102_arg2 )
							end
						}
					} )
					table.insert( f97_local0, {
						models = {
							displayText = Engine.Localize( "MENU_CANCEL" )
						},
						properties = {
							action = function ( f103_arg0, f103_arg1, f103_arg2, f103_arg3, f103_arg4 )
								GoBack( f103_arg4, f103_arg2 )
							end
						}
					} )
				end
				return f97_local0
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
		postCreateStep = function ( f104_arg0, f104_arg1 )
			f104_arg0.anyControllerAllowed = true
		end,
		title = "MENU_NOTICE",
		description = "MENU_UPDATE_NEEDED",
		categoryType = CoD.OverlayUtility.OverlayTypes.Connection,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		listDatasource = function ( f105_arg0 )
			DataSources.UpdateNeededPopupList = DataSourceHelpers.ListSetup( "UpdateNeededPopupList", function ( f106_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_OK" )
						},
						properties = {
							action = function ( f107_arg0, f107_arg1, f107_arg2, f107_arg3, f107_arg4 )
								CoD.LobbyBase.FailedDWConnection = true
								GoBack( f107_arg4, f107_arg2 )
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
		postCreateStep = function ( f108_arg0, f108_arg1 )
			f108_arg0.unusedControllerAllowed = true
			local f108_local0 = 0
			if f108_arg0.layout and f108_arg0.layout.frameWidget and f108_arg0.layout.frameWidget.framedWidget then
				f108_arg0.layout.frameWidget.framedWidget:playClip( "LoadingLoop" )
			end
			f108_arg0:addElement( LUI.UITimer.newElementTimer( 400, false, function ( f109_arg0 )
				if Engine.AreLocalFilesReady( f108_arg1 ) == true then
					GoBack( f108_arg0, f108_arg1 )
					return 
				elseif f108_local0 > CoD.OverlayUtility.LOCAL_FILES_FETCH_WAIT_TIME then
					GoBack( f108_arg0, f108_arg1 )
					return 
				else
					f108_local0 = f108_local0 + f109_arg0.timeElapsed
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
		postCreateStep = function ( f110_arg0, f110_arg1 )
			f110_arg0.unusedControllerAllowed = true
			local f110_local0 = 0
			if f110_arg0.layout and f110_arg0.layout.frameWidget and f110_arg0.layout.frameWidget.framedWidget then
				f110_arg0.layout.frameWidget.framedWidget:playClip( "LoadingLoop" )
			end
			Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.beginPlay" ), Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_INVALID )
			f110_arg0:addElement( LUI.UITimer.newElementTimer( 400, false, function ( f111_arg0 )
				if Engine.IsDemonwareFetchingDone( f110_arg1 ) then
					CoD.LobbyBase.FailedDWConnection = false
					local f111_local0 = LobbyData.GetLobbyNav()
					if f111_local0 == LobbyData.UITargets.UI_MODESELECT.id then
						Engine.LobbyVM_CallFunc( "NetworkModeChanged", {
							controller = f110_arg1,
							networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
						} )
					elseif f111_local0 == LobbyData.UITargets.UI_MAIN.id then
						Engine.SetLobbyNetworkMode( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
					end
					GoBack( f110_arg0, f110_arg1 )
					if f111_local0 == LobbyData.UITargets.UI_MAIN.id and Dvar.lobby_beginPlay:exists() then
						Dvar.lobby_beginPlay:set( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
					end
					return 
				end
				local f111_local0 = Engine.CheckNetConnection()
				if Engine.IsLPCBusy() then
					local f111_local1 = Engine.GetLPCCompletionPercentage()
					if f111_local1 == 0 or f111_local1 == 100 then
						CoD.OverlayUtility.Overlays[f110_arg0.menuName].description = Engine.Localize( "MENU_CHECKING_FILES" )
					else
						CoD.OverlayUtility.Overlays[f110_arg0.menuName].description = Engine.Localize( "MENU_DOWNLOAD_IN_PROGRESS" ) .. "\n" .. f111_local1 .. "%"
					end
					f110_arg0:refreshData( nil )
				elseif f110_local0 > CoD.OverlayUtility.CONNECTINGDW_MAX_WAIT_TIME or f111_local0 == false then
					local f111_local1 = GoBack( f110_arg0, f110_arg1 )
					local f111_local2 = ""
					if f111_local0 == false then
						f111_local2 = "XBOXLIVE_NETCONNECTION"
					else
						local f111_local3, f111_local4 = Engine.GetSystemInfo( f110_arg1, CoD.SYSINFO_CONNECTIVITY_INFO )
						f111_local2 = Engine.Localize( "PLATFORM_DEMONWARE_DISCONNECT" ) .. "\n\n" .. Engine.Localize( "MENU_ERROR_CODE", f111_local3 )
						if Engine.IsShipBuild() == false then
							f111_local2 = f111_local2 .. "\n\n\tDEBUG INFO:\n" .. f111_local4
						end
					end
					CoD.LobbyBase.FailedDWConnection = true
					LuaUtils.UI_ShowErrorMessageDialog( f110_arg1, f111_local2, "MENU_NOTICE_CAPS" )
				end
				f110_local0 = f110_local0 + f111_arg0.timeElapsed
			end ) )
		end,
		title = "MENU_CONNECTING_DW",
		description = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.Connection,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	LobbyPlayNetworkModePopup = {
		menuName = CoD.OverlayUtility.AutoSizeMenuFromDescription( "LobbyPlayNetworkModePopup" ),
		title = function ( f112_arg0 )
			local f112_local0 = ""
			if f112_arg0 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
				f112_local0 = "PLATFORM_XBOX_LIVE_CAPS"
			elseif f112_arg0 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
				f112_local0 = "MENU_PLAY_LOCAL_CAPS"
			end
			return Engine.Localize( f112_local0 )
		end,
		description = function ( f113_arg0 )
			local f113_local0 = ""
			if f113_arg0 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
				if Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 1 then
					f113_local0 = "XBOXLIVE_PLAY_ONLINE_AND_DISBAND_DESC"
				else
					f113_local0 = "XBOXLIVE_PLAY_ONLINE_DESC"
				end
			elseif f113_arg0 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
				if Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 1 then
					f113_local0 = "XBOXLIVE_DISBAND_AND_PLAY_LOCAL_DESC"
				else
					f113_local0 = "XBOXLIVE_PLAY_LOCAL_DESC"
				end
			end
			return Engine.Localize( f113_local0 )
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Connection,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		listDatasource = function ( f114_arg0 )
			DataSources.LobbyPlayNetworkModePopupButtons = DataSourceHelpers.ListSetup( "LobbyPlayNetworkModePopupButtons", function ( f115_arg0 )
				local f115_local0 = ""
				if f114_arg0 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
					f115_local0 = "XBOXLIVE_PLAY_ONLINE"
				elseif f114_arg0 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
					f115_local0 = "MENU_PLAY_LOCAL"
				end
				return {
					{
						models = {
							displayText = Engine.Localize( f115_local0 )
						},
						properties = {
							action = function ( f116_arg0, f116_arg1, f116_arg2, f116_arg3, f116_arg4 )
								LobbyToggleNetwork( f116_arg0, f116_arg1, f116_arg2, f116_arg3 )
								GoBack( f116_arg4, f116_arg2 )
							end
							,
							actionParam = f114_arg0
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_CANCEL" )
						},
						properties = {
							action = function ( f117_arg0, f117_arg1, f117_arg2, f117_arg3, f117_arg4 )
								GoBack( f117_arg4, f117_arg2 )
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
			DataSources.FreerunEndGameButtons = DataSourceHelpers.ListSetup( "FreerunEndGameButtons", function ( f119_arg0 )
				return {
					{
						models = {
							displayText = "MENU_FR_RESTART_COURSE"
						},
						properties = {
							action = function ( f120_arg0, f120_arg1, f120_arg2, f120_arg3, f120_arg4 )
								GoBack( f120_arg0, f120_arg2 )
								Engine.LockInput( f120_arg2, false )
								Engine.SendMenuResponse( f120_arg2, "freerun_endgame_popup", "fr_restart" )
							end
							
						}
					},
					{
						models = {
							displayText = "MENU_QUIT_GAME_CAPS"
						},
						properties = {
							action = function ( f121_arg0, f121_arg1, f121_arg2, f121_arg3, f121_arg4 )
								GoBack( f121_arg0, f121_arg2 )
								CoD.QuitGame( f121_arg2 )
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
		title = function ( f122_arg0, f122_arg1 )
			return "MENU_ATTACHMENT_RESTRICTION_OPTIONS"
		end,
		description = function ( f123_arg0, f123_arg1 )
			return ""
		end,
		image = function ( f124_arg0, f124_arg1 )
			local f124_local0 = f124_arg1:getModel()
			if f124_local0 then
				return Engine.GetModelValue( Engine.GetModel( f124_local0, "image" ) )
			else
				return ""
			end
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		openMethod = CoD.OverlayUtility.OpenMethods.Overlay,
		frameWidget = "CoD.GameSettings_AttachmentOptionsPopup",
		[CoD.OverlayUtility.GoBackPropertyName] = function ()
			return function ( f126_arg0, f126_arg1, f126_arg2, f126_arg3 )
				Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings.Update" ) )
				GoBack( f126_arg0, f126_arg2 )
			end
			
		end,
		listDatasource = function ( f127_arg0, f127_arg1 )
			DataSources.CompetitiveSettingsAttachment = DataSourceHelpers.ListSetup( "CompetitiveSettingsAttachment", function ()
				local f128_local0 = f127_arg1:getModel()
				local f128_local1 = Engine.GetModelValue( Engine.GetModel( f128_local0, "attachmentIndex" ) )
				local f128_local2 = Engine.GetModelValue( Engine.GetModel( f128_local0, "title" ) )
				local f128_local3 = Engine.GetModelValue( Engine.GetModel( f128_local0, "description" ) )
				local f128_local4 = Engine.GetModelValue( Engine.GetModel( f128_local0, "image" ) )
				local f128_local5 = {}
				table.insert( f128_local5, CoD.OptionsUtility.CreateItemRestrictionSettings( f127_arg0, f128_local2, "", "Attachment_" .. f128_local2, CoD.GameSettingsUtility.GetGroupRestrictionOptions(), f128_local4, CoD.OptionsUtility.GametypeSettingsSetAttachmentRestrictionState, {
					attachmentIndex = f128_local1
				}, function ( f129_arg0 )
					if Engine.AttachmentRestrictionStateChangedForAnyWeapon( f129_arg0.attachmentIndex ) == true then
						return -1
					else
						return Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_NONE
					end
				end ) )
				return f128_local5
			end, nil, nil, function ( f130_arg0, f130_arg1, f130_arg2 )
				local f130_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" ), "Update" )
				if f130_arg1.updateSubscription then
					f130_arg1:removeSubscription( f130_arg1.updateSubscription )
				end
				f130_arg1.updateSubscription = f130_arg1:subscribeToModel( f130_local0, function ()
					f130_arg1:updateDataSource( false )
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
		listDatasource = function ()
			DataSources.LoginQueue_List = DataSourceHelpers.ListSetup( "LoginQueue_List", function ( f133_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_PLAY_LOCAL" )
						},
						properties = {
							action = function ( f134_arg0, f134_arg1, f134_arg2, f134_arg3, f134_arg4 )
								Engine.LeaveQueue( f134_arg2 )
								CoD.LobbyBase.FailedDWConnection = true
								GoBack( f134_arg4, f134_arg2 )
							end
							
						}
					}
				}
			end, true, nil )
			return "LoginQueue_List"
		end,
		postCreateStep = function ( f135_arg0, f135_arg1 )
			local f135_local0 = 0
			if f135_arg0.layout and f135_arg0.layout.frameWidget and f135_arg0.layout.frameWidget.framedWidget then
				f135_arg0.layout.frameWidget.framedWidget:playClip( "LoadingLoop" )
			end
			f135_arg0:addElement( LUI.UITimer.newElementTimer( 400, false, function ( f136_arg0 )
				local f136_local0 = Engine.GetPlayerQueueInfo( f135_arg1 )
				if Engine.IsPlayerQueued( f135_arg1 ) then
					if f136_local0 ~= nil then
						local f136_local1 = f136_local0.position
						local f136_local2 = f136_local0.eta
						if f136_local1 > 0 and f136_local2 > 0 then
							local f136_local3 = math.floor( f136_local2 / 60 )
							local f136_local4 = f136_local2 % 60
							local f136_local5 = math.floor( f136_local3 / 60 )
							local f136_local6 = f136_local3 % 60
							local f136_local7 = math.floor( f135_local0 / 1000 / 60 )
							CoD.OverlayUtility.Overlays[f135_arg0.menuName].description = Engine.Localize( "MENU_LOGIN_QUEUE", f136_local1, f136_local5, f136_local6, f136_local4, math.floor( f136_local7 / 60 ), f136_local7 % 60, math.floor( f135_local0 / 1000 ) % 60 )
							f135_arg0:refreshData( nil )
						end
					end
				elseif f136_local0 == nil or not f136_local0.success then
					local f136_local1 = "PLATFORM_DEMONWARE_DISCONNECT"
					local f136_local2 = GoBack( f135_arg0, f135_arg1 )
					LuaUtils.UI_ShowErrorMessageDialog( f135_arg1, f136_local1, "MENU_NOTICE_CAPS" )
					CoD.LobbyBase.FailedDWConnection = true
					Engine.LeaveQueue( f135_arg1 )
				else
					CoD.OverlayUtility.CreateOverlay( f135_arg1, GoBack( f135_arg0, f135_arg1 ), "ConnectingToDemonware" )
				end
				f135_local0 = f135_local0 + f136_arg0.timeElapsed
			end ) )
		end
	},
	PaintjobClearConfirmationOverlay = {
		menuName = "SystemOverlay_Compact",
		title = "MENU_PAINTJOB_DELETE_CONFIRMATION",
		description = "MENU_CANNOT_UNDO",
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ()
			DataSources.PaintjobClearConfirmation_List = DataSourceHelpers.ListSetup( "PaintjobClearConfirmation_List", function ( f138_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f139_arg0, f139_arg1, f139_arg2, f139_arg3, f139_arg4 )
								PaintjobSelector_ClearPaintjob( f139_arg4, f139_arg1, f139_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f140_arg0, f140_arg1, f140_arg2, f140_arg3, f140_arg4 )
								GoBack( f140_arg4, f140_arg2 )
							end
							,
							selectIndex = true
						}
					}
				}
			end, true, nil )
			return "PaintjobClearConfirmation_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	GunsmithClearConfirmationOverlay = {
		menuName = "SystemOverlay_Compact",
		title = "MENU_GUNSMITH_DELETE_CONFIRMATION",
		description = "MENU_CANNOT_UNDO",
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ()
			DataSources.GunsmithClearConfirmation_List = DataSourceHelpers.ListSetup( "GunsmithClearConfirmation_List", function ( f142_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f143_arg0, f143_arg1, f143_arg2, f143_arg3, f143_arg4 )
								Gunsmith_ClearVariant( f143_arg4, f143_arg1, f143_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f144_arg0, f144_arg1, f144_arg2, f144_arg3, f144_arg4 )
								GoBack( f144_arg4, f144_arg2 )
							end
							,
							selectIndex = true
						}
					}
				}
			end, true, nil )
			return "GunsmithClearConfirmation_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	EmblemClearConfirmationOverlay = {
		menuName = "SystemOverlay_Compact",
		title = "MENU_EMBLEM_DELETE_CONFIRMATION",
		description = "MENU_CANNOT_UNDO",
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ()
			DataSources.EmblemClearConfirmation_List = DataSourceHelpers.ListSetup( "EmblemClearConfirmation_List", function ( f146_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f147_arg0, f147_arg1, f147_arg2, f147_arg3, f147_arg4 )
								EmblemSelect_ClearEmblem( f147_arg4, f147_arg1, f147_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f148_arg0, f148_arg1, f148_arg2, f148_arg3, f148_arg4 )
								GoBack( f148_arg4, f148_arg2 )
							end
							,
							selectIndex = true
						}
					}
				}
			end, true, nil )
			return "EmblemClearConfirmation_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	GunsmithSaveVariant = {
		menuName = "SystemOverlay_Full",
		frameWidget = "CoD.systemOverlay_SaveVariantFrame",
		title = Engine.Localize( "MENU_GUNSMITH_SAVE_CHANGES_TITLE" ),
		description = function ( f149_arg0, f149_arg1 )
			return Engine.Localize( LocalizeWeaponNameIntoString( "MENU_GUNSMITH_SAVE_CHANGES_SUBTITLE", f149_arg0, CoD.GetCustomization( f149_arg0, "weapon_index" ) ) )
		end,
		image = function ( f150_arg0, f150_arg1 )
			local f150_local0 = f150_arg1:getModel()
			if f150_local0 then
				local f150_local1 = Engine.GetModel( f150_local0, "variantIndex" )
				if f150_local1 then
					return Engine.GetModelValue( f150_local1 )
				end
			end
			return ""
		end,
		variantName = function ( f151_arg0, f151_arg1 )
			local f151_local0 = f151_arg1:getModel()
			if f151_local0 then
				local f151_local1 = Engine.GetModel( f151_local0, "variantName" )
				if f151_local1 then
					return Engine.GetModelValue( f151_local1 )
				end
			end
			return ""
		end,
		weaponName = function ( f152_arg0, f152_arg1 )
			local f152_local0 = f152_arg1:getModel()
			if f152_local0 then
				local f152_local1 = Engine.GetModel( f152_local0, "weaponIndex" )
				if f152_local1 then
					local f152_local2 = Engine.GetModelValue( f152_local1 )
					if Engine.GetItemName( f152_local2 ) then
						return Engine.ToUpper( Engine.Localize( Engine.GetItemName( f152_local2 ) ) )
					end
				end
			end
			return ""
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Save,
		listDatasource = function ( f153_arg0, f153_arg1 )
			DataSources.GunsmithSaveVariant_List = DataSourceHelpers.ListSetup( "GunsmithSaveVariant_List", function ( f154_arg0 )
				return {
					{
						models = {
							displayText = LocalizeToUpperString( "MENU_SAVE" )
						},
						properties = {
							action = function ( f155_arg0, f155_arg1, f155_arg2, f155_arg3, f155_arg4 )
								if Gunsmith_IsCurrentVariantChanged( f155_arg2 ) then
									Gunsmith_ClearSelectedGunsmithVariantStats( f155_arg2 )
									Gunsmith_ClearCACWithUpdatedVariant( f155_arg4, f155_arg2 )
								end
								Gunsmith_SaveChangesButtonAction( f155_arg4, f155_arg1, "save", f155_arg2 )
								ForceNotifyModel( f155_arg2, "Gunsmith.UpdateDataSource" )
							end
							
						}
					},
					{
						models = {
							displayText = LocalizeToUpperString( "MENU_DISCARD" )
						},
						properties = {
							action = function ( f156_arg0, f156_arg1, f156_arg2, f156_arg3, f156_arg4 )
								Gunsmith_SaveChangesButtonAction( f156_arg0, f156_arg1, "discard", f156_arg2 )
							end
							
						}
					}
				}
			end, true, nil )
			return "GunsmithSaveVariant_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	EmblemSave = {
		menuName = "SystemOverlay_Full",
		frameWidget = "CoD.systemOverlay_SaveEmblemFrame",
		title = Engine.Localize( "MENU_SAVE_EMBLEM" ),
		description = Engine.Localize( "MENU_SAVE_EMBLEM_DESC" ),
		categoryType = CoD.OverlayUtility.OverlayTypes.Save,
		postCreateStep = function ( f157_arg0, f157_arg1 )
			PaintjobEditor_RemoveGrid( f157_arg1 )
		end,
		inputText = function ( f158_arg0 )
			if f158_arg0 then
				return Engine.GetModelValue( Engine.GetModel( f158_arg0, "emblemTextEntry" ) )
			else
				
			end
		end,
		listDatasource = function ( f159_arg0 )
			DataSources.EmblemSave_List = DataSourceHelpers.ListSetup( "EmblemSave_List", function ( f160_arg0 )
				local f160_local0 = nil
				if IsPreBuiltEmblemTab( f160_arg0 ) then
					f160_local0 = LocalizeToUpperString( "MENU_EMBLEM_SAVE_AS_NEW" )
				else
					f160_local0 = LocalizeToUpperString( "MENU_EMBLEM_SAVE_CHANGES" )
				end
				return {
					{
						models = {
							displayText = f160_local0
						},
						properties = {
							action = function ( f161_arg0, f161_arg1, f161_arg2, f161_arg3, f161_arg4 )
								EmblemEditor_SaveEmblem( f161_arg4, f161_arg1, f161_arg2, f159_arg0 )
								ForceNotifyModel( f161_arg2, "Emblem.UpdateDataSource" )
							end
							
						}
					},
					{
						models = {
							displayText = LocalizeToUpperString( "MENU_EMBLEMS_DISCARD" )
						},
						properties = {
							action = function ( f162_arg0, f162_arg1, f162_arg2, f162_arg3, f162_arg4 )
								EmblemEditor_DiscardChanges( f162_arg4, f162_arg1, f162_arg2, f159_arg0 )
							end
							
						}
					}
				}
			end, true, nil )
			return "EmblemSave_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ( f163_arg0 )
			return function ( f164_arg0, f164_arg1, f164_arg2, f164_arg3 )
				GoBack( f164_arg3, f164_arg2 )
				PaintjobEditor_RestoreGridState( f164_arg2 )
			end
			
		end,
		[CoD.OverlayUtility.ProcessActionKeyboardComplete] = function ( f165_arg0 )
			return function ( f166_arg0, f166_arg1, f166_arg2, f166_arg3 )
				ShowKeyboard( f166_arg0, f166_arg1, f166_arg2, "KEYBOARD_TYPE_EMBLEMS" )
			end
			
		end
	},
	PaintjobSave = {
		menuName = "SystemOverlay_Full",
		frameWidget = "CoD.systemOverlay_SavePaintjobFrame",
		title = Engine.Localize( "MENU_SAVE_PAINTJOB" ),
		description = Engine.Localize( "MENU_SAVE_PAINTJOB_DESC" ),
		categoryType = CoD.OverlayUtility.OverlayTypes.Save,
		inputText = function ( f167_arg0 )
			if f167_arg0 then
				return Engine.GetModelValue( Engine.GetModel( f167_arg0, "paintjobTextEntry" ) )
			else
				
			end
		end,
		listDatasource = function ( f168_arg0 )
			DataSources.PaintjobSave_List = DataSourceHelpers.ListSetup( "PaintjobSave_List", function ( f169_arg0 )
				return {
					{
						models = {
							displayText = LocalizeToUpperString( "MENU_EMBLEM_SAVE_CHANGES" )
						},
						properties = {
							action = function ( f170_arg0, f170_arg1, f170_arg2, f170_arg3, f170_arg4 )
								PaintjobEditor_SavePaintjob( f170_arg0, f170_arg1, f170_arg2, f168_arg0 )
								ForceNotifyModel( f170_arg2, "Paintshop.UpdateDataSource" )
							end
							
						}
					},
					{
						models = {
							displayText = LocalizeToUpperString( "MENU_EMBLEMS_DISCARD" )
						},
						properties = {
							action = function ( f171_arg0, f171_arg1, f171_arg2, f171_arg3, f171_arg4 )
								PaintjobEditor_DiscardChanges( f171_arg4, f171_arg1, f171_arg2, f168_arg0 )
							end
							
						}
					}
				}
			end, true, nil )
			return "PaintjobSave_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		[CoD.OverlayUtility.ProcessActionKeyboardComplete] = function ( f172_arg0 )
			return function ( f173_arg0, f173_arg1, f173_arg2, f173_arg3 )
				ShowKeyboard( f173_arg0, f173_arg1, f173_arg2, "KEYBOARD_TYPE_PAINTJOB" )
			end
			
		end
	},
	GunsmithCreateVariantNameOverlay = {
		menuName = "SystemOverlay_Full",
		frameWidget = "CoD.systemOverlay_CreateVariantNameFrame",
		categoryType = CoD.OverlayUtility.OverlayTypes.Save,
		title = function ( f174_arg0, f174_arg1 )
			return Engine.Localize( LocalizeWeaponNameIntoString( "MENU_GUNSMITH_CREATE_VARIANT_NAME_TITLE", f174_arg0, CoD.GetCustomization( f174_arg0, "weapon_index" ) ) )
		end,
		description = "",
		inputText = function ( f175_arg0, f175_arg1 )
			local f175_local0 = f175_arg1:getModel()
			if f175_local0 then
				return Engine.GetModelValue( Engine.GetModel( f175_local0, "variantTextEntry" ) )
			else
				
			end
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ( f176_arg0, f176_arg1 )
			return function ( f177_arg0, f177_arg1, f177_arg2, f177_arg3 )
				Gunsmith_CreateVariantNameBack( f176_arg1, f177_arg1, f177_arg2 )
				GoBack( f177_arg3, f177_arg2 )
				ClearMenuSavedState( f177_arg3 )
			end
			
		end,
		[CoD.OverlayUtility.ProcessActionKeyboardComplete] = function ()
			return function ( f179_arg0, f179_arg1, f179_arg2, f179_arg3 )
				ShowKeyboard( f179_arg0, f179_arg1, f179_arg2, "KEYBOARD_TYPE_GUNSMITH" )
			end
			
		end,
		[CoD.OverlayUtility.ProcessConfirmVariantName] = function ( f180_arg0, f180_arg1 )
			return function ( f181_arg0, f181_arg1, f181_arg2, f181_arg3 )
				Gunsmith_ConfirmVariantName( f180_arg1, f181_arg1, f181_arg2, f181_arg3 )
			end
			
		end
	},
	CraftNoChangesNotification = {
		menuName = "SystemOverlay_Compact",
		title = "MENU_EMBLEM_NO_CHANGES_TITLE",
		description = "MENU_EMBLEM_NO_CHANGES_DESC",
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ()
			DataSources.CraftNoChangesNotification = DataSourceHelpers.ListSetup( "CraftNoChangesNotification", function ( f183_arg0 )
				return {
					{
						models = {
							displayText = "MENU_OK_CAPS"
						},
						properties = {
							action = function ( f184_arg0, f184_arg1, f184_arg2, f184_arg3, f184_arg4 )
								EmblemEditor_NoChangesAction( f184_arg0, f184_arg1, f184_arg2, f184_arg4 )
							end
							
						}
					}
				}
			end, true, nil )
			return "CraftNoChangesNotification"
		end
	},
	CampaignOfflineToOnlineWarning = {
		menuName = "SystemOverlay_Compact",
		title = "MENU_WARNING_CAMPAIGN_OFFLINE_TO_ONLINE",
		description = "MENU_WARNING_CAMPAIGN_OFFLINE_TO_ONLINE2",
		categoryType = CoD.OverlayUtility.OverlayTypes.Connection,
		listDatasource = function ()
			DataSources.CampaignOfflineToOnlineWarning = DataSourceHelpers.ListSetup( "CampaignOfflineToOnlineWarning", function ( f186_arg0 )
				return {
					{
						models = {
							displayText = "MENU_OK_CAPS"
						},
						properties = {
							action = function ( f187_arg0, f187_arg1, f187_arg2, f187_arg3, f187_arg4 )
								GoBack( f187_arg4, f187_arg2 )
							end
							
						}
					}
				}
			end, true, nil )
			return "CampaignOfflineToOnlineWarning"
		end
	},
	PublisherFilesChangedPopup = {
		menuName = "SystemOverlay_Compact",
		title = "MENU_REFETCH_WAD_CONFIRMATION_TITLE",
		description = "MENU_REFETCH_WAD_CONFIRMATION_MESSAGE",
		categoryType = CoD.OverlayUtility.OverlayTypes.Connection,
		listDatasource = function ()
			DataSources.PublisherFilesChangedButtons = DataSourceHelpers.ListSetup( "PublisherFilesChangedButtons", function ( f189_arg0 )
				return {
					{
						models = {
							displayText = "MENU_CONFIRM_CAPS"
						},
						properties = {
							action = function ( f190_arg0, f190_arg1, f190_arg2, f190_arg3, f190_arg4 )
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
			DataSources.ResetPCControls_List = DataSourceHelpers.ListSetup( "ResetPCControls_List", function ( f192_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f193_arg0, f193_arg1, f193_arg2, f193_arg3, f193_arg4 )
								GoBack( f193_arg4, f193_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f194_arg0, f194_arg1, f194_arg2, f194_arg3, f194_arg4 )
								ResetPCControlsToDefault( f194_arg4, f194_arg1, f194_arg2 )
								GoBack( f194_arg4, f194_arg2 )
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
			DataSources.ApplyPCGraphics_List = DataSourceHelpers.ListSetup( "ApplyPCGraphics_List", function ( f196_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f197_arg0, f197_arg1, f197_arg2, f197_arg3, f197_arg4 )
								CoD.PCUtil.FreeOptionsDirtyModel( f197_arg2 )
								GoBack( f197_arg4, f197_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f198_arg0, f198_arg1, f198_arg2, f198_arg3, f198_arg4 )
								ApplyPCGraphicsOptions( f198_arg4, f198_arg1, f198_arg2 )
								UpdateGamerprofile( f198_arg4, f198_arg1, f198_arg2 )
								CoD.PCUtil.FreeOptionsDirtyModel( f198_arg2 )
								GoBack( f198_arg4, f198_arg2 )
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
			DataSources.RegistrationSuccess_List = DataSourceHelpers.ListSetup( "RegistrationSuccess_List", function ( f200_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_OK" )
						},
						properties = {
							action = function ( f201_arg0, f201_arg1, f201_arg2, f201_arg3, f201_arg4 )
								LUI.CoDMetrics.AccountCreated( f201_arg0, f201_arg2, "1", "menu" )
								FinishRegistrationFlow( f201_arg0, f201_arg2, f201_arg4 )
							end
							
						}
					}
				}
			end, true, nil )
			return "RegistrationSuccess_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ()
			return function ( f203_arg0, f203_arg1, f203_arg2, f203_arg3 )
				LUI.CoDMetrics.AccountCreated( f203_arg0, f203_arg2, "1", "menu" )
				FinishRegistrationFlow( f203_arg0, f203_arg2, f203_arg3 )
			end
			
		end
	},
	OptInSuccess = {
		menuName = "SystemOverlay_MessageDialog",
		title = Engine.Localize( "MENU_REGISTRATION_SUCCESS_TITLE" ),
		description = Engine.Localize( "MENU_REGISTRATION_OPTIN_SUCCESS" ),
		categoryType = CoD.OverlayUtility.OverlayTypes.Unlock,
		listDatasource = function ()
			DataSources.OptInSuccess_List = DataSourceHelpers.ListSetup( "OptInSuccess_List", function ( f205_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_OK" )
						},
						properties = {
							action = function ( f206_arg0, f206_arg1, f206_arg2, f206_arg3, f206_arg4 )
								LUI.CoDMetrics.AccountCreated( f206_arg0, f206_arg2, "1", "menu" )
								FinishRegistrationFlow( f206_arg0, f206_arg2, f206_arg4 )
							end
							
						}
					}
				}
			end, true, nil )
			return "OptInSuccess_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ()
			return function ( f208_arg0, f208_arg1, f208_arg2, f208_arg3 )
				LUI.CoDMetrics.AccountCreated( f208_arg0, f208_arg2, "1", "menu" )
				FinishRegistrationFlow( f208_arg0, f208_arg2, f208_arg3 )
			end
			
		end
	},
	ConfirmPCGraphicsChange = {
		menuName = "SystemOverlay_Compact",
		title = Engine.Localize( "PLATFORM_CONFIRM_GRAPHICS_CHANGE" ),
		description = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.Settings,
		listDatasource = function ()
			DataSources.ConfirmPCGraphicsChange_List = DataSourceHelpers.ListSetup( "ConfirmPCGraphicsChange_List", function ( f210_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f211_arg0, f211_arg1, f211_arg2, f211_arg3, f211_arg4 )
								CoD.PCUtil.FreeOptionsDirtyModel( f211_arg2 )
								GoBackMultiple( f211_arg4, f211_arg2, 2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f212_arg0, f212_arg1, f212_arg2, f212_arg3, f212_arg4 )
								ApplyPCGraphicsOptions( f212_arg4, f212_arg1, f212_arg2 )
								UpdateGamerprofile( f212_arg4, f212_arg1, f212_arg2 )
								CoD.PCUtil.FreeOptionsDirtyModel( f212_arg2 )
								GoBack( f212_arg4, f212_arg2 )
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
			DataSources.ResetPCGraphics_List = DataSourceHelpers.ListSetup( "ResetPCGraphics_List", function ( f214_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f215_arg0, f215_arg1, f215_arg2, f215_arg3, f215_arg4 )
								GoBack( f215_arg4, f215_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f216_arg0, f216_arg1, f216_arg2, f216_arg3, f216_arg4 )
								ResetPCGraphicsOptions( f216_arg4, f216_arg1, f216_arg2 )
								UpdateGamerprofile( f216_arg4, f216_arg1, f216_arg2 )
								CoD.PCUtil.FreeOptionsDirtyModel( f216_arg2 )
								GoBack( f216_arg4, f216_arg2 )
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
		menuName = function ( f217_arg0, f217_arg1, f217_arg2, f217_arg3, f217_arg4, f217_arg5, f217_arg6 )
			if f217_arg0 == CoD.OverlayUtility.GenericPopupSizes.Small then
				return "SystemOverlay_Compact"
			elseif f217_arg0 == CoD.OverlayUtility.GenericPopupSizes.Large then
				return "SystemOverlay_Full"
			else
				
			end
		end,
		title = function ( f218_arg0, f218_arg1, f218_arg2, f218_arg3, f218_arg4, f218_arg5, f218_arg6 )
			return Engine.Localize( f218_arg1 )
		end,
		description = function ( f219_arg0, f219_arg1, f219_arg2, f219_arg3, f219_arg4, f219_arg5, f219_arg6 )
			return Engine.Localize( f219_arg2 )
		end,
		image = function ( f220_arg0, f220_arg1, f220_arg2, f220_arg3, f220_arg4, f220_arg5, f220_arg6 )
			if f220_arg3 and f220_arg3 ~= "" then
				return f220_arg3
			else
				
			end
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ( f221_arg0, f221_arg1, f221_arg2, f221_arg3, f221_arg4, f221_arg5, f221_arg6 )
			if f221_arg4 then
				local f221_local0 = "GenericPopup_" .. f221_arg1
				DataSources[f221_local0] = DataSourceHelpers.ListSetup( f221_local0 .. "_List", function ( f222_arg0 )
					local f222_local0 = f221_arg5
					if not f222_local0 or type( f222_local0 ) ~= "function" then
						f222_local0 = CoD.OverlayUtility.DefaultButtonAction
					end
					return {
						{
							models = {
								displayText = Engine.Localize( f221_arg4 )
							},
							properties = {
								action = f222_local0
							}
						}
					}
				end, true, nil )
				return f221_local0
			else
				
			end
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ( f223_arg0, f223_arg1, f223_arg2, f223_arg3, f223_arg4, f223_arg5, f223_arg6 )
			if f223_arg6 and type( f223_arg6 ) == "function" then
				return f223_arg6
			else
				return CoD.OverlayUtility.DefaultGoBack()
			end
		end
	},
	GenericModalDialog = {
		menuName = CoD.OverlayUtility.AutoSizeMenuFromDescription( "GenericModalDialog" ),
		title = function ( f224_arg0, f224_arg1, f224_arg2, f224_arg3, f224_arg4 )
			return Engine.Localize( f224_arg0 )
		end,
		description = function ( f225_arg0, f225_arg1, f225_arg2, f225_arg3, f225_arg4 )
			return Engine.Localize( f225_arg1 )
		end,
		image = function ( f226_arg0, f226_arg1, f226_arg2, f226_arg3, f226_arg4 )
			if f226_arg2 and f226_arg2 ~= "" then
				return f226_arg2
			else
				
			end
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ( f227_arg0, f227_arg1, f227_arg2, f227_arg3, f227_arg4 )
			local f227_local0 = "GenericModalDialog" .. f227_arg0
			DataSources[f227_local0] = DataSourceHelpers.ListSetup( f227_local0 .. "_List", function ( f228_arg0 )
				local f228_local0 = {}
				for f228_local4, f228_local5 in ipairs( f227_arg3 ) do
					table.insert( f228_local0, {
						models = {
							displayText = Engine.Localize( f228_local5 )
						},
						properties = {
							action = function ( f229_arg0, f229_arg1, f229_arg2, f229_arg3, f229_arg4 )
								if not f227_arg4 or f227_arg4( f228_local4 - 1 ) then
									GoBack( f229_arg4, f229_arg2 )
								end
							end
						}
					} )
				end
				return f228_local0
			end, true, nil )
			return f227_local0
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ( f230_arg0, f230_arg1, f230_arg2, f230_arg3, f230_arg4 )
			return function ( f231_arg0, f231_arg1, f231_arg2, f231_arg3 )
				if f230_arg4 then
					f230_arg4()
				end
				GoBack( f231_arg3, f231_arg2 )
			end
			
		end
	},
	LobbyLeavePopup = {
		menuName = CoD.OverlayUtility.AutoSizeMenuFromDescription( "LobbyLeavePopup" ),
		title = function ( f232_arg0 )
			local f232_local0 = ""
			if f232_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_PARTY then
				f232_local0 = "MENU_LEAVE_LOBBY_LEAVE_PARTY_TITLE"
			elseif f232_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_AND_DISBAND_PARTY then
				f232_local0 = "MENU_LEAVE_LOBBY_DISBAND_FROM_PARTY_TITLE"
			elseif f232_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY then
				f232_local0 = "MENU_LEAVE_LOBBY_LEAVE_LOBBY_TITLE"
			elseif f232_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY then
				f232_local0 = "MENU_LEAVE_LOBBY_LEAVE_PARTY_TITLE"
			elseif f232_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.BRING_PARTY_LEAVE_ALONE then
				f232_local0 = "MENU_LEAVE_LOBBY_LEAVE_LOBBY_TITLE"
			elseif f232_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.MANAGE_PARTY_LEAVE then
				f232_local0 = "MENU_LEAVE_LOBBY_MANAGE_PARTY_LEAVE_TITLE"
			end
			return Engine.Localize( f232_local0 )
		end,
		description = function ( f233_arg0 )
			local f233_local0 = ""
			if f233_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_PARTY then
				f233_local0 = "MENU_LEAVE_LOBBY_LEAVE_PARTY_HINT"
			elseif f233_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_AND_DISBAND_PARTY then
				f233_local0 = "MENU_LEAVE_LOBBY_DISBAND_FROM_PARTY_HINT"
			elseif f233_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY then
				f233_local0 = "MENU_LEAVE_LOBBY_LEAVE_PARTY_HINT"
			elseif f233_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.MANAGE_PARTY_LEAVE then
				f233_local0 = "MENU_LEAVE_LOBBY_MANAGE_PARTY_LEAVE_HINT"
			end
			return Engine.Localize( f233_local0 )
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Quit,
		listDatasource = function ( f234_arg0 )
			DataSources.LeaveLobbyPopupButtons = DataSourceHelpers.ListSetup( "LeaveLobbyPopupButtons", function ( f235_arg0 )
				local f235_local0 = {
					controller = f235_arg0
				}
				local f235_local1 = function ( f236_arg0, f236_arg1, f236_arg2, f236_arg3, f236_arg4 )
					local f236_local0 = GoBack( f236_arg4, f236_arg2 )
					DisableAllMenuInput( f236_local0, nil )
					if f236_arg3 == nil then
						return 
					elseif f236_local0.ClientList ~= nil then
						f236_local0.ClientList:processEvent( {
							name = "lose_focus",
							controller = f236_arg2
						} )
					end
					f235_local0.withParty = f236_arg3
					Engine.LobbyVM_CallFunc( "GoBack", f235_local0 )
				end
				
				local f235_local2 = function ( f237_arg0, f237_arg1, f237_arg2, f237_arg3, f237_arg4 )
					GoBack( f237_arg4, f237_arg2 )
					Engine.LobbyVM_CallFunc( "ManagePartyLeave", f235_local0 )
				end
				
				local f235_local3 = function ( f238_arg0, f238_arg1, f238_arg2, f238_arg3, f238_arg4 )
					table.insert( f238_arg0, {
						optionDisplay = f238_arg2,
						action = f238_arg3,
						param = f238_arg4,
						customId = f238_arg1,
						isLargeButton = true,
						isLastButtonInGroup = false,
						disabled = false
					} )
				end
				
				local f235_local4 = {}
				if f234_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_PARTY then
					f235_local3( f235_local4, "btnWithout", "MENU_LEAVE_LOBBY_LEAVE_PARTY", f235_local1, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
				elseif f234_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_AND_DISBAND_PARTY then
					f235_local3( f235_local4, "btnWithout", "MENU_LEAVE_LOBBY_LEAVE_AND_DISBAND_PARTY", f235_local1, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
				elseif f234_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY then
					f235_local3( f235_local4, "btnWithout", "MENU_LEAVE_LOBBY_LEAVE_LOBBY", f235_local1, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
				elseif f234_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY then
					f235_local3( f235_local4, "btnWithout", "MENU_LEAVE_LOBBY_LEAVE_LOBBY_AND_PARTY", f235_local1, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
				elseif f234_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.BRING_PARTY_LEAVE_ALONE then
					f235_local3( f235_local4, "btnWithout", "MENU_LEAVE_LOBBY_LEAVE_ALONE", f235_local1, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
					f235_local3( f235_local4, "btnWith", "MENU_LEAVE_LOBBY_BRING_PARTY", f235_local1, LuaEnums.LEAVE_WITH_PARTY.WITH )
				elseif f234_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.MANAGE_PARTY_LEAVE then
					f235_local3( f235_local4, "btnWithout", "MENU_CONFIRM_CAPS", f235_local2, nil )
				end
				f235_local3( f235_local4, "btnCancel", "MENU_LEAVE_LOBBY_CANCEL", f235_local1, nil )
				local f235_local5 = {}
				for f235_local9, f235_local10 in ipairs( f235_local4 ) do
					table.insert( f235_local5, {
						models = {
							displayText = Engine.Localize( f235_local10.optionDisplay ),
							customId = f235_local10.customId
						},
						properties = {
							disabled = f235_local10.disabled,
							action = f235_local10.action,
							actionParam = f235_local10.param,
							isLastButtonInGroup = f235_local10.isLastButtonInGroup
						}
					} )
				end
				return f235_local5
			end )
			return "LeaveLobbyPopupButtons"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ()
			return function ( f240_arg0, f240_arg1, f240_arg2, f240_arg3 )
				DisableAllMenuInput( GoBack( f240_arg3, f240_arg2 ), nil )
			end
			
		end
	},
	LobbyLocalClientWarning = {
		menuName = CoD.OverlayUtility.AutoSizeMenuFromDescription( "LobbyLocalClientWarning" ),
		title = "MENU_DISBAND_PARTY_CAPS",
		description = "MENU_NO_SPLITSCREEN_ALLOWED_DESC",
		image = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.Alert,
		listDatasource = function ( f241_arg0 )
			DataSources.LobbyLocalClientWarningButtons = DataSourceHelpers.ListSetup( "LobbyLocalClientWarningButtons", function ()
				return {
					{
						models = {
							displayText = "MENU_CONTINUE_AND_DISBAND"
						},
						properties = {
							action = function ( f243_arg0, f243_arg1, f243_arg2, f243_arg3, f243_arg4 )
								GoBack( f243_arg4, f243_arg2 )
								f241_arg0.disbandParty = true
								for f243_local0 = 1, Engine.GetMaxControllerCount() - 1, 1 do
									LobbyRemoveLocalClientFromLobby( f243_arg0, f243_local0 )
								end
								if f241_arg0.navToMenu ~= nil then
									Engine.LobbyVM_CallFunc( "GoForward", f241_arg0 )
								elseif f241_arg0.popupName ~= nil and f241_arg0.openFromMenu ~= nil then
									OpenPopup( f241_arg0.openFromMenu, f241_arg0.popupName, 0 )
								elseif f241_arg0.actionFunc ~= nil then
									f241_arg0:actionFunc()
								end
							end
							
						}
					},
					{
						models = {
							displayText = "MENU_CANCEL"
						},
						properties = {
							action = function ( f244_arg0, f244_arg1, f244_arg2, f244_arg3, f244_arg4 )
								if f244_arg4.occludedMenu and f244_arg4.occludedMenu.openOverlayAfterSpinner then
									f244_arg4.occludedMenu.openOverlayAfterSpinner = nil
								end
								GoBack( f244_arg4, f244_arg2 )
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
	},
	AnticheatMessage = {
		menuName = "SystemOverlay_Full",
		title = Engine.Localize( "MENU_ERROR" ),
		description = function ( f248_arg0, f248_arg1, f248_arg2 )
			return Engine.Localize( f248_arg0, f248_arg1 )
		end,
		listDatasource = function ( f249_arg0, f249_arg1, f249_arg2 )
			DataSources.AnticheatMessageButtons = DataSourceHelpers.ListSetup( "AnticheatMessageButtons", function ( f250_arg0 )
				local f250_local0 = f249_arg1
				local f250_local1 = f249_arg2
				local f250_local2 = {}
				if f250_local0 ~= "" then
					table.insert( f250_local2, {
						models = {
							displayText = Engine.Localize( "MENU_INFO" )
						},
						properties = {
							action = OpenAnticheatPolicyInBrowser
						}
					} )
				end
				table.insert( f250_local2, {
					models = {
						displayText = Engine.Localize( "MENU_OK" )
					},
					properties = {
						action = f250_local1
					}
				} )
				return f250_local2
			end, true, nil )
			return "AnticheatMessageButtons"
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Error,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	}
}
CoD.OverlayUtility.AddSystemOverlay = function ( f251_arg0, f251_arg1 )
	CoD.OverlayUtility.Overlays[f251_arg0] = f251_arg1
end

local f0_local1 = function ( f252_arg0, f252_arg1 )
	return function ()
		ClearMenuSavedState( f252_arg0 )
		if f252_arg0.overlayModelName then
			local f253_local0 = Engine.GetModel( Engine.GetModelForController( f252_arg1 ), f252_arg0.overlayModelName )
			if f253_local0 then
				Engine.UnsubscribeAndFreeModel( f253_local0 )
			end
		end
	end
	
end

local f0_local2 = function ( f254_arg0, f254_arg1, f254_arg2 )
	for f254_local4, f254_local5 in ipairs( CoD.OverlayUtility.OverlayModelFields ) do
		local f254_local3 = nil
		local f254_local6 = Engine.CreateModel( f254_arg0, f254_local5 )
		f254_local3 = f0_local0( f254_arg1[f254_local5], f254_arg2 )
		if not f254_local3 and CoD.OverlayUtility.DefaultModelFields[f254_local5] then
			f254_local3 = f0_local0( CoD.OverlayUtility.DefaultModelFields[f254_local5], {
				f254_arg1,
				f254_arg2
			} )
		end
		if f254_local3 ~= nil then
			Engine.SetModelValue( f254_local6, f254_local3 )
		end
	end
end

local f0_local3 = function ( f255_arg0, f255_arg1, f255_arg2 )
	for f255_local4, f255_local5 in ipairs( CoD.OverlayUtility.OverlayPropertyFields ) do
		local f255_local3 = nil
		f255_local3 = f0_local0( f255_arg1[f255_local5], f255_arg2 )
		if not f255_local3 and CoD.OverlayUtility.DefaultPropertyFields[f255_local5] then
			f255_local3 = f0_local0( CoD.OverlayUtility.DefaultPropertyFields[f255_local5], {
				f255_arg1,
				f255_arg2
			} )
		end
		f255_arg0[f255_local5] = f255_local3
	end
end

local f0_local4 = function ( f256_arg0, f256_arg1 )
	return function ()
		f0_local2( f256_arg0:getModel(), CoD.OverlayUtility.Overlays[f256_arg0.menuName], f256_arg1 )
		f0_local3( f256_arg0, CoD.OverlayUtility.Overlays[f256_arg0.menuName], f256_arg1 )
	end
	
end

CoD.OverlayUtility.CreateOverlay = function ( f258_arg0, f258_arg1, f258_arg2, ... )
	local f258_local0 = nil
	local f258_local1 = {
		n = select( "#", ... ),
		...
	}
	local f258_local2 = function ( f259_arg0, f259_arg1 )
		for f259_local4, f259_local5 in ipairs( CoD.OverlayUtility.OverlayModelFields ) do
			local f259_local3 = nil
			local f259_local6 = Engine.CreateModel( f259_arg0, f259_local5 )
			if type( f259_arg1[f259_local5] ) == "function" then
				f259_local3 = f259_arg1[f259_local5]( unpack( f258_local1 ) )
			else
				f259_local3 = f259_arg1[f259_local5]
			end
			if not f259_local3 and CoD.OverlayUtility.DefaultModelFields[f259_local5] then
				f259_local3 = f0_local0( CoD.OverlayUtility.DefaultModelFields[f259_local5], {
					f259_arg1,
					f258_local1
				} )
			end
			if f259_local3 ~= nil then
				Engine.SetModelValue( f259_local6, f259_local3 )
			end
		end
	end
	
	if CoD.OverlayUtility.Overlays[f258_arg2] then
		local f258_local3 = CoD.OverlayUtility.Overlays[f258_arg2]
		local f258_local4 = f0_local0( f258_local3.menuName, f258_local1 )
		if f258_local4 then
			if CoD.Menu.ModelToUse then
				f0_local2( CoD.Menu.ModelToUse, f258_local3, f258_local1 )
			end
			CoD.Menu.OverwriteMenuName = f258_arg2
			if not f258_local3.openMethod or f258_local3.openMethod == CoD.OverlayUtility.OpenMethods.Popup then
				f258_local0 = OpenPopup( f258_arg1, f258_local4, f258_arg0 )
			elseif f258_local3.openMethod == CoD.OverlayUtility.OpenMethods.Overlay then
				f258_local0 = OpenOverlay( f258_arg1, f258_local4, f258_arg0 )
			end
			CoD.Menu.OverwriteMenuName = nil
			if f258_local0 then
				f258_local0.refreshData = f0_local4( f258_local0, f258_local1 )
				f0_local3( f258_local0, f258_local3, f258_local1 )
				if not f258_local0:getModel() then
					f258_local0.overlayModelName = "Overlay." .. f258_arg2
					local f258_local5 = Engine.CreateModel( Engine.GetModelForController( f258_arg0 ), f258_local0.overlayModelName )
					f0_local2( f258_local5, f258_local3, f258_local1 )
					f258_local0:setModel( f258_local5 )
				end
				LUI.OverrideFunction_CallOriginalFirst( f258_local0, "close", f0_local1( f258_local0, f258_arg0 ) )
				if f258_local3.postCreateStep then
					f258_local3.postCreateStep( f258_local0, f258_arg0 )
				end
				f258_local0:UpdateAllButtonPrompts( f258_arg0 )
			end
		end
	end
	return f258_local0
end

CoD.OverlayUtility.ShowToast = function ( f260_arg0, f260_arg1, f260_arg2, f260_arg3, f260_arg4, f260_arg5, f260_arg6 )
	local f260_local0 = Engine.CreateModel( Engine.GetModelForController( Engine.GetPrimaryController() ), "FrontendToast" )
	Engine.SetModelValue( Engine.GetModel( f260_local0, "state" ), f260_arg0 or "DefaultState" )
	Engine.SetModelValue( Engine.GetModel( f260_local0, "kicker" ), f260_arg1 or "" )
	Engine.SetModelValue( Engine.GetModel( f260_local0, "description" ), f260_arg2 or "" )
	Engine.SetModelValue( Engine.GetModel( f260_local0, "contentIcon" ), f260_arg3 or "blacktransparent" )
	Engine.SetModelValue( Engine.GetModel( f260_local0, "functionIcon" ), f260_arg4 or "blacktransparent" )
	Engine.SetModelValue( Engine.GetModel( f260_local0, "backgroundId" ), f260_arg6 )
	Engine.SetModelValue( Engine.GetModel( f260_local0, "emblemDecal" ), f260_arg5 or 0 )
	Engine.SetModelValue( Engine.GetModel( f260_local0, "notify" ), true )
end

