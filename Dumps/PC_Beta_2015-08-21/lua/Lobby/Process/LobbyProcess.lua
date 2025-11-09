require( "lua.Lobby.Process.LobbyActions" )
require( "lua.Lobby.Matchmaking.LobbyMatchmaking" )

Lobby.Process = {}
Lobby.Process.DO_NOTHING_IF_FAILURE = nil
Lobby.Process.DO_NOTHING_IF_ERROR = nil
Lobby.Process.AddActions = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	if f1_arg1 ~= nil and f1_arg1.require ~= nil then
		local f1_local0 = false
		local f1_local1 = f1_arg0
		while f1_local1 ~= nil and f1_local0 == false do
			if f1_local1.name == f1_arg1.require then
				f1_local0 = true
			end
		end
		if f1_local0 ~= true then
			f1_arg3( "LobbyVM: AddAction called for: " .. f1_arg1.name .. " which requires: " .. f1_arg1.require .. " but does not precede this action." )
		else
			f1_arg0.success = f1_arg1
			f1_arg0.failure = f1_arg2
			f1_arg0.error = f1_arg3
			if f1_arg1 ~= nil then
				f1_arg1.parent = f1_arg0
			end
		end
		f1_local1 = f1_local1.parent
	end
	f1_arg0.success = f1_arg1
	f1_arg0.failure = f1_arg2
	f1_arg0.error = f1_arg3
	if f1_arg1 ~= nil then
		f1_arg1.parent = f1_arg0
	end
end

Lobby.Process.ForceAction = function ( f2_arg0, f2_arg1 )
	Lobby.Process.AddActions( f2_arg0, f2_arg1, f2_arg1, f2_arg1 )
end

Lobby.Process.AppendProcess = function ( f3_arg0, f3_arg1 )
	local f3_local0 = f3_arg0.head
	while f3_local0.success ~= nil do
		f3_local0 = f3_local0.success
	end
	f3_local0.success = f3_arg1.head
end

Lobby.Process.GetForwardFunc = function ( f4_arg0, f4_arg1 )
	return Lobby.Core.GetForwardProcessFunc( f4_arg0, f4_arg1 )
end

Lobby.Process.GetBackFunc = function ( f5_arg0 )
	return Lobby.Core.GetBackProcessFunc( f5_arg0 )
end

Lobby.Process.Navigate = function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
	local f6_local0 = {
		head = nil,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = false
	}
	local f6_local1 = Lobby.Actions.LobbySettings( f6_arg0, f6_arg2 )
	if f6_arg3 == nil then
		f6_local0.head = navigate
		return f6_local0
	else
		local f6_local2 = Lobby.Actions.OpenSpinner()
		local f6_local3 = Lobby.Actions.CloseSpinner()
		local f6_local4 = Lobby.Actions.SwitchMode( f6_arg0, f6_arg3 )
		local f6_local5 = Lobby.Actions.UpdateUI( f6_arg0, f6_arg2 )
		f6_local0.head = f6_local2
		Lobby.Process.AddActions( f6_local2, f6_local4 )
		Lobby.Process.AddActions( f6_local4, f6_local1 )
		Lobby.Process.AddActions( f6_local1, f6_local5 )
		Lobby.Process.AddActions( f6_local5, f6_local3 )
		return f6_local0
	end
end

Lobby.Process.CreateDedicatedLANLobby = function ( f7_arg0, f7_arg1 )
	local f7_local0 = Lobby.Actions.SetNetworkMode( f7_arg0, Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN )
	local f7_local1 = Lobby.Actions.LobbySettings( f7_arg0, f7_arg1 )
	local f7_local2 = Lobby.Actions.UpdateUI( f7_arg0, f7_arg1 )
	local f7_local3 = Lobby.Actions.LobbyHostStart( f7_arg0, f7_arg1.mainMode, f7_arg1.lobbyType, f7_arg1.lobbyMode, f7_arg1.maxClients )
	local f7_local4 = Lobby.Actions.LobbyVMCall( Lobby.Timer.HostingLobby, {
		controller = f7_arg0,
		lobbyType = f7_arg1.lobbyType,
		mainMode = f7_arg1.mainMode,
		lobbyTimerType = f7_arg1.lobbyTimerType
	} )
	local f7_local5 = {
		head = f7_local0,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f7_local0, f7_local1 )
	Lobby.Process.AddActions( f7_local1, f7_local2 )
	Lobby.Process.AddActions( f7_local2, f7_local3 )
	Lobby.Process.AddActions( f7_local3, f7_local4 )
	return f7_local5
end

