CoD.LeaderboardPreviewList = {}
CoD.LeaderboardPreviewList.RowHeight = CoD.textSize.ExtraSmall
CoD.LeaderboardPreviewList.ColumnSpacing = 3
CoD.LeaderboardPreviewList.RowSpacing = 5
CoD.LeaderboardPreviewList.MaxItems = 5
CoD.LeaderboardPreviewList.RankIconColumn = 2
CoD.LeaderboardPreviewList.RankColumn = 3
CoD.LeaderboardPreviewList.GamertagColumn = 4
local LeaderboardPreviewList_FindIndicesForDataDisplay = function ( self, leaderboardData, selfGamertag, indices )
	local selfGamertagInData = false
	local selfGamertagIndex, startIndex, endIndex = nil
	if not leaderboardData then
		return 
	elseif leaderboardData and #leaderboardData < self.maxItems then
		startIndex = 1
		endIndex = #leaderboardData
	end
	for index, dataRow in ipairs( leaderboardData ) do
		if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) == true and selfGamertag == dataRow.teamName then
			selfGamertagInData = true
			selfGamertagIndex = index
		else
			for colIndex, dataCol in ipairs( dataRow ) do
				if colIndex == CoD.LeaderboardPreviewList.GamertagColumn and selfGamertag == dataCol.col then
					selfGamertagInData = true
					selfGamertagIndex = index
					break
				end
			end
		end
		if selfGamertagInData == true then
			break
		end
	end
	if startIndex == nil then
		if selfGamertagIndex == nil then
			startIndex = 1
			endIndex = startIndex + 4
		else
			startIndex = selfGamertagIndex - 2
			if startIndex <= 0 then
				startIndex = 1
			end
			endIndex = startIndex + 4
			if #leaderboardData < endIndex then
				startIndex = #leaderboardData - 4
				endIndex = #leaderboardData
				if startIndex <= 0 then
					startIndex = 1
				end
			end
		end
	end
	indices.startIndex = startIndex
	indices.endIndex = endIndex
	indices.selfGamertagIndex = selfGamertagIndex
end

local LeaderboardPreviewList_League_SetupElements = function ( self, controller )
	local leaderboardData = Engine.GetLeagueLbData( controller )
	local selfGamertag = Engine.GetLeagueTeamName( controller )
	local indices = {}
	self:removeAllChildren()
	LeaderboardPreviewList_FindIndicesForDataDisplay( self, leaderboardData, selfGamertag, indices )
	local rowHeight = self.elementHeight
	if not indices.startIndex or not indices.endIndex then
		return 
	end
	for f2_local0 = indices.startIndex, indices.endIndex, 1 do
		local red = CoD.offWhite.r
		local green = CoD.offWhite.g
		local blue = CoD.offWhite.b
		local margin = 10
		local columnSpacing = 40
		local rankLeft = 8
		local nameLeft = 60
		local iconLeft = 60
		if indices.selfGamertagIndex and f2_local0 == indices.selfGamertagIndex then
			red = CoD.yellowGlow.r
			green = CoD.yellowGlow.g
			blue = CoD.yellowGlow.b
		end
		local dataRow = leaderboardData[f2_local0]
		local rowContainer = LUI.UIElement.new()
		rowContainer:setLeftRight( true, true, 0, 0 )
		rowContainer:setTopBottom( true, false, 0, rowHeight )
		local row = LUI.UIElement.new( {
			left = margin,
			top = 0,
			right = 0,
			bottom = 0,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = true,
			bottomAnchor = true
		} )
		row.rankText = LUI.UITightText.new()
		row.rankText:setLeftRight( true, false, rankLeft, 0 )
		row.rankText:setTopBottom( false, false, -CoD.textSize.Default / 2, CoD.textSize.Default / 2 )
		row.rankText:setFont( CoD.fonts.Default )
		row.rankText:setRGB( red, green, blue )
		row.rankText:setText( dataRow.rank )
		local iconsize = 46
		row.icon = LUI.UIImage.new()
		row.icon:setLeftRight( true, false, iconLeft, iconLeft + iconsize )
		row.icon:setTopBottom( false, false, -iconsize / 2, iconsize / 2 )
		row.icon:setupLeagueEmblem( dataRow.teamID )
		row.gamerTag = LUI.UIText.new()
		row.gamerTag:setLeftRight( true, false, nameLeft, 0 )
		row.gamerTag:setTopBottom( false, false, -CoD.textSize.Default / 2, CoD.textSize.Default / 2 )
		row.gamerTag:setFont( CoD.fonts.Default )
		row.gamerTag:setRGB( red, green, blue )
		row.gamerTag:setText( dataRow.teamName )
		rowContainer.dataText = LUI.UIText.new()
		rowContainer.dataText:setLeftRight( true, true, 0, -margin )
		rowContainer.dataText:setTopBottom( false, false, -CoD.textSize.Default / 2, CoD.textSize.Default / 2 )
		rowContainer.dataText:setFont( CoD.fonts.Default )
		rowContainer.dataText:setAlignment( LUI.Alignment.Right )
		rowContainer.dataText:setRGB( red, green, blue )
		rowContainer.dataText:setText( dataRow.rating )
		row:addElement( row.rankText )
		row:addElement( row.gamerTag )
		rowContainer:addElement( CoD.GetInformationContainer() )
		rowContainer:addElement( row )
		rowContainer:addElement( rowContainer.dataText )
		self:addElement( rowContainer )
	end
