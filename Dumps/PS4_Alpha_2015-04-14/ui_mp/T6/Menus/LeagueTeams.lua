require( "ui.T6.CoD9Button" )
require( "ui_mp.T6.Menus.LeagueLeaderboard" )
require( "ui_mp.T6.Menus.LeagueMemberList" )
require( "ui_mp.T6.Menus.LeagueSeasonHistory" )

CoD.LeagueTeams = {}
CoD.LeagueTeams.HintTextParams = {}
CoD.LeagueTeams.HintTextParams.hintTextLeft = 0
CoD.LeagueTeams.HintTextParams.hintTextWidth = 600
CoD.LeagueTeams.HintTextParams.hintTextTop = -5
CoD.LeagueTeams.OpenLeagueLeaderboard = function ( self, event )
	CoD.LeaguesData.CurrentLeagueID = CoD.LeaguesData.CurrentTeamSubdivisionInfo.leagueID
	CoD.LeaguesData.numTeamMembersToShow = CoD.LeaguesData.CurrentTeamInfo.teamMemberInfo.numMembers
	self:openMenu( "LeagueLeaderboard", event.controller )
	self:close()
end

CoD.LeagueTeams.RemoveLeagueMembersButton = function ( self )
	if self.leagueMembersButtonPrompt ~= nil then
		self.leagueMembersButtonPrompt:close()
		self.leagueMembersButtonPrompt = nil
	end
end

CoD.LeagueTeams.AddLeagueMembersButton = function ( self )
	if CoD.LeaguesData.CurrentTeamInfo.teamMemberInfo and CoD.LeaguesData.CurrentTeamInfo.teamMemberInfo.numMembers > 1 then
		self.leagueMembersButtonPrompt = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_TEAMMATE_PLAYERCARD" ), self, "button_prompt_league_members" )
		self:addLeftButtonPrompt( self.leagueMembersButtonPrompt )
	end
end

CoD.LeagueTeams.addSelectButtonWithLeagueMembers = function ( self )
	local replaceLeagueMembersButton = false
	if self.leagueMembersButtonPrompt ~= nil then
		replaceLeagueMembersButton = true
		CoD.LeagueTeams.RemoveLeagueMembersButton( self )
	end
	self:addSelectButtonWithPrestigeUnlock()
	if replaceLeagueMembersButton == true then
		CoD.LeagueTeams.AddLeagueMembersButton( self )
	end
end

LUI.createMenu.LeagueTeams = function ( controller )
	local self = CoD.Menu.New( "LeagueTeams" )
	self:addLargePopupBackground()
	self:setOwner( controller )
	self:setPreviousMenu( "Barracks" )
	self:addBackButton()
	CoD.LeagueTeams.AddLeagueMembersButton( self )
	self:addTitle( Engine.ToUpper( Engine.Localize( "MENU_SOLO_HOMEPAGE" ) ) )
	if CoD.LeaguesData.CurrentTeamInfo.teamMemberInfo and CoD.LeaguesData.CurrentTeamInfo.teamMemberInfo.numMembers > 1 then
		self:setTitle( Engine.ToUpper( Engine.Localize( "MENU_TEAM_HOMEPAGE" ) ) )
	end
	self:registerEventHandler( "open_league_leaderboard", CoD.LeagueTeams.OpenLeagueLeaderboard )
	self:registerEventHandler( "button_prompt_league_members", CoD.LeagueTeams.OpenLeagueMemberList )
	self:registerEventHandler( "open_team_identity", CoD.LeagueTeams.OpenTeamIdentity )
	self:registerEventHandler( "open_season_history", CoD.LeagueTeams.OpenSeasonHistory )
	self:registerEventHandler( "card_gain_focus", CoD.LeagueTeams.Menu_CardGainFocus )
	local cardCarouselList = CoD.CardCarouselList.new( defaultAnimState, controller, CoD.Barracks.ItemWidth, CoD.Barracks.ItemHeight, CoD.Barracks.HighlightedItemWidth, CoD.Barracks.HighligtedItemHeight, CoD.LeagueTeams.HintTextParams )
	cardCarouselList:setLeftRight( true, true, 0, 0 )
	cardCarouselList:setTopBottom( true, true, CoD.textSize.Big + 10, 0 )
	self:addElement( cardCarouselList )
	cardCarouselList.popup = self
	local fetchStatus = CoD.LeagueTeams.AddCarousels( cardCarouselList, controller )
	if fetchStatus == "fetched" and CoD.LeagueTeams.CurrentCarouselInfo and CoD.LeagueTeams.CurrentCarouselInfo.carouselIndex then
		cardCarouselList:setInitialCarousel( CoD.LeagueTeams.CurrentCarouselInfo.carouselIndex, CoD.LeagueTeams.CurrentCarouselInfo.cardIndex )
	end
	cardCarouselList:focusCurrentCardCarousel( controller )
	CoD.LeagueTeams.SetupInfoArea( self, controller )
	return self
