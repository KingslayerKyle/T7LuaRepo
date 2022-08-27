-- c1a6477c0353febf073c41f3bbd19349
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MPHudWidgets.Waypoint" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	if CoD.IsShoutcaster( f1_arg1 ) then
		return true
	elseif not f1_arg0.Waypoint:isOwnedByMyTeam( f1_arg1 ) then
		return false
	else
		return true
	end
end

local f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2 )
	local f2_local0 = Engine.GetObjectiveTeam( f2_arg1, f2_arg2 )
	local f2_local1 = f2_arg0.Waypoint
	local f2_local2 = Engine.GetObjectiveGamemodeFlags( f2_arg1, f2_arg2 ) == f2_arg0.bombPlanted
	local f2_local3 = {
		team = f2_local0
	}
	if f2_local1:isOwnedByMyTeam( f2_arg1 ) then
		f2_local3.ownedByMyTeam = true
		if f2_local2 then
			f2_local3.waypointType = f2_arg0.waypoint_label_defuse
			f2_local3.imagename = f2_arg0.waypoint_image_defuse
			f2_local3.imagecolor = CoD.GetColorSetEnemyColor( f2_arg1, f2_local1:getTeam( f2_arg1 ) )
		else
			f2_local3.waypointType = f2_arg0.waypoint_label_defend
			f2_local3.imagename = f2_arg0.waypoint_image_defend
			f2_local3.imagecolor = CoD.GetColorSetFriendlyColor( f2_arg1, f2_local1:getTeam( f2_arg1 ) )
		end
	else
		f2_local3.ownedByMyTeam = false
		if f2_local2 then
			f2_local3.waypointType = f2_arg0.waypoint_label_defend
			f2_local3.imagename = f2_arg0.waypoint_image_defend
			f2_local3.imagecolor = CoD.GetColorSetFriendlyColor( f2_arg1, f2_local1:getTeam( f2_arg1 ) )
		else
			f2_local3.waypointType = f2_arg0.waypoint_label_target
			f2_local3.imagename = f2_arg0.waypoint_image_target
			f2_local3.imagecolor = CoD.GetColorSetEnemyColor( f2_arg1, f2_local1:getTeam( f2_arg1 ) )
		end
	end
	return f2_local3
end

local f0_local2 = function ( f3_arg0, f3_arg1, f3_arg2 )
	local f3_local0 = Engine.GetObjectiveTeam( f3_arg1, f3_arg2 )
	local f3_local1 = f3_arg0.Waypoint
	local f3_local2 = Engine.GetObjectiveGamemodeFlags( f3_arg1, f3_arg2 ) == f3_arg0.bombPlanted
	local f3_local3 = Engine.GetGametypeSetting( "multiBomb" ) == 1
	local f3_local4 = {}
	local f3_local5 = f0_local0( f3_arg0, f3_arg1 )
	local f3_local6 = Engine.GetObjectiveEntity( f3_arg1, f3_arg2 )
	if f3_local5 then
		if f3_local6 then
			f3_local4.waypointType = f3_arg0.waypoint_label_defend
			if not f3_local1:isOwnedByMyTeam( f3_arg1 ) then
				f3_local4.waypointType = f3_arg0.waypoint_label_bomb
			end
			f3_local4.imagename = f3_arg0.waypoint_image_defend
			f3_local4.imagecolor = CoD.GetColorSetFriendlyColor( f3_arg1, f3_local1:getTeam( f3_arg1 ) )
		else
			f3_local4.waypointType = f3_arg0.waypoint_label_bomb
			f3_local4.imagename = f3_arg0.waypoint_image_bomb
			f3_local4.imagecolor = CoD.GetColorBlindColorForPlayer( f3_arg1, "PlayerYellow" )
		end
	end
	return f3_local4
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	local f4_local0 = f4_arg0.Waypoint
	if f4_arg0.visible == true then
		f4_arg0:show()
		return true
	else
		f4_arg0:hide()
		f4_local0:clearCompassObjectiveIcon( f4_arg1.controller, f4_arg0.objId )
		return false
	end
end

local f0_local4 = function ( f5_arg0, f5_arg1 )
	if f0_local3( f5_arg0, f5_arg1 ) == false then
		return 
	end
	local f5_local0 = f5_arg0.Waypoint
	f5_local0:update( f5_arg1 )
	local f5_local1 = f5_arg1.controller
	local f5_local2 = f5_arg0.objId
	if not Engine.GetObjectiveName( f5_local1, f5_local2 ) then
		return 
	end
	local f5_local3 = f0_local1( f5_arg0, f5_local1, f5_local2 )
	if CoD.IsShoutcaster( f5_local1 ) then
		if f5_local3.team == Enum.team_t.TEAM_AXIS then
			f5_local3.ownedByMyTeam = true
		else
			f5_local3.ownedByMyTeam = false
		end
	end
	Engine.SetModelValue( Engine.GetModel( Engine.CreateModel( Engine.GetModelForController( f5_local1 ), "SearchAndDestroy" ), "defending" ), f5_local3.ownedByMyTeam )
	if f5_local3.imagename then
		f5_local0.WaypointCenter.waypointCenterImage:setImage( RegisterImage( f5_local3.imagename ) )
		if f5_local3.imagecolor then
			f5_local0.WaypointCenter.waypointCenterImage:setRGB( f5_local3.imagecolor.r, f5_local3.imagecolor.g, f5_local3.imagecolor.b )
		end
	end
	if f5_local3.waypointType then
		f5_local0.WaypointText.text:setText( Engine.Localize( f5_local3.waypointType ) )
	end
	f5_local0:setCompassObjectiveIcon( f5_local1, f5_local2, f5_local3.imagename .. "_mini", f5_local3.imagecolor )
