require( "lua.Shared.LuaEnum" )

if not CoD.OverlayUtility then
	CoD.OverlayUtility = {}
end
CoD.OverlayUtility.OpenMethods = LuaEnum.createEnum( "Popup", "Overlay" )
CoD.OverlayUtility.OverlayTypes = LuaEnum.createEnum( "GenericMessage", "Connection", "Settings", "Unlock", "Save", "Quit", "Alert", "Error", "Info", "Notice", "CODPoints" )
CoD.OverlayUtility.GenericPopupSizes = LuaEnum.createEnum( "Small", "Large" )
CoD.OverlayUtility.LOCAL_FILES_FETCH_WAIT_TIME = 20000
CoD.OverlayUtility.CONNECTINGDW_MAX_WAIT_TIME = 30000
if Engine.GetCurrentPlatform() == "orbis" then
	CoD.OverlayUtility.CONNECTINGDW_MAX_WAIT_TIME = 40000
end
if Engine.GetCurrentPlatform() == "durango" then
	CoD.OverlayUtility.CONNECTINGDW_MAX_WAIT_TIME = 60000
end
CoD.OverlayUtility.callFnOrGetValue = function ( item, vargs )
	if type( item ) == "function" then
		return item( unpack( vargs ) )
	else
		return item
	end
end

