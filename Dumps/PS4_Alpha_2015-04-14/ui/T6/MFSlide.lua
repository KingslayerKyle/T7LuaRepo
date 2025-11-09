require( "ui.T6.ButtonPrompt" )
require( "ui.T6.MFSlidePanelManager" )

if CoD == nil then
	CoD = {}
end
CoD.MFSlide = {}
CoD.MFSlide.SlideColor = {
	r = 0,
	g = 0,
	b = 0,
	a = 0.1
}
CoD.MFSlide.FadeInTime = 250
CoD.MFSlide.FadeOutTime = 150
CoD.MFSlide.activated = function ( self, event )
	self.m_activated = true
	self.frame.buttonPrompts:addElement( self.body.leftButtonBar )
	self.frame.buttonPrompts:addElement( self.body.rightButtonBar )
	if self.title ~= nil and self.frame ~= nil then
		self.frame:fadeInTitle( self.title, self.fadeInTime )
	end
	if CoD.isMultiplayer then
		Engine.Exec( event.controller, "party_updateActiveMenu" )
	end
	self.m_inputDisabled = nil
	if self.frame and self.frame.buttonPrompts then
		self.frame.buttonPrompts.m_inputDisabled = nil
	end
end

CoD.MFSlide.deactivated = function ( self, event )
	if event.removeElements ~= false then
		self.removeSlideElementsTimer = LUI.UITimer.new( self.fadeOutTime, "remove_slide_elements", true )
		self:addElement( self.removeSlideElementsTimer )
	end
	self.body.leftButtonBar:close()
	self.body.rightButtonBar:close()
	self.m_inputDisabled = true
	self.m_activated = nil
end

CoD.MFSlide.OverlayOpened = function ( self )
	self:processEvent( {
		name = "slide_deactivated",
		overlay = true,
		removeElements = false
	} )
end

CoD.MFSlide.OverlayClosing = function ( self, reactivate, duration )
	if reactivate ~= true then
		
	else
		
	end
end

CoD.MFSlide.OverlayClosed = function ( self, reactivate )
	if reactivate == true then
		self:processEvent( {
			name = "slide_activated"
		} )
	end
end

CoD.MFSlide.addSlideElements = function ( self, event )
	if self.removeSlideElementsTimer ~= nil then
		self.removeSlideElementsTimer:close()
		self.removeSlideElementsTimer = nil
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
	self.body.id = self.id .. ".body"
	self:addElement( self.body )
	
	local panelManager = CoD.MFSlidePanelManager.new()
	panelManager:setSlide( self )
	self:addElement( panelManager )
	self.panelManager = panelManager
	
	self.body.leftButtonBar = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = CoD.ButtonPrompt.Height,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		spacing = 10
	} )
	self.body.leftButtonBar.m_ownerController = self.m_ownerController
	self.body.rightButtonBar = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = CoD.ButtonPrompt.Height,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		spacing = 10,
		alignment = LUI.Alignment.Right
	} )
	self.body.rightButtonBar.m_ownerController = self.m_ownerController
end

CoD.MFSlide.removeSlideElements = function ( self, event )
	if self.body ~= nil then
		self.body:close()
		self.body = nil
	end
	if self.panelManager ~= nil then
		self.panelManager:close()
		self.panelManager = nil
	end
end

CoD.MFSlide.buttonPromptBack = function ( self, event )
	if self.m_previousMenuName ~= nil then
		self.slideContainer:scrollToNamedSlide( self.m_previousMenuName, event.controller )
	end
end

local CoD_MFSlide_AddSelectButton = function ( self )
	self.selectButton = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_SELECT_CAPS" ), self )
	self.body.leftButtonBar:addElement( self.selectButton )
end

local CoD_MFSlide_AddSlideButton = function ( self )
	self.slideButton = CoD.ButtonPrompt.new( "left_stick_up", Engine.Localize( "MENU_SLIDE_CAPS" ) )
	self.body.leftButtonBar:addElement( self.slideButton )
end

local CoD_MFSlide_AddBackButton = function ( self, promptText )
	if promptText == nil then
		promptText = Engine.Localize( "MENU_BACK_CAPS" )
	end
	self.backButton = CoD.ButtonPrompt.new( "secondary", promptText, self, "button_prompt_back" )
	self.body.rightButtonBar:addElement( self.backButton )
end

local CoD_MFSlide_AddFriendsButton = function ( self )
	self.friendsButton = CoD.ButtonPrompt.new( "alt2", Engine.Localize( "MENU_FRIENDS_CAPS" ), self, "button_prompt_friends", false, nil, false, nil, "F" )
	self.body.rightButtonBar:addElement( self.friendsButton )
