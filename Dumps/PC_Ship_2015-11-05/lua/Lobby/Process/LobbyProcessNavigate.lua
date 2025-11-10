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
	local f4_local0 = f4_arg1.controller
	local f4_local1 = f4_arg1.errorTarget
	local f4_local2 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_IDLE )
	end
	
	local f4_local3 = function ()
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local f4_local4 = Lobby.Actions.OpenSpinner()
	local f4_local5 = Lobby.Actions.ExecuteScript( f4_local2 )
	local f4_local6 = Lobby.Actions.LobbyVMCallRetVal( Lobby.Timer.HostingLobbyEnd, {
		controller = f4_local0,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		mainMode = f4_local1.mainMode
	}, true, false, false )
	local f4_local7 = Lobby.Actions.ExecuteScript( f4_local3 )
	local f4_local8 = Lobby.Actions.LobbySettings( f4_local0, f4_local1 )
	local f4_local9 = Lobby.Actions.UpdateUI( f4_local0, f4_local1 )
	local f4_local10 = Lobby.Actions.SwitchMode( f4_local0, Lobby.Core.GetMainModeStr( f4_local1.mainMode ) )
	local f4_local11 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f4_local12 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f4_local13 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f4_local14 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f4_local15 = Lobby.Actions.LobbyHostStart( f4_local0, f4_local1.mainMode, f4_local1.lobbyType, f4_local1.lobbyMode, f4_local1.maxClients )
	local f4_local16 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f4_local17 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f4_local18 = Lobby.Actions.CloseSpinner()
	local f4_local19 = {
		head = f4_local4,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = false
	}
	Lobby.Process.ForceAction( f4_local4, f4_local5 )
	Lobby.Process.ForceAction( f4_local5, f4_local6 )
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
	if f4_arg0 == Lobby.Interrupt.BACK then
		
	elseif f4_arg0 == Lobby.Interrupt.FAILED_ACTION and f4_arg2.action ~= nil then
		Lobby.Process.ForceAction( f4_local18, Lobby.Actions.ErrorPopup( f4_arg2.action ) )
	elseif f4_arg0 == Lobby.Interrupt.ERROR_MSG and f4_arg2.errorMsg ~= nil then
		local f4_local20 = f4_arg2.errorMsg
		if f4_arg2.action ~= nil and Engine.IsDevelopmentBuild() then
			if f4_arg2.action.errorFuncPtr then
				f4_local20 = f4_local20 .. "\n\ndebug: " .. f4_arg2.action:errorFuncPtr()
			else
				f4_local20 = f4_local20 .. "\n\n(debug info, failed action: " .. f4_arg2.action.name .. ")"
			end
		end
		Lobby.Process.ForceAction( f4_local18, Lobby.Actions.ErrorPopupMsg( f4_local20 ) )
	end
	return f4_local19
end

Lobby.ProcessNavigate.SwitchLobbiesGetDefaultGametype = function ( f7_arg0, f7_arg1 )
	local f7_local0 = "coop"
	if f7_arg1.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		if LuaUtils.IsCPZMTarget( f7_arg1.id ) then
			f7_local0 = "cpzm"
		end
	elseif f7_arg1.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		if f7_arg1.id == LobbyData.UITargets.UI_FRLOBBYONLINEGAME.id or f7_arg1.id == LobbyData.UITargets.UI_FRLOBBYLANGAME.id then
			f7_local0 = "fr"
		else
			f7_local0 = "tdm"
		end
	elseif f7_arg1.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		f7_local0 = "zclassic"
	end
	return f7_local0
end

Lobby.ProcessNavigate.SwitchLobbiesIsGametypeValid = function ( f8_arg0 )
	if f8_arg0 == "" then
		return false
	elseif not Engine.IsGameTypeValid( f8_arg0 ) then
		return false
	else
		return true
	end
end

Lobby.ProcessNavigate.SwitchLobbiesGetGametype = function ( f9_arg0, f9_arg1 )
	local f9_local0 = nil
	if f9_arg1.id == LobbyData.UITargets.UI_FRLOBBYONLINEGAME.id or f9_arg1.id == LobbyData.UITargets.UI_FRLOBBYLANGAME.id then
		f9_local0 = "fr"
	else
		f9_local0 = Engine.ProfileValueAsString( f9_arg0, "gametype" )
	end
	if not Lobby.ProcessNavigate.SwitchLobbiesIsGametypeValid( f9_local0 ) then
		f9_local0 = Lobby.ProcessNavigate.SwitchLobbiesGetDefaultGametype( f9_arg0, f9_arg1 )
	end
	return f9_local0
end

Lobby.ProcessNavigate.SwitchLobbiesIsMapValid = function ( f10_arg0 )
	if f10_arg0 == "" then
		return false
	elseif not Engine.IsMapValid( f10_arg0 ) then
		return false
	else
		return true
	end
end

Lobby.ProcessNavigate.SwitchLobbiesGetMap = function ( f11_arg0, f11_arg1 )
	local f11_local0 = nil
	if Engine.IsCampaignGame() then
		f11_local0 = Engine.GetSavedMapQueuedMap()
		if f11_local0 == nil or f11_local0 == "" then
			f11_local0 = Engine.GetSavedMap()
		end
	elseif Engine.IsMultiplayerGame() then
		if f11_arg1.id == LobbyData.UITargets.UI_FRLOBBYONLINEGAME.id or f11_arg1.id == LobbyData.UITargets.UI_FRLOBBYLANGAME.id then
			f11_local0 = Engine.ProfileValueAsString( f11_arg0, "map_fr" )
		else
			f11_local0 = Engine.ProfileValueAsString( f11_arg0, "map" )
		end
	elseif Engine.IsZombiesGame() then
		f11_local0 = Engine.ProfileValueAsString( f11_arg0, "map_zm" )
	end
	if not Lobby.ProcessNavigate.SwitchLobbiesIsMapValid( f11_local0 ) then
		f11_local0 = LuaUtils.GetDefaultMap( f11_arg1 )
	end
	return f11_local0
end

