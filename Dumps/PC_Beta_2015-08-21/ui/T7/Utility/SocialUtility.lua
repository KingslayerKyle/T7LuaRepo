CoD.SocialUtility = {}
CoD.SocialUtility.GetRankIcons = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	if not f1_arg1 then
		return "t7_icon_rank_" .. f1_arg0 .. "_ghost_level_01"
	elseif f1_arg0 == "mp" then
		return Engine.TableLookup( 0, CoD.rankIconTable_mp, 0, f1_arg2, f1_arg3 + 1 )
	elseif f1_arg0 == "zm" then
		return Engine.TableLookup( 0, CoD.rankIconTable_zm, 0, f1_arg2, f1_arg3 + 1 )
	elseif f1_arg0 == "cp" then
		return Engine.TableLookup( 0, CoD.rankIconTable_cp, 0, f1_arg2, f1_arg3 + 1 )
	else
		return Engine.TableLookup( 0, CoD.rankIconTable_mp, 0, f1_arg2, f1_arg3 + 1 )
	end
end