end

CoD.LeagueTeams.Menu_CardGainFocus = function ( self, event )
	if event.card ~= nil then
		if self.leagueMembersButtonPrompt == nil then
			CoD.LeagueTeams.AddLeagueMembersButton( self )
		end
		if event.card.hasNoData == true then
			self:removeSelectButton()
		else
			CoD.LeagueTeams.addSelectButtonWithLeagueMembers( self )
		end
	end
end

CoD.LeagueTeams.OpenTeamIdentity = function ( self, event )
	self:openMenu( "LeagueTeamNamePopup", event.controller )
	self:close()
end

CoD.LeagueTeams.OpenSeasonHistory = function ( self, event )
	self:openMenu( "LeagueSeasonHistory", event.controller )
	self:close()
end

CoD.LeagueTeams.OpenLeagueMemberList = function ( self, event )
	self:openPopup( "LeagueMemberList", event.controller )
end

CoD.LeagueTeams.AddCarousels = function ( cardCarouselList, controller )
	return CoD.LeagueTeams.AddCarousel( "", cardCarouselList, controller )
end

CoD.LeagueTeams.CardButtonAction = function ( self, event )
	CoD.LeaguesData.CurrentTeamSubdivisionInfo = self.subdivisionInfo
	self:dispatchEventToParent( {
		name = "open_league_leaderboard",
		controller = event.controller
	} )
end

CoD.LeagueTeams.Card_GainFocus = function ( card, event )
	card.leagueIcon:setLeftRight( true, true, 0, -card.iconWidth * card.sizeMultiplier - card.spacing * card.sizeMultiplier )
	card.divisionIcon:setLeftRight( true, true, card.iconWidth * card.sizeMultiplier + card.spacing * card.sizeMultiplier, 0 )
	CoD.LeagueTeams.CurrentCarouselInfo = CoD.CardCarousel.GetCurrentCarouselInfo( card )
	CoD.CardCarousel.Card_GainFocus( card, event )
end

CoD.LeagueTeams.Card_LoseFocus = function ( card, event )
	card.leagueIcon:setLeftRight( true, true, 0, -card.iconWidth - card.spacing )
	card.divisionIcon:setLeftRight( true, true, card.iconWidth + card.spacing, 0 )
	CoD.CardCarousel.Card_LoseFocus( card, event )
end

CoD.LeagueTeams.SetupLeagueCard = function ( card, leagueSubdivisionInfo )
	local iconHeight = 64
	local iconWidth = iconHeight
	local spacing = 10
	local sizeMultiplier = 1.5
	local leagueDesc = ""
	if leagueSubdivisionInfo and leagueSubdivisionInfo.leagueDesc then
		leagueDesc = leagueSubdivisionInfo.leagueDesc
	end
	CoD.Barracks.SetupCarouselCard( card, leagueSubdivisionInfo.leagueDesc )
	card:setupCenterImage( nil, iconWidth * 2 + spacing, iconHeight, sizeMultiplier )
	card.spacing = spacing
	card.iconWidth = iconWidth
	card.iconHeight = iconHeight
	card.sizeMultiplier = sizeMultiplier
	card.leagueIcon = LUI.UIImage.new()
	card.leagueIcon:setLeftRight( true, true, 0, -iconWidth - spacing )
	card.leagueIcon:setTopBottom( true, true, 0, 0 )
	card.leagueIcon:setImage( RegisterMaterial( leagueSubdivisionInfo.leagueIconName .. "_64" ) )
	card.divisionIcon = LUI.UIImage.new()
	card.divisionIcon:setLeftRight( true, true, iconWidth + spacing, 0 )
	card.divisionIcon:setTopBottom( true, true, 0, 0 )
	card.divisionIcon:setImage( leagueSubdivisionInfo.divisionIcon )
	card.centerImageContainer.centerImage:close()
	card.centerImageContainer:addElement( card.leagueIcon )
	card.centerImageContainer:addElement( card.divisionIcon )
	local leftOffset = 0
	local rankTop = 0
	card.rankLabel = LUI.UIText.new()
	card.rankLabel:setLeftRight( true, false, leftOffset, leftOffset + 1 )
	card.rankLabel:setTopBottom( true, false, 10, 10 + CoD.textSize.Default )
	card.rankLabel:setFont( CoD.fonts.Default )
	card.rankLabel:setAlignment( LUI.Alignment.Left )
	card.rankLabel:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	card.rankLabel:setText( "RANK" )
	rankTop = rankTop + CoD.textSize.Default
	card.rankText = LUI.UIText.new()
	card.rankText:setLeftRight( true, false, leftOffset, leftOffset + 1 )
	card.rankText:setTopBottom( true, false, rankTop, rankTop + CoD.textSize.Big )
	card.rankText:setFont( CoD.fonts.Big )
	card.rankLabel:setAlignment( LUI.Alignment.Left )
	card.rankText:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	card.rankText:setText( "999" )
