CoD.EmblemBackgroundSelector = {}
CoD.EmblemBackgroundSelector.GridWidth = 562
CoD.EmblemBackgroundSelector.GridHeight = 550
CoD.EmblemBackgroundSelector.ContentPaneY = CoD.textSize.Big + 15
CoD.EmblemBackgroundSelector.EmblemPaneWidth = 240
CoD.EmblemBackgroundSelector.BackgroundTitleY = 180
CoD.EmblemBackgroundSelector.BackgroundDescY = CoD.EmblemBackgroundSelector.BackgroundTitleY + CoD.textSize.Condensed
CoD.EmblemBackgroundSelector.BackgroundDescWidth = CoD.EmblemBackgroundSelector.EmblemPaneWidth
CoD.EmblemBackgroundSelector.ProgressBarTop = 320
CoD.EmblemBackgroundSelector.EmblemBackgroundAspectRatio = 4
CoD.EmblemBackgroundSelector.EmblemBackgroundPreviewHeight = CoD.EmblemBackgroundSelector.EmblemPaneWidth / CoD.EmblemBackgroundSelector.EmblemBackgroundAspectRatio
CoD.EmblemBackgroundSelector.EmblemBackgroundPreviewWidth = CoD.EmblemBackgroundSelector.EmblemPaneWidth
CoD.EmblemBackgroundSelector.EmblemCroppedEmblemSize = CoD.EmblemBackgroundSelector.EmblemBackgroundPreviewHeight
CoD.EmblemBackgroundSelector.BackgroundRowsPerPage = 7
CoD.EmblemBackgroundSelector.BackgroundColumnsPerPage = 3
CoD.EmblemBackgroundSelector.GeneralFilterId = 1
CoD.EmblemBackgroundSelector.WeaponsFilterId = 2
CoD.EmblemBackgroundSelector.GameModesFilterId = 3
CoD.EmblemBackgroundSelector.PrestigeFilterId = 4
CoD.EmblemBackgroundSelector.DLCFilterId = 5
CoD.EmblemBackgroundSelector.GeneralBGTab = 1
CoD.EmblemBackgroundSelector.WeaponsBGTab = 2
CoD.EmblemBackgroundSelector.GameModesBGTab = 3
CoD.EmblemBackgroundSelector.PrestigeBGTab = 4
CoD.EmblemBackgroundSelector.DLCBGTab = 5
CoD.EmblemBackgroundSelector.EMBLEMS_INVALID_BACKGROUND_ID = -1
CoD.EmblemBackgroundSelector.EMBLEMS_INVALID_BACKGROUND_INDEX = -1
LUI.createMenu.EmblemBackgroundSelector = function ( controller )
	local backgroundSelectorMenu = CoD.Menu.New( "EmblemBackgroundSelector" )
	Engine.ExecNow( controller, "emblemBackgroundFlushResults" )
	backgroundSelectorMenu:addLargePopupBackground()
	backgroundSelectorMenu:setOwner( controller )
	backgroundSelectorMenu:setPreviousMenu( "Barracks" )
	backgroundSelectorMenu:addTitle( Engine.ToUpper( Engine.Localize( "MENU_PLAYERID_BACKGROUNDS_CAPS" ) ) )
	if CoD.CRCommon.CRMode == true then
		backgroundSelectorMenu:setPreviousMenu( "CRCareer" )
		CoD.CRCommon.CRMode = false
		CoD.perController[controller].CRFocusCurrentBg = true
		backgroundSelectorMenu.CRMode = true
		backgroundSelectorMenu.CRCurrentBgIndex = CoD.perController[controller].CRCurrentBgIndex
	end
	backgroundSelectorMenu:registerEventHandler( "select_button_pressed", CoD.EmblemBackgroundSelector.BackgroundSelected )
	backgroundSelectorMenu:registerEventHandler( "hide_select_button", CoD.EmblemBackgroundSelector.HideSelectButton )
	backgroundSelectorMenu:registerEventHandler( "show_select_button", CoD.EmblemBackgroundSelector.ShowSelectButton )
	backgroundSelectorMenu:registerEventHandler( "set_background_information", CoD.EmblemBackgroundSelector.SetBackgroundInformation )
	backgroundSelectorMenu:registerEventHandler( "set_default_background_information", CoD.EmblemBackgroundSelector.SetDefaultBackgroundInformation )
	backgroundSelectorMenu:registerEventHandler( "clear_description", CoD.EmblemBackgroundSelector.ClearDescription )
	backgroundSelectorMenu:registerEventHandler( "locked_elite_camo_selected", CoD.EmblemBackgroundSelector.LockedEliteCamoSelected )
	backgroundSelectorMenu:addSelectButton()
	backgroundSelectorMenu:addBackButton()
	
	local backgroundSelectorGrid = LUI.UIElement.new()
	backgroundSelectorGrid:setLeftRight( false, true, -5 - CoD.EmblemBackgroundSelector.GridWidth, -5 )
	backgroundSelectorGrid:setTopBottom( true, false, CoD.EmblemBackgroundSelector.ContentPaneY, CoD.EmblemBackgroundSelector.ContentPaneY + CoD.EmblemBackgroundSelector.GridHeight )
	backgroundSelectorMenu:addElement( backgroundSelectorGrid )
	backgroundSelectorMenu.grid = backgroundSelectorGrid
	
	CoD.EmblemBackgroundSelector.GetTabSelected( controller, backgroundSelectorMenu )
	CoD.EmblemBackgroundSelector.CreateTabs( backgroundSelectorMenu, controller )
	local challengeName = LUI.UIText.new()
	challengeName:setLeftRight( true, false, 0, 0 )
	challengeName:setTopBottom( true, false, CoD.EmblemBackgroundSelector.BackgroundTitleY, CoD.EmblemBackgroundSelector.BackgroundTitleY + CoD.textSize.Condensed )
	challengeName:setFont( CoD.fonts.Condensed )
	challengeName:setText( "" )
	backgroundSelectorMenu.challengeName = challengeName
	backgroundSelectorMenu:addElement( challengeName )
	local challengeDesc = LUI.UIText.new()
	challengeDesc:setLeftRight( true, false, 0, CoD.EmblemBackgroundSelector.BackgroundDescWidth )
	challengeDesc:setTopBottom( true, false, CoD.EmblemBackgroundSelector.BackgroundDescY, CoD.EmblemBackgroundSelector.BackgroundDescY + CoD.textSize.ExtraSmall )
	challengeDesc:setFont( CoD.fonts.ExtraSmall )
	challengeDesc:setAlignment( LUI.Alignment.Left )
	challengeDesc:setText( "" )
	backgroundSelectorMenu.challengeDesc = challengeDesc
	backgroundSelectorMenu:addElement( challengeDesc )
	local progressBarWidth = 240
	local progressBarDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = progressBarWidth,
		topAnchor = true,
		bottomAnchor = true,
		top = CoD.EmblemBackgroundSelector.ProgressBarTop,
		bottom = 0
	}
	backgroundSelectorMenu.progressBar = CoD.ChallengeProgressBar.new( progressBarDefaultAnimState, progressBarWidth )
	backgroundSelectorMenu:addElement( backgroundSelectorMenu.progressBar )
	backgroundSelectorMenu.progressBar:hide()
	local tierDescTop = CoD.EmblemBackgroundSelector.ProgressBarTop + 60
	local tierDescText = LUI.UIText.new()
	tierDescText:setLeftRight( true, false, 0, progressBarWidth )
	tierDescText:setTopBottom( true, false, tierDescTop, tierDescTop + CoD.textSize.ExtraSmall )
	tierDescText:setFont( CoD.fonts.ExtraSmall )
	tierDescText:setRGB( CoD.gray.r, CoD.gray.g, CoD.gray.b )
	tierDescText:setAlignment( LUI.Alignment.Left )
	backgroundSelectorMenu.tierDescText = tierDescText
	backgroundSelectorMenu:addElement( backgroundSelectorMenu.tierDescText )
	return backgroundSelectorMenu
