require( "ui.uieditor.widgets.MPHudWidgets.WaypointArrowContainer" )
require( "ui.uieditor.widgets.MPHudWidgets.WaypointCenter" )

local Waypoint_NeutralStateColor = CoD.white
local Waypoint_CaptureStateColor = {
	1,
	0,
	0
}
local Waypoint_DefendStateColor = {
	0,
	1,
	0
}
local Waypoint_CTF_PULSE_BEGIN_ALPHA = 0.8
local Waypoint_CTF_PULSE_END_ALPHA = 0.3
local Waypoint_SetupWaypoint = function ( self, event )
	if event.objId then
		self:setLeftRight( false, false, 0, 0 )
		self:setTopBottom( false, false, 0, 0 )
		self.objId = event.objId
		local objectiveName = self.objective.id
		self.waypoint_label_default = self.objective.waypoint_text
		if self.waypoint_label_default == nil then
			self.waypoint_label_default = ""
		end
		local objective = self.objective
		local f1_local0
		if objective.waypoint_fade_when_targeted ~= "enable" and objective.waypoint_fade_when_targeted ~= true then
			f1_local0 = false
		else
			f1_local0 = true
		end
		self.waypoint_fade_when_targeted = f1_local0
		if objective.waypoint_clamp ~= "enable" and objective.waypoint_clamp ~= true then
			f1_local0 = false
		else
			f1_local0 = true
		end
		self.waypoint_container_clamp = f1_local0
		if objective.show_distance ~= "enable" and objective.show_distance ~= true then
			f1_local0 = false
		else
			f1_local0 = true
		end
		self.show_distance = f1_local0
		if objective.hide_arrow ~= "enable" and objective.hide_arrow ~= true then
			f1_local0 = false
		else
			f1_local0 = true
		end
		self.hide_arrow = f1_local0
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
		if self.show_distance then
			if self.isClamped == nil or self.isClamped == false then
				self.DistanceIndicator:setAlpha( 1 )
			end
			local objectiveEntity = Engine.GetObjectiveEntity( event.controller, event.objId )
			if objectiveEntity then
				self.DistanceIndicator:setupDistanceIndicator( objectiveEntity )
			else
				self.DistanceIndicator:setupDistanceIndicator( event.objId, true )
			end
		end
		self.snapToCenterForObjectiveTeam = true
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

local Waypoint_IsOwnedByMyTeam = function ( self, controller )
	local myClientNum = Engine.GetPredictedClientNum( controller )
	local myTeam = Engine.GetTeamID( controller, myClientNum )
	local objectiveTeam = Engine.GetObjectiveTeam( controller, self.objId )
	if myTeam ~= objectiveTeam then
		return false
	else
		return true
	end
end

local Waypoint_IsPlayerUsing = function ( self, controller, isPlayerTeamUsing, isAnyOtherTeamUsing )
	if Engine.IsPlayerInVehicle( controller ) == true then
		return false
	elseif Engine.IsPlayerRemoteControlling( controller ) == true then
		return false
	elseif Engine.IsPlayerWeaponViewOnlyLinked( controller ) == true then
		return false
	else
		local clientNum = Engine.GetPredictedClientNum( controller )
		local f3_local0 = isPlayerTeamUsing
		local contested = isAnyOtherTeamUsing
		if self.snapToCenterForObjectiveTeam == false and not (f3_local0 and contested) and self:isOwnedByMyTeam( controller ) then
			return false
		else
			return Engine.ObjectiveIsPlayerUsing( controller, self.objId, clientNum )
		end
	end
end

local Waypoint_Clamped = function ( self, event )
	self.isClamped = true
	self.WaypointArrowContainer:setupEdgePointer( 90 )
	self.WaypointArrowContainer.WaypointArrowWidget:setState( "DefaultState" )
	self.waypointType:setAlpha( 0 )
	self.DistanceIndicator:setAlpha( 0 )
end

