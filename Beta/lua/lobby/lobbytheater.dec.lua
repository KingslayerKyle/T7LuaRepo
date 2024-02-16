require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcess" )

Lobby.Theater = {}
Lobby.Theater.OnSessionStart = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	if lobbyMode ~= Enum.LobbyMode.LOBBY_MODE_THEATER then
		return 
	else
		Lobby.Theater.fileID = Engine.DefaultID64Value()
	end
end

Lobby.Theater.OnSessionEnd = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	if lobbyMode ~= Enum.LobbyMode.LOBBY_MODE_THEATER then
		return 
	else
		local controller = Engine.GetPrimaryController()
		Engine.ExecNow( controller, "demo_abortfilesharedownload" )
		Engine.SwitchMode( controller, "" )
		Engine.FreeTheaterMemoryIfAllocated()
		Engine.SetDvar( "ui_demoname", "" )
		Lobby.Theater.fileID = Engine.DefaultID64Value()
	end
end

Lobby.Theater.Pump = function ()
	local currentMenuIdx = Engine.GetLobbyUIScreen()
	local currentMenu = LobbyData:UITargetFromId( currentMenuIdx )
	if not currentMenu then
		return 
	elseif currentMenu.lobbyMode ~= Enum.LobbyMode.LOBBY_MODE_THEATER then
		return 
	elseif Engine.IsLobbyHostActive( Enum.LobbyType.LOBBY_TYPE_GAME ) == false then
		return 
	elseif Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) == false then
		return 
	end
	local info = Engine.LobbyGetDemoInformation()
	if info then
		local fileID = info.fileID
		local readyForPlayback = info.readyForPlayback
		if fileID ~= Lobby.Theater.fileID or readyForPlayback ~= Lobby.Theater.readyForPlayback then
			Lobby.Theater.fileID = fileID
			Lobby.Theater.readyForPlayback = info.readyForPlayback
			local theaterDataModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.theaterDataDownloaded" )
			Engine.SetModelValue( theaterDataModel, Lobby.Theater.readyForPlayback )
		end
	end
end

