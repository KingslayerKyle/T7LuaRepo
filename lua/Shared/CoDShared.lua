-- 77891a2587059a2dcc4d7fd161129330
-- This hash is used for caching, delete to decompile the file again

require( "lua.Shared.LuaReadOnlyTables" )

local f0_local0 = {
	gametypesStructTable = "game_types"
}
local f0_local1, f0_local2 = nil
f0_local0.IsGametypeTeamBased = function ( f1_arg0, f1_arg1 )
	if not f1_arg0 then
		f1_arg0 = Dvar.ui_gametype:get()
	end
	if f1_arg0 == "infect" then
		return f1_arg1
	elseif f1_arg0 == f0_local1 then
		return f0_local2
	else
		local f1_local0 = Engine.StructTableLookupString( f0_local0.gametypesStructTable, "name", f1_arg0, "is_team_based" )
		if f1_local0 == nil then
			return false
		else
			f0_local1 = f1_arg0
			if Engine.ToUpper( f1_local0 ) == "NO" then
				f0_local2 = false
				return false
			else
				f0_local2 = true
				return true
			end
		end
	end
end

f0_local0.IsHardcoreGametypeAvailable = function ( f2_arg0 )
	if not f2_arg0 then
		f2_arg0 = Dvar.ui_gametype:get()
	end
	local f2_local0 = Engine.StructTableLookupString( f0_local0.gametypesStructTable, "name", f2_arg0, "hardcore_available" )
	if f2_local0 and f2_local0 == "YES" then
		return true
	else
		return false
	end
end

f0_local0.ChunkAnyDownloading = function ()
	if (LuaUtils.isPS4 or LuaUtils.isXbox) and (Engine.IsMpStillDownloading() or Engine.IsZmStillDownloading() or Engine.IsCpStillDownloading() or Engine.IsZmInitialStillDownloading() or Engine.IsMpInitialStillDownloading()) then
		return true
	else
		return false
	end
end

f0_local0.IsTeamBasedGame = function ()
	if Engine.IsDedicatedServer() then
		return Engine.GetGametypeSetting( "teamCount" ) > 1
	elseif Engine.IsInGame() then
		return CoDShared.IsGametypeTeamBased()
	else
		return CoDShared.IsGametypeTeamBased( Engine.GetCurrentGameType() )
	end
end

f0_local0.IsLobbyMode = function ( f5_arg0 )
	local modelValue = Engine.GetModelValue( Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" ) )
	if modelValue then
		local f5_local1 = LobbyData:UITargetFromId( modelValue )
		return f5_local1.lobbyMode == f5_arg0
	else
		
	end
end

f0_local0.IsOnlineGame = function ()
	if Engine.SessionMode_IsOnlineGame() then
		return true
	else
		return false
	end
end

f0_local0.IsRankedGame = function ()
	local f7_local0
	if f0_local0.IsOnlineGame() == true and not Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_MATCHMAKING_MANUAL ) then
		f7_local0 = not Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_MANUAL_PLAYLIST )
	else
		f7_local0 = false
	end
	return f7_local0
end

f0_local0.IsHost = function ()
	return Engine.DvarBool( nil, "sv_running" )
end

f0_local0.GetTeamDifference = function ( f9_arg0 )
	if f9_arg0 ~= Enum.team_t.TEAM_ALLIES and f9_arg0 ~= Enum.team_t.TEAM_AXIS then
		return 0
	end
	local f9_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	local f9_local1 = f9_local0.sessionClients
	local f9_local2 = 0
	local f9_local3 = 0
	for f9_local7, f9_local8 in ipairs( f9_local1 ) do
		if f9_local8.team == Enum.team_t.TEAM_ALLIES then
			f9_local2 = f9_local2 + 1
		end
		if f9_local8.team == Enum.team_t.TEAM_AXIS then
			f9_local3 = f9_local3 + 1
		end
	end
	if f9_arg0 == Enum.team_t.TEAM_ALLIES then
		return f9_local2 - f9_local3
	end
	return f9_local3 - f9_local2
end

f0_local0.IsTeamOverwhelmed = function ( f10_arg0 )
	local f10_local0 = Engine.GetTeamForXUID( Engine.GetXUID64( f10_arg0 ) )
	local f10_local1 = Dvar.arena_unfairTeamGap:get() * -1
	if f10_local1 == 0 or f10_local1 < f0_local0.GetTeamDifference( f10_local0 ) then
		return false
	else
		return true
	end
end

