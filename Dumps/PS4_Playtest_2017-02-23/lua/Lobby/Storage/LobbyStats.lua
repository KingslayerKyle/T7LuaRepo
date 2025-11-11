require( "lua.Lobby.Common.LobbyCore" )

Lobby.Stats = {}
Lobby.Stats.WritePlayerStatToMissionStat = function ( controller, currentStats, rootMapName, statName )
	local playerStat = currentStats.PlayerStatsList[statName].statValue:get()
	currentStats.PlayerStatsByMap[rootMapName].currentStats[statName]:set( playerStat )
end

Lobby.Stats.WriteMissionStats = function ( controller, currentStats, rootMapName )
	if not currentStats.PlayerStatsByMap[rootMapName] then
		return 
	end
	statNames = {
		"SCORE",
		"KILLS",
		"INCAPS",
		"ASSISTS",
		"REVIVES"
	}
	for i, statName in pairs( statNames ) do
		Lobby.Stats.WritePlayerStatToMissionStat( controller, currentStats, rootMapName, statName )
	end
	for i = 0, 5, 1 do
		local statValue = currentStats.PlayerStatsByMap[rootMapName].completedDifficulties[i]:get()
		currentStats.PlayerStatsByMap[rootMapName].previousCompletedDifficulties[i]:set( statValue )
		currentStats.PlayerStatsByMap[rootMapName].previousReceivedXPForDifficulty[i]:set( currentStats.PlayerStatsByMap[rootMapName].receivedXPForDifficulty[i]:get() )
	end
end

Lobby.Stats.WriteCurrentDecorations = function ( controller, currentStats )
	for decorationIndex = 0, 19, 1 do
		local currentDecoration = currentStats.PlayerCPDecorations[decorationIndex]:get()
		currentStats.currentPlayerCPDecorations[decorationIndex]:set( currentDecoration )
	end
end

Lobby.Stats.WriteCurrentRankXP = function ( controller, currentStats )
	local currentRankXP = currentStats.PlayerStatsList.RANKXP.statValue:get()
	currentStats.currentRankXP:set( currentRankXP )
end

Lobby.Stats.WriteCurrentWeaponLevels = function ( controller, currentStats )
	for gunIndex = 1, 58, 1 do
		local currentGunRank = Engine.GetGunCurrentRank( controller, gunIndex )
		currentStats.currentWeaponLevels[gunIndex]:set( currentGunRank )
	end
end

Lobby.Stats.WriteCurrentCPStats = function ( controller, mapName )
	if mapName == nil then
		mapName = Engine.GetDvarString( "ui_mapname" )
	end
	local mapData = LuaUtils.mapsTable[mapName]
	if mapData ~= nil and mapData.rootMapName ~= nil then
		local currentStats = Engine.GetPlayerStats( controller )
		Lobby.Stats.WriteCurrentWeaponLevels( controller, currentStats )
		Lobby.Stats.WriteCurrentRankXP( controller, currentStats )
		Lobby.Stats.WriteCurrentDecorations( controller, currentStats )
		Lobby.Stats.WriteMissionStats( controller, currentStats, mapData.rootMapName )
		Engine.Exec( controller, "uploadstats" )
		Engine.Exec( controller, "savegamerprofilestats" )
	end
end

Lobby.Stats.OnMatchStart = function ( data )
	if Engine.IsCampaignGame() then
		local controller = Engine.GetPrimaryController()
		if Engine.GetSavedMap() ~= Engine.GetDvarString( "ui_mapname" ) then
			Lobby.Stats.WriteCurrentCPStats( controller )
		end
		local mapName = Engine.GetDvarString( "ui_mapname" )
		local mapData = LuaUtils.mapsTable[mapName]
		if mapData ~= nil and mapData.rootMapName ~= nil then
			Engine.SetupFieldOpsKitLoadouts( mapData.rootMapName )
		end
	end
end

Lobby.Stats.OnMatchLaunchClient = function ( data )
	if Engine.IsCampaignGame() then
		local controller = Engine.GetPrimaryController()
		Lobby.Stats.WriteCurrentCPStats( controller )
	end
end

Lobby.Stats.OnMatchChangeMap = function ( data )
	if Engine.IsCampaignGame() then
		local controller = Engine.GetPrimaryController()
		local currentMapData, nextMapData = nil
		if data.currentMap ~= nil and data.currentMap ~= "" then
			currentMapData = LuaUtils.mapsTable[data.currentMap]
		end
		if data.nextMap ~= nil and data.nextMap ~= "" then
			nextMapData = LuaUtils.mapsTable[data.nextMap]
		end
		if nextMapData == nil then
			return 
		elseif currentMapData ~= nil and currentMapData.isSafeHouse then
			Lobby.Stats.WriteCurrentCPStats( controller, data.nextMap )
			return 
		end
	end
