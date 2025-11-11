function SendClientScriptMenuChangeNotifyHelper( controller, menuName, opened, state )
	local status = "closed"
	if opened then
		status = "opened"
	end
	if state then
		Engine.SendClientScriptNotify( controller, "menu_change" .. CoD.GetLocalClientAdjustedNum( controller ), {
			menu = menuName,
			status = status,
			state = state
		} )
	else
		Engine.SendClientScriptNotify( controller, "menu_change" .. CoD.GetLocalClientAdjustedNum( controller ), {
			menu = menuName,
			status = status
		} )
	end
end

function CloseAllOccludingMenus( self, controller )
	local occludedMenu = self.occludedBy
	while occludedMenu ~= nil do
		if occludedMenu.occludedBy ~= nil or occludedMenu.ignoreForcedClose then
			occludedMenu = occludedMenu.occludedBy
		end
		local previousMenu = occludedMenu
		while previousMenu ~= self do
			previousMenu = GoBackToMenu( previousMenu, controller, self.menuName )
		end
		return 
	end
end

function LobbyTheaterLaunchDemo( self, element, controller, demoMode )
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
	local info = Engine.LobbyGetDemoInformation( Enum.LobbyModule.LOBBY_MODULE_CLIENT, lobbyType )
	if not info then
		return 
	elseif demoMode == nil then
		demoMode = ""
	end
	local mapName = Dvar.ui_mapname:get()
	if not Engine.IsMapValid( mapName ) then
		LuaUtils.UI_ShowErrorMessageDialog( controller, "MENU_DLC_WARNING_MISSING_MAP_PACK_THEATER" )
		return 
	end
	info.controller = controller
	info.demoMode = demoMode
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_HOST )
	Engine.LobbyUpdateDemoInformation( Enum.LobbyModule.LOBBY_MODULE_HOST, lobbyType, info )
	if info.mainMode ~= Enum.eModes.MODE_INVALID then
		local mode = Engine.GetAbbreviationForMode( info.mainMode )
		Engine.SwitchMode( controller, mode )
	end
	CoD.LobbyUtility.LaunchDemo( self, controller, Enum.LobbyType.LOBBY_TYPE_GAME )
end

function GetSessionModeFromPresenceActivity( enumVal )
	if enumVal == Enum.PresenceActivity.PRESENCE_ACTIVITY_OFFLINE then
		return Enum.eModes.MODE_INVALID
	elseif Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_INLOBBY <= enumVal and enumVal <= Enum.PresenceActivity.PRESENCE_ACTIVITY_MENU_LAST then
		return Enum.eModes.MODE_INVALID
	elseif Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_FIRST <= enumVal and enumVal <= Enum.PresenceActivity.PRESENCE_ACTIVITY_CP_LAST then
		return Enum.eModes.MODE_CAMPAIGN
	elseif Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_FIRST <= enumVal and enumVal <= Enum.PresenceActivity.PRESENCE_ACTIVITY_MP_LAST then
		return Enum.eModes.MODE_MULTIPLAYER
	elseif Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_FIRST <= enumVal and enumVal <= Enum.PresenceActivity.PRESENCE_ACTIVITY_ZM_LAST then
		return Enum.eModes.MODE_ZOMBIES
	else
		
	end
end

function SetFocusToLoadoutWidgetAfterSetItem( self )
	if self.weaponSlotTable and self.currentActiveSlot and self.weaponSlotTable[self.currentActiveSlot] then
		local currentSelectedWidget = self.weaponSlotTable[self.currentActiveSlot]
		if currentSelectedWidget then
			if currentSelectedWidget.widget then
				currentSelectedWidget.widget:processEvent( {
					name = "gain_focus",
					skipGainFocus = true
				} )
			else
				currentSelectedWidget:dispatchEventToParent( {
					name = "gain_focus",
					skipGainFocus = true
				} )
			end
		end
	end
end

function OpenGenericPopup( self, controller, menuName, contentText, subContentText, buttonText, optionalActionOnButtonPress )
	local menu = self
	while menu and not menu.openMenu do
		menu = menu:getParent()
	end
	local newMenu = menu:openPopup( menuName, controller )
	if not CoD.MenuNavigation then
		CoD.MenuNavigation = {}
	end
	if not CoD.MenuNavigation[controller] then
		CoD.MenuNavigation[controller] = {}
	end
	table.insert( CoD.MenuNavigation[controller], {
		newMenu.menuName
	} )
	if contentText and contentText ~= "" then
		newMenu:setContent( Engine.Localize( contentText ) )
	end
	if subContentText and subContentText ~= "" then
		newMenu:setSubContent( Engine.Localize( subContentText ) )
	end
	if buttonText and buttonText ~= "" then
		newMenu:setButton1Text( Engine.Localize( buttonText ) )
	end
	local func = optionalActionOnButtonPress
	if optionalActionOnButtonPress and type( optionalActionOnButtonPress ) == "string" and optionalActionOnButtonPress ~= "" and _G[optionalActionOnButtonPress] then
		func = _G[optionalActionOnButtonPress]
	end
	if type( func ) == "function" then
		newMenu:setButton1Action( optionalActionOnButtonPress )
	end
	return newMenu
end

