CoD.PanelManager = {}
CoD.PanelManager.FadeInTime = 250
CoD.PanelManager.FadeOutTime = 150
CoD.PanelManager.PanelSound = "uin_navigation_select_main"
CoD.PanelManager.SlideTime = 300
CoD.PanelManager.FetchingDone = function ( self, event )
	if not self.slidingEnabledTimer then
		self.slidingEnabled = true
	end
	self:dispatchEventToChildren( event )
end

CoD.PanelManager.EnableSliding = function ( self, event )
	self.slidingEnabled = true
	if self.slidingEnabledTimer then
		self.slidingEnabledTimer = nil
	end
end

CoD.PanelManager.SetSlidingAllowed = function ( self, slidingAllowed )
	self.slidingAllowed = slidingAllowed
end

CoD.PanelManager.New = function ( ownerController, width, height )
	local panelManager = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	} )
	panelManager.id = "PanelManager"
	panelManager.width = width
	panelManager.height = height
	panelManager.m_ownerController = ownerController
	panelManager.panels = {}
	panelManager.orderedPanels = {}
	panelManager.createPanel = CoD.PanelManager.CreatePanel
	panelManager.openPanel = CoD.PanelManager.OpenPanel
	panelManager.closePanel = CoD.PanelManager.ClosePanel
	panelManager.getPanel = CoD.PanelManager.GetPanel
	panelManager.isPanelOnscreen = CoD.PanelManager.IsPanelOnscreen
	panelManager.setSlidingAllowed = CoD.PanelManager.SetSlidingAllowed
	panelManager:registerEventHandler( "destroy_panel", CoD.PanelManager.DestroyPanel )
	panelManager:registerEventHandler( "gamepad_button", CoD.PanelManager.GamepadButton )
	panelManager:registerEventHandler( "fetching_done", CoD.PanelManager.FetchingDone )
	panelManager:registerEventHandler( "enable_sliding", CoD.PanelManager.EnableSliding )
	return panelManager
end

CoD.PanelManager.AddPanelElements = function ( self )
	if self.body ~= nil then
		error( "PanelManager: BODY ALREADY EXISTS ON PANEL!" )
	end
	self.body = LUI.UIElement.new( {
		left = 0,
		top = 0,
		bottom = 0,
		right = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	} )
	self:addElement( self.body )
	self.body:registerAnimationState( "left_offscreen", self.m_animationStates.left_offscreen )
	self.body:registerAnimationState( "left_onscreen", self.m_animationStates.left_onscreen )
	self.body:registerAnimationState( "right_offscreen", self.m_animationStates.right_offscreen )
	self.body:registerAnimationState( "right_onscreen", self.m_animationStates.right_onscreen )
end

CoD.PanelManager.CreatePanel = function ( self, panelName, defaultState )
	local panel = self.panels[panelName]
	if panel ~= nil then
		error( "LUI Error: panel " .. panelName .. " already exist." )
		return 
	end
	local width = self.width / 2
	local height = self.height / 2
	if defaultState == nil then
		defaultState = "left"
	end
	local defaultAnimStates = {
		left_offscreen = {
			left = -640 - width,
			top = 0,
			right = -640,
			bottom = 0,
			leftAnchor = false,
			topAnchor = true,
			rightAnchor = false,
			bottomAnchor = true
		},
		left_onscreen = {
			left = 0,
			top = 0,
			right = width,
			bottom = 0,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = false,
			bottomAnchor = true
		},
		right_offscreen = {
			left = 640,
			top = 0,
			right = 640 + width,
			bottom = 0,
			leftAnchor = false,
			topAnchor = true,
			rightAnchor = false,
			bottomAnchor = true
		},
		right_onscreen = {
			left = -width,
			top = 0,
			right = 0,
			bottom = 0,
			leftAnchor = false,
			topAnchor = true,
			rightAnchor = true,
			bottomAnchor = true
		},
		top_offscreen = {
			left = 0,
			top = -height,
			right = 0,
			bottom = 0,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = true,
			bottomAnchor = false
		},
		top_onscreen = {
			left = 0,
			top = 0,
			right = 0,
			bottom = height,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = true,
			bottomAnchor = false
		},
		bottom_offscreen = {
			left = 0,
			top = 0,
			right = 0,
			bottom = height,
			leftAnchor = true,
			topAnchor = false,
			rightAnchor = true,
			bottomAnchor = true
		},
		bottom_onscreen = {
			left = 0,
			top = -height,
			right = 0,
			bottom = 0,
			leftAnchor = true,
			topAnchor = false,
			rightAnchor = true,
			bottomAnchor = true
		}
	}
	panel = LUI.UIElement.new( defaultAnimStates[defaultState .. "_offscreen"] )
	panel.id = "PanelManager." .. panelName
	panel:registerAnimationState( "left_offscreen", defaultAnimStates.left_offscreen )
	panel:registerAnimationState( "left_onscreen", defaultAnimStates.left_onscreen )
	panel:registerAnimationState( "right_offscreen", defaultAnimStates.right_offscreen )
	panel:registerAnimationState( "right_onscreen", defaultAnimStates.right_onscreen )
	panel:registerAnimationState( "top_offscreen", defaultAnimStates.top_offscreen )
	panel:registerAnimationState( "top_onscreen", defaultAnimStates.top_onscreen )
	panel:registerAnimationState( "bottom_offscreen", defaultAnimStates.bottom_offscreen )
	panel:registerAnimationState( "bottom_onscreen", defaultAnimStates.bottom_onscreen )
	self.panels[panelName] = panel
	self:addElement( panel )
	table.insert( self.orderedPanels, panel )
	panel.defaultState = defaultState
	panel.state = defaultState
	panel.panelManager = self
	return panel