Lobby.ProcessNavigate.SetupLobbyMapAndGameType = function ( f12_arg0, f12_arg1 )
	if f12_arg1.lobbyMode == Enum.LobbyMode.LOBBY_MODE_THEATER then
		return 
	else
		Engine.SetGametype( Lobby.ProcessNavigate.SwitchLobbiesGetGametype( f12_arg0, f12_arg1 ) )
		local f12_local0 = Lobby.ProcessNavigate.SwitchLobbiesGetMap( f12_arg0, f12_arg1 )
		Engine.GameLobbySetMap( f12_local0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.selectedMapId" ), f12_local0 )
	end
end

Lobby.ProcessNavigate.CreateGameLobby = function ( f13_arg0, f13_arg1, f13_arg2 )
	local f13_local0 = {
		controller = f13_arg0,
		errorTarget = f13_arg1
	}
	local f13_local1 = Lobby.Interrupt.Back( Lobby.ProcessNavigate.GameLobbyInterrupt, f13_local0 )
	local f13_local2 = Lobby.Interrupt.FailedAction( Lobby.ProcessNavigate.GameLobbyInterrupt, f13_local0 )
	local f13_local3 = Lobby.Interrupt.ErrorMsg( Lobby.ProcessNavigate.GameLobbyInterrupt, f13_local0, Engine.Localize( "MENU_FAILED_TO_HOST_LOBBY" ) )
	local f13_local4 = function ()
		Lobby.ProcessNavigate.SetupLobbyMapAndGameType( f13_arg0, f13_arg2 )
	end
	
	local f13_local5 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_JOIN )
	end
	
	local f13_local6 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_IDLE )
	end
	
	local f13_local7 = Lobby.Actions.OpenSpinner( true )
	local f13_local8 = Lobby.Actions.CloseSpinner()
	local f13_local9 = Lobby.Actions.WaitForJoiningClients( 5000 )
	local f13_local10 = Lobby.Actions.ExecuteScript( f13_local5 )
	local f13_local11 = Lobby.Actions.ExecuteScript( f13_local6 )
	local f13_local12 = Lobby.Actions.LobbySettings( f13_arg0, f13_arg2 )
	local f13_local13 = Lobby.Actions.UpdateUI( f13_arg0, f13_arg2 )
	local f13_local14 = Lobby.Actions.SwitchMode( f13_arg0, Lobby.Core.GetMainModeStr( f13_arg2.mainMode ) )
	local f13_local15 = Lobby.Actions.SwitchCampaignMode( f13_arg0, Enum.CampaignMode.CAMPAIGNMODE_DEFAULT )
	if LuaUtils.IsCPZMTarget( f13_arg2.id ) then
		f13_local15 = Lobby.Actions.SwitchCampaignMode( f13_arg0, Enum.CampaignMode.CAMPAIGNMODE_ZOMBIES )
	end
	local f13_local16 = Lobby.Actions.ExecuteScript( f13_local4 )
	local f13_local17 = Lobby.Actions.LobbyHostStart( f13_arg0, f13_arg2.mainMode, Enum.LobbyType.LOBBY_TYPE_GAME, f13_arg2.lobbyMode, f13_arg2.maxClients )
	local f13_local18 = Lobby.Actions.LobbyVMCall( Lobby.Timer.HostingLobby, {
		controller = f13_arg0,
		lobbyType = f13_local17.lobbyType,
		mainMode = f13_arg2.mainMode,
		lobbyTimerType = f13_arg2.lobbyTimerType
	} )
	local f13_local19 = Lobby.Actions.SetSavedOrDefaultMap( f13_arg0, f13_arg2 )
	local f13_local20 = Lobby.Actions.LobbyInfoProbe( f13_arg0, {
		xuid = Engine.GetXUID64( f13_arg0 )
	} )
	local f13_local21 = Lobby.Actions.LobbyJoinXUID( f13_arg0, {
		xuid = Engine.GetXUID64( f13_arg0 )
	}, Enum.JoinType.JOIN_TYPE_PARTY )
	local f13_local22 = {
		head = f13_local7,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = false
	}
	Lobby.Process.AddActions( f13_local7, f13_local9, f13_local3, f13_local3 )
	Lobby.Process.AddActions( f13_local9, f13_local10, f13_local3, f13_local3 )
	Lobby.Process.AddActions( f13_local10, f13_local14, f13_local3, f13_local3 )
	Lobby.Process.AddActions( f13_local14, f13_local15, f13_local3, f13_local3 )
	Lobby.Process.AddActions( f13_local15, f13_local12, f13_local3, f13_local3 )
	Lobby.Process.AddActions( f13_local12, f13_local16, f13_local3, f13_local3 )
	Lobby.Process.AddActions( f13_local16, f13_local17, f13_local3, f13_local3 )
	Lobby.Process.AddActions( f13_local17, f13_local13, f13_local3, f13_local3 )
	Lobby.Process.AddActions( f13_local13, f13_local20, f13_local3, f13_local3 )
	Lobby.Process.AddActions( f13_local20, f13_local21, f13_local3, f13_local3 )
	Lobby.Process.AddActions( f13_local21, f13_local18, f13_local3, f13_local3 )
	Lobby.Process.AddActions( f13_local18, f13_local19, f13_local3, f13_local3 )
	Lobby.Process.AddActions( f13_local19, f13_local11, f13_local3, f13_local3 )
	Lobby.Process.AddActions( f13_local11, f13_local8, f13_local3, f13_local3 )
	Lobby.Process.AddActions( f13_local8, nil, f13_local3, f13_local3 )
	return f13_local22
end