Lobby.Process.CreateDedicatedLobby = function ( f8_arg0, f8_arg1 )
	local f8_local0 = function ()
		Lobby.Timer.HostingLobby( {
			controller = f8_arg0,
			lobbyType = f8_arg1.lobbyType,
			mainMode = f8_arg1.mainMode,
			lobbyTimerType = f8_arg1.lobbyTimerType
		} )
		Engine.QoSProbeListenerEnable( f8_arg1.lobbyType, true )
		Engine.SetDvar( "live_dedicatedReady", 1 )
	end
	
	Engine.SetPlaylistID( Dvar.sv_playlist:get() )
	local f8_local1 = Lobby.Actions.SetNetworkMode( f8_arg0, Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
	local f8_local2 = Lobby.Actions.LobbySettings( f8_arg0, f8_arg1 )
	local f8_local3 = Lobby.Actions.UpdateUI( f8_arg0, f8_arg1 )
	local f8_local4 = Lobby.Actions.LobbyHostStart( f8_arg0, f8_arg1.mainMode, f8_arg1.lobbyType, f8_arg1.lobbyMode, f8_arg1.maxClients )
	local f8_local5 = Lobby.Actions.AdvertiseLobby( true )
	local f8_local6 = Lobby.Actions.ExecuteScript( f8_local0 )
	local f8_local7 = {
		head = f8_local1,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f8_local1, f8_local2 )
	Lobby.Process.AddActions( f8_local2, f8_local3 )
	Lobby.Process.AddActions( f8_local3, f8_local4 )
	Lobby.Process.AddActions( f8_local4, f8_local5 )
	Lobby.Process.AddActions( f8_local5, f8_local6 )
	Lobby.Process.AddActions( f8_local6, nil )
	return f8_local7
end

Lobby.Process.MergePublicGameLobby = function ( f10_arg0 )
	Lobby.Matchmaking.SetupMatchmakingQuery( f10_arg0, Lobby.Matchmaking.SearchMode.LOBBY_MERGE )
	Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionStatus.SESSION_STATUS_IDLE )
	local f10_local0 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionStatus.SESSION_STATUS_MERGE )
	end
	
	local f10_local1 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionStatus.SESSION_STATUS_IDLE )
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
		Lobby.Merge.Complete()
	end
	
	local f10_local2 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionStatus.SESSION_STATUS_IDLE )
		Lobby.Merge.Complete()
	end
	
	local f10_local3 = Lobby.Actions.ExecuteScript( f10_local0 )
	local f10_local4 = Lobby.Actions.QoSJoinSearchResults( f10_arg0, Lobby.Actions.SearchForLobby( f10_arg0 ) )
	local f10_local5 = Lobby.Actions.ExecuteScript( f10_local1 )
	local f10_local6 = Lobby.Actions.ExecuteScript( f10_local2 )
	local f10_local7 = Lobby.Actions.SearchForLobby( f10_arg0 )
	local f10_local8 = Lobby.Actions.SearchForLobby( f10_arg0 )
	local f10_local9 = Lobby.Actions.QoSJoinSearchResults( f10_arg0, f10_local7 )
	local f10_local10 = Lobby.Actions.QoSJoinSearchResults( f10_arg0, f10_local8 )
	local f10_local11 = Lobby.Actions.TimeDelay( 1000 )
	f10_local7.name = f10_local7.name .. "_1"
	f10_local8.name = f10_local8.name .. "_2"
	f10_local9.name = f10_local9.name .. "_1"
	f10_local10.name = f10_local10.name .. "_2"
	local f10_local12 = {
		head = f10_local3,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f10_local3, f10_local7 )
	Lobby.Process.AddActions( f10_local7, f10_local9, f10_local11, f10_local6 )
	Lobby.Process.AddActions( f10_local9, f10_local5, f10_local11, f10_local6 )
	Lobby.Process.AddActions( f10_local11, f10_local8, f10_local8, f10_local6 )
	Lobby.Process.AddActions( f10_local8, f10_local10, f10_local6, f10_local6 )
	Lobby.Process.AddActions( f10_local10, f10_local5, f10_local6, f10_local6 )
	return f10_local12
end

Lobby.Process.JoinSystemlink = function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3, f14_arg4 )
	local f14_local0 = Lobby.Actions.OpenSpinner()
	local f14_local1 = Lobby.Actions.CloseSpinner()
	local f14_local2 = Lobby.Actions.JoinHost( f14_arg0, f14_arg1, f14_arg2, f14_arg3, f14_arg4 )
	local f14_local3 = Lobby.Actions.CloseSpinner()
	Lobby.Process.ForceAction( f14_local3, Lobby.Actions.ErrorPopup( f14_local2 ) )
	local f14_local4 = {
		head = f14_local0,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f14_local0, f14_local2 )
	Lobby.Process.AddActions( f14_local2, f14_local1, f14_local3, f14_local3 )
	return f14_local4
end

