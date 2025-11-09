require( "lua.Lobby.Common.LobbyCore" )

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
Lobby.Actions.ExecuteScript = function ( f7_arg0 )
	return {
		name = "ExecuteScript",
		inlineFunction = f7_arg0,
		startFuncPtr = function ( f8_arg0 )
			f8_arg0.inlineFunction()
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f8_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.ExecuteScriptWithReturn = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
	return {
		name = "ExecuteScript",
		inlineFunction = f9_arg0,
		startFuncPtr = function ( f10_arg0 )
			local f10_local0 = f10_arg0.inlineFunction()
			if f10_local0 == f9_arg1 then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f10_arg0.actionId
				} )
				return 
			elseif f10_local0 == f9_arg2 then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f10_arg0.actionId
				} )
				return 
			elseif f10_local0 == f9_arg3 then
				LobbyVM.ProcessCompleteError( {
					actionId = f10_arg0.actionId
				} )
				return 
			else
				LobbyVM.ProcessCompleteError( {
					actionId = f10_arg0.actionId
				} )
			end
		end
		
	}
end

Lobby.Actions.LuiEvent = function ( f11_arg0, f11_arg1 )
	return {
		name = "LuiEvent: " .. f11_arg0,
		event = f11_arg0,
		data = f11_arg1,
		startFuncPtr = function ( f12_arg0 )
			f12_arg0.data.actionId = f12_arg0.actionId
			Engine.LuiVM_Event( f12_arg0.event, f12_arg0.data )
		end
		
	}
end

Lobby.Actions.LobbyVMCall = function ( f13_arg0, f13_arg1 )
	return {
		name = "LobbyVMCall",
		lobbyVMFunc = f13_arg0,
		data = f13_arg1,
		startFuncPtr = function ( f14_arg0 )
			f14_arg0.lobbyVMFunc( f14_arg0.data )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f14_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.LobbyVMCallRetVal = function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3, f15_arg4 )
	return {
		name = "LobbyVMCallRetVal",
		lobbyVMFunc = f15_arg0,
		data = f15_arg1,
		successVal = f15_arg2,
		failureVal = f15_arg3,
		errorVal = f15_arg4,
		startFuncPtr = function ( f16_arg0 )
			local f16_local0 = f16_arg0.lobbyVMFunc( f16_arg0.data )
			if f16_local0 == f16_arg0.successVal then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f16_arg0.actionId
				} )
				return 
			elseif f16_local0 == f16_arg0.failureVal then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f16_arg0.actionId
				} )
				return 
			elseif f16_local0 == f16_arg0.errorVal then
				LobbyVM.ProcessCompleteError( {
					actionId = f16_arg0.actionId
				} )
				return 
			else
				LobbyVM.ProcessCompleteError( {
					actionId = f16_arg0.actionId
				} )
			end
		end
		
	}
end

Lobby.Actions.TimeDelay = function ( f17_arg0 )
	return {
		name = "TimeDelay(" .. f17_arg0 .. "ms)",
		timeDelayMilliseconds = f17_arg0,
		endTime = nil,
		startFuncPtr = function ( f18_arg0 )
			if f18_arg0.timeDelayMilliseconds == 0 then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f18_arg0.actionId
				} )
				return 
			else
				f18_arg0.endTime = f18_arg0.timeDelayMilliseconds + Engine.milliseconds()
			end
		end
		,
		pumpFuncPtr = function ( f19_arg0, f19_arg1 )
			if f19_arg0.endTime < Engine.milliseconds() then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f19_arg0.actionId
				} )
				return 
			else
				
			end
		end
		,
		cancelFuncPtr = function ( f20_arg0 )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f20_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.OpenSpinner = function ( f21_arg0 )
	return {
		name = "OpenSpinner",
		showCancelButton = f21_arg0,
		startFuncPtr = function ( f22_arg0 )
			if f22_arg0.showCancelButton == nil then
				f22_arg0.showCancelButton = false
			end
			Engine.LuiVM_Event( "lobby_spinner_popup", {
				openPopup = true,
				showCancelButton = f22_arg0.showCancelButton,
				immediate = true
			} )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f22_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.CloseSpinner = function ()
	return {
		name = "CloseSpinner",
		startFuncPtr = function ( f24_arg0 )
			Engine.LuiVM_Event( "lobby_spinner_popup", {
				openPopup = false,
				actionId = f24_arg0.actionId
			} )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f24_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.ConnectingToDemonware = function ( f25_arg0, f25_arg1 )
	return {
		name = "ConnectingToDemonware(check for " .. f25_arg1 .. "ms)",
		controller = f25_arg0,
		waitMilliseconds = f25_arg1,
		endTime = nil,
		checkInterval = 100,
		checkTime = nil,
		startFuncPtr = function ( f26_arg0 )
			if f26_arg0.waitMilliseconds == 0 and Engine.IsDemonwareFetchingDone( f26_arg0.controller ) then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f26_arg0.actionId
				} )
				return 
			elseif Engine.GetLobbyUIScreen() == LobbyData.UITargets.UI_MAIN.id then
				Engine.SetLobbyNetworkMode( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
			end
			Engine.LiveConnectEnableDemonwareConnect()
			f26_arg0.endTime = f26_arg0.waitMilliseconds + Engine.milliseconds()
			f26_arg0.checkTime = f26_arg0.checkInterval + Engine.milliseconds()
		end
		,
		pumpFuncPtr = function ( f27_arg0, f27_arg1 )
			if f27_arg0.checkTime > Engine.milliseconds() then
				return 
			else
				f27_arg0.checkTime = f27_arg0.checkInterval + Engine.milliseconds()
				if Engine.IsDemonwareFetchingDone( f27_arg0.controller ) == true then
					LobbyVM.ProcessCompleteSuccess( {
						actionId = f27_arg0.actionId
					} )
					return 
				elseif f27_arg0.endTime < Engine.milliseconds() then
					LobbyVM.ProcessCompleteFailure( {
						actionId = f27_arg0.actionId
					} )
					return 
				else
					
				end
			end
		end
		,
		cancelFuncPtr = function ( f28_arg0 )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f28_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.IsButtonPressed = function ( f29_arg0, f29_arg1 )
	return {
		name = "IsButtonPressed",
		controller = f29_arg0,
		button = f29_arg1,
		startFuncPtr = function ( f30_arg0 )
			if not Engine.IsDevelopmentBuild() then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f30_arg0.actionId
				} )
				return 
			elseif Engine.IsButtonPressed( f30_arg0.controller, f30_arg0.button ) then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f30_arg0.actionId
				} )
				return 
			else
				LobbyVM.ProcessCompleteFailure( {
					actionId = f30_arg0.actionId
				} )
			end
		end
		
	}
end

Lobby.Actions.IsDvarSet = function ( f31_arg0, f31_arg1 )
	return {
		name = "IsDvarSet(dvar: " .. f31_arg0 .. ", check for value: " .. tostring( f31_arg1 ) .. ")",
		dvarName = f31_arg0,
		dvarValue = f31_arg1,
		startFuncPtr = function ( f32_arg0 )
			local f32_local0 = f32_arg0.dvarName
			local f32_local1 = f32_arg0.dvarValue
			local f32_local2 = Engine.GetDvarType( f32_local0 )
			local f32_local3 = false
			if f32_local2 == Enum.dvarType_t.DVAR_TYPE_INVALID then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f32_arg0.actionId
				} )
			elseif f32_local2 == Enum.dvarType_t.DVAR_TYPE_BOOL then
				f32_local3 = f32_local1 == Engine.DvarBool( 0, f32_local0 )
			elseif f32_local2 == Enum.dvarType_t.DVAR_TYPE_FLOAT then
				f32_local3 = f32_local1 == Engine.DvarFloat( f32_local0 )
			elseif f32_local2 == Enum.dvarType_t.DVAR_TYPE_INT then
				f32_local3 = f32_local1 == Engine.DvarInt( 0, f32_local0 )
			elseif f32_local2 == Enum.dvarType_t.DVAR_TYPE_STRING then
				f32_local3 = f32_local1 == Engine.DvarString( 0, f32_local0 )
			end
			if f32_local3 then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f32_arg0.actionId
				} )
				return 
			else
				LobbyVM.ProcessCompleteFailure( {
					actionId = f32_arg0.actionId
				} )
			end
		end
		
	}
