require( "ui_mp.T6.HUD.ObjectiveWaypoint" )

CoD.GametypeBase = InheritFrom( CoD.Menu )
CoD.GametypeBase.CarryIconSize = 64
CoD.GametypeBase.CarryIconRightOffset = -20
CoD.GametypeBase.CarryIconBottomOffset = -150
CoD.GametypeBase.maxObjectives = 32
CoD.GametypeBase.mapIconType = 0
CoD.GametypeBase.GametypeInfoLeftOffset = 13
CoD.GametypeBase.GametypeInfoTopOffset = 185
CoD.GametypeBase.shoutcasterMapIconType = 1
CoD.CarepackageObjective = {}
CoD.ObjectiveRemoteMortar = InheritFrom( CoD.ObjectiveWaypoint )
CoD.ObjectiveBomb = InheritFrom( CoD.ObjectiveWaypoint )
CoD.ObjectiveBomb.GroundZOffset = 32
CoD.ObjectiveBombSite = InheritFrom( CoD.ObjectiveWaypoint )
CoD.ObjectiveBombSite.BombSiteZOffset = 64
CoD.ObjectiveBombSite.OBJECTIVE_FLAG_PLANTED = 1
CoD.ObjectiveBombSite.disablePulse = true
CoD.ObjectiveDefuseSite = InheritFrom( CoD.ObjectiveWaypoint )
CoD.ObjectiveDefuseSite.DefuseSiteZOffset = 32
CoD.ObjectiveDefuseSite.disablePulse = true
local GametypeBase_Refresh = nil
local SubscribeToVisBitModels = function ( self, controller )
	local UpdateVisibility_Internal = function ( model )
		CoD.GametypeBase.updateVisibility( self, {
			controller = controller
		} )
	end
	
	local perControllerModel = Engine.GetModelForController( controller )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_GAME_ENDED ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_HUD_VISIBLE ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_KILLCAM ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_UI_ACTIVE ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_VEHICLE ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ), UpdateVisibility_Internal )
	self:subscribeToModel( Engine.GetModel( perControllerModel, "UIVisibilityBit." .. Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ), UpdateVisibility_Internal )
end

CoD.GametypeBase.new = function ( name, controller )
	local self = CoD.Menu.NewSafeAreaFromState( name, controller )
	self:setClass( CoD.GametypeBase )
	self:setAlpha( 0 )
	self.objectiveTypes = {
		bomb = CoD.ObjectiveBomb,
		carepackage = CoD.CarepackageObjective,
		remotemortar = CoD.ObjectiveRemoteMortar
	}
	self.objectives = {}
	SubscribeToVisBitModels( self, controller )
	return self
end

CoD.GametypeBase.NewObjectiveEvent = function ( self, event )
	local objective = self:createObjectiveIfNeeded( event, event.objId )
	if objective then
		objective:update( event )
	end
end

CoD.GametypeBase.createObjectiveIfNeeded = function ( self, event, objectiveIndex )
	local objective_name = Engine.GetObjectiveName( event.controller, objectiveIndex )
	local objective = self.objectives[objectiveIndex]
	if objective_name and self.objectiveTypes[objective_name] then
		if not objective then
			objective = self.objectiveTypes[objective_name].new( event.controller, objectiveIndex )
			self:addElement( objective )
			self.objectives[objectiveIndex] = objective
		end
		return objective
	else
		
	end
end

CoD.GametypeBase.SetCompassObjectiveIcon = function ( controller, index, mapMaterialName, shoutcasterMapMaterialName )
	if mapMaterialName then
		Engine.SetObjectiveIcon( controller, index, CoD.GametypeBase.mapIconType, mapMaterialName )
	else
		Engine.ClearObjectiveIcon( controller, index, CoD.GametypeBase.mapIconType )
	end
	Engine.SetObjectiveIcon( controller, index, CoD.GametypeBase.shoutcasterMapIconType, shoutcasterMapMaterialName )
end

CoD.GametypeBase.ClearCompassObjectiveIcon = function ( controller, index )
	Engine.ClearObjectiveIcon( controller, index, CoD.GametypeBase.mapIconType )
	Engine.ClearObjectiveIcon( controller, index, CoD.GametypeBase.shoutcasterMapIconType )
end

