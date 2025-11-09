CoD.AARPopup = {}
CoD.AARPopup.OpenPromotionPopup = function ()
	local stats = CoD.AfterActionReport.Stats
	return stats.displayLevelForRankBeforeMatch < stats.displayLevelForCurrRank
end

CoD.AARPopup.OpenMasterPopup = function ()
	local stats = CoD.AfterActionReport.Stats
	local f2_local0
	if stats.currPrestige ~= tonumber( CoD.MAX_PRESTIGE ) - 1 or CoD.MAX_RANKXP > stats.currRankXP then
		f2_local0 = false
	else
		f2_local0 = true
	end
	return f2_local0
end

CoD.AARPopup.OpenFeaturesPopup = function ()
	local stats = CoD.AfterActionReport.Stats
	return stats.numFeaturesUnlocked > 0
end

CoD.AARPopup.OpenContentPopup = function ()
	local stats = CoD.AfterActionReport.Stats
	local recentChallenges = 0
	local numItemUnlocks = 0
	if stats then
		if stats.numItemUnlocks then
			numItemUnlocks = stats.numItemUnlocks
		end
		if stats.recentChallenges then
			recentChallenges = #stats.recentChallenges
		end
	end
	local f4_local0
	if numItemUnlocks <= 0 and recentChallenges <= 0 then
		f4_local0 = false
	else
		f4_local0 = true
	end
	return f4_local0
end

CoD.AARPopup.OpenAttachmentsPopup = function ()
	local stats = CoD.AfterActionReport.Stats
	return stats.anyAttachmentsUnlocked
end

CoD.AARPopup.PopupInfo = {
	{
		name = "AfterActionReport",
		checkFunction = nil
	},
	{
		name = "AARPromotion",
		checkFunction = CoD.AARPopup.OpenPromotionPopup
	},
	{
		name = "AARMaster",
		checkFunction = CoD.AARPopup.OpenMasterPopup
	},
	{
		name = "AARNewFeatures",
		checkFunction = CoD.AARPopup.OpenFeaturesPopup
	},
	{
		name = "AARNewContent",
		checkFunction = CoD.AARPopup.OpenContentPopup
	},
	{
		name = "AARNewAttachments",
		checkFunction = CoD.AARPopup.OpenAttachmentsPopup
	}
}
CoD.AARPopup.GetNextPopupToOpen = function ( currentPopupName )
	local aarPopupInfo = CoD.AARPopup.PopupInfo
	local currPopupIndex = nil
	for index, popupInfo in ipairs( aarPopupInfo ) do
		if popupInfo.name == currentPopupName then
			currPopupIndex = index
		end
		if currPopupIndex and currPopupIndex < #aarPopupInfo then
			for i = currPopupIndex + 1, #aarPopupInfo, 1 do
				local popupInfo = aarPopupInfo[i]
				if popupInfo.checkFunction and popupInfo.checkFunction() then
					return popupInfo.name
				end
			end
		end
	end
end

CoD.AARPopup.OpenLeaguePromotionPopup = function ( controller )
	CoD.LeaguePromotionStatus = Engine.CheckLeagueDivisionChange( controller )
	if CoD.LeaguePromotionStatus ~= "unknown" and CoD.LeaguePromotionStatus ~= "unchanged" then
		return true
	else
		return false
	end
end

CoD.AARPopup.AARPopupContinueToNext = function ( self, event )
	local newMenu = nil
	local nextPopupName = CoD.AARPopup.GetNextPopupToOpen( self.menuName )
	if nextPopupName then
		newMenu = self:openMenu( nextPopupName, event.controller )
	end
	if newMenu then
		newMenu:setPreviousMenu( nil )
		self:close()
		Engine.PlaySound( "cac_grid_equip_item" )
	else
		self:processEvent( {
			name = "button_prompt_back",
			controller = event.controller
		} )
	end
end

local GetInfoBoxText = function ( top, textAndfontSize, text, color )
	local infoBoxText = LUI.UIText.new()
	infoBoxText:setLeftRight( true, true, 0, 0 )
	infoBoxText:setTopBottom( true, false, top, top + CoD.textSize[textAndfontSize] )
	infoBoxText:setFont( CoD.fonts[textAndfontSize] )
	infoBoxText:setAlignment( LUI.Alignment.Center )
	infoBoxText:setText( text )
	if color then
		infoBoxText:setRGB( color.r, color.g, color.b )
	end
	return infoBoxText
end

local GetSpecialBorder = function ( box )
	box.border = CoD.BorderT6.new( 1, 1, 1, 1, 0.1 )
	box:addElement( box.border )
	box.border.bottomBorder:close()
	box.border.bottomBorder = LUI.UIImage.new()
	box.border.bottomBorder:setLeftRight( true, true, 0, 0 )
	box.border.bottomBorder:setTopBottom( false, true, -16, 0 )
	box.border.bottomBorder:setImage( RegisterMaterial( "menu_sp_cac_single_dip" ) )
	box.border:addElement( box.border.bottomBorder )
end

