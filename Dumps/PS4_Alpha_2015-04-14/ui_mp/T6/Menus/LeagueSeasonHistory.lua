CoD.LeagueSeasonHistory = {}
CoD.LeagueSeasonHistory.LbData = {}
CoD.LeagueSeasonHistory.HighlightedSeasonSubdivisionID = nil
CoD.LeagueSeasonHistory.ToggleDataSpinners = function ( self, hideSpinners )
	if hideSpinners then
		self.winsValueContainer.spinner:hide()
		self.rankTextContainer.spinner:hide()
		self.winstreakValueContainer.spinner:hide()
	else
		self.winsValueContainer.spinner:show()
		self.rankTextContainer.spinner:show()
		self.winstreakValueContainer.spinner:show()
	end
end

CoD.LeagueSeasonHistory.PopulateTeamRankData = function ( self, info )
	CoD.LeagueSeasonHistory.ToggleDataSpinners( self, true )
	self.winsValueContainer.winsValue:setText( info.ints[CoD.LeaguesData.LEAGUE_STAT_INT_WINS] )
	self.rankTextContainer.rankText:setText( Engine.Localize( "LEAGUE_RANK", info.rank ) )
	self.winstreakValueContainer.winstreakValue:setText( info.ints[CoD.LeaguesData.LEAGUE_STAT_INT_STREAK] )
end

CoD.LeagueSeasonHistory.LbDataFetched = function ( self, event )
	local lbData = Engine.GetLeagueLbData( event.controller )
	if event.success and lbData ~= nil and lbData[1] then
		CoD.LeagueSeasonHistory.LbData[lbData.subdivisionID] = lbData[1]
		CoD.LeagueSeasonHistory.PopulateTeamRankData( self, lbData[1] )
	end
end

CoD.LeagueSeasonHistory.ListBoxButtonGainFocus = function ( self, event )
	local currSeasonInfo = event.mutables.info
	self.divisionImage:setImage( currSeasonInfo.divisionIcon )
	self.divisionName:setText( currSeasonInfo.divisionName )
	self.subdivisionName:setText( Engine.Localize( "MENU_SUBDIVISION_X", currSeasonInfo.subdivisionName ) )
	self.highlightedSeasonName:setText( currSeasonInfo.seasonName )
	self.leagueImage:setImage( RegisterMaterial( currSeasonInfo.leagueIconName .. "_64" ) )
	self.leagueName:setText( currSeasonInfo.leagueName )
	self.leagueDate:setText( currSeasonInfo.seasonEndDate )
	CoD.LeagueSeasonHistory.HighlightedSeasonSubdivisionID = currSeasonInfo.subdivisionID
	if not CoD.LeagueSeasonHistory.LbData[currSeasonInfo.subdivisionID] then
		CoD.LeagueSeasonHistory.ToggleDataSpinners( self, false )
		Engine.Exec( event.controller, "leagueFetchLbData " .. currSeasonInfo.subdivisionID .. " " .. 1 .. " " .. CoD.LeaguesData.CurrentTeamInfo.teamID )
	else
		CoD.LeagueSeasonHistory.PopulateTeamRankData( self, CoD.LeagueSeasonHistory.LbData[currSeasonInfo.subdivisionID] )
	end
end

CoD.LeagueSeasonHistory.ListBoxButtonData = function ( controller, index, mutables )
	local historyInfo = CoD.LeagueSeasonHistory.historyInfo
	mutables.info = historyInfo[index]
	mutables.itemName:setText( historyInfo[index].seasonName )
	mutables.itemImage:setImage( historyInfo[index].divisionIcon )
end

CoD.LeagueSeasonHistory.ListBoxButtonCreator = function ( controller, mutables )
	local fontName = "Default"
	local font = CoD.fonts[fontName]
	local fontHeight = CoD.textSize[fontName]
	local itemInfoContainer = LUI.UIElement.new()
	itemInfoContainer:setLeftRight( true, true, 8, -8 )
	itemInfoContainer:setTopBottom( false, false, -fontHeight / 2, fontHeight / 2 )
	local itemName = CoD.CRCommon.GetTextElem( "Default", "Left" )
	itemInfoContainer:addElement( itemName )
	local imageSize = 32
	local itemImage = CoD.GetCenteredImage( imageSize, imageSize )
	itemImage:setLeftRight( false, true, -5 - imageSize, -5 )
	mutables.itemName = itemName
	mutables.itemImage = itemImage
	mutables:addElement( itemInfoContainer )
	mutables:addElement( itemImage )
