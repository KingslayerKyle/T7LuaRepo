require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Shared.LuaUtils" )

Lobby.Interrupt = {}
Lobby.Interrupt.NONE = nil
Lobby.Interrupt.BACK = 1
Lobby.Interrupt.FAILED_ACTION = 2
Lobby.Interrupt.ERROR_MSG = 3
Lobby.Interrupt.Back = function ( f1_arg0, f1_arg1 )
	return {
		isInterrupt = true,
		name = "InterruptBack",
		interruptFuncPtr = f1_arg0,
		params = f1_arg1,
		createFuncPtr = function ( f2_arg0, f2_arg1 )
			return f2_arg0.interruptFuncPtr( Lobby.Interrupt.BACK, f2_arg0.params, {
				action = nil,
				errorMsg = nil
			} )
		end
		
	}
end

Lobby.Interrupt.FailedAction = function ( f3_arg0, f3_arg1 )
	return {
		isInterrupt = true,
		name = "InterruptFailedAction",
		interruptFuncPtr = f3_arg0,
		params = f3_arg1,
		createFuncPtr = function ( f4_arg0, f4_arg1 )
			return f4_arg0.interruptFuncPtr( Lobby.Interrupt.FAILED_ACTION, f4_arg0.params, {
				action = f4_arg1,
				errorMsg = nil
			} )
		end
		
	}
end

Lobby.Interrupt.ErrorMsg = function ( f5_arg0, f5_arg1, f5_arg2 )
	return {
		isInterrupt = true,
		name = "InterruptErrorMsg",
		interruptFuncPtr = f5_arg0,
		params = f5_arg1,
		errorMsg = f5_arg2,
		createFuncPtr = function ( f6_arg0, f6_arg1 )
			return f6_arg0.interruptFuncPtr( Lobby.Interrupt.ERROR_MSG, f6_arg0.params, {
				action = f6_arg1,
				errorMsg = f6_arg0.errorMsg
			} )
		end
		
	}
end

Lobby.Actions = {}
Lobby.Actions.EmptyAction = function ()
	return {
		name = "EmptyAction",
		startFuncPtr = function ( f8_arg0 )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f8_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.ExecuteScript = function ( f9_arg0, f9_arg1 )
	return {
		name = "ExecuteScript",
		inlineFunction = f9_arg0,
		functionParam = f9_arg1,
		startFuncPtr = function ( f10_arg0 )
			f10_arg0.inlineFunction( f10_arg0.functionParam )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f10_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.ExecuteScriptWithReturn = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
	return {
		name = "ExecuteScript",
		inlineFunction = f11_arg0,
		startFuncPtr = function ( f12_arg0 )
			local f12_local0 = f12_arg0.inlineFunction()
			if f12_local0 == f11_arg1 then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f12_arg0.actionId
				} )
				return 
			elseif f12_local0 == f11_arg2 then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f12_arg0.actionId
				} )
				return 
			elseif f12_local0 == f11_arg3 then
				LobbyVM.ProcessCompleteError( {
					actionId = f12_arg0.actionId
				} )
				return 
			else
				LobbyVM.ProcessCompleteError( {
					actionId = f12_arg0.actionId
				} )
			end
		end
		
	}
end

Lobby.Actions.LuiEvent = function ( f13_arg0, f13_arg1 )
	return {
		name = "LuiEvent: " .. f13_arg0,
		event = f13_arg0,
		data = f13_arg1,
		startFuncPtr = function ( f14_arg0 )
			f14_arg0.data.actionId = f14_arg0.actionId
			Engine.LuiVM_Event( f14_arg0.event, f14_arg0.data )
		end
		
	}
end

Lobby.Actions.LobbyVMCall = function ( f15_arg0, f15_arg1 )
	return {
		name = "LobbyVMCall",
		lobbyVMFunc = f15_arg0,
		data = f15_arg1,
		startFuncPtr = function ( f16_arg0 )
			f16_arg0.lobbyVMFunc( f16_arg0.data )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f16_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.LobbyVMCallRetVal = function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3, f17_arg4 )
	return {
		name = "LobbyVMCallRetVal",
		lobbyVMFunc = f17_arg0,
		data = f17_arg1,
		successVal = f17_arg2,
		failureVal = f17_arg3,
		errorVal = f17_arg4,
		startFuncPtr = function ( f18_arg0 )
			local f18_local0 = f18_arg0.lobbyVMFunc( f18_arg0.data )
			if f18_local0 == f18_arg0.successVal then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f18_arg0.actionId
				} )
				return 
			elseif f18_local0 == f18_arg0.failureVal then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f18_arg0.actionId
				} )
				return 
			elseif f18_local0 == f18_arg0.errorVal then
				LobbyVM.ProcessCompleteError( {
					actionId = f18_arg0.actionId
				} )
				return 
			else
				LobbyVM.ProcessCompleteError( {
					actionId = f18_arg0.actionId
				} )
			end
		end
		
	}
end

Lobby.Actions.TimeDelay = function ( f19_arg0 )
	return {
		name = "TimeDelay(" .. f19_arg0 .. "ms)",
		timeDelayMilliseconds = f19_arg0,
		endTime = nil,
		startFuncPtr = function ( f20_arg0 )
			if f20_arg0.timeDelayMilliseconds == 0 then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f20_arg0.actionId
				} )
				return 
			else
				f20_arg0.endTime = f20_arg0.timeDelayMilliseconds + Engine.milliseconds()
			end
		end
		,
		pumpFuncPtr = function ( f21_arg0, f21_arg1 )
			if f21_arg0.endTime < Engine.milliseconds() then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f21_arg0.actionId
				} )
				return 
			else
				
			end
		end
		,
		cancelFuncPtr = function ( f22_arg0 )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f22_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.OpenSpinner = function ( f23_arg0, f23_arg1 )
	return {
		name = "OpenSpinner",
		showCancelButton = f23_arg0,
		closeAllPopups = f23_arg1,
		startFuncPtr = function ( f24_arg0 )
			if f24_arg0.showCancelButton == nil then
				f24_arg0.showCancelButton = false
			end
			if f24_arg0.closeAllPopups then
				Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.closePopups" ) )
			end
			Engine.LuiVM_Event( "lobby_spinner_popup", {
				openPopup = true,
				showCancelButton = f24_arg0.showCancelButton,
				immediate = true
			} )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f24_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.CloseSpinner = function ()
	return {
		name = "CloseSpinner",
		startFuncPtr = function ( f26_arg0 )
			Engine.LuiVM_Event( "lobby_spinner_popup", {
				openPopup = false
			} )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f26_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.IsConditionTrue = function ( f27_arg0 )
	return {
		name = "IsConditionTrue(value: " .. tostring( f27_arg0 ) .. ")",
		condition = f27_arg0,
		startFuncPtr = function ( f28_arg0 )
			if f27_arg0 then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f28_arg0.actionId
				} )
			else
				LobbyVM.ProcessCompleteFailure( {
					actionId = f28_arg0.actionId
				} )
			end
		end
		
	}
end

Lobby.Actions.WaitTillOutOfGame = function ()
	return {
		name = "WaitTillOutOfGame",
		startFuncPtr = function ( f30_arg0 )
			if Engine.IsInGame() == false then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f30_arg0.actionId
				} )
			end
		end
		,
		pumpFuncPtr = function ( f31_arg0, f31_arg1 )
			if Engine.IsInGame() == false then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f31_arg0.actionId
				} )
			end
		end
		
	}
end

Lobby.Actions.CanAcceptPlatformInvite = function ( f32_arg0 )
	return {
		name = "CanAcceptPlatformInvite(controller: " .. tostring( f32_arg0 ) .. ")",
		controller = f32_arg0,
		startFuncPtr = function ( f33_arg0 )
			local f33_local0 = true
			if LuaUtils.IsSkuOfflineOnly() then
				f33_local0 = false
			end
			if f33_local0 then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f33_arg0.actionId
				} )
			else
				LobbyVM.ProcessCompleteFailure( {
					actionId = f33_arg0.actionId
				} )
			end
		end
		
	}
end

