require( "lua.Lobby.Common.LobbyCore" )
require( "lua.Lobby.Process.LobbyProcessNavigate" )
require( "lua.Lobby.Process.LobbyProcess" )
require( "lua.Lobby.Process.LobbyProcessQueue" )
require( "lua.Lobby.LobbyDebug" )
require( "lua.Lobby.LobbyMapVote" )
require( "lua.Lobby.LobbyMerge" )
require( "lua.Lobby.LobbyPartyPrivacy" )
require( "lua.Lobby.LobbyPlatformSession" )
require( "lua.Lobby.LobbyTeamSelection" )
require( "lua.Lobby.LobbyTheater" )
require( "lua.Lobby.LobbyTimer" )
require( "lua.Lobby.Leaderboard" )
require( "ui.T6.SwitchLobbies" )
require( "ui.T7.Utility.CoDUtilityRequire" )

Util = {
	IsNil = function ( object )
		if object == nil then
			return "true"
		else
			return "false"
		end
	end
}
LobbyVM = {
	DevGui = {}
}
LobbyVM.DevGui.LaunchGame = function ()
	if not Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		return 
	elseif not Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		return 
	else
		local controller = Engine.GetPrimaryController()
		LobbyVM.LaunchGameExec( controller, Enum.LobbyType.LOBBY_TYPE_GAME )
	end
end

