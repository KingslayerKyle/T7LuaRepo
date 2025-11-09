CoD.LeagueTeamNamePopup = {}
CoD.LeagueTeamNamePopup.ItemWidth = 192
CoD.LeagueTeamNamePopup.ItemHeight = 146
CoD.LeagueTeamNamePopup.HighlightedItemWidth = 345.6
CoD.LeagueTeamNamePopup.HighlightedItemHeight = 217.8
CoD.LeagueTeamNamePopup.HintTextParams = {
	hintTextLeft = 0,
	hintTextWidth = 300
}
LUI.createMenu.LeagueTeamNamePopup = function ( controller )
	local self = CoD.Menu.New( "LeagueTeamNamePopup" )
	self:setPreviousMenu( "LeagueTeams" )
	self:addLargePopupBackground()
	self:setOwner( controller )
	self:addSelectButton()
	self:addBackButton()
	self:registerEventHandler( "open_keyboard", CoD.LeagueTeamNamePopup.OpenKeyboard )
	self:registerEventHandler( "open_emblem_select", CoD.LeagueTeamNamePopup.OpenEmblemSelect )
	self:addTitle( Engine.Localize( "MENU_TEAM_BARRACKS_CAPS" ) )
	CoD.LeagueTeamNamePopup.AddCarouselList( self, controller )
	return self
end

CoD.LeagueTeamNamePopup.AddCarouselList = function ( self, controller )
	local cardCarouselListTop = CoD.textSize.Big + 10
	local cardCarouselDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = cardCarouselListTop,
		bottom = 0
	}
	local cardCarouselList = CoD.CardCarouselList.new( cardCarouselDefaultAnimState, controller, CoD.LeagueTeamNamePopup.ItemWidth, CoD.LeagueTeamNamePopup.ItemHeight, CoD.LeagueTeamNamePopup.HighlightedItemWidth, CoD.LeagueTeamNamePopup.HighligtedItemHeight, CoD.LeagueTeamNamePopup.HintTextParams )
	self:addElement( cardCarouselList )
	CoD.LeagueTeamNamePopup.AddCarousel( cardCarouselList, controller )
	cardCarouselList:focusCurrentCardCarousel( controller )
end

CoD.LeagueTeamNamePopup.SetupTeamEmblemCard = function ( cardCarousel )
	local teamEmblemButton = cardCarousel:addNewCard()
	CoD.Barracks.SetupCarouselCard( teamEmblemButton, Engine.Localize( "MENU_TEAM_EMBLEM" ) )
	teamEmblemButton.hintText = Engine.Localize( "MENU_CHOOSE_TEAM_EMBLEM" )
	local emblemSize = 100
	teamEmblemButton:setupCenterImage( nil, emblemSize, emblemSize, 1.8 )
	teamEmblemButton.centerImageContainer.centerImage:setupLeagueEmblem( CoD.LeaguesData.CurrentTeamInfo.teamID )
	teamEmblemButton:setActionEventName( "open_emblem_select" )
end

CoD.LeagueTeamNamePopup.TeamNameButtonGainFocus = function ( card, event )
	local teamNameTextElem = card.teamNameTextElem
	local teamNameFontName = "Condensed"
	local teamNameFontHeight = CoD.textSize[teamNameFontName]
	local teamNameFont = CoD.fonts[teamNameFontName]
	teamNameTextElem:setTopBottom( false, false, -teamNameFontHeight / 2, teamNameFontHeight / 2 )
	teamNameTextElem:setFont( teamNameFont )
	CoD.CardCarousel.Card_GainFocus( card, event )
end

CoD.LeagueTeamNamePopup.TeamNameButtonLoseFocus = function ( card, event )
	local teamNameTextElem = card.teamNameTextElem
	local teamNameFontName = "ExtraSmall"
	local teamNameFont = CoD.fonts[teamNameFontName]
	local teamNameFontHeight = CoD.textSize[teamNameFontName]
	teamNameTextElem:setTopBottom( false, false, -teamNameFontHeight / 2, teamNameFontHeight / 2 )
	teamNameTextElem:setFont( teamNameFont )
	CoD.CardCarousel.Card_LoseFocus( card, event )
end

