-- 5afb878aab576620b19dbdedb61ffeaf
-- This hash is used for caching, delete to decompile the file again

CoD.ArenaUtility = {}
CoD.ArenaUtility.ArenaPlaylistNamesTable = "gamedata/tables/mp/arena_playlist_names.csv"
CoD.ArenaUtility.ArenaPlaylistIdColumn = 1
CoD.ArenaUtility.ArenaPlaylistNameColumn = 2
CoD.ArenaUtility.ArenaNewSeasonStats = nil
CoD.OverlayUtility.AddSystemOverlay( "ArenaNewSeason", {
	menuName = "SystemOverlay_Full_Arena",
	frameWidget = "CoD.systemOverlay_ArenaNewSeason",
	title = Engine.Localize( "MPUI_PRESTIGE_N", 1 ),
	description = Engine.Localize( "MENU_PRESTIGE_FANFARE_DESC", 1 ),
	[CoD.OverlayUtility.ContinuePropertyName] = function ()
		return function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
			if IsModelValueEqualTo( f2_arg2, "arenaNewSeasonState", "seasonFinale" ) then
				SetControllerModelValue( f2_arg2, "arenaNewSeasonState", "bonusStars" )
			elseif IsModelValueEqualTo( f2_arg2, "arenaNewSeasonState", "seasonStart" ) then
				GoBack( f2_arg3, f2_arg2 )
			end
		end
		
	end
} )
CoD.ArenaUtility.Init = function ()
	CoD.ArenaUtility.Ranks = Engine.GetArenaInfo()
	local f3_local0 = 0
	for f3_local1 = 1, #CoD.ArenaUtility.Ranks, 1 do
		local f3_local4 = CoD.ArenaUtility.Ranks[f3_local1]
		if f3_local4.points then
			f3_local4.minPoints = f3_local0
			f3_local4.maxPoints = f3_local0 + f3_local4.points - 1
			f3_local0 = f3_local0 + f3_local4.points
		end
	end
end

CoD.ArenaUtility.GetRankInfo = function ( f4_arg0 )
	if f4_arg0 ~= nil then
		for f4_local0 = 1, #CoD.ArenaUtility.Ranks, 1 do
			local f4_local3 = CoD.ArenaUtility.Ranks[f4_local0]
			if f4_local3.points and f4_local3.minPoints <= f4_arg0 and f4_arg0 <= f4_local3.maxPoints then
				return f4_local3
			end
		end
	end
	return CoD.ArenaUtility.Ranks[1]
end

CoD.ArenaUtility.GetRank = function ( f5_arg0 )
	local f5_local0 = CoD.ArenaUtility.GetRankInfo( f5_arg0 )
	return f5_local0.rank
end

CoD.ArenaUtility.GetAdjustedRank = function ( f6_arg0 )
	local f6_local0 = CoD.ArenaUtility.GetRankInfo( f6_arg0 )
	if f6_local0.mode == "stars_locked" then
		return tostring( f6_local0.rank + 1 )
	else
		return ""
	end
end

CoD.ArenaUtility.GetRankName = function ( f7_arg0 )
	local f7_local0 = CoD.ArenaUtility.GetRankInfo( f7_arg0 )
	if f7_local0.mode == "stars_locked" then
		return Engine.Localize( "MENU_RANK_N", f7_local0.rank + 1 )
	elseif f7_local0.mode == "master" then
		return Engine.Localize( "MENU_MASTERS_CAPS" )
	else
		return ""
	end
end

CoD.ArenaUtility.IsMaster = function ( f8_arg0 )
	local f8_local0 = CoD.ArenaUtility.GetRankInfo( f8_arg0 )
	return f8_local0.mode == "master"
end

CoD.ArenaUtility.GetArenaRankIcon = function ( f9_arg0 )
	local f9_local0 = CoD.ArenaUtility.GetRankInfo( f9_arg0 )
	return f9_local0.icon
end

CoD.ArenaUtility.GetStarCount = function ( f10_arg0 )
	local f10_local0 = CoD.ArenaUtility.GetRankInfo( f10_arg0 )
	return f10_arg0 - f10_local0.minPoints