LobbyVM.DevGui.CustomGameAdvertise = function ()
	if not Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		return 
	elseif not Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		return 
	end
	local curScreenId = Engine.GetLobbyUIScreen()
	if curScreenId ~= LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME.id then
		return 
	end
	local advertisingOnOff = false
	local advertising = "off"
	if not Engine.IsAdvertisedLobby( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		advertisingOnOff = true
		advertising = "on"
		Lobby.Matchmaking.SetupAdvertisingCustomMatch()
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Turning session advertisement " .. advertising .. ".\n" )
	local controller = Engine.GetPrimaryController()
	Lobby.Matchmaking.SetupMatchmakingQuery( controller, Lobby.Matchmaking.SEARCH_MODE_PUBLIC )
	Engine.AdvertiseLobby( -1, Enum.LobbyType.LOBBY_TYPE_GAME, advertisingOnOff )
end

LobbyVM.DevGui.LobbyReset = function ()
	local reset = Lobby.Process.Reset()
	Lobby.ProcessQueue.AddToQueue( "LobbyReset", reset )
end

LobbyVM.PlaySoundHistory = {}
local PlaySound = function ( sound, waitTimeBeforeNextPlay )
	local playSound = false
	if LobbyVM.PlaySoundHistory[sound] == nil then
		playSound = true
	elseif LobbyVM.PlaySoundHistory[sound] < Engine.milliseconds() then
		playSound = true
	end
	if playSound == true then
		Engine.PlaySound( sound )
		LobbyVM.PlaySoundHistory[sound] = Engine.milliseconds() + waitTimeBeforeNextPlay
	end
end

LobbyVM.OnInit = function ()
	Lobby.ProcessQueue.Init()
	Lobby.MapVote.Init()
	Lobby.TeamSelection.Init()
	Lobby.PlatformSession.Init()
end

LobbyVM.OnUILoad = function ( data )
	local init = data.init
	Lobby.Debug.OnUILoad( data )
end

LobbyVM.OnSessionStart = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	Lobby.PartyPrivacy.OnSessionStart( data )
	Lobby.Theater.OnSessionStart( data )
	Lobby.PlatformSession.OnSessionStart( data )
end

LobbyVM.OnSessionEnd = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	Lobby.MapVote.OnSessionEnd( data )
	Lobby.Timer.OnSessionEnd( data )
	Lobby.TeamSelection.OnSessionEnd( data )
	Lobby.Theater.OnSessionEnd( data )
	Lobby.PlatformSession.OnSessionEnd( data )
end

LobbyVM.OnClientAdded = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	local xuid = data.xuid
	Lobby.Matchmaking.OnClientAdded( data )
	Lobby.TeamSelection.OnClientAdded( data )
	Lobby.PlatformSession.OnClientAdded( data )
	Engine.QoSProbeListenerUpdate( lobbyType )
	if lobbyModule == Enum.LobbyModule.LOBBY_MODULE_CLIENT then
		Engine.AddLobbyClientExtracam( data.xuid )
	end
	if lobbyModule == Enum.LobbyModule.LOBBY_MODULE_CLIENT and not Engine.IsLocalClient( xuid ) then
		PlaySound( LobbyData.Sounds.ClientsAddedToLobby, 500 )
	end
end

LobbyVM.OnClientRemoved = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	local xuid = data.xuid
	Lobby.TeamSelection.OnClientRemoved( data )
	Lobby.PlatformSession.OnClientRemoved( data )
	Engine.QoSProbeListenerUpdate( lobbyType )
	if lobbyModule == Enum.LobbyModule.LOBBY_MODULE_CLIENT then
		Engine.RemoveLobbyClientExtracam( data.xuid )
	end
	if lobbyModule == Enum.LobbyModule.LOBBY_MODULE_CLIENT and not Engine.IsLocalClient( xuid ) then
		PlaySound( LobbyData.Sounds.ClientsRemovedFromLobby, 500 )
	end
end

LobbyVM.OnMatchStart = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	Lobby.MapVote.OnMatchStart( data )
end

LobbyVM.OnMatchEnd = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	Lobby.TeamSelection.OnMatchEnd( data )
	Lobby.Timer.OnMatchEnd( data )
	Lobby.MapVote.OnMatchEnd( data )
end

LobbyVM.OnLeaveWithParty = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	LobbyVM.LobbyLeaveWithParty( data )
end

LobbyVM.OnGametypeSettingsChange = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	Lobby.TeamSelection.OnGametypeSettingsChange( data )
end

LobbyVM.OnPartyPrivacyChange = function ( data )
	local partyPrivacy = data.partyPrivacy
end

LobbyVM.OnInviteAccepted = function ( data )
	Lobby.PlatformSession.OnInviteAccepted( data )
end

LobbyVM.InitilizeGunsmithBuffer = function ( data )
	CoD.CraftUtility.Gunsmith.InitializeBuffer( data )
end

LobbyVM.LobbyHostLeftNoMigration = function ( data )
	local controller = data.controller
	local lobbyType = data.lobbyType
	local lobbyMainMode = data.lobbyMainMode
	local lobbyNetworkMode = data.lobbyNetworkMode
	local maxClients = data.maxClients
	local isGameLobbyActive = data.isGameLobbyActive
	local isPrivateHost = data.isPrivateHost
	if isGameLobbyActive == true then
		if Lobby.ProcessQueue.GetCurrentRunningProcessName() ~= "HostLeftNoMigrationGame" then
			local process = Lobby.Process.Recover( controller )
			Lobby.ProcessQueue.AddToQueue( "HostLeftNoMigrationGame", process )
		end
	else
		local process = Lobby.Process.HostLeftNoMigrationCreatePrivateLobby( controller, lobbyMainMode, maxClients )
		Lobby.ProcessQueue.AddToQueue( "HostLeftNoMigration", process )
	end
	Engine.PlaySound( LobbyData.Sounds.LobbyClosed )
end

LobbyVM.LobbyHostLeft_InGameMigrateFinished = function ( data )
	local process = Lobby.Process.Recover( data.controller )
	Lobby.ProcessQueue.AddToQueue( "LobbyHostLeft_InGameMigrateFinished", process )
	Engine.PlaySound( LobbyData.Sounds.LobbyClosed )
end

LobbyVM.LobbyClientLeftEvent = function ( data )
	local controller = data.controller
	local lobbyType = data.lobbyType
	local lobbyMainMode = data.lobbyMainMode
	local lobbyNetworkMode = data.lobbyNetworkMode
	local maxClients = data.maxClients
	local process = Lobby.Process.Recover( controller )
	Lobby.ProcessQueue.AddToQueue( "LobbyClientLeft", process )
end

LobbyVM.Devmap = function ( data )
	local controller = data.controller
	local mainMode = data.mainMode
	local process = Lobby.Process.Devmap( controller, mainMode )
	Lobby.ProcessQueue.AddToQueue( "Devmap", process )
end

LobbyVM.NetworkModeChanged = function ( data )
	local controller = data.controller
	local networkMode = data.networkMode
	local process = Lobby.Process.ReloadPrivateLobby( controller, networkMode )
	Lobby.ProcessQueue.AddToQueue( "NetworkModeChanged", process )
end

LobbyVM.GoForward = function ( data )
	local controller = data.controller
	local openMenu = data.navToMenu
	local withParty = data.withParty
	local currentMenuId = LobbyData.GetLobbyNav()
	local fromTarget = LobbyData:UITargetFromId( currentMenuId )
	local toTarget = LobbyData:UITargetFromName( openMenu )
	if fromTarget == nil then
		error( "LobbyVM: No menu called '" .. currentMenu .. "' found." )
	end
	if toTarget == nil then
		error( "LobbyVM: No menu called '" .. openMenu .. "' found." )
	end
	local processFunc = Lobby.Process.GetForwardFunc( fromTarget, toTarget )
	if processFunc == nil then
		error( "LobbyVM: No forward process function found to move from '" .. fromTarget.name .. "' to '" .. openMenu .. "'." )
	end
	local process = processFunc( controller, fromTarget, toTarget )
	Lobby.ProcessQueue.AddToQueue( "GoForward from '" .. fromTarget.name .. "' menu to '" .. toTarget.name .. "' menu.", process )
end

LobbyVM.GoBack = function ( data )
	local controller = data.controller
	local withParty = data.withParty
	local fromTarget = LobbyData:UITargetFromId( LobbyData.GetLobbyNav() )
	if fromTarget == nil then
		error( "LobbyVM: No menu called '" .. currentMenu .. "' found." )
	end
	local toTarget, processFunc = Lobby.Process.GetBackFunc( fromTarget )
	if toTarget == nil or processFunc == nil then
		error( "LobbyVM: No back process function found for '" .. currentMenu( "'." ) )
	end
	local process = processFunc( controller, fromTarget, toTarget, withParty )
	Lobby.ProcessQueue.AddToQueue( "GoBackFrom" .. fromTarget.name, process )
end

LobbyVM.Join = function ( data )
	local lobbyType = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if Engine.Lobby_IsPlayerInLobby( lobbyType, data.xuid ) then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "LobbyVM: Trying to Join lobby we are already part of\n" )
		return 
	else
		local process = Lobby.Process.Join( data.controller, data.xuid, data.joinType, LobbyData.PARTY_WITHOUT )
		Lobby.ProcessQueue.AddToQueue( "Join", process )
	end