Lobby.ProcessNavigate.CreatePublicGameLobby = function ( f17_arg0, f17_arg1, f17_arg2 )
	local f17_local0 = {
		controller = f17_arg0,
		errorTarget = f17_arg1
	}
	local f17_local1 = Lobby.Interrupt.Back( Lobby.ProcessNavigate.GameLobbyInterrupt, f17_local0 )
	local f17_local2 = Lobby.Interrupt.FailedAction( Lobby.ProcessNavigate.GameLobbyInterrupt, f17_local0 )
	local f17_local3 = Lobby.Interrupt.ErrorMsg( Lobby.ProcessNavigate.GameLobbyInterrupt, f17_local0, Engine.Localize( "MENU_FAILED_TO_HOST_LOBBY" ) )
	local f17_local4 = function ()
		Engine.SetLobbyMaxClients( f17_arg2.lobbyType, Dvar.party_maxplayers:get() )
	end
	
	local f17_local5 = function ()
		Lobby.Timer.HostingLobby( {
			controller = f17_arg0,
			lobbyType = f17_arg2.lobbyType,
			mainMode = f17_arg2.mainMode,
			lobbyTimerType = f17_arg2.lobbyTimerType
		} )
		Lobby.Matchmaking.ClearSearchInfo()
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, true )
	end
	
	local f17_local6 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_JOIN )
	end
	
	local f17_local7 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_IDLE )
	end
	
	local f17_local8 = function ( f22_arg0 )
		if LuaUtils.IsArenaMode() then
			Lobby.Matchmaking.SetupMatchmakingQuery( f17_arg0, Lobby.Matchmaking.SearchMode.ARENA, f22_arg0 )
		else
			Lobby.Matchmaking.SetupMatchmakingQuery( f17_arg0, Lobby.Matchmaking.SearchMode.PUBLIC, f22_arg0 )
		end
	end
	
	f17_local8( true )
	local f17_local9 = Lobby.Actions.OpenSpinner( true )
	local f17_local10 = Lobby.Actions.CloseSpinner()
	local f17_local11 = Lobby.Actions.WaitForJoiningClients( 5000 )
	local f17_local12 = Lobby.Actions.ExecuteScript( f17_local6 )
	local f17_local13 = Lobby.Actions.ExecuteScript( f17_local7 )
	local f17_local14 = Lobby.Actions.SetQueueCancellable( true )
	local f17_local15 = Lobby.Actions.LobbyHostStart( f17_arg0, f17_arg2.mainMode, f17_arg2.lobbyType, f17_arg2.lobbyMode, f17_arg2.maxClients )
	local f17_local16 = Lobby.Actions.LobbyInfoProbe( f17_arg0, {
		xuid = Engine.GetXUID64( f17_arg0 )
	} )
	local f17_local17 = Lobby.Actions.LobbyJoinXUID( f17_arg0, {
		xuid = Engine.GetXUID64( f17_arg0 )
	}, Enum.JoinType.JOIN_TYPE_PARTY )
	local f17_local18 = Lobby.Actions.LobbySettings( f17_arg0, f17_arg2 )
	local f17_local19 = Lobby.Actions.UpdateUI( f17_arg0, f17_arg2 )
	local f17_local20 = Lobby.Actions.RunPlaylistSettings( f17_arg0 )
	local f17_local21 = Lobby.Actions.IsButtonPressed( f17_arg0, "BUTTON_X" )
	local f17_local22 = Lobby.Actions.IsDvarSet( "lobbySearchSkip", true )
	local f17_local23 = Lobby.Actions.IsDvarSet( "lobbyAdvertiseSkip", true )
	local f17_local24 = Lobby.Actions.SearchForLobby( f17_arg0 )
	local f17_local25 = Lobby.Actions.SearchForLobby( f17_arg0 )
	local f17_local26 = Lobby.Actions.SearchForLobby( f17_arg0 )
	local f17_local27 = Lobby.Actions.SearchForLobby( f17_arg0 )
	local f17_local28 = Lobby.Actions.SearchForLobby( f17_arg0 )
	local f17_local29 = Lobby.Actions.SearchForLobby( f17_arg0 )
	local f17_local30 = Lobby.Actions.QoSJoinSearchResults( f17_arg0, f17_local24 )
	local f17_local31 = Lobby.Actions.QoSJoinSearchResults( f17_arg0, f17_local25 )
	local f17_local32 = Lobby.Actions.QoSJoinSearchResults( f17_arg0, f17_local26 )
	local f17_local33 = Lobby.Actions.QoSJoinSearchResults( f17_arg0, f17_local27 )
	local f17_local34 = Lobby.Actions.QoSJoinSearchResults( f17_arg0, f17_local28 )
	local f17_local35 = Lobby.Actions.QoSJoinSearchResults( f17_arg0, f17_local29 )
	local f17_local36 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	local f17_local37 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	local f17_local38 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	local f17_local39 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	local f17_local40 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	f17_local24.name = f17_local24.name .. "_dedi1"
	f17_local25.name = f17_local25.name .. "_dedi2"
	f17_local26.name = f17_local26.name .. "_dedi3"
	f17_local27.name = f17_local27.name .. "_dediunpark4"
	f17_local28.name = f17_local28.name .. "_listen5"
	f17_local29.name = f17_local29.name .. "_listen6"
	f17_local30.name = f17_local30.name .. "_1"
	f17_local31.name = f17_local31.name .. "_2"
	f17_local32.name = f17_local32.name .. "_3"
	f17_local33.name = f17_local33.name .. "_4"
	f17_local34.name = f17_local34.name .. "_5"
	f17_local35.name = f17_local35.name .. "_6"
	local f17_local41 = Lobby.Actions.CanHostServer( f17_arg0, f17_arg2 )
	local f17_local42 = Lobby.Actions.TimeDelay( 1500 )
	local f17_local43 = Lobby.Actions.ExecuteScript( f17_local8, false )
	local f17_local44 = Lobby.Actions.AdvertiseLobby( true )
	local f17_local45 = Lobby.Actions.ExecuteScript( f17_local4 )
	local f17_local46 = Lobby.Actions.ExecuteScript( f17_local5 )
	local f17_local47 = {
		head = f17_local9,
		interrupt = f17_local1,
		force = false,
		cancellable = false
	}
	Lobby.Process.AddActions( f17_local9, f17_local11, f17_local3, f17_local3 )
	Lobby.Process.AddActions( f17_local11, f17_local12, f17_local3, f17_local3 )
	Lobby.Process.AddActions( f17_local12, f17_local15, f17_local3, f17_local3 )
	Lobby.Process.AddActions( f17_local15, f17_local18, f17_local3, f17_local3 )
	Lobby.Process.AddActions( f17_local18, f17_local20, f17_local3, f17_local3 )
	Lobby.Process.AddActions( f17_local20, f17_local45, f17_local3, f17_local3 )
	Lobby.Process.AddActions( f17_local45, f17_local16, f17_local3, f17_local3 )
	Lobby.Process.AddActions( f17_local16, f17_local17, f17_local3, f17_local3 )
	Lobby.Process.AddActions( f17_local17, f17_local19, f17_local3, f17_local3 )
	Lobby.Process.AddActions( f17_local19, f17_local10, f17_local3, f17_local3 )
	Lobby.Process.AddActions( f17_local10, f17_local13, f17_local3, f17_local3 )
	Lobby.Process.AddActions( f17_local13, f17_local14, f17_local3, f17_local3 )
	Lobby.Process.AddActions( f17_local14, f17_local21, f17_local3, f17_local3 )
	Lobby.Process.AddActions( f17_local21, f17_local23, f17_local22, f17_local22 )
	Lobby.Process.AddActions( f17_local22, f17_local23, f17_local24, f17_local24 )
	Lobby.Process.AddActions( f17_local24, f17_local30, f17_local36, f17_local3 )
	Lobby.Process.AddActions( f17_local30, nil, f17_local36, f17_local3 )
	Lobby.Process.ForceAction( f17_local36, f17_local25 )
	Lobby.Process.AddActions( f17_local25, f17_local31, f17_local37, f17_local3 )
	Lobby.Process.AddActions( f17_local31, nil, f17_local37, f17_local3 )
	Lobby.Process.ForceAction( f17_local37, f17_local26 )
	Lobby.Process.AddActions( f17_local26, f17_local32, f17_local38, f17_local3 )
	Lobby.Process.AddActions( f17_local32, nil, f17_local38, f17_local3 )
	Lobby.Process.ForceAction( f17_local38, f17_local27 )
	Lobby.Process.AddActions( f17_local27, f17_local33, f17_local42, f17_local3 )
	Lobby.Process.AddActions( f17_local33, nil, f17_local42, f17_local3 )
	Lobby.Process.AddActions( f17_local42, f17_local43, f17_local43, f17_local43 )
	Lobby.Process.AddActions( f17_local43, f17_local24, f17_local24, f17_local24 )
	return f17_local47
end

