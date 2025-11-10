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
local f0_local0 = {
	name = "set_carry_icon"
}
CoD.ObjectiveWaypoint.new = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = Engine.GetObjectiveName( f1_arg0, f1_arg1 )
	local self = LUI.UIElement.new()
	self:setClass( CoD.ObjectiveWaypoint )
	self:setupEntityContainer( f1_arg1 )
	self:setEntityContainerClamp( true )
	self:setEntityContainerFadeWhenTargeted( true )
	self.index = f1_arg1
	self.zOffset = f1_arg2
	self.snapToTime = CoD.ObjectiveWaypoint.snapToTime
	self.snapToCenterForObjectiveTeam = true
	
	local progressController = LUI.UIElement.new()
	progressController:setLeftRight( false, false, 0, 0 )
	progressController:setTopBottom( false, false, 0, 0 )
	progressController:setAlpha( 0 )
	self:addElement( progressController )
	self.progressController = progressController
	
	local progressBackground = LUI.UIImage.new()
	progressBackground:setLeftRight( true, true, 0, 0 )
	progressBackground:setTopBottom( true, true, 0, 0 )
	progressBackground:setImage( RegisterMaterial( "hud_objective_full_circle_meter" ) )
	progressBackground:setRGB( 0, 0, 0 )
	progressBackground:setAlpha( 0.5 )
	progressBackground:setShaderVector( 0, 1, 0, 0, 0 )
	progressController:addElement( progressBackground )
	self.progressBackground = progressBackground
	
	local progressBar = LUI.UIImage.new()
	progressBar:setupObjectiveProgress( f1_arg1 )
	progressBar:setLeftRight( true, true, 0, 0 )
	progressBar:setTopBottom( true, true, 0, 0 )
	progressBar:setImage( RegisterMaterial( "hud_objective_circle_meter" ) )
	progressController:addElement( progressBar )
	self.progressBar = progressBar
	
	local alphaController = LUI.UIElement.new()
	alphaController:setLeftRight( true, true, 0, 0 )
	alphaController:setTopBottom( true, true, 0, 0 )
	alphaController:setAlpha( self.iconAlpha )
	alphaController:registerEventHandler( "transition_complete_pulse_low", function ( element, event )
		if event.interrupted ~= true then
			element:beginAnimation( "pulse_high", self.pulseTime, false, false )
			element:setAlpha( self.pulseAlphaHigh )
		end
	end )
	alphaController:registerEventHandler( "transition_complete_pulse_high", function ( element, event )
		if event.interrupted ~= true then
			element:beginAnimation( "pulse_low", self.pulseTime, false, false )
			element:setAlpha( self.pulseAlphaLow )
		end
	end )
	self:addElement( alphaController )
	self.alphaController = alphaController
	
	local mainImage = LUI.UIImage.new()
	mainImage:setLeftRight( true, true, 0, 0 )
	mainImage:setTopBottom( true, true, 0, 0 )
	alphaController:addElement( mainImage )
	self.mainImage = mainImage
	
	local edgePointerContainer = LUI.UIElement.new()
	edgePointerContainer:setLeftRight( true, true, 0, 0 )
	edgePointerContainer:setTopBottom( true, true, 0, 0 )
	alphaController:addElement( edgePointerContainer )
	self.edgePointerContainer = edgePointerContainer
	
	local arrowImage = LUI.UIImage.new()
	arrowImage:setLeftRight( false, false, -16, 16 )
	arrowImage:setTopBottom( false, true, -10, 22 )
	arrowImage:setImage( RegisterMaterial( CoD.ObjectiveWaypoint.ArrowMaterialNameWhite ) )
	edgePointerContainer:addElement( arrowImage )
	self.arrowImage = arrowImage
	
	self.showingProgress = false
	self.updateProgress = CoD.ObjectiveWaypoint.updateProgress
	self.updatePlayerUsing = CoD.ObjectiveWaypoint.updatePlayerUsing
	return self
end

CoD.ObjectiveWaypoint.Clamped = function ( f4_arg0, f4_arg1 )
	f4_arg0.edgePointerContainer:setupEdgePointer( 90 )
end

CoD.ObjectiveWaypoint.Unclamped = function ( f5_arg0, f5_arg1 )
	f5_arg0.edgePointerContainer:setupUIElement()
	f5_arg0.edgePointerContainer:setZRot( 0 )
end

CoD.ObjectiveWaypoint.isOwnedByMyTeam = function ( f6_arg0, f6_arg1 )
	if Engine.GetTeamID( f6_arg1, Engine.GetPredictedClientNum( f6_arg1 ) ) ~= Engine.GetObjectiveTeam( f6_arg1, f6_arg0.index ) then
		return false
	else
		return true
	end
end

CoD.ObjectiveWaypoint.setCarryIcon = function ( f7_arg0, f7_arg1 )
	if f7_arg1 ~= f7_arg0.carryIconMaterial then
		f7_arg0.carryIconMaterial = f7_arg1
		f0_local0.material = f7_arg1
		f7_arg0:dispatchEventToParent( f0_local0 )
	end