end

Lobby.Actions.ErrorPopupMsg = function ( f33_arg0 )
	return {
		name = "ErrorPopupMsg",
		message = f33_arg0,
		startFuncPtr = function ( f34_arg0 )
			LuaUtils.UI_ShowErrorMessageDialog( nil, f34_arg0.message )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f34_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.ErrorPopup = function ( f35_arg0 )
	if f35_arg0.errorFuncPtr == nil then
		error( "Lobby.Actions.ErrorPopup: An action: " .. f35_arg0.name .. " with no errorFuncPtr has been used." )
	end
	return {
		name = "ErrorPopup: " .. f35_arg0.name,
		actionRef = f35_arg0,
		startFuncPtr = function ( f36_arg0 )
			local f36_local0 = "UNHANDLED ERROR OCCURRED (" .. f35_arg0.name .. " action)"
			if f35_arg0.errorFuncPtr ~= nil then
				f36_local0 = f36_arg0.actionRef:errorFuncPtr()
			end
			LuaUtils.UI_ShowErrorMessageDialog( nil, f36_local0 )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f36_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.ConnectToDW = function ( f37_arg0 )
	return {
		name = "ConnectToDW",
		controller = f37_arg0,
		startFuncPtr = function ( f38_arg0 )
			
		end
		
	}
end

Lobby.Actions.RunPlaylistSettings = function ( f39_arg0 )
	return {
		name = "RunPlaylistSettings",
		require = "LobbySettings",
		controller = f39_arg0,
		startFuncPtr = function ( f40_arg0 )
			Engine.RunPlaylistSettings( f40_arg0.controller )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f40_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.SwitchMode = function ( f41_arg0, f41_arg1 )
	return {
		name = "SwitchMode",
		controller = f41_arg0,
		toMode = f41_arg1,
		startFuncPtr = function ( f42_arg0 )
			Engine.SwitchMode( f42_arg0.controller, f42_arg0.toMode )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f42_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.SwitchCampaignMode = function ( f43_arg0, f43_arg1 )
	return {
		name = "SwitchCampaignMode",
		controller = f43_arg0,
		toMode = f43_arg1,
		startFuncPtr = function ( f44_arg0 )
			Engine.SwitchCampaignMode( f44_arg0.toMode )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f44_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.ForceLobbyUIScreen = function ( f45_arg0, f45_arg1 )
	return {
		name = "ForceLobbyUIScreen",
		controller = f45_arg0,
		screenId = f45_arg1,
		startFuncPtr = function ( f46_arg0 )
			Engine.ForceLobbyUIScreen( f46_arg0.screenId )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f46_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.LobbyHostStart = function ( f47_arg0, f47_arg1, f47_arg2, f47_arg3, f47_arg4 )
	return {
		name = "LobbyHostStart",
		controller = f47_arg0,
		mainMode = f47_arg1,
		lobbyType = f47_arg2,
		lobbyMode = f47_arg3,
		maxClients = f47_arg4,
		startFuncPtr = function ( f48_arg0 )
			Engine.LobbyHostStart( f48_arg0.actionId, f48_arg0.controller, f48_arg0.mainMode, f48_arg0.lobbyType, f48_arg0.lobbyMode, f48_arg0.maxClients )
		end
		,
		errorFuncPtr = function ( f49_arg0 )
			return "Failed to host a lobby"
		end
		
	}
end

Lobby.Actions.LobbyHostStartMigratedInfo = function ( f50_arg0, f50_arg1, f50_arg2, f50_arg3, f50_arg4, f50_arg5 )
	return {
		name = "LobbyHostStartMigrate",
		controller = f50_arg0,
		mainMode = f50_arg1,
		lobbyType = f50_arg2,
		lobbyMode = f50_arg3,
		maxClients = f50_arg4,
		hostInfo = f50_arg5,
		startFuncPtr = function ( f51_arg0 )
			Engine.LobbyHostStart( f51_arg0.actionId, f51_arg0.controller, f51_arg0.mainMode, f51_arg0.lobbyType, f51_arg0.lobbyMode, f51_arg0.maxClients, f51_arg0.hostInfo )
		end
		
	}
end

Lobby.Actions.LobbyHostEnd = function ( f52_arg0 )
	return {
		name = "LobbyHostEnd",
		lobbyType = f52_arg0,
		startFuncPtr = function ( f53_arg0 )
			Engine.LobbyHostEnd( f53_arg0.actionId, f53_arg0.lobbyType )
		end
		,
		errorFuncPtr = function ( f54_arg0 )
			return "Failed to end lobby"
		end
		
	}
end

Lobby.Actions.LobbyHostAddPrimary = function ( f55_arg0 )
	return {
		name = "LobbyHostAddPrimary",
		lobbyType = f55_arg0,
		startFuncPtr = function ( f56_arg0 )
			Engine.LobbyHostAddPrimary( f56_arg0.actionId, f56_arg0.lobbyType )
		end
		
	}
end

Lobby.Actions.LobbyHostAddLocal = function ( f57_arg0, f57_arg1 )
	return {
		name = "LobbyHostAddLocal",
		controller = f57_arg0,
		lobbyType = f57_arg1,
		startFuncPtr = function ( f58_arg0 )
			Engine.LobbyHostAddLocal( f58_arg0.actionId, f58_arg0.controller, f58_arg0.lobbyType )
		end
		
	}
end

Lobby.Actions.LobbyClientStart = function ( f59_arg0 )
	return {
		name = "LobbyClientStart",
		lobbyType = f59_arg0,
		startFuncPtr = function ( f60_arg0 )
			Engine.LobbyClientStart( f60_arg0.actionId, f60_arg0.lobbyType )
		end
		
	}
end

Lobby.Actions.LobbyClientEnd = function ( f61_arg0 )
	return {
		name = "LobbyClientEnd",
		lobbyType = f61_arg0,
		startFuncPtr = function ( f62_arg0 )
			Engine.LobbyClientEnd( f62_arg0.actionId, f62_arg0.lobbyType )
		end
		
	}
end

Lobby.Actions.LobbyLocalClientLeave = function ( f63_arg0, f63_arg1 )
	return {
		name = "LobbyClientEnd",
		lobbyType = f63_arg0,
		controller = f63_arg1,
		startFuncPtr = function ( f64_arg0 )
			Engine.LobbyLocalClientLeave( f64_arg0.actionId, f64_arg0.lobbyType, f64_arg0.controller )
		end
		
	}
end

Lobby.Actions.LeaveWithParty = function ( f65_arg0 )
	return {
		name = "LeaveWithParty(wait for " .. f65_arg0 .. "ms)",
		waitMilliseconds = f65_arg0,
		endTime = nil,
		checkInterval = 50,
		checkTime = nil,
		startFuncPtr = function ( f66_arg0 )
			if Engine.InLobbyParty( Enum.LobbyType.LOBBY_TYPE_GAME ) == false then
				Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: " .. f66_arg0.name .. ", we a loner in a private party, time to split, sweet!\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f66_arg0.actionId
				} )
				return 
			elseif Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) == false then
				Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: " .. f66_arg0.name .. ", we are not the host of our private party.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f66_arg0.actionId
				} )
				return 
			end
			local f66_local0 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			if f66_local0 == 1 or f66_local0 == Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f66_arg0.actionId
				} )
				return 
			elseif Engine.LeaveWithParty() == false then
				Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: " .. f66_arg0.name .. ", failed to tell party members to leave, we failed but we should leave anyway.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f66_arg0.actionId
				} )
				return 
			elseif Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) == false then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: " .. f66_arg0.name .. ", we are not the host of the game lobby, it is safe to leave now.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f66_arg0.actionId
				} )
			end
			f66_arg0.endTime = f66_arg0.waitMilliseconds + Engine.milliseconds()
			f66_arg0.checkTime = f66_arg0.checkInterval + Engine.milliseconds()
		end
		,
		pumpFuncPtr = function ( f67_arg0, f67_arg1 )
			if f67_arg0.checkTime > Engine.milliseconds() then
				return 
			end
			f67_arg0.checkTime = f67_arg0.checkInterval + Engine.milliseconds()
			local f67_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			local f67_local1 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
			local f67_local2 = false
			for f67_local9, f67_local10 in ipairs( f67_local0.sessionClients ) do
				for f67_local6, f67_local7 in ipairs( f67_local1.sessionClients ) do
					if f67_local10.isHost == false and Engine.CompareUInt64( f67_local10.xuid, f67_local7.xuid, "=" ) then
						f67_local2 = true
					end
				end
			end
			if f67_local2 == false then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: " .. f67_arg0.name .. ", all clients have left the game lobby, we can now leave.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f67_arg0.actionId
				} )
				return 
			elseif f67_arg0.endTime < Engine.milliseconds() then
				Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: " .. f67_arg0.name .. ", not all clients have left the game lobby, time to move on.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f67_arg0.actionId
				} )
				return 
			else
				
			end
		end
		,
		cancelFuncPtr = function ( f68_arg0 )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f68_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.LobbyInRecovery = function ()
	return {
		name = "LobbyInRecovery",
		startFuncPtr = function ( f70_arg0 )
			if Engine.LobbyInRecovery then
				Engine.LobbyInRecovery()
			end
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f70_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.CanHostServer = function ( f71_arg0, f71_arg1 )
	return {
		name = "CanHostServer",
		controller = f71_arg0,
		fromTargetLobbyType = f71_arg1,
		failureReason = nil,
		startFuncPtr = function ( f72_arg0 )
			local f72_local0, f72_local1 = Engine.CanHostServer( f72_arg0.controller, Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME ) )
			if f72_local0 == true then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Can host server.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f72_arg0.actionId
				} )
				return 
			end
			f72_arg0.failureReason = f72_local1
			local f72_local2 = "HOST_SERVER_UNKNOWN"
			if f72_local1 == Enum.HostServer.HOST_SERVER_BANDWIDTH_TEST_IN_PROGRESS then
				f72_local2 = "HOST_SERVER_BANDWIDTH_TEST_IN_PROGRESS"
			elseif f72_local1 == Enum.HostServer.HOST_SERVER_NOT_HOST_OF_PARTY then
				f72_local2 = "HOST_SERVER_NOT_HOST_OF_PARTY"
			elseif f72_local1 == Enum.HostServer.HOST_SERVER_DEDICATED_ONLY then
				f72_local2 = "HOST_SERVER_DEDICATED_ONLY"
			elseif f72_local1 == Enum.HostServer.HOST_SERVER_NAT_TYPE_NOT_ALLOWED then
				f72_local2 = "HOST_SERVER_NAT_TYPE_NOT_ALLOWED"
			elseif f72_local1 == Enum.HostServer.HOST_SERVER_WE_SHOULD_NOT_HOST then
				f72_local2 = "HOST_SERVER_WE_SHOULD_NOT_HOST"
			elseif f72_local1 == Enum.HostServer.HOST_SERVER_IS_NOT_GOOD_CITIZEN then
				f72_local2 = "HOST_SERVER_IS_NOT_GOOD_CITIZEN"
			elseif f72_local1 == Enum.HostServer.HOST_SERVER_HAS_NOT_NECESSARY_BANDWIDTH then
				f72_local2 = "HOST_SERVER_HAS_NOT_NECESSARY_BANDWIDTH"
			elseif f72_local1 == Enum.HostServer.HOST_SERVER_NET_ENGINE_NOT_STARTED then
				f72_local2 = "HOST_SERVER_NET_ENGINE_NOT_STARTED"
			elseif f72_local1 == Enum.HostServer.HOST_SERVER_LIVE_STREAMING then
				f72_local2 = "HOST_SERVER_LIVE_STREAMING"
			elseif f72_local1 == Enum.HostServer.HOST_SERVER_BANNED_FROM_HOSTING then
				f72_local2 = "HOST_SERVER_BANNED_FROM_HOSTING"
			end
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "CANNOT HOST A SERVER: " .. f72_local2 .. ".\n" )
			LobbyVM.ProcessCompleteFailure( {
				actionId = f72_arg0.actionId
			} )
		end
		
	}