Lobby.Actions.CanPlayOnline = function ( f34_arg0 )
	return {
		name = "CanPlayOnline(controller: " .. tostring( f34_arg0 ) .. ")",
		controller = f34_arg0,
		checkPlusEndTime = 0,
		startFuncPtr = function ( f35_arg0 )
			local f35_local0 = f35_arg0.controller
			local f35_local1 = true
			if LuaUtils.isPS4 then
				if not Engine.IsSignedIntoPSN( f35_local0 ) then
					Engine.DisplayNpError( f35_local0, "-2141913082" )
					f35_local1 = false
				elseif Engine.DisplayNpAvailabilityErrors( f35_local0 ) then
					f35_local1 = false
				else
					local f35_local2, f35_local3 = Engine.CheckPSPlus( f35_local0 )
					if f35_local2 == true then
						if f35_local3 == false then
							f35_local1 = false
							Engine.DisplayUpsellAndContentWarnings( f35_local0 )
						end
					else
						f35_arg0.checkPlusEndTime = Engine.milliseconds() + LuaEnums.PS_PLUS_CHECK_TIME
						return 
					end
				end
			end
			if f35_local1 then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f35_arg0.actionId
				} )
			else
				LobbyVM.ProcessCompleteFailure( {
					actionId = f35_arg0.actionId
				} )
			end
		end
		,
		pumpFuncPtr = function ( f36_arg0 )
			local f36_local0 = false
			if LuaUtils.isPS4 then
				local f36_local1, f36_local2 = Engine.CheckPSPlus( f34_arg0 )
				if f36_local1 == false and f36_arg0.checkPlusEndTime > Engine.milliseconds() then
					return 
				elseif f36_local2 == true then
					f36_local0 = true
				else
					Engine.DisplayUpsellAndContentWarnings( f34_arg0 )
				end
			end
			if f36_local0 then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f36_arg0.actionId
				} )
			else
				LobbyVM.ProcessCompleteFailure( {
					actionId = f36_arg0.actionId
				} )
			end
		end
		
	}
end

Lobby.Actions.DisableConnectingToDemonware = function ( f37_arg0 )
	return {
		name = "DisableConnectingToDemonware",
		controller = f37_arg0,
		startFuncPtr = function ( f38_arg0 )
			if Engine.IsSignedInToDemonware( f38_arg0.controller ) and not Engine.IsDemonwareFetchingDone( f37_arg0 ) and Engine.LiveConnectDisconnectFromDemonware then
				Engine.LiveConnectDisconnectFromDemonware( f38_arg0.controller )
			end
			Engine.LiveConnectDisableDemonwareConnect()
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f38_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.EnableConnectingToDemonware = function ( f39_arg0 )
	return {
		name = "EnableConnectingToDemonware",
		controller = f39_arg0,
		startFuncPtr = function ( f40_arg0 )
			Engine.LiveConnectEnableDemonwareConnect()
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f40_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.ConnectingToDemonware = function ( f41_arg0, f41_arg1, f41_arg2 )
	return {
		name = "ConnectingToDemonware(check for " .. f41_arg1 .. "ms)",
		controller = f41_arg0,
		waitMilliseconds = f41_arg1,
		invite = f41_arg2,
		endTime = nil,
		checkInterval = 100,
		checkTime = nil,
		startFuncPtr = function ( f42_arg0 )
			if f42_arg0.waitMilliseconds == 0 and Engine.IsDemonwareFetchingDone( f42_arg0.controller ) then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f42_arg0.actionId
				} )
				return 
			elseif f41_arg2 == true or Engine.GetLobbyUIScreen() == LobbyData.UITargets.UI_MAIN.id then
				Engine.SetLobbyNetworkMode( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
			end
			Engine.LiveConnectEnableDemonwareConnect()
			f42_arg0.endTime = f42_arg0.waitMilliseconds + Engine.milliseconds()
			f42_arg0.checkTime = f42_arg0.checkInterval + Engine.milliseconds()
		end
		,
		pumpFuncPtr = function ( f43_arg0, f43_arg1 )
			if f43_arg0.checkTime > Engine.milliseconds() then
				return 
			else
				f43_arg0.checkTime = f43_arg0.checkInterval + Engine.milliseconds()
				if Engine.IsDemonwareFetchingDone( f43_arg0.controller ) == true then
					if true == LuaUtils.isPS4 then
						if Engine.DisplayNpAvailabilityErrors( f41_arg0 ) then
							LobbyVM.ProcessCompleteFailure( {
								actionId = f43_arg0.actionId
							} )
							return 
						elseif not Engine.DisplayUpsellAndContentWarnings( f43_arg0.controller ) then
							LobbyVM.ProcessCompleteFailure( {
								actionId = f43_arg0.actionId
							} )
							return 
						end
					end
					LobbyVM.ProcessCompleteSuccess( {
						actionId = f43_arg0.actionId
					} )
					return 
				elseif f43_arg0.endTime < Engine.milliseconds() then
					LobbyVM.ProcessCompleteFailure( {
						actionId = f43_arg0.actionId
					} )
					return 
				else
					
				end
			end
		end
		,
		cancelFuncPtr = function ( f44_arg0 )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f44_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.IsButtonPressed = function ( f45_arg0, f45_arg1 )
	return {
		name = "IsButtonPressed",
		controller = f45_arg0,
		button = f45_arg1,
		startFuncPtr = function ( f46_arg0 )
			if not Engine.IsDevelopmentBuild() then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f46_arg0.actionId
				} )
				return 
			elseif Engine.IsButtonPressed( f46_arg0.controller, f46_arg0.button ) then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f46_arg0.actionId
				} )
				return 
			else
				LobbyVM.ProcessCompleteFailure( {
					actionId = f46_arg0.actionId
				} )
			end
		end
		
	}
end

Lobby.Actions.IsDvarSet = function ( f47_arg0, f47_arg1 )
	return {
		name = "IsDvarSet(dvar: " .. f47_arg0 .. ", check for value: " .. tostring( f47_arg1 ) .. ")",
		dvarName = f47_arg0,
		dvarValue = f47_arg1,
		startFuncPtr = function ( f48_arg0 )
			local f48_local0 = f48_arg0.dvarName
			local f48_local1 = f48_arg0.dvarValue
			local f48_local2 = Engine.GetDvarType( f48_local0 )
			local f48_local3 = false
			if f48_local2 == Enum.dvarType_t.DVAR_TYPE_INVALID then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f48_arg0.actionId
				} )
			elseif f48_local2 == Enum.dvarType_t.DVAR_TYPE_BOOL then
				f48_local3 = f48_local1 == Engine.DvarBool( 0, f48_local0 )
			elseif f48_local2 == Enum.dvarType_t.DVAR_TYPE_FLOAT then
				f48_local3 = f48_local1 == Engine.DvarFloat( f48_local0 )
			elseif f48_local2 == Enum.dvarType_t.DVAR_TYPE_INT then
				f48_local3 = f48_local1 == Engine.DvarInt( 0, f48_local0 )
			elseif f48_local2 == Enum.dvarType_t.DVAR_TYPE_STRING then
				f48_local3 = f48_local1 == Engine.DvarString( 0, f48_local0 )
			end
			if f48_local3 then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f48_arg0.actionId
				} )
				return 
			else
				LobbyVM.ProcessCompleteFailure( {
					actionId = f48_arg0.actionId
				} )
			end
		end
		
	}
end

