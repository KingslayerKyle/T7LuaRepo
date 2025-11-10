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
	local f15_local0 = 0
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f15_local0 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
	else
		f15_local0 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	end
	local f15_local1 = function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local f15_local2 = function ()
		return Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	
	local f15_local3 = function ()
		LobbyVM.ErrorShutdown( {
			controller = f15_arg0,
			signoutUsers = false
		} )
	end
	
	local f15_local4 = Lobby.Process.ReloadPrivateLobby( f15_arg0, Engine.GetLobbyNetworkMode() )
	local f15_local5 = Lobby.Actions.LobbySettings( f15_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f15_local6 = Lobby.Actions.UpdateUI( f15_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f15_local7 = Lobby.Process.ReloadPrivateLobby( f15_arg0, Engine.GetLobbyNetworkMode() )
	local f15_local8 = Lobby.Actions.LobbySettings( f15_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f15_local9 = Lobby.Actions.UpdateUI( f15_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f15_local10 = Lobby.Actions.OpenSpinner()
	local f15_local11 = Lobby.Actions.CloseSpinner()
	local f15_local12 = Lobby.Actions.CloseSpinner()
	local f15_local13 = Lobby.Actions.CloseSpinner()
	f15_local13.name = f15_local13.name .. "Error"
	local f15_local14 = Lobby.Actions.CloseSpinner()
	f15_local14.name = f15_local14.name .. "NeedsFirstTimeFlowPreCheck"
	local f15_local15 = Lobby.Actions.CloseSpinner()
	f15_local15.name = f15_local15.name .. "NeedsFirstTimeFlow"
	local f15_local16 = Lobby.Actions.ExecuteScript( f15_local1 )
	local f15_local17 = Lobby.Actions.ExecuteScript( f15_local3 )
	local f15_local18 = Lobby.Actions.LeaveWithParty( 3000 )
	local f15_local19 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f15_local20 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f15_local21 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f15_local22 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f15_local23 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f15_local24 = Lobby.Actions.LobbyInfoProbe( f15_arg0, {
		xuid = f15_arg1
	} )
	local f15_local25 = Lobby.Actions.CheckFirstTimeFlowRequirements( f15_arg0, f15_local24 )
	local f15_local26 = Lobby.Actions.ShowFirstTimeFlowError( f15_local25 )
	local f15_local27 = Lobby.Actions.LobbyInfoProbe( f15_arg0, {
		xuid = f15_arg1
	} )
	local f15_local28 = Lobby.Actions.CheckFirstTimeFlowRequirements( f15_arg0, f15_local27 )
	local f15_local29 = Lobby.Actions.ShowFirstTimeFlowError( f15_local28 )
	local f15_local30 = Lobby.Actions.LobbyJoinXUIDExt( f15_arg0, f15_arg2, f15_local27, Enum.LobbyType.LOBBY_TYPE_COUNT )
	local f15_local31 = Lobby.Actions.ExecuteScriptWithReturn( f15_local2, true, false, false )
	local f15_local32 = Lobby.Actions.LobbyInfoProbe( f15_arg0, {
		xuid = f15_arg1
	} )
	local f15_local33 = Lobby.Actions.LobbyJoinXUIDExt( f15_arg0, f15_arg2, f15_local27, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f15_local34 = Lobby.Actions.LobbyHostStart( f15_arg0, Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyMode.LOBBY_MODE_INVALID, f15_local0 )
	local f15_local35 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f15_local36 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f15_local37 = Lobby.Actions.ErrorPopup( f15_local30 )
	local f15_local38 = f15_local16
	local f15_local39 = Engine.IsInGame()
	local f15_local40 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f15_local41 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f15_local42 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f15_local43 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f15_local44 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f15_local45 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f15_local46 = f15_local42 and f15_arg3 == LuaEnums.LEAVE_WITH_PARTY.WITH
	local f15_local47 = false
	local f15_local48 = false
	local f15_local49 = false
	local f15_local50 = false
	if f15_local39 == true then
		f15_local47 = true
		f15_local48 = true
		f15_local49 = true
		if f15_local42 == true then
			f15_local50 = true
		end
	elseif f15_local41 == true then
		f15_local47 = true
		f15_local48 = true
		if f15_local46 == false then
			f15_local49 = true
			if f15_local42 == true then
				f15_local50 = true
			end
		end
	elseif f15_local40 == true then
		if f15_local46 == false then
			f15_local49 = true
			if f15_local42 == true then
				f15_local50 = true
			end
		end
	else
		f15_local47 = true
		f15_local48 = true
		f15_local49 = true
		f15_local50 = true
	end
	local f15_local51 = f15_local4.head
	Lobby.Process.ForceAction( f15_local4.tail, f15_local5 )
	Lobby.Process.ForceAction( f15_local5, f15_local6 )
	Lobby.Process.ForceAction( f15_local6, f15_local37 )
	local f15_local52 = {
		head = f15_local10,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f15_local10, f15_local24, f15_local13, f15_local13 )
	Lobby.Process.AddActions( f15_local24, f15_local25, f15_local13, f15_local13 )
	Lobby.Process.AddActions( f15_local25, f15_local16, f15_local14, f15_local14 )
	if f15_local41 == true and f15_local46 == true then
		Lobby.Process.AddActions( f15_local38, f15_local18, f15_local51, f15_local51 )
		f15_local38 = f15_local18
	end
	if f15_local47 == true then
		Lobby.Process.AddActions( f15_local38, f15_local21, f15_local51, f15_local51 )
		f15_local38 = f15_local21
	end
	if f15_local48 == true then
		Lobby.Process.AddActions( f15_local38, f15_local22, f15_local51, f15_local51 )
		f15_local38 = f15_local22
	end
	if f15_local49 == true then
		Lobby.Process.AddActions( f15_local38, f15_local23, f15_local51, f15_local51 )
		f15_local38 = f15_local23
	end
	if f15_local50 == true then
		Lobby.Process.AddActions( f15_local38, f15_local20, f15_local51, f15_local51 )
		f15_local38 = f15_local20
	end
	if f15_local42 == false or f15_local50 == true then
		Lobby.Process.AddActions( f15_local38, f15_local34, f15_local51, f15_local51 )
		Lobby.Process.AddActions( f15_local34, f15_local35, f15_local51, f15_local51 )
		f15_local38 = f15_local35
	end
	if f15_local49 == true then
		Lobby.Process.AddActions( f15_local38, f15_local36, f15_local51, f15_local51 )
		f15_local38 = f15_local36
	end
	Lobby.Process.AddActions( f15_local38, f15_local27, f15_local51, f15_local51 )
	Lobby.Process.AddActions( f15_local27, f15_local28, f15_local51, f15_local51 )
	Lobby.Process.AddActions( f15_local28, f15_local30, f15_local15, f15_local15 )
	Lobby.Process.AddActions( f15_local30, f15_local31, f15_local51, f15_local51 )
	Lobby.Process.AddActions( f15_local31, f15_local32, f15_local11, f15_local11 )
	Lobby.Process.AddActions( f15_local32, f15_local33, f15_local51, f15_local51 )
	Lobby.Process.AddActions( f15_local33, f15_local11, f15_local11, f15_local11 )
	Lobby.Process.ForceAction( f15_local13, f15_local37 )
	Lobby.Process.ForceAction( f15_local14, f15_local26 )
	Lobby.Process.ForceAction( f15_local15, f15_local7.head )
	Lobby.Process.ForceAction( f15_local7.tail, f15_local8 )
	Lobby.Process.ForceAction( f15_local8, f15_local9 )
	Lobby.Process.ForceAction( f15_local9, f15_local29 )
	return f15_local52
end

Lobby.Process.ReloadPrivateLobby = function ( f19_arg0, f19_arg1 )
	local f19_local0 = Lobby.Actions.ExecuteScript( function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end )
	local f19_local1 = Lobby.Actions.OpenSpinner()
	local f19_local2 = Lobby.Actions.CloseSpinner()
	local f19_local3 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f19_local4 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f19_local5 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f19_local6 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f19_local7 = Lobby.Actions.SetNetworkMode( f19_arg0, f19_arg1 )
	local f19_local8 = Lobby.Actions.LobbyHostStart( f19_arg0, Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyMode.LOBBY_MODE_INVALID, LobbyData.UITargets.UI_MODESELECT.maxClients )
	local f19_local9 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f19_local10 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f19_local11 = {
		head = f19_local1,
		tail = f19_local2,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f19_local1, f19_local0 )
	Lobby.Process.AddActions( f19_local0, f19_local3 )
	Lobby.Process.AddActions( f19_local3, f19_local4 )
	Lobby.Process.AddActions( f19_local4, f19_local5 )
	Lobby.Process.AddActions( f19_local5, f19_local6 )
	Lobby.Process.AddActions( f19_local6, f19_local7 )
	if f19_arg1 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		local f19_local12 = Lobby.Actions.SignUserInToLive( f19_arg0 )
		Lobby.Process.AddActions( f19_local7, f19_local12 )
		Lobby.Process.AddActions( f19_local12, f19_local8 )
	else
		Lobby.Process.AddActions( f19_local7, f19_local8 )
	end
	Lobby.Process.AddActions( f19_local8, f19_local9 )
	Lobby.Process.AddActions( f19_local9, f19_local10 )
	Lobby.Process.AddActions( f19_local10, f19_local2 )
	return f19_local11
end

Lobby.Process.Recover = function ( f21_arg0 )
	local f21_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	if f21_local0.id == LobbyData.UITargets.UI_MAIN.id then
		return nil
	end
	local f21_local1 = f21_local0.errTarget.backTarget
	local f21_local2 = f21_local0.errTarget
	local f21_local3 = Lobby.Actions.LobbyInRecovery()
	local f21_local4 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f21_local5 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f21_local6 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f21_local7 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f21_local8 = Lobby.Actions.LobbySettings( f21_arg0, f21_local2 )
	local f21_local9 = Lobby.Actions.ForceLobbyUIScreen( f21_arg0, f21_local2.id )
	local f21_local10 = Lobby.Actions.UpdateUI( f21_arg0, f21_local2 )
	local f21_local11 = Lobby.Actions.SetDefaultArenaPlaylist( f21_arg0 )
	local f21_local12 = Lobby.Actions.RunPlaylistRules( f21_arg0 )
	local f21_local13 = Lobby.Actions.CloseSpinner()
	local f21_local14 = {
		head = f21_local3,
		interrupt = Lobby.Interrupt.NONE,
		tail = nil,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f21_local3, f21_local6 )
	Lobby.Process.AddActions( f21_local6, f21_local7 )
	Lobby.Process.AddActions( f21_local7, f21_local4 )
	Lobby.Process.AddActions( f21_local4, f21_local5 )
	Lobby.Process.AddActions( f21_local5, f21_local8 )
	local f21_local15 = f21_local8
	if f21_local1 ~= nil then
		if f21_local1.lobbyType == Enum.LobbyType.LOBBY_TYPE_INVALID then
			
		elseif f21_local1.lobbyType ~= f21_local2.lobbyType then
			local f21_local16 = Lobby.Actions.LobbyHostStart( f21_arg0, f21_local1.mainMode, f21_local1.lobbyType, f21_local1.lobbyMode, f21_local1.maxClients )
			local f21_local17 = Lobby.Actions.LobbyHostAddPrimary( f21_local1.lobbyType )
			local f21_local18 = Lobby.Actions.LobbyClientStart( f21_local1.lobbyType )
			f21_local16.name = f21_local16.name .. "_1"
			Lobby.Process.AddActions( f21_local15, f21_local16 )
			Lobby.Process.AddActions( f21_local16, f21_local17 )
			Lobby.Process.AddActions( f21_local17, f21_local18 )
			f21_local15 = f21_local18
		elseif f21_local2.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_CP or f21_local2.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
			local f21_local16 = Lobby.Actions.LobbyHostStart( f21_arg0, f21_local2.mainMode, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f21_local2.lobbyMode, f21_local2.maxClients )
			local f21_local17 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			local f21_local18 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			f21_local16.name = f21_local16.name .. "_4"
			Lobby.Process.AddActions( f21_local15, f21_local16 )
			Lobby.Process.AddActions( f21_local16, f21_local17 )
			Lobby.Process.AddActions( f21_local17, f21_local18 )
			f21_local15 = f21_local18
		end
	end
	if f21_local2.lobbyType == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
		local f21_local16 = Lobby.Actions.LobbyHostStart( f21_arg0, f21_local2.mainMode, f21_local2.lobbyType, f21_local2.lobbyMode, f21_local2.maxClients )
		local f21_local17 = Lobby.Actions.LobbyHostAddPrimary( f21_local2.lobbyType )
		local f21_local18 = Lobby.Actions.LobbyClientStart( f21_local2.lobbyType )
		f21_local16.name = f21_local16.name .. "_2"
		Lobby.Process.AddActions( f21_local15, f21_local16 )
		Lobby.Process.AddActions( f21_local16, f21_local17 )
		Lobby.Process.AddActions( f21_local17, f21_local18 )
		f21_local15 = f21_local18
	elseif f21_local2.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
		local f21_local16 = function ()
			Engine.SetLobbyMaxClients( f21_local2.lobbyType, Dvar.party_maxplayers:get() )
		end
		
		local f21_local17 = Lobby.Actions.LobbyHostStart( f21_arg0, f21_local2.mainMode, f21_local2.lobbyType, f21_local2.lobbyMode, f21_local2.maxClients )
		local f21_local18 = Lobby.Actions.LobbyInfoProbe( f21_arg0, {
			xuid = Engine.GetXUID64( f21_arg0 )
		} )
		local f21_local19 = Lobby.Actions.LobbyJoinXUID( f21_arg0, {
			xuid = Engine.GetXUID64( f21_arg0 )
		}, Enum.JoinType.JOIN_TYPE_PARTY )
		local f21_local20 = Lobby.Actions.LobbyVMCall( Lobby.Timer.HostingLobby, {
			controller = f21_arg0,
			lobbyType = f21_local2.lobbyType,
			mainMode = f21_local2.mainMode,
			lobbyTimerType = f21_local2.lobbyTimerType
		} )
		f21_local17.name = f21_local17.name .. "_3"
		local f21_local21 = Lobby.Actions.RunPlaylistSettings( f21_arg0 )
		local f21_local22 = Lobby.Actions.AdvertiseLobby( true )
		local f21_local23 = Lobby.Actions.ExecuteScript( f21_local16 )
		Lobby.Process.AddActions( f21_local15, f21_local17 )
		Lobby.Process.AddActions( f21_local17, f21_local18 )
		Lobby.Process.AddActions( f21_local18, f21_local19 )
		f21_local15 = f21_local19
		if f21_local2.lobbyMode == Enum.LobbyMode.LOBBY_MODE_PUBLIC or f21_local2.lobbyMode == Enum.LobbyMode.LOBBY_MODE_ARENA then
			Lobby.Process.AddActions( f21_local15, f21_local21 )
			Lobby.Process.AddActions( f21_local21, f21_local22 )
			Lobby.Process.AddActions( f21_local22, f21_local23 )
			f21_local15 = f21_local23
		end
		Lobby.Process.AddActions( f21_local15, f21_local20 )
		f21_local15 = f21_local20
	end
	if f21_local2.lobbyMode == Enum.LobbyMode.LOBBY_MODE_ARENA then
		Lobby.Process.AddActions( f21_local15, f21_local11 )
		Lobby.Process.AddActions( f21_local11, f21_local12 )
		f21_local15 = f21_local12
	end
	Lobby.Process.AddActions( f21_local15, f21_local9 )
	Lobby.Process.AddActions( f21_local9, f21_local10 )
	Lobby.Process.AddActions( f21_local10, f21_local13 )
	Lobby.Process.AddActions( f21_local13, nil )
	f21_local14.tail = f21_local13
	return f21_local14
end

Lobby.Process.ForceToMenu = function ( f23_arg0, f23_arg1, f23_arg2 )
	local f23_local0 = f23_arg1.isPrivate
	local f23_local1 = f23_arg1.mainMode
	local f23_local2 = f23_arg1.networkMode
	local f23_local3 = f23_arg1.maxClients
	local f23_local4 = Lobby.Actions.LobbySettings( f23_arg0, f23_arg1 )
	local f23_local5 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f23_local6 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f23_local7 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f23_local8 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f23_local9 = Lobby.Actions.ForceLobbyUIScreen( f23_arg0, f23_arg1.id )
	local f23_local10 = Lobby.Actions.UpdateUI( f23_arg0, f23_arg1 )
	local f23_local11 = {
		head = f23_local4,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f23_local4, f23_local7 )
	Lobby.Process.AddActions( f23_local7, f23_local8 )
	Lobby.Process.AddActions( f23_local8, f23_local5 )
	Lobby.Process.AddActions( f23_local5, f23_local6 )
	local f23_local12 = f23_local6
	if f23_local0 == true then
		local f23_local13 = Lobby.Actions.LobbyHostStart( f23_arg0, f23_local1, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f23_arg1.lobbyMode, f23_local3 )
		local f23_local14 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		local f23_local15 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		Lobby.Process.AddActions( f23_local8, f23_local13 )
		Lobby.Process.AddActions( f23_local13, f23_local14 )
		Lobby.Process.AddActions( f23_local14, f23_local15 )
		f23_local12 = f23_local15
	end
	Lobby.Process.AddActions( f23_local12, f23_local9 )
	Lobby.Process.AddActions( f23_local9, f23_local10 )
	if f23_arg2 ~= nil then
		Lobby.Process.AddActions( f23_local10, Lobby.Actions.ErrorPopupMsg( f23_arg2 ) )
	end
	return f23_local11
end

Lobby.Process.HostLeftNoMigrationCreatePrivateLobby = function ( f24_arg0, f24_arg1, f24_arg2 )
	local f24_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f24_local1 = Lobby.Actions.OpenSpinner( true )
	local f24_local2 = Lobby.Actions.CloseSpinner()
	local f24_local3 = Lobby.Actions.CloseSpinner()
	local f24_local4 = Lobby.Actions.LobbyHostStart( f24_arg0, f24_arg1, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f24_local0.lobbyMode, f24_arg2 )
	local f24_local5 = Lobby.Actions.LobbyHostAddPrimary( f24_local4.lobbyType )
	local f24_local6 = Lobby.Actions.LobbyClientStart( f24_local4.lobbyType )
	local f24_local7 = Lobby.Actions.ErrorPopup( f24_local4 )
	local f24_local8 = {
		head = f24_local1,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f24_local1, f24_local4 )
	Lobby.Process.AddActions( f24_local4, f24_local5 )
	Lobby.Process.AddActions( f24_local5, f24_local6 )
	Lobby.Process.AddActions( f24_local6, f24_local2 )
	Lobby.Process.AddActions( f24_local3, f24_local7 )
	return f24_local8
end

Lobby.Process.PromoteClientToPrivateLobbyHost = function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3, f25_arg4, f25_arg5, f25_arg6, f25_arg7, f25_arg8 )
	local f25_local0 = Engine.GetLobbyUIScreen()
	local f25_local1 = LobbyData:UITargetFromId( f25_local0 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Process.PromoteClientToPrivateLobbyHost: menuId(" .. f25_local0 .. "), lobbyType(" .. f25_arg2 .. "), mainMode(" .. f25_arg1 .. "), lobbyTimerType(" .. f25_local1.lobbyTimerType .. ").\n" )
	local f25_local2 = Lobby.Actions.PromoteToHostDone( f25_arg0, f25_arg2, f25_arg8, f25_arg7 )
	local f25_local3 = Lobby.Actions.LobbyHostStartMigratedInfo( f25_arg0, f25_arg1, f25_arg2, f25_arg3, f25_arg4, f25_arg5 )
	local f25_local4 = {
		head = f25_local2,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	if Engine.IsLobbyHost( f25_arg2 ) == false then
		f25_local4.head = f25_local3
		Lobby.Process.AddActions( f25_local3, f25_local2 )
		Lobby.Process.AddActions( f25_local2, nil )
	end
	return f25_local4
end

Lobby.Process.TransferDataFromClientModuleToHostModule = function ()
	local f26_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	for f26_local4, f26_local5 in ipairs( f26_local0.sessionClients ) do
		Engine.LobbyHostAssignMapVoteToClient( f26_local5.xuid, f26_local5.mapVote )
		Engine.LobbyHostAssignTeamToClient( f26_local5.xuid, f26_local5.team )
	end
end

Lobby.Process.PromoteClientToGameLobbyHost = function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3, f27_arg4, f27_arg5, f27_arg6, f27_arg7, f27_arg8 )
	local f27_local0 = Engine.GetLobbyUIScreen()
	local f27_local1 = LobbyData:UITargetFromId( f27_local0 )
	local f27_local2, f27_local3 = Engine.GetGameLobbyStatusInfo()
	local f27_local4 = function ()
		if not Engine.IsInGame() and f27_local1.lobbyTimerType ~= LuaEnums.TIMER_TYPE.INVALID then
			Lobby.Timer.HostingLobby( {
				controller = f27_arg0,
				lobbyType = f27_arg2,
				mainMode = f27_arg1,
				lobbyTimerType = f27_local1.lobbyTimerType,
				status = f27_local2,
				statusValue = f27_local3
			} )
		end
		if f27_local1.isAdvertised == true then
			local f28_local0
			if f27_arg3 ~= Enum.LobbyMode.LOBBY_MODE_PUBLIC and f27_arg3 ~= Enum.LobbyMode.LOBBY_MODE_ARENA then
				f28_local0 = false
			else
				f28_local0 = true
			end
			Engine.QoSProbeListenerEnable( f27_arg2, f28_local0 )
		end
		Lobby.Process.TransferDataFromClientModuleToHostModule()
	end
	
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Process.PromoteClientToGameLobbyHost: menuId(" .. f27_local0 .. "), lobbyType(" .. f27_arg2 .. "), mainMode(" .. f27_arg1 .. "), lobbyTimerType(" .. f27_local1.lobbyTimerType .. ").\n" )
	local f27_local5 = Lobby.Actions.PromoteToHostDone( f27_arg0, f27_arg2, f27_arg8, f27_arg7 )
	local f27_local6 = Lobby.Actions.LobbyHostStartMigratedInfo( f27_arg0, f27_arg1, f27_arg2, f27_arg3, f27_arg4, f27_arg5 )
	local f27_local7 = Lobby.Actions.ExecuteScript( f27_local4 )
	local f27_local8 = Lobby.Actions.AdvertiseLobby( true )
	local f27_local9 = Lobby.Actions.LobbySettings( f27_arg0, f27_local1 )
	local f27_local10 = Lobby.Actions.RunPlaylistSettings( f27_arg0 )
	local f27_local11 = {
		head = f27_local5,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	if Engine.IsLobbyHost( f27_arg2 ) == false then
		f27_local11.head = f27_local6
		Lobby.Process.AddActions( f27_local6, f27_local5 )
		Lobby.Process.AddActions( f27_local5, f27_local7 )
		if f27_local1.isAdvertised == true then
			Lobby.Process.AddActions( f27_local7, f27_local8 )
			if f27_arg7 == false then
				Lobby.Process.AddActions( f27_local8, f27_local9 )
			end
		end
	end
	return f27_local11
end

Lobby.Process.PromoteClientToHost = function ( f29_arg0, f29_arg1, f29_arg2, f29_arg3, f29_arg4, f29_arg5, f29_arg6, f29_arg7, f29_arg8 )
	local f29_local0 = nil
	if f29_arg2 == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
		f29_local0 = Lobby.Process.PromoteClientToPrivateLobbyHost( f29_arg0, f29_arg1, f29_arg2, f29_arg3, f29_arg4, f29_arg5, f29_arg6, f29_arg7, f29_arg8 )
	elseif f29_arg2 == Enum.LobbyType.LOBBY_TYPE_GAME then
		f29_local0 = Lobby.Process.PromoteClientToGameLobbyHost( f29_arg0, f29_arg1, f29_arg2, f29_arg3, f29_arg4, f29_arg5, f29_arg6, f29_arg7, f29_arg8 )
	end
	return f29_local0
end

Lobby.Process.LocalClientLeave = function ( f30_arg0, f30_arg1 )
	local f30_local0 = Lobby.Actions.LobbyLocalClientLeave( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f30_arg0, f30_arg1 )
	local f30_local1 = Lobby.Actions.LobbyLocalClientLeave( Enum.LobbyType.LOBBY_TYPE_GAME, f30_arg0, f30_arg1 )
	local f30_local2 = {
		head = f30_local1,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = false
	}
	Lobby.Process.AddActions( f30_local1, f30_local0 )
	Lobby.Process.AddActions( f30_local0 )
	return f30_local2
end

Lobby.Process.LeaveWithParty = function ( f31_arg0, f31_arg1, f31_arg2 )
	local f31_local0 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f31_local1 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f31_local2 = nil
	if f31_arg0 ~= Enum.LobbyModule.LOBBY_MODULE_CLIENT or f31_local1 == false then
		return 
	end
	local f31_local3 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f31_local4 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f31_local5 = {
		head = f31_local3,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	if f31_local0 == true then
		Lobby.Process.AddActions( f31_local3, f31_local4 )
	end
	return f31_local5
end

Lobby.Process.ManagePartyLeave = function ( f32_arg0 )
	if LobbyData:UITargetFromId( LobbyData.GetLobbyNav() ) == nil then
		error( "LobbyVM: No menu called '" .. currentMenu .. "' found." )
	end
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) == false or Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) == false then
		return nil
	else
		local f32_local0 = Engine.GetLobbyMainMode()
		local f32_local1 = Engine.GetLobbyMode( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		local f32_local2 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		local f32_local3 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		local f32_local4 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		local f32_local5 = Lobby.Actions.LobbyHostStart( f32_arg0, f32_local0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f32_local1, f32_local2 )
		local f32_local6 = Lobby.Actions.LobbyHostAddPrimary( f32_local5.lobbyType )
		local f32_local7 = Lobby.Actions.LobbyClientStart( f32_local5.lobbyType )
		local f32_local8 = {
			head = f32_local3,
			interrupt = Lobby.Interrupt.NONE,
			force = true,
			cancellable = true
		}
		Lobby.Process.AddActions( f32_local3, f32_local4 )
		Lobby.Process.AddActions( f32_local4, f32_local5 )
		Lobby.Process.AddActions( f32_local5, f32_local6 )
		Lobby.Process.AddActions( f32_local6, f32_local7 )
		return f32_local8
	end
end

Lobby.Process.NonFatalError = function ( f33_arg0 )
	local f33_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	return {
		head = Lobby.Actions.ErrorPopupMsg( f33_arg0 ),
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
end

Lobby.Process.FatalError = function ( f34_arg0 )
	local f34_local0 = Engine.GetPrimaryController()
	local f34_local1 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f34_local2 = LobbyData.UITargets.UI_MAIN
	local f34_local3 = Lobby.Actions.OpenSpinner()
	local f34_local4 = Lobby.Actions.CloseSpinner()
	local f34_local5 = Lobby.Actions.LobbySettings( f34_local0, f34_local2 )
	local f34_local6 = Lobby.Actions.UpdateUI( f34_local0, f34_local2 )
	local f34_local7 = Lobby.Actions.ErrorPopupMsg( f34_arg0 )
	local f34_local8 = {
		head = f34_local3,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f34_local3, f34_local5 )
	Lobby.Process.AddActions( f34_local5, f34_local5 )
	Lobby.Process.AddActions( f34_local5, f34_local6 )
	Lobby.Process.AddActions( f34_local6, f34_local4 )
	Lobby.Process.AddActions( f34_local4, f34_local7 )
	return f34_local8
end

Lobby.Process.Reset = function ()
	local f35_local0 = Engine.GetPrimaryController()
	local f35_local1 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f35_local2 = LobbyData.UITargets.UI_MAIN
	local f35_local3 = Lobby.Actions.CloseSpinner()
	local f35_local4 = Lobby.Actions.CloseSpinner()
	local f35_local5 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f35_local6 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f35_local7 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f35_local8 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f35_local9 = Lobby.Actions.LobbySettings( f35_local0, f35_local2 )
	local f35_local10 = Lobby.Actions.UpdateUI( f35_local0, f35_local2 )
	local f35_local11 = {
		head = f35_local8,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f35_local3, f35_local8 )
	Lobby.Process.AddActions( f35_local8, f35_local7 )
	Lobby.Process.AddActions( f35_local7, f35_local6 )
	Lobby.Process.AddActions( f35_local6, f35_local5 )
	Lobby.Process.AddActions( f35_local5, f35_local9 )
	Lobby.Process.AddActions( f35_local9, f35_local10 )
	Lobby.Process.AddActions( f35_local10, f35_local4 )
	return f35_local11
end

Lobby.Process.DevmapClient = function ( f36_arg0 )
	local f36_local0 = LobbyData.UITargets.UI_MODESELECT
	local f36_local1 = f36_local0.mainMode
	local f36_local2 = f36_local0.lobbyType
	local f36_local3 = f36_local0.lobbyMode
	local f36_local4 = f36_local0.maxClients
	local f36_local5 = Lobby.Actions.LobbySettings( f36_arg0, f36_local0, nil, true )
	local f36_local6 = Lobby.Actions.UpdateUI( f36_arg0, f36_local0 )
	local f36_local7 = Lobby.Actions.SetNetworkMode( f36_arg0, Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN )
	local f36_local8 = Lobby.Actions.LobbyHostStart( f36_arg0, f36_local1, f36_local2, f36_local3, f36_local4 )
	local f36_local9 = Lobby.Actions.LobbyHostAddPrimary( f36_local2 )
	local f36_local10 = Lobby.Actions.LobbyClientStart( f36_local2 )
	local f36_local11 = {
		head = f36_local5,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f36_local5, f36_local6 )
	Lobby.Process.AddActions( f36_local6, f36_local7 )
	Lobby.Process.AddActions( f36_local7, f36_local8 )
	Lobby.Process.AddActions( f36_local8, f36_local9 )
	Lobby.Process.AddActions( f36_local9, f36_local10 )
	return f36_local11
end

Lobby.Process.Devmap = function ( f37_arg0, f37_arg1 )
	local f37_local0 = LobbyData.UITargets.UI_MODESELECT
	local f37_local1 = LobbyData.UITargets.UI_MAIN
	if f37_arg1 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		f37_local1 = LobbyData.UITargets.UI_CPLOBBYLANGAME
	elseif f37_arg1 == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		f37_local1 = LobbyData.UITargets.UI_ZMLOBBYLANGAME
	elseif f37_arg1 == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		f37_local1 = LobbyData.UITargets.UI_MPLOBBYLANGAME
	end
	if f37_local1 == LobbyData.UITargets.UI_CPLOBBYLANGAME and Dvar.ui_gametype:get() == "cpzm" then
		f37_local1 = LobbyData.UITargets.UI_CP2LOBBYLANGAME
	end
	local f37_local2 = f37_local0.mainMode
	local f37_local3 = f37_local0.lobbyType
	local f37_local4 = f37_local0.lobbyMode
	local f37_local5 = f37_local0.maxClients
	local f37_local6 = f37_local1.mainMode
	local f37_local7 = f37_local1.lobbyType
	local f37_local8 = f37_local1.lobbyMode
	local f37_local9 = f37_local1.maxClients
	local f37_local10 = Lobby.Actions.LobbySettings( f37_arg0, f37_local1, nil, true )
	local f37_local11 = Lobby.Actions.UpdateUI( f37_arg0, f37_local1 )
	local f37_local12 = Lobby.Actions.SetNetworkMode( f37_arg0, Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN )
	local f37_local13 = Lobby.Actions.LobbyHostStart( f37_arg0, f37_local2, f37_local3, f37_local4, f37_local5 )
	local f37_local14 = Lobby.Actions.LobbyHostAddPrimary( f37_local3 )
	local f37_local15 = Lobby.Actions.LobbyClientStart( f37_local3 )
	local f37_local16 = Lobby.Actions.LobbyHostStart( f37_arg0, f37_local6, f37_local7, f37_local8, f37_local9 )
	local f37_local17 = Lobby.Actions.LobbyHostAddPrimary( f37_local7 )
	local f37_local18 = Lobby.Actions.LobbyClientStart( f37_local7 )
	local f37_local19 = Lobby.Actions.SetGameAndTypeMapName( f37_arg0, lobbyType, Dvar.ui_gametype:get(), Dvar.ui_mapname:get() )
	local f37_local20 = {
		head = f37_local10,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f37_local10, f37_local11 )
	Lobby.Process.AddActions( f37_local11, f37_local12 )
	Lobby.Process.AddActions( f37_local12, f37_local13 )
	Lobby.Process.AddActions( f37_local13, f37_local14 )
	Lobby.Process.AddActions( f37_local14, f37_local15 )
	Lobby.Process.AddActions( f37_local15, f37_local16 )
	Lobby.Process.AddActions( f37_local16, f37_local19 )
	Lobby.Process.AddActions( f37_local19, f37_local17 )
	if Dvar.splitscreen:get() == true and Dvar.splitscreen_playerCount:get() > 1 then
		local f37_local21 = Lobby.Actions.LobbyHostAddLocal( 1, f37_local7 )
		Lobby.Process.AddActions( f37_local17, f37_local21 )
		Lobby.Process.AddActions( f37_local21, f37_local18 )
	else
		Lobby.Process.AddActions( f37_local17, f37_local18 )
	end
	return f37_local20
end

Lobby.Process.PrimaryControllerSignedIn = function ( f38_arg0 )
	local f38_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f38_local1 = LobbyData.UITargets.UI_MAIN
	local f38_local2 = Lobby.Actions.OpenSpinner()
	local f38_local3 = Lobby.Actions.CloseSpinner()
	local f38_local4 = Lobby.Actions.LobbySettings( f38_arg0, f38_local1 )
	local f38_local5 = Lobby.Actions.UpdateUI( f38_arg0, f38_local1 )
	local f38_local6 = Lobby.Actions.SignUserInToLive( f38_arg0 )
	local f38_local7 = Lobby.Actions.ErrorPopupMsg( XBOXLIVE_SIGNEDOUT )
	local f38_local8 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f38_local9 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f38_local10 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f38_local11 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f38_local12 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f38_local13 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f38_local14 = {
		head = f38_local2,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f38_local2, f38_local4 )
	Lobby.Process.AddActions( f38_local4, f38_local5 )
	Lobby.Process.AddActions( f38_local5, f38_local12 )
	Lobby.Process.AddActions( f38_local12, f38_local13 )
	Lobby.Process.AddActions( f38_local13, f38_local10 )
	Lobby.Process.AddActions( f38_local10, f38_local11 )
	Lobby.Process.AddActions( f38_local11, f38_local6 )
	Lobby.Process.AddActions( f38_local6, f38_local3 )
	Lobby.Process.AddActions( f38_local3, f38_local7 )
	return f38_local14
end

Lobby.Process.PrimaryControllerSignedOut = function ( f39_arg0 )
	local f39_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f39_local1 = LobbyData.UITargets.UI_MAIN
	local f39_local2 = Lobby.Actions.OpenSpinner()
	local f39_local3 = Lobby.Actions.CloseSpinner()
	local f39_local4 = Lobby.Actions.LobbySettings( f39_arg0, f39_local1 )
	local f39_local5 = Lobby.Actions.UpdateUI( f39_arg0, f39_local1 )
	local f39_local6 = Lobby.Actions.SignUserOutOfLive( f39_arg0 )
	local f39_local7 = Lobby.Actions.ErrorPopupMsg( XBOXLIVE_SIGNEDOUT )
	local f39_local8 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f39_local9 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f39_local10 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f39_local11 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f39_local12 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f39_local13 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f39_local14 = {
		head = f39_local2,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f39_local2, f39_local4 )
	Lobby.Process.AddActions( f39_local4, f39_local5 )
	Lobby.Process.AddActions( f39_local5, f39_local12 )
	Lobby.Process.AddActions( f39_local12, f39_local13 )
	Lobby.Process.AddActions( f39_local13, f39_local10 )
	Lobby.Process.AddActions( f39_local10, f39_local11 )
	Lobby.Process.AddActions( f39_local11, f39_local6 )
	Lobby.Process.AddActions( f39_local6, f39_local3 )
	Lobby.Process.AddActions( f39_local3, f39_local7 )
	return f39_local14
end

Lobby.Process.ReAdvertiseLobby = function ( f40_arg0 )
	local f40_local0 = function ()
		Dvar.lobbyAdvertiseDirty:set( true )
	end
	
	local f40_local1 = Lobby.Actions.AdvertiseLobby( false )
	local f40_local2 = Lobby.Actions.AdvertiseLobby( true )
	local f40_local3 = Lobby.Actions.ExecuteScript( f40_local0 )
	local f40_local4 = {
		head = f40_local1,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = false
	}
	Lobby.Process.ForceAction( f40_local1, f40_local2 )
	Lobby.Process.ForceAction( f40_local2, f40_local3 )
	return f40_local4
end

