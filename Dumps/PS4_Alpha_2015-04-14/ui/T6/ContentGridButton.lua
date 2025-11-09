CoD.ContentGridButton = {}
CoD.ContentGridButton.FontName = "ExtraSmall"
CoD.ContentGridButton.TitleHeight = CoD.textSize[CoD.ContentGridButton.FontName]
CoD.ContentGridButton.InactiveAlpha = 0.4
CoD.ContentGridButton.InUseDefaultSize = {
	width = 13,
	height = 13,
	left = 7,
	top = 15
}
if CoD.isSinglePlayer then
	CoD.ContentGridButton.InactiveTextColor = CoD.visorBlue1
	CoD.ContentGridButton.InactiveTextAlpha = 1 / CoD.ContentGridButton.InactiveAlpha
else
	CoD.ContentGridButton.InactiveTextColor = CoD.offWhite
	CoD.ContentGridButton.InactiveTextAlpha = 1
end
CoD.ContentGridButton.new = function ( contentIndex, customSetupFunction )
	local button = CoD.GrowingGridButton.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true
	}, customSetupFunction )
	button.contentIndex = contentIndex
	button.id = button.id .. contentIndex
	button:registerAnimationState( "active", {
		alpha = 1
	} )
	button:registerAnimationState( "inactive", {
		alpha = CoD.ContentGridButton.InactiveAlpha
	} )
	button:animateToState( "active" )
	button:registerEventHandler( "button_action", CoD.ContentGridButton.ButtonAction )
	button:registerEventHandler( "button_over", CoD.ContentGridButton.ButtonOver )
	button:registerEventHandler( "button_up", CoD.ContentGridButton.LoseFocus )
	button.setBottomTitle = CoD.ContentGridButton.SetBottomTitle
	button.setHintText = CoD.ContentGridButton.SetHintText
	button.setImage = CoD.ContentGridButton.SetImage
	button.setInactive = CoD.ContentGridButton.SetInactive
	button.setInUse = CoD.ContentGridButton.SetInUse
	button.setInUseFill = CoD.ContentGridButton.SetInUseFill
	button.setLocked = CoD.ContentGridButton.SetLocked
	button.setPurchased = CoD.ContentGridButton.SetPurchased
	button.setNew = CoD.ContentGridButton.SetNew
	button.setMutuallyExclusive = CoD.ContentGridButton.SetMutuallyExclusive
	if not CoD.isSinglePlayer then
		button.setRestrictedImage = CoD.ContentGridButton.SetRestrictedImage
	end
	return button
end

CoD.ContentGridButton.ButtonAction = function ( self, event )
	if not self.lockImage or self.overrideLock then
		self:setNew( false, event.controller )
		if CoD.isSinglePlayer == false and self.actionSFX ~= nil then
			Engine.PlaySound( self.actionSFX )
		end
		self:dispatchEventToParent( {
			name = "content_button_selected",
			controller = event.controller,
			contentIndex = self.contentIndex,
			mutuallyExclusiveIndices = self.mutuallyExclusiveIndices,
			button = self
		} )
	elseif CoD.isSinglePlayer == true then
		Engine.PlaySound( CoD.CACUtility.denySFX )
	end
	if self.inUseImage == nil then
		self:dispatchEventToParent( {
			name = "select_button"
		} )
	else
		self:dispatchEventToParent( {
			name = "deselect_button"
		} )
	end
end

CoD.ContentGridButton.ButtonOver = function ( self, event )
	CoD.GrowingGridButton.Over( self, event )
	if self.lockImage == nil then
		self.highlight:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
	else
		self.highlight:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	end
	if self.inUseImage == nil then
		self:dispatchEventToParent( {
			name = "select_button"
		} )
	else
		self:dispatchEventToParent( {
			name = "deselect_button"
		} )
	end
	if self.background ~= nil then
		self.background:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
		self.background:setAlpha( 1 )
	end
	self:dispatchEventToParent( {
		name = "content_button_highlighted",
		controller = event.controller,
		contentIndex = self.contentIndex,
		hintText = self.hintText,
		hintImage = self.hintImage,
		button = self,
		locked = self.lockImage ~= nil
	} )
end

