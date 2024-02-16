-- e045aaa72fd2c553025beb5b0986667c
-- This hash is used for caching, delete to decompile the file again

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

Lobby.Process.CreateDedicatedModsLobby = function ( f8_arg0, f8_arg1 )
	local f8_local0 = function ()
		Engine.QoSProbeListenerEnable( f8_arg1.lobbyType, true )
		Engine.SetDvar( "live_dedicatedReady", 1 )
		Engine.RunPlaylistRules( f8_arg0 )
		Engine.RunPlaylistSettings( f8_arg0 )
		Lobby.Timer.HostingLobby( {
			controller = f8_arg0,
			lobbyType = f8_arg1.lobbyType,
			mainMode = f8_arg1.mainMode,
			lobbyTimerType = f8_arg1.lobbyTimerType
		} )
	end
	
	Engine.SetPlaylistID( Dvar.sv_playlist:get() )
	local f8_local1 = Lobby.Actions.ExecuteScript( function ()
		Lobby.ProcessNavigate.SetupLobbyMapAndGameType( f8_arg0, f8_arg1 )
	end )
	local f8_local2 = Lobby.Actions.SetNetworkMode( f8_arg0, Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
	local f8_local3 = Lobby.Actions.LobbySettings( f8_arg0, f8_arg1 )
	local f8_local4 = Lobby.Actions.UpdateUI( f8_arg0, f8_arg1 )
	local f8_local5 = Lobby.Actions.LobbyHostStart( f8_arg0, f8_arg1.mainMode, f8_arg1.lobbyType, f8_arg1.lobbyMode, f8_arg1.maxClients )
	local f8_local6 = Lobby.Actions.AdvertiseLobby( true )
	local f8_local7 = Lobby.Actions.ExecuteScript( f8_local0 )
	local f8_local8 = {
		head = f8_local2,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f8_local2, f8_local3 )
	Lobby.Process.AddActions( f8_local3, f8_local1 )
	Lobby.Process.AddActions( f8_local1, f8_local4 )
	Lobby.Process.AddActions( f8_local4, f8_local5 )
	Lobby.Process.AddActions( f8_local5, f8_local6 )
	Lobby.Process.AddActions( f8_local6, f8_local7 )
	Lobby.Process.AddActions( f8_local7, nil )
	return f8_local8
end

Lobby.Process.CreateDedicatedLobby = function ( f11_arg0, f11_arg1 )
	local f11_local0 = function ()
		if Dvar.tu9_hostPrivateSessions:get() == true and Engine.LobbyHostSetPrivateSession and f11_arg1.id == LobbyData.UITargets.UI_MPLOBBYONLINEARENAGAME.id then
			Engine.LobbyHostSetPrivateSession( f11_arg1.lobbyType, true )
		end
		Engine.QoSProbeListenerEnable( f11_arg1.lobbyType, true )
		Engine.SetDvar( "live_dedicatedReady", 1 )
		Engine.RunPlaylistRules( f11_arg0 )
		Engine.RunPlaylistSettings( f11_arg0 )
		Lobby.Timer.HostingLobby( {
			controller = f11_arg0,
			lobbyType = f11_arg1.lobbyType,
			mainMode = f11_arg1.mainMode,
			lobbyTimerType = f11_arg1.lobbyTimerType
		} )
	end
	
	Engine.SetPlaylistID( Dvar.sv_playlist:get() )
	local f11_local1 = Lobby.Actions.ExecuteScript( function ()
		Lobby.ProcessNavigate.SetupLobbyMapAndGameType( f11_arg0, f11_arg1 )
	end )
	local f11_local2 = Lobby.Actions.SetNetworkMode( f11_arg0, Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE )
	local f11_local3 = Lobby.Actions.LobbySettings( f11_arg0, f11_arg1 )
	local f11_local4 = Lobby.Actions.UpdateUI( f11_arg0, f11_arg1 )
	local f11_local5 = Lobby.Actions.LobbyHostStart( f11_arg0, f11_arg1.mainMode, f11_arg1.lobbyType, f11_arg1.lobbyMode, f11_arg1.maxClients )
	local f11_local6 = Lobby.Actions.AdvertiseLobby( true )
	local f11_local7 = Lobby.Actions.ExecuteScript( f11_local0 )
	local f11_local8 = {
		head = f11_local2,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f11_local2, f11_local3 )
	Lobby.Process.AddActions( f11_local3, f11_local1 )
	Lobby.Process.AddActions( f11_local1, f11_local4 )
	Lobby.Process.AddActions( f11_local4, f11_local5 )
	Lobby.Process.AddActions( f11_local5, f11_local6 )
	Lobby.Process.AddActions( f11_local6, f11_local7 )
	Lobby.Process.AddActions( f11_local7, nil )
	return f11_local8
end

Lobby.Process.MergePublicDedicatedLobby = function ( f14_arg0 )
	Lobby.Matchmaking.SetupMatchmakingQuery( f14_arg0, Lobby.Matchmaking.SearchMode.LOBBY_MERGE )
	local f14_local0 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionStatus.SESSION_STATUS_MERGE )
	end
	
	local f14_local1 = function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
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
	f14_local7.name = f14_local7.name .. "_1"
	f14_local8.name = f14_local8.name .. "_2"
	local f14_local9 = Lobby.Actions.QoSJoinSearchResults( f14_arg0, f14_local7 )
	local f14_local10 = Lobby.Actions.QoSJoinSearchResults( f14_arg0, f14_local8 )
	f14_local9.name = f14_local9.name .. "_1"
	f14_local10.name = f14_local10.name .. "_2"
	local f14_local11 = Lobby.Actions.TimeDelay( 1000 )
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

Lobby.Process.MergePublicGameLobby = function ( f18_arg0 )
	Lobby.Matchmaking.SetupMatchmakingQuery( f18_arg0, Lobby.Matchmaking.SearchMode.LOBBY_MERGE )
	Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionStatus.SESSION_STATUS_IDLE )
	local f18_local0 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionStatus.SESSION_STATUS_MERGE )
	end
	
	local f18_local1 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionStatus.SESSION_STATUS_IDLE )
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
		Lobby.Merge.Complete()
		Lobby.Matchmaking.ClearSearchInfo()
	end
	
	local f18_local2 = function ()
		Engine.SetSessionStatus( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionStatus.SESSION_STATUS_IDLE )
		Lobby.Merge.Complete()
	end
	
	local f18_local3 = Lobby.Actions.ExecuteScript( f18_local0 )
	local f18_local4 = Lobby.Actions.QoSJoinSearchResults( f18_arg0, Lobby.Actions.SearchForLobby( f18_arg0 ) )
	local f18_local5 = Lobby.Actions.ExecuteScript( f18_local1 )
	local f18_local6 = Lobby.Actions.ExecuteScript( f18_local2 )
	local f18_local7 = Lobby.Actions.SearchForLobby( f18_arg0 )
	local f18_local8 = Lobby.Actions.SearchForLobby( f18_arg0 )
	local f18_local9 = Lobby.Actions.QoSJoinSearchResults( f18_arg0, f18_local7 )
	local f18_local10 = Lobby.Actions.QoSJoinSearchResults( f18_arg0, f18_local8 )
	local f18_local11 = Lobby.Actions.TimeDelay( 1000 )
	f18_local7.name = f18_local7.name .. "_1"
	f18_local8.name = f18_local8.name .. "_2"
	f18_local9.name = f18_local9.name .. "_1"
	f18_local10.name = f18_local10.name .. "_2"
	local f18_local12 = {
		head = f18_local3,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f18_local3, f18_local7 )
	Lobby.Process.AddActions( f18_local7, f18_local9, f18_local11, f18_local6 )
	Lobby.Process.AddActions( f18_local9, f18_local5, f18_local11, f18_local6 )
	Lobby.Process.AddActions( f18_local11, f18_local8, f18_local8, f18_local6 )
	Lobby.Process.AddActions( f18_local8, f18_local10, f18_local6, f18_local6 )
	Lobby.Process.AddActions( f18_local10, f18_local5, f18_local6, f18_local6 )
	return f18_local12