Lobby.Process.Join = function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
	local f15_local0 = function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local f15_local1 = function ()
		return Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	
	local f15_local2 = Lobby.Actions.OpenSpinner()
	local f15_local3 = Lobby.Actions.CloseSpinner()
	local f15_local4 = Lobby.Actions.ExecuteScript( f15_local0 )
	local f15_local5 = Lobby.Actions.LeaveWithParty( 3000 )
	local f15_local6 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f15_local7 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f15_local8 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f15_local9 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f15_local10 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f15_local11 = Lobby.Actions.LobbyInfoProbe( f15_arg0, {
		xuid = f15_arg1
	} )
	local f15_local12 = Lobby.Actions.LobbyJoinXUIDExt( f15_arg0, f15_arg2, f15_local11, Enum.LobbyType.LOBBY_TYPE_COUNT )
	local f15_local13 = Lobby.Actions.ExecuteScriptWithReturn( f15_local1, true, false, false )
	local f15_local14 = Lobby.Actions.LobbyInfoProbe( f15_arg0, {
		xuid = f15_arg1
	} )
	local f15_local15 = Lobby.Actions.LobbyJoinXUIDExt( f15_arg0, f15_arg2, f15_local11, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f15_local16 = Lobby.Actions.PlatformSessionSearch( f15_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, gamertag )
	local f15_local17 = Lobby.Actions.PlatformSessionJoin( f15_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, sessionId )
	local f15_local18 = Lobby.Actions.LobbyHostStart( f15_arg0, Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyMode.LOBBY_MODE_INVALID, 1 )
	local f15_local19 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f15_local20 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f15_local21 = LobbyData.GetCurrentMenuTarget()
	local f15_local22 = Lobby.Actions.LobbySettings( f15_arg0, f15_local21.backTarget )
	local f15_local23 = Lobby.Actions.UpdateUI( f15_arg0, f15_local21.backTarget )
	local f15_local24 = Lobby.Actions.CloseSpinner()
	local f15_local25 = Lobby.Actions.ErrorPopup( f15_local12 )
	Lobby.Process.ForceAction( f15_local22, f15_local23 )
	Lobby.Process.ForceAction( f15_local23, f15_local24 )
	Lobby.Process.ForceAction( f15_local24, f15_local25 )
	local f15_local26 = f15_local24
	if isGameActive then
		f15_local26 = f15_local22
	end
	local f15_local27 = {
		head = f15_local2,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.ForceAction( f15_local2, f15_local4 )
	local f15_local28 = f15_local4
	local f15_local29 = Engine.IsInGame()
	local f15_local30 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f15_local31 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f15_local32 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f15_local33 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f15_local34 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f15_local35 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f15_local36 = f15_arg3 == LuaEnums.LEAVE_WITH_PARTY.WITH
	local f15_local37 = f15_local32
	if f15_local36 then
		f15_local36 = f15_local37 and f15_local34 > 1
	end
	local f15_local38 = false
	local f15_local39 = false
	local f15_local40 = false
	local f15_local41 = false
	if f15_local29 == true then
		f15_local38 = true
		f15_local39 = true
		f15_local40 = true
		if f15_local32 == true then
			f15_local41 = true
		end
	elseif f15_local31 == true then
		f15_local38 = true
		f15_local39 = true
		if f15_local36 == false then
			f15_local40 = true
			if f15_local32 == true then
				f15_local41 = true
			end
		end
	elseif f15_local30 == true then
		if f15_local36 == false then
			f15_local40 = true
			if f15_local32 == true then
				f15_local41 = true
			end
		end
	else
		f15_local38 = true
		f15_local39 = true
		f15_local40 = true
		f15_local41 = true
	end
	if f15_local31 == true and f15_local36 == true then
		Lobby.Process.AddActions( f15_local28, f15_local5, f15_local26, f15_local26 )
		f15_local28 = f15_local5
	end
	if f15_local38 == true then
		Lobby.Process.AddActions( f15_local28, f15_local8, f15_local26, f15_local26 )
		f15_local28 = f15_local8
	end
	if f15_local39 == true then
		Lobby.Process.AddActions( f15_local28, f15_local9, f15_local26, f15_local26 )
		f15_local28 = f15_local9
	end
	if f15_local40 == true then
		Lobby.Process.AddActions( f15_local28, f15_local10, f15_local26, f15_local26 )
		f15_local28 = f15_local10
	end
	if f15_local41 == true then
		Lobby.Process.AddActions( f15_local28, f15_local7, f15_local26, f15_local26 )
		f15_local28 = f15_local7
	end
	if f15_local32 == false or f15_local41 == true then
		Lobby.Process.AddActions( f15_local28, f15_local18, f15_local24, f15_local24 )
		Lobby.Process.AddActions( f15_local18, f15_local19, f15_local24, f15_local24 )
		f15_local28 = f15_local19
	end
	if f15_local40 == true then
		Lobby.Process.AddActions( f15_local28, f15_local20, f15_local24, f15_local24 )
		f15_local28 = f15_local20
	end
	Lobby.Process.AddActions( f15_local28, f15_local11, f15_local26, f15_local26 )
	Lobby.Process.AddActions( f15_local11, f15_local12, f15_local26, f15_local26 )
	Lobby.Process.AddActions( f15_local12, f15_local13, f15_local26, f15_local26 )
	Lobby.Process.AddActions( f15_local13, f15_local14, f15_local16, f15_local16 )
	Lobby.Process.AddActions( f15_local14, f15_local15, f15_local26, f15_local26 )
	Lobby.Process.AddActions( f15_local15, f15_local16, f15_local26, f15_local26 )
	Lobby.Process.AddActions( f15_local16, f15_local17, f15_local26, f15_local26 )
	Lobby.Process.AddActions( f15_local17, f15_local3, f15_local26, f15_local26 )
	return f15_local27
end

Lobby.Process.PS4AcceptInvite = function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
	local f18_local0 = function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local f18_local1 = Lobby.Actions.OpenSpinner()
	local f18_local2 = Lobby.Actions.CloseSpinner()
	local f18_local3 = Lobby.Actions.CloseSpinner()
	f18_local3.name = f18_local3.name .. "Error"
	local f18_local4 = Lobby.Actions.ConnectingToDemonware( f18_arg0, 15000 )
	local f18_local5 = Lobby.Actions.ExecuteScript( f18_local0 )
	local f18_local6 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f18_local7 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f18_local8 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f18_local9 = Lobby.Actions.PlatformSessionGetInviteInfo( f18_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f18_arg1 )
	local f18_local10 = Lobby.Actions.GamertagsToXuids( f18_arg0, f18_local9 )
	local f18_local11 = Lobby.Actions.LobbyInfoProbe( f18_arg0, f18_local10 )
	local f18_local12 = Lobby.Actions.LobbyJoinXUID( f18_arg0, f18_local10, f18_arg2 )
	local f18_local13 = Lobby.Actions.ErrorPopup( f18_local12 )
	local f18_local14 = Lobby.Actions.PlatformSessionSearch( f18_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, gamertag )
	local f18_local15 = Lobby.Actions.PlatformSessionJoin( f18_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, sessionId )
	local f18_local16 = Lobby.Actions.LobbyHostStart( f18_arg0, Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyMode.LOBBY_MODE_INVALID, 1 )
	local f18_local17 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f18_local18 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f18_local19 = {
		head = f18_local1,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f18_local1, f18_local5 )
	Lobby.Process.AddActions( f18_local5, f18_local4 )
	Lobby.Process.AddActions( f18_local4, f18_local6 )
	Lobby.Process.AddActions( f18_local6, f18_local7 )
	local f18_local20 = f18_local7
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) == false then
		if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
			Lobby.Process.AddActions( f18_local20, f18_local8, f18_local3, f18_local3 )
			f18_local20 = f18_local8
		end
		Lobby.Process.AddActions( f18_local20, f18_local16, f18_local3, f18_local3 )
		Lobby.Process.AddActions( f18_local16, f18_local17, f18_local3, f18_local3 )
		Lobby.Process.AddActions( f18_local17, f18_local18, f18_local3, f18_local3 )
		f18_local20 = f18_local18
	end
	Lobby.Process.AddActions( f18_local20, f18_local9, f18_local3, f18_local3 )
	Lobby.Process.AddActions( f18_local9, f18_local10, f18_local3, f18_local3 )
	Lobby.Process.AddActions( f18_local10, f18_local11, f18_local3, f18_local3 )
	Lobby.Process.AddActions( f18_local11, f18_local12, f18_local3, f18_local3 )
	Lobby.Process.AddActions( f18_local12, f18_local14, f18_local3, f18_local3 )
	Lobby.Process.AddActions( f18_local14, f18_local15, f18_local3, f18_local3 )
	Lobby.Process.AddActions( f18_local15, f18_local2, f18_local3, f18_local3 )
	Lobby.Process.AddActions( f18_local3, f18_local13, f18_local13, f18_local13 )
	return f18_local19
end

Lobby.Process.PS4SessionJoin = function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3 )
	local f20_local0 = function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local f20_local1 = Lobby.Actions.OpenSpinner()
	local f20_local2 = Lobby.Actions.CloseSpinner()
	local f20_local3 = Lobby.Actions.CloseSpinner()
	local f20_local4 = Lobby.Actions.ExecuteScript( f20_local0 )
	local f20_local5 = Lobby.Actions.ConnectingToDemonware( f20_arg0, 15000 )
	local f20_local6 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f20_local7 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f20_local8 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f20_local9 = Lobby.Actions.PlatformSessionGetSessionInfo( f20_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f20_arg1 )
	local f20_local10 = Lobby.Actions.GamertagsToXuids( f20_arg0, f20_local9 )
	local f20_local11 = Lobby.Actions.LobbyInfoProbe( f20_arg0, f20_local10 )
	local f20_local12 = Lobby.Actions.LobbyJoinXUID( f20_arg0, f20_local10, f20_arg2 )
	local f20_local13 = Lobby.Actions.ErrorPopup( f20_local12 )
	local f20_local14 = Lobby.Actions.PlatformSessionSearch( f20_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, gamertag )
	local f20_local15 = Lobby.Actions.PlatformSessionJoin( f20_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f20_arg1 )
	local f20_local16 = Lobby.Actions.LobbyHostStart( f20_arg0, Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyMode.LOBBY_MODE_INVALID, 1 )
	local f20_local17 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f20_local18 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f20_local19 = {
		head = f20_local1,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f20_local1, f20_local4 )
	Lobby.Process.AddActions( f20_local4, f20_local5 )
	Lobby.Process.AddActions( f20_local5, f20_local6 )
	Lobby.Process.AddActions( f20_local6, f20_local7 )
	local f20_local20 = f20_local7
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) == false then
		if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
			Lobby.Process.AddActions( f20_local20, f20_local8, f20_local3, f20_local3 )
			f20_local20 = f20_local8
		end
		Lobby.Process.AddActions( f20_local20, f20_local16, f20_local3, f20_local3 )
		Lobby.Process.AddActions( f20_local16, f20_local17, f20_local3, f20_local3 )
		Lobby.Process.AddActions( f20_local17, f20_local18, f20_local3, f20_local3 )
		f20_local20 = f20_local18
	end
	Lobby.Process.AddActions( f20_local20, f20_local9, f20_local3, f20_local3 )
	Lobby.Process.AddActions( f20_local9, f20_local10, f20_local3, f20_local3 )
	Lobby.Process.AddActions( f20_local10, f20_local11, f20_local3, f20_local3 )
	Lobby.Process.AddActions( f20_local11, f20_local12, f20_local3, f20_local3 )
	Lobby.Process.AddActions( f20_local12, f20_local15, f20_local3, f20_local3 )
	Lobby.Process.AddActions( f20_local12, f20_local14, f20_local3, f20_local3 )
	Lobby.Process.AddActions( f20_local14, f20_local15, f20_local3, f20_local3 )
	Lobby.Process.AddActions( f20_local15, f20_local2, f20_local3, f20_local3 )
	Lobby.Process.AddActions( f20_local3, f20_local13, f20_local13, f20_local13 )
	return f20_local19