end

CoD.LeagueTeams.SetupTeamIdentityCard = function ( cardCarousel )
	if CoD.Barracks.ShowLeagueTeamsOnly then
		return 
	end
	local currTeamID = CoD.LeaguesData.CurrentTeamInfo.teamID
	if CoD.LeaguesData.CurrentTeamInfo.teamMemberInfo and CoD.LeaguesData.CurrentTeamInfo.teamMemberInfo.numMembers > 1 then
		local newCard = cardCarousel:addNewCard()
		CoD.Barracks.SetupCarouselCard( newCard, Engine.Localize( "MENU_TEAMNAME_AND_EMBLEM" ) )
		newCard:setupCenterImage( nil, 100, 100, 1.5 )
		newCard.centerImageContainer.centerImage:setupLeagueEmblem( currTeamID )
		newCard:setActionEventName( "open_team_identity" )
		newCard.hintText = Engine.Localize( "MENU_CHOOSE_TEAM_NAME_TITLE" )
	end
end

CoD.LeagueTeams.PopulateSeasonHistoryCard = function ( card, event )
	local historyInfo = Engine.GetLeagueSeasonHistory( event.controller, CoD.LeaguesData.CurrentTeamInfo.teamID )
	if card.spinner then
		card.spinner:close()
	end
	if card.centerImageContainer then
		card.centerImageContainer:close()
		card.centerImageContainer = nil
	end
	if not historyInfo or historyInfo.numItems == 0 then
		card:setupCenterImage( "menu_theater_nodata", 100, 100, 1.5 )
	else
		card:setupCenterImage( nil, 100, 100, 1.5 )
		card.centerImageContainer.centerImage:setImage( historyInfo[1].divisionIcon )
		card:setActionEventName( "open_season_history" )
		card.hintText = Engine.Localize( "LEAGUE_SEASON_HISTORY_HINT", historyInfo[1].divisionName )
	end
end

CoD.LeagueTeams.SetupSeasonHistoryCard = function ( cardCarousel, controller )
	local needToFetch = Engine.FetchLeagueSeasonHistory( controller, CoD.LeaguesData.CurrentTeamInfo.teamID )
	local newCard = cardCarousel:addNewCard()
	CoD.Barracks.SetupCarouselCard( newCard, Engine.Localize( "LEAGUE_SEASON_FINALS" ) )
	if needToFetch then
		CoD.Barracks.SetupCardSpinner( newCard )
		newCard:registerEventHandler( "league_season_history_fetched", CoD.LeagueTeams.PopulateSeasonHistoryCard )
	else
		CoD.LeagueTeams.PopulateSeasonHistoryCard( newCard, {
			controller = controller
		} )
	end
end