end

function GeoMinCheck( f73_arg0, f73_arg1 )
	if not Dvar.lobbySearchGeoMin:exists() then
		return true
	end
	local f73_local0 = Dvar.lobbySearchGeoMin:get()
	if f73_local0 == 0 then
		return true
	end
	local f73_local1 = 0
	if f73_arg0.geo_1 == f73_arg1.geo_1 then
		f73_local1 = f73_local1 + 1
		if f73_arg0.geo_2 == f73_arg1.geo_2 then
			f73_local1 = f73_local1 + 1
			if f73_arg0.geo_3 == f73_arg1.geo_3 then
				f73_local1 = f73_local1 + 1
				if f73_arg0.geo_4 == f73_arg1.geo_4 then
					f73_local1 = f73_local1 + 1
				end
			end
		end
	end
	return f73_local0 <= f73_local1
end

Lobby.Actions.SearchForLobby = function ( f74_arg0 )
	return {
		name = "LobbySearch",
		controller = f74_arg0,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		filteredResult = {},
		startFuncPtr = function ( f75_arg0 )
			Lobby.Matchmaking.SetupMatchmakingStage( f75_arg0.controller )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "SearchForLobby, begin search.\n" )
			LobbyVM.LobbyStatusUpdate( {
				searchStage = 1,
				numResults = 50
			} )
			Engine.SearchForLobby( f75_arg0.actionId, f75_arg0.lobbyType )
		end
		,
		endFuncPtr = function ( f76_arg0 )
			LuaUtils.LogQoS( "search_query", Engine.GetSearchQuery() )
			local f76_local0 = Engine.GetSearchResults( f76_arg0.lobbyType )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "SearchForLobby, number of results found " .. f76_local0.numResults .. ".\n" )
			local f76_local1 = f76_local0.errorCode
			local f76_local2 = f76_local0.numResults
			Lobby.Debug.SessionSQJSearchResults( f76_local0 )
			if f76_local2 == 0 then
				LobbyVM.LobbyStatusUpdate( {
					searchStage = 1,
					numResults = 0
				} )
				return 
			end
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------SEARCH RESULTS----------------------------\n" )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "xuid, gameSecurityId, gameType, maxPlayers, numPlayers, serverType, showInMatchmaking, netcodeVersion, mapPacks, playlistVersion, playlistNumber, isEmpty, teamSizeMax, skill, geo_1, geo_2, geo_3, geo_4\n" )
			for f76_local6, f76_local7 in ipairs( f76_local0.remoteHosts ) do
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, Engine.UInt64ToString( f76_local7.xuid ) .. ", " .. Engine.UInt64ToString( f76_local7.gameSecurityId ) .. ", " .. f76_local7.gameType .. ", " .. f76_local7.maxPlayers .. ", " .. f76_local7.numPlayers .. ", " .. f76_local7.serverType .. ", " .. f76_local7.showInMatchmaking .. ", " .. f76_local7.netcodeVersion .. ", " .. f76_local7.mapPacks .. ", " .. f76_local7.playlistVersion .. ", " .. f76_local7.playlistNumber .. ", " .. f76_local7.isEmpty .. ", " .. f76_local7.teamSizeMax .. ", " .. f76_local7.skill .. ", " .. f76_local7.serverLocation .. ", " .. f76_local7.latencyBand .. ", " .. f76_local7.geo_1 .. ", " .. f76_local7.geo_2 .. ", " .. f76_local7.geo_3 .. ", " .. f76_local7.geo_4 .. ".\n" )
			end
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------------------------------------------------\n" )
			f76_arg0.filteredResult = {}
			f76_local3 = Engine.GetGeoLocation()
			f76_local4 = Engine.GetLobbyHostXuid( f76_arg0.lobbyType )
			f76_local5 = 1
			for f76_local9, f76_local10 in ipairs( f76_local0.remoteHosts ) do
				if Engine.CompareUInt64( f76_local4, f76_local10.xuid, "=" ) == true then
					
				end
				hostOK = false
				if f76_local10.serverType == 2000 then
					latencytoserverlocation = Engine.GetPingForServerLocation( f76_local10.serverLocation )
					if f76_local10.latencyBand == 0 then
						hostOK = true
					elseif math.abs( f76_local10.latencyBand - latencytoserverlocation ) > Dvar.lobbySearchMaxLatencyBandDiff:get() then
						Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Rejecting result from serverlocation " .. f76_local10.serverLocation .. ", the latencyband is " .. f76_local10.latencyBand .. "ms and our latency is " .. latencytoserverlocation .. "\n" )
					else
						hostOK = true
					end
				elseif GeoMinCheck( f76_local3, f76_local10 ) then
					hostOK = true
				end
				if hostOK then
					f76_arg0.filteredResult[f76_local5] = {
						xuid = f76_local10.xuid,
						gameSecurityId = f76_local10.gameSecurityId,
						gameSecurityKey = f76_local10.gameSecurityKey,
						hostAddress = f76_local10.hostAddress
					}
					f76_local5 = f76_local5 + 1
				end
			end
			LobbyVM.LobbyStatusUpdate( {
				searchStage = 1,
				numResults = #f76_arg0.filteredResult
			} )
			LuaUtils.LogQoS( "search_results", f76_arg0.filteredResult )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "SearchForLobby, number of filtered results " .. #f76_arg0.filteredResult .. ".\n" )
		end
		,
		errorFuncPtr = function ()
			return Engine.Localize( "MENU_NO_SESSIONS" )
		end
		
	}
