-- ffd5410596bde9124e79f5e17a39f2a0
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MPHudWidgets.Waypoint" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = {}
	local f1_local1 = f1_arg0.Waypoint
	f1_local0.waypointType = f1_arg0.waypoint_text
	local f1_local2 = Engine.GetObjectiveGamemodeFlags( f1_arg1, f1_arg2 )
	if f1_local2 ~= nil and f1_local2 > 0 then
		if f1_local2 < f1_arg0.carry_count_m then
			f1_local0.imagename = f1_arg0.waypoint_images_s
		elseif f1_local2 < f1_arg0.carry_count_l then
			f1_local0.imagename = f1_arg0.waypoint_images_m
		else
			f1_local0.imagename = f1_arg0.waypoint_images_l
		end
	end
	if f1_local1:isOwnedByMyTeam( f1_arg1 ) then
		f1_local0.imagecolor = CoD.GetColorSetFriendlyColor( f1_arg1, f1_local1:getTeam( f1_arg1 ) )
	else
		f1_local0.imagecolor = CoD.GetColorSetEnemyColor( f1_arg1, f1_local1:getTeam( f1_arg1 ) )
	end
	return f1_local0
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg1.controller
	local f2_local1 = f2_arg0.objId
	local f2_local2 = f2_arg0.Waypoint
	f2_local2.zOffset = f2_arg0.waypoint_z_offset
	local f2_local3 = f0_local0( f2_arg0, f2_local0, f2_local1 )
	if f2_local3.imagename then
		f2_local2.WaypointCenter.waypointCenterImage:setImage( RegisterImage( f2_local3.imagename ) )
		if f2_local3.imagecolor then
			f2_local2.WaypointCenter.waypointCenterImage:setRGB( f2_local3.imagecolor.r, f2_local3.imagecolor.g, f2_local3.imagecolor.b )
		end
	end
	if f2_local3.waypointType then
		f2_local2.WaypointText.text:setText( Engine.Localize( f2_local3.waypointType ) )
	end
	if f2_arg0.visible == true then
		f2_arg0:show()
		f2_local2:update( f2_arg1 )
		Engine.SetObjectiveIgnoreEntity( f2_local0, f2_local1, CoD.GametypeBase.mapIconType, f2_local2.ping == true )
	else
		f2_arg0:hide()
		f2_local2:clearCompassObjectiveIcon( f2_local0, f2_local1 )
	end
end

local f0_local2 = function ( f3_arg0, f3_arg1 )
	if f3_arg1.objId then
		f3_arg0.objId = f3_arg1.objId
		local f3_local0 = f3_arg0.Waypoint
		f3_local0.objective = f3_arg0.objective
		f3_local0:setupWaypoint( f3_arg1 )
		f3_local0.WaypointText:setState( "NoText" )
		f3_local0.WaypointArrowContainer:setState( "Invisible" )
		f3_local0.snapToCenterWhenContested = false
		f3_local0.snapToCenterForObjectiveTeam = false
		f3_local0.snapToCenterForOtherTeams = false
		local f3_local1 = f3_arg0.objective.id
		f3_arg0.waypoint_text = Engine.StructTableLookupString( "objectives", "id", f3_local1, "waypoint_text" )
		f3_arg0.waypoint_images_s = Engine.StructTableLookupString( "objectives", "id", f3_local1, "waypoint_image_s" )
		f3_arg0.waypoint_images_m = Engine.StructTableLookupString( "objectives", "id", f3_local1, "waypoint_image_m" )
		f3_arg0.waypoint_images_l = Engine.StructTableLookupString( "objectives", "id", f3_local1, "waypoint_image_l" )
		f3_arg0.carry_count_m = Engine.StructTableLookupNumber( "objectives", "id", f3_local1, "carry_count_m" )
		f3_arg0.carry_count_l = Engine.StructTableLookupNumber( "objectives", "id", f3_local1, "carry_count_l" )
		f3_arg0.waypoint_z_offset = Engine.StructTableLookupNumber( "objectives", "id", f3_local1, "waypoint_z_offset" )
	end
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	return true
end

local PostLoadFunc = function ( f5_arg0 )
	f5_arg0.update = f0_local1
	f5_arg0.setupWaypointContainer = f0_local2
	f5_arg0.shouldShow = f0_local3
end

CoD.CleanWaypointCarryContainer = InheritFrom( LUI.UIElement )
CoD.CleanWaypointCarryContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CleanWaypointCarryContainer )
	self.id = "CleanWaypointCarryContainer"
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

