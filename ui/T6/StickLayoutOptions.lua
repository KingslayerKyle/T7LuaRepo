-- ccefa223a2b86c1d3ba6132400b91749
-- This hash is used for caching, delete to decompile the file again

CoD.StickLayout = {}
CoD.StickLayout.SetTextElems = function ( f1_arg0, f1_arg1 )
	f1_arg0.textL:setText( Engine.Localize( f1_arg1.extraParams.settings.textL ) )
	f1_arg0.textR:setText( Engine.Localize( f1_arg1.extraParams.settings.textR ) )
	f1_arg0.textUL:setText( Engine.Localize( f1_arg1.extraParams.settings.textUL ) )
	f1_arg0.textUR:setText( Engine.Localize( f1_arg1.extraParams.settings.textUR ) )
	f1_arg0.textLR:setText( Engine.Localize( f1_arg1.extraParams.settings.textLR ) )
	f1_arg0.textLL:setText( Engine.Localize( f1_arg1.extraParams.settings.textLL ) )
end

CoD.StickLayout.SelectionChanged = function ( f2_arg0, f2_arg1 )
	if f2_arg1 then
		Engine.SetProfileVar( f2_arg0.parentSelectorButton.m_currentController, f2_arg0.parentSelectorButton.m_profileVarName, f2_arg0.value )
	end
	f2_arg0.parentSelectorButton:dispatchEventToParent( {
		name = "stick_layout_selection_changed",
		choiceParams = f2_arg0
	} )
end

CoD.StickLayout.StickLayoutSelectionChanged = function ( f3_arg0, f3_arg1 )
	if f3_arg0.stickLayoutImageContainer ~= nil then
		CoD.StickLayout.SetTextElems( f3_arg0.stickLayoutImageContainer, f3_arg1.choiceParams )
		f3_arg0.stickLayoutImageContainer.leftStickImage:beginAnimation( f3_arg1.choiceParams.extraParams.animationState, 0 )
		if CoD.isPS4 == true or CoD.isDurango == true then
			f3_arg0.stickLayoutImageContainer.leftStickImage:setupUIStreamedImage( 0 )
			f3_arg0.stickLayoutImageContainer.leftStickImage:setAlpha( 0 )
		end
		f3_arg0.stickLayoutImageContainer.leftStickImage:setImage( f3_arg1.choiceParams.extraParams.settings.leftStickImageMaterial )
		f3_arg0.stickLayoutImageContainer.rightStickImage:beginAnimation( f3_arg1.choiceParams.extraParams.animationState, 0 )
		if CoD.isPS4 == true or CoD.isDurango == true then
			f3_arg0.stickLayoutImageContainer.rightStickImage:setupUIStreamedImage( 0 )
			f3_arg0.stickLayoutImageContainer.rightStickImage:setAlpha( 0 )
		end
		f3_arg0.stickLayoutImageContainer.rightStickImage:setImage( f3_arg1.choiceParams.extraParams.settings.rightStickImageMaterial )
	end
end

CoD.StickLayout.BuildDefaultSettings = function ( f4_arg0, f4_arg1 )
	f4_arg0.defaultSettings = {
		textUL = "MENU_MOVE_FORWARD",
		textUR = "MENU_LOOK_UP",
		textR = "MENU_ROTATE_LEFT_RIGHT",
		textLR = "MENU_LOOK_DOWN",
		textLL = "MENU_MOVE_BACK",
		textL = "MENU_STRAFE_LEFT_RIGHT"
	}
	if f4_arg1 == 1 then
		f4_arg0.defaultSettings.textUR = "MENU_LOOK_DOWN"
		f4_arg0.defaultSettings.textLR = "MENU_LOOK_UP"
	end
	f4_arg0.defaultSettings.leftStickImageMaterial = CoD.StickLayout.StickMoveMaterial
	f4_arg0.defaultSettings.rightStickImageMaterial = CoD.StickLayout.StickTurnMaterial
end

