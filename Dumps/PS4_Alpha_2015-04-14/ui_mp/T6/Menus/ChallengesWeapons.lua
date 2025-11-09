require( "ui_mp.T6.Menus.WeaponChallengeType" )

CoD.ChallengesWeapons = {}
LUI.createMenu.ChallengesWeapons = function ( controller )
	local weaponCarouselMenu = CoD.Menu.New( "ChallengesWeapons" )
	weaponCarouselMenu:addLargePopupBackground()
	weaponCarouselMenu:setOwner( controller )
	weaponCarouselMenu:setPreviousMenu( "Barracks" )
	weaponCarouselMenu.goBack = CoD.ChallengesWeapons.GoBack
	weaponCarouselMenu:registerEventHandler( "card_gain_focus", CoD.ChallengesWeapons.CardGainFocus )
	weaponCarouselMenu:registerEventHandler( "card_lose_focus", CoD.ChallengesWeapons.CardLoseFocus )
	weaponCarouselMenu:registerEventHandler( "open_weapon_challenges_type", CoD.ChallengesWeapons.OpenChallengesType )
	weaponCarouselMenu:addSelectButton()
	weaponCarouselMenu:addBackButton()
	local weaponSlot = CoD.perController[controller].weaponSlot
	local titleText = "MENU_CHALLENGES_PRIMARY_WEAPON_UNLOCKS"
	if weaponSlot == "secondary" then
		titleText = "MENU_CHALLENGES_SECONDARY_WEAPON_UNLOCKS"
	end
	weaponCarouselMenu:addTitle( Engine.Localize( titleText ) )
	local top = CoD.textSize.Big + 10
	local cardCarouselList = CoD.CardCarouselList.new( nil, controller, CoD.Barracks.ItemWidth, CoD.Barracks.ItemHeight, CoD.Barracks.HighlightedItemWidth, CoD.Barracks.HighligtedItemHeight, CoD.Barracks.HintTextParams )
	cardCarouselList:setLeftRight( true, true, 0, 0 )
	cardCarouselList:setTopBottom( true, true, top, -CoD.ButtonPrompt.Height )
	weaponCarouselMenu:addElement( cardCarouselList )
	cardCarouselList.popup = weaponCarouselMenu
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
	if weaponSlot ~= nil then
		CoD.ChallengesWeapons.AddCarousels( cardCarouselList, controller, weaponSlot )
		weaponCarouselMenu.weaponSlot = weaponSlot
	end
	if CoD.ChallengesWeapons.CurrentCarouselInfo then
		cardCarouselList:setInitialCarousel( CoD.ChallengesWeapons.CurrentCarouselInfo.carouselIndex, CoD.ChallengesWeapons.CurrentCarouselInfo.cardIndex )
	end
	local lineTop = top + 97
	local line = LUI.UIImage.new()
	line:setLeftRight( true, false, 0, CoD.Menu.Width / 2 - 85 )
	line:setTopBottom( true, false, lineTop, lineTop + 1 )
	line:setAlpha( 0.05 )
	weaponCarouselMenu:addElement( line )
	cardCarouselList:focusCurrentCardCarousel( controller )
	return weaponCarouselMenu
end

CoD.ChallengesWeapons.OpenChallengesType = function ( self, event )
	CoD.ChallengesWeapons.CurrentCarouselInfo = CoD.CardCarousel.GetCurrentCarouselInfo( event.button )
	CoD.perController[event.controller].weaponIndex = event.button.weaponItemIndex
	self:openMenu( "WeaponChallengeType", event.controller )
	self:close()
end

CoD.ChallengesWeapons.GoBack = function ( self, controller )
	CoD.ChallengesWeapons.CurrentCarouselInfo = nil
	CoD.Menu.goBack( self, controller )
end

CoD.ChallengesWeapons.CardGainFocus = function ( self, event )
	local hintText = nil
	if event.card.isLocked then
		hintText = CoD.GetUnlockStringForItemIndex( event.controller, event.card.weaponItemIndex )
		self:removeSelectButton()
	elseif Engine.IsItemPurchased( event.controller, event.card.weaponItemIndex ) == 0 then
		hintText = Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_UNLOCK" )
		self:removeSelectButton()
	else
		hintText = Engine.Localize( "MENU_CHALLENGES_WEAPON_HINTTEXT_AVAILABLE", Engine.GetItemName( event.card.weaponItemIndex ) )
		self:addSelectButtonWithPrestigeUnlock()
	end
	self:dispatchEventToChildren( {
		name = "hint_text_fade_in",
		hintText = hintText
	} )
end

