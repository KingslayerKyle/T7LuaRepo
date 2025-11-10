CoD.DemoHighlightReel = {}
CoD.DemoHighlightReel.OpenStartHighlightReel = function ( f1_arg0, f1_arg1 )
	local f1_local0 = {
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
		m_gameHUD = f1_arg0
	}
	local f1_local1 = f1_arg0:openPopup( "StartHighlightReel", f1_arg1.controller, f1_local0 )
	f1_arg0:addElement( f1_local0.blackBackground )
	Dvar.demo_pause:set( true )
end

CoD.DemoHighlightReel.Pulse = function ( f2_arg0, f2_arg1 )
	if not f2_arg1.interrupted then
		f2_arg0:animateToState( "pulse2", 500 )
	end
end

CoD.DemoHighlightReel.Pulse2 = function ( f3_arg0, f3_arg1 )
	if not f3_arg1.interrupted then
		f3_arg0:animateToState( "pulse", 500 )
	end
end

CoD.StartHighlightReelPopupWidth = 553
CoD.StartHighlightReelPopupHeight = 316
CoD.StartHighlightReelPopupWidthOffset = 40
CoD.StartHighlightReelPopupHeightOffset = 40
local f0_local0 = function ( f4_arg0, f4_arg1 )
	f4_arg0:goBack( f4_arg1.controller )
	f4_arg0.userData.blackBackground:close()
	f4_arg0.userData.m_gameHUD:processEvent( {
		name = "open_demo_ingame_menu",
		controller = f4_arg1.controller
	} )
end

local f0_local1 = function ( f5_arg0, f5_arg1 )
	f5_arg0:openMenu( "CustomizeHighlightReel", f5_arg1.controller, f5_arg0.userData )
	f5_arg0:close()
end

local f0_local2 = function ( f6_arg0, f6_arg1 )
	f6_arg0:goBack( f6_arg1.controller )
	f6_arg0.userData.blackBackground:close()
	Engine.Exec( f6_arg1.controller, "demo_regeneratehighlightreel" )
end

