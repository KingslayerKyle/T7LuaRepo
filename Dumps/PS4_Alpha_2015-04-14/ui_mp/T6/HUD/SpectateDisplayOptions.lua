require( "ui.T6.CoD9Button" )
require( "ui.T6.ProfileLeftRightSelector" )

CoD.SpectateDisplayOptions = InheritFrom( LUI.UIElement )
CoD.SpectateDisplayOptions.FontSize = CoD.textSize.ExtraSmall
CoD.SpectateDisplayOptions.Font = CoD.fonts.ExtraSmall
CoD.SpectateDisplayOptions.RowWidth = 310
CoD.SpectateDisplayOptions.RowHeight = CoD.SpectatePlayerInfo.FontSize + 6
CoD.SpectateDisplayOptions.RowSpacing = 3
CoD.SpectateDisplayOptions.MaxRows = 14
CoD.SpectateDisplayOptions.Top = 70
CoD.SpectateDisplayOptions.ProfileSelectorHorizontalGap = 220
local SpectateDisplayOptions_OptionsChanged = function ( params )
	Engine.SetProfileVar( params.parentSelectorButton.m_currentController, params.parentSelectorButton.m_profileVarName, params.value )
	local buttonList = params.parentSelectorButton:getParent()
	if buttonList ~= nil then
		buttonList.eventTarget:dispatchEventToParent( {
			name = "spectate_display_options_changed",
			controller = params.parentSelectorButton.m_currentController,
			profileVar = params.parentSelectorButton.m_profileVarName,
			profileValue = params.value
		} )
	end
end

CoD.SpectateDisplayOptions.Button_AddChoices = function ( button, callbackFunction )
	if button.strings == nil or #button.strings == 0 then
		return 
	elseif callbackFunction == nil then
		callbackFunction = SpectateDisplayOptions_OptionsChanged
	end
	for index = 1, #button.strings, 1 do
		button:addChoice( Engine.Localize( button.strings[index] ), button.values[index], nil, callbackFunction )
	end
end

CoD.SpectateDisplayOptions.Button_AddChoices_OnOrOff = function ( button, callbackFunction )
	local f3_local0 = {}
	local f3_local1 = Engine.Localize( "MENU_OFF" )
	local f3_local2 = Engine.Localize( "MENU_ON" )
	button.strings = f3_local1
	button.values = {
		0,
		1
	}
	CoD.SpectateDisplayOptions.Button_AddChoices( button, callbackFunction )
end

CoD.SpectateDisplayOptions.AddProfileLeftRightSelector = function ( self, controller, text, profileVarName, hintText, horizontalGap, priority )
	local newButtonDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.SpectateDisplayOptions.RowHeight
	}
	if horizontalGap == nil then
		horizontalGap = CoD.SpectateDisplayOptions.ProfileSelectorHorizontalGap
	end
	local newButton = CoD.ProfileLeftRightSelector.new( controller, text, profileVarName, horizontalGap, newButtonDefaultAnimState )
	newButton.label:setFont( CoD.SpectateDisplayOptions.Font )
	newButton.label:setLeftRight( true, false, 20, horizontalGap )
	newButton.label:setTopBottom( false, false, -CoD.SpectateDisplayOptions.FontSize / 2, CoD.SpectateDisplayOptions.FontSize / 2 )
	if newButton.leftArrow then
		newButton.leftArrow:setLeftRight( true, false, 0, CoD.SpectateDisplayOptions.FontSize )
		newButton.leftArrow:setTopBottom( false, false, -CoD.SpectateDisplayOptions.FontSize / 2, CoD.SpectateDisplayOptions.FontSize / 2 )
	end
	newButton.choiceText:setFont( CoD.SpectateDisplayOptions.Font )
	newButton.choiceText:setTopBottom( false, false, -CoD.SpectateDisplayOptions.FontSize / 2, CoD.SpectateDisplayOptions.FontSize / 2 )
	if newButton.rightArrow then
		newButton.rightArrow:setLeftRight( true, false, 0, CoD.SpectateDisplayOptions.FontSize )
		newButton.rightArrow:setTopBottom( false, false, -CoD.SpectateDisplayOptions.FontSize / 2, CoD.SpectateDisplayOptions.FontSize / 2 )
	end
	newButton.hintText = hintText
	newButton:setPriority( priority )
	local bgImage = LUI.UIImage.new()
	bgImage:setLeftRight( true, true, 0, 0 )
	bgImage:setTopBottom( true, true, 0, 0 )
	bgImage:setRGB( 0.1, 0.1, 0.1 )
	bgImage:setAlpha( 0.7 )
	bgImage:setPriority( -100 )
	newButton:addElement( bgImage )
	self:addElement( newButton )
	CoD.ButtonList.AssociateHintTextListenerToButton( newButton )
	return newButton
end

