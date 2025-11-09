require( "ui.uieditor.widgets.MPHudWidgets.Waypoint" )

local GetWaypointProperties = function ( self, controller, index )
	local objectiveTeam = Engine.GetObjectiveTeam( controller, index )
	local waypoint = self.Waypoint
	local f1_local0 = Engine.GetObjectiveGamemodeFlags( controller, index ) == self.bombPlanted
	local properties = {}
	if waypoint:isOwnedByMyTeam( controller ) then
		if f1_local0 then
			properties.waypointType = self.waypoint_label_defuse
			properties.imagename = self.waypoint_image_defuse
			properties.imagecolor = ColorSet.EnemyOrange
		else
			properties.waypointType = self.waypoint_label_defend
			properties.imagename = self.waypoint_image_defend
			properties.imagecolor = ColorSet.FriendlyBlue
		end
	elseif f1_local0 then
		properties.waypointType = self.waypoint_label_defend
		properties.imagename = self.waypoint_image_defend
		properties.imagecolor = ColorSet.FriendlyBlue
	else
		properties.waypointType = self.waypoint_label_target
		properties.imagename = self.waypoint_image_target
		properties.imagecolor = ColorSet.EnemyOrange
	end
	return properties
end

local DemWaypointContainer_Update = function ( self, event )
	local waypoint = self.Waypoint
	if self.visible == true then
		self:setAlpha( 1 )
		waypoint:update( event )
		local controller = event.controller
		local index = self.objId
		local objectiveName = Engine.GetObjectiveName( controller, index )
		if not objectiveName then
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
		self:setAlpha( 0 )
		return 
	end
end

local DemWaypointContainer_SetupWaypointContainer = function ( self, event )
	if event.objId then
		self.objId = event.objId
		local waypoint = self.Waypoint
		waypoint.objective = self.objective
		waypoint:setupWaypoint( event )
		local objectiveName = self.objective.id
		self.waypoint_label_target = Engine.StructTableLookupString( "objectives", "id", objectiveName, "waypoint_label_target" )
		self.waypoint_label_defuse = Engine.StructTableLookupString( "objectives", "id", objectiveName, "waypoint_label_defuse" )
		self.waypoint_label_defend = Engine.StructTableLookupString( "objectives", "id", objectiveName, "waypoint_label_defend" )
		self.waypoint_image_defuse = Engine.StructTableLookupString( "objectives", "id", objectiveName, "waypoint_image_defuse" )
		self.waypoint_image_target = Engine.StructTableLookupString( "objectives", "id", objectiveName, "waypoint_image_target" )
		self.waypoint_image_defend = Engine.StructTableLookupString( "objectives", "id", objectiveName, "waypoint_image_defend" )
	end
end

local PostLoadFunc = function ( self )
	self.update = DemWaypointContainer_Update
	self.setupWaypointContainer = DemWaypointContainer_SetupWaypointContainer
	self.bombPlanted = 1
end

CoD.DemWaypointContainer = InheritFrom( LUI.UIElement )
CoD.DemWaypointContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DemWaypointContainer )
	self.id = "DemWaypointContainer"
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
		CoD.DemWaypointContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