f0_local0.QuitGame = function ( f11_arg0, f11_arg1 )
	if Engine.IsRunningUILevel() then
		return true
	end
	local f11_local0 = Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyClientType.LOBBY_CLIENT_TYPE_ALL )
	local f11_local1 = Engine.GetLobbyClientCount( Enum.LobbyModule.LOBBY_MODULE_HOST, Enum.LobbyType.LOBBY_TYPE_GAME, Enum.LobbyClientType.LOBBY_CLIENT_TYPE_LOCAL )
	local f11_local2 = Engine.GetLobbyHostInfo( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	if f11_local2 ~= nil then
		if nil ~= LobbyVM then
			LobbyVM.MatchmakingPriorityQuit( {
				hostSecId = f11_local2.secIdint
			} )
		else
			Engine.LobbyVM_CallFunc( "MatchmakingPriorityQuit", {
				hostSecId = f11_local2.secIdint
			} )
		end
	end
	if f0_local0.IsLobbyMode( Enum.LobbyMode.LOBBY_MODE_THEATER ) == true then
		if not Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME ) then
			Engine.GameModeResetModes()
			Engine.SessionModeResetModes()
			Engine.Exec( f11_arg0, "disconnect" )
		else
			Engine.Exec( f11_arg0, "xpartystopdemo" )
		end
		return true
	elseif not f0_local0.IsRankedGame() and f0_local0.IsHost() and Engine.DvarInt( nil, "g_gameEnded" ) ~= 1 then
		Engine.SendMenuResponse( f11_arg0, "popup_leavegame", "endround" )
	elseif not f0_local0.IsHost() then
		if f11_arg1 then
			Engine.UpdateStatsForQuitUnbalancedTeam( f11_arg0, false )
		else
			Engine.UpdateStatsForQuit( f11_arg0, false )
		end
		if Engine.IsZombiesGame() then
			f0_local0.IncrementZMDashboardQuitType( f11_arg0, "quit", 1 )
		end
		Engine.Exec( f11_arg0, "disconnect" )
	elseif f0_local0.IsRankedGame() and f0_local0.IsHost() and not Engine.HostMigrationWaitingForPlayers() and Engine.DvarInt( nil, "g_gameEnded" ) ~= 1 then
		Engine.UpdateStatsForQuit( f11_arg0, true )
		if (Engine.IsZombiesGame() or f0_local0.IsGameTypeDOA() or Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_FREERUN )) and (f11_local0 < Dvar.migration_minclientcount:get() or f11_local0 == f11_local1) then
			Engine.SendMenuResponse( f11_arg0, "popup_leavegame", "endround" )
		else
			if Engine.IsMultiplayerGame() or Engine.IsZombiesGame() or f0_local0.IsGameTypeDOA() then
				if Engine.IsZombiesGame() then
					f0_local0.IncrementZMDashboardQuitType( f11_arg0, "quit", 1 )
				end
				Engine.Exec( f11_arg0, "hostmigration_start" )
				return false
			end
			Engine.SendMenuResponse( f11_arg0, "popup_leavegame", "endround" )
		end
	end
	return true
end

f0_local0.IsGameTypeDOA = function ()
	local f12_local0
	if (Dvar.ui_gametype == nil or Dvar.ui_gametype:get() ~= "doa") and (nil == Engine.GetCurrentMap() or Engine.GetCurrentMap() ~= "cp_doa_bo3") then
		f12_local0 = LuaUtils.IsDOATarget( Engine.GetLobbyUIScreen() )
	else
		f12_local0 = true
	end
	return f12_local0
end

f0_local0.IsLootHero = function ( f13_arg0 )
	if f13_arg0 ~= nil and f13_arg0.assetName ~= nil and f13_arg0.assetName == "pbt_mp_blackmarket" then
		return true
	else
		return false
	end
end

f0_local0.GetLootItemVersion = function ( f14_arg0 )
	local f14_local0 = "gamedata/loot/mplootitems.csv"
	local f14_local1 = 1
	local f14_local2 = 6
	local f14_local3 = Engine.TableFindRows( f14_local0, f14_local1, f14_arg0 )
	if f14_local3 == nil or #f14_local3 == 0 then
		return -1
	else
		local f14_local4 = Engine.TableLookupGetColumnValueForRow( f14_local0, f14_local3[1], f14_local2 )
		if f14_local4 == nil or f14_local4 == "" then
			return -1
		else
			return tonumber( f14_local4 )
		end
	end
end

f0_local0.GetLootItemCategory = function ( f15_arg0 )
	local f15_local0 = "gamedata/loot/mplootitems.csv"
	local f15_local1 = 1
	local f15_local2 = 2
	local f15_local3 = Engine.TableFindRows( f15_local0, f15_local1, f15_arg0 )
	if f15_local3 == nil or #f15_local3 == 0 then
		return -1
	else
		local f15_local4 = Engine.TableLookupGetColumnValueForRow( f15_local0, f15_local3[1], f15_local2 )
		if f15_local4 == nil then
			return -1
		else
			return f15_local4
		end
	end
