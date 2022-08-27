-- 1850db56907fb1041a1c43fc4c70453c
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.MPHudWidgets.WaypointArrowContainer" )
require( "ui.uieditor.widgets.MPHudWidgets.WaypointDistanceIndicatorContainer" )
require( "ui.uieditor.widgets.MPHudWidgets.Waypoint_TextBG" )
require( "ui.uieditor.widgets.MPHudWidgets.WaypointCenter" )
require( "ui.uieditor.widgets.ZMInventoryTomb.CaptureZoneNumberContainer" )

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
		if f1_arg0.waypoint_fade_when_targeted then
			f1_arg0:setEntityContainerFadeWhenTargeted( true )
		end
		if f1_arg0.waypoint_container_clamp then
			f1_arg0:setEntityContainerClamp( true )
		end
		if not f1_arg0.isClamped then
			f1_arg0.WaypointDistanceIndicatorContainer:setAlpha( 1 )
		end
		f1_local2 = Engine.GetObjectiveEntity( f1_arg1.controller, f1_arg1.objId )
		f1_arg0.WaypointDistanceIndicatorContainer.DistanceIndicator:setupDistanceIndicator( f1_local2 or f1_arg1.objId, f1_local2 == nil, f1_arg0.show_distance )
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
		f1_arg0.progressMeter:setImage( RegisterMaterial( "hud_objective_circle_meter" ) )
		if f1_arg0.objId == 0 or f1_arg0.objId == 2 then
			f1_arg0:setState( "DefaultState" )
			f1_arg0.CaptureZoneNumberContainer:setState( "DefaultState" )
			f1_arg0:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f1_arg1.controller ), "zmInventory.zc_change_progress_bar_color" ), function ( model )
				local modelValue = Engine.GetModelValue( model )
				if modelValue == 0 then
					f1_arg0:setState( "NotCapturing" )
				elseif modelValue == 1 then
					f1_arg0:setState( "DefaultState" )
				end
			end )
		else
			f1_arg0:setState( "NotCapturing" )
			f1_arg0.CaptureZoneNumberContainer:setState( "NotCapturing" )
		end
		local f1_local3 = tonumber( string.sub( f1_local0, string.len( f1_local0 ) ) )
		if f1_local3 and f1_local3 > 0 then
			f1_arg0.CaptureZoneNumberContainer.Number:setImage( RegisterImage( "t7_zm_hd_num_" .. f1_local3 .. "_glow" ) )
			f1_arg0.CaptureZoneNumberContainer.NumberShadow:setImage( RegisterImage( "t7_zm_hd_num_" .. f1_local3 .. "_shadow" ) )
		end
	end
end

local f0_local3 = function ( f3_arg0, f3_arg1 )
	if Engine.GetTeamID( f3_arg1, Engine.GetPredictedClientNum( f3_arg1 ) ) ~= Engine.GetObjectiveTeam( f3_arg1, f3_arg0.objId ) then
		return false
	else
		return true
	end
end

local f0_local4 = function ( f4_arg0, f4_arg1 )
	return Engine.GetObjectiveTeam( f4_arg1, f4_arg0.objId )
end

local f0_local5 = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
	if Engine.IsPlayerInVehicle( f5_arg1 ) == true then
		return false
	elseif Engine.IsPlayerRemoteControlling( f5_arg1 ) == true then
		return false
	elseif Engine.IsPlayerWeaponViewOnlyLinked( f5_arg1 ) == true then
		return false
	else
		return Engine.ObjectiveIsPlayerUsing( f5_arg1, f5_arg0.objId, Engine.GetPredictedClientNum( f5_arg1 ) )
	end
end

local f0_local6 = function ( f6_arg0, f6_arg1 )
	f6_arg0.isClamped = true
	f6_arg0.WaypointArrowContainer:setupEdgePointer( 90 )
	f6_arg0.WaypointArrowContainer.WaypointArrowWidget:setState( "DefaultState" )
	f6_arg0.WaypointText:setAlpha( f6_arg0.snapped and 1 or 0 )
	f6_arg0.WaypointDistanceIndicatorContainer:setAlpha( 0 )
