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
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), true )
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
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), false )
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
			if f28_arg0.condition then
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

Lobby.Actions.EvaluateFunction = function ( f29_arg0 )
	return {
		name = "EvaluateFunction()",
		func = f29_arg0,
		startFuncPtr = function ( f30_arg0 )
			if f30_arg0.func() then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f30_arg0.actionId
				} )
			else
				LobbyVM.ProcessCompleteFailure( {
					actionId = f30_arg0.actionId
				} )
			end
		end
		
	}
end

Lobby.Actions.WaitTillOutOfGame = function ()
	return {
		name = "WaitTillOutOfGame",
		startFuncPtr = function ( f32_arg0 )
			if Engine.IsInGame() == false then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f32_arg0.actionId
				} )
			end
		end
		,
		pumpFuncPtr = function ( f33_arg0, f33_arg1 )
			if Engine.IsInGame() == false then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f33_arg0.actionId
				} )
			end
		end
		
	}
end

Lobby.Actions.CanAcceptPlatformInvite = function ( f34_arg0 )
	return {
		name = "CanAcceptPlatformInvite(controller: " .. tostring( f34_arg0 ) .. ")",
		controller = f34_arg0,
		startFuncPtr = function ( f35_arg0 )
			local f35_local0 = true
			if LuaUtils.IsSkuOfflineOnly() then
				f35_local0 = false
			end
			if f35_local0 then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f35_arg0.actionId
				} )
			else
				LobbyVM.ProcessCompleteFailure( {
					actionId = f35_arg0.actionId
				} )
			end
		end
		
	}
end

Lobby.Actions.SendPlatformInvite = function ( f36_arg0, f36_arg1, f36_arg2, f36_arg3 )
	return {
		name = "SendPlatformInvite(controller: " .. tostring( f36_arg0 ) .. ")",
		controller = f36_arg0,
		lobbyType = f36_arg1,
		gamertag = f36_arg2,
		sessionId = f36_arg3,
		startFuncPtr = function ( f37_arg0 )
			if Engine.PlatformSessionPS4Invite( f37_arg0.actionId, f37_arg0.controller, f37_arg0.lobbyType, Engine.NumberToUInt64( 0 ), f37_arg0.gamertag, Lobby.Platform.PS4GetSessionId( f36_arg0 ) ) == false then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f37_arg0.actionId
				} )
			end
		end
		
	}
end

Lobby.Actions.CanPlayOnline = function ( f38_arg0 )
	return {
		name = "CanPlayOnline(controller: " .. tostring( f38_arg0 ) .. ")",
		controller = f38_arg0,
		checkPlusEndTime = 0,
		startFuncPtr = function ( f39_arg0 )
			local f39_local0 = f39_arg0.controller
			local f39_local1 = true
			if LuaUtils.isPS4 then
				if not Engine.IsSignedIntoPSN( f39_local0 ) then
					Engine.DisplayNpError( f39_local0, "-2141913082" )
					f39_local1 = false
				elseif Engine.DisplayNpAvailabilityErrors( f39_local0 ) then
					f39_local1 = false
				else
					local f39_local2, f39_local3 = Engine.CheckPSPlus( f39_local0 )
					if f39_local2 == true then
						if f39_local3 == false then
							f39_local1 = false
							Engine.DisplayUpsellAndContentWarnings( f39_local0 )
						end
					else
						f39_arg0.checkPlusEndTime = Engine.milliseconds() + LuaEnums.PS_PLUS_CHECK_TIME
						return 
					end
				end
			elseif LuaUtils.isXbox and (Engine.HasMPPrivileges( f39_local0 ) == false or Engine.IsPlusAuthorized( f39_local0 ) == false) then
				Engine.PrivilegeForceCheck( f39_local0, 254, true )
				f39_local1 = false
			end
			if f39_local1 then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f39_arg0.actionId
				} )
			else
				LobbyVM.ProcessCompleteFailure( {
					actionId = f39_arg0.actionId
				} )
			end
		end
		,
		pumpFuncPtr = function ( f40_arg0 )
			local f40_local0 = false
			if LuaUtils.isPS4 then
				local f40_local1, f40_local2 = Engine.CheckPSPlus( f38_arg0 )
				if f40_local1 == false and f40_arg0.checkPlusEndTime > Engine.milliseconds() then
					return 
				elseif f40_local2 == true then
					f40_local0 = true
				else
					Engine.DisplayUpsellAndContentWarnings( f38_arg0 )
				end
			end
			if f40_local0 then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f40_arg0.actionId
				} )
			else
				LobbyVM.ProcessCompleteFailure( {
					actionId = f40_arg0.actionId
				} )
			end
		end
		
	}
end

Lobby.Actions.DisableConnectingToDemonware = function ( f41_arg0 )
	return {
		name = "DisableConnectingToDemonware",
		controller = f41_arg0,
		startFuncPtr = function ( f42_arg0 )
			if Engine.IsSignedInToDemonware( f42_arg0.controller ) and not Engine.IsDemonwareFetchingDone( f41_arg0 ) and Engine.LiveConnectDisconnectFromDemonware then
				Engine.LiveConnectDisconnectFromDemonware( f42_arg0.controller )
			end
			Engine.LiveConnectDisableDemonwareConnect()
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f42_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.EnableConnectingToDemonware = function ( f43_arg0 )
	return {
		name = "EnableConnectingToDemonware",
		controller = f43_arg0,
		startFuncPtr = function ( f44_arg0 )
			Engine.LiveConnectEnableDemonwareConnect()
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f44_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.ConnectingToDemonware = function ( f45_arg0, f45_arg1, f45_arg2 )
	return {
		name = "ConnectingToDemonware(check for " .. f45_arg1 .. "ms)",
		controller = f45_arg0,
		waitMilliseconds = f45_arg1,
		invite = f45_arg2,
		endTime = nil,
		checkInterval = 100,
		checkTime = nil,
		startFuncPtr = function ( f46_arg0 )
			if f46_arg0.waitMilliseconds == 0 and Engine.IsDemonwareFetchingDone( f46_arg0.controller ) then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f46_arg0.actionId
				} )
				return 
			elseif f45_arg2 == true or Engine.GetLobbyUIScreen() == LobbyData.UITargets.UI_MAIN.id then
				Engine.SetLobbyNetworkMode( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
			end
			Engine.LiveConnectEnableDemonwareConnect()
			f46_arg0.endTime = f46_arg0.waitMilliseconds + Engine.milliseconds()
			f46_arg0.checkTime = f46_arg0.checkInterval + Engine.milliseconds()
		end
		,
		pumpFuncPtr = function ( f47_arg0, f47_arg1 )
			if f47_arg0.checkTime > Engine.milliseconds() then
				return 
			else
				f47_arg0.checkTime = f47_arg0.checkInterval + Engine.milliseconds()
				if Engine.IsDemonwareFetchingDone( f47_arg0.controller ) == true then
					if true == LuaUtils.isPS4 then
						if Engine.DisplayNpAvailabilityErrors( f45_arg0 ) then
							LobbyVM.ProcessCompleteFailure( {
								actionId = f47_arg0.actionId
							} )
							return 
						elseif not Engine.DisplayUpsellAndContentWarnings( f47_arg0.controller ) then
							LobbyVM.ProcessCompleteFailure( {
								actionId = f47_arg0.actionId
							} )
							return 
						end
					end
					LobbyVM.ProcessCompleteSuccess( {
						actionId = f47_arg0.actionId
					} )
					return 
				elseif f47_arg0.endTime < Engine.milliseconds() then
					LobbyVM.ProcessCompleteFailure( {
						actionId = f47_arg0.actionId
					} )
					return 
				else
					
				end
			end
		end
		,
		cancelFuncPtr = function ( f48_arg0 )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f48_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.IsButtonPressed = function ( f49_arg0, f49_arg1 )
	return {
		name = "IsButtonPressed",
		controller = f49_arg0,
		button = f49_arg1,
		startFuncPtr = function ( f50_arg0 )
			if not Engine.IsDevelopmentBuild() then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f50_arg0.actionId
				} )
				return 
			elseif Engine.IsButtonPressed( f50_arg0.controller, f50_arg0.button ) then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f50_arg0.actionId
				} )
				return 
			else
				LobbyVM.ProcessCompleteFailure( {
					actionId = f50_arg0.actionId
				} )
			end
		end
		
	}
end

