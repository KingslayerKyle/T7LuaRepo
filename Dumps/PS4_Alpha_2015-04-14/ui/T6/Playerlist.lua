require( "ui.T6.VoipImage" )
require( "ui.T6.PlayerListRow" )

CoD.PlayerList = {}
CoD.PlayerList.AddStatusRow = function ( self, statusText )
	local statusRow = CoD.PlayerListRow.CreateStatusRow( self, statusText )
	self.verticalList:addElement( statusRow )
	self.rowCount = self.rowCount + 1
	return statusRow
end

CoD.PlayerList.AddMissingTeamMemberRow = function ( self, numPlayersForTeamPlay )
	local newRow = CoD.PlayerListRow.CreateMissingTeamMemberRow( self, numPlayersForTeamPlay )
	self.verticalList:addElement( newRow )
	self.rowCount = self.rowCount + 1
	return newRow
end

CoD.PlayerList.AddMemberRow = function ( self, member, showTeams, showIndividualLeagueRank )
	local memberRow = CoD.PlayerListRow.CreateRow( self, member, true, showTeams, showIndividualLeagueRank, self.showMissingDLC )
	self.verticalList:addElement( memberRow )
	self.rowCount = self.rowCount + 1
	self.playerCount = self.playerCount + 1
	if member.isLocal == 1 then
		self.localPlayerCount = self.localPlayerCount + 1
	end
	return memberRow
end

CoD.PlayerList.AddSearchingRow = function ( self, rowIndex )
	local searchingRow = CoD.PlayerListRow.CreateSearchingRow( rowIndex )
	self.verticalList:addElement( searchingRow )
	self.rowCount = self.rowCount + 1
	return searchingRow
end

CoD.PlayerList.ClearList = function ( self )
	self.verticalList:removeAllChildren()
end

CoD.PlayerList.SetHighlightedRow = function ( self, highlightedPlayerRow, rowAtHighlightedPlayerIndex, firstFocusableRow )
	if self.highlightedPlayerXuid ~= nil and self.highlightedPlayerIndex ~= nil then
		if highlightedPlayerRow ~= nil then
			highlightedPlayerRow:processEvent( {
				name = "gain_focus"
			} )
		elseif rowAtHighlightedPlayerIndex ~= nil then
			rowAtHighlightedPlayerIndex:processEvent( {
				name = "gain_focus"
			} )
		elseif firstFocusableRow ~= nil then
			firstFocusableRow:processEvent( {
				name = "gain_focus"
			} )
		end
	elseif nil ~= firstForcusableRow then
		firstFocusableRow:processEvent( {
			name = "gain_focus"
		} )
	end
end

CoD.PlayerList.IsPartyMemberInThisList = function ( self, member, showTeams )
	if self.teamMask == nil then
		return true
	elseif (showTeams == true or self.teamMask == Enum.team_t.TEAM_SPECTATOR) and member.team == self.teamMask then
		return true
	elseif showTeams == false and self.teamMask == Enum.team_t.TEAM_FREE and member.team ~= Enum.team_t.TEAM_SPECTATOR then
		return true
	else
		return false
	end
end

CoD.PlayerList.ShowTeams = function ()
	if CoD.isZombie and CoD.Zombie.GAMETYPE_ZCLEANSED == Dvar.ui_gametype:get() then
		return false
	elseif Engine.PartyIsPostGame() == true then
		return true
	elseif Engine.GetGametypeSetting( "autoTeamBalance" ) == 1 and Engine.PartyIsReadyToStart() ~= true and Engine.PartyHostIsReadyToStart() ~= true then
		return false
	elseif CoD.IsGametypeTeamBased() then
		if CoD.isZombie == true and Engine.GetGametypeSetting( "teamCount" ) == 1 then
			return false
		else
			return true
		end
	else
		return false
	end
end

