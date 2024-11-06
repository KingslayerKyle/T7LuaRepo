require( "ui.uieditor.widgets.MPHudWidgets.Waypoint" )

local SetupWaypointContainer = function ( self, event )
	if event.objId then
		self.objId = event.objId

		self.Waypoint.objective = self.objective

		self.Waypoint:setupWaypoint( event )

		if self.Waypoint.waypoint_image_default == nil then
			self.Waypoint:setState( "NoIcon" )
		else
			self.Waypoint:setState( "Default" )
			self.Waypoint.WaypointCenter.waypointCenterImage:setImage( RegisterImage( self.Waypoint.waypoint_image_default ) )
		end

		if self.Waypoint.objective.minimapMaterial ~= nil then
			Engine.SetObjectiveIcon( event.controller, self.objId, CoD.GametypeBase.mapIconType, self.Waypoint.objective.minimapMaterial )
		else
			Engine.ClearObjectiveIcon( event.controller, self.objId, CoD.GametypeBase.mapIconType )
		end

		if self.Waypoint.waypoint_label_default == "" then
			self.Waypoint.WaypointText:setState( "NoText" )
		else
			self.Waypoint.WaypointText:setState( "Default" )
		end

		if self.Waypoint.objective.hide_arrow then
			self.Waypoint.WaypointArrowContainer:setState( "Invisible" )
		end
		
		self.Waypoint.WaypointText.text:setText( Engine.Localize( self.Waypoint.waypoint_label_default ) )
	end
end

local UpdateObjective = function ( self, event )
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

local ShouldShowObjective = function ( self, event )
	local objectiveTeam = Engine.GetObjectiveTeam( event.controller, self.objId )

	if objectiveTeam == Enum.team_t.TEAM_FREE or objectiveTeam == Enum.team_t.TEAM_NEUTRAL then
		return true
	else
		return self.Waypoint:isOwnedByMyTeam( event.controller )
	end
end

local PostLoadFunc = function ( self )
	self.update = UpdateObjective
	self.shouldShow = ShouldShowObjective
	self.setupWaypointContainer = SetupWaypointContainer
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
	
	self.Waypoint = CoD.Waypoint.new( menu, controller )
	self.Waypoint:setLeftRight( true, true, 600, -600 )
	self.Waypoint:setTopBottom( true, true, 315, -315 )
	self:addElement( self.Waypoint )
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				self.Waypoint:completeAnimation()
				self.Waypoint:setAlpha( 1 )
				self.clipFinished( self.Waypoint, {} )
			end
		},
		Done = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local WaypointFrame1 = function ( element, event )
					if not event.interrupted then
						element:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end

					element:setAlpha( 0 )

					if event.interrupted then
						self.clipFinished( element, event )
					else
						element:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				self.Waypoint:completeAnimation()
				self.Waypoint:setAlpha( 1 )
				WaypointFrame1( self.Waypoint, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.Waypoint:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