end

CoD.EmblemBackgroundSelector.ClearDescription = function ( self, event )
	self.challengeName:setText( "" )
	self.challengeDesc:setText( "" )
	self.progressBar:hide()
end

CoD.EmblemBackgroundSelector.LockedEliteCamoSelected = function ( self, event )
	self:openPopup( "EliteRegistrationEmailPopup", event.controller )
end

CoD.EmblemBackgroundSelector.GetDefaultBackgroundName = function ( controller, selectedBackgroundId )
	local tableName = "gamedata/emblems/emblemsOrBackings.csv"
	local challengeName = Engine.TableLookup( controller, tableName, 0, "background", 1, selectedBackgroundId, 4 )
	return challengeName
end

CoD.EmblemBackgroundSelector.GetBackgroundPLevel = function ( controller, selectedBackgroundId )
	local tableName = "gamedata/emblems/emblemsOrBackings.csv"
	local pLevel = tonumber( Engine.TableLookup( controller, tableName, 0, "background", 1, selectedBackgroundId, 7 ) )
	return pLevel
end

CoD.EmblemBackgroundSelector.SetDefaultBackgroundInformation = function ( self, event )
	local selectedBackgroundId = Engine.GetEmblemFilterBGId( event.controller, event.tab.filterId, event.tab.selectedBackgroundIndex )
	local challengeName = CoD.EmblemBackgroundSelector.GetDefaultBackgroundName( event.controller, selectedBackgroundId )
	local pLevel = CoD.EmblemBackgroundSelector.GetBackgroundPLevel( event.controller, selectedBackgroundId )
	self.challengeName:setText( Engine.Localize( challengeName ) )
	if CoD.CACUtility.IsBackingMTX( selectedBackgroundId ) then
		local mtxName = CoD.CACUtility.GetBackingMTXName( selectedBackgroundId )
		self.challengeDesc:setText( Engine.Localize( "MPUI_MTX_PURCHASE_HINT", Engine.Localize( "MPUI_" .. mtxName ) ) )
	elseif pLevel > 0 then
		local prestigeDescText = Engine.Localize( "CLASS_PRESTIGE_UNLOCK_DESC", pLevel )
		if pLevel == tonumber( CoD.MAX_PRESTIGE ) then
			prestigeDescText = Engine.Localize( "EM_BACK_PRESIGE_MASTER_UNLOCK" )
		end
		self.challengeDesc:setText( prestigeDescText )
	else
		self.challengeDesc:setText( Engine.Localize( "EM_DEFAULT_BACKGROUND_DESC" ) )
	end
	self.tierDescText:hide()
	self.progressBar:hide()
end

