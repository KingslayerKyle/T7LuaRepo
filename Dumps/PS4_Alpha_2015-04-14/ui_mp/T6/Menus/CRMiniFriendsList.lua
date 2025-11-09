CoD.CRMiniFriendsList = {}
CoD.CRMiniFriendsList.MiniFriendsListWidth = 430
CoD.CRMiniFriendsList.MiniFriendsListHeight = 550
CoD.CRMiniFriendsList.MiniFriendsListMode = CoD.playerListType.friend
CoD.CRMiniFriendsList.FriendsListButtonCreator = function ( controller, mutables )
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
	local rankIconContainer = LUI.UIElement.new()
	rankIconContainer:setLeftRight( false, true, -emblemSize, 0 )
	rankIconContainer:setTopBottom( false, false, -emblemSize / 2, emblemSize / 2 )
	local rankIcon = CoD.CRCommon.GetStretchedImage()
	mutables.rankIcon = rankIcon
	rankIconContainer:addElement( rankIcon )
	local rankTextElem = CoD.CRCommon.GetTextElem( "ExtraSmall", "Left" )
	rankTextElem:setTopBottom( false, true, -CoD.textSize.ExtraSmall, 0 )
	mutables.rankTextElem = rankTextElem
	rankIconContainer:addElement( rankTextElem )
	container:addElement( rankIconContainer )
	mutables:addElement( container )
end

CoD.CRMiniFriendsList.FriendsListButtonData = function ( controller, itemIndex, mutables )
	local playerInfo = Engine.GetPlayerInfoByIndex( controller, itemIndex - 1, CoD.CRMiniFriendsList.MiniFriendsListMode )
	if playerInfo ~= nil then
		mutables.playerXuid = playerInfo.xuid
		mutables.playerName = playerInfo.name
		mutables.playerNameTextElem:setText( mutables.playerName )
		mutables.playerRank = playerInfo.rank
		mutables.rankTextElem:setText( mutables.playerRank )
		mutables.playerRankIcon = playerInfo.rankIcon
		mutables.rankIcon:setImage( RegisterMaterial( mutables.playerRankIcon ) )
		if mutables.playerRank == "0" then
			mutables.rankTextElem:hide()
			mutables.rankIcon:hide()
		end
		mutables.emblem:setupPlayerEmblemByXUID( mutables.playerXuid )
	end
end

CoD.CRMiniFriendsList.SetupMiniFriendsList = function ( self, controller )
	self.m_ownerController = controller
	local top = 20
	local title = CoD.CRCommon.GetTextElem( "Big", "Left", Engine.Localize( "MENU_CHOOSE_FRIEND" ), nil, top )
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
	local listBox = CoD.ListBox.new( listBoxDefaultAnimState, controller, 6, buttonHeight, buttonWidth, CoD.CRMiniFriendsList.FriendsListButtonCreator, CoD.CRMiniFriendsList.FriendsListButtonData, 0 )
	listBox.noDataText = Engine.Localize( "MPUI_NO_FRIENDS" )
	listBox:setTotalItems( Engine.GetPlayerCount( self.m_ownerController, CoD.CRMiniFriendsList.MiniFriendsListMode ) )
	self.listBox = listBox
	listBoxContainer:addElement( listBox )
	self:addElement( listBoxContainer )
end

CoD.CRMiniFriendsList.RefreshList = function ( self, event )
	local mutables = self.listBox:getFocussedMutables()
	local newIndexToFocus = {
		index = 1
	}
	local playerListType = {}
	playerListType = CoD.CRMiniFriendsList.MiniFriendsListMode
	if self.listBox then
		if mutables ~= nil and mutables.playerXuid ~= nil and mutables.playerXuid ~= 0 then
			newIndexToFocus = Engine.GetPlayerIndexByXuid( self, mutables.playerXuid, playerListType )
			newIndexToFocus.index = newIndexToFocus.index + 1
		end
		self.listBox:setTotalItems( Engine.GetPlayerCount( self.m_ownerController, playerListType ), newIndexToFocus.index )
		self.listBox:refresh()
	end
end

CoD.CRMiniFriendsList.MiniFriendsButtonAction = function ( self, event )
	if event and event.mutables then
		local xuid = event.mutables.playerXuid
		if xuid then
			local friendRank = Engine.GetRankByXUID( event.controller, xuid )
			local friendPrestigeLevel = Engine.GetPrestigeByXUID( event.controller, xuid )
			local combatRecordUnlockRank = Engine.GetItemUnlockLevel( Engine.GetItemIndex( "FEATURE_COMBAT_RECORD" ) )
			if friendPrestigeLevel == 0 and friendRank < combatRecordUnlockRank then
				self:openPopup( "CombatRecordLockedForFriend", event.controller, event.mutables.playerName )
			else
				Engine.Exec( event.controller, "getServiceRecord " .. xuid )
				CoD.CRCommon.ComparedXuid = xuid
				CoD.CRCommon.ComparedPlayerName = event.mutables.playerName
			end
		end
	end
end

CoD.CRMiniFriendsList.FriendsStatsFetched = function ( self, event )
	self:processEvent( {
		name = "button_prompt_back"
	} )
end

LUI.createMenu.CRMiniFriendsList = function ( controller )
	local self = CoD.Menu.NewSmallPopup( "CRMiniFriendsList", nil, nil, CoD.CRMiniFriendsList.MiniFriendsListWidth, CoD.CRMiniFriendsList.MiniFriendsListHeight )
	self:setOwner( controller )
	if Engine.GetPlayerCount( self.m_ownerController, CoD.CRMiniFriendsList.MiniFriendsListMode ) > 0 then
		self:addSelectButton()
	end
	self:addBackButton()
	CoD.CRMiniFriendsList.SetupMiniFriendsList( self, controller )
	self:registerEventHandler( "friends_updated", CoD.CRMiniFriendsList.RefreshList )
	self:registerEventHandler( "click", CoD.CRMiniFriendsList.MiniFriendsButtonAction )
	self:registerEventHandler( "service_record_fetched", CoD.CRMiniFriendsList.FriendsStatsFetched )
	Engine.PlaySound( "cac_loadout_edit_sel" )
	return self
end

LUI.createMenu.CombatRecordLockedForFriend = function ( controller, friendName )
	local popup = CoD.Popup.SetupPopup( "CombatRecordLockedForFriend", controller )
	popup:addBackButton()
	popup.title:setText( Engine.Localize( "MENU_NOTICE_CAPS" ) )
	if friendName then
		popup.msg:setText( Engine.Localize( "MPUI_COMBAT_RECORD_LOCKED_FOR_FRIEND", friendName ) )
	end
	return popup
end

