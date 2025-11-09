require( "ui.uieditor.widgets.MPHudWidgets.WaypointArrowContainer" )
require( "ui.uieditor.widgets.MPHudWidgets.WaypointDistanceIndicatorContainer" )
require( "ui.uieditor.widgets.MPHudWidgets.Waypoint_TextBG" )
require( "ui.uieditor.widgets.MPHudWidgets.WaypointCenter" )

local SetupWaypoint = function ( self, event )
	if event.objId then
		self:setLeftRight( false, false, 0, 0 )
		self:setTopBottom( false, false, 0, 0 )

		self.objId = event.objId

		self.waypoint_label_default = self.objective.waypoint_text

		if self.waypoint_label_default == nil then
			self.waypoint_label_default = ""
		end

		if self.objective.waypoint_fade_when_targeted ~= "enable" and self.objective.waypoint_fade_when_targeted ~= true then
			self.waypoint_fade_when_targeted = false
		else
			self.waypoint_fade_when_targeted = true
		end

		if self.objective.waypoint_clamp ~= "enable" and self.objective.waypoint_clamp ~= true then
			self.waypoint_container_clamp = false
		else
			self.waypoint_container_clamp = true
		end

		if self.objective.show_distance ~= "enable" and self.objective.show_distance ~= true then
			self.show_distance = false
		else
			self.show_distance = true
		end

		if self.objective.hide_arrow ~= "enable" and self.objective.hide_arrow ~= true then
			self.hide_arrow = false
		else
			self.hide_arrow = true
		end

		self.waypoint_image_default = nil

		if self.objective.waypoint_image ~= nil then
			self.waypoint_image_default = self.objective.waypoint_image
		end

		self:setupWaypointContainer( self.objId )

		if self.waypoint_container_clamp then
			self:setEntityContainerClamp( true )
		end

		if self.waypoint_fade_when_targeted then
			self:setEntityContainerFadeWhenTargeted( true )
		end

		if self.objective.waypoint_fade_when_in_combat then
			self:setEntityContainerFadeWhenInCombat( true )
		end

		if not self.isClamped then
			self.WaypointDistanceIndicatorContainer:setAlpha( 1 )
		end

		local objectiveEntity = Engine.GetObjectiveEntity( event.controller, event.objId )

		self.WaypointDistanceIndicatorContainer.DistanceIndicator:setupDistanceIndicator( objectiveEntity or event.objId, objectiveEntity == nil, self.show_distance )

		if CoD.isCampaign and self.objective.waypoint_show_distance_when_far then
			self.WaypointText.text:setupDistanceIndicator( objectiveEntity or event.objId, objectiveEntity == nil, self.show_distance )
		end

		self.snapToCenterWhenContested = true
		self.snapToCenterForObjectiveTeam = true
		self.snapToCenterForOtherTeams = true
		self.updateState = true
		self.zOffset = 0

		if self.objective.waypoint_z_offset ~= nil then
			self.zOffset = self.objective.waypoint_z_offset
		end

		self.pulse = false

		if self.objective.pulse_waypoint ~= nil then
			self.pulse = self.objective.pulse_waypoint == "enable"
		end
	end
end

local GetIsOwnedByMyTeam = function ( self, controller )
	if Engine.GetTeamID( controller, Engine.GetPredictedClientNum( controller ) ) ~= Engine.GetObjectiveTeam( controller, self.objId ) then
		return false
	else
		return true
	end
end

local GetTeam = function ( self, controller )
	return Engine.GetObjectiveTeam( controller, self.objId )
end

local GetPlayerUsing = function ( self, controller, isPlayerTeamUsing, isAnyOtherTeamUsing )
	if Engine.IsPlayerInVehicle( controller ) == true then
		return false

	elseif Engine.IsPlayerRemoteControlling( controller ) == true then
		return false

	elseif Engine.IsPlayerWeaponViewOnlyLinked( controller ) == true then
		return false
	end

	local myClientNum = Engine.GetPredictedClientNum( controller )

	local beingUsed = isAnyOtherTeamUsing and isPlayerTeamUsing and self.snapToCenterWhenContested

	if self:isOwnedByMyTeam( controller ) then
		if not self.snapToCenterForObjectiveTeam and not beingUsed then
			return false
		end
	elseif not self.snapToCenterForOtherTeams and not beingUsed then
		return false
	end

	return Engine.ObjectiveIsPlayerUsing( controller, self.objId, myClientNum )
