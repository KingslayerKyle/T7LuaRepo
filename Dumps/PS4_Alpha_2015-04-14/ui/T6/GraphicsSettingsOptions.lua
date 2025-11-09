require( "ui.T6.Options" )

CoD.GraphicsSettings = {}
CoD.GraphicsSettings.Button_SafeArea = function ( self, event )
	self:dispatchEventToParent( {
		name = "open_safe_area",
		controller = event.controller
	} )
end

CoD.GraphicsSettings.OpenSafeArea = function ( self, event )
	self:saveState()
	self:openMenu( "SafeArea", event.controller )
	self:close()
end

CoD.GraphicsSettings.Button_Brightness = function ( self, event )
	if self.buttonHasFocus and not self.disabled then
		self:dispatchEventToParent( {
			name = "open_brightness",
			controller = event.controller
		} )
	end
	return true
end

CoD.GraphicsSettings.OpenBrightness = function ( self, event )
	self:saveState()
	local userData = {}
	if self.buttonList ~= nil then
		userData.height = CoD.GraphicsSettings.ListHeight
	end
	self:openMenu( "Brightness", event.controller, userData )
	self:close()
end

CoD.GraphicsSettings.Open3D = function ( self, event )
	if Dvar.r_stereo3DAvailable:get() == false or Dvar.r_dualPlayEnable:get() == true or Dvar.r_anaglyphFX_enable:get() == true then
		return 
	else
		self:saveState()
		self:openMenu( "Stereoscopic3D", event.controller )
		self:close()
	end
end

CoD.GraphicsSettings.Button_Stereoscopic3D = function ( self, event )
	if self.buttonHasFocus and not self.disabled then
		self:dispatchEventToParent( {
			name = "open_3d",
			controller = event.controller
		} )
	end
	return true
end

CoD.GraphicsSettings.OpenDualView = function ( self, event )
	self:saveState()
	self:openMenu( "DualViewMenu", event.controller )
	self:close()
end

CoD.GraphicsSettings.Button_DualView = function ( self, event )
	if self.buttonHasFocus and not self.disabled then
		self:dispatchEventToParent( {
			name = "open_dual_view",
			controller = event.controller
		} )
	end
	return true
end

CoD.GraphicsSettings.AnaglyphSelectionChangedCallback = function ( self )
	Engine.SetDvar( self.parentSelectorButton.m_dvarName, self.value )
	self.parentSelectorButton:dispatchEventToParent( {
		name = "update_buttonlist"
	} )
end

CoD.GraphicsSettings.UpdateButtonList = function ( self, event )
	if self.stereoscopic3dButton then
		if Dvar.r_stereo3DAvailable:get() == false or Dvar.r_dualPlayEnable:get() == true or Dvar.r_anaglyphFX_enable:get() == true then
			self.stereoscopic3dButton:disable()
		else
			self.stereoscopic3dButton:enable()
		end
	end
	if self.dualViewButton then
		if Dvar.r_stereo3DOn:get() == true or Dvar.r_anaglyphFX_enable:get() == true then
			self.dualViewButton:disable()
		else
			self.dualViewButton:enable()
		end
	end
end

CoD.GraphicsSettings.AddBackButtonTimer = function ( self, event )
	self:addBackButton()
	self.backButtonTimer:close()
	self.backButtonTimer = nil
end

