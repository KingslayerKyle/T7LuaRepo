CoD.ObjectiveWaypoint = InheritFrom( LUI.UIElement )
CoD.ObjectiveWaypoint.PlayerZOffset = 75
CoD.ObjectiveWaypoint.iconWidth = 56
CoD.ObjectiveWaypoint.iconHeight = 56
CoD.ObjectiveWaypoint.iconAlpha = 0.5
CoD.ObjectiveWaypoint.largeIconWidth = 64
CoD.ObjectiveWaypoint.largeIconHeight = 64
CoD.ObjectiveWaypoint.progressWidth = CoD.ObjectiveWaypoint.largeIconWidth + 4
CoD.ObjectiveWaypoint.progressHeight = CoD.ObjectiveWaypoint.largeIconHeight + 4
CoD.ObjectiveWaypoint.progressHeightNudge = 0
CoD.ObjectiveWaypoint.snapToHeight = 112
CoD.ObjectiveWaypoint.snapToTime = 250
CoD.ObjectiveWaypoint.pulseAlphaLow = CoD.ObjectiveWaypoint.iconAlpha * 0.35
CoD.ObjectiveWaypoint.pulseAlphaHigh = CoD.ObjectiveWaypoint.iconAlpha
CoD.ObjectiveWaypoint.pulseTime = 700
CoD.ObjectiveWaypoint.pulseStopTime = 200
CoD.ObjectiveWaypoint.ArrowMaterialNameWhite = "waypoint_circle_arrow"
CoD.ObjectiveWaypoint.ArrowMaterialNameRed = "waypoint_circle_arrow_red"
CoD.ObjectiveWaypoint.ArrowMaterialNameGreen = "waypoint_circle_arrow_green"
CoD.ObjectiveWaypoint.ArrowMaterialNameYellow = "waypoint_circle_arrow_yellow"
CoD.ObjectiveWaypoint.contestedProgressColor = CoD.BOIIOrange
CoD.ObjectiveWaypoint.progressColor = CoD.white
local SetCarryIconEvent = {
	name = "set_carry_icon"
}
CoD.ObjectiveWaypoint.new = function ( controller, index, zOffset )
	local objectiveName = Engine.GetObjectiveName( controller, index )
	local objectiveWaypoint = LUI.UIElement.new()
	objectiveWaypoint:setClass( CoD.ObjectiveWaypoint )
	objectiveWaypoint:setupEntityContainer( index )
	objectiveWaypoint:setEntityContainerClamp( true )
	objectiveWaypoint:setEntityContainerFadeWhenTargeted( true )
	objectiveWaypoint.index = index
	objectiveWaypoint.zOffset = zOffset
	objectiveWaypoint.snapToTime = CoD.ObjectiveWaypoint.snapToTime
	objectiveWaypoint.snapToCenterForObjectiveTeam = true
	
	local progressController = LUI.UIElement.new()
	progressController:setLeftRight( false, false, 0, 0 )
	progressController:setTopBottom( false, false, 0, 0 )
	progressController:setAlpha( 0 )
	objectiveWaypoint:addElement( progressController )
	objectiveWaypoint.progressController = progressController
	
	local progressBackground = LUI.UIImage.new()
	progressBackground:setLeftRight( true, true, 0, 0 )
	progressBackground:setTopBottom( true, true, 0, 0 )
	progressBackground:setImage( RegisterMaterial( "hud_objective_full_circle_meter" ) )
	progressBackground:setRGB( 0, 0, 0 )
	progressBackground:setAlpha( 0.5 )
	progressBackground:setShaderVector( 0, 1, 0, 0, 0 )
	progressController:addElement( progressBackground )
	objectiveWaypoint.progressBackground = progressBackground
	
	local progressBar = LUI.UIImage.new()
	progressBar:setupObjectiveProgress( index )
	progressBar:setLeftRight( true, true, 0, 0 )
	progressBar:setTopBottom( true, true, 0, 0 )
	progressBar:setImage( RegisterMaterial( "hud_objective_circle_meter" ) )
	progressController:addElement( progressBar )
	objectiveWaypoint.progressBar = progressBar
	
	local alphaController = LUI.UIElement.new()
	alphaController:setLeftRight( true, true, 0, 0 )
	alphaController:setTopBottom( true, true, 0, 0 )
	alphaController:setAlpha( objectiveWaypoint.iconAlpha )
	alphaController:registerEventHandler( "transition_complete_pulse_low", function ( alphaController, event )
		if event.interrupted ~= true then
			alphaController:beginAnimation( "pulse_high", objectiveWaypoint.pulseTime, false, false )
			alphaController:setAlpha( objectiveWaypoint.pulseAlphaHigh )
		end
	end )
	alphaController:registerEventHandler( "transition_complete_pulse_high", function ( alphaController, event )
		if event.interrupted ~= true then
			alphaController:beginAnimation( "pulse_low", objectiveWaypoint.pulseTime, false, false )
			alphaController:setAlpha( objectiveWaypoint.pulseAlphaLow )
		end
	end )
	objectiveWaypoint:addElement( alphaController )
	objectiveWaypoint.alphaController = alphaController
	
	local mainImage = LUI.UIImage.new()
	mainImage:setLeftRight( true, true, 0, 0 )
	mainImage:setTopBottom( true, true, 0, 0 )
	alphaController:addElement( mainImage )
	objectiveWaypoint.mainImage = mainImage
	
	local edgePointerContainer = LUI.UIElement.new()
	edgePointerContainer:setLeftRight( true, true, 0, 0 )
	edgePointerContainer:setTopBottom( true, true, 0, 0 )
	alphaController:addElement( edgePointerContainer )
	objectiveWaypoint.edgePointerContainer = edgePointerContainer
	
	local arrow = LUI.UIImage.new()
	arrow:setLeftRight( false, false, -16, 16 )
	arrow:setTopBottom( false, true, -10, 22 )
	arrow:setImage( RegisterMaterial( CoD.ObjectiveWaypoint.ArrowMaterialNameWhite ) )
	edgePointerContainer:addElement( arrow )
	objectiveWaypoint.arrowImage = arrow
	
	objectiveWaypoint.showingProgress = false
	objectiveWaypoint.updateProgress = CoD.ObjectiveWaypoint.updateProgress
	objectiveWaypoint.updatePlayerUsing = CoD.ObjectiveWaypoint.updatePlayerUsing
	return objectiveWaypoint
