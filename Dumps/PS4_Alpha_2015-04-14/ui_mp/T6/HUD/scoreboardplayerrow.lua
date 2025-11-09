CoD.ScoreBoardPlayerRow = {}
CoD.ScoreBoardPlayerRow.PlayerListColumnWidth = 75
CoD.ScoreBoardPlayerRow.PlayerListHeaderHeight = 20
CoD.ScoreBoardPlayerRow.PlayerListRowTextHeight = CoD.textSize.ExtraSmall
CoD.ScoreBoardPlayerRow.PlayerListColumnTextWidth = 55
CoD.ScoreBoardPlayerRow.PlayerListRowHeight = CoD.textSize.Default
CoD.ScoreBoardPlayerRow.PlayerListScoreColumnLeftOffset = 300
CoD.ScoreBoardPlayerRow.PlayerListPlayerNameColumnLeftOffset = 55
CoD.ScoreBoardPlayerRow.PlayerListAlpha = 0.7
CoD.ScoreBoardPlayerRow.LeaderBoardColumnCount = 5
CoD.ScoreBoardPlayerRow.ClientPingWidth = 60
CoD.ScoreBoardPlayerRow.RankImageContainerOffset = 20
CoD.ScoreBoardPlayerRow.StausImageContainerOffset = 45
CoD.ScoreBoardPlayerRow.PingBarCount = 4
CoD.ScoreBoardPlayerRow.RedPingColor = {}
CoD.ScoreBoardPlayerRow.RedPingColor.r = 0.7
CoD.ScoreBoardPlayerRow.RedPingColor.g = 0.1
CoD.ScoreBoardPlayerRow.RedPingColor.b = 0.1
CoD.ScoreBoardPlayerRow.YellowPingColor = {}
CoD.ScoreBoardPlayerRow.YellowPingColor.r = 0.7
CoD.ScoreBoardPlayerRow.YellowPingColor.g = 0.7
CoD.ScoreBoardPlayerRow.YellowPingColor.b = 0.1
CoD.ScoreBoardPlayerRow.GreenPingColor = {}
CoD.ScoreBoardPlayerRow.GreenPingColor.r = 0.1
CoD.ScoreBoardPlayerRow.GreenPingColor.g = 0.7
CoD.ScoreBoardPlayerRow.GreenPingColor.b = 0.1
CoD.ScoreBoardPlayerRow.TextSelfColor = {}
CoD.ScoreBoardPlayerRow.TextSelfColor.r = 1
CoD.ScoreBoardPlayerRow.TextSelfColor.g = 1
CoD.ScoreBoardPlayerRow.TextSelfColor.b = 0.2
CoD.ScoreBoardPlayerRow.TextColor = {}
CoD.ScoreBoardPlayerRow.TextColor.r = 1
CoD.ScoreBoardPlayerRow.TextColor.g = 1
CoD.ScoreBoardPlayerRow.TextColor.b = 1
CoD.ScoreBoardPlayerArrayRow = {}
local ScoreBoard_AddContainer = function ( defaultAnimationState, container )
	local newContainer = LUI.UIElement.new( defaultAnimationState )
	container:addElement( newContainer )
	return newContainer
end

local ScoreBoard_AddScoreBoardColumn = function ( newRowContainer, index )
	local scoreContainerDefaultAnimState = {
		leftAnchor = false,
		rightAnchor = true,
		left = -(CoD.ScoreBoardPlayerRow.PlayerListColumnWidth * (CoD.ScoreBoardPlayerRow.LeaderBoardColumnCount - index) + CoD.ScoreBoardPlayerRow.ClientPingWidth),
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	}
	local scoreContainer = ScoreBoard_AddContainer( scoreContainerDefaultAnimState, newRowContainer )
	newRowContainer:addElement( scoreContainer )
	return scoreContainer
end

local ScoreBoard_CreateText = function ( state, container, text )
	local textElement = LUI.UIText.new( state )
	container:addElement( textElement )
	container.textElement = textElement
	
	container.textElementText = text
	textElement:setText( text )
end

local ScoreBoard_TextExists = function ( container )
	return container.textElement ~= nil
end

local ScoreBoard_UpdateText = function ( state, container, text )
	if container.textElementText == text then
		return 
	elseif ScoreBoard_TextExists( container ) then
		container.textElement:setText( text )
		container.textElementText = text
		return 
	else
		ScoreBoard_CreateText( state, container, text )
	end