CoD.ContentGridButton.LoseFocus = function ( self, event )
	self:setNew( false, event.controller )
	self:setInactive( self.inactive )
	CoD.GrowingGridButton.Up( self, event )
	if self.background ~= nil then
		self.background:setRGB( CoD.CACClassLoadout.DefaultButtonBorderColor.r, CoD.CACClassLoadout.DefaultButtonBorderColor.g, CoD.CACClassLoadout.DefaultButtonBorderColor.b )
		self.background:setAlpha( CoD.CACClassLoadout.DefaultButtonAlpha * 2 )
		if self.highlight ~= nil then
			self.highlight:setAlpha( 0 )
		end
	end
	self:dispatchEventToParent( {
		name = "content_button_lose_focus",
		controller = event.controller,
		contentIndex = self.contentIndex
	} )
end

CoD.ContentGridButton.SetBottomTitle = function ( self, title, defaultAnimState )
	if not title then
		if self.itemNameText then
			self.itemNameText:close()
			self.itemNameText = nil
		end
		return 
	end
	local fontHeight = CoD.textSize[CoD.ContentGridButton.FontName] * 0.85
	if CoD.isPS3 then
		fontHeight = fontHeight * 0.9
	end
	if not self.itemNameText then
		if defaultAnimState == nil then
			defaultAnimState = {
				leftAnchor = true,
				rightAnchor = true,
				left = 7.5,
				right = 0,
				topAnchor = false,
				bottomAnchor = true,
				top = -fontHeight - 15,
				bottom = -15,
				font = CoD.fonts[CoD.ContentGridButton.FontName],
				alignment = LUI.Alignment.Left
			}
		end
		self.itemNameText = LUI.UIText.new( defaultAnimState )
		self.itemNameText:registerAnimationState( "inactive", {
			red = CoD.ContentGridButton.InactiveTextColor.r,
			green = CoD.ContentGridButton.InactiveTextColor.g,
			blue = CoD.ContentGridButton.InactiveTextColor.b,
			alpha = CoD.ContentGridButton.InactiveTextAlpha
		} )
		self.itemNameText:registerAnimationState( "button_over", {
			red = CoD.BOIIOrange.r,
			green = CoD.BOIIOrange.g,
			blue = CoD.BOIIOrange.b
		} )
		LUI.UIButton.SetupElement( self.itemNameText )
		self:addElement( self.itemNameText )
	end
	self.itemNameText:setText( title )
end

CoD.ContentGridButton.SetHintText = function ( self, hintText, hintImage )
	self.hintText = hintText
	self.hintImage = hintImage
end

CoD.ContentGridButton.SetImage = function ( self, materialName, width, height, isStreamed )
	if self.itemImage then
		self.itemImage:close()
		self.itemImage = nil
	end
	if materialName then
		if isStreamed then
			self.itemImage = LUI.UIStreamedImage.new()
			self.itemImage:setLeftRight( false, false, -width / 2, width / 2 )
			self.itemImage:setTopBottom( true, false, 5, 5 + height )
			self.itemImage:setImage( RegisterMaterial( materialName ) )
			self:addElement( self.itemImage )
		else
			self.itemImage = LUI.UIImage.new()
			self.itemImage:setLeftRight( false, false, -width / 2, width / 2 )
			self.itemImage:setTopBottom( true, false, 5, 5 + height )
			self.itemImage:setImage( RegisterMaterial( materialName ) )
			self:addElement( self.itemImage )
		end
	end
end

CoD.ContentGridButton.SetInactive = function ( self, inactive )
	if inactive then
		self:animateToState( "inactive" )
		self:dispatchEventToChildren( {
			name = "animate",
			animationStateName = "inactive"
		} )
	else
		self:animateToState( "active" )
		self:dispatchEventToChildren( {
			name = "animate",
			animationStateName = "active"
		} )
	end
	self.inactive = inactive
end

