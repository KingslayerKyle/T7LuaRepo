CoD.LeagueMemberList = {}
CoD.LeagueMemberList.LeagueMemberListWidth = 430
CoD.LeagueMemberList.LeagueMemberListHeight = 550
CoD.LeagueMemberList.LeagueMemberListButtonCreator = function ( controller, mutables )
	local inset = 8
	local container = LUI.UIElement.new()
	container:setLeftRight( true, true, inset, -inset )
	container:setTopBottom( true, true, inset, -inset )
	local left = 0
	local emblemSize = 40
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( true, false, left, left + emblemSize )
	emblem:setTopBottom( false, false, -emblemSize / 2, emblemSize / 2 )
	mutables.emblem = emblem
	container:addElement( emblem )
	left = left + emblemSize + 5
	local playerNameFont = "Default"
	local playerNameFontHeight = CoD.textSize[playerNameFont]
	local playerNameTextElem = CoD.CRCommon.GetTextElem( playerNameFont, "Left" )
	playerNameTextElem:setLeftRight( true, true, left, 0 )
	playerNameTextElem:setTopBottom( false, false, -playerNameFontHeight / 2, playerNameFontHeight / 2 )
	mutables.playerNameTextElem = playerNameTextElem
	container:addElement( playerNameTextElem )
	mutables:addElement( container )
end

CoD.LeagueMemberList.LeagueMemberListButtonData = function ( controller, itemIndex, mutables )
	local teamMemberInfo = CoD.LeaguesData.CurrentTeamInfo.teamMemberInfo
	local currMemberInfo = teamMemberInfo.members[itemIndex]
	if currMemberInfo ~= nil then
		mutables.playerXuid = currMemberInfo.xuid
		mutables.playerName = currMemberInfo.userName
		mutables.playerNameTextElem:setText( mutables.playerName )
		mutables.emblem:setupPlayerEmblemByXUID( mutables.playerXuid )
	end
end

CoD.LeagueMemberList.SetupLeagueMemberList = function ( self, controller )
	local teamMemberInfo = CoD.LeaguesData.CurrentTeamInfo.teamMemberInfo
	self.m_ownerController = controller
	local top = 20
	local title = CoD.CRCommon.GetTextElem( "Big", "Left", Engine.Localize( "MENU_VIEW_TEAMMATE_PLAYERCARD" ), nil, top )
	title:setLeftRight( true, true, 20, 0 )
	self:addElement( title )
	local buttonHeight = CoD.CoD9Button.Height * 2
	local buttonWidth = 400
	top = top + CoD.textSize.Big + 20
	local leftRightOffset = 20
	local listBoxContainer = LUI.UIElement.new()
	listBoxContainer:setLeftRight( false, false, -buttonWidth / 2, buttonWidth / 2 )
	listBoxContainer:setTopBottom( true, true, top, 0 )
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
	local listBox = CoD.ListBox.new( listBoxDefaultAnimState, controller, 6, buttonHeight, buttonWidth, CoD.LeagueMemberList.LeagueMemberListButtonCreator, CoD.LeagueMemberList.LeagueMemberListButtonData, 0 )
	listBox.noDataText = Engine.Localize( "MPUI_NO_FRIENDS" )
	listBox:setTotalItems( teamMemberInfo.numMembers )
	self.listBox = listBox
	listBoxContainer:addElement( listBox )
	self:addElement( listBoxContainer )
end

CoD.LeagueMemberList.RefreshList = function ( self, event )
	local mutables = self.listBox:getFocussedMutables()
	local newIndexToFocus = {
		index = 1
	}
	local playerListType = {}
	playerListType = CoD.LeagueMemberList.LeagueMemberListMode
	if self.listBox then
		if mutables ~= nil and mutables.playerXuid ~= nil and mutables.playerXuid ~= 0 then
			newIndexToFocus = Engine.GetPlayerIndexByXuid( self, mutables.playerXuid, playerListType )
			newIndexToFocus.index = newIndexToFocus.index + 1
		end
		self.listBox:setTotalItems( Engine.GetPlayerCount( self.m_ownerController, playerListType ), newIndexToFocus.index )
		self.listBox:refresh()
	end
end

CoD.LeagueMemberList.ButtonAction = function ( self, event )
	if event and event.mutables then
		CoD.FriendPopup.SelectedPlayerXuid = event.mutables.playerXuid
		CoD.FriendPopup.SelectedPlayerName = event.mutables.playerName
		CoD.FriendPopup.LeagueMemberSelected = true
		self:openPopup( "FriendPopup", event.controller )
	end
end

CoD.LeagueMemberList.FriendsStatsFetched = function ( self, event )
	self:processEvent( {
		name = "button_prompt_back"
	} )
end

LUI.createMenu.LeagueMemberList = function ( controller )
	local self = CoD.Menu.NewSmallPopup( "LeagueMemberList", nil, nil, CoD.LeagueMemberList.LeagueMemberListWidth, CoD.LeagueMemberList.LeagueMemberListHeight )
	self:setOwner( controller )
	self:addBackButton()
	self:addSelectButton()
	CoD.LeagueMemberList.SetupLeagueMemberList( self, controller )
	self:registerEventHandler( "click", CoD.LeagueMemberList.ButtonAction )
	return self
end

