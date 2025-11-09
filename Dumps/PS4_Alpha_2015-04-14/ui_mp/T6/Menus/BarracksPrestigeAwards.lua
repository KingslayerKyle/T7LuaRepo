CoD.BarracksPrestigeAwards = {}
LUI.createMenu.BarracksPrestigeAwards = function ( controller )
	if Engine.IsFeatureBanned( CoD.FEATURE_BAN_PRESTIGE ) then
		Engine.ExecNow( event.controller, "banCheck " .. CoD.FEATURE_BAN_PRESTIGE )
		return 
	elseif Engine.IsFeatureBanned( CoD.FEATURE_BAN_PRESTIGE_EXTRAS ) then
		Engine.ExecNow( controller, "banCheck " .. CoD.FEATURE_BAN_PRESTIGE_EXTRAS )
		return 
	else
		local self = CoD.Menu.New( "BarracksPrestigeAwards" )
		self:addLargePopupBackground()
		self:addTitle( Engine.ToUpper( Engine.Localize( "MENU_PRESTIGE_AWARDS" ) ) )
		self:addBackButton()
		self:addSelectButton()
		local top = CoD.textSize.Big + 10
		local cardCarouselList = CoD.CardCarouselList.new( nil, controller, CoD.Barracks.ItemWidth, CoD.Barracks.ItemHeight, CoD.Barracks.HighlightedItemWidth, CoD.Barracks.HighligtedItemHeight, CoD.Barracks.HintTextParams )
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
			top = cardCarouselList.cardCarouselSize + 70,
			bottom = 0
		}
		cardCarouselList.titleListContainer:registerAnimationState( "default", titleListContainerDefaultAnimState )
		cardCarouselList.titleListContainer:animateToState( "default" )
		top = top + cardCarouselList.cardCarouselSize - 7
		CoD.BarracksPrestigeAwards.AddCarousels( cardCarouselList, controller )
		cardCarouselList:focusCurrentCardCarousel( controller )
		self:registerEventHandler( "prestige_reset_stats", CoD.BarracksPrestigeAwards.PrestigeResetStats )
		self:registerEventHandler( "prestige_respec", CoD.BarracksPrestigeAwards.PrestigeRespec )
		self:registerEventHandler( "prestige_extra_cac", CoD.BarracksPrestigeAwards.PrestigeExtraCAC )
		self:registerEventHandler( "prestige_action_complete", CoD.BarracksPrestigeAwards.PrestigeActionComplete )
		return self
	end
end

CoD.BarracksPrestigeAwards.PrestigeResetStats = function ( self, event )
	if Engine.IsFeatureBanned( CoD.FEATURE_BAN_PRESTIGE ) then
		Engine.ExecNow( event.controller, "banCheck " .. CoD.FEATURE_BAN_PRESTIGE )
		return 
	elseif Engine.IsFeatureBanned( CoD.FEATURE_BAN_PRESTIGE_EXTRAS ) then
		Engine.ExecNow( event.controller, "banCheck " .. CoD.FEATURE_BAN_PRESTIGE_EXTRAS )
		return 
	else
		self:openPopup( "ConfirmPrestige", event.controller, {
			action = "resetstats_confirm",
			title = "MENU_FRESH_START",
			message = "MENU_PRESTIGE_FRESH_START_DESC",
			choiceAText = Engine.Localize( "MENU_USE_FRESH_START" ),
			image = "menu_prestige_icon_freshstart"
		} )
	end
end

CoD.BarracksPrestigeAwards.PrestigeRespec = function ( self, event )
	if Engine.IsFeatureBanned( CoD.FEATURE_BAN_PRESTIGE ) then
		Engine.ExecNow( event.controller, "banCheck " .. CoD.FEATURE_BAN_PRESTIGE )
		return 
	elseif Engine.IsFeatureBanned( CoD.FEATURE_BAN_PRESTIGE_EXTRAS ) then
		Engine.ExecNow( event.controller, "banCheck " .. CoD.FEATURE_BAN_PRESTIGE_EXTRAS )
		return 
	else
		self:openPopup( "ConfirmPrestige", event.controller, {
			action = "respec_confirm",
			title = "MENU_REFUND",
			message = "MENU_PRESTIGE_REFUND_DESC",
			choiceAText = Engine.Localize( "MENU_USE_REFUND" ),
			image = "menu_prestige_icon_refund"
		} )
	end
end

CoD.BarracksPrestigeAwards.PrestigeExtraCAC = function ( self, event )
	if Engine.IsFeatureBanned( CoD.FEATURE_BAN_PRESTIGE ) then
		Engine.ExecNow( event.controller, "banCheck " .. CoD.FEATURE_BAN_PRESTIGE )
		return 
	elseif Engine.IsFeatureBanned( CoD.FEATURE_BAN_PRESTIGE_EXTRAS ) then
		Engine.ExecNow( event.controller, "banCheck " .. CoD.FEATURE_BAN_PRESTIGE_EXTRAS )
		return 
	else
		self:openPopup( "ConfirmPrestige", event.controller, {
			action = "extraCAC_confirm",
			title = "MENU_EXTRA_CAC",
			message = "MENU_PRESTIGE_EXTRACAC_DESC",
			choiceAText = Engine.Localize( "MENU_USE_EXTRACAC" ),
			image = "menu_prestige_icon_cacslot"
		} )
	end
end

CoD.BarracksPrestigeAwards.PrestigeActionComplete = function ( self, event )
	self:goBack( event.controller )
end

CoD.BarracksPrestigeAwards.AddCarousels = function ( cardCarouselList, controller )
	local cardCarousel = cardCarouselList:addCardCarousel( "" )
	CoD.Barracks.SetupCardCarouselTitleTextPosition( cardCarousel, cardCarouselList )
	local prestigeIconHeight = 110
	local prestigeIconWidth = prestigeIconHeight
	local sizeMultiplier = 1.8
	if not CoD.PrestigeFinish( controller ) then
		local respecCard = cardCarousel:addNewCard()
		CoD.Barracks.SetupCarouselCard( respecCard, Engine.Localize( "MPUI_RESPEC" ) )
		respecCard.hintText = Engine.Localize( "MENU_RESPEC_HINT" )
		respecCard:setActionEventName( "prestige_respec" )
		respecCard:setupCenterImage( "menu_prestige_icon_refund", prestigeIconWidth, prestigeIconHeight, sizeMultiplier )
	end
	if not Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) and not Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) and Engine.GetCustomClassCount( controller ) < 10 then
		local extraCACCard = cardCarousel:addNewCard()
		CoD.Barracks.SetupCarouselCard( extraCACCard, Engine.Localize( "MPUI_EXTRA_CAC" ) )
		extraCACCard.hintText = Engine.Localize( "MENU_EXTRA_CAC_HINT" )
		extraCACCard:setActionEventName( "prestige_extra_cac" )
		extraCACCard:setupCenterImage( "menu_prestige_icon_cacslot", prestigeIconWidth, prestigeIconHeight, sizeMultiplier )
	end
	local resetStatsCard = cardCarousel:addNewCard()
	CoD.Barracks.SetupCarouselCard( resetStatsCard, Engine.Localize( "MENU_FRESH_START" ) )
	resetStatsCard.hintText = Engine.Localize( "MENU_RESET_STATS_HINT" )
	resetStatsCard:setActionEventName( "prestige_reset_stats" )
	resetStatsCard:setupCenterImage( "menu_prestige_icon_freshstart", prestigeIconWidth, prestigeIconHeight, sizeMultiplier )
end