CoD.StickLayout.BuildSouthPawSettings = function ( f5_arg0, f5_arg1 )
	f5_arg0.southPawSettings = {
		textUL = "MENU_LOOK_UP",
		textUR = "MENU_MOVE_FORWARD",
		textR = "MENU_STRAFE_LEFT_RIGHT",
		textLR = "MENU_MOVE_BACK",
		textLL = "MENU_LOOK_DOWN",
		textL = "MENU_ROTATE_LEFT_RIGHT"
	}
	if f5_arg1 == 1 then
		f5_arg0.southPawSettings.textUL = "MENU_LOOK_DOWN"
		f5_arg0.southPawSettings.textLL = "MENU_LOOK_UP"
	end
	f5_arg0.southPawSettings.leftStickImageMaterial = CoD.StickLayout.StickTurnMaterial
	f5_arg0.southPawSettings.rightStickImageMaterial = CoD.StickLayout.StickMoveMaterial
end

CoD.StickLayout.BuildLegacySettings = function ( f6_arg0, f6_arg1 )
	f6_arg0.legacySettings = {
		textUL = "MENU_MOVE_FORWARD",
		textUR = "MENU_LOOK_UP",
		textR = "MENU_STRAFE_LEFT_RIGHT",
		textLR = "MENU_LOOK_DOWN",
		textLL = "MENU_MOVE_BACK",
		textL = "MENU_ROTATE_LEFT_RIGHT"
	}
	if f6_arg1 == 1 then
		f6_arg0.legacySettings.textUR = "MENU_LOOK_DOWN"
		f6_arg0.legacySettings.textLR = "MENU_LOOK_UP"
	end
	f6_arg0.legacySettings.leftStickImageMaterial = CoD.StickLayout.StickMoveTurnMaterial
	f6_arg0.legacySettings.rightStickImageMaterial = CoD.StickLayout.StickMoveLookMaterial
end

CoD.StickLayout.BuildLegacySouthPawSettings = function ( f7_arg0, f7_arg1 )
	f7_arg0.legacySouthPawSettings = {
		textUL = "MENU_LOOK_UP",
		textUR = "MENU_MOVE_FORWARD",
		textR = "MENU_ROTATE_LEFT_RIGHT",
		textLR = "MENU_MOVE_BACK",
		textLL = "MENU_LOOK_DOWN",
		textL = "MENU_STRAFE_LEFT_RIGHT"
	}
	if f7_arg1 == 1 then
		f7_arg0.legacySouthPawSettings.textUL = "MENU_LOOK_DOWN"
		f7_arg0.legacySouthPawSettings.textLL = "MENU_LOOK_UP"
	end
	f7_arg0.legacySouthPawSettings.leftStickImageMaterial = CoD.StickLayout.StickMoveLookMaterial
	f7_arg0.legacySouthPawSettings.rightStickImageMaterial = CoD.StickLayout.StickMoveTurnMaterial
end

CoD.StickLayout.AddChoices = function ( f8_arg0 )
	local f8_local0 = tonumber( Engine.ProfileValueAsString( f8_arg0.m_currentController, "input_invertpitch" ) )
	CoD.StickLayout.StickMoveMaterial = RegisterMaterial( "xenon_stick_move" )
	CoD.StickLayout.StickTurnMaterial = RegisterMaterial( "xenon_stick_turn" )
	CoD.StickLayout.StickMoveTurnMaterial = RegisterMaterial( "xenon_stick_move_turn" )
	CoD.StickLayout.StickMoveLookMaterial = RegisterMaterial( "xenon_stick_move_look" )
	CoD.StickLayout.BuildDefaultSettings( f8_arg0, f8_local0 )
	f8_arg0:addChoice( Engine.Localize( "MENU_DEFAULT_CAPS" ), CoD.THUMBSTICK_DEFAULT, {
		settings = f8_arg0.defaultSettings,
		animationState = "layout_default"
	}, CoD.StickLayout.SelectionChanged )
	CoD.StickLayout.BuildSouthPawSettings( f8_arg0, f8_local0 )
	f8_arg0:addChoice( Engine.Localize( "MENU_SOUTHPAW_CAPS" ), CoD.THUMBSTICK_SOUTHPAW, {
		settings = f8_arg0.southPawSettings,
		animationState = "layout_southpaw"
	}, CoD.StickLayout.SelectionChanged )
	CoD.StickLayout.BuildLegacySettings( f8_arg0, f8_local0 )
	f8_arg0:addChoice( Engine.Localize( "MENU_LEGACY_CAPS" ), CoD.THUMBSTICK_LEGACY, {
		settings = f8_arg0.legacySettings,
		animationState = "layout_legacy"
	}, CoD.StickLayout.SelectionChanged )
	CoD.StickLayout.BuildLegacySouthPawSettings( f8_arg0, f8_local0 )
	f8_arg0:addChoice( Engine.Localize( "MENU_LEGACY_SOUTHPAW_CAPS" ), CoD.THUMBSTICK_LEGACYSOUTHPAW, {
		settings = f8_arg0.legacySouthPawSettings,
		animationState = "layout_legacy_southpaw"
	}, CoD.StickLayout.SelectionChanged )
