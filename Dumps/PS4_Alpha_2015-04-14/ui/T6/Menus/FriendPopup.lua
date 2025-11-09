require( "ui.T6.PlayerIdentity" )
require( "ui_mp.T6.Menus.MiniIdentity" )

CoD.FriendPopup = {}
CoD.FriendPopup.SelectedPlayerXuid = nil
CoD.FriendPopup.SelectedPlayerName = nil
CoD.FriendPopup.SelectedPlayerRank = nil
CoD.ReportPlayer = {}
CoD.FriendPopup.Button_Invite = function ( friendPopup, event )
	if friendPopup.selectedPlayerXuid ~= nil then
		CoD.invitePlayer( event.controller, friendPopup.selectedPlayerXuid, CoD.FriendsListPopup.Mode )
	end
end

CoD.FriendPopup.Button_Join = function ( friendPopup, event )
	if friendPopup.selectedPlayerXuid ~= nil then
		CoD.joinPlayer( event.controller, friendPopup.selectedPlayerXuid )
		friendPopup:processEvent( {
			name = "closeallpopups",
			controller = event.controller
		} )
	end
end

CoD.FriendPopup.Button_Gamercard = function ( friendPopup, event )
	if friendPopup.selectedPlayerXuid ~= nil and friendPopup.selectedPlayerName ~= nil then
		CoD.viewGamerCard( event.controller, friendPopup.selectedPlayerName, friendPopup.selectedPlayerXuid, CoD.playerListType.party )
	end
end

CoD.FriendPopup.Button_CombatRecord = function ( friendPopup, event )
	if friendPopup.selectedPlayerXuid ~= nil then
		friendPopup.openCombatRecord = true
		Engine.Exec( event.controller, "getServiceRecord " .. friendPopup.selectedPlayerXuid )
	end
end

CoD.FriendPopup.Button_LeagueTeams = function ( friendPopup, event )
	if friendPopup.selectedPlayerXuid ~= nil then
		CoD.Barracks.CurrentLeaguePlayerXuid = friendPopup.selectedPlayerXuid
		CoD.Barracks.ShowLeagueTeamsOnly = true
		CoD.Barracks.LeagueTeamsDataFetched = false
		friendPopup:openPopup( "Barracks", event.controller )
	end
end

CoD.FriendPopup.StatsDownloaded = function ( friendPopup, event )
	if friendPopup.selectedPlayerXuid ~= nil and friendPopup.openCombatRecord == true then
		friendPopup.openCombatRecord = nil
		CoD.CRCommon.OtherPlayerCRMode = true
		CoD.CRCommon.CurrentXuid = friendPopup.selectedPlayerXuid
		friendPopup:openPopup( "Barracks", event.controller )
	end
end

CoD.FriendPopup.Button_RecentGames = function ( friendPopup, event )
	if Engine.CanViewContent() == false then
		friendPopup:openPopup( "popup_contentrestricted", event.controller )
		return 
	elseif friendPopup.selectedPlayerXuid ~= nil and friendPopup.selectedPlayerName ~= nil then
		CoD.perController[event.controller].codtvRoot = "playerchannel"
		CoD.perController[event.controller].playerChannelXuid = friendPopup.selectedPlayerXuid
		friendPopup:openPopup( "CODTv", event.controller )
	end
end

CoD.FriendPopup.Close = function ( self, event )
	if self.m_inputDisabled == nil then
		self:goBack( event.controller )
		if self.occludedMenu ~= nil then
			self.occludedMenu:processEvent( {
				name = "closeallpopups",
				controller = event.controller
			} )
		end
	end
end

CoD.FriendPopup.MuteButtonAction = function ( friendPopup, event )
	if CoD.isPlayerMuted( event.controller, friendPopup.selectedPlayerXuid ) then
		event.button:setLabel( Engine.Localize( "MENU_MUTE_CAPS" ) )
	else
		event.button:setLabel( Engine.Localize( "MENU_UNMUTE_CAPS" ) )
	end
	CoD.CoD9Button.GainFocus( event.button, {} )
	Engine.MutePlayerByXuid( event.controller, friendPopup.selectedPlayerXuid )
