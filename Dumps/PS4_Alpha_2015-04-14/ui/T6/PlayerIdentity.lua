CoD.PlayerIdentity = {}
CoD.PlayerIdentity.Default = 1
CoD.PlayerIdentity.League = 2
CoD.PlayerIdentity.PrestigeLabelFontName = "Default"
CoD.PlayerIdentity.RankFontName = "Default"
CoD.PlayerIdentity.LeagueFontName = "ExtraSmall"
CoD.PlayerIdentity.JoinableFontName = "Default"
CoD.PlayerIdentity.ShowMPRank = function ( playerInfo )
	local f1_local0
	if playerInfo == nil or playerInfo.rank == nil or tonumber( playerInfo.rank ) <= 0 then
		f1_local0 = false
	else
		f1_local0 = true
	end
	return f1_local0
end

CoD.PlayerIdentity.ShowLeagueInfo = function ( leagueInfo )
	local f2_local0
	if leagueInfo == nil or leagueInfo.teamID == nil or leagueInfo.teamID == "0" or leagueInfo.teamID == 0 or Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) ~= true then
		f2_local0 = false
	else
		f2_local0 = true
	end
	return f2_local0
end

CoD.PlayerIdentity.New = function ( defaultAnimationState, width, displayMode, showJoinableContainer )
	local playerIdentity = LUI.UIElement.new( defaultAnimationState )
	playerIdentity.width = width
	playerIdentity.displayMode = displayMode
	playerIdentity.update = CoD.PlayerIdentity.Update
	playerIdentity:registerEventHandler( "league_team_all_info_fetched", CoD.PlayerIdentity.LeagueLbDataFetched )
	playerIdentity:registerEventHandler( "league_lb_data_fetched", CoD.PlayerIdentity.LeagueLbDataFetched )
	local top = 0
	local backgroundInset = 4
	local emblemContainerWidth = width * 0.66
	local emblemContainerLeft = 0
	local emblemContainerHeight = emblemContainerWidth / 4 * 5 - 1
	local emblemContainer = LUI.UIElement.new()
	emblemContainer:setLeftRight( true, false, emblemContainerLeft, emblemContainerLeft + emblemContainerWidth )
	emblemContainer:setTopBottom( true, false, top, top + emblemContainerHeight )
	playerIdentity:addElement( emblemContainer )
	local emblemContainerBackground = LUI.UIImage.new()
	emblemContainerBackground:setLeftRight( true, true, 1, -1 )
	emblemContainerBackground:setTopBottom( true, true, 1, -1 )
	emblemContainerBackground:setRGB( 0, 0, 0 )
	emblemContainerBackground:setAlpha( 0.6 )
	emblemContainer:addElement( emblemContainerBackground )
	local emblemContainerBackgroundGrad = LUI.UIImage.new()
	emblemContainerBackgroundGrad:setLeftRight( true, true, backgroundInset, -backgroundInset )
	emblemContainerBackgroundGrad:setTopBottom( true, false, backgroundInset, 80 )
	emblemContainerBackgroundGrad:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
	emblemContainerBackgroundGrad:setAlpha( 0.1 )
	emblemContainer:addElement( emblemContainerBackgroundGrad )
	local emblemInset = 2
	local emblemSize = emblemContainerWidth - emblemInset * 2
	playerIdentity.emblem = LUI.UIImage.new()
	playerIdentity.emblem:setLeftRight( false, false, -(emblemSize / 2), emblemSize / 2 )
	playerIdentity.emblem:setTopBottom( true, false, emblemInset, emblemInset + emblemSize )
	playerIdentity.emblem:hide()
	emblemContainer:addElement( playerIdentity.emblem )
	local backingTop = emblemInset + emblemSize
	local backingWidth = emblemSize
	local backingHeight = backingWidth / 4
	local miniIdentityDefaultAnimState = {
		leftAnchor = false,
		rightAnchor = false,
		left = -backingWidth / 2,
		right = backingWidth / 2,
		topAnchor = true,
		bottomAnchor = false,
		top = backingTop,
		bottom = backingTop + backingHeight
	}
	playerIdentity.backingContainer = LUI.UIElement.new( miniIdentityDefaultAnimState )
	playerIdentity.backingContainer:setFont( CoD.fonts.Default )
	playerIdentity.backingContainer:hide()
	emblemContainer:addElement( playerIdentity.backingContainer )
	emblemContainer.border = CoD.BorderT6.new( 1, 1, 1, 1, 0.1 )
	emblemContainer:addElement( emblemContainer.border )
	local rankContainerLeft = emblemContainerLeft + emblemContainerWidth
	local rankContainerWidth = width - emblemContainerWidth
	local rankContainerHeight = emblemContainerHeight / 2
	local prestigeLabelFont = CoD.fonts[CoD.PlayerIdentity.PrestigeLabelFontName]
	local prestigeLabelHeight = CoD.textSize[CoD.PlayerIdentity.PrestigeLabelFontName]
	local rankFont = CoD.fonts[CoD.PlayerIdentity.RankFontName]
	local rankHeight = CoD.textSize[CoD.PlayerIdentity.RankFontName]
	local leagueFont = CoD.fonts[CoD.PlayerIdentity.LeagueFontName]
	local leagueFontHeight = CoD.textSize[CoD.PlayerIdentity.LeagueFontName]
	local rankContainer = LUI.UIElement.new()
	rankContainer:setLeftRight( true, false, rankContainerLeft, rankContainerLeft + rankContainerWidth )
	rankContainer:setTopBottom( true, false, top, top + rankContainerHeight )
	playerIdentity:addElement( rankContainer )
	local rankContainerBackground = LUI.UIImage.new()
	rankContainerBackground:setLeftRight( true, true, 1, -1 )
	rankContainerBackground:setTopBottom( true, true, 1, -1 )
	rankContainerBackground:setRGB( 0, 0, 0 )
	rankContainerBackground:setAlpha( 0.6 )
	rankContainer:addElement( rankContainerBackground )
	local rankContainerBackgroundGrad = LUI.UIImage.new()
	rankContainerBackgroundGrad:setLeftRight( true, true, backgroundInset - 2, -backgroundInset )
	rankContainerBackgroundGrad:setTopBottom( true, false, backgroundInset, 80 )
	rankContainerBackgroundGrad:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
	rankContainerBackgroundGrad:setAlpha( 0.1 )
	rankContainer:addElement( rankContainerBackgroundGrad )
	if displayMode == CoD.PlayerIdentity.Default then
		local rankIconInset = 5
		local rankIconSize = rankContainerHeight - rankHeight * 2 - 10
		playerIdentity.rankIconContainer = LUI.UIElement.new()
		playerIdentity.rankIconContainer:setLeftRight( false, false, -rankIconSize / 2, rankIconSize / 2 )
		playerIdentity.rankIconContainer:setTopBottom( true, false, rankIconInset, rankIconInset + rankIconSize )
		rankContainer:addElement( playerIdentity.rankIconContainer )
		local rankOffset = rankHeight / 2
		playerIdentity.rank = LUI.UIText.new()
		playerIdentity.rank:setLeftRight( true, true, 0, 0 )
		playerIdentity.rank:setTopBottom( false, true, -5 - rankOffset - rankHeight, -5 - rankOffset )
		playerIdentity.rank:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		playerIdentity.rank:setFont( rankFont )
		playerIdentity.rank:setAlignment( LUI.Alignment.Center )
		rankContainer:addElement( playerIdentity.rank )
		playerIdentity.prestigeLabel = LUI.UIText.new()
		playerIdentity.prestigeLabel:setLeftRight( true, true, 0, 0 )
		playerIdentity.prestigeLabel:setTopBottom( false, true, -5 - rankHeight, -5 )
		playerIdentity.prestigeLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		playerIdentity.prestigeLabel:setFont( rankFont )
		playerIdentity.prestigeLabel:setAlignment( LUI.Alignment.Center )
		rankContainer:addElement( playerIdentity.prestigeLabel )
	elseif displayMode == CoD.PlayerIdentity.League then
		local leagueTop = 0
		playerIdentity.currentRankLabel = LUI.UIText.new()
		playerIdentity.currentRankLabel:setLeftRight( true, true, 0, 0 )
		playerIdentity.currentRankLabel:setTopBottom( true, false, leagueTop, leagueTop + leagueFontHeight )
		playerIdentity.currentRankLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		playerIdentity.currentRankLabel:setFont( rankFont )
		playerIdentity.currentRankLabel:setAlignment( LUI.Alignment.Center )
		rankContainer:addElement( playerIdentity.currentRankLabel )
		leagueTop = leagueTop + leagueFontHeight
		local divisionIconSize = rankContainerHeight - leagueFontHeight * 3
		playerIdentity.divisionIconContainer = LUI.UIElement.new()
		playerIdentity.divisionIconContainer:setLeftRight( false, false, -divisionIconSize / 2, divisionIconSize / 2 )
		playerIdentity.divisionIconContainer:setTopBottom( true, false, leagueTop, leagueTop + divisionIconSize )
		rankContainer:addElement( playerIdentity.divisionIconContainer )
		leagueTop = leagueTop + divisionIconSize - 2
		playerIdentity.leagueDivisionLabel = LUI.UIText.new()
		playerIdentity.leagueDivisionLabel:setLeftRight( true, true, 0, 0 )
		playerIdentity.leagueDivisionLabel:setTopBottom( true, false, leagueTop, leagueTop + leagueFontHeight )
		playerIdentity.leagueDivisionLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		playerIdentity.leagueDivisionLabel:setFont( rankFont )
		playerIdentity.leagueDivisionLabel:setAlignment( LUI.Alignment.Center )
		rankContainer:addElement( playerIdentity.leagueDivisionLabel )
		leagueTop = leagueTop + leagueFontHeight
		playerIdentity.leagueRankLabel = LUI.UIText.new()
		playerIdentity.leagueRankLabel:setLeftRight( true, true, 0, 0 )
		playerIdentity.leagueRankLabel:setTopBottom( true, false, leagueTop, leagueTop + leagueFontHeight )
		playerIdentity.leagueRankLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		playerIdentity.leagueRankLabel:setFont( rankFont )
		playerIdentity.leagueRankLabel:setAlignment( LUI.Alignment.Center )
		rankContainer:addElement( playerIdentity.leagueRankLabel )
	end
	top = top + rankContainerHeight - 2
	local leagueRankContainer = LUI.UIElement.new()
	leagueRankContainer:setLeftRight( true, false, rankContainerLeft, rankContainerLeft + rankContainerWidth )
	leagueRankContainer:setTopBottom( true, false, top, top + rankContainerHeight + 2 )
	playerIdentity:addElement( leagueRankContainer )
	local leagueRankContainerBackground = LUI.UIImage.new()
	leagueRankContainerBackground:setLeftRight( true, true, 1, -1 )
	leagueRankContainerBackground:setTopBottom( true, true, 1, -1 )
	leagueRankContainerBackground:setRGB( 0, 0, 0 )
	leagueRankContainerBackground:setAlpha( 0.6 )
	leagueRankContainer:addElement( leagueRankContainerBackground )
	local leagueRankContainerBackgroundGrad = LUI.UIImage.new()
	leagueRankContainerBackgroundGrad:setLeftRight( true, true, backgroundInset - 2, -backgroundInset )
	leagueRankContainerBackgroundGrad:setTopBottom( true, false, backgroundInset, 80 )
	leagueRankContainerBackgroundGrad:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
	leagueRankContainerBackgroundGrad:setAlpha( 0.1 )
	leagueRankContainer:addElement( leagueRankContainerBackgroundGrad )
	if displayMode == CoD.PlayerIdentity.Default then
		local leagueTop = 5
		local divisionIconSize = rankContainerHeight - rankHeight * 2 - 10
		playerIdentity.bestDivisionIconContainer = LUI.UIElement.new()
		playerIdentity.bestDivisionIconContainer:setLeftRight( false, false, -divisionIconSize / 2, divisionIconSize / 2 )
		playerIdentity.bestDivisionIconContainer:setTopBottom( true, false, leagueTop, leagueTop + divisionIconSize )
		leagueRankContainer:addElement( playerIdentity.bestDivisionIconContainer )
		leagueTop = leagueTop + divisionIconSize - 2
		playerIdentity.bestLeagueRankLabel = LUI.UIText.new()
		playerIdentity.bestLeagueRankLabel:setLeftRight( true, true, 0, 0 )
		playerIdentity.bestLeagueRankLabel:setTopBottom( true, false, leagueTop, leagueTop + rankHeight )
		playerIdentity.bestLeagueRankLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		playerIdentity.bestLeagueRankLabel:setFont( rankFont )
		playerIdentity.bestLeagueRankLabel:setAlignment( LUI.Alignment.Center )
		leagueRankContainer:addElement( playerIdentity.bestLeagueRankLabel )
		leagueTop = leagueTop + rankHeight
		playerIdentity.leagueBestLabel = LUI.UIText.new()
		playerIdentity.leagueBestLabel:setLeftRight( true, true, 0, 0 )
		playerIdentity.leagueBestLabel:setTopBottom( true, false, leagueTop, leagueTop + rankHeight )
		playerIdentity.leagueBestLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		playerIdentity.leagueBestLabel:setFont( rankFont )
		playerIdentity.leagueBestLabel:setAlignment( LUI.Alignment.Center )
		leagueRankContainer:addElement( playerIdentity.leagueBestLabel )
	elseif displayMode == CoD.PlayerIdentity.League then
		local leagueTop = leagueFontHeight / 2
		local leagueIconSize = rankContainerHeight - leagueFontHeight * 2.5
		playerIdentity.currentLeagueIconContainer = LUI.UIElement.new()
		playerIdentity.currentLeagueIconContainer:setLeftRight( false, false, -leagueIconSize / 2, leagueIconSize / 2 )
		playerIdentity.currentLeagueIconContainer:setTopBottom( true, false, leagueTop, leagueTop + leagueIconSize )
		leagueRankContainer:addElement( playerIdentity.currentLeagueIconContainer )
		leagueTop = leagueTop + leagueIconSize - 2
		playerIdentity.currentLeagueNameLabel = LUI.UIText.new()
		playerIdentity.currentLeagueNameLabel:setLeftRight( true, true, 0, 0 )
		playerIdentity.currentLeagueNameLabel:setTopBottom( true, false, leagueTop, leagueTop + leagueFontHeight )
		playerIdentity.currentLeagueNameLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
		playerIdentity.currentLeagueNameLabel:setFont( rankFont )
		playerIdentity.currentLeagueNameLabel:setAlignment( LUI.Alignment.Center )
		leagueRankContainer:addElement( playerIdentity.currentLeagueNameLabel )
	end
	top = top + rankContainerHeight
	if showJoinableContainer == true then
		top = top + 20
		local joinableFont = CoD.fonts[CoD.PlayerIdentity.JoinableFontName]
		local joinableFontHeight = CoD.textSize[CoD.PlayerIdentity.JoinableFontName]
		local joinableTextSpacing = 2
		local joinableWidth = width
		local joinableHeight = joinableFontHeight * 2 + joinableTextSpacing
		playerIdentity.joinableContainer = LUI.UIElement.new()
		playerIdentity.joinableContainer:setLeftRight( false, false, -joinableWidth / 2, joinableWidth / 2 )
		playerIdentity.joinableContainer:setTopBottom( true, false, top, top + joinableHeight )
		playerIdentity:addElement( playerIdentity.joinableContainer )
		local joinableContainerBackground = LUI.UIImage.new()
		joinableContainerBackground:setLeftRight( true, true, 1, -1 )
		joinableContainerBackground:setTopBottom( true, true, 1, -1 )
		joinableContainerBackground:setRGB( 0, 0, 0 )
		joinableContainerBackground:setAlpha( 0.6 )
		playerIdentity.joinableContainer:addElement( joinableContainerBackground )
		local joinableContainerBackgroundGrad = LUI.UIImage.new()
		joinableContainerBackgroundGrad:setLeftRight( true, true, backgroundInset, -backgroundInset )
		joinableContainerBackgroundGrad:setTopBottom( true, false, backgroundInset, joinableHeight * 0.6 )
		joinableContainerBackgroundGrad:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
		joinableContainerBackgroundGrad:setAlpha( 0.1 )
		playerIdentity.joinableContainer:addElement( joinableContainerBackgroundGrad )
		playerIdentity.joinableContainer.border = CoD.BorderT6.new( 1, 1, 1, 1, 0.1 )
		playerIdentity.joinableContainer:addElement( playerIdentity.joinableContainer.border )
		local joinableTop = 0
		playerIdentity.statusLabel = LUI.UIText.new()
		playerIdentity.statusLabel:setLeftRight( false, false, -width / 2, width / 2 )
		playerIdentity.statusLabel:setTopBottom( false, false, -(joinableFontHeight / 2) - 3, joinableFontHeight / 2 - 3 )
		playerIdentity.statusLabel:setFont( joinableFont )
		playerIdentity.statusLabel:setAlignment( LUI.Alignment.Center )
		playerIdentity.joinableContainer:addElement( playerIdentity.statusLabel )
		joinableTop = joinableTop + joinableFontHeight
		playerIdentity.joinableTextLabel = LUI.UIText.new()
		playerIdentity.joinableTextLabel:setLeftRight( false, false, -width / 2, width / 2 )
		playerIdentity.joinableTextLabel:setTopBottom( true, false, joinableTop, joinableTop + joinableFontHeight )
		playerIdentity.joinableTextLabel:setFont( joinableFont )
		playerIdentity.joinableTextLabel:setAlignment( LUI.Alignment.Center )
		playerIdentity.joinableContainer:addElement( playerIdentity.joinableTextLabel )
		local joinableText = Engine.Localize( "MENU_JOINABLE" )
		local joinableTextLeft, joinableTextTop, joinableTextRight, joinableTextBottom = GetTextDimensions( joinableText, joinableFont, joinableFontHeight )
		local joinableIconSize = joinableFontHeight
		playerIdentity.joinableIcon = LUI.UIImage.new()
		playerIdentity.joinableIcon:setLeftRight( false, false, -(joinableTextRight / 2) - joinableTextSpacing - joinableIconSize, -(joinableTextRight / 2) - joinableTextSpacing )
		playerIdentity.joinableIcon:setTopBottom( true, false, joinableTop, joinableTop + joinableIconSize )
		playerIdentity.joinableIcon:setAlpha( 0 )
		playerIdentity.joinableIcon:setImage( RegisterMaterial( "menu_mp_party_ease_icon" ) )
		playerIdentity.joinableIcon:setAlignment( LUI.Alignment.Left )
		playerIdentity.joinableContainer:addElement( playerIdentity.joinableIcon )
		top = top + joinableHeight
	end
	return playerIdentity, top
