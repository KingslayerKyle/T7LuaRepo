require( "ui_mp.T6.ChallengeReticlesGridButton" )

CoD.OpticChallengeType = {}
CoD.OpticChallengeType.reticlePreviewLineMaterialName = "menu_mp_cac_attach_line"
CoD.OpticChallengeType.GridTop = 60
CoD.OpticChallengeType.GridItemSpacing = 8
CoD.OpticChallengeType.GridColumns = 5
CoD.OpticChallengeType.GridItemWidth = (CoD.Menu.Width - CoD.OpticChallengeType.GridItemSpacing * (CoD.OpticChallengeType.GridColumns - 1)) / CoD.OpticChallengeType.GridColumns
CoD.OpticChallengeType.GridItemHeight = 50 + CoD.ContentGridButton.TitleHeight + 20
LUI.createMenu.OpticChallengeType = function ( controller )
	local self = CoD.Menu.New( "OpticChallengeType" )
	self:addLargePopupBackground()
	self:setOwner( controller )
	self:addBackButton()
	self:registerEventHandler( "content_button_highlighted", CoD.OpticChallengeType.ContentButtonHighlighted )
	local userData = CoD.perController[controller].OpticChallengeTypeData
	local attachmentIndex = userData.attachmentIndex
	local attachmentRef = userData.attachmentRef
	self.attachmentIndex = attachmentIndex
	self.attachmentRef = attachmentRef
	local attachmentName = Engine.GetAttachmentNameByIndex( attachmentIndex )
	self.attachmentName = attachmentName
	local headerText = Engine.Localize( "MENU_CHALLENGES_WEAPON_CHALLENGE_TYPE", attachmentName )
	self:addTitle( Engine.ToUpper( headerText ) )
	self.dualOpticReticle = self.attachmentRef == "dualoptic"
	local numPreviewImages = 1
	if self.dualOpticReticle then
		numPreviewImages = 2
	end
	self.numPreviewImages = numPreviewImages
	local top = CoD.Menu.TitleHeight + 25
	local gridDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = true,
		left = 0,
		right = 0,
		topAnchor = true,
		bottomAnchor = true,
		top = top,
		bottom = 0
	}
	self.contentGrid = CoD.ContentGrid.new( CoD.OpticChallengeType.GridColumns, gridDefaultAnimState, CoD.OpticChallengeType.GridItemWidth, CoD.OpticChallengeType.GridItemHeight, CoD.OpticChallengeType.GridItemSpacing )
	self:addElement( self.contentGrid )
	local rowCount = 4
	top = -40 + top + CoD.OpticChallengeType.GridItemHeight * rowCount + CoD.OpticChallengeType.GridItemSpacing * (rowCount - 1) + 3 + CoD.HintText.Height + 5
	local infoContainer = LUI.UIElement.new()
	infoContainer:setLeftRight( true, true, 0, 0 )
	infoContainer:setTopBottom( true, true, top, 0 )
	self:addElement( infoContainer )
	local infoContainerTop = 0
	local progressBarWidth = CoD.Menu.Width * 0.33
	local progressBarDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = progressBarWidth,
		topAnchor = true,
		bottomAnchor = true,
		top = infoContainerTop + 105,
		bottom = 0
	}
	self.progressBar = CoD.ChallengeProgressBar.new( progressBarDefaultAnimState, progressBarWidth )
	infoContainer:addElement( self.progressBar )
	self.reticleTitle = LUI.UIText.new()
	self.reticleTitle:setLeftRight( true, false, 0, 1 )
	self.reticleTitle:setTopBottom( true, false, infoContainerTop, infoContainerTop + CoD.textSize.Big )
	self.reticleTitle:setFont( CoD.fonts.Big )
	self.reticleTitle:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	infoContainer:addElement( self.reticleTitle )
	infoContainerTop = infoContainerTop + CoD.textSize.Big
	self.reticleDescription = LUI.UIText.new()
	self.reticleDescription:setLeftRight( true, false, 0, CoD.Menu.Width / 2 - 100 )
	self.reticleDescription:setTopBottom( true, false, infoContainerTop, infoContainerTop + CoD.textSize.Default )
	self.reticleDescription:setAlignment( LUI.Alignment.Left )
	self.reticleDescription:setFont( CoD.fonts.Default )
	self.reticleDescription:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	self.reticleDescription:setAlpha( 0.4 )
	infoContainer:addElement( self.reticleDescription )
	local weaponContainer = LUI.UIElement.new()
	weaponContainer:setLeftRight( false, true, -(CoD.Menu.Width / 2) + 10, 0 )
	weaponContainer:setTopBottom( true, true, 0, 0 )
	infoContainer:addElement( weaponContainer )
	local weaponImageWidth = 128
	local weaponImageHeight = weaponImageWidth
	local weaponImageTop = -100
	local weaponRightOffset = -120
	self.weaponImage = LUI.UIImage.new()
	self.weaponImage:setLeftRight( false, true, -weaponImageWidth + weaponRightOffset, weaponRightOffset )
	self.weaponImage:setTopBottom( true, false, weaponImageTop, weaponImageTop + weaponImageHeight )
	weaponContainer:addElement( self.weaponImage )
	self.weaponImage:setImage( RegisterMaterial( Engine.GetAttachmentImageByIndex( attachmentIndex ) ) )
	local reticlePreviewSize = 90
	local reticlePreviewLeft = 6
	local reticlePreviewBottom = -CoD.ButtonPrompt.Height - 22
	local reticlePreviewHeight = 120
	local reticlePreviewBGWidth = 300
	
	local reticlePreviewBackground = LUI.UIElement.new()
	reticlePreviewBackground:setLeftRight( true, false, reticlePreviewLeft, reticlePreviewLeft + reticlePreviewBGWidth )
	reticlePreviewBackground:setTopBottom( false, true, reticlePreviewBottom - reticlePreviewHeight, reticlePreviewBottom )
	weaponContainer:addElement( reticlePreviewBackground )
	self.reticlePreviewBackground = reticlePreviewBackground
	
	local reticlePreviewTitleFontName = "Default"
	local reticlePreviewTitleFont = CoD.fonts[reticlePreviewTitleFontName]
	local reticlePreviewTitleFontHeight = CoD.textSize[reticlePreviewTitleFontName]
	self.reticlePreviewTitle = LUI.UIText.new()
	self.reticlePreviewTitle:setLeftRight( true, false, 0, 1 )
	self.reticlePreviewTitle:setTopBottom( true, false, -reticlePreviewTitleFontHeight, 0 )
	self.reticlePreviewTitle:setRGB( CoD.gray.r, CoD.gray.g, CoD.gray.b )
	self.reticlePreviewTitle:setFont( reticleTitleFont )
	self.reticlePreviewTitle:setAlignment( LUI.Alignment.Left )
	self.reticlePreviewTitle:setText( Engine.Localize( "MPUI_REWARDS" ) )
	reticlePreviewBackground:addElement( self.reticlePreviewTitle )
	local reticleSize = 48
	local leftOffset = 22
	local topOffset = 25
	self.reticleImage = LUI.UIImage.new()
	self.reticleImage:setLeftRight( false, false, -reticleSize / 2, reticleSize / 2 )
	self.reticleImage:setTopBottom( true, false, topOffset, topOffset + reticleSize )
	self.reticleImage:hide()
	reticlePreviewBackground:addElement( self.reticleImage )
	local reticleUnlockImageHeight = 70
	local reticleUnlockImageWidth = reticleUnlockImageHeight * 4
	local reticleUnlockImageTopOffset = 10
	self.reticleUnlockImage = LUI.UIImage.new()
	self.reticleUnlockImage:setLeftRight( false, false, -reticleUnlockImageWidth / 2, reticleUnlockImageWidth / 2 )
	self.reticleUnlockImage:setTopBottom( true, false, reticleUnlockImageTopOffset, reticleUnlockImageTopOffset + reticleUnlockImageHeight )
	reticlePreviewBackground:addElement( self.reticleUnlockImage )
	local spacing = 20
	self.reticleImage1 = LUI.UIImage.new()
	self.reticleImage1:setLeftRight( false, false, -spacing / 2 - reticleSize, -spacing / 2 )
	self.reticleImage1:setTopBottom( true, false, topOffset, topOffset + reticleSize )
	self.reticleImage1:hide()
	reticlePreviewBackground:addElement( self.reticleImage1 )
	self.reticleImage2 = LUI.UIImage.new()
	self.reticleImage2:setLeftRight( false, false, spacing / 2, spacing / 2 + reticleSize )
	self.reticleImage2:setTopBottom( true, false, topOffset, topOffset + reticleSize )
	self.reticleImage2:hide()
	reticlePreviewBackground:addElement( self.reticleImage2 )
	local xpRewardFont = "Default"
	local xpRewardHeight = CoD.textSize[xpRewardFont]
	local xpRewardFont = CoD.fonts[xpRewardFont]
	self.reticleXPReward = LUI.UIText.new()
	self.reticleXPReward:setFont( xpRewardFont )
	self.reticleXPReward:setLeftRight( true, true, 0, 0 )
	self.reticleXPReward:setTopBottom( false, true, -xpRewardHeight - 10, -10 )
	self.reticleXPReward:setAlignment( LUI.Alignment.Center )
	self.reticleXPReward:setRGB( CoD.yellowGlow.r, CoD.yellowGlow.g, CoD.yellowGlow.b )
	reticlePreviewBackground:addElement( self.reticleXPReward )
	local lockImageSize = 32
	local lockBottomOffset = 5
	local lockLeftOffset = 5
	self.lockImage = LUI.UIImage.new()
	self.lockImage:setLeftRight( true, false, lockLeftOffset, lockLeftOffset + lockImageSize )
	self.lockImage:setTopBottom( false, true, -lockBottomOffset - lockImageSize, -lockBottomOffset )
	self.lockImage:setImage( RegisterMaterial( CoD.CACUtility.LockImageMaterial ) )
	self.lockImage:hide()
	reticlePreviewBackground:addElement( self.lockImage )
	reticlePreviewBackground.borderDip = CoD.BorderDip.new( 1, 1, 1, 1, 0.05, nil, reticlePreviewBGWidth, 1 )
	reticlePreviewBackground:addElement( reticlePreviewBackground.borderDip )
	CoD.OpticChallengeType.AddReticles( self, controller )
	return self