LUI.createMenu.AARLeaguePromotion = function ( controller )
	local promotionPopup = CoD.Menu.NewMediumPopup( "AARLeaguePromotion" )
	local promotionSFX = "uin_rank_promotion"
	local demotionSFX = "uin_rank_demotion"
	promotionPopup.continueButton = CoD.ButtonPrompt.new( "primary", Engine.Localize( "MENU_CONTINUE_CAPS" ), promotionPopup, "button_prompt_back" )
	promotionPopup.invisibleBackButton = CoD.ButtonPrompt.new( "secondary", "", promotionPopup, "button_prompt_back", true )
	promotionPopup:addLeftButtonPrompt( promotionPopup.continueButton )
	promotionPopup:addLeftButtonPrompt( promotionPopup.invisibleBackButton )
	local leagueStats = Engine.GetLeagueStats( controller )
	local promotionText = "MENU_DIVISION_TRANSFER"
	if CoD.LeaguePromotionStatus == "placed" then
		promotionText = "MENU_DIVISION_PLACEMENT"
		Engine.PlaySound( promotionSFX )
	elseif CoD.LeaguePromotionStatus == "promoted" then
		promotionText = "MENU_DIVISION_PROMOTION"
		Engine.PlaySound( promotionSFX )
	else
		Engine.PlaySound( demotionSFX )
	end
	promotionPopup:addTitle( Engine.ToUpper( Engine.Localize( promotionText ) ) )
	local topMargin = 70
	local iconSize = 135
	local infoBoxWidth = 320
	local infoBox = LUI.UIElement.new()
	infoBox:setLeftRight( false, false, -infoBoxWidth / 2, infoBoxWidth / 2 )
	infoBox:setTopBottom( true, true, topMargin, -topMargin )
	local topOffset = 0
	infoBox:addElement( GetInfoBoxText( topOffset, "ExtraSmall", Engine.Localize( promotionText .. "_DESC" ), CoD.gray ) )
	topOffset = topOffset + CoD.textSize.ExtraSmall + 10
	local divisionIconContainer = LUI.UIElement.new()
	local divisionIconContainerHeight = iconSize + 30
	divisionIconContainer:setLeftRight( true, true, 0, 0 )
	divisionIconContainer:setTopBottom( true, false, topOffset, topOffset + divisionIconContainerHeight )
	GetSpecialBorder( divisionIconContainer )
	infoBox:addElement( divisionIconContainer )
	local divisionIcon = LUI.UIImage.new()
	divisionIcon:setLeftRight( false, false, -iconSize / 2, iconSize / 2 )
	divisionIcon:setTopBottom( true, false, 10, 10 + iconSize )
	divisionIcon:setImage( leagueStats.divisionIcon )
	divisionIconContainer:addElement( divisionIcon )
	topOffset = topOffset + divisionIconContainerHeight - 5
	infoBox:addElement( GetInfoBoxText( topOffset, "Condensed", leagueStats.divisionName ) )
	topOffset = topOffset + CoD.textSize.Condensed
	infoBox:addElement( GetInfoBoxText( topOffset, "ExtraSmall", Engine.Localize( "MENU_SUBDIVISION" ) .. ": " .. leagueStats.subdivisionName ) )
	infoBox:addElement( GetInfoBoxText( topOffset + CoD.textSize.ExtraSmall + 10, "Condensed", Engine.Localize( "LEAGUE_RANK", leagueStats.rank ) ) )
	promotionPopup:addElement( infoBox )
	return promotionPopup
end

CoD.AARPopup.GetBoxText = function ( font, text, topOffset, leftRightOffset )
	local textElem = LUI.UIText.new()
	if leftRightOffset then
		textElem:setLeftRight( true, true, -leftRightOffset, leftRightOffset )
	else
		textElem:setLeftRight( true, true, 0, 0 )
	end
	textElem:setTopBottom( true, false, topOffset, topOffset + CoD.textSize[font] )
	textElem:setText( text )
	textElem:setFont( CoD.fonts[font] )
	textElem:setAlignment( LUI.Alignment.Center )
	return textElem
end

CoD.AARPopup.GetBox = function ( boxWidth, boxHeight, imageName, imageHeight, imageWidth, centerTitle, title, desc, streamedImage, descOffset )
	local box = LUI.UIElement.new()
	box:setLeftRight( true, false, 0, boxWidth )
	box:setTopBottom( true, false, 0, boxHeight )
	box:addElement( CoD.GetInformationContainer() )
	if imageName then
		local image = nil
		if streamedImage then
			image = LUI.UIStreamedImage.new( nil, nil, true )
		else
			image = LUI.UIImage.new()
		end
		image:setLeftRight( false, false, -imageWidth / 2, imageWidth / 2 )
		image:setTopBottom( false, false, -imageHeight / 2, imageHeight / 2 )
		if imageName then
			image:setImage( RegisterMaterial( imageName ) )
		end
		box:addElement( image )
	end
	if centerTitle then
		box:addElement( CoD.AARPopup.GetBoxText( "Big", centerTitle, boxHeight / 2 - CoD.textSize.Big / 2 ) )
	end
	if title then
		box:addElement( CoD.AARPopup.GetBoxText( "Condensed", title, boxHeight ) )
	end
	local descOffsetBottom = 0
	if descOffset then
		descOffsetBottom = descOffset
	end
	if desc then
		box:addElement( CoD.AARPopup.GetBoxText( "ExtraSmall", desc, boxHeight + CoD.textSize.Condensed + descOffsetBottom, 10 ) )
	end
	return box
end

local SetupAARPromotionPopup = function ( self, controller )
	local boxSize = 180
	local topOffset = 90
	local listContainer = LUI.UIElement.new()
	listContainer:setLeftRight( true, true, 0, 0 )
	listContainer:setTopBottom( true, false, topOffset, topOffset + boxSize )
	local list = LUI.UIHorizontalList.new()
	list:setLeftRight( true, true, 0, 0 )
	list:setTopBottom( true, true, 0, 0 )
	list:setSpacing( 30 )
	list:setAlignment( LUI.Alignment.Center )
	local imageWidth = 120
	local imageHeight = 120
	local stats = CoD.AfterActionReport.Stats
	local statsBeforeMatch = stats.statsBeforeMatch
	local currentStats = stats.currentStats
	local rankBeforematch = stats.rankBeforematch
	local currentRank = stats.currentRank
	local displayLevelForRankBeforeMatch = stats.displayLevelForRankBeforeMatch
	local displayLevelForCurrRank = stats.displayLevelForCurrRank
	local currPrestige = stats.currPrestige
	local currRankIconMaterialName = stats.currRankIconMaterialName
	local currRankName = stats.currRankName
	if displayLevelForRankBeforeMatch < displayLevelForCurrRank then
		list:addElement( CoD.AARPopup.GetBox( boxSize, boxSize, currRankIconMaterialName .. "_128", imageWidth, imageHeight, nil, Engine.Localize( "MENU_LEVEL" ) .. " " .. displayLevelForCurrRank, Engine.Localize( currRankName ), true ) )
	end
	local unlockTokens = Engine.GetRecentUnlocks( controller )
	if unlockTokens > 0 then
		local unlockString = "MENU_UNLOCK_TOKEN_EARNED"
		if unlockTokens > 1 then
			unlockString = "MENU_UNLOCK_TOKENS_EARNED"
		end
		list:addElement( CoD.AARPopup.GetBox( boxSize, boxSize, CoD.AfterActionReport.TokenImageMaterialName128, imageWidth, imageHeight, nil, unlockTokens, Engine.Localize( unlockString ) ) )
	end
	listContainer:addElement( list )
	self:addElement( listContainer )
	self.xpBarWidget = CoD.AfterActionReport.GetXPBarWidget( controller )
	self:addElement( self.xpBarWidget )
	self:registerEventHandler( "animate_xp_bar", CoD.AfterActionReport.AnimateXPBarWidget )
	self:processEvent( {
		name = "animate_xp_bar"
	} )
