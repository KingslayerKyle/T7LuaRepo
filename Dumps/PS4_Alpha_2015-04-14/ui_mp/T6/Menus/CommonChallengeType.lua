require( "ui_mp.T6.ChallengeGridButton" )

CoD.CommonChallengeType = {}
CoD.CommonChallengeType.imagePreviewLineMaterialName = "menu_mp_cac_attach_line"
CoD.CommonChallengeType.GridTop = 60
CoD.CommonChallengeType.GridItemSpacing = 10
CoD.CommonChallengeType.GridColumns = 4
CoD.CommonChallengeType.GridItemWidth = (CoD.Menu.Width - CoD.CommonChallengeType.GridItemSpacing * (CoD.CommonChallengeType.GridColumns - 1)) / CoD.CommonChallengeType.GridColumns
CoD.CommonChallengeType.GridItemHeight = 50 + CoD.ContentGridButton.TitleHeight + 12
LUI.createMenu.CommonChallengeType = function ( controller )
	local self = CoD.Menu.New( "CommonChallengeType" )
	self:addLargePopupBackground()
	self:setOwner( controller )
	self:addBackButton()
	local userData = CoD.perController[controller].CommonChallengeTypeData
	self.category = userData.category
	if userData.gamemodeName then
		self.gamemodeName = userData.gamemodeName
	end
	local headerText = ""
	if userData.titleText then
		headerText = userData.titleText
	else
		headerText = Engine.Localize( "MENU_CHALLENGE_CATEGORY_" .. userData.category )
	end
	self:addTitle( Engine.ToUpper( headerText ) )
	CoD.CommonChallengeType.SetupElements( self )
	return self
end

