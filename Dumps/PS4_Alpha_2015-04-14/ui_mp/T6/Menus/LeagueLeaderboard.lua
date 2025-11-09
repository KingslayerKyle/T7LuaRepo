require( "ui.T6.CoD9Button" )

CoD.LeagueLeaderboard = {}
CoD.LeagueLeaderboard.BackgroundInset = 2
CoD.LeagueLeaderboard.ItemWidth = 280
CoD.LeagueLeaderboard.ItemHeight = 200
CoD.LeagueLeaderboard.HighlightedItemWidth = CoD.LeagueLeaderboard.ItemWidth * 1.2
CoD.LeagueLeaderboard.HighligtedItemHeight = CoD.LeagueLeaderboard.ItemHeight * 1.2
CoD.LeagueLeaderboard.MaxResults = 100
CoD.LeagueLeaderboard.LBRANK_XLEFT = 0
CoD.LeagueLeaderboard.LBRANK_XRIGHT = 50
CoD.LeagueLeaderboard.PADDING = 5
CoD.LeagueLeaderboard.NAME_XLEFT = CoD.LeagueLeaderboard.LBRANK_XRIGHT + 10
CoD.LeagueLeaderboard.NAME_XRIGHT = CoD.LeagueLeaderboard.NAME_XLEFT + 175
CoD.LeagueLeaderboard.DATACOLS_XLEFT = CoD.LeagueLeaderboard.NAME_XRIGHT
CoD.LeagueLeaderboard.TeamMemberInfoCacheSize = 30
CoD.LeagueLeaderboard.TeamMemberInfoFetchDelay = 750
CoD.LeagueLeaderboard.MaxTeamMembers = 6
CoD.LeagueLeaderboard.DataFetched = function ( self, event )
	self.listBox:addScrollBar()
	if event ~= nil and event.success == false then
		self.listBox:showError( Engine.Localize( "MPUI_LB_ERROR" ) )
		return 
	elseif self.m_initialLoad == false then
		self.pivotIndex = event.pivot
		self.listBox:setTotalItems( event.totalResults, event.pivot )
		self.m_initialLoad = true
	else
		self.listBox:refresh()
	end
end

CoD.LeagueLeaderboard.LoadNew = function ( self, event )
	if not CoD.LeaguesData.CurrentTeamSubdivisionInfo or not CoD.LeaguesData.CurrentTeamSubdivisionInfo.subdivisionID or not CoD.LeaguesData.CurrentTeamSubdivisionInfo.teamID then
		return 
	elseif self ~= nil and event ~= nil then
		self.m_initialLoad = false
		Engine.Exec( event.controller, "leagueFetchLbData " .. CoD.LeaguesData.CurrentTeamSubdivisionInfo.subdivisionID .. " " .. CoD.LeagueLeaderboard.MaxResults .. " " .. CoD.LeaguesData.CurrentTeamSubdivisionInfo.teamID )
		if self.pivotRow ~= nil then
			self:removeElement( self.pivotRow )
			self.pivotRow = nil
		end
		if self.headerRow ~= nil then
			self:removeElement( self.headerRow )
			self.headerRow = nil
		end
		self.listBox:showMessage( Engine.Localize( "MENU_LB_LOADING" ) )
	end
end

CoD.LeagueLeaderboard.JumpToTop = function ( self, event )
	if self ~= nil and self.listBox ~= nil then
		self.listBox:jumpToTop()
	end
end

CoD.LeagueLeaderboard.UpdateTeamMemberNames = function ( self, teamMemberInfo )
	for i = 1, CoD.LeagueLeaderboard.MaxTeamMembers, 1 do
		self.teamMemberNames[i]:setText( "" )
	end
	if teamMemberInfo then
		for i = 1, self.numTeamMembersToShow, 1 do
			self.teamMemberNames[i]:setText( teamMemberInfo.members[i].userName )
		end
	end
end