end

CoD.StickLayout.AddTextElements = function ( f9_arg0 )
	f9_arg0:addElement( f9_arg0.textUL )
	f9_arg0:addElement( f9_arg0.textL )
	f9_arg0:addElement( f9_arg0.textLL )
	f9_arg0:addElement( f9_arg0.textUR )
	f9_arg0:addElement( f9_arg0.textLR )
	f9_arg0:addElement( f9_arg0.textR )
end

CoD.StickLayout.AddImageElements = function ( f10_arg0 )
	f10_arg0:addElement( f10_arg0.controllerImage )
	f10_arg0:addElement( f10_arg0.leftStickImage )
	f10_arg0:addElement( f10_arg0.rightStickImage )
end

CoD.StickLayout.StreamedImageReady = function ( f11_arg0, f11_arg1 )
	f11_arg0:beginAnimation( "fade_in", 250 )
	f11_arg0:setAlpha( 1 )
end

local f0_local0 = function ( f12_arg0 )
	f12_arg0.stickLayoutImageContainer.leftStickImage:setLeftRight( false, false, -136, -16 )
	f12_arg0.stickLayoutImageContainer.leftStickImage:setTopBottom( false, false, 88, 208 )
	f12_arg0.stickLayoutImageContainer.rightStickImage:setLeftRight( false, false, 12, 132 )
	f12_arg0.stickLayoutImageContainer.rightStickImage:setTopBottom( false, false, 88, 208 )
	local f12_local0, f12_local1 = Engine.GetUserSafeArea()
	local f12_local2 = CoD.textSize.Condensed
	f12_arg0.stickLayoutImageContainer.textUL:setLeftRight( false, false, -136, -16 )
	f12_arg0.stickLayoutImageContainer.textUL:setTopBottom( false, false, 58, 58 + f12_local2 )
	f12_arg0.stickLayoutImageContainer.textL:setLeftRight( false, false, -f12_local0 / 2, -146 )
	f12_arg0.stickLayoutImageContainer.textL:setTopBottom( false, false, 128, 128 + f12_local2 )
	f12_arg0.stickLayoutImageContainer.textL:setAlignment( LUI.Alignment.Right )
	f12_arg0.stickLayoutImageContainer.textLL:setLeftRight( false, false, -136, -16 )
	f12_arg0.stickLayoutImageContainer.textLL:setTopBottom( false, false, 213, 213 + f12_local2 )
	f12_arg0.stickLayoutImageContainer.textUR:setLeftRight( false, false, 132, 12 )
	f12_arg0.stickLayoutImageContainer.textUR:setTopBottom( false, false, 58, 58 + f12_local2 )
	f12_arg0.stickLayoutImageContainer.textUR:setAlignment( LUI.Alignment.Center )
	f12_arg0.stickLayoutImageContainer.textLR:setLeftRight( false, false, 132, 12 )
	f12_arg0.stickLayoutImageContainer.textLR:setTopBottom( false, false, 213, 213 + f12_local2 )
	f12_arg0.stickLayoutImageContainer.textR:setLeftRight( false, false, 142, f12_local0 / 2 )
	f12_arg0.stickLayoutImageContainer.textR:setTopBottom( false, false, 128, 128 + f12_local2 )
	f12_arg0.stickLayoutImageContainer.textR:setAlignment( LUI.Alignment.Left )
end

