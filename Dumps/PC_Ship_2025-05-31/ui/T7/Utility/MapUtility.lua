require( "lua.Shared.LuaEnums" )

CoD.MapUtility = {}
CoD.MapUtility.GetBestTimeForFreerunMap = function ( f1_arg0, f1_arg1 )
	if not IsFreeRunMap( f1_arg1 ) then
		return ""
	end
	local f1_local0 = 0
	local f1_local1 = nil
	if IsLive() then
		f1_local1 = Engine.StorageGetBuffer( f1_arg0, Enum.StorageFileType.STORAGE_FR_STATS_ONLINE )
	else
		f1_local1 = Engine.StorageGetBuffer( f1_arg0, Enum.StorageFileType.STORAGE_FR_STATS_OFFLINE )
	end
	if f1_arg1 and f1_local1 then
		local f1_local2 = CoD.mapsTable[f1_arg1]
		if f1_local2 then
			local f1_local3 = f1_local2.freerunTrackIndex
			if f1_local3 then
				f1_local0 = f1_local1.freerunTrackTimes.track[f1_local3].topTimes[0].time:get()
			end
		end
	end
	if f1_local0 and f1_local0 > 0 then
		return NumberAsTime( f1_local0 )
	end
	return "--:--:--"
end