function GetListItem( self, element )
	local elementStack = {}
	while element and element ~= self do
		table.insert( elementStack, element )
		element = element:getParent()
	end
	if #elementStack >= 1 then
		return elementStack[#elementStack]
	else
		return initialElement
	end
end

function RemoveItemFromClassSlot( loadoutSlotName, controller, isSwapping )
	local classNum = CoD.perController[controller].classNum
	local classModel = CoD.perController[controller].classModel
	local slotModel = Engine.GetModel( classModel, loadoutSlotName )
	local itemIndex = Engine.GetModelValue( Engine.GetModel( slotModel, "itemIndex" ) )
	if CoD.CACUtility.EmptyItemIndex < itemIndex then
		local itemName = Engine.GetItemRef( itemIndex )
		CoD.CACUtility.SetClassItem( controller, classNum, loadoutSlotName, CoD.CACUtility.EmptyItemIndex )
		if itemName == "bonuscard_perk_1_greed" and not isSwapping then
			RemoveItemFromClassSlot( "specialty4", controller )
		elseif itemName == "bonuscard_perk_2_greed" and not isSwapping then
			RemoveItemFromClassSlot( "specialty5", controller )
		elseif itemName == "bonuscard_perk_3_greed" and not isSwapping then
			RemoveItemFromClassSlot( "specialty6", controller )
		elseif LUI.startswith( itemName, "bonuscard_primary_gunfighter" ) then
			local gunfighterCount = CoD.CACUtility.PrimaryGunfighterEquippedCount( classModel )
			RemoveItemFromClassSlot( "primaryattachment6", controller )
			if gunfighterCount < 2 then
				RemoveItemFromClassSlot( "primaryattachment5", controller )
				if gunfighterCount < 1 then
					RemoveItemFromClassSlot( "primaryattachment4", controller )
				end
			end
		elseif itemName == "bonuscard_secondary_gunfighter" then
			RemoveItemFromClassSlot( "secondaryattachment3", controller )
		elseif itemName == "bonuscard_overkill" then
			RemoveItemFromClassSlot( "secondary", controller )
			if Engine.IsCampaignGame() then
				local pistol_standard_index = Engine.GetItemIndexFromReference( "pistol_standard", Enum.eModes.MODE_CAMPAIGN )
				CoD.CACUtility.SetClassItem( controller, classNum, "secondary", tonumber( pistol_standard_index ) )
			end
		elseif itemName == "bonuscard_two_tacticals" then
			RemoveItemFromClassSlot( "primarygadget", controller )
		elseif itemName == "bonuscard_danger_close" then
			if not CoD.CACUtility.IsBonusCardEquipped( "bonuscard_two_tacticals", classModel ) then
				RemoveItemFromClassSlot( "primarygadgetattachment1", controller )
			end
		elseif loadoutSlotName == "primary" or loadoutSlotName == "secondary" then
			local attachmentList = CoD.CACUtility.GetAttachmentListForSlot( loadoutSlotName )
			for _, loadoutSlot in ipairs( attachmentList ) do
				RemoveItemFromClassSlot( loadoutSlot, controller )
			end
			for indexSuffix, loadoutSlot in pairs( CoD.CACUtility.weaponOptionGroupNames ) do
				local weaponOptionSlotName = loadoutSlotName .. loadoutSlot
				local weaponOptionSlotModel = Engine.GetModel( classModel, weaponOptionSlotName )
				if weaponOptionSlotModel then
					CoD.CACUtility.SetClassItem( controller, classNum, weaponOptionSlotName, CoD.CACUtility.EmptyItemIndex )
				end
			end
			local acvList = CoD.CACUtility.GetCACWeaponACVList( loadoutSlotName )
			for _, loadoutSlot in ipairs( acvList ) do
				RemoveItemFromClassSlot( loadoutSlot, controller )
			end
			CoD.CACUtility.SetClassItem( controller, classNum, loadoutSlotName .. "paintjobslot", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
			CoD.CACUtility.SetClassItem( controller, classNum, loadoutSlotName .. "paintjobindex", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
			CoD.CACUtility.SetClassItem( controller, classNum, loadoutSlotName .. CoD.CACUtility[loadoutSlotName .. "WeaponPrestigeSlot"], CoD.CACUtility.EmptyItemIndex )
		elseif loadoutSlotName == "primarygadget" or loadoutSlotName == "secondarygadget" or loadoutSlotName == "specialgadget" then
			local attachmentList = CoD.CACUtility.PrimaryGadgetAttachmentSlotNameList
			if loadoutSlotName == "secondarygadget" then
				attachmentList = CoD.CACUtility.SecondaryGadgetAttachmentSlotNameList
			elseif loadoutSlotName == "specialgadget" then
				attachmentList = CoD.CACUtility.SpecialGadgetAttachmentSlotNameList
			end
			for _, loadoutSlot in ipairs( attachmentList ) do
				RemoveItemFromClassSlot( loadoutSlot, controller )
			end
		elseif LUI.startswith( loadoutSlotName, "primaryattachment" ) or LUI.startswith( loadoutSlotName, "secondaryattachment" ) then
			local baseWeaponSlotName = "primary"
			if LUI.startswith( loadoutSlotName, "secondary" ) then
				baseWeaponSlotName = "secondary"
			end
			local weaponIndexModel = Engine.GetModel( classModel, baseWeaponSlotName .. ".itemIndex" )
			if weaponIndexModel then
				local weaponIndex = Engine.GetModelValue( weaponIndexModel )
				local attachmentRef = Engine.GetAttachmentRef( weaponIndex, itemIndex )
				if attachmentRef then
					local weaponOptionSlotName = baseWeaponSlotName .. attachmentRef
					if CoD.CACUtility.AttachmentHasCustomReticle( attachmentRef ) then
						weaponOptionSlotName = baseWeaponSlotName .. "reticle"
					end
					local weaponOptionSlotModel = Engine.GetModel( classModel, weaponOptionSlotName )
					if weaponOptionSlotModel then
						CoD.CACUtility.SetClassItem( controller, classNum, weaponOptionSlotName, CoD.CACUtility.EmptyItemIndex )
					end
				end
			end
			local acvSlotName = loadoutSlotName .. "cosmeticvariant"
			local acvModel = Engine.GetModel( classModel, acvSlotName )
			if acvModel then
				CoD.CACUtility.SetClassItem( controller, classNum, acvSlotName, CoD.CACUtility.EmptyItemIndex )
			end
		end
		CoD.CACUtility.GetCustomClassModel( controller, classNum, classModel )
		return true
	else
		return false
	end
end

function CanEquipMultiplePrimaryGunfighterWildcard( loadoutSlot, itemIndex )
	if not LUI.startswith( loadoutSlot, "bonuscard" ) then
		return false
	else
		local itemName = Engine.GetItemRef( itemIndex )
		if itemName == "bonuscard_primary_gunfighter" then
			return true
		else
			return false
		end
	end
end

function AttemptAttachItem( self, controller, parentModel, classNum, slotName, itemIndex, count, ignoreGetCustomClassModel )
	local classModel = CoD.perController[controller].classModel
	local canEquip = false
	local prevLoadoutSlotName = nil
	if self.getEquippedLoadoutSlot then
		prevLoadoutSlotName = self:getEquippedLoadoutSlot( controller, itemIndex )
	end
	local allocationSpentModel = Engine.GetModel( parentModel, "allocationSpent" )
	if not allocationSpentModel then
		allocationSpentModel = Engine.GetModel( classModel, "allocationSpent" )
	end
	local mutuallyExclusiveSlotTable = CoD.CACUtility.GetMutuallyExclusiveSlotName( slotName, controller, itemIndex )
	for i = 1, #mutuallyExclusiveSlotTable, 1 do
		local mutuallyExlusiveItemSlot = mutuallyExclusiveSlotTable[i]
		if mutuallyExlusiveItemSlot ~= "" and (not prevLoadoutSlotName or prevLoadoutSlotName ~= mutuallyExclusiveItemSlot) then
			if Engine.IsCampaignGame() and (mutuallyExlusiveItemSlot == "primary" or mutuallyExlusiveItemSlot == "secondary") then
				return true
			end
			RemoveItemFromClassSlot( mutuallyExlusiveItemSlot, controller )
		end
	end
	local currentSlotItemIndex = CoD.CACUtility.GetClassItem( controller, classNum, slotName )
	CoD.perController[controller].overCapacityItemIndex = nil
	local swappingItems = false
	if CoD.CACUtility.EmptyItemIndex < currentSlotItemIndex or prevLoadoutSlotName then
		swappingItems = true
		if not prevLoadoutSlotName then
			prevLoadoutSlotName = slotName
		end
		local currentItemName = Engine.GetItemRef( currentSlotItemIndex )
		if currentItemName == "bonuscard_perk_1_greed" then
			RemoveItemFromClassSlot( "specialty4", controller )
		elseif currentItemName == "bonuscard_perk_2_greed" then
			RemoveItemFromClassSlot( "specialty5", controller )
		elseif currentItemName == "bonuscard_perk_3_greed" then
			RemoveItemFromClassSlot( "specialty6", controller )
		elseif currentItemName == "bonuscard_primary_gunfighter" then
			local gunfighterCount = CoD.CACUtility.SpecificWildcardEquippedCount( classModel, "bonuscard_primary_gunfighter" )
			RemoveItemFromClassSlot( "primaryattachment6", controller )
			if gunfighterCount <= 2 then
				RemoveItemFromClassSlot( "primaryattachment5", controller )
				if gunfighterCount <= 1 then
					RemoveItemFromClassSlot( "primaryattachment4", controller )
				end
			end
		elseif currentItemName == "bonuscard_secondary_gunfighter" then
			RemoveItemFromClassSlot( "secondaryattachment3", controller )
		elseif currentItemName == "bonuscard_overkill" then
			RemoveItemFromClassSlot( "secondary", controller )
			if Engine.IsCampaignGame() then
				local pistol_standard_index = Engine.GetItemIndexFromReference( "pistol_standard", Enum.eModes.MODE_CAMPAIGN )
				CoD.CACUtility.SetClassItem( controller, classNum, "secondary", tonumber( pistol_standard_index ) )
			end
		elseif currentItemName == "bonuscard_two_tacticals" then
			RemoveItemFromClassSlot( "primarygadget", controller )
		elseif currentItemName == "bonuscard_danger_close" and not CoD.CACUtility.IsBonusCardEquipped( "bonuscard_two_tacticals", classModel ) then
			RemoveItemFromClassSlot( "primarygadgetattachment1", controller )
		end
		RemoveItemFromClassSlot( prevLoadoutSlotName, controller, swappingItems )
		RemoveItemFromClassSlot( slotName, controller, false )
		currentSlotItemIndex = CoD.CACUtility.EmptyItemIndex
		canEquip = true
	end
	if not swappingItems then
		local totalAllocation = Engine.GetModelValue( allocationSpentModel )
		if IsIntDvarNonZero( "mp_prototype" ) or IsCampaign() or totalAllocation < Engine.GetMaxAllocation( controller ) then
			canEquip = true
		else
			CoD.perController[controller].overCapacityItemIndex = itemIndex
			local overCapacityPopup = OpenPopup( self, "OverCapacity", controller )
			overCapacityPopup.acceptData = {
				classNum = classNum,
				slotName = slotName,
				itemIndex = itemIndex
			}
			return false
		end
	end
	if canEquip == true and CoD.CACUtility.EmptyItemIndex < itemIndex then
		local itemName = Engine.GetItemRef( itemIndex )
		if itemName == "bonuscard_overkill" then
			RemoveItemFromClassSlot( "secondary", controller )
			if Engine.IsCampaignGame() then
				local loadoutSlotNames = CoD.CACUtility.loadoutSlotNames
				local primaryWeaponIndex = CoD.CACUtility.GetClassItem( controller, classNum, loadoutSlotNames.primaryWeapon )
				local smg_standard_index = tonumber( Engine.GetItemIndexFromReference( "smg_standard", Enum.eModes.MODE_CAMPAIGN ) )
				if primaryWeaponIndex == smg_standard_index then
					local ar_standard_index = tonumber( Engine.GetItemIndexFromReference( "ar_standard", Enum.eModes.MODE_CAMPAIGN ) )
					CoD.CACUtility.SetClassItem( controller, classNum, "secondary", ar_standard_index )
				else
					CoD.CACUtility.SetClassItem( controller, classNum, "secondary", smg_standard_index )
				end
			end
		elseif itemName == "bonuscard_two_tacticals" then
			RemoveItemFromClassSlot( "primarygadget", controller )
		end
		CoD.CACUtility.SetClassItem( controller, classNum, slotName, itemIndex, count )
	end
	if not ignoreGetCustomClassModel then
		CoD.CACUtility.GetCustomClassModel( controller, classNum, classModel )
	end
	return canEquip
end

function ToggleGadgetMod( self, controller, loadoutSlotName )
	local slotWidget = self.weaponSlotTable[loadoutSlotName]
	if not slotWidget then
		return 
	end
	slotWidget = slotWidget.widget
	local weaponSlotModel = slotWidget:getModel( controller, "weaponSlot" )
	local classModel = self:getModel()
	if weaponSlotModel and classModel then
		local weaponSlot = Engine.GetModelValue( weaponSlotModel )
		local availability, equipped, hintText = CoD.CACUtility.GetCACSlotStatus( controller, classModel, weaponSlot )
		local classNum = CoD.perController[controller].classNum
		local attemptAttachItemSuccess = false
		if availability == CoD.CACUtility.CACStatusAvailable.AVAILABLE then
			if equipped then
				RemoveItemFromClassSlot( weaponSlot, controller )
				self:playSound( "unequip_item" )
			else
				local gadgetSlot = "primarygadget"
				if not LUI.startswith( weaponSlot, gadgetSlot ) then
					gadgetSlot = "secondarygadget"
				end
				local gadgetItemModel = self:getModel( controller, gadgetSlot .. ".itemIndex" )
				if gadgetItemModel then
					local gadgetItemIndex = Engine.GetModelValue( gadgetItemModel )
					local gadgetModCount = Engine.GetNumGadgetAttachments( gadgetItemIndex, false )
					for i = 1, gadgetModCount, 1 do
						if Engine.IsTakeTwoGadgetAttachment( gadgetItemIndex, i ) then
							attemptAttachItemSuccess = AttemptAttachItem( self, controller, classModel, classNum, weaponSlot, i, nil )
							UpdateButtonPromptState( self, slotWidget, controller, Enum.LUIButton.LUI_KEY_XBX_PSSQUARE )
							self:playSound( "equip_mod" )
						end
					end
				end
			end
			self:processEvent( {
				name = "update_state",
				controller = controller
			} )
			self:processEvent( {
				name = "update_button_prompts",
				controller = controller
			} )
			local weaponName = nil
			local camera = "select01"
			if LUI.startswith( loadoutSlotName, "primarygadgetattachment" ) then
				weaponName = Engine.GetWeaponString( controller, classNum, "primarygadget" )
			elseif LUI.startswith( loadoutSlotName, "secondarygadgetattachment" ) then
				weaponName = Engine.GetWeaponString( controller, classNum, "secondarygadget" )
			end
			if equipped or attemptAttachItemSuccess == false then
				Engine.SendClientScriptNotify( controller, "CustomClass_remove" .. CoD.GetLocalClientAdjustedNum( controller ), {} )
			elseif weaponName and weaponName ~= "" then
				Engine.SendClientScriptNotify( controller, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( controller ), {
					base_weapon_slot = loadoutSlotName,
					weapon = weaponName,
					camera = camera
				} )
			end
		end
	end
end

function AttachWeaponVariant( self, controller, slotName, weaponVariantInfo, attachmentsByIndex, wildcarUnlockedTable, bonuscardGunfighterForSlot )
	local classModel = CoD.perController[controller].classModel
	local classNum = CoD.perController[controller].classNum
	local weaponIndex = weaponVariantInfo.weaponIndex
	local cacVariantIndex = weaponVariantInfo.cacVariantIndex
	local acvTable = weaponVariantInfo.attachmentVariant
	local ignoreGetCustomClassModel = true
	if not IsProgressionEnabled( controller ) or not weaponVariantInfo.isVariantLinkBroken then
		CoD.CACUtility.SetClassItem( controller, classNum, slotName .. "gunsmithvariant", cacVariantIndex )
	end
	RemoveItemFromClassSlot( slotName, controller )
	AttemptAttachItem( self, controller, classModel, classNum, slotName, weaponIndex, nil, ignoreGetCustomClassModel )
	CoD.CACUtility.SetClassItem( controller, classNum, slotName .. "camo", weaponVariantInfo.camoIndex )
	CoD.CACUtility.SetClassItem( controller, classNum, slotName .. "reticle", weaponVariantInfo.reticleIndex )
	local paintjobSlot = weaponVariantInfo.paintjobSlot
	local paintjobIndex = weaponVariantInfo.paintjobIndex
	if paintjobSlot and paintjobSlot ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and paintjobIndex ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
		CoD.CACUtility.SetClassItem( controller, classNum, slotName .. "paintjobslot", weaponVariantInfo.paintjobSlot )
		CoD.CACUtility.SetClassItem( controller, classNum, slotName .. "paintjobindex", weaponVariantInfo.paintjobIndex )
	end
	for _, wildcardInfo in ipairs( wildcarUnlockedTable ) do
		if not wildcardInfo.isLocked then
			local availableBonusCardSlot = nil
			for _, bonudCardSlotName in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
				if not CoD.CACUtility.ItemEquippedInSlot( bonudCardSlotName, controller, classModel ) then
					availableBonusCardSlot = bonudCardSlotName
					break
				end
			end
			if availableBonusCardSlot then
				AttemptAttachItem( self, controller, classModel, classNum, availableBonusCardSlot, wildcardInfo.itemIndex, nil, ignoreGetCustomClassModel )
			end
		end
	end
	for i, wildcardInfo in ipairs( attachmentsByIndex ) do
		local attachmentSlot = slotName .. "attachment" .. i
		if CoD.CACUtility.EmptyItemIndex < wildcardInfo then
			AttemptAttachItem( self, controller, classModel, classNum, attachmentSlot, wildcardInfo, nil, ignoreGetCustomClassModel )
			CoD.CACUtility.SetClassItem( controller, classNum, attachmentSlot .. "cosmeticvariant", acvTable[i] )
		end
	end
	CoD.CACUtility.GetCustomClassModel( controller, classNum, CoD.perController[controller].classModel )
end

function SetConfirmationInfoInternal( element, controller, itemIndexModel )
	local elementItemIndex = Engine.GetModelValue( itemIndexModel )
	local unlockTokenModel = Engine.GetModel( Engine.GetModelForController( controller ), "UnlockTokenInfo" )
	local unlockTokenItemIndexModel = Engine.GetModel( unlockTokenModel, "itemIndex" )
	Engine.SetModelValue( unlockTokenItemIndexModel, elementItemIndex )
	local xpBarInfoModel = Engine.GetModel( unlockTokenModel, "xpBarInfo" )
	if xpBarInfoModel then
		local playerStats = CoD.GetPlayerStats( controller )
		local rankXP = playerStats.PlayerStatsList.RANKXP.StatValue:get()
		local currentRank = playerStats.PlayerStatsList.RANK.StatValue:get()
		local prestige = playerStats.PlayerStatsList.PLEVEL.StatValue:get()
		local minXP, maxXP = CoD.AARUtility.GetMinMaxXPForRank( currentRank, controller )
		if not maxXP then
			maxXP = rankXP
		end
		local currLevel, currLevelIcon = CoD.AARUtility.GetLevelAndLevelIconForRank( currentRank, prestige )
		local nextLevel, nextLevelIcon = CoD.AARUtility.GetLevelAndLevelIconForRank( currentRank + 1, prestige )
		if IsInParagonCapableGameMode() and prestige == Engine.GetPrestigeCap() then
			rankXP = playerStats.PlayerStatsList.PARAGON_RANKXP.StatValue:get()
			currentRank = playerStats.PlayerStatsList.PARAGON_RANK.StatValue:get()
			minXP, maxXP = CoD.AARUtility.GetMinMaxXPForParagonRank( currentRank, controller )
			if not maxXP then
				maxXP = rankXP
			end
			currLevel = Engine.GetParagonRankDisplayLevel( currentRank )
			nextLevel = Engine.GetParagonRankDisplayLevel( currentRank + 1 )
			local paragonIconId = playerStats.PlayerStatsList.PARAGON_ICON_ID.StatValue:get()
			if paragonIconId ~= CoD.PrestigeUtility.INVALID_PARAGON_ICON_ID then
				currLevelIcon = Engine.GetParagonIconById( paragonIconId )
				nextLevelIcon = currLevelIcon
			end
		end
		Engine.SetModelValue( Engine.GetModel( xpBarInfoModel, "rankXP" ), rankXP )
		Engine.SetModelValue( Engine.GetModel( xpBarInfoModel, "xpEarned" ), 0 )
		Engine.SetModelValue( Engine.GetModel( xpBarInfoModel, "xpNeeded" ), maxXP - rankXP )
		Engine.SetModelValue( Engine.GetModel( xpBarInfoModel, "currLevel" ), currLevel )
		Engine.SetModelValue( Engine.GetModel( xpBarInfoModel, "currLevelIcon" ), currLevelIcon )
		Engine.SetModelValue( Engine.GetModel( xpBarInfoModel, "nextLevel" ), nextLevel )
		Engine.SetModelValue( Engine.GetModel( xpBarInfoModel, "nextLevelIcon" ), nextLevelIcon )
	end
	CoD.perController[controller].UnlockTokenInfo = unlockTokenModel
end

function SetWeaponOptionAsOldInternal( menu, element, controller, weaponItemIndex )
	local weaponOptionIndexModel = element:getModel( controller, "weaponOptionSubIndex" )
	local weaponOptionTypeModel = element:getModel( controller, "weaponOptionType" )
	local weaponOptionUnlockSessionModeModel = element:getModel( controller, "unlockSessionMode" )
	if weaponOptionIndexModel and weaponOptionTypeModel and weaponOptionUnlockSessionModeModel then
		local weaponOptionIndex = Engine.GetModelValue( weaponOptionIndexModel )
		local weaponOptionType = Engine.GetModelValue( weaponOptionTypeModel )
		local weaponOptionUnlockSessionMode = Engine.GetModelValue( weaponOptionUnlockSessionModeModel )
		if weaponOptionType ~= Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB and weaponOptionType ~= Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_INVALID and weaponOptionIndex > CoD.CACUtility.EmptyItemIndex then
			local optionItemIndex = Engine.GetWeaponOptionGroupIndex( weaponOptionIndex, weaponOptionType )
			Engine.SetWeaponOptionAsOld( controller, weaponItemIndex, optionItemIndex, weaponOptionUnlockSessionMode )
			if menu.categoryTabs and menu.categoryTabs.Tabs.grid then
				local activeIndex = menu.categoryTabs.Tabs.grid.savedActiveIndex
				local widget = menu.categoryTabs.Tabs.grid:getItemAt( activeIndex + 1 )
				if widget then
					local breadcrumbCountModel = widget:getModel( controller, "breadcrumbCount" )
					if breadcrumbCountModel then
						local newItemCount = 0
						if widget.filterEnum < Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_MODE_COUNT then
							newItemCount = Engine.WeaponOptionNewItemCount( controller, weaponItemIndex, weaponOptionType, widget.filterEnum )
						else
							newItemCount = Engine.WeaponOptionNewModeAgnosticItemCount( controller, weaponItemIndex, weaponOptionType, widget.filterEnum )
						end
						Engine.SetModelValue( breadcrumbCountModel, newItemCount )
					end
				end
			end
		end
	end
end

function SetACVASOldInternal( controller, weaponIndex, attachmentTableIndex, variantIndex, mode )
	Engine.SetACVItemOld( controller, weaponIndex, attachmentTableIndex, variantIndex, mode )
end

function GetCPDifficulty( controller, profileVarName )
	local difficulty = Engine.GetProfileVarInt( controller, profileVarName )
	if difficulty ~= 0 then
		return difficulty - 1
	else
		
	end
end

function SetCPDifficulty( controller, profileVarName, difficulty )
	Engine.SetProfileVar( controller, profileVarName, difficulty + 1 )
end

function SetHeroCardStateToDefault( menu, self, element, controller )
	local elementToNavigate = GetListItem( self, element )
	local newActiveWidget = elementToNavigate.activeWidget
	element:setState( "DefaultState", true )
	if newActiveWidget then
		elementToNavigate:setActiveItem( newActiveWidget )
	end
end

function NotifyScriptCharacterLoadoutChange( controller, newSlot )
	local frozenMoment = "weapon"
	if newSlot == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET then
		frozenMoment = "ability"
	end
	Engine.SendClientScriptNotify( controller, CoD.PlayerRoleUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( controller ), {
		param1 = "changeFrozenMoment",
		param2 = frozenMoment
	} )
end

function PreviewGesture_Internal( controller, xanim )
	Engine.SendClientScriptNotify( controller, CoD.PlayerRoleUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( controller ), {
		param1 = "previewGesture",
		param2 = xanim
	} )
end

function PreviewTaunt_Internal( controller, xanim )
	Engine.SendClientScriptNotify( controller, CoD.PlayerRoleUtility.Heroes.heroUpdateEvent .. CoD.GetLocalClientAdjustedNum( controller ), {
		param1 = "previewTaunt",
		param2 = xanim
	} )
end

function SetBrowseMode( controller )
	CoD.SetEditorProperties( controller, Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE, "editorMode" )
end

function EmblemEditor_SetLayerAndGroupCount( controller, customizationType )
	local totalLayers = CoD.perController[controller].totalLayers
	local usedLayerCount = Engine.GetUsedLayerCount( controller, customizationType, totalLayers )
	local layersUsedFraction = Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION", usedLayerCount, totalLayers )
	CoD.SetEditorProperties( controller, layersUsedFraction, "layersUsedFraction" )
	CoD.SetEditorProperties( controller, usedLayerCount, "layersUsed" )
	local totalGroups = CoD.perController[controller].totalGroups
	local usedgroupCount = Engine.GetUsedGroupCount( controller, customizationType, totalGroups )
	local groupsUsedFraction = Engine.Localize( "MENU_EMBLEM_LAYERS_USED_FRACTION", usedgroupCount, totalGroups - 1 )
	CoD.SetEditorProperties( controller, groupsUsedFraction, "groupsUsedFraction" )
	CoD.SetEditorProperties( controller, usedgroupCount, "groupsUsed" )
end

function EmblemEditor_SetScaleMode( controller, scaleMode )
	CoD.SetEditorProperties( controller, scaleMode, "scaleMode" )
	Engine.ExecNow( controller, "emblemSetScaleMode " .. scaleMode )
end

function EmblemEditor_SetMaterialScaleMode( controller, scaleMode )
	CoD.SetEditorProperties( controller, scaleMode, "materialScaleMode" )
	Engine.ExecNow( controller, "setMaterialScaleMode " .. scaleMode )
end

function EmblemEditor_GetLayerAndGroupIndex( widget, controller )
	local layerIndexModel = widget:getModel( controller, "layerIndex" )
	local layerIndex = Engine.GetModelValue( layerIndexModel )
	local groupIndexModel = widget:getModel( controller, "groupIndex" )
	local groupIndex = Engine.GetModelValue( groupIndexModel )
	return layerIndex .. " " .. groupIndex
end

function EmblemEditor_SetupDrawEmblem( controller, item1Widget, item2Widget )
	local layerAndGroupIndex = EmblemEditor_GetLayerAndGroupIndex( item1Widget, controller )
	item1Widget.emblemLayer.layerIcon.layerIcon:setupDrawEmblemLayer( GetEmblemLayerAndGroupIndex( controller, layerAndGroupIndex ) )
	item2Widget.emblemLayer.layerIcon.layerIcon:setupDrawEmblemLayer( GetEmblemLayerAndGroupIndex( controller, EmblemEditor_GetLayerAndGroupIndex( item2Widget, controller ) ) )
end

function EmblemEditor_SetSelectedLayerIndex( controller, layerWidget )
	local layerIndexModel = layerWidget:getModel( controller, "layerIndex" )
	if layerIndexModel then
		CoD.perController[controller].selectedLayerIndex = Engine.GetModelValue( layerIndexModel )
	end
end

function EmblemEditor_RecordComScoreEvent( self, controller, slotsUsed, totalSlots )
	local duration = 0
	if self.occludedMenu and self.occludedMenu.openTime then
		duration = Engine.milliseconds() - self.occludedMenu.openTime
	end
	local assets_used = Engine.GetEmblemSummaryString()
	CoD.MetricsUtility.EmblemEvent( controller, duration, assets_used, slotsUsed, totalSlots )
end

function EmblemChooseColor_SetupSelectedLayerColorModel( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local selectedColor = Engine.GetSelectedLayerColor( controller )
	local selectedColorString = CoD.ColorUtility.ConvertColor( selectedColor.red, selectedColor.green, selectedColor.blue )
	local selectedLayerColorModel = Engine.GetModel( perControllerModel, "Emblem.EmblemSelectedLayerColor" )
	local colorModel = Engine.GetModel( selectedLayerColorModel, "color" )
	Engine.SetModelValue( colorModel, selectedColorString )
	Engine.SetModelValue( Engine.GetModel( selectedLayerColorModel, "red" ), selectedColor.red * CoD.CraftUtility.EMBLEM_MAX_COLOR_COMPONENT_VALUE )
	Engine.SetModelValue( Engine.GetModel( selectedLayerColorModel, "green" ), selectedColor.green * CoD.CraftUtility.EMBLEM_MAX_COLOR_COMPONENT_VALUE )
	Engine.SetModelValue( Engine.GetModel( selectedLayerColorModel, "blue" ), selectedColor.blue * CoD.CraftUtility.EMBLEM_MAX_COLOR_COMPONENT_VALUE )
	local selectedColor1 = Engine.GetSelectedLayerColor1( controller )
	local selectedColor1String = CoD.ColorUtility.ConvertColor( selectedColor1.red, selectedColor1.green, selectedColor1.blue )
	local selectedLayerColor1Model = Engine.GetModel( perControllerModel, "Emblem.EmblemSelectedLayerColor1" )
	local color1Model = Engine.GetModel( selectedLayerColor1Model, "color" )
	Engine.SetModelValue( color1Model, selectedColor1String )
	Engine.SetModelValue( Engine.GetModel( selectedLayerColor1Model, "red" ), selectedColor1.red * CoD.CraftUtility.EMBLEM_MAX_COLOR_COMPONENT_VALUE )
	Engine.SetModelValue( Engine.GetModel( selectedLayerColor1Model, "green" ), selectedColor1.green * CoD.CraftUtility.EMBLEM_MAX_COLOR_COMPONENT_VALUE )
	Engine.SetModelValue( Engine.GetModel( selectedLayerColor1Model, "blue" ), selectedColor1.blue * CoD.CraftUtility.EMBLEM_MAX_COLOR_COMPONENT_VALUE )
	CoD.SetNoColorDataModel( controller )
end

function EmblemChooseColor_SetPointerPosition( bar, value )
	local barWidth, barHeight = bar:getLocalSize()
	local pointerPosition = barWidth * value
	bar.pointer:setLeftRight( true, false, pointerPosition, pointerPosition + 2 )
end

function EmblemChooseColor_SetShaderParams( controller, colorMixer )
	local selectedColor = CoD.GetSelectedColor( controller )
	if selectedColor ~= nil then
		colorMixer.redBar.bar:setShaderVector( 0, 0, selectedColor.green, selectedColor.blue, 1 )
		colorMixer.redBar.bar:setShaderVector( 1, 1, selectedColor.green, selectedColor.blue, 1 )
		EmblemChooseColor_SetPointerPosition( colorMixer.redBar, selectedColor.red )
		colorMixer.greenBar.bar:setShaderVector( 0, selectedColor.red, 0, selectedColor.blue, 1 )
		colorMixer.greenBar.bar:setShaderVector( 1, selectedColor.red, 1, selectedColor.blue, 1 )
		EmblemChooseColor_SetPointerPosition( colorMixer.greenBar, selectedColor.green )
		colorMixer.blueBar.bar:setShaderVector( 0, selectedColor.red, selectedColor.green, 0, 1 )
		colorMixer.blueBar.bar:setShaderVector( 1, selectedColor.red, selectedColor.green, 1, 1 )
		EmblemChooseColor_SetPointerPosition( colorMixer.blueBar, selectedColor.blue )
	end
end

function EmblemChooseColor_GetColorMixerElement( self, controller )
	local isGradientMode = CoD.GetEditorProperties( controller, "isGradientMode" )
	if isGradientMode == 0 then
		return self.colorMixerContainer.colorMixer
	else
		return self.colorGradientMixerContainer.colorMixer
	end
end

function EmblemChooseColor_GetGradientSliderElement( self, controller )
	return self.colorGradientContainer.gradientSlider
end

function EmblemChooseColor_ModifyColorModelValue( colorModel, step )
	local colorComponent = Engine.GetModelValue( colorModel )
	Engine.SetModelValue( colorModel, CoD.ColorUtility.ClampColor( colorComponent + step, 0, 255 ) )
end

function EmblemChooseColor_SetColorModelValue( colorModel, value )
	local colorComponent = CoD.ColorUtility.ClampColor( value, 0, 255 )
	Engine.SetModelValue( colorModel, colorComponent )
end

function EmblemChooseColor_SetLayerColor( element, controller )
	local red = Engine.GetModelValue( element:getModel( controller, "red" ) )
	local green = Engine.GetModelValue( element:getModel( controller, "green" ) )
	local blue = Engine.GetModelValue( element:getModel( controller, "blue" ) )
	local normalizationFactor = 1 / CoD.CraftUtility.EMBLEM_MAX_COLOR_COMPONENT_VALUE
	local colorNum = CoD.GetEditorProperties( controller, "colorNum" )
	Engine.ExecNow( controller, "emblemSetLayerColor " .. colorNum .. " " .. red * normalizationFactor .. " " .. green * normalizationFactor .. " " .. blue * normalizationFactor )
end

function EmblemChooseColor_SetPreviewColorModel( element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local selectedColor = CoD.GetSelectedColor( controller )
	if selectedColor ~= nil then
		local selectedColorString = CoD.ColorUtility.ConvertColor( selectedColor.red, selectedColor.green, selectedColor.blue )
		local selectedLayerEdittingColorModel = element:getModel( controller, "color" )
		Engine.SetModelValue( selectedLayerEdittingColorModel, selectedColorString )
	end
end

function EmblemChooseColor_SetBarProperties( self, element, colorModel, controller )
	EmblemChooseColor_SetLayerColor( element, controller )
	EmblemChooseColor_SetPreviewColorModel( element, controller )
	EmblemChooseColor_SetShaderParams( controller, self )
end

function EmblemGradient_SetupSwatchLastSavedColor( self, element, controller )
	local selectedLayerEdittingColorModel = DataSources.EmblemSelectedLayerEdittingColor.getModel( controller )
	self.colorGradientSwatchContainer:setModel( selectedLayerEdittingColorModel )
	self.colorGradientMixerContainer.colorMixer:setModel( selectedLayerEdittingColorModel )
end

function EmblemGradient_UpdateGradientVisuals( controller, element )
	local gradient_fill = Engine.GetModelValue( Engine.GetModel( Engine.GetModelForController( controller ), "Emblem.EmblemSelectedLayerProperties.gradient_fill" ) )
	local normalized_gradient_fill = gradient_fill / CoD.CraftUtility.EMBLEM_MAX_GRADIENT_SLIDER_VALUE
	local selectedColor = Engine.GetSelectedLayerColor( controller )
	local selectedColor1 = Engine.GetSelectedLayerColor1( controller )
	EmblemChooseColor_SetPointerPosition( element, normalized_gradient_fill )
	if selectedColor ~= nil and selectedColor1 ~= nil then
		element.bar:setShaderVector( 0, selectedColor.red, selectedColor.green, selectedColor.blue, selectedColor.alpha )
		element.bar:setShaderVector( 1, selectedColor1.red, selectedColor1.green, selectedColor1.blue, selectedColor1.alpha )
		element.bar:setShaderVector( 2, normalized_gradient_fill, 0, 0, 0 )
	end
end

function PaintJobEditor_RecordComScoreEvent( self, controller, model, operation, slotsUsed, totalSlots )
	local duration = 0
	if self.occludedMenu and self.occludedMenu.openTime then
		duration = Engine.milliseconds() - self.occludedMenu.openTime
	end
	local paintjobNameModel = Engine.GetModel( model, "paintjobName" )
	local paintjobName = Engine.GetModelValue( paintjobNameModel )
	local weaponIndex = Engine.GetModelValue( Engine.GetModel( model, "weaponIndex" ) )
	local assets_used = Engine.GetPaintshopSummaryString()
	CoD.MetricsUtility.PaintshopEvent( controller, operation, duration, weaponIndex, paintjobName, assets_used, slotsUsed, totalSlots )
end

function SetGroupsNotifyInformation( controller, title, message, isError )
	local perControllerModel = Engine.GetModelForController( controller )
	Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.notificationTitle" ), title )
	Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.notificationMessage" ), message )
	Engine.SetModelValue( Engine.GetModel( perControllerModel, "groups.notificationError" ), isError )
end

function ValidateCreateGroupInformation( self, element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local name = Engine.GetModelValue( Engine.GetModel( perControllerModel, "groups.createGroup.name" ) )
	local description = Engine.GetModelValue( Engine.GetModel( perControllerModel, "groups.createGroup.description" ) )
	if name == "" then
		OpenGenericSmallPopup( self, controller, "GROUPS_MISSING_GROUP_NAME_TITLE", "GROUPS_MISSING_GROUP_NAME_TEXT", nil, "MENU_OK" )
		return false
	else
		return true
	end
end

function Leaderboard_PageUp_Friends( self, element, controller )
	local elementToNavigate = GetListItem( self, element )
	local widget = nil
	if elementToNavigate.activeWidget ~= nil then
		local visibleRows = elementToNavigate.vCount
		local currentRow = elementToNavigate.activeWidget.gridInfoTable.gridRowIndex
		if currentRow == 1 then
			return 
		end
		local pageUpRow = math.max( currentRow - visibleRows, 1 )
		widget = elementToNavigate:getItemAtPosition( pageUpRow, 1, true )
	end
	if widget then
		elementToNavigate:setActiveItem( widget )
	end
end

function Leaderboard_PageUp_All( self, element, controller )
	local elementToNavigate = GetListItem( self, element )
	local widget = nil
	if not elementToNavigate.activeWidget then
		return 
	else
		local visibleRows = elementToNavigate.vCount
		local currentLocalRow = elementToNavigate.activeWidget.gridInfoTable.gridRowIndex
		local pageToLocalRow = currentLocalRow - visibleRows
		if pageToLocalRow > 0 then
			elementToNavigate:setActiveItem( elementToNavigate:getItemAtPosition( pageToLocalRow, 1, true ) )
			return 
		elseif not element:getModel() then
			return 
		else
			local currentGlobalRow = tonumber( Engine.GetModelValue( Engine.GetModel( element:getModel(), "position" ) ) )
			local pageToGlobalRow = currentGlobalRow - visibleRows
			if currentGlobalRow == 1 then
				return 
			elseif pageToGlobalRow < 1 then
				elementToNavigate:setActiveItem( elementToNavigate:getItemAtPosition( 1, 1, true ) )
				return 
			else
				CoD.perController[controller].pivotPosition = pageToGlobalRow
				CoD.perController[controller].leaderboardTopOrBottom = CoD.LeaderboardUtility.TOP
			end
		end
	end
end

function Leaderboard_PageDown_Friends( self, element, controller )
	local elementToNavigate = GetListItem( self, element )
	local widget = nil
	if elementToNavigate.activeWidget ~= nil then
		local visibleRows = elementToNavigate.vCount
		local currentRow = elementToNavigate.activeWidget.gridInfoTable.gridRowIndex
		if currentRow == elementToNavigate.requestedRowCount then
			return 
		end
		local pageDownRow = math.min( currentRow + visibleRows, elementToNavigate.requestedRowCount )
		widget = elementToNavigate:getItemAtPosition( pageDownRow, 1, true )
	end
	if widget then
		elementToNavigate:setActiveItem( widget )
	end
end

function Leaderboard_PageDown_All( self, element, controller )
	local elementToNavigate = GetListItem( self, element )
	local widget = nil
	if not elementToNavigate.activeWidget then
		return 
	else
		local visibleRows = elementToNavigate.vCount
		local currentLocalRow = elementToNavigate.activeWidget.gridInfoTable.gridRowIndex
		local pageToLocalRow = currentLocalRow + visibleRows
		if pageToLocalRow <= elementToNavigate.requestedRowCount then
			elementToNavigate:setActiveItem( elementToNavigate:getItemAtPosition( pageToLocalRow, 1, true ) )
			return 
		elseif not element:getModel() then
			return 
		else
			local f48_local0 = DataSources.LeaderBoardRows.getModel()
			local totalResults = f48_local0.totalCount:get()
			local currentGlobalRow = tonumber( Engine.GetModelValue( Engine.GetModel( element:getModel(), "position" ) ) )
			local pageToGlobalRow = currentGlobalRow + visibleRows
			if currentGlobalRow == totalResults then
				return 
			elseif totalResults < pageToGlobalRow then
				elementToNavigate:setActiveItem( elementToNavigate:getItemAtPosition( elementToNavigate.requestedRowCount, 1, true ) )
				return 
			else
				CoD.perController[controller].pivotPosition = pageToGlobalRow
				CoD.perController[controller].leaderboardTopOrBottom = CoD.LeaderboardUtility.BOTTOM
			end
		end
	end
end

function Leaderboard_GoToTopOfList_Friends( self, element, controller )
	local elementToNavigate = GetListItem( self, element )
	local widget = elementToNavigate:getItemAtPosition( 1, 1, true )
	if widget == element then
		return 
	elseif widget then
		elementToNavigate:setActiveItem( widget )
	end
end

function Leaderboard_GoToTopOfList_All( self, element, controller )
	local elementToNavigate = GetListItem( self, element )
	local widget = elementToNavigate:getItemAtPosition( 1, 1, true )
	local topLocalRow = tonumber( Engine.GetModelValue( Engine.GetModel( widget:getModel(), "position" ) ) )
	if topLocalRow == 1 then
		if widget ~= element then
			elementToNavigate:setActiveItem( widget )
		end
		return 
	else
		CoD.perController[controller].pivotPosition = 1
		CoD.perController[controller].leaderboardTopOrBottom = CoD.LeaderboardUtility.TOP
	end
end

function Gunsmith_ClearItemName( controller )
	local itemNameModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.GunsmithSelectedItemProperties.itemName" )
	Engine.SetModelValue( itemNameModel, "" )
end

function Gunsmith_RecordComScoreEvent( self, controller, model, operation, slotsUsed, totalSlots )
	local duration = 0
	if self.occludedMenu and self.occludedMenu.openTime then
		duration = Engine.milliseconds() - self.occludedMenu.openTime
	end
	local variantName = Engine.GetModelValue( Engine.GetModel( model, "variantName" ) )
	local weaponIndex = Engine.GetModelValue( Engine.GetModel( model, "weaponIndex" ) )
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, CoD.CraftUtility.Gunsmith.GetFileType() )
	local attachmentListStr = ""
	local variantIndex = Engine.GetModelValue( Engine.GetModel( model, "variantIndex" ) )
	local baseModel = CoD.perController[controller].gunsmithVariantModel
	local attachmentList = CoD.CraftUtility.Gunsmith.GetSortedAttachmentList( controller, baseModel )
	for attachmentIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
		local attachmentID = attachmentList.baseAttachmentList[attachmentIndex]
		if 0 < attachmentID then
			if 0 < string.len( attachmentListStr ) then
				attachmentListStr = attachmentListStr .. ","
			end
			attachmentListStr = attachmentListStr .. attachmentID
		end
	end
	CoD.MetricsUtility.GunsmithEvent( controller, operation, duration, weaponIndex, variantName, attachmentListStr, slotsUsed, totalSlots )
end

function Store_UpdatePSStoreIconCount( controller, step )
	if CoD.perController[controller].psStoreIconCount == nil then
		CoD.perController[controller].psStoreIconCount = 0
	end
	CoD.perController[controller].psStoreIconCount = math.max( CoD.perController[controller].psStoreIconCount + step, 0 )
end

function SelectLiveEventQuality_Internal( qualityId )
	if qualityId and qualityId ~= Dvar.hls_quality:get() then
		Dvar.hls_quality:set( qualityId )
		CoD.LiveEventUpdateCurrentFeed()
		local liveEventModel = DataSources.LiveEventViewer.getModel()
		if liveEventModel then
			local streamModel = Engine.GetModel( liveEventModel, "stream" )
			if streamModel then
				Engine.ForceNotifyModelSubscriptions( streamModel )
			end
		end
	end
end

function SetEmblemBackground_Internal( controller, backgroundId )
	Engine.ExecNow( controller, "emblemSelectBackground " .. backgroundId )
	if IsLive() then
		CoD.perController[controller].uploadProfile = true
		Engine.ExecNow( controller, "emblemSetProfile" )
	else
		Engine.SetProfileVar( controller, "default_background_index", backgroundId )
		Engine.ExecNow( controller, "invalidateEmblemComponent" )
	end
end

function FileshareCategorySelectorCategoryChanged( controller, category, communityDataType, communityDataTypeChanged )
	if category ~= nil and category ~= "" then
		CoD.FileshareUtility.SetCurrentCategory( category )
	else
		CoD.FileshareUtility.SetCurrentCategory( "paintjob" )
	end
	if CoD.FileshareUtility.GetIsGroupsMode( controller ) then
		local groupsDataType = Enum.FileshareGroupsDataType.FILESHARE_GROUPS_DATA_RECENT
		if category == "favorites" then
			groupsDataType = Enum.FileshareGroupsDataType.FILESHARE_GROUPS_DATA_FAVORITE
		elseif category == "featured" then
			groupsDataType = Enum.FileshareGroupsDataType.FILESHARE_GROUPS_DATA_FEATURED
		end
		Engine.FileshareFetchGroupContent( controller, category, groupsDataType )
	elseif CoD.FileshareUtility.GetIsCommunityMode( controller ) then
		Engine.FileshareFetchCommunityContent( controller, category, communityDataType )
	elseif CoD.FileshareUtility.GetIsUserMode( controller ) then
		local xuid = CoD.FileshareUtility.GetCurrentUser()
		if communityDataType == Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_RECENT then
			if category == "film" or category == "recentgames" then
				category = "film"
			end
			Engine.FileshareFetchCommunityContent( controller, category, Enum.FileshareCommunityDataType.FILESHARE_COMMUNITY_DATA_RECENT, xuid )
		else
			CoD.FileshareUtility.FetchContentForUser( controller, xuid )
		end
	end
	local previousCategory = CoD.FileshareUtility.GetPreviousCategory()
	if previousCategory ~= category or communityDataTypeChanged == true then
		CoD.FileshareUtility.SetDirty()
	end
	if previousCategory == "screenshot" and category ~= "screenshot" and category ~= "clip" then
		ResetThumbnailViewer( controller )
	end
	CoD.FileshareUtility.ProcessUIIndex( controller, category, 0 )
	CoD.FileshareUtility.SetPreviousCategory( category )
	if CoD.FileshareUtility.ShouldSetPreviewIconSizeShort( category ) then
		FileshareSetPreviewIconSizeShort()
	else
		FileshareSetPreviewIconSizeNormal()
	end
	CoD.FileshareUtility.SetCurrentFilter( "", "" )
	CoD.FileshareUtility.SetShowFileDetails( false )
	CoD.FileshareUtility.SetShowPublishNewDetails( false )
	CoD.FileshareUtility.SetShowCreateButton( false )
end

function IsCursorInsideAny( controller, elementList, event )
	for _, elem in ipairs( elementList ) do
		if elem:IsMouseInsideElement( event ) then
			return true
		end
	end
	return false
end

