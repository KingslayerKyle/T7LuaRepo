require( "ui_mp.T6.Menus.CommonChallengeType" )

CoD.ChallengesCareer = {}
LUI.createMenu.ChallengesCareer = function ( controller, userData )
	local self = CoD.Menu.New( "ChallengesCareer" )
	self:addLargePopupBackground()
	self:setOwner( controller )
	self:setPreviousMenu( "Barracks" )
	self.goBack = CoD.ChallengesCareer.GoBack
	self:registerEventHandler( "open_challenge_type", CoD.ChallengesCareer.OpenChallengesType )
	self:addSelectButton()
	self:addBackButton()
	self:addTitle( Engine.Localize( "MENU_CHALLENGES_CAREER" ) )
	local cardCarouselList = CoD.CardCarouselList.new( nil, controller, CoD.Barracks.ItemWidth, CoD.Barracks.ItemHeight, CoD.Barracks.HighlightedItemWidth, CoD.Barracks.HighligtedItemHeight, CoD.Barracks.HintTextParams )
	cardCarouselList:setLeftRight( true, true, 0, 0 )
	cardCarouselList:setTopBottom( true, true, CoD.textSize.Big + 10, 0 )
	self:addElement( cardCarouselList )
	CoD.ChallengesCareer.AddCarousel( cardCarouselList )
	if CoD.ChallengesCareer.CurrentCarouselInfo then
		cardCarouselList:setInitialCarousel( CoD.ChallengesCareer.CurrentCarouselInfo.carouselIndex, CoD.ChallengesCareer.CurrentCarouselInfo.cardIndex )
	end
	cardCarouselList:focusCurrentCardCarousel( controller )
	return self
end

CoD.ChallengesCareer.OpenChallengesType = function ( self, event )
	CoD.ChallengesCareer.CurrentCarouselInfo = CoD.CardCarousel.GetCurrentCarouselInfo( event.button )
	CoD.perController[event.controller].CommonChallengeTypeData = {
		category = event.button.category
	}
	self:openMenu( "CommonChallengeType", event.controller )
	self:close()
end

CoD.ChallengesCareer.GoBack = function ( self, controller )
	CoD.ChallengesCareer.CurrentCarouselInfo = nil
	CoD.Menu.goBack( self, controller )
end

CoD.ChallengesCareer.AddCard = function ( cardCarousel, categoryName, category, categoryIconName, hintText )
	local card = cardCarousel:addNewCard()
	card.category = category
	card.hintText = hintText
	local iconHeight = CoD.Barracks.ItemHeight - CoD.textSize.Default
	local iconWidth = iconHeight
	local sizeMultiplier = 1.5
	CoD.Barracks.SetupCarouselCard( card, categoryName )
	card:setupCenterImage( categoryIconName, iconHeight, iconWidth, sizeMultiplier )
	card:setActionEventName( "open_challenge_type" )
end

CoD.ChallengesCareer.AddCarousel = function ( cardCarouselList, controller, weaponSlot )
	local cardCarousel = cardCarouselList:addCardCarousel( Engine.Localize( "" ) )
	CoD.ChallengesCareer.AddCard( cardCarousel, Engine.Localize( "MENU_CHALLENGE_CATEGORY_TOTALMASTERY" ), "totalmastery", "barrack_career_mastery", Engine.Localize( "MENU_CHALLENGE_CATEGORY_TOTALMASTERY_HINT" ) )
	CoD.ChallengesCareer.AddCard( cardCarousel, Engine.Localize( "MENU_CHALLENGE_CATEGORY_OPERATIONS" ), "operations", "barrack_career_operations", Engine.Localize( "MENU_CHALLENGE_CATEGORY_OPERATIONS_HINT" ) )
	CoD.ChallengesCareer.AddCard( cardCarousel, Engine.Localize( "MENU_CHALLENGE_CATEGORY_COMBAT" ), "combat", "barrack_career_precision", Engine.Localize( "MENU_CHALLENGE_CATEGORY_COMBAT_HINT" ) )
end

