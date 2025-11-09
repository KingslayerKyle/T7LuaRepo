require( "ui.T6.CoD9Button" )
require( "ui.T6.LeaderboardPreviewList" )

CoD.LeaderboardCarouselZombie = {}
CoD.LeaderboardCarouselZombie.NumLeagueTeamsToFetch = 19
CoD.LeaderboardCarouselZombie.ItemWidth = 192
CoD.LeaderboardCarouselZombie.ItemHeight = 146
CoD.LeaderboardCarouselZombie.HighlightedItemWidth = 345.6
CoD.LeaderboardCarouselZombie.HighlightedItemHeight = 217.8
CoD.LeaderboardCarouselZombie.BackgroundCardIconHeightWidthRatio = 0.46
CoD.LeaderboardCarouselZombie.BackgroundCardIconScale = 1.6
CoD.LeaderboardCarouselZombie.SubdivisionInfoFetchTimer = 1000
CoD.LeaderboardCarouselZombie.glowBackColor = {}
CoD.LeaderboardCarouselZombie.glowBackColor.r = 1
CoD.LeaderboardCarouselZombie.glowBackColor.g = 1
CoD.LeaderboardCarouselZombie.glowBackColor.b = 1
CoD.LeaderboardCarouselZombie.glowFrontColor = {}
CoD.LeaderboardCarouselZombie.glowFrontColor.r = 1
CoD.LeaderboardCarouselZombie.glowFrontColor.g = 1
CoD.LeaderboardCarouselZombie.glowFrontColor.b = 1
CoD.LeaderboardCarouselZombie.HintTextParams = {}
CoD.LeaderboardCarouselZombie.HintTextParams.hintTextLeft = 353
CoD.LeaderboardCarouselZombie.HintTextParams.hintTextWidth = 510
CoD.LeaderboardCarouselZombie.HintTextParams.hintTextTop = -32
CoD.LeaderboardCarouselZombie.MiniLeaderboardSideOffset = 4
CoD.LeaderboardCarouselZombie.EmblemEditorIconOffset = 10
CoD.LeaderboardCarouselZombie.BackgroundCardIconOffset = 20
LUI.createMenu.LeaderboardCarouselZM = function ( controller )
	local self = CoD.Menu.New( "LeaderboardCarouselZM" )
	self:addLargePopupBackground()
	self:setOwner( controller )
	self.goBack = CoD.LeaderboardCarouselZombie.GoBack
	self:addSelectButton()
	self:addBackButton()
	self:registerEventHandler( "open_leaderboard", CoD.LeaderboardCarouselZombie.OpenLeaderboard )
	self:registerEventHandler( "remove_select_button", CoD.LeaderboardCarouselZombie.RemoveSelectButton )
	self:registerEventHandler( "add_select_button", CoD.LeaderboardCarouselZombie.AddSelectButton )
	self:registerEventHandler( "multi_read_update", CoD.LeaderboardCarouselZombie.MiniLeaderboardUpdate )
	self:addTitle( Engine.Localize( "MENU_LEADERBOARDS_CAPS" ) )
	local top = CoD.textSize.Big + 10
	local cardCarouselList = CoD.CardCarouselList.new( nil, controller, CoD.LeaderboardCarouselZombie.ItemWidth, CoD.LeaderboardCarouselZombie.ItemHeight, CoD.LeaderboardCarouselZombie.HighlightedItemWidth, CoD.LeaderboardCarouselZombie.HighligtedItemHeight, CoD.LeaderboardCarouselZombie.HintTextParams )
	cardCarouselList:setLeftRight( true, true, 0, 0 )
	cardCarouselList:setTopBottom( true, true, top, -CoD.ButtonPrompt.Height )
	cardCarouselList.popup = self
	self:addElement( cardCarouselList )
	cardCarouselList.titleListContainer.spacing = 0
	local titleListContainerDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = -CoD.CoD9Button.Height,
		topAnchor = true,
		bottomAnchor = false,
		top = cardCarouselList.cardCarouselSize + 60,
		bottom = 0
	}
	cardCarouselList.titleListContainer:registerAnimationState( "default", titleListContainerDefaultAnimState )
	cardCarouselList.titleListContainer:animateToState( "default" )
	top = top + cardCarouselList.cardCarouselSize - 7
	local lockContent = true
	if not Engine.IsBetaBuild() then
		lockContent = false
	end
	CoD.LeaderboardCarouselZombie.AddCarousels( cardCarouselList, controller, lockContent )
	if CoD.LeaderboardCarouselZombie.CurrentCarouselInfo then
		cardCarouselList:setInitialCarousel( CoD.LeaderboardCarouselZombie.CurrentCarouselInfo.carouselIndex, CoD.LeaderboardCarouselZombie.CurrentCarouselInfo.cardIndex )
	end
	if CoD.LeaderboardZombie.MINI_LEADERBOARD_CACHE_A == false then
		CoD.LeaderboardZombie.MINI_LEADERBOARD_CACHE = 1
		CoD.LeaderboardCarouselZombie.MiniRead( controller, 1 )
	elseif CoD.LeaderboardZombie.MINI_LEADERBOARD_CACHE_B == false then
		CoD.LeaderboardZombie.MINI_LEADERBOARD_CACHE = 2
		CoD.LeaderboardCarouselZombie.MiniRead( controller, 6 )
	end
	local lineTop = top + 87
	local line = LUI.UIImage.new()
	line:setLeftRight( true, false, 0, CoD.Menu.Width / 2 - 85 )
	line:setTopBottom( true, false, lineTop, lineTop + 1 )
	line:setAlpha( 0.05 )
	self:addElement( line )
	cardCarouselList:focusCurrentCardCarousel( controller )
	return self
