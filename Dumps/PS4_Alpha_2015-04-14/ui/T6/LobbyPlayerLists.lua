require( "ui.T6.Playerlist" )
require( "ui.T6.LobbyList" )

CoD.LobbyPlayerLists = {}
CoD.LobbyPlayerLists.AddList = function ( self, list )
	table.insert( self.playerLists, list )
	self:addElement( list )
end

CoD.LobbyPlayerLists.GetAllLists = function ( self )
	local allLists = {}
	for index, list in ipairs( self.playerLists ) do
		table.insert( allLists, list )
	end
	if self.joinableList then
		table.insert( allLists, self.joinableList )
	end
	return allLists
end

CoD.LobbyPlayerLists.UpdateNavigationLinks = function ( self )
	local firstNonEmptyList, finalNonEmptyList, prevNonEmptyList = nil
	local allLists = CoD.LobbyPlayerLists.GetAllLists( self )
	for index, list in ipairs( allLists ) do
		if list:getPlayerCount() > 0 then
			if firstNonEmptyList == nil then
				firstNonEmptyList = list.verticalList
			end
			finalNonEmptyList = list.verticalList
			list.verticalList.navigation.up = prevNonEmptyList
			if prevNonEmptyList ~= nil then
				prevNonEmptyList.navigation.down = list.verticalList
			end
			prevNonEmptyList = list.verticalList
		end
	end
	if firstNonEmptyList ~= nil then
		firstNonEmptyList.navigation.up = finalNonEmptyList
		finalNonEmptyList.navigation.down = firstNonEmptyList
	end
	for index, list in ipairs( allLists ) do
		LUI.UIVerticalList.UpdateNavigation( list.verticalList )
	end
end

CoD.LobbyPlayerLists.ListContainsLobbyMembers = function ( self )
	return self.showVoipIcons == true
end

CoD.LobbyPlayerLists.Refresh = function ( self, setFocus )
	local totalRowCount = 0
	local totalPlayerCount = 0
	local totalLocalPlayerCount = 0
	self.availableTeamCount = 0
	if self.showCommonStatusRow == true then
		totalRowCount = totalRowCount + 1
	end
	for index, list in ipairs( self.playerLists ) do
		if list.update ~= nil then
			list:update( self.members, totalRowCount, setFocus, self.showCommonStatusRow )
			totalRowCount = totalRowCount + list:getRowCount()
			if 0 < list:getPlayerCount() and CoD.LobbyPlayerLists.ListContainsLobbyMembers( list ) == true then
				self.availableTeamCount = self.availableTeamCount + 1
			end
		end
	end
	if self.members ~= nil then
		totalPlayerCount = #self.members
	end
	if self.showCommonStatusRow and 0 < totalPlayerCount then
		local serverType = ""
		local maxPlayers = Engine.DvarInt( nil, "party_maxplayers" )
		if Engine.IsGameLobbyRunning() and Engine.LobbyConnectedToDedicatedHost() and (Engine.GetIsSuperUser( Engine.GetPrimaryController() ) or Engine.GetUserTier( Engine.GetPrimaryController() ) == 3) then
			local hostname = Engine.DvarString( nil, "party_hostname" )
			serverType = hostname
		end
		local commonStatusText = nil
		if totalPlayerCount == 1 then
			commonStatusText = Engine.Localize( "MENU_PLAYERLIST_PLAYER_COUNT_SINGULAR", totalPlayerCount, maxPlayers )
		else
			commonStatusText = Engine.Localize( "MENU_PLAYERLIST_PLAYER_COUNT_PLURAL", totalPlayerCount, maxPlayers )
		end
		self.statusRow:setText( commonStatusText .. " " .. serverType )
	end
	local maxPlayers = Engine.DvarInt( nil, "party_maxplayers" )
	for index, list in ipairs( self.playerLists ) do
		local playersInList = list:getPlayerCount()
		if list.statusRow ~= nil and CoD.LobbyPlayerLists.ListContainsLobbyMembers( list ) then
			local maxPlayersAllowedInList = 0
			if 0 < self.availableTeamCount then
				maxPlayersAllowedInList = math.floor( maxPlayers / self.availableTeamCount )
			end
			local playerStatusText = nil
			if playersInList == 1 then
				playerStatusText = Engine.Localize( "MENU_PLAYERLIST_PLAYER_COUNT_SINGULAR", playersInList, maxPlayersAllowedInList )
			else
				playerStatusText = Engine.Localize( "MENU_PLAYERLIST_PLAYER_COUNT_PLURAL", playersInList, maxPlayersAllowedInList )
			end
			list.statusRow:setText( playerStatusText )
		end
	end
	self.additionalRowList:clearList()
	if 0 < totalPlayerCount and self.availableTeamCount == 1 then
		if Engine.IsPartyLobbyRunning() and not Engine.IsGameLobbyRunning() then
			local league = Engine.GetLeague()
			if league and league.teamsAllowed then
				local numMissingTeamMembers = league.teamSize - totalPlayerCount
				if 0 < numMissingTeamMembers then
					self.additionalRowList:addMissingTeamMemberRow( numMissingTeamMembers )
				end
			end
		end
		if not Engine.PartyIsReadyToStart() and self.enableSearchingRows == true then
			local rowAdjust = nil
			rowAdjust = 1
			for searchingRowIndex = totalPlayerCount, maxPlayers - rowAdjust, 1 do
				self.additionalRowList:addSearchingRow( searchingRowIndex )
			end
		end
		local listTop = CoD.PlayerListRow.Height * totalRowCount
		local listHeight = CoD.PlayerListRow.Height * self.additionalRowList:getRowCount()
		self.additionalRowList:registerAnimationState( "default", {
			leftAnchor = true,
			rightAnchor = true,
			left = 0,
			right = 0,
			topAnchor = true,
			bottomAnchor = false,
			top = listTop,
			bottom = listTop + listHeight
		} )
		self.additionalRowList:animateToState( "default" )
	end
	if self.joinableList ~= nil then
		self.joinableList:update( nil, totalRowCount, totalPlayerCount, setFocus, false )
		totalRowCount = totalRowCount + self.joinableList:getRowCount()
	end
	CoD.LobbyPlayerLists.UpdateNavigationLinks( self )