Lobby.Actions.ErrorPopupMsg = function ( f49_arg0 )
	return {
		name = "ErrorPopupMsg",
		message = f49_arg0,
		startFuncPtr = function ( f50_arg0 )
			LuaUtils.UI_ShowErrorMessageDialog( nil, f50_arg0.message )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f50_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.ErrorPopup = function ( f51_arg0 )
	if f51_arg0.errorFuncPtr == nil then
		error( "Lobby.Actions.ErrorPopup: An action: " .. f51_arg0.name .. " with no errorFuncPtr has been used." )
	end
	return {
		name = "ErrorPopup: " .. f51_arg0.name,
		actionRef = f51_arg0,
		startFuncPtr = function ( f52_arg0 )
			local f52_local0 = "UNHANDLED ERROR OCCURRED (" .. f51_arg0.name .. " action)"
			if f51_arg0.errorFuncPtr ~= nil then
				f52_local0 = f52_arg0.actionRef:errorFuncPtr()
			end
			LuaUtils.UI_ShowErrorMessageDialog( nil, f52_local0 )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f52_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.ConnectToDW = function ( f53_arg0 )
	return {
		name = "ConnectToDW",
		controller = f53_arg0,
		startFuncPtr = function ( f54_arg0 )
			
		end
		
	}
end

Lobby.Actions.SetDefaultArenaPlaylist = function ( f55_arg0 )
	return {
		name = "SetDefaultPlaylist",
		controller = f55_arg0,
		startFuncPtr = function ( f56_arg0 )
			local f56_local0 = Engine.GetProfileVarInt( f55_arg0, "playlist_leaguematch" )
			local f56_local1 = nil
			if f56_local0 <= 0 then
				if Dvar.arena_defaultPlaylist:exists() then
					f56_local1 = Dvar.arena_defaultPlaylist:get()
				else
					f56_local1 = 40
				end
			else
				f56_local1 = f56_local0
			end
			local f56_local2 = nil
			local f56_local3, f56_local4 = LuaUtils.GetArenaPlaylistInfo()
			for f56_local8, f56_local9 in ipairs( f56_local4 ) do
				if f56_local9.index == f56_local1 then
					f56_local2 = f56_local9
					break
				end
			end
			if not f56_local2 then
				f56_local2 = f56_local4[1]
			end
			if f56_local2 then
				Engine.SetPlaylistID( f56_local2.index )
				Engine.SetProfileVar( f55_arg0, "playlist_leaguematch", tostring( f56_local2.index ) )
				Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyPlaylist" ), "name" ), Engine.ToUpper( f56_local2.name ) )
			end
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f56_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.RunPlaylistSettings = function ( f57_arg0 )
	return {
		name = "RunPlaylistSettings",
		require = "LobbySettings",
		controller = f57_arg0,
		startFuncPtr = function ( f58_arg0 )
			Engine.RunPlaylistSettings( f58_arg0.controller )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f58_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.RunPlaylistRules = function ( f59_arg0 )
	return {
		name = "RunPlaylistRules",
		require = "LobbySettings",
		controller = f59_arg0,
		startFuncPtr = function ( f60_arg0 )
			Engine.RunPlaylistRules( f60_arg0.controller )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f60_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.SwitchMode = function ( f61_arg0, f61_arg1 )
	return {
		name = "SwitchMode",
		controller = f61_arg0,
		toMode = f61_arg1,
		pumpFuncPtr = function ( f62_arg0 )
			Engine.SwitchMode( f62_arg0.controller, f62_arg0.toMode )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f62_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.SwitchCampaignMode = function ( f63_arg0, f63_arg1 )
	return {
		name = "SwitchCampaignMode",
		controller = f63_arg0,
		toMode = f63_arg1,
		startFuncPtr = function ( f64_arg0 )
			Engine.SwitchCampaignMode( f64_arg0.toMode )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f64_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.ForceLobbyUIScreen = function ( f65_arg0, f65_arg1 )
	return {
		name = "ForceLobbyUIScreen",
		controller = f65_arg0,
		screenId = f65_arg1,
		startFuncPtr = function ( f66_arg0 )
			Engine.ForceLobbyUIScreen( f66_arg0.screenId )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f66_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.LobbyHostStart = function ( f67_arg0, f67_arg1, f67_arg2, f67_arg3, f67_arg4 )
	return {
		name = "LobbyHostStart(" .. Engine.GetLobbyTypeName( f67_arg2 ) .. ")",
		controller = f67_arg0,
		mainMode = f67_arg1,
		lobbyType = f67_arg2,
		lobbyMode = f67_arg3,
		maxClients = f67_arg4,
		startFuncPtr = function ( f68_arg0 )
			Engine.LobbyHostStart( f68_arg0.actionId, f68_arg0.controller, f68_arg0.mainMode, f68_arg0.lobbyType, f68_arg0.lobbyMode, f68_arg0.maxClients )
		end
		,
		errorFuncPtr = function ( f69_arg0 )
			return "Failed to host a lobby"
		end
		
	}
end

Lobby.Actions.LobbyHostStartMigratedInfo = function ( f70_arg0, f70_arg1, f70_arg2, f70_arg3, f70_arg4, f70_arg5 )
	return {
		name = "LobbyHostStartMigrate(" .. Engine.GetLobbyTypeName( f70_arg2 ) .. ")",
		controller = f70_arg0,
		mainMode = f70_arg1,
		lobbyType = f70_arg2,
		lobbyMode = f70_arg3,
		maxClients = f70_arg4,
		hostInfo = f70_arg5,
		startFuncPtr = function ( f71_arg0 )
			Engine.LobbyHostStart( f71_arg0.actionId, f71_arg0.controller, f71_arg0.mainMode, f71_arg0.lobbyType, f71_arg0.lobbyMode, f71_arg0.maxClients, f71_arg0.hostInfo )
		end
		
	}
end

Lobby.Actions.LobbyHostEnd = function ( f72_arg0 )
	return {
		name = "LobbyHostEnd(" .. Engine.GetLobbyTypeName( f72_arg0 ) .. ")",
		lobbyType = f72_arg0,
		startFuncPtr = function ( f73_arg0 )
			Engine.LobbyHostEnd( f73_arg0.actionId, f73_arg0.lobbyType )
		end
		,
		errorFuncPtr = function ( f74_arg0 )
			return "Failed to end lobby"
		end
		
	}
end

Lobby.Actions.LobbyHostAddPrimary = function ( f75_arg0 )
	return {
		name = "LobbyHostAddPrimary(" .. Engine.GetLobbyTypeName( f75_arg0 ) .. ")",
		lobbyType = f75_arg0,
		startFuncPtr = function ( f76_arg0 )
			Engine.LobbyHostAddPrimary( f76_arg0.actionId, f76_arg0.lobbyType )
		end
		
	}
end

Lobby.Actions.LobbyHostAddLocal = function ( f77_arg0, f77_arg1 )
	return {
		name = "LobbyHostAddLocal(" .. Engine.GetLobbyTypeName( f77_arg1 ) .. ")",
		controller = f77_arg0,
		lobbyType = f77_arg1,
		startFuncPtr = function ( f78_arg0 )
			Engine.LobbyHostAddLocal( f78_arg0.actionId, f78_arg0.controller, f78_arg0.lobbyType )
		end
		
	}
end

Lobby.Actions.LobbyClientStart = function ( f79_arg0 )
	return {
		name = "LobbyClientStart(" .. Engine.GetLobbyTypeName( f79_arg0 ) .. ")",
		lobbyType = f79_arg0,
		startFuncPtr = function ( f80_arg0 )
			Engine.LobbyClientStart( f80_arg0.actionId, f80_arg0.lobbyType )
		end
		
	}
end

Lobby.Actions.LobbyClientEnd = function ( f81_arg0 )
	return {
		name = "LobbyClientEnd(" .. Engine.GetLobbyTypeName( f81_arg0 ) .. ")",
		lobbyType = f81_arg0,
		startFuncPtr = function ( f82_arg0 )
			Engine.LobbyClientEnd( f82_arg0.actionId, f82_arg0.lobbyType )
		end
		
	}
end

Lobby.Actions.LobbyLocalClientLeave = function ( f83_arg0, f83_arg1, f83_arg2 )
	return {
		name = "LobbyLocalClientLeave(" .. Engine.GetLobbyTypeName( f83_arg0 ) .. ")",
		lobbyType = f83_arg0,
		controller = f83_arg1,
		xuid = f83_arg2,
		startFuncPtr = function ( f84_arg0 )
			Engine.LobbyLocalClientLeave( f84_arg0.actionId, f84_arg0.lobbyType, f84_arg0.controller, f84_arg0.xuid )
		end
		
	}
end

Lobby.Actions.LeaveWithParty = function ( f85_arg0 )
	return {
		name = "LeaveWithParty(wait for " .. f85_arg0 .. "ms)",
		waitMilliseconds = f85_arg0,
		endTime = nil,
		checkInterval = 50,
		checkTime = nil,
		startFuncPtr = function ( f86_arg0 )
			if Engine.InLobbyParty( Enum.LobbyType.LOBBY_TYPE_GAME ) == false then
				Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: " .. f86_arg0.name .. ", we a loner in a private party, time to split, sweet!\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f86_arg0.actionId
				} )
				return 
			elseif Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) == false then
				Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: " .. f86_arg0.name .. ", we are not the host of our private party.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f86_arg0.actionId
				} )
				return 
			end
			local f86_local0 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			if f86_local0 == 1 or f86_local0 == Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f86_arg0.actionId
				} )
				return 
			elseif Engine.LeaveWithParty() == false then
				Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: " .. f86_arg0.name .. ", failed to tell party members to leave, we failed but we should leave anyway.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f86_arg0.actionId
				} )
				return 
			elseif Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) == false then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: " .. f86_arg0.name .. ", we are not the host of the game lobby, it is safe to leave now.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f86_arg0.actionId
				} )
			end
			f86_arg0.endTime = f86_arg0.waitMilliseconds + Engine.milliseconds()
			f86_arg0.checkTime = f86_arg0.checkInterval + Engine.milliseconds()
		end
		,
		pumpFuncPtr = function ( f87_arg0, f87_arg1 )
			if f87_arg0.checkTime > Engine.milliseconds() then
				return 
			end
			f87_arg0.checkTime = f87_arg0.checkInterval + Engine.milliseconds()
			local f87_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			local f87_local1 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
			local f87_local2 = false
			for f87_local9, f87_local10 in ipairs( f87_local0.sessionClients ) do
				for f87_local6, f87_local7 in ipairs( f87_local1.sessionClients ) do
					if f87_local10.isHost == false and f87_local10.xuid == f87_local7.xuid then
						f87_local2 = true
					end
				end
			end
			if f87_local2 == false then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: " .. f87_arg0.name .. ", all clients have left the game lobby, we can now leave.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f87_arg0.actionId
				} )
				return 
			elseif f87_arg0.endTime < Engine.milliseconds() then
				Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: " .. f87_arg0.name .. ", not all clients have left the game lobby, time to move on.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f87_arg0.actionId
				} )
				return 
			else
				
			end
		end
		,
		cancelFuncPtr = function ( f88_arg0 )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f88_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.LobbyInRecovery = function ()
	return {
		name = "LobbyInRecovery",
		startFuncPtr = function ( f90_arg0 )
			if Engine.LobbyInRecovery then
				Engine.LobbyInRecovery()
			end
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f90_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.CanHostServer = function ( f91_arg0, f91_arg1 )
	return {
		name = "CanHostServer",
		controller = f91_arg0,
		toTarget = f91_arg1,
		failureReason = nil,
		startFuncPtr = function ( f92_arg0 )
			local f92_local0 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
			if f92_arg0.toTarget.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_MP and Engine.IsFeatureBanned and Engine.IsFeatureBanned( f92_arg0.controller, LuaEnums.FEATURE_BAN.MP_HOSTING ) == true then
				Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "CANNOT HOST A SERVER: HOST_SERVER_BANNED_FROM_HOSTING.\n" )
				LobbyVM.ProcessCompleteFailure( {
					actionId = f92_arg0.actionId
				} )
				return 
			end
			local f92_local1, f92_local2 = Engine.CanHostServer( f92_arg0.controller, f92_local0 )
			if LuaUtils.IsArenaMode() and Lobby.MatchmakingArena.CanHostAnyLobby() == false then
				Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "CANNOT HOST A SERVER: ARENA MATCHMAKING DENIED HOST REQUEST\n" )
				LobbyVM.ProcessCompleteFailure( {
					actionId = f92_arg0.actionId
				} )
				return 
			elseif f92_local1 == true then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Can host server.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f92_arg0.actionId
				} )
				return 
			end
			f92_arg0.failureReason = f92_local2
			local f92_local3 = "HOST_SERVER_UNKNOWN"
			if f92_local2 == Enum.HostServer.HOST_SERVER_BANDWIDTH_TEST_IN_PROGRESS then
				f92_local3 = "HOST_SERVER_BANDWIDTH_TEST_IN_PROGRESS"
			elseif f92_local2 == Enum.HostServer.HOST_SERVER_NOT_HOST_OF_PARTY then
				f92_local3 = "HOST_SERVER_NOT_HOST_OF_PARTY"
			elseif f92_local2 == Enum.HostServer.HOST_SERVER_DEDICATED_ONLY then
				f92_local3 = "HOST_SERVER_DEDICATED_ONLY"
			elseif f92_local2 == Enum.HostServer.HOST_SERVER_NAT_TYPE_NOT_ALLOWED then
				f92_local3 = "HOST_SERVER_NAT_TYPE_NOT_ALLOWED"
			elseif f92_local2 == Enum.HostServer.HOST_SERVER_WE_SHOULD_NOT_HOST then
				f92_local3 = "HOST_SERVER_WE_SHOULD_NOT_HOST"
			elseif f92_local2 == Enum.HostServer.HOST_SERVER_IS_NOT_GOOD_CITIZEN then
				f92_local3 = "HOST_SERVER_IS_NOT_GOOD_CITIZEN"
			elseif f92_local2 == Enum.HostServer.HOST_SERVER_HAS_NOT_NECESSARY_BANDWIDTH then
				f92_local3 = "HOST_SERVER_HAS_NOT_NECESSARY_BANDWIDTH"
			elseif f92_local2 == Enum.HostServer.HOST_SERVER_NET_ENGINE_NOT_STARTED then
				f92_local3 = "HOST_SERVER_NET_ENGINE_NOT_STARTED"
			elseif f92_local2 == Enum.HostServer.HOST_SERVER_LIVE_STREAMING then
				f92_local3 = "HOST_SERVER_LIVE_STREAMING"
			elseif f92_local2 == Enum.HostServer.HOST_SERVER_BANNED_FROM_HOSTING then
				f92_local3 = "HOST_SERVER_BANNED_FROM_HOSTING"
			elseif f92_local2 == Enum.HostServer.HOST_SERVER_IS_IN_SHARE_PLAY then
				f92_local3 = "HOST_SERVER_IS_IN_SHARE_PLAY"
			end
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "CANNOT HOST A SERVER: " .. f92_local3 .. ".\n" )
			LobbyVM.ProcessCompleteFailure( {
				actionId = f92_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.GeoMinCheck = function ( f93_arg0, f93_arg1 )
	local f93_local0 = Dvar.lobbySearchGeoMin:get()
	if f93_local0 == 0 then
		return true
	end
	local f93_local1 = 0
	if f93_arg0.geo_1 == f93_arg1.geo_1 then
		f93_local1 = f93_local1 + 1
		if f93_arg0.geo_2 == f93_arg1.geo_2 then
			f93_local1 = f93_local1 + 1
			if f93_arg0.geo_3 == f93_arg1.geo_3 then
				f93_local1 = f93_local1 + 1
				if f93_arg0.geo_4 == f93_arg1.geo_4 then
					f93_local1 = f93_local1 + 1
				end
			end
		end
	end
	return f93_local0 <= f93_local1
end

Lobby.Actions.SearchForLobby = function ( f94_arg0 )
	return {
		name = "LobbySearch",
		controller = f94_arg0,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		filteredResult = {},
		startFuncPtr = function ( f95_arg0 )
			Lobby.Matchmaking.SetupMatchmakingStage( f95_arg0.controller )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "SearchForLobby, begin search.\n" )
			LobbyVM.LobbyStatusUpdate( {
				searchStage = 1,
				numResults = 50
			} )
			Engine.SearchForLobby( f95_arg0.actionId, f95_arg0.lobbyType )
		end
		,
		endFuncPtr = function ( f96_arg0 )
			LuaUtils.LogQoS( "search_query", Engine.GetSearchQuery() )
			local f96_local0 = Engine.GetSearchResults( f96_arg0.lobbyType )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "SearchForLobby, number of results found " .. f96_local0.numResults .. ".\n" )
			local f96_local1 = f96_local0.errorCode
			local f96_local2 = f96_local0.numResults
			Lobby.Debug.SessionSQJSearchResults( f96_local0 )
			if f96_local2 == 0 then
				LobbyVM.LobbyStatusUpdate( {
					searchStage = 1,
					numResults = 0
				} )
				return 
			end
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------SEARCH RESULTS----------------------------\n" )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "xuid, gameSecurityId, gameType, maxPlayers, numPlayers, serverType, showInMatchmaking, netcodeVersion, mapPacks, playlistVersion, playlistNumber, isEmpty, teamSizeMax, skill, geo_1, geo_2, geo_3, geo_4\n" )
			for f96_local6, f96_local7 in ipairs( f96_local0.remoteHosts ) do
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, tostring( f96_local7.xuid ) .. ", " .. Engine.UInt64ToString( f96_local7.gameSecurityId ) .. ", " .. f96_local7.gameType .. ", " .. f96_local7.maxPlayers .. ", " .. f96_local7.numPlayers .. ", " .. f96_local7.serverType .. ", " .. f96_local7.showInMatchmaking .. ", " .. f96_local7.netcodeVersion .. ", " .. f96_local7.mapPacks .. ", " .. f96_local7.playlistVersion .. ", " .. f96_local7.playlistNumber .. ", " .. f96_local7.isEmpty .. ", " .. f96_local7.teamSizeMax .. ", " .. f96_local7.skill .. ", " .. f96_local7.serverLocation .. ", " .. f96_local7.latencyBand .. ", " .. Engine.UInt64ToString( f96_local7.geo_1 ) .. ", " .. Engine.UInt64ToString( f96_local7.geo_2 ) .. ", " .. Engine.UInt64ToString( f96_local7.geo_3 ) .. ", " .. Engine.UInt64ToString( f96_local7.geo_4 ) .. ".\n" )
			end
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------------------------------------------------\n" )
			f96_arg0.filteredResult = {}
			f96_local3 = Engine.GetGeoLocation()
			f96_local4 = Engine.GetLobbyHostXuid( f96_arg0.lobbyType )
			f96_local5 = 1
			for f96_local9, f96_local10 in ipairs( f96_local0.remoteHosts ) do
				if f96_local4 == f96_local10.xuid then
					
				end
				hostOK = false
				if f96_local10.serverType == Lobby.Matchmaking.ServerType.DEDICATED_SERVER then
					latencytoserverlocation = Engine.GetPingForServerLocation( f96_local10.serverLocation )
					if f96_local10.latencyBand == 0 then
						hostOK = true
					elseif math.abs( f96_local10.latencyBand - latencytoserverlocation ) > Dvar.lobbySearchMaxLatencyBandDiff:get() then
						Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Rejecting result from serverlocation " .. f96_local10.serverLocation .. ", the latencyband is " .. f96_local10.latencyBand .. "ms and our latency is " .. latencytoserverlocation .. "\n" )
					else
						hostOK = true
					end
				elseif Lobby.Actions.GeoMinCheck( f96_local3, f96_local10 ) then
					hostOK = true
				end
				if hostOK then
					f96_arg0.filteredResult[f96_local5] = {
						xuid = f96_local10.xuid,
						gameSecurityId = f96_local10.gameSecurityId,
						gameSecurityKey = f96_local10.gameSecurityKey,
						hostAddress = f96_local10.hostAddress
					}
					f96_local5 = f96_local5 + 1
				end
			end
			LobbyVM.LobbyStatusUpdate( {
				searchStage = 1,
				numResults = #f96_arg0.filteredResult
			} )
			LuaUtils.LogQoS( "search_results", f96_arg0.filteredResult )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "SearchForLobby, number of filtered results " .. #f96_arg0.filteredResult .. ".\n" )
		end
		,
		errorFuncPtr = function ()
			return Engine.Localize( "MENU_NO_SESSIONS" )
		end
		,
		cancelFuncPtr = function ( f98_arg0 )
			Engine.LobbySearchErrorShutdown()
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f98_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.JOIN_STATUS = {
	BEGIN = 1,
	ADD = 2,
	FINALIZE = 3
}
Lobby.Actions.QoSJoinSearchResults = function ( f99_arg0, f99_arg1 )
	return {
		name = "QoSJoinSearchResults",
		controller = f99_arg0,
		searchAction = f99_arg1,
		sourceLobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		targetLobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		joinStatusCur = Lobby.Actions.JOIN_STATUS.BEGIN,
		minInitialCount = 0,
		updateTime = nil,
		firstResultTime = nil,
		searchTime = nil,
		qosResultsValid = {},
		qosResultsInvalid = {},
		joiningNumHosts = 0,
		joiningCurHost = 1,
		startFuncPtr = function ( f100_arg0 )
			f100_arg0.sourceLobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
			f100_arg0.targetLobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
			f100_arg0.joinStatusCur = Lobby.Actions.JOIN_STATUS.BEGIN
			f100_arg0.minInitialCount = 0
			f100_arg0.updateTime = nil
			f100_arg0.firstResultTime = nil
			f100_arg0.searchTime = nil
			f100_arg0.qosResultsValid = {}
			f100_arg0.qosResultsInvalid = {}
			f100_arg0.joiningNumHosts = 0
			f100_arg0.joiningCurHost = 1
			local f100_local0 = f100_arg0.searchAction.filteredResult
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, num of search results passed " .. #f100_local0 .. " for QoS.\n" )
			if #f100_local0 == 0 then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f100_arg0.actionId
				} )
				return 
			end
			LobbyVM.LobbyStatusUpdate( {
				searchStage = 2,
				numResults = #f100_local0,
				contactedResults = 0
			} )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, starting probes.\n" )
			if Engine.QoSProbeInitiate( f100_arg0.actionId, f100_arg0.sourceLobbyType, f100_local0 ) == false then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, QoSProbeInitiate failed.\n" )
				LobbyVM.ProcessCompleteFailure( {
					actionId = f100_arg0.actionId
				} )
			end
			f100_arg0.minInitialCount = #f100_local0 * 100 / Dvar.qos_minPercent:get()
			f100_arg0.minInitialCount = math.max( f100_arg0.minInitialCount, Dvar.qos_minProbes:get() )
			f100_arg0.joinStatusCur = Lobby.Actions.JOIN_STATUS.BEGIN
			f100_arg0.firstResultTime = Engine.milliseconds()
			f100_arg0.updateTime = Engine.milliseconds()
			f100_arg0.searchTime = Engine.milliseconds()
		end
		,
		pumpFuncPtr = function ( f101_arg0 )
			if f101_arg0.joinStatusCur == Lobby.Actions.JOIN_STATUS.BEGIN then
				local f101_local0 = Engine.milliseconds()
				if f101_local0 < f101_arg0.searchTime then
					return 
				elseif #f101_arg0.qosResultsValid == 0 and #f101_arg0.searchAction.filteredResult <= #f101_arg0.qosResultsInvalid then
					Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults::pumpFuncPtr, Not expecting any results to join, QoSJoinSearchResults failed.\n" )
					LobbyVM.ProcessCompleteFailure( {
						actionId = f101_arg0.actionId
					} )
					return 
				end
				local f101_local1 = false
				if f101_arg0.minInitialCount <= #f101_arg0.qosResultsValid then
					if f101_local0 - f101_arg0.firstResultTime > Dvar.qos_firstUpdateMS:get() then
						if f101_local0 - f101_arg0.updateTime > Dvar.qos_lastUpdateMS:get() then
							f101_local1 = true
						else
							Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, waiting for last update to settle.\n" )
						end
					else
						Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, waiting for first update to settle.\n" )
					end
				else
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, waiting for " .. f101_arg0.minInitialCount .. " initial results. Current: " .. #f101_arg0.qosResultsValid .. ".\n" )
				end
				if #f101_arg0.searchAction.filteredResult <= #f101_arg0.qosResultsInvalid + #f101_arg0.qosResultsValid then
					f101_local1 = true
				end
				if f101_local1 then
					local f101_local2 = function ( f102_arg0, f102_arg1 )
						local f102_local0 = math.floor( f102_arg0.latency / 25 )
						local f102_local1 = math.floor( f102_arg1.latency / 25 )
						if f102_local0 == f102_local1 then
							if f102_arg0.isMatchEndingSoon == f102_arg1.isMatchEndingSoon then
								return f102_arg0.numAvailableSlots < f102_arg1.numAvailableSlots
							else
								return f102_arg1.isMatchEndingSoon
							end
						else
							return f102_local0 < f102_local1
						end
					end
					
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, num of initial results returned " .. #f101_arg0.qosResultsValid .. ".\n" )
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, begin join.\n" )
					Engine.LobbyJoinBegin( f101_arg0.actionId, f101_arg0.controller, f101_arg0.sourceLobbyType, f101_arg0.targetLobbyType )
					table.sort( f101_arg0.qosResultsValid, f101_local2 )
					for f101_local6, f101_local7 in ipairs( f101_arg0.qosResultsValid ) do
						Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Attempting to join xuid: " .. f101_local7.xuidstr .. ".\n" )
						f101_arg0.joiningNumHosts = f101_arg0.joiningNumHosts + 1
						LobbyVM.LobbyStatusUpdate( {
							searchStage = 3,
							joiningCurHost = f101_arg0.joiningCurHost,
							joiningNumHosts = f101_arg0.joiningNumHosts
						} )
						Engine.LobbyJoinAdd( f101_local7.xuid, f101_local7.gameSecurityId, f101_local7.gameSecurityKey, f101_local7.hostAddress )
						Lobby.Debug.SessionSQJJoinInitiate( f101_local7.xuid )
					end
					f101_arg0.joinStatusCur = Lobby.Actions.JOIN_STATUS.ADD
				end
			elseif f101_arg0.joinStatusCur == Lobby.Actions.JOIN_STATUS.ADD then
				if #f101_arg0.qosResultsValid < #f101_arg0.searchAction.filteredResult and Engine.milliseconds() - f101_arg0.firstResultTime < Dvar.qos_maxProbeWait:get() then
					return 
				end
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, finalize join.\n" )
				f101_arg0.joinStatusCur = Lobby.Actions.JOIN_STATUS.FINALIZE
				Engine.LobbyJoinFinalize()
			end
		end
		,
		updateFuncPtr = function ( f103_arg0, f103_arg1 )
			if f103_arg1.joinResult then
				Lobby.Debug.SessionSQJJoinResult( f103_arg1 )
				f103_arg0.joiningCurHost = math.min( f103_arg0.joiningCurHost + 1, f103_arg0.joiningNumHosts )
				LobbyVM.LobbyStatusUpdate( {
					searchStage = 3,
					joiningCurHost = f103_arg0.joiningCurHost,
					joiningNumHosts = f103_arg0.joiningNumHosts
				} )
				return 
			end
			Lobby.Debug.SessionSQJQoSResult( f103_arg1 )
			local f103_local0 = nil
			if f103_arg1.validResult == false then
				f103_local0 = {
					validResult = f103_arg1.validResult,
					xuid = f103_arg1.xuid,
					xuidstr = f103_arg1.xuidstr
				}
				f103_arg0.qosResultsInvalid[#f103_arg0.qosResultsInvalid + 1] = f103_local0
				LuaUtils.LogQoS( "invalid_qos", f103_local0 )
				return 
			end
			f103_local0 = {
				validResult = f103_arg1.validResult,
				xuid = f103_arg1.xuid,
				xuidstr = f103_arg1.xuidstr,
				gameSecurityId = f103_arg1.gameSecurityId,
				gameSecurityKey = f103_arg1.gameSecurityKey,
				hostAddress = f103_arg1.hostAddress,
				protocol = f103_arg1.protocol,
				isMP = f103_arg1.isMP,
				isMigrating = f103_arg1.isMigrating,
				numAvailableSlots = f103_arg1.numAvailableSlots,
				maxLocalPlayersAllowed = f103_arg1.maxLocalPlayersAllowed,
				allowGuests = f103_arg1.allowGuests,
				isMatchEndingSoon = f103_arg1.isMatchEndingSoon,
				isMatchLoading = f103_arg1.isMatchLoading,
				isDedicated = f103_arg1.isDedicated,
				hostXuid = f103_arg1.hostXuid,
				skill = f103_arg1.skill,
				largestParty = f103_arg1.largestParty,
				latency = f103_arg1.latency,
				minLatency = f103_arg1.minLatency,
				realAddr = f103_arg1.realAddr
			}
			if f103_arg1.numAvailableSlots <= 0 then
				table.insert( f103_arg0.qosResultsInvalid, f103_local0 )
				LuaUtils.LogQoS( "valid_qos_full", f103_local0 )
				return 
			elseif LuaUtils.IsArenaMode() and math.abs( f103_local0.skill - Engine.GetArenaPoints( f99_arg0, Engine.GetCurrentArenaSlot() ) ) > Lobby.MatchmakingArena.GetArenaSkillRange( true ) then
				table.insert( f103_arg0.qosResultsInvalid, f103_local0 )
				return 
			end
			LuaUtils.LogQoS( "valid_qos", f103_local0 )
			f103_arg0.updateTime = Engine.milliseconds()
			if #f103_arg0.qosResultsValid == 0 then
				f103_arg0.firstResultTime = f103_arg0.updateTime
			end
			f103_arg0.qosResultsValid[#f103_arg0.qosResultsValid + 1] = f103_local0
			LobbyVM.LobbyStatusUpdate( {
				searchStage = 2,
				numResults = #f103_arg0.searchAction.filteredResult,
				contactedResults = #f103_arg0.qosResultsValid
			} )
			if f103_arg0.joinStatusCur == Lobby.Actions.JOIN_STATUS.START then
				
			elseif f103_arg0.joinStatusCur == Lobby.Actions.JOIN_STATUS.ADD then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Attempting to join xuid: " .. f103_local0.xuidstr .. ".\n" )
				f103_arg0.joiningNumHosts = f103_arg0.joiningNumHosts + 1
				LobbyVM.LobbyStatusUpdate( {
					searchStage = 3,
					joiningCurHost = f103_arg0.joiningCurHost,
					joiningNumHosts = f103_arg0.joiningNumHosts
				} )
				Engine.LobbyJoinAdd( f103_local0.xuid, f103_local0.gameSecurityId, f103_local0.gameSecurityKey, f103_local0.hostAddress )
			elseif f103_arg0.joinStatusCur == Lobby.Actions.JOIN_STATUS.FINALIZE then
				
			else
				
			end
		end
		,
		endFuncPtr = function ( f104_arg0 )
			Engine.QoSCancelProbes()
			Engine.LobbyJoinErrorShutdown()
		end
		,
		cancelFuncPtr = function ( f105_arg0 )
			Engine.QoSCancelProbes()
			Engine.LobbyJoinErrorShutdown()
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f105_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.JoinSearchResults = function ( f106_arg0, f106_arg1 )
	return {
		name = "JoinSearchResults",
		controller = f106_arg0,
		searchAction = f106_arg1,
		sourceLobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		targetLobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		startFuncPtr = function ( f107_arg0 )
			local f107_local0 = f107_arg0.searchAction.filteredResult
			if #f107_local0 == 0 then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f107_arg0.actionId
				} )
				return 
			end
			Engine.LobbyJoinBegin( f107_arg0.actionId, f107_arg0.controller, f107_arg0.sourceLobbyType, f107_arg0.targetLobbyType )
			for f107_local4, f107_local5 in ipairs( f107_local0 ) do
				Engine.LobbyJoinAdd( f107_local5.xuid, f107_local5.gameSecurityId, f107_local5.gameSecurityKey, f107_local5.hostAddress )
			end
			Engine.LobbyJoinFinalize()
		end
		
	}
