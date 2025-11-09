require( "lua.Lobby.Process.Nav.LobbyProcessNavCommon" )
require( "lua.Lobby.Process.Nav.LobbyProcessNavCP" )
require( "lua.Lobby.Process.Nav.LobbyProcessNavMP" )
require( "lua.Lobby.Process.Nav.LobbyProcessNavZM" )

Lobby.ProcessNavigate = {}
Lobby.ProcessNavigate.PrivateLobbyInterrupt = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = f1_arg1.controller
	local f1_local1 = f1_arg1.errorTarget
	local f1_local2 = Lobby.Actions.OpenSpinner()
	local f1_local3 = Lobby.Actions.LobbySettings( f1_local0, f1_local1 )
	local f1_local4 = Lobby.Actions.UpdateUI( f1_local0, f1_local1 )
	local f1_local5 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f1_local6 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f1_local7 = Lobby.Actions.CloseSpinner()
	local f1_local8 = {
		head = f1_local2,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = false
	}
	Lobby.Process.ForceAction( f1_local2, f1_local3 )
	Lobby.Process.ForceAction( f1_local3, f1_local4 )
	Lobby.Process.ForceAction( f1_local4, f1_local5 )
	Lobby.Process.ForceAction( f1_local5, f1_local6 )
	Lobby.Process.ForceAction( f1_local6, f1_local7 )
	if f1_arg0 == Lobby.Interrupt.BACK then
		
	elseif f1_arg0 == Lobby.Interrupt.FAILED_ACTION and f1_arg2.action ~= nil then
		Lobby.Process.ForceAction( f1_local7, Lobby.Actions.ErrorPopup( f1_arg2.action ) )
	elseif f1_arg0 == Lobby.Interrupt.ERROR_MSG and f1_arg2.errorMsg ~= nil then
		local f1_local9 = f1_arg2.errorMsg
		if Engine.IsDevelopmentBuild() and f1_arg2.action ~= nil then
			f1_local9 = f1_local9 .. "\n\n(debug info, failed action: " .. f1_arg2.action.name .. ")"
		end
		Lobby.Process.ForceAction( f1_local7, Lobby.Actions.ErrorPopupMsg( f1_local9 ) )
	end
	return f1_local8
end

Lobby.ProcessNavigate.CreatePrivateLobby = function ( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0 = {
		controller = f2_arg0,
		errorTarget = f2_arg1
	}
	local f2_local1 = Lobby.Interrupt.Back( Lobby.ProcessNavigate.PrivateLobbyInterrupt, f2_local0 )
	local f2_local2 = Lobby.Interrupt.FailedAction( Lobby.ProcessNavigate.PrivateLobbyInterrupt, f2_local0 )
	local f2_local3 = Lobby.Interrupt.ErrorMsg( Lobby.ProcessNavigate.PrivateLobbyInterrupt, f2_local0, Engine.Localize( "MENU_FAILED_TO_HOST_LOBBY" ) )
	local f2_local4 = Lobby.Actions.OpenSpinner( true )
	local f2_local5 = Lobby.Actions.CloseSpinner()
	local f2_local6 = Lobby.Actions.LobbySettings( f2_arg0, f2_arg2 )
	local f2_local7 = Lobby.Actions.LobbyHostStart( f2_arg0, f2_arg2.mainMode, f2_arg2.lobbyType, f2_arg2.lobbyMode, f2_arg2.maxClients )
	local f2_local8 = Lobby.Actions.LobbyHostAddPrimary( f2_local7.lobbyType )
	local f2_local9 = Lobby.Actions.LobbyClientStart( f2_local7.lobbyType )
	local f2_local10 = Lobby.Actions.UpdateUI( f2_arg0, f2_arg2 )
	local f2_local11 = {
		head = f2_local4,
		interrupt = f2_local1,
		force = false,
		cancellable = false
	}
	if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		Lobby.Process.AddActions( f2_local4, f2_local6, f2_local3, f2_local3 )
	else
		local f2_local12 = Lobby.Actions.DisableConnectingToDemonware( f2_arg0 )
		Lobby.Process.AddActions( f2_local4, f2_local12, f2_local3, f2_local3 )
		Lobby.Process.AddActions( f2_local12, f2_local6, f2_local3, f2_local3 )
	end
	Lobby.Process.AddActions( f2_local6, f2_local7, f2_local3, f2_local3 )
	Lobby.Process.AddActions( f2_local7, f2_local8, f2_local3, f2_local3 )
	Lobby.Process.AddActions( f2_local8, f2_local9, f2_local3, f2_local3 )
	Lobby.Process.AddActions( f2_local9, f2_local10, f2_local3, f2_local3 )
	Lobby.Process.AddActions( f2_local10, f2_local5, f2_local3, f2_local3 )
	Lobby.Process.AddActions( f2_local5, nil, f2_local3, f2_local3 )
	return f2_local11
end

Lobby.ProcessNavigate.LeavePrivateLobby = function ( f3_arg0, f3_arg1, f3_arg2 )
	Engine.LobbyLaunchClear()
	local f3_local0 = Lobby.Actions.OpenSpinner()
	local f3_local1 = Lobby.Actions.CloseSpinner()
	local f3_local2 = Lobby.Actions.LobbySettings( f3_arg0, f3_arg2 )
	local f3_local3 = Lobby.Actions.UpdateUI( f3_arg0, f3_arg2 )
	local f3_local4 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f3_local5 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f3_local6 = {
		head = f3_local0,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = false
	}
	Lobby.Process.AddActions( f3_local0, f3_local4 )
	Lobby.Process.AddActions( f3_local4, f3_local5 )
	Lobby.Process.AddActions( f3_local5, f3_local2 )
	Lobby.Process.AddActions( f3_local2, f3_local3 )
	Lobby.Process.AddActions( f3_local3, f3_local1 )
	Lobby.Process.AddActions( f3_local1, nil )
	return f3_local6
end

Lobby.ProcessNavigate.GameLobbyInterrupt = function ( f4_arg0, f4_arg1, f4_arg2 )
	local f4_local0 = Lobby.Actions.ExecuteScript( function ()
		Lobby.Debug.JBMatchmakingEvent( LuaEnums.JB_MATCHMAKING_EVENT.FAILED )
	end )
	local f4_local1 = f4_arg1.controller
	local f4_local2 = f4_arg1.errorTarget
	local f4_local3 = f4_arg1.isPublic
	local f4_local4 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_IDLE )
	end
	
	local f4_local5 = function ()
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local f4_local6 = Lobby.Actions.OpenSpinner()
	local f4_local7 = Lobby.Actions.ExecuteScript( f4_local4 )
	local f4_local8 = Lobby.Actions.LobbyVMCallRetVal( Lobby.Timer.HostingLobbyEnd, {
		controller = f4_local1,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		mainMode = f4_local2.mainMode
	}, true, false, false )
	local f4_local9 = Lobby.Actions.ExecuteScript( f4_local5 )
	local f4_local10 = Lobby.Actions.LobbySettings( f4_local1, f4_local2 )
	local f4_local11 = Lobby.Actions.UpdateUI( f4_local1, f4_local2 )
	local f4_local12 = Lobby.Actions.SwitchMode( f4_local1, Lobby.Core.GetMainModeStr( f4_local2.mainMode ) )
	local f4_local13 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f4_local14 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f4_local15 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f4_local16 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f4_local17 = Lobby.Actions.LobbyHostStart( f4_local1, f4_local2.mainMode, f4_local2.lobbyType, f4_local2.lobbyMode, f4_local2.maxClients )
	local f4_local18 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f4_local19 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f4_local20 = Lobby.Actions.CloseSpinner()
	local f4_local21 = {
		head = f4_local6,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = false
	}
	if f4_local3 == true then
		f4_local21.head = f4_local0
		Lobby.Process.ForceAction( f4_local0, f4_local6 )
	end
	Lobby.Process.ForceAction( f4_local6, f4_local7 )
	Lobby.Process.ForceAction( f4_local7, f4_local8 )
	Lobby.Process.ForceAction( f4_local8, f4_local9 )
	Lobby.Process.ForceAction( f4_local9, f4_local10 )
	Lobby.Process.ForceAction( f4_local10, f4_local11 )
	Lobby.Process.ForceAction( f4_local11, f4_local12 )
	Lobby.Process.ForceAction( f4_local12, f4_local13 )
	Lobby.Process.ForceAction( f4_local13, f4_local14 )
	Lobby.Process.ForceAction( f4_local14, f4_local15 )
	Lobby.Process.ForceAction( f4_local15, f4_local16 )
	Lobby.Process.ForceAction( f4_local16, f4_local17 )
	Lobby.Process.ForceAction( f4_local17, f4_local18 )
	Lobby.Process.ForceAction( f4_local18, f4_local19 )
	Lobby.Process.ForceAction( f4_local19, f4_local20 )
	if f4_arg0 == Lobby.Interrupt.BACK then
		
	elseif f4_arg0 == Lobby.Interrupt.FAILED_ACTION and f4_arg2.action ~= nil then
		Lobby.Process.ForceAction( f4_local20, Lobby.Actions.ErrorPopup( f4_arg2.action ) )
	elseif f4_arg0 == Lobby.Interrupt.ERROR_MSG and f4_arg2.errorMsg ~= nil then
		local f4_local22 = f4_arg2.errorMsg
		if f4_arg2.action ~= nil and Engine.IsDevelopmentBuild() then
			if f4_arg2.action.errorFuncPtr then
				f4_local22 = f4_local22 .. "\n\ndebug: " .. f4_arg2.action:errorFuncPtr()
			else
				f4_local22 = f4_local22 .. "\n\n(debug info, failed action: " .. f4_arg2.action.name .. ")"
			end
		end
		Lobby.Process.ForceAction( f4_local20, Lobby.Actions.ErrorPopupMsg( f4_local22 ) )
	end
	return f4_local21
