require( "ui.uieditor.widgets.MPHudWidgets.Waypoint" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = {}
	local f1_local1 = f1_arg0.Waypoint
	local f1_local2 = Engine.GetObjectiveGamemodeFlags( f1_arg1, f1_arg0.objId )
	f1_local0.mapimagename = f1_arg0.waypoint_image_map
	if f1_local2 == f1_arg0.robotShutdown then
		f1_local0.progresscolor = CoD.yellow
		f1_local0.imagename = f1_arg0.waypoint_image_shutdown
	else
		f1_local0.progresscolor = CoD.white
		f1_local0.imagename = f1_arg0.waypoint_image
	end
	if f1_local1:isOwnedByMyTeam( f1_arg1 ) then
		f1_local0.imagecolor = CoD.GetColorSetFriendlyColor( f1_arg1 )
		f1_local0.centerPulse = false
		if f1_local2 == f1_arg0.robotShutdown then
			f1_local0.waypointType = f1_arg0.waypoint_text_shutdown
		elseif f1_arg0.Waypoint.playerUsing ~= nil and f1_arg0.Waypoint.playerUsing == true then
			f1_local0.waypointType = f1_arg0.waypoint_text_escorting
			f1_local0.centerPulse = true
		else
			f1_local0.waypointType = f1_arg0.waypoint_text
		end
	else
		f1_local0.imagecolor = CoD.GetColorSetEnemyColor( f1_arg1 )
		if f1_local2 == f1_arg0.robotShutdown then
			f1_local0.waypointType = f1_arg0.waypoint_text_shutdown
		else
			f1_local0.waypointType = f1_arg0.waypoint_text_enemy
		end
	end
	return f1_local0
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg1.controller
	local f2_local1 = f2_arg0.objId
	local f2_local2 = f2_arg0.Waypoint
	f2_local2.zOffset = f2_arg0.waypoint_z_offset
	local f2_local3 = f0_local0( f2_arg0, f2_local0, f2_local1 )
	if f2_local3.progresscolor then
		f2_local2.progressMeter:setRGB( f2_local3.progresscolor.r, f2_local3.progresscolor.g, f2_local3.progresscolor.b )
	end
	if f2_local3.imagename then
		f2_local2.WaypointCenter.waypointCenterImage:setImage( RegisterImage( f2_local3.imagename ) )
		if f2_local3.imagecolor then
			f2_local2.WaypointCenter.waypointCenterImage:setRGB( f2_local3.imagecolor.r, f2_local3.imagecolor.g, f2_local3.imagecolor.b )
		end
	end
	if f2_local3.waypointType then
		f2_local2.WaypointText.text:setText( Engine.Localize( f2_local3.waypointType ) )
	end
	if f2_local3.centerPulse then
		f2_local2.WaypointCenter:setState( "Pulsing" )
	else
		f2_local2.WaypointCenter:setState( "DefaultState" )
	end
	if f2_arg0.visible == true then
		f2_arg0:show()
		f2_local2:update( f2_arg1 )
		f2_local2:setCompassObjectiveIcon( f2_local0, f2_local1, f2_local3.mapimagename, f2_local3.imagecolor )
		Engine.SetObjectiveIgnoreEntity( f2_local0, f2_local1, CoD.GametypeBase.mapIconType, f2_local2.ping == true )
	else
		f2_arg0:hide()
		f2_local2:clearCompassObjectiveIcon( f2_local0, f2_local1 )
	end
end

local f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
	f3_arg0.progressMeter:setShaderVector( 0, Engine.GetObjectiveProgress( f3_arg1, f3_arg0.objId ), 0, 0, 0 )
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	if f4_arg1.objId then
		f4_arg0.objId = f4_arg1.objId
		local f4_local0 = f4_arg0.Waypoint
		f4_local0.objective = f4_arg0.objective
		f4_local0:setupWaypoint( f4_arg1 )
		f4_local0.snapToCenterWhenContested = false
		f4_local0.snapToCenterForOtherTeams = false
		f4_local0.updateProgress = f0_local2
		f4_local0.ProgressMeterFrame:setAlpha( 1 )
		f4_local0.WaypointArrowContainer:setState( "Progress" )
		local f4_local1 = f4_arg0.objective.id
		f4_arg0.waypoint_text = Engine.StructTableLookupString( "objectives", "id", f4_local1, "waypoint_text" )
		f4_arg0.waypoint_text_enemy = Engine.StructTableLookupString( "objectives", "id", f4_local1, "waypoint_text_enemy" )
		f4_arg0.waypoint_text_escorting = Engine.StructTableLookupString( "objectives", "id", f4_local1, "waypoint_text_escorting" )
		f4_arg0.waypoint_text_shutdown = Engine.StructTableLookupString( "objectives", "id", f4_local1, "waypoint_text_shutdown" )
		f4_arg0.waypoint_image = Engine.StructTableLookupString( "objectives", "id", f4_local1, "waypoint_image" )
		f4_arg0.waypoint_image_map = Engine.StructTableLookupString( "objectives", "id", f4_local1, "waypoint_image_map" )
		f4_arg0.waypoint_image_shutdown = Engine.StructTableLookupString( "objectives", "id", f4_local1, "waypoint_image_shutdown" )
		f4_arg0.waypoint_z_offset = Engine.StructTableLookupNumber( "objectives", "id", f4_local1, "waypoint_z_offset" )
	end
end

local f0_local4 = function ( f5_arg0, f5_arg1 )
	return true
end

local PostLoadFunc = function ( f6_arg0 )
	f6_arg0.update = f0_local1
	f6_arg0.setupWaypointContainer = f0_local3
	f6_arg0.shouldShow = f0_local4
	f6_arg0.robotNone = 0
	f6_arg0.robotMoving = 1
	f6_arg0.robotShutdown = 2
end

CoD.EscortWaypointRobotContainer = InheritFrom( LUI.UIElement )
CoD.EscortWaypointRobotContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.EscortWaypointRobotContainer )
	self.id = "EscortWaypointRobotContainer"
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

