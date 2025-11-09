require( "ui.T6.MFTabManager" )
require( "ui.T6.ListBox" )
require( "ui.T6.Menus.FriendPopup" )
require( "ui.T6.Menus.KickPlayerPopup" )

if not CoD.isSinglePlayer then
	require( "ui_mp.T6.FriendDetails" )
end
if CoD.isPC then
	require( "T6.Menus.GameInvitePopup" )
end
CoD.FriendsList = {}
CoD.FriendsListPopup = {}
CoD.FriendsListPopup.Mode = CoD.playerListType.friend
CoD.FriendsListPopup.EmblemHeight = CoD.CoD9Button.Height - 5
CoD.FriendsList.CloseMenu = function ( friendsList, event )
	Dvar.ui_friendsListOpen:set( false )
	Dvar.ui_playerListOpen:set( false )
	if CoD.isXBOX then
		Dvar.ui_xboxLivePartyListOpen:set( false )
	end
	if Engine.IsInGame() then
		friendsList:goBack( event.controller )
	else
		friendsList:animateOutAndGoBack( event.controller )
	end
end

CoD.FriendsListPopup.FriendSelected = function ( friendsList, event )
	local mutables = friendsList.listBox:getFocussedMutables()
	if mutables ~= nil then
		CoD.FriendPopup.SelectedPlayerXuid = mutables.playerXuid
		CoD.FriendPopup.SelectedPlayerName = mutables.playerName
		Dvar.selectedPlayerXuid:set( mutables.playerXuid )
		if CoD.FriendsListPopup.Mode == CoD.playerListType.gameInvites then
			CoD.GameInvitePopup.SelectedPlayerXuid = mutables.playerXuid
			CoD.GameInvitePopup.SelectedPlayerName = mutables.playerName
			friendsList:openPopup( "GameInvitePopup", event.controller )
		elseif CoD.FriendsListPopup.Mode == CoD.playerListType.friendRequest then
			CoD.FriendRequestPopup.SelectedPlayerXuid = mutables.playerXuid
			CoD.FriendRequestPopup.SelectedPlayerName = mutables.playerName
			friendsList:openPopup( "FriendRequestPopup", event.controller )
		else
			friendsList:openPopup( "FriendPopup", event.controller )
		end
	end
end

CoD.FriendsListPopup.XboxLIVEParty = function ( friendsList, event )
	Engine.Exec( event.controller, "showParty" )
end

CoD.FriendsListPopup.PS3Invitations = function ( friendsList, event )
	Engine.Exec( event.controller, "gameInvitesReceived" )
end

CoD.FriendsListPopup.InviteToSession = function ( friendsList, event )
	local mutables = friendsList.listBox:getFocussedMutables()
	if mutables ~= nil then
		CoD.invitePlayer( event.controller, mutables.playerXuid, CoD.FriendsListPopup.Mode )
	end
end

CoD.FriendsListPopup.JoinSession = function ( friendsList, event )
	if Engine.IsInGame() and CoD.isZombie == false then
		if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) and Engine.ProbationCheckForQuitWarning( CoD.GAMEMODE_LEAGUE_MATCH ) then
			friendsList:openPopup( "popup_probation_join_quit_warning", event.controller )
			return 
		elseif Engine.GameModeIsMode( CoD.GAMEMODE_PUBLIC_MATCH ) and Engine.ProbationCheckForQuitWarning( CoD.GAMEMODE_PUBLIC_MATCH ) then
			friendsList:openPopup( "popup_probation_join_quit_warning", event.controller )
			return 
		end
	end
	CoD.FriendsListPopup.FinishJoinSession( friendsList, event )
end

CoD.FriendsListPopup.FinishJoinSession = function ( friendsList, event )
	local mutables = friendsList.listBox:getFocussedMutables()
	if mutables ~= nil then
		Engine.UpdateStatsForQuit( event.controller, true )
		CoD.joinPlayer( event.controller, mutables.playerXuid )
		CoD.FriendsList.CloseMenu( friendsList, event )
	end
end

CoD.FriendsListPopup.NoJoinButtonPressed = function ( popup, event )
	popup:goBack( event.controller )
end

CoD.FriendsListPopup.FriendFocusChanged = function ( friendsList )
	CoD.FriendsListPopup.UpdatePromptButtonVis( friendsList )
	local mutables = friendsList.listBox:getFocussedMutables()
	if mutables ~= nil and mutables.playerXuid ~= nil and CoD.FriendDetails ~= nil then
		local playerListType = CoD.FriendsListPopup.Mode
		if playerListType ~= CoD.playerListType.friendRequest then
			CoD.FriendDetails.refresh( friendsList.details, friendsList.m_ownerController, mutables.playerXuid, mutables.playerIndex, playerListType )
		end
	end
