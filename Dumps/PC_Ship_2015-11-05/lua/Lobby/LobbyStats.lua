require( "lua.Lobby.Common.LobbyCore" )

Lobby.Stats = {}
Lobby.Stats.WritePlayerStatToMissionStat = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	f1_arg1.PlayerStatsByMap[f1_arg2].currentStats[f1_arg3]:set( f1_arg1.PlayerStatsList[f1_arg3].statValue:get() )
end

Lobby.Stats.WriteMissionStats = function ( f2_arg0, f2_arg1, f2_arg2 )
	statNames = {
		"SCORE",
		"KILLS",
		"INCAPS",
		"ASSISTS",
		"REVIVES"
	}
	for f2_local3, f2_local4 in pairs( statNames ) do
		Lobby.Stats.WritePlayerStatToMissionStat( f2_arg0, f2_arg1, f2_arg2, f2_local4 )
	end
	for f2_local0 = 0, 5, 1 do
		f2_arg1.PlayerStatsByMap[f2_arg2].previousCompletedDifficulties[f2_local0]:set( f2_arg1.PlayerStatsByMap[f2_arg2].completedDifficulties[f2_local0]:get() )
		f2_arg1.PlayerStatsByMap[f2_arg2].previousReceivedXPForDifficulty[f2_local0]:set( f2_arg1.PlayerStatsByMap[f2_arg2].receivedXPForDifficulty[f2_local0]:get() )
	end
end

Lobby.Stats.WriteCurrentDecorations = function ( f3_arg0, f3_arg1 )
	for f3_local0 = 0, 19, 1 do
		f3_arg1.currentPlayerCPDecorations[f3_local0]:set( f3_arg1.PlayerCPDecorations[f3_local0]:get() )
	end
end

Lobby.Stats.WriteCurrentRankXP = function ( f4_arg0, f4_arg1 )
	f4_arg1.currentRankXP:set( f4_arg1.PlayerStatsList.RANKXP.statValue:get() )
end

Lobby.Stats.WriteCurrentWeaponLevels = function ( f5_arg0, f5_arg1 )
	for f5_local0 = 1, 58, 1 do
		f5_arg1.currentWeaponLevels[f5_local0]:set( Engine.GetGunCurrentRank( f5_arg0, f5_local0 ) )
	end
end

Lobby.Stats.WriteCurrentCPStats = function ( f6_arg0, f6_arg1 )
	if f6_arg1 == nil then
		f6_arg1 = Engine.DvarString( nil, "ui_mapname" )
	end
	local f6_local0 = Lobby.MapVote.mapsTable[f6_arg1]
	if f6_local0 ~= nil and f6_local0.rootMapName ~= nil then
		local f6_local1 = Engine.GetPlayerStats( f6_arg0 )
		Lobby.Stats.WriteCurrentWeaponLevels( f6_arg0, f6_local1 )
		Lobby.Stats.WriteCurrentRankXP( f6_arg0, f6_local1 )
		Lobby.Stats.WriteCurrentDecorations( f6_arg0, f6_local1 )
		Lobby.Stats.WriteMissionStats( f6_arg0, f6_local1, f6_local0.rootMapName )
		Engine.Exec( f6_arg0, "uploadstats" )
		Engine.Exec( f6_arg0, "savegamerprofilestats" )
	end
end

Lobby.Stats.OnMatchStart = function ( f7_arg0 )
	if Engine.IsCampaignGame() then
		local f7_local0 = Engine.GetPrimaryController()
		if Engine.GetSavedMap() ~= Engine.DvarString( nil, "ui_mapname" ) then
			Lobby.Stats.WriteCurrentCPStats( f7_local0 )
		end
	end
end

Lobby.Stats.OnMatchLaunchClient = function ( f8_arg0 )
	if Engine.IsCampaignGame() then
		local f8_local0 = Engine.LobbyGetGameData()
		local f8_local1 = f8_local0.mapname
		if f8_local1 ~= nil and f8_local1 ~= "" then
			Engine.SetupFieldOpsKitLoadouts( f8_local1 )
		end
		Lobby.Stats.WriteCurrentCPStats( Engine.GetPrimaryController() )
	end
end

Lobby.Stats.OnMatchChangeMap = function ( f9_arg0 )
	if Engine.IsCampaignGame() then
		local f9_local0 = Engine.GetPrimaryController()
		local f9_local1, f9_local2 = nil
		if f9_arg0.currentMap ~= nil and f9_arg0.currentMap ~= "" then
			f9_local1 = Lobby.MapVote.mapsTable[f9_arg0.currentMap]
		end
		if f9_arg0.nextMap ~= nil and f9_arg0.nextMap ~= "" then
			f9_local2 = Lobby.MapVote.mapsTable[f9_arg0.nextMap]
		end
		if f9_local2 == nil then
			return 
		elseif f9_local1 ~= nil and f9_local1.isSafeHouse then
			Lobby.Stats.WriteCurrentCPStats( f9_local0, f9_arg0.nextMap )
			return 
		end
	end
end

Lobby.Stats.ClearValidationEvent = function ( f10_arg0 )
	if f10_arg0 ~= nil and f10_arg0.validationEvent:get() ~= "" then
		f10_arg0.validationEvent:set( "" )
	end
end

Lobby.Stats.SpecialistErrorDetected = function ( f11_arg0, f11_arg1, f11_arg2 )
	f11_arg2.cacloadouts.charactercontext.characterindex:set( 0 )
	f11_arg2.cacloadouts.herogadget:set( 0 )
	f11_arg2.cacloadouts.heroweapon:set( 113 )