end

LUI.createMenu.AARPromotion = function ( controller )
	local self = CoD.Menu.NewMediumPopup( "AARPromotion" )
	self:addTitle( Engine.ToUpper( Engine.Localize( "MENU_PROMOTION" ) ) )
	CoD.AfterActionReport.AddButtonPrompts( self, "continue_to_next" )
	self:registerEventHandler( "continue_to_next", CoD.AARPopup.AARPopupContinueToNext )
	self.animateIn = CoD.NullFunction
	SetupAARPromotionPopup( self, controller )
	return self
end

local SetupAARMasterPopup = function ( self, controller )
	local boxSize = 200
	local topOffset = 70
	local listContainer = LUI.UIElement.new()
	listContainer:setLeftRight( true, true, 0, 0 )
	listContainer:setTopBottom( true, false, topOffset, topOffset + boxSize )
	local list = LUI.UIHorizontalList.new()
	list:setLeftRight( true, true, 0, 0 )
	list:setTopBottom( true, true, 0, 0 )
	list:setSpacing( 30 )
	list:setAlignment( LUI.Alignment.Center )
	local imageWidth = 128
	local imageHeight = 128
	local stats = CoD.AfterActionReport.Stats
	local currentRank = stats.currentRank
	local currPrestige = tonumber( CoD.MAX_PRESTIGE )
	local currRankIconMaterialName = Engine.TableLookup( controller, CoD.rankIconTable, CoD.AfterActionReport.RankIdCol, currentRank, currPrestige + 1 )
	local playerStats = CoD.GetPlayerStats( controller )
	playerStats.playerStatsList.PLEVEL.statValue:set( tonumber( CoD.MAX_PRESTIGE ) )
	list:addElement( CoD.AARPopup.GetBox( boxSize + 32, boxSize, currRankIconMaterialName .. "_128", imageWidth, imageHeight, nil, Engine.Localize( "MENU_MASTER" ), Engine.Localize( "MENU_MASTER_DESC" ), true ) )
	listContainer:addElement( list )
	self:addElement( listContainer )
end

LUI.createMenu.AARMaster = function ( controller )
	local self = CoD.Menu.NewMediumPopup( "AARMaster" )
	self:addTitle( Engine.ToUpper( Engine.Localize( "MENU_MAXIMUM_LEVEL" ) ) )
	CoD.AfterActionReport.AddButtonPrompts( self, "continue_to_next" )
	self:registerEventHandler( "continue_to_next", CoD.AARPopup.AARPopupContinueToNext )
	self.animateIn = CoD.NullFunction
	SetupAARMasterPopup( self, controller )
	return self
end

local SetupAARFeaturesPopup = function ( self, controller )
	local boxWidth = 260
	local boxHeight = 250
	local topOffset = 90
	local listContainer = LUI.UIElement.new()
	listContainer:setLeftRight( true, true, 0, 0 )
	listContainer:setTopBottom( true, false, topOffset, topOffset + boxHeight )
	local list = LUI.UIHorizontalList.new()
	list:setLeftRight( true, true, 0, 0 )
	list:setTopBottom( true, true, 0, 0 )
	list:setSpacing( 10 )
	list:setAlignment( LUI.Alignment.Center )
	local numFeaturesUnlocked = Engine.GetNumFeatureUnlocks( controller )
	local unlockedFeatureName, unlockedFeatureDesc = nil
	if numFeaturesUnlocked > 3 then
		numFeaturesUnlocked = 3
	end
	for unlockedFeatureArrayIndex = 0, numFeaturesUnlocked - 1, 1 do
		unlockedFeatureName = Engine.ToUpper( Engine.Localize( Engine.GetItemName( Engine.GetUnlockedFeatureItemIndex( controller, unlockedFeatureArrayIndex ) ) ) )
		unlockedFeatureDesc = Engine.Localize( Engine.GetItemDesc( Engine.GetUnlockedFeatureItemIndex( controller, unlockedFeatureArrayIndex ) ) )
		local container = LUI.UIElement.new()
		container:setLeftRight( true, false, 0, boxWidth )
		container:setTopBottom( true, false, 0, boxHeight )
		container:addElement( CoD.GetInformationContainer() )
		local name = CoD.GetTextElem( "Big", "Center", unlockedFeatureName, nil, 20 )
		name:setLeftRight( true, true, 10, -10 )
		container:addElement( name )
		local desc = CoD.GetTextElem( "Default", "Center", unlockedFeatureDesc )
		desc:setTopBottom( false, true, -60 - CoD.textSize.Default, -60 )
		desc:setLeftRight( true, true, 10, -10 )
		container:addElement( desc )
		list:addElement( container )
		list:addSpacer( 10 )
	end
	listContainer:addElement( list )
	self:addElement( listContainer )
end

LUI.createMenu.AARNewFeatures = function ( controller )
	local self = CoD.Menu.NewMediumPopup( "AARNewFeatures" )
	self:addTitle( Engine.ToUpper( Engine.Localize( "MENU_NEW_FEATURES" ) ) )
	CoD.AfterActionReport.AddButtonPrompts( self, "continue_to_next" )
	self:registerEventHandler( "continue_to_next", CoD.AARPopup.AARPopupContinueToNext )
	self.animateIn = CoD.NullFunction
	SetupAARFeaturesPopup( self, controller )
	return self
end

local NewContentCardGainFocus = function ( self, event )
	local itemIndex = self.itemIndex
	if self.camoName ~= nil and self.itemName ~= nil then
		local titleText = Engine.Localize( "MENU_X_COLON_Y", self.itemName, self.camoName )
		self.title:setText( titleText )
	end
	if itemIndex and not Engine.IsItemLocked( event.controller, itemIndex ) and not Engine.IsItemPurchased( event.controller, itemIndex ) and Engine.GetItemCost( event.controller, itemIndex ) > 0 then
		self:dispatchEventToParent( {
			name = "add_purchase_button_prompt",
			controller = event.controller,
			itemIndex = itemIndex,
			card = self
		} )
	else
		self:dispatchEventToParent( {
			name = "remove_purchase_button_prompt",
			controller = event.controller
		} )
	end
	self:dispatchEventToParent( {
		name = "set_desc_and_xp_reward",
		desc = self.desc,
		xpRewardText = self.xpRewardText,
		menuHeader = self.menuHeader
	} )
	CoD.CardCarousel.Card_GainFocus( self, event )
end