end

CoD.OpticChallengeType.AddReticles = function ( self, controller )
	local numReticles = Engine.GetNumWeaponOptionsForGroup( Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE )
	local buttonToGainFocus = nil
	for reticleIndex = 0, numReticles - 1, 1 do
		local weaponOption = Engine.GetWeaponOptionGroupIndex( reticleIndex, Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE )
		local isReticleMTX = CoD.CACUtility.IsWeaponOptionMTX( weaponOption )
		if not isReticleMTX then
			local hiddenValue = tonumber( Engine.TableLookup( nil, CoD.attachmentTable, 1, "reticle", 0, weaponOption, 9 ) )
			if hiddenValue == 2 then
				isReticleMTX = true
			end
		end
		if not isReticleMTX then
			local contentButton = CoD.ChallengeReticlesGridButton.new( controller, reticleIndex, self.attachmentRef, self.attachmentIndex )
			contentButton.actionSFX = nil
			contentButton.attachmentIndex = self.attachmentIndex
			self.contentGrid:addButton( contentButton )
			if not buttonToGainFocus then
				buttonToGainFocus = contentButton
			end
		end
	end
	CoD.OpticChallengeType.AddImageUnlocks( self, controller, numReticles + 1 )
	buttonToGainFocus:processEvent( {
		name = "gain_focus",
		controller = controller
	} )
