require( "ui.T6.CategoryButton" )
require( "ui.T6.PlaylistButton" )
require( "ui.T6.Menus.SearchPreferencesPopup" )

CoD.PlaylistSelection = {}
local FindPlaylistCategory = function ( categories, playlistId )
	for index, category in ipairs( categories ) do
		for pindex, playlist in ipairs( category.playlists ) do
			if playlist.index == playlistId then
				return category
			end
		end
	end
	return nil
end

CoD.PlaylistSelection.AddCategoryButtons = function ( self, controller )
	local categories = Engine.GetPlaylistCategories()
	if categories == nil or #categories == 0 then
		DebugPrint( "Unable to retrieve playlist categories!" )
		return 
	end
	local profile_playlist = Engine.ProfileInt( controller, "playlist_" .. self.filter )
	local profile_category = FindPlaylistCategory( categories, profile_playlist )
	local profile_category_index = 1
	self.totalCategoryPlayerCount = 0
	self.categoryButtons = {}
	for index, category in ipairs( categories ) do
		if category.filter == self.filter then
			self.totalCategoryPlayerCount = self.totalCategoryPlayerCount + category.playerCount
			local categoryButtonDefaultAnimationState = {
				leftAnchor = true,
				rightAnchor = true,
				left = 0,
				right = 0,
				topAnchor = true,
				bottomAnchor = false,
				top = 0,
				bottom = CoD.CoD9Button.Height
			}
			local categoryButton = CoD.CategoryButton.new( categoryButtonDefaultAnimationState, "category_button_action", "category_button_gain_focus", "category_button_lose_focus", category )
			categoryButton:setLabel( Engine.ToUpper( category.name ) )
			self.categoryButtonList:addElement( categoryButton )
			categoryButton.buttonList = self.categoryButtonList
			table.insert( self.categoryButtons, categoryButton )
			if category.locked == true then
				categoryButton:disable()
			end
			if category == profile_category then
				profile_category_index = #self.categoryButtons
			end
		end
	end
	if #self.categoryButtons > 0 then
		if #self.categoryButtons == 1 then
			self.playlistContainer:setLeftRight( true, false, 0, self.selectionContainerWidth )
			self:addPlaylistButtons( controller, self.categoryButtons[1].itemInfo )
			self.categoryContainer:close()
		elseif CoD.useController and not self.categoryButtonList:restoreState() then
			if profile_category_index < #self.categoryButtons then
				self.categoryButtons[profile_category_index]:processEvent( {
					name = "gain_focus"
				} )
			else
				self.categoryButtons[1]:processEvent( {
					name = "gain_focus"
				} )
			end
		end
		self:registerEventHandler( "button_prompt_back", CoD.PlaylistSelection.CategoryBack )
	end
end

CoD.PlaylistSelection.ButtonGainFocus = function ( self, event )
	self.infoContainer.owner = event.owner
	self:updateInfo( event.itemInfo )
end

CoD.PlaylistSelection.ButtonLoseFocus = function ( self, event )
	if self.infoContainer.owner == event.owner then
		self:updateInfo( nil )
	end
end

CoD.PlaylistSelection.CategoryButtonAction = function ( self, event )
	self.categoryButtonList:saveState()
	CoD.ButtonList.DisableInput( self.categoryButtonList )
	self.categoryContainer:animateToState( "disabled" )
	local itemInfo = event.itemInfo
	if itemInfo.directtostore == true and itemInfo.dlcRequiredPopupTitle ~= nil and itemInfo.dlcRequiredPopupDesc ~= nil then
		CoD.perController[event.controller].dlcRequiredPopupTitle = event.itemInfo.dlcRequiredPopupTitle
		CoD.perController[event.controller].dlcRequiredPopupDesc = event.itemInfo.dlcRequiredPopupDesc
		self:openPopup( "popup_directtostore", event.controller )
	elseif itemInfo.partyMissingDLC == true then
		self:openPopup( "popup_partymissingmappack", event.controller )
	else
		self:addPlaylistButtons( event.controller, itemInfo )
	end
	Engine.PlaySound( "cac_screen_fade" )
end

CoD.PlaylistSelection.CategoryBack = function ( self, event )
	self.categoryButtonList:saveState()
	Engine.PartyHostClearUIState()
	CoD.Menu.ButtonPromptBack( self, event )
end

