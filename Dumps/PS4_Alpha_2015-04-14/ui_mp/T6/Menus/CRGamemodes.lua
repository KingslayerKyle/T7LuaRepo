require( "ui_mp.T6.Menus.CRMiniFriendsList" )

CoD.CRGamemodes = {}
CoD.CRGamemodes.NumStats = 4
CoD.CRGamemodes.ChallengeIndexArray = {
	tdm = {
		779,
		770,
		940
	},
	dm = {
		779,
		770,
		941
	},
	dom = {
		779,
		770,
		942
	},
	sd = {
		779,
		770,
		943
	},
	ctf = {
		779,
		770,
		945
	},
	hq = {
		779,
		770,
		946
	},
	dem = {
		779,
		770,
		944
	},
	koth = {
		779,
		770,
		947
	},
	conf = {
		779,
		770,
		948
	},
	shrp = {
		779,
		770,
		949
	},
	sas = {
		779,
		770,
		950
	},
	oic = {
		779,
		770,
		951
	},
	gun = {
		779,
		770,
		952
	}
}
CoD.CRGamemodes.ListBoxButtonData = function ( controller, index, mutables )
	local sortedItemInfo = Engine.GetCombatRecordSortedItemInfo( index - 1 )
	if not sortedItemInfo then
		return 
	end
	mutables.sortedItemInfo = sortedItemInfo
	mutables.sortedItemIndex = index - 1
	mutables.itemName:setText( "" )
	mutables.itemValue:setText( "" )
	if sortedItemInfo and sortedItemInfo.itemIndex then
		mutables.itemNameText = Engine.Localize( "MPUI_" .. Engine.GetGametypeName( sortedItemInfo.itemIndex ) )
		mutables.itemName:setText( mutables.itemNameText )
	end
	if sortedItemInfo and sortedItemInfo.itemValue then
		mutables.itemValue:setText( sortedItemInfo.itemValue )
	end
end

