-- 1954a34ef1b887c5d62a7af573dfd311
-- This hash is used for caching, delete to decompile the file again

require( "lua.Lobby.Process.LobbyActions" )
require( "lua.Lobby.Matchmaking.LobbyMatchmaking" )

Lobby.ProcessPlatform = {}
Lobby.ProcessPlatform.PS4AcceptInvite = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4 )
	Engine.LobbyLaunchClear()
	local f1_local0 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f1_local1 = function ()
		if not f1_local0 and Engine.GetLobbyUIScreen() == LobbyData.UITargets.UI_MAIN.id then
			local f2_local0 = 0
			for f2_local1 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
				if Engine.IsUserActive( f2_local1 ) then
					f2_local0 = f2_local0 + 1
				end
			end
			if f2_local0 == 0 or Engine.GetPrimaryController() ~= f1_arg0 then
				Engine.ActivatePrimaryLocalClient( f1_arg0 )
			end
		end
	end
	
	f1_arg0 = Engine.GetPrimaryController()
	local f1_local2 = function ()
		Engine.DeactivateAllLocalClients()
	end
	
	local f1_local3 = function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local f1_local4 = function ()
		Engine.PlatformSessionClearInviteJoinInfo()
	end
	
	local f1_local5 = Engine.GetLobbyNetworkMode()
	if f1_local5 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_INVALID then
		f1_local5 = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN
	end
	local f1_local6 = f1_local5 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN
	local f1_local7 = function ()
		return Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	
	local f1_local8 = 18
	if f1_local0 then
		f1_local8 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	end
	local f1_local9 = Lobby.Process.ReloadPrivateLobby( f1_arg0, f1_local5 )
	local f1_local10 = Lobby.Actions.LobbySettings( f1_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f1_local11 = Lobby.Actions.UpdateUI( f1_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f1_local12 = Lobby.Process.ReloadPrivateLobby( f1_arg0, f1_local5 )
	local f1_local13 = Lobby.Actions.LobbySettings( f1_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f1_local14 = Lobby.Actions.UpdateUI( f1_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f1_local15 = Lobby.Actions.OpenSpinner( nil, true )
	local f1_local16 = Lobby.Actions.CloseSpinner()
	local f1_local17 = Lobby.Actions.CloseSpinner()
	f1_local17.name = f1_local17.name .. "Error"
	local f1_local18 = Lobby.Actions.CloseSpinner()
	f1_local18.name = f1_local18.name .. "CannotPlayOnline"
	local f1_local19 = Lobby.Actions.CloseSpinner()
	f1_local19.name = f1_local19.name .. "InviteBlocked"
	local f1_local20 = Lobby.Actions.CloseSpinner()
	f1_local20.name = f1_local20.name .. "NeedsFirstTimeFlow"
	local f1_local21 = Lobby.Actions.CloseSpinner()
	f1_local21.name = f1_local21.name .. "RecoverError"
	local f1_local22 = Lobby.Actions.EmptyAction()
	local f1_local23 = Lobby.Actions.ExecuteScript( f1_local4 )
	local f1_local24 = Lobby.Actions.ExecuteScript( f1_local4 )
	local f1_local25 = Lobby.Actions.ExecuteScript( f1_local4 )
	local f1_local26 = Lobby.Actions.ExecuteScript( f1_local4 )
	local f1_local27 = Lobby.Actions.ExecuteScript( f1_local4 )
	local f1_local28 = {}
	if Engine.GetUsedControllerCount() > 1 then
		local f1_local29 = 1
		for f1_local30 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			local f1_local33 = f1_local30 - 1
			if Engine.IsUserActive( f1_local33 ) then
				f1_local28[f1_local29] = Lobby.Actions.CanPlayOnline( f1_local33 )
				f1_local29 = f1_local29 + 1
			end
		end
	else
		f1_local28[1] = Lobby.Actions.CanPlayOnline( f1_arg0 )
	end
	local f1_local29 = Lobby.Actions.ConnectingToDemonware( f1_arg0, LuaUtils.CONNECTINGDW_MAX_WAIT_TIME, true )
	local f1_local30 = Lobby.Actions.CanAcceptPlatformInvite( f1_arg0 )
	local f1_local31 = Lobby.Actions.ErrorPopupMsg( "MENU_UPDATE_NEEDED" )
	local f1_local32 = Lobby.Actions.ExecuteScript( f1_local1 )
	local f1_local34 = Lobby.Actions.ExecuteScript( f1_local2 )
	local f1_local33 = Lobby.Actions.ExecuteScript( f1_local3 )
	local f1_local35 = Lobby.Actions.ForceLobbyUIScreen( f1_arg0, LobbyData.UITargets.UI_MODESELECT.id )
	local f1_local36 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f1_local37 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f1_local38 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f1_local39 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f1_local40 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f1_local41 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f1_local42 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f1_local43 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f1_local44 = Lobby.Actions.PlatformSessionGetInviteInfo( f1_arg0, f1_arg1, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f1_arg2 )
	local f1_local45 = Lobby.Actions.GamertagsToXuids( f1_arg0, f1_local44 )
	local f1_local46 = Lobby.Actions.LobbyInfoProbe( f1_arg0, f1_local45 )
	local f1_local47 = Lobby.Actions.CheckFirstTimeFlowRequirements( f1_arg0, f1_local46 )
	local f1_local48 = Lobby.Actions.ShowFirstTimeFlowError( f1_local47 )
	local f1_local49 = Lobby.Actions.LobbyJoinXUID( f1_arg0, f1_local45, f1_arg3 )
	local f1_local50 = Lobby.Actions.ErrorPopup( f1_local49 )
	local f1_local51 = Lobby.Actions.ExecuteScriptWithReturn( f1_local7, true, false, false )
	local f1_local52 = Lobby.Actions.LobbyInfoProbe( f1_arg0, f1_local45 )
	local f1_local53 = Lobby.Actions.LobbyJoinXUIDExt( f1_arg0, f1_arg3, f1_local46, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f1_local54 = Lobby.Actions.LobbyHostStart( f1_arg0, Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyMode.LOBBY_MODE_INVALID, f1_local8 )
	local f1_local55 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f1_local56 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f1_local57 = {
		head = f1_local15,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.ForceAction( f1_local15, f1_local32 )
	local f1_local58 = f1_local32
	for f1_local59 = 1, #f1_local28, 1 do
		Lobby.Process.AddActions( f1_local58, f1_local28[f1_local59], f1_local17, f1_local17 )
		f1_local58 = f1_local28[f1_local59]
	end
	Lobby.Process.AddActions( f1_local58, f1_local33, f1_local18, f1_local18 )
	Lobby.Process.AddActions( f1_local33, f1_local29, f1_local17, f1_local17 )
	Lobby.Process.AddActions( f1_local29, f1_local30, f1_local17, f1_local17 )
	Lobby.Process.AddActions( f1_local30, f1_local22, f1_local19, f1_local19 )
	f1_local58 = f1_local22
	if f1_local6 then
		Lobby.Process.ForceAction( f1_local58, f1_local35 )
		Lobby.Process.ForceAction( f1_local35, f1_local36 )
		Lobby.Process.ForceAction( f1_local36, f1_local37 )
		Lobby.Process.ForceAction( f1_local37, f1_local38 )
		Lobby.Process.ForceAction( f1_local38, f1_local39 )
		f1_local58 = f1_local39
	end
	Lobby.Process.AddActions( f1_local58, f1_local40, f1_local21, f1_local21 )
	Lobby.Process.AddActions( f1_local40, f1_local41, f1_local21, f1_local21 )
	f1_local58 = f1_local41
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		Lobby.Process.AddActions( f1_local58, f1_local42, f1_local21, f1_local21 )
		f1_local58 = f1_local42
		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
			Lobby.Process.AddActions( f1_local58, f1_local43, f1_local21, f1_local21 )
			f1_local58 = f1_local43
		end
	end
	Lobby.Process.AddActions( f1_local58, f1_local54, f1_local21, f1_local21 )
	Lobby.Process.AddActions( f1_local54, f1_local55, f1_local21, f1_local21 )
	Lobby.Process.AddActions( f1_local55, f1_local56, f1_local21, f1_local21 )
	Lobby.Process.AddActions( f1_local56, f1_local44, f1_local21, f1_local21 )
	Lobby.Process.AddActions( f1_local44, f1_local45, f1_local21, f1_local21 )
	Lobby.Process.AddActions( f1_local45, f1_local46, f1_local21, f1_local21 )
	Lobby.Process.AddActions( f1_local46, f1_local47, f1_local21, f1_local21 )
	Lobby.Process.AddActions( f1_local47, f1_local49, f1_local20, f1_local20 )
	Lobby.Process.AddActions( f1_local49, f1_local23, f1_local21, f1_local21 )
	Lobby.Process.AddActions( f1_local23, f1_local51, f1_local21, f1_local21 )
	Lobby.Process.AddActions( f1_local51, f1_local52, f1_local16, f1_local16 )
	Lobby.Process.AddActions( f1_local52, f1_local53, f1_local16, f1_local16 )
	Lobby.Process.AddActions( f1_local53, f1_local16, f1_local16, f1_local16 )
	Lobby.Process.ForceAction( f1_local17, f1_local24 )
	Lobby.Process.ForceAction( f1_local24, f1_local50 )
	Lobby.Process.ForceAction( f1_local19, f1_local25 )
	Lobby.Process.ForceAction( f1_local25, f1_local31 )
	Lobby.Process.ForceAction( f1_local20, f1_local26 )
	Lobby.Process.ForceAction( f1_local26, f1_local12.head )
	Lobby.Process.ForceAction( f1_local12.tail, f1_local13 )
	Lobby.Process.ForceAction( f1_local13, f1_local14 )
	Lobby.Process.ForceAction( f1_local14, f1_local48 )
	Lobby.Process.ForceAction( f1_local21, f1_local27 )
	Lobby.Process.ForceAction( f1_local27, f1_local9.head )
	Lobby.Process.ForceAction( f1_local9.tail, f1_local10 )
	Lobby.Process.ForceAction( f1_local10, f1_local11 )
	Lobby.Process.ForceAction( f1_local11, f1_local50 )
	return f1_local57
end

Lobby.ProcessPlatform.PS4SessionJoin = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
	Engine.LobbyLaunchClear()
	local f7_local0 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f7_local1 = function ()
		if not f7_local0 and Engine.GetLobbyUIScreen() == LobbyData.UITargets.UI_MAIN.id then
			local f8_local0 = 0
			for f8_local1 = 0, LuaEnums.MAX_CONTROLLER_COUNT - 1, 1 do
				if Engine.IsUserActive( f8_local1 ) then
					f8_local0 = f8_local0 + 1
				end
			end
			if f8_local0 == 0 or Engine.GetPrimaryController() ~= f7_arg0 then
				Engine.ActivatePrimaryLocalClient( f7_arg0 )
			end
		end
	end
	
	f7_arg0 = Engine.GetPrimaryController()
	local f7_local2 = function ()
		Engine.DeactivateAllLocalClients()
	end
	
	local f7_local3 = function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local f7_local4 = function ()
		Engine.PlatformSessionClearInviteJoinInfo()
	end
	
	local f7_local5 = Engine.GetLobbyNetworkMode()
	if f7_local5 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_INVALID then
		f7_local5 = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN
	end
	local f7_local6 = f7_local5 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN
	local f7_local7 = function ()
		return Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	
	local f7_local8 = 18
	if f7_local0 == true then
		f7_local8 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	end
	local f7_local9 = Lobby.Process.ReloadPrivateLobby( f7_arg0, f7_local5 )
	local f7_local10 = Lobby.Actions.LobbySettings( f7_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f7_local11 = Lobby.Actions.UpdateUI( f7_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f7_local12 = Lobby.Process.ReloadPrivateLobby( f7_arg0, f7_local5 )
	local f7_local13 = Lobby.Actions.LobbySettings( f7_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f7_local14 = Lobby.Actions.UpdateUI( f7_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f7_local15 = Lobby.Actions.OpenSpinner( nil, true )
	local f7_local16 = Lobby.Actions.CloseSpinner()
	local f7_local17 = Lobby.Actions.CloseSpinner()
	local f7_local18 = Lobby.Actions.CloseSpinner()
	f7_local18.name = f7_local18.name .. "NeedsFirstTimeFlow"
	local f7_local19 = Lobby.Actions.CloseSpinner()
	f7_local19.name = f7_local19.name .. "CannotPlayOnline"
	local f7_local20 = Lobby.Actions.CloseSpinner()
	f7_local20.name = f7_local20.name .. "RecoverError"
	local f7_local21 = {}
	if Engine.GetUsedControllerCount() > 1 then
		local f7_local22 = 1
		for f7_local23 = 1, LuaEnums.MAX_CONTROLLER_COUNT, 1 do
			local f7_local26 = f7_local23 - 1
			if Engine.IsUserActive( f7_local26 ) then
				f7_local21[f7_local22] = Lobby.Actions.CanPlayOnline( f7_local26 )
				f7_local22 = f7_local22 + 1
			end
		end
	else
		f7_local21[1] = Lobby.Actions.CanPlayOnline( f7_arg0 )
	end
	local f7_local22 = Lobby.Actions.ExecuteScript( f7_local1 )
	local f7_local23 = Lobby.Actions.ExecuteScript( f7_local2 )
	local f7_local24 = Lobby.Actions.ExecuteScript( f7_local4 )
	local f7_local25 = Lobby.Actions.ExecuteScript( f7_local4 )
	local f7_local27 = Lobby.Actions.ExecuteScript( f7_local4 )
	local f7_local26 = Lobby.Actions.ExecuteScript( f7_local4 )
	local f7_local28 = Lobby.Actions.ExecuteScript( f7_local3 )
	local f7_local29 = Lobby.Actions.ConnectingToDemonware( f7_arg0, LuaUtils.CONNECTINGDW_MAX_WAIT_TIME, true )
	local f7_local30 = Lobby.Actions.ForceLobbyUIScreen( f7_arg0, LobbyData.UITargets.UI_MODESELECT.id )
	local f7_local31 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f7_local32 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f7_local33 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f7_local34 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f7_local35 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f7_local36 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f7_local37 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f7_local38 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f7_local39 = Lobby.Actions.PlatformSessionGetSessionInfo( f7_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f7_arg1 )
	local f7_local40 = Lobby.Actions.GamertagsToXuids( f7_arg0, f7_local39 )
	local f7_local41 = Lobby.Actions.LobbyInfoProbe( f7_arg0, f7_local40 )
	local f7_local42 = Lobby.Actions.CheckFirstTimeFlowRequirements( f7_arg0, f7_local41 )
	local f7_local43 = Lobby.Actions.ShowFirstTimeFlowError( f7_local42 )
	local f7_local44 = Lobby.Actions.LobbyJoinXUID( f7_arg0, f7_local40, f7_arg2 )
	local f7_local45 = Lobby.Actions.ErrorPopup( f7_local44 )
	local f7_local46 = Lobby.Actions.ErrorPopup( f7_local44 )
	local f7_local47 = Lobby.Actions.ExecuteScriptWithReturn( f7_local7, true, false, false )
	local f7_local48 = Lobby.Actions.LobbyInfoProbe( f7_arg0, f7_local40 )
	local f7_local49 = Lobby.Actions.LobbyJoinXUIDExt( f7_arg0, f7_arg2, f7_local41, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f7_local50 = Lobby.Actions.LobbyHostStart( f7_arg0, Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyMode.LOBBY_MODE_INVALID, f7_local8 )
	local f7_local51 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f7_local52 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f7_local53 = {
		head = f7_local15,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.ForceAction( f7_local15, f7_local22 )
	local f7_local54 = f7_local22
	for f7_local55 = 1, #f7_local21, 1 do
		Lobby.Process.AddActions( f7_local54, f7_local21[f7_local55], f7_local17, f7_local17 )
		f7_local54 = f7_local21[f7_local55]
	end
	Lobby.Process.AddActions( f7_local54, f7_local28, f7_local19, f7_local19 )
	Lobby.Process.AddActions( f7_local28, f7_local29, f7_local17, f7_local17 )
	f7_local54 = f7_local29
	if f7_local6 then
		Lobby.Process.ForceAction( f7_local54, f7_local30 )
		Lobby.Process.ForceAction( f7_local30, f7_local31 )
		Lobby.Process.ForceAction( f7_local31, f7_local32 )
		Lobby.Process.ForceAction( f7_local32, f7_local33 )
		Lobby.Process.ForceAction( f7_local33, f7_local34 )
		f7_local54 = f7_local34
	end
	Lobby.Process.AddActions( f7_local54, f7_local35, f7_local20, f7_local20 )
	Lobby.Process.AddActions( f7_local35, f7_local36 )
	f7_local54 = f7_local36
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		Lobby.Process.AddActions( f7_local54, f7_local37, f7_local20, f7_local20 )
		f7_local54 = f7_local37
		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
			Lobby.Process.AddActions( f7_local54, f7_local38, f7_local20, f7_local20 )
			f7_local54 = f7_local38
		end
	end
	Lobby.Process.AddActions( f7_local54, f7_local50, f7_local20, f7_local20 )
	Lobby.Process.AddActions( f7_local50, f7_local51, f7_local20, f7_local20 )
	Lobby.Process.AddActions( f7_local51, f7_local52, f7_local20, f7_local20 )
	Lobby.Process.AddActions( f7_local52, f7_local39, f7_local20, f7_local20 )
	Lobby.Process.AddActions( f7_local39, f7_local40, f7_local20, f7_local20 )
	Lobby.Process.AddActions( f7_local40, f7_local41, f7_local20, f7_local20 )
	Lobby.Process.AddActions( f7_local41, f7_local42, f7_local20, f7_local20 )
	Lobby.Process.AddActions( f7_local42, f7_local44, f7_local18, f7_local18 )
	Lobby.Process.AddActions( f7_local44, f7_local24, f7_local20, f7_local20 )
	Lobby.Process.AddActions( f7_local24, f7_local47, f7_local20, f7_local20 )
	Lobby.Process.AddActions( f7_local47, f7_local48, f7_local16, f7_local16 )
	Lobby.Process.AddActions( f7_local48, f7_local49, f7_local16, f7_local16 )
	Lobby.Process.AddActions( f7_local49, f7_local16, f7_local16, f7_local16 )
	Lobby.Process.ForceAction( f7_local17, f7_local25 )
	Lobby.Process.ForceAction( f7_local25, f7_local45 )
	Lobby.Process.ForceAction( f7_local45, f7_local23 )
	Lobby.Process.ForceAction( f7_local18, f7_local27 )
	Lobby.Process.ForceAction( f7_local27, f7_local12.head )
	Lobby.Process.ForceAction( f7_local12.tail, f7_local13 )
	Lobby.Process.ForceAction( f7_local13, f7_local14 )
	Lobby.Process.ForceAction( f7_local14, f7_local43 )
	Lobby.Process.ForceAction( f7_local20, f7_local26 )
	Lobby.Process.ForceAction( f7_local26, f7_local9.head )
	Lobby.Process.ForceAction( f7_local9.tail, f7_local10 )
	Lobby.Process.ForceAction( f7_local10, f7_local11 )
	Lobby.Process.ForceAction( f7_local11, f7_local46 )
	return f7_local53
end

Lobby.ProcessPlatform.XboxJoin = function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
	Engine.LobbyLaunchClear()
	local f13_local0 = Engine.GetLobbyNetworkMode()
	if f13_local0 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_INVALID then
		f13_local0 = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN
	end
	local f13_local1 = f13_local0 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN
	local f13_local2 = function ()
		Engine.ActivatePrimaryLocalClient( f13_arg0 )
	end
	
	local f13_local3 = function ()
		Engine.DeactivateAllLocalClients()
	end
	
	local f13_local4 = function ()
		Engine.PlatformSessionClearInviteJoinInfo()
	end
	
	local f13_local5 = function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local f13_local6 = function ()
		return Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	
	local f13_local7 = 18
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) == true then
		f13_local7 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	end
	local f13_local8 = Lobby.Process.ReloadPrivateLobby( f13_arg0, f13_local0 )
	local f13_local9 = Lobby.Actions.LobbySettings( f13_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f13_local10 = Lobby.Actions.UpdateUI( f13_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f13_local11 = Lobby.Process.ReloadPrivateLobby( f13_arg0, f13_local0 )
	local f13_local12 = Lobby.Actions.LobbySettings( f13_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f13_local13 = Lobby.Actions.UpdateUI( f13_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f13_local14 = Lobby.Process.ReloadPrivateLobby( f13_arg0, f13_local0 )
	local f13_local15 = Lobby.Actions.LobbySettings( f13_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f13_local16 = Lobby.Actions.UpdateUI( f13_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f13_local17 = Lobby.Actions.OpenSpinner( nil, true )
	local f13_local18 = Lobby.Actions.CloseSpinner()
	local f13_local19 = Lobby.Actions.CloseSpinner()
	f13_local19.name = f13_local19.name .. "CanPlayOnline"
	local f13_local20 = Lobby.Actions.CloseSpinner()
	f13_local20.name = f13_local20.name .. "NeedsFirstTimeFlow"
	local f13_local21 = Lobby.Actions.CloseSpinner()
	f13_local21.name = f13_local21.name .. "RecoverError"
	local f13_local22 = Lobby.Actions.ErrorPopupMsg( "XBOXLIVE_MPNOTALLOWED" )
	local f13_local23 = Lobby.Actions.CanPlayOnline( f13_arg0 )
	local f13_local24 = Lobby.Actions.ExecuteScript( f13_local5 )
	local f13_local25 = Lobby.Actions.ConnectingToDemonware( f13_arg0, LuaUtils.CONNECTINGDW_MAX_WAIT_TIME, true )
	local f13_local26 = Lobby.Actions.ExecuteScript( f13_local2 )
	local f13_local27 = Lobby.Actions.ExecuteScript( f13_local3 )
	local f13_local28 = Lobby.Actions.ForceLobbyUIScreen( f13_arg0, LobbyData.UITargets.UI_MODESELECT.id )
	local f13_local29 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f13_local30 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f13_local31 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f13_local32 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f13_local33 = Lobby.Actions.LeaveWithParty( 3000 )
	local f13_local34 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f13_local35 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f13_local36 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f13_local37 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f13_local38 = Lobby.Actions.LobbyInfoProbe( f13_arg0, {
		xuid = f13_arg1
	} )
	local f13_local39 = Lobby.Actions.LobbyJoinXUIDExt( f13_arg0, f13_arg2, f13_local38, Enum.LobbyType.LOBBY_TYPE_COUNT )
	local f13_local40 = Lobby.Actions.CheckFirstTimeFlowRequirements( f13_arg0, f13_local38 )
	local f13_local41 = Lobby.Actions.ShowFirstTimeFlowError( f13_local40 )
	local f13_local42 = Lobby.Actions.ExecuteScriptWithReturn( f13_local6, true, false, false )
	local f13_local43 = Lobby.Actions.LobbyInfoProbe( f13_arg0, {
		xuid = f13_arg1
	} )
	local f13_local44 = Lobby.Actions.LobbyJoinXUIDExt( f13_arg0, f13_arg2, f13_local43, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f13_local45 = Lobby.Actions.LobbyHostStart( f13_arg0, Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyMode.LOBBY_MODE_INVALID, f13_local7 )
	local f13_local46 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f13_local47 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f13_local48 = Lobby.Actions.ExecuteScript( f13_local4 )
	local f13_local49 = Lobby.Actions.ExecuteScript( f13_local4 )
	local f13_local50 = Lobby.Actions.ExecuteScript( f13_local4 )
	local f13_local51 = Lobby.Actions.ExecuteScript( f13_local4 )
	local f13_local52 = Lobby.Actions.ExecuteScript( f13_local4 )
	local f13_local53 = Lobby.Actions.CloseSpinner()
	local f13_local54 = Lobby.Actions.ErrorPopup( f13_local39 )
	local f13_local55 = f13_arg3 == LuaEnums.LEAVE_WITH_PARTY.WITH
	local f13_local56 = Engine.IsInGame()
	local f13_local57 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f13_local58 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f13_local59 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f13_local60 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f13_local61 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f13_local62 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f13_local63 = false
	local f13_local64 = false
	local f13_local65 = false
	local f13_local66 = false
	if f13_local56 == true then
		f13_local63 = true
		f13_local64 = true
		f13_local65 = true
		if f13_local59 == true then
			f13_local66 = true
		end
	elseif f13_local58 == true then
		f13_local63 = true
		f13_local64 = true
		if f13_local55 == false then
			f13_local65 = true
			if f13_local59 == true then
				f13_local66 = true
			end
		end
	elseif f13_local57 == true then
		if f13_local55 == false then
			f13_local65 = true
			if f13_local59 == true then
				f13_local66 = true
			end
		end
	else
		f13_local63 = true
		f13_local64 = true
		f13_local65 = true
		f13_local66 = true
	end
	local f13_local67 = {
		head = f13_local23,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f13_local23, f13_local17, f13_local19, f13_local19 )
	Lobby.Process.ForceAction( f13_local17, f13_local26 )
	local f13_local68 = f13_local26
	if f13_local1 then
		Lobby.Process.ForceAction( f13_local68, f13_local28 )
		Lobby.Process.ForceAction( f13_local28, f13_local29 )
		Lobby.Process.ForceAction( f13_local29, f13_local30 )
		Lobby.Process.ForceAction( f13_local30, f13_local31 )
		Lobby.Process.ForceAction( f13_local31, f13_local32 )
		f13_local68 = f13_local32
	end
	Lobby.Process.ForceAction( f13_local68, f13_local24 )
	Lobby.Process.ForceAction( f13_local24, f13_local25 )
	f13_local68 = f13_local25
	if f13_local58 == true and f13_local55 == true then
		Lobby.Process.AddActions( f13_local68, f13_local33, f13_local21, f13_local21 )
		f13_local68 = f13_local33
	end
	if f13_local63 == true then
		Lobby.Process.AddActions( f13_local68, f13_local36, f13_local21, f13_local21 )
		f13_local68 = f13_local36
	end
	if f13_local64 == true then
		Lobby.Process.AddActions( f13_local68, f13_local37, f13_local21, f13_local21 )
		f13_local68 = f13_local37
	end
	if f13_local65 == true then
		Lobby.Process.AddActions( f13_local68, f13_local34, f13_local21, f13_local21 )
		f13_local68 = f13_local34
	end
	if f13_local66 == true then
		Lobby.Process.AddActions( f13_local68, f13_local35, f13_local21, f13_local21 )
		f13_local68 = f13_local35
	end
	if f13_local59 == false or f13_local66 == true then
		Lobby.Process.AddActions( f13_local68, f13_local45, f13_local21, f13_local21 )
		Lobby.Process.AddActions( f13_local45, f13_local46, f13_local21, f13_local21 )
		f13_local68 = f13_local46
	end
	if f13_local65 == true then
		Lobby.Process.AddActions( f13_local68, f13_local47, f13_local21, f13_local21 )
		f13_local68 = f13_local47
	end
	Lobby.Process.AddActions( f13_local68, f13_local38, f13_local21, f13_local21 )
	Lobby.Process.AddActions( f13_local38, f13_local40, f13_local21, f13_local21 )
	Lobby.Process.AddActions( f13_local40, f13_local39, f13_local20, f13_local20 )
	Lobby.Process.AddActions( f13_local39, f13_local42, f13_local21, f13_local21 )
	Lobby.Process.AddActions( f13_local42, f13_local43, f13_local48, f13_local48 )
	Lobby.Process.AddActions( f13_local43, f13_local44, f13_local48, f13_local48 )
	Lobby.Process.ForceAction( f13_local44, f13_local48 )
	Lobby.Process.ForceAction( f13_local48, f13_local18 )
	Lobby.Process.ForceAction( f13_local19, f13_local50 )
	Lobby.Process.ForceAction( f13_local50, f13_local11.head )
	Lobby.Process.ForceAction( f13_local11.tail, f13_local12 )
	Lobby.Process.ForceAction( f13_local12, f13_local13 )
	Lobby.Process.ForceAction( f13_local13, f13_local22 )
	Lobby.Process.ForceAction( f13_local20, f13_local51 )
	Lobby.Process.ForceAction( f13_local51, f13_local14.head )
	Lobby.Process.ForceAction( f13_local14.tail, f13_local15 )
	Lobby.Process.ForceAction( f13_local15, f13_local16 )
	Lobby.Process.ForceAction( f13_local16, f13_local41 )
	Lobby.Process.ForceAction( f13_local21, f13_local52 )
	Lobby.Process.ForceAction( f13_local52, f13_local8.head )
	Lobby.Process.ForceAction( f13_local8.tail, f13_local9 )
	Lobby.Process.ForceAction( f13_local9, f13_local10 )
	Lobby.Process.ForceAction( f13_local10, f13_local54 )
	Lobby.Process.ForceAction( f13_local54, f13_local27 )
	return f13_local67
end

Lobby.ProcessPlatform.PCJoin = function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3, f19_arg4 )
	local f19_local0 = function ()
		Engine.ActivatePrimaryLocalClient( f19_arg0 )
	end
	
	local f19_local1 = function ()
		Engine.DeactivateAllLocalClients()
	end
	
	local f19_local2 = function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local f19_local3 = function ()
		Engine.PlatformSessionClearInviteJoinInfo()
	end
	
	local f19_local4 = Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN
	local f19_local5 = function ( f24_arg0 )
		local f24_local0 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
		if f24_local0 then
			f24_local0 = f24_arg0.probeResult.privateLobby.isValid
			if f24_local0 then
				f24_local0 = f19_arg2 ~= LuaEnums.INVALID_XUID
			end
		end
		return f24_local0
	end
	
	local f19_local6 = Engine.GetLobbyNetworkMode()
	if f19_local6 ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN and f19_local6 ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		f19_local6 = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
	end
	local f19_local7 = 18
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		f19_local7 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	end
	local f19_local8 = Lobby.Process.ReloadPrivateLobby( f19_arg0, f19_local6 )
	local f19_local9 = Lobby.Actions.LobbySettings( f19_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f19_local10 = Lobby.Actions.UpdateUI( f19_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f19_local11 = Lobby.Process.ReloadPrivateLobby( f19_arg0, f19_local6 )
	local f19_local12 = Lobby.Actions.LobbySettings( f19_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f19_local13 = Lobby.Actions.UpdateUI( f19_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f19_local14 = Lobby.Actions.OpenSpinner( nil, true )
	local f19_local15 = Lobby.Actions.CloseSpinner()
	local f19_local16 = Lobby.Actions.CloseSpinner()
	local f19_local17 = Lobby.Actions.CloseSpinner()
	f19_local17.name = f19_local17.name .. "NeedsFirstTimeFlow"
	local f19_local18 = Lobby.Actions.CloseSpinner()
	f19_local18.name = f19_local18.name .. "CheckMods"
	local f19_local19 = Lobby.Actions.CloseSpinner()
	f19_local19.name = f19_local19.name .. "CheckStarterPack"
	local f19_local20 = Lobby.Actions.CloseSpinner()
	f19_local20.name = f19_local20.name .. "CannotPlayOnline"
	local f19_local21 = Lobby.Actions.CloseSpinner()
	f19_local21.name = f19_local21.name .. "RecoverError"
	local f19_local22 = Lobby.Actions.CanPlayOnline( f19_arg0 )
	local f19_local23 = Lobby.Actions.ExecuteScript( f19_local0 )
	local f19_local24 = Lobby.Actions.ExecuteScript( f19_local1 )
	local f19_local25 = Lobby.Actions.ExecuteScript( f19_local3 )
	local f19_local26 = Lobby.Actions.ExecuteScript( f19_local3 )
	local f19_local27 = Lobby.Actions.ExecuteScript( f19_local3 )
	local f19_local28 = Lobby.Actions.ExecuteScript( f19_local3 )
	local f19_local29 = Lobby.Actions.ExecuteScript( f19_local3 )
	local f19_local30 = Lobby.Actions.ExecuteScript( f19_local3 )
	local f19_local31 = Lobby.Actions.ExecuteScript( f19_local3 )
	local f19_local32 = Lobby.Actions.ExecuteScript( f19_local3 )
	local f19_local33 = Lobby.Actions.ExecuteScript( f19_local3 )
	local f19_local34 = Lobby.Actions.ExecuteScript( f19_local2 )
	local f19_local35 = Lobby.Actions.ConnectingToDemonware( f19_arg0, LuaUtils.CONNECTINGDW_MAX_WAIT_TIME, true )
	local f19_local36 = Lobby.Actions.ForceLobbyUIScreen( f19_arg0, LobbyData.UITargets.UI_MODESELECT.id )
	local f19_local37 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f19_local38 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f19_local39 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f19_local40 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f19_local41 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f19_local42 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f19_local43 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f19_local44 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f19_local45 = Lobby.Actions.PlatformSessionGetSessionInfo( f19_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, sessionId )
	local f19_local46 = Lobby.Actions.GamertagsToXuids( f19_arg0, f19_local45 )
	local f19_local47 = Lobby.Actions.LobbyInfoProbe( f19_arg0, {
		xuid = f19_arg1
	} )
	local f19_local48 = Lobby.Actions.CheckFirstTimeFlowRequirements( f19_arg0, f19_local47 )
	local f19_local49 = Lobby.Actions.ShowFirstTimeFlowError( f19_local48 )
	local f19_local50 = Lobby.Actions.LobbyJoinXUIDExt( f19_arg0, f19_arg3, f19_local47, Enum.LobbyType.LOBBY_TYPE_COUNT )
	local f19_local51 = Lobby.Actions.ErrorPopup( f19_local50 )
	local f19_local52 = Lobby.Actions.ErrorPopup( f19_local50 )
	local f19_local53 = Lobby.Actions.ExecuteScriptWithReturn( f19_local5, true, false, false, f19_local47 )
	local f19_local54 = Lobby.Actions.LobbyInfoProbe( f19_arg0, {
		xuid = f19_arg2
	} )
	local f19_local55 = Lobby.Actions.LobbyJoinXUIDExt( f19_arg0, f19_arg3, f19_local54, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f19_local56 = Lobby.Actions.CheckStarterPackRequirements( f19_arg0, f19_local47 )
	local f19_local57 = Lobby.Actions.ErrorPopup( f19_local56 )
	local f19_local58 = Lobby.Actions.CheckMods( f19_arg0, f19_local47, true )
	local f19_local59 = Lobby.Actions.ErrorPopup( f19_local58 )
	local f19_local60 = Lobby.Actions.SubscribeUGC( f19_arg0, f19_local58 )
	local f19_local61 = Lobby.Actions.ErrorPopup( f19_local60 )
	local f19_local62 = Lobby.Actions.CloseSpinner()
	f19_local62.name = f19_local16.name .. "SubscribeUGC"
	local f19_local63 = Lobby.Actions.InstalledUGC( f19_arg0, f19_local58 )
	local f19_local64 = Lobby.Actions.ErrorPopup( f19_local63 )
	local f19_local65 = Lobby.Actions.CloseSpinner()
	f19_local65.name = f19_local16.name .. "InstalledUGC"
	local f19_local66 = Lobby.Actions.LoadMod( f19_arg0, f19_local58 )
	local f19_local67 = Lobby.Actions.ErrorPopup( f19_local66 )
	local f19_local68 = Lobby.Actions.CloseSpinner()
	f19_local68.name = f19_local16.name .. "LoadedMod"
	local f19_local69 = Lobby.Actions.LobbyHostStart( f19_arg0, Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyMode.LOBBY_MODE_INVALID, f19_local7 )
	local f19_local70 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f19_local71 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f19_local72 = {
		head = f19_local14,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.ForceAction( f19_local14, f19_local23 )
	Lobby.Process.AddActions( f19_local23, f19_local22, f19_local16, f19_local16 )
	Lobby.Process.AddActions( f19_local22, f19_local34, f19_local20, f19_local20 )
	Lobby.Process.AddActions( f19_local34, f19_local35, f19_local16, f19_local16 )
	local f19_local73 = f19_local35
	if f19_local4 then
		Lobby.Process.ForceAction( f19_local73, f19_local36 )
		Lobby.Process.ForceAction( f19_local36, f19_local37 )
		Lobby.Process.ForceAction( f19_local37, f19_local38 )
		Lobby.Process.ForceAction( f19_local38, f19_local39 )
		Lobby.Process.ForceAction( f19_local39, f19_local40 )
		f19_local73 = f19_local40
	end
	Lobby.Process.AddActions( f19_local73, f19_local41, f19_local21, f19_local21 )
	Lobby.Process.AddActions( f19_local41, f19_local42 )
	f19_local73 = f19_local42
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		Lobby.Process.AddActions( f19_local73, f19_local43, f19_local21, f19_local21 )
		f19_local73 = f19_local43
		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
			Lobby.Process.AddActions( f19_local73, f19_local44, f19_local21, f19_local21 )
			f19_local73 = f19_local44
		end
	end
	Lobby.Process.AddActions( f19_local73, f19_local69, f19_local21, f19_local21 )
	Lobby.Process.AddActions( f19_local69, f19_local70, f19_local21, f19_local21 )
	Lobby.Process.AddActions( f19_local70, f19_local71, f19_local21, f19_local21 )
	Lobby.Process.AddActions( f19_local71, f19_local45, f19_local21, f19_local21 )
	Lobby.Process.AddActions( f19_local45, f19_local47, f19_local21, f19_local21 )
	Lobby.Process.AddActions( f19_local47, f19_local58, f19_local21, f19_local21 )
	Lobby.Process.AddActions( f19_local58, f19_local60, f19_local16, f19_local18 )
	Lobby.Process.AddActions( f19_local60, f19_local63, f19_local16, f19_local62 )
	Lobby.Process.AddActions( f19_local63, f19_local66, f19_local16, f19_local65 )
	Lobby.Process.AddActions( f19_local66, f19_local56, f19_local16, f19_local68 )
	Lobby.Process.AddActions( f19_local56, f19_local48, f19_local21, f19_local19 )
	Lobby.Process.AddActions( f19_local48, f19_local50, f19_local17, f19_local17 )
	Lobby.Process.AddActions( f19_local50, f19_local25, f19_local21, f19_local21 )
	Lobby.Process.AddActions( f19_local25, f19_local53, f19_local21, f19_local21 )
	Lobby.Process.AddActions( f19_local53, f19_local54, f19_local15, f19_local15 )
	Lobby.Process.AddActions( f19_local54, f19_local55, f19_local15, f19_local15 )
	Lobby.Process.AddActions( f19_local55, f19_local15, f19_local15, f19_local15 )
	Lobby.Process.ForceAction( f19_local16, f19_local26 )
	Lobby.Process.ForceAction( f19_local26, f19_local51 )
	Lobby.Process.ForceAction( f19_local51, f19_local24 )
	Lobby.Process.ForceAction( f19_local17, f19_local27 )
	Lobby.Process.ForceAction( f19_local27, f19_local11.head )
	Lobby.Process.ForceAction( f19_local11.tail, f19_local12 )
	Lobby.Process.ForceAction( f19_local12, f19_local13 )
	Lobby.Process.ForceAction( f19_local13, f19_local49 )
	Lobby.Process.ForceAction( f19_local18, f19_local30 )
	Lobby.Process.ForceAction( f19_local30, f19_local59 )
	Lobby.Process.ForceAction( f19_local62, f19_local31 )
	Lobby.Process.ForceAction( f19_local31, f19_local61 )
	Lobby.Process.ForceAction( f19_local65, f19_local32 )
	Lobby.Process.ForceAction( f19_local32, f19_local64 )
	Lobby.Process.ForceAction( f19_local68, f19_local33 )
	Lobby.Process.ForceAction( f19_local33, f19_local67 )
	Lobby.Process.ForceAction( f19_local19, f19_local29 )
	Lobby.Process.ForceAction( f19_local29, f19_local57 )
	Lobby.Process.ForceAction( f19_local21, f19_local28 )
	Lobby.Process.ForceAction( f19_local28, f19_local8.head )
	Lobby.Process.ForceAction( f19_local8.tail, f19_local9 )
	Lobby.Process.ForceAction( f19_local9, f19_local10 )
	Lobby.Process.ForceAction( f19_local10, f19_local52 )
	return f19_local72
end

Lobby.ProcessPlatform.PlayTogetherBeginPlay = function ( f25_arg0, f25_arg1 )
	local f25_local0 = function ()
		Engine.PlatformSessionClearPlayTogetherInfo()
	end
	
	local f25_local1 = Lobby.Actions.OpenSpinner( nil, true )
	local f25_local2 = Lobby.Actions.CloseSpinner()
	local f25_local3 = Lobby.Platform.PS4GetSessionId( f25_arg0 )
	local f25_local4 = Lobby.Actions.PlayTogetherBeginPlayWait( f25_arg0 )
	local f25_local5 = Lobby.Actions.PlayTogetherPSNSessionWait( f25_arg0, f25_local3 )
	local f25_local6 = Lobby.Actions.ExecuteScript( f25_local0, nil )
	local f25_local7 = {
		head = f25_local1,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = false
	}
	Lobby.Process.AddActions( f25_local1, f25_local4 )
	Lobby.Process.AddActions( f25_local4, f25_local5 )
	local f25_local8 = f25_local5
	for f25_local12, f25_local13 in ipairs( f25_arg1 ) do
		local f25_local14 = Lobby.Actions.SendPlatformInvite( f25_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f25_local13 )
		Lobby.Process.AddActions( f25_local8, f25_local14 )
		f25_local8 = f25_local14
	end
	Lobby.Process.AddActions( f25_local8, f25_local6 )
	Lobby.Process.AddActions( f25_local6, f25_local2 )
	return f25_local7
end

Lobby.ProcessPlatform.SendPlayTogetherInvites = function ( f27_arg0, f27_arg1 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.beginPlay" ), Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
	local f27_local0 = Lobby.Platform.PS4GetSessionId( f27_arg0 )
	local f27_local1 = function ()
		Engine.PlatformSessionClearPlayTogetherInfo()
	end
	
	local f27_local2 = Lobby.Actions.OpenSpinner( nil, true )
	local f27_local3 = Lobby.Actions.CloseSpinner()
	local f27_local4 = Lobby.Actions.ExecuteScript( f27_local1, nil )
	local f27_local5 = {
		head = f27_local2,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = false
	}
	local f27_local6 = f27_local2
	for f27_local10, f27_local11 in ipairs( f27_arg1 ) do
		local f27_local12 = Lobby.Actions.SendPlatformInvite( f27_arg0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f27_local11, f27_local0 )
		Lobby.Process.AddActions( f27_local6, f27_local12 )
		f27_local6 = f27_local12
	end
	Lobby.Process.AddActions( f27_local6, f27_local4 )
	Lobby.Process.AddActions( f27_local4, f27_local3 )
	return f27_local5
end