end

Lobby.Actions.JOIN_STATUS = {
	BEGIN = 1,
	ADD = 2,
	FINALIZE = 3
}
Lobby.Actions.QoSJoinSearchResults = function ( f78_arg0, f78_arg1 )
	return {
		name = "QoSJoinSearchResults",
		controller = f78_arg0,
		searchAction = f78_arg1,
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
		startFuncPtr = function ( f79_arg0 )
			f79_arg0.sourceLobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
			f79_arg0.targetLobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
			f79_arg0.joinStatusCur = Lobby.Actions.JOIN_STATUS.BEGIN
			f79_arg0.minInitialCount = 0
			f79_arg0.updateTime = nil
			f79_arg0.firstResultTime = nil
			f79_arg0.searchTime = nil
			f79_arg0.qosResultsValid = {}
			f79_arg0.qosResultsInvalid = {}
			f79_arg0.joiningNumHosts = 0
			f79_arg0.joiningCurHost = 1
			local f79_local0 = f79_arg0.searchAction.filteredResult
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, num of search results passed " .. #f79_local0 .. " for QoS.\n" )
			if #f79_local0 == 0 then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f79_arg0.actionId
				} )
				return 
			end
			LobbyVM.LobbyStatusUpdate( {
				searchStage = 2,
				numResults = #f79_local0,
				contactedResults = 0
			} )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, starting probes.\n" )
			if Engine.QoSProbeInitiate( f79_arg0.actionId, f79_arg0.sourceLobbyType, f79_local0 ) == false then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, QoSProbeInitiate failed.\n" )
				LobbyVM.ProcessCompleteFailure( {
					actionId = f79_arg0.actionId
				} )
			end
			f79_arg0.minInitialCount = #f79_local0 * 100 / Dvar.qos_minPercent:get()
			f79_arg0.minInitialCount = math.max( f79_arg0.minInitialCount, Dvar.qos_minProbes:get() )
			f79_arg0.joinStatusCur = Lobby.Actions.JOIN_STATUS.BEGIN
			f79_arg0.firstResultTime = Engine.milliseconds()
			f79_arg0.updateTime = Engine.milliseconds()
			f79_arg0.searchTime = Engine.milliseconds()
		end
		,
		pumpFuncPtr = function ( f80_arg0 )
			if f80_arg0.joinStatusCur == Lobby.Actions.JOIN_STATUS.BEGIN then
				local f80_local0 = Engine.milliseconds()
				if f80_local0 < f80_arg0.searchTime then
					return 
				elseif #f80_arg0.qosResultsValid == 0 and #f80_arg0.searchAction.filteredResult <= #f80_arg0.qosResultsInvalid then
					Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults::pumpFuncPtr, Not expecting any results to join, QoSJoinSearchResults failed.\n" )
					LobbyVM.ProcessCompleteFailure( {
						actionId = f80_arg0.actionId
					} )
					return 
				end
				local f80_local1 = false
				if f80_arg0.minInitialCount <= #f80_arg0.qosResultsValid then
					if f80_local0 - f80_arg0.firstResultTime > Dvar.qos_firstUpdateMS:get() then
						if f80_local0 - f80_arg0.updateTime > Dvar.qos_lastUpdateMS:get() then
							f80_local1 = true
						else
							Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, waiting for last update to settle.\n" )
						end
					else
						Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, waiting for first update to settle.\n" )
					end
				else
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, waiting for " .. f80_arg0.minInitialCount .. " initial results. Current: " .. #f80_arg0.qosResultsValid .. ".\n" )
				end
				if #f80_arg0.searchAction.filteredResult <= #f80_arg0.qosResultsInvalid + #f80_arg0.qosResultsValid then
					f80_local1 = true
				end
				if f80_local1 then
					local f80_local2 = function ( f81_arg0, f81_arg1 )
						local f81_local0 = math.floor( f81_arg0.latency / 25 )
						local f81_local1 = math.floor( f81_arg1.latency / 25 )
						if f81_local0 == f81_local1 then
							if f81_arg0.isMatchEndingSoon == f81_arg1.isMatchEndingSoon then
								return f81_arg0.numAvailableSlots < f81_arg1.numAvailableSlots
							else
								return f81_arg1.isMatchEndingSoon
							end
						else
							return f81_local0 < f81_local1
						end
					end
					
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, num of initial results returned " .. #f80_arg0.qosResultsValid .. ".\n" )
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, begin join.\n" )
					Engine.LobbyJoinBegin( f80_arg0.actionId, f80_arg0.controller, f80_arg0.sourceLobbyType, f80_arg0.targetLobbyType )
					table.sort( f80_arg0.qosResultsValid, f80_local2 )
					for f80_local6, f80_local7 in ipairs( f80_arg0.qosResultsValid ) do
						Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Attempting to join xuid: " .. f80_local7.xuidstr .. ".\n" )
						f80_arg0.joiningNumHosts = f80_arg0.joiningNumHosts + 1
						LobbyVM.LobbyStatusUpdate( {
							searchStage = 3,
							joiningCurHost = f80_arg0.joiningCurHost,
							joiningNumHosts = f80_arg0.joiningNumHosts
						} )
						Engine.LobbyJoinAdd( f80_local7.xuid, f80_local7.gameSecurityId, f80_local7.gameSecurityKey, f80_local7.hostAddress )
						Lobby.Debug.SessionSQJJoinInitiate( f80_local7.xuid )
					end
					f80_arg0.joinStatusCur = Lobby.Actions.JOIN_STATUS.ADD
				end
			elseif f80_arg0.joinStatusCur == Lobby.Actions.JOIN_STATUS.ADD then
				if #f80_arg0.qosResultsValid < #f80_arg0.searchAction.filteredResult and Engine.milliseconds() - f80_arg0.firstResultTime < Dvar.qos_maxProbeWait:get() then
					return 
				end
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, finalize join.\n" )
				f80_arg0.joinStatusCur = Lobby.Actions.JOIN_STATUS.FINALIZE
				Engine.LobbyJoinFinalize()
			end
		end
		,
		updateFuncPtr = function ( f82_arg0, f82_arg1 )
			if f82_arg1.joinResult then
				Lobby.Debug.SessionSQJJoinResult( f82_arg1 )
				f82_arg0.joiningCurHost = math.min( f82_arg0.joiningCurHost + 1, f82_arg0.joiningNumHosts )
				LobbyVM.LobbyStatusUpdate( {
					searchStage = 3,
					joiningCurHost = f82_arg0.joiningCurHost,
					joiningNumHosts = f82_arg0.joiningNumHosts
				} )
				return 
			end
			Lobby.Debug.SessionSQJQoSResult( f82_arg1 )
			local f82_local0 = nil
			if f82_arg1.validResult == false then
				f82_local0 = {
					validResult = f82_arg1.validResult,
					xuid = f82_arg1.xuid,
					xuidstr = f82_arg1.xuidstr
				}
				f82_arg0.qosResultsInvalid[#f82_arg0.qosResultsInvalid + 1] = f82_local0
				LuaUtils.LogQoS( "invalid_qos", f82_local0 )
				return 
			end
			f82_local0 = {
				validResult = f82_arg1.validResult,
				xuid = f82_arg1.xuid,
				xuidstr = f82_arg1.xuidstr,
				gameSecurityId = f82_arg1.gameSecurityId,
				gameSecurityKey = f82_arg1.gameSecurityKey,
				hostAddress = f82_arg1.hostAddress,
				protocol = f82_arg1.protocol,
				isMP = f82_arg1.isMP,
				isMigrating = f82_arg1.isMigrating,
				numAvailableSlots = f82_arg1.numAvailableSlots,
				maxLocalPlayersAllowed = f82_arg1.maxLocalPlayersAllowed,
				allowGuests = f82_arg1.allowGuests,
				isMatchEndingSoon = f82_arg1.isMatchEndingSoon,
				isMatchLoading = f82_arg1.isMatchLoading,
				isDedicated = f82_arg1.isDedicated,
				hostXuid = f82_arg1.hostXuid,
				latency = f82_arg1.latency,
				minLatency = f82_arg1.minLatency,
				realAddr = f82_arg1.realAddr
			}
			LuaUtils.LogQoS( "valid_qos", f82_local0 )
			f82_arg0.updateTime = Engine.milliseconds()
			if #f82_arg0.qosResultsValid == 0 then
				f82_arg0.firstResultTime = f82_arg0.updateTime
			end
			f82_arg0.qosResultsValid[#f82_arg0.qosResultsValid + 1] = f82_local0
			LobbyVM.LobbyStatusUpdate( {
				searchStage = 2,
				numResults = #f82_arg0.searchAction.filteredResult,
				contactedResults = #f82_arg0.qosResultsValid
			} )
			if f82_arg0.joinStatusCur == Lobby.Actions.JOIN_STATUS.START then
				
			elseif f82_arg0.joinStatusCur == Lobby.Actions.JOIN_STATUS.ADD then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Attempting to join xuid: " .. f82_local0.xuidstr .. ".\n" )
				f82_arg0.joiningNumHosts = f82_arg0.joiningNumHosts + 1
				LobbyVM.LobbyStatusUpdate( {
					searchStage = 3,
					joiningCurHost = f82_arg0.joiningCurHost,
					joiningNumHosts = f82_arg0.joiningNumHosts
				} )
				Engine.LobbyJoinAdd( f82_local0.xuid, f82_local0.gameSecurityId, f82_local0.gameSecurityKey, f82_local0.hostAddress )
			elseif f82_arg0.joinStatusCur == Lobby.Actions.JOIN_STATUS.FINALIZE then
				
			else
				
			end
		end
		,
		endFuncPtr = function ( f83_arg0 )
			Engine.QoSCancelProbes()
			Engine.LobbyJoinErrorShutdown()
		end
		,
		cancelFuncPtr = function ( f84_arg0 )
			Engine.QoSCancelProbes()
			Engine.LobbyJoinErrorShutdown()
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f84_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.JoinSearchResults = function ( f85_arg0, f85_arg1 )
	return {
		name = "JoinSearchResults",
		controller = f85_arg0,
		searchAction = f85_arg1,
		sourceLobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		targetLobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		startFuncPtr = function ( f86_arg0 )
			local f86_local0 = f86_arg0.searchAction.filteredResult
			if #f86_local0 == 0 then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f86_arg0.actionId
				} )
				return 
			end
			Engine.LobbyJoinBegin( f86_arg0.actionId, f86_arg0.controller, f86_arg0.sourceLobbyType, f86_arg0.targetLobbyType )
			for f86_local4, f86_local5 in ipairs( f86_local0 ) do
				Engine.LobbyJoinAdd( f86_local5.xuid, f86_local5.gameSecurityId, f86_local5.gameSecurityKey, f86_local5.hostAddress )
			end
			Engine.LobbyJoinFinalize()
		end
		
	}