end

CoD.ObjectiveWaypoint.shouldShow = function ( f8_arg0, f8_arg1 )
	local f8_local0 = f8_arg1.controller
	local f8_local1 = f8_arg0.index
	if Engine.GetObjectiveState( f8_local0, f8_local1 ) ~= CoD.OBJECTIVESTATE_ACTIVE then
		return false
	elseif Engine.GetObjectiveEntity( f8_local0, f8_local1 ) == Engine.GetPredictedClientNum( f8_local0 ) then
		return false
	else
		local f8_local2 = Engine.GetObjectiveTeam( f8_local0, f8_arg0.index )
		if f8_local2 ~= 0 and Engine.GetTeamID( f8_local0, Engine.GetPredictedClientNum( f8_local0 ) ) ~= f8_local2 then
			return false
		else
			return true
		end
	end
end

CoD.ObjectiveWaypoint.update = function ( f9_arg0, f9_arg1 )
	local f9_local0 = f9_arg1.controller
	local f9_local1 = f9_arg0.index
	local f9_local2 = f9_arg0.ping
	if Engine.GetObjectiveEntity( f9_local0, f9_local1 ) and not f9_local2 then
		f9_arg0:setupEntityContainer( f9_local1, 0, 0, f9_arg0.zOffset )
	else
		local f9_local3, f9_local4, f9_local5 = Engine.GetObjectivePosition( f9_local0, f9_local1 )
		f9_arg0:setupEntityContainer( f9_local1, f9_local3, f9_local4, f9_local5 + f9_arg0.zOffset )
		if f9_local2 then
			f9_arg0.alphaController:setAlpha( f9_arg0.iconAlpha )
			f9_arg0.alphaController:beginAnimation( "ping", Engine.GetGametypeSetting( "objectivePingTime" ) * 1000 + 1000 )
			f9_arg0.alphaController:setAlpha( 0.1 )
		end
	end
	if not f9_arg0:shouldShow( f9_arg1 ) then
		f9_arg0.progressController:close()
		f9_arg0.alphaController:close()
		return 
	else
		f9_arg0:addElement( f9_arg0.progressController )
		f9_arg0:addElement( f9_arg0.alphaController )
		local f9_local4 = Engine.GetTeamID( f9_local0, Engine.GetPredictedClientNum( f9_local0 ) )
		local f9_local5 = Engine.ObjectiveIsTeamUsing( f9_local0, f9_arg0.index, f9_local4 )
		local f9_local6 = Engine.ObjectiveIsAnyOtherTeamUsing( f9_local0, f9_arg0.index, f9_local4 )
		f9_arg0:updatePlayerUsing( f9_local0, f9_local5, f9_local6 )
		f9_arg0:updateProgress( f9_local0, f9_local5, f9_local6 )
	end
end

CoD.ObjectiveWaypoint.isPlayerUsing = function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
	if Engine.IsPlayerInVehicle( f10_arg1 ) == true then
		return false
	elseif Engine.IsPlayerRemoteControlling( f10_arg1 ) == true then
		return false
	elseif Engine.IsPlayerWeaponViewOnlyLinked( f10_arg1 ) == true then
		return false
	else
		local f10_local0 = Engine.GetPredictedClientNum( f10_arg1 )
		if f10_arg0.snapToCenterForObjectiveTeam == false and not (f10_arg2 and f10_arg3) and Engine.GetTeamID( f10_arg1, f10_local0 ) == Engine.GetObjectiveTeam( f10_arg1, f10_arg0.index ) then
			return false
		else
			return Engine.ObjectiveIsPlayerUsing( f10_arg1, f10_arg0.index, f10_local0 )
		end
	end
end

CoD.ObjectiveWaypoint.updatePlayerUsing = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
	local f11_local0 = CoD.ObjectiveWaypoint.isPlayerUsing( f11_arg0, f11_arg1, f11_arg2, f11_arg3 )
	if f11_arg0.playerUsing == f11_local0 then
		return 
	elseif f11_local0 == true then
		if f11_arg0.playerUsing ~= nil then
			f11_arg0:beginAnimation( "snap_in", f11_arg0.snapToTime, true, true )
		end
		f11_arg0:setEntityContainerStopUpdating( true )
		f11_arg0:setLeftRight( false, false, -f11_arg0.largeIconWidth / 2, f11_arg0.largeIconWidth / 2 )
		f11_arg0:setTopBottom( false, false, -f11_arg0.largeIconHeight - f11_arg0.snapToHeight, -f11_arg0.snapToHeight )
		f11_arg0.edgePointerContainer:setAlpha( 0 )
	else
		if f11_arg0.playerUsing ~= nil then
			f11_arg0:beginAnimation( "snap_out", f11_arg0.snapToTime, true, true )
		end
		f11_arg0:setEntityContainerStopUpdating( false )
		f11_arg0:setLeftRight( false, false, -f11_arg0.iconWidth / 2, f11_arg0.iconWidth / 2 )
		f11_arg0:setTopBottom( false, true, -f11_arg0.iconHeight, 0 )
		f11_arg0.edgePointerContainer:setAlpha( 1 )
	end
	f11_arg0.playerUsing = f11_local0
