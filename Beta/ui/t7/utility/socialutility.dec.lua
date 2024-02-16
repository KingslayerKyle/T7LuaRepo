CoD.SocialUtility = {}
CoD.SocialUtility.GetRankIcons = function ( mode, modePlayed, modeRank, modePrestige )
	if not modePlayed then
		return "t7_icon_rank_" .. mode .. "_ghost_level_01"
	elseif mode == "mp" then
		return Engine.TableLookup( 0, CoD.rankIconTable_mp, 0, modeRank, modePrestige + 1 )
	elseif mode == "zm" then
		return Engine.TableLookup( 0, CoD.rankIconTable_zm, 0, modeRank, modePrestige + 1 )
	elseif mode == "cp" then
		return Engine.TableLookup( 0, CoD.rankIconTable_cp, 0, modeRank, modePrestige + 1 )
	else
		return Engine.TableLookup( 0, CoD.rankIconTable_mp, 0, modeRank, modePrestige + 1 )
	end
end

