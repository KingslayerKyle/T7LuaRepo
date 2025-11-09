require( "ui_mp.T6.Menus.CommonChallengeType" )

CoD.ChallengesAssignments = {}
LUI.createMenu.ChallengesAssignments = function ( controller, userData )
	local self = CoD.Menu.New( "ChallengesAssignments" )
	self:addLargePopupBackground()
	self:setOwner( controller )
	self:setPreviousMenu( "Barracks" )
	self.goBack = CoD.ChallengesAssignments.GoBack
	self:registerEventHandler( "open_challenge_type", CoD.ChallengesAssignments.OpenChallengesType )
	self:addSelectButton()
	self:addBackButton()
	self:addTitle( Engine.ToUpper( Engine.Localize( "MENU_CHALLENGES_ASSIGNMENTS" ) ) )
	local cardCarouselList = CoD.CardCarouselList.new( nil, controller, CoD.Barracks.ItemWidth, CoD.Barracks.ItemHeight, CoD.Barracks.HighlightedItemWidth, CoD.Barracks.HighligtedItemHeight, CoD.Barracks.HintTextParams )
	cardCarouselList:setLeftRight( true, true, 0, 0 )
	cardCarouselList:setTopBottom( true, true, CoD.textSize.Big + 10, 0 )
	self:addElement( cardCarouselList )
	CoD.ChallengesAssignments.AddCarousel( cardCarouselList )
	if CoD.ChallengesAssignments.CurrentCarouselInfo then
		cardCarouselList:setInitialCarousel( CoD.ChallengesAssignments.CurrentCarouselInfo.carouselIndex, CoD.ChallengesAssignments.CurrentCarouselInfo.cardIndex )
	end
	cardCarouselList:focusCurrentCardCarousel( controller )
	return self
end

CoD.ChallengesAssignments.OpenChallengesType = function ( self, event )
	CoD.ChallengesAssignments.CurrentCarouselInfo = CoD.CardCarousel.GetCurrentCarouselInfo( event.button )
	CoD.perController[event.controller].CommonChallengeTypeData = {
		category = event.button.category
	}
	self:openMenu( "CommonChallengeType", event.controller )
	self:close()
end

CoD.ChallengesAssignments.GoBack = function ( self, controller )
	CoD.ChallengesAssignments.CurrentCarouselInfo = nil
	CoD.Menu.goBack( self, controller )
end

CoD.ChallengesAssignments.AddCard = function ( cardCarousel, categoryName, category, centerImageName, hintText )
	local card = cardCarousel:addNewCard()
	card.category = category
	card.hintText = hintText
	local iconHeight = CoD.Barracks.ItemHeight - CoD.textSize.Default
	local iconWidth = iconHeight
	local sizeMultiplier = 1.5
	CoD.Barracks.SetupCarouselCard( card, categoryName )
	card:setupCenterImage( centerImageName, iconHeight, iconWidth, sizeMultiplier )
	card:setActionEventName( "open_challenge_type" )
end

CoD.ChallengesAssignments.AddCarousel = function ( cardCarouselList, controller, weaponSlot )
	local cardCarousel = cardCarouselList:addCardCarousel( Engine.Localize( "" ) )
	CoD.ChallengesAssignments.AddCard( cardCarousel, Engine.Localize( "MENU_CHALLENGE_CATEGORY_BOOTCAMP" ), "bootcamp", "barrack_ass_bootcamp", Engine.Localize( "MENU_CHALLENGE_CATEGORY_BOOTCAMP_HINT" ) )
	CoD.ChallengesAssignments.AddCard( cardCarousel, Engine.Localize( "MENU_CHALLENGE_CATEGORY_KILLER" ), "killer", "barrack_ass_killer", Engine.Localize( "MENU_CHALLENGE_CATEGORY_KILLER_HINT" ) )
	CoD.ChallengesAssignments.AddCard( cardCarousel, Engine.Localize( "MENU_CHALLENGE_CATEGORY_HUMILIATION" ), "humiliation", "barrack_ass_humiliation", Engine.Localize( "MENU_CHALLENGE_CATEGORY_HUMILIATION_HINT" ) )
	CoD.ChallengesAssignments.AddCard( cardCarousel, Engine.Localize( "MENU_CHALLENGE_CATEGORY_FIELDSPECIALIST" ), "fieldspecialist", "barrack_ass_fieldspecial", Engine.Localize( "MENU_CHALLENGE_CATEGORY_FIELDSPECIALIST_HINT" ) )
	CoD.ChallengesAssignments.AddCard( cardCarousel, Engine.Localize( "MENU_CHALLENGE_CATEGORY_PRECISION" ), "precision", "barrack_ass_precision", Engine.Localize( "MENU_CHALLENGE_CATEGORY_PRECISION_HINT" ) )
end