Lobby.ProcessNavigate.ChangeToPublicGameLobby = function ( f23_arg0, f23_arg1, f23_arg2 )
	local f23_local0 = {
		controller = f23_arg0,
		errorTarget = f23_arg1
	}
	local f23_local1 = Lobby.Interrupt.Back( Lobby.ProcessNavigate.GameLobbyInterrupt, f23_local0 )
	local f23_local2 = Lobby.Interrupt.FailedAction( Lobby.ProcessNavigate.GameLobbyInterrupt, f23_local0 )
	local f23_local3 = Lobby.Interrupt.ErrorMsg( Lobby.ProcessNavigate.GameLobbyInterrupt, f23_local0, Engine.Localize( "MENU_FAILED_TO_HOST_LOBBY" ) )
	Engine.LobbyLaunchClear()
	Lobby.Debug.SessionSQJClear()
	local f23_local4 = function ()
		Lobby.Timer.HostingLobby( {
			controller = f23_arg0,
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
			mainMode = f23_arg2.mainMode,
			lobbyTimerType = f23_arg2.lobbyTimerType
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, true )
	end
	
	local f23_local5 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_JOIN )
		Engine.SetLobbyMode( f23_arg2.lobbyType, f23_arg2.lobbyMode )
	end
	
	local f23_local6 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_IDLE )
	end
	
	Lobby.Matchmaking.SetupMatchmakingQuery( f23_arg0, Lobby.Matchmaking.SearchMode.PUBLIC )
	local f23_local7 = Lobby.Actions.OpenSpinner( true )
	local f23_local8 = Lobby.Actions.CloseSpinner()
	local f23_local9 = Lobby.Actions.WaitForJoiningClients( 5000 )
	local f23_local10 = Lobby.Actions.ExecuteScript( f23_local5 )
	local f23_local11 = Lobby.Actions.ExecuteScript( f23_local6 )
	local f23_local12 = Lobby.Actions.SetQueueCancellable( true )
	local f23_local13 = Lobby.Actions.LobbySettings( f23_arg0, f23_arg2 )
	local f23_local14 = Lobby.Actions.UpdateUI( f23_arg0, f23_arg2 )
	local f23_local15 = Lobby.Actions.RunPlaylistSettings( f23_arg0 )
	local f23_local16 = Lobby.Actions.IsButtonPressed( f23_arg0, "BUTTON_X" )
	local f23_local17 = Lobby.Actions.SearchForLobby( f23_arg0 )
	local f23_local18 = Lobby.Actions.SearchForLobby( f23_arg0 )
	local f23_local19 = Lobby.Actions.SearchForLobby( f23_arg0 )
	local f23_local20 = Lobby.Actions.QoSJoinSearchResults( f23_arg0, f23_local17 )
	local f23_local21 = Lobby.Actions.QoSJoinSearchResults( f23_arg0, f23_local18 )
	local f23_local22 = Lobby.Actions.QoSJoinSearchResults( f23_arg0, f23_local19 )
	local f23_local23 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	local f23_local24 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	local f23_local25 = Lobby.Actions.AdvertiseLobby( true )
	local f23_local26 = Lobby.Actions.ExecuteScript( f23_local4 )
	local f23_local27 = {
		head = f23_local7,
		interrupt = f23_local1,
		force = false,
		cancellable = false
	}
	Lobby.Process.AddActions( f23_local7, f23_local9, f23_local3, f23_local3 )
	Lobby.Process.AddActions( f23_local9, f23_local10, f23_local3, f23_local3 )
	Lobby.Process.AddActions( f23_local10, f23_local13, f23_local3, f23_local3 )
	Lobby.Process.AddActions( f23_local13, f23_local15, f23_local3, f23_local3 )
	Lobby.Process.AddActions( f23_local15, f23_local14, f23_local3, f23_local3 )
	Lobby.Process.AddActions( f23_local14, f23_local8, f23_local3, f23_local3 )
	Lobby.Process.AddActions( f23_local8, f23_local12, f23_local3, f23_local3 )
	Lobby.Process.AddActions( f23_local12, f23_local16, f23_local3, f23_local3 )
	Lobby.Process.AddActions( f23_local16, f23_local25, f23_local17, f23_local17 )
	Lobby.Process.AddActions( f23_local17, f23_local20, f23_local23, f23_local3 )
	Lobby.Process.AddActions( f23_local20, f23_local11, f23_local23, f23_local3 )
	Lobby.Process.ForceAction( f23_local23, f23_local18 )
	Lobby.Process.AddActions( f23_local18, f23_local21, f23_local24, f23_local3 )
	Lobby.Process.AddActions( f23_local21, f23_local11, f23_local24, f23_local3 )
	Lobby.Process.ForceAction( f23_local24, f23_local19 )
	Lobby.Process.AddActions( f23_local19, f23_local22, f23_local25, f23_local3 )
	Lobby.Process.AddActions( f23_local22, f23_local11, f23_local25, f23_local3 )
	Lobby.Process.AddActions( f23_local25, f23_local26, f23_local3, f23_local3 )
	Lobby.Process.AddActions( f23_local26, f23_local11, f23_local3, f23_local3 )
	Lobby.Process.AddActions( f23_local11, nil, f23_local3, f23_local3 )
	return f23_local27
end

Lobby.ProcessNavigate.ChangeToCustomGameLobby = function ( f27_arg0, f27_arg1, f27_arg2 )
	local f27_local0 = {
		controller = f27_arg0,
		errorTarget = f27_arg1
	}
	local f27_local1 = Lobby.Interrupt.Back( Lobby.ProcessNavigate.GameLobbyInterrupt, f27_local0 )
	local f27_local2 = Lobby.Interrupt.FailedAction( Lobby.ProcessNavigate.GameLobbyInterrupt, f27_local0 )
	local f27_local3 = Lobby.Interrupt.ErrorMsg( Lobby.ProcessNavigate.GameLobbyInterrupt, f27_local0, Engine.Localize( "MENU_FAILED_TO_HOST_LOBBY" ) )
	Engine.LobbyLaunchClear()
	local f27_local4 = function ()
		Lobby.Timer.HostingLobby( {
			controller = f27_arg0,
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
			mainMode = f27_arg2.mainMode,
			lobbyTimerType = f27_arg2.lobbyTimerType
		} )
	end
	
	local f27_local5 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_JOIN )
		Engine.SetLobbyMode( f27_arg2.lobbyType, f27_arg2.lobbyMode )
	end
	
	local f27_local6 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_IDLE )
	end
	
	Lobby.Matchmaking.SetupMatchmakingQuery( f27_arg0, Lobby.Matchmaking.SearchMode.PUBLIC )
	local f27_local7 = Lobby.Actions.OpenSpinner( true )
	local f27_local8 = Lobby.Actions.CloseSpinner()
	local f27_local9 = Lobby.Actions.WaitForJoiningClients( 5000 )
	local f27_local10 = Lobby.Actions.ExecuteScript( f27_local5 )
	local f27_local11 = Lobby.Actions.ExecuteScript( f27_local6 )
	local f27_local12 = Lobby.Actions.LobbySettings( f27_arg0, f27_arg2 )
	local f27_local13 = Lobby.Actions.UpdateUI( f27_arg0, f27_arg2 )
	local f27_local14 = Lobby.Actions.ExecuteScript( f27_local4 )
	local f27_local15 = {
		head = f27_local7,
		interrupt = f27_local1,
		force = false,
		cancellable = false
	}
	Lobby.Process.AddActions( f27_local7, f27_local9, f27_local3, f27_local3 )
	Lobby.Process.AddActions( f27_local9, f27_local10, f27_local3, f27_local3 )
	Lobby.Process.AddActions( f27_local10, f27_local12, f27_local3, f27_local3 )
	Lobby.Process.AddActions( f27_local12, f27_local13, f27_local3, f27_local3 )
	Lobby.Process.AddActions( f27_local13, f27_local8, f27_local3, f27_local3 )
	Lobby.Process.AddActions( f27_local8, f27_local14, f27_local3, f27_local3 )
	Lobby.Process.AddActions( f27_local14, f27_local11, f27_local3, f27_local3 )
	Lobby.Process.AddActions( f27_local11, nil, f27_local3, f27_local3 )
	return f27_local15