end

CoD.LeagueSeasonHistory.GetListBox = function ( controller, listBoxWidth, buttonDataFn )
	local buttonHeight = 40
	local listBoxDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	}
	local listBox = CoD.ListBox.new( listBoxDefaultAnimState, controller, 5, buttonHeight, listBoxWidth, CoD.LeagueSeasonHistory.ListBoxButtonCreator, buttonDataFn, 0 )
	listBox:addScrollBar()
	listBox.m_pageArrowsOn = true
	return listBox
end

CoD.LeagueSeasonHistory.SetupInfoContainer = function ( self, controller )
	local infoContainerTop = 80
	local infoContainerHeight = 200
	local infoContainer = LUI.UIHorizontalList.new()
	infoContainer:setLeftRight( true, true, 0, 0 )
	infoContainer:setTopBottom( true, false, infoContainerTop, infoContainerTop + infoContainerHeight )
	local divisionInfoContainerWidth = 600
	local divisionInfoContainer = LUI.UIElement.new()
	divisionInfoContainer:setLeftRight( true, false, 0, divisionInfoContainerWidth )
	divisionInfoContainer:setTopBottom( true, true, 0, 0 )
	divisionInfoContainer:addElement( CoD.GetInformationContainer() )
	local divisionImageLeft = 20
	local divisionImageSize = 128
	local divisionImageContainer = LUI.UIElement.new()
	divisionImageContainer:setLeftRight( true, false, divisionImageLeft, divisionImageLeft + divisionImageSize )
	divisionImageContainer:setTopBottom( false, false, -divisionImageSize / 2, divisionImageSize / 2 )
	self.divisionImage = CoD.GetStretchedImage()
	divisionImageContainer:addElement( self.divisionImage )
	divisionInfoContainer:addElement( divisionImageContainer )
	local divisionInfoTextContainer = LUI.UIVerticalList.new()
	divisionInfoTextContainer:setLeftRight( true, true, divisionImageLeft + divisionImageSize + 30, 0 )
	divisionInfoTextContainer:setTopBottom( true, true, 50, 0 )
	divisionInfoContainer:addElement( divisionInfoTextContainer )
	local divisionName = CoD.GetTextElem( "Default", "Left", "" )
	self.divisionName = divisionName
	local rankTextContainer = LUI.UIElement.new()
	rankTextContainer:setLeftRight( true, true, 0, 0 )
	rankTextContainer:setTopBottom( true, false, 0, CoD.textSize.Big )
	self.rankTextContainer = rankTextContainer
	
	local rankText = CoD.GetTextElem( "Big", "Left", "" )
	rankTextContainer:addElement( rankText )
	rankTextContainer.rankText = rankText
	
	rankTextContainer.spinner = CoD.Barracks.GetSpinner( 0, nil, 32 )
	rankTextContainer:addElement( rankTextContainer.spinner )
	self.rankTextContainer.spinner:hide()
	local subdivisionName = CoD.GetTextElem( "ExtraSmall", "Left", "" )
	self.subdivisionName = subdivisionName
	divisionInfoTextContainer:addElement( divisionName )
	divisionInfoTextContainer:addElement( rankTextContainer )
	divisionInfoTextContainer:addElement( subdivisionName )
	local winsContainer = LUI.UIElement.new()
	winsContainer:setLeftRight( true, false, 0, 260 )
	winsContainer:setTopBottom( true, true, 0, 0 )
	winsContainer:addElement( CoD.GetInformationContainer() )
	local winsLabel = CoD.GetTextElem( "Default", "Center", "Wins", CoD.gray, 50 )
	winsContainer:addElement( winsLabel )
	
	local winsValueContainer = LUI.UIElement.new()
	winsValueContainer:setLeftRight( true, true, 0, 0 )
	winsValueContainer:setTopBottom( true, false, 90, 90 + CoD.textSize.Big )
	winsValueContainer.spinner = CoD.Barracks.GetSpinner( nil, nil, 32 )
	winsValueContainer:addElement( winsValueContainer.spinner )
	self.winsValueContainer = winsValueContainer
	
	self.winsValueContainer.spinner:hide()
	
	local winsValue = CoD.GetTextElem( "Big", "Center", "" )
	winsValueContainer:addElement( winsValue )
	winsValueContainer.winsValue = winsValue
	
	winsContainer:addElement( winsValueContainer )
	local winstreakContainer = LUI.UIElement.new()
	winstreakContainer:setLeftRight( true, false, 0, 180 )
	winstreakContainer:setTopBottom( true, true, 0, 0 )
	winstreakContainer:addElement( CoD.GetInformationContainer() )
	local winstreakLabel = CoD.GetTextElem( "Default", "Center", "Best Win Streak", CoD.gray, 50 )
	winstreakContainer:addElement( winstreakLabel )
	
	local winstreakValueContainer = LUI.UIElement.new()
	winstreakValueContainer:setLeftRight( true, true, 0, 0 )
	winstreakValueContainer:setTopBottom( true, false, 90, 90 + CoD.textSize.Big )
	winstreakValueContainer.spinner = CoD.Barracks.GetSpinner( nil, nil, 32 )
	winstreakValueContainer:addElement( winstreakValueContainer.spinner )
	self.winstreakValueContainer = winstreakValueContainer
	
	self.winstreakValueContainer.spinner:hide()
	local winstreakValue = CoD.GetTextElem( "Big", "Center", "" )
	winstreakValueContainer:addElement( winstreakValue )
	winstreakContainer:addElement( winstreakValueContainer )
	winstreakValueContainer.winstreakValue = winstreakValue
	infoContainer:addElement( divisionInfoContainer )
	infoContainer:addElement( winsContainer )
	self:addElement( infoContainer )