end

local LobbyPlayerLists_MatchSort = function ( a, b )
	if a.score ~= nil and b.score ~= nil and a.score ~= b.score then
		return tonumber( b.score ) < tonumber( a.score )
	elseif a.isInParty ~= b.isInParty then
		return a.isInParty
	elseif a.subparty ~= b.subparty then
		return a.subparty < b.subparty
	elseif a.isLocal ~= b.isLocal then
		return b.isLocal < a.isLocal
	elseif a.isGuest ~= b.isGuest then
		return a.isGuest < b.isGuest
	else
		return a.gamertag:lower() < b.gamertag:lower()
	end
end

local LobbyPlayerLists_PrivateMatchSort = function ( a, b )
	if a.isHost ~= b.isHost then
		return b.isHost < a.isHost
	else
		return LobbyPlayerLists_MatchSort( a, b )
	end
end

CoD.LobbyPlayerLists.Update = function ( self, members )
	self.members = members
	if Engine.SessionMode_IsPublicOnlineGame() then
		table.sort( self.members, LobbyPlayerLists_MatchSort )
	else
		table.sort( self.members, LobbyPlayerLists_PrivateMatchSort )
	end
	CoD.LobbyPlayerLists.Refresh( self, false )
	if self.selectedPlayerXuid ~= nil then
		CoD.LobbyPlayerLists.SetFocus( self )
	end
end

CoD.LobbyPlayerLists.UpdateEvent = function ( self, event )
	if event ~= nil and event.members ~= nil then
		CoD.LobbyPlayerLists.Update( self, event.members )
	end
end

CoD.LobbyPlayerLists.RefreshEvent = function ( self, event )
	local members = {}
	CoD.LobbyPlayerLists.Update( self, Engine.GetPlayersInLobby() )
	self:dispatchEventToChildren( event )
end

CoD.LobbyPlayerLists.SetFocusByXuid = function ( self, xuid, listId )
	local allLists = CoD.LobbyPlayerLists.GetAllLists( self )
	for index, list in ipairs( allLists ) do
		if (listId == nil or listId == list.id) and CoD.PlayerList.SetFocusByXuid( list, xuid ) then
			return true
		end
	end
	return false
end

CoD.LobbyPlayerLists.SetFocusByIndex = function ( self, listId, index )
	local allLists = CoD.LobbyPlayerLists.GetAllLists( self )
	for index, list in ipairs( allLists ) do
		if list.id == listId and CoD.PlayerList.SetFocusByIndex( list, index ) then
			return true
		end
	end
	for index, list in ipairs( allLists ) do
		local rowCount = list:getRowCount()
		if rowCount > 0 and list.id == listId and index == rowCount - 1 and CoD.PlayerList.SetFocusByIndex( list, rowCount ) then
			return true
		end
	end
	return false
end

CoD.LobbyPlayerLists.SetDefaultFocus = function ( self )
	local allLists = CoD.LobbyPlayerLists.GetAllLists( self )
	for index, list in ipairs( allLists ) do
		if CoD.PlayerList.SetFocusByIndex( list, 1 ) then
			return true
		end
	end
	return false
end

CoD.LobbyPlayerLists.SetFocus = function ( self )
	if self.selectedPlayerXuid ~= nil then
		if CoD.LobbyPlayerLists.SetFocusByXuid( self, self.selectedPlayerXuid, self.selectedPlayerListId ) then
			return 
		elseif CoD.LobbyPlayerLists.SetFocusByXuid( self, self.selectedPlayerXuid ) then
			return 
		elseif self.selectedPlayerListId ~= nil and self.selectedPlayerListIndex ~= nil and CoD.LobbyPlayerLists.SetFocusByIndex( self, self.selectedPlayerListId, self.selectedPlayerListIndex ) then
			return 
		end
	end
	CoD.LobbyPlayerLists.SetDefaultFocus( self )
end