end

Lobby.Process.JoinSystemlink = function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3, f22_arg4, f22_arg5 )
	local f22_local0 = Lobby.Actions.OpenSpinner()
	local f22_local1 = Lobby.Actions.CloseSpinner()
	local f22_local2 = Lobby.Actions.JoinHost( f22_arg0, f22_arg1, f22_arg2, f22_arg3, f22_arg4 )
	local f22_local3 = Lobby.Actions.CloseSpinner()
	local f22_local4 = Lobby.Actions.ErrorPopup( f22_local2 )
	local f22_local5 = Lobby.Actions.CloseSpinner()
	f22_local5.name = f22_local5.name .. "CheckMods"
	local f22_local6 = Lobby.Actions.CheckMods( f22_arg0, {
		probeResult = {},
		probeResult = f22_arg5
	}, true )
	local f22_local7 = Lobby.Actions.ErrorPopup( f22_local6 )
	local f22_local8 = Lobby.Actions.SubscribeUGC( f22_arg0, f22_local6 )
	local f22_local9 = Lobby.Actions.ErrorPopup( f22_local8 )
	local f22_local10 = Lobby.Actions.CloseSpinner()
	f22_local10.name = f22_local3.name .. "SubscribeUGC"
	local f22_local11 = Lobby.Actions.InstalledUGC( f22_arg0, f22_local6 )
	local f22_local12 = Lobby.Actions.ErrorPopup( f22_local11 )
	local f22_local13 = Lobby.Actions.CloseSpinner()
	f22_local13.name = f22_local3.name .. "InstalledUGC"
	local f22_local14 = Lobby.Actions.LoadMod( f22_arg0, f22_local6 )
	local f22_local15 = Lobby.Actions.ErrorPopup( f22_local14 )
	local f22_local16 = Lobby.Actions.CloseSpinner()
	f22_local16.name = f22_local3.name .. "LoadedMod"
	Lobby.Process.ForceAction( f22_local3, f22_local4 )
	local f22_local17 = {
		head = f22_local0,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f22_local0, f22_local6 )
	Lobby.Process.AddActions( f22_local6, f22_local8, f22_local3, f22_local5 )
	Lobby.Process.AddActions( f22_local8, f22_local11, f22_local3, f22_local10 )
	Lobby.Process.AddActions( f22_local11, f22_local14, f22_local3, f22_local13 )
	Lobby.Process.AddActions( f22_local14, f22_local2, f22_local3, f22_local16 )
	Lobby.Process.AddActions( f22_local2, f22_local1, f22_local3, f22_local3 )
	Lobby.Process.ForceAction( f22_local5, f22_local7 )
	Lobby.Process.ForceAction( f22_local10, f22_local9 )
	Lobby.Process.ForceAction( f22_local13, f22_local12 )
	Lobby.Process.ForceAction( f22_local16, f22_local15 )
	return f22_local17
end

