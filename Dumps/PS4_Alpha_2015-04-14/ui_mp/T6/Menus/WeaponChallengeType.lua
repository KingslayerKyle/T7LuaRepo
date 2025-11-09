require( "ui_mp.T6.Menus.WeaponAttachmentChallenges" )
require( "ui_mp.T6.Menus.WeaponCamoChallenges" )
require( "ui_mp.T6.Menus.WeaponMasteryChallenges" )

CoD.WeaponChallengeType = {}
LUI.createMenu.WeaponChallengeType = function ( controller )
	local weaponChallengeTypeMenu = CoD.Menu.New( "WeaponChallengeType" )
	weaponChallengeTypeMenu:addLargePopupBackground()
	weaponChallengeTypeMenu:setOwner( controller )
	weaponChallengeTypeMenu:setPreviousMenu( "ChallengesWeapons" )
	weaponChallengeTypeMenu.goBack = CoD.WeaponChallengeType.GoBack
	weaponChallengeTypeMenu:registerEventHandler( "open_weapon_attachments_challenges", CoD.WeaponChallengeType.OpenAttachmentChallenges )
	weaponChallengeTypeMenu:registerEventHandler( "open_weapon_camo_challenges", CoD.WeaponChallengeType.OpenCamoChallenges )
	weaponChallengeTypeMenu:registerEventHandler( "open_weapon_mastery_challenges", CoD.WeaponChallengeType.OpenMasteryChallenges )
	weaponChallengeTypeMenu:addSelectButton()
	weaponChallengeTypeMenu:addBackButton()
	local weaponIndex = CoD.perController[controller].weaponIndex
	local weaponSlot = CoD.perController[controller].weaponSlot
	local titleText = ""
	if weaponIndex ~= nil then
		titleText = Engine.ToUpper( Engine.Localize( "MENU_CHALLENGES_WEAPON_CHALLENGE_TYPE", Engine.GetItemName( weaponIndex ) ) )
	end
	weaponChallengeTypeMenu:addTitle( titleText )
	local cardCarouselList = CoD.CardCarouselList.new( nil, controller, CoD.Barracks.ItemWidth, CoD.Barracks.ItemHeight, CoD.Barracks.HighlightedItemWidth, CoD.Barracks.HighligtedItemHeight, CoD.Barracks.HintTextParams )
	cardCarouselList:setLeftRight( true, true, 0, 0 )
	cardCarouselList:setTopBottom( true, true, CoD.textSize.Big + 10, 0 )
	weaponChallengeTypeMenu:addElement( cardCarouselList )
	cardCarouselList.popup = weaponChallengeTypeMenu
	if weaponIndex ~= nil and weaponSlot ~= nil then
		CoD.WeaponChallengeType.AddCarousels( cardCarouselList, controller, weaponSlot, weaponIndex )
	end
	if CoD.WeaponChallengeType.CurrentCarouselInfo then
		cardCarouselList:setInitialCarousel( CoD.WeaponChallengeType.CurrentCarouselInfo.carouselIndex, CoD.WeaponChallengeType.CurrentCarouselInfo.cardIndex )
	end
	cardCarouselList:focusCurrentCardCarousel( controller )
	return weaponChallengeTypeMenu
end

CoD.WeaponChallengeType.OpenAttachmentChallenges = function ( self, event )
	CoD.WeaponChallengeType.CurrentCarouselInfo = CoD.CardCarousel.GetCurrentCarouselInfo( event.button )
	self:openMenu( "WeaponAttachmentChallenges", event.controller )
	self:close()
end

CoD.WeaponChallengeType.OpenCamoChallenges = function ( self, event )
	CoD.WeaponChallengeType.CurrentCarouselInfo = CoD.CardCarousel.GetCurrentCarouselInfo( event.button )
	self:openMenu( "WeaponCamoChallenges", event.controller )
	self:close()
end

CoD.WeaponChallengeType.OpenMasteryChallenges = function ( self, event )
	CoD.WeaponChallengeType.CurrentCarouselInfo = CoD.CardCarousel.GetCurrentCarouselInfo( event.button )
	self:openMenu( "WeaponMasteryChallenges", event.controller )
	self:close()
end

CoD.WeaponChallengeType.GoBack = function ( self, controller )
	CoD.WeaponChallengeType.CurrentCarouselInfo = nil
	CoD.Menu.goBack( self, controller )
end

CoD.WeaponChallengeType.AddCard = function ( cardCarousel, cardBottomTitle, weaponSlot, weaponItemIndex, actionEvent, hintText )
	local card = cardCarousel:addNewCard()
	card.hintText = hintText
	card.weaponItemIndex = weaponItemIndex
	card.weaponSlot = weaponSlot
	card.iconMaterial = RegisterMaterial( Engine.GetItemImage( weaponItemIndex ) .. "_big" )
	card.icon = LUI.UIImage.new()
	card.icon:setLeftRight( true, true, 10, -10 )
	card.icon:setTopBottom( true, true, 20, -30 )
	card.icon:setRGB( 1, 1, 1 )
	card.icon:setImage( card.iconMaterial )
	card:addElement( card.icon )
	card.title = LUI.UIText.new()
	card.title:setLeftRight( true, true, 5, 0 )
	card.title:setTopBottom( false, true, -CoD.textSize.Default, 0 )
	card.title:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	card.title:setAlignment( LUI.Alignment.Left )
	card.title:setFont( CoD.fonts.Default )
	card.title:setText( cardBottomTitle )
	card.title:registerAnimationState( "button_over", {
		red = CoD.BOIIOrange.r,
		green = CoD.BOIIOrange.g,
		blue = CoD.BOIIOrange.b
	} )
	LUI.UIButton.SetupElement( card.title )
	card:addElement( card.title )
	card:setActionEventName( actionEvent )
	if card.border then
		card.border:close()
	end
	if card.highlightedborder then
		card.highlightedborder:close()
	end
	CoD.ContentGridButton.SetupButtonImages( card, CoD.GrenadeGridButton.glowBackColor, CoD.GrenadeGridButton.glowFrontColor )
end

CoD.WeaponChallengeType.AddCarousels = function ( cardCarouselList, controller, weaponSlot, weaponItemIndex )
	local cardCarousel = cardCarouselList:addCardCarousel( "" )
	local numAttachments = Engine.GetNumAttachments( weaponItemIndex ) - 1
	if numAttachments < 0 then
		numAttachments = 0
	end
	if numAttachments > 0 then
		CoD.WeaponChallengeType.AddCard( cardCarousel, Engine.Localize( "MPUI_ATTACHMENTS" ), weaponSlot, weaponItemIndex, "open_weapon_attachments_challenges", Engine.Localize( "MENU_CHALLENGES_ATTACHMENTS_HINT", Engine.GetItemName( weaponItemIndex ) ) )
	end
	CoD.WeaponChallengeType.AddCard( cardCarousel, Engine.Localize( "MPUI_CAMO" ), weaponSlot, weaponItemIndex, "open_weapon_camo_challenges", Engine.Localize( "MENU_CHALLENGES_CAMO_HINT", Engine.GetItemName( weaponItemIndex ) ) )
	CoD.WeaponChallengeType.AddCard( cardCarousel, Engine.Localize( "MENU_CHALLENGES_WEAPON_MASTERY", Engine.GetItemName( weaponItemIndex ) ), weaponSlot, weaponItemIndex, "open_weapon_mastery_challenges", Engine.Localize( "MENU_CHALLENGES_WEAPON_MASTERY_HINT", Engine.GetItemName( weaponItemIndex ) ) )
end

