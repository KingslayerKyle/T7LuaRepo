CoD.Brightness = {}
CoD.Brightness.AdjustSFX = "cac_safearea"
CoD.Brightness.AddBrightnessShade = function ( brightnessImageContainer, red, green, blue, text )
	local shadeImageContainer = LUI.UIElement.new()
	shadeImageContainer:setLeftRight( false, false, -250, 250 )
	shadeImageContainer:setTopBottom( false, false, 0, 100 )
	shadeImageContainer:setRGB( red, green, blue )
	local shadeImage = LUI.UIImage.new()
	shadeImage:setLeftRight( true, true, 0, 0 )
	shadeImage:setTopBottom( true, true, 0, 0 )
	shadeImage:setRGB( red, green, blue )
	shadeImageContainer:addElement( shadeImage )
	local shadeText = LUI.UIText.new()
	shadeText:setLeftRight( false, false, 0, 0 )
	shadeText:setTopBottom( false, false, 0, CoD.textSize.Default )
	shadeText:setRGB( 0, 0, 0 )
	shadeText:setText( text )
	shadeImageContainer:addElement( shadeText )
	brightnessImageContainer:addElement( shadeImageContainer )
end

CoD.Brightness.CloseFirstTime = function ( self, event )
	self:openMenu( "AudioSettings", event.controller )
	self:close()
end

LUI.createMenu.Brightness = function ( controller, userData )
	local brightnessMenu = nil
	if Engine.IsInGame() then
		brightnessMenu = CoD.InGameMenu.New( "Brightness", controller, Engine.Localize( "MENU_BRIGHTNESS_CAPS" ), CoD.isSinglePlayer )
		if CoD.isSinglePlayer == false and Engine.IsInGame() and Engine.IsSplitscreen() then
			brightnessMenu:sizeToSafeArea( controller )
			brightnessMenu:updateTitleForSplitscreen()
			brightnessMenu:updateButtonPromptBarsForSplitscreen()
		end
	else
		brightnessMenu = CoD.Menu.New( "Brightness" )
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
		brightnessMenu:addElement( background )
		brightnessMenu:setOwner( controller )
		brightnessMenu:addTitle( Engine.Localize( "MENU_BRIGHTNESS_CAPS" ) )
		if CoD.isSinglePlayer == false then
			brightnessMenu:addLargePopupBackground()
			brightnessMenu:registerEventHandler( "signed_out", CoD.Menu.SignedOut )
		end
	end
	brightnessMenu.controller = controller
	if CoD.isSinglePlayer == true and CoD.perController[controller].firstTime then
		brightnessMenu.acceptButton = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_ACCEPT" ), brightnessMenu, "accept_button" )
		brightnessMenu:addLeftButtonPrompt( brightnessMenu.acceptButton )
		brightnessMenu:registerEventHandler( "accept_button", CoD.Brightness.CloseFirstTime )
		CoD.Brightness.ListHeight = 511.25
	else
		brightnessMenu:addBackButton()
	end
	brightnessMenu.close = CoD.Options.Close
	local buttonListLeft = 0
	if Engine.IsInGame() and CoD.isSinglePlayer == false and Engine.IsSplitscreen() then
		buttonListLeft = CoD.Menu.SplitscreenSideOffset
	end
	local brightnessButtonList = CoD.ButtonList.new()
	brightnessButtonList:setLeftRight( true, false, buttonListLeft, buttonListLeft + CoD.ButtonList.DefaultWidth - 20 )
	brightnessButtonList:setTopBottom( true, false, CoD.Menu.TitleHeight, CoD.Menu.TitleHeight + 720 )
	if CoD.isSinglePlayer == true then
		brightnessMenu:addElement( brightnessButtonList )
		if userData and userData.height ~= nil then
			brightnessButtonList:setLeftRight( false, false, -CoD.Options.Width / 2, CoD.Options.Width / 2 )
			brightnessButtonList:setTopBottom( false, false, -userData.height / 2, userData.height / 2 )
			CoD.Brightness.ListHeight = userData.height
		elseif CoD.Brightness.ListHeight then
			brightnessButtonList:setLeftRight( false, false, -CoD.Options.Width / 2, CoD.Options.Width / 2 )
			brightnessButtonList:setTopBottom( false, false, -CoD.Brightness.ListHeight / 2, CoD.Brightness.ListHeight / 2 )
		end
	else
		local buttonListScaleContainer = CoD.SplitscreenScaler.new( nil, 1.5 )
		buttonListScaleContainer:setLeftRight( true, false, 0, 0 )
		buttonListScaleContainer:setTopBottom( true, false, 0, 0 )
		brightnessMenu:addElement( buttonListScaleContainer )
		buttonListScaleContainer:addElement( brightnessButtonList )
	end
	if CoD.isPC then
		local sliderOptionWidth = 480
		if CoD.isSinglePlayer then
			brightnessButtonList:setLeftRight( false, false, -sliderOptionWidth / 2, sliderOptionWidth / 2 )
		else
			brightnessButtonList:setLeftRight( true, false, 0, sliderOptionWidth )
		end
	end
	local brightnessSlider = brightnessButtonList:addProfileLeftRightSlider( controller, Engine.Localize( "MENU_BRIGHTNESS_CAPS" ), "r_gamma", 0.5, 1.5, nil, nil, nil, CoD.Brightness.AdjustSFX )
	local brightnessImageContainer = LUI.UIVerticalList.new()
	brightnessImageContainer:setLeftRight( false, false, 0, 0 )
	brightnessImageContainer:setTopBottom( false, false, -100, 0 )
	brightnessMenu:addElement( brightnessImageContainer )
	brightnessImageContainer.priority = -100
	if CoD.isPS3 then
		CoD.Brightness.AddBrightnessShade( brightnessImageContainer, 0.02, 0.02, 0.02, Engine.Localize( "MENU_BRIGHTNESS_NOT_VISIBLE" ) )
		CoD.Brightness.AddBrightnessShade( brightnessImageContainer, 0.07, 0.07, 0.07, Engine.Localize( "MENU_BRIGHTNESS_BARELY_VISIBLE" ) )
		CoD.Brightness.AddBrightnessShade( brightnessImageContainer, 0.21, 0.21, 0.21, Engine.Localize( "MENU_BRIGHTNESS_EASILY_VISIBLE" ) )
	else
		CoD.Brightness.AddBrightnessShade( brightnessImageContainer, 0.06, 0.06, 0.06, Engine.Localize( "MENU_BRIGHTNESS_NOT_VISIBLE" ) )
		CoD.Brightness.AddBrightnessShade( brightnessImageContainer, 0.12, 0.12, 0.12, Engine.Localize( "MENU_BRIGHTNESS_BARELY_VISIBLE" ) )
		CoD.Brightness.AddBrightnessShade( brightnessImageContainer, 0.25, 0.25, 0.25, Engine.Localize( "MENU_BRIGHTNESS_EASILY_VISIBLE" ) )
	end
	brightnessImageContainer:beginAnimation( "fade_in", brightnessMenu.fadeInTime, false, false )
	brightnessImageContainer:setAlpha( 1 )
	if CoD.useController then
		brightnessSlider:processEvent( {
			name = "gain_focus"
		} )
	end
	Engine.PlaySound( "cac_grid_nav" )
	return brightnessMenu
end