end

local ScoreBoard_UpdateScoreBoardColumn = function ( scoreContainer, columnVariable, color )
	local columnState = nil
	if not ScoreBoard_TextExists( scoreContainer ) then
		columnState = {
			leftAnchor = true,
			rightAnchor = false,
			left = -CoD.ScoreBoardPlayerRow.PlayerListColumnTextWidth / 2,
			right = CoD.ScoreBoardPlayerRow.PlayerListColumnTextWidth / 2,
			topAnchor = false,
			bottomAnchor = false,
			top = -CoD.ScoreBoardPlayerRow.PlayerListRowTextHeight / 2,
			bottom = CoD.ScoreBoardPlayerRow.PlayerListRowTextHeight / 2,
			red = color.r,
			green = color.g,
			blue = color.b,
			font = CoD.fonts.ExtraSmall,
			alignment = LUI.Alignment.Right
		}
		scoreContainer.color = color
	elseif scoreContainer.color ~= color then
		scoreContainer.textElement:setRGB( color.r, color.g, color.b )
		scoreContainer.color = color
	end
	ScoreBoard_UpdateText( columnState, scoreContainer, columnVariable )
end

function ScoreBoard_CreateScoreBoardTeamTitle( controller, teamCount )
	local newRowContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = -(CoD.ScoreBoardPlayerRow.PlayerListRowTextHeight / 2),
		bottom = CoD.ScoreBoardPlayerRow.PlayerListRowTextHeight / 2
	} )
	local playerNameContainer = ScoreBoard_AddContainer( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = 280,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	}, newRowContainer )
	local listHeight, columnTitle, columnIndex = nil
	for columnIndex = 1, CoD.ScoreBoardPlayerRow.LeaderBoardColumnCount, 1 do
		columnTitle = Engine.GetScoreBoardColumnName( controller, columnIndex - 1 )
		local column = ScoreBoard_AddScoreBoardColumn( newRowContainer, columnIndex )
		ScoreBoard_UpdateScoreBoardColumn( column, Engine.Localize( columnTitle ), CoD.ScoreBoardPlayerRow.TextColor )
	end
	return newRowContainer
end

function ScoreBoard_UpdateScoreBoardTeamTitle( controller, teamName, teamCount, playerNameContainer )
	local displayString = Engine.Localize( teamName ) .. " ( " .. teamCount .. " ) "
	if ScoreBoard_TextExists( playerNameContainer ) then
		ScoreBoard_UpdateText( nil, playerNameContainer, displayString )
	else
		ScoreBoard_UpdateText( {
			leftAnchor = true,
			rightAnchor = true,
			left = 0,
			right = 0,
			topAnchor = false,
			bottomAnchor = false,
			top = -CoD.ScoreBoardPlayerRow.PlayerListRowTextHeight / 2,
			bottom = CoD.ScoreBoardPlayerRow.PlayerListRowTextHeight / 2,
			font = CoD.fonts.ExtraSmall,
			alignment = LUI.Alignment.Left
		}, playerNameContainer, displayString )
	end
end

function ScoreBoard_CreateVerticalPlayerList( playerListContainer, playerListY )
	local playerListHeight = CoD.ScoreBoardPlayerRow.PlayerListRowHeight
	playerListContainer.verticalPlayerList = LUI.UIVerticalList.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0,
		spacing = 0
	} )
	playerListContainer:addElement( playerListContainer.verticalPlayerList )
end