end

Lobby.ProcessNavigate.SwitchLobbiesGetDefaultGametype = function ( f8_arg0, f8_arg1 )
	local f8_local0 = "coop"
	if f8_arg1.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		if LuaUtils.IsCPZMTarget( f8_arg1.id ) then
			f8_local0 = "cpzm"
		elseif LuaUtils.IsDOATarget( f8_arg1.id ) then
			f8_local0 = "doa"
		end
	elseif f8_arg1.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		if f8_arg1.id == LobbyData.UITargets.UI_FRLOBBYONLINEGAME.id or f8_arg1.id == LobbyData.UITargets.UI_FRLOBBYLANGAME.id then
			f8_local0 = "fr"
		else
			f8_local0 = "tdm"
		end
	elseif f8_arg1.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		f8_local0 = "zclassic"
	end
	return f8_local0
end

Lobby.ProcessNavigate.SwitchLobbiesIsGametypeValid = function ( f9_arg0 )
	if f9_arg0 == nil then
		return false
	elseif f9_arg0 == "" then
		return false
	elseif not Engine.IsGameTypeValid( f9_arg0 ) then
		return false
	else
		return true
	end
end

Lobby.ProcessNavigate.SwitchLobbiesGetGametype = function ( f10_arg0, f10_arg1 )
	local f10_local0 = nil
	if f10_arg1.id == LobbyData.UITargets.UI_FRLOBBYONLINEGAME.id or f10_arg1.id == LobbyData.UITargets.UI_FRLOBBYLANGAME.id then
		f10_local0 = "fr"
	else
		f10_local0 = Engine.ProfileValueAsString( f10_arg0, "gametype" )
	end
	if not Lobby.ProcessNavigate.SwitchLobbiesIsGametypeValid( f10_local0 ) then
		f10_local0 = Lobby.ProcessNavigate.SwitchLobbiesGetDefaultGametype( f10_arg0, f10_arg1 )
	end
	return f10_local0
end

Lobby.ProcessNavigate.SwitchLobbiesIsMapValid = function ( f11_arg0 )
	if f11_arg0 == "" or f11_arg0 == nil then
		return false
	elseif not Engine.IsMapValid( f11_arg0 ) then
		return false
	else
		return true
	end
end

Lobby.ProcessNavigate.SwitchLobbiesGetMap = function ( f12_arg0, f12_arg1 )
	local f12_local0 = nil
	if Engine.IsCampaignGame() then
		f12_local0 = Engine.GetSavedMapQueuedMap()
		if f12_local0 == nil or f12_local0 == "" then
			f12_local0 = Engine.GetSavedMap()
		end
	elseif Engine.IsMultiplayerGame() then
		if f12_arg1.id == LobbyData.UITargets.UI_FRLOBBYONLINEGAME.id or f12_arg1.id == LobbyData.UITargets.UI_FRLOBBYLANGAME.id then
			f12_local0 = Engine.ProfileValueAsString( f12_arg0, "map_fr" )
		else
			f12_local0 = Engine.ProfileValueAsString( f12_arg0, "map" )
		end
	elseif Engine.IsZombiesGame() then
		f12_local0 = Engine.ProfileValueAsString( f12_arg0, "map_zm" )
	end
	if not Lobby.ProcessNavigate.SwitchLobbiesIsMapValid( f12_local0 ) then
		f12_local0 = LuaUtils.GetDefaultMap( f12_arg1 )
	end
	return f12_local0
end

Lobby.ProcessNavigate.SetupLobbyMapAndGameType = function ( f13_arg0, f13_arg1 )
	if f13_arg1.lobbyMode == Enum.LobbyMode.LOBBY_MODE_THEATER then
		return 
	else
		Engine.SetGametype( Lobby.ProcessNavigate.SwitchLobbiesGetGametype( f13_arg0, f13_arg1 ) )
		local f13_local0 = Lobby.ProcessNavigate.SwitchLobbiesGetMap( f13_arg0, f13_arg1 )
		Engine.GameLobbySetMap( f13_local0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.selectedMapId" ), f13_local0 )
	end
end

Lobby.ProcessNavigate.CreateGameLobby = function ( f14_arg0, f14_arg1, f14_arg2 )
	local f14_local0 = {
		controller = f14_arg0,
		errorTarget = f14_arg1
	}
	local f14_local1 = Lobby.Interrupt.Back( Lobby.ProcessNavigate.GameLobbyInterrupt, f14_local0 )
	local f14_local2 = Lobby.Interrupt.FailedAction( Lobby.ProcessNavigate.GameLobbyInterrupt, f14_local0 )
	local f14_local3 = Lobby.Interrupt.ErrorMsg( Lobby.ProcessNavigate.GameLobbyInterrupt, f14_local0, Engine.Localize( "MENU_FAILED_TO_HOST_LOBBY" ) )
	local f14_local4 = function ()
		Lobby.ProcessNavigate.SetupLobbyMapAndGameType( f14_arg0, f14_arg2 )
	end
	
	local f14_local5 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_JOIN )
	end
	
	local f14_local6 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_IDLE )
	end
	
	local f14_local7 = Lobby.Actions.OpenSpinner( true )
	local f14_local8 = Lobby.Actions.CloseSpinner()
	local f14_local9 = Lobby.Actions.WaitForJoiningClients( 5000 )
	local f14_local10 = Lobby.Actions.ExecuteScript( f14_local5 )
	local f14_local11 = Lobby.Actions.ExecuteScript( f14_local6 )
	local f14_local12 = Lobby.Actions.LobbySettings( f14_arg0, f14_arg2 )
	local f14_local13 = Lobby.Actions.UpdateUI( f14_arg0, f14_arg2 )
	local f14_local14 = Lobby.Actions.SwitchMode( f14_arg0, Lobby.Core.GetMainModeStr( f14_arg2.mainMode ) )
	local f14_local15 = Lobby.Actions.SwitchCampaignMode( f14_arg0, Enum.CampaignMode.CAMPAIGNMODE_DEFAULT )
	if LuaUtils.IsCPZMTarget( f14_arg2.id ) then
		f14_local15 = Lobby.Actions.SwitchCampaignMode( f14_arg0, Enum.CampaignMode.CAMPAIGNMODE_ZOMBIES )
	end
	local f14_local16 = Lobby.Actions.ExecuteScript( f14_local4 )
	local f14_local17 = Lobby.Actions.LobbyHostStart( f14_arg0, f14_arg2.mainMode, Enum.LobbyType.LOBBY_TYPE_GAME, f14_arg2.lobbyMode, f14_arg2.maxClients )
	local f14_local18 = Lobby.Actions.LobbyVMCall( Lobby.Timer.HostingLobby, {
		controller = f14_arg0,
		lobbyType = f14_local17.lobbyType,
		mainMode = f14_arg2.mainMode,
		lobbyTimerType = f14_arg2.lobbyTimerType
	} )
	local f14_local19 = Lobby.Actions.SetSavedOrDefaultMap( f14_arg0, f14_arg2 )
	local f14_local20 = Lobby.Actions.LobbyInfoProbe( f14_arg0, {
		xuid = Engine.GetXUID64( f14_arg0 )
	} )
	local f14_local21 = Lobby.Actions.LobbyJoinXUID( f14_arg0, {
		xuid = Engine.GetXUID64( f14_arg0 )
	}, Enum.JoinType.JOIN_TYPE_PARTY )
	local f14_local22 = {
		head = f14_local7,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = false
	}
	Lobby.Process.AddActions( f14_local7, f14_local9, f14_local3, f14_local3 )
	Lobby.Process.AddActions( f14_local9, f14_local10, f14_local3, f14_local3 )
	Lobby.Process.AddActions( f14_local10, f14_local14, f14_local3, f14_local3 )
	Lobby.Process.AddActions( f14_local14, f14_local15, f14_local3, f14_local3 )
	Lobby.Process.AddActions( f14_local15, f14_local12, f14_local3, f14_local3 )
	Lobby.Process.AddActions( f14_local12, f14_local16, f14_local3, f14_local3 )
	Lobby.Process.AddActions( f14_local16, f14_local17, f14_local3, f14_local3 )
	Lobby.Process.AddActions( f14_local17, f14_local13, f14_local3, f14_local3 )
	Lobby.Process.AddActions( f14_local13, f14_local20, f14_local3, f14_local3 )
	Lobby.Process.AddActions( f14_local20, f14_local21, f14_local3, f14_local3 )
	Lobby.Process.AddActions( f14_local21, f14_local18, f14_local3, f14_local3 )
	Lobby.Process.AddActions( f14_local18, f14_local19, f14_local3, f14_local3 )
	Lobby.Process.AddActions( f14_local19, f14_local11, f14_local3, f14_local3 )
	Lobby.Process.AddActions( f14_local11, f14_local8, f14_local3, f14_local3 )
	Lobby.Process.AddActions( f14_local8, nil, f14_local3, f14_local3 )
	return f14_local22
