require( "lua.Lobby.Process.LobbyActions" )
require( "lua.Lobby.Matchmaking.LobbyMatchmaking" )

Lobby.ProcessPlatform = {}
Lobby.ProcessPlatform.PS4AcceptInvite = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	local f1_local0 = function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local f1_local1 = Lobby.Actions.OpenSpinner()
	local f1_local2 = Lobby.Actions.CloseSpinner()
	local f1_local3 = Lobby.Actions.CloseSpinner()
	f1_local3.name = f1_local3.name .. "Error"
	local f1_local4 = Lobby.Actions.ConnectingToDemonware( f1_arg0, 15000 )
	local f1_local5 = Lobby.Actions.ExecuteScript( f1_local0 )
	local f1_local6 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f1_local7 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f1_local8 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f1_local9 = Lobby.Actions.PlatformSessionGetInviteInfo( f1_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f1_arg1 )
	local f1_local10 = Lobby.Actions.GamertagsToXuids( f1_arg0, f1_local9 )
	local f1_local11 = Lobby.Actions.LobbyInfoProbe( f1_arg0, f1_local10 )
	local f1_local12 = Lobby.Actions.LobbyJoinXUID( f1_arg0, f1_local10, f1_arg2 )
	local f1_local13 = Lobby.Actions.ErrorPopup( f1_local12 )
	local f1_local14 = Lobby.Actions.PlatformSessionSearch( f1_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, gamertag )
	local f1_local15 = Lobby.Actions.PlatformSessionJoin( f1_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, sessionId )
	local f1_local16 = Lobby.Actions.LobbyHostStart( f1_arg0, Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyMode.LOBBY_MODE_INVALID, 1 )
	local f1_local17 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f1_local18 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f1_local19 = {
		head = f1_local1,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f1_local1, f1_local5 )
	Lobby.Process.AddActions( f1_local5, f1_local4 )
	Lobby.Process.AddActions( f1_local4, f1_local6 )
	Lobby.Process.AddActions( f1_local6, f1_local7 )
	local f1_local20 = f1_local7
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) == false then
		if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
			Lobby.Process.AddActions( f1_local20, f1_local8, f1_local3, f1_local3 )
			f1_local20 = f1_local8
		end
		Lobby.Process.AddActions( f1_local20, f1_local16, f1_local3, f1_local3 )
		Lobby.Process.AddActions( f1_local16, f1_local17, f1_local3, f1_local3 )
		Lobby.Process.AddActions( f1_local17, f1_local18, f1_local3, f1_local3 )
		f1_local20 = f1_local18
	end
	Lobby.Process.AddActions( f1_local20, f1_local9, f1_local3, f1_local3 )
	Lobby.Process.AddActions( f1_local9, f1_local10, f1_local3, f1_local3 )
	Lobby.Process.AddActions( f1_local10, f1_local11, f1_local3, f1_local3 )
	Lobby.Process.AddActions( f1_local11, f1_local12, f1_local3, f1_local3 )
	Lobby.Process.AddActions( f1_local12, f1_local14, f1_local3, f1_local3 )
	Lobby.Process.AddActions( f1_local14, f1_local15, f1_local3, f1_local3 )
	Lobby.Process.AddActions( f1_local15, f1_local2, f1_local3, f1_local3 )
	Lobby.Process.AddActions( f1_local3, f1_local13, f1_local13, f1_local13 )
	return f1_local19
end