end

CoD.FriendsListPopup.UpdatePromptButtonVis = function ( friendsList )
	if friendsList == nil then
		return 
	elseif CoD.isWIIU and friendsList.tabManager.tabSelected == friendsList.textMessageTabIndex then
		friendsList.rootTextMessageElement:updatePromptButtonVis()
		return 
	end
	local controller = friendsList.m_ownerController
	friendsList.leftButtonPromptBar:removeAllChildren()
	friendsList.rightButtonPromptBar:removeAllChildren()
	if friendsList.listBox:getTotalItems() > 0 then
		if friendsList.selectButton ~= nil then
			friendsList:addLeftButtonPrompt( friendsList.selectButton )
		end
		local mutables = friendsList.listBox:getFocussedMutables()
		if mutables ~= nil and mutables.playerXuid ~= nil then
			if CoD.canInviteToGame( controller, mutables.playerXuid ) and friendsList.inviteButton ~= nil then
				friendsList:addLeftButtonPrompt( friendsList.inviteButton )
			end
			if CoD.canJoinSession( controller, mutables.playerXuid ) and friendsList.joinButton ~= nil then
				friendsList:addLeftButtonPrompt( friendsList.joinButton )
			end
		end
	end
	if CoD.FriendsListPopup.Mode == CoD.playerListType.facebook and nil ~= Engine.IsFacebookLinked and Engine.IsFacebookLinked( controller ) == false and Engine.IsPlayerUnderage( controller ) == false and not Engine.IsInGame() then
		friendsList:addLeftButtonPrompt( friendsList.linkFBButton )
	end
	if CoD.isPS3 then
		friendsList:addLeftButtonPrompt( friendsList.invitationsButton )
	end
	friendsList:addRightButtonPrompt( friendsList.backButton )
	if friendsList.friendsOptions ~= nil then
		friendsList:addRightButtonPrompt( friendsList.friendsOptions )
	end
	if CoD.isWIIU and friendsList.friendsAddFriend ~= nil then
		friendsList:addRightButtonPrompt( friendsList.friendsAddFriend )
	end
	if CoD.FriendsListPopup.Mode == CoD.playerListType.party then
		friendsList:addLeftButtonPrompt( friendsList.partyButton )
	end
end

local FriendsList_ButtonCreator = function ( controller, mutables )
	if not CoD.isSinglePlayer and not CoD.isZombie then
		local rankIconDim = 32
		mutables.rankIcon = LUI.UIImage.new()
		mutables.rankIcon:setLeftRight( false, true, -5 - rankIconDim, -5 )
		mutables.rankIcon:setTopBottom( true, false, 0, rankIconDim )
		mutables.rankIcon:setAlpha( 0 )
		mutables:addElement( mutables.rankIcon )
		mutables.rank = LUI.UIText.new()
		mutables.rank:setLeftRight( true, true, 0, -rankIconDim - 10 )
		mutables.rank:setTopBottom( true, false, 0, CoD.textSize.Default )
		mutables.rank:setFont( CoD.fonts.Default )
		mutables.rank:setAlignment( LUI.Alignment.Right )
		mutables:addElement( mutables.rank )
	end
	mutables.joinableIcon = LUI.UIImage.new()
	mutables.joinableIcon:setLeftRight( false, true, -97, -65 )
	mutables.joinableIcon:setTopBottom( true, false, 0, 32 )
	mutables.joinableIcon:setImage( RegisterMaterial( "menu_mp_party_ease_icon" ) )
	mutables.joinableIcon:setAlpha( 0 )
	mutables:addElement( mutables.joinableIcon )
	mutables.name = LUI.UIText.new( {
		left = 10 + CoD.FriendsListPopup.EmblemHeight * 2,
		top = 0,
		right = 0,
		bottom = CoD.textSize.Default,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		font = CoD.fonts.Default
	} )
	mutables:addElement( mutables.name )
	mutables.presence = LUI.UIText.new( {
		left = 10 + CoD.FriendsListPopup.EmblemHeight * 2,
		top = CoD.textSize.Default + 5,
		right = 0,
		bottom = CoD.textSize.Default * 2 + 5,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		font = CoD.fonts.Default
	} )
	mutables.presence:setAlignment( LUI.Alignment.Center )
	mutables:setUseStencil( true )
	mutables:addElement( mutables.presence )
	if not CoD.isSinglePlayer and CoD.FriendsListPopup.Mode ~= CoD.playerListType.friendRequest then
		mutables.emblem = LUI.UIImage.new( {
			shaderVector0 = {
				0,
				0,
				0,
				0
			},
			left = 5,
			top = -CoD.FriendsListPopup.EmblemHeight,
			right = 5 + CoD.FriendsListPopup.EmblemHeight * 2,
			bottom = CoD.FriendsListPopup.EmblemHeight,
			leftAnchor = true,
			topAnchor = false,
			rightAnchor = false,
			bottomAnchor = false
		} )
		mutables:addElement( mutables.emblem )
	end
