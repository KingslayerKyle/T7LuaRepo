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
	local f6_local0 = LuaUtils.mapsTable[f6_arg1]
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
	elseif Engine.IsZombiesGame() then
		for f7_local0 = 0, Engine.GetMaxControllerCount() - 1, 1 do
			if Engine.IsControllerBeingUsed( f7_local0 ) then
				CoDShared.UpdateZMDashboardStat( f7_local0 )
				Engine.Exec( f7_local0, "uploadstats" )
			end
		end
	end
end

Lobby.Stats.OnMatchLaunchClient = function ( f8_arg0 )
	if Engine.IsCampaignGame() then
		local f8_local0 = Engine.GetLobbySessionGameData( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
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
			f9_local1 = LuaUtils.mapsTable[f9_arg0.currentMap]
		end
		if f9_arg0.nextMap ~= nil and f9_arg0.nextMap ~= "" then
			f9_local2 = LuaUtils.mapsTable[f9_arg0.nextMap]
		end
		if f9_local2 == nil then
			return 
		elseif f9_local1 ~= nil and f9_local1.isSafeHouse then
			Lobby.Stats.WriteCurrentCPStats( f9_local0, f9_arg0.nextMap )
			return 
		end
	end
end

Lobby.Stats.OnServerTimeout = function ( f10_arg0 )
	if Engine.IsZombiesGame() then
		CoDShared.IncrementZMDashboardQuitType( f10_arg0, "timeout", 1 )
	end
end

Lobby.Stats.ClearValidationEvent = function ( f11_arg0 )
	if f11_arg0 ~= nil and f11_arg0.validationEvent:get() ~= "" then
		f11_arg0.validationEvent:set( "" )
	end
end

Lobby.Stats.SpecialistErrorDetected = function ( f12_arg0, f12_arg1, f12_arg2 )
	f12_arg2.cacloadouts.charactercontext.characterindex:set( 0 )
	f12_arg2.cacloadouts.herogadget:set( 0 )
	f12_arg2.cacloadouts.heroweapon:set( 113 )
end

Lobby.Stats.IsWeaponValid = function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
	if f13_arg2 == 0 then
		return true
	end
	local f13_local0 = "gamedata/stats/mp/mp_statsTable.csv"
	local f13_local1 = "gamedata/loot/mplootitems.csv"
	local f13_local2 = Engine.TableLookup( 0, f13_local0, 0, f13_arg2, 2 )
	if f13_local2:find( f13_arg3 ) == nil then
		return false
	elseif Engine.IsLootReady( f13_arg0 ) and not Engine.IsInventoryBusy( f13_arg0 ) then
		local f13_local3 = Engine.TableLookup( 0, f13_local0, 0, f13_arg2, 4 )
		local f13_local4 = Engine.TableFindRows( f13_local1, 0, f13_local3 )
		if f13_local4 ~= nil and 0 < #f13_local4 and Engine.GetLootItemQuantity( f13_arg0, f13_local3, Enum.eModes.MODE_MULTIPLAYER ) == 0 then
			return false
		end
	end
	return true
end

Lobby.Stats.LoadoutErrorDetected = function ( f14_arg0, f14_arg1 )
	f14_arg1.primary:set( 0 )
	f14_arg1.primaryattachment1:set( 0 )
	f14_arg1.primaryattachment2:set( 0 )
	f14_arg1.primaryattachment3:set( 0 )
	f14_arg1.primaryattachment4:set( 0 )
	f14_arg1.primaryattachment5:set( 0 )
	f14_arg1.primaryattachment6:set( 0 )
	f14_arg1.primaryattachment7:set( 0 )
	f14_arg1.primaryattachment8:set( 0 )
	f14_arg1.secondary:set( 0 )
	f14_arg1.secondaryattachment1:set( 0 )
	f14_arg1.secondaryattachment2:set( 0 )
	f14_arg1.secondaryattachment3:set( 0 )
	f14_arg1.secondaryattachment4:set( 0 )
	f14_arg1.secondaryattachment5:set( 0 )
	f14_arg1.secondaryattachment6:set( 0 )
	f14_arg1.secondaryattachment7:set( 0 )
	f14_arg1.secondaryattachment8:set( 0 )
end

Lobby.Stats.KillstreakErrorDetected = function ( f15_arg0, f15_arg1 )
	f15_arg1:set( 0 )
end

Lobby.Stats.ValidateCustomClass = function ( f16_arg0, f16_arg1, f16_arg2 )
	if f16_arg2 then
		local f16_local0 = f16_arg2.primary:get()
		local f16_local1 = f16_arg2.secondary:get()
		if f16_local1 == 100 then
			Lobby.Stats.LoadoutErrorDetected( f16_arg0, f16_arg2 )
			return false
		elseif not Lobby.Stats.IsWeaponValid( f16_arg0, f16_arg1, f16_local0, "weapon_" ) or not Lobby.Stats.IsWeaponValid( f16_arg0, f16_arg1, f16_local1, "weapon_" ) then
			Lobby.Stats.LoadoutErrorDetected( f16_arg0, f16_arg2 )
			return false
		end
	end
	return true
end

Lobby.Stats.ValidateLoadouts = function ( f17_arg0 )
	if not Engine.StorageIsFileReady( f17_arg0, Enum.StorageFileType.STORAGE_MP_LOADOUTS ) then
		return 
	elseif not Engine.StorageIsFileReady( f17_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE ) then
		return 
	elseif not Engine.StorageIsFileReady( f17_arg0, Enum.StorageFileType.STORAGE_MP_CLASS_SETS ) then
		return 
	end
	local f17_local0 = Engine.StorageGetBuffer( f17_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	local f17_local1 = Engine.StorageGetBuffer( f17_arg0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	local f17_local2 = Engine.StorageGetBuffer( f17_arg0, Enum.StorageFileType.STORAGE_MP_CLASS_SETS )
	local f17_local3 = false
	local f17_local4 = false
	if f17_local0 and f17_local1 then
		local f17_local5 = f17_local0.playerstatslist.rank.statValue:get()
		local f17_local6 = f17_local1.cacloadouts.heroweapon:get()
		if not (Lobby.Stats.IsWeaponValid( f17_arg0, f17_local5, f17_local6, "hero" ) or Lobby.Stats.IsWeaponValid( f17_arg0, f17_local5, f17_local6, "weapon_grenade" )) or not Lobby.Stats.IsWeaponValid( f17_arg0, f17_local5, f17_local1.cacloadouts.herogadget:get(), "weapon_grenade" ) then
			Lobby.Stats.SpecialistErrorDetected( f17_arg0, f17_local0, f17_local1 )
			f17_local3 = true
		end
		if f17_local2 then
			setTypes = {
				"publicMatchClassSets",
				"leagueMatchClassSets"
			}
			for f17_local15, f17_local16 in ipairs( setTypes ) do
				for f17_local14 = 0, 9, 1 do
					local f17_local10 = f17_local2[f17_local16][f17_local14]
					for f17_local11 = 0, 9, 1 do
						customClass = f17_local10.customclass[f17_local11]
						if not Lobby.Stats.ValidateCustomClass( f17_arg0, f17_local5, customClass ) then
							f17_local4 = true
						end
					end
				end
			end
		end
		for f17_local7 = 0, 9, 1 do
			customClass = f17_local1.cacloadouts.customclass[f17_local7]
			if not Lobby.Stats.ValidateCustomClass( f17_arg0, f17_local5, customClass ) then
				f17_local3 = true
			end
		end
		killstreak1 = f17_local1.cacloadouts.killstreak1
		if not Lobby.Stats.IsWeaponValid( f17_arg0, f17_local5, killstreak1:get(), "killstreak" ) then
			Lobby.Stats.KillstreakErrorDetected( f17_arg0, killstreak1 )
			f17_local3 = true
		end
		killstreak2 = f17_local1.cacloadouts.killstreak2
		if not Lobby.Stats.IsWeaponValid( f17_arg0, f17_local5, killstreak2:get(), "killstreak" ) then
			Lobby.Stats.KillstreakErrorDetected( f17_arg0, killstreak2 )
			f17_local3 = true
		end
		killstreak3 = f17_local1.cacloadouts.killstreak3
		if not Lobby.Stats.IsWeaponValid( f17_arg0, f17_local5, killstreak3:get(), "killstreak" ) then
			Lobby.Stats.KillstreakErrorDetected( f17_arg0, killstreak3 )
			f17_local3 = true
		end
		local f17_local7 = Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER )
		for f17_local14, f17_local17 in ipairs( {
			"cacloadouts",
			"customMatchCacLoadouts",
			"leagueCacLoadouts"
		} ) do
			local f17_local18 = f17_local1[f17_local17].characterContext.characterIndex
			local f17_local19 = f17_local18:get()
			if f17_local19 < 0 or #f17_local7 <= f17_local19 then
				f17_local18:set( 0 )
				f17_local3 = true
			end
		end
		LuaUtils.ResetToLastSelectedSpecialistIfNeeded( f17_arg0 )
	end
	if f17_local3 == true then
		Engine.StorageWrite( f17_arg0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	end
	if f17_local4 == true then
		Engine.StorageWrite( f17_arg0, Enum.StorageFileType.STORAGE_MP_CLASS_SETS )
	end
end

Lobby.Stats.OnMPLoadoutsDownloaded = function ( f18_arg0 )
	local f18_local0 = Engine.StorageGetBuffer( f18_arg0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	f18_local0 = f18_local0.cacLoadouts
	local f18_local1 = Engine.StorageGetBuffer( f18_arg0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	f18_local1 = f18_local1.leagueCacLoadouts
	local f18_local2 = Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER )
	if f18_local0 then
		for f18_local3 = 0, #f18_local2 - 1, 1 do
			if f18_local0.characters[f18_local3].itemList then
				f18_local0.characters[f18_local3].itemList.body.items[0].markedOld:set( 1 )
				f18_local0.characters[f18_local3].itemList.helmet.items[0].markedOld:set( 1 )
			end
			if f18_local0.characters[f18_local3].tauntMarkedOld and f18_local0.characters[f18_local3].tauntMarkedOld.first_place and f18_local0.characters[f18_local3].tauntMarkedOld.first_place.markedOld then
				f18_local0.characters[f18_local3].tauntMarkedOld.first_place.markedOld[0]:set( 1 )
			end
		end
	end
	if f18_local1 then
		for f18_local3 = 0, #f18_local2 - 1, 1 do
			if f18_local1.characters[f18_local3].itemList then
				f18_local1.characters[f18_local3].itemList.body.items[0].markedOld:set( 1 )
				f18_local1.characters[f18_local3].itemList.helmet.items[0].markedOld:set( 1 )
			end
			if f18_local1.characters[f18_local3].tauntMarkedOld and f18_local1.characters[f18_local3].tauntMarkedOld.first_place and f18_local1.characters[f18_local3].tauntMarkedOld.first_place.markedOld then
				f18_local1.characters[f18_local3].tauntMarkedOld.first_place.markedOld[0]:set( 1 )
			end
		end
	end
end

Lobby.Stats.GetPrestigePermanentUnlocks = function ( f19_arg0 )
	local f19_local0 = 0
	for f19_local1 = 0, 19, 1 do
		if f19_arg0.prestigeTokens[f19_local1].tokenSpent:get() == 1 and 0 < f19_arg0.prestigeTokens[f19_local1].itemunlocked:get() then
			f19_local0 = f19_local0 + 1
		end
	end
	return f19_local0
end

Lobby.Stats.ValidateUnlockTokens = function ( f20_arg0, f20_arg1 )
	if f20_arg1 == nil then
		return 
	end
	local f20_local0 = 0
	local f20_local1 = f20_arg1.itemStats
	if f20_local1 then
		for f20_local2 = 0, 255, 1 do
			if Engine.ItemIndexValid( f20_local2, Enum.eModes.MODE_MULTIPLAYER ) and Engine.GetItemCost( f20_local2, Enum.eModes.MODE_MULTIPLAYER ) > 0 and f20_local1[f20_local2].purchased:get() > 0 then
				f20_local0 = f20_local0 + 1
			end
		end
	end
	local f20_local5 = f20_local0 + f20_arg1.unlocks[0]:get() - f20_arg1.playerstatslist.rank.statvalue:get() + 1 - Lobby.Stats.GetPrestigePermanentUnlocks( f20_arg1 )
	if f20_local5 > 0 then
		if f20_local5 > 255 then
			f20_local5 = 255
		end
		f20_arg1.demonwareflags[3]:set( f20_local5 )
		Engine.Exec( f20_arg0, "uploadstats " .. tostring( Enum.eModes.MODE_MULTIPLAYER ) )
	end
end

Lobby.Stats.OnMPStatsDownloaded = function ( f21_arg0 )
	if not Engine.StorageIsFileReady( f21_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE ) then
		return 
	else
		Lobby.Stats.ClearValidationEvent( Engine.StorageGetBuffer( f21_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE ) )
	end
end

Lobby.Stats.OnMPStatsUploaded = function ( f22_arg0 )
	Lobby.Stats.ClearValidationEvent( Engine.StorageGetBuffer( f22_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE ) )
end

Lobby.Stats.FixXUID = function ( f23_arg0, f23_arg1 )
	local f23_local0 = Engine.GetXUID( f23_arg0 )
	if f23_arg1.PlayerXUID and f23_arg1.PlayerXUID:get() ~= f23_local0 then
		f23_arg1.PlayerXUID:set( f23_local0 )
		Engine.StorageWrite( f23_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	end
end

Lobby.Stats.OnMPOnlineStatsDownloaded = function ( f24_arg0 )
	local f24_local0 = Engine.StorageGetBuffer( f24_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if f24_local0 then
		local f24_local1 = f24_local0.itemStats
		if f24_local1 then
			for f24_local2 = 1, 255, 1 do
				if Engine.ItemIndexValid( f24_local2, Enum.eModes.MODE_MULTIPLAYER ) and Engine.GetItemUnlockLevel( f24_local2, Enum.eModes.MODE_MULTIPLAYER ) == 0 and not Engine.ItemIndexIsBlackMarket( f24_local2, Enum.eModes.MODE_MULTIPLAYER ) and (Engine.ItemIndexHasIncentive == nil or not Engine.ItemIndexHasIncentive( f24_local2, Enum.eModes.MODE_MULTIPLAYER )) then
					f24_local1[f24_local2].markedOld:set( 1 )
				end
			end
		end
		Lobby.Stats.ValidateUnlockTokens( f24_arg0, f24_local0 )
		Lobby.Stats.FixXUID( f24_arg0, f24_local0 )
	end
	Lobby.Stats.ValidateLoadouts( f24_arg0 )
end

Lobby.Stats.OnZMOnlineStatsDownloaded = function ( f25_arg0 )
	local f25_local0 = Engine.StorageGetBuffer( f25_arg0, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
	if f25_local0 and f25_local0.extraBools[1]:get() == 0 then
		local f25_local1 = f25_local0.itemStats
		for f25_local2 = 234, 255, 1 do
			local f25_local5 = Engine.GetDLCNameForItem( f25_local2, Enum.eModes.MODE_ZOMBIES )
			if not f25_local5 or not Engine.HasEntitlementByOwnership( f25_arg0, f25_local5 ) then
				f25_local1[f25_local2].markedOld:set( 0 )
			end
		end
		f25_local0.extraBools[1]:set( 1 )
		Engine.StorageWrite( f25_arg0, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
	end
end

Lobby.Stats.OnCPOnlineLoadoutsDownloaded = function ( f26_arg0 )
	local f26_local0 = Engine.StorageGetBuffer( f26_arg0, Enum.StorageFileType.STORAGE_CP_LOADOUTS )
	if f26_local0 then
		local f26_local1 = f26_local0.cacLoadouts
		if f26_local1 then
			local f26_local2 = Engine.GetHeroList( Enum.eModes.MODE_CAMPAIGN )
			for f26_local3 = 0, #f26_local2 - 1, 1 do
				if f26_local1.characters[f26_local3].itemList then
					f26_local1.characters[f26_local3].itemList.body.items[0].markedOld:set( 1 )
					f26_local1.characters[f26_local3].itemList.helmet.items[0].markedOld:set( 1 )
					f26_local1.characters[f26_local3].itemList.helmet.items[1].markedOld:set( 1 )
				end
			end
			Engine.StorageWrite( f26_arg0, Enum.StorageFileType.STORAGE_CP_LOADOUTS )
		end
	end
end

Lobby.Stats.OnProfileCommonStatsDownloaded = function ( f27_arg0 )
	local f27_local0 = Engine.StorageGetBuffer( f27_arg0, Enum.StorageFileType.STORAGE_COMMON_SETTINGS )
	if f27_local0 then
		if Engine.GetLuaCodeVersion() >= 11 and f27_local0.snd_multiplayer_music:get() == 1 then
			f27_local0.snd_multiplayer_music:set( 0 )
			f27_local0.snd_multiplayer_music_track:set( Enum.MultiplayerMusicTracks.MP_MUSIC_TRACKS_DEFAULT )
			Engine.StorageWrite( f27_arg0, Enum.StorageFileType.STORAGE_COMMON_SETTINGS )
		end
		local f27_local1 = "gamedata/tables/common/music_player.csv"
		local f27_local2 = Engine.TableLookup( nil, f27_local1, Enum.MusicPlayerTableColumn.MUSIC_PLAYER_COLUMN_ALIAS, "mus_mp_lobby_intro", Enum.MusicPlayerTableColumn.MUSIC_PLAYER_COLUMN_INDEX )
		if f27_local2 ~= "" then
			f27_local2 = tonumber( f27_local2 )
		else
			f27_local2 = nil
		end
		if f27_local0.snd_defaultFrontendTracksInitialized:get() == 0 then
			f27_local0.snd_defaultFrontendTracksInitialized:set( 1 )
			f27_local0.snd_muteMPFrontendMusic:set( 0 )
			if f27_local2 then
				f27_local0.snd_playMPFrontendMusicTrack[f27_local2]:set( 1 )
			else
				f27_local0.snd_playMPFrontendMusicTrack[0]:set( 1 )
			end
			Engine.StorageWrite( f27_arg0, Enum.StorageFileType.STORAGE_COMMON_SETTINGS )
		end
		if f27_local0.snd_defaultFrontendTracksInitialized2:get() == 0 then
			f27_local0.snd_defaultFrontendTracksInitialized2:set( 1 )
			local f27_local3 = Engine.GetTableRowCount( f27_local1 )
			local f27_local4 = false
			local f27_local5 = 0
			for f27_local6 = 0, f27_local3 - 1, 1 do
				if f27_local6 ~= f27_local2 and f27_local0.snd_playMPFrontendMusicTrack[f27_local6]:get() == 1 then
					f27_local4 = true
					break
				elseif f27_local6 == f27_local2 and f27_local0.snd_playMPFrontendMusicTrack[f27_local6]:get() == 0 then
					f27_local4 = true
					break
				end
			end
			if f27_local0.snd_muteMPFrontendMusic:get() == 1 then
				f27_local0.snd_frontendTracksState:set( Enum.FrontendMusicTrackStates.FRONTEND_MUSIC_STATE_OFF )
			elseif f27_local4 then
				f27_local0.snd_frontendTracksState:set( Enum.FrontendMusicTrackStates.FRONTEND_MUSIC_STATE_ON )
			else
				f27_local0.snd_frontendTracksState:set( Enum.FrontendMusicTrackStates.FRONTEND_MUSIC_STATE_DEFAULT )
			end
			if not f27_local4 then
				for f27_local6 = 0, f27_local3 - 1, 1 do
					f27_local0.snd_playMPFrontendMusicTrack[f27_local6]:set( 1 )
				end
			end
		end
	end
end

