-- deb00f4973b04e5bbdf6af90163b945e
-- This hash is used for caching, delete to decompile the file again

require( "T6.HUD.gametypes.GametypeBase" )

CoD.coop = {}
CoD.coop.FlagLeft = 15
CoD.coop.FlagWidth = 32
CoD.coop.FlagHeight = 32
CoD.coop.FlagTop = 180
CoD.coop.baseWaypointZOffset = 100
CoD.coop.IconGroundZOffset = 32
CoD.COOPObjectiveFlag = InheritFrom( CoD.ObjectiveWaypoint )
CoD.COOPObjectiveIcon = InheritFrom( CoD.ObjectiveWaypoint )
CoD.COOPObjectiveFlag.new = function ( f1_arg0, f1_arg1 )
	local f1_local0 = CoD.ObjectiveWaypoint.new( f1_arg0, f1_arg1, CoD.coop.baseWaypointZOffset )
	f1_local0:setClass( CoD.COOPObjectiveFlag )
	f1_local0:registerEventHandler( "objective_update_" .. Engine.GetObjectiveName( f1_arg0, f1_arg1 ), f1_local0.update )
	return f1_local0
end

CoD.COOPObjectiveFlag.update = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg1.controller
	local f2_local1 = f2_arg0.index
	local f2_local2 = Engine.ObjectiveGetTeamUsingCount( f2_local0, f2_local1 )
	local f2_local3 = Engine.GetObjectiveEntity( f2_local0, f2_local1 )
	if f2_local3 then
		f2_arg0.zOffset = f2_arg0.PlayerZOffset
	else
		f2_arg0.zOffset = CoD.coop.baseWaypointZOffset
	end
	local f2_local4, f2_local5, f2_local6 = nil
	if f2_arg0:isOwnedByMyTeam( f2_local0 ) then
		f2_local5 = "waypoint_defend_flag"
		f2_local6 = f2_local5
		f2_arg0.arrowImage:setImage( RegisterMaterial( CoD.ObjectiveWaypoint.ArrowMaterialNameGreen ) )
	else
		f2_local5 = "waypoint_grab_red"
		f2_local6 = "waypoint_grab"
		f2_arg0.arrowImage:setImage( RegisterMaterial( CoD.ObjectiveWaypoint.ArrowMaterialNameRed ) )
	end
	f2_arg0.mainImage:setImage( RegisterMaterial( f2_local5 ) )
	if f2_local3 == Engine.GetPredictedClientNum( f2_local0 ) then
		f2_arg0:setCarryIcon( RegisterMaterial( "hud_ctf_flag_icon_green" ) )
	else
		f2_arg0:setCarryIcon( nil )
	end
	f2_arg0:setPing( f2_local4 )
	CoD.COOPObjectiveFlag.super.update( f2_arg0, f2_arg1 )
	if f2_arg0.alphaController:getParent() then
		CoD.GametypeBase.SetCompassObjectiveIcon( f2_local0, f2_local1, f2_local5, "white_" .. f2_local6 )
		Engine.SetObjectiveIgnoreEntity( f2_local0, f2_local1, CoD.GametypeBase.mapIconType, f2_arg0.ping == true )
	else
		CoD.GametypeBase.ClearCompassObjectiveIcon( f2_local0, f2_local1 )
	end
end

CoD.COOPObjectiveIcon.new = function ( f3_arg0, f3_arg1 )
	local f3_local0 = CoD.ObjectiveWaypoint.new( f3_arg0, f3_arg1, CoD.coop.IconGroundZOffset )
	f3_local0:setClass( CoD.COOPObjectiveIcon )
	f3_local0:setEntityContainerClamp( false )
	f3_local0:registerEventHandler( "objective_update_" .. Engine.GetObjectiveName( f3_arg0, f3_arg1 ), f3_local0.update )
	return f3_local0
end

