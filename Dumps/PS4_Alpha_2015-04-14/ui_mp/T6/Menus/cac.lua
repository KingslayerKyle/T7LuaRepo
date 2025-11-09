CoD.CAC = {}
CoD.CAC.createPanel = {}
CoD.CAC.ButtonActionSound = "uin_navigation_select_main"
CoD.CAC.LockImageMaterial = RegisterMaterial( "menu_mp_lobby_locked" )
CoD.CAC.LockImageBigMaterial = RegisterMaterial( "menu_mp_lobby_locked_big" )
CoD.CAC.ButtonGridLockImageSize = 30
require( "ui.T6.MFSlide" )
require( "ui.T6.MFSlidePanel" )
require( "ui.T6.CoD9Button" )
require( "ui_mp.T6.Menus.CACClassSelection" )
require( "ui_mp.T6.Menus.CACClassOptions" )
require( "ui_mp.T6.Menus.CACLoadOut" )
require( "ui_mp.T6.Menus.CACLoadOutOverview" )
require( "ui_mp.T6.Menus.CACWeaponSlot" )
require( "ui_mp.T6.Menus.CACGrenadeSelection" )
require( "ui_mp.T6.Menus.CACPerksSelection" )
require( "ui.T6.Menus.CACPurchaseConfirmationPopup" )
CoD.CAC.FadeInTime = 250
local CAC_CreatePanel, CAC_OpenPanel, CAC_ClosePanel, CAC_GetPanel, CAC_GetAllocationSubtitle, CAC_AddBlur, CAC_RemoveBlur, CAC_Update, CAC_OpenClassPreview, CAC_CloseClassPreview, CAC_AddElements = nil
CoD.CAC.OpenPopup = function ( slide, controller )
	local CACPopup = CoD.MFPopup.new( slide, nil, nil, Engine.Localize( "MENU_CREATE_A_CLASS_CAPS" ) )
	CACPopup.body.background:close()
	local backgroundImage = LUI.UIImage.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = -CoD.AllocationSubtitle.Height - 2,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		material = RegisterMaterial( "menu_mp_tab_frame_inner" )
	} )
	CACPopup.body:addElement( backgroundImage )
	CACPopup:registerEventHandler( "destroy_panel", CAC_DestroyPanel )
	CACPopup:registerEventHandler( "item_purchased", CAC_ItemPurchased )
	CACPopup.createPanel = CAC_CreatePanel
	CACPopup.openPanel = CAC_OpenPanel
	CACPopup.closePanel = CAC_ClosePanel
	CACPopup.getPanel = CAC_GetPanel
	CACPopup.getAllocationSubtitle = CAC_GetAllocationSubtitle
	CACPopup.update = CAC_Update
	CACPopup.openClassPreview = CAC_OpenClassPreview
	CACPopup.closeClassPreview = CAC_CloseClassPreview
	CACPopup.m_ownerController = controller
	CAC_AddElements( CACPopup )
	CACPopup:openPopup( nil, true )
	return CACPopup
end

CAC_AddElements = function ( self, event )
	self:addSelectButton()
	self:addBackButton()
	self:registerEventHandler( "button_prompt_back", CAC_ButtonPromptBack )
	local controller = self.m_ownerController
	self.body.panels = {}
	self.body.classItems = {}
	CoD.CACUtility.SetupElementForClassData( self.body.classItems )
	local classNumInternal = 0
	if CoD.perController[controller].classNumInternal ~= nil then
		classNumInternal = CoD.perController[controller].classNumInternal
	end
	local classData = CoD.CACUtility.GetClassData( controller, classNumInternal )
	self:openPanel( "ClassSelection", nil, 0 )
	self:openPanel( "Allocation", nil, 0 )
	self:openClassPreview( 0 )
	local perkPane = self:getPanel( "Perks" )
	perkPane.currentPerkCount = #classData.perks
	perkPane.currentPerkInFocus = 1
	self:update()
end

function CAC_ButtonPromptBack( self, event )
	Engine.Exec( event.controller, "uploadstats" )
	Engine.CommitProfileChanges( event.controller )
	Engine.PartyHostClearUIState()
	self:closePopup( nil, true )
end

CAC_CreatePanel = function ( self, panelName )
	local body = self.body
	local panel = body.panels[panelName]
	if panel == nil then
		if CoD.CAC.createPanel[panelName] == nil then
			error( "LUI Error: no create function associated with " .. panelName .. " panel. " )
		end
		panel = CoD.CAC.createPanel[panelName]( self )
		if panel ~= nil then
			body.panels[panelName] = panel
			body:addElement( panel )
		end
	end
	return panel
