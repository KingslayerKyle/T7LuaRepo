require( "ui_mp.T6.Menus.CRCommon" )

CoD.CRMedals = {}
local ItemButtonOver = function ( self, event )
	self.medalHitCount:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	CoD.ContentGridButton.ButtonOver( self, event )
end

local ItemButtonUp = function ( self, event )
	self.medalHitCount:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	CoD.ContentGridButton.LoseFocus( self, event )
end

local AddItemImage = function ( item )
	local imageHeight = 80
	local imageWidth = imageHeight
	local imageTopOffset = 5
	item.button.itemImage = LUI.UIStreamedImage.new()
	item.button.itemImage:setTopBottom( true, false, imageTopOffset, imageTopOffset + imageHeight )
	item.button.itemImage:setLeftRight( false, false, -imageWidth / 2, imageWidth / 2 )
	item.button.itemImage:setPriority( -70 )
	item.button:addElement( item.button.itemImage )
end

local AddMedalHitCountText = function ( item )
	local medalHitCountFont = "Default"
	local bottomOffset = 23
	local rightOffset = 5
	local medalHitCount = LUI.UIText.new()
	medalHitCount:setLeftRight( true, true, 0, -rightOffset )
	medalHitCount:setTopBottom( false, true, -bottomOffset - CoD.textSize[medalHitCountFont], -bottomOffset )
	medalHitCount:setAlignment( LUI.Alignment.Center )
	medalHitCount:setFont( CoD.fonts[medalHitCountFont] )
	medalHitCount:setText( "" )
	item.button.medalHitCount = medalHitCount
	item.button:addElement( medalHitCount )
end

local ItemCreateFnc = function ( controller, item )
	AddMedalHitCountText( item )
	AddItemImage( item )
	CoD.ContentGridButton.SetupButtonText( item.button, "" )
	CoD.ContentGridButton.SetupButtonImages( item.button, CoD.GrenadeGridButton.glowBackColor, CoD.GrenadeGridButton.glowFrontColor )
	item.button:registerEventHandler( "button_over", ItemButtonOver )
	item.button:registerEventHandler( "button_up", ItemButtonUp )
end

local ItemPopulateFnc = function ( controller, item, grid )
	local sortedItemInfo = Engine.GetCombatRecordSortedItemInfo( item.m_index - 1 )
	local medalIndex = sortedItemInfo.itemIndex
	local medalHitCount = sortedItemInfo.itemValue
	local medalString = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, medalIndex, CoD.AfterActionReport.medalStringCol )
	local medalImage = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, medalIndex, CoD.AfterActionReport.medalImageMaterialNameCol )
	item.button.medalHitCount:setText( "x" .. medalHitCount )
	item.button.itemImage:addElement( CoD.GetSpinnerWaitingOnEvent( "streamed_image_ready", 64 ) )
	item.button.itemImage:setImage( RegisterMaterial( medalImage ) )
	item.button.itemImage:setupUIStreamedImage( 0 )
	item.button.itemNameText:setText( Engine.Localize( medalString ) )
end

local MedalPreviewBox_GridFocusChanged = function ( self, event )
	local controller = event.controller
	local sortedItemInfo = Engine.GetCombatRecordSortedItemInfo( event.index - 1 )
	local medalIndex = sortedItemInfo.itemIndex
	local medalHitCount = sortedItemInfo.itemValue
	local medalString = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, medalIndex, CoD.AfterActionReport.medalStringCol )
	local medalImage = Engine.TableLookupGetColumnValueForRow( CoD.scoreInfoTable, medalIndex, CoD.AfterActionReport.medalImageMaterialNameCol )
	self.medalPreviewImage:setImage( RegisterMaterial( medalImage ) )
	self.medalPreviewImage:show()
	self.medalNameText:setText( Engine.Localize( medalString ) )
	self.medalDescText:setText( Engine.Localize( medalString .. "_DESC" ) )
	self.timesEarnedLabel:setText( Engine.Localize( "MENU_TIMES_EARNED" ) )
	self.timesEarnedText:setText( medalHitCount )
end

local SetupMedalsTabPreviewBox = function ( medalPreviewBox )
	local verticalList = LUI.UIVerticalList.new()
	verticalList:setLeftRight( true, true, 0, 0 )
	verticalList:setTopBottom( true, true, 0, 0 )
	medalPreviewBox:addElement( verticalList )
	local medalPreviewImageWidth = 140
	local medalPreviewImageHeight = 140
	local medalPreviewImage = LUI.UIImage.new()
	medalPreviewImage:setLeftRight( false, false, -medalPreviewImageWidth / 2, medalPreviewImageWidth / 2 )
	medalPreviewImage:setTopBottom( true, false, 0, medalPreviewImageHeight )
	medalPreviewBox.medalPreviewImage = medalPreviewImage
	medalPreviewImage:hide()
	verticalList:addSpacer( 20 )
	verticalList:addElement( medalPreviewImage )
	verticalList:addSpacer( 20 )
	local medalNameText = CoD.AARPopup.GetBoxText( "Condensed", "", 0 )
	medalNameText:setAlignment( LUI.Alignment.Left )
	medalPreviewBox.medalNameText = medalNameText
	verticalList:addElement( medalNameText )
	local medalDescText = CoD.AARPopup.GetBoxText( "ExtraSmall", "", 0 )
	medalDescText:setAlignment( LUI.Alignment.Left )
	medalPreviewBox.medalDescText = medalDescText
	verticalList:addElement( medalDescText )
	verticalList:addSpacer( 50 )
	local timesEarnedLabel = CoD.AARPopup.GetBoxText( "ExtraSmall", "", 0 )
	timesEarnedLabel:setAlignment( LUI.Alignment.Left )
	medalPreviewBox.timesEarnedLabel = timesEarnedLabel
	verticalList:addElement( timesEarnedLabel )
	local timesEarnedText = CoD.AARPopup.GetBoxText( "Big", "", 0 )
	timesEarnedText:setAlignment( LUI.Alignment.Left )
	medalPreviewBox.timesEarnedText = timesEarnedText
	verticalList:addElement( timesEarnedText )
	verticalList:addSpacer( 20 )
	medalPreviewBox:registerEventHandler( "grid_focus_changed", MedalPreviewBox_GridFocusChanged )
