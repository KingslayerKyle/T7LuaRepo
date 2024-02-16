CoD.StickLayout = {}
CoD.StickLayout.SetTextElems = function ( stickLayoutImageContainer, choiceParams )
	stickLayoutImageContainer.textL:setText( Engine.Localize( choiceParams.extraParams.settings.textL ) )
	stickLayoutImageContainer.textR:setText( Engine.Localize( choiceParams.extraParams.settings.textR ) )
	stickLayoutImageContainer.textUL:setText( Engine.Localize( choiceParams.extraParams.settings.textUL ) )
	stickLayoutImageContainer.textUR:setText( Engine.Localize( choiceParams.extraParams.settings.textUR ) )
	stickLayoutImageContainer.textLR:setText( Engine.Localize( choiceParams.extraParams.settings.textLR ) )
	stickLayoutImageContainer.textLL:setText( Engine.Localize( choiceParams.extraParams.settings.textLL ) )
end

CoD.StickLayout.SelectionChanged = function ( choiceParams, userRequested )
	if userRequested then
		Engine.SetProfileVar( choiceParams.parentSelectorButton.m_currentController, choiceParams.parentSelectorButton.m_profileVarName, choiceParams.value )
	end
	choiceParams.parentSelectorButton:dispatchEventToParent( {
		name = "stick_layout_selection_changed",
		choiceParams = choiceParams
	} )
end

CoD.StickLayout.StickLayoutSelectionChanged = function ( self, event )
	if self.stickLayoutImageContainer ~= nil then
		CoD.StickLayout.SetTextElems( self.stickLayoutImageContainer, event.choiceParams )
		self.stickLayoutImageContainer.leftStickImage:beginAnimation( event.choiceParams.extraParams.animationState, 0 )
		if CoD.isPS4 == true or CoD.isXBOX == true then
			self.stickLayoutImageContainer.leftStickImage:setupUIStreamedImage( 0 )
			self.stickLayoutImageContainer.leftStickImage:setAlpha( 0 )
		end
		self.stickLayoutImageContainer.leftStickImage:setImage( event.choiceParams.extraParams.settings.leftStickImageMaterial )
		self.stickLayoutImageContainer.rightStickImage:beginAnimation( event.choiceParams.extraParams.animationState, 0 )
		if CoD.isPS4 == true or CoD.isXBOX == true then
			self.stickLayoutImageContainer.rightStickImage:setupUIStreamedImage( 0 )
			self.stickLayoutImageContainer.rightStickImage:setAlpha( 0 )
		end
		self.stickLayoutImageContainer.rightStickImage:setImage( event.choiceParams.extraParams.settings.rightStickImageMaterial )
	end
end

CoD.StickLayout.BuildDefaultSettings = function ( button, currInvertPitch )
	button.defaultSettings = {
		textUL = "MENU_MOVE_FORWARD",
		textUR = "MENU_LOOK_UP",
		textR = "MENU_ROTATE_LEFT_RIGHT",
		textLR = "MENU_LOOK_DOWN",
		textLL = "MENU_MOVE_BACK",
		textL = "MENU_STRAFE_LEFT_RIGHT"
	}
	if currInvertPitch == 1 then
		button.defaultSettings.textUR = "MENU_LOOK_DOWN"
		button.defaultSettings.textLR = "MENU_LOOK_UP"
	end
	button.defaultSettings.leftStickImageMaterial = CoD.StickLayout.StickMoveMaterial
	button.defaultSettings.rightStickImageMaterial = CoD.StickLayout.StickTurnMaterial
end

CoD.StickLayout.BuildSouthPawSettings = function ( button, currInvertPitch )
	button.southPawSettings = {
		textUL = "MENU_LOOK_UP",
		textUR = "MENU_MOVE_FORWARD",
		textR = "MENU_STRAFE_LEFT_RIGHT",
		textLR = "MENU_MOVE_BACK",
		textLL = "MENU_LOOK_DOWN",
		textL = "MENU_ROTATE_LEFT_RIGHT"
	}
	if currInvertPitch == 1 then
		button.southPawSettings.textUL = "MENU_LOOK_DOWN"
		button.southPawSettings.textLL = "MENU_LOOK_UP"
	end
	button.southPawSettings.leftStickImageMaterial = CoD.StickLayout.StickTurnMaterial
	button.southPawSettings.rightStickImageMaterial = CoD.StickLayout.StickMoveMaterial