end

CoD.OpticChallengeType.ChangeReticlePreview = function ( self, isImage )
	
end

CoD.OpticChallengeType.AddImageUnlocks = function ( self, controller, startIndex )
	local challengeInfo = Engine.GetChallengeInfoForImages( controller, self.attachmentRef )
	if not challengeInfo then
		return 
	end
	for key, currInfo in ipairs( challengeInfo ) do
		local challengeRow = currInfo.challengeRow
		local tableNumber = currInfo.tableNum
		local f4_local5 = ""
		local f4_local6 = ""
		local f4_local3 = nil
		local f4_local4 = -1
		local f4_local7 = -1
		if challengeRow ~= nil then
			f4_local3 = "mp/statsmilestones" .. tableNumber + 1 .. ".csv"
			f4_local4 = tonumber( Engine.TableLookupGetColumnValueForRow( f4_local3, challengeRow, 2 ) )
			f4_local5 = Engine.Localize( Engine.TableLookupGetColumnValueForRow( f4_local3, challengeRow, 5 ), "", self.attachmentName, "" )
			f4_local6 = Engine.Localize( Engine.TableLookupGetColumnValueForRow( f4_local3, challengeRow, 5 ) .. "_DESC", f4_local4, self.attachmentName )
			f4_local7 = tonumber( Engine.TableLookupGetColumnValueForRow( f4_local3, challengeRow, 6 ) )
			local contentButton = CoD.ChallengeGridButton.new( controller, startIndex, f4_local5, currInfo.imageID, currInfo.isEmblem )
			contentButton.maxVal = f4_local4
			contentButton.xpReward = f4_local7
			contentButton.statsname = Engine.TableLookupGetColumnValueForRow( f4_local3, challengeRow, 4 )
			contentButton.hintText = f4_local6
			contentButton.challengeValue = currInfo.currChallengeStatValue
			contentButton.isEmblem = currInfo.isEmblem
			contentButton.imageID = currInfo.imageID
			contentButton.actionSFX = nil
			local imageTopOffset = 16
			local imageHeight = 38
			local imageWidth = imageHeight * 4
			contentButton.itemImage:setTopBottom( true, false, imageTopOffset, imageTopOffset + imageHeight )
			contentButton.itemImage:setLeftRight( false, false, -imageWidth / 2, imageWidth / 2 )
			if contentButton.challengeValue < f4_local4 then
				contentButton:setLocked( true )
			end
			if contentButton.statsname == "challenges" then
				contentButton.showProgressBar = false
			end
			self.contentGrid:addButton( contentButton )
		end
	end
