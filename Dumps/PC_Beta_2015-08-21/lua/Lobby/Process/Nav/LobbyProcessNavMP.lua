require( "lua.Lobby.Process.LobbyProcess" )

Lobby.Core.AddProcessBack( LobbyData.UITargets.UI_MPLOBBYLANGAME, LobbyData.UITargets.UI_MODESELECT, function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	return Lobby.ProcessNavigate.LeaveGameLobby( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
end )
Lobby.Core.AddProcessForward( LobbyData.UITargets.UI_MPLOBBYONLINE, LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME, function ( f2_arg0, f2_arg1, f2_arg2 )
	return Lobby.ProcessNavigate.CreateGameLobby( f2_arg0, f2_arg1, f2_arg2 )
end )
Lobby.Core.AddProcessForward( LobbyData.UITargets.UI_MPLOBBYONLINE, LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME, function ( f3_arg0, f3_arg1, f3_arg2 )
	return Lobby.ProcessNavigate.CreatePublicGameLobby( f3_arg0, f3_arg1, f3_arg2 )
end )
if Dvar.ui_execdemo_beta:get() then
	Lobby.Core.AddProcessBack( LobbyData.UITargets.UI_MPLOBBYONLINE, LobbyData.UITargets.UI_MAIN, function ( f4_arg0, f4_arg1, f4_arg2 )
		return Lobby.ProcessNavigate.LeavePrivateLobby( f4_arg0, f4_arg1, f4_arg2 )
	end )
else
	Lobby.Core.AddProcessBack( LobbyData.UITargets.UI_MPLOBBYONLINE, LobbyData.UITargets.UI_MODESELECT, function ( f5_arg0, f5_arg1, f5_arg2 )
		if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
			return Lobby.Process.Navigate( f5_arg0, f5_arg1, f5_arg2, "" )
		else
			return Lobby.Process.ReloadPrivateLobby( f5_arg0, Engine.GetLobbyNetworkMode() )
		end
	end )
end
Lobby.Core.AddProcessBack( LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME, LobbyData.UITargets.UI_MPLOBBYONLINE, function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
	return Lobby.ProcessNavigate.LeaveGameLobby( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
end )
Lobby.Core.AddProcessBack( LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME, LobbyData.UITargets.UI_MPLOBBYONLINE, function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
	return Lobby.ProcessNavigate.LeaveGameLobby( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
end )
