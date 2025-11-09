require( "ui_mp.T6.Menus.CommonChallengeType" )

CoD.ChallengesPrestige = {}
LUI.createMenu.ChallengesPrestige = function ( controller, userData )
	local self = CoD.Menu.New( "ChallengesPrestige" )
	self:addLargePopupBackground()
	self:setOwner( controller )
	self:setPreviousMenu( "Barracks" )
	self.goBack = CoD.ChallengesPrestige.GoBack
	self:registerEventHandler( "open_challenge_type", CoD.ChallengesPrestige.OpenChallengesType )
	self:addSelectButton()
	self:addBackButton()
	self:addTitle( Engine.ToUpper( Engine.Localize( "MPUI_PRESTIGE" ) ) )
	local cardCarouselList = CoD.CardCarouselList.new( nil, controller, CoD.Barracks.ItemWidth, CoD.Barracks.ItemHeight, CoD.Barracks.HighlightedItemWidth, CoD.Barracks.HighligtedItemHeight, CoD.Barracks.HintTextParams )
	cardCarouselList:setLeftRight( true, true, 0, 0 )
	cardCarouselList:setTopBottom( true, true, CoD.textSize.Big + 10, 0 )
	self:addElement( cardCarouselList )
	CoD.ChallengesPrestige.AddCarousel( cardCarouselList )
	if CoD.ChallengesPrestige.CurrentCarouselInfo then
		cardCarouselList:setInitialCarousel( CoD.ChallengesPrestige.CurrentCarouselInfo.carouselIndex, CoD.ChallengesPrestige.CurrentCarouselInfo.cardIndex )
	end
	cardCarouselList:focusCurrentCardCarousel( controller )
	return self
end

CoD.ChallengesPrestige.OpenChallengesType = function ( self, event )
	CoD.ChallengesPrestige.CurrentCarouselInfo = CoD.CardCarousel.GetCurrentCarouselInfo( event.button )
	CoD.perController[event.controller].CommonChallengeTypeData = {
		category = event.button.category
	}
	self:openMenu( "CommonChallengeType", event.controller )
	self:close()
end

CoD.ChallengesPrestige.GoBack = function ( self, controller )
	CoD.ChallengesPrestige.CurrentCarouselInfo = nil
	CoD.Menu.goBack( self, controller )
end

CoD.ChallengesPrestige.AddCard = function ( cardCarousel, categoryName, category, categoryIconName, hintText )
	local card = cardCarousel:addNewCard()
	card.hintText = hintText
	card.category = category
	local iconHeight = CoD.Barracks.ItemHeight - CoD.textSize.Default
	local iconWidth = iconHeight
	local sizeMultiplier = 1.5
	CoD.Barracks.SetupCarouselCard( card, categoryName )
	card:setupCenterImage( categoryIconName, iconHeight, iconWidth, sizeMultiplier )
	card:setActionEventName( "open_challenge_type" )
end

CoD.ChallengesPrestige.AddCarousel = function ( cardCarouselList, controller, weaponSlot )
	local cardCarousel = cardCarouselList:addCardCarousel( Engine.Localize( "" ) )
	CoD.ChallengesPrestige.AddCard( cardCarousel, Engine.Localize( "MENU_CHALLENGE_CATEGORY_SPECIALOPTICS" ), "specialoptics", "barrack_prestige_specialoptics", Engine.Localize( "MENU_CHALLENGE_CATEGORY_SPECIALOPTICS_HINT" ) )
	CoD.ChallengesPrestige.AddCard( cardCarousel, Engine.Localize( "MENU_CHALLENGE_CATEGORY_COMBATEFFICIENCY" ), "combatefficiency", "barrack_prestige_combat_eff", Engine.Localize( "MENU_CHALLENGE_CATEGORY_COMBATEFFICIENCY_HINT" ) )
	CoD.ChallengesPrestige.AddCard( cardCarousel, Engine.Localize( "MENU_CHALLENGE_CATEGORY_EQUIPMENT" ), "equipment", "barrack_prestige_equip", Engine.Localize( "MENU_CHALLENGE_CATEGORY_EQUIPMENT_HINT" ) )
	CoD.ChallengesPrestige.AddCard( cardCarousel, Engine.Localize( "MENU_CHALLENGE_CATEGORY_PERKS" ), "perks", "barrack_prestige_perks", Engine.Localize( "MENU_CHALLENGE_CATEGORY_PERKS_HINT" ) )
	CoD.ChallengesPrestige.AddCard( cardCarousel, Engine.Localize( "MENU_CHALLENGE_CATEGORY_WILDCARDS" ), "wildcards", "barrack_prestige_wc", Engine.Localize( "MENU_CHALLENGE_CATEGORY_WILDCARDS_HINT" ) )
end