end

CoD.StickLayout.BuildLegacySettings = function ( button, currInvertPitch )
	button.legacySettings = {
		textUL = "MENU_MOVE_FORWARD",
		textUR = "MENU_LOOK_UP",
		textR = "MENU_STRAFE_LEFT_RIGHT",
		textLR = "MENU_LOOK_DOWN",
		textLL = "MENU_MOVE_BACK",
		textL = "MENU_ROTATE_LEFT_RIGHT"
	}
	if currInvertPitch == 1 then
		button.legacySettings.textUR = "MENU_LOOK_DOWN"
		button.legacySettings.textLR = "MENU_LOOK_UP"
	end
	button.legacySettings.leftStickImageMaterial = CoD.StickLayout.StickMoveTurnMaterial
	button.legacySettings.rightStickImageMaterial = CoD.StickLayout.StickMoveLookMaterial
end

CoD.StickLayout.BuildLegacySouthPawSettings = function ( button, currInvertPitch )
	button.legacySouthPawSettings = {
		textUL = "MENU_LOOK_UP",
		textUR = "MENU_MOVE_FORWARD",
		textR = "MENU_ROTATE_LEFT_RIGHT",
		textLR = "MENU_MOVE_BACK",
		textLL = "MENU_LOOK_DOWN",
		textL = "MENU_STRAFE_LEFT_RIGHT"
	}
	if currInvertPitch == 1 then
		button.legacySouthPawSettings.textUL = "MENU_LOOK_DOWN"
		button.legacySouthPawSettings.textLL = "MENU_LOOK_UP"
	end
	button.legacySouthPawSettings.leftStickImageMaterial = CoD.StickLayout.StickMoveLookMaterial
	button.legacySouthPawSettings.rightStickImageMaterial = CoD.StickLayout.StickMoveTurnMaterial
end

CoD.StickLayout.AddChoices = function ( button )
	local currInvertPitch = tonumber( Engine.ProfileValueAsString( button.m_currentController, "input_invertpitch" ) )
	CoD.StickLayout.StickMoveMaterial = RegisterMaterial( "xenon_stick_move" )
	CoD.StickLayout.StickTurnMaterial = RegisterMaterial( "xenon_stick_turn" )
	CoD.StickLayout.StickMoveTurnMaterial = RegisterMaterial( "xenon_stick_move_turn" )
	CoD.StickLayout.StickMoveLookMaterial = RegisterMaterial( "xenon_stick_move_look" )
	CoD.StickLayout.BuildDefaultSettings( button, currInvertPitch )
	button:addChoice( Engine.Localize( "MENU_DEFAULT_CAPS" ), CoD.THUMBSTICK_DEFAULT, {
		settings = button.defaultSettings,
		animationState = "layout_default"
	}, CoD.StickLayout.SelectionChanged )
	CoD.StickLayout.BuildSouthPawSettings( button, currInvertPitch )
	button:addChoice( Engine.Localize( "MENU_SOUTHPAW_CAPS" ), CoD.THUMBSTICK_SOUTHPAW, {
		settings = button.southPawSettings,
		animationState = "layout_southpaw"
	}, CoD.StickLayout.SelectionChanged )
	CoD.StickLayout.BuildLegacySettings( button, currInvertPitch )
	button:addChoice( Engine.Localize( "MENU_LEGACY_CAPS" ), CoD.THUMBSTICK_LEGACY, {
		settings = button.legacySettings,
		animationState = "layout_legacy"
	}, CoD.StickLayout.SelectionChanged )
	CoD.StickLayout.BuildLegacySouthPawSettings( button, currInvertPitch )
	button:addChoice( Engine.Localize( "MENU_LEGACY_SOUTHPAW_CAPS" ), CoD.THUMBSTICK_LEGACYSOUTHPAW, {
		settings = button.legacySouthPawSettings,
		animationState = "layout_legacy_southpaw"
	}, CoD.StickLayout.SelectionChanged )