Lobby.Actions.IsDvarSet = function ( f51_arg0, f51_arg1 )
	return {
		name = "IsDvarSet(dvar: " .. f51_arg0 .. ", check for value: " .. tostring( f51_arg1 ) .. ")",
		dvarName = f51_arg0,
		dvarValue = f51_arg1,
		startFuncPtr = function ( f52_arg0 )
			local f52_local0 = f52_arg0.dvarName
			local f52_local1 = f52_arg0.dvarValue
			local f52_local2 = Engine.GetDvarType( f52_local0 )
			local f52_local3 = false
			if f52_local2 == Enum.dvarType_t.DVAR_TYPE_INVALID then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f52_arg0.actionId
				} )
			elseif f52_local2 == Enum.dvarType_t.DVAR_TYPE_BOOL then
				f52_local3 = f52_local1 == Engine.DvarBool( 0, f52_local0 )
			elseif f52_local2 == Enum.dvarType_t.DVAR_TYPE_FLOAT then
				f52_local3 = f52_local1 == Engine.DvarFloat( f52_local0 )
			elseif f52_local2 == Enum.dvarType_t.DVAR_TYPE_INT then
				f52_local3 = f52_local1 == Engine.DvarInt( 0, f52_local0 )
			elseif f52_local2 == Enum.dvarType_t.DVAR_TYPE_STRING then
				f52_local3 = f52_local1 == Engine.DvarString( 0, f52_local0 )
			end
			if f52_local3 then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f52_arg0.actionId
				} )
				return 
			else
				LobbyVM.ProcessCompleteFailure( {
					actionId = f52_arg0.actionId
				} )
			end
		end
		
	}
end

