require( "ui_mp.T6.CamoGridButton" )
require( "ui_mp.T6.Menus.ChallengeProgressBar" )

CoD.WeaponCamoChallenges = {}
CoD.WeaponCamoChallenges.GridTop = 60
CoD.WeaponCamoChallenges.GridColumns = 6
CoD.WeaponCamoChallenges.GridItemSpacing = 8
CoD.WeaponCamoChallenges.GridItemWidth = (CoD.Menu.Width - CoD.WeaponCamoChallenges.GridItemSpacing * (CoD.WeaponCamoChallenges.GridColumns - 1)) / CoD.WeaponCamoChallenges.GridColumns
CoD.WeaponCamoChallenges.GridItemHeight = 50 + CoD.ContentGridButton.TitleHeight + 20
LUI.createMenu.WeaponCamoChallenges = function ( controller )
	local self = CoD.Menu.New( "WeaponCamoChallenges" )
	self:addLargePopupBackground()
	self:setOwner( controller )
	self:setPreviousMenu( "WeaponChallengeType" )
	local weaponIndex = CoD.perController[controller].weaponIndex
	local weaponSlot = CoD.perController[controller].weaponSlot
	self:addBackButton()
	self:registerEventHandler( "content_button_highlighted", CoD.WeaponCamoChallenges.ContentButtonHighlighted )
	local top = 0
	local titleText = Engine.Localize( Engine.GetItemName( weaponIndex ) ) .. " " .. Engine.Localize( "MPUI_CAMO_CAPS" )
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
	self.contentGrid = CoD.ContentGrid.new( CoD.WeaponCamoChallenges.GridColumns, gridDefaultAnimState, CoD.WeaponCamoChallenges.GridItemWidth, CoD.WeaponCamoChallenges.GridItemHeight, CoD.WeaponCamoChallenges.GridItemSpacing )
	self:addElement( self.contentGrid )
	local rowCount = 4
	top = -30 + top + CoD.WeaponCamoChallenges.GridItemHeight * rowCount + CoD.WeaponCamoChallenges.GridItemSpacing * (rowCount - 1) + 3 + CoD.HintText.Height + 5
	local infoContainer = LUI.UIElement.new()
	infoContainer:setLeftRight( true, true, 0, 0 )
	infoContainer:setTopBottom( true, true, top, 0 )
	self:addElement( infoContainer )
	local infoContainerTop = 0
	self.camoTitle = LUI.UIText.new()
	self.camoTitle:setLeftRight( true, false, 0, 1 )
	self.camoTitle:setTopBottom( true, false, infoContainerTop, infoContainerTop + CoD.textSize.Big )
	self.camoTitle:setFont( CoD.fonts.Big )
	self.camoTitle:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	infoContainer:addElement( self.camoTitle )
	infoContainerTop = infoContainerTop + CoD.textSize.Big
	self.camoDescription = LUI.UIText.new()
	self.camoDescription:setLeftRight( true, false, 0, 0.4 * CoD.Menu.Width )
	self.camoDescription:setTopBottom( true, false, infoContainerTop, infoContainerTop + CoD.textSize.Default )
	self.camoDescription:setAlignment( LUI.Alignment.Left )
	self.camoDescription:setFont( CoD.fonts.Default )
	self.camoDescription:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	self.camoDescription:setAlpha( 0.4 )
	infoContainer:addElement( self.camoDescription )
	infoContainerTop = infoContainerTop + CoD.textSize.Default * 2 + 10
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
	infoContainer:addElement( self.progressBar )
	self.weaponContainer = LUI.UIElement.new()
	self.weaponContainer:setLeftRight( false, true, -(CoD.Menu.Width / 2) + 10, 0 )
	self.weaponContainer:setTopBottom( true, true, 0, 0 )
	infoContainer:addElement( self.weaponContainer )
	local weaponImageWidth = 280
	local weaponImageTop = -70
	local weaponImageHeight = weaponImageWidth / 2
	self.weaponImage = LUI.UIImage.new()
	self.weaponImage:setLeftRight( false, true, -weaponImageWidth, 0 )
	self.weaponImage:setTopBottom( true, false, weaponImageTop, weaponImageTop + weaponImageHeight )
	self.weaponContainer:addElement( self.weaponImage )
	CoD.WeaponCamoChallenges.AddCamoReward( self, self.weaponContainer )
	CoD.WeaponCamoChallenges.AddCamos( self, controller, weaponIndex, weaponSlot )
	return self
