-- 91495a5bf7c25f72957fce704e6254d6
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CodCaster.CodCasterWaypoint" )

local f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = Engine.GetGametypeSetting( "flagCanBeNeutralized" )
	local f1_local1 = Engine.GetObjectiveTeam( f1_arg1, f1_arg2 )
	local f1_local2 = Engine.ObjectiveIsTeamUsing( f1_arg1, f1_arg2, Enum.team_t.TEAM_ALLIES )
	local f1_local3 = Engine.ObjectiveIsAnyOtherTeamUsing( f1_arg1, f1_arg2, Enum.team_t.TEAM_ALLIES )
	local f1_local4 = f1_local2 and f1_local3
	local f1_local5 = {}
	if f1_local1 == Enum.team_t.TEAM_FREE then
		f1_local5.waypointType = f1_arg0.waypoint_label_capture
		f1_local5.imagename = "t7_hud_waypoints_neutral_new"
	elseif f1_local1 == Enum.team_t.TEAM_NEUTRAL then
		f1_local5.imagename = f1_arg0.waypoint_image_neutral
		f1_local5.imagecolor = CoD.white
		if f1_local4 then
			f1_local5.waypointType = f1_arg0.waypoint_label_contested
		elseif f1_local2 or f1_local3 then
			f1_local5.waypointType = f1_arg0.waypoint_label_capturing
		else
			f1_local5.waypointType = f1_arg0.waypoint_label_capture
		end
	elseif f1_local1 == Enum.team_t.TEAM_ALLIES then
		f1_local5.imagename = f1_arg0.waypoint_image_defend
		f1_local5.imagecolor = CoD.GetColorFromFormattedColorString( CoD.GetTeamFactionColor( f1_local1 ) )
		f1_local5.waypointType = f1_arg0.waypoint_label_defend
		if f1_local4 then
			f1_local5.waypointType = f1_arg0.waypoint_label_contested
		elseif f1_local3 then
			f1_local5.waypointType = f1_arg0.waypoint_label_capturing
		end
	elseif f1_local1 == Enum.team_t.TEAM_AXIS then
		f1_local5.imagename = f1_arg0.waypoint_image_capture
		f1_local5.imagecolor = CoD.GetColorFromFormattedColorString( CoD.GetTeamFactionColor( f1_local1 ) )
		f1_local5.waypointType = f1_arg0.waypoint_label_capture
		if f1_local4 then
			f1_local5.waypointType = f1_arg0.waypoint_label_contested
		elseif f1_local2 and f1_local0 == 1 then
			f1_local5.waypointType = f1_arg0.waypoint_label_neutralizing
		elseif f1_local2 then
			f1_local5.waypointType = f1_arg0.waypoint_label_capturing
		end
	end
	return f1_local5
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	if f2_arg0.visible == true then
		f2_arg0:setAlpha( 1 )
		local f2_local0 = f2_arg1.controller
		local f2_local1 = f2_arg0.objId
		f2_arg0:updateProgress( f2_local0, f2_local1 )
		if not Engine.GetObjectiveName( f2_local0, f2_local1 ) then
			return 
		end
		local f2_local2 = f0_local0( f2_arg0, f2_local0, f2_local1 )
		if f2_local2.imagename then
			f2_arg0.WaypointCenter.waypointCenterImage:setImage( RegisterImage( f2_local2.imagename ) )
			if f2_local2.imagecolor then
				f2_arg0.WaypointCenter.waypointCenterImage:setRGB( f2_local2.imagecolor.r, f2_local2.imagecolor.g, f2_local2.imagecolor.b )
			end
		end
	else
		f2_arg0:setAlpha( 0 )
		return 
	end
end