CoD.PlaylistSelection.PlaylistIsLocked = function ( controller, playlist )
	if CoD.isPS3 and Engine.DvarBool( nil, "tu2_luiHacksDisabled" ) then
		local playerRankXP = Engine.GetDStat( controller, "PlayerStatsList", "RANKXP", "StatValue" )
		if playlist.index == 57 and playerRankXP >= 30100 then
			local rankFullNameColumn = 5
			local rankID = 10
			local newRankTitle = Engine.TableLookup( controller, CoD.rankTable, 0, rankID, rankFullNameColumn )
			playlist.locked = true
			playlist.description = Engine.Localize( "MPUI_LOCKXP", newRankTitle, rankID + 1 )
		end
	end
	return playlist.locked
end

CoD.PlaylistSelection.AddPlaylistButtons = function ( self, controller, itemInfo )
	local playlists = itemInfo.playlists
	if playlists == nil or #playlists == 0 then
		DebugPrint( "Unable to retrieve playlists!" )
		return 
	end
	self.totalPlaylistPlayerCount = itemInfo.playerCount
	self.playlistButtons = {}
	local profile_playlist_index = Engine.ProfileInt( controller, "playlist_" .. self.filter )
	local profile_playlist = 0
	for index, playlist in ipairs( playlists ) do
		local playlistButtonDefaultAnimationState = {
			leftAnchor = true,
			rightAnchor = true,
			left = 0,
			right = 0,
			topAnchor = true,
			bottomAnchor = false,
			top = 0,
			bottom = CoD.CoD9Button.Height
		}
		local playlistButton = CoD.PlaylistButton.new( playlistButtonDefaultAnimationState, "playlist_button_action", "playlist_button_gain_focus", "playlist_button_lose_focus", playlist, index )
		playlistButton:setLabel( Engine.ToUpper( playlist.name ) )
		self.playlistButtonList:addElement( playlistButton )
		table.insert( self.playlistButtons, playlistButton )
		if playlist.index == profile_playlist_index then
			profile_playlist = index
		end
		if CoD.PlaylistSelection.PlaylistIsLocked( controller, playlist ) then
			playlistButton:disable()
		end
	end
	if #self.playlistButtons > 0 then
		if CoD.useController and not self.playlistButtonList:restoreState() then
			if profile_playlist > 0 then
				self.playlistButtons[profile_playlist]:processEvent( {
					name = "gain_focus"
				} )
			else
				self.playlistButtons[1]:processEvent( {
					name = "gain_focus"
				} )
			end
		end
		self:registerEventHandler( "button_prompt_back", CoD.PlaylistSelection.PlaylistBack )
	end
end

CoD.PlaylistSelection.PlaylistButtonAction = function ( self, event )
	self.playlistButtonList:saveState()
	Engine.SetPlaylistID( event.itemInfo.index )
	Engine.SetProfileVar( event.controller, "playlist_" .. self.filter, tostring( event.itemInfo.index ) )
	Engine.PartyHostClearUIState()
	CoD.LobbyBase.SetPlaylistName( event.itemInfo.name )
	local occludedMenu = self.occludedMenu
	self:goBack( event.controller )
	if occludedMenu then
		occludedMenu:processEvent( {
			name = "playlist_selected",
			controller = event.controller,
			itemInfo = event.itemInfo
		} )
	end
end

CoD.PlaylistSelection.PlaylistBack = function ( self, event )
	self.playlistButtonList:saveState()
	self:registerEventHandler( "button_prompt_back", CoD.PlaylistSelection.CategoryBack )
	self.playlistButtonList:removeAllChildren()
	CoD.ButtonList.EnableInput( self.categoryButtonList )
	self.categoryContainer:animateToState( "default" )
	self.categoryButtonList:restoreState()
end