CoD.LeagueLeaderboard.UpdateEmblemsAndNames = function ( self, teamMemberInfo )
	if self.numTeamMembersToShow == 1 then
		if teamMemberInfo.members and teamMemberInfo.members[1] and teamMemberInfo.members[1].xuid then
			self.teamEmblemImage:setupPlayerEmblemByXUID( teamMemberInfo.members[1].xuid )
			self.teamEmblemImage:show()
			if self.selectButton then
				self.selectButton:close()
			end
			self:addSelectButton()
			self.selectedPlayerXuid = teamMemberInfo.members[1].xuid
		end
	else
		CoD.LeagueLeaderboard.UpdateTeamMemberNames( self, teamMemberInfo )
	end
	self.teamEmblemSpinner:hide()
	self.spinner:hide()
end

CoD.LeagueLeaderboard.TeamMemberInfoFetched = function ( self, event )
	if event.success == false then
		return 
	elseif CoD.LeagueLeaderboard.TeamMemberInfoCacheSize <= #CoD.LeaguesData.LbTeamMemberInfos then
		CoD.LeaguesData.LbTeamMemberInfos = {}
	end
	table.insert( CoD.LeaguesData.LbTeamMemberInfos, event.teamMemberInfo )
	if event.teamMemberInfo.teamID == CoD.LeagueLeaderboard.HighlightedTeamID then
		CoD.LeagueLeaderboard.UpdateEmblemsAndNames( self, event.teamMemberInfo )
	end
end

CoD.LeagueLeaderboard.ButtonAction = function ( self, event )
	if not self.selectedPlayerXuid then
		return 
	else
		CoD.FriendPopup.SelectedPlayerXuid = self.selectedPlayerXuid
		CoD.FriendPopup.SelectedPlayerName = CoD.LeagueLeaderboard.HighlightedTeamName
		CoD.FriendPopup.LeagueLeaderboardMemberSelected = true
		Dvar.selectedPlayerXuid:set( self.selectedPlayerXuid )
		self:openPopup( "FriendPopup", event.controller )
	end
end

CoD.LeagueLeaderboard.GetTeamMemberInfoFromCache = function ( teamID )
	if not CoD.LeaguesData.LbTeamMemberInfos or #CoD.LeaguesData.LbTeamMemberInfos == 0 then
		return 
	end
	for index, teamMemberInfo in ipairs( CoD.LeaguesData.LbTeamMemberInfos ) do
		if teamMemberInfo.teamID == teamID then
			return teamMemberInfo
		end
	end
end

CoD.LeagueLeaderboard.FetchTeamMemberInfo = function ( self, event )
	if CoD.LeagueLeaderboard.HighlightedTeamID then
		Engine.FetchLeagueLbTeamMemberInfo( self.m_ownerController, CoD.LeagueLeaderboard.HighlightedTeamID )
	end
end

CoD.LeagueLeaderboard.JumpToTop = function ( self, event )
	if self.listBox then
		self.listBox:jumpToTop()
	end
end

CoD.LeagueLeaderboard.GoBack = function ( self, controller )
	CoD.FriendPopup.LeagueLeaderboardMemberSelected = false
	CoD.Menu.goBack( self, controller )
end