end

Lobby.ProcessNavigate.ChangeToCPPublicGameLobby = function ( f31_arg0, f31_arg1, f31_arg2 )
	local f31_local0 = {
		controller = f31_arg0,
		errorTarget = f31_arg1
	}
	local f31_local1 = Lobby.Interrupt.Back( Lobby.ProcessNavigate.GameLobbyInterrupt, f31_local0 )
	local f31_local2 = Lobby.Interrupt.FailedAction( Lobby.ProcessNavigate.GameLobbyInterrupt, f31_local0 )
	local f31_local3 = Lobby.Interrupt.ErrorMsg( Lobby.ProcessNavigate.GameLobbyInterrupt, f31_local0, Engine.Localize( "MENU_FAILED_TO_HOST_LOBBY" ) )
	local f31_local4 = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.cpPublicLobbySearchAll" ) )
	Engine.LobbyLaunchClear()
	Lobby.Debug.SessionSQJClear()
	local f31_local5 = function ()
		Lobby.Timer.HostingLobby( {
			controller = f31_arg0,
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
			mainMode = f31_arg2.mainMode,
			lobbyTimerType = f31_arg2.lobbyTimerType
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, true )
	end
	
	local f31_local6 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_JOIN )
		Engine.SetLobbyMode( f31_arg2.lobbyType, f31_arg2.lobbyMode )
	end
	
	local f31_local7 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_IDLE )
	end
	
	if f31_local4 == true then
		Lobby.Matchmaking.SetupMatchmakingQuery( f31_arg0, Lobby.Matchmaking.SearchMode.PUBLIC_CP_ALL )
	else
		Lobby.Matchmaking.SetupMatchmakingQuery( f31_arg0, Lobby.Matchmaking.SearchMode.PUBLIC )
	end
	local f31_local8 = Lobby.Actions.OpenSpinner( true )
	local f31_local9 = Lobby.Actions.CloseSpinner()
	local f31_local10 = Lobby.Actions.WaitForJoiningClients( 5000 )
	local f31_local11 = Lobby.Actions.ExecuteScript( f31_local6 )
	local f31_local12 = Lobby.Actions.ExecuteScript( f31_local7 )
	local f31_local13 = Lobby.Actions.LobbySettings( f31_arg0, f31_arg2 )
	local f31_local14 = Lobby.Actions.UpdateUI( f31_arg0, f31_arg2 )
	local f31_local15 = Lobby.Actions.RunPlaylistSettings( f31_arg0 )
	local f31_local16 = Lobby.Actions.IsButtonPressed( f31_arg0, "BUTTON_X" )
	local f31_local17 = Lobby.Actions.SearchForLobby( f31_arg0 )
	local f31_local18 = Lobby.Actions.SearchForLobby( f31_arg0 )
	local f31_local19 = Lobby.Actions.SearchForLobby( f31_arg0 )
	local f31_local20 = Lobby.Actions.QoSJoinSearchResults( f31_arg0, f31_local17 )
	local f31_local21 = Lobby.Actions.QoSJoinSearchResults( f31_arg0, f31_local18 )
	local f31_local22 = Lobby.Actions.QoSJoinSearchResults( f31_arg0, f31_local19 )
	local f31_local23 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	local f31_local24 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	local f31_local25 = Lobby.Actions.AdvertiseLobby( true )
	local f31_local26 = Lobby.Actions.ExecuteScript( f31_local5 )
	local f31_local27 = {
		head = f31_local8,
		interrupt = f31_local1,
		force = false,
		cancellable = true
	}
	Lobby.Process.AddActions( f31_local8, f31_local10, f31_local3, f31_local3 )
	Lobby.Process.AddActions( f31_local10, f31_local11, f31_local3, f31_local3 )
	Lobby.Process.AddActions( f31_local11, f31_local13, f31_local3, f31_local3 )
	Lobby.Process.AddActions( f31_local13, f31_local15, f31_local3, f31_local3 )
	Lobby.Process.AddActions( f31_local15, f31_local14, f31_local3, f31_local3 )
	Lobby.Process.AddActions( f31_local14, f31_local9, f31_local3, f31_local3 )
	Lobby.Process.AddActions( f31_local9, f31_local16, f31_local3, f31_local3 )
	Lobby.Process.AddActions( f31_local16, f31_local25, f31_local17, f31_local17 )
	Lobby.Process.AddActions( f31_local17, f31_local20, f31_local23, f31_local3 )
	Lobby.Process.AddActions( f31_local20, f31_local12, f31_local23, f31_local3 )
	Lobby.Process.ForceAction( f31_local23, f31_local18 )
	Lobby.Process.AddActions( f31_local18, f31_local21, f31_local24, f31_local3 )
	Lobby.Process.AddActions( f31_local21, f31_local12, f31_local24, f31_local3 )
	Lobby.Process.ForceAction( f31_local24, f31_local19 )
	Lobby.Process.AddActions( f31_local19, f31_local22, f31_local25, f31_local3 )
	Lobby.Process.AddActions( f31_local22, f31_local12, f31_local25, f31_local3 )
	Lobby.Process.AddActions( f31_local25, f31_local26, f31_local3, f31_local3 )
	Lobby.Process.AddActions( f31_local26, f31_local12, f31_local3, f31_local3 )
	Lobby.Process.AddActions( f31_local12, nil, f31_local3, f31_local3 )
	return f31_local27
end