end

CoD.FriendPopup.sendFriendRequestButtonAction = function ( friendPopup, event )
	if CoD.isWIIU then
		friendPopup:goBack( event.controller )
	end
	CoD.sendFriendRequest( event.controller, friendPopup.selectedPlayerXuid )
end

CoD.FriendPopup.Button_KickPlayer = function ( friendPopup, event )
	friendPopup:openPopup( "KickPlayerPopup", event.controller )
end

CoD.FriendPopup.Button_ReportPlayer = function ( friendPopup, event )
	friendPopup:openPopup( "popup_reportuser", event.controller )
end

CoD.FriendPopup.Button_ShowGroups = function ( friendPopup, event )
	friendPopup:openPopup( "GroupsPlayerPopup", event.controller )
end

CoD.FriendPopup.Button_InviteToGroup = function ( friendPopup, event )
	friendPopup:openPopup( "GroupsInvitePopup", event.controller )
end

CoD.FriendPopup.LikeEmblem = function ( friendPopup, event )
	if friendPopup.m_emblemFileID ~= nil and friendPopup.m_emblemFileID ~= "0" then
		local voteData = {
			fileID = friendPopup.m_emblemFileID,
			category = "emblem",
			selectedPlayerXuid = friendPopup.selectedPlayerXuid,
			fromLobby = true
		}
		CoD.perController[event.controller].voteData = voteData
		CoD.perController[event.controller].voteUpdateTarget = friendPopup
		local votePopup = friendPopup:openPopup( "FileshareVote", event.controller )
	end
end