end

local GridFocusChanged = function ( self, event )
	self:dispatchEventToChildren( {
		name = event.name,
		index = event.index,
		controller = self.m_ownerController
	} )
end

CoD.CRMedals.SetupMedalsGrid = function ( self, controller )
	local tabBottom = CoD.Menu.TitleHeight + 60
	local tabHeight = CoD.ButtonPrompt.Height
	local defaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = tabBottom - tabHeight,
		bottom = tabBottom
	}
	self.tabManager = CoD.TabManager.new( defaultAnimState, nil, LUI.Alignment.Right )
	self:addElement( self.tabManager )
	self:registerEventHandler( "grid_focus_changed", GridFocusChanged )
	local leftOffset = 0
	local topOffset = 130
	local bottomOffset = 100
	local medasPreviewBoxSize = 240
	local medalPreviewBox = LUI.UIElement.new()
	medalPreviewBox:setLeftRight( true, false, 0, medasPreviewBoxSize )
	medalPreviewBox:setTopBottom( true, true, topOffset, -bottomOffset )
	self:addElement( medalPreviewBox )
	SetupMedalsTabPreviewBox( medalPreviewBox )
	leftOffset = leftOffset + medasPreviewBoxSize + 20
	local medalGridBox = LUI.UIElement.new()
	medalGridBox:setLeftRight( true, true, leftOffset, 0 )
	medalGridBox:setTopBottom( true, true, topOffset, -bottomOffset )
	self.medalGridBox = medalGridBox
	self:addElement( medalGridBox )
	local numItemsTall = 3
	local numItemsWide = 3
	local itemWidth = 175
	local itemHeight = 130
	local spacing = 18
	local gridHeight = itemHeight * numItemsTall + spacing * (numItemsTall - 1) + 10
	local defaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		topAnchor = true,
		bottomAnchor = false,
		left = 0,
		right = 0,
		top = 0,
		bottom = gridHeight
	}
	local scrollableGrid = CoD.ScrollableContentGrid.new( self.m_ownerController, defaultAnimState, numItemsTall, numItemsWide, ItemCreateFnc, ItemPopulateFnc, itemWidth, itemHeight, spacing )
	Engine.SortItemsForCombatRecord( self.m_ownerController, CoD.CRCommon.SortTypes.MEDALS, CoD.CRCommon.OtherPlayerCRMode == true, CoD.CRCommon.MedalCategories.CATEGORY_COMBAT )
	local sortedItemInfo = Engine.GetCombatRecordSortedItemInfo( 0 )
	medalGridBox:addElement( scrollableGrid )
	local totalItems = sortedItemInfo.numItems
	scrollableGrid:setTotalItems( totalItems )
	self.scrollableGrid = scrollableGrid
	self.tabManager:addTab( Engine.ToUpper( Engine.Localize( "MENU_COMBAT_CAPS" ) ) )
	self.tabManager:addTab( Engine.ToUpper( Engine.Localize( "MENU_SCORESTREAKS" ) ) )
	self.tabManager:addTab( Engine.ToUpper( Engine.Localize( "MENU_ANTISCORESTREAK" ) ) )
	self.tabManager:addTab( Engine.ToUpper( Engine.Localize( "MENU_CHALLENGES_GAME_MODES" ) ) )
	self.tabManager:setCurrentTab()
end

CoD.CRMedals.SetupElements = function ( self, controller )
	if CoD.CRCommon.CurrentXuid and CoD.CRCommon.CurrentXuid ~= "" and CoD.CRCommon.CurrentXuid ~= "0" then
		self:addElement( CoD.MiniIdentity.GetMiniIdentity( controller, CoD.CRCommon.CurrentXuid ) )
	end
	CoD.CRMedals.SetupMedalsGrid( self, controller )
end

CoD.CRMedals.TabChanged = function ( self, event )
	Engine.SortItemsForCombatRecord( self.m_ownerController, CoD.CRCommon.SortTypes.MEDALS, CoD.CRCommon.OtherPlayerCRMode == true, event.tabIndex )
	local sortedItemInfo = Engine.GetCombatRecordSortedItemInfo( 0 )
	local totalItems = sortedItemInfo.numItems
	self.scrollableGrid:setTotalItems( totalItems )
end

LUI.createMenu.CRMedals = function ( controller )
	local self = CoD.Menu.New( "CRMedals" )
	self:addLargePopupBackground()
	self:setOwner( controller )
	self:setPreviousMenu( "Barracks" )
	self:addBackButton()
	self:addTitle( Engine.Localize( "MPUI_MEDALS_CAPS" ) )
	self:registerEventHandler( "tab_changed", CoD.CRMedals.TabChanged )
	CoD.CRMedals.SetupElements( self, controller )
	return self
end