LUI.createMenu.LeagueLeaderboard = function ( controller, lobbyLeaderboard )
	local self = CoD.Menu.New( "LeagueLeaderboard" )
	self:addLargePopupBackground()
	self:setOwner( controller )
	self:addBackButton()
	self.goBack = CoD.LeagueLeaderboard.GoBack
	CoD.LeaguesData.LbTeamMemberInfos = {}
	if lobbyLeaderboard ~= true then
		self:setPreviousMenu( "LeagueTeams" )
	end
	if CoD.LeagueLeaderboard.previousMenuName then
		self:setPreviousMenu( CoD.LeagueLeaderboard.previousMenuName )
		CoD.LeagueLeaderboard.previousMenuName = nil
	end
	CoD.LeagueLeaderboard.SetupElements( self, controller )
	self:registerEventHandler( "league_lb_data_fetched", CoD.LeagueLeaderboard.DataFetched )
	self:registerEventHandler( "league_lb_loadnew", CoD.LeagueLeaderboard.LoadNew )
	self:registerEventHandler( "league_lb_jumpToTop", CoD.LeagueLeaderboard.JumpToTop )
	self:registerEventHandler( "listbox_button_gain_focus", CoD.LeagueLeaderboard.ButtonGainFocus )
	self:registerEventHandler( "league_lb_team_member_info_fetched", CoD.LeagueLeaderboard.TeamMemberInfoFetched )
	self:registerEventHandler( "fetch_league_lb_team_member_info", CoD.LeagueLeaderboard.FetchTeamMemberInfo )
	self:registerEventHandler( "click", CoD.LeagueLeaderboard.ButtonAction )
	self:registerEventHandler( "lb_jumpToTop", CoD.LeagueLeaderboard.JumpToTop )
	self:processEvent( {
		name = "league_lb_loadnew",
		controller = controller
	} )
	return self
end

local GetHeaderText = function ( textSizeAndFont, text, color )
	local textElem = LUI.UITightText.new()
	textElem:setLeftRight( true, false, 0, 1 )
	textElem:setTopBottom( true, false, 0, CoD.textSize[textSizeAndFont] )
	textElem:setFont( CoD.fonts[textSizeAndFont] )
	textElem:setText( text )
	if color then
		textElem:setRGB( color.r, color.g, color.b )
	end
	return textElem
end

local GetTeamMemberNameText = function ( name )
	local teamMemberFont = "Default"
	local textElem = LUI.UIText.new()
	textElem:setLeftRight( true, true, 0, 0 )
	textElem:setTopBottom( true, false, 0, CoD.textSize[teamMemberFont] )
	textElem:setFont( CoD.fonts[teamMemberFont] )
	textElem:setText( name )
	return textElem
end

CoD.LeagueLeaderboard.LB_SetMutablesColor = function ( mutables, color )
	mutables.lbrank:setRGB( color.r, color.g, color.b )
	mutables.name:setRGB( color.r, color.g, color.b )
	mutables.dataCol:setRGB( color.r, color.g, color.b )
end

CoD.LeagueLeaderboard.LB_ButtonData = function ( controller, itemIndex, mutables )
	local result = Engine.GetLeagueLbRow( controller, itemIndex )
	if result == nil then
		mutables.loading:setText( Engine.Localize( "MENU_LB_LOADING" ) )
		mutables.lbrank:setText( "" )
		mutables.name:setText( "" )
		mutables.dataCol:setText( "" )
		mutables.tierLine:hide()
	else
		mutables.loading:setText( "" )
		mutables.lbrank:setText( result.rank )
		mutables.name:setText( result.teamName )
		mutables.dataCol:setText( result.rating )
		mutables.teamName = result.teamName
		mutables.wins = result.ints[CoD.LeaguesData.LEAGUE_STAT_INT_WINS]
		mutables.streak = result.ints[CoD.LeaguesData.LEAGUE_STAT_INT_STREAK]
		mutables.teamID = result.teamID
		mutables.rank = result.rank
		mutables.tierLine:hide()
		if CoD.LeaguesData.CurrentTeamSubdivisionInfo.divisionID then
			local divisionIconAndBracketPos = Engine.GetLeagueDivisionIcon( CoD.LeaguesData.CurrentTeamSubdivisionInfo.divisionID, false, result.rank )
			if divisionIconAndBracketPos and tonumber( result.rank ) == divisionIconAndBracketPos.bracketRankPosition then
				mutables.tierLine:show()
			end
		end
		if result.teamName == CoD.LeaguesData.CurrentTeamInfo.teamName then
			CoD.LeagueLeaderboard.LB_SetMutablesColor( mutables, CoD.yellowGlow )
		else
			CoD.LeagueLeaderboard.LB_SetMutablesColor( mutables, CoD.offWhite )
		end
	end
