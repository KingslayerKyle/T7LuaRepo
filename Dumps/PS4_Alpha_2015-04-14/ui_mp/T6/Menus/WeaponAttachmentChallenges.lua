require( "ui.T6.AllocationBar" )
require( "ui.T6.WeaponLevel" )

CoD.WeaponAttachmentChallenges = {}
CoD.WeaponAttachmentChallenges.SlotListLineMaterialName = "menu_mp_cac_attach_line"
CoD.WeaponAttachmentChallenges.GridTop = 60
CoD.WeaponAttachmentChallenges.GridColumns = 6
CoD.WeaponAttachmentChallenges.GridItemSpacing = 8
CoD.WeaponAttachmentChallenges.GridItemWidth = (CoD.Menu.Width - CoD.WeaponAttachmentChallenges.GridItemSpacing * (CoD.WeaponAttachmentChallenges.GridColumns - 1)) / CoD.WeaponAttachmentChallenges.GridColumns
CoD.WeaponAttachmentChallenges.GridItemHeight = 64 + CoD.ContentGridButton.TitleHeight + 10
CoD.WeaponAttachmentChallenges.SlotListSize = 64
CoD.WeaponAttachmentChallenges.SlotListSpacing = 20
CoD.WeaponAttachmentChallenges.SlotListLeft = 5
LUI.createMenu.WeaponAttachmentChallenges = function ( controller )
	local self = CoD.Menu.New( "WeaponAttachmentChallenges" )
	self:addLargePopupBackground()
	self:setOwner( controller )
	self:setPreviousMenu( "WeaponChallengeType" )
	self:addBackButton()
	local weaponIndex = CoD.perController[controller].weaponIndex
	self:registerEventHandler( "content_button_highlighted", CoD.WeaponAttachmentChallenges.ContentButtonHighlighted )
	local top = 0
	local titleText = Engine.Localize( Engine.GetItemName( weaponIndex ) ) .. " " .. Engine.Localize( "MPUI_ATTACHMENTS_CAPS" )
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
	self.contentGrid = CoD.ContentGrid.new( CoD.WeaponAttachmentChallenges.GridColumns, gridDefaultAnimState, CoD.WeaponAttachmentChallenges.GridItemWidth, CoD.WeaponAttachmentChallenges.GridItemHeight, CoD.WeaponAttachmentChallenges.GridItemSpacing )
	self:addElement( self.contentGrid )
	local numAttachments = Engine.GetNumAttachments( weaponIndex ) - 1
	local rowCount = math.ceil( numAttachments / CoD.WeaponAttachmentChallenges.GridColumns )
	top = top + CoD.WeaponAttachmentChallenges.GridItemHeight * 3 + CoD.WeaponAttachmentChallenges.GridItemSpacing * 2 + 3 + CoD.HintText.Height + 5
	local infoContainer = LUI.UIElement.new()
	infoContainer:setLeftRight( true, true, 0, 0 )
	infoContainer:setTopBottom( true, true, top, 0 )
	self:addElement( infoContainer )
	local infoContainerTop = 0
	self.attachmentTitle = LUI.UIText.new()
	self.attachmentTitle:setLeftRight( true, false, 0, 1 )
	self.attachmentTitle:setTopBottom( true, false, infoContainerTop, infoContainerTop + CoD.textSize.Big )
	self.attachmentTitle:setFont( CoD.fonts.Big )
	self.attachmentTitle:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	infoContainer:addElement( self.attachmentTitle )
	infoContainerTop = infoContainerTop + CoD.textSize.Big
	self.attachmentDescription = LUI.UIText.new()
	self.attachmentDescription:setLeftRight( true, false, 0, CoD.Menu.Width / 2 )
	self.attachmentDescription:setTopBottom( true, false, infoContainerTop, infoContainerTop + CoD.textSize.Default )
	self.attachmentDescription:setAlignment( LUI.Alignment.Left )
	self.attachmentDescription:setFont( CoD.fonts.Default )
	self.attachmentDescription:setRGB( CoD.offWhite.r, CoD.offWhite.g, CoD.offWhite.b )
	self.attachmentDescription:setAlpha( 0.4 )
	infoContainer:addElement( self.attachmentDescription )
	infoContainerTop = infoContainerTop + CoD.textSize.Default * 2 + 10
	local attributeWidth = CoD.Menu.Width / 2
	local weaponAttributesDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = attributeWidth,
		topAnchor = true,
		bottomAnchor = true,
		top = infoContainerTop,
		bottom = 80
	}
	self.weaponAttributesList = CoD.WeaponAttributeList.new( attributeWidth - 60, weaponAttributesDefaultAnimState )
	infoContainer:addElement( self.weaponAttributesList )
	local weaponLevelWidth = CoD.Menu.Width * 0.33
	local weaponLevelDefaultAnimState = {
		leftAnchor = true,
		rightAnchor = false,
		left = 0,
		right = weaponLevelWidth,
		topAnchor = true,
		bottomAnchor = true,
		top = infoContainerTop,
		bottom = 0
	}
	self.weaponLevel = CoD.WeaponLevel.new( weaponLevelDefaultAnimState, weaponLevelWidth )
	infoContainer:addElement( self.weaponLevel )
	self.weaponLevel:update( controller, weaponIndex )
	local weaponContainer = LUI.UIElement.new()
	weaponContainer:setLeftRight( false, true, -(CoD.Menu.Width / 2) + 10, 0 )
	weaponContainer:setTopBottom( true, true, 0, 0 )
	infoContainer:addElement( weaponContainer )
	local weaponImageWidth = 300
	local weaponImageHeight = weaponImageWidth / 2
	local weaponImageTop = -40
	self.weaponImage = LUI.UIImage.new()
	self.weaponImage:setLeftRight( false, true, -weaponImageWidth + 10, 10 )
	self.weaponImage:setTopBottom( true, false, weaponImageTop, weaponImageTop + weaponImageHeight )
	weaponContainer:addElement( self.weaponImage )
	local slotListBottom = -CoD.ButtonPrompt.Height - 30
	local slotListHeight = CoD.CACAttachments.SlotListSize + 10
	local slotListBGWidth = CoD.WeaponAttachmentChallenges.GetSlotlistBackgroundWidth( 2 )
	self.slotListBackground = LUI.UIElement.new()
	self.slotListBackground:setLeftRight( true, false, CoD.CACAttachments.SlotListLeft, CoD.CACAttachments.SlotListLeft + slotListBGWidth )
	self.slotListBackground:setTopBottom( false, true, slotListBottom - slotListHeight, slotListBottom )
	weaponContainer:addElement( self.slotListBackground )
	self.slotListBackground.border = CoD.BorderDip.new( 1, 1, 1, 1, 0.05, nil, slotListBGWidth, 2 )
	self.slotListBackground:addElement( self.slotListBackground.border )
	self.slotListBackground.border:hide()
	local slotListTitleTopOffset = -2
	self.slotListTitle = LUI.UIText.new()
	self.slotListTitle:setLeftRight( true, true, 0, 0 )
	self.slotListTitle:setTopBottom( true, false, slotListTitleTopOffset - CoD.textSize.Default, slotListTitleTopOffset )
	self.slotListTitle:setAlpha( 0.5 )
	self.slotListTitle:setFont( CoD.fonts.Default )
	self.slotListTitle:setAlignment( LUI.Alignment.Left )
	self.slotListBackground:addElement( self.slotListTitle )
	local rewardLeft = CoD.CACAttachments.SlotListSpacing / 2
	local rewardSize = CoD.CACAttachments.SlotListSize - 10
	self.rewardImage = LUI.UIImage.new()
	self.rewardImage:setLeftRight( true, false, rewardLeft, rewardLeft + rewardSize )
	self.rewardImage:setTopBottom( false, false, -rewardSize / 2, rewardSize / 2 )
	self.rewardImage:setAlpha( 0 )
	self.slotListBackground:addElement( self.rewardImage )
	local rewardXPCenter = rewardLeft + CoD.CACAttachments.SlotListSize + CoD.CACAttachments.SlotListSpacing + CoD.CACAttachments.SlotListSize / 2
	local rewardXPWidth = CoD.CACAttachments.SlotListSize + CoD.CACAttachments.SlotListSpacing * 2
	self.rewardXP = LUI.UIText.new()
	self.rewardXP:setLeftRight( true, false, rewardXPCenter - rewardXPWidth / 2, rewardXPCenter + rewardXPWidth / 2 )
	self.rewardXP:setTopBottom( false, false, -CoD.textSize.ExtraSmall / 2, CoD.textSize.ExtraSmall / 2 )
	self.rewardXP:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	self.rewardXP:setAlpha( 0 )
	self.rewardXP:setFont( CoD.fonts.ExtraSmall )
	self.rewardXP:setAlignment( LUI.Alignment.Center )
	self.slotListBackground:addElement( self.rewardXP )
	CoD.WeaponAttachmentChallenges.AddAttachments( self, controller, weaponIndex )
	return self
