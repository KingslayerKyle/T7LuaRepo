require( "ui_mp.T6.HUD.ObjectiveWaypoint" )

CoD.GametypeBase = InheritFrom( CoD.Menu )
CoD.GametypeBase.CarryIconSize = 64
CoD.GametypeBase.CarryIconRightOffset = -20
CoD.GametypeBase.CarryIconBottomOffset = -150
CoD.GametypeBase.maxObjectives = 32
CoD.GametypeBase.mapIconType = 0
CoD.GametypeBase.GametypeInfoLeftOffset = 13
CoD.GametypeBase.GametypeInfoTopOffset = 185
CoD.GametypeBase.shoutcasterMapIconType = 1
CoD.CarepackageObjective = {}
CoD.ObjectiveRemoteMortar = InheritFrom( CoD.ObjectiveWaypoint )
CoD.ObjectiveBomb = InheritFrom( CoD.ObjectiveWaypoint )
CoD.ObjectiveBomb.GroundZOffset = 32
CoD.ObjectiveBombSite = InheritFrom( CoD.ObjectiveWaypoint )
CoD.ObjectiveBombSite.BombSiteZOffset = 64
CoD.ObjectiveBombSite.OBJECTIVE_FLAG_PLANTED = 1
CoD.ObjectiveBombSite.disablePulse = true
CoD.ObjectiveDefuseSite = InheritFrom( CoD.ObjectiveWaypoint )
CoD.ObjectiveDefuseSite.DefuseSiteZOffset = 32
CoD.ObjectiveDefuseSite.disablePulse = true
local f0_local0 = nil
local f0_local1 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = function ( f2_arg0 )
		CoD.GametypeBase.updateVisibility( f1_arg0, {
			controller = f1_arg1
		} )
	end
	
	local f1_local1 = Engine.GetModelForController( f1_arg1 )
	f1_arg0:subscribeToModel( Engine.GetModel( f1_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), f1_local0 )
	f1_arg0:subscribeToModel( Engine.GetModel( f1_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), f1_local0 )
	f1_arg0:subscribeToModel( Engine.GetModel( f1_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), f1_local0 )
	f1_arg0:subscribeToModel( Engine.GetModel( f1_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), f1_local0 )
	f1_arg0:subscribeToModel( Engine.GetModel( f1_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), f1_local0 )
	f1_arg0:subscribeToModel( Engine.GetModel( f1_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), f1_local0 )
	f1_arg0:subscribeToModel( Engine.GetModel( f1_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), f1_local0 )
	f1_arg0:subscribeToModel( Engine.GetModel( f1_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), f1_local0 )
	f1_arg0:subscribeToModel( Engine.GetModel( f1_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), f1_local0 )
	f1_arg0:subscribeToModel( Engine.GetModel( f1_local1, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), f1_local0 )
end

CoD.GametypeBase.new = function ( f3_arg0, f3_arg1 )
	local f3_local0 = CoD.Menu.NewSafeAreaFromState( f3_arg0, f3_arg1 )
	f3_local0:setClass( CoD.GametypeBase )
	f3_local0:setAlpha( 0 )
	f3_local0.objectiveTypes = {
		bomb = CoD.ObjectiveBomb,
		carepackage = CoD.CarepackageObjective,
		remotemortar = CoD.ObjectiveRemoteMortar
	}
	f3_local0.objectives = {}
	f0_local1( f3_local0, f3_arg1 )
	return f3_local0
end

CoD.GametypeBase.NewObjectiveEvent = function ( f4_arg0, f4_arg1 )
	local f4_local0 = f4_arg0:createObjectiveIfNeeded( f4_arg1, f4_arg1.objId )
	if f4_local0 then
		f4_local0:update( f4_arg1 )
	end
end

