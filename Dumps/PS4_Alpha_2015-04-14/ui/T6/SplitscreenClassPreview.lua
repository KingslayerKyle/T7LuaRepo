require( "ui.T6.AllocationBar" )
require( "ui.T6.AllocationStatus" )
require( "ui_mp.T6.Menus.CACUtility" )
require( "ui.T6.WeaponLevel" )

CoD.SplitscreenClassPreview = {}
CoD.SplitscreenClassPreview.New = function ( controller, width )
	local self = LUI.UIElement.new()
	self.m_inputDisabled = true
	self.id = "ClassPreview"
	self.width = width
	self.update = CoD.SplitscreenClassPreview.UpdateClass
	CoD.SplitscreenClassPreview.AddWidgets( self, controller )
	return self
end

CoD.SplitscreenClassPreview.AddWidgets = function ( self, controller )
	local allocationStatusRight = self.width
	local allocationStatusLeft = allocationStatusRight - CoD.AllocationStatus.Width
	local allocationStatusBottom = 5
	local allocationStatusTop = allocationStatusBottom - CoD.AllocationStatus.Height
	self.allocationStatus = CoD.AllocationStatus.new( controller )
	self.allocationStatus:setLeftRight( true, false, allocationStatusLeft, allocationStatusRight )
	self.allocationStatus:setTopBottom( true, false, allocationStatusTop, allocationStatusBottom )
	self:addElement( self.allocationStatus )
	local allocationBarHeight = 10
	local allocationBarTop = allocationStatusBottom
	self.allocationBar = CoD.T6AllocationBar.New( controller, self.width )
	self.allocationBar:setLeftRight( true, false, 0, self.width )
	self.allocationBar:setTopBottom( true, false, allocationBarTop, allocationBarTop + allocationBarHeight )
	self:addElement( self.allocationBar )
	local buttonSpacing = 4
	local buttonHeight = 60
	local restrictedImageSize = 32
	local leftSideButtonWidth = (self.width - buttonSpacing) * 0.57
	local rightSideButtonWidth = (self.width - buttonSpacing) * 0.43
	local primaryWeaponButtonHeight = leftSideButtonWidth / 2
	local titleFontName = "ExtraSmall"
	local titleFont = CoD.fonts[titleFontName]
	local titleFontHeight = CoD.textSize[titleFontName]
	local weaponNameFontName = "Condensed"
	local weaponNameFont = CoD.fonts[weaponNameFontName]
	local weaponNameFontHeight = CoD.textSize[weaponNameFontName]
	local leftButtonX = 0
	local leftTextX = leftButtonX + 3
	local rightButtonX = leftButtonX + leftSideButtonWidth + buttonSpacing
	local rightTextX = rightButtonX + 3
	local buttonTop = allocationBarTop + allocationBarHeight + 15
	self.primaryWeaponBackground = LUI.UIImage.new()
	self.primaryWeaponBackground:setLeftRight( true, false, leftButtonX, leftButtonX + leftSideButtonWidth )
	self.primaryWeaponBackground:setTopBottom( true, false, buttonTop, buttonTop + primaryWeaponButtonHeight )
	self.primaryWeaponBackground:setRGB( 0, 0, 0 )
	self.primaryWeaponBackground:setAlpha( 0.1 )
	self:addElement( self.primaryWeaponBackground )
	self.primaryWeaponBackgroundContainer = LUI.UIElement.new()
	self.primaryWeaponBackgroundContainer:setLeftRight( true, false, leftButtonX, leftButtonX + leftSideButtonWidth )
	self.primaryWeaponBackgroundContainer:setTopBottom( true, false, buttonTop, buttonTop + primaryWeaponButtonHeight )
	self:addElement( self.primaryWeaponBackgroundContainer )
	if CoD.ShouldShowWeaponLevel() then
		self.primaryWeaponLevelIconContainer = CoD.WeaponLevel.GetWeaponLevelIcon( 40, 40, "ExtraSmall", 0 )
		self.primaryWeaponBackgroundContainer:addElement( self.primaryWeaponLevelIconContainer )
		self.primaryWeaponLevelIconContainer:hide()
	end
	self:addElement( self.primaryWeaponBackgroundContainer )
	local leftOffset = 20
	local primaryWeaponImageHeight = primaryWeaponButtonHeight * 0.9
	local primaryWeaponImageWidth = primaryWeaponImageHeight * 2
	self.primaryWeaponImage = LUI.UIImage.new()
	self.primaryWeaponImage:setLeftRight( true, false, leftButtonX + leftSideButtonWidth - primaryWeaponImageWidth - leftOffset, leftButtonX + leftSideButtonWidth - leftOffset )
	self.primaryWeaponImage:setTopBottom( true, false, buttonTop, buttonTop + primaryWeaponImageHeight )
	self.primaryWeaponImage:setAlpha( 0 )
	self:addElement( self.primaryWeaponImage )
	local primaryRestrictedLeft = leftButtonX + leftSideButtonWidth - primaryWeaponImageWidth / 2 - restrictedImageSize / 2
	local primaryRestrictedTop = buttonTop + primaryWeaponButtonHeight / 2 - restrictedImageSize / 2
	self.primaryWeaponRestrictedImage = LUI.UIImage.new()
	self.primaryWeaponRestrictedImage:setLeftRight( true, false, primaryRestrictedLeft, primaryRestrictedLeft + restrictedImageSize )
	self.primaryWeaponRestrictedImage:setTopBottom( true, false, primaryRestrictedTop, primaryRestrictedTop + restrictedImageSize )
	self.primaryWeaponRestrictedImage:setAlpha( 0 )
	self.primaryWeaponRestrictedImage:setImage( RegisterMaterial( "cac_restricted" ) )
	self:addElement( self.primaryWeaponRestrictedImage )
	local perkButtonTop = buttonTop
	local priWeapAndPriAttachHeight = primaryWeaponButtonHeight + buttonSpacing + buttonHeight
	local perkButtonHeight = (priWeapAndPriAttachHeight - buttonSpacing * 2) / 3
	self.perk1Background = LUI.UIImage.new()
	self.perk1Background:setLeftRight( true, false, rightButtonX, rightButtonX + rightSideButtonWidth )
	self.perk1Background:setTopBottom( true, false, perkButtonTop, perkButtonTop + perkButtonHeight )
	self.perk1Background:setRGB( 0, 0, 0 )
	self.perk1Background:setAlpha( 0.1 )
	self:addElement( self.perk1Background )
	local perkImageSize = perkButtonHeight
	local perkImageSpacing = 0
	local perkImage1Left = rightButtonX + rightSideButtonWidth - perkImageSize * 2 - perkImageSpacing * 2
	local perkImage2Left = rightButtonX + rightSideButtonWidth - perkImageSize * 1 - perkImageSpacing * 1
	self.perk1Image1 = LUI.UIImage.new()
	self.perk1Image1:setLeftRight( true, false, perkImage1Left, perkImage1Left + perkImageSize )
	self.perk1Image1:setTopBottom( true, false, perkButtonTop, perkButtonTop + perkImageSize )
	self.perk1Image1:setAlpha( 0 )
	self:addElement( self.perk1Image1 )
	self.perk1Image2 = LUI.UIImage.new()
	self.perk1Image2:setLeftRight( true, false, perkImage2Left, perkImage2Left + perkImageSize )
	self.perk1Image2:setTopBottom( true, false, perkButtonTop, perkButtonTop + perkImageSize )
	self.perk1Image2:setAlpha( 0 )
	self:addElement( self.perk1Image2 )
	local perkRestricted1Left = perkImage1Left + perkImageSize / 2 - restrictedImageSize / 2
	local perkRestricted2Left = perkImage2Left + perkImageSize / 2 - restrictedImageSize / 2
	local perkRestrictedTop = perkButtonTop + perkImageSize / 2 - restrictedImageSize / 2
	self.perk1RestrictedImage1 = LUI.UIImage.new()
	self.perk1RestrictedImage1:setLeftRight( true, false, perkRestricted1Left, perkRestricted1Left + restrictedImageSize )
	self.perk1RestrictedImage1:setTopBottom( true, false, perkRestrictedTop, perkRestrictedTop + restrictedImageSize )
	self.perk1RestrictedImage1:setAlpha( 0 )
	self.perk1RestrictedImage1:setImage( RegisterMaterial( "cac_restricted" ) )
	self:addElement( self.perk1RestrictedImage1 )
	self.perk1RestrictedImage2 = LUI.UIImage.new()
	self.perk1RestrictedImage2:setLeftRight( true, false, perkRestricted2Left, perkRestricted2Left + restrictedImageSize )
	self.perk1RestrictedImage2:setTopBottom( true, false, perkRestrictedTop, perkRestrictedTop + restrictedImageSize )
	self.perk1RestrictedImage2:setAlpha( 0 )
	self.perk1RestrictedImage2:setImage( RegisterMaterial( "cac_restricted" ) )
	self:addElement( self.perk1RestrictedImage2 )
	perkButtonTop = perkButtonTop + perkButtonHeight + buttonSpacing
	self.perk2Background = LUI.UIImage.new()
	self.perk2Background:setLeftRight( true, false, rightButtonX, rightButtonX + rightSideButtonWidth )
	self.perk2Background:setTopBottom( true, false, perkButtonTop, perkButtonTop + perkButtonHeight )
	self.perk2Background:setRGB( 0, 0, 0 )
	self.perk2Background:setAlpha( 0.1 )
	self:addElement( self.perk2Background )
	self.perk2Image1 = LUI.UIImage.new()
	self.perk2Image1:setLeftRight( true, false, perkImage1Left, perkImage1Left + perkImageSize )
	self.perk2Image1:setTopBottom( true, false, perkButtonTop, perkButtonTop + perkImageSize )
	self.perk2Image1:setAlpha( 0 )
	self:addElement( self.perk2Image1 )
	self.perk2Image2 = LUI.UIImage.new()
	self.perk2Image2:setLeftRight( true, false, perkImage2Left, perkImage2Left + perkImageSize )
	self.perk2Image2:setTopBottom( true, false, perkButtonTop, perkButtonTop + perkImageSize )
	self.perk2Image2:setAlpha( 0 )
	self:addElement( self.perk2Image2 )
	perkRestrictedTop = perkButtonTop + perkImageSize / 2 - restrictedImageSize / 2
	self.perk2RestrictedImage1 = LUI.UIImage.new()
	self.perk2RestrictedImage1:setLeftRight( true, false, perkRestricted1Left, perkRestricted1Left + restrictedImageSize )
	self.perk2RestrictedImage1:setTopBottom( true, false, perkRestrictedTop, perkRestrictedTop + restrictedImageSize )
	self.perk2RestrictedImage1:setAlpha( 0 )
	self.perk2RestrictedImage1:setImage( RegisterMaterial( "cac_restricted" ) )
	self:addElement( self.perk2RestrictedImage1 )
	self.perk2RestrictedImage2 = LUI.UIImage.new()
	self.perk2RestrictedImage2:setLeftRight( true, false, perkRestricted2Left, perkRestricted2Left + restrictedImageSize )
	self.perk2RestrictedImage2:setTopBottom( true, false, perkRestrictedTop, perkRestrictedTop + restrictedImageSize )
	self.perk2RestrictedImage2:setAlpha( 0 )
	self.perk2RestrictedImage2:setImage( RegisterMaterial( "cac_restricted" ) )
	self:addElement( self.perk2RestrictedImage2 )
	perkButtonTop = perkButtonTop + perkButtonHeight + buttonSpacing
	self.perk3Background = LUI.UIImage.new()
	self.perk3Background:setLeftRight( true, false, rightButtonX, rightButtonX + rightSideButtonWidth )
	self.perk3Background:setTopBottom( true, false, perkButtonTop, perkButtonTop + perkButtonHeight )
	self.perk3Background:setRGB( 0, 0, 0 )
	self.perk3Background:setAlpha( 0.1 )
	self:addElement( self.perk3Background )
	self.perk3Image1 = LUI.UIImage.new()
	self.perk3Image1:setLeftRight( true, false, perkImage1Left, perkImage1Left + perkImageSize )
	self.perk3Image1:setTopBottom( true, false, perkButtonTop, perkButtonTop + perkImageSize )
	self.perk3Image1:setAlpha( 0 )
	self:addElement( self.perk3Image1 )
	self.perk3Image2 = LUI.UIImage.new()
	self.perk3Image2:setLeftRight( true, false, perkImage2Left, perkImage2Left + perkImageSize )
	self.perk3Image2:setTopBottom( true, false, perkButtonTop, perkButtonTop + perkImageSize )
	self.perk3Image2:setAlpha( 0 )
	self:addElement( self.perk3Image2 )
	perkRestrictedTop = perkButtonTop + perkImageSize / 2 - restrictedImageSize / 2
	self.perk3RestrictedImage1 = LUI.UIImage.new()
	self.perk3RestrictedImage1:setLeftRight( true, false, perkRestricted1Left, perkRestricted1Left + restrictedImageSize )
	self.perk3RestrictedImage1:setTopBottom( true, false, perkRestrictedTop, perkRestrictedTop + restrictedImageSize )
	self.perk3RestrictedImage1:setAlpha( 0 )
	self.perk3RestrictedImage1:setImage( RegisterMaterial( "cac_restricted" ) )
	self:addElement( self.perk3RestrictedImage1 )
	self.perk3RestrictedImage2 = LUI.UIImage.new()
	self.perk3RestrictedImage2:setLeftRight( true, false, perkRestricted2Left, perkRestricted2Left + restrictedImageSize )
	self.perk3RestrictedImage2:setTopBottom( true, false, perkRestrictedTop, perkRestrictedTop + restrictedImageSize )
	self.perk3RestrictedImage2:setAlpha( 0 )
	self.perk3RestrictedImage2:setImage( RegisterMaterial( "cac_restricted" ) )
	self:addElement( self.perk3RestrictedImage2 )
	buttonTop = buttonTop + primaryWeaponButtonHeight + buttonSpacing
	self.primaryWeaponAttachmentsBackground = LUI.UIImage.new()
	self.primaryWeaponAttachmentsBackground:setLeftRight( true, false, leftButtonX, leftButtonX + leftSideButtonWidth )
	self.primaryWeaponAttachmentsBackground:setTopBottom( true, false, buttonTop, buttonTop + buttonHeight )
	self.primaryWeaponAttachmentsBackground:setRGB( 0, 0, 0 )
	self.primaryWeaponAttachmentsBackground:setAlpha( 0.1 )
	self:addElement( self.primaryWeaponAttachmentsBackground )
	local attachmentImageTopOffset = 5
	local attachmentImageSize = buttonHeight - attachmentImageTopOffset * 2
	local attachmentImageSpacing = buttonSpacing
	local attachmentImage1Left = leftButtonX + leftSideButtonWidth - attachmentImageSize * 3 - attachmentImageSpacing * 3
	local attachmentImage2Left = leftButtonX + leftSideButtonWidth - attachmentImageSize * 2 - attachmentImageSpacing * 2
	local attachmentImage3Left = leftButtonX + leftSideButtonWidth - attachmentImageSize * 1 - attachmentImageSpacing * 1
	self.primaryWeaponAttachmentsImage1 = LUI.UIImage.new()
	self.primaryWeaponAttachmentsImage1:setLeftRight( true, false, attachmentImage1Left, attachmentImage1Left + attachmentImageSize )
	self.primaryWeaponAttachmentsImage1:setTopBottom( true, false, buttonTop + attachmentImageTopOffset, buttonTop + attachmentImageTopOffset + attachmentImageSize )
	self.primaryWeaponAttachmentsImage1:setAlpha( 0 )
	self:addElement( self.primaryWeaponAttachmentsImage1 )
	self.primaryWeaponAttachmentsImage2 = LUI.UIImage.new()
	self.primaryWeaponAttachmentsImage2:setLeftRight( true, false, attachmentImage2Left, attachmentImage2Left + attachmentImageSize )
	self.primaryWeaponAttachmentsImage2:setTopBottom( true, false, buttonTop + attachmentImageTopOffset, buttonTop + attachmentImageTopOffset + attachmentImageSize )
	self.primaryWeaponAttachmentsImage2:setAlpha( 0 )
	self:addElement( self.primaryWeaponAttachmentsImage2 )
	self.primaryWeaponAttachmentsImage3 = LUI.UIImage.new()
	self.primaryWeaponAttachmentsImage3:setLeftRight( true, false, attachmentImage3Left, attachmentImage3Left + attachmentImageSize )
	self.primaryWeaponAttachmentsImage3:setTopBottom( true, false, buttonTop + attachmentImageTopOffset, buttonTop + attachmentImageTopOffset + attachmentImageSize )
	self.primaryWeaponAttachmentsImage3:setAlpha( 0 )
	self:addElement( self.primaryWeaponAttachmentsImage3 )
	local attachmentRestricted1Left = attachmentImage1Left + attachmentImageSize / 2 - restrictedImageSize / 2
	local attachmentRestricted2Left = attachmentImage2Left + attachmentImageSize / 2 - restrictedImageSize / 2
	local attachmentRestricted3Left = attachmentImage3Left + attachmentImageSize / 2 - restrictedImageSize / 2
	local primaryWeaponAttachmentsRestrictedTop = buttonTop + attachmentImageTopOffset + attachmentImageSize / 2 - restrictedImageSize / 2
	self.primaryWeaponAttachmentsRestrictedImage1 = LUI.UIImage.new()
	self.primaryWeaponAttachmentsRestrictedImage1:setLeftRight( true, false, attachmentRestricted1Left, attachmentRestricted1Left + restrictedImageSize )
	self.primaryWeaponAttachmentsRestrictedImage1:setTopBottom( true, false, primaryWeaponAttachmentsRestrictedTop, primaryWeaponAttachmentsRestrictedTop + restrictedImageSize )
	self.primaryWeaponAttachmentsRestrictedImage1:setAlpha( 0 )
	self.primaryWeaponAttachmentsRestrictedImage1:setImage( RegisterMaterial( "cac_restricted" ) )
	self:addElement( self.primaryWeaponAttachmentsRestrictedImage1 )
	self.primaryWeaponAttachmentsRestrictedImage2 = LUI.UIImage.new()
	self.primaryWeaponAttachmentsRestrictedImage2:setLeftRight( true, false, attachmentRestricted2Left, attachmentRestricted2Left + restrictedImageSize )
	self.primaryWeaponAttachmentsRestrictedImage2:setTopBottom( true, false, primaryWeaponAttachmentsRestrictedTop, primaryWeaponAttachmentsRestrictedTop + restrictedImageSize )
	self.primaryWeaponAttachmentsRestrictedImage2:setAlpha( 0 )
	self.primaryWeaponAttachmentsRestrictedImage2:setImage( RegisterMaterial( "cac_restricted" ) )
	self:addElement( self.primaryWeaponAttachmentsRestrictedImage2 )
	self.primaryWeaponAttachmentsRestrictedImage3 = LUI.UIImage.new()
	self.primaryWeaponAttachmentsRestrictedImage3:setLeftRight( true, false, attachmentRestricted3Left, attachmentRestricted3Left + restrictedImageSize )
	self.primaryWeaponAttachmentsRestrictedImage3:setTopBottom( true, false, primaryWeaponAttachmentsRestrictedTop, primaryWeaponAttachmentsRestrictedTop + restrictedImageSize )
	self.primaryWeaponAttachmentsRestrictedImage3:setAlpha( 0 )
	self.primaryWeaponAttachmentsRestrictedImage3:setImage( RegisterMaterial( "cac_restricted" ) )
	self:addElement( self.primaryWeaponAttachmentsRestrictedImage3 )
	buttonTop = buttonTop + buttonHeight + buttonSpacing
	self.secondaryWeaponBackground = LUI.UIImage.new()
	self.secondaryWeaponBackground:setLeftRight( true, false, leftButtonX, leftButtonX + leftSideButtonWidth )
	self.secondaryWeaponBackground:setTopBottom( true, false, buttonTop, buttonTop + buttonHeight )
	self.secondaryWeaponBackground:setRGB( 0, 0, 0 )
	self.secondaryWeaponBackground:setAlpha( 0.1 )
	self:addElement( self.secondaryWeaponBackground )
	self.secondaryWeaponBackgroundContainer = LUI.UIElement.new()
	self.secondaryWeaponBackgroundContainer:setLeftRight( true, false, leftButtonX, leftButtonX + leftSideButtonWidth )
	self.secondaryWeaponBackgroundContainer:setTopBottom( true, false, buttonTop, buttonTop + buttonHeight )
	self:addElement( self.secondaryWeaponBackgroundContainer )
	if CoD.ShouldShowWeaponLevel() then
		self.secondaryWeaponLevelIconContainer = CoD.WeaponLevel.GetWeaponLevelIcon( 40, 40, "ExtraSmall", 0 )
		self.secondaryWeaponBackgroundContainer:addElement( self.secondaryWeaponLevelIconContainer )
		self.secondaryWeaponLevelIconContainer:hide()
	end
	self:addElement( self.secondaryWeaponBackgroundContainer )
	local leftOffset = 30
	local secondaryWeaponImageWidth = buttonHeight * 2
	self.secondaryWeaponImage = LUI.UIImage.new()
	self.secondaryWeaponImage:setLeftRight( true, false, leftButtonX + leftSideButtonWidth - secondaryWeaponImageWidth - leftOffset, leftButtonX + leftSideButtonWidth - leftOffset )
	self.secondaryWeaponImage:setTopBottom( true, false, buttonTop, buttonTop + buttonHeight )
	self.secondaryWeaponImage:setAlpha( 0 )
	self:addElement( self.secondaryWeaponImage )
	local secondaryRestrictedLeft = leftButtonX + leftSideButtonWidth - secondaryWeaponImageWidth / 2 - restrictedImageSize / 2
	local secondaryRestrictedTop = buttonTop + buttonHeight / 2 - restrictedImageSize / 2
	self.secondaryWeaponRestrictedImage = LUI.UIImage.new()
	self.secondaryWeaponRestrictedImage:setLeftRight( true, false, secondaryRestrictedLeft, secondaryRestrictedLeft + restrictedImageSize )
	self.secondaryWeaponRestrictedImage:setTopBottom( true, false, secondaryRestrictedTop, secondaryRestrictedTop + restrictedImageSize )
	self.secondaryWeaponRestrictedImage:setAlpha( 0 )
	self.secondaryWeaponRestrictedImage:setImage( RegisterMaterial( "cac_restricted" ) )
	self:addElement( self.secondaryWeaponRestrictedImage )
	self.primarygrenadeBackground = LUI.UIImage.new()
	self.primarygrenadeBackground:setLeftRight( true, false, rightButtonX, rightButtonX + rightSideButtonWidth )
	self.primarygrenadeBackground:setTopBottom( true, false, buttonTop, buttonTop + buttonHeight )
	self.primarygrenadeBackground:setRGB( 0, 0, 0 )
	self.primarygrenadeBackground:setAlpha( 0.1 )
	self:addElement( self.primarygrenadeBackground )
	local primarygrenadeImageSize = buttonHeight * 0.75
	local primarygrenadeImageSpacing = perkImageSpacing
	local primarygrenadeImageTop = buttonTop + buttonHeight / 2 - primarygrenadeImageSize / 2
	local primarygrenadeImage1Left = rightButtonX + rightSideButtonWidth - buttonHeight * 2 - perkImageSpacing * 2 + buttonHeight / 2 - primarygrenadeImageSize / 2
	local primarygrenadeImage2Left = rightButtonX + rightSideButtonWidth - buttonHeight * 1 - perkImageSpacing * 1 + buttonHeight / 2 - primarygrenadeImageSize / 2
	self.primarygrenadeImage1 = LUI.UIImage.new()
	self.primarygrenadeImage1:setLeftRight( true, false, primarygrenadeImage1Left, primarygrenadeImage1Left + primarygrenadeImageSize )
	self.primarygrenadeImage1:setTopBottom( true, false, primarygrenadeImageTop, primarygrenadeImageTop + primarygrenadeImageSize )
	self.primarygrenadeImage1:setAlpha( 0 )
	self:addElement( self.primarygrenadeImage1 )
	self.primarygrenadeImage2 = LUI.UIImage.new()
	self.primarygrenadeImage2:setLeftRight( true, false, primarygrenadeImage2Left, primarygrenadeImage2Left + primarygrenadeImageSize )
	self.primarygrenadeImage2:setTopBottom( true, false, primarygrenadeImageTop, primarygrenadeImageTop + primarygrenadeImageSize )
	self.primarygrenadeImage2:setAlpha( 0 )
	self:addElement( self.primarygrenadeImage2 )
	local primarygrenadeRestricted1Left = primarygrenadeImage1Left + primarygrenadeImageSize / 2 - restrictedImageSize / 2
	local primarygrenadeRestricted2Left = primarygrenadeImage2Left + primarygrenadeImageSize / 2 - restrictedImageSize / 2
	local primarygrenadeRestrictedTop = primarygrenadeImageTop + primarygrenadeImageSize / 2 - restrictedImageSize / 2
	self.primarygrenadeRestrictedImage1 = LUI.UIImage.new()
	self.primarygrenadeRestrictedImage1:setLeftRight( true, false, primarygrenadeRestricted1Left, primarygrenadeRestricted1Left + restrictedImageSize )
	self.primarygrenadeRestrictedImage1:setTopBottom( true, false, primarygrenadeRestrictedTop, primarygrenadeRestrictedTop + restrictedImageSize )
	self.primarygrenadeRestrictedImage1:setAlpha( 0 )
	self.primarygrenadeRestrictedImage1:setImage( RegisterMaterial( "cac_restricted" ) )
	self:addElement( self.primarygrenadeRestrictedImage1 )
	self.primarygrenadeRestrictedImage2 = LUI.UIImage.new()
	self.primarygrenadeRestrictedImage2:setLeftRight( true, false, primarygrenadeRestricted2Left, primarygrenadeRestricted2Left + restrictedImageSize )
	self.primarygrenadeRestrictedImage2:setTopBottom( true, false, primarygrenadeRestrictedTop, primarygrenadeRestrictedTop + restrictedImageSize )
	self.primarygrenadeRestrictedImage2:setAlpha( 0 )
	self.primarygrenadeRestrictedImage2:setImage( RegisterMaterial( "cac_restricted" ) )
	self:addElement( self.primarygrenadeRestrictedImage2 )
	buttonTop = buttonTop + buttonHeight + buttonSpacing
	self.specialgrenadeBackground = LUI.UIImage.new()
	self.specialgrenadeBackground:setLeftRight( true, false, rightButtonX, rightButtonX + rightSideButtonWidth )
	self.specialgrenadeBackground:setTopBottom( true, false, buttonTop, buttonTop + buttonHeight )
	self.specialgrenadeBackground:setRGB( 0, 0, 0 )
	self.specialgrenadeBackground:setAlpha( 0.1 )
	self:addElement( self.specialgrenadeBackground )
	local specialgrenadeImageSize = buttonHeight * 0.75
	local specialgrenadeImageSpacing = perkImageSpacing
	local specialgrenadeImageTop = buttonTop + buttonHeight / 2 - specialgrenadeImageSize / 2
	local specialgrenadeImage1Left = rightButtonX + rightSideButtonWidth - buttonHeight * 2 - perkImageSpacing * 2 + buttonHeight / 2 - specialgrenadeImageSize / 2
	local specialgrenadeImage2Left = rightButtonX + rightSideButtonWidth - buttonHeight * 1 - perkImageSpacing * 1 + buttonHeight / 2 - specialgrenadeImageSize / 2
	self.specialgrenadeImage1 = LUI.UIImage.new()
	self.specialgrenadeImage1:setLeftRight( true, false, specialgrenadeImage1Left, specialgrenadeImage1Left + specialgrenadeImageSize )
	self.specialgrenadeImage1:setTopBottom( true, false, specialgrenadeImageTop, specialgrenadeImageTop + specialgrenadeImageSize )
	self.specialgrenadeImage1:setAlpha( 0 )
	self:addElement( self.specialgrenadeImage1 )
	self.specialgrenadeImage2 = LUI.UIImage.new()
	self.specialgrenadeImage2:setLeftRight( true, false, specialgrenadeImage2Left, specialgrenadeImage2Left + specialgrenadeImageSize )
	self.specialgrenadeImage2:setTopBottom( true, false, specialgrenadeImageTop, specialgrenadeImageTop + specialgrenadeImageSize )
	self.specialgrenadeImage2:setAlpha( 0 )
	self:addElement( self.specialgrenadeImage2 )
	local specialgrenadeRestricted1Left = specialgrenadeImage1Left + specialgrenadeImageSize / 2 - restrictedImageSize / 2
	local specialgrenadeRestricted2Left = specialgrenadeImage2Left + specialgrenadeImageSize / 2 - restrictedImageSize / 2
	local specialgrenadeRestrictedTop = specialgrenadeImageTop + specialgrenadeImageSize / 2 - restrictedImageSize / 2
	self.specialgrenadeRestrictedImage1 = LUI.UIImage.new()
	self.specialgrenadeRestrictedImage1:setLeftRight( true, false, specialgrenadeRestricted1Left, specialgrenadeRestricted1Left + restrictedImageSize )
	self.specialgrenadeRestrictedImage1:setTopBottom( true, false, specialgrenadeRestrictedTop, specialgrenadeRestrictedTop + restrictedImageSize )
	self.specialgrenadeRestrictedImage1:setAlpha( 0 )
	self.specialgrenadeRestrictedImage1:setImage( RegisterMaterial( "cac_restricted" ) )
	self:addElement( self.specialgrenadeRestrictedImage1 )
	self.specialgrenadeRestrictedImage2 = LUI.UIImage.new()
	self.specialgrenadeRestrictedImage2:setLeftRight( true, false, specialgrenadeRestricted2Left, specialgrenadeRestricted2Left + restrictedImageSize )
	self.specialgrenadeRestrictedImage2:setTopBottom( true, false, specialgrenadeRestrictedTop, specialgrenadeRestrictedTop + restrictedImageSize )
	self.specialgrenadeRestrictedImage2:setAlpha( 0 )
	self.specialgrenadeRestrictedImage2:setImage( RegisterMaterial( "cac_restricted" ) )
	self:addElement( self.specialgrenadeRestrictedImage2 )
	self.secondaryWeaponAttachmentsBackground = LUI.UIImage.new()
	self.secondaryWeaponAttachmentsBackground:setLeftRight( true, false, leftButtonX, leftButtonX + leftSideButtonWidth )
	self.secondaryWeaponAttachmentsBackground:setTopBottom( true, false, buttonTop, buttonTop + buttonHeight )
	self.secondaryWeaponAttachmentsBackground:setRGB( 0, 0, 0 )
	self.secondaryWeaponAttachmentsBackground:setAlpha( 0.1 )
	self:addElement( self.secondaryWeaponAttachmentsBackground )
	self.secondaryWeaponAttachmentsImage1 = LUI.UIImage.new()
	self.secondaryWeaponAttachmentsImage1:setLeftRight( true, false, attachmentImage1Left, attachmentImage1Left + attachmentImageSize )
	self.secondaryWeaponAttachmentsImage1:setTopBottom( true, false, buttonTop + attachmentImageTopOffset, buttonTop + attachmentImageTopOffset + attachmentImageSize )
	self.secondaryWeaponAttachmentsImage1:setAlpha( 0 )
	self:addElement( self.secondaryWeaponAttachmentsImage1 )
	self.secondaryWeaponAttachmentsImage2 = LUI.UIImage.new()
	self.secondaryWeaponAttachmentsImage2:setLeftRight( true, false, attachmentImage2Left, attachmentImage2Left + attachmentImageSize )
	self.secondaryWeaponAttachmentsImage2:setTopBottom( true, false, buttonTop + attachmentImageTopOffset, buttonTop + attachmentImageTopOffset + attachmentImageSize )
	self.secondaryWeaponAttachmentsImage2:setAlpha( 0 )
	self:addElement( self.secondaryWeaponAttachmentsImage2 )
	local secondaryWeaponAttachmentsRestrictedTop = buttonTop + attachmentImageTopOffset + attachmentImageSize / 2 - restrictedImageSize / 2
	self.secondaryWeaponAttachmentsRestrictedImage1 = LUI.UIImage.new()
	self.secondaryWeaponAttachmentsRestrictedImage1:setLeftRight( true, false, attachmentRestricted1Left, attachmentRestricted1Left + restrictedImageSize )
	self.secondaryWeaponAttachmentsRestrictedImage1:setTopBottom( true, false, secondaryWeaponAttachmentsRestrictedTop, secondaryWeaponAttachmentsRestrictedTop + restrictedImageSize )
	self.secondaryWeaponAttachmentsRestrictedImage1:setAlpha( 0 )
	self.secondaryWeaponAttachmentsRestrictedImage1:setImage( RegisterMaterial( "cac_restricted" ) )
	self:addElement( self.secondaryWeaponAttachmentsRestrictedImage1 )
	self.secondaryWeaponAttachmentsRestrictedImage2 = LUI.UIImage.new()
	self.secondaryWeaponAttachmentsRestrictedImage2:setLeftRight( true, false, attachmentRestricted2Left, attachmentRestricted2Left + restrictedImageSize )
	self.secondaryWeaponAttachmentsRestrictedImage2:setTopBottom( true, false, secondaryWeaponAttachmentsRestrictedTop, secondaryWeaponAttachmentsRestrictedTop + restrictedImageSize )
	self.secondaryWeaponAttachmentsRestrictedImage2:setAlpha( 0 )
	self.secondaryWeaponAttachmentsRestrictedImage2:setImage( RegisterMaterial( "cac_restricted" ) )
	self:addElement( self.secondaryWeaponAttachmentsRestrictedImage2 )
	buttonTop = buttonTop + buttonHeight + buttonSpacing
	local backgroundLeft = leftButtonX
	local backgroundWidth = (self.width - buttonSpacing * (CoD.CACUtility.maxBonusCards - 1)) / CoD.CACUtility.maxBonusCards
	local bonusCardTop = buttonTop - 11
	local bonusCardHeight = buttonHeight + 10
	local bonusCardWidth = bonusCardHeight * 2
	local bonusCardSpacing = -20
	for index = 1, CoD.CACUtility.maxBonusCards, 1 do
		local bonusCardBackground = LUI.UIImage.new()
		bonusCardBackground:setLeftRight( true, false, backgroundLeft, backgroundLeft + backgroundWidth )
		bonusCardBackground:setTopBottom( true, false, buttonTop, buttonTop + buttonHeight )
		bonusCardBackground:setRGB( 0, 0, 0 )
		bonusCardBackground:setAlpha( 0.1 )
		self:addElement( bonusCardBackground )
		local bonusCardLeft = backgroundLeft + backgroundWidth - bonusCardWidth + 30
		local bonusCardImage = LUI.UIImage.new()
		bonusCardImage:setLeftRight( true, false, bonusCardLeft, bonusCardLeft + bonusCardWidth )
		bonusCardImage:setTopBottom( true, false, bonusCardTop, bonusCardTop + bonusCardHeight )
		bonusCardImage:setAlpha( 0 )
		self:addElement( bonusCardImage )
		self["bonusCardImage" .. index] = bonusCardImage
		local bonusCardRestrictedLeft = bonusCardLeft + bonusCardWidth / 2 - restrictedImageSize / 2
		local bonusCardRestrictedTop = bonusCardTop + bonusCardHeight / 2 - restrictedImageSize / 2
		local bonusCardRestrictedImage = LUI.UIImage.new()
		bonusCardRestrictedImage:setLeftRight( true, false, bonusCardRestrictedLeft, bonusCardRestrictedLeft + restrictedImageSize )
		bonusCardRestrictedImage:setTopBottom( true, false, bonusCardRestrictedTop, bonusCardRestrictedTop + restrictedImageSize )
		bonusCardRestrictedImage:setAlpha( 0 )
		bonusCardRestrictedImage:setImage( RegisterMaterial( "cac_restricted" ) )
		self:addElement( bonusCardRestrictedImage )
		self["bonusCardRestrictedImage" .. index] = bonusCardRestrictedImage
		backgroundLeft = backgroundLeft + backgroundWidth + buttonSpacing
	end