end

CoD.StickLayout.AddTextElements = function ( stickLayoutImageContainer )
	stickLayoutImageContainer:addElement( stickLayoutImageContainer.textUL )
	stickLayoutImageContainer:addElement( stickLayoutImageContainer.textL )
	stickLayoutImageContainer:addElement( stickLayoutImageContainer.textLL )
	stickLayoutImageContainer:addElement( stickLayoutImageContainer.textUR )
	stickLayoutImageContainer:addElement( stickLayoutImageContainer.textLR )
	stickLayoutImageContainer:addElement( stickLayoutImageContainer.textR )
end

CoD.StickLayout.AddImageElements = function ( stickLayoutImageContainer )
	stickLayoutImageContainer:addElement( stickLayoutImageContainer.controllerImage )
	stickLayoutImageContainer:addElement( stickLayoutImageContainer.leftStickImage )
	stickLayoutImageContainer:addElement( stickLayoutImageContainer.rightStickImage )
end

CoD.StickLayout.StreamedImageReady = function ( self, event )
	self:beginAnimation( "fade_in", 250 )
	self:setAlpha( 1 )
end

local PlaceElementsPS3 = function ( self )
	self.stickLayoutImageContainer.leftStickImage:setLeftRight( false, false, -136, -16 )
	self.stickLayoutImageContainer.leftStickImage:setTopBottom( false, false, 88, 208 )
	self.stickLayoutImageContainer.rightStickImage:setLeftRight( false, false, 12, 132 )
	self.stickLayoutImageContainer.rightStickImage:setTopBottom( false, false, 88, 208 )
	local safeAreaWidth, safeAreaHeight = Engine.GetUserSafeArea()
	local textSize = CoD.textSize.Condensed
	self.stickLayoutImageContainer.textUL:setLeftRight( false, false, -136, -16 )
	self.stickLayoutImageContainer.textUL:setTopBottom( false, false, 58, 58 + textSize )
	self.stickLayoutImageContainer.textL:setLeftRight( false, false, -safeAreaWidth / 2, -146 )
	self.stickLayoutImageContainer.textL:setTopBottom( false, false, 128, 128 + textSize )
	self.stickLayoutImageContainer.textL:setAlignment( LUI.Alignment.Right )
	self.stickLayoutImageContainer.textLL:setLeftRight( false, false, -136, -16 )
	self.stickLayoutImageContainer.textLL:setTopBottom( false, false, 213, 213 + textSize )
	self.stickLayoutImageContainer.textUR:setLeftRight( false, false, 132, 12 )
	self.stickLayoutImageContainer.textUR:setTopBottom( false, false, 58, 58 + textSize )
	self.stickLayoutImageContainer.textUR:setAlignment( LUI.Alignment.Center )
	self.stickLayoutImageContainer.textLR:setLeftRight( false, false, 132, 12 )
	self.stickLayoutImageContainer.textLR:setTopBottom( false, false, 213, 213 + textSize )
	self.stickLayoutImageContainer.textR:setLeftRight( false, false, 142, safeAreaWidth / 2 )
	self.stickLayoutImageContainer.textR:setTopBottom( false, false, 128, 128 + textSize )
	self.stickLayoutImageContainer.textR:setAlignment( LUI.Alignment.Left )
end