CoD.GametypeBase.createObjectiveIfNeeded = function ( f5_arg0, f5_arg1, f5_arg2 )
	local f5_local0 = Engine.GetObjectiveName( f5_arg1.controller, f5_arg2 )
	local f5_local1 = f5_arg0.objectives[f5_arg2]
	if f5_local0 and f5_arg0.objectiveTypes[f5_local0] then
		if not f5_local1 then
			f5_local1 = f5_arg0.objectiveTypes[f5_local0].new( f5_arg1.controller, f5_arg2 )
			f5_arg0:addElement( f5_local1 )
			f5_arg0.objectives[f5_arg2] = f5_local1
		end
		return f5_local1
	else
		
	end
end

CoD.GametypeBase.SetCompassObjectiveIcon = function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
	if f6_arg2 then
		Engine.SetObjectiveIcon( f6_arg0, f6_arg1, CoD.GametypeBase.mapIconType, f6_arg2 )
	else
		Engine.ClearObjectiveIcon( f6_arg0, f6_arg1, CoD.GametypeBase.mapIconType )
	end
	Engine.SetObjectiveIcon( f6_arg0, f6_arg1, CoD.GametypeBase.shoutcasterMapIconType, f6_arg3 )
end

CoD.GametypeBase.ClearCompassObjectiveIcon = function ( f7_arg0, f7_arg1 )
	Engine.ClearObjectiveIcon( f7_arg0, f7_arg1, CoD.GametypeBase.mapIconType )
	Engine.ClearObjectiveIcon( f7_arg0, f7_arg1, CoD.GametypeBase.shoutcasterMapIconType )
end

CoD.GametypeBase.setCarryIcon = function ( f8_arg0, f8_arg1 )
	if f8_arg1 then
		if not f8_arg0.carryIcon then
			f8_arg0.carryIconScaleContainer = CoD.SplitscreenScaler.new( nil, CoD.SplitscreenMultiplier )
			f8_arg0.carryIconScaleContainer:setLeftRight( false, true, 0, 0 )
			f8_arg0.carryIconScaleContainer:setTopBottom( false, true, 0, 0 )
			f8_arg0:addElement( f8_arg0.carryIconScaleContainer )
			f8_arg0.carryIcon = LUI.UIImage.new()
			f8_arg0.carryIcon:setLeftRight( false, true, CoD.GametypeBase.CarryIconRightOffset - CoD.GametypeBase.CarryIconSize, CoD.GametypeBase.CarryIconRightOffset )
			f8_arg0.carryIcon:setTopBottom( false, true, CoD.GametypeBase.CarryIconBottomOffset - CoD.GametypeBase.CarryIconSize, CoD.GametypeBase.CarryIconBottomOffset )
			f8_arg0.carryIconScaleContainer:addElement( f8_arg0.carryIcon )
		end
		f8_arg0.carryIcon:setImage( f8_arg1 )
	elseif f8_arg0.carryIcon then
		f8_arg0.carryIcon:close()
		f8_arg0.carryIcon = nil
		f8_arg0.carryIconScaleContainer:close()
		f8_arg0.carryIconScaleContainer = nil
	end
end

CoD.GametypeBase.SetCarryIconEvent = function ( f9_arg0, f9_arg1 )
	f9_arg0:setCarryIcon( f9_arg1.material )
end