end

CoD.PanelManager.OpenPanel = function ( self, panelName, openState, originState, duration )
	local panel = self.panels[panelName]
	if panel == nil then
		error( "LUI Error: panel " .. panelName .. " does not exist." )
		return 
	elseif duration == nil then
		duration = CoD.PanelManager.FadeInTime
	end
	if openState == nil then
		if panel.defaultState == nil then
			openState = "left"
		else
			openState = panel.defaultState
		end
	end
	if originState ~= nil and panel.active ~= true then
		panel:animateToState( originState .. "_offscreen", 0 )
	elseif panel.active ~= true and panel.state ~= nil and panel.state ~= openState then
		panel:animateToState( openState .. "_offscreen", 0 )
	end
	panel.state = openState
	panel.active = true
	panel:processEvent( {
		name = "on_activate",
		controller = controller
	} )
	panel:animateToState( openState .. "_onscreen", duration, true, true )
	Engine.PlaySound( CoD.PanelManager.PanelSound )
end

CoD.PanelManager.ClosePanel = function ( self, panelName, closeState, dispose, duration )
	local panel = self.panels[panelName]
	if panel == nil then
		error( "LUI Error: panel " .. panelName .. " does not exist." )
		return 
	elseif duration == nil then
		duration = CoD.PanelManager.FadeOutTime
	end
	if closeState == nil then
		if panel.state ~= nil then
			closeState = panel.state
		elseif panel.defaultState == nil then
			closeState = "left"
		else
			closeState = panel.defaultState
		end
	end
	panel:animateToState( closeState .. "_offscreen", duration, true, true )
	if dispose == true then
		panel:processEvent( {
			name = "on_deactivate",
			controller = controller
		} )
		panel:addElement( LUI.UITimer.new( duration, {
			name = "destroy_panel",
			panelName = panelName
		}, true, self ) )
	else
		panel:processEvent( {
			name = "lose_focus"
		} )
		panel:processEvent( {
			name = "on_deactivate"
		} )
	end
	panel.active = nil
	Engine.PlaySound( CoD.PanelManager.PanelSound )
end

CoD.PanelManager.DestroyPanel = function ( self, event )
	local panelName = event.panelName
	if self.panels[panelName] ~= nil then
		self.panels[panelName]:close()
		self.panels[panelName] = nil
	end
end

CoD.PanelManager.GetPanel = function ( self, panelName )
	return self.panels[panelName]
end

CoD.PanelManager.IsPanelOnscreen = function ( self, panelName )
	local panel = self.panels[panelName]
	if panel == nil then
		return false
	elseif self.orderedPanels[self.currentPanelIndex] == panel then
		return true
	elseif self.orderedPanels[self.currentPanelIndex + 1] == panel then
		return true
	else
		return false
	end
end

CoD.PanelManager.ClosePanelBody = function ( self )
	if self.body == nil then
		error( "LUI Error: body of panel " .. self.id .. " does not exist." )
		return 
	else
		self.body:close()
		self.body = nil
		self:registerEventHandler( "transition_complete_left_offscreen", nil )
		self:registerEventHandler( "transition_complete_right_offscreen", nil )
	end
end

CoD.PanelManager.BuildPanel = function ( self, panel )
	panel:addPanelElements()
	panel:populatePanelElements()
	if not panel:restoreState() then
		panel:setFocusPanelElements()
	end
end

CoD.PanelManager.RebuildPanel = function ( self, panelName )
	local panel = self.panels[panelName]
	if panel == nil then
		error( "LUI Error: panel " .. panelName .. " does not exist." )
		return 
	else
		CoD.PanelManager.ClosePanelBody( panel )
		CoD.PanelManager.BuildPanel( self, panel )
	end