CoD.GametypeBase.setCarryIcon = function ( self, material )
	if material then
		if not self.carryIcon then
			self.carryIconScaleContainer = CoD.SplitscreenScaler.new( nil, CoD.SplitscreenMultiplier )
			self.carryIconScaleContainer:setLeftRight( false, true, 0, 0 )
			self.carryIconScaleContainer:setTopBottom( false, true, 0, 0 )
			self:addElement( self.carryIconScaleContainer )
			self.carryIcon = LUI.UIImage.new()
			self.carryIcon:setLeftRight( false, true, CoD.GametypeBase.CarryIconRightOffset - CoD.GametypeBase.CarryIconSize, CoD.GametypeBase.CarryIconRightOffset )
			self.carryIcon:setTopBottom( false, true, CoD.GametypeBase.CarryIconBottomOffset - CoD.GametypeBase.CarryIconSize, CoD.GametypeBase.CarryIconBottomOffset )
			self.carryIconScaleContainer:addElement( self.carryIcon )
		end
		self.carryIcon:setImage( material )
	elseif self.carryIcon then
		self.carryIcon:close()
		self.carryIcon = nil
		self.carryIconScaleContainer:close()
		self.carryIconScaleContainer = nil
	end
end

CoD.GametypeBase.SetCarryIconEvent = function ( self, event )
	self:setCarryIcon( event.material )
end

CoD.GametypeBase.updateVisibility = function ( self, event )
	local controller = event.controller
	if not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_GAME_ENDED ) and Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_KILLCAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_UI_ACTIVE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_VEHICLE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_CAMERA_MODE_MOVIECAM ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_GUIDED_MISSILE ) and not Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_IN_REMOTE_KILLSTREAK_STATIC ) then
		if self.visible ~= true then
			self:setAlpha( 1 )
			self.visible = true
		end
	elseif self.visible == true then
		self:setAlpha( 0 )
		self.visible = nil
	end
end

CoD.GametypeBase:registerEventHandler( "objective_new", CoD.GametypeBase.NewObjectiveEvent )
CoD.GametypeBase:registerEventHandler( "set_carry_icon", CoD.GametypeBase.SetCarryIconEvent )
CoD.ObjectiveBomb.new = function ( controller, index )
	local self = CoD.ObjectiveWaypoint.new( controller, index, CoD.ObjectiveBomb.GroundZOffset )
	self:setClass( CoD.ObjectiveBomb )
	local objectiveName = Engine.GetObjectiveName( controller, index )
	self:registerEventHandler( "objective_update_" .. objectiveName, self.update )
	return self
end

CoD.ObjectiveBomb.update = function ( self, event )
	local controller = event.controller
	local index = self.index
	local objectiveEntity = Engine.GetObjectiveEntity( controller, index )
	if objectiveEntity then
		self.zOffset = self.PlayerZOffset
	else
		self.zOffset = self.GroundZOffset
	end
	CoD.ObjectiveBomb.super.update( self, event )
	local shouldShow = self:shouldShow( event )
	local shouldShowToCaster = CoD.ObjectiveBomb.shouldShowToCaster( self, event )
	local materialName = nil
	if shouldShow then
		if objectiveEntity then
			materialName = "waypoint_defend"
			self.arrowImage:setImage( RegisterMaterial( CoD.ObjectiveWaypoint.ArrowMaterialNameGreen ) )
		else
			materialName = "waypoint_bomb"
			self.arrowImage:setImage( RegisterMaterial( CoD.ObjectiveWaypoint.ArrowMaterialNameYellow ) )
		end
		self.mainImage:setImage( RegisterMaterial( materialName ) )
	end
	if shouldShow == true or shouldShowToCaster == true then
		CoD.GametypeBase.SetCompassObjectiveIcon( controller, index, materialName, "white_waypoint_bomb" )
	else
		CoD.GametypeBase.ClearCompassObjectiveIcon( controller, index )
	end
	if objectiveEntity == Engine.GetPredictedClientNum( controller ) then
		self:setCarryIcon( RegisterMaterial( "hud_suitcase_bomb" ) )
	else
		self:setCarryIcon( nil )
	end
end