local NewContentCardLoseFocus = function ( self, event )
	if self.camoName ~= nil and self.itemName ~= nil then
		local titleText = Engine.Localize( self.camoName )
		self.title:setText( titleText )
	end
	CoD.CardCarousel.Card_LoseFocus( self, event )
end

local SetupNewContentCard = function ( card, controller, item, itemImage, imageParams )
	CoD.ContentGridButton.SetupButtonImages( card, CoD.GrenadeGridButton.glowBackColor, CoD.GrenadeGridButton.glowFrontColor )
	local itemWidth = CoD.AfterActionReport.NewContentItemWidth
	local itemHeight = CoD.AfterActionReport.NewContentItemHeight
	local itemIndex = item.itemIndex
	card.itemIndex = item.itemIndex
	card.isReward = item.isReward
	local contentImageWidth = 170
	local contentImageHeight = 90
	local sizeMultiplier = 1.5
	if imageParams then
		if imageParams.width then
			contentImageWidth = imageParams.width
		end
		if imageParams.height then
			contentImageHeight = imageParams.height
		end
	end
	local contentImage = LUI.UIImage.new()
	card:setupCenterImage( itemImage, contentImageWidth, contentImageHeight, sizeMultiplier )
	local contentTitleContainer = LUI.UIElement.new()
	local height = CoD.textSize.Default
	contentTitleContainer:setLeftRight( true, true, 5, 0 )
	contentTitleContainer:setTopBottom( false, true, -height - 2, -2 )
	card:addElement( contentTitleContainer )
	local title = LUI.UIText.new()
	title:setLeftRight( true, true, 5, 0 )
	title:setTopBottom( true, true, 0, 0 )
	title:setFont( CoD.fonts.Default )
	title:setAlignment( LUI.Alignment.Left )
	title:setText( Engine.Localize( item.itemName ) )
	card.title = title
	contentTitleContainer:addElement( title )
	card.title:registerAnimationState( "button_over", {
		red = CoD.BOIIOrange.r,
		green = CoD.BOIIOrange.g,
		blue = CoD.BOIIOrange.b
	} )
	LUI.UIButton.SetupElement( card.title )
	card.desc = Engine.Localize( item.itemDesc )
	local tokenIcon = LUI.UIImage.new()
	local tokenIconSize = 32
	local leftOffset = 8
	local bottomOffset = height + 8
	tokenIcon:setLeftRight( true, false, leftOffset, leftOffset + tokenIconSize )
	tokenIcon:setTopBottom( false, true, -bottomOffset - tokenIconSize, -bottomOffset )
	tokenIcon:setImage( RegisterMaterial( CoD.AfterActionReport.TokenImageMaterialName64 ) )
	card.tokenIcon = tokenIcon
	if not item.isReward and not Engine.IsItemLocked( controller, itemIndex ) and not Engine.IsItemPurchased( controller, itemIndex ) and Engine.GetItemCost( itemIndex ) > 0 then
		card:addElement( card.tokenIcon )
	end
	if card.grid then
		card.grid:close()
		card.grid = nil
	end
	if card.border then
		card.border:close()
		card.border = nil
	end
	card:registerEventHandler( "gain_focus", NewContentCardGainFocus )
	card:registerEventHandler( "lose_focus", NewContentCardLoseFocus )
end

local AddNewWeapons = function ( newContentCarousel, controller )
	local recentlyUnlockedItems = CoD.AfterActionReport.Stats.recentlyUnlockedItems
	for index, currItem in pairs( recentlyUnlockedItems ) do
		if CoD.IsWeapon( currItem.itemIndex ) then
			local newCard = newContentCarousel:addNewCard()
			SetupNewContentCard( newCard, controller, currItem, currItem.itemImage .. "_big" )
			newCard.menuHeader = Engine.Localize( "MENU_NEW_PRIMARY" )
			if CoD.IsSecondaryWeapon( currItem.itemIndex ) then
				newCard.menuHeader = Engine.Localize( "MENU_NEW_SECONDARY" )
			end
		end
	end
end

local AddNewPerks = function ( newContentCarousel, controller )
	local recentlyUnlockedItems = CoD.AfterActionReport.Stats.recentlyUnlockedItems
	for index, currItem in pairs( recentlyUnlockedItems ) do
		if CoD.IsPerk( currItem.itemIndex ) then
			local newCard = newContentCarousel:addNewCard()
			SetupNewContentCard( newCard, controller, currItem, currItem.itemImage .. "_256", {
				width = 90,
				height = 90
			} )
			newCard.menuHeader = Engine.Localize( "MENU_NEW_PERK" )
		end
	end
end

local AddNewKillstreaks = function ( newContentCarousel, controller )
	local recentlyUnlockedItems = CoD.AfterActionReport.Stats.recentlyUnlockedItems
	for index, currItem in pairs( recentlyUnlockedItems ) do
		if CoD.IsReward( currItem.itemIndex ) then
			local newCard = newContentCarousel:addNewCard()
			SetupNewContentCard( newCard, controller, currItem, currItem.itemImage .. "_menu", {
				width = 120,
				height = 120
			} )
			newCard.menuHeader = Engine.Localize( "MENU_NEW_SCORESTREAK" )
		end
	end
end

local AddNewBonusCards = function ( newContentCarousel, controller )
	local recentlyUnlockedItems = CoD.AfterActionReport.Stats.recentlyUnlockedItems
	for index, currItem in pairs( recentlyUnlockedItems ) do
		if CoD.IsBonusCard( currItem.itemIndex ) then
			local newCard = newContentCarousel:addNewCard()
			SetupNewContentCard( newCard, controller, currItem, currItem.itemImage )
			newCard.menuHeader = Engine.Localize( "MENU_NEW_WILDCARD" )
			local bottomTitleHeight = CoD.ContentGridButton.TitleHeight + 4
			local bonusCardHeight = CoD.AfterActionReport.NewContentItemHeight - bottomTitleHeight
			local bonusCardWidth = bonusCardHeight * 2
			local bonusCardHighlightedHeight = CoD.AfterActionReport.NewContentHighligtedItemHeight - bottomTitleHeight
			local bonusCardHighlightedWidth = bonusCardHighlightedHeight * 2
			newCard.centerImageContainer:registerAnimationState( "default", {
				leftAnchor = false,
				rightAnchor = false,
				left = -bonusCardWidth / 2,
				right = bonusCardWidth / 2,
				topAnchor = false,
				bottomAnchor = true,
				top = -bottomTitleHeight - bonusCardHeight,
				bottom = -bottomTitleHeight
			} )
			newCard.centerImageContainer:registerAnimationState( "big", {
				leftAnchor = false,
				rightAnchor = false,
				left = -bonusCardHighlightedWidth / 2,
				right = bonusCardHighlightedWidth / 2,
				topAnchor = false,
				bottomAnchor = true,
				top = -bottomTitleHeight - bonusCardHighlightedHeight,
				bottom = -bottomTitleHeight
			} )
			newCard.centerImageContainer:animateToState( "default" )
		end
	end
