require( "ui.uieditor.widgets.MPHudWidgets.Waypoint" )

local GetWaypointProperties = function ( self, controller, index, isPlayerTeamUsing, isAnyOtherTeamUsing )
	local objectiveTeam = Engine.GetObjectiveTeam( controller, index )
	local f1_local0 = isPlayerTeamUsing
	local contested = isAnyOtherTeamUsing
	local f1_local1 = f1_local0 and contested
	local waypoint = self.Waypoint
	local properties = {}
	if objectiveTeam == Enum.team_t.TEAM_FREE then
		properties.waypointType = self.waypoint_label_capture
		if waypoint.waypoint_image_default ~= nil then
			properties.imagename = waypoint.waypoint_image_default
		else
			properties.imagename = "t7_hud_waypoints_neutral_new"
		end
	elseif objectiveTeam == Enum.team_t.TEAM_NEUTRAL then
		properties.imagename = self.waypoint_image_neutral
		if f1_local1 then
			properties.waypointType = self.waypoint_label_contested
		elseif isPlayerTeamUsing or isAnyOtherTeamUsing then
			properties.waypointType = self.waypoint_label_capturing
		else
			properties.waypointType = self.waypoint_label_capture
		end
	elseif waypoint:isOwnedByMyTeam( controller ) then
		properties.imagename = self.waypoint_image_defend
		properties.imagecolor = ColorSet.FriendlyBlue
		properties.waypointType = self.waypoint_label_defend
		if f1_local1 then
			properties.waypointType = self.waypoint_label_contested
		elseif isAnyOtherTeamUsing then
			properties.waypointType = self.waypoint_label_capturing
		end
	elseif not waypoint:isOwnedByMyTeam( controller ) then
		properties.imagename = self.waypoint_image_capture
		properties.imagecolor = ColorSet.EnemyOrange
		properties.waypointType = self.waypoint_label_capture
		if f1_local1 then
			properties.waypointType = self.waypoint_label_contested
		elseif isPlayerTeamUsing then
			properties.waypointType = self.waypoint_label_capturing
		end
	end
	return properties
end

local DomWaypointContainer_Update = function ( self, event )
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
		local clientNum = Engine.GetPredictedClientNum( controller )
		local playerTeam = Engine.GetTeamID( controller, clientNum )
		local isPlayerTeamUsing = Engine.ObjectiveIsTeamUsing( controller, index, playerTeam )
		local isAnyOtherTeamUsing = Engine.ObjectiveIsAnyOtherTeamUsing( controller, index, playerTeam )
		local properties = GetWaypointProperties( self, controller, index, isPlayerTeamUsing, isAnyOtherTeamUsing )
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

local DomWaypointContainer_SetupWaypointContainer = function ( self, event )
	if event.objId then
		self.objId = event.objId
		local waypoint = self.Waypoint
		waypoint.objective = self.objective
		waypoint:setupWaypoint( event )
		waypoint.snapToCenterForObjectiveTeam = false
		local objectiveName = self.objective.id
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
	self.update = DomWaypointContainer_Update
	self.setupWaypointContainer = DomWaypointContainer_SetupWaypointContainer
end

CoD.DomWaypointContainer = InheritFrom( LUI.UIElement )
CoD.DomWaypointContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.DomWaypointContainer )
	self.id = "DomWaypointContainer"
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
		CoD.DomWaypointContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

