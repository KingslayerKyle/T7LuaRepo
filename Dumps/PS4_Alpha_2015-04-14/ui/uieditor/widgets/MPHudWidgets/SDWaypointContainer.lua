require( "ui.uieditor.widgets.MPHudWidgets.Waypoint" )

local SDWaypointContainer_ShouldShowBomb = function ( self, controller )
	local controller = controller
	local waypoint = self.Waypoint
	if not waypoint:isOwnedByMyTeam( controller ) then
		return false
	else
		return true
	end
end

local GetBombsiteWaypointProperties = function ( self, controller, index )
	local objectiveTeam = Engine.GetObjectiveTeam( controller, index )
	local waypoint = self.Waypoint
	local f2_local0 = Engine.GetObjectiveGamemodeFlags( controller, index ) == self.bombPlanted
	local properties = {}
	if waypoint:isOwnedByMyTeam( controller ) then
		if f2_local0 then
			properties.waypointType = self.waypoint_label_defuse
			properties.imagename = self.waypoint_image_defuse
			properties.imagecolor = ColorSet.EnemyOrange
		else
			properties.waypointType = self.waypoint_label_defend
			properties.imagename = self.waypoint_image_defend
			properties.imagecolor = ColorSet.FriendlyBlue
		end
	elseif f2_local0 then
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

local GetBombWaypointProperties = function ( self, controller, index )
	local objectiveTeam = Engine.GetObjectiveTeam( controller, index )
	local waypoint = self.Waypoint
	local f3_local0 = Engine.GetObjectiveGamemodeFlags( controller, index ) == self.bombPlanted
	local f3_local1 = Engine.GetGametypeSetting( "multiBomb" ) == 1
	local properties = {}
	local shouldShow = SDWaypointContainer_ShouldShowBomb( self, controller )
	local objectiveEntity = Engine.GetObjectiveEntity( controller, index )
	if shouldShow then
		if objectiveEntity then
			properties.waypointType = self.waypoint_label_defend
			properties.imagename = self.waypoint_image_defend
			properties.imagecolor = ColorSet.FriendlyBlue
		else
			properties.waypointType = self.waypoint_label_bomb
			properties.imagename = self.waypoint_image_bomb
		end
	end
	return properties
end

local SDWaypointContainer_IsVisible = function ( self, event )
	local waypoint = self.Waypoint
	if self.visible == true then
		self:show()
		return true
	else
		self:hide()
		waypoint:clearCompassObjectiveIcon( event.controller, self.objId )
		return false
	end
end

local SDWaypointContainer_UpdateBombsiteWaypoint = function ( self, event )
	if SDWaypointContainer_IsVisible( self, event ) == false then
		return 
	end
	local waypoint = self.Waypoint
	waypoint:update( event )
	local controller = event.controller
	local index = self.objId
	local objectiveName = Engine.GetObjectiveName( controller, index )
	if not objectiveName then
		return 
	end
	local properties = GetBombsiteWaypointProperties( self, controller, index )
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
end

local SDWaypointContainer_UpdateBombWaypoint = function ( self, event )
	if SDWaypointContainer_IsVisible( self, event ) == false then
		return 
	end
	local controller = event.controller
	local index = self.objId
	local waypoint = self.Waypoint
	local objectiveEntity = Engine.GetObjectiveEntity( controller, index )
	if objectiveEntity then
		waypoint.zOffset = self.waypoint_player_z_offset
	else
		waypoint.zOffset = self.waypoint_z_offset
	end
	local properties = GetBombWaypointProperties( self, controller, index )
	local shouldShow = SDWaypointContainer_ShouldShowBomb( self, controller )
	if shouldShow == true then
		if properties.imagename then
			waypoint.WaypointCenter.waypointCenterImage:setImage( RegisterMaterial( properties.imagename ) )
			local minimapIcon = properties.imagename .. "_mini"
			waypoint:setCompassObjectiveIcon( controller, index, minimapIcon )
		end
		if properties.waypointType then
			waypoint.waypointType:setText( Engine.Localize( properties.waypointType ) )
		end
		waypoint:update( event )
	else
		self:hide()
		waypoint:clearCompassObjectiveIcon( controller, index )
	end
end

local SDWaypointContainer_Update = function ( self, event )
	local objectiveName = Engine.GetObjectiveName( event.controller, self.objId )
	if objectiveName == "sd_bomb" then
		SDWaypointContainer_UpdateBombWaypoint( self, event )
	else
		SDWaypointContainer_UpdateBombsiteWaypoint( self, event )
	end
end

local SDWaypointContainer_SetupWaypointContainer = function ( self, event )
	if event.objId then
		self.objId = event.objId
		local waypoint = self.Waypoint
		waypoint.objective = self.objective
		waypoint:setupWaypoint( event )
		local objectiveName = Engine.GetObjectiveName( event.controller, self.objId )
		if objectiveName == "sd_bomb" then
			self.waypoint_label_bomb = Engine.StructTableLookupString( "objectives", "id", objectiveName, "waypoint_label_bomb" )
			self.waypoint_label_defend = Engine.StructTableLookupString( "objectives", "id", objectiveName, "waypoint_label_defend" )
			self.waypoint_image_bomb = Engine.StructTableLookupString( "objectives", "id", objectiveName, "waypoint_image_bomb" )
			self.waypoint_image_defend = Engine.StructTableLookupString( "objectives", "id", objectiveName, "waypoint_image_defend" )
			self.waypoint_player_z_offset = Engine.StructTableLookupNumber( "objectives", "id", objectiveName, "waypoint_player_z_offset" )
			self.waypoint_z_offset = Engine.StructTableLookupNumber( "objectives", "id", objectiveName, "waypoint_z_offset" )
		else
			self.waypoint_label_target = Engine.StructTableLookupString( "objectives", "id", objectiveName, "waypoint_label_target" )
			self.waypoint_label_defuse = Engine.StructTableLookupString( "objectives", "id", objectiveName, "waypoint_label_defuse" )
			self.waypoint_label_defend = Engine.StructTableLookupString( "objectives", "id", objectiveName, "waypoint_label_defend" )
			self.waypoint_image_defuse = Engine.StructTableLookupString( "objectives", "id", objectiveName, "waypoint_image_defuse" )
			self.waypoint_image_target = Engine.StructTableLookupString( "objectives", "id", objectiveName, "waypoint_image_target" )
			self.waypoint_image_defend = Engine.StructTableLookupString( "objectives", "id", objectiveName, "waypoint_image_defend" )
		end
	end
end

local PostLoadFunc = function ( self )
	self.update = SDWaypointContainer_Update
	self.setupWaypointContainer = SDWaypointContainer_SetupWaypointContainer
	self.bombPlanted = 1
end

CoD.SDWaypointContainer = InheritFrom( LUI.UIElement )
CoD.SDWaypointContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SDWaypointContainer )
	self.id = "SDWaypointContainer"
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
		CoD.SDWaypointContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