CoD.CommonChallengeType.SetupElements = function ( self )
	self.menuContainer = LUI.UIElement.new()
	self.menuContainer:setLeftRight( true, true, 0, 0 )
	self.menuContainer:setTopBottom( true, true, 0, 0 )
	self:addElement( self.menuContainer )
	self.menuContainer.m_ownerController = self.m_ownerController
	self.menuContainer:registerEventHandler( "content_button_highlighted", CoD.CommonChallengeType.ButtonHighlighted )
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
	self.menuContainer.contentGrid = CoD.ContentGrid.new( CoD.CommonChallengeType.GridColumns, gridDefaultAnimState, CoD.CommonChallengeType.GridItemWidth, CoD.CommonChallengeType.GridItemHeight, CoD.CommonChallengeType.GridItemSpacing )
	self.menuContainer:addElement( self.menuContainer.contentGrid )
	local rowCount = 4
	local infoContainer = LUI.UIElement.new()
	infoContainer:setLeftRight( true, true, 0, 0 )
	infoContainer:setTopBottom( false, true, -200, 0 )
	self.menuContainer:addElement( infoContainer )
	local infoContainerTop = 0
	self.menuContainer.challengeTitle = LUI.UIText.new()
	self.menuContainer.challengeTitle:setLeftRight( true, false, 0, 1 )
	self.menuContainer.challengeTitle:setTopBottom( true, false, infoContainerTop, infoContainerTop + CoD.textSize.Big )
	self.menuContainer.challengeTitle:setFont( CoD.fonts.Big )
	self.menuContainer.challengeTitle:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	infoContainer:addElement( self.menuContainer.challengeTitle )
	infoContainerTop = infoContainerTop + CoD.textSize.Big
	self.menuContainer.challengeDescription = LUI.UIText.new()
	self.menuContainer.challengeDescription:setLeftRight( true, false, 0, CoD.Menu.Width / 2 - 50 )
	self.menuContainer.challengeDescription:setTopBottom( true, false, infoContainerTop, infoContainerTop + CoD.textSize.ExtraSmall )
	self.menuContainer.challengeDescription:setAlignment( LUI.Alignment.Left )
	self.menuContainer.challengeDescription:setFont( CoD.fonts.ExtraSmall )
	self.menuContainer.challengeDescription:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	self.menuContainer.challengeDescription:setAlpha( 0.4 )
	infoContainer:addElement( self.menuContainer.challengeDescription )
	infoContainerTop = infoContainerTop + CoD.textSize.ExtraSmall + 22
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
	self.menuContainer.progressBar = CoD.ChallengeProgressBar.new( progressBarDefaultAnimState, progressBarWidth )
	infoContainer:addElement( self.menuContainer.progressBar )
	local completeTextFontName = "Condensed"
	local completeTextFont = CoD.fonts[completeTextFontName]
	local completeTextFontHeight = CoD.textSize[completeTextFontName]
	local completeTextContainer = LUI.UIElement.new()
	completeTextContainer:setLeftRight( true, false, 0, progressBarWidth )
	completeTextContainer:setTopBottom( true, false, infoContainerTop, infoContainerTop + completeTextFontHeight )
	self.menuContainer.completeTextContainer = completeTextContainer
	infoContainer:addElement( self.menuContainer.completeTextContainer )
	local tierDescTextFontName = "ExtraSmall"
	local tierDescTextFont = CoD.fonts[tierDescTextFontName]
	local tierDescTextFontHeight = CoD.textSize[tierDescTextFontName]
	local tierDescText = LUI.UIText.new()
	local bottomOffset = 35
	tierDescText:setLeftRight( true, false, 0, progressBarWidth )
	tierDescText:setTopBottom( false, true, -bottomOffset - tierDescTextFontHeight, -bottomOffset )
	tierDescText:setFont( tierDescTextFont )
	tierDescText:setRGB( CoD.gray.r, CoD.gray.g, CoD.gray.b )
	self.menuContainer.tierDescText = tierDescText
	infoContainer:addElement( self.menuContainer.tierDescText )
	local completeText = LUI.UIText.new()
	completeText:setLeftRight( true, true, 0, 0 )
	completeText:setTopBottom( true, true, 0, 0 )
	completeText:setText( Engine.Localize( "MPUI_COMPLETE_CAPS" ) )
	completeText:setFont( completeTextFont )
	completeText:setAlignment( LUI.Alignment.Left )
	completeText:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	self.menuContainer.completeText = completeText
	completeTextContainer:addElement( completeText )
	completeText:hide()
	local rightContainer = LUI.UIElement.new()
	rightContainer:setLeftRight( false, true, -(CoD.Menu.Width / 2) + 10, 0 )
	rightContainer:setTopBottom( true, true, 0, 0 )
	infoContainer:addElement( rightContainer )
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
	self.menuContainer.imagePreviewTitle = LUI.UIText.new()
	self.menuContainer.imagePreviewTitle:setLeftRight( true, false, 0, 1 )
	self.menuContainer.imagePreviewTitle:setTopBottom( true, false, -imagePreviewTitleFontHeight, 0 )
	self.menuContainer.imagePreviewTitle:setRGB( CoD.gray.r, CoD.gray.g, CoD.gray.b )
	self.menuContainer.imagePreviewTitle:setFont( imagePreviewTitleFont )
	self.menuContainer.imagePreviewTitle:setAlignment( LUI.Alignment.Left )
	self.menuContainer.imagePreviewTitle:setText( "" )
	imagePreviewBackground:addElement( self.menuContainer.imagePreviewTitle )
	local xpRewardFontName = "Default"
	local xpRewardFont = CoD.fonts[imagePreviewTitleFontName]
	local xpRewardFontHeight = CoD.textSize[imagePreviewTitleFontName]
	self.menuContainer.xpReward = LUI.UIText.new()
	self.menuContainer.xpReward:setLeftRight( true, true, 0, 0 )
	self.menuContainer.xpReward:setTopBottom( false, true, -10 - xpRewardFontHeight, -10 )
	self.menuContainer.xpReward:setAlignment( LUI.Alignment.Center )
	self.menuContainer.xpReward:setRGB( CoD.yellowGlow.r, CoD.yellowGlow.g, CoD.yellowGlow.b )
	self.menuContainer.xpReward:setFont( xpRewardFont )
	self.menuContainer.xpReward:setText( "" )
	imagePreviewBackground:addElement( self.menuContainer.xpReward )
	self.menuContainer.challengeImageContainer = LUI.UIElement.new()
	self.menuContainer.challengeImageContainer:setLeftRight( true, true, 0, 0 )
	self.menuContainer.challengeImageContainer:setTopBottom( true, true, 0, 0 )
	imagePreviewBackground:addElement( self.menuContainer.challengeImageContainer )
	self.menuContainer.challengeImage = LUI.UIImage.new()
	self.menuContainer.challengeImage:setLeftRight( true, true, 0, 0 )
	self.menuContainer.challengeImage:setTopBottom( true, true, 0, 0 )
	self.menuContainer.challengeImage:setAlpha( 0 )
	self.menuContainer.challengeImageContainer:addElement( self.menuContainer.challengeImage )
	local lockImageSize = 32
	local leftOffset = 5
	local bottomOffset = 5
	self.menuContainer.lockImage = LUI.UIImage.new()
	self.menuContainer.lockImage:setLeftRight( true, false, leftOffset, leftOffset + lockImageSize )
	self.menuContainer.lockImage:setTopBottom( false, true, -bottomOffset - lockImageSize, -bottomOffset )
	self.menuContainer.lockImage:setAlpha( 0 )
	self.menuContainer.lockImage:setImage( RegisterMaterial( CoD.CACUtility.LockImageMaterial ) )
	imagePreviewBackground:addElement( self.menuContainer.lockImage )
	imagePreviewBackground:addElement( CoD.BorderT6.new( 1, 1, 1, 1, 0.1, nil, nil, true, "menu_sp_cac_single_big_dip" ) )
	CoD.CommonChallengeType.AddItems( self.menuContainer, self.m_ownerController, self.category, self.gamemodeName )