end

CoD.WeaponAttachmentChallenges.GetSlotlistBackgroundWidth = function ( dipCount )
	return CoD.CACAttachments.SlotListSpacing / 2 + CoD.CACAttachments.SlotListSize * dipCount + CoD.CACAttachments.SlotListSpacing * (dipCount - 1) + CoD.CACAttachments.SlotListSpacing / 2
end

CoD.WeaponAttachmentChallenges.AddAttachments = function ( self, controller, weaponIndex )
	self.weaponItemIndex = weaponIndex
	self.weaponImage:registerAnimationState( "weapon_image", {
		material = RegisterMaterial( Engine.GetItemImage( self.weaponItemIndex ) .. "_big" )
	} )
	self.weaponImage:animateToState( "weapon_image" )
	local numAttachments = Engine.GetNumAttachments( self.weaponItemIndex )
	local buttonToGainFocus = nil
	for attachmentIndex = 1, numAttachments - 1, 1 do
		local contentButton = CoD.AttachmentGridButton.new( self.weaponItemIndex, attachmentIndex )
		contentButton.actionSFX = nil
		self.contentGrid:addButton( contentButton )
		if buttonToGainFocus == nil then
			buttonToGainFocus = contentButton
		end
		if Engine.GetItemAttachmentLocked( controller, self.weaponItemIndex, attachmentIndex ) ~= 0 then
			contentButton:setLocked( true )
		else
			contentButton:setLocked( false )
		end
	end
	buttonToGainFocus:processEvent( {
		name = "gain_focus"
	} )