local f0_local1 = function ( f13_arg0 )
	f13_arg0.stickLayoutImageContainer.leftStickImage:setLeftRight( false, false, -200, -35 )
	f13_arg0.stickLayoutImageContainer.leftStickImage:setTopBottom( false, false, -35, 135 )
	f13_arg0.stickLayoutImageContainer.rightStickImage:setLeftRight( false, false, -24, 138 )
	f13_arg0.stickLayoutImageContainer.rightStickImage:setTopBottom( false, false, 35, 200 )
	local f13_local0, f13_local1 = Engine.GetUserSafeArea()
	local f13_local2 = CoD.textSize.Condensed
	f13_arg0.stickLayoutImageContainer.textUL:setLeftRight( false, false, -235, 0 )
	f13_arg0.stickLayoutImageContainer.textUL:setTopBottom( false, false, -70, -70 + f13_local2 )
	f13_arg0.stickLayoutImageContainer.textL:setLeftRight( false, false, -f13_local0 / 2, -205 )
	f13_arg0.stickLayoutImageContainer.textL:setTopBottom( false, false, 37, 37 + f13_local2 )
	f13_arg0.stickLayoutImageContainer.textL:setAlignment( LUI.Alignment.Right )
	f13_arg0.stickLayoutImageContainer.textLL:setLeftRight( false, false, -235, 0 )
	f13_arg0.stickLayoutImageContainer.textLL:setTopBottom( false, false, 140, 140 + f13_local2 )
	f13_arg0.stickLayoutImageContainer.textUR:setLeftRight( false, false, 100, 0 )
	f13_arg0.stickLayoutImageContainer.textUR:setTopBottom( false, false, 0, 0 + f13_local2 )
	f13_arg0.stickLayoutImageContainer.textUR:setAlignment( LUI.Alignment.Center )
	f13_arg0.stickLayoutImageContainer.textLR:setLeftRight( false, false, 100, 0 )
	f13_arg0.stickLayoutImageContainer.textLR:setTopBottom( false, false, 200, 200 + f13_local2 )
	f13_arg0.stickLayoutImageContainer.textR:setLeftRight( false, false, 145, f13_local0 / 2 )
	f13_arg0.stickLayoutImageContainer.textR:setTopBottom( false, false, 100, 100 + f13_local2 )
	f13_arg0.stickLayoutImageContainer.textR:setAlignment( LUI.Alignment.Left )
end

