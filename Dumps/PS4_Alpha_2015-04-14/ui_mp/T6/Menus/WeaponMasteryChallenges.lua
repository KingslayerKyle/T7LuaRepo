require( "ui_mp.T6.ChallengeGridButton" )

CoD.WeaponMasteryChallenges = {}
CoD.WeaponMasteryChallenges.GridTop = 60
CoD.WeaponMasteryChallenges.GridColumns = 4
CoD.WeaponMasteryChallenges.GridItemSpacing = 10
CoD.WeaponMasteryChallenges.GridItemWidth = (CoD.Menu.Width - CoD.WeaponMasteryChallenges.GridItemSpacing * (CoD.WeaponMasteryChallenges.GridColumns - 1)) / CoD.WeaponMasteryChallenges.GridColumns
CoD.WeaponMasteryChallenges.GridItemHeight = 50 + CoD.ContentGridButton.TitleHeight + 30
LUI.createMenu.WeaponMasteryChallenges = function ( controller )
	local self = CoD.Menu.New( "WeaponMasteryChallenges" )
	self:addLargePopupBackground()
	self:setOwner( controller )
	local weaponIndex = CoD.perController[controller].weaponIndex
	local weaponSlot = CoD.perController[controller].weaponSlot
	self:setPreviousMenu( "WeaponChallengeType" )
	self:addBackButton()
	self:registerEventHandler( "content_button_highlighted", CoD.WeaponMasteryChallenges.ButtonHighlighted )
	local top = 0
	local titleText = Engine.Localize( "MENU_CHALLENGES_WEAPON_MASTERY", Engine.GetItemName( weaponIndex ) )
	self:addTitle( Engine.ToUpper( titleText ) )
	top = top + CoD.textSize.Big + 15
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
	self.contentGrid = CoD.ContentGrid.new( CoD.WeaponMasteryChallenges.GridColumns, gridDefaultAnimState, CoD.WeaponMasteryChallenges.GridItemWidth, CoD.WeaponMasteryChallenges.GridItemHeight, CoD.WeaponMasteryChallenges.GridItemSpacing )
	self:addElement( self.contentGrid )
	local rowCount = 1
	top = top + CoD.WeaponMasteryChallenges.GridItemHeight * rowCount + CoD.WeaponMasteryChallenges.GridItemSpacing * (rowCount - 1) + 3 + CoD.HintText.Height + 5
	
	local infoContainer = LUI.UIElement.new()
	infoContainer:setLeftRight( true, true, 0, 0 )
	infoContainer:setTopBottom( false, true, -200, 0 )
	self:addElement( infoContainer )
	self.infoContainer = infoContainer
	
	CoD.WeaponMasteryChallenges.ChallengeLeftSideDesc( self )
	CoD.WeaponMasteryChallenges.ChallengeImagePreview( self )
	CoD.WeaponMasteryChallenges.AddMasteryChallengeButtons( self, controller, weaponIndex, weaponSlot )
	return self
end

CoD.WeaponMasteryChallenges.ChallengeLeftSideDesc = function ( self )
	local infoContainerTop = 0
	self.challengeTitle = LUI.UIText.new()
	self.challengeTitle:setLeftRight( true, false, 0, 1 )
	self.challengeTitle:setTopBottom( true, false, infoContainerTop, infoContainerTop + CoD.textSize.Big )
	self.challengeTitle:setFont( CoD.fonts.Big )
	self.challengeTitle:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	self.infoContainer:addElement( self.challengeTitle )
	infoContainerTop = infoContainerTop + CoD.textSize.Big
	self.challengeDescription = LUI.UIText.new()
	self.challengeDescription:setLeftRight( true, false, 0, CoD.Menu.Width / 2 )
	self.challengeDescription:setTopBottom( true, false, infoContainerTop, infoContainerTop + CoD.textSize.Default )
	self.challengeDescription:setAlignment( LUI.Alignment.Left )
	self.challengeDescription:setFont( CoD.fonts.Default )
	self.challengeDescription:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	self.challengeDescription:setAlpha( 0.4 )
	self.infoContainer:addElement( self.challengeDescription )
	infoContainerTop = infoContainerTop + CoD.textSize.Default + 25
	local progressBarWidth = CoD.Menu.Width * 0.33
	local progressBarDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = progressBarWidth,
		topAnchor = true,
		bottomAnchor = true,
		top = infoContainerTop,
		bottom = 0
	}
	self.progressBar = CoD.ChallengeProgressBar.new( progressBarDefaultAnimState, progressBarWidth )
	self.progressBar:hide()
	self.infoContainer:addElement( self.progressBar )
