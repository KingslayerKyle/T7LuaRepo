Lobby.Hopper = {}
Lobby.Hopper.lobbyHopper = nil
Lobby.Hopper.HOPPER_STATE = {
	PARKED = 0,
	UNPARKED = 1
}
Lobby.Hopper.hopperState = Lobby.Hopper.HOPPER_STATE.UNPARKED
Lobby.Hopper.UpdateLobbyData = function ( f1_arg0 )
	local f1_local0 = LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME
	if f1_arg0 then
		local f1_local1 = Engine.GetPlaylistInfoByID( f1_arg0 )
		if f1_local1 and f1_local1.playlist.arenaSlot >= 0 then
			f1_local0 = LobbyData.UITargets.UI_MPLOBBYONLINEARENAGAME
		end
	end
	Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Updating Lobby Data for Target: " .. f1_local0.name .. "\n" )
	LobbyVM.LobbySettings( {
		toTarget = f1_local0,
		skipSwitchMode = true,
		isDevMap = false
	} )
	LobbyVM.UpdateUI( {
		toTarget = f1_local0
	} )
	local f1_local1 = 0
	if f1_arg0 then
		Lobby.Timer.HostingLobby( {
			controller = f1_local1,
			lobbyType = f1_local0.lobbyType,
			mainMode = f1_local0.mainMode,
			lobbyTimerType = f1_local0.lobbyTimerType
		} )
	else
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = f1_local0.lobbyType
		} )
		Lobby.Pregame.Clear()
	end
end

Lobby.Hopper.ClientJoin = function ( f2_arg0 )
	if Engine.IsDedicatedServer() == false then
		return true
	end
	local f2_local0 = f2_arg0.clientPlaylist
	if f2_local0 == 255 then
		return true
	end
	local f2_local1 = Engine.GetParkingPlaylistForRealPlaylist( f2_local0 )
	local f2_local2 = Engine.GetPlaylistID()
	local f2_local3 = true
	if Lobby.Hopper.HOPPER_STATE.PARKED == Lobby.Hopper.hopperState then
		if f2_local2 ~= f2_local1 then
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Rejecting client because they want playlist " .. f2_local1 .. " but we're on parkingplaylist " .. f2_local2 .. " for playlist " .. f2_local2 .. "\n" )
			f2_local3 = false
		else
			Lobby.Hopper.UpdateLobbyData( f2_local0 )
			LobbyVM.HostLaunchClear()
			Engine.SetFakeDLCBits( f2_arg0.dlcBits )
			Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Unparking onto playlist " .. f2_local0 .. "\n" )
			Engine.SwitchPlaylists( f2_local0 )
			Lobby.Matchmaking.UpdateLatencyBand()
			Engine.SetPlaylistID( f2_local0 )
			Dvar.lobbyAdvertisePlaylistNumber:set( f2_local0 )
			Dvar.lobbyAdvertiseMapPacks:set( Lobby.Matchmaking.GetMapPackBits( f2_arg0.dlcBits, f2_local0 ) )
			Engine.SetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME, Dvar.party_maxplayers:get() )
			Lobby.Matchmaking.SetSkillWeight( 0.01 )
			Lobby.Matchmaking.UpdateAdvertising( " hopper unpark " )
			Lobby.Hopper.hopperState = Lobby.Hopper.HOPPER_STATE.UNPARKED
		end
	elseif Lobby.Hopper.HOPPER_STATE.UNPARKED == Lobby.Hopper.hopperState and f2_local0 ~= 255 and f2_local0 ~= f2_local2 then
		Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "Rejecting client because they want playlist " .. f2_local0 .. " but we're unparked on playlist " .. f2_local2 .. "\n" )
		f2_local3 = false
	end
	return f2_local3
end

Lobby.Hopper.OnSessionEnd = function ( f3_arg0 )
	local f3_local0 = f3_arg0.lobbyModule
	local f3_local1 = f3_arg0.lobbyType
	local f3_local2 = f3_arg0.lobbyMode
	if f3_local1 == Enum.LobbyType.LOBBY_TYPE_GAME then
		Dvar.live_dedicatedReady:set( false )
	end
end

Lobby.Hopper.Pump = function ()
	if Engine.IsDedicatedServer() == false then
		return 
	elseif false == Dvar.live_dedicatedReady:get() then
		return 
	elseif Lobby.Hopper.HOPPER_STATE.UNPARKED == Lobby.Hopper.hopperState then
		if Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME ) == 0 and not Engine.ProcessingJoin( Enum.LobbyType.LOBBY_TYPE_GAME ) and false == Dvar.sv_running:get() and Dvar.hopper_playlist:get() == 0 then
			local f4_local0 = Engine.GetPlaylistID()
			local f4_local1 = Engine.GetParkingPlaylistForRealPlaylist( f4_local0 )
			if f4_local1 ~= 0 then
				Engine.PrintWarning( Enum.consoleLabel.LABEL_LOBBYHOST, "No clients left and we're currently on playlist " .. f4_local0 .. " - parking on playlist " .. f4_local1 .. "\n" )
				Lobby.Hopper.hopperState = Lobby.Hopper.HOPPER_STATE.PARKED
				Lobby.Hopper.UpdateLobbyData()
				Dvar.lobbyAdvertiseLatencyBand:set( 0 )
				Engine.SwitchPlaylists( f4_local1 )
				Engine.SetPlaylistID( f4_local1 )
				Dvar.lobbyAdvertisePlaylistNumber:set( f4_local1 )
				Dvar.lobbyAdvertiseMapPacks:set( Lobby.Matchmaking.ContentPack.CONTENT_ORIGINALMAPS )
				Dvar.lobbyAdvertiseShowInMatchmaking:set( 1 )
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