end

CoD.SplitscreenClassPreview.UpdateClass = function ( self, controller, classNum, className )
	if className then
		classNum = Engine.GetClassIndexFromName( className )
	end
	local class = Engine.GetCustomClass( controller, classNum )
	CoD.AllocationStatus.Update( self.allocationStatus, {
		class = class
	} )
	self.allocationBar:processEvent( {
		name = "update_class",
		class = class
	} )
	local primaryWeaponIndex = class.primary
	if primaryWeaponIndex == nil then
		self.primaryWeaponImage:hide()
		self.primaryWeaponRestrictedImage:hide()
		self.primaryWeaponBackgroundContainer:hide()
	else
		self.primaryWeaponImage:setImage( RegisterMaterial( Engine.GetItemImage( primaryWeaponIndex ) .. "_big" ) )
		self.primaryWeaponImage:show()
		self.primaryWeaponBackgroundContainer:show()
		if self.primaryWeaponLevelIconContainer then
			self.primaryWeaponLevelIconContainer:update( controller, primaryWeaponIndex )
		end
		local restrictedAlpha = 0
		if Engine.IsItemIndexRestricted( primaryWeaponIndex ) then
			restrictedAlpha = 1
		end
		self.primaryWeaponRestrictedImage:setAlpha( restrictedAlpha )
	end
	CoD.SplitscreenClassPreview.UpdatePerkCategory( self, 1, class )
	CoD.SplitscreenClassPreview.UpdatePerkCategory( self, 2, class )
	CoD.SplitscreenClassPreview.UpdatePerkCategory( self, 3, class )
	CoD.SplitscreenClassPreview.UpdateAttachments( self, controller, "primary", class, classNum )
	local secondaryWeaponIndex = class.secondary
	if secondaryWeaponIndex == nil then
		self.secondaryWeaponImage:hide()
		self.secondaryWeaponRestrictedImage:hide()
		self.secondaryWeaponBackgroundContainer:hide()
	else
		self.secondaryWeaponImage:setImage( RegisterMaterial( Engine.GetItemImage( secondaryWeaponIndex ) .. "_big" ) )
		self.secondaryWeaponImage:show()
		self.secondaryWeaponBackgroundContainer:show()
		if self.secondaryWeaponLevelIconContainer then
			self.secondaryWeaponLevelIconContainer:update( controller, secondaryWeaponIndex )
		end
		local restrictedAlpha = 0
		if Engine.IsItemIndexRestricted( secondaryWeaponIndex ) then
			restrictedAlpha = 1
		end
		self.secondaryWeaponRestrictedImage:setAlpha( restrictedAlpha )
	end
	CoD.SplitscreenClassPreview.UpdateGrenades( self, controller, "primarygrenade", class, classNum )
	CoD.SplitscreenClassPreview.UpdateGrenades( self, controller, "specialgrenade", class, classNum )
	CoD.SplitscreenClassPreview.UpdateAttachments( self, controller, "secondary", class, classNum )
	CoD.SplitscreenClassPreview.UpdateBonusCards( self, class )
