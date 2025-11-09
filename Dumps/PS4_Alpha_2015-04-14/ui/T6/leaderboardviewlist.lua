require( "T6.Menus.AARUtility" )

CoD.LeaderboardViewList = {}
CoD.LeaderboardViewList.TopThreeColumnWidth = {}
CoD.LeaderboardViewList.TopThreeColumnWidth[1] = 50
CoD.LeaderboardViewList.TopThreeColumnWidth[2] = 270
CoD.LeaderboardViewList.TopThreeColumnWidth[3] = 70
CoD.LeaderboardViewList.FullListColumnWidth = {}
CoD.LeaderboardViewList.FullListColumnWidth[1] = 50
CoD.LeaderboardViewList.FullListColumnWidth[2] = 250
CoD.LeaderboardViewList.FullListColumnWidth[3] = 100
CoD.LeaderboardViewList.ColumnAlignment = {}
CoD.LeaderboardViewList.ColumnAlignment[1] = LUI.Alignment.Left
CoD.LeaderboardViewList.ColumnAlignment[2] = LUI.Alignment.Left
CoD.LeaderboardViewList.ColumnAlignment[3] = LUI.Alignment.Right
CoD.LeaderboardViewList.Height = CoD.CoD9Button.Height
CoD.LeaderboardViewList.TextLeft = 10
CoD.LeaderboardViewList.TextHeight = CoD.textSize.Condensed
CoD.LeaderboardViewList.Font = CoD.fonts.Condensed
CoD.LeaderboardViewList.BackgroundColor = {
	r = 1,
	g = 1,
	b = 1,
	a = 0.2
}
CoD.LeaderboardViewList.ButtonDisabledColor = {
	red = 1,
	green = 1,
	blue = 1,
	alpha = 0.5
}
CoD.LeaderboardViewList.ButtonOverColor = {
	red = 1,
	green = 1,
	blue = 1,
	alpha = 1
}
CoD.LeaderboardViewList.ButtonOverDisabledColor = {
	red = 1,
	green = 1,
	blue = 1,
	alpha = 0.5
}
CoD.LeaderboardViewList.ColumnSpacing = 5
CoD.LeaderboardViewList.TextOffset = 5
local LeaderboardViewList_ItemSetLabel, LeaderboardViewList_Item, LeaderboardViewList_Update, LeaderboardViewList_UpdateTopThree, LeaderboardViewList_RequestLeaderboardData, LeaderboardViewList_SoundListener_GainFocus = nil
LeaderboardViewList_ItemSetLabel = function ( self, text )
	self.id = "lbDataItem." .. text
	self.label:setText( text )
end

LeaderboardViewList_Item = function ( index, dataRow, defaultAnimationState )
	local lbDataItem = LUI.UIElement.new( defaultAnimationState )
	lbDataItem.id = "lbDataRow"
	lbDataItem.setLabel = LeaderboardViewList_ItemSetLabel
	local itemBg = LUI.UIImage.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		red = CoD.LeaderboardViewList.BackgroundColor.r,
		green = CoD.LeaderboardViewList.BackgroundColor.g,
		blue = CoD.LeaderboardViewList.BackgroundColor.b,
		alpha = CoD.LeaderboardViewList.BackgroundColor.a,
		material = RegisterMaterial( "menu_mp_lobby_bar_name" )
	} )
	lbDataItem.background = itemBg
	lbDataItem:addElement( itemBg )
	local row = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = CoD.LeaderboardViewList.ColumnSpacing
	} )
	row:addSpacer( CoD.LeaderboardViewList.TextOffset )
	for colIndex, dataCol in ipairs( dataRow ) do
		local colItem = nil
		local itemAnimationState = {
			left = 0,
			top = -CoD.LeaderboardViewList.TextHeight / 2,
			right = CoD.LeaderboardViewList.TopThreeColumnWidth[colIndex],
			bottom = CoD.LeaderboardViewList.TextHeight / 2,
			leftAnchor = true,
			topAnchor = false,
			rightAnchor = false,
			bottomAnchor = false,
			red = 1,
			green = 1,
			blue = 1,
			alpha = 1,
			font = CoD.LeaderboardViewList.Font,
			alignment = CoD.LeaderboardViewList.ColumnAlignment[colIndex]
		}
		colItem = LUI.UIText.new( itemAnimationState )
		colItem:setText( dataCol.col )
		if colIndex == 1 then
			colItem:setText( index .. "" )
		end
		row:addElement( colItem )
	end
	lbDataItem:addElement( row )
	return lbDataItem
end

LeaderboardViewList_UpdateTopThree = function ( self, event )
	self:removeAllChildren()
	local leaderboardData = Engine.GetLeaderboardData( event.controller )
	if leaderboardData == nil or #leaderboardData == 0 then
		DebugPrint( "lui: leaderboardviewlist.lua, no leaderboard data" )
		return 
	end
	for index, dataRow in ipairs( leaderboardData ) do
		local row = LeaderboardViewList_Item( index, dataRow, {
			left = 0,
			top = 0,
			right = 0,
			bottom = CoD.LeaderboardViewList.Height,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = true,
			bottomAnchor = false,
			alignment = LUI.Alignment.Left,
			spacing = CoD.LeaderboardViewList.ColumnSpacing
		} )
		self:addElement( row )
		if index >= 3 then
			break
		end
		self:addSpacer( CoD.LeaderboardViewList.ColumnSpacing )
	end
end

LeaderboardViewList_SoundListener_GainFocus = function ( self, event )
	Engine.PlaySound( "uin_navigation_click" )
end