CoD.PlaylistSelection.UpdateInfo = function ( self, itemInfo )
	local titleText = ""
	local descriptionText = ""
	local iconMaterial = nil
	local playerCount = 0
	local playerCountWithCommas = ""
	local totalPlayerCountWithCommas = ""
	local seasonName = ""
	local seasonDate = ""
	local leagueNews = ""
	if itemInfo ~= nil then
		titleText = itemInfo.name
		descriptionText = itemInfo.description
		iconMaterial = itemInfo.icon
		playerCount = itemInfo.playerCount
		if itemInfo.seasonName ~= nil then
			seasonName = itemInfo.seasonName
		end
		if itemInfo.leagueID ~= nil then
			seasonDate = Engine.GetLeagueSeasonDate( itemInfo.leagueID )
		end
		if itemInfo.leagueNews ~= nil then
			leagueNews = itemInfo.leagueNews
		end
	end
	self.infoContainer.titleElement:setText( titleText )
	self.infoContainer.description:setText( descriptionText )
	playerCountWithCommas = CoD.separateNumberWithCommas( playerCount )
	if itemInfo.playlists ~= nil then
		self.infoContainer.playerCount:setText( Engine.Localize( "MENU_CATEGORY_USER_COUNT", playerCountWithCommas, CoD.separateNumberWithCommas( self.totalCategoryPlayerCount ) ) )
	else
		self.infoContainer.playerCount:setText( Engine.Localize( "MENU_PLAYLIST_USER_COUNT", playerCountWithCommas, CoD.separateNumberWithCommas( self.totalPlaylistPlayerCount ) ) )
	end
	if iconMaterial ~= nil then
		self.infoContainer.icon:registerAnimationState( "icon", {
			material = iconMaterial,
			alpha = 1
		} )
		self.infoContainer.icon:animateToState( "icon" )
	else
		self.infoContainer.icon:animateToState( "default" )
	end
	self.infoContainerLeft.leagueNews:setText( leagueNews )
	self.infoContainerLeft.seasonName:setText( seasonName )
	self.infoContainerLeft.seasonDateContainer:hide()
	self.infoContainerLeft.seasonDate:setText( seasonDate )
	if #seasonDate > 3 then
		self.infoContainerLeft.seasonDateContainer:show()
	end
end

CoD.PlaylistSelection.AddSearchPreferencesButtonPrompt = function ( self )
	self.searchPreferencesButton = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MPUI_SEARCH_PREFERENCES" ), self, "button_prompt_search_preferences", false, nil, false, nil, "S" )
	self:addRightButtonPrompt( self.searchPreferencesButton )
end

CoD.PlaylistSelection.ButtonPromptSearchPreferences = function ( self, event )
	self:openPopup( "SearchPreferences", event.controller )
end