local PlaceElementsDurango = function ( self )
	self.stickLayoutImageContainer.leftStickImage:setLeftRight( false, false, -200, -35 )
	self.stickLayoutImageContainer.leftStickImage:setTopBottom( false, false, -35, 135 )
	self.stickLayoutImageContainer.rightStickImage:setLeftRight( false, false, -24, 138 )
	self.stickLayoutImageContainer.rightStickImage:setTopBottom( false, false, 35, 200 )
	local safeAreaWidth, safeAreaHeight = Engine.GetUserSafeArea()
	local textSize = CoD.textSize.Condensed
	self.stickLayoutImageContainer.textUL:setLeftRight( false, false, -235, 0 )
	self.stickLayoutImageContainer.textUL:setTopBottom( false, false, -70, -70 + textSize )
	self.stickLayoutImageContainer.textL:setLeftRight( false, false, -safeAreaWidth / 2, -205 )
	self.stickLayoutImageContainer.textL:setTopBottom( false, false, 37, 37 + textSize )
	self.stickLayoutImageContainer.textL:setAlignment( LUI.Alignment.Right )
	self.stickLayoutImageContainer.textLL:setLeftRight( false, false, -235, 0 )
	self.stickLayoutImageContainer.textLL:setTopBottom( false, false, 140, 140 + textSize )
	self.stickLayoutImageContainer.textUR:setLeftRight( false, false, 100, 0 )
	self.stickLayoutImageContainer.textUR:setTopBottom( false, false, 0, 0 + textSize )
	self.stickLayoutImageContainer.textUR:setAlignment( LUI.Alignment.Center )
	self.stickLayoutImageContainer.textLR:setLeftRight( false, false, 100, 0 )
	self.stickLayoutImageContainer.textLR:setTopBottom( false, false, 200, 200 + textSize )
	self.stickLayoutImageContainer.textR:setLeftRight( false, false, 145, safeAreaWidth / 2 )
	self.stickLayoutImageContainer.textR:setTopBottom( false, false, 100, 100 + textSize )
	self.stickLayoutImageContainer.textR:setAlignment( LUI.Alignment.Left )
end

CoD.StickLayout.CreateLayout = function ( self )
	self.stickLayoutImageContainer = LUI.UIElement.new()
	self.stickLayoutImageContainer:setLeftRight( false, false, 0, 0 )
	self.stickLayoutImageContainer:setTopBottom( false, false, -50, -50 )
	self.stickLayoutImageContainer:setAlpha( 0 )
	self.stickLayoutImageContainer.priority = -100
	local controllerMaterial = nil
	if CoD.isPS4 then
		controllerMaterial = "ps4_controller_top"
	elseif CoD.isPC then
		controllerMaterial = "ps4_controller_top"
	else
		controllerMaterial = "xenon_controller_top"
	end
	if CoD.isPS4 == true or CoD.isXBOX == true then
		self.stickLayoutImageContainer.controllerImage = LUI.UIStreamedImage.new()
		self.stickLayoutImageContainer.controllerImage:setAlpha( 0 )
		self.stickLayoutImageContainer.controllerImage:registerEventHandler( "streamed_image_ready", CoD.StickLayout.StreamedImageReady )
	else
		self.stickLayoutImageContainer.controllerImage = LUI.UIImage.new()
	end
	self.stickLayoutImageContainer.controllerImage:setLeftRight( false, false, -250, 250 )
	self.stickLayoutImageContainer.controllerImage:setTopBottom( false, false, -175, 325 )
	self.stickLayoutImageContainer.controllerImage:setImage( RegisterMaterial( controllerMaterial ) )
	if CoD.isDurango then
		self.stickLayoutImageContainer.controllerImage:setLeftRight( false, false, -260, 240 )
		self.stickLayoutImageContainer.controllerImage:setTopBottom( false, false, -140, 360 )
	end
	local leftStickImageMaterial = self.stickLayoutSelector.m_choices[self.stickLayoutSelector.m_currentChoice].params.extraParams.settings.leftStickImageMaterial
	if CoD.isPS4 == true or CoD.isXBOX == true then
		self.stickLayoutImageContainer.leftStickImage = LUI.UIStreamedImage.new()
		self.stickLayoutImageContainer.leftStickImage:setAlpha( 0 )
		self.stickLayoutImageContainer.leftStickImage:registerEventHandler( "streamed_image_ready", CoD.StickLayout.StreamedImageReady )
	else
		self.stickLayoutImageContainer.leftStickImage = LUI.UIImage.new()
	end
	self.stickLayoutImageContainer.leftStickImage:setImage( leftStickImageMaterial )
	local rightStickImageMaterial = self.stickLayoutSelector.m_choices[self.stickLayoutSelector.m_currentChoice].params.extraParams.settings.rightStickImageMaterial
	if CoD.isPS4 == true or CoD.isXBOX == true then
		self.stickLayoutImageContainer.rightStickImage = LUI.UIStreamedImage.new()
		self.stickLayoutImageContainer.rightStickImage:setAlpha( 0 )
		self.stickLayoutImageContainer.rightStickImage:registerEventHandler( "streamed_image_ready", CoD.StickLayout.StreamedImageReady )
	else
		self.stickLayoutImageContainer.rightStickImage = LUI.UIImage.new()
	end
	self.stickLayoutImageContainer.rightStickImage:setImage( rightStickImageMaterial )
	local safeAreaWidth, safeAreaHeight = Engine.GetUserSafeArea()
	local fontType = CoD.fonts.Condensed
	self.stickLayoutImageContainer.textUL = LUI.UIText.new()
	self.stickLayoutImageContainer.textUL:setFont( fontType )
	self.stickLayoutImageContainer.textL = LUI.UIText.new()
	self.stickLayoutImageContainer.textL:setFont( fontType )
	self.stickLayoutImageContainer.textLL = LUI.UIText.new()
	self.stickLayoutImageContainer.textLL:setFont( fontType )
	self.stickLayoutImageContainer.textUR = LUI.UIText.new()
	self.stickLayoutImageContainer.textUR:setFont( fontType )
	self.stickLayoutImageContainer.textLR = LUI.UIText.new()
	self.stickLayoutImageContainer.textLR:setFont( fontType )
	self.stickLayoutImageContainer.textR = LUI.UIText.new()
	self.stickLayoutImageContainer.textR:setFont( fontType )
	if CoD.isDurango then
		PlaceElementsDurango( self )
	elseif CoD.isPC then
		PlaceElementsPS3( self )
	elseif CoD.isPS4 then
		PlaceElementsPS3( self )
	end
