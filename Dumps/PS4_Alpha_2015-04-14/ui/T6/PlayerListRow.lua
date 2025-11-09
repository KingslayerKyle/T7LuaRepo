CoD.PlayerListRow = {}
CoD.PlayerListRow.Height = CoD.CoD9Button.Height
CoD.PlayerListRow.RankFadeInTime = 500
CoD.PlayerListRow.Font = "Default"
CoD.PlayerListRow.LeagueRankAreaWidth = 92
CoD.PlayerListRow.ScoreColor = {
	r = 0.43,
	g = 0.49,
	b = 0.53
}
CoD.PlayerListRow.PlayerNameDefaultColor = {
	r = 0.71,
	g = 0.76,
	b = 0.78
}
CoD.PlayerListRow.StatusRowColor = {
	r = 0.71,
	g = 0.76,
	b = 0.78
}
CoD.PlayerListRow.SetStatusText = function ( self, statusText )
	if statusText ~= nil then
		self.status:setText( statusText )
	end
end

CoD.PlayerListRow.CreateStatusRow = function ( self, statusText, addLiveStreamStatusWidget, controller )
	local newRow = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.textSize[CoD.PlayerListRow.Font]
	} )
	newRow:makeNotFocusable()
	newRow:setPriority( 0 )
	newRow.status = LUI.UIText.new()
	newRow.status:setLeftRight( true, true, 0, 0 )
	newRow.status:setTopBottom( true, true, 0, 0 )
	newRow.status:setRGB( CoD.PlayerListRow.StatusRowColor.r, CoD.PlayerListRow.StatusRowColor.g, CoD.PlayerListRow.StatusRowColor.b )
	newRow.status:setAlpha( 0.75 )
	newRow.status:setFont( CoD.fonts[CoD.PlayerListRow.Font] )
	newRow.status:setAlignment( LUI.Alignment.Left )
	newRow:addElement( newRow.status )
	if false == CoD.isZombie and addLiveStreamStatusWidget then
		local liveStreamStatusWidget = CoD.LiveStream.GetStatusWidget( controller, LUI.Alignment.Right, true, true )
		newRow:addElement( liveStreamStatusWidget )
	end
	newRow.playerList = self
	newRow.setText = CoD.PlayerListRow.SetStatusText
	if statusText ~= nil then
		newRow.status:setText( statusText )
	end
	return newRow
end

CoD.PlayerListRow.CreateSplitscreenRow = function ( text, allowJoin )
	local newRow = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.PlayerListRow.Height
	} )
	newRow:makeNotFocusable()
	newRow:setPriority( 10 )
	newRow.allowJoin = allowJoin
	newRow.textLabel = LUI.UIText.new()
	newRow.textLabel:setLeftRight( true, true, 0, 0 )
	newRow.textLabel:setTopBottom( false, false, -CoD.textSize[CoD.PlayerListRow.Font] / 2 - 3, CoD.textSize[CoD.PlayerListRow.Font] / 2 - 3 )
	newRow.textLabel:setFont( CoD.fonts[CoD.PlayerListRow.Font] )
	newRow.textLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	newRow.textLabel:setAlignment( LUI.Alignment.Left )
	newRow:addElement( newRow.textLabel )
	newRow.textLabel:setText( text )
	return newRow
end

CoD.PlayerListRow.CreateMissingTeamMemberRow = function ( self, numPlayersForTeamPlay )
	local newRow = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = -CoD.PlayerListRow.LeagueRankAreaWidth,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.PlayerListRow.Height
	} )
	newRow:makeNotFocusable()
	local backgroundAlpha = 0
	local textAlpha = 0.5
	local backgroundColor = CoD.GetTeamColor( Enum.team_t.TEAM_FREE )
	local backgroundImage = LUI.UIImage.new()
	backgroundImage:setLeftRight( true, true, 0, 0 )
	backgroundImage:setTopBottom( true, true, 0, 0 )
	backgroundImage:setRGB( backgroundColor.r, backgroundColor.g, backgroundColor.b )
	backgroundImage:setAlpha( CoD.PlayerListRow.GetRowAlpha( self ) )
	backgroundImage:setImage( RegisterMaterial( "menu_mp_lobby_bar_name" ) )
	newRow:addElement( backgroundImage )
	local textLabel = LUI.UIText.new()
	textLabel:setLeftRight( true, false, 5, 5 )
	textLabel:setTopBottom( false, false, -CoD.textSize[CoD.PlayerListRow.Font] / 2, CoD.textSize[CoD.PlayerListRow.Font] / 2 )
	textLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	textLabel:setAlpha( textAlpha )
	textLabel:setFont( CoD.fonts[CoD.PlayerListRow.Font] )
	local addTeamPlayersText = Engine.Localize( "MENU_ADD_PLAYER_FOR_TEAM_PLAY", numPlayersForTeamPlay )
	if numPlayersForTeamPlay > 1 then
		addTeamPlayersText = Engine.Localize( "MENU_ADD_PLAYERS_FOR_TEAM_PLAY", numPlayersForTeamPlay )
	end
	textLabel:setText( addTeamPlayersText )
	newRow:addElement( textLabel )
	return newRow