Lobby.Actions.ErrorPopupMsg = function ( f53_arg0, f53_arg1 )
	return {
		name = "ErrorPopupMsg",
		message = f53_arg0,
		title = f53_arg1,
		startFuncPtr = function ( f54_arg0 )
			LuaUtils.UI_ShowErrorMessageDialog( nil, f54_arg0.message, f54_arg0.title )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f54_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.WarningPopupMsg = function ( f55_arg0, f55_arg1 )
	return {
		name = "WarningPopupMsg",
		message = f55_arg0,
		title = f55_arg1,
		startFuncPtr = function ( f56_arg0 )
			LuaUtils.UI_ShowWarningMessageDialog( nil, f56_arg0.message, f56_arg0.title )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f56_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.ErrorPopup = function ( f57_arg0 )
	if f57_arg0.errorFuncPtr == nil then
		error( "Lobby.Actions.ErrorPopup: An action: " .. f57_arg0.name .. " with no errorFuncPtr has been used." )
	end
	return {
		name = "ErrorPopup: " .. f57_arg0.name,
		actionRef = f57_arg0,
		startFuncPtr = function ( f58_arg0 )
			local f58_local0 = "UNHANDLED ERROR OCCURRED (" .. f57_arg0.name .. " action)"
			if f57_arg0.errorFuncPtr ~= nil then
				f58_local0 = f58_arg0.actionRef:errorFuncPtr()
			end
			LuaUtils.UI_ShowErrorMessageDialog( nil, f58_local0 )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f58_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.ConnectToDW = function ( f59_arg0 )
	return {
		name = "ConnectToDW",
		controller = f59_arg0,
		startFuncPtr = function ( f60_arg0 )
			
		end
		
	}
end

Lobby.Actions.SetDefaultArenaPlaylist = function ( f61_arg0 )
	return {
		name = "SetDefaultPlaylist",
		controller = f61_arg0,
		startFuncPtr = function ( f62_arg0 )
			local f62_local0 = Engine.GetProfileVarInt( f61_arg0, "playlist_leaguematch" )
			local f62_local1 = nil
			if f62_local0 <= 0 then
				if Dvar.arena_defaultPlaylist:exists() then
					f62_local1 = Dvar.arena_defaultPlaylist:get()
				else
					f62_local1 = 40
				end
			else
				f62_local1 = f62_local0
			end
			local f62_local2 = nil
			local f62_local3, f62_local4 = LuaUtils.GetArenaPlaylistInfo()
			for f62_local8, f62_local9 in ipairs( f62_local4 ) do
				if f62_local9.index == f62_local1 then
					f62_local2 = f62_local9
					break
				end
			end
			if not f62_local2 then
				f62_local2 = f62_local4[1]
			end
			if f62_local2 then
				Engine.SetPlaylistID( f62_local2.index )
				Engine.SetProfileVar( f61_arg0, "playlist_leaguematch", tostring( f62_local2.index ) )
				f62_local5 = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyPlaylist" )
				Engine.SetModelValue( Engine.CreateModel( f62_local5, "name" ), Engine.ToUpper( f62_local2.name ) )
				Engine.SetModelValue( Engine.CreateModel( f62_local5, "kickerText" ), "" )
			end
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f62_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.ArenaErrorShutdown = function ( f63_arg0 )
	return {
		name = "ArenaErrorShutdown",
		controller = f63_arg0,
		startFuncPtr = function ( f64_arg0 )
			Lobby.Pregame.Shutdown( f63_arg0 )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f64_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.RunPlaylistSettings = function ( f65_arg0 )
	return {
		name = "RunPlaylistSettings",
		require = "LobbySettings",
		controller = f65_arg0,
		startFuncPtr = function ( f66_arg0 )
			Engine.RunPlaylistSettings( f66_arg0.controller )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f66_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.RunPlaylistRules = function ( f67_arg0 )
	return {
		name = "RunPlaylistRules",
		require = "LobbySettings",
		controller = f67_arg0,
		startFuncPtr = function ( f68_arg0 )
			Engine.RunPlaylistRules( f68_arg0.controller )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f68_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.SwitchMode = function ( f69_arg0, f69_arg1 )
	return {
		name = "SwitchMode",
		controller = f69_arg0,
		toMode = f69_arg1,
		pumpFuncPtr = function ( f70_arg0 )
			Engine.SwitchMode( f70_arg0.controller, f70_arg0.toMode )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f70_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.SwitchCampaignMode = function ( f71_arg0, f71_arg1 )
	return {
		name = "SwitchCampaignMode",
		controller = f71_arg0,
		toMode = f71_arg1,
		startFuncPtr = function ( f72_arg0 )
			Engine.SwitchCampaignMode( f72_arg0.toMode )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f72_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.ForceLobbyUIScreen = function ( f73_arg0, f73_arg1 )
	return {
		name = "ForceLobbyUIScreen",
		controller = f73_arg0,
		screenId = f73_arg1,
		startFuncPtr = function ( f74_arg0 )
			Engine.ForceLobbyUIScreen( f74_arg0.screenId )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f74_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.LobbyHostStart = function ( f75_arg0, f75_arg1, f75_arg2, f75_arg3, f75_arg4 )
	return {
		name = "LobbyHostStart(" .. Engine.GetLobbyTypeName( f75_arg2 ) .. ")",
		controller = f75_arg0,
		mainMode = f75_arg1,
		lobbyType = f75_arg2,
		lobbyMode = f75_arg3,
		maxClients = f75_arg4,
		startFuncPtr = function ( f76_arg0 )
			Engine.LobbyHostStart( f76_arg0.actionId, f76_arg0.controller, f76_arg0.mainMode, f76_arg0.lobbyType, f76_arg0.lobbyMode, f76_arg0.maxClients )
		end
		,
		errorFuncPtr = function ( f77_arg0 )
			return "Failed to host a lobby"
		end
		
	}
end

Lobby.Actions.LobbyHostStartMigratedInfo = function ( f78_arg0, f78_arg1, f78_arg2, f78_arg3, f78_arg4, f78_arg5 )
	return {
		name = "LobbyHostStartMigrate(" .. Engine.GetLobbyTypeName( f78_arg2 ) .. ")",
		controller = f78_arg0,
		mainMode = f78_arg1,
		lobbyType = f78_arg2,
		lobbyMode = f78_arg3,
		maxClients = f78_arg4,
		hostInfo = f78_arg5,
		startFuncPtr = function ( f79_arg0 )
			Engine.LobbyHostStart( f79_arg0.actionId, f79_arg0.controller, f79_arg0.mainMode, f79_arg0.lobbyType, f79_arg0.lobbyMode, f79_arg0.maxClients, f79_arg0.hostInfo )
		end
		
	}
end

Lobby.Actions.LobbyHostEnd = function ( f80_arg0 )
	return {
		name = "LobbyHostEnd(" .. Engine.GetLobbyTypeName( f80_arg0 ) .. ")",
		lobbyType = f80_arg0,
		startFuncPtr = function ( f81_arg0 )
			Engine.LobbyHostEnd( f81_arg0.actionId, f81_arg0.lobbyType )
		end
		,
		errorFuncPtr = function ( f82_arg0 )
			return "Failed to end lobby"
		end
		
	}
end

Lobby.Actions.LobbyHostAddPrimary = function ( f83_arg0 )
	return {
		name = "LobbyHostAddPrimary(" .. Engine.GetLobbyTypeName( f83_arg0 ) .. ")",
		lobbyType = f83_arg0,
		startFuncPtr = function ( f84_arg0 )
			Engine.LobbyHostAddPrimary( f84_arg0.actionId, f84_arg0.lobbyType )
		end
		
	}
end

Lobby.Actions.LobbyHostAddLocal = function ( f85_arg0, f85_arg1 )
	return {
		name = "LobbyHostAddLocal(" .. Engine.GetLobbyTypeName( f85_arg1 ) .. ")",
		controller = f85_arg0,
		lobbyType = f85_arg1,
		startFuncPtr = function ( f86_arg0 )
			Engine.LobbyHostAddLocal( f86_arg0.actionId, f86_arg0.controller, f86_arg0.lobbyType )
		end
		
	}
end

Lobby.Actions.LobbyClientStart = function ( f87_arg0 )
	return {
		name = "LobbyClientStart(" .. Engine.GetLobbyTypeName( f87_arg0 ) .. ")",
		lobbyType = f87_arg0,
		startFuncPtr = function ( f88_arg0 )
			Engine.LobbyClientStart( f88_arg0.actionId, f88_arg0.lobbyType )
		end
		
	}
end

Lobby.Actions.LobbyClientEnd = function ( f89_arg0 )
	return {
		name = "LobbyClientEnd(" .. Engine.GetLobbyTypeName( f89_arg0 ) .. ")",
		lobbyType = f89_arg0,
		startFuncPtr = function ( f90_arg0 )
			Engine.LobbyClientEnd( f90_arg0.actionId, f90_arg0.lobbyType )
		end
		
	}
end

Lobby.Actions.LobbyLocalClientLeave = function ( f91_arg0, f91_arg1, f91_arg2 )
	return {
		name = "LobbyLocalClientLeave(" .. Engine.GetLobbyTypeName( f91_arg0 ) .. ")",
		lobbyType = f91_arg0,
		controller = f91_arg1,
		xuid = f91_arg2,
		startFuncPtr = function ( f92_arg0 )
			Engine.LobbyLocalClientLeave( f92_arg0.actionId, f92_arg0.lobbyType, f92_arg0.controller, f92_arg0.xuid )
		end
		
	}
end

Lobby.Actions.LeaveWithParty = function ( f93_arg0 )
	return {
		name = "LeaveWithParty(wait for " .. f93_arg0 .. "ms)",
		waitMilliseconds = f93_arg0,
		endTime = nil,
		checkInterval = 50,
		checkTime = nil,
		startFuncPtr = function ( f94_arg0 )
			if Engine.InLobbyParty( Enum.LobbyType.LOBBY_TYPE_GAME ) == false then
				Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: " .. f94_arg0.name .. ", we a loner in a private party, time to split, sweet!\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f94_arg0.actionId
				} )
				return 
			elseif Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) == false then
				Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: " .. f94_arg0.name .. ", we are not the host of our private party.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f94_arg0.actionId
				} )
				return 
			end
			local f94_local0 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			if f94_local0 == 1 or f94_local0 == Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f94_arg0.actionId
				} )
				return 
			elseif Engine.LeaveWithParty() == false then
				Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: " .. f94_arg0.name .. ", failed to tell party members to leave, we failed but we should leave anyway.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f94_arg0.actionId
				} )
				return 
			elseif Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) == false then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: " .. f94_arg0.name .. ", we are not the host of the game lobby, it is safe to leave now.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f94_arg0.actionId
				} )
			end
			f94_arg0.endTime = f94_arg0.waitMilliseconds + Engine.milliseconds()
			f94_arg0.checkTime = f94_arg0.checkInterval + Engine.milliseconds()
		end
		,
		pumpFuncPtr = function ( f95_arg0, f95_arg1 )
			if f95_arg0.checkTime > Engine.milliseconds() then
				return 
			end
			f95_arg0.checkTime = f95_arg0.checkInterval + Engine.milliseconds()
			local f95_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			local f95_local1 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
			local f95_local2 = false
			for f95_local9, f95_local10 in ipairs( f95_local0.sessionClients ) do
				for f95_local6, f95_local7 in ipairs( f95_local1.sessionClients ) do
					if f95_local10.isHost == false and f95_local10.xuid == f95_local7.xuid then
						f95_local2 = true
					end
				end
			end
			if f95_local2 == false then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: " .. f95_arg0.name .. ", all clients have left the game lobby, we can now leave.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f95_arg0.actionId
				} )
				return 
			elseif f95_arg0.endTime < Engine.milliseconds() then
				Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: " .. f95_arg0.name .. ", not all clients have left the game lobby, time to move on.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f95_arg0.actionId
				} )
				return 
			else
				
			end
		end
		,
		cancelFuncPtr = function ( f96_arg0 )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f96_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.LobbyInRecovery = function ()
	return {
		name = "LobbyInRecovery",
		startFuncPtr = function ( f98_arg0 )
			if Engine.LobbyInRecovery then
				Engine.LobbyInRecovery()
			end
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f98_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.CanHostServer = function ( f99_arg0, f99_arg1 )
	return {
		name = "CanHostServer",
		controller = f99_arg0,
		toTarget = f99_arg1,
		failureReason = nil,
		startFuncPtr = function ( f100_arg0 )
			local f100_local0 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
			if f100_arg0.toTarget.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
				if Engine.IsFeatureBanned and Engine.IsFeatureBanned( f100_arg0.controller, LuaEnums.FEATURE_BAN.MP_HOSTING ) == true then
					Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "CANNOT HOST A SERVER: HOST_SERVER_BANNED_FROM_HOSTING.\n" )
					LobbyVM.ProcessCompleteFailure( {
						actionId = f100_arg0.actionId
					} )
					return 
				elseif not Lobby.MatchmakingMP.AllowListenSearch( Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) ) then
					Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "CANNOT HOST A SERVER: MATCHMAKING_ALLOW_LISTEN_SERVER_FAIL.\n" )
					LobbyVM.ProcessCompleteFailure( {
						actionId = f100_arg0.actionId
					} )
					return 
				end
			end
			local f100_local1, f100_local2 = Engine.CanHostServer( f100_arg0.controller, f100_local0 )
			if LuaUtils.IsArenaMode() and Lobby.MatchmakingArena.CanHostAnyLobby() == false then
				Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "CANNOT HOST A SERVER: ARENA MATCHMAKING DENIED HOST REQUEST\n" )
				LobbyVM.ProcessCompleteFailure( {
					actionId = f100_arg0.actionId
				} )
				return 
			elseif f100_local1 == true then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Can host server.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f100_arg0.actionId
				} )
				return 
			end
			f100_arg0.failureReason = f100_local2
			local f100_local3 = "HOST_SERVER_UNKNOWN"
			if f100_local2 == Enum.HostServer.HOST_SERVER_BANDWIDTH_TEST_IN_PROGRESS then
				f100_local3 = "HOST_SERVER_BANDWIDTH_TEST_IN_PROGRESS"
			elseif f100_local2 == Enum.HostServer.HOST_SERVER_NOT_HOST_OF_PARTY then
				f100_local3 = "HOST_SERVER_NOT_HOST_OF_PARTY"
			elseif f100_local2 == Enum.HostServer.HOST_SERVER_DEDICATED_ONLY then
				f100_local3 = "HOST_SERVER_DEDICATED_ONLY"
			elseif f100_local2 == Enum.HostServer.HOST_SERVER_NAT_TYPE_NOT_ALLOWED then
				f100_local3 = "HOST_SERVER_NAT_TYPE_NOT_ALLOWED"
			elseif f100_local2 == Enum.HostServer.HOST_SERVER_WE_SHOULD_NOT_HOST then
				f100_local3 = "HOST_SERVER_WE_SHOULD_NOT_HOST"
			elseif f100_local2 == Enum.HostServer.HOST_SERVER_IS_NOT_GOOD_CITIZEN then
				f100_local3 = "HOST_SERVER_IS_NOT_GOOD_CITIZEN"
			elseif f100_local2 == Enum.HostServer.HOST_SERVER_HAS_NOT_NECESSARY_BANDWIDTH then
				f100_local3 = "HOST_SERVER_HAS_NOT_NECESSARY_BANDWIDTH"
			elseif f100_local2 == Enum.HostServer.HOST_SERVER_NET_ENGINE_NOT_STARTED then
				f100_local3 = "HOST_SERVER_NET_ENGINE_NOT_STARTED"
			elseif f100_local2 == Enum.HostServer.HOST_SERVER_LIVE_STREAMING then
				f100_local3 = "HOST_SERVER_LIVE_STREAMING"
			elseif f100_local2 == Enum.HostServer.HOST_SERVER_BANNED_FROM_HOSTING then
				f100_local3 = "HOST_SERVER_BANNED_FROM_HOSTING"
			elseif f100_local2 == Enum.HostServer.HOST_SERVER_IS_IN_SHARE_PLAY then
				f100_local3 = "HOST_SERVER_IS_IN_SHARE_PLAY"
			end
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "CANNOT HOST A SERVER: " .. f100_local3 .. ".\n" )
			LobbyVM.ProcessCompleteFailure( {
				actionId = f100_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.GeoMinCheck = function ( f101_arg0, f101_arg1 )
	local f101_local0 = Dvar.lobbySearchGeoMin:get()
	if f101_local0 == 0 then
		return true
	end
	local f101_local1 = 0
	if f101_arg0.geo_1 == f101_arg1.geo_1 then
		f101_local1 = f101_local1 + 1
		if f101_arg0.geo_2 == f101_arg1.geo_2 then
			f101_local1 = f101_local1 + 1
			if f101_arg0.geo_3 == f101_arg1.geo_3 then
				f101_local1 = f101_local1 + 1
				if f101_arg0.geo_4 == f101_arg1.geo_4 then
					f101_local1 = f101_local1 + 1
				end
			end
		end
	end
	return f101_local0 <= f101_local1
end

Lobby.Actions.ShouldGateBySkill = function ( f102_arg0, f102_arg1 )
	if Engine.DvarBool( nil, "lobbySearchSkillGateEnabled" ) and Engine.ExperimentsGetVariant( f102_arg0, "skillgate_exp" ) and Engine.DvarFloat( "lobbySearchSkillGateProbability" ) >= math.random() then
		return f102_arg1 < Engine.DvarFloat( "lobbySearchMaxGateSkill" )
	else
		return false
	end
end

Lobby.Actions.SkillCheck = function ( f103_arg0, f103_arg1, f103_arg2 )
	if LuaUtils.IsArenaMode() then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Skillcheck: Pass, arena match\n" )
		return true
	elseif f103_arg2.isEmpty ~= 0 then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Skillcheck: Pass, host is empty\n" )
		return true
	elseif f103_arg2.serverType ~= Lobby.Matchmaking.ServerType.DEDICATED_SERVER then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Skillcheck: Pass, not a dedicated host\n" )
		return true
	else
		numSlots = Lobby.Matchmaking.GetNumSlotsNeededOnTeam( Lobby.Matchmaking.SearchParams.stage )
		if numSlots > 1 then
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Skillcheck: Pass, we're in a party\n" )
			return true
		elseif Lobby.Actions.ShouldGateBySkill( f103_arg0, f103_arg1 ) then
			local f103_local0 = math.abs( f103_arg1 - f103_arg2.skill )
			local f103_local1 = Engine.DvarFloat( "lobbySearchBaseSkillRange" ) + Lobby.Matchmaking.SearchParams.retry * Engine.DvarFloat( "lobbySearchSkillRangeMultiplier" )
			if f103_local1 <= 0 then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Skillcheck: pass, skillrange < 0\n" )
				return true
			elseif f103_local0 < f103_local1 then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Skillcheck: Pass, skilldelta " .. f103_local0 .. " is < skillrange " .. f103_local1 .. "\n" )
				Lobby.Matchmaking.EnableExperiment( f103_arg0 )
				return true
			else
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Skillcheck: Fail, skilldelta " .. f103_local0 .. " is  >= than skillrange " .. f103_local1 .. "\n" )
				return false
			end
		else
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Skillcheck: pass, not in treatment group\n" )
			return true
		end
	end
end

Lobby.Actions.SearchForLobby = function ( f104_arg0 )
	return {
		name = "LobbySearch",
		controller = f104_arg0,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		filteredResult = {},
		startFuncPtr = function ( f105_arg0 )
			Lobby.Matchmaking.SetupMatchmakingStage( f105_arg0.controller )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "SearchForLobby, begin search.\n" )
			LobbyVM.LobbyStatusUpdate( {
				searchStage = 1,
				numResults = 50
			} )
			Engine.SearchForLobby( f105_arg0.actionId, f105_arg0.lobbyType )
		end
		,
		endFuncPtr = function ( f106_arg0 )
			LuaUtils.LogQoS( "search_query", Engine.GetSearchQuery() )
			local f106_local0 = Engine.GetSearchResults( f106_arg0.lobbyType )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "SearchForLobby, number of results found " .. f106_local0.numResults .. ".\n" )
			local f106_local1 = f106_local0.errorCode
			local f106_local2 = f106_local0.numResults
			Lobby.Debug.SessionSQJSearchResults( f106_local0 )
			if f106_local2 == 0 then
				LobbyVM.LobbyStatusUpdate( {
					searchStage = 1,
					numResults = 0
				} )
				return 
			end
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------SEARCH RESULTS----------------------------\n" )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "xuid, gameSecurityId, gameType, maxPlayers, numPlayers, serverType, showInMatchmaking, netcodeVersion, mapPacks, playlistVersion, playlistNumber, isEmpty, teamSizeMax, skill, serverLocation, latencyBand, geo_1, geo_2, geo_3, geo_4\n" )
			for f106_local6, f106_local7 in ipairs( f106_local0.remoteHosts ) do
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, tostring( f106_local7.xuid ) .. ", " .. Engine.UInt64ToString( f106_local7.gameSecurityId ) .. ", " .. f106_local7.gameType .. ", " .. f106_local7.maxPlayers .. ", " .. f106_local7.numPlayers .. ", " .. f106_local7.serverType .. ", " .. f106_local7.showInMatchmaking .. ", " .. f106_local7.netcodeVersion .. ", " .. f106_local7.mapPacks .. ", " .. f106_local7.playlistVersion .. ", " .. f106_local7.playlistNumber .. ", " .. f106_local7.isEmpty .. ", " .. f106_local7.teamSizeMax .. ", " .. f106_local7.skill .. ", " .. f106_local7.serverLocation .. ", " .. f106_local7.latencyBand .. ", " .. Engine.UInt64ToString( f106_local7.geo_1 ) .. ", " .. Engine.UInt64ToString( f106_local7.geo_2 ) .. ", " .. Engine.UInt64ToString( f106_local7.geo_3 ) .. ", " .. Engine.UInt64ToString( f106_local7.geo_4 ) .. ".\n" )
			end
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------------------------------------------------\n" )
			f106_arg0.filteredResult = {}
			f106_local3 = Engine.GetGeoLocation()
			f106_local4 = Engine.GetLobbyHostXuid( f106_arg0.lobbyType )
			f106_local5 = 1
			for f106_local11, f106_local12 in ipairs( f106_local0.remoteHosts ) do
				if f106_local4 == f106_local12.xuid then
					
				end
				hostOK = false
				if f106_local12.serverType == Lobby.Matchmaking.ServerType.DEDICATED_SERVER then
					if Engine.IsDedicatedServer() == true then
						hostOK = true
					else
						latencytoserverlocation = Engine.GetPingForServerLocation( f106_local12.serverLocation )
						if f106_local12.latencyBand == 0 then
							hostOK = true
						elseif math.abs( f106_local12.latencyBand - latencytoserverlocation ) > Dvar.lobbySearchMaxLatencyBandDiff:get() then
							Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Rejecting result from serverlocation " .. f106_local12.serverLocation .. ", the latencyband is " .. f106_local12.latencyBand .. "ms and our latency is " .. latencytoserverlocation .. "\n" )
						else
							hostOK = true
						end
					end
				elseif Lobby.Actions.GeoMinCheck( f106_local3, f106_local12 ) then
					hostOK = true
				end
				if hostOK then
					hostOK = Lobby.Actions.SkillCheck( f104_arg0, Dvar.lobbySearchSkill:get(), f106_local12 )
				end
				if hostOK then
					local f106_local9 = Dvar.lobbySearchForceXuid:get()
					if f106_local9 ~= nil and f106_local9 ~= Engine.DefaultID64Value() then
						local f106_local10 = hostOK
						if f106_local10 then
							f106_local10 = f106_local9 == f106_local12.xuid
						end
						hostOK = f106_local10
					end
				end
				if hostOK then
					hostOK = not Lobby.MatchmakingPriority.IgnoreSearchResult( f106_local12.gameSecurityId )
					if hostOK == false then
						Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Matchmaking priority, ignoring host...\n" )
						Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, tostring( f106_local12.xuid ) .. ", " .. Engine.UInt64ToString( f106_local12.gameSecurityId ) .. ", " .. f106_local12.gameType .. ", " .. f106_local12.maxPlayers .. ", " .. f106_local12.numPlayers .. ", " .. f106_local12.serverType .. ", " .. f106_local12.showInMatchmaking .. ", " .. f106_local12.netcodeVersion .. ", " .. f106_local12.mapPacks .. ", " .. f106_local12.playlistVersion .. ", " .. f106_local12.playlistNumber .. ", " .. f106_local12.isEmpty .. ", " .. f106_local12.teamSizeMax .. ", " .. f106_local12.skill .. ", " .. f106_local12.serverLocation .. ", " .. f106_local12.latencyBand .. ", " .. Engine.UInt64ToString( f106_local12.geo_1 ) .. ", " .. Engine.UInt64ToString( f106_local12.geo_2 ) .. ", " .. Engine.UInt64ToString( f106_local12.geo_3 ) .. ", " .. Engine.UInt64ToString( f106_local12.geo_4 ) .. ".\n" )
					end
				end
				if hostOK then
					f106_arg0.filteredResult[f106_local5] = {
						xuid = f106_local12.xuid,
						gameSecurityId = f106_local12.gameSecurityId,
						gameSecurityKey = f106_local12.gameSecurityKey,
						hostAddress = f106_local12.hostAddress
					}
					f106_local5 = f106_local5 + 1
				end
			end
			LobbyVM.LobbyStatusUpdate( {
				searchStage = 1,
				numResults = #f106_arg0.filteredResult
			} )
			LuaUtils.LogQoS( "search_results", f106_arg0.filteredResult )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "SearchForLobby, number of filtered results " .. #f106_arg0.filteredResult .. ".\n" )
		end
		,
		errorFuncPtr = function ()
			return Engine.Localize( "MENU_NO_SESSIONS" )
		end
		,
		cancelFuncPtr = function ( f108_arg0 )
			Engine.LobbySearchErrorShutdown()
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f108_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.JOIN_STATUS = {
	BEGIN = 1,
	ADD = 2,
	FINALIZE = 3
}
Lobby.Actions.QoSJoinSearchResults = function ( f109_arg0, f109_arg1 )
	return {
		name = "QoSJoinSearchResults",
		controller = f109_arg0,
		searchAction = f109_arg1,
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
		startFuncPtr = function ( f110_arg0 )
			f110_arg0.sourceLobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
			f110_arg0.targetLobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
			f110_arg0.joinStatusCur = Lobby.Actions.JOIN_STATUS.BEGIN
			f110_arg0.minInitialCount = 0
			f110_arg0.updateTime = nil
			f110_arg0.firstResultTime = nil
			f110_arg0.searchTime = nil
			f110_arg0.qosResultsValid = {}
			f110_arg0.qosResultsInvalid = {}
			f110_arg0.joiningNumHosts = 0
			f110_arg0.joiningCurHost = 1
			local f110_local0 = f110_arg0.searchAction.filteredResult
			if f110_local0 == nil then
				error( "QoSJoinSearchResults: self.searchAction.filteredResult should not be nil" )
				f110_local0 = {}
			end
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, num of search results passed " .. #f110_local0 .. " for QoS.\n" )
			if #f110_local0 == 0 then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f110_arg0.actionId
				} )
				return 
			end
			LobbyVM.LobbyStatusUpdate( {
				searchStage = 2,
				numResults = #f110_local0,
				contactedResults = 0
			} )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, starting probes.\n" )
			if Engine.QoSProbeInitiate( f110_arg0.actionId, f110_arg0.sourceLobbyType, f110_local0 ) == false then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, QoSProbeInitiate failed.\n" )
				LobbyVM.ProcessCompleteFailure( {
					actionId = f110_arg0.actionId
				} )
			end
			f110_arg0.minInitialCount = #f110_local0 * Dvar.qos_minPercent:get() / 100
			f110_arg0.minInitialCount = math.max( f110_arg0.minInitialCount, Dvar.qos_minProbes:get() )
			f110_arg0.joinStatusCur = Lobby.Actions.JOIN_STATUS.BEGIN
			f110_arg0.firstResultTime = Engine.milliseconds()
			f110_arg0.updateTime = Engine.milliseconds()
			f110_arg0.searchTime = Engine.milliseconds()
		end
		,
		pumpFuncPtr = function ( f111_arg0 )
			if f111_arg0.joinStatusCur == Lobby.Actions.JOIN_STATUS.BEGIN then
				local f111_local0 = Engine.milliseconds()
				if f111_local0 < f111_arg0.searchTime then
					return 
				elseif #f111_arg0.qosResultsValid == 0 and #f111_arg0.searchAction.filteredResult <= #f111_arg0.qosResultsInvalid then
					Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults::pumpFuncPtr, Not expecting any results to join, QoSJoinSearchResults failed.\n" )
					LobbyVM.ProcessCompleteFailure( {
						actionId = f111_arg0.actionId
					} )
					return 
				end
				local f111_local1 = false
				if f111_arg0.minInitialCount <= #f111_arg0.qosResultsValid then
					if f111_local0 - f111_arg0.firstResultTime > Dvar.qos_firstUpdateMS:get() then
						if f111_local0 - f111_arg0.updateTime > Dvar.qos_lastUpdateMS:get() then
							f111_local1 = true
						else
							Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, waiting for last update to settle.\n" )
						end
					else
						Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, waiting for first update to settle.\n" )
					end
				else
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, waiting for " .. f111_arg0.minInitialCount .. " initial results. Current: " .. #f111_arg0.qosResultsValid .. ".\n" )
				end
				if #f111_arg0.searchAction.filteredResult <= #f111_arg0.qosResultsInvalid + #f111_arg0.qosResultsValid then
					f111_local1 = true
				end
				if f111_local1 then
					local f111_local2 = function ( f112_arg0, f112_arg1 )
						if f112_arg0.priorityLow ~= f112_arg1.priorityLow then
							return not f112_arg0.priorityLow
						else
							local f112_local0 = math.floor( f112_arg0.latency / 25 )
							local f112_local1 = math.floor( f112_arg1.latency / 25 )
							if f112_local0 == f112_local1 then
								if f112_arg0.isMatchEndingSoon == f112_arg1.isMatchEndingSoon then
									return f112_arg0.numAvailableSlots < f112_arg1.numAvailableSlots
								else
									return f112_arg1.isMatchEndingSoon
								end
							else
								return f112_local0 < f112_local1
							end
						end
					end
					
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, num of initial results returned " .. #f111_arg0.qosResultsValid .. ".\n" )
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, begin join.\n" )
					Engine.LobbyJoinBegin( f111_arg0.actionId, f111_arg0.controller, f111_arg0.sourceLobbyType, f111_arg0.targetLobbyType )
					table.sort( f111_arg0.qosResultsValid, f111_local2 )
					for f111_local6, f111_local7 in ipairs( f111_arg0.qosResultsValid ) do
						Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Attempting to join xuid: " .. f111_local7.xuidstr .. ".\n" )
						f111_arg0.joiningNumHosts = f111_arg0.joiningNumHosts + 1
						LobbyVM.LobbyStatusUpdate( {
							searchStage = 3,
							joiningCurHost = f111_arg0.joiningCurHost,
							joiningNumHosts = f111_arg0.joiningNumHosts
						} )
						Engine.LobbyJoinAdd( f111_local7.xuid, f111_local7.gameSecurityId, f111_local7.gameSecurityKey, f111_local7.hostAddress )
						Lobby.Debug.SessionSQJJoinInitiate( f111_local7.xuid )
					end
					f111_arg0.joinStatusCur = Lobby.Actions.JOIN_STATUS.ADD
				end
			elseif f111_arg0.joinStatusCur == Lobby.Actions.JOIN_STATUS.ADD then
				if #f111_arg0.qosResultsValid < #f111_arg0.searchAction.filteredResult and Engine.milliseconds() - f111_arg0.firstResultTime < Dvar.qos_maxProbeWait:get() then
					return 
				end
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, finalize join.\n" )
				f111_arg0.joinStatusCur = Lobby.Actions.JOIN_STATUS.FINALIZE
				Engine.LobbyJoinFinalize()
			end
		end
		,
		updateFuncPtr = function ( f113_arg0, f113_arg1 )
			if f113_arg1.joinResult then
				Lobby.Debug.SessionSQJJoinResult( f113_arg1 )
				f113_arg0.joiningCurHost = math.min( f113_arg0.joiningCurHost + 1, f113_arg0.joiningNumHosts )
				LobbyVM.LobbyStatusUpdate( {
					searchStage = 3,
					joiningCurHost = f113_arg0.joiningCurHost,
					joiningNumHosts = f113_arg0.joiningNumHosts
				} )
				return 
			end
			Lobby.Debug.SessionSQJQoSResult( f113_arg1 )
			local f113_local0 = nil
			if f113_arg1.validResult == false then
				f113_local0 = {
					validResult = f113_arg1.validResult,
					xuid = f113_arg1.xuid,
					xuidstr = f113_arg1.xuidstr
				}
				f113_arg0.qosResultsInvalid[#f113_arg0.qosResultsInvalid + 1] = f113_local0
				LuaUtils.LogQoS( "invalid_qos", f113_local0 )
				return 
			end
			f113_local0 = {
				validResult = f113_arg1.validResult,
				xuid = f113_arg1.xuid,
				xuidstr = f113_arg1.xuidstr,
				gameSecurityId = f113_arg1.gameSecurityId,
				gameSecurityKey = f113_arg1.gameSecurityKey,
				hostAddress = f113_arg1.hostAddress,
				protocol = f113_arg1.protocol,
				isMP = f113_arg1.isMP,
				isMigrating = f113_arg1.isMigrating,
				numAvailableSlots = f113_arg1.numAvailableSlots,
				maxLocalPlayersAllowed = f113_arg1.maxLocalPlayersAllowed,
				allowGuests = f113_arg1.allowGuests,
				isMatchEndingSoon = f113_arg1.isMatchEndingSoon,
				isMatchLoading = f113_arg1.isMatchLoading,
				isDedicated = f113_arg1.isDedicated,
				hostXuid = f113_arg1.hostXuid,
				skill = f113_arg1.skill,
				largestParty = f113_arg1.largestParty,
				latency = f113_arg1.latency,
				minLatency = f113_arg1.minLatency,
				realAddr = f113_arg1.realAddr
			}
			if f113_arg1.numAvailableSlots <= 0 then
				table.insert( f113_arg0.qosResultsInvalid, f113_local0 )
				LuaUtils.LogQoS( "ignore_qos_full", f113_local0 )
				return 
			end
			local f113_local1 = f113_arg1.isDedicated
			if f113_local1 then
				f113_local1 = f113_arg1.largestParty == 0
			end
			if LuaUtils.IsArenaMode() and not f113_local1 and math.floor( math.abs( f113_local0.skill - Engine.GetArenaPoints( f109_arg0, Engine.GetCurrentArenaSlot() ) ) ) > Lobby.MatchmakingArena.GetArenaSkillRange( true ) then
				table.insert( f113_arg0.qosResultsInvalid, f113_local0 )
				LuaUtils.LogQoS( "ignore_qos_skill", f113_local0 )
				return 
			elseif f113_local0.isDedicated == true then
				if f113_local0.latency * 1000 > Dvar.lobbySearchDediUnparkPingLimit:get() then
					table.insert( f113_arg0.qosResultsInvalid, f113_local0 )
					LuaUtils.LogQoS( "ignore_qos_latency", f113_local0 )
					return 
				end
			elseif f113_local0.latency * 1000 > Dvar.qosMaxAllowedPing:get() then
				table.insert( f113_arg0.qosResultsInvalid, f113_local0 )
				LuaUtils.LogQoS( "ignore_qos_latency", f113_local0 )
				return 
			end
			LuaUtils.LogQoS( "valid_qos", f113_local0 )
			f113_arg0.updateTime = Engine.milliseconds()
			if #f113_arg0.qosResultsValid == 0 then
				f113_arg0.firstResultTime = f113_arg0.updateTime
			end
			f113_local0.priorityLow = Lobby.MatchmakingPriority.IsPriorityLow( f113_local0.gameSecurityId )
			f113_arg0.qosResultsValid[#f113_arg0.qosResultsValid + 1] = f113_local0
			LobbyVM.LobbyStatusUpdate( {
				searchStage = 2,
				numResults = #f113_arg0.searchAction.filteredResult,
				contactedResults = #f113_arg0.qosResultsValid
			} )
			if f113_arg0.joinStatusCur == Lobby.Actions.JOIN_STATUS.START then
				
			elseif f113_arg0.joinStatusCur == Lobby.Actions.JOIN_STATUS.ADD then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Attempting to join xuid: " .. f113_local0.xuidstr .. ".\n" )
				f113_arg0.joiningNumHosts = f113_arg0.joiningNumHosts + 1
				LobbyVM.LobbyStatusUpdate( {
					searchStage = 3,
					joiningCurHost = f113_arg0.joiningCurHost,
					joiningNumHosts = f113_arg0.joiningNumHosts
				} )
				Engine.LobbyJoinAdd( f113_local0.xuid, f113_local0.gameSecurityId, f113_local0.gameSecurityKey, f113_local0.hostAddress )
			elseif f113_arg0.joinStatusCur == Lobby.Actions.JOIN_STATUS.FINALIZE then
				
			else
				
			end
		end
		,
		endFuncPtr = function ( f114_arg0 )
			Engine.QoSCancelProbes()
			Engine.LobbyJoinErrorShutdown()
		end
		,
		cancelFuncPtr = function ( f115_arg0 )
			Engine.QoSCancelProbes()
			Engine.LobbyJoinErrorShutdown()
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f115_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.JoinSearchResults = function ( f116_arg0, f116_arg1 )
	return {
		name = "JoinSearchResults",
		controller = f116_arg0,
		searchAction = f116_arg1,
		sourceLobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		targetLobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		startFuncPtr = function ( f117_arg0 )
			local f117_local0 = f117_arg0.searchAction.filteredResult
			if f117_local0 == nil then
				error( "JoinSearchResults: self.searchAction.filteredResult should not be nil" )
				f117_local0 = {}
			end
			if #f117_local0 == 0 then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f117_arg0.actionId
				} )
				return 
			end
			Engine.LobbyJoinBegin( f117_arg0.actionId, f117_arg0.controller, f117_arg0.sourceLobbyType, f117_arg0.targetLobbyType )
			for f117_local4, f117_local5 in ipairs( f117_local0 ) do
				Engine.LobbyJoinAdd( f117_local5.xuid, f117_local5.gameSecurityId, f117_local5.gameSecurityKey, f117_local5.hostAddress )
			end
			Engine.LobbyJoinFinalize()
		end
		
	}