CoD.OverlayUtility.aCrossPromptFn = "aCrossFn"
CoD.OverlayUtility.aCrossPromptText = "aCrossPrompt"
CoD.OverlayUtility.bCirclePromptFn = "bCircleFn"
CoD.OverlayUtility.bCirclePromptText = "bCirclePrompt"
CoD.OverlayUtility.xSquarePromptFn = "xSquareFn"
CoD.OverlayUtility.xSquarePromptText = "xSquarePrompt"
CoD.OverlayUtility.yTrianglePromptFn = "yTriangleFn"
CoD.OverlayUtility.yTrianglePromptText = "yTrianglePrompt"
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
	"rewardText"
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
	CoD.OverlayUtility.ProcessConfirmVariantName,
	CoD.OverlayUtility.aCrossPromptFn,
	CoD.OverlayUtility.bCirclePromptFn,
	CoD.OverlayUtility.xSquarePromptFn,
	CoD.OverlayUtility.yTrianglePromptFn
}
CoD.OverlayUtility.ButtonPromptsFields = {
	[Enum.LUIButton.LUI_KEY_XBA_PSCROSS] = CoD.OverlayUtility.aCrossPromptText,
	[Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE] = CoD.OverlayUtility.bCirclePromptText,
	[Enum.LUIButton.LUI_KEY_XBX_PSSQUARE] = CoD.OverlayUtility.xSquarePromptText,
	[Enum.LUIButton.LUI_KEY_XBY_PSTRIANGLE] = CoD.OverlayUtility.yTrianglePromptText
}
CoD.OverlayUtility.DefaultModelFields = {
	image = function ( overlayData, vargs )
		local category = CoD.OverlayUtility.callFnOrGetValue( overlayData.categoryType, vargs )
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
		elseif category == CoD.OverlayUtility.OverlayTypes.Info or category == CoD.OverlayUtility.OverlayTypes.GenericMessage then
			return "t7_icon_info_overlays_bkg"
		elseif category == CoD.OverlayUtility.OverlayTypes.Notice then
			return "t7_icon_notice_overlays_bkg"
		elseif category == CoD.OverlayUtility.OverlayTypes.CODPoints then
			return "uie_t7_menu_blackmarket_codpoints_large"
		else
			return "blacktransparent"
		end
	end,
	frameWidget = function ( overlayData, vargs )
		local menuName = CoD.OverlayUtility.callFnOrGetValue( overlayData.menuName, vargs )
		if menuName == "SystemOverlay_Compact" or menuName == "SystemOverlay_NoBG" then
			return "CoD.systemOverlay_Compact_BasicFrame"
		elseif menuName == "SystemOverlay_Full" then
			return "CoD.systemOverlay_Full_BasicFrame"
		elseif menuName == "SystemOverlay_FreeCursor" or menuName == "SystemOverlay_MessageDialog" then
			return "CoD.systemOverlay_FreeCursor_BasicFrame"
		elseif menuName == "SystemOverlay_FreeCursor_Full" or menuName == "SystemOverlay_MessageDialogFull" then
			return "CoD.systemOverlay_FreeCursor_Full_BasicFrame"
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

CoD.OverlayUtility.DefaultButtonAction = function ( self, element, controller, actionParam, menu )
	GoBack( menu, controller )
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

CoD.OverlayUtility.AutoSizeMenuFromDescription = function ( overlayName, compactName, fullName )
	return function ( ... )
		local vargs = {
			n = select( "#", ... ),
			...
		}
		local text = CoD.OverlayUtility.callFnOrGetValue( CoD.OverlayUtility.Overlays[overlayName].description, vargs )
		local numLines = Engine.GetNumTextLines( text, CoD.fonts.Default, 20, 660 )
		if numLines > 3 then
			return fullName or "SystemOverlay_Full"
		else
			return compactName or "SystemOverlay_Compact"
		end
	end
	
end

CoD.OverlayUtility.FreeCursorAutoSizeMenuFromDescription = function ( overlayName, compactName, fullName )
	return function ( ... )
		local vargs = {
			n = select( "#", ... ),
			...
		}
		local text = CoD.OverlayUtility.callFnOrGetValue( CoD.OverlayUtility.Overlays[overlayName].description, vargs )
		local numLines = Engine.GetNumTextLines( text, CoD.fonts.Default, 20, 660 )
		if numLines > 6 then
			return fullName or "SystemOverlay_FreeCursor_Full"
		else
			return compactName or "SystemOverlay_FreeCursor"
		end
	end
	
end

if not CoD.OverlayUtility.Overlays then
	CoD.OverlayUtility.Overlays = {}
end
CoD.OverlayUtility.Overlays = LuaUtils.OverrideTable( CoD.OverlayUtility.Overlays, {
	EndGamePopup = {
		menuName = "SystemOverlay_FreeCursor",
		title = function ()
			return Engine.Localize( "MENU_QUIT_GAME" )
		end,
		description = function ()
			if not CoD.isRankedGame() then
				return ""
			elseif Engine.ProbationCheckIfPenalizedForQuit( Engine.GetPrimaryController() ) == true then
				return Engine.Localize( "MENU_LEAVE_GAME_RANKED_PROBATION" )
			elseif CoD.isZombie == true then
				return Engine.Localize( "ZOMBIE_LEAVE_GAME_RANKED" )
			elseif Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_LEAGUE ) == true then
				return Engine.Localize( "MENU_LEAVE_GAME_LEAGUES" )
			elseif Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_FREERUN ) then
				return ""
			else
				return Engine.Localize( "MENU_LEAVE_GAME_RANKED" )
			end
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Quit,
		[CoD.OverlayUtility.aCrossPromptFn] = function ()
			return function ( menu, controller )
				if Engine.CanPauseGame() then
					Engine.SetDvar( "cl_paused", 0 )
				end
				if CoD.isMultiplayer == true then
					
				else
					
				end
				CloseStartMenu( menu, controller )
				CoDShared.QuitGame( controller )
			end
			
		end,
		[CoD.OverlayUtility.aCrossPromptText] = "MENU_YES",
		[CoD.OverlayUtility.bCirclePromptFn] = function ()
			return function ( menu, controller )
				GoBack( menu, controller )
			end
			
		end,
		[CoD.OverlayUtility.bCirclePromptText] = "MENU_NO"
	},
	SaveAndQuitGamePopup = {
		menuName = "SystemOverlay_FreeCursor",
		title = Engine.Localize( "MENU_ARE_YOU_SURE_QUIT" ),
		description = function ()
			if not Engine.GetDvarBool( "ui_blocksaves" ) then
				return Engine.Localize( "MENU_SAVEQUIT_TEXT_WITHOUT_DEVICE_CHANGE" )
			else
				return ""
			end
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Quit,
		[CoD.OverlayUtility.aCrossPromptFn] = function ( controller )
			return function ( menu, controller )
				Engine.Exec( controller, "updategamerprofile" )
				menu:close()
				CloseStartMenu( menu, controller )
				Engine.SendMenuResponse( controller, "popup_leavegame", "endround" )
			end
			
		end,
		[CoD.OverlayUtility.aCrossPromptText] = "MENU_SAVE_AND_QUIT_CAPS",
		[CoD.OverlayUtility.bCirclePromptFn] = function ( controller )
			return function ( menu, controller )
				Engine.SetDvar( "cl_paused", 0 )
				Engine.LockInput( controller, false )
				CloseStartMenu( menu, controller )
				menu:processEvent( {
					name = "close_all_ingame_menus",
					controller = controller
				} )
			end
			
		end,
		[CoD.OverlayUtility.bCirclePromptText] = "MENU_RESUMEGAME_CAPS"
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
								Engine.SetDvar( "cl_paused", 0 )
								Engine.SendMenuResponse( controller, "popup_leavegame", "endround" )
								local isHost = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
								if IsGameTypeDOA() then
									if not isHost then
										Engine.Exec( controller, "disconnect" )
									end
								else
									Engine.Exec( controller, "disconnect" )
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
		menuName = "SystemOverlay_FreeCursor",
		title = Engine.Localize( "MENU_CONTINUE_RESTART_CHECKPOINT" ),
		description = Engine.Localize( "MENU_CHECKPOINT_RESTART_TEXT" ),
		categoryType = CoD.OverlayUtility.OverlayTypes.Quit,
		[CoD.OverlayUtility.aCrossPromptFn] = function ( controller )
			return function ( menu, controller )
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
			
		end,
		[CoD.OverlayUtility.aCrossPromptText] = "MENU_RESTART_CHECKPOINT_CAPS",
		[CoD.OverlayUtility.bCirclePromptFn] = function ( controller )
			return function ( menu, controller )
				Engine.SetDvar( "cl_paused", 0 )
				Engine.LockInput( controller, false )
				CloseStartMenu( menu, controller )
			end
			
		end,
		[CoD.OverlayUtility.bCirclePromptText] = "MENU_RESUMEGAME_CAPS"
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
								if (Engine.SessionModeIsMode( Enum.eNetworkModes.MODE_NETWORK_SYSTEMLINK ) == true) or Engine.SessionModeIsMode( Enum.eNetworkModes.MODE_NETWORK_OFFLINE ) == true then
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
		menuName = "SystemOverlay_FreeCursor",
		title = Engine.Localize( "MENU_CONTINUE_RESTART" ),
		description = Engine.Localize( "MENU_RESTART_MISSION_TEXT" ),
		categoryType = CoD.OverlayUtility.OverlayTypes.Quit,
		[CoD.OverlayUtility.aCrossPromptFn] = function ( controller )
			return function ( menu, controller )
				Dvar.ui_busyBlockIngameMenu:set( 1 )
				menu:processEvent( {
					name = "close_all_ingame_menus",
					controller = controller
				} )
				Engine.SetDvar( "cl_paused", 0 )
				Engine.SendMenuResponse( controller, "StartMenu_Main", "restartmission" )
				CloseStartMenu( menu, controller )
				Engine.PlayMenuMusic( "death" )
				Engine.Exec( controller, "stopControllerRumble" )
				Engine.Exec( controller, "fade 0 0 0 255 0 0 1" )
				Engine.Exec( controller, "silence" )
			end
			
		end,
		[CoD.OverlayUtility.aCrossPromptText] = "MENU_RESTART_MISSION_CAPS",
		[CoD.OverlayUtility.bCirclePromptFn] = function ( controller )
			return function ( menu, controller )
				Engine.SetDvar( "cl_paused", 0 )
				Engine.LockInput( controller, false )
				CloseStartMenu( menu, controller )
				menu:processEvent( {
					name = "close_all_ingame_menus",
					controller = controller
				} )
			end
			
		end,
		[CoD.OverlayUtility.bCirclePromptText] = "MENU_RESUMEGAME_CAPS"
	},
	MessageDialogBox = {
		menuName = CoD.OverlayUtility.FreeCursorAutoSizeMenuFromDescription( "MessageDialogBox", "SystemOverlay_MessageDialog", "SystemOverlay_MessageDialogFull" ),
		getStringRef = function ( controller )
			return Engine.GetModelValue( Engine.GetModel( DataSources.MessageDialog.getModel( controller ), "message" ) ) or ""
		end,
		getTitleRef = function ( controller )
			local f47_local0 = DataSources.MessageDialog.getModel( controller )
			return f47_local0.message:get() or ""
		end,
		postCreateStep = function ( menu, controller )
			if CoD.OverlayUtility.Overlays.MessageDialogBox.getStringRef( controller ) == "PLATFORM_SAVEDATA_CORRUPT" then
				menu.ignoreForcedClose = true
			end
		end,
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
				elseif messageType == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_NOTICE then
					if CoD.OverlayUtility.Overlays.MessageDialogBox.getStringRef( controller ) == "PLATFORM_PROFILE_CHANGE_MESSAGE" then
						messageTitle = Engine.Localize( "PLATFORM_PROFILE_CHANGE_CAPS" )
					else
						messageTitle = Engine.Localize( "MENU_NOTICE" )
					end
				end
			end
			return Engine.ToUpper( messageTitle )
		end,
		description = function ( controller )
			return Engine.Localize( CoD.OverlayUtility.Overlays.MessageDialogBox.getStringRef( controller ) )
		end,
		image = function ( controller )
			local messageModel = DataSources.MessageDialog.getModel( controller )
			local image = CoD.SafeGetModelValue( messageModel, "messageImage" )
			if image ~= nil and image ~= "" then
				return image
			else
				return nil
			end
		end,
		categoryType = function ( controller )
			local messageType = Engine.GetModelValue( Engine.GetModel( DataSources.MessageDialog.getModel( controller ), "messageType" ) )
			local categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage
			if messageType == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_WARNING then
				categoryType = CoD.OverlayUtility.OverlayTypes.Alert
			elseif messageType == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_ERROR then
				categoryType = CoD.OverlayUtility.OverlayTypes.Error
			elseif messageType == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_INFO then
				categoryType = CoD.OverlayUtility.OverlayTypes.Info
			elseif messageType == Enum.MessageDialogType.MESSAGE_DIALOG_TYPE_NOTICE then
				categoryType = CoD.OverlayUtility.OverlayTypes.Notice
			end
			return categoryType
		end,
		[CoD.OverlayUtility.aCrossPromptFn] = function ( controller )
			local messageTitle = CoD.OverlayUtility.Overlays.MessageDialogBox.getTitleRef( controller )
			if CoD.OverlayUtility.Overlays.MessageDialogBox.getStringRef( controller ) == "PLATFORM_PROFILE_CHANGE_MESSAGE" then
				return function ( menu, controller )
					Engine.ShowAccountPicker( controller )
					LuaUtils.UI_ClearErrorMessageDialog()
					GoBack( menu, controller )
				end
				
			elseif messageTitle == "MENU_CONNECTIVITY_NOTICE_CAPS" then
				return function ( menu, controller )
					LuaUtils.UI_ClearErrorMessageDialog()
					GoBack( menu, controller )
					local previousMenu = GoBack( menu, controller )
					LobbyBeginPlay( previousMenu, controller )
				end
				
			else
				return function ( menu, controller )
					LuaUtils.UI_ClearErrorMessageDialog()
					GoBack( menu, controller )
				end
				
			end
		end,
		[CoD.OverlayUtility.aCrossPromptText] = function ( controller )
			local messageTitle = CoD.OverlayUtility.Overlays.MessageDialogBox.getTitleRef( controller )
			if CoD.OverlayUtility.Overlays.MessageDialogBox.getStringRef( controller ) == "PLATFORM_PROFILE_CHANGE_MESSAGE" then
				return "PLATFORM_SWITCH_USER"
			elseif messageTitle == "MENU_CONNECTIVITY_NOTICE_CAPS" then
				return "MENU_PLAY_LOCAL"
			else
				return "MENU_OK"
			end
		end,
		[CoD.OverlayUtility.bCirclePromptFn] = function ( controller )
			local ref = CoD.OverlayUtility.Overlays.MessageDialogBox.getStringRef( controller )
			if ref ~= "PLATFORM_PROFILE_CHANGE_MESSAGE" and ref ~= "PLATFORM_SAVEDATA_CORRUPT" then
				return function ( menu, controller )
					LuaUtils.UI_ClearErrorMessageDialog()
					GoBack( menu, controller )
				end
				
			else
				return nil
			end
		end,
		[CoD.OverlayUtility.bCirclePromptText] = function ( controller )
			local ref = CoD.OverlayUtility.Overlays.MessageDialogBox.getStringRef( controller )
			if ref ~= "PLATFORM_PROFILE_CHANGE_MESSAGE" and ref ~= "PLATFORM_SAVEDATA_CORRUPT" then
				return "MENU_BACK"
			else
				
			end
		end,
		[CoD.OverlayUtility.xSquarePromptFn] = function ( controller )
			local messageTitle = CoD.OverlayUtility.Overlays.MessageDialogBox.getTitleRef( controller )
			if CoD.OverlayUtility.Overlays.MessageDialogBox.getStringRef( controller ) == "PLATFORM_PROFILE_CHANGE_MESSAGE" then
				return function ( menu, controller )
					LuaUtils.UI_ClearErrorMessageDialog()
					LuaUtils.UI_SetSignedInGamertagModel( Engine.GetGamertagWhoStolePrimaryController() )
					GoBack( menu, controller )
					Engine.Durango_ContinueAs()
					Engine.ComError( Enum.errorCode.ERROR_SOFTRESTART_KEEPDW, "" )
				end
				
			elseif messageTitle == "MENU_CONNECTIVITY_NOTICE_CAPS" then
				return function ( menu, controller )
					LuaUtils.UI_ClearErrorMessageDialog()
					local previousMenu = GoBack( menu, controller )
					CoD.LobbyUtility.FailedDWConnection = false
					LobbyBeginPlay( previousMenu, controller )
				end
				
			else
				return nil
			end
		end,
		[CoD.OverlayUtility.xSquarePromptText] = function ( controller )
			local messageTitle = CoD.OverlayUtility.Overlays.MessageDialogBox.getTitleRef( controller )
			if CoD.OverlayUtility.Overlays.MessageDialogBox.getStringRef( controller ) == "PLATFORM_PROFILE_CHANGE_MESSAGE" then
				return Engine.Localize( "PLATFORM_CONTINUE_AS_USERNAME", Engine.GetGamertagWhoStolePrimaryController() )
			elseif messageTitle == "MENU_CONNECTIVITY_NOTICE_CAPS" then
				return "MENU_RETRY"
			else
				return ""
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
			DataSources.DemoSaveClipPopup_List = DataSourceHelpers.ListSetup( "DemoSaveClipPopup_List", function ( controller )
				local options = {}
				table.insert( options, {
					models = {
						displayText = Engine.Localize( "MENU_AUTONAME_SEGMENT" )
					},
					properties = {
						action = function ( self, element, controller, actionParam, menu )
							Engine.Exec( controller, "demo_savesegment 0" )
							GoBack( menu, controller )
						end
					}
				} )
				table.insert( options, {
					models = {
						displayText = Engine.Localize( "MENU_NAME_SEGMENT" )
					},
					properties = {
						action = function ( self, element, controller, actionParam, menu )
							OpenDemoKeyboard( self, element, controller, "segmentName" )
						end
					}
				} )
				table.insert( options, {
					models = {
						displayText = Engine.Localize( "MENU_PREVIEW_SEGMENT" )
					},
					properties = {
						action = function ( self, element, controller, actionParam, menu )
							Engine.Exec( controller, "demo_previewsegment" )
							GoBack( menu, controller )
						end
					}
				} )
				table.insert( options, {
					models = {
						displayText = Engine.Localize( "MENU_DISCARD_SEGMENT" )
					},
					properties = {
						action = function ( self, element, controller, actionParam, menu )
							Engine.Exec( controller, "demo_savesegment 1" )
							GoBack( menu, controller )
						end
					}
				} )
				return options
			end, true, nil )
			return "DemoSaveClipPopup_List"
		end,
		postCreateStep = function ( overlay, controller )
			Engine.LockInput( controller, true )
			Engine.SetUIActive( controller, true )
			LUI.OverrideFunction_CallOriginalSecond( overlay, "close", function ( self )
				Engine.LockInput( controller, false )
				Engine.SetUIActive( controller, false )
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
			DataSources.DemoStartHighlightReel_List = DataSourceHelpers.ListSetup( "DemoStartHighlightReel_List", function ( controller )
				local numAvailableMoments = Engine.GetNumberOfHighlightReelMoments()
				local options = {}
				table.insert( options, {
					models = {
						displayText = Engine.ToUpper( Engine.Localize( "MENU_DEMO_CUSTOMIZE_HIGHLIGHT_REEL" ) )
					},
					properties = {
						action = function ( self, element, controller, actionParam, menu )
							StartMenuOpenCustomizeHighlightReel( self, element, controller, actionParam, menu )
						end
					}
				} )
				table.insert( options, {
					models = {
						displayText = Engine.ToUpper( Engine.Localize( "MENU_DEMO_START_HIGHLIGHT_REEL" ) ),
						disabled = numAvailableMoments <= 0
					},
					properties = {
						disabled = numAvailableMoments <= 0,
						action = function ( self, element, controller, actionParam, menu )
							GoBack( menu, controller )
							Engine.Exec( controller, "demo_regeneratehighlightreel" )
						end,
						selectIndex = numAvailableMoments > 0
					}
				} )
				return options
			end, nil, nil, function ( controller, list, listModel )
				local updateModel = CoD.DemoUtility.GetNumHighlightReelMomentsModel()
				if list.updateSubscription then
					list:removeSubscription( list.updateSubscription )
				end
				list.updateSubscription = list:subscribeToModel( updateModel, function ()
					list:updateDataSource( false )
				end, false )
			end )
			return "DemoStartHighlightReel_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ( selectedScreenshotModel )
			return function ( self, element, controller, menu )
				GoBack( menu, controller )
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
			DataSources.DemoCustomizeHighlightReel_List = DataSourceHelpers.ListSetup( "DemoCustomizeHighlightReel_List", function ( controller )
				local numAvailableMoments = Engine.GetNumberOfHighlightReelMoments()
				local options = {}
				table.insert( options, {
					models = {
						displayText = Engine.ToUpper( Engine.Localize( "MENU_DEMO_START_HIGHLIGHT_REEL" ) ),
						disabled = numAvailableMoments <= 0
					},
					properties = {
						action = function ( self, element, controller, actionParam, menu )
							GoBackMultiple( self, controller, 2 )
							Engine.Exec( controller, "demo_regeneratehighlightreel" )
						end
					}
				} )
				return options
			end, nil, nil, function ( controller, list, listModel )
				local updateModel = CoD.DemoUtility.GetNumHighlightReelMomentsModel()
				if list.updateSubscription then
					list:removeSubscription( list.updateSubscription )
				end
				list.updateSubscription = list:subscribeToModel( updateModel, function ()
					list:updateDataSource( false )
				end, false )
			end )
			return "DemoCustomizeHighlightReel_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ()
			return function ( self, element, controller, menu )
				GoBack( menu, controller )
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
			DataSources.DemoDeleteAllDollyCameraMarkers_List = DataSourceHelpers.ListSetup( "DemoDeleteAllDollyCameraMarkers_List", function ( controller )
				local options = {}
				table.insert( options, {
					models = {
						displayText = Engine.Localize( "DEMO_DELETE_ALL" )
					},
					properties = {
						action = function ( self, element, controller, actionParam, menu )
							CoD.DemoUtility.RemoveDollyCamMarker( controller, -1 )
							CoD.DemoUtility.SetEditingDollyCameraMarker( controller, false )
							GoBack( menu, controller )
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
						end,
						selectIndex = true
					}
				} )
				return options
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
			DataSources.DemoDeleteAllLightmanMarkers_List = DataSourceHelpers.ListSetup( "DemoDeleteAllLightmanMarkers_List", function ( controller )
				local options = {}
				table.insert( options, {
					models = {
						displayText = Engine.Localize( "DEMO_DELETE_ALL" )
					},
					properties = {
						action = function ( self, element, controller, actionParam, menu )
							CoD.DemoUtility.RemoveLightmanMarker( controller, -1 )
							CoD.DemoUtility.SetEditingLightmanMarker( controller, false )
							GoBack( menu, controller )
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
						end,
						selectIndex = true
					}
				} )
				return options
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
			DataSources.DemoDeleteSegment_List = DataSourceHelpers.ListSetup( "DemoDeleteSegment_List", function ( controller )
				local options = {}
				table.insert( options, {
					models = {
						displayText = Engine.Localize( "MENU_YES" )
					},
					properties = {
						action = function ( self, element, controller, actionParam, menu )
							local highlightedSegmentModel = CoD.DemoUtility.Timeline_GetHighlightedSegmentModel()
							local segmentNumber = Engine.GetModelValue( Engine.GetModel( highlightedSegmentModel, "segmentNumber" ) )
							local segmentIndex = segmentNumber - 1
							Engine.ExecNow( controller, "demo_deletesegment " .. segmentIndex )
							TimelineEditorRefresh()
							GoBack( menu, controller )
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
						end,
						selectIndex = true
					}
				} )
				return options
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
			DataSources.DemoDeleteAllSegments_List = DataSourceHelpers.ListSetup( "DemoDeleteAllSegments_List", function ( controller )
				local options = {}
				table.insert( options, {
					models = {
						displayText = Engine.Localize( "MENU_YES" )
					},
					properties = {
						action = function ( self, element, controller, actionParam, menu )
							Engine.ExecNow( controller, "demo_deleteclip" )
							TimelineEditorRefresh()
							GoBack( menu, controller )
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
						end,
						selectIndex = true
					}
				} )
				return options
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
			DataSources.DemoMergeAllSegments_List = DataSourceHelpers.ListSetup( "DemoMergeAllSegments_List", function ( controller )
				local options = {}
				table.insert( options, {
					models = {
						displayText = Engine.Localize( "MENU_YES" )
					},
					properties = {
						action = function ( self, element, controller, actionParam, menu )
							Engine.ExecNow( controller, "demo_mergesegments" )
							TimelineEditorRefresh()
							GoBack( menu, controller )
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
						end,
						selectIndex = true
					}
				} )
				return options
			end, true, nil )
			return "DemoMergeAllSegments_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = nil
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
			local isClipModified = Engine.IsClipModified()
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
							end,
							selectIndex = true
						}
					} )
				else
					table.insert( options, {
						models = {
							displayText = Engine.Localize( "MENU_SAVE_CLIP" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								StartMenuUploadClip( self, element, controller, actionParam, menu )
							end,
							selectIndex = true
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
	UpdateNeeded = {
		menuName = "SystemOverlay_Compact",
		postCreateStep = function ( overlay, controller )
			overlay.anyControllerAllowed = true
		end,
		title = "MENU_NOTICE",
		description = "MENU_UPDATE_NEEDED",
		categoryType = CoD.OverlayUtility.OverlayTypes.Connection,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		listDatasource = function ( noteworkMode )
			DataSources.UpdateNeededPopupList = DataSourceHelpers.ListSetup( "UpdateNeededPopupList", function ( controller )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_OK" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								CoD.LobbyUtility.FailedDWConnection = true
								GoBack( menu, controller )
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
		postCreateStep = function ( overlay, controller )
			overlay.unusedControllerAllowed = true
			local timeSinceStart = 0
			if overlay.layout and overlay.layout.frameWidget and overlay.layout.frameWidget.framedWidget then
				overlay.layout.frameWidget.framedWidget:playClip( "LoadingLoop" )
			end
			overlay:addElement( LUI.UITimer.newElementTimer( 400, false, function ( event )
				if Engine.AreLocalFilesReady( controller ) == true then
					GoBack( overlay, controller )
					return 
				elseif timeSinceStart > CoD.OverlayUtility.LOCAL_FILES_FETCH_WAIT_TIME then
					GoBack( overlay, controller )
					return 
				else
					timeSinceStart = timeSinceStart + event.timeElapsed
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
		postCreateStep = function ( overlay, controller )
			overlay.unusedControllerAllowed = true
			local timeSinceStart = 0
			if overlay.layout and overlay.layout.frameWidget and overlay.layout.frameWidget.framedWidget then
				overlay.layout.frameWidget.framedWidget:playClip( "LoadingLoop" )
			end
			Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.beginPlay" ), Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_INVALID )
			overlay:addElement( LUI.UITimer.newElementTimer( 400, false, function ( event )
				if Engine.IsDemonwareFetchingDone( controller ) then
					CoD.LobbyUtility.FailedDWConnection = false
					local currentMenuId = LobbyData.GetLobbyNav()
					if Engine.GetPrimaryController() == controller then
						local f137_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_LAN )
						if currentMenuId ~= f137_local0.id then
							f137_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_ONLINE )
							if currentMenuId == f137_local0.id then
								local data = {
									controller = controller,
									networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
								}
								Engine.LobbyEvent( "OnNetworkModeChanged", data )
							else
								f137_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MAIN )
								if currentMenuId == f137_local0.id then
									Engine.SetLobbyNetworkMode( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
								end
							end
						end
						local data = {
							controller = controller,
							networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
						}
						Engine.LobbyEvent( "OnNetworkModeChanged", data )
					end
					GoBack( overlay, controller )
					local f137_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MAIN )
					if currentMenuId == f137_local0.id and Dvar.lobby_beginPlay:exists() then
						Dvar.lobby_beginPlay:set( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
					end
					return 
				end
				local netConnection = Engine.CheckNetConnection()
				if Engine.IsLPCBusy() then
					local completion = Engine.GetLPCCompletionPercentage()
					if completion == 0 or completion == 100 then
						CoD.OverlayUtility.Overlays[overlay.menuName].description = Engine.Localize( "MENU_CHECKING_FILES" )
					else
						CoD.OverlayUtility.Overlays[overlay.menuName].description = Engine.Localize( "MENU_DOWNLOAD_IN_PROGRESS" ) .. "\n" .. completion .. "%"
					end
					overlay:refreshData( nil )
					timeSinceStart = 0
				elseif timeSinceStart > CoD.OverlayUtility.CONNECTINGDW_MAX_WAIT_TIME or netConnection == false then
					local menu = GoBack( overlay, controller )
					local message = ""
					local title = "MENU_NOTICE_CAPS"
					if netConnection == false then
						message = "XBOXLIVE_NETCONNECTION"
					else
						local info, debugInfo = Engine.GetSystemInfo( controller, CoD.SYSINFO_CONNECTIVITY_INFO )
						message = Engine.Localize( "PLATFORM_DEMONWARE_DISCONNECT" ) .. "\n\n" .. Engine.Localize( "MENU_ERROR_CODE", info )
						if menu.id == "Menu.Main" then
							title = "MENU_CONNECTIVITY_NOTICE_CAPS"
						end
						if Engine.IsShipBuild() == false then
							message = message .. "\n\n\tDEBUG INFO:\n" .. debugInfo
						end
					end
					CoD.LobbyUtility.FailedDWConnection = true
					LuaUtils.UI_ShowErrorMessageDialog( controller, message, title )
				end
				timeSinceStart = timeSinceStart + event.timeElapsed
			end ) )
		end,
		title = "MENU_CONNECTING_DW",
		description = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.Connection,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	LobbyPlayNetworkModePopup = {
		menuName = CoD.OverlayUtility.AutoSizeMenuFromDescription( "LobbyPlayNetworkModePopup" ),
		title = function ( noteworkMode )
			local strid = ""
			if noteworkMode == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
				strid = "PLATFORM_XBOX_LIVE_CAPS"
			elseif noteworkMode == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
				strid = "MENU_PLAY_LOCAL_CAPS"
			end
			return Engine.Localize( strid )
		end,
		description = function ( noteworkMode )
			local strid = ""
			if noteworkMode == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
				if Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 1 then
					strid = "XBOXLIVE_PLAY_ONLINE_AND_DISBAND_DESC"
				else
					strid = "XBOXLIVE_PLAY_ONLINE_DESC"
				end
			elseif noteworkMode == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
				if Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 1 then
					strid = "XBOXLIVE_DISBAND_AND_PLAY_LOCAL_DESC"
				else
					strid = "XBOXLIVE_PLAY_LOCAL_DESC"
				end
			end
			return Engine.Localize( strid )
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Connection,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		listDatasource = function ( noteworkMode )
			DataSources.LobbyPlayNetworkModePopupButtons = DataSourceHelpers.ListSetup( "LobbyPlayNetworkModePopupButtons", function ( controller )
				local strid = ""
				if noteworkMode == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
					strid = "XBOXLIVE_PLAY_ONLINE"
				elseif noteworkMode == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
					strid = "MENU_PLAY_LOCAL"
				end
				return {
					{
						models = {
							displayText = Engine.Localize( strid )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								LobbyToggleNetwork( self, element, controller, actionParam )
								GoBack( menu, controller )
							end
							,
							actionParam = noteworkMode
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_CANCEL" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								GoBack( menu, controller )
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
			DataSources.FreerunEndGameButtons = DataSourceHelpers.ListSetup( "FreerunEndGameButtons", function ( controller )
				return {
					{
						models = {
							displayText = "MENU_FR_RESTART_COURSE"
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								GoBack( self, controller )
								Engine.LockInput( controller, false )
								Engine.SendMenuResponse( controller, "freerun_endgame_popup", "fr_restart" )
							end
							
						}
					},
					{
						models = {
							displayText = "MENU_QUIT_GAME_CAPS"
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								GoBack( self, controller )
								CoDShared.QuitGame( controller )
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
		title = function ( controller, element )
			return "MENU_ATTACHMENT_RESTRICTION_OPTIONS"
		end,
		description = function ( controller, element )
			return ""
		end,
		image = function ( controller, element )
			local elementModel = element:getModel()
			if elementModel then
				return Engine.GetModelValue( Engine.GetModel( elementModel, "image" ) )
			else
				return ""
			end
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		openMethod = CoD.OverlayUtility.OpenMethods.Overlay,
		frameWidget = "CoD.GameSettings_AttachmentOptionsPopup",
		[CoD.OverlayUtility.GoBackPropertyName] = function ()
			return function ( self, element, controller, menu )
				local updateModel = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings.Update" )
				Engine.ForceNotifyModelSubscriptions( updateModel )
				GoBack( self, controller )
			end
			
		end,
		listDatasource = function ( controller, element )
			DataSources.CompetitiveSettingsAttachment = DataSourceHelpers.ListSetup( "CompetitiveSettingsAttachment", function ()
				local elementModel = element:getModel()
				local attachmentIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "attachmentIndex" ) )
				local attachmentName = Engine.GetModelValue( Engine.GetModel( elementModel, "title" ) )
				local attachmentDesc = Engine.GetModelValue( Engine.GetModel( elementModel, "description" ) )
				local image = Engine.GetModelValue( Engine.GetModel( elementModel, "image" ) )
				local dataTable = {}
				table.insert( dataTable, CoD.OptionsUtility.CreateItemRestrictionSettings( controller, attachmentName, "", "Attachment_" .. attachmentName, CoD.GameSettingsUtility.GetGroupRestrictionOptions(), image, CoD.OptionsUtility.GametypeSettingsSetAttachmentRestrictionState, {
					attachmentIndex = attachmentIndex
				}, function ( params )
					local attachmentIndex = params.attachmentIndex
					local changedForAnyWeapon = Engine.AttachmentRestrictionStateChangedForAnyWeapon( attachmentIndex )
					if changedForAnyWeapon == true then
						return -1
					else
						return Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_NONE
					end
				end ) )
				return dataTable
			end, nil, nil, function ( controller, list, listModel )
				local gametypeSettingsModel = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
				local updateModel = Engine.CreateModel( gametypeSettingsModel, "Update" )
				if list.updateSubscription then
					list:removeSubscription( list.updateSubscription )
				end
				list.updateSubscription = list:subscribeToModel( updateModel, function ()
					list:updateDataSource( false )
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
		postCreateStep = function ( overlay, controller )
			overlay.unusedControllerAllowed = true
			local timeSinceStart = 0
			if overlay.layout and overlay.layout.frameWidget and overlay.layout.frameWidget.framedWidget then
				overlay.layout.frameWidget.framedWidget:playClip( "LoadingLoop" )
			end
			overlay:addElement( LUI.UITimer.newElementTimer( 400, false, function ( event )
				if Engine.IsCurrentlyCheckingContentRestrictions( controller ) == false then
					if Engine.HasCompletedCheckingRestrictions( controller ) then
						CoD.LobbyUtility.FailedDWConnection = false
						local currentMenuId = LobbyData.GetLobbyNav()
						local f159_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_LAN )
						if currentMenuId ~= f159_local0.id then
							f159_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_ONLINE )
							if currentMenuId == f159_local0.id then
								local data = {
									controller = controller,
									networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
								}
								Engine.LobbyEvent( "OnNetworkModeChanged", data )
							else
								f159_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MAIN )
								if currentMenuId == f159_local0.id then
									Engine.SetLobbyNetworkMode( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
								end
							end
						else
							local data = {
								controller = controller,
								networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
							}
							Engine.LobbyEvent( "OnNetworkModeChanged", data )
						end
						GoBack( overlay, controller )
						f159_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MAIN )
						if currentMenuId == f159_local0.id and Dvar.lobby_beginPlay:exists() then
							Dvar.lobby_beginPlay:set( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
						end
						return 
					end
					local currentMenuId = LobbyData.GetLobbyNav()
					local f159_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_LAN )
					if currentMenuId ~= f159_local0.id then
						f159_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_ONLINE )
						if currentMenuId == f159_local0.id then
							local data = {
								controller = controller,
								networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN
							}
							Engine.LobbyEvent( "OnNetworkModeChanged", data )
						else
							f159_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MAIN )
							if currentMenuId == f159_local0.id then
								Engine.SetLobbyNetworkMode( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN )
							end
						end
					else
						local data = {
							controller = controller,
							networkMode = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN
						}
						Engine.LobbyEvent( "OnNetworkModeChanged", data )
					end
					GoBack( overlay, controller )
					f159_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MAIN )
					if currentMenuId == f159_local0.id and Dvar.lobby_beginPlay:exists() then
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
			DataSources.LoginQueue_List = DataSourceHelpers.ListSetup( "LoginQueue_List", function ( controller )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_PLAY_LOCAL" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								Engine.LeaveQueue( controller )
								CoD.LobbyUtility.FailedDWConnection = true
								GoBack( menu, controller )
							end
							
						}
					}
				}
			end, true, nil )
			return "LoginQueue_List"
		end,
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
					CoD.LobbyUtility.FailedDWConnection = true
					Engine.LeaveQueue( controller )
				else
					local menu = GoBack( overlay, controller )
					CoD.OverlayUtility.CreateOverlay( controller, menu, "ConnectingToDemonware" )
				end
				timeWaited = timeWaited + event.timeElapsed
			end ) )
		end
	},
	PaintjobClearConfirmationOverlay = {
		menuName = "SystemOverlay_Compact",
		title = "MENU_PAINTJOB_DELETE_CONFIRMATION",
		description = "MENU_CANNOT_UNDO",
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ()
			DataSources.PaintjobClearConfirmation_List = DataSourceHelpers.ListSetup( "PaintjobClearConfirmation_List", function ( controller )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								PaintjobSelector_ClearPaintjob( menu, element, controller )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								GoBack( menu, controller )
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
	InitialCODPointsOverlay = {
		menuName = "SystemOverlay_Compact",
		title = Engine.ToUpper( Engine.Localize( "MENU_CODPOINTS_INTRO_HEADER" ) ),
		description = "MENU_CODPOINTS_INTRO_DESC",
		categoryType = CoD.OverlayUtility.OverlayTypes.CODPoints,
		listDatasource = function ()
			DataSources.InitialCODPoints_List = DataSourceHelpers.ListSetup( "InitialCODPoints_List", function ( controller )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_OK" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
								if stats then
									stats.codPointMsgSeen:set( 1 )
									Engine.StorageWrite( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
								end
								GoBack( menu, controller )
							end
							
						}
					}
				}
			end, true, nil )
			return "InitialCODPoints_List"
		end
	},
	GunsmithClearConfirmationOverlay = {
		menuName = "SystemOverlay_Compact",
		title = "MENU_GUNSMITH_DELETE_CONFIRMATION",
		description = "MENU_CANNOT_UNDO",
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ()
			DataSources.GunsmithClearConfirmation_List = DataSourceHelpers.ListSetup( "GunsmithClearConfirmation_List", function ( controller )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								Gunsmith_ClearVariant( menu, element, controller )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								GoBack( menu, controller )
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
			DataSources.EmblemClearConfirmation_List = DataSourceHelpers.ListSetup( "EmblemClearConfirmation_List", function ( controller )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_YES" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								EmblemSelect_ClearEmblem( menu, element, controller )
							end
							
						}
					},
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								GoBack( menu, controller )
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
		description = function ( controller, element )
			local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
			return Engine.Localize( LocalizeWeaponNameIntoString( "MENU_GUNSMITH_SAVE_CHANGES_SUBTITLE", controller, weaponIndex ) )
		end,
		image = function ( controller, element )
			local elementModel = element:getModel()
			if elementModel then
				local variantIndexModel = Engine.GetModel( elementModel, "variantIndex" )
				if variantIndexModel then
					return Engine.GetModelValue( variantIndexModel )
				end
			end
			return ""
		end,
		variantName = function ( controller, element )
			local elementModel = element:getModel()
			if elementModel then
				local variantNameModel = Engine.GetModel( elementModel, "variantName" )
				if variantNameModel then
					return Engine.GetModelValue( variantNameModel )
				end
			end
			return ""
		end,
		weaponName = function ( controller, element )
			local elementModel = element:getModel()
			if elementModel then
				local variantWeaponIndexModel = Engine.GetModel( elementModel, "weaponIndex" )
				if variantWeaponIndexModel then
					local weaponIndex = Engine.GetModelValue( variantWeaponIndexModel )
					local weapon_name_ref = Engine.GetItemName( weaponIndex )
					if weapon_name_ref then
						local weaponName = Engine.ToUpper( Engine.Localize( Engine.GetItemName( weaponIndex ) ) )
						return weaponName
					end
				end
			end
			return ""
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Save,
		listDatasource = function ( controller, element )
			DataSources.GunsmithSaveVariant_List = DataSourceHelpers.ListSetup( "GunsmithSaveVariant_List", function ( controller )
				return {
					{
						models = {
							displayText = LocalizeToUpperString( "MENU_SAVE" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								if Gunsmith_IsCurrentVariantChanged( controller ) then
									Gunsmith_ClearSelectedGunsmithVariantStats( controller )
									Gunsmith_ClearCACWithUpdatedVariant( menu, controller )
								end
								Gunsmith_SaveChangesButtonAction( menu, element, "save", controller )
								ForceNotifyModel( controller, "Gunsmith.UpdateDataSource" )
							end
							
						}
					},
					{
						models = {
							displayText = LocalizeToUpperString( "MENU_DISCARD" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								Gunsmith_SaveChangesButtonAction( self, element, "discard", controller )
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
		postCreateStep = function ( overlay, controller )
			PaintjobEditor_RemoveGrid( controller )
		end,
		inputText = function ( selectedEmblemModel )
			if selectedEmblemModel then
				local emblemNameModel = Engine.GetModel( selectedEmblemModel, "emblemTextEntry" )
				return Engine.GetModelValue( emblemNameModel )
			else
				
			end
		end,
		listDatasource = function ( selectedEmblemModel )
			DataSources.EmblemSave_List = DataSourceHelpers.ListSetup( "EmblemSave_List", function ( controller )
				local saveButtonText = nil
				if IsPreBuiltEmblemTab( controller ) then
					saveButtonText = LocalizeToUpperString( "MENU_EMBLEM_SAVE_AS_NEW" )
				else
					saveButtonText = LocalizeToUpperString( "MENU_EMBLEM_SAVE_CHANGES" )
				end
				return {
					{
						models = {
							displayText = saveButtonText
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								EmblemEditor_SaveEmblem( menu, element, controller, selectedEmblemModel )
								ForceNotifyModel( controller, "Emblem.UpdateDataSource" )
							end
							
						}
					},
					{
						models = {
							displayText = LocalizeToUpperString( "MENU_EMBLEMS_DISCARD" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								EmblemEditor_DiscardChanges( menu, element, controller, selectedEmblemModel )
							end
							
						}
					}
				}
			end, true, nil )
			return "EmblemSave_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ( selectedEmblemModel )
			return function ( self, element, controller, menu )
				GoBack( menu, controller )
				PaintjobEditor_RestoreGridState( controller )
			end
			
		end,
		[CoD.OverlayUtility.ProcessActionKeyboardComplete] = function ( selectedEmblemModel )
			return function ( self, element, controller, menu )
				ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_EMBLEMS" )
			end
			
		end
	},
	PaintjobSave = {
		menuName = "SystemOverlay_Full",
		frameWidget = "CoD.systemOverlay_SavePaintjobFrame",
		title = Engine.Localize( "MENU_SAVE_PAINTJOB" ),
		description = Engine.Localize( "MENU_SAVE_PAINTJOB_DESC" ),
		categoryType = CoD.OverlayUtility.OverlayTypes.Save,
		inputText = function ( selectedPaintjobModel )
			if selectedPaintjobModel then
				local paintjobNameModel = Engine.GetModel( selectedPaintjobModel, "paintjobTextEntry" )
				return Engine.GetModelValue( paintjobNameModel )
			else
				
			end
		end,
		listDatasource = function ( selectedPaintjobModel )
			DataSources.PaintjobSave_List = DataSourceHelpers.ListSetup( "PaintjobSave_List", function ( controller )
				return {
					{
						models = {
							displayText = LocalizeToUpperString( "MENU_EMBLEM_SAVE_CHANGES" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								PaintjobEditor_SavePaintjob( self, element, controller, selectedPaintjobModel )
								ForceNotifyModel( controller, "Paintshop.UpdateDataSource" )
							end
							
						}
					},
					{
						models = {
							displayText = LocalizeToUpperString( "MENU_EMBLEMS_DISCARD" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								PaintjobEditor_DiscardChanges( menu, element, controller, selectedPaintjobModel )
							end
							
						}
					}
				}
			end, true, nil )
			return "PaintjobSave_List"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		[CoD.OverlayUtility.ProcessActionKeyboardComplete] = function ( selectedPaintjobModel )
			return function ( self, element, controller, menu )
				ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_PAINTJOB" )
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
			DataSources.DailyChallengeWarningOverlay = DataSourceHelpers.ListSetup( "DailyChallengeWarningOverlay", function ( controller )
				return {
					{
						models = {
							displayText = LocalizeToUpperString( "MENU_DISMISS" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								GoBack( menu, controller )
							end
							
						}
					},
					{
						models = {
							displayText = LocalizeToUpperString( "MENU_ABANDON_CHALLENGE" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								Engine.AbandonDailyChallenge( controller )
								GoBack( menu, controller )
							end
							
						}
					}
				}
			end, true, nil )
			return "DailyChallengeWarningOverlay"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ( self, element, controller, menu )
			return function ( self, menu, controller )
				local previousMenu = GoBack( menu, controller )
				OpenSystemOverlay( self, previousMenu, controller, "InspectDailyChallengeOverlay", nil )
			end
			
		end
	},
	InspectDailyChallengeOverlay = {
		menuName = "SystemOverlay_Full",
		frameWidget = "CoD.systemOverlay_DailyChallengeFrame",
		categoryType = CoD.OverlayUtility.OverlayTypes.Notice,
		title = function ( controller, element )
			CoD.perController[controller].dailyChallengeInfo = CoD.ChallengesUtility.GetDailyChallenge( controller, Enum.eModes.MODE_ZOMBIES )
			if not CoD.perController[controller].dailyChallengeInfo then
				return ""
			else
				local dailyChallengeInfo = CoD.perController[controller].dailyChallengeInfo
				return dailyChallengeInfo.challengeName
			end
		end,
		description = function ( controller, element )
			if not CoD.perController[controller].dailyChallengeInfo then
				return ""
			else
				local dailyChallengeInfo = CoD.perController[controller].dailyChallengeInfo
				return dailyChallengeInfo.challengeDescription
			end
		end,
		image = function ( controller, element )
			if not CoD.perController[controller].dailyChallengeInfo then
				return ""
			else
				local dailyChallengeInfo = CoD.perController[controller].dailyChallengeInfo
				return dailyChallengeInfo.image
			end
		end,
		fractionText = function ( controller, element )
			if not CoD.perController[controller].dailyChallengeInfo then
				return ""
			else
				local dailyChallengeInfo = CoD.perController[controller].dailyChallengeInfo
				return Engine.Localize( "MPUI_X_SLASH_Y", dailyChallengeInfo.currChallengeStatValue, dailyChallengeInfo.targetVal )
			end
		end,
		progressPercentage = function ( controller, element )
			if not CoD.perController[controller].dailyChallengeInfo then
				return 0
			else
				local dailyChallengeInfo = CoD.perController[controller].dailyChallengeInfo
				return dailyChallengeInfo.percentComplete
			end
		end,
		rewardText = function ( controller, element )
			if not CoD.perController[controller].dailyChallengeInfo then
				return ""
			else
				local dailyChallengeInfo = CoD.perController[controller].dailyChallengeInfo
				return dailyChallengeInfo.rewardText
			end
		end,
		listDatasource = function ()
			DataSources.InspectDailyChallengeOverlay = DataSourceHelpers.ListSetup( "InspectDailyChallengeOverlay", function ( controller )
				local buttonList = {}
				table.insert( buttonList, {
					models = {
						displayText = LocalizeToUpperString( "MENU_DISMISS" )
					},
					properties = {
						action = function ( self, element, controller, actionParam, menu )
							GoBack( menu, controller )
						end
					}
				} )
				if Engine.CanDailyChallengeBeAbandoned( controller ) then
					table.insert( buttonList, {
						models = {
							displayText = LocalizeToUpperString( "MENU_ABANDON_CHALLENGE" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								local previousMenu = GoBack( menu, controller )
								OpenSystemOverlay( self, previousMenu, controller, "DailyChallengeWarningOverlay", nil )
							end
						}
					} )
				end
				return buttonList
			end, true, nil )
			return "InspectDailyChallengeOverlay"
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	GunsmithCreateVariantNameOverlay = {
		menuName = "SystemOverlay_Full",
		frameWidget = "CoD.systemOverlay_CreateVariantNameFrame",
		categoryType = CoD.OverlayUtility.OverlayTypes.Save,
		title = function ( controller, selectedVariantElement )
			local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
			return Engine.Localize( LocalizeWeaponNameIntoString( "MENU_GUNSMITH_CREATE_VARIANT_NAME_TITLE", controller, weaponIndex ) )
		end,
		description = "",
		inputText = function ( controller, selectedVariantElement )
			local elementModel = selectedVariantElement:getModel()
			if elementModel then
				local variantTextEntryModel = Engine.GetModel( elementModel, "variantTextEntry" )
				return Engine.GetModelValue( variantTextEntryModel )
			else
				
			end
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ( controller, selectedVariantElement )
			return function ( self, element, controller, menu )
				Gunsmith_CreateVariantNameBack( selectedVariantElement, element, controller )
				GoBack( menu, controller )
				ClearMenuSavedState( menu )
			end
			
		end,
		[CoD.OverlayUtility.ProcessActionKeyboardComplete] = function ()
			return function ( self, element, controller, menu )
				ShowKeyboard( self, element, controller, "KEYBOARD_TYPE_GUNSMITH" )
			end
			
		end,
		[CoD.OverlayUtility.ProcessConfirmVariantName] = function ( controller, selectedVariantElement )
			return function ( self, element, controller, menu )
				Gunsmith_ConfirmVariantName( selectedVariantElement, element, controller, menu )
			end
			
		end
	},
	CraftNoChangesNotification = {
		menuName = "SystemOverlay_Compact",
		title = "MENU_EMBLEM_NO_CHANGES_TITLE",
		description = "MENU_EMBLEM_NO_CHANGES_DESC",
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ()
			DataSources.CraftNoChangesNotification = DataSourceHelpers.ListSetup( "CraftNoChangesNotification", function ( controller )
				return {
					{
						models = {
							displayText = "MENU_OK_CAPS"
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								EmblemEditor_NoChangesAction( self, element, controller, menu )
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
			DataSources.CampaignOfflineToOnlineWarning = DataSourceHelpers.ListSetup( "CampaignOfflineToOnlineWarning", function ( controller )
				return {
					{
						models = {
							displayText = "MENU_OK_CAPS"
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								GoBack( menu, controller )
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
								CoD.PCUtil.FreeOptionsDirtyModel( controller )
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
								UpdateGamerprofile( menu, element, controller )
								CoD.PCUtil.FreeOptionsDirtyModel( controller )
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
		menuName = "SystemOverlay_Compact",
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
								CoD.MetricsUtility.AccountCreated( self, controller, "1", "menu" )
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
				CoD.MetricsUtility.AccountCreated( self, controller, "1", "menu" )
				FinishRegistrationFlow( self, controller, menu )
			end
			
		end
	},
	OptInSuccess = {
		menuName = "SystemOverlay_Compact",
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
								CoD.MetricsUtility.AccountCreated( self, controller, "1", "menu" )
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
				CoD.MetricsUtility.AccountCreated( self, controller, "1", "menu" )
				FinishRegistrationFlow( self, controller, menu )
			end
			
		end
	},
	ConfirmPCGraphicsChange = {
		menuName = "SystemOverlay_Compact",
		title = Engine.Localize( "PLATFORM_CONFIRM_GRAPHICS_CHANGE" ),
		description = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.Settings,
		listDatasource = function ()
			DataSources.ConfirmPCGraphicsChange_List = DataSourceHelpers.ListSetup( "ConfirmPCGraphicsChange_List", function ( controller )
				return {
					{
						models = {
							displayText = Engine.Localize( "MENU_NO" )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								CoD.PCUtil.FreeOptionsDirtyModel( controller )
								GoBackMultiple( menu, controller, 2 )
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
								UpdateGamerprofile( menu, element, controller )
								CoD.PCUtil.FreeOptionsDirtyModel( controller )
								GoBack( menu, controller )
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
			DataSources.ResetPCGraphics_List = DataSourceHelpers.ListSetup( "ResetPCGraphics_List", function ( controller )
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
								ResetPCGraphicsOptions( menu, element, controller )
								UpdateGamerprofile( menu, element, controller )
								CoD.PCUtil.FreeOptionsDirtyModel( controller )
								GoBack( menu, controller )
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
		menuName = function ( size, title, description, image, buttonText, buttonAction, goBackAction )
			if size == CoD.OverlayUtility.GenericPopupSizes.Small then
				return "SystemOverlay_Compact"
			elseif size == CoD.OverlayUtility.GenericPopupSizes.Large then
				return "SystemOverlay_Full"
			else
				
			end
		end,
		title = function ( size, title, description, image, buttonText, buttonAction, goBackAction )
			return Engine.Localize( title )
		end,
		description = function ( size, title, description, image, buttonText, buttonAction, goBackAction )
			return Engine.Localize( description )
		end,
		image = function ( size, title, description, image, buttonText, buttonAction, goBackAction )
			if image and image ~= "" then
				return image
			else
				
			end
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ( size, title, description, image, buttonText, buttonAction, goBackAction )
			if buttonText then
				local datasourceName = "GenericPopup_" .. title
				DataSources[datasourceName] = DataSourceHelpers.ListSetup( datasourceName .. "_List", function ( controller )
					local action = buttonAction
					if not action or type( action ) ~= "function" then
						action = CoD.OverlayUtility.DefaultButtonAction
					end
					return {
						{
							models = {
								displayText = Engine.Localize( buttonText )
							},
							properties = {
								action = action
							}
						}
					}
				end, true, nil )
				return datasourceName
			else
				
			end
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ( size, title, description, image, buttonText, buttonAction, goBackAction )
			if goBackAction and type( goBackAction ) == "function" then
				return goBackAction
			else
				return CoD.OverlayUtility.DefaultGoBack()
			end
		end
	},
	GenericModalDialog = {
		menuName = CoD.OverlayUtility.AutoSizeMenuFromDescription( "GenericModalDialog" ),
		title = function ( title, description, image, buttons, callbackFn )
			return Engine.Localize( title )
		end,
		description = function ( title, description, image, buttons, callbackFn )
			return Engine.Localize( description )
		end,
		image = function ( title, description, image, buttons, callbackFn )
			if image and image ~= "" then
				return image
			else
				
			end
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ( title, description, image, buttons, callbackFn )
			local datasourceName = "GenericModalDialog" .. title
			DataSources[datasourceName] = DataSourceHelpers.ListSetup( datasourceName .. "_List", function ( controller )
				local results = {}
				for index, button in ipairs( buttons ) do
					table.insert( results, {
						models = {
							displayText = Engine.Localize( button )
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								if not callbackFn or callbackFn( index - 1 ) then
									GoBack( menu, controller )
								end
							end
						}
					} )
				end
				return results
			end, true, nil )
			return datasourceName
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ( title, description, image, buttons, callbackFn )
			return function ( self, element, controller, menu )
				if callbackFn then
					callbackFn()
				end
				GoBack( menu, controller )
			end
			
		end
	},
	LobbyLeavePopup = {
		menuName = CoD.OverlayUtility.FreeCursorAutoSizeMenuFromDescription( "LobbyLeavePopup" ),
		title = function ( popupType )
			local title = ""
			if popupType == LuaEnum.LEAVE_LOBBY_POPUP.LEAVE_PARTY then
				title = "MENU_LEAVE_LOBBY_LEAVE_PARTY_TITLE"
			elseif popupType == LuaEnum.LEAVE_LOBBY_POPUP.LEAVE_AND_DISBAND_PARTY then
				title = "MENU_LEAVE_LOBBY_DISBAND_FROM_PARTY_TITLE"
			elseif popupType == LuaEnum.LEAVE_LOBBY_POPUP.LEAVE_LOBBY then
				title = "MENU_LEAVE_LOBBY_LEAVE_LOBBY_TITLE"
			elseif popupType == LuaEnum.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY then
				title = "MENU_LEAVE_LOBBY_LEAVE_PARTY_TITLE"
			elseif popupType == LuaEnum.LEAVE_LOBBY_POPUP.BRING_PARTY_LEAVE_ALONE then
				title = "MENU_LEAVE_LOBBY_LEAVE_LOBBY_TITLE"
			elseif popupType == LuaEnum.LEAVE_LOBBY_POPUP.MANAGE_PARTY_LEAVE then
				title = "MENU_LEAVE_LOBBY_MANAGE_PARTY_LEAVE_TITLE"
			end
			return Engine.Localize( title )
		end,
		description = function ( popupType )
			local description = ""
			if popupType == LuaEnum.LEAVE_LOBBY_POPUP.LEAVE_PARTY then
				description = "MENU_LEAVE_LOBBY_LEAVE_PARTY_HINT"
			elseif popupType == LuaEnum.LEAVE_LOBBY_POPUP.LEAVE_AND_DISBAND_PARTY then
				description = "MENU_LEAVE_LOBBY_DISBAND_FROM_PARTY_HINT"
			elseif popupType == LuaEnum.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY then
				description = "MENU_LEAVE_LOBBY_LEAVE_PARTY_HINT"
			elseif popupType == LuaEnum.LEAVE_LOBBY_POPUP.MANAGE_PARTY_LEAVE then
				description = "MENU_LEAVE_LOBBY_MANAGE_PARTY_LEAVE_HINT"
			end
			return Engine.Localize( description )
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Quit,
		postCreateStep = function ( overlay, controller )
			local lockedInModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyLockedIn" )
			overlay:subscribeToModel( lockedInModel, function ( model )
				local lockedIn = Engine.GetModelValue( model )
				if lockedIn == true then
					GoBack( overlay, controller )
				end
			end )
		end,
		getGoBackFn = function ( leavePartyType, lobbyName )
			return function ( menu, controller )
				local lobbyMenu = GoBackToMenu( menu, controller, "Lobby" )
				DisableAllMenuInput( lobbyMenu, nil )
				if leavePartyType == nil then
					return 
				elseif lobbyMenu.ClientList ~= nil then
					lobbyMenu.ClientList:processEvent( {
						name = "lose_focus",
						controller = controller
					} )
				end
				if IsIntDvarNonZero( "mp_prototype" ) then
					CoD.LobbyUtility.NavigateToLobby( menu, lobbyName, false, controller )
				else
					Engine.LobbyEvent( "OnGoBack", {
						controller = controller,
						withParty = leavePartyType
					} )
				end
			end
			
		end,
		[CoD.OverlayUtility.aCrossPromptFn] = function ( popupType, lobbyName )
			if popupType == LuaEnum.LEAVE_LOBBY_POPUP.LEAVE_PARTY then
				return CoD.OverlayUtility.Overlays.LobbyLeavePopup.getGoBackFn( LuaEnum.LEAVE_WITH_PARTY.WITHOUT )
			elseif popupType == LuaEnum.LEAVE_LOBBY_POPUP.LEAVE_AND_DISBAND_PARTY then
				return CoD.OverlayUtility.Overlays.LobbyLeavePopup.getGoBackFn( LuaEnum.LEAVE_WITH_PARTY.WITHOUT )
			elseif popupType == LuaEnum.LEAVE_LOBBY_POPUP.LEAVE_LOBBY then
				return CoD.OverlayUtility.Overlays.LobbyLeavePopup.getGoBackFn( LuaEnum.LEAVE_WITH_PARTY.WITHOUT )
			elseif popupType == LuaEnum.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY then
				return CoD.OverlayUtility.Overlays.LobbyLeavePopup.getGoBackFn( LuaEnum.LEAVE_WITH_PARTY.WITHOUT, lobbyName )
			elseif popupType == LuaEnum.LEAVE_LOBBY_POPUP.BRING_PARTY_LEAVE_ALONE then
				return CoD.OverlayUtility.Overlays.LobbyLeavePopup.getGoBackFn( LuaEnum.LEAVE_WITH_PARTY.WITHOUT )
			elseif popupType == LuaEnum.LEAVE_LOBBY_POPUP.MANAGE_PARTY_LEAVE then
				return function ( menu, controller )
					GoBack( menu, controller )
					Engine.LobbyEvent( "OnManagePartyLeave", {
						controller = controller
					} )
				end
				
			else
				return nil
			end
		end,
		[CoD.OverlayUtility.aCrossPromptText] = function ( popupType )
			if popupType == LuaEnum.LEAVE_LOBBY_POPUP.LEAVE_PARTY then
				return "MENU_LEAVE_LOBBY_LEAVE_PARTY"
			elseif popupType == LuaEnum.LEAVE_LOBBY_POPUP.LEAVE_AND_DISBAND_PARTY then
				return "MENU_LEAVE_LOBBY_LEAVE_AND_DISBAND_PARTY"
			elseif popupType == LuaEnum.LEAVE_LOBBY_POPUP.LEAVE_LOBBY then
				return "MENU_LEAVE_LOBBY_LEAVE_LOBBY"
			elseif popupType == LuaEnum.LEAVE_LOBBY_POPUP.LEAVE_LOBBY_AND_PARTY then
				return "MENU_LEAVE_LOBBY_LEAVE_LOBBY_AND_PARTY"
			elseif popupType == LuaEnum.LEAVE_LOBBY_POPUP.BRING_PARTY_LEAVE_ALONE then
				return "MENU_LEAVE_LOBBY_LEAVE_ALONE"
			elseif popupType == LuaEnum.LEAVE_LOBBY_POPUP.MANAGE_PARTY_LEAVE then
				return "MENU_CONFIRM_CAPS"
			else
				return ""
			end
		end,
		[CoD.OverlayUtility.bCirclePromptFn] = function ( popupType )
			return CoD.OverlayUtility.Overlays.LobbyLeavePopup.getGoBackFn( nil )
		end,
		[CoD.OverlayUtility.bCirclePromptText] = "MENU_LEAVE_LOBBY_CANCEL",
		[CoD.OverlayUtility.xSquarePromptFn] = function ( popupType )
			if popupType == LuaEnum.LEAVE_LOBBY_POPUP.BRING_PARTY_LEAVE_ALONE then
				return CoD.OverlayUtility.Overlays.LobbyLeavePopup.getGoBackFn( LuaEnum.LEAVE_WITH_PARTY.WITH )
			else
				return nil
			end
		end,
		[CoD.OverlayUtility.xSquarePromptText] = function ( popupType )
			if popupType == LuaEnum.LEAVE_LOBBY_POPUP.BRING_PARTY_LEAVE_ALONE then
				return "MENU_LEAVE_LOBBY_BRING_PARTY"
			else
				return ""
			end
		end
	},
	LobbyLocalClientWarning = {
		menuName = CoD.OverlayUtility.AutoSizeMenuFromDescription( "LobbyLocalClientWarning" ),
		title = "MENU_DISBAND_PARTY_CAPS",
		description = "MENU_NO_SPLITSCREEN_ALLOWED_DESC",
		image = "",
		categoryType = CoD.OverlayUtility.OverlayTypes.Alert,
		listDatasource = function ( data )
			DataSources.LobbyLocalClientWarningButtons = DataSourceHelpers.ListSetup( "LobbyLocalClientWarningButtons", function ()
				return {
					{
						models = {
							displayText = "MENU_CONTINUE_AND_DISBAND"
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								GoBack( menu, controller )
								data.disbandParty = true
								for subController = 1, Engine.GetMaxControllerCount() - 1, 1 do
									LobbyRemoveLocalClientFromLobby( self, subController )
								end
								if data.navToMenu ~= nil then
									Engine.LobbyEvent( "OnGoForward", data )
								elseif data.popupName ~= nil and data.openFromMenu ~= nil then
									OpenPopup( data.openFromMenu, data.popupName, 0 )
								elseif data.actionFunc ~= nil then
									data:actionFunc()
								end
							end
							
						}
					},
					{
						models = {
							displayText = "MENU_CANCEL"
						},
						properties = {
							action = function ( self, element, controller, actionParam, menu )
								if menu.occludedMenu and menu.occludedMenu.openOverlayAfterSpinner then
									menu.occludedMenu.openOverlayAfterSpinner = nil
								end
								GoBack( menu, controller )
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
			return Engine.Localize( Engine.TableLookup( CoD.rankTable, 5, 0, CoD.MAX_RANK ) )
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
		description = function ( stringRef, url, forwardFn )
			return Engine.Localize( stringRef, url )
		end,
		listDatasource = function ( stringRef, url, forwardFn )
			DataSources.AnticheatMessageButtons = DataSourceHelpers.ListSetup( "AnticheatMessageButtons", function ( controller )
				local urlString = url
				local forwardFunction = forwardFn
				local result = {}
				if urlString ~= "" then
					table.insert( result, {
						models = {
							displayText = Engine.Localize( "MENU_INFO" )
						},
						properties = {
							action = OpenAnticheatPolicyInBrowser
						}
					} )
				end
				table.insert( result, {
					models = {
						displayText = Engine.Localize( "MENU_OK" )
					},
					properties = {
						action = forwardFunction
					}
				} )
				return result
			end, true, nil )
			return "AnticheatMessageButtons"
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Error,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
	},
	ReportPlayer = {
		menuName = "FeatureOverlay",
		frameWidget = "CoD.systemOverlay_reportPlayer",
		xuid = function ( controller, element, data )
			return data.xuid
		end,
		gamertag = function ( controller, element, data )
			return data.gamertag
		end,
		clantag = function ( controller, element, data )
			return data.clantag
		end,
		emblemBacking = function ( controller, element, data )
			return data.emblemBacking
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.Unlock,
		[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack,
		listDatasource = function ( controller, element, data )
			local xuid = data.xuid
			DataSources.ReportOptions = DataSourceHelpers.ListSetup( "ReportOptions", function ( controller )
				local result = {
					{
						models = {
							displayText = "MENU_REPORT_USER_OFFENSIVE_CAPS"
						},
						properties = {
							action = function ( self, element, controller, param, menu )
								Engine.ReportUser( xuid, "offensive", 1, true )
								GoBack( self, controller )
							end,
							actionParam = xuid
						}
					},
					{
						models = {
							displayText = "MENU_REPORT_USER_OFFENSIVE_EMBLEM_CAPS"
						},
						properties = {
							action = function ( self, element, controller, param, menu )
								Engine.ReportUser( xuid, "offensive_emblem", 1, true )
								GoBack( self, controller )
							end,
							actionParam = xuid
						}
					},
					{
						models = {
							displayText = "MENU_REPORT_USER_OFFENSIVE_PAINTJOB_CAPS"
						},
						properties = {
							action = function ( self, element, controller, param, menu )
								Engine.ReportUser( xuid, "offensive_paintjob", 1, true )
								GoBack( self, controller )
							end,
							actionParam = xuid
						}
					},
					{
						models = {
							displayText = "MENU_REPORT_USER_CHEATER_CAPS"
						},
						properties = {
							action = function ( self, element, controller, param, menu )
								Engine.ReportUser( xuid, "cheater", 1, true )
								GoBack( self, controller )
							end,
							actionParam = xuid
						}
					},
					{
						models = {
							displayText = "MENU_REPORT_USER_BOOSTER_CAPS"
						},
						properties = {
							action = function ( self, element, controller, param, menu )
								Engine.ReportUser( xuid, "booster", 1, true )
								GoBack( self, controller )
							end,
							actionParam = xuid
						}
					}
				}
				return result
			end )
			return "ReportOptions"
		end
	},
	GroupsNotificationPopup = {
		menuName = "SystemOverlay_Compact",
		title = function ( controller, title, description, image, buttonText, buttonAction, goBackAction )
			if IsProcessingGroupTask( controller ) then
				return Engine.Localize( "GROUPS_PROCESSING_WAIT_TEXT" )
			else
				return Engine.Localize( title )
			end
		end,
		frameWidget = "CoD.SystemOverlay_GroupsNotification",
		description = function ( controller, title, description, image, buttonText, buttonAction, goBackAction )
			if IsProcessingGroupTask( controller ) then
				return ""
			else
				return Engine.Localize( description )
			end
		end,
		postCreateStep = function ( overlay, controller )
			overlay:subscribeToModel( GetProcessingGroupTaskModel( controller ), function ( model )
				overlay:refreshData( nil )
			end )
		end,
		categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
		listDatasource = function ( controller, title, description, image, buttonText, buttonAction, goBackAction )
			if buttonText then
				local datasourceName = "GroupsNotificationButtons"
				DataSources[datasourceName] = DataSourceHelpers.ListSetup( datasourceName .. "_List", function ( controller )
					local action = buttonAction
					if not action or type( action ) ~= "function" then
						action = CoD.OverlayUtility.DefaultButtonAction
					end
					if IsProcessingGroupTask( controller ) then
						return {}
					else
						return {
							{
								models = {
									displayText = Engine.Localize( buttonText )
								},
								properties = {
									action = action
								}
							}
						}
					end
				end, true, nil, function ( controller, list, listModel )
					local updateModel = GetProcessingGroupTaskModel( controller )
					if list.updateSubscription then
						list:removeSubscription( list.updateSubscription )
					end
					list.updateSubscription = list:subscribeToModel( updateModel, function ()
						list:updateDataSource( false )
					end, false )
				end )
				return datasourceName
			else
				
			end
		end,
		[CoD.OverlayUtility.GoBackPropertyName] = function ( controller, title, description, image, buttonText, buttonAction, goBackAction )
			if goBackAction and type( goBackAction ) == "function" then
				return goBackAction
			else
				return CoD.OverlayUtility.DefaultGoBack()
			end
		end
	}
} )
CoD.OverlayUtility.AddSystemOverlay = function ( overlayName, overlayData )
	if LUI.DEV and CoD.OverlayUtility.Overlays[overlayName] then
		LUI.DEV.PrintCallstack( "Overlay " .. overlayName .. " already exists. Overwritting." )
	end
	CoD.OverlayUtility.Overlays[overlayName] = overlayData
end

CoD.OverlayUtility.OverlayCloseMethod = function ( menu, controller )
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

CoD.OverlayUtility.RefreshOverlayModels = function ( baseModel, overlayData, vargs )
	for _, key in ipairs( CoD.OverlayUtility.OverlayModelFields ) do
		local f324_local3 = nil
		local newModel = Engine.CreateModel( baseModel, key )
		f324_local3 = CoD.OverlayUtility.callFnOrGetValue( overlayData[key], vargs )
		if not f324_local3 and CoD.OverlayUtility.DefaultModelFields[key] then
			f324_local3 = CoD.OverlayUtility.callFnOrGetValue( CoD.OverlayUtility.DefaultModelFields[key], {
				overlayData,
				vargs
			} )
		end
		if f324_local3 ~= nil then
			Engine.SetModelValue( newModel, f324_local3 )
		end
	end
end

CoD.OverlayUtility.RefreshOverlayProperties = function ( overlay, overlayData, vargs )
	for _, key in ipairs( CoD.OverlayUtility.OverlayPropertyFields ) do
		local f325_local3 = nil
		f325_local3 = CoD.OverlayUtility.callFnOrGetValue( overlayData[key], vargs )
		if not f325_local3 and CoD.OverlayUtility.DefaultPropertyFields[key] then
			f325_local3 = CoD.OverlayUtility.callFnOrGetValue( CoD.OverlayUtility.DefaultPropertyFields[key], {
				overlayData,
				vargs
			} )
		end
		overlay[key] = f325_local3
	end
end

CoD.OverlayUtility.RefreshOverlayPrompts = function ( overlay, overlayData, vargs )
	for button, key in pairs( CoD.OverlayUtility.ButtonPromptsFields ) do
		local buttonModel = overlay.buttonModel[button]
		if buttonModel then
			local value = nil
			value = CoD.OverlayUtility.callFnOrGetValue( overlayData[key], vargs )
			if not value and CoD.OverlayUtility.DefaultPropertyFields[key] then
				value = CoD.OverlayUtility.callFnOrGetValue( CoD.OverlayUtility.DefaultPropertyFields[key], {
					overlayData,
					vargs
				} )
			end
			local f326_local3 = buttonModel:create( "overlayLabel" )
			f326_local3:set( value or "" )
			buttonModel.Label:forceNotifySubscriptions()
		end
	end
end

CoD.OverlayUtility.RefreshOverlayDataFunction = function ( overlay, vargs )
	return function ()
		CoD.OverlayUtility.RefreshOverlayModels( overlay:getModel(), CoD.OverlayUtility.Overlays[overlay.menuName], vargs )
		CoD.OverlayUtility.RefreshOverlayProperties( overlay, CoD.OverlayUtility.Overlays[overlay.menuName], vargs )
		CoD.OverlayUtility.RefreshOverlayPrompts( overlay, CoD.OverlayUtility.Overlays[overlay.menuName], vargs )
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
			local f330_local3 = nil
			local newModel = Engine.CreateModel( baseModel, key )
			if type( overlayData[key] ) == "function" then
				f330_local3 = overlayData[key]( unpack( vargs ) )
			else
				f330_local3 = overlayData[key]
			end
			if not f330_local3 and CoD.OverlayUtility.DefaultModelFields[key] then
				f330_local3 = CoD.OverlayUtility.callFnOrGetValue( CoD.OverlayUtility.DefaultModelFields[key], {
					overlayData,
					vargs
				} )
			end
			if f330_local3 ~= nil then
				Engine.SetModelValue( newModel, f330_local3 )
			end
		end
	end
	
	if CoD.OverlayUtility.Overlays[overlayName] then
		local overlayData = CoD.OverlayUtility.Overlays[overlayName]
		local menuName = CoD.OverlayUtility.callFnOrGetValue( overlayData.menuName, vargs )
		if menuName then
			if CoD.Menu.ModelToUse then
				CoD.OverlayUtility.RefreshOverlayModels( CoD.Menu.ModelToUse, overlayData, vargs )
			end
			CoD.Menu.OverwriteMenuName = overlayName
			if not overlayData.openMethod or overlayData.openMethod == CoD.OverlayUtility.OpenMethods.Popup then
				menu = OpenPopup( currentMenu, menuName, controller )
			elseif overlayData.openMethod == CoD.OverlayUtility.OpenMethods.Overlay then
				menu = OpenOverlay( currentMenu, menuName, controller )
			end
			CoD.Menu.OverwriteMenuName = nil
			if menu then
				menu.refreshData = CoD.OverlayUtility.RefreshOverlayDataFunction( menu, vargs )
				CoD.OverlayUtility.RefreshOverlayProperties( menu, overlayData, vargs )
				CoD.OverlayUtility.RefreshOverlayPrompts( menu, overlayData, vargs )
				local menuModel = menu:getModel()
				if not menuModel then
					menu.overlayModelName = "Overlay." .. overlayName
					menuModel = Engine.CreateModel( Engine.GetModelForController( controller ), menu.overlayModelName )
					CoD.OverlayUtility.RefreshOverlayModels( menuModel, overlayData, vargs )
					menu:setModel( menuModel )
				end
				LUI.OverrideFunction_CallOriginalFirst( menu, "close", CoD.OverlayUtility.OverlayCloseMethod( menu, controller ) )
				if overlayData.postCreateStep then
					overlayData.postCreateStep( menu, controller )
				end
				menu:UpdateAllButtonPrompts( controller )
				if (menuName == "SystemOverlay_FreeCursor" or menuName == "SystemOverlay_MessageDialog" or menuName == "SystemOverlay_FreeCursor_Full" or menuName == "SystemOverlay_MessageDialogFull") and not overlayData.allowFreeCursor then
					MenuHidesFreeCursor( menu, controller )
				end
			end
		end
	end
	return menu
end

CoD.OverlayUtility.ShowToast = function ( state, kicker, description, contentIcon, functionIcon, emblemDecal, callingCard )
	local frontendToastModel = Engine.CreateModel( Engine.GetModelForController( Engine.GetPrimaryController() ), "FrontendToast" )
	Engine.SetModelValue( Engine.CreateModel( frontendToastModel, "state" ), state or "DefaultState" )
	Engine.SetModelValue( Engine.CreateModel( frontendToastModel, "kicker" ), kicker or "" )
	Engine.SetModelValue( Engine.CreateModel( frontendToastModel, "description" ), description or "" )
	Engine.SetModelValue( Engine.CreateModel( frontendToastModel, "contentIcon" ), contentIcon or "blacktransparent" )
	Engine.SetModelValue( Engine.CreateModel( frontendToastModel, "functionIcon" ), functionIcon or "blacktransparent" )
	Engine.SetModelValue( Engine.CreateModel( frontendToastModel, "backgroundId" ), callingCard )
	Engine.SetModelValue( Engine.CreateModel( frontendToastModel, "emblemDecal" ), emblemDecal or 0 )
	Engine.SetModelValue( Engine.CreateModel( frontendToastModel, "notify" ), true )
end

CoD.OverlayUtility.HasOverlayACrossAction = function ( menu )
	return menu[CoD.OverlayUtility.aCrossPromptFn] ~= nil
end

CoD.OverlayUtility.PerformOverlayACrossAction = function ( menu, controller )
	menu[CoD.OverlayUtility.aCrossPromptFn]( menu, controller )
end

CoD.OverlayUtility.HasOverlayBCircleAction = function ( menu )
	return menu[CoD.OverlayUtility.bCirclePromptFn] ~= nil
end

CoD.OverlayUtility.PerformOverlayBCircleAction = function ( menu, controller )
	menu[CoD.OverlayUtility.bCirclePromptFn]( menu, controller )
end

CoD.OverlayUtility.HasOverlayXSquareAction = function ( menu )
	return menu[CoD.OverlayUtility.xSquarePromptFn] ~= nil
end

CoD.OverlayUtility.PerformOverlayXSquareAction = function ( menu, controller )
	menu[CoD.OverlayUtility.xSquarePromptFn]( menu, controller )
end

CoD.OverlayUtility.HasOverlayYTriangleAction = function ( menu )
	return menu[CoD.OverlayUtility.yTrianglePromptFn] ~= nil
end

CoD.OverlayUtility.PerformOverlayYTriangleAction = function ( menu, controller )
	menu[CoD.OverlayUtility.yTrianglePromptFn]( menu, controller )
end