LUI.createMenu.FriendPopup = function ( controller, previousMenuName )
	local friendPopup = CoD.Menu.NewMediumPopup( "FriendPopup" )
	friendPopup:registerEventHandler( "closeallpopups", CoD.FriendPopup.Close )
	friendPopup.m_ownerController = controller
	friendPopup.selectedPlayerXuid = CoD.FriendPopup.SelectedPlayerXuid
	friendPopup.selectedPlayerName = CoD.FriendPopup.SelectedPlayerName
	friendPopup.LeagueMemberSelected = CoD.FriendPopup.LeagueMemberSelected
	CoD.FriendPopup.LeagueMemberSelected = false
	friendPopup.LeagueLeaderboardMemberSelected = CoD.FriendPopup.LeagueLeaderboardMemberSelected
	friendPopup.selectedPlayerRank = nil
	if CoD.FriendPopup.SelectedPlayerRank ~= "" and CoD.FriendPopup.SelectedPlayerRank ~= nil then
		friendPopup.selectedPlayerRank = tonumber( CoD.FriendPopup.SelectedPlayerRank )
	end
	CoD.FriendPopup.SelectedPlayerRank = nil
	local f16_local0 = Engine.IsInGame()
	if f16_local0 then
		f16_local0 = CoD.isPC
		if not f16_local0 then
			local inGameDisablePCWIIU = CoD.isWIIU
		end
	end
	local selectedPlayerXuid = CoD.FriendPopup.SelectedPlayerXuid
	local firstFocussable = nil
	local isGuest = Engine.IsGuestByXuid( selectedPlayerXuid )
	friendPopup:addSelectButton()
	friendPopup:addBackButton()
	friendPopup:addTitle( "" )
	if CoD.isZombie == true then
		CoD.FriendPopup.AddOverviewInfo_Zombie( friendPopup )
	else
		CoD.FriendPopup.AddOverviewInfo_Multiplayer( friendPopup )
	end
	local buttonList = CoD.ButtonList.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = CoD.ButtonList.DefaultWidth,
		topAnchor = true,
		bottomAnchor = true,
		top = CoD.textSize.Big + 10,
		bottom = 0
	} )
	local isFriend = Engine.IsFriendFromXUID( controller, selectedPlayerXuid )
	local isPlayerOnline = Engine.IsFriendFromXUID( controller, selectedPlayerXuid )
	local f16_local1 = Engine.GetXUID( controller ) == friendPopup.selectedPlayerXuid
	if CoD.FriendsListPopup.Mode ~= CoD.playerListType.leaderboard then
		if CoD.canSendFriendRequest( controller, friendPopup.selectedPlayerXuid ) then
			friendPopup.sendFriendRequestButton = buttonList:addButton( Engine.Localize( "MENU_SEND_FRIEND_REQUEST_CAPS" ) )
			friendPopup.sendFriendRequestButton:setActionEventName( "send_friend_request" )
			friendPopup:registerEventHandler( "send_friend_request", CoD.FriendPopup.sendFriendRequestButtonAction )
		end
		if friendPopup.selectedPlayerXuid ~= nil and CoD.canInviteToGame( controller, friendPopup.selectedPlayerXuid ) then
			local maxPartySize = Dvar.party_maxplayers:get()
			local currentPlayerCount = Engine.PartyGetPlayerCount()
			if currentPlayerCount ~= nil and maxPartySize > currentPlayerCount then
				local f16_local2 = false
			else
				local isLobbyFull = true
			end
			local f16_local3
			if CoD.isZombie then
				if not Engine.IsInGame() then
					f16_local3 = not f16_local2
				else
					f16_local3 = false
				end
			else
				local shouldShow = true
			end
			if f16_local3 == true then
				friendPopup.inviteButton = buttonList:addButton( Engine.Localize( "MENU_INVITE_TO_GAME_CAPS" ) )
				friendPopup.inviteButton:setActionEventName( "friend_invite" )
				friendPopup:registerEventHandler( "friend_invite", CoD.FriendPopup.Button_Invite )
			end
		end
		if friendPopup.selectedPlayerXuid ~= nil and CoD.canJoinSession( controller, friendPopup.selectedPlayerXuid ) then
			if CoD.isZombie then
				local f16_local4 = not Engine.IsInGame()
			else
				local shouldShow = true
			end
			if f16_local4 == true then
				friendPopup.joinButton = buttonList:addButton( Engine.Localize( "MENU_JOIN_IN_PROGRESS_CAPS" ) )
				friendPopup.joinButton:setActionEventName( "friend_join" )
				friendPopup:registerEventHandler( "friend_join", CoD.FriendPopup.Button_Join )
			end
		end
	end
	if not CoD.isWIIU and not isGuest then
		friendPopup.gamercardButton = buttonList:addButton( Engine.Localize( "XBOXLIVE_VIEW_PROFILE_CAPS" ) )
		friendPopup.gamercardButton:setActionEventName( "friend_viewgamercard" )
		friendPopup:registerEventHandler( "friend_viewgamercard", CoD.FriendPopup.Button_Gamercard )
	end
	if not isGuest and not Engine.IsInGame() and not CoD.isZombie and not friendPopup.LeagueMemberSelected then
		local friendRank = Engine.GetRankByXUID( controller, friendPopup.selectedPlayerXuid )
		local friendPrestigeLevel = Engine.GetPrestigeByXUID( controller, friendPopup.selectedPlayerXuid )
		local combatRecordUnlockRank = Engine.GetItemUnlockLevel( Engine.GetItemIndex( "FEATURE_COMBAT_RECORD" ) )
		if friendPopup.selectedPlayerRank and friendRank < friendPopup.selectedPlayerRank then
			friendRank = friendPopup.selectedPlayerRank
		end
		friendPopup.combatRecordButton = buttonList:addButton( Engine.ToUpper( Engine.Localize( "MENU_VIEW_COMBAT_RECORD" ) ) )
		friendPopup.combatRecordButton:setActionEventName( "friend_viewcombatrecord" )
		friendPopup:registerEventHandler( "friend_viewcombatrecord", CoD.FriendPopup.Button_CombatRecord )
		friendPopup:registerEventHandler( "service_record_fetched", CoD.FriendPopup.StatsDownloaded )
		if friendPrestigeLevel == 0 and friendRank < combatRecordUnlockRank then
			friendPopup.combatRecordButton:disable()
		end
	end
	if not isGuest and not Engine.IsInGame() and not CoD.isZombie and not friendPopup.LeagueMemberSelected and not friendPopup.LeagueLeaderboardMemberSelected then
		friendPopup.viewLeagueTeamsButton = buttonList:addButton( Engine.ToUpper( Engine.Localize( "MENU_VIEW_LEAGUE_TEAMS" ) ) )
		friendPopup.viewLeagueTeamsButton:setActionEventName( "friend_viewleagueteams" )
		friendPopup:registerEventHandler( "friend_viewleagueteams", CoD.FriendPopup.Button_LeagueTeams )
	end
	if not Engine.IsInGame() and not f16_local0 and not isGuest and not CoD.isSinglePlayer and not friendPopup.LeagueMemberSelected then
		friendPopup.showRecentGamesButton = buttonList:addButton( Engine.Localize( "MENU_PLAYER_CHANNEL" ) )
		friendPopup.showRecentGamesButton:setActionEventName( "friend_viewrecentgames" )
		friendPopup:registerEventHandler( "friend_viewrecentgames", CoD.FriendPopup.Button_RecentGames )
	end
	if CoD.FriendsListPopup.Mode ~= CoD.playerListType.leaderboard then
		if CoD.canMutePlayer( controller, friendPopup.selectedPlayerXuid ) and not friendPopup.LeagueMemberSelected then
			if CoD.isPlayerMuted( controller, friendPopup.selectedPlayerXuid ) then
				friendPopup.muteButton = buttonList:addButton( Engine.Localize( "MENU_UNMUTE_CAPS" ) )
			else
				friendPopup.muteButton = buttonList:addButton( Engine.Localize( "MENU_MUTE_CAPS" ) )
			end
			friendPopup.muteButton:setActionEventName( "friend_muteButtonAction" )
			friendPopup:registerEventHandler( "friend_muteButtonAction", CoD.FriendPopup.MuteButtonAction )
		end
		if not f16_local0 and CoD.canKickPlayer( controller, friendPopup.selectedPlayerXuid ) and not friendPopup.LeagueMemberSelected then
			friendPopup.kickPlayerButton = buttonList:addButton( Engine.Localize( "MENU_KICK_PLAYER_CAPS" ) )
			friendPopup.kickPlayerButton:setActionEventName( "player_kick" )
			friendPopup:registerEventHandler( "player_kick", CoD.FriendPopup.Button_KickPlayer )
		end
	end
	if Engine.GetXUID64( controller ) ~= selectedPlayerXuid then
		friendPopup.reportPlayerButton = buttonList:addButton( Engine.Localize( "MENU_REPORT_USER_CAPS" ) )
		friendPopup.reportPlayerButton:setActionEventName( "player_report" )
		friendPopup:registerEventHandler( "player_report", CoD.FriendPopup.Button_ReportPlayer )
	end
	if Dvar.groups_enabled:get() and Engine.GetXUID64( controller ) ~= selectedPlayerXuid then
		friendPopup.inviteToGroupButton = buttonList:addButton( Engine.Localize( "GROUPS_INVITE_USER_CAPS" ) )
		friendPopup.inviteToGroupButton:setActionEventName( "player_invite_to_group" )
		friendPopup:registerEventHandler( "player_invite_to_group", CoD.FriendPopup.Button_InviteToGroup )
		friendPopup.showGroupsButton = buttonList:addButton( Engine.Localize( "GROUPS_SHOW_GROUPS_CAPS" ) )
		friendPopup.showGroupsButton:setActionEventName( "player_show_groups" )
		friendPopup:registerEventHandler( "player_show_groups", CoD.FriendPopup.Button_ShowGroups )
	end
	friendPopup:registerEventHandler( "emblem_like", CoD.FriendPopup.LikeEmblem )
	friendPopup:addElement( buttonList )
	buttonList:processEvent( {
		name = "gain_focus"
	} )
	Engine.PlaySound( "cac_loadout_edit_sel" )
	return friendPopup