end

CoD.WeaponMasteryChallenges.ChallengeImagePreview = function ( self )
	local rightContainer = LUI.UIElement.new()
	rightContainer:setLeftRight( false, true, -(CoD.Menu.Width / 2) + 10, 0 )
	rightContainer:setTopBottom( true, true, 0, 0 )
	self.infoContainer:addElement( rightContainer )
	local imagePreviewSize = 64
	local imagePreviewLeft = 5
	local imagePreviewBottom = -CoD.ButtonPrompt.Height - 22
	local imagePreviewHeight = 120
	local imagePreviewBGWidth = 300
	local imagePreviewBackground = LUI.UIElement.new()
	imagePreviewBackground:setLeftRight( true, false, imagePreviewLeft, imagePreviewLeft + imagePreviewBGWidth )
	imagePreviewBackground:setTopBottom( false, true, imagePreviewBottom - imagePreviewHeight, imagePreviewBottom )
	rightContainer:addElement( imagePreviewBackground )
	local imagePreviewTitleFontName = "Default"
	local imagePreviewTitleFont = CoD.fonts[imagePreviewTitleFontName]
	local imagePreviewTitleFontHeight = CoD.textSize[imagePreviewTitleFontName]
	self.imagePreviewTitle = LUI.UIText.new()
	self.imagePreviewTitle:setLeftRight( true, false, 0, 1 )
	self.imagePreviewTitle:setTopBottom( true, false, -imagePreviewTitleFontHeight, 0 )
	self.imagePreviewTitle:setRGB( CoD.gray.r, CoD.gray.g, CoD.gray.b )
	self.imagePreviewTitle:setFont( imagePreviewTitleFont )
	self.imagePreviewTitle:setAlignment( LUI.Alignment.Left )
	self.imagePreviewTitle:setText( "" )
	imagePreviewBackground:addElement( self.imagePreviewTitle )
	local xpRewardFontName = "Default"
	local xpRewardFont = CoD.fonts[imagePreviewTitleFontName]
	local xpRewardFontHeight = CoD.textSize[imagePreviewTitleFontName]
	self.xpReward = LUI.UIText.new()
	self.xpReward:setLeftRight( true, true, 0, 0 )
	self.xpReward:setTopBottom( false, true, -10 - xpRewardFontHeight, -10 )
	self.xpReward:setAlignment( LUI.Alignment.Center )
	self.xpReward:setRGB( CoD.yellowGlow.r, CoD.yellowGlow.g, CoD.yellowGlow.b )
	self.xpReward:setFont( xpRewardFont )
	self.xpReward:setText( "" )
	imagePreviewBackground:addElement( self.xpReward )
	self.challengeImageContainer = LUI.UIElement.new()
	self.challengeImageContainer:setLeftRight( true, true, 0, 0 )
	self.challengeImageContainer:setTopBottom( true, true, 0, 0 )
	imagePreviewBackground:addElement( self.challengeImageContainer )
	self.challengeImage = LUI.UIImage.new()
	self.challengeImage:setLeftRight( true, true, 0, 0 )
	self.challengeImage:setTopBottom( true, true, 0, 0 )
	self.challengeImage:setAlpha( 0 )
	self.challengeImageContainer:addElement( self.challengeImage )
	local lockImageSize = CoD.CACUtility.ButtonGridLockImageSize
	self.lockImage = LUI.UIImage.new()
	self.lockImage:setLeftRight( false, false, -lockImageSize / 2, lockImageSize / 2 )
	self.lockImage:setTopBottom( false, false, -lockImageSize / 2, lockImageSize / 2 )
	self.lockImage:setAlpha( 0 )
	self.lockImage:setImage( RegisterMaterial( CoD.CACUtility.LockImageMaterial ) )
	self.challengeImageContainer:addElement( self.lockImage )
	imagePreviewBackground:addElement( CoD.BorderT6.new( 1, 1, 1, 1, 0.1, nil, nil, true, "menu_sp_cac_single_big_dip" ) )