end

CoD.LeaderboardCarouselZombie.GoBack = function ( self, controller )
	CoD.LeaderboardCarouselZombie.CurrentCarouselInfo = nil
	Engine.PartyHostClearUIState()
	CoD.Menu.goBack( self, controller )
end

CoD.LeaderboardCarouselZombie.RemoveSelectButton = function ( self, event )
	if self.selectButton then
		self.selectButton:close()
	end
end

CoD.LeaderboardCarouselZombie.AddSelectButton = function ( self, event )
	self.backButton:close()
	if self.selectButton then
		self.selectButton:close()
	end
	self:addBackButton()
	self:addSelectButton()
end

CoD.LeaderboardCarouselZombie.SetupCardCarouselTitleTextPosition = function ( cardCarousel, cardCarouselList )
	local titleTop = cardCarouselList.cardCarouselSize + 30
	local titleDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = false,
		top = titleTop,
		bottom = titleTop + CoD.CardCarousel.TitleSize,
		font = CoD.fonts.Big
	}
	cardCarousel.title:registerAnimationState( "default", titleDefaultAnimState )
	cardCarousel.title:animateToState( "default" )
end

CoD.LeaderboardCarouselZombie.SetupCarouselCard = function ( card, text, image, chalkImageLeft, chalkImageRight, width, height, topOffset )
	if topOffset == nil then
		topOffset = 0
	end
	if image then
		card.iconMaterial = RegisterMaterial( image )
		card.icon = LUI.UIImage.new()
		card.icon:setLeftRight( false, false, -width / 2, width / 2 )
		card.icon:setTopBottom( false, false, -height / 2 + topOffset, height / 2 + topOffset )
		card.icon:setImage( card.iconMaterial )
		card:addElement( card.icon )
	end
	if chalkImageLeft then
		card.chalkIconLeftMaterial = RegisterMaterial( chalkImageLeft )
		card.chalkIconLeft = LUI.UIImage.new()
		card.chalkIconLeft:setLeftRight( true, false, 0, width / 4 )
		card.chalkIconLeft:setTopBottom( false, true, -(height / CoD.LeaderboardCarouselZombie.BackgroundCardIconHeightWidthRatio) / 4 + topOffset * 2, topOffset * 2 )
		card.chalkIconLeft:setImage( card.chalkIconLeftMaterial )
		card:addElement( card.chalkIconLeft )
		card.chalkTextCenter = LUI.UIText.new()
		card.chalkTextCenter:setLeftRight( false, false, -width / 8, width / 8 )
		card.chalkTextCenter:setTopBottom( false, true, -(height / CoD.LeaderboardCarouselZombie.BackgroundCardIconHeightWidthRatio) / 8 + topOffset * 2, topOffset * 2 )
		card.chalkTextCenter:setText( "Z" )
		card.chalkTextCenter:setFont( CoD.Menu.TitleFont )
		card:addElement( card.chalkTextCenter )
	end
	if chalkImageRight then
		card.chalkIconRightMaterial = RegisterMaterial( chalkImageRight )
		card.chalkIconRight = LUI.UIImage.new()
		card.chalkIconRight:setLeftRight( false, true, -width / 4, 0 )
		card.chalkIconRight:setTopBottom( false, true, -(height / CoD.LeaderboardCarouselZombie.BackgroundCardIconHeightWidthRatio) / 4 + topOffset * 2, topOffset * 2 )
		card.chalkIconRight:setImage( card.chalkIconRightMaterial )
		card:addElement( card.chalkIconRight )
	end
	card.title = LUI.UIText.new()
	card.title:setLeftRight( true, true, 5, 0 )
	card.title:setTopBottom( false, true, -CoD.textSize.Default, 0 )
	card.title:setFont( CoD.fonts.Default )
	card.title:setRGB( CoD.offWhite.r, CoD.offWhite.b, CoD.offWhite.g )
	card.title:setAlignment( LUI.Alignment.Left )
	card.titleText = text
	card.title:setText( card.titleText )
	card.title:registerAnimationState( "button_over", {
		red = CoD.BOIIOrange.r,
		green = CoD.BOIIOrange.g,
		blue = CoD.BOIIOrange.b
	} )
	LUI.UIButton.SetupElement( card.title )
	card:addElement( card.title )
	if card.border then
		card.border:close()
	end
	if card.highlightedborder then
		card.highlightedborder:close()
	end
	CoD.ContentGridButton.SetupButtonImages( card, CoD.LeaderboardCarouselZombie.glowBackColor, CoD.LeaderboardCarouselZombie.glowFrontColor )