end

CoD.LeagueLeaderboard.LB_ButtonCreator = function ( controller, mutables )
	mutables.loading = LUI.UIText.new( {
		leftAnchor = false,
		rightAnchor = false,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = false,
		top = -CoD.textSize.Default / 2,
		bottom = CoD.textSize.Default / 2,
		font = CoD.fonts.Default,
		alignment = LUI.Alignment.Center
	} )
	mutables:addElement( mutables.loading )
	mutables.lbrank = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = CoD.LeagueLeaderboard.LBRANK_XLEFT + CoD.LeagueLeaderboard.PADDING,
		right = CoD.LeagueLeaderboard.LBRANK_XRIGHT - CoD.LeagueLeaderboard.PADDING,
		topAnchor = false,
		bottomAnchor = false,
		top = -CoD.textSize.Default / 2,
		bottom = CoD.textSize.Default / 2,
		font = CoD.fonts.Default,
		alignment = LUI.Alignment.Right
	} )
	mutables:addElement( mutables.lbrank )
	mutables.name = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = CoD.LeagueLeaderboard.NAME_XLEFT + CoD.LeagueLeaderboard.PADDING,
		right = CoD.LeagueLeaderboard.NAME_XLEFT - CoD.LeagueLeaderboard.PADDING,
		topAnchor = false,
		bottomAnchor = false,
		top = -CoD.textSize.Default / 2,
		bottom = CoD.textSize.Default / 2,
		font = CoD.fonts.Default,
		alignment = LUI.Alignment.Left
	} )
	mutables:addElement( mutables.name )
	mutables.dataCol = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = CoD.LeagueLeaderboard.NAME_XRIGHT + CoD.LeagueLeaderboard.PADDING,
		right = -20,
		topAnchor = false,
		bottomAnchor = false,
		top = -CoD.textSize.Default / 2,
		bottom = CoD.textSize.Default / 2,
		font = CoD.fonts.Default,
		alignment = LUI.Alignment.Right
	} )
	mutables.tierLine = CoD.GetStretchedImage()
	mutables.tierLine:setTopBottom( false, true, -1, 0 )
	mutables.tierLine:setRGB( CoD.yellowGlow.r, CoD.yellowGlow.g, CoD.yellowGlow.b )
	mutables.tierLine:hide()
	mutables:addElement( mutables.tierLine )
	mutables:addElement( mutables.dataCol )
end

CoD.LeagueLeaderboard.GetListBoxHeaderText = function ( leftOffset, rightOffset, text, alignment, rightAnchor )
	local textElem = LUI.UIText.new()
	local rightAnchorValue = false
	if rightAnchor then
		rightAnchorValue = rightAnchor
	end
	textElem:setLeftRight( true, rightAnchorValue, leftOffset, rightOffset )
	textElem:setTopBottom( true, true, 0, 0 )
	if alignment then
		textElem:setAlignment( LUI.Alignment[alignment] )
	end
	textElem:setRGB( CoD.gray.r, CoD.gray.g, CoD.gray.b )
	textElem:setText( text )
	textElem:setFont( CoD.fonts.Default )
	return textElem
end