end

Lobby.ProcessNavigate.CreatePublicGameLobby = function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3 )
	local f18_local0 = function ()
		Lobby.Debug.JBMatchmakingEvent( LuaEnums.JB_MATCHMAKING_EVENT.END )
	end
	
	local f18_local1 = Lobby.Actions.ExecuteScript( f18_local0 )
	local f18_local2 = Lobby.Actions.ExecuteScript( f18_local0 )
	local f18_local3 = {
		controller = f18_arg0,
		errorTarget = f18_arg1,
		isPublic = true
	}
	local f18_local4 = Lobby.Interrupt.Back( Lobby.ProcessNavigate.GameLobbyInterrupt, f18_local3 )
	local f18_local5 = Lobby.Interrupt.FailedAction( Lobby.ProcessNavigate.GameLobbyInterrupt, f18_local3 )
	local f18_local6 = Lobby.Interrupt.ErrorMsg( Lobby.ProcessNavigate.GameLobbyInterrupt, f18_local3, Engine.Localize( "MENU_FAILED_TO_HOST_LOBBY" ) )
	local f18_local7 = function ()
		Engine.SetLobbyMaxClients( f18_arg2.lobbyType, Dvar.party_maxplayers:get() )
	end
	
	local f18_local8 = function ()
		Lobby.Timer.HostingLobby( {
			controller = f18_arg0,
			lobbyType = f18_arg2.lobbyType,
			mainMode = f18_arg2.mainMode,
			lobbyTimerType = f18_arg2.lobbyTimerType
		} )
		Lobby.Matchmaking.ClearSearchInfo()
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, true )
	end
	
	local f18_local9 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_JOIN )
	end
	
	local f18_local10 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_IDLE )
	end
	
	local f18_local11 = function ( f24_arg0 )
		if LuaUtils.IsArenaMode() then
			Lobby.Matchmaking.SetupMatchmakingQuery( f18_arg0, Lobby.Matchmaking.SearchMode.ARENA, f24_arg0 )
		else
			Lobby.Matchmaking.SetupMatchmakingQuery( f18_arg0, Lobby.Matchmaking.SearchMode.PUBLIC, f24_arg0 )
		end
	end
	
	f18_local11( true )
	local f18_local12 = Lobby.Actions.OpenSpinner( true )
	local f18_local13 = Lobby.Actions.CloseSpinner()
	local f18_local14 = Lobby.Actions.WaitForJoiningClients( 5000 )
	local f18_local15 = Lobby.Actions.ExecuteScript( f18_local9 )
	local f18_local16 = Lobby.Actions.ExecuteScript( f18_local10 )
	local f18_local17 = Lobby.Actions.SetQueueCancellable( true )
	local f18_local18 = Lobby.Actions.LobbyHostStart( f18_arg0, f18_arg2.mainMode, f18_arg2.lobbyType, f18_arg2.lobbyMode, f18_arg2.maxClients )
	local f18_local19 = Lobby.Actions.LobbyInfoProbe( f18_arg0, {
		xuid = Engine.GetXUID64( f18_arg0 )
	} )
	local f18_local20 = Lobby.Actions.LobbyJoinXUID( f18_arg0, {
		xuid = Engine.GetXUID64( f18_arg0 )
	}, Enum.JoinType.JOIN_TYPE_PARTY )
	local f18_local21 = Lobby.Actions.LobbySettings( f18_arg0, f18_arg2 )
	local f18_local22 = Lobby.Actions.UpdateUI( f18_arg0, f18_arg2 )
	local f18_local23 = Lobby.Actions.RunPlaylistSettings( f18_arg0 )
	local f18_local24 = Lobby.Actions.IsButtonPressed( f18_arg0, "BUTTON_X" )
	local f18_local25 = Lobby.Actions.IsDvarSet( "lobbySearchSkip", true )
	local f18_local26 = Lobby.Actions.IsDvarSet( "lobbyAdvertiseSkip", true )
	local f18_local27 = 0
	if f18_arg3 and f18_arg3 > 0 then
		f18_local27 = f18_arg3
	end
	local f18_local28 = Lobby.Actions.TimeDelay( f18_local27 )
	local f18_local29 = Lobby.Actions.SearchForLobby( f18_arg0 )
	local f18_local30 = Lobby.Actions.SearchForLobby( f18_arg0 )
	local f18_local31 = Lobby.Actions.SearchForLobby( f18_arg0 )
	local f18_local32 = Lobby.Actions.SearchForLobby( f18_arg0 )
	local f18_local33 = Lobby.Actions.SearchForLobby( f18_arg0 )
	local f18_local34 = Lobby.Actions.SearchForLobby( f18_arg0 )
	local f18_local35 = Lobby.Actions.QoSJoinSearchResults( f18_arg0, f18_local29 )
	local f18_local36 = Lobby.Actions.QoSJoinSearchResults( f18_arg0, f18_local30 )
	local f18_local37 = Lobby.Actions.QoSJoinSearchResults( f18_arg0, f18_local31 )
	local f18_local38 = Lobby.Actions.QoSJoinSearchResults( f18_arg0, f18_local32 )
	local f18_local39 = Lobby.Actions.QoSJoinSearchResults( f18_arg0, f18_local33 )
	local f18_local40 = Lobby.Actions.QoSJoinSearchResults( f18_arg0, f18_local34 )
	local f18_local41 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	local f18_local42 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	local f18_local43 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	local f18_local44 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	local f18_local45 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	f18_local29.name = f18_local29.name .. "_1"
	f18_local30.name = f18_local30.name .. "_2"
	f18_local31.name = f18_local31.name .. "_3"
	f18_local32.name = f18_local32.name .. "_4"
	f18_local33.name = f18_local33.name .. "_5"
	f18_local34.name = f18_local34.name .. "_6"
	f18_local35.name = f18_local35.name .. "_1"
	f18_local36.name = f18_local36.name .. "_2"
	f18_local37.name = f18_local37.name .. "_3"
	f18_local38.name = f18_local38.name .. "_4"
	f18_local39.name = f18_local39.name .. "_5"
	f18_local40.name = f18_local40.name .. "_6"
	local f18_local46 = Lobby.Actions.CanHostServer( f18_arg0, f18_arg2 )
	local f18_local47 = Lobby.Actions.TimeDelay( 1500 )
	local f18_local48 = Lobby.Actions.ExecuteScript( f18_local11, false )
	local f18_local49 = Lobby.Actions.AdvertiseLobby( true )
	local f18_local50 = Lobby.Actions.ExecuteScript( f18_local7 )
	local f18_local51 = Lobby.Actions.ExecuteScript( f18_local8 )
	local f18_local52 = {
		head = f18_local12,
		interrupt = f18_local4,
		force = false,
		cancellable = false
	}
	Lobby.Process.AddActions( f18_local12, f18_local14, f18_local6, f18_local6 )
	Lobby.Process.AddActions( f18_local14, f18_local15, f18_local6, f18_local6 )
	Lobby.Process.AddActions( f18_local15, f18_local18, f18_local6, f18_local6 )
	Lobby.Process.AddActions( f18_local18, f18_local21, f18_local6, f18_local6 )
	Lobby.Process.AddActions( f18_local21, f18_local23, f18_local6, f18_local6 )
	Lobby.Process.AddActions( f18_local23, f18_local50, f18_local6, f18_local6 )
	Lobby.Process.AddActions( f18_local50, f18_local19, f18_local6, f18_local6 )
	Lobby.Process.AddActions( f18_local19, f18_local20, f18_local6, f18_local6 )
	Lobby.Process.AddActions( f18_local20, f18_local22, f18_local6, f18_local6 )
	Lobby.Process.AddActions( f18_local22, f18_local13, f18_local6, f18_local6 )
	Lobby.Process.AddActions( f18_local13, f18_local16, f18_local6, f18_local6 )
	Lobby.Process.AddActions( f18_local16, f18_local17, f18_local6, f18_local6 )
	Lobby.Process.AddActions( f18_local17, f18_local24, f18_local6, f18_local6 )
	Lobby.Process.AddActions( f18_local24, f18_local26, f18_local25, f18_local25 )
	Lobby.Process.AddActions( f18_local25, f18_local26, f18_local28, f18_local28 )
	Lobby.Process.ForceAction( f18_local28, f18_local29 )
	Lobby.Process.AddActions( f18_local29, f18_local35, f18_local41, f18_local6 )
	Lobby.Process.AddActions( f18_local35, f18_local1, f18_local41, f18_local6 )
	Lobby.Process.ForceAction( f18_local41, f18_local30 )
	Lobby.Process.AddActions( f18_local30, f18_local36, f18_local42, f18_local6 )
	Lobby.Process.AddActions( f18_local36, f18_local1, f18_local42, f18_local6 )
	Lobby.Process.ForceAction( f18_local42, f18_local31 )
	Lobby.Process.AddActions( f18_local31, f18_local37, f18_local43, f18_local6 )
	Lobby.Process.AddActions( f18_local37, f18_local1, f18_local43, f18_local6 )
	Lobby.Process.ForceAction( f18_local43, f18_local32 )
	Lobby.Process.AddActions( f18_local32, f18_local38, f18_local47, f18_local6 )
	Lobby.Process.AddActions( f18_local38, f18_local1, f18_local47, f18_local6 )
	Lobby.Process.AddActions( f18_local47, f18_local48, f18_local48, f18_local48 )
	Lobby.Process.AddActions( f18_local48, f18_local29, f18_local29, f18_local29 )
	return f18_local52