local f0_local2 = function ( f3_arg0, f3_arg1 )
	local f3_local0 = f3_arg1.objId
	if not f3_local0 then
		return 
	end
	local f3_local1 = f3_arg1.controller
	local f3_local2 = Engine.GetObjectiveName( f3_local1, f3_local0 )
	local f3_local3 = CoD.GetCachedObjective( f3_local2 )
	local f3_local4 = Engine.GetModel( Engine.GetModelForController( f3_local1 ), "objective" .. f3_local0 )
	local f3_local5 = nil
	if f3_local2 == "dom_a" then
		f3_local5 = f3_arg0.A
	elseif f3_local2 == "dom_b" then
		f3_local5 = f3_arg0.B
	elseif f3_local2 == "dom_c" then
		f3_local5 = f3_arg0.C
	else
		return 
	end
	f3_local5.objective = f3_local3
	f3_local5.objId = f3_local0
	f3_local5:setModel( f3_local4 )
	f3_local5.update = f0_local1
	f3_local5.visible = true
	f3_local5.pulse = false
	if f3_local5.objective.pulse_waypoint ~= nil then
		f3_local5.pulse = f3_local5.objective.pulse_waypoint == "enable"
	end
	local f3_local6 = f3_local5.objective.id
	f3_local5.waypoint_label_capture = Engine.StructTableLookupString( "objectives", "id", f3_local6, "waypoint_label_capture" )
	f3_local5.waypoint_label_contested = Engine.StructTableLookupString( "objectives", "id", f3_local6, "waypoint_label_contested" )
	f3_local5.waypoint_label_capturing = Engine.StructTableLookupString( "objectives", "id", f3_local6, "waypoint_label_capturing" )
	f3_local5.waypoint_label_neutralizing = Engine.StructTableLookupString( "objectives", "id", f3_local6, "waypoint_label_neutralizing" )
	f3_local5.waypoint_label_defend = Engine.StructTableLookupString( "objectives", "id", f3_local6, "waypoint_label_defend" )
	f3_local5.waypoint_image_neutral = Engine.StructTableLookupString( "objectives", "id", f3_local6, "waypoint_image_neutral" )
	f3_local5.waypoint_image_capture = Engine.StructTableLookupString( "objectives", "id", f3_local6, "waypoint_image_capture" )
	f3_local5.waypoint_image_defend = Engine.StructTableLookupString( "objectives", "id", f3_local6, "waypoint_image_defend" )
	local f3_local7 = Engine.GetModel( f3_local4, "updateTime" )
	if f3_local7 ~= nil then
		f3_local5:subscribeToModel( f3_local7, function ( model )
			f3_local5:update( {
				controller = f3_local1
			} )
		end )
	end
	f3_local5:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f3_local1 ), "CodCaster.profileSettingsUpdated" ), function ( model )
		f3_local5:update( {
			controller = f3_local1
		} )
	end )
end

local PostLoadFunc = function ( f6_arg0, f6_arg1 )
	f6_arg0.A:setAlpha( 0 )
	f6_arg0.B:setAlpha( 0 )
	f6_arg0.C:setAlpha( 0 )
	f6_arg0.create = f0_local2
end

CoD.CodCasterDomFlagsWidget = InheritFrom( LUI.UIElement )
CoD.CodCasterDomFlagsWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CodCasterDomFlagsWidget )
	self.id = "CodCasterDomFlagsWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 103 )
	self:setTopBottom( true, false, 0, 30 )
	self.anyChildUsesUpdateState = true
	
	local A = CoD.CodCasterWaypoint.new( menu, controller )
	A:setLeftRight( false, false, -47, -17 )
	A:setTopBottom( true, false, 0, 30 )
	self:addElement( A )
	self.A = A
	
	local B = CoD.CodCasterWaypoint.new( menu, controller )
	B:setLeftRight( false, false, -14, 16 )
	B:setTopBottom( true, false, 0, 30 )
	self:addElement( B )
	self.B = B
	
	local C = CoD.CodCasterWaypoint.new( menu, controller )
	C:setLeftRight( false, false, 18, 48 )
	C:setTopBottom( true, false, 0, 30 )
	self:addElement( C )
	self.C = C
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		CTF = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		SDorSRorDem = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "CTF",
			condition = function ( menu, element, event )
				return IsGameTypeEqualToString( "ctf" )
			end
		},
		{
			stateName = "SDorSRorDem",
			condition = function ( menu, element, event )
				return IsBombBasedGameMode()
			end
		}
	} )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.A:close()
		element.B:close()
		element.C:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