CoD.SpectateDisplayOptions.new = function ( controller )
	local spectateDisplayOptions = LUI.UIVerticalList.new()
	spectateDisplayOptions:setLeftRight( true, false, 0, CoD.SpectateDisplayOptions.RowWidth )
	spectateDisplayOptions:setTopBottom( true, true, CoD.SpectateDisplayOptions.Top, 0 )
	spectateDisplayOptions:setClass( CoD.SpectateDisplayOptions )
	local top = CoD.SpectateDisplayOptions.Top + CoD.SpectateDisplayOptions.RowHeight
	local spacing = CoD.SpectateDisplayOptions.RowSpacing
	local height = CoD.SpectateDisplayOptions.RowHeight
	local maxRows = CoD.SpectateDisplayOptions.MaxRows
	local listHeight = height * maxRows + spacing * maxRows
	local numShoutcasterOptions = 2
	spectateDisplayOptions.buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 50,
		right = CoD.SpectatePlayerInfo.RowWidth + 90,
		topAnchor = false,
		bottomAnchor = true,
		top = -listHeight,
		bottom = 100
	} )
	spectateDisplayOptions.buttonList.id = "displayOptionsButtonList"
	spectateDisplayOptions.buttonList:setSpacing( spacing )
	spectateDisplayOptions.buttonList.addProfileLeftRightSelector = CoD.SpectateDisplayOptions.AddProfileLeftRightSelector
	spectateDisplayOptions.buttonList.hintText.hint:setTopBottom( true, false, 0, CoD.SpectateDisplayOptions.FontSize )
	spectateDisplayOptions.buttonList.eventTarget = spectateDisplayOptions
	spectateDisplayOptions:addElement( spectateDisplayOptions.buttonList )
	spectateDisplayOptions.scorePanelBtn = spectateDisplayOptions.buttonList:addProfileLeftRightSelector( controller, Engine.Localize( "MPUI_SCORE_PANEL" ), "shoutcaster_scorepanel", Engine.Localize( "MPUI_SCORE_PANEL_DESC" ) )
	CoD.SpectateDisplayOptions.Button_AddChoices_OnOrOff( spectateDisplayOptions.scorePanelBtn )
	local namePlateProfileVar = nil
	if Engine.IsDemoShoutcaster() then
		namePlateProfileVar = "demo_shoutcaster_nameplate"
	else
		namePlateProfileVar = "shoutcaster_nameplate"
	end
	spectateDisplayOptions.namePlateBtn = spectateDisplayOptions.buttonList:addProfileLeftRightSelector( controller, Engine.Localize( "MPUI_NAME_PLATE" ), namePlateProfileVar, Engine.Localize( "MPUI_NAME_PLATE_DESC" ) )
	CoD.SpectateDisplayOptions.Button_AddChoices_OnOrOff( spectateDisplayOptions.namePlateBtn )
	spectateDisplayOptions.mapIconColorsBtn = spectateDisplayOptions.buttonList:addProfileLeftRightSelector( controller, Engine.Localize( "MPUI_MAP_ICON_COLORS" ), "shoutcaster_map_icon_colors", Engine.Localize( "MPUI_MAP_ICON_COLORS_DESC" ) )
	local f5_local0 = spectateDisplayOptions.mapIconColorsBtn
	local f5_local1 = {}
	local f5_local2 = Engine.Localize( "MPUI_DEFAULT_TEAM_COLORS" )
	local f5_local3 = Engine.Localize( "MPUI_FACTION_TEAM_COLORS" )
	f5_local0.strings = f5_local2
	spectateDisplayOptions.mapIconColorsBtn.values = {
		0,
		1
	}
	CoD.SpectateDisplayOptions.Button_AddChoices( spectateDisplayOptions.mapIconColorsBtn )
	spectateDisplayOptions.mapInPlayerColumnBtn = spectateDisplayOptions.buttonList:addProfileLeftRightSelector( controller, Engine.Localize( "MPUI_MAP_IN_PLAYER_COLUMN" ), "shoutcaster_map_in_player_column", Engine.Localize( "MPUI_MAP_IN_PLAYER_COLUMN_DESC" ) )
	CoD.SpectateDisplayOptions.Button_AddChoices_OnOrOff( spectateDisplayOptions.mapInPlayerColumnBtn )
	local headerText = spectateDisplayOptions.buttonList:addText( Engine.Localize( "MPUI_HUD_CAPS" ) )
	headerText:setTopBottom( true, false, 0, CoD.SpectateDisplayOptions.RowHeight )
	headerText:setFont( CoD.SpectatePlayerInfo.HeaderFont )
	spectateDisplayOptions.perksBtn = spectateDisplayOptions.buttonList:addProfileLeftRightSelector( controller, Engine.Localize( "MPUI_PERKS" ), "shoutcaster_perks", Engine.Localize( "MPUI_PERKS_DESC" ) )
	f5_local1 = spectateDisplayOptions.perksBtn
	f5_local2 = {}
	f5_local3 = Engine.Localize( "MENU_ON_SPAWN" )
	local f5_local4 = Engine.Localize( "MENU_OFF" )
	local f5_local5 = Engine.Localize( "MPUI_ALWAYS_ON" )
	f5_local1.strings = f5_local3
	spectateDisplayOptions.perksBtn.values = {
		1,
		0,
		2
	}
	CoD.SpectateDisplayOptions.Button_AddChoices( spectateDisplayOptions.perksBtn )
	spectateDisplayOptions.inventoryBtn = spectateDisplayOptions.buttonList:addProfileLeftRightSelector( controller, Engine.Localize( "MENU_INVENTORY" ), "shoutcaster_inventory", Engine.Localize( "MPUI_INVENTORY_DESC" ) )
	CoD.SpectateDisplayOptions.Button_AddChoices_OnOrOff( spectateDisplayOptions.inventoryBtn )
	spectateDisplayOptions.scoreStreaksBtn = spectateDisplayOptions.buttonList:addProfileLeftRightSelector( controller, Engine.Localize( "MPUI_SCORE_STREAKS" ), "shoutcaster_scorestreaks", Engine.Localize( "MPUI_SCORE_STREAKS_DESC" ) )
	CoD.SpectateDisplayOptions.Button_AddChoices_OnOrOff( spectateDisplayOptions.scoreStreaksBtn )
	spectateDisplayOptions.scoreStreaksNotificationBtn = spectateDisplayOptions.buttonList:addProfileLeftRightSelector( controller, Engine.Localize( "MPUI_SCORE_STREAKS_NOTIFICATIONS" ), "shoutcaster_scorestreaksnotification", Engine.Localize( "MPUI_SCORE_STREAKS_NOTIFICATIONS_DESC" ) )
	CoD.SpectateDisplayOptions.Button_AddChoices_OnOrOff( spectateDisplayOptions.scoreStreaksNotificationBtn )
	spectateDisplayOptions.minimapBtn = spectateDisplayOptions.buttonList:addProfileLeftRightSelector( controller, Engine.Localize( "MPUI_MINIMAP" ), "shoutcaster_minimap", Engine.Localize( "MPUI_MINIMAP_DESC" ) )
	CoD.SpectateDisplayOptions.Button_AddChoices_OnOrOff( spectateDisplayOptions.minimapBtn )
	spectateDisplayOptions.killfeedBtn = spectateDisplayOptions.buttonList:addProfileLeftRightSelector( controller, Engine.Localize( "MPUI_KILLFEED" ), "shoutcaster_killfeed", Engine.Localize( "MPUI_KILLFEED_DESC" ) )
	CoD.SpectateDisplayOptions.Button_AddChoices_OnOrOff( spectateDisplayOptions.killfeedBtn )
	spectateDisplayOptions.calloutCardsBtn = spectateDisplayOptions.buttonList:addProfileLeftRightSelector( controller, Engine.Localize( "MPUI_CALLOUT_CARDS" ), "shoutcaster_calloutcards", Engine.Localize( "MPUI_CALLOUT_CARDS_DESC" ) )
	CoD.SpectateDisplayOptions.Button_AddChoices_OnOrOff( spectateDisplayOptions.calloutCardsBtn )
	spectateDisplayOptions.teamScoreBtn = spectateDisplayOptions.buttonList:addProfileLeftRightSelector( controller, Engine.Localize( "MPUI_TEAM_SCORE" ), "shoutcaster_teamscore", Engine.Localize( "MPUI_TEAM_SCORE_DESC" ) )
	CoD.SpectateDisplayOptions.Button_AddChoices_OnOrOff( spectateDisplayOptions.teamScoreBtn )
	spectateDisplayOptions.playerNotificationsBtn = spectateDisplayOptions.buttonList:addProfileLeftRightSelector( controller, Engine.Localize( "MPUI_PLAYER_NOTIFICATIONS" ), "shoutcaster_playernotifications", Engine.Localize( "MPUI_PLAYER_NOTIFICATIONS_DESC" ) )
	CoD.SpectateDisplayOptions.Button_AddChoices_OnOrOff( spectateDisplayOptions.playerNotificationsBtn )
	spectateDisplayOptions.voipDockBtn = spectateDisplayOptions.buttonList:addProfileLeftRightSelector( controller, Engine.Localize( "MPUI_VOICE_ICON" ), "shoutcaster_voipdock", Engine.Localize( "MPUI_VOICE_ICON_DESC" ) )
	CoD.SpectateDisplayOptions.Button_AddChoices_OnOrOff( spectateDisplayOptions.voipDockBtn )
	return spectateDisplayOptions
end