end

Lobby.Stats.ClearValidationEvent = function ( stats )
	if stats ~= nil and stats.validationEvent:get() ~= "" then
		stats.validationEvent:set( "" )
	end
end

Lobby.Stats.SpecialistErrorDetected = function ( controller, stats, loadouts )
	loadouts.cacloadouts.charactercontext.characterindex:set( 0 )
	loadouts.cacloadouts.herogadget:set( 0 )
	loadouts.cacloadouts.heroweapon:set( 113 )
end

Lobby.Stats.IsWeaponValid = function ( controller, playerRank, weaponIndex, groupString )
	if weaponIndex == 0 then
		return true
	end
	local mpStatsTable = "gamedata/stats/mp/mp_statsTable.csv"
	local mpLootTable = "gamedata/loot/mplootitems.csv"
	local weaponGroup = Engine.TableLookup( mpStatsTable, 2, 0, weaponIndex )
	if weaponGroup:find( groupString ) == nil then
		return false
	elseif Engine.IsLootReady( controller ) and not Engine.IsInventoryBusy( controller ) then
		local weaponRef = Engine.TableLookup( mpStatsTable, 4, 0, weaponIndex )
		local lootRows = Engine.TableFindRows( mpLootTable, 0, weaponRef )
		if lootRows ~= nil and 0 < #lootRows then
			local invQty = Engine.GetLootItemQuantity( controller, weaponRef, Enum.eModes.MODE_MULTIPLAYER )
			if invQty == 0 then
				return false
			end
		end
	end
	return true
end

Lobby.Stats.LoadoutErrorDetected = function ( controller, customClass )
	customClass.primary:set( 0 )
	customClass.primaryattachment1:set( 0 )
	customClass.primaryattachment2:set( 0 )
	customClass.primaryattachment3:set( 0 )
	customClass.primaryattachment4:set( 0 )
	customClass.primaryattachment5:set( 0 )
	customClass.primaryattachment6:set( 0 )
	customClass.primaryattachment7:set( 0 )
	customClass.primaryattachment8:set( 0 )
	customClass.secondary:set( 0 )
	customClass.secondaryattachment1:set( 0 )
	customClass.secondaryattachment2:set( 0 )
	customClass.secondaryattachment3:set( 0 )
	customClass.secondaryattachment4:set( 0 )
	customClass.secondaryattachment5:set( 0 )
	customClass.secondaryattachment6:set( 0 )
	customClass.secondaryattachment7:set( 0 )
	customClass.secondaryattachment8:set( 0 )
end

Lobby.Stats.KillstreakErrorDetected = function ( controller, killstreak )
	killstreak:set( 0 )
end

Lobby.Stats.ValidateCustomClass = function ( controller, playerRank, customClass )
	if customClass then
		local primary = customClass.primary:get()
		local secondary = customClass.secondary:get()
		if not Lobby.Stats.IsWeaponValid( controller, playerRank, primary, "weapon_" ) or not Lobby.Stats.IsWeaponValid( controller, playerRank, secondary, "weapon_" ) then
			Lobby.Stats.LoadoutErrorDetected( controller, customClass )
			return false
		end
	end
	return true
end

