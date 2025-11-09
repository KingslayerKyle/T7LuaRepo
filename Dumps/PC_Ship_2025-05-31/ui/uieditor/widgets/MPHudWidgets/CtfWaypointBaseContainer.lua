require( "ui.uieditor.widgets.MPHudWidgets.Waypoint" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	local f1_local0 = "waypoint_waitfor_flag"
	local f1_local1 = f1_arg1.controller
	local f1_local2 = f1_arg0.objId
	local f1_local3 = f1_arg0.Waypoint
	f1_local3.WaypointCenter.waypointCenterImage:setImage( RegisterImage( f1_local0 ) )
	if f1_arg0.visible == true then
		f1_arg0:show()
		f1_local3:update( f1_arg1 )
		f1_local3:setCompassObjectiveIcon( f1_local1, f1_local2, minimapIcon )
	else
		f1_arg0:hide()
		f1_local3:clearCompassObjectiveIcon( f1_local1, f1_local2 )
	end
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	if f2_arg1.objId then
		f2_arg0.objId = f2_arg1.objId
		local f2_local0 = f2_arg0.Waypoint
		f2_local0.objective = f2_arg0.objective
		f2_local0:setupWaypoint( f2_arg1 )
		f2_arg0.flagObjectiveIndex = Engine.GetObjectiveIndexFromName( f2_arg1.controller, string.sub( f2_arg0.objective.id, 1, -5 ) .. "flag" )
	end
end

local f0_local2 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = f3_arg1.controller
	local f3_local1 = f3_arg0.objId
	if not f3_arg0.Waypoint:isOwnedByMyTeam( f3_local0 ) then
		return false
	elseif Engine.GetObjectiveGamemodeFlags( f3_local0, f3_local1 ) ~= f3_arg0.objectiveFlagAway then
		return false
	end
	local f3_local2 = f3_arg0.flagObjectiveIndex
	if f3_local2 then
		if Engine.GetObjectiveGamemodeFlags( f3_local0, f3_local2 ) ~= f3_arg0.objectiveFlagAway then
			return false
		elseif not Engine.ObjectiveIsPlayerUsing( f3_local0, f3_local2, Engine.GetPredictedClientNum( f3_local0 ) ) then
			return false
		end
	end
	return true
end

local PostLoadFunc = function ( f4_arg0 )
	f4_arg0.update = f0_local0
	f4_arg0.setupWaypointContainer = f0_local1
	f4_arg0.shouldShow = f0_local2
	f4_arg0.objectiveAtBase = 0
	f4_arg0.objectiveFlagAway = 1
end

CoD.CtfWaypointBaseContainer = InheritFrom( LUI.UIElement )
CoD.CtfWaypointBaseContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CtfWaypointBaseContainer )
	self.id = "CtfWaypointBaseContainer"
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