end

local FriendsList_ButtonData = function ( controller, itemIndex, mutables )
	local playerInfo = Engine.GetPlayerInfoByIndex( controller, itemIndex - 1, CoD.FriendsListPopup.Mode )
	if playerInfo ~= nil then
		mutables.playerXuid = playerInfo.xuid
		mutables.playerName = playerInfo.name
		mutables.socialFacebook = playerInfo.socialFacebook
		mutables.playerSocialName = playerInfo.socialName
		mutables.playerRank = playerInfo.rank
		mutables.playerIndex = itemIndex - 1
		mutables.playerRankIcon = playerInfo.rankIcon
		mutables.name:setText( playerInfo.name )
		mutables.presence:setText( playerInfo.status )
		local joinable = Engine.IsPlayerJoinable( controller, mutables.playerXuid )
		if joinable.isJoinable then
			mutables.joinableIcon:setAlpha( 1 )
		else
			mutables.joinableIcon:setAlpha( 0 )
		end
		if not CoD.isSinglePlayer and CoD.FriendsListPopup.Mode ~= CoD.playerListType.friendRequest then
			if CoD.isZombie == true then
				mutables.emblem:setImage( RegisterMaterial( playerInfo.rankIcon ) )
			else
				if playerInfo.rank ~= nil and playerInfo.rankIcon ~= nil and playerInfo.rank ~= "0" then
					mutables.rankIcon:setImage( RegisterMaterial( playerInfo.rankIcon ) )
					mutables.rankIcon:setAlpha( 1 )
					if playerInfo.prestige ~= tonumber( CoD.MAX_PRESTIGE ) then
						mutables.rank:setText( playerInfo.rank )
					else
						mutables.rank:setText( "" )
					end
				else
					mutables.rankIcon:setAlpha( 0 )
					mutables.rank:setText( "" )
				end
				mutables.emblem:setupPlayerEmblemByXUID( mutables.playerXuid )
			end
		end
	end
end

CoD.FriendsListPopup.RefreshList = function ( friendsList, event )
	local mutables = friendsList.listBox:getFocussedMutables()
	local newIndexToFocus = {
		index = 1
	}
	local playerListType = {}
	playerListType = CoD.FriendsListPopup.Mode
	if friendsList ~= nil and friendsList.listBox ~= nil then
		if mutables ~= nil and mutables.playerXuid ~= nil and mutables.playerXuid ~= 0 then
			newIndexToFocus = Engine.GetPlayerIndexByXuid( friendsList.m_ownerController, mutables.playerXuid, playerListType )
			newIndexToFocus.index = newIndexToFocus.index + 1
		end
		if CoD.FriendsListPopup.Mode == CoD.playerListType.facebook then
			if nil ~= Engine.IsFacebookLinked and Engine.IsFacebookLinked( controller ) then
				if nil ~= Engine.IsFacebookDuplicate and Engine.IsFacebookDuplicate( controller ) then
					friendsList.listBox.noDataText = Engine.Localize( "MENU_FB_ACCOUNT_IN_USE" )
				else
					friendsList.listBox.noDataText = Engine.Localize( "MENU_FRIENDS_FB_NONE" )
				end
			else
				friendsList.listBox.noDataText = Engine.Localize( "MENU_FRIENDS_FB_NOT_LINKED" )
			end
		end
		friendsList.listBox:setTotalItems( Engine.GetPlayerCount( friendsList.m_ownerController, CoD.FriendsListPopup.Mode ), newIndexToFocus.index )
		CoD.FriendsListPopup.UpdatePromptButtonVis( friendsList )
		friendsList.listBox:refresh()
		if Engine.GetPlayerCount( friendsList.m_ownerController, CoD.FriendsListPopup.Mode ) == 0 and CoD.FriendDetails ~= nil then
			CoD.FriendDetails.hide( friendsList.details )
		end
	end
end

local FriendsList_FriendsTab = function ( tabManager, controller )
	Dvar.ui_friendsListOpen:set( true )
	Dvar.ui_playerListOpen:set( false )
	if CoD.isXBOX then
		Dvar.ui_xboxLivePartyListOpen:set( false )
	end
	Engine.Exec( controller, "updateInfoForInGameList" )
	local friendsList = tabManager.popup
	friendsList.joinText:setText( "" )
	friendsList.listBox.noDataText = Engine.Localize( "MPUI_NO_FRIENDS" )
	if CoD.FriendDetails ~= nil then
		CoD.FriendDetails.hide( friendsList.details )
	end
	friendsList:addElement( friendsList.listBox )
	friendsList.header:setText( Engine.Localize( "MENU_TAB_FRIENDS_CAPS" ) )
	CoD.FriendsListPopup.Mode = CoD.playerListType.friend
	friendsList.listBox:setTotalItems( Engine.GetPlayerCount( controller, CoD.FriendsListPopup.Mode ) )
	CoD.FriendsListPopup.UpdatePromptButtonVis( friendsList )
	local tabContent = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false
	} )
	return tabContent
