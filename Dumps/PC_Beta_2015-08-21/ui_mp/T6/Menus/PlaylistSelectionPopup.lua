require( "ui.T6.CategoryButton" )
require( "ui.T6.PlaylistButton" )
require( "ui.T6.Menus.SearchPreferencesPopup" )

CoD.PlaylistSelection = {}
local f0_local0 = function ( f1_arg0, f1_arg1 )
	for f1_local6, f1_local7 in ipairs( f1_arg0 ) do
		for f1_local3, f1_local4 in ipairs( f1_local7.playlists ) do
			if f1_local4.index == f1_arg1 then
				return f1_local7
			end
		end
	end
	return nil
end

CoD.PlaylistSelection.AddCategoryButtons = function ( f2_arg0, f2_arg1 )
	local f2_local0 = Engine.GetPlaylistCategories()
	if f2_local0 == nil or #f2_local0 == 0 then
		DebugPrint( "Unable to retrieve playlist categories!" )
		return 
	end
	local f2_local1 = f0_local0( f2_local0, Engine.ProfileInt( f2_arg1, "playlist_" .. f2_arg0.filter ) )
	local f2_local2 = 1
	f2_arg0.totalCategoryPlayerCount = 0
	f2_arg0.categoryButtons = {}
	for f2_local7, f2_local8 in ipairs( f2_local0 ) do
		if f2_local8.filter == f2_arg0.filter then
			f2_arg0.totalCategoryPlayerCount = f2_arg0.totalCategoryPlayerCount + f2_local8.playerCount
			local f2_local6 = CoD.CategoryButton.new( {
				leftAnchor = true,
				rightAnchor = true,
				left = 0,
				right = 0,
				topAnchor = true,
				bottomAnchor = false,
				top = 0,
				bottom = CoD.CoD9Button.Height
			}, "category_button_action", "category_button_gain_focus", "category_button_lose_focus", f2_local8 )
			f2_local6:setLabel( Engine.ToUpper( f2_local8.name ) )
			f2_arg0.categoryButtonList:addElement( f2_local6 )
			f2_local6.buttonList = f2_arg0.categoryButtonList
			table.insert( f2_arg0.categoryButtons, f2_local6 )
			if f2_local8.locked == true then
				f2_local6:disable()
			end
			if f2_local8 == f2_local1 then
				f2_local2 = #f2_arg0.categoryButtons
			end
		end
	end
	if #f2_arg0.categoryButtons > 0 then
		if #f2_arg0.categoryButtons == 1 then
			f2_arg0.playlistContainer:setLeftRight( true, false, 0, f2_arg0.selectionContainerWidth )
			f2_arg0:addPlaylistButtons( f2_arg1, f2_arg0.categoryButtons[1].itemInfo )
			f2_arg0.categoryContainer:close()
		elseif CoD.useController and not f2_arg0.categoryButtonList:restoreState() then
			if f2_local2 < #f2_arg0.categoryButtons then
				f2_arg0.categoryButtons[f2_local2]:processEvent( {
					name = "gain_focus"
				} )
			else
				f2_arg0.categoryButtons[1]:processEvent( {
					name = "gain_focus"
				} )
			end
		end
		f2_arg0:registerEventHandler( "button_prompt_back", CoD.PlaylistSelection.CategoryBack )
	end
end

CoD.PlaylistSelection.ButtonGainFocus = function ( f3_arg0, f3_arg1 )
	f3_arg0.infoContainer.owner = f3_arg1.owner
	f3_arg0:updateInfo( f3_arg1.itemInfo )
end

CoD.PlaylistSelection.ButtonLoseFocus = function ( f4_arg0, f4_arg1 )
	if f4_arg0.infoContainer.owner == f4_arg1.owner then
		f4_arg0:updateInfo( nil )
	end
end

CoD.PlaylistSelection.CategoryButtonAction = function ( f5_arg0, f5_arg1 )
	f5_arg0.categoryButtonList:saveState()
	CoD.ButtonList.DisableInput( f5_arg0.categoryButtonList )
	f5_arg0.categoryContainer:animateToState( "disabled" )
	local f5_local0 = f5_arg1.itemInfo
	if f5_local0.directtostore == true and f5_local0.dlcRequiredPopupTitle ~= nil and f5_local0.dlcRequiredPopupDesc ~= nil then
		CoD.perController[f5_arg1.controller].dlcRequiredPopupTitle = f5_arg1.itemInfo.dlcRequiredPopupTitle
		CoD.perController[f5_arg1.controller].dlcRequiredPopupDesc = f5_arg1.itemInfo.dlcRequiredPopupDesc
		f5_arg0:openPopup( "popup_directtostore", f5_arg1.controller )
	elseif f5_local0.partyMissingDLC == true then
		f5_arg0:openPopup( "popup_partymissingmappack", f5_arg1.controller )
	else
		f5_arg0:addPlaylistButtons( f5_arg1.controller, f5_local0 )
	end
	Engine.PlaySound( "cac_screen_fade" )
