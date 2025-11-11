require( "lua.Lobby.Common.LobbyCore" )

Lobby.Join = {}
Lobby.Join.autoJoin = {}
Lobby.Join.OnJoin = function ( data )
	local process = Lobby.Join.GetJoinProcess( data )
	if process ~= nil then
		Lobby.ProcessQueue.AddToQueue( "Join", process )
	end
end

Lobby.Join.OnJoinSystemlink = function ( data )
	local process = Lobby.Process.JoinSystemlink( data.controller, data.lobbyMainMode, data.lobbyNetworkMode, data.hostXuid, data.hostInfo, data.sourceLobbyType, data.destLobbyType )
	Lobby.ProcessQueue.AddToQueue( "JoinSystemLink", process )
end

Lobby.Join.OnJoinComplete = function ( data )
	Lobby.Matchmaking.OnJoinComplete( data )
	Lobby.Debug.OnJoinComplete( data )
end

Lobby.Join.OnEnableJoins = function ( data )
	if data.enable then
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionStatus.SESSION_STATUS_IDLE )
	else
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionStatus.SESSION_STATUS_PAUSED )
	end
end

Lobby.Join.OnJoinableCheck = function ( data )
	local joinRequest = data.joinRequest
	local joinResponse = data.joinResponse
	local currentTarget = LobbyData.GetCurrentMenuTarget()
	if Engine.IsDedicatedServer() == false and Engine.IsProcessingJoin() == true and currentTarget.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME and (currentTarget.lobbyMode == Enum.LobbyMode.LOBBY_MODE_PUBLIC or currentTarget.lobbyMode == Enum.LobbyMode.LOBBY_MODE_ARENA) then
		if currentTarget.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_CP and Engine.GetDvarBool( "cpProcessingJoinCheck" ) then
			return Enum.JoinResult.JOIN_RESULT_VM_FAILURE_1
		elseif currentTarget.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_MP and Engine.GetDvarBool( "mpProcessingJoinCheck" ) then
			return Enum.JoinResult.JOIN_RESULT_VM_FAILURE_1
		elseif currentTarget.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM and Engine.GetDvarBool( "zmProcessingJoinCheck" ) then
			return Enum.JoinResult.JOIN_RESULT_VM_FAILURE_1
		end
	end
	if Engine.IsInGame() or Lobby.Launch.IsHostLaunching() or Engine.GetCurrentMap() ~= "core_frontend" or Engine.SessionMode_IsPublicOnlineGame() then
		local session = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME )
		local dlcBit = LobbyVM.GetNeededDLCBits()
		if not LobbyVM.CheckDLCBit( joinRequest.dlcBits, dlcBit ) then
			return Enum.JoinResult.JOIN_RESULT_BAD_DLC_BITS
		end
	end
	if joinResponse.response == Enum.JoinResult.JOIN_RESULT_SUCCESS then
		if Engine.IsMultiplayerGame() then
			if LuaUtils.IsArenaMode() then
				if ((Engine.GetGametypeSetting( "pregameItemVoteEnabled" ) == 1) or Engine.GetGametypeSetting( "pregameDraftEnabled" ) == 1) and Engine.IsInGame() and Engine.SessionMode_IsPublicOnlineGame() then
					return Enum.JoinResult.JOIN_RESULT_NO_JOIN_IN_PROGRESS
				elseif data.joinRequest.splitscreenClients ~= nil and data.joinRequest.splitscreenClients > 0 then
					return Enum.JoinResult.JOIN_RESULT_SPLITSCREEN_NOT_ALLOWED
				elseif Lobby.Timer.LobbyIsLocked() then
					return Enum.JoinResult.JOIN_RESULT_NO_JOIN_IN_PROGRESS
				end
				local pregameState = Engine.GetLobbyPregameState()
				if pregameState ~= Enum.LobbyPregameState.LOBBY_PREGAME_STATE_IDLE then
					return Enum.JoinResult.JOIN_RESULT_NO_JOIN_IN_PROGRESS
				end
				local timerStatus = Lobby.Timer.GetTimerStatus()
				if timerStatus == Lobby.Timer.LOBBY_STATUS.POST_GAME or timerStatus == Lobby.Timer.LOBBY_STATUS.FIND_NEW_LOBBY then
					return Enum.JoinResult.JOIN_RESULT_NO_JOIN_IN_PROGRESS
				elseif Engine.GetDvarBool( "probation_league_enabled" ) and currentTarget.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
					for index, member in pairs( joinRequest.members ) do
						if member.arenaProbation > 0 then
							return Enum.JoinResult.JOIN_RESULT_IN_ARENA_PROBATION
						end
					end
				end
			elseif Engine.GetDvarBool( "probation_public_enabled" ) and currentTarget.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
				for index, f5_local0 in pairs( joinRequest.members ) do
					if f5_local0.publicProbation > 0 then
						return Enum.JoinResult.JOIN_RESULT_IN_PUBLIC_PROBATION
					end
				end
			end
		end
		if Engine.IsZombiesGame() then
			local isRankedPrivateMatch = false
			if Dvar.zm_private_rankedmatch:get() then
				isRankedPrivateMatch = true
			end
			if CoDShared.IsInTheaterLobby() then
				return Enum.JoinResult.JOIN_RESULT_JOIN_DISABLED
			end
			local curScreenId = Engine.GetLobbyUIScreen()
			local f5_local5 = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_ZM )
			if curScreenId == f5_local5.id and (Engine.IsInGame() or Lobby.Launch.IsHostLaunching() or Engine.GetCurrentMap() ~= "core_frontend") then
				return Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_SOLO_MODE
			elseif (Engine.IsInGame() or Lobby.Launch.IsHostLaunching()) and Engine.SessionMode_IsOnlineGame() and isRankedPrivateMatch then
				return Enum.JoinResult.JOIN_RESULT_NO_JOIN_IN_PROGRESS
			elseif (Engine.IsInGame() or Lobby.Launch.IsHostLaunching()) and Engine.SessionMode_IsPublicOnlineGame() then
				return Enum.JoinResult.JOIN_RESULT_NO_JOIN_IN_PROGRESS
			end
		end
		local currentMode = Engine.GetLobbyMainMode()
		if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
			if not data.isLocalRequest then
				if joinResponse.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
					local chunkResult = Lobby.Join.DoChunksAllowJoin( joinRequest, currentMode )
					if chunkResult ~= Enum.JoinResult.JOIN_RESULT_SUCCESS then
						return chunkResult
					end
				elseif joinResponse.lobbyType == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
					for mode = 0, Enum.LobbyMainMode.LOBBY_MAINMODE_COUNT - 1, 1 do
						local chunkResult = Lobby.Join.DoChunksAllowJoin( joinRequest, mode )
						if chunkResult ~= Enum.JoinResult.JOIN_RESULT_SUCCESS then
							return chunkResult
						end
					end
				end
			end
		elseif not data.isLocalRequest then
			local chunkResult = Lobby.Join.DoChunksAllowJoin( joinRequest, currentMode )
			if chunkResult ~= Enum.JoinResult.JOIN_RESULT_SUCCESS then
				return chunkResult
			end
		end
	end
	return joinResponse.response
