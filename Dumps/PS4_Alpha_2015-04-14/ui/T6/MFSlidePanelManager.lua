local MFSlidePanelManager_CreatePanel, MFSlidePanelManager_OpenPanel, MFSlidePanelManager_ClosePanel, MFSlidePanelManager_DestroyPanel, MFSlidePanelManager_GetPanel, MFSlidePanelManager_GamepadButton = nil
CoD.MFSlidePanelManager = {}
CoD.MFSlidePanelManager.FadeInTime = 250
CoD.MFSlidePanelManager.FadeOutTime = 150
CoD.MFSlidePanelManager.PanelSound = "uin_navigation_select_main"
CoD.MFSlidePanelManager.SlideTime = 300
local MFSlidePanelManager_FetchingDone = function ( self, event )
	self.slidingAllowed = true
	self:dispatchEventToChildren( event )
end

local MFSlidePanelManager_AllowSliding = function ( self, event )
	self.slidingAllowed = true
end

local MFSlidePanelManager_SetSlide = function ( self, slide )
	self.slide = slide
end

CoD.MFSlidePanelManager.new = function ()
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
	panelManager.id = "MFSlidePanelManager"
	panelManager.panels = {}
	panelManager.orderedPanels = {}
	panelManager.createPanel = MFSlidePanelManager_CreatePanel
	panelManager.openPanel = MFSlidePanelManager_OpenPanel
	panelManager.closePanel = MFSlidePanelManager_ClosePanel
	panelManager.getPanel = MFSlidePanelManager_GetPanel
	panelManager.setSlide = MFSlidePanelManager_SetSlide
	panelManager.isPanelOnscreen = MFSlidePanelManager_IsPanelOnscreen
	panelManager:registerEventHandler( "destroy_panel", MFSlidePanelManager_DestroyPanel )
	panelManager:registerEventHandler( "gamepad_button", MFSlidePanelManager_GamepadButton )
	panelManager:registerEventHandler( "fetching_done", MFSlidePanelManager_FetchingDone )
	panelManager:registerEventHandler( "allow_sliding", MFSlidePanelManager_AllowSliding )
	return panelManager
end