CoD.EmblemBackgroundSelector.SetBackgroundInformation = function ( self, event )
	if event.challengeInfo then
		local currVal = event.challengeInfo.currVal
		local maxVal = tonumber( event.challengeInfo.maxVal )
		self.tierDescText:hide()
		self.progressBar:hide()
		if event.challengeInfo.challengeUnlocked and maxVal > 1 and currVal < maxVal then
			self.progressBar:show()
			self.progressBar:update( currVal, maxVal )
		end
		self.challengeName:setText( event.challengeInfo.challengeName )
		self.challengeDesc:setText( event.challengeInfo.challengeDesc )
		local isTieredChallenge = event.challengeInfo.isTieredChallenge
		local currentChallengeTier = event.challengeInfo.currentChallengeTier
		local maxChallengeTier = event.challengeInfo.maxChallengeTier
		if isTieredChallenge and currentChallengeTier and maxChallengeTier and currentChallengeTier ~= -1 and maxChallengeTier > 0 then
			self.tierDescText:show()
			self.tierDescText:setText( Engine.Localize( "MENU_CHALLENGE_TIER_DESC", currentChallengeTier + 1, maxChallengeTier + 1, maxChallengeTier + 1 ) )
		end
	else
		self.challengeName:setText( "" )
		self.challengeDesc:setText( "" )
		self.progressBar:hide()
	end
end

CoD.EmblemBackgroundSelector.ShowSelectButton = function ( self, event )
	if self.selectButton == nil then
		self:addSelectButton( event.promptString, -100 )
	elseif self.selectButton.labelText ~= event.promptString then
		self.selectButton:close()
		self.selectButton = nil
		self:addSelectButton( event.promptString, -100 )
	end
	self.isCurrentChoiceAvailable = true
	self.customEvent = event.customEvent
end

CoD.EmblemBackgroundSelector.HideSelectButton = function ( self, event )
	self:removeSelectButton()
	self.isCurrentChoiceAvailable = false
end

CoD.EmblemBackgroundSelector.BackgroundSelected = function ( self, event )
	if self.isCurrentChoiceAvailable then
		if event.selectedBackgroundId then
			Engine.SetEmblemBackgroundAsOld( event.controller, event.selectedBackgroundId )
		end
		if self.customEvent then
			self:processEvent( {
				name = self.customEvent,
				controller = event.controller
			} )
			return 
		elseif CoD.CACUtility.IsBackingMTX( event.selectedBackgroundId ) then
			local mtxName = CoD.CACUtility.GetBackingMTXName( event.selectedBackgroundId )
			if not Engine.HasMTX( event.controller, mtxName ) then
				if Engine.IsGuest( event.controller ) then
					local errorPopup = self:openPopup( "Error", controller )
					errorPopup:setMessage( Engine.Localize( "XBOXLIVE_NOGUESTACCOUNTS" ) )
				elseif CoD.isPS3 then
					self:openPopup( "MTXPurchase", event.controller, {
						mtxName = mtxName,
						openingMenuName = "emblem"
					} )
				else
					Engine.PurchaseMTX( event.controller, mtxName, "emblem" )
				end
				return 
			end
		end
		if self.CRMode then
			CoD.CRCareer.SetBackgroundID( event.controller, event.selectedBackgroundId, self.CRCurrentBgIndex )
		else
			Engine.Exec( event.controller, "uploadstats" )
			Engine.ExecNow( event.controller, "emblemsetprofile" )
		end
		self:goBack( event.controller )
	end
end

CoD.EmblemBackgroundSelector.IsValidEmblemBackgroundForCategory = function ( controller, filterId, backgroundId )
	if Engine.GetEmblemBackgroundIndexInCategory( controller, filterId, backgroundId ) ~= CoD.EmblemBackgroundSelector.EMBLEMS_INVALID_BACKGROUND_INDEX then
		return true
	else
		return false
	end
end