end

CoD.OpticChallengeType.UpdateReticlePreview = function ( self, button, controller )
	self.reticleImage:hide()
	self.reticleImage1:hide()
	self.reticleImage2:hide()
	self.reticleUnlockImage:hide()
	self.lockImage:hide()
	self.reticleXPReward:setText( "" )
	local xpRewardText = ""
	local imageName, image1Name, image2Name = nil
	CoD.OpticChallengeType.ChangeReticlePreview( self, button.imageID ~= nil )
	if button.dualOpticReticle then
		image1Name = button.image1MaterialName
		image2Name = button.image2MaterialName
	else
		imageName = button.reticleImageName
	end
	if button.lockImage then
		if button.xpReward then
			xpRewardText = Engine.Localize( "RANK_XP", button.xpReward )
		end
		self.lockImage:show()
	end
	if button.dualOpticReticle and image1Name then
		self.reticleImage1:show()
		self.reticleImage1:setImage( RegisterMaterial( image1Name ) )
		self.reticleImage2:show()
		self.reticleImage2:setImage( RegisterMaterial( image2Name ) )
	elseif imageName then
		self.reticleImage:show()
		self.reticleImage:setImage( RegisterMaterial( imageName ) )
	elseif button.imageID then
		self.reticleUnlockImage:show()
		if button.isEmblem then
			self.reticleUnlockImage:setupDrawEmblemById( button.imageID )
		else
			self.reticleUnlockImage:setupDrawBackgroundById( button.imageID )
		end
	end
	self.reticleXPReward:setText( xpRewardText )
end

CoD.OpticChallengeType.ContentButtonHighlighted = function ( self, event )
	if event.contentIndex then
		local button = event.button
		self.reticleTitle:setText( button.nameText )
		if event.hintText ~= nil then
			self.reticleDescription:setText( event.hintText )
		else
			self.reticleDescription:setText( "" )
		end
		self.progressBar:hide()
		if button.showProgressBar then
			self.progressBar:show()
			self.progressBar:update( button.challengeValue, button.maxVal )
		end
		CoD.OpticChallengeType.UpdateReticlePreview( self, button, event.controller )
	else
		self.reticleTitle:setText( Engine.Localize( "MPUI_NONE_CAPS" ) )
		self.reticleDescription:setText( "" )
	end
end