CoD.LobbyPlayerLists.SaveState = function ( self, parentId )
	if not self:isIDNamed() then
		error( "LUI Error: Tried to save menu state, but element has no name: " .. self:getFullID() )
		return 
	else
		LUI.savedMenuStates[parentId] = {
			id = self.id,
			data = {
				playerXuid = self.selectedPlayerXuid,
				listId = self.selectedPlayerListId,
				listIndex = self.selectedPlayerListIndex
			}
		}
	end
end

CoD.LobbyPlayerLists.RestoreFocus = function ( self, event )
	if self.id == event.id then
		local saveData = event.data
		if saveData ~= nil then
			self.selectedPlayerXuid = saveData.playerXuid
			self.selectedPlayerListId = saveData.listId
			self.selectedPlayerListIndex = saveData.listIndex
		end
		CoD.LobbyPlayerLists.SetFocus( self )
		return true
	else
		return self:dispatchEventToChildren( event )
	end
end

CoD.LobbyPlayerLists.PlayerListRowSelected = function ( self, event )
	self.selectedPlayerXuid = event.playerXuid
	self.selectedLeagueTeamID = event.leagueTeamID
	self.leagueTeamMemberCount = event.leagueTeamMemberCount
	self.selectedPlayerListId = event.listId
	self.selectedPlayerListIndex = event.listIndex
	self:dispatchEventToParent( event )
end

CoD.LobbyPlayerLists.PlayerListRowDeselected = function ( self, event )
	self.selectedPlayerXuid = nil
	self.selectedPlayerListId = nil
	self.selectedPlayerListIndex = nil
	self:dispatchEventToParent( event )
end

CoD.LobbyPlayerLists.SetSplitscreenSignInAllowed = function ( self, splitscreenSignInAllowed )
	for index, list in ipairs( self.playerLists ) do
		if list.setSplitscreenSignInAllowed ~= nil then
			list:setSplitscreenSignInAllowed( splitscreenSignInAllowed )
		end
	end
end

CoD.LobbyPlayerLists.New = function ( defaultAnimationState, controller, headerText, parentId, maxLocalPlayers, enableSearchingRows, showMissingDLC )
	local self = LUI.UIVerticalList.new( defaultAnimationState )
	self.id = parentId .. ".PlayerLists"
	self.enableSearchingRows = enableSearchingRows
	self.playerLists = {}
	self.setSplitscreenSignInAllowed = CoD.LobbyPlayerLists.SetSplitscreenSignInAllowed
	self:registerEventHandler( "partylobby_update", CoD.LobbyPlayerLists.UpdateEvent )
	self:registerEventHandler( "gamelobby_update", CoD.LobbyPlayerLists.UpdateEvent )
	self:registerEventHandler( "game_options_update", CoD.LobbyPlayerLists.RefreshEvent )
	self:registerEventHandler( "gametype_update", CoD.LobbyPlayerLists.RefreshEvent )
	self:registerEventHandler( "restore_focus", CoD.LobbyPlayerLists.RestoreFocus )
	self:registerEventHandler( "playerlist_row_selected", CoD.LobbyPlayerLists.PlayerListRowSelected )
	self:registerEventHandler( "playerlist_row_deselected", CoD.LobbyPlayerLists.PlayerListRowDeselected )
	self:registerEventHandler( "start_game", CoD.LobbyPlayerLists.RefreshEvent )
	self:registerEventHandler( "cancel_start_game", CoD.LobbyPlayerLists.RefreshEvent )
	self:registerEventHandler( "controller_inserted", CoD.LobbyPlayerLists.RefreshEvent )
	self:registerEventHandler( "controller_removed", CoD.LobbyPlayerLists.RefreshEvent )
	self:registerEventHandler( "controller_used_start", CoD.LobbyPlayerLists.RefreshEvent )
	self:registerEventHandler( "controller_used_stop", CoD.LobbyPlayerLists.RefreshEvent )
	self.showCommonStatusRow = true
	if self.showCommonStatusRow == true then
		self.statusRow = CoD.PlayerListRow.CreateStatusRow( self, "", true, controller )
		self:addElement( self.statusRow )
	end
	local defaultAnimationState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	}
	local teamName = nil
	for teamMask = 0, Enum.team_t.TEAM_NUM_TEAMS - 1, 1 do
		if headerText ~= nil then
			teamName = headerText
		else
			teamName = CoD.GetTeamName( teamMask )
		end
		local list = CoD.PlayerList.New( defaultAnimationState, false, nil, "playerlist" .. teamName, self.id, teamMask, showMissingDLC )
		CoD.LobbyPlayerLists.AddList( self, list )
	end
	local list = CoD.LobbyList.New( defaultAnimationState, "", "SplitscreenSignIn", self.id, nil, maxLocalPlayers )
	CoD.LobbyPlayerLists.AddList( self, list )
	self.additionalRowList = CoD.PlayerList.New( defaultAnimationState, false, "", "AdditionalRowList", self.id, nil )
	self.additionalRowList:makeNotFocusable()
	self:addElement( self.additionalRowList )
	return self
end