CoD.LeagueTeams.SetupLeagueInfoCards = function ( self, event )
	local teamSubdivisionInfoData = CoD.LeaguesData.TeamSubdivisionInfo.data
	local teamSubdivisionInfoFetchStatus = CoD.LeaguesData.TeamSubdivisionInfo.fetchStatus
	local currTeamID = CoD.LeaguesData.CurrentTeamInfo.teamID
	if currTeamID ~= event.teamID then
		return 
	end
	teamSubdivisionInfoFetchStatus[currTeamID], teamSubdivisionInfoData[currTeamID] = Engine.GetLeagueTeamSubdivisionInfos( event.controller, currTeamID )
	local leagueSubdivisionInfos = teamSubdivisionInfoData[currTeamID]
	if leagueSubdivisionInfos and #leagueSubdivisionInfos > 0 and event.success then
		self:clearAllItems()
		for index, leagueSubdivisionInfo in ipairs( leagueSubdivisionInfos ) do
			local newCard = self:addNewCard()
			CoD.LeagueTeams.SetupLeagueCard( newCard, leagueSubdivisionInfo )
			newCard.hintText = Engine.Localize( "MENU_VIEW_LADDER_FOR_LEAGUE" )
			newCard.subdivisionInfo = leagueSubdivisionInfo
			newCard:registerEventHandler( "button_action", CoD.LeagueTeams.CardButtonAction )
			newCard:registerEventHandler( "gain_focus", CoD.LeagueTeams.Card_GainFocus )
			newCard:registerEventHandler( "lose_focus", CoD.LeagueTeams.Card_LoseFocus )
		end
		CoD.LeagueTeams.SetupTeamIdentityCard( self )
		self.cardCarouselList:focusCurrentCardCarousel( event.controller )
	else
		self:dispatchEventToChildren( {
			name = "no_data_available",
			controller = controller
		} )
	end
end

CoD.LeagueTeams.CardButtonNoData = function ( self, event )
	if self.spinner then
		self.spinner:close()
	end
	local iconSize = 100
	if self.centerImageContainer then
		self.centerImageContainer:close()
	end
	self:setupCenterImage( "menu_div_no_place", iconSize, iconSize, 1.5 )
	self.title:setText( Engine.Localize( "MENU_AWAITING_PLACEMENT" ) )
	self.hintText = Engine.Localize( "MENU_VIEW_LADDER_AFTER_PLACEMENT" )
	self.noDataText = self.title
	self.hasNoData = true
end

CoD.LeagueTeams.AddCarousel = function ( title, cardCarouselList, controller )
	local cardCarousel = cardCarouselList:addCardCarousel( Engine.Localize( title ) )
	local teamSubdivisionInfoData = CoD.LeaguesData.TeamSubdivisionInfo.data
	local teamSubdivisionInfoFetchStatus = CoD.LeaguesData.TeamSubdivisionInfo.fetchStatus
	local currTeamID = CoD.LeaguesData.CurrentTeamInfo.teamID
	local fetchStatus = teamSubdivisionInfoFetchStatus[currTeamID]
	local f20_local0 = fetchStatus == "fetched"
	local f20_local1 = fetchStatus == "fetching"
	local f20_local2 = fetchStatus == "fetching_failed"
	if f20_local0 then
		local leagueSubdivisionInfos = teamSubdivisionInfoData[currTeamID]
		if leagueSubdivisionInfos and #leagueSubdivisionInfos > 0 then
			for index, leagueSubdivisionInfo in ipairs( leagueSubdivisionInfos ) do
				local newCard = cardCarousel:addNewCard()
				CoD.LeagueTeams.SetupLeagueCard( newCard, leagueSubdivisionInfo )
				newCard.subdivisionInfo = leagueSubdivisionInfo
				newCard.hintText = Engine.Localize( "MENU_VIEW_LADDER_FOR_LEAGUE" )
				newCard:registerEventHandler( "button_action", CoD.LeagueTeams.CardButtonAction )
				newCard:registerEventHandler( "gain_focus", CoD.LeagueTeams.Card_GainFocus )
				newCard:registerEventHandler( "lose_focus", CoD.LeagueTeams.Card_LoseFocus )
				newCard.hasNoData = nil
			end
		else
			local newCard = cardCarousel:addNewCard()
			CoD.Barracks.SetupCarouselCard( newCard )
			newCard.hasNoData = true
			newCard:registerEventHandler( "no_data_available", CoD.LeagueTeams.CardButtonNoData )
			newCard:processEvent( {
				name = "no_data_available",
				controller = controller
			} )
		end
	elseif f20_local1 then
		local newCard = cardCarousel:addNewCard()
		CoD.Barracks.SetupCarouselCard( newCard )
		newCard.hasNoData = true
		newCard:registerEventHandler( "no_data_available", CoD.LeagueTeams.CardButtonNoData )
		CoD.Barracks.SetupCardSpinner( newCard )
	elseif f20_local2 then
		local newCard = cardCarousel:addNewCard()
		CoD.Barracks.SetupCarouselCard( newCard )
		newCard.hasNoData = true
		newCard:processEvent( {
			name = "no_data_available",
			controller = controller
		} )
	end
	CoD.LeagueTeams.SetupSeasonHistoryCard( cardCarousel, controller )
	CoD.LeagueTeams.SetupTeamIdentityCard( cardCarousel )
	cardCarousel:registerEventHandler( "league_team_subdivision_info_fetched", CoD.LeagueTeams.SetupLeagueInfoCards )
	return fetchStatus