end

CoD.ObjectiveWaypoint.updateProgress = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
	local f12_local0 = Engine.GetObjectiveProgress( f12_arg1, f12_arg0.index )
	local f12_local1 = true
	if not f12_arg0.showProgressToEveryone and (f12_arg0.playerUsing == nil or f12_arg0.playerUsing == false) then
		f12_local1 = false
	end
	local f12_local2 = true
	if f12_local1 and f12_arg0.mayShowProgress then
		f12_local2 = f12_arg0:mayShowProgress( f12_arg1 )
	end
	local f12_local3 = f12_arg2 and f12_arg3
	if not f12_local3 and f12_local1 then
		f12_local1 = f12_local2
	end
	if f12_local1 and not f12_arg0.showProgressToEveryone then
		if f12_local3 then
			f12_arg0.progressBar:setRGB( f12_arg0.contestedProgressColor.r, f12_arg0.contestedProgressColor.g, f12_arg0.contestedProgressColor.b )
			f12_arg0.progressBar:setupUIImage()
			f12_arg0.progressBar:setShaderVector( 0, 1, 0, 0, 0 )
		else
			f12_arg0.progressBar:setRGB( f12_arg0.progressColor.r, f12_arg0.progressColor.g, f12_arg0.progressColor.b )
			f12_arg0.progressBar:setupObjectiveProgress( f12_arg0.index )
		end
	end
	if f12_arg0.showingProgress == false and f12_local1 == true and (f12_local0 > 0 or f12_local3) then
		if f12_arg0.showProgressToEveryone then
			if f12_arg2 and f12_arg3 then
				f12_arg0.progressBar:setRGB( f12_arg0.contestedProgressColor.r, f12_arg0.contestedProgressColor.g, f12_arg0.contestedProgressColor.b )
			elseif f12_arg2 then
				f12_arg0.progressBar:setRGB( CoD.teamColorFriendly.r, CoD.teamColorFriendly.g, CoD.teamColorFriendly.b )
			else
				f12_arg0.progressBar:setRGB( CoD.teamColorEnemy.r, CoD.teamColorEnemy.g, CoD.teamColorEnemy.b )
			end
		end
		local f12_local4 = CoD.ObjectiveWaypoint.progressHeight / 2
		f12_arg0.progressController:beginAnimation( "progress", f12_arg0.snapToTime, true, true )
		f12_arg0.progressController:setLeftRight( false, false, -CoD.ObjectiveWaypoint.progressWidth / 2, CoD.ObjectiveWaypoint.progressWidth / 2 )
		f12_arg0.progressController:setTopBottom( false, false, -f12_local4 - CoD.ObjectiveWaypoint.progressHeightNudge, f12_local4 - CoD.ObjectiveWaypoint.progressHeightNudge )
		f12_arg0.progressController:setAlpha( 1 )
		f12_arg0.showingProgress = true
	elseif f12_arg0.showingProgress == true and (not (f12_local0 ~= 0 or f12_local3) or f12_local1 == false) then
		f12_arg0.progressController:beginAnimation( "progress", f12_arg0.snapToTime, true, true )
		f12_arg0.progressController:setLeftRight( false, false, 0, 0 )
		f12_arg0.progressController:setTopBottom( false, false, 0, 0 )
		f12_arg0.progressController:setAlpha( 0 )
		f12_arg0.showingProgress = false
	end
	if not f12_arg0.disablePulse then
		if not f12_arg0.pulsing and f12_local0 > 0 then
			f12_arg0.alphaController:beginAnimation( "pulse_low", f12_arg0.pulseTime, false, false )
			f12_arg0.alphaController:setAlpha( f12_arg0.pulseAlphaLow )
			f12_arg0.pulsing = true
		elseif f12_arg0.pulsing and f12_local0 == 0 then
			f12_arg0.alphaController:beginAnimation( "pulse_stop", f12_arg0.pulseStopTime, false, false )
			f12_arg0.alphaController:setAlpha( f12_arg0.iconAlpha )
			f12_arg0.pulsing = nil
		end
	end
end

CoD.ObjectiveWaypoint.setPing = function ( f13_arg0, f13_arg1 )
	if f13_arg0.ping and not f13_arg1 then
		f13_arg0.alphaController:setAlpha( f13_arg0.iconAlpha )
	end
	f13_arg0.ping = f13_arg1
end

CoD.ObjectiveWaypoint.SnapInFinished = function ( f14_arg0, f14_arg1 )
	if f14_arg1.interrupted ~= true then
		
	else
		
	end
end

CoD.ObjectiveWaypoint:registerEventHandler( "transition_complete_snap_in", CoD.ObjectiveWaypoint.SnapInFinished )
CoD.ObjectiveWaypoint:registerEventHandler( "entity_container_clamped", CoD.ObjectiveWaypoint.Clamped )
CoD.ObjectiveWaypoint:registerEventHandler( "entity_container_unclamped", CoD.ObjectiveWaypoint.Unclamped )
