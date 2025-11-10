require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcess" )

Lobby.Theater = {}
Lobby.Theater.OnSessionStart = function ( f1_arg0 )
	if f1_arg0.lobbyMode ~= Enum.LobbyMode.LOBBY_MODE_THEATER then
		return 
	else
		Lobby.Theater.fileID = Engine.DefaultID64Value()
	end
end

Lobby.Theater.OnSessionEnd = function ( f2_arg0 )
	if f2_arg0.lobbyMode ~= Enum.LobbyMode.LOBBY_MODE_THEATER then
		return 
	else
		Lobby.MapVote.Clear()
		local f2_local0 = Engine.GetPrimaryController()
		Engine.ExecNow( f2_local0, "demo_abortfilesharedownload" )
		Engine.SwitchMode( f2_local0, "" )
		Engine.FreeTheaterMemoryIfAllocated()
		Engine.SetDvar( "ui_demoname", "" )
		Lobby.Theater.fileID = Engine.DefaultID64Value()
		Lobby.Theater.downloadPercent = 0
	end
end

Lobby.Theater.Pump = function ()
	local f3_local0 = LobbyData:UITargetFromId( Engine.GetLobbyUIScreen() )
	if not f3_local0 then
		return 
	elseif f3_local0.lobbyMode ~= Enum.LobbyMode.LOBBY_MODE_THEATER then
		return 
	elseif Engine.IsLobbyHostActive( Enum.LobbyType.LOBBY_TYPE_GAME ) == false then
		return 
	elseif Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) == false then
		return 
	end
	local f3_local1 = Engine.LobbyGetDemoInformation()
	if f3_local1 then
		local f3_local2 = f3_local1.fileID
		if f3_local2 ~= Lobby.Theater.fileID or f3_local1.readyForPlayback ~= Lobby.Theater.readyForPlayback or f3_local1.downloadPercent ~= Lobby.Theater.downloadPercent then
			Lobby.Theater.fileID = f3_local2
			Lobby.Theater.readyForPlayback = f3_local1.readyForPlayback
			Lobby.Theater.downloadPercent = f3_local1.downloadPercent
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.theaterDataDownloaded" ), Lobby.Theater.readyForPlayback )
			Engine.SetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.theaterDownloadPercent" ), Lobby.Theater.downloadPercent )
		end
	end
end

