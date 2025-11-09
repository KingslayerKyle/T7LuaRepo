Lobby.Hopper = {}
Lobby.Hopper.lobbyHopper = nil
Lobby.Hopper.HOPPER_STATE = {
	PARKED = 0,
	UNPARKED = 1
}
Lobby.Hopper.hopperState = Lobby.Hopper.HOPPER_STATE.UNPARKED
Lobby.Hopper.ClientJoin = function ( data )
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
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Unparking onto playlist " .. clientPlaylist .. "\n" )
			Engine.SwitchPlaylists( clientPlaylist )
			Lobby.Matchmaking.UpdateLatencyBand()
			Engine.SetPlaylistID( clientPlaylist )
			Dvar.lobbyAdvertisePlaylistNumber:set( clientPlaylist )
			local maxClients = Dvar.party_maxplayers:get()
			Engine.SetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME, maxClients )
			Lobby.Matchmaking.UpdateAdvertising( " hopper unpark " )
			Lobby.Hopper.hopperState = Lobby.Hopper.HOPPER_STATE.UNPARKED
		end
	elseif Lobby.Hopper.HOPPER_STATE.UNPARKED == Lobby.Hopper.hopperState and clientPlaylist ~= 255 and clientPlaylist ~= ourPlaylist then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Rejecting client because they want playlist " .. clientPlaylist .. " but we're unparked on playlist " .. ourPlaylist .. "\n" )
		joinOK = false
	end
	return joinOK
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
					Dvar.lobbyAdvertiseLatencyBand:set( 0 )
					Engine.SwitchPlaylists( ourParkingPlaylist )
					Engine.SetPlaylistID( ourParkingPlaylist )
					Dvar.lobbyAdvertisePlaylistNumber:set( ourParkingPlaylist )
					Lobby.Matchmaking.UpdateAdvertising( " hopper park " )
				end
			end
		end
	elseif Lobby.Hopper.HOPPER_STATE.PARKED == Lobby.Hopper.hopperState then
		
	else
		
	end
end

Lobby.Hopper.IsParked = function ()
	return Lobby.Hopper.HOPPER_STATE.PARKED == Lobby.Hopper.hopperState
end