end

local FriendsList_LeagueFriendsTab = function ( tabManager, controller )
	Dvar.ui_friendsListOpen:set( true )
	Dvar.ui_playerListOpen:set( false )
	if CoD.isXBOX then
		Dvar.ui_xboxLivePartyListOpen:set( false )
	end
	Engine.Exec( controller, "updateInfoForInGameList" )
	local friendsList = tabManager.popup
	if CoD.FriendDetails ~= nil then
		CoD.FriendDetails.hide( friendsList.details )
	end
	friendsList:addElement( friendsList.listBox )
	friendsList.header:setText( Engine.Localize( "MENU_TAB_LEAGUE_FRIENDS_CAPS" ) )
	friendsList.listBox.noDataText = Engine.Localize( "MENU_LEAGUE_FRIENDS_NONE" )
	CoD.FriendsListPopup.Mode = CoD.playerListType.leagueFriend
	friendsList.listBox:setTotalItems( Engine.GetPlayerCount( controller, CoD.FriendsListPopup.Mode ) )
	CoD.FriendsListPopup.UpdatePromptButtonVis( friendsList )
	local tabContent = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false
	} )
	return tabContent
end

local FriendsList_FacebookTab = function ( tabManager, controller )
	Dvar.ui_friendsListOpen:set( true )
	Dvar.ui_playerListOpen:set( false )
	if CoD.isXBOX then
		Dvar.ui_xboxLivePartyListOpen:set( false )
	end
	Engine.Exec( controller, "updateInfoForInGameList" )
	local friendsList = tabManager.popup
	if CoD.FriendDetails ~= nil then
		CoD.FriendDetails.hide( friendsList.details )
	end
	friendsList:addElement( friendsList.listBox )
	friendsList.header:setText( Engine.Localize( "MENU_TAB_FACEBOOK_CAPS" ) )
	if Engine.IsFacebookLinked ~= nil and Engine.IsFacebookLinked( controller ) then
		if Engine.IsFacebookDuplicate ~= nil and Engine.IsFacebookDuplicate( controller ) then
			friendsList.listBox.noDataText = Engine.Localize( "MENU_FB_ACCOUNT_IN_USE" )
		else
			friendsList.listBox.noDataText = Engine.Localize( "MENU_FRIENDS_FB_NONE" )
		end
	elseif Engine.IsPlayerUnderage( controller ) then
		friendsList.listBox.noDataText = Engine.Localize( "MENU_GENERIC_UNDERAGE_MESSAGE" )
	else
		friendsList.listBox.noDataText = Engine.Localize( "MENU_FRIENDS_FB_NOT_LINKED" )
	end
	CoD.FriendsListPopup.Mode = CoD.playerListType.facebook
	friendsList.listBox:setTotalItems( Engine.GetPlayerCount( controller, CoD.FriendsListPopup.Mode ) )
	CoD.FriendsListPopup.UpdatePromptButtonVis( friendsList )
	local tabContent = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false
	} )
	return tabContent
end

local FriendsList_RecentPlayersTab = function ( tabManager, controller )
	Dvar.ui_friendsListOpen:set( false )
	Dvar.ui_playerListOpen:set( true )
	if CoD.isXBOX then
		Dvar.ui_xboxLivePartyListOpen:set( false )
	end
	Engine.Exec( controller, "updateInfoForInGameList" )
	local friendsList = tabManager.popup
	friendsList.joinText:setText( "" )
	friendsList.listBox.noDataText = Engine.Localize( "MPUI_NO_RECENT" )
	if CoD.FriendDetails ~= nil then
		CoD.FriendDetails.hide( friendsList.details )
	end
	friendsList:addElement( friendsList.listBox )
	friendsList.header:setText( Engine.Localize( "MENU_TAB_PLAYERS_CAPS" ) )
	CoD.FriendsListPopup.Mode = CoD.playerListType.recentPlayer
	friendsList.listBox:setTotalItems( Engine.GetPlayerCount( controller, CoD.FriendsListPopup.Mode ) )
	CoD.FriendsListPopup.UpdatePromptButtonVis( friendsList )
	local tabContent = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false
	} )
	return tabContent
end