end

LobbyVM.JoinSystemlink = function ( data )
	local process = Lobby.Process.JoinSystemlink( data.controller, data.lobbyMainMode, data.lobbyNetworkMode, data.hostXuid, data.hostInfo )
	Lobby.ProcessQueue.AddToQueue( "JoinSystemLink", process )
end

LobbyVM.CreateDedicatedLANLobby = function ()
	local process = Lobby.Process.CreateDedicatedLANLobby( 0, LobbyData.UITargets.UI_MPLOBBYLANGAME )
	Lobby.ProcessQueue.AddToQueue( "CreateDedicatedLANLobby", process )
end

LobbyVM.CreateDedicatedLobby = function ( data )
	local process = Lobby.Process.CreateDedicatedLobby( 0, LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME )
	Lobby.ProcessQueue.AddToQueue( "CreateDedicatedLobby", process )
end

LobbyVM.ForceToMenu = function ( data )
	local target = LobbyData:UITargetFromName( data.menuName )
	local process = Lobby.Process.ForceToMenu( data.controller, target, data.msg )
	Lobby.ProcessQueue.AddToQueue( "ForceToMenu", process )
end

LobbyVM.LobbyClientPromoteToHost = function ( data )
	local process = Lobby.Process.PromoteClientToHost( data.controller, data.lobbyMainMode, data.lobbyType, data.lobbyMode, data.maxClients, data.hostInfo, data.isAdvertised, data.isInGame, data.newMigrateIndex )
	Lobby.ProcessQueue.AddToQueue( "PromoteClientToHost", process )