end

CoD.LeagueSeasonHistory.SetupLisBox = function ( self, controller, top )
	local listBoxContainer = LUI.UIElement.new()
	local listBoxContainerWidth = 300
	listBoxContainer:setLeftRight( true, false, 0, listBoxContainerWidth )
	listBoxContainer:setTopBottom( true, true, top, -50 )
	self.listBox = CoD.LeagueSeasonHistory.GetListBox( controller, listBoxContainerWidth, CoD.LeagueSeasonHistory.ListBoxButtonData )
	listBoxContainer:addElement( self.listBox )
	self:addElement( listBoxContainer )
	local historyInfo = CoD.LeagueSeasonHistory.historyInfo
	self.listBox:setTotalItems( historyInfo.numItems )
end

CoD.LeagueSeasonHistory.SetupElements = function ( self, controller )
	local infoContainerTop = 80
	local infoContainerHeight = 200
	CoD.LeagueSeasonHistory.SetupInfoContainer( self, controller )
	local top = infoContainerTop + infoContainerHeight + 20
	local highlightedSeasonName = CoD.GetTextElem( "Big", "Left", "", nil, top )
	self.highlightedSeasonName = highlightedSeasonName
	self:addElement( highlightedSeasonName )
	top = top + 60
	local seasonResultsLabel = CoD.GetTextElem( "ExtraSmall", "Left", Engine.Localize( "LEAGUE_SEASON_RESULTS" ), CoD.gray, top )
	self:addElement( seasonResultsLabel )
	top = top + 20
	local listBoxContainerWidth = 300
	local leagueInfoBox = LUI.UIElement.new()
	leagueInfoBox:setLeftRight( true, true, listBoxContainerWidth + 40, 0 )
	leagueInfoBox:setTopBottom( true, true, top, -50 )
	leagueInfoBox:addElement( CoD.GetInformationContainer() )
	local left = 10
	local leagueImageContainer = LUI.UIElement.new()
	local leagueImageSize = 128
	leagueImageContainer:setLeftRight( true, false, left, left + leagueImageSize )
	leagueImageContainer:setTopBottom( false, false, -leagueImageSize / 2, leagueImageSize / 2 )
	self.leagueImage = CoD.GetStretchedImage()
	leagueImageContainer:addElement( self.leagueImage )
	leagueInfoBox:addElement( leagueImageContainer )
	left = left + leagueImageSize + 10
	local leagueName = nil
	local currentLanguage = Dvar.loc_language:get()
	if currentLanguage == CoD.LANGUAGE_FULLJAPANESE or currentLanguage == CoD.LANGUAGE_JAPANESE then
		leagueName = CoD.GetTextElem( "Condensed", "Left", "", nil, 60 )
	else
		leagueName = CoD.GetTextElem( "Big", "Left", "", nil, 60 )
	end
	self.leagueName = leagueName
	leagueName:setLeftRight( true, true, left, 0 )
	leagueInfoBox:addElement( leagueName )
	local leagueDateHeader = CoD.GetTextElem( "Default", "Left", "", nil, 120 )
	self.leagueDateHeader = leagueDateHeader
	leagueDateHeader:setLeftRight( true, true, left, 0 )
	leagueDateHeader:setText( Engine.Localize( "LEAGUE_SEASON_FINAL_DATE", " " ) )
	leagueInfoBox:addElement( leagueDateHeader )
	local leagueDate = CoD.GetTextElem( "Default", "Left", "", nil, 120 + CoD.textSize.Default )
	self.leagueDate = leagueDate
	leagueDate:setLeftRight( true, true, left, 0 )
	leagueInfoBox:addElement( leagueDate )
	CoD.LeagueSeasonHistory.SetupLisBox( self, controller, top )
	self:addElement( leagueInfoBox )