CoD.ContentGridButton.SetInUse = function ( self, isInUse, left, top, width, height )
	if self.mutuallyExclusiveIcon then
		return 
	elseif not self.inUseBorder then
		if not width then
			width = CoD.ContentGridButton.InUseDefaultSize.width
		end
		if not height then
			height = CoD.ContentGridButton.InUseDefaultSize.height
		end
		if not left then
			left = CoD.ContentGridButton.InUseDefaultSize.left
		end
		if not top then
			top = CoD.ContentGridButton.InUseDefaultSize.top
		end
		self.inUseBorder = LUI.UIElement.new()
		self.inUseBorder:setLeftRight( true, false, left, left + width )
		self.inUseBorder:setTopBottom( true, false, top, top + height )
		self.inUseBorder:addElement( CoD.BorderT6.new( 1, CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b, 0.15 ) )
		self:addElement( self.inUseBorder )
	end
	if not isInUse and self.inUseImage then
		self.inUseImage:close()
		self.inUseImage = nil
	elseif isInUse and not self.inUseText then
		self.inUseImage = LUI.UIImage.new()
		if not width then
			width = CoD.ContentGridButton.InUseDefaultSize.width
		end
		if not height then
			height = CoD.ContentGridButton.InUseDefaultSize.height
		end
		if not left then
			left = CoD.ContentGridButton.InUseDefaultSize.left
		end
		if not top then
			top = CoD.ContentGridButton.InUseDefaultSize.top
		end
		self.inUseImage:setLeftRight( true, false, left, left + width )
		self.inUseImage:setTopBottom( true, false, top, top + height )
		self.inUseImage:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
		if not CoD.isSinglePlayer then
			self.inUseImage:setImage( RegisterMaterial( CoD.CACUtility.EquipImageMaterial ) )
		end
		self:addElement( self.inUseImage )
	end
end

CoD.ContentGridButton.SetLocked = function ( self, locked, controller, bigLock )
	if not locked and self.lockImage then
		self.lockImage:beginAnimation( "unlocked" )
		self.lockImage:close()
		self.lockImage = nil
		self.itemImage:beginAnimation( "unlocked" )
		self.itemImage:setAlpha( 1 )
		self:setHintText( nil )
		if self.itemNameText then
			self.itemNameText:registerAnimationState( "button_over", {
				red = CoD.trueOrange.r,
				green = CoD.trueOrange.g,
				blue = CoD.trueOrange.b
			} )
		end
	elseif locked and not self.lockImage then
		local lockTopOffset = -10
		local lockImageWidth, lockImageHeight, lockMaterial = nil
		if bigLock then
			lockImageWidth = CoD.CACUtility.ButtonGridBigLockImageSize
			lockImageHeight = CoD.CACUtility.ButtonGridBigLockImageSize
			lockMaterial = RegisterMaterial( CoD.CACUtility.LockImageBigMaterial )
		else
			lockImageWidth = CoD.CACUtility.ButtonGridLockImageSize
			lockImageHeight = CoD.CACUtility.ButtonGridLockImageSize
			lockMaterial = RegisterMaterial( CoD.CACUtility.LockImageMaterial )
		end
		self.lockImage = LUI.UIImage.new( {
			leftAnchor = false,
			rightAnchor = false,
			left = -lockImageWidth / 2,
			right = lockImageWidth / 2,
			topAnchor = false,
			bottomAnchor = false,
			top = lockTopOffset - lockImageHeight / 2,
			bottom = lockTopOffset + lockImageHeight / 2,
			material = lockMaterial,
			alpha = 1
		} )
		self.lockImage:registerAnimationState( "button_over", {
			alpha = 1
		} )
		self:addElement( self.lockImage )
		if CoD.isSinglePlayer and self.inUseBorder ~= nil then
			self.inUseBorder:close()
		end
		if self.itemNameText then
			self.itemNameText:registerAnimationState( "button_over", {
				red = CoD.offWhite.r,
				green = CoD.offWhite.g,
				blue = CoD.offWhite.b
			} )
		end
		self:setInactive( true )
		LUI.UIButton.SetupElement( self.lockImage )
		self.itemImage:beginAnimation( "locked" )
		self.itemImage:setAlpha( 0 )
		self:setActionPromptString( nil )
		if CoD.isSinglePlayer then
			if self.weaponItemIndex ~= nil then
				local unlockString = Engine.GetAttachmentUnlockString( controller, self.weaponItemIndex, self.attachmentNum )
				self:setHintText( unlockString, CoD.CACUtility.LockImageMaterial )
			elseif self.camoItemIndex ~= nil then
				local unlockString = Engine.GetCamoUnlockString( controller, self.statIndex )
				self:setHintText( unlockString, CoD.CACUtility.LockImageMaterial )
			else
				local unlockString = Engine.GetUnlockString( self.statIndex )
				self:setHintText( unlockString, CoD.CACUtility.LockImageMaterial )
			end
		elseif self.weaponItemIndex == nil and self.statIndex ~= nil and CoD.IsReward( self.statIndex ) then
			self:setHintText( CoD.GetUnlockStringForItemIndex( controller, self.statIndex ) )
		end
	end
