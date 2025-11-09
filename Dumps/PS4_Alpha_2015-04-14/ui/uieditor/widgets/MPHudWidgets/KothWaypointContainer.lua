require( "ui.uieditor.widgets.MPHudWidgets.Waypoint" )

local GetWaypointProperties = function ( self, controller, index )
	local properties = {}
	local teamUsingCount = Engine.ObjectiveGetTeamUsingCount( controller, index )
	local objectiveTeam = Engine.GetObjectiveTeam( controller, index )
	local waypoint = self.Waypoint
	local f1_local0 = teamUsingCount > 1
	if objectiveTeam == Enum.team_t.TEAM_FREE or objectiveTeam == Enum.team_t.TEAM_NEUTRAL then
		properties.waypointType = self.waypoint_label_capture
		properties.imagename = self.waypoint_image_neutral
		properties.imagecolor = ColorSet.WaypointNeutral
	elseif waypoint:isOwnedByMyTeam( controller ) then
		properties.imagename = self.waypoint_image_defend
		properties.imagecolor = ColorSet.FriendlyBlue
		if f1_local0 then
			properties.waypointType = self.waypoint_label_contested
			properties.imagecolor = ColorSet.WaypointNeutral
		else
			properties.waypointType = self.waypoint_label_defend
		end
	else
		properties.imagename = self.waypoint_image_capture
		properties.imagecolor = ColorSet.EnemyOrange
		if f1_local0 then
			properties.waypointType = self.waypoint_label_contested
			properties.imagecolor = ColorSet.WaypointNeutral
		else
			properties.waypointType = self.waypoint_label_capture
		end
	end
	return properties
end

local KothWaypointContainer_Update = function ( self, event )
	local waypoint = self.Waypoint
	if self.visible == true then
		self:show()
		waypoint:update( event )
		local index = self.objId
		local controller = event.controller
		local objectiveState = Engine.GetObjectiveState( controller, index )
		if objectiveState ~= CoD.OBJECTIVESTATE_ACTIVE then
			return 
		end
		local properties = GetWaypointProperties( self, controller, index )
		if properties.imagename then
			waypoint.WaypointCenter.waypointCenterImage:setImage( RegisterMaterial( properties.imagename ) )
			if properties.imagecolor then
				waypoint.WaypointCenter.waypointCenterImage:setRGB( properties.imagecolor.r, properties.imagecolor.g, properties.imagecolor.b )
			end
		end
		if properties.waypointType then
			waypoint.waypointType:setText( Engine.Localize( properties.waypointType ) )
		end
		local minimapIcon = properties.imagename .. "_mini"
		waypoint:setCompassObjectiveIcon( controller, index, minimapIcon, properties.imagecolor )
	else
		self:hide()
		return 
	end
end

local KothWaypointContainer_SetupWaypointContainer = function ( self, event )
	if event.objId then
		self.objId = event.objId
		local objectiveName = self.objective.id
		local waypoint = self.Waypoint
		waypoint.objective = self.objective
		waypoint:setupWaypoint( event )
		self.waypoint_label_capture = Engine.StructTableLookupString( "objectives", "id", objectiveName, "waypoint_label_capture" )
		self.waypoint_label_contested = Engine.StructTableLookupString( "objectives", "id", objectiveName, "waypoint_label_contested" )
		self.waypoint_label_capturing = Engine.StructTableLookupString( "objectives", "id", objectiveName, "waypoint_label_capturing" )
		self.waypoint_label_defend = Engine.StructTableLookupString( "objectives", "id", objectiveName, "waypoint_label_defend" )
		self.waypoint_image_neutral = Engine.StructTableLookupString( "objectives", "id", objectiveName, "waypoint_image_neutral" )
		self.waypoint_image_capture = Engine.StructTableLookupString( "objectives", "id", objectiveName, "waypoint_image_capture" )
		self.waypoint_image_defend = Engine.StructTableLookupString( "objectives", "id", objectiveName, "waypoint_image_defend" )
	end
end

local PostLoadFunc = function ( self )
	self.update = KothWaypointContainer_Update
	self.setupWaypointContainer = KothWaypointContainer_SetupWaypointContainer
end

CoD.KothWaypointContainer = InheritFrom( LUI.UIElement )
CoD.KothWaypointContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.KothWaypointContainer )
	self.id = "KothWaypointContainer"
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
		CoD.KothWaypointContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