Lobby.ProcessPlatform.PS4SessionJoin = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
	local f3_local0 = function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local f3_local1 = Lobby.Actions.OpenSpinner()
	local f3_local2 = Lobby.Actions.CloseSpinner()
	local f3_local3 = Lobby.Actions.CloseSpinner()
	local f3_local4 = Lobby.Actions.ExecuteScript( f3_local0 )
	local f3_local5 = Lobby.Actions.ConnectingToDemonware( f3_arg0, 15000 )
	local f3_local6 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f3_local7 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f3_local8 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f3_local9 = Lobby.Actions.PlatformSessionGetSessionInfo( f3_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f3_arg1 )
	local f3_local10 = Lobby.Actions.GamertagsToXuids( f3_arg0, f3_local9 )
	local f3_local11 = Lobby.Actions.LobbyInfoProbe( f3_arg0, f3_local10 )
	local f3_local12 = Lobby.Actions.LobbyJoinXUID( f3_arg0, f3_local10, f3_arg2 )
	local f3_local13 = Lobby.Actions.ErrorPopup( f3_local12 )
	local f3_local14 = Lobby.Actions.PlatformSessionSearch( f3_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, gamertag )
	local f3_local15 = Lobby.Actions.PlatformSessionJoin( f3_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f3_arg1 )
	local f3_local16 = Lobby.Actions.LobbyHostStart( f3_arg0, Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyMode.LOBBY_MODE_INVALID, 1 )
	local f3_local17 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f3_local18 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f3_local19 = {
		head = f3_local1,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f3_local1, f3_local4 )
	Lobby.Process.AddActions( f3_local4, f3_local5 )
	Lobby.Process.AddActions( f3_local5, f3_local6 )
	Lobby.Process.AddActions( f3_local6, f3_local7 )
	local f3_local20 = f3_local7
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) == false then
		if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
			Lobby.Process.AddActions( f3_local20, f3_local8, f3_local3, f3_local3 )
			f3_local20 = f3_local8
		end
		Lobby.Process.AddActions( f3_local20, f3_local16, f3_local3, f3_local3 )
		Lobby.Process.AddActions( f3_local16, f3_local17, f3_local3, f3_local3 )
		Lobby.Process.AddActions( f3_local17, f3_local18, f3_local3, f3_local3 )
		f3_local20 = f3_local18
	end
	Lobby.Process.AddActions( f3_local20, f3_local9, f3_local3, f3_local3 )
	Lobby.Process.AddActions( f3_local9, f3_local10, f3_local3, f3_local3 )
	Lobby.Process.AddActions( f3_local10, f3_local11, f3_local3, f3_local3 )
	Lobby.Process.AddActions( f3_local11, f3_local12, f3_local3, f3_local3 )
	Lobby.Process.AddActions( f3_local12, f3_local15, f3_local3, f3_local3 )
	Lobby.Process.AddActions( f3_local12, f3_local14, f3_local3, f3_local3 )
	Lobby.Process.AddActions( f3_local14, f3_local15, f3_local3, f3_local3 )
	Lobby.Process.AddActions( f3_local15, f3_local2, f3_local3, f3_local3 )
	Lobby.Process.AddActions( f3_local3, f3_local13, f3_local13, f3_local13 )
	return f3_local19
end