end

Lobby.Process.ReloadPrivateLobby = function ( f22_arg0, f22_arg1 )
	local f22_local0 = Lobby.Actions.OpenSpinner()
	local f22_local1 = Lobby.Actions.CloseSpinner()
	local f22_local2 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f22_local3 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f22_local4 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f22_local5 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f22_local6 = Lobby.Actions.SetNetworkMode( f22_arg0, f22_arg1 )
	local f22_local7 = Lobby.Actions.LobbyHostStart( f22_arg0, Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyMode.LOBBY_MODE_INVALID, 8 )
	local f22_local8 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f22_local9 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f22_local10 = {
		head = f22_local0,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f22_local0, f22_local2 )
	Lobby.Process.AddActions( f22_local2, f22_local3 )
	Lobby.Process.AddActions( f22_local3, f22_local4 )
	Lobby.Process.AddActions( f22_local4, f22_local5 )
	Lobby.Process.AddActions( f22_local5, f22_local6 )
	Lobby.Process.AddActions( f22_local6, f22_local7 )
	Lobby.Process.AddActions( f22_local7, f22_local8 )
	Lobby.Process.AddActions( f22_local8, f22_local9 )
	Lobby.Process.AddActions( f22_local9, f22_local1 )
	return f22_local10
end

Lobby.Process.Recover = function ( f23_arg0 )
	local f23_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	if f23_local0.id == LobbyData.UITargets.UI_MAIN.id then
		return nil
	end
	local f23_local1 = f23_local0.errTarget.backTarget
	local f23_local2 = f23_local0.errTarget
	local f23_local3 = Lobby.Actions.LobbyInRecovery()
	local f23_local4 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f23_local5 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f23_local6 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f23_local7 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f23_local8 = Lobby.Actions.LobbySettings( f23_arg0, f23_local2 )
	local f23_local9 = Lobby.Actions.ForceLobbyUIScreen( f23_arg0, f23_local2.id )
	local f23_local10 = Lobby.Actions.UpdateUI( f23_arg0, f23_local2 )
	local f23_local11 = Lobby.Actions.CloseSpinner()
	local f23_local12 = {
		head = f23_local3,
		interrupt = Lobby.Interrupt.NONE,
		tail = nil,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f23_local3, f23_local6 )
	Lobby.Process.AddActions( f23_local6, f23_local7 )
	Lobby.Process.AddActions( f23_local7, f23_local4 )
	Lobby.Process.AddActions( f23_local4, f23_local5 )
	Lobby.Process.AddActions( f23_local5, f23_local8 )
	local f23_local13 = f23_local8
	if f23_local1 ~= nil then
		if f23_local1.lobbyType == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_INVALID then
			
		elseif f23_local1.lobbyType ~= f23_local2.lobbyType then
			local f23_local14 = Lobby.Actions.LobbyHostStart( f23_arg0, f23_local1.mainMode, f23_local1.lobbyType, f23_local1.lobbyMode, f23_local1.maxClients )
			local f23_local15 = Lobby.Actions.LobbyHostAddPrimary( f23_local1.lobbyType )
			local f23_local16 = Lobby.Actions.LobbyClientStart( f23_local1.lobbyType )
			f23_local14.name = f23_local14.name .. "_1"
			Lobby.Process.AddActions( f23_local13, f23_local14 )
			Lobby.Process.AddActions( f23_local14, f23_local15 )
			Lobby.Process.AddActions( f23_local15, f23_local16 )
			f23_local13 = f23_local16
		end
	end
	if f23_local2.lobbyType == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
		local f23_local14 = Lobby.Actions.LobbyHostStart( f23_arg0, f23_local2.mainMode, f23_local2.lobbyType, f23_local2.lobbyMode, f23_local2.maxClients )
		local f23_local15 = Lobby.Actions.LobbyHostAddPrimary( f23_local2.lobbyType )
		local f23_local16 = Lobby.Actions.LobbyClientStart( f23_local2.lobbyType )
		f23_local14.name = f23_local14.name .. "_2"
		Lobby.Process.AddActions( f23_local13, f23_local14 )
		Lobby.Process.AddActions( f23_local14, f23_local15 )
		Lobby.Process.AddActions( f23_local15, f23_local16 )
		f23_local13 = f23_local16
	elseif f23_local2.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
		local f23_local14 = function ()
			Engine.SetLobbyMaxClients( f23_local2.lobbyType, Dvar.party_maxplayers:get() )
		end
		
		local f23_local15 = Lobby.Actions.LobbyHostStart( f23_arg0, f23_local2.mainMode, f23_local2.lobbyType, f23_local2.lobbyMode, f23_local2.maxClients )
		local f23_local16 = Lobby.Actions.LobbyInfoProbe( f23_arg0, {
			xuid = Engine.GetXUID64( f23_arg0 )
		} )
		local f23_local17 = Lobby.Actions.LobbyJoinXUID( f23_arg0, {
			xuid = Engine.GetXUID64( f23_arg0 )
		}, Enum.JoinType.JOIN_TYPE_PARTY )
		local f23_local18 = Lobby.Actions.LobbyVMCall( Lobby.Timer.HostingLobby, {
			controller = f23_arg0,
			lobbyType = f23_local2.lobbyType,
			mainMode = f23_local2.mainMode,
			lobbyTimerType = f23_local2.lobbyTimerType
		} )
		f23_local15.name = f23_local15.name .. "_3"
		local f23_local19 = Lobby.Actions.RunPlaylistSettings( f23_arg0 )
		local f23_local20 = Lobby.Actions.AdvertiseLobby( true )
		local f23_local21 = Lobby.Actions.ExecuteScript( f23_local14 )
		Lobby.Process.AddActions( f23_local13, f23_local15 )
		Lobby.Process.AddActions( f23_local15, f23_local16 )
		Lobby.Process.AddActions( f23_local16, f23_local17 )
		f23_local13 = f23_local17
		if f23_local2.lobbyMode == Enum.LobbyMode.LOBBY_MODE_PUBLIC then
			Lobby.Process.AddActions( f23_local13, f23_local19 )
			Lobby.Process.AddActions( f23_local19, f23_local20 )
			Lobby.Process.AddActions( f23_local20, f23_local21 )
			f23_local13 = f23_local21
		end
		Lobby.Process.AddActions( f23_local13, f23_local18 )
		f23_local13 = f23_local18
	end
	Lobby.Process.AddActions( f23_local13, f23_local9 )
	Lobby.Process.AddActions( f23_local9, f23_local10 )
	Lobby.Process.AddActions( f23_local10, f23_local11 )
	Lobby.Process.AddActions( f23_local11, nil )
	f23_local12.tail = f23_local11
	return f23_local12