end

CoD.PlayerListRow.SetTextEllipses = function ( self, ellipsesCount )
	local ellipses = ""
	for index = 1, ellipsesCount, 1 do
		local f5_local2 = index
		ellipses = ellipses .. "."
	end
	self:setText( self.text .. ellipses )
end

CoD.PlayerListRow.UpdateEllipses = function ( self )
	self.ellipsesCount = self.ellipsesCount + self.ellipsesIncrement
	local ellipsesLimit = 4
	if Engine.LobbyConnectedToDedicatedHost() then
		ellipsesLimit = 5
	end
	if ellipsesLimit <= self.ellipsesCount then
		self.ellipsesIncrement = -1
	elseif self.ellipsesCount <= 0 then
		self.ellipsesIncrement = 1
	end
	CoD.PlayerListRow.SetTextEllipses( self, self.ellipsesCount )
end

CoD.PlayerListRow.CreateSearchingRow = function ( rowIndex )
	local rowRightOffset = 0
	local isLeague = Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH )
	if isLeague then
		rowRightOffset = -CoD.PlayerListRow.LeagueRankAreaWidth
	end
	local newRow = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = rowRightOffset,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.PlayerListRow.Height
	} )
	newRow:makeNotFocusable()
	local backgroundAlpha = 0
	local textAlpha = 0.5
	local alphaAdditive = 0
	if rowIndex % 2 == 0 then
		alphaAdditive = 0.05
	end
	local backgroundColor = CoD.GetTeamColor( Enum.team_t.TEAM_FREE )
	newRow.backgroundImage = LUI.UIImage.new()
	newRow.backgroundImage:setLeftRight( true, true, 0, 0 )
	newRow.backgroundImage:setTopBottom( true, true, 0, 0 )
	newRow.backgroundImage:setRGB( backgroundColor.r, backgroundColor.g, backgroundColor.b )
	newRow.backgroundImage:setAlpha( backgroundAlpha + alphaAdditive )
	newRow.backgroundImage:setImage( RegisterMaterial( "menu_mp_lobby_bar_name" ) )
	newRow:addElement( newRow.backgroundImage )
	newRow.textLabel = LUI.UIText.new()
	newRow.textLabel:setLeftRight( true, false, 5, 5 )
	newRow.textLabel:setTopBottom( false, false, -CoD.textSize[CoD.PlayerListRow.Font] / 2, CoD.textSize[CoD.PlayerListRow.Font] / 2 )
	newRow.textLabel:setFont( CoD.fonts[CoD.PlayerListRow.Font] )
	newRow.textLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	newRow.textLabel:setAlpha( textAlpha )
	newRow.textLabel.text = Engine.Localize( "MENU_SEARCHING_FOR_PLAYER" )
	newRow.textLabel:setText( newRow.textLabel.text )
	newRow:addElement( newRow.textLabel )
	local startEllipses = math.random( 0, 3 )
	newRow.textLabel.ellipsesCount = startEllipses
	newRow.textLabel.ellipsesIncrement = 1
	newRow.textLabel:registerEventHandler( "update_ellipses", CoD.PlayerListRow.UpdateEllipses )
	local ellipsesTimeOffset = math.random( 0, 100 ) - 50
	newRow.ellipsesTimer = LUI.UITimer.new( 250 + ellipsesTimeOffset, "update_ellipses", false, newRow )
	newRow:addElement( newRow.ellipsesTimer )
	local spinnerTimeOffset = rowIndex / 10
	local spinnerRight = -5
	if isLeague then
		spinnerRight = CoD.PlayerListRow.Height
	end
	newRow.spinner = LUI.UIImage.new()
	newRow.spinner:setLeftRight( false, true, -CoD.PlayerListRow.Height + spinnerRight, spinnerRight )
	newRow.spinner:setTopBottom( true, true, 0, 0 )
	newRow.spinner:setImage( RegisterMaterial( "lui_loader_32" ) )
	newRow.spinner:setShaderVector( 0, spinnerTimeOffset, 0, 0, 0 )
	newRow:addElement( newRow.spinner )
	return newRow
