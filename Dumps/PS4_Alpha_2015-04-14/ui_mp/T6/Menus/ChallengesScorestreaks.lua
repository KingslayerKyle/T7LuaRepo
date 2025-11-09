require( "ui_mp.T6.Menus.CommonChallengeType" )

CoD.ChallengesScorestreaks = {}
LUI.createMenu.ChallengesScorestreaks = function ( controller, userData )
	local self = CoD.Menu.New( "ChallengesScorestreaks" )
	self:addLargePopupBackground()
	self:setOwner( controller )
	self:setPreviousMenu( "Barracks" )
	self.goBack = CoD.ChallengesScorestreaks.GoBack
	self:registerEventHandler( "open_scorestreak_challenge_type", CoD.ChallengesScorestreaks.OpenChallengesType )
	self:addSelectButton()
	self:addBackButton()
	self:addTitle( Engine.ToUpper( Engine.Localize( "MPUI_SCORE_STREAKS" ) ) )
	local cardCarouselList = CoD.CardCarouselList.new( nil, controller, CoD.Barracks.ItemWidth, CoD.Barracks.ItemHeight, CoD.Barracks.HighlightedItemWidth, CoD.Barracks.HighligtedItemHeight, CoD.Barracks.HintTextParams )
	cardCarouselList:setLeftRight( true, true, 0, 0 )
	cardCarouselList:setTopBottom( true, true, CoD.textSize.Big + 10, 0 )
	self:addElement( cardCarouselList )
	CoD.ChallengesScorestreaks.AddCarousel( cardCarouselList )
	if CoD.ChallengesScorestreaks.CurrentCarouselInfo then
		cardCarouselList:setInitialCarousel( CoD.ChallengesScorestreaks.CurrentCarouselInfo.carouselIndex, CoD.ChallengesScorestreaks.CurrentCarouselInfo.cardIndex )
	end
	cardCarouselList:focusCurrentCardCarousel( controller )
	return self
end

CoD.ChallengesScorestreaks.OpenChallengesType = function ( self, event )
	CoD.ChallengesScorestreaks.CurrentCarouselInfo = CoD.CardCarousel.GetCurrentCarouselInfo( event.button )
	CoD.perController[event.controller].CommonChallengeTypeData = {
		category = event.button.category
	}
	self:openMenu( "CommonChallengeType", event.controller )
	self:close()
end

CoD.ChallengesScorestreaks.GoBack = function ( self, controller )
	CoD.ChallengesScorestreaks.CurrentCarouselInfo = nil
	CoD.Menu.goBack( self, controller )
end

CoD.ChallengesScorestreaks.AddCard = function ( cardCarousel, categoryName, category, categoryIconName, hintText )
	local card = cardCarousel:addNewCard()
	card.category = category
	card.hintText = hintText
	local iconHeight = CoD.Barracks.ItemHeight - CoD.textSize.Default
	local iconWidth = iconHeight
	local sizeMultiplier = 1.5
	CoD.Barracks.SetupCarouselCard( card, categoryName )
	card:setupCenterImage( categoryIconName, iconHeight, iconWidth, sizeMultiplier )
	card:setActionEventName( "open_scorestreak_challenge_type" )
end

CoD.ChallengesScorestreaks.AddCarousel = function ( cardCarouselList, controller, weaponSlot )
	local cardCarousel = cardCarouselList:addCardCarousel( Engine.Localize( "" ) )
	CoD.ChallengesScorestreaks.AddCard( cardCarousel, Engine.Localize( "MENU_CHALLENGE_CATEGORY_AIR" ), "air", "barrack_scorestreaks_icon", Engine.Localize( "MENU_CHALLENGE_CATEGORY_AIR_HINT" ) )
	CoD.ChallengesScorestreaks.AddCard( cardCarousel, Engine.Localize( "MENU_CHALLENGE_CATEGORY_GROUND" ), "ground", "barrack_ss_ground", Engine.Localize( "MENU_CHALLENGE_CATEGORY_GROUND_HINT" ) )
	CoD.ChallengesScorestreaks.AddCard( cardCarousel, Engine.Localize( "MENU_CHALLENGE_CATEGORY_SUPPORT" ), "support", "barrack_ss_support", Engine.Localize( "MENU_CHALLENGE_CATEGORY_SUPPORT_HINT" ) )
	CoD.ChallengesScorestreaks.AddCard( cardCarousel, Engine.Localize( "MENU_CHALLENGE_CATEGORY_RETURNFIRE" ), "returnfire", "barrack_ss_return", Engine.Localize( "MENU_CHALLENGE_CATEGORY_RETURNFIRE_HINT" ) )
end