end

Lobby.Actions.AdvertiseLobby = function ( f118_arg0 )
	return {
		name = "AdvertiseLobby",
		onOff = f118_arg0,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		startFuncPtr = function ( f119_arg0 )
			Lobby.Matchmaking.SetupAdvertising()
			Engine.AdvertiseLobby( f119_arg0.actionId, f119_arg0.lobbyType, f119_arg0.onOff )
		end
		,
		errorFuncPtr = function ( f120_arg0 )
			local f120_local0 = ""
			local f120_local1 = ""
			if f120_arg0.onOff == true then
				errorMessage = Engine.Localize( "MENU_NO_SESSIONS" )
				f120_local1 = "Failed to turn on lobby advertising"
			else
				f120_local1 = "Failed to turn off lobby advertising"
			end
			if not Engine.IsDevelopmentBuild() then
				return errorMessage
			else
				return errorMessage .. "\n\nDEBUG INFO: AdvertiseLobby( " .. f120_local1 .. " )\n"
			end
		end
		
	}
end

Lobby.Actions.LobbyInfoProbe = function ( f121_arg0, f121_arg1 )
	return {
		name = "InfoProbe",
		controller = f121_arg0,
		info = f121_arg1,
		probeResult = nil,
		startFuncPtr = function ( f122_arg0 )
			Engine.LobbyInfoProbe( f122_arg0.actionId, f122_arg0.controller, f122_arg0.info.xuid )
		end
		,
		endFuncPtr = function ( f123_arg0 )
			f123_arg0.probeResult = f123_arg0.retData
			f123_arg0.probeResult.probedXuid = f123_arg0.info.xuid
		end
		
	}
