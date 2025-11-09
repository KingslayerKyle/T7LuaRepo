require( "ui_mp.T6.Menus.CRMiniFriendsList" )

CoD.CRScorestreaks = {}
CoD.CRScorestreaks.NumStats = 2
CoD.CRScorestreaks.ChallengeIndexArray = {
	killstreak_rcbomb = {
		126,
		-1,
		-1
	},
	killstreak_spyplane = {
		819,
		-1,
		-1
	},
	killstreak_missile_drone = {
		130,
		-1,
		-1
	},
	killstreak_counteruav = {
		827,
		-1,
		-1
	},
	killstreak_supply_drop = {
		-1,
		-1,
		-1
	},
	killstreak_microwave_turret = {
		823,
		-1,
		-1
	},
	killstreak_remote_missile = {
		130,
		-1,
		-1
	},
	killstreak_planemortar = {
		130,
		-1,
		-1
	},
	killstreak_auto_turret = {
		126,
		-1,
		-1
	},
	killstreak_minigun = {
		126,
		-1,
		-1
	},
	killstreak_m32 = {
		126,
		-1,
		-1
	},
	killstreak_qrdrone = {
		130,
		-1,
		-1
	},
	killstreak_ai_tank_drop = {
		126,
		-1,
		-1
	},
	killstreak_helicopter_comlink = {
		130,
		-1,
		-1
	},
	killstreak_spyplane_direction = {
		835,
		-1,
		-1
	},
	killstreak_helicopter_guard = {
		130,
		-1,
		-1
	},
	killstreak_straferun = {
		130,
		-1,
		-1
	},
	killstreak_emp = {
		831,
		-1,
		-1
	},
	killstreak_remote_mortar = {
		130,
		-1,
		-1
	},
	killstreak_helicopter_player_gunner = {
		130,
		-1,
		-1
	},
	killstreak_dogs = {
		126,
		-1,
		-1
	},
	killstreak_missile_swarm = {
		130,
		-1,
		-1
	}
}
CoD.CRScorestreaks.ListBoxButtonData = function ( controller, index, mutables )
	local sortedItemInfo = Engine.GetCombatRecordSortedItemInfo( index - 1 )
	if not sortedItemInfo then
		return 
	end
	mutables.sortedItemInfo = sortedItemInfo
	mutables.sortedItemIndex = index - 1
	mutables.itemName:setText( "" )
	mutables.itemValue:setText( "" )
	if sortedItemInfo and sortedItemInfo.itemIndex then
		mutables.itemNameText = Engine.Localize( Engine.GetItemName( sortedItemInfo.itemIndex ) )
		mutables.itemName:setText( mutables.itemNameText )
	end
	if sortedItemInfo and sortedItemInfo.itemValue then
		mutables.itemValue:setText( sortedItemInfo.itemValue )
	end
end

CoD.CRScorestreaks.SetupElements = function ( self, controller )
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
	local numStatBoxes = CoD.CRScorestreaks.NumStats
	local mainImageWidth = 150
	local mainImageHeight = 150
	self.statsInfoBox = CoD.CRCommon.GetGenericStatsInfoBox( numStatBoxes, mainImageWidth, mainImageHeight, 200 )
	statsInfoBoxContainer:addElement( self.statsInfoBox )
	self:addElement( statsInfoBoxContainer )
	top = top + boxHeight + 30
	local bottomOffset = 50
	local listBoxWidth = 350
	local titleFontName = "Default"
	local listBoxTitleContainer = LUI.UIElement.new()
	listBoxTitleContainer:setLeftRight( true, false, 8, listBoxWidth - 8 )
	listBoxTitleContainer:setTopBottom( true, false, top, CoD.textSize[titleFontName] )
	local listBoxItemTitle = CoD.CRCommon.GetTextElem( titleFontName, "Left", Engine.Localize( "MPUI_KILLSTREAK" ), CoD.gray )
	local listBoxDataTitle = CoD.CRCommon.GetTextElem( titleFontName, "Right", Engine.Localize( "MENU_USED" ), CoD.gray )
	listBoxTitleContainer:addElement( listBoxItemTitle )
	listBoxTitleContainer:addElement( listBoxDataTitle )
	top = top + 30
	local listBoxContainer = LUI.UIElement.new()
	listBoxContainer:setLeftRight( true, false, 0, listBoxWidth )
	listBoxContainer:setTopBottom( true, true, top, -bottomOffset )
	self:addElement( listBoxTitleContainer )
	self:addElement( listBoxContainer )
	self.listBox = CoD.CRCommon.GetGenericListBox( controller, listBoxWidth, CoD.CRScorestreaks.ListBoxButtonData )
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

