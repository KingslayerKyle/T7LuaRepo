require( "ui.uieditor.widgets.MPHudWidgets.Waypoint" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = {}
	local f1_local1 = Engine.ObjectiveGetTeamUsingCount( f1_arg1, f1_arg2 )
	local f1_local2 = Engine.GetObjectiveTeam( f1_arg1, f1_arg2 )
	local f1_local3 = f1_arg0.Waypoint
	local f1_local4 = f1_local1 > 1
	local f1_local5 = CoD.IsShoutcaster( f1_arg1 )
	local f1_local6 = Engine.CreateModel( Engine.GetModelForController( f1_arg1 ), "Hardpoint" )
	local f1_local7 = Engine.GetModel( f1_local6, "state" )
	local f1_local8 = Engine.GetModel( f1_local6, "objId" )
	local f1_local9 = Engine.GetModel( f1_local6, "team" )
	if Engine.GetModelValue( f1_local8 ) ~= f1_arg2 then
		Engine.SetModelValue( f1_local8, f1_arg2 )
	end
	if Engine.GetModelValue( f1_local9 ) ~= f1_local2 then
		Engine.SetModelValue( f1_local9, f1_local2 )
	end
	if f1_local2 == Enum.team_t.TEAM_FREE or f1_local2 == Enum.team_t.TEAM_NEUTRAL then
		f1_local0.waypointType = f1_arg0.waypoint_label_capture
		f1_local0.imagename = f1_arg0.waypoint_image_neutral
		f1_local0.imagecolor = ColorSet.WaypointNeutral
		if f1_local4 then
			Engine.SetModelValue( f1_local7, "contested" )
		else
			Engine.SetModelValue( f1_local7, "neutral" )
		end
	elseif f1_local3:isOwnedByMyTeam( f1_arg1 ) then
		f1_local0.imagename = f1_arg0.waypoint_image_defend
		f1_local0.imagecolor = CoD.GetColorSetFriendlyColor( f1_arg1 )
		if f1_local4 then
			f1_local0.waypointType = f1_arg0.waypoint_label_contested
			f1_local0.imagecolor = ColorSet.WaypointNeutral
			Engine.SetModelValue( f1_local7, "contested" )
		else
			f1_local0.waypointType = f1_arg0.waypoint_label_defend
			if f1_local5 then
				Engine.SetModelValue( f1_local7, "anyteam" )
			else
				Engine.SetModelValue( f1_local7, "friendly" )
			end
		end
	else
		f1_local0.imagename = f1_arg0.waypoint_image_capture
		f1_local0.imagecolor = CoD.GetColorSetEnemyColor( f1_arg1 )
		if f1_local4 then
			f1_local0.waypointType = f1_arg0.waypoint_label_contested
			f1_local0.imagecolor = ColorSet.WaypointNeutral
			Engine.SetModelValue( f1_local7, "contested" )
		else
			f1_local0.waypointType = f1_arg0.waypoint_label_capture
			if f1_local5 then
				Engine.SetModelValue( f1_local7, "anyteam" )
			else
				Engine.SetModelValue( f1_local7, "enemy" )
			end
		end
	end
	return f1_local0
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg0.Waypoint
	if f2_arg0.visible == true then
		f2_arg0:show()
		f2_local0:update( f2_arg1 )
		local f2_local1 = f2_arg0.objId
		local f2_local2 = f2_arg1.controller
		if Engine.GetObjectiveState( f2_local2, f2_local1 ) ~= CoD.OBJECTIVESTATE_ACTIVE then
			return 
		end
		local f2_local3 = f0_local0( f2_arg0, f2_local2, f2_local1 )
		if f2_local3.imagename then
			f2_local0.WaypointCenter.waypointCenterImage:setImage( RegisterImage( f2_local3.imagename ) )
			if f2_local3.imagecolor then
				f2_local0.WaypointCenter.waypointCenterImage:setRGB( f2_local3.imagecolor.r, f2_local3.imagecolor.g, f2_local3.imagecolor.b )
			end
		end
		if f2_local3.waypointType then
			f2_local0.WaypointText.text:setText( Engine.Localize( f2_local3.waypointType ) )
		end
		f2_local0:setCompassObjectiveIcon( f2_local2, f2_local1, f2_local3.imagename .. "_mini", f2_local3.imagecolor )
	else
		f2_arg0:hide()
		return 
	end
end

local f0_local2 = function ( f3_arg0, f3_arg1 )
	if f3_arg1.objId then
		f3_arg0.objId = f3_arg1.objId
		local f3_local0 = f3_arg0.objective.id
		local f3_local1 = f3_arg0.Waypoint
		f3_local1.objective = f3_arg0.objective
		f3_local1:setupWaypoint( f3_arg1 )
		f3_arg0.waypoint_label_capture = Engine.StructTableLookupString( "objectives", "id", f3_local0, "waypoint_label_capture" )
		f3_arg0.waypoint_label_contested = Engine.StructTableLookupString( "objectives", "id", f3_local0, "waypoint_label_contested" )
		f3_arg0.waypoint_label_capturing = Engine.StructTableLookupString( "objectives", "id", f3_local0, "waypoint_label_capturing" )
		f3_arg0.waypoint_label_defend = Engine.StructTableLookupString( "objectives", "id", f3_local0, "waypoint_label_defend" )
		f3_arg0.waypoint_image_neutral = Engine.StructTableLookupString( "objectives", "id", f3_local0, "waypoint_image_neutral" )
		f3_arg0.waypoint_image_capture = Engine.StructTableLookupString( "objectives", "id", f3_local0, "waypoint_image_capture" )
		f3_arg0.waypoint_image_defend = Engine.StructTableLookupString( "objectives", "id", f3_local0, "waypoint_image_defend" )
	end
end

local PostLoadFunc = function ( f4_arg0 )
	f4_arg0.update = f0_local1
	f4_arg0.setupWaypointContainer = f0_local2
end

CoD.KothWaypointContainer = InheritFrom( LUI.UIElement )
CoD.KothWaypointContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.KothWaypointContainer )
	self.id = "KothWaypointContainer"
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