CoD.PlayerList.Update = function ( self, members, previousListsRowCount, setFocus, showCommonStatusRow )
	self:clearList()
	self.localPlayerCount = 0
	self.playerCount = 0
	self.rowCount = 0
	if self.showStatusRowWhenEmpty ~= true and (members == nil or members ~= nil and #members == 0) then
		self:registerAnimationState( "default", {
			leftAnchor = true,
			rightAnchor = true,
			left = 0,
			right = 0,
			topAnchor = true,
			bottomAnchor = false,
			top = 0,
			bottom = 0
		} )
		self:animateToState( "default" )
		return 
	end
	local totalRowCount = 0
	if previousListsRowCount ~= nil then
		totalRowCount = previousListsRowCount
	end
	local smallestRowCount = 1
	if showCommonStatusRow ~= true and self.showStatusRowWhenEmpty ~= true then
		smallestRowCount = 2
	end
	if CoD.MaxPlayerListRows - smallestRowCount < totalRowCount then
		self:registerAnimationState( "default", {
			leftAnchor = true,
			rightAnchor = true,
			left = 0,
			right = 0,
			topAnchor = true,
			bottomAnchor = false,
			top = 0,
			bottom = 0
		} )
		self:animateToState( "default" )
		return 
	elseif self.statusRow ~= nil then
		self.statusRow:close()
		self.statusRow = nil
	end
	if showCommonStatusRow ~= true then
		self.statusRow = self:addStatusRow( self.statusText )
	end
	local showTeams = CoD.PlayerList.ShowTeams()
	local membersInList = {}
	local membersInListOnSameLeagueTeam = false
	local membersTeamID = nil
	if members ~= nil then
		local previousMemberLeagueTeam = nil
		for index, member in pairs( members ) do
			if CoD.PlayerList.IsPartyMemberInThisList( self, member, showTeams ) then
				table.insert( membersInList, member )
				if previousMemberLeagueTeam == nil then
					previousMemberLeagueTeam = member.leagueTeamID
				end
				if previousMemberLeagueTeam == member.leagueTeamID then
					membersInListOnSameLeagueTeam = true
				else
					membersInListOnSameLeagueTeam = false
				end
			end
		end
		if membersInListOnSameLeagueTeam then
			membersTeamID = previousMemberLeagueTeam
		end
	end
	local f9_local3 = membersInListOnSameLeagueTeam == false
	local highlightedPlayerRow, f9_local1, f9_local2 = nil
	if membersInList ~= nil then
		local currentRow = nil
		for index, member in ipairs( membersInList ) do
			currentRow = self:addMemberRow( member, showTeams, f9_local3 )
			currentRow.rowIndex = self.rowCount
			if member.xuid == self.highlightedPlayerXuid then
				highlightedPlayerRow = currentRow
			end
			if self.highlightedPlayerIndex ~= nil and index == self.highlightedPlayerIndex - 1 then
				f9_local1 = currentRow
			end
			if f9_local2 == nil and currentRow.m_focusable then
				f9_local2 = currentRow
			end
			if totalRowCount + self.rowCount == CoD.MaxPlayerListRows then
				break
			end
		end
	end
	if showCommonStatusRow ~= true and self.rowCount == 1 and self.showStatusRowWhenEmpty ~= true then
		self.statusRow:close()
		self.statusRow = nil
		self.rowCount = self.rowCount - 1
	end
	local listTop = CoD.PlayerListRow.Height * totalRowCount
	local listHeight = CoD.PlayerListRow.Height * self.rowCount
	self:registerAnimationState( "default", {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = listTop,
		bottom = listTop + listHeight
	} )
	self:animateToState( "default" )
	if setFocus == true then
		self:setHighlightedRow( highlightedPlayerRow, f9_local1, f9_local2 )
	end
end

CoD.PlayerList.IsXuidInList = function ( self, xuid )
	local childElement = self.verticalList:getFirstChild()
	while childElement ~= nil do
		if childElement.playerXuid == xuid then
			return true
		end
		childElement = childElement:getNextSibling()
	end
	return false
end

CoD.PlayerList.SetFocusByXuid = function ( self, xuid )
	local childElement = self.verticalList:getFirstChild()
	while childElement ~= nil do
		if childElement.m_focusable and childElement.playerXuid == xuid then
			childElement:processEvent( {
				name = "gain_focus"
			} )
			return true
		end
		childElement = childElement:getNextSibling()
	end
	return false
end

CoD.PlayerList.SetFocusByIndex = function ( self, listIndex )
	local childElement = self.verticalList:getFirstChild()
	local index = 1
	while childElement ~= nil do
		if childElement.m_focusable then
			if index == listIndex then
				childElement:processEvent( {
					name = "gain_focus"
				} )
				return true
			end
			index = index + 1
		end
		childElement = childElement:getNextSibling()
	end
	return false
end

CoD.PlayerList.PlayerListRowSelected = function ( self, event )
	self:dispatchEventToParent( event )
	self.highlightedPlayerXuid = event.playerXuid
	self.highlightedPlayerIndex = event.listIndex
	Dvar.selectedPlayerXuid:set( event.playerXuid )
end

CoD.PlayerList.PlayerListRowDeselected = function ( self, event )
	self:dispatchEventToParent( event )
	if event.playerXuid == self.highlightedPlayerXuid then
		self.highlightedPlayerXuid = nil
		self.highlightedPlayerIndex = nil
	end
end

CoD.PlayerList.GetRowCount = function ( self )
	if self.rowCount == nil then
		return 0
	else
		return self.rowCount
	end
end

CoD.PlayerList.GetPlayerCount = function ( self )
	if self.playerCount == nil then
		return 0
	else
		return self.playerCount
	end
end

CoD.PlayerList.GetLocalPlayerCount = function ( self )
	if self.localPlayerCount == nil then
		return 0
	else
		return self.localPlayerCount
	end
end

CoD.PlayerList.New = function ( defaultAnimationState, showStatusRowWhenEmpty, statusText, name, parentId, teamMask, showMissingDLC )
	local playerList = LUI.UIElement.new( defaultAnimationState )
	playerList:makeFocusable()
	playerList.stencilContainer = LUI.UIContainer.new()
	playerList.stencilContainer:setUseStencil( true )
	playerList.stencilContainer:setPriority( -10 )
	playerList.stencilContainer:setLeftRight( false, false, -100, 100 )
	playerList.stencilContainer:setTopBottom( false, false, -45, 45 )
	playerList:addElement( playerList.stencilContainer )
	local backgroundIconSize = 128
	local backgroundIconRight = 0
	playerList.backgroundIcon = LUI.UIImage.new()
	playerList.backgroundIcon:setLeftRight( false, false, backgroundIconRight - backgroundIconSize / 2, backgroundIconRight + backgroundIconSize / 2 )
	playerList.backgroundIcon:setTopBottom( false, false, -backgroundIconSize / 2, backgroundIconSize / 2 )
	playerList.backgroundIcon:setAlpha( 0.15 )
	playerList.backgroundIcon:setPriority( -10 )
	playerList.verticalList = LUI.UIVerticalList.new()
	playerList.verticalList:setLeftRight( true, true, 0, 0 )
	playerList.verticalList:setTopBottom( true, true, 0, 0 )
	playerList.verticalList:makeFocusable()
	playerList:addElement( playerList.verticalList )
	playerList.localPlayerCount = 0
	playerList.playerCount = 0
	playerList.rowCount = 0
	playerList.teamMask = teamMask
	playerList.showMissingDLC = showMissingDLC
	playerList.showVoipIcons = Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) ~= true
	playerList.showStatusRowWhenEmpty = showStatusRowWhenEmpty
	playerList.statusText = statusText
	playerList.id = parentId .. "." .. name
	if teamMask ~= nil then
		playerList.id = playerList.id .. "." .. teamMask
	end
	playerList.addStatusRow = CoD.PlayerList.AddStatusRow
	playerList.addMissingTeamMemberRow = CoD.PlayerList.AddMissingTeamMemberRow
	playerList.addSearchingRow = CoD.PlayerList.AddSearchingRow
	playerList.addMemberRow = CoD.PlayerList.AddMemberRow
	playerList.clearList = CoD.PlayerList.ClearList
	playerList.update = CoD.PlayerList.Update
	playerList.setHighlightedRow = CoD.PlayerList.SetHighlightedRow
	playerList.getRowCount = CoD.PlayerList.GetRowCount
	playerList.getPlayerCount = CoD.PlayerList.GetPlayerCount
	playerList.getLocalPlayerCount = CoD.PlayerList.GetLocalPlayerCount
	playerList:registerEventHandler( "playerlist_row_selected", CoD.PlayerList.PlayerListRowSelected )
	playerList:registerEventHandler( "playerlist_row_deselected", CoD.PlayerList.PlayerListRowDeselected )
	return playerList
end