CoD.EmblemBackgroundSelector.GetTabSelected = function ( controller, backgroundSelectorMenu )
	backgroundSelectorMenu.tabSelected = 1
	backgroundSelectorMenu.selectedBackgroundIndex = 0
	local backgroundId = Engine.GetEmblemBackgroundId()
	backgroundSelectorMenu.backgroundId = backgroundId
	if CoD.EmblemBackgroundSelector.IsValidEmblemBackgroundForCategory( controller, CoD.EmblemBackgroundSelector.GeneralFilterId, backgroundId ) then
		backgroundSelectorMenu.tabSelected = CoD.EmblemBackgroundSelector.GeneralBGTab
		backgroundSelectorMenu.selectedBackgroundIndex = Engine.GetEmblemBackgroundIndexInCategory( controller, CoD.EmblemBackgroundSelector.GeneralFilterId, backgroundId )
	elseif CoD.EmblemBackgroundSelector.IsValidEmblemBackgroundForCategory( controller, CoD.EmblemBackgroundSelector.WeaponsFilterId, backgroundId ) then
		backgroundSelectorMenu.tabSelected = CoD.EmblemBackgroundSelector.WeaponsBGTab
		backgroundSelectorMenu.selectedBackgroundIndex = Engine.GetEmblemBackgroundIndexInCategory( controller, CoD.EmblemBackgroundSelector.WeaponsFilterId, backgroundId )
	elseif CoD.EmblemBackgroundSelector.IsValidEmblemBackgroundForCategory( controller, CoD.EmblemBackgroundSelector.GameModesFilterId, backgroundId ) then
		backgroundSelectorMenu.tabSelected = CoD.EmblemBackgroundSelector.GameModesBGTab
		backgroundSelectorMenu.selectedBackgroundIndex = Engine.GetEmblemBackgroundIndexInCategory( controller, CoD.EmblemBackgroundSelector.GameModesFilterId, backgroundId )
	elseif CoD.EmblemBackgroundSelector.IsValidEmblemBackgroundForCategory( controller, CoD.EmblemBackgroundSelector.PrestigeFilterId, backgroundId ) then
		backgroundSelectorMenu.tabSelected = CoD.EmblemBackgroundSelector.PrestigeBGTab
		backgroundSelectorMenu.selectedBackgroundIndex = Engine.GetEmblemBackgroundIndexInCategory( controller, CoD.EmblemBackgroundSelector.PrestigeFilterId, backgroundId )
	elseif CoD.EmblemBackgroundSelector.IsValidEmblemBackgroundForCategory( controller, CoD.EmblemBackgroundSelector.DLCFilterId, backgroundId ) then
		backgroundSelectorMenu.tabSelected = CoD.EmblemBackgroundSelector.DLCBGTab
		backgroundSelectorMenu.selectedBackgroundIndex = Engine.GetEmblemBackgroundIndexInCategory( controller, CoD.EmblemBackgroundSelector.DLCFilterId, backgroundId )
	else
		backgroundSelectorMenu.tabSelected = 1
		backgroundSelectorMenu.selectedBackgroundIndex = 0
	end
end

CoD.EmblemBackgroundSelector.CreateTabs = function ( backgroundSelectorMenu, controller )
	local backgroundSelectorGrid = backgroundSelectorMenu.grid
	local contentPane = LUI.UIElement.new()
	contentPane:setLeftRight( true, true, 0, 0 )
	contentPane:setTopBottom( true, true, CoD.textSize.Default + 10, 0 )
	backgroundSelectorGrid:addElement( contentPane )
	local tabManagerDefaultAnimationState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = CoD.ButtonPrompt.Height
	}
	local tabManager = CoD.MFTabManager.new( contentPane, tabManagerDefaultAnimationState )
	tabManager:keepRightBumperAlignedToHeader( true )
	backgroundSelectorGrid.tabManager = tabManager
	backgroundSelectorGrid:addElement( tabManager )
	tabManager.tabSelected = backgroundSelectorMenu.tabSelected
	tabManager.selectedBackgroundIndex = backgroundSelectorMenu.selectedBackgroundIndex
	tabManager:addTab( controller, "MENU_EMBLEM_BACKGROUND_GENERALTAB", CoD.EmblemBackgroundSelector.PrepareGeneralBGTab )
	tabManager:addTab( controller, "MENU_EMBLEM_BACKGROUND_WEAPONSTAB", CoD.EmblemBackgroundSelector.PrepareWeaponsBGTab )
	tabManager:addTab( controller, "MENU_EMBLEM_BACKGROUND_GAMEMODESTAB", CoD.EmblemBackgroundSelector.PrepareGameModesBGTab )
	tabManager:addTab( controller, "MENU_EMBLEM_BACKGROUND_PRESTIGETAB", CoD.EmblemBackgroundSelector.PreparePrestigeBGTab )
	tabManager:addTab( controller, "MPUI_MAP_CATEGORY_DLC_CAPS", CoD.EmblemBackgroundSelector.PrepareDLCBGTab )
	tabManager:refreshTab( controller )
	tabManager:registerEventHandler( "mtx_changed", CoD.EmblemBackgroundSelector.HandleMTXChanged )
end

CoD.EmblemBackgroundSelector.SetupGamepadButton = function ( tab )
	tab.leftRepeater = LUI.UIButtonRepeater.new( "left", {
		name = "gamepad_button",
		button = "left",
		down = true
	} )
	tab.rightRepeater = LUI.UIButtonRepeater.new( "right", {
		name = "gamepad_button",
		button = "right",
		down = true
	} )
	tab:addElement( tab.leftRepeater )
	tab:addElement( tab.rightRepeater )
	tab.upRepeater = LUI.UIButtonRepeater.new( "up", {
		name = "gamepad_button",
		button = "up",
		down = true
	} )
	tab.downRepeater = LUI.UIButtonRepeater.new( "down", {
		name = "gamepad_button",
		button = "down",
		down = true
	} )
	tab:addElement( tab.upRepeater )
	tab:addElement( tab.downRepeater )
	tab.handleGamepadButton = CoD.EmblemBackgroundSelector.HandleGamepadButton
	tab:registerEventHandler( "selection_changed", CoD.EmblemBackgroundSelector.SelectionChanged )
	tab:registerEventHandler( "selection_clicked", CoD.EmblemBackgroundSelector.SelectionClicked )
end

CoD.EmblemBackgroundSelector.SelectionClicked = function ( tab, event )
	CoD.EmblemBackgroundSelector.SelectionChanged( tab, event )
	tab:dispatchEventToParent( {
		name = "select_button_pressed",
		controller = event.controller
	} )
end