Lobby.Stats.ValidateLoadouts = function ( controller )
	if not Engine.StorageIsFileReady( controller, Enum.StorageFileType.STORAGE_MP_LOADOUTS ) then
		return 
	elseif not Engine.StorageIsFileReady( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE ) then
		return 
	elseif not Engine.StorageIsFileReady( controller, Enum.StorageFileType.STORAGE_MP_CLASS_SETS ) then
		return 
	end
	local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	local loadouts = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	local classSets = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_CLASS_SETS )
	local uploadLoadouts = false
	local uploadClassSets = false
	if stats and loadouts then
		local playerRank = stats.playerstatslist.rank.statValue:get()
		local heroWeapon = loadouts.cacloadouts.heroweapon:get()
		local heroAbility = loadouts.cacloadouts.herogadget:get()
		if not (Lobby.Stats.IsWeaponValid( controller, playerRank, heroWeapon, "hero" ) or Lobby.Stats.IsWeaponValid( controller, playerRank, heroWeapon, "weapon_grenade" )) or not Lobby.Stats.IsWeaponValid( controller, playerRank, heroAbility, "weapon_grenade" ) then
			Lobby.Stats.SpecialistErrorDetected( controller, stats, loadouts )
			uploadLoadouts = true
		end
		if classSets then
			setTypes = {
				"publicMatchClassSets",
				"leagueMatchClassSets"
			}
			for _, setType in ipairs( setTypes ) do
				for f16_local5 = 0, 9, 1 do
					local classSet = classSets[setType][f16_local5]
					for i = 0, 9, 1 do
						customClass = classSet.customclass[i]
						if not Lobby.Stats.ValidateCustomClass( controller, playerRank, customClass ) then
							uploadClassSets = true
						end
					end
				end
			end
		end
		for i = 0, 9, 1 do
			customClass = loadouts.cacloadouts.customclass[i]
			if not Lobby.Stats.ValidateCustomClass( controller, playerRank, customClass ) then
				uploadLoadouts = true
			end
		end
		killstreak1 = loadouts.cacloadouts.killstreak1
		if not Lobby.Stats.IsWeaponValid( controller, playerRank, killstreak1:get(), "killstreak" ) then
			Lobby.Stats.KillstreakErrorDetected( controller, killstreak1 )
			uploadLoadouts = true
		end
		killstreak2 = loadouts.cacloadouts.killstreak2
		if not Lobby.Stats.IsWeaponValid( controller, playerRank, killstreak2:get(), "killstreak" ) then
			Lobby.Stats.KillstreakErrorDetected( controller, killstreak2 )
			uploadLoadouts = true
		end
		killstreak3 = loadouts.cacloadouts.killstreak3
		if not Lobby.Stats.IsWeaponValid( controller, playerRank, killstreak3:get(), "killstreak" ) then
			Lobby.Stats.KillstreakErrorDetected( controller, killstreak3 )
			uploadLoadouts = true
		end
		local heroList = Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER )
		local ddlBase = {
			Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_LOADOUTS_ARENA ),
			Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_LOADOUTS_CUSTOM ),
			loadouts
		}
		for i = 1, #ddlBase, 1 do
			if ddlBase[i] then
				local ddlPath = ddlBase[i].cacloadouts.characterContext.characterIndex
				local characterIndex = ddlPath:get()
				if characterIndex < 0 or #heroList <= characterIndex then
					ddlPath:set( 0 )
					uploadLoadouts = true
				end
			end
		end
		LuaUtils.ResetToLastSelectedSpecialistIfNeeded( controller )
	end
	if uploadLoadouts == true then
		Engine.StorageWrite( controller, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	end
	if uploadClassSets == true then
		Engine.StorageWrite( controller, Enum.StorageFileType.STORAGE_MP_CLASS_SETS )
	end
end

Lobby.Stats.OnMPLoadoutsDownloaded = function ( controller )
	local f17_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	local cacLoadouts = f17_local0.cacLoadouts
	local f17_local1 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_LOADOUTS_ARENA )
	local arenaCacLoadouts = f17_local1.arenaCacLoadouts
	local mode = Enum.eModes.MODE_MULTIPLAYER
	local heroTable = Engine.GetHeroList( mode )
	if cacLoadouts then
		for characterIndex = 0, #heroTable - 1, 1 do
			if cacLoadouts.characters[characterIndex].itemList then
				cacLoadouts.characters[characterIndex].itemList.body.items[0].markedOld:set( 1 )
				cacLoadouts.characters[characterIndex].itemList.helmet.items[0].markedOld:set( 1 )
			end
			if cacLoadouts.characters[characterIndex].tauntMarkedOld and cacLoadouts.characters[characterIndex].tauntMarkedOld.first_place and cacLoadouts.characters[characterIndex].tauntMarkedOld.first_place.markedOld then
				cacLoadouts.characters[characterIndex].tauntMarkedOld.first_place.markedOld[0]:set( 1 )
			end
		end
	end
	if arenaCacLoadouts then
		for characterIndex = 0, #heroTable - 1, 1 do
			if arenaCacLoadouts.characters[characterIndex].itemList then
				arenaCacLoadouts.characters[characterIndex].itemList.body.items[0].markedOld:set( 1 )
				arenaCacLoadouts.characters[characterIndex].itemList.helmet.items[0].markedOld:set( 1 )
			end
			if arenaCacLoadouts.characters[characterIndex].tauntMarkedOld and arenaCacLoadouts.characters[characterIndex].tauntMarkedOld.first_place and arenaCacLoadouts.characters[characterIndex].tauntMarkedOld.first_place.markedOld then
				arenaCacLoadouts.characters[characterIndex].tauntMarkedOld.first_place.markedOld[0]:set( 1 )
			end
		end
	end
