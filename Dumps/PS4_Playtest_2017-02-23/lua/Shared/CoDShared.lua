require( "lua.Shared.LuaReadOnlyTables" )

local shared = {}
local lastGametype, gametypeTeamBased = nil
shared.IsGametypeTeamBased = function ( gametype )
	if not gametype then
		gametype = Dvar.ui_gametype:get()
	end
	if gametype == lastGametype then
		return gametypeTeamBased
	else
		local gameTypeInfo = Engine.GetGameTypeInfo( gametype )
		local teamGame = gameTypeInfo.isTeamBased
		if teamGame == nil then
			return false
		else
			lastGametype = gametype
			gametypeTeamBased = teamGame
			return teamGame
		end
	end
end

shared.IsHardcoreGametypeAvailable = function ( gametype )
	if not gametype then
		gametype = Dvar.ui_gametype:get()
	end
	local gameTypeInfo = Engine.GetGameTypeInfo( gametype )
	local hardcoreAvailable = gameTypeInfo.isHardcoreAvailable
	if hardcoreAvailable == nil then
		return false
	else
		return hardcoreAvailable
	end
end

shared.ChunkAllDownloading = function ()
	if (LuaDefine.isPS4 or LuaDefine.isXbox) and Engine.IsMpStillDownloading() and Engine.IsZmStillDownloading() and Engine.IsCpStillDownloading() then
		return true
	else
		return false
	end
end

shared.ChunkAnyDownloading = function ()
	if (LuaDefine.isPS4 or LuaDefine.isXbox) and (Engine.IsMpStillDownloading() or Engine.IsZmStillDownloading() or Engine.IsCpStillDownloading() or Engine.IsZmInitialStillDownloading() or Engine.IsMpInitialStillDownloading()) then
		return true
	else
		return false
	end
end

shared.IsTeamBasedGame = function ()
	if Engine.IsDedicatedServer() then
		return Engine.GetGametypeSetting( "teamCount" ) > 1
	elseif Engine.IsInGame() then
		return CoDShared.IsGametypeTeamBased()
	else
		return CoDShared.IsGametypeTeamBased( Engine.GetCurrentGameType() )
	end
end

shared.IsLobbyMode = function ( expressionArg )
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	if lobbyNav then
		local menu = LobbyData.GetLobbyMenuByID( lobbyNav )
		return menu.lobbyMode == expressionArg
	else
		
	end
end

shared.IsOnlineGame = function ()
	if Engine.SessionMode_IsOnlineGame() then
		return true
	else
		return false
	end
end

shared.IsRankedGame = function ()
	local f8_local0
	if shared.IsOnlineGame() == true then
		f8_local0 = not Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_MATCHMAKING_MANUAL )
	else
		f8_local0 = false
	end
	return f8_local0
end

shared.IsHost = function ()
	return Engine.GetDvarBool( "com_sv_running" )
end

shared.GetTeamDifference = function ( team )
	if team ~= Enum.team_t.TEAM_ALLIES and team ~= Enum.team_t.TEAM_AXIS then
		return 0
	end
	local gamelobby = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	local members = gamelobby.sessionClients
	local teamAllies = 0
	local teamAxis = 0
	for i, member in ipairs( members ) do
		if member.team == Enum.team_t.TEAM_ALLIES then
			teamAllies = teamAllies + 1
		end
		if member.team == Enum.team_t.TEAM_AXIS then
			teamAxis = teamAxis + 1
		end
	end
	if team == Enum.team_t.TEAM_ALLIES then
		return teamAllies - teamAxis
	end
	return teamAxis - teamAllies
end

shared.IsTeamOverwhelmed = function ( controller )
	local localClientXuid = Engine.GetXUID64( controller )
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
	local team = Engine.GetTeamForXUID( Enum.LobbyModule.LOBBY_MODULE_CLIENT, lobbyType, localClientXuid )
	local overwhelmedGap = Dvar.arena_unfairTeamGap:get() * -1
	if overwhelmedGap == 0 or overwhelmedGap < shared.GetTeamDifference( team ) then
		return false
	else
		return true
	end
end