end

CoD.FriendPopup.AddOverviewInfo_Multiplayer = function ( self )
	if self.selectedPlayerXuid == nil then
		return 
	end
	local playerInfo = Engine.GetPlayerInfoByXuid( self.m_ownerController, self.selectedPlayerXuid )
	local playerName = self.selectedPlayerName
	if playerInfo.name == nil then
		playerName = playerInfo.name
	end
	self.titleElement:setText( Engine.Localize( "MENU_N_PLAYERCARD_CAPS", playerName ) )
	if not CoD.isSinglePlayer then
		local width = 320
		local sideOffset = 10
		local top = CoD.textSize.Big
		local playerIdentityDefaultAnimState = {
			leftAnchor = false,
			rightAnchor = true,
			left = -sideOffset - width,
			right = -sideOffset,
			topAnchor = true,
			bottomAnchor = true,
			top = top,
			bottom = 0
		}
		local playerIdentity, playerIdentityHeight = CoD.PlayerIdentity.New( playerIdentityDefaultAnimState, width, CoD.PlayerIdentity.Default, true )
		playerIdentity:update( self.m_ownerController, true, self.selectedPlayerXuid, playerInfo, nil )
		self:addElement( playerIdentity )
		CoD.perController[self.m_ownerController].emblemFileID = nil
		if playerInfo.emblemFileID ~= nil and playerInfo.emblemFileID ~= "0" then
			CoD.perController[self.m_ownerController].emblemFileID = playerInfo.emblemFileID
		end
		Engine.Exec( self.m_ownerController, "vote_getHistory" )
	end
