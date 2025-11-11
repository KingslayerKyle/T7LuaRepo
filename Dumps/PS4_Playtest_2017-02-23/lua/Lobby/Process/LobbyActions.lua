require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Shared.LuaUtils" )

Lobby.Interrupt = {}
Lobby.Interrupt.NONE = nil
Lobby.Interrupt.BACK = 1
Lobby.Interrupt.FAILED_ACTION = 2
Lobby.Interrupt.ERROR_MSG = 3
Lobby.Interrupt.Back = function ( interruptFuncPtr, params )
	local process = {
		isInterrupt = true,
		name = "InterruptBack",
		interruptFuncPtr = interruptFuncPtr,
		params = params,
		createFuncPtr = function ( self, action )
			local extraParam = {
				action = nil,
				errorMsg = nil
			}
			return self.interruptFuncPtr( Lobby.Interrupt.BACK, self.params, extraParam )
		end
	}
	return process
end

Lobby.Interrupt.FailedAction = function ( interruptFuncPtr, params )
	local process = {
		isInterrupt = true,
		name = "InterruptFailedAction",
		interruptFuncPtr = interruptFuncPtr,
		params = params,
		createFuncPtr = function ( self, action )
			local extraParam = {
				action = action,
				errorMsg = nil
			}
			return self.interruptFuncPtr( Lobby.Interrupt.FAILED_ACTION, self.params, extraParam )
		end
	}
	return process
end

Lobby.Interrupt.ErrorMsg = function ( interruptFuncPtr, params, errorMsg )
	local process = {
		isInterrupt = true,
		name = "InterruptErrorMsg",
		interruptFuncPtr = interruptFuncPtr,
		params = params,
		errorMsg = errorMsg,
		createFuncPtr = function ( self, action )
			local extraParam = {
				action = action,
				errorMsg = self.errorMsg
			}
			return self.interruptFuncPtr( Lobby.Interrupt.ERROR_MSG, self.params, extraParam )
		end
	}
	return process
end