end

CoD.ContentGridButton.SetPurchased = function ( self, purchased, controller )
	if purchased and self.tokenImage then
		self.tokenImage:close()
		self.tokenImage = nil
		self:setHintText( nil )
		self.itemImage:setAlpha( 1 )
		if self.itemNameText then
			self.itemNameText:registerAnimationState( "button_over", {
				red = CoD.trueOrange.r,
				green = CoD.trueOrange.g,
				blue = CoD.trueOrange.b
			} )
		end
	elseif not purchased and not self.tokenImage then
		local bottomTitleHeight = CoD.ContentGridButton.TitleHeight + 4
		local tokenBorderVert = -(bottomTitleHeight + 2)
		local tokenBorderHor = 4
		local tokenImageWidth = 32
		local tokenImageHeight = 32
		self.tokenImage = LUI.UIImage.new( {
			leftAnchor = true,
			rightAnchor = false,
			left = tokenBorderHor,
			right = tokenBorderHor + tokenImageWidth,
			topAnchor = false,
			bottomAnchor = true,
			top = tokenBorderVert - tokenImageHeight,
			bottom = tokenBorderVert,
			material = RegisterMaterial( "menu_mp_lobby_token_64" ),
			red = 1,
			green = 1,
			blue = 1,
			alpha = 1
		} )
		self.tokenImage:registerAnimationState( "button_over", {
			alpha = 10
		} )
		self:addElement( self.tokenImage )
		if self.itemNameText then
			self.itemNameText:registerAnimationState( "button_over", {
				red = CoD.trueOrange.r,
				green = CoD.trueOrange.g,
				blue = CoD.trueOrange.b
			} )
		end
		LUI.UIButton.SetupElement( self.tokenImage )
		self.itemImage:setAlpha( 0.5 )
		if CoD.isSinglePlayer ~= true then
			self:setHintText( Engine.Localize( "MPUI_UNLOCK_TOKEN_REQUIRED" ) )
		end
	end
end

CoD.ContentGridButton.SetMTXPurchased = function ( self, purchased, controller )
	if purchased and self.mtxImage then
		self.mtxImage:close()
		self.mtxImage = nil
		self:setHintText( nil )
		if self.dualOpticReticle then
			self.itemImage1:setAlpha( 1 )
			self.itemImage2:setAlpha( 1 )
		else
			self.itemImage:setAlpha( 1 )
		end
		if self.itemNameText then
			self.itemNameText:registerAnimationState( "button_over", {
				red = CoD.trueOrange.r,
				green = CoD.trueOrange.g,
				blue = CoD.trueOrange.b
			} )
		end
	elseif not purchased and not self.mtxImage then
		local bottomTitleHeight = CoD.ContentGridButton.TitleHeight + 4
		local mtxImageBorderVert = -(bottomTitleHeight + 2)
		local mtxImageBorderHor = 4
		local mtxImageWidth = 32
		local mtxImageHeight = 32
		self.mtxImage = LUI.UIImage.new( {
			leftAnchor = true,
			rightAnchor = false,
			left = mtxImageBorderHor,
			right = mtxImageBorderHor + mtxImageWidth,
			topAnchor = false,
			bottomAnchor = true,
			top = mtxImageBorderVert - mtxImageHeight * 1.5,
			bottom = mtxImageBorderVert - mtxImageHeight * 0.5,
			material = RegisterMaterial( "menu_purchase_unlock_token_64" ),
			red = 1,
			green = 1,
			blue = 1,
			alpha = 1
		} )
		self.mtxImage:registerAnimationState( "button_over", {
			alpha = 10
		} )
		self:addElement( self.mtxImage )
		if self.itemNameText then
			self.itemNameText:registerAnimationState( "button_over", {
				red = CoD.trueOrange.r,
				green = CoD.trueOrange.g,
				blue = CoD.trueOrange.b
			} )
		end
		LUI.UIButton.SetupElement( self.mtxImage )
		if self.dualOpticReticle then
			self.itemImage1:setAlpha( 0.25 )
			self.itemImage2:setAlpha( 0.25 )
		else
			self.itemImage:setAlpha( 0.25 )
		end
	end