CoD.EmblemBackgroundSelector.GetChallengeInformation = function ( controller, selectedIconId )
	local challengeInfo = Engine.GetChallengeInfoByEmblemOrBackingId( controller, selectedIconId, CoD.BACKING )
	if not challengeInfo then
		return challengeInfo
	end
	local currentStats = CoD.GetPlayerStats( controller )
	local rank = currentStats.PlayerStatsList.RANK.StatValue:get()
	local plevel = currentStats.PlayerStatsList.PLEVEL.StatValue:get()
	local currInfo = challengeInfo[1]
	currInfo.challengeUnlocked = nil
	currInfo.currVal = -1
	currInfo.maxVal = -1
	currInfo.challengeName = ""
	currInfo.challengeDesc = ""
	if currInfo ~= nil then
		local challengeRow = currInfo.challengeRow
		local tableNumber = currInfo.tableNum
		local challengeName = ""
		local challengeDesc = ""
		local xpReward = -1
		local unlockLevel = 0
		local unlockPLevel = 0
		local tableName = nil
		local maxVal = -1
		local challengeType = currInfo.challengeType
		local itemName = ""
		local localizedTierText = ""
		local challengeUnlocked, isTieredChallenge = nil
		local isDefault = currInfo.isDefault
		local doubleXpGroups = nil
		local currentChallengeTier = -1
		local maxChallengeTier = nil
		if challengeRow ~= nil then
			tableName = "mp/statsmilestones" .. tableNumber + 1 .. ".csv"
			maxVal = Engine.TableLookupGetColumnValueForRow( tableName, challengeRow, 2 )
			maxChallengeTier = tonumber( Engine.TableLookupGetColumnValueForRow( tableName, challengeRow, 1 ) )
			challengeName = Engine.Localize( Engine.TableLookupGetColumnValueForRow( tableName, challengeRow, 5 ) )
			challengeDesc = Engine.Localize( Engine.TableLookupGetColumnValueForRow( tableName, challengeRow, 5 ) .. "_DESC" )
			xpReward = Engine.TableLookupGetColumnValueForRow( tableName, challengeRow, 6 )
			doubleXpGroups = Engine.TableLookupGetColumnValueForRow( tableName, challengeRow, 22 )
			local unlockLevelStr = Engine.TableLookupGetColumnValueForRow( tableName, challengeRow, 11 )
			local unlockPLevelStr = Engine.TableLookupGetColumnValueForRow( tableName, challengeRow, 14 )
			if unlockLevelStr ~= "" then
				unlockLevel = tonumber( unlockLevelStr )
			end
			if unlockPLevelStr ~= "" then
				unlockPLevel = tonumber( unlockPLevelStr )
			end
		end
		local isLockedByChallenge = currInfo.isLocked
		local isLockedByLevel = false
		if challengeType == CoD.MILESTONE_WEAPON then
			itemName = Engine.Localize( Engine.GetItemName( currInfo.itemIndex ) )
		elseif challengeType == CoD.MILESTONE_GROUP then
			itemName = Engine.Localize( "MPUI_" .. Engine.GetItemGroupByIndex( currInfo.itemIndex ) )
		elseif challengeType == CoD.MILESTONE_ATTACHMENTS then
			itemName = Engine.Localize( Engine.GetAttachmentNameByIndex( currInfo.itemIndex ) )
		elseif challengeType == CoD.MILESTONE_GAMEMODE then
			itemName = Engine.Localize( "MPUI_" .. Engine.GetGametypeName( currInfo.itemIndex ) )
		elseif gamemodeName then
			itemName = gamemodeName
		end
		if not isDefault then
			if plevel < unlockPLevel then
				isLockedByLevel = true
				challengeDesc = Engine.Localize( "CLASS_PRESTIGE_UNLOCK_DESC", unlockPLevel )
			elseif rank < unlockLevel then
				isLockedByLevel = true
				challengeDesc = Engine.Localize( "PERKS_UNLOCKED_AT_LV", unlockLevel + 1 )
			end
		end
		isTieredChallenge = CoD.IsTieredChallenge( controller, tableName, challengeRow )
		if isTieredChallenge and isLockedByLevel then
			localizedTierText = Engine.Localize( "CHALLENGE_TIER_" .. 0 )
			challengeName = Engine.Localize( Engine.TableLookupGetColumnValueForRow( tableName, challengeRow, 5 ), "", itemName, localizedTierText )
		else
			localizedTierText = CoD.GetLocalizedTierText( controller, tableName, challengeRow )
			challengeName = Engine.Localize( Engine.TableLookupGetColumnValueForRow( tableName, challengeRow, 5 ), "", itemName, localizedTierText )
		end
		if not isLockedByLevel then
			local challengeString = Engine.TableLookupGetColumnValueForRow( tableName, challengeRow, 5 )
			challengeName = Engine.Localize( challengeString, "", itemName, localizedTierText )
			challengeDesc = Engine.Localize( challengeString .. "_DESC", maxVal, itemName )
		end
		local currentChallengeRow = currInfo.currentChallengeRow
		if currentChallengeRow and tableName then
			challengeUnlocked = true
			local challengeString = Engine.TableLookupGetColumnValueForRow( tableName, currentChallengeRow, 5 )
			if isTieredChallenge then
				localizedTierText = CoD.GetLocalizedTierText( controller, tableName, currentChallengeRow )
				currentChallengeTier = tonumber( Engine.TableLookupGetColumnValueForRow( tableName, currentChallengeRow, 1 ) )
				maxVal = Engine.TableLookupGetColumnValueForRow( tableName, currentChallengeRow, 2 )
				challengeName = Engine.Localize( challengeString, "", itemName, localizedTierText )
				challengeDesc = Engine.Localize( challengeString .. "_DESC", maxVal, itemName, localizedTierText )
			else
				challengeName = Engine.Localize( challengeString, "", itemName, localizedTierText )
				challengeDesc = Engine.Localize( challengeString .. "_DESC", maxVal, itemName, localizedTierText )
			end
		end
		currInfo.challengeUnlocked = challengeUnlocked
		currInfo.currVal = currInfo.currChallengeStatValue
		currInfo.maxVal = maxVal
		currInfo.challengeName = challengeName
		currInfo.challengeDesc = challengeDesc
		currInfo.doubleXpGroups = doubleXpGroups
		currInfo.maxChallengeTier = maxChallengeTier
		currInfo.isTieredChallenge = isTieredChallenge
		currInfo.currentChallengeTier = currentChallengeTier
	end
	return currInfo