function ScoreBoard_AddPlayerList( controller, playerListData, verticalPlayerList, teamID )
	local listHeight = 0
	if CoD.ScoreBoardPlayerArrayRow[teamID] == nil then
		CoD.ScoreBoardPlayerArrayRow[teamID] = {}
	end
	local teamName = ""
	if teamID ~= Enum.team_t.TEAM_FREE then
		teamName = CoD.GetTeamName( teamID )
	end
	if verticalPlayerList.teamTitleRow == nil then
		verticalPlayerList.teamTitleRow = {}
	end
	verticalPlayerList.teamTitleRow[teamID] = ScoreBoard_CreateScoreBoardTeamTitle( controller, #playerListData )
	verticalPlayerList:addElement( verticalPlayerList.teamTitleRow[teamID] )
	verticalPlayerList.teamTitleRow[teamID]:makeNotFocusable()
	if playerListData ~= nil and 0 < #playerListData then
		for index, row in pairs( playerListData ) do
			local playerRow = ScoreBoard_CreateScoreBoardPlayerListRow( controller, index, teamID )
			playerRow.teamID = teamID
			playerRow:makeFocusable()
			verticalPlayerList:addElement( playerRow )
			CoD.ScoreBoardPlayerArrayRow[teamID][index] = playerRow
		end
	end
end

function ScoreBoard_UpdatePlayerList( controller, playerListData, playerListContainer, teamID )
	local playerListHeight = #playerListData * CoD.ScoreBoardPlayerRow.PlayerListRowHeight
	local teamName = ""
	if teamID ~= Enum.team_t.TEAM_FREE then
		teamName = CoD.GetTeamName( teamID )
	end
	ScoreBoard_UpdateScoreBoardTeamTitle( controller, teamName, #playerListData, playerListContainer.verticalPlayerList.teamTitleRow[teamID] )
	if #CoD.ScoreBoardPlayerArrayRow[teamID] < #playerListData then
		local playerCount = #CoD.ScoreBoardPlayerArrayRow[teamID]
		for index = playerCount + 1, #playerListData, 1 do
			local playerRow = ScoreBoard_CreateScoreBoardPlayerListRow( controller, index, teamID )
			playerRow.teamID = teamID
			local lastElement = CoD.ScoreBoardPlayerArrayRow[teamID][index - 1]
			if lastElement == nil then
				lastElement = playerListContainer.verticalPlayerList.teamTitleRow[teamID]
			end
			playerRow:addElementAfter( lastElement )
			playerRow:makeFocusable()
			CoD.ScoreBoardPlayerArrayRow[teamID][index] = playerRow
		end
	elseif #playerListData < #CoD.ScoreBoardPlayerArrayRow[teamID] then
		local deletedRowWithFocus = false
		local playerCount = #CoD.ScoreBoardPlayerArrayRow[teamID]
		for index = #playerListData + 1, playerCount, 1 do
			if CoD.ScoreBoardPlayerArrayRow[teamID][index].highlighted == true then
				deletedRowWithFocus = true
			end
			CoD.ScoreBoardPlayerArrayRow[teamID][index]:close()
		end
		for index = #playerListData + 1, playerCount, 1 do
			CoD.ScoreBoardPlayerArrayRow[teamID][index] = nil
		end
		if deletedRowWithFocus == true then
			playerListContainer.verticalPlayerList:processEvent( {
				name = "gain_focus"
			} )
		end
	end
	for index, f11_local2 in pairs( playerListData ) do
		if teamID == CoD.ScoreBoardPlayerArrayRow[teamID][index].teamID then
			ScoreBoard_UpdateScoreBoardPlayerListRow( controller, CoD.ScoreBoardPlayerArrayRow[teamID][index], playerListData[index], index )
		end
	end
end

local ScoreBoard_CreatePlayerTeamBg = function ( index, team, newRowContainer, rowBackgroundMaterial )
	local faction = CoD.GetFaction()
	local color = CoD.GetFactionColor( faction, team )
	local bgColor = {}
	local darkRowMultiplier = 0.75
	if index % 2 == 1 then
		bgColor.r = color.r * darkRowMultiplier
		bgColor.g = color.g * darkRowMultiplier
		bgColor.b = color.b * darkRowMultiplier
	else
		bgColor.r = color.r
		bgColor.g = color.g
		bgColor.b = color.b
	end
	bgColor.a = CoD.ScoreBoardPlayerRow.PlayerListAlpha
	local newRowBackground = LUI.UIImage.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = CoD.ChooseTeam.PlayerListRowHeight,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false,
		red = bgColor.r,
		green = bgColor.g,
		blue = bgColor.b,
		alpha = bgColor.a,
		material = rowBackgroundMaterial
	} )
	newRowContainer:addElement( newRowBackground )
end

local ScoreBoard_CreatePlayerListRowBg = function ( controller, newRowContainer, index, team )
	local newRowBackground, rowBackgroundMaterial = nil
	if CoD.isZombie == true then
		rowBackgroundMaterial = RegisterMaterial( "scorebar_zom_long_1" )
	end
	ScoreBoard_CreatePlayerTeamBg( index, team, newRowContainer, rowBackgroundMaterial )
	local rankWidth = 50
	local rankBackground = LUI.UIImage.new( {
		left = 0,
		top = 0,
		right = rankWidth,
		bottom = CoD.ChooseTeam.PlayerListRowHeight,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 0.1
	} )
	newRowContainer:addElement( rankBackground )
