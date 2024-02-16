CoD.DemoHighlightReel = {}
CoD.DemoHighlightReel.OpenStartHighlightReel = function ( self, event )
	local userData = {
		blackBackground = LUI.UIImage.new( {
			left = 0,
			top = 0,
			right = 0,
			bottom = 0,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = true,
			bottomAnchor = true,
			red = 0,
			green = 0,
			blue = 0,
			alpha = 1
		} ),
		m_gameHUD = self
	}
	local popup = self:openPopup( "StartHighlightReel", event.controller, userData )
	self:addElement( userData.blackBackground )
	Dvar.demo_pause:set( true )
end

CoD.DemoHighlightReel.Pulse = function ( self, event )
	if not event.interrupted then
		self:animateToState( "pulse2", 500 )
	end
end

CoD.DemoHighlightReel.Pulse2 = function ( self, event )
	if not event.interrupted then
		self:animateToState( "pulse", 500 )
	end
end

CoD.StartHighlightReelPopupWidth = 553
CoD.StartHighlightReelPopupHeight = 316
CoD.StartHighlightReelPopupWidthOffset = 40
CoD.StartHighlightReelPopupHeightOffset = 40
local DemoHighlightReel_StartHighlightReel_Back = function ( self, event )
	self:goBack( event.controller )
	self.userData.blackBackground:close()
	self.userData.m_gameHUD:processEvent( {
		name = "open_demo_ingame_menu",
		controller = event.controller
	} )
end

local DemoHighlightReel_StartHighlightReel_Customize = function ( self, event )
	self:openMenu( "CustomizeHighlightReel", event.controller, self.userData )
	self:close()
end

local DemoHighlightReel_StartHighlightReel_Accept = function ( self, event )
	self:goBack( event.controller )
	self.userData.blackBackground:close()
	Engine.Exec( event.controller, "demo_regeneratehighlightreel" )
end

