CoD.FSM_VISIBILITY = function ( f1_arg0 )
	if Engine.IsVisibilityBitSet( f1_arg0, Enum.UIVisibilityBit.BIT_SELECTING_LOCATION ) and not Engine.IsVisibilityBitSet( f1_arg0, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) and not Engine.IsVisibilityBitSet( f1_arg0, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
		return 1
	else
		return 0
	end
end

CoD.IS_KILLCAM_OR_SPECTATE = function ( f2_arg0 )
	if f2_arg0 == nil then
		return 0
	elseif Engine.IsVisibilityBitSet( f2_arg0, Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ) or Engine.IsVisibilityBitSet( f2_arg0, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) or Engine.InKillcam( f2_arg0 ) == true or Engine.IsVisibilityBitSet( f2_arg0, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) then
		return 1
	else
		return 0
	end
end