end

CoD.ContentGridButton.SetNew = function ( self, isNew, controller )
	if not isNew and self.newImage then
		self.newImage:close()
		self.newImage = nil
		if not CoD.isSinglePlayer and controller then
			if self.eAttachment and self.weaponOption then
				Engine.SetWeaponOptionAsOld( controller, self.eAttachment, self.weaponOption )
			elseif self.weaponItemIndex and self.weaponOption then
				Engine.SetWeaponOptionAsOld( controller, self.weaponItemIndex, self.weaponOption )
			elseif self.weaponItemIndex and self.contentIndex then
				Engine.SetAttachmentAsOld( controller, self.weaponItemIndex, self.contentIndex )
			end
		end
		if controller and self.contentIndex and self.itemIsOld == nil then
			Engine.SetItemAsOld( controller, self.contentIndex )
		end
	elseif isNew and not self.newImage then
		self.newImage = LUI.UIImage.new()
		local newImageWidth = CoD.CACUtility.ButtonGridNewImageWidth
		local newImageHeight = CoD.CACUtility.ButtonGridNewImageHeight
		if CoD.isSinglePlayer then
			self.newImage:setLeftRight( false, true, -newImageWidth - 5, -5 )
			self.newImage:setTopBottom( true, false, 15, 15 + newImageHeight )
		else
			self.newImage:setLeftRight( true, false, 10, 10 + newImageWidth )
			self.newImage:setTopBottom( true, false, 15 - newImageHeight / 2, 15 + newImageHeight / 2 )
		end
		self.newImage:setImage( RegisterMaterial( CoD.CACUtility.NewImageMaterial ) )
		self:addElement( self.newImage )
	end
end

CoD.ContentGridButton.SetRestrictedImage = function ( self, shouldShowImage )
	if shouldShowImage then
		if not self.restrictedImage then
			if not CoD.GrowingGridButton.RestrictedMaterial then
				CoD.GrowingGridButton.RestrictedMaterial = RegisterMaterial( "cac_restricted" )
			end
			local yOffset = -(CoD.ContentGridButton.TitleHeight + 4) / 2
			local restrictedImageSize = 32
			self.restrictedImage = LUI.UIImage.new()
			self.restrictedImage:setLeftRight( false, false, -restrictedImageSize / 2, restrictedImageSize / 2 )
			self.restrictedImage:setTopBottom( false, false, yOffset - restrictedImageSize / 2, yOffset + restrictedImageSize / 2 )
			self.restrictedImage:setPriority( 10 )
			self.restrictedImage:setImage( CoD.GrowingGridButton.RestrictedMaterial )
			self:addElement( self.restrictedImage )
		end
	elseif self.restrictedImage then
		self.restrictedImage:close()
		self.restrictedImage = nil
	end
end

CoD.ContentGridButton.SetMutuallyExclusive = function ( self, index )
	if self.inUseBorder then
		self.inUseBorder:close()
		self.inUseBorder = nil
	end
	if index then
		if not self.mutuallyExclusiveIcon then
			self.mutuallyExclusiveIcon = LUI.UIImage.new()
			self.mutuallyExclusiveIcon:setLeftRight( true, false, 7, 31 )
			self.mutuallyExclusiveIcon:setTopBottom( true, false, 15, 39 )
			self.mutuallyExclusiveIcon:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
			self.mutuallyExclusiveIcon:setImage( RegisterMaterial( CoD.CACUtility.EquipImageMaterial ) )
			self.mutuallyExclusiveIcon:setAlpha( 0.5 )
			self:addElement( self.mutuallyExclusiveIcon )
		end
		if not self.mutuallyExclusiveIndices then
			self.mutuallyExclusiveIndices = {
				index
			}
		else
			table.insert( self.mutuallyExclusiveIndices, index )
		end
	elseif self.mutuallyExclusiveIcon then
		self.mutuallyExclusiveIndices = nil
		self.mutuallyExclusiveIcon:close()
		self.mutuallyExclusiveIcon = nil
	end
end

