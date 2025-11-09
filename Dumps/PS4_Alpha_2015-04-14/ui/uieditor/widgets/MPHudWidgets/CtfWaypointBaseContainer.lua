require( "ui.uieditor.widgets.MPHudWidgets.Waypoint" )

local CtfWaypointBaseContainer_Update = function ( self, event )
	local waypointIconName = "waypoint_waitfor_flag"
	local controller = event.controller
	local index = self.objId
	local waypoint = self.Waypoint
	waypoint.WaypointCenter.waypointCenterImage:setImage( RegisterMaterial( waypointIconName ) )
	if self.visible == true then
		self:show()
		waypoint:update( event )
		waypoint:setCompassObjectiveIcon( controller, index, minimapIcon )
	else
		self:hide()
		waypoint:clearCompassObjectiveIcon( controller, index )
	end
end

local CtfWaypointBaseContainer_SetupWaypointContainer = function ( self, event )
	if event.objId then
		self.objId = event.objId
		local waypoint = self.Waypoint
		waypoint.objective = self.objective
		waypoint:setupWaypoint( event )
		local objectiveName = self.objective.id
		local flagObjectiveName = string.sub( objectiveName, 1, -5 ) .. "flag"
		self.flagObjectiveIndex = Engine.GetObjectiveIndexFromName( event.controller, flagObjectiveName )
	end
end

local CtfWaypointBaseContainer_ShouldShow = function ( self, event )
	local controller = event.controller
	local index = self.objId
	local waypoint = self.Waypoint
	if not waypoint:isOwnedByMyTeam( controller ) then
		return false
	elseif Engine.GetObjectiveGamemodeFlags( controller, index ) ~= self.objectiveFlagAway then
		return false
	end
	local flagObjectiveIndex = self.flagObjectiveIndex
	if flagObjectiveIndex then
		if Engine.GetObjectiveGamemodeFlags( controller, flagObjectiveIndex ) ~= self.objectiveFlagAway then
			return false
		end
		local clientNum = Engine.GetPredictedClientNum( controller )
		if not Engine.ObjectiveIsPlayerUsing( controller, flagObjectiveIndex, clientNum ) then
			return false
		end
	end
	return true
end

local PostLoadFunc = function ( self )
	self.update = CtfWaypointBaseContainer_Update
	self.setupWaypointContainer = CtfWaypointBaseContainer_SetupWaypointContainer
	self.shouldShow = CtfWaypointBaseContainer_ShouldShow
	self.objectiveAtBase = 0
	self.objectiveFlagAway = 1
end

CoD.CtfWaypointBaseContainer = InheritFrom( LUI.UIElement )
CoD.CtfWaypointBaseContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CtfWaypointBaseContainer )
	self.id = "CtfWaypointBaseContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local Waypoint = CoD.Waypoint.new( menu, controller )
	Waypoint:setLeftRight( true, true, 600, -600 )
	Waypoint:setTopBottom( true, true, 315, -315 )
	Waypoint:setRGB( 1, 1, 1 )
	self:addElement( Waypoint )
	self.Waypoint = Waypoint
	
	self.close = function ( self )
		self.Waypoint:close()
		CoD.CtfWaypointBaseContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