end

CoD.PlayerListRow.GainFocus = function ( self, event )
	local retVal = LUI.UIButton.gainFocus( self, event )
	self:dispatchEventToParent( {
		name = "playerlist_row_selected",
		playerName = self.name,
		playerXuid = self.playerXuid,
		leagueTeamID = self.leagueTeamID,
		leagueTeamMemberCount = self.leagueTeamMemberCount,
		listId = self.playerList.id,
		listIndex = self.rowIndex,
		controller = event.controller
	} )
	return retVal
end

CoD.PlayerListRow.LoseFocus = function ( self, event )
	if self:isInFocus() then
		self:dispatchEventToParent( {
			name = "playerlist_row_deselected",
			playerName = self.name,
			playerXuid = self.playerXuid,
			listId = self.playerList.id,
			listIndex = self.rowIndex,
			controller = event.controller
		} )
	end
	LUI.UIButton.loseFocus( self, event )
end

CoD.PlayerListRow.FetchingDone = function ( self, event )
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false and not Engine.SessionMode_IsSystemlinkGame() then
		if self.rankNumber ~= nil then
			self.rankNumber:beginAnimation( "fade_in", CoD.PlayerListRow.RankFadeInTime, true )
			self.rankNumber:setAlpha( 1 )
		end
		if self.rankIcon ~= nil then
			self.rankIcon:beginAnimation( "fade_in", CoD.PlayerListRow.RankFadeInTime, true )
			self.rankIcon:setAlpha( 1 )
		end
	end
end

CoD.PlayerListRow.TeamCycle = function ( self, event )
	if event.xuid ~= self.playerXuid then
		return false
	else
		CoD.PlayerListRow.Button_AnimateToTeam( self, event, event.cycleTeam, true )
		return false
	end
end

CoD.PlayerListRow.GetRowAlpha = function ( self )
	local alphaAdditive = 0
	if self.verticalList:getNumChildren() % 2 == 0 then
		alphaAdditive = 0.05
	end
	return 0.2 + alphaAdditive
end

CoD.PlayerListRow.AddRightColumnIcon = function ( self, member, material )
	local icon = LUI.UIImage.new()
	local hostStarSizeOffset = 1
	local hostStarSize = CoD.textSize[CoD.PlayerListRow.Font] - hostStarSizeOffset * 2
	if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
		local starRight = -4
		icon:setLeftRight( false, true, starRight - hostStarSize, starRight )
		icon:setAlpha( 0.6 )
	else
		local starRight = 1
		icon:setLeftRight( false, true, starRight, starRight + hostStarSize )
	end
	icon:setTopBottom( false, false, -hostStarSize / 2, hostStarSize / 2 )
	icon:setImage( RegisterMaterial( material ) )
	self:addElement( icon )
	return icon
end