end

Lobby.Process.ForceToMenu = function ( f25_arg0, f25_arg1, f25_arg2 )
	local f25_local0 = f25_arg1.isPrivate
	local f25_local1 = f25_arg1.mainMode
	local f25_local2 = f25_arg1.networkMode
	local f25_local3 = f25_arg1.maxClients
	local f25_local4 = Lobby.Actions.LobbySettings( f25_arg0, f25_arg1 )
	local f25_local5 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f25_local6 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f25_local7 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f25_local8 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f25_local9 = Lobby.Actions.ForceLobbyUIScreen( f25_arg0, f25_arg1.id )
	local f25_local10 = Lobby.Actions.UpdateUI( f25_arg0, f25_arg1 )
	local f25_local11 = {
		head = f25_local4,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f25_local4, f25_local7 )
	Lobby.Process.AddActions( f25_local7, f25_local8 )
	Lobby.Process.AddActions( f25_local8, f25_local5 )
	Lobby.Process.AddActions( f25_local5, f25_local6 )
	local f25_local12 = f25_local6
	if f25_local0 == true then
		local f25_local13 = Lobby.Actions.LobbyHostStart( f25_arg0, f25_local1, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f25_arg1.lobbyMode, f25_local3 )
		local f25_local14 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		local f25_local15 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		Lobby.Process.AddActions( f25_local8, f25_local13 )
		Lobby.Process.AddActions( f25_local13, f25_local14 )
		Lobby.Process.AddActions( f25_local14, f25_local15 )
		f25_local12 = f25_local15
	end
	Lobby.Process.AddActions( f25_local12, f25_local9 )
	Lobby.Process.AddActions( f25_local9, f25_local10 )
	if f25_arg2 ~= nil then
		Lobby.Process.AddActions( f25_local10, Lobby.Actions.ErrorPopupMsg( f25_arg2 ) )
	end
	return f25_local11
end

Lobby.Process.HostLeftNoMigrationCreatePrivateLobby = function ( f26_arg0, f26_arg1, f26_arg2 )
	local f26_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f26_local1 = Lobby.Actions.OpenSpinner( true )
	local f26_local2 = Lobby.Actions.CloseSpinner()
	local f26_local3 = Lobby.Actions.CloseSpinner()
	local f26_local4 = Lobby.Actions.LobbyHostStart( f26_arg0, f26_arg1, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f26_local0.lobbyMode, f26_arg2 )
	local f26_local5 = Lobby.Actions.LobbyHostAddPrimary( f26_local4.lobbyType )
	local f26_local6 = Lobby.Actions.LobbyClientStart( f26_local4.lobbyType )
	local f26_local7 = Lobby.Actions.ErrorPopup( f26_local4 )
	local f26_local8 = {
		head = f26_local1,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f26_local1, f26_local4 )
	Lobby.Process.AddActions( f26_local4, f26_local5 )
	Lobby.Process.AddActions( f26_local5, f26_local6 )
	Lobby.Process.AddActions( f26_local6, f26_local2 )
	Lobby.Process.AddActions( f26_local3, f26_local7 )
	return f26_local8