end

Lobby.Actions.AdvertiseLobby = function ( f87_arg0 )
	return {
		name = "AdvertiseLobby",
		onOff = f87_arg0,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		startFuncPtr = function ( f88_arg0 )
			Lobby.Matchmaking.SetupAdvertising()
			Engine.AdvertiseLobby( f88_arg0.actionId, f88_arg0.lobbyType, f88_arg0.onOff )
		end
		,
		errorFuncPtr = function ( f89_arg0 )
			local f89_local0 = ""
			local f89_local1 = ""
			if f89_arg0.onOff == true then
				errorMessage = Engine.Localize( "MENU_NO_SESSIONS" )
				f89_local1 = "Failed to turn on lobby advertising"
			else
				f89_local1 = "Failed to turn off lobby advertising"
			end
			if not Engine.IsDevelopmentBuild() then
				return errorMessage
			else
				return errorMessage .. "\n\nDEBUG INFO: AdvertiseLobby( " .. f89_local1 .. " )\n"
			end
		end
		
	}
end

Lobby.Actions.LobbyInfoProbe = function ( f90_arg0, f90_arg1 )
	return {
		name = "InfoProbe",
		controller = f90_arg0,
		info = f90_arg1,
		probeResult = nil,
		startFuncPtr = function ( f91_arg0 )
			Engine.LobbyInfoProbe( f91_arg0.actionId, f91_arg0.controller, f91_arg0.info.xuid )
		end
		,
		endFuncPtr = function ( f92_arg0 )
			f92_arg0.probeResult = f92_arg0.retData
		end
		
	}
end

