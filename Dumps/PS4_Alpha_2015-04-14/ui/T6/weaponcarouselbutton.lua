require( "ui.T6.Border" )

CoD.WeaponCarouselButton = {}
CoD.WeaponCarouselButton.BracketAnimTime = 0
CoD.WeaponCarouselButton.LeftEdge_Default = 10
CoD.WeaponCarouselButton.LeftEdge_Highlight = 10
CoD.WeaponCarouselButton.RightEdge_Default = -10
CoD.WeaponCarouselButton.RightEdge_Highlight = -10
CoD.WeaponCarouselButton.TopEdge_Default = 10
CoD.WeaponCarouselButton.TopEdge_Highlight = 10
CoD.WeaponCarouselButton.TopEdgeTabbed_Default = 10
CoD.WeaponCarouselButton.TopEdgeTabbed_Highlight = 10
CoD.WeaponCarouselButton.BottomEdge_Default = -10
CoD.WeaponCarouselButton.BottomEdge_Highlight = -10
CoD.WeaponCarouselButton.NewImageScale = 1.25
CoD.WeaponCarouselButton.new = function ( cardCarousel, controller, itemIndex, weaponGroup )
	local card = cardCarousel:addNewCard()
	card.controller = controller
	card.itemIndex = itemIndex
	card.weaponGroup = weaponGroup
	card.name = Engine.GetItemName( itemIndex )
	card.displayName = Engine.ToUpper( Engine.Localize( card.name ) )
	card.description = Engine.Localize( Engine.GetItemDesc( itemIndex ) )
	card.id = "WeaponCarouselButton." .. card.name
	card.iconMaterial = RegisterMaterial( Engine.GetItemImage( itemIndex ) .. "_big" )
	card.icon = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 10,
		right = -10,
		topAnchor = true,
		bottomAnchor = true,
		top = 35,
		bottom = -15,
		red = 1,
		green = 1,
		blue = 1,
		material = card.iconMaterial
	} )
	card:addElement( card.icon )
	card.title = LUI.UIText.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 10,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = -CoD.textSize.Default - 10,
		bottom = -10,
		font = CoD.fonts.Default,
		alignment = LUI.Alignment.Center
	} )
	card.titleText = Engine.Localize( Engine.GetItemName( itemIndex ) )
	card.title:setText( card.titleText )
	card.title:setAlignment( LUI.Alignment.Left )
	card:addElement( card.title )
	if card.border then
		card.border:close()
	end
	if card.highlightedborder then
		card.highlightedborder:close()
	end
	card:registerAnimationState( "fade_in", {
		alpha = 1
	} )
	card:registerAnimationState( "fade_out", {
		alpha = 0.2
	} )
	card:registerAnimationState( "fade_default", {
		alpha = 0.6
	} )
	card.borderHolder = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	card.borderHolder:setPriority( 100 )
	card.leftTickAlign = -64
	card.borderHolder:registerAnimationState( "big", {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0
	} )
	card.borderHolder:registerEventHandler( "card_small", CoD.WeaponCarouselButton.Border_CardSmall )
	card.borderHolder:registerEventHandler( "card_big", CoD.WeaponCarouselButton.Border_CardBig )
	card:addElement( card.borderHolder )
	card.border = CoD.BorderT6.new( 1, CoD.CACClassLoadout.DefaultButtonBorderColor.r, CoD.CACClassLoadout.DefaultButtonBorderColor.g, CoD.CACClassLoadout.DefaultButtonBorderColor.b, CoD.CACClassLoadout.DefaultButtonAlpha, -1 )
	card:addElement( card.border )
	if CoD.isSinglePlayer then
		local background = LUI.UIImage.new()
		background:setTopBottom( true, true, 0, 0 )
		background:setLeftRight( true, true, 0, 0 )
		background:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
		background:setRGB( CoD.CACClassLoadout.DefaultBackgroundColor.r, CoD.CACClassLoadout.DefaultBackgroundColor.g, CoD.CACClassLoadout.DefaultBackgroundColor.b )
		background:setAlpha( CoD.CACClassLoadout.DefaultBackgroundAlpha )
		card.backgroundGradient = background
		card:addElement( background )
	end
	card:registerEventHandler( "gain_focus", CoD.WeaponCarouselButton.GainFocus )
	card:registerEventHandler( "lose_focus", CoD.WeaponCarouselButton.LoseFocus )
	card.setLocked = CoD.WeaponCarouselButton.SetLocked
	card.setNew = CoD.WeaponCarouselButton.SetNew
	card.setInUse = CoD.WeaponCarouselButton.SetInUse
	card.setRecommended = CoD.WeaponCarouselButton.SetRecommended
	card.setHintText = CoD.WeaponCarouselButton.SetHintText
	return card
