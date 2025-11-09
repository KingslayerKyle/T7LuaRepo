require( "T6.HUD.gametypes.GametypeBase" )

CoD.coop = {}
CoD.coop.FlagLeft = 15
CoD.coop.FlagWidth = 32
CoD.coop.FlagHeight = 32
CoD.coop.FlagTop = 180
CoD.coop.baseWaypointZOffset = 100
CoD.coop.IconGroundZOffset = 32
CoD.COOPObjectiveFlag = InheritFrom( CoD.ObjectiveWaypoint )
CoD.COOPObjectiveIcon = InheritFrom( CoD.ObjectiveWaypoint )
CoD.COOPObjectiveFlag.new = function ( controller, index )
	local self = CoD.ObjectiveWaypoint.new( controller, index, CoD.coop.baseWaypointZOffset )
	self:setClass( CoD.COOPObjectiveFlag )
	local objectiveName = Engine.GetObjectiveName( controller, index )
	self:registerEventHandler( "objective_update_" .. objectiveName, self.update )
	return self
end

CoD.COOPObjectiveFlag.update = function ( self, event )
	local controller = event.controller
	local index = self.index
	local teamsUsing = Engine.ObjectiveGetTeamUsingCount( controller, index )
	local objectiveEntity = Engine.GetObjectiveEntity( controller, index )
	if objectiveEntity then
		self.zOffset = self.PlayerZOffset
	else
		self.zOffset = CoD.coop.baseWaypointZOffset
	end
	local ping, materialName, shoutcasterMaterialName = nil
	if self:isOwnedByMyTeam( controller ) then
		materialName = "waypoint_defend_flag"
		shoutcasterMaterialName = materialName
		self.arrowImage:setImage( RegisterMaterial( CoD.ObjectiveWaypoint.ArrowMaterialNameGreen ) )
	else
		materialName = "waypoint_grab_red"
		shoutcasterMaterialName = "waypoint_grab"
		self.arrowImage:setImage( RegisterMaterial( CoD.ObjectiveWaypoint.ArrowMaterialNameRed ) )
	end
	self.mainImage:setImage( RegisterMaterial( materialName ) )
	local clientNum = Engine.GetPredictedClientNum( controller )
	if objectiveEntity == clientNum then
		local carryIconMaterial = "hud_ctf_flag_icon_green"
		self:setCarryIcon( RegisterMaterial( carryIconMaterial ) )
	else
		self:setCarryIcon( nil )
	end
	self:setPing( ping )
	CoD.COOPObjectiveFlag.super.update( self, event )
	if self.alphaController:getParent() then
		CoD.GametypeBase.SetCompassObjectiveIcon( controller, index, materialName, "white_" .. shoutcasterMaterialName )
		Engine.SetObjectiveIgnoreEntity( controller, index, CoD.GametypeBase.mapIconType, self.ping == true )
	else
		CoD.GametypeBase.ClearCompassObjectiveIcon( controller, index )
	end
end

CoD.COOPObjectiveIcon.new = function ( controller, index )
	local self = CoD.ObjectiveWaypoint.new( controller, index, CoD.coop.IconGroundZOffset )
	self:setClass( CoD.COOPObjectiveIcon )
	self:setEntityContainerClamp( false )
	local objectiveName = Engine.GetObjectiveName( controller, index )
	self:registerEventHandler( "objective_update_" .. objectiveName, self.update )
	return self
end

CoD.COOPObjectiveIcon.update = function ( self, event )
	local controller = event.controller
	local index = self.index
	local objectiveEntity = Engine.GetObjectiveEntity( controller, index )
	if objectiveEntity then
		self.zOffset = self.PlayerZOffset
	else
		self.zOffset = CoD.coop.IconGroundZOffset
	end
	CoD.COOPObjectiveIcon.super.update( self, event )
	local shouldShow = self:shouldShow( event )
	local shouldShowToCaster = CoD.COOPObjectiveIcon.shouldShowToCaster( self, event )
	local materialName = nil
	if shouldShow then
		if objectiveEntity then
			materialName = "waypoint_defend"
			self.arrowImage:setImage( RegisterMaterial( CoD.ObjectiveWaypoint.ArrowMaterialNameGreen ) )
		else
			materialName = "waypoint_kill"
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
		self:setCarryIcon( RegisterMaterial( "hud_ctf_flag_icon_white" ) )
	else
		self:setCarryIcon( nil )
	end
end

CoD.COOPObjectiveIcon.shouldShowToCaster = function ( self, event )
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

local PostLoadFunc = function ( self )
	local objectivesLayer = self.gametype_coop_objective_layer
	objectivesLayer:setAlpha( 0 )
	local flagScaleContainer = CoD.SplitscreenScaler.new( nil, CoD.SplitscreenMultiplier )
	flagScaleContainer:setLeftRight( true, false, 0, 0 )
	flagScaleContainer:setTopBottom( true, false, 0, 0 )
	objectivesLayer:addElement( flagScaleContainer )
	if Engine.IsSplitscreen() then
		CoD.coop.FlagLeft = 10
		CoD.coop.FlagTop = 135
	end
	objectivesLayer.objectiveTypes._a = CoD.ObjectiveBombSite
	objectivesLayer.objectiveTypes.defuse_a = CoD.ObjectiveDefuseSite
	objectivesLayer.objectiveTypes.allies_flag = CoD.COOPObjectiveFlag
	objectivesLayer.objectiveTypes.axis_flag = CoD.COOPObjectiveFlag
	objectivesLayer.objectiveTypes.no_offscreen = CoD.COOPObjectiveIcon
	local friendlyFlag = LUI.UIElement.new()
	friendlyFlag:setLeftRight( true, false, CoD.coop.FlagLeft, CoD.coop.FlagLeft + CoD.coop.FlagWidth )
	friendlyFlag:setTopBottom( true, false, CoD.coop.FlagTop, CoD.coop.FlagTop + CoD.coop.FlagHeight )
	flagScaleContainer:addElement( friendlyFlag )
	local enemyFlag = LUI.UIElement.new()
	enemyFlag:setLeftRight( true, false, CoD.coop.FlagLeft, CoD.coop.FlagLeft + CoD.coop.FlagWidth )
	enemyFlag:setTopBottom( true, false, CoD.coop.FlagTop + CoD.coop.FlagHeight, CoD.coop.FlagTop + 2 * CoD.coop.FlagHeight )
	flagScaleContainer:addElement( enemyFlag )
end

LUI.createMenu.gametype_coop = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "gametype_coop" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "default"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open" )
	local menu = self
	
	local gametype_coop_objective_layer = CoD.GametypeBase.new( "gametype_coop_objective_layer", controller )
	self:addElement( gametype_coop_objective_layer )
	self.gametype_coop_objective_layer = gametype_coop_objective_layer
	
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = menu
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