shared.QuitGame = function ( controller, probationExcused )
	if Engine.IsRunningUILevel() then
		return true
	end
	local lobbyCount = Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyClientFilterType.LOBBY_CLIENT_FILTER_TYPE_ALL )
	local lobbyLocalCount = Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyClientFilterType.LOBBY_CLIENT_FILTER_TYPE_LOCAL )
	local hostInfo = Engine.GetLobbyHostInfo( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	if hostInfo ~= nil then
		if nil ~= LobbyVM then
			Lobby.Events.EventDispatcher( "OnMatchmakingPriorityQuit", {
				hostSecId = hostInfo.secIdint
			} )
		else
			Engine.LobbyEvent( "OnMatchmakingPriorityQuit", {
				hostSecId = hostInfo.secIdint
			} )
		end
	end
	if shared.IsLobbyMode( Enum.LobbyMode.LOBBY_MODE_THEATER ) == true then
		local isGameHost = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
		if not isGameHost then
			Engine.GameModeResetModes()
			Engine.SessionModeResetModes()
			Engine.Exec( controller, "disconnect" )
		else
			Engine.Exec( controller, "xpartystopdemo" )
		end
		return true
	elseif not shared.IsRankedGame() and shared.IsHost() then
		Engine.SendMenuResponse( controller, "popup_leavegame", "endround" )
	elseif not shared.IsHost() then
		if probationExcused then
			Engine.UpdateStatsForQuitUnbalancedTeam( controller, false )
		else
			Engine.UpdateStatsForQuit( controller, false )
		end
		Engine.Exec( controller, "disconnect" )
	elseif shared.IsRankedGame() and shared.IsHost() and not Engine.HostMigrationWaitingForPlayers() and Engine.GetDvarInt( "g_gameEnded" ) ~= 1 then
		Engine.UpdateStatsForQuit( controller, true )
		if (Engine.IsZombiesGame() or shared.IsGameTypeDOA() or Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_FREERUN )) and (lobbyCount < Dvar.migration_minclientcount:get() or lobbyCount == lobbyLocalCount) then
			Engine.SendMenuResponse( controller, "popup_leavegame", "endround" )
		else
			if Engine.IsMultiplayerGame() or Engine.IsZombiesGame() or shared.IsGameTypeDOA() then
				Engine.Exec( controller, "hostmigration_start" )
				return false
			end
			Engine.SendMenuResponse( controller, "popup_leavegame", "endround" )
		end
	end
	return true
end

shared.IsGameTypeDOA = function ()
	local f13_local0
	if (Dvar.ui_gametype == nil or Dvar.ui_gametype:get() ~= "doa") and (nil == Engine.GetCurrentMap() or Engine.GetCurrentMap() ~= "cp_doa_bo3") then
		f13_local0 = LuaUtils.IsDOATarget( Engine.GetLobbyUIScreen() )
	else
		f13_local0 = true
	end
	return f13_local0
end

shared.IsLootHero = function ( heroInfo )
	if heroInfo ~= nil and heroInfo.assetName ~= nil and heroInfo.assetName == "pbt_mp_blackmarket" then
		return true
	else
		return false
	end
end

shared.GetLootItemCategory = function ( itemId )
	local lootTableName = "gamedata/loot/mplootitems.csv"
	local itemIdColumn = 1
	local categoryColumn = 2
	local lootRows = Engine.TableFindRows( lootTableName, itemIdColumn, itemId )
	if lootRows == nil or #lootRows == 0 then
		return -1
	else
		local itemCategory = Engine.TableLookupGetColumnValueForRow( lootTableName, lootRows[1], categoryColumn )
		if itemCategory == nil then
			return -1
		else
			return itemCategory
		end
	end
end

shared.ForceOffline = function ()
	if (LuaDefine.isPS4 or LuaDefine.isXbox) and LuaUtils.IsSkuOfflineOnly() then
		return true
	else
		return false
	end
end

shared.IsCurrentTextLanguageEnglish = function ()
	local currentLanguage = Dvar.loc_language:get()
	if currentLanguage == Enum.language_t.LANGUAGE_ENGLISH then
		return true
	else
		return false
	end
end

shared.IsMainFirstTimeSetup = function ( controller )
	if not shared.IsIntDvarNonZero( "ui_allowFirstTime" ) then
		return false
	elseif shared.IsInGame() then
		return false
	elseif controller > 0 then
		return false
	elseif Dvar.livestats_skipFirstTime:get() then
		return false
	else
		return Engine.GetProfileVarInt( controller, "com_first_time" ) ~= 0
	end
end

shared.IsGameInstalled = function ()
	local f19_local0
	if not Engine.IsCpStillDownloading() then
		f19_local0 = not Engine.IsMpStillDownloading()
	else
		f19_local0 = false
	end
	return f19_local0
end

shared.ShouldShowMtxCommsMOTDPopup = function ( controller )
	local data = Engine.GetMarketingMessage( controller, "motd" )
	if data ~= nil and data.messageViewReported ~= true then
		return true
	else
		return false
	end
end

shared.IsIntDvarNonZero = function ( dvarName )
	if Engine.GetDvarInt( dvarName ) ~= 0 then
		return true
	else
		return false
	end
end

shared.IsInGame = function ()
	return Engine.IsInGame()
end

shared.IsInTheaterLobby = function ()
	local currentMenuIdx = Engine.GetLobbyUIScreen()
	local currentMenu = LobbyData.GetLobbyMenuByID( currentMenuIdx )
	if currentMenu.lobbyMode == Enum.LobbyMode.LOBBY_MODE_THEATER then
		return true
	else
		return false
	end
end

shared.IsDirectorEnabled = function ()
	return Engine.GetDvarBool( "lobby_director" ) and CoDShared.IsIntDvarNonZero( "mp_prototype" )
end

CoDShared = LuaReadOnlyTables.ReadOnlyTable( shared )