end

local GetHintTextAreaTextElem = function ( textsizeAndFont, text )
	local textContainer = LUI.UIElement.new()
	textContainer:setLeftRight( true, true, 0, 0 )
	textContainer:setTopBottom( true, false, 0, CoD.textSize[textsizeAndFont] )
	local textElem = LUI.UIText.new()
	textElem:setLeftRight( true, true, 0, 0 )
	textElem:setTopBottom( true, true, 0, 0 )
	textElem:setAlignment( LUI.UIElement.Left )
	textElem:setFont( CoD.fonts[textsizeAndFont] )
	textElem:setText( text )
	textContainer.textElem = textElem
	textContainer:addElement( textElem )
	return textContainer
end

CoD.LeaderboardCarouselZombie.AddCarousels = function ( cardCarouselList, controller, lockContent )
	if lockContent then
		CoD.LeaderboardCarouselZombie.AddCarousel( Engine.Localize( "MENU_LEADERBOARDS_CAPS" ), cardCarouselList, controller, true )
	else
		CoD.LeaderboardCarouselZombie.AddLeaderboardCarousel( "MENU_LB_GROUP_GLOBAL", CoD.LeaderboardZombie.LEADERBOARD_GROUP_GLOBAL, cardCarouselList, controller )
		CoD.LeaderboardCarouselZombie.AddLeaderboardCarousel( "ZMUI_TRANSIT_CAPS", CoD.LeaderboardZombie.LEADERBOARD_GROUP_GREENRUN, cardCarouselList, controller )
		CoD.LeaderboardCarouselZombie.AddLeaderboardCarousel( "MPUI_NUKED_CAPS", CoD.LeaderboardZombie.LEADERBOARD_GROUP_NUKETOWN, cardCarouselList, controller )
		CoD.LeaderboardCarouselZombie.AddLeaderboardCarousel( "ZMUI_HIGHRISE_CAPS", CoD.LeaderboardZombie.LEADERBOARD_GROUP_HIGHRISE, cardCarouselList, controller )
		CoD.LeaderboardCarouselZombie.AddLeaderboardCarousel( "ZMUI_PRISON_CAPS", CoD.LeaderboardZombie.LEADERBOARD_GROUP_PRISON, cardCarouselList, controller )
		CoD.LeaderboardCarouselZombie.AddLeaderboardCarousel( "ZMUI_BURIED_CAPS", CoD.LeaderboardZombie.LEADERBOARD_GROUP_BURIED, cardCarouselList, controller )
		if Dvar.ui_showNewestLeaderboards:get() == true then
			CoD.LeaderboardCarouselZombie.AddLeaderboardCarousel( "ZMUI_TOMB_CAPS", CoD.LeaderboardZombie.LEADERBOARD_GROUP_TOMB, cardCarouselList, controller )
		end
	end
end