end

local f0_local7 = function ( f7_arg0, f7_arg1 )
	f7_arg0.isClamped = false
	f7_arg0.WaypointArrowContainer:setupUIElement()
	f7_arg0.WaypointArrowContainer:setZRot( 0 )
	f7_arg0.WaypointArrowContainer.WaypointArrowWidget:setState( "DefaultState" )
	f7_arg0.WaypointText:setAlpha( 1 )
	f7_arg0.WaypointDistanceIndicatorContainer:setAlpha( 1 )
end

local f0_local8 = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4 )
	if f8_arg3 then
		if f8_arg4 then
			Engine.SetObjectiveIcon( f8_arg1, f8_arg2, f8_arg0.mapIconType, f8_arg3, f8_arg4.r, f8_arg4.g, f8_arg4.b )
			Engine.SetObjectiveIcon( f8_arg1, f8_arg2, CoD.GametypeBase.shoutcasterMapIconType, f8_arg3, f8_arg4.r, f8_arg4.g, f8_arg4.b )
		else
			Engine.SetObjectiveIcon( f8_arg1, f8_arg2, f8_arg0.mapIconType, f8_arg3 )
			Engine.SetObjectiveIcon( f8_arg1, f8_arg2, CoD.GametypeBase.shoutcasterMapIconType, f8_arg3 )
		end
		Engine.SetObjectiveIconPulse( f8_arg1, f8_arg2, f8_arg0.mapIconType, f8_arg0.pulse )
	else
		Engine.ClearObjectiveIcon( f8_arg1, f8_arg2, f8_arg0.mapIconType )
		Engine.ClearObjectiveIcon( f8_arg1, f8_arg2, CoD.GametypeBase.shoutcasterMapIconType )
		Engine.SetObjectiveIconPulse( f8_arg1, f8_arg2, f8_arg0.mapIconType, false )
	end
end

local f0_local9 = function ( f9_arg0, f9_arg1, f9_arg2 )
	Engine.ClearObjectiveIcon( f9_arg1, f9_arg2, f9_arg0.mapIconType )
	Engine.ClearObjectiveIcon( f9_arg1, f9_arg2, CoD.GametypeBase.shoutcasterMapIconType )
end

local f0_local10 = function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
	f10_arg0.progressMeter:setShaderVector( 0, Engine.GetObjectiveProgress( f10_arg1, f10_arg0.objId ), 0, 0, 0 )
end

local f0_local11 = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
	local f11_local0 = f0_local5( f11_arg0, f11_arg1.controller, f11_arg2, f11_arg3 )
	if f11_arg0.playerUsing == f11_local0 then
		return 
	elseif f11_local0 == true then
		if f11_arg0.playerUsing ~= nil then
			f11_arg0:beginAnimation( "snap_in", 250, true, true )
		end
		f11_arg0.snapped = true
		f11_arg0.WaypointText:setAlpha( 1 )
		f11_arg0:setEntityContainerStopUpdating( true )
		f11_arg0:setLeftRight( false, false, -75, 75 )
		f11_arg0:setTopBottom( false, false, 99, 249 )
		f11_arg0.WaypointArrowContainer:setAlpha( 0 )
	else
		if f11_arg0.playerUsing ~= nil then
			f11_arg0:beginAnimation( "snap_out", 250, true, true )
		end
		f11_arg0.snapped = false
		f11_arg0:setEntityContainerStopUpdating( false )
		f11_arg0:setLeftRight( false, false, -32, 32 )
		f11_arg0:setTopBottom( false, false, -32, 32 )
		f11_arg0.WaypointArrowContainer:setAlpha( 1 )
	end
	f11_arg0.playerUsing = f11_local0
end