CoD.ContentGridButton.SetInUseFill = function ( self )
	self:setMutuallyExclusive( self.contentIndex )
	self.glowGradFront:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	self.glowGradFront:setAlpha( 0.2 )
	self.selectedFill:setAlpha( 0.2 )
	self:setHintText( Engine.Localize( "MPUI_ITEM_CURRENTLY_EQUIPPED_IN_ANOTHER_SLOT" ) )
	self.mutuallyExclusiveIcon:close()
end

CoD.ContentGridButton.SetupButtonText = function ( self, nameText )
	local defaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 5,
		right = 0,
		topAnchor = false,
		bottomAnchor = true,
		top = -CoD.textSize[CoD.ContentGridButton.FontName] - 2,
		bottom = -2,
		font = CoD.fonts[CoD.ContentGridButton.FontName],
		alignment = LUI.Alignment.Left
	}
	self:setBottomTitle( nameText, defaultAnimState )
	self.nameText = nameText
end

local HighlightButtonOver = function ( self, event )
	self:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	self:setAlpha( 1 )
	local button = self:getParent()
	if button and (button.lockImage or button.isLocked) then
		self:setRGB( 1, 1, 1 )
	end
end

local HighlightButtonUp = function ( self, event )
	self:setRGB( 1, 1, 1 )
	self:setAlpha( 0.1 )
end

CoD.ContentGridButton.SetupButtonImages = function ( self, glowBackColor, glowFrontColor )
	if self.grid then
		self.grid:close()
	end
	local blackBackground = LUI.UIImage.new()
	blackBackground:setLeftRight( true, true, 0, 0 )
	blackBackground:setTopBottom( true, true, 0, 0 )
	blackBackground:setRGB( 0, 0, 0 )
	blackBackground:setAlpha( 0.3 )
	blackBackground:setPriority( -110 )
	self:addElement( blackBackground )
	local bottomTitleHeight = CoD.textSize[CoD.ContentGridButton.FontName] + 4
	local bottomTitleBottomOffset = 1
	local blackGrad = LUI.UIImage.new()
	blackGrad:setLeftRight( true, true, 2, -2 )
	blackGrad:setTopBottom( true, true, 1, -bottomTitleHeight - bottomTitleBottomOffset )
	blackGrad:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
	blackGrad:setRGB( 0, 0, 0 )
	blackGrad:setAlpha( 1 )
	blackGrad:setPriority( -80 )
	self:addElement( blackGrad )
	if glowBackColor ~= nil then
		local frontGlowHeight = 60
		self.glowGradBack = LUI.UIImage.new()
		self.glowGradBack:setLeftRight( true, true, 1, -1 )
		self.glowGradBack:setTopBottom( false, true, -bottomTitleHeight - bottomTitleBottomOffset - frontGlowHeight, -bottomTitleHeight - bottomTitleBottomOffset )
		self.glowGradBack:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch_add" ) )
		self.glowGradBack:setRGB( glowBackColor.r, glowBackColor.g, glowBackColor.b )
		self.glowGradBack:setAlpha( 0.05 )
		self.glowGradBack:setPriority( -80 )
		self:addElement( self.glowGradBack )
	end
	if glowFrontColor ~= nil then
		local backGlowHeight = 30
		self.glowGradFront = LUI.UIImage.new()
		self.glowGradFront:setLeftRight( true, true, 1, -1 )
		self.glowGradFront:setTopBottom( false, true, -bottomTitleHeight - bottomTitleBottomOffset - backGlowHeight, -bottomTitleHeight - bottomTitleBottomOffset )
		self.glowGradFront:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch_add_v2" ) )
		self.glowGradFront:setRGB( glowFrontColor.r, glowFrontColor.g, glowFrontColor.b )
		self.glowGradFront:setAlpha( 0.05 )
		self.glowGradFront:setPriority( -80 )
		self:addElement( self.glowGradFront )
	end
	local whiteGrad = LUI.UIImage.new()
	whiteGrad:setLeftRight( true, true, 5, -5 )
	whiteGrad:setTopBottom( true, false, 4, 44 )
	whiteGrad:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
	whiteGrad:setPriority( 100 )
	whiteGrad:setAlpha( 0.1 )
	self:addElement( whiteGrad )
	local bottomTitleContainer = LUI.UIElement.new()
	bottomTitleContainer:setLeftRight( true, true, 2, -2 )
	bottomTitleContainer:setTopBottom( false, true, -bottomTitleHeight - bottomTitleBottomOffset, -bottomTitleBottomOffset )
	bottomTitleContainer:setPriority( -90 )
	self:addElement( bottomTitleContainer )
	local bottomTitleBackground = LUI.UIImage.new()
	bottomTitleBackground:setLeftRight( true, true, 0, 0 )
	bottomTitleBackground:setTopBottom( true, true, 0, 0 )
	bottomTitleBackground:setRGB( 0, 0, 0 )
	bottomTitleBackground:setAlpha( 0.8 )
	bottomTitleContainer:addElement( bottomTitleBackground )
	local bottomTitleGrad = LUI.UIImage.new()
	bottomTitleGrad:setLeftRight( true, true, 0, 0 )
	bottomTitleGrad:setTopBottom( true, false, 0, 12 )
	bottomTitleGrad:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
	bottomTitleGrad:setAlpha( 0.1 )
	bottomTitleContainer:addElement( bottomTitleGrad )
	self.highlight = CoD.BorderT6.new( 1, 1, 1, 1, 0.1 )
	self.highlight:setPriority( 100 )
	self.highlight:registerAnimationState( "default", {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0,
		alpha = 0
	} )
	self.highlight:registerEventHandler( "button_over", HighlightButtonOver )
	self.highlight:registerEventHandler( "button_up", HighlightButtonUp )
	self:addElement( self.highlight )
	self.selectedFill = LUI.UIImage.new()
	self.selectedFill:setLeftRight( true, true, 2, -2 )
	self.selectedFill:setTopBottom( true, true, 1, -1 )
	self.selectedFill:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	self.selectedFill:setAlpha( 0 )
	self.selectedFill:setPriority( -110 )
	self:addElement( self.selectedFill )