Lobby.ProcessNavigate.ChangeToPrivateGameLobby = function ( f35_arg0, f35_arg1, f35_arg2, f35_arg3 )
	local f35_local0 = {
		controller = f35_arg0,
		errorTarget = f35_arg2
	}
	local f35_local1 = Lobby.Interrupt.Back( Lobby.ProcessNavigate.GameLobbyInterrupt, f35_local0 )
	local f35_local2 = Lobby.Interrupt.FailedAction( Lobby.ProcessNavigate.GameLobbyInterrupt, f35_local0 )
	local f35_local3 = Lobby.Interrupt.ErrorMsg( Lobby.ProcessNavigate.GameLobbyInterrupt, f35_local0, Engine.Localize( "MENU_FAILED_TO_HOST_LOBBY" ) )
	local f35_local4 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f35_local5 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f35_local6 = Engine.IsAdvertisedLobby( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f35_local7 = Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyClientType.LOBBY_CLIENT_TYPE_REMOTE )
	local f35_local8 = Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyClientType.LOBBY_CLIENT_TYPE_REMOTE )
	local f35_local9
	if f35_arg1.id ~= LobbyData.UITargets.UI_CPLOBBYONLINEPUBLICGAME.id and f35_arg1.id ~= LobbyData.UITargets.UI_CP2LOBBYONLINEPUBLICGAME.id and f35_arg1.id ~= LobbyData.UITargets.UI_ZMLOBBYONLINEPUBLICGAME.id then
		f35_local9 = false
	else
		f35_local9 = true
	end
	if f35_arg1.id ~= LobbyData.UITargets.UI_CPLOBBYONLINECUSTOMGAME.id and f35_arg1.id ~= LobbyData.UITargets.UI_CP2LOBBYONLINECUSTOMGAME.id and f35_arg1.id ~= LobbyData.UITargets.UI_ZMLOBBYONLINECUSTOMGAME.id then
		local f35_local10 = false
	else
		local f35_local10 = true
	end
	Engine.LobbyLaunchClear()
	local f35_local11 = function ()
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local f35_local12 = function ()
		Lobby.Timer.HostingLobby( {
			controller = f35_arg0,
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
			mainMode = f35_arg2.mainMode,
			lobbyTimerType = f35_arg2.lobbyTimerType
		} )
	end
	
	local f35_local13 = Lobby.Actions.LobbyVMCallRetVal( Lobby.Timer.HostingLobbyEnd, {
		controller = f35_arg0,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		mainMode = f35_arg2.mainMode
	}, true, false, false )
	local f35_local14 = Lobby.Actions.AdvertiseLobby( false )
	local f35_local15 = Lobby.Actions.ExecuteScript( f35_local11 )
	local f35_local16 = Lobby.Actions.ExecuteScript( f35_local12 )
	local f35_local17 = Lobby.Actions.OpenSpinner()
	local f35_local18 = Lobby.Actions.CloseSpinner()
	local f35_local19 = Lobby.Actions.LeaveWithParty( 3000 )
	local f35_local20 = Lobby.Actions.LobbySettings( f35_arg0, f35_arg2 )
	local f35_local21 = Lobby.Actions.UpdateUI( f35_arg0, f35_arg2 )
	local f35_local22 = Lobby.Actions.SwitchMode( f35_arg0, switchToMode )
	local f35_local23 = Lobby.Actions.SetSavedOrDefaultMap( f35_arg0, f35_arg2 )
	local f35_local24 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f35_local25 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f35_local26 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f35_local27 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f35_local28 = Lobby.Actions.LobbyHostStart( f35_arg0, f35_arg2.mainMode, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f35_arg2.lobbyMode, f35_arg2.maxClients )
	local f35_local29 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f35_local30 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f35_local31 = Lobby.ProcessNavigate.CreateGameLobby( f35_arg0, f35_arg2.backTarget, f35_arg2 )
	local f35_local32 = Lobby.Actions.EmptyAction()
	local f35_local33 = {
		head = f35_local32,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = false
	}
	if f35_local4 == true then
		if f35_local9 == true then
			Lobby.Process.AddActions( f35_local32, f35_local17, f35_local3, f35_local3 )
			Lobby.Process.AddActions( f35_local17, f35_local13, f35_local3, f35_local3 )
			Lobby.Process.AddActions( f35_local13, f35_local14, f35_local3, f35_local3 )
			f35_local32 = f35_local14
		else
			Lobby.Process.AddActions( f35_local32, f35_local13, f35_local3, f35_local3 )
			Lobby.Process.AddActions( f35_local13, f35_local17, Lobby.Process.DO_NOTHING_IF_FAILURE, f35_local3 )
			f35_local32 = f35_local17
		end
		Lobby.Process.AddActions( f35_local32, f35_local15, f35_local3, f35_local3 )
		f35_local32 = f35_local15
	end
	if f35_local4 == true and f35_local5 == true and f35_local7 == 0 and f35_local8 == 0 then
		Lobby.Process.AddActions( f35_local32, f35_local20, f35_local3, f35_local3 )
		Lobby.Process.AddActions( f35_local20, f35_local23, f35_local3, f35_local3 )
		Lobby.Process.AddActions( f35_local23, f35_local21, f35_local3, f35_local3 )
		Lobby.Process.AddActions( f35_local21, f35_local16, f35_local3, f35_local3 )
		Lobby.Process.AddActions( f35_local16, f35_local18, f35_local3, f35_local3 )
		return f35_local33
	elseif f35_arg3 == LuaEnums.LEAVE_WITH_PARTY.WITH and f35_local5 == true and f35_local8 > 0 then
		Lobby.Process.AddActions( f35_local32, f35_local19, f35_local3, f35_local3 )
		f35_local32 = f35_local19
	end
	if f35_local4 == true then
		Lobby.Process.AddActions( f35_local32, f35_local24, f35_local3, f35_local3 )
		Lobby.Process.AddActions( f35_local24, f35_local25, f35_local3, f35_local3 )
		f35_local32 = f35_local25
		if f35_local5 == true then
			if f35_arg3 == LuaEnums.LEAVE_WITH_PARTY.WITHOUT then
				Lobby.Process.AddActions( f35_local32, f35_local26, f35_local3, f35_local3 )
				Lobby.Process.AddActions( f35_local26, f35_local27, f35_local3, f35_local3 )
				Lobby.Process.AddActions( f35_local27, f35_local28, f35_local3, f35_local3 )
				Lobby.Process.AddActions( f35_local28, f35_local29, f35_local3, f35_local3 )
				Lobby.Process.AddActions( f35_local29, f35_local30, f35_local3, f35_local3 )
				f35_local32 = f35_local30
			end
		else
			Lobby.Process.AddActions( f35_local32, f35_local26, f35_local3, f35_local3 )
			Lobby.Process.AddActions( f35_local26, f35_local28, f35_local3, f35_local3 )
			Lobby.Process.AddActions( f35_local28, f35_local29, f35_local3, f35_local3 )
			Lobby.Process.AddActions( f35_local29, f35_local30, f35_local3, f35_local3 )
			f35_local32 = f35_local30
		end
	elseif f35_local5 == true then
		Lobby.Process.AddActions( f35_local32, f35_local24, f35_local3, f35_local3 )
		f35_local32 = f35_local24
	elseif f35_local5 == false then
		Lobby.Process.AddActions( f35_local32, f35_local24, f35_local3, f35_local3 )
		Lobby.Process.AddActions( f35_local24, f35_local26, f35_local3, f35_local3 )
		Lobby.Process.AddActions( f35_local26, f35_local28, f35_local3, f35_local3 )
		Lobby.Process.AddActions( f35_local28, f35_local29, f35_local3, f35_local3 )
		Lobby.Process.AddActions( f35_local29, f35_local30, f35_local3, f35_local3 )
		f35_local32 = f35_local30
	end
	Lobby.Process.AddActions( f35_local32, f35_local31.head, f35_local3, f35_local3 )
	return f35_local33