Lobby.Actions.JoinHost = function ( f93_arg0, f93_arg1, f93_arg2, f93_arg3, f93_arg4 )
	return {
		name = "LobbyJoinHost",
		controller = f93_arg0,
		mainMode = f93_arg1,
		networkMode = f93_arg2,
		hostXuid = f93_arg3,
		hostInfo = f93_arg4,
		joinResults = {},
		startFuncPtr = function ( f94_arg0 )
			if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
				Engine.JoinHost( f94_arg0.actionId, f94_arg0.controller, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyType.LOBBY_TYPE_GAME, f94_arg0.hostXuid, f94_arg0.hostInfo )
			else
				Engine.JoinHost( f94_arg0.actionId, f94_arg0.controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyType.LOBBY_TYPE_GAME, f94_arg0.hostXuid, f94_arg0.hostInfo )
			end
		end
		,
		updateFuncPtr = function ( f95_arg0, f95_arg1 )
			f95_arg0.joinResults[#f95_arg0.joinResults + 1] = f95_arg1
		end
		,
		errorFuncPtr = function ( f96_arg0 )
			local f96_local0 = Engine.Localize( "MENU_JOIN_RESULT_NOT_JOINABLE" )
			if #f96_arg0.joinResults == 0 then
				return f96_local0
			else
				local f96_local1 = f96_arg0.joinResults[#f96_arg0.joinResults].joinResult
				local f96_local2 = LobbyVM.JoinResultToString( f96_local1, true )
				f96_local0 = Engine.Localize( f96_local2.errorMsg )
				if not Engine.IsDevelopmentBuild() then
					return f96_local0
				else
					return f96_local0 .. "\n\nDEBUG INFO: JoinResult( " .. tostring( f96_local1 ) .. " )\n" .. f96_local2.debug
				end
			end
		end
		
	}
end

Lobby.Actions.LobbyJoinXUID = function ( f97_arg0, f97_arg1, f97_arg2 )
	return {
		name = "LobbyJoinXUID",
		controller = f97_arg0,
		info = f97_arg1,
		joinType = f97_arg2,
		joinResults = {},
		startFuncPtr = function ( f98_arg0 )
			Engine.JoinXUID( f98_arg0.actionId, f98_arg0.controller, f98_arg0.info.xuid, f98_arg0.joinType )
		end
		,
		updateFuncPtr = function ( f99_arg0, f99_arg1 )
			f99_arg0.joinResults[#f99_arg0.joinResults + 1] = f99_arg1
		end
		,
		endFuncPtr = function ( f100_arg0 )
			
		end
		,
		errorFuncPtr = function ( f101_arg0 )
			local f101_local0 = Engine.Localize( "MENU_JOIN_RESULT_NOT_JOINABLE" )
			if #f101_arg0.joinResults == 0 then
				return f101_local0
			else
				local f101_local1 = f101_arg0.joinResults[#f101_arg0.joinResults].joinResult
				local f101_local2 = LobbyVM.JoinResultToString( f101_local1, true )
				f101_local0 = Engine.Localize( f101_local2.errorMsg )
				if not Engine.IsDevelopmentBuild() then
					return f101_local0
				else
					return f101_local0 .. "\n\nDEBUG INFO: JoinResult( " .. tostring( f101_local1 ) .. " )\n" .. f101_local2.debug
				end
			end
		end
		
	}
end

Lobby.Actions.LobbyJoinXUIDExt = function ( f102_arg0, f102_arg1, f102_arg2, f102_arg3 )
	return {
		name = "LobbyJoinXUIDExt",
		controller = f102_arg0,
		joinType = f102_arg1,
		infoProbe = f102_arg2,
		destinationLobby = f102_arg3,
		joinResults = {},
		startFuncPtr = function ( f103_arg0 )
			local f103_local0 = f103_arg0.infoProbe.probeResult
			local f103_local1 = f103_arg0.destinationLobby
			local f103_local2 = nil
			if f103_local1 == Enum.LobbyType.LOBBY_TYPE_COUNT then
				if f103_local0.gameLobby.isValid == true then
					f103_local1 = Enum.LobbyType.LOBBY_TYPE_GAME
					f103_local2 = f103_local0.gameLobby
				else
					f103_local1 = Enum.LobbyType.LOBBY_TYPE_PRIVATE
					f103_local2 = f103_local0.privateLobby
				end
			elseif f103_local1 == Enum.LobbyType.LOBBY_TYPE_GAME then
				f103_local2 = f103_local0.gameLobby
			else
				f103_local2 = f103_local0.privateLobby
			end
			if Engine.JoinXUIDExt( f103_arg0.actionId, f103_arg0.controller, f103_local2.isValid, f103_local2.hostXuid, f103_local2.hostName, f103_local1, f103_local2.secId, f103_local2.secKey, f103_local2.serializedAdr, f103_arg0.joinType ) == false then
				LobbyVM.ProcessCompleteError( {
					actionId = f103_arg0.actionId
				} )
			end
		end
		,
		updateFuncPtr = function ( f104_arg0, f104_arg1 )
			f104_arg0.joinResults[#f104_arg0.joinResults + 1] = f104_arg1
		end
		,
		endFuncPtr = function ( f105_arg0 )
			
		end
		,
		errorFuncPtr = function ( f106_arg0 )
			local f106_local0 = Engine.Localize( "MENU_JOIN_RESULT_NOT_JOINABLE" )
			if #f106_arg0.joinResults == 0 then
				return f106_local0
			else
				local f106_local1 = f106_arg0.joinResults[#f106_arg0.joinResults].joinResult
				local f106_local2 = LobbyVM.JoinResultToString( f106_local1, true )
				f106_local0 = Engine.Localize( f106_local2.errorMsg )
				if not Engine.IsDevelopmentBuild() then
					return f106_local0
				else
					return f106_local0 .. "\n\nDEBUG INFO: JoinResult( " .. tostring( f106_local1 ) .. " )\n" .. f106_local2.debug
				end
			end
		end
		
	}
end

Lobby.Actions.WaitForJoiningClients = function ( f107_arg0 )
	return {
		name = "WaitForJoiningClients",
		waitMilliseconds = f107_arg0,
		endWaitTime = nil,
		startFuncPtr = function ( f108_arg0 )
			f108_arg0.endWaitTime = f108_arg0.waitMilliseconds + Engine.milliseconds()
			local f108_local0 = Engine.LobbyJoinCount()
			if f108_local0 == 0 then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f108_arg0.actionId
				} )
			end
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "WaitForJoiningClients start, number of joining clients: " .. f108_local0 .. ". Waiting " .. f108_arg0.waitMilliseconds .. "ms for clients to join.\n" )
		end
		,
		pumpFuncPtr = function ( f109_arg0 )
			local f109_local0 = Engine.LobbyJoinCount()
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "WaitForJoiningClients pump, number of clients still joining: " .. f109_local0 .. ". Waiting for " .. f109_arg0.endWaitTime - Engine.milliseconds() .. "ms\n" )
			if f109_arg0.endWaitTime < Engine.milliseconds() then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "WaitForJoiningClients pump stop, number of clients still joining: " .. f109_local0 .. ". Clients took to long to join.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f109_arg0.actionId
				} )
				return 
			elseif f109_local0 == 0 then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "WaitForJoiningClients pump stop, All clients have joined.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f109_arg0.actionId
				} )
				return 
			else
				
			end
		end
		,
		cancelFuncPtr = function ( f110_arg0 )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f110_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.LobbySettings = function ( f111_arg0, f111_arg1, f111_arg2 )
	return {
		name = "LobbySettings",
		controller = f111_arg0,
		toTarget = f111_arg1,
		skipSwitchMode = f111_arg2,
		startFuncPtr = function ( f112_arg0 )
			LobbyVM.LobbySettings( {
				controller = f111_arg0,
				toTarget = f111_arg1,
				skipSwitchMode = f111_arg2
			} )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f112_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.SetQueueCancellable = function ( f113_arg0 )
	return {
		name = "SetQueueCancellable",
		startFuncPtr = function ( f114_arg0 )
			Lobby.ProcessQueue.SetCancellable( f113_arg0 )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f114_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.UpdateUI = function ( f115_arg0, f115_arg1 )
	return {
		name = "UpdateUI",
		require = "LobbySettings",
		controller = f115_arg0,
		toTarget = f115_arg1,
		startFuncPtr = function ( f116_arg0 )
			LobbyVM.UpdateUI( {
				controller = f115_arg0,
				toTarget = f115_arg1
			} )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f116_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.SetNetworkMode = function ( f117_arg0, f117_arg1 )
	return {
		name = "SetNetworkMode",
		controller = f117_arg0,
		networkMode = f117_arg1,
		startFuncPtr = function ( f118_arg0 )
			Engine.SetLobbyNetworkMode( f118_arg0.networkMode )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f118_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.PromoteToHostDone = function ( f119_arg0, f119_arg1, f119_arg2, f119_arg3 )
	return {
		name = "promoteToHostDone",
		controller = f119_arg0,
		lobbyType = f119_arg1,
		migrateIndexBits = f119_arg2,
		isInGame = f119_arg3,
		startFuncPtr = function ( f120_arg0 )
			Engine.LobbyHostMigrateSetIndexBits( f120_arg0.lobbyType, f120_arg0.migrateIndexBits )
			Engine.Exec( f120_arg0.controller, "lobby_setmap " .. Dvar.ui_mapname:get() )
			Engine.Exec( f120_arg0.controller, "lobby_setgametype " .. Dvar.ui_gametype:get() )
			Engine.PromoteToHostDone( f120_arg0.controller, f120_arg0.lobbyType, f120_arg0.isInGame )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f120_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.SignUserInToLive = function ( f121_arg0 )
	return {
		name = "SignUserInToLive",
		controller = f121_arg0,
		startFuncPtr = function ( f122_arg0 )
			Engine.SignUserIntoLive( f122_arg0.controller )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f122_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.SignUserOutOfLive = function ( f123_arg0, f123_arg1 )
	return {
		name = "SignUserOutOfLive",
		controller = f123_arg0,
		networkMode = f123_arg1,
		startFuncPtr = function ( f124_arg0 )
			Engine.SignUserOutOfLive( f124_arg0.controller )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f124_arg0.actionId
			} )
		end
		
	}
end

Lobby.Actions.PlatformSessionCreate = function ( f125_arg0, f125_arg1, f125_arg2 )
	return {
		name = "PlatformSessionCreate",
		controller = f125_arg0,
		lobbyType = f125_arg1,
		maxSlot = f125_arg2,
		throttle = 5000,
		startFuncPtr = function ( f126_arg0 )
			if Lobby.PlatformSession.PlatformSessionOrbisEnabled() == false or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE or Engine.IsDedicatedServer() then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f126_arg0.actionId
				} )
				return 
			else
				Dvar.platformSessionName:set( Engine.LocalizeWithoutLocsMarkers( "MENU_PLATFORM_SESSION_NAME" ) )
				Dvar.platformSessionStatus:set( "" )
				Dvar.platformSessionImgPath:set( "" )
				Dvar.platformSessionImg:set( "platform_session.png" )
				if Engine.PlatformSessionCreate( f126_arg0.actionId, f126_arg0.controller, f126_arg0.lobbyType, f126_arg0.maxSlot ) == false then
					LobbyVM.ProcessCompleteFailure( {
						actionId = f126_arg0.actionId
					} )
					return 
				else
					
				end
			end
		end
		,
		endFuncPtr = function ( f127_arg0 )
			if Lobby.PlatformSession.PlatformSessionOrbisEnabled() == false or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE or Engine.IsDedicatedServer() then
				return 
			else
				Lobby.PlatformSession.SetSessionId( f127_arg0.retData.sessionId )
			end
		end
		
	}
end

Lobby.Actions.PlatformSessionUpdate = function ( f128_arg0, f128_arg1, f128_arg2 )
	return {
		name = "PlatformSessionUpdate",
		controller = f128_arg0,
		lobbyType = f128_arg1,
		sessionId = f128_arg2,
		throttle = 5000,
		startFuncPtr = function ( f129_arg0 )
			if Lobby.PlatformSession.PlatformSessionOrbisEnabled() == false or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE or Engine.IsDedicatedServer() then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f129_arg0.actionId
				} )
				return 
			else
				Dvar.platformSessionName:set( Engine.LocalizeWithoutLocsMarkers( "MENU_PLATFORM_SESSION_NAME" ) )
				Dvar.platformSessionStatus:set( "" )
				if Engine.PlatformSessionUpdate( f129_arg0.actionId, f129_arg0.controller, f129_arg0.lobbyType, f129_arg0.sessionId ) == false then
					LobbyVM.ProcessCompleteFailure( {
						actionId = f129_arg0.actionId
					} )
					return 
				else
					
				end
			end
		end
		,
		endFuncPtr = function ( f130_arg0 )
			if Lobby.PlatformSession.PlatformSessionOrbisEnabled() == false or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE or Engine.IsDedicatedServer() then
				return 
			else
				
			end
		end
		
	}