end

Lobby.Actions.ShowFirstTimeFlowError = function ( f124_arg0 )
	return {
		name = "ErrorPopupMsg",
		info = f124_arg0,
		startFuncPtr = function ( f125_arg0 )
			local f125_local0 = nil
			if f125_arg0.info.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
				f125_local0 = Engine.Localize( "MPUI_MP_INTRO_REQUIRED_DESC" )
			elseif f125_arg0.info.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
				f125_local0 = Engine.Localize( "MENU_CP_FIRST_TIME_FLOW_REQUIRED_DESC" )
			else
				f125_local0 = Engine.Localize( "MENU_JOIN_RESULT_NOT_JOINABLE" )
			end
			LuaUtils.UI_ShowErrorMessageDialog( nil, f125_local0 )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f125_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.CheckFirstTimeFlowRequirements = function ( f126_arg0, f126_arg1 )
	return {
		name = "CheckfirstTimeFlow",
		controller = f126_arg0,
		info = f126_arg1,
		mainMode = nil,
		startFuncPtr = function ( f127_arg0 )
			if Dvar.livestats_skipFirstTime:get() then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f127_arg0.actionId
				} )
				return 
			end
			f127_arg0.mainMode = f127_arg0.info.probeResult.mainMode
			local f127_local0 = LuaUtils.LobbyMainModeToEModes( f127_arg0.info.probeResult.mainMode )
			if f127_local0 == nil or f127_local0 == Enum.eModes.MODE_ZOMBIES or Engine.IsCampaignModeZombies() or Engine.IsFirstTimeComplete( f126_arg0, f127_local0 ) then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f127_arg0.actionId
				} )
			else
				LobbyVM.ProcessCompleteError( {
					actionId = f127_arg0.actionId
				} )
			end
		end
		
	}
