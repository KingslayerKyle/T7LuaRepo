require( "ui_mp.T6.Menus.OpticChallengeType" )

CoD.ChallengesOptics = {}
CoD.ChallengesOptics.IconOffset = 20
LUI.createMenu.ChallengesOptics = function ( controller, userData )
	local self = CoD.Menu.New( "ChallengesOptics" )
	self:addLargePopupBackground()
	self:setOwner( controller )
	self:setPreviousMenu( "Barracks" )
	self.goBack = CoD.ChallengesOptics.GoBack
	self:registerEventHandler( "open_challenge_type", CoD.ChallengesOptics.OpenChallengesType )
	self:addSelectButton()
	self:addBackButton()
	self:addTitle( Engine.ToUpper( Engine.Localize( "MENU_CHALLENGES_OPTICS" ) ) )
	local cardCarouselList = CoD.CardCarouselList.new( nil, controller, CoD.Barracks.ItemWidth, CoD.Barracks.ItemHeight, CoD.Barracks.HighlightedItemWidth, CoD.Barracks.HighligtedItemHeight, CoD.Barracks.HintTextParams )
	cardCarouselList:setLeftRight( true, true, 0, 0 )
	cardCarouselList:setTopBottom( true, true, CoD.textSize.Big + 10, 0 )
	self:addElement( cardCarouselList )
	CoD.ChallengesOptics.AddCarousel( cardCarouselList )
	if CoD.ChallengesOptics.CurrentCarouselInfo then
		cardCarouselList:setInitialCarousel( CoD.ChallengesOptics.CurrentCarouselInfo.carouselIndex, CoD.ChallengesOptics.CurrentCarouselInfo.cardIndex )
	end
	cardCarouselList:focusCurrentCardCarousel( controller )
	return self
end

CoD.ChallengesOptics.OpenChallengesType = function ( self, event )
	CoD.ChallengesOptics.CurrentCarouselInfo = CoD.CardCarousel.GetCurrentCarouselInfo( event.button )
	CoD.perController[event.controller].OpticChallengeTypeData = {
		attachmentIndex = event.button.attachmentIndex,
		attachmentRef = event.button.attachmentRef
	}
	self:openMenu( "OpticChallengeType", event.controller )
	self:close()
end

CoD.ChallengesOptics.GoBack = function ( self, controller )
	CoD.ChallengesOptics.CurrentCarouselInfo = nil
	CoD.Menu.goBack( self, controller )
end

CoD.ChallengesOptics.AddCards = function ( cardCarousel )
	for index, currAttachmentRef in ipairs( CoD.CACUtility.attachmentReferences ) do
		for i, attachRefWithCustReticle in ipairs( CoD.CACUtility.attachmentsWithCustReticle ) do
			if currAttachmentRef == attachRefWithCustReticle then
				local card = cardCarousel:addNewCard()
				card.category = category
				card.attachmentIndex = index - 1
				card.attachmentRef = currAttachmentRef
				card.hintText = Engine.Localize( "MENU_CHALLENGES_OPTICS_TYPES_HINT", Engine.GetAttachmentNameByIndex( card.attachmentIndex ) )
				local iconHeight = CoD.Barracks.ItemHeight - CoD.textSize.Default - CoD.ChallengesOptics.IconOffset
				local iconWidth = iconHeight
				local sizeMultiplier = 1.5
				CoD.Barracks.SetupCarouselCard( card, Engine.Localize( Engine.GetAttachmentNameByIndex( card.attachmentIndex ) ) )
				card:setupCenterImage( Engine.GetAttachmentImageByIndex( card.attachmentIndex ), iconWidth, iconHeight, sizeMultiplier )
				card:setActionEventName( "open_challenge_type" )
			end
		end
	end
end

CoD.ChallengesOptics.AddCarousel = function ( cardCarouselList, controller )
	local cardCarousel = cardCarouselList:addCardCarousel( Engine.Localize( "" ) )
	CoD.ChallengesOptics.AddCards( cardCarousel )
end