end

CoD.WeaponMasteryChallenges.AddMasteryChallengeButtons = function ( self, controller, weaponIndex, weaponSlot )
	local weaponItemIndex = weaponIndex
	self.weaponItemIndex = weaponItemIndex
	local weaponref = Engine.GetItemName( weaponIndex )
	local buttonToGainFocus = nil
	local challengeInfo = Engine.GetMasteryChallengesList( controller, weaponIndex )
	local index = 1
	if not challengeInfo then
		return 
	end
	for key, challenge in pairs( challengeInfo.MasteryChallenges ) do
		local row = challenge.challengeRow
		local tableNumber = challenge.tableNum
		local f4_local3 = ""
		local f4_local4 = ""
		local f4_local5 = -1
		if row ~= nil then
			local tableName = "mp/statsmilestones" .. tableNumber + 1 .. ".csv"
			local maxVal = Engine.TableLookupGetColumnValueForRow( tableName, row, 2 )
			local localizedTierText = CoD.GetLocalizedTierText( controller, tableName, row )
			f4_local3 = Engine.Localize( Engine.TableLookupGetColumnValueForRow( tableName, row, 5 ), "", weaponref, localizedTierText )
			f4_local4 = Engine.Localize( Engine.TableLookupGetColumnValueForRow( tableName, row, 5 ) .. "_DESC", "", weaponref, localizedTierText )
			f4_local5 = Engine.TableLookupGetColumnValueForRow( tableName, row, 6 )
		end
		local contentButton = CoD.ChallengeGridButton.new( controller, index, f4_local3, challenge.imageID, challenge.isEmblem )
		contentButton.challengeName = f4_local3
		contentButton.challengeDesc = f4_local4
		contentButton.imageID = challenge.imageID
		contentButton.isEmblem = challenge.isEmblem
		contentButton.isLocked = challenge.isLocked
		contentButton.xpReward = f4_local5
		contentButton.actionSFX = nil
		if contentButton.isLocked then
			contentButton:setLocked( true )
		end
		self.contentGrid:addButton( contentButton )
		if not buttonToGainFocus then
			buttonToGainFocus = contentButton
		end
		index = index + 1
	end
	buttonToGainFocus:processEvent( {
		name = "gain_focus",
		controller = controller
	} )
end

CoD.WeaponMasteryChallenges.UpdateChallengeImagePreview = function ( self, button )
	local imageID = button.imageID
	local xpReward = button.xpReward
	local isEmblem = button.isEmblem
	local isLocked = button.isLocked
	self.imagePreviewTitle:setText( Engine.Localize( "MPUI_REWARDS" ) )
	self.xpReward:setText( Engine.Localize( "RANK_XP", xpReward ) )
	local imageWidth = 75
	local imageHeight = 75
	local topOffset = 10
	if isEmblem then
		self.challengeImage:setupDrawEmblemById( imageID )
	else
		self.challengeImage:setupDrawBackgroundById( imageID )
		imageWidth = 280
		imageHeight = 70
	end
	if isLocked then
		self.lockImage:setAlpha( 1 )
	else
		self.lockImage:setAlpha( 0 )
	end
	self.challengeImageContainer:setLeftRight( false, false, -imageWidth / 2, imageWidth / 2 )
	self.challengeImageContainer:setTopBottom( true, false, topOffset, topOffset + imageHeight )
	self.challengeImage:beginAnimation( "show" )
	self.challengeImage:setAlpha( 1 )
end

CoD.WeaponMasteryChallenges.ButtonHighlighted = function ( self, event )
	if event.contentIndex then
		self.challengeTitle:setText( event.button.challengeName )
		self.challengeDescription:setText( event.button.challengeDesc )
		CoD.WeaponMasteryChallenges.UpdateChallengeImagePreview( self, event.button )
	else
		self.challengeTitle:setText( Engine.Localize( "MPUI_NONE_CAPS" ) )
		self.challengeDescription:setText( "" )
	end
end