CoD.ObjectiveBomb.shouldShow = function ( self, event )
	local shouldShow = CoD.ObjectiveBomb.super.shouldShow( self, event )
	if not shouldShow then
		return false
	else
		local controller = event.controller
		if not self:isOwnedByMyTeam( controller ) then
			return false
		else
			return true
		end
	end
end

CoD.ObjectiveBomb.shouldShowToCaster = function ( self, event )
	local controller = event.controller
	local index = self.index
	local objectiveState = Engine.GetObjectiveState( controller, index )
	if objectiveState ~= CoD.OBJECTIVESTATE_ACTIVE then
		return false
	elseif Engine.IsShoutcaster( event.controller ) then
		return true
	else
		return false
	end
end

CoD.ObjectiveBombSite.new = function ( controller, index )
	local self = CoD.ObjectiveWaypoint.new( controller, index, CoD.ObjectiveBombSite.BombSiteZOffset )
	self:setClass( CoD.ObjectiveBombSite )
	local objectiveName = Engine.GetObjectiveName( controller, index )
	self:registerEventHandler( "objective_update_" .. objectiveName, self.update )
	return self
end

CoD.ObjectiveBombSite.update = function ( self, event )
	CoD.ObjectiveBombSite.super.update( self, event )
	local controller = event.controller
	local index = self.index
	local objectiveName = Engine.GetObjectiveName( controller, index )
	if not objectiveName then
		return 
	end
	local label = string.sub( objectiveName, -2 )
	local f16_local0 = Engine.GetObjectiveGamemodeFlags( controller, self.index ) == CoD.ObjectiveBombSite.OBJECTIVE_FLAG_PLANTED
	local f16_local1 = Engine.GetGametypeSetting( "multiBomb" ) == 1
	local waypointName = nil
	if self:isOwnedByMyTeam( controller ) then
		if f16_local0 then
			waypointName = "waypoint_defuse"
			self.arrowImage:setImage( RegisterMaterial( CoD.ObjectiveWaypoint.ArrowMaterialNameRed ) )
		else
			waypointName = "waypoint_defend"
			self.arrowImage:setImage( RegisterMaterial( CoD.ObjectiveWaypoint.ArrowMaterialNameGreen ) )
		end
		if f16_local1 then
			self:setCarryIcon( nil )
		end
	else
		if f16_local0 then
			waypointName = "waypoint_defend"
			self.arrowImage:setImage( RegisterMaterial( CoD.ObjectiveWaypoint.ArrowMaterialNameGreen ) )
		else
			waypointName = "waypoint_target"
			self.arrowImage:setImage( RegisterMaterial( CoD.ObjectiveWaypoint.ArrowMaterialNameRed ) )
		end
		if f16_local1 then
			self:setCarryIcon( RegisterMaterial( "hud_suitcase_bomb" ) )
		end
	end
	local materialName = waypointName .. label
	self.mainImage:setImage( RegisterMaterial( materialName ) )
	CoD.GametypeBase.SetCompassObjectiveIcon( controller, index, materialName, "white_" .. materialName )
end

CoD.ObjectiveDefuseSite.new = function ( controller, index )
	local self = CoD.ObjectiveWaypoint.new( controller, index, CoD.ObjectiveDefuseSite.DefuseSiteZOffset )
	self:setClass( CoD.ObjectiveDefuseSite )
	local objectiveName = Engine.GetObjectiveName( controller, index )
	self:registerEventHandler( "objective_update_" .. objectiveName, self.update )
	return self
end

CoD.ObjectiveDefuseSite.update = CoD.ObjectiveBombSite.update
CoD.CarepackageObjective.new = function ( self, event )
	
end

CoD.ObjectiveRemoteMortar.new = function ( controller, index )
	local self = CoD.ObjectiveWaypoint.new( controller, index, 0 )
	self:setClass( CoD.ObjectiveRemoteMortar )
	self.arrowImage:close()
	return self
end

CoD.ObjectiveRemoteMortar.update = function ( self, event )
	local controller = event.controller
	local index = self.index
	Engine.SetObjectiveRotateWithEntity( controller, index, CoD.GametypeBase.mapIconType, true )
	Engine.SetObjectiveColorMaterialInCode( controller, index, CoD.GametypeBase.mapIconType, true )
	CoD.GametypeBase.SetCompassObjectiveIcon( controller, index, "compass_lodestar", "compass_lodestar" )
end