end

CoD.EmblemBackgroundSelector.ShowChallengeInformation = function ( controller, tab, selectedIconId )
	local challengeInfo = CoD.EmblemBackgroundSelector.GetChallengeInformation( controller, selectedIconId )
	if challengeInfo then
		tab:dispatchEventToParent( {
			name = "set_background_information",
			controller = controller,
			challengeInfo = challengeInfo
		} )
	else
		tab:dispatchEventToParent( {
			name = "set_default_background_information",
			controller = controller,
			tab = tab
		} )
	end
end

CoD.EmblemBackgroundSelector.SelectedBackgroundAction = function ( controller, tab, backgroundIndex )
	if tab.selectedBackgroundId then
		Engine.SetEmblemBackgroundAsOld( controller, tab.selectedBackgroundId )
	end
	tab.selectedBackgroundIndex = backgroundIndex
	if backgroundIndex < tab.actualTotalBackgrounds then
		local selectedBackgroundId = Engine.GetEmblemFilterBGId( controller, tab.filterId, tab.selectedBackgroundIndex )
		tab.selectedBackgroundId = selectedBackgroundId
		CoD.EmblemBackgroundSelector.SelectButtonVisibility( tab, controller, selectedBackgroundId )
		CoD.EmblemBackgroundSelector.ShowChallengeInformation( controller, tab, selectedBackgroundId )
	else
		tab.selectedBackgroundId = nil
		tab:dispatchEventToParent( {
			name = "set_background_information",
			controller = controller,
			challengeInfo = nil
		} )
	end
end

CoD.EmblemBackgroundSelector.SelectionChanged = function ( tab, event )
	CoD.EmblemBackgroundSelector.SelectedBackgroundAction( event.controller, tab, event.iconIndex )
	CoD.EmblemBackgroundSelector.GetStartingAndEndingRowNumber( tab )
	tab:setupEmblemBackgrounds( event.controller, tab.selectedBackgroundIndex, tab.filterId, CoD.EmblemBackgroundSelector.StartingRowNumber, CoD.EmblemBackgroundSelector.EndingRowNumber )
end

CoD.EmblemBackgroundSelector.SetBackgroundIndex = function ( controller, tab, horizontalScrollDirection, verticalScrollDirection )
	local backgroundIndex = nil
	if horizontalScrollDirection == 0 and verticalScrollDirection == 0 then
		return 
	elseif horizontalScrollDirection ~= 0 then
		backgroundIndex = tab.selectedBackgroundIndex + horizontalScrollDirection
	elseif verticalScrollDirection ~= 0 then
		backgroundIndex = tab.selectedBackgroundIndex + verticalScrollDirection
	end
	if tab.actualTotalBackgrounds <= backgroundIndex and backgroundIndex <= tab.totalBackgrounds - 1 then
		backgroundIndex = tab.actualTotalBackgrounds - 1
	end
	if tab.totalBackgrounds - 1 < backgroundIndex or backgroundIndex < 0 then
		return 
	end
	CoD.EmblemBackgroundSelector.SelectedBackgroundAction( controller, tab, backgroundIndex )
end

CoD.EmblemBackgroundSelector.HandleGamepadButton = function ( tab, event )
	if LUI.UIElement.handleGamepadButton( tab, event ) == true then
		return true
	end
	local horizontalScrollDirection = 0
	local verticalScrollDirection = 0
	local selectedBackgroundId = nil
	if tab.selectedBackgroundIndex <= tab.actualTotalBackgrounds - 1 then
		selectedBackgroundId = Engine.GetEmblemFilterBGId( event.controller, tab.filterId, tab.selectedBackgroundIndex )
		CoD.EmblemBackgroundSelector.ShowChallengeInformation( event.controller, tab, selectedBackgroundId )
	end
	if event.down == true then
		if event.qualifier == "mwheel" then
			if event.button == "up" then
				CoD.EmblemBackgroundSelector.ShiftPage( event.controller, tab, true )
			elseif event.button == "down" then
				CoD.EmblemBackgroundSelector.ShiftPage( event.controller, tab, false )
			end
			return 
		elseif event.button == "primary" and tab.selectedBackgroundIndex < tab.actualTotalBackgrounds then
			tab:dispatchEventToParent( {
				name = "select_button_pressed",
				controller = event.controller,
				selectedBackgroundId = selectedBackgroundId
			} )
		elseif event.button == "right" then
			horizontalScrollDirection = 1
		elseif event.button == "left" then
			horizontalScrollDirection = -1
		elseif event.button == "up" then
			verticalScrollDirection = -CoD.EmblemBackgroundSelector.BackgroundColumnsPerPage
		elseif event.button == "down" then
			verticalScrollDirection = CoD.EmblemBackgroundSelector.BackgroundColumnsPerPage
		end
		Engine.PlaySound( "cac_grid_nav" )
	end
	CoD.EmblemBackgroundSelector.SetBackgroundIndex( event.controller, tab, horizontalScrollDirection, verticalScrollDirection )
	CoD.EmblemBackgroundSelector.GetStartingAndEndingRowNumber( tab )
	tab:setupEmblemBackgrounds( event.controller, tab.selectedBackgroundIndex, tab.filterId, CoD.EmblemBackgroundSelector.StartingRowNumber, CoD.EmblemBackgroundSelector.EndingRowNumber )
