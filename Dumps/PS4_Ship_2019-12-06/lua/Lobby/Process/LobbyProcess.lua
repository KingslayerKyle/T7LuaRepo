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
	end
	local f6_local2 = Lobby.Actions.OpenSpinner()
	local f6_local3 = Lobby.Actions.CloseSpinner()
	local f6_local4 = Lobby.Actions.SwitchMode( f6_arg0, f6_arg3 )
	local f6_local5 = Lobby.Actions.UpdateUI( f6_arg0, f6_arg2 )
	local f6_local6 = Lobby.Actions.SetDefaultArenaPlaylist( f6_arg0 )
	local f6_local7 = Lobby.Actions.RunPlaylistRules( f6_arg0 )
	f6_local0.head = f6_local2
	Lobby.Process.AddActions( f6_local2, f6_local4 )
	Lobby.Process.AddActions( f6_local4, f6_local1 )
	local f6_local8 = f6_local1
	if f6_arg2.lobbyMode == Enum.LobbyMode.LOBBY_MODE_ARENA then
		Lobby.Process.AddActions( f6_local8, f6_local6 )
		Lobby.Process.AddActions( f6_local6, f6_local7 )
		f6_local8 = f6_local7
	end
	Lobby.Process.AddActions( f6_local8, f6_local5 )
	Lobby.Process.AddActions( f6_local5, f6_local3 )
	return f6_local0
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
		if Dvar.tu9_hostPrivateSessions:get() == true and Engine.LobbyHostSetPrivateSession and f8_arg1.id == LobbyData.UITargets.UI_MPLOBBYONLINEARENAGAME.id then
			Engine.LobbyHostSetPrivateSession( f8_arg1.lobbyType, true )
		end
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

Lobby.Process.MergePublicDedicatedLobby = function ( f10_arg0 )
	Lobby.Matchmaking.SetupMatchmakingQuery( f10_arg0, Lobby.Matchmaking.SearchMode.LOBBY_MERGE )
	local f10_local0 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionStatus.SESSION_STATUS_MERGE )
	end
	
	local f10_local1 = function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Lobby.Merge.Complete()
		Lobby.Matchmaking.ClearSearchInfo()
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
	f10_local7.name = f10_local7.name .. "_1"
	f10_local8.name = f10_local8.name .. "_2"
	local f10_local9 = Lobby.Actions.QoSJoinSearchResults( f10_arg0, f10_local7 )
	local f10_local10 = Lobby.Actions.QoSJoinSearchResults( f10_arg0, f10_local8 )
	f10_local9.name = f10_local9.name .. "_1"
	f10_local10.name = f10_local10.name .. "_2"
	local f10_local11 = Lobby.Actions.TimeDelay( 1000 )
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

Lobby.Process.MergePublicGameLobby = function ( f14_arg0 )
	Lobby.Matchmaking.SetupMatchmakingQuery( f14_arg0, Lobby.Matchmaking.SearchMode.LOBBY_MERGE )
	Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionStatus.SESSION_STATUS_IDLE )
	local f14_local0 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionStatus.SESSION_STATUS_MERGE )
	end
	
	local f14_local1 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionStatus.SESSION_STATUS_IDLE )
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
		Lobby.Merge.Complete()
		Lobby.Matchmaking.ClearSearchInfo()
	end
	
	local f14_local2 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionStatus.SESSION_STATUS_IDLE )
		Lobby.Merge.Complete()
	end
	
	local f14_local3 = Lobby.Actions.ExecuteScript( f14_local0 )
	local f14_local4 = Lobby.Actions.QoSJoinSearchResults( f14_arg0, Lobby.Actions.SearchForLobby( f14_arg0 ) )
	local f14_local5 = Lobby.Actions.ExecuteScript( f14_local1 )
	local f14_local6 = Lobby.Actions.ExecuteScript( f14_local2 )
	local f14_local7 = Lobby.Actions.SearchForLobby( f14_arg0 )
	local f14_local8 = Lobby.Actions.SearchForLobby( f14_arg0 )
	local f14_local9 = Lobby.Actions.QoSJoinSearchResults( f14_arg0, f14_local7 )
	local f14_local10 = Lobby.Actions.QoSJoinSearchResults( f14_arg0, f14_local8 )
	local f14_local11 = Lobby.Actions.TimeDelay( 1000 )
	f14_local7.name = f14_local7.name .. "_1"
	f14_local8.name = f14_local8.name .. "_2"
	f14_local9.name = f14_local9.name .. "_1"
	f14_local10.name = f14_local10.name .. "_2"
	local f14_local12 = {
		head = f14_local3,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f14_local3, f14_local7 )
	Lobby.Process.AddActions( f14_local7, f14_local9, f14_local11, f14_local6 )
	Lobby.Process.AddActions( f14_local9, f14_local5, f14_local11, f14_local6 )
	Lobby.Process.AddActions( f14_local11, f14_local8, f14_local8, f14_local6 )
	Lobby.Process.AddActions( f14_local8, f14_local10, f14_local6, f14_local6 )
	Lobby.Process.AddActions( f14_local10, f14_local5, f14_local6, f14_local6 )
	return f14_local12
end

Lobby.Process.JoinSystemlink = function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3, f18_arg4 )
	local f18_local0 = Lobby.Actions.OpenSpinner()
	local f18_local1 = Lobby.Actions.CloseSpinner()
	local f18_local2 = Lobby.Actions.JoinHost( f18_arg0, f18_arg1, f18_arg2, f18_arg3, f18_arg4 )
	local f18_local3 = Lobby.Actions.CloseSpinner()
	Lobby.Process.ForceAction( f18_local3, Lobby.Actions.ErrorPopup( f18_local2 ) )
	local f18_local4 = {
		head = f18_local0,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f18_local0, f18_local2 )
	Lobby.Process.AddActions( f18_local2, f18_local1, f18_local3, f18_local3 )
	return f18_local4