end

CoD.ObjectiveWaypoint.Clamped = function ( self, event )
	self.edgePointerContainer:setupEdgePointer( 90 )
end

CoD.ObjectiveWaypoint.Unclamped = function ( self, event )
	self.edgePointerContainer:setupUIElement()
	self.edgePointerContainer:setZRot( 0 )
end

CoD.ObjectiveWaypoint.isOwnedByMyTeam = function ( self, controller )
	local myClientNum = Engine.GetPredictedClientNum( controller )
	local myTeam = Engine.GetTeamID( controller, myClientNum )
	local objectiveTeam = Engine.GetObjectiveTeam( controller, self.index )
	if myTeam ~= objectiveTeam then
		return false
	else
		return true
	end
end

CoD.ObjectiveWaypoint.setCarryIcon = function ( self, material )
	if material ~= self.carryIconMaterial then
		self.carryIconMaterial = material
		SetCarryIconEvent.material = material
		self:dispatchEventToParent( SetCarryIconEvent )
	end
end

CoD.ObjectiveWaypoint.shouldShow = function ( self, event )
	local controller = event.controller
	local index = self.index
	local objectiveState = Engine.GetObjectiveState( controller, index )
	if objectiveState ~= CoD.OBJECTIVESTATE_ACTIVE then
		return false
	end
	local objectiveEntity = Engine.GetObjectiveEntity( controller, index )
	if objectiveEntity == Engine.GetPredictedClientNum( controller ) then
		return false
	end
	local objectiveTeam = Engine.GetObjectiveTeam( controller, self.index )
	if objectiveTeam ~= 0 then
		local myClientNum = Engine.GetPredictedClientNum( controller )
		local myTeam = Engine.GetTeamID( controller, myClientNum )
		if myTeam ~= objectiveTeam then
			return false
		end
	end
	return true