CoD.GametypeBase.updateVisibility = function ( f10_arg0, f10_arg1 )
	local f10_local0 = f10_arg1.controller
	if not Engine.IsVisibilityBitSet( f10_local0, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and Engine.IsVisibilityBitSet( f10_local0, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( f10_local0, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( f10_local0, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( f10_local0, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( f10_local0, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( f10_local0, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( f10_local0, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( f10_local0, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( f10_local0, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) then
		if f10_arg0.visible ~= true then
			f10_arg0:setAlpha( 1 )
			f10_arg0.visible = true
		end
	elseif f10_arg0.visible == true then
		f10_arg0:setAlpha( 0 )
		f10_arg0.visible = nil
	end
end

CoD.GametypeBase:registerEventHandler( "objective_new", CoD.GametypeBase.NewObjectiveEvent )
CoD.GametypeBase:registerEventHandler( "set_carry_icon", CoD.GametypeBase.SetCarryIconEvent )
CoD.ObjectiveBomb.new = function ( f11_arg0, f11_arg1 )
	local f11_local0 = CoD.ObjectiveWaypoint.new( f11_arg0, f11_arg1, CoD.ObjectiveBomb.GroundZOffset )
	f11_local0:setClass( CoD.ObjectiveBomb )
	f11_local0:registerEventHandler( "objective_update_" .. Engine.GetObjectiveName( f11_arg0, f11_arg1 ), f11_local0.update )
	return f11_local0
end

CoD.ObjectiveBomb.update = function ( f12_arg0, f12_arg1 )
	local f12_local0 = f12_arg1.controller
	local f12_local1 = f12_arg0.index
	local f12_local2 = Engine.GetObjectiveEntity( f12_local0, f12_local1 )
	if f12_local2 then
		f12_arg0.zOffset = f12_arg0.PlayerZOffset
	else
		f12_arg0.zOffset = f12_arg0.GroundZOffset
	end
	CoD.ObjectiveBomb.super.update( f12_arg0, f12_arg1 )
	local f12_local3 = f12_arg0:shouldShow( f12_arg1 )
	local f12_local4 = CoD.ObjectiveBomb.shouldShowToCaster( f12_arg0, f12_arg1 )
	local f12_local5 = nil
	if f12_local3 then
		if f12_local2 then
			f12_local5 = "waypoint_defend"
			f12_arg0.arrowImage:setImage( RegisterMaterial( CoD.ObjectiveWaypoint.ArrowMaterialNameGreen ) )
		else
			f12_local5 = "waypoint_bomb"
			f12_arg0.arrowImage:setImage( RegisterMaterial( CoD.ObjectiveWaypoint.ArrowMaterialNameYellow ) )
		end
		f12_arg0.mainImage:setImage( RegisterMaterial( f12_local5 ) )
	end
	if f12_local3 == true or f12_local4 == true then
		CoD.GametypeBase.SetCompassObjectiveIcon( f12_local0, f12_local1, f12_local5, "white_waypoint_bomb" )
	else
		CoD.GametypeBase.ClearCompassObjectiveIcon( f12_local0, f12_local1 )
	end
	if f12_local2 == Engine.GetPredictedClientNum( f12_local0 ) then
		f12_arg0:setCarryIcon( RegisterMaterial( "hud_suitcase_bomb" ) )
	else
		f12_arg0:setCarryIcon( nil )
	end
end

CoD.ObjectiveBomb.shouldShow = function ( f13_arg0, f13_arg1 )
	if not CoD.ObjectiveBomb.super.shouldShow( f13_arg0, f13_arg1 ) then
		return false
	elseif not f13_arg0:isOwnedByMyTeam( f13_arg1.controller ) then
		return false
	else
		return true
	end
end

CoD.ObjectiveBomb.shouldShowToCaster = function ( f14_arg0, f14_arg1 )
	if Engine.GetObjectiveState( f14_arg1.controller, f14_arg0.index ) ~= CoD.OBJECTIVESTATE_ACTIVE then
		return false
	elseif Engine.IsShoutcaster( f14_arg1.controller ) then
		return true
	else
		return false
	end
end

CoD.ObjectiveBombSite.new = function ( f15_arg0, f15_arg1 )
	local f15_local0 = CoD.ObjectiveWaypoint.new( f15_arg0, f15_arg1, CoD.ObjectiveBombSite.BombSiteZOffset )
	f15_local0:setClass( CoD.ObjectiveBombSite )
	f15_local0:registerEventHandler( "objective_update_" .. Engine.GetObjectiveName( f15_arg0, f15_arg1 ), f15_local0.update )
	return f15_local0
end

CoD.ObjectiveBombSite.update = function ( f16_arg0, f16_arg1 )
	CoD.ObjectiveBombSite.super.update( f16_arg0, f16_arg1 )
	local f16_local0 = f16_arg1.controller
	local f16_local1 = f16_arg0.index
	local f16_local2 = Engine.GetObjectiveName( f16_local0, f16_local1 )
	if not f16_local2 then
		return 
	end
	local f16_local3 = string.sub( f16_local2, -2 )
	local f16_local4 = Engine.GetObjectiveGamemodeFlags( f16_local0, f16_arg0.index ) == CoD.ObjectiveBombSite.OBJECTIVE_FLAG_PLANTED
	local f16_local5 = Engine.GetGametypeSetting( "multiBomb" ) == 1
	local f16_local6 = nil
	if f16_arg0:isOwnedByMyTeam( f16_local0 ) then
		if f16_local4 then
			f16_local6 = "waypoint_defuse"
			f16_arg0.arrowImage:setImage( RegisterMaterial( CoD.ObjectiveWaypoint.ArrowMaterialNameRed ) )
		else
			f16_local6 = "waypoint_defend"
			f16_arg0.arrowImage:setImage( RegisterMaterial( CoD.ObjectiveWaypoint.ArrowMaterialNameGreen ) )
		end
		if f16_local5 then
			f16_arg0:setCarryIcon( nil )
		end
	else
		if f16_local4 then
			f16_local6 = "waypoint_defend"
			f16_arg0.arrowImage:setImage( RegisterMaterial( CoD.ObjectiveWaypoint.ArrowMaterialNameGreen ) )
		else
			f16_local6 = "waypoint_target"
			f16_arg0.arrowImage:setImage( RegisterMaterial( CoD.ObjectiveWaypoint.ArrowMaterialNameRed ) )
		end
		if f16_local5 then
			f16_arg0:setCarryIcon( RegisterMaterial( "hud_suitcase_bomb" ) )
		end
	end
	local f16_local7 = f16_local6 .. f16_local3
	f16_arg0.mainImage:setImage( RegisterMaterial( f16_local7 ) )
	CoD.GametypeBase.SetCompassObjectiveIcon( f16_local0, f16_local1, f16_local7, "white_" .. f16_local7 )
end

CoD.ObjectiveDefuseSite.new = function ( f17_arg0, f17_arg1 )
	local f17_local0 = CoD.ObjectiveWaypoint.new( f17_arg0, f17_arg1, CoD.ObjectiveDefuseSite.DefuseSiteZOffset )
	f17_local0:setClass( CoD.ObjectiveDefuseSite )
	f17_local0:registerEventHandler( "objective_update_" .. Engine.GetObjectiveName( f17_arg0, f17_arg1 ), f17_local0.update )
	return f17_local0
end

CoD.ObjectiveDefuseSite.update = CoD.ObjectiveBombSite.update
CoD.CarepackageObjective.new = function ( f18_arg0, f18_arg1 )
	
end

CoD.ObjectiveRemoteMortar.new = function ( f19_arg0, f19_arg1 )
	local f19_local0 = CoD.ObjectiveWaypoint.new( f19_arg0, f19_arg1, 0 )
	f19_local0:setClass( CoD.ObjectiveRemoteMortar )
	f19_local0.arrowImage:close()
	return f19_local0
end

CoD.ObjectiveRemoteMortar.update = function ( f20_arg0, f20_arg1 )
	local f20_local0 = f20_arg1.controller
	local f20_local1 = f20_arg0.index
	Engine.SetObjectiveRotateWithEntity( f20_local0, f20_local1, CoD.GametypeBase.mapIconType, true )
	Engine.SetObjectiveColorMaterialInCode( f20_local0, f20_local1, CoD.GametypeBase.mapIconType, true )
	CoD.GametypeBase.SetCompassObjectiveIcon( f20_local0, f20_local1, "compass_lodestar", "compass_lodestar" )
end

