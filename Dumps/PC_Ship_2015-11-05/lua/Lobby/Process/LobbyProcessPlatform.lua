require( "lua.Lobby.Process.LobbyActions" )
require( "lua.Lobby.Matchmaking.LobbyMatchmaking" )

Lobby.ProcessPlatform = {}
Lobby.ProcessPlatform.PS4AcceptInvite = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	local f1_local0 = function ()
		Engine.ActivatePrimaryLocalClient( f1_arg0 )
	end
	
	local f1_local1 = function ()
		Engine.DeactivateAllLocalClients()
	end
	
	local f1_local2 = function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local f1_local3 = function ()
		Engine.PlatformSessionClearInviteJoinInfo()
	end
	
	local f1_local4 = Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN
	local f1_local5 = 18
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		f1_local5 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	end
	local f1_local6 = Lobby.Process.ReloadPrivateLobby( f1_arg0, Engine.GetLobbyNetworkMode() )
	local f1_local7 = Lobby.Actions.LobbySettings( f1_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f1_local8 = Lobby.Actions.UpdateUI( f1_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f1_local9 = Lobby.Process.ReloadPrivateLobby( f1_arg0, Engine.GetLobbyNetworkMode() )
	local f1_local10 = Lobby.Actions.LobbySettings( f1_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f1_local11 = Lobby.Actions.UpdateUI( f1_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f1_local12 = Lobby.Actions.OpenSpinner( nil, true )
	local f1_local13 = Lobby.Actions.CloseSpinner()
	local f1_local14 = Lobby.Actions.CloseSpinner()
	f1_local14.name = f1_local14.name .. "Error"
	local f1_local15 = Lobby.Actions.CloseSpinner()
	f1_local15.name = f1_local15.name .. "CannotPlayOnline"
	local f1_local16 = Lobby.Actions.CloseSpinner()
	f1_local16.name = f1_local16.name .. "InviteBlocked"
	local f1_local17 = Lobby.Actions.CloseSpinner()
	f1_local17.name = f1_local17.name .. "NeedsFirstTimeFlow"
	local f1_local18 = Lobby.Actions.CloseSpinner()
	f1_local18.name = f1_local18.name .. "RecoverError"
	local f1_local19 = Lobby.Actions.EmptyAction()
	local f1_local20 = Lobby.Actions.ExecuteScript( f1_local3 )
	local f1_local21 = Lobby.Actions.ExecuteScript( f1_local3 )
	local f1_local22 = Lobby.Actions.ExecuteScript( f1_local3 )
	local f1_local23 = Lobby.Actions.ExecuteScript( f1_local3 )
	local f1_local24 = Lobby.Actions.ExecuteScript( f1_local3 )
	local f1_local25 = Lobby.Actions.CanPlayOnline( f1_arg0 )
	local f1_local26 = Lobby.Actions.ConnectingToDemonware( f1_arg0, LuaUtils.CONNECTINGDW_MAX_WAIT_TIME, true )
	local f1_local27 = Lobby.Actions.CanAcceptPlatformInvite( f1_arg0 )
	local f1_local28 = Lobby.Actions.ErrorPopupMsg( Engine.Localize( "MENU_UPDATE_NEEDED" ) )
	local f1_local29 = Lobby.Actions.ExecuteScript( f1_local0 )
	local f1_local30 = Lobby.Actions.ExecuteScript( f1_local1 )
	local f1_local31 = Lobby.Actions.ExecuteScript( f1_local2 )
	local f1_local32 = Lobby.Actions.ForceLobbyUIScreen( f1_arg0, LobbyData.UITargets.UI_MODESELECT.id )
	local f1_local33 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f1_local34 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f1_local35 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f1_local36 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f1_local37 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f1_local38 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f1_local39 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f1_local40 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f1_local41 = Lobby.Actions.PlatformSessionGetInviteInfo( f1_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f1_arg1 )
	local f1_local42 = Lobby.Actions.GamertagsToXuids( f1_arg0, f1_local41 )
	local f1_local43 = Lobby.Actions.LobbyInfoProbe( f1_arg0, f1_local42 )
	local f1_local44 = Lobby.Actions.CheckFirstTimeFlowRequirements( f1_arg0, f1_local43 )
	local f1_local45 = Lobby.Actions.ShowFirstTimeFlowError( f1_local44 )
	local f1_local46 = Lobby.Actions.LobbyJoinXUID( f1_arg0, f1_local42, f1_arg2 )
	local f1_local47 = Lobby.Actions.ErrorPopup( f1_local46 )
	local f1_local48 = Lobby.Actions.LobbyHostStart( f1_arg0, Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyMode.LOBBY_MODE_INVALID, f1_local5 )
	local f1_local49 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f1_local50 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f1_local51 = {
		head = f1_local12,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.ForceAction( f1_local12, f1_local29 )
	Lobby.Process.AddActions( f1_local29, f1_local25, f1_local14, f1_local14 )
	Lobby.Process.AddActions( f1_local25, f1_local31, f1_local15, f1_local15 )
	Lobby.Process.AddActions( f1_local31, f1_local26, f1_local14, f1_local14 )
	Lobby.Process.AddActions( f1_local26, f1_local27, f1_local14, f1_local14 )
	Lobby.Process.AddActions( f1_local27, f1_local19, f1_local16, f1_local16 )
	local f1_local52 = f1_local19
	if f1_local4 then
		Lobby.Process.ForceAction( f1_local52, f1_local32 )
		Lobby.Process.ForceAction( f1_local32, f1_local33 )
		Lobby.Process.ForceAction( f1_local33, f1_local34 )
		Lobby.Process.ForceAction( f1_local34, f1_local35 )
		Lobby.Process.ForceAction( f1_local35, f1_local36 )
		f1_local52 = f1_local36
	end
	Lobby.Process.AddActions( f1_local52, f1_local37, f1_local18, f1_local18 )
	Lobby.Process.AddActions( f1_local37, f1_local38, f1_local18, f1_local18 )
	f1_local52 = f1_local38
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		Lobby.Process.AddActions( f1_local52, f1_local39, f1_local18, f1_local18 )
		f1_local52 = f1_local39
		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
			Lobby.Process.AddActions( f1_local52, f1_local40, f1_local18, f1_local18 )
			f1_local52 = f1_local40
		end
	end
	Lobby.Process.AddActions( f1_local52, f1_local48, f1_local18, f1_local18 )
	Lobby.Process.AddActions( f1_local48, f1_local49, f1_local18, f1_local18 )
	Lobby.Process.AddActions( f1_local49, f1_local50, f1_local18, f1_local18 )
	Lobby.Process.AddActions( f1_local50, f1_local41, f1_local18, f1_local18 )
	Lobby.Process.AddActions( f1_local41, f1_local42, f1_local18, f1_local18 )
	Lobby.Process.AddActions( f1_local42, f1_local43, f1_local18, f1_local18 )
	Lobby.Process.AddActions( f1_local43, f1_local44, f1_local18, f1_local18 )
	Lobby.Process.AddActions( f1_local44, f1_local46, f1_local17, f1_local17 )
	Lobby.Process.AddActions( f1_local46, f1_local20, f1_local18, f1_local18 )
	Lobby.Process.AddActions( f1_local20, f1_local13, f1_local18, f1_local18 )
	Lobby.Process.ForceAction( f1_local14, f1_local21 )
	Lobby.Process.ForceAction( f1_local21, f1_local47 )
	Lobby.Process.ForceAction( f1_local16, f1_local22 )
	Lobby.Process.ForceAction( f1_local22, f1_local28 )
	Lobby.Process.ForceAction( f1_local17, f1_local23 )
	Lobby.Process.ForceAction( f1_local23, f1_local9.head )
	Lobby.Process.ForceAction( f1_local9.tail, f1_local10 )
	Lobby.Process.ForceAction( f1_local10, f1_local11 )
	Lobby.Process.ForceAction( f1_local11, f1_local45 )
	Lobby.Process.ForceAction( f1_local18, f1_local24 )
	Lobby.Process.ForceAction( f1_local24, f1_local6.head )
	Lobby.Process.ForceAction( f1_local6.tail, f1_local7 )
	Lobby.Process.ForceAction( f1_local7, f1_local8 )
	Lobby.Process.ForceAction( f1_local8, f1_local47 )
	return f1_local51
end

Lobby.ProcessPlatform.PS4SessionJoin = function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
	local f6_local0 = function ()
		Engine.ActivatePrimaryLocalClient( f6_arg0 )
	end
	
	local f6_local1 = function ()
		Engine.DeactivateAllLocalClients()
	end
	
	local f6_local2 = function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local f6_local3 = function ()
		Engine.PlatformSessionClearInviteJoinInfo()
	end
	
	local f6_local4 = Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN
	local f6_local5 = 18
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		f6_local5 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	end
	local f6_local6 = Lobby.Process.ReloadPrivateLobby( f6_arg0, Engine.GetLobbyNetworkMode() )
	local f6_local7 = Lobby.Actions.LobbySettings( f6_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f6_local8 = Lobby.Actions.UpdateUI( f6_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f6_local9 = Lobby.Process.ReloadPrivateLobby( f6_arg0, Engine.GetLobbyNetworkMode() )
	local f6_local10 = Lobby.Actions.LobbySettings( f6_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f6_local11 = Lobby.Actions.UpdateUI( f6_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f6_local12 = Lobby.Actions.OpenSpinner( nil, true )
	local f6_local13 = Lobby.Actions.CloseSpinner()
	local f6_local14 = Lobby.Actions.CloseSpinner()
	local f6_local15 = Lobby.Actions.CloseSpinner()
	f6_local15.name = f6_local15.name .. "NeedsFirstTimeFlow"
	local f6_local16 = Lobby.Actions.CloseSpinner()
	f6_local16.name = f6_local16.name .. "CannotPlayOnline"
	local f6_local17 = Lobby.Actions.CloseSpinner()
	f6_local17.name = f6_local17.name .. "RecoverError"
	local f6_local18 = Lobby.Actions.CanPlayOnline( f6_arg0 )
	local f6_local19 = Lobby.Actions.ExecuteScript( f6_local0 )
	local f6_local20 = Lobby.Actions.ExecuteScript( f6_local1 )
	local f6_local21 = Lobby.Actions.ExecuteScript( f6_local3 )
	local f6_local22 = Lobby.Actions.ExecuteScript( f6_local3 )
	local f6_local23 = Lobby.Actions.ExecuteScript( f6_local3 )
	local f6_local24 = Lobby.Actions.ExecuteScript( f6_local3 )
	local f6_local25 = Lobby.Actions.ExecuteScript( f6_local2 )
	local f6_local26 = Lobby.Actions.ConnectingToDemonware( f6_arg0, LuaUtils.CONNECTINGDW_MAX_WAIT_TIME, true )
	local f6_local27 = Lobby.Actions.ForceLobbyUIScreen( f6_arg0, LobbyData.UITargets.UI_MODESELECT.id )
	local f6_local28 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f6_local29 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f6_local30 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f6_local31 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f6_local32 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f6_local33 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f6_local34 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f6_local35 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f6_local36 = Lobby.Actions.PlatformSessionGetSessionInfo( f6_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f6_arg1 )
	local f6_local37 = Lobby.Actions.GamertagsToXuids( f6_arg0, f6_local36 )
	local f6_local38 = Lobby.Actions.LobbyInfoProbe( f6_arg0, f6_local37 )
	local f6_local39 = Lobby.Actions.CheckFirstTimeFlowRequirements( f6_arg0, f6_local38 )
	local f6_local40 = Lobby.Actions.ShowFirstTimeFlowError( f6_local39 )
	local f6_local41 = Lobby.Actions.LobbyJoinXUID( f6_arg0, f6_local37, f6_arg2 )
	local f6_local42 = Lobby.Actions.ErrorPopup( f6_local41 )
	local f6_local43 = Lobby.Actions.ErrorPopup( f6_local41 )
	local f6_local44 = Lobby.Actions.LobbyHostStart( f6_arg0, Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyMode.LOBBY_MODE_INVALID, f6_local5 )
	local f6_local45 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f6_local46 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f6_local47 = {
		head = f6_local12,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.ForceAction( f6_local12, f6_local19 )
	Lobby.Process.AddActions( f6_local19, f6_local18, f6_local14, f6_local14 )
	Lobby.Process.AddActions( f6_local18, f6_local25, f6_local16, f6_local16 )
	Lobby.Process.AddActions( f6_local25, f6_local26, f6_local14, f6_local14 )
	local f6_local48 = f6_local26
	if f6_local4 then
		Lobby.Process.ForceAction( f6_local48, f6_local27 )
		Lobby.Process.ForceAction( f6_local27, f6_local28 )
		Lobby.Process.ForceAction( f6_local28, f6_local29 )
		Lobby.Process.ForceAction( f6_local29, f6_local30 )
		Lobby.Process.ForceAction( f6_local30, f6_local31 )
		f6_local48 = f6_local31
	end
	Lobby.Process.AddActions( f6_local48, f6_local32, f6_local17, f6_local17 )
	Lobby.Process.AddActions( f6_local32, f6_local33 )
	f6_local48 = f6_local33
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		Lobby.Process.AddActions( f6_local48, f6_local34, f6_local17, f6_local17 )
		f6_local48 = f6_local34
		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
			Lobby.Process.AddActions( f6_local48, f6_local35, f6_local17, f6_local17 )
			f6_local48 = f6_local35
		end
	end
	Lobby.Process.AddActions( f6_local48, f6_local44, f6_local17, f6_local17 )
	Lobby.Process.AddActions( f6_local44, f6_local45, f6_local17, f6_local17 )
	Lobby.Process.AddActions( f6_local45, f6_local46, f6_local17, f6_local17 )
	Lobby.Process.AddActions( f6_local46, f6_local36, f6_local17, f6_local17 )
	Lobby.Process.AddActions( f6_local36, f6_local37, f6_local17, f6_local17 )
	Lobby.Process.AddActions( f6_local37, f6_local38, f6_local17, f6_local17 )
	Lobby.Process.AddActions( f6_local38, f6_local39, f6_local17, f6_local17 )
	Lobby.Process.AddActions( f6_local39, f6_local41, f6_local15, f6_local15 )
	Lobby.Process.AddActions( f6_local41, f6_local21, f6_local17, f6_local17 )
	Lobby.Process.AddActions( f6_local21, f6_local13, f6_local17, f6_local17 )
	Lobby.Process.ForceAction( f6_local14, f6_local22 )
	Lobby.Process.ForceAction( f6_local22, f6_local42 )
	Lobby.Process.ForceAction( f6_local42, f6_local20 )
	Lobby.Process.ForceAction( f6_local15, f6_local23 )
	Lobby.Process.ForceAction( f6_local23, f6_local9.head )
	Lobby.Process.ForceAction( f6_local9.tail, f6_local10 )
	Lobby.Process.ForceAction( f6_local10, f6_local11 )
	Lobby.Process.ForceAction( f6_local11, f6_local40 )
	Lobby.Process.ForceAction( f6_local17, f6_local24 )
	Lobby.Process.ForceAction( f6_local24, f6_local6.head )
	Lobby.Process.ForceAction( f6_local6.tail, f6_local7 )
	Lobby.Process.ForceAction( f6_local7, f6_local8 )
	Lobby.Process.ForceAction( f6_local8, f6_local43 )
	return f6_local47
end

Lobby.ProcessPlatform.XboxJoin = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
	local f11_local0 = Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN
	local f11_local1 = function ()
		Engine.ActivatePrimaryLocalClient( f11_arg0 )
	end
	
	local f11_local2 = function ()
		Engine.DeactivateAllLocalClients()
	end
	
	local f11_local3 = function ()
		Engine.PlatformSessionClearInviteJoinInfo()
	end
	
	local f11_local4 = function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local f11_local5 = function ()
		return Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	
	local f11_local6 = 18
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		f11_local6 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	end
	local f11_local7 = Lobby.Process.ReloadPrivateLobby( f11_arg0, Engine.GetLobbyNetworkMode() )
	local f11_local8 = Lobby.Actions.LobbySettings( f11_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f11_local9 = Lobby.Actions.UpdateUI( f11_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f11_local10 = Lobby.Process.ReloadPrivateLobby( f11_arg0, Engine.GetLobbyNetworkMode() )
	local f11_local11 = Lobby.Actions.LobbySettings( f11_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f11_local12 = Lobby.Actions.UpdateUI( f11_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f11_local13 = Lobby.Actions.OpenSpinner( nil, true )
	local f11_local14 = Lobby.Actions.CloseSpinner()
	local f11_local15 = Lobby.Actions.CloseSpinner()
	f11_local15.name = f11_local15.name .. "NeedsFirstTimeFlow"
	local f11_local16 = Lobby.Actions.CloseSpinner()
	f11_local16.name = f11_local16.name .. "RecoverError"
	local f11_local17 = Lobby.Actions.ExecuteScript( f11_local4 )
	local f11_local18 = Lobby.Actions.ConnectingToDemonware( f11_arg0, LuaUtils.CONNECTINGDW_MAX_WAIT_TIME, true )
	local f11_local19 = Lobby.Actions.ExecuteScript( f11_local1 )
	local f11_local20 = Lobby.Actions.ExecuteScript( f11_local2 )
	local f11_local21 = Lobby.Actions.ForceLobbyUIScreen( f11_arg0, LobbyData.UITargets.UI_MODESELECT.id )
	local f11_local22 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f11_local23 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f11_local24 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f11_local25 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f11_local26 = Lobby.Actions.LeaveWithParty( 3000 )
	local f11_local27 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f11_local28 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f11_local29 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f11_local30 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f11_local31 = Lobby.Actions.LobbyInfoProbe( f11_arg0, {
		xuid = f11_arg1
	} )
	local f11_local32 = Lobby.Actions.LobbyJoinXUIDExt( f11_arg0, f11_arg2, f11_local31, Enum.LobbyType.LOBBY_TYPE_COUNT )
	local f11_local33 = Lobby.Actions.CheckFirstTimeFlowRequirements( f11_arg0, f11_local31 )
	local f11_local34 = Lobby.Actions.ShowFirstTimeFlowError( f11_local33 )
	local f11_local35 = Lobby.Actions.ExecuteScriptWithReturn( f11_local5, true, false, false )
	local f11_local36 = Lobby.Actions.LobbyInfoProbe( f11_arg0, {
		xuid = f11_arg1
	} )
	local f11_local37 = Lobby.Actions.LobbyJoinXUIDExt( f11_arg0, f11_arg2, f11_local36, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f11_local38 = Lobby.Actions.LobbyHostStart( f11_arg0, Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyMode.LOBBY_MODE_INVALID, f11_local6 )
	local f11_local39 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f11_local40 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f11_local41 = Lobby.Actions.ExecuteScript( f11_local3 )
	local f11_local42 = Lobby.Actions.ExecuteScript( f11_local3 )
	local f11_local43 = Lobby.Actions.ExecuteScript( f11_local3 )
	local f11_local44 = Lobby.Actions.ExecuteScript( f11_local3 )
	local f11_local45 = Lobby.Actions.CloseSpinner()
	local f11_local46 = Lobby.Actions.ErrorPopup( f11_local32 )
	local f11_local47 = f11_arg3 == LuaEnums.LEAVE_WITH_PARTY.WITH
	local f11_local48 = Engine.IsInGame()
	local f11_local49 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f11_local50 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f11_local51 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f11_local52 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f11_local53 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f11_local54 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f11_local55 = false
	local f11_local56 = false
	local f11_local57 = false
	local f11_local58 = false
	if f11_local48 == true then
		f11_local55 = true
		f11_local56 = true
		f11_local57 = true
		if f11_local51 == true then
			f11_local58 = true
		end
	elseif f11_local50 == true then
		f11_local55 = true
		f11_local56 = true
		if f11_local47 == false then
			f11_local57 = true
			if f11_local51 == true then
				f11_local58 = true
			end
		end
	elseif f11_local49 == true then
		if f11_local47 == false then
			f11_local57 = true
			if f11_local51 == true then
				f11_local58 = true
			end
		end
	else
		f11_local55 = true
		f11_local56 = true
		f11_local57 = true
		f11_local58 = true
	end
	local f11_local59 = {
		head = f11_local13,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.ForceAction( f11_local13, f11_local19 )
	local f11_local60 = f11_local19
	if f11_local0 then
		Lobby.Process.ForceAction( f11_local60, f11_local21 )
		Lobby.Process.ForceAction( f11_local21, f11_local22 )
		Lobby.Process.ForceAction( f11_local22, f11_local23 )
		Lobby.Process.ForceAction( f11_local23, f11_local24 )
		Lobby.Process.ForceAction( f11_local24, f11_local25 )
		f11_local60 = f11_local25
	end
	Lobby.Process.ForceAction( f11_local60, f11_local17 )
	Lobby.Process.ForceAction( f11_local17, f11_local18 )
	f11_local60 = f11_local18
	if f11_local50 == true and f11_local47 == true then
		Lobby.Process.AddActions( f11_local60, f11_local26, f11_local16, f11_local16 )
		f11_local60 = f11_local26
	end
	if f11_local55 == true then
		Lobby.Process.AddActions( f11_local60, f11_local29, f11_local16, f11_local16 )
		f11_local60 = f11_local29
	end
	if f11_local56 == true then
		Lobby.Process.AddActions( f11_local60, f11_local30, f11_local16, f11_local16 )
		f11_local60 = f11_local30
	end
	if f11_local57 == true then
		Lobby.Process.AddActions( f11_local60, f11_local27, f11_local16, f11_local16 )
		f11_local60 = f11_local27
	end
	if f11_local58 == true then
		Lobby.Process.AddActions( f11_local60, f11_local28, f11_local16, f11_local16 )
		f11_local60 = f11_local28
	end
	if f11_local51 == false or f11_local58 == true then
		Lobby.Process.AddActions( f11_local60, f11_local38, f11_local16, f11_local16 )
		Lobby.Process.AddActions( f11_local38, f11_local39, f11_local16, f11_local16 )
		f11_local60 = f11_local39
	end
	if f11_local57 == true then
		Lobby.Process.AddActions( f11_local60, f11_local40, f11_local16, f11_local16 )
		f11_local60 = f11_local40
	end
	Lobby.Process.AddActions( f11_local60, f11_local31, f11_local16, f11_local16 )
	Lobby.Process.AddActions( f11_local31, f11_local33, f11_local16, f11_local16 )
	Lobby.Process.AddActions( f11_local33, f11_local32, f11_local15, f11_local15 )
	Lobby.Process.AddActions( f11_local32, f11_local35, f11_local16, f11_local16 )
	Lobby.Process.AddActions( f11_local35, f11_local36, f11_local41, f11_local41 )
	Lobby.Process.AddActions( f11_local36, f11_local37, f11_local41, f11_local41 )
	Lobby.Process.ForceAction( f11_local37, f11_local41 )
	Lobby.Process.ForceAction( f11_local41, f11_local14 )
	Lobby.Process.ForceAction( f11_local15, f11_local43 )
	Lobby.Process.ForceAction( f11_local43, f11_local10.head )
	Lobby.Process.ForceAction( f11_local10.tail, f11_local11 )
	Lobby.Process.ForceAction( f11_local11, f11_local12 )
	Lobby.Process.ForceAction( f11_local12, f11_local34 )
	Lobby.Process.ForceAction( f11_local16, f11_local44 )
	Lobby.Process.ForceAction( f11_local44, f11_local7.head )
	Lobby.Process.ForceAction( f11_local7.tail, f11_local8 )
	Lobby.Process.ForceAction( f11_local8, f11_local9 )
	Lobby.Process.ForceAction( f11_local9, f11_local46 )
	Lobby.Process.ForceAction( f11_local46, f11_local20 )
	return f11_local59
end

Lobby.ProcessPlatform.PCJoin = function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3 )
	local f17_local0 = function ()
		Engine.ActivatePrimaryLocalClient( f17_arg0 )
	end
	
	local f17_local1 = function ()
		Engine.DeactivateAllLocalClients()
	end
	
	local f17_local2 = function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local f17_local3 = function ()
		Engine.PlatformSessionClearInviteJoinInfo()
	end
	
	local f17_local4 = Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN
	local f17_local5 = 18
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		f17_local5 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	end
	local f17_local6 = Lobby.Process.ReloadPrivateLobby( f17_arg0, Engine.GetLobbyNetworkMode() )
	local f17_local7 = Lobby.Actions.LobbySettings( f17_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f17_local8 = Lobby.Actions.UpdateUI( f17_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f17_local9 = Lobby.Process.ReloadPrivateLobby( f17_arg0, Engine.GetLobbyNetworkMode() )
	local f17_local10 = Lobby.Actions.LobbySettings( f17_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f17_local11 = Lobby.Actions.UpdateUI( f17_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f17_local12 = Lobby.Actions.OpenSpinner( nil, true )
	local f17_local13 = Lobby.Actions.CloseSpinner()
	local f17_local14 = Lobby.Actions.CloseSpinner()
	local f17_local15 = Lobby.Actions.CloseSpinner()
	f17_local15.name = f17_local15.name .. "NeedsFirstTimeFlow"
	local f17_local16 = Lobby.Actions.CloseSpinner()
	f17_local16.name = f17_local16.name .. "CannotPlayOnline"
	local f17_local17 = Lobby.Actions.CloseSpinner()
	f17_local17.name = f17_local17.name .. "RecoverError"
	local f17_local18 = Lobby.Actions.CanPlayOnline( f17_arg0 )
	local f17_local19 = Lobby.Actions.ExecuteScript( f17_local0 )
	local f17_local20 = Lobby.Actions.ExecuteScript( f17_local1 )
	local f17_local21 = Lobby.Actions.ExecuteScript( f17_local3 )
	local f17_local22 = Lobby.Actions.ExecuteScript( f17_local3 )
	local f17_local23 = Lobby.Actions.ExecuteScript( f17_local3 )
	local f17_local24 = Lobby.Actions.ExecuteScript( f17_local3 )
	local f17_local25 = Lobby.Actions.ExecuteScript( f17_local2 )
	local f17_local26 = Lobby.Actions.ConnectingToDemonware( f17_arg0, LuaUtils.CONNECTINGDW_MAX_WAIT_TIME, true )
	local f17_local27 = Lobby.Actions.ForceLobbyUIScreen( f17_arg0, LobbyData.UITargets.UI_MODESELECT.id )
	local f17_local28 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f17_local29 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f17_local30 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f17_local31 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f17_local32 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f17_local33 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f17_local34 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f17_local35 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f17_local36 = Lobby.Actions.PlatformSessionGetSessionInfo( f17_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, sessionId )
	local f17_local37 = Lobby.Actions.GamertagsToXuids( f17_arg0, f17_local36 )
	local f17_local38 = Lobby.Actions.LobbyInfoProbe( f17_arg0, {
		xuid = f17_arg1
	} )
	local f17_local39 = Lobby.Actions.CheckFirstTimeFlowRequirements( f17_arg0, f17_local38 )
	local f17_local40 = Lobby.Actions.ShowFirstTimeFlowError( f17_local39 )
	local f17_local41 = Lobby.Actions.LobbyJoinXUIDExt( f17_arg0, f17_arg2, f17_local38, Enum.LobbyType.LOBBY_TYPE_COUNT )
	local f17_local42 = Lobby.Actions.ErrorPopup( f17_local41 )
	local f17_local43 = Lobby.Actions.ErrorPopup( f17_local41 )
	local f17_local44 = Lobby.Actions.LobbyHostStart( f17_arg0, Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyMode.LOBBY_MODE_INVALID, f17_local5 )
	local f17_local45 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f17_local46 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f17_local47 = {
		head = f17_local12,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.ForceAction( f17_local12, f17_local19 )
	Lobby.Process.AddActions( f17_local19, f17_local18, f17_local14, f17_local14 )
	Lobby.Process.AddActions( f17_local18, f17_local25, f17_local16, f17_local16 )
	Lobby.Process.AddActions( f17_local25, f17_local26, f17_local14, f17_local14 )
	local f17_local48 = f17_local26
	if f17_local4 then
		Lobby.Process.ForceAction( f17_local48, f17_local27 )
		Lobby.Process.ForceAction( f17_local27, f17_local28 )
		Lobby.Process.ForceAction( f17_local28, f17_local29 )
		Lobby.Process.ForceAction( f17_local29, f17_local30 )
		Lobby.Process.ForceAction( f17_local30, f17_local31 )
		f17_local48 = f17_local31
	end
	Lobby.Process.AddActions( f17_local48, f17_local32, f17_local17, f17_local17 )
	Lobby.Process.AddActions( f17_local32, f17_local33 )
	f17_local48 = f17_local33
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		Lobby.Process.AddActions( f17_local48, f17_local34, f17_local17, f17_local17 )
		f17_local48 = f17_local34
		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
			Lobby.Process.AddActions( f17_local48, f17_local35, f17_local17, f17_local17 )
			f17_local48 = f17_local35
		end
	end
	Lobby.Process.AddActions( f17_local48, f17_local44, f17_local17, f17_local17 )
	Lobby.Process.AddActions( f17_local44, f17_local45, f17_local17, f17_local17 )
	Lobby.Process.AddActions( f17_local45, f17_local46, f17_local17, f17_local17 )
	Lobby.Process.AddActions( f17_local46, f17_local36, f17_local17, f17_local17 )
	Lobby.Process.AddActions( f17_local36, f17_local38, f17_local17, f17_local17 )
	Lobby.Process.AddActions( f17_local38, f17_local39, f17_local17, f17_local17 )
	Lobby.Process.AddActions( f17_local39, f17_local41, f17_local15, f17_local15 )
	Lobby.Process.AddActions( f17_local41, f17_local21, f17_local17, f17_local17 )
	Lobby.Process.AddActions( f17_local21, f17_local13, f17_local17, f17_local17 )
	Lobby.Process.ForceAction( f17_local14, f17_local22 )
	Lobby.Process.ForceAction( f17_local22, f17_local42 )
	Lobby.Process.ForceAction( f17_local42, f17_local20 )
	Lobby.Process.ForceAction( f17_local15, f17_local23 )
	Lobby.Process.ForceAction( f17_local23, f17_local9.head )
	Lobby.Process.ForceAction( f17_local9.tail, f17_local10 )
	Lobby.Process.ForceAction( f17_local10, f17_local11 )
	Lobby.Process.ForceAction( f17_local11, f17_local40 )
	Lobby.Process.ForceAction( f17_local17, f17_local24 )
	Lobby.Process.ForceAction( f17_local24, f17_local6.head )
	Lobby.Process.ForceAction( f17_local6.tail, f17_local7 )
	Lobby.Process.ForceAction( f17_local7, f17_local8 )
	Lobby.Process.ForceAction( f17_local8, f17_local43 )
	return f17_local47
end