end

CoD.LeagueSeasonHistory.OpenLeagueLeaderboard = function ( self, event )
	local info = event.mutables.info
	if CoD.LeaguesData.CurrentTeamInfo.teamMemberInfo then
		local teamSubdivisionInfo = CoD.LeaguesData.CurrentTeamSubdivisionInfo
		teamSubdivisionInfo.subdivisionID = info.subdivisionID
		teamSubdivisionInfo.teamID = CoD.LeaguesData.CurrentTeamInfo.teamID
		teamSubdivisionInfo.leagueIconName = info.leagueIconName
		teamSubdivisionInfo.leagueDesc = info.leagueName
		teamSubdivisionInfo.divisionName = info.divisionName
		teamSubdivisionInfo.divisionIcon = info.divisionIcon
		teamSubdivisionInfo.subdivisionName = info.subdivisionName
		teamSubdivisionInfo.bracketRankPosition = 0
		teamSubdivisionInfo.divisionID = info.divisionID
		CoD.LeaguesData.CurrentTeamInfo.teamName = CoD.LeaguesData.CurrentTeamInfo.teamName
		CoD.LeaguesData.CurrentLeagueID = info.leagueID
		CoD.LeaguesData.numTeamMembersToShow = CoD.LeaguesData.CurrentTeamInfo.teamMemberInfo.numMembers
		CoD.LeaguesData.seasonName = info.seasonName
		CoD.LeagueLeaderboard.previousMenuName = "LeagueSeasonHistory"
		self:openMenu( "LeagueLeaderboard", event.controller )
		self:close()
	end
end

LUI.createMenu.LeagueSeasonHistory = function ( controller )
	local self = CoD.Menu.New( "LeagueSeasonHistory" )
	self:addLargePopupBackground()
	self:setOwner( controller )
	self:setPreviousMenu( "LeagueTeams" )
	self:addSelectButton( Engine.Localize( "LEAGUE_VIEW_LADDER" ) )
	self:addBackButton()
	self:addTitle( Engine.ToUpper( Engine.Localize( "LEAGUE_SEASON_FINALS_CAPS" ) ) )
	self:registerEventHandler( "listbox_button_gain_focus", CoD.LeagueSeasonHistory.ListBoxButtonGainFocus )
	self:registerEventHandler( "league_lb_data_fetched", CoD.LeagueSeasonHistory.LbDataFetched )
	self:registerEventHandler( "click", CoD.LeagueSeasonHistory.OpenLeagueLeaderboard )
	CoD.LeagueSeasonHistory.historyInfo = Engine.GetLeagueSeasonHistory( controller, CoD.LeaguesData.CurrentTeamInfo.teamID )
	CoD.LeagueSeasonHistory.SetupElements( self, controller )
	return self
end