end

Lobby.Stats.IsWeaponValid = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
	if f12_arg2 == 0 then
		return true
	end
	local f12_local0 = Engine.TableLookup( 0, "gamedata/stats/mp/mp_statsTable.csv", 0, f12_arg2, 2 )
	if f12_local0:find( f12_arg3 ) == nil then
		return false
	end
	local f12_local1 = tonumber( Engine.TableLookup( 0, "gamedata/stats/mp/mp_statsTable.csv", 0, f12_arg2, 10 ) )
	if f12_arg1 < f12_local1 and not Engine.IsItemPermanentlyUnlocked( f12_arg0, f12_arg2, Enum.eModes.MODE_MULTIPLAYER ) then
		return false
	elseif LuaUtils.IsBetaBuild() then
		local f12_local2 = Engine.TableLookup( 0, "gamedata/tables/mp/mp_ranktable.csv", 2, Dvar.scr_rankXpCap:get(), 0 )
		if f12_local2 ~= "" and tonumber( f12_local2 ) < f12_local1 then
			return false
		end
	end
	return true
end

Lobby.Stats.LoadoutErrorDetected = function ( f13_arg0, f13_arg1 )
	f13_arg1.primary:set( 0 )
	f13_arg1.secondary:set( 0 )
end

Lobby.Stats.KillstreakErrorDetected = function ( f14_arg0, f14_arg1 )
	f14_arg1:set( 0 )
end

Lobby.Stats.ValidateLoadouts = function ( f15_arg0 )
	if not Engine.StorageIsFileReady( f15_arg0, Enum.StorageFileType.STORAGE_MP_LOADOUTS ) then
		return 
	elseif not Engine.StorageIsFileReady( f15_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE ) then
		return 
	end
	local f15_local0 = Engine.StorageGetBuffer( f15_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	local f15_local1 = Engine.StorageGetBuffer( f15_arg0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	local f15_local2 = false
	if f15_local0 and f15_local1 then
		local f15_local3 = f15_local0.playerstatslist.rank.statValue:get()
		if not Lobby.Stats.IsWeaponValid( f15_arg0, f15_local3, f15_local1.cacloadouts.heroweapon:get(), "hero" ) or not Lobby.Stats.IsWeaponValid( f15_arg0, f15_local3, f15_local1.cacloadouts.herogadget:get(), "weapon_grenade" ) then
			Lobby.Stats.SpecialistErrorDetected( f15_arg0, f15_local0, f15_local1 )
			f15_local2 = true
		end
		for f15_local4 = 0, 9, 1 do
			customClass = f15_local1.cacloadouts.customclass[f15_local4]
			if not Lobby.Stats.IsWeaponValid( f15_arg0, f15_local3, customClass.primary:get(), "weapon_" ) or not Lobby.Stats.IsWeaponValid( f15_arg0, f15_local3, customClass.secondary:get(), "weapon_" ) then
				Lobby.Stats.LoadoutErrorDetected( f15_arg0, customClass )
				f15_local2 = true
			end
		end
		killstreak1 = f15_local1.cacloadouts.killstreak1
		if not Lobby.Stats.IsWeaponValid( f15_arg0, f15_local3, killstreak1:get(), "killstreak" ) then
			Lobby.Stats.KillstreakErrorDetected( f15_arg0, killstreak1 )
			f15_local2 = true
		end
		killstreak2 = f15_local1.cacloadouts.killstreak2
		if not Lobby.Stats.IsWeaponValid( f15_arg0, f15_local3, killstreak2:get(), "killstreak" ) then
			Lobby.Stats.KillstreakErrorDetected( f15_arg0, killstreak2 )
			f15_local2 = true
		end
		killstreak3 = f15_local1.cacloadouts.killstreak3
		if not Lobby.Stats.IsWeaponValid( f15_arg0, f15_local3, killstreak3:get(), "killstreak" ) then
			Lobby.Stats.KillstreakErrorDetected( f15_arg0, killstreak3 )
			f15_local2 = true
		end
	end
	if f15_local2 == true then
		Engine.StorageWrite( f15_arg0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	end
end

Lobby.Stats.OnMPStatsDownloaded = function ( f16_arg0 )
	if not Engine.StorageIsFileReady( f16_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE ) then
		return 
	else
		Lobby.Stats.ClearValidationEvent( Engine.StorageGetBuffer( f16_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE ) )
	end
end

Lobby.Stats.OnMPStatsUploaded = function ( f17_arg0 )
	Lobby.Stats.ClearValidationEvent( Engine.StorageGetBuffer( f17_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE ) )
end

Lobby.Stats.OnMPOnlineStatsDownloaded = function ( f18_arg0 )
	local f18_local0 = Engine.StorageGetBuffer( f18_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if f18_local0 then
		local f18_local1 = f18_local0.itemStats
		if f18_local1 then
			for f18_local2 = 1, 255, 1 do
				if Engine.ItemIndexValid( f18_local2, Enum.eModes.MODE_MULTIPLAYER ) and Engine.GetItemUnlockLevel( f18_local2, Enum.eModes.MODE_MULTIPLAYER ) == 0 then
					f18_local1[f18_local2].markedOld:set( 1 )
				end
			end
		end
	end
	Lobby.Stats.ValidateLoadouts( f18_arg0 )
end