end

CoD.EmblemBackgroundSelector.ShiftPage = function ( controller, tab, backwards )
	local rowsPerPage = CoD.EmblemBackgroundSelector.BackgroundRowsPerPage
	local columnsPerPage = CoD.EmblemBackgroundSelector.BackgroundColumnsPerPage
	local rowStart = CoD.EmblemBackgroundSelector.StartingRowNumber
	local rowEnd = CoD.EmblemBackgroundSelector.EndingRowNumber
	local newRowStart, newRowEnd = nil
	if tab.totalBackgrounds <= rowsPerPage * columnsPerPage then
		return 
	elseif backwards then
		newRowStart = rowStart - rowsPerPage
		if newRowStart < 0 then
			newRowStart = 0
		end
		newRowEnd = newRowStart + rowsPerPage
	else
		newRowEnd = rowEnd + rowsPerPage
		if tab.totalBackgrounds / columnsPerPage < newRowEnd then
			newRowEnd = math.floor( tab.totalBackgrounds / columnsPerPage )
		end
		newRowStart = newRowEnd - rowsPerPage
	end
	tab.selectedBackgroundIndex = newRowStart * columnsPerPage
	CoD.EmblemBackgroundSelector.StartingRowNumber = newRowStart
	CoD.EmblemBackgroundSelector.EndingRowNumber = newRowEnd
	tab:setupEmblemBackgrounds( controller, tab.selectedBackgroundIndex, tab.filterId, newRowStart, newRowEnd )
end

CoD.EmblemBackgroundSelector.PrepareGeneralBGTab = function ( tabManager, controller )
	local GeneralBGTab = CoD.EmblemBackgroundSelector.SetupTabData( controller, tabManager, CoD.EmblemBackgroundSelector.GeneralFilterId )
	GeneralBGTab.tabManager = tabManager
	GeneralBGTab:registerEventHandler( "close_tab", CoD.EmblemBackgroundSelector.CloseTab )
	return GeneralBGTab
end

CoD.EmblemBackgroundSelector.PrepareWeaponsBGTab = function ( tabManager, controller )
	local WeaponsBGTab = CoD.EmblemBackgroundSelector.SetupTabData( controller, tabManager, CoD.EmblemBackgroundSelector.WeaponsFilterId )
	WeaponsBGTab.tabManager = tabManager
	WeaponsBGTab:registerEventHandler( "close_tab", CoD.EmblemBackgroundSelector.CloseTab )
	return WeaponsBGTab
end

CoD.EmblemBackgroundSelector.PrepareGameModesBGTab = function ( tabManager, controller )
	local GameModesBGTab = CoD.EmblemBackgroundSelector.SetupTabData( controller, tabManager, CoD.EmblemBackgroundSelector.GameModesFilterId )
	GameModesBGTab.tabManager = tabManager
	GameModesBGTab:registerEventHandler( "close_tab", CoD.EmblemBackgroundSelector.CloseTab )
	return GameModesBGTab
end

CoD.EmblemBackgroundSelector.PreparePrestigeBGTab = function ( tabManager, controller )
	local PrestigeBGTab = CoD.EmblemBackgroundSelector.SetupTabData( controller, tabManager, CoD.EmblemBackgroundSelector.PrestigeFilterId )
	PrestigeBGTab.tabManager = tabManager
	PrestigeBGTab:registerEventHandler( "close_tab", CoD.EmblemBackgroundSelector.CloseTab )
	return PrestigeBGTab
end

CoD.EmblemBackgroundSelector.PrepareDLCBGTab = function ( tabManager, controller )
	local DLCBGTab = CoD.EmblemBackgroundSelector.SetupTabData( controller, tabManager, CoD.EmblemBackgroundSelector.DLCFilterId )
	DLCBGTab.tabManager = tabManager
	Engine.SetStartCheckoutTimestampUTC()
	Engine.SendDLCMenusViewedRecordEvent( controller, CoD.DLC_BACKINGS_MENU_VIEWED, "emblem" )
	DLCBGTab:registerEventHandler( "close_tab", CoD.EmblemBackgroundSelector.CloseTab )
	return DLCBGTab
end

CoD.EmblemBackgroundSelector.CloseTab = function ( tab, event )
	tab.tabManager.selectedBackgroundIndex = 0
	tab:dispatchEventToParent( {
		name = "clear_description",
		controller = event.controller
	} )
end