CoD.LeagueLeaderboard.AddLeaderboardList = function ( self, controller, left, top, bottomOffset, leaderboardListWidth )
	local leaderboardList = LUI.UIElement.new()
	leaderboardList:setLeftRight( true, false, left, left + leaderboardListWidth )
	leaderboardList:setTopBottom( true, true, top, bottomOffset )
	local listBoxTop = 0
	local listBoxHeader = LUI.UIElement.new()
	listBoxHeader:setLeftRight( true, true, 0, 0 )
	listBoxHeader:setTopBottom( true, false, listBoxTop, listBoxTop + CoD.textSize.Default )
	listBoxHeader:addElement( CoD.LeagueLeaderboard.GetListBoxHeaderText( CoD.LeagueLeaderboard.LBRANK_XLEFT, CoD.LeagueLeaderboard.LBRANK_XRIGHT, Engine.Localize( "MENU_RANK" ), "Left" ) )
	if self.numTeamMembersToShow > 1 then
		listBoxHeader:addElement( CoD.LeagueLeaderboard.GetListBoxHeaderText( CoD.LeagueLeaderboard.NAME_XLEFT, CoD.LeagueLeaderboard.NAME_XRIGHT, Engine.Localize( "MENU_TEAM_NAME" ), "Left" ) )
	else
		listBoxHeader:addElement( CoD.LeagueLeaderboard.GetListBoxHeaderText( CoD.LeagueLeaderboard.NAME_XLEFT, CoD.LeagueLeaderboard.NAME_XRIGHT, Engine.Localize( "LEAGUE_SOLO_COMPETITOR" ), "Left" ) )
	end
	listBoxHeader:addElement( CoD.LeagueLeaderboard.GetListBoxHeaderText( CoD.LeagueLeaderboard.NAME_XRIGHT, -10, Engine.Localize( "MENU_RANK_POINTS" ), "Right", true ) )
	leaderboardList:addElement( listBoxHeader )
	local listBoxDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = listBoxTop + CoD.textSize.Default,
		bottom = 0
	}
	self.listBox = CoD.ListBox.new( listBoxDefaultAnimState, controller, 8, 50, leaderboardListWidth, CoD.LeagueLeaderboard.LB_ButtonCreator, CoD.LeagueLeaderboard.LB_ButtonData, 0, 2 )
	leaderboardList:addElement( self.listBox )
	self.listBox:enablePageArrows()
	self:addElement( leaderboardList )
end

local HideAllVariableData = function ( self )
	self.teamEmblemImage:hide()
	self.divisionIcon:hide()
	self.rank:hide()
	self.topTier:hide()
	self.teamName:hide()
	self.wins:hide()
	self.winstreak:hide()
	self.spinner:hide()
	self.teamEmblemImage:hide()
	self.divisionIcon:hide()
	CoD.LeagueLeaderboard.UpdateTeamMemberNames( self )
end

CoD.LeagueLeaderboard.ButtonGainFocus = function ( self, event )
	HideAllVariableData( self )
	if self.selectButton then
		self.selectButton:close()
	end
	self.selectedPlayerXuid = nil
	local mutables = event.mutables
	if not mutables then
		return 
	elseif mutables.teamID then
		local f21_local0 = self.numTeamMembersToShow == 1
		if not f21_local0 then
			self.teamEmblemImage:setupLeagueEmblem( mutables.teamID )
			self.teamEmblemImage:show()
		end
		CoD.LeagueLeaderboard.HighlightedTeamID = mutables.teamID
		CoD.LeagueLeaderboard.HighlightedTeamName = mutables.teamName
		local teamMemberInfo = CoD.LeagueLeaderboard.GetTeamMemberInfoFromCache( mutables.teamID )
		if not teamMemberInfo then
			if self.teamMemberInfoFetchTimer then
				self.teamMemberInfoFetchTimer:close()
			end
			self.teamMemberInfoFetchTimer = LUI.UITimer.new( CoD.LeagueLeaderboard.TeamMemberInfoFetchDelay, "fetch_league_lb_team_member_info", true )
			self:addElement( self.teamMemberInfoFetchTimer )
			if f21_local0 then
				self.teamEmblemSpinner:show()
			else
				self.spinner:show()
			end
		else
			CoD.LeagueLeaderboard.UpdateEmblemsAndNames( self, teamMemberInfo )
		end
	end
	if mutables.teamName then
		self.teamName:setText( mutables.teamName )
		self.teamName:show()
	end
	if mutables.rank then
		self.rank:setText( Engine.Localize( "LEAGUE_RANK", mutables.rank ) )
		self.rank:show()
	end
	if mutables.wins then
		self.wins:setText( mutables.wins )
		self.wins:show()
	end
	self.winstreak:setText( 0 )
	self.winstreak:show()
	if mutables.streak and tonumber( mutables.streak ) > 0 then
		self.winstreak:setText( mutables.streak )
	end
	local currentTeamSubdivisionInfo = CoD.LeaguesData.CurrentTeamSubdivisionInfo
	if currentTeamSubdivisionInfo.divisionID and mutables.rank then
		local divisionIconAndBracketPos = Engine.GetLeagueDivisionIcon( currentTeamSubdivisionInfo.divisionID, false, mutables.rank )
		self.divisionIcon:setImage( divisionIconAndBracketPos.divisionIcon )
		self.divisionIcon:show()
		if divisionIconAndBracketPos.bracketRankPosition > 0 then
			self.topTier:setText( Engine.Localize( "MENU_LEAGUE_TOP_N", divisionIconAndBracketPos.bracketRankPosition ) )
			self.topTier:show()
		end
	end