CoD.CRScorestreaks.ListBoxButtonGainFocus = function ( self, event )
	if event.mutables and event.mutables.sortedItemInfo then
		local sortedItemInfo = event.mutables.sortedItemInfo
		local itemIndex = sortedItemInfo.itemIndex
		local f3_local0 = CoD.CRCommon.GetStats( event.controller, CoD.CRCommon.OtherPlayerCRMode )
		local playerStatsForCurrWeapon = f3_local0.ItemStats[itemIndex].stats
		local values = {}
		local used = ""
		local kills = ""
		local assists = ""
		local compareUsed = ""
		local compareKills = ""
		local compareAssists = ""
		local imageMaterialName = nil
		self.currGameTypeLabel:setText( Engine.Localize( Engine.GetItemName( itemIndex ) ) )
		if playerStatsForCurrWeapon then
			used = playerStatsForCurrWeapon.used.StatValue:get()
			kills = playerStatsForCurrWeapon.kills.StatValue:get()
			assists = playerStatsForCurrWeapon.assists.StatValue:get()
			imageMaterialName = Engine.GetItemImage( itemIndex ) .. "_menu"
		end
		if CoD.CRCommon.ComparisonModeOn then
			local otherPlayerStatsForCurrWeapon = nil
			if CoD.CRCommon.OtherPlayerCRMode then
				local f3_local1 = CoD.CRCommon.GetStats( event.controller )
				otherPlayerStatsForCurrWeapon = f3_local1.ItemStats[itemIndex].stats
			else
				local f3_local1 = CoD.CRCommon.GetStats( event.controller, true )
				otherPlayerStatsForCurrWeapon = f3_local1.ItemStats[itemIndex].stats
			end
			if otherPlayerStatsForCurrWeapon then
				compareUsed = otherPlayerStatsForCurrWeapon.used.StatValue:get()
				compareKills = otherPlayerStatsForCurrWeapon.kills.StatValue:get()
				compareAssists = otherPlayerStatsForCurrWeapon.assists.StatValue:get()
			end
		end
		table.insert( values, {
			baseValue = used,
			comparisonValue = compareUsed
		} )
		local labels = nil
		local passiveColumnValue = Engine.TableLookup( controller, "mp/statsTable.csv", 0, tostring( itemIndex ), 1 )
		if passiveColumnValue ~= "passive" then
			local f3_local2 = {}
			local f3_local3 = Engine.Localize( "MENU_USED" )
			local f3_local4 = Engine.Localize( "MENU_KILLS" )
			labels = f3_local3
			table.insert( values, {
				baseValue = kills,
				comparisonValue = compareKills
			} )
		else
			local f3_local2 = {}
			local f3_local3 = Engine.Localize( "MENU_USED" )
			local f3_local4 = Engine.Localize( "MENU_ASSISTS" )
			labels = f3_local3
			table.insert( values, {
				baseValue = assists,
				comparisonValue = compareAssists
			} )
		end
		self.statsInfoBox:setLabels( labels )
		self.statsInfoBox:update( values, imageMaterialName )
		local itemRef = Engine.GetItemRef( itemIndex )
		if itemRef and CoD.CREquipment.ChallengeIndexArray[itemRef] then
			local currChallengeIndexArray = CoD.CRScorestreaks.ChallengeIndexArray[itemGroup]
			local backgroundIds = Engine.GetCombatRecordChallengeBackings( event.controller, event.mutables.sortedItemIndex, CoD.CRCommon.OtherPlayerCRMode == true, currChallengeIndexArray[1], currChallengeIndexArray[2], currChallengeIndexArray[3] )
			self.backingsContainer:updateBackings( event.controller, backgroundIds )
		end
	end
end

CoD.CRScorestreaks.CompareStats = function ( self, event )
	if not CoD.CRCommon.OtherPlayerCRMode then
		self:openPopup( "CRMiniFriendsList", event.controller )
	else
		self:processEvent( {
			name = "service_record_fetched"
		} )
	end
end

CoD.CRScorestreaks.FriendsStatsFetched = function ( self, event )
	CoD.CRCommon.ComparisonModeOn = true
	self.comparisonContainer:update( self.m_ownerController )
	self.listBox:refresh( true )
end

LUI.createMenu.CRScorestreaks = function ( controller )
	local self = CoD.Menu.New( "CRScorestreaks" )
	self:addLargePopupBackground()
	self:setOwner( controller )
	self:setPreviousMenu( "Barracks" )
	self:addBackButton()
	self.compareButtonPrompt = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_COMPARE" ), self, "compare_stats" )
	self:addLeftButtonPrompt( self.compareButtonPrompt )
	self:addTitle( Engine.ToUpper( Engine.Localize( "MENU_SCORE_STREAKS_CAPS" ) ) )
	Engine.SortItemsForCombatRecord( controller, CoD.CRCommon.SortTypes.SCORESTREAKS, CoD.CRCommon.OtherPlayerCRMode == true )
	self:registerEventHandler( "listbox_button_gain_focus", CoD.CRScorestreaks.ListBoxButtonGainFocus )
	self:registerEventHandler( "service_record_fetched", CoD.CRScorestreaks.FriendsStatsFetched )
	self:registerEventHandler( "compare_stats", CoD.CRScorestreaks.CompareStats )
	CoD.CRScorestreaks.SetupElements( self, controller )
	return self
end