end

Lobby.Process.Join = function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
	local f19_local0 = 0
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f19_local0 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
	else
		f19_local0 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	end
	local f19_local1 = function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local f19_local2 = function ()
		return Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	
	local f19_local3 = function ()
		LobbyVM.ErrorShutdown( {
			controller = f19_arg0,
			signoutUsers = false
		} )
	end
	
	local f19_local4 = Lobby.Process.ReloadPrivateLobby( f19_arg0, Engine.GetLobbyNetworkMode() )
	local f19_local5 = Lobby.Actions.LobbySettings( f19_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f19_local6 = Lobby.Actions.UpdateUI( f19_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f19_local7 = Lobby.Process.ReloadPrivateLobby( f19_arg0, Engine.GetLobbyNetworkMode() )
	local f19_local8 = Lobby.Actions.LobbySettings( f19_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f19_local9 = Lobby.Actions.UpdateUI( f19_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f19_local10 = Lobby.Actions.OpenSpinner()
	local f19_local11 = Lobby.Actions.CloseSpinner()
	local f19_local12 = Lobby.Actions.CloseSpinner()
	local f19_local13 = Lobby.Actions.CloseSpinner()
	f19_local13.name = f19_local13.name .. "Error"
	local f19_local14 = Lobby.Actions.CloseSpinner()
	f19_local14.name = f19_local14.name .. "NeedsFirstTimeFlowPreCheck"
	local f19_local15 = Lobby.Actions.CloseSpinner()
	f19_local15.name = f19_local15.name .. "NeedsFirstTimeFlow"
	local f19_local16 = Lobby.Actions.ExecuteScript( f19_local1 )
	local f19_local17 = Lobby.Actions.ExecuteScript( f19_local3 )
	local f19_local18 = Lobby.Actions.LeaveWithParty( 3000 )
	local f19_local19 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f19_local20 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f19_local21 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f19_local22 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f19_local23 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f19_local24 = Lobby.Actions.LobbyInfoProbe( f19_arg0, {
		xuid = f19_arg1
	} )
	local f19_local25 = Lobby.Actions.CheckFirstTimeFlowRequirements( f19_arg0, f19_local24 )
	local f19_local26 = Lobby.Actions.ShowFirstTimeFlowError( f19_local25 )
	local f19_local27 = Lobby.Actions.LobbyInfoProbe( f19_arg0, {
		xuid = f19_arg1
	} )
	local f19_local28 = Lobby.Actions.CheckFirstTimeFlowRequirements( f19_arg0, f19_local27 )
	local f19_local29 = Lobby.Actions.ShowFirstTimeFlowError( f19_local28 )
	local f19_local30 = Lobby.Actions.LobbyJoinXUIDExt( f19_arg0, f19_arg2, f19_local27, Enum.LobbyType.LOBBY_TYPE_COUNT )
	local f19_local31 = Lobby.Actions.ExecuteScriptWithReturn( f19_local2, true, false, false )
	local f19_local32 = Lobby.Actions.LobbyInfoProbe( f19_arg0, {
		xuid = f19_arg1
	} )
	local f19_local33 = Lobby.Actions.LobbyJoinXUIDExt( f19_arg0, f19_arg2, f19_local27, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f19_local34 = Lobby.Actions.LobbyHostStart( f19_arg0, Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyMode.LOBBY_MODE_INVALID, f19_local0 )
	local f19_local35 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f19_local36 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f19_local37 = false
	if Engine.GetLobbyUIScreen() ~= LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id then
		f19_local37 = true
	end
	local f19_local38 = Lobby.Actions.ForceLobbyUIScreen( f19_arg0, LobbyData.UITargets.UI_MPLOBBYONLINE.id )
	local f19_local39 = Lobby.Actions.ErrorPopup( f19_local30 )
	local f19_local40 = f19_local16
	local f19_local41 = Engine.IsInGame()
	local f19_local42 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f19_local43 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f19_local44 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f19_local45 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f19_local46 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f19_local47 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f19_local48 = f19_local44 and f19_arg3 == LuaEnums.LEAVE_WITH_PARTY.WITH
	local f19_local49 = false
	local f19_local50 = false
	local f19_local51 = false
	local f19_local52 = false
	if f19_local41 == true then
		f19_local49 = true
		f19_local50 = true
		f19_local51 = true
		if f19_local44 == true then
			f19_local52 = true
		end
	elseif f19_local43 == true then
		f19_local49 = true
		f19_local50 = true
		if f19_local48 == false then
			f19_local51 = true
			if f19_local44 == true then
				f19_local52 = true
			end
		end
	elseif f19_local42 == true then
		if f19_local48 == false then
			f19_local51 = true
			if f19_local44 == true then
				f19_local52 = true
			end
		end
	else
		f19_local49 = true
		f19_local50 = true
		f19_local51 = true
		f19_local52 = true
	end
	local f19_local53 = f19_local4.head
	Lobby.Process.ForceAction( f19_local4.tail, f19_local5 )
	Lobby.Process.ForceAction( f19_local5, f19_local6 )
	Lobby.Process.ForceAction( f19_local6, f19_local39 )
	local f19_local54 = {
		head = f19_local10,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f19_local10, f19_local24, f19_local13, f19_local13 )
	Lobby.Process.AddActions( f19_local24, f19_local25, f19_local13, f19_local13 )
	Lobby.Process.AddActions( f19_local25, f19_local16, f19_local14, f19_local14 )
	local f19_local55 = false
	if f19_local43 == true and f19_local48 == true then
		Lobby.Process.AddActions( f19_local40, f19_local18, f19_local53, f19_local53 )
		f19_local40 = f19_local18
		f19_local55 = true
	end
	if f19_local49 == true then
		Lobby.Process.AddActions( f19_local40, f19_local21, f19_local53, f19_local53 )
		f19_local40 = f19_local21
		f19_local55 = true
	end
	if f19_local50 == true then
		Lobby.Process.AddActions( f19_local40, f19_local22, f19_local53, f19_local53 )
		f19_local40 = f19_local22
		f19_local55 = true
	end
	if f19_local51 == true then
		Lobby.Process.AddActions( f19_local40, f19_local23, f19_local53, f19_local53 )
		f19_local40 = f19_local23
		f19_local37 = true
		f19_local55 = true
	end
	if f19_local52 == true then
		Lobby.Process.AddActions( f19_local40, f19_local20, f19_local53, f19_local53 )
		f19_local40 = f19_local20
		f19_local37 = true
		f19_local55 = true
	end
	if f19_local44 == false or f19_local52 == true then
		Lobby.Process.AddActions( f19_local40, f19_local34, f19_local53, f19_local53 )
		Lobby.Process.AddActions( f19_local34, f19_local35, f19_local53, f19_local53 )
		f19_local40 = f19_local35
		f19_local37 = true
		f19_local55 = true
	end
	if f19_local51 == true then
		Lobby.Process.AddActions( f19_local40, f19_local36, f19_local53, f19_local53 )
		f19_local40 = f19_local36
		f19_local37 = true
		f19_local55 = true
	end
	local f19_local56 = Lobby.Actions.IsConditionTrue( not f19_local37 )
	local f19_local57 = Lobby.Actions.IsConditionTrue( f19_local55 )
	Lobby.Process.AddActions( f19_local40, f19_local27, f19_local53, f19_local53 )
	Lobby.Process.AddActions( f19_local27, f19_local28, f19_local53, f19_local53 )
	Lobby.Process.AddActions( f19_local28, f19_local30, f19_local15, f19_local15 )
	Lobby.Process.AddActions( f19_local30, f19_local31, f19_local56, f19_local53 )
	Lobby.Process.AddActions( f19_local56, f19_local38, f19_local57, f19_local53 )
	Lobby.Process.AddActions( f19_local57, f19_local53, f19_local13, f19_local53 )
	Lobby.Process.AddActions( f19_local31, f19_local32, f19_local11, f19_local11 )
	Lobby.Process.AddActions( f19_local32, f19_local33, f19_local53, f19_local53 )
	Lobby.Process.AddActions( f19_local33, f19_local11, f19_local11, f19_local11 )
	Lobby.Process.ForceAction( f19_local38, f19_local13 )
	Lobby.Process.ForceAction( f19_local13, f19_local39 )
	Lobby.Process.ForceAction( f19_local14, f19_local26 )
	Lobby.Process.ForceAction( f19_local15, f19_local7.head )
	Lobby.Process.ForceAction( f19_local7.tail, f19_local8 )
	Lobby.Process.ForceAction( f19_local8, f19_local9 )
	Lobby.Process.ForceAction( f19_local9, f19_local29 )
	return f19_local54
end

Lobby.Process.ReloadPrivateLobby = function ( f23_arg0, f23_arg1 )
	local f23_local0 = Lobby.Actions.ExecuteScript( function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end )
	local f23_local1 = Lobby.Actions.OpenSpinner()
	local f23_local2 = Lobby.Actions.CloseSpinner()
	local f23_local3 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f23_local4 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f23_local5 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f23_local6 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f23_local7 = Lobby.Actions.SetNetworkMode( f23_arg0, f23_arg1 )
	local f23_local8 = Lobby.Actions.LobbyHostStart( f23_arg0, Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyMode.LOBBY_MODE_INVALID, LobbyData.UITargets.UI_MODESELECT.maxClients )
	local f23_local9 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f23_local10 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f23_local11 = {
		head = f23_local1,
		tail = f23_local2,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f23_local1, f23_local0 )
	Lobby.Process.AddActions( f23_local0, f23_local3 )
	Lobby.Process.AddActions( f23_local3, f23_local4 )
	Lobby.Process.AddActions( f23_local4, f23_local5 )
	Lobby.Process.AddActions( f23_local5, f23_local6 )
	Lobby.Process.AddActions( f23_local6, f23_local7 )
	if f23_arg1 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		local f23_local12 = Lobby.Actions.SignUserInToLive( f23_arg0 )
		Lobby.Process.AddActions( f23_local7, f23_local12 )
		Lobby.Process.AddActions( f23_local12, f23_local8 )
	else
		Lobby.Process.AddActions( f23_local7, f23_local8 )
	end
	Lobby.Process.AddActions( f23_local8, f23_local9 )
	Lobby.Process.AddActions( f23_local9, f23_local10 )
	Lobby.Process.AddActions( f23_local10, f23_local2 )
	return f23_local11
end

Lobby.Process.Recover = function ( f25_arg0, f25_arg1 )
	local f25_local0 = Engine.GetLobbyUIScreen()
	if f25_arg1 ~= nil then
		f25_local0 = f25_arg1
	end
	local f25_local1 = LobbyData:UITargetFromId( f25_local0 )
	if f25_local1.id == LobbyData.UITargets.UI_MAIN.id then
		return nil
	end
	local f25_local2 = f25_local1.errTarget.backTarget
	local f25_local3 = f25_local1.errTarget
	local f25_local4 = Lobby.Actions.OpenSpinner( nil, true )
	local f25_local5 = Lobby.Actions.LobbyInRecovery()
	local f25_local6 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f25_local7 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f25_local8 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f25_local9 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f25_local10 = Lobby.Actions.LobbySettings( f25_arg0, f25_local3 )
	local f25_local11 = Lobby.Actions.ForceLobbyUIScreen( f25_arg0, f25_local3.id )
	local f25_local12 = Lobby.Actions.UpdateUI( f25_arg0, f25_local3 )
	local f25_local13 = Lobby.Actions.ArenaErrorShutdown( f25_arg0 )
	local f25_local14 = Lobby.Actions.SetDefaultArenaPlaylist( f25_arg0 )
	local f25_local15 = Lobby.Actions.RunPlaylistRules( f25_arg0 )
	local f25_local16 = Lobby.Actions.CloseSpinner()
	local f25_local17 = {
		head = f25_local4,
		interrupt = Lobby.Interrupt.NONE,
		tail = nil,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f25_local4, f25_local5 )
	Lobby.Process.AddActions( f25_local5, f25_local8 )
	Lobby.Process.AddActions( f25_local8, f25_local9 )
	Lobby.Process.AddActions( f25_local9, f25_local6 )
	Lobby.Process.AddActions( f25_local6, f25_local7 )
	Lobby.Process.AddActions( f25_local7, f25_local10 )
	local f25_local18 = f25_local10
	if f25_local2 ~= nil then
		if f25_local2.lobbyType == Enum.LobbyType.LOBBY_TYPE_INVALID then
			
		elseif f25_local2.lobbyType ~= f25_local3.lobbyType then
			local f25_local19 = Lobby.Actions.LobbyHostStart( f25_arg0, f25_local2.mainMode, f25_local2.lobbyType, f25_local2.lobbyMode, f25_local2.maxClients )
			local f25_local20 = Lobby.Actions.LobbyHostAddPrimary( f25_local2.lobbyType )
			local f25_local21 = Lobby.Actions.LobbyClientStart( f25_local2.lobbyType )
			f25_local19.name = f25_local19.name .. "_1"
			Lobby.Process.AddActions( f25_local18, f25_local19 )
			Lobby.Process.AddActions( f25_local19, f25_local20 )
			Lobby.Process.AddActions( f25_local20, f25_local21 )
			f25_local18 = f25_local21
		elseif f25_local3.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_CP or f25_local3.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
			local f25_local19 = Lobby.Actions.LobbyHostStart( f25_arg0, f25_local3.mainMode, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f25_local3.lobbyMode, f25_local3.maxClients )
			local f25_local20 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			local f25_local21 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			f25_local19.name = f25_local19.name .. "_4"
			Lobby.Process.AddActions( f25_local18, f25_local19 )
			Lobby.Process.AddActions( f25_local19, f25_local20 )
			Lobby.Process.AddActions( f25_local20, f25_local21 )
			f25_local18 = f25_local21
		end
	end
	if f25_local3.lobbyType == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
		local f25_local19 = Lobby.Actions.LobbyHostStart( f25_arg0, f25_local3.mainMode, f25_local3.lobbyType, f25_local3.lobbyMode, f25_local3.maxClients )
		local f25_local20 = Lobby.Actions.LobbyHostAddPrimary( f25_local3.lobbyType )
		local f25_local21 = Lobby.Actions.LobbyClientStart( f25_local3.lobbyType )
		f25_local19.name = f25_local19.name .. "_2"
		Lobby.Process.AddActions( f25_local18, f25_local19 )
		Lobby.Process.AddActions( f25_local19, f25_local20 )
		Lobby.Process.AddActions( f25_local20, f25_local21 )
		f25_local18 = f25_local21
	elseif f25_local3.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
		local f25_local19 = function ()
			Engine.SetLobbyMaxClients( f25_local3.lobbyType, Dvar.party_maxplayers:get() )
		end
		
		local f25_local20 = Lobby.Actions.LobbyHostStart( f25_arg0, f25_local3.mainMode, f25_local3.lobbyType, f25_local3.lobbyMode, f25_local3.maxClients )
		local f25_local21 = Lobby.Actions.LobbyInfoProbe( f25_arg0, {
			xuid = Engine.GetXUID64( f25_arg0 )
		} )
		local f25_local22 = Lobby.Actions.LobbyJoinXUID( f25_arg0, {
			xuid = Engine.GetXUID64( f25_arg0 )
		}, Enum.JoinType.JOIN_TYPE_PARTY )
		local f25_local23 = Lobby.Actions.LobbyVMCall( Lobby.Timer.HostingLobby, {
			controller = f25_arg0,
			lobbyType = f25_local3.lobbyType,
			mainMode = f25_local3.mainMode,
			lobbyTimerType = f25_local3.lobbyTimerType
		} )
		f25_local20.name = f25_local20.name .. "_3"
		local f25_local24 = Lobby.Actions.RunPlaylistSettings( f25_arg0 )
		local f25_local25 = Lobby.Actions.AdvertiseLobby( true )
		local f25_local26 = Lobby.Actions.ExecuteScript( f25_local19 )
		Lobby.Process.AddActions( f25_local18, f25_local20 )
		Lobby.Process.AddActions( f25_local20, f25_local21 )
		Lobby.Process.AddActions( f25_local21, f25_local22 )
		f25_local18 = f25_local22
		if f25_local3.lobbyMode == Enum.LobbyMode.LOBBY_MODE_PUBLIC or f25_local3.lobbyMode == Enum.LobbyMode.LOBBY_MODE_ARENA then
			Lobby.Process.AddActions( f25_local18, f25_local24 )
			Lobby.Process.AddActions( f25_local24, f25_local25 )
			Lobby.Process.AddActions( f25_local25, f25_local26 )
			f25_local18 = f25_local26
		end
		Lobby.Process.AddActions( f25_local18, f25_local23 )
		f25_local18 = f25_local23
	end
	if f25_local3.lobbyMode == Enum.LobbyMode.LOBBY_MODE_ARENA then
		Lobby.Process.AddActions( f25_local18, f25_local14 )
		Lobby.Process.AddActions( f25_local14, f25_local15 )
		f25_local18 = f25_local15
	end
	Lobby.Process.AddActions( f25_local18, f25_local13 )
	Lobby.Process.AddActions( f25_local13, f25_local11 )
	Lobby.Process.AddActions( f25_local11, f25_local12 )
	Lobby.Process.AddActions( f25_local12, f25_local16 )
	Lobby.Process.AddActions( f25_local16, nil )
	f25_local17.tail = f25_local16
	return f25_local17
end

Lobby.Process.ForceToMenu = function ( f27_arg0, f27_arg1, f27_arg2 )
	local f27_local0 = f27_arg1.isPrivate
	local f27_local1 = f27_arg1.mainMode
	local f27_local2 = f27_arg1.networkMode
	local f27_local3 = f27_arg1.maxClients
	local f27_local4 = Lobby.Actions.LobbySettings( f27_arg0, f27_arg1 )
	local f27_local5 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f27_local6 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f27_local7 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f27_local8 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f27_local9 = Lobby.Actions.ForceLobbyUIScreen( f27_arg0, f27_arg1.id )
	local f27_local10 = Lobby.Actions.UpdateUI( f27_arg0, f27_arg1 )
	local f27_local11 = {
		head = f27_local4,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f27_local4, f27_local7 )
	Lobby.Process.AddActions( f27_local7, f27_local8 )
	Lobby.Process.AddActions( f27_local8, f27_local5 )
	Lobby.Process.AddActions( f27_local5, f27_local6 )
	local f27_local12 = f27_local6
	if f27_local0 == true then
		local f27_local13 = Lobby.Actions.LobbyHostStart( f27_arg0, f27_local1, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f27_arg1.lobbyMode, f27_local3 )
		local f27_local14 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		local f27_local15 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		Lobby.Process.AddActions( f27_local8, f27_local13 )
		Lobby.Process.AddActions( f27_local13, f27_local14 )
		Lobby.Process.AddActions( f27_local14, f27_local15 )
		f27_local12 = f27_local15
	end
	Lobby.Process.AddActions( f27_local12, f27_local9 )
	Lobby.Process.AddActions( f27_local9, f27_local10 )
	if f27_arg2 ~= nil then
		Lobby.Process.AddActions( f27_local10, Lobby.Actions.ErrorPopupMsg( f27_arg2 ) )
	end
	return f27_local11
end

Lobby.Process.HostLeftNoMigrationCreatePrivateLobby = function ( f28_arg0, f28_arg1, f28_arg2 )
	local f28_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f28_local1 = Lobby.Actions.OpenSpinner( true )
	local f28_local2 = Lobby.Actions.CloseSpinner()
	local f28_local3 = Lobby.Actions.CloseSpinner()
	local f28_local4 = Lobby.Actions.LobbyHostStart( f28_arg0, f28_arg1, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f28_local0.lobbyMode, f28_arg2 )
	local f28_local5 = Lobby.Actions.LobbyHostAddPrimary( f28_local4.lobbyType )
	local f28_local6 = Lobby.Actions.LobbyClientStart( f28_local4.lobbyType )
	local f28_local7 = Lobby.Actions.ErrorPopup( f28_local4 )
	local f28_local8 = {
		head = f28_local1,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f28_local1, f28_local4 )
	Lobby.Process.AddActions( f28_local4, f28_local5 )
	Lobby.Process.AddActions( f28_local5, f28_local6 )
	Lobby.Process.AddActions( f28_local6, f28_local2 )
	Lobby.Process.AddActions( f28_local3, f28_local7 )
	return f28_local8
end

Lobby.Process.PromoteClientToPrivateLobbyHost = function ( f29_arg0, f29_arg1, f29_arg2, f29_arg3, f29_arg4, f29_arg5, f29_arg6, f29_arg7, f29_arg8 )
	local f29_local0 = Engine.GetLobbyUIScreen()
	local f29_local1 = LobbyData:UITargetFromId( f29_local0 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Process.PromoteClientToPrivateLobbyHost: menuId(" .. f29_local0 .. "), lobbyType(" .. f29_arg2 .. "), mainMode(" .. f29_arg1 .. "), lobbyTimerType(" .. f29_local1.lobbyTimerType .. ").\n" )
	local f29_local2 = Lobby.Actions.PromoteToHostDone( f29_arg0, f29_arg2, f29_arg8, f29_arg7 )
	local f29_local3 = Lobby.Actions.LobbyHostStartMigratedInfo( f29_arg0, f29_arg1, f29_arg2, f29_arg3, f29_arg4, f29_arg5 )
	local f29_local4 = {
		head = f29_local2,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	if Engine.IsLobbyHost( f29_arg2 ) == false then
		f29_local4.head = f29_local3
		Lobby.Process.AddActions( f29_local3, f29_local2 )
		Lobby.Process.AddActions( f29_local2, nil )
	end
	return f29_local4
end

Lobby.Process.TransferDataFromClientModuleToHostModule = function ()
	local f30_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	for f30_local4, f30_local5 in ipairs( f30_local0.sessionClients ) do
		Engine.LobbyHostAssignMapVoteToClient( f30_local5.xuid, f30_local5.mapVote )
		Engine.LobbyHostAssignTeamToClient( f30_local5.xuid, f30_local5.team )
	end
end

Lobby.Process.PromoteClientToGameLobbyHost = function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3, f31_arg4, f31_arg5, f31_arg6, f31_arg7, f31_arg8 )
	local f31_local0 = Engine.GetLobbyUIScreen()
	local f31_local1 = LobbyData:UITargetFromId( f31_local0 )
	local f31_local2, f31_local3 = Engine.GetGameLobbyStatusInfo()
	local f31_local4 = function ()
		if not Engine.IsInGame() and f31_local1.lobbyTimerType ~= LuaEnums.TIMER_TYPE.INVALID then
			Lobby.Timer.HostingLobby( {
				controller = f31_arg0,
				lobbyType = f31_arg2,
				mainMode = f31_arg1,
				lobbyTimerType = f31_local1.lobbyTimerType,
				status = f31_local2,
				statusValue = f31_local3
			} )
		end
		if f31_local1.isAdvertised == true then
			local f32_local0
			if f31_arg3 ~= Enum.LobbyMode.LOBBY_MODE_PUBLIC and f31_arg3 ~= Enum.LobbyMode.LOBBY_MODE_ARENA then
				f32_local0 = false
			else
				f32_local0 = true
			end
			Engine.QoSProbeListenerEnable( f31_arg2, f32_local0 )
		end
		Lobby.Process.TransferDataFromClientModuleToHostModule()
	end
	
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Process.PromoteClientToGameLobbyHost: menuId(" .. f31_local0 .. "), lobbyType(" .. f31_arg2 .. "), mainMode(" .. f31_arg1 .. "), lobbyTimerType(" .. f31_local1.lobbyTimerType .. ").\n" )
	local f31_local5 = Lobby.Actions.PromoteToHostDone( f31_arg0, f31_arg2, f31_arg8, f31_arg7 )
	local f31_local6 = Lobby.Actions.LobbyHostStartMigratedInfo( f31_arg0, f31_arg1, f31_arg2, f31_arg3, f31_arg4, f31_arg5 )
	local f31_local7 = Lobby.Actions.ExecuteScript( f31_local4 )
	local f31_local8 = Lobby.Actions.AdvertiseLobby( true )
	local f31_local9 = Lobby.Actions.LobbySettings( f31_arg0, f31_local1 )
	local f31_local10 = Lobby.Actions.RunPlaylistSettings( f31_arg0 )
	local f31_local11 = {
		head = f31_local5,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	if Engine.IsLobbyHost( f31_arg2 ) == false then
		f31_local11.head = f31_local6
		Lobby.Process.AddActions( f31_local6, f31_local5 )
		Lobby.Process.AddActions( f31_local5, f31_local7 )
		if f31_local1.isAdvertised == true then
			Lobby.Process.AddActions( f31_local7, f31_local8 )
			if f31_arg7 == false then
				Lobby.Process.AddActions( f31_local8, f31_local9 )
			end
		end
	end
	return f31_local11
end

Lobby.Process.PromoteClientToHost = function ( f33_arg0, f33_arg1, f33_arg2, f33_arg3, f33_arg4, f33_arg5, f33_arg6, f33_arg7, f33_arg8 )
	local f33_local0 = nil
	if f33_arg2 == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
		f33_local0 = Lobby.Process.PromoteClientToPrivateLobbyHost( f33_arg0, f33_arg1, f33_arg2, f33_arg3, f33_arg4, f33_arg5, f33_arg6, f33_arg7, f33_arg8 )
	elseif f33_arg2 == Enum.LobbyType.LOBBY_TYPE_GAME then
		f33_local0 = Lobby.Process.PromoteClientToGameLobbyHost( f33_arg0, f33_arg1, f33_arg2, f33_arg3, f33_arg4, f33_arg5, f33_arg6, f33_arg7, f33_arg8 )
	end
	return f33_local0
end

Lobby.Process.LocalClientLeave = function ( f34_arg0, f34_arg1 )
	local f34_local0 = Lobby.Actions.LobbyLocalClientLeave( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f34_arg0, f34_arg1 )
	local f34_local1 = Lobby.Actions.LobbyLocalClientLeave( Enum.LobbyType.LOBBY_TYPE_GAME, f34_arg0, f34_arg1 )
	local f34_local2 = {
		head = f34_local1,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = false
	}
	Lobby.Process.AddActions( f34_local1, f34_local0 )
	Lobby.Process.AddActions( f34_local0 )
	return f34_local2
end

Lobby.Process.LeaveWithParty = function ( f35_arg0, f35_arg1, f35_arg2 )
	local f35_local0 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f35_local1 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f35_local2 = nil
	if f35_arg0 ~= Enum.LobbyModule.LOBBY_MODULE_CLIENT or f35_local1 == false then
		return 
	end
	local f35_local3 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f35_local4 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f35_local5 = Lobby.Actions.CloseSpinner()
	local f35_local6 = {
		head = f35_local3,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = true
	}
	local f35_local7 = f35_local3
	if f35_local0 == true then
		Lobby.Process.ForceAction( f35_local7, f35_local4 )
		f35_local7 = f35_local4
	end
	Lobby.Process.ForceAction( f35_local7, f35_local5 )
	return f35_local6
end

Lobby.Process.ManagePartyLeave = function ( f36_arg0 )
	if LobbyData:UITargetFromId( LobbyData.GetLobbyNav() ) == nil then
		error( "LobbyVM: No menu called '" .. currentMenu .. "' found." )
	end
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) == false or Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) == false then
		return nil
	else
		local f36_local0 = Engine.GetLobbyMainMode()
		local f36_local1 = Engine.GetLobbyMode( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		local f36_local2 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		local f36_local3 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		local f36_local4 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		local f36_local5 = Lobby.Actions.LobbyHostStart( f36_arg0, f36_local0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f36_local1, f36_local2 )
		local f36_local6 = Lobby.Actions.LobbyHostAddPrimary( f36_local5.lobbyType )
		local f36_local7 = Lobby.Actions.LobbyClientStart( f36_local5.lobbyType )
		local f36_local8 = {
			head = f36_local3,
			interrupt = Lobby.Interrupt.NONE,
			force = true,
			cancellable = true
		}
		Lobby.Process.AddActions( f36_local3, f36_local4 )
		Lobby.Process.AddActions( f36_local4, f36_local5 )
		Lobby.Process.AddActions( f36_local5, f36_local6 )
		Lobby.Process.AddActions( f36_local6, f36_local7 )
		return f36_local8
	end
end

Lobby.Process.NonFatalError = function ( f37_arg0 )
	local f37_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	return {
		head = Lobby.Actions.ErrorPopupMsg( f37_arg0 ),
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
end

Lobby.Process.FatalError = function ( f38_arg0 )
	local f38_local0 = Engine.GetPrimaryController()
	local f38_local1 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f38_local2 = LobbyData.UITargets.UI_MAIN
	local f38_local3 = Lobby.Actions.OpenSpinner()
	local f38_local4 = Lobby.Actions.CloseSpinner()
	local f38_local5 = Lobby.Actions.LobbySettings( f38_local0, f38_local2 )
	local f38_local6 = Lobby.Actions.UpdateUI( f38_local0, f38_local2 )
	local f38_local7 = Lobby.Actions.ErrorPopupMsg( f38_arg0 )
	local f38_local8 = {
		head = f38_local3,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f38_local3, f38_local5 )
	Lobby.Process.AddActions( f38_local5, f38_local5 )
	Lobby.Process.AddActions( f38_local5, f38_local6 )
	Lobby.Process.AddActions( f38_local6, f38_local4 )
	Lobby.Process.AddActions( f38_local4, f38_local7 )
	return f38_local8
end

Lobby.Process.Reset = function ()
	local f39_local0 = Engine.GetPrimaryController()
	local f39_local1 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f39_local2 = LobbyData.UITargets.UI_MAIN
	local f39_local3 = Lobby.Actions.CloseSpinner()
	local f39_local4 = Lobby.Actions.CloseSpinner()
	local f39_local5 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f39_local6 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f39_local7 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f39_local8 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f39_local9 = Lobby.Actions.LobbySettings( f39_local0, f39_local2 )
	local f39_local10 = Lobby.Actions.UpdateUI( f39_local0, f39_local2 )
	local f39_local11 = {
		head = f39_local8,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f39_local3, f39_local8 )
	Lobby.Process.AddActions( f39_local8, f39_local7 )
	Lobby.Process.AddActions( f39_local7, f39_local6 )
	Lobby.Process.AddActions( f39_local6, f39_local5 )
	Lobby.Process.AddActions( f39_local5, f39_local9 )
	Lobby.Process.AddActions( f39_local9, f39_local10 )
	Lobby.Process.AddActions( f39_local10, f39_local4 )
	return f39_local11
end

Lobby.Process.DevmapClient = function ( f40_arg0 )
	local f40_local0 = LobbyData.UITargets.UI_MODESELECT
	local f40_local1 = f40_local0.mainMode
	local f40_local2 = f40_local0.lobbyType
	local f40_local3 = f40_local0.lobbyMode
	local f40_local4 = f40_local0.maxClients
	local f40_local5 = Lobby.Actions.LobbySettings( f40_arg0, f40_local0, nil, true )
	local f40_local6 = Lobby.Actions.UpdateUI( f40_arg0, f40_local0 )
	local f40_local7 = Lobby.Actions.SetNetworkMode( f40_arg0, Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN )
	local f40_local8 = Lobby.Actions.LobbyHostStart( f40_arg0, f40_local1, f40_local2, f40_local3, f40_local4 )
	local f40_local9 = Lobby.Actions.LobbyHostAddPrimary( f40_local2 )
	local f40_local10 = Lobby.Actions.LobbyClientStart( f40_local2 )
	local f40_local11 = {
		head = f40_local5,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f40_local5, f40_local6 )
	Lobby.Process.AddActions( f40_local6, f40_local7 )
	Lobby.Process.AddActions( f40_local7, f40_local8 )
	Lobby.Process.AddActions( f40_local8, f40_local9 )
	Lobby.Process.AddActions( f40_local9, f40_local10 )
	return f40_local11
end

Lobby.Process.Devmap = function ( f41_arg0, f41_arg1 )
	local f41_local0 = LobbyData.UITargets.UI_MODESELECT
	local f41_local1 = LobbyData.UITargets.UI_MAIN
	if f41_arg1 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		f41_local1 = LobbyData.UITargets.UI_CPLOBBYLANGAME
	elseif f41_arg1 == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		f41_local1 = LobbyData.UITargets.UI_ZMLOBBYLANGAME
	elseif f41_arg1 == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		f41_local1 = LobbyData.UITargets.UI_MPLOBBYLANGAME
	end
	if f41_local1 == LobbyData.UITargets.UI_CPLOBBYLANGAME and Dvar.ui_gametype:get() == "cpzm" then
		f41_local1 = LobbyData.UITargets.UI_CP2LOBBYLANGAME
	end
	local f41_local2 = f41_local0.mainMode
	local f41_local3 = f41_local0.lobbyType
	local f41_local4 = f41_local0.lobbyMode
	local f41_local5 = f41_local0.maxClients
	local f41_local6 = f41_local1.mainMode
	local f41_local7 = f41_local1.lobbyType
	local f41_local8 = f41_local1.lobbyMode
	local f41_local9 = f41_local1.maxClients
	local f41_local10 = Lobby.Actions.LobbySettings( f41_arg0, f41_local1, nil, true )
	local f41_local11 = Lobby.Actions.UpdateUI( f41_arg0, f41_local1 )
	local f41_local12 = Lobby.Actions.SetNetworkMode( f41_arg0, Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN )
	local f41_local13 = Lobby.Actions.LobbyHostStart( f41_arg0, f41_local2, f41_local3, f41_local4, f41_local5 )
	local f41_local14 = Lobby.Actions.LobbyHostAddPrimary( f41_local3 )
	local f41_local15 = Lobby.Actions.LobbyClientStart( f41_local3 )
	local f41_local16 = Lobby.Actions.LobbyHostStart( f41_arg0, f41_local6, f41_local7, f41_local8, f41_local9 )
	local f41_local17 = Lobby.Actions.LobbyHostAddPrimary( f41_local7 )
	local f41_local18 = Lobby.Actions.LobbyClientStart( f41_local7 )
	local f41_local19 = Lobby.Actions.SetGameAndTypeMapName( f41_arg0, lobbyType, Dvar.ui_gametype:get(), Dvar.ui_mapname:get() )
	local f41_local20 = {
		head = f41_local10,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f41_local10, f41_local11 )
	Lobby.Process.AddActions( f41_local11, f41_local12 )
	Lobby.Process.AddActions( f41_local12, f41_local13 )
	Lobby.Process.AddActions( f41_local13, f41_local14 )
	Lobby.Process.AddActions( f41_local14, f41_local15 )
	Lobby.Process.AddActions( f41_local15, f41_local16 )
	Lobby.Process.AddActions( f41_local16, f41_local19 )
	Lobby.Process.AddActions( f41_local19, f41_local17 )
	if Dvar.splitscreen:get() == true and Dvar.splitscreen_playerCount:get() > 1 then
		local f41_local21 = Lobby.Actions.LobbyHostAddLocal( 1, f41_local7 )
		Lobby.Process.AddActions( f41_local17, f41_local21 )
		Lobby.Process.AddActions( f41_local21, f41_local18 )
	else
		Lobby.Process.AddActions( f41_local17, f41_local18 )
	end
	return f41_local20
end

Lobby.Process.PrimaryControllerSignedIn = function ( f42_arg0 )
	local f42_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f42_local1 = LobbyData.UITargets.UI_MAIN
	local f42_local2 = Lobby.Actions.OpenSpinner()
	local f42_local3 = Lobby.Actions.CloseSpinner()
	local f42_local4 = Lobby.Actions.LobbySettings( f42_arg0, f42_local1 )
	local f42_local5 = Lobby.Actions.UpdateUI( f42_arg0, f42_local1 )
	local f42_local6 = Lobby.Actions.SignUserInToLive( f42_arg0 )
	local f42_local7 = Lobby.Actions.ErrorPopupMsg( "XBOXLIVE_SIGNEDOUT" )
	local f42_local8 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f42_local9 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f42_local10 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f42_local11 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f42_local12 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f42_local13 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f42_local14 = {
		head = f42_local2,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f42_local2, f42_local4 )
	Lobby.Process.AddActions( f42_local4, f42_local5 )
	Lobby.Process.AddActions( f42_local5, f42_local12 )
	Lobby.Process.AddActions( f42_local12, f42_local13 )
	Lobby.Process.AddActions( f42_local13, f42_local10 )
	Lobby.Process.AddActions( f42_local10, f42_local11 )
	Lobby.Process.AddActions( f42_local11, f42_local6 )
	Lobby.Process.AddActions( f42_local6, f42_local3 )
	Lobby.Process.AddActions( f42_local3, f42_local7 )
	return f42_local14
end

Lobby.Process.PrimaryControllerSignedOut = function ( f43_arg0 )
	local f43_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f43_local1 = LobbyData.UITargets.UI_MAIN
	local f43_local2 = Lobby.Actions.OpenSpinner()
	local f43_local3 = Lobby.Actions.CloseSpinner()
	local f43_local4 = Lobby.Actions.LobbySettings( f43_arg0, f43_local1 )
	local f43_local5 = Lobby.Actions.UpdateUI( f43_arg0, f43_local1 )
	local f43_local6 = Lobby.Actions.SignUserOutOfLive( f43_arg0 )
	local f43_local7 = Lobby.Actions.ErrorPopupMsg( "XBOXLIVE_SIGNEDOUT" )
	local f43_local8 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f43_local9 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f43_local10 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f43_local11 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f43_local12 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f43_local13 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f43_local14 = {
		head = f43_local2,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f43_local2, f43_local4 )
	Lobby.Process.AddActions( f43_local4, f43_local5 )
	Lobby.Process.AddActions( f43_local5, f43_local12 )
	Lobby.Process.AddActions( f43_local12, f43_local13 )
	Lobby.Process.AddActions( f43_local13, f43_local10 )
	Lobby.Process.AddActions( f43_local10, f43_local11 )
	Lobby.Process.AddActions( f43_local11, f43_local6 )
	Lobby.Process.AddActions( f43_local6, f43_local3 )
	Lobby.Process.AddActions( f43_local3, f43_local7 )
	return f43_local14
end

Lobby.Process.ReAdvertiseLobby = function ( f44_arg0 )
	local f44_local0 = function ()
		Dvar.lobbyAdvertiseDirty:set( true )
	end
	
	local f44_local1 = Lobby.Actions.AdvertiseLobby( false )
	local f44_local2 = Lobby.Actions.AdvertiseLobby( true )
	local f44_local3 = Lobby.Actions.ExecuteScript( f44_local0 )
	local f44_local4 = {
		head = f44_local1,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = false
	}
	Lobby.Process.ForceAction( f44_local1, f44_local2 )
	Lobby.Process.ForceAction( f44_local2, f44_local3 )
	return f44_local4
end