local f0_local12 = function ( f12_arg0, f12_arg1 )
	local f12_local0 = f12_arg1.controller
	local f12_local1 = f12_arg0.objId
	if Engine.GetObjectiveEntity( f12_local0, f12_local1 ) and not ping then
		f12_arg0:setupWaypointContainer( f12_local1, 0, 0, f12_arg0.zOffset )
	else
		local f12_local2, f12_local3, f12_local4 = Engine.GetObjectivePosition( f12_local0, f12_local1 )
		f12_arg0:setupWaypointContainer( f12_local1, f12_local2, f12_local3, f12_local4 + f12_arg0.zOffset )
	end
	local f12_local2
	if not f12_arg0.objective.scale3d or f12_arg0.objective.scale3d == 0 then
		f12_local2 = false
	else
		f12_local2 = true
	end
	f12_arg0:setEntityContainerScale( f12_local2 )
	if f12_arg0.objective.show3dDirectionArrow and f12_arg0.objective.show3dDirectionArrow ~= 0 then
		f12_arg0.WaypointArrowContainer:setup3dPointer( f12_local1 )
	end
	local f12_local4 = Engine.GetTeamID( f12_local0, Engine.GetPredictedClientNum( f12_local0 ) )
	local f12_local5 = Engine.ObjectiveIsTeamUsing( f12_local0, f12_local1, f12_local4 )
	local f12_local6 = Engine.ObjectiveIsAnyOtherTeamUsing( f12_local0, f12_local1, f12_local4 )
	f12_arg0:updatePlayerUsing( f12_arg1, f12_local5, f12_local6 )
	f12_arg0:updateProgress( f12_local0, f12_local5, f12_local6 )
end

local f0_local13 = function ( f13_arg0, f13_arg1 )
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
	f14_arg0.update = f0_local12
	f14_arg0.updateProgress = f0_local10
	f14_arg0.updatePlayerUsing = f0_local11
	f14_arg0.SetWaypointState = f0_local13
end