end

CoD.FriendPopup.UpdateOverviewInfo_Zombie = function ( self )
	local playerInfo = Engine.GetPlayerInfoByXuid( self.m_ownerController, self.selectedPlayerXuid )
	if playerInfo.status ~= nil then
		self.status:setText( playerInfo.status )
	end
	local playerName = self.selectedPlayerName
	if playerInfo.name == nil then
		playerName = playerInfo.name
	end
	local clanTag = ""
	if playerInfo.clanTag ~= nil then
		clanTag = CoD.getClanTag( playerInfo.clanTag )
	end
	self.backingGamerTag:setText( clanTag .. playerName )
	local emblemMaterialName = Engine.TableLookup( nil, CoD.rankIconTable, 0, playerInfo.rank - 1, 3 )
	if playerInfo.daysPlayedInLast5Days == 5 then
		emblemMaterialName = Engine.TableLookup( nil, CoD.rankIconTable, 0, playerInfo.rank - 1, 4 )
	end
	local daysMaterialName = Engine.TableLookup( nil, CoD.rankIconTable, 0, playerInfo.rank - 1, playerInfo.daysPlayedInLast5Days + 5 )
	self.updateBackOff = self.updateBackOff * 3
	self:addElement( LUI.UITimer.new( self.updateBackOff, "update_friendpopup", true, self ) )
	if emblemMaterialName == self.emblemImage and daysMaterialName == self.rankImage then
		return 
	elseif emblemMaterialName ~= "" and emblemMaterialName ~= self.emblemImage then
		if self.emblemOverLay == nil then
			self.emblemOverLay = LUI.UIImage.new( {
				leftAnchor = true,
				rightAnchor = true,
				left = 0,
				right = 0,
				topAnchor = true,
				bottomAnchor = true,
				top = 0,
				bottom = 0,
				alpha = 0,
				material = RegisterMaterial( emblemMaterialName )
			} )
			self.emblemOverLay:registerAnimationState( "fade_emblem", {
				alpha = 1
			} )
			self.emblemContainer:addElement( self.emblemOverLay )
			self.emblemContainer:removeElement( self.rankIconContainer )
			self.emblemContainer:addElement( self.rankIconContainer )
			self.emblemOverLay:animateToState( "fade_emblem", 500 )
			self.emblem:animateToState( "fade_out", 500 )
		elseif emblemMaterialName ~= "" then
			self.emblemOverLay:setImage( RegisterMaterial( emblemMaterialName ) )
		end
	end
	if daysMaterialName ~= "" then
		self.rankIcon:setImage( RegisterMaterial( daysMaterialName ) )
		self.rankIcon:animateToState( "fade_in", 1000 )
	end
	self.emblemImage = emblemMaterialName
	self.rankImage = daysMaterialName
end