end

CoD.PanelManager.StartSlidingTimer = function ( self )
	self.slidingEnabled = false
	self.slidingEnabledTimer = LUI.UITimer.new( CoD.PanelManager.SlideTime + 5, "enable_sliding", true )
	self:addElement( self.slidingEnabledTimer )
end

CoD.PanelManager.SlidePanelOffscreen = function ( self, panel, direction )
	local animationState = direction .. "_offscreen"
	panel:registerEventHandler( "transition_complete_" .. animationState, CoD.PanelManager.ClosePanelBody )
	panel:animateToState( animationState, CoD.PanelManager.SlideTime, true, true )
	panel:processEvent( {
		name = "sliding_offscreen",
		position = animationState
	} )
end

CoD.PanelManager.SlidePanel = function ( self, panel, direction )
	local animationState = direction .. "_onscreen"
	panel:animateToState( animationState, CoD.PanelManager.SlideTime, true, true )
	panel:processEvent( {
		name = "sliding_onscreen",
		position = animationState
	} )
end

CoD.PanelManager.SlidePanelOnscreen = function ( self, panel, direction )
	panel:addPanelElements()
	panel:populatePanelElements( true )
	CoD.PanelManager.SlidePanel( self, panel, direction )
end

CoD.PanelManager.SetPanelCurrent = function ( self, panelIndex )
	local oldPanel = self.orderedPanels[self.currentPanelIndex]
	oldPanel:saveState()
	oldPanel:processEvent( {
		name = "lose_focus"
	} )
	self.currentPanelIndex = panelIndex
	local panel = self.orderedPanels[panelIndex]
	if not panel:restoreState() then
		panel:setFocusPanelElements()
	end
	self:dispatchEventToParent( {
		name = "current_panel_changed",
		id = panel.id,
		titleText = panel.titleText
	} )
	Engine.PlaySound( "uin_navigation_wipe" )
end

CoD.PanelManager.SlidePanelsLeft = function ( self, event )
	if self.orderedPanels[self.currentPanelIndex - 1] ~= nil then
		CoD.PanelManager.StartSlidingTimer( self )
		CoD.PanelManager.SlidePanelOffscreen( self, self.orderedPanels[self.currentPanelIndex + 1], "right" )
		CoD.PanelManager.SlidePanel( self, self.orderedPanels[self.currentPanelIndex], "right" )
		CoD.PanelManager.SlidePanelOnscreen( self, self.orderedPanels[self.currentPanelIndex - 1], "left" )
		self.orderedPanels[self.currentPanelIndex]:processEvent( {
			name = "slide_left",
			isCurrentPanel = false
		} )
		self.orderedPanels[self.currentPanelIndex - 1]:processEvent( {
			name = "slide_left",
			isCurrentPanel = true
		} )
		CoD.PanelManager.SetPanelCurrent( self, self.currentPanelIndex - 1 )
		Engine.PlaySound( "cac_screen_hpan" )
	end
end

CoD.PanelManager.SlidePanelsRight = function ( self, event )
	if self.orderedPanels[self.currentPanelIndex + 2] ~= nil then
		CoD.PanelManager.StartSlidingTimer( self )
		CoD.PanelManager.SlidePanelOffscreen( self, self.orderedPanels[self.currentPanelIndex], "left" )
		CoD.PanelManager.SlidePanel( self, self.orderedPanels[self.currentPanelIndex + 1], "left" )
		CoD.PanelManager.SlidePanelOnscreen( self, self.orderedPanels[self.currentPanelIndex + 2], "right" )
		self.orderedPanels[self.currentPanelIndex + 1]:processEvent( {
			name = "slide_right",
			isCurrentPanel = true
		} )
		self.orderedPanels[self.currentPanelIndex + 2]:processEvent( {
			name = "slide_right",
			isCurrentPanel = false
		} )
		CoD.PanelManager.SetPanelCurrent( self, self.currentPanelIndex + 1 )
		Engine.PlaySound( "cac_screen_hpan" )
	end
end

CoD.PanelManager.GamepadButton = function ( self, event )
	if self.slidingAllowed ~= false and self.slidingEnabled == true and self.orderedPanels ~= nil and event.down == true then
		for index, pane in pairs( self.orderedPanels ) do
			self.orderedPanels[index].controller = event.controller
		end
		if self.currentPanelIndex ~= nil then
			if event.button == "left" then
				self.slideToStatsPaneEnabled = true
				CoD.PanelManager.SlidePanelsLeft( self )
			elseif event.button == "right" and self.slideToStatsPaneEnabled ~= false then
				CoD.PanelManager.SlidePanelsRight( self )
			end
		end
	end
	return self:dispatchEventToChildren( event )
end