end

Lobby.Actions.JoinHost = function ( f128_arg0, f128_arg1, f128_arg2, f128_arg3, f128_arg4 )
	return {
		name = "LobbyJoinHost",
		controller = f128_arg0,
		mainMode = f128_arg1,
		networkMode = f128_arg2,
		hostXuid = f128_arg3,
		hostInfo = f128_arg4,
		joinResults = {},
		startFuncPtr = function ( f129_arg0 )
			if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
				Engine.JoinHost( f129_arg0.actionId, f129_arg0.controller, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyType.LOBBY_TYPE_GAME, f129_arg0.hostXuid, f129_arg0.hostInfo )
			else
				Engine.JoinHost( f129_arg0.actionId, f129_arg0.controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyType.LOBBY_TYPE_GAME, f129_arg0.hostXuid, f129_arg0.hostInfo )
			end
		end
		,
		updateFuncPtr = function ( f130_arg0, f130_arg1 )
			f130_arg0.joinResults[#f130_arg0.joinResults + 1] = f130_arg1
		end
		,
		errorFuncPtr = function ( f131_arg0 )
			local f131_local0 = Engine.Localize( "MENU_JOIN_RESULT_NOT_JOINABLE" )
			if f131_arg0.joinResult == nil and #f131_arg0.joinResults == 0 then
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

Lobby.Actions.LobbyJoinXUID = function ( f132_arg0, f132_arg1, f132_arg2 )
	return {
		name = "LobbyJoinXUID",
		controller = f132_arg0,
		info = f132_arg1,
		joinType = f132_arg2,
		joinResults = {},
		startFuncPtr = function ( f133_arg0 )
			Engine.JoinXUID( f133_arg0.actionId, f133_arg0.controller, f133_arg0.info.xuid, f133_arg0.joinType )
		end
		,
		updateFuncPtr = function ( f134_arg0, f134_arg1 )
			f134_arg0.joinResults[#f134_arg0.joinResults + 1] = f134_arg1
		end
		,
		endFuncPtr = function ( f135_arg0 )
			
		end
		,
		errorFuncPtr = function ( f136_arg0 )
			local f136_local0 = Engine.Localize( "MENU_JOIN_RESULT_NOT_JOINABLE" )
			if #f136_arg0.joinResults == 0 then
				return f136_local0
			else
				local f136_local1 = f136_arg0.joinResults[#f136_arg0.joinResults].joinResult
				local f136_local2 = LobbyVM.JoinResultToString( f136_local1, true )
				f136_local0 = Engine.Localize( f136_local2.errorMsg )
				if not Engine.IsDevelopmentBuild() then
					return f136_local0
				else
					return f136_local0 .. "\n\nDEBUG INFO: JoinResult( " .. tostring( f136_local1 ) .. " )\n" .. f136_local2.debug
				end
			end
		end
		
	}
end

Lobby.Actions.LobbyJoinXUIDExt = function ( f137_arg0, f137_arg1, f137_arg2, f137_arg3 )
	return {
		name = "LobbyJoinXUIDExt",
		controller = f137_arg0,
		joinType = f137_arg1,
		infoProbe = f137_arg2,
		destinationLobby = f137_arg3,
		joinResults = {},
		startFuncPtr = function ( f138_arg0 )
			local f138_local0 = f138_arg0.infoProbe.probeResult
			local f138_local1 = f138_local0.probedXuid
			local f138_local2 = f138_arg0.destinationLobby
			local f138_local3 = nil
			if f138_local2 == Enum.LobbyType.LOBBY_TYPE_COUNT then
				if f138_local0.gameLobby.isValid == true then
					f138_local2 = Enum.LobbyType.LOBBY_TYPE_GAME
					f138_local3 = f138_local0.gameLobby
				else
					f138_local2 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
					f138_local3 = f138_local0.privateLobby
				end
			elseif f138_local2 == Enum.LobbyType.LOBBY_TYPE_GAME then
				f138_local3 = f138_local0.gameLobby
			else
				f138_local3 = f138_local0.privateLobby
			end
			if Engine.JoinXUIDExt( f138_arg0.actionId, f138_arg0.controller, f138_local3.isValid, f138_local3.hostXuid, f138_local3.hostName, f138_local2, f138_local3.secId, f138_local3.secKey, f138_local3.serializedAdr, f138_arg0.joinType, f138_local1 ) == false then
				LobbyVM.ProcessCompleteError( {
					actionId = f138_arg0.actionId
				} )
			end
		end
		,
		updateFuncPtr = function ( f139_arg0, f139_arg1 )
			f139_arg0.joinResults[#f139_arg0.joinResults + 1] = f139_arg1
		end
		,
		endFuncPtr = function ( f140_arg0 )
			
		end
		,
		errorFuncPtr = function ( f141_arg0 )
			local f141_local0 = Enum.XONLINE_NAT_TYPE.XONLINE_NAT_OPEN
			if f141_arg0.infoProbe ~= nil and f141_arg0.infoProbe.probeResult ~= nil and f141_arg0.infoProbe.probeResult.natType ~= nil then
				f141_local0 = f141_arg0.infoProbe.probeResult.natType
			end
			local f141_local1 = LuaUtils.IsCompatibleNatConnection( f141_local0 )
			local f141_local2 = Engine.Localize( "MENU_JOIN_RESULT_NOT_JOINABLE" )
			if #f141_arg0.joinResults == 0 then
				if f141_local1 == false then
					f141_local2 = Engine.Localize( "MENU_JOIN_RESULT_NOT_JOINABLE_NAT_TYPE" )
				end
				return f141_local2
			end
			local f141_local3 = f141_arg0.joinResults[#f141_arg0.joinResults].joinResult
			local f141_local4 = LobbyVM.JoinResultToString( f141_local3, true )
			if f141_local1 == false and (f141_local3 == Enum.JoinResult.JOIN_RESULT_HANDSHAKE_WINDOW_EXPIRED or f141_local3 == Enum.JoinResult.JOIN_RESULT_INVALID) then
				f141_local2 = Engine.Localize( "MENU_JOIN_RESULT_NOT_JOINABLE_NAT_TYPE" )
			else
				f141_local2 = Engine.Localize( f141_local4.errorMsg )
			end
			if not Engine.IsDevelopmentBuild() then
				return f141_local2
			end
			return f141_local2 .. "\n\nDEBUG INFO: JoinResult( " .. tostring( f141_local3 ) .. " )\n" .. f141_local4.debug
		end
		
	}
end

Lobby.Actions.WaitForJoiningClients = function ( f142_arg0 )
	return {
		name = "WaitForJoiningClients",
		waitMilliseconds = f142_arg0,
		endWaitTime = nil,
		startFuncPtr = function ( f143_arg0 )
			f143_arg0.endWaitTime = f143_arg0.waitMilliseconds + Engine.milliseconds()
			local f143_local0 = Engine.LobbyJoinCount()
			if f143_local0 == 0 then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f143_arg0.actionId
				} )
			end
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "WaitForJoiningClients start, number of joining clients: " .. f143_local0 .. ". Waiting " .. f143_arg0.waitMilliseconds .. "ms for clients to join.\n" )
		end
		,
		pumpFuncPtr = function ( f144_arg0 )
			local f144_local0 = Engine.LobbyJoinCount()
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "WaitForJoiningClients pump, number of clients still joining: " .. f144_local0 .. ". Waiting for " .. f144_arg0.endWaitTime - Engine.milliseconds() .. "ms\n" )
			if f144_arg0.endWaitTime < Engine.milliseconds() then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "WaitForJoiningClients pump stop, number of clients still joining: " .. f144_local0 .. ". Clients took to long to join.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f144_arg0.actionId
				} )
				return 
			elseif f144_local0 == 0 then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "WaitForJoiningClients pump stop, All clients have joined.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f144_arg0.actionId
				} )
				return 
			else
				
			end
		end
		,
		cancelFuncPtr = function ( f145_arg0 )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f145_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.LobbySettings = function ( f146_arg0, f146_arg1, f146_arg2, f146_arg3 )
	return {
		name = "LobbySettings",
		controller = f146_arg0,
		toTarget = f146_arg1,
		skipSwitchMode = f146_arg2,
		isDevMap = f146_arg3,
		startFuncPtr = function ( f147_arg0 )
			LobbyVM.LobbySettings( {
				controller = f146_arg0,
				toTarget = f146_arg1,
				skipSwitchMode = f146_arg2,
				isDevMap = f146_arg3
			} )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f147_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.SetQueueCancellable = function ( f148_arg0 )
	return {
		name = "SetQueueCancellable",
		startFuncPtr = function ( f149_arg0 )
			Lobby.ProcessQueue.SetCancellable( f148_arg0 )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f149_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.UpdateUI = function ( f150_arg0, f150_arg1 )
	return {
		name = "UpdateUI",
		require = "LobbySettings",
		controller = f150_arg0,
		toTarget = f150_arg1,
		startFuncPtr = function ( f151_arg0 )
			LobbyVM.UpdateUI( {
				controller = f150_arg0,
				toTarget = f150_arg1
			} )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f151_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.SetNetworkMode = function ( f152_arg0, f152_arg1 )
	return {
		name = "SetNetworkMode",
		controller = f152_arg0,
		networkMode = f152_arg1,
		startFuncPtr = function ( f153_arg0 )
			Engine.SetLobbyNetworkMode( f153_arg0.networkMode )
			Engine.Exec( f153_arg0.controller, "savegameRestore" )
			Engine.ExecNow( f153_arg0.controller, "invalidateEmblemComponent" )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f153_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.PromoteToHostDone = function ( f154_arg0, f154_arg1, f154_arg2, f154_arg3 )
	return {
		name = "promoteToHostDone",
		controller = f154_arg0,
		lobbyType = f154_arg1,
		migrateIndexBits = f154_arg2,
		isInGame = f154_arg3,
		startFuncPtr = function ( f155_arg0 )
			Engine.LobbyHostMigrateSetIndexBits( f155_arg0.lobbyType, f155_arg0.migrateIndexBits )
			Engine.Exec( f155_arg0.controller, "lobby_setmap " .. Dvar.ui_mapname:get() )
			Engine.Exec( f155_arg0.controller, "lobby_setgametype " .. Dvar.ui_gametype:get() )
			Engine.PromoteToHostDone( f155_arg0.controller, f155_arg0.lobbyType, f155_arg0.isInGame )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f155_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.SignUserInToLive = function ( f156_arg0 )
	return {
		name = "SignUserInToLive",
		controller = f156_arg0,
		startFuncPtr = function ( f157_arg0 )
			Engine.SignUserIntoLive( f157_arg0.controller )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f157_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.SignUserOutOfLive = function ( f158_arg0, f158_arg1 )
	return {
		name = "SignUserOutOfLive",
		controller = f158_arg0,
		networkMode = f158_arg1,
		startFuncPtr = function ( f159_arg0 )
			Engine.SignUserOutOfLive( f159_arg0.controller )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f159_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.PlatformSessionGetSessionInfo = function ( f160_arg0, f160_arg1, f160_arg2 )
	return {
		name = "PlatformSessionGetSessionInfo",
		controller = f160_arg0,
		lobbyType = f160_arg1,
		sessionId = f160_arg2,
		info = {},
		gamertag = nil,
		gamertags = nil,
		startFuncPtr = function ( f161_arg0 )
			if Lobby.Platform.PlatformSessionOrbisEnabled() == false or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f161_arg0.actionId
				} )
				return 
			elseif Engine.PlatformSessionPS4GetSessionInfo( f161_arg0.actionId, f161_arg0.controller, f161_arg0.lobbyType, f161_arg0.sessionId ) == false then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f161_arg0.actionId
				} )
				return 
			else
				
			end
		end
		,
		endFuncPtr = function ( f162_arg0 )
			if Lobby.Platform.PlatformSessionOrbisEnabled() == false or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
				return 
			elseif f162_arg0.retData.isError == true then
				return 
			end
			f162_arg0.info = {
				sessionId = f162_arg0.retData.sessionId,
				sessionName = f162_arg0.retData.sessionName,
				sessionStatus = f162_arg0.retData.sessionStatus,
				sessionType = f162_arg0.retData.sessionType,
				sessionPrivacy = f162_arg0.retData.sessionPrivacy,
				locked = f162_arg0.retData.locked,
				maxSlots = f162_arg0.retData.maxSlots,
				creationTime = f162_arg0.retData.creationTime,
				sessionCreatorGamertag = f162_arg0.retData.sessionCreatorGamertag,
				sessionCreatorPlatform = f162_arg0.retData.sessionCreatorPlatform,
				members = f162_arg0.retData.members
			}
			if f162_arg0.info.members ~= nil and #f162_arg0.info.members > 0 then
				f162_arg0.gamertag = f162_arg0.info.members[#f162_arg0.info.members].gamertag
				f162_arg0.gamertags = {}
				for f162_local0 = 1, #f162_arg0.info.members, 1 do
					f162_arg0.gamertags[f162_local0] = f162_arg0.info.members[f162_local0].gamertag
				end
			end
		end
		
	}
end

Lobby.Actions.PlatformSessionGetInviteInfo = function ( f163_arg0, f163_arg1, f163_arg2, f163_arg3 )
	return {
		name = "PlatformSessionGetInviteInfo",
		controller = f163_arg0,
		lobbyType = f163_arg2,
		invitationId = f163_arg3,
		xuid = f163_arg1,
		info = {},
		gamertag = nil,
		gamertags = nil,
		startFuncPtr = function ( f164_arg0 )
			if Lobby.Platform.PlatformSessionOrbisEnabled() == false or Engine.IsDemonwareFetchingDone( f163_arg0 ) == false then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f164_arg0.actionId
				} )
				return 
			elseif Engine.PlatformSessionPS4GetInviteInfo( f164_arg0.actionId, f164_arg0.controller, f164_arg0.xuid, f164_arg0.lobbyType, f164_arg0.invitationId ) == false then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f164_arg0.actionId
				} )
				return 
			else
				
			end
		end
		,
		endFuncPtr = function ( f165_arg0 )
			if Lobby.Platform.PlatformSessionOrbisEnabled() == false or Engine.IsDemonwareFetchingDone( f165_arg0.controller ) == false then
				return 
			elseif f165_arg0.retData.isError == true then
				return 
			else
				f165_arg0.info.receivedDate = f165_arg0.retData.receivedDate
				f165_arg0.info.usedFlag = f165_arg0.retData.usedFlag
				f165_arg0.info.expired = f165_arg0.retData.expired
				f165_arg0.info.message = f165_arg0.retData.message
				f165_arg0.info.fromGamertag = f165_arg0.retData.fromGamertag
				f165_arg0.info.invitationId = f165_arg0.retData.invitationId
				f165_arg0.info.sessionId = f165_arg0.retData.sessionId
				f165_arg0.gamertag = f165_arg0.retData.fromGamertag
				f165_arg0.gamertags = {}
				f165_arg0.gamertags[1] = f165_arg0.gamertag
			end
		end
		
	}