LUI.createMenu.StartHighlightReel = function ( f7_arg0, f7_arg1 )
	local f7_local0 = CoD.Popup.SetupPopupChoice( "StartHighlightReel", f7_arg0, nil, CoD.Popup.Type.STRETCHED )
	f7_local0:setLeftRight( false, false, -CoD.StartHighlightReelPopupWidth / 2, CoD.StartHighlightReelPopupWidth / 2 )
	f7_local0:setTopBottom( false, false, (-CoD.StartHighlightReelPopupHeight - CoD.StartHighlightReelPopupHeightOffset) / 2, (CoD.StartHighlightReelPopupHeight + CoD.StartHighlightReelPopupHeightOffset) / 2 )
	f7_local0.smallPopupBackground:setLeftRight( false, false, -CoD.StartHighlightReelPopupWidth / 2 - CoD.StartHighlightReelPopupWidthOffset - 10, CoD.StartHighlightReelPopupWidth / 2 + CoD.StartHighlightReelPopupWidthOffset + 10 )
	if CoD.isZombie == false then
		f7_local0.smallPopupBackground:setTopBottom( false, false, -CoD.StartHighlightReelPopupHeight / 2 - CoD.StartHighlightReelPopupHeightOffset - 10, CoD.StartHighlightReelPopupHeight / 2 + 10 )
	else
		f7_local0.smallPopupBackground:setTopBottom( false, false, -CoD.StartHighlightReelPopupHeight / 2 - CoD.StartHighlightReelPopupHeightOffset - 10, CoD.StartHighlightReelPopupHeight / 2 + 24 )
	end
	f7_local0.userData = f7_arg1
	f7_local0:addBackButton()
	f7_local0:registerEventHandler( "button_prompt_back", f0_local0 )
	Engine.ExecNow( f7_arg0, "demo_rebuildhighlightreeltimeline" )
	local f7_local1 = Engine.GetNumberOfHighlightReelMoments()
	local f7_local2 = 5
	local self = LUI.UIText.new()
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, false, f7_local2, f7_local2 + CoD.textSize.Big )
	self:setFont( CoD.fonts.Big )
	self:setAlignment( LUI.Alignment.Left )
	self:setText( Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL" ) )
	f7_local0:addElement( self )
	f7_local2 = f7_local2 + CoD.textSize.Big + 10
	local f7_local4 = LUI.UIText.new()
	f7_local4:setLeftRight( true, true, 0, 0 )
	f7_local4:setTopBottom( true, false, f7_local2, f7_local2 + CoD.textSize.Default )
	f7_local4:setFont( CoD.fonts.Default )
	f7_local4:setAlignment( LUI.Alignment.Left )
	f7_local4:setText( Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_START_DESC" ) )
	f7_local0:addElement( f7_local4 )
	f7_local2 = f7_local2 + 130
	f7_local0.availableClipsText = LUI.UIText.new()
	f7_local0.availableClipsText:setLeftRight( true, true, 0, 0 )
	f7_local0.availableClipsText:setTopBottom( true, false, f7_local2, f7_local2 + CoD.textSize.Default )
	f7_local0.availableClipsText:setFont( CoD.fonts.Default )
	f7_local0.availableClipsText:setAlignment( LUI.Alignment.Left )
	f7_local0.availableClipsText:setText( Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_NUM_AVAILABLE", f7_local1 ) )
	f7_local0.availableClipsText:registerAnimationState( "original", {
		alpha = 1
	} )
	f7_local0.availableClipsText:registerAnimationState( "pulse", {
		alpha = 0.4
	} )
	f7_local0.availableClipsText:registerAnimationState( "pulse2", {
		alpha = 1
	} )
	f7_local0.availableClipsText:registerEventHandler( "transition_complete_pulse", CoD.DemoHighlightReel.Pulse )
	f7_local0.availableClipsText:registerEventHandler( "transition_complete_pulse2", CoD.DemoHighlightReel.Pulse2 )
	if f7_local1 <= 0 then
		f7_local0.availableClipsText:setRGB( CoD.red.r, CoD.red.g, CoD.red.b )
		f7_local0.availableClipsText:animateToState( "pulse" )
	else
		f7_local0.availableClipsText:setRGB( 1, 1, 1 )
		f7_local0.availableClipsText:animateToState( "original" )
	end
	f7_local0:addElement( f7_local0.availableClipsText )
	f7_local0.choiceA:setLabel( Engine.Localize( "MENU_DEMO_CUSTOMIZE_HIGHLIGHT_REEL" ) )
	f7_local0.choiceA:setActionEventName( "customize_highlight_reel" )
	f7_local0.choiceB:setLabel( Engine.Localize( "MENU_DEMO_START_HIGHLIGHT_REEL" ) )
	f7_local0.choiceB:setActionEventName( "start_highlight_reel" )
	f7_local0.choiceB:processEvent( {
		name = "gain_focus"
	} )
	if f7_local1 <= 0 then
		f7_local0.choiceB:disable()
	end
	f7_local0:registerEventHandler( "customize_highlight_reel", f0_local1 )
	f7_local0:registerEventHandler( "start_highlight_reel", f0_local2 )
	return f7_local0
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
local f0_local3 = function ( f8_arg0, f8_arg1 )
	local f8_local0
	if f8_arg0.userData == nil or f8_arg0.userData.blackBackground == nil then
		f8_local0 = false
	else
		f8_local0 = true
	end
	if f8_local0 then
		f8_arg0:setPreviousMenu( nil )
		f8_arg0.userData.blackBackground:close()
	end
	f8_arg0:goBack( f8_arg1.controller )
	if not f8_local0 then
		
	else
		
	end
	Engine.Exec( f8_arg1.controller, "demo_regeneratehighlightreel" )
end

local f0_local4 = function ( f9_arg0 )
	Engine.SetDvar( f9_arg0.parentSelectorButton.m_dvarName, f9_arg0.value )
	local f9_local0 = f9_arg0.parentSelectorButton:getParent()
	if f9_local0 ~= nil then
		local f9_local1 = f9_local0:getParent()
		if f9_local1 ~= nil and f9_local1.continueButton ~= nil then
			Engine.ExecNow( f9_local1:getOwner(), "demo_rebuildhighlightreeltimeline" )
			local f9_local2 = Engine.GetNumberOfHighlightReelMoments()
			f9_local1.availableClipsText:setText( Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_NUM_AVAILABLE", f9_local2 ) )
			if f9_local2 <= 0 then
				f9_local1.continueButton:disable()
				f9_local1.availableClipsText:setRGB( CoD.red.r, CoD.red.g, CoD.red.b )
				f9_local1.availableClipsText:animateToState( "pulse" )
			else
				f9_local1.continueButton:enable()
				f9_local1.availableClipsText:setRGB( 1, 1, 1 )
				f9_local1.availableClipsText:animateToState( "original" )
			end
		end
	end
end

LUI.createMenu.CustomizeHighlightReel = function ( f10_arg0, f10_arg1 )
	local f10_local0 = CoD.Menu.NewSmallPopup( "CustomizeHighlightReel" )
	f10_local0:setLeftRight( false, false, -CoD.CustomizeHighlightReelPopupWidth / 2, CoD.CustomizeHighlightReelPopupWidth / 2 )
	f10_local0:setTopBottom( false, false, (-CoD.CustomizeHighlightReelPopupHeight - CoD.CustomizeHighlightReelPopupHeightOffset) / 2, (CoD.CustomizeHighlightReelPopupHeight + CoD.CustomizeHighlightReelPopupHeightOffset) / 2 )
	f10_local0.smallPopupBackground:setLeftRight( false, false, -CoD.CustomizeHighlightReelPopupWidth / 2 - CoD.CustomizeHighlightReelPopupWidthOffset - 10, CoD.CustomizeHighlightReelPopupWidth / 2 + CoD.CustomizeHighlightReelPopupWidthOffset + 10 )
	f10_local0.smallPopupBackground:setTopBottom( false, false, -CoD.CustomizeHighlightReelPopupHeight / 2 - CoD.CustomizeHighlightReelPopupHeightOffset - 10, CoD.CustomizeHighlightReelPopupHeight / 2 + 10 )
	f10_local0:setOwner( f10_arg0 )
	f10_local0.userData = f10_arg1
	f10_local0:addSelectButton()
	f10_local0:addBackButton()
	Engine.ExecNow( f10_arg0, "demo_rebuildhighlightreeltimeline" )
	local f10_local1 = 170
	local f10_local2 = Engine.GetNumberOfHighlightReelMoments()
	local f10_local3 = 5
	local self = LUI.UIText.new()
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, false, f10_local3, f10_local3 + CoD.textSize.Big )
	self:setFont( CoD.fonts.Big )
	self:setAlignment( LUI.Alignment.Left )
	self:setText( Engine.Localize( "MENU_DEMO_CUSTOMIZE_HIGHLIGHT_REEL" ) )
	f10_local0:addElement( self )
	f10_local3 = f10_local3 + CoD.textSize.Big
	local f10_local5 = LUI.UIText.new()
	f10_local5:setLeftRight( true, true, 0, 0 )
	f10_local5:setTopBottom( true, false, f10_local3, f10_local3 + CoD.textSize.Default )
	f10_local5:setFont( CoD.fonts.Default )
	f10_local5:setAlignment( LUI.Alignment.Left )
	f10_local5:setText( Engine.Localize( "MENU_DEMO_CUSTOMIZE_HIGHLIGHT_REEL_DESC" ) )
	f10_local0:addElement( f10_local5 )
	f10_local3 = f10_local3 + 55
	f10_local0.availableClipsText = LUI.UIText.new()
	f10_local0.availableClipsText:setLeftRight( true, true, 0, 0 )
	f10_local0.availableClipsText:setTopBottom( true, false, f10_local3, f10_local3 + CoD.textSize.Default )
	f10_local0.availableClipsText:setFont( CoD.fonts.Default )
	f10_local0.availableClipsText:setAlignment( LUI.Alignment.Left )
	f10_local0.availableClipsText:setText( Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_NUM_AVAILABLE", f10_local2 ) )
	f10_local0.availableClipsText:registerAnimationState( "original", {
		alpha = 1
	} )
	f10_local0.availableClipsText:registerAnimationState( "pulse", {
		alpha = 0.4
	} )
	f10_local0.availableClipsText:registerAnimationState( "pulse2", {
		alpha = 1
	} )
	f10_local0.availableClipsText:registerEventHandler( "transition_complete_pulse", CoD.DemoHighlightReel.Pulse )
	f10_local0.availableClipsText:registerEventHandler( "transition_complete_pulse2", CoD.DemoHighlightReel.Pulse2 )
	f10_local0:addElement( f10_local0.availableClipsText )
	local f10_local6 = 85
	local f10_local7 = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = CoD.ButtonPrompt.Height + f10_local3 + 10,
		bottom = 0
	} )
	f10_local7:setSpacing( 0 )
	f10_local7.hintText.hintArrow:setTopBottom( false, true, -f10_local6 - CoD.textSize.Default, -f10_local6 )
	f10_local7.hintText.hint:setTopBottom( false, true, -f10_local6 - CoD.textSize.Default, -f10_local6 )
	f10_local0:addElement( f10_local7 )
	f10_local0.playerFilter = f10_local7:addDvarLeftRightSelector( f10_arg0, Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_PLAYER_SETTINGS" ), "demo_highlightReelPlayerFilter", Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_PLAYER_SETTINGS_DESC" ), f10_local1 )
	local f10_local8 = f10_local0.playerFilter
	local f10_local9 = {}
	local f10_local10 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_PLAYER_SETTINGS_ONLY_ME" )
	local f10_local11 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_PLAYER_SETTINGS_FRIENDS" )
	local f10_local12 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_PLAYER_SETTINGS_SELF_AND_FRIENDS" )
	local f10_local13 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_PLAYER_SETTINGS_FRIENDLY_TEAM" )
	local f10_local14 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_PLAYER_SETTINGS_ENEMY_TEAM" )
	local f10_local15 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_PLAYER_SETTINGS_EVERYONE" )
	f10_local8.strings = f10_local10
	f10_local0.playerFilter.values = {
		CoD.HIGHLIGHT_REEL_PLAYER_FILTER_ONLY_ME,
		CoD.HIGHLIGHT_REEL_PLAYER_FILTER_FRIENDS,
		CoD.HIGHLIGHT_REEL_PLAYER_FILTER_ME_AND_FRIENDS,
		CoD.HIGHLIGHT_REEL_PLAYER_FILTER_FRIENDLY_TEAM,
		CoD.HIGHLIGHT_REEL_PLAYER_FILTER_ENEMY_TEAM,
		CoD.HIGHLIGHT_REEL_PLAYER_FILTER_EVERYONE
	}
	for f10_local8 = 1, #f10_local0.playerFilter.strings, 1 do
		f10_local0.playerFilter:addChoice( f10_arg0, Engine.Localize( f10_local0.playerFilter.strings[f10_local8] ), f10_local0.playerFilter.values[f10_local8], nil, f0_local4 )
	end
	f10_local0.stylesFilter = f10_local7:addDvarLeftRightSelector( f10_arg0, Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS" ), "demo_highlightReelStylesFilter", Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_DESC" ), f10_local1 )
	if CoD.isZombie == true then
		f10_local8 = f10_local0.stylesFilter
		f10_local9 = {}
		f10_local10 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_BEST_MOMENTS" )
		f10_local11 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_ZM_RAMPAGER" )
		f10_local12 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_ZM_SAVIOR_AND_SINNER" )
		f10_local13 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_ZM_TEAM_PLAYER" )
		f10_local14 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_ZM_BIG_SPENDER" )
		f10_local15 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_ZM_HANDYMAN" )
		f10_local8.strings = f10_local10
		f10_local0.stylesFilter.values = {
			CoD.HIGHLIGHT_REEL_STYLES_FILTER_BEST_MOMENTS,
			CoD.HIGHLIGHT_REEL_STYLES_FILTER_ZM_RAMPAGER,
			CoD.HIGHLIGHT_REEL_STYLES_FILTER_ZM_SAVIOR_AND_SINNER,
			CoD.HIGHLIGHT_REEL_STYLES_FILTER_ZM_TEAM_PLAYER,
			CoD.HIGHLIGHT_REEL_STYLES_FILTER_ZM_BIG_SPENDER,
			CoD.HIGHLIGHT_REEL_STYLES_FILTER_ZM_HANDYMAN
		}
	else
		f10_local8 = f10_local0.stylesFilter
		f10_local9 = {}
		f10_local10 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_BEST_MOMENTS" )
		f10_local11 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_EXPLOSIVE_AND_PROJECTILE" )
		f10_local12 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_VEHICLE" )
		f10_local13 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_GUN_KILLS_ONLY" )
		f10_local14 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STYLE_SETTINGS_GUN_KILL_AND_EVENTS" )
		f10_local8.strings = f10_local10
		f10_local0.stylesFilter.values = {
			CoD.HIGHLIGHT_REEL_STYLES_FILTER_BEST_MOMENTS,
			CoD.HIGHLIGHT_REEL_STYLES_FILTER_EXPLOSIVE_AND_PROJECTILE_KILLS,
			CoD.HIGHLIGHT_REEL_STYLES_FILTER_VEHICLE_KILLS,
			CoD.HIGHLIGHT_REEL_STYLES_FILTER_GUN_KILLS_ONLY,
			CoD.HIGHLIGHT_REEL_STYLES_FILTER_GUN_KILLS_AND_EVENTS
		}
	end
	for f10_local8 = 1, #f10_local0.stylesFilter.strings, 1 do
		f10_local0.stylesFilter:addChoice( f10_arg0, Engine.Localize( f10_local0.stylesFilter.strings[f10_local8] ), f10_local0.stylesFilter.values[f10_local8], nil, f0_local4 )
	end
	f10_local0.numberOfSegments = f10_local7:addDvarLeftRightSelector( f10_arg0, Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_NUMBER_OF_SEGMENTS" ), "demo_highlightReelNumberOfSegments", Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_NUMBER_OF_SEGMENTS_DESC" ), f10_local1 )
	f10_local0.numberOfSegments.strings = {
		5,
		10,
		20
	}
	f10_local0.numberOfSegments.values = {
		5,
		10,
		20
	}
	for f10_local8 = 1, #f10_local0.numberOfSegments.strings, 1 do
		f10_local0.numberOfSegments:addChoice( f10_arg0, Engine.Localize( f10_local0.numberOfSegments.strings[f10_local8] ), f10_local0.numberOfSegments.values[f10_local8], nil, f0_local4 )
	end
	f10_local0.minimumStars = f10_local7:addDvarLeftRightSelector( f10_arg0, Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STARS" ), "demo_highlightReelMinimumStarsFilter", Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STARS_DESC" ), f10_local1 )
	f10_local8 = f10_local0.minimumStars
	f10_local9 = {}
	f10_local10 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STARS_ONE" )
	f10_local11 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STARS_TWO" )
	f10_local12 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STARS_THREE" )
	f10_local13 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STARS_FOUR" )
	f10_local14 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_STARS_FIVE" )
	f10_local8.strings = f10_local10
	f10_local0.minimumStars.values = {
		1,
		2,
		3,
		4,
		5
	}
	for f10_local8 = 1, #f10_local0.minimumStars.strings, 1 do
		f10_local0.minimumStars:addChoice( f10_arg0, Engine.Localize( f10_local0.minimumStars.strings[f10_local8] ), f10_local0.minimumStars.values[f10_local8], nil, f0_local4 )
	end
	f10_local0.transitionFilter = f10_local7:addDvarLeftRightSelector( f10_arg0, Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_TRANSITION_SETTINGS" ), "demo_highlightReelTransitionFilter", Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_TRANSITION_SETTINGS_DESC" ), f10_local1 )
	f10_local8 = f10_local0.transitionFilter
	f10_local9 = {}
	f10_local10 = Engine.Localize( "MENU_DEMO_TRANSITION_CUT" )
	f10_local11 = Engine.Localize( "MENU_DEMO_TRANSITION_FADE" )
	f10_local12 = Engine.Localize( "MENU_RANDOM" )
	f10_local8.strings = f10_local10
	f10_local0.transitionFilter.values = {
		CoD.HIGHLIGHT_REEL_TRANSITION_FILTER_NONE,
		CoD.HIGHLIGHT_REEL_TRANSITION_FILTER_FADE,
		CoD.HIGHLIGHT_REEL_TRANSITION_FILTER_RANDOM
	}
	for f10_local8 = 1, #f10_local0.transitionFilter.strings, 1 do
		f10_local0.transitionFilter:addChoice( f10_arg0, Engine.Localize( f10_local0.transitionFilter.strings[f10_local8] ), f10_local0.transitionFilter.values[f10_local8], nil, f0_local4 )
	end
	if CoD.isZombie == false then
		f10_local0.gameResultFilter = f10_local7:addDvarLeftRightSelector( f10_arg0, Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_GAME_RESULT_SETTINGS" ), "demo_highlightReelGameResultFilter", Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_GAME_RESULT_SETTINGS_DESC" ), f10_local1 )
		f10_local8 = f10_local0.gameResultFilter
		f10_local9 = {}
		f10_local10 = Engine.Localize( "MENU_NO" )
		f10_local11 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_GAME_RESULT_FINAL" )
		f10_local12 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_GAME_RESULT_WITH_EVENTS" )
		f10_local13 = Engine.Localize( "MENU_DEMO_HIGHLIGHT_REEL_GAME_RESULT_ALL" )
		f10_local8.strings = f10_local10
		f10_local0.gameResultFilter.values = {
			CoD.HIGHLIGHT_REEL_GAME_RESULT_FILTER_OFF,
			CoD.HIGHLIGHT_REEL_GAME_RESULT_FILTER_FINAL_RESULT,
			CoD.HIGHLIGHT_REEL_GAME_RESULT_FILTER_WITH_EVENTS,
			CoD.HIGHLIGHT_REEL_GAME_RESULT_FILTER_ALL_RESULTS
		}
		for f10_local8 = 1, #f10_local0.gameResultFilter.strings, 1 do
			f10_local0.gameResultFilter:addChoice( f10_arg0, Engine.Localize( f10_local0.gameResultFilter.strings[f10_local8] ), f10_local0.gameResultFilter.values[f10_local8], nil, f0_local4 )
		end
	end
	f10_local7:addSpacer( CoD.CoD9Button.Height * 2 )
	f10_local0.continueButton = f10_local7:addButton( Engine.Localize( "MENU_DEMO_START_HIGHLIGHT_REEL" ) )
	f10_local0.continueButton:setActionEventName( "customize_highlight_reel_accept" )
	if f10_local2 <= 0 then
		f10_local0.continueButton:disable()
		f10_local0.availableClipsText:setRGB( CoD.red.r, CoD.red.g, CoD.red.b )
		f10_local0.availableClipsText:animateToState( "pulse" )
	end
	f10_local0.playerFilter:processEvent( {
		name = "gain_focus"
	} )
	f10_local0:registerEventHandler( "customize_highlight_reel_accept", f0_local3 )
	return f10_local0
end

CoD.DemoHighlightReel.AddDemoHighlightReelInformation = function ( f11_arg0 )
	local self = LUI.UIElement.new()
	self:setLeftRight( false, true, -267, -17 )
	self:setTopBottom( true, false, 7, 167 )
	self:setupHighlightReelInformationDisplay()
	f11_arg0.safeArea:addElement( self )
end

