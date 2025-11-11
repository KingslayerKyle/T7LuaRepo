CoD.ArenaUtility = {}
CoD.ArenaUtility.Init = function ()
	CoD.ArenaUtility.Ranks = Engine.GetArenaInfo()
	local minPoints = 0
	for rankIndex = 1, #CoD.ArenaUtility.Ranks, 1 do
		local rank = CoD.ArenaUtility.Ranks[rankIndex]
		if rank.points then
			rank.minPoints = minPoints
			rank.maxPoints = minPoints + rank.points - 1
			minPoints = minPoints + rank.points
		end
	end
end

CoD.ArenaUtility.GetRankInfo = function ( arenaPoints )
	if arenaPoints ~= nil then
		for rankIndex = 1, #CoD.ArenaUtility.Ranks, 1 do
			local rank = CoD.ArenaUtility.Ranks[rankIndex]
			if rank.points and rank.minPoints <= arenaPoints and arenaPoints <= rank.maxPoints then
				return rank
			end
		end
	end
	return CoD.ArenaUtility.Ranks[1]
end

CoD.ArenaUtility.GetRank = function ( arenaPoints )
	local f3_local0 = CoD.ArenaUtility.GetRankInfo( arenaPoints )
	return f3_local0.rank
end

CoD.ArenaUtility.GetAdjustedRank = function ( arenaPoints )
	local rank = CoD.ArenaUtility.GetRankInfo( arenaPoints )
	if rank.mode == "stars_locked" then
		return tostring( rank.rank + 1 )
	else
		return ""
	end
end

CoD.ArenaUtility.GetRankName = function ( arenaPoints )
	local rank = CoD.ArenaUtility.GetRankInfo( arenaPoints )
	if rank.mode == "stars_locked" then
		return Engine.Localize( "MENU_RANK_N", rank.rank + 1 )
	elseif rank.mode == "master" then
		return Engine.Localize( "MENU_MASTERS_CAPS" )
	else
		return ""
	end
end

CoD.ArenaUtility.IsMaster = function ( arenaPoints )
	local rank = CoD.ArenaUtility.GetRankInfo( arenaPoints )
	return rank.mode == "master"
end

CoD.ArenaUtility.GetArenaRankIcon = function ( arenaPoints )
	local f7_local0 = CoD.ArenaUtility.GetRankInfo( arenaPoints )
	return f7_local0.icon
end

CoD.ArenaUtility.GetStarCount = function ( arenaPoints )
	local rank = CoD.ArenaUtility.GetRankInfo( arenaPoints )
	return arenaPoints - rank.minPoints
end

CoD.ArenaUtility.GetRankVisibleStars = function ( arenaPoints )
	local f9_local0 = CoD.ArenaUtility.GetRankInfo( arenaPoints )
	return f9_local0.points - 1
end

CoD.ArenaUtility.GetArenaRankPoints = function ( arenaPoints )
	local f10_local0 = CoD.ArenaUtility.GetRankInfo( arenaPoints )
	return f10_local0.points
end

CoD.ArenaUtility.UpdateArenaBest = function ( playlist, stats, slotInfo )
	local arenaBest = stats.arenaBest
	if arenaBest then
		local arenaBestPoints = arenaBest.points:get()
		local slotPoints = slotInfo.points:get()
		if arenaBestPoints <= slotPoints then
			arenaBest.points:set( slotPoints )
			local arenaBestSkill = arenaBest.skill:get()
			local slotSkill = slotInfo.skill:get()
			if arenaBestSkill <= slotSkill then
				arenaBest.skill:set( slotSkill )
				local arenaBestVariance = arenaBest.variance:get()
				local slotVariance = slotInfo.variance:get()
				if slotVariance < arenaBestVariance then
					arenaBest.variance:set( slotVariance )
				end
			end
			stats.arenaBestPlaylist:set( playlist.name )
			return true
		end
	end
	return false
end

CoD.ArenaUtility.ClearSlot = function ( slotInfo, season, points )
	if slotInfo ~= nil then
		slotInfo.season:set( season )
		slotInfo.points:set( points )
		slotInfo.matchStartPoints:set( 0 )
		slotInfo.winStreak:set( 0 )
		slotInfo.wins:set( 0 )
		slotInfo.losses:set( 0 )
		slotInfo.losses_late_join:set( 0 )
		slotInfo.ties:set( 0 )
	end