Lobby.Process.Join = function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3 )
	local f23_local0 = 0
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		f23_local0 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_GAME )
	else
		f23_local0 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	end
	local f23_local1 = function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end
	
	local f23_local2 = function ( f25_arg0 )
		return Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) and f25_arg0.probeResult.privateLobby.isValid
	end
	
	local f23_local3 = function ()
		LobbyVM.ErrorShutdown( {
			controller = f23_arg0,
			signoutUsers = false
		} )
	end
	
	local f23_local4 = Engine.GetLobbyNetworkMode()
	if f23_local4 ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN and f23_local4 ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		f23_local4 = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
	end
	local f23_local5 = Lobby.Process.ReloadPrivateLobby( f23_arg0, f23_local4 )
	local f23_local6 = Lobby.Actions.LobbySettings( f23_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f23_local7 = Lobby.Actions.UpdateUI( f23_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f23_local8 = Lobby.Process.ReloadPrivateLobby( f23_arg0, f23_local4 )
	local f23_local9 = Lobby.Actions.LobbySettings( f23_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f23_local10 = Lobby.Actions.UpdateUI( f23_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f23_local11 = Lobby.Actions.OpenSpinner()
	local f23_local12 = Lobby.Actions.CloseSpinner()
	local f23_local13 = Lobby.Actions.CloseSpinner()
	local f23_local14 = Lobby.Actions.CloseSpinner()
	f23_local14.name = f23_local14.name .. "Error"
	local f23_local15 = Lobby.Actions.CloseSpinner()
	f23_local15.name = f23_local15.name .. "NeedsFirstTimeFlowPreCheck"
	local f23_local16 = Lobby.Actions.CloseSpinner()
	f23_local16.name = f23_local16.name .. "NeedsFirstTimeFlow"
	local f23_local17 = Lobby.Actions.CloseSpinner()
	f23_local17.name = f23_local17.name .. "CheckMods"
	local f23_local18 = Lobby.Actions.CloseSpinner()
	f23_local18.name = f23_local18.name .. "CheckStarterPack"
	local f23_local19 = Lobby.Actions.ExecuteScript( f23_local1 )
	local f23_local20 = Lobby.Actions.ExecuteScript( f23_local3 )
	local f23_local21 = Lobby.Actions.LeaveWithParty( 3000 )
	local f23_local22 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f23_local23 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f23_local24 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f23_local25 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f23_local26 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f23_local27 = Lobby.Actions.LobbyInfoProbe( f23_arg0, {
		xuid = f23_arg1
	} )
	local f23_local28 = Lobby.Actions.CheckFirstTimeFlowRequirements( f23_arg0, f23_local27 )
	local f23_local29 = Lobby.Actions.ShowFirstTimeFlowError( f23_local28 )
	local f23_local30 = Lobby.Actions.LobbyInfoProbe( f23_arg0, {
		xuid = f23_arg1
	} )
	local f23_local31 = Lobby.Actions.CheckFirstTimeFlowRequirements( f23_arg0, f23_local30 )
	local f23_local32 = Lobby.Actions.ShowFirstTimeFlowError( f23_local31 )
	local f23_local33 = Lobby.Actions.LobbyJoinXUIDExt( f23_arg0, f23_arg2, f23_local30, Enum.LobbyType.LOBBY_TYPE_COUNT )
	local f23_local34 = Lobby.Actions.ExecuteScriptWithReturn( f23_local2, true, false, false, f23_local30 )
	local f23_local35 = Lobby.Actions.LobbyInfoProbe( f23_arg0, {
		xuid = f23_arg1
	} )
	local f23_local36 = Lobby.Actions.LobbyJoinXUIDExt( f23_arg0, f23_arg2, f23_local30, Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f23_local37 = Lobby.Actions.LobbyHostStart( f23_arg0, Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyMode.LOBBY_MODE_INVALID, f23_local0 )
	local f23_local38 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f23_local39 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f23_local40 = false
	if Engine.GetLobbyUIScreen() ~= LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id then
		f23_local40 = true
	end
	local f23_local41 = Lobby.Actions.ForceLobbyUIScreen( f23_arg0, LobbyData.UITargets.UI_MPLOBBYONLINE.id )
	local f23_local42 = Lobby.Actions.ErrorPopup( f23_local33 )
	local f23_local43 = Lobby.Actions.CheckStarterPackRequirements( f23_arg0, f23_local27 )
	local f23_local44 = Lobby.Actions.ErrorPopup( f23_local43 )
	local f23_local45 = Lobby.Actions.CheckMods( f23_arg0, f23_local27, true )
	local f23_local46 = Lobby.Actions.ErrorPopup( f23_local45 )
	local f23_local47 = Lobby.Actions.SubscribeUGC( f23_arg0, f23_local45 )
	local f23_local48 = Lobby.Actions.ErrorPopup( f23_local47 )
	local f23_local49 = Lobby.Actions.CloseSpinner()
	f23_local49.name = f23_local14.name .. "SubscribeUGC"
	local f23_local50 = Lobby.Actions.InstalledUGC( f23_arg0, f23_local45 )
	local f23_local51 = Lobby.Actions.ErrorPopup( f23_local50 )
	local f23_local52 = Lobby.Actions.CloseSpinner()
	f23_local52.name = f23_local14.name .. "InstalledUGC"
	local f23_local53 = Lobby.Actions.LoadMod( f23_arg0, f23_local45 )
	local f23_local54 = Lobby.Actions.ErrorPopup( f23_local53 )
	local f23_local55 = Lobby.Actions.CloseSpinner()
	f23_local55.name = f23_local14.name .. "LoadedMod"
	local f23_local56 = f23_local19
	local f23_local57 = Engine.IsInGame()
	local f23_local58 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f23_local59 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f23_local60 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f23_local61 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f23_local62 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f23_local63 = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f23_local64 = f23_local60 and f23_arg3 == LuaEnums.LEAVE_WITH_PARTY.WITH
	local f23_local65 = false
	local f23_local66 = false
	local f23_local67 = false
	local f23_local68 = false
	if f23_local57 == true then
		f23_local65 = true
		f23_local66 = true
		f23_local67 = true
		if f23_local60 == true then
			f23_local68 = true
		end
	elseif f23_local59 == true then
		f23_local65 = true
		f23_local66 = true
		if f23_local64 == false then
			f23_local67 = true
			if f23_local60 == true then
				f23_local68 = true
			end
		end
	elseif f23_local58 == true then
		if f23_local64 == false then
			f23_local67 = true
			if f23_local60 == true then
				f23_local68 = true
			end
		end
	else
		f23_local65 = true
		f23_local66 = true
		f23_local67 = true
		f23_local68 = true
	end
	local f23_local69 = f23_local5.head
	Lobby.Process.ForceAction( f23_local5.tail, f23_local6 )
	Lobby.Process.ForceAction( f23_local6, f23_local7 )
	Lobby.Process.ForceAction( f23_local7, f23_local42 )
	local f23_local70 = {
		head = f23_local11,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f23_local11, f23_local27, f23_local14, f23_local14 )
	Lobby.Process.AddActions( f23_local27, f23_local45, f23_local14, f23_local14 )
	Lobby.Process.AddActions( f23_local45, f23_local47, f23_local14, f23_local17 )
	Lobby.Process.AddActions( f23_local47, f23_local50, f23_local14, f23_local49 )
	Lobby.Process.AddActions( f23_local50, f23_local53, f23_local14, f23_local52 )
	Lobby.Process.AddActions( f23_local53, f23_local43, f23_local14, f23_local55 )
	Lobby.Process.AddActions( f23_local43, f23_local28, f23_local14, f23_local18 )
	Lobby.Process.AddActions( f23_local28, f23_local19, f23_local15, f23_local15 )
	local f23_local71 = false
	if f23_local59 == true and f23_local64 == true then
		Lobby.Process.AddActions( f23_local56, f23_local21, f23_local69, f23_local69 )
		f23_local56 = f23_local21
		f23_local71 = true
	end
	if f23_local65 == true then
		Lobby.Process.AddActions( f23_local56, f23_local24, f23_local69, f23_local69 )
		f23_local56 = f23_local24
		f23_local71 = true
	end
	if f23_local66 == true then
		Lobby.Process.AddActions( f23_local56, f23_local25, f23_local69, f23_local69 )
		f23_local56 = f23_local25
		f23_local71 = true
	end
	if f23_local67 == true then
		Lobby.Process.AddActions( f23_local56, f23_local26, f23_local69, f23_local69 )
		f23_local56 = f23_local26
		f23_local40 = true
		f23_local71 = true
	end
	if f23_local68 == true then
		Lobby.Process.AddActions( f23_local56, f23_local23, f23_local69, f23_local69 )
		f23_local56 = f23_local23
		f23_local40 = true
		f23_local71 = true
	end
	if f23_local60 == false or f23_local68 == true then
		Lobby.Process.AddActions( f23_local56, f23_local37, f23_local69, f23_local69 )
		Lobby.Process.AddActions( f23_local37, f23_local38, f23_local69, f23_local69 )
		f23_local56 = f23_local38
		f23_local40 = true
		f23_local71 = true
	end
	if f23_local67 == true then
		Lobby.Process.AddActions( f23_local56, f23_local39, f23_local69, f23_local69 )
		f23_local56 = f23_local39
		f23_local40 = true
		f23_local71 = true
	end
	local f23_local72 = Lobby.Actions.IsConditionTrue( not f23_local40 )
	local f23_local73 = Lobby.Actions.IsConditionTrue( f23_local71 )
	Lobby.Process.AddActions( f23_local56, f23_local30, f23_local69, f23_local69 )
	Lobby.Process.AddActions( f23_local30, f23_local31, f23_local69, f23_local69 )
	Lobby.Process.AddActions( f23_local31, f23_local33, f23_local16, f23_local16 )
	Lobby.Process.AddActions( f23_local33, f23_local34, f23_local72, f23_local69 )
	Lobby.Process.AddActions( f23_local72, f23_local41, f23_local73, f23_local69 )
	Lobby.Process.AddActions( f23_local73, f23_local69, f23_local14, f23_local69 )
	Lobby.Process.AddActions( f23_local34, f23_local35, f23_local12, f23_local12 )
	Lobby.Process.AddActions( f23_local35, f23_local36, f23_local69, f23_local69 )
	Lobby.Process.AddActions( f23_local36, f23_local12, f23_local12, f23_local12 )
	Lobby.Process.ForceAction( f23_local41, f23_local14 )
	Lobby.Process.ForceAction( f23_local14, f23_local42 )
	Lobby.Process.ForceAction( f23_local15, f23_local29 )
	Lobby.Process.ForceAction( f23_local16, f23_local8.head )
	Lobby.Process.ForceAction( f23_local8.tail, f23_local9 )
	Lobby.Process.ForceAction( f23_local9, f23_local10 )
	Lobby.Process.ForceAction( f23_local10, f23_local32 )
	Lobby.Process.ForceAction( f23_local18, f23_local44 )
	Lobby.Process.ForceAction( f23_local17, f23_local46 )
	Lobby.Process.ForceAction( f23_local49, f23_local48 )
	Lobby.Process.ForceAction( f23_local52, f23_local51 )
	Lobby.Process.ForceAction( f23_local55, f23_local54 )
	return f23_local70
end

Lobby.Process.ReloadPrivateLobby = function ( f27_arg0, f27_arg1 )
	local f27_local0 = Lobby.Actions.ExecuteScript( function ()
		Lobby.Timer.HostingLobbyEnd( {
			lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
		} )
		Engine.QoSProbeListenerEnable( Enum.LobbyType.LOBBY_TYPE_GAME, false )
	end )
	local f27_local1 = Lobby.Actions.OpenSpinner()
	local f27_local2 = Lobby.Actions.CloseSpinner()
	local f27_local3 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f27_local4 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f27_local5 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f27_local6 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f27_local7 = Lobby.Actions.SetNetworkMode( f27_arg0, f27_arg1 )
	local f27_local8 = Lobby.Actions.LobbyHostStart( f27_arg0, Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID, Enum.LobbyType.LOBBY_TYPE_PRIVATE, Enum.LobbyMode.LOBBY_MODE_INVALID, LobbyData.UITargets.UI_MODESELECT.maxClients )
	local f27_local9 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f27_local10 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f27_local11 = {
		head = f27_local1,
		tail = f27_local2,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f27_local1, f27_local0 )
	Lobby.Process.AddActions( f27_local0, f27_local3 )
	Lobby.Process.AddActions( f27_local3, f27_local4 )
	Lobby.Process.AddActions( f27_local4, f27_local5 )
	Lobby.Process.AddActions( f27_local5, f27_local6 )
	Lobby.Process.AddActions( f27_local6, f27_local7 )
	if f27_arg1 == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		local f27_local12 = Lobby.Actions.SignUserInToLive( f27_arg0 )
		Lobby.Process.AddActions( f27_local7, f27_local12 )
		Lobby.Process.AddActions( f27_local12, f27_local8 )
	else
		Lobby.Process.AddActions( f27_local7, f27_local8 )
	end
	Lobby.Process.AddActions( f27_local8, f27_local9 )
	Lobby.Process.AddActions( f27_local9, f27_local10 )
	Lobby.Process.AddActions( f27_local10, f27_local2 )
	return f27_local11
end

Lobby.Process.Recover = function ( f29_arg0, f29_arg1 )
	local f29_local0 = Engine.GetLobbyUIScreen()
	if f29_arg1 ~= nil then
		f29_local0 = f29_arg1
	end
	local f29_local1 = LobbyData:UITargetFromId( f29_local0 )
	if f29_local1.id == LobbyData.UITargets.UI_MAIN.id then
		return nil
	end
	local f29_local2 = f29_local1.errTarget.backTarget
	local f29_local3 = f29_local1.errTarget
	local f29_local4 = Lobby.Actions.OpenSpinner( nil, true )
	local f29_local5 = Lobby.Actions.LobbyInRecovery()
	local f29_local6 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f29_local7 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f29_local8 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f29_local9 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f29_local10 = Lobby.Actions.LobbySettings( f29_arg0, f29_local3 )
	local f29_local11 = Lobby.Actions.ForceLobbyUIScreen( f29_arg0, f29_local3.id )
	local f29_local12 = Lobby.Actions.UpdateUI( f29_arg0, f29_local3 )
	local f29_local13 = Lobby.Actions.ArenaErrorShutdown( f29_arg0 )
	local f29_local14 = Lobby.Actions.SetDefaultArenaPlaylist( f29_arg0 )
	local f29_local15 = Lobby.Actions.RunPlaylistRules( f29_arg0 )
	local f29_local16 = Lobby.Actions.CloseSpinner()
	local f29_local17 = {
		head = f29_local4,
		interrupt = Lobby.Interrupt.NONE,
		tail = nil,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f29_local4, f29_local5 )
	Lobby.Process.AddActions( f29_local5, f29_local8 )
	Lobby.Process.AddActions( f29_local8, f29_local9 )
	Lobby.Process.AddActions( f29_local9, f29_local6 )
	Lobby.Process.AddActions( f29_local6, f29_local7 )
	Lobby.Process.AddActions( f29_local7, f29_local10 )
	local f29_local18 = f29_local10
	if f29_local2 ~= nil then
		if f29_local2.lobbyType == Enum.LobbyType.LOBBY_TYPE_INVALID then
			
		elseif f29_local2.lobbyType ~= f29_local3.lobbyType then
			local f29_local19 = Lobby.Actions.LobbyHostStart( f29_arg0, f29_local2.mainMode, f29_local2.lobbyType, f29_local2.lobbyMode, f29_local2.maxClients )
			local f29_local20 = Lobby.Actions.LobbyHostAddPrimary( f29_local2.lobbyType )
			local f29_local21 = Lobby.Actions.LobbyClientStart( f29_local2.lobbyType )
			f29_local19.name = f29_local19.name .. "_1"
			Lobby.Process.AddActions( f29_local18, f29_local19 )
			Lobby.Process.AddActions( f29_local19, f29_local20 )
			Lobby.Process.AddActions( f29_local20, f29_local21 )
			f29_local18 = f29_local21
		elseif f29_local3.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_CP or f29_local3.mainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
			local f29_local19 = Lobby.Actions.LobbyHostStart( f29_arg0, f29_local3.mainMode, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f29_local3.lobbyMode, f29_local3.maxClients )
			local f29_local20 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			local f29_local21 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
			f29_local19.name = f29_local19.name .. "_4"
			Lobby.Process.AddActions( f29_local18, f29_local19 )
			Lobby.Process.AddActions( f29_local19, f29_local20 )
			Lobby.Process.AddActions( f29_local20, f29_local21 )
			f29_local18 = f29_local21
		end
	end
	if f29_local3.lobbyType == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
		local f29_local19 = Lobby.Actions.LobbyHostStart( f29_arg0, f29_local3.mainMode, f29_local3.lobbyType, f29_local3.lobbyMode, f29_local3.maxClients )
		local f29_local20 = Lobby.Actions.LobbyHostAddPrimary( f29_local3.lobbyType )
		local f29_local21 = Lobby.Actions.LobbyClientStart( f29_local3.lobbyType )
		f29_local19.name = f29_local19.name .. "_2"
		Lobby.Process.AddActions( f29_local18, f29_local19 )
		Lobby.Process.AddActions( f29_local19, f29_local20 )
		Lobby.Process.AddActions( f29_local20, f29_local21 )
		f29_local18 = f29_local21
	elseif f29_local3.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME then
		local f29_local19 = function ()
			Engine.SetLobbyMaxClients( f29_local3.lobbyType, Dvar.party_maxplayers:get() )
		end
		
		local f29_local20 = Lobby.Actions.LobbyHostStart( f29_arg0, f29_local3.mainMode, f29_local3.lobbyType, f29_local3.lobbyMode, f29_local3.maxClients )
		local f29_local21 = Lobby.Actions.LobbyInfoProbe( f29_arg0, {
			xuid = Engine.GetXUID64( f29_arg0 )
		} )
		local f29_local22 = Lobby.Actions.LobbyJoinXUID( f29_arg0, {
			xuid = Engine.GetXUID64( f29_arg0 )
		}, Enum.JoinType.JOIN_TYPE_PARTY )
		local f29_local23 = Lobby.Actions.LobbyVMCall( Lobby.Timer.HostingLobby, {
			controller = f29_arg0,
			lobbyType = f29_local3.lobbyType,
			mainMode = f29_local3.mainMode,
			lobbyTimerType = f29_local3.lobbyTimerType
		} )
		f29_local20.name = f29_local20.name .. "_3"
		local f29_local24 = Lobby.Actions.RunPlaylistSettings( f29_arg0 )
		local f29_local25 = Lobby.Actions.AdvertiseLobby( true )
		local f29_local26 = Lobby.Actions.ExecuteScript( f29_local19 )
		Lobby.Process.AddActions( f29_local18, f29_local20 )
		Lobby.Process.AddActions( f29_local20, f29_local21 )
		Lobby.Process.AddActions( f29_local21, f29_local22 )
		f29_local18 = f29_local22
		if f29_local3.lobbyMode == Enum.LobbyMode.LOBBY_MODE_PUBLIC or f29_local3.lobbyMode == Enum.LobbyMode.LOBBY_MODE_ARENA then
			Lobby.Process.AddActions( f29_local18, f29_local24 )
			Lobby.Process.AddActions( f29_local24, f29_local25 )
			Lobby.Process.AddActions( f29_local25, f29_local26 )
			f29_local18 = f29_local26
		end
		Lobby.Process.AddActions( f29_local18, f29_local23 )
		f29_local18 = f29_local23
	end
	if f29_local3.lobbyMode == Enum.LobbyMode.LOBBY_MODE_ARENA then
		Lobby.Process.AddActions( f29_local18, f29_local14 )
		Lobby.Process.AddActions( f29_local14, f29_local15 )
		f29_local18 = f29_local15
	end
	Lobby.Process.AddActions( f29_local18, f29_local13 )
	Lobby.Process.AddActions( f29_local13, f29_local11 )
	Lobby.Process.AddActions( f29_local11, f29_local12 )
	Lobby.Process.AddActions( f29_local12, f29_local16 )
	Lobby.Process.AddActions( f29_local16, nil )
	f29_local17.tail = f29_local16
	return f29_local17
end

Lobby.Process.ForceToMenu = function ( f31_arg0, f31_arg1, f31_arg2 )
	local f31_local0 = f31_arg1.isPrivate
	local f31_local1 = f31_arg1.mainMode
	local f31_local2 = f31_arg1.networkMode
	local f31_local3 = f31_arg1.maxClients
	local f31_local4 = Lobby.Actions.LobbySettings( f31_arg0, f31_arg1 )
	local f31_local5 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f31_local6 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f31_local7 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f31_local8 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f31_local9 = Lobby.Actions.ForceLobbyUIScreen( f31_arg0, f31_arg1.id )
	local f31_local10 = Lobby.Actions.UpdateUI( f31_arg0, f31_arg1 )
	local f31_local11 = {
		head = f31_local4,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f31_local4, f31_local7 )
	Lobby.Process.AddActions( f31_local7, f31_local8 )
	Lobby.Process.AddActions( f31_local8, f31_local5 )
	Lobby.Process.AddActions( f31_local5, f31_local6 )
	local f31_local12 = f31_local6
	if f31_local0 == true then
		local f31_local13 = Lobby.Actions.LobbyHostStart( f31_arg0, f31_local1, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f31_arg1.lobbyMode, f31_local3 )
		local f31_local14 = Lobby.Actions.LobbyHostAddPrimary( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		local f31_local15 = Lobby.Actions.LobbyClientStart( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		Lobby.Process.AddActions( f31_local8, f31_local13 )
		Lobby.Process.AddActions( f31_local13, f31_local14 )
		Lobby.Process.AddActions( f31_local14, f31_local15 )
		f31_local12 = f31_local15
	end
	Lobby.Process.AddActions( f31_local12, f31_local9 )
	Lobby.Process.AddActions( f31_local9, f31_local10 )
	if f31_arg2 ~= nil then
		Lobby.Process.AddActions( f31_local10, Lobby.Actions.ErrorPopupMsg( f31_arg2 ) )
	end
	return f31_local11
end

Lobby.Process.HostLeftNoMigrationCreatePrivateLobby = function ( f32_arg0, f32_arg1, f32_arg2 )
	local f32_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f32_local1 = Lobby.Actions.OpenSpinner( true )
	local f32_local2 = Lobby.Actions.CloseSpinner()
	local f32_local3 = Lobby.Actions.CloseSpinner()
	local f32_local4 = Lobby.Actions.LobbyHostStart( f32_arg0, f32_arg1, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f32_local0.lobbyMode, f32_arg2 )
	local f32_local5 = Lobby.Actions.LobbyHostAddPrimary( f32_local4.lobbyType )
	local f32_local6 = Lobby.Actions.LobbyClientStart( f32_local4.lobbyType )
	local f32_local7 = Lobby.Actions.ErrorPopup( f32_local4 )
	local f32_local8 = {
		head = f32_local1,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f32_local1, f32_local4 )
	Lobby.Process.AddActions( f32_local4, f32_local5 )
	Lobby.Process.AddActions( f32_local5, f32_local6 )
	Lobby.Process.AddActions( f32_local6, f32_local2 )
	Lobby.Process.AddActions( f32_local3, f32_local7 )
	return f32_local8
end

Lobby.Process.PromoteClientToPrivateLobbyHost = function ( f33_arg0, f33_arg1, f33_arg2, f33_arg3, f33_arg4, f33_arg5, f33_arg6, f33_arg7, f33_arg8 )
	local f33_local0 = Engine.GetLobbyUIScreen()
	local f33_local1 = LobbyData:UITargetFromId( f33_local0 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Process.PromoteClientToPrivateLobbyHost: menuId(" .. f33_local0 .. "), lobbyType(" .. f33_arg2 .. "), mainMode(" .. f33_arg1 .. "), lobbyTimerType(" .. f33_local1.lobbyTimerType .. ").\n" )
	local f33_local2 = Lobby.Actions.PromoteToHostDone( f33_arg0, f33_arg2, f33_arg8, f33_arg7 )
	local f33_local3 = Lobby.Actions.LobbyHostStartMigratedInfo( f33_arg0, f33_arg1, f33_arg2, f33_arg3, f33_arg4, f33_arg5 )
	local f33_local4 = {
		head = f33_local2,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	if Engine.IsLobbyHost( f33_arg2 ) == false then
		f33_local4.head = f33_local3
		Lobby.Process.AddActions( f33_local3, f33_local2 )
		Lobby.Process.AddActions( f33_local2, nil )
	end
	return f33_local4
end

Lobby.Process.TransferDataFromClientModuleToHostModule = function ()
	local f34_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	for f34_local4, f34_local5 in ipairs( f34_local0.sessionClients ) do
		Engine.LobbyHostAssignMapVoteToClient( f34_local5.xuid, f34_local5.mapVote )
		Engine.LobbyHostAssignTeamToClient( f34_local5.xuid, f34_local5.team )
	end
end

Lobby.Process.PromoteClientToGameLobbyHost = function ( f35_arg0, f35_arg1, f35_arg2, f35_arg3, f35_arg4, f35_arg5, f35_arg6, f35_arg7, f35_arg8 )
	local f35_local0 = Engine.GetLobbyUIScreen()
	local f35_local1 = LobbyData:UITargetFromId( f35_local0 )
	local f35_local2, f35_local3 = Engine.GetGameLobbyStatusInfo()
	local f35_local4 = function ()
		if not Engine.IsInGame() and f35_local1.lobbyTimerType ~= LuaEnums.TIMER_TYPE.INVALID then
			Lobby.Timer.HostingLobby( {
				controller = f35_arg0,
				lobbyType = f35_arg2,
				mainMode = f35_arg1,
				lobbyTimerType = f35_local1.lobbyTimerType,
				status = f35_local2,
				statusValue = f35_local3
			} )
		end
		if f35_local1.isAdvertised == true then
			local f36_local0
			if f35_arg3 ~= Enum.LobbyMode.LOBBY_MODE_PUBLIC and f35_arg3 ~= Enum.LobbyMode.LOBBY_MODE_ARENA then
				f36_local0 = false
			else
				f36_local0 = true
			end
			Engine.QoSProbeListenerEnable( f35_arg2, f36_local0 )
		end
		Lobby.Process.TransferDataFromClientModuleToHostModule()
	end
	
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Lobby.Process.PromoteClientToGameLobbyHost: menuId(" .. f35_local0 .. "), lobbyType(" .. f35_arg2 .. "), mainMode(" .. f35_arg1 .. "), lobbyTimerType(" .. f35_local1.lobbyTimerType .. ").\n" )
	local f35_local5 = Lobby.Actions.PromoteToHostDone( f35_arg0, f35_arg2, f35_arg8, f35_arg7 )
	local f35_local6 = Lobby.Actions.LobbyHostStartMigratedInfo( f35_arg0, f35_arg1, f35_arg2, f35_arg3, f35_arg4, f35_arg5 )
	local f35_local7 = Lobby.Actions.ExecuteScript( f35_local4 )
	local f35_local8 = Lobby.Actions.AdvertiseLobby( true )
	local f35_local9 = Lobby.Actions.LobbySettings( f35_arg0, f35_local1 )
	local f35_local10 = Lobby.Actions.RunPlaylistSettings( f35_arg0 )
	local f35_local11 = {
		head = f35_local5,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	if Engine.IsLobbyHost( f35_arg2 ) == false then
		f35_local11.head = f35_local6
		Lobby.Process.AddActions( f35_local6, f35_local5 )
		Lobby.Process.AddActions( f35_local5, f35_local7 )
		if f35_local1.isAdvertised == true then
			Lobby.Process.AddActions( f35_local7, f35_local8 )
			if f35_arg7 == false then
				Lobby.Process.AddActions( f35_local8, f35_local9 )
			end
		end
	end
	return f35_local11
end

Lobby.Process.PromoteClientToHost = function ( f37_arg0, f37_arg1, f37_arg2, f37_arg3, f37_arg4, f37_arg5, f37_arg6, f37_arg7, f37_arg8 )
	local f37_local0 = nil
	if f37_arg2 == Enum.LobbyType.LOBBY_TYPE_PRIVATE then
		f37_local0 = Lobby.Process.PromoteClientToPrivateLobbyHost( f37_arg0, f37_arg1, f37_arg2, f37_arg3, f37_arg4, f37_arg5, f37_arg6, f37_arg7, f37_arg8 )
	elseif f37_arg2 == Enum.LobbyType.LOBBY_TYPE_GAME then
		f37_local0 = Lobby.Process.PromoteClientToGameLobbyHost( f37_arg0, f37_arg1, f37_arg2, f37_arg3, f37_arg4, f37_arg5, f37_arg6, f37_arg7, f37_arg8 )
	end
	return f37_local0
end

Lobby.Process.LocalClientLeave = function ( f38_arg0, f38_arg1 )
	local f38_local0 = Lobby.Actions.LobbyLocalClientLeave( Enum.LobbyType.LOBBY_TYPE_PRIVATE, f38_arg0, f38_arg1 )
	local f38_local1 = Lobby.Actions.LobbyLocalClientLeave( Enum.LobbyType.LOBBY_TYPE_GAME, f38_arg0, f38_arg1 )
	local f38_local2 = {
		head = f38_local1,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = false
	}
	Lobby.Process.AddActions( f38_local1, f38_local0 )
	Lobby.Process.AddActions( f38_local0 )
	return f38_local2
end

Lobby.Process.LeaveWithParty = function ( f39_arg0, f39_arg1, f39_arg2 )
	local f39_local0 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f39_local1 = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f39_local2 = nil
	if f39_arg0 ~= Enum.LobbyModule.LOBBY_MODULE_CLIENT or f39_local1 == false then
		return 
	end
	local f39_local3 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f39_local4 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f39_local5 = Lobby.Actions.CloseSpinner()
	local f39_local6 = {
		head = f39_local3,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = true
	}
	local f39_local7 = f39_local3
	if f39_local0 == true then
		Lobby.Process.ForceAction( f39_local7, f39_local4 )
		f39_local7 = f39_local4
	end
	Lobby.Process.ForceAction( f39_local7, f39_local5 )
	return f39_local6
end

Lobby.Process.ManagePartyLeave = function ( f40_arg0 )
	if LobbyData:UITargetFromId( LobbyData.GetLobbyNav() ) == nil then
		error( "LobbyVM: No menu called '" .. currentMenu .. "' found." )
	end
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) == false or Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) == false then
		return nil
	else
		local f40_local0 = Engine.GetLobbyMainMode()
		local f40_local1 = Engine.GetLobbyMode( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		local f40_local2 = Engine.GetLobbyMaxClients( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		local f40_local3 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		local f40_local4 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
		local f40_local5 = Lobby.Actions.LobbyHostStart( f40_arg0, f40_local0, Enum.LobbyType.LOBBY_TYPE_PRIVATE, f40_local1, f40_local2 )
		local f40_local6 = Lobby.Actions.LobbyHostAddPrimary( f40_local5.lobbyType )
		local f40_local7 = Lobby.Actions.LobbyClientStart( f40_local5.lobbyType )
		local f40_local8 = {
			head = f40_local3,
			interrupt = Lobby.Interrupt.NONE,
			force = true,
			cancellable = true
		}
		Lobby.Process.AddActions( f40_local3, f40_local4 )
		Lobby.Process.AddActions( f40_local4, f40_local5 )
		Lobby.Process.AddActions( f40_local5, f40_local6 )
		Lobby.Process.AddActions( f40_local6, f40_local7 )
		return f40_local8
	end
end

Lobby.Process.NonFatalError = function ( f41_arg0 )
	local f41_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	return {
		head = Lobby.Actions.ErrorPopupMsg( f41_arg0 ),
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
end

Lobby.Process.FatalError = function ( f42_arg0 )
	local f42_local0 = Engine.GetPrimaryController()
	local f42_local1 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f42_local2 = LobbyData.UITargets.UI_MAIN
	local f42_local3 = Lobby.Actions.OpenSpinner()
	local f42_local4 = Lobby.Actions.CloseSpinner()
	local f42_local5 = Lobby.Actions.LobbySettings( f42_local0, f42_local2 )
	local f42_local6 = Lobby.Actions.UpdateUI( f42_local0, f42_local2 )
	local f42_local7 = Lobby.Actions.ErrorPopupMsg( f42_arg0 )
	local f42_local8 = {
		head = f42_local3,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f42_local3, f42_local5 )
	Lobby.Process.AddActions( f42_local5, f42_local5 )
	Lobby.Process.AddActions( f42_local5, f42_local6 )
	Lobby.Process.AddActions( f42_local6, f42_local4 )
	Lobby.Process.AddActions( f42_local4, f42_local7 )
	return f42_local8
end

Lobby.Process.Reset = function ()
	local f43_local0 = Engine.GetPrimaryController()
	local f43_local1 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f43_local2 = LobbyData.UITargets.UI_MAIN
	local f43_local3 = Lobby.Actions.CloseSpinner()
	local f43_local4 = Lobby.Actions.CloseSpinner()
	local f43_local5 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f43_local6 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f43_local7 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f43_local8 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f43_local9 = Lobby.Actions.LobbySettings( f43_local0, f43_local2 )
	local f43_local10 = Lobby.Actions.UpdateUI( f43_local0, f43_local2 )
	local f43_local11 = {
		head = f43_local8,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f43_local3, f43_local8 )
	Lobby.Process.AddActions( f43_local8, f43_local7 )
	Lobby.Process.AddActions( f43_local7, f43_local6 )
	Lobby.Process.AddActions( f43_local6, f43_local5 )
	Lobby.Process.AddActions( f43_local5, f43_local9 )
	Lobby.Process.AddActions( f43_local9, f43_local10 )
	Lobby.Process.AddActions( f43_local10, f43_local4 )
	return f43_local11
end

Lobby.Process.DevmapClient = function ( f44_arg0 )
	local f44_local0 = LobbyData.UITargets.UI_MODESELECT
	local f44_local1 = f44_local0.mainMode
	local f44_local2 = f44_local0.lobbyType
	local f44_local3 = f44_local0.lobbyMode
	local f44_local4 = f44_local0.maxClients
	local f44_local5 = Lobby.Actions.LobbySettings( f44_arg0, f44_local0, nil, true )
	local f44_local6 = Lobby.Actions.UpdateUI( f44_arg0, f44_local0 )
	local f44_local7 = Lobby.Actions.SetNetworkMode( f44_arg0, Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN )
	local f44_local8 = Lobby.Actions.LobbyHostStart( f44_arg0, f44_local1, f44_local2, f44_local3, f44_local4 )
	local f44_local9 = Lobby.Actions.LobbyHostAddPrimary( f44_local2 )
	local f44_local10 = Lobby.Actions.LobbyClientStart( f44_local2 )
	local f44_local11 = {
		head = f44_local5,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f44_local5, f44_local6 )
	Lobby.Process.AddActions( f44_local6, f44_local7 )
	Lobby.Process.AddActions( f44_local7, f44_local8 )
	Lobby.Process.AddActions( f44_local8, f44_local9 )
	Lobby.Process.AddActions( f44_local9, f44_local10 )
	return f44_local11
end

Lobby.Process.Devmap = function ( f45_arg0, f45_arg1 )
	local f45_local0 = LobbyData.UITargets.UI_MODESELECT
	local f45_local1 = LobbyData.UITargets.UI_MAIN
	if f45_arg1 == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		f45_local1 = LobbyData.UITargets.UI_CPLOBBYLANGAME
	elseif f45_arg1 == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		f45_local1 = LobbyData.UITargets.UI_ZMLOBBYLANGAME
	elseif f45_arg1 == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		f45_local1 = LobbyData.UITargets.UI_MPLOBBYLANGAME
	end
	if f45_local1 == LobbyData.UITargets.UI_CPLOBBYLANGAME and Dvar.ui_gametype:get() == "cpzm" then
		f45_local1 = LobbyData.UITargets.UI_CP2LOBBYLANGAME
	end
	local f45_local2 = f45_local0.mainMode
	local f45_local3 = f45_local0.lobbyType
	local f45_local4 = f45_local0.lobbyMode
	local f45_local5 = f45_local0.maxClients
	local f45_local6 = f45_local1.mainMode
	local f45_local7 = f45_local1.lobbyType
	local f45_local8 = f45_local1.lobbyMode
	local f45_local9 = f45_local1.maxClients
	local f45_local10 = Lobby.Actions.LobbySettings( f45_arg0, f45_local1, nil, true )
	local f45_local11 = Lobby.Actions.UpdateUI( f45_arg0, f45_local1 )
	local f45_local12 = Lobby.Actions.SetNetworkMode( f45_arg0, Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN )
	local f45_local13 = Lobby.Actions.LobbyHostStart( f45_arg0, f45_local2, f45_local3, f45_local4, f45_local5 )
	local f45_local14 = Lobby.Actions.LobbyHostAddPrimary( f45_local3 )
	local f45_local15 = Lobby.Actions.LobbyClientStart( f45_local3 )
	local f45_local16 = Lobby.Actions.LobbyHostStart( f45_arg0, f45_local6, f45_local7, f45_local8, f45_local9 )
	local f45_local17 = Lobby.Actions.LobbyHostAddPrimary( f45_local7 )
	local f45_local18 = Lobby.Actions.LobbyClientStart( f45_local7 )
	local f45_local19 = Lobby.Actions.SetGameAndTypeMapName( f45_arg0, lobbyType, Dvar.ui_gametype:get(), Dvar.ui_mapname:get() )
	local f45_local20 = {
		head = f45_local10,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f45_local10, f45_local11 )
	Lobby.Process.AddActions( f45_local11, f45_local12 )
	Lobby.Process.AddActions( f45_local12, f45_local13 )
	Lobby.Process.AddActions( f45_local13, f45_local14 )
	Lobby.Process.AddActions( f45_local14, f45_local15 )
	Lobby.Process.AddActions( f45_local15, f45_local16 )
	Lobby.Process.AddActions( f45_local16, f45_local19 )
	Lobby.Process.AddActions( f45_local19, f45_local17 )
	if Dvar.splitscreen:get() == true and Dvar.splitscreen_playerCount:get() > 1 then
		local f45_local21 = Lobby.Actions.LobbyHostAddLocal( 1, f45_local7 )
		Lobby.Process.AddActions( f45_local17, f45_local21 )
		Lobby.Process.AddActions( f45_local21, f45_local18 )
	else
		Lobby.Process.AddActions( f45_local17, f45_local18 )
	end
	return f45_local20
end

Lobby.Process.PrimaryControllerSignedIn = function ( f46_arg0 )
	local f46_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f46_local1 = LobbyData.UITargets.UI_MAIN
	local f46_local2 = Lobby.Actions.OpenSpinner()
	local f46_local3 = Lobby.Actions.CloseSpinner()
	local f46_local4 = Lobby.Actions.LobbySettings( f46_arg0, f46_local1 )
	local f46_local5 = Lobby.Actions.UpdateUI( f46_arg0, f46_local1 )
	local f46_local6 = Lobby.Actions.SignUserInToLive( f46_arg0 )
	local f46_local7 = Lobby.Actions.ErrorPopupMsg( "XBOXLIVE_SIGNEDOUT" )
	local f46_local8 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f46_local9 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f46_local10 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f46_local11 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f46_local12 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f46_local13 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f46_local14 = {
		head = f46_local2,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f46_local2, f46_local4 )
	Lobby.Process.AddActions( f46_local4, f46_local5 )
	Lobby.Process.AddActions( f46_local5, f46_local12 )
	Lobby.Process.AddActions( f46_local12, f46_local13 )
	Lobby.Process.AddActions( f46_local13, f46_local10 )
	Lobby.Process.AddActions( f46_local10, f46_local11 )
	Lobby.Process.AddActions( f46_local11, f46_local6 )
	Lobby.Process.AddActions( f46_local6, f46_local3 )
	Lobby.Process.AddActions( f46_local3, f46_local7 )
	return f46_local14
end

Lobby.Process.PrimaryControllerSignedOut = function ( f47_arg0 )
	local f47_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	local f47_local1 = LobbyData.UITargets.UI_MAIN
	local f47_local2 = Lobby.Actions.OpenSpinner()
	local f47_local3 = Lobby.Actions.CloseSpinner()
	local f47_local4 = Lobby.Actions.LobbySettings( f47_arg0, f47_local1 )
	local f47_local5 = Lobby.Actions.UpdateUI( f47_arg0, f47_local1 )
	local f47_local6 = Lobby.Actions.SignUserOutOfLive( f47_arg0 )
	local f47_local7 = Lobby.Actions.ErrorPopupMsg( "XBOXLIVE_SIGNEDOUT" )
	local f47_local8 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f47_local9 = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f47_local10 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f47_local11 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	local f47_local12 = Lobby.Actions.LobbyClientEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f47_local13 = Lobby.Actions.LobbyHostEnd( Enum.LobbyType.LOBBY_TYPE_GAME )
	local f47_local14 = {
		head = f47_local2,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = true
	}
	Lobby.Process.AddActions( f47_local2, f47_local4 )
	Lobby.Process.AddActions( f47_local4, f47_local5 )
	Lobby.Process.AddActions( f47_local5, f47_local12 )
	Lobby.Process.AddActions( f47_local12, f47_local13 )
	Lobby.Process.AddActions( f47_local13, f47_local10 )
	Lobby.Process.AddActions( f47_local10, f47_local11 )
	Lobby.Process.AddActions( f47_local11, f47_local6 )
	Lobby.Process.AddActions( f47_local6, f47_local3 )
	Lobby.Process.AddActions( f47_local3, f47_local7 )
	return f47_local14
end

Lobby.Process.ReAdvertiseLobby = function ( f48_arg0 )
	local f48_local0 = function ()
		Dvar.lobbyAdvertiseDirty:set( true )
	end
	
	local f48_local1 = Lobby.Actions.AdvertiseLobby( false )
	local f48_local2 = Lobby.Actions.AdvertiseLobby( true )
	local f48_local3 = Lobby.Actions.ExecuteScript( f48_local0 )
	local f48_local4 = {
		head = f48_local1,
		interrupt = Lobby.Interrupt.NONE,
		force = true,
		cancellable = false
	}
	Lobby.Process.ForceAction( f48_local1, f48_local2 )
	Lobby.Process.ForceAction( f48_local2, f48_local3 )
	return f48_local4
end

Lobby.Process.LoadMod = function ( f50_arg0, f50_arg1 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "LoadMod: " .. f50_arg1.ugcName .. "\n" )
	local f50_local0 = Lobby.Actions.OpenSpinner()
	local f50_local1 = Lobby.Actions.CloseSpinner()
	local f50_local2 = Lobby.Actions.CloseSpinner()
	f50_local2.name = f50_local2.name .. "Error"
	local f50_local3 = Lobby.Actions.CheckMods( f50_arg0, {
		probeResult = {},
		probeResult = f50_arg1
	}, false )
	local f50_local4 = Lobby.Actions.ErrorPopup( f50_local3 )
	local f50_local5 = Lobby.Actions.CloseSpinner()
	f50_local5.name = f50_local5.name .. "CheckMods"
	local f50_local6 = Lobby.Actions.LoadMod( f50_arg0, f50_local3 )
	local f50_local7 = Lobby.Actions.ErrorPopup( f50_local6 )
	local f50_local8 = Lobby.Actions.CloseSpinner()
	f50_local8.name = f50_local2.name .. "LoadedMod"
	local f50_local9 = {
		head = f50_local0,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = true,
		doesNotCancelOthers = true
	}
	Lobby.Process.AddActions( f50_local0, f50_local3, f50_local2, f50_local2 )
	Lobby.Process.AddActions( f50_local3, f50_local6, f50_local2, f50_local5 )
	Lobby.Process.AddActions( f50_local6, f50_local1, f50_local2, f50_local8 )
	Lobby.Process.ForceAction( f50_local5, f50_local4 )
	Lobby.Process.ForceAction( f50_local8, f50_local7 )
	return f50_local9
end

Lobby.Process.NeedInstallUGC = function ( f51_arg0, f51_arg1 )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "NeedInstallUGC: " .. f51_arg1.ugcType .. " " .. f51_arg1.ugcName .. "\n" )
	local f51_local0 = Lobby.Actions.OpenSpinner()
	local f51_local1 = Lobby.Actions.CloseSpinner()
	local f51_local2 = Lobby.Actions.CloseSpinner()
	f51_local2.name = f51_local2.name .. "Error"
	local f51_local3 = Lobby.Actions.CheckMods( f51_arg0, {
		probeResult = {},
		probeResult = f51_arg1
	}, false )
	local f51_local4 = Lobby.Actions.ErrorPopup( f51_local3 )
	local f51_local5 = Lobby.Actions.CloseSpinner()
	f51_local5.name = f51_local5.name .. "CheckMods"
	local f51_local6 = Lobby.Actions.SubscribeUGC( f51_arg0, f51_local3 )
	local f51_local7 = Lobby.Actions.ErrorPopup( f51_local6 )
	local f51_local8 = Lobby.Actions.CloseSpinner()
	f51_local8.name = f51_local2.name .. "SubscribeUGC"
	local f51_local9 = Lobby.Actions.InstalledUGC( f51_arg0, f51_local3 )
	local f51_local10 = Lobby.Actions.ErrorPopup( f51_local9 )
	local f51_local11 = Lobby.Actions.CloseSpinner()
	f51_local11.name = f51_local2.name .. "InstalledUGC"
	local f51_local12 = Lobby.Actions.LoadMod( f51_arg0, f51_local3 )
	local f51_local13 = Lobby.Actions.ErrorPopup( f51_local12 )
	local f51_local14 = Lobby.Actions.CloseSpinner()
	f51_local14.name = f51_local2.name .. "LoadedMod"
	local f51_local15 = Engine.GetLobbyNetworkMode()
	if f51_local15 ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN and f51_local15 ~= Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		f51_local15 = Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
	end
	local f51_local16 = Lobby.Process.ReloadPrivateLobby( f51_arg0, f51_local15 )
	local f51_local17 = Lobby.Actions.LobbySettings( f51_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f51_local18 = Lobby.Actions.UpdateUI( f51_arg0, LobbyData.UITargets.UI_MODESELECT )
	local f51_local19 = f51_local16.head
	Lobby.Process.ForceAction( f51_local16.tail, f51_local17 )
	Lobby.Process.ForceAction( f51_local17, f51_local18 )
	local f51_local20 = {
		head = f51_local3,
		interrupt = Lobby.Interrupt.NONE,
		force = false,
		cancellable = true,
		doesNotCancelOthers = true
	}
	if f51_arg1.waitForInstall then
		f51_local20.head = f51_local0
		Lobby.Process.AddActions( f51_local0, f51_local3, f51_local2, f51_local2 )
	end
	Lobby.Process.AddActions( f51_local3, f51_local6, f51_local2, f51_local5 )
	Lobby.Process.AddActions( f51_local6, f51_local9, f51_local2, f51_local8 )
	Lobby.Process.AddActions( f51_local9, f51_local12, f51_local2, f51_local11 )
	Lobby.Process.AddActions( f51_local12, f51_local1, f51_local2, f51_local14 )
	Lobby.Process.ForceAction( f51_local5, f51_local4 )
	Lobby.Process.ForceAction( f51_local4, f51_local19 )
	Lobby.Process.ForceAction( f51_local8, f51_local7 )
	Lobby.Process.ForceAction( f51_local7, f51_local19 )
	Lobby.Process.ForceAction( f51_local11, f51_local10 )
	Lobby.Process.ForceAction( f51_local10, f51_local19 )
	Lobby.Process.ForceAction( f51_local14, f51_local13 )
	Lobby.Process.ForceAction( f51_local13, f51_local19 )
	return f51_local20
end