CoD.COOPObjectiveIcon.update = function ( f4_arg0, f4_arg1 )
	local f4_local0 = f4_arg1.controller
	local f4_local1 = f4_arg0.index
	local f4_local2 = Engine.GetObjectiveEntity( f4_local0, f4_local1 )
	if f4_local2 then
		f4_arg0.zOffset = f4_arg0.PlayerZOffset
	else
		f4_arg0.zOffset = CoD.coop.IconGroundZOffset
	end
	CoD.COOPObjectiveIcon.super.update( f4_arg0, f4_arg1 )
	local f4_local3 = f4_arg0:shouldShow( f4_arg1 )
	local f4_local4 = CoD.COOPObjectiveIcon.shouldShowToCaster( f4_arg0, f4_arg1 )
	local f4_local5 = nil
	if f4_local3 then
		if f4_local2 then
			f4_local5 = "waypoint_defend"
			f4_arg0.arrowImage:setImage( RegisterMaterial( CoD.ObjectiveWaypoint.ArrowMaterialNameGreen ) )
		else
			f4_local5 = "waypoint_kill"
			f4_arg0.arrowImage:setImage( RegisterMaterial( CoD.ObjectiveWaypoint.ArrowMaterialNameYellow ) )
		end
		f4_arg0.mainImage:setImage( RegisterMaterial( f4_local5 ) )
	end
	if f4_local3 == true or f4_local4 == true then
		CoD.GametypeBase.SetCompassObjectiveIcon( f4_local0, f4_local1, f4_local5, "white_waypoint_bomb" )
	else
		CoD.GametypeBase.ClearCompassObjectiveIcon( f4_local0, f4_local1 )
	end
	if f4_local2 == Engine.GetPredictedClientNum( f4_local0 ) then
		f4_arg0:setCarryIcon( RegisterMaterial( "hud_ctf_flag_icon_white" ) )
	else
		f4_arg0:setCarryIcon( nil )
	end
end

CoD.COOPObjectiveIcon.shouldShowToCaster = function ( f5_arg0, f5_arg1 )
	if Engine.GetObjectiveState( f5_arg1.controller, f5_arg0.index ) ~= CoD.OBJECTIVESTATE_ACTIVE then
		return false
	elseif Engine.IsShoutcaster( f5_arg1.controller ) then
		return true
	else
		return false
	end
end

local f0_local0 = function ( f6_arg0 )
	local f6_local0 = f6_arg0.gametype_coop_objective_layer
	f6_local0:setAlpha( 0 )
	local f6_local1 = CoD.SplitscreenScaler.new( nil, CoD.SplitscreenMultiplier )
	f6_local1:setLeftRight( true, false, 0, 0 )
	f6_local1:setTopBottom( true, false, 0, 0 )
	f6_local0:addElement( f6_local1 )
	if Engine.IsSplitscreen() then
		CoD.coop.FlagLeft = 10
		CoD.coop.FlagTop = 135
	end
	f6_local0.objectiveTypes._a = CoD.ObjectiveBombSite
	f6_local0.objectiveTypes.defuse_a = CoD.ObjectiveDefuseSite
	f6_local0.objectiveTypes.allies_flag = CoD.COOPObjectiveFlag
	f6_local0.objectiveTypes.axis_flag = CoD.COOPObjectiveFlag
	f6_local0.objectiveTypes.no_offscreen = CoD.COOPObjectiveIcon
	local self = LUI.UIElement.new()
	self:setLeftRight( true, false, CoD.coop.FlagLeft, CoD.coop.FlagLeft + CoD.coop.FlagWidth )
	self:setTopBottom( true, false, CoD.coop.FlagTop, CoD.coop.FlagTop + CoD.coop.FlagHeight )
	f6_local1:addElement( self )
	local f6_local3 = LUI.UIElement.new()
	f6_local3:setLeftRight( true, false, CoD.coop.FlagLeft, CoD.coop.FlagLeft + CoD.coop.FlagWidth )
	f6_local3:setTopBottom( true, false, CoD.coop.FlagTop + CoD.coop.FlagHeight, CoD.coop.FlagTop + 2 * CoD.coop.FlagHeight )
	f6_local1:addElement( f6_local3 )
end

LUI.createMenu.gametype_coop = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "gametype_coop" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "gametype_coop.buttonPrompts" )
	local f7_local1 = self
	
	local gametype_coop_objective_layer = CoD.GametypeBase.new( "gametype_coop_objective_layer", controller )
	self:addElement( gametype_coop_objective_layer )
	self.gametype_coop_objective_layer = gametype_coop_objective_layer
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f7_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "gametype_coop.buttonPrompts" ) )
	end )
	if f0_local0 then
		f0_local0( self, controller )
	end
	return self
end