end

Lobby.Stats.GetPrestigePermanentUnlocks = function ( stats )
	local permUnlocks = 0
	for prestigeAward = 0, 19, 1 do
		if stats.prestigeTokens[prestigeAward].tokenSpent:get() == 1 and 0 < stats.prestigeTokens[prestigeAward].itemunlocked:get() then
			permUnlocks = permUnlocks + 1
		end
	end
	return permUnlocks
end

Lobby.Stats.ValidateUnlockTokens = function ( controller, stats )
	if stats == nil then
		return 
	end
	local usedTokens = 0
	local itemStats = stats.itemStats
	if itemStats then
		for itemIndex = 0, 255, 1 do
			if Engine.ItemIndexValid( itemIndex, Enum.eModes.MODE_MULTIPLAYER ) and Engine.GetItemCost( itemIndex, Enum.eModes.MODE_MULTIPLAYER ) > 0 and itemStats[itemIndex].purchased:get() > 0 then
				usedTokens = usedTokens + 1
			end
		end
	end
	local unusedTokens = stats.unlocks[0]:get()
	local totalTokens = usedTokens + unusedTokens
	local permUnlocks = Lobby.Stats.GetPrestigePermanentUnlocks( stats )
	local rank = stats.playerstatslist.rank.statvalue:get() + 1
	local overage = totalTokens - rank - permUnlocks
	if overage > 0 then
		if overage > 255 then
			overage = 255
		end
		stats.demonwareflags[3]:set( overage )
		Engine.Exec( controller, "uploadstats " .. tostring( Enum.eModes.MODE_MULTIPLAYER ) )
	end
end

Lobby.Stats.OnMPStatsDownloaded = function ( controller )
	if not Engine.StorageIsFileReady( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE ) then
		return 
	else
		local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		Lobby.Stats.ClearValidationEvent( stats )
	end
end

Lobby.Stats.OnMPStatsUploaded = function ( controller )
	local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	Lobby.Stats.ClearValidationEvent( stats )
end