end

CoD.PlaylistSelection.CategoryBack = function ( f6_arg0, f6_arg1 )
	f6_arg0.categoryButtonList:saveState()
	Engine.PartyHostClearUIState()
	CoD.Menu.ButtonPromptBack( f6_arg0, f6_arg1 )
end

CoD.PlaylistSelection.PlaylistIsLocked = function ( f7_arg0, f7_arg1 )
	if CoD.isPS3 and Engine.DvarBool( nil, "tu2_luiHacksDisabled" ) then
		if f7_arg1.index == 57 and Engine.GetDStat( f7_arg0, "PlayerStatsList", "RANKXP", "StatValue" ) >= 30100 then
			local f7_local0 = 5
			local f7_local1 = 10
			local f7_local2 = Engine.TableLookup( f7_arg0, CoD.rankTable, 0, f7_local1, f7_local0 )
			f7_arg1.locked = true
			f7_arg1.description = Engine.Localize( "MPUI_LOCKXP", f7_local2, f7_local1 + 1 )
		end
	end
	return f7_arg1.locked
end

CoD.PlaylistSelection.AddPlaylistButtons = function ( f8_arg0, f8_arg1, f8_arg2 )
	local f8_local0 = f8_arg2.playlists
	if f8_local0 == nil or #f8_local0 == 0 then
		DebugPrint( "Unable to retrieve playlists!" )
		return 
	end
	f8_arg0.totalPlaylistPlayerCount = f8_arg2.playerCount
	f8_arg0.playlistButtons = {}
	local f8_local1 = Engine.ProfileInt( f8_arg1, "playlist_" .. f8_arg0.filter )
	local f8_local2 = 0
	for f8_local6, f8_local7 in ipairs( f8_local0 ) do
		local f8_local8 = CoD.PlaylistButton.new( {
			leftAnchor = true,
			rightAnchor = true,
			left = 0,
			right = 0,
			topAnchor = true,
			bottomAnchor = false,
			top = 0,
			bottom = CoD.CoD9Button.Height
		}, "playlist_button_action", "playlist_button_gain_focus", "playlist_button_lose_focus", f8_local7, f8_local6 )
		f8_local8:setLabel( Engine.ToUpper( f8_local7.name ) )
		f8_arg0.playlistButtonList:addElement( f8_local8 )
		table.insert( f8_arg0.playlistButtons, f8_local8 )
		if f8_local7.index == f8_local1 then
			f8_local2 = f8_local6
		end
		if CoD.PlaylistSelection.PlaylistIsLocked( f8_arg1, f8_local7 ) then
			f8_local8:disable()
		end
	end
	if #f8_arg0.playlistButtons > 0 then
		if CoD.useController and not f8_arg0.playlistButtonList:restoreState() then
			if f8_local2 > 0 then
				f8_arg0.playlistButtons[f8_local2]:processEvent( {
					name = "gain_focus"
				} )
			else
				f8_arg0.playlistButtons[1]:processEvent( {
					name = "gain_focus"
				} )
			end
		end
		f8_arg0:registerEventHandler( "button_prompt_back", CoD.PlaylistSelection.PlaylistBack )
	end
end

CoD.PlaylistSelection.PlaylistButtonAction = function ( f9_arg0, f9_arg1 )
	f9_arg0.playlistButtonList:saveState()
	Engine.SetPlaylistID( f9_arg1.itemInfo.index )
	Engine.SetProfileVar( f9_arg1.controller, "playlist_" .. f9_arg0.filter, tostring( f9_arg1.itemInfo.index ) )
	Engine.PartyHostClearUIState()
	CoD.LobbyBase.SetPlaylistName( f9_arg1.itemInfo.name )
	local f9_local0 = f9_arg0.occludedMenu
	f9_arg0:goBack( f9_arg1.controller )
	if f9_local0 then
		f9_local0:processEvent( {
			name = "playlist_selected",
			controller = f9_arg1.controller,
			itemInfo = f9_arg1.itemInfo
		} )
	end