end

Lobby.Actions.GamertagsToXuids = function ( f166_arg0, f166_arg1 )
	return {
		name = "PlatformSessionJoin",
		controller = f166_arg0,
		info = f166_arg1,
		startFuncPtr = function ( f167_arg0 )
			if f166_arg1.gamertags == nil or #f166_arg1.gamertags == 0 then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f167_arg0.actionId
				} )
				return 
			elseif Engine.GamertagsToXuids( f167_arg0.actionId, f167_arg0.controller, f167_arg0.info.gamertags ) == false then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f167_arg0.actionId
				} )
				return 
			else
				
			end
		end
		,
		endFuncPtr = function ( f168_arg0 )
			if f168_arg0.retData.isError == true then
				return 
			elseif f168_arg0.retData.userInfo == nil or #f168_arg0.retData.userInfo == 0 then
				f168_arg0.gamertag = ""
				f168_arg0.xuid = 0
				return 
			else
				f168_arg0.gamertag = f168_arg0.retData.userInfo[1].gamertag
				f168_arg0.xuid = f168_arg0.retData.userInfo[1].xuid
			end
		end
		
	}
end

Lobby.Actions.SetGameAndTypeMapName = function ( f169_arg0, f169_arg1, f169_arg2, f169_arg3 )
	return {
		name = "SetGameAndTypeMapName",
		controller = f169_arg0,
		gameType = f169_arg2,
		mapName = f169_arg3,
		startFuncPtr = function ( f170_arg0 )
			Engine.Exec( f170_arg0.controller, "lobby_setmap " .. f170_arg0.mapName )
			Engine.Exec( f170_arg0.controller, "lobby_setgametype " .. f170_arg0.gameType )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f170_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.SetSavedOrDefaultMap = function ( f171_arg0, f171_arg1 )
	return {
		name = "SetSavedOrDefaultMap",
		controller = f171_arg0,
		startFuncPtr = function ( f172_arg0 )
			if Engine.IsCampaignGame() then
				local f172_local0 = Engine.GetSavedMap()
				if string.len( f172_local0 ) == 0 then
					f172_local0 = LuaUtils.GetDefaultMap( f171_arg1 )
				end
				Dvar.ui_mapname:set( f172_local0 )
				Dvar.cp_queued_level:set( Engine.GetSavedMapQueuedMap() )
				Engine.GameLobbySetMap( f172_local0 )
			end
			if f171_arg1 == LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME and Engine.LobbyHost_SetOfficialCustomGame then
				Engine.LobbyHost_SetOfficialCustomGame( true )
			end
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f172_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.PlayTogetherBeginPlayWait = function ( f173_arg0 )
	return {
		name = "PlayTogetherBeginPlayWait",
		controller = f173_arg0,
		startFuncPtr = function ( f174_arg0 )
			
		end
		,
		pumpFuncPtr = function ( f175_arg0, f175_arg1 )
			if Engine.GetLobbyUIScreen() == LobbyData.UITargets.UI_MODESELECT.id then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f175_arg0.actionId
				} )
				return 
			elseif Engine.GetModel( Engine.GetModelForController( f175_arg0.controller ), "SystemOverlay_MessageDialog.buttonPrompts" ) ~= nil then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f175_arg0.actionId
				} )
			end
		end
		,
		cancelFuncPtr = function ( f176_arg0 )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f176_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.PlayTogetherPSNSessionWait = function ( f177_arg0, f177_arg1 )
	return {
		name = "PlayTogetherPSNSessionWait( old session id: " .. f177_arg1 .. ")",
		nonPSNSessionBlocking = true,
		controller = f177_arg0,
		oldSessionId = f177_arg1,
		startFuncPtr = function ( f178_arg0 )
			
		end
		,
		pumpFuncPtr = function ( f179_arg0, f179_arg1 )
			if Lobby.Platform.PS4.taskInProgress == true then
				return 
			else
				local f179_local0 = Lobby.Platform.PS4GetSessionId( f177_arg0 )
				if string.len( f179_local0 ) > 0 and f179_arg0.oldSessionId ~= f179_local0 then
					LobbyVM.ProcessCompleteSuccess( {
						actionId = f179_arg0.actionId
					} )
					return 
				else
					
				end
			end
		end
		,
		cancelFuncPtr = function ( f180_arg0 )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f180_arg0.actionId
			} )
		end
		
	}
end