end

local AddNewGrenades = function ( newContentCarousel, controller )
	local recentlyUnlockedItems = CoD.AfterActionReport.Stats.recentlyUnlockedItems
	for index, currItem in pairs( recentlyUnlockedItems ) do
		if CoD.IsGrenade( currItem.itemIndex ) then
			local newCard = newContentCarousel:addNewCard()
			SetupNewContentCard( newCard, controller, currItem, currItem.itemImage .. "_256", {
				width = 90,
				height = 90
			} )
			newCard.menuHeader = Engine.Localize( "MENU_NEW_LETHAL_GRENADE" )
			if CoD.IsTacticalGrenade( currItem.itemIndex ) then
				newCard.menuHeader = Engine.Localize( "MENU_NEW_TACTICAL_GRENADE" )
			end
		end
	end
end

local AddEmblemOrBackgroundImage = function ( card, unlockedImageID, unlockedImageIsEmblem )
	local imageWidth = 80
	local imageHeight = 80
	if not unlockedImageIsEmblem then
		imageHeight = 40
		imageWidth = imageHeight * 4
	end
	local sizeMultiplier = 1.8
	card:setupCenterImage( nil, imageWidth, imageHeight, sizeMultiplier )
	card.centerImageContainer.centerImage:close()
	local image = LUI.UIImage.new()
	image:setLeftRight( true, true, 0, 0 )
	image:setTopBottom( true, true, 0, 0 )
	if unlockedImageIsEmblem then
		image:setupDrawEmblemById( unlockedImageID )
	else
		image:setupDrawBackgroundById( unlockedImageID )
	end
	card.centerImageContainer:addElement( image )
end

local AddItemImage = function ( card, imageName, width, height, image1Name, image2Name )
	local imageHeight = height
	local imageWidth = width
	if image1Name then
		local space = 30
		card:setupCenterImage( imageName, imageWidth * 2 + space, imageHeight, sizeMultiplier )
		card.centerImageContainer.centerImage:close()
		local image1 = LUI.UIImage.new()
		image1:setLeftRight( false, false, -imageWidth - space / 2, -space / 2 )
		image1:setTopBottom( false, false, -imageHeight / 2, imageHeight / 2 )
		image1:setImage( RegisterMaterial( image1Name ) )
		card.centerImageContainer:addElement( image1 )
		local image2 = LUI.UIImage.new()
		image2:setLeftRight( false, false, space / 2, imageWidth + space / 2 )
		image2:setTopBottom( false, false, -imageHeight / 2, imageHeight / 2 )
		image2:setImage( RegisterMaterial( image2Name ) )
		card.centerImageContainer:addElement( image2 )
	else
		local sizeMultiplier = 1.8
		card:setupCenterImage( imageName, imageWidth, imageHeight, sizeMultiplier )
	end
end

local GetItemName = function ( challengeType, itemIndex )
	if challengeType == CoD.MILESTONE_WEAPON then
		return Engine.Localize( Engine.GetItemName( itemIndex ) )
	elseif challengeType == CoD.MILESTONE_GROUP then
		return Engine.Localize( "MPUI_" .. Engine.GetItemGroupByIndex( itemIndex ) )
	elseif challengeType == CoD.MILESTONE_ATTACHMENTS then
		return Engine.Localize( Engine.GetAttachmentNameByIndex( itemIndex ) )
	elseif challengeType == CoD.MILESTONE_GAMEMODE then
		return Engine.Localize( "MPUI_" .. Engine.GetGametypeName( itemIndex ) )
	else
		return ""
	end
end