end

Lobby.ProcessNavigate.ChangeToPublicGameLobby = function ( f25_arg0, f25_arg1, f25_arg2 )
	local f25_local0 = {
		controller = f25_arg0,
		errorTarget = f25_arg1
	}
	local f25_local1 = Lobby.Interrupt.Back( Lobby.ProcessNavigate.GameLobbyInterrupt, f25_local0 )
	local f25_local2 = Lobby.Interrupt.FailedAction( Lobby.ProcessNavigate.GameLobbyInterrupt, f25_local0 )
	local f25_local3 = Lobby.Interrupt.ErrorMsg( Lobby.ProcessNavigate.GameLobbyInterrupt, f25_local0, Engine.Localize( "MENU_FAILED_TO_HOST_LOBBY" ) )
	Engine.LobbyLaunchClear()
	Lobby.Debug.SessionSQJClear()
	local f25_local4 = function ()
		Lobby.Timer.HostingLobby( {
			controller = f25_arg0,
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
			mainMode = f25_arg2.mainMode,
			lobbyTimerType = f25_arg2.lobbyTimerType
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, true )
	end
	
	local f25_local5 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_JOIN )
		Engine.SetLobbyMode( f25_arg2.lobbyType, f25_arg2.lobbyMode )
		Engine.SetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME, math.min( f25_arg2.maxClients, Dvar.party_maxplayers:get() ) )
	end
	
	local f25_local6 = function ()
		Engine.SetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME, math.min( f25_arg2.maxClients, Dvar.party_maxplayers:get() ) )
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_IDLE )
	end
	
	local f25_local7 = function ( f29_arg0 )
		Lobby.Matchmaking.SetupMatchmakingQuery( f25_arg0, Lobby.Matchmaking.SearchMode.PUBLIC, f29_arg0 )
	end
	
	local f25_local8 = function ()
		if f25_arg2.maxClients <= Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyClientType.LOBBY_CLIENT_TYPE_ALL ) then
			return true
		else
			return false
		end
	end
	
	f25_local7( true )
	local f25_local9 = Lobby.Actions.OpenSpinner( true )
	local f25_local10 = Lobby.Actions.CloseSpinner()
	local f25_local11 = Lobby.Actions.WaitForJoiningClients( 5000 )
	local f25_local12 = Lobby.Actions.ExecuteScript( f25_local5 )
	local f25_local13 = Lobby.Actions.ExecuteScript( f25_local6 )
	local f25_local14 = Lobby.Actions.SetQueueCancellable( true )
	local f25_local15 = Lobby.Actions.LobbySettings( f25_arg0, f25_arg2 )
	local f25_local16 = Lobby.Actions.UpdateUI( f25_arg0, f25_arg2 )
	local f25_local17 = Lobby.Actions.RunPlaylistSettings( f25_arg0 )
	local f25_local18 = Lobby.Actions.IsButtonPressed( f25_arg0, "BUTTON_X" )
	local f25_local19 = Lobby.Actions.EvaluateFunction( f25_local8 )
	local f25_local20 = Lobby.Actions.SearchForLobby( f25_arg0 )
	local f25_local21 = Lobby.Actions.SearchForLobby( f25_arg0 )
	local f25_local22 = Lobby.Actions.SearchForLobby( f25_arg0 )
	local f25_local23 = Lobby.Actions.QoSJoinSearchResults( f25_arg0, f25_local20 )
	local f25_local24 = Lobby.Actions.QoSJoinSearchResults( f25_arg0, f25_local21 )
	local f25_local25 = Lobby.Actions.QoSJoinSearchResults( f25_arg0, f25_local22 )
	local f25_local26 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	local f25_local27 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	local f25_local28 = Lobby.Actions.CanHostServer( f25_arg0, f25_arg2 )
	local f25_local29 = Lobby.Actions.TimeDelay( 1500 )
	local f25_local30 = Lobby.Actions.ExecuteScript( f25_local7, false )
	local f25_local31 = Lobby.Actions.AdvertiseLobby( true )
	local f25_local32 = Lobby.Actions.ExecuteScript( f25_local4 )
	local f25_local33 = {
		head = f25_local9,
		interrupt = f25_local1,
		force = false,
		cancellable = false
	}
	Lobby.Process.AddActions( f25_local9, f25_local11, f25_local3, f25_local3 )
	Lobby.Process.AddActions( f25_local11, f25_local12, f25_local3, f25_local3 )
	Lobby.Process.AddActions( f25_local12, f25_local15, f25_local3, f25_local3 )
	Lobby.Process.AddActions( f25_local15, f25_local17, f25_local3, f25_local3 )
	Lobby.Process.AddActions( f25_local17, f25_local16, f25_local3, f25_local3 )
	Lobby.Process.AddActions( f25_local16, f25_local10, f25_local3, f25_local3 )
	Lobby.Process.AddActions( f25_local10, f25_local14, f25_local3, f25_local3 )
	Lobby.Process.AddActions( f25_local14, f25_local18, f25_local3, f25_local3 )
	Lobby.Process.AddActions( f25_local18, f25_local31, f25_local19, f25_local19 )
	Lobby.Process.AddActions( f25_local19, f25_local31, f25_local20, f25_local20 )
	Lobby.Process.AddActions( f25_local20, f25_local23, f25_local26, f25_local3 )
	Lobby.Process.AddActions( f25_local23, f25_local13, f25_local26, f25_local3 )
	Lobby.Process.ForceAction( f25_local26, f25_local21 )
	Lobby.Process.AddActions( f25_local21, f25_local24, f25_local27, f25_local3 )
	Lobby.Process.AddActions( f25_local24, f25_local13, f25_local27, f25_local3 )
	Lobby.Process.ForceAction( f25_local27, f25_local22 )
	Lobby.Process.AddActions( f25_local22, f25_local25, f25_local28, f25_local3 )
	Lobby.Process.AddActions( f25_local25, f25_local13, f25_local28, f25_local3 )
	Lobby.Process.AddActions( f25_local28, f25_local31, f25_local29, f25_local3 )
	Lobby.Process.AddActions( f25_local29, f25_local30, f25_local30, f25_local30 )
	Lobby.Process.AddActions( f25_local30, f25_local20, f25_local20, f25_local20 )
	Lobby.Process.AddActions( f25_local31, f25_local32, f25_local3, f25_local3 )
	Lobby.Process.AddActions( f25_local32, f25_local13, f25_local3, f25_local3 )
	Lobby.Process.AddActions( f25_local13, nil, f25_local3, f25_local3 )
	return f25_local33