end

CoD.PlayerIdentity.FindLeagueLbData = function ( leaderboardData, teamID )
	for index, currData in ipairs( leaderboardData ) do
		if currData.teamID == teamID then
			return currData
		end
	end
end

CoD.PlayerIdentity.LeagueLbDataFetched = function ( self, event )
	if self.spinner then
		self.spinner:close()
	end
	if event.success and event.teamID == self.teamID and event.fetchAllInfoForTeamInLeague then
		self:update( event.controller, self.selectedPlayerShowTruePlayerInfo, self.selectedPlayerXuid, self.playerInfo, self.leagueInfo )
	end
end

CoD.PlayerIdentity.FindTeamSubdivisionInfo = function ( subdivisionInfos, leagueID )
	for index, currInfo in ipairs( subdivisionInfos ) do
		if leagueID and leagueID == currInfo.leagueID then
			return currInfo
		end
	end
end

CoD.PlayerIdentity.UpdateDefault = function ( self, controller, selectedPlayerShowTruePlayerInfo, selectedPlayerXuid, playerInfo, leagueInfo )
	self.emblem:show()
	self.emblem:setupPlayerEmblemByXUID( selectedPlayerXuid )
	if self.rankIcon ~= nil then
		self.rankIcon:close()
		self.rankIcon = nil
	end
	if CoD.PlayerIdentity.ShowMPRank( playerInfo ) == true then
		local rankImage = playerInfo.rankImage
		if rankImage == nil then
			rankImage = Engine.TableLookup( nil, CoD.rankIconTable, 0, playerInfo.rank - 1, playerInfo.prestige + 1 ) .. "_128"
		end
		local rankImageDefaultAnimState = {
			leftAnchor = true,
			rightAnchor = true,
			left = 0,
			right = 0,
			topAnchor = true,
			bottomAnchor = true,
			top = 0,
			bottom = 0,
			material = LUI.UIImage.GetCachedMaterial( "ui_normal" ),
			image = RegisterImage( rankImage ),
			alpha = 1
		}
		self.rankIcon = LUI.UIStreamedImage.new( rankImageDefaultAnimState )
		self.rankIconContainer:addElement( self.rankIcon )
		local f7_local0 = playerInfo.prestige == tonumber( CoD.MAX_PRESTIGE )
		local rankHeight = CoD.textSize[CoD.PlayerIdentity.RankFontName]
		local rankOffset = rankHeight / 2
		if playerInfo.prestige > 0 then
			rankOffset = rankHeight
		end
		self.rank:setTopBottom( false, true, -5 - rankOffset - rankHeight, -5 - rankOffset )
		if f7_local0 then
			self.rank:setLeftRight( true, true, 10, -10 )
			self.rank:setText( Engine.Localize( "MENU_MASTER" ) )
		else
			self.rank:setLeftRight( true, true, 0, 0 )
			self.rank:setText( Engine.Localize( "MPUI_LEVEL_N", playerInfo.rank ) )
		end
		if playerInfo.prestige > 0 and not f7_local0 then
			self.prestigeLabel:setText( Engine.Localize( "MPUI_PRESTIGE_N", playerInfo.prestige ) )
		else
			self.prestigeLabel:setText( "" )
		end
		if playerInfo.bestDivisionRank ~= nil and playerInfo.bestDivisionIcon ~= nil and not Engine.IsInGame() then
			if self.bestLeagueDivisionIcon ~= nil then
				self.bestLeagueDivisionIcon:close()
				self.bestLeagueDivisionIcon = nil
			end
			local bestLeagueDivisionImageDefaultAnimState = {
				leftAnchor = true,
				rightAnchor = true,
				left = 0,
				right = 0,
				topAnchor = true,
				bottomAnchor = true,
				top = 0,
				bottom = 0,
				material = playerInfo.bestDivisionIcon,
				alpha = 1
			}
			self.bestLeagueDivisionIcon = LUI.UIStreamedImage.new( bestLeagueDivisionImageDefaultAnimState )
			self.bestDivisionIconContainer:addElement( self.bestLeagueDivisionIcon )
			self.bestLeagueRankLabel:setText( Engine.Localize( "MENU_RANK_N", playerInfo.bestDivisionRank ) )
			self.leagueBestLabel:setText( Engine.Localize( "MENU_LEAGUE_BEST" ) )
		else
			self.bestLeagueRankLabel:setText( "" )
			self.leagueBestLabel:setText( "" )
			if self.bestLeagueDivisionIcon ~= nil then
				self.bestLeagueDivisionIcon:close()
				self.bestLeagueDivisionIcon = nil
			end
		end
	else
		self.rank:setText( "" )
		self.prestigeLabel:setText( "" )
	end