end

CoD.SplitscreenClassPreview.UpdatePerkCategory = function ( self, perkCategory, class )
	local maxSlotsInCurrentPerkCategory = 2
	for index = 1, maxSlotsInCurrentPerkCategory, 1 do
		local currentSpecialtySlotNumber = perkCategory + (index - 1) * CoD.CACUtility.maxPerkCategories
		local itemIndex = class["specialty" .. currentSpecialtySlotNumber]
		if itemIndex == nil then
			local f4_local2 = "perk"
			local f4_local3 = perkCategory
			self[f4_local2 .. perkCategory .. "Image" .. index]:setAlpha( 0 )
			f4_local2 = "perk"
			f4_local3 = perkCategory
			self[f4_local2 .. perkCategory .. "RestrictedImage" .. index]:setAlpha( 0 )
		end
		local f4_local2 = "perk"
		local f4_local3 = perkCategory
		self[f4_local2 .. perkCategory .. "Image" .. index]:setImage( RegisterMaterial( Engine.GetItemImage( itemIndex ) ) )
		f4_local2 = "perk"
		f4_local3 = perkCategory
		self[f4_local2 .. perkCategory .. "Image" .. index]:setAlpha( 1 )
		local restrictedAlpha = 0
		if Engine.IsItemIndexRestricted( itemIndex ) then
			restrictedAlpha = 1
		end
		f4_local3 = "perk"
		local f4_local4 = perkCategory
		self[f4_local3 .. perkCategory .. "RestrictedImage" .. index]:setAlpha( restrictedAlpha )
	end