end

local SetClamped = function ( self, event )
	self.isClamped = true
	self.WaypointArrowContainer:setupEdgePointer( 90 )
	self.WaypointArrowContainer.WaypointArrowWidget:setState( "DefaultState" )
	self.WaypointText:setAlpha( self.snapped and 1 or 0 )
	self.WaypointDistanceIndicatorContainer:setAlpha( 0 )
end

local SetUnclamped = function ( self, event )
	self.isClamped = false
	self.WaypointArrowContainer:setupUIElement()
	self.WaypointArrowContainer:setZRot( 0 )
	self.WaypointArrowContainer.WaypointArrowWidget:setState( "DefaultState" )
	self.WaypointText:setAlpha( 1 )
	self.WaypointDistanceIndicatorContainer:setAlpha( 1 )
end

local SetCompassObjectiveIcon = function ( self, controller, index, mapMaterialName, color )
	if mapMaterialName then
		if color then
			Engine.SetObjectiveIcon( controller, index, self.mapIconType, mapMaterialName, color.r, color.g, color.b )
			Engine.SetObjectiveIcon( controller, index, CoD.GametypeBase.shoutcasterMapIconType, mapMaterialName, color.r, color.g, color.b )
		else
			Engine.SetObjectiveIcon( controller, index, self.mapIconType, mapMaterialName )
			Engine.SetObjectiveIcon( controller, index, CoD.GametypeBase.shoutcasterMapIconType, mapMaterialName )
		end

		Engine.SetObjectiveIconPulse( controller, index, self.mapIconType, self.pulse )
	else
		Engine.ClearObjectiveIcon( controller, index, self.mapIconType )
		Engine.ClearObjectiveIcon( controller, index, CoD.GametypeBase.shoutcasterMapIconType )
		Engine.SetObjectiveIconPulse( controller, index, self.mapIconType, false )
	end
end

local ClearCompassObjectiveIcon = function ( self, controller, index )
	Engine.ClearObjectiveIcon( controller, index, self.mapIconType )
	Engine.ClearObjectiveIcon( controller, index, CoD.GametypeBase.shoutcasterMapIconType )
end

local UpdateObjectiveProgress = function ( self, controller, isPlayerTeamUsing, isAnyOtherTeamUsing )
	local progress = Engine.GetObjectiveProgress( controller, self.objId )

	local playerUsing = GetPlayerUsing( self, controller, isPlayerTeamUsing, isAnyOtherTeamUsing )

	local beingUsed = isAnyOtherTeamUsing and isPlayerTeamUsing and not self.never_contested

	local count = Engine.ObjectiveGetTeamUsingCount( controller, self.objId )

	if not playerUsing and progress > 0 then
		self.ProgressMeterFrame:setAlpha( 0 )
		self.progressMeter:setRGB( 1, 1, 1 )
		self.progressMeter:setShaderVector( 0, -0.05, 0, 0, 0 )

		if self.updateState then
			if count == 1 and self.pulse == true then
				self.WaypointCenter:setState( "Pulsing" )
			else
				self.WaypointCenter:setState( "DefaultState" )
			end
		end
	else
		if self.updateState then
			self.WaypointCenter:setState( "DefaultState" )
		end

		if beingUsed == true and playerUsing then
			self.ProgressMeterFrame:setAlpha( 1 )
			self.progressMeter:setRGB( 1, 0.4, 0 )
			self.progressMeter:setShaderVector( 0, 1, 0, 0, 0 )
		else
			if progress <= 0 then
				progress = -0.05
				self.ProgressMeterFrame:setAlpha( 0 )
			else
				self.ProgressMeterFrame:setAlpha( 1 )
			end
			
			self.progressMeter:setRGB( 1, 1, 1 )
			self.progressMeter:setShaderVector( 0, progress, 0, 0, 0 )
		end
	end
end