CoD.LeaderboardCarouselZombie.LeaderboardCard_GrowCard = function ( self, growTime )
	local iconHeight = CoD.LeaderboardCarouselZombie.HighlightedItemHeight - CoD.textSize.Default
	local iconWidth = iconHeight
	CoD.LeaderboardZombie.CURR_LB_GROUP_INDEX = self.lbGroupIndex
	if CoD.LeaderboardZombie.CURR_LB_GROUP_INDEX ~= CoD.LeaderboardZombie.LEADERBOARD_GROUP_GLOBAL then
		iconWidth = iconWidth * CoD.LeaderboardCarouselZombie.BackgroundCardIconScale
		iconHeight = iconWidth * CoD.LeaderboardCarouselZombie.BackgroundCardIconHeightWidthRatio
	end
	local topOffset = -10
	if self.icon then
		self.icon:beginAnimation( "big", growTime )
		self.icon:setLeftRight( false, false, -iconWidth / 2, iconWidth / 2 )
		self.icon:setTopBottom( false, false, -iconHeight / 2 + topOffset, iconHeight / 2 + topOffset )
	end
	if self.chalkIconLeft then
		self.chalkIconLeft:beginAnimation( "big", growTime )
		self.chalkIconLeft:setLeftRight( true, false, 0, iconWidth / 4 )
		self.chalkIconLeft:setTopBottom( false, true, -(iconHeight / CoD.LeaderboardCarouselZombie.BackgroundCardIconHeightWidthRatio) / 4 + topOffset * 2, topOffset * 2 )
	end
	if self.chalkTextCenter then
		self.chalkTextCenter:beginAnimation( "big", growTime )
		self.chalkTextCenter:setLeftRight( false, false, -iconWidth / 8, iconWidth / 8 )
		self.chalkTextCenter:setTopBottom( false, true, -(iconHeight / CoD.LeaderboardCarouselZombie.BackgroundCardIconHeightWidthRatio) / 8 + topOffset * 2, topOffset * 2 )
	end
	if self.chalkIconRight then
		self.chalkIconRight:beginAnimation( "big", growTime )
		self.chalkIconRight:setLeftRight( false, true, -iconWidth / 4, 0 )
		self.chalkIconRight:setTopBottom( false, true, -(iconHeight / CoD.LeaderboardCarouselZombie.BackgroundCardIconHeightWidthRatio) / 4 + topOffset * 2, topOffset * 2 )
	end
end

CoD.LeaderboardCarouselZombie.LeaderboardCard_ShrinkCard = function ( self, shrinkTime )
	local iconHeight = CoD.LeaderboardCarouselZombie.ItemHeight - CoD.textSize.Default
	local iconWidth = iconHeight
	if CoD.LeaderboardZombie.CURR_LB_GROUP_INDEX ~= CoD.LeaderboardZombie.LEADERBOARD_GROUP_GLOBAL then
		iconWidth = iconWidth * CoD.LeaderboardCarouselZombie.BackgroundCardIconScale
		iconHeight = iconWidth * CoD.LeaderboardCarouselZombie.BackgroundCardIconHeightWidthRatio
	end
	local topOffset = -10
	if self.icon then
		self.icon:beginAnimation( "small", shrinkTime )
		self.icon:setLeftRight( false, false, -iconWidth / 2, iconWidth / 2 )
		self.icon:setTopBottom( false, false, -iconHeight / 2 + topOffset, iconHeight / 2 + topOffset )
	end
	if self.chalkIconLeft then
		self.chalkIconLeft:beginAnimation( "small", shrinkTime )
		self.chalkIconLeft:setLeftRight( true, false, 0, iconWidth / 4 )
		self.chalkIconLeft:setTopBottom( false, true, -(iconHeight / CoD.LeaderboardCarouselZombie.BackgroundCardIconHeightWidthRatio) / 4 + topOffset * 2, topOffset * 2 )
		self.chalkTextCenter:beginAnimation( "small", shrinkTime )
		self.chalkTextCenter:setLeftRight( false, false, -iconWidth / 8, iconWidth / 8 )
		self.chalkTextCenter:setTopBottom( false, true, -(iconHeight / CoD.LeaderboardCarouselZombie.BackgroundCardIconHeightWidthRatio) / 8 + topOffset * 2, topOffset * 2 )
	end
	if self.chalkIconRight then
		self.chalkIconRight:beginAnimation( "small", shrinkTime )
		self.chalkIconRight:setLeftRight( false, true, -iconWidth / 4, 0 )
		self.chalkIconRight:setTopBottom( false, true, -(iconHeight / CoD.LeaderboardCarouselZombie.BackgroundCardIconHeightWidthRatio) / 4 + topOffset * 2, topOffset * 2 )
	end