CoD.EmblemBackgroundSelector.DoubleXpGroupCustomAction = function ( self, controller, backgroundId )
	local info = CoD.EmblemBackgroundSelector.GetChallengeInformation( controller, backgroundId )
	if info and info.doubleXpGroups and info.doubleXpGroups ~= "" and string.find( info.doubleXpGroups, "elite1" ) and Engine.IsEliteAvailable() then
		return "locked_elite_camo_selected"
	else
		
	end
end

CoD.EmblemBackgroundSelector.SelectButtonVisibility = function ( self, controller, backgroundId )
	local isLocked = Engine.EmblemBackgroundIsLocked( controller, backgroundId )
	local customEvent = CoD.EmblemBackgroundSelector.DoubleXpGroupCustomAction( self, controller, backgroundId )
	if isLocked and customEvent then
		self:dispatchEventToParent( {
			name = "show_select_button",
			controller = controller,
			customEvent = customEvent
		} )
	elseif isLocked then
		self:dispatchEventToParent( {
			name = "hide_select_button",
			controller = controller
		} )
	else
		local promptString = Engine.Localize( "MENU_SELECT" )
		if CoD.CACUtility.IsBackingMTX( backgroundId ) then
			local mtxName = CoD.CACUtility.GetBackingMTXName( backgroundId )
			if not Engine.HasMTX( controller, mtxName ) then
				promptString = Engine.Localize( "MENU_PURCHASE" )
			end
		end
		self:dispatchEventToParent( {
			name = "show_select_button",
			controller = controller,
			promptString = promptString
		} )
		Engine.ExecNow( controller, "emblemSelectBackground " .. backgroundId )
	end
end

CoD.EmblemBackgroundSelector.GetStartingAndEndingRowNumber = function ( tab )
	local rowsPerPage = CoD.EmblemBackgroundSelector.BackgroundRowsPerPage
	local columnsPerPage = CoD.EmblemBackgroundSelector.BackgroundColumnsPerPage
	local totalRows = tab.totalBackgrounds / rowsPerPage
	if CoD.EmblemBackgroundSelector.EndingRowNumber * columnsPerPage <= tab.selectedBackgroundIndex then
		CoD.EmblemBackgroundSelector.EndingRowNumber = math.max( math.floor( tab.selectedBackgroundIndex / columnsPerPage + 1 ), rowsPerPage )
		CoD.EmblemBackgroundSelector.StartingRowNumber = CoD.EmblemBackgroundSelector.EndingRowNumber - rowsPerPage
	elseif tab.selectedBackgroundIndex < CoD.EmblemBackgroundSelector.StartingRowNumber * columnsPerPage then
		CoD.EmblemBackgroundSelector.StartingRowNumber = CoD.EmblemBackgroundSelector.StartingRowNumber - 1
		CoD.EmblemBackgroundSelector.EndingRowNumber = CoD.EmblemBackgroundSelector.StartingRowNumber + rowsPerPage
	end
end

CoD.EmblemBackgroundSelector.SetupTabData = function ( controller, tabManager, filterId )
	local tabData = LUI.UIElement.new()
	tabData:setLeftRight( true, true, 0, 0 )
	tabData:setTopBottom( true, true, 0, 0 )
	tabData:setFont( CoD.fonts.ExtraSmall )
	tabData.selectedBackgroundIndex = tabManager.selectedBackgroundIndex
	tabData.filterId = filterId
	tabData.actualTotalBackgrounds = Engine.GetEmblemFilterBGCount( controller, filterId )
	tabData.totalBackgrounds = tabData.actualTotalBackgrounds
	local rowsPerPage = CoD.EmblemBackgroundSelector.BackgroundRowsPerPage
	local columnsPerPage = CoD.EmblemBackgroundSelector.BackgroundColumnsPerPage
	if tabData.actualTotalBackgrounds % columnsPerPage ~= 0 then
		tabData.totalBackgrounds = tabData.actualTotalBackgrounds + columnsPerPage - tabData.actualTotalBackgrounds % columnsPerPage
	end
	local totalRows = tabData.totalBackgrounds / columnsPerPage
	CoD.EmblemBackgroundSelector.EndingRowNumber = math.min( totalRows, rowsPerPage )
	CoD.EmblemBackgroundSelector.StartingRowNumber = math.max( CoD.EmblemBackgroundSelector.EndingRowNumber - rowsPerPage, 0 )
	CoD.EmblemBackgroundSelector.SelectedBackgroundAction( controller, tabData, tabData.selectedBackgroundIndex )
	CoD.EmblemBackgroundSelector.GetStartingAndEndingRowNumber( tabData )
	tabData:setupEmblemBackgrounds( controller, tabData.selectedBackgroundIndex, filterId, CoD.EmblemBackgroundSelector.StartingRowNumber, CoD.EmblemBackgroundSelector.EndingRowNumber )
	local selectedBackgroundId = Engine.GetEmblemFilterBGId( controller, filterId, tabData.selectedBackgroundIndex )
	CoD.EmblemBackgroundSelector.SelectButtonVisibility( tabManager, controller, selectedBackgroundId )
	CoD.EmblemBackgroundSelector.SetupGamepadButton( tabData )
	return tabData
end

CoD.EmblemBackgroundSelector.HandleMTXChanged = function ( self, event )
	if event.controller ~= self.m_ownerController then
		return 
	else
		CoD.EmblemBackgroundSelector.PrepareDLCBGTab( self, event.controller )
	end
end