end

CAC_OpenPanel = function ( self, panelName, animState, duration )
	local controller = self.m_ownerController
	if duration == nil then
		duration = CoD.CAC.FadeInTime
	end
	if animState == nil then
		animState = "primary"
	end
	local panel = self:createPanel( panelName )
	if panel ~= nil then
		Engine.PlaySound( CoD.CAC.ButtonActionSound )
		panel:animateToState( animState, duration, true, true )
		if animState == "primary" then
			panel.m_inputDisabled = nil
			panel:processEvent( {
				name = "on_activate",
				controller = controller
			} )
		else
			panel.m_inputDisabled = true
			panel:processEvent( {
				name = "on_deactivate",
				controller = controller
			} )
		end
	end
end

CAC_ClosePanel = function ( self, panelName, closeState, dispose, duration )
	local body = self.body
	local panel = body.panels[panelName]
	local controller = self.m_ownerController
	if duration == nil then
		duration = CoD.CAC.FadeInTime
	end
	if closeState == nil then
		closeState = "default"
	end
	if panel ~= nil then
		panel:animateToState( closeState, duration, true, true )
		if dispose == true then
			panel:processEvent( {
				name = "on_close",
				controller = controller
			} )
			panel:addElement( LUI.UITimer.new( duration, {
				name = "destroy_panel",
				panelName = panelName
			}, true, self ) )
		else
			panel:processEvent( {
				name = "lose_focus"
			} )
			panel:processEvent( {
				name = "on_deactivate",
				controller = controller
			} )
		end
	end
end

function CAC_DestroyPanel( self, event )
	local panelName = event.panelName
	if self.body.panels[panelName] ~= nil then
		self.body.panels[panelName]:close()
		self.body.panels[panelName] = nil
	end
end

CAC_GetPanel = function ( self, panelName )
	return self.body.panels[panelName]
end

CAC_Update = function ( self )
	local allocationPane = self:getPanel( "Allocation" )
	if allocationPane ~= nil then
		allocationPane:update()
	end
	local controller = self.m_ownerController
	local classNumInternal = CoD.perController[controller].classNumInternal
	if classNumInternal == nil then
		classNumInternal = 0
	end
	local classData = CoD.CACUtility.GetClassData( controller, classNumInternal )
	local perkPane = self:getPanel( "Perks" )
	if perkPane ~= nil then
		perkPane.currentPerkCount = #classData.perks
		if perkPane.isActive == true then
			perkPane:align()
		end
	end
	CoD.CACUtility.UpdateUIFromClassData( classData, self.body.classItems, controller )
end

CAC_OpenClassPreview = function ( self, duration )
	self:openPanel( "PrimaryWeapon", nil, duration )
	self:openPanel( "SecondaryWeapon", nil, duration )
	self:openPanel( "Grenades", nil, duration )
	self:openPanel( "Perks", nil, duration )
end

CAC_CloseClassPreview = function ( self, duration )
	self:closePanel( "PrimaryWeapon", nil, duration )
	self:closePanel( "SecondaryWeapon", nil, duration )
	self:closePanel( "Grenades", nil, duration )
	self:closePanel( "Perks", nil, duration )
end

CAC_GetAllocationSubtitle = function ( self )
	local allocationPane = self:getPanel( "Allocation" )
	if allocationPane ~= nil then
		return allocationPane.allocationSubtitle
	else
		
	end
end

CoD.CAC.AddUnlockTokenText = function ( self, weaponGroup, leftAnchorText, rightAnchorText, heightAdjustment )
	local unlockTokenSize = CoD.textSize.Default
	local unlockTokenFont = CoD.fonts.Default
	local unlockTokenTextBottom = unlockTokenSize
	if heightAdjustment == nil then
		heightAdjustment = 0
	end
	local unlockTokenText = LUI.UIText.new( {
		left = 0,
		top = -unlockTokenTextBottom - heightAdjustment,
		right = 0,
		bottom = -heightAdjustment,
		leftAnchor = leftAnchorText,
		topAnchor = false,
		rightAnchor = rightAnchorText,
		bottomAnchor = true,
		font = unlockTokenFont
	} )
	self:addElement( unlockTokenText )
	self.unlockTokenText = unlockTokenText
	
	self.weaponGroup = weaponGroup
end