LUI.createMenu.GraphicsSettings = function ( controller, userData )
	local graphicsSettingsMenu = nil
	if Engine.IsInGame() then
		graphicsSettingsMenu = CoD.InGameMenu.New( "GraphicsSettings", controller, Engine.Localize( "MENU_GRAPHICS_SETTINGS_CAPS" ), CoD.isSinglePlayer )
		if CoD.isSinglePlayer == false and Engine.IsInGame() and Engine.IsSplitscreen() == true then
			graphicsSettingsMenu:sizeToSafeArea( controller )
			graphicsSettingsMenu:updateTitleForSplitscreen()
			graphicsSettingsMenu:updateButtonPromptBarsForSplitscreen()
		end
	else
		graphicsSettingsMenu = CoD.Menu.New( "GraphicsSettings" )
		local background = LUI.UIImage.new( {
			leftAnchor = false,
			rightAnchor = false,
			left = -640,
			right = 640,
			topAnchor = false,
			bottomAnchor = false,
			top = -360,
			bottom = 360,
			red = 0,
			green = 0,
			blue = 0,
			alpha = 1
		} )
		background:setPriority( -100 )
		graphicsSettingsMenu:addElement( background )
		graphicsSettingsMenu:setOwner( controller )
		graphicsSettingsMenu:addTitle( Engine.Localize( "MENU_GRAPHICS_SETTINGS_CAPS" ) )
		if CoD.isSinglePlayer == false then
			graphicsSettingsMenu:addLargePopupBackground()
			graphicsSettingsMenu:registerEventHandler( "signed_out", CoD.Menu.SignedOut )
		end
	end
	graphicsSettingsMenu:setPreviousMenu( "OptionsMenu" )
	graphicsSettingsMenu.controller = controller
	graphicsSettingsMenu:setOwner( controller )
	graphicsSettingsMenu:registerEventHandler( "open_safe_area", CoD.GraphicsSettings.OpenSafeArea )
	graphicsSettingsMenu:registerEventHandler( "open_brightness", CoD.GraphicsSettings.OpenBrightness )
	graphicsSettingsMenu:registerEventHandler( "open_3d", CoD.GraphicsSettings.Open3D )
	graphicsSettingsMenu:registerEventHandler( "open_dual_view", CoD.GraphicsSettings.OpenDualView )
	graphicsSettingsMenu:registerEventHandler( "update_buttonlist", CoD.GraphicsSettings.UpdateButtonList )
	if CoD.isSinglePlayer == true and CoD.perController[controller].firstTime then
		graphicsSettingsMenu.acceptButton = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_ACCEPT" ), graphicsSettingsMenu, "accept_button" )
		graphicsSettingsMenu:addLeftButtonPrompt( graphicsSettingsMenu.acceptButton )
		graphicsSettingsMenu:registerEventHandler( "accept_button", CoD.GraphicsSettings.CloseFirstTime )
		graphicsSettingsMenu:registerEventHandler( "remove_accept_button", CoD.GraphicsSettings.RemoveAcceptButton )
		graphicsSettingsMenu:registerEventHandler( "readd_accept_button", CoD.GraphicsSettings.ReaddAcceptButton )
		CoD.GraphicsSettings.ListHeight = 421.25
	else
		graphicsSettingsMenu:addSelectButton()
		graphicsSettingsMenu:registerEventHandler( "add_back_button", CoD.GraphicsSettings.AddBackButtonTimer )
		graphicsSettingsMenu.backButtonTimer = LUI.UITimer.new( 350, {
			name = "add_back_button",
			controller = controller
		} )
		graphicsSettingsMenu:addElement( graphicsSettingsMenu.backButtonTimer )
	end
	graphicsSettingsMenu.close = CoD.Options.Close
	graphicsSettingsMenu.graphicsListButtons = {}
	local buttonListLeft = 0
	if Engine.IsInGame() and CoD.isSinglePlayer == false and Engine.IsSplitscreen() == true then
		buttonListLeft = CoD.Menu.SplitscreenSideOffset
	end
	local buttonList = CoD.ButtonList.new()
	buttonList:setLeftRight( true, false, buttonListLeft, buttonListLeft + CoD.Options.Width )
	buttonList:setTopBottom( true, false, CoD.Menu.TitleHeight, CoD.Menu.TitleHeight + 720 )
	if CoD.isSinglePlayer then
		graphicsSettingsMenu:addElement( buttonList )
		if userData and userData.height ~= nil then
			buttonList:setLeftRight( false, false, -CoD.Options.Width / 2, CoD.Options.Width / 2 )
			buttonList:setTopBottom( false, false, -userData.height / 2, userData.height / 2 )
			CoD.GraphicsSettings.ListHeight = userData.height
		elseif CoD.GraphicsSettings.ListHeight then
			buttonList:setLeftRight( false, false, -CoD.Options.Width / 2, CoD.Options.Width / 2 )
			buttonList:setTopBottom( false, false, -CoD.GraphicsSettings.ListHeight / 2, CoD.GraphicsSettings.ListHeight / 2 )
		end
	else
		local buttonListScaleContainer = CoD.SplitscreenScaler.new( nil, 1.5 )
		buttonListScaleContainer:setLeftRight( true, false, 0, 0 )
		buttonListScaleContainer:setTopBottom( true, false, 0, 0 )
		graphicsSettingsMenu:addElement( buttonListScaleContainer )
		buttonListScaleContainer:addElement( buttonList )
	end
	if CoD.isPS4 == false and (Engine.SplitscreenNum() == 1 or Engine.IsPrimaryLocalClient( controller ) and not Engine.IsInGame()) then
		graphicsSettingsMenu.safeAreaButton = buttonList:addButton( Engine.Localize( "MENU_SAFE_AREA_CAPS" ), Engine.Localize( "MENU_SAFE_AREA_DESC" ) )
		graphicsSettingsMenu.safeAreaButton:registerEventHandler( "button_action", CoD.GraphicsSettings.Button_SafeArea )
		table.insert( graphicsSettingsMenu.graphicsListButtons, graphicsSettingsMenu.safeAreaButton )
	end
	if Engine.SplitscreenNum() == 1 or Engine.IsPrimaryLocalClient( controller ) then
		graphicsSettingsMenu.brightnessButton = buttonList:addButton( Engine.Localize( "MENU_BRIGHTNESS_CAPS" ), Engine.Localize( "MENU_BRIGHTNESS_DESC" ) )
		graphicsSettingsMenu.brightnessButton:registerEventHandler( "button_action", CoD.GraphicsSettings.Button_Brightness )
		table.insert( graphicsSettingsMenu.graphicsListButtons, graphicsSettingsMenu.brightnessButton )
	end
	if not CoD.isWIIU then
		graphicsSettingsMenu.anaglyphButton = buttonList:addDvarLeftRightSelector( controller, Engine.Localize( "MENU_ANAGLYPH_3D_CAPS" ), "r_anaglyphFX_enable", Engine.Localize( "MENU_ANAGLYPH_3D_DESC" ) )
		graphicsSettingsMenu.anaglyphButton:addChoice( controller, Engine.Localize( "MENU_DISABLED_CAPS" ), 0, nil, CoD.GraphicsSettings.AnaglyphSelectionChangedCallback )
		graphicsSettingsMenu.anaglyphButton:addChoice( controller, Engine.Localize( "MENU_ENABLED_CAPS" ), 1, nil, CoD.GraphicsSettings.AnaglyphSelectionChangedCallback )
		table.insert( graphicsSettingsMenu.graphicsListButtons, graphicsSettingsMenu.anaglyphButton )
		if true == Dvar.r_stereo3DOn:get() or true == Dvar.r_dualPlayEnable:get() then
			graphicsSettingsMenu.anaglyphButton:disable()
		end
	end
	if not Engine.IsBetaBuild() and not Engine.IsInGame() then
		graphicsSettingsMenu.stereoscopic3dButton = buttonList:addButton( Engine.Localize( "MENU_STEREO_3D_SETTINGS_CAPS" ), Engine.Localize( "MENU_STEREO_3D_SETTINGS_DESC" ) )
		table.insert( graphicsSettingsMenu.graphicsListButtons, graphicsSettingsMenu.stereoscopic3dButton )
		graphicsSettingsMenu.stereoscopic3dButton:registerEventHandler( "button_action", CoD.GraphicsSettings.Button_Stereoscopic3D )
		if false == Dvar.r_stereo3DAvailable:get() or true == Dvar.r_dualPlayEnable:get() or true == Dvar.r_anaglyphFX_enable:get() then
			graphicsSettingsMenu.stereoscopic3dButton:disable()
		end
	end
	if not CoD.isWIIU then
		graphicsSettingsMenu.drawCrosshairButton = buttonList:addProfileLeftRightSelector( controller, Engine.Localize( "MENU_DRAW_CROSSHAIR" ), "cg_drawCrosshair3D", Engine.Localize( "MENU_DRAW_CROSSHAIR_DESC" ) )
		CoD.Options.Button_AddChoices_EnabledOrDisabled( graphicsSettingsMenu.drawCrosshairButton )
		table.insert( graphicsSettingsMenu.graphicsListButtons, graphicsSettingsMenu.drawCrosshairButton )
	end
	if not CoD.isWIIU and CoD.isSinglePlayer == false and not Engine.IsInGame() then
		graphicsSettingsMenu.dualViewButton = buttonList:addButton( Engine.Localize( "MENU_DUAL_VIEW_SETTINGS_CAPS" ), Engine.Localize( "MENU_DUAL_VIEW_SETTINGS_DESC" ) )
		graphicsSettingsMenu.dualViewButton:registerEventHandler( "button_action", CoD.GraphicsSettings.Button_DualView )
		table.insert( graphicsSettingsMenu.graphicsListButtons, graphicsSettingsMenu.dualViewButton )
		if true == Dvar.r_stereo3DOn:get() or true == Dvar.r_anaglyphFX_enable:get() then
			graphicsSettingsMenu.dualViewButton:disable()
		end
	end
	if CoD.useController and not graphicsSettingsMenu:restoreState() then
		graphicsSettingsMenu.graphicsListButtons[1]:processEvent( {
			name = "gain_focus"
		} )
	end
	graphicsSettingsMenu.buttonList = buttonList
	return graphicsSettingsMenu
end