end

Lobby.ProcessNavigate.ChangeToCustomGameLobby = function ( f31_arg0, f31_arg1, f31_arg2 )
	local f31_local0 = {
		controller = f31_arg0,
		errorTarget = f31_arg1
	}
	local f31_local1 = Lobby.Interrupt.Back( Lobby.ProcessNavigate.GameLobbyInterrupt, f31_local0 )
	local f31_local2 = Lobby.Interrupt.FailedAction( Lobby.ProcessNavigate.GameLobbyInterrupt, f31_local0 )
	local f31_local3 = Lobby.Interrupt.ErrorMsg( Lobby.ProcessNavigate.GameLobbyInterrupt, f31_local0, Engine.Localize( "MENU_FAILED_TO_HOST_LOBBY" ) )
	Engine.LobbyLaunchClear()
	local f31_local4 = function ()
		Lobby.Timer.HostingLobby( {
			controller = f31_arg0,
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
			mainMode = f31_arg2.mainMode,
			lobbyTimerType = f31_arg2.lobbyTimerType
		} )
	end
	
	local f31_local5 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_JOIN )
		Engine.SetLobbyMode( f31_arg2.lobbyType, f31_arg2.lobbyMode )
	end
	
	local f31_local6 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_IDLE )
	end
	
	Lobby.Matchmaking.SetupMatchmakingQuery( f31_arg0, Lobby.Matchmaking.SearchMode.PUBLIC )
	local f31_local7 = Lobby.Actions.OpenSpinner( true )
	local f31_local8 = Lobby.Actions.CloseSpinner()
	local f31_local9 = Lobby.Actions.WaitForJoiningClients( 5000 )
	local f31_local10 = Lobby.Actions.ExecuteScript( f31_local5 )
	local f31_local11 = Lobby.Actions.ExecuteScript( f31_local6 )
	local f31_local12 = Lobby.Actions.LobbySettings( f31_arg0, f31_arg2 )
	local f31_local13 = Lobby.Actions.UpdateUI( f31_arg0, f31_arg2 )
	local f31_local14 = Lobby.Actions.ExecuteScript( f31_local4 )
	local f31_local15 = {
		head = f31_local7,
		interrupt = f31_local1,
		force = false,
		cancellable = false
	}
	Lobby.Process.AddActions( f31_local7, f31_local9, f31_local3, f31_local3 )
	Lobby.Process.AddActions( f31_local9, f31_local10, f31_local3, f31_local3 )
	Lobby.Process.AddActions( f31_local10, f31_local12, f31_local3, f31_local3 )
	Lobby.Process.AddActions( f31_local12, f31_local13, f31_local3, f31_local3 )
	Lobby.Process.AddActions( f31_local13, f31_local8, f31_local3, f31_local3 )
	Lobby.Process.AddActions( f31_local8, f31_local14, f31_local3, f31_local3 )
	Lobby.Process.AddActions( f31_local14, f31_local11, f31_local3, f31_local3 )
	Lobby.Process.AddActions( f31_local11, nil, f31_local3, f31_local3 )
	return f31_local15
end