end

Lobby.Actions.AdvertiseLobby = function ( f108_arg0 )
	return {
		name = "AdvertiseLobby",
		onOff = f108_arg0,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		startFuncPtr = function ( f109_arg0 )
			Lobby.Matchmaking.SetupAdvertising()
			Engine.AdvertiseLobby( f109_arg0.actionId, f109_arg0.lobbyType, f109_arg0.onOff )
		end
		,
		errorFuncPtr = function ( f110_arg0 )
			local f110_local0 = ""
			local f110_local1 = ""
			if f110_arg0.onOff == true then
				errorMessage = Engine.Localize( "MENU_NO_SESSIONS" )
				f110_local1 = "Failed to turn on lobby advertising"
			else
				f110_local1 = "Failed to turn off lobby advertising"
			end
			if not Engine.IsDevelopmentBuild() then
				return errorMessage
			else
				return errorMessage .. "\n\nDEBUG INFO: AdvertiseLobby( " .. f110_local1 .. " )\n"
			end
		end
		
	}
end

Lobby.Actions.LobbyInfoProbe = function ( f111_arg0, f111_arg1 )
	return {
		name = "InfoProbe",
		controller = f111_arg0,
		info = f111_arg1,
		probeResult = nil,
		startFuncPtr = function ( f112_arg0 )
			Engine.LobbyInfoProbe( f112_arg0.actionId, f112_arg0.controller, f112_arg0.info.xuid )
		end
		,
		endFuncPtr = function ( f113_arg0 )
			f113_arg0.probeResult = f113_arg0.retData
			f113_arg0.probeResult.probedXuid = f113_arg0.info.xuid
		end
		
	}