end

local GetInfoAreaText = function ( textSizeAndFont, text, alignment, color )
	local textElem = LUI.UIElement.new()
	textElem:setLeftRight( true, true, 0, 0 )
	textElem:setTopBottom( true, false, 0, CoD.textSize[textSizeAndFont] )
	textElem.text = LUI.UIText.new()
	textElem.text:setLeftRight( true, true, 0, 0 )
	textElem.text:setTopBottom( true, true, 0, 0 )
	textElem.text:setFont( CoD.fonts[textSizeAndFont] )
	textElem.text:setText( text )
	textElem.text:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	if alignment then
		textElem.text:setAlignment( LUI.Alignment[alignment] )
	end
	if color then
		textElem.text:setRGB( color.r, color.g, color.b )
	end
	textElem:addElement( textElem.text )
	return textElem
end

local SetupSeasonInfo = function ( seasonInfo )
	local leagueIconSize = 64
	local leagueIcon = LUI.UIImage.new()
	leagueIcon:setLeftRight( true, false, 0, leagueIconSize )
	leagueIcon:setTopBottom( true, false, 0, leagueIconSize )
	seasonInfo:addElement( leagueIcon )
	local leagueName = LUI.UIText.new()
	leagueName:setLeftRight( true, true, leagueIconSize + 5, 0 )
	leagueName:setTopBottom( true, false, 10, 10 + CoD.textSize.Default )
	leagueName:setFont( CoD.fonts.Default )
	leagueName:setText( "MLG PRO RULES" )
	seasonInfo:addElement( leagueName )
	local season = LUI.UIText.new()
	season:setLeftRight( true, true, leagueIconSize + 5, 0 )
	season:setTopBottom( true, false, 10 + CoD.textSize.Default, 10 + CoD.textSize.Default + CoD.textSize.Default )
	season:setFont( CoD.fonts.Default )
	season:setText( "Season 1" )
	seasonInfo:addElement( season )
end

local SetupDivisionInfo = function ( divisionInfo, divisionInfoHeight )
	local divisionIconSize = divisionInfoHeight
	local divisionIcon = LUI.UIImage.new()
	divisionIcon:setLeftRight( true, false, 0, divisionIconSize )
	divisionIcon:setTopBottom( true, false, 0, divisionIconSize )
	divisionInfo:addElement( divisionIcon )
	local rankLabel = LUI.UIText.new()
	rankLabel:setLeftRight( true, true, divisionIconSize + 5, 0 )
	rankLabel:setTopBottom( true, false, 10, 10 + CoD.textSize.Default )
	rankLabel:setFont( CoD.fonts.Default )
	rankLabel:setText( "RANK" )
	divisionInfo:addElement( rankLabel )
	local rankText = LUI.UIText.new()
	rankText:setLeftRight( true, true, divisionIconSize + 5, 0 )
	rankText:setTopBottom( true, false, 10 + CoD.textSize.Default, 10 + CoD.textSize.Default + CoD.textSize.Big )
	rankText:setFont( CoD.fonts.Big )
	rankText:setText( "999" )
	divisionInfo:addElement( rankText )
end

