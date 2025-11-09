require( "lua.Shared.LuaEnums" )

CoD.OverlayUtility = {}
CoD.OverlayUtility.OpenMethods = LuaEnums.createEnum( "Popup", "Overlay" )
CoD.OverlayUtility.OverlayTypes = LuaEnums.createEnum( "GenericMessage", "Connection", "Settings", "Unlock", "Save", "Quit", "Alert", "Error", "Warning", "Info", "Notice", "CODPoints", "RetailIncentive", "DigitalIncentive", "SeasonPassIncentive" )
CoD.OverlayUtility.GenericPopupSizes = LuaEnums.createEnum( "Small", "Large" )
CoD.OverlayUtility.LOCAL_FILES_FETCH_WAIT_TIME = 20000
CoD.OverlayUtility.CONNECTINGDW_MAX_WAIT_TIME = 30000
if Engine.GetCurrentPlatform() == "orbis" then
	CoD.OverlayUtility.CONNECTINGDW_MAX_WAIT_TIME = 40000
end
if Engine.GetCurrentPlatform() == "durango" then
	CoD.OverlayUtility.CONNECTINGDW_MAX_WAIT_TIME = 60000
end
CoD.OverlayUtility.callFnOrGetValue = function ( f1_arg0, f1_arg1 )
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
	"codpointcost",
	"codpointcostString",
	"totalDuplicates",
	"commonDuplicates",
	"rareDuplicates",
	"legendaryDuplicates",
	"epicDuplicates",
	"vials",
	"supplyDropType",
	"variantName",
	"weaponName",
	"inputText",
	"backgroundId",
	"xuid",
	"gamertag",
	"clantag",
	"emblemBacking",
	"fractionText",
	"progressPercentage",
	"rewardText",
	"groupId"
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
		local f2_local0 = CoD.OverlayUtility.callFnOrGetValue( f2_arg0.categoryType, f2_arg1 )
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
		elseif f2_local0 == CoD.OverlayUtility.OverlayTypes.Warning then
			return "t7_icon_notice_overlays_bkg"
		elseif f2_local0 == CoD.OverlayUtility.OverlayTypes.CODPoints then
			return "uie_t7_menu_blackmarket_codpoints_large"
		elseif f2_local0 == CoD.OverlayUtility.OverlayTypes.RetailIncentive then
			return "t7_icon_retail_incentive_overlay"
		elseif f2_local0 == CoD.OverlayUtility.OverlayTypes.DigitalIncentive then
			return "t7_icon_digital_incentive_overlay"
		elseif f2_local0 == CoD.OverlayUtility.OverlayTypes.SeasonPassIncentive then
			return "uie_t7_icon_seasonpassreward"
		else
			return "blacktransparent"
		end
	end,
	frameWidget = function ( f3_arg0, f3_arg1 )
		local f3_local0 = CoD.OverlayUtility.callFnOrGetValue( f3_arg0.menuName, f3_arg1 )
		if f3_local0 == "SystemOverlay_Compact" or f3_local0 == "SystemOverlay_MessageDialog" or f3_local0 == "SystemOverlay_NoBG" then
			return "CoD.systemOverlay_Compact_BasicFrame"
		elseif f3_local0 == "SystemOverlay_Full" or f3_local0 == "SystemOverlay_MessageDialogFull" then
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