LUI.createMenu.PlaylistSelection_old = function ( controller )
	local playlistSelectionMenu = CoD.Menu.New( "PlaylistSelection_old" )
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
	playlistSelectionMenu:addElement( background )
	playlistSelectionMenu.m_ownerController = controller
	playlistSelectionMenu.filter = CoD.PlaylistCategoryFilter
	if not playlistSelectionMenu.filter then
		playlistSelectionMenu.filter = ""
	end
	if playlistSelectionMenu.filter == "leaguematch" then
		playlistSelectionMenu:addTitle( Engine.Localize( "MENU_LEAGUES_CAPS" ) )
	else
		playlistSelectionMenu:addTitle( Engine.Localize( "MENU_PLAYLISTS_CAPS" ) )
	end
	playlistSelectionMenu:addLargePopupBackground()
	local buttonOffset = CoD.CoD9Button.Height
	local selectionContainerWidth = (CoD.Menu.Width - buttonOffset * 2) / 2
	local selectionContainerLeft = 0
	local infoContainerWidth = 200
	playlistSelectionMenu.categoryContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = selectionContainerLeft,
		right = selectionContainerLeft + selectionContainerWidth,
		topAnchor = true,
		bottomAnchor = true,
		top = CoD.Menu.TitleHeight,
		bottom = 0,
		alpha = 1
	} )
	playlistSelectionMenu.categoryContainer:registerAnimationState( "disabled", {
		alpha = 0.5
	} )
	playlistSelectionMenu:addElement( playlistSelectionMenu.categoryContainer )
	playlistSelectionMenu.categoryButtonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	playlistSelectionMenu.categoryButtonList.id = playlistSelectionMenu.categoryButtonList.id .. ".CategoryButtonList"
	playlistSelectionMenu.categoryContainer:addElement( playlistSelectionMenu.categoryButtonList )
	selectionContainerLeft = selectionContainerLeft + selectionContainerWidth - buttonOffset
	playlistSelectionMenu.selectionContainerWidth = selectionContainerWidth
	playlistSelectionMenu.playlistContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = selectionContainerLeft,
		right = selectionContainerLeft + selectionContainerWidth,
		topAnchor = true,
		bottomAnchor = true,
		top = CoD.Menu.TitleHeight,
		bottom = 0
	} )
	playlistSelectionMenu:addElement( playlistSelectionMenu.playlistContainer )
	playlistSelectionMenu.playlistButtonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	playlistSelectionMenu.playlistButtonList.id = playlistSelectionMenu.playlistButtonList.id .. ".PlaylistButtonList"
	playlistSelectionMenu.playlistContainer:addElement( playlistSelectionMenu.playlistButtonList )
	selectionContainerLeft = selectionContainerLeft + selectionContainerWidth
	local infoWidth = infoContainerWidth
	local infoItemTop = 0
	local leftInfoItemTop = 0
	playlistSelectionMenu.infoContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = selectionContainerLeft,
		right = selectionContainerLeft + infoContainerWidth,
		topAnchor = true,
		bottomAnchor = true,
		top = CoD.Menu.TitleHeight,
		bottom = 0
	} )
	playlistSelectionMenu:addElement( playlistSelectionMenu.infoContainer )
	selectionContainerLeft = selectionContainerLeft + selectionContainerWidth
	local iconWidth = 256
	local iconHeight = iconWidth
	if playlistSelectionMenu.filter == "leaguematch" then
		iconWidth = 384
		iconHeight = iconWidth / 2
	end
	infoItemTop = 0
	playlistSelectionMenu.infoContainer.infoWidth = infoWidth
	playlistSelectionMenu.infoContainer.icon = LUI.UIImage.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -iconWidth / 2,
		right = iconWidth / 2,
		topAnchor = true,
		bottomAnchor = false,
		top = infoItemTop,
		bottom = infoItemTop + iconHeight,
		alpha = 0
	} )
	playlistSelectionMenu.infoContainer:addElement( playlistSelectionMenu.infoContainer.icon )
	infoItemTop = infoItemTop + iconHeight + 15
	leftInfoItemTop = infoItemTop
	playlistSelectionMenu.infoContainer.titleElement = LUI.UIText.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -infoWidth / 2,
		right = infoWidth / 2,
		topAnchor = true,
		bottomAnchor = false,
		top = infoItemTop,
		bottom = infoItemTop + CoD.textSize.Big,
		font = CoD.fonts.Big,
		alignment = LUI.Alignment.Left
	} )
	playlistSelectionMenu.infoContainer.titleElement:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	playlistSelectionMenu.infoContainer.titleElement:setAlignment( LUI.Alignment.Center )
	playlistSelectionMenu.infoContainer:addElement( playlistSelectionMenu.infoContainer.titleElement )
	playlistSelectionMenu.infoContainer.titleElement:setTTF( "fonts/escom.ttf" )
	infoItemTop = infoItemTop + CoD.textSize.Big * 2 + 5
	playlistSelectionMenu.infoContainer.description = LUI.UIText.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -infoWidth / 2,
		right = infoWidth / 2,
		topAnchor = true,
		bottomAnchor = false,
		top = infoItemTop,
		bottom = infoItemTop + CoD.textSize.Default,
		font = CoD.fonts.Default,
		alignment = LUI.Alignment.Left
	} )
	playlistSelectionMenu.infoContainer.description:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	playlistSelectionMenu.infoContainer:addElement( playlistSelectionMenu.infoContainer.description )
	playlistSelectionMenu.infoContainer.description:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	if playlistSelectionMenu.filter == "leaguematch" then
		infoItemTop = infoItemTop + CoD.textSize.Big + 178
	else
		infoItemTop = infoItemTop + CoD.textSize.Big + 115
	end
	playlistSelectionMenu.infoContainer.playerCount = LUI.UIText.new()
	playlistSelectionMenu.infoContainer.playerCount:setLeftRight( true, false, 0, 0 )
	playlistSelectionMenu.infoContainer.playerCount:setTopBottom( true, false, infoItemTop, infoItemTop + CoD.textSize.Default )
	playlistSelectionMenu.infoContainer.playerCount:setFont( CoD.fonts.Default )
	playlistSelectionMenu.infoContainer.playerCount:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	playlistSelectionMenu.infoContainer:addElement( playlistSelectionMenu.infoContainer.playerCount )
	playlistSelectionMenu.infoContainer.playerCount = LUI.UIText.new()
	playlistSelectionMenu.infoContainer.playerCount:setLeftRight( true, false, 0, 0 )
	playlistSelectionMenu.infoContainer.playerCount:setTopBottom( true, false, infoItemTop, infoItemTop + CoD.textSize.Default )
	playlistSelectionMenu.infoContainer.playerCount:setFont( CoD.fonts.Default )
	playlistSelectionMenu.infoContainer.playerCount:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	playlistSelectionMenu.infoContainer:addElement( playlistSelectionMenu.infoContainer.playerCount )
	local infoContainerLeftWidth = 360
	leftInfoItemTop = leftInfoItemTop - 20
	playlistSelectionMenu.infoContainerLeft = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = infoContainerLeftWidth,
		topAnchor = true,
		bottomAnchor = true,
		top = CoD.Menu.TitleHeight,
		bottom = 0
	} )
	playlistSelectionMenu:addElement( playlistSelectionMenu.infoContainerLeft )
	playlistSelectionMenu.infoContainerLeft.seasonName = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = leftInfoItemTop,
		bottom = leftInfoItemTop + CoD.textSize.Big,
		font = CoD.fonts.Big,
		alignment = LUI.Alignment.Left
	} )
	playlistSelectionMenu.infoContainerLeft.seasonName:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	playlistSelectionMenu.infoContainerLeft.seasonName:setAlignment( LUI.Alignment.Left )
	playlistSelectionMenu.infoContainerLeft:addElement( playlistSelectionMenu.infoContainerLeft.seasonName )
	leftInfoItemTop = leftInfoItemTop + CoD.textSize.Big + 5
	playlistSelectionMenu.infoContainerLeft.leagueNews = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = leftInfoItemTop,
		bottom = leftInfoItemTop + CoD.textSize.Default,
		font = CoD.fonts.Default,
		alignment = LUI.Alignment.Left
	} )
	playlistSelectionMenu.infoContainerLeft.leagueNews:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	playlistSelectionMenu.infoContainerLeft:addElement( playlistSelectionMenu.infoContainerLeft.leagueNews )
	leftInfoItemTop = leftInfoItemTop + CoD.textSize.Default * 6
	playlistSelectionMenu.infoContainerLeft.seasonDateContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = infoItemTop - 10,
		bottom = infoItemTop + CoD.textSize.Default
	} )
	playlistSelectionMenu.infoContainerLeft.seasonDate = LUI.UIText.new( {
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
	playlistSelectionMenu.infoContainerLeft.seasonDateContainer:addElement( CoD.GetInformationContainer() )
	playlistSelectionMenu.infoContainerLeft.seasonDateContainer:addElement( playlistSelectionMenu.infoContainerLeft.seasonDate )
	playlistSelectionMenu.infoContainerLeft:addElement( playlistSelectionMenu.infoContainerLeft.seasonDateContainer )
	playlistSelectionMenu:registerEventHandler( "category_button_gain_focus", CoD.PlaylistSelection.ButtonGainFocus )
	playlistSelectionMenu:registerEventHandler( "category_button_lose_focus", CoD.PlaylistSelection.ButtonLoseFocus )
	playlistSelectionMenu:registerEventHandler( "category_button_action", CoD.PlaylistSelection.CategoryButtonAction )
	playlistSelectionMenu:registerEventHandler( "playlist_button_gain_focus", CoD.PlaylistSelection.ButtonGainFocus )
	playlistSelectionMenu:registerEventHandler( "playlist_button_lose_focus", CoD.PlaylistSelection.ButtonLoseFocus )
	playlistSelectionMenu:registerEventHandler( "playlist_button_action", CoD.PlaylistSelection.PlaylistButtonAction )
	playlistSelectionMenu:registerEventHandler( "button_prompt_search_preferences", CoD.PlaylistSelection.ButtonPromptSearchPreferences )
	playlistSelectionMenu.addCategoryButtons = CoD.PlaylistSelection.AddCategoryButtons
	playlistSelectionMenu.addPlaylistButtons = CoD.PlaylistSelection.AddPlaylistButtons
	playlistSelectionMenu.updateInfo = CoD.PlaylistSelection.UpdateInfo
	playlistSelectionMenu.addSearchPreferencesButton = CoD.PlaylistSelection.AddSearchPreferencesButtonPrompt
	playlistSelectionMenu:addSelectButton()
	playlistSelectionMenu:addBackButton()
	playlistSelectionMenu:addSearchPreferencesButton()
	return playlistSelectionMenu
end