end

local ScoreBoard_AddClientPingBar = function ( container, index )
	local pingWidth = 5
	local pingHeight = CoD.ScoreBoardPlayerRow.PlayerListRowTextHeight
	local horizontalspacer = 2
	local verticalspacer = -2
	local smallPingHeight = pingHeight / 4
	local barAlpha = 0.75
	local offset = (pingWidth + horizontalspacer) * -index
	local clientPingBarMaterial = CoD.GameStatus.GameStatusBackgroundBottomMaterial
	local clientPingBar = LUI.UIImage.new( {
		left = offset - pingWidth / 2,
		top = smallPingHeight * index + verticalspacer,
		right = offset + pingWidth / 2,
		bottom = 0,
		leftAnchor = false,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		red = 0,
		green = 0,
		blue = 0,
		alpha = 0,
		material = clientPingBarMaterial
	} )
	container:addElement( clientPingBar )
	local hiddenState = {
		alpha = 0
	}
	clientPingBar:registerAnimationState( "bar_4", {
		red = CoD.ScoreBoardPlayerRow.GreenPingColor.r,
		green = CoD.ScoreBoardPlayerRow.GreenPingColor.g,
		blue = CoD.ScoreBoardPlayerRow.GreenPingColor.b,
		alpha = barAlpha
	} )
	if index < 2 then
		clientPingBar:registerAnimationState( "bar_1", {
			red = CoD.ScoreBoardPlayerRow.RedPingColor.r,
			green = CoD.ScoreBoardPlayerRow.RedPingColor.g,
			blue = CoD.ScoreBoardPlayerRow.RedPingColor.b,
			alpha = barAlpha
		} )
	else
		clientPingBar:registerAnimationState( "bar_1", hiddenState )
	end
	if index < 3 then
		clientPingBar:registerAnimationState( "bar_2", {
			red = CoD.ScoreBoardPlayerRow.YellowPingColor.r,
			green = CoD.ScoreBoardPlayerRow.YellowPingColor.g,
			blue = CoD.ScoreBoardPlayerRow.YellowPingColor.b,
			alpha = barAlpha
		} )
	else
		clientPingBar:registerAnimationState( "bar_2", hiddenState )
	end
	if index < 4 then
		clientPingBar:registerAnimationState( "bar_3", {
			red = CoD.ScoreBoardPlayerRow.GreenPingColor.r,
			green = CoD.ScoreBoardPlayerRow.GreenPingColor.g,
			blue = CoD.ScoreBoardPlayerRow.GreenPingColor.b,
			alpha = barAlpha
		} )
	else
		clientPingBar:registerAnimationState( "bar_3", hiddenState )
	end
	container.clientPingBar = clientPingBar
	return clientPingBar
end

local ScoreBoard_GetClientPingColor = function ( ping )
	local color = CoD.ScoreBoardPlayerRow.GreenPingColor
	if ping > 200 then
		color = CoD.ScoreBoardPlayerRow.RedPingColor
	elseif ping > 100 then
		color = CoD.ScoreBoardPlayerRow.YellowPingColor
	end
	return color
end

local ScoreBoard_AddClientPingInfo = function ( newRowContainer )
	local clientPingInfo = {}
	local pingBarCount = CoD.ScoreBoardPlayerRow.PingBarCount
	for i = 1, pingBarCount, 1 do
		clientPingInfo[i] = ScoreBoard_AddClientPingBar( newRowContainer, i )
	end
	newRowContainer.clientPingInfo = clientPingInfo
end

local ScoreBoard_UpdateClientPingInfo = function ( newRowContainer, ping )
	local color = CoD.ScoreBoardPlayerRow.GreenPingColor
	local pingAnimationName = "bar_4"
	if ping > 199 then
		if ping > 299 then
			pingAnimationName = "bar_1"
		else
			pingAnimationName = "bar_2"
		end
	elseif ping > 99 then
		pingAnimationName = "bar_3"
	end
	if newRowContainer.pingAnimationName ~= pingAnimationName then
		newRowContainer.pingAnimationName = pingAnimationName
		for index, clientPingInfo in ipairs( newRowContainer.clientPingInfo ) do
			clientPingInfo:animateToState( pingAnimationName )
		end
	end