CoD.StickLayout.CreateLayout = function ( f14_arg0 )
	f14_arg0.stickLayoutImageContainer = LUI.UIElement.new()
	f14_arg0.stickLayoutImageContainer:setLeftRight( false, false, 0, 0 )
	f14_arg0.stickLayoutImageContainer:setTopBottom( false, false, -50, -50 )
	f14_arg0.stickLayoutImageContainer:setAlpha( 0 )
	f14_arg0.stickLayoutImageContainer.priority = -100
	local f14_local0 = nil
	if CoD.isPS4 then
		f14_local0 = "ps4_controller_top"
	elseif CoD.isPC then
		f14_local0 = "ps4_controller_top"
	else
		f14_local0 = "xenon_controller_top"
	end
	if CoD.isPS4 == true or CoD.isDurango == true then
		f14_arg0.stickLayoutImageContainer.controllerImage = LUI.UIStreamedImage.new()
		f14_arg0.stickLayoutImageContainer.controllerImage:setAlpha( 0 )
		f14_arg0.stickLayoutImageContainer.controllerImage:registerEventHandler( "streamed_image_ready", CoD.StickLayout.StreamedImageReady )
	else
		f14_arg0.stickLayoutImageContainer.controllerImage = LUI.UIImage.new()
	end
	f14_arg0.stickLayoutImageContainer.controllerImage:setLeftRight( false, false, -250, 250 )
	f14_arg0.stickLayoutImageContainer.controllerImage:setTopBottom( false, false, -175, 325 )
	f14_arg0.stickLayoutImageContainer.controllerImage:setImage( RegisterMaterial( f14_local0 ) )
	if CoD.isDurango then
		f14_arg0.stickLayoutImageContainer.controllerImage:setLeftRight( false, false, -260, 240 )
		f14_arg0.stickLayoutImageContainer.controllerImage:setTopBottom( false, false, -140, 360 )
	end
	local f14_local1 = f14_arg0.stickLayoutSelector.m_choices[f14_arg0.stickLayoutSelector.m_currentChoice].params.extraParams.settings.leftStickImageMaterial
	if CoD.isPS4 == true or CoD.isDurango == true then
		f14_arg0.stickLayoutImageContainer.leftStickImage = LUI.UIStreamedImage.new()
		f14_arg0.stickLayoutImageContainer.leftStickImage:setAlpha( 0 )
		f14_arg0.stickLayoutImageContainer.leftStickImage:registerEventHandler( "streamed_image_ready", CoD.StickLayout.StreamedImageReady )
	else
		f14_arg0.stickLayoutImageContainer.leftStickImage = LUI.UIImage.new()
	end
	f14_arg0.stickLayoutImageContainer.leftStickImage:setImage( f14_local1 )
	local f14_local2 = f14_arg0.stickLayoutSelector.m_choices[f14_arg0.stickLayoutSelector.m_currentChoice].params.extraParams.settings.rightStickImageMaterial
	if CoD.isPS4 == true or CoD.isDurango == true then
		f14_arg0.stickLayoutImageContainer.rightStickImage = LUI.UIStreamedImage.new()
		f14_arg0.stickLayoutImageContainer.rightStickImage:setAlpha( 0 )
		f14_arg0.stickLayoutImageContainer.rightStickImage:registerEventHandler( "streamed_image_ready", CoD.StickLayout.StreamedImageReady )
	else
		f14_arg0.stickLayoutImageContainer.rightStickImage = LUI.UIImage.new()
	end
	f14_arg0.stickLayoutImageContainer.rightStickImage:setImage( f14_local2 )
	local f14_local3, f14_local4 = Engine.GetUserSafeArea()
	local f14_local5 = CoD.fonts.Condensed
	f14_arg0.stickLayoutImageContainer.textUL = LUI.UIText.new()
	f14_arg0.stickLayoutImageContainer.textUL:setFont( f14_local5 )
	f14_arg0.stickLayoutImageContainer.textL = LUI.UIText.new()
	f14_arg0.stickLayoutImageContainer.textL:setFont( f14_local5 )
	f14_arg0.stickLayoutImageContainer.textLL = LUI.UIText.new()
	f14_arg0.stickLayoutImageContainer.textLL:setFont( f14_local5 )
	f14_arg0.stickLayoutImageContainer.textUR = LUI.UIText.new()
	f14_arg0.stickLayoutImageContainer.textUR:setFont( f14_local5 )
	f14_arg0.stickLayoutImageContainer.textLR = LUI.UIText.new()
	f14_arg0.stickLayoutImageContainer.textLR:setFont( f14_local5 )
	f14_arg0.stickLayoutImageContainer.textR = LUI.UIText.new()
	f14_arg0.stickLayoutImageContainer.textR:setFont( f14_local5 )
	if CoD.isDurango then
		f0_local1( f14_arg0 )
	elseif CoD.isPC then
		f0_local0( f14_arg0 )
	elseif CoD.isPS4 then
		f0_local0( f14_arg0 )
	end
end

CoD.StickLayout.CloseMenu = function ( f15_arg0 )
	if Engine.IsInGame() then
		Engine.Exec( f15_arg0:getOwner(), "updateVehicleBindings" )
	end
	Engine.PlaySound( "uin_cmn_backout" )
	Engine.Exec( f15_arg0:getOwner(), "updategamerprofile" )
	if CoD.isCampaign == false then
		f15_arg0:saveState()
	end
	CoD.Menu.close( f15_arg0 )
end

CoD.StickLayout.AddBackButtonTimer = function ( f16_arg0, f16_arg1 )
	f16_arg0:addBackButton()
	f16_arg0.backButtonTimer:close()
	f16_arg0.backButtonTimer = nil
end