end

Lobby.Process.PromoteClientToPrivateLobbyHost = function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3, f27_arg4, f27_arg5, f27_arg6, f27_arg7, f27_arg8 )
	local f27_local0 = Engine.GetLobbyUIScreen()
	local f27_local1 = LobbyData:UITargetFromId( f27_local0 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Process.PromoteClientToPrivateLobbyHost: menuId(" .. f27_local0 .. "), lobbyType(" .. f27_arg2 .. "), mainMode(" .. f27_arg1 .. "), lobbyTimerType(" .. f27_local1.lobbyTimerType .. ").\n" )
	local f27_local2 = Lobby.Actions.PromoteToHostDone( f27_arg0, f27_arg2, f27_arg8, f27_arg7 )
	local f27_local3 = Lobby.Actions.LobbyHostStartMigratedInfo( f27_arg0, f27_arg1, f27_arg2, f27_arg3, f27_arg4, f27_arg5 )
	local f27_local4 = {
		head = f27_local2,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	if Engine.IsLobbyHost( f27_arg2 ) == false then
		f27_local4.head = f27_local3
		Lobby.Process.AddActions( f27_local3, f27_local2 )
		Lobby.Process.AddActions( f27_local2, nil )
	end
	return f27_local4
end

Lobby.Process.TransferDataFromClientModuleToHostModule = function ()
	local f28_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	for f28_local4, f28_local5 in ipairs( f28_local0.sessionClients ) do
		Engine.LobbyHostAssignMapVoteToClient( f28_local5.xuid, f28_local5.mapVote )
		Engine.LobbyHostAssignTeamToClient( f28_local5.xuid, f28_local5.team )
	end
end

Lobby.Process.PromoteClientToGameLobbyHost = function ( f29_arg0, f29_arg1, f29_arg2, f29_arg3, f29_arg4, f29_arg5, f29_arg6, f29_arg7, f29_arg8 )
	local f29_local0 = Engine.GetLobbyUIScreen()
	local f29_local1 = LobbyData:UITargetFromId( f29_local0 )
	local f29_local2, f29_local3 = Engine.GetGameLobbyStatusInfo()
	local f29_local4 = function ()
		if not Engine.IsInGame() and f29_local1.lobbyTimerType ~= LuaEnums.TIMER_TYPE.INVALID then
			Lobby.Timer.HostingLobby( {
				controller = f29_arg0,
				lobbyType = f29_arg2,
				mainMode = f29_arg1,
				lobbyTimerType = f29_local1.lobbyTimerType,
				status = f29_local2,
				statusValue = f29_local3
			} )
		end
		Engine.QoSProbeListenerEnable( f29_arg2, f29_arg3 == Enum.LobbyMode.LOBBY_MODE_PUBLIC )
		Lobby.Process.TransferDataFromClientModuleToHostModule()
	end
	
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Process.PromoteClientToGameLobbyHost: menuId(" .. f29_local0 .. "), lobbyType(" .. f29_arg2 .. "), mainMode(" .. f29_arg1 .. "), lobbyTimerType(" .. f29_local1.lobbyTimerType .. ").\n" )
	local f29_local5 = Lobby.Actions.PromoteToHostDone( f29_arg0, f29_arg2, f29_arg8, f29_arg7 )
	local f29_local6 = Lobby.Actions.LobbyHostStartMigratedInfo( f29_arg0, f29_arg1, f29_arg2, f29_arg3, f29_arg4, f29_arg5 )
	local f29_local7 = Lobby.Actions.ExecuteScript( f29_local4 )
	local f29_local8 = Lobby.Actions.AdvertiseLobby( true )
	local f29_local9 = Lobby.Actions.LobbySettings( f29_arg0, f29_local1 )
	local f29_local10 = Lobby.Actions.RunPlaylistSettings( f29_arg0 )
	local f29_local11 = {
		head = f29_local5,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	if Engine.IsLobbyHost( f29_arg2 ) == false then
		f29_local11.head = f29_local6
		Lobby.Process.AddActions( f29_local6, f29_local5 )
		Lobby.Process.AddActions( f29_local5, f29_local7 )
		if f29_arg6 == true then
			Lobby.Process.AddActions( f29_local7, f29_local8 )
			if f29_arg7 == true then
				Lobby.Process.AddActions( f29_local8 )
			else
				Lobby.Process.AddActions( f29_local8, f29_local9 )
				Lobby.Process.AddActions( f29_local9 )
			end
		else
			Lobby.Process.AddActions( f29_local7 )
		end
	end
	return f29_local11
end

Lobby.Process.PromoteClientToHost = function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3, f31_arg4, f31_arg5, f31_arg6, f31_arg7, f31_arg8 )
	local f31_local0 = nil
	if f31_arg2 == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
		f31_local0 = Lobby.Process.PromoteClientToPrivateLobbyHost( f31_arg0, f31_arg1, f31_arg2, f31_arg3, f31_arg4, f31_arg5, f31_arg6, f31_arg7, f31_arg8 )
	elseif f31_arg2 == Enum.LobbyType.LOBBY_TYPE_GAME then
		f31_local0 = Lobby.Process.PromoteClientToGameLobbyHost( f31_arg0, f31_arg1, f31_arg2, f31_arg3, f31_arg4, f31_arg5, f31_arg6, f31_arg7, f31_arg8 )
	end
	return f31_local0
end

Lobby.Process.LocalClientLeave = function ( f32_arg0 )
	local f32_local0 = Lobby.Actions.LobbyLocalClientLeave( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f32_arg0 )
	local f32_local1 = Lobby.Actions.LobbyLocalClientLeave( Enum.LobbyType.LOBBY_TYPE_GAME, f32_arg0 )
	local f32_local2 = {
		head = f32_local1,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = false
	}
	Lobby.Process.AddActions( f32_local1, f32_local0 )
	Lobby.Process.AddActions( f32_local0 )
	return f32_local2
end

Lobby.Process.LeaveWithParty = function ( f33_arg0, f33_arg1, f33_arg2 )
	local f33_local0 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f33_local1 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f33_local2 = nil
	if f33_arg0 ~= Enum.LobbyModule.LOBBY_MODULE_CLIENT or f33_local1 == false then
		return 
	end
	local f33_local3 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f33_local4 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f33_local5 = {
		head = f33_local3,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	if f33_local0 == true then
		Lobby.Process.AddActions( f33_local3, f33_local4 )
	end
	return f33_local5
end

Lobby.Process.ManagePartyLeave = function ( f34_arg0 )
	if LobbyData:UITargetFromId( LobbyData.GetLobbyNav() ) == nil then
		error( "LobbyVM: No menu called '" .. currentMenu .. "' found." )
	end
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) == false or Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) == false then
		return nil
	else
		local f34_local0 = Engine.GetLobbyMainMode()
		local f34_local1 = Engine.GetLobbyMode( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		local f34_local2 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		local f34_local3 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		local f34_local4 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		local f34_local5 = Lobby.Actions.LobbyHostStart( f34_arg0, f34_local0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f34_local1, f34_local2 )
		local f34_local6 = Lobby.Actions.LobbyHostAddPrimary( f34_local5.lobbyType )
		local f34_local7 = Lobby.Actions.LobbyClientStart( f34_local5.lobbyType )
		local f34_local8 = {
			head = f34_local3,
			interrupt = Lobby.Interrupt.NONE,
			force = true,
			cancellable = true
		}
		Lobby.Process.AddActions( f34_local3, f34_local4 )
		Lobby.Process.AddActions( f34_local4, f34_local5 )
		Lobby.Process.AddActions( f34_local5, f34_local6 )
		Lobby.Process.AddActions( f34_local6, f34_local7 )
		return f34_local8
	end
end

Lobby.Process.NonFatalError = function ( f35_arg0 )
	local f35_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	return {
		head = Lobby.Actions.ErrorPopupMsg( f35_arg0 ),
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
end

Lobby.Process.FatalError = function ( f36_arg0 )
	local f36_local0 = Engine.GetPrimaryController()
	local f36_local1 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f36_local2 = LobbyData.UITargets.UI_MAIN
	local f36_local3 = Lobby.Actions.OpenSpinner()
	local f36_local4 = Lobby.Actions.CloseSpinner()
	local f36_local5 = Lobby.Actions.LobbySettings( f36_local0, f36_local2 )
	local f36_local6 = Lobby.Actions.UpdateUI( f36_local0, f36_local2 )
	local f36_local7 = Lobby.Actions.ErrorPopupMsg( f36_arg0 )
	local f36_local8 = {
		head = f36_local3,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f36_local3, f36_local5 )
	Lobby.Process.AddActions( f36_local5, f36_local5 )
	Lobby.Process.AddActions( f36_local5, f36_local6 )
	Lobby.Process.AddActions( f36_local6, f36_local4 )
	Lobby.Process.AddActions( f36_local4, f36_local7 )
	return f36_local8
end

Lobby.Process.Reset = function ()
	local f37_local0 = Engine.GetPrimaryController()
	local f37_local1 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f37_local2 = LobbyData.UITargets.UI_MAIN
	local f37_local3 = Lobby.Actions.CloseSpinner()
	local f37_local4 = Lobby.Actions.CloseSpinner()
	local f37_local5 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f37_local6 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f37_local7 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f37_local8 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f37_local9 = Lobby.Actions.LobbySettings( f37_local0, f37_local2 )
	local f37_local10 = Lobby.Actions.UpdateUI( f37_local0, f37_local2 )
	local f37_local11 = {
		head = f37_local8,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f37_local3, f37_local8 )
	Lobby.Process.AddActions( f37_local8, f37_local7 )
	Lobby.Process.AddActions( f37_local7, f37_local6 )
	Lobby.Process.AddActions( f37_local6, f37_local5 )
	Lobby.Process.AddActions( f37_local5, f37_local9 )
	Lobby.Process.AddActions( f37_local9, f37_local10 )
	Lobby.Process.AddActions( f37_local10, f37_local4 )
	return f37_local11
end

Lobby.Process.DevmapClient = function ( f38_arg0 )
	local f38_local0 = LobbyData.UITargets.UI_MODESELECT
	local f38_local1 = f38_local0.mainMode
	local f38_local2 = f38_local0.lobbyType
	local f38_local3 = f38_local0.lobbyMode
	local f38_local4 = f38_local0.maxClients
	local f38_local5 = Lobby.Actions.LobbySettings( f38_arg0, f38_local0 )
	local f38_local6 = Lobby.Actions.UpdateUI( f38_arg0, f38_local0 )
	local f38_local7 = Lobby.Actions.SetNetworkMode( f38_arg0, Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN )
	local f38_local8 = Lobby.Actions.LobbyHostStart( f38_arg0, f38_local1, f38_local2, f38_local3, f38_local4 )
	local f38_local9 = Lobby.Actions.LobbyHostAddPrimary( f38_local2 )
	local f38_local10 = Lobby.Actions.LobbyClientStart( f38_local2 )
	local f38_local11 = {
		head = f38_local5,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f38_local5, f38_local6 )
	Lobby.Process.AddActions( f38_local6, f38_local7 )
	Lobby.Process.AddActions( f38_local7, f38_local8 )
	Lobby.Process.AddActions( f38_local8, f38_local9 )
	Lobby.Process.AddActions( f38_local9, f38_local10 )
	return f38_local11
end

Lobby.Process.Devmap = function ( f39_arg0, f39_arg1 )
	local f39_local0 = LobbyData.UITargets.UI_MODESELECT
	local f39_local1 = LobbyData.UITargets.UI_MAIN
	if f39_arg1 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		f39_local1 = LobbyData.UITargets.UI_CPLOBBYLANGAME
	elseif f39_arg1 == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		f39_local1 = LobbyData.UITargets.UI_ZMLOBBYLANGAME
	elseif f39_arg1 == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		f39_local1 = LobbyData.UITargets.UI_MPLOBBYLANGAME
	end
	if f39_local1 == LobbyData.UITargets.UI_CPLOBBYLANGAME and Dvar.ui_gametype:get() == "cpzm" then
		f39_local1 = LobbyData.UITargets.UI_CP2LOBBYLANGAME
	end
	local f39_local2 = f39_local0.mainMode
	local f39_local3 = f39_local0.lobbyType
	local f39_local4 = f39_local0.lobbyMode
	local f39_local5 = f39_local0.maxClients
	local f39_local6 = f39_local1.mainMode
	local f39_local7 = f39_local1.lobbyType
	local f39_local8 = f39_local1.lobbyMode
	local f39_local9 = f39_local1.maxClients
	local f39_local10 = Lobby.Actions.LobbySettings( f39_arg0, f39_local1 )
	local f39_local11 = Lobby.Actions.UpdateUI( f39_arg0, f39_local1 )
	local f39_local12 = Lobby.Actions.SetNetworkMode( f39_arg0, Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN )
	local f39_local13 = Lobby.Actions.LobbyHostStart( f39_arg0, f39_local2, f39_local3, f39_local4, f39_local5 )
	local f39_local14 = Lobby.Actions.LobbyHostAddPrimary( f39_local3 )
	local f39_local15 = Lobby.Actions.LobbyClientStart( f39_local3 )
	local f39_local16 = Lobby.Actions.LobbyHostStart( f39_arg0, f39_local6, f39_local7, f39_local8, f39_local9 )
	local f39_local17 = Lobby.Actions.LobbyHostAddPrimary( f39_local7 )
	local f39_local18 = Lobby.Actions.LobbyClientStart( f39_local7 )
	local f39_local19 = Lobby.Actions.SetGameAndTypeMapName( f39_arg0, lobbyType, Dvar.ui_gametype:get(), Dvar.ui_mapname:get() )
	local f39_local20 = {
		head = f39_local10,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f39_local10, f39_local11 )
	Lobby.Process.AddActions( f39_local11, f39_local12 )
	Lobby.Process.AddActions( f39_local12, f39_local13 )
	Lobby.Process.AddActions( f39_local13, f39_local14 )
	Lobby.Process.AddActions( f39_local14, f39_local15 )
	Lobby.Process.AddActions( f39_local15, f39_local16 )
	Lobby.Process.AddActions( f39_local16, f39_local19 )
	Lobby.Process.AddActions( f39_local19, f39_local17 )
	if Dvar.splitscreen:get() == true and Dvar.splitscreen_playerCount:get() > 1 then
		local f39_local21 = Lobby.Actions.LobbyHostAddLocal( 1, f39_local7 )
		Lobby.Process.AddActions( f39_local17, f39_local21 )
		Lobby.Process.AddActions( f39_local21, f39_local18 )
	else
		Lobby.Process.AddActions( f39_local17, f39_local18 )
	end
	return f39_local20
end

Lobby.Process.PrimaryControllerSignedIn = function ( f40_arg0 )
	local f40_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f40_local1 = LobbyData.UITargets.UI_MAIN
	local f40_local2 = Lobby.Actions.OpenSpinner()
	local f40_local3 = Lobby.Actions.CloseSpinner()
	local f40_local4 = Lobby.Actions.LobbySettings( f40_arg0, f40_local1 )
	local f40_local5 = Lobby.Actions.UpdateUI( f40_arg0, f40_local1 )
	local f40_local6 = Lobby.Actions.SignUserInToLive( f40_arg0 )
	local f40_local7 = Lobby.Actions.ErrorPopupMsg( XBOXLIVE_SIGNEDOUT )
	local f40_local8 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f40_local9 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f40_local10 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f40_local11 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f40_local12 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f40_local13 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f40_local14 = {
		head = f40_local2,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f40_local2, f40_local4 )
	Lobby.Process.AddActions( f40_local4, f40_local5 )
	Lobby.Process.AddActions( f40_local5, f40_local12 )
	Lobby.Process.AddActions( f40_local12, f40_local13 )
	Lobby.Process.AddActions( f40_local13, f40_local10 )
	Lobby.Process.AddActions( f40_local10, f40_local11 )
	Lobby.Process.AddActions( f40_local11, f40_local6 )
	Lobby.Process.AddActions( f40_local6, f40_local3 )
	Lobby.Process.AddActions( f40_local3, f40_local7 )
	return f40_local14
end

Lobby.Process.PrimaryControllerSignedOut = function ( f41_arg0 )
	local f41_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f41_local1 = LobbyData.UITargets.UI_MAIN
	local f41_local2 = Lobby.Actions.OpenSpinner()
	local f41_local3 = Lobby.Actions.CloseSpinner()
	local f41_local4 = Lobby.Actions.LobbySettings( f41_arg0, f41_local1 )
	local f41_local5 = Lobby.Actions.UpdateUI( f41_arg0, f41_local1 )
	local f41_local6 = Lobby.Actions.SignUserOutOfLive( f41_arg0 )
	local f41_local7 = Lobby.Actions.ErrorPopupMsg( XBOXLIVE_SIGNEDOUT )
	local f41_local8 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f41_local9 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f41_local10 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f41_local11 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f41_local12 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f41_local13 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f41_local14 = {
		head = f41_local2,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f41_local2, f41_local4 )
	Lobby.Process.AddActions( f41_local4, f41_local5 )
	Lobby.Process.AddActions( f41_local5, f41_local12 )
	Lobby.Process.AddActions( f41_local12, f41_local13 )
	Lobby.Process.AddActions( f41_local13, f41_local10 )
	Lobby.Process.AddActions( f41_local10, f41_local11 )
	Lobby.Process.AddActions( f41_local11, f41_local6 )
	Lobby.Process.AddActions( f41_local6, f41_local3 )
	Lobby.Process.AddActions( f41_local3, f41_local7 )
	return f41_local14
end

Lobby.Process.ReAdvertiseLobby = function ( f42_arg0 )
	local f42_local0 = function ()
		Dvar.lobbyAdvertiseDirty:set( true )
	end
	
	local f42_local1 = Lobby.Actions.AdvertiseLobby( false )
	local f42_local2 = Lobby.Actions.AdvertiseLobby( true )
	local f42_local3 = Lobby.Actions.ExecuteScript( f42_local0 )
	local f42_local4 = {
		head = f42_local1,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = false
	}
	Lobby.Process.ForceAction( f42_local1, f42_local2 )
	Lobby.Process.ForceAction( f42_local2, f42_local3 )
	return f42_local4
end

