-- 979a81eaa5a76adece31b11212a33dec
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MPHudWidgets.Waypoint" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3, f1_arg4 )
	local f1_local0 = Engine.GetGametypeSetting( "flagCanBeNeutralized" )
	local f1_local1 = Engine.GetObjectiveTeam( f1_arg1, f1_arg2 )
	local f1_local2 = f1_arg3 and f1_arg4
	local f1_local3 = f1_arg0.Waypoint
	local f1_local4 = {}
	if f1_local1 == Enum.team_t.TEAM_FREE then
		f1_local4.waypointType = f1_arg0.waypoint_label_capture
		if f1_local3.waypoint_image_default ~= nil then
			f1_local4.imagename = f1_local3.waypoint_image_default
		else
			f1_local4.imagename = "t7_hud_waypoints_neutral_new"
		end
	elseif f1_local1 == Enum.team_t.TEAM_NEUTRAL then
		f1_local4.imagename = f1_arg0.waypoint_image_neutral
		f1_local4.imagecolor = CoD.white
		if f1_local2 then
			f1_local4.waypointType = f1_arg0.waypoint_label_contested
		elseif f1_arg3 then
			f1_local4.waypointType = f1_arg0.waypoint_label_capturing
		elseif f1_arg4 then
			f1_local4.waypointType = f1_arg0.waypoint_label_losing
		else
			f1_local4.waypointType = f1_arg0.waypoint_label_capture
		end
	elseif f1_local3:isOwnedByMyTeam( f1_arg1 ) then
		f1_local4.imagename = f1_arg0.waypoint_image_defend
		f1_local4.imagecolor = CoD.GetColorSetFriendlyColor( f1_arg1, f1_local3:getTeam( f1_arg1 ) )
		f1_local4.waypointType = f1_arg0.waypoint_label_defend
		if f1_local2 then
			f1_local4.waypointType = f1_arg0.waypoint_label_contested
		elseif f1_arg4 then
			f1_local4.waypointType = f1_arg0.waypoint_label_losing
		end
	elseif not f1_local3:isOwnedByMyTeam( f1_arg1 ) then
		f1_local4.imagename = f1_arg0.waypoint_image_capture
		f1_local4.imagecolor = CoD.GetColorSetEnemyColor( f1_arg1, f1_local3:getTeam( f1_arg1 ) )
		f1_local4.waypointType = f1_arg0.waypoint_label_capture
		if f1_local2 then
			f1_local4.waypointType = f1_arg0.waypoint_label_contested
		elseif f1_arg3 and f1_local0 == 1 then
			f1_local4.waypointType = f1_arg0.waypoint_label_neutralizing
		elseif f1_arg3 then
			f1_local4.waypointType = f1_arg0.waypoint_label_capturing
		end
	end
	return f1_local4
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg0.Waypoint
	if f2_arg0.visible == true then
		f2_arg0:setAlpha( 1 )
		f2_local0:update( f2_arg1 )
		local f2_local1 = f2_arg1.controller
		local f2_local2 = f2_arg0.objId
		if not Engine.GetObjectiveName( f2_local1, f2_local2 ) then
			return 
		end
		local f2_local3 = Engine.GetTeamID( f2_local1, Engine.GetPredictedClientNum( f2_local1 ) )
		local f2_local4 = f0_local0( f2_arg0, f2_local1, f2_local2, Engine.ObjectiveIsTeamUsing( f2_local1, f2_local2, f2_local3 ), Engine.ObjectiveIsAnyOtherTeamUsing( f2_local1, f2_local2, f2_local3 ) )
		if f2_local4.imagename then
			f2_local0.WaypointCenter.waypointCenterImage:setImage( RegisterImage( f2_local4.imagename ) )
			if f2_local4.imagecolor then
				f2_local0.WaypointCenter.waypointCenterImage:setRGB( f2_local4.imagecolor.r, f2_local4.imagecolor.g, f2_local4.imagecolor.b )
			end
		end
		if f2_local4.waypointType then
			f2_local0.WaypointText.text:setText( Engine.Localize( f2_local4.waypointType ) )
		end
		f2_local0:setCompassObjectiveIcon( f2_local1, f2_local2, f2_local4.imagename .. "_mini", f2_local4.imagecolor )
	else
		f2_arg0:setAlpha( 0 )
		return 
	end
end

local f0_local2 = function ( f3_arg0, f3_arg1 )
	if f3_arg1.objId then
		f3_arg0.objId = f3_arg1.objId
		local f3_local0 = f3_arg0.Waypoint
		f3_local0.objective = f3_arg0.objective
		f3_local0:setupWaypoint( f3_arg1 )
		f3_local0.snapToCenterForObjectiveTeam = false
		local f3_local1 = f3_arg0.objective.id
		f3_arg0.waypoint_label_capture = Engine.StructTableLookupString( "objectives", "id", f3_local1, "waypoint_label_capture" )
		f3_arg0.waypoint_label_contested = Engine.StructTableLookupString( "objectives", "id", f3_local1, "waypoint_label_contested" )
		f3_arg0.waypoint_label_capturing = Engine.StructTableLookupString( "objectives", "id", f3_local1, "waypoint_label_capturing" )
		f3_arg0.waypoint_label_neutralizing = Engine.StructTableLookupString( "objectives", "id", f3_local1, "waypoint_label_neutralizing" )
		f3_arg0.waypoint_label_losing = Engine.StructTableLookupString( "objectives", "id", f3_local1, "waypoint_label_losing" )
		f3_arg0.waypoint_label_defend = Engine.StructTableLookupString( "objectives", "id", f3_local1, "waypoint_label_defend" )
		f3_arg0.waypoint_image_neutral = Engine.StructTableLookupString( "objectives", "id", f3_local1, "waypoint_image_neutral" )
		f3_arg0.waypoint_image_capture = Engine.StructTableLookupString( "objectives", "id", f3_local1, "waypoint_image_capture" )
		f3_arg0.waypoint_image_defend = Engine.StructTableLookupString( "objectives", "id", f3_local1, "waypoint_image_defend" )
	end
end

local PostLoadFunc = function ( f4_arg0 )
	f4_arg0.update = f0_local1
	f4_arg0.setupWaypointContainer = f0_local2
end

CoD.DomWaypointContainer = InheritFrom( LUI.UIElement )
CoD.DomWaypointContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.DomWaypointContainer )
	self.id = "DomWaypointContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local Waypoint = CoD.Waypoint.new( menu, controller )
	Waypoint:setLeftRight( true, true, 600, -600 )
	Waypoint:setTopBottom( true, true, 315, -315 )
	self:addElement( Waypoint )
	self.Waypoint = Waypoint
	
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Waypoint:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