function LeaderboardViewList_Button( index, dataRow, defaultAnimationState )
	local lbDataItem = LUI.UIButton.new( defaultAnimationState )
	lbDataItem.id = "lbDataRow"
	lbDataItem.setLabel = LeaderboardViewList_ItemSetLabel
	local borderSize = 2
	local border = CoD.BorderT6.new( borderSize, 1, 1, 1, 0, -1 )
	border:setLeftRight( true, true, 0, 0 )
	LUI.UIButton.SetupElement( border )
	lbDataItem:addElement( border )
	border:registerAnimationState( "default", {
		red = 1,
		green = 1,
		blue = 1,
		alpha = 0
	} )
	border:registerAnimationState( "button_over", {
		red = 1,
		green = 1,
		blue = 1,
		alpha = 1
	} )
	local row = LUI.UIElement.new()
	row:setLeftRight( true, true, 0, 0 )
	row:setTopBottom( true, true, 0, 0 )
	local worldRank = dataRow[1].col
	local playerName = dataRow[2].col
	local playerScore = dataRow[3].col
	local xuid = dataRow.xuid
	local playerNameColumnWidth = CoD.LeaderboardViewList.FullListColumnWidth[2]
	local playerNameTextContainer = LUI.UIElement.new()
	playerNameTextContainer:setLeftRight( true, false, 4, playerNameColumnWidth )
	playerNameTextContainer:setTopBottom( true, true, 0, 0 )
	local playerNameText = LUI.UIText.new()
	playerNameText:setLeftRight( true, true, 0, 0 )
	playerNameText:setTopBottom( true, true, 0, 0 )
	playerNameText:setRGB( 1, 1, 1 )
	playerNameText:setAlpha( 1 )
	playerNameText:setText( playerName )
	playerNameText:setFont( CoD.LeaderboardViewList.Font )
	playerNameText:setAlignment( LUI.Alignment.Left )
	local playerScoreTextContainer = LUI.UIElement.new()
	playerScoreTextContainer:setLeftRight( true, true, playerNameColumnWidth, -4 )
	playerScoreTextContainer:setTopBottom( true, true, 0, 0 )
	local playerScoreText = LUI.UIText.new()
	playerScoreText:setLeftRight( true, true, 0, 0 )
	playerScoreText:setTopBottom( true, true, 0, 0 )
	playerScoreText:setRGB( 1, 1, 1 )
	playerScoreText:setAlpha( 1 )
	playerScoreText:setText( playerScore )
	playerScoreText:setFont( CoD.LeaderboardViewList.Font )
	playerScoreText:setAlignment( LUI.Alignment.Center )
	playerNameTextContainer:addElement( playerNameText )
	playerScoreTextContainer:addElement( playerScoreText )
	row:addElement( playerNameTextContainer )
	row:addElement( playerScoreTextContainer )
	local playerNameBg = LUI.UIImage.new()
	playerNameBg:setLeftRight( true, true, 0, 0 )
	playerNameBg:setTopBottom( true, true, 0, 0 )
	playerNameTextContainer:addElement( playerNameBg )
	local playerScoreBg = LUI.UIImage.new()
	playerScoreBg:setLeftRight( true, true, 0, 0 )
	playerScoreBg:setTopBottom( true, true, 0, 0 )
	playerScoreTextContainer:addElement( playerScoreBg )
	CoD.AARUtility.DecorateButtonRow( {
		playerNameBg,
		playerScoreBg
	} )
	lbDataItem:addElement( row )
	local soundListener = LUI.UIElement.new()
	lbDataItem:addElement( soundListener )
	soundListener:registerEventHandler( "gain_focus", LeaderboardViewList_SoundListener_GainFocus )
	lbDataItem.playerName = playerName
	lbDataItem.xuid = xuid
	lbDataItem:setActionEventName( "aar_leaderboard_button_action" )
	return lbDataItem
end

LeaderboardViewList_Update = function ( self, event )
	self.verticalList:removeAllChildren()
	local leaderboardData = Engine.GetLeaderboardData( event.controller )
	if leaderboardData == nil or #leaderboardData == 0 then
		DebugPrint( "No leaderboard data." )
		return 
	end
	for index, dataRow in ipairs( leaderboardData ) do
		local row = LeaderboardViewList_Button( index, dataRow, {
			left = 0,
			top = 0,
			right = 0,
			bottom = CoD.LeaderboardViewList.Height,
			leftAnchor = true,
			topAnchor = true,
			rightAnchor = true,
			bottomAnchor = false,
			alignment = LUI.Alignment.Left,
			spacing = CoD.LeaderboardViewList.ColumnSpacing
		} )
		self:addElementToList( row )
		if index == 1 and CoD.useController then
			row:processEvent( {
				name = "gain_focus"
			} )
		end
	end
end

LeaderboardViewList_RequestLeaderboardData = function ( self, controller )
	Engine.RequestLeaderboardData( controller, self.filter )
end

CoD.LeaderboardViewList.new = function ( controller, defaultAnimationState, spacing, filter, displayTopThreeOnly )
	if filter == nil then
		filter = CoD.LB_FILTER_NONE
	end
	local leaderboardViewList = nil
	if displayTopThreeOnly == true then
		leaderboardViewList = LUI.UIVerticalList.new( defaultAnimationState )
	else
		leaderboardViewList = CoD.ScrollingVerticalList.new( defaultAnimationState, spacing )
	end
	leaderboardViewList.id = "LeaderboardViewList"
	leaderboardViewList.filter = filter
	leaderboardViewList.requestLeaderboardData = LeaderboardViewList_RequestLeaderboardData
	if displayTopThreeOnly == true then
		leaderboardViewList:registerEventHandler( "leaderboardlist_update", LeaderboardViewList_UpdateTopThree )
	else
		leaderboardViewList:registerEventHandler( "leaderboardlist_update", LeaderboardViewList_Update )
	end
	return leaderboardViewList
end