end

CoD.LeaderboardCarouselZombie.LeaderboardCard_GainFocus = function ( self, event )
	if event.button == "left" or event.button == "right" then
		CoD.LeaderboardCarouselZombie.LeaderboardCard_GrowCard( self, CoD.CardCarousel.CardGrowShrinkTime )
	else
		CoD.LeaderboardCarouselZombie.LeaderboardCard_GrowCard( self, 0 )
	end
	CoD.LeaderboardCarouselZombie.LeaderboardCardSetupHintTextArea( self.lbIndex, self.lbGroupIndex, self.cardCarousel )
	CoD.CardCarousel.Card_GainFocus( self, event )
end

CoD.LeaderboardCarouselZombie.LeaderboardCard_LoseFocus = function ( self, event )
	if event.button == "left" or event.button == "right" then
		CoD.LeaderboardCarouselZombie.LeaderboardCard_ShrinkCard( self, CoD.CardCarousel.CardGrowShrinkTime )
	end
	CoD.CardCarousel.Card_LoseFocus( self, event )
end

CoD.LeaderboardCarouselZombie.AddLeaderboardCarousel = function ( title, groupIndex, cardCarouselList, controller )
	if Dvar.ui_hideLeaderboards:get() == true then
		return 
	end
	local cardCarousel = cardCarouselList:addCardCarousel( Engine.Localize( title ) )
	CoD.LeaderboardCarouselZombie.SetupCardCarouselTitleTextPosition( cardCarousel, cardCarouselList )
	local lbCount = #CoD.LeaderboardZombie.Leaderboards[groupIndex]
	for lbIndex = 1, lbCount, 1 do
		local lb = CoD.LeaderboardZombie.Leaderboards[groupIndex][lbIndex]
		local lbIcon = lb[CoD.LeaderboardZombie.LB_ICON]
		local lbChalkIconLeft = lb[CoD.LeaderboardZombie.LB_CHALK_ICON_LEFT]
		local lbChalkIconRight = lb[CoD.LeaderboardZombie.LB_CHALK_ICON_RIGHT]
		local lbText = lb[CoD.LeaderboardZombie.LB_NAME_CORE]
		local newCard = cardCarousel:addNewCard()
		newCard:registerEventHandler( "gain_focus", CoD.LeaderboardCarouselZombie.LeaderboardCard_GainFocus )
		newCard:registerEventHandler( "lose_focus", CoD.LeaderboardCarouselZombie.LeaderboardCard_LoseFocus )
		local iconHeight = CoD.LeaderboardCarouselZombie.ItemHeight - CoD.textSize.Default
		local iconWidth = iconHeight
		if groupIndex ~= CoD.LeaderboardZombie.LEADERBOARD_GROUP_GLOBAL then
			iconWidth = iconWidth * CoD.LeaderboardCarouselZombie.BackgroundCardIconScale
			iconHeight = iconWidth * CoD.LeaderboardCarouselZombie.BackgroundCardIconHeightWidthRatio
		end
		local topOffset = -10
		if lbChalkIconLeft == "" then
			lbChalkIconLeft = nil
		end
		if lbChalkIconRight == "" then
			lbChalkIconRight = nil
		end
		CoD.LeaderboardCarouselZombie.SetupCarouselCard( newCard, Engine.Localize( lbText ), lbIcon, lbChalkIconLeft, lbChalkIconRight, iconWidth, iconHeight, topOffset )
		newCard.lbIndex = lbIndex
		newCard.lbGroupIndex = groupIndex
		newCard:setActionEventName( "open_leaderboard" )
	end
end

CoD.LeaderboardCarouselZombie.OpenLeaderboard = function ( self, event )
	if event.button.lbIndex == nil then
		return 
	elseif Engine.IsGuest( event.controller ) then
		return 
	else
		local lbMenu = self:openMenu( "LeaderboardZM", event.controller )
		local lb = CoD.LeaderboardZombie.Leaderboards[event.button.lbGroupIndex][event.button.lbIndex]
		local lbText = lb[CoD.LeaderboardZombie.LB_NAME_CORE]
		lbMenu:processEvent( {
			name = "leaderboard_loadnew",
			controller = event.controller,
			lbIndex = event.button.lbIndex,
			lbGroupIndex = event.button.lbGroupIndex
		} )
		self:close()
		CoD.LeaderboardCarouselZombie.CurrentCarouselInfo = CoD.CardCarousel.GetCurrentCarouselInfo( event.button )
	end