LUI.createMenu.StartHighlightReel = function ( controller, userData )
	local popup = CoD.Popup.SetupPopupChoice( "StartHighlightReel", controller, nil, CoD.Popup.Type.STRETCHED )
	popup:setLeftRight( false, false, -CoD.StartHighlightReelPopupWidth / 2, CoD.StartHighlightReelPopupWidth / 2 )
	popup:setTopBottom( false, false, (-CoD.StartHighlightReelPopupHeight - CoD.StartHighlightReelPopupHeightOffset) / 2, (CoD.StartHighlightReelPopupHeight + CoD.StartHighlightReelPopupHeightOffset) / 2 )
	popup.smallPopupBackground:setLeftRight( false, false, -CoD.StartHighlightReelPopupWidth / 2 - CoD.StartHighlightReelPopupWidthOffset - 10, CoD.StartHighlightReelPopupWidth / 2 + CoD.StartHighlightReelPopupWidthOffset + 10 )
	if CoD.isZombie == false then
		popup.smallPopupBackground:setTopBottom( false, false, -CoD.StartHighlightReelPopupHeight / 2 - CoD.StartHighlightReelPopupHeightOffset - 10, CoD.StartHighlightReelPopupHeight / 2 + 10 )
	else
		popup.smallPopupBackground:setTopBottom( false, false, -CoD.StartHighlightReelPopupHeight / 2 - CoD.StartHighlightReelPopupHeightOffset - 10, CoD.StartHighlightReelPopupHeight / 2 + 24 )
	end
	popup.userData = userData
	popup:addBackButton()
	popup:registerEventHandler( "button_prompt_back", DemoHighlightReel_StartHighlightReel_Back )
	Engine.ExecNow( controller, "demo_rebuildhighlightreeltimeline" )
	local numAvailableMoments = Engine.GetNumberOfHighlightReelMoments()
	local top = 5
	local messageText = LUI.UIText.new()
	messageText:setLeftRight( true, true, 0, 0 )
	messageText:setTopBottom( true, false, top, top + CoD.textSize.Big )
	messageText:setFont( CoD.fonts.Big )
	messageText:setAlignment( LUI.Alignment.Left )
	messageText:setText( Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL" ) )
	popup:addElement( messageText )
	top = top + CoD.textSize.Big + 10
	local descriptionText = LUI.UIText.new()
	descriptionText:setLeftRight( true, true, 0, 0 )
	descriptionText:setTopBottom( true, false, top, top + CoD.textSize.Default )
	descriptionText:setFont( CoD.fonts.Default )
	descriptionText:setAlignment( LUI.Alignment.Left )
	descriptionText:setText( Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_START_DESC" ) )
	popup:addElement( descriptionText )
	top = top + 130
	popup.availableClipsText = LUI.UIText.new()
	popup.availableClipsText:setLeftRight( true, true, 0, 0 )
	popup.availableClipsText:setTopBottom( true, false, top, top + CoD.textSize.Default )
	popup.availableClipsText:setFont( CoD.fonts.Default )
	popup.availableClipsText:setAlignment( LUI.Alignment.Left )
	popup.availableClipsText:setText( Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_NUM_AVAILABLE", numAvailableMoments ) )
	popup.availableClipsText:registerAnimationState( "original", {
		alpha = 1
	} )
	popup.availableClipsText:registerAnimationState( "pulse", {
		alpha = 0.4
	} )
	popup.availableClipsText:registerAnimationState( "pulse2", {
		alpha = 1
	} )
	popup.availableClipsText:registerEventHandler( "transition_complete_pulse", CoD.DemoHighlightReel.Pulse )
	popup.availableClipsText:registerEventHandler( "transition_complete_pulse2", CoD.DemoHighlightReel.Pulse2 )
	if numAvailableMoments <= 0 then
		popup.availableClipsText:setRGB( CoD.red.r, CoD.red.g, CoD.red.b )
		popup.availableClipsText:animateToState( "pulse" )
	else
		popup.availableClipsText:setRGB( 1, 1, 1 )
		popup.availableClipsText:animateToState( "original" )
	end
	popup:addElement( popup.availableClipsText )
	popup.choiceA:setLabel( Engine.Localize( "MENU_DEMO_CUSTOMIZE_HIGHLIGHT_REEL" ) )
	popup.choiceA:setActionEventName( "customize_highlight_reel" )
	popup.choiceB:setLabel( Engine.Localize( "MENU_DEMO_START_HIGHLIGHT_REEL" ) )
	popup.choiceB:setActionEventName( "start_highlight_reel" )
	popup.choiceB:processEvent( {
		name = "gain_focus"
	} )
	if numAvailableMoments <= 0 then
		popup.choiceB:disable()
	end
	popup:registerEventHandler( "customize_highlight_reel", DemoHighlightReel_StartHighlightReel_Customize )
	popup:registerEventHandler( "start_highlight_reel", DemoHighlightReel_StartHighlightReel_Accept )
	return popup
end

CoD.CustomizeHighlightReelPopupWidth = 647
CoD.CustomizeHighlightReelPopupHeight = 420
CoD.CustomizeHighlightReelPopupWidthOffset = 40
CoD.CustomizeHighlightReelPopupHeightOffset = 40
CoD.HIGHLIGHT_REEL_PLAYER_FILTER_ONLY_ME = 0
CoD.HIGHLIGHT_REEL_PLAYER_FILTER_FRIENDS = 1
CoD.HIGHLIGHT_REEL_PLAYER_FILTER_ME_AND_FRIENDS = 2
CoD.HIGHLIGHT_REEL_PLAYER_FILTER_FRIENDLY_TEAM = 3
CoD.HIGHLIGHT_REEL_PLAYER_FILTER_ENEMY_TEAM = 4
CoD.HIGHLIGHT_REEL_PLAYER_FILTER_EVERYONE = 5
CoD.HIGHLIGHT_REEL_TRANSITION_FILTER_NONE = 0
CoD.HIGHLIGHT_REEL_TRANSITION_FILTER_FADE = 1
CoD.HIGHLIGHT_REEL_TRANSITION_FILTER_RANDOM = 2
CoD.HIGHLIGHT_REEL_STYLES_FILTER_BEST_MOMENTS = 0
CoD.HIGHLIGHT_REEL_STYLES_FILTER_EXPLOSIVE_AND_PROJECTILE_KILLS = 1
CoD.HIGHLIGHT_REEL_STYLES_FILTER_VEHICLE_KILLS = 2
CoD.HIGHLIGHT_REEL_STYLES_FILTER_GUN_KILLS_ONLY = 3
CoD.HIGHLIGHT_REEL_STYLES_FILTER_GUN_KILLS_AND_EVENTS = 4
CoD.HIGHLIGHT_REEL_STYLES_FILTER_TURRET_KILLS = 5
CoD.HIGHLIGHT_REEL_STYLES_FILTER_DOG_KILLS = 6
CoD.HIGHLIGHT_REEL_STYLES_FILTER_ZM_RAMPAGER = 7
CoD.HIGHLIGHT_REEL_STYLES_FILTER_ZM_SAVIOR_AND_SINNER = 8
CoD.HIGHLIGHT_REEL_STYLES_FILTER_ZM_TEAM_PLAYER = 9
CoD.HIGHLIGHT_REEL_STYLES_FILTER_ZM_BIG_SPENDER = 10
CoD.HIGHLIGHT_REEL_STYLES_FILTER_ZM_HANDYMAN = 11
CoD.HIGHLIGHT_REEL_GAME_RESULT_FILTER_OFF = 0
CoD.HIGHLIGHT_REEL_GAME_RESULT_FILTER_FINAL_RESULT = 1
CoD.HIGHLIGHT_REEL_GAME_RESULT_FILTER_WITH_EVENTS = 2
CoD.HIGHLIGHT_REEL_GAME_RESULT_FILTER_ALL_RESULTS = 3
local DemoHighlightReel_CustomizeHighlightReel_Accept = function ( self, event )
	if self.userData == nil or self.userData.blackBackground == nil then
		local f8_local0 = false
	else
		local isStartupScreen = true
	end
	if f8_local0 then
		self:setPreviousMenu( nil )
		self.userData.blackBackground:close()
	end
	self:goBack( event.controller )
	if not f8_local0 then
		
	else
		
	end
	Engine.Exec( event.controller, "demo_regeneratehighlightreel" )
end

local DemoHighlightReel_CustomizeHighlightReel_OptionsChanged = function ( params )
	Engine.SetDvar( params.parentSelectorButton.m_dvarName, params.value )
	local buttonList = params.parentSelectorButton:getParent()
	if buttonList ~= nil then
		local popup = buttonList:getParent()
		if popup ~= nil and popup.continueButton ~= nil then
			Engine.ExecNow( popup:getOwner(), "demo_rebuildhighlightreeltimeline" )
			local numAvailableMoments = Engine.GetNumberOfHighlightReelMoments()
			popup.availableClipsText:setText( Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_NUM_AVAILABLE", numAvailableMoments ) )
			if numAvailableMoments <= 0 then
				popup.continueButton:disable()
				popup.availableClipsText:setRGB( CoD.red.r, CoD.red.g, CoD.red.b )
				popup.availableClipsText:animateToState( "pulse" )
			else
				popup.continueButton:enable()
				popup.availableClipsText:setRGB( 1, 1, 1 )
				popup.availableClipsText:animateToState( "original" )
			end
		end
	end
end

LUI.createMenu.CustomizeHighlightReel = function ( controller, userData )
	local popup = CoD.Menu.NewSmallPopup( "CustomizeHighlightReel" )
	popup:setLeftRight( false, false, -CoD.CustomizeHighlightReelPopupWidth / 2, CoD.CustomizeHighlightReelPopupWidth / 2 )
	popup:setTopBottom( false, false, (-CoD.CustomizeHighlightReelPopupHeight - CoD.CustomizeHighlightReelPopupHeightOffset) / 2, (CoD.CustomizeHighlightReelPopupHeight + CoD.CustomizeHighlightReelPopupHeightOffset) / 2 )
	popup.smallPopupBackground:setLeftRight( false, false, -CoD.CustomizeHighlightReelPopupWidth / 2 - CoD.CustomizeHighlightReelPopupWidthOffset - 10, CoD.CustomizeHighlightReelPopupWidth / 2 + CoD.CustomizeHighlightReelPopupWidthOffset + 10 )
	popup.smallPopupBackground:setTopBottom( false, false, -CoD.CustomizeHighlightReelPopupHeight / 2 - CoD.CustomizeHighlightReelPopupHeightOffset - 10, CoD.CustomizeHighlightReelPopupHeight / 2 + 10 )
	popup:setOwner( controller )
	popup.userData = userData
	popup:addSelectButton()
	popup:addBackButton()
	Engine.ExecNow( controller, "demo_rebuildhighlightreeltimeline" )
	local sliderSpacing = 170
	local numAvailableMoments = Engine.GetNumberOfHighlightReelMoments()
	local top = 5
	local titleText = LUI.UIText.new()
	titleText:setLeftRight( true, true, 0, 0 )
	titleText:setTopBottom( true, false, top, top + CoD.textSize.Big )
	titleText:setFont( CoD.fonts.Big )
	titleText:setAlignment( LUI.Alignment.Left )
	titleText:setText( Engine.Localize( "MENU_DEMO_CUSTOMIZE_HIGHLIGHT_REEL" ) )
	popup:addElement( titleText )
	top = top + CoD.textSize.Big
	local descriptionText = LUI.UIText.new()
	descriptionText:setLeftRight( true, true, 0, 0 )
	descriptionText:setTopBottom( true, false, top, top + CoD.textSize.Default )
	descriptionText:setFont( CoD.fonts.Default )
	descriptionText:setAlignment( LUI.Alignment.Left )
	descriptionText:setText( Engine.Localize( "MENU_DEMO_CUSTOMIZE_HIGHLIGHT_REEL_DESC" ) )
	popup:addElement( descriptionText )
	top = top + 55
	popup.availableClipsText = LUI.UIText.new()
	popup.availableClipsText:setLeftRight( true, true, 0, 0 )
	popup.availableClipsText:setTopBottom( true, false, top, top + CoD.textSize.Default )
	popup.availableClipsText:setFont( CoD.fonts.Default )
	popup.availableClipsText:setAlignment( LUI.Alignment.Left )
	popup.availableClipsText:setText( Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_NUM_AVAILABLE", numAvailableMoments ) )
	popup.availableClipsText:registerAnimationState( "original", {
		alpha = 1
	} )
	popup.availableClipsText:registerAnimationState( "pulse", {
		alpha = 0.4
	} )
	popup.availableClipsText:registerAnimationState( "pulse2", {
		alpha = 1
	} )
	popup.availableClipsText:registerEventHandler( "transition_complete_pulse", CoD.DemoHighlightReel.Pulse )
	popup.availableClipsText:registerEventHandler( "transition_complete_pulse2", CoD.DemoHighlightReel.Pulse2 )
	popup:addElement( popup.availableClipsText )
	local hintTextOffset = 85
	local buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = CoD.ButtonPrompt.Height + top + 10,
		bottom = 0
	} )
	buttonList:setSpacing( 0 )
	buttonList.hintText.hintArrow:setTopBottom( false, true, -hintTextOffset - CoD.textSize.Default, -hintTextOffset )
	buttonList.hintText.hint:setTopBottom( false, true, -hintTextOffset - CoD.textSize.Default, -hintTextOffset )
	popup:addElement( buttonList )
	popup.playerFilter = buttonList:addDvarLeftRightSelector( controller, Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_PLAYER_SETTINGS" ), "demo_highlightReelPlayerFilter", Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_PLAYER_SETTINGS_DESC" ), sliderSpacing )
	local f10_local0 = popup.playerFilter
	local f10_local1 = {}
	local f10_local2 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_PLAYER_SETTINGS_ONLY_ME" )
	local f10_local3 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_PLAYER_SETTINGS_FRIENDS" )
	local f10_local4 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_PLAYER_SETTINGS_SELF_AND_FRIENDS" )
	local f10_local5 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_PLAYER_SETTINGS_FRIENDLY_TEAM" )
	local f10_local6 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_PLAYER_SETTINGS_ENEMY_TEAM" )
	local f10_local7 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_PLAYER_SETTINGS_EVERYONE" )
	f10_local0.strings = f10_local2
	popup.playerFilter.values = {
		CoD.HIGHLIGHT_REEL_PLAYER_FILTER_ONLY_ME,
		CoD.HIGHLIGHT_REEL_PLAYER_FILTER_FRIENDS,
		CoD.HIGHLIGHT_REEL_PLAYER_FILTER_ME_AND_FRIENDS,
		CoD.HIGHLIGHT_REEL_PLAYER_FILTER_FRIENDLY_TEAM,
		CoD.HIGHLIGHT_REEL_PLAYER_FILTER_ENEMY_TEAM,
		CoD.HIGHLIGHT_REEL_PLAYER_FILTER_EVERYONE
	}
	for index = 1, #popup.playerFilter.strings, 1 do
		popup.playerFilter:addChoice( controller, Engine.Localize( popup.playerFilter.strings[index] ), popup.playerFilter.values[index], nil, DemoHighlightReel_CustomizeHighlightReel_OptionsChanged )
	end
	popup.stylesFilter = buttonList:addDvarLeftRightSelector( controller, Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS" ), "demo_highlightReelStylesFilter", Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_DESC" ), sliderSpacing )
	if CoD.isZombie == true then
		index = popup.stylesFilter
		f10_local1 = {}
		f10_local2 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_BEST_MOMENTS" )
		f10_local3 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_ZM_RAMPAGER" )
		f10_local4 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_ZM_SAVIOR_AND_SINNER" )
		f10_local5 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_ZM_TEAM_PLAYER" )
		f10_local6 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_ZM_BIG_SPENDER" )
		f10_local7 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_ZM_HANDYMAN" )
		index.strings = f10_local2
		popup.stylesFilter.values = {
			CoD.HIGHLIGHT_REEL_STYLES_FILTER_BEST_MOMENTS,
			CoD.HIGHLIGHT_REEL_STYLES_FILTER_ZM_RAMPAGER,
			CoD.HIGHLIGHT_REEL_STYLES_FILTER_ZM_SAVIOR_AND_SINNER,
			CoD.HIGHLIGHT_REEL_STYLES_FILTER_ZM_TEAM_PLAYER,
			CoD.HIGHLIGHT_REEL_STYLES_FILTER_ZM_BIG_SPENDER,
			CoD.HIGHLIGHT_REEL_STYLES_FILTER_ZM_HANDYMAN
		}
	else
		local index = popup.stylesFilter
		f10_local1 = {}
		f10_local2 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_BEST_MOMENTS" )
		f10_local3 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_EXPLOSIVE_AND_PROJECTILE" )
		f10_local4 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_VEHICLE" )
		f10_local5 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_GUN_KILLS_ONLY" )
		f10_local6 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_GUN_KILL_AND_EVENTS" )
		index.strings = f10_local2
		popup.stylesFilter.values = {
			CoD.HIGHLIGHT_REEL_STYLES_FILTER_BEST_MOMENTS,
			CoD.HIGHLIGHT_REEL_STYLES_FILTER_EXPLOSIVE_AND_PROJECTILE_KILLS,
			CoD.HIGHLIGHT_REEL_STYLES_FILTER_VEHICLE_KILLS,
			CoD.HIGHLIGHT_REEL_STYLES_FILTER_GUN_KILLS_ONLY,
			CoD.HIGHLIGHT_REEL_STYLES_FILTER_GUN_KILLS_AND_EVENTS
		}
	end
	for index = 1, #popup.stylesFilter.strings, 1 do
		popup.stylesFilter:addChoice( controller, Engine.Localize( popup.stylesFilter.strings[index] ), popup.stylesFilter.values[index], nil, DemoHighlightReel_CustomizeHighlightReel_OptionsChanged )
	end
	popup.numberOfSegments = buttonList:addDvarLeftRightSelector( controller, Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_NUMBER_OF_SEGMENTS" ), "demo_highlightReelNumberOfSegments", Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_NUMBER_OF_SEGMENTS_DESC" ), sliderSpacing )
	popup.numberOfSegments.strings = {
		5,
		10,
		20
	}
	popup.numberOfSegments.values = {
		5,
		10,
		20
	}
	for index = 1, #popup.numberOfSegments.strings, 1 do
		popup.numberOfSegments:addChoice( controller, Engine.Localize( popup.numberOfSegments.strings[index] ), popup.numberOfSegments.values[index], nil, DemoHighlightReel_CustomizeHighlightReel_OptionsChanged )
	end
	popup.minimumStars = buttonList:addDvarLeftRightSelector( controller, Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STARS" ), "demo_highlightReelMinimumStarsFilter", Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STARS_DESC" ), sliderSpacing )
	local index = popup.minimumStars
	f10_local1 = {}
	f10_local2 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STARS_ONE" )
	f10_local3 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STARS_TWO" )
	f10_local4 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STARS_THREE" )
	f10_local5 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STARS_FOUR" )
	f10_local6 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STARS_FIVE" )
	index.strings = f10_local2
	popup.minimumStars.values = {
		1,
		2,
		3,
		4,
		5
	}
	for index = 1, #popup.minimumStars.strings, 1 do
		popup.minimumStars:addChoice( controller, Engine.Localize( popup.minimumStars.strings[index] ), popup.minimumStars.values[index], nil, DemoHighlightReel_CustomizeHighlightReel_OptionsChanged )
	end
	popup.transitionFilter = buttonList:addDvarLeftRightSelector( controller, Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_TRANSITION_SETTINGS" ), "demo_highlightReelTransitionFilter", Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_TRANSITION_SETTINGS_DESC" ), sliderSpacing )
	local index = popup.transitionFilter
	f10_local1 = {}
	f10_local2 = Engine.Localize( "MENU_DEMO_TRANSITION_CUT" )
	f10_local3 = Engine.Localize( "MENU_DEMO_TRANSITION_FADE" )
	f10_local4 = Engine.Localize( "MENU_RANDOM" )
	index.strings = f10_local2
	popup.transitionFilter.values = {
		CoD.HIGHLIGHT_REEL_TRANSITION_FILTER_NONE,
		CoD.HIGHLIGHT_REEL_TRANSITION_FILTER_FADE,
		CoD.HIGHLIGHT_REEL_TRANSITION_FILTER_RANDOM
	}
	for index = 1, #popup.transitionFilter.strings, 1 do
		popup.transitionFilter:addChoice( controller, Engine.Localize( popup.transitionFilter.strings[index] ), popup.transitionFilter.values[index], nil, DemoHighlightReel_CustomizeHighlightReel_OptionsChanged )
	end
	if CoD.isZombie == false then
		popup.gameResultFilter = buttonList:addDvarLeftRightSelector( controller, Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_GAME_RESULT_SETTINGS" ), "demo_highlightReelGameResultFilter", Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_GAME_RESULT_SETTINGS_DESC" ), sliderSpacing )
		local index = popup.gameResultFilter
		f10_local1 = {}
		f10_local2 = Engine.Localize( "MENU_NO" )
		f10_local3 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_GAME_RESULT_FINAL" )
		f10_local4 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_GAME_RESULT_WITH_EVENTS" )
		f10_local5 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_GAME_RESULT_ALL" )
		index.strings = f10_local2
		popup.gameResultFilter.values = {
			CoD.HIGHLIGHT_REEL_GAME_RESULT_FILTER_OFF,
			CoD.HIGHLIGHT_REEL_GAME_RESULT_FILTER_FINAL_RESULT,
			CoD.HIGHLIGHT_REEL_GAME_RESULT_FILTER_WITH_EVENTS,
			CoD.HIGHLIGHT_REEL_GAME_RESULT_FILTER_ALL_RESULTS
		}
		for index = 1, #popup.gameResultFilter.strings, 1 do
			popup.gameResultFilter:addChoice( controller, Engine.Localize( popup.gameResultFilter.strings[index] ), popup.gameResultFilter.values[index], nil, DemoHighlightReel_CustomizeHighlightReel_OptionsChanged )
		end
	end
	buttonList:addSpacer( CoD.CoD9Button.Height * 2 )
	popup.continueButton = buttonList:addButton( Engine.Localize( "MENU_DEMO_START_HIGHLIGHT_REEL" ) )
	popup.continueButton:setActionEventName( "customize_highlight_reel_accept" )
	if numAvailableMoments <= 0 then
		popup.continueButton:disable()
		popup.availableClipsText:setRGB( CoD.red.r, CoD.red.g, CoD.red.b )
		popup.availableClipsText:animateToState( "pulse" )
	end
	popup.playerFilter:processEvent( {
		name = "gain_focus"
	} )
	popup:registerEventHandler( "customize_highlight_reel_accept", DemoHighlightReel_CustomizeHighlightReel_Accept )
	return popup
end

CoD.DemoHighlightReel.AddDemoHighlightReelInformation = function ( self )
	local demoHighlightReelInformation = LUI.UIElement.new()
	demoHighlightReelInformation:setLeftRight( false, true, -267, -17 )
	demoHighlightReelInformation:setTopBottom( true, false, 7, 167 )
	demoHighlightReelInformation:setupHighlightReelInformationDisplay()
	self.safeArea:addElement( demoHighlightReelInformation )
end