CoD.ZMTombCaptureZoneWaypoint = InheritFrom( LUI.UIElement )
CoD.ZMTombCaptureZoneWaypoint.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ZMTombCaptureZoneWaypoint )
	self.id = "ZMTombCaptureZoneWaypoint"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 256 )
	self:setTopBottom( true, false, 0, 256 )
	self.anyChildUsesUpdateState = true
	
	local bgGlow = LUI.UIImage.new()
	bgGlow:setLeftRight( true, true, -0.25, 0 )
	bgGlow:setTopBottom( true, true, 0, 0.25 )
	bgGlow:setImage( RegisterImage( "uie_t7_zm_hd_templar_capture_spin_glow" ) )
	self:addElement( bgGlow )
	self.bgGlow = bgGlow
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, true, -0.25, 0 )
	bg:setTopBottom( true, true, 0, 0.25 )
	bg:setImage( RegisterImage( "uie_t7_zm_hd_templar_capture_spin" ) )
	self:addElement( bg )
	self.bg = bg
	
	local WaypointArrowContainer = CoD.WaypointArrowContainer.new( menu, controller )
	WaypointArrowContainer:setLeftRight( false, false, -128, 128 )
	WaypointArrowContainer:setTopBottom( false, false, -118, 138 )
	WaypointArrowContainer:setAlpha( 0.95 )
	WaypointArrowContainer.WaypointArrowWidget.outlineArrow:setImage( RegisterImage( "uie_t7_zm_hd_tomb_arrow" ) )
	WaypointArrowContainer.WaypointArrowWidget.solidArrow:setImage( RegisterImage( "uie_t7_zm_hd_tomb_arrow" ) )
	self:addElement( WaypointArrowContainer )
	self.WaypointArrowContainer = WaypointArrowContainer
	
	local progressMeter = LUI.UIImage.new()
	progressMeter:setLeftRight( true, true, 0, 0 )
	progressMeter:setTopBottom( true, true, 0, 0 )
	progressMeter:setAlpha( 0.9 )
	progressMeter:setScale( 0.46 )
	progressMeter:setImage( RegisterImage( "uie_t7_hud_interact_meter_diamond" ) )
	progressMeter:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	progressMeter:setShaderVector( 0, 1.03, 0, 0, 0 )
	progressMeter:setShaderVector( 1, 0.5, 0, 0, 0 )
	progressMeter:setShaderVector( 2, 0.5, 0, 0, 0 )
	progressMeter:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( progressMeter )
	self.progressMeter = progressMeter
	
	local WaypointDistanceIndicatorContainer = CoD.WaypointDistanceIndicatorContainer.new( menu, controller )
	WaypointDistanceIndicatorContainer:setLeftRight( true, true, -1, -1 )
	WaypointDistanceIndicatorContainer:setTopBottom( false, false, -62, -45 )
	self:addElement( WaypointDistanceIndicatorContainer )
	self.WaypointDistanceIndicatorContainer = WaypointDistanceIndicatorContainer
	
	local WaypointText = CoD.Waypoint_TextBG.new( menu, controller )
	WaypointText:setLeftRight( false, false, -41, 39 )
	WaypointText:setTopBottom( false, false, -45, -24 )
	self:addElement( WaypointText )
	self.WaypointText = WaypointText
	
	local WaypointCenter = CoD.WaypointCenter.new( menu, controller )
	WaypointCenter:setLeftRight( false, false, -17.5, 16.5 )
	WaypointCenter:setTopBottom( false, false, -17.5, 16.5 )
	WaypointCenter:setAlpha( 0.95 )
	self:addElement( WaypointCenter )
	self.WaypointCenter = WaypointCenter
	
	local CaptureZoneNumberContainer = CoD.CaptureZoneNumberContainer.new( menu, controller )
	CaptureZoneNumberContainer:setLeftRight( true, true, 0, 0 )
	CaptureZoneNumberContainer:setTopBottom( true, true, 0, 0 )
	self:addElement( CaptureZoneNumberContainer )
	self.CaptureZoneNumberContainer = CaptureZoneNumberContainer
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local bgGlowFrame2 = function ( bgGlow, event )
					local bgGlowFrame3 = function ( bgGlow, event )
						if not event.interrupted then
							bgGlow:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
						end
						bgGlow:setRGB( 0.68, 0.86, 1 )
						bgGlow:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( bgGlow, event )
						else
							bgGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						bgGlowFrame3( bgGlow, event )
						return 
					else
						bgGlow:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
						bgGlow:setAlpha( 0.35 )
						bgGlow:registerEventHandler( "transition_complete_keyframe", bgGlowFrame3 )
					end
				end
				
				bgGlow:completeAnimation()
				self.bgGlow:setRGB( 0.68, 0.86, 1 )
				self.bgGlow:setAlpha( 1 )
				bgGlowFrame2( bgGlow, {} )
				progressMeter:completeAnimation()
				self.progressMeter:setRGB( 0.68, 0.86, 1 )
				self.clipFinished( progressMeter, {} )
				self.nextClip = "DefaultClip"
			end
		},
		NotCapturing = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local bgGlowFrame2 = function ( bgGlow, event )
					local bgGlowFrame3 = function ( bgGlow, event )
						if not event.interrupted then
							bgGlow:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
						end
						bgGlow:setRGB( 1, 0.19, 0.19 )
						bgGlow:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( bgGlow, event )
						else
							bgGlow:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						bgGlowFrame3( bgGlow, event )
						return 
					else
						bgGlow:beginAnimation( "keyframe", 699, false, false, CoD.TweenType.Linear )
						bgGlow:setAlpha( 0.35 )
						bgGlow:registerEventHandler( "transition_complete_keyframe", bgGlowFrame3 )
					end
				end
				
				bgGlow:completeAnimation()
				self.bgGlow:setRGB( 1, 0.19, 0.19 )
				self.bgGlow:setAlpha( 1 )
				bgGlowFrame2( bgGlow, {} )
				progressMeter:completeAnimation()
				self.progressMeter:setRGB( 1, 0.19, 0.19 )
				self.clipFinished( progressMeter, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.WaypointArrowContainer:close()
		element.WaypointDistanceIndicatorContainer:close()
		element.WaypointText:close()
		element.WaypointCenter:close()
		element.CaptureZoneNumberContainer:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

