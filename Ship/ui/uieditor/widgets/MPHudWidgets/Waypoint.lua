-- e725a592e769491148cf1b05a766af30
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MPHudWidgets.WaypointArrowContainer" )
require( "ui.uieditor.widgets.MPHudWidgets.WaypointDistanceIndicatorContainer" )
require( "ui.uieditor.widgets.MPHudWidgets.Waypoint_TextBG" )
require( "ui.uieditor.widgets.MPHudWidgets.WaypointCenter" )

local f0_local0 = 0.8
local f0_local1 = 0.3
local f0_local2 = function ( f1_arg0, f1_arg1 )
	if f1_arg1.objId then
		f1_arg0:setLeftRight( false, false, 0, 0 )
		f1_arg0:setTopBottom( false, false, 0, 0 )
		f1_arg0.objId = f1_arg1.objId
		local f1_local0 = f1_arg0.objective.id
		f1_arg0.waypoint_label_default = f1_arg0.objective.waypoint_text
		if f1_arg0.waypoint_label_default == nil then
			f1_arg0.waypoint_label_default = ""
		end
		local f1_local1 = f1_arg0.objective
		local f1_local2
		if f1_local1.waypoint_fade_when_targeted ~= "enable" and f1_local1.waypoint_fade_when_targeted ~= true then
			f1_local2 = false
		else
			f1_local2 = true
		end
		f1_arg0.waypoint_fade_when_targeted = f1_local2
		if f1_local1.waypoint_clamp ~= "enable" and f1_local1.waypoint_clamp ~= true then
			f1_local2 = false
		else
			f1_local2 = true
		end
		f1_arg0.waypoint_container_clamp = f1_local2
		if f1_local1.show_distance ~= "enable" and f1_local1.show_distance ~= true then
			f1_local2 = false
		else
			f1_local2 = true
		end
		f1_arg0.show_distance = f1_local2
		if f1_local1.hide_arrow ~= "enable" and f1_local1.hide_arrow ~= true then
			f1_local2 = false
		else
			f1_local2 = true
		end
		f1_arg0.hide_arrow = f1_local2
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
		if f1_local1.waypoint_fade_when_in_combat then
			f1_arg0:setEntityContainerFadeWhenInCombat( true )
		end
		if not f1_arg0.isClamped then
			f1_arg0.WaypointDistanceIndicatorContainer:setAlpha( 1 )
		end
		f1_local2 = Engine.GetObjectiveEntity( f1_arg1.controller, f1_arg1.objId )
		f1_arg0.WaypointDistanceIndicatorContainer.DistanceIndicator:setupDistanceIndicator( f1_local2 or f1_arg1.objId, f1_local2 == nil, f1_arg0.show_distance )
		if CoD.isCampaign and f1_local1.waypoint_show_distance_when_far then
			f1_arg0.WaypointText.text:setupDistanceIndicator( f1_local2 or f1_arg1.objId, f1_local2 == nil, f1_arg0.show_distance )
		end
		f1_arg0.snapToCenterWhenContested = true
		f1_arg0.snapToCenterForObjectiveTeam = true
		f1_arg0.snapToCenterForOtherTeams = true
		f1_arg0.updateState = true
		f1_arg0.zOffset = 0
		if f1_arg0.objective.waypoint_z_offset ~= nil then
			f1_arg0.zOffset = f1_arg0.objective.waypoint_z_offset
		end
		f1_arg0.pulse = false
		if f1_arg0.objective.pulse_waypoint ~= nil then
			f1_arg0.pulse = f1_arg0.objective.pulse_waypoint == "enable"
		end
	end
end

local f0_local3 = function ( f2_arg0, f2_arg1 )
	if Engine.GetTeamID( f2_arg1, Engine.GetPredictedClientNum( f2_arg1 ) ) ~= Engine.GetObjectiveTeam( f2_arg1, f2_arg0.objId ) then
		return false
	else
		return true
	end
end