local FriendsList_EliteClanTab = function ( tabManager, controller )
	Dvar.ui_friendsListOpen:set( false )
	Dvar.ui_playerListOpen:set( true )
	if CoD.isXBOX then
		Dvar.ui_xboxLivePartyListOpen:set( false )
	end
	Engine.Exec( controller, "updateInfoForInGameList" )
	local friendsList = tabManager.popup
	if CoD.FriendDetails ~= nil then
		CoD.FriendDetails.hide( friendsList.details )
	end
	friendsList:addElement( friendsList.listBox )
	friendsList.header:setText( Engine.Localize( "MENU_TAB_ELITE_CLAN_CAPS" ) )
	local numClan = Engine.GetPlayerCount( controller, CoD.playerListType.elite )
	local playerElite = Engine.IsPlayerEliteRegistered( controller )
	if playerElite ~= true then
		friendsList.listBox.noDataText = Engine.Localize( "MPUI_JOIN_ELITE_TEXT" )
	elseif numClan < 1 then
		friendsList.listBox.noDataText = Engine.Localize( "MPUI_JOIN_ELITE_CLAN" )
	end
	CoD.FriendsListPopup.Mode = CoD.playerListType.elite
	friendsList.listBox:setTotalItems( Engine.GetPlayerCount( controller, CoD.FriendsListPopup.Mode ) )
	CoD.FriendsListPopup.UpdatePromptButtonVis( friendsList )
	local tabContent = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false
	} )
	return tabContent
end

local FriendsList_XboxLIVEPartyTab = function ( tabManager, controller )
	Dvar.ui_friendsListOpen:set( false )
	Dvar.ui_playerListOpen:set( false )
	if CoD.isXBOX then
		Dvar.ui_xboxLivePartyListOpen:set( true )
	end
	Engine.Exec( controller, "updateInfoForInGameList" )
	local friendsList = tabManager.popup
	friendsList.joinText:setText( "" )
	if CoD.FriendDetails ~= nil then
		CoD.FriendDetails.hide( friendsList.details )
	end
	friendsList:addElement( friendsList.listBox )
	friendsList.header:setText( Engine.Localize( "MENU_TAB_XBOXLIVE_PARTY" ) )
	friendsList.listBox.noDataText = Engine.Localize( "MPUI_START_XBOX_PARTY" )
	CoD.FriendsListPopup.Mode = CoD.playerListType.party
	friendsList.listBox:setTotalItems( Engine.GetPlayerCount( controller, CoD.FriendsListPopup.Mode ) )
	CoD.FriendsListPopup.UpdatePromptButtonVis( friendsList )
	local tabContent = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false
	} )
	return tabContent
end

local FriendsList_GameInviteTab = function ( tabManager, controller )
	local friendsList = tabManager.popup
	friendsList.joinText:setText( "" )
	if CoD.isSinglePlayer then
		CoD.FriendDetails = nil
	end
	friendsList:addElement( friendsList.listBox )
	friendsList.header:setText( Engine.Localize( "MENU_GAME_INVITES_CAPS" ) )
	friendsList.listBox.noDataText = Engine.Localize( "MENU_NO_INVITE" )
	if CoD.FriendDetails ~= nil then
		CoD.FriendDetails.hide( friendsList.details )
	end
	CoD.FriendsListPopup.Mode = CoD.playerListType.gameInvites
	friendsList.listBox:setTotalItems( Engine.GetPlayerCount( controller, CoD.FriendsListPopup.Mode ) )
	CoD.FriendsListPopup.UpdatePromptButtonVis( friendsList )
	local tabContent = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false
	} )
	return tabContent
end

local FriendsList_FriendRequestTab = function ( tabManager, controller )
	local friendsList = tabManager.popup
	friendsList.joinText:setText( "" )
	if CoD.isSinglePlayer then
		CoD.FriendDetails = nil
	end
	friendsList:addElement( friendsList.listBox )
	friendsList.header:setText( Engine.Localize( "PLATFORM_FRIEND_REQUESTS_CAPS" ) )
	friendsList.listBox.noDataText = Engine.Localize( "PLATFORM_NO_REQUESTS" )
	if CoD.FriendDetails ~= nil then
		CoD.FriendDetails.hide( friendsList.details )
	end
	CoD.FriendsListPopup.Mode = CoD.playerListType.friendRequest
	friendsList.listBox:setTotalItems( Engine.GetPlayerCount( controller, CoD.FriendsListPopup.Mode ) )
	CoD.FriendsListPopup.UpdatePromptButtonVis( friendsList )
	local tabContent = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = false,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = false
	} )
	return tabContent
end