end

Lobby.ProcessNavigate.LeaveGameLobby = function ( f38_arg0, f38_arg1, f38_arg2, f38_arg3, f38_arg4 )
	local f38_local0 = {
		controller = f38_arg0,
		errorTarget = f38_arg2
	}
	local f38_local1 = Lobby.Interrupt.Back( Lobby.ProcessNavigate.GameLobbyInterrupt, f38_local0 )
	local f38_local2 = Lobby.Interrupt.FailedAction( Lobby.ProcessNavigate.GameLobbyInterrupt, f38_local0 )
	local f38_local3 = Lobby.Interrupt.ErrorMsg( Lobby.ProcessNavigate.GameLobbyInterrupt, f38_local0, Engine.Localize( "MENU_FAILED_TO_HOST_LOBBY" ) )
	Engine.LobbyLaunchClear()
	local f38_local4 = function ()
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_IDLE )
	end
	
	local f38_local5 = Lobby.Actions.LobbyVMCallRetVal( Lobby.Timer.HostingLobbyEnd, {
		controller = f38_arg0,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		mainMode = f38_arg2.mainMode
	}, true, false, false )
	local f38_local6 = Lobby.Actions.ExecuteScript( f38_local4 )
	local f38_local7 = Lobby.Actions.EmptyAction()
	local f38_local8 = Lobby.Actions.OpenSpinner()
	local f38_local9 = Lobby.Actions.CloseSpinner()
	local f38_local10 = Lobby.Actions.LeaveWithParty( 3000 )
	local f38_local11 = Lobby.Actions.LobbySettings( f38_arg0, f38_arg2 )
	local f38_local12 = Lobby.Actions.SwitchMode( f38_arg0, f38_arg4 )
	local f38_local13 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f38_local14 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f38_local15 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f38_local16 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f38_local17 = Lobby.Actions.LobbyHostStart( f38_arg0, f38_arg2.mainMode, f38_arg2.lobbyType, f38_arg2.lobbyMode, f38_arg2.maxClients )
	local f38_local18 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f38_local19 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f38_local20 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f38_local21 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f38_local22 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f38_local23 = Lobby.Actions.UpdateUI( f38_arg0, f38_arg2 )
	local f38_local24 = {
		head = nil,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = false
	}
	local f38_local25 = nil
	if f38_local20 == true then
		f38_local24.head = f38_local8
		Lobby.Process.AddActions( f38_local8, f38_local5, f38_local3, f38_local3 )
		Lobby.Process.AddActions( f38_local5, f38_local7, f38_local9, f38_local3 )
		f38_local25 = f38_local7
		if f38_local21 == true and f38_local22 > 1 and f38_arg3 == LuaEnums.LEAVE_WITH_PARTY.WITH then
			Lobby.Process.AddActions( f38_local25, f38_local10, f38_local3, f38_local3 )
			f38_local25 = f38_local10
		end
		Lobby.Process.AddActions( f38_local25, f38_local6, f38_local3, f38_local3 )
		Lobby.Process.AddActions( f38_local6, f38_local15, f38_local3, f38_local3 )
		Lobby.Process.AddActions( f38_local15, f38_local16, f38_local3, f38_local3 )
		f38_local25 = f38_local16
	else
		f38_local24.head = f38_local8
		f38_local25 = f38_local8
		if f38_local21 == true and f38_local22 > 1 and f38_arg3 == LuaEnums.LEAVE_WITH_PARTY.WITH then
			Lobby.Process.AddActions( f38_local25, f38_local10, f38_local3, f38_local3 )
			f38_local25 = f38_local10
		end
		Lobby.Process.AddActions( f38_local25, f38_local15, f38_local3, f38_local3 )
		f38_local25 = f38_local15
	end
	if f38_local21 == true then
		if f38_local22 > 1 and f38_arg3 == LuaEnums.LEAVE_WITH_PARTY.WITHOUT then
			Lobby.Process.AddActions( f38_local25, f38_local13, f38_local3, f38_local3 )
			Lobby.Process.AddActions( f38_local13, f38_local14, f38_local3, f38_local3 )
			Lobby.Process.AddActions( f38_local14, f38_local17, f38_local3, f38_local3 )
			Lobby.Process.AddActions( f38_local17, f38_local18, f38_local3, f38_local3 )
			Lobby.Process.AddActions( f38_local18, f38_local19, f38_local3, f38_local3 )
			f38_local25 = f38_local19
		end
	else
		Lobby.Process.AddActions( f38_local25, f38_local13, f38_local3, f38_local3 )
		Lobby.Process.AddActions( f38_local13, f38_local17, f38_local3, f38_local3 )
		Lobby.Process.AddActions( f38_local17, f38_local18, f38_local3, f38_local3 )
		Lobby.Process.AddActions( f38_local18, f38_local19, f38_local3, f38_local3 )
		f38_local25 = f38_local19
	end
	Lobby.Process.AddActions( f38_local25, f38_local11, f38_local3, f38_local3 )
	Lobby.Process.AddActions( f38_local11, f38_local23, f38_local3, f38_local3 )
	Lobby.Process.AddActions( f38_local23, f38_local9, f38_local3, f38_local3 )
	return f38_local24
end

Lobby.ProcessNavigate.ReloadGameLobby = function ( f40_arg0 )
	local f40_local0 = LobbyData.GetCurrentMenuTarget()
	local f40_local1 = f40_local0.backTarget
	local f40_local2 = Lobby.ProcessNavigate.LeaveGameLobby( f40_arg0, f40_local0, f40_local0, LuaEnums.LEAVE_WITH_PARTY.WITH )
	local f40_local3 = Lobby.ProcessNavigate.CreatePublicGameLobby( f40_arg0, f40_local1, f40_local0 )
	local f40_local4 = f40_local2
	Lobby.Process.AppendProcess( f40_local4, f40_local3 )
	return f40_local4
end