end

CoD.WeaponCarouselButton.Border_CardSmall = function ( self, event )
	self:animateToState( "default" )
	self:dispatchEventToChildren( {
		name = "animate",
		animationStateName = "default"
	} )
end

CoD.WeaponCarouselButton.Border_CardBig = function ( self, event )
	self:animateToState( "big" )
	self:dispatchEventToChildren( {
		name = "animate",
		animationStateName = "big"
	} )
end

CoD.WeaponCarouselButton.GainFocus = function ( weaponCarouselButton, event )
	event.hintText = weaponCarouselButton.hintText
	local retVal = CoD.CardCarousel.Card_GainFocus( weaponCarouselButton, event )
	if weaponCarouselButton.border ~= nil then
		weaponCarouselButton.border:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
		weaponCarouselButton.border:setAlpha( 1 )
		local highlight = LUI.UIImage.new()
		highlight:setLeftRight( true, true, -63, 65 )
		highlight:setTopBottom( true, true, -7, 8 )
		highlight:setImage( RegisterMaterial( "menu_mp_cac_caro_weapon_hl" ) )
		weaponCarouselButton:addElement( highlight )
		weaponCarouselButton.highlight = highlight
	end
	if not weaponCarouselButton.lockImage then
		weaponCarouselButton.title:beginAnimation( "highlight", CoD.WeaponCarouselButton.BracketAnimTime )
		weaponCarouselButton.title:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
	end
	CoD.WeaponCarouselButton.Lock_Selected( weaponCarouselButton.lockImage, CoD.WeaponCarouselButton.BracketAnimTime )
	CoD.WeaponCarouselButton.New_Selected( weaponCarouselButton.newImage, CoD.WeaponCarouselButton.BracketAnimTime )
	CoD.WeaponCarouselButton.Equip_Selected( weaponCarouselButton.inUseImage, CoD.WeaponCarouselButton.BracketAnimTime, locked )
	CoD.WeaponCarouselButton.Recommended_Selected( weaponCarouselButton.recommendedText, CoD.WeaponCarouselButton.BracketAnimTime )
	return retVal
end

CoD.WeaponCarouselButton.LoseFocus = function ( weaponCarouselButton, event )
	if weaponCarouselButton.newImage then
		Engine.SetItemAsOld( weaponCarouselButton.controller, weaponCarouselButton.itemIndex )
		weaponCarouselButton:setNew( false )
	end
	CoD.CardCarousel.Card_LoseFocus( weaponCarouselButton, event )
	if weaponCarouselButton.border ~= nil then
		weaponCarouselButton.border:setRGB( CoD.CACClassLoadout.DefaultButtonBorderColor.r, CoD.CACClassLoadout.DefaultButtonBorderColor.g, CoD.CACClassLoadout.DefaultButtonBorderColor.b )
		weaponCarouselButton.border:setAlpha( CoD.CACClassLoadout.DefaultButtonAlpha )
		if weaponCarouselButton.highlight ~= nil then
			weaponCarouselButton.highlight:close()
		end
	end
	weaponCarouselButton.title:beginAnimation( "unhighlight", CoD.WeaponCarouselButton.BracketAnimTime )
	weaponCarouselButton.title:setRGB( CoD.DefaultTextColor.r, CoD.DefaultTextColor.g, CoD.DefaultTextColor.b )
	CoD.WeaponCarouselButton.Lock_NotSelected( weaponCarouselButton.lockImage, CoD.WeaponCarouselButton.BracketAnimTime )
	CoD.WeaponCarouselButton.Equip_NotSelected( weaponCarouselButton.inUseImage, CoD.WeaponCarouselButton.BracketAnimTime, locked )
	CoD.WeaponCarouselButton.Recommended_NotSelected( weaponCarouselButton.recommendedText, CoD.WeaponCarouselButton.BracketAnimTime )
end

CoD.WeaponCarouselButton.SetLocked = function ( self, locked )
	if not locked and self.lockImage then
		self.lockImage:close()
		self.lockImage = nil
	elseif locked and not self.lockImage then
		if self.inUseImage ~= nil then
			self.inUseImage:close()
		end
		local lockImageBorder = 5
		self.lockImage = LUI.UIImage.new()
		CoD.WeaponCarouselButton.Lock_NotSelected( self.lockImage, 0 )
		self.borderHolder:addElement( self.lockImage )
		LUI.UIButton.SetupElement( self.lockImage )
		self:setHintText( Engine.GetUnlockString( self.itemIndex ), CoD.CACUtility.LockImageMaterial )
		if self.icon then
			self.icon:beginAnimation( "inactive" )
			self.icon:setAlpha( 0.25 )
		end
	end
end