CoD.FriendPopup.AddOverviewInfo_Zombie = function ( self )
	if self.selectedPlayerXuid == nil then
		return 
	end
	local playerInfo = Engine.GetPlayerInfoByXuid( self.m_ownerController, self.selectedPlayerXuid )
	local widthOffset = 25
	self.overviewContainer = LUI.UIElement.new( {
		leftAnchor = false,
		rightAnchor = true,
		left = -250 - widthOffset,
		right = -widthOffset,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	self:addElement( self.overviewContainer )
	local emblemWidth = 200
	local emblemHeight = 200
	local emblemYOffset = 25
	local backingRatio = 0.25
	local backingWidth = emblemWidth + 50
	local backingHeight = backingWidth * backingRatio
	if not CoD.isSinglePlayer then
		self.emblemContainer = LUI.UIElement.new( {
			leftAnchor = false,
			rightAnchor = false,
			left = -emblemWidth / 2,
			right = emblemWidth / 2,
			topAnchor = true,
			bottomAnchor = false,
			top = emblemYOffset,
			bottom = emblemYOffset + emblemHeight
		} )
		self.overviewContainer:addElement( self.emblemContainer )
		self.emblemImage = "menu_zm_rank_1"
		self.emblem = LUI.UIImage.new( {
			leftAnchor = true,
			rightAnchor = true,
			left = 0,
			right = 0,
			topAnchor = true,
			bottomAnchor = true,
			top = 0,
			bottom = 0
		} )
		self.emblem:setImage( RegisterMaterial( self.emblemImage ) )
		self.emblem:registerAnimationState( "fade_out", {
			alpha = 0
		} )
		self.emblemContainer:addElement( self.emblem )
		self.rankImage = "hud_chalk_0"
		local backingMaterial = RegisterMaterial( "menu_zm_gamertag" )
		self.backingContainer = LUI.UIElement.new( {
			leftAnchor = false,
			rightAnchor = false,
			left = -backingWidth / 2,
			right = backingWidth / 2,
			topAnchor = true,
			bottomAnchor = false,
			top = emblemYOffset + emblemHeight,
			bottom = emblemYOffset + emblemHeight + backingHeight
		} )
		self.overviewContainer:addElement( self.backingContainer )
		self.backing = LUI.UIImage.new( {
			leftAnchor = true,
			rightAnchor = true,
			left = 0,
			right = 0,
			topAnchor = true,
			bottomAnchor = true,
			top = 0,
			bottom = 0,
			material = backingMaterial,
			alpha = 1
		} )
		self.backingContainer:addElement( self.backing )
		self.backingGamerTag = LUI.UIText.new()
		self.backingGamerTag:setLeftRight( true, true, 0, 0 )
		self.backingGamerTag:setTopBottom( false, false, -CoD.textSize.Default / 2, CoD.textSize.Default / 2 )
		self.backingGamerTag:setRGB( 1, 1, 1 )
		self.backingContainer:addElement( self.backingGamerTag )
	end
	local textSize = CoD.textSize.Default
	local playerName = self.selectedPlayerName
	if playerInfo.name == nil then
		playerName = playerInfo.name
	end
	self.titleElement:setText( Engine.Localize( "MENU_N_PLAYERCARD_CAPS", playerName ) )
	local clanTag = ""
	if playerInfo.clanTag ~= nil then
		clanTag = CoD.getClanTag( playerInfo.clanTag )
	end
	self.backingGamerTag:setText( clanTag .. playerName )
	local statusYOffset = 20
	self.status = LUI.UIText.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = -backingWidth / 2,
		right = backingWidth / 2,
		topAnchor = true,
		bottomAnchor = false,
		top = emblemYOffset + emblemHeight + backingHeight + statusYOffset,
		bottom = emblemYOffset + emblemHeight + backingHeight + statusYOffset + textSize,
		alignment = LUI.Alignment.Center
	} )
	local playerStatus = ""
	if playerInfo.status ~= nil then
		playerStatus = playerInfo.status
	end
	self.status:setText( playerStatus )
	self.overviewContainer:addElement( self.status )
	local iconWidth = emblemWidth / 4
	local iconHeight = iconWidth
	self.rankIconContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = iconWidth,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = iconHeight
	} )
	self.emblemContainer:addElement( self.rankIconContainer )
	local rankImageDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0,
		alpha = 0
	}
	self.rankIcon = LUI.UIStreamedImage.new( rankImageDefaultAnimState )
	self.rankIcon:registerAnimationState( "fade_in", {
		alpha = 1
	} )
	self.rankIconContainer:addElement( self.rankIcon )
	if CoD.FriendPopup.ShowMPRank( playerInfo ) then
		local rankImage = playerInfo.rankImage
		if rankImage == nil then
			rankImage = Engine.TableLookup( nil, CoD.rankIconTable, 0, playerInfo.rank - 1, 0 ) .. "_128"
		end
		self.rankImage = rankImage
		self.rankIcon:setImage( RegisterMaterial( rankImage ) )
		self.rankIcon:setAlpha( 1 )
		self.rankIconContainer:addElement( self.rankIcon )
		local rankHeight = textSize
		local rankWidth = rankHeight
		self.rankContainer = LUI.UIElement.new( {
			leftAnchor = false,
			rightAnchor = true,
			left = -rankWidth,
			right = 0,
			topAnchor = false,
			bottomAnchor = true,
			top = -rankHeight,
			bottom = 0
		} )
		self.rankIconContainer:addElement( self.rankContainer )
		self.rank = LUI.UIText.new( {
			leftAnchor = false,
			rightAnchor = true,
			left = -rankWidth,
			right = 0,
			topAnchor = false,
			bottomAnchor = true,
			top = -rankHeight,
			bottom = 0,
			red = 1,
			green = 1,
			blue = 1,
			alpha = 1
		} )
		self.rank:setText( "" )
		local emblemMaterialName = Engine.TableLookup( nil, CoD.rankIconTable, 0, playerInfo.rank - 1, 3 )
		if playerInfo.daysPlayedInLast5Days == 5 then
			emblemMaterialName = Engine.TableLookup( nil, CoD.rankIconTable, 0, playerInfo.rank - 1, 4 )
		end
		self.emblem:setImage( RegisterMaterial( emblemMaterialName ) )
		self.emblemImage = emblemMaterialName
		local daysMaterialName = Engine.TableLookup( nil, CoD.rankIconTable, 0, playerInfo.rank - 1, playerInfo.daysPlayedInLast5Days + 5 )
		self.rankIcon:setImage( RegisterMaterial( daysMaterialName ) )
		self.rankImage = daysMaterialName
		self.rankContainer:addElement( self.rank )
	end
	self.updateBackOff = 500
	self:addElement( LUI.UITimer.new( self.updateBackOff, "update_friendpopup", true, self ) )
	self:registerEventHandler( "update_friendpopup", CoD.FriendPopup.UpdateOverviewInfo_Zombie )
