CoD.GrowingGridButton = {}
CoD.GrowingGridButton.BackgroundMaterialName = "blue_square_glow"
CoD.GrowingGridButton.GridTilesMaterialName = "menu_mp_cac_grid_pattern"
CoD.GrowingGridButton.GrowAmount = 10
CoD.GrowingGridButton.GrowDuration = 150
CoD.GrowingGridButton.InnerBorder = 5
CoD.GrowingGridButton.RenderPriority = 100
CoD.GrowingGridButton.ShrinkDuration = CoD.GrowingGridButton.GrowDuration
CoD.GrowingGridButton.TitleFontName = "ExtraSmall"
CoD.GrowingGridButton.TitleFont = CoD.fonts[CoD.GrowingGridButton.TitleFontName]
CoD.GrowingGridButton.TitleFontHeight = CoD.textSize[CoD.GrowingGridButton.TitleFontName]
CoD.GrowingGridButton.SubtitleFontName = "ExtraSmall"
CoD.GrowingGridButton.SubtitleFont = CoD.fonts[CoD.GrowingGridButton.SubtitleFontName]
CoD.GrowingGridButton.SubtitleFontHeight = CoD.textSize[CoD.GrowingGridButton.SubtitleFontName]
CoD.GrowingGridButton.SubtitleTop = CoD.GrowingGridButton.TitleFontHeight
CoD.GrowingGridButton.Subtitle2Top = CoD.GrowingGridButton.SubtitleTop + CoD.GrowingGridButton.SubtitleFontHeight
CoD.GrowingGridButton.Subtitle3Top = CoD.GrowingGridButton.Subtitle2Top + CoD.GrowingGridButton.SubtitleFontHeight
if CoD.isSinglePlayer then
	CoD.GrowingGridButton.TitleColor = CoD.visorBlue2
	CoD.GrowingGridButton.TitleAlpha = 1
else
	CoD.GrowingGridButton.TitleColor = CoD.offWhite
	CoD.GrowingGridButton.TitleAlpha = 0.5
end
CoD.GrowingGridButton.new = function ( defaultAnimationState, setupElementsFunction, actionEventName, zoom )
	defaultAnimationState.zoom = 0
	if zoom == nil then
		if CoD.isSinglePlayer then
			zoom = 15
		else
			zoom = 40
		end
	end
	local self = LUI.UIButton.new( defaultAnimationState, actionEventName )
	self.id = "GrowingGridButton"
	self:registerAnimationState( "button_over", {
		zoom = zoom
	} )
	if setupElementsFunction then
		setupElementsFunction( self )
	else
		CoD.GrowingGridButton.SetupElements( self )
	end
	if CoD.isSinglePlayer then
		local background = LUI.UIImage.new()
		background:setTopBottom( true, true, 0, 0 )
		background:setLeftRight( true, true, 0, 0 )
		background:setImage( RegisterMaterial( CoD.MPZM( "menu_mp_cac_grad_stretch", "menu_zm_cac_grad_stretch" ) ) )
		background:setRGB( CoD.CACClassLoadout.DefaultBackgroundColor.r, CoD.CACClassLoadout.DefaultBackgroundColor.g, CoD.CACClassLoadout.DefaultBackgroundColor.b )
		background:setAlpha( CoD.CACClassLoadout.DefaultBackgroundAlpha )
		self.backgroundGradient = background
		self:addElement( background )
	end
	self.overDuration = CoD.GrowingGridButton.GrowDuration
	self.overEaseIn = true
	self.overEaseOut = true
	self.upDuration = CoD.GrowingGridButton.ShrinkDuration
	self.upEaseIn = true
	self.upEaseOut = true
	self.addToBody = CoD.GrowingGridButton.AddToBody
	self.setNew = CoD.GrowingGridButton.SetNew
	self.setTitle = CoD.GrowingGridButton.SetTitle
	self.setSubtitle = CoD.GrowingGridButton.SetSubtitle
	self.setSubtitle2 = CoD.GrowingGridButton.SetSubtitle2
	self.setSubtitle3 = CoD.GrowingGridButton.SetSubtitle3
	self.highlightSubtitle = CoD.GrowingGridButton.HighlightSubtitle
	self.setHintText = CoD.GrowingGridButton.SetHintText
	self.addUnequipPrompt = CoD.GrowingGridButton.AddUnequipPrompt
	self.removeUnequipPrompt = CoD.GrowingGridButton.RemoveUnequipPrompt
	self.handleUnequipPrompt = CoD.GrowingGridButton.ButtonPromptUnequip
	self.setRestrictedImage = CoD.GrowingGridButton.SetRestrictedImage
	self.setLockedImage = CoD.GrowingGridButton.SetLockedImage
	self.setUnpurchasedImage = CoD.GrowingGridButton.SetUnpurchasedImage
	self:registerEventHandler( "button_over", CoD.GrowingGridButton.Over )
	self:registerEventHandler( "button_up", CoD.GrowingGridButton.Up )
	return self