CoD.WeaponCarouselButton.Lock_NotSelected = function ( self, duration )
	if not self then
		return 
	else
		local lockImageWidth = CoD.CACUtility.ButtonGridLockImageSize
		local lockImageHeight = CoD.CACUtility.ButtonGridLockImageSize
		local lockImageWidthBorder = CoD.WeaponCarouselButton.RightEdge_Default
		local lockImageHeightBorder = CoD.WeaponCarouselButton.TopEdgeTabbed_Default
		self:beginAnimation( "not_selected", duration )
		self:setLeftRight( false, true, lockImageWidthBorder - lockImageWidth, lockImageWidthBorder )
		self:setTopBottom( true, false, lockImageHeightBorder, lockImageHeightBorder + lockImageHeight )
		self:setImage( RegisterMaterial( CoD.CACUtility.LockImageMaterial ) )
		self:setRGB( 1, 1, 1 )
	end
end

CoD.WeaponCarouselButton.Lock_Selected = function ( self, duration )
	if not self then
		return 
	else
		local lockImageWidth = CoD.CACUtility.ButtonGridLockImageSize
		local lockImageHeight = CoD.CACUtility.ButtonGridLockImageSize
		local lockImageWidthBorder = CoD.WeaponCarouselButton.RightEdge_Highlight
		local lockImageHeightBorder = CoD.WeaponCarouselButton.TopEdgeTabbed_Highlight
		self:beginAnimation( "selected", duration )
		self:setLeftRight( false, true, lockImageWidthBorder - lockImageWidth, lockImageWidthBorder )
		self:setTopBottom( true, false, lockImageHeightBorder, lockImageHeightBorder + lockImageHeight )
		self:setImage( RegisterMaterial( CoD.CACUtility.LockImageMaterial ) )
	end
end

CoD.WeaponCarouselButton.SetNew = function ( self, isNew )
	if not isNew and self.newImage then
		self.newImage:close()
		self.newImage = nil
	elseif isNew and not self.newImage then
		local newImageBorder = 5
		self.newImage = LUI.UIImage.new()
		CoD.WeaponCarouselButton.New_NotSelected( self.newImage, 0 )
		self.borderHolder:addElement( self.newImage )
		LUI.UIButton.SetupElement( self.newImage )
	end
end

CoD.WeaponCarouselButton.New_NotSelected = function ( self, duration )
	if not self then
		return 
	else
		local newImageWidth = CoD.CACUtility.ButtonGridNewImageWidth * CoD.WeaponCarouselButton.NewImageScale
		local newImageHeight = CoD.CACUtility.ButtonGridNewImageHeight * CoD.WeaponCarouselButton.NewImageScale
		local newImageWidthBorder = CoD.WeaponCarouselButton.RightEdge_Default
		local newImageHeightBorder = CoD.WeaponCarouselButton.TopEdgeTabbed_Default
		self:beginAnimation( "not_selected", duration )
		self:setLeftRight( false, true, newImageWidthBorder - newImageWidth, newImageWidthBorder )
		self:setTopBottom( true, false, newImageHeightBorder, newImageHeightBorder + newImageHeight )
		self:setImage( RegisterMaterial( CoD.CACUtility.NewImageMaterial ) )
	end
end

CoD.WeaponCarouselButton.New_Selected = function ( self, duration )
	if not self then
		return 
	else
		local newImageWidth = CoD.CACUtility.ButtonGridNewImageWidth * CoD.WeaponCarouselButton.NewImageScale
		local newImageHeight = CoD.CACUtility.ButtonGridNewImageHeight * CoD.WeaponCarouselButton.NewImageScale
		local newImageWidthBorder = CoD.WeaponCarouselButton.RightEdge_Highlight
		local newImageHeightBorder = CoD.WeaponCarouselButton.TopEdgeTabbed_Highlight
		self:beginAnimation( "selected", duration )
		self:setLeftRight( false, true, newImageWidthBorder - newImageWidth, newImageWidthBorder )
		self:setTopBottom( true, false, newImageHeightBorder, newImageHeightBorder + newImageHeight )
		self:setImage( RegisterMaterial( CoD.CACUtility.NewImageMaterial ) )
	end
end

