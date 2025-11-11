Lobby.Hopper = {}
Lobby.Hopper.lobbyHopper = nil
Lobby.Hopper.HOPPER_STATE = {
	PARKED = 0,
	UNPARKED = 1
}
Lobby.Hopper.hopperState = Lobby.Hopper.HOPPER_STATE.UNPARKED
Lobby.Hopper.UpdateLobbyData = function ( playlist )
	local toTarget = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_PUBLIC )
	if playlist then
		local playlistInfo = Engine.GetPlaylistInfoByID( playlist )
		if playlistInfo and playlistInfo.playlist.arenaSlot >= 0 then
			toTarget = LobbyData.GetLobbyMenuByName( LuaEnum.UI.ONLINE_MP_ARENA )
		end
	end
	Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Updating Lobby Data for Target: " .. toTarget.name .. "\n" )
	LobbyVM.OnLobbySettings( {
		toTarget = toTarget,
		skipSwitchMode = true,
		isDevMap = false
	} )
	LobbyVM.OnUpdateUI( {
		toTarget = toTarget
	} )
	local controller = 0
	if playlist then
		Lobby.Timer.HostingLobby( {
			controller = controller,
			lobbyType = toTarget.lobbyType,
			mainMode = toTarget.mainMode,
			lobbyTimerType = toTarget.lobbyTimerType
		} )
	else
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = toTarget.lobbyType
		} )
		Lobby.Pregame.Clear()
	end
end

Lobby.Hopper.OnClientJoin = function ( data )
	if Engine.IsDedicatedServer() == false then
		return true
	end
	local clientPlaylist = data.clientPlaylist
	if clientPlaylist == 255 then
		return true
	end
	local theirParkingPlaylist = Engine.GetParkingPlaylistForRealPlaylist( clientPlaylist )
	local ourPlaylist = Engine.GetPlaylistID()
	local joinOK = true
	if Lobby.Hopper.HOPPER_STATE.PARKED == Lobby.Hopper.hopperState then
		if ourPlaylist ~= theirParkingPlaylist then
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Rejecting client because they want playlist " .. theirParkingPlaylist .. " but we're on parkingplaylist " .. ourPlaylist .. " for playlist " .. ourPlaylist .. "\n" )
			joinOK = false
		else
			Lobby.Hopper.UpdateLobbyData( clientPlaylist )
			LobbyVM.HostLaunchClear()
			Engine.SetFakeDLCBits( data.dlcBits )
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Unparking onto playlist " .. clientPlaylist .. "\n" )
			Engine.SwitchPlaylists( clientPlaylist )
			Lobby.Matchmaking.UpdateLatencyBand()
			Engine.SetPlaylistID( clientPlaylist )
			Dvar.lobbyAdvertisePlaylistNumber:set( clientPlaylist )
			local dlcBits = Lobby.Matchmaking.GetMapPackBits( data.dlcBits, clientPlaylist )
			Dvar.lobbyAdvertiseMapPacks:set( dlcBits )
			local maxClients = Dvar.party_maxplayers:get()
			Engine.SetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME, maxClients )
			Lobby.Matchmaking.SetSkillWeight( 0.01 )
			Lobby.Matchmaking.UpdateAdvertising( " hopper unpark " )
			Lobby.Hopper.hopperState = Lobby.Hopper.HOPPER_STATE.UNPARKED
		end
	elseif Lobby.Hopper.HOPPER_STATE.UNPARKED == Lobby.Hopper.hopperState and clientPlaylist ~= 255 and clientPlaylist ~= ourPlaylist then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Rejecting client because they want playlist " .. clientPlaylist .. " but we're unparked on playlist " .. ourPlaylist .. "\n" )
		joinOK = false
	end
	return joinOK
end

Lobby.Hopper.OnSessionEnd = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	if lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
		Dvar.live_dedicatedReady:set( false )
	end
end

Lobby.Hopper.Pump = function ()
	if Engine.IsDedicatedServer() == false then
		return 
	elseif false == Dvar.live_dedicatedReady:get() then
		return 
	elseif Lobby.Hopper.HOPPER_STATE.UNPARKED == Lobby.Hopper.hopperState then
		local clientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
		if clientCount == 0 and not Engine.ProcessingJoin( Enum.LobbyType.LOBBY_TYPE_GAME ) and false == Dvar.sv_running:get() then
			local parkingPlaylist = Dvar.hopper_playlist:get()
			if parkingPlaylist == 0 then
				local ourPlaylist = Engine.GetPlaylistID()
				local ourParkingPlaylist = Engine.GetParkingPlaylistForRealPlaylist( ourPlaylist )
				if ourParkingPlaylist ~= 0 then
					Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "No clients left and we're currently on playlist " .. ourPlaylist .. " - parking on playlist " .. ourParkingPlaylist .. "\n" )
					Lobby.Hopper.hopperState = Lobby.Hopper.HOPPER_STATE.PARKED
					Lobby.Hopper.UpdateLobbyData()
					Dvar.lobbyAdvertiseLatencyBand:set( 0 )
					Engine.SwitchPlaylists( ourParkingPlaylist )
					Engine.SetPlaylistID( ourParkingPlaylist )
					Dvar.lobbyAdvertisePlaylistNumber:set( ourParkingPlaylist )
					Dvar.lobbyAdvertiseMapPacks:set( Lobby.Matchmaking.ContentPack.CONTENT_ORIGINALMAPS )
					Dvar.lobbyAdvertiseShowInMatchmaking:set( 1 )
					Lobby.Matchmaking.UpdateAdvertising( " hopper park " )
				end
			end
		end
	elseif Lobby.Hopper.HOPPER_STATE.PARKED == Lobby.Hopper.hopperState then
		
	else
		
	end
end

Lobby.Hopper.OnIsParked = function ()
	return Lobby.Hopper.HOPPER_STATE.PARKED == Lobby.Hopper.hopperState
end