end

CoD.FriendPopup.ShowMPRank = function ( playerInfo )
	local f20_local0
	if CoD.isSinglePlayer or playerInfo == nil or playerInfo.rank == nil or tonumber( playerInfo.rank ) <= 0 or Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) ~= false then
		f20_local0 = false
	else
		f20_local0 = true
	end
	return f20_local0
end

LUI.createMenu.popup_reportuser = function ( controller )
	local popup = CoD.ReportPlayer.SetupPopupChoice( "popup_reportuser", controller )
	popup.title:setText( Engine.Localize( "MENU_REPORT_USER_CAPS" ) )
	popup.msg:setText( CoD.FriendPopup.SelectedPlayerName )
	if CoD.isZombie == false then
		popup.choiceA:setLabel( Engine.Localize( "MENU_REPORT_USER_OFFENSIVE_CAPS" ) )
		popup.choiceA.hintText = Engine.Localize( "MENU_REPORT_USER_OFFENSIVE_MSG" )
		popup.choiceB:setLabel( Engine.Localize( "MENU_REPORT_USER_OFFENSIVE_EMBLEM_CAPS" ) )
		popup.choiceB.hintText = Engine.Localize( "MENU_REPORT_USER_OFFENSIVE_EMBLEM_MSG" )
		popup.choiceC:setLabel( Engine.Localize( "MENU_REPORT_USER_CHEATER_CAPS" ) )
		popup.choiceC.hintText = Engine.Localize( "MENU_REPORT_USER_CHEATER_MSG" )
		popup.choiceD:setLabel( Engine.Localize( "MENU_REPORT_USER_BOOSTER_CAPS" ) )
		popup.choiceD.hintText = Engine.Localize( "MENU_REPORT_USER_BOOSTER_MSG" )
		popup.choiceA:setActionEventName( "report_user_offensive" )
		popup.choiceB:setActionEventName( "report_user_offensive_emblem" )
		popup.choiceC:setActionEventName( "report_user_cheater" )
		popup.choiceD:setActionEventName( "report_user_booster" )
	else
		popup.choiceA:setLabel( Engine.Localize( "MENU_REPORT_USER_OFFENSIVE_CAPS" ) )
		popup.choiceA.hintText = Engine.Localize( "MENU_REPORT_USER_OFFENSIVE_MSG" )
		popup.choiceB:setLabel( Engine.Localize( "MENU_REPORT_USER_CHEATER_CAPS" ) )
		popup.choiceB.hintText = Engine.Localize( "MENU_REPORT_USER_CHEATER_MSG" )
		popup.choiceA:setActionEventName( "report_user_offensive" )
		popup.choiceB:setActionEventName( "report_user_cheater" )
	end
	popup.choiceA:processEvent( {
		name = "gain_focus"
	} )
	popup:registerEventHandler( "report_user_offensive", CoD.ReportPlayer.ReportUserOffensive )
	popup:registerEventHandler( "report_user_offensive_emblem", CoD.ReportPlayer.ReportUserOffensiveEmblem )
	popup:registerEventHandler( "report_user_cheater", CoD.ReportPlayer.ReportUserCheater )
	popup:registerEventHandler( "report_user_booster", CoD.ReportPlayer.ReportUserBooster )
	popup:addBackButton()
	return popup
