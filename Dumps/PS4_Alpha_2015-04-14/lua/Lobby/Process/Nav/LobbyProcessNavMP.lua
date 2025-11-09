require( "lua.Lobby.Process.LobbyProcess" )

Lobby.Core.AddProcessBack( LobbyData.UITargets.UI_MPLOBBYLANGAME, LobbyData.UITargets.UI_MODESELECT, function ( controller, fromTarget, toTarget, withParty )
	return Lobby.ProcessNavigate.LeaveGameLobby( controller, fromTarget, toTarget, withParty )
end )
Lobby.Core.AddProcessForward( LobbyData.UITargets.UI_MPLOBBYONLINE, LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME, function ( controller, fromTarget, toTarget )
	return Lobby.ProcessNavigate.CreateGameLobby( controller, fromTarget, toTarget )
end )
Lobby.Core.AddProcessForward( LobbyData.UITargets.UI_MPLOBBYONLINE, LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME, function ( controller, fromTarget, toTarget )
	return Lobby.ProcessNavigate.CreatePublicGameLobby( controller, fromTarget, toTarget )
end )
Lobby.Core.AddProcessBack( LobbyData.UITargets.UI_MPLOBBYONLINE, LobbyData.UITargets.UI_MODESELECT, function ( controller, fromTarget, toTarget )
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		return Lobby.Process.Navigate( controller, fromTarget, toTarget, "" )
	else
		return Lobby.Process.ReloadPrivateLobby( controller, Engine.GetLobbyNetworkMode() )
	end
end )
Lobby.Core.AddProcessBack( LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME, LobbyData.UITargets.UI_MPLOBBYONLINE, function ( controller, fromTarget, toTarget, withParty )
	return Lobby.ProcessNavigate.LeaveGameLobby( controller, fromTarget, toTarget, withParty )
end )
Lobby.Core.AddProcessBack( LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME, LobbyData.UITargets.UI_MPLOBBYONLINE, function ( controller, fromTarget, toTarget, withParty )
	return Lobby.ProcessNavigate.LeaveGameLobby( controller, fromTarget, toTarget, withParty )
end )