CoD.ChallengesWeapons.CardLoseFocus = function ( self, event )
	self:dispatchEventToChildren( {
		name = "hint_text_fade_out"
	} )
end

CoD.ChallengesWeapons.AddCarousels = function ( cardCarouselList, controller, weaponSlot )
	if weaponSlot == "primary" then
		CoD.ChallengesWeapons.AddWeaponGroupCarousel( cardCarouselList, controller, "weapon_smg" )
		CoD.ChallengesWeapons.AddWeaponGroupCarousel( cardCarouselList, controller, "weapon_assault" )
		CoD.ChallengesWeapons.AddWeaponGroupCarousel( cardCarouselList, controller, "weapon_cqb" )
		CoD.ChallengesWeapons.AddWeaponGroupCarousel( cardCarouselList, controller, "weapon_lmg" )
		CoD.ChallengesWeapons.AddWeaponGroupCarousel( cardCarouselList, controller, "weapon_sniper" )
		CoD.ChallengesWeapons.AddWeaponGroupCarousel( cardCarouselList, controller, "weapon_special" )
	else
		CoD.ChallengesWeapons.AddWeaponGroupCarousel( cardCarouselList, controller, "weapon_pistol" )
		CoD.ChallengesWeapons.AddWeaponGroupCarousel( cardCarouselList, controller, "weapon_launcher" )
		CoD.ChallengesWeapons.AddWeaponGroupCarousel( cardCarouselList, controller, "weapon_special" )
	end
end

CoD.ChallengesWeapons.AddWeaponGroupCarousel = function ( cardCarouselList, controller, groupName )
	local cardCarousel = cardCarouselList:addCardCarousel( Engine.Localize( "MPUI_" .. groupName .. "_CAPS" ) )
	local weapons = CoD.GetUnlockablesByGroupName( groupName )
	local weaponSlot = CoD.perController[controller].weaponSlot
	local lockedMaterial = RegisterMaterial( CoD.CACUtility.LockImageBigMaterial )
	CoD.Barracks.SetupCardCarouselTitleTextPosition( cardCarousel, cardCarouselList )
	for index, weaponItemIndex in ipairs( weapons ) do
		local loadoutSlot = Engine.GetLoadoutSlotForItem( weaponItemIndex )
		if loadoutSlot == weaponSlot then
			local card = cardCarousel:addNewCard()
			card.weaponItemIndex = weaponItemIndex
			card.iconMaterial = RegisterMaterial( Engine.GetItemImage( weaponItemIndex ) .. "_big" )
			card.icon = LUI.UIImage.new()
			card.icon:setLeftRight( true, true, 10, -10 )
			card.icon:setTopBottom( true, true, 20, -30 )
			card.icon:setRGB( 1, 1, 1 )
			card.icon:setImage( card.iconMaterial )
			card.title = LUI.UIText.new()
			card.title:setLeftRight( true, true, 5, 0 )
			card.title:setTopBottom( false, true, -CoD.textSize.Default, 0 )
			card.title:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
			card.title:setAlignment( LUI.Alignment.Left )
			card.title:setFont( CoD.fonts.Default )
			card.title:setText( Engine.Localize( Engine.GetItemName( weaponItemIndex ) ) )
			card.title:registerAnimationState( "button_over", {
				red = CoD.BOIIOrange.r,
				green = CoD.BOIIOrange.g,
				blue = CoD.BOIIOrange.b
			} )
			LUI.UIButton.SetupElement( card.title )
			card:addElement( card.title )
			if Engine.IsItemLocked( controller, weaponItemIndex ) then
				card.lockedIcon = CoD.CAC.SetLockIcon( card, 64, lockedMaterial )
				card.isLocked = true
				card.icon:setAlpha( 0.25 )
				card.title:registerAnimationState( "button_over", {
					red = CoD.offWhite.r,
					green = CoD.offWhite.g,
					blue = CoD.offWhite.b
				} )
			elseif not Engine.IsItemPurchased( controller, weaponItemIndex ) then
				card.lockedIcon = CoD.CAC.SetLockIcon( card, 64, lockedMaterial )
				card.icon:setAlpha( 0.25 )
				card.title:registerAnimationState( "button_over", {
					red = CoD.offWhite.r,
					green = CoD.offWhite.g,
					blue = CoD.offWhite.b
				} )
			else
				card:setActionEventName( "open_weapon_challenges_type" )
				card:addElement( card.icon )
			end
			if card.border then
				card.border:close()
			end
			if card.highlightedborder then
				card.highlightedborder:close()
			end
			CoD.ContentGridButton.SetupButtonImages( card, CoD.GrenadeGridButton.glowBackColor, CoD.GrenadeGridButton.glowFrontColor )
		end
	end
end