end

CoD.StickLayout.CloseMenu = function ( self )
	if Engine.IsInGame() then
		Engine.Exec( self:getOwner(), "updateVehicleBindings" )
	end
	Engine.PlaySound( "uin_cmn_backout" )
	Engine.Exec( self:getOwner(), "updategamerprofile" )
	if CoD.isCampaign == false then
		self:saveState()
	end
	CoD.Menu.close( self )
end

CoD.StickLayout.AddBackButtonTimer = function ( self, event )
	self:addBackButton()
	self.backButtonTimer:close()
	self.backButtonTimer = nil
end

LUI.createMenu.StickLayout = function ( controller, userData )
	local stickLayoutMenu = nil
	if Engine.IsInGame() then
		stickLayoutMenu = CoD.InGameMenu.New( "StickLayout", controller, Engine.Localize( "PLATFORM_STICK_LAYOUT_CAPS" ), CoD.isSinglePlayer )
		if CoD.isSinglePlayer == false and Engine.IsInGame() and Engine.IsSplitscreen() then
			stickLayoutMenu:sizeToSafeArea( controller )
			stickLayoutMenu:updateTitleForSplitscreen()
			stickLayoutMenu:updateButtonPromptBarsForSplitscreen()
		end
	else
		stickLayoutMenu = CoD.Menu.New( "StickLayout" )
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
		stickLayoutMenu:addElement( background )
		stickLayoutMenu:setOwner( controller )
		stickLayoutMenu:addTitle( Engine.Localize( "PLATFORM_STICK_LAYOUT_CAPS" ) )
		if CoD.isSinglePlayer == false then
			stickLayoutMenu:addLargePopupBackground()
			stickLayoutMenu:registerEventHandler( "signed_out", CoD.Menu.SignedOut )
		end
	end
	stickLayoutMenu.close = CoD.StickLayout.CloseMenu
	stickLayoutMenu.controller = controller
	if CoD.isSinglePlayer == true then
		stickLayoutMenu:addBackButton()
	else
		stickLayoutMenu:registerEventHandler( "add_back_button", CoD.StickLayout.AddBackButtonTimer )
		stickLayoutMenu.backButtonTimer = LUI.UITimer.new( 350, {
			name = "add_back_button",
			controller = controller
		} )
		stickLayoutMenu:addElement( stickLayoutMenu.backButtonTimer )
	end
	stickLayoutMenu:registerEventHandler( "stick_layout_selection_changed", CoD.StickLayout.StickLayoutSelectionChanged )
	local buttonListLeft = 0
	if Engine.IsInGame() and CoD.isSinglePlayer == false and Engine.IsSplitscreen() then
		buttonListLeft = CoD.Menu.SplitscreenSideOffset
	end
	stickLayoutMenu.stickLayoutButtonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = buttonListLeft,
		right = buttonListLeft + CoD.ButtonList.DefaultWidth - 20,
		topAnchor = true,
		bottomAnchor = false,
		top = CoD.Menu.TitleHeight,
		bottom = CoD.Menu.TitleHeight + 720
	} )
	if CoD.isSinglePlayer then
		stickLayoutMenu:addElement( stickLayoutMenu.stickLayoutButtonList )
		if userData and userData.height ~= nil then
			stickLayoutMenu.stickLayoutButtonList:setLeftRight( false, false, -CoD.Options.Width / 2, CoD.Options.Width / 2 )
			stickLayoutMenu.stickLayoutButtonList:setTopBottom( false, false, -userData.height / 2, userData.height / 2 )
		end
	else
		local buttonListScaleContainer = CoD.SplitscreenScaler.new( nil, 1.5 )
		buttonListScaleContainer:setLeftRight( true, false, 0, 0 )
		buttonListScaleContainer:setTopBottom( true, false, 0, 0 )
		stickLayoutMenu:addElement( buttonListScaleContainer )
		buttonListScaleContainer:addElement( stickLayoutMenu.stickLayoutButtonList )
	end
	stickLayoutMenu.stickLayoutSelector = stickLayoutMenu.stickLayoutButtonList:addProfileLeftRightSelector( controller, Engine.Localize( "PLATFORM_THUMBSTICK_LAYOUT_CAPS" ), "gpad_sticksConfig" )
	CoD.StickLayout.AddChoices( stickLayoutMenu.stickLayoutSelector )
	CoD.StickLayout.CreateLayout( stickLayoutMenu )
	CoD.StickLayout.SetTextElems( stickLayoutMenu.stickLayoutImageContainer, stickLayoutMenu.stickLayoutSelector.m_choices[stickLayoutMenu.stickLayoutSelector.m_currentChoice].params )
	CoD.StickLayout.AddImageElements( stickLayoutMenu.stickLayoutImageContainer )
	CoD.StickLayout.AddTextElements( stickLayoutMenu.stickLayoutImageContainer )
	for index = 1, #stickLayoutMenu.stickLayoutSelector.m_choices, 1 do
		stickLayoutMenu.stickLayoutImageContainer.leftStickImage:registerAnimationState( stickLayoutMenu.stickLayoutSelector.m_choices[index].params.extraParams.animationState, {
			material = stickLayoutMenu.stickLayoutSelector.m_choices[index].params.extraParams.settings.leftStickImage
		} )
		stickLayoutMenu.stickLayoutImageContainer.rightStickImage:registerAnimationState( stickLayoutMenu.stickLayoutSelector.m_choices[index].params.extraParams.animationState, {
			material = stickLayoutMenu.stickLayoutSelector.m_choices[index].params.extraParams.settings.rightStickImage
		} )
	end
	stickLayoutMenu:addElement( stickLayoutMenu.stickLayoutImageContainer )
	stickLayoutMenu.stickLayoutImageContainer:beginAnimation( "fade_in", stickLayoutMenu.fadeInTime, false, false )
	stickLayoutMenu.stickLayoutImageContainer:setAlpha( 1 )
	stickLayoutMenu.stickLayoutSelector:processEvent( {
		name = "gain_focus"
	} )
	return stickLayoutMenu
end