end

Lobby.Actions.ShowFirstTimeFlowError = function ( f114_arg0 )
	return {
		name = "ErrorPopupMsg",
		info = f114_arg0,
		startFuncPtr = function ( f115_arg0 )
			local f115_local0 = nil
			if f115_arg0.info.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
				f115_local0 = Engine.Localize( "MPUI_MP_INTRO_REQUIRED_DESC" )
			elseif f115_arg0.info.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
				f115_local0 = Engine.Localize( "MENU_CP_FIRST_TIME_FLOW_REQUIRED_DESC" )
			else
				f115_local0 = Engine.Localize( "MENU_JOIN_RESULT_NOT_JOINABLE" )
			end
			LuaUtils.UI_ShowErrorMessageDialog( nil, f115_local0 )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f115_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.CheckFirstTimeFlowRequirements = function ( f116_arg0, f116_arg1 )
	return {
		name = "CheckfirstTimeFlow",
		controller = f116_arg0,
		info = f116_arg1,
		mainMode = nil,
		startFuncPtr = function ( f117_arg0 )
			if Dvar.livestats_skipFirstTime:get() then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f117_arg0.actionId
				} )
				return 
			end
			f117_arg0.mainMode = f117_arg0.info.probeResult.mainMode
			local f117_local0 = LuaUtils.LobbyMainModeToEModes( f117_arg0.info.probeResult.mainMode )
			if f117_local0 == nil or f117_local0 == Enum.eModes.MODE_ZOMBIES or Engine.IsFirstTimeComplete( f116_arg0, f117_local0 ) then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f117_arg0.actionId
				} )
			else
				LobbyVM.ProcessCompleteError( {
					actionId = f117_arg0.actionId
				} )
			end
		end
		
	}