local UpdatePlayerUsing = function ( self, event, isPlayerTeamUsing, isAnyOtherTeamUsing )
	local playerUsing = GetPlayerUsing( self, event.controller, isPlayerTeamUsing, isAnyOtherTeamUsing )

	CoD.ObjectiveWaypoint.largeIconWidth = 64
	CoD.ObjectiveWaypoint.largeIconHeight = 64
	CoD.ObjectiveWaypoint.progressWidth = CoD.ObjectiveWaypoint.largeIconWidth + 4
	CoD.ObjectiveWaypoint.progressHeight = CoD.ObjectiveWaypoint.largeIconHeight + 4
	CoD.ObjectiveWaypoint.progressHeightNudge = 0
	CoD.ObjectiveWaypoint.snapToHeight = 112
	CoD.ObjectiveWaypoint.snapToTime = 250

	if self.playerUsing == playerUsing then
		return

	elseif playerUsing == true then
		if self.playerUsing ~= nil then
			self:beginAnimation( "snap_in", 250, true, true )
		end

		self.snapped = true
		self.WaypointText:setAlpha( 1 )
		self:setEntityContainerStopUpdating( true )
		self:setLeftRight( false, false, -32, 32 )
		self:setTopBottom( false, false, -176, -112 )
		self.WaypointArrowContainer:setAlpha( 0 )
	else
		if self.playerUsing ~= nil then
			self:beginAnimation( "snap_out", 250, true, true )
		end

		self.snapped = false
		self:setEntityContainerStopUpdating( false )
		self:setLeftRight( false, false, -28, 28 )
		self:setTopBottom( false, true, -56, 0 )
		self.WaypointArrowContainer:setAlpha( 1 )
	end

	self.playerUsing = playerUsing
end

local UpdateObjective = function ( self, event )
	if Engine.GetObjectiveEntity( event.controller, self.objId ) and not self.ping then
		self:setupWaypointContainer( self.objId, 0, 0, self.zOffset )

		if self.pinging == true then
			self:clearEntityMidpoint( false )
			self:completeAnimation()
			self:setAlpha( 1 )
		end
	else
		local posX, posY, posZ = Engine.GetObjectivePosition( event.controller, self.objId )

		self:setupWaypointContainer( self.objId, posX, posY, posZ + self.zOffset )

		if self.ping then
			self:clearEntityMidpoint( true )
			self:setAlpha( 0.8 )
			self:beginAnimation( "ping", Engine.GetGametypeSetting( "objectivePingTime" ) * 1000 )
			self:setAlpha( 0.3 )
			self.pinging = true

		elseif self.pinging == true then
			self:clearEntityMidpoint( false )
			self:completeAnimation()
			self:setAlpha( 1 )
		end
	end

	self:setEntityContainerScale( self.objective.scale3d and self.objective.scale3d ~= 0 or false )

	if self.objective.show3dDirectionArrow and self.objective.show3dDirectionArrow ~= 0 then
		self.WaypointArrowContainer:setup3dPointer( self.objId )
	end

	local playerTeam = Engine.GetTeamID( event.controller, Engine.GetPredictedClientNum( event.controller ) )
	local isPlayerTeamUsing = Engine.ObjectiveIsTeamUsing( event.controller, self.objId, playerTeam )
	local isAnyOtherTeamUsing = Engine.ObjectiveIsAnyOtherTeamUsing( event.controller, self.objId, playerTeam )

	self:updatePlayerUsing( event, isPlayerTeamUsing, isAnyOtherTeamUsing )
	self:updateProgress( event.controller, isPlayerTeamUsing, isAnyOtherTeamUsing )
end

local SetPing = function ( self, ping )
	self.ping = ping
end

local SetWaypointState = function ( self, animationState )
	if self.animationState == animationState then
		return

	elseif animationState == "waypoint_line_of_sight" then
		self:setAlpha( 1 )

		self.WaypointArrowContainer.WaypointArrowWidget:setState( "SolidArrowState" )

		if self.snapped or not self.isClamped then
			self.WaypointText.setAlpha( self.WaypointText, 1 )
		end

	elseif animationState == "waypoint_out_of_line_of_sight" then
		self:setAlpha( 1 )

		self.WaypointArrowContainer.WaypointArrowWidget:setState( "DefaultState" )

		if self.snapped or not self.isClamped then
			self.WaypointText.setAlpha( self.WaypointText, 1 )
		end

	elseif animationState == "waypoint_distance_culled" then
		self:setAlpha( 0 )
	end