CoD.CRGamemodes.SetupElements = function ( self, controller )
	if CoD.CRCommon.CurrentXuid and CoD.CRCommon.CurrentXuid ~= "" and CoD.CRCommon.CurrentXuid ~= "0" then
		self:addElement( CoD.MiniIdentity.GetMiniIdentity( controller, CoD.CRCommon.CurrentXuid ) )
	end
	self.comparisonContainer = CoD.CRCommon.GetComparisonContainer()
	self:addElement( self.comparisonContainer )
	local left = 0
	local top = CoD.Menu.TitleHeight + 20
	self.currGameTypeLabel = CoD.CRCommon.GetTextElem( "Default", "Left", "", CoD.gray, top )
	self:addElement( self.currGameTypeLabel )
	top = top + CoD.textSize.Default + 8
	local boxHeight = 185
	local statsInfoBoxContainer = LUI.UIElement.new()
	statsInfoBoxContainer:setLeftRight( true, true, 0, 0 )
	statsInfoBoxContainer:setTopBottom( true, false, top, top + boxHeight )
	local numStatBoxes = CoD.CRGamemodes.NumStats
	local mainImageWidth = 150
	local mainImageHeight = 150
	self.statsInfoBox = CoD.CRCommon.GetGenericStatsInfoBox( numStatBoxes, mainImageWidth, mainImageHeight )
	statsInfoBoxContainer:addElement( self.statsInfoBox )
	self:addElement( statsInfoBoxContainer )
	local f2_local0 = {}
	local f2_local1 = Engine.Localize( "MENU_LB_WINS" )
	local f2_local2 = Engine.Localize( "MENU_WLRATIO" )
	local f2_local3 = Engine.Localize( "MENU_CURR_WIN_STREAK" )
	local f2_local4 = Engine.Localize( "MENU_BEST_WIN_STREAK" )
	local labels = f2_local1
	self.statsInfoBox:setLabels( labels )
	top = top + boxHeight + 30
	local bottomOffset = 50
	local listBoxWidth = 350
	local titleFontName = "Default"
	local listBoxTitleContainer = LUI.UIElement.new()
	listBoxTitleContainer:setLeftRight( true, false, 8, listBoxWidth - 8 )
	listBoxTitleContainer:setTopBottom( true, false, top, CoD.textSize[titleFontName] )
	local listBoxItemTitle = CoD.CRCommon.GetTextElem( titleFontName, "Left", Engine.Localize( "MENU_GAME_MODE_PRE" ), CoD.gray )
	local listBoxDataTitle = CoD.CRCommon.GetTextElem( titleFontName, "Right", Engine.Localize( "MENU_LB_WINS" ), CoD.gray )
	listBoxTitleContainer:addElement( listBoxItemTitle )
	listBoxTitleContainer:addElement( listBoxDataTitle )
	top = top + 30
	local listBoxContainer = LUI.UIElement.new()
	listBoxContainer:setLeftRight( true, false, 0, listBoxWidth )
	listBoxContainer:setTopBottom( true, true, top, -bottomOffset )
	self:addElement( listBoxTitleContainer )
	self:addElement( listBoxContainer )
	self.listBox = CoD.CRCommon.GetGenericListBox( controller, listBoxWidth, CoD.CRGamemodes.ListBoxButtonData )
	listBoxContainer:addElement( self.listBox )
	local backingWidth = 256
	local backingHeight = backingWidth / 4
	left = CoD.Menu.Width / 2 + 50
	local backingsContainer = CoD.CRCommon.GetGenericBackingsContainer()
	self.backingsContainer = backingsContainer
	local backingBox = LUI.UIElement.new()
	backingBox:setLeftRight( true, true, left, 0 )
	backingBox:setTopBottom( true, true, top, 0 )
	backingBox:addElement( backingsContainer )
	self:addElement( backingBox )
	local sortedItemInfo = Engine.GetCombatRecordSortedItemInfo( 0 )
	if sortedItemInfo and sortedItemInfo.numItems and sortedItemInfo.numItems > 0 then
		self.listBox:setTotalItems( sortedItemInfo.numItems )
	end
end