end

f0_local0.IsInExperiment = function ( f16_arg0, f16_arg1 )
	local f16_local0 = Engine.GetPrimaryController()
	local f16_local1 = Engine.GetModel( Engine.GetGlobalModel(), "autoevents" )
	if f16_local1 ~= nil then
		local f16_local2 = Engine.GetModel( f16_local1, "targetController" )
		if f16_local2 ~= nil then
			f16_local0 = Engine.GetModelValue( f16_local2 )
		end
	end
	local f16_local2 = Engine.ExperimentsGetVariant( f16_local0, f16_arg0 )
	if f16_local2 == nil or f16_local2 == "" or f16_local2 == -1 then
		return false
	end
	f16_local2 = tonumber( f16_local2 )
	for f16_local6 in string.gmatch( f16_arg1, "([^;]+)" ) do
		if f16_local6 ~= nil and f16_local6 ~= "" and f16_local2 == tonumber( f16_local6 ) then
			return true
		end
	end
	return false
end

f0_local0.zmDashboardStatsQuitTypes = {
	dashboard = 0,
	timeout = 1,
	quit = 3,
	completed = 4
}
local f0_local3 = function ( f17_arg0 )
	return {
		hosted = f17_arg0.lastGameWasHosted:get() and "HOSTED" or "PLAYED",
		usedConsumable = f17_arg0.lastGameUsedConsumable:get() and "USED" or "UNUSED",
		wasCoop = f17_arg0.lastGameWasCoop:get() and "SOLO" or "COOP"
	}
end

local f0_local4 = function ( f18_arg0, f18_arg1, f18_arg2 )
	return f18_arg0.gameSizeHistory[f18_arg1.wasCoop].consumablesHistory[f18_arg1.usedConsumable].periodHistory[f18_arg1.hosted][f18_arg2]:get()
end

local f0_local5 = function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
	f19_arg0.gameSizeHistory[f19_arg1.wasCoop].consumablesHistory[f19_arg1.usedConsumable].periodHistory[f19_arg1.hosted][f19_arg2]:set( f0_local4( f19_arg0, f19_arg1, f19_arg2 ) + f19_arg3 )
	f19_arg0.statsSinceLastComscoreEvent[f19_arg2]:set( f19_arg0.statsSinceLastComscoreEvent[f19_arg2]:get() + f19_arg3 )
end

local f0_local6 = function ( f20_arg0, f20_arg1 )
	local f20_local0 = 32
	local f20_local1 = f20_arg0.currentDashboardingTrackingHistoryIndex:get()
	f20_arg0.quitType[f20_local1]:set( f0_local0.zmDashboardStatsQuitTypes[f20_arg1] )
	f20_local1 = (f20_local1 + 1) % f20_local0
	if f20_local1 == 0 then
		f20_arg0.bufferFull:set( 1 )
	end
	f20_arg0.currentDashboardingTrackingHistoryIndex:set( f20_local1 )
end

local f0_local7 = function ( f21_arg0, f21_arg1 )
	local f21_local0 = f0_local4( f21_arg0, f21_arg1, "started" )
	local f21_local1 = 0
	for f21_local5, f21_local6 in pairs( f0_local0.zmDashboardStatsQuitTypes ) do
		f21_local1 = f21_local1 + f0_local4( f21_arg0, f21_arg1, f21_local5 )
	end
	return f21_local0 - f21_local1
end

local f0_local8 = function ( f22_arg0 )
	local f22_local0 = {}
	for f22_local1 = 0, 255, 1 do
		if Engine.GetItemGroup( f22_local1, Enum.eModes.MODE_ZOMBIES ) == "bubblegum_consumable" then
			local f22_local4 = tonumber( Engine.GetItemMomentumCost( f22_local1, Enum.eModes.MODE_ZOMBIES ) )
			if not f22_local0[f22_local4] then
				f22_local0[f22_local4] = 0
			end
			if Engine.IsLootReady( f22_arg0 ) and not Engine.IsInventoryBusy( f22_arg0 ) then
				f22_local0[f22_local4] = f22_local0[f22_local4] + Engine.GetLootItemQuantity( f22_arg0, Engine.GetItemRef( f22_local1, Enum.eModes.MODE_ZOMBIES ), Enum.eModes.MODE_ZOMBIES )
			end
		end
	end
	return f22_local0
end