end

Lobby.Actions.JoinHost = function ( f118_arg0, f118_arg1, f118_arg2, f118_arg3, f118_arg4 )
	return {
		name = "LobbyJoinHost",
		controller = f118_arg0,
		mainMode = f118_arg1,
		networkMode = f118_arg2,
		hostXuid = f118_arg3,
		hostInfo = f118_arg4,
		joinResults = {},
		startFuncPtr = function ( f119_arg0 )
			if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
				Engine.JoinHost( f119_arg0.actionId, f119_arg0.controller, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyType.LOBBY_TYPE_GAME, f119_arg0.hostXuid, f119_arg0.hostInfo )
			else
				Engine.JoinHost( f119_arg0.actionId, f119_arg0.controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyType.LOBBY_TYPE_GAME, f119_arg0.hostXuid, f119_arg0.hostInfo )
			end
		end
		,
		updateFuncPtr = function ( f120_arg0, f120_arg1 )
			f120_arg0.joinResults[#f120_arg0.joinResults + 1] = f120_arg1
		end
		,
		errorFuncPtr = function ( f121_arg0 )
			local f121_local0 = Engine.Localize( "MENU_JOIN_RESULT_NOT_JOINABLE" )
			if #f121_arg0.joinResults == 0 then
				return f121_local0
			else
				local f121_local1 = f121_arg0.joinResults[#f121_arg0.joinResults].joinResult
				local f121_local2 = LobbyVM.JoinResultToString( f121_local1, true )
				f121_local0 = Engine.Localize( f121_local2.errorMsg )
				if not Engine.IsDevelopmentBuild() then
					return f121_local0
				else
					return f121_local0 .. "\n\nDEBUG INFO: JoinResult( " .. tostring( f121_local1 ) .. " )\n" .. f121_local2.debug
				end
			end
		end
		
	}
end

Lobby.Actions.LobbyJoinXUID = function ( f122_arg0, f122_arg1, f122_arg2 )
	return {
		name = "LobbyJoinXUID",
		controller = f122_arg0,
		info = f122_arg1,
		joinType = f122_arg2,
		joinResults = {},
		startFuncPtr = function ( f123_arg0 )
			Engine.JoinXUID( f123_arg0.actionId, f123_arg0.controller, f123_arg0.info.xuid, f123_arg0.joinType )
		end
		,
		updateFuncPtr = function ( f124_arg0, f124_arg1 )
			f124_arg0.joinResults[#f124_arg0.joinResults + 1] = f124_arg1
		end
		,
		endFuncPtr = function ( f125_arg0 )
			
		end
		,
		errorFuncPtr = function ( f126_arg0 )
			local f126_local0 = Engine.Localize( "MENU_JOIN_RESULT_NOT_JOINABLE" )
			if #f126_arg0.joinResults == 0 then
				return f126_local0
			else
				local f126_local1 = f126_arg0.joinResults[#f126_arg0.joinResults].joinResult
				local f126_local2 = LobbyVM.JoinResultToString( f126_local1, true )
				f126_local0 = Engine.Localize( f126_local2.errorMsg )
				if not Engine.IsDevelopmentBuild() then
					return f126_local0
				else
					return f126_local0 .. "\n\nDEBUG INFO: JoinResult( " .. tostring( f126_local1 ) .. " )\n" .. f126_local2.debug
				end
			end
		end
		
	}
end

Lobby.Actions.LobbyJoinXUIDExt = function ( f127_arg0, f127_arg1, f127_arg2, f127_arg3 )
	return {
		name = "LobbyJoinXUIDExt",
		controller = f127_arg0,
		joinType = f127_arg1,
		infoProbe = f127_arg2,
		destinationLobby = f127_arg3,
		joinResults = {},
		startFuncPtr = function ( f128_arg0 )
			local f128_local0 = f128_arg0.infoProbe.probeResult
			local f128_local1 = f128_local0.probedXuid
			local f128_local2 = f128_arg0.destinationLobby
			local f128_local3 = nil
			if f128_local2 == Enum.LobbyType.LOBBY_TYPE_COUNT then
				if f128_local0.gameLobby.isValid == true then
					f128_local2 = Enum.LobbyType.LOBBY_TYPE_GAME
					f128_local3 = f128_local0.gameLobby
				else
					f128_local2 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
					f128_local3 = f128_local0.privateLobby
				end
			elseif f128_local2 == Enum.LobbyType.LOBBY_TYPE_GAME then
				f128_local3 = f128_local0.gameLobby
			else
				f128_local3 = f128_local0.privateLobby
			end
			if Engine.JoinXUIDExt( f128_arg0.actionId, f128_arg0.controller, f128_local3.isValid, f128_local3.hostXuid, f128_local3.hostName, f128_local2, f128_local3.secId, f128_local3.secKey, f128_local3.serializedAdr, f128_arg0.joinType, f128_local1 ) == false then
				LobbyVM.ProcessCompleteError( {
					actionId = f128_arg0.actionId
				} )
			end
		end
		,
		updateFuncPtr = function ( f129_arg0, f129_arg1 )
			f129_arg0.joinResults[#f129_arg0.joinResults + 1] = f129_arg1
		end
		,
		endFuncPtr = function ( f130_arg0 )
			
		end
		,
		errorFuncPtr = function ( f131_arg0 )
			local f131_local0 = Engine.Localize( "MENU_JOIN_RESULT_NOT_JOINABLE" )
			if #f131_arg0.joinResults == 0 then
				return f131_local0
			else
				local f131_local1 = f131_arg0.joinResults[#f131_arg0.joinResults].joinResult
				local f131_local2 = LobbyVM.JoinResultToString( f131_local1, true )
				f131_local0 = Engine.Localize( f131_local2.errorMsg )
				if not Engine.IsDevelopmentBuild() then
					return f131_local0
				else
					return f131_local0 .. "\n\nDEBUG INFO: JoinResult( " .. tostring( f131_local1 ) .. " )\n" .. f131_local2.debug
				end
			end
		end
		
	}
end

Lobby.Actions.WaitForJoiningClients = function ( f132_arg0 )
	return {
		name = "WaitForJoiningClients",
		waitMilliseconds = f132_arg0,
		endWaitTime = nil,
		startFuncPtr = function ( f133_arg0 )
			f133_arg0.endWaitTime = f133_arg0.waitMilliseconds + Engine.milliseconds()
			local f133_local0 = Engine.LobbyJoinCount()
			if f133_local0 == 0 then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f133_arg0.actionId
				} )
			end
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "WaitForJoiningClients start, number of joining clients: " .. f133_local0 .. ". Waiting " .. f133_arg0.waitMilliseconds .. "ms for clients to join.\n" )
		end
		,
		pumpFuncPtr = function ( f134_arg0 )
			local f134_local0 = Engine.LobbyJoinCount()
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "WaitForJoiningClients pump, number of clients still joining: " .. f134_local0 .. ". Waiting for " .. f134_arg0.endWaitTime - Engine.milliseconds() .. "ms\n" )
			if f134_arg0.endWaitTime < Engine.milliseconds() then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "WaitForJoiningClients pump stop, number of clients still joining: " .. f134_local0 .. ". Clients took to long to join.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f134_arg0.actionId
				} )
				return 
			elseif f134_local0 == 0 then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "WaitForJoiningClients pump stop, All clients have joined.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f134_arg0.actionId
				} )
				return 
			else
				
			end
		end
		,
		cancelFuncPtr = function ( f135_arg0 )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f135_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.LobbySettings = function ( f136_arg0, f136_arg1, f136_arg2, f136_arg3 )
	return {
		name = "LobbySettings",
		controller = f136_arg0,
		toTarget = f136_arg1,
		skipSwitchMode = f136_arg2,
		startFuncPtr = function ( f137_arg0 )
			LobbyVM.LobbySettings( {
				controller = f136_arg0,
				toTarget = f136_arg1,
				skipSwitchMode = f136_arg2,
				isDevMap = f136_arg3
			} )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f137_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.SetQueueCancellable = function ( f138_arg0 )
	return {
		name = "SetQueueCancellable",
		startFuncPtr = function ( f139_arg0 )
			Lobby.ProcessQueue.SetCancellable( f138_arg0 )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f139_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.UpdateUI = function ( f140_arg0, f140_arg1 )
	return {
		name = "UpdateUI",
		require = "LobbySettings",
		controller = f140_arg0,
		toTarget = f140_arg1,
		startFuncPtr = function ( f141_arg0 )
			LobbyVM.UpdateUI( {
				controller = f140_arg0,
				toTarget = f140_arg1
			} )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f141_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.SetNetworkMode = function ( f142_arg0, f142_arg1 )
	return {
		name = "SetNetworkMode",
		controller = f142_arg0,
		networkMode = f142_arg1,
		startFuncPtr = function ( f143_arg0 )
			Engine.SetLobbyNetworkMode( f143_arg0.networkMode )
			Engine.Exec( f143_arg0.controller, "savegameRestore" )
			Engine.ExecNow( f143_arg0.controller, "invalidateEmblemComponent" )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f143_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.PromoteToHostDone = function ( f144_arg0, f144_arg1, f144_arg2, f144_arg3 )
	return {
		name = "promoteToHostDone",
		controller = f144_arg0,
		lobbyType = f144_arg1,
		migrateIndexBits = f144_arg2,
		isInGame = f144_arg3,
		startFuncPtr = function ( f145_arg0 )
			Engine.LobbyHostMigrateSetIndexBits( f145_arg0.lobbyType, f145_arg0.migrateIndexBits )
			Engine.Exec( f145_arg0.controller, "lobby_setmap " .. Dvar.ui_mapname:get() )
			Engine.Exec( f145_arg0.controller, "lobby_setgametype " .. Dvar.ui_gametype:get() )
			Engine.PromoteToHostDone( f145_arg0.controller, f145_arg0.lobbyType, f145_arg0.isInGame )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f145_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.SignUserInToLive = function ( f146_arg0 )
	return {
		name = "SignUserInToLive",
		controller = f146_arg0,
		startFuncPtr = function ( f147_arg0 )
			Engine.SignUserIntoLive( f147_arg0.controller )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f147_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.SignUserOutOfLive = function ( f148_arg0, f148_arg1 )
	return {
		name = "SignUserOutOfLive",
		controller = f148_arg0,
		networkMode = f148_arg1,
		startFuncPtr = function ( f149_arg0 )
			Engine.SignUserOutOfLive( f149_arg0.controller )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f149_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.PlatformSessionGetSessionInfo = function ( f150_arg0, f150_arg1, f150_arg2 )
	return {
		name = "PlatformSessionGetSessionInfo",
		controller = f150_arg0,
		lobbyType = f150_arg1,
		sessionId = f150_arg2,
		info = {},
		gamertag = nil,
		gamertags = nil,
		startFuncPtr = function ( f151_arg0 )
			if Lobby.Platform.PlatformSessionOrbisEnabled() == false or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f151_arg0.actionId
				} )
				return 
			elseif Engine.PlatformSessionPS4GetSessionInfo( f151_arg0.actionId, f151_arg0.controller, f151_arg0.lobbyType, f151_arg0.sessionId ) == false then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f151_arg0.actionId
				} )
				return 
			else
				
			end
		end
		,
		endFuncPtr = function ( f152_arg0 )
			if Lobby.Platform.PlatformSessionOrbisEnabled() == false or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
				return 
			elseif f152_arg0.retData.isError == true then
				return 
			end
			f152_arg0.info = {
				sessionId = f152_arg0.retData.sessionId,
				sessionName = f152_arg0.retData.sessionName,
				sessionStatus = f152_arg0.retData.sessionStatus,
				sessionType = f152_arg0.retData.sessionType,
				sessionPrivacy = f152_arg0.retData.sessionPrivacy,
				locked = f152_arg0.retData.locked,
				maxSlots = f152_arg0.retData.maxSlots,
				creationTime = f152_arg0.retData.creationTime,
				sessionCreatorGamertag = f152_arg0.retData.sessionCreatorGamertag,
				sessionCreatorPlatform = f152_arg0.retData.sessionCreatorPlatform,
				members = f152_arg0.retData.members
			}
			if #f152_arg0.info.members > 0 then
				f152_arg0.gamertag = f152_arg0.info.members[#f152_arg0.info.members].gamertag
				f152_arg0.gamertags = {}
				for f152_local0 = 1, #f152_arg0.info.members, 1 do
					f152_arg0.gamertags[f152_local0] = f152_arg0.info.members[f152_local0].gamertag
				end
			end
		end
		
	}
end

Lobby.Actions.PlatformSessionGetInviteInfo = function ( f153_arg0, f153_arg1, f153_arg2 )
	return {
		name = "PlatformSessionGetInviteInfo",
		controller = f153_arg0,
		lobbyType = f153_arg1,
		invitationId = f153_arg2,
		info = {},
		gamertag = nil,
		gamertags = nil,
		startFuncPtr = function ( f154_arg0 )
			if Lobby.Platform.PlatformSessionOrbisEnabled() == false or Engine.IsDemonwareFetchingDone( f153_arg0 ) == false then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f154_arg0.actionId
				} )
				return 
			elseif Engine.PlatformSessionPS4GetInviteInfo( f154_arg0.actionId, f154_arg0.controller, f154_arg0.lobbyType, f154_arg0.invitationId ) == false then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f154_arg0.actionId
				} )
				return 
			else
				
			end
		end
		,
		endFuncPtr = function ( f155_arg0 )
			if Lobby.Platform.PlatformSessionOrbisEnabled() == false or Engine.IsDemonwareFetchingDone( f155_arg0.controller ) == false then
				return 
			elseif f155_arg0.retData.isError == true then
				return 
			else
				f155_arg0.info.receivedDate = f155_arg0.retData.receivedDate
				f155_arg0.info.usedFlag = f155_arg0.retData.usedFlag
				f155_arg0.info.expired = f155_arg0.retData.expired
				f155_arg0.info.message = f155_arg0.retData.message
				f155_arg0.info.fromGamertag = f155_arg0.retData.fromGamertag
				f155_arg0.info.invitationId = f155_arg0.retData.invitationId
				f155_arg0.info.sessionId = f155_arg0.retData.sessionId
				f155_arg0.gamertag = f155_arg0.retData.fromGamertag
				f155_arg0.gamertags = {}
				f155_arg0.gamertags[1] = f155_arg0.gamertag
			end
		end
		
	}
