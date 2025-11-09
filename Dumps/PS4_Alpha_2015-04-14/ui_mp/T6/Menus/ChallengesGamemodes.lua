require( "ui_mp.T6.Menus.CommonChallengeType" )

CoD.ChallengesGamemodes = {}
LUI.createMenu.ChallengesGamemodes = function ( controller, userData )
	local self = CoD.Menu.New( "ChallengesGamemodes" )
	self:addLargePopupBackground()
	self:setOwner( controller )
	self:setPreviousMenu( "Barracks" )
	self.goBack = CoD.ChallengesGamemodes.GoBack
	self:registerEventHandler( "open_challenge_type", CoD.ChallengesGamemodes.OpenChallengesType )
	self:addSelectButton()
	self:addBackButton()
	self:addTitle( Engine.ToUpper( Engine.Localize( "MENU_CHALLENGES_GAME_MODES" ) ) )
	local cardCarouselList = CoD.CardCarouselList.new( nil, controller, CoD.Barracks.ItemWidth, CoD.Barracks.ItemHeight, CoD.Barracks.HighlightedItemWidth, CoD.Barracks.HighligtedItemHeight, CoD.Barracks.HintTextParams )
	cardCarouselList:setLeftRight( true, true, 0, 0 )
	cardCarouselList:setTopBottom( true, true, CoD.textSize.Big + 10, 0 )
	self:addElement( cardCarouselList )
	CoD.ChallengesGamemodes.AddCarousel( cardCarouselList )
	if CoD.ChallengesGamemodes.CurrentCarouselInfo then
		cardCarouselList:setInitialCarousel( CoD.ChallengesGamemodes.CurrentCarouselInfo.carouselIndex, CoD.ChallengesGamemodes.CurrentCarouselInfo.cardIndex )
	end
	cardCarouselList:focusCurrentCardCarousel( controller )
	return self
end

CoD.ChallengesGamemodes.OpenChallengesType = function ( self, event )
	CoD.ChallengesGamemodes.CurrentCarouselInfo = CoD.CardCarousel.GetCurrentCarouselInfo( event.button )
	CoD.perController[event.controller].CommonChallengeTypeData = {
		category = event.button.category,
		titleText = event.button.titleText,
		gamemodeName = event.button.titleText
	}
	self:openMenu( "CommonChallengeType", event.controller )
	self:close()
end

CoD.ChallengesGamemodes.GoBack = function ( self, controller )
	CoD.ChallengesGamemodes.CurrentCarouselInfo = nil
	CoD.Menu.goBack( self, controller )
end

CoD.ChallengesGamemodes.AddCard = function ( cardCarousel, categoryName, category, categoryImageName )
	local card = cardCarousel:addNewCard()
	card.category = category
	card.hintText = Engine.Localize( "MENU_CHALLENGES_TYPE_GAMEMODE_HINT", categoryName )
	local iconHeight = CoD.Barracks.ItemHeight - CoD.textSize.Default
	local iconWidth = iconHeight
	local sizeMultiplier = 1.5
	CoD.Barracks.SetupCarouselCard( card, categoryName )
	card:setupCenterImage( categoryImageName, iconHeight, iconWidth, sizeMultiplier )
	card:setActionEventName( "open_challenge_type" )
end

CoD.ChallengesGamemodes.AddCarousel = function ( cardCarouselList, controller, weaponSlot )
	local cardCarousel = cardCarouselList:addCardCarousel( Engine.Localize( "" ) )
	CoD.ChallengesGamemodes.AddCard( cardCarousel, Engine.Localize( "CHALLENGE_TYPE_TDM" ), "tdm", "playlist_tdm" )
	CoD.ChallengesGamemodes.AddCard( cardCarousel, Engine.Localize( "CHALLENGE_TYPE_DM" ), "dm", "playlist_ffa" )
	CoD.ChallengesGamemodes.AddCard( cardCarousel, Engine.Localize( "CHALLENGE_TYPE_DOM" ), "dom", "playlist_domination" )
	CoD.ChallengesGamemodes.AddCard( cardCarousel, Engine.Localize( "CHALLENGE_TYPE_SD" ), "sd", "playlist_search_destroy" )
	CoD.ChallengesGamemodes.AddCard( cardCarousel, Engine.Localize( "CHALLENGE_TYPE_SR" ), "sr", "playlist_search_rescue" )
	CoD.ChallengesGamemodes.AddCard( cardCarousel, Engine.Localize( "CHALLENGE_TYPE_CTF" ), "ctf", "playlist_ctf" )
	CoD.ChallengesGamemodes.AddCard( cardCarousel, Engine.Localize( "CHALLENGE_TYPE_HQ" ), "hq", "playlist_headquarters" )
	CoD.ChallengesGamemodes.AddCard( cardCarousel, Engine.Localize( "CHALLENGE_TYPE_DEM" ), "dem", "playlist_demolition" )
	CoD.ChallengesGamemodes.AddCard( cardCarousel, Engine.Localize( "CHALLENGE_TYPE_KOTH" ), "koth", "playlist_koth" )
	CoD.ChallengesGamemodes.AddCard( cardCarousel, Engine.Localize( "MPUI_CONF" ), "conf", "playlist_kill_confirm" )
	CoD.ChallengesGamemodes.AddCard( cardCarousel, Engine.Localize( "CHALLENGE_TYPE_SHRP" ), "shrp", "playlist_sharpshooter" )
	CoD.ChallengesGamemodes.AddCard( cardCarousel, Engine.Localize( "CHALLENGE_TYPE_SAS" ), "sas", "playlist_sticks_and_stones" )
	CoD.ChallengesGamemodes.AddCard( cardCarousel, Engine.Localize( "CHALLENGE_TYPE_OIC" ), "oic", "playlist_one_chamber" )
	CoD.ChallengesGamemodes.AddCard( cardCarousel, Engine.Localize( "CHALLENGE_TYPE_GUN" ), "gun", "playlist_gungame" )
end