local Waypoint_Unclamped = function ( self, event )
	self.isClamped = false
	self.WaypointArrowContainer:setupUIElement()
	self.WaypointArrowContainer:setZRot( 0 )
	self.WaypointArrowContainer.WaypointArrowWidget:setState( "DefaultState" )
	self.waypointType:setAlpha( 1 )
	if self.show_distance then
		self.DistanceIndicator:setAlpha( 1 )
	end
end

local Waypoint_SetCompassObjectiveIcon = function ( self, controller, index, mapMaterialName, color )
	if mapMaterialName then
		if color then
			Engine.SetObjectiveIcon( controller, index, self.mapIconType, mapMaterialName, color.r, color.g, color.b )
		else
			Engine.SetObjectiveIcon( controller, index, self.mapIconType, mapMaterialName )
		end
		Engine.SetObjectiveIconPulse( controller, index, self.mapIconType, self.pulse )
	else
		Engine.ClearObjectiveIcon( controller, index, self.mapIconType )
		Engine.SetObjectiveIconPulse( controller, index, self.mapIconType, false )
	end
end

local Waypoint_ClearCompassObjectiveIcon = function ( self, controller, index )
	Engine.ClearObjectiveIcon( controller, index, self.mapIconType )
end

local Waypoint_UpdateProgress = function ( self, controller, isPlayerTeamUsing, isAnyOtherTeamUsing )
	local progress = Engine.GetObjectiveProgress( controller, self.objId )
	local playerUsing = Waypoint_IsPlayerUsing( self, controller, isPlayerTeamUsing, isAnyOtherTeamUsing )
	local f8_local0 = isPlayerTeamUsing
	local contested = isAnyOtherTeamUsing
	local f8_local1 = f8_local0 and contested
	local teamsUsing = Engine.ObjectiveGetTeamUsingCount( controller, self.objId )
	if not playerUsing and progress > 0 then
		self.progressMeter:setRGB( 1, 1, 1 )
		self.progressMeter:setShaderVector( 0, -0.05, 0, 0, 0 )
		if teamsUsing == 1 and self.pulse == true then
			self.WaypointCenter:setState( "Pulsing" )
		else
			self.WaypointCenter:setState( "DefaultState" )
		end
	else
		self.WaypointCenter:setState( "DefaultState" )
		if f8_local1 == true and playerUsing then
			self.progressMeter:setRGB( 1, 0.4, 0 )
			self.progressMeter:setShaderVector( 0, 1, 0, 0, 0 )
		else
			if progress <= 0 then
				progress = -0.05
			end
			self.progressMeter:setRGB( 1, 1, 1 )
			self.progressMeter:setShaderVector( 0, progress, 0, 0, 0 )
		end
	end
end

local Waypoint_UpdatePlayerUsing = function ( self, event, isPlayerTeamUsing, isAnyOtherTeamUsing )
	local controller = event.controller
	local playerUsing = Waypoint_IsPlayerUsing( self, controller, isPlayerTeamUsing, isAnyOtherTeamUsing )
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
		self.waypointType:setAlpha( 1 )
		self:setEntityContainerStopUpdating( true )
		self:setLeftRight( false, false, -32, 32 )
		self:setTopBottom( false, false, -176, -112 )
		self.WaypointArrowContainer:setAlpha( 0 )
	else
		if self.playerUsing ~= nil then
			self:beginAnimation( "snap_out", 250, true, true )
		end
		self:setEntityContainerStopUpdating( false )
		self:setLeftRight( false, false, -28, 28 )
		self:setTopBottom( false, true, -56, 0 )
		self.WaypointArrowContainer:setAlpha( 1 )
	end
	self.playerUsing = playerUsing
end

