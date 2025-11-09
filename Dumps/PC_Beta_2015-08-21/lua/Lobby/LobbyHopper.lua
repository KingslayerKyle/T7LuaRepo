Lobby.Hopper = {}
Lobby.Hopper.lobbyHopper = nil
Lobby.Hopper.HOPPER_STATE = {
	PARKED = 0,
	UNPARKED = 1
}
Lobby.Hopper.hopperState = Lobby.Hopper.HOPPER_STATE.UNPARKED
Lobby.Hopper.ClientJoin = function ( f1_arg0 )
	if Engine.IsDedicatedServer() == false then
		return true
	end
	local f1_local0 = f1_arg0.clientPlaylist
	if f1_local0 == 255 then
		return true
	end
	local f1_local1 = Engine.GetParkingPlaylistForRealPlaylist( f1_local0 )
	local f1_local2 = Engine.GetPlaylistID()
	local f1_local3 = true
	if Lobby.Hopper.HOPPER_STATE.PARKED == Lobby.Hopper.hopperState then
		if f1_local2 ~= f1_local1 then
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Rejecting client because they want playlist " .. f1_local1 .. " but we're on parkingplaylist " .. f1_local2 .. " for playlist " .. f1_local2 .. "\n" )
			f1_local3 = false
		else
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Unparking onto playlist " .. f1_local0 .. "\n" )
			Engine.SwitchPlaylists( f1_local0 )
			Lobby.Matchmaking.UpdateLatencyBand()
			Engine.SetPlaylistID( f1_local0 )
			Dvar.lobbyAdvertisePlaylistNumber:set( f1_local0 )
			Engine.SetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME, Dvar.party_maxplayers:get() )
			Lobby.Matchmaking.UpdateAdvertising( " hopper unpark " )
			Lobby.Hopper.hopperState = Lobby.Hopper.HOPPER_STATE.UNPARKED
		end
	elseif Lobby.Hopper.HOPPER_STATE.UNPARKED == Lobby.Hopper.hopperState and f1_local0 ~= 255 and f1_local0 ~= f1_local2 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Rejecting client because they want playlist " .. f1_local0 .. " but we're unparked on playlist " .. f1_local2 .. "\n" )
		f1_local3 = false
	end
	return f1_local3
end

Lobby.Hopper.Pump = function ()
	if Engine.IsDedicatedServer() == false then
		return 
	elseif false == Dvar.live_dedicatedReady:get() then
		return 
	elseif Lobby.Hopper.HOPPER_STATE.UNPARKED == Lobby.Hopper.hopperState then
		if Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) == 0 and not Engine.ProcessingJoin( Enum.LobbyType.LOBBY_TYPE_GAME ) and false == Dvar.sv_running:get() and Dvar.hopper_playlist:get() == 0 then
			local f2_local0 = Engine.GetPlaylistID()
			local f2_local1 = Engine.GetParkingPlaylistForRealPlaylist( f2_local0 )
			if f2_local1 ~= 0 then
				Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "No clients left and we're currently on playlist " .. f2_local0 .. " - parking on playlist " .. f2_local1 .. "\n" )
				Lobby.Hopper.hopperState = Lobby.Hopper.HOPPER_STATE.PARKED
				Dvar.lobbyAdvertiseLatencyBand:set( 0 )
				Engine.SwitchPlaylists( f2_local1 )
				Engine.SetPlaylistID( f2_local1 )
				Dvar.lobbyAdvertisePlaylistNumber:set( f2_local1 )
				Lobby.Matchmaking.UpdateAdvertising( " hopper park " )
			end
		end
	elseif Lobby.Hopper.HOPPER_STATE.PARKED == Lobby.Hopper.hopperState then
		
	else
		
	end
end

Lobby.Hopper.IsParked = function ()
	return Lobby.Hopper.HOPPER_STATE.PARKED == Lobby.Hopper.hopperState
end

