CoD.FSM_VISIBILITY = function ( controller )
	if Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SELECTING_LOCATION ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) then
		return 1
	else
		return 0
	end
end

CoD.IS_KILLCAM_OR_SPECTATE = function ( controller )
	if controller == nil then
		return 0
	elseif Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_TEAM_SPECTATOR ) or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SPECTATING_CLIENT ) or Engine.InKillcam( controller ) == true or Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_FINAL_KILLCAM ) then
		return 1
	else
		return 0
	end
end