local SetupNewContentRewardsCard = function ( card, controller, currChallengeInfo, setupImage )
	CoD.ContentGridButton.SetupButtonImages( card, CoD.GrenadeGridButton.glowBackColor, CoD.GrenadeGridButton.glowFrontColor )
	local contentTitleContainer = LUI.UIElement.new()
	local height = CoD.textSize.ExtraSmall
	contentTitleContainer:setLeftRight( true, true, 5, 0 )
	contentTitleContainer:setTopBottom( false, true, -height - 2, -2 )
	card:addElement( contentTitleContainer )
	if currChallengeInfo.row then
		local row = currChallengeInfo.row
		local tableNumber = currChallengeInfo.tableNumber
		local tableName = "mp/statsmilestones" .. tableNumber + 1 .. ".csv"
		local challengeString = Engine.TableLookupGetColumnValueForRow( tableName, row, 5 )
		local maxVal = tonumber( Engine.TableLookupGetColumnValueForRow( tableName, row, 2 ) )
		local xpReward = tonumber( Engine.TableLookupGetColumnValueForRow( tableName, row, 6 ) )
		local unlockItem = Engine.TableLookupGetColumnValueForRow( tableName, row, 9 )
		local itemIndex = currChallengeInfo.itemIndex
		local challengeType = currChallengeInfo.type
		local isTieredChallenge = false
		local hintText = ""
		local titleText = ""
		local itemName = ""
		local localizedTierText = ""
		local xpRewardText = ""
		local menuHeader = Engine.Localize( "MENU_NEW_CONTENT" )
		if xpReward and xpReward > 0 then
			xpRewardText = Engine.Localize( "RANK_XP", xpReward )
		end
		itemName = GetItemName( challengeType, itemIndex )
		isTieredChallenge = CoD.IsTieredChallenge( controller, tableName, row )
		titleText = Engine.Localize( challengeString, "", itemName, CoD.GetLocalizedTierText( controller, tableName, row ) )
		hintText = Engine.Localize( challengeString .. "_DESC", maxVal, itemName )
		if setupImage and currChallengeInfo.unlockedImageID and currChallengeInfo.unlockedImageID > 0 then
			AddEmblemOrBackgroundImage( card, currChallengeInfo.unlockedImageID, currChallengeInfo.unlockedImageIsEmblem )
			menuHeader = Engine.Localize( "MENU_NEW_BACKGROUND" )
			if currChallengeInfo.unlockedImageIsEmblem then
				menuHeader = Engine.Localize( "MENU_NEW_EMBLEM" )
			end
		elseif unlockItem and string.find( unlockItem, "camo_" ) ~= nil then
			local camoImageName = Engine.TableLookup( nil, CoD.attachmentTable, 4, unlockItem, 6 )
			local camoName = Engine.TableLookup( nil, CoD.attachmentTable, 4, unlockItem, 3 )
			local camoHeight = 40
			local camoWidth = camoHeight * 4
			AddItemImage( card, camoImageName, camoWidth, camoHeight )
			titleText = Engine.Localize( camoName )
			hintText = Engine.Localize( challengeString .. "_DESC", maxVal, itemName )
			menuHeader = Engine.Localize( "MENU_NEW_CAMOUFLAGE" )
			card.camoName = camoName
			card.itemName = itemName
		elseif unlockItem and string.find( unlockItem, "reticle_" ) ~= nil then
			local reticleIndex = string.gsub( unlockItem, "reticle_", "" )
			local opticAttachmentRef = CoD.CACUtility.attachmentReferences[itemIndex + 1]
			local reticleImageName = opticAttachmentRef .. "_" .. reticleIndex
			local reticleName = Engine.Localize( "MPUI_RETICLE_" .. opticAttachmentRef .. "_" .. reticleIndex )
			if opticAttachmentRef == "dualoptic" then
				local image1MaterialName = "reflex_" .. reticleIndex
				local image2MaterialName = "acog_" .. reticleIndex
				if reticleIndex == "0" then
					image1MaterialName = "dualoptic_up_0"
					image2MaterialName = "dualoptic_down_0"
				elseif reticleIndex == "9" then
					image1MaterialName = "dualoptic_up_9"
					image2MaterialName = "dualoptic_down_9"
				end
				AddItemImage( card, nil, 60, 60, image1MaterialName, image2MaterialName )
			else
				AddItemImage( card, reticleImageName, 60, 60 )
			end
			titleText = reticleName
			hintText = Engine.Localize( challengeString .. "_DESC", maxVal, itemName )
			menuHeader = Engine.Localize( "MENU_NEW_RETICLE" )
		end
		local title = CoD.GetTextElem( "ExtraSmall", "Left", titleText )
		title:setLeftRight( true, true, 4, 0 )
		card.title = title
		contentTitleContainer:addElement( title )
		card.title:registerAnimationState( "button_over", {
			red = CoD.BOIIOrange.r,
			green = CoD.BOIIOrange.g,
			blue = CoD.BOIIOrange.b
		} )
		LUI.UIButton.SetupElement( card.title )
		card.desc = hintText
		card.xpRewardText = xpRewardText
		card.menuHeader = menuHeader
	end
	card:registerEventHandler( "gain_focus", NewContentCardGainFocus )
	card:registerEventHandler( "lose_focus", NewContentCardLoseFocus )
end

local AddNewRewards = function ( newContentCarousel, controller )
	local recentChallenges = CoD.AfterActionReport.Stats.recentChallenges
	if not recentChallenges then
		return 
	elseif #recentChallenges == 0 then
		return 
	end
	for index, currChallengeInfo in ipairs( recentChallenges ) do
		if currChallengeInfo.row then
			local row = currChallengeInfo.row
			local tableNumber = currChallengeInfo.tableNumber
			local tableName = "mp/statsmilestones" .. tableNumber + 1 .. ".csv"
			local unlockItem = Engine.TableLookupGetColumnValueForRow( tableName, row, 9 )
			if unlockItem ~= "" then
				local newCard = newContentCarousel:addNewCard()
				SetupNewContentRewardsCard( newCard, controller, currChallengeInfo )
			end
			if currChallengeInfo.unlockedImageID and currChallengeInfo.unlockedImageID > 0 then
				local newCard = newContentCarousel:addNewCard()
				SetupNewContentRewardsCard( newCard, controller, currChallengeInfo, true )
			end
		end
	end
end

local AddNewContentCards = function ( controller, newContentCarousel )
	AddNewBonusCards( newContentCarousel, controller )
	AddNewWeapons( newContentCarousel, controller )
	AddNewPerks( newContentCarousel, controller )
	AddNewGrenades( newContentCarousel, controller )
	AddNewKillstreaks( newContentCarousel, controller )
	AddNewRewards( newContentCarousel, controller )
end

local SetupUnlockTokenText = function ( self, controller )
	if self.list then
		self.list:close()
	end
	local stats = CoD.AfterActionReport.Stats
	local unlockTokens = stats.currentStats.unlocks[0]:get()
	if unlockTokens > 0 then
		local list = LUI.UIElement.new()
		list:setLeftRight( true, true, 0, 0 )
		list:setTopBottom( false, true, -CoD.textSize.Default, 0 )
		local unlockString = Engine.Localize( "MENU_UNLOCK_TOKEN_AVAILABLE", unlockTokens )
		if unlockTokens > 1 then
			unlockString = Engine.Localize( "MPUI_UNLOCK_TOKENS_AVAILABLE", unlockTokens )
		end
		local textLeft, textTop, textRight, textBottom = GetTextDimensions( unlockString, CoD.fonts.Default, CoD.textSize.Default )
		local textWidth = textRight + textLeft
		local unlockTokenText = LUI.UIText.new()
		unlockTokenText:setLeftRight( false, true, -textWidth, 0 )
		unlockTokenText:setTopBottom( true, true, 0, 0 )
		unlockTokenText:setFont( CoD.fonts.Default )
		unlockTokenText:setText( unlockString )
		unlockTokenText:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
		local tokenIconSize = 28
		local tokenIcon = LUI.UIImage.new()
		tokenIcon:setLeftRight( false, true, -textWidth - tokenIconSize - 3, -textWidth - 3 )
		tokenIcon:setTopBottom( false, true, -tokenIconSize + 3, 3 )
		tokenIcon:setImage( RegisterMaterial( CoD.AfterActionReport.TokenImageMaterialName64 ) )
		list:addElement( unlockTokenText )
		list:addElement( tokenIcon )
		self.list = list
		self:addElement( list )
	end
end

local PurchaseCurrentItem = function ( self, event )
	CoD.ConfirmPurchase.OpenIfNecessary( self, event.controller, self.currentItemIndex, nil, true )
	Engine.PlaySound( "cac_grid_equip_item" )
end

local AddPurchaseButtonPrompt = function ( self, event )
	self.currentItemIndex = event.itemIndex
	self.currentCard = event.card
	if self.purchaseButtonPrompt:getParent() == nil then
		self:addLeftButtonPrompt( self.purchaseButtonPrompt )
	end