end

CoD.LeaderboardCarouselZombie.MiniRead = function ( controller, offset )
	local multiLeaderboard = {}
	local startIndex = offset
	local endIndex = math.min( startIndex + 4, #CoD.LeaderboardZombie.Leaderboards[CoD.LeaderboardZombie.CURR_LB_GROUP_INDEX] )
	for lbIndex = startIndex, endIndex, 1 do
		local lb = CoD.LeaderboardZombie.Leaderboards[CoD.LeaderboardZombie.CURR_LB_GROUP_INDEX][lbIndex][CoD.LeaderboardZombie.LB_LIST_CORE]
		table.insert( multiLeaderboard, {
			lbDef = lb[CoD.LeaderboardZombie.FILTER_DURATION_ALLTIME],
			lbFilter = "TRK_ALLTIME"
		} )
	end
	Engine.RequestMultiLeaderboardData( controller, CoD.REQUEST_MULTI_LB_READ_MINI_LBS, CoD.LB_FILTER_FRIENDS, multiLeaderboard )
end

CoD.LeaderboardCarouselZombie.MiniLeaderboardUpdate = function ( self, event )
	if CoD.LeaderboardZombie.MINI_LEADERBOARD_CACHE == 1 then
		if event.error == false then
			CoD.LeaderboardZombie.MINI_LEADERBOARD_CACHE_A = true
			CoD.LeaderboardZombie.MINI_LEADERBOARD_CACHE_A_DATA = {}
			if event.leaderboards ~= nil then
				CoD.LeaderboardZombie.MINI_LEADERBOARD_CACHE_A_DATA = event.leaderboards
			end
		end
		if CoD.LeaderboardZombie.MINI_LEADERBOARD_CACHE_B == false then
			CoD.LeaderboardZombie.MINI_LEADERBOARD_CACHE = 2
			CoD.LeaderboardCarouselZombie.MiniRead( event.controller, 6 )
		end
	elseif CoD.LeaderboardZombie.MINI_LEADERBOARD_CACHE == 2 and event.error == false then
		CoD.LeaderboardZombie.MINI_LEADERBOARD_CACHE_B = true
		CoD.LeaderboardZombie.MINI_LEADERBOARD_CACHE_B_DATA = {}
		if event.leaderboards ~= nil then
			CoD.LeaderboardZombie.MINI_LEADERBOARD_CACHE_B_DATA = event.leaderboards
		end
	end
end

CoD.LeaderboardCarouselZombie.AddMiniLeaderboardRow = function ( miniLeaderboard, rowIndex, isLocalXuid, gamertag, data )
	local bgColor = CoD.black
	local bgAlpha = 0.7
	local textColor = CoD.offWhite
	if rowIndex % 2 == 1 then
		bgColor = CoD.black
		bgAlpha = 0.4
	end
	if isLocalXuid == true then
		textColor = CoD.yellowGlow
	end
	local rowBG = CoD.LeaderboardZombie.AddUIImage( true, true, 0, 0, true, false, 25 * rowIndex, 25 * rowIndex + 25, bgColor.r, bgColor.b, bgColor.g, bgAlpha )
	local rowGamertag = CoD.LeaderboardZombie.AddUIText( true, true, CoD.LeaderboardCarouselZombie.MiniLeaderboardSideOffset, -CoD.LeaderboardCarouselZombie.MiniLeaderboardSideOffset, true, false, 25 * rowIndex, 25 * rowIndex + CoD.textSize.Default * 0.9, LUI.Alignment.Left )
	rowGamertag:setRGB( textColor.r, textColor.g, textColor.b )
	rowGamertag:setText( gamertag )
	local rowData = CoD.LeaderboardZombie.AddUIText( true, true, CoD.LeaderboardCarouselZombie.MiniLeaderboardSideOffset, -CoD.LeaderboardCarouselZombie.MiniLeaderboardSideOffset, true, false, 25 * rowIndex, 25 * rowIndex + CoD.textSize.Default * 0.9, LUI.Alignment.Right )
	rowData:setRGB( textColor.r, textColor.g, textColor.b )
	rowData:setText( data )
	miniLeaderboard:addElement( rowBG )
	miniLeaderboard:addElement( rowGamertag )
	miniLeaderboard:addElement( rowData )
	return miniLeaderboard
end

CoD.LeaderboardCarouselZombie.AddMiniLeaderboard = function ( lbIndex, lbGroupIndex, cardCarousel )
	local lbdef = CoD.LeaderboardZombie.Leaderboards[lbGroupIndex][lbIndex][CoD.LeaderboardZombie.LB_LIST_CORE][CoD.LeaderboardZombie.FILTER_DURATION_ALLTIME]
	local lbPointer = nil
	if CoD.LeaderboardZombie.MINI_LEADERBOARD_CACHE_A == true then
		for lb = 1, #CoD.LeaderboardZombie.MINI_LEADERBOARD_CACHE_A_DATA, 1 do
			if lbdef == CoD.LeaderboardZombie.MINI_LEADERBOARD_CACHE_A_DATA[lb].def then
				lbPointer = CoD.LeaderboardZombie.MINI_LEADERBOARD_CACHE_A_DATA[lb]
				break
			end
		end
	end
	if CoD.LeaderboardZombie.MINI_LEADERBOARD_CACHE_B == true and lbPointer == nil then
		for lb = 1, #CoD.LeaderboardZombie.MINI_LEADERBOARD_CACHE_B_DATA, 1 do
			if lbdef == CoD.LeaderboardZombie.MINI_LEADERBOARD_CACHE_B_DATA[lb].def then
				lbPointer = CoD.LeaderboardZombie.MINI_LEADERBOARD_CACHE_B_DATA[lb]
				break
			end
		end
	end
	local miniLeaderboard = CoD.LeaderboardZombie.AddUIElement( true, false, 0, 350, true, false, 0, 80 )
	local gamertagHeader = CoD.LeaderboardZombie.AddUIText( true, true, CoD.LeaderboardCarouselZombie.MiniLeaderboardSideOffset, -CoD.LeaderboardCarouselZombie.MiniLeaderboardSideOffset, true, false, 0, CoD.textSize.Default * 0.9, LUI.Alignment.Left, nil, 0.6 )
	gamertagHeader:setText( Engine.Localize( "MENU_LB_MINI_GAMERTAG" ) )
	local dataHeader = CoD.LeaderboardZombie.AddUIText( true, true, CoD.LeaderboardCarouselZombie.MiniLeaderboardSideOffset, -CoD.LeaderboardCarouselZombie.MiniLeaderboardSideOffset, true, false, 0, CoD.textSize.Default * 0.9, LUI.Alignment.Right, nil, 0.6 )
	if lbIndex == 1 then
		dataHeader:setText( Engine.Localize( "MENU_LB_SCORE" ) )
	else
		dataHeader:setText( Engine.Localize( "MENU_LB_SCORE_PER_MINUTE" ) )
	end
	miniLeaderboard:addElement( gamertagHeader )
	miniLeaderboard:addElement( dataHeader )
	local gamertagIndex = 1
	local dataIndex = 1
	if lbPointer ~= nil then
		for i = 1, #lbPointer.lbrowheaders, 1 do
			if lbPointer.lbrowheaders[i] == "Gamertag" then
				gamertagIndex = i
			end
			if lbIndex == 1 and lbPointer.lbrowheaders[i] == "Score" then
				dataIndex = i
			end
			if lbIndex > 1 and lbPointer.lbrowheaders[i] == "Score Per Minute" then
				dataIndex = i
			end
		end
	end
	local localXuid = Engine.GetXUID( controller )
	for rowIndex = 1, 3, 1 do
		local lbrow = nil
		if lbPointer ~= nil and rowIndex <= #lbPointer.lbrows then
			lbrow = lbPointer.lbrows[rowIndex]
		end
		local isLocalXuid = false
		local gamertag = "--"
		local data = "--"
		if lbrow ~= nil then
			if lbrow.xuid == localXuid then
				isLocalXuid = true
			end
			gamertag = lbrow[gamertagIndex]
			data = lbrow[dataIndex]
		end
		CoD.LeaderboardCarouselZombie.AddMiniLeaderboardRow( miniLeaderboard, rowIndex, isLocalXuid, gamertag, data )
	end
	return miniLeaderboard
end

CoD.LeaderboardCarouselZombie.LeaderboardCardSetupHintTextArea = function ( lbIndex, lbGroupIndex, cardCarousel )
	cardCarousel.hintTextContainer.hintText:close()
	if cardCarousel.hintTextContainer.hintTextList then
		cardCarousel.hintTextContainer.hintTextList:close()
	end
	if cardCarousel.hintTextContainer.spinner then
		cardCarousel.hintTextContainer.spinner:close()
	end
	local hintTextList = LUI.UIVerticalList.new()
	hintTextList:setLeftRight( true, false, 0, 510 )
	hintTextList:setTopBottom( true, true, -19, 0 )
	hintTextList:addSpacer( CoD.textSize.ExtraSmall )
	local cardText = CoD.LeaderboardZombie.Leaderboards[lbGroupIndex][lbIndex][CoD.LeaderboardZombie.LB_CARD_TEXT]
	hintTextList.leaderboardDesc = GetHintTextAreaTextElem( "ExtraSmall", Engine.Localize( cardText ) )
	hintTextList.leaderboardDesc.textElem:setLeftRight( true, true, 0, 0 )
	hintTextList:addElement( hintTextList.leaderboardDesc )
	hintTextList:addSpacer( 30 )
	cardCarousel.hintTextContainer.hintTextList = hintTextList
	cardCarousel.hintTextContainer:addElement( cardCarousel.hintTextContainer.hintTextList )
	cardCarousel.hintTextContainer:setAlpha( 0 )
	cardCarousel.hintTextContainer:beginAnimation( "fade_in", 1000 )
	cardCarousel.hintTextContainer:setAlpha( 1 )
end

CoD.LeaderboardCarouselZombie.Card_GainFocus = function ( self, event )
	if self.lockedIcon then
		local lockHeight = (CoD.LeaderboardCarouselZombie.HighlightedItemHeight - CoD.textSize.Default) / 2
		local lockWidth = lockHeight
		local lockTopOffset = -10
		self.lockedIcon:beginAnimation( "big", CoD.CardCarousel.CardGrowShrinkTime )
		self.lockedIcon:setLeftRight( false, false, -lockWidth / 2, lockWidth / 2 )
		self.lockedIcon:setTopBottom( false, false, -lockHeight / 2 + lockTopOffset, lockHeight / 2 + lockTopOffset )
	end
	CoD.CardCarousel.Card_GainFocus( self, event )
end

CoD.LeaderboardCarouselZombie.Card_LoseFocus = function ( self, event )
	if self.lockedIcon then
		local lockHeight = (CoD.LeaderboardCarouselZombie.ItemHeight - CoD.textSize.Default) / 2
		local lockWidth = lockHeight
		local lockTopOffset = -10
		self.lockedIcon:beginAnimation( "small", CoD.CardCarousel.CardGrowShrinkTime )
		self.lockedIcon:setLeftRight( false, false, -lockWidth / 2, lockWidth / 2 )
		self.lockedIcon:setTopBottom( false, false, -lockHeight / 2 + lockTopOffset, lockHeight / 2 + lockTopOffset )
	end
	CoD.CardCarousel.Card_LoseFocus( self, event )
end

CoD.LeaderboardCarouselZombie.AddCarousel = function ( title, cardCarouselList, controller, isLocked, hintText )
	local cardCarousel = cardCarouselList:addCardCarousel( title )
	CoD.LeaderboardCarouselZombie.SetupCardCarouselTitleTextPosition( cardCarousel, cardCarouselList )
	local newCard = cardCarousel:addNewCard()
	CoD.LeaderboardCarouselZombie.SetupCarouselCard( newCard, "", nil, nil, nil, 0, 0, 0 )
	newCard:registerEventHandler( "gain_focus", CoD.LeaderboardCarouselZombie.Card_GainFocus )
	newCard:registerEventHandler( "lose_focus", CoD.LeaderboardCarouselZombie.Card_LoseFocus )
	if isLocked then
		local lockHeight = (CoD.LeaderboardCarouselZombie.ItemHeight - CoD.textSize.Default) / 2
		local lockWidth = lockHeight
		local lockTopOffset = -10
		newCard.lockedIcon = LUI.UIImage.new()
		newCard.lockedIcon:setLeftRight( false, false, -lockWidth / 2, lockWidth / 2 )
		newCard.lockedIcon:setTopBottom( false, false, -lockHeight / 2 + lockTopOffset, lockHeight / 2 + lockTopOffset )
		newCard.lockedIcon:setImage( RegisterMaterial( "menu_mp_lobby_locked_big" ) )
		newCard:addElement( newCard.lockedIcon )
	end
	if hintText ~= nil then
		newCard.hintText = hintText
	end
end

