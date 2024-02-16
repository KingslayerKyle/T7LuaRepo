require( "lua.Lobby.Common.LobbyCore" )

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
Lobby.Actions.ExecuteScript = function ( inlineFunction )
	local process = {
		name = "ExecuteScript",
		inlineFunction = inlineFunction,
		startFuncPtr = function ( self )
			self.inlineFunction()
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

Lobby.Actions.OpenSpinner = function ( showCancelButton )
	local process = {
		name = "OpenSpinner",
		showCancelButton = showCancelButton,
		startFuncPtr = function ( self )
			if self.showCancelButton == nil then
				self.showCancelButton = false
			end
			Engine.LuiVM_Event( "lobby_spinner_popup", {
				openPopup = true,
				showCancelButton = self.showCancelButton,
				immediate = true
			} )
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
			Engine.LuiVM_Event( "lobby_spinner_popup", {
				openPopup = false,
				actionId = self.actionId
			} )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

Lobby.Actions.ConnectingToDemonware = function ( controller, waitMilliseconds )
	local process = {
		name = "ConnectingToDemonware(check for " .. waitMilliseconds .. "ms)",
		controller = controller,
		waitMilliseconds = waitMilliseconds,
		endTime = nil,
		checkInterval = 100,
		checkTime = nil,
		startFuncPtr = function ( self )
			if self.waitMilliseconds == 0 and Engine.IsDemonwareFetchingDone( self.controller ) then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
				return 
			elseif Engine.GetLobbyUIScreen() == LobbyData.UITargets.UI_MAIN.id then
				Engine.SetLobbyNetworkMode( Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
			end
			Engine.LiveConnectEnableDemonwareConnect()
			self.endTime = self.waitMilliseconds + Engine.milliseconds()
			self.checkTime = self.checkInterval + Engine.milliseconds()
		end,
		pumpFuncPtr = function ( self, data )
			if self.checkTime > Engine.milliseconds() then
				return 
			else
				self.checkTime = self.checkInterval + Engine.milliseconds()
				if Engine.IsDemonwareFetchingDone( self.controller ) == true then
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
				valueMatch = dvarValue == Engine.DvarBool( 0, dvarName )
			elseif dvarType == Enum.dvarType_t.DVAR_TYPE_FLOAT then
				valueMatch = dvarValue == Engine.DvarFloat( dvarName )
			elseif dvarType == Enum.dvarType_t.DVAR_TYPE_INT then
				valueMatch = dvarValue == Engine.DvarInt( 0, dvarName )
			elseif dvarType == Enum.dvarType_t.DVAR_TYPE_STRING then
				valueMatch = dvarValue == Engine.DvarString( 0, dvarName )
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

Lobby.Actions.ErrorPopupMsg = function ( message )
	local process = {
		name = "ErrorPopupMsg",
		message = message,
		startFuncPtr = function ( self )
			LuaUtils.UI_ShowErrorMessageDialog( nil, self.message )
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

Lobby.Actions.SwitchMode = function ( controller, toMode )
	local process = {
		name = "SwitchMode",
		controller = controller,
		toMode = toMode,
		startFuncPtr = function ( self )
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
		name = "LobbyHostStart",
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
		name = "LobbyHostStartMigrate",
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
		name = "LobbyHostEnd",
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
		name = "LobbyHostAddPrimary",
		lobbyType = lobbyType,
		startFuncPtr = function ( self )
			Engine.LobbyHostAddPrimary( self.actionId, self.lobbyType )
		end
	}
	return action
end

Lobby.Actions.LobbyHostAddLocal = function ( controller, lobbyType )
	local action = {
		name = "LobbyHostAddLocal",
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
		name = "LobbyClientStart",
		lobbyType = lobbyType,
		startFuncPtr = function ( self )
			Engine.LobbyClientStart( self.actionId, self.lobbyType )
		end
	}
	return action
end

Lobby.Actions.LobbyClientEnd = function ( lobbyType )
	local action = {
		name = "LobbyClientEnd",
		lobbyType = lobbyType,
		startFuncPtr = function ( self )
			Engine.LobbyClientEnd( self.actionId, self.lobbyType )
		end
	}
	return action
end

Lobby.Actions.LobbyLocalClientLeave = function ( lobbyType, controller )
	local action = {
		name = "LobbyClientEnd",
		lobbyType = lobbyType,
		controller = controller,
		startFuncPtr = function ( self )
			Engine.LobbyLocalClientLeave( self.actionId, self.lobbyType, self.controller )
		end
	}
	return action
end

Lobby.Actions.LeaveWithParty = function ( waitMilliseconds )
	local process = {
		name = "LeaveWithParty(wait for " .. waitMilliseconds .. "ms)",
		waitMilliseconds = waitMilliseconds,
		endTime = nil,
		checkInterval = 50,
		checkTime = nil,
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
			self.checkTime = self.checkInterval + Engine.milliseconds()
		end,
		pumpFuncPtr = function ( self, data )
			if self.checkTime > Engine.milliseconds() then
				return 
			end
			self.checkTime = self.checkInterval + Engine.milliseconds()
			local lobbyListPrivate = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			local lobbyListGame = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
			local clientStillInGameLobby = false
			for iPrivate, cPrivate in ipairs( lobbyListPrivate.sessionClients ) do
				for iGame, cGame in ipairs( lobbyListGame.sessionClients ) do
					if REG9.isHost == false and Engine.CompareUInt64( REG9.xuid, cGame.xuid, "=" ) then
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

Lobby.Actions.CanHostServer = function ( controller, fromTargetLobbyType )
	local process = {
		name = "CanHostServer",
		controller = controller,
		fromTargetLobbyType = fromTargetLobbyType,
		failureReason = nil,
		startFuncPtr = function ( self )
			local maxClientCount = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
			local canHost, failureReason = Engine.CanHostServer( self.controller, maxClientCount )
			if canHost == true then
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
			end
			Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "CANNOT HOST A SERVER: " .. failureReasonStr .. ".\n" )
			LobbyVM.ProcessCompleteFailure( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

function GeoMinCheck( myGeo, host )
	if not Dvar.lobbySearchGeoMin:exists() then
		return true
	end
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
	return lobbySearchGeoMin == geoMatchCount
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
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "xuid, gameSecurityId, gameType, maxPlayers, numPlayers, serverType, showInMatchmaking, netcodeVersion, mapPacks, playlistVersion, playlistNumber, isEmpty, teamSizeMax, skill, geo_1, geo_2, geo_3, geo_4\n" )
			for index, host in ipairs( searchResults.remoteHosts ) do
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, Engine.UInt64ToString( host.xuid ) .. ", " .. Engine.UInt64ToString( f76_local4.gameSecurityId ) .. ", " .. f76_local4.gameType .. ", " .. f76_local4.maxPlayers .. ", " .. f76_local4.numPlayers .. ", " .. f76_local4.serverType .. ", " .. f76_local4.showInMatchmaking .. ", " .. f76_local4.netcodeVersion .. ", " .. f76_local4.mapPacks .. ", " .. f76_local4.playlistVersion .. ", " .. f76_local4.playlistNumber .. ", " .. f76_local4.isEmpty .. ", " .. f76_local4.teamSizeMax .. ", " .. f76_local4.skill .. ", " .. f76_local4.serverLocation .. ", " .. f76_local4.latencyBand .. ", " .. f76_local4.geo_1 .. ", " .. f76_local4.geo_2 .. ", " .. f76_local4.geo_3 .. ", " .. f76_local4.geo_4 .. ".\n" )
			end
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------------------------------------------------\n" )
			self.filteredResult = {}
			local myGeo = Engine.GetGeoLocation()
			local localHostXuid = Engine.GetLobbyHostXuid( self.lobbyType )
			local count = 1
			for index, host in ipairs( searchResults.remoteHosts ) do
				if Engine.CompareUInt64( localHostXuid, host.xuid, "=" ) == true then
					
				end
				hostOK = false
				if REG12.serverType == 2000 then
					latencytoserverlocation = Engine.GetPingForServerLocation( REG12.serverLocation )
					if REG12.latencyBand == 0 then
						hostOK = true
					elseif math.abs( REG12.latencyBand - latencytoserverlocation ) > Dvar.lobbySearchMaxLatencyBandDiff:get() then
						Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Rejecting result from serverlocation " .. REG12.serverLocation .. ", the latencyband is " .. REG12.latencyBand .. "ms and our latency is " .. latencytoserverlocation .. "\n" )
					else
						hostOK = true
					end
				elseif GeoMinCheck( myGeo, REG12 ) then
					hostOK = true
				end
				if hostOK then
					self.filteredResult[count] = {
						xuid = REG12.xuid,
						gameSecurityId = REG12.gameSecurityId,
						gameSecurityKey = REG12.gameSecurityKey,
						hostAddress = REG12.hostAddress
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
			self.minInitialCount = #filteredResult * 100 / Dvar.qos_minPercent:get()
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
					local latencySort = function ( a, b )
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
					
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, num of initial results returned " .. #self.qosResultsValid .. ".\n" )
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, begin join.\n" )
					Engine.LobbyJoinBegin( self.actionId, self.controller, self.sourceLobbyType, self.targetLobbyType )
					table.sort( self.qosResultsValid, latencySort )
					for index, qosResult in ipairs( self.qosResultsValid ) do
						Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Attempting to join xuid: " .. qosResult.xuidstr .. ".\n" )
						self.joiningNumHosts = self.joiningNumHosts + 1
						LobbyVM.LobbyStatusUpdate( {
							searchStage = 3,
							joiningCurHost = self.joiningCurHost,
							joiningNumHosts = self.joiningNumHosts
						} )
						Engine.LobbyJoinAdd( qosResult.xuid, REG8.gameSecurityId, REG8.gameSecurityKey, REG8.hostAddress )
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
				latency = data.latency,
				minLatency = data.minLatency,
				realAddr = data.realAddr
			}
			LuaUtils.LogQoS( "valid_qos", qosResult )
			self.updateTime = Engine.milliseconds()
			if #self.qosResultsValid == 0 then
				self.firstResultTime = self.updateTime
			end
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
			if #filteredResult == 0 then
				LobbyVM.ProcessCompleteFailure( {
					actionId = self.actionId
				} )
				return 
			end
			Engine.LobbyJoinBegin( self.actionId, self.controller, self.sourceLobbyType, self.targetLobbyType )
			for index, result in ipairs( filteredResult ) do
				Engine.LobbyJoinAdd( result.xuid, REG6.gameSecurityId, REG6.gameSecurityKey, REG6.hostAddress )
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
		end
	}
	return process
end

Lobby.Actions.JoinHost = function ( controller, mainMode, networkMode, hostXuid, hostInfo )
	local process = {
		name = "LobbyJoinHost",
		controller = controller,
		mainMode = mainMode,
		networkMode = networkMode,
		hostXuid = hostXuid,
		hostInfo = hostInfo,
		joinResults = {},
		startFuncPtr = function ( self )
			if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
				Engine.JoinHost( self.actionId, self.controller, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyType.LOBBY_TYPE_GAME, self.hostXuid, self.hostInfo )
			else
				Engine.JoinHost( self.actionId, self.controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyType.LOBBY_TYPE_GAME, self.hostXuid, self.hostInfo )
			end
		end,
		updateFuncPtr = function ( self, data )
			self.joinResults[#self.joinResults + 1] = data
		end,
		errorFuncPtr = function ( self )
			local errorMessage = Engine.Localize( "MENU_JOIN_RESULT_NOT_JOINABLE" )
			if #self.joinResults == 0 then
				return errorMessage
			else
				local joinResult = self.joinResults[#self.joinResults].joinResult
				local joinResultInfo = LobbyVM.JoinResultToString( joinResult, true )
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
				local joinResultInfo = LobbyVM.JoinResultToString( joinResult, true )
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
			local ret = Engine.JoinXUIDExt( self.actionId, self.controller, joinLobby.isValid, joinLobby.hostXuid, joinLobby.hostName, destinationLobby, joinLobby.secId, joinLobby.secKey, joinLobby.serializedAdr, self.joinType )
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
			local errorMessage = Engine.Localize( "MENU_JOIN_RESULT_NOT_JOINABLE" )
			if #self.joinResults == 0 then
				return errorMessage
			else
				local joinResult = self.joinResults[#self.joinResults].joinResult
				local joinResultInfo = LobbyVM.JoinResultToString( joinResult, true )
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

Lobby.Actions.LobbySettings = function ( controller, toTarget, skipSwitchMode )
	local process = {
		name = "LobbySettings",
		controller = controller,
		toTarget = toTarget,
		skipSwitchMode = skipSwitchMode,
		startFuncPtr = function ( self )
			LobbyVM.LobbySettings( {
				controller = controller,
				toTarget = toTarget,
				skipSwitchMode = skipSwitchMode
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
			LobbyVM.UpdateUI( {
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
			Engine.Exec( self.controller, "lobby_setmap " .. Dvar.ui_mapname:get() )
			Engine.Exec( self.controller, "lobby_setgametype " .. Dvar.ui_gametype:get() )
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

Lobby.Actions.PlatformSessionCreate = function ( controller, lobbyType, maxSlot )
	local process = {
		name = "PlatformSessionCreate",
		controller = controller,
		lobbyType = lobbyType,
		maxSlot = maxSlot,
		startFuncPtr = function ( self )
			if not Lobby.PlatformSession.PlatformSessionEnabled() or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE or Engine.IsDedicatedServer() then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
				return 
			else
				Dvar.platformSessionName:set( Engine.LocalizeWithoutLocsMarkers( "MENU_PLATFORM_SESSION_NAME" ) )
				Dvar.platformSessionStatus:set( "" )
				Dvar.platformSessionImgPath:set( "" )
				Dvar.platformSessionImg:set( "platform_session.png" )
				if Engine.PlatformSessionCreate( self.actionId, self.controller, self.lobbyType, self.maxSlot ) == false then
					LobbyVM.ProcessCompleteFailure( {
						actionId = self.actionId
					} )
					return 
				else
					
				end
			end
		end,
		endFuncPtr = function ( self )
			if not Lobby.PlatformSession.PlatformSessionEnabled() or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE or Engine.IsDedicatedServer() then
				return 
			else
				local retData = self.retData
				Lobby.PlatformSession.SetSessionId( retData.sessionId )
			end
		end
	}
	return process
end

Lobby.Actions.PlatformSessionUpdate = function ( controller, lobbyType, sessionId )
	local process = {
		name = "PlatformSessionUpdate",
		controller = controller,
		lobbyType = lobbyType,
		sessionId = sessionId,
		startFuncPtr = function ( self )
			if not Lobby.PlatformSession.PlatformSessionEnabled() or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE or Engine.IsDedicatedServer() then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
				return 
			else
				Dvar.platformSessionName:set( Engine.LocalizeWithoutLocsMarkers( "MENU_PLATFORM_SESSION_NAME" ) )
				Dvar.platformSessionStatus:set( "" )
				if Engine.PlatformSessionUpdate( self.actionId, self.controller, self.lobbyType, self.sessionId ) == false then
					LobbyVM.ProcessCompleteFailure( {
						actionId = self.actionId
					} )
					return 
				else
					
				end
			end
		end,
		endFuncPtr = function ( self )
			if not Lobby.PlatformSession.PlatformSessionEnabled() or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE or Engine.IsDedicatedServer() then
				return 
			else
				
			end
		end
	}
	return process
end

Lobby.Actions.PlatformSessionInvite = function ( controller, lobbyType, gamertag )
	local process = {
		name = "PlatformSessionInvite",
		controller = controller,
		lobbyType = lobbyType,
		gamertag = gamertag,
		startFuncPtr = function ( self )
			if not Lobby.PlatformSession.PlatformSessionEnabled() or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE or Engine.IsDedicatedServer() then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
				return 
			else
				local inviterGamertag = Engine.GetGamertagForController( controller )
				Dvar.platformSessionInviteMessage:set( Engine.LocalizeWithoutLocsMarkers( "MENU_GAME_INVITE_MESSAGE", inviterGamertag ) )
				if Engine.PlatformSessionInvite( self.actionId, self.controller, self.lobbyType, self.gamertag ) == false then
					LobbyVM.ProcessCompleteFailure( {
						actionId = self.actionId
					} )
					return 
				else
					
				end
			end
		end,
		endFuncPtr = function ( self )
			if not Lobby.PlatformSession.PlatformSessionEnabled() or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE or Engine.IsDedicatedServer() then
				return 
			else
				
			end
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
			if not Lobby.PlatformSession.PlatformSessionEnabled() or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE or Engine.IsDedicatedServer() then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
				return 
			elseif Engine.PlatformSessionGetSessionInfo( self.actionId, self.controller, self.lobbyType, self.sessionId ) == false then
				LobbyVM.ProcessCompleteFailure( {
					actionId = self.actionId
				} )
				return 
			else
				
			end
		end,
		endFuncPtr = function ( self )
			if not Lobby.PlatformSession.PlatformSessionEnabled() or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE or Engine.IsDedicatedServer() then
				return 
			elseif self.retData.returnCode ~= 0 then
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

Lobby.Actions.PlatformSessionGetInviteInfo = function ( controller, lobbyType, invitationId )
	local process = {
		name = "PlatformSessionGetInviteInfo",
		controller = controller,
		lobbyType = lobbyType,
		invitationId = invitationId,
		info = {},
		gamertag = nil,
		gamertags = nil,
		startFuncPtr = function ( self )
			if Lobby.PlatformSession.PlatformSessionEnabled() == false or Engine.IsDemonwareFetchingDone( controller ) == false or Engine.IsDedicatedServer() then
				LobbyVM.ProcessCompleteFailure( {
					actionId = self.actionId
				} )
				return 
			elseif Engine.PlatformSessionGetInviteInfo( self.actionId, self.controller, self.lobbyType, self.invitationId ) == false then
				LobbyVM.ProcessCompleteFailure( {
					actionId = self.actionId
				} )
				return 
			else
				
			end
		end,
		endFuncPtr = function ( self )
			if not Lobby.PlatformSession.PlatformSessionEnabled() or Engine.IsDemonwareFetchingDone( self.controller ) == false or Engine.IsDedicatedServer() then
				return 
			elseif self.retData.returnCode ~= 0 then
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

Lobby.Actions.PlatformSessionLeave = function ( controller, lobbyType, sessionId )
	local process = {
		name = "PlatformSessionLeave",
		controller = controller,
		lobbyType = lobbyType,
		sessionId = sessionId,
		startFuncPtr = function ( self )
			if not Lobby.PlatformSession.PlatformSessionEnabled() or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE or Engine.IsDedicatedServer() then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
				return 
			elseif Engine.PlatformSessionLeave( self.actionId, self.controller, self.lobbyType, sessionId ) == false then
				LobbyVM.ProcessCompleteFailure( {
					actionId = self.actionId
				} )
				return 
			else
				
			end
		end,
		endFuncPtr = function ( self )
			if not Lobby.PlatformSession.PlatformSessionEnabled() or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE or Engine.IsDedicatedServer() then
				return 
			else
				
			end
		end
	}
	return process
end

Lobby.Actions.PlatformSessionSearch = function ( controller, lobbyType, gamertag )
	local process = {
		name = "PlatformSessionSearch",
		controller = controller,
		lobbyType = lobbyType,
		gamertag = gamertag,
		startFuncPtr = function ( self )
			if not Lobby.PlatformSession.PlatformSessionEnabled() or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE or Engine.IsDedicatedServer() then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
				return 
			elseif Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) == true then
				local gamertag = Engine.GetLobbyHostGamertag( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
				if Engine.PlatformSessionSearch( self.actionId, self.controller, self.lobbyType, gamertag ) == false then
					LobbyVM.ProcessCompleteFailure( {
						actionId = self.actionId
					} )
					return 
				end
			end
		end,
		endFuncPtr = function ( self )
			if not Lobby.PlatformSession.PlatformSessionEnabled() or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE or Engine.IsDedicatedServer() then
				return 
			end
			local retData = self.retData
			if retData.sessions and #retData.sessions > 0 then
				local session = retData.sessions[1]
				Lobby.PlatformSession.SetSessionId( session.sessionId )
			else
				Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYVM, "Action: " .. self.name .. ", no sessions found. Unable to add session id.\n" )
			end
		end
	}
	return process
end

Lobby.Actions.PlatformSessionJoin = function ( controller, lobbyType, sessionId )
	local process = {
		name = "PlatformSessionJoin",
		controller = controller,
		lobbyType = lobbyType,
		sessionId = sessionId,
		startFuncPtr = function ( self )
			if not Lobby.PlatformSession.PlatformSessionEnabled() or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE or Engine.IsDedicatedServer() then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
				return 
			elseif Engine.PlatformSessionJoin( self.actionId, self.controller, self.lobbyType, Lobby.PlatformSession.GetSessionId() ) == false then
				LobbyVM.ProcessCompleteFailure( {
					actionId = self.actionId
				} )
				return 
			else
				
			end
		end,
		endFuncPtr = function ( self )
			if not Lobby.PlatformSession.PlatformSessionEnabled() or Engine.GetLobbyNetworkMode() ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE or Engine.IsDedicatedServer() then
				return 
			else
				
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
			if self.retData.returnCode ~= 0 then
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
		gameType = gameType,
		mapName = mapName,
		startFuncPtr = function ( self )
			Engine.Exec( self.controller, "lobby_setmap " .. self.mapName )
			Engine.Exec( self.controller, "lobby_setgametype " .. self.gameType )
			LobbyVM.ProcessCompleteSuccess( {
				actionId = self.actionId
			} )
		end
	}
	return process
end