Lobby.Stats.FixXUID = function ( controller, stats )
	local xuid = Engine.GetXUIDString( controller )
	if stats.PlayerXUID then
		local xuidStat = stats.PlayerXUID:get()
		if xuidStat ~= xuid then
			stats.PlayerXUID:set( xuid )
			Engine.StorageWrite( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		end
	end
end

Lobby.Stats.OnMPOnlineStatsDownloaded = function ( controller )
	local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if stats then
		local itemStats = stats.itemStats
		if itemStats then
			for itemIndex = 1, 255, 1 do
				if Engine.ItemIndexValid( itemIndex, Enum.eModes.MODE_MULTIPLAYER ) and Engine.GetItemUnlockLevel( itemIndex, Enum.eModes.MODE_MULTIPLAYER ) == 0 and not Engine.ItemIndexIsBlackMarket( itemIndex, Enum.eModes.MODE_MULTIPLAYER ) then
					itemStats[itemIndex].markedOld:set( 1 )
				end
			end
		end
		Lobby.Stats.ValidateUnlockTokens( controller, stats )
		Lobby.Stats.FixXUID( controller, stats )
	end
	Lobby.Stats.ValidateLoadouts( controller )
end

Lobby.Stats.OnZMOnlineStatsDownloaded = function ( controller )
	local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
	if stats then
		local markedOldCleanupDone = stats.extraBools[1]:get()
		if markedOldCleanupDone == 0 then
			local itemStats = stats.itemStats
			for itemIndex = 234, 255, 1 do
				local dlcName = Engine.GetDLCNameForItem( itemIndex, Enum.eModes.MODE_ZOMBIES )
				if not dlcName or not Engine.HasEntitlementByOwnership( controller, dlcName ) then
					itemStats[itemIndex].markedOld:set( 0 )
				end
			end
			stats.extraBools[1]:set( 1 )
			Engine.StorageWrite( controller, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
		end
	end
end

Lobby.Stats.OnCPOnlineLoadoutsDownloaded = function ( controller )
	local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_CP_LOADOUTS )
	if stats then
		local cacLoadouts = stats.cacLoadouts
		if cacLoadouts then
			local mode = Enum.eModes.MODE_CAMPAIGN
			local heroTable = Engine.GetHeroList( mode )
			for characterIndex = 0, #heroTable - 1, 1 do
				if cacLoadouts.characters[characterIndex].itemList then
					cacLoadouts.characters[characterIndex].itemList.body.items[0].markedOld:set( 1 )
					cacLoadouts.characters[characterIndex].itemList.helmet.items[0].markedOld:set( 1 )
					cacLoadouts.characters[characterIndex].itemList.helmet.items[1].markedOld:set( 1 )
				end
			end
			Engine.StorageWrite( controller, Enum.StorageFileType.STORAGE_CP_LOADOUTS )
		end
	end
end

Lobby.Stats.OnProfileCommonStatsDownloaded = function ( controller )
	local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_COMMON_SETTINGS )
	if stats then
		if Engine.GetLuaCodeVersion() >= 11 and stats.snd_multiplayer_music:get() == 1 then
			stats.snd_multiplayer_music:set( 0 )
			stats.snd_multiplayer_music_track:set( Enum.MultiplayerMusicTracks.MP_MUSIC_TRACKS_DEFAULT )
			Engine.StorageWrite( controller, Enum.StorageFileType.STORAGE_COMMON_SETTINGS )
		end
		local musicPlayerTable = "gamedata/tables/common/music_player.csv"
		local CONSUMABLE_TABLE_COL_ID = Enum.MusicPlayerTableColumn.MUSIC_PLAYER_COLUMN_INDEX
		local CONSUMABLE_TABLE_COL_NAME = Enum.MusicPlayerTableColumn.MUSIC_PLAYER_COLUMN_ALIAS
		local mpLobbyIndex = Engine.TableLookup( musicPlayerTable, CONSUMABLE_TABLE_COL_NAME, CONSUMABLE_TABLE_COL_ID, "mus_mp_lobby_intro" )
		if mpLobbyIndex ~= "" then
			mpLobbyIndex = tonumber( mpLobbyIndex )
		else
			mpLobbyIndex = nil
		end
		if stats.snd_defaultFrontendTracksInitialized:get() == 0 then
			stats.snd_defaultFrontendTracksInitialized:set( 1 )
			stats.snd_muteMPFrontendMusic:set( 0 )
			if mpLobbyIndex then
				stats.snd_playMPFrontendMusicTrack[mpLobbyIndex]:set( 1 )
			else
				stats.snd_playMPFrontendMusicTrack[0]:set( 1 )
			end
			Engine.StorageWrite( controller, Enum.StorageFileType.STORAGE_COMMON_SETTINGS )
		end
		if stats.snd_defaultFrontendTracksInitialized2:get() == 0 then
			stats.snd_defaultFrontendTracksInitialized2:set( 1 )
			local trackCount = Engine.GetTableRowCount( musicPlayerTable )
			local nonDefaultSelected = false
			local totalSelected = 0
			for i = 0, trackCount - 1, 1 do
				if i ~= mpLobbyIndex and stats.snd_playMPFrontendMusicTrack[i]:get() == 1 then
					nonDefaultSelected = true
					break
				elseif i == mpLobbyIndex and stats.snd_playMPFrontendMusicTrack[i]:get() == 0 then
					nonDefaultSelected = true
					break
				end
			end
			if stats.snd_muteMPFrontendMusic:get() == 1 then
				stats.snd_frontendTracksState:set( Enum.FrontendMusicTrackStates.FRONTEND_MUSIC_STATE_OFF )
			elseif nonDefaultSelected then
				stats.snd_frontendTracksState:set( Enum.FrontendMusicTrackStates.FRONTEND_MUSIC_STATE_ON )
			else
				stats.snd_frontendTracksState:set( Enum.FrontendMusicTrackStates.FRONTEND_MUSIC_STATE_DEFAULT )
			end
			if not nonDefaultSelected then
				for i = 0, trackCount - 1, 1 do
					stats.snd_playMPFrontendMusicTrack[i]:set( 1 )
				end
			end
		end
	end
end

Lobby.Stats.InitializeCareerStats = function ( controller, storageFileType )
	local stats = Engine.StorageGetBuffer( controller, storageFileType )
	if not stats then
		return 
	end
	local team = Enum.team_t.TEAM_ALLIES
	if Engine.GetDvarString( "pvp_forcePlayerTeam" ) == "axis" then
		team = Enum.team_t.TEAM_AXIS
	end
	stats.faction:set( team )
	local characters = Engine.GetHeroList( Enum.eModes.MODE_CAMPAIGN )
	for characterIndex, character in ipairs( characters ) do
		local extraData = Engine.GetHeroBundleInfo( Enum.eModes.MODE_CAMPAIGN, characterIndex - 1 )
		if extraData.isCompanion ~= 0 then
			stats.companion:set( characterIndex - 1 )
			break
		end
	end
	Engine.StorageWrite( controller, storageFileType )
end