end

CoD.ArenaUtility.GetRankVisibleStars = function ( f11_arg0 )
	local f11_local0 = CoD.ArenaUtility.GetRankInfo( f11_arg0 )
	return f11_local0.points - 1
end

CoD.ArenaUtility.GetArenaRankPoints = function ( f12_arg0 )
	local f12_local0 = CoD.ArenaUtility.GetRankInfo( f12_arg0 )
	return f12_local0.points
end

CoD.ArenaUtility.GetBonusStarCount = function ( f13_arg0 )
	return CoD.ArenaUtility.GetRank( f13_arg0 ) * 2
end

CoD.ArenaUtility.UpdateArenaBest = function ( f14_arg0, f14_arg1, f14_arg2 )
	local f14_local0 = false
	local f14_local1 = f14_arg1.arenaBest
	if f14_local1 then
		local f14_local2 = f14_local1.points:get()
		local f14_local3 = f14_arg2.points:get()
		if f14_local2 <= f14_local3 then
			f14_local1.points:set( f14_local3 )
			local f14_local4 = f14_local1.skill:get()
			local f14_local5 = f14_arg2.skill:get()
			if f14_local4 <= f14_local5 then
				f14_local1.skill:set( f14_local5 )
				local f14_local6 = f14_local1.variance:get()
				local f14_local7 = f14_arg2.variance:get()
				if f14_local7 < f14_local6 then
					f14_local1.variance:set( f14_local7 )
				end
			end
			f14_arg1.arenaBestPlaylist:set( tostring( f14_arg0.index ) )
			f14_local0 = true
		end
		local f14_local4 = f14_local1.wins:get()
		local f14_local5 = f14_arg1.arenaPerSeasonStats.wins:get()
		if f14_local4 < f14_local5 then
			f14_local1.wins:set( f14_local5 )
		end
	end
	return f14_local0
end

CoD.ArenaUtility.ClearSlot = function ( f15_arg0, f15_arg1, f15_arg2 )
	if f15_arg0 ~= nil then
		f15_arg0.season:set( f15_arg1 )
		f15_arg0.points:set( f15_arg2 )
		f15_arg0.matchStartPoints:set( 0 )
		f15_arg0.winStreak:set( 0 )
		f15_arg0.wins:set( 0 )
		f15_arg0.losses:set( 0 )
		f15_arg0.losses_late_join:set( 0 )
		f15_arg0.ties:set( 0 )
	end
end

CoD.ArenaUtility.IsBetaSeason = function ( f16_arg0 )
	local f16_local0
	if 0 > f16_arg0 or f16_arg0 >= 2 then
		f16_local0 = false
	else
		f16_local0 = true
	end
	return f16_local0
end

CoD.ArenaUtility.TryFixUpSeason = function ( f17_arg0, f17_arg1 )
	if f17_arg1 < 11 then
		local f17_local0 = f17_arg0.season:get()
		if f17_local0 ~= nil and f17_local0 == 11 then
			f17_arg0.season:set( 2 )
		end
	end
end