Lobby.ProcessNavigate.ChangeToCPPublicGameLobby = function ( f35_arg0, f35_arg1, f35_arg2 )
	local f35_local0 = {
		controller = f35_arg0,
		errorTarget = f35_arg1
	}
	local f35_local1 = Lobby.Interrupt.Back( Lobby.ProcessNavigate.GameLobbyInterrupt, f35_local0 )
	local f35_local2 = Lobby.Interrupt.FailedAction( Lobby.ProcessNavigate.GameLobbyInterrupt, f35_local0 )
	local f35_local3 = Lobby.Interrupt.ErrorMsg( Lobby.ProcessNavigate.GameLobbyInterrupt, f35_local0, Engine.Localize( "MENU_FAILED_TO_HOST_LOBBY" ) )
	local f35_local4 = false
	if f35_arg2.id == LobbyData.UITargets.UI_DOALOBBYONLINEPUBLICGAME.id and Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.doaSkipSearch" ) ) then
		f35_local4 = true
	end
	Engine.LobbyLaunchClear()
	Lobby.Debug.SessionSQJClear()
	local f35_local5 = function ()
		Lobby.Timer.HostingLobby( {
			controller = f35_arg0,
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
			mainMode = f35_arg2.mainMode,
			lobbyTimerType = f35_arg2.lobbyTimerType
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, true )
	end
	
	local f35_local6 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_JOIN )
		Engine.SetLobbyMode( f35_arg2.lobbyType, f35_arg2.lobbyMode )
		Engine.SetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME, Dvar.party_maxplayers:get() )
	end
	
	local f35_local7 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_IDLE )
	end
	
	local f35_local8 = function ( f39_arg0 )
		if Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.cpPublicLobbySearchAll" ) ) == true then
			Lobby.Matchmaking.SetupMatchmakingQuery( f35_arg0, Lobby.Matchmaking.SearchMode.PUBLIC_CP_ALL, f39_arg0 )
		else
			Lobby.Matchmaking.SetupMatchmakingQuery( f35_arg0, Lobby.Matchmaking.SearchMode.PUBLIC, f39_arg0 )
		end
	end
	
	f35_local8( true )
	local f35_local9 = Lobby.Actions.OpenSpinner( true )
	local f35_local10 = Lobby.Actions.CloseSpinner()
	local f35_local11 = Lobby.Actions.WaitForJoiningClients( 5000 )
	local f35_local12 = Lobby.Actions.ExecuteScript( f35_local6 )
	local f35_local13 = Lobby.Actions.ExecuteScript( f35_local7 )
	local f35_local14 = Lobby.Actions.LobbySettings( f35_arg0, f35_arg2 )
	local f35_local15 = Lobby.Actions.UpdateUI( f35_arg0, f35_arg2 )
	local f35_local16 = Lobby.Actions.RunPlaylistSettings( f35_arg0 )
	local f35_local17 = Lobby.Actions.IsButtonPressed( f35_arg0, "BUTTON_X" )
	local f35_local18 = Lobby.Actions.IsConditionTrue( f35_local4 )
	local f35_local19 = Lobby.Actions.SearchForLobby( f35_arg0 )
	local f35_local20 = Lobby.Actions.SearchForLobby( f35_arg0 )
	local f35_local21 = Lobby.Actions.SearchForLobby( f35_arg0 )
	local f35_local22 = Lobby.Actions.QoSJoinSearchResults( f35_arg0, f35_local19 )
	local f35_local23 = Lobby.Actions.QoSJoinSearchResults( f35_arg0, f35_local20 )
	local f35_local24 = Lobby.Actions.QoSJoinSearchResults( f35_arg0, f35_local21 )
	local f35_local25 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	local f35_local26 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	local f35_local27 = Lobby.Actions.CanHostServer( f35_arg0, f35_arg2 )
	local f35_local28 = Lobby.Actions.TimeDelay( 1500 )
	local f35_local29 = Lobby.Actions.ExecuteScript( f35_local8, false )
	local f35_local30 = Lobby.Actions.AdvertiseLobby( true )
	local f35_local31 = Lobby.Actions.ExecuteScript( f35_local5 )
	local f35_local32 = {
		head = f35_local9,
		interrupt = f35_local1,
		force = false,
		cancellable = true
	}
	Lobby.Process.AddActions( f35_local9, f35_local11, f35_local3, f35_local3 )
	Lobby.Process.AddActions( f35_local11, f35_local12, f35_local3, f35_local3 )
	Lobby.Process.AddActions( f35_local12, f35_local14, f35_local3, f35_local3 )
	Lobby.Process.AddActions( f35_local14, f35_local16, f35_local3, f35_local3 )
	Lobby.Process.AddActions( f35_local16, f35_local15, f35_local3, f35_local3 )
	Lobby.Process.AddActions( f35_local15, f35_local10, f35_local3, f35_local3 )
	Lobby.Process.AddActions( f35_local10, f35_local17, f35_local3, f35_local3 )
	Lobby.Process.AddActions( f35_local17, f35_local30, f35_local18, f35_local18 )
	Lobby.Process.AddActions( f35_local18, f35_local27, f35_local19, f35_local19 )
	Lobby.Process.AddActions( f35_local19, f35_local22, f35_local25, f35_local3 )
	Lobby.Process.AddActions( f35_local22, f35_local13, f35_local25, f35_local3 )
	Lobby.Process.ForceAction( f35_local25, f35_local20 )
	Lobby.Process.AddActions( f35_local20, f35_local23, f35_local26, f35_local3 )
	Lobby.Process.AddActions( f35_local23, f35_local13, f35_local26, f35_local3 )
	Lobby.Process.ForceAction( f35_local26, f35_local21 )
	Lobby.Process.AddActions( f35_local21, f35_local24, f35_local27, f35_local3 )
	Lobby.Process.AddActions( f35_local24, f35_local13, f35_local27, f35_local3 )
	Lobby.Process.AddActions( f35_local27, f35_local30, f35_local28, f35_local3 )
	Lobby.Process.AddActions( f35_local28, f35_local29, f35_local29, f35_local29 )
	Lobby.Process.AddActions( f35_local29, f35_local19, f35_local19, f35_local19 )
	Lobby.Process.AddActions( f35_local30, f35_local31, f35_local3, f35_local3 )
	Lobby.Process.AddActions( f35_local31, f35_local13, f35_local3, f35_local3 )
	Lobby.Process.AddActions( f35_local13, nil, f35_local3, f35_local3 )
	return f35_local32
end