end

local RemovePurchaseButtonPrompt = function ( self, event )
	self.purchaseButtonPrompt:close()
end

local ItemPurchased = function ( self, event )
	self.purchaseButtonPrompt:close()
	self.currentCard.tokenIcon:close()
	SetupUnlockTokenText( self, event.controller )
end

local SetupDescriptionText = function ( self )
	local bottomOffset = 80
	local font = "Default"
	local textHeight = CoD.textSize[font]
	local textFont = CoD.fonts[font]
	self.descText = LUI.UIText.new()
	self.descText:setLeftRight( true, true, 0, 0 )
	self.descText:setTopBottom( false, true, -bottomOffset - textHeight, -bottomOffset )
	self.descText:setFont( textFont )
	self.descText:setAlignment( LUI.Alignment.Left )
	self:addElement( self.descText )
end

local SetupXPRewardText = function ( self )
	local bottomOffset = 50
	local font = "Condensed"
	local textHeight = CoD.textSize[font]
	local textFont = CoD.fonts[font]
	self.xpRewardText = LUI.UIText.new()
	self.xpRewardText:setLeftRight( true, true, 0, 0 )
	self.xpRewardText:setTopBottom( false, true, -bottomOffset - textHeight, -bottomOffset )
	self.xpRewardText:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	self.xpRewardText:setAlignment( LUI.Alignment.Left )
	self.xpRewardText:setFont( textFont )
	self:addElement( self.xpRewardText )
end

local SetDescAndXPReward = function ( self, event )
	self.descText:setText( "" )
	self.xpRewardText:setText( "" )
	if event.desc then
		self.descText:setText( event.desc )
	end
	if event.xpRewardText then
		self.xpRewardText:setText( event.xpRewardText )
	end
	if event.menuHeader then
		self:setTitle( Engine.ToUpper( event.menuHeader ) )
	end
end

local SetupNewContentPopup = function ( self, controller, rewardsPopup )
	local itemWidth = CoD.AfterActionReport.NewContentItemWidth
	local itemHeight = CoD.AfterActionReport.NewContentItemHeight
	local highlightedItemWidth = CoD.AfterActionReport.NewContentHighlightedItemWidth
	local highligtedItemHeight = CoD.AfterActionReport.NewContentHighligtedItemHeight
	local cardCarouselListTop = CoD.Menu.TitleHeight + 10
	local defaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = cardCarouselListTop,
		bottom = 0
	}
	local hintTextParams = {
		hintTextLeft = highlightedItemWidth + 10,
		hintTextWidth = 500,
		hintTextTop = -30,
		hintTextHeight = 100
	}
	local cardCarouselList = CoD.CardCarouselList.new( defaultAnimState, controller, itemWidth, itemHeight, highlightedItemWidth, highligtedItemHeight, hintTextParams )
	local newContentCarousel = cardCarouselList:addCardCarousel( "" )
	if not rewardsPopup then
		AddNewContentCards( controller, newContentCarousel )
		SetupUnlockTokenText( self )
	else
		AddNewRewardsCards( controller, newContentCarousel )
	end
	SetupDescriptionText( self )
	SetupXPRewardText( self )
	self.purchaseButtonPrompt = CoD.ButtonPrompt.new( "alt2", Engine.Localize( "MENU_UNLOCK_NOW" ), self, "purchase_current_item", false, nil, false, nil, "U" )
	self:registerEventHandler( "add_purchase_button_prompt", AddPurchaseButtonPrompt )
	self:registerEventHandler( "remove_purchase_button_prompt", RemovePurchaseButtonPrompt )
	self:registerEventHandler( "purchase_current_item", PurchaseCurrentItem )
	self:registerEventHandler( "purchased", ItemPurchased )
	self:registerEventHandler( "set_desc_and_xp_reward", SetDescAndXPReward )
	self:addElement( cardCarouselList )
	cardCarouselList:focusCurrentCardCarousel( controller )
end

LUI.createMenu.AARNewContent = function ( controller )
	local self = CoD.Menu.NewMediumPopup( "AARNewContent" )
	self:addTitle( Engine.ToUpper( Engine.Localize( "MENU_NEW_CONTENT" ) ) )
	CoD.AfterActionReport.AddButtonPrompts( self, "continue_to_next" )
	self:registerEventHandler( "continue_to_next", CoD.AARPopup.AARPopupContinueToNext )
	self.animateIn = CoD.NullFunction
	SetupNewContentPopup( self, controller )
	return self
end

local GetNewUnlockGridButton = function ( contentIndex, weaponItemIndex, attachmentNum )
	local self = CoD.ContentGridButton.new( contentIndex )
	self.attachmentName = Engine.Localize( Engine.GetAttachmentNameByIndex( attachmentNum ) )
	self.attachmentDesc = Engine.Localize( Engine.GetAttachmentDesc( weaponItemIndex, attachmentNum ) )
	self.attachmentReward = Engine.Localize( Engine.Localize( "RANK_XP", Engine.GetItemAttachmentReward( weaponItemIndex, attachmentNum ) ) )
	CoD.ContentGridButton.SetupButtonText( self, self.attachmentName )
	CoD.AttachmentGridButton.SetupButtonImages( self, Engine.GetAttachmentImageByWeaponAndAttachIndex( weaponItemIndex, attachmentNum ) )
	return self
end