CoD.LeagueTeams.SetupInfoArea = function ( self, controller )
	local currTeamID = CoD.LeaguesData.CurrentTeamInfo.teamID
	local currTeamName = CoD.LeaguesData.CurrentTeamInfo.teamName
	local teamMemberInfo = Engine.GetLeagueTeamMemberInfo( controller, currTeamID )
	local teamInfo = Engine.GetCachedLeagueTeamInfo( controller, currTeamID )
	local infoAreaHeight = 250
	local infoAreaBottom = -50
	local infoAreaContainer = LUI.UIElement.new()
	infoAreaContainer:setLeftRight( true, true, 0, 0 )
	infoAreaContainer:setTopBottom( false, true, -infoAreaHeight + infoAreaBottom, infoAreaBottom )
	local leftOffset = 0
	local bigTeamIconSize = infoAreaHeight
	local bigTeamIconContainer = LUI.UIElement.new()
	bigTeamIconContainer:setLeftRight( true, false, leftOffset, leftOffset + bigTeamIconSize )
	bigTeamIconContainer:setTopBottom( true, false, 0, bigTeamIconSize )
	local bigTeamIcon = CoD.GetCenteredImage( bigTeamIconSize - 10, bigTeamIconSize - 10 )
	bigTeamIconContainer:addElement( CoD.GetInformationContainer() )
	bigTeamIconContainer:addElement( bigTeamIcon )
	bigTeamIcon:setupLeagueEmblem( currTeamID )
	infoAreaContainer:addElement( bigTeamIconContainer )
	leftOffset = leftOffset + bigTeamIconSize + 20
	local teamInfoListWidth = 200
	local teamInfoList = LUI.UIVerticalList.new()
	teamInfoList:setLeftRight( true, false, leftOffset, leftOffset + teamInfoListWidth )
	teamInfoList:setTopBottom( true, true, 0, 0 )
	infoAreaContainer:addElement( teamInfoList )
	if currTeamName then
		local teamName = GetInfoAreaText( "Big", currTeamName, "left" )
		teamName:setLeftRight( true, false, 0, 300 )
		teamInfoList:addElement( teamName )
	end
	teamInfoList:addSpacer( 5 )
	teamInfoList:addElement( GetInfoAreaText( "Default", Engine.ToUpper( Engine.Localize( "MENU_TEAM_MEMBERS" ) ), "left", CoD.gray ) )
	teamInfoList:addSpacer( 5 )
	if teamMemberInfo and teamMemberInfo.members and #teamMemberInfo.members > 0 then
		for index, currMember in ipairs( teamMemberInfo.members ) do
			teamInfoList:addElement( GetInfoAreaText( "ExtraSmall", currMember.userName, "left" ) )
		end
	end
	teamInfoList:addSpacer( 5 )
	if teamMemberInfo and teamMemberInfo.members and #teamMemberInfo.members > 1 and teamInfo and teamInfo.timeEstablished then
		local date = GetInfoAreaText( "ExtraSmall", Engine.Localize( "MENU_TEAM_EST_N", teamInfo.timeEstablished ), "left" )
		date:setLeftRight( true, false, leftOffset, leftOffset + 500 )
		date:setTopBottom( false, true, 20 - CoD.textSize.ExtraSmall, 20 )
		infoAreaContainer:addElement( date )
	end
	leftOffset = leftOffset + teamInfoListWidth + 10
	local careerVictories = LUI.UIVerticalList.new()
	local careerVictoriesWidth = 180
	local careerVictoriesTop = 50
	careerVictories:setLeftRight( true, false, leftOffset, leftOffset + careerVictoriesWidth )
	careerVictories:setTopBottom( true, true, careerVictoriesTop, 0 )
	careerVictories:addElement( GetInfoAreaText( "Default", "CAREER VICTORIES" ) )
	careerVictories:addElement( GetInfoAreaText( "Morris", "9999" ) )
	leftOffset = leftOffset + careerVictoriesWidth + 20
	local bestSeasonFinish = LUI.UIVerticalList.new()
	local bestSeasonFinishTop = 50
	bestSeasonFinish:setLeftRight( true, true, leftOffset, 0 )
	bestSeasonFinish:setTopBottom( true, true, bestSeasonFinishTop, 0 )
	bestSeasonFinish:addElement( GetInfoAreaText( "Default", "BEST SEASON FINISH", "left" ) )
	local divisionInfo = LUI.UIElement.new()
	local divisionInfoHeight = 96
	divisionInfo:setLeftRight( true, true, 0, 0 )
	divisionInfo:setTopBottom( true, false, 0, divisionInfoHeight )
	SetupDivisionInfo( divisionInfo, divisionInfoHeight )
	local seasonInfo = LUI.UIElement.new()
	local seasonInfoHeight = 96
	seasonInfo:setLeftRight( true, true, 0, 0 )
	seasonInfo:setTopBottom( true, false, 0, seasonInfoHeight )
	SetupSeasonInfo( seasonInfo )
	bestSeasonFinish:addElement( divisionInfo )
	bestSeasonFinish:addSpacer( 10 )
	bestSeasonFinish:addElement( seasonInfo )
	self:addElement( infoAreaContainer )
end

