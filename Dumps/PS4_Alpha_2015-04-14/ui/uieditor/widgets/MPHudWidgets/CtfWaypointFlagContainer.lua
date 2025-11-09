require( "ui.uieditor.widgets.MPHudWidgets.Waypoint" )

local GetWaypointProperties = function ( self, controller, index )
	local properties = {}
	local waypoint = self.Waypoint
	local objectiveEntity = Engine.GetObjectiveEntity( controller, index )
	local ping = nil
	if waypoint:isOwnedByMyTeam( controller ) then
		if Engine.GetObjectiveGamemodeFlags( controller, index ) == self.objectiveAtBase then
			properties.waypointType = self.waypoint_label_defend
			properties.imagename = self.waypoint_image_defend
			properties.imagecolor = ColorSet.FriendlyBlue
		elseif objectiveEntity then
			properties.waypointType = self.waypoint_label_kill
			properties.imagename = self.waypoint_image_grab
			properties.imagecolor = ColorSet.EnemyOrange
			if Engine.GetGametypeSetting( "enemyCarrierVisible" ) == 2 then
				ping = true
			end
		else
			properties.waypointType = self.waypoint_label_return
			properties.imagename = self.waypoint_image_defend
			properties.imagecolor = ColorSet.FriendlyBlue
		end
	elseif objectiveEntity then
		properties.waypointType = self.waypoint_label_escort
		properties.imagename = self.waypoint_image_defend
		properties.imagecolor = ColorSet.FriendlyBlue
	else
		properties.waypointType = self.waypoint_label_grab
		properties.imagename = self.waypoint_image_grab
		properties.imagecolor = ColorSet.EnemyOrange
	end
	waypoint:setPing( ping )
	return properties
end

local CtfWaypointFlagContainer_Update = function ( self, event )
	local waypoint = self.Waypoint
	local controller = event.controller
	local index = self.objId
	local teamsUsing = Engine.ObjectiveGetTeamUsingCount( controller, index )
	local objectiveEntity = Engine.GetObjectiveEntity( controller, index )
	if objectiveEntity then
		waypoint.zOffset = self.waypoint_player_z_offset
	else
		waypoint.zOffset = self.waypoint_base_z_offset
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
	if self.visible == true then
		self:show()
		waypoint:update( event )
		waypoint:setCompassObjectiveIcon( controller, index, minimapIcon, properties.imagecolor )
		Engine.SetObjectiveIgnoreEntity( controller, index, CoD.GametypeBase.mapIconType, waypoint.ping == true )
	else
		self:hide()
		waypoint:clearCompassObjectiveIcon( controller, index )
	end
end

local CtfWaypointFlagContainer_SetupWaypointContainer = function ( self, event )
	if event.objId then
		self.objId = event.objId
		local waypoint = self.Waypoint
		waypoint.objective = self.objective
		waypoint:setupWaypoint( event )
		local objectiveName = self.objective.id
		self.waypoint_label_grab = Engine.StructTableLookupString( "objectives", "id", objectiveName, "waypoint_label_grab" )
		self.waypoint_label_kill = Engine.StructTableLookupString( "objectives", "id", objectiveName, "waypoint_label_kill" )
		self.waypoint_label_escort = Engine.StructTableLookupString( "objectives", "id", objectiveName, "waypoint_label_escort" )
		self.waypoint_label_return = Engine.StructTableLookupString( "objectives", "id", objectiveName, "waypoint_label_return" )
		self.waypoint_label_defend = Engine.StructTableLookupString( "objectives", "id", objectiveName, "waypoint_label_defend" )
		self.waypoint_image_grab = Engine.StructTableLookupString( "objectives", "id", objectiveName, "waypoint_image_grab" )
		self.waypoint_image_defend = Engine.StructTableLookupString( "objectives", "id", objectiveName, "waypoint_image_defend" )
		self.waypoint_player_z_offset = Engine.StructTableLookupNumber( "objectives", "id", objectiveName, "waypoint_player_z_offset" )
		self.waypoint_base_z_offset = Engine.StructTableLookupNumber( "objectives", "id", objectiveName, "waypoint_z_offset" )
	end
end

local CtfWaypointFlagContainer_ShouldShow = function ( self, event )
	local controller = event.controller
	local index = self.objId
	local waypoint = self.Waypoint
	if waypoint:isOwnedByMyTeam( controller ) and Engine.GetObjectiveGamemodeFlags( controller, index ) ~= self.objectiveAtBase and Engine.GetObjectiveEntity( controller, index ) and Engine.GetGametypeSetting( "enemyCarrierVisible" ) == 0 then
		return false
	else
		return true
	end
end

local PostLoadFunc = function ( self )
	self.update = CtfWaypointFlagContainer_Update
	self.setupWaypointContainer = CtfWaypointFlagContainer_SetupWaypointContainer
	self.shouldShow = CtfWaypointFlagContainer_ShouldShow
	self.objectiveAtBase = 0
	self.objectiveFlagAway = 1
end

CoD.CtfWaypointFlagContainer = InheritFrom( LUI.UIElement )
CoD.CtfWaypointFlagContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CtfWaypointFlagContainer )
	self.id = "CtfWaypointFlagContainer"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 1280 )
	self:setTopBottom( true, false, 0, 720 )
	self.anyChildUsesUpdateState = true
	
	local Waypoint = CoD.Waypoint.new( menu, controller )
	Waypoint:setLeftRight( true, true, 600, -600 )
	Waypoint:setTopBottom( true, true, 315, -315 )
	self:addElement( Waypoint )
	self.Waypoint = Waypoint
	
	self.close = function ( self )
		self.Waypoint:close()
		CoD.CtfWaypointFlagContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