LUI.createMenu.StickLayout = function ( f17_arg0, f17_arg1 )
	local f17_local0 = nil
	if Engine.IsInGame() then
		f17_local0 = CoD.InGameMenu.New( "StickLayout", f17_arg0, Engine.Localize( "PLATFORM_STICK_LAYOUT_CAPS" ), CoD.isSinglePlayer )
		if CoD.isSinglePlayer == false and Engine.IsInGame() and Engine.IsSplitscreen() then
			f17_local0:sizeToSafeArea( f17_arg0 )
			f17_local0:updateTitleForSplitscreen()
			f17_local0:updateButtonPromptBarsForSplitscreen()
		end
	else
		f17_local0 = CoD.Menu.New( "StickLayout" )
		local self = LUI.UIImage.new( {
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
		self:setPriority( -100 )
		f17_local0:addElement( self )
		f17_local0:setOwner( f17_arg0 )
		f17_local0:addTitle( Engine.Localize( "PLATFORM_STICK_LAYOUT_CAPS" ) )
		if CoD.isSinglePlayer == false then
			f17_local0:addLargePopupBackground()
			f17_local0:registerEventHandler( "signed_out", CoD.Menu.SignedOut )
		end
	end
	f17_local0.close = CoD.StickLayout.CloseMenu
	f17_local0.controller = f17_arg0
	if CoD.isSinglePlayer == true then
		f17_local0:addBackButton()
	else
		f17_local0:registerEventHandler( "add_back_button", CoD.StickLayout.AddBackButtonTimer )
		f17_local0.backButtonTimer = LUI.UITimer.new( 350, {
			name = "add_back_button",
			controller = f17_arg0
		} )
		f17_local0:addElement( f17_local0.backButtonTimer )
	end
	f17_local0:registerEventHandler( "stick_layout_selection_changed", CoD.StickLayout.StickLayoutSelectionChanged )
	local self = 0
	if Engine.IsInGame() and CoD.isSinglePlayer == false and Engine.IsSplitscreen() then
		self = CoD.Menu.SplitscreenSideOffset
	end
	f17_local0.stickLayoutButtonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = self,
		right = self + CoD.ButtonList.DefaultWidth - 20,
		topAnchor = true,
		bottomAnchor = false,
		top = CoD.Menu.TitleHeight,
		bottom = CoD.Menu.TitleHeight + 720
	} )
	if CoD.isSinglePlayer then
		f17_local0:addElement( f17_local0.stickLayoutButtonList )
		if f17_arg1 and f17_arg1.height ~= nil then
			f17_local0.stickLayoutButtonList:setLeftRight( false, false, -CoD.Options.Width / 2, CoD.Options.Width / 2 )
			f17_local0.stickLayoutButtonList:setTopBottom( false, false, -f17_arg1.height / 2, f17_arg1.height / 2 )
		end
	else
		local f17_local2 = CoD.SplitscreenScaler.new( nil, 1.5 )
		f17_local2:setLeftRight( true, false, 0, 0 )
		f17_local2:setTopBottom( true, false, 0, 0 )
		f17_local0:addElement( f17_local2 )
		f17_local2:addElement( f17_local0.stickLayoutButtonList )
	end
	f17_local0.stickLayoutSelector = f17_local0.stickLayoutButtonList:addProfileLeftRightSelector( f17_arg0, Engine.Localize( "PLATFORM_THUMBSTICK_LAYOUT_CAPS" ), "gpad_sticksConfig" )
	CoD.StickLayout.AddChoices( f17_local0.stickLayoutSelector )
	CoD.StickLayout.CreateLayout( f17_local0 )
	CoD.StickLayout.SetTextElems( f17_local0.stickLayoutImageContainer, f17_local0.stickLayoutSelector.m_choices[f17_local0.stickLayoutSelector.m_currentChoice].params )
	CoD.StickLayout.AddImageElements( f17_local0.stickLayoutImageContainer )
	CoD.StickLayout.AddTextElements( f17_local0.stickLayoutImageContainer )
	for f17_local2 = 1, #f17_local0.stickLayoutSelector.m_choices, 1 do
		f17_local0.stickLayoutImageContainer.leftStickImage:registerAnimationState( f17_local0.stickLayoutSelector.m_choices[f17_local2].params.extraParams.animationState, {
			material = f17_local0.stickLayoutSelector.m_choices[f17_local2].params.extraParams.settings.leftStickImage
		} )
		f17_local0.stickLayoutImageContainer.rightStickImage:registerAnimationState( f17_local0.stickLayoutSelector.m_choices[f17_local2].params.extraParams.animationState, {
			material = f17_local0.stickLayoutSelector.m_choices[f17_local2].params.extraParams.settings.rightStickImage
		} )
	end
	f17_local0:addElement( f17_local0.stickLayoutImageContainer )
	f17_local0.stickLayoutImageContainer:beginAnimation( "fade_in", f17_local0.fadeInTime, false, false )
	f17_local0.stickLayoutImageContainer:setAlpha( 1 )
	f17_local0.stickLayoutSelector:processEvent( {
		name = "gain_focus"
	} )
	return f17_local0
end