local FriendsList_TextMessagesTab = function ( tabManager, controller )
	local friendsList = tabManager.popup
	friendsList.joinText:setText( "" )
	if CoD.isSinglePlayer then
		CoD.FriendDetails = nil
	end
	if CoD.FriendDetails ~= nil then
		CoD.FriendDetails.hide( friendsList.details )
	end
	friendsList.listBox:close()
	friendsList.header:setText( Engine.Localize( "PLATFORM_UI_TM_TEXT_MESSAGES_CAPS" ) )
	friendsList.rootTextMessageElement = CoD.TextMessage.CreateRootTextMessageElement( friendsList, controller )
	friendsList.rootTextMessageElement:updatePromptButtonVis()
	friendsList.rootTextMessageElement:setTopBottom( true, true, 110, -CoD.ButtonPrompt.Height )
	return friendsList.rootTextMessageElement
end

local AddFriends_ButtonAction = function ( self, event )
	Engine.Exec( event.controller, "ui_keyboard_new " .. Enum.KeyboardType.KEYBOARD_TYPE_ADD_FRIEND )
end

local AddFriends_Added = function ( self, event )
	self:registerEventHandler( "ui_keyboard_input", nil )
	local gamertag = event.input
	if gamertag ~= nil then
		Engine.Exec( event.controller, "xaddfriendbyname " .. gamertag )
	end
end

CoD.FriendsListPopup.Close = function ( friendsList, event )
	if friendsList.occludedMenu ~= nil then
		friendsList.occludedMenu:processEvent( {
			name = "closeallpopups",
			controller = event.controller
		} )
	end
	CoD.FriendsList.CloseMenu( friendsList, event )
end

CoD.FriendsListPopup.SaveAndQuit = function ( self, event )
	self:saveState()
	self:openMenu( "SaveAndQuitGamePopup", event.controller )
	self:close()
end

CoD.FriendsListPopup.FacebookLink = function ( friendsList, event )
	if Engine.IsFacebookLinked ~= nil and not Engine.IsFacebookLinked( event.controller ) then
		Engine.Exec( event.controller, "fbLinkFacebook" )
	end
end