local f0_local4 = function ( f3_arg0, f3_arg1 )
	return Engine.GetObjectiveTeam( f3_arg1, f3_arg0.objId )
end

local f0_local5 = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
	if Engine.IsPlayerInVehicle( f4_arg1 ) == true then
		return false
	elseif Engine.IsPlayerRemoteControlling( f4_arg1 ) == true then
		return false
	elseif Engine.IsPlayerWeaponViewOnlyLinked( f4_arg1 ) == true then
		return false
	end
	local f4_local0 = Engine.GetPredictedClientNum( f4_arg1 )
	local f4_local1 = f4_arg3 and f4_arg2 and f4_arg0.snapToCenterWhenContested
	if f4_arg0:isOwnedByMyTeam( f4_arg1 ) then
		if not f4_arg0.snapToCenterForObjectiveTeam and not f4_local1 then
			return false
		end
	elseif not f4_arg0.snapToCenterForOtherTeams and not f4_local1 then
		return false
	end
	return Engine.ObjectiveIsPlayerUsing( f4_arg1, f4_arg0.objId, f4_local0 )
end

local f0_local6 = function ( f5_arg0, f5_arg1 )
	f5_arg0.isClamped = true
	f5_arg0.WaypointArrowContainer:setupEdgePointer( 90 )
	f5_arg0.WaypointArrowContainer.WaypointArrowWidget:setState( "DefaultState" )
	f5_arg0.WaypointText:setAlpha( f5_arg0.snapped and 1 or 0 )
	f5_arg0.WaypointDistanceIndicatorContainer:setAlpha( 0 )
end

local f0_local7 = function ( f6_arg0, f6_arg1 )
	f6_arg0.isClamped = false
	f6_arg0.WaypointArrowContainer:setupUIElement()
	f6_arg0.WaypointArrowContainer:setZRot( 0 )
	f6_arg0.WaypointArrowContainer.WaypointArrowWidget:setState( "DefaultState" )
	f6_arg0.WaypointText:setAlpha( 1 )
	f6_arg0.WaypointDistanceIndicatorContainer:setAlpha( 1 )
end

local f0_local8 = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3, f7_arg4 )
	if f7_arg3 then
		if f7_arg4 then
			Engine.SetObjectiveIcon( f7_arg1, f7_arg2, f7_arg0.mapIconType, f7_arg3, f7_arg4.r, f7_arg4.g, f7_arg4.b )
			Engine.SetObjectiveIcon( f7_arg1, f7_arg2, CoD.GametypeBase.shoutcasterMapIconType, f7_arg3, f7_arg4.r, f7_arg4.g, f7_arg4.b )
		else
			Engine.SetObjectiveIcon( f7_arg1, f7_arg2, f7_arg0.mapIconType, f7_arg3 )
			Engine.SetObjectiveIcon( f7_arg1, f7_arg2, CoD.GametypeBase.shoutcasterMapIconType, f7_arg3 )
		end
		Engine.SetObjectiveIconPulse( f7_arg1, f7_arg2, f7_arg0.mapIconType, f7_arg0.pulse )
	else
		Engine.ClearObjectiveIcon( f7_arg1, f7_arg2, f7_arg0.mapIconType )
		Engine.ClearObjectiveIcon( f7_arg1, f7_arg2, CoD.GametypeBase.shoutcasterMapIconType )
		Engine.SetObjectiveIconPulse( f7_arg1, f7_arg2, f7_arg0.mapIconType, false )
	end
end

local f0_local9 = function ( f8_arg0, f8_arg1, f8_arg2 )
	Engine.ClearObjectiveIcon( f8_arg1, f8_arg2, f8_arg0.mapIconType )
	Engine.ClearObjectiveIcon( f8_arg1, f8_arg2, CoD.GametypeBase.shoutcasterMapIconType )
end