end

local f0_local5 = function ( f6_arg0, f6_arg1 )
	if f0_local3( f6_arg0, f6_arg1 ) == false then
		return 
	end
	local f6_local0 = f6_arg1.controller
	local f6_local1 = f6_arg0.objId
	local f6_local2 = f6_arg0.Waypoint
	if Engine.GetObjectiveEntity( f6_local0, f6_local1 ) then
		f6_local2.zOffset = f6_arg0.waypoint_player_z_offset
	else
		f6_local2.zOffset = f6_arg0.waypoint_z_offset
	end
	local f6_local3 = f0_local2( f6_arg0, f6_local0, f6_local1 )
	if f0_local0( f6_arg0, f6_local0 ) == true then
		if f6_local3.imagename then
			f6_local2.WaypointCenter.waypointCenterImage:setImage( RegisterImage( f6_local3.imagename ) )
			f6_local2:setCompassObjectiveIcon( f6_local0, f6_local1, f6_local3.imagename .. "_mini", f6_local3.imagecolor )
		end
		if f6_local3.imagecolor then
			f6_local2.WaypointCenter.waypointCenterImage:setRGB( f6_local3.imagecolor.r, f6_local3.imagecolor.g, f6_local3.imagecolor.b )
		end
		if f6_local3.waypointType then
			f6_local2.WaypointText.text:setText( Engine.Localize( f6_local3.waypointType ) )
		end
		f6_local2:update( f6_arg1 )
	else
		f6_arg0:hide()
		f6_local2:clearCompassObjectiveIcon( f6_local0, f6_local1 )
	end
end

local f0_local6 = function ( f7_arg0, f7_arg1 )
	if Engine.GetObjectiveName( f7_arg1.controller, f7_arg0.objId ) == "sd_bomb" then
		f0_local5( f7_arg0, f7_arg1 )
	else
		f0_local4( f7_arg0, f7_arg1 )
	end
end

local f0_local7 = function ( f8_arg0, f8_arg1 )
	if f8_arg1.objId then
		f8_arg0.objId = f8_arg1.objId
		local f8_local0 = f8_arg0.Waypoint
		f8_local0.objective = f8_arg0.objective
		f8_local0:setupWaypoint( f8_arg1 )
		local f8_local1 = Engine.GetObjectiveName( f8_arg1.controller, f8_arg0.objId )
		if f8_local1 == "sd_bomb" then
			f8_arg0.waypoint_label_bomb = Engine.StructTableLookupString( "objectives", "id", f8_local1, "waypoint_label_bomb" )
			f8_arg0.waypoint_label_defend = Engine.StructTableLookupString( "objectives", "id", f8_local1, "waypoint_label_defend" )
			f8_arg0.waypoint_image_bomb = Engine.StructTableLookupString( "objectives", "id", f8_local1, "waypoint_image_bomb" )
			f8_arg0.waypoint_image_defend = Engine.StructTableLookupString( "objectives", "id", f8_local1, "waypoint_image_defend" )
			f8_arg0.waypoint_player_z_offset = Engine.StructTableLookupNumber( "objectives", "id", f8_local1, "waypoint_player_z_offset" )
			f8_arg0.waypoint_z_offset = Engine.StructTableLookupNumber( "objectives", "id", f8_local1, "waypoint_z_offset" )
		else
			f8_arg0.waypoint_label_target = Engine.StructTableLookupString( "objectives", "id", f8_local1, "waypoint_label_target" )
			f8_arg0.waypoint_label_defuse = Engine.StructTableLookupString( "objectives", "id", f8_local1, "waypoint_label_defuse" )
			f8_arg0.waypoint_label_defend = Engine.StructTableLookupString( "objectives", "id", f8_local1, "waypoint_label_defend" )
			f8_arg0.waypoint_image_defuse = Engine.StructTableLookupString( "objectives", "id", f8_local1, "waypoint_image_defuse" )
			f8_arg0.waypoint_image_target = Engine.StructTableLookupString( "objectives", "id", f8_local1, "waypoint_image_target" )
			f8_arg0.waypoint_image_defend = Engine.StructTableLookupString( "objectives", "id", f8_local1, "waypoint_image_defend" )
		end
	end
end

local PostLoadFunc = function ( f9_arg0 )
	f9_arg0.update = f0_local6
	f9_arg0.setupWaypointContainer = f0_local7
	f9_arg0.bombPlanted = 1
end

CoD.SDWaypointContainer = InheritFrom( LUI.UIElement )
CoD.SDWaypointContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SDWaypointContainer )
	self.id = "SDWaypointContainer"
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