end

local LeaderboardPreviewList_SetupElements = function ( self, controller )
	local leaderboardData = Engine.GetLeaderboardData( event.controller )
	if leaderboardData == nil or #leaderboardData == 0 then
		DebugPrint( "No leaderboard data." )
		return 
	end
	local header = LUI.UIElement.new()
	header:setLeftRight( true, true, 0, 0 )
	header:setTopBottom( true, false, 0, CoD.LeaderboardPreviewList.RowHeight )
	header.titleText = LUI.UITightText.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		red = 1,
		green = 1,
		blue = 1,
		alpha = 1,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		font = CoD.fonts.Default,
		alignment = LUI.Alignment.Left
	} )
	header.titleText:setText( Engine.Localize( "MENU_FRIEND" ) )
	header:addElement( header.titleText )
	header.dataTitleText = LUI.UITightText.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		red = 1,
		green = 1,
		blue = 1,
		alpha = 1,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		font = CoD.fonts.Default,
		alignment = LUI.Alignment.Right
	} )
	header.dataTitleText:setText( Engine.Localize( "MENU_KILLS_CAPS" ) )
	header:addElement( header.dataTitleText )
	self:addElement( header )
	self:addSpacer( CoD.LeaderboardPreviewList.RowSpacing )
	local selfGamertag = Engine.GetSelfGamertag()
	local indices = {}
	LeaderboardPreviewList_FindIndicesForDataDisplay( self, leaderboardData, selfGamertag, indices )
	for f3_local0 = indices.startIndex, indices.endIndex, 1 do
		local dataRow = leaderboardData[f3_local0]
		local rowContainer = LUI.UIElement.new()
		rowContainer:setLeftRight( true, true, 0, 0 )
		rowContainer:setTopBottom( true, false, 0, CoD.LeaderboardPreviewList.RowHeight )
		local row = LUI.UIHorizontalList.new( {
			left = 0,
			top = 0,
			right = 0,
			bottom = 0,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = true,
			bottomAnchor = true
		} )
		for colIndex, dataCol in ipairs( dataRow ) do
			if colIndex == CoD.LeaderboardPreviewList.RankIconColumn then
				row.rankIcon = LUI.UIImage.new( {
					left = 0,
					top = 0,
					right = 30,
					bottom = 0,
					leftAnchor = true,
					topAnchor = true,
					rightAnchor = false,
					bottomAnchor = true,
					alpha = 1,
					material = RegisterMaterial( dataCol.col )
				} )
			end
			if colIndex == CoD.LeaderboardPreviewList.RankColumn then
				row.rankText = LUI.UITightText.new( {
					left = 0,
					top = 0,
					right = 0,
					bottom = 0,
					red = 1,
					green = 1,
					blue = 1,
					alpha = 1,
					leftAnchor = true,
					topAnchor = true,
					rightAnchor = false,
					bottomAnchor = true,
					font = CoD.fonts.Default
				} )
				row.rankText:setText( dataCol.col )
			end
			if colIndex == CoD.LeaderboardPreviewList.GamertagColumn then
				row.gamerTag = LUI.UITightText.new( {
					left = 0,
					top = 0,
					right = 0,
					bottom = 0,
					red = 1,
					green = 1,
					blue = 1,
					alpha = 1,
					leftAnchor = true,
					topAnchor = true,
					rightAnchor = false,
					bottomAnchor = true,
					font = CoD.fonts.Default
				} )
				row.gamerTag:setText( dataCol.col )
			end
			if colIndex == self.leaderBoardColumn then
				rowContainer.dataText = LUI.UIText.new( {
					left = 0,
					top = 0,
					right = 0,
					bottom = 0,
					red = 1,
					green = 1,
					blue = 1,
					alpha = 1,
					leftAnchor = true,
					topAnchor = true,
					rightAnchor = true,
					bottomAnchor = true,
					font = CoD.fonts.Default,
					alignment = LUI.Alignment.Right
				} )
				rowContainer.dataText:setText( dataCol.col )
			end
		end
		row:addElement( row.rankText )
		row:addSpacer( CoD.LeaderboardPreviewList.ColumnSpacing )
		row:addElement( row.rankIcon )
		row:addSpacer( CoD.LeaderboardPreviewList.ColumnSpacing )
		row:addElement( row.gamerTag )
		row:addSpacer( CoD.LeaderboardPreviewList.ColumnSpacing )
		rowContainer:addElement( row )
		rowContainer:addElement( rowContainer.dataText )
		self:addElement( rowContainer )
		self:addElement( LUI.UIImage.new( {
			left = 0,
			top = 0,
			right = 0,
			bottom = 2,
			red = 1,
			green = 1,
			blue = 1,
			alpha = 0.5,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = true,
			bottomAnchor = false
		} ) )
		self:addSpacer( CoD.LeaderboardPreviewList.RowSpacing )
	end