end

CoD.ChallengeInfoComparisonFunction = function ( a, b )
	return tonumber( a.challengeRow ) < tonumber( b.challengeRow )
end

CoD.CommonChallengeType.AddItems = function ( self, controller, category, gamemodeName )
	local challengeInfo = Engine.GetChallengeInfoForImages( controller, category )
	if not challengeInfo then
		return 
	end
	table.sort( challengeInfo, CoD.ChallengeInfoComparisonFunction )
	local currentStats = CoD.GetPlayerStats( controller )
	local rank = currentStats.PlayerStatsList.RANK.StatValue:get()
	local plevel = currentStats.PlayerStatsList.PLEVEL.StatValue:get()
	local buttonToGainFocus = nil
	local index = 1
	for key, currInfo in ipairs( challengeInfo ) do
		local challengeRow = currInfo.challengeRow
		local tableNumber = currInfo.tableNum
		local f4_local9 = -1
		local f4_local11 = 0
		local f4_local12 = 0
		local f4_local3 = nil
		local f4_local5 = -1
		local challengeType = currInfo.challengeType
		local f4_local13 = ""
		local f4_local6 = ""
		local tierText, f4_local10, f4_local15, f4_local14, f4_local7, f4_local8, f4_local4 = nil
		if challengeRow ~= nil then
			f4_local3 = "mp/statsmilestones" .. tableNumber + 1 .. ".csv"
			f4_local4 = tonumber( Engine.TableLookupGetColumnValueForRow( f4_local3, challengeRow, 1 ) )
			f4_local5 = Engine.TableLookupGetColumnValueForRow( f4_local3, challengeRow, 2 )
			f4_local6 = Engine.TableLookupGetColumnValueForRow( f4_local3, challengeRow, 4 )
			f4_local7 = Engine.TableLookupGetColumnValueForRow( f4_local3, challengeRow, 5 )
			f4_local8 = Engine.TableLookupGetColumnValueForRow( f4_local3, challengeRow, 5 ) .. "_DESC"
			f4_local9 = Engine.TableLookupGetColumnValueForRow( f4_local3, challengeRow, 6 )
			local unlockLevelStr = Engine.TableLookupGetColumnValueForRow( f4_local3, challengeRow, 11 )
			local unlockPLevelStr = Engine.TableLookupGetColumnValueForRow( f4_local3, challengeRow, 14 )
			local currentChallengeTier = -1
			local challengeName, challengeDesc = nil
			f4_local10 = CoD.GetLocalizedTierText( controller, f4_local3, challengeRow )
			if unlockLevelStr ~= "" then
				f4_local11 = tonumber( unlockLevelStr )
			end
			if unlockPLevelStr ~= "" then
				f4_local12 = tonumber( unlockPLevelStr )
			end
			local isLockedByChallenge = currInfo.isLocked
			local isLockedByLevel = false
			if challengeType == CoD.MILESTONE_WEAPON then
				f4_local13 = Engine.Localize( Engine.GetItemName( currInfo.itemIndex ) )
			elseif challengeType == CoD.MILESTONE_GROUP then
				f4_local13 = Engine.Localize( "MPUI_" .. Engine.GetItemGroupByIndex( currInfo.itemIndex ) )
			elseif challengeType == CoD.MILESTONE_ATTACHMENTS then
				f4_local13 = Engine.Localize( Engine.GetAttachmentNameByIndex( currInfo.itemIndex ) )
			elseif challengeType == CoD.MILESTONE_GAMEMODE then
				if gamemodeName then
					f4_local13 = gamemodeName
				else
					f4_local13 = Engine.Localize( "MPUI_" .. Engine.GetGametypeName( currInfo.itemIndex ) )
				end
			elseif gamemodeName then
				f4_local13 = gamemodeName
			end
			if f4_local10 ~= "" then
				f4_local14 = true
			end
			if plevel < f4_local12 then
				isLockedByLevel = true
				challengeDesc = Engine.Localize( "CLASS_PRESTIGE_UNLOCK_DESC", f4_local12 )
			elseif rank < f4_local11 and plevel <= f4_local12 then
				isLockedByLevel = true
				local rankName = Engine.GetRankName( f4_local11 )
				challengeDesc = Engine.Localize( "MENU_UNLOCKED_AT", rankName, f4_local11 + 1 )
			end
			if f4_local14 and isLockedByLevel then
				f4_local10 = Engine.Localize( "CHALLENGE_TIER_" .. 0 )
			end
			local currentChallengeRow = currInfo.currentChallengeRow
			if currentChallengeRow and f4_local3 then
				f4_local15 = true
				f4_local8 = Engine.TableLookupGetColumnValueForRow( f4_local3, currentChallengeRow, 5 ) .. "_DESC"
				if f4_local14 then
					currentChallengeTier = tonumber( Engine.TableLookupGetColumnValueForRow( f4_local3, currentChallengeRow, 1 ) )
					f4_local5 = Engine.TableLookupGetColumnValueForRow( f4_local3, currentChallengeRow, 2 )
					f4_local10 = CoD.GetLocalizedTierText( controller, f4_local3, currentChallengeRow )
				end
			end
			challengeName = Engine.Localize( f4_local7, "", f4_local13, f4_local10 )
			if not challengeDesc then
				challengeDesc = Engine.Localize( f4_local8, f4_local5, f4_local13 )
			end
			local showCurrentChallenge = true
			local emblemOrBacking = "background"
			if currInfo.isEmblem then
				emblemOrBacking = "icon"
			end
			local isHidden = tonumber( Engine.TableLookup( controller, "gamedata/emblems/emblemsOrBackings.csv", 0, emblemOrBacking, 1, currInfo.imageID, 8 ) )
			if isHidden and isHidden == 1 and (isLockedByChallenge or isLockedByLevel) then
				showCurrentChallenge = false
			end
			if showCurrentChallenge then
				local contentButton = CoD.ChallengeGridButton.new( controller, index, challengeName, currInfo.imageID, currInfo.isEmblem )
				contentButton.challengeDesc = challengeDesc
				contentButton.challengeName = challengeName
				contentButton.xpReward = f4_local9
				contentButton.maxVal = tonumber( f4_local5 )
				contentButton.currVal = currInfo.currChallengeStatValue
				contentButton.imageID = currInfo.imageID
				contentButton.isEmblem = currInfo.isEmblem
				contentButton.isLocked = isLockedByChallenge or isLockedByLevel
				contentButton.challengeUnlocked = f4_local15
				contentButton.statName = f4_local6
				contentButton.isTieredChallenge = f4_local14
				contentButton.currentChallengeTier = currentChallengeTier
				contentButton.maxChallengeTier = f4_local4
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
		end
	end
	if buttonToGainFocus then
		buttonToGainFocus:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