Lobby.Actions = {}
Lobby.Actions.EmptyAction = function ()
	local process = {
		name = "EmptyAction",
		startFuncPtr = function ( self )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.ExecuteScript = function ( inlineFunction, param )
	local process = {
		name = "ExecuteScript",
		inlineFunction = inlineFunction,
		functionParam = param,
		startFuncPtr = function ( self )
			self.inlineFunction( self.functionParam )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.ExecuteScriptWithReturn = function ( inlineFunction, successValue, failureValue, errorValue )
	local process = {
		name = "ExecuteScript",
		inlineFunction = inlineFunction,
		startFuncPtr = function ( self )
			local retVal = self.inlineFunction()
			if retVal == successValue then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
				return 
			elseif retVal == failureValue then
				LobbyVM.ProcessCompleteFailure( {
					actionId = self.actionId
				} )
				return 
			elseif retVal == errorValue then
				LobbyVM.ProcessCompleteError( {
					actionId = self.actionId
				} )
				return 
			else
				LobbyVM.ProcessCompleteError( {
					actionId = self.actionId
				} )
			end
		end
	}
	return process
end

Lobby.Actions.LuiEvent = function ( event, data )
	local process = {
		name = "LuiEvent: " .. event,
		event = event,
		data = data,
		startFuncPtr = function ( self )
			self.data.actionId = self.actionId
			Engine.LuiVM_Event( self.event, self.data )
		end
	}
	return process
end

Lobby.Actions.LobbyVMCall = function ( lobbyVMFunc, data )
	local process = {
		name = "LobbyVMCall",
		lobbyVMFunc = lobbyVMFunc,
		data = data,
		startFuncPtr = function ( self )
			self.lobbyVMFunc( self.data )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.LobbyVMCallRetVal = function ( lobbyVMFunc, data, successVal, failureVal, errorVal )
	local process = {
		name = "LobbyVMCallRetVal",
		lobbyVMFunc = lobbyVMFunc,
		data = data,
		successVal = successVal,
		failureVal = failureVal,
		errorVal = errorVal,
		startFuncPtr = function ( self )
			local retVal = self.lobbyVMFunc( self.data )
			if retVal == self.successVal then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
				return 
			elseif retVal == self.failureVal then
				LobbyVM.ProcessCompleteFailure( {
					actionId = self.actionId
				} )
				return 
			elseif retVal == self.errorVal then
				LobbyVM.ProcessCompleteError( {
					actionId = self.actionId
				} )
				return 
			else
				LobbyVM.ProcessCompleteError( {
					actionId = self.actionId
				} )
			end
		end
	}
	return process
end

Lobby.Actions.TimeDelay = function ( timeDelayMilliseconds )
	local process = {
		name = "TimeDelay(" .. timeDelayMilliseconds .. "ms)",
		timeDelayMilliseconds = timeDelayMilliseconds,
		endTime = nil,
		startFuncPtr = function ( self )
			if self.timeDelayMilliseconds == 0 then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
				return 
			else
				self.endTime = self.timeDelayMilliseconds + Engine.milliseconds()
			end
		end,
		pumpFuncPtr = function ( self, data )
			if self.endTime < Engine.milliseconds() then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
				return 
			else
				
			end
		end,
		cancelFuncPtr = function ( self )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.OpenSpinner = function ( showCancelButton, closeAllPopups )
	local process = {
		name = "OpenSpinner",
		showCancelButton = showCancelButton,
		closeAllPopups = closeAllPopups,
		startFuncPtr = function ( self )
			if self.showCancelButton == nil then
				self.showCancelButton = false
			end
			if self.closeAllPopups then
				local closePopupsModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.closePopups" )
				Engine.ForceNotifyModelSubscriptions( closePopupsModel )
			end
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), true )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.CloseSpinner = function ()
	local process = {
		name = "CloseSpinner",
		startFuncPtr = function ( self )
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.spinnerActive" ), false )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.IsConditionTrue = function ( condition )
	local process = {
		name = "IsConditionTrue(value: " .. tostring( condition ) .. ")",
		condition = condition,
		startFuncPtr = function ( self )
			if self.condition then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
			else
				LobbyVM.ProcessCompleteFailure( {
					actionId = self.actionId
				} )
			end
		end
	}
	return process
end

Lobby.Actions.EvaluateFunction = function ( func )
	local process = {
		name = "EvaluateFunction()",
		func = func,
		startFuncPtr = function ( self )
			if self.func() then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
			else
				LobbyVM.ProcessCompleteFailure( {
					actionId = self.actionId
				} )
			end
		end
	}
	return process
end

Lobby.Actions.WaitTillOutOfGame = function ()
	local process = {
		name = "WaitTillOutOfGame",
		startFuncPtr = function ( self )
			if Engine.IsInGame() == false then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
			end
		end,
		pumpFuncPtr = function ( self, data )
			if Engine.IsInGame() == false then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
			end
		end
	}
	return process
end

Lobby.Actions.CanAcceptPlatformInvite = function ( controller )
	local process = {
		name = "CanAcceptPlatformInvite(controller: " .. tostring( controller ) .. ")",
		controller = controller,
		startFuncPtr = function ( self )
			local canAcceptInvite = true
			if LuaUtils.IsSkuOfflineOnly() then
				canAcceptInvite = false
			end
			if canAcceptInvite then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
			else
				LobbyVM.ProcessCompleteFailure( {
					actionId = self.actionId
				} )
			end
		end
	}
	return process
end

Lobby.Actions.SendPlatformInvite = function ( controller, lobbyType, gamertag, sessionId )
	local process = {
		name = "SendPlatformInvite(controller: " .. tostring( controller ) .. ")",
		controller = controller,
		lobbyType = lobbyType,
		gamertag = gamertag,
		sessionId = sessionId,
		startFuncPtr = function ( self )
			local sessionId = Lobby.Platform.PS4GetSessionId( controller )
			local inviteSent = Engine.PlatformSessionPS4Invite( self.actionId, self.controller, self.lobbyType, Engine.NumberToUInt64( 0 ), self.gamertag, sessionId )
			if inviteSent == false then
				LobbyVM.ProcessCompleteFailure( {
					actionId = self.actionId
				} )
			end
		end
	}
	return process
end

Lobby.Actions.CanPlayOnline = function ( controller )
	local process = {
		name = "CanPlayOnline(controller: " .. tostring( controller ) .. ")",
		controller = controller,
		checkPlusEndTime = 0,
		startFuncPtr = function ( self )
			local controller = self.controller
			local canPlayOnline = true
			if LuaDefine.isPS4 then
				if not Engine.IsSignedIntoPSN( controller ) then
					Engine.DisplayNpError( controller, "-2141913082" )
					canPlayOnline = false
				elseif Engine.DisplayNpAvailabilityErrors( controller ) then
					canPlayOnline = false
				else
					local ready, isPsPlus = Engine.CheckPSPlus( controller )
					if ready == true then
						if isPsPlus == false then
							canPlayOnline = false
							Engine.DisplayUpsellAndContentWarnings( controller )
						end
					else
						self.checkPlusEndTime = Engine.milliseconds() + LuaDefine.PS_PLUS_CHECK_TIME
						return 
					end
				end
			elseif LuaDefine.isXbox and (Engine.HasMPPrivileges( controller ) == false or Engine.IsPlusAuthorized( controller ) == false) then
				canPlayOnline = false
			end
			if canPlayOnline then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
			else
				LobbyVM.ProcessCompleteFailure( {
					actionId = self.actionId
				} )
			end
		end,
		pumpFuncPtr = function ( self )
			local canPlayOnline = false
			if LuaDefine.isPS4 then
				local ready, isPsPlus = Engine.CheckPSPlus( controller )
				if ready == false and self.checkPlusEndTime > Engine.milliseconds() then
					return 
				elseif isPsPlus == true then
					canPlayOnline = true
				else
					Engine.DisplayUpsellAndContentWarnings( controller )
				end
			end
			if canPlayOnline then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
			else
				LobbyVM.ProcessCompleteFailure( {
					actionId = self.actionId
				} )
			end
		end
	}
	return process
end

Lobby.Actions.DisconnectFromDemonware = function ( controller, connectMode )
	local process = {
		name = "DisconnectFromDemonware",
		controller = controller,
		connectMode = connectMode,
		startFuncPtr = function ( self )
			if self.connectMode ~= nil then
				Dvar.live_connect_mode:set( connectMode )
			end
			if Engine.IsSignedInToDemonware( self.controller ) then
				Engine.LiveConnectDisconnectFromDemonware( self.controller )
			end
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.DisableConnectingToDemonware = function ( controller )
	local process = {
		name = "DisableConnectingToDemonware",
		controller = controller,
		startFuncPtr = function ( self )
			if Engine.IsSignedInToDemonware( self.controller ) and not Engine.IsDemonwareFetchingDone( controller ) then
				Engine.LiveConnectDisconnectFromDemonware( self.controller )
			end
			Engine.LiveConnectDisableDemonwareConnect()
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.EnableConnectingToDemonware = function ( controller )
	local process = {
		name = "EnableConnectingToDemonware",
		controller = controller,
		startFuncPtr = function ( self )
			Engine.LiveConnectEnableDemonwareConnect()
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.ConnectingToDemonware = function ( controller, waitMilliseconds, invite )
	local process = {
		name = "ConnectingToDemonware(check for " .. waitMilliseconds .. "ms)",
		controller = controller,
		waitMilliseconds = waitMilliseconds,
		invite = invite,
		endTime = nil,
		checkInterval = 100,
		checkTime = nil,
		startFuncPtr = function ( self )
			if self.waitMilliseconds == 0 and Engine.IsDemonwareFetchingDone( self.controller ) then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
				return 
			elseif invite ~= true then
				local f48_local0 = Engine.GetLobbyUIScreen()
				local f48_local1 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MAIN )
				if f48_local0 == f48_local1.id then
				
				else
					Engine.LiveConnectEnableDemonwareConnect()
					self.endTime = self.waitMilliseconds + Engine.milliseconds()
					self.checkTime = self.checkInterval + Engine.milliseconds()
				end
			end
			Engine.SetLobbyNetworkMode( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
		end,
		pumpFuncPtr = function ( self, data )
			if self.checkTime > Engine.milliseconds() then
				return 
			else
				self.checkTime = self.checkInterval + Engine.milliseconds()
				if Engine.IsDemonwareFetchingDone( self.controller ) == true then
					if true == LuaDefine.isPS4 then
						if Engine.DisplayNpAvailabilityErrors( controller ) then
							LobbyVM.ProcessCompleteFailure( {
								actionId = self.actionId
							} )
							return 
						elseif not Engine.DisplayUpsellAndContentWarnings( self.controller ) then
							LobbyVM.ProcessCompleteFailure( {
								actionId = self.actionId
							} )
							return 
						end
					end
					LobbyVM.ProcessCompleteSuccess( {
						actionId = self.actionId
					} )
					return 
				elseif self.endTime < Engine.milliseconds() then
					LobbyVM.ProcessCompleteFailure( {
						actionId = self.actionId
					} )
					return 
				else
					
				end
			end
		end,
		cancelFuncPtr = function ( self )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.IsButtonPressed = function ( controller, button )
	local process = {
		name = "IsButtonPressed",
		controller = controller,
		button = button,
		startFuncPtr = function ( self )
			if not Engine.IsDevelopmentBuild() then
				LobbyVM.ProcessCompleteFailure( {
					actionId = self.actionId
				} )
				return 
			else
				local isButtonPressed = Engine.IsButtonPressed( self.controller, self.button )
				if isButtonPressed then
					LobbyVM.ProcessCompleteSuccess( {
						actionId = self.actionId
					} )
					return 
				else
					LobbyVM.ProcessCompleteFailure( {
						actionId = self.actionId
					} )
				end
			end
		end
	}
	return process
end

Lobby.Actions.IsDvarSet = function ( dvarName, dvarValue )
	local process = {
		name = "IsDvarSet(dvar: " .. dvarName .. ", check for value: " .. tostring( dvarValue ) .. ")",
		dvarName = dvarName,
		dvarValue = dvarValue,
		startFuncPtr = function ( self )
			local dvarName = self.dvarName
			local dvarValue = self.dvarValue
			local dvarType = Engine.GetDvarType( dvarName )
			local valueMatch = false
			if dvarType == Enum.dvarType_t.DVAR_TYPE_INVALID then
				LobbyVM.ProcessCompleteFailure( {
					actionId = self.actionId
				} )
			elseif dvarType == Enum.dvarType_t.DVAR_TYPE_BOOL then
				valueMatch = dvarValue == Engine.GetDvarBool( dvarName )
			elseif dvarType == Enum.dvarType_t.DVAR_TYPE_FLOAT then
				valueMatch = dvarValue == Engine.GetDvarFloat( dvarName )
			elseif dvarType == Enum.dvarType_t.DVAR_TYPE_INT then
				valueMatch = dvarValue == Engine.GetDvarInt( dvarName )
			elseif dvarType == Enum.dvarType_t.DVAR_TYPE_STRING then
				valueMatch = dvarValue == Engine.GetDvarString( dvarName )
			end
			if valueMatch then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
				return 
			else
				LobbyVM.ProcessCompleteFailure( {
					actionId = self.actionId
				} )
			end
		end
	}
	return process
end

Lobby.Actions.ErrorPopupMsg = function ( message, title )
	local process = {
		name = "ErrorPopupMsg",
		message = message,
		title = title,
		startFuncPtr = function ( self )
			LuaUtils.UI_ShowErrorMessageDialog( nil, self.message, self.title )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.WarningPopupMsg = function ( message, title )
	local process = {
		name = "WarningPopupMsg",
		message = message,
		title = title,
		startFuncPtr = function ( self )
			LuaUtils.UI_ShowWarningMessageDialog( nil, self.message, self.title )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.ErrorPopup = function ( actionRef )
	if actionRef.errorFuncPtr == nil then
		error( "Lobby.Actions.ErrorPopup: An action: " .. actionRef.name .. " with no errorFuncPtr has been used." )
	end
	local process = {
		name = "ErrorPopup: " .. actionRef.name,
		actionRef = actionRef,
		startFuncPtr = function ( self )
			local message = "UNHANDLED ERROR OCCURRED (" .. actionRef.name .. " action)"
			if actionRef.errorFuncPtr ~= nil then
				message = self.actionRef:errorFuncPtr()
			end
			LuaUtils.UI_ShowErrorMessageDialog( nil, message )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.ConnectToDW = function ( controller )
	local process = {
		name = "ConnectToDW",
		controller = controller,
		startFuncPtr = function ( self )
			
		end
	}
	return process
end

Lobby.Actions.SetDefaultArenaPlaylist = function ( controller )
	local process = {
		name = "SetDefaultPlaylist",
		controller = controller,
		startFuncPtr = function ( self )
			local cachedPlaylist = Engine.GetProfileVarInt( controller, "playlist_leaguematch" )
			local playlistId = nil
			if cachedPlaylist <= 0 then
				if Dvar.arena_defaultPlaylist:exists() then
					playlistId = Dvar.arena_defaultPlaylist:get()
				else
					playlistId = 40
				end
			else
				playlistId = cachedPlaylist
			end
			local defaultPlaylist = nil
			local category, playlists = LuaUtils.GetArenaPlaylistInfo()
			for index, playlist in ipairs( playlists ) do
				if playlist.index == playlistId then
					defaultPlaylist = playlist
					break
				end
			end
			if not defaultPlaylist then
				defaultPlaylist = playlists[1]
			end
			if defaultPlaylist then
				Engine.SetPlaylistID( defaultPlaylist.index )
				Engine.SetProfileVar( controller, "playlist_leaguematch", tostring( defaultPlaylist.index ) )
				local model = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyPlaylist" )
				local nameModel = Engine.CreateModel( model, "name" )
				Engine.SetModelValue( nameModel, Engine.ToUpper( defaultPlaylist.name ) )
				local kickerTextModel = Engine.CreateModel( model, "kickerText" )
				Engine.SetModelValue( kickerTextModel, "" )
			end
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.ArenaErrorShutdown = function ( controller )
	local process = {
		name = "ArenaErrorShutdown",
		controller = controller,
		startFuncPtr = function ( self )
			Lobby.Pregame.Shutdown( controller )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.RunPlaylistSettings = function ( controller )
	local process = {
		name = "RunPlaylistSettings",
		require = "LobbySettings",
		controller = controller,
		startFuncPtr = function ( self )
			Engine.RunPlaylistSettings( self.controller )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.RunPlaylistRules = function ( controller )
	local process = {
		name = "RunPlaylistRules",
		require = "LobbySettings",
		controller = controller,
		startFuncPtr = function ( self )
			Engine.RunPlaylistRules( self.controller )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.SwitchMode = function ( controller, toMode )
	local process = {
		name = "SwitchMode",
		controller = controller,
		toMode = toMode,
		pumpFuncPtr = function ( self )
			Engine.SwitchMode( self.controller, self.toMode )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.SwitchCampaignMode = function ( controller, toMode )
	local process = {
		name = "SwitchCampaignMode",
		controller = controller,
		toMode = toMode,
		startFuncPtr = function ( self )
			Engine.SwitchCampaignMode( self.toMode )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.ForceLobbyUIScreen = function ( controller, screenId )
	local process = {
		name = "ForceLobbyUIScreen",
		controller = controller,
		screenId = screenId,
		startFuncPtr = function ( self )
			Engine.ForceLobbyUIScreen( self.screenId )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.LobbyHostStart = function ( controller, mainMode, lobbyType, lobbyMode, maxClients )
	local action = {
		name = "LobbyHostStart(" .. Engine.GetLobbyTypeName( lobbyType ) .. ")",
		controller = controller,
		mainMode = mainMode,
		lobbyType = lobbyType,
		lobbyMode = lobbyMode,
		maxClients = maxClients,
		startFuncPtr = function ( self )
			Engine.LobbyHostStart( self.actionId, self.controller, self.mainMode, self.lobbyType, self.lobbyMode, self.maxClients )
		end,
		errorFuncPtr = function ( self )
			return "Failed to host a lobby"
		end
	}
	return action
end

Lobby.Actions.LobbyHostStartMigratedInfo = function ( controller, mainMode, lobbyType, lobbyMode, maxClients, hostInfo )
	local action = {
		name = "LobbyHostStartMigrate(" .. Engine.GetLobbyTypeName( lobbyType ) .. ")",
		controller = controller,
		mainMode = mainMode,
		lobbyType = lobbyType,
		lobbyMode = lobbyMode,
		maxClients = maxClients,
		hostInfo = hostInfo,
		startFuncPtr = function ( self )
			Engine.LobbyHostStart( self.actionId, self.controller, self.mainMode, self.lobbyType, self.lobbyMode, self.maxClients, self.hostInfo )
		end
	}
	return action
end

Lobby.Actions.LobbyHostEnd = function ( lobbyType )
	local action = {
		name = "LobbyHostEnd(" .. Engine.GetLobbyTypeName( lobbyType ) .. ")",
		lobbyType = lobbyType,
		startFuncPtr = function ( self )
			Engine.LobbyHostEnd( self.actionId, self.lobbyType )
		end,
		errorFuncPtr = function ( self )
			return "Failed to end lobby"
		end
	}
	return action
end

Lobby.Actions.LobbyHostAddPrimary = function ( lobbyType )
	local action = {
		name = "LobbyHostAddPrimary(" .. Engine.GetLobbyTypeName( lobbyType ) .. ")",
		lobbyType = lobbyType,
		startFuncPtr = function ( self )
			Engine.LobbyHostAddPrimary( self.actionId, self.lobbyType )
		end
	}
	return action
end

Lobby.Actions.LobbyHostAddLocal = function ( controller, lobbyType )
	local action = {
		name = "LobbyHostAddLocal(" .. Engine.GetLobbyTypeName( lobbyType ) .. ")",
		controller = controller,
		lobbyType = lobbyType,
		startFuncPtr = function ( self )
			Engine.LobbyHostAddLocal( self.actionId, self.controller, self.lobbyType )
		end
	}
	return action
end

Lobby.Actions.LobbyClientStart = function ( lobbyType )
	local action = {
		name = "LobbyClientStart(" .. Engine.GetLobbyTypeName( lobbyType ) .. ")",
		lobbyType = lobbyType,
		startFuncPtr = function ( self )
			Engine.LobbyClientStart( self.actionId, self.lobbyType )
		end
	}
	return action
end

Lobby.Actions.LobbyClientEnd = function ( lobbyType )
	local action = {
		name = "LobbyClientEnd(" .. Engine.GetLobbyTypeName( lobbyType ) .. ")",
		lobbyType = lobbyType,
		startFuncPtr = function ( self )
			Engine.LobbyClientEnd( self.actionId, self.lobbyType )
		end
	}
	return action
end

Lobby.Actions.LobbyLocalClientLeave = function ( lobbyType, controller, xuid )
	local action = {
		name = "LobbyLocalClientLeave(" .. Engine.GetLobbyTypeName( lobbyType ) .. ")",
		lobbyType = lobbyType,
		controller = controller,
		xuid = xuid,
		startFuncPtr = function ( self )
			Engine.LobbyLocalClientLeave( self.actionId, self.lobbyType, self.controller, self.xuid )
		end
	}
	return action
end

Lobby.Actions.LeaveWithParty = function ( waitMilliseconds )
	local process = {
		name = "LeaveWithParty(wait for " .. waitMilliseconds .. "ms)",
		waitMilliseconds = waitMilliseconds,
		endTime = nil,
		startFuncPtr = function ( self )
			if Engine.InLobbyParty( Enum.LobbyType.LOBBY_TYPE_GAME ) == false then
				Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: " .. self.name .. ", we a loner in a private party, time to split, sweet!\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
				return 
			elseif Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) == false then
				Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: " .. self.name .. ", we are not the host of our private party.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
				return 
			end
			local clientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			local clientLocalCount = Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			if clientCount == 1 or clientCount == clientLocalCount then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
				return 
			elseif Engine.LeaveWithParty() == false then
				Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: " .. self.name .. ", failed to tell party members to leave, we failed but we should leave anyway.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
				return 
			elseif Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) == false then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: " .. self.name .. ", we are not the host of the game lobby, it is safe to leave now.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
			end
			self.endTime = self.waitMilliseconds + Engine.milliseconds()
		end,
		pumpFuncPtr = function ( self, data )
			local lobbyListPrivate = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			local lobbyListGame = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
			local clientStillInGameLobby = false
			for iPrivate, cPrivate in ipairs( lobbyListPrivate.sessionClients ) do
				for iGame, cGame in ipairs( lobbyListGame.sessionClients ) do
					if cPrivate.isHost == false and cPrivate.xuid == cGame.xuid then
						clientStillInGameLobby = true
					end
				end
			end
			if clientStillInGameLobby == false then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: " .. self.name .. ", all clients have left the game lobby, we can now leave.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
				return 
			elseif self.endTime < Engine.milliseconds() then
				Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: " .. self.name .. ", not all clients have left the game lobby, time to move on.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
				return 
			else
				
			end
		end,
		cancelFuncPtr = function ( self )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.WaitForParty = function ( joinResults, waitMilliseconds )
	local process = {
		name = "WaitForParty(wait for " .. waitMilliseconds .. "ms)",
		joinResults = joinResults,
		waitMilliseconds = waitMilliseconds,
		endTime = nil,
		startFuncPtr = function ( self )
			if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_TRANSITION ) == true then
				Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "LobbyAction: " .. self.name .. ", we are not the host of our transition lobby.\n" )
				LobbyVM.ProcessCompleteFailure( {
					actionId = self.actionId
				} )
				return 
			else
				local sourceLobbyType = self.joinResults[1].sourceLobbyType
				local targetLobbyType = self.joinResults[1].targetLobbyType
				local clientCount = Engine.GetLobbyClientCount( targetLobbyType )
				local clientLocalCount = Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
				if clientCount - clientLocalCount == 0 then
					LobbyVM.ProcessCompleteSuccess( {
						actionId = self.actionId
					} )
					return 
				else
					self.endTime = self.waitMilliseconds + Engine.milliseconds()
				end
			end
		end,
		pumpFuncPtr = function ( self, data )
			local sourceLobbyType = self.joinResults[1].sourceLobbyType
			local targetLobbyType = self.joinResults[1].targetLobbyType
			local party = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			local lobby = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, targetLobbyType )
			local clientFound = false
			for index, partyClient in ipairs( party.sessionClients ) do
				clientFound = false
				for index, lobbyClient in ipairs( lobby.sessionClients ) do
					if partyClient.xuid == lobbyClient.xuid then
						clientFound = true
						break
					end
				end
				if clientFound == false then
					
				end
			end
			if clientFound == true then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
				return 
			elseif self.endTime < Engine.milliseconds() then
				LobbyVM.ProcessCompleteFailure( {
					actionId = self.actionId
				} )
				return 
			else
				
			end
		end,
		cancelFuncPtr = function ( self )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.MoveLobbySession = function ( controller, joinResults )
	local action = {
		name = "MoveLobbySession",
		controller = controller,
		joinResults = joinResults,
		startFuncPtr = function ( self )
			local clientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			local clientLocalCount = Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			local host = Engine.GetLobbyHostInfo( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			local party = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			local xuids = {}
			if clientCount - clientLocalCount ~= 0 then
				local xuidIndex = 1
				for index, partyClient in ipairs( party.sessionClients ) do
					if host.xuid ~= partyClient.xuid then
						xuids[xuidIndex] = partyClient.xuid
						xuidIndex = xuidIndex + 1
					end
				end
				if #xuids > 0 then
					Engine.SendLobbyMoveList( 0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyType.LOBBY_TYPE_TRANSITION, xuids )
				end
			end
			local sourceLobbyType = self.joinResults[1].sourceLobbyType
			local targetLobbyType = self.joinResults[1].targetLobbyType
			Engine.CopyLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT, sourceLobbyType, targetLobbyType )
			Engine.ClearLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST, targetLobbyType )
			Engine.ClearLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST, sourceLobbyType )
			Engine.ClearLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT, sourceLobbyType )
			Lobby.Timer.HostingLobbyEnd( {
				lobbyType = targetLobbyType
			} )
			Engine.SendLobbySessionStateRequest( self.controller, targetLobbyType )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return action
end

Lobby.Actions.LobbyInRecovery = function ()
	local action = {
		name = "LobbyInRecovery",
		startFuncPtr = function ( self )
			if Engine.LobbyInRecovery then
				Engine.LobbyInRecovery()
			end
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return action
end

Lobby.Actions.CanHostServer = function ( controller, toTarget )
	local process = {
		name = "CanHostServer",
		controller = controller,
		toTarget = toTarget,
		failureReason = nil,
		startFuncPtr = function ( self )
			local maxClientCount = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
			if self.toTarget.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
				if Engine.IsFeatureBanned and Engine.IsFeatureBanned( self.controller, LuaEnum.FEATURE_BAN.MP_HOSTING ) == true then
					Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "CANNOT HOST A SERVER: HOST_SERVER_BANNED_FROM_HOSTING.\n" )
					LobbyVM.ProcessCompleteFailure( {
						actionId = self.actionId
					} )
					return 
				end
				local lobbyClientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
				if not Lobby.MatchmakingMP.AllowListenSearch( lobbyClientCount ) then
					Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "CANNOT HOST A SERVER: MATCHMAKING_ALLOW_LISTEN_SERVER_FAIL.\n" )
					LobbyVM.ProcessCompleteFailure( {
						actionId = self.actionId
					} )
					return 
				end
			end
			local canHost, failureReason = Engine.CanHostServer( self.controller, maxClientCount )
			if LuaUtils.IsArenaMode() and Lobby.MatchmakingArena.CanHostAnyLobby() == false then
				Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "CANNOT HOST A SERVER: ARENA MATCHMAKING DENIED HOST REQUEST\n" )
				LobbyVM.ProcessCompleteFailure( {
					actionId = self.actionId
				} )
				return 
			elseif canHost == true then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Can host server.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
				return 
			end
			self.failureReason = failureReason
			local failureReasonStr = "HOST_SERVER_UNKNOWN"
			if failureReason == Enum.HostServer.HOST_SERVER_BANDWIDTH_TEST_IN_PROGRESS then
				failureReasonStr = "HOST_SERVER_BANDWIDTH_TEST_IN_PROGRESS"
			elseif failureReason == Enum.HostServer.HOST_SERVER_NOT_HOST_OF_PARTY then
				failureReasonStr = "HOST_SERVER_NOT_HOST_OF_PARTY"
			elseif failureReason == Enum.HostServer.HOST_SERVER_DEDICATED_ONLY then
				failureReasonStr = "HOST_SERVER_DEDICATED_ONLY"
			elseif failureReason == Enum.HostServer.HOST_SERVER_NAT_TYPE_NOT_ALLOWED then
				failureReasonStr = "HOST_SERVER_NAT_TYPE_NOT_ALLOWED"
			elseif failureReason == Enum.HostServer.HOST_SERVER_WE_SHOULD_NOT_HOST then
				failureReasonStr = "HOST_SERVER_WE_SHOULD_NOT_HOST"
			elseif failureReason == Enum.HostServer.HOST_SERVER_IS_NOT_GOOD_CITIZEN then
				failureReasonStr = "HOST_SERVER_IS_NOT_GOOD_CITIZEN"
			elseif failureReason == Enum.HostServer.HOST_SERVER_HAS_NOT_NECESSARY_BANDWIDTH then
				failureReasonStr = "HOST_SERVER_HAS_NOT_NECESSARY_BANDWIDTH"
			elseif failureReason == Enum.HostServer.HOST_SERVER_NET_ENGINE_NOT_STARTED then
				failureReasonStr = "HOST_SERVER_NET_ENGINE_NOT_STARTED"
			elseif failureReason == Enum.HostServer.HOST_SERVER_LIVE_STREAMING then
				failureReasonStr = "HOST_SERVER_LIVE_STREAMING"
			elseif failureReason == Enum.HostServer.HOST_SERVER_BANNED_FROM_HOSTING then
				failureReasonStr = "HOST_SERVER_BANNED_FROM_HOSTING"
			elseif failureReason == Enum.HostServer.HOST_SERVER_IS_IN_SHARE_PLAY then
				failureReasonStr = "HOST_SERVER_IS_IN_SHARE_PLAY"
			end
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "CANNOT HOST A SERVER: " .. failureReasonStr .. ".\n" )
			LobbyVM.ProcessCompleteFailure( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.GeoMinCheck = function ( myGeo, host )
	local lobbySearchGeoMin = Dvar.lobbySearchGeoMin:get()
	if lobbySearchGeoMin == 0 then
		return true
	end
	local geoMatchCount = 0
	if myGeo.geo_1 == host.geo_1 then
		geoMatchCount = geoMatchCount + 1
		if myGeo.geo_2 == host.geo_2 then
			geoMatchCount = geoMatchCount + 1
			if myGeo.geo_3 == host.geo_3 then
				geoMatchCount = geoMatchCount + 1
				if myGeo.geo_4 == host.geo_4 then
					geoMatchCount = geoMatchCount + 1
				end
			end
		end
	end
	return lobbySearchGeoMin <= geoMatchCount
end

Lobby.Actions.SkillCheck = function ( skill, host )
	if LuaUtils.IsArenaMode() then
		return true
	elseif host.isEmpty ~= 0 then
		return true
	elseif host.serverType ~= Lobby.Matchmaking.ServerType.DEDICATED_SERVER then
		return true
	else
		local skillDelta = math.abs( skill - host.skill )
		local baseRange = Engine.GetDvarFloat( "lobbySearchBaseSkillRange" )
		local rangeScale = Engine.GetDvarFloat( "lobbySearchSkillRangeMultiplier" )
		local skillRange = baseRange + Lobby.Matchmaking.SearchParams.retry * rangeScale
		if skillRange <= 0 then
			return true
		else
			return skillDelta < skillRange
		end
	end
end

Lobby.Actions.SearchForLobby = function ( controller )
	local process = {
		name = "LobbySearch",
		controller = controller,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		filteredResult = {},
		startFuncPtr = function ( self )
			Lobby.Matchmaking.SetupMatchmakingStage( self.controller )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "SearchForLobby, begin search.\n" )
			LobbyVM.LobbyStatusUpdate( {
				searchStage = 1,
				numResults = 50
			} )
			Engine.SearchForLobby( self.actionId, self.lobbyType )
		end,
		endFuncPtr = function ( self )
			local searchQuery = Engine.GetSearchQuery()
			LuaUtils.LogQoS( "search_query", searchQuery )
			local searchResults = Engine.GetSearchResults( self.lobbyType )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "SearchForLobby, number of results found " .. searchResults.numResults .. ".\n" )
			local errorCode = searchResults.errorCode
			local numResults = searchResults.numResults
			Lobby.Debug.SessionSQJSearchResults( searchResults )
			if numResults == 0 then
				LobbyVM.LobbyStatusUpdate( {
					searchStage = 1,
					numResults = 0
				} )
				return 
			end
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------SEARCH RESULTS----------------------------\n" )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "xuid, gameSecurityId, gameType, maxPlayers, numPlayers, serverType, showInMatchmaking, netcodeVersion, mapPacks, playlistVersion, playlistNumber, isEmpty, teamSizeMax, skill, serverLocation, latencyBand, geo_1, geo_2, geo_3, geo_4\n" )
			for index, host in ipairs( searchResults.remoteHosts ) do
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, tostring( host.xuid ) .. ", " .. Engine.UInt64ToString( host.gameSecurityId ) .. ", " .. host.gameType .. ", " .. host.maxPlayers .. ", " .. host.numPlayers .. ", " .. host.serverType .. ", " .. host.showInMatchmaking .. ", " .. host.netcodeVersion .. ", " .. host.mapPacks .. ", " .. host.playlistVersion .. ", " .. host.playlistNumber .. ", " .. host.isEmpty .. ", " .. host.teamSizeMax .. ", " .. host.skill .. ", " .. host.serverLocation .. ", " .. host.latencyBand .. ", " .. Engine.UInt64ToString( host.geo_1 ) .. ", " .. Engine.UInt64ToString( host.geo_2 ) .. ", " .. Engine.UInt64ToString( host.geo_3 ) .. ", " .. Engine.UInt64ToString( host.geo_4 ) .. ".\n" )
			end
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------------------------------------------------\n" )
			self.filteredResult = {}
			local myGeo = Engine.GetGeoLocation()
			local localHostXuid = Engine.GetLobbyHostXuid( self.lobbyType )
			local count = 1
			for index, host in ipairs( searchResults.remoteHosts ) do
				if localHostXuid == host.xuid then
					
				end
				hostOK = false
				if host.serverType == Lobby.Matchmaking.ServerType.DEDICATED_SERVER then
					if Engine.IsDedicatedServer() == true then
						hostOK = true
					else
						latencytoserverlocation = Engine.GetPingForServerLocation( host.serverLocation )
						if host.latencyBand == 0 then
							hostOK = true
						elseif math.abs( host.latencyBand - latencytoserverlocation ) > Dvar.lobbySearchMaxLatencyBandDiff:get() then
							Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Rejecting result from serverlocation " .. host.serverLocation .. ", the latencyband is " .. host.latencyBand .. "ms and our latency is " .. latencytoserverlocation .. "\n" )
						else
							hostOK = true
						end
					end
				elseif Lobby.Actions.GeoMinCheck( myGeo, host ) then
					hostOK = true
				end
				if hostOK then
					hostOK = Lobby.Actions.SkillCheck( Dvar.lobbySearchSkill:get(), host )
				end
				if hostOK then
					local forceXuid = Dvar.lobbySearchForceXuid:get()
					if forceXuid ~= nil and forceXuid ~= Engine.DefaultID64Value() then
						local f113_local4 = hostOK
						if f113_local4 then
							f113_local4 = forceXuid == host.xuid
						end
						hostOK = f113_local4
					end
				end
				if hostOK then
					hostOK = not Lobby.MatchmakingPriority.IgnoreSearchResult( host.gameSecurityId )
					if hostOK == false then
						Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Matchmaking priority, ignoring host...\n" )
						Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, tostring( host.xuid ) .. ", " .. Engine.UInt64ToString( host.gameSecurityId ) .. ", " .. host.gameType .. ", " .. host.maxPlayers .. ", " .. host.numPlayers .. ", " .. host.serverType .. ", " .. host.showInMatchmaking .. ", " .. host.netcodeVersion .. ", " .. host.mapPacks .. ", " .. host.playlistVersion .. ", " .. host.playlistNumber .. ", " .. host.isEmpty .. ", " .. host.teamSizeMax .. ", " .. host.skill .. ", " .. host.serverLocation .. ", " .. host.latencyBand .. ", " .. Engine.UInt64ToString( host.geo_1 ) .. ", " .. Engine.UInt64ToString( host.geo_2 ) .. ", " .. Engine.UInt64ToString( host.geo_3 ) .. ", " .. Engine.UInt64ToString( host.geo_4 ) .. ".\n" )
					end
				end
				if hostOK then
					self.filteredResult[count] = {
						xuid = host.xuid,
						gameSecurityId = host.gameSecurityId,
						gameSecurityKey = host.gameSecurityKey,
						hostAddress = host.hostAddress
					}
					count = count + 1
				end
			end
			LobbyVM.LobbyStatusUpdate( {
				searchStage = 1,
				numResults = #self.filteredResult
			} )
			LuaUtils.LogQoS( "search_results", self.filteredResult )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "SearchForLobby, number of filtered results " .. #self.filteredResult .. ".\n" )
		end,
		errorFuncPtr = function ()
			return Engine.Localize( "MENU_NO_SESSIONS" )
		end,
		cancelFuncPtr = function ( self )
			Engine.LobbySearchErrorShutdown()
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.JOIN_STATUS = {
	BEGIN = 1,
	ADD = 2,
	FINALIZE = 3
}
Lobby.Actions.QoSJoinSearchResults = function ( controller, searchAction )
	local process = {
		name = "QoSJoinSearchResults",
		controller = controller,
		searchAction = searchAction,
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
		startFuncPtr = function ( self )
			self.sourceLobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
			self.targetLobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
			self.joinStatusCur = Lobby.Actions.JOIN_STATUS.BEGIN
			self.minInitialCount = 0
			self.updateTime = nil
			self.firstResultTime = nil
			self.searchTime = nil
			self.qosResultsValid = {}
			self.qosResultsInvalid = {}
			self.joiningNumHosts = 0
			self.joiningCurHost = 1
			local filteredResult = self.searchAction.filteredResult
			if filteredResult == nil then
				error( "QoSJoinSearchResults: self.searchAction.filteredResult should not be nil" )
				filteredResult = {}
			end
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, num of search results passed " .. #filteredResult .. " for QoS.\n" )
			if #filteredResult == 0 then
				LobbyVM.ProcessCompleteFailure( {
					actionId = self.actionId
				} )
				return 
			end
			LobbyVM.LobbyStatusUpdate( {
				searchStage = 2,
				numResults = #filteredResult,
				contactedResults = 0
			} )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, starting probes.\n" )
			local retVal = Engine.QoSProbeInitiate( self.actionId, self.sourceLobbyType, filteredResult )
			if retVal == false then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, QoSProbeInitiate failed.\n" )
				LobbyVM.ProcessCompleteFailure( {
					actionId = self.actionId
				} )
			end
			self.minInitialCount = #filteredResult * Dvar.qos_minPercent:get() / 100
			self.minInitialCount = math.max( self.minInitialCount, Dvar.qos_minProbes:get() )
			self.joinStatusCur = Lobby.Actions.JOIN_STATUS.BEGIN
			self.firstResultTime = Engine.milliseconds()
			self.updateTime = Engine.milliseconds()
			self.searchTime = Engine.milliseconds()
		end,
		pumpFuncPtr = function ( self )
			if self.joinStatusCur == Lobby.Actions.JOIN_STATUS.BEGIN then
				local now = Engine.milliseconds()
				if now < self.searchTime then
					return 
				elseif #self.qosResultsValid == 0 and #self.searchAction.filteredResult <= #self.qosResultsInvalid then
					Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults::pumpFuncPtr, Not expecting any results to join, QoSJoinSearchResults failed.\n" )
					LobbyVM.ProcessCompleteFailure( {
						actionId = self.actionId
					} )
					return 
				end
				local startJoin = false
				if self.minInitialCount <= #self.qosResultsValid then
					if now - self.firstResultTime > Dvar.qos_firstUpdateMS:get() then
						if now - self.updateTime > Dvar.qos_lastUpdateMS:get() then
							startJoin = true
						else
							Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, waiting for last update to settle.\n" )
						end
					else
						Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, waiting for first update to settle.\n" )
					end
				else
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, waiting for " .. self.minInitialCount .. " initial results. Current: " .. #self.qosResultsValid .. ".\n" )
				end
				if #self.searchAction.filteredResult <= #self.qosResultsInvalid + #self.qosResultsValid then
					startJoin = true
				end
				if startJoin then
					local qosSort = function ( a, b )
						if a.priorityLow ~= b.priorityLow then
							return not a.priorityLow
						else
							local latA = math.floor( a.latency / 25 )
							local latB = math.floor( b.latency / 25 )
							if latA == latB then
								if a.isMatchEndingSoon == b.isMatchEndingSoon then
									return a.numAvailableSlots < b.numAvailableSlots
								else
									return b.isMatchEndingSoon
								end
							else
								return latA < latB
							end
						end
					end
					
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, num of initial results returned " .. #self.qosResultsValid .. ".\n" )
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, begin join.\n" )
					Engine.LobbyJoinBegin( self.actionId, self.controller, self.sourceLobbyType, self.targetLobbyType )
					table.sort( self.qosResultsValid, qosSort )
					for index, qosResult in ipairs( self.qosResultsValid ) do
						Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Attempting to join xuid: " .. qosResult.xuidstr .. ".\n" )
						self.joiningNumHosts = self.joiningNumHosts + 1
						LobbyVM.LobbyStatusUpdate( {
							searchStage = 3,
							joiningCurHost = self.joiningCurHost,
							joiningNumHosts = self.joiningNumHosts
						} )
						Engine.LobbyJoinAdd( qosResult.xuid, qosResult.gameSecurityId, qosResult.gameSecurityKey, qosResult.hostAddress )
						Lobby.Debug.SessionSQJJoinInitiate( qosResult.xuid )
					end
					self.joinStatusCur = Lobby.Actions.JOIN_STATUS.ADD
				end
			elseif self.joinStatusCur == Lobby.Actions.JOIN_STATUS.ADD then
				local filteredResult = self.searchAction.filteredResult
				if #self.qosResultsValid < #filteredResult and Engine.milliseconds() - self.firstResultTime < Dvar.qos_maxProbeWait:get() then
					return 
				end
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, finalize join.\n" )
				self.joinStatusCur = Lobby.Actions.JOIN_STATUS.FINALIZE
				Engine.LobbyJoinFinalize()
			end
		end,
		updateFuncPtr = function ( self, data )
			if data.joinResult then
				Lobby.Debug.SessionSQJJoinResult( data )
				self.joiningCurHost = math.min( self.joiningCurHost + 1, self.joiningNumHosts )
				LobbyVM.LobbyStatusUpdate( {
					searchStage = 3,
					joiningCurHost = self.joiningCurHost,
					joiningNumHosts = self.joiningNumHosts
				} )
				return 
			end
			Lobby.Debug.SessionSQJQoSResult( data )
			local qosResult = nil
			if data.validResult == false then
				qosResult = {
					validResult = data.validResult,
					xuid = data.xuid,
					xuidstr = data.xuidstr
				}
				self.qosResultsInvalid[#self.qosResultsInvalid + 1] = qosResult
				LuaUtils.LogQoS( "invalid_qos", qosResult )
				return 
			end
			qosResult = {
				validResult = data.validResult,
				xuid = data.xuid,
				xuidstr = data.xuidstr,
				gameSecurityId = data.gameSecurityId,
				gameSecurityKey = data.gameSecurityKey,
				hostAddress = data.hostAddress,
				protocol = data.protocol,
				isMP = data.isMP,
				isMigrating = data.isMigrating,
				numAvailableSlots = data.numAvailableSlots,
				maxLocalPlayersAllowed = data.maxLocalPlayersAllowed,
				allowGuests = data.allowGuests,
				isMatchEndingSoon = data.isMatchEndingSoon,
				isMatchLoading = data.isMatchLoading,
				isDedicated = data.isDedicated,
				hostXuid = data.hostXuid,
				skill = data.skill,
				largestParty = data.largestParty,
				latency = data.latency,
				minLatency = data.minLatency,
				realAddr = data.realAddr
			}
			if data.numAvailableSlots <= 0 then
				table.insert( self.qosResultsInvalid, qosResult )
				LuaUtils.LogQoS( "ignore_qos_full", qosResult )
				return 
			end
			local f120_local0 = data.isDedicated
			if f120_local0 then
				f120_local0 = data.largestParty == 0
			end
			if LuaUtils.IsArenaMode() and not f120_local0 then
				local arenaSlot = Engine.GetCurrentArenaSlot()
				local skill = Engine.GetArenaPoints( controller, arenaSlot )
				local skillRange = Lobby.MatchmakingArena.GetArenaSkillRange( true )
				local skillDelta = math.floor( math.abs( qosResult.skill - skill ) )
				if skillRange < skillDelta then
					table.insert( self.qosResultsInvalid, qosResult )
					LuaUtils.LogQoS( "ignore_qos_skill", qosResult )
					return 
				end
			end
			if qosResult.isDedicated == true then
				if qosResult.latency * 1000 > Dvar.lobbySearchDediUnparkPingLimit:get() then
					table.insert( self.qosResultsInvalid, qosResult )
					LuaUtils.LogQoS( "ignore_qos_latency", qosResult )
					return 
				end
			elseif qosResult.latency * 1000 > Dvar.qosMaxAllowedPing:get() then
				table.insert( self.qosResultsInvalid, qosResult )
				LuaUtils.LogQoS( "ignore_qos_latency", qosResult )
				return 
			end
			LuaUtils.LogQoS( "valid_qos", qosResult )
			self.updateTime = Engine.milliseconds()
			if #self.qosResultsValid == 0 then
				self.firstResultTime = self.updateTime
			end
			qosResult.priorityLow = Lobby.MatchmakingPriority.IsPriorityLow( qosResult.gameSecurityId )
			self.qosResultsValid[#self.qosResultsValid + 1] = qosResult
			LobbyVM.LobbyStatusUpdate( {
				searchStage = 2,
				numResults = #self.searchAction.filteredResult,
				contactedResults = #self.qosResultsValid
			} )
			if self.joinStatusCur == Lobby.Actions.JOIN_STATUS.START then
				
			elseif self.joinStatusCur == Lobby.Actions.JOIN_STATUS.ADD then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Attempting to join xuid: " .. qosResult.xuidstr .. ".\n" )
				self.joiningNumHosts = self.joiningNumHosts + 1
				LobbyVM.LobbyStatusUpdate( {
					searchStage = 3,
					joiningCurHost = self.joiningCurHost,
					joiningNumHosts = self.joiningNumHosts
				} )
				Engine.LobbyJoinAdd( qosResult.xuid, qosResult.gameSecurityId, qosResult.gameSecurityKey, qosResult.hostAddress )
			elseif self.joinStatusCur == Lobby.Actions.JOIN_STATUS.FINALIZE then
				
			else
				
			end
		end,
		endFuncPtr = function ( self )
			Engine.QoSCancelProbes()
			Engine.LobbyJoinErrorShutdown()
		end,
		cancelFuncPtr = function ( self )
			Engine.QoSCancelProbes()
			Engine.LobbyJoinErrorShutdown()
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.JoinSearchResults = function ( controller, searchAction )
	local process = {
		name = "JoinSearchResults",
		controller = controller,
		searchAction = searchAction,
		sourceLobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		targetLobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		startFuncPtr = function ( self )
			local filteredResult = self.searchAction.filteredResult
			if filteredResult == nil then
				error( "JoinSearchResults: self.searchAction.filteredResult should not be nil" )
				filteredResult = {}
			end
			if #filteredResult == 0 then
				LobbyVM.ProcessCompleteFailure( {
					actionId = self.actionId
				} )
				return 
			end
			Engine.LobbyJoinBegin( self.actionId, self.controller, self.sourceLobbyType, self.targetLobbyType )
			for index, result in ipairs( filteredResult ) do
				Engine.LobbyJoinAdd( result.xuid, result.gameSecurityId, result.gameSecurityKey, result.hostAddress )
			end
			Engine.LobbyJoinFinalize()
		end
	}
	return process
end

Lobby.Actions.AdvertiseLobby = function ( onOff )
	local process = {
		name = "AdvertiseLobby",
		onOff = onOff,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		startFuncPtr = function ( self )
			Lobby.Matchmaking.SetupAdvertising()
			Engine.AdvertiseLobby( self.actionId, self.lobbyType, self.onOff )
		end,
		errorFuncPtr = function ( self )
			local errorMessageDebug = ""
			local errorMessageDebug = ""
			if self.onOff == true then
				errorMessage = Engine.Localize( "MENU_NO_SESSIONS" )
				errorMessageDebug = "Failed to turn on lobby advertising"
			else
				errorMessageDebug = "Failed to turn off lobby advertising"
			end
			if not Engine.IsDevelopmentBuild() then
				return errorMessage
			else
				return errorMessage .. "\n\nDEBUG INFO: AdvertiseLobby( " .. errorMessageDebug .. " )\n"
			end
		end
	}
	return process
end

Lobby.Actions.LobbyInfoProbe = function ( controller, info )
	local process = {
		name = "InfoProbe",
		controller = controller,
		info = info,
		probeResult = nil,
		startFuncPtr = function ( self )
			Engine.LobbyInfoProbe( self.actionId, self.controller, self.info.xuid )
		end,
		endFuncPtr = function ( self )
			self.probeResult = self.retData
			self.probeResult.probedXuid = self.info.xuid
		end
	}
	return process
end

Lobby.Actions.ShowFirstTimeFlowError = function ( infoFirstTimeFlow )
	local process = {
		name = "ErrorPopupMsg",
		info = infoFirstTimeFlow,
		startFuncPtr = function ( self )
			local errorMessage = nil
			if self.info.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
				errorMessage = Engine.Localize( "MPUI_MP_INTRO_REQUIRED_DESC" )
			elseif self.info.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
				errorMessage = Engine.Localize( "MENU_CP_FIRST_TIME_FLOW_REQUIRED_DESC" )
			else
				errorMessage = Engine.Localize( "MENU_JOIN_RESULT_NOT_JOINABLE" )
			end
			LuaUtils.UI_ShowErrorMessageDialog( nil, errorMessage )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.CheckFirstTimeFlowRequirements = function ( controller, infoProbe )
	local process = {
		name = "CheckfirstTimeFlow",
		controller = controller,
		info = infoProbe,
		mainMode = nil,
		startFuncPtr = function ( self )
			if Dvar.livestats_skipFirstTime:get() then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
				return 
			else
				self.mainMode = self.info.probeResult.mainMode
				local eMode = LuaUtils.LobbyMainModeToEModes( self.info.probeResult.mainMode )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
			end
		end
	}
	return process
end

Lobby.Actions.JoinHost = function ( controller, mainMode, networkMode, hostXuid, hostInfo, sourceLobbyType, destLobbyType )
	local process = {
		name = "LobbyJoinHost",
		controller = controller,
		mainMode = mainMode,
		networkMode = networkMode,
		hostXuid = hostXuid,
		hostInfo = hostInfo,
		joinResults = {},
		startFuncPtr = function ( self )
			Engine.JoinHost( self.actionId, self.controller, sourceLobbyType, destLobbyType, self.hostXuid, self.hostInfo )
		end,
		updateFuncPtr = function ( self, data )
			self.joinResults[#self.joinResults + 1] = data
		end,
		errorFuncPtr = function ( self )
			local errorMessage = Engine.Localize( "MENU_JOIN_RESULT_NOT_JOINABLE" )
			if self.joinResult == nil and #self.joinResults == 0 then
				return errorMessage
			else
				local joinResult = self.joinResults[#self.joinResults].joinResult
				local joinResultInfo = Lobby.Join.JoinResultToString( joinResult, true )
				errorMessage = Engine.Localize( joinResultInfo.errorMsg )
				if not Engine.IsDevelopmentBuild() then
					return errorMessage
				else
					return errorMessage .. "\n\nDEBUG INFO: JoinResult( " .. tostring( joinResult ) .. " )\n" .. joinResultInfo.debug
				end
			end
		end
	}
	return process
end

Lobby.Actions.LobbyJoinXUID = function ( controller, info, joinType )
	local process = {
		name = "LobbyJoinXUID",
		controller = controller,
		info = info,
		joinType = joinType,
		joinResults = {},
		startFuncPtr = function ( self )
			Engine.JoinXUID( self.actionId, self.controller, self.info.xuid, self.joinType )
		end,
		updateFuncPtr = function ( self, data )
			self.joinResults[#self.joinResults + 1] = data
		end,
		endFuncPtr = function ( self )
			
		end,
		errorFuncPtr = function ( self )
			local errorMessage = Engine.Localize( "MENU_JOIN_RESULT_NOT_JOINABLE" )
			if #self.joinResults == 0 then
				return errorMessage
			else
				local joinResult = self.joinResults[#self.joinResults].joinResult
				local joinResultInfo = Lobby.Join.JoinResultToString( joinResult, true )
				errorMessage = Engine.Localize( joinResultInfo.errorMsg )
				if not Engine.IsDevelopmentBuild() then
					return errorMessage
				else
					return errorMessage .. "\n\nDEBUG INFO: JoinResult( " .. tostring( joinResult ) .. " )\n" .. joinResultInfo.debug
				end
			end
		end
	}
	return process
end

Lobby.Actions.LobbyJoinXUIDExt = function ( controller, joinType, infoProbe, destinationLobby )
	local process = {
		name = "LobbyJoinXUIDExt",
		controller = controller,
		joinType = joinType,
		infoProbe = infoProbe,
		destinationLobby = destinationLobby,
		joinResults = {},
		startFuncPtr = function ( self )
			local probeResult = self.infoProbe.probeResult
			local probedXuid = probeResult.probedXuid
			local destinationLobby = self.destinationLobby
			local joinLobby = nil
			if destinationLobby == Enum.LobbyType.LOBBY_TYPE_COUNT then
				if probeResult.gameLobby.isValid == true then
					destinationLobby = Enum.LobbyType.LOBBY_TYPE_GAME
					joinLobby = probeResult.gameLobby
				else
					destinationLobby = Enum.LobbyType.LOBBY_TYPE_PRIVATE
					joinLobby = probeResult.privateLobby
				end
			elseif destinationLobby == Enum.LobbyType.LOBBY_TYPE_GAME then
				joinLobby = probeResult.gameLobby
			else
				joinLobby = probeResult.privateLobby
			end
			local ret = Engine.JoinXUIDExt( self.actionId, self.controller, joinLobby.isValid, joinLobby.hostXuid, joinLobby.hostName, destinationLobby, joinLobby.secId, joinLobby.secKey, joinLobby.serializedAdr, self.joinType, probedXuid )
			if ret == false then
				LobbyVM.ProcessCompleteError( {
					actionId = self.actionId
				} )
			end
		end,
		updateFuncPtr = function ( self, data )
			self.joinResults[#self.joinResults + 1] = data
		end,
		endFuncPtr = function ( self )
			
		end,
		errorFuncPtr = function ( self )
			local remoteNatType = Enum.XONLINE_NAT_TYPE.XONLINE_NAT_OPEN
			if self.infoProbe ~= nil and self.infoProbe.probeResult ~= nil and self.infoProbe.probeResult.natType ~= nil then
				remoteNatType = self.infoProbe.probeResult.natType
			end
			local isCompatible = LuaUtils.IsCompatibleNatConnection( remoteNatType )
			local errorMessage = Engine.Localize( "MENU_JOIN_RESULT_NOT_JOINABLE" )
			if #self.joinResults == 0 then
				if isCompatible == false then
					errorMessage = Engine.Localize( "MENU_JOIN_RESULT_NOT_JOINABLE_NAT_TYPE" )
				end
				return errorMessage
			end
			local joinResult = self.joinResults[#self.joinResults].joinResult
			local joinResultInfo = Lobby.Join.JoinResultToString( joinResult, true )
			if isCompatible == false and (joinResult == Enum.JoinResult.JOIN_RESULT_HANDSHAKE_WINDOW_EXPIRED or joinResult == Enum.JoinResult.JOIN_RESULT_INVALID) then
				errorMessage = Engine.Localize( "MENU_JOIN_RESULT_NOT_JOINABLE_NAT_TYPE" )
			else
				errorMessage = Engine.Localize( joinResultInfo.errorMsg )
			end
			if not Engine.IsDevelopmentBuild() then
				return errorMessage
			end
			return errorMessage .. "\n\nDEBUG INFO: JoinResult( " .. tostring( joinResult ) .. " )\n" .. joinResultInfo.debug
		end
	}
	return process
end

Lobby.Actions.LobbyJoinSession = function ( controller, destinationLobby, joinType )
	local process = {
		name = "LobbyJoinSession",
		controller = controller,
		destinationLobby = destinationLobby,
		joinType = joinType,
		joinResults = {},
		startFuncPtr = function ( self )
			local lobbyHost = Engine.GetLobbyHostInfo( Enum.LobbyModule.LOBBY_MODULE_HOST, self.destinationLobby )
			if lobbyHost == nil then
				LobbyVM.ProcessCompleteError( {
					actionId = self.actionId
				} )
				return 
			else
				local ret = Engine.JoinXUIDExt( self.actionId, self.controller, true, lobbyHost.xuid, lobbyHost.name, destinationLobby, lobbyHost.secIdint, lobbyHost.secKey, lobbyHost.serializedAdr, self.joinType, lobbyHost.xuid )
				if ret == false then
					LobbyVM.ProcessCompleteError( {
						actionId = self.actionId
					} )
					return 
				else
					
				end
			end
		end,
		updateFuncPtr = function ( self, data )
			self.joinResults[#self.joinResults + 1] = data
		end,
		endFuncPtr = function ( self )
			
		end,
		errorFuncPtr = function ( self )
			local remoteNatType = Enum.XONLINE_NAT_TYPE.XONLINE_NAT_OPEN
			if self.infoProbe ~= nil and self.infoProbe.probeResult ~= nil and self.infoProbe.probeResult.natType ~= nil then
				remoteNatType = self.infoProbe.probeResult.natType
			end
			local isCompatible = LuaUtils.IsCompatibleNatConnection( remoteNatType )
			local errorMessage = Engine.Localize( "MENU_JOIN_RESULT_NOT_JOINABLE" )
			if #self.joinResults == 0 then
				if isCompatible == false then
					errorMessage = Engine.Localize( "MENU_JOIN_RESULT_NOT_JOINABLE_NAT_TYPE" )
				end
				return errorMessage
			end
			local joinResult = self.joinResults[#self.joinResults].joinResult
			local joinResultInfo = Lobby.Join.JoinResultToString( joinResult, true )
			if isCompatible == false and (joinResult == Enum.JoinResult.JOIN_RESULT_HANDSHAKE_WINDOW_EXPIRED or joinResult == Enum.JoinResult.JOIN_RESULT_INVALID) then
				errorMessage = Engine.Localize( "MENU_JOIN_RESULT_NOT_JOINABLE_NAT_TYPE" )
			else
				errorMessage = Engine.Localize( joinResultInfo.errorMsg )
			end
			if not Engine.IsDevelopmentBuild() then
				return errorMessage
			end
			return errorMessage .. "\n\nDEBUG INFO: JoinResult( " .. tostring( joinResult ) .. " )\n" .. joinResultInfo.debug
		end
	}
	return process
end

Lobby.Actions.WaitForJoiningClients = function ( waitMilliseconds )
	local process = {
		name = "WaitForJoiningClients",
		waitMilliseconds = waitMilliseconds,
		endWaitTime = nil,
		startFuncPtr = function ( self )
			self.endWaitTime = self.waitMilliseconds + Engine.milliseconds()
			local waitingOnClients = Engine.LobbyJoinCount()
			if waitingOnClients == 0 then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
			end
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "WaitForJoiningClients start, number of joining clients: " .. waitingOnClients .. ". Waiting " .. self.waitMilliseconds .. "ms for clients to join.\n" )
		end,
		pumpFuncPtr = function ( self )
			local waitingOnClients = Engine.LobbyJoinCount()
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "WaitForJoiningClients pump, number of clients still joining: " .. waitingOnClients .. ". Waiting for " .. self.endWaitTime - Engine.milliseconds() .. "ms\n" )
			if self.endWaitTime < Engine.milliseconds() then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "WaitForJoiningClients pump stop, number of clients still joining: " .. waitingOnClients .. ". Clients took to long to join.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
				return 
			elseif waitingOnClients == 0 then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "WaitForJoiningClients pump stop, All clients have joined.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
				return 
			else
				
			end
		end,
		cancelFuncPtr = function ( self )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.LobbySettings = function ( controller, toTarget, skipSwitchMode, isDevMap )
	local process = {
		name = "LobbySettings",
		controller = controller,
		toTarget = toTarget,
		skipSwitchMode = skipSwitchMode,
		isDevMap = isDevMap,
		startFuncPtr = function ( self )
			LobbyVM.OnLobbySettings( {
				controller = controller,
				toTarget = toTarget,
				skipSwitchMode = skipSwitchMode,
				isDevMap = isDevMap
			} )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.SetQueueCancellable = function ( cancellable )
	local process = {
		name = "SetQueueCancellable",
		startFuncPtr = function ( self )
			Lobby.ProcessQueue.SetCancellable( cancellable )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.UpdateUI = function ( controller, toTarget )
	local process = {
		name = "UpdateUI",
		require = "LobbySettings",
		controller = controller,
		toTarget = toTarget,
		startFuncPtr = function ( self )
			LobbyVM.OnUpdateUI( {
				controller = controller,
				toTarget = toTarget
			} )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.SetNetworkMode = function ( controller, networkMode )
	local process = {
		name = "SetNetworkMode",
		controller = controller,
		networkMode = networkMode,
		startFuncPtr = function ( self )
			Engine.SetLobbyNetworkMode( self.networkMode )
			Engine.Exec( self.controller, "savegameRestore" )
			Engine.ExecNow( self.controller, "invalidateEmblemComponent" )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.PromoteToHostDone = function ( controller, lobbyType, migrateIndexBits, isInGame )
	local process = {
		name = "promoteToHostDone",
		controller = controller,
		lobbyType = lobbyType,
		migrateIndexBits = migrateIndexBits,
		isInGame = isInGame,
		startFuncPtr = function ( self )
			Engine.LobbyHostMigrateSetIndexBits( self.lobbyType, self.migrateIndexBits )
			Engine.LobbySetMap( self.lobbyType, Dvar.ui_mapname:get() )
			Engine.LobbySetGameType( self.lobbyType, Dvar.ui_gametype:get() )
			Engine.PromoteToHostDone( self.controller, self.lobbyType, self.isInGame )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.SignUserInToLive = function ( controller )
	local process = {
		name = "SignUserInToLive",
		controller = controller,
		startFuncPtr = function ( self )
			Engine.SignUserIntoLive( self.controller )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.SignUserOutOfLive = function ( controller, networkMode )
	local process = {
		name = "SignUserOutOfLive",
		controller = controller,
		networkMode = networkMode,
		startFuncPtr = function ( self )
			Engine.SignUserOutOfLive( self.controller )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.PlatformSessionGetSessionInfo = function ( controller, lobbyType, sessionId )
	local process = {
		name = "PlatformSessionGetSessionInfo",
		controller = controller,
		lobbyType = lobbyType,
		sessionId = sessionId,
		info = {},
		gamertag = nil,
		gamertags = nil,
		startFuncPtr = function ( self )
			if Lobby.Platform.PlatformSessionOrbisEnabled() == false or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
				return 
			elseif Engine.PlatformSessionPS4GetSessionInfo( self.actionId, self.controller, self.lobbyType, self.sessionId ) == false then
				LobbyVM.ProcessCompleteFailure( {
					actionId = self.actionId
				} )
				return 
			else
				
			end
		end,
		endFuncPtr = function ( self )
			if Lobby.Platform.PlatformSessionOrbisEnabled() == false or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
				return 
			elseif self.retData.isError == true then
				return 
			end
			self.info = {
				sessionId = self.retData.sessionId,
				sessionName = self.retData.sessionName,
				sessionStatus = self.retData.sessionStatus,
				sessionType = self.retData.sessionType,
				sessionPrivacy = self.retData.sessionPrivacy,
				locked = self.retData.locked,
				maxSlots = self.retData.maxSlots,
				creationTime = self.retData.creationTime,
				sessionCreatorGamertag = self.retData.sessionCreatorGamertag,
				sessionCreatorPlatform = self.retData.sessionCreatorPlatform,
				members = self.retData.members
			}
			if #self.info.members > 0 then
				self.gamertag = self.info.members[#self.info.members].gamertag
				self.gamertags = {}
				for member = 1, #self.info.members, 1 do
					self.gamertags[member] = self.info.members[member].gamertag
				end
			end
		end
	}
	return process
end

Lobby.Actions.PlatformSessionGetInviteInfo = function ( controller, xuid, lobbyType, invitationId )
	local process = {
		name = "PlatformSessionGetInviteInfo",
		controller = controller,
		lobbyType = lobbyType,
		invitationId = invitationId,
		xuid = xuid,
		info = {},
		gamertag = nil,
		gamertags = nil,
		startFuncPtr = function ( self )
			if Lobby.Platform.PlatformSessionOrbisEnabled() == false or Engine.IsDemonwareFetchingDone( controller ) == false then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
				return 
			elseif Engine.PlatformSessionPS4GetInviteInfo( self.actionId, self.controller, self.xuid, self.lobbyType, self.invitationId ) == false then
				LobbyVM.ProcessCompleteFailure( {
					actionId = self.actionId
				} )
				return 
			else
				
			end
		end,
		endFuncPtr = function ( self )
			if Lobby.Platform.PlatformSessionOrbisEnabled() == false or Engine.IsDemonwareFetchingDone( self.controller ) == false then
				return 
			elseif self.retData.isError == true then
				return 
			else
				self.info.receivedDate = self.retData.receivedDate
				self.info.usedFlag = self.retData.usedFlag
				self.info.expired = self.retData.expired
				self.info.message = self.retData.message
				self.info.fromGamertag = self.retData.fromGamertag
				self.info.invitationId = self.retData.invitationId
				self.info.sessionId = self.retData.sessionId
				self.gamertag = self.retData.fromGamertag
				self.gamertags = {}
				self.gamertags[1] = self.gamertag
			end
		end
	}
	return process
end

Lobby.Actions.GamertagsToXuids = function ( controller, info )
	local process = {
		name = "PlatformSessionJoin",
		controller = controller,
		info = info,
		startFuncPtr = function ( self )
			if info.gamertags == nil or #info.gamertags == 0 then
				LobbyVM.ProcessCompleteFailure( {
					actionId = self.actionId
				} )
				return 
			elseif Engine.GamertagsToXuids( self.actionId, self.controller, self.info.gamertags ) == false then
				LobbyVM.ProcessCompleteFailure( {
					actionId = self.actionId
				} )
				return 
			else
				
			end
		end,
		endFuncPtr = function ( self )
			if self.retData.isError == true then
				return 
			elseif self.retData.userInfo == nil or #self.retData.userInfo == 0 then
				self.gamertag = ""
				self.xuid = 0
				return 
			else
				self.gamertag = self.retData.userInfo[1].gamertag
				self.xuid = self.retData.userInfo[1].xuid
			end
		end
	}
	return process
end

Lobby.Actions.SetGameAndTypeMapName = function ( controller, lobbyType, gameType, mapName )
	local process = {
		name = "SetGameAndTypeMapName",
		controller = controller,
		lobbyType = lobbyType,
		gameType = gameType,
		mapName = mapName,
		startFuncPtr = function ( self )
			Engine.LobbySetMap( self.lobbyType, self.mapName )
			Engine.LobbySetGameType( self.lobbyType, self.gameType )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.SetSavedOrDefaultMap = function ( controller, toTarget )
	local process = {
		name = "SetSavedOrDefaultMap",
		controller = controller,
		startFuncPtr = function ( self )
			local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST )
			if Engine.IsCampaignGame() then
				local map = Engine.GetSavedMap()
				if string.len( map ) == 0 then
					map = LuaUtils.GetDefaultMap( toTarget )
				end
				Dvar.ui_mapname:set( map )
				Dvar.cp_queued_level:set( Engine.GetSavedMapQueuedMap() )
				Engine.LobbySetMap( lobbyType, map )
			end
			if toTarget == LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_CUSTOM ) then
				Engine.LobbyHostSetOfficialCustomGame( lobbyType, true )
			end
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.PlayTogetherBeginPlayWait = function ( controller )
	local process = {
		name = "PlayTogetherBeginPlayWait",
		controller = controller,
		startFuncPtr = function ( self )
			
		end,
		pumpFuncPtr = function ( self, data )
			local currentMenuIdx = Engine.GetLobbyUIScreen()
			local f187_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_LAN )
			if currentMenuIdx ~= f187_local0.id then
				f187_local0 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_ONLINE )
				if currentMenuIdx == f187_local0.id then
					LobbyVM.ProcessCompleteSuccess( {
						actionId = self.actionId
					} )
					return 
				elseif Engine.GetModel( Engine.GetModelForController( self.controller ), "SystemOverlay_MessageDialog.buttonPrompts" ) ~= nil then
					LobbyVM.ProcessCompleteFailure( {
						actionId = self.actionId
					} )
				end
			end
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
			return 
		end,
		cancelFuncPtr = function ( self )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.PlayTogetherPSNSessionWait = function ( controller, oldSessionId )
	local process = {
		name = "PlayTogetherPSNSessionWait( old session id: " .. oldSessionId .. ")",
		nonPSNSessionBlocking = true,
		controller = controller,
		oldSessionId = oldSessionId,
		startFuncPtr = function ( self )
			
		end,
		pumpFuncPtr = function ( self, data )
			if Lobby.Platform.PS4.taskInProgress == true then
				return 
			else
				local sessionId = Lobby.Platform.PS4GetSessionId( controller )
				if string.len( sessionId ) > 0 and self.oldSessionId ~= sessionId then
					LobbyVM.ProcessCompleteSuccess( {
						actionId = self.actionId
					} )
					return 
				else
					
				end
			end
		end,
		cancelFuncPtr = function ( self )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