end

Lobby.Actions.PlatformSessionInvite = function ( f131_arg0, f131_arg1, f131_arg2, f131_arg3 )
	return {
		name = "PlatformSessionInvite(" .. f131_arg3 .. ")",
		controller = f131_arg0,
		lobbyType = f131_arg1,
		xuid = f131_arg2,
		gamertag = f131_arg3,
		throttle = 5000,
		startFuncPtr = function ( f132_arg0 )
			if Lobby.PlatformSession.PlatformSessionOrbisEnabled() == false or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE or Engine.IsDedicatedServer() then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f132_arg0.actionId
				} )
				return 
			else
				Dvar.platformSessionInviteMessage:set( Engine.LocalizeWithoutLocsMarkers( "MENU_GAME_INVITE_MESSAGE", Engine.GetGamertagForController( f131_arg0 ) ) )
				if Engine.PlatformSessionInvite( f132_arg0.actionId, f132_arg0.controller, f132_arg0.lobbyType, f132_arg0.xuid, f132_arg0.gamertag ) == false then
					LobbyVM.ProcessCompleteFailure( {
						actionId = f132_arg0.actionId
					} )
					return 
				else
					
				end
			end
		end
		,
		endFuncPtr = function ( f133_arg0 )
			if Lobby.PlatformSession.PlatformSessionOrbisEnabled() == false or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE or Engine.IsDedicatedServer() then
				return 
			else
				
			end
		end
		
	}
end

Lobby.Actions.PlatformSessionGetSessionInfo = function ( f134_arg0, f134_arg1, f134_arg2 )
	return {
		name = "PlatformSessionGetSessionInfo",
		controller = f134_arg0,
		lobbyType = f134_arg1,
		sessionId = f134_arg2,
		throttle = 5000,
		info = {},
		gamertag = nil,
		gamertags = nil,
		startFuncPtr = function ( f135_arg0 )
			if Lobby.PlatformSession.PlatformSessionOrbisEnabled() == false or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE or Engine.IsDedicatedServer() then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f135_arg0.actionId
				} )
				return 
			elseif Engine.PlatformSessionGetSessionInfo( f135_arg0.actionId, f135_arg0.controller, f135_arg0.lobbyType, f135_arg0.sessionId ) == false then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f135_arg0.actionId
				} )
				return 
			else
				
			end
		end
		,
		endFuncPtr = function ( f136_arg0 )
			if Lobby.PlatformSession.PlatformSessionOrbisEnabled() == false or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE or Engine.IsDedicatedServer() then
				return 
			elseif f136_arg0.retData.returnCode ~= 0 then
				return 
			end
			f136_arg0.info = {
				sessionId = f136_arg0.retData.sessionId,
				sessionName = f136_arg0.retData.sessionName,
				sessionStatus = f136_arg0.retData.sessionStatus,
				sessionType = f136_arg0.retData.sessionType,
				sessionPrivacy = f136_arg0.retData.sessionPrivacy,
				locked = f136_arg0.retData.locked,
				maxSlots = f136_arg0.retData.maxSlots,
				creationTime = f136_arg0.retData.creationTime,
				sessionCreatorGamertag = f136_arg0.retData.sessionCreatorGamertag,
				sessionCreatorPlatform = f136_arg0.retData.sessionCreatorPlatform,
				members = f136_arg0.retData.members
			}
			if #f136_arg0.info.members > 0 then
				f136_arg0.gamertag = f136_arg0.info.members[#f136_arg0.info.members].gamertag
				f136_arg0.gamertags = {}
				for f136_local0 = 1, #f136_arg0.info.members, 1 do
					f136_arg0.gamertags[f136_local0] = f136_arg0.info.members[f136_local0].gamertag
				end
			end
		end
		
	}