end

CoD.ContentGridButton.CarouselSetupButtonImages = function ( self, defaultBottomTitleHeight, largeBottomTitleHeight, glowBackColor, glowFrontColor )
	if self.grid then
		self.grid:close()
	end
	local blackBackground = LUI.UIImage.new()
	blackBackground:setLeftRight( true, true, 0, 0 )
	blackBackground:setTopBottom( true, true, 0, 0 )
	blackBackground:setRGB( 0, 0, 0 )
	blackBackground:setAlpha( 0.3 )
	blackBackground:setPriority( -110 )
	self:addElement( blackBackground )
	self.outline = CoD.BorderT6.new( 1, 1, 1, 1, 0.1 )
	self.outline:setPriority( -100 )
	self:addElement( self.outline )
	local bottomTitleBottomOffset = 1
	local bottomTitleHeight = CoD.textSize[CoD.ContentGridButton.FontName] + 4
	local overBottomTitleHeight = CoD.textSize[CoD.ContentGridButton.FontName] + 4
	if defaultBottomTitleHeight ~= nil then
		bottomTitleHeight = defaultBottomTitleHeight
	end
	if largeBottomTitleHeight ~= nil then
		overBottomTitleHeight = largeBottomTitleHeight
	end
	local blackGrad = LUI.UIImage.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 2,
		right = -2,
		topAnchor = true,
		bottomAnchor = true,
		top = 1,
		bottom = -bottomTitleHeight - bottomTitleBottomOffset
	} )
	blackGrad:registerAnimationState( "button_over", {
		leftAnchor = true,
		rightAnchor = true,
		left = 2,
		right = -2,
		topAnchor = true,
		bottomAnchor = true,
		top = 1,
		bottom = -overBottomTitleHeight - bottomTitleBottomOffset
	} )
	blackGrad:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
	blackGrad:setRGB( 0, 0, 0 )
	blackGrad:setAlpha( 1 )
	blackGrad:setPriority( -80 )
	self:addElement( blackGrad )
	LUI.UIButton.SetupElement( blackGrad )
	if glowBackColor ~= nil then
		local backGlowHeight = 60
		self.glowGradBack = LUI.UIImage.new( {
			leftAnchor = true,
			rightAnchor = true,
			left = 1,
			right = -1,
			topAnchor = false,
			bottomAnchor = true,
			top = -bottomTitleHeight - bottomTitleBottomOffset - backGlowHeight,
			bottom = -bottomTitleHeight - bottomTitleBottomOffset
		} )
		self.glowGradBack:registerAnimationState( "button_over", {
			leftAnchor = true,
			rightAnchor = true,
			left = 1,
			right = -1,
			topAnchor = false,
			bottomAnchor = true,
			top = -overBottomTitleHeight - bottomTitleBottomOffset - backGlowHeight,
			bottom = -overBottomTitleHeight - bottomTitleBottomOffset
		} )
		self.glowGradBack:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch_add" ) )
		self.glowGradBack:setRGB( glowBackColor.r, glowBackColor.g, glowBackColor.b )
		self.glowGradBack:setAlpha( 0.05 )
		self.glowGradBack:setPriority( -80 )
		self:addElement( self.glowGradBack )
		LUI.UIButton.SetupElement( self.glowGradBack )
	end
	if glowFrontColor ~= nil then
		local frontGlowHeight = 30
		self.glowGradFront = LUI.UIImage.new( {
			leftAnchor = true,
			rightAnchor = true,
			left = 1,
			right = -1,
			topAnchor = false,
			bottomAnchor = true,
			top = -bottomTitleHeight - bottomTitleBottomOffset - frontGlowHeight,
			bottom = -bottomTitleHeight - bottomTitleBottomOffset
		} )
		self.glowGradFront:registerAnimationState( "button_over", {
			leftAnchor = true,
			rightAnchor = true,
			left = 1,
			right = -1,
			topAnchor = false,
			bottomAnchor = true,
			top = -overBottomTitleHeight - bottomTitleBottomOffset - frontGlowHeight,
			bottom = -overBottomTitleHeight - bottomTitleBottomOffset
		} )
		self.glowGradFront:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch_add_v2" ) )
		self.glowGradFront:setRGB( glowFrontColor.r, glowFrontColor.g, glowFrontColor.b )
		self.glowGradFront:setAlpha( 0.05 )
		self.glowGradFront:setPriority( -80 )
		self:addElement( self.glowGradFront )
		LUI.UIButton.SetupElement( self.glowGradFront )
	end
	local whiteGrad = LUI.UIImage.new()
	whiteGrad:setLeftRight( true, true, 5, -5 )
	whiteGrad:setTopBottom( true, false, 4, 44 )
	whiteGrad:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
	whiteGrad:setPriority( 100 )
	whiteGrad:setAlpha( 0.1 )
	self:addElement( whiteGrad )
	local bottomTitleContainer = LUI.UIElement.new( {
		leftAnchor = true,
		rightAnchor = true,
		left = 2,
		right = -2,
		topAnchor = false,
		bottomAnchor = true,
		top = -bottomTitleHeight - bottomTitleBottomOffset,
		bottom = -bottomTitleBottomOffset
	} )
	bottomTitleContainer:registerAnimationState( "button_over", {
		leftAnchor = true,
		rightAnchor = true,
		left = 2,
		right = -2,
		topAnchor = false,
		bottomAnchor = true,
		top = -overBottomTitleHeight - bottomTitleBottomOffset,
		bottom = -bottomTitleBottomOffset
	} )
	bottomTitleContainer:setPriority( -90 )
	self:addElement( bottomTitleContainer )
	LUI.UIButton.SetupElement( bottomTitleContainer )
	local bottomTitleBackground = LUI.UIImage.new()
	bottomTitleBackground:setLeftRight( true, true, 0, 0 )
	bottomTitleBackground:setTopBottom( true, true, 0, 0 )
	bottomTitleBackground:setRGB( 0, 0, 0 )
	bottomTitleBackground:setAlpha( 0.8 )
	bottomTitleContainer:addElement( bottomTitleBackground )
	local bottomTitleGrad = LUI.UIImage.new()
	bottomTitleGrad:setLeftRight( true, true, 0, 0 )
	bottomTitleGrad:setTopBottom( true, false, 0, 12 )
	bottomTitleGrad:setImage( RegisterMaterial( "menu_mp_cac_grad_stretch" ) )
	bottomTitleGrad:setAlpha( 0.1 )
	bottomTitleContainer:addElement( bottomTitleGrad )
	self.highlight = CoD.BorderT6.new( 1, CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b, 0 )
	self.highlight:setPriority( 100 )
	self.highlight:registerAnimationState( "default", {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = 0,
		bottom = 0,
		alpha = 0
	} )
	self.highlight:registerAnimationState( "button_over", {
		alpha = 1
	} )
	LUI.UIButton.SetupElement( self.highlight )
	self:addElement( self.highlight )
end