end

CoD.CommonChallengeType.UpdateChallengeImagePreview = function ( self, imageID, xpReward, isEmblem, isLocked )
	self.imagePreviewTitle:setText( Engine.Localize( "MPUI_REWARDS" ) )
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
		self.xpReward:setText( Engine.Localize( "RANK_XP", xpReward ) )
	else
		self.lockImage:setAlpha( 0 )
		self.xpReward:setText( "" )
	end
	self.challengeImageContainer:setLeftRight( false, false, -imageWidth / 2, imageWidth / 2 )
	self.challengeImageContainer:setTopBottom( true, false, topOffset, topOffset + imageHeight )
	self.challengeImage:setAlpha( 1 )
end

CoD.CommonChallengeType.HideProgressBarForStatName = function ( statName )
	if statName == "challlenges" or statName == "primary_mastery" or statName == "secondary_mastery" or statName == "weapons_mastery" then
		return true
	else
		
	end
end

CoD.CommonChallengeType.ButtonHighlighted = function ( self, event )
	if event.contentIndex then
		local showProgressBar = true
		local button = event.button
		self.challengeTitle:setText( button.challengeName )
		self.challengeDescription:setText( button.challengeDesc )
		self.progressBar:hide()
		self.completeText:hide()
		self.tierDescText:hide()
		if CoD.CommonChallengeType.HideProgressBarForStatName( button.statName ) then
			showProgressBar = false
		end
		local currVal = button.currVal
		local maxVal = button.maxVal
		if button.isLocked and button.challengeUnlocked then
			if maxVal > 1 and showProgressBar and currVal < maxVal then
				self.progressBar:show()
				self.progressBar:update( currVal, maxVal )
			end
			local isTieredChallenge = button.isTieredChallenge
			local currentChallengeTier = button.currentChallengeTier
			local maxChallengeTier = button.maxChallengeTier
			if isTieredChallenge and currentChallengeTier and maxChallengeTier and currentChallengeTier ~= -1 and maxChallengeTier > 0 then
				self.tierDescText:show()
				self.tierDescText:setText( Engine.Localize( "MENU_CHALLENGE_TIER_DESC", currentChallengeTier + 1, maxChallengeTier + 1, maxChallengeTier + 1 ) )
			end
		elseif not button.isLocked then
			self.completeText:show()
		end
		CoD.CommonChallengeType.UpdateChallengeImagePreview( self, event.button.imageID, event.button.xpReward, event.button.isEmblem, event.button.isLocked )
	else
		self.challengeTitle:setText( Engine.Localize( "MPUI_NONE_CAPS" ) )
		self.challengeDescription:setText( "" )
	end
end