CoD.CRGamemodes.ListBoxButtonGainFocus = function ( self, event )
	if event.mutables and event.mutables.sortedItemInfo then
		local sortedItemInfo = event.mutables.sortedItemInfo
		local gameTypeIndex = sortedItemInfo.itemIndex
		local gameTypeName = Engine.GetGametypeName( gameTypeIndex )
		local f3_local0 = CoD.CRCommon.GetStats( event.controller, CoD.CRCommon.OtherPlayerCRMode )
		local playerStatsForCurrGameType = f3_local0.PlayerStatsByGameType[gameTypeName]
		local values = {}
		local wins = ""
		local losses = nil
		local wlRatio = ""
		local currWinStreak = ""
		local bestWinStreak = ""
		local compareWins = ""
		local compareLosses = nil
		local compareWlRatio = ""
		local compareCurrWinStreak = ""
		local compareBestWinStreak = ""
		local imageMaterialName = nil
		if gameTypeName then
			self.currGameTypeLabel:setText( Engine.Localize( "MPUI_" .. gameTypeName ) )
		end
		if playerStatsForCurrGameType then
			wins = playerStatsForCurrGameType.WINS.StatValue:get()
			losses = math.max( 1, CoD.CombatRecord.GetLossesStat( playerStatsForCurrGameType.LOSSES.StatValue ) )
			if losses then
				wlRatio = string.format( "%.2f", wins / losses )
			end
			currWinStreak = playerStatsForCurrGameType.CUR_WIN_STREAK.StatValue:get()
			bestWinStreak = playerStatsForCurrGameType.WIN_STREAK.StatValue:get()
			imageMaterialName = CoD.CRCommon.GameTypeImageNames[gameTypeName]
		end
		if CoD.CRCommon.ComparisonModeOn then
			local otherPlayerStatsForCurrGameType = nil
			if CoD.CRCommon.OtherPlayerCRMode then
				local f3_local1 = CoD.CRCommon.GetStats( event.controller )
				otherPlayerStatsForCurrGameType = f3_local1.PlayerStatsByGameType[gameTypeName]
			else
				local f3_local1 = CoD.CRCommon.GetStats( event.controller, true )
				otherPlayerStatsForCurrGameType = f3_local1.PlayerStatsByGameType[gameTypeName]
			end
			if otherPlayerStatsForCurrGameType then
				compareWins = otherPlayerStatsForCurrGameType.WINS.StatValue:get()
				compareLosses = math.max( 1, CoD.CombatRecord.GetLossesStat( otherPlayerStatsForCurrGameType.LOSSES.StatValue ) )
				if losses then
					compareWlRatio = string.format( "%.2f", compareWins / compareLosses )
				end
				compareCurrWinStreak = otherPlayerStatsForCurrGameType.CUR_WIN_STREAK.StatValue:get()
				compareBestWinStreak = otherPlayerStatsForCurrGameType.WIN_STREAK.StatValue:get()
			end
		end
		table.insert( values, {
			baseValue = wins,
			comparisonValue = compareWins
		} )
		table.insert( values, {
			baseValue = wlRatio,
			comparisonValue = compareWlRatio
		} )
		table.insert( values, {
			baseValue = currWinStreak,
			comparisonValue = compareCurrWinStreak
		} )
		table.insert( values, {
			baseValue = bestWinStreak,
			comparisonValue = compareBestWinStreak
		} )
		self.statsInfoBox:update( values, imageMaterialName )
		if gameTypeName and CoD.CRGamemodes.ChallengeIndexArray[gameTypeName] then
			local currChallengeIndexArray = CoD.CRGamemodes.ChallengeIndexArray[gameTypeName]
			local backgroundIds = Engine.GetCombatRecordChallengeBackings( event.controller, event.mutables.sortedItemIndex, CoD.CRCommon.OtherPlayerCRMode == true, currChallengeIndexArray[1], currChallengeIndexArray[2], currChallengeIndexArray[3] )
			self.backingsContainer:updateBackings( event.controller, backgroundIds )
		end
	end
end

CoD.CRGamemodes.CompareStats = function ( self, event )
	if not CoD.CRCommon.OtherPlayerCRMode then
		self:openPopup( "CRMiniFriendsList", event.controller )
	else
		self:processEvent( {
			name = "service_record_fetched"
		} )
	end
end

CoD.CRGamemodes.FriendsStatsFetched = function ( self, event )
	if CoD.CRCommon.ComparisonModeOn == false then
		Engine.PlaySound( "cac_grid_equip_item" )
	end
	CoD.CRCommon.ComparisonModeOn = true
	self.comparisonContainer:update( self.m_ownerController )
	self.listBox:refresh( true )
end

LUI.createMenu.CRGamemodes = function ( controller )
	local self = CoD.Menu.New( "CRGamemodes" )
	self:addLargePopupBackground()
	self:setOwner( controller )
	self:setPreviousMenu( "Barracks" )
	self:addBackButton()
	self.compareButtonPrompt = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_COMPARE" ), self, "compare_stats" )
	self:addLeftButtonPrompt( self.compareButtonPrompt )
	self:addTitle( Engine.ToUpper( Engine.Localize( "MENU_CHALLENGES_GAMEMODES" ) ) )
	Engine.SortItemsForCombatRecord( controller, CoD.CRCommon.SortTypes.GAMEMODES, CoD.CRCommon.OtherPlayerCRMode == true )
	self:registerEventHandler( "listbox_button_gain_focus", CoD.CRGamemodes.ListBoxButtonGainFocus )
	self:registerEventHandler( "service_record_fetched", CoD.CRGamemodes.FriendsStatsFetched )
	self:registerEventHandler( "compare_stats", CoD.CRGamemodes.CompareStats )
	CoD.CRGamemodes.SetupElements( self, controller )
	return self
end