local Waypoint_Update = function ( self, event )
	local controller = event.controller
	local index = self.objId
	local ping = self.ping
	local objectiveEntity = Engine.GetObjectiveEntity( controller, index )
	if objectiveEntity and not ping then
		self:setupWaypointContainer( index, 0, 0, self.zOffset )
		if self.pinging == true then
			self:clearEntityMidpoint( false )
			self:completeAnimation()
			self:setAlpha( 1 )
		end
	else
		local posX, posY, posZ = Engine.GetObjectivePosition( controller, index )
		self:setupWaypointContainer( index, posX, posY, posZ + self.zOffset )
		if ping then
			self:clearEntityMidpoint( true )
			self:setAlpha( Waypoint_CTF_PULSE_BEGIN_ALPHA )
			local pingDuration = Engine.GetGametypeSetting( "objectivePingTime" ) * 1000
			self:beginAnimation( "ping", pingDuration )
			self:setAlpha( Waypoint_CTF_PULSE_END_ALPHA )
			self.pinging = true
		elseif self.pinging == true then
			self:clearEntityMidpoint( false )
			self:completeAnimation()
			self:setAlpha( 1 )
		end
	end
	if not self.objective.scale3d or self.objective.scale3d == "0" then
		local f10_local0 = false
	else
		local shouldScale = true
	end
	self:setEntityContainerScale( f10_local0 )
	if self.objective.show3dDirectionArrow and self.objective.show3dDirectionArrow ~= "0" then
		self.WaypointArrowContainer:setup3dPointer( index )
	end
	local clientNum = Engine.GetPredictedClientNum( controller )
	local playerTeam = Engine.GetTeamID( controller, clientNum )
	local isPlayerTeamUsing = Engine.ObjectiveIsTeamUsing( controller, index, playerTeam )
	local isAnyOtherTeamUsing = Engine.ObjectiveIsAnyOtherTeamUsing( controller, index, playerTeam )
	self:updatePlayerUsing( event, isPlayerTeamUsing, isAnyOtherTeamUsing )
	self:updateProgress( controller, isPlayerTeamUsing, isAnyOtherTeamUsing )
end

local Waypoint_SetPing = function ( self, ping )
	self.ping = ping
end

local Waypoint_SetState = function ( self, animationState )
	if self.animationState == animationState then
		return 
	elseif animationState == "waypoint_line_of_sight" then
		self:setAlpha( 1 )
		self.WaypointArrowContainer.WaypointArrowWidget:setState( "SolidArrowState" )
		self.waypointType:setAlpha( 1 )
	elseif animationState == "waypoint_out_of_line_of_sight" then
		self:setAlpha( 1 )
		self.WaypointArrowContainer.WaypointArrowWidget:setState( "DefaultState" )
		self.waypointType:setAlpha( 1 )
	elseif animationState == "waypoint_distance_culled" then
		self:setAlpha( 0 )
	end
end