LUI.createMenu.FriendsList = function ( controller, userData )
	Engine.Exec( controller, "updateInfoForInGameList" )
	local friendsList = CoD.Menu.New( "FriendsList" )
	if not Engine.IsInGame() then
		friendsList:addLargePopupBackground()
	end
	if userData ~= nil and userData.previousMenu ~= nil then
		friendsList:setPreviousMenu( userData.previousMenu )
		friendsList.previousMenu = userData.previousMenu
	end
	friendsList:setOwner( controller )
	friendsList:registerEventHandler( "close_friends_list", CoD.FriendsList.CloseMenu )
	friendsList:registerEventHandler( "friend_invitetosession", CoD.FriendsListPopup.InviteToSession )
	friendsList:registerEventHandler( "friend_joinsession", CoD.FriendsListPopup.JoinSession )
	friendsList:registerEventHandler( "probation_confirmation", CoD.FriendsListPopup.FinishJoinSession )
	friendsList:registerEventHandler( "listbox_focus_changed", CoD.FriendsListPopup.FriendFocusChanged )
	friendsList:registerEventHandler( "friend_selected", CoD.FriendsListPopup.FriendSelected )
	friendsList:registerEventHandler( "xboxlive_party", CoD.FriendsListPopup.XboxLIVEParty )
	friendsList:registerEventHandler( "ps3_invitations", CoD.FriendsListPopup.PS3Invitations )
	friendsList:registerEventHandler( "friends_updated", CoD.FriendsListPopup.RefreshList )
	friendsList:registerEventHandler( "closeallpopups", CoD.FriendPopup.Close )
	friendsList:registerEventHandler( "signed_out", CoD.Menu.SignedOut )
	friendsList:registerEventHandler( "fb_linkFacebook", CoD.FriendsListPopup.FacebookLink )
	if CoD.useMouse then
		friendsList:registerEventHandler( "listbox_clicked", CoD.FriendsListPopup.FriendSelected )
	end
	if CoD.isWIIU then
		friendsList:registerEventHandler( "open_saveandquitgamepopup", CoD.FriendsListPopup.SaveAndQuit )
		friendsList:registerEventHandler( "closeFriendsList", CoD.FriendsListPopup.Close )
		if not Engine.IsInGame() then
			LUI.roots.UIRootFull.friendsMenu = friendsList
		else
			local f28_local0 = LUI.roots
			local f28_local1 = "UIRoot"
			f28_local0["UIRoot" .. controller].friendsMenu = friendsList
		end
	end
	friendsList.selectButton = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_SELECT" ), friendsList, "friend_selected" )
	if CoD.isZombie then
		local f28_local0 = not Engine.IsInGame()
	else
		local shouldShow = true
	end
	if f28_local0 == true then
		friendsList.inviteButton = CoD.ButtonPrompt.new( "select", Engine.Localize( "MENU_INVITE_GAME" ), friendsList, "friend_invitetosession", false, nil, false, nil, "I" )
		friendsList.joinButton = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_JOIN_IN_PROGRESS" ), friendsList, "friend_joinsession", false, nil, false, nil, "J" )
	end
	friendsList.backButton = CoD.ButtonPrompt.new( "secondary", Engine.Localize( "MPUI_DONE" ), friendsList, "close_friends_list" )
	friendsList.partyButton = CoD.ButtonPrompt.new( "start", Engine.Localize( "MENU_XBOXLIVE_PARTY" ), friendsList, "xboxlive_party" )
	friendsList.linkFBButton = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_FB_LINK" ), friendsList, "fb_linkFacebook" )
	if CoD.isPS3 then
		friendsList.invitationsButton = CoD.ButtonPrompt.new( "start", Engine.Localize( "PLATFORM_VIEW_GAME_INVITES" ), friendsList, "ps3_invitations" )
	end
	if not CoD.isSinglePlayer then
		friendsList.details = CoD.FriendDetails.new()
		friendsList:addElement( friendsList.details )
	end
	local listBoxButtonWidth = 400
	local listBoxDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = CoD.SDSafeWidth,
		topAnchor = true,
		bottomAnchor = true,
		top = 110,
		bottom = -CoD.ButtonPrompt.Height - 5
	}
	friendsList.listBox = CoD.ListBox.new( listBoxDefaultAnimState, controller, 7, CoD.CoD9Button.Height * 2, listBoxButtonWidth, FriendsList_ButtonCreator, FriendsList_ButtonData, 5, 2 )
	CoD.ListBox.HideMessage( friendsList.listBox, true )
	local tabManagerDefaultAnimationState = {
		left = 0,
		top = 70,
		right = 0,
		bottom = CoD.ButtonPrompt.Height,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false
	}
	friendsList.tabContentPane = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = -CoD.ButtonPrompt.Height,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	} )
	local tabManager = CoD.MFTabManager.new( friendsList.tabContentPane, tabManagerDefaultAnimationState )
	tabManager:keepRightBumperAlignedToHeader( true )
	tabManager.popup = friendsList
	friendsList.tabManager = tabManager
	local headerFontName = "Big"
	local headerFont = CoD.fonts[headerFontName]
	local headerHeight = CoD.textSize[headerFontName]
	friendsList.header = LUI.UIText.new()
	friendsList.header:setLeftRight( true, true, 0, 0 )
	friendsList.header:setTopBottom( true, false, 15, 15 + headerHeight )
	friendsList.header:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	friendsList.header:setFont( headerFont )
	friendsList.header:setAlignment( LUI.Alignment.Left )
	if CoD.isMultiplayer and not CoD.isZombie then
		local miniIdentity = CoD.MiniIdentity.GetMiniIdentity( controller )
		friendsList:addElement( miniIdentity )
	end
	friendsList.listBox.m_positionTextString = "MENU_LB_LISTBOX_POSITION_TEXT"
	friendsList.listBox:addScrollBar( 30, 2 )
	friendsList.listBox.m_pageArrowsOn = true
	friendsList:addElement( friendsList.header )
	friendsList:addElement( tabManager )
	friendsList:addElement( friendsList.tabContentPane )
	friendsList.joinText = LUI.UIText.new()
	friendsList:addElement( friendsList.joinText )
	friendsList.joinText:setText( "" )
	tabManager:addTab( controller, "MENU_TAB_FRIENDS_CAPS", FriendsList_FriendsTab )
	tabManager:addTab( controller, "MENU_TAB_LEAGUE_FRIENDS_CAPS", FriendsList_LeagueFriendsTab )
	tabManager:addTab( controller, "MENU_TAB_FACEBOOK_CAPS", FriendsList_FacebookTab )
	if Engine.IsEliteAvailable() then
		tabManager:addTab( controller, "MENU_TAB_ELITE_CLAN_CAPS", FriendsList_EliteClanTab )
	end
	tabManager:addTab( controller, "MENU_TAB_PLAYERS_CAPS", FriendsList_RecentPlayersTab )
	if CoD.isXBOX then
		tabManager:addTab( controller, "MENU_TAB_XBOXLIVE_PARTY", FriendsList_XboxLIVEPartyTab )
	end
	if CoD.isWIIU or CoD.isPC then
		tabManager:addTab( controller, "MENU_GAME_INVITES_CAPS", FriendsList_GameInviteTab )
	end
	if CoD.isWIIU then
		tabManager:addTab( controller, "PLATFORM_FRIEND_REQUESTS_CAPS", FriendsList_FriendRequestTab )
	end
	tabManager:refreshTab( controller )
	friendsList:addElement( friendsList.listBox )
	friendsList.listBox:setTotalItems( Engine.GetPlayerCount( controller, CoD.FriendsListPopup.Mode ), 1 )
	CoD.FriendsListPopup.UpdatePromptButtonVis( friendsList )
	if not CoD.isZombie then
		Engine.PlaySound( "cac_loadout_edit_sel" )
	else
		Engine.PlaySound( "cac_grid_equip_item" )
	end
	return friendsList