end

CoD.GrowingGridButton.AddToBody = function ( self, element )
	self.body:addElement( element )
end

CoD.GrowingGridButton.SetupElements = function ( self )
	self.grid = LUI.UIImage.new()
	self.grid:setLeftRight( true, true, 0, 0 )
	self.grid:setTopBottom( true, true, 0, 0 )
	self.grid:setRGB( 0.3, 0.3, 0.3 )
	self.grid:setAlpha( 0.1 )
	self:addElement( self.grid )
	self.body = LUI.UIElement.new()
	self.body:setLeftRight( true, true, CoD.GrowingGridButton.InnerBorder, -CoD.GrowingGridButton.InnerBorder )
	self.body:setTopBottom( true, true, CoD.GrowingGridButton.InnerBorder, -CoD.GrowingGridButton.InnerBorder )
	self:addElement( self.body )
	self.body:registerAnimationState( "small", {
		leftAnchor = true,
		rightAnchor = true,
		left = 100,
		right = -CoD.GrowingGridButton.InnerBorder,
		topAnchor = true,
		bottomAnchor = true,
		top = CoD.GrowingGridButton.InnerBorder,
		bottom = -CoD.GrowingGridButton.InnerBorder
	} )
	if CoD.isSinglePlayer == true then
		self.border = CoD.BorderT6.new( 2, 1, 1, 1, 0 )
		self.border:setPriority( 100 )
		self:addElement( self.border )
		self.border:registerAnimationState( "button_over", {
			alpha = 1
		} )
	end
	self.brackets = CoD.Brackets.new( 12, CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
	self.brackets:setPriority( 100 )
	self:addElement( self.brackets )
	self.brackets:registerAnimationState( "hide", {
		alpha = 0
	} )
	self.brackets:animateToState( "hide" )
	self.brackets:registerAnimationState( "show", {
		alpha = 1
	} )
end

CoD.GrowingGridButton.SetNew = function ( self, isNew )
	if CoD.isSinglePlayer then
		if self.titleText == nil then
			return 
		elseif isNew and not self.newIcon then
			local textLeft, textTop, textRight, textBottom = GetTextDimensions( self.titleText, CoD.GrowingGridButton.TitleFont, CoD.GrowingGridButton.TitleFontHeight )
			local newImageWidth = CoD.CACUtility.ButtonGridNewImageWidth
			local newImageHeight = CoD.CACUtility.ButtonGridNewImageHeight
			local topEdge = 0
			local textWidth = textRight - textLeft
			local textHeight = textTop - textBottom
			local leftEdge = textWidth + 10
			newImageWidth = newImageWidth * textHeight / newImageHeight
			newImageHeight = textHeight
			
			local newIcon = LUI.UIImage.new()
			newIcon:setLeftRight( true, false, leftEdge, leftEdge + newImageWidth )
			newIcon:setTopBottom( true, false, topEdge, topEdge + newImageHeight )
			newIcon:setImage( RegisterMaterial( CoD.CACUtility.NewImageMaterial ) )
			self:addElement( newIcon )
			self.newIcon = newIcon
			
		elseif not isNew and self.newIcon then
			self.newIcon:close()
			self.newIcon = nil
		end
	elseif isNew then
		if not self.newIcon then
			local textWidth = 0
			if self.titleText then
				local textLeft, textRight, textBottom, textBottom = GetTextDimensions( self.titleText, CoD.GrowingGridButton.TitleFont, CoD.GrowingGridButton.TitleFontHeight )
				textWidth = textBottom - textLeft
			end
			local newImageWidth = CoD.CACUtility.ButtonGridNewImageWidth
			local newImageHeight = CoD.CACUtility.ButtonGridNewImageHeight
			local y = 10
			local leftEdge = textWidth + 10
			
			local newIcon = LUI.UIImage.new()
			newIcon:setLeftRight( true, false, leftEdge, leftEdge + newImageWidth )
			newIcon:setTopBottom( true, false, y - newImageHeight / 2, y + newImageHeight / 2 )
			newIcon:setImage( RegisterMaterial( CoD.CACUtility.NewImageMaterial ) )
			self:addElement( newIcon )
			self.newIcon = newIcon
			
		end
	elseif self.newIcon then
		self.newIcon:close()
		self.newIcon = nil
	end
end

CoD.GrowingGridButton.SetTitle = function ( self, titleText )
	if titleText then
		if not self.title then
			self.title = LUI.UIText.new( {
				leftAnchor = true,
				rightAnchor = false,
				left = CoD.GrowingGridButton.InnerBorder,
				right = CoD.GrowingGridButton.InnerBorder,
				topAnchor = false,
				bottomAnchor = false,
				top = -CoD.GrowingGridButton.TitleFontHeight / 2,
				bottom = CoD.GrowingGridButton.TitleFontHeight / 2,
				font = CoD.GrowingGridButton.TitleFont,
				red = CoD.GrowingGridButton.TitleColor.r,
				green = CoD.GrowingGridButton.TitleColor.g,
				blue = CoD.GrowingGridButton.TitleColor.b,
				alpha = CoD.GrowingGridButton.TitleAlpha
			} )
			self.title:registerAnimationState( "top", {
				topAnchor = true,
				bottomAnchor = false,
				top = 0,
				bottom = CoD.GrowingGridButton.TitleFontHeight
			} )
			self:addElement( self.title )
		end
		self.title:setText( titleText )
	elseif self.title then
		self.title:close()
		self.title = nil
	end
	self.titleText = titleText
	CoD.GrowingGridButton.UpdateLayout( self )
end

CoD.GrowingGridButton.UpdateLayout = function ( self )
	if self.title then
		if self.subtitle or self.subtitle2 or self.subtitle3 then
			self.title:animateToState( "top" )
		else
			self.title:animateToState( "default" )
		end
	end
	if self.title or self.subtitle or self.subtitle2 then
		self.body:animateToState( "small" )
	end
end

CoD.GrowingGridButton.AddUnequipPrompt = function ( self )
	if CoD.useMouse then
		CoD.GrowingGridButton.AddUnequipButton( self )
	end
	self:registerEventHandler( "button_prompt_unequip", self.handleUnequipPrompt )
	self:dispatchEventToParent( {
		name = "add_unequip_button"
	} )
end

CoD.GrowingGridButton.RemoveUnequipPrompt = function ( self )
	if CoD.useMouse then
		CoD.GrowingGridButton.RemoveUnequipButton( self )
	end
	self:registerEventHandler( "button_prompt_unequip", CoD.NullFunction )
	self:dispatchEventToParent( {
		name = "remove_unequip_button"
	} )
end

CoD.GrowingGridButton.ButtonPromptUnequip = function ( self, event )
	self:removeUnequipPrompt()
	self:dispatchEventToParent( {
		name = "item_unequipped"
	} )
end

CoD.GrowingGridButton.AddUnequipButton = function ( self )
	if self.unequipButtonSize == nil then
		return 
	end
	local size = self.unequipButtonSize
	if self.unequipButton == nil then
		local topBorder = 0
		local rightBorder = 0
		local imageOffset = 0
		if self.topBorderOffset ~= nil then
			topBorder = self.topBorderOffset
		end
		if self.rightBorderOffset ~= nil then
			rightBorder = self.rightBorderOffset
		end
		self.unequipButton = CoD.MouseButton.new( {
			leftAnchor = false,
			rightAnchor = true,
			left = -rightBorder - size,
			right = -rightBorder,
			topAnchor = true,
			bottomAnchor = false,
			top = topBorder,
			bottom = topBorder + size
		}, CoD.buttonStringsShortCut.mouse )
		self.unequipButton:setActionEventName( "button_prompt_unequip" )
		if self.zoomOffset ~= nil then
			self.unequipButton:setupButtonImage( -self.zoomOffset, 0 )
		end
	end
	self:addElement( self.unequipButton )
end

CoD.GrowingGridButton.RemoveUnequipButton = function ( self )
	if self.unequipButton ~= nil then
		self.unequipButton:close()
		self.unequipButton = nil
		self:setHandleMouseButton( true )
	end
end

CoD.GrowingGridButton.SetSubtitle = function ( self, subtitleText )
	if subtitleText then
		if not self.subtitle then
			self.subtitle = LUI.UIText.new( {
				leftAnchor = true,
				rightAnchor = false,
				left = CoD.GrowingGridButton.InnerBorder,
				right = CoD.GrowingGridButton.InnerBorder,
				topAnchor = true,
				bottomAnchor = false,
				top = CoD.GrowingGridButton.SubtitleTop,
				bottom = CoD.GrowingGridButton.SubtitleTop + CoD.GrowingGridButton.SubtitleFontHeight,
				font = CoD.GrowingGridButton.SubtitleFont
			} )
			self:addElement( self.subtitle )
		end
		self.subtitle:setText( subtitleText )
	elseif self.subtitle then
		self.subtitle:close()
		self.subtitle = nil
		self.subtitleContainer:close()
		self.subtitleContainer = nil
	end
	CoD.GrowingGridButton.UpdateLayout( self )
end

CoD.GrowingGridButton.SetPrimaryWeaponSubtitle = function ( self, subtitleText )
	if subtitleText then
		if self.subtitle then
			self.subtitle:close()
			self.subtitle = nil
		end
		self.subtitle = LUI.UIText.new( {
			leftAnchor = true,
			rightAnchor = false,
			left = CoD.GrowingGridButton.InnerBorder + 5,
			right = CoD.GrowingGridButton.InnerBorder,
			topAnchor = false,
			bottomAnchor = true,
			top = -CoD.GrowingGridButton.InnerBorder - CoD.textSize.Condensed,
			bottom = -CoD.GrowingGridButton.InnerBorder,
			font = CoD.fonts.Condensed
		} )
		self:addElement( self.subtitle )
		self.subtitle:setText( subtitleText )
	elseif self.subtitle then
		self.subtitle:close()
		self.subtitle = nil
	end
	CoD.GrowingGridButton.UpdateLayout( self )
end

CoD.GrowingGridButton.SetSecondaryWeaponSubtitle = function ( self, subtitleText )
	if subtitleText then
		if self.subtitle then
			self.subtitle:close()
			self.subtitle = nil
		end
		self.subtitle = LUI.UIText.new( {
			leftAnchor = true,
			rightAnchor = false,
			left = CoD.GrowingGridButton.InnerBorder + 5,
			right = CoD.GrowingGridButton.InnerBorder,
			topAnchor = false,
			bottomAnchor = true,
			top = -CoD.GrowingGridButton.InnerBorder - CoD.textSize.Condensed,
			bottom = -CoD.GrowingGridButton.InnerBorder,
			font = CoD.fonts.Condensed
		} )
		self:addElement( self.subtitle )
		self.subtitle:setText( subtitleText )
	elseif self.subtitle then
		self.subtitle:close()
		self.subtitle = nil
	end
	CoD.GrowingGridButton.UpdateLayout( self )
end

CoD.GrowingGridButton.SetSubtitle2 = function ( self, subtitleText )
	if subtitleText then
		if not self.subtitle2 then
			self.subtitle2 = LUI.UIText.new( {
				leftAnchor = true,
				rightAnchor = false,
				left = CoD.GrowingGridButton.InnerBorder,
				right = CoD.GrowingGridButton.InnerBorder,
				topAnchor = true,
				bottomAnchor = false,
				top = CoD.GrowingGridButton.Subtitle2Top,
				bottom = CoD.GrowingGridButton.Subtitle2Top + CoD.GrowingGridButton.SubtitleFontHeight,
				font = CoD.GrowingGridButton.SubtitleFont
			} )
			self:addElement( self.subtitle2 )
		end
		self.subtitle2:setText( subtitleText )
	elseif self.subtitle2 then
		self.subtitle2:close()
		self.subtitle2 = nil
	end
	CoD.GrowingGridButton.UpdateLayout( self )
end

CoD.GrowingGridButton.SetSubtitle3 = function ( self, subtitleText )
	if subtitleText then
		if not self.subtitle3 then
			self.subtitle3 = LUI.UIText.new( {
				leftAnchor = true,
				rightAnchor = false,
				left = CoD.GrowingGridButton.InnerBorder,
				right = CoD.GrowingGridButton.InnerBorder,
				topAnchor = true,
				bottomAnchor = false,
				top = CoD.GrowingGridButton.Subtitle3Top,
				bottom = CoD.GrowingGridButton.Subtitle3Top + CoD.GrowingGridButton.SubtitleFontHeight,
				font = CoD.GrowingGridButton.SubtitleFont
			} )
			self:addElement( self.subtitle3 )
		end
		self.subtitle3:setText( subtitleText )
	elseif self.subtitle3 then
		self.subtitle3:close()
		self.subtitle3 = nil
	end
	CoD.GrowingGridButton.UpdateLayout( self )
end

CoD.GrowingGridButton.HighlightSubtitle = function ( self, index, deselect )
	if self.subtitle then
		if index == 1 and not deselect then
			self.subtitle:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
		elseif index == 1 then
			self.subtitle:setRGB( CoD.DefaultTextColor.r, CoD.DefaultTextColor.g, CoD.DefaultTextColor.b )
		end
	end
	if self.subtitle2 then
		if index == 2 and not deselect then
			self.subtitle2:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
		elseif index == 2 then
			self.subtitle2:setRGB( CoD.DefaultTextColor.r, CoD.DefaultTextColor.g, CoD.DefaultTextColor.b )
		end
	end
	if self.subtitle3 then
		if index == 3 and not deselect then
			self.subtitle3:setRGB( CoD.trueOrange.r, CoD.trueOrange.g, CoD.trueOrange.b )
		elseif index == 3 then
			self.subtitle3:setRGB( CoD.DefaultTextColor.r, CoD.DefaultTextColor.g, CoD.DefaultTextColor.b )
		end
	end
end

CoD.GrowingGridButton.SetHintText = function ( self, hintText )
	self.hintText = hintText
end

CoD.GrowingGridButton.Over = function ( self, event )
	LUI.UIButton.Over( self, event )
	if self.canBeRemoved and self:isInFocus() then
		self:addUnequipPrompt()
	end
	if not self.big then
		self.big = true
		local parent = self:getParent()
		if parent then
			self:close()
			self:setPriority( CoD.GrowingGridButton.RenderPriority )
			parent:addElement( self )
		end
	end
	if self.border then
		self.border:setAlpha( 1 )
	end
end

CoD.GrowingGridButton.Up = function ( self, event )
	LUI.UIButton.Up( self, event )
	self:removeUnequipPrompt()
	if self.big then
		local parent = self:getParent()
		if parent then
			self:close()
			self:setPriority( 0 )
			parent:addElement( self )
		end
		self.big = nil
	end
	if self.border then
		self.border:setAlpha( 0 )
	end
end

CoD.GrowingGridButton.SetRestrictedImage = function ( self, shouldShowImage )
	if shouldShowImage then
		if not self.restrictedImage then
			if not CoD.GrowingGridButton.RestrictedMaterial then
				CoD.GrowingGridButton.RestrictedMaterial = RegisterMaterial( "cac_restricted" )
			end
			self.restrictedImage = LUI.UIImage.new()
			self.restrictedImage:setLeftRight( false, false, -16, 16 )
			self.restrictedImage:setTopBottom( false, false, -16, 16 )
			self.restrictedImage:setPriority( 10 )
			self.restrictedImage:setImage( CoD.GrowingGridButton.RestrictedMaterial )
			self:addElement( self.restrictedImage )
		end
	elseif self.restrictedImage then
		self.restrictedImage:close()
		self.restrictedImage = nil
	end
end

CoD.GrowingGridButton.SetLockedImage = function ( self, shouldShowImage )
	if shouldShowImage then
		if not CoD.GrowingGridButton.LockedMaterial then
			CoD.GrowingGridButton.LockedMaterial = RegisterMaterial( CoD.CACUtility.LockImageMaterial )
		end
		if not self.lockedImage then
			self.lockedImage = LUI.UIImage.new()
			self.lockedImage:setLeftRight( false, false, -16, 16 )
			self.lockedImage:setTopBottom( false, false, -16, 16 )
			self.lockedImage:setPriority( 10 )
			self.lockedImage:setImage( CoD.GrowingGridButton.LockedMaterial )
			self:addElement( self.lockedImage )
		end
	elseif self.lockedImage then
		self.lockedImage:close()
		self.lockedImage = nil
	end
end

CoD.GrowingGridButton.SetUnpurchasedImage = function ( self, shouldShowImage )
	if shouldShowImage then
		if not self.unpurchasedImage then
			if not CoD.GrowingGridButton.TokenMaterial then
				CoD.GrowingGridButton.TokenMaterial = RegisterMaterial( "menu_mp_lobby_token_64" )
			end
			self.unpurchasedImage = LUI.UIImage.new()
			self.unpurchasedImage:setLeftRight( false, false, -16, 16 )
			self.unpurchasedImage:setTopBottom( false, false, -16, 16 )
			self.unpurchasedImage:setPriority( 10 )
			self.unpurchasedImage:setImage( CoD.GrowingGridButton.TokenMaterial )
			self:addElement( self.unpurchasedImage )
		end
	elseif self.unpurchasedImage then
		self.unpurchasedImage:close()
		self.unpurchasedImage = nil
	end
end

CoD.GrowingGridButton.SetupUnequipButton = function ( self, topOffset, rightOffset, size, zoomOffset )
	if CoD.useMouse then
		self.topBorderOffset = topOffset
		self.rightBorderOffset = rightOffset
		self.unequipButtonSize = size
		self.zoomOffset = zoomOffset
	end
end