end

CoD.SplitscreenClassPreview.UpdateAttachments = function ( self, controller, weaponStatName, class, classNum )
	local weaponIndex = class[weaponStatName]
	local maxAttachments = 2
	if weaponStatName == "primary" then
		maxAttachments = 3
	end
	for index = 1, maxAttachments, 1 do
		local f5_local2 = weaponStatName
		self[weaponStatName .. "WeaponAttachmentsImage" .. index]:setAlpha( 0 )
		f5_local2 = weaponStatName
		self[weaponStatName .. "WeaponAttachmentsRestrictedImage" .. index]:setAlpha( 0 )
	end
	if weaponIndex ~= nil then
		for attachmentSlotIndex = 0, 2, 1 do
			local currentAttachmentIndex = class[weaponStatName .. "attachment" .. attachmentSlotIndex + 1]
			if currentAttachmentIndex ~= nil and currentAttachmentIndex ~= 0 then
				local attachmentImage = Engine.GetAttachmentImageByWeaponAndAttachIndex( weaponIndex, currentAttachmentIndex )
				local f5_local3 = weaponStatName
				self[weaponStatName .. "WeaponAttachmentsImage" .. attachmentSlotIndex + 1]:setImage( RegisterMaterial( attachmentImage ) )
				f5_local3 = weaponStatName
				self[weaponStatName .. "WeaponAttachmentsImage" .. attachmentSlotIndex + 1]:setAlpha( 1 )
				local restrictedAlpha = 0
				local attachmentIndex = Engine.GetItemAttachment( weaponIndex, currentAttachmentIndex )
				local isRestricted = Engine.IsAttachmentIndexRestricted( attachmentIndex )
				if Engine.IsAttachmentIndexRestricted( attachmentIndex ) then
					restrictedAlpha = 1
				end
				local f5_local4 = weaponStatName
				self[weaponStatName .. "WeaponAttachmentsRestrictedImage" .. attachmentSlotIndex + 1]:setAlpha( restrictedAlpha )
			end
		end
	end