CoD.PlayerListRow.CreateRow = function ( self, member, makeFocusable, showTeams, showIndividualLeagueRank, showMissingDLC )
	local rowText = ""
	if member.tagprefix ~= nil then
		rowText = rowText .. member.tagprefix
	end
	if member.clantag ~= nil then
		rowText = rowText .. CoD.getClanTag( member.clantag )
	end
	if member.gamertag ~= nil then
		rowText = rowText .. member.gamertag
	end
	local rowRightOffset = 0
	if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
		rowRightOffset = -CoD.PlayerListRow.LeagueRankAreaWidth
	end
	local newRow = LUI.UIButton.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = rowRightOffset,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.PlayerListRow.Height
	} )
	if makeFocusable == false then
		newRow:makeNotFocusable()
	end
	newRow:registerEventHandler( "gain_focus", CoD.PlayerListRow.GainFocus )
	newRow:registerEventHandler( "lose_focus", CoD.PlayerListRow.LoseFocus )
	newRow:registerEventHandler( "fetching_done", CoD.PlayerListRow.FetchingDone )
	newRow:registerEventHandler( "party_member_team_cycle", CoD.PlayerListRow.TeamCycle )
	newRow:setActionEventName( "open_playeroptions_popup" )
	newRow.playerList = self
	newRow.playerClientNum = member.clientNum
	newRow.playerXuid = member.xuid
	newRow.gamerTag = member.clean_gamertag
	if member.leagueTeamID then
		newRow.leagueTeamID = member.leagueTeamID
	else
		newRow.leagueTeamID = "0"
	end
	newRow.leagueTeamMemberCount = member.leagueTeamMemberCount
	local backgroundAlpha = CoD.PlayerListRow.GetRowAlpha( self )
	local textAlpha = 1
	local alphaAdditive = 0
	newRow.backgroundAlpha = backgroundAlpha
	local faction = CoD.GetFaction()
	local backgroundColor = CoD.GetTeamColor( member.team, faction )
	newRow.backgroundColor = LUI.UIImage.new()
	newRow.backgroundColor:setLeftRight( true, true, 0, 0 )
	newRow.backgroundColor:setTopBottom( true, true, 0, 0 )
	if not CoD.isMultiplayer then
		newRow.backgroundColor:setAlpha( backgroundAlpha )
		newRow.backgroundColor:setImage( RegisterMaterial( "menu_mp_lobby_bar_name" ) )
	elseif self.rowCount and self.rowCount % 2 == 0 then
		newRow.backgroundColor:setAlpha( 0.6 )
		newRow.backgroundColor:setImage( RegisterMaterial( "t7_menu_mp_lobby_playerbacking_1" ) )
	else
		newRow.backgroundColor:setAlpha( 0.5 )
		newRow.backgroundColor:setImage( RegisterMaterial( "t7_menu_mp_lobby_playerbacking_2" ) )
	end
	newRow:addElement( newRow.backgroundColor )
	local backgroundHighlight = LUI.UIImage.new()
	backgroundHighlight:setLeftRight( true, true, 1, -1 )
	backgroundHighlight:setTopBottom( true, false, 1, 17 )
	backgroundHighlight:setImage( RegisterMaterial( CoD.MPZM( "menu_mp_cac_grad_stretch", "menu_zm_cac_grad_stretch" ) ) )
	backgroundHighlight:setAlpha( 0.07 )
	if not CoD.isMultiplayer then
		newRow:addElement( backgroundHighlight )
	end
	local quadrantIconWidth = 30
	local voipWidth = 32
	local controller = 0
	if member.isLocal == 1 and not CoD.isPC and not CoD.isWIIU then
		controller = member.controller
		if controller == nil then
			controller = 0
		end
		controller = controller + 1
		newRow.controllerQuadrantIcon = LUI.UIImage.new()
		newRow.controllerQuadrantIcon:setImage( RegisterMaterial( "controller_icon" .. controller ) )
		newRow.controllerQuadrantIcon:setLeftRight( true, false, -quadrantIconWidth - voipWidth, -voipWidth )
		newRow.controllerQuadrantIcon:setTopBottom( false, true, -quadrantIconWidth, 0 )
		newRow:addElement( newRow.controllerQuadrantIcon )
	end
	local currentWidth = 0
	if self.showVoipIcons == true then
		newRow.voipIcon = CoD.VoipImage.new( nil, member.clientNum )
		newRow.voipIcon:setLeftRight( true, false, -voipWidth, 0 )
		newRow.voipIcon:setTopBottom( true, true, 0, 0 )
		newRow:addElement( newRow.voipIcon )
	end
	local showTruePlayerInfo = Engine.PartyShowTruePlayerInfo( member.clientNum )
	local rankWidth = 60
	local rankDefaultAlpha = 0
	local f14_local0 = Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) == true
	local leagueStats = nil
	if f14_local0 == true then
		leagueStats = Engine.GetLeagueStats( member.controller )
	end
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false and not Engine.SessionMode_IsSystemlinkGame() and Engine.IsDemonwareFetchingDone( controller ) and (not (not leagueStats or leagueStats.valid ~= true) or leagueStats == nil) then
		rankDefaultAlpha = 1
	end
	if CoD.isZombie == true then
		local readyupMaterialName = ""
		if member.isReady ~= nil and 0 < Engine.DvarFloat( "party_readyPercentRequired" ) and CoD.PlaylistCategoryFilter == "playermatch" then
			if member.isReady == true then
				readyupMaterialName = "menu_lobby_ready"
			else
				readyupMaterialName = "menu_lobby_not_ready"
			end
			local readyupMaterial = RegisterMaterial( readyupMaterialName )
			newRow.isReady = LUI.UIImage.new()
			newRow.isReady:setLeftRight( true, false, currentWidth + 5, currentWidth + rankWidth * 0.45 )
			newRow.isReady:setTopBottom( false, false, -CoD.textSize[CoD.PlayerListRow.Font] / 2, CoD.textSize[CoD.PlayerListRow.Font] / 2 )
			newRow.isReady:setImage( readyupMaterial )
			newRow:addElement( newRow.isReady )
		else
			rankWidth = 30
		end
	elseif member.prestige ~= tonumber( CoD.MAX_PRESTIGE ) then
		newRow.rankNumber = LUI.UIText.new()
		newRow.rankNumber:setLeftRight( true, false, currentWidth + 5, currentWidth + rankWidth )
		newRow.rankNumber:setTopBottom( false, false, -CoD.textSize[CoD.PlayerListRow.Font] / 2, CoD.textSize[CoD.PlayerListRow.Font] / 2 )
		newRow.rankNumber:setFont( CoD.fonts[CoD.PlayerListRow.Font] )
		newRow.rankNumber:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		newRow.rankNumber:setAlpha( rankDefaultAlpha )
		newRow:addElement( newRow.rankNumber )
		if member.rank ~= nil and showTruePlayerInfo == true then
			newRow.rankNumber:setText( member.rank )
		end
	end
	currentWidth = currentWidth + rankWidth
	if member.rankIcon ~= nil and showTruePlayerInfo == true then
		if f14_local0 == true then
			if member.rank ~= 0 and member.rankIcon ~= nil and showIndividualLeagueRank == true then
				newRow.rankIcon = LUI.UIImage.new()
				newRow.rankIcon:setLeftRight( false, true, 0, CoD.PlayerListRow.Height )
				newRow.rankIcon:setTopBottom( true, true, 0, 0 )
				newRow.rankIcon:setAlpha( rankDefaultAlpha )
				newRow.rankIcon:setImage( member.rankIcon )
				newRow:addElement( newRow.rankIcon )
			elseif newRow.rankIcon ~= nil then
				newRow.rankIcon:close()
				newRow.rankIcon = nil
			end
		else
			newRow.rankIcon = LUI.UIImage.new()
			newRow.rankIcon:setLeftRight( true, false, currentWidth - CoD.PlayerListRow.Height - 2, currentWidth - 2 )
			newRow.rankIcon:setTopBottom( true, true, 0, 0 )
			newRow.rankIcon:setAlpha( rankDefaultAlpha )
			newRow.rankIcon:setImage( member.rankIcon )
			newRow:addElement( newRow.rankIcon )
		end
	end
	local playerNameWidth = 100
	local playerNameLeft = currentWidth + 5
	if f14_local0 == true then
		playerNameLeft = 0
	end
	newRow.playerName = LUI.UIText.new()
	newRow.playerName:setLeftRight( true, false, playerNameLeft + 5, playerNameLeft + playerNameWidth )
	newRow.playerName:setTopBottom( false, false, -CoD.textSize[CoD.PlayerListRow.Font] / 2, CoD.textSize[CoD.PlayerListRow.Font] / 2 )
	newRow.playerName:setFont( CoD.fonts[CoD.PlayerListRow.Font] )
	newRow.playerName:setRGB( CoD.PlayerListRow.PlayerNameDefaultColor.r, CoD.PlayerListRow.PlayerNameDefaultColor.g, CoD.PlayerListRow.PlayerNameDefaultColor.b )
	newRow.playerName:setAlpha( textAlpha )
	newRow:addElement( newRow.playerName )
	if member.isLocal == 1 then
		newRow.playerName:setRGB( CoD.playerYellow.r, CoD.playerYellow.g, CoD.playerYellow.b )
	elseif member.isInParty == true then
		newRow.playerName:setRGB( CoD.playerBlue.r, CoD.playerBlue.g, CoD.playerBlue.b )
	end
	if showTruePlayerInfo == false then
		newRow.playerName:setText( Engine.Localize( "MP_MATCHEDPLAYER" ) )
		newRow.name = rowText
	elseif rowText ~= nil then
		newRow.playerName:setText( rowText )
		newRow.name = rowText
	end
	newRow.border = CoD.BorderT6.new( 1, CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	newRow.border:hide()
	newRow.border:registerEventHandler( "button_up", newRow.border.hide )
	newRow.border:registerEventHandler( "button_over", newRow.border.show )
	newRow:addElement( newRow.border )
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false then
		local aloneInPrivateParty = true
		if not Engine.AloneInPrivatePartyIgnoreSplitscreen( false ) then
			aloneInPrivateParty = false
		end
		if showTruePlayerInfo ~= false then
			local ishost = false
			local missingMapPacks = false
			if member.xuid and CoD.isXuidPrivatePartyHost( member.xuid ) then
				ishost = true
			end
			if showMissingDLC == true and member.missingMapPacks ~= nil and member.missingMapPacks ~= 0 then
				missingMapPacks = true
			end
			if aloneInPrivateParty == false and ishost then
				CoD.PlayerListRow.AddRightColumnIcon( newRow, member, CoD.MPZM( "ui_host", "ui_host_zm" ) )
			elseif missingMapPacks then
				CoD.PlayerListRow.AddRightColumnIcon( newRow, member, "cac_restricted" )
			end
		end
	end
	CoD.PlayerListRow.Button_AnimateToTeam( newRow, member, nil, showTeams )
	return newRow
end

CoD.PlayerListRow.Button_CycleTeamFade = function ( self, event )
	self:animateToState( "fade", Engine.DvarFloat( "party_teamSwitchDelay" ) * 1000 * 0.33 )
	self.playerName:completeAnimation()
	self.playerName:beginAnimation( "restore", 200 )
	self.playerName:setAlpha( 1 )
end

CoD.PlayerListRow.Button_AnimateToTeam = function ( self, member, cycleTeam, showTeams )
	local textAlpha = 1
	if member.background == nil then
		textAlpha = 0.5
	end
	local backgroundTeam = cycleTeam
	if backgroundTeam == nil then
		backgroundTeam = member.team
	end
	if not showTeams and backgroundTeam ~= Enum.team_t.TEAM_SPECTATOR then
		backgroundTeam = Enum.team_t.TEAM_FREE
	end
	local faction = CoD.GetFaction()
	local backgroundColor = CoD.GetTeamColor( backgroundTeam, faction )
	self.backgroundColor:setRGB( backgroundColor.r, backgroundColor.g, backgroundColor.b )
	if self.score ~= nil then
		self.score:close()
		self.score = nil
	end
	if self.cycleButtonPrompt ~= nil then
		self.cycleButtonPrompt:close()
		self.cycleButtonPrompt = nil
	end
	if cycleTeam ~= nil then
		local factionName = CoD.GetTeamName( cycleTeam )
		local factionFullName = "MPUI_" .. factionName
		if CoD.isZombie == true then
			factionFullName = "ZMUI_" .. factionName .. "_SHORT_CAPS"
		end
		local text = Engine.Localize( factionFullName )
		if cycleTeam == Enum.team_t.TEAM_SPECTATOR or cycleTeam == Enum.team_t.TEAM_FREE then
			text = factionName
		end
		self.cycleButtonPrompt = CoD.DualButtonPrompt.new( "shoulderl", text, "shoulderr", nil, nil, nil, nil, LUI.Alignment.Center, 130 )
		self.cycleButtonPrompt:registerAnimationState( "static", {
			alpha = 1
		} )
		self.cycleButtonPrompt:registerAnimationState( "fade", {
			alpha = 0
		} )
		self.cycleButtonPrompt.playerName = self.playerName
		self.cycleButtonPrompt.playerName:setAlpha( 0.2 )
		self.cycleButtonPrompt:animateToState( "static", Engine.DvarFloat( "party_teamSwitchDelay" ) * 1000 * 0.33 )
		self.cycleButtonPrompt:registerEventHandler( "transition_complete_static", CoD.PlayerListRow.Button_CycleTeamFade )
		self:addElement( self.cycleButtonPrompt )
	else
		local showTruePlayerInfo = Engine.PartyShowTruePlayerInfo( member.clientNum )
		local scoreText = member.score
		local scoreRight = -8
		if Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) == false and Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) == false and Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false and showTruePlayerInfo ~= false and scoreText ~= nil and scoreText ~= "" then
			local scoreWidth = 50
			self.score = LUI.UIText.new()
			self.score:setLeftRight( false, true, scoreRight - scoreWidth, scoreRight )
			self.score:setTopBottom( false, false, -CoD.textSize[CoD.PlayerListRow.Font] / 2, CoD.textSize[CoD.PlayerListRow.Font] / 2 )
			self.score:setFont( CoD.fonts[CoD.PlayerListRow.Font] )
			self.score:setRGB( CoD.PlayerListRow.ScoreColor.r, CoD.PlayerListRow.ScoreColor.g, CoD.PlayerListRow.ScoreColor.b )
			self.score:setAlpha( textAlpha )
			self:addElement( self.score )
			self.score:setText( scoreText )
		end
	end
end