end

CoD.ObjectiveWaypoint.update = function ( self, event )
	local controller = event.controller
	local index = self.index
	local ping = self.ping
	local objectiveEntity = Engine.GetObjectiveEntity( controller, index )
	if objectiveEntity and not ping then
		self:setupEntityContainer( index, 0, 0, self.zOffset )
	else
		local posX, posY, posZ = Engine.GetObjectivePosition( controller, index )
		self:setupEntityContainer( index, posX, posY, posZ + self.zOffset )
		if ping then
			self.alphaController:setAlpha( self.iconAlpha )
			local pingDuration = Engine.GetGametypeSetting( "objectivePingTime" ) * 1000 + 1000
			self.alphaController:beginAnimation( "ping", pingDuration )
			self.alphaController:setAlpha( 0.1 )
		end
	end
	if not self:shouldShow( event ) then
		self.progressController:close()
		self.alphaController:close()
		return 
	else
		self:addElement( self.progressController )
		self:addElement( self.alphaController )
		local clientNum = Engine.GetPredictedClientNum( controller )
		local playerTeam = Engine.GetTeamID( controller, clientNum )
		local isPlayerTeamUsing = Engine.ObjectiveIsTeamUsing( controller, self.index, playerTeam )
		local isAnyOtherTeamUsing = Engine.ObjectiveIsAnyOtherTeamUsing( controller, self.index, playerTeam )
		self:updatePlayerUsing( controller, isPlayerTeamUsing, isAnyOtherTeamUsing )
		self:updateProgress( controller, isPlayerTeamUsing, isAnyOtherTeamUsing )
	end
end

CoD.ObjectiveWaypoint.isPlayerUsing = function ( self, controller, isPlayerTeamUsing, isAnyOtherTeamUsing )
	if Engine.IsPlayerInVehicle( controller ) == true then
		return false
	elseif Engine.IsPlayerRemoteControlling( controller ) == true then
		return false
	elseif Engine.IsPlayerWeaponViewOnlyLinked( controller ) == true then
		return false
	end
	local clientNum = Engine.GetPredictedClientNum( controller )
	local f10_local0 = isPlayerTeamUsing
	local contested = isAnyOtherTeamUsing
	if self.snapToCenterForObjectiveTeam == false and not (f10_local0 and contested) then
		local playerTeam = Engine.GetTeamID( controller, clientNum )
		local objectiveTeam = Engine.GetObjectiveTeam( controller, self.index )
		if playerTeam == objectiveTeam then
			return false
		end
	end
	return Engine.ObjectiveIsPlayerUsing( controller, self.index, clientNum )
end

CoD.ObjectiveWaypoint.updatePlayerUsing = function ( self, controller, isPlayerTeamUsing, isAnyOtherTeamUsing )
	local playerUsing = CoD.ObjectiveWaypoint.isPlayerUsing( self, controller, isPlayerTeamUsing, isAnyOtherTeamUsing )
	if self.playerUsing == playerUsing then
		return 
	elseif playerUsing == true then
		if self.playerUsing ~= nil then
			self:beginAnimation( "snap_in", self.snapToTime, true, true )
		end
		self:setEntityContainerStopUpdating( true )
		self:setLeftRight( false, false, -self.largeIconWidth / 2, self.largeIconWidth / 2 )
		self:setTopBottom( false, false, -self.largeIconHeight - self.snapToHeight, -self.snapToHeight )
		self.edgePointerContainer:setAlpha( 0 )
	else
		if self.playerUsing ~= nil then
			self:beginAnimation( "snap_out", self.snapToTime, true, true )
		end
		self:setEntityContainerStopUpdating( false )
		self:setLeftRight( false, false, -self.iconWidth / 2, self.iconWidth / 2 )
		self:setTopBottom( false, true, -self.iconHeight, 0 )
		self.edgePointerContainer:setAlpha( 1 )
	end
	self.playerUsing = playerUsing
end