CoD.OverlayUtility.AutoSizeMenuFromDescription = function ( f11_arg0, f11_arg1, f11_arg2 )
	return function ( ... )
		if Engine.GetNumTextLines( CoD.OverlayUtility.callFnOrGetValue( CoD.OverlayUtility.Overlays[f11_arg0].description, {
			n = select( "#", ... ),
			...
		} ), CoD.fonts.Default, 20, 660 ) > 3 then
			return f11_arg2 or "SystemOverlay_Full"
		else
			return f11_arg1 or "SystemOverlay_Compact"
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
				if CoDShared.IsGametypeTeamBased() and LuaUtils.IsArenaMode() and CoDShared.IsTeamOverwhelmed( Engine.GetPrimaryController() ) then
					return LocalizeIntoString( "MENU_NO_PROBATION_EXPLAINATION", Dvar.arena_unfairTeamGap:get() )
				else
					return Engine.Localize( "MENU_LEAVE_GAME_RANKED_PROBATION" )
				end
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
			local f15_local0 = Engine.ProbationCheckIfPenalizedForQuit( Engine.GetPrimaryController() )
			if f15_local0 then
				f15_local0 = CoDShared.IsGametypeTeamBased()
				if f15_local0 then
					f15_local0 = LuaUtils.IsArenaMode()
					if f15_local0 then
						f15_local0 = CoDShared.IsTeamOverwhelmed( Engine.GetPrimaryController() )
					end
				end
			end
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
								CoDShared.QuitGame( f17_arg2, f15_local0 )
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
								if not IsGameTypeDOA() then
									f27_arg4:processEvent( {
										name = "close_all_ingame_menus",
										controller = f27_arg2
									} )
									Engine.SetDvar( "cl_paused", 0 )
									Engine.SendMenuResponse( f27_arg2, "popup_leavegame", "endround" )
									Engine.Exec( f27_arg2, "disconnect" )
								else
									local f27_local0 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
									if not CoDShared.QuitGame( f27_arg2 ) then
										CloseStartMenu( f27_arg4, f27_arg2 )
										return 
									end
									f27_arg4:processEvent( {
										name = "close_all_ingame_menus",
										controller = f27_arg2
									} )
									Engine.SetDvar( "cl_paused", 0 )
									Engine.SendMenuResponse( f27_arg2, "popup_leavegame", "endround" )
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
								Engine.PlayMenuMusic( "death" )
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
								Engine.Exec( f43_arg2, "clearKeyStates" )
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
		menuName = CoD.OverlayUtility.AutoSizeMenuFromDescription( "MessageDialogBox", "SystemOverlay_MessageDialog", "SystemOverlay_MessageDialogFull" ),
		getStringRef = function ( f44_arg0 )
			return Engine.GetModelValue( Engine.GetModel( DataSources.MessageDialog.getModel( f44_arg0 ), "message" ) ) or ""
		end,
		postCreateStep = function ( f45_arg0, f45_arg1 )
			if CoD.OverlayUtility.Overlays.MessageDialogBox.getStringRef( f45_arg1 ) == "PLATFORM_SAVEDATA_CORRUPT" then
				f45_arg0.ignoreForcedClose = true
			end
		end,
		title = function ( f46_arg0 )
			local f46_local0 = DataSources.MessageDialog.getModel( f46_arg0 )
			local f46_local1 = CoD.SafeGetModelValue( f46_local0, "messageTitle" )
			if f46_local1 == nil or f46_local1 == "" then
				local f46_local2 = Engine.GetModelValue( Engine.GetModel( f46_local0, "messageType" ) )
				if f46_local2 == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_INFO then
					f46_local1 = Engine.Localize( "MENU_INFO" )
				elseif f46_local2 == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_WARNING then
					f46_local1 = Engine.Localize( "MENU_WARNING" )
				elseif f46_local2 == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_ERROR then
					f46_local1 = Engine.Localize( "MENU_ERROR" )
				elseif f46_local2 == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_NOTICE then
					if CoD.OverlayUtility.Overlays.MessageDialogBox.getStringRef( f46_arg0 ) == "PLATFORM_PROFILE_CHANGE_MESSAGE" then
						f46_local1 = Engine.Localize( "PLATFORM_PROFILE_CHANGE_CAPS" )
					else
						f46_local1 = Engine.Localize( "MENU_NOTICE" )
					end
				end
			end
			return Engine.ToUpper( f46_local1 )
		end,
		description = function ( f47_arg0 )
			return Engine.Localize( CoD.OverlayUtility.Overlays.MessageDialogBox.getStringRef( f47_arg0 ) )
		end,
		image = function ( f48_arg0 )
			local f48_local0 = CoD.SafeGetModelValue( DataSources.MessageDialog.getModel( f48_arg0 ), "messageImage" )
			if f48_local0 ~= nil and f48_local0 ~= "" then
				return f48_local0
			else
				return nil
			end
		end,
		categoryType = function ( f49_arg0 )
			local modelValue = Engine.GetModelValue( Engine.GetModel( DataSources.MessageDialog.getModel( f49_arg0 ), "messageType" ) )
			local f49_local1 = CoD.OverlayUtility.OverlayTypes.GenericMessage
			if modelValue == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_WARNING then
				f49_local1 = CoD.OverlayUtility.OverlayTypes.Warning
			elseif modelValue == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_ERROR then
				f49_local1 = CoD.OverlayUtility.OverlayTypes.Error
			elseif modelValue == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_INFO then
				f49_local1 = CoD.OverlayUtility.OverlayTypes.Info
			elseif modelValue == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_NOTICE then
				f49_local1 = CoD.OverlayUtility.OverlayTypes.Notice
			end
			return f49_local1
		end,
		listDatasource = function ( f50_arg0 )
			local f50_local0 = "MessageDialogBoxList" .. Engine.GetModelValue( Engine.GetModel( DataSources.MessageDialog.getModel( f50_arg0 ), "messagePending" ) )
			DataSources[f50_local0] = DataSourceHelpers.ListSetup( f50_local0, function ( f51_arg0 )
				local f51_local0 = CoD.SafeGetModelValue( DataSources.MessageDialog.getModel( f51_arg0 ), "messageTitle" )
				if CoD.OverlayUtility.Overlays.MessageDialogBox.getStringRef( f51_arg0 ) == "PLATFORM_PROFILE_CHANGE_MESSAGE" then
					return {
						{
							models = {
								displayText = Engine.Localize( "PLATFORM_CONTINUE_AS_USERNAME", Engine.GetGamertagWhoStolePrimaryController() )
							},
							properties = {
								action = function ( f52_arg0, f52_arg1, f52_arg2, f52_arg3, f52_arg4 )
									LuaUtils.UI_ClearErrorMessageDialog()
									LuaUtils.UI_SetSignedInGamertagModel( Engine.GetGamertagWhoStolePrimaryController() )
									GoBack( f52_arg4, f52_arg2 )
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
								action = function ( f53_arg0, f53_arg1, f53_arg2, f53_arg3, f53_arg4 )
									Engine.ShowAccountPicker( f53_arg2 )
									LuaUtils.UI_ClearErrorMessageDialog()
									GoBack( f53_arg4, f53_arg2 )
								end
								
							}
						}
					}
				elseif f51_local0 == "MENU_CONNECTIVITY_NOTICE_CAPS" then
					return {
						{
							models = {
								displayText = Engine.Localize( "MENU_PLAY_LOCAL" )
							},
							properties = {
								action = function ( f54_arg0, f54_arg1, f54_arg2, f54_arg3, f54_arg4 )
									LuaUtils.UI_ClearErrorMessageDialog()
									GoBack( f54_arg4, f54_arg2 )
									LobbyBeginPlay( GoBack( f54_arg4, f54_arg2 ), f54_arg2 )
								end
								
							}
						},
						{
							models = {
								displayText = Engine.Localize( "MENU_RETRY" )
							},
							properties = {
								action = function ( f55_arg0, f55_arg1, f55_arg2, f55_arg3, f55_arg4 )
									LuaUtils.UI_ClearErrorMessageDialog()
									local f55_local0 = GoBack( f55_arg4, f55_arg2 )
									CoD.LobbyBase.FailedDWConnection = false
									LobbyBeginPlay( f55_local0, f55_arg2 )
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
								action = function ( f56_arg0, f56_arg1, f56_arg2, f56_arg3, f56_arg4 )
									LuaUtils.UI_ClearErrorMessageDialog()
									GoBack( f56_arg4, f56_arg2 )
								end
								
							}
						}
					}
				end
			end, true, nil )
			return f50_local0
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ( f57_arg0 )
			local f57_local0 = CoD.OverlayUtility.Overlays.MessageDialogBox.getStringRef( f57_arg0 )
			if f57_local0 ~= "PLATFORM_PROFILE_CHANGE_MESSAGE" and f57_local0 ~= "PLATFORM_SAVEDATA_CORRUPT" then
				return function ( f58_arg0, f58_arg1, f58_arg2, f58_arg3 )
					LuaUtils.UI_ClearErrorMessageDialog()
					GoBack( f58_arg3, f58_arg2 )
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
			DataSources.DemoSaveClipPopup_List = DataSourceHelpers.ListSetup( "DemoSaveClipPopup_List", function ( f62_arg0 )
				local f62_local0 = {}
				table.insert( f62_local0, {
					models = {
						displayText = Engine.Localize( "MENU_AUTONAME_SEGMENT" )
					},
					properties = {
						action = function ( f63_arg0, f63_arg1, f63_arg2, f63_arg3, f63_arg4 )
							Engine.Exec( f63_arg2, "demo_savesegment 0" )
							GoBack( f63_arg4, f63_arg2 )
						end
					}
				} )
				table.insert( f62_local0, {
					models = {
						displayText = Engine.Localize( "MENU_NAME_SEGMENT" )
					},
					properties = {
						action = function ( f64_arg0, f64_arg1, f64_arg2, f64_arg3, f64_arg4 )
							OpenDemoKeyboard( f64_arg0, f64_arg1, f64_arg2, "segmentName" )
						end
					}
				} )
				table.insert( f62_local0, {
					models = {
						displayText = Engine.Localize( "MENU_PREVIEW_SEGMENT" )
					},
					properties = {
						action = function ( f65_arg0, f65_arg1, f65_arg2, f65_arg3, f65_arg4 )
							Engine.Exec( f65_arg2, "demo_previewsegment" )
							GoBack( f65_arg4, f65_arg2 )
						end
					}
				} )
				table.insert( f62_local0, {
					models = {
						displayText = Engine.Localize( "MENU_DISCARD_SEGMENT" )
					},
					properties = {
						action = function ( f66_arg0, f66_arg1, f66_arg2, f66_arg3, f66_arg4 )
							Engine.Exec( f66_arg2, "demo_savesegment 1" )
							GoBack( f66_arg4, f66_arg2 )
						end
					}
				} )
				return f62_local0
			end, true, nil )
			return "DemoSaveClipPopup_List"
		end,
		postCreateStep = function ( f67_arg0, f67_arg1 )
			Engine.LockInput( f67_arg1, true )
			Engine.SetUIActive( f67_arg1, true )
			LUI.OverrideFunction_CallOriginalSecond( f67_arg0, "close", function ( element )
				Engine.LockInput( f67_arg1, false )
				Engine.SetUIActive( f67_arg1, false )
			end )
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = nil
	},
	DemoStartHighlightReelPopup = {
		menuName = "SystemOverlay_Compact",
		frameWidget = "CoD.DemoStartHighlightReel",
		title = Engine.ToUpper( Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL" ) ),
		description = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_START_DESC" ),
		categoryType = CoD.OverlayUtility.OverlayTypes.Save,
		listDatasource = function ()
			DataSources.DemoStartHighlightReel_List = DataSourceHelpers.ListSetup( "DemoStartHighlightReel_List", function ( f70_arg0 )
				local f70_local0 = Engine.GetNumberOfHighlightReelMoments()
				local f70_local1 = {}
				table.insert( f70_local1, {
					models = {
						displayText = Engine.ToUpper( Engine.Localize( "MENU_DEMO_CUSTOMIZE_HIGHLIGHT_REEL" ) )
					},
					properties = {
						action = function ( f71_arg0, f71_arg1, f71_arg2, f71_arg3, f71_arg4 )
							StartMenuOpenCustomizeHighlightReel( f71_arg0, f71_arg1, f71_arg2, f71_arg3, f71_arg4 )
						end
					}
				} )
				table.insert( f70_local1, {
					models = {
						displayText = Engine.ToUpper( Engine.Localize( "MENU_DEMO_START_HIGHLIGHT_REEL" ) ),
						disabled = f70_local0 <= 0
					},
					properties = {
						disabled = f70_local0 <= 0,
						disabledAllowNav = true,
						action = function ( f72_arg0, f72_arg1, f72_arg2, f72_arg3, f72_arg4 )
							GoBack( f72_arg4, f72_arg2 )
							Engine.Exec( f72_arg2, "demo_regeneratehighlightreel" )
						end,
						selectIndex = f70_local0 > 0
					}
				} )
				return f70_local1
			end, nil, nil, function ( f73_arg0, f73_arg1, f73_arg2 )
				local f73_local0 = CoD.DemoUtility.GetNumHighlightReelMomentsModel()
				if f73_arg1.updateSubscription then
					f73_arg1:removeSubscription( f73_arg1.updateSubscription )
				end
				f73_arg1.updateSubscription = f73_arg1:subscribeToModel( f73_local0, function ()
					f73_arg1:updateDataSource( false )
				end, false )
			end )
			return "DemoStartHighlightReel_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ( f75_arg0 )
			return function ( f76_arg0, f76_arg1, f76_arg2, f76_arg3 )
				GoBack( f76_arg3, f76_arg2 )
			end
			
		end
	},
	DemoCustomizeHighlightReelPopup = {
		menuName = "SystemOverlay_DemoCustomizeHighlightReel",
		frameWidget = "CoD.DemoCustomizeHighlightReel",
		title = Engine.ToUpper( Engine.Localize( "MENU_DEMO_CUSTOMIZE_HIGHLIGHT_REEL" ) ),
		description = Engine.Localize( "MENU_DEMO_CUSTOMIZE_HIGHLIGHT_REEL_DESC" ),
		categoryType = CoD.OverlayUtility.OverlayTypes.Save,
		listDatasource = function ()
			DataSources.DemoCustomizeHighlightReel_List = DataSourceHelpers.ListSetup( "DemoCustomizeHighlightReel_List", function ( f78_arg0 )
				local f78_local0 = Engine.GetNumberOfHighlightReelMoments()
				local f78_local1 = {}
				table.insert( f78_local1, {
					models = {
						displayText = Engine.ToUpper( Engine.Localize( "MENU_DEMO_START_HIGHLIGHT_REEL" ) ),
						disabled = f78_local0 <= 0
					},
					properties = {
						action = function ( f79_arg0, f79_arg1, f79_arg2, f79_arg3, f79_arg4 )
							GoBackMultiple( f79_arg0, f79_arg2, 2 )
							Engine.Exec( f79_arg2, "demo_regeneratehighlightreel" )
						end
					}
				} )
				return f78_local1
			end, nil, nil, function ( f80_arg0, f80_arg1, f80_arg2 )
				local f80_local0 = CoD.DemoUtility.GetNumHighlightReelMomentsModel()
				if f80_arg1.updateSubscription then
					f80_arg1:removeSubscription( f80_arg1.updateSubscription )
				end
				f80_arg1.updateSubscription = f80_arg1:subscribeToModel( f80_local0, function ()
					f80_arg1:updateDataSource( false )
				end, false )
			end )
			return "DemoCustomizeHighlightReel_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ()
			return function ( f83_arg0, f83_arg1, f83_arg2, f83_arg3 )
				GoBack( f83_arg3, f83_arg2 )
			end
			
		end
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
			DataSources.DemoDeleteAllDollyCameraMarkers_List = DataSourceHelpers.ListSetup( "DemoDeleteAllDollyCameraMarkers_List", function ( f87_arg0 )
				local f87_local0 = {}
				table.insert( f87_local0, {
					models = {
						displayText = Engine.Localize( "DEMO_DELETE_ALL" )
					},
					properties = {
						action = function ( f88_arg0, f88_arg1, f88_arg2, f88_arg3, f88_arg4 )
							CoD.DemoUtility.RemoveDollyCamMarker( f88_arg2, -1 )
							CoD.DemoUtility.SetEditingDollyCameraMarker( f88_arg2, false )
							GoBack( f88_arg4, f88_arg2 )
						end
					}
				} )
				table.insert( f87_local0, {
					models = {
						displayText = Engine.Localize( "MENU_CANCEL" )
					},
					properties = {
						action = function ( f89_arg0, f89_arg1, f89_arg2, f89_arg3, f89_arg4 )
							GoBack( f89_arg4, f89_arg2 )
						end,
						selectIndex = true
					}
				} )
				return f87_local0
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
			DataSources.DemoDeleteAllLightmanMarkers_List = DataSourceHelpers.ListSetup( "DemoDeleteAllLightmanMarkers_List", function ( f93_arg0 )
				local f93_local0 = {}
				table.insert( f93_local0, {
					models = {
						displayText = Engine.Localize( "DEMO_DELETE_ALL" )
					},
					properties = {
						action = function ( f94_arg0, f94_arg1, f94_arg2, f94_arg3, f94_arg4 )
							CoD.DemoUtility.RemoveLightmanMarker( f94_arg2, -1 )
							CoD.DemoUtility.SetEditingLightmanMarker( f94_arg2, false )
							GoBack( f94_arg4, f94_arg2 )
						end
					}
				} )
				table.insert( f93_local0, {
					models = {
						displayText = Engine.Localize( "MENU_CANCEL" )
					},
					properties = {
						action = function ( f95_arg0, f95_arg1, f95_arg2, f95_arg3, f95_arg4 )
							GoBack( f95_arg4, f95_arg2 )
						end,
						selectIndex = true
					}
				} )
				return f93_local0
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
			DataSources.DemoDeleteSegment_List = DataSourceHelpers.ListSetup( "DemoDeleteSegment_List", function ( f99_arg0 )
				local f99_local0 = {}
				table.insert( f99_local0, {
					models = {
						displayText = Engine.Localize( "MENU_YES" )
					},
					properties = {
						action = function ( f100_arg0, f100_arg1, f100_arg2, f100_arg3, f100_arg4 )
							Engine.ExecNow( f100_arg2, "demo_deletesegment " .. Engine.GetModelValue( Engine.GetModel( CoD.DemoUtility.Timeline_GetHighlightedSegmentModel(), "segmentNumber" ) ) - 1 )
							TimelineEditorRefresh()
							GoBack( f100_arg4, f100_arg2 )
						end
					}
				} )
				table.insert( f99_local0, {
					models = {
						displayText = Engine.Localize( "MENU_CANCEL" )
					},
					properties = {
						action = function ( f101_arg0, f101_arg1, f101_arg2, f101_arg3, f101_arg4 )
							GoBack( f101_arg4, f101_arg2 )
						end,
						selectIndex = true
					}
				} )
				return f99_local0
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
			DataSources.DemoDeleteAllSegments_List = DataSourceHelpers.ListSetup( "DemoDeleteAllSegments_List", function ( f105_arg0 )
				local f105_local0 = {}
				table.insert( f105_local0, {
					models = {
						displayText = Engine.Localize( "MENU_YES" )
					},
					properties = {
						action = function ( f106_arg0, f106_arg1, f106_arg2, f106_arg3, f106_arg4 )
							Engine.ExecNow( f106_arg2, "demo_deleteclip" )
							TimelineEditorRefresh()
							GoBack( f106_arg4, f106_arg2 )
						end
					}
				} )
				table.insert( f105_local0, {
					models = {
						displayText = Engine.Localize( "MENU_CANCEL" )
					},
					properties = {
						action = function ( f107_arg0, f107_arg1, f107_arg2, f107_arg3, f107_arg4 )
							GoBack( f107_arg4, f107_arg2 )
						end,
						selectIndex = true
					}
				} )
				return f105_local0
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
			DataSources.DemoMergeAllSegments_List = DataSourceHelpers.ListSetup( "DemoMergeAllSegments_List", function ( f111_arg0 )
				local f111_local0 = {}
				table.insert( f111_local0, {
					models = {
						displayText = Engine.Localize( "MENU_YES" )
					},
					properties = {
						action = function ( f112_arg0, f112_arg1, f112_arg2, f112_arg3, f112_arg4 )
							Engine.ExecNow( f112_arg2, "demo_mergesegments" )
							TimelineEditorRefresh()
							GoBack( f112_arg4, f112_arg2 )
						end
					}
				} )
				table.insert( f111_local0, {
					models = {
						displayText = Engine.Localize( "MENU_CANCEL" )
					},
					properties = {
						action = function ( f113_arg0, f113_arg1, f113_arg2, f113_arg3, f113_arg4 )
							GoBack( f113_arg4, f113_arg2 )
						end,
						selectIndex = true
					}
				} )
				return f111_local0
			end, true, nil )
			return "DemoMergeAllSegments_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = nil
	},
	EndDemoPopup = {
		menuName = "SystemOverlay_Compact",
		title = function ()
			local f114_local0 = nil
			local f114_local1 = Engine.IsDemoClipPlaying()
			local f114_local2 = Engine.GameHost()
			if not f114_local1 then
				if f114_local2 then
					f114_local0 = Engine.Localize( "MPUI_LEAVE_FILM" )
				else
					f114_local0 = Engine.Localize( "MPUI_END_FILM" )
				end
			elseif f114_local2 then
				f114_local0 = Engine.Localize( "MPUI_LEAVE_CLIP" )
			else
				f114_local0 = Engine.Localize( "MPUI_END_CLIP" )
			end
			return Engine.ToUpper( f114_local0 )
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
			DataSources.EndDemoPopup_List = DataSourceHelpers.ListSetup( "EndDemoPopup_List", function ( f117_arg0 )
				local f117_local0 = {}
				local f117_local1 = Engine.IsClipModified()
				local f117_local2 = function ()
					if not Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
						Engine.GameModeResetModes()
						Engine.SessionModeResetModes()
						Engine.Exec( f117_arg0, "disconnect" )
					else
						Engine.Exec( f117_arg0, "xpartystopdemo" )
					end
				end
				
				if not f117_local1 then
					table.insert( f117_local0, {
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f119_arg0, f119_arg1, f119_arg2, f119_arg3, f119_arg4 )
								GoBack( f119_arg4, f119_arg2 )
								f117_local2( f119_arg2 )
							end
						}
					} )
					table.insert( f117_local0, {
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f120_arg0, f120_arg1, f120_arg2, f120_arg3, f120_arg4 )
								GoBack( f120_arg4, f120_arg2 )
							end,
							selectIndex = true
						}
					} )
				else
					table.insert( f117_local0, {
						models = {
							displayText = Engine.Localize( "MENU_SAVE_CLIP" )
						},
						properties = {
							action = function ( f121_arg0, f121_arg1, f121_arg2, f121_arg3, f121_arg4 )
								StartMenuUploadClip( f121_arg0, f121_arg1, f121_arg2, f121_arg3, f121_arg4 )
							end,
							selectIndex = true
						}
					} )
					table.insert( f117_local0, {
						models = {
							displayText = Engine.Localize( "MENU_END_FILM_WITHOUT_SAVING" )
						},
						properties = {
							action = function ( f122_arg0, f122_arg1, f122_arg2, f122_arg3, f122_arg4 )
								GoBack( f122_arg4, f122_arg2 )
								f117_local2( f122_arg2 )
							end
						}
					} )
					table.insert( f117_local0, {
						models = {
							displayText = Engine.Localize( "MENU_CANCEL" )
						},
						properties = {
							action = function ( f123_arg0, f123_arg1, f123_arg2, f123_arg3, f123_arg4 )
								GoBack( f123_arg4, f123_arg2 )
							end
						}
					} )
				end
				return f117_local0
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
		postCreateStep = function ( f124_arg0, f124_arg1 )
			f124_arg0.anyControllerAllowed = true
		end,
		title = "MENU_NOTICE",
		description = "MENU_UPDATE_NEEDED",
		categoryType = CoD.OverlayUtility.OverlayTypes.Connection,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		listDatasource = function ( f125_arg0 )
			DataSources.UpdateNeededPopupList = DataSourceHelpers.ListSetup( "UpdateNeededPopupList", function ( f126_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_OK" )
						},
						properties = {
							action = function ( f127_arg0, f127_arg1, f127_arg2, f127_arg3, f127_arg4 )
								CoD.LobbyBase.FailedDWConnection = true
								GoBack( f127_arg4, f127_arg2 )
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
		postCreateStep = function ( f128_arg0, f128_arg1 )
			f128_arg0.unusedControllerAllowed = true
			local f128_local0 = 0
			if f128_arg0.layout and f128_arg0.layout.frameWidget and f128_arg0.layout.frameWidget.framedWidget then
				f128_arg0.layout.frameWidget.framedWidget:playClip( "LoadingLoop" )
			end
			f128_arg0:addElement( LUI.UITimer.newElementTimer( 400, false, function ( f129_arg0 )
				if Engine.AreLocalFilesReady( f128_arg1 ) == true then
					GoBack( f128_arg0, f128_arg1 )
					return 
				elseif f128_local0 > CoD.OverlayUtility.LOCAL_FILES_FETCH_WAIT_TIME then
					GoBack( f128_arg0, f128_arg1 )
					return 
				else
					f128_local0 = f128_local0 + f129_arg0.timeElapsed
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
		postCreateStep = function ( f130_arg0, f130_arg1 )
			f130_arg0.unusedControllerAllowed = true
			local f130_local0 = 0
			if f130_arg0.layout and f130_arg0.layout.frameWidget and f130_arg0.layout.frameWidget.framedWidget then
				f130_arg0.layout.frameWidget.framedWidget:playClip( "LoadingLoop" )
			end
			Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.beginPlay" ), Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_INVALID )
			f130_arg0:addElement( LUI.UITimer.newElementTimer( 400, false, function ( f131_arg0 )
				if CoD.isPC and Engine.SteamVacBanned( Engine.GetPrimaryController() ) then
					CoD.LobbyBase.FailedDWConnection = true
					GoBack( f130_arg0, f130_arg1 )
					LuaUtils.UI_ShowErrorMessageDialog( f130_arg1, "PLATFORM_VACBANNED" )
					return 
				elseif Engine.IsDemonwareFetchingDone( f130_arg1 ) then
					CoD.LobbyBase.FailedDWConnection = false
					local f131_local0 = LobbyData.GetLobbyNav()
					if f130_arg1 == Engine.GetPrimaryController() then
						if f131_local0 == LobbyData.UITargets.UI_MODESELECT.id then
							Engine.LobbyVM_CallFunc( "NetworkModeChanged", {
								controller = f130_arg1,
								networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
							} )
						elseif f131_local0 == LobbyData.UITargets.UI_MAIN.id then
							LuaUtils.SetNetworkMode( f130_arg1, Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
						end
					end
					GoBack( f130_arg0, f130_arg1 )
					if f131_local0 == LobbyData.UITargets.UI_MAIN.id and Dvar.lobby_beginPlay:exists() then
						Dvar.lobby_beginPlay:set( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
					end
					return 
				end
				local f131_local0 = Engine.CheckNetConnection()
				if Engine.IsLPCBusy() then
					local f131_local1 = Engine.GetLPCCompletionPercentage()
					if f131_local1 == 0 or f131_local1 == 100 then
						CoD.OverlayUtility.Overlays[f130_arg0.menuName].description = Engine.Localize( "MENU_CHECKING_FILES" )
					else
						CoD.OverlayUtility.Overlays[f130_arg0.menuName].description = Engine.Localize( "MENU_DOWNLOAD_IN_PROGRESS" ) .. "\n" .. f131_local1 .. "%"
					end
					f130_arg0:refreshData( nil )
					f130_local0 = 0
				elseif CoD.OverlayUtility.CONNECTINGDW_MAX_WAIT_TIME < f130_local0 or f131_local0 == false then
					local f131_local1 = GoBack( f130_arg0, f130_arg1 )
					local f131_local2 = ""
					local f131_local3 = "MENU_NOTICE_CAPS"
					if f131_local0 == false then
						f131_local2 = "XBOXLIVE_NETCONNECTION"
					else
						local f131_local4, f131_local5 = Engine.GetSystemInfo( f130_arg1, CoD.SYSINFO_CONNECTIVITY_INFO )
						if Engine.DvarBool( nil, "systemUnderMaintenance" ) == true then
							f131_local2 = Engine.Localize( "MENU_SYSTEM_UNDER_MAINTENANCE", Engine.Localize( "MENU_BLACKOPS_CAPS" ) )
						else
							f131_local2 = Engine.Localize( "PLATFORM_DEMONWARE_DISCONNECT" ) .. "\n\n" .. Engine.Localize( "MENU_ERROR_CODE", f131_local4 )
						end
						if f131_local1 ~= nil and f131_local1.id == "Menu.Main" then
							f131_local3 = "MENU_CONNECTIVITY_NOTICE_CAPS"
						end
						if Engine.IsShipBuild() == false then
							f131_local2 = f131_local2 .. "\n\n\tDEBUG INFO:\n" .. f131_local5
						end
					end
					CoD.LobbyBase.FailedDWConnection = true
					LuaUtils.UI_ShowErrorMessageDialog( f130_arg1, f131_local2, f131_local3 )
				end
				f130_local0 = f130_local0 + f131_arg0.timeElapsed
			end ) )
		end,
		title = "MENU_CONNECTING_DW",
		description = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.Connection,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	LobbyPlayNetworkModePopup = {
		menuName = CoD.OverlayUtility.AutoSizeMenuFromDescription( "LobbyPlayNetworkModePopup" ),
		title = function ( f132_arg0 )
			local f132_local0 = ""
			if f132_arg0 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
				f132_local0 = "PLATFORM_XBOX_LIVE_CAPS"
			elseif f132_arg0 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
				f132_local0 = "MENU_PLAY_LOCAL_CAPS"
			end
			return Engine.Localize( f132_local0 )
		end,
		description = function ( f133_arg0 )
			local f133_local0 = ""
			if f133_arg0 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
				if Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 1 then
					f133_local0 = "XBOXLIVE_PLAY_ONLINE_AND_DISBAND_DESC"
				else
					f133_local0 = "XBOXLIVE_PLAY_ONLINE_DESC"
				end
			elseif f133_arg0 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
				if Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 1 then
					f133_local0 = "XBOXLIVE_DISBAND_AND_PLAY_LOCAL_DESC"
				else
					f133_local0 = "XBOXLIVE_PLAY_LOCAL_DESC"
				end
			end
			return Engine.Localize( f133_local0 )
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Connection,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		listDatasource = function ( f134_arg0 )
			DataSources.LobbyPlayNetworkModePopupButtons = DataSourceHelpers.ListSetup( "LobbyPlayNetworkModePopupButtons", function ( f135_arg0 )
				local f135_local0 = ""
				if f134_arg0 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
					f135_local0 = "XBOXLIVE_PLAY_ONLINE"
				elseif f134_arg0 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
					f135_local0 = "MENU_PLAY_LOCAL"
				end
				return {
					{
						models = {
							displayText = Engine.Localize( f135_local0 )
						},
						properties = {
							action = function ( f136_arg0, f136_arg1, f136_arg2, f136_arg3, f136_arg4 )
								LobbyToggleNetwork( f136_arg0, f136_arg1, f136_arg2, f136_arg3 )
								GoBack( f136_arg4, f136_arg2 )
							end
							,
							actionParam = f134_arg0
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_CANCEL" )
						},
						properties = {
							action = function ( f137_arg0, f137_arg1, f137_arg2, f137_arg3, f137_arg4 )
								GoBack( f137_arg4, f137_arg2 )
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
			DataSources.FreerunEndGameButtons = DataSourceHelpers.ListSetup( "FreerunEndGameButtons", function ( f139_arg0 )
				return {
					{
						models = {
							displayText = "MENU_FR_RESTART_COURSE"
						},
						properties = {
							action = function ( f140_arg0, f140_arg1, f140_arg2, f140_arg3, f140_arg4 )
								GoBack( f140_arg0, f140_arg2 )
								Engine.LockInput( f140_arg2, false )
								Engine.SendMenuResponse( f140_arg2, "freerun_endgame_popup", "fr_restart" )
							end
							
						}
					},
					{
						models = {
							displayText = "MENU_QUIT_GAME_CAPS"
						},
						properties = {
							action = function ( f141_arg0, f141_arg1, f141_arg2, f141_arg3, f141_arg4 )
								GoBack( f141_arg0, f141_arg2 )
								CoDShared.QuitGame( f141_arg2 )
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
		title = function ( f142_arg0, f142_arg1 )
			return "MENU_ATTACHMENT_RESTRICTION_OPTIONS"
		end,
		description = function ( f143_arg0, f143_arg1 )
			return ""
		end,
		image = function ( f144_arg0, f144_arg1 )
			local f144_local0 = f144_arg1:getModel()
			if f144_local0 then
				return Engine.GetModelValue( Engine.GetModel( f144_local0, "image" ) )
			else
				return ""
			end
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		openMethod = CoD.OverlayUtility.OpenMethods.Overlay,
		frameWidget = "CoD.GameSettings_AttachmentOptionsPopup",
		[CoD.OverlayUtility.GoBackPropertyName] = function ()
			return function ( f146_arg0, f146_arg1, f146_arg2, f146_arg3 )
				Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings.Update" ) )
				GoBack( f146_arg0, f146_arg2 )
			end
			
		end,
		listDatasource = function ( f147_arg0, f147_arg1 )
			DataSources.CompetitiveSettingsAttachment = DataSourceHelpers.ListSetup( "CompetitiveSettingsAttachment", function ()
				local f148_local0 = f147_arg1:getModel()
				local f148_local1 = Engine.GetModelValue( Engine.GetModel( f148_local0, "attachmentIndex" ) )
				local f148_local2 = Engine.GetModelValue( Engine.GetModel( f148_local0, "title" ) )
				local f148_local3 = Engine.GetModelValue( Engine.GetModel( f148_local0, "description" ) )
				local f148_local4 = Engine.GetModelValue( Engine.GetModel( f148_local0, "image" ) )
				local f148_local5 = {}
				table.insert( f148_local5, CoD.OptionsUtility.CreateItemRestrictionSettings( f147_arg0, f148_local2, "", "Attachment_" .. f148_local2, CoD.GameSettingsUtility.GetGroupRestrictionOptions(), f148_local4, CoD.OptionsUtility.GametypeSettingsSetAttachmentRestrictionState, {
					attachmentIndex = f148_local1
				}, function ( f149_arg0 )
					if Engine.AttachmentRestrictionStateChangedForAnyWeapon( f149_arg0.attachmentIndex ) == true then
						return -1
					else
						return Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_NONE
					end
				end ) )
				return f148_local5
			end, nil, nil, function ( f150_arg0, f150_arg1, f150_arg2 )
				local f150_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" ), "Update" )
				if f150_arg1.updateSubscription then
					f150_arg1:removeSubscription( f150_arg1.updateSubscription )
				end
				f150_arg1.updateSubscription = f150_arg1:subscribeToModel( f150_local0, function ()
					f150_arg1:updateDataSource( false )
				end, false )
			end )
			return "CompetitiveSettingsAttachment"
		end
	},
	CheckingRestrictions = {
		menuName = "SystemOverlay_Compact",
		title = Engine.Localize( "PLATFORM_CHECKING_RESTRICTIONS_TITLE" ),
		description = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.Connection,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		postCreateStep = function ( f152_arg0, f152_arg1 )
			f152_arg0.unusedControllerAllowed = true
			local f152_local0 = 0
			if f152_arg0.layout and f152_arg0.layout.frameWidget and f152_arg0.layout.frameWidget.framedWidget then
				f152_arg0.layout.frameWidget.framedWidget:playClip( "LoadingLoop" )
			end
			f152_arg0:addElement( LUI.UITimer.newElementTimer( 400, false, function ( f153_arg0 )
				if Engine.IsCurrentlyCheckingContentRestrictions( f152_arg1 ) == false then
					if Engine.HasCompletedCheckingRestrictions( f152_arg1 ) then
						CoD.LobbyBase.FailedDWConnection = false
						local f153_local0 = LobbyData.GetLobbyNav()
						if f153_local0 == LobbyData.UITargets.UI_MODESELECT.id then
							Engine.LobbyVM_CallFunc( "NetworkModeChanged", {
								controller = f152_arg1,
								networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
							} )
						elseif f153_local0 == LobbyData.UITargets.UI_MAIN.id then
							LuaUtils.SetNetworkMode( f152_arg1, Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
						end
						GoBack( f152_arg0, f152_arg1 )
						if f153_local0 == LobbyData.UITargets.UI_MAIN.id and Dvar.lobby_beginPlay:exists() then
							Dvar.lobby_beginPlay:set( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
						end
						return 
					end
					local f153_local0 = LobbyData.GetLobbyNav()
					if f153_local0 == LobbyData.UITargets.UI_MODESELECT.id then
						Engine.LobbyVM_CallFunc( "NetworkModeChanged", {
							controller = f152_arg1,
							networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN
						} )
					elseif f153_local0 == LobbyData.UITargets.UI_MAIN.id then
						LuaUtils.SetNetworkMode( f152_arg1, Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN )
					end
					GoBack( f152_arg0, f152_arg1 )
					if f153_local0 == LobbyData.UITargets.UI_MAIN.id and Dvar.lobby_beginPlay:exists() then
						Dvar.lobby_beginPlay:set( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN )
					end
					return 
				else
					
				end
			end ) )
		end
	},
	LoginQueued = {
		menuName = "SystemOverlay_Compact",
		title = Engine.Localize( "MENU_LOGIN_QUEUE_DEFAULT" ),
		description = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.Connection,
		listDatasource = function ()
			DataSources.LoginQueue_List = DataSourceHelpers.ListSetup( "LoginQueue_List", function ( f155_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_PLAY_LOCAL" )
						},
						properties = {
							action = function ( f156_arg0, f156_arg1, f156_arg2, f156_arg3, f156_arg4 )
								Engine.LeaveQueue( f156_arg2 )
								CoD.LobbyBase.FailedDWConnection = true
								GoBack( f156_arg4, f156_arg2 )
							end
							
						}
					}
				}
			end, true, nil )
			return "LoginQueue_List"
		end,
		postCreateStep = function ( f157_arg0, f157_arg1 )
			local f157_local0 = 0
			if f157_arg0.layout and f157_arg0.layout.frameWidget and f157_arg0.layout.frameWidget.framedWidget then
				f157_arg0.layout.frameWidget.framedWidget:playClip( "LoadingLoop" )
			end
			f157_arg0:addElement( LUI.UITimer.newElementTimer( 400, false, function ( f158_arg0 )
				local f158_local0 = Engine.GetPlayerQueueInfo( f157_arg1 )
				if Engine.IsPlayerQueued( f157_arg1 ) then
					if f158_local0 ~= nil then
						local f158_local1 = f158_local0.position
						local f158_local2 = f158_local0.eta
						if f158_local1 > 0 and f158_local2 > 0 then
							local f158_local3 = math.floor( f158_local2 / 60 )
							local f158_local4 = f158_local2 % 60
							local f158_local5 = math.floor( f158_local3 / 60 )
							local f158_local6 = f158_local3 % 60
							local f158_local7 = math.floor( f157_local0 / 1000 / 60 )
							CoD.OverlayUtility.Overlays[f157_arg0.menuName].description = Engine.Localize( "MENU_LOGIN_QUEUE", f158_local1, f158_local5, f158_local6, f158_local4, math.floor( f158_local7 / 60 ), f158_local7 % 60, math.floor( f157_local0 / 1000 ) % 60 )
							f157_arg0:refreshData( nil )
						end
					end
				elseif f158_local0 == nil or not f158_local0.success then
					local f158_local1 = "PLATFORM_DEMONWARE_DISCONNECT"
					local f158_local2 = GoBack( f157_arg0, f157_arg1 )
					LuaUtils.UI_ShowErrorMessageDialog( f157_arg1, f158_local1, "MENU_NOTICE_CAPS" )
					CoD.LobbyBase.FailedDWConnection = true
					Engine.LeaveQueue( f157_arg1 )
				else
					CoD.OverlayUtility.CreateOverlay( f157_arg1, GoBack( f157_arg0, f157_arg1 ), "ConnectingToDemonware" )
				end
				f157_local0 = f157_local0 + f158_arg0.timeElapsed
			end ) )
		end
	},
	PaintjobClearConfirmationOverlay = {
		menuName = "SystemOverlay_Compact",
		title = "MENU_PAINTJOB_DELETE_CONFIRMATION",
		description = "MENU_CANNOT_UNDO",
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ()
			DataSources.PaintjobClearConfirmation_List = DataSourceHelpers.ListSetup( "PaintjobClearConfirmation_List", function ( f160_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f161_arg0, f161_arg1, f161_arg2, f161_arg3, f161_arg4 )
								PaintjobSelector_ClearPaintjob( f161_arg4, f161_arg1, f161_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f162_arg0, f162_arg1, f162_arg2, f162_arg3, f162_arg4 )
								GoBack( f162_arg4, f162_arg2 )
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
	LeaderboardClearCustomConfirmationOverlay = {
		menuName = "SystemOverlay_Compact",
		title = function ( f163_arg0, f163_arg1 )
			local f163_local0 = "MENU_LB_CLEAR_CURRENT_CONFIRMATION_TITLE"
			if f163_arg1.resetAction == 0 then
				f163_local0 = "MENU_LB_CLEAR_ALL_CONFIRMATION_TITLE"
			end
			return Engine.Localize( f163_local0 )
		end,
		description = function ( f164_arg0, f164_arg1 )
			local f164_local0 = "MENU_LB_CLEAR_CURRENT_CONFIRMATION_MESSAGE"
			if f164_arg1.resetAction == 0 then
				f164_local0 = "MENU_LB_CLEAR_ALL_CONFIRMATION_MESSAGE"
			end
			return Engine.Localize( f164_local0 )
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ( f165_arg0, f165_arg1 )
			DataSources.LeaderboardClearCustomConfirmation_List = DataSourceHelpers.ListSetup( "LeaderboardClearCustomConfirmation_List", function ( f166_arg0, f166_arg1 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f167_arg0, f167_arg1, f167_arg2, f167_arg3, f167_arg4 )
								if f165_arg1.resetAction == 0 then
									Engine.ExecNow( f167_arg2, "ClearCustomLeaderboards" )
								elseif f165_arg1.resetAction == 1 then
									local f167_local0 = Engine.GetModel( Engine.GetGlobalModel(), "leaderboardDef" )
									if f167_local0 ~= nil then
										Engine.ExecNow( f167_arg2, "resetLeaderboard " .. Engine.GetModelValue( f167_local0 ) .. " MPUI_CUSTOM_LEADERBOARD_RESET_FAILED" )
									end
								end
								GoBack( GoBack( f167_arg4, f167_arg2 ), f167_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f168_arg0, f168_arg1, f168_arg2, f168_arg3, f168_arg4 )
								GoBack( f168_arg4, f168_arg2 )
							end
							,
							selectIndex = true
						}
					}
				}
			end, true, nil )
			return "LeaderboardClearCustomConfirmation_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	InitialCODPointsOverlay = {
		menuName = "SystemOverlay_Compact",
		title = Engine.ToUpper( Engine.Localize( "MENU_CODPOINTS_INTRO_HEADER" ) ),
		description = "MENU_CODPOINTS_INTRO_DESC",
		categoryType = CoD.OverlayUtility.OverlayTypes.CODPoints,
		listDatasource = function ()
			DataSources.InitialCODPoints_List = DataSourceHelpers.ListSetup( "InitialCODPoints_List", function ( f170_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_OK" )
						},
						properties = {
							action = function ( f171_arg0, f171_arg1, f171_arg2, f171_arg3, f171_arg4 )
								local f171_local0 = Engine.StorageGetBuffer( f171_arg2, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
								if f171_local0 then
									f171_local0.codPointMsgSeen:set( 1 )
									Engine.StorageWrite( f171_arg2, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
								end
								OpenBlackMarketIncentivePopup( GoBack( f171_arg4, f171_arg2 ), f171_arg2 )
							end
							
						}
					}
				}
			end, true, nil )
			return "InitialCODPoints_List"
		end
	},
	RetailIncentiveOverlay = {
		menuName = "SystemOverlay_Compact",
		title = Engine.ToUpper( Engine.Localize( "MENU_RETAIL_INCENTIVE_TITLE" ) ),
		description = "MENU_RETAIL_INCENTIVE_DESC",
		categoryType = CoD.OverlayUtility.OverlayTypes.RetailIncentive,
		listDatasource = function ()
			DataSources.RetailIncentive_List = DataSourceHelpers.ListSetup( "RetailIncentive_List", function ( f173_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_OK" )
						},
						properties = {
							action = function ( f174_arg0, f174_arg1, f174_arg2, f174_arg3, f174_arg4 )
								local f174_local0 = Engine.StorageGetBuffer( f174_arg2, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
								if f174_local0 then
									f174_local0.retailIncentiveMsgSeen:set( 1 )
									Engine.StorageWrite( f174_arg2, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
								end
								OpenBlackMarketIncentivePopup( GoBack( f174_arg4, f174_arg2 ), f174_arg2 )
							end
							
						}
					}
				}
			end, true, nil )
			return "RetailIncentive_List"
		end
	},
	SeasonPassIncentiveOverlay = {
		menuName = "SystemOverlay_Full",
		title = Engine.ToUpper( Engine.Localize( "MPUI_BM_INCENTIVE_SEASONPASS_TITLE" ) ),
		description = "MPUI_BM_INCENTIVE_SEASONPASS_DESC",
		categoryType = CoD.OverlayUtility.OverlayTypes.SeasonPassIncentive,
		listDatasource = function ()
			DataSources.SeasonPassIncentive_List = DataSourceHelpers.ListSetup( "SeasonPassIncentive_List", function ( f176_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_OK" )
						},
						properties = {
							action = function ( f177_arg0, f177_arg1, f177_arg2, f177_arg3, f177_arg4 )
								local f177_local0 = Engine.StorageGetBuffer( f177_arg2, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
								if f177_local0 then
									f177_local0.spIncentiveMsgSeen:set( 1 )
									Engine.StorageWrite( f177_arg2, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
								end
								OpenBlackMarketIncentivePopup( GoBack( f177_arg4, f177_arg2 ), f177_arg2 )
							end
							
						}
					}
				}
			end, true, nil )
			return "SeasonPassIncentive_List"
		end
	},
	SeasonPassExlpoitOverlay = {
		menuName = "SystemOverlay_Compact",
		title = Engine.Localize( "MENU_NOTICE" ),
		description = "MENU_SP_INCENTIVE_EXPLOIT",
		categoryType = CoD.OverlayUtility.OverlayTypes.Notice,
		listDatasource = function ()
			DataSources.SeasonPassExlpoit_List = DataSourceHelpers.ListSetup( "SeasonPassExlpoit_List", function ( f179_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_OK" )
						},
						properties = {
							action = function ( f180_arg0, f180_arg1, f180_arg2, f180_arg3, f180_arg4 )
								local f180_local0 = Engine.StorageGetBuffer( f180_arg2, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
								if f180_local0 then
									f180_local0.spIncentiveExploitMsgSeen:set( 1 )
									Engine.StorageWrite( f180_arg2, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
								end
								OpenBlackMarketIncentivePopup( GoBack( f180_arg4, f180_arg2 ), f180_arg2 )
							end
							
						}
					}
				}
			end, true, nil )
			return "SeasonPassExlpoit_List"
		end
	},
	DigitalIncentiveOverlay = {
		menuName = "SystemOverlay_Compact",
		title = Engine.ToUpper( Engine.Localize( "MENU_DIGITAL_INCENTIVE_TITLE" ) ),
		description = "MENU_DIGITAL_INCENTIVE_DESC",
		categoryType = CoD.OverlayUtility.OverlayTypes.DigitalIncentive,
		listDatasource = function ()
			DataSources.DigitalIncentive_List = DataSourceHelpers.ListSetup( "DigitalIncentive_List", function ( f182_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_OK" )
						},
						properties = {
							action = function ( f183_arg0, f183_arg1, f183_arg2, f183_arg3, f183_arg4 )
								local f183_local0 = Engine.StorageGetBuffer( f183_arg2, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
								if f183_local0 then
									f183_local0.digitalIncentiveMsgSeen:set( 1 )
									Engine.StorageWrite( f183_arg2, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
								end
								OpenBlackMarketIncentivePopup( GoBack( f183_arg4, f183_arg2 ), f183_arg2 )
							end
							
						}
					}
				}
			end, true, nil )
			return "DigitalIncentive_List"
		end
	},
	GunsmithClearConfirmationOverlay = {
		menuName = "SystemOverlay_Compact",
		title = "MENU_GUNSMITH_DELETE_CONFIRMATION",
		description = "MENU_CANNOT_UNDO",
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ()
			DataSources.GunsmithClearConfirmation_List = DataSourceHelpers.ListSetup( "GunsmithClearConfirmation_List", function ( f185_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f186_arg0, f186_arg1, f186_arg2, f186_arg3, f186_arg4 )
								Gunsmith_ClearVariant( f186_arg4, f186_arg1, f186_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f187_arg0, f187_arg1, f187_arg2, f187_arg3, f187_arg4 )
								GoBack( f187_arg4, f187_arg2 )
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
			DataSources.EmblemClearConfirmation_List = DataSourceHelpers.ListSetup( "EmblemClearConfirmation_List", function ( f189_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f190_arg0, f190_arg1, f190_arg2, f190_arg3, f190_arg4 )
								EmblemSelect_ClearEmblem( f190_arg4, f190_arg1, f190_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f191_arg0, f191_arg1, f191_arg2, f191_arg3, f191_arg4 )
								GoBack( f191_arg4, f191_arg2 )
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
	CustomGameClearConfirmationOverlay = {
		menuName = "SystemOverlay_Compact",
		title = "MENU_CUSTOMGAME_DELETE_CONFIRMATION",
		description = "MENU_CANNOT_UNDO",
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ()
			DataSources.CustomGameClearConfirmation_List = DataSourceHelpers.ListSetup( "CustomGameClearConfirmation_List", function ( f193_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = CustomGameSelector_Delete
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f194_arg0, f194_arg1, f194_arg2, f194_arg3, f194_arg4 )
								GoBack( f194_arg4, f194_arg2 )
							end
							,
							selectIndex = true
						}
					}
				}
			end, true, nil )
			return "CustomGameClearConfirmation_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	GunsmithSaveVariant = {
		menuName = "SystemOverlay_Full",
		frameWidget = "CoD.systemOverlay_SaveVariantFrame",
		title = Engine.Localize( "MENU_GUNSMITH_SAVE_CHANGES_TITLE" ),
		description = function ( f195_arg0, f195_arg1 )
			return Engine.Localize( LocalizeWeaponNameIntoString( "MENU_GUNSMITH_SAVE_CHANGES_SUBTITLE", "mp", f195_arg0, CoD.GetCustomization( f195_arg0, "weapon_index" ) ) )
		end,
		image = function ( f196_arg0, f196_arg1 )
			local f196_local0 = f196_arg1:getModel()
			if f196_local0 then
				local f196_local1 = Engine.GetModel( f196_local0, "variantIndex" )
				if f196_local1 then
					return Engine.GetModelValue( f196_local1 )
				end
			end
			return ""
		end,
		variantName = function ( f197_arg0, f197_arg1 )
			local f197_local0 = f197_arg1:getModel()
			if f197_local0 then
				local f197_local1 = Engine.GetModel( f197_local0, "variantName" )
				if f197_local1 then
					return Engine.GetModelValue( f197_local1 )
				end
			end
			return ""
		end,
		weaponName = function ( f198_arg0, f198_arg1 )
			local f198_local0 = f198_arg1:getModel()
			if f198_local0 then
				local f198_local1 = Engine.GetModel( f198_local0, "weaponIndex" )
				if f198_local1 then
					local f198_local2 = Engine.GetModelValue( f198_local1 )
					if Engine.GetItemName( f198_local2 ) then
						return Engine.ToUpper( Engine.Localize( Engine.GetItemName( f198_local2 ) ) )
					end
				end
			end
			return ""
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Save,
		listDatasource = function ( f199_arg0, f199_arg1 )
			DataSources.GunsmithSaveVariant_List = DataSourceHelpers.ListSetup( "GunsmithSaveVariant_List", function ( f200_arg0 )
				return {
					{
						models = {
							displayText = LocalizeToUpperString( "MENU_SAVE" )
						},
						properties = {
							action = function ( f201_arg0, f201_arg1, f201_arg2, f201_arg3, f201_arg4 )
								if Gunsmith_IsCurrentVariantChanged( f201_arg2 ) then
									Gunsmith_ClearSelectedGunsmithVariantStats( f201_arg2 )
									Gunsmith_ClearCACWithUpdatedVariant( f201_arg4, f201_arg2 )
								end
								Gunsmith_SaveChangesButtonAction( f201_arg4, f201_arg1, "save", f201_arg2 )
								ForceNotifyModel( f201_arg2, "Gunsmith.UpdateDataSource" )
							end
							
						}
					},
					{
						models = {
							displayText = LocalizeToUpperString( "MENU_DISCARD" )
						},
						properties = {
							action = function ( f202_arg0, f202_arg1, f202_arg2, f202_arg3, f202_arg4 )
								Gunsmith_SaveChangesButtonAction( f202_arg0, f202_arg1, "discard", f202_arg2 )
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
		postCreateStep = function ( f203_arg0, f203_arg1 )
			PaintjobEditor_RemoveGrid( f203_arg1 )
		end,
		inputText = function ( f204_arg0 )
			if f204_arg0 then
				return Engine.GetModelValue( Engine.GetModel( f204_arg0, "emblemTextEntry" ) )
			else
				
			end
		end,
		listDatasource = function ( f205_arg0 )
			DataSources.EmblemSave_List = DataSourceHelpers.ListSetup( "EmblemSave_List", function ( f206_arg0 )
				local f206_local0 = nil
				if IsPreBuiltEmblemTab( f206_arg0 ) then
					f206_local0 = LocalizeToUpperString( "MENU_EMBLEM_SAVE_AS_NEW" )
				else
					f206_local0 = LocalizeToUpperString( "MENU_EMBLEM_SAVE_CHANGES" )
				end
				return {
					{
						models = {
							displayText = f206_local0
						},
						properties = {
							action = function ( f207_arg0, f207_arg1, f207_arg2, f207_arg3, f207_arg4 )
								EmblemEditor_SaveEmblem( f207_arg4, f207_arg1, f207_arg2, f205_arg0 )
								ForceNotifyModel( f207_arg2, "Emblem.UpdateDataSource" )
							end
							
						}
					},
					{
						models = {
							displayText = LocalizeToUpperString( "MENU_EMBLEMS_DISCARD" )
						},
						properties = {
							action = function ( f208_arg0, f208_arg1, f208_arg2, f208_arg3, f208_arg4 )
								EmblemEditor_DiscardChanges( f208_arg4, f208_arg1, f208_arg2, f205_arg0 )
							end
							
						}
					}
				}
			end, true, nil )
			return "EmblemSave_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ( f209_arg0 )
			return function ( f210_arg0, f210_arg1, f210_arg2, f210_arg3 )
				GoBack( f210_arg3, f210_arg2 )
				PaintjobEditor_RestoreGridState( f210_arg2 )
			end
			
		end,
		[CoD.OverlayUtility.ProcessActionKeyboardComplete] = function ( f211_arg0 )
			return function ( f212_arg0, f212_arg1, f212_arg2, f212_arg3 )
				ShowKeyboard( f212_arg0, f212_arg1, f212_arg2, "KEYBOARD_TYPE_EMBLEMS" )
			end
			
		end
	},
	PaintjobSave = {
		menuName = "SystemOverlay_Full",
		frameWidget = "CoD.systemOverlay_SavePaintjobFrame",
		title = Engine.Localize( "MENU_SAVE_PAINTJOB" ),
		description = Engine.Localize( "MENU_SAVE_PAINTJOB_DESC" ),
		categoryType = CoD.OverlayUtility.OverlayTypes.Save,
		inputText = function ( f213_arg0 )
			if f213_arg0 then
				return Engine.GetModelValue( Engine.GetModel( f213_arg0, "paintjobTextEntry" ) )
			else
				
			end
		end,
		listDatasource = function ( f214_arg0 )
			DataSources.PaintjobSave_List = DataSourceHelpers.ListSetup( "PaintjobSave_List", function ( f215_arg0 )
				return {
					{
						models = {
							displayText = LocalizeToUpperString( "MENU_EMBLEM_SAVE_CHANGES" )
						},
						properties = {
							action = function ( f216_arg0, f216_arg1, f216_arg2, f216_arg3, f216_arg4 )
								PaintjobEditor_SavePaintjob( f216_arg0, f216_arg1, f216_arg2, f214_arg0 )
								ForceNotifyModel( f216_arg2, "Paintshop.UpdateDataSource" )
							end
							
						}
					},
					{
						models = {
							displayText = LocalizeToUpperString( "MENU_EMBLEMS_DISCARD" )
						},
						properties = {
							action = function ( f217_arg0, f217_arg1, f217_arg2, f217_arg3, f217_arg4 )
								PaintjobEditor_DiscardChanges( f217_arg4, f217_arg1, f217_arg2, f214_arg0 )
							end
							
						}
					}
				}
			end, true, nil )
			return "PaintjobSave_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		[CoD.OverlayUtility.ProcessActionKeyboardComplete] = function ( f218_arg0 )
			return function ( f219_arg0, f219_arg1, f219_arg2, f219_arg3 )
				ShowKeyboard( f219_arg0, f219_arg1, f219_arg2, "KEYBOARD_TYPE_PAINTJOB" )
			end
			
		end
	},
	DailyChallengeWarningOverlay = {
		menuName = "SystemOverlay_Full",
		frameWidget = "CoD.systemOverlay_DailyChallengeWarningFrame",
		categoryType = CoD.OverlayUtility.OverlayTypes.Notice,
		title = "MENU_ABANDON_CHALLENGE_QUESTION",
		description = "MENU_ABANDON_CHALLENGE_DESC",
		listDatasource = function ()
			DataSources.DailyChallengeWarningOverlay = DataSourceHelpers.ListSetup( "DailyChallengeWarningOverlay", function ( f221_arg0 )
				return {
					{
						models = {
							displayText = LocalizeToUpperString( "MENU_DISMISS" )
						},
						properties = {
							action = function ( f222_arg0, f222_arg1, f222_arg2, f222_arg3, f222_arg4 )
								HandleGoBackFromDailyChallenge( nil, nil, f222_arg2 )
								GoBack( f222_arg4, f222_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = LocalizeToUpperString( "MENU_ABANDON_CHALLENGE" )
						},
						properties = {
							action = function ( f223_arg0, f223_arg1, f223_arg2, f223_arg3, f223_arg4 )
								local f223_local0 = Engine.GetPlayerStats( f223_arg2, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_ZOMBIES )
								local f223_local1 = f223_local0.PlayerStatsList.ZM_CURRENT_DAILY_CHALLENGE.statValue:get()
								local f223_local2 = Engine.GetDailyChallengeInfo( f223_arg2, Enum.eModes.MODE_ZOMBIES, f223_local1 )
								local f223_local3 = f223_local0.PlayerStatsList.ZM_DAILY_CHALLENGE_INGAME_TIME.statValue:get()
								local f223_local4 = f223_local0.PlayerStatsList.ZM_DAILY_CHALLENGE_START_TIME.statValue:get()
								local f223_local5 = f223_local0.PlayerStatsList.ZM_DAILY_CHALLENGE_GAMES_PLAYED.statValue:get()
								LUI.CoDMetrics.DailyChallengeAbandonedEvent( f223_arg2, f223_local1, f223_local4, f223_local2[1].currChallengeStatValue, f223_local3, f223_local5 )
								Engine.RecordDailyChallengeAbandoned( f223_arg2, f223_local1, f223_local4, f223_local2[1].currChallengeStatValue, f223_local3, f223_local5 )
								Engine.AbandonDailyChallenge( f223_arg2 )
								HandleGoBackFromDailyChallenge( nil, nil, f223_arg2 )
								GoBack( f223_arg4, f223_arg2 )
							end
							
						}
					}
				}
			end, true, nil )
			return "DailyChallengeWarningOverlay"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ( f224_arg0, f224_arg1, f224_arg2, f224_arg3 )
			return function ( f225_arg0, f225_arg1, f225_arg2 )
				OpenSystemOverlay( f225_arg0, GoBack( f225_arg1, f225_arg2 ), f225_arg2, "InspectDailyChallengeOverlay", nil )
			end
			
		end
	},
	InspectDailyChallengeOverlay = {
		menuName = "SystemOverlay_Full",
		frameWidget = "CoD.systemOverlay_DailyChallengeFrame",
		categoryType = CoD.OverlayUtility.OverlayTypes.Notice,
		title = function ( f226_arg0, f226_arg1 )
			CoD.perController[f226_arg0].dailyChallengeInfo = CoD.ChallengesUtility.GetDailyChallenge( f226_arg0, Enum.eModes.MODE_ZOMBIES )
			if not CoD.perController[f226_arg0].dailyChallengeInfo then
				return ""
			else
				return CoD.perController[f226_arg0].dailyChallengeInfo.challengeName
			end
		end,
		description = function ( f227_arg0, f227_arg1 )
			if not CoD.perController[f227_arg0].dailyChallengeInfo then
				return ""
			else
				return CoD.perController[f227_arg0].dailyChallengeInfo.challengeDescription
			end
		end,
		image = function ( f228_arg0, f228_arg1 )
			if not CoD.perController[f228_arg0].dailyChallengeInfo then
				return ""
			else
				return CoD.perController[f228_arg0].dailyChallengeInfo.image
			end
		end,
		fractionText = function ( f229_arg0, f229_arg1 )
			if not CoD.perController[f229_arg0].dailyChallengeInfo then
				return ""
			else
				local f229_local0 = CoD.perController[f229_arg0].dailyChallengeInfo
				return Engine.Localize( "MPUI_X_SLASH_Y", f229_local0.currChallengeStatValue, f229_local0.targetVal )
			end
		end,
		progressPercentage = function ( f230_arg0, f230_arg1 )
			if not CoD.perController[f230_arg0].dailyChallengeInfo then
				return 0
			else
				return CoD.perController[f230_arg0].dailyChallengeInfo.percentComplete
			end
		end,
		rewardText = function ( f231_arg0, f231_arg1 )
			if not CoD.perController[f231_arg0].dailyChallengeInfo then
				return ""
			else
				return CoD.perController[f231_arg0].dailyChallengeInfo.rewardText
			end
		end,
		listDatasource = function ()
			DataSources.InspectDailyChallengeOverlay = DataSourceHelpers.ListSetup( "InspectDailyChallengeOverlay", function ( f233_arg0 )
				local f233_local0 = {}
				table.insert( f233_local0, {
					models = {
						displayText = LocalizeToUpperString( "MENU_DISMISS" )
					},
					properties = {
						action = function ( f234_arg0, f234_arg1, f234_arg2, f234_arg3, f234_arg4 )
							HandleGoBackFromDailyChallenge( nil, nil, f234_arg2 )
							GoBack( f234_arg4, f234_arg2 )
						end
					}
				} )
				if Engine.CanDailyChallengeBeAbandoned( f233_arg0 ) then
					table.insert( f233_local0, {
						models = {
							displayText = LocalizeToUpperString( "MENU_ABANDON_CHALLENGE" )
						},
						properties = {
							action = function ( f235_arg0, f235_arg1, f235_arg2, f235_arg3, f235_arg4 )
								OpenSystemOverlay( f235_arg0, GoBack( f235_arg4, f235_arg2 ), f235_arg2, "DailyChallengeWarningOverlay", nil )
							end
						}
					} )
				end
				return f233_local0
			end, true, nil )
			return "InspectDailyChallengeOverlay"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ()
			return function ( f237_arg0, f237_arg1, f237_arg2, f237_arg3 )
				HandleGoBackFromDailyChallenge( nil, nil, f237_arg2 )
				GoBack( f237_arg3, f237_arg2 )
			end
			
		end
	},
	GunsmithCreateVariantNameOverlay = {
		menuName = "SystemOverlay_Full",
		frameWidget = "CoD.systemOverlay_CreateVariantNameFrame",
		categoryType = CoD.OverlayUtility.OverlayTypes.Save,
		title = function ( f238_arg0, f238_arg1 )
			return Engine.Localize( LocalizeWeaponNameIntoString( "MENU_GUNSMITH_CREATE_VARIANT_NAME_TITLE", "mp", f238_arg0, CoD.GetCustomization( f238_arg0, "weapon_index" ) ) )
		end,
		description = "",
		inputText = function ( f239_arg0, f239_arg1 )
			local f239_local0 = f239_arg1:getModel()
			if f239_local0 then
				return Engine.GetModelValue( Engine.GetModel( f239_local0, "variantTextEntry" ) )
			else
				
			end
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ( f240_arg0, f240_arg1 )
			return function ( f241_arg0, f241_arg1, f241_arg2, f241_arg3 )
				Gunsmith_CreateVariantNameBack( f240_arg1, f241_arg1, f241_arg2 )
				GoBack( f241_arg3, f241_arg2 )
				ClearMenuSavedState( f241_arg3 )
			end
			
		end,
		[CoD.OverlayUtility.ProcessActionKeyboardComplete] = function ()
			return function ( f243_arg0, f243_arg1, f243_arg2, f243_arg3 )
				ShowKeyboard( f243_arg0, f243_arg1, f243_arg2, "KEYBOARD_TYPE_GUNSMITH" )
			end
			
		end,
		[CoD.OverlayUtility.ProcessConfirmVariantName] = function ( f244_arg0, f244_arg1 )
			return function ( f245_arg0, f245_arg1, f245_arg2, f245_arg3 )
				Gunsmith_ConfirmVariantName( f244_arg1, f245_arg1, f245_arg2, f245_arg3 )
			end
			
		end
	},
	CraftNoChangesNotification = {
		menuName = "SystemOverlay_Compact",
		title = "MENU_EMBLEM_NO_CHANGES_TITLE",
		description = "MENU_EMBLEM_NO_CHANGES_DESC",
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ()
			DataSources.CraftNoChangesNotification = DataSourceHelpers.ListSetup( "CraftNoChangesNotification", function ( f247_arg0 )
				return {
					{
						models = {
							displayText = "MENU_OK_CAPS"
						},
						properties = {
							action = function ( f248_arg0, f248_arg1, f248_arg2, f248_arg3, f248_arg4 )
								EmblemEditor_NoChangesAction( f248_arg0, f248_arg1, f248_arg2, f248_arg4 )
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
			DataSources.CampaignOfflineToOnlineWarning = DataSourceHelpers.ListSetup( "CampaignOfflineToOnlineWarning", function ( f250_arg0 )
				return {
					{
						models = {
							displayText = "MENU_OK_CAPS"
						},
						properties = {
							action = function ( f251_arg0, f251_arg1, f251_arg2, f251_arg3, f251_arg4 )
								GoBack( f251_arg4, f251_arg2 )
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
			DataSources.PublisherFilesChangedButtons = DataSourceHelpers.ListSetup( "PublisherFilesChangedButtons", function ( f253_arg0 )
				return {
					{
						models = {
							displayText = "MENU_CONFIRM_CAPS"
						},
						properties = {
							action = function ( f254_arg0, f254_arg1, f254_arg2, f254_arg3, f254_arg4 )
								Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "pubstorageFilesChanged" ), false )
								Engine.SetDvar( "live_pubSemaphoreUserTriggerTime", Engine.milliseconds() )
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
			DataSources.ResetPCControls_List = DataSourceHelpers.ListSetup( "ResetPCControls_List", function ( f256_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f257_arg0, f257_arg1, f257_arg2, f257_arg3, f257_arg4 )
								GoBack( f257_arg4, f257_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f258_arg0, f258_arg1, f258_arg2, f258_arg3, f258_arg4 )
								ResetPCControlsToDefault( f258_arg4, f258_arg1, f258_arg2 )
								GoBack( f258_arg4, f258_arg2 )
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
			DataSources.ApplyPCGraphics_List = DataSourceHelpers.ListSetup( "ApplyPCGraphics_List", function ( f260_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f261_arg0, f261_arg1, f261_arg2, f261_arg3, f261_arg4 )
								CoD.PCUtil.RevertUnsavedGraphicsOptions()
								CoD.PCUtil.FreeOptionsDirtyModel( f261_arg2 )
								GoBack( f261_arg4, f261_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f262_arg0, f262_arg1, f262_arg2, f262_arg3, f262_arg4 )
								ApplyPCGraphicsOptions( f262_arg4, f262_arg1, f262_arg2 )
								UpdateGamerprofile( f262_arg4, f262_arg1, f262_arg2 )
								CoD.PCUtil.FreeOptionsDirtyModel( f262_arg2 )
								GoBack( f262_arg4, f262_arg2 )
							end
							
						}
					}
				}
			end, true, nil )
			return "ApplyPCGraphics_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	ProcessingCoDPointsPurchasePC = {
		menuName = "SystemOverlay_Compact",
		postCreateStep = function ( f263_arg0, f263_arg1 )
			local f263_local0 = 0
			local f263_local1 = 90000
			f263_arg0:addElement( LUI.UITimer.newElementTimer( 500, false, function ( f264_arg0 )
				local f264_local0 = Engine.GetSteamExchangeProcessStatus()
				if f264_local0 == 0 then
					GoBack( f263_arg0, f263_arg1 )
				elseif f264_local0 == 4 then
					
				elseif f264_local0 == 1 or f263_local1 < f263_local0 then
					CoD.OverlayUtility.CreateOverlay( f263_arg1, GoBack( f263_arg0, f263_arg1 ), "ErrorCoDPointsPurchasePC" )
				elseif f264_local0 == 3 then
					CoD.OverlayUtility.CreateOverlay( f263_arg1, GoBack( f263_arg0, f263_arg1 ), "OverlayErrorCoDPointsPurchasePC" )
				end
				f263_local0 = f263_local0 + f264_arg0.timeElapsed
			end ) )
		end,
		title = "PLATFORM_PROCESSING",
		description = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.CODPoints,
		[CoD.OverlayUtility.GoBackPropertyName] = nil
	},
	ErrorCoDPointsPurchasePC = {
		menuName = "SystemOverlay_Compact",
		postCreateStep = function ( f265_arg0, f265_arg1 )
			
		end,
		title = "PLATFORM_PROCESSING_FAILED",
		description = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.Error,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	OverlayErrorCoDPointsPurchasePC = {
		menuName = "SystemOverlay_Compact",
		postCreateStep = function ( f266_arg0, f266_arg1 )
			
		end,
		title = "PLATFORM_PROCESSING_FAILED",
		description = "PLATFORM_PROCESSING_FAILED_NO_OVERLAY",
		categoryType = CoD.OverlayUtility.OverlayTypes.Error,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	RegistrationSuccess = {
		menuName = "SystemOverlay_Compact",
		title = Engine.Localize( "MENU_REGISTRATION_SUCCESS_TITLE" ),
		description = Engine.Localize( "MENU_REGISTRATION_SUCCESS" ),
		categoryType = CoD.OverlayUtility.OverlayTypes.Unlock,
		listDatasource = function ()
			DataSources.RegistrationSuccess_List = DataSourceHelpers.ListSetup( "RegistrationSuccess_List", function ( f268_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_OK" )
						},
						properties = {
							action = function ( f269_arg0, f269_arg1, f269_arg2, f269_arg3, f269_arg4 )
								LUI.CoDMetrics.AccountCreated( f269_arg0, f269_arg2, "1", "menu" )
								FinishRegistrationFlow( f269_arg0, f269_arg2, f269_arg4 )
							end
							
						}
					}
				}
			end, true, nil )
			return "RegistrationSuccess_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ()
			return function ( f271_arg0, f271_arg1, f271_arg2, f271_arg3 )
				LUI.CoDMetrics.AccountCreated( f271_arg0, f271_arg2, "1", "menu" )
				FinishRegistrationFlow( f271_arg0, f271_arg2, f271_arg3 )
			end
			
		end
	},
	OptInSuccess = {
		menuName = "SystemOverlay_Compact",
		title = Engine.Localize( "MENU_REGISTRATION_SUCCESS_TITLE" ),
		description = Engine.Localize( "MENU_REGISTRATION_OPTIN_SUCCESS" ),
		categoryType = CoD.OverlayUtility.OverlayTypes.Unlock,
		listDatasource = function ()
			DataSources.OptInSuccess_List = DataSourceHelpers.ListSetup( "OptInSuccess_List", function ( f273_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_OK" )
						},
						properties = {
							action = function ( f274_arg0, f274_arg1, f274_arg2, f274_arg3, f274_arg4 )
								LUI.CoDMetrics.AccountCreated( f274_arg0, f274_arg2, "1", "menu" )
								FinishRegistrationFlow( f274_arg0, f274_arg2, f274_arg4 )
							end
							
						}
					}
				}
			end, true, nil )
			return "OptInSuccess_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ()
			return function ( f276_arg0, f276_arg1, f276_arg2, f276_arg3 )
				LUI.CoDMetrics.AccountCreated( f276_arg0, f276_arg2, "1", "menu" )
				FinishRegistrationFlow( f276_arg0, f276_arg2, f276_arg3 )
			end
			
		end
	},
	ConfirmPCGraphicsChange = {
		menuName = "SystemOverlay_Compact",
		title = Engine.Localize( "PLATFORM_CONFIRM_GRAPHICS_CHANGE" ),
		description = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.Settings,
		listDatasource = function ()
			DataSources.ConfirmPCGraphicsChange_List = DataSourceHelpers.ListSetup( "ConfirmPCGraphicsChange_List", function ( f278_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f279_arg0, f279_arg1, f279_arg2, f279_arg3, f279_arg4 )
								CoD.PCUtil.RevertUnsavedGraphicsOptions()
								CoD.PCUtil.FreeOptionsDirtyModel( f279_arg2 )
								GoBackMultiple( f279_arg4, f279_arg2, 2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f280_arg0, f280_arg1, f280_arg2, f280_arg3, f280_arg4 )
								ApplyPCGraphicsOptions( f280_arg4, f280_arg1, f280_arg2 )
								UpdateGamerprofile( f280_arg4, f280_arg1, f280_arg2 )
								CoD.PCUtil.FreeOptionsDirtyModel( f280_arg2 )
								GoBack( f280_arg4, f280_arg2 )
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
			DataSources.ResetPCGraphics_List = DataSourceHelpers.ListSetup( "ResetPCGraphics_List", function ( f282_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( f283_arg0, f283_arg1, f283_arg2, f283_arg3, f283_arg4 )
								GoBack( f283_arg4, f283_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( f284_arg0, f284_arg1, f284_arg2, f284_arg3, f284_arg4 )
								ResetPCGraphicsOptions( f284_arg4, f284_arg1, f284_arg2 )
								UpdateGamerprofile( f284_arg4, f284_arg1, f284_arg2 )
								CoD.PCUtil.FreeOptionsDirtyModel( f284_arg2 )
								GoBack( f284_arg4, f284_arg2 )
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
		menuName = function ( f285_arg0, f285_arg1, f285_arg2, f285_arg3, f285_arg4, f285_arg5, f285_arg6 )
			if f285_arg0 == CoD.OverlayUtility.GenericPopupSizes.Small then
				return "SystemOverlay_Compact"
			elseif f285_arg0 == CoD.OverlayUtility.GenericPopupSizes.Large then
				return "SystemOverlay_Full"
			else
				
			end
		end,
		title = function ( f286_arg0, f286_arg1, f286_arg2, f286_arg3, f286_arg4, f286_arg5, f286_arg6 )
			return Engine.Localize( f286_arg1 )
		end,
		description = function ( f287_arg0, f287_arg1, f287_arg2, f287_arg3, f287_arg4, f287_arg5, f287_arg6 )
			return Engine.Localize( f287_arg2 )
		end,
		image = function ( f288_arg0, f288_arg1, f288_arg2, f288_arg3, f288_arg4, f288_arg5, f288_arg6 )
			if f288_arg3 and f288_arg3 ~= "" then
				return f288_arg3
			else
				
			end
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ( f289_arg0, f289_arg1, f289_arg2, f289_arg3, f289_arg4, f289_arg5, f289_arg6 )
			if f289_arg4 then
				local f289_local0 = "GenericPopup_" .. f289_arg1
				DataSources[f289_local0] = DataSourceHelpers.ListSetup( f289_local0 .. "_List", function ( f290_arg0 )
					local f290_local0 = f289_arg5
					if not f290_local0 or type( f290_local0 ) ~= "function" then
						f290_local0 = CoD.OverlayUtility.DefaultButtonAction
					end
					return {
						{
							models = {
								displayText = Engine.Localize( f289_arg4 )
							},
							properties = {
								action = f290_local0
							}
						}
					}
				end, true, nil )
				return f289_local0
			else
				
			end
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ( f291_arg0, f291_arg1, f291_arg2, f291_arg3, f291_arg4, f291_arg5, f291_arg6 )
			if f291_arg6 and type( f291_arg6 ) == "function" then
				return f291_arg6
			else
				return CoD.OverlayUtility.DefaultGoBack()
			end
		end
	},
	GenericModalDialog = {
		menuName = CoD.OverlayUtility.AutoSizeMenuFromDescription( "GenericModalDialog" ),
		title = function ( f292_arg0, f292_arg1, f292_arg2, f292_arg3, f292_arg4 )
			return Engine.Localize( f292_arg0 )
		end,
		description = function ( f293_arg0, f293_arg1, f293_arg2, f293_arg3, f293_arg4 )
			return Engine.Localize( f293_arg1 )
		end,
		image = function ( f294_arg0, f294_arg1, f294_arg2, f294_arg3, f294_arg4 )
			if f294_arg2 and f294_arg2 ~= "" then
				return f294_arg2
			else
				
			end
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ( f295_arg0, f295_arg1, f295_arg2, f295_arg3, f295_arg4 )
			local f295_local0 = "GenericModalDialog" .. f295_arg0
			DataSources[f295_local0] = DataSourceHelpers.ListSetup( f295_local0 .. "_List", function ( f296_arg0 )
				local f296_local0 = {}
				for f296_local4, f296_local5 in ipairs( f295_arg3 ) do
					table.insert( f296_local0, {
						models = {
							displayText = Engine.Localize( f296_local5 )
						},
						properties = {
							action = function ( f297_arg0, f297_arg1, f297_arg2, f297_arg3, f297_arg4 )
								if not f295_arg4 or f295_arg4( f296_local4 - 1 ) then
									GoBack( f297_arg4, f297_arg2 )
								end
							end
						}
					} )
				end
				return f296_local0
			end, true, nil )
			return f295_local0
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ( f298_arg0, f298_arg1, f298_arg2, f298_arg3, f298_arg4 )
			return function ( f299_arg0, f299_arg1, f299_arg2, f299_arg3 )
				if f298_arg4 then
					f298_arg4()
				end
				GoBack( f299_arg3, f299_arg2 )
			end
			
		end
	},
	LobbyLeavePopup = {
		menuName = CoD.OverlayUtility.AutoSizeMenuFromDescription( "LobbyLeavePopup" ),
		title = function ( f300_arg0 )
			local f300_local0 = ""
			if f300_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_PARTY then
				f300_local0 = "MENU_LEAVE_LOBBY_LEAVE_PARTY_TITLE"
			elseif f300_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_AND_DISBAND_PARTY then
				f300_local0 = "MENU_LEAVE_LOBBY_DISBAND_FROM_PARTY_TITLE"
			elseif f300_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY then
				f300_local0 = "MENU_LEAVE_LOBBY_LEAVE_LOBBY_TITLE"
			elseif f300_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY then
				f300_local0 = "MENU_LEAVE_LOBBY_LEAVE_PARTY_TITLE"
			elseif f300_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.BRING_PARTY_LEAVE_ALONE then
				f300_local0 = "MENU_LEAVE_LOBBY_LEAVE_LOBBY_TITLE"
			elseif f300_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.MANAGE_PARTY_LEAVE then
				f300_local0 = "MENU_LEAVE_LOBBY_MANAGE_PARTY_LEAVE_TITLE"
			end
			return Engine.Localize( f300_local0 )
		end,
		description = function ( f301_arg0 )
			local f301_local0 = ""
			if f301_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_PARTY then
				f301_local0 = "MENU_LEAVE_LOBBY_LEAVE_PARTY_HINT"
			elseif f301_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_AND_DISBAND_PARTY then
				f301_local0 = "MENU_LEAVE_LOBBY_DISBAND_FROM_PARTY_HINT"
			elseif f301_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY then
				f301_local0 = "MENU_LEAVE_LOBBY_LEAVE_PARTY_HINT"
			elseif f301_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.MANAGE_PARTY_LEAVE then
				f301_local0 = "MENU_LEAVE_LOBBY_MANAGE_PARTY_LEAVE_HINT"
			end
			return Engine.Localize( f301_local0 )
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Quit,
		postCreateStep = function ( f302_arg0, f302_arg1 )
			f302_arg0:subscribeToModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyLockedIn" ), function ( model )
				if Engine.GetModelValue( model ) == true then
					GoBack( f302_arg0, f302_arg1 )
				end
			end )
		end,
		listDatasource = function ( f304_arg0 )
			DataSources.LeaveLobbyPopupButtons = DataSourceHelpers.ListSetup( "LeaveLobbyPopupButtons", function ( f305_arg0 )
				local f305_local0 = {
					controller = f305_arg0
				}
				local f305_local1 = function ()
					local f306_local0 = Enum.GameServerStatus.GAME_SERVER_STATUS_IDLE
					if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
						f306_local0 = Engine.LobbyLaunchGetServerStatus( Enum.LobbyModule.LOBBY_MODULE_HOST )
					else
						f306_local0 = Engine.LobbyLaunchGetServerStatus( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
					end
					if f306_local0 == nil then
						return true
					else
						return f306_local0 == Enum.GameServerStatus.GAME_SERVER_STATUS_IDLE
					end
				end
				
				local f305_local2 = function ( f307_arg0, f307_arg1, f307_arg2, f307_arg3, f307_arg4 )
					local f307_local0 = GoBackToMenu( f307_arg4, f307_arg2, "Lobby" )
					DisableAllMenuInput( f307_local0, nil )
					if f307_arg3 == nil then
						return 
					elseif f307_local0.ClientList ~= nil then
						f307_local0.ClientList:processEvent( {
							name = "lose_focus",
							controller = f307_arg2
						} )
					end
					f305_local0.withParty = f307_arg3
					if f305_local1() == false and f305_local0.withParty == LuaEnums.LEAVE_WITH_PARTY.WITH then
						return 
					end
					Engine.LobbyVM_CallFunc( "GoBack", f305_local0 )
				end
				
				local f305_local3 = function ( f308_arg0, f308_arg1, f308_arg2, f308_arg3, f308_arg4 )
					GoBack( f308_arg4, f308_arg2 )
					Engine.LobbyVM_CallFunc( "ManagePartyLeave", f305_local0 )
				end
				
				local f305_local4 = function ( f309_arg0, f309_arg1, f309_arg2, f309_arg3, f309_arg4 )
					table.insert( f309_arg0, {
						optionDisplay = f309_arg2,
						action = f309_arg3,
						param = f309_arg4,
						customId = f309_arg1,
						isLargeButton = true,
						isLastButtonInGroup = false,
						disabled = false
					} )
				end
				
				local f305_local5 = {}
				if f304_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_PARTY then
					f305_local4( f305_local5, "btnWithout", "MENU_LEAVE_LOBBY_LEAVE_PARTY", f305_local2, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
				elseif f304_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_AND_DISBAND_PARTY then
					f305_local4( f305_local5, "btnWithout", "MENU_LEAVE_LOBBY_LEAVE_AND_DISBAND_PARTY", f305_local2, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
				elseif f304_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY then
					f305_local4( f305_local5, "btnWithout", "MENU_LEAVE_LOBBY_LEAVE_LOBBY", f305_local2, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
				elseif f304_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY then
					f305_local4( f305_local5, "btnWithout", "MENU_LEAVE_LOBBY_LEAVE_LOBBY_AND_PARTY", f305_local2, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
				elseif f304_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.BRING_PARTY_LEAVE_ALONE then
					f305_local4( f305_local5, "btnWithout", "MENU_LEAVE_LOBBY_LEAVE_ALONE", f305_local2, LuaEnums.LEAVE_WITH_PARTY.WITHOUT )
					f305_local4( f305_local5, "btnWith", "MENU_LEAVE_LOBBY_BRING_PARTY", f305_local2, LuaEnums.LEAVE_WITH_PARTY.WITH )
				elseif f304_arg0 == LuaEnums.LEAVE_LOBBY_POPUP.MANAGE_PARTY_LEAVE then
					f305_local4( f305_local5, "btnWithout", "MENU_CONFIRM_CAPS", f305_local3, nil )
				end
				f305_local4( f305_local5, "btnCancel", "MENU_LEAVE_LOBBY_CANCEL", f305_local2, nil )
				local f305_local6 = {}
				for f305_local10, f305_local11 in ipairs( f305_local5 ) do
					table.insert( f305_local6, {
						models = {
							displayText = Engine.Localize( f305_local11.optionDisplay ),
							customId = f305_local11.customId
						},
						properties = {
							disabled = f305_local11.disabled,
							action = f305_local11.action,
							actionParam = f305_local11.param,
							isLastButtonInGroup = f305_local11.isLastButtonInGroup
						}
					} )
				end
				return f305_local6
			end )
			return "LeaveLobbyPopupButtons"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ()
			return function ( f311_arg0, f311_arg1, f311_arg2, f311_arg3 )
				DisableAllMenuInput( GoBack( f311_arg3, f311_arg2 ), nil )
			end
			
		end
	},
	LobbyLocalClientWarning = {
		menuName = CoD.OverlayUtility.AutoSizeMenuFromDescription( "LobbyLocalClientWarning" ),
		title = "MENU_DISBAND_PARTY_CAPS",
		description = "MENU_NO_SPLITSCREEN_ALLOWED_DESC",
		image = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.Alert,
		listDatasource = function ( f312_arg0 )
			DataSources.LobbyLocalClientWarningButtons = DataSourceHelpers.ListSetup( "LobbyLocalClientWarningButtons", function ()
				return {
					{
						models = {
							displayText = "MENU_CONTINUE_AND_DISBAND"
						},
						properties = {
							action = function ( f314_arg0, f314_arg1, f314_arg2, f314_arg3, f314_arg4 )
								GoBack( f314_arg4, f314_arg2 )
								f312_arg0.disbandParty = true
								for f314_local0 = 1, Engine.GetMaxControllerCount() - 1, 1 do
									LobbyRemoveLocalClientFromLobby( f314_arg0, f314_local0 )
								end
								if f312_arg0.navToMenu ~= nil then
									Engine.LobbyVM_CallFunc( "GoForward", f312_arg0 )
								elseif f312_arg0.popupName ~= nil and f312_arg0.openFromMenu ~= nil then
									OpenPopup( f312_arg0.openFromMenu, f312_arg0.popupName, 0 )
								elseif f312_arg0.actionFunc ~= nil then
									f312_arg0:actionFunc()
								end
							end
							
						}
					},
					{
						models = {
							displayText = "MENU_CANCEL"
						},
						properties = {
							action = function ( f315_arg0, f315_arg1, f315_arg2, f315_arg3, f315_arg4 )
								if f315_arg4.occludedMenu and f315_arg4.occludedMenu.openOverlayAfterSpinner then
									f315_arg4.occludedMenu.openOverlayAfterSpinner = nil
								end
								GoBack( f315_arg4, f315_arg2 )
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
		description = function ( f319_arg0, f319_arg1, f319_arg2 )
			return Engine.Localize( f319_arg0, f319_arg1 )
		end,
		listDatasource = function ( f320_arg0, f320_arg1, f320_arg2 )
			DataSources.AnticheatMessageButtons = DataSourceHelpers.ListSetup( "AnticheatMessageButtons", function ( f321_arg0 )
				local f321_local0 = f320_arg1
				local f321_local1 = f320_arg2
				local f321_local2 = {}
				if f321_local0 ~= "" then
					table.insert( f321_local2, {
						models = {
							displayText = Engine.Localize( "MENU_INFO" )
						},
						properties = {
							action = OpenAnticheatPolicyInBrowser
						}
					} )
				end
				table.insert( f321_local2, {
					models = {
						displayText = Engine.Localize( "MENU_OK" )
					},
					properties = {
						action = f321_local1
					}
				} )
				return f321_local2
			end, true, nil )
			return "AnticheatMessageButtons"
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Error,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	ReportPlayer = {
		menuName = "FeatureOverlay",
		frameWidget = "CoD.systemOverlay_reportPlayer",
		xuid = function ( f322_arg0, f322_arg1, f322_arg2 )
			return f322_arg2.xuid
		end,
		gamertag = function ( f323_arg0, f323_arg1, f323_arg2 )
			return f323_arg2.gamertag
		end,
		clantag = function ( f324_arg0, f324_arg1, f324_arg2 )
			return f324_arg2.clantag
		end,
		emblemBacking = function ( f325_arg0, f325_arg1, f325_arg2 )
			return f325_arg2.emblemBacking
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Unlock,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		listDatasource = function ( f326_arg0, f326_arg1, f326_arg2 )
			local f326_local0 = f326_arg2.xuid
			local f326_local1 = f326_arg2.gamertag
			local f326_local2 = "uie_t7_icon_menu_options_dislike"
			DataSources.ReportOptions = DataSourceHelpers.ListSetup( "ReportOptions", function ( f327_arg0 )
				return {
					{
						models = {
							displayText = "MENU_REPORT_USER_OFFENSIVE_CAPS"
						},
						properties = {
							action = function ( f328_arg0, f328_arg1, f328_arg2, f328_arg3, f328_arg4 )
								Engine.ReportUser( f326_local0, "offensive", 1, true )
								GoBack( f328_arg0, f328_arg2 )
								CoD.OverlayUtility.ShowToast( "Invite", Engine.Localize( "MENU_REPORTPLAYER_OFFENSIVE_LANGUAGE_REPORTED" ), f326_local1, f326_local2 )
							end
							,
							actionParam = f326_local0
						}
					},
					{
						models = {
							displayText = "MENU_REPORT_USER_OFFENSIVE_EMBLEM_CAPS"
						},
						properties = {
							action = function ( f329_arg0, f329_arg1, f329_arg2, f329_arg3, f329_arg4 )
								Engine.LobbyVM_CallFunc( "UGCOffensiveEmblemAdd", {
									controller = f329_arg2,
									xuid = f326_local0
								} )
								Engine.ReportUser( f326_local0, "offensive_emblem", 1, true )
								GoBack( f329_arg0, f329_arg2 )
								CoD.OverlayUtility.ShowToast( "Invite", Engine.Localize( "MENU_REPORTPLAYER_OFFENSIVE_EMBLEM_REPORTED" ), f326_local1, f326_local2 )
							end
							,
							actionParam = f326_local0
						}
					},
					{
						models = {
							displayText = "MENU_REPORT_USER_OFFENSIVE_PAINTJOB_CAPS"
						},
						properties = {
							action = function ( f330_arg0, f330_arg1, f330_arg2, f330_arg3, f330_arg4 )
								Engine.ReportUser( f326_local0, "offensive_paintjob", 1, true )
								GoBack( f330_arg0, f330_arg2 )
								CoD.OverlayUtility.ShowToast( "Invite", Engine.Localize( "MENU_REPORTPLAYER_OFFENSIVE_PAINTJOB_REPORTED" ), f326_local1, f326_local2 )
							end
							,
							actionParam = f326_local0
						}
					},
					{
						models = {
							displayText = "MENU_REPORT_USER_CHEATER_CAPS"
						},
						properties = {
							action = function ( f331_arg0, f331_arg1, f331_arg2, f331_arg3, f331_arg4 )
								Engine.ReportUser( f326_local0, "cheater", 1, true )
								GoBack( f331_arg0, f331_arg2 )
								CoD.OverlayUtility.ShowToast( "Invite", Engine.Localize( "MENU_REPORTPLAYER_CHEATING_REPORTED" ), f326_local1, f326_local2 )
							end
							,
							actionParam = f326_local0
						}
					},
					{
						models = {
							displayText = "MENU_REPORT_USER_BOOSTER_CAPS"
						},
						properties = {
							action = function ( f332_arg0, f332_arg1, f332_arg2, f332_arg3, f332_arg4 )
								Engine.ReportUser( f326_local0, "booster", 1, true )
								GoBack( f332_arg0, f332_arg2 )
								CoD.OverlayUtility.ShowToast( "Invite", Engine.Localize( "MENU_REPORTPLAYER_BOOSTER_REPORTED" ), f326_local1, f326_local2 )
							end
							,
							actionParam = f326_local0
						}
					}
				}
			end )
			return "ReportOptions"
		end
	},
	ReportGroup = {
		menuName = "FeatureOverlay",
		frameWidget = "CoD.systemOverlay_reportGroup",
		groupId = function ( f333_arg0, f333_arg1, f333_arg2 )
			return f333_arg2.groupId
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Unlock,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		listDatasource = function ( f334_arg0, f334_arg1, f334_arg2 )
			local f334_local0 = f334_arg2.groupId
			DataSources.ReportGroupOptions = DataSourceHelpers.ListSetup( "ReportGroupOptions", function ( f335_arg0 )
				return {
					{
						models = {
							displayText = "MENU_REPORT_GROUP_OFFENSIVE_NAME_CAPS"
						},
						properties = {
							action = function ( f336_arg0, f336_arg1, f336_arg2, f336_arg3, f336_arg4 )
								Engine.ReportUser( f334_local0, "offensive_group_name", 1, true )
								GoBack( f336_arg0, f336_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = "MENU_REPORT_GROUP_OFFENSIVE_EMBLEM_CAPS"
						},
						properties = {
							action = function ( f337_arg0, f337_arg1, f337_arg2, f337_arg3, f337_arg4 )
								Engine.ReportUser( f334_local0, "offensive_group_emblem", 1, true )
								GoBack( f337_arg0, f337_arg2 )
							end
							
						}
					},
					{
						models = {
							displayText = "MENU_REPORT_GROUP_OFFENSIVE_DESCRIPTION_CAPS"
						},
						properties = {
							action = function ( f338_arg0, f338_arg1, f338_arg2, f338_arg3, f338_arg4 )
								Engine.ReportUser( f334_local0, "offensive_group_description", 1, true )
								GoBack( f338_arg0, f338_arg2 )
							end
							
						}
					}
				}
			end )
			return "ReportGroupOptions"
		end
	},
	GroupsNotificationPopup = {
		menuName = "SystemOverlay_Compact",
		title = function ( f339_arg0, f339_arg1, f339_arg2, f339_arg3, f339_arg4, f339_arg5, f339_arg6 )
			if IsProcessingGroupTask( f339_arg0 ) then
				return Engine.Localize( "GROUPS_PROCESSING_WAIT_TEXT" )
			else
				return Engine.Localize( f339_arg1 )
			end
		end,
		frameWidget = "CoD.SystemOverlay_GroupsNotification",
		description = function ( f340_arg0, f340_arg1, f340_arg2, f340_arg3, f340_arg4, f340_arg5, f340_arg6 )
			if IsProcessingGroupTask( f340_arg0 ) then
				return ""
			else
				return Engine.Localize( f340_arg2 )
			end
		end,
		postCreateStep = function ( f341_arg0, f341_arg1 )
			f341_arg0:subscribeToModel( GetProcessingGroupTaskModel( f341_arg1 ), function ( model )
				f341_arg0:refreshData( nil )
			end )
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ( f343_arg0, f343_arg1, f343_arg2, f343_arg3, f343_arg4, f343_arg5, f343_arg6 )
			if f343_arg4 then
				local f343_local0 = "GroupsNotificationButtons"
				DataSources[f343_local0] = DataSourceHelpers.ListSetup( f343_local0 .. "_List", function ( f344_arg0 )
					local f344_local0 = f343_arg5
					if not f344_local0 or type( f344_local0 ) ~= "function" then
						f344_local0 = CoD.OverlayUtility.DefaultButtonAction
					end
					if IsProcessingGroupTask( f344_arg0 ) or CloseGroupsNotifyPopupAutomaticallyAfterEvent( f344_arg0 ) then
						return {}
					else
						return {
							{
								models = {
									displayText = Engine.Localize( f343_arg4 )
								},
								properties = {
									action = f344_local0
								}
							}
						}
					end
				end, true, nil, function ( f345_arg0, f345_arg1, f345_arg2 )
					local f345_local0 = GetProcessingGroupTaskModel( f345_arg0 )
					local f345_local1 = GetCloseAutomaticallyModelForGroupsNotifyPoup( f345_arg0 )
					if f345_arg1.updateSubscriptionForProcessingModel then
						f345_arg1:removeSubscription( f345_arg1.updateSubscriptionForProcessingModel )
					end
					f345_arg1.updateSubscriptionForProcessingModel = f345_arg1:subscribeToModel( f345_local0, function ()
						f345_arg1:updateDataSource( false )
					end, false )
					if f345_arg1.updateSubscriptionForCloseModel then
						f345_arg1:removeSubscription( f345_arg1.updateSubscriptionForCloseModel )
					end
					f345_arg1.updateSubscriptionForCloseModel = f345_arg1:subscribeToModel( f345_local1, function ()
						f345_arg1:updateDataSource( false )
					end, false )
				end )
				return f343_local0
			else
				
			end
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ( f348_arg0, f348_arg1, f348_arg2, f348_arg3, f348_arg4, f348_arg5, f348_arg6 )
			if f348_arg6 and type( f348_arg6 ) == "function" then
				return f348_arg6
			else
				return CoD.OverlayUtility.DefaultGoBack()
			end
		end
	},
	BMContractNotificationPopup = {
		menuName = "SystemOverlay_Full",
		title = function ( f349_arg0, f349_arg1 )
			if IsProcessingBMContractRewardTask( f349_arg0 ) then
				return Engine.Localize( "BLACKJACK_PROCESSING_WAIT_TEXT" )
			else
				return Engine.Localize( f349_arg1 )
			end
		end,
		frameWidget = "CoD.SystemOverlay_ContractRewardNotification",
		description = function ( f350_arg0, f350_arg1 )
			if IsProcessingBMContractRewardTask( f350_arg0 ) then
				return ""
			end
			local f350_local0 = "MPUI_BM_INCENTIVE_ERROR_DESC"
			local f350_local1 = LuaUtils.IsWeaponContractNeeded( f350_arg0 )
			local f350_local2 = (Engine.GetCryptokeysDue( f350_arg0 ) or 0) > 0
			if f350_local1 and f350_local2 then
				f350_local0 = "MPUI_BM_INCENTIVE_AND_LOOT_XP_ERROR_DESC"
			elseif f350_local2 then
				f350_local0 = "MPUI_BM_LOOT_XP_ERROR_DESC"
			end
			return Engine.Localize( f350_local0, Engine.GetCryptokeysDue( f350_arg0 ) or 0 )
		end,
		postCreateStep = function ( f351_arg0, f351_arg1 )
			f351_arg0:subscribeToModel( Engine.CreateModel( Engine.GetModelForController( f351_arg1 ), "bmRewards.processingTask" ), function ( model )
				f351_arg0:refreshData( nil )
			end )
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Warning,
		listDatasource = function ( f353_arg0, f353_arg1 )
			local f353_local0 = "GroupsNotificationButtons_List"
			DataSources[f353_local0] = DataSourceHelpers.ListSetup( f353_local0, function ( f354_arg0 )
				if IsProcessingBMContractRewardTask( f354_arg0 ) then
					return {}
				else
					return {
						{
							models = {
								displayText = Engine.Localize( "MENU_RETRY" )
							},
							properties = {
								action = function ( f355_arg0, f355_arg1, f355_arg2, f355_arg3, f355_arg4 )
									local f355_local0 = math.random( Dvar.reward_retry_min_delay_ms:get() or 2000, Dvar.reward_retry_max_delay_ms:get() or 4000 )
									local f355_local1 = function ( f356_arg0 )
										f355_arg4.retryDelayTimer = LUI.UITimer.newElementTimer( f355_local0, true, function ( f357_arg0 )
											local f357_local0 = Engine.StorageGetBuffer( f356_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
											if f357_local0 then
												Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f356_arg0 ), "mp_loot_xp_due" ), f357_local0.mp_loot_xp_due:get() )
												f357_local0.mp_loot_xp_due:set( 0 )
												Engine.StorageWrite( f356_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
											end
											Engine.SetDvar( "reward_retry_perform_action", "1" )
											Engine.SetDvar( "reward_retry_controller", tostring( f356_arg0 ) )
											f355_arg4.retryDelayTimer:close()
											f355_arg4.retryDelayTimer = nil
										end )
										f355_arg4:addElement( f355_arg4.retryDelayTimer )
									end
									
									SetState( f355_arg4, "Processing" )
									f355_local1( f355_arg2 )
									local f355_local2 = Engine.GetModel( Engine.GetModelForController( f355_arg2 ), "bmRewards.processingTask" )
									Engine.SetModelValue( f355_local2, true )
									f355_arg4.retryCompleteTimer = LUI.UITimer.newElementTimer( f355_local0 + 200, false, function ( f358_arg0 )
										if Engine.DvarString( nil, "reward_retry_perform_action" ) ~= "1" and Engine.LootResultsReady( f355_arg2 ) then
											Engine.SetModelValue( f355_local2, false )
											if LuaUtils.IsWeaponContractNeeded( f355_arg2 ) or (Engine.GetCryptokeysDue( f355_arg2 ) or 0) > 0 then
												SetState( f355_arg4, "DefaultState" )
											else
												LuaUtils.UI_ClearErrorMessageDialog()
												GoBack( f355_arg4, f355_arg2 )
											end
											f355_arg4.retryCompleteTimer:close()
											f355_arg4.retryCompleteTimer = nil
										end
									end )
									f355_arg4:addElement( f355_arg4.retryCompleteTimer )
								end
								
							}
						},
						{
							models = {
								displayText = Engine.Localize( "MENU_CANCEL" )
							},
							properties = {
								action = function ( f359_arg0, f359_arg1, f359_arg2, f359_arg3, f359_arg4 )
									LuaUtils.UI_ClearErrorMessageDialog()
									GoBack( f359_arg4, f359_arg2 )
								end
								
							}
						}
					}
				end
			end, true, nil, function ( f360_arg0, f360_arg1, f360_arg2 )
				if f360_arg1.updateSubscriptionForProcessingModel then
					f360_arg1:removeSubscription( f360_arg1.updateSubscriptionForProcessingModel )
				end
				f360_arg1.updateSubscriptionForProcessingModel = f360_arg1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f360_arg0 ), "bmRewards.processingTask" ), function ()
					f360_arg1:updateDataSource( false )
				end, false )
			end )
			return f353_local0
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ( f362_arg0, f362_arg1 )
			return function ( f363_arg0, f363_arg1, f363_arg2, f363_arg3 )
				if f363_arg3.retryCompleteTimer then
					f363_arg3.retryCompleteTimer:close()
					f363_arg3.retryCompleteTimer = nil
				end
				GoBack( f363_arg3, f363_arg2 )
			end
			
		end
	},
	PurchaseInventoryItemConfirmation = {
		menuName = "SystemOverlay_Full",
		frameWidget = "CoD.SystemOverlay_PurchaseInventoryItem",
		title = function ( f364_arg0, f364_arg1 )
			if f364_arg1.itemCODPointCost > 0 and Engine.GetCoDPoints( f364_arg0 ) < f364_arg1.itemCODPointCost then
				return "MPUI_BM_NO_CURRENCY"
			else
				return Engine.ToUpper( Engine.Localize( "ZMUI_CONFIRM_TRADE" ) )
			end
		end,
		description = function ( f365_arg0, f365_arg1 )
			if f365_arg1.itemCODPointCost > 0 and Engine.GetCoDPoints( f365_arg0 ) < f365_arg1.itemCODPointCost then
				return Engine.Localize( "MPUI_BM_NO_CODPOINTS_DESCRIPTION", f365_arg1.itemName )
			else
				return Engine.Localize( f365_arg1.displayText )
			end
		end,
		image = function ( f366_arg0, f366_arg1 )
			return f366_arg1.image
		end,
		codpointcost = function ( f367_arg0, f367_arg1 )
			return f367_arg1.itemCODPointCost
		end,
		codpointcostString = function ( f368_arg0, f368_arg1 )
			if f368_arg1.itemCODPointCost > 0 and Engine.GetCoDPoints( f368_arg0 ) < f368_arg1.itemCODPointCost then
				return Engine.Localize( "MENU_CODPOINT_COST", f368_arg1.itemCODPointCost )
			else
				return ""
			end
		end,
		state = function ( f369_arg0, f369_arg1 )
			return f369_arg1.category
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ( f370_arg0, f370_arg1 )
			DataSources.PurchaseInventoryItemMenuList = DataSourceHelpers.ListSetup( "PurchaseInventoryItemMenuList", function ( f371_arg0, f371_arg1 )
				local f371_local0 = {}
				if f371_arg1.purchasingInventoryItem then
					return {}
				end
				local f371_local1 = function ( f372_arg0, f372_arg1, f372_arg2, f372_arg3 )
					return {
						models = {
							displayText = f372_arg0,
							disabled = f372_arg3
						},
						properties = {
							action = f372_arg1,
							actionParam = f370_arg1,
							selectIndex = f372_arg2
						}
					}
				end
				
				local f371_local2 = function ( f373_arg0, f373_arg1, f373_arg2, f373_arg3, f373_arg4 )
					local f373_local0 = f370_arg1.skuId
					if Engine.GetInventoryItemQuantity( f373_arg2, f373_local0 ) <= 0 then
						if not Engine.PurchaseDWSKU( f373_arg2, f373_local0 ) then
							LuaUtils.UI_ShowErrorMessageDialog( f373_arg2, "MENU_EXTRASLOTS_PURCHASE_FAILED", "" )
							LUI.CoDMetrics.InventoryItemPurchased( f373_arg2, f373_arg3.productDesc, f373_arg3.purchaseSource, f373_arg3.itemCODPointCost, false )
							GoBack( f373_arg4, f373_arg2 )
							return 
						end
						f373_arg0:setState( "Purchasing" )
						f373_arg0.PurchasingWidget:playClip( "StartPurchasing" )
						f373_arg0.PurchasingWidget.nextClip = "Purchasing"
						f371_arg1.purchasingInventoryItem = true
						f371_arg1:updateDataSource()
						f373_arg4[CoD.OverlayUtility.GoBackPropertyName] = nil
						f371_arg1.disabled = true
						CoD.Menu.UpdateAllButtonPrompts( f373_arg4, f373_arg2 )
						f373_arg0.PurchasingWidget:registerEventHandler( "clip_over", function ( element, event )
							if Engine.IsInventoryBusy( f373_arg2 ) or Engine.GetPurchaseDWSKUResult( f373_arg2 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_INPROGRESS then
								LUI.UIElement.clipOver( element, event )
							else
								element:playClip( "StopPurchasing" )
								element:registerEventHandler( "clip_over", function ( element, event )
									element:registerEventHandler( "clip_over", LUI.UIElement.clipOver )
									f373_arg0:setState( "DefaultState" )
									if Engine.GetPurchaseDWSKUResult( f373_arg2 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_SUCCESS then
										LUI.CoDMetrics.InventoryItemPurchased( f373_arg2, f373_arg3.productDesc, f373_arg3.purchaseSource, f373_arg3.itemCODPointCost, true )
										CoD.OverlayUtility.CreateOverlay( f373_arg2, GoBack( f373_arg4, f373_arg2 ), "PurchaseInventoryItemComplete", f373_arg2, f373_arg3 )
									else
										LuaUtils.UI_ShowErrorMessageDialog( f373_arg2, "GROUPS_GENERIC_ERROR_MSG", "" )
										LUI.CoDMetrics.InventoryItemPurchased( f373_arg2, f373_arg3.productDesc, f373_arg3.purchaseSource, f373_arg3.itemCODPointCost, false )
										GoBack( f373_arg4, f373_arg2 )
									end
								end )
							end
						end )
					end
				end
				
				local f371_local3 = function ( f376_arg0, f376_arg1, f376_arg2, f376_arg3, f376_arg4 )
					LUI.CoDMetrics.InventoryItemPurchased( f376_arg2, f376_arg3.productDesc, f376_arg3.purchaseSource, f376_arg3.itemCODPointCost, false )
					GoBackAndOpenStoreCodPointsOverlayOnParent( f376_arg4, "BMOUTFITStore", f376_arg2 )
				end
				
				local f371_local4 = function ( f377_arg0, f377_arg1, f377_arg2, f377_arg3, f377_arg4 )
					LUI.CoDMetrics.InventoryItemPurchased( f377_arg2, f377_arg3.productDesc, f377_arg3.purchaseSource, f377_arg3.itemCODPointCost, false )
					GoBack( f377_arg4, f377_arg2 )
				end
				
				if f370_arg1.itemCODPointCost > 0 and Engine.GetCoDPoints( f371_arg0 ) < f370_arg1.itemCODPointCost then
					table.insert( f371_local0, f371_local1( "MPUI_PURCHASE_CODPOINTS_CAPS", f371_local3, true, false ) )
				elseif f370_arg1.itemCODPointCost > 0 then
					table.insert( f371_local0, f371_local1( Engine.Localize( "MPUI_BM_TRADE_COD_POINTS", f370_arg1.itemCODPointCost ), f371_local2, true, false ) )
				end
				table.insert( f371_local0, f371_local1( "MENU_CANCEL_CAPS", f371_local4, false, false ) )
				return f371_local0
			end, true )
			return "PurchaseInventoryItemMenuList"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ( f378_arg0, f378_arg1 )
			return function ( f379_arg0, f379_arg1, f379_arg2, f379_arg3 )
				LUI.CoDMetrics.InventoryItemPurchased( f379_arg2, f378_arg1.productDesc, f378_arg1.purchaseSource, f378_arg1.itemCODPointCost, false )
				GoBack( f379_arg3, f379_arg2 )
			end
			
		end
	},
	ActivateSpecialContractConfirmation = {
		menuName = "SystemOverlay_Compact",
		frameWidget = "CoD.SystemOverlay_ActivateSpecialContract",
		title = function ( f380_arg0, f380_arg1 )
			if f380_arg1.specialContractReplaceConfirmation then
				return Engine.Localize( "CONTRACT_REPLACE_CONTRACT_TITLE" )
			else
				return Engine.Localize( "CONTRACT_ACTIVATE_CONTRACT_TITLE" )
			end
		end,
		description = function ( f381_arg0, f381_arg1 )
			if f381_arg1.specialContractReplaceConfirmation then
				local f381_local0 = CoD.GetContractStatValuesForIndex( f381_arg0, LuaUtils.BMContracts.specialContractIndex )
				if f381_local0 ~= nil then
					if f381_local0.index == 0 then
						f381_local0.titleRef = "MPUI_BM_CONTRACT_TOTAL_VICTORY"
					end
					return Engine.Localize( "CONTRACT_REPLACE_CONTRACT_DESC", f381_local0.titleRef )
				end
			end
			return Engine.Localize( "CONTRACT_ACTIVATE_CONTRACT_DESC", f381_arg1.name )
		end,
		image = function ( f382_arg0, f382_arg1 )
			if f382_arg1.specialContractReplaceConfirmation then
				return "t7_icon_error_overlays_bkg"
			else
				return f382_arg1.image
			end
		end,
		emblemBacking = function ( f383_arg0, f383_arg1 )
			return f383_arg1.backgroundId
		end,
		state = function ( f384_arg0, f384_arg1 )
			return f384_arg1.category
		end,
		categoryType = function ( f385_arg0, f385_arg1 )
			if f385_arg1.specialContractReplaceConfirmation then
				return CoD.OverlayUtility.OverlayTypes.Error
			else
				return CoD.OverlayUtility.OverlayTypes.GenericMessage
			end
		end,
		listDatasource = function ( f386_arg0, f386_arg1 )
			DataSources.ActivateSpecialContractMenuList = DataSourceHelpers.ListSetup( "ActivateSpecialContractMenuList", function ( f387_arg0, f387_arg1 )
				local f387_local0 = {}
				local f387_local1 = function ( f388_arg0, f388_arg1, f388_arg2, f388_arg3 )
					return {
						models = {
							displayText = f388_arg0,
							disabled = f388_arg3
						},
						properties = {
							action = f388_arg1,
							actionParam = f386_arg1,
							selectIndex = f388_arg2
						}
					}
				end
				
				local f387_local2 = function ( f389_arg0, f389_arg1, f389_arg2, f389_arg3, f389_arg4 )
					local f389_local0 = false
					if not f386_arg1.specialContractReplaceConfirmation then
						f389_local0 = IsIncompleteContractActive( f389_arg2 )
					end
					if f389_local0 then
						f386_arg1.specialContractReplaceConfirmation = true
						CoD.OverlayUtility.CreateOverlay( f389_arg2, GoBack( f389_arg4, f389_arg2 ), "ActivateSpecialContractConfirmation", f389_arg2, f386_arg1 )
					else
						ActivateSpecialContract( f389_arg0, {
							contractIndex = f386_arg1.contractIndex
						}, f389_arg2 )
						Engine.StorageWrite( f389_arg2, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
						DataSources.CurrentSpecialContract.getModel( f389_arg2 )
						local f389_local1 = GoBack( GoBack( f389_arg4, f389_arg2 ), f389_arg2 )
						if f389_local1.id == "Menu.BM_SpecialContracts" then
							f389_local1 = GoBack( f389_local1, f389_arg2 )
						end
						if f389_local1.currentAlias then
							Engine.StopSound( f389_local1.currentAlias )
						end
						PlayMenuTrackedSound( f389_local1, "vox_mark_special_contract" )
					end
				end
				
				local f387_local3 = function ( f390_arg0, f390_arg1, f390_arg2, f390_arg3, f390_arg4 )
					GoBack( f390_arg4, f390_arg2 )
				end
				
				local f387_local4 = "MENU_ACTIVATE_CONTRACT_CAPS"
				if f386_arg1.specialContractReplaceConfirmation then
					f387_local4 = Engine.Localize( "CONTRACT_REPLACE_CURRENT_CONTRACT_CAPS" )
				end
				table.insert( f387_local0, f387_local1( Engine.Localize( f387_local4 ), f387_local2, not f386_arg1.specialContractReplaceConfirmation, false ) )
				table.insert( f387_local0, f387_local1( "MENU_CANCEL_CAPS", f387_local3, f386_arg1.specialContractReplaceConfirmation, false ) )
				return f387_local0
			end, true )
			return "ActivateSpecialContractMenuList"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		postCreateStep = function ( f391_arg0, f391_arg1, f391_arg2, f391_arg3 )
			if f391_arg3.activeDvar and f391_arg3.activeDvar ~= "" then
				local f391_local0 = Engine.DvarBool( nil, f391_arg3.activeDvar )
				f391_arg0:subscribeToGlobalModel( f391_arg1, "AutoeventsCycled", "cycled", function ()
					if f391_local0 ~= Engine.DvarBool( nil, f391_arg3.activeDvar ) then
						DelayGoBack( f391_arg0, f391_arg1 )
					end
				end )
			end
		end
	},
	TradeForBlackjackContract = {
		menuName = "SystemOverlay_Full",
		frameWidget = "CoD.SystemOverlay_TradeForBlackjackContract",
		title = function ( f393_arg0, f393_arg1 )
			if f393_arg1.successConfirmation then
				return Engine.Localize( "MPUI_PURCHASE_CONFIRMATION_TITLE" )
			elseif CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f393_arg0 ) < f393_arg1.itemCost then
				return Engine.Localize( "MPUI_BM_NO_CURRENCY" )
			else
				return Engine.ToUpper( Engine.Localize( "CONTRACT_PURCHASE_BLACKJACK_CONTRACT_TITLE" ) )
			end
		end,
		description = function ( f394_arg0, f394_arg1 )
			if f394_arg1.successConfirmation then
				return Engine.Localize( "CONTRACT_PURCHASE_BLACKJACK_CONFIRMATION" )
			elseif CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f394_arg0 ) < f394_arg1.itemCost then
				return Engine.Localize( "CONTRACT_PURCHASE_BLACKJACK_CONTRACT_INSUFFICIENT_FUNDS" )
			else
				return Engine.Localize( "CONTRACT_PURCHASE_BLACKJACK_CONTRACT_DESC", f394_arg1.itemCost )
			end
		end,
		cost = function ( f395_arg0, f395_arg1 )
			return f395_arg1.itemCost
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ( f396_arg0, f396_arg1 )
			DataSources.PurchaseInventoryItemMenuList = DataSourceHelpers.ListSetup( "PurchaseInventoryItemMenuList", function ( f397_arg0, f397_arg1 )
				local f397_local0 = {}
				if f397_arg1.processingTrade then
					return {}
				end
				local f397_local1 = function ( f398_arg0, f398_arg1, f398_arg2, f398_arg3 )
					return {
						models = {
							displayText = f398_arg0,
							disabled = f398_arg3
						},
						properties = {
							action = f398_arg1,
							actionParam = f396_arg1,
							selectIndex = f398_arg2
						}
					}
				end
				
				local f397_local2 = function ( f399_arg0, f399_arg1, f399_arg2, f399_arg3, f399_arg4 )
					local f399_local0 = Dvar.blackjack_contract_dwid:get()
					if f399_local0 then
						if not Engine.PurchaseDWSKU( f399_arg2, f399_local0, true, 1 ) then
							LuaUtils.UI_ShowErrorMessageDialog( f399_arg2, "CONTRACT_PURCHASE_BLACKJACK_CONTRACT_FAILED", "" )
							GoBack( f399_arg4, f399_arg2 )
							return 
						end
						f399_arg0:setState( "Purchasing" )
						f399_arg0.PurchasingWidget:playClip( "StartPurchasing" )
						f399_arg0.PurchasingWidget.nextClip = "Purchasing"
						f397_arg1.processingTrade = true
						f397_arg1:updateDataSource()
						f399_arg4[CoD.OverlayUtility.GoBackPropertyName] = nil
						f397_arg1.disabled = true
						CoD.Menu.UpdateAllButtonPrompts( f399_arg4, f399_arg2 )
						f399_arg0.PurchasingWidget:registerEventHandler( "clip_over", function ( element, event )
							if Engine.IsInventoryBusy( f399_arg2 ) or Engine.GetPurchaseDWSKUResult( f399_arg2 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_INPROGRESS then
								LUI.UIElement.clipOver( element, event )
							else
								element:playClip( "StopPurchasing" )
								element:registerEventHandler( "clip_over", function ( element, event )
									element:registerEventHandler( "clip_over", LUI.UIElement.clipOver )
									f399_arg0:setState( "DefaultState" )
									if Engine.GetPurchaseDWSKUResult( f399_arg2 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_SUCCESS then
										ValidateBlackjackPurchase( f399_arg2 )
										local f401_local0 = GoBack( GoBack( f399_arg4, f399_arg2 ), f399_arg2 )
										f396_arg1.successConfirmation = true
										CoD.OverlayUtility.CreateOverlay( f399_arg2, f401_local0, "TradeForBlackjackContract", f399_arg2, f396_arg1 )
										if f401_local0.currentAlias then
											Engine.StopSound( f401_local0.currentAlias )
										end
										PlayMenuTrackedSound( f401_local0, "vox_mark_mercenary_contract" )
									else
										LuaUtils.UI_ShowErrorMessageDialog( f399_arg2, "GROUPS_GENERIC_ERROR_MSG", "" )
										GoBack( f399_arg4, f399_arg2 )
									end
								end )
							end
						end )
					end
				end
				
				local f397_local3 = function ( f402_arg0, f402_arg1, f402_arg2, f402_arg3, f402_arg4 )
					GoBack( f402_arg4, f402_arg2 )
				end
				
				local f397_local4 = function ( f403_arg0, f403_arg1, f403_arg2, f403_arg3, f403_arg4 )
					local f403_local0 = GoBack( f403_arg4, f403_arg2 )
					f403_local0:processEvent( {
						name = "update_state",
						menu = f403_local0
					} )
				end
				
				if f396_arg1.successConfirmation then
					table.insert( f397_local0, f397_local1( "MENU_OK_CAPS", f397_local4, true, false ) )
				else
					if f396_arg1.itemCost > 0 and f396_arg1.itemCost <= CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f397_arg0 ) then
						table.insert( f397_local0, f397_local1( Engine.Localize( "MPUI_BM_TRADE_CRYPTOKEYS", f396_arg1.itemCost ), f397_local2, true, false ) )
					end
					table.insert( f397_local0, f397_local1( "MENU_CANCEL_CAPS", f397_local3, false, false ) )
				end
				return f397_local0
			end, true )
			return "PurchaseInventoryItemMenuList"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	MissingCoDPointsRedemption = {
		menuName = "SystemOverlay_Full",
		frameWidget = "CoD.SystemOverlay_MissingCoDPointsRedemption",
		title = function ( f404_arg0, f404_arg1 )
			if f404_arg1.purchaseState == 0 then
				return Engine.ToUpper( Engine.Localize( "MENU_REDEEM_ERROR_PROCESSING_TITLE" ) )
			elseif f404_arg1.purchaseState == 1 then
				return Engine.ToUpper( Engine.Localize( "MENU_REDEEM_ERROR_COMPLETE_TITLE" ) )
			else
				return Engine.ToUpper( Engine.Localize( "MENU_REDEEM_ERROR_MESSAGE_TITLE" ) )
			end
		end,
		description = function ( f405_arg0, f405_arg1 )
			if f405_arg1.purchaseState == 0 then
				return Engine.Localize( "MENU_REDEEM_ERROR_PROCESSING_DESC" )
			elseif f405_arg1.purchaseState == 1 then
				return Engine.Localize( "MENU_REDEEM_ERROR_COMPLETE_DESC", Engine.GetCoDPoints( f405_arg0 ) )
			end
			local f405_local0 = ""
			for f405_local1 = 1, #f405_arg1.skuList, 1 do
				local f405_local4 = CoD.StoreUtility.GetSkuName( f405_arg1.skuList[f405_local1].skuId )
				if f405_local4 then
					f405_local0 = f405_local0 .. " - " .. Engine.Localize( f405_local4 ) .. " x " .. f405_arg1.skuList[f405_local1].quantity .. "\n"
				end
			end
			return Engine.Localize( "MENU_REDEEM_ERROR_MESSAGE_DESC" ) .. "\n\n" .. f405_local0 .. "\n"
		end,
		cost = function ( f406_arg0, f406_arg1 )
			return Engine.GetCoDPoints( f406_arg0 )
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ( f407_arg0, f407_arg1 )
			DataSources.MissingCoDPointsRedemption_List = DataSourceHelpers.ListSetup( "MissingCoDPointsRedemption_List", function ( f408_arg0, f408_arg1 )
				local f408_local0 = {}
				if f408_arg1.redeemingMissingCoDPoints then
					return {}
				end
				local f408_local1 = function ( f409_arg0, f409_arg1, f409_arg2, f409_arg3 )
					return {
						models = {
							displayText = f409_arg0,
							disabled = f409_arg3
						},
						properties = {
							action = f409_arg1,
							actionParam = f407_arg1,
							selectIndex = f409_arg2
						}
					}
				end
				
				local f408_local2 = function ( f410_arg0, f410_arg1, f410_arg2, f410_arg3, f410_arg4 )
					if #f410_arg3.skuList > 0 then
						if not Engine.PurchaseDWSKUMultiple( f410_arg2, false, f410_arg3.skuList ) then
							LuaUtils.UI_ShowErrorMessageDialog( f410_arg2, "GROUPS_GENERIC_ERROR_MSG", "" )
							GoBack( f410_arg4, f410_arg2 )
							return 
						end
						f407_arg1.purchaseState = 0
						f410_arg4:refreshData( f410_arg2, f410_arg3 )
						f410_arg0:setState( "Purchasing" )
						f410_arg0.PurchasingWidget:playClip( "StartPurchasing" )
						f410_arg0.PurchasingWidget.nextClip = "Purchasing"
						f408_arg1.redeemingMissingCoDPoints = true
						f408_arg1:updateDataSource()
						f410_arg4[CoD.OverlayUtility.GoBackPropertyName] = nil
						f408_arg1.disabled = true
						CoD.Menu.UpdateAllButtonPrompts( f410_arg4, f410_arg2 )
						f410_arg0.PurchasingWidget:registerEventHandler( "clip_over", function ( element, event )
							if Engine.IsInventoryBusy( f410_arg2 ) or Engine.GetPurchaseDWSKUResult( f410_arg2 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_INPROGRESS then
								LUI.UIElement.clipOver( element, event )
							else
								element:playClip( "StopPurchasing" )
								element:registerEventHandler( "clip_over", function ( element, event )
									element:registerEventHandler( "clip_over", LUI.UIElement.clipOver )
									f410_arg0:setState( "DefaultState" )
									if Engine.GetPurchaseDWSKUResult( f410_arg2 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_SUCCESS then
										f407_arg1.purchaseState = 1
										f410_arg4:refreshData( f410_arg2, f410_arg3 )
										f410_arg0.CODPoints:show()
										f408_arg1.redeemingMissingCoDPoints = false
										f408_arg1:updateDataSource()
									else
										LuaUtils.UI_ShowErrorMessageDialog( f410_arg2, "GROUPS_GENERIC_ERROR_MSG", "" )
										GoBack( f410_arg4, f410_arg2 )
									end
								end )
							end
						end )
					end
				end
				
				local f408_local3 = function ( f413_arg0, f413_arg1, f413_arg2, f413_arg3, f413_arg4 )
					OpenBlackMarketIncentivePopup( GoBack( f413_arg4, f413_arg2 ), f413_arg2 )
				end
				
				if f407_arg1.purchaseState == 1 then
					table.insert( f408_local0, f408_local1( "MENU_OK_CAPS", f408_local3, true, false ) )
				else
					table.insert( f408_local0, f408_local1( Engine.Localize( "MENU_REDEEM_ERROR_MESSAGE_CONFIRM" ), f408_local2, true, false ) )
				end
				return f408_local0
			end, true )
			return "MissingCoDPointsRedemption_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = nil
	},
	MissingCurrencyRedemption = {
		menuName = "SystemOverlay_Full",
		frameWidget = "CoD.SystemOverlay_MissingCurrencyRedemption",
		title = "MENU_REDEEM_CURRENCY_ERROR_TITLE",
		description = function ( f414_arg0, f414_arg1 )
			if f414_arg1.purchaseState == 0 then
				return ""
			elseif f414_arg1.purchaseState == 1 then
				return Engine.Localize( "MENU_REDEEM_CURRENCY_ERROR_COMPLETE_DESC" )
			end
			local f414_local0 = ""
			for f414_local1 = 1, #f414_arg1.skuList, 1 do
				local f414_local4 = CoD.StoreUtility.GetMissingCurrencySkuName( f414_arg1.skuList[f414_local1].skuId )
				if f414_local4 then
					f414_local0 = f414_local0 .. " - " .. Engine.Localize( f414_local4 ) .. " x " .. f414_arg1.skuList[f414_local1].quantity .. "\n"
				end
			end
			return Engine.Localize( "MENU_REDEEM_CURRENCY_ERROR_DESC" ) .. "\n\n" .. f414_local0 .. "\n"
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ( f415_arg0, f415_arg1 )
			DataSources.MissingCurrencyRedemption_List = DataSourceHelpers.ListSetup( "MissingCurrencyRedemption_List", function ( f416_arg0, f416_arg1 )
				local f416_local0 = {}
				if f416_arg1.redeemingMissingCurrency then
					return {}
				end
				local f416_local1 = function ( f417_arg0, f417_arg1, f417_arg2, f417_arg3 )
					return {
						models = {
							displayText = f417_arg0,
							disabled = f417_arg3
						},
						properties = {
							action = f417_arg1,
							actionParam = f415_arg1,
							selectIndex = f417_arg2
						}
					}
				end
				
				local f416_local2 = function ( f418_arg0, f418_arg1, f418_arg2, f418_arg3, f418_arg4 )
					if #f418_arg3.skuList > 0 then
						if not Engine.PurchaseDWSKUMultiple( f418_arg2, false, f418_arg3.skuList ) then
							LuaUtils.UI_ShowErrorMessageDialog( f418_arg2, "GROUPS_GENERIC_ERROR_MSG", "" )
							GoBack( f418_arg4, f418_arg2 )
							return 
						end
						f415_arg1.purchaseState = 0
						f418_arg4:refreshData( f418_arg2, f418_arg3 )
						f418_arg0:setState( "Purchasing" )
						f418_arg0.PurchasingWidget:playClip( "StartPurchasing" )
						f418_arg0.PurchasingWidget.nextClip = "Purchasing"
						f416_arg1.redeemingMissingCurrency = true
						f416_arg1:updateDataSource()
						f418_arg4[CoD.OverlayUtility.GoBackPropertyName] = nil
						f416_arg1.disabled = true
						CoD.Menu.UpdateAllButtonPrompts( f418_arg4, f418_arg2 )
						f418_arg0.PurchasingWidget:registerEventHandler( "clip_over", function ( element, event )
							if Engine.IsInventoryBusy( f418_arg2 ) or Engine.GetPurchaseDWSKUResult( f418_arg2 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_INPROGRESS then
								LUI.UIElement.clipOver( element, event )
							else
								element:playClip( "StopPurchasing" )
								element:registerEventHandler( "clip_over", function ( element, event )
									element:registerEventHandler( "clip_over", LUI.UIElement.clipOver )
									f418_arg0:setState( "DefaultState" )
									if Engine.GetPurchaseDWSKUResult( f418_arg2 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_SUCCESS then
										f415_arg1.purchaseState = 1
										f418_arg4:refreshData( f418_arg2, f418_arg3 )
										f416_arg1.redeemingMissingCurrency = false
										f416_arg1:updateDataSource()
									else
										LuaUtils.UI_ShowErrorMessageDialog( f418_arg2, "GROUPS_GENERIC_ERROR_MSG", "" )
										GoBack( f418_arg4, f418_arg2 )
									end
								end )
							end
						end )
					end
				end
				
				local f416_local3 = function ( f421_arg0, f421_arg1, f421_arg2, f421_arg3, f421_arg4 )
					GoBack( f421_arg4, f421_arg2 )
				end
				
				if f415_arg1.purchaseState == 1 then
					table.insert( f416_local0, f416_local1( "MENU_OK_CAPS", f416_local3, true, false ) )
				else
					table.insert( f416_local0, f416_local1( Engine.Localize( "MENU_REDEEM_ERROR_MESSAGE_CONFIRM" ), f416_local2, true, false ) )
				end
				return f416_local0
			end, true )
			return "MissingCurrencyRedemption_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = nil
	},
	BlackjackActivationConfirmation = {
		menuName = "SystemOverlay_Compact",
		frameWidget = "CoD.SystemOverlay_ActivateBlackjackContract",
		title = "CONTRACT_ACTIVATE_CONTRACT_TITLE",
		description = "CONTRACT_ACTIVATE_BLACKJACK_CONTRACT_DESC",
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ( f422_arg0, f422_arg1 )
			DataSources.ActivateBlackjackMenuList = DataSourceHelpers.ListSetup( "ActivateBlackjackMenuList", function ( f423_arg0, f423_arg1 )
				local f423_local0 = {}
				local f423_local1 = function ( f424_arg0, f424_arg1, f424_arg2, f424_arg3 )
					return {
						models = {
							displayText = f424_arg0,
							disabled = f424_arg3
						},
						properties = {
							action = f424_arg1,
							actionParam = f422_arg1,
							selectIndex = f424_arg2
						}
					}
				end
				
				local f423_local2 = function ( f425_arg0, f425_arg1, f425_arg2, f425_arg3, f425_arg4 )
					local f425_local0 = GoBack( f425_arg4, f425_arg2 )
					local f425_local1 = f422_arg1.self
					local f425_local2 = f422_arg1.element
					if f425_local1 and f425_local2 then
						HeroBlackjackActivateContract( f425_local1, f425_local2, f425_arg2 )
						UpdateSelfElementState( f425_local0, f425_local2, f425_arg2 )
						UpdateButtonPromptState( f425_local0, f425_local2, f425_arg2, Enum.LUIButton.LUI_KEY_XBA_PSCROSS )
					end
				end
				
				local f423_local3 = function ( f426_arg0, f426_arg1, f426_arg2, f426_arg3, f426_arg4 )
					GoBack( f426_arg4, f426_arg2 )
				end
				
				table.insert( f423_local0, f423_local1( "MENU_ACTIVATE_CONTRACT_CAPS", f423_local2, true, false ) )
				table.insert( f423_local0, f423_local1( "MENU_CANCEL_CAPS", f423_local3, false, false ) )
				return f423_local0
			end, true )
			return "ActivateBlackjackMenuList"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	InitialExperimentPromoOverlay = {
		menuName = "SystemOverlay_Compact",
		title = "MPUI_EXP_PROMO_GENERIC_TITLE",
		description = "MPUI_EXP_PROMO_GENERIC_DESC",
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		image = "t7_blackmarket_promo_bundle",
		listDatasource = function ( f427_arg0, f427_arg1 )
			DataSources.InitialExperimentPromo_List = DataSourceHelpers.ListSetup( "InitialExperimentPromo_List", function ( f428_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_OK" )
						},
						properties = {
							action = function ( f429_arg0, f429_arg1, f429_arg2, f429_arg3, f429_arg4 )
								if f427_arg1.statToMarkAsSeen then
									f427_arg1.statToMarkAsSeen:set( Engine.DvarInt( nil, "loot_experimentpromo_index" ) )
									Engine.StorageWrite( f429_arg2, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
								end
								GoBack( f429_arg4, f429_arg2 )
							end
							
						}
					}
				}
			end, true, nil )
			return "InitialExperimentPromo_List"
		end
	},
	LoginRewardOverlay = {
		menuName = "SystemOverlay_Compact",
		frameWidget = "CoD.SystemOverlay_LoginReward",
		title = function ( f430_arg0, f430_arg1 )
			return CoD.LoginRewardTitle
		end,
		description = function ( f431_arg0, f431_arg1 )
			return CoD.LoginRewardDesc
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		image = function ( f432_arg0, f432_arg1 )
			return CoD.LoginRewardOverlayImage
		end,
		listDatasource = function ( f433_arg0, f433_arg1 )
			DataSources.LoginReward_List = DataSourceHelpers.ListSetup( "LoginReward_List", function ( f434_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_OK" )
						},
						properties = {
							action = function ( f435_arg0, f435_arg1, f435_arg2, f435_arg3, f435_arg4 )
								RedeemLoginRewardAction( f435_arg0:getParent(), f435_arg2, f435_arg4 )
							end
							
						}
					}
				}
			end, true, nil )
			return "LoginReward_List"
		end
	},
	ZMDLCPurchaseRewardOverlay = {
		menuName = "SystemOverlay_Full",
		title = "MENU_ZMDLC_TITLE",
		description = function ( f436_arg0, f436_arg1 )
			local f436_local0 = "\n\n" .. Engine.Localize( "MENU_ZMDLC_BODY_GENERAL" ) .. "\n"
			if f436_arg1.dlc1 then
				f436_local0 = f436_local0 .. "\n" .. Engine.Localize( "MENU_ZMDLC_BODY_DLC1" )
			end
			if f436_arg1.dlc2 then
				f436_local0 = f436_local0 .. "\n" .. Engine.Localize( "MENU_ZMDLC_BODY_DLC2" )
			end
			if f436_arg1.dlc3 then
				f436_local0 = f436_local0 .. "\n" .. Engine.Localize( "MENU_ZMDLC_BODY_DLC3" )
			end
			if f436_arg1.dlc4 then
				f436_local0 = f436_local0 .. "\n" .. Engine.Localize( "MENU_ZMDLC_BODY_DLC4" )
			end
			return f436_local0 .. "\n\n"
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		image = "t7_icon_notice_overlays_bkg",
		listDatasource = function ( f437_arg0, f437_arg1 )
			DataSources.ZMDLCPurchaseRewardOverlay_List = DataSourceHelpers.ListSetup( "ZMDLCPurchaseRewardOverlay_List", function ( f438_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_OK" )
						},
						properties = {
							action = function ( f439_arg0, f439_arg1, f439_arg2, f439_arg3, f439_arg4 )
								local f439_local0 = Engine.StorageGetBuffer( f439_arg2, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
								if f439_local0 then
									if f437_arg1.dlc1 then
										f439_local0.extraBools[3]:set( 1 )
									end
									if f437_arg1.dlc2 then
										f439_local0.extraBools[4]:set( 1 )
									end
									if f437_arg1.dlc3 then
										f439_local0.extraBools[5]:set( 1 )
									end
									if f437_arg1.dlc4 then
										f439_local0.extraBools[6]:set( 1 )
									end
									Engine.StorageWrite( f439_arg2, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
								end
								ProceedToNextPreStartPopup( f439_arg0, f439_arg2, f439_arg4 )
							end
							
						}
					}
				}
			end, true, nil )
			return "ZMDLCPurchaseRewardOverlay_List"
		end
	},
	ZMHDPurchaseRewardOverlay = {
		menuName = "SystemOverlay_Compact",
		title = "MENU_ZMHD_PURCHASE_REWARD_TITLE",
		description = "MENU_ZMHD_PURCHASE_REWARD_DESC",
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		image = "t7_icon_zmhd_camos",
		listDatasource = function ( f440_arg0, f440_arg1 )
			DataSources.ZMHDPurchaseRewardOverlay_List = DataSourceHelpers.ListSetup( "ZMHDPurchaseRewardOverlay_List", function ( f441_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_OK" )
						},
						properties = {
							action = function ( f442_arg0, f442_arg1, f442_arg2, f442_arg3, f442_arg4 )
								local f442_local0 = Engine.StorageGetBuffer( f442_arg2, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
								if f442_local0 then
									f442_local0.extraBools[7]:set( 1 )
									Engine.StorageWrite( f442_arg2, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
								end
								ProceedToNextPreStartPopup( f442_arg0, f442_arg2, f442_arg4 )
							end
							
						}
					}
				}
			end, true, nil )
			return "ZMHDPurchaseRewardOverlay_List"
		end
	},
	ZMHDGobbleGumOverlay = {
		menuName = "SystemOverlay_Compact",
		frameWidget = "CoD.SystemOverlay_ZMHDGobbleGum",
		title = "MENU_ZMHD_GOBBLEGUM_REWARD_TITLE",
		description = "MENU_ZMHD_GOBBLEGUM_REWARD_DESC",
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		image = "t7_icon_zmhd_gobblegum",
		listDatasource = function ( f443_arg0, f443_arg1 )
			DataSources.ZMHDGobbleGumOverlay_List = DataSourceHelpers.ListSetup( "ZMHDGobbleGumOverlay_List", function ( f444_arg0, f444_arg1 )
				local f444_local0 = {}
				if f444_arg1.purchasingInventoryItem then
					return {}
				else
					local f444_local1 = function ( f445_arg0, f445_arg1, f445_arg2, f445_arg3 )
						return {
							models = {
								displayText = f445_arg0,
								disabled = f445_arg3
							},
							properties = {
								action = f445_arg1,
								actionParam = f443_arg1,
								selectIndex = f445_arg2
							}
						}
					end
					
					table.insert( f444_local0, f444_local1( "MENU_REDEEM_ERROR_MESSAGE_CONFIRM", function ( f446_arg0, f446_arg1, f446_arg2, f446_arg3, f446_arg4 )
						local f446_local0 = f443_arg1.skuId
						if Engine.GetInventoryItemQuantity( f446_arg2, f446_local0 ) > 0 then
							GoBack( f446_arg4, f446_arg2 )
						else
							if not Engine.PurchaseDWSKU( f446_arg2, f446_local0 ) then
								LuaUtils.UI_ShowErrorMessageDialog( f446_arg2, "GROUPS_GENERIC_ERROR_MSG", "" )
								GoBack( f446_arg4, f446_arg2 )
								return 
							end
							f446_arg0 = f446_arg0:getParent()
							if not f446_arg0.ProcessingWidget then
								GoBack( f446_arg4, f446_arg2 )
							end
							f446_arg0:setState( "Purchasing" )
							f446_arg0.ProcessingWidget:playClip( "StartPurchasing" )
							f446_arg0.ProcessingWidget.nextClip = "Purchasing"
							f444_arg1.purchasingInventoryItem = true
							f444_arg1:updateDataSource()
							f446_arg4[CoD.OverlayUtility.GoBackPropertyName] = nil
							f444_arg1.disabled = true
							CoD.Menu.UpdateAllButtonPrompts( f446_arg4, f446_arg2 )
							f446_arg0.ProcessingWidget:registerEventHandler( "clip_over", function ( element, event )
								if Engine.IsInventoryBusy( f446_arg2 ) or Engine.GetPurchaseDWSKUResult( f446_arg2 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_INPROGRESS then
									LUI.UIElement.clipOver( element, event )
								else
									element:playClip( "StopPurchasing" )
									element:registerEventHandler( "clip_over", function ( element, event )
										element:registerEventHandler( "clip_over", LUI.UIElement.clipOver )
										f446_arg0:setState( "DefaultState" )
										if Engine.GetPurchaseDWSKUResult( f446_arg2 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_SUCCESS then
											CoD.OverlayUtility.CreateOverlay( f446_arg2, GoBack( f446_arg4, f446_arg2 ), "ZMHDGobbleGumPurchaseSuccessOverlay", f446_arg2, f446_arg3 )
										else
											LuaUtils.UI_ShowErrorMessageDialog( f446_arg2, "GROUPS_GENERIC_ERROR_MSG", "" )
											GoBack( f446_arg4, f446_arg2 )
										end
									end )
								end
							end )
						end
					end, true, false ) )
					return f444_local0
				end
			end, true )
			return "ZMHDGobbleGumOverlay_List"
		end
	},
	ZMHDGobbleGumPurchaseSuccessOverlay = {
		menuName = "SystemOverlay_Compact",
		title = "MENU_ZMHD_GOBBLEGUM_REWARD_TITLE",
		description = "MENU_ZMHD_GOBBLEGUM_REWARD_SUCCESS",
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		image = "t7_icon_zmhd_gobblegum",
		listDatasource = function ( f449_arg0, f449_arg1 )
			DataSources.ZMHDGobbleGumPurchaseSuccessOverlay_List = DataSourceHelpers.ListSetup( "ZMHDGobbleGumPurchaseSuccessOverlay_List", function ( f450_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_OK" )
						},
						properties = {
							action = function ( f451_arg0, f451_arg1, f451_arg2, f451_arg3, f451_arg4 )
								ProceedToNextPreStartPopup( f451_arg0, f451_arg2, f451_arg4 )
							end
							
						}
					}
				}
			end, true, nil )
			return "ZMHDGobbleGumPurchaseSuccessOverlay_List"
		end
	},
	WinterCCRedeemRewardSuccessOverlay = {
		menuName = "SystemOverlay_Compact",
		title = "CONTRACT_BGB_CC_TITLE",
		description = "MENU_ZMHD_GOBBLEGUM_REWARD_SUCCESS",
		frameWidget = "CoD.SystemOverlay_Winter_Reward",
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ( f452_arg0, f452_arg1 )
			DataSources.WinterCCRedeemRewardSuccessOverlay_List = DataSourceHelpers.ListSetup( "WinterCCRedeemRewardSuccessOverlay_List", function ( f453_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_OK" )
						},
						properties = {
							action = function ( f454_arg0, f454_arg1, f454_arg2, f454_arg3, f454_arg4 )
								ProceedToNextPreStartPopup( f454_arg0, f454_arg2, f454_arg4 )
							end
							
						}
					}
				}
			end, true, nil )
			return "WinterCCRedeemRewardSuccessOverlay_List"
		end
	},
	UltraRareMegaPurchaseOverlay = {
		menuName = "SystemOverlay_Full",
		frameWidget = "CoD.SystemOverlay_UltraRareMega",
		title = function ( f455_arg0, f455_arg1 )
			if f455_arg1.isFirstTime then
				return "ZMUI_URM_FIRST_TIME_POPUP_TITLE"
			else
				return "ZMUI_CONFIRM_TRADE_CAPS"
			end
		end,
		description = function ( f456_arg0, f456_arg1 )
			if f456_arg1.isFirstTime then
				return "ZMUI_URM_FIRST_TIME_POPUP_DESC"
			else
				return "ZMUI_URM_TRADE_CONFIRMATION_DESC"
			end
		end,
		image = function ( f457_arg0, f457_arg1 )
			if f457_arg1.isFirstTime then
				return "uie_t7_zm_icon_ggtilepromo_free"
			else
				return "uie_t7_zm_icon_ggtilepromo_5x"
			end
		end,
		supportText = function ( f458_arg0, f458_arg1 )
			if f458_arg1.isFirstTime then
				return "ZMUI_URM_FIRST_TIME_PURCHASE_DESC"
			else
				return "ZMUI_URM_PURCHASE_DESC"
			end
		end,
		cost = function ( f459_arg0, f459_arg1 )
			return f459_arg1.cost
		end,
		vials = 0,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ( f460_arg0, f460_arg1 )
			DataSources.UltraRareMegaPurchaseOverlay_List = DataSourceHelpers.ListSetup( "UltraRareMegaPurchaseOverlay_List", function ( f461_arg0, f461_arg1 )
				local f461_local0 = {}
				if f461_arg1.purchasingInventoryItem then
					return {}
				end
				local f461_local1 = function ( f462_arg0, f462_arg1, f462_arg2, f462_arg3 )
					return {
						models = {
							displayText = f462_arg0,
							disabled = f462_arg3
						},
						properties = {
							action = f462_arg1,
							actionParam = f460_arg1,
							selectIndex = f462_arg2
						}
					}
				end
				
				local f461_local2 = function ( f463_arg0, f463_arg1, f463_arg2, f463_arg3, f463_arg4 )
					if not Engine.PurchaseDWSKU( f463_arg2, f460_arg1.skuId ) then
						LuaUtils.UI_ShowErrorMessageDialog( f463_arg2, "GROUPS_GENERIC_ERROR_MSG", "" )
						GoBack( f463_arg4, f463_arg2 )
						return 
					else
						f463_arg0:setState( "Purchasing" )
						f463_arg0.ProcessingWidget:playClip( "StartPurchasing" )
						f463_arg0.ProcessingWidget.nextClip = "Purchasing"
						f461_arg1.purchasingInventoryItem = true
						f461_arg1:updateDataSource()
						f463_arg4[CoD.OverlayUtility.GoBackPropertyName] = nil
						f461_arg1.disabled = true
						CoD.Menu.UpdateAllButtonPrompts( f463_arg4, f463_arg2 )
						f463_arg0.ProcessingWidget:registerEventHandler( "clip_over", function ( element, event )
							if Engine.IsInventoryBusy( f463_arg2 ) or Engine.GetPurchaseDWSKUResult( f463_arg2 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_INPROGRESS then
								LUI.UIElement.clipOver( element, event )
							else
								element:playClip( "StopPurchasing" )
								element:registerEventHandler( "clip_over", function ( element, event )
									element:registerEventHandler( "clip_over", LUI.UIElement.clipOver )
									f463_arg0:setState( "DefaultState" )
									if Engine.GetPurchaseDWSKUResult( f463_arg2 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_SUCCESS then
										CoD.OverlayUtility.CreateOverlay( f463_arg2, GoBack( f463_arg4, f463_arg2 ), "UltraRareMegaPurchaseSuccessOverlay", f463_arg2, f463_arg3 )
									else
										LuaUtils.UI_ShowErrorMessageDialog( f463_arg2, "GROUPS_GENERIC_ERROR_MSG", "" )
										GoBack( f463_arg4, f463_arg2 )
									end
								end )
							end
						end )
					end
				end
				
				local f461_local3 = function ( f466_arg0, f466_arg1, f466_arg2, f466_arg3, f466_arg4 )
					GoBack( f466_arg4, f466_arg2 )
				end
				
				if f460_arg1.isFirstTime then
					f461_arg1.menu[CoD.OverlayUtility.GoBackPropertyName] = nil
					table.insert( f461_local0, f461_local1( "MENU_REDEEM_ERROR_MESSAGE_CONFIRM", f461_local2, true, false ) )
				else
					table.insert( f461_local0, f461_local1( Engine.Localize( "ZMUI_PURCHASE_VIALS", f460_arg1.cost ), f461_local2, true, false ) )
					table.insert( f461_local0, f461_local1( "MENU_CANCEL_CAPS", f461_local3, false, false ) )
				end
				return f461_local0
			end, true )
			return "UltraRareMegaPurchaseOverlay_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ()
			return function ( f468_arg0, f468_arg1, f468_arg2, f468_arg3 )
				local f468_local0 = GoBack( f468_arg3, f468_arg2 )
				if not Engine.IsInventoryBusy( f468_arg2 ) and Engine.GetPurchaseDWSKUResult( f468_arg2 ) ~= Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_INPROGRESS then
					CoD.OverlayUtility.CreateOverlay( f468_arg2, f468_local0, "PurchaseVials", f468_arg2, {} )
				end
			end
			
		end,
		postCreateStep = function ( f469_arg0, f469_arg1, f469_arg2, f469_arg3 )
			local f469_local0 = IsUltraRareMegaGobblegumPromoActive( f469_arg1 )
			f469_arg0:subscribeToGlobalModel( f469_arg1, "AutoeventsCycled", "cycled", function ()
				if f469_local0 ~= IsUltraRareMegaGobblegumPromoActive( f469_arg1 ) then
					DelayGoBack( f469_arg0, f469_arg1 )
				end
			end )
		end
	},
	UltraRareMegaPurchaseSuccessOverlay = {
		menuName = "SystemOverlay_Full",
		frameWidget = "CoD.SystemOverlay_UltraRareMega",
		title = "ZMUI_URM_FIRST_TIME_POPUP_TITLE",
		description = "MENU_ZMHD_GOBBLEGUM_REWARD_SUCCESS",
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		image = function ( f471_arg0, f471_arg1 )
			if f471_arg1.isFirstTime then
				return "uie_t7_zm_icon_ggtilepromo_free"
			else
				return "uie_t7_zm_icon_ggtilepromo_5x"
			end
		end,
		supportText = function ( f472_arg0, f472_arg1 )
			if f472_arg1.isFirstTime then
				return "ZMUI_URM_FIRST_TIME_PURCHASE_DESC"
			else
				return "ZMUI_URM_PURCHASE_DESC"
			end
		end,
		cost = 0,
		listDatasource = function ( f473_arg0, f473_arg1 )
			DataSources.UltraRareMegaPurchaseSuccessOverlay_List = DataSourceHelpers.ListSetup( "UltraRareMegaPurchaseSuccessOverlay_List", function ( f474_arg0 )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_OK" )
						},
						properties = {
							action = function ( f475_arg0, f475_arg1, f475_arg2, f475_arg3, f475_arg4 )
								Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "autoevents.cycled" ) )
								ProceedToNextPreStartPopup( f475_arg0, f475_arg2, f475_arg4 )
							end
							
						}
					}
				}
			end, true, nil )
			return "UltraRareMegaPurchaseSuccessOverlay_List"
		end
	},
	PurchaseOutfitItemConfirmation = {
		menuName = "SystemOverlay_Full",
		frameWidget = "CoD.SystemOverlay_PurchaseInventoryItem",
		title = function ( f476_arg0, f476_arg1 )
			if f476_arg1.itemCODPointCost > 0 and Engine.GetCoDPoints( f476_arg0 ) < f476_arg1.itemCODPointCost then
				return "MPUI_BM_NO_CURRENCY"
			else
				return Engine.ToUpper( Engine.Localize( "ZMUI_CONFIRM_TRADE" ) )
			end
		end,
		description = function ( f477_arg0, f477_arg1 )
			if f477_arg1.itemCODPointCost > 0 and Engine.GetCoDPoints( f477_arg0 ) < f477_arg1.itemCODPointCost then
				return Engine.Localize( "MPUI_BM_NO_CODPOINTS_DESCRIPTION", f477_arg1.itemName )
			else
				return Engine.Localize( f477_arg1.outfitDesc )
			end
		end,
		image = function ( f478_arg0, f478_arg1 )
			return f478_arg1.image
		end,
		codpointcost = function ( f479_arg0, f479_arg1 )
			return f479_arg1.itemCODPointCost
		end,
		codpointcostString = function ( f480_arg0, f480_arg1 )
			if f480_arg1.itemCODPointCost > 0 and Engine.GetCoDPoints( f480_arg0 ) < f480_arg1.itemCODPointCost then
				return Engine.Localize( "MENU_CODPOINT_COST", f480_arg1.itemCODPointCost )
			else
				return ""
			end
		end,
		state = function ( f481_arg0, f481_arg1 )
			return f481_arg1.category
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ( f482_arg0, f482_arg1 )
			DataSources.PurchaseOutfitItemConfirmation = DataSourceHelpers.ListSetup( "PurchaseOutfitItemConfirmation", function ( f483_arg0, f483_arg1 )
				local f483_local0 = {}
				if f483_arg1.purchasingInventoryItem then
					return {}
				end
				local f483_local1 = function ( f484_arg0, f484_arg1, f484_arg2, f484_arg3 )
					return {
						models = {
							displayText = f484_arg0,
							disabled = f484_arg3
						},
						properties = {
							action = f484_arg1,
							actionParam = f482_arg1,
							selectIndex = f484_arg2
						}
					}
				end
				
				local f483_local2 = function ( f485_arg0, f485_arg1, f485_arg2, f485_arg3, f485_arg4 )
					local f485_local0 = f482_arg1.skuId
					if Engine.GetInventoryItemQuantity( f485_arg2, f485_local0 ) <= 0 then
						if not Engine.PurchaseDWSKU( f485_arg2, f485_local0 ) then
							LuaUtils.UI_ShowErrorMessageDialog( f485_arg2, "MENU_EXTRASLOTS_PURCHASE_FAILED", "" )
							LUI.CoDMetrics.InventoryItemPurchased( f485_arg2, f485_arg3.productDesc, f485_arg3.purchaseSource, f485_arg3.itemCODPointCost, false )
							GoBack( f485_arg4, f485_arg2 )
							return 
						end
						f485_arg0:setState( "Purchasing" )
						f485_arg0.PurchasingWidget:playClip( "StartPurchasing" )
						f485_arg0.PurchasingWidget.nextClip = "Purchasing"
						f483_arg1.purchasingInventoryItem = true
						f483_arg1:updateDataSource()
						f485_arg4[CoD.OverlayUtility.GoBackPropertyName] = nil
						f483_arg1.disabled = true
						CoD.Menu.UpdateAllButtonPrompts( f485_arg4, f485_arg2 )
						f485_arg0.PurchasingWidget:registerEventHandler( "clip_over", function ( element, event )
							if Engine.IsInventoryBusy( f485_arg2 ) or Engine.GetPurchaseDWSKUResult( f485_arg2 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_INPROGRESS then
								LUI.UIElement.clipOver( element, event )
							else
								element:playClip( "StopPurchasing" )
								element:registerEventHandler( "clip_over", function ( element, event )
									element:registerEventHandler( "clip_over", LUI.UIElement.clipOver )
									f485_arg0:setState( "DefaultState" )
									if Engine.GetPurchaseDWSKUResult( f485_arg2 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_SUCCESS then
										LUI.CoDMetrics.InventoryItemPurchased( f485_arg2, f485_arg3.productDesc, f485_arg3.purchaseSource, f485_arg3.itemCODPointCost, true )
										for f487_local4, f487_local5 in ipairs( CoD.BlackMarketUtility.UniqueSpecialistOutfits ) do
											if f485_arg3.productDesc == f487_local5.contractName then
												local f487_local3 = Engine.StorageGetBuffer( f485_arg2, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
												if f487_local3 then
													f487_local3.ui_seen_new_contracts:set( 0 )
													break
												end
											end
										end
										CoD.OverlayUtility.CreateOverlay( f485_arg2, GoBack( f485_arg4, f485_arg2 ), "PurchaseInventoryItemComplete", f485_arg2, f485_arg3 )
									else
										LuaUtils.UI_ShowErrorMessageDialog( f485_arg2, "GROUPS_GENERIC_ERROR_MSG", "" )
										LUI.CoDMetrics.InventoryItemPurchased( f485_arg2, f485_arg3.productDesc, f485_arg3.purchaseSource, f485_arg3.itemCODPointCost, false )
										GoBack( f485_arg4, f485_arg2 )
									end
								end )
							end
						end )
					end
				end
				
				local f483_local3 = function ( f488_arg0, f488_arg1, f488_arg2, f488_arg3, f488_arg4 )
					LUI.CoDMetrics.InventoryItemPurchased( f488_arg2, f488_arg3.productDesc, f488_arg3.purchaseSource, f488_arg3.itemCODPointCost, false )
					GoBackAndOpenStoreCodPointsOverlayOnParent( f488_arg4, "BMCPStore", f488_arg2 )
				end
				
				local f483_local4 = function ( f489_arg0, f489_arg1, f489_arg2, f489_arg3, f489_arg4 )
					LUI.CoDMetrics.InventoryItemPurchased( f489_arg2, f489_arg3.productDesc, f489_arg3.purchaseSource, f489_arg3.itemCODPointCost, false )
					GoBack( f489_arg4, f489_arg2 )
				end
				
				if f482_arg1.itemCODPointCost > 0 and Engine.GetCoDPoints( f483_arg0 ) < f482_arg1.itemCODPointCost then
					table.insert( f483_local0, f483_local1( "MPUI_PURCHASE_CODPOINTS_CAPS", f483_local3, true, false ) )
				elseif f482_arg1.itemCODPointCost > 0 then
					table.insert( f483_local0, f483_local1( Engine.Localize( "MPUI_BM_TRADE_COD_POINTS", f482_arg1.itemCODPointCost ), f483_local2, true, false ) )
				end
				table.insert( f483_local0, f483_local1( "MENU_CANCEL_CAPS", f483_local4, false, false ) )
				return f483_local0
			end, true )
			return "PurchaseOutfitItemConfirmation"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ( f490_arg0, f490_arg1 )
			return function ( f491_arg0, f491_arg1, f491_arg2, f491_arg3 )
				LUI.CoDMetrics.InventoryItemPurchased( f491_arg2, f490_arg1.productDesc, f490_arg1.purchaseSource, f490_arg1.itemCODPointCost, false )
				GoBack( f491_arg3, f491_arg2 )
			end
			
		end
	}
}
CoD.OverlayUtility.AddSystemOverlay = function ( f492_arg0, f492_arg1 )
	if not CoD.OverlayUtility.Overlays[f492_arg0] or CoD.LoadingFFOTD then
		CoD.OverlayUtility.Overlays[f492_arg0] = f492_arg1
	end
end

CoD.OverlayUtility.OverlayCloseMethod = function ( f493_arg0, f493_arg1 )
	return function ()
		ClearMenuSavedState( f493_arg0 )
		if f493_arg0.overlayModelName then
			local f494_local0 = Engine.GetModel( Engine.GetModelForController( f493_arg1 ), f493_arg0.overlayModelName )
			if f494_local0 then
				Engine.UnsubscribeAndFreeModel( f494_local0 )
			end
		end
	end
	
end

CoD.OverlayUtility.RefreshOverlayModels = function ( f495_arg0, f495_arg1, f495_arg2 )
	for f495_local4, f495_local5 in ipairs( CoD.OverlayUtility.OverlayModelFields ) do
		local f495_local3 = nil
		local f495_local6 = Engine.CreateModel( f495_arg0, f495_local5 )
		f495_local3 = CoD.OverlayUtility.callFnOrGetValue( f495_arg1[f495_local5], f495_arg2 )
		if not f495_local3 and CoD.OverlayUtility.DefaultModelFields[f495_local5] then
			f495_local3 = CoD.OverlayUtility.callFnOrGetValue( CoD.OverlayUtility.DefaultModelFields[f495_local5], {
				f495_arg1,
				f495_arg2
			} )
		end
		if f495_local3 ~= nil then
			Engine.SetModelValue( f495_local6, f495_local3 )
		end
	end
end

CoD.OverlayUtility.RefreshOverlayProperties = function ( f496_arg0, f496_arg1, f496_arg2 )
	for f496_local4, f496_local5 in ipairs( CoD.OverlayUtility.OverlayPropertyFields ) do
		local f496_local3 = nil
		f496_local3 = CoD.OverlayUtility.callFnOrGetValue( f496_arg1[f496_local5], f496_arg2 )
		if not f496_local3 and CoD.OverlayUtility.DefaultPropertyFields[f496_local5] then
			f496_local3 = CoD.OverlayUtility.callFnOrGetValue( CoD.OverlayUtility.DefaultPropertyFields[f496_local5], {
				f496_arg1,
				f496_arg2
			} )
		end
		f496_arg0[f496_local5] = f496_local3
	end
end

CoD.OverlayUtility.RefreshOverlayDataFunction = function ( f497_arg0, f497_arg1 )
	return function ()
		CoD.OverlayUtility.RefreshOverlayModels( f497_arg0:getModel(), CoD.OverlayUtility.Overlays[f497_arg0.menuName], f497_arg1 )
		CoD.OverlayUtility.RefreshOverlayProperties( f497_arg0, CoD.OverlayUtility.Overlays[f497_arg0.menuName], f497_arg1 )
	end
	
end

CoD.OverlayUtility.CreateOverlay = function ( f499_arg0, f499_arg1, f499_arg2, ... )
	local f499_local0 = nil
	local f499_local1 = {
		n = select( "#", ... ),
		...
	}
	local f499_local2 = function ( f500_arg0, f500_arg1 )
		for f500_local4, f500_local5 in ipairs( CoD.OverlayUtility.OverlayModelFields ) do
			local f500_local3 = nil
			local f500_local6 = Engine.CreateModel( f500_arg0, f500_local5 )
			if type( f500_arg1[f500_local5] ) == "function" then
				f500_local3 = f500_arg1[f500_local5]( unpack( f499_local1 ) )
			else
				f500_local3 = f500_arg1[f500_local5]
			end
			if not f500_local3 and CoD.OverlayUtility.DefaultModelFields[f500_local5] then
				f500_local3 = CoD.OverlayUtility.callFnOrGetValue( CoD.OverlayUtility.DefaultModelFields[f500_local5], {
					f500_arg1,
					f499_local1
				} )
			end
			if f500_local3 ~= nil then
				Engine.SetModelValue( f500_local6, f500_local3 )
			end
		end
	end
	
	if CoD.OverlayUtility.Overlays[f499_arg2] then
		local f499_local3 = CoD.OverlayUtility.Overlays[f499_arg2]
		local f499_local4 = CoD.OverlayUtility.callFnOrGetValue( f499_local3.menuName, f499_local1 )
		if f499_local4 then
			if CoD.Menu.ModelToUse then
				CoD.OverlayUtility.RefreshOverlayModels( CoD.Menu.ModelToUse, f499_local3, f499_local1 )
			end
			CoD.Menu.OverwriteMenuName = f499_arg2
			if not f499_local3.openMethod or f499_local3.openMethod == CoD.OverlayUtility.OpenMethods.Popup then
				f499_local0 = OpenPopup( f499_arg1, f499_local4, f499_arg0 )
			elseif f499_local3.openMethod == CoD.OverlayUtility.OpenMethods.Overlay then
				f499_local0 = OpenOverlay( f499_arg1, f499_local4, f499_arg0 )
			end
			CoD.Menu.OverwriteMenuName = nil
			if f499_local0 then
				f499_local0.refreshData = CoD.OverlayUtility.RefreshOverlayDataFunction( f499_local0, f499_local1 )
				CoD.OverlayUtility.RefreshOverlayProperties( f499_local0, f499_local3, f499_local1 )
				if not f499_local0:getModel() then
					f499_local0.overlayModelName = "Overlay." .. f499_arg2
					local f499_local5 = Engine.CreateModel( Engine.GetModelForController( f499_arg0 ), f499_local0.overlayModelName )
					CoD.OverlayUtility.RefreshOverlayModels( f499_local5, f499_local3, f499_local1 )
					f499_local0:setModel( f499_local5 )
				end
				LUI.OverrideFunction_CallOriginalFirst( f499_local0, "close", CoD.OverlayUtility.OverlayCloseMethod( f499_local0, f499_arg0 ) )
				if f499_local3.postCreateStep then
					f499_local3.postCreateStep( f499_local0, f499_arg0, unpack( f499_local1 ) )
				end
				f499_local0:UpdateAllButtonPrompts( f499_arg0 )
			end
		end
	end
	return f499_local0
end

CoD.OverlayUtility.ShowToast = function ( f501_arg0, f501_arg1, f501_arg2, f501_arg3, f501_arg4, f501_arg5, f501_arg6 )
	local f501_local0 = Engine.CreateModel( Engine.GetModelForController( Engine.GetPrimaryController() ), "FrontendToast" )
	Engine.SetModelValue( Engine.CreateModel( f501_local0, "state" ), f501_arg0 or "DefaultState" )
	Engine.SetModelValue( Engine.CreateModel( f501_local0, "kicker" ), f501_arg1 or "" )
	Engine.SetModelValue( Engine.CreateModel( f501_local0, "description" ), f501_arg2 or "" )
	Engine.SetModelValue( Engine.CreateModel( f501_local0, "contentIcon" ), f501_arg3 or "blacktransparent" )
	Engine.SetModelValue( Engine.CreateModel( f501_local0, "functionIcon" ), f501_arg4 or "blacktransparent" )
	Engine.SetModelValue( Engine.CreateModel( f501_local0, "backgroundId" ), f501_arg6 )
	Engine.SetModelValue( Engine.CreateModel( f501_local0, "emblemDecal" ), f501_arg5 or 0 )
	Engine.SetModelValue( Engine.CreateModel( f501_local0, "notify" ), true )
end