CoD.WeaponCarouselButton.SetInUse = function ( self, isInUse )
	if self.inUseImage ~= nil then
		self.inUseImage:close()
	end
	local inUseImage = LUI.UIElement.new()
	CoD.WeaponCarouselButton.Equip_NotSelected( inUseImage, 0 )
	self.inUseImage = inUseImage
	self.borderHolder:addElement( self.inUseImage )
	LUI.UIButton.SetupElement( self.inUseImage )
	if isInUse ~= nil and isInUse then
		self:setHintText( Engine.Localize( "SPUI_ITEM_CURRENTLY_EQUIPPED" ), CoD.CACUtility.EquipImageMaterial )
		local square = LUI.UIImage.new()
		square:setLeftRight( true, true, 0, 0 )
		square:setTopBottom( true, true, 0, 0 )
		square:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
		self.inUseImage:addElement( square )
	else
		self.inUseImage:addElement( CoD.BorderT6.new( 1, CoD.CACClassLoadout.DefaultButtonBorderColor.r, CoD.CACClassLoadout.DefaultButtonBorderColor.g, CoD.CACClassLoadout.DefaultButtonBorderColor.b, CoD.CACClassLoadout.DefaultButtonAlpha, 0 ) )
	end
end

CoD.WeaponCarouselButton.Equip_NotSelected = function ( self, duration )
	if not self then
		return 
	else
		local equipImageWidth = CoD.CACUtility.ButtonGridLockImageSize
		local equipImageHeight = CoD.CACUtility.ButtonGridLockImageSize
		local equipImageWidthBorder = CoD.WeaponCarouselButton.LeftEdge_Default
		local equipImageHeightBorder = CoD.WeaponCarouselButton.TopEdge_Default
		self:beginAnimation( "selected", duration )
		self:setLeftRight( true, false, equipImageWidthBorder, equipImageWidthBorder + equipImageWidth * 0.75 )
		self:setTopBottom( true, false, equipImageHeightBorder, equipImageHeightBorder + equipImageHeight * 0.75 )
	end
end

CoD.WeaponCarouselButton.Equip_Selected = function ( self, duration )
	if not self then
		return 
	else
		local equipImageWidth = CoD.CACUtility.ButtonGridLockImageSize
		local equipImageHeight = CoD.CACUtility.ButtonGridLockImageSize
		local equipImageWidthBorder = CoD.WeaponCarouselButton.LeftEdge_Highlight
		local equipImageHeightBorder = CoD.WeaponCarouselButton.TopEdge_Highlight
		self:beginAnimation( "selected", duration )
		self:setLeftRight( true, false, equipImageWidthBorder, equipImageWidthBorder + equipImageWidth )
		self:setTopBottom( true, false, equipImageHeightBorder, equipImageHeightBorder + equipImageHeight )
	end
end

CoD.WeaponCarouselButton.SetRecommended = function ( self, locked )
	if not locked and self.recommendedText then
		self.recommendedText:close()
		self.recommendedText = nil
	elseif locked and not self.recommendedText then
		self.recommendedText = LUI.UIText.new()
		self.recommendedText:setAlignment( LUI.Alignment.Left )
		self.recommendedText:setText( Engine.Localize( "SPUI_RECOMMENDED" ) )
		CoD.WeaponCarouselButton.Recommended_NotSelected( self.recommendedText, 0 )
		self.borderHolder:addElement( self.recommendedText )
		LUI.UIButton.SetupElement( self.recommendedText )
	end
end

CoD.WeaponCarouselButton.Recommended_NotSelected = function ( self, duration )
	if not self then
		return 
	else
		local recommendedTextHeight = CoD.textSize.ExtraSmall
		local recommendedTextWidthBorder = CoD.WeaponCarouselButton.RightEdge_Default
		local recommendedTextHeightBorder = CoD.WeaponCarouselButton.TopEdge_Default
		self:beginAnimation( "not_selected", duration )
		self:setLeftRight( true, true, CoD.WeaponCarouselButton.LeftEdge_Default * 1.5 + CoD.CACUtility.ButtonGridLockImageSize * 0.75, recommendedTextWidthBorder )
		self:setTopBottom( true, false, recommendedTextHeightBorder * 0.75, recommendedTextHeightBorder * 0.75 + recommendedTextHeight )
		self:setFont( CoD.fonts.ExtraSmall )
		self:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
	end
end

CoD.WeaponCarouselButton.Recommended_Selected = function ( self, duration )
	if not self then
		return 
	else
		local recommendedTextHeight = CoD.textSize.Default
		local recommendedTextWidthBorder = CoD.WeaponCarouselButton.RightEdge_Highlight
		local recommendedTextHeightBorder = CoD.WeaponCarouselButton.TopEdge_Highlight
		self:beginAnimation( "selected", duration )
		self:setLeftRight( true, true, CoD.WeaponCarouselButton.LeftEdge_Highlight * 2 + CoD.CACUtility.ButtonGridLockImageSize, recommendedTextWidthBorder )
		self:setTopBottom( true, false, recommendedTextHeightBorder * 0.75, recommendedTextHeightBorder * 0.75 + recommendedTextHeight )
		self:setFont( CoD.fonts.Default )
		self:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
	end
end

CoD.WeaponCarouselButton.SetHintText = function ( self, hintText )
	self.hintText = hintText
end