Lobby.ProcessNavigate.ChangeToPrivateGameLobby = function ( f40_arg0, f40_arg1, f40_arg2, f40_arg3 )
	local f40_local0 = {
		controller = f40_arg0,
		errorTarget = f40_arg2
	}
	local f40_local1 = Lobby.Interrupt.Back( Lobby.ProcessNavigate.GameLobbyInterrupt, f40_local0 )
	local f40_local2 = Lobby.Interrupt.FailedAction( Lobby.ProcessNavigate.GameLobbyInterrupt, f40_local0 )
	local f40_local3 = Lobby.Interrupt.ErrorMsg( Lobby.ProcessNavigate.GameLobbyInterrupt, f40_local0, Engine.Localize( "MENU_FAILED_TO_HOST_LOBBY" ) )
	local f40_local4 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f40_local5 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f40_local6 = Engine.IsAdvertisedLobby( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f40_local7 = Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyClientType.LOBBY_CLIENT_TYPE_REMOTE )
	local f40_local8 = Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyClientType.LOBBY_CLIENT_TYPE_REMOTE )
	local f40_local9
	if f40_arg1.id ~= LobbyData.UITargets.UI_CPLOBBYONLINEPUBLICGAME.id and f40_arg1.id ~= LobbyData.UITargets.UI_CP2LOBBYONLINEPUBLICGAME.id and f40_arg1.id ~= LobbyData.UITargets.UI_ZMLOBBYONLINEPUBLICGAME.id and f40_arg1.id ~= LobbyData.UITargets.UI_DOALOBBYONLINEPUBLICGAME.id then
		f40_local9 = false
	else
		f40_local9 = true
	end
	if f40_arg1.id ~= LobbyData.UITargets.UI_CPLOBBYONLINECUSTOMGAME.id and f40_arg1.id ~= LobbyData.UITargets.UI_CP2LOBBYONLINECUSTOMGAME.id and f40_arg1.id ~= LobbyData.UITargets.UI_ZMLOBBYONLINECUSTOMGAME.id then
		local f40_local10 = false
	else
		local f40_local10 = true
	end
	Engine.LobbyLaunchClear()
	local f40_local11 = function ()
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local f40_local12 = function ()
		Lobby.Timer.HostingLobby( {
			controller = f40_arg0,
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
			mainMode = f40_arg2.mainMode,
			lobbyTimerType = f40_arg2.lobbyTimerType
		} )
		Lobby.PartyPrivacy.SetLobbyMaxClients( f40_arg0, Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	
	local f40_local13 = Lobby.Actions.LobbyVMCallRetVal( Lobby.Timer.HostingLobbyEnd, {
		controller = f40_arg0,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		mainMode = f40_arg2.mainMode
	}, true, false, false )
	local f40_local14 = Lobby.Actions.AdvertiseLobby( false )
	local f40_local15 = Lobby.Actions.ExecuteScript( f40_local11 )
	local f40_local16 = Lobby.Actions.ExecuteScript( f40_local12 )
	local f40_local17 = Lobby.Actions.OpenSpinner()
	local f40_local18 = Lobby.Actions.CloseSpinner()
	local f40_local19 = Lobby.Actions.LeaveWithParty( 3000 )
	local f40_local20 = Lobby.Actions.LobbySettings( f40_arg0, f40_arg2 )
	local f40_local21 = Lobby.Actions.UpdateUI( f40_arg0, f40_arg2 )
	local f40_local22 = Lobby.Actions.SwitchMode( f40_arg0, switchToMode )
	local f40_local23 = Lobby.Actions.SetSavedOrDefaultMap( f40_arg0, f40_arg2 )
	local f40_local24 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f40_local25 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f40_local26 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f40_local27 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f40_local28 = Lobby.Actions.LobbyHostStart( f40_arg0, f40_arg2.mainMode, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f40_arg2.lobbyMode, f40_arg2.maxClients )
	local f40_local29 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f40_local30 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f40_local31 = Lobby.ProcessNavigate.CreateGameLobby( f40_arg0, f40_arg2.backTarget, f40_arg2 )
	local f40_local32 = Lobby.Actions.EmptyAction()
	local f40_local33 = {
		head = f40_local32,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = false
	}
	if f40_local4 == true then
		if f40_local9 == true then
			Lobby.Process.AddActions( f40_local32, f40_local17, f40_local3, f40_local3 )
			Lobby.Process.AddActions( f40_local17, f40_local13, f40_local3, f40_local3 )
			Lobby.Process.AddActions( f40_local13, f40_local14, f40_local3, f40_local3 )
			f40_local32 = f40_local14
		else
			Lobby.Process.AddActions( f40_local32, f40_local13, f40_local3, f40_local3 )
			Lobby.Process.AddActions( f40_local13, f40_local17, Lobby.Process.DO_NOTHING_IF_FAILURE, f40_local3 )
			f40_local32 = f40_local17
		end
		Lobby.Process.AddActions( f40_local32, f40_local15, f40_local3, f40_local3 )
		f40_local32 = f40_local15
	end
	if f40_local4 == true and f40_local5 == true and f40_local7 == 0 and f40_local8 == 0 then
		Lobby.Process.AddActions( f40_local32, f40_local20, f40_local3, f40_local3 )
		Lobby.Process.AddActions( f40_local20, f40_local23, f40_local3, f40_local3 )
		Lobby.Process.AddActions( f40_local23, f40_local21, f40_local3, f40_local3 )
		Lobby.Process.AddActions( f40_local21, f40_local16, f40_local3, f40_local3 )
		Lobby.Process.AddActions( f40_local16, f40_local18, f40_local3, f40_local3 )
		return f40_local33
	elseif f40_arg3 == LuaEnums.LEAVE_WITH_PARTY.WITH and f40_local5 == true and f40_local8 > 0 then
		Lobby.Process.AddActions( f40_local32, f40_local19, f40_local3, f40_local3 )
		f40_local32 = f40_local19
	end
	if f40_local4 == true then
		Lobby.Process.AddActions( f40_local32, f40_local24, f40_local3, f40_local3 )
		Lobby.Process.AddActions( f40_local24, f40_local25, f40_local3, f40_local3 )
		f40_local32 = f40_local25
		if f40_local5 == true then
			if f40_arg3 == LuaEnums.LEAVE_WITH_PARTY.WITHOUT then
				Lobby.Process.AddActions( f40_local32, f40_local26, f40_local3, f40_local3 )
				Lobby.Process.AddActions( f40_local26, f40_local27, f40_local3, f40_local3 )
				Lobby.Process.AddActions( f40_local27, f40_local28, f40_local3, f40_local3 )
				Lobby.Process.AddActions( f40_local28, f40_local29, f40_local3, f40_local3 )
				Lobby.Process.AddActions( f40_local29, f40_local30, f40_local3, f40_local3 )
				f40_local32 = f40_local30
			end
		else
			Lobby.Process.AddActions( f40_local32, f40_local26, f40_local3, f40_local3 )
			Lobby.Process.AddActions( f40_local26, f40_local28, f40_local3, f40_local3 )
			Lobby.Process.AddActions( f40_local28, f40_local29, f40_local3, f40_local3 )
			Lobby.Process.AddActions( f40_local29, f40_local30, f40_local3, f40_local3 )
			f40_local32 = f40_local30
		end
	elseif f40_local5 == true then
		Lobby.Process.AddActions( f40_local32, f40_local24, f40_local3, f40_local3 )
		f40_local32 = f40_local24
	elseif f40_local5 == false then
		Lobby.Process.AddActions( f40_local32, f40_local24, f40_local3, f40_local3 )
		Lobby.Process.AddActions( f40_local24, f40_local26, f40_local3, f40_local3 )
		Lobby.Process.AddActions( f40_local26, f40_local28, f40_local3, f40_local3 )
		Lobby.Process.AddActions( f40_local28, f40_local29, f40_local3, f40_local3 )
		Lobby.Process.AddActions( f40_local29, f40_local30, f40_local3, f40_local3 )
		f40_local32 = f40_local30
	end
	Lobby.Process.AddActions( f40_local32, f40_local31.head, f40_local3, f40_local3 )
	return f40_local33
end

Lobby.ProcessNavigate.LeaveGameLobby = function ( f43_arg0, f43_arg1, f43_arg2, f43_arg3, f43_arg4 )
	local f43_local0 = {
		controller = f43_arg0,
		errorTarget = f43_arg2
	}
	local f43_local1 = Lobby.Interrupt.Back( Lobby.ProcessNavigate.GameLobbyInterrupt, f43_local0 )
	local f43_local2 = Lobby.Interrupt.FailedAction( Lobby.ProcessNavigate.GameLobbyInterrupt, f43_local0 )
	local f43_local3 = Lobby.Interrupt.ErrorMsg( Lobby.ProcessNavigate.GameLobbyInterrupt, f43_local0, Engine.Localize( "MENU_FAILED_TO_HOST_LOBBY" ) )
	Engine.LobbyLaunchClear()
	local f43_local4 = function ()
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_IDLE )
	end
	
	local f43_local5 = Lobby.Actions.LobbyVMCallRetVal( Lobby.Timer.HostingLobbyEnd, {
		controller = f43_arg0,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		mainMode = f43_arg2.mainMode
	}, true, false, false )
	local f43_local6 = Lobby.Actions.ExecuteScript( f43_local4 )
	local f43_local7 = Lobby.Actions.EmptyAction()
	local f43_local8 = Lobby.Actions.OpenSpinner()
	local f43_local9 = Lobby.Actions.CloseSpinner()
	local f43_local10 = Lobby.Actions.LeaveWithParty( 3000 )
	local f43_local11 = Lobby.Actions.LobbySettings( f43_arg0, f43_arg2 )
	local f43_local12 = Lobby.Actions.SwitchMode( f43_arg0, f43_arg4 )
	local f43_local13 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f43_local14 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f43_local15 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f43_local16 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f43_local17 = Lobby.Actions.LobbyHostStart( f43_arg0, f43_arg2.mainMode, f43_arg2.lobbyType, f43_arg2.lobbyMode, f43_arg2.maxClients )
	local f43_local18 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f43_local19 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f43_local20 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f43_local21 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f43_local22 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f43_local23 = Lobby.Actions.UpdateUI( f43_arg0, f43_arg2 )
	local f43_local24 = {
		head = nil,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = false
	}
	local f43_local25 = nil
	if f43_local20 == true then
		f43_local24.head = f43_local8
		Lobby.Process.AddActions( f43_local8, f43_local5, f43_local3, f43_local3 )
		Lobby.Process.AddActions( f43_local5, f43_local7, f43_local9, f43_local3 )
		f43_local25 = f43_local7
		if f43_local21 == true and f43_local22 > 1 and f43_arg3 == LuaEnums.LEAVE_WITH_PARTY.WITH then
			Lobby.Process.AddActions( f43_local25, f43_local10, f43_local3, f43_local3 )
			f43_local25 = f43_local10
		end
		Lobby.Process.AddActions( f43_local25, f43_local6, f43_local3, f43_local3 )
		Lobby.Process.AddActions( f43_local6, f43_local15, f43_local3, f43_local3 )
		Lobby.Process.AddActions( f43_local15, f43_local16, f43_local3, f43_local3 )
		f43_local25 = f43_local16
	else
		f43_local24.head = f43_local8
		f43_local25 = f43_local8
		if f43_local21 == true and f43_local22 > 1 and f43_arg3 == LuaEnums.LEAVE_WITH_PARTY.WITH then
			Lobby.Process.AddActions( f43_local25, f43_local10, f43_local3, f43_local3 )
			f43_local25 = f43_local10
		end
		Lobby.Process.AddActions( f43_local25, f43_local15, f43_local3, f43_local3 )
		f43_local25 = f43_local15
	end
	if f43_local21 == true then
		if f43_local22 > 1 and f43_arg3 == LuaEnums.LEAVE_WITH_PARTY.WITHOUT then
			Lobby.Process.AddActions( f43_local25, f43_local13, f43_local3, f43_local3 )
			Lobby.Process.AddActions( f43_local13, f43_local14, f43_local3, f43_local3 )
			Lobby.Process.AddActions( f43_local14, f43_local17, f43_local3, f43_local3 )
			Lobby.Process.AddActions( f43_local17, f43_local18, f43_local3, f43_local3 )
			Lobby.Process.AddActions( f43_local18, f43_local19, f43_local3, f43_local3 )
			f43_local25 = f43_local19
		end
	else
		Lobby.Process.AddActions( f43_local25, f43_local13, f43_local3, f43_local3 )
		Lobby.Process.AddActions( f43_local13, f43_local17, f43_local3, f43_local3 )
		Lobby.Process.AddActions( f43_local17, f43_local18, f43_local3, f43_local3 )
		Lobby.Process.AddActions( f43_local18, f43_local19, f43_local3, f43_local3 )
		f43_local25 = f43_local19
	end
	Lobby.Process.AddActions( f43_local25, f43_local11, f43_local3, f43_local3 )
	Lobby.Process.AddActions( f43_local11, f43_local23, f43_local3, f43_local3 )
	Lobby.Process.AddActions( f43_local23, f43_local9, f43_local3, f43_local3 )
	return f43_local24