end

local LeaderboardPreviewList_Update = function ( self, event )
	if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) == true then
		LeaderboardPreviewList_League_SetupElements( self, event.controller )
	else
		LeaderboardPreviewList_SetupElements( self, event.controller )
	end
end

local LeaderboardPreviewList_RefreshLeague = function ( self, event )
	local numResults = 10
	if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) == true then
		local leagueStats = Engine.GetLeagueStats( event.controller )
		if leagueStats.teamID ~= nil then
			Engine.Exec( event.controller, "leagueFetchLbData " .. leagueStats.subdivisionID .. " " .. numResults .. " " .. leagueStats.teamID )
		end
	end
end

CoD.LeaderboardPreviewList.new = function ( controller, defaultAnimationState, maxItems, elementHeight, subdivisionID, teamID, alreadyHaveData )
	local leaderboardPreviewList = LUI.UIVerticalList.new( defaultAnimationState )
	leaderboardPreviewList.maxItems = CoD.LeaderboardPreviewList.MaxItems
	if maxItems ~= nil then
		leaderboardPreviewList.maxItems = maxItems
	end
	if elementHeight ~= nil then
		leaderboardPreviewList.elementHeight = elementHeight
	end
	leaderboardPreviewList.id = "LeaderboardPreviewList"
	leaderboardPreviewList:registerEventHandler( "leaderboardlist_update", LeaderboardPreviewList_Update )
	leaderboardPreviewList:registerEventHandler( "league_lb_data_fetched", LeaderboardPreviewList_Update )
	leaderboardPreviewList:registerEventHandler( "league_changed", LeaderboardPreviewList_RefreshLeague )
	local numResults = 10
	if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) and not alreadyHaveData then
		local currTeamID, currSubdivisionID = nil
		if teamID then
			currTeamID = teamID
		end
		if subdivisionID then
			currSubdivisionID = subdivisionID
		end
		local leagueStats = Engine.GetLeagueStats( controller )
		if leagueStats and not currTeamID and not currSubdivisionID then
			currTeamID = leagueStats.teamID
			currSubdivisionID = leagueStats.subdivisionID
		end
		if leagueStats.teamID ~= nil then
			Engine.Exec( controller, "leagueFetchLbData " .. leagueStats.subdivisionID .. " " .. numResults .. " " .. leagueStats.teamID )
		end
	end
	return leaderboardPreviewList
end

