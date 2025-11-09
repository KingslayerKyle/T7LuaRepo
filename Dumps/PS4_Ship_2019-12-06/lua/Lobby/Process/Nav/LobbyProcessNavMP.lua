require( "lua.Lobby.Process.LobbyProcess" )

Lobby.Core.AddProcessBack( LobbyData.UITargets.UI_MPLOBBYLANGAME, LobbyData.UITargets.UI_MODESELECT, function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	return Lobby.ProcessNavigate.LeaveGameLobby( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
end )
Lobby.Core.AddProcessForward( LobbyData.UITargets.UI_MPLOBBYMAIN, LobbyData.UITargets.UI_MPLOBBYONLINE, function ( f2_arg0, f2_arg1, f2_arg2 )
	return Lobby.Process.Navigate( f2_arg0, f2_arg1, f2_arg2, "mp" )
end )
Lobby.Core.AddProcessForward( LobbyData.UITargets.UI_MPLOBBYMAIN, LobbyData.UITargets.UI_MPLOBBYONLINEARENA, function ( f3_arg0, f3_arg1, f3_arg2 )
	return Lobby.Process.Navigate( f3_arg0, f3_arg1, f3_arg2, "mp" )
end )
Lobby.Core.AddProcessForward( LobbyData.UITargets.UI_MPLOBBYMAIN, LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME, function ( f4_arg0, f4_arg1, f4_arg2 )
	return Lobby.ProcessNavigate.CreateGameLobby( f4_arg0, f4_arg1, f4_arg2 )
end )
Lobby.Core.AddProcessBack( LobbyData.UITargets.UI_MPLOBBYMAIN, LobbyData.UITargets.UI_MODESELECT, function ( f5_arg0, f5_arg1, f5_arg2 )
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		return Lobby.Process.Navigate( f5_arg0, f5_arg1, f5_arg2, "" )
	else
		return Lobby.Process.ReloadPrivateLobby( f5_arg0, Engine.GetLobbyNetworkMode() )
	end
end )
Lobby.Core.AddProcessForward( LobbyData.UITargets.UI_MPLOBBYONLINE, LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME, function ( f6_arg0, f6_arg1, f6_arg2 )
	Lobby.Debug.JBMatchmakingEvent( LuaEnums.JB_MATCHMAKING_EVENT.START )
	return Lobby.ProcessNavigate.CreatePublicGameLobby( f6_arg0, f6_arg1, f6_arg2 )
end )
Lobby.Core.AddProcessBack( LobbyData.UITargets.UI_MPLOBBYONLINE, LobbyData.UITargets.UI_MPLOBBYMAIN, function ( f7_arg0, f7_arg1, f7_arg2 )
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		return Lobby.Process.Navigate( f7_arg0, f7_arg1, f7_arg2, "mp" )
	else
		return Lobby.Process.ReloadPrivateLobby( f7_arg0, Engine.GetLobbyNetworkMode() )
	end
end )
Lobby.Core.AddProcessForward( LobbyData.UITargets.UI_MPLOBBYONLINEARENA, LobbyData.UITargets.UI_MPLOBBYONLINEARENAGAME, function ( f8_arg0, f8_arg1, f8_arg2 )
	return Lobby.ProcessNavigate.CreatePublicGameLobby( f8_arg0, f8_arg1, f8_arg2 )
end )
Lobby.Core.AddProcessBack( LobbyData.UITargets.UI_MPLOBBYONLINEARENA, LobbyData.UITargets.UI_MPLOBBYMAIN, function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		return Lobby.Process.Navigate( f9_arg0, f9_arg1, f9_arg2, "mp" )
	else
		return Lobby.Process.ReloadPrivateLobby( f9_arg0, Engine.GetLobbyNetworkMode() )
	end
end )
Lobby.Core.AddProcessBack( LobbyData.UITargets.UI_MPLOBBYONLINEARENAGAME, LobbyData.UITargets.UI_MPLOBBYONLINEARENA, function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
	return Lobby.ProcessNavigate.LeaveGameLobby( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
end )
Lobby.Core.AddProcessBack( LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME, LobbyData.UITargets.UI_MPLOBBYMAIN, function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
	return Lobby.ProcessNavigate.LeaveGameLobby( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
end )
Lobby.Core.AddProcessBack( LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME, LobbyData.UITargets.UI_MPLOBBYONLINE, function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
	if Lobby.Debug.jbEvent == LuaEnums.JB_MATCHMAKING_EVENT.START then
		Lobby.Debug.JBMatchmakingEvent( LuaEnums.JB_MATCHMAKING_EVENT.ABORT )
	elseif Lobby.Debug.jbEvent == LuaEnums.JB_MATCHMAKING_EVENT.END then
		Lobby.Debug.JBMatchmakingEvent( LuaEnums.JB_MATCHMAKING_EVENT.LEAVE )
	end
	return Lobby.ProcessNavigate.LeaveGameLobby( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
end )
Lobby.Core.AddProcessForward( LobbyData.UITargets.UI_MPLOBBYMAIN, LobbyData.UITargets.UI_FRLOBBYONLINEGAME, function ( f13_arg0, f13_arg1, f13_arg2 )
	return Lobby.ProcessNavigate.CreateGameLobby( f13_arg0, f13_arg1, f13_arg2 )
end )
Lobby.Core.AddProcessBack( LobbyData.UITargets.UI_FRLOBBYONLINEGAME, LobbyData.UITargets.UI_MODESELECT, function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
	return Lobby.ProcessNavigate.LeaveGameLobby( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
end )
Lobby.Core.AddProcessForward( LobbyData.UITargets.UI_MPLOBBYMAIN, LobbyData.UITargets.UI_MPLOBBYONLINETHEATER, function ( f15_arg0, f15_arg1, f15_arg2 )
	return Lobby.ProcessNavigate.CreateGameLobby( f15_arg0, f15_arg1, f15_arg2 )
end )
Lobby.Core.AddProcessBack( LobbyData.UITargets.UI_MPLOBBYONLINETHEATER, LobbyData.UITargets.UI_MPLOBBYMAIN, function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
	return Lobby.ProcessNavigate.LeaveGameLobby( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
end )