function CAC_ItemPurchased( self, event )
	self:update()
	local itemsGridPane = self:getPanel( "ItemsGrid" )
	if itemsGridPane ~= nil then
		local allocationSubtitle = self:getAllocationSubtitle()
		itemsGridPane:updateButtonGrid( allocationSubtitle )
	end
	local itemInfoPane = self:getPanel( "ItemInfo" )
	if itemInfoPane ~= nil then
		itemInfoPane:update( event.itemGridButton )
	end
end

local CAC_ClosePurchaseConfirmation = function ( self )
	self:closePopup( nil, true, self.CAC )
	if self.CAC ~= nil then
		self.CAC:setBlur( true )
		self.CAC:processEvent( {
			name = "item_purchased",
			itemGridButton = self.itemGridButton
		} )
	end
end

local popupButtonBackPrompt = function ( self, event )
	CAC_ClosePurchaseConfirmation( self )
end

local doNotPurchaseCurrentItem = function ( self, event )
	CAC_ClosePurchaseConfirmation( self.popup )
end

local purchaseCurrentItem = function ( self, event )
	Engine.PurchaseItem( event.controller, self.popup.itemGridButton.itemIndex )
	CAC_ClosePurchaseConfirmation( self.popup )
end

CoD.CAC.CanAffordUnlocksForItemIndex = function ( controller, itemIndex )
	local currentUnlocks = CoD.CAC.GetUnlockCountForGroup( controller, Engine.GetItemGroup( itemIndex ) )
	local itemCost = Engine.GetItemCost( itemIndex )
	if currentUnlocks < itemCost then
		return false
	else
		return true
	end
end

CoD.CAC.IsWideWeaponImage = function ( itemIndex )
	if itemIndex < 64 then
		return true
	else
		return false
	end
end

CoD.CAC.GetMaterialName = function ( itemIndex )
	local itemMaterialName = Engine.GetItemImage( itemIndex )
	if CoD.IsPerk( itemIndex ) then
		return itemMaterialName
	elseif CoD.IsReward( itemIndex ) or itemIndex < 64 then
		return itemMaterialName .. "_big"
	else
		return itemMaterialName
	end
end

CoD.CAC.SetItemMaterialForAttachmentIndex = function ( self, attachmentIndex )
	local imageWidth = 128
	local imageHeight = 128
	local itemMaterialName = Engine.GetAttachmentImageByIndex( attachmentIndex )
	local itemMaterial = RegisterMaterial( itemMaterialName )
	local itemImage = LUI.UIImage.new( {
		left = 10,
		top = -(25 + imageHeight),
		right = 10 + imageWidth,
		bottom = -25,
		leftAnchor = true,
		topAnchor = false,
		rightAnchor = false,
		bottomAnchor = true,
		material = itemMaterial,
		alpha = 1
	} )
	self:addElement( itemImage )
end

CoD.CAC.SetItemMaterialForItemIndex = function ( self, itemIndex )
	local imageWidth = 128
	if CoD.CAC.IsWideWeaponImage( itemIndex ) then
		imageWidth = imageWidth * 2
	end
	local imageHeight = 128
	local itemMaterialName = CoD.CAC.GetMaterialName( itemIndex )
	local itemMaterial = RegisterMaterial( itemMaterialName )
	local shaderVectorValue = {
		0,
		0,
		0,
		0
	}
	if CoD.IsReward( itemIndex ) then
		shaderVectorValue = {
			0,
			1,
			0,
			0
		}
	end
	local itemImage = LUI.UIImage.new( {
		left = 10,
		top = 10,
		right = 10 + imageWidth,
		bottom = 10 + imageHeight,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = false,
		bottomAnchor = false,
		material = itemMaterial,
		alpha = 1,
		shaderVector0 = shaderVectorValue
	} )
	self:addElement( itemImage )
end

CoD.CAC.SetPrestigeTokenText = function ( self, controllerIndex, textOffset )
	if self.prestigeTokenText ~= nil then
		local unlockCount = Engine.GetPermanentUnlockCount( controllerIndex )
		local unlockString = ""
		if unlockCount and unlockCount > 0 then
			if unlockCount == 1 then
				unlockString = Engine.Localize( "MPUI_PERMANENT_UNLOCK_AVAILABLE", unlockCount )
			else
				unlockString = Engine.Localize( "MPUI_PERMANENT_UNLOCKS_AVAILABLE", unlockCount )
			end
		end
		self.prestigeTokenText:setText( unlockString )
		self.prestigeTokenText:setLeftRight( false, true, -textOffset, -textOffset )
		if self.prestigeTokenImage then
			if unlockCount == 0 then
				self.prestigeTokenImage:close()
			else
				local left, top, right, bottom = GetTextDimensions( unlockString, CoD.fonts.Default, CoD.textSize.Default )
				self.prestigeTokenImage:setLeftRight( false, true, -right - textOffset - 2 - 32, -right - textOffset - 2 )
				self:addElement( self.prestigeTokenImage )
			end
		end
	end
