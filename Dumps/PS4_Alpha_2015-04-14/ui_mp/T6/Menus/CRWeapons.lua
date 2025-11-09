require( "ui_mp.T6.Menus.CRMiniFriendsList" )

CoD.CRWeapons = {}
CoD.CRWeapons.NumStats = 4
CoD.CRWeapons.ChallengeIndexArray = {
	weapon_smg = {
		931,
		29,
		922
	},
	peacekeeper = {
		931,
		223,
		922
	},
	weapon_assault = {
		932,
		44,
		923
	},
	weapon_cqb = {
		933,
		74,
		924
	},
	weapon_lmg = {
		934,
		59,
		925
	},
	weapon_sniper = {
		935,
		89,
		926
	},
	weapon_pistol = {
		936,
		14,
		927
	},
	weapon_shotgun = {
		937,
		74,
		928
	},
	weapon_special = {
		938,
		145,
		929
	},
	weapon_launcher = {
		939,
		122,
		930
	}
}
CoD.CRWeapons.SpecialCaseWeapons = {
	smaw = {
		headshots = true,
		kdRatio = true,
		accuracy = true
	},
	fhj18 = {
		headshots = true,
		kdRatio = true,
		accuracy = true
	},
	usrpg = {
		headshots = true,
		kdRatio = true,
		accuracy = true
	},
	riotshield = {
		headshots = true,
		accuracy = true
	},
	crossbow = {
		headshots = true
	}
}
CoD.CRWeapons.ListBoxButtonData = function ( controller, index, mutables )
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

CoD.CRWeapons.SetupElements = function ( self, controller )
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
	local numStatBoxes = CoD.CRWeapons.NumStats
	local mainImageWidth = 256
	local mainImageHeight = 128
	self.statsInfoBox = CoD.CRCommon.GetGenericStatsInfoBox( numStatBoxes, mainImageWidth, mainImageHeight )
	statsInfoBoxContainer:addElement( self.statsInfoBox )
	self:addElement( statsInfoBoxContainer )
	local f2_local0 = {}
	local f2_local1 = Engine.Localize( "MENU_KILLS" )
	local f2_local2 = Engine.Localize( "MENU_LB_HEADSHOTS" )
	local f2_local3 = Engine.Localize( "MENU_LB_ACCURACY" )
	local f2_local4 = Engine.Localize( "MENU_KD_SHORT" )
	local labels = f2_local1
	self.statsInfoBox:setLabels( labels )
	top = top + boxHeight + 30
	local bottomOffset = 50
	local listBoxWidth = 350
	local titleFontName = "Default"
	local listBoxTitleContainer = LUI.UIElement.new()
	listBoxTitleContainer:setLeftRight( true, false, 8, listBoxWidth - 8 )
	listBoxTitleContainer:setTopBottom( true, false, top, CoD.textSize[titleFontName] )
	local listBoxItemTitle = CoD.CRCommon.GetTextElem( titleFontName, "Left", Engine.Localize( "MPUI_WEAPON" ), CoD.gray )
	local listBoxDataTitle = CoD.CRCommon.GetTextElem( titleFontName, "Right", Engine.Localize( "MENU_KILLS" ), CoD.gray )
	listBoxTitleContainer:addElement( listBoxItemTitle )
	listBoxTitleContainer:addElement( listBoxDataTitle )
	top = top + 30
	local listBoxContainer = LUI.UIElement.new()
	listBoxContainer:setLeftRight( true, false, 0, listBoxWidth )
	listBoxContainer:setTopBottom( true, true, top, -bottomOffset )
	self:addElement( listBoxTitleContainer )
	self:addElement( listBoxContainer )
	self.listBox = CoD.CRCommon.GetGenericListBox( controller, listBoxWidth, CoD.CRWeapons.ListBoxButtonData )
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

CoD.CRWeapons.HideStatForWeapon = function ( itemRef, stat )
	if CoD.CRWeapons.SpecialCaseWeapons[itemRef] and CoD.CRWeapons.SpecialCaseWeapons[itemRef][stat] then
		return true
	else
		
	end
end