end

LobbyVM.LobbyLeaveWithParty = function ( data )
	local lobbyModule = data.lobbyModule
	local lobbyType = data.lobbyType
	local lobbyMode = data.lobbyMode
	local process = Lobby.Process.LeaveWithParty( lobbyModule, lobbyType, lobbyMode )
	if process == nil then
		return 
	else
		Lobby.ProcessQueue.AddToQueue( "LeaveWithParty", process )
	end
end

LobbyVM.Error = function ( data )
	if data.isFatal == true then
		local process = Lobby.Process.Recover( data.controller )
		Lobby.ProcessQueue.AddToQueue( "ErrorFatal", process )
	else
		local process = Lobby.Process.NonFatalError( data.msg )
		Lobby.ProcessQueue.AddToQueue( "ErrorNonFatal", process )
	end
end

LobbyVM.OnErrorShutdown = function ( data )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Performing emergency shutdown.\n" )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Shutting down joins.\n" )
	Engine.LobbyJoinErrorShutdown()
	if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Shutting down qos probes.\n" )
		Engine.QoSErrorShutdown( Enum.LobbyType.LOBBY_TYPE_GAME )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Shutting down advertisement.\n" )
		Engine.AdvertiseErrorShutdown( Enum.LobbyType.LOBBY_TYPE_GAME )
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Shuttding down search.\n" )
		Engine.LobbySearchErrorShutdown()
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Shutting down private lobby.\n" )
	Engine.LobbyClientErrorShutdown( Enum.LobbyType.LOBBY_TYPE_GAME )
	Engine.LobbyHostErrorShutdown( Enum.LobbyType.LOBBY_TYPE_GAME )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Shutting down game lobby.\n" )
	Engine.LobbyClientErrorShutdown( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	Engine.LobbyHostErrorShutdown( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Clearing process queue.\n" )
	Lobby.ProcessQueue.ErrorShutdown()
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Forcing UI screen.\n" )
	Engine.ForceUIScreen( LobbyData.UITargets.UI_MAIN.id )
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBY, "Lobby emergency shutdown complete.\n" )
end

LobbyVM.LobbySettings = function ( data )
	local controller = data.controller
	local toTarget = data.toTarget
	local skipSwitchMode = data.skipSwitchMode
	if type( toTarget ) == "number" then
		toTarget = LobbyData:UITargetFromId( toTarget )
	end
	if toTarget == nil then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Tried to apply settings for an invalid target.\n" )
		return 
	end
	Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "Applying settings for menu: " .. toTarget.name .. ".\n" )
	if not skipSwitchMode then
		local currentMainMode = Engine.GetLobbyMainMode()
		local targetMainMode = toTarget.mainMode
		if currentMainMode ~= targetMainMode then
			if targetMainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
				Engine.SwitchMode( controller, "mp" )
			elseif targetMainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
				Engine.SwitchMode( controller, "cp" )
			elseif targetMainMode == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
				Engine.SwitchMode( controller, "zm" )
			else
				Engine.SwitchMode( controller, "" )
			end
		end
	end
	if toTarget.eMode == LobbyData.EMODE_INVALID then
		Engine.GameModeResetModes()
	else
		Engine.TEMPGameModeSetMode( toTarget.eMode )
	end
	LobbyData.SetLobbyNav( toTarget )
	Engine.SetUIScreen( toTarget.id )
	local roomModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.room" )
	Engine.SetModelValue( roomModel, toTarget.room )
end

LobbyVM.Leaderboard_CalculateLBColValue = function ( data )
	return Lobby.Leaderboard.CalculateLBColValue( data )
end

LobbyVM.Leaderboard_ShouldWriteLeaderboard = function ( data )
	return Lobby.Leaderboard.ShouldWriteLeaderboard( data )
end

