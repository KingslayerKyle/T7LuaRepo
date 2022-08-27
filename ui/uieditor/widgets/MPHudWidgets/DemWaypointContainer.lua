-- 586cd9cbbf95f0a6d643136523525b06
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MPHudWidgets.Waypoint" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = Engine.GetObjectiveTeam( f1_arg1, f1_arg2 )
	local f1_local1 = f1_arg0.Waypoint
	local f1_local2 = Engine.GetObjectiveGamemodeFlags( f1_arg1, f1_arg2 ) == f1_arg0.bombPlanted
	local f1_local3 = {}
	local f1_local4 = Engine.GetModel( Engine.GetModelForController( f1_arg1 ), "Demolition" )
	if f1_local1:isOwnedByMyTeam( f1_arg1 ) then
		Engine.SetModelValue( Engine.GetModel( f1_local4, "defending" ), true )
		if f1_local2 then
			f1_local3.waypointType = f1_arg0.waypoint_label_defuse
			f1_local3.imagename = f1_arg0.waypoint_image_defuse
			f1_local3.imagecolor = CoD.GetColorSetEnemyColor( f1_arg1, f1_local1:getTeam( f1_arg1 ) )
		else
			f1_local3.waypointType = f1_arg0.waypoint_label_defend
			f1_local3.imagename = f1_arg0.waypoint_image_defend
			f1_local3.imagecolor = CoD.GetColorSetFriendlyColor( f1_arg1, f1_local1:getTeam( f1_arg1 ) )
		end
	else
		Engine.SetModelValue( Engine.GetModel( f1_local4, "defending" ), false )
		if f1_local2 then
			f1_local3.waypointType = f1_arg0.waypoint_label_defend
			f1_local3.imagename = f1_arg0.waypoint_image_defend
			f1_local3.imagecolor = CoD.GetColorSetFriendlyColor( f1_arg1, f1_local1:getTeam( f1_arg1 ) )
		else
			f1_local3.waypointType = f1_arg0.waypoint_label_target
			f1_local3.imagename = f1_arg0.waypoint_image_target
			f1_local3.imagecolor = CoD.GetColorSetEnemyColor( f1_arg1, f1_local1:getTeam( f1_arg1 ) )
		end
	end
	return f1_local3
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	local f2_local0 = f2_arg0.Waypoint
	local f2_local1 = f2_arg1.controller
	local f2_local2 = f2_arg0.objId
	local f2_local3 = Engine.GetObjectiveName( f2_local1, f2_local2 )
	if f2_arg0.visible == true then
		f2_arg0:setAlpha( 1 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f2_local1 ), "Demolition." .. f2_local3 .. "_visible" ), true )
		f2_local0:update( f2_arg1 )
		if not f2_local3 then
			return 
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
		f2_local0:setCompassObjectiveIcon( f2_local1, f2_local2, f2_local4.imagename .. "_mini", f2_local4.imagecolor )
	else
		f2_arg0:setAlpha( 0 )
		Engine.SetModelValue( Engine.CreateModel( Engine.GetModelForController( f2_local1 ), "Demolition." .. f2_local3 .. "_visible" ), false )
		return 
	end
end

local f0_local2 = function ( f3_arg0, f3_arg1 )
	if f3_arg1.objId then
		f3_arg0.objId = f3_arg1.objId
		local f3_local0 = f3_arg0.Waypoint
		f3_local0.objective = f3_arg0.objective
		f3_local0:setupWaypoint( f3_arg1 )
		local f3_local1 = f3_arg0.objective.id
		f3_arg0.waypoint_label_target = Engine.StructTableLookupString( "objectives", "id", f3_local1, "waypoint_label_target" )
		f3_arg0.waypoint_label_defuse = Engine.StructTableLookupString( "objectives", "id", f3_local1, "waypoint_label_defuse" )
		f3_arg0.waypoint_label_defend = Engine.StructTableLookupString( "objectives", "id", f3_local1, "waypoint_label_defend" )
		f3_arg0.waypoint_image_defuse = Engine.StructTableLookupString( "objectives", "id", f3_local1, "waypoint_image_defuse" )
		f3_arg0.waypoint_image_target = Engine.StructTableLookupString( "objectives", "id", f3_local1, "waypoint_image_target" )
		f3_arg0.waypoint_image_defend = Engine.StructTableLookupString( "objectives", "id", f3_local1, "waypoint_image_defend" )
	end
end

local PostLoadFunc = function ( f4_arg0 )
	f4_arg0.update = f0_local1
	f4_arg0.setupWaypointContainer = f0_local2
	f4_arg0.bombPlanted = 1
end

CoD.DemWaypointContainer = InheritFrom( LUI.UIElement )
CoD.DemWaypointContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DemWaypointContainer )
	self.id = "DemWaypointContainer"
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