end

CoD.SplitscreenClassPreview.UpdateGrenades = function ( self, controller, weaponStatName, class, classNum )
	local weaponIndex = class[weaponStatName]
	local maxGrenades = 2
	if weaponIndex == nil then
		for index = 1, maxGrenades, 1 do
			local f6_local2 = weaponStatName
			self[weaponStatName .. "Image" .. index]:setAlpha( 0 )
			f6_local2 = weaponStatName
			self[weaponStatName .. "RestrictedImage" .. index]:setAlpha( 0 )
		end
	else
		local numGrenadesEquipped = 0
		for index = 1, maxGrenades, 1 do
			local isActive = Engine.GetClassItem( controller, classNum, weaponStatName .. "status" .. index )
			if isActive == 1 then
				self[weaponStatName .. "Image" .. index]:setImage( RegisterMaterial( Engine.GetItemImage( weaponIndex ) .. "_256" ) )
				local f6_local4 = weaponStatName
				self[weaponStatName .. "Image" .. index]:setAlpha( 1 )
				local restrictedAlpha = 0
				if Engine.IsItemIndexRestricted( weaponIndex ) then
					restrictedAlpha = 1
				end
				local f6_local5 = weaponStatName
				self[weaponStatName .. "RestrictedImage" .. index]:setAlpha( restrictedAlpha )
				numGrenadesEquipped = numGrenadesEquipped + 1
			end
			local f6_local4 = weaponStatName
			self[weaponStatName .. "Image" .. index]:setAlpha( 0 )
			f6_local4 = weaponStatName
			self[weaponStatName .. "RestrictedImage" .. index]:setAlpha( 0 )
		end
	end
end

CoD.SplitscreenClassPreview.UpdateBonusCards = function ( self, class )
	for index = 1, CoD.CACUtility.maxBonusCards, 1 do
		local itemIndex = class["bonuscard" .. index]
		if itemIndex ~= nil then
			local bonusCardName = Engine.GetItemRef( itemIndex )
			self["bonusCardImage" .. index]:setImage( RegisterMaterial( Engine.GetItemImage( itemIndex ) ) )
			self["bonusCardImage" .. index]:setAlpha( 1 )
			local restrictedAlpha = 0
			if Engine.IsItemIndexRestricted( itemIndex ) then
				restrictedAlpha = 1
			end
			self["bonusCardRestrictedImage" .. index]:setAlpha( restrictedAlpha )
		end
		self["bonusCardImage" .. index]:setAlpha( 0 )
		self["bonusCardRestrictedImage" .. index]:setAlpha( 0 )
	end
end