CoD.LeagueTeamNamePopup.SetupTeamNameCard = function ( cardCarousel )
	local teamNameButton = cardCarousel:addNewCard()
	CoD.Barracks.SetupCarouselCard( teamNameButton, Engine.Localize( "MENU_TEAM_NAME" ) )
	local teamName = Engine.Localize( "MENU_CREATE_NAME" )
	local textColor = nil
	if CoD.LeaguesData.CurrentTeamInfo.teamName and CoD.LeaguesData.CurrentTeamInfo.teamName ~= "" then
		teamName = CoD.LeaguesData.CurrentTeamInfo.teamName
		textColor = CoD.yellowGlow
	end
	local teamNameFontName = "ExtraSmall"
	local teamNameFontHeight = CoD.textSize[teamNameFontName]
	local teamNameFont = CoD.fonts[teamNameFontName]
	local teamNameTextElem = LUI.UIText.new()
	teamNameTextElem:setLeftRight( true, true, 0, 0 )
	teamNameTextElem:setTopBottom( false, false, -teamNameFontHeight / 2, teamNameFontHeight / 2 )
	teamNameTextElem:setFont( teamNameFont )
	teamNameTextElem:setAlignment( LUI.Alignment.Center )
	teamNameTextElem:setText( teamName )
	if textColor then
		teamNameTextElem:setRGB( textColor.r, textColor.g, textColor.b )
	end
	teamNameButton.teamNameTextElem = teamNameTextElem
	teamNameButton:setupCenterImage( nil, CoD.LeagueTeamNamePopup.ItemWidth - 20, 30, 1.8 )
	teamNameButton.centerImageContainer.centerImage:close()
	teamNameButton.centerImageContainer:addElement( CoD.GetInformationContainer() )
	teamNameButton.centerImageContainer:addElement( teamNameTextElem )
	teamNameButton.hintText = Engine.Localize( "MENU_CHOOSE_TEAM_NAME" )
	teamNameButton:setActionEventName( "open_keyboard" )
	teamNameButton:registerEventHandler( "league_teamname_entered", CoD.LeagueTeamNamePopup.UpdateTeamName )
	teamNameButton:registerEventHandler( "gain_focus", CoD.LeagueTeamNamePopup.TeamNameButtonGainFocus )
	teamNameButton:registerEventHandler( "lose_focus", CoD.LeagueTeamNamePopup.TeamNameButtonLoseFocus )
end

CoD.LeagueTeamNamePopup.AddCarousel = function ( cardCarouselList, controller )
	local cardCarousel = cardCarouselList:addCardCarousel( "" )
	CoD.LeagueTeamNamePopup.SetupTeamEmblemCard( cardCarousel )
	CoD.LeagueTeamNamePopup.SetupTeamNameCard( cardCarousel )
end

CoD.LeagueTeamNamePopup.UpdateTeamName = function ( self, event )
	Engine.SetLeagueTeamName( event.controller, event.teamName, CoD.LeaguesData.CurrentTeamInfo.teamID )
	CoD.LeaguesData.CurrentTeamInfo.teamName = event.teamName
	local teamsData = CoD.LeaguesData.teamsData
	if teamsData and #teamsData > 0 then
		for index, currTeamData in ipairs( teamsData ) do
			if currTeamData.teamID == CoD.LeaguesData.CurrentTeamInfo.teamID then
				currTeamData.teamName = event.teamName
			end
		end
	end
	self.teamNameTextElem:setText( event.teamName )
end

CoD.LeagueTeamNamePopup.OpenKeyboard = function ( self, event )
	Engine.Exec( event.controller, "ui_keyboard_new " .. Enum.KeyboardType.KEYBOARD_TYPE_LEAGUES )
end

CoD.LeagueTeamNamePopup.OpenEmblemSelect = function ( self, event )
	CoD.perController[event.controller].codtvRoot = "leagueidentity"
	self:openMenu( "CODTv", event.controller )
	self:close()
end

local EnterTeamNamePopup_OpenTeamName = function ( self, event )
	local leagueStats = Engine.GetLeagueStats( controller )
	CoD.LeaguesData.CurrentTeamInfo.teamID = leagueStats.teamID
	CoD.LeaguesData.CurrentTeamInfo.teamName = leagueStats.teamName
	local teamNamePopup = self:openMenu( "LeagueTeamNamePopup", event.controller )
	teamNamePopup.previousMenuName = nil
	self:close()
end

LUI.createMenu.EnterTeamNamePopup = function ( controller )
	local self = CoD.Popup.SetupPopupChoice( "EnterTeamNamePopup", controller )
	self:addBackButton()
	self:registerEventHandler( "open_teamname_menu", EnterTeamNamePopup_OpenTeamName )
	self.title:setText( Engine.Localize( "MENU_NOTICE_CAPS" ) )
	self.msg:setText( Engine.Localize( "MENU_ENTER_TEAMNAME_DESC" ) )
	self.choiceA:setLabel( Engine.Localize( "MENU_CONTINUE" ) )
	self.choiceB:setLabel( Engine.Localize( "MENU_CANCEL" ) )
	self.choiceA:setActionEventName( "open_teamname_menu" )
	self.choiceB:processEvent( {
		name = "gain_focus"
	} )
	return self
end