LobbyVM.LaunchGameExec = function ( controller, lobbyType )
	if lobbyType ~= Enum.LobbyType.LOBBY_TYPE_GAME then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Launch game not supported for this lobby type(" .. lobbyType .. ")\n" )
		return 
	elseif Lobby.ProcessQueue.IsQueueEmpty() then
		local mapName = Dvar.ui_mapname:get()
		local gameType = Dvar.ui_gametype:get()
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "** Launching game... **\n" )
		Engine.Exec( controller, "lobbyLaunchGame " .. lobbyType .. " " .. mapName .. " " .. gameType )
	else
		local head = Lobby.ProcessQueue.GetQueueHead()
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Warning: Could not launch game. Lobby process '" .. head.name .. "' in progress.\n" )
	end
end

LobbyVM.LaunchDemoExec = function ( controller, lobbyType )
	if lobbyType ~= Enum.LobbyType.LOBBY_TYPE_GAME then
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Launch demo not supported for this lobby type(" .. lobbyType .. ")\n" )
		return 
	elseif Lobby.ProcessQueue.IsQueueEmpty() then
		Engine.PrintInfo( Enum.consoleLabel.LABEL_LOBBYHOST, "** Launching demo... **\n" )
		Engine.Exec( controller, "lobbyLaunchDemo" )
	else
		local head = Lobby.ProcessQueue.GetQueueHead()
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYHOST, "Warning: Could not launch damo. Lobby process '" .. head.name .. "' in progress.\n" )
	end
end

LobbyVM.LaunchGame = function ( data )
	Lobby.Timer.LaunchGame( data )
end

LobbyVM.LaunchDemo = function ( data )
	Lobby.Timer.LaunchGame( data )
end

LobbyVM.UpdateLobbyStatusInfo = function ( data )
	Lobby.Timer.UpdateLobbyStatusInfo( data )
end

LobbyVM.SwitchTeam = function ( data )
	Lobby.TeamSelection.SwitchTeam( data )
end

LobbyVM.GameModeChanged = function ( data )
	Lobby.TeamSelection.GameModeChanged( data )
end

LobbyVM.UpdateAdvertising = function ( data )
	Lobby.Matchmaking.UpdateAdvertising( data )
end

LobbyVM.Invite = function ( data )
	Lobby.PlatformSession.Invite( data )
end

LobbyVM.ChangeSigninState = function ( data )
	local process = nil
	if data.onlineState == Enum.LiveUserState.LIVE_USER_SIGNED_OUT then
		if data.isPrimary then
			process = Lobby.Process.PrimaryControllerSignedOut( data.controller )
		end
	elseif data.onlineState == Enum.LiveUserState.LIVE_USER_SIGNED_IN then
		if data.isPrimary then
			process = Lobby.Process.PrimaryControllerSignedIn( data.controller )
		end
	else
		DebugPrint( "Warning unknown signin State [" .. data.onlineState .. "]" )
	end
	if process ~= nil then
		Lobby.ProcessQueue.AddToQueue( "ChangeSignInState", process )
	end
end

LobbyVM.ProcessCompleteSuccess = function ( data )
	Lobby.ProcessQueue.Success( data )
end

LobbyVM.ProcessCompleteFailure = function ( data )
	Lobby.ProcessQueue.Failure( data )
end

LobbyVM.ProcessCompleteError = function ( data )
	Lobby.ProcessQueue.Error( data )
end

LobbyVM.ProcessUpdate = function ( data )
	Lobby.ProcessQueue.Update( data )
end

LobbyVM.GameLobbyGameServerDataUpdate = function ( data )
	Lobby.MapVote.GameLobbyGameServerDataUpdate( data )
end

LobbyVM.GameLobbyClientDataUpdate = function ( data )
	Lobby.MapVote.GameLobbyClientDataUpdate( data )
	Lobby.TeamSelection.GameLobbyClientDataUpdate( data )
end

LobbyVM.Pump = function ()
	Lobby.ProcessQueue.Pump()
	Lobby.MapVote.Pump()
	Lobby.Matchmaking.Pump()
	Lobby.Merge.Pump()
	Lobby.TeamSelection.Pump()
	Lobby.Timer.Pump()
	Lobby.Debug.Pump()
	Lobby.Theater.Pump()
	Lobby.PlatformSession.Pump()
end