end

Lobby.Actions.PlatformSessionGetInviteInfo = function ( f137_arg0, f137_arg1, f137_arg2 )
	return {
		name = "PlatformSessionGetInviteInfo",
		controller = f137_arg0,
		lobbyType = f137_arg1,
		invitationId = f137_arg2,
		throttle = 5000,
		info = {},
		gamertag = nil,
		gamertags = nil,
		startFuncPtr = function ( f138_arg0 )
			if Lobby.PlatformSession.PlatformSessionOrbisEnabled() == false or Engine.IsDemonwareFetchingDone( f137_arg0 ) == false or Engine.IsDedicatedServer() then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f138_arg0.actionId
				} )
				return 
			elseif Engine.PlatformSessionGetInviteInfo( f138_arg0.actionId, f138_arg0.controller, f138_arg0.lobbyType, f138_arg0.invitationId ) == false then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f138_arg0.actionId
				} )
				return 
			else
				
			end
		end
		,
		endFuncPtr = function ( f139_arg0 )
			if Lobby.PlatformSession.PlatformSessionOrbisEnabled() == false or Engine.IsDemonwareFetchingDone( f139_arg0.controller ) == false or Engine.IsDedicatedServer() then
				return 
			elseif f139_arg0.retData.returnCode ~= 0 then
				return 
			else
				f139_arg0.info.receivedDate = f139_arg0.retData.receivedDate
				f139_arg0.info.usedFlag = f139_arg0.retData.usedFlag
				f139_arg0.info.expired = f139_arg0.retData.expired
				f139_arg0.info.message = f139_arg0.retData.message
				f139_arg0.info.fromGamertag = f139_arg0.retData.fromGamertag
				f139_arg0.info.invitationId = f139_arg0.retData.invitationId
				f139_arg0.info.sessionId = f139_arg0.retData.sessionId
				f139_arg0.gamertag = f139_arg0.retData.fromGamertag
				f139_arg0.gamertags = {}
				f139_arg0.gamertags[1] = f139_arg0.gamertag
			end
		end
		
	}
end

Lobby.Actions.PlatformSessionLeave = function ( f140_arg0, f140_arg1, f140_arg2 )
	return {
		name = "PlatformSessionLeave",
		controller = f140_arg0,
		lobbyType = f140_arg1,
		sessionId = f140_arg2,
		throttle = 5000,
		startFuncPtr = function ( f141_arg0 )
			if Lobby.PlatformSession.PlatformSessionOrbisEnabled() == false or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE or Engine.IsDedicatedServer() then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f141_arg0.actionId
				} )
				return 
			elseif Engine.PlatformSessionLeave( f141_arg0.actionId, f141_arg0.controller, f141_arg0.lobbyType, f140_arg2 ) == false then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f141_arg0.actionId
				} )
				return 
			else
				
			end
		end
		,
		endFuncPtr = function ( f142_arg0 )
			if Lobby.PlatformSession.PlatformSessionOrbisEnabled() == false or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE or Engine.IsDedicatedServer() then
				return 
			else
				
			end
		end
		
	}
end

Lobby.Actions.PlatformSessionSearch = function ( f143_arg0, f143_arg1, f143_arg2 )
	return {
		name = "PlatformSessionSearch",
		controller = f143_arg0,
		lobbyType = f143_arg1,
		gamertag = f143_arg2,
		throttle = 5000,
		startFuncPtr = function ( f144_arg0 )
			if Lobby.PlatformSession.PlatformSessionOrbisEnabled() == false or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE or Engine.IsDedicatedServer() then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f144_arg0.actionId
				} )
				return 
			elseif Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) == true and Engine.PlatformSessionSearch( f144_arg0.actionId, f144_arg0.controller, f144_arg0.lobbyType, Engine.GetLobbyHostGamertag( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) ) == false then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f144_arg0.actionId
				} )
				return 
			else
				
			end
		end
		,
		endFuncPtr = function ( f145_arg0 )
			if Lobby.PlatformSession.PlatformSessionOrbisEnabled() == false or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE or Engine.IsDedicatedServer() then
				return 
			end
			local f145_local0 = f145_arg0.retData
			if f145_local0.sessions and #f145_local0.sessions > 0 then
				Lobby.PlatformSession.SetSessionId( f145_local0.sessions[1].sessionId )
			else
				Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYVM, "Action: " .. f145_arg0.name .. ", no sessions found. Unable to add session id.\n" )
			end
		end
		
	}
end

Lobby.Actions.PlatformSessionJoin = function ( f146_arg0, f146_arg1, f146_arg2 )
	return {
		name = "PlatformSessionJoin",
		controller = f146_arg0,
		lobbyType = f146_arg1,
		sessionId = f146_arg2,
		throttle = 5000,
		startFuncPtr = function ( f147_arg0 )
			if Lobby.PlatformSession.PlatformSessionOrbisEnabled() == false or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE or Engine.IsDedicatedServer() then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = f147_arg0.actionId
				} )
				return 
			elseif Engine.PlatformSessionJoin( f147_arg0.actionId, f147_arg0.controller, f147_arg0.lobbyType, Lobby.PlatformSession.GetSessionId() ) == false then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f147_arg0.actionId
				} )
				return 
			else
				
			end
		end
		,
		endFuncPtr = function ( f148_arg0 )
			if Lobby.PlatformSession.PlatformSessionOrbisEnabled() == false or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE or Engine.IsDedicatedServer() then
				return 
			else
				
			end
		end
		
	}
end

Lobby.Actions.GamertagsToXuids = function ( f149_arg0, f149_arg1 )
	return {
		name = "PlatformSessionJoin",
		controller = f149_arg0,
		info = f149_arg1,
		startFuncPtr = function ( f150_arg0 )
			if f149_arg1.gamertags == nil or #f149_arg1.gamertags == 0 then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f150_arg0.actionId
				} )
				return 
			elseif Engine.GamertagsToXuids( f150_arg0.actionId, f150_arg0.controller, f150_arg0.info.gamertags ) == false then
				LobbyVM.ProcessCompleteFailure( {
					actionId = f150_arg0.actionId
				} )
				return 
			else
				
			end
		end
		,
		endFuncPtr = function ( f151_arg0 )
			if f151_arg0.retData.returnCode ~= 0 then
				return 
			elseif f151_arg0.retData.userInfo == nil or #f151_arg0.retData.userInfo == 0 then
				f151_arg0.gamertag = ""
				f151_arg0.xuid = 0
				return 
			else
				f151_arg0.gamertag = f151_arg0.retData.userInfo[1].gamertag
				f151_arg0.xuid = f151_arg0.retData.userInfo[1].xuid
			end
		end
		
	}
end

Lobby.Actions.SetGameAndTypeMapName = function ( f152_arg0, f152_arg1, f152_arg2, f152_arg3 )
	return {
		name = "SetGameAndTypeMapName",
		controller = f152_arg0,
		gameType = f152_arg2,
		mapName = f152_arg3,
		startFuncPtr = function ( f153_arg0 )
			Engine.Exec( f153_arg0.controller, "lobby_setmap " .. f153_arg0.mapName )
			Engine.Exec( f153_arg0.controller, "lobby_setgametype " .. f153_arg0.gameType )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = f153_arg0.actionId
			} )
		end
		
	}
end