end

CoD.CAC.GetUnlockCountForGroup = function ( controllerIndex, weaponGroup )
	local unlockIndex = Engine.GetUnlockIndexFromGroupName( weaponGroup )
	local currentUnlocks = Engine.GetDStat( controllerIndex, "unlocks", unlockIndex )
	return currentUnlocks
end

CoD.CAC.GetUnlockNameForGroup = function ( weaponGroup )
	local unlockIndex = Engine.GetUnlockIndexFromGroupName( weaponGroup )
	local unlockName = Engine.GetUnlockLocString( unlockIndex )
	return Engine.Localize( unlockName )
end

CoD.CAC.GetUnlockTokenText = function ( currentUnlocks, unlockIndex, pluralSuffix, singularSuffix )
	local suffix = pluralSuffix
	if singularSuffix ~= nil and currentUnlocks == 1 then
		suffix = singularSuffix
	end
	local unlockName = Engine.GetUnlockLocString( unlockIndex )
	local unlockTokenText = Engine.Localize( suffix, currentUnlocks )
	return unlockTokenText
end

CoD.CAC.SetUnlockItemText = function ( self, controllerIndex )
	local prestigeTextOffset = 0
	if self.unlockTokenText ~= nil then
		local weaponGroup = self.weaponGroup
		weaponGroup = weaponGroup or "weapon_smg"
		local currentUnlocks = CoD.CAC.GetUnlockCountForGroup( controllerIndex, weaponGroup )
		local unlockIndex = Engine.GetUnlockIndexFromGroupName( weaponGroup )
		local unlockString = CoD.CAC.GetUnlockTokenText( currentUnlocks, unlockIndex, "MPUI_UNLOCK_TOKENS_AVAILABLE", "MPUI_UNLOCK_TOKEN_AVAILABLE" )
		self.unlockTokenText:setText( unlockString )
		if self.tokenImage then
			local left, top, right, bottom = GetTextDimensions( unlockString, CoD.fonts.Default, CoD.textSize.Default )
			local unlockTokenTextWidth = right
			self.tokenImage:setLeftRight( false, true, -unlockTokenTextWidth - 2 - 32, -unlockTokenTextWidth - 2 )
			self:addElement( self.tokenImage )
			prestigeTextOffset = unlockTokenTextWidth + 2 + 32 + 2
		end
	end
	CoD.CAC.SetPrestigeTokenText( self, controllerIndex, prestigeTextOffset )
end

CoD.CAC.PurchaseItemIfPossible = function ( CAC, controller, itemGridButton )
	local itemIndex = itemGridButton.itemIndex
	if not Engine.IsItemPurchased( controller, itemIndex ) then
		if CoD.CAC.CanAffordUnlocksForItemIndex( controller, itemIndex ) == true then
			local confirmationPopup = CAC:openPopup( "PurchaseConfirmation", controller )
			confirmationPopup.topRightTitle:setText( Engine.Localize( Engine.GetItemName( itemIndex ) ) )
			CoD.CAC.AddUnlockTokenText( confirmationPopup, Engine.GetItemGroup( itemIndex ), false, false, CoD.textSize.Default )
			CoD.CAC.SetUnlockItemText( confirmationPopup, controller )
			CoD.CAC.SetItemMaterialForItemIndex( confirmationPopup, itemIndex )
			confirmationPopup.itemGridButton = itemGridButton
			confirmationPopup.CAC = CAC
			CAC.popup = confirmationPopup
		else
			Engine.PlaySound( CoD.CACUtility.denySFX )
		end
	end
end

CoD.CAC.SetLockIcon = function ( card, size, material )
	local icon = LUI.UIImage.new()
	local wh = size / 2
	icon:setLeftRight( false, false, -wh, wh )
	icon:setTopBottom( false, false, -wh, wh )
	icon:setImage( material )
	card:addElement( icon )
	return icon
end

CoD.CAC.SetTokenIcon = function ( card, material )
	local icon = LUI.UIImage.new()
	local widthOffset = 5
	local heightOffset = -28
	local size = 32
	icon:setLeftRight( true, false, widthOffset, widthOffset + size )
	icon:setTopBottom( false, true, heightOffset - size, heightOffset )
	icon:setImage( material )
	card:addElement( icon )
	return icon