Lobby.ProcessPlatform.XboxJoin = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
	local f5_local0 = function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local f5_local1 = function ()
		return Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	
	local f5_local2 = Lobby.Actions.OpenSpinner()
	local f5_local3 = Lobby.Actions.CloseSpinner()
	local f5_local4 = Lobby.Actions.ExecuteScript( f5_local0 )
	local f5_local5 = Lobby.Actions.ConnectingToDemonware( f5_arg0, 15000 )
	local f5_local6 = Lobby.Actions.LeaveWithParty( 3000 )
	local f5_local7 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f5_local8 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f5_local9 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f5_local10 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f5_local11 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f5_local12 = Lobby.Actions.LobbyInfoProbe( f5_arg0, {
		xuid = f5_arg1
	} )
	local f5_local13 = Lobby.Actions.LobbyJoinXUIDExt( f5_arg0, f5_arg2, f5_local12, Enum.LobbyType.LOBBY_TYPE_COUNT )
	local f5_local14 = Lobby.Actions.ExecuteScriptWithReturn( f5_local1, true, false, false )
	local f5_local15 = Lobby.Actions.LobbyInfoProbe( f5_arg0, {
		xuid = f5_arg1
	} )
	local f5_local16 = Lobby.Actions.LobbyJoinXUIDExt( f5_arg0, f5_arg2, f5_local12, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f5_local17 = Lobby.Actions.PlatformSessionSearch( f5_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, gamertag )
	local f5_local18 = Lobby.Actions.PlatformSessionJoin( f5_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, sessionId )
	local f5_local19 = Lobby.Actions.LobbyHostStart( f5_arg0, Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyMode.LOBBY_MODE_INVALID, 1 )
	local f5_local20 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f5_local21 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f5_local22 = LobbyData.GetCurrentMenuTarget()
	local f5_local23 = Lobby.Actions.LobbySettings( f5_arg0, f5_local22.backTarget )
	local f5_local24 = Lobby.Actions.UpdateUI( f5_arg0, f5_local22.backTarget )
	local f5_local25 = Lobby.Actions.CloseSpinner()
	local f5_local26 = Lobby.Actions.ErrorPopup( f5_local13 )
	Lobby.Process.ForceAction( f5_local23, f5_local24 )
	Lobby.Process.ForceAction( f5_local24, f5_local25 )
	Lobby.Process.ForceAction( f5_local25, f5_local26 )
	local f5_local27 = f5_local25
	if isGameActive then
		f5_local27 = f5_local23
	end
	local f5_local28 = {
		head = f5_local2,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.ForceAction( f5_local2, f5_local4 )
	Lobby.Process.ForceAction( f5_local4, f5_local5 )
	local f5_local29 = f5_local5
	local f5_local30 = f5_arg3 == LuaEnums.LEAVE_WITH_PARTY.WITH
	local f5_local31 = Engine.IsInGame()
	local f5_local32 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f5_local33 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f5_local34 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f5_local35 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f5_local36 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f5_local37 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f5_local38 = false
	local f5_local39 = false
	local f5_local40 = false
	local f5_local41 = false
	if f5_local31 == true then
		f5_local38 = true
		f5_local39 = true
		f5_local40 = true
		if f5_local34 == true then
			f5_local41 = true
		end
	elseif f5_local33 == true then
		f5_local38 = true
		f5_local39 = true
		if f5_local30 == false then
			f5_local40 = true
			if f5_local34 == true then
				f5_local41 = true
			end
		end
	elseif f5_local32 == true then
		if f5_local30 == false then
			f5_local40 = true
			if f5_local34 == true then
				f5_local41 = true
			end
		end
	else
		f5_local38 = true
		f5_local39 = true
		f5_local40 = true
		f5_local41 = true
	end
	if f5_local33 == true and f5_local30 == true then
		Lobby.Process.AddActions( f5_local29, f5_local6, f5_local27, f5_local27 )
		f5_local29 = f5_local6
	end
	if f5_local38 == true then
		Lobby.Process.AddActions( f5_local29, f5_local9, f5_local27, f5_local27 )
		f5_local29 = f5_local9
	end
	if f5_local39 == true then
		Lobby.Process.AddActions( f5_local29, f5_local10, f5_local27, f5_local27 )
		f5_local29 = f5_local10
	end
	if f5_local40 == true then
		Lobby.Process.AddActions( f5_local29, f5_local11, f5_local27, f5_local27 )
		f5_local29 = f5_local11
	end
	if f5_local41 == true then
		Lobby.Process.AddActions( f5_local29, f5_local8, f5_local27, f5_local27 )
		f5_local29 = f5_local8
	end
	if f5_local34 == false or f5_local41 == true then
		Lobby.Process.AddActions( f5_local29, f5_local19, f5_local25, f5_local25 )
		Lobby.Process.AddActions( f5_local19, f5_local20, f5_local25, f5_local25 )
		f5_local29 = f5_local20
	end
	if f5_local40 == true then
		Lobby.Process.AddActions( f5_local29, f5_local21, f5_local25, f5_local25 )
		f5_local29 = f5_local21
	end
	Lobby.Process.AddActions( f5_local29, f5_local12, f5_local27, f5_local27 )
	Lobby.Process.AddActions( f5_local12, f5_local13, f5_local27, f5_local27 )
	Lobby.Process.AddActions( f5_local13, f5_local14, f5_local27, f5_local27 )
	Lobby.Process.AddActions( f5_local14, f5_local15, f5_local17, f5_local17 )
	Lobby.Process.AddActions( f5_local15, f5_local16, f5_local27, f5_local27 )
	Lobby.Process.AddActions( f5_local16, f5_local17, f5_local27, f5_local27 )
	Lobby.Process.AddActions( f5_local17, f5_local18, f5_local27, f5_local27 )
	Lobby.Process.AddActions( f5_local18, f5_local3, f5_local27, f5_local27 )
	return f5_local28
end