Lobby.ProcessNavigate.ChangeToCPLANCustomGameLobby = function ( f41_arg0, f41_arg1, f41_arg2, f41_arg3 )
	local f41_local0 = {
		controller = f41_arg0,
		errorTarget = f41_arg2
	}
	local f41_local1 = Lobby.Interrupt.Back( Lobby.ProcessNavigate.GameLobbyInterrupt, f41_local0 )
	local f41_local2 = Lobby.Interrupt.FailedAction( Lobby.ProcessNavigate.GameLobbyInterrupt, f41_local0 )
	local f41_local3 = Lobby.Interrupt.ErrorMsg( Lobby.ProcessNavigate.GameLobbyInterrupt, f41_local0, Engine.Localize( "MENU_FAILED_TO_HOST_LOBBY" ) )
	Engine.LobbyLaunchClear()
	local f41_local4 = function ()
		Lobby.Timer.HostingLobby( {
			controller = f41_arg0,
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
			mainMode = f41_arg2.mainMode,
			lobbyTimerType = f41_arg2.lobbyTimerType
		} )
	end
	
	local f41_local5 = Lobby.Actions.LobbyVMCallRetVal( Lobby.Timer.HostingLobbyEnd, {
		controller = f41_arg0,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		mainMode = f41_arg2.mainMode
	}, true, false, false )
	local f41_local6 = Lobby.Actions.ExecuteScript( f41_local4 )
	local f41_local7 = Lobby.Actions.OpenSpinner()
	local f41_local8 = Lobby.Actions.CloseSpinner()
	local f41_local9 = Lobby.Actions.LobbySettings( f41_arg0, f41_arg2 )
	local f41_local10 = Lobby.Actions.UpdateUI( f41_arg0, f41_arg2 )
	local f41_local11 = Lobby.Actions.SwitchMode( f41_arg0, switchToMode )
	local f41_local12 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f41_local13 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f41_local14 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f41_local15 = {
		head = nil,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = false
	}
	local f41_local16 = nil
	if f41_local12 == true then
		f41_local15.head = f41_local5
		Lobby.Process.AddActions( f41_local5, f41_local7, Lobby.Process.DO_NOTHING_IF_FAILURE, f41_local3 )
		Lobby.Process.AddActions( f41_local7, f41_local6, f41_local3, f41_local3 )
		f41_local16 = f41_local6
	else
		f41_local15.head = f41_local7
		f41_local16 = f41_local7
	end
	Lobby.Process.AddActions( f41_local16, f41_local9, f41_local3, f41_local3 )
	Lobby.Process.AddActions( f41_local9, f41_local10, f41_local3, f41_local3 )
	Lobby.Process.AddActions( f41_local10, f41_local8, f41_local3, f41_local3 )
	return f41_local15
end

Lobby.ProcessNavigate.LeaveCPLANGameLobby = function ( f43_arg0, f43_arg1, f43_arg2, f43_arg3 )
	local f43_local0 = {
		controller = f43_arg0,
		errorTarget = f43_arg2
	}
	local f43_local1 = Lobby.Interrupt.Back( Lobby.ProcessNavigate.GameLobbyInterrupt, f43_local0 )
	local f43_local2 = Lobby.Interrupt.FailedAction( Lobby.ProcessNavigate.GameLobbyInterrupt, f43_local0 )
	local f43_local3 = Lobby.Interrupt.ErrorMsg( Lobby.ProcessNavigate.GameLobbyInterrupt, f43_local0, Engine.Localize( "MENU_FAILED_TO_HOST_LOBBY" ) )
	Engine.LobbyLaunchClear()
	local f43_local4 = function ()
		Engine.SetLobbyMode( f43_arg2.lobbyType, f43_arg2.lobbyMode )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
		Engine.SetGametype( Lobby.ProcessNavigate.SwitchLobbiesGetGametype( f43_arg0, f43_arg2 ) )
	end
	
	local f43_local5 = function ()
		Lobby.Timer.HostingLobby( {
			controller = f43_arg0,
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
			mainMode = f43_arg2.mainMode,
			lobbyTimerType = f43_arg2.lobbyTimerType
		} )
	end
	
	local f43_local6 = Lobby.Actions.LobbyVMCallRetVal( Lobby.Timer.HostingLobbyEnd, {
		controller = f43_arg0,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		mainMode = f43_arg2.mainMode
	}, true, false, false )
	local f43_local7 = Lobby.Actions.ExecuteScript( f43_local4 )
	local f43_local8 = Lobby.Actions.ExecuteScript( f43_local5 )
	local f43_local9 = Lobby.Actions.OpenSpinner()
	local f43_local10 = Lobby.Actions.CloseSpinner()
	local f43_local11 = Lobby.Actions.LeaveWithParty( 3000 )
	local f43_local12 = Lobby.Actions.LobbySettings( f43_arg0, f43_arg2 )
	local f43_local13 = Lobby.Actions.UpdateUI( f43_arg0, f43_arg2 )
	local f43_local14 = Lobby.Actions.SwitchMode( f43_arg0, switchToMode )
	local f43_local15 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f43_local16 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f43_local17 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f43_local18 = Lobby.Actions.SetSavedOrDefaultMap( f43_arg0, f43_arg2 )
	local f43_local19 = {
		head = nil,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = false
	}
	local f43_local20 = nil
	if f43_local15 == true then
		f43_local19.head = f43_local6
		Lobby.Process.AddActions( f43_local6, f43_local9, Lobby.Process.DO_NOTHING_IF_FAILURE, f43_local3 )
		f43_local20 = f43_local9
		if f43_local16 == true and f43_local17 > 1 and f43_arg3 == LuaEnums.LEAVE_WITH_PARTY.WITH then
			Lobby.Process.AddActions( f43_local20, f43_local11, f43_local3, f43_local3 )
			f43_local20 = f43_local11
		end
		Lobby.Process.AddActions( f43_local20, f43_local7, f43_local3, f43_local3 )
		Lobby.Process.AddActions( f43_local7, f43_local8, f43_local3, f43_local3 )
		f43_local20 = f43_local8
	else
		f43_local19.head = f43_local9
		f43_local20 = f43_local9
		if f43_local16 == true and f43_local17 > 1 and f43_arg3 == LuaEnums.LEAVE_WITH_PARTY.WITH then
			Lobby.Process.AddActions( f43_local20, f43_local11, f43_local3, f43_local3 )
			f43_local20 = f43_local11
		end
	end
	Lobby.Process.AddActions( f43_local20, f43_local12, f43_local3, f43_local3 )
	Lobby.Process.AddActions( f43_local12, f43_local18, f43_local3, f43_local3 )
	Lobby.Process.AddActions( f43_local18, f43_local13, f43_local3, f43_local3 )
	Lobby.Process.AddActions( f43_local13, f43_local10, f43_local3, f43_local3 )
	return f43_local19
end