end

CoD.CAC.SetNewIcon = function ( card, new )
	if new then
		if not card.newIcon then
			local newIconY = 14
			
			local newIcon = LUI.UIImage.new()
			newIcon:setLeftRight( true, false, 8, 8 + CoD.CACUtility.ButtonGridNewImageWidth )
			newIcon:setTopBottom( true, false, newIconY - CoD.CACUtility.ButtonGridNewImageHeight / 2, newIconY + CoD.CACUtility.ButtonGridNewImageHeight / 2 )
			newIcon:setImage( RegisterMaterial( CoD.CACUtility.NewImageMaterial ) )
			card:addElement( newIcon )
			card.newIcon = newIcon
			
		end
	elseif card.newIcon then
		card.newIcon:close()
		card.newIcon = nil
	end
end

CoD.CAC.SetPrestigeTokenButton = function ( self, controllerIndex, weaponItemIndex )
	if self.prestigeTokenText ~= nil and controllerIndex and weaponItemIndex then
		local itemCost = Engine.GetItemCost( weaponItemIndex )
		if not Engine.IsItemPermanentlyUnlocked( controllerIndex, weaponItemIndex ) and itemCost > 0 then
			self:dispatchEventToParent( {
				name = "add_prestige_unlock_button"
			} )
		else
			self:dispatchEventToParent( {
				name = "remove_prestige_unlock_button"
			} )
		end
	end
end

CoD.CAC.CreateUnlockTokensFooter = function ( menu, controller )
	local footer = LUI.UIElement.new()
	footer:setLeftRight( false, false, -CoD.SDSafeWidth / 2, CoD.SDSafeWidth / 2 )
	footer:setTopBottom( false, true, -CoD.ButtonPrompt.Height - 2 - 32, -CoD.ButtonPrompt.Height - 2 )
	
	local unlockTokenText = LUI.UIText.new()
	unlockTokenText:setLeftRight( false, true, 0, 0 )
	unlockTokenText:setTopBottom( false, false, -CoD.textSize.Default / 2, CoD.textSize.Default / 2 )
	unlockTokenText:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
	footer:addElement( unlockTokenText )
	footer.unlockTokenText = unlockTokenText
	
	local tokenImage = LUI.UIImage.new()
	tokenImage:setLeftRight( true, false, 0, 32 )
	tokenImage:setTopBottom( false, false, -16, 16 )
	tokenImage:setImage( RegisterMaterial( "menu_mp_lobby_token_64" ) )
	footer.tokenImage = tokenImage
	footer:addElement( tokenImage )
	if controller then
		local unlockCount = Engine.GetPermanentUnlockCount( controller )
		if unlockCount and unlockCount > 0 then
			local unlockText = Engine.Localize( "MPUI_PERMANENT_UNLOCK_AVAILABLE", unlockCount )
			if unlockCount > 1 then
				unlockText = Engine.Localize( "MPUI_PERMANENT_UNLOCKS_AVAILABLE", unlockCount )
			end
			local prestigeTokenText = LUI.UIText.new()
			prestigeTokenText:setLeftRight( false, true, 0, 0 )
			prestigeTokenText:setTopBottom( false, false, -CoD.textSize.Default / 2, CoD.textSize.Default / 2 )
			prestigeTokenText:setRGB( CoD.BOIIOrange.r, CoD.BOIIOrange.g, CoD.BOIIOrange.b )
			prestigeTokenText:setText( unlockText )
			footer:addElement( prestigeTokenText )
			footer.prestigeTokenText = prestigeTokenText
			
			local prestigeTokenImage = LUI.UIImage.new()
			prestigeTokenImage:setLeftRight( true, false, 0, 32 )
			prestigeTokenImage:setTopBottom( false, false, -16, 16 )
			prestigeTokenImage:setImage( RegisterMaterial( "menu_prestige_unlock_token_64" ) )
			footer:addElement( prestigeTokenImage )
			footer.prestigeTokenImage = prestigeTokenImage
		end
	end
	footer:registerEventHandler( "purchased", function ( self, event )
		CoD.CAC.SetUnlockItemText( self, event.controller )
	end )
	footer:registerEventHandler( "highlighted", function ( self, event )
		CoD.CAC.SetPrestigeTokenButton( self, event.controller, event.weaponItemIndex )
	end )
	return footer
end

