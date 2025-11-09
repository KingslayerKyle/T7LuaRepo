require( "ui.uieditor.widgets.CPLevels.Aquifer.HackWaypointInternal" )

local f0_local0 = function ( f1_arg0, f1_arg1 )
	if f1_arg1.objId then
		f1_arg0:setLeftRight( false, false, 0, 0 )
		f1_arg0:setTopBottom( false, false, 0, 0 )
		f1_arg0.objId = f1_arg1.objId
		local f1_local0 = f1_arg0.objective
		local f1_local1
		if f1_local0.waypoint_fade_when_targeted ~= "enable" and f1_local0.waypoint_fade_when_targeted ~= true then
			f1_local1 = false
		else
			f1_local1 = true
		end
		f1_arg0.waypoint_fade_when_targeted = f1_local1
		if f1_local0.waypoint_clamp ~= "enable" and f1_local0.waypoint_clamp ~= true then
			f1_local1 = false
		else
			f1_local1 = true
		end
		f1_arg0.waypoint_container_clamp = f1_local1
		if f1_local0.show_distance ~= "enable" and f1_local0.show_distance ~= true then
			f1_local1 = false
		else
			f1_local1 = true
		end
		f1_arg0.show_distance = f1_local1
		f1_arg0.waypoint_image_default = nil
		if f1_arg0.objective.waypoint_image ~= nil then
			f1_arg0.waypoint_image_default = f1_arg0.objective.waypoint_image
		end
		f1_arg0:setupWaypointContainer( f1_arg0.objId )
		if f1_arg0.waypoint_container_clamp then
			f1_arg0:setEntityContainerClamp( true )
		end
		if f1_arg0.waypoint_fade_when_targeted then
			f1_arg0:setEntityContainerFadeWhenTargeted( true )
		end
		f1_arg0.zOffset = 0
		if f1_arg0.objective.waypoint_z_offset ~= nil then
			f1_arg0.zOffset = f1_arg0.objective.waypoint_z_offset
		end
	end
end

local f0_local1 = function ( f2_arg0, f2_arg1 )
	return true
end

local f0_local2 = function ( f3_arg0, f3_arg1 )
	f3_arg0.isClamped = true
end

local f0_local3 = function ( f4_arg0, f4_arg1 )
	f4_arg0.isClamped = false
end

local f0_local4 = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3, f5_arg4 )
	
end

local f0_local5 = function ( f6_arg0, f6_arg1, f6_arg2 )
	
end

local f0_local6 = function ( f7_arg0, f7_arg1 )
	local f7_local0 = f7_arg1.controller
	local f7_local1 = f7_arg0.objId
	if Engine.GetObjectiveEntity( f7_local0, f7_local1 ) then
		f7_arg0:setupWaypointContainer( f7_local1, 0, 0, f7_arg0.zOffset )
	else
		local f7_local2, f7_local3, f7_local4 = Engine.GetObjectivePosition( f7_local0, f7_local1 )
		f7_arg0:setupWaypointContainer( f7_local1, f7_local2, f7_local3, f7_local4 + f7_arg0.zOffset )
	end
end

local f0_local7 = function ( f8_arg0, f8_arg1 )
	
end

local f0_local8 = function ( f9_arg0 )
	
end

local PostLoadFunc = function ( f10_arg0, f10_arg1 )
	f10_arg0.setupWaypoint = f0_local0
	f10_arg0.update = f0_local6
	f10_arg0.isOwnedByMyTeam = f0_local1
	f10_arg0.SetWaypointState = f0_local7
	f10_arg0.onDone = f0_local8
	f10_arg0.setCompassObjectiveIcon = f0_local4
	f10_arg0.clearCompassObjectiveIcon = f0_local5
	f10_arg0:registerEventHandler( "entity_container_clamped", f0_local2 )
	f10_arg0:registerEventHandler( "entity_container_unclamped", f0_local3 )
	f10_arg0.mapIconType = 0
	f10_arg0.neutralTeamID = 8
end

CoD.HackWaypoint = InheritFrom( LUI.UIElement )
CoD.HackWaypoint.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.HackWaypoint )
	self.id = "HackWaypoint"
	self.soundSet = "none"
	self:setLeftRight( true, false, 0, 92 )
	self:setTopBottom( true, false, 0, 92 )
	
	local internal = CoD.HackWaypointInternal.new( menu, controller )
	internal:setLeftRight( false, false, -46, 46 )
	internal:setTopBottom( false, false, -46, 46 )
	self:addElement( internal )
	self.internal = internal
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				internal:completeAnimation()
				self.internal:setLeftRight( false, false, -46, 46 )
				self.internal:setTopBottom( false, false, -46, 46 )
				self.internal:setRGB( 1, 1, 1 )
				self.internal:setAlpha( 1 )
				self.clipFinished( internal, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.internal:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