CoD.ArenaUtility.IsNewSeasonOverlayNeeded = function ( f18_arg0 )
	if not Dvar.arena_enableArenaNewSeasonOverlay:get() then
		return false
	end
	local f18_local0 = Engine.GetCurrentArenaSeason()
	local f18_local1 = false
	local f18_local2 = Engine.StorageGetBuffer( f18_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if f18_local2 and f18_local2.arenaStats then
		local f18_local3 = f18_local2.arenaStats
		local f18_local4, f18_local5 = LuaUtils.GetArenaPlaylistInfo()
		for f18_local10, f18_local11 in ipairs( f18_local5 ) do
			local f18_local12 = f18_local11.arenaSlot
			if f18_local12 and f18_local3[f18_local12] then
				local f18_local9 = f18_local3[f18_local12]
				if f18_local9.season:get() == f18_local0 - 1 and CoD.ArenaUtility.GetRank( f18_local9.points:get() ) > 0 then
					f18_local1 = true
					break
				end
			end
		end
	end
	return f18_local1
end

local f0_local0 = function ( f19_arg0, f19_arg1 )
	DataSources[f19_arg1] = DataSourceHelpers.ListSetup( f19_arg1, function ( f20_arg0 )
		local f20_local0 = {}
		local f20_local1 = CoD.ArenaUtility.GetStarCount( f19_arg0 )
		local f20_local2 = CoD.ArenaUtility.GetRankInfo( f19_arg0 )
		if f20_local2.mode == "stars_locked" then
			for f20_local3 = 0, f20_local2.points - 1, 1 do
				table.insert( f20_local0, {
					models = {
						earned = f20_local3 < f20_local1
					}
				} )
			end
		end
		return f20_local0
	end )
	return f19_arg1
end

CoD.ArenaUtility.SetNewSeasonOverlayStats = function ( f21_arg0 )
	if not CoD.ArenaUtility.IsNewSeasonOverlayNeeded( f21_arg0 ) then
		return 
	end
	local f21_local0 = {}
	local f21_local1 = Engine.GetCurrentArenaSeason() - 1
	local f21_local2, f21_local3 = LuaUtils.GetArenaPlaylistInfo()
	local f21_local4 = Engine.StorageGetBuffer( f21_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	local f21_local5 = f21_local4.arenaStats
	for f21_local6 = 0, #f21_local5 - 1, 1 do
		local f21_local9 = f21_local5[f21_local6]
		if f21_local9.season:get() == f21_local1 or f21_local9.season:get() > 0 then
			local f21_local10 = f21_local9.points:get()
			local f21_local11 = CoD.ArenaUtility.GetBonusStarCount( f21_local10 )
			local f21_local12 = Engine.TableLookupGetColumnValueForRow( CoD.ArenaUtility.ArenaPlaylistNamesTable, f21_local6, CoD.ArenaUtility.ArenaPlaylistNameColumn )
			if f21_local11 > 0 then
				table.insert( f21_local0, {
					models = {
						playlistName = Engine.Localize( f21_local12 ),
						previousSeasonPoints = f21_local10,
						previousStarsDatasource = f0_local0( f21_local10, "previousSeasonStars" .. tostring( f21_local6 ) ),
						newSeasonPoints = f21_local11,
						newStarsDatasource = f0_local0( f21_local11, "newSeasonStars" .. tostring( f21_local6 ) )
					}
				} )
			end
		end
	end
	CoD.ArenaUtility.ArenaNewSeasonStats = f21_local0
end

CoD.ArenaUtility.CheckSeason = function ( f22_arg0 )
	if not IsPlayerConnectedToCodServers( f22_arg0 ) then
		return 
	end
	CoD.ArenaUtility.SetNewSeasonOverlayStats( f22_arg0 )
	local f22_local0 = Engine.GetCurrentArenaSeason()
	local f22_local1 = false
	local f22_local2 = Engine.StorageGetBuffer( f22_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if f22_local2 ~= nil then
		local f22_local3 = f22_local2.arenaStats
		if f22_local3 ~= nil then
			local f22_local4, f22_local5 = LuaUtils.GetArenaPlaylistInfo()
			for f22_local13, f22_local14 in ipairs( f22_local5 ) do
				local f22_local15 = f22_local14.arenaSlot
				if f22_local15 ~= nil and f22_local15 >= 0 then
					local f22_local9 = f22_local3[f22_local15]
					if f22_local9 ~= nil then
						CoD.ArenaUtility.TryFixUpSeason( f22_local9, f22_local0 )
						local f22_local10 = f22_local9.season:get()
						if f22_local10 ~= nil then
							local f22_local11 = math.abs( f22_local10 - f22_local0 )
							if f22_local11 == 1 then
								local f22_local12 = CoD.ArenaUtility.GetBonusStarCount( Engine.GetArenaPoints( f22_arg0, f22_local14.arenaSlot ) )
								if CoD.ArenaUtility.IsBetaSeason( f22_local10 ) then
									CoD.ArenaUtility.ClearSlot( f22_local9, f22_local0, 0 )
								else
									CoD.ArenaUtility.UpdateArenaBest( f22_local14, f22_local2, f22_local9 )
									CoD.ArenaUtility.ClearSlot( f22_local9, f22_local0, f22_local12 )
								end
								f22_local1 = true
							end
							if f22_local11 > 1 then
								if not CoD.ArenaUtility.IsBetaSeason( f22_local10 ) then
									CoD.ArenaUtility.UpdateArenaBest( f22_local14, f22_local2, f22_local9 )
								end
								CoD.ArenaUtility.ClearSlot( f22_local9, f22_local0, 0 )
								f22_local1 = true
							end
						end
					end
				end
			end
		end
		local f22_local4 = f22_local2.arenaPerSeasonStats
		if f22_local4 then
			local f22_local5 = f22_local4.season:get()
			if f22_local5 and f22_local5 ~= f22_local0 then
				CoD.ArenaUtility.ClearSlot( f22_local4, f22_local0, 0 )
			end
		end
	end
	if f22_local1 == true then
		Engine.Exec( f22_arg0, "uploadstats" )
	end
end

CoD.ArenaUtility.ArenaPregameStart = function ( f23_arg0 )
	if not LuaUtils.IsArenaMode() then
		return 
	end
	local f23_local0 = Engine.StorageGetBuffer( f23_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if f23_local0 ~= nil then
		local f23_local1 = f23_local0.arenaStats
		if f23_local1 ~= nil then
			local f23_local2 = Engine.GetCurrentArenaSlot()
			local f23_local3 = f23_local1[f23_local2]
			if f23_local2 ~= -1 and f23_local3 ~= nil then
				local f23_local4 = f23_local3.points:get()
				local f23_local5 = CoD.ArenaUtility.GetRank( f23_local4 )
				local f23_local6 = math.max( f23_local4 - 1, 0 )
				if f23_local5 == CoD.ArenaUtility.GetRank( f23_local6 ) then
					f23_local3.points:set( f23_local6 )
				end
				f23_local3.matchStartPoints:set( f23_local4 )
				Engine.Exec( f23_arg0, "uploadstats" )
			end
		end
	end
end

CoD.ArenaUtility.ArenaPregameError = function ( f24_arg0 )
	if not LuaUtils.IsArenaMode() then
		return 
	end
	local f24_local0 = Engine.StorageGetBuffer( f24_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if f24_local0 ~= nil then
		local f24_local1 = f24_local0.arenaStats
		if f24_local1 ~= nil then
			local f24_local2 = Engine.GetCurrentArenaSlot()
			local f24_local3 = f24_local1[f24_local2]
			if f24_local2 ~= -1 and f24_local3 ~= nil then
				local f24_local4 = f24_local3.points:get()
				local f24_local5 = f24_local3.matchStartPoints:get()
				if f24_local4 ~= f24_local5 then
					f24_local3.points:set( f24_local5 )
					Engine.Exec( f24_arg0, "uploadstats" )
				end
			end
		end
	end
end

CoD.ArenaUtility.GetBestArenaPoints = function ( f25_arg0, f25_arg1 )
	if not f25_arg1 or not f25_arg1.arenaBest then
		return 0
	end
	local f25_local0 = f25_arg1.arenaBest.points:get()
	local f25_local1 = f25_arg1.arenaStats
	for f25_local2 = 0, #f25_local1 - 1, 1 do
		local f25_local5 = f25_local1[f25_local2]
		if f25_local5 and f25_local5.points then
			f25_local0 = math.max( f25_local0, f25_local5.points:get() )
		end
	end
	return f25_local0
end

CoD.ArenaUtility.AddArenaChallenges = function ( f26_arg0, f26_arg1 )
	local f26_local0 = {}
	CoD.ArenaUtility.AddArenaVetCallingCards( f26_arg0, f26_local0 )
	CoD.ArenaUtility.AddArenaBestCallingCards( f26_arg0, f26_local0 )
	for f26_local4, f26_local5 in ipairs( f26_local0 ) do
		table.insert( f26_arg1, {
			challengeRow = 0,
			imageID = f26_local5.models.iconId,
			isLocked = f26_local5.models.isLocked,
			isMastery = f26_local5.properties.isMastery
		} )
	end
end

CoD.ArenaUtility.GetArenaVetCallingCardNameAndDescForBackgroundId = function ( f27_arg0, f27_arg1 )
	local f27_local0 = Engine.GetBackgroundsForCategoryName( f27_arg0, "arenavet" )
	local f27_local1 = ""
	local f27_local2 = nil
	for f27_local3 = 1, #f27_local0, 1 do
		if f27_local0[f27_local3].id == f27_arg1 then
			if f27_local3 == #f27_local0 then
				f27_local1 = "CHALLENGE_ARENA_VET_SEASON_MASTER"
				return Engine.Localize( f27_local1 ), Engine.Localize( f27_local1 .. "_DESC" )
			end
			local f27_local6 = Dvar.arena_seasonVetChallengeWins:get()
			f27_local1 = "CHALLENGE_ARENA_VET_SEASON_" .. tostring( f27_local3 )
			return Engine.Localize( f27_local1 ), Engine.Localize( f27_local1 .. "_DESC", f27_local6 )
		end
	end
	return "", ""
end

CoD.ArenaUtility.GetArenaBestCallingCardNameAndDescForBackgroundId = function ( f28_arg0, f28_arg1 )
	local f28_local0 = Engine.GetBackgroundsForCategoryName( f28_arg0, "arenabest" )
	for f28_local5, f28_local6 in ipairs( CoD.ArenaUtility.Ranks ) do
		if #f28_local0 < f28_local5 then
			break
		elseif f28_local0[f28_local5].id == f28_arg1 then
			if f28_local6.mode == "master" then
				return Engine.Localize( "MENU_ARENA_MASTER" ), Engine.Localize( "MENU_CHALLENGES_ARENABEST_RANK_MASTER_DESC" )
			end
			local f28_local4 = f28_local6.rank + 1
			return Engine.Localize( "MENU_RANK_N", f28_local4 ), Engine.Localize( "MENU_CHALLENGES_ARENABEST_RANK_N_DESC", f28_local4 )
		end
	end
	return "", ""
end

CoD.ArenaUtility.AddArenaVetCallingCards = function ( f29_arg0, f29_arg1, f29_arg2, f29_arg3 )
	if type( f29_arg1 ) ~= "table" then
		return 
	end
	local f29_local0 = Dvar.arena_seasonVetChallengeWins:get()
	local f29_local1 = Engine.GetCurrentArenaSeason()
	local f29_local2 = false
	local f29_local3 = Engine.GetBackgroundsForCategoryName( f29_arg0, "arenavet" )
	local f29_local4 = Engine.StorageGetBuffer( f29_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	local f29_local5 = f29_local4.arenaChallengeSeasons
	local f29_local6 = f29_local4.arenaPerSeasonStats.season:get()
	local f29_local7 = f29_local4.arenaPerSeasonStats.wins:get()
	if f29_local6 ~= f29_local1 then
		f29_local7 = 0
	end
	for f29_local8 = 1, #f29_local5, 1 do
		local f29_local11 = Engine.Localize( "CHALLENGE_ARENA_VET_SEASON_" .. tostring( f29_local8 ) )
		local f29_local12 = Engine.Localize( "CHALLENGE_ARENA_VET_SEASON_" .. tostring( f29_local8 ) .. "_DESC", f29_local0 )
		if f29_local2 then
			f29_local12 = Engine.Localize( "CHALLENGE_ARENA_VET_SEASON_N_UNAVAILABLE", Engine.Localize( "CHALLENGE_ARENA_VET_SEASON_" .. tostring( f29_local8 - 1 ) ) )
		end
		local f29_local13 = f29_local5[f29_local8 - 1]:get()
		local f29_local14 = f29_local13 == 0
		if f29_arg2 then
			local f29_local15 = f29_local14
		end
		if not (f29_arg3 and (f29_local15 or not f29_local14)) then
			table.insert( f29_arg1, {
				models = {
					title = f29_local11,
					description = f29_local12,
					iconId = f29_local3[f29_local8].id,
					maxTier = 0,
					currentTier = 0,
					statPercent = f29_local7 / f29_local0,
					statFractionText = Engine.Localize( "MPUI_X_SLASH_Y", f29_local7, f29_local0 ),
					tierStatus = "",
					xp = "",
					percentComplete = f29_local7 / f29_local0,
					isLocked = f29_local14,
					hideProgress = f29_local2
				},
				properties = {
					isMastery = false,
					isDarkOps = false,
					isPrestige = false
				}
			} )
		end
		if not f29_local2 then
			f29_local2 = f29_local14 or f29_local13 == f29_local1
		end
	end
end

CoD.ArenaUtility.GetArenaVetMasterCard = function ( f30_arg0 )
	local f30_local0 = Engine.GetBackgroundsForCategoryName( f30_arg0, "arenavet" )
	local f30_local1 = Engine.StorageGetBuffer( f30_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	local f30_local2 = f30_local1.arenaChallengeSeasons
	local f30_local3 = false
	local f30_local4 = 0
	local f30_local5 = #f30_local2
	for f30_local6 = 0, #f30_local2 - 1, 1 do
		if f30_local2[f30_local6]:get() > 0 then
			f30_local4 = f30_local4 + 1
		else
			f30_local3 = true
		end
	end
	return {
		models = {
			title = Engine.Localize( "CHALLENGE_ARENA_VET_SEASON_MASTER" ),
			description = Engine.Localize( "CHALLENGE_ARENA_VET_SEASON_MASTER_DESC" ),
			iconId = f30_local0[#f30_local0].id,
			maxTier = 0,
			currentTier = 0,
			statPercent = f30_local4 / f30_local5,
			statFractionText = Engine.Localize( "MPUI_X_SLASH_Y", f30_local4, f30_local5 ),
			tierStatus = "",
			xp = "",
			percentComplete = f30_local4 / f30_local5,
			isLocked = f30_local3,
			hideProgress = true,
			challengeCategory = "arenavet",
			gameMode = Enum.eModes.MODE_MULTIPLAYER,
			gameModeName = Engine.Localize( "MENU_MULTIPLAYER" ),
			gameModeIcon = CoD.ChallengesUtility.GameModeIcons.MP
		},
		properties = {
			isMastery = true,
			isDarkOps = false,
			isPrestige = false
		}
	}
end

CoD.ArenaUtility.AddArenaBestCallingCards = function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3 )
	if type( f31_arg1 ) ~= "table" then
		return 
	end
	local f31_local0 = Engine.StorageGetBuffer( f31_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	local f31_local1 = f31_local0.arenaBest.wins:get()
	local f31_local2 = f31_local0.arenaPerSeasonStats.wins:get()
	local f31_local3 = CoD.ArenaUtility.GetBestArenaPoints( f31_arg0, f31_local0 )
	local f31_local4 = CoD.ArenaUtility.GetRank( f31_local3 )
	local f31_local5 = Engine.GetBackgroundsForCategoryName( f31_arg0, "arenabest" )
	for f31_local13, f31_local14 in ipairs( CoD.ArenaUtility.Ranks ) do
		local f31_local9 = Engine.Localize( "MENU_RANK_N", f31_local14.rank + 1 )
		local f31_local10 = Engine.Localize( "MENU_CHALLENGES_ARENABEST_RANK_N_DESC", f31_local14.rank + 1 )
		if f31_local14.mode == "master" then
			f31_local9 = Engine.Localize( "MENU_ARENA_MASTER" )
			f31_local10 = Engine.Localize( "MENU_CHALLENGES_ARENABEST_RANK_MASTER_DESC" )
		elseif f31_local14.rank == 0 then
			f31_local10 = Engine.Localize( "MENU_CHALLENGES_ARENABEST_RANK_1_DESC" )
		end
		local f31_local11 = f31_local4 < f31_local14.rank
		if f31_local4 == f31_local14.rank and f31_local4 == 0 then
			if f31_local3 ~= 0 or f31_local1 ~= 0 or f31_local2 ~= 0 then
				f31_local11 = false
			else
				f31_local11 = true
			end
		end
		if f31_arg2 then
			local f31_local12 = f31_local11
		end
		if not (f31_arg3 and (f31_local12 or not f31_local11)) then
			table.insert( f31_arg1, {
				models = {
					title = f31_local9,
					description = f31_local10,
					iconId = f31_local5[f31_local13].id,
					maxTier = 0,
					currentTier = 0,
					statPercent = 0,
					statFractionText = "",
					tierStatus = "",
					xp = "",
					percentComplete = 0,
					isLocked = f31_local11,
					hideProgress = true
				},
				properties = {
					isMastery = false,
					isDarkOps = false,
					isPrestige = false
				}
			} )
		end
	end
end

CoD.ArenaUtility.GetRecentArenaVetChallenges = function ( f32_arg0, f32_arg1, f32_arg2, f32_arg3 )
	local f32_local0 = {}
	local f32_local1 = f32_arg1.arenaPerSeasonStats.wins:get()
	local f32_local2 = f32_arg2.arenaPerSeasonStats.wins:get()
	if f32_local1 ~= f32_local2 and f32_local2 >= Dvar.arena_seasonVetChallengeWins:get() then
		local f32_local3 = {}
		CoD.ArenaUtility.AddArenaVetCallingCards( f32_arg0, f32_local3 )
		local f32_local4 = f32_arg1.arenaChallengeSeasons
		local f32_local5 = f32_arg2.arenaChallengeSeasons
		for f32_local6 = 0, #f32_local5 - 1, 1 do
			if f32_local4[f32_local6]:get() ~= f32_local5[f32_local6]:get() then
				table.insert( f32_local0, f32_local3[f32_local6 + 1] )
				if not f32_arg3 and f32_local6 == #f32_local5 - 1 then
					table.insert( f32_local0, CoD.ArenaUtility.GetArenaVetMasterCard( f32_arg0 ) )
					break
				end
			end
		end
	end
	return f32_local0
end

CoD.ArenaUtility.GetRecentArenaBestChallenges = function ( f33_arg0, f33_arg1, f33_arg2 )
	local f33_local0 = {}
	local f33_local1 = f33_arg1.arenaBest.wins:get()
	local f33_local2 = f33_arg1.arenaPerSeasonStats.wins:get()
	local f33_local3 = CoD.ArenaUtility.GetBestArenaPoints( f33_arg0, f33_arg1 )
	local f33_local4 = CoD.ArenaUtility.GetBestArenaPoints( f33_arg0, f33_arg2 )
	local f33_local5 = CoD.ArenaUtility.GetRank( f33_local3 )
	local f33_local6 = CoD.ArenaUtility.GetRank( f33_local4 )
	if f33_local5 ~= f33_local6 or f33_local3 == 0 and f33_local4 > 0 and f33_local1 == 0 and f33_local2 == 0 then
		local f33_local7 = {}
		CoD.ArenaUtility.AddArenaBestCallingCards( f33_arg0, f33_local7 )
		table.insert( f33_local0, f33_local7[f33_local6 + 1] )
	end
	return f33_local0
end

CoD.ArenaUtility.PlayRecentArenaChallengeToasts = function ( f34_arg0 )
	local f34_local0 = CoD.GetPlayerStats( f34_arg0 )
	local f34_local1 = CoD.GetPlayerStats( f34_arg0, CoD.STATS_LOCATION_STABLE )
	for f34_local5, f34_local6 in ipairs( CoD.ArenaUtility.GetRecentArenaBestChallenges( f34_arg0, f34_local1, f34_local0 ) ) do
		CoD.OverlayUtility.ShowToast( "ArenaChallengeCallingCard", f34_local6.models.title, f34_local6.models.description, nil, nil, nil, GetBackgroundByID( f34_local6.models.iconId ) )
	end
	for f34_local6, f34_local7 in ipairs( CoD.ArenaUtility.GetRecentArenaVetChallenges( f34_arg0, f34_local1, f34_local0, false ) ) do
		CoD.OverlayUtility.ShowToast( "ArenaChallengeCallingCard", f34_local7.models.title, f34_local7.models.description, nil, nil, nil, GetBackgroundByID( f34_local7.models.iconId ) )
	end
end

CoD.ArenaUtility.Init()