CoD.CRWeapons.ListBoxButtonGainFocus = function ( self, event )
	if event.mutables and event.mutables.sortedItemInfo then
		local sortedItemInfo = event.mutables.sortedItemInfo
		local itemIndex = sortedItemInfo.itemIndex
		local f4_local0 = CoD.CRCommon.GetStats( event.controller, CoD.CRCommon.OtherPlayerCRMode )
		local playerStatsForCurrWeapon = f4_local0.ItemStats[itemIndex].stats
		local values = {}
		local kills = ""
		local deaths, hits, shots = nil
		local kdRatio = ""
		local headshots = ""
		local accuracy = ""
		local compareKills = ""
		local compareDeaths, compareHits, compareShots = nil
		local compareKdRatio = ""
		local compareHeadshots = ""
		local compareAccuracy = ""
		local imageMaterialName = nil
		local itemRef = Engine.GetItemRef( itemIndex )
		self.currGameTypeLabel:setText( Engine.Localize( Engine.GetItemName( itemIndex ) ) )
		if playerStatsForCurrWeapon then
			kills = playerStatsForCurrWeapon.kills.StatValue:get()
			deaths = math.max( 1, playerStatsForCurrWeapon.deathsDuringUse.StatValue:get() )
			hits = playerStatsForCurrWeapon.hits.StatValue:get()
			shots = math.max( 1, playerStatsForCurrWeapon.shots.StatValue:get() )
			headshots = playerStatsForCurrWeapon.headshots.StatValue:get()
			if deaths then
				kdRatio = string.format( "%.2f", kills / deaths )
			end
			if shots then
				accuracy = string.format( "%.2f", hits / shots * 100 ) .. "%"
			end
			imageMaterialName = Engine.GetItemImage( itemIndex ) .. "_big"
		end
		if CoD.CRCommon.ComparisonModeOn then
			local otherPlayerStatsForCurrWeapon = nil
			if CoD.CRCommon.OtherPlayerCRMode then
				local f4_local1 = CoD.CRCommon.GetStats( event.controller )
				otherPlayerStatsForCurrWeapon = f4_local1.ItemStats[itemIndex].stats
			else
				local f4_local1 = CoD.CRCommon.GetStats( event.controller, true )
				otherPlayerStatsForCurrWeapon = f4_local1.ItemStats[itemIndex].stats
			end
			if otherPlayerStatsForCurrWeapon then
				compareKills = otherPlayerStatsForCurrWeapon.kills.StatValue:get()
				compareDeaths = math.max( 1, otherPlayerStatsForCurrWeapon.deathsDuringUse.StatValue:get() )
				compareHits = otherPlayerStatsForCurrWeapon.hits.StatValue:get()
				compareShots = math.max( 1, otherPlayerStatsForCurrWeapon.shots.StatValue:get() )
				compareHeadshots = otherPlayerStatsForCurrWeapon.headshots.StatValue:get()
				if deaths then
					compareKdRatio = string.format( "%.2f", compareKills / compareDeaths )
				end
				if shots then
					compareAccuracy = string.format( "%.2f", compareHits / compareShots * 100 ) .. "%"
				end
			end
		end
		if CoD.CRWeapons.HideStatForWeapon( itemRef, "headshots" ) then
			headshots = "--"
			if compareHeadshots ~= "" then
				compareHeadshots = "--"
			end
		end
		if CoD.CRWeapons.HideStatForWeapon( itemRef, "accuracy" ) then
			accuracy = "--"
			if compareAccuracy ~= "" then
				compareAccuracy = "--"
			end
		end
		if CoD.CRWeapons.HideStatForWeapon( itemRef, "kdRatio" ) then
			kdRatio = "--"
			if compareKdRatio ~= "" then
				compareKdRatio = "--"
			end
		end
		table.insert( values, {
			baseValue = kills,
			comparisonValue = compareKills
		} )
		table.insert( values, {
			baseValue = headshots,
			comparisonValue = compareHeadshots
		} )
		table.insert( values, {
			baseValue = accuracy,
			comparisonValue = compareAccuracy
		} )
		table.insert( values, {
			baseValue = kdRatio,
			comparisonValue = compareKdRatio
		} )
		self.statsInfoBox:update( values, imageMaterialName )
		local itemGroup = Engine.GetItemGroup( itemIndex )
		if itemGroup == "weapon_smg" then
			local itemName = Engine.GetItemRef( itemIndex )
			if itemName == "peacekeeper" then
				itemGroup = itemName
			end
		end
		if itemGroup and CoD.CRWeapons.ChallengeIndexArray[itemGroup] then
			local currChallengeIndexArray = CoD.CRWeapons.ChallengeIndexArray[itemGroup]
			local backgroundIds = Engine.GetCombatRecordChallengeBackings( event.controller, event.mutables.sortedItemIndex, CoD.CRCommon.OtherPlayerCRMode == true, currChallengeIndexArray[1], currChallengeIndexArray[2], currChallengeIndexArray[3] )
			self.backingsContainer:updateBackings( event.controller, backgroundIds )
		end
	end
end

CoD.CRWeapons.CompareStats = function ( self, event )
	if not CoD.CRCommon.OtherPlayerCRMode then
		self:openPopup( "CRMiniFriendsList", event.controller )
	else
		self:processEvent( {
			name = "service_record_fetched"
		} )
	end
end

CoD.CRWeapons.FriendsStatsFetched = function ( self, event )
	CoD.CRCommon.ComparisonModeOn = true
	self.comparisonContainer:update( self.m_ownerController )
	self.listBox:refresh( true )
end

LUI.createMenu.CRWeapons = function ( controller )
	local self = CoD.Menu.New( "CRWeapons" )
	self:addLargePopupBackground()
	self:setOwner( controller )
	self:setPreviousMenu( "Barracks" )
	self:addBackButton()
	self.compareButtonPrompt = CoD.ButtonPrompt.new( "alt1", Engine.Localize( "MENU_COMPARE" ), self, "compare_stats" )
	self:addLeftButtonPrompt( self.compareButtonPrompt )
	self:addTitle( Engine.ToUpper( Engine.Localize( "MPUI_WEAPONS_CAPS" ) ) )
	Engine.SortItemsForCombatRecord( controller, CoD.CRCommon.SortTypes.WEAPONS, CoD.CRCommon.OtherPlayerCRMode == true )
	self:registerEventHandler( "listbox_button_gain_focus", CoD.CRWeapons.ListBoxButtonGainFocus )
	self:registerEventHandler( "service_record_fetched", CoD.CRWeapons.FriendsStatsFetched )
	self:registerEventHandler( "compare_stats", CoD.CRWeapons.CompareStats )
	CoD.CRWeapons.SetupElements( self, controller )
	return self
end