CoD.MFSlidePanelManager.AddPanelElements = function ( self )
	if self.body ~= nil then
		error( "MFSlidePanelManager: BODY ALREADY EXISTS ON PANEL!" )
	end
	self.body = CoD.MFSlidePanel.new( {
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

MFSlidePanelManager_CreatePanel = function ( self, panelName, defaultState )
	local panel = self.panels[panelName]
	if panel ~= nil then
		error( "LUI Error: panel " .. panelName .. " already exist." )
		return 
	end
	local width = 0
	local height = 0
	if Engine.IsInGame() then
		width = self.slide.width / 2
		height = self.slide.height / 2
	else
		width = self.slide.slideContainer.slideWidth / 2
		height = self.slide.slideContainer.slideHeight / 2
	end
	if defaultState == nil then
		defaultState = "left"
	end
	local defaultAnimStates = {
		left_offscreen = {
			left = -width,
			top = 0,
			right = 0,
			bottom = 0,
			leftAnchor = true,
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
			left = 0,
			top = 0,
			right = width,
			bottom = 0,
			leftAnchor = false,
			topAnchor = true,
			rightAnchor = true,
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
	panel.id = "MFSlidePanelManager." .. panelName
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
	panel.slide = self.slide
	return panel
end

MFSlidePanelManager_OpenPanel = function ( self, panelName, openState, suppressActivation, originState, duration )
	local panel = self.panels[panelName]
	if panel == nil then
		error( "LUI Error: panel " .. panelName .. " does not exist." )
		return 
	elseif duration == nil then
		duration = CoD.MFSlidePanelManager.FadeInTime
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
	if suppressActivation ~= true then
		panel:processEvent( {
			name = "on_activate",
			controller = controller
		} )
	end
	panel:animateToState( openState .. "_onscreen", duration, true, true )
	Engine.PlaySound( CoD.MFSlidePanelManager.PanelSound )
end

MFSlidePanelManager_ClosePanel = function ( self, panelName, closeState, dispose, duration )
	local controller = self.slide.m_ownerController
	local panel = self.panels[panelName]
	if panel == nil then
		error( "LUI Error: panel " .. panelName .. " does not exist." )
		return 
	elseif duration == nil then
		duration = CoD.MFSlidePanelManager.FadeOutTime
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
			name = "on_destroy",
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
			name = "on_deactivate",
			controller = controller
		} )
	end
	panel.active = nil
	Engine.PlaySound( CoD.MFSlidePanelManager.PanelSound )
end

MFSlidePanelManager_DestroyPanel = function ( self, event )
	local panelName = event.panelName
	if self.panels[panelName] ~= nil then
		self.panels[panelName]:close()
		self.panels[panelName] = nil
	end
end

MFSlidePanelManager_GetPanel = function ( self, panelName )
	return self.panels[panelName]
end

function MFSlidePanelManager_IsPanelOnscreen( self, panelName )
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

function MFSlidePanelManager_ClosePanelBody( self )
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

function MFSlidePanelManager_BuildPanel( self, panel )
	panel:addPanelElements()
	panel:populatePanelElements()
	if not panel:restoreState() then
		panel:setFocusPanelElements()
	end
end

CoD.MFSlidePanelManager.RebuildPanel = function ( self, panelName )
	local panel = self.panels[panelName]
	if panel == nil then
		error( "LUI Error: panel " .. panelName .. " does not exist." )
		return 
	else
		MFSlidePanelManager_ClosePanelBody( panel )
		MFSlidePanelManager_BuildPanel( self, panel )
	end
end

CoD.MFSlidePanelManager.StartSlidingTimer = function ( self )
	self.slidingAllowed = false
	self.allowSlidingTimer = LUI.UITimer.new( CoD.MFSlidePanelManager.SlideTime + 5, "allow_sliding", true )
	self:addElement( self.allowSlidingTimer )
end

CoD.MFSlidePanelManager.SlidePanelOffscreen = function ( self, panel, direction )
	local animationState = direction .. "_offscreen"
	panel:registerEventHandler( "transition_complete_" .. animationState, MFSlidePanelManager_ClosePanelBody )
	panel:animateToState( animationState, CoD.MFSlidePanelManager.SlideTime, true, true )
	panel:processEvent( {
		name = "sliding_offscreen",
		position = animationState
	} )
end

CoD.MFSlidePanelManager.SlidePanel = function ( self, panel, direction )
	local animationState = direction .. "_onscreen"
	panel:animateToState( animationState, CoD.MFSlidePanelManager.SlideTime, true, true )
	panel:processEvent( {
		name = "sliding_onscreen",
		position = animationState
	} )
end

CoD.MFSlidePanelManager.SlidePanelOnscreen = function ( self, panel, direction )
	panel:addPanelElements()
	panel:populatePanelElements()
	CoD.MFSlidePanelManager.SlidePanel( self, panel, direction )
end

CoD.MFSlidePanelManager.SetPanelCurrent = function ( self, panelIndex )
	local oldPanel = self.orderedPanels[self.currentPanelIndex]
	oldPanel:saveState()
	oldPanel:processEvent( {
		name = "lose_focus"
	} )
	self.currentPanelIndex = panelIndex
	local panel = self.orderedPanels[panelIndex]
	self.slide.frame.title:setText( panel.frameTitleText )
	if not panel:restoreState() then
		panel:setFocusPanelElements()
	end
	self:dispatchEventToParent( {
		name = "current_panel_changed",
		id = panel.id
	} )
	Engine.PlaySound( "uin_navigation_wipe" )
end

CoD.MFSlidePanelManager.SlidePanelsLeft = function ( self, event )
	if self.orderedPanels[self.currentPanelIndex - 1] ~= nil then
		CoD.MFSlidePanelManager.StartSlidingTimer( self )
		CoD.MFSlidePanelManager.SlidePanelOffscreen( self, self.orderedPanels[self.currentPanelIndex + 1], "right" )
		CoD.MFSlidePanelManager.SlidePanel( self, self.orderedPanels[self.currentPanelIndex], "right" )
		CoD.MFSlidePanelManager.SlidePanelOnscreen( self, self.orderedPanels[self.currentPanelIndex - 1], "left" )
		CoD.MFSlidePanelManager.SetPanelCurrent( self, self.currentPanelIndex - 1 )
	end
end

CoD.MFSlidePanelManager.SlidePanelsRight = function ( self, event )
	if self.orderedPanels[self.currentPanelIndex + 2] ~= nil then
		CoD.MFSlidePanelManager.StartSlidingTimer( self )
		CoD.MFSlidePanelManager.SlidePanelOffscreen( self, self.orderedPanels[self.currentPanelIndex], "left" )
		CoD.MFSlidePanelManager.SlidePanel( self, self.orderedPanels[self.currentPanelIndex + 1], "left" )
		CoD.MFSlidePanelManager.SlidePanelOnscreen( self, self.orderedPanels[self.currentPanelIndex + 2], "right" )
		CoD.MFSlidePanelManager.SetPanelCurrent( self, self.currentPanelIndex + 1 )
	end
end

MFSlidePanelManager_GamepadButton = function ( self, event )
	if self.slidingAllowed == true and self.orderedPanels ~= nil and event.down == true then
		for index, pane in pairs( self.orderedPanels ) do
			self.orderedPanels[index].controller = event.controller
		end
		if self.currentPanelIndex ~= nil then
			if event.button == "left" then
				CoD.MFSlidePanelManager.SlidePanelsLeft( self )
			elseif event.button == "right" then
				CoD.MFSlidePanelManager.SlidePanelsRight( self )
			end
		end
	end
	return self:dispatchEventToChildren( event )
end