end

Lobby.Join.DoChunksAllowJoin = function ( joinRequest, mode )
	if mode == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		if not joinRequest.chunkMP then
			return Enum.JoinResult.JOIN_RESULT_CHUNK_MP_REQUIRED
		elseif Engine.IsMpStillDownloading() then
			return Enum.JoinResult.JOIN_RESULT_CHUNK_MP_REQUIRED_HOST
		end
	elseif mode == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		if not joinRequest.chunkZM then
			return Enum.JoinResult.JOIN_RESULT_CHUNK_ZM_REQUIRED
		elseif Engine.IsZmStillDownloading() then
			return Enum.JoinResult.JOIN_RESULT_CHUNK_ZM_REQUIRED_HOST
		end
	elseif mode == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		if not joinRequest.chunkCP then
			return Enum.JoinResult.JOIN_RESULT_CHUNK_CP_REQUIRED
		elseif Engine.IsCpStillDownloading() then
			return Enum.JoinResult.JOIN_RESULT_CHUNK_CP_REQUIRED_HOST
		end
	end
	return Enum.JoinResult.JOIN_RESULT_SUCCESS
end

Lobby.Join.JoinResultToString = function ( joinResult, verbose )
	local joinResultInfo = {
		debug = "",
		errorMsg = ""
	}
	if verbose == true then
		joinResultInfo.debug = "Enum.JoinResult.JOIN_RESULT_"
	end
	if joinResult == Enum.JoinResult.JOIN_RESULT_INVALID then
		joinResultInfo.debug = joinResultInfo.debug .. "INVALID"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_SUCCESS then
		joinResultInfo.debug = joinResultInfo.debug .. "SUCCESS"
		joinResultInfo.errorMsg = ""
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_CONNECT_TO_HOST_FAILURE then
		joinResultInfo.debug = joinResultInfo.debug .. "CONNECT_TO_HOST_FAILURE"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_PROBE_SEND_FAILURE then
		joinResultInfo.debug = joinResultInfo.debug .. "PROBE_SEND_FAILURE"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_PROBE_TIMEOUT then
		joinResultInfo.debug = joinResultInfo.debug .. "PROBE_TIMEOUT"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_PROBE_INVALID_LOBBY then
		joinResultInfo.debug = joinResultInfo.debug .. "PROBE_INVALID_LOBBY"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_PROBE_INVALID_INFO then
		joinResultInfo.debug = joinResultInfo.debug .. "PROBE_INVALID_INFO"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_PROBE_RESULT_INVALID then
		joinResultInfo.debug = joinResultInfo.debug .. "PROBE_RESULT_INVALID"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_INVALID_LOBBY then
		joinResultInfo.debug = joinResultInfo.debug .. "INVALID_LOBBY"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_SEND_AGREEMENT_REQUEST_FAILED then
		joinResultInfo.debug = joinResultInfo.debug .. "SEND_AGREEMENT_REQUEST_FAILED"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_JOIN_DISABLED then
		joinResultInfo.debug = joinResultInfo.debug .. "JOIN_DISABLED"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_JOIN_ALREADY_IN_PROGRESS then
		joinResultInfo.debug = joinResultInfo.debug .. "JOIN_ALREADY_IN_PROGRESS"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_CLOSED then
		joinResultInfo.debug = joinResultInfo.debug .. "NOT_JOINABLE_CLOSED"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE_CLOSED"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_INVITE_ONLY then
		joinResultInfo.debug = joinResultInfo.debug .. "NOT_JOINABLE_INVITE_ONLY"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE_INVITE_ONLY"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_FRIENDS_ONLY then
		joinResultInfo.debug = joinResultInfo.debug .. "NOT_JOINABLE_FRIENDS_ONLY"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE_FRIENDS_ONLY"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_SOLO_MODE then
		joinResultInfo.debug = joinResultInfo.debug .. "NOT_JOINABLE_SOLO_MODE"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE_SOLO_MODE"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_OVER_MAX_PARTY_LIMIT then
		joinResultInfo.debug = joinResultInfo.debug .. "OVER_MAX_PARTY_LIMIT"
		joinResultInfo.errorMsg = "EXE_TO_MANY_LOCAL_PLAYERS"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_NO_PARTIES then
		joinResultInfo.debug = joinResultInfo.debug .. "NO_PARTIES"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE_ALREADY_IN_PROGRESS"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_LOBBY_FULL then
		joinResultInfo.debug = joinResultInfo.debug .. "LOBBY_FULL"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_LOBBY_FULL"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_NETWORK_MODE_MISMATCH then
		joinResultInfo.debug = joinResultInfo.debug .. "NETWORK_MODE_MISMATCH"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NETWORK_MODE_MISMATCH"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_MISMATCH_PLAYLISTID then
		joinResultInfo.debug = joinResultInfo.debug .. "MISMATCH_PLAYLISTID"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PLAYLISTID"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_NEW then
		joinResultInfo.debug = joinResultInfo.debug .. "MISMATCH_PLAYLIST_VERSION_TO_NEW"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_NEW"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_OLD then
		joinResultInfo.debug = joinResultInfo.debug .. "MISMATCH_PLAYLIST_VERSION_TO_OLD"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_OLD"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_MISMATCH_PROTOCOL_VERSION then
		joinResultInfo.debug = joinResultInfo.debug .. "MISMATCH_PROTOCOL_VERSION"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PROTOCOL_VERSION"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_MISMATCH_NETFIELD_CHECKSUM then
		joinResultInfo.debug = joinResultInfo.debug .. "MISMATCH_NETFIELD_CHECKSUM"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_MISMATCH_NETFIELD_CHECKSUM"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_MISMATCH_FFOTD_VERSION_TO_NEW then
		joinResultInfo.debug = joinResultInfo.debug .. "MISMATCH_FFOTD_VERSION_TO_NEW"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_NEW"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_MISMATCH_FFOTD_VERSION_TO_OLD then
		joinResultInfo.debug = joinResultInfo.debug .. "MISMATCH_FFOTD_VERSION_TO_OLD"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_MISMATCH_PLAYLIST_VERSION_TO_OLD"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_MIGRATE_IN_PROGRESS then
		joinResultInfo.debug = joinResultInfo.debug .. "MIGRATE_IN_PROGRESS"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_MIGRATE_IN_PROGRESS"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_COULD_NOT_RESERVE then
		joinResultInfo.debug = joinResultInfo.debug .. "COULD_NOT_RESERVE"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_COULD_NOT_RESERVE"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_HANDSHAKE_WINDOW_EXPIRED then
		joinResultInfo.debug = joinResultInfo.debug .. "HANDSHAKE_WINDOW_EXPIRED"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_AGREEMENT_WINDOW_EXPIRED then
		joinResultInfo.debug = joinResultInfo.debug .. "AGREEMENT_WINDOW_EXPIRED"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_NOT_JOINABLE_NOT_IDLE then
		joinResultInfo.debug = joinResultInfo.debug .. "NOT_JOINABLE_NOT_IDLE"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_NO_JOIN_IN_PROGRESS then
		joinResultInfo.debug = joinResultInfo.debug .. "NO_JOIN_IN_PROGRESS"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_GAME_PAUSED then
		joinResultInfo.debug = joinResultInfo.debug .. "GAME_PAUSED"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE_PAUSED"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_CHUNK_MP_REQUIRED then
		joinResultInfo.debug = joinResultInfo.debug .. "CHUNK_MP_REQUIRED"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_MP_REQUIRED"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_CHUNK_ZM_REQUIRED then
		joinResultInfo.debug = joinResultInfo.debug .. "CHUNK_ZM_REQUIRED"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_ZM_REQUIRED"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_CHUNK_CP_REQUIRED then
		joinResultInfo.debug = joinResultInfo.debug .. "CHUNK_CP_REQUIRED"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_CP_REQUIRED"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_CHUNK_MP_REQUIRED_HOST then
		joinResultInfo.debug = joinResultInfo.debug .. "CHUNK_MP_REQUIRED_HOST"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_MP_REQUIRED_HOST"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_CHUNK_ZM_REQUIRED_HOST then
		joinResultInfo.debug = joinResultInfo.debug .. "CHUNK_ZM_REQUIRED_HOST"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_ZM_REQUIRED_HOST"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_CHUNK_CP_REQUIRED_HOST then
		joinResultInfo.debug = joinResultInfo.debug .. "CHUNK_CP_REQUIRED_HOST"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_CP_REQUIRED_HOST"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_SPLITSCREEN_NOT_ALLOWED then
		joinResultInfo.debug = joinResultInfo.debug .. "JOIN_RESULT_SPLITSCREEN_NOT_ALLOWED"
		joinResultInfo.errorMsg = "MENU_SPLITSCREEN_NOT_ALLOWED"
	elseif Engine.GetDvarBool( "probation_public_enabled" ) and joinResult == Enum.JoinResult.JOIN_RESULT_IN_PUBLIC_PROBATION then
		joinResultInfo.debug = joinResultInfo.debug .. "JOIN_RESULT_IN_PUBLIC_PROBATION"
		joinResultInfo.errorMsg = "MENU_JOIN_DENIED_PUBLIC_PROBATION"
	elseif Engine.GetDvarBool( "probation_league_enabled" ) and joinResult == Enum.JoinResult.JOIN_RESULT_IN_ARENA_PROBATION then
		joinResultInfo.debug = joinResultInfo.debug .. "JOIN_RESULT_IN_ARENA_PROBATION"
		joinResultInfo.errorMsg = "MENU_JOIN_DENIED_ARENA_PROBATION"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_BAD_DLC_BITS then
		joinResultInfo.debug = joinResultInfo.debug .. "JOIN_RESULT_BAD_DLC_BITS"
		joinResultInfo.errorMsg = "PLATFORM_MISSINGMAP"
	elseif joinResult == Enum.JoinResult.JOIN_RESULT_VM_FAILURE_1 then
		joinResultInfo.debug = joinResultInfo.debug .. "JOIN_RESULT_VM_FAILURE_1"
		joinResultInfo.errorMsg = "EXE_HOSTUNREACH_TOO_MANY_JOINS"
	else
		joinResultInfo.debug = joinResultInfo.debug .. "UNHANDLED JOINRESULT ENUM(" .. tostring( joinResult ) .. ")"
		joinResultInfo.errorMsg = "MENU_JOIN_RESULT_NOT_JOINABLE"
	end
	return joinResultInfo
end

Lobby.Join.GetJoinProcess = function ( data )
	local lobbyType = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME ) then
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if Engine.LobbyIsPlayerInLobby( lobbyType, data.xuid ) then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Lobby.Join: Trying to Join lobby we are already part of\n" )
		return nil
	elseif Engine.IsCpStillDownloading() or Engine.IsMpStillDownloading() or Engine.IsZmStillDownloading() then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Lobby.Join: Cannot process a join when the game is still being installed.\n" )
		return nil
	else
		return Lobby.Process.Join( data.controller, data.xuid, data.joinType, LuaEnum.LEAVE_WITH_PARTY.WITH )
	end
end