local f0_local9 = function ( f23_arg0 )
	local f23_local0 = Engine.StorageGetBuffer( f23_arg0, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
	if not f23_local0 then
		return 
	end
	local f23_local1 = 1
	local f23_local2 = 2
	local f23_local3 = 3
	local f23_local4 = Engine.GetXUID64( f23_arg0 )
	local f23_local5 = f23_local0.dashboardingTrackingHistory.statsSinceLastComscoreEvent.started:get()
	local f23_local6 = f23_local0.dashboardingTrackingHistory.statsSinceLastComscoreEvent.quit:get()
	local f23_local7 = f23_local0.dashboardingTrackingHistory.statsSinceLastComscoreEvent.dashboard:get()
	local f23_local8 = f23_local0.dashboardingTrackingHistory.statsSinceLastComscoreEvent.timeout:get()
	local f23_local9 = f23_local0.dashboardingTrackingHistory.statsSinceLastComscoreEvent.completed:get()
	local f23_local10 = f23_local0.PlayerStatsList.TOTAL_GAMES_PLAYED.statValue:get()
	local f23_local11 = f23_local0.PlayerStatsList.TIME_PLAYED_TOTAL.statValue:get()
	local f23_local12 = Engine.IsLootReady( f23_arg0 ) and Engine.GetZMVials( f23_arg0 ) or -1
	local f23_local13 = f0_local8( f23_arg0 )
	local f23_local14
	if Dvar.zm_dash_stats_use_aggregated_comscore:exists() and tonumber( Dvar.zm_dash_stats_use_aggregated_comscore:get() ) > 0 then
		f23_local14 = "zm_dash_quit_types_aggregated"
		if not f23_local14 then
		
		else
			Engine.RecordComScoreEvent( f23_arg0, f23_local14, "xuid", f23_local4, "started", f23_local5, "quit", f23_local6, "dashboard", f23_local7, "timeout", f23_local8, "gamesPlayed", f23_local10, "timePlayed", f23_local11, "vialsCount", f23_local12, "megaCount", f23_local13[f23_local1], "rareCount", f23_local13[f23_local2], "ultraCount", f23_local13[f23_local3] )
			f23_local0.dashboardingTrackingHistory.statsSinceLastComscoreEvent.started:set( 0 )
			f23_local0.dashboardingTrackingHistory.statsSinceLastComscoreEvent.quit:set( 0 )
			f23_local0.dashboardingTrackingHistory.statsSinceLastComscoreEvent.dashboard:set( 0 )
			f23_local0.dashboardingTrackingHistory.statsSinceLastComscoreEvent.timeout:set( 0 )
			f23_local0.dashboardingTrackingHistory.statsSinceLastComscoreEvent.completed:set( 0 )
		end
	end
	f23_local14 = "zm_dash_quit_types"
end

f0_local0.IncrementZMDashboardQuitType = function ( f24_arg0, f24_arg1, f24_arg2 )
	if f0_local0.IsOnlineGame() and Engine.IsZombiesGame() and Engine.IsSignedInToDemonware( f24_arg0 ) and Dvar.zm_dash_stats_enable_tracking:exists() and tonumber( Dvar.zm_dash_stats_enable_tracking:get() ) == 1 then
		local f24_local0 = Engine.StorageGetBuffer( f24_arg0, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
		f24_local0 = f24_local0.dashboardingTrackingHistory
		if f24_local0 == nil then
			return 
		end
		local f24_local1 = f0_local3( f24_local0 )
		if f0_local7( f24_local0, f24_local1 ) == 0 then
			return 
		end
		f0_local5( f24_local0, f24_local1, f24_arg1, f24_arg2 )
		f0_local6( f24_local0, f24_arg1 )
	end
end

f0_local0.UpdateZMDashboardStat = function ( f25_arg0 )
	if f0_local0.IsOnlineGame() and Engine.IsZombiesGame() and Engine.IsSignedInToDemonware( f25_arg0 ) and Dvar.zm_dash_stats_enable_tracking:exists() and tonumber( Dvar.zm_dash_stats_enable_tracking:get() ) == 1 then
		local f25_local0 = Engine.StorageGetBuffer( f25_arg0, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
		f25_local0 = f25_local0.dashboardingTrackingHistory
		if f25_local0 == nil then
			return 
		elseif f25_local0.trackedFirstGame:get() == 0 then
			return 
		end
		local f25_local1 = f0_local7( f25_local0, f0_local3( f25_local0 ) )
		for f25_local2 = 1, f25_local1, 1 do
			local f25_local5 = f25_local2
			f0_local0.IncrementZMDashboardQuitType( f25_arg0, "dashboard", 1 )
		end
		f0_local9( f25_arg0 )
	end
end

CoDShared = LuaReadOnlyTables.ReadOnlyTable( f0_local0 )