end

function ScoreBoard_PlayerListRowGainFocus( self, event )
	self.opticalBorder:animateToState( "enabled" )
	self.highlighted = true
	return LUI.UIButton.gainFocus( self, event )
end

function ScoreBoard_PlayerListRowLoseFocus( self, event )
	self.opticalBorder:animateToState( "disabled" )
	self.highlighted = false
	LUI.UIButton.loseFocus( self, event )
end

function ScoreBoard_CreateScoreBoardPlayerListRow( controller, index, team )
	local newRowContainer = LUI.UIElement.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = CoD.ScoreBoardPlayerRow.PlayerListRowHeight,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = false
	} )
	newRowContainer:registerEventHandler( "gain_focus", ScoreBoard_PlayerListRowGainFocus )
	newRowContainer:registerEventHandler( "lose_focus", ScoreBoard_PlayerListRowLoseFocus )
	ScoreBoard_CreatePlayerListRowBg( controller, newRowContainer, index, team )
	local rankContainer = ScoreBoard_AddContainer( {
		left = 0,
		top = 0,
		right = 20,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = true
	}, newRowContainer )
	newRowContainer.rankContainer = rankContainer
	local rankImageContainer = ScoreBoard_AddContainer( {
		left = CoD.ScoreBoardPlayerRow.RankImageContainerOffset,
		top = 0,
		right = CoD.ScoreBoardPlayerRow.RankImageContainerOffset + CoD.ScoreBoardPlayerRow.PlayerListHeaderHeight,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = true
	}, newRowContainer )
	newRowContainer.rankImageContainer = rankImageContainer
	local statusImageContainer = ScoreBoard_AddContainer( {
		left = CoD.ScoreBoardPlayerRow.StausImageContainerOffset,
		top = 0,
		right = CoD.ScoreBoardPlayerRow.StausImageContainerOffset + CoD.ScoreBoardPlayerRow.PlayerListHeaderHeight,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = true
	}, newRowContainer )
	newRowContainer.statusImageContainer = statusImageContainer
	local playerNameContainer = ScoreBoard_AddContainer( {
		left = CoD.ScoreBoardPlayerRow.PlayerListPlayerNameColumnLeftOffset + CoD.ScoreBoardPlayerRow.PlayerListHeaderHeight,
		top = 0,
		right = 280,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = true
	}, newRowContainer )
	newRowContainer.playerNameContainer = playerNameContainer
	newRowContainer.scoreColumn1 = ScoreBoard_AddScoreBoardColumn( newRowContainer, 1 )
	newRowContainer.scoreColumn2 = ScoreBoard_AddScoreBoardColumn( newRowContainer, 2 )
	newRowContainer.scoreColumn3 = ScoreBoard_AddScoreBoardColumn( newRowContainer, 3 )
	newRowContainer.scoreColumn4 = ScoreBoard_AddScoreBoardColumn( newRowContainer, 4 )
	newRowContainer.scoreColumn5 = ScoreBoard_AddScoreBoardColumn( newRowContainer, 5 )
	ScoreBoard_AddClientPingInfo( newRowContainer )
	
	local opticalBorder = CoD.BorderT6.new( 2, 1, 1, 1, 0 )
	opticalBorder:registerAnimationState( "disabled", {
		alpha = 0
	} )
	opticalBorder:registerAnimationState( "enabled", {
		alpha = 1
	} )
	newRowContainer:addElement( opticalBorder )
	newRowContainer.opticalBorder = opticalBorder
	
	return newRowContainer
end

