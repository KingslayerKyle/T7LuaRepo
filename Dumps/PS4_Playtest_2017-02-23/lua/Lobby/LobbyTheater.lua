require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcess" )

Lobby.Theater = {}
Lobby.Theater.OnSessionStart = function ( data )
	local lobbyMode = data.lobbyMode
	if lobbyMode ~= Enum.LobbyMode.LOBBY_MODE_THEATER then
		return 
	else
		Lobby.Theater.fileID = Engine.DefaultID64Value()
	end
end

Lobby.Theater.OnSessionEnd = function ( data )
	local lobbyMode = data.lobbyMode
	if lobbyMode ~= Enum.LobbyMode.LOBBY_MODE_THEATER then
		return 
	else
		Lobby.MapVote.Clear()
		local controller = Engine.GetPrimaryController()
		Engine.ExecNow( controller, "demo_abortfilesharedownload" )
		Engine.SwitchMode( controller, "" )
		Engine.FreeTheaterMemoryIfAllocated()
		Engine.SetDvar( "ui_demoname", "" )
		Lobby.Theater.fileID = Engine.DefaultID64Value()
		Lobby.Theater.downloadPercent = 0
		local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST )
		Engine.LobbyClearDemoInformation( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType, controller )
	end
end

Lobby.Theater.Pump = function ()
	local currentMenuIdx = Engine.GetLobbyUIScreen()
	local currentMenu = LobbyData.GetLobbyMenuByID( currentMenuIdx )
	if not currentMenu then
		return 
	elseif currentMenu.lobbyMode ~= Enum.LobbyMode.LOBBY_MODE_THEATER then
		return 
	end
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST )
	if Engine.IsLobbyActive( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType ) == false then
		return 
	elseif Engine.IsLobbyHost( lobbyType ) == false then
		return 
	end
	local info = Engine.LobbyGetDemoInformation( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType )
	if info then
		local fileID = info.fileID
		local readyForPlayback = info.readyForPlayback
		local downloadPercent = info.downloadPercent
		local forceRefresh = false
		local theaterDataDownloadedModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.theaterDataDownloaded" )
		local theaterDownloadPercentModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.theaterDownloadPercent" )
		if Engine.GetModelValue( theaterDataDownloadedModel ) == nil or Engine.GetModelValue( theaterDownloadPercentModel ) == nil then
			forceRefresh = true
		end
		if fileID ~= Lobby.Theater.fileID or readyForPlayback ~= Lobby.Theater.readyForPlayback or downloadPercent ~= Lobby.Theater.downloadPercent or forceRefresh then
			Lobby.Theater.fileID = fileID
			Lobby.Theater.readyForPlayback = info.readyForPlayback
			Lobby.Theater.downloadPercent = info.downloadPercent
			Engine.SetModelValue( theaterDataDownloadedModel, Lobby.Theater.readyForPlayback )
			Engine.SetModelValue( theaterDownloadPercentModel, Lobby.Theater.downloadPercent )
		end
	end
end

