require( "ui.T6.Playerlist" )

CoD.JoinableList = {}
CoD.JoinableList.Update = function ( self, members, previousListsRowCount, setFocus, showCommonStatusRow )
	members = Engine.GetTitleFriendsOfAllLocalPlayers( self.maxRows - previousListsRowCount )
	local listPlayerCount = #members
	local morePlaying = #members - self.maxRows - previousListsRowCount + 1
	if morePlaying >= 1 then
		self.bottomText:setText( Engine.Localize( "MENU_PLAYERLIST_MORE_PLAYING", morePlaying ) )
		self.border:setTopBottom( true, true, 0, 25 )
		self.bottomText:setAlpha( 0.5 )
	else
		self.border:setTopBottom( true, true, 0, 0 )
		self.bottomText:setAlpha( 0 )
	end
	if listPlayerCount == 0 then
		self.border:setAlpha( 0 )
	else
		self.border:setAlpha( 0.1 )
	end
	CoD.PlayerList.Update( self, members, previousListsRowCount, setFocus, showCommonStatusRow )
end

CoD.JoinableList.RowGainFocus = function ( self, event )
	local retVal = LUI.UIButton.gainFocus( self, event )
	Engine.SetDvar( "ui_friendsListOpen", 1 )
	self:dispatchEventToParent( {
		name = "playerlist_row_selected",
		playerName = self.name,
		playerXuid = self.playerXuid,
		leagueTeamID = self.leagueTeamID,
		listId = self.playerList.id,
		listIndex = self.rowIndex,
		controller = event.controller,
		joinable = true
	} )
	return retVal
end

CoD.JoinableList.RowLoseFocus = function ( self, event )
	Engine.SetDvar( "ui_friendsListOpen", 0 )
	CoD.PlayerListRow.LoseFocus( self, event )
end

CoD.JoinableList.AddMemberRow = function ( self, member )
	local newRow = CoD.PlayerList.AddMemberRow( self, member )
	local joinableFontName = "Condensed"
	local joinableFont = CoD.fonts[joinableFontName]
	local joinableFontHeight = CoD.textSize[joinableFontName]
	local joinableTextSpacing = 5
	local joinableHeight = joinableFontHeight + joinableTextSpacing * 2
	local joinableIconSize = joinableHeight - joinableTextSpacing * 2
	local joinableIcon = LUI.UIImage.new()
	joinableIcon:setLeftRight( false, true, -joinableTextSpacing - joinableIconSize, -joinableTextSpacing )
	joinableIcon:setTopBottom( true, false, 0, joinableIconSize )
	joinableIcon:setImage( RegisterMaterial( "menu_mp_party_ease_icon" ) )
	newRow:addElement( joinableIcon )
	member.joinable = Engine.IsPlayerJoinable( controller, member.xuid )
	if member.joinable.isJoinable then
		joinableIcon:setAlpha( 1 )
	else
		joinableIcon:setAlpha( 0 )
	end
	newRow:registerEventHandler( "gain_focus", CoD.JoinableList.RowGainFocus )
	newRow:registerEventHandler( "lose_focus", CoD.JoinableList.RowLoseFocus )
	return newRow
end

CoD.JoinableList.New = function ( defaultAnimationState, showStatusRowWhenEmpty, statusText, name, parentId )
	local joinableList = CoD.PlayerList.New( defaultAnimationState, showStatusRowWhenEmpty, statusText, name, parentId )
	joinableList.showVoipIcons = false
	joinableList.addMemberRow = CoD.JoinableList.AddMemberRow
	joinableList.update = CoD.JoinableList.Update
	joinableList.bottomText = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = -CoD.textSize.Default / 2 + 5,
		bottom = CoD.textSize.Default / 2 + 5,
		red = CoD.offWhite.r,
		green = CoD.offWhite.g,
		blue = CoD.offWhite.b,
		font = CoD.fonts.Default,
		alpha = 0.5
	} )
	joinableList:addElement( joinableList.bottomText )
	joinableList.border = CoD.BorderT6.new( 1, 1, 1, 1, 0.1, -10 )
	joinableList:addElement( joinableList.border )
	return joinableList
end

