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
		cancellable = true
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
	local f2_local10 = Lobby.Actions.PlatformSessionCreate( f2_arg0, f2_local7.lobbyType, f2_arg2.maxClients )
	local f2_local11 = Lobby.Actions.UpdateUI( f2_arg0, f2_arg2 )
	local f2_local12 = {
		head = f2_local4,
		interrupt = f2_local1,
		force = false,
		cancellable = false
	}
	Lobby.Process.AddActions( f2_local4, f2_local6, f2_local3, f2_local3 )
	Lobby.Process.AddActions( f2_local6, f2_local7, f2_local3, f2_local3 )
	Lobby.Process.AddActions( f2_local7, f2_local8, f2_local3, f2_local3 )
	Lobby.Process.AddActions( f2_local8, f2_local9, f2_local3, f2_local3 )
	Lobby.Process.AddActions( f2_local9, f2_local10, f2_local3, f2_local3 )
	Lobby.Process.AddActions( f2_local10, f2_local11, f2_local3, f2_local3 )
	Lobby.Process.AddActions( f2_local11, f2_local5, f2_local3, f2_local3 )
	Lobby.Process.AddActions( f2_local5, nil, f2_local3, f2_local3 )
	return f2_local12
end

Lobby.ProcessNavigate.LeavePrivateLobby = function ( f3_arg0, f3_arg1, f3_arg2 )
	Engine.LobbyLaunchClear()
	local f3_local0 = Lobby.Actions.OpenSpinner()
	local f3_local1 = Lobby.Actions.CloseSpinner()
	local f3_local2 = Lobby.Actions.LobbySettings( f3_arg0, f3_arg2 )
	local f3_local3 = Lobby.Actions.UpdateUI( f3_arg0, f3_arg2 )
	local f3_local4 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f3_local5 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f3_local6 = Lobby.Actions.PlatformSessionLeave( f3_arg0, f3_arg1.lobbyType, Lobby.PlatformSession.GetSessionId() )
	local f3_local7 = {
		head = f3_local0,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = false
	}
	Lobby.Process.AddActions( f3_local0, f3_local4 )
	Lobby.Process.AddActions( f3_local4, f3_local5 )
	Lobby.Process.AddActions( f3_local5, f3_local6 )
	Lobby.Process.AddActions( f3_local6, f3_local2 )
	Lobby.Process.AddActions( f3_local2, f3_local3 )
	Lobby.Process.AddActions( f3_local3, f3_local1 )
	Lobby.Process.AddActions( f3_local1, nil )
	return f3_local7
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
		cancellable = true
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
		f7_local0 = "tdm"
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
	local f9_local0 = Engine.ProfileValueAsString( f9_arg0, "gametype" )
	if not Lobby.ProcessNavigate.SwitchLobbiesIsGametypeValid( f9_local0 ) then
		f9_local0 = Lobby.ProcessNavigate.SwitchLobbiesGetDefaultGametype( f9_arg0, f9_arg1 )
	end
	return f9_local0
end

Lobby.ProcessNavigate.GetDefaultMap = function ( f10_arg0, f10_arg1 )
	local f10_local0 = "cp_mi_eth_prologue"
	if f10_arg1 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		if Dvar.ui_execdemo_cp:get() == true then
			f10_local0 = "cp_mi_cairo_ramses2"
		else
			f10_local0 = "cp_mi_eth_prologue"
		end
	elseif f10_arg1 == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		f10_local0 = "mp_sector"
	elseif f10_arg1 == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		f10_local0 = "zm_factory"
	end
	return f10_local0
end

Lobby.ProcessNavigate.SwitchLobbiesIsMapValid = function ( f11_arg0 )
	if f11_arg0 == "" then
		return false
	elseif not Engine.IsMapValid( f11_arg0 ) then
		return false
	else
		return true
	end
end

