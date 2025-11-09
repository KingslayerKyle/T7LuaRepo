require( "ui.uieditor.widgets.MPHudWidgets.Waypoint" )

local GenericWaypointContainer_SetupWaypointContainer = function ( self, event )
	if event.objId then
		self.objId = event.objId
		local waypoint = self.Waypoint
		waypoint.objective = self.objective
		waypoint:setupWaypoint( event )
		if waypoint.waypoint_image_default == nil then
			if waypoint.waypoint_label_default == "" then
				waypoint:setState( "NoIconOrText" )
			else
				waypoint:setState( "NoIcon" )
			end
		else
			waypoint:setState( "Default" )
			waypoint.WaypointCenter.waypointCenterImage:setImage( RegisterImage( waypoint.waypoint_image_default ) )
		end
		if waypoint.objective.hide_arrow then
			waypoint.WaypointArrowContainer:setState( "Invisible" )
		end
		waypoint.waypointType:setText( Engine.Localize( waypoint.waypoint_label_default ) )
	end
end

local GenericWaypointContainer_Update = function ( self, event )
	self.Waypoint:update( event )
	if event.objState ~= nil then
		if event.objState == CoD.OBJECTIVESTATE_DONE then
			self:setState( "Done" )
		else
			self:setState( "Default" )
		end
		if self.visible == true then
			self:show()
		else
			self:hide()
		end
	end
end

local GenericWaypointContainer_ShouldShow = function ( self, event )
	local controller = event.controller
	local waypoint = self.Waypoint
	local objectiveTeam = Engine.GetObjectiveTeam( controller, self.objId )
	if objectiveTeam == Enum.team_t.TEAM_FREE or objectiveTeam == Enum.team_t.TEAM_NEUTRAL then
		return true
	else
		return waypoint:isOwnedByMyTeam( controller )
	end
end

local PostLoadFunc = function ( self )
	self.update = GenericWaypointContainer_Update
	self.shouldShow = GenericWaypointContainer_ShouldShow
	self.setupWaypointContainer = GenericWaypointContainer_SetupWaypointContainer
end

CoD.GenericWaypointContainer = InheritFrom( LUI.UIElement )
CoD.GenericWaypointContainer.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GenericWaypointContainer )
	self.id = "GenericWaypointContainer"
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
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Waypoint:completeAnimation()
				self.Waypoint:setAlpha( 1 )
				self.clipFinished( Waypoint, {} )
			end
		},
		Done = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local WaypointFrame2 = function ( Waypoint, event )
					if not event.interrupted then
						Waypoint:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					Waypoint:setAlpha( 0 )
					if event.interrupted then
						self.clipFinished( Waypoint, event )
					else
						Waypoint:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Waypoint:completeAnimation()
				self.Waypoint:setAlpha( 1 )
				WaypointFrame2( Waypoint, {} )
			end
		}
	}
	self.close = function ( self )
		self.Waypoint:close()
		CoD.GenericWaypointContainer.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

