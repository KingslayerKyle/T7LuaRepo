CoD.ArenaUtility = {}
CoD.ArenaUtility.Init = function ()
	CoD.ArenaUtility.Ranks = Engine.GetArenaInfo()
	local f1_local0 = 0
	for f1_local1 = 1, #CoD.ArenaUtility.Ranks, 1 do
		local f1_local4 = CoD.ArenaUtility.Ranks[f1_local1]
		if f1_local4.points then
			f1_local4.minPoints = f1_local0
			f1_local4.maxPoints = f1_local0 + f1_local4.points - 1
			f1_local0 = f1_local0 + f1_local4.points
		end
	end
end

CoD.ArenaUtility.GetRankInfo = function ( f2_arg0 )
	for f2_local0 = 1, #CoD.ArenaUtility.Ranks, 1 do
		local f2_local3 = CoD.ArenaUtility.Ranks[f2_local0]
		if f2_local3.points and f2_local3.minPoints <= f2_arg0 and f2_arg0 <= f2_local3.maxPoints then
			return f2_local3
		end
	end
end

CoD.ArenaUtility.GetRank = function ( f3_arg0 )
	local f3_local0 = CoD.ArenaUtility.GetRankInfo( f3_arg0 )
	return f3_local0.rank
end

CoD.ArenaUtility.GetAdjustedRank = function ( f4_arg0 )
	local f4_local0 = CoD.ArenaUtility.GetRankInfo( f4_arg0 )
	if f4_local0.mode == "stars_locked" then
		return tostring( f4_local0.rank + 1 )
	else
		return ""
	end
end

CoD.ArenaUtility.GetRankName = function ( f5_arg0 )
	local f5_local0 = CoD.ArenaUtility.GetRankInfo( f5_arg0 )
	if f5_local0.mode == "stars_locked" then
		return Engine.Localize( "MENU_RANK_N", f5_local0.rank + 1 )
	elseif f5_local0.mode == "master" then
		return Engine.Localize( "MENU_MASTERS_CAPS" )
	else
		return ""
	end
end

CoD.ArenaUtility.GetArenaRankIcon = function ( f6_arg0 )
	local f6_local0 = CoD.ArenaUtility.GetRankInfo( f6_arg0 )
	return f6_local0.icon
end

CoD.ArenaUtility.GetStarCount = function ( f7_arg0 )
	local f7_local0 = CoD.ArenaUtility.GetRankInfo( f7_arg0 )
	return f7_arg0 - f7_local0.minPoints
end

CoD.ArenaUtility.GetRankVisibleStars = function ( f8_arg0 )
	local f8_local0 = CoD.ArenaUtility.GetRankInfo( f8_arg0 )
	return f8_local0.points - 1
end

CoD.ArenaUtility.GetArenaRankPoints = function ( f9_arg0 )
	local f9_local0 = CoD.ArenaUtility.GetRankInfo( f9_arg0 )
	return f9_local0.points
end

CoD.ArenaUtility.Init()
