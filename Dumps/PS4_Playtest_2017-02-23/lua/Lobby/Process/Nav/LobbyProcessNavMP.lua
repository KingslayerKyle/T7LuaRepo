require( "lua.Lobby.Process.LobbyProcess" )

Lobby.Core.AddProcessBack( LuaEnum.UI.LAN_MP, LuaEnum.UI.MODE_SELECT_LAN, function ( controller, fromTarget, toTarget, withParty )
	local createLobbyProcess = Lobby.ProcessNavigate.ExitLANLobby( controller, fromTarget, toTarget, withParty )
	local modeSelectMenu = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_LAN )
	if CoDShared.IsDirectorEnabled() == false and Engine.GetDvarInt( "mp_prototype" ) ~= 0 and Engine.IsUsingCursor() and Engine.GetDvarBool( "ui_usingFreeCursor" ) then
		local moveToMainProcess = Lobby.ProcessNavigate.LeavePrivateLobby( controller, modeSelectMenu, LuaEnum.UI.MAIN )
		Lobby.Process.AppendProcess( createLobbyProcess, moveToMainProcess )
	end
	return createLobbyProcess
end )
Lobby.Core.AddProcessForward( LuaEnum.UI.LAN_MP, LuaEnum.UI.LAN_CP, function ( controller, fromTarget, toTarget, withParty )
	local modeSelectMenu = LobbyData.GetLobbyMenuByName( LuaEnum.UI.MODE_SELECT_LAN )
	local cpLanMenu = LobbyData.GetLobbyMenuByName( LuaEnum.UI.LAN_CP )
	local toModeSelectProcess = Lobby.ProcessNavigate.LeaveGameLobby( controller, fromTarget, modeSelectMenu, withParty )
	local f2_local0 = Lobby.Core.GetForwardProcessFunc( modeSelectMenu, cpLanMenu )
	local moveToMPProcess = f2_local0( controller, modeSelectMenu, cpLanMenu )
	Lobby.Process.AppendProcess( toModeSelectProcess, moveToMPProcess )
	return toModeSelectProcess
end )
Lobby.Core.AddProcessForward( LuaEnum.UI.ONLINE_MP, LuaEnum.UI.ONLINE_MP_PUBLIC_STAGING, function ( controller, fromTarget, toTarget )
	return Lobby.Process.Navigate( controller, fromTarget, toTarget, "mp" )
end )
Lobby.Core.AddProcessForward( LuaEnum.UI.ONLINE_MP, LuaEnum.UI.ONLINE_MP_ARENA_STAGING, function ( controller, fromTarget, toTarget )
	return Lobby.Process.Navigate( controller, fromTarget, toTarget, "mp" )
end )
Lobby.Core.AddProcessForward( LuaEnum.UI.ONLINE_MP, LuaEnum.UI.ONLINE_MP_CUSTOM, function ( controller, fromTarget, toTarget )
	return Lobby.ProcessNavigate.CreateGameLobby( controller, fromTarget, toTarget )
end )
Lobby.Core.AddProcessBack( LuaEnum.UI.ONLINE_MP, LuaEnum.UI.MODE_SELECT_ONLINE, function ( controller, fromTarget, toTarget )
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		return Lobby.Process.Navigate( controller, fromTarget, toTarget, "" )
	else
		return Lobby.Process.ReloadPrivateLobby( controller, Engine.GetLobbyNetworkMode() )
	end
end )
Lobby.Core.AddProcessForward( LuaEnum.UI.ONLINE_MP_PUBLIC_STAGING, LuaEnum.UI.ONLINE_MP_PUBLIC, function ( controller, fromTarget, toTarget )
	Lobby.Debug.JBMatchmakingEvent( LuaEnum.JB_MATCHMAKING_EVENT.START )
	return Lobby.ProcessNavigate.CreatePublicGameLobby( controller, fromTarget, toTarget )
end )
Lobby.Core.AddProcessBack( LuaEnum.UI.ONLINE_MP_PUBLIC_STAGING, LuaEnum.UI.ONLINE_MP, function ( controller, fromTarget, toTarget )
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		return Lobby.Process.Navigate( controller, fromTarget, toTarget, "mp" )
	else
		return Lobby.Process.ReloadPrivateLobby( controller, Engine.GetLobbyNetworkMode() )
	end
end )
Lobby.Core.AddProcessForward( LuaEnum.UI.ONLINE_MP_ARENA_STAGING, LuaEnum.UI.ONLINE_MP_ARENA, function ( controller, fromTarget, toTarget )
	return Lobby.ProcessNavigate.CreatePublicGameLobby( controller, fromTarget, toTarget )
end )
Lobby.Core.AddProcessBack( LuaEnum.UI.ONLINE_MP_ARENA_STAGING, LuaEnum.UI.ONLINE_MP, function ( controller, fromTarget, toTarget, withParty )
	if Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		return Lobby.Process.Navigate( controller, fromTarget, toTarget, "mp" )
	else
		return Lobby.Process.ReloadPrivateLobby( controller, Engine.GetLobbyNetworkMode() )
	end
end )
Lobby.Core.AddProcessBack( LuaEnum.UI.ONLINE_MP_ARENA, LuaEnum.UI.ONLINE_MP_ARENA_STAGING, function ( controller, fromTarget, toTarget, withParty )
	return Lobby.ProcessNavigate.LeaveGameLobby( controller, fromTarget, toTarget, withParty )
end )
Lobby.Core.AddProcessBack( LuaEnum.UI.ONLINE_MP_CUSTOM, LuaEnum.UI.ONLINE_MP, function ( controller, fromTarget, toTarget, withParty )
	return Lobby.ProcessNavigate.LeaveGameLobby( controller, fromTarget, toTarget, withParty )
end )
Lobby.Core.AddProcessBack( LuaEnum.UI.ONLINE_MP_PUBLIC, LuaEnum.UI.ONLINE_MP_PUBLIC_STAGING, function ( controller, fromTarget, toTarget, withParty )
	if Lobby.Debug.jbEvent == LuaEnum.JB_MATCHMAKING_EVENT.START then
		Lobby.Debug.JBMatchmakingEvent( LuaEnum.JB_MATCHMAKING_EVENT.ABORT )
	elseif Lobby.Debug.jbEvent == LuaEnum.JB_MATCHMAKING_EVENT.END then
		Lobby.Debug.JBMatchmakingEvent( LuaEnum.JB_MATCHMAKING_EVENT.LEAVE )
	end
	return Lobby.ProcessNavigate.LeaveGameLobby( controller, fromTarget, toTarget, withParty )
end )
Lobby.Core.AddProcessForward( LuaEnum.UI.ONLINE_MP, LuaEnum.UI.ONLINE_FR, function ( controller, fromTarget, toTarget )
	return Lobby.ProcessNavigate.CreateGameLobby( controller, fromTarget, toTarget )
end )
Lobby.Core.AddProcessBack( LuaEnum.UI.ONLINE_FR, LuaEnum.UI.MODE_SELECT_ONLINE, function ( controller, fromTarget, toTarget, withParty )
	return Lobby.ProcessNavigate.LeaveGameLobby( controller, fromTarget, toTarget, withParty )
end )
Lobby.Core.AddProcessForward( LuaEnum.UI.ONLINE_MP, LuaEnum.UI.ONLINE_MP_THEATER, function ( controller, fromTarget, toTarget )
	return Lobby.ProcessNavigate.CreateGameLobby( controller, fromTarget, toTarget )
end )
Lobby.Core.AddProcessBack( LuaEnum.UI.ONLINE_MP_THEATER, LuaEnum.UI.ONLINE_MP, function ( controller, fromTarget, toTarget, withParty )
	return Lobby.ProcessNavigate.LeaveGameLobby( controller, fromTarget, toTarget, withParty )
end )