end

LUI.createMenu.IngameFriendsList = function ( controller )
	local ingameFriendsList = nil
	ingameFriendsList = CoD.Menu.New( "FriendsList" )
	ingameFriendsList:addLargePopupBackground()
	ingameFriendsList:setOwner( controller )
	ingameFriendsList:setPreviousMenu( "class" )
	ingameFriendsList:registerEventHandler( "friend_invitetosession", CoD.FriendsListPopup.InviteToSession )
	ingameFriendsList:registerEventHandler( "friend_joinsession", CoD.FriendsListPopup.JoinSession )
	ingameFriendsList:registerEventHandler( "listbox_focus_changed", CoD.FriendsListPopup.FriendFocusChanged )
	ingameFriendsList:registerEventHandler( "friend_selected", CoD.FriendsListPopup.FriendSelected )
	ingameFriendsList:registerEventHandler( "friends_updated", CoD.FriendsListPopup.RefreshList )
	ingameFriendsList:registerEventHandler( "closeallpopups", CoD.FriendPopup.Close )
	ingameFriendsList:registerEventHandler( "close_all_ingame_menus", CoD.FriendPopup.Close )
	if CoD.useMouse then
		ingameFriendsList:registerEventHandler( "listbox_clicked", CoD.FriendsListPopup.FriendSelected )
	end
	ingameFriendsList.selectButton = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_SELECT" ), ingameFriendsList, "friend_selected" )
	ingameFriendsList.inviteButton = CoD.ButtonPrompt.new( "alt2", Engine.Localize( "MENU_INVITE_GAME" ), ingameFriendsList, "friend_invitetosession", false, nil, false, nil, "I" )
	ingameFriendsList.joinButton = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_JOIN_IN_PROGRESS" ), ingameFriendsList, "friend_joinsession", false, nil, false, nil, "J" )
	ingameFriendsList.backButton = CoD.ButtonPrompt.new( "secondary", Engine.Localize( "MPUI_DONE" ), ingameFriendsList, "button_prompt_back" )
	if not CoD.isSinglePlayer then
		ingameFriendsList.details = CoD.FriendDetails.new()
		ingameFriendsList:addElement( ingameFriendsList.details )
	end
	local listBoxDefaultAnimState = {
		left = 0,
		top = 30,
		right = 0,
		bottom = -CoD.ButtonPrompt.Height,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	}
	ingameFriendsList.listBox = CoD.ListBox.new( listBoxDefaultAnimState, controller, 8, CoD.CoD9Button.Height * 2, 400, FriendsList_ButtonCreator, FriendsList_ButtonData, 5, 2 )
	Dvar.ui_friendsListOpen:set( true )
	local tabManagerDefaultAnimationState = {
		left = 0,
		top = 0,
		right = 0,
		bottom = CoD.ButtonPrompt.Height,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false
	}
	ingameFriendsList.tabContentPane = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = -CoD.ButtonPrompt.Height,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	} )
	local tabManager = CoD.MFTabManager.new( ingameFriendsList.tabContentPane, tabManagerDefaultAnimationState )
	tabManager.popup = ingameFriendsList
	ingameFriendsList.tabManager = tabManager
	ingameFriendsList:addElement( tabManager )
	ingameFriendsList:addElement( ingameFriendsList.tabContentPane )
	tabManager:addTab( controller, "MENU_TAB_FRIENDS_CAPS", FriendsList_FriendsTab )
	tabManager:addTab( controller, "MENU_TAB_PLAYERS_CAPS", FriendsList_RecentPlayersTab )
	tabManager:addTab( controller, "MENU_GAME_INVITES_CAPS", FriendsList_GameInviteTab )
	tabManager:refreshTab( controller )
	ingameFriendsList:addElement( ingameFriendsList.listBox )
	ingameFriendsList.listBox:setTotalItems( Engine.GetPlayerCount( controller, CoD.FriendsListPopup.Mode ) )
	CoD.FriendsListPopup.UpdatePromptButtonVis( ingameFriendsList )
	Engine.PlaySound( "cac_loadout_edit_sel" )
	if CoD.isWIIU then
		local f29_local0 = LUI.roots
		local f29_local1 = "UIRoot"
		f29_local0["UIRoot" .. controller].friendsMenu = ingameFriendsList
	end
	return ingameFriendsList
end