end

CoD.LeagueLeaderboard.SetupInfoPanel = function ( self, left, top )
	local infoPanel = LUI.UIElement.new()
	infoPanel:setLeftRight( true, true, left, 0 )
	infoPanel:setTopBottom( true, true, top, 0 )
	self:addElement( infoPanel )
	left = 0
	top = 0
	local emblemContainerWidth = 230
	local emblemContainerHeight = 230
	local teamEmblemContainer = LUI.UIElement.new()
	teamEmblemContainer:setLeftRight( true, false, left, left + emblemContainerWidth )
	teamEmblemContainer:setTopBottom( true, false, top, top + emblemContainerHeight )
	teamEmblemContainer:addElement( CoD.GetInformationContainer() )
	infoPanel:addElement( teamEmblemContainer )
	self.teamEmblemSpinner = CoD.GetCenteredImage( 120, 120, "lui_loader" )
	teamEmblemContainer:addElement( self.teamEmblemSpinner )
	self.teamEmblemSpinner:hide()
	local emblemSize = 200
	local teamEmblemImage = CoD.GetCenteredImage( emblemSize, emblemSize )
	self.teamEmblemImage = teamEmblemImage
	teamEmblemImage:hide()
	teamEmblemContainer:addElement( teamEmblemImage )
	left = emblemContainerWidth
	local divisionIconContainer = LUI.UIElement.new()
	divisionIconContainer:setLeftRight( true, true, left, 0 )
	divisionIconContainer:setTopBottom( true, false, top, top + emblemContainerHeight )
	divisionIconContainer:addElement( CoD.GetInformationContainer() )
	infoPanel:addElement( divisionIconContainer )
	top = 20
	local divisionIconSize = 96
	local divisionIcon = CoD.GetCenteredImage( divisionIconSize, divisionIconSize )
	divisionIcon:setTopBottom( true, false, top, top + divisionIconSize )
	self.divisionIcon = divisionIcon
	divisionIcon:hide()
	divisionIconContainer:addElement( divisionIcon )
	top = top + divisionIconSize + 20
	local vert = LUI.UIVerticalList.new()
	vert:setLeftRight( true, true, 0, 0 )
	vert:setTopBottom( true, true, top, 0 )
	divisionIconContainer:addElement( vert )
	local rank = CoD.GetTextElem( "Big", "Center" )
	self.rank = rank
	local topTier = CoD.GetTextElem( "Condensed", "Center", nil, CoD.yellowGlow )
	self.topTier = topTier
	vert:addElement( rank )
	vert:addElement( topTier )
	top = emblemContainerHeight
	local teamNameFontName = "Big"
	local teamInfoContainerHeight = CoD.textSize[teamNameFontName] + 20
	if self.numTeamMembersToShow > 1 then
		teamNameFontName = "Condensed"
		teamInfoContainerHeight = CoD.textSize[teamNameFontName] + self.numTeamMembersToShow * CoD.textSize.Default + 30
	end
	local teamInfoContainer = LUI.UIElement.new()
	teamInfoContainer:setLeftRight( true, true, 0, 0 )
	teamInfoContainer:setTopBottom( true, false, top, top + teamInfoContainerHeight )
	teamInfoContainer:addElement( CoD.GetInformationContainer() )
	infoPanel:addElement( teamInfoContainer )
	local spinnerSize = 32
	local spinner = LUI.UIImage.new( {
		shaderVector0 = {
			0,
			0,
			0,
			0
		}
	} )
	spinner:setLeftRight( false, false, -spinnerSize / 2, spinnerSize / 2 )
	spinner:setTopBottom( true, false, 50, 50 + spinnerSize )
	spinner:setImage( RegisterMaterial( "lui_loader" ) )
	teamInfoContainer:addElement( spinner )
	spinner:hide()
	self.spinner = spinner
	
	local teamInfoVert = LUI.UIVerticalList.new()
	teamInfoVert:setLeftRight( true, true, 0, 0 )
	teamInfoVert:setTopBottom( true, true, 0, 0 )
	teamInfoContainer:addElement( teamInfoVert )
	self.teamInfoVert = teamInfoVert
	
	teamInfoVert:addSpacer( 10 )
	local teamName = CoD.GetTextElem( teamNameFontName, "Center" )
	self.teamName = teamName
	teamInfoVert:addElement( teamName )
	teamInfoVert:addSpacer( 5 )
	local teamMemberNames = {}
	local maxTeamMembers = CoD.LeagueLeaderboard.MaxTeamMembers
	for i = 1, maxTeamMembers, 1 do
		local f22_local2 = i
		local teamMemberName = CoD.GetTextElem( "Default", "Center", "", CoD.gray )
		table.insert( teamMemberNames, teamMemberName )
		teamInfoVert:addElement( teamMemberName )
	end
	self.teamMemberNames = teamMemberNames
	top = top + teamInfoContainerHeight
	local statsContainerHeight = 60
	local statsContainer = LUI.UIElement.new()
	statsContainer:setLeftRight( true, true, 0, 0 )
	statsContainer:setTopBottom( true, false, top, top + statsContainerHeight )
	infoPanel:addElement( statsContainer )
	local width = 198
	local winsContainer = LUI.UIElement.new()
	winsContainer:setLeftRight( true, false, 0, width )
	winsContainer:setTopBottom( true, true, 0, 0 )
	winsContainer:addElement( CoD.GetInformationContainer() )
	statsContainer:addElement( winsContainer )
	local winsVert = LUI.UIVerticalList.new()
	winsVert:setLeftRight( true, true, 0, 0 )
	winsVert:setTopBottom( true, true, 5, 0 )
	winsContainer:addElement( winsVert )
	winsVert:addElement( CoD.GetTextElem( "Default", "Center", Engine.Localize( "MPUI_TOTAL_WINS" ) ) )
	local wins = CoD.GetTextElem( "Default", "Center", "25" )
	self.wins = wins
	winsVert:addElement( wins )
	local winstreaksContainer = LUI.UIElement.new()
	winstreaksContainer:setLeftRight( false, true, -width, 0 )
	winstreaksContainer:setTopBottom( true, true, 0, 0 )
	winstreaksContainer:addElement( CoD.GetInformationContainer() )
	statsContainer:addElement( winstreaksContainer )
	local winstreakVert = LUI.UIVerticalList.new()
	winstreakVert:setLeftRight( true, true, 0, 0 )
	winstreakVert:setTopBottom( true, true, 5, 0 )
	winstreaksContainer:addElement( winstreakVert )
	winstreakVert:addElement( CoD.GetTextElem( "Default", "Center", Engine.Localize( "MENU_LB_WIN_STREAK" ) ) )
	local winstreak = CoD.GetTextElem( "Default", "Center", "3" )
	self.winstreak = winstreak
	winstreakVert:addElement( winstreak )
