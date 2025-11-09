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
			elseif retVal == self.failureVal then
				LobbyVM.ProcessCompleteFailure( {
					actionId = self.actionId
				} )
			elseif retVal == self.errorVal then
				LobbyVM.ProcessCompleteError( {
					actionId = self.actionId
				} )
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
		name = "TimeDelay",
		timeDelayMilliseconds = timeDelayMilliseconds,
		endTime = nil,
		startFuncPtr = function ( self )
			self.endTime = self.timeDelayMilliseconds + Engine.milliseconds()
		end,
		updateFuncPtr = function ( self, data )
			if self.endTime < Engine.milliseconds() then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
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

Lobby.Actions.IsButtonPressed = function ( controller, button )
	local process = {
		name = "IsButtonPressed",
		controller = controller,
		button = button,
		startFuncPtr = function ( self )
			local isButtonPressed = Engine.IsButtonPressed( self.controller, self.button )
			if isButtonPressed then
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

Lobby.Actions.ErrorPopupMsg = function ( message )
	local process = {
		name = "ErrorPopupMsg",
		message = message,
		startFuncPtr = function ( self )
			Engine.LuiVM_Event( "lobby_error_popup", {
				message = self.message
			} )
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
				message = self.actionRef.errorFuncPtr()
			end
			Engine.LuiVM_Event( "lobby_error_popup", {
				message = message
			} )
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

Lobby.Actions.ForceUIScreen = function ( controller, screenId )
	local process = {
		name = "ForceUIScreen",
		controller = controller,
		screenId = screenId,
		startFuncPtr = function ( self )
			Engine.ForceUIScreen( self.screenId )
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

Lobby.Actions.LeaveWithParty = function ()
	local action = {
		name = "LeaveWithParty",
		startFuncPtr = function ( self )
			if Engine.LeaveWithParty( self.actionId ) == false then
				LobbyVM.ProcessCompleteFailure( {
					actionId = self.actionId
				} )
			end
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
			local clientCount = Engine.GetLobbyClientCount( self.fromTargetLobbyType )
			local canHost, failureReason = Engine.CanHostServer( self.controller, clientCount )
			self.failureReason = failureReason
			if canHost == true then
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

Lobby.Actions.SearchForLobby = function ( controller )
	local process = {
		name = "LobbySearch",
		controller = controller,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		filteredResult = {},
		startFuncPtr = function ( self )
			Lobby.Matchmaking.SetupMatchmakingStage( self.controller )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "SearchForLobby, begin search.\n" )
			Engine.SearchForLobby( self.actionId, self.lobbyType )
		end,
		endFuncPtr = function ( self )
			local searchResults = Engine.GetSearchResults( self.lobbyType )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "SearchForLobby, number of results found " .. searchResults.numResults .. ".\n" )
			local errorCode = searchResults.errorCode
			local numResults = searchResults.numResults
			if numResults == 0 then
				return 
			end
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------SEARCH RESULTS----------------------------\n" )
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "xuid, gameSecurityId, gameType, maxPlayers, numPlayers, serverType, showInMatchmaking, netcodeVersion, mapPacks, playlistVersion, playlistNumber, isEmpty, teamSizeMax, skill, geo1, geo2, geo3, geo4\n" )
			for index, host in ipairs( searchResults.remoteHosts ) do
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, Engine.UInt64ToString( host.xuid ) .. ", " .. Engine.UInt64ToString( host.gameSecurityId ) .. ", " .. host.gameType .. ", " .. host.maxPlayers .. ", " .. host.numPlayers .. ", " .. host.serverType .. ", " .. host.showInMatchmaking .. ", " .. host.netcodeVersion .. ", " .. host.mapPacks .. ", " .. host.playlistVersion .. ", " .. host.playlistNumber .. ", " .. host.isEmpty .. ", " .. host.teamSizeMax .. ", " .. host.skill .. ", " .. host.geo1 .. ", " .. host.geo2 .. ", " .. host.geo3 .. ", " .. host.geo4 .. ".\n" )
			end
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "-----------------------------------------------------------------------\n" )
			self.filteredResult = {}
			local localHostXuid = Engine.GetLobbyHostXuid( self.lobbyType )
			local count = 1
			for index, result in ipairs( searchResults.remoteHosts ) do
				if Engine.CompareUInt64( localHostXuid, result.xuid, "=" ) == false then
					self.filteredResult[count] = {
						xuid = result.xuid,
						gameSecurityId = result.gameSecurityId,
						gameSecurityKey = result.gameSecurityKey,
						hostAddress = result.hostAddress
					}
					count = count + 1
				end
			end
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "SearchForLobby, number of filtered results " .. #self.filteredResult .. ".\n" )
		end,
		errorFuncPtr = function ()
			return "LOBBY SEARCH FAILED"
		end
	}
	return process