end

CoD.PlaylistSelection.PlaylistBack = function ( f10_arg0, f10_arg1 )
	f10_arg0.playlistButtonList:saveState()
	f10_arg0:registerEventHandler( "button_prompt_back", CoD.PlaylistSelection.CategoryBack )
	f10_arg0.playlistButtonList:removeAllChildren()
	CoD.ButtonList.EnableInput( f10_arg0.categoryButtonList )
	f10_arg0.categoryContainer:animateToState( "default" )
	f10_arg0.categoryButtonList:restoreState()
end

CoD.PlaylistSelection.UpdateInfo = function ( f11_arg0, f11_arg1 )
	local f11_local0 = ""
	local f11_local1 = ""
	local f11_local2 = nil
	local f11_local3 = 0
	local f11_local4 = ""
	local f11_local5 = ""
	local f11_local6 = ""
	local f11_local7 = ""
	local f11_local8 = ""
	if f11_arg1 ~= nil then
		f11_local0 = f11_arg1.name
		f11_local1 = f11_arg1.description
		f11_local2 = f11_arg1.icon
		f11_local3 = f11_arg1.playerCount
		if f11_arg1.seasonName ~= nil then
			f11_local6 = f11_arg1.seasonName
		end
		if f11_arg1.leagueID ~= nil then
			f11_local7 = Engine.GetLeagueSeasonDate( f11_arg1.leagueID )
		end
		if f11_arg1.leagueNews ~= nil then
			f11_local8 = f11_arg1.leagueNews
		end
	end
	f11_arg0.infoContainer.titleElement:setText( f11_local0 )
	f11_arg0.infoContainer.description:setText( f11_local1 )
	f11_local4 = CoD.separateNumberWithCommas( f11_local3 )
	if f11_arg1.playlists ~= nil then
		f11_arg0.infoContainer.playerCount:setText( Engine.Localize( "MENU_CATEGORY_USER_COUNT", f11_local4, CoD.separateNumberWithCommas( f11_arg0.totalCategoryPlayerCount ) ) )
	else
		f11_arg0.infoContainer.playerCount:setText( Engine.Localize( "MENU_PLAYLIST_USER_COUNT", f11_local4, CoD.separateNumberWithCommas( f11_arg0.totalPlaylistPlayerCount ) ) )
	end
	if f11_local2 ~= nil then
		f11_arg0.infoContainer.icon:registerAnimationState( "icon", {
			material = f11_local2,
			alpha = 1
		} )
		f11_arg0.infoContainer.icon:animateToState( "icon" )
	else
		f11_arg0.infoContainer.icon:animateToState( "default" )
	end
	f11_arg0.infoContainerLeft.leagueNews:setText( f11_local8 )
	f11_arg0.infoContainerLeft.seasonName:setText( f11_local6 )
	f11_arg0.infoContainerLeft.seasonDateContainer:hide()
	f11_arg0.infoContainerLeft.seasonDate:setText( f11_local7 )
	if #f11_local7 > 3 then
		f11_arg0.infoContainerLeft.seasonDateContainer:show()
	end
end

CoD.PlaylistSelection.AddSearchPreferencesButtonPrompt = function ( f12_arg0 )
	f12_arg0.searchPreferencesButton = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MPUI_SEARCH_PREFERENCES" ), f12_arg0, "button_prompt_search_preferences", false, nil, false, nil, "S" )
	f12_arg0:addRightButtonPrompt( f12_arg0.searchPreferencesButton )
end

CoD.PlaylistSelection.ButtonPromptSearchPreferences = function ( f13_arg0, f13_arg1 )
	f13_arg0:openPopup( "SearchPreferences", f13_arg1.controller )
end