end

CoD.LeagueLeaderboard.SetupElements = function ( self, controller )
	local subdivisionNameText = ""
	local divisionNameText = ""
	local seasonNameText = ""
	local currentTeamSubdivisionInfo = CoD.LeaguesData.CurrentTeamSubdivisionInfo
	local numTeamMembersToShow = CoD.LeaguesData.numTeamMembersToShow
	local leagueID = CoD.LeaguesData.CurrentLeagueID
	self.numTeamMembersToShow = numTeamMembersToShow
	if currentTeamSubdivisionInfo then
		if currentTeamSubdivisionInfo.divisionName then
			divisionNameText = Engine.ToUpper( CoD.LeaguesData.CurrentTeamSubdivisionInfo.divisionName )
		end
		if currentTeamSubdivisionInfo.subdivisionName then
			subdivisionNameText = Engine.Localize( "MENU_SUBDIVISION_X", CoD.LeaguesData.CurrentTeamSubdivisionInfo.subdivisionName )
		end
	end
	local left = 0
	local top = 0
	local leagueIconWidth = 100
	local leagueIconHeight = 100
	local leagueIconContainer = LUI.UIElement.new()
	leagueIconContainer:setLeftRight( true, false, left, left + leagueIconWidth )
	leagueIconContainer:setTopBottom( true, false, top, top + leagueIconHeight )
	local leagueIcon = CoD.GetStretchedImage()
	leagueIconContainer:addElement( leagueIcon )
	leagueIcon:setImage( RegisterMaterial( currentTeamSubdivisionInfo.leagueIconName .. "_64" ) )
	self:addElement( leagueIconContainer )
	left = left + leagueIconWidth + 10
	local title = CoD.GetTextElem( "Big", "Left", Engine.ToUpper( Engine.Localize( "MENU_MENU_X_LADDER", currentTeamSubdivisionInfo.leagueDesc ) ) )
	title:setLeftRight( true, true, left, 0 )
	self:addElement( title )
	top = top + CoD.textSize.Big + 5
	local divisionName = CoD.GetTextElem( "Condensed", "Left", divisionNameText, nil, top )
	divisionName:setLeftRight( true, true, left, 0 )
	self:addElement( divisionName )
	local textLeft, textTop, textRight, textBottom = GetTextDimensions( divisionNameText, CoD.fonts.Condensed, CoD.textSize.Condensed )
	left = left + textRight - textLeft + 15
	local subdivision = CoD.GetTextElem( "Condensed", "Left", subdivisionNameText, CoD.gray, top )
	subdivision:setLeftRight( true, true, left, 0 )
	self:addElement( subdivision )
	if CoD.LeaguesData.seasonName then
		seasonNameText = CoD.LeaguesData.seasonName
		CoD.LeaguesData.seasonName = nil
	elseif leagueID then
		seasonNameText = Engine.GetLeagueSeasonName( leagueID )
	end
	local seasonName = CoD.GetTextElem( "Condensed", "Right", seasonNameText, CoD.gray, top )
	seasonName:setLeftRight( true, true, left, 0 )
	self:addElement( seasonName )
	top = top + CoD.textSize.Condensed + 25
	local left = 10
	local bottomOffset = -30
	local leaderboardListWidth = 400
	CoD.LeagueLeaderboard.AddLeaderboardList( self, controller, left, top, bottomOffset, leaderboardListWidth )
	CoD.LeagueLeaderboard.SetupInfoPanel( self, leaderboardListWidth + 70, top )
	local buttonGoToTop = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_LB_TOP_OF_LIST" ), self, "lb_jumpToTop", false, nil, false, nil, "T" )
	self:addLeftButtonPrompt( buttonGoToTop )
end