local SetupNewAttachmentsPopup = function ( self, controller )
	if self.infoContainer then
		self.infoContainer:close()
	end
	local topOffset = 80
	local bottomOffset = 50
	local infoContainer = LUI.UIElement.new()
	infoContainer:setLeftRight( true, true, 0, 0 )
	infoContainer:setTopBottom( true, true, topOffset, -bottomOffset )
	self.infoContainer = infoContainer
	self:addElement( infoContainer )
	local currItemIndex = self.unlockedAttachmentInfo[self.currInfoIndex].itemIndex
	local currAttachmentInfo = self.unlockedAttachmentInfo[self.currInfoIndex].unlockedAttachments
	self:setTitle( Engine.ToUpper( Engine.Localize( "MENU_NEW_ATTACHMENTS_ARG_CAPS", Engine.GetItemName( currItemIndex ) ) ) )
	local gunImageWidth = 400
	local gunImageHeight = 200
	local gunImageContainer = LUI.UIElement.new()
	gunImageContainer:setLeftRight( false, true, -gunImageWidth, 0 )
	gunImageContainer:setTopBottom( true, false, 0, gunImageHeight )
	gunImageContainer:addElement( CoD.BorderT6.new( 1, 1, 1, 1, 0.1 ) )
	infoContainer:addElement( gunImageContainer )
	local gunImage = LUI.UIImage.new()
	gunImage:setLeftRight( true, true, 0, 0 )
	gunImage:setTopBottom( true, true, 0, 0 )
	gunImage:setImage( RegisterMaterial( Engine.GetItemImage( currItemIndex ) .. "_big" ) )
	gunImageContainer:addElement( gunImage )
	local gunLevelBgWidth = 50
	local gunLevelBgHeight = 50
	local gunLevelTextFont = "Default"
	local rightInset = 9
	local bottomInset = 5
	local gunLevelContainer = CoD.WeaponLevel.GetWeaponLevelIcon( gunLevelBgWidth, gunLevelBgHeight, gunLevelTextFont, 0, -1, 1 )
	gunLevelContainer:setLeftRight( false, true, -rightInset - gunLevelBgWidth, -rightInset )
	gunLevelContainer:setTopBottom( false, true, -bottomInset - gunLevelBgHeight, -bottomInset )
	gunImageContainer:addElement( gunLevelContainer )
	gunLevelContainer:update( controller, currItemIndex )
	local gridMaxItems = 6
	local gridColumns = 3
	local gridItemSpacing = 8
	local gridItemWidth = 140
	local gridItemHeight = 64 + CoD.ContentGridButton.TitleHeight + 10
	local numItems = #currAttachmentInfo
	local gridDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = 0,
		bottom = gridItemHeight
	}
	local contentGrid = CoD.ContentGrid.new( gridColumns, gridDefaultAnimState, gridItemWidth, gridItemHeight, gridItemSpacing )
	local buttonToGainFocus = nil
	for index, info in ipairs( currAttachmentInfo ) do
		if gridMaxItems < index then
			break
		end
		local contentButton = GetNewUnlockGridButton( index, currItemIndex, info.attachmentNum )
		contentGrid:addButton( contentButton )
		if not buttonToGainFocus then
			buttonToGainFocus = contentButton
		end
	end
	topOffset = gridItemHeight * math.ceil( math.min( numItems, gridMaxItems ) / gridColumns ) + 22
	local attachmentNameFont = "Big"
	local attachmentNameHeight = CoD.textSize[attachmentNameFont]
	
	local attachmentNameTextElem = LUI.UIText.new()
	attachmentNameTextElem:setLeftRight( true, false, 0, gridItemWidth )
	attachmentNameTextElem:setTopBottom( true, false, topOffset, topOffset + attachmentNameHeight )
	attachmentNameTextElem:setFont( CoD.fonts[attachmentNameFont] )
	attachmentNameTextElem:setText( buttonToGainFocus.attachmentName )
	infoContainer:addElement( attachmentNameTextElem )
	self.attachmentNameTextElem = attachmentNameTextElem
	
	topOffset = topOffset + attachmentNameHeight
	local attachmentDescFont = "ExtraSmall"
	local attachmentDescHeight = CoD.textSize[attachmentDescFont]
	
	local attachmentDescTextElem = LUI.UIText.new()
	attachmentDescTextElem:setLeftRight( true, false, 0, gridItemWidth * gridColumns )
	attachmentDescTextElem:setTopBottom( true, false, topOffset, topOffset + attachmentDescHeight )
	attachmentDescTextElem:setFont( CoD.fonts[attachmentDescFont] )
	attachmentDescTextElem:setText( buttonToGainFocus.attachmentDesc )
	attachmentDescTextElem:setAlignment( LUI.Alignment.Left )
	infoContainer:addElement( attachmentDescTextElem )
	self.attachmentDescTextElem = attachmentDescTextElem
	
	topOffset = topOffset + attachmentDescHeight + 20
	local attachmentRewardFont = "ExtraSmall"
	local attachmentRewardHeight = CoD.textSize[attachmentRewardFont]
	
	local attachmentRewardTextElem = LUI.UIText.new()
	attachmentRewardTextElem:setLeftRight( true, false, 0, gridItemWidth * gridColumns )
	attachmentRewardTextElem:setTopBottom( true, false, topOffset, topOffset + attachmentRewardHeight )
	attachmentRewardTextElem:setFont( CoD.fonts[attachmentRewardFont] )
	attachmentRewardTextElem:setText( buttonToGainFocus.attachmentReward )
	attachmentRewardTextElem:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	attachmentRewardTextElem:setAlignment( LUI.Alignment.Left )
	infoContainer:addElement( attachmentRewardTextElem )
	self.attachmentRewardTextElem = attachmentRewardTextElem
	
	infoContainer:addElement( contentGrid )
	buttonToGainFocus:processEvent( {
		name = "gain_focus",
		controller = controller
	} )
end

CoD.AARPopup.AARNewAttachmentsContinueToNext = function ( self, event )
	self.currInfoIndex = self.currInfoIndex + 1
	if #self.unlockedAttachmentInfo < self.currInfoIndex then
		CoD.AARPopup.AARPopupContinueToNext( self, event )
		return 
	else
		SetupNewAttachmentsPopup( self, event.controller )
	end
end

CoD.AARPopup.AARNewAttachmentsButtonHightlighted = function ( self, event )
	if self.attachmentNameTextElem and event.button and event.button.attachmentName then
		self.attachmentNameTextElem:setText( event.button.attachmentName )
	end
	if self.attachmentDescTextElem and event.button and event.button.attachmentDesc then
		self.attachmentDescTextElem:setText( event.button.attachmentDesc )
	end
	if self.attachmentRewardTextElem and event.button and event.button.attachmentReward then
		self.attachmentRewardTextElem:setText( event.button.attachmentReward )
	end
end

LUI.createMenu.AARNewAttachments = function ( controller )
	local self = CoD.Menu.NewMediumPopup( "AARNewAttachments" )
	local stats = CoD.AfterActionReport.Stats
	self:addTitle( "" )
	self.unlockedAttachmentInfo = stats.unlockedAttachmentInfo
	self.currInfoIndex = 1
	CoD.AfterActionReport.AddButtonPrompts( self, "continue_to_next" )
	SetupNewAttachmentsPopup( self, controller )
	self:registerEventHandler( "continue_to_next", CoD.AARPopup.AARNewAttachmentsContinueToNext )
	self:registerEventHandler( "content_button_highlighted", CoD.AARPopup.AARNewAttachmentsButtonHightlighted )
	self.animateIn = CoD.NullFunction
	return self
end

