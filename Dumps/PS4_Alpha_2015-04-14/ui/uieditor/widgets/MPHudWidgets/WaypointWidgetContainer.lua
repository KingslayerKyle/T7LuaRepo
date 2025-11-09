require( "ui.uieditor.widgets.MPHudWidgets.DomWaypointContainer" )
require( "ui.uieditor.widgets.MPHudWidgets.KothWaypointContainer" )
require( "ui.uieditor.widgets.MPHudWidgets.CtfWaypointFlagContainer" )
require( "ui.uieditor.widgets.MPHudWidgets.CtfWaypointBaseContainer" )
require( "ui.uieditor.widgets.MPHudWidgets.DemWaypointContainer" )
require( "ui.uieditor.widgets.HUD.Waypoint.GenericWaypointContainer" )
require( "ui.uieditor.widgets.MPHudWidgets.SDWaypointContainer" )

local WaypointWidgetContainer_ShouldShow = function ( self, event )
	local controller = event.controller
	local index = self.gameTypeContainer.objId
	local objectiveState = Engine.GetObjectiveState( controller, index )
	if objectiveState ~= CoD.OBJECTIVESTATE_ACTIVE and objectiveState ~= CoD.OBJECTIVESTATE_CURRENT and objectiveState ~= CoD.OBJECTIVESTATE_DONE then
		return false
	else
		local objectiveEntity = Engine.GetObjectiveEntity( controller, index )
		if objectiveEntity == Engine.GetPredictedClientNum( controller ) then
			return false
		elseif self.gameTypeContainer.shouldShow ~= nil then
			return self.gameTypeContainer:shouldShow( event )
		else
			return true
		end
	end
end

local WaypointWidgetContainer_Update = function ( self, event )
	if not WaypointWidgetContainer_ShouldShow( self, event ) then
		self.gameTypeContainer.visible = false
	else
		self.gameTypeContainer.visible = true
	end
	self.gameTypeContainer:update( event )
end

local WaypointWidgetContainer_SetupWaypoint = function ( self, event )
	local controller = event.controller
	local objectiveName = self.objective.id
	local gameType = self.objective.gametype
	if gameType == nil then
		gameType = ""
	end
	if gameType == "dom" then
		local gameTypeContainer = CoD.DomWaypointContainer.new( self.menu, controller )
		self:addElement( gameTypeContainer )
		self.gameTypeContainer = gameTypeContainer
		
	elseif gameType == "koth" then
		local gameTypeContainer = CoD.KothWaypointContainer.new( self.menu, controller )
		self:addElement( gameTypeContainer )
		self.gameTypeContainer = gameTypeContainer
		
	elseif gameType == "dem" then
		local gameTypeContainer = CoD.DemWaypointContainer.new( self.menu, controller )
		self:addElement( gameTypeContainer )
		self.gameTypeContainer = gameTypeContainer
		
	elseif gameType == "ctf" then
		local gameTypeContainer = nil
		if objectiveName == "axis_flag" or objectiveName == "allies_flag" then
			gameTypeContainer = CoD.CtfWaypointFlagContainer.new( self.menu, controller )
		elseif objectiveName == "axis_base" or objectiveName == "allies_base" then
			gameTypeContainer = CoD.CtfWaypointBaseContainer.new( self.menu, controller )
		end
		if gameTypeContainer ~= nil then
			self:addElement( gameTypeContainer )
			self.gameTypeContainer = gameTypeContainer
			
		end
	elseif gameType == "sd" or gameType == "sr" then
		local gameTypeContainer = CoD.SDWaypointContainer.new( controller )
		gameTypeContainer:setLeftRight( true, true, 0, 0 )
		gameTypeContainer:setTopBottom( true, true, 0, 0 )
		self:addElement( gameTypeContainer )
		self.gameTypeContainer = gameTypeContainer
		
	else
		local gameTypeContainer = CoD.GenericWaypointContainer.new( self.menu, controller )
		self:addElement( gameTypeContainer )
		self.gameTypeContainer = gameTypeContainer
	end
	self.gameTypeContainer.objective = self.objective
	self.gameTypeContainer:setupWaypointContainer( event )
end

local PostLoadFunc = function ( self, controller, menu )
	self.update = WaypointWidgetContainer_Update
	self.setupWaypoint = WaypointWidgetContainer_SetupWaypoint
	self.menu = menu
end

CoD.WaypointWidgetContainer = InheritFrom( LUI.UIElement )
CoD.WaypointWidgetContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.WaypointWidgetContainer )
	self.id = "WaypointWidgetContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