local f0_local10 = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
	local f9_local0 = Engine.GetObjectiveProgress( f9_arg1, f9_arg0.objId )
	local f9_local1 = f0_local5( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
	local f9_local2 = f9_arg3 and f9_arg2 and not f9_arg0.never_contested
	local f9_local3 = Engine.ObjectiveGetTeamUsingCount( f9_arg1, f9_arg0.objId )
	if not f9_local1 and f9_local0 > 0 then
		f9_arg0.ProgressMeterFrame:setAlpha( 0 )
		f9_arg0.progressMeter:setRGB( 1, 1, 1 )
		f9_arg0.progressMeter:setShaderVector( 0, -0.05, 0, 0, 0 )
		if f9_arg0.updateState then
			if f9_local3 == 1 and f9_arg0.pulse == true then
				f9_arg0.WaypointCenter:setState( "Pulsing" )
			else
				f9_arg0.WaypointCenter:setState( "DefaultState" )
			end
		end
	else
		if f9_arg0.updateState then
			f9_arg0.WaypointCenter:setState( "DefaultState" )
		end
		if f9_local2 == true and f9_local1 then
			f9_arg0.ProgressMeterFrame:setAlpha( 1 )
			f9_arg0.progressMeter:setRGB( 1, 0.4, 0 )
			f9_arg0.progressMeter:setShaderVector( 0, 1, 0, 0, 0 )
		else
			if f9_local0 <= 0 then
				f9_local0 = -0.05
				f9_arg0.ProgressMeterFrame:setAlpha( 0 )
			else
				f9_arg0.ProgressMeterFrame:setAlpha( 1 )
			end
			f9_arg0.progressMeter:setRGB( 1, 1, 1 )
			f9_arg0.progressMeter:setShaderVector( 0, f9_local0, 0, 0, 0 )
		end
	end
end

local f0_local11 = function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
	local f10_local0 = f0_local5( f10_arg0, f10_arg1.controller, f10_arg2, f10_arg3 )
	CoD.ObjectiveWaypoint.largeIconWidth = 64
	CoD.ObjectiveWaypoint.largeIconHeight = 64
	CoD.ObjectiveWaypoint.progressWidth = CoD.ObjectiveWaypoint.largeIconWidth + 4
	CoD.ObjectiveWaypoint.progressHeight = CoD.ObjectiveWaypoint.largeIconHeight + 4
	CoD.ObjectiveWaypoint.progressHeightNudge = 0
	CoD.ObjectiveWaypoint.snapToHeight = 112
	CoD.ObjectiveWaypoint.snapToTime = 250
	if f10_arg0.playerUsing == f10_local0 then
		return 
	elseif f10_local0 == true then
		if f10_arg0.playerUsing ~= nil then
			f10_arg0:beginAnimation( "snap_in", 250, true, true )
		end
		f10_arg0.snapped = true
		f10_arg0.WaypointText:setAlpha( 1 )
		f10_arg0:setEntityContainerStopUpdating( true )
		f10_arg0:setLeftRight( false, false, -32, 32 )
		f10_arg0:setTopBottom( false, false, -176, -112 )
		f10_arg0.WaypointArrowContainer:setAlpha( 0 )
	else
		if f10_arg0.playerUsing ~= nil then
			f10_arg0:beginAnimation( "snap_out", 250, true, true )
		end
		f10_arg0.snapped = false
		f10_arg0:setEntityContainerStopUpdating( false )
		f10_arg0:setLeftRight( false, false, -28, 28 )
		f10_arg0:setTopBottom( false, true, -56, 0 )
		f10_arg0.WaypointArrowContainer:setAlpha( 1 )
	end
	f10_arg0.playerUsing = f10_local0
end

local f0_local12 = function ( f11_arg0, f11_arg1 )
	local f11_local0 = f11_arg1.controller
	local f11_local1 = f11_arg0.objId
	local f11_local2 = f11_arg0.ping
	if Engine.GetObjectiveEntity( f11_local0, f11_local1 ) and not f11_local2 then
		f11_arg0:setupWaypointContainer( f11_local1, 0, 0, f11_arg0.zOffset )
		if f11_arg0.pinging == true then
			f11_arg0:clearEntityMidpoint( false )

			f11_arg0:completeAnimation()
			f11_arg0:setAlpha( 1 )
		end
	else
		local f11_local3, f11_local4, f11_local5 = Engine.GetObjectivePosition( f11_local0, f11_local1 )
		f11_arg0:setupWaypointContainer( f11_local1, f11_local3, f11_local4, f11_local5 + f11_arg0.zOffset )
		if f11_local2 then
			f11_arg0:clearEntityMidpoint( true )
			f11_arg0:setAlpha( f0_local0 )
			f11_arg0:beginAnimation( "ping", Engine.GetGametypeSetting( "objectivePingTime" ) * 1000 )
			f11_arg0:setAlpha( f0_local1 )
			f11_arg0.pinging = true
		elseif f11_arg0.pinging == true then
			f11_arg0:clearEntityMidpoint( false )

			f11_arg0:completeAnimation()
			f11_arg0:setAlpha( 1 )
		end
	end
	local f11_local3
	if not f11_arg0.objective.scale3d or f11_arg0.objective.scale3d == 0 then
		f11_local3 = false
	else
		f11_local3 = true
	end
	f11_arg0:setEntityContainerScale( f11_local3 )
	if f11_arg0.objective.show3dDirectionArrow and f11_arg0.objective.show3dDirectionArrow ~= 0 then
		f11_arg0.WaypointArrowContainer:setup3dPointer( f11_local1 )
	end
	local f11_local5 = Engine.GetTeamID( f11_local0, Engine.GetPredictedClientNum( f11_local0 ) )
	local f11_local6 = Engine.ObjectiveIsTeamUsing( f11_local0, f11_local1, f11_local5 )
	local f11_local7 = Engine.ObjectiveIsAnyOtherTeamUsing( f11_local0, f11_local1, f11_local5 )
	f11_arg0:updatePlayerUsing( f11_arg1, f11_local6, f11_local7 )
	f11_arg0:updateProgress( f11_local0, f11_local6, f11_local7 )
end

local f0_local13 = function ( f12_arg0, f12_arg1 )
	f12_arg0.ping = f12_arg1
end

local f0_local14 = function ( f13_arg0, f13_arg1 )
	if f13_arg0.animationState == f13_arg1 then
		return 
	elseif f13_arg1 == "waypoint_line_of_sight" then
		f13_arg0:setAlpha( 1 )
		f13_arg0.WaypointArrowContainer.WaypointArrowWidget:setState( "SolidArrowState" )
		local f13_local0 = f13_arg0.WaypointText
		local f13_local1 = f13_local0
		f13_local0 = f13_local0.setAlpha
		local f13_local2
		if f13_arg0.snapped or not f13_arg0.isClamped then
			f13_local2 = 1
			if not f13_local2 then
			
			else
				f13_local0( f13_local1, f13_local2 )
			end
		end
		f13_local2 = 0
	elseif f13_arg1 == "waypoint_out_of_line_of_sight" then
		f13_arg0:setAlpha( 1 )
		f13_arg0.WaypointArrowContainer.WaypointArrowWidget:setState( "DefaultState" )
		local f13_local0 = f13_arg0.WaypointText
		local f13_local1 = f13_local0
		f13_local0 = f13_local0.setAlpha
		local f13_local2
		if f13_arg0.snapped or not f13_arg0.isClamped then
			f13_local2 = 1
			if not f13_local2 then
			
			else
				f13_local0( f13_local1, f13_local2 )
			end
		end
		f13_local2 = 0
	elseif f13_arg1 == "waypoint_distance_culled" then
		f13_arg0:setAlpha( 0 )
	end
end

local PostLoadFunc = function ( f14_arg0, f14_arg1 )
	f14_arg0.setupWaypoint = f0_local2
	f14_arg0.setPing = f0_local13
	f14_arg0.update = f0_local12
	f14_arg0.updateProgress = f0_local10
	f14_arg0.updatePlayerUsing = f0_local11
	f14_arg0.isOwnedByMyTeam = f0_local3
	f14_arg0.getTeam = f0_local4
	f14_arg0.SetWaypointState = f0_local14
	f14_arg0.setCompassObjectiveIcon = f0_local8
	f14_arg0.clearCompassObjectiveIcon = f0_local9
	f14_arg0:registerEventHandler( "entity_container_clamped", f0_local6 )
	f14_arg0:registerEventHandler( "entity_container_unclamped", f0_local7 )
	f14_arg0.mapIconType = CoD.GametypeBase.mapIconType
	f14_arg0.neutralTeamID = 8
end

CoD.Waypoint = InheritFrom( LUI.UIElement )
CoD.Waypoint.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Waypoint )
	self.id = "Waypoint"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 80 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local ProgressMeterFrame = LUI.UIImage.new()
	ProgressMeterFrame:setLeftRight( false, false, -35, 36.5 )
	ProgressMeterFrame:setTopBottom( false, false, -35, 34.5 )
	ProgressMeterFrame:setImage( RegisterImage( "uie_t7_hud_waypoints_new_framefill" ) )
	self:addElement( ProgressMeterFrame )
	self.ProgressMeterFrame = ProgressMeterFrame
	
	local WaypointArrowContainer = CoD.WaypointArrowContainer.new( menu, controller )
	WaypointArrowContainer:setLeftRight( false, false, -14, 14 )
	WaypointArrowContainer:setTopBottom( false, false, -17, 14 )
	WaypointArrowContainer:setAlpha( 0.95 )
	self:addElement( WaypointArrowContainer )
	self.WaypointArrowContainer = WaypointArrowContainer
	
	local progressMeter = LUI.UIImage.new()
	progressMeter:setLeftRight( false, false, -23, 24 )
	progressMeter:setTopBottom( false, false, -24, 23 )
	progressMeter:setAlpha( 0.9 )
	progressMeter:setImage( RegisterImage( "uie_t7_hud_interact_meter_diamond" ) )
	progressMeter:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	progressMeter:setShaderVector( 0, 1.03, 0, 0, 0 )
	progressMeter:setShaderVector( 1, 0.5, 0, 0, 0 )
	progressMeter:setShaderVector( 2, 0.5, 0, 0, 0 )
	progressMeter:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( progressMeter )
	self.progressMeter = progressMeter
	
	local WaypointDistanceIndicatorContainer = CoD.WaypointDistanceIndicatorContainer.new( menu, controller )
	WaypointDistanceIndicatorContainer:setLeftRight( true, true, 0, 0 )
	WaypointDistanceIndicatorContainer:setTopBottom( false, false, -62, -45 )
	self:addElement( WaypointDistanceIndicatorContainer )
	self.WaypointDistanceIndicatorContainer = WaypointDistanceIndicatorContainer
	
	local WaypointText = CoD.Waypoint_TextBG.new( menu, controller )
	WaypointText:setLeftRight( false, false, -40, 40 )
	WaypointText:setTopBottom( false, false, -45, -24 )
	self:addElement( WaypointText )
	self.WaypointText = WaypointText
	
	local WaypointCenter = CoD.WaypointCenter.new( menu, controller )
	WaypointCenter:setLeftRight( false, false, -16.5, 17.5 )
	WaypointCenter:setTopBottom( false, false, -17.5, 16.5 )
	WaypointCenter:setAlpha( 0.95 )
	self:addElement( WaypointCenter )
	self.WaypointCenter = WaypointCenter
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		NoIcon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				WaypointText:completeAnimation()
				self.WaypointText:setLeftRight( false, false, -40, 40 )
				self.WaypointText:setTopBottom( false, false, -9, 12 )
				self.clipFinished( WaypointText, {} )

				WaypointCenter:completeAnimation()
				self.WaypointCenter:setAlpha( 0 )
				self.clipFinished( WaypointCenter, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.WaypointArrowContainer:close()
		element.WaypointDistanceIndicatorContainer:close()
		element.WaypointText:close()
		element.WaypointCenter:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