end

CoD.WeaponCamoChallenges.AddCamoReward = function ( self, weaponContainer )
	local camoPreviewSize = 100
	local camoPreviewLeft = -80
	local camoPreviewBottom = -CoD.ButtonPrompt.Height - 22
	local camoPreviewHeight = camoPreviewSize + 30
	local camoPreviewBGWidth = camoPreviewSize * 2 + 20
	local camoPreviewBackground = LUI.UIElement.new()
	camoPreviewBackground:setLeftRight( true, false, camoPreviewLeft, camoPreviewLeft + camoPreviewBGWidth )
	camoPreviewBackground:setTopBottom( false, true, camoPreviewBottom - camoPreviewHeight, camoPreviewBottom )
	weaponContainer:addElement( camoPreviewBackground )
	local camoPreviewTitleFontName = "Default"
	local camoPreviewTitleFont = CoD.fonts[camoPreviewTitleFontName]
	local camoPreviewTitleFontHeight = CoD.textSize[camoPreviewTitleFontName]
	self.camoPreviewTitle = LUI.UIText.new()
	self.camoPreviewTitle:setLeftRight( true, false, 0, 1 )
	self.camoPreviewTitle:setTopBottom( true, false, -camoPreviewTitleFontHeight, 0 )
	self.camoPreviewTitle:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	self.camoPreviewTitle:setFont( camoTitleFont )
	self.camoPreviewTitle:setAlignment( LUI.Alignment.Left )
	self.camoPreviewTitle:setText( "" )
	camoPreviewBackground:addElement( self.camoPreviewTitle )
	local inset = 20
	local imageHeight = 70
	self.camoImage = LUI.UIImage.new()
	self.camoImage:setLeftRight( true, true, inset, -inset )
	self.camoImage:setTopBottom( true, false, 12, 12 + imageHeight )
	self.camoImage:setAlpha( 0 )
	camoPreviewBackground:addElement( self.camoImage )
	local xpRewardFont = "Default"
	local xpRewardHeight = CoD.textSize[xpRewardFont]
	local xpRewardFont = CoD.fonts[xpRewardFont]
	self.xpRewardText = LUI.UIText.new()
	self.xpRewardText:setLeftRight( true, true, 0, 0 )
	self.xpRewardText:setTopBottom( false, true, -10 - xpRewardHeight, -10 )
	self.xpRewardText:setAlignment( LUI.Alignment.Center )
	self.xpRewardText:setRGB( CoD.yellowGlow.r, CoD.yellowGlow.g, CoD.yellowGlow.b )
	camoPreviewBackground:addElement( self.xpRewardText )
	local lockImageSize = 32
	self.lockImage = LUI.UIImage.new()
	self.lockImage:setLeftRight( true, false, 5, 5 + lockImageSize )
	self.lockImage:setTopBottom( false, true, -10 - lockImageSize, -10 )
	self.lockImage:setImage( RegisterMaterial( CoD.CACUtility.LockImageMaterial ) )
	self.lockImage:hide()
	camoPreviewBackground:addElement( self.lockImage )
	camoPreviewBackground:addElement( CoD.BorderDip.new( 1, 1, 1, 1, 0.05, nil, camoPreviewBGWidth, 1 ) )
	weaponContainer:addElement( camoPreviewBackground )
end