end

CoD.ArenaUtility.IsBetaSeason = function ( season )
	local f13_local0
	if 0 > season or season >= 2 then
		f13_local0 = false
	else
		f13_local0 = true
	end
	return f13_local0
end

CoD.ArenaUtility.TryFixUpSeason = function ( slotInfo, currentSeason )
	if currentSeason < 11 then
		local season = slotInfo.season:get()
		if season ~= nil and season == 11 then
			slotInfo.season:set( 2 )
		end
	end
end

CoD.ArenaUtility.CheckSeason = function ( controller )
	if not IsPlayerConnectedToCodServers( controller ) then
		return 
	end
	local currentSeason = Engine.GetCurrentArenaSeason()
	local changed = false
	local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if stats ~= nil then
		local arenaStats = stats.arenaStats
		if arenaStats ~= nil then
			local arenaCategory, arenaPlaylists = LuaUtils.GetArenaPlaylistInfo()
			for index, playlist in ipairs( arenaPlaylists ) do
				local slot = playlist.arenaSlot
				if slot ~= nil and slot >= 0 then
					local slotInfo = arenaStats[slot]
					if slotInfo ~= nil then
						CoD.ArenaUtility.TryFixUpSeason( slotInfo, currentSeason )
						local season = slotInfo.season:get()
						if season ~= nil then
							local seasonDifference = math.abs( season - currentSeason )
							if seasonDifference == 1 then
								local points = Engine.GetArenaPoints( controller, playlist.arenaSlot )
								local rank = CoD.ArenaUtility.GetRank( points )
								local newPoints = rank * 2
								if CoD.ArenaUtility.IsBetaSeason( season ) then
									CoD.ArenaUtility.ClearSlot( slotInfo, currentSeason, 0 )
								else
									CoD.ArenaUtility.UpdateArenaBest( playlist, stats, slotInfo )
									CoD.ArenaUtility.ClearSlot( slotInfo, currentSeason, newPoints )
								end
								changed = true
							end
							if seasonDifference > 1 then
								if not CoD.ArenaUtility.IsBetaSeason( season ) then
									CoD.ArenaUtility.UpdateArenaBest( playlist, stats, slotInfo )
								end
								CoD.ArenaUtility.ClearSlot( slotInfo, currentSeason, 0 )
								changed = true
							end
						end
					end
				end
			end
		end
	end
	if changed == true then
		Engine.Exec( controller, "uploadstats" )
	end
end

CoD.ArenaUtility.ArenaPregameStart = function ( controller )
	if not LuaUtils.IsArenaMode() then
		return 
	end
	local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if stats ~= nil then
		local arenaStats = stats.arenaStats
		if arenaStats ~= nil then
			local slot = Engine.GetCurrentArenaSlot()
			local slotInfo = arenaStats[slot]
			if slot ~= -1 and slotInfo ~= nil then
				local points = slotInfo.points:get()
				local rank = CoD.ArenaUtility.GetRank( points )
				local newPoints = math.max( points - 1, 0 )
				local newRank = CoD.ArenaUtility.GetRank( newPoints )
				if rank == newRank then
					slotInfo.points:set( newPoints )
				end
				slotInfo.matchStartPoints:set( points )
				Engine.Exec( controller, "uploadstats" )
			end
		end
	end
end

CoD.ArenaUtility.ArenaPregameError = function ( controller )
	if not LuaUtils.IsArenaMode() then
		return 
	end
	local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if stats ~= nil then
		local arenaStats = stats.arenaStats
		if arenaStats ~= nil then
			local slot = Engine.GetCurrentArenaSlot()
			local slotInfo = arenaStats[slot]
			if slot ~= -1 and slotInfo ~= nil then
				local points = slotInfo.points:get()
				local matchStartPoints = slotInfo.matchStartPoints:get()
				if points ~= matchStartPoints then
					slotInfo.points:set( matchStartPoints )
					Engine.Exec( controller, "uploadstats" )
				end
			end
		end
	end
end

CoD.ArenaUtility.Init()