end

Lobby.ProcessNavigate.ReloadGameLobby = function ( f45_arg0, f45_arg1, f45_arg2 )
	local f45_local0 = LobbyData.GetCurrentMenuTarget()
	local f45_local1 = f45_local0.backTarget
	local f45_local2 = Lobby.ProcessNavigate.LeaveGameLobby( f45_arg0, f45_local0, f45_local0, LuaEnums.LEAVE_WITH_PARTY.WITH )
	local f45_local3 = 0
	if f45_arg1 > 0 and f45_arg2 > 0 and f45_arg1 <= f45_arg2 then
		f45_local3 = math.random( f45_arg1, f45_arg2 )
	end
	local f45_local4 = Lobby.ProcessNavigate.CreatePublicGameLobby( f45_arg0, f45_local1, f45_local0, f45_local3 )
	local f45_local5 = f45_local2
	Lobby.Process.AppendProcess( f45_local5, f45_local4 )
	return f45_local5
end

Lobby.ProcessNavigate.ChangeToCPLANCustomGameLobby = function ( f46_arg0, f46_arg1, f46_arg2, f46_arg3 )
	local f46_local0 = {
		controller = f46_arg0,
		errorTarget = f46_arg2
	}
	local f46_local1 = Lobby.Interrupt.Back( Lobby.ProcessNavigate.GameLobbyInterrupt, f46_local0 )
	local f46_local2 = Lobby.Interrupt.FailedAction( Lobby.ProcessNavigate.GameLobbyInterrupt, f46_local0 )
	local f46_local3 = Lobby.Interrupt.ErrorMsg( Lobby.ProcessNavigate.GameLobbyInterrupt, f46_local0, Engine.Localize( "MENU_FAILED_TO_HOST_LOBBY" ) )
	Engine.LobbyLaunchClear()
	local f46_local4 = function ()
		Lobby.Timer.HostingLobby( {
			controller = f46_arg0,
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
			mainMode = f46_arg2.mainMode,
			lobbyTimerType = f46_arg2.lobbyTimerType
		} )
	end
	
	local f46_local5 = Lobby.Actions.LobbyVMCallRetVal( Lobby.Timer.HostingLobbyEnd, {
		controller = f46_arg0,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		mainMode = f46_arg2.mainMode
	}, true, false, false )
	local f46_local6 = Lobby.Actions.ExecuteScript( f46_local4 )
	local f46_local7 = Lobby.Actions.OpenSpinner()
	local f46_local8 = Lobby.Actions.CloseSpinner()
	local f46_local9 = Lobby.Actions.LobbySettings( f46_arg0, f46_arg2 )
	local f46_local10 = Lobby.Actions.UpdateUI( f46_arg0, f46_arg2 )
	local f46_local11 = Lobby.Actions.SwitchMode( f46_arg0, switchToMode )
	local f46_local12 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f46_local13 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f46_local14 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f46_local15 = {
		head = nil,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = false
	}
	local f46_local16 = nil
	if f46_local12 == true then
		f46_local15.head = f46_local5
		Lobby.Process.AddActions( f46_local5, f46_local7, Lobby.Process.DO_NOTHING_IF_FAILURE, f46_local3 )
		Lobby.Process.AddActions( f46_local7, f46_local6, f46_local3, f46_local3 )
		f46_local16 = f46_local6
	else
		f46_local15.head = f46_local7
		f46_local16 = f46_local7
	end
	Lobby.Process.AddActions( f46_local16, f46_local9, f46_local3, f46_local3 )
	Lobby.Process.AddActions( f46_local9, f46_local10, f46_local3, f46_local3 )
	Lobby.Process.AddActions( f46_local10, f46_local8, f46_local3, f46_local3 )
	return f46_local15
end

Lobby.ProcessNavigate.LeaveCPLANGameLobby = function ( f48_arg0, f48_arg1, f48_arg2, f48_arg3 )
	local f48_local0 = {
		controller = f48_arg0,
		errorTarget = f48_arg2
	}
	local f48_local1 = Lobby.Interrupt.Back( Lobby.ProcessNavigate.GameLobbyInterrupt, f48_local0 )
	local f48_local2 = Lobby.Interrupt.FailedAction( Lobby.ProcessNavigate.GameLobbyInterrupt, f48_local0 )
	local f48_local3 = Lobby.Interrupt.ErrorMsg( Lobby.ProcessNavigate.GameLobbyInterrupt, f48_local0, Engine.Localize( "MENU_FAILED_TO_HOST_LOBBY" ) )
	Engine.LobbyLaunchClear()
	local f48_local4 = function ()
		Engine.SetLobbyMode( f48_arg2.lobbyType, f48_arg2.lobbyMode )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
		Engine.SetGametype( Lobby.ProcessNavigate.SwitchLobbiesGetGametype( f48_arg0, f48_arg2 ) )
	end
	
	local f48_local5 = function ()
		Lobby.Timer.HostingLobby( {
			controller = f48_arg0,
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
			mainMode = f48_arg2.mainMode,
			lobbyTimerType = f48_arg2.lobbyTimerType
		} )
	end
	
	local f48_local6 = Lobby.Actions.LobbyVMCallRetVal( Lobby.Timer.HostingLobbyEnd, {
		controller = f48_arg0,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		mainMode = f48_arg2.mainMode
	}, true, false, false )
	local f48_local7 = Lobby.Actions.ExecuteScript( f48_local4 )
	local f48_local8 = Lobby.Actions.ExecuteScript( f48_local5 )
	local f48_local9 = Lobby.Actions.OpenSpinner()
	local f48_local10 = Lobby.Actions.CloseSpinner()
	local f48_local11 = Lobby.Actions.LeaveWithParty( 3000 )
	local f48_local12 = Lobby.Actions.LobbySettings( f48_arg0, f48_arg2 )
	local f48_local13 = Lobby.Actions.UpdateUI( f48_arg0, f48_arg2 )
	local f48_local14 = Lobby.Actions.SwitchMode( f48_arg0, switchToMode )
	local f48_local15 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f48_local16 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f48_local17 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f48_local18 = Lobby.Actions.SetSavedOrDefaultMap( f48_arg0, f48_arg2 )
	local f48_local19 = {
		head = nil,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = false
	}
	local f48_local20 = nil
	if f48_local15 == true then
		f48_local19.head = f48_local6
		Lobby.Process.AddActions( f48_local6, f48_local9, Lobby.Process.DO_NOTHING_IF_FAILURE, f48_local3 )
		f48_local20 = f48_local9
		if f48_local16 == true and f48_local17 > 1 and f48_arg3 == LuaEnums.LEAVE_WITH_PARTY.WITH then
			Lobby.Process.AddActions( f48_local20, f48_local11, f48_local3, f48_local3 )
			f48_local20 = f48_local11
		end
		Lobby.Process.AddActions( f48_local20, f48_local7, f48_local3, f48_local3 )
		Lobby.Process.AddActions( f48_local7, f48_local8, f48_local3, f48_local3 )
		f48_local20 = f48_local8
	else
		f48_local19.head = f48_local9
		f48_local20 = f48_local9
		if f48_local16 == true and f48_local17 > 1 and f48_arg3 == LuaEnums.LEAVE_WITH_PARTY.WITH then
			Lobby.Process.AddActions( f48_local20, f48_local11, f48_local3, f48_local3 )
			f48_local20 = f48_local11
		end
	end
	Lobby.Process.AddActions( f48_local20, f48_local12, f48_local3, f48_local3 )
	Lobby.Process.AddActions( f48_local12, f48_local18, f48_local3, f48_local3 )
	Lobby.Process.AddActions( f48_local18, f48_local13, f48_local3, f48_local3 )
	Lobby.Process.AddActions( f48_local13, f48_local10, f48_local3, f48_local3 )
	return f48_local19
end