local PostLoadFunc = function ( self, controller )
	self.setupWaypoint = Waypoint_SetupWaypoint
	self.setPing = Waypoint_SetPing
	self.update = Waypoint_Update
	self.updateProgress = Waypoint_UpdateProgress
	self.updatePlayerUsing = Waypoint_UpdatePlayerUsing
	self.isOwnedByMyTeam = Waypoint_IsOwnedByMyTeam
	self.SetWaypointState = Waypoint_SetState
	self.setCompassObjectiveIcon = Waypoint_SetCompassObjectiveIcon
	self.clearCompassObjectiveIcon = Waypoint_ClearCompassObjectiveIcon
	self:registerEventHandler( "entity_container_clamped", Waypoint_Clamped )
	self:registerEventHandler( "entity_container_unclamped", Waypoint_Unclamped )
	self.mapIconType = 0
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
	
	local WaypointArrowContainer = CoD.WaypointArrowContainer.new( menu, controller )
	WaypointArrowContainer:setLeftRight( true, true, 18, -18 )
	WaypointArrowContainer:setTopBottom( true, true, 23, -23 )
	WaypointArrowContainer:setRGB( 1, 1, 1 )
	self:addElement( WaypointArrowContainer )
	self.WaypointArrowContainer = WaypointArrowContainer
	
	local progressMeter = LUI.UIImage.new()
	progressMeter:setLeftRight( false, false, -22, 22 )
	progressMeter:setTopBottom( false, false, -22, 22 )
	progressMeter:setRGB( 1, 1, 1 )
	progressMeter:setImage( RegisterImage( "uie_t7_hud_interact_meter_thick" ) )
	progressMeter:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	progressMeter:setShaderVector( 0, -0.05, 0, 0, 0 )
	progressMeter:setShaderVector( 1, 0.5, 0, 0, 0 )
	progressMeter:setShaderVector( 2, 0.5, 0, 0, 0 )
	progressMeter:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( progressMeter )
	self.progressMeter = progressMeter
	
	local waypointType = LUI.UITightText.new()
	waypointType:setLeftRight( true, true, 24.5, -24.5 )
	waypointType:setTopBottom( false, false, -39, -20 )
	waypointType:setRGB( 1, 1, 1 )
	waypointType:setText( Engine.Localize( "MENU_NEW" ) )
	waypointType:setTTF( "fonts/Entovo.ttf" )
	waypointType:setLetterSpacing( 0.5 )
	self:addElement( waypointType )
	self.waypointType = waypointType
	
	local WaypointCenter = CoD.WaypointCenter.new( menu, controller )
	WaypointCenter:setLeftRight( false, false, -20, 20 )
	WaypointCenter:setTopBottom( false, false, -20, 20 )
	WaypointCenter:setRGB( 1, 1, 1 )
	self:addElement( WaypointCenter )
	self.WaypointCenter = WaypointCenter
	
	local DistanceIndicator = LUI.UIText.new()
	DistanceIndicator:setLeftRight( true, true, 0, 0 )
	DistanceIndicator:setTopBottom( false, false, -60, -39 )
	DistanceIndicator:setRGB( 1, 1, 1 )
	DistanceIndicator:setAlpha( 0 )
	DistanceIndicator:setText( Engine.Localize( "MENU_NEW" ) )
	DistanceIndicator:setTTF( "fonts/default.ttf" )
	DistanceIndicator:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	DistanceIndicator:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( DistanceIndicator )
	self.DistanceIndicator = DistanceIndicator
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				DistanceIndicator:completeAnimation()
				self.DistanceIndicator:setLeftRight( true, true, 0, 0 )
				self.DistanceIndicator:setTopBottom( false, false, -60, -39 )
				self.clipFinished( DistanceIndicator, {} )
			end
		},
		NoIcon = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				waypointType:completeAnimation()
				self.waypointType:setLeftRight( true, true, 24.5, -24.5 )
				self.waypointType:setTopBottom( false, false, -4, 15 )
				self.clipFinished( waypointType, {} )
				WaypointCenter:completeAnimation()
				self.WaypointCenter:setAlpha( 0 )
				self.clipFinished( WaypointCenter, {} )
				DistanceIndicator:completeAnimation()
				self.DistanceIndicator:setLeftRight( true, true, 0, 0 )
				self.DistanceIndicator:setTopBottom( false, false, -21, 0 )
				self.clipFinished( DistanceIndicator, {} )
			end
		},
		NoIconOrText = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				waypointType:completeAnimation()
				self.waypointType:setAlpha( 0 )
				self.clipFinished( waypointType, {} )
				WaypointCenter:completeAnimation()
				self.WaypointCenter:setAlpha( 0 )
				self.clipFinished( WaypointCenter, {} )
				DistanceIndicator:completeAnimation()
				self.DistanceIndicator:setLeftRight( true, true, 0, 0 )
				self.DistanceIndicator:setTopBottom( false, false, -5, 16 )
				self.clipFinished( DistanceIndicator, {} )
			end
		}
	}
	self.close = function ( self )
		self.WaypointArrowContainer:close()
		self.WaypointCenter:close()
		CoD.Waypoint.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