end

CoD.PlayerIdentity.UpdateLeague = function ( self, controller, selectedPlayerShowTruePlayerInfo, selectedPlayerXuid, playerInfo, leagueInfo )
	if CoD.PlayerIdentity.ShowLeagueInfo( leagueInfo ) ~= true then
		return 
	end
	self.controller = controller
	self.selectedPlayerShowTruePlayerInfo = selectedPlayerShowTruePlayerInfo
	self.selectedPlayerXuid = selectedPlayerXuid
	self.playerInfo = playerInfo
	self.leagueInfo = leagueInfo
	local currLeagueInfo = Engine.GetLeague()
	local currTeamID = leagueInfo.teamID
	self.currTeamID = currTeamID
	local inPlacement = false
	local isPreSeason = false
	local teamSubdivisionInfo, leagueLbData, leaderboardData, fetchStatus, subdivisionInfos = nil
	if not currLeagueInfo then
		return 
	elseif self.currentLeagueIcon ~= nil then
		self.currentLeagueIcon:close()
		self.currentLeagueIcon = nil
	end
	self.emblem:show()
	if leagueInfo and leagueInfo.leagueTeamMemberCount and leagueInfo.leagueTeamMemberCount == 1 and selectedPlayerXuid ~= "0" then
		self.emblem:setupPlayerEmblemByXUID( selectedPlayerXuid )
	else
		self.emblem:setupLeagueEmblem( currTeamID )
	end
	local currentLeagueImageDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = -5,
		bottom = -5,
		material = RegisterMaterial( currLeagueInfo.iconName .. "_64" ),
		alpha = 1
	}
	self.currentLeagueIcon = LUI.UIStreamedImage.new( currentLeagueImageDefaultAnimState )
	self.currentLeagueIconContainer:addElement( self.currentLeagueIcon )
	if not self.divisionIconSpinner then
		self.divisionIconSpinner = CoD.GetCenteredImage( 64, 64, "lui_loader" )
		self.divisionIconContainer:addElement( self.divisionIconSpinner )
	end
	self.currentLeagueNameLabel:setText( currLeagueInfo.description )
	local currLeagueID = currLeagueInfo.id
	self.currLeagueID = currLeagueID
	if Engine.LeagueIsPreSeason( currLeagueID ) then
		return 
	end
	self.teamID = currTeamID
	local numResults = 5
	local fetched = Engine.FetchAllInfoForTeamInLeague( controller, currTeamID, currLeagueID, numResults )
	if not fetched then
		return 
	end
	local fetchStatus, subdivisionInfos = Engine.GetLeagueTeamSubdivisionInfos( controller, currTeamID )
	if fetchStatus ~= "fetched" then
		return 
	elseif subdivisionInfos then
		teamSubdivisionInfo = CoD.PlayerIdentity.FindTeamSubdivisionInfo( subdivisionInfos, currLeagueID )
		if not teamSubdivisionInfo then
			inPlacement = true
		end
	end
	leaderboardData = Engine.GetLeagueLbData( controller )
	if not leaderboardData and not inPlacement then
		return 
	elseif not inPlacement then
		leagueLbData = CoD.PlayerIdentity.FindLeagueLbData( leaderboardData, currTeamID )
	end
	if not inPlacement and (not leagueLbData or not teamSubdivisionInfo) then
		return 
	elseif self.divisionIconSpinner then
		self.divisionIconSpinner:close()
	end
	local divisionIconMaterial = RegisterMaterial( "menu_div_no_place" )
	if not inPlacement and teamSubdivisionInfo then
		local divisionIconAndBracketPos = Engine.GetLeagueDivisionIcon( teamSubdivisionInfo.divisionID, false, leagueLbData.rank )
		if divisionIconAndBracketPos then
			divisionIconMaterial = divisionIconAndBracketPos.divisionIcon
		end
	end
	if self.leagueDivisionIcon ~= nil then
		self.leagueDivisionIcon:close()
		self.leagueDivisionIcon = nil
	end
	local leagueDivisionImageDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0,
		material = divisionIconMaterial,
		alpha = 1
	}
	self.leagueDivisionIcon = LUI.UIImage.new( leagueDivisionImageDefaultAnimState )
	self.divisionIconContainer:addElement( self.leagueDivisionIcon )
	if inPlacement then
		return 
	elseif teamSubdivisionInfo.divisionName then
		self.leagueDivisionLabel:setText( teamSubdivisionInfo.divisionName )
	end
	if leagueLbData and leagueLbData.rank then
		self.leagueRankLabel:setText( Engine.Localize( "MENU_RANK_N", leagueLbData.rank ) )
		self.currentRankLabel:setText( Engine.Localize( "MENU_CURRENT_RANK" ) )
	end