function ScoreBoard_UpdateScoreBoardPlayerListRow( controller, rowContainer, row, index )
	local color = nil
	if CoD.isZombie == true then
		color = CoD.Zombie.PlayerColors[(index - 1) % 4 + 1]
	else
		color = CoD.ScoreBoardPlayerRow.TextColor
		if row.isSelf then
			color = CoD.ScoreBoardPlayerRow.TextSelfColor
		end
		if ScoreBoard_TextExists( rowContainer.rankContainer ) then
			ScoreBoard_UpdateText( nil, rowContainer.rankContainer, row.rank )
		else
			ScoreBoard_UpdateText( {
				left = 5,
				top = -CoD.ScoreBoardPlayerRow.PlayerListRowTextHeight / 2,
				right = 0,
				bottom = CoD.ScoreBoardPlayerRow.PlayerListRowTextHeight / 2,
				leftAnchor = true,
				topAnchor = false,
				rightAnchor = true,
				bottomAnchor = false,
				font = CoD.fonts.ExtraSmall,
				alignment = LUI.Alignment.Left
			}, rowContainer.rankContainer, row.rank )
		end
	end
	if rowContainer.rankIconMaterial ~= row.rankIcon then
		rowContainer.rankIconMaterial = row.rankIcon
		if rowContainer.rankIconImage then
			rowContainer.rankIconImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
			rowContainer.rankIconImage:setImage( rowContainer.rankIconMaterial )
		else
			local rankIconImage = LUI.UIImage.new( {
				left = 0,
				top = -CoD.ScoreBoardPlayerRow.PlayerListRowTextHeight / 2,
				right = 0,
				bottom = CoD.ScoreBoardPlayerRow.PlayerListRowTextHeight / 2,
				leftAnchor = true,
				topAnchor = false,
				rightAnchor = true,
				bottomAnchor = false,
				material = LUI.UIImage.GetCachedMaterial( "ui_normal" ),
				image = row.rankIcon
			} )
			rowContainer.rankImageContainer:addElement( rankIconImage )
			rowContainer.rankIconImage = rankIconImage
		end
	end
	if rowContainer.statusIconMaterial ~= row.statusIcon then
		if rowContainer.statusIconImage then
			if not rowContainer.statusIconMaterial then
				rowContainer.statusIconImage:animateToState( "show" )
			elseif not row.statusIcon then
				rowContainer.statusIconImage:animateToState( "hide" )
			end
			rowContainer.statusIconImage:setImage( row.statusIcon )
		else
			local statusIconImage = LUI.UIImage.new( {
				left = 0,
				top = -CoD.ScoreBoardPlayerRow.PlayerListRowTextHeight / 2,
				right = 0,
				bottom = CoD.ScoreBoardPlayerRow.PlayerListRowTextHeight / 2,
				leftAnchor = true,
				topAnchor = false,
				rightAnchor = true,
				bottomAnchor = false,
				material = row.statusIcon,
				alpha = 1
			} )
			statusIconImage:registerAnimationState( "hide", {
				alpha = 0
			} )
			statusIconImage:registerAnimationState( "show", {
				alpha = 1
			} )
			rowContainer.statusImageContainer:addElement( statusIconImage )
			rowContainer.statusIconImage = statusIconImage
		end
		rowContainer.statusIconMaterial = row.statusIcon
	end
	local playerNameContainer = rowContainer.playerNameContainer
	if ScoreBoard_TextExists( playerNameContainer ) then
		ScoreBoard_UpdateText( nil, playerNameContainer, row.playerName )
		if playerNameContainer.color ~= color then
			playerNameContainer.textElement:setRGB( color.r, color.g, color.b )
			playerNameContainer.color = color
		end
	else
		ScoreBoard_UpdateText( {
			left = 0,
			top = -CoD.ScoreBoardPlayerRow.PlayerListRowTextHeight / 2,
			right = 0,
			bottom = CoD.ScoreBoardPlayerRow.PlayerListRowTextHeight / 2,
			leftAnchor = true,
			topAnchor = false,
			rightAnchor = true,
			bottomAnchor = false,
			font = CoD.fonts.ExtraSmall,
			alignment = LUI.Alignment.Left,
			red = color.r,
			green = color.g,
			blue = color.b
		}, playerNameContainer, row.playerName )
		playerNameContainer.color = color
	end
	ScoreBoard_UpdateScoreBoardColumn( rowContainer.scoreColumn1, row.scoreBoardColumn1, color )
	ScoreBoard_UpdateScoreBoardColumn( rowContainer.scoreColumn2, row.scoreBoardColumn2, color )
	ScoreBoard_UpdateScoreBoardColumn( rowContainer.scoreColumn3, row.scoreBoardColumn3, color )
	ScoreBoard_UpdateScoreBoardColumn( rowContainer.scoreColumn4, row.scoreBoardColumn4, color )
	ScoreBoard_UpdateScoreBoardColumn( rowContainer.scoreColumn5, row.scoreBoardColumn5, color )
	ScoreBoard_UpdateClientPingInfo( rowContainer, row.ping )
end