end

CoD.ReportPlayer.ReportUserOffensive = function ( popup, event )
	Engine.ReportUser( CoD.FriendPopup.SelectedPlayerXuid, "offensive", 1, 1 )
	popup:goBack( event.controller )
end

CoD.ReportPlayer.ReportUserOffensiveEmblem = function ( popup, event )
	Engine.ReportUser( CoD.FriendPopup.SelectedPlayerXuid, "offensive_emblem", 1, 1 )
	local emblemFileID = CoD.perController[event.controller].emblemFileID
	if emblemFileID ~= nil then
		Engine.RecordOffensiveEmblem( event.controller, CoD.FriendPopup.SelectedPlayerXuid, CoD.perController[event.controller].emblemFileID )
	end
	popup:goBack( event.controller )
end

CoD.ReportPlayer.ReportUserCheater = function ( popup, event )
	Engine.ReportUser( CoD.FriendPopup.SelectedPlayerXuid, "cheater", 1, 1 )
	popup:goBack( event.controller )
end

CoD.ReportPlayer.ReportUserBooster = function ( popup, event )
	Engine.ReportUser( CoD.FriendPopup.SelectedPlayerXuid, "booster", 1, 1 )
	popup:goBack( event.controller )
end

CoD.ReportPlayer.SetupPopupChoice = function ( popupName, controller )
	local popup = CoD.Popup.SetupPopup( popupName, controller, CoD.Popup.Type.STRETCHED )
	popup:setWidthHeight( nil, CoD.Popup.StretchedHeight + CoD.MPZM( 60, 0 ) )
	popup.choiceList = CoD.ButtonList.new()
	popup.choiceList:setLeftRight( true, true, 0, 0 )
	popup.choiceList:setTopBottom( false, true, CoD.MPZM( -200, -140 ), 0 )
	popup:addElement( popup.choiceList )
	for i = 1, CoD.MPZM( 4, 2 ), 1 do
		local choice = popup.choiceList:addButton( "" )
		choice:setActionEventName( "button_prompt_back" )
		choice:setFont( CoD.fonts.Default )
		popup.choiceList:addElement( choice )
		if i == 1 then
			popup.choiceA = choice
		end
		if i == 2 then
			popup.choiceB = choice
		end
		if i == 3 then
			popup.choiceC = choice
		end
		if i == 4 then
			popup.choiceD = choice
		end
	end
	popup:addSelectButton()
	return popup
end