CoD.ObjectiveWaypoint.updateProgress = function ( self, controller, isPlayerTeamUsing, isAnyOtherTeamUsing )
	local progress = Engine.GetObjectiveProgress( controller, self.index )
	local showProgressBar = true
	if not self.showProgressToEveryone and (self.playerUsing == nil or self.playerUsing == false) then
		showProgressBar = false
	end
	local mayShowProgress = true
	if showProgressBar and self.mayShowProgress then
		mayShowProgress = self:mayShowProgress( controller )
	end
	local f12_local0 = isPlayerTeamUsing
	local contested = isAnyOtherTeamUsing
	local f12_local1 = f12_local0 and contested
	if not f12_local1 and showProgressBar then
		showProgressBar = mayShowProgress
	end
	if showProgressBar and not self.showProgressToEveryone then
		if f12_local1 then
			self.progressBar:setRGB( self.contestedProgressColor.r, self.contestedProgressColor.g, self.contestedProgressColor.b )
			self.progressBar:setupUIImage()
			self.progressBar:setShaderVector( 0, 1, 0, 0, 0 )
		else
			self.progressBar:setRGB( self.progressColor.r, self.progressColor.g, self.progressColor.b )
			self.progressBar:setupObjectiveProgress( self.index )
		end
	end
	if self.showingProgress == false and showProgressBar == true and (progress > 0 or f12_local1) then
		if self.showProgressToEveryone then
			if isPlayerTeamUsing and isAnyOtherTeamUsing then
				self.progressBar:setRGB( self.contestedProgressColor.r, self.contestedProgressColor.g, self.contestedProgressColor.b )
			elseif isPlayerTeamUsing then
				self.progressBar:setRGB( CoD.teamColorFriendly.r, CoD.teamColorFriendly.g, CoD.teamColorFriendly.b )
			else
				self.progressBar:setRGB( CoD.teamColorEnemy.r, CoD.teamColorEnemy.g, CoD.teamColorEnemy.b )
			end
		end
		local progressHalfHeight = CoD.ObjectiveWaypoint.progressHeight / 2
		self.progressController:beginAnimation( "progress", self.snapToTime, true, true )
		self.progressController:setLeftRight( false, false, -CoD.ObjectiveWaypoint.progressWidth / 2, CoD.ObjectiveWaypoint.progressWidth / 2 )
		self.progressController:setTopBottom( false, false, -progressHalfHeight - CoD.ObjectiveWaypoint.progressHeightNudge, progressHalfHeight - CoD.ObjectiveWaypoint.progressHeightNudge )
		self.progressController:setAlpha( 1 )
		self.showingProgress = true
	elseif self.showingProgress == true and (not (progress ~= 0 or f12_local1) or showProgressBar == false) then
		self.progressController:beginAnimation( "progress", self.snapToTime, true, true )
		self.progressController:setLeftRight( false, false, 0, 0 )
		self.progressController:setTopBottom( false, false, 0, 0 )
		self.progressController:setAlpha( 0 )
		self.showingProgress = false
	end
	if not self.disablePulse then
		if not self.pulsing and progress > 0 then
			self.alphaController:beginAnimation( "pulse_low", self.pulseTime, false, false )
			self.alphaController:setAlpha( self.pulseAlphaLow )
			self.pulsing = true
		elseif self.pulsing and progress == 0 then
			self.alphaController:beginAnimation( "pulse_stop", self.pulseStopTime, false, false )
			self.alphaController:setAlpha( self.iconAlpha )
			self.pulsing = nil
		end
	end
end

CoD.ObjectiveWaypoint.setPing = function ( self, ping )
	if self.ping and not ping then
		self.alphaController:setAlpha( self.iconAlpha )
	end
	self.ping = ping
end

CoD.ObjectiveWaypoint.SnapInFinished = function ( self, event )
	if event.interrupted ~= true then
		
	else
		
	end
end

CoD.ObjectiveWaypoint:registerEventHandler( "transition_complete_snap_in", CoD.ObjectiveWaypoint.SnapInFinished )
CoD.ObjectiveWaypoint:registerEventHandler( "entity_container_clamped", CoD.ObjectiveWaypoint.Clamped )
CoD.ObjectiveWaypoint:registerEventHandler( "entity_container_unclamped", CoD.ObjectiveWaypoint.Unclamped )