end

local JOIN_STATUS = {
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
		joinStatusCur = JOIN_STATUS.BEGIN,
		searchTime = nil,
		endTime = nil,
		qosResultsValid = {},
		qosResultsInvalid = {},
		startFuncPtr = function ( self )
			local filteredResult = self.searchAction.filteredResult
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, num of search results passed " .. #filteredResult .. " for QoS.\n" )
			if #filteredResult == 0 then
				LobbyVM.ProcessCompleteFailure( {
					actionId = self.actionId
				} )
				return 
			end
			Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, starting probes.\n" )
			local retVal = Engine.QoSProbeInitiate( self.actionId, self.sourceLobbyType, filteredResult )
			if retVal == false then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, QoSProbeInitiate failed.\n" )
				LobbyVM.ProcessCompleteFailure( {
					actionId = self.actionId
				} )
			end
			self.joinStatusCur = JOIN_STATUS.BEGIN
			self.searchTime = Engine.milliseconds()
			self.endTime = Engine.milliseconds() + 5000
		end,
		pumpFuncPtr = function ( self )
			if self.joinStatusCur == JOIN_STATUS.BEGIN then
				if self.searchTime > Engine.milliseconds() then
					return 
				elseif #self.qosResultsValid == 0 and #self.searchAction.filteredResult <= #self.qosResultsInvalid then
					Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults::pumpFuncPtr, Not expecting any results to join, QoSJoinSearchResults failed.\n" )
					LobbyVM.ProcessCompleteFailure( {
						actionId = self.actionId
					} )
					return 
				elseif #self.qosResultsValid > 0 then
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, num of initial results returned " .. #self.qosResultsValid .. ".\n" )
					Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, begin join.\n" )
					Engine.LobbyJoinBegin( self.actionId, self.controller, self.sourceLobbyType, self.targetLobbyType )
					for index, qosResult in ipairs( self.qosResultsValid ) do
						Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Attempting to join xuid: " .. qosResult.xuidstr .. ".\n" )
						Engine.LobbyJoinAdd( qosResult.xuid, qosResult.gameSecurityId, qosResult.gameSecurityKey, qosResult.hostAddress )
					end
					self.joinStatusCur = JOIN_STATUS.ADD
				end
			elseif self.joinStatusCur == JOIN_STATUS.ADD then
				local filteredResult = self.searchAction.filteredResult
				if #self.qosResultsValid < #filteredResult and self.endTime > Engine.milliseconds() then
					return 
				end
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "QoSJoinSearchResults, finalize join.\n" )
				self.joinStatusCur = JOIN_STATUS.FINALIZE
				Engine.LobbyJoinFinalize()
			end
		end,
		updateFuncPtr = function ( self, data )
			local qosResult = nil
			if data.validResult == false then
				self.qosResultsInvalid[#self.qosResultsInvalid + 1] = {
					validResult = data.validResult,
					xuid = data.xuid,
					xuidstr = data.xuidstr
				}
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
				hostXuid = data.hostXuid
			}
			self.qosResultsValid[#self.qosResultsValid + 1] = qosResult
			if self.joinStatusCur == JOIN_STATUS.START then
				
			elseif self.joinStatusCur == JOIN_STATUS.ADD then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Attempting to join xuid: " .. qosResult.xuidstr .. ".\n" )
				Engine.LobbyJoinAdd( qosResult.xuid, qosResult.gameSecurityId, qosResult.gameSecurityKey, qosResult.hostAddress )
			elseif self.joinStatusCur == JOIN_STATUS.FINALIZE then
				
			else
				
			end
		end,
		cancelFuncPtr = function ( self )
			Engine.QoSCancelProbes()
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
			if self.onOff == true then
				return "Failed to turn on lobby advertising"
			else
				return "Failed to turn off lobby advertising"
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
		startFuncPtr = function ( self )
			Engine.LobbyInfoProbe( self.actionId, self.controller, self.info.xuid )
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
		startFuncPtr = function ( self )
			if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
				Engine.JoinHost( self.actionId, self.controller, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyType.LOBBY_TYPE_GAME, self.hostXuid, self.hostInfo )
			else
				Engine.JoinHost( self.actionId, self.controller, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyType.LOBBY_TYPE_GAME, self.hostXuid, self.hostInfo )
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
		startFuncPtr = function ( self )
			Engine.JoinXUID( self.actionId, self.controller, self.info.xuid, self.joinType )
		end,
		errorFuncPtr = function ( self )
			return Engine.Localize( "MENU_JOIN_RESULT_NOT_JOINABLE" )
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
			end
			if waitingOnClients == 0 then
				Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "WaitForJoiningClients pump stop, All clients have joined.\n" )
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
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
			if not Lobby.PlatformSession.PlatformSessionEnabled() then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
				return 
			else
				Dvar.platformSessionName:set( Engine.LocalizeWithoutLocsMarkers( "MENU_BLACKOUT" ) )
				Dvar.platformSessionStatus:set( "TODO: Status Message" )
				Dvar.platformSessionImgPath:set( "/app0/sce_sys/icon0.png" )
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
			if not Lobby.PlatformSession.PlatformSessionEnabled() then
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
			if not Lobby.PlatformSession.PlatformSessionEnabled() then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
				return 
			else
				Dvar.platformSessionName:set( Engine.LocalizeWithoutLocsMarkers( "MENU_BLACKOUT" ) )
				Dvar.platformSessionStatus:set( "TODO: Status Message" )
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
			if not Lobby.PlatformSession.PlatformSessionEnabled() then
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
			if not Lobby.PlatformSession.PlatformSessionEnabled() then
				LobbyVM.ProcessCompleteSuccess( {
					actionId = self.actionId
				} )
				return 
			else
				Dvar.platformSessionInviteMessage:set( "TODO: Status Message" )
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
			if not Lobby.PlatformSession.PlatformSessionEnabled() then
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
		startFuncPtr = function ( self )
			if not Lobby.PlatformSession.PlatformSessionEnabled() then
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
			if not Lobby.PlatformSession.PlatformSessionEnabled() then
				return 
			else
				
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
		inviteInfo = {},
		xuid = 0,
		startFuncPtr = function ( self )
			if not Lobby.PlatformSession.PlatformSessionEnabled() then
				LobbyVM.ProcessCompleteSuccess( {
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
			if not Lobby.PlatformSession.PlatformSessionEnabled() then
				return 
			elseif self.retData.returnCode ~= 0 then
				return 
			else
				self.inviteInfo.receivedDate = self.retData.receivedDate
				self.inviteInfo.usedFlag = self.retData.usedFlag
				self.inviteInfo.expired = self.retData.expired
				self.inviteInfo.message = self.retData.message
				self.inviteInfo.fromGamertag = self.retData.fromGamertag
				self.inviteInfo.fromXuid = self.retData.fromXuid
				self.inviteInfo.invitationId = self.retData.invitationId
				self.inviteInfo.sessionId = self.retData.sessionId
				self.gamertag = self.retData.fromGamertag
				self.xuid = self.retData.fromXuid
				self.gamertags = {}
				self.gamertags[1] = self.retData.fromGamertag
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
			if not Lobby.PlatformSession.PlatformSessionEnabled() then
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
			if not Lobby.PlatformSession.PlatformSessionEnabled() then
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
			if not Lobby.PlatformSession.PlatformSessionEnabled() then
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
			if not Lobby.PlatformSession.PlatformSessionEnabled() then
				return 
			end
			local retData = self.retData
			if #retData.sessions > 0 then
				local session = retData.sessions[1]
				Lobby.PlatformSession.SetSessionId( session.sessionId )
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
			if not Lobby.PlatformSession.PlatformSessionEnabled() then
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
			if not Lobby.PlatformSession.PlatformSessionEnabled() then
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
			elseif #self.retData.userInfo == 0 then
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

