CoD.MapUtility = {}
CoD.MapUtility.MapsTable = Engine.GetGDTMapsTable()
CoD.MapUtility.GetBestTimeForFreerunMap = function ( controller, mapName )
	if not IsFreeRunMap( mapName ) then
		return ""
	end
	local currentMapBest = 0
	local currentStats = nil
	if IsLive() then
		currentStats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_FR_STATS_ONLINE )
	else
		currentStats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_FR_STATS_OFFLINE )
	end
	if mapName and currentStats then
		local maps = CoD.MapUtility.MapsTable
		local map = maps[mapName]
		if map then
			local trackIndex = map.freerunTrackIndex
			if trackIndex then
				currentMapBest = currentStats.freerunTrackTimes.track[trackIndex].topTimes[0].time:get()
			end
		end
	end
	if currentMapBest and currentMapBest > 0 then
		return NumberAsTime( currentMapBest )
	end
	return "--:--:--"
end