CoD.WeaponCamoChallenges.UpdateCamoPreview = function ( self, button, controller )
	self.lockImage:hide()
	self.camoImage:hide()
	self.camoPreviewTitle:setText( "" )
	self.xpRewardText:setText( "" )
	local inset = 20
	self.camoImage:setLeftRight( true, true, inset, -inset )
	if button.lockImage then
		self.camoPreviewTitle:setText( Engine.Localize( "MPUI_REWARDS" ) )
		self.lockImage:show()
		if button.rewardXP then
			self.xpRewardText:setText( Engine.Localize( "RANK_XP", button.rewardXP ) )
		end
	end
	self.camoImage:show()
	self.camoImage:setImage( RegisterMaterial( button.camoImageName ) )
end

CoD.WeaponCamoChallenges.IsCamoHidden = function ( weaponOption )
	local camoName = Engine.TableLookup( nil, CoD.attachmentTable, 1, "camo", 0, weaponOption, 4 )
	if string.find( camoName, "elite" ) and not Engine.IsEliteAvailable() then
		return true
	else
		local hiddenValue = tonumber( Engine.TableLookup( nil, CoD.attachmentTable, 1, "camo", 0, weaponOption, 9 ) )
		if not hiddenValue then
			return false
		else
			return hiddenValue > 1
		end
	end
end

CoD.WeaponCamoChallenges.AddCamos = function ( self, controller, weaponIndex, weaponSlot )
	local weaponItemIndex = weaponIndex
	self.weaponItemIndex = weaponItemIndex
	self.weaponImage:registerAnimationState( "weapon_image", {
		material = RegisterMaterial( Engine.GetItemImage( weaponItemIndex ) .. "_big" )
	} )
	self.weaponImage:animateToState( "weapon_image" )
	local numCamos = Engine.GetNumWeaponOptionsForGroup( Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO )
	local buttonToGainFocus = nil
	for camoIndex = 1, numCamos - 1, 1 do
		local weaponOption = Engine.GetWeaponOptionGroupIndex( camoIndex, Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO )
		local isCamoMTX = CoD.CACUtility.IsWeaponOptionMTX( weaponOption )
		if not isCamoMTX then
			local showCamoButton = false
			local isCamoHidden = CoD.WeaponCamoChallenges.IsCamoHidden( weaponOption )
			local row, tableNumber = Engine.GetChallengeForItemOption( weaponItemIndex, weaponOption )
			if row ~= nil then
				local tableName = "mp/statsmilestones" .. tableNumber + 1 .. ".csv"
				local weaponRef = Engine.GetItemName( weaponItemIndex )
				local challengeValue = Engine.GetItemOptionChallengeValue( controller, weaponItemIndex, weaponOption )
				local maxVal = Engine.TableLookupGetColumnValueForRow( tableName, row, 2 )
				local statName = Engine.TableLookupGetColumnValueForRow( tableName, row, 4 )
				showCamoButton = true
				if not (not isCamoHidden or challengeValue and challengeValue >= tonumber( maxVal )) or statName == "digital_unlock" then
					showCamoButton = false
				end
			end
			if showCamoButton or camoIndex == 0 then
				local contentButton = CoD.CamoGridButton.new( weaponItemIndex, camoIndex )
				contentButton.actionSFX = nil
				self.contentGrid:addButton( contentButton )
				if not buttonToGainFocus then
					buttonToGainFocus = contentButton
				end
			end
		end
	end
	self:dispatchEventToChildren( {
		name = "update_class",
		controller = controller,
		challengeMenu = true
	} )
	if buttonToGainFocus then
		buttonToGainFocus:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
end

CoD.WeaponCamoChallenges.ContentButtonHighlighted = function ( self, event )
	if event.contentIndex then
		self.camoTitle:setText( event.button.nameText )
		if event.hintText ~= nil then
			self.camoDescription:setText( event.hintText )
		else
			self.camoDescription:setText( "" )
		end
		self.progressBar:hide()
		if event.button.showProgressBar and event.button.challengeValue and event.button.maxVal then
			self.progressBar:show()
			self.progressBar:update( event.button.challengeValue, event.button.maxVal )
		end
		CoD.WeaponCamoChallenges.UpdateCamoPreview( self, event.button, event.controller )
	else
		self.camoTitle:setText( Engine.Localize( "MPUI_NONE_CAPS" ) )
		self.camoDescription:setText( "" )
	end
end