end

Lobby.Actions.GamertagsToXuids = function ( f156_arg0, f156_arg1 )
	return {
		name = "PlatformSessionJoin",
		controller = f156_arg0,
		info = f156_arg1,
		startFuncPtr = function ( f157_arg0 )
			if f156_arg1.gamertags == nil or #f156_arg1.gamertags == 0 then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f157_arg0.actionId
				} )
				return 
			elseif Engine.GamertagsToXuids( f157_arg0.actionId, f157_arg0.controller, f157_arg0.info.gamertags ) == false then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f157_arg0.actionId
				} )
				return 
			else
				
			end
		end
		,
		endFuncPtr = function ( f158_arg0 )
			if f158_arg0.retData.isError == true then
				return 
			elseif f158_arg0.retData.userInfo == nil or #f158_arg0.retData.userInfo == 0 then
				f158_arg0.gamertag = ""
				f158_arg0.xuid = 0
				return 
			else
				f158_arg0.gamertag = f158_arg0.retData.userInfo[1].gamertag
				f158_arg0.xuid = f158_arg0.retData.userInfo[1].xuid
			end
		end
		
	}
end

Lobby.Actions.SetGameAndTypeMapName = function ( f159_arg0, f159_arg1, f159_arg2, f159_arg3 )
	return {
		name = "SetGameAndTypeMapName",
		controller = f159_arg0,
		gameType = f159_arg2,
		mapName = f159_arg3,
		startFuncPtr = function ( f160_arg0 )
			Engine.Exec( f160_arg0.controller, "lobby_setmap " .. f160_arg0.mapName )
			Engine.Exec( f160_arg0.controller, "lobby_setgametype " .. f160_arg0.gameType )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f160_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.SetSavedOrDefaultMap = function ( f161_arg0, f161_arg1 )
	return {
		name = "SetSavedOrDefaultMap",
		controller = f161_arg0,
		startFuncPtr = function ( f162_arg0 )
			if Engine.IsCampaignGame() then
				local f162_local0 = Engine.GetSavedMap()
				if string.len( f162_local0 ) == 0 then
					f162_local0 = LuaUtils.GetDefaultMap( f161_arg1 )
				end
				Dvar.ui_mapname:set( f162_local0 )
				Dvar.cp_queued_level:set( Engine.GetSavedMapQueuedMap() )
				Engine.GameLobbySetMap( f162_local0 )
			end
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f162_arg0.actionId
			} )
		end
		
	}
end