Lobby.ProcessNavigate.SwitchLobbiesGetMap = function ( f12_arg0, f12_arg1 )
	local f12_local0 = Engine.ProfileValueAsString( f12_arg0, "map" )
	if not Lobby.ProcessNavigate.SwitchLobbiesIsMapValid( f12_local0 ) then
		f12_local0 = Lobby.ProcessNavigate.GetDefaultMap( f12_arg0, f12_arg1 )
	end
	return f12_local0
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
		if f13_arg2.lobbyMode == Enum.LobbyMode.LOBBY_MODE_THEATER then
			return 
		else
			Engine.SetGametype( Lobby.ProcessNavigate.SwitchLobbiesGetGametype( f13_arg0, f13_arg2 ) )
			Engine.GameLobbySetMap( Lobby.ProcessNavigate.SwitchLobbiesGetMap( f13_arg0, f13_arg2.mainMode ) )
		end
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
	local f13_local19 = Lobby.Actions.LobbyInfoProbe( f13_arg0, {
		xuid = Engine.GetXUID64( f13_arg0 )
	} )
	local f13_local20 = Lobby.Actions.LobbyJoinXUID( f13_arg0, {
		xuid = Engine.GetXUID64( f13_arg0 )
	}, Enum.JoinType.JOIN_TYPE_PARTY )
	local f13_local21 = {
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
	Lobby.Process.AddActions( f13_local13, f13_local19, f13_local3, f13_local3 )
	Lobby.Process.AddActions( f13_local19, f13_local20, f13_local3, f13_local3 )
	Lobby.Process.AddActions( f13_local20, f13_local18, f13_local3, f13_local3 )
	Lobby.Process.AddActions( f13_local18, f13_local11, f13_local3, f13_local3 )
	Lobby.Process.AddActions( f13_local11, f13_local8, f13_local3, f13_local3 )
	Lobby.Process.AddActions( f13_local8, nil, f13_local3, f13_local3 )
	return f13_local21
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
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, true )
	end
	
	local f17_local6 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_JOIN )
	end
	
	local f17_local7 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.SessionStatus.SESSION_STATUS_IDLE )
	end
	
	local f17_local8 = function ()
		Lobby.Matchmaking.SetupMatchmakingQuery( f17_arg0, Lobby.Matchmaking.SearchMode.PUBLIC )
	end
	
	f17_local8()
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
	local f17_local41 = Lobby.Actions.CanHostServer( f17_arg0, f17_arg2.lobbyType )
	local f17_local42 = Lobby.Actions.TimeDelay( 1500 )
	local f17_local43 = Lobby.Actions.ExecuteScript( f17_local8 )
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
	Lobby.Process.AddActions( f17_local27, f17_local33, f17_local39, f17_local3 )
	Lobby.Process.AddActions( f17_local33, nil, f17_local39, f17_local3 )
	Lobby.Process.ForceAction( f17_local39, f17_local28 )
	Lobby.Process.AddActions( f17_local28, f17_local34, f17_local40, f17_local3 )
	Lobby.Process.AddActions( f17_local34, nil, f17_local40, f17_local3 )
	Lobby.Process.ForceAction( f17_local40, f17_local29 )
	Lobby.Process.AddActions( f17_local29, f17_local35, f17_local41, f17_local3 )
	Lobby.Process.AddActions( f17_local35, nil, f17_local41, f17_local3 )
	Lobby.Process.AddActions( f17_local41, f17_local23, f17_local42, f17_local3 )
	Lobby.Process.AddActions( f17_local42, f17_local43, f17_local43, f17_local43 )
	Lobby.Process.AddActions( f17_local43, f17_local24, f17_local24, f17_local24 )
	Lobby.Process.AddActions( f17_local23, f17_local46, f17_local44, f17_local44 )
	Lobby.Process.AddActions( f17_local44, f17_local46, f17_local3, f17_local3 )
	Lobby.Process.AddActions( f17_local46, nil, f17_local3, f17_local3 )
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
	local f23_local12 = Lobby.Actions.LobbySettings( f23_arg0, f23_arg2 )
	local f23_local13 = Lobby.Actions.UpdateUI( f23_arg0, f23_arg2 )
	local f23_local14 = Lobby.Actions.RunPlaylistSettings( f23_arg0 )
	local f23_local15 = Lobby.Actions.IsButtonPressed( f23_arg0, "BUTTON_X" )
	local f23_local16 = Lobby.Actions.SearchForLobby( f23_arg0 )
	local f23_local17 = Lobby.Actions.SearchForLobby( f23_arg0 )
	local f23_local18 = Lobby.Actions.SearchForLobby( f23_arg0 )
	local f23_local19 = Lobby.Actions.QoSJoinSearchResults( f23_arg0, f23_local16 )
	local f23_local20 = Lobby.Actions.QoSJoinSearchResults( f23_arg0, f23_local17 )
	local f23_local21 = Lobby.Actions.QoSJoinSearchResults( f23_arg0, f23_local18 )
	local f23_local22 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	local f23_local23 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	local f23_local24 = Lobby.Actions.AdvertiseLobby( true )
	local f23_local25 = Lobby.Actions.ExecuteScript( f23_local4 )
	local f23_local26 = {
		head = f23_local7,
		interrupt = f23_local1,
		force = false,
		cancellable = false
	}
	Lobby.Process.AddActions( f23_local7, f23_local9, f23_local3, f23_local3 )
	Lobby.Process.AddActions( f23_local9, f23_local10, f23_local3, f23_local3 )
	Lobby.Process.AddActions( f23_local10, f23_local12, f23_local3, f23_local3 )
	Lobby.Process.AddActions( f23_local12, f23_local14, f23_local3, f23_local3 )
	Lobby.Process.AddActions( f23_local14, f23_local13, f23_local3, f23_local3 )
	Lobby.Process.AddActions( f23_local13, f23_local8, f23_local3, f23_local3 )
	Lobby.Process.AddActions( f23_local8, f23_local15, f23_local3, f23_local3 )
	Lobby.Process.AddActions( f23_local15, f23_local24, f23_local16, f23_local16 )
	Lobby.Process.AddActions( f23_local16, f23_local19, f23_local22, f23_local3 )
	Lobby.Process.AddActions( f23_local19, f23_local11, f23_local22, f23_local3 )
	Lobby.Process.ForceAction( f23_local22, f23_local17 )
	Lobby.Process.AddActions( f23_local17, f23_local20, f23_local23, f23_local3 )
	Lobby.Process.AddActions( f23_local20, f23_local11, f23_local23, f23_local3 )
	Lobby.Process.ForceAction( f23_local23, f23_local18 )
	Lobby.Process.AddActions( f23_local18, f23_local21, f23_local24, f23_local3 )
	Lobby.Process.AddActions( f23_local21, f23_local11, f23_local24, f23_local3 )
	Lobby.Process.AddActions( f23_local24, f23_local25, f23_local3, f23_local3 )
	Lobby.Process.AddActions( f23_local25, f23_local11, f23_local3, f23_local3 )
	Lobby.Process.AddActions( f23_local11, nil, f23_local3, f23_local3 )
	return f23_local26
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
	Engine.LobbyLaunchClear()
	Lobby.Debug.SessionSQJClear()
	local f31_local4 = function ()
		Lobby.Timer.HostingLobby( {
			controller = f31_arg0,
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
			mainMode = f31_arg2.mainMode,
			lobbyTimerType = f31_arg2.lobbyTimerType
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, true )
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
	local f31_local14 = Lobby.Actions.RunPlaylistSettings( f31_arg0 )
	local f31_local15 = Lobby.Actions.IsButtonPressed( f31_arg0, "BUTTON_X" )
	local f31_local16 = Lobby.Actions.SearchForLobby( f31_arg0 )
	local f31_local17 = Lobby.Actions.SearchForLobby( f31_arg0 )
	local f31_local18 = Lobby.Actions.SearchForLobby( f31_arg0 )
	local f31_local19 = Lobby.Actions.QoSJoinSearchResults( f31_arg0, f31_local16 )
	local f31_local20 = Lobby.Actions.QoSJoinSearchResults( f31_arg0, f31_local17 )
	local f31_local21 = Lobby.Actions.QoSJoinSearchResults( f31_arg0, f31_local18 )
	local f31_local22 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	local f31_local23 = Lobby.Actions.TimeDelay( Dvar.lobbySearchDelay:get() )
	local f31_local24 = Lobby.Actions.AdvertiseLobby( true )
	local f31_local25 = Lobby.Actions.ExecuteScript( f31_local4 )
	local f31_local26 = {
		head = f31_local7,
		interrupt = f31_local1,
		force = false,
		cancellable = false
	}
	Lobby.Process.AddActions( f31_local7, f31_local9, f31_local3, f31_local3 )
	Lobby.Process.AddActions( f31_local9, f31_local10, f31_local3, f31_local3 )
	Lobby.Process.AddActions( f31_local10, f31_local12, f31_local3, f31_local3 )
	Lobby.Process.AddActions( f31_local12, f31_local14, f31_local3, f31_local3 )
	Lobby.Process.AddActions( f31_local14, f31_local13, f31_local3, f31_local3 )
	Lobby.Process.AddActions( f31_local13, f31_local8, f31_local3, f31_local3 )
	Lobby.Process.AddActions( f31_local8, f31_local15, f31_local3, f31_local3 )
	Lobby.Process.AddActions( f31_local15, f31_local24, f31_local16, f31_local16 )
	Lobby.Process.AddActions( f31_local16, f31_local19, f31_local22, f31_local3 )
	Lobby.Process.AddActions( f31_local19, f31_local11, f31_local22, f31_local3 )
	Lobby.Process.ForceAction( f31_local22, f31_local17 )
	Lobby.Process.AddActions( f31_local17, f31_local20, f31_local23, f31_local3 )
	Lobby.Process.AddActions( f31_local20, f31_local11, f31_local23, f31_local3 )
	Lobby.Process.ForceAction( f31_local23, f31_local18 )
	Lobby.Process.AddActions( f31_local18, f31_local21, f31_local24, f31_local3 )
	Lobby.Process.AddActions( f31_local21, f31_local11, f31_local24, f31_local3 )
	Lobby.Process.AddActions( f31_local24, f31_local25, f31_local3, f31_local3 )
	Lobby.Process.AddActions( f31_local25, f31_local11, f31_local3, f31_local3 )
	Lobby.Process.AddActions( f31_local11, nil, f31_local3, f31_local3 )
	return f31_local26
end

Lobby.ProcessNavigate.ChangeToPrivateGameLobby = function ( f35_arg0, f35_arg1, f35_arg2, f35_arg3 )
	local f35_local0 = {
		controller = f35_arg0,
		errorTarget = f35_arg2
	}
	local f35_local1 = Lobby.Interrupt.Back( Lobby.ProcessNavigate.GameLobbyInterrupt, f35_local0 )
	local f35_local2 = Lobby.Interrupt.FailedAction( Lobby.ProcessNavigate.GameLobbyInterrupt, f35_local0 )
	local f35_local3 = Lobby.Interrupt.ErrorMsg( Lobby.ProcessNavigate.GameLobbyInterrupt, f35_local0, Engine.Localize( "MENU_FAILED_TO_HOST_LOBBY" ) )
	Engine.LobbyLaunchClear()
	local f35_local4 = function ()
		Engine.SetLobbyMode( f35_arg2.lobbyType, f35_arg2.lobbyMode )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local f35_local5 = function ()
		Lobby.Timer.HostingLobby( {
			controller = f35_arg0,
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
			mainMode = f35_arg2.mainMode,
			lobbyTimerType = f35_arg2.lobbyTimerType
		} )
	end
	
	local f35_local6 = Lobby.Actions.LobbyVMCallRetVal( Lobby.Timer.HostingLobbyEnd, {
		controller = f35_arg0,
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME,
		mainMode = f35_arg2.mainMode
	}, true, false, false )
	local f35_local7 = Lobby.Actions.AdvertiseLobby( false )
	local f35_local8 = Lobby.Actions.ExecuteScript( f35_local4 )
	local f35_local9 = Lobby.Actions.ExecuteScript( f35_local5 )
	local f35_local10 = Lobby.Actions.OpenSpinner()
	local f35_local11 = Lobby.Actions.CloseSpinner()
	local f35_local12 = Lobby.Actions.LeaveWithParty( 3000 )
	local f35_local13 = Lobby.Actions.LobbySettings( f35_arg0, f35_arg2 )
	local f35_local14 = Lobby.Actions.UpdateUI( f35_arg0, f35_arg2 )
	local f35_local15 = Lobby.Actions.SwitchMode( f35_arg0, switchToMode )
	local f35_local16 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f35_local17 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f35_local18 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f35_local19 = {
		head = nil,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = false
	}
	local f35_local20 = nil
	if f35_local16 == true then
		f35_local19.head = f35_local6
		Lobby.Process.AddActions( f35_local6, f35_local10, Lobby.Process.DO_NOTHING_IF_FAILURE, f35_local3 )
		f35_local20 = f35_local10
		if f35_local17 == true and f35_local18 > 1 and f35_arg3 == LuaEnums.LEAVE_WITH_PARTY.WITH then
			Lobby.Process.AddActions( f35_local20, f35_local12, f35_local3, f35_local3 )
			f35_local20 = f35_local12
		end
		Lobby.Process.AddActions( f35_local20, f35_local7, f35_local3, f35_local3 )
		Lobby.Process.AddActions( f35_local7, f35_local8, f35_local3, f35_local3 )
		Lobby.Process.AddActions( f35_local8, f35_local9, f35_local3, f35_local3 )
		f35_local20 = f35_local9
	else
		f35_local19.head = f35_local10
		f35_local20 = f35_local10
		if f35_local17 == true and f35_local18 > 1 and f35_arg3 == LuaEnums.LEAVE_WITH_PARTY.WITH then
			Lobby.Process.AddActions( f35_local20, f35_local12, f35_local3, f35_local3 )
			f35_local20 = f35_local12
		end
	end
	Lobby.Process.AddActions( f35_local20, f35_local13, f35_local3, f35_local3 )
	Lobby.Process.AddActions( f35_local13, f35_local14, f35_local3, f35_local3 )
	Lobby.Process.AddActions( f35_local14, f35_local11, f35_local3, f35_local3 )
	return f35_local19
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
	local f38_local7 = Lobby.Actions.OpenSpinner()
	local f38_local8 = Lobby.Actions.CloseSpinner()
	local f38_local9 = Lobby.Actions.LeaveWithParty( 3000 )
	local f38_local10 = Lobby.Actions.LobbySettings( f38_arg0, f38_arg2 )
	local f38_local11 = Lobby.Actions.SwitchMode( f38_arg0, f38_arg4 )
	local f38_local12 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f38_local13 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f38_local14 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f38_local15 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f38_local16 = Lobby.Actions.LobbyHostStart( f38_arg0, f38_arg2.mainMode, f38_arg2.lobbyType, f38_arg2.lobbyMode, f38_arg2.maxClients )
	local f38_local17 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f38_local18 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f38_local19 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f38_local20 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f38_local21 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f38_local22 = Lobby.Actions.UpdateUI( f38_arg0, f38_arg2 )
	local f38_local23 = {
		head = nil,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = false
	}
	local f38_local24 = nil
	if f38_local19 == true then
		f38_local23.head = f38_local5
		Lobby.Process.AddActions( f38_local5, f38_local7, Lobby.Process.DO_NOTHING_IF_FAILURE, f38_local3 )
		f38_local24 = f38_local7
		if f38_local20 == true and f38_local21 > 1 and f38_arg3 == LuaEnums.LEAVE_WITH_PARTY.WITH then
			Lobby.Process.AddActions( f38_local24, f38_local9, f38_local3, f38_local3 )
			f38_local24 = f38_local9
		end
		Lobby.Process.AddActions( f38_local24, f38_local6, f38_local3, f38_local3 )
		Lobby.Process.AddActions( f38_local6, f38_local14, f38_local3, f38_local3 )
		Lobby.Process.AddActions( f38_local14, f38_local15, f38_local3, f38_local3 )
		f38_local24 = f38_local15
	else
		f38_local23.head = f38_local7
		f38_local24 = f38_local7
		if f38_local20 == true and f38_local21 > 1 and f38_arg3 == LuaEnums.LEAVE_WITH_PARTY.WITH then
			Lobby.Process.AddActions( f38_local24, f38_local9, f38_local3, f38_local3 )
			f38_local24 = f38_local9
		end
		Lobby.Process.AddActions( f38_local24, f38_local14, f38_local3, f38_local3 )
		f38_local24 = f38_local14
	end
	if f38_local20 == true then
		if f38_local21 > 1 and f38_arg3 == LuaEnums.LEAVE_WITH_PARTY.WITHOUT then
			Lobby.Process.AddActions( f38_local24, f38_local12, f38_local3, f38_local3 )
			Lobby.Process.AddActions( f38_local12, f38_local13, f38_local3, f38_local3 )
			Lobby.Process.AddActions( f38_local13, f38_local16, f38_local3, f38_local3 )
			Lobby.Process.AddActions( f38_local16, f38_local17, f38_local3, f38_local3 )
			Lobby.Process.AddActions( f38_local17, f38_local18, f38_local3, f38_local3 )
			f38_local24 = f38_local18
		end
	else
		Lobby.Process.AddActions( f38_local24, f38_local12, f38_local3, f38_local3 )
		Lobby.Process.AddActions( f38_local12, f38_local16, f38_local3, f38_local3 )
		Lobby.Process.AddActions( f38_local16, f38_local17, f38_local3, f38_local3 )
		Lobby.Process.AddActions( f38_local17, f38_local18, f38_local3, f38_local3 )
		f38_local24 = f38_local18
	end
	Lobby.Process.AddActions( f38_local24, f38_local10, f38_local3, f38_local3 )
	Lobby.Process.AddActions( f38_local10, f38_local22, f38_local3, f38_local3 )
	Lobby.Process.AddActions( f38_local22, f38_local8, f38_local3, f38_local3 )
	return f38_local23
end