end

local PostLoadFunc = function ( self, controller )
	self.setupWaypoint = SetupWaypoint
	self.setPing = SetPing
	self.update = UpdateObjective
	self.updateProgress = UpdateObjectiveProgress
	self.updatePlayerUsing = UpdatePlayerUsing
	self.isOwnedByMyTeam = GetIsOwnedByMyTeam
	self.getTeam = GetTeam
	self.SetWaypointState = SetWaypointState
	self.setCompassObjectiveIcon = SetCompassObjectiveIcon
	self.clearCompassObjectiveIcon = ClearCompassObjectiveIcon
	self:registerEventHandler( "entity_container_clamped", SetClamped )
	self:registerEventHandler( "entity_container_unclamped", SetUnclamped )
	self.mapIconType = CoD.GametypeBase.mapIconType
	self.neutralTeamID = 8
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
	
	self.ProgressMeterFrame = LUI.UIImage.new()
	self.ProgressMeterFrame:setLeftRight( false, false, -35, 36.5 )
	self.ProgressMeterFrame:setTopBottom( false, false, -35, 34.5 )
	self.ProgressMeterFrame:setImage( RegisterImage( "uie_t7_hud_waypoints_new_framefill" ) )
	self:addElement( self.ProgressMeterFrame )
	
	self.WaypointArrowContainer = CoD.WaypointArrowContainer.new( menu, controller )
	self.WaypointArrowContainer:setLeftRight( false, false, -14, 14 )
	self.WaypointArrowContainer:setTopBottom( false, false, -17, 14 )
	self.WaypointArrowContainer:setAlpha( 0.95 )
	self:addElement( self.WaypointArrowContainer )
	
	self.progressMeter = LUI.UIImage.new()
	self.progressMeter:setLeftRight( false, false, -23, 24 )
	self.progressMeter:setTopBottom( false, false, -24, 23 )
	self.progressMeter:setAlpha( 0.9 )
	self.progressMeter:setImage( RegisterImage( "uie_t7_hud_interact_meter_diamond" ) )
	self.progressMeter:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	self.progressMeter:setShaderVector( 0, 1.03, 0, 0, 0 )
	self.progressMeter:setShaderVector( 1, 0.5, 0, 0, 0 )
	self.progressMeter:setShaderVector( 2, 0.5, 0, 0, 0 )
	self.progressMeter:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( self.progressMeter )
	
	self.WaypointDistanceIndicatorContainer = CoD.WaypointDistanceIndicatorContainer.new( menu, controller )
	self.WaypointDistanceIndicatorContainer:setLeftRight( true, true, 0, 0 )
	self.WaypointDistanceIndicatorContainer:setTopBottom( false, false, -62, -45 )
	self:addElement( self.WaypointDistanceIndicatorContainer )
	
	self.WaypointText = CoD.Waypoint_TextBG.new( menu, controller )
	self.WaypointText:setLeftRight( false, false, -40, 40 )
	self.WaypointText:setTopBottom( false, false, -45, -24 )
	self:addElement( self.WaypointText )
	
	self.WaypointCenter = CoD.WaypointCenter.new( menu, controller )
	self.WaypointCenter:setLeftRight( false, false, -16.5, 17.5 )
	self.WaypointCenter:setTopBottom( false, false, -17.5, 16.5 )
	self.WaypointCenter:setAlpha( 0.95 )
	self:addElement( self.WaypointCenter )
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		NoIcon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				self.WaypointText:completeAnimation()
				self.WaypointText:setLeftRight( false, false, -40, 40 )
				self.WaypointText:setTopBottom( false, false, -9, 12 )
				self.clipFinished( self.WaypointText, {} )

				self.WaypointCenter:completeAnimation()
				self.WaypointCenter:setAlpha( 0 )
				self.clipFinished( self.WaypointCenter, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ProgressMeterFrame:close()
		element.WaypointArrowContainer:close()
		element.progressMeter:close()
		element.WaypointDistanceIndicatorContainer:close()
		element.WaypointText:close()
		element.WaypointCenter:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