end

CoD.PlayerIdentity.Update = function ( self, controller, selectedPlayerShowTruePlayerInfo, selectedPlayerXuid, playerInfo, leagueInfo )
	if selectedPlayerShowTruePlayerInfo == false then
		return 
	end
	self.backingContainer:show()
	self.backingContainer:setupMiniIdentity( selectedPlayerXuid, 0 )
	self.backingContainer:setFont( CoD.fonts.ExtraSmall )
	if self.displayMode == CoD.PlayerIdentity.Default then
		CoD.PlayerIdentity.UpdateDefault( self, controller, selectedPlayerShowTruePlayerInfo, selectedPlayerXuid, playerInfo, leagueInfo )
	elseif self.displayMode == CoD.PlayerIdentity.League then
		CoD.PlayerIdentity.UpdateLeague( self, controller, selectedPlayerShowTruePlayerInfo, selectedPlayerXuid, playerInfo, leagueInfo )
	end
	if self.joinableContainer ~= nil then
		if playerInfo.status == nil or playerInfo.status == "" then
			self.joinableContainer:setAlpha( 0 )
		else
			self.joinableContainer:setAlpha( 1 )
		end
		local joinable = Engine.IsPlayerJoinable( controller, playerInfo.xuid )
		local joinableFont = CoD.fonts[CoD.PlayerIdentity.JoinableFontName]
		local joinableFontHeight = CoD.textSize[CoD.PlayerIdentity.JoinableFontName]
		local playerStatusText = ""
		if playerInfo.status ~= nil then
			playerStatusText = playerInfo.status
		end
		local statusTextLeft, statusTextTop, statusTextRight, statusTextBottom = GetTextDimensions( playerStatusText, joinableFont, joinableFontHeight )
		local f9_local0 = self.width < statusTextRight
		if f9_local0 == true or joinable.isJoinable then
			self.statusLabel:setTopBottom( true, false, 0, joinableFontHeight )
		else
			self.statusLabel:setTopBottom( false, false, -(joinableFontHeight / 2) - 3, joinableFontHeight / 2 - 3 )
		end
		self.statusLabel:setText( playerStatusText )
		if f9_local0 == false and joinable.isJoinable then
			self.joinableTextLabel:setText( Engine.Localize( "MENU_JOINABLE" ) )
			self.joinableIcon:setAlpha( 1 )
		else
			self.joinableTextLabel:setText( "" )
			self.joinableIcon:setAlpha( 0 )
		end
	end
end