end

local CoD_MFSlide_AddPartyPrivacyButton = function ( self )
	self.partyPrivacyButton = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MPUI_LOBBY_PRIVACY_CAPS" ), self, "button_prompt_partyprivacy", false, nil, false, nil, "P" )
	self.body.rightButtonBar:addElement( self.partyPrivacyButton )
end

local CoD_MFSlide_AddGlassesToggleButton = function ( self )
	self.glassesToggleButton = CoD.ButtonPrompt.new( "right_trigger", Engine.Localize( "MENU_TURN_OFF_HUD_CAPS" ), self, "button_prompt_glasses_toggle", false, nil, false, "BACKSPACE", nil )
	self.body.rightButtonBar:addElement( self.glassesToggleButton )
end

local CoD_MFSlide_GamepadButton = function ( self, event )
	if self.m_inputDisabled then
		return 
	elseif self.anyControllerAllowed == true or Engine.IsControllerBeingUsed( event.controller ) then
		if self.m_ownerController == nil or self.m_ownerController == event.controller then
			return self:dispatchEventToChildren( event )
		else
			
		end
	else
		local originalName = event.name
		event.name = "unused_gamepad_button"
		local returnValue = self:dispatchEventToChildren( event )
		event.name = originalName
		return returnValue
	end
end

CoD.MFSlide.DebugReload = function ( self, event )
	if self.name == nil then
		return 
	elseif event.menuName ~= nil and event.menuName ~= self.name then
		return 
	elseif self.slideContainer == nil then
		return 
	elseif self.slideContainer.currentSlide == self and not self.m_inputDisabled then
		local newMenu = LUI.createMenu[self.name]()
		if newMenu == nil then
			return 
		end
		self.slideContainer:addSlide( newMenu, self.name )
		newMenu.m_previousMenuName = self.m_previousMenuName
		newMenu.m_ownerController = self.m_ownerController
		self.slideContainer:scrollToNamedSlide( self.name )
		self:close()
	end
end

CoD.MFSlide.OcclusionChange = function ( self, event )
	if event.occluded then
		self.m_inputDisabled = true
		self.frame.buttonPrompts.m_inputDisabled = true
	else
		self.m_inputDisabled = nil
		self.frame.buttonPrompts.m_inputDisabled = nil
		self:setBlur( false )
	end
end

CoD.MFSlide.new = function ()
	local frameWidth = 830
	local frameMenu = LUI.UIElement.new( {
		left = -frameWidth / 2,
		top = 60,
		right = frameWidth / 2,
		bottom = -60,
		xRot = 0,
		yRot = 0,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = true
	} )
	frameMenu.id = "MFSlide"
	frameMenu:setUseStencil( true )
	frameMenu:registerEventHandler( "debug_reload", CoD.MFSlide.DebugReload )
	frameMenu:registerEventHandler( "slide_activated", CoD.MFSlide.activated )
	frameMenu:registerEventHandler( "slide_deactivated", CoD.MFSlide.deactivated )
	frameMenu:registerEventHandler( "add_slide_elements", CoD.MFSlide.addSlideElements )
	frameMenu:registerEventHandler( "remove_slide_elements", CoD.MFSlide.removeSlideElements )
	frameMenu:registerEventHandler( "button_prompt_back", CoD.MFSlide.buttonPromptBack )
	frameMenu:registerEventHandler( "gamepad_button", CoD_MFSlide_GamepadButton )
	frameMenu:registerEventHandler( "occlusion_change", CoD.MFSlide.OcclusionChange )
	frameMenu.addSelectButton = CoD_MFSlide_AddSelectButton
	frameMenu.addSlideButton = CoD_MFSlide_AddSlideButton
	frameMenu.addBackButton = CoD_MFSlide_AddBackButton
	frameMenu.addFriendsButton = CoD_MFSlide_AddFriendsButton
	frameMenu.addPartyPrivacyButton = CoD_MFSlide_AddPartyPrivacyButton
	frameMenu.addGlassesToggleButton = CoD_MFSlide_AddGlassesToggleButton
	frameMenu.overlayOpened = CoD.MFSlide.OverlayOpened
	frameMenu.overlayClosing = CoD.MFSlide.OverlayClosing
	frameMenu.overlayClosed = CoD.MFSlide.OverlayClosed
	frameMenu.fadeInTime = CoD.MFSlide.FadeInTime
	frameMenu.fadeOutTime = CoD.MFSlide.FadeOutTime
	frameMenu.m_inputDisabled = true
	return frameMenu
end