LUI.createMenu.PlaylistSelection_old = function ( f14_arg0 )
	local f14_local0 = CoD.Menu.New( "PlaylistSelection_old" )
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
	f14_local0:addElement( self )
	f14_local0.m_ownerController = f14_arg0
	f14_local0.filter = CoD.PlaylistCategoryFilter
	if not f14_local0.filter then
		f14_local0.filter = ""
	end
	if f14_local0.filter == "leaguematch" then
		f14_local0:addTitle( Engine.Localize( "MENU_LEAGUES_CAPS" ) )
	else
		f14_local0:addTitle( Engine.Localize( "MENU_PLAYLISTS_CAPS" ) )
	end
	f14_local0:addLargePopupBackground()
	local f14_local2 = CoD.CoD9Button.Height
	local f14_local3 = (CoD.Menu.Width - f14_local2 * 2) / 2
	local f14_local4 = 0
	local f14_local5 = 200
	f14_local0.categoryContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = f14_local4,
		right = f14_local4 + f14_local3,
		topAnchor = true,
		bottomAnchor = true,
		top = CoD.Menu.TitleHeight,
		bottom = 0,
		alpha = 1
	} )
	f14_local0.categoryContainer:registerAnimationState( "disabled", {
		alpha = 0.5
	} )
	f14_local0:addElement( f14_local0.categoryContainer )
	f14_local0.categoryButtonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	f14_local0.categoryButtonList.id = f14_local0.categoryButtonList.id .. ".CategoryButtonList"
	f14_local0.categoryContainer:addElement( f14_local0.categoryButtonList )
	f14_local4 = f14_local4 + f14_local3 - f14_local2
	f14_local0.selectionContainerWidth = f14_local3
	f14_local0.playlistContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = f14_local4,
		right = f14_local4 + f14_local3,
		topAnchor = true,
		bottomAnchor = true,
		top = CoD.Menu.TitleHeight,
		bottom = 0
	} )
	f14_local0:addElement( f14_local0.playlistContainer )
	f14_local0.playlistButtonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	f14_local0.playlistButtonList.id = f14_local0.playlistButtonList.id .. ".PlaylistButtonList"
	f14_local0.playlistContainer:addElement( f14_local0.playlistButtonList )
	f14_local4 = f14_local4 + f14_local3
	local f14_local6 = f14_local5
	local f14_local7 = 0
	local f14_local8 = 0
	f14_local0.infoContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = f14_local4,
		right = f14_local4 + f14_local5,
		topAnchor = true,
		bottomAnchor = true,
		top = CoD.Menu.TitleHeight,
		bottom = 0
	} )
	f14_local0:addElement( f14_local0.infoContainer )
	f14_local4 = f14_local4 + f14_local3
	local f14_local9 = 256
	local f14_local10 = f14_local9
	if f14_local0.filter == "leaguematch" then
		f14_local9 = 384
		f14_local10 = f14_local9 / 2
	end
	f14_local7 = 0
	f14_local0.infoContainer.infoWidth = f14_local6
	f14_local0.infoContainer.icon = LUI.UIImage.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -f14_local9 / 2,
		right = f14_local9 / 2,
		topAnchor = true,
		bottomAnchor = false,
		top = f14_local7,
		bottom = f14_local7 + f14_local10,
		alpha = 0
	} )
	f14_local0.infoContainer:addElement( f14_local0.infoContainer.icon )
	f14_local7 = f14_local7 + f14_local10 + 15
	f14_local8 = f14_local7
	f14_local0.infoContainer.titleElement = LUI.UIText.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -f14_local6 / 2,
		right = f14_local6 / 2,
		topAnchor = true,
		bottomAnchor = false,
		top = f14_local7,
		bottom = f14_local7 + CoD.textSize.Big,
		font = CoD.fonts.Big,
		alignment = LUI.Alignment.Left
	} )
	f14_local0.infoContainer.titleElement:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	f14_local0.infoContainer.titleElement:setAlignment( LUI.Alignment.Center )
	f14_local0.infoContainer:addElement( f14_local0.infoContainer.titleElement )
	f14_local0.infoContainer.titleElement:setTTF( "fonts/escom.ttf" )
	f14_local7 = f14_local7 + CoD.textSize.Big * 2 + 5
	f14_local0.infoContainer.description = LUI.UIText.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -f14_local6 / 2,
		right = f14_local6 / 2,
		topAnchor = true,
		bottomAnchor = false,
		top = f14_local7,
		bottom = f14_local7 + CoD.textSize.Default,
		font = CoD.fonts.Default,
		alignment = LUI.Alignment.Left
	} )
	f14_local0.infoContainer.description:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	f14_local0.infoContainer:addElement( f14_local0.infoContainer.description )
	f14_local0.infoContainer.description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	if f14_local0.filter == "leaguematch" then
		f14_local7 = f14_local7 + CoD.textSize.Big + 178
	else
		f14_local7 = f14_local7 + CoD.textSize.Big + 115
	end
	f14_local0.infoContainer.playerCount = LUI.UIText.new()
	f14_local0.infoContainer.playerCount:setLeftRight( true, false, 0, 0 )
	f14_local0.infoContainer.playerCount:setTopBottom( true, false, f14_local7, f14_local7 + CoD.textSize.Default )
	f14_local0.infoContainer.playerCount:setFont( CoD.fonts.Default )
	f14_local0.infoContainer.playerCount:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	f14_local0.infoContainer:addElement( f14_local0.infoContainer.playerCount )
	f14_local0.infoContainer.playerCount = LUI.UIText.new()
	f14_local0.infoContainer.playerCount:setLeftRight( true, false, 0, 0 )
	f14_local0.infoContainer.playerCount:setTopBottom( true, false, f14_local7, f14_local7 + CoD.textSize.Default )
	f14_local0.infoContainer.playerCount:setFont( CoD.fonts.Default )
	f14_local0.infoContainer.playerCount:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	f14_local0.infoContainer:addElement( f14_local0.infoContainer.playerCount )
	local f14_local11 = 360
	f14_local8 = f14_local8 - 20
	f14_local0.infoContainerLeft = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = f14_local11,
		topAnchor = true,
		bottomAnchor = true,
		top = CoD.Menu.TitleHeight,
		bottom = 0
	} )
	f14_local0:addElement( f14_local0.infoContainerLeft )
	f14_local0.infoContainerLeft.seasonName = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = f14_local8,
		bottom = f14_local8 + CoD.textSize.Big,
		font = CoD.fonts.Big,
		alignment = LUI.Alignment.Left
	} )
	f14_local0.infoContainerLeft.seasonName:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	f14_local0.infoContainerLeft.seasonName:setAlignment( LUI.Alignment.Left )
	f14_local0.infoContainerLeft:addElement( f14_local0.infoContainerLeft.seasonName )
	f14_local8 = f14_local8 + CoD.textSize.Big + 5
	f14_local0.infoContainerLeft.leagueNews = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = f14_local8,
		bottom = f14_local8 + CoD.textSize.Default,
		font = CoD.fonts.Default,
		alignment = LUI.Alignment.Left
	} )
	f14_local0.infoContainerLeft.leagueNews:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	f14_local0.infoContainerLeft:addElement( f14_local0.infoContainerLeft.leagueNews )
	f14_local8 = f14_local8 + CoD.textSize.Default * 6
	f14_local0.infoContainerLeft.seasonDateContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = f14_local7 - 10,
		bottom = f14_local7 + CoD.textSize.Default
	} )
	f14_local0.infoContainerLeft.seasonDate = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 8,
		right = 0,
		topAnchor = false,
		bottomAnchor = false,
		top = -CoD.textSize.Default / 2,
		bottom = CoD.textSize.Default / 2,
		font = CoD.fonts.Default,
		alignment = LUI.Alignment.Left
	} )
	f14_local0.infoContainerLeft.seasonDateContainer:addElement( CoD.GetInformationContainer() )
	f14_local0.infoContainerLeft.seasonDateContainer:addElement( f14_local0.infoContainerLeft.seasonDate )
	f14_local0.infoContainerLeft:addElement( f14_local0.infoContainerLeft.seasonDateContainer )
	f14_local0:registerEventHandler( "category_button_gain_focus", CoD.PlaylistSelection.ButtonGainFocus )
	f14_local0:registerEventHandler( "category_button_lose_focus", CoD.PlaylistSelection.ButtonLoseFocus )
	f14_local0:registerEventHandler( "category_button_action", CoD.PlaylistSelection.CategoryButtonAction )
	f14_local0:registerEventHandler( "playlist_button_gain_focus", CoD.PlaylistSelection.ButtonGainFocus )
	f14_local0:registerEventHandler( "playlist_button_lose_focus", CoD.PlaylistSelection.ButtonLoseFocus )
	f14_local0:registerEventHandler( "playlist_button_action", CoD.PlaylistSelection.PlaylistButtonAction )
	f14_local0:registerEventHandler( "button_prompt_search_preferences", CoD.PlaylistSelection.ButtonPromptSearchPreferences )
	f14_local0.addCategoryButtons = CoD.PlaylistSelection.AddCategoryButtons
	f14_local0.addPlaylistButtons = CoD.PlaylistSelection.AddPlaylistButtons
	f14_local0.updateInfo = CoD.PlaylistSelection.UpdateInfo
	f14_local0.addSearchPreferencesButton = CoD.PlaylistSelection.AddSearchPreferencesButtonPrompt
	f14_local0:addSelectButton()
	f14_local0:addBackButton()
	f14_local0:addSearchPreferencesButton()
	return f14_local0
end