end

CoD.WeaponAttachmentChallenges.ContentButtonHighlighted = function ( self, event )
	if event.contentIndex then
		self.attachmentTitle:setText( Engine.Localize( Engine.GetAttachmentNameByIndex( event.contentIndex ) ) )
		if event.locked == true then
			self.slotListBackground.border:show()
			local weaponLevelText = CoD.AttachmentGridButton.GetRequiredGunLevel( self.m_ownerController, self.weaponItemIndex, event.contentIndex )
			self.attachmentDescription:setText( weaponLevelText )
			self.slotListTitle:setText( Engine.Localize( "MPUI_REWARDS" ) )
			self.weaponAttributesList:beginAnimation( "hide" )
			self.weaponAttributesList:setAlpha( 0 )
			self.weaponLevel:show()
			local selectedAttachmentImageName = Engine.GetAttachmentImageByWeaponAndAttachIndex( self.weaponItemIndex, event.contentIndex )
			self.rewardImage:setImage( RegisterMaterial( selectedAttachmentImageName ) )
			self.rewardImage:beginAnimation( "show" )
			self.rewardImage:setAlpha( 1 )
			local selectedAttachmentRewardText = CoD.AttachmentGridButton.GetRewardXP( self.m_ownerController, self.weaponItemIndex, event.contentIndex )
			self.rewardXP:setText( selectedAttachmentRewardText )
			self.rewardXP:beginAnimation( "show" )
			self.rewardXP:setAlpha( 1 )
		else
			self.slotListBackground.border:hide()
			self.attachmentDescription:setText( Engine.Localize( Engine.GetAttachmentDesc( self.weaponItemIndex, event.contentIndex ) ) )
			self.slotListTitle:setText( "" )
			self.weaponLevel:hide()
			self.rewardImage:beginAnimation( "hide" )
			self.rewardImage:setAlpha( 0 )
			self.rewardXP:beginAnimation( "hide" )
			self.rewardXP:setAlpha( 0 )
			self.weaponAttributesList:updateWeaponAttributes( self.weaponItemIndex, event.contentIndex )
			self.weaponAttributesList:beginAnimation( "show" )
			self.weaponAttributesList:setAlpha( 1 )
		end
	else
		self.attachmentTitle:setText( Engine.Localize( "MPUI_NONE_CAPS" ) )
		self.attachmentDescription:setText( "" )
	end
end

