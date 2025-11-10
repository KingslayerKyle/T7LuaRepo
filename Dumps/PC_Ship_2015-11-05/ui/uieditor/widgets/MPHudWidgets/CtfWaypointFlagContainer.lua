require( "ui.uieditor.widgets.MPHudWidgets.Waypoint" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = {}
	local f1_local1 = f1_arg0.Waypoint
	local f1_local2 = Engine.GetObjectiveEntity( f1_arg1, f1_arg2 )
	local f1_local3 = nil
	if f1_local1:isOwnedByMyTeam( f1_arg1 ) then
		if Engine.GetObjectiveGamemodeFlags( f1_arg1, f1_arg2 ) == f1_arg0.objectiveAtBase then
			f1_local0.waypointType = f1_arg0.waypoint_label_defend
			f1_local0.imagename = f1_arg0.waypoint_image_defend
			f1_local0.imagecolor = CoD.GetColorSetFriendlyColor( f1_arg1 )
		elseif f1_local2 then
			f1_local0.waypointType = f1_arg0.waypoint_label_kill
			f1_local0.imagename = f1_arg0.waypoint_image_grab
			f1_local0.imagecolor = CoD.GetColorSetEnemyColor( f1_arg1 )
			if Engine.GetGametypeSetting( "enemyCarrierVisible" ) == 2 then
				f1_local3 = true
			end
		else
			f1_local0.waypointType = f1_arg0.waypoint_label_return
			f1_local0.imagename = f1_arg0.waypoint_image_defend
			f1_local0.imagecolor = CoD.GetColorSetFriendlyColor( f1_arg1 )
		end
	elseif f1_local2 then
		f1_local0.waypointType = f1_arg0.waypoint_label_escort
		f1_local0.imagename = f1_arg0.waypoint_image_defend
		f1_local0.imagecolor = CoD.GetColorSetFriendlyColor( f1_arg1 )
	else
		f1_local0.waypointType = f1_arg0.waypoint_label_grab
		f1_local0.imagename = f1_arg0.waypoint_image_grab
		f1_local0.imagecolor = CoD.GetColorSetEnemyColor( f1_arg1 )
	end
	f1_local1:setPing( f1_local3 )
	return f1_local0
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg0.Waypoint
	local f2_local1 = f2_arg1.controller
	local f2_local2 = f2_arg0.objId
	local f2_local3 = Engine.ObjectiveGetTeamUsingCount( f2_local1, f2_local2 )
	if Engine.GetObjectiveEntity( f2_local1, f2_local2 ) then
		f2_local0.zOffset = f2_arg0.waypoint_player_z_offset
	else
		f2_local0.zOffset = f2_arg0.waypoint_base_z_offset
	end
	local f2_local4 = f0_local0( f2_arg0, f2_local1, f2_local2 )
	if f2_local4.imagename then
		f2_local0.WaypointCenter.waypointCenterImage:setImage( RegisterImage( f2_local4.imagename ) )
		if f2_local4.imagecolor then
			f2_local0.WaypointCenter.waypointCenterImage:setRGB( f2_local4.imagecolor.r, f2_local4.imagecolor.g, f2_local4.imagecolor.b )
		end
	end
	if f2_local4.waypointType then
		f2_local0.WaypointText.text:setText( Engine.Localize( f2_local4.waypointType ) )
	end
	local f2_local5 = f2_local4.imagename .. "_mini"
	if f2_arg0.visible == true then
		f2_arg0:show()
		f2_local0:update( f2_arg1 )
		f2_local0:setCompassObjectiveIcon( f2_local1, f2_local2, f2_local5, f2_local4.imagecolor )
		Engine.SetObjectiveIgnoreEntity( f2_local1, f2_local2, CoD.GametypeBase.mapIconType, f2_local0.ping == true )
	else
		f2_arg0:hide()
		f2_local0:clearCompassObjectiveIcon( f2_local1, f2_local2 )
	end
end

local f0_local2 = function ( f3_arg0, f3_arg1 )
	if f3_arg1.objId then
		f3_arg0.objId = f3_arg1.objId
		local f3_local0 = f3_arg0.Waypoint
		f3_local0.objective = f3_arg0.objective
		f3_local0:setupWaypoint( f3_arg1 )
		local f3_local1 = f3_arg0.objective.id
		f3_arg0.waypoint_label_grab = Engine.StructTableLookupString( "objectives", "id", f3_local1, "waypoint_label_grab" )
		f3_arg0.waypoint_label_kill = Engine.StructTableLookupString( "objectives", "id", f3_local1, "waypoint_label_kill" )
		f3_arg0.waypoint_label_escort = Engine.StructTableLookupString( "objectives", "id", f3_local1, "waypoint_label_escort" )
		f3_arg0.waypoint_label_return = Engine.StructTableLookupString( "objectives", "id", f3_local1, "waypoint_label_return" )
		f3_arg0.waypoint_label_defend = Engine.StructTableLookupString( "objectives", "id", f3_local1, "waypoint_label_defend" )
		f3_arg0.waypoint_image_grab = Engine.StructTableLookupString( "objectives", "id", f3_local1, "waypoint_image_grab" )
		f3_arg0.waypoint_image_defend = Engine.StructTableLookupString( "objectives", "id", f3_local1, "waypoint_image_defend" )
		f3_arg0.waypoint_player_z_offset = Engine.StructTableLookupNumber( "objectives", "id", f3_local1, "waypoint_player_z_offset" )
		f3_arg0.waypoint_base_z_offset = Engine.StructTableLookupNumber( "objectives", "id", f3_local1, "waypoint_z_offset" )
	end
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = f4_arg1.controller
	local f4_local1 = f4_arg0.objId
	if f4_arg0.Waypoint:isOwnedByMyTeam( f4_local0 ) and Engine.GetObjectiveGamemodeFlags( f4_local0, f4_local1 ) ~= f4_arg0.objectiveAtBase and Engine.GetObjectiveEntity( f4_local0, f4_local1 ) and Engine.GetGametypeSetting( "enemyCarrierVisible" ) == 0 then
		return false
	else
		return true
	end
end

local PostLoadFunc = function ( f5_arg0 )
	f5_arg0.update = f0_local1
	f5_arg0.setupWaypointContainer = f0_local2
	f5_arg0.shouldShow = f0_local3
	f5_arg0.objectiveAtBase = 0
	f5_arg0.objectiveFlagAway = 1
end

CoD.CtfWaypointFlagContainer = InheritFrom( LUI.UIElement )
CoD.CtfWaypointFlagContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CtfWaypointFlagContainer )
	self.id = "CtfWaypointFlagContainer"
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

