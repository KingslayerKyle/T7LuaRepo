require( "ui_mp.T6.Menus.CRMiniFriendsList" )

CoD.CREquipment = {}
CoD.CREquipment.NumStats = 2
CoD.CREquipment.ChallengeIndexArray = {
	frag_grenade = {
		324,
		-1,
		-1
	},
	hatchet = {
		324,
		-1,
		-1
	},
	sticky_grenade = {
		324,
		-1,
		-1
	},
	satchel_charge = {
		324,
		-1,
		-1
	},
	bouncingbetty = {
		324,
		-1,
		-1
	},
	claymore = {
		324,
		-1,
		-1
	},
	willy_pete = {
		369,
		-1,
		-1
	},
	concussion_grenade = {
		359,
		-1,
		-1
	},
	emp_grenade = {
		354,
		-1,
		-1
	},
	sensor_grenade = {
		379,
		-1,
		-1
	},
	flash_grenade = {
		364,
		-1,
		-1
	},
	proximity_grenade = {
		349,
		-1,
		-1
	},
	pda_hack = {
		389,
		-1,
		-1
	},
	tactical_insertion = {
		374,
		-1,
		-1
	},
	trophy_system = {
		384,
		-1,
		-1
	}
}
CoD.CREquipment.SpecialStatStrings = {
	willy_pete = "MENU_CAPTURES_UNDER_COVER",
	concussion_grenade = "MENU_STUNNED_AND_KILLED",
	emp_grenade = "MENU_EQUIPMENT_DESTROYED",
	sensor_grenade = "MENU_DETECTED_AND_KILLED",
	flash_grenade = "MENU_BLINDED_AND_KILLED",
	proximity_grenade = "MENU_STUNNED_AND_KILLED",
	pda_hack = "MPUI_HACKS",
	tactical_insertion = "MENU_QUICK_KILLS_FROM_SPAWN",
	trophy_system = "MENU_PROJECTILES_DESTROYED"
}
CoD.CREquipment.ListBoxButtonData = function ( controller, index, mutables )
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

CoD.CREquipment.SetupElements = function ( self, controller )
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
	local numStatBoxes = CoD.CREquipment.NumStats
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
	local listBoxItemTitle = CoD.CRCommon.GetTextElem( titleFontName, "Left", Engine.Localize( "MENU_EQUIPMENT" ), CoD.gray )
	local listBoxDataTitle = CoD.CRCommon.GetTextElem( titleFontName, "Right", Engine.Localize( "MENU_USED" ), CoD.gray )
	listBoxTitleContainer:addElement( listBoxItemTitle )
	listBoxTitleContainer:addElement( listBoxDataTitle )
	top = top + 30
	local listBoxContainer = LUI.UIElement.new()
	listBoxContainer:setLeftRight( true, false, 0, listBoxWidth )
	listBoxContainer:setTopBottom( true, true, top, -bottomOffset )
	self:addElement( listBoxTitleContainer )
	self:addElement( listBoxContainer )
	self.listBox = CoD.CRCommon.GetGenericListBox( controller, listBoxWidth, CoD.CREquipment.ListBoxButtonData )
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

CoD.CREquipment.ListBoxButtonGainFocus = function ( self, event )
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
			assists = playerStatsForCurrWeapon.combatRecordStat.StatValue:get()
			imageMaterialName = Engine.GetItemImage( itemIndex ) .. "_256"
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
				compareAssists = otherPlayerStatsForCurrWeapon.combatRecordStat.StatValue:get()
			end
		end
		table.insert( values, {
			baseValue = used,
			comparisonValue = compareUsed
		} )
		local labels = nil
		local itemRef = Engine.GetItemRef( itemIndex )
		if CoD.IsLethalGrenade( itemIndex ) then
			local f3_local2 = {}
			local f3_local3 = Engine.Localize( "MENU_USED" )
			local f3_local4 = Engine.Localize( "MENU_KILLS" )
			labels = f3_local3
			table.insert( values, {
				baseValue = kills,
				comparisonValue = compareKills
			} )
		else
			local specificLabel = Engine.Localize( "MENU_ASSISTS" )
			if itemRef and CoD.CREquipment.SpecialStatStrings[itemRef] then
				specificLabel = Engine.Localize( CoD.CREquipment.SpecialStatStrings[itemRef] )
			end
			labels = {
				Engine.Localize( "MENU_USED" ),
				specificLabel
			}
			table.insert( values, {
				baseValue = assists,
				comparisonValue = compareAssists
			} )
		end
		self.statsInfoBox:setLabels( labels )
		self.statsInfoBox:update( values, imageMaterialName )
		if itemRef and CoD.CREquipment.ChallengeIndexArray[itemRef] then
			local currChallengeIndexArray = CoD.CREquipment.ChallengeIndexArray[itemRef]
			local backgroundIds = Engine.GetCombatRecordChallengeBackings( event.controller, event.mutables.sortedItemIndex, CoD.CRCommon.OtherPlayerCRMode == true, currChallengeIndexArray[1], currChallengeIndexArray[2], currChallengeIndexArray[3] )
			self.backingsContainer:updateBackings( event.controller, backgroundIds )
		end
	end
end

CoD.CREquipment.CompareStats = function ( self, event )
	if not CoD.CRCommon.OtherPlayerCRMode then
		self:openPopup( "CRMiniFriendsList", event.controller )
	else
		self:processEvent( {
			name = "service_record_fetched"
		} )
	end
end

CoD.CREquipment.FriendsStatsFetched = function ( self, event )
	CoD.CRCommon.ComparisonModeOn = true
	self.comparisonContainer:update( self.m_ownerController )
	self.listBox:refresh( true )
end

LUI.createMenu.CREquipment = function ( controller )
	local self = CoD.Menu.New( "CREquipment" )
	self:addLargePopupBackground()
	self:setOwner( controller )
	self:setPreviousMenu( "Barracks" )
	self:addBackButton()
	self.compareButtonPrompt = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_COMPARE" ), self, "compare_stats" )
	self:addLeftButtonPrompt( self.compareButtonPrompt )
	self:addTitle( Engine.ToUpper( Engine.Localize( "MPUI_EQUIPMENT_CAPS" ) ) )
	Engine.SortItemsForCombatRecord( controller, CoD.CRCommon.SortTypes.EQUIPMENT, CoD.CRCommon.OtherPlayerCRMode == true )
	self:registerEventHandler( "listbox_button_gain_focus", CoD.CREquipment.ListBoxButtonGainFocus )
	self:registerEventHandler( "service_record_fetched", CoD.CREquipment.FriendsStatsFetched )
	self:registerEventHandler( "compare_stats", CoD.CREquipment.CompareStats )
	CoD.CREquipment.SetupElements( self, controller )
	return self
end

