function AlwaysFalse()
	return false
end

function AlwaysTrue()
	return true
end

function TestCondition()
	return true
end

function ConditionWithArguments( menu, element, event, arg1, expressionArg, booleanArg, menuName )
	return true
end

function IsInDefaultState( element )
	return element.currentState == "DefaultState"
end

function IsElementInState( element, stateName )
	return element.currentState == stateName
end

function IsListAtStart( self, listElementName, event )
	local listElement = self[listElementName]
	if listElement and listElement.activeWidget and (not event or not event.list or event.list == listElement) then
		return listElement.activeWidget:isFirstItem()
	else
		return false
	end
end

function IsListAtEnd( self, listElementName, event )
	local listElement = self[listElementName]
	if listElement and listElement.activeWidget and (not event or not event.list or event.list == listElement) then
		return listElement.activeWidget:isLastItem()
	else
		return false
	end
end

function IsWidgetInFocus( self, focusableElementName, event )
	if self[focusableElementName] then
		if event.idStack then
			local elementId = self[focusableElementName].id
			for _, id in ipairs( event.idStack ) do
				if id == elementId then
					return true
				end
			end
			return false
		elseif event.id then
			return self[focusableElementName]:hasChildWithID( event.id )
		else
			return self[focusableElementName]:doesElementOrChildHaveFocus()
		end
	else
		return false
	end
end

function IsFirstTimeSetup( controller )
	return Engine.GetProfileVarInt( controller, "com_first_time" ) == 1
end

function IsBooleanDvarSet( dvarName )
	if Dvar[dvarName] then
		return Dvar[dvarName]:get() == true
	else
		return false
	end
end

function IsIntDvarNonZero( dvarName )
	if Engine.DvarInt( nil, dvarName ) ~= 0 then
		return true
	else
		return false
	end
end

function IsInGame()
	return Engine.IsInGame()
end

function IsCurrentMenu( menu, menuNameArg )
	if menu.menuName == menuNameArg then
		return true
	else
		return false
	end
end

function PropertyIsTrue( self, propertyName )
	return self[propertyName] == true
end

function IsCampaign()
	return CoD.isCampaign
end

function IsMultiplayer()
	return CoD.isMultiplayer and not CoD.isCampaign
end

function IsZombies()
	return CoD.isZombie
end

function IsGroupsEnabled()
	local groupsEnabled = Dvar.groups_enabled:get()
	if groupsEnabled ~= nil and groupsEnabled == true then
		return true
	else
		return false
	end
end

function DoesHaveAdminRightsForGroup( element, controller )
	local f20_local0 = IsGroupOwner( element, controller )
	if not f20_local0 then
		f20_local0 = IsGroupAdmin( element, controller )
	end
	return f20_local0
end

local GetMemberStatusFromElement = function ( controller, element )
	local memberStatusModel = element:getModel( controller, "memberStatus" )
	local memberStatus = Engine.GetModelValue( memberStatusModel )
	return memberStatus
end

local GetMemberStatusFromModel = function ( parentModel )
	local memberStatusModel = Engine.GetModel( parentModel, "memberStatus" )
	local memberStatus = Engine.GetModelValue( memberStatusModel )
	return memberStatus
end

function IsNotAGroupMember( element, controller )
	local memberStatus = nil
	if CoD.perController[controller].selectedGroup then
		memberStatus = GetMemberStatusFromModel( CoD.perController[controller].selectedGroup )
	elseif element then
		memberStatus = GetMemberStatusFromElement( controller, element )
	end
	return memberStatus == Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_NONE
end

function IsGroupMember( element, controller )
	local memberStatus = nil
	if CoD.perController[controller].selectedGroup then
		memberStatus = GetMemberStatusFromModel( CoD.perController[controller].selectedGroup )
	elseif element then
		memberStatus = GetMemberStatusFromElement( controller, element )
	end
	return memberStatus == Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_MEMBER
end

function IsGroupAdmin( element, controller )
	local memberStatus = nil
	if CoD.perController[controller].selectedGroup then
		memberStatus = GetMemberStatusFromModel( CoD.perController[controller].selectedGroup )
	elseif element then
		memberStatus = GetMemberStatusFromElement( controller, element )
	end
	return memberStatus == Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_ADMIN
end

function IsGroupOwner( element, controller )
	local memberStatus = nil
	if CoD.perController[controller].selectedGroup then
		memberStatus = GetMemberStatusFromModel( CoD.perController[controller].selectedGroup )
	elseif element then
		memberStatus = GetMemberStatusFromElement( controller, element )
	end
	return memberStatus == Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_OWNER
end

function IsGroupListHeader( element )
	return element.type == "header"
end

function DoesGroupListHaveSelectedIcon( element )
	local f28_local0
	if element.showSelectedIcon == nil or element.showSelectedIcon ~= true then
		f28_local0 = false
	else
		f28_local0 = true
	end
	return f28_local0
end

function IsProcessingGroupTask( controller )
	local processingGroupTaskModel = GetProcessingGroupTaskModel( controller )
	local isProcessing = Engine.GetModelValue( processingGroupTaskModel )
	local f29_local0
	if isProcessing == nil or isProcessing ~= true then
		f29_local0 = false
	else
		f29_local0 = true
	end
	return f29_local0
end

function IsGroupEmblemEmpty( element, controller )
	local groupIdModel = nil
	if CoD.perController[controller].selectedGroup then
		groupIdModel = Engine.GetModel( CoD.perController[controller].selectedGroup, "groupId" )
	else
		groupIdModel = element:getModel( controller, "groupId" )
	end
	if groupIdModel ~= nil then
		local groupId = Engine.GetModelValue( groupIdModel )
		if groupId ~= nil then
			return Engine.IsGroupEmblemEmpty( controller, groupId )
		end
	end
	return true
end

function HasSelectedGroup( element, controller )
	local groupIdModel = nil
	if element ~= nil then
		if CoD.perController[controller].selectedGroup then
			groupIdModel = Engine.GetModel( CoD.perController[controller].selectedGroup, "groupId" )
		else
			groupIdModel = element:getModel( controller, "groupId" )
		end
		if groupIdModel ~= nil then
			local groupId = Engine.GetModelValue( groupIdModel )
			if groupId ~= nil and groupId ~= 0 then
				return true
			end
		end
	end
	return false
end

function HasPendingInvites( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local groupsModel = Engine.CreateModel( perControllerModel, "groups" )
	local groupInviteCountModel = Engine.CreateModel( groupsModel, "inviteCount" )
	local inviteCount = Engine.GetModelValue( groupInviteCountModel )
	local f32_local0
	if inviteCount == nil or inviteCount <= 0 then
		f32_local0 = false
	else
		f32_local0 = true
	end
	return f32_local0
end

function IsMemberOfAnyGroup( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local groupsModel = Engine.CreateModel( perControllerModel, "groups" )
	local groupCountModel = Engine.CreateModel( groupsModel, "groupCount_self" )
	local groupCount = Engine.GetModelValue( groupCountModel )
	local f33_local0
	if groupCount == nil or groupCount <= 0 then
		f33_local0 = false
	else
		f33_local0 = true
	end
	return f33_local0
end

function IsGroupHeadquartersTabSelected( controller, tabId )
	local perControllerModel = Engine.GetModelForController( controller )
	local groupsModel = Engine.CreateModel( perControllerModel, "groups" )
	local selectedGroupHeadquarterTabNameModel = Engine.CreateModel( groupsModel, "grouphqtabname" )
	local tabName = Engine.GetModelValue( selectedGroupHeadquarterTabNameModel )
	if tabName ~= nil and tabName == tabId then
		return true
	else
		return false
	end
end

function IsGroupLeaderboardInitialized()
	local leaderboardIndex, sortColumn, timeFrame, isHardcore, isInitialized = Engine.GetGroupLeaderboardInfo()
	local f35_local0
	if isInitialized == nil or isInitialized ~= true then
		f35_local0 = false
	else
		f35_local0 = true
	end
	return f35_local0
end

function IsGroupLeaderboardAvailable()
	local leaderboardIndex, sortColumn, timeFrame, isHardcore, isInitialized = Engine.GetGroupLeaderboardInfo()
	local f36_local0
	if isInitialized == nil or isInitialized ~= true or leaderboardIndex == nil or leaderboardIndex <= 0 then
		f36_local0 = false
	else
		f36_local0 = true
	end
	return f36_local0
end

function IsLeaderboardUpdating()
	local leaderboardModel = Engine.CreateModel( Engine.GetGlobalModel(), "leaderboard" )
	local leaderboardIsUpdatingModel = Engine.CreateModel( leaderboardModel, "isUpdating" )
	local isUpdating = Engine.GetModelValue( leaderboardIsUpdatingModel )
	local f37_local0
	if isUpdating == nil or isUpdating ~= true then
		f37_local0 = false
	else
		f37_local0 = true
	end
	return f37_local0
end

function IsLeaderboardEmpty()
	local leaderboardModel = Engine.CreateModel( Engine.GetGlobalModel(), "leaderboard" )
	local totalResults = Engine.GetModelValue( Engine.CreateModel( leaderboardModel, "totalResults" ) )
	local f38_local0
	if totalResults ~= nil and totalResults ~= 0 then
		f38_local0 = false
	else
		f38_local0 = true
	end
	return f38_local0
end

function IsGroupLeaderboardMakerState( controller, checkState )
	local perControllerModel = Engine.GetModelForController( controller )
	local groupsModel = Engine.CreateModel( perControllerModel, "groups" )
	local leaderboardMakerModel = Engine.CreateModel( groupsModel, "leaderboardmaker" )
	local leaderboardMakerState = Engine.CreateModel( leaderboardMakerModel, "state" )
	local state = Engine.GetModelValue( leaderboardMakerState )
	return state == checkState
end

function IsPlayerAGuest( controller )
	return Engine.IsGuest( controller )
end

function IsPlayerAllowedToViewMatureContent( controller )
	return Engine.IsContentRatingAllowed( controller )
end

function IsPlayerAllowedToPlayMultiplayerGames()
	return not Engine.IsAnyControllerMPRestricted()
end

function IsOutOfBounds( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local oobEndTime = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "hudItems.outOfBoundsEndTime" ) )
	local currentGameTime = Engine.CurrentGameTime()
	if currentGameTime == nil then
		return false
	elseif oobEndTime == nil then
		return false
	else
		return currentGameTime < oobEndTime
	end
end

function IsEnemyDetected( controller, direction, distance )
	local perControllerModel = Engine.GetModelForController( controller )
	local sixthsenseValue = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "hudItems.sixthsense" ) )
	local mask = 0
	if sixthsenseValue == nil then
		return false
	elseif distance == nil or distance == "" then
		distance = "far"
	end
	local offset = 1
	if distance == "close" then
		offset = 16
	end
	if direction == "front" then
		mask = offset << 0
	elseif direction == "back" then
		mask = offset << 1
	elseif direction == "left" then
		mask = offset << 2
	elseif direction == "right" then
		mask = offset << 3
	end
	return sixthsenseValue & mask ~= 0
end

function IsNewCACDvarSet()
	return Dvar.ui_newCAC:get()
end

function IsExtracamCACDvarSet()
	return Dvar.ui_extracamCAC:get()
end

function InWildcardsState( element )
	return element.currentState == "Wildcards"
end

function InWeaponsState( element )
	local f48_local0
	if element.currentState ~= "Weapons" and element.currentState ~= "DefaultState" then
		f48_local0 = false
	else
		f48_local0 = true
	end
	return f48_local0
end

function InEquipmentState( element )
	return element.currentState == "Equipment"
end

function InPerksState( element )
	return element.currentState == "Perks"
end

function IsCACLockedForEveryone()
	return Engine.IsItemLockedForAll( "FEATURE_CREATE_A_CLASS" )
end

function IsCACSlotOvercapacity2by1AspectRatio( element )
	local model = element:getModel()
	if model then
		local slotModel = Engine.GetModel( model, "itemSlot" )
		if slotModel then
			local slotName = Engine.GetModelValue( slotModel )
			local f52_local0
			if slotName ~= "primary" and slotName ~= "secondary" then
				f52_local0 = false
			else
				f52_local0 = true
			end
			return f52_local0
		end
	end
	return false
end

function IsCACSlotOvercapacityWildcard( element )
	local model = element:getModel()
	if model then
		local slotModel = Engine.GetModel( model, "itemSlot" )
		if slotModel then
			local slotName = Engine.GetModelValue( slotModel )
			return LUI.startswith( slotName, "bonuscard" )
		end
	end
	return false
end

function IsCACContextualWildcardOpen( controller )
	if CoD.perController[controller].CACWildcardContextualMenu then
		return true
	else
		return false
	end
end

function IsCACUsingOverkill( menu )
	local classModel = menu:getModel()
	if classModel then
		return CoD.CACUtility.IsBonusCardEquipped( "bonuscard_overkill", classModel )
	else
		return false
	end
end

function IsCACEquippingSlot( controller, slotName )
	return CoD.perController[controller].weaponCategory == slotName
end

function IsCACSlot2by1AspectRatio( element )
	local model = element:getModel()
	if model then
		local slotModel = Engine.GetModel( model, "weaponSlot" )
		if slotModel then
			local slotName = Engine.GetModelValue( slotModel )
			local f57_local0
			if slotName ~= "primary" and slotName ~= "secondary" then
				f57_local0 = false
			else
				f57_local0 = true
			end
			return f57_local0
		end
	end
	return false
end

function IsCACSlotInfopane2by1AspectRatio( element )
	local model = element:getModel()
	if model then
		local slotModel = Engine.GetModel( model, "weaponSlot" )
		if slotModel then
			local slotName = Engine.GetModelValue( slotModel )
			local f58_local0
			if slotName ~= "primary" and slotName ~= "secondary" then
				f58_local0 = LUI.startswith( slotName, "primaryattachment" )
				if not f58_local0 then
					f58_local0 = LUI.startswith( slotName, "secondaryattachment" )
				end
			else
				f58_local0 = true
			end
			return f58_local0
		end
	end
	return false
end

function IsCACItemEquipped( menu, element, controller )
	local searchingSlots = CoD.CACUtility.GetSlotListWithSlot( CoD.perController[controller].weaponCategory )
	local elementModel = element:getModel()
	if elementModel then
		local indexModel = Engine.GetModel( elementModel, "itemIndex" )
		if indexModel then
			local itemIndex = Engine.GetModelValue( indexModel )
			for index, slotName in ipairs( searchingSlots ) do
				if CoD.CACUtility.GetItemEquippedInSlot( slotName, controller ) == itemIndex then
					return true
				end
			end
		end
	end
	return false
end

function IsCACItemEquippable( menu, element, event )
	return true
end

function IsCACItemPurchasable( menu, element, event )
	return false
end

function IsCACItemPurchased( menu, element, controller )
	local elementModel = element:getModel()
	if elementModel then
		local indexModel = Engine.GetModel( elementModel, "itemIndex" )
		if indexModel then
			local itemIndex = Engine.GetModelValue( indexModel )
			return Engine.IsItemPurchased( controller, itemIndex )
		end
	end
	return false
end

function IsCACItemLocked( menu, element, controller )
	local searchingSlots = CoD.CACUtility.GetSlotListWithSlot( CoD.perController[controller].weaponCategory )
	local classModel = menu:getModel()
	local elementModel = element:getModel()
	if elementModel and classModel then
		local indexModel = Engine.GetModel( elementModel, "itemIndex" )
		if indexModel then
			local itemIndex = Engine.GetModelValue( indexModel )
			for index, slotName in ipairs( searchingSlots ) do
				if LUI.startswith( slotName, "primaryattachment" ) then
					local weaponModel = Engine.GetModel( classModel, "primary.itemIndex" )
					if weaponModel then
						local weaponIndex = Engine.GetModelValue( weaponModel )
						return Engine.IsItemAttachmentLocked( controller, weaponIndex, itemIndex )
					end
				end
				if LUI.startswith( slotName, "secondaryattachment" ) then
					local weaponModel = Engine.GetModel( classModel, "secondary.itemIndex" )
					if weaponModel then
						local weaponIndex = Engine.GetModelValue( weaponModel )
						return Engine.IsItemAttachmentLocked( controller, weaponIndex, itemIndex )
					end
				end
				return Engine.IsItemLocked( controller, itemIndex )
			end
		end
	elseif elementModel then
		local indexModel = Engine.GetModel( elementModel, "itemIndex" )
		if indexModel then
			local itemIndex = Engine.GetModelValue( indexModel )
			return Engine.IsItemLocked( controller, itemIndex )
		end
	end
	return false
end

function IsCACItemMutuallyExclusiveWithSelection( element, controller )
	local category = CoD.perController[controller].weaponCategory
	local itemIndex = CoD.CACUtility.EmptyItemIndex
	local elementItemIndexModel = element:getModel( controller, "itemIndex" )
	if elementItemIndexModel then
		itemIndex = Engine.GetModelValue( elementItemIndexModel )
	end
	return CoD.CACUtility.GetMutuallyExclusiveSlotName( category, controller, itemIndex ) ~= ""
end

function IsMenuPreviewImageSquare( menu )
	local menuName = menu.menuName
	if LUI.startswith( menuName, "PerkSelect" ) or LUI.startswith( menuName, "LethalEquipmentSelect" ) or LUI.startswith( menuName, "TacticalEquipmentSelect" ) or LUI.startswith( menuName, "SpecialGadgetSelect" ) or LUI.startswith( menuName, "WildcardSelect" ) then
		return true
	else
		return false
	end
end

function IsCybercoreAbilityAvailable( element, controller )
	local elementModel = element:getModel()
	if elementModel then
		local baseItemIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "baseItemIndex" ) )
		if Engine.IsItemPurchased( controller, baseItemIndex ) then
			return true
		end
		local prereqItemIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "prereqItemIndex" ) )
		if prereqItemIndex ~= -1 then
			return Engine.IsItemPurchased( controller, prereqItemIndex )
		end
	end
	return false
end

function IsCybercoreAbilityPurchasable( element, controller )
	local elementModel = element:getModel()
	if elementModel then
		local baseItemIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "baseItemIndex" ) )
		return not Engine.IsItemPurchased( controller, baseItemIndex )
	else
		return false
	end
end

function IsCybercoreAbilityUpgradable( element, controller )
	local elementModel = element:getModel()
	if elementModel then
		local baseItemIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "baseItemIndex" ) )
		local upgradeItemIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "upgradeItemIndex" ) )
		local basePurchased = Engine.IsItemPurchased( controller, baseItemIndex )
		if basePurchased and upgradeItemIndex then
			local upgradePurchased = Engine.IsItemPurchased( controller, upgradeItemIndex )
			return not upgradePurchased
		end
	end
	return false
end

function IsCybercoreAbilityUpgraded( element, controller )
	local elementModel = element:getModel()
	if elementModel then
		local upgradeItemIndex = Engine.GetModelValue( Engine.GetModel( elementModel, "upgradeItemIndex" ) )
		if upgradeItemIndex then
			return Engine.IsItemPurchased( controller, upgradeItemIndex )
		else
			return true
		end
	else
		return false
	end
end

function IsCurrentClassSelectedClass( menu, element )
	local elementModel = element:getModel()
	local menuModel = menu:getModel()
	if elementModel and menuModel and elementModel == menuModel then
		return true
	else
		return false
	end
end

function IsCACSlotHaveModel( element )
	local elementModel = element:getModel()
	if elementModel then
		local weaponSlotModel = Engine.GetModel( elementModel, "weaponSlot" )
		if weaponSlotModel then
			local weaponSlotName = Engine.GetModelValue( weaponSlotModel )
			if weaponSlotName == "primary" or weaponSlotName == "secondary" or LUI.startswith( weaponSlotName, "primaryattachment" ) or LUI.startswith( weaponSlotName, "secondaryattachment" ) or weaponSlotName == "primarygadget" or weaponSlotName == "secondarygadget" or LUI.startswith( weaponSlotName, "primarygadgetattachment" ) or LUI.startswith( weaponSlotName, "secondarygadgetattachment" ) then
				return true
			end
		end
	end
	return false
end

function IsCACSlotWeaponType( element )
	local elementModel = element:getModel()
	if elementModel then
		local weaponSlotModel = Engine.GetModel( elementModel, "weaponSlot" )
		if weaponSlotModel then
			local weaponSlotName = Engine.GetModelValue( weaponSlotModel )
			if weaponSlotName == "primary" or weaponSlotName == "secondary" or LUI.startswith( weaponSlotName, "primaryattachment" ) or LUI.startswith( weaponSlotName, "secondaryattachment" ) then
				return true
			end
		end
	end
	return false
end

local GetWeaponSlotModel = function ( menu, element, controller, classModel )
	if not controller or not classModel then
		return nil
	else
		local weaponSlotModel = element:getModel( controller, "weaponSlot" )
		if not weaponSlotModel then
			return nil
		else
			local weaponSlot = Engine.GetModelValue( weaponSlotModel )
			if not weaponSlot then
				return nil
			else
				return weaponSlot
			end
		end
	end
end

function IsCACSlotEquipped( menu, element, controller )
	if not controller then
		return false
	end
	local customModel = element:getModel( controller, "customWeaponSlot" )
	local customSlot = nil
	if customModel then
		customSlot = Engine.GetModelValue( customModel )
	end
	if customSlot then
		local elementModel = menu:getModel( controller, customSlot )
		if elementModel then
			local itemIndexModel = Engine.GetModel( elementModel, "itemIndex" )
			if itemIndexModel then
				local itemIndex = Engine.GetModelValue( itemIndexModel )
				local separatorStartIndex, separatorEndIndex = string.find( customSlot, "%." )
				local parentSlot = string.sub( customSlot, 0, separatorStartIndex - 1 )
				local possibleSlotList = CoD.CACUtility.GetAttachmentListForSlot( parentSlot )
				return CoD.CACUtility.GetAttachedItemSlot( menu:getModel(), itemIndex, possibleSlotList ) ~= nil
			end
		end
	else
		local classModel = menu:getModel()
		local weaponSlot = GetWeaponSlotModel( menu, element, controller, classModel )
		if weaponSlot then
			local availability, equipped, separatorEndIndex = CoD.CACUtility.GetCACSlotStatus( controller, classModel, weaponSlot )
			return equipped
		end
	end
	return false
end

function IsCACSlotAvailable( menu, element, controller )
	local classModel = menu:getModel()
	local weaponSlot = GetWeaponSlotModel( menu, element, controller, classModel )
	if weaponSlot then
		local availability, equipped, hintText = CoD.CACUtility.GetCACSlotStatus( controller, classModel, weaponSlot )
		return availability == CoD.CACUtility.CACStatusAvailable.AVAILABLE
	else
		return false
	end
end

function IsCACSlotNeedWildcard( menu, element, controller )
	local classModel = menu:getModel()
	local weaponSlot = GetWeaponSlotModel( menu, element, controller, classModel )
	if weaponSlot then
		local wildcardNeeded = CoD.CACUtility.WildcardNeededForSlot( weaponSlot )
		if wildcardNeeded then
			return true
		end
	end
	return false
end

function IsCACAnyPerkEquipped( menu )
	local classModel = menu:getModel()
	if classModel then
		return CoD.CACUtility.IsItemEquippedInAnySlot( classModel, CoD.CACUtility.CompletePerkSlotNameList )
	else
		return false
	end
end

function IsCACAnyWildcardEquipped( menu )
	local classModel = menu:getModel()
	if classModel then
		return CoD.CACUtility.IsItemEquippedInAnySlot( classModel, CoD.CACUtility.BonuscardSlotNameList )
	else
		return false
	end
end

function IsHintTextLeftAlign( element, controller )
	local slotModel = element:getModel( controller, "weaponSlot" )
	if slotModel then
		local slotName = Engine.GetModelValue( slotModel )
		if slotName == "primary" or slotName == "secondary" or LUI.startswith( slotName, "primarygadget" ) then
			return true
		end
	end
	return false
end

function IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
	local elementModel = element:getModel()
	local classModel = menu:getModel()
	if elementModel then
		local weaponSlotName = Engine.GetModelValue( Engine.GetModel( elementModel, "weaponSlot" ) )
		if LUI.startswith( weaponSlotName, "primaryattachment" ) then
			local availability, equipped, hintText = CoD.CACUtility.GetCACSlotStatus( controller, classModel, "primary" )
			return equipped
		elseif LUI.startswith( weaponSlotName, "secondaryattachment" ) then
			local availability, equipped, hintText = CoD.CACUtility.GetCACSlotStatus( controller, classModel, "secondary" )
			return equipped
		end
	end
	return false
end

function IsHintTextRightAlign( element, controller )
	local slotModel = element:getModel( controller, "weaponSlot" )
	if slotModel then
		local slotName = Engine.GetModelValue( slotModel )
		if slotName == "primaryattachment3" or slotName == "primaryattachment6" or slotName == "secondaryattachment3" or slotName == "specialty3" or slotName == "specialty6" then
			return true
		end
	end
	return false
end

function IsCACSlotAttachment( element )
	local elementModel = element:getModel()
	if elementModel then
		local weaponSlotName = Engine.GetModelValue( Engine.GetModel( elementModel, "weaponSlot" ) )
		if LUI.startswith( weaponSlotName, "primaryattachment" ) or LUI.startswith( weaponSlotName, "secondaryattachment" ) then
			return true
		end
	end
	return false
end

function IsCACSlotGadgetMod( element )
	local model = element:getModel()
	if model then
		local slotModel = Engine.GetModel( model, "itemSlot" )
		if slotModel then
			local slotName = Engine.GetModelValue( slotModel )
			local f83_local0 = LUI.startswith( slotName, "primarygadgetattachment" )
			if not f83_local0 then
				f83_local0 = LUI.startswith( slotName, "secondarygadgetattachment" )
			end
			return f83_local0
		end
	end
	return false
end

function IsCACAnyGreedWildcardUnequipped( element, controller )
	local weaponSlotModel = element:getModel( controller, "weaponSlot" )
	if weaponSlotModel then
		local weaponSlot = Engine.GetModelValue( weaponSlotModel )
		if weaponSlot == "specialty4" then
			return not CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_1_greed", controller ) ~= ""
		elseif weaponSlot == "specialty5" then
			return not CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_2_greed", controller ) ~= ""
		elseif weaponSlot == "specialty6" then
			return not CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_3_greed", controller ) ~= ""
		end
	end
	return false
end

function IsCACSpecificWildcardEquipped( menu, wildcardName )
	local classModel = menu:getModel()
	if classModel then
		return CoD.CACUtility.IsBonusCardEquipped( wildcardName, classModel )
	else
		return false
	end
end

function IsCACSpecificSlotEquipped( menu, controller, slotName )
	local classModel = menu:getModel()
	if classModel then
		local availability, equipped, hintText = CoD.CACUtility.GetCACSlotStatus( controller, classModel, slotName )
		return equipped
	else
		return false
	end
end

local GetNumberOfAttachmentsForSlot = function ( slotName, controller )
	if not controller then
		return 0
	end
	local currentClass = CoD.perController[controller].classModel
	if currentClass then
		local slotModel = Engine.GetModel( currentClass, slotName )
		if slotModel then
			local itemIndexModel = Engine.GetModel( slotModel, "itemIndex" )
			if itemIndexModel then
				local itemIndex = Engine.GetModelValue( itemIndexModel )
				if itemIndex ~= 0 then
					return Engine.GetNumAttachments( itemIndex ) - 1
				end
			end
		end
	end
	return 0
end

function IsCACGadgetModAvailable( menu, element, controller )
	local classModel = menu:getModel()
	if not controller or not classModel then
		return false
	end
	local weaponSlotModel = element:getModel( controller, "weaponSlot" )
	if not weaponSlotModel then
		return false
	end
	local slotName = Engine.GetModelValue( weaponSlotModel )
	local gadgetSlotName = "primarygadget"
	if LUI.startswith( slotName, "primarygadgetattachment" ) then
		gadgetSlotName = "primarygadget"
	elseif LUI.startswith( slotName, "secondarygadgetattachment" ) then
		gadgetSlotName = "secondarygadget"
	end
	if CoD.CACUtility.ItemEquippedInSlot( gadgetSlotName, controller ) then
		local indexModel = Engine.GetModel( classModel, gadgetSlotName .. ".cust" .. slotName .. ".itemIndex" )
		if indexModel then
			local itemIndex = Engine.GetModelValue( indexModel )
			if itemIndex > CoD.CACUtility.EmptyItemIndex then
				return true
			end
		end
	end
	return false
end

function IsCACSlotRequiresWildcard( menu, element, controller )
	local classModel = menu:getModel()
	if not controller or not classModel then
		return false
	else
		local weaponSlotModel = element:getModel( controller, "weaponSlot" )
		if not weaponSlotModel then
			return false
		else
			local weaponSlot = Engine.GetModelValue( weaponSlotModel )
			if not weaponSlot then
				return false
			else
				local availability, equipped, hintText = CoD.CACUtility.GetCACSlotStatus( controller, classModel, weaponSlot )
				return availability == CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			end
		end
	end
end

function IsCACThirdPrimaryAttachmentAvailable( controller )
	return CoD.CACUtility.SearchForBonusCard( "bonuscard_primary_gunfighter", controller ) ~= ""
end

function IsCACSecondSecondaryAttachmentAvailable( controller )
	return CoD.CACUtility.SearchForBonusCard( "bonuscard_secondary_gunfighter", controller ) ~= ""
end

local IsTakeTwoGadgetAttachmentForSlot = function ( classModel, customModel, slotName )
	if customModel and classModel then
		local indexModel = Engine.GetModel( customModel, "itemIndex" )
		local gadgetModel = Engine.GetModel( classModel, slotName )
		if indexModel and gadgetModel then
			local gadgetIndexModel = Engine.GetModel( gadgetModel, "itemIndex" )
			if gadgetIndexModel then
				local attachmentIndex = Engine.GetModelValue( indexModel )
				local gadgetIndex = Engine.GetModelValue( gadgetIndexModel )
				if gadgetIndex > CoD.CACUtility.EmptyItemIndex then
					return Engine.IsTakeTwoGadgetAttachment( gadgetIndex, attachmentIndex )
				end
			end
		end
	end
	return false
end

local SearchForTakeTwoGadgetMod = function ( classModel, possibleSlots )
	if classModel then
		for index, slotName in ipairs( possibleSlots ) do
			local slotModel = Engine.GetModel( classModel, slotName )
			if slotModel then
				local itemIndexModel = Engine.GetModel( slotModel, "itemIndex" )
				if itemIndexModel and Engine.GetModelValue( itemIndexModel ) == 1 then
					return true
				end
			end
		end
	end
	return false
end

function IsCACTakeTwoPrimaryGadgetAttachmentEquipped( menu )
	return SearchForTakeTwoGadgetMod( menu:getModel(), CoD.CACUtility.PrimaryGadgetAttachmentSlotNameList )
end

function IsCACTakeTwoSecondaryGadgetAttachmentEquipped( menu )
	return SearchForTakeTwoGadgetMod( menu:getModel(), CoD.CACUtility.SecondaryGadgetAttachmentSlotNameList )
end

function IsCACTakeTwoPrimaryGadgetAttachment( menu, element )
	return IsTakeTwoGadgetAttachmentForSlot( menu:getModel(), element:getModel(), "primarygadget" )
end

function IsCACTakeTwoSecondaryGadgetAttachment( menu, element )
	return IsTakeTwoGadgetAttachmentForSlot( menu:getModel(), element:getModel(), "secondarygadget" )
end

function IsPrimaryWeaponAttachmentAvailable( controller )
	return CoD.CACUtility.ItemEquippedInSlot( "primary", controller ) and GetNumberOfAttachmentsForSlot( "primary", controller ) > 0
end

function IsSecondaryWeaponAttachmentAvailable( controller )
	return CoD.CACUtility.ItemEquippedInSlot( "secondary", controller ) and GetNumberOfAttachmentsForSlot( "secondary", controller ) > 0
end

function IsPrimaryEquipmentModAvailable( menu, element, event )
	return IsCACGadgetModAvailable( menu, element, event )
end

function IsSecondaryEquipmentModAvailable( menu, element, event )
	return IsCACGadgetModAvailable( menu, element, event )
end

function IsPerk1PlusEquipped( menu, controller )
	return CoD.CACUtility.GetItemEquippedInSlot( "specialty4", controller, menu:getModel() ) ~= 0
end

function IsPerk2PlusEquipped( menu, controller )
	return CoD.CACUtility.GetItemEquippedInSlot( "specialty5", controller, menu:getModel() ) ~= 0
end

function IsPerk3PlusEquipped( menu, controller )
	return CoD.CACUtility.GetItemEquippedInSlot( "specialty6", controller, menu:getModel() ) ~= 0
end

function IsCACInfopaneItemNameEmpty( element, controller )
	local nameModel = element:getModel( controller, "name" )
	local elementModel = element:getModel()
	if nameModel and Engine.GetModelValue( nameModel ) == "" then
		return true
	else
		return false
	end
end

function IsCACWeaponVariantAvailable( element, controller )
	if not Gunsmith_IsEnabled( element, controller ) then
		return false
	end
	local elementModel = element:getModel()
	if elementModel then
		local refModel = Engine.GetModel( elementModel, "ref" )
		local itemIndexModel = Engine.GetModel( elementModel, "itemIndex" )
		if itemIndexModel then
			local itemIndex = Engine.GetModelValue( itemIndexModel )
			local weaponVariantList = CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList( itemIndex )
			if #weaponVariantList > 1 then
				CoD.perController[controller].weaponIndexForVariant = itemIndex
				return true
			end
		end
	end
	return false
end

function IsCACSlotHasVariantName( element )
	local slotModel = element:getModel()
	if slotModel then
		local variantModel = Engine.GetModel( slotModel, "variantName" )
		if variantModel and Engine.GetModelValue( variantModel ) ~= "" then
			return true
		end
	end
	return false
end

function IsPC()
	return CoD.isPC
end

function IsOrbis()
	return CoD.isPS4
end

function IsDurango()
	return CoD.isDurango
end

function IsModelValueMyClientNum( event, controller )
	local clientNum = Engine.GetPredictedClientNum( controller )
	return event.modelValue == clientNum
end

function AmICarryingEnemyFlag( controller )
	local playerName = Engine.GetPlayerName( controller )
	local flagCarrierModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CTF.enemyFlagCarrier" )
	local f112_local0
	if flagCarrierModel == nil or playerName ~= Engine.GetModelValue( flagCarrierModel ) then
		f112_local0 = false
	else
		f112_local0 = true
	end
	return f112_local0
end

function IsFriendlyFlagHeld( controller )
	local flagCarrierModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CTF.friendlyFlagCarrier" )
	if flagCarrierModel then
		flagCarrierModel = Engine.GetModel( flagCarrierModel, "friendlyFlagCarrier" )
	end
	if event.friendlyCarrier then
		local flagCarrierModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CTF" )
		if flagCarrierModel then
			flagCarrierModel = Engine.GetModel( flagCarrierModel, "enemyFlagCarrier" )
		end
		return true
	else
		return false
	end
end

function HasNetworkConnection()
	return Engine.CheckNetConnection() == true
end

function IsPlayerSignedInToLive( controller )
	return Engine.IsSignedInToLive( controller )
end

function IsPlayerJoinable( element )
	local joinableModel = element:getModel()
	if joinableModel then
		joinableModel = Engine.GetModel( joinableModel, "isJoinable" )
	end
	local f116_local0
	if not joinableModel or Engine.GetModelValue( joinableModel ) ~= 1 then
		f116_local0 = false
	else
		f116_local0 = true
	end
	return f116_local0
end

function IsPlayerDoneFetchingDemonwareData( controller )
	return Engine.IsDemonwareFetchingDone( controller )
end

function IsSystemLinkLobby()
	return Engine.GetLobbyNetworkMode() == CoD.LOBBY.MODE_LAN
end

function IsMP()
	local mainModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyGlobalRoot.lobbyMainMode" )
	if Engine.GetModelValue( mainModeModel ) == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		return true
	else
		return false
	end
end

function IsCP()
	local mainModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyGlobalRoot.lobbyMainMode" )
	if Engine.GetModelValue( mainModeModel ) == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		return true
	else
		return false
	end
end

function IsZM()
	local mainModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyGlobalRoot.lobbyMainMode" )
	if Engine.GetModelValue( mainModeModel ) == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		return true
	else
		return false
	end
end

function IsMainModeInvalid()
	local mainModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyGlobalRoot.lobbyMainMode" )
	if Engine.GetModelValue( mainModeModel ) == Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID then
		return true
	else
		return false
	end
end

function IsMainModeInvalidAndNotTheaterMode()
	local mainModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyGlobalRoot.lobbyMainMode" )
	if Engine.GetModelValue( mainModeModel ) == Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID and not Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) then
		return true
	else
		return false
	end
end

function IsLive()
	local sessionModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyGlobalRoot.lobbyNetworkMode" )
	if Engine.GetModelValue( sessionModeModel ) == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		return true
	else
		return false
	end
end

function IsLAN()
	local sessionModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyGlobalRoot.lobbyNetworkMode" )
	if Engine.GetModelValue( sessionModeModel ) == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		return true
	else
		return false
	end
end

function IsLocal()
	local sessionModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyGlobalRoot.lobbyNetworkMode" )
	if Engine.GetModelValue( sessionModeModel ) == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LOCAL then
		return true
	else
		return false
	end
end

function IsCustomLobby()
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	local f127_local0
	if lobbyNav ~= LobbyData.UITargets.UI_CPLOBBYONLINECUSTOMGAME.id and lobbyNav ~= LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME.id and lobbyNav ~= LobbyData.UITargets.UI_ZMLOBBYONLINECUSTOMGAME.id then
		f127_local0 = false
	else
		f127_local0 = true
	end
	return f127_local0
end

function IsGameLobby()
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	if lobbyNav then
		local menu = LobbyData:UITargetFromId( lobbyNav )
		return menu.lobbyType == Enum.LobbyType.LOBBY_TYPE_GAME
	else
		
	end
end

function IsGameLobbyActive()
	return Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
end

function IsLobbyNetworkModeLocal()
	return Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LOCAL
end

function IsLobbyNetworkModeLAN()
	return Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN
end

function IsLobbyNetworkModeLive()
	return Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
end

function IsLobbyPrivateHost()
	return Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
end

function IsLobbyGameHost()
	return Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
end

function ShouldShowPlaylistName()
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	local f135_local0
	if lobbyNav ~= LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id and lobbyNav ~= LobbyData.UITargets.UI_ZMLOBBYONLINEPUBLICGAME.id then
		f135_local0 = false
	else
		f135_local0 = true
	end
	return f135_local0
end

function IsAddControllerTextItem( element )
	return element.isAddControllerTextItem
end

function IsPlayerCountItem( element )
	return element.isPlayerCountItem
end

function IsSelfItem( element, controller )
	local isLocalModel = element:getModel( controller, "isLocal" )
	if isLocalModel ~= nil then
		local isLocal = Engine.GetModelValue( isLocalModel )
		return isLocal == 1
	else
		return element.isSelfItem
	end
end

function IsParentPartyMemberItem( element, controller )
	local isMemberModel = element:getModel( controller, "isMember" )
	if isMemberModel ~= nil then
		local isMember = Engine.GetModelValue( isMemberModel )
		return isMember == 1
	else
		local f139_local0
		if element:getParent() ~= nil then
			f139_local0 = element:getParent()
			f139_local0 = f139_local0.isPartyMemberItem
		else
			f139_local0 = false
		end
	end
	return f139_local0
end

function IsPartyMemberItem( element, controller )
	local isMemberModel = element:getModel( controller, "isMember" )
	if isMemberModel ~= nil then
		local isMember = Engine.GetModelValue( isMemberModel )
		return isMember == 1
	else
		return element.isPartyMemberItem
	end
end

function IsFriendItem( element )
	return element.isFriendItem
end

function IsGroupsItem( element )
	return element.isGroupsItem
end

function IsMorePlayingItem( element )
	return element.isMorePlaying
end

function ShouldPlayLobbyFadeAnim( menu, controller )
	return menu.previousMenuName and f144_local0 or menu.previousMenuName == "ModeSelect"
end

function IsLANServerBrowserEmpty()
	local serversModel = Engine.GetModel( Engine.GetGlobalModel(), "serverListRoot" )
	local countModel = Engine.GetModel( serversModel, "count" )
	local count = Engine.GetModelValue( countModel )
	if count == 0 then
		return true
	else
		return false
	end
end

function LANServerBrowserCheckFilterTest( menu, filterText )
	if menu.currentFilter == filterText then
		return true
	elseif not menu.currentFilter and filterText == "all" then
		return true
	else
		return false
	end
end

function PlayerListCountIsAtLeast1()
	return Engine.PartyGetPlayerCount() >= 1
end

function PlayerListCountIsAtLeast2()
	return Engine.PartyGetPlayerCount() >= 2
end

function PlayerListCountIsAtLeast3()
	return Engine.PartyGetPlayerCount() >= 3
end

function PlayerListCountIsAtLeast4()
	return Engine.PartyGetPlayerCount() >= 4
end

function CanAffordRaidPurchase( menu, element, controller )
	local cost = Engine.GetModelValue( element:getModel( controller, "cost" ) )
	local bank = Engine.GetModelValue( menu:getModel( controller, "bank" ) )
	return cost <= bank
end

function RaidPurchaseItemDisabled( menu, element, controller )
	local scriptID = Engine.GetModelValue( element:getModel( controller, "id" ) )
	local disableModel = menu:getModel( controller, "disable_" .. scriptID )
	return disableModel ~= nil
end

function RaidPurchaseAllowedForParent( menu, element, controller )
	return CanAffordRaidPurchase( menu, element:getParent(), controller ) and not RaidPurchaseItemDisabled( menu, element:getParent(), controller )
end

function RaidPurchaseAllowed( menu, element, controller )
	return CanAffordRaidPurchase( menu, element, controller ) and not RaidPurchaseItemDisabled( menu, element, controller )
end

function IsStoreAvailable()
	if not CoD.isPC and not CoD.isWIIU and Engine.IsFFOTDFetched() and Dvar.ui_inGameStoreVisible:get() == true and (CoD.isPS3 ~= true or CoD.isZombie ~= true) then
		return true
	else
		return false
	end
end

function IsPlayerDead( element, controller )
	local f156_local0 = element:getParent()
	local model = f156_local0:getModel( controller, "clientNum" )
	if model then
		return Engine.IsPlayerDead( controller, Engine.GetModelValue( model ) )
	else
		return false
	end
end

function IsPlayerInLastStand( element, controller )
	local f157_local0 = element:getParent()
	local model = f157_local0:getModel( controller, "clientNum" )
	if model then
		return Engine.IsPlayerInLastStand( controller, Engine.GetModelValue( model ) )
	else
		return false
	end
end

function PlayerListCountIs1( element )
	return DataSources.PlayerList.getCount( element.playerScores ) <= 1
end

function PlayerListCountIs2( element )
	return DataSources.PlayerList.getCount( element.playerScores ) == 2
end

function PlayerListCountIs3( element )
	return DataSources.PlayerList.getCount( element.playerScores ) == 3
end

function PlayerListCountIs4( element )
	return DataSources.PlayerList.getCount( element.playerScores ) >= 4
end

function PlayerHasAnObjective( element, controller )
	local f162_local0 = element:getParent()
	local model = f162_local0:getModel( controller, "objectiveIcon" )
	if model then
		return Engine.GetModelValue( model ) ~= ""
	else
		return false
	end
end

function IsThereRoomForAnotherSplitscreenPlayer()
	local usedControllers = Engine.GetUsedControllerCount()
	return usedControllers < 2
end

function IsWaitingForSignInToPlaySplitscreen()
	local availableControllers = Engine.GetNonUsedControllerCount()
	return availableControllers > 0
end

function IsWaitingForAdditionalControllerToPlaySplitscreen()
	local f165_local0
	if not IsWaitingForSignInToPlaySplitscreen() then
		f165_local0 = IsThereRoomForAnotherSplitscreenPlayer()
	else
		f165_local0 = false
	end
	return f165_local0
end

function HasPerksInAnySlot( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local perkCount = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "perks.perk0_count" ) )
	if perkCount ~= nil and perkCount > 0 then
		return true
	else
		perkCount = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "perks.perk1_count" ) )
		if perkCount ~= nil and perkCount > 0 then
			return true
		else
			perkCount = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "perks.perk2_count" ) )
			if perkCount ~= nil and perkCount > 0 then
				return true
			else
				return false
			end
		end
	end
end

function HasPerksInSlot0( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local perkCount = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "perks.perk0_count" ) )
	local f167_local0
	if perkCount == nil or perkCount <= 0 then
		f167_local0 = false
	else
		f167_local0 = true
	end
	return f167_local0
end

function HasOnePerkInSlot0( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local perkCount = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "perks.perk0_count" ) )
	local f168_local0
	if perkCount == nil or perkCount ~= 1 then
		f168_local0 = false
	else
		f168_local0 = true
	end
	return f168_local0
end

function HasTwoPerksInSlot0( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local perkCount = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "perks.perk0_count" ) )
	local f169_local0
	if perkCount == nil or perkCount ~= 2 then
		f169_local0 = false
	else
		f169_local0 = true
	end
	return f169_local0
end

function HasPerksInSlot1( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local perkCount = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "perks.perk1_count" ) )
	local f170_local0
	if perkCount == nil or perkCount <= 0 then
		f170_local0 = false
	else
		f170_local0 = true
	end
	return f170_local0
end

function HasOnePerkInSlot1( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local perkCount = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "perks.perk1_count" ) )
	local f171_local0
	if perkCount == nil or perkCount ~= 1 then
		f171_local0 = false
	else
		f171_local0 = true
	end
	return f171_local0
end

function HasTwoPerksInSlot1( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local perkCount = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "perks.perk1_count" ) )
	local f172_local0
	if perkCount == nil or perkCount ~= 2 then
		f172_local0 = false
	else
		f172_local0 = true
	end
	return f172_local0
end

function HasPerksInSlot2( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local perkCount = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "perks.perk2_count" ) )
	local f173_local0
	if perkCount == nil or perkCount <= 0 then
		f173_local0 = false
	else
		f173_local0 = true
	end
	return f173_local0
end

function HasOnePerkInSlot2( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local perkCount = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "perks.perk2_count" ) )
	local f174_local0
	if perkCount == nil or perkCount ~= 1 then
		f174_local0 = false
	else
		f174_local0 = true
	end
	return f174_local0
end

function HasTwoPerksInSlot2( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local perkCount = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "perks.perk2_count" ) )
	local f175_local0
	if perkCount == nil or perkCount ~= 2 then
		f175_local0 = false
	else
		f175_local0 = true
	end
	return f175_local0
end

function ShouldBootUpHUD( menu )
	return not menu.hasBooted
end

function OverheatWeaponVisible( controller )
	local hudItemsModel = Engine.GetModel( Engine.GetModelForController( controller ), "hudItems" )
	if hudItemsModel then
		local visibilityModel = Engine.CreateModel( hudItemsModel, "overheatWeaponVisible" )
		if Engine.GetModelValue( visibilityModel ) then
			return true
		end
	end
end

function IsWeaponClipGreaterThanOrEqualTo( controller, expressionArg )
	local perControllerModel = Engine.GetModelForController( controller )
	local model = Engine.GetModel( perControllerModel, "currentWeapon.clipMaxAmmo" )
	if model == nil then
		return false
	else
		local modelValue = Engine.GetModelValue( model )
		if modelValue == nil then
			return false
		else
			return expressionArg <= modelValue
		end
	end
end

function WeaponUsesAmmo( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local model = Engine.GetModel( perControllerModel, "currentWeapon.weapon" )
	if model == nil then
		return false
	end
	local weapon = Engine.GetModelValue( model )
	if weapon == nil then
		return false
	else
		local f179_local0
		if not Engine.IsWeaponType( weapon, "melee" ) and not Engine.IsWeaponType( weapon, "riotshield" ) then
			f179_local0 = not Engine.IsWeaponType( weapon, "grenade" )
		else
			f179_local0 = false
		end
	end
	return f179_local0
end

function WeaponHasAmmo( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local stockModel = Engine.GetModel( perControllerModel, "currentWeapon.ammoStock" )
	local clipModel = Engine.GetModel( perControllerModel, "currentWeapon.ammoInClip" )
	if stockModel == nil or clipModel == nil then
		return false
	else
		local stockModelValue = Engine.GetModelValue( stockModel )
		local clipModelValue = Engine.GetModelValue( clipModel )
		if stockModelValue == nil or clipModelValue == nil then
			return false
		else
			return stockModelValue + clipModelValue > 0
		end
	end
end

function IsInPrematchPeriod()
	local prematchPeriod = Engine.GetGametypeSetting( "prematchperiod" ) * 1000
	local currentGameTime = Engine.CurrentGameTime()
	return currentGameTime < prematchPeriod
end

function IsLowAmmoClip( controller )
	local lowClip = Engine.IsAmmoClipLow( controller )
	if lowClip then
		return lowClip
	else
		return false
	end
end

function IsHeroWeaponGadgetCurrentWeapon( menu, controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( slot ) and Engine.IsGadgetCurrentWeapon( controller, slot ) then
		menu.wasHeroWeaponActivated = true
		return true
	else
		return false
	end
end

function IsHeroWeaponOrGadgetInUse( menu, controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( slot ) then
		if Engine.IsGadgetCurrentWeapon( controller, slot ) then
			menu.wasHeroWeaponActivated = true
			return true
		else
			return false
		end
	else
		local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
		if not Engine.isValidGadgetSlot( slot ) then
			return false
		else
			local perControllerModel = Engine.GetModelForController( controller )
			local power = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "playerAbilities.playerGadget3.powerRatio" ) )
			if power == nil then
				return false
			else
				return Engine.isGadgetActive( controller, slot )
			end
		end
	end
end

function IsHeroWeaponSpeedBurst( menu, controller )
	return IsModelValueEqualTo( controller, "playerAbilities.playerGadget3.name", "WEAPON_GADGET_SPEED_BURST" )
end

function HasPerk( controller, perkId )
	return Engine.HasPerk( controller, "specialty_combat_efficiency" )
end

function IsHeroWeaponOrGadgetEnergyAtLeast( controller, exprMinRatio )
	local perControllerModel = Engine.GetModelForController( controller )
	local power = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "playerAbilities.playerGadget3.powerRatio" ) )
	if power == nil then
		return false
	else
		return exprMinRatio <= power
	end
end

function IsCurrentViewmodelWeaponName( controller, weaponName )
	local weaponNameForMode = weaponName .. "_" .. CoD.gameMode:lower()
	local model = Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.viewmodelWeaponName" )
	local f188_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f188_local1 = f188_local0 and modelValue
	local f188_local2
	if f188_local1 == nil or f188_local1 ~= weaponNameForMode then
		f188_local2 = false
	else
		f188_local2 = true
	end
	return f188_local2
end

function IsHeroWeaponGadgetAmmoEmpty( menu, controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	local gadgetslot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if not (slot == -1 or not Engine.isValidGadgetSlot( slot )) or gadgetslot ~= -1 and Engine.isValidGadgetSlot( gadgetslot ) then
		local perControllerModel = Engine.GetModelForController( controller )
		local ammo = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "playerAbilities.playerGadget3.ammo" ) )
		if ammo == nil or ammo < 1 then
			menu.wasHeroWeaponActivated = false
			return true
		end
	end
	return false
end

function IsPrimaryOffhandGadgetAmmoBased( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_PRIMARY )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.IsAmmoBasedGadget( controller, slot )
	else
		return false
	end
end

function IsSecondaryOffhandGadgetAmmoBased( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SECONDARY )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.IsAmmoBasedGadget( controller, slot )
	else
		return false
	end
end

function IsSpecialOffhandGadgetAmmoBased( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.IsAmmoBasedGadget( controller, slot )
	else
		return false
	end
end

function IsHeroWeaponGadgetAmmoBased( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.IsAmmoBasedGadget( controller, slot )
	else
		return false
	end
end

function IsPrimaryOffhandGadgetPowerBased( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_PRIMARY )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.IsPowerBasedGadget( controller, slot )
	else
		return false
	end
end

function IsSecondaryOffhandGadgetPowerBased( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SECONDARY )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.IsPowerBasedGadget( controller, slot )
	else
		return false
	end
end

function IsSpecialOffhandGadgetPowerBased( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.IsPowerBasedGadget( controller, slot )
	else
		return false
	end
end

function IsHeroWeaponGadgetPowerBased( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.IsPowerBasedGadget( controller, slot )
	else
		return false
	end
end

function IsPrimaryOffhandGadgetPowerBar( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_PRIMARY )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.IsPowerBarGadget( controller, slot )
	else
		return false
	end
end

function IsSecondaryOffhandGadgetPowerBar( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SECONDARY )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.IsPowerBarGadget( controller, slot )
	else
		return false
	end
end

function IsSpecialOffhandGadgetPowerBar( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.IsPowerBarGadget( controller, slot )
	else
		return false
	end
end

function IsHeroWeaponGadgetPowerBar( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.IsPowerBarGadget( controller, slot )
	else
		return false
	end
end

function WasHeroWeaponGadgetActivated( menu )
	local f202_local0
	if menu.wasHeroWeaponActivated ~= nil then
		f202_local0 = menu.wasHeroWeaponActivated
	else
		f202_local0 = false
	end
	return f202_local0
end

function isHeroVersion_2_0( controller, slot )
	return Engine.isHeroVersion_2_0( controller, slot )
end

function HeroVersion_2_0_ShouldUseInUseGadget( menu, controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( slot ) and isHeroVersion_2_0( controller, slot ) then
		return true
	else
		return not IsHeroWeaponGadgetCurrentWeapon( menu, controller )
	end
end

function IsHeroWeaponOrSpecialGadgetAvailable( menu, controller )
	if IsHeroWeaponGadgetAvailable( menu, controller ) then
		return true
	end
	local perControllerModel = Engine.GetModelForController( controller )
	local power = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "playerAbilities.playerGadget3.powerRatio" ) )
	local f205_local0
	if power == nil or power < 1 then
		f205_local0 = false
	else
		f205_local0 = true
	end
	return f205_local0
end

function IsSpecialGadgetAvailable( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.IsGadgetAvailable( controller, slot )
	else
		return false
	end
end

function IsHeroAbilityWeapon( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	return Engine.isValidGadgetSlot( slot )
end

function IsHeroAbilityGadget( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	return Engine.isValidGadgetSlot( slot )
end

function IsHeroWeaponGadgetAvailable( menu, controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( slot ) then
		if not Engine.IsGadgetAvailable( controller, slot ) then
			return false
		elseif Dvar.ui_newHUD:get() then
			if isHeroVersion_2_0( controller, slot ) then
				return Engine.IsGadgetReady( controller, slot )
			else
				return not IsHeroWeaponGadgetAmmoEmpty( menu, controller )
			end
		else
			return true
		end
	else
		return false
	end
end

function IsPrimaryOffhandGadgetFlickering( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_PRIMARY )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.IsGadgetFlickering( controller, slot )
	else
		return false
	end
end

function IsSecondaryOffhandGadgetFlickering( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SECONDARY )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.IsGadgetFlickering( controller, slot )
	else
		return false
	end
end

function IsSpecialOffhandGadgetFlickering( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.IsGadgetFlickering( controller, slot )
	else
		return false
	end
end

function IsHeroWeaponGadgetFlickering( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.IsGadgetFlickering( controller, slot )
	else
		return false
	end
end

function IsPrimaryOffhandGadgetActive( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_PRIMARY )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.isGadgetActive( controller, slot )
	else
		return false
	end
end

function IsSecondaryOffhandGadgetActive( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SECONDARY )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.isGadgetActive( controller, slot )
	else
		return false
	end
end

function IsSpecialOffhandGadgetActive( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.isGadgetActive( controller, slot )
	else
		return false
	end
end

function IsHeroWeaponGadgetActive( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.isGadgetActive( controller, slot )
	else
		return false
	end
end

function IsPrimaryOffhandGadgetCharging( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_PRIMARY )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.isGadgetCharging( controller, slot )
	else
		return false
	end
end

function IsSecondaryOffhandGadgetCharging( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SECONDARY )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.isGadgetCharging( controller, slot )
	else
		return false
	end
end

function IsSpecialOffhandGadgetCharging( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_OFFHAND_SPECIAL )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.isGadgetCharging( controller, slot )
	else
		return false
	end
end

function IsHeroWeaponGadgetCharging( controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( slot ) then
		return Engine.isGadgetCharging( controller, slot )
	else
		return false
	end
end

function PulseNoLethal( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local pulse = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "hudItems.pulseNoLethal" ) )
	if pulse == nil or pulse <= 0 then
		return false
	end
	local selectedClassNum = CoD.T6ChangeClass.SelectedClassIndex[controller]
	if selectedClassNum ~= nil then
		local primaryGrenadeIndex = Engine.GetClassItem( controller, selectedClassNum, "primarygadget" )
		if primaryGrenadeIndex == CoD.CACUtility.EmptyItemIndex then
			return false
		end
	end
	return true
end

function PulseNoTactical( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local pulse = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "hudItems.pulseNoTactical" ) )
	if pulse == nil or pulse <= 0 then
		return false
	end
	local selectedClassNum = CoD.T6ChangeClass.SelectedClassIndex[controller]
	if selectedClassNum ~= nil then
		local specialGrenadeIndex = Engine.GetClassItem( controller, selectedClassNum, "secondarygadget" )
		if specialGrenadeIndex == CoD.CACUtility.EmptyItemIndex then
			return false
		end
	end
	return true
end

function PulseNoAmmo( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local pulse = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "hudItems.pulseNoAmmo" ) )
	local f224_local0
	if pulse == nil or pulse <= 0 then
		f224_local0 = false
	else
		f224_local0 = true
	end
	return f224_local0
end

function IsStickyImageActive( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local stickyImage = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "hudItems.stickyImage" ) )
	local f225_local0 = stickyImage
	local f225_local1
	if stickyImage == "" or stickyImage == "blacktransparent" then
		f225_local1 = false
	else
		f225_local1 = f225_local0 and true
	end
	return f225_local1
end

function IsShockImageBottomActive( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local shockImage = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "hudItems.shockImageBottom" ) )
	local f226_local0 = shockImage
	local f226_local1
	if shockImage == "" or shockImage == "blacktransparent" then
		f226_local1 = false
	else
		f226_local1 = f226_local0 and true
	end
	return f226_local1
end

function IsShockImageRightActive( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local shockImage = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "hudItems.shockImageRight" ) )
	local f227_local0 = shockImage
	local f227_local1
	if shockImage == "" or shockImage == "blacktransparent" then
		f227_local1 = false
	else
		f227_local1 = f227_local0 and true
	end
	return f227_local1
end

function IsShockImageLeftActive( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local shockImage = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "hudItems.shockImageLeft" ) )
	local f228_local0 = shockImage
	local f228_local1
	if shockImage == "" or shockImage == "blacktransparent" then
		f228_local1 = false
	else
		f228_local1 = f228_local0 and true
	end
	return f228_local1
end

function IsShockImageTopActive( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local shockImage = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "hudItems.shockImageTop" ) )
	local f229_local0 = shockImage
	local f229_local1
	if shockImage == "" or shockImage == "blacktransparent" then
		f229_local1 = false
	else
		f229_local1 = f229_local0 and true
	end
	return f229_local1
end

function IsArmorOverlayActive( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local armorImage = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "hudItems.armorOverlay" ) )
	local f230_local0 = armorImage
	local f230_local1
	if armorImage == "" or armorImage == "blacktransparent" then
		f230_local1 = false
	else
		f230_local1 = f230_local0 and true
	end
	return f230_local1
end

function IsAnyKillstreakInRangeAvailable( controller, numArgStart, numArgEnd )
	local killstreaksModel = Engine.GetModel( Engine.GetModelForController( controller ), "killstreaks" )
	if not killstreaksModel then
		return false
	end
	for streak = numArgStart, numArgEnd, 1 do
		local killstreakModel = Engine.GetModel( killstreaksModel, "killstreak" .. streak .. ".rewardAmmo" )
		local f231_local2 = killstreakModel
		local streakAvailable = Engine.GetModelValue( killstreakModel )
		local f231_local3 = f231_local2 and streakAvailable
		if f231_local3 ~= nil and f231_local3 > 0 then
			return true
		end
	end
	return false
end

function HigherKillstreakHasAmmo( controller, element )
	if element.gridInfoTable == nil then
		return false
	else
		local index = 3 - element.gridInfoTable.zeroBasedIndex
		if index >= 3 then
			return false
		else
			return IsAnyKillstreakInRangeAvailable( controller, index + 1, 4 )
		end
	end
end

function LowerKillstreakHasAmmo( controller, element )
	if element.gridInfoTable == nil then
		return false
	else
		local index = 3 - element.gridInfoTable.zeroBasedIndex
		if index == 0 then
			return false
		else
			return IsAnyKillstreakInRangeAvailable( controller, 0, index - 1 )
		end
	end
end

function EarningTowardsThisKillstreak( controller, element )
	local rewardMomentumModel = Engine.GetModel( Engine.GetModelForController( controller ), "rewardMomentum" )
	local momentumCostModel = Engine.GetModel( element:getModel(), "momentumCost" )
	local killstreaksModel = Engine.GetModel( Engine.GetModelForController( controller ), "killstreaks" )
	if element.gridInfoTable == nil then
		return false
	elseif not momentumCostModel or not rewardMomentumModel or not killstreaksModel then
		return false
	else
		local momentumCost = Engine.GetModelValue( momentumCostModel )
		local rewardMomentum = Engine.GetModelValue( rewardMomentumModel )
		if rewardMomentum == nil or momentumCost == nil or momentumCost < rewardMomentum then
			return false
		else
			local index = 3 - element.gridInfoTable.zeroBasedIndex
			if index == 0 then
				return true
			else
				local killstreakModel = Engine.GetModel( killstreaksModel, "killstreak" .. index - 1 .. ".momentumCost" )
				local f234_local0 = killstreakModel
				local killstreakMomentum = Engine.GetModelValue( killstreakModel )
				local f234_local1 = f234_local0 and killstreakMomentum
				if f234_local1 == nil or rewardMomentum < f234_local1 then
					return false
				else
					return true
				end
			end
		end
	end
end

function IsAtLeastHalfGameScore( controller, modelArg )
	local controllerModel = Engine.GetModelForController( controller )
	local f235_local0 = controllerModel
	local scoreLimit = Engine.GetModel( controllerModel, "gameScore.scoreLimit" )
	local f235_local1 = f235_local0 and scoreLimit
	if f235_local1 then
		f235_local1 = Engine.GetModelValue( f235_local1 )
	end
	local f235_local2 = controllerModel
	local model = Engine.GetModel( controllerModel, modelArg )
	local f235_local3 = f235_local2 and model
	local f235_local4 = f235_local3
	local modelValue = Engine.GetModelValue( f235_local3 )
	local f235_local5 = f235_local4 and modelValue
	local f235_local6
	if f235_local1 == nil or f235_local5 == nil or f235_local1 > f235_local5 * 2 then
		f235_local6 = false
	else
		f235_local6 = true
	end
	return f235_local6
end

function IsCursorHintActive( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local showCursorHint = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "hudItems.showCursorHint" ) )
	local f236_local0
	if showCursorHint == nil or showCursorHint ~= true then
		f236_local0 = false
	else
		f236_local0 = true
	end
	return f236_local0
end

function IsGameTypeDOA()
	local f237_local0
	if Dvar.ui_gametype == nil or Dvar.ui_gametype:get() ~= "doa" then
		f237_local0 = false
	else
		f237_local0 = true
	end
	return f237_local0
end

function HideScoreMeterDueToGameType()
	local actualGameType = Engine.DvarString( nil, "g_gametype" )
	local f238_local0
	if actualGameType == nil or actualGameType ~= "ctf" and actualGameType ~= "dem" and actualGameType ~= "sd" then
		f238_local0 = false
	else
		f238_local0 = true
	end
	return f238_local0
end

function IsGameTypeCodfu( menu, element, event )
	local f239_local0
	if Dvar.ui_gametype == nil or Dvar.ui_gametype:get() ~= "codfu" then
		f239_local0 = false
	else
		f239_local0 = true
	end
	return f239_local0
end

function HasRoundLimit( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local roundLimitModel = Engine.CreateModel( perControllerModel, "gameScore.roundLimit" )
	local roundLimit = Engine.GetModelValue( roundLimitModel )
	return roundLimit > 0
end

function IsSingleRound( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local roundLimitModel = Engine.CreateModel( perControllerModel, "gameScore.roundLimit" )
	local roundLimit = Engine.GetModelValue( roundLimitModel )
	return roundLimit == 1
end

function IsMyTeamAxis( controller )
	local team = Engine.GetTeamID( controller, Engine.GetPredictedClientNum( controller ) )
	return team == Enum.team_t.TEAM_AXIS
end

function IsMyTeamAllies( controller )
	local team = Engine.GetTeamID( controller, Engine.GetPredictedClientNum( controller ) )
	return team == Enum.team_t.TEAM_ALLIES
end

function IsYourTeamWinning( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local yourScoreModel = Engine.CreateModel( perControllerModel, "gameScore.yourScore" )
	local yourScore = Engine.GetModelValue( yourScoreModel )
	local enemyScoreModel = Engine.CreateModel( perControllerModel, "gameScore.enemyScore" )
	local enemyScore = Engine.GetModelValue( enemyScoreModel )
	if enemyScore and yourScore then
		return enemyScore < yourScore
	else
		
	end
end

function IsYourTeamLosing( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local yourScoreModel = Engine.CreateModel( perControllerModel, "gameScore.yourScore" )
	local yourScore = Engine.GetModelValue( yourScoreModel )
	local enemyScoreModel = Engine.CreateModel( perControllerModel, "gameScore.enemyScore" )
	local enemyScore = Engine.GetModelValue( enemyScoreModel )
	if enemyScore and yourScore then
		return yourScore < enemyScore
	else
		
	end
end

function IsInOvertime( controller )
	return CoD.IsInOvertime( controller )
end

function IsSelectPreviousTabEvent( event )
	local f247_local0
	if event.button == "shoulderl" then
		f247_local0 = event.down
	else
		f247_local0 = false
	end
	return f247_local0
end

function IsSelectNextTabEvent( event )
	local f248_local0
	if event.button == "shoulderr" then
		f248_local0 = event.down
	else
		f248_local0 = false
	end
	return f248_local0
end

function IsSelectUpEvent( event )
	local f249_local0
	if event.button == "up" then
		f249_local0 = event.down
	else
		f249_local0 = false
	end
	return f249_local0
end

function IsSelectDownEvent( event )
	local f250_local0
	if event.button == "down" then
		f250_local0 = event.down
	else
		f250_local0 = false
	end
	return f250_local0
end

function IsParentListInFocus( element )
	local parentGrid = element.gridInfoTable.parentGrid
	if parentGrid and parentGrid.hasListFocus then
		return true
	else
		return false
	end
end

function IsDisabled( element, controller )
	local disabledFunctionModel = element:getModel( controller, "disabledFunction" )
	if disabledFunctionModel then
		local disabledFunction = Engine.GetModelValue( disabledFunctionModel )
		if disabledFunction then
			element.disabled = disabledFunction()
			return disabledFunction()
		end
	end
	local disabledModel = element:getModel( controller, "disabled" )
	if disabledModel then
		element.disabled = Engine.GetModelValue( disabledModel )
	end
	return element.disabled
end

function IsOddIndexItem( element )
	local parent = element:getParent()
	if parent == nil or parent.gridInfoTable == nil or parent.gridInfoTable.zeroBasedIndex == nil then
		return false
	else
		return parent.gridInfoTable.zeroBasedIndex % 2 == 1
	end
end

function ListHasElements( self )
	local f254_local0
	if self.layoutItems == nil or #self.layoutItems <= 0 then
		f254_local0 = false
	else
		f254_local0 = true
	end
	return f254_local0
end

function IsFirstItem( self )
	return self.isFirstItem and self:isFirstItem()
end

function IsLastItem( self )
	return self.isLastItem and self:isLastItem()
end

function ShouldDisplayButton( element, controller )
	local iconModel = element:getModel( controller, "tabIcon" )
	if iconModel then
		return Engine.GetModelValue( iconModel ) ~= ""
	else
		return false
	end
end

function IsHeroLocked( element, controller )
	local disabledModel = element:getModel( controller, "disabled" )
	if not disabledModel or Engine.GetModelValue( disabledModel ) then
		return true
	else
		return false
	end
end

function IsHeroOnDisabledLoadoutItem( element )
	local item = element.item
	if item then
		local infoArea = item.infoArea
		if infoArea then
			local loadoutOptions = infoArea.loadoutOptions
			if loadoutOptions and loadoutOptions.activeWidget then
				return loadoutOptions.activeWidget.disabled
			end
		end
	end
	return true
end

function IsSmallHeroCategory( element )
	return element.categorySize == CoD.CCUtility.Heroes.SmallCategory
end

function IsEdittingHeroOption( menu )
	return menu.currentMode ~= CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions
end

function IsHeroColorOption( element )
	return element.isColorOption
end

function IsLoadoutSelectionSlot( element )
	return element.equippedSlot ~= nil
end

function HeroUsingWeapon( self, controller )
	if self.equippedSlot then
		return self.equippedSlot == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON
	else
		local equippedModel = self:getModel( controller, "equippedSlot" )
		if equippedModel then
			return Engine.GetModelValue( equippedModel ) == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON
		else
			return false
		end
	end
end

function IsEdittingLoadoutForHero()
	return CoD.CCUtility.Heroes.edittingLoadoutForWidget ~= nil
end

function IsCurrentEdittingLoadForHeroWidget( self )
	return CoD.CCUtility.Heroes.edittingLoadoutForWidget == self
end

function IsCurrentSelectedHeroOption( self, controller )
	local optionIndexModel = self:getModel( controller, "optionIndex" )
	if optionIndexModel then
		local optionIndex = Engine.GetModelValue( optionIndexModel )
		if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
			if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
				return optionIndex == CoD.CCUtility.Heroes.selectionTable.bodyColors[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex] + 1
			elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
				return optionIndex == CoD.CCUtility.Heroes.selectionTable.helmetColors[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex] + 1
			end
		elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
			return optionIndex == CoD.CCUtility.Heroes.selectionTable.selectedBody + 1
		elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
			return optionIndex == CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1
		end
	end
	return false
end

function IsObjectiveActive( element, controller )
	local statusModel = element:getModel( controller, "status" )
	if statusModel then
		local f268_local0
		if Engine.GetModelValue( statusModel ) ~= "current" and Engine.GetModelValue( statusModel ) ~= "active" then
			f268_local0 = false
		else
			f268_local0 = true
		end
		return f268_local0
	else
		return false
	end
end

function IsObjectiveComplete( element, controller )
	local statusModel = element:getModel( controller, "status" )
	if statusModel then
		return Engine.GetModelValue( statusModel ) == "done"
	else
		return false
	end
end

function IsObjectiveFailed( element, controller )
	local statusModel = element:getModel( controller, "status" )
	if statusModel then
		return Engine.GetModelValue( statusModel ) == "failed"
	else
		return false
	end
end

function IsObjectiveDescription( element, controller )
	local statusModel = element:getModel( controller, "status" )
	if statusModel then
		return Engine.GetModelValue( statusModel ) == "description"
	else
		return false
	end
end

function IsObjectiveHidden( element, controller )
	if element:getModel() == nil then
		return true
	else
		local stateModel = Engine.GetModel( element:getModel(), "state" )
		local f272_local0 = stateModel
		local state = Engine.GetModelValue( stateModel )
		local f272_local1 = f272_local0 and state
		local clientNum = Engine.GetPredictedClientNum( controller )
		if f272_local1 == nil or f272_local1 == CoD.OBJECTIVESTATE_INVISIBLE then
			return true
		else
			local clientUseMaskModel = Engine.GetModel( element:getModel(), "clientUseMask" )
			local f272_local2 = clientUseMaskModel
			local clientUseMask = Engine.GetModelValue( clientUseMaskModel )
			local f272_local3 = f272_local2 and clientUseMask
			if f272_local3 == nil or f272_local3 == 0 then
				return false
			else
				local clientNum = Engine.GetPredictedClientNum( controller )
				return f272_local3 & 1 << clientNum == 0
			end
		end
	end
end

function IsObjectiveRequirementLabelHidden( element, controller )
	local activeObjectiveID = Engine.GetModel( Engine.GetModelForController( controller ), "interactivePrompt.activeObjectiveID" )
	if activeObjectiveID then
		activeObjectiveID = Engine.GetModelValue( activeObjectiveID )
	end
	if activeObjectiveID and element.objIndex == activeObjectiveID then
		if element.recenter then
			element:recenter()
		end
		return false
	else
		return true
	end
end

function WC_SelectingCategory( menu )
	return menu.currentMode == CoD.WC_Category.Modes.SELECTING_CATEGORY
end

function WC_SelectingItem( menu )
	return menu.currentMode == CoD.WC_Category.Modes.SELECTING_ITEM
end

function IsPaintJobCustomItem( element, controller )
	local currentFilter = DataSources.WeaponOptions.getCurrentFilterItem()
	if currentFilter == "paintjob" then
		local refModel = element:getModel( controller, "ref" )
		if refModel then
			local refName = Engine.GetModelValue( refModel )
			if refName == "paintshop_1" then
				return true
			end
		end
	end
	return false
end

function IsPaintJobCustomListButton( element, controller )
	local typeModel = element:getModel( controller, "type" )
	local paintjobSlotModel = element:getModel( controller, "paintjobSlot" )
	local paintjobIndexModel = element:getModel( controller, "paintjobIndex" )
	if typeModel and paintjobSlotModel and paintjobIndexModel then
		local typeName = Engine.GetModelValue( typeModel )
		local paintjobSlot = Engine.GetModelValue( paintjobSlotModel )
		local paintjobIndex = Engine.GetModelValue( paintjobIndexModel )
		if typeName == "paintjob" and paintjobSlot ~= CoD.CraftUtility.Gunsmith.INVALID_PAINTSHOP_SLOT and paintjobIndex ~= CoD.CraftUtility.Gunsmith.INVALID_PAINTSHOP_INDEX then
			return true
		end
	end
	return false
end

function HasGlobalHintText( controller )
	return DataSources.PerController.hasHintText( controller )
end

function HasHintText( element )
	local model = element:getModel()
	if model then
		local hintTextModel = Engine.GetModel( model, "hintText" )
		if hintTextModel and Engine.GetModelValue( hintTextModel ) ~= "" then
			return true
		end
	end
	return false
end

function PDV_IsDataVaultOpen( controller )
	return CoD.perController[controller].InspectingDataVault == true
end

function PDV_SelectingMap( menu )
	return menu.currentMode == CoD.PDV_Collectibles.Modes.SELECTING_MISSION
end

function PDV_SelectingCollectible( menu )
	return menu.currentMode == CoD.PDV_Collectibles.Modes.SELECTING_COLLECTIBLE
end

function PDV_InspectingCollectible( menu )
	return menu.currentMode == CoD.PDV_Collectibles.Modes.INSPECTING_COLLECTIBLE
end

function PDV_SlotHasCollectible( element, controller )
	local slotModel = element:getModel( controller, "collectibleSlot" )
	if slotModel and Engine.GetCollectibleInBunkSlot( controller, Engine.GetModelValue( slotModel ) ) > 0 then
		return true
	else
		return false
	end
end

function Gunsmith_IsEnabled( element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local gunsmithDataDownloadedModel = Engine.GetModel( perControllerModel, "Gunsmith.DataDownloaded" )
	local paintshopDataDownloadedModel = Engine.GetModel( perControllerModel, "Paintshop.DataDownloaded" )
	local gunsmithDataDownloaded = false
	local paintshopDataDownloaded = false
	if gunsmithDataDownloadedModel and paintshopDataDownloadedModel then
		gunsmithDataDownloaded = Engine.GetModelValue( gunsmithDataDownloadedModel )
		paintshopDataDownloaded = Engine.GetModelValue( paintshopDataDownloadedModel )
	end
	if Dvar.storage_offline:get() == false and Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		return false
	else
		return paintshopDataDownloaded and gunsmithDataDownloaded and IsIntDvarNonZero( "gunsmith_enabled" )
	end
end

function Gunsmith_ValidVariantNameEntered( element, controller )
	local validVariantNameModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Gunsmith.validVariantNameEntered" )
	local validVariantNameEntered = Engine.GetModelValue( validVariantNameModel )
	if validVariantNameEntered ~= nil and validVariantNameEntered == true then
		element:makeFocusableWithoutResettingNavigation()
		return true
	else
		element:makeNotFocusable()
		return false
	end
end

function Gunsmith_IsVariantOccupied( element, controller )
	local variantIndexModel = Engine.GetModel( element:getModel(), "variantIndex" )
	if variantIndexModel then
		local variantIndex = Engine.GetModelValue( variantIndexModel )
		if CoD.CraftUtility.Gunsmith.IsVariantIndexOccupied( variantIndex ) then
			return true
		end
	end
	return false
end

function Gunsmith_IsAttachmentEquipped( menu, element, controller )
	local elementModel = element:getModel()
	local attachmentList = CoD.CraftUtility.Gunsmith.GetVariantAttachmentList( controller, CoD.perController[controller].gunsmithVariantModel )
	if elementModel then
		local indexModel = Engine.GetModel( elementModel, "attachmentIndex" )
		if indexModel then
			local itemIndex = Engine.GetModelValue( indexModel )
			for index, attachmentID in ipairs( attachmentList ) do
				if attachmentID == itemIndex then
					return true
				end
			end
		end
	end
	return false
end

function Gunsmith_IsCamoEquipped( menu, element, controller )
	local elementModel = element:getModel()
	local variantCamoModel = menu:getModel()
	local variantCamoIndex = Engine.GetModelValue( variantCamoModel )
	if elementModel then
		local indexModel = Engine.GetModel( elementModel, "itemIndex" )
		if indexModel then
			local camoIndex = Engine.GetModelValue( indexModel )
			if variantCamoIndex == camoIndex then
				return true
			end
		end
	end
	return false
end

function Gunsmith_IsLockedForDemo( menu, element, controller )
	local elementModel = element:getModel()
	if elementModel then
		local nameModel = Engine.GetModel( elementModel, "name" )
		if nameModel then
			local name = Engine.GetModelValue( nameModel )
			if name == "MP_CLASSIFIED" then
				return true
			end
		end
	end
	return false
end

function Paintjobs_IsOccupied( element, controller )
	local slotModel = Engine.GetModel( element:getModel(), "paintjobSlot" )
	local paintjobIndexModel = Engine.GetModel( element:getModel(), "paintjobIndex" )
	if slotModel and paintjobIndexModel then
		local slot = Engine.GetModelValue( slotModel )
		local paintjobIndex = Engine.GetModelValue( paintjobIndexModel )
		if CoD.CraftUtility.Paintjobs.IsPaintjobIndexOccupied( slot, paintjobIndex ) then
			return true
		end
	end
	return false
end

function Paintjobs_IsEnabled( element, controller )
	if Dvar.storage_offline:get() == false and Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		return false
	else
		return Paintjobs_IsDataDownloaded( element, controller )
	end
end

function Paintjobs_IsDataDownloaded( element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local dataDownloadedModel = Engine.GetModel( perControllerModel, "Paintshop.DataDownloaded" )
	local dataDownloaded = false
	if dataDownloadedModel then
		dataDownloaded = Engine.GetModelValue( dataDownloadedModel )
	end
	return dataDownloaded
end

function IsEmblemEmpty( controller )
	local totalLayers = CoD.perController[controller].totalLayers
	local customizationType = CoD.GetCustomization( controller, "type" )
	return Engine.IsEmblemEmpty( controller, customizationType, totalLayers )
end

function IsLayerEmpty( element, controller )
	if element.layerCarousel ~= nil then
		local row = element.layerCarousel.currentStartRow
		local column = element.layerCarousel.currentStartColumn
		element = element.layerCarousel.layoutItems[row][column]
	end
	local layerIndexModel = element:getModel( controller, "layerIndex" )
	if not layerIndexModel then
		return true
	else
		local index = Engine.GetModelValue( layerIndexModel )
		local selectedLayerIconID = Engine.GetSelectedLayerIconID( controller, index )
		if selectedLayerIconID == CoD.emblem.INVALID_ICON_ID then
			return true
		else
			return false
		end
	end
end

function IsEditMode( controller )
	local customizationEditorMode = CoD.GetEditorProperties( controller, "editorMode" )
	return customizationEditorMode == Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_EDIT
end

function IsBrowseMode( controller )
	local customizationEditorMode = CoD.GetEditorProperties( controller, "editorMode" )
	return customizationEditorMode == Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE
end

function IsClipboardEmpty( controller )
	return CoD.GetEditorProperties( controller, "isClipboardEmpty" ) == CoD.emblem.CLIPBOARDSTATE.EMPTY
end

function IsEmblemEditor( controller )
	local customizationType = CoD.GetCustomization( controller, "type" )
	return customizationType == Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM
end

function IsPaintshop( controller )
	local customizationType = CoD.GetCustomization( controller, "type" )
	local f300_local0
	if customizationType ~= Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT and customizationType ~= Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_TOP and customizationType ~= Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_RIGHT then
		f300_local0 = false
	else
		f300_local0 = true
	end
	return f300_local0
end

function IsArenaStarInvisible( element, controller, indexStr )
	local parent = element:getParent()
	if parent == nil then
		return false
	end
	local model = parent:getModel( controller, "levelStars" )
	local index = tonumber( indexStr )
	local f301_local0
	if model and Engine.GetModelValue( model ) >= index then
		f301_local0 = false
	else
		f301_local0 = true
	end
	return f301_local0
end

function IsArenaStarInactive( element, controller, indexStr )
	local parent = element:getParent()
	if parent == nil then
		return false
	end
	local levelModel = parent:getModel( controller, "levelStars" )
	local earnedModel = parent:getModel( controller, "earnedStars" )
	local index = tonumber( indexStr )
	local f302_local0 = levelModel
	local f302_local1 = earnedModel
	local f302_local2
	if index > Engine.GetModelValue( levelModel ) or Engine.GetModelValue( earnedModel ) >= index then
		f302_local2 = false
	else
		f302_local2 = f302_local1 and f302_local0 and true
	end
	return f302_local2
end

function IsArenaStarEarned( element, controller, indexStr )
	local parent = element:getParent()
	if parent == nil then
		return false
	else
		local earnedModel = parent:getModel( controller, "earnedStars" )
		local index = tonumber( indexStr )
		return earnedModel and index <= Engine.GetModelValue( earnedModel )
	end
end

function IsModelValueNil( controller, modelArg )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelArg )
	return model == nil
end

function IsModelValueNonEmptyString( controller, modelArg )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelArg )
	local f305_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f305_local1 = f305_local0 and modelValue
	local f305_local2
	if f305_local1 == nil or f305_local1 == "" then
		f305_local2 = false
	else
		f305_local2 = true
	end
	return f305_local2
end

function IsModelValueTrue( controller, modelArg )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelArg )
	local f306_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f306_local1 = f306_local0 and modelValue
	local f306_local2
	if f306_local1 == nil or f306_local1 ~= true then
		f306_local2 = false
	else
		f306_local2 = true
	end
	return f306_local2
end

function IsModelValueGreaterThan( controller, modelArg, expressionArg )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelArg )
	local f307_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f307_local1 = f307_local0 and modelValue
	local f307_local2
	if f307_local1 == nil or expressionArg >= f307_local1 then
		f307_local2 = false
	else
		f307_local2 = true
	end
	return f307_local2
end

function IsModelValueLessThan( controller, modelArg, expressionArg )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelArg )
	local f308_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f308_local1 = f308_local0 and modelValue
	local f308_local2
	if f308_local1 == nil or f308_local1 >= expressionArg then
		f308_local2 = false
	else
		f308_local2 = true
	end
	return f308_local2
end

function IsModelValueGreaterThanOrEqualTo( controller, modelArg, expressionArg )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelArg )
	local f309_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f309_local1 = f309_local0 and modelValue
	local f309_local2
	if f309_local1 == nil or expressionArg > f309_local1 then
		f309_local2 = false
	else
		f309_local2 = true
	end
	return f309_local2
end

function IsModelValueLessThanOrEqualTo( controller, modelArg, expressionArg )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelArg )
	local f310_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f310_local1 = f310_local0 and modelValue
	local f310_local2
	if f310_local1 == nil or f310_local1 > expressionArg then
		f310_local2 = false
	else
		f310_local2 = true
	end
	return f310_local2
end

function IsModelValueEqualTo( controller, modelArg, expressionArg )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelArg )
	local f311_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f311_local1 = f311_local0 and modelValue
	local f311_local2
	if f311_local1 == nil or f311_local1 ~= expressionArg then
		f311_local2 = false
	else
		f311_local2 = true
	end
	return f311_local2
end

function IsModelValueEqualToEnum( controller, modelArg, enumValue )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelArg )
	local f312_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f312_local1 = f312_local0 and modelValue
	local f312_local2
	if f312_local1 == nil or f312_local1 ~= enumValue then
		f312_local2 = false
	else
		f312_local2 = true
	end
	return f312_local2
end

function IsSelfModelValueNil( element, controller, modelArg )
	local model = element:getModel()
	if model then
		model = Engine.GetModel( model, modelArg )
	end
	return model == nil
end

function IsSelfModelValueNilOrZero( element, controller, modelArg )
	local model = element:getModel()
	if model then
		model = Engine.GetModel( model, modelArg )
	end
	local f314_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f314_local1
	if model ~= nil and (f314_local0 and modelValue) ~= 0 then
		f314_local1 = false
	else
		f314_local1 = true
	end
	return f314_local1
end

function IsSelfModelValueNonEmptyString( element, controller, modelArg )
	local model = element:getModel()
	if model then
		model = Engine.GetModel( model, modelArg )
	end
	local f315_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f315_local1 = f315_local0 and modelValue
	local f315_local2
	if f315_local1 == nil or f315_local1 == "" then
		f315_local2 = false
	else
		f315_local2 = true
	end
	return f315_local2
end

function IsSelfModelValueTrue( element, controller, modelArg )
	local model = element:getModel()
	if model then
		model = Engine.GetModel( model, modelArg )
	end
	local f316_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f316_local1 = f316_local0 and modelValue
	local f316_local2
	if f316_local1 == nil or f316_local1 ~= true then
		f316_local2 = false
	else
		f316_local2 = true
	end
	return f316_local2
end

function IsSelfModelValueGreaterThan( element, controller, modelArg, expressionArg )
	local model = element:getModel()
	if model then
		model = Engine.GetModel( model, modelArg )
	end
	local f317_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f317_local1 = f317_local0 and modelValue
	local f317_local2
	if f317_local1 == nil or expressionArg >= f317_local1 then
		f317_local2 = false
	else
		f317_local2 = true
	end
	return f317_local2
end

function IsSelfModelValueLessThan( element, controller, modelArg, expressionArg )
	local model = element:getModel()
	if model then
		model = Engine.GetModel( model, modelArg )
	end
	local f318_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f318_local1 = f318_local0 and modelValue
	local f318_local2
	if f318_local1 == nil or f318_local1 >= expressionArg then
		f318_local2 = false
	else
		f318_local2 = true
	end
	return f318_local2
end

function IsSelfModelValueGreaterThanOrEqualTo( element, controller, modelArg, expressionArg )
	local model = element:getModel()
	if model then
		model = Engine.GetModel( model, modelArg )
	end
	local f319_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f319_local1 = f319_local0 and modelValue
	local f319_local2
	if f319_local1 == nil or expressionArg > f319_local1 then
		f319_local2 = false
	else
		f319_local2 = true
	end
	return f319_local2
end

function IsSelfModelValueLessThanOrEqualTo( element, controller, modelArg, expressionArg )
	local model = element:getModel()
	if model then
		model = Engine.GetModel( model, modelArg )
	end
	local f320_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f320_local1 = f320_local0 and modelValue
	local f320_local2
	if f320_local1 == nil or f320_local1 > expressionArg then
		f320_local2 = false
	else
		f320_local2 = true
	end
	return f320_local2
end

function IsSelfModelValueEqualTo( element, controller, modelArg, expressionArg )
	local model = element:getModel()
	if model then
		model = Engine.GetModel( model, modelArg )
	end
	local f321_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f321_local1 = f321_local0 and modelValue
	local f321_local2
	if f321_local1 == nil or f321_local1 ~= expressionArg then
		f321_local2 = false
	else
		f321_local2 = true
	end
	return f321_local2
end

function IsSelfModelValueEqualToEnum( element, controller, modelArg, enumValue )
	local model = element:getModel()
	if model then
		model = Engine.GetModel( model, modelArg )
	end
	local f322_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f322_local1 = f322_local0 and modelValue
	local f322_local2
	if f322_local1 == nil or f322_local1 ~= enumValue then
		f322_local2 = false
	else
		f322_local2 = true
	end
	return f322_local2
end

function IsGlobalModelValueNonEmptyString( element, controller, modelArg )
	local model = Engine.GetModel( Engine.GetGlobalModel(), modelArg )
	local f323_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f323_local1 = f323_local0 and modelValue
	local f323_local2
	if f323_local1 == nil or f323_local1 == "" then
		f323_local2 = false
	else
		f323_local2 = true
	end
	return f323_local2
end

function IsPrimaryButton( event )
	local f324_local0
	if event.button == "primary" then
		f324_local0 = event.down
	else
		f324_local0 = false
	end
	return f324_local0
end

function IsPlayerLimitAtMin()
	local clientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		clientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	local partyPrivacyModel = Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" )
	local maxPlayersModel = Engine.GetModel( partyPrivacyModel, "maxPlayers" )
	local maxPlayers = Engine.GetModelValue( maxPlayersModel )
	if clientCount == maxPlayers or maxPlayers == 1 then
		return true
	else
		return false
	end
end

function IsPlayerLimitAtMax()
	local currentMenuIdx = Engine.GetLobbyUIScreen()
	local currentMenu = LobbyData:UITargetFromId( currentMenuIdx )
	local partyPrivacyModel = Engine.GetModel( Engine.GetGlobalModel(), "PartyPrivacy" )
	local maxPlayersModel = Engine.GetModel( partyPrivacyModel, "maxPlayers" )
	local maxPlayers = Engine.GetModelValue( maxPlayersModel )
	if currentMenu.maxClients <= maxPlayers then
		return true
	else
		return false
	end
end

function HasNumHessActive( controller, expressionArg )
	local numActiveHess = 0
	local hess1typeModel = Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.hess1.type" )
	if hess1typeModel ~= nil and Engine.GetModelValue( hess1typeModel ) ~= 0 then
		numActiveHess = 1
	end
	local hess2typeModel = Engine.GetModel( Engine.GetModelForController( controller ), "hudItems.hess2.type" )
	if hess2typeModel ~= nil and Engine.GetModelValue( hess2typeModel ) ~= 0 then
		numActiveHess = numActiveHess + 1
	end
	return numActiveHess == expressionArg
end

function HasMultiCoreRig( controller )
	return Engine.HasMultiCoreTacticalRig( controller )
end

function ShouldStartHud( controller, event )
	return event.name == "player_spawned"
end

function AreKillstreaksEnabled()
	return Engine.GetGametypeSetting( "loadoutKillstreaksEnabled" ) == 1
end

local IsFilmSelected = function ()
	local info = Engine.LobbyGetDemoInformation()
	if info and info.fileID ~= Engine.DefaultID64Value() then
		return true
	else
		return false
	end
end

local IsFilmReadyForPlayback = function ()
	local info = Engine.LobbyGetDemoInformation()
	if info and info.readyForPlayback then
		return true
	else
		return false
	end
end

function IsStartFilmButtonDisabled()
	if not IsFilmSelected() then
		return true
	elseif not IsFilmReadyForPlayback() then
		return true
	elseif MapVoteTimerActive() then
		return true
	else
		return false
	end
end

function IsCreateHighlightReelButtonDisabled()
	if not IsFilmSelected() then
		return true
	elseif not IsFilmReadyForPlayback() then
		return true
	elseif MapVoteTimerActive() then
		return true
	else
		return false
	end
end

function IsShoutcastFilmButtonDisabled()
	if not IsFilmSelected() then
		return true
	elseif not IsFilmReadyForPlayback() then
		return true
	elseif MapVoteTimerActive() then
		return true
	else
		return false
	end
end

function IsInTheaterMode()
	if Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) == true then
		return true
	else
		return false
	end
end

function HideVehicleReticle( self, controller, event )
	local vehicleType = nil
	if event.modelName == "vehicleType" then
		vehicleType = event.modelValue
	end
	if not vehicleType then
		local vehicleTypeModel = self:getModel( controller, "vehicleType" )
		if vehicleTypeModel then
			vehicleType = Engine.GetModelValue( vehicleTypeModel )
		end
	end
	return vehicleType == "spawner_enemy_54i_vehicle_raps_suicide_player"
end

function IsSelfPlayerName( element, controller )
	local model = element:getModel( controller, "isSelfPlayerName" )
	local modelValue = false
	if model then
		modelValue = Engine.GetModelValue( model )
	end
	return modelValue
end

function ShouldDisplayFactionIconAtPrematchCountdown()
	return CoD.IsGametypeTeamBased()
end

function MapVoteInState( state )
	local mapVoteModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.mapVote" )
	if mapVoteModel == nil then
		return false
	else
		local currentState = Engine.GetModelValue( mapVoteModel )
		return tonumber( state ) == currentState
	end
end

function MapVoteTimerActive()
	local timerActiveModel = Engine.GetModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	if timerActiveModel == nil then
		return false
	end
	local active = Engine.GetModelValue( timerActiveModel )
	local f341_local0
	if active == nil or active == 0 then
		f341_local0 = false
	else
		f341_local0 = true
	end
	return f341_local0
end

function IsScorestreakEquipped( menu, element, controller )
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	if itemIndexModel then
		local itemIndex = Engine.GetModelValue( itemIndexModel )
		if itemIndex ~= CoD.CACUtility.EmptyItemIndex then
			return CoD.CACUtility.GetAttachedItemSlot( menu:getModel(), itemIndex, CoD.CACUtility.KillstreakNameList ) ~= nil
		end
	end
	return false
end

function IsValidScorestreakIndex( self, controller )
	local itemIndexModel = self:getModel( controller, "itemIndex" )
	if itemIndexModel then
		local itemIndex = Engine.GetModelValue( itemIndexModel )
		return itemIndex ~= CoD.CACUtility.EmptyItemIndex
	else
		return false
	end
end

function IsGamepad( controller )
	return CoD.useController and Engine.LastInput_Gamepad()
end

function AutomaticallyOpenAAR( controller )
	local stats = CoD.GetPlayerStats( controller )
	local value = stats.AfterActionReportStats.lobbyPopup:get()
	if value == "promotion" or value == "summary" then
		return true
	else
		
	end
end

function CanShowAAR( controller )
	return Engine.IsStableStatsBufferInitialized( controller )
end

function IsOffline( self, controller )
	local activityModel = self:getModel( controller, "activity" )
	if activityModel then
		local value = Engine.GetModelValue( activityModel )
	elseif value == Enum.PresenceActivity.PRESENCE_ACTIVITY_OFFLINE then
		return true
	end
	return false
end

function IsInTitle( self, controller )
	local activityModel = self:getModel( controller, "activity" )
	if activityModel then
		local value = Engine.GetModelValue( activityModel )
		if value == Enum.PresenceActivity.PRESENCE_ACTIVITY_ONLINE_NOT_IN_TITLE then
			return false
		elseif value == Enum.PresenceActivity.PRESENCE_ACTIVITY_OFFLINE then
			return false
		end
	end
	return true
end

function IsJoinable( self, controller )
	local joinableModel = self:getModel( controller, "joinable" )
	if joinableModel then
		local joinable = Engine.GetModelValue( joinableModel )
		if joinable == Enum.LobbyJoinable.LOBBY_JOINABLE_YES then
			return true
		elseif joinable == Enum.LobbyJoinable.LOBBY_JOINABLE_YES_FRIENDS_ONLY then
			local friendModel = self:getModel( controller, "friend" )
			if friendModel then
				local friend = Engine.GetModelValue( friendModel )
				if friend then
					return true
				end
			end
		end
	end
	return false
end

function HideWinnersLabelsAndInfo( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local isRoundEndModel = Engine.GetModel( perControllerModel, "gameScore.isRoundEnd" )
	local isDrawModel = Engine.GetModel( perControllerModel, "gameScore.draw" )
	local f350_local0 = Engine.GetGametypeSetting( "teamCount" ) < 2
	local f350_local1 = isRoundEndModel
	local isRoundEnd = Engine.GetModelValue( isRoundEndModel )
	local f350_local2 = f350_local1 and isRoundEnd
	local f350_local3 = isDrawModel
	local isDrawModel = Engine.GetModelValue( isDrawModel )
	if f350_local2 or (f350_local3 and isDrawModel) or f350_local0 then
		return true
	else
		
	end
end

function IsScoreboardPlayerSelf( element, controller )
	local model = element:getModel( controller, "clientInfo" )
	if model then
		local clientInfo = Engine.GetModelValue( model )
		local teamEnum, clientIndex = CoD.ScoreboardUtility.GetTeamEnumAndClientIndex( clientInfo )
		if clientIndex then
			local xuid = Engine.GetScoreboardPlayerData( clientIndex, teamEnum, Enum.scoreBoardColumns_e.SCOREBOARD_COLUMN_XUID )
			return xuid == Engine.GetXUID( controller )
		end
	end
end

function ShowMatchBonus( element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local isRoundEndModel = Engine.GetModel( perControllerModel, "gameScore.isRoundEnd" )
	local matchBonusModel = Engine.GetModel( perControllerModel, "gameScore.matchBonus" )
	local matchBonus = 0
	if matchBonusModel then
		matchBonus = Engine.GetModelValue( matchBonusModel )
	end
	local f352_local0 = isRoundEndModel
	local isRoundEnd = Engine.GetModelValue( isRoundEndModel )
	local f352_local1
	if (f352_local0 and isRoundEnd) or matchBonus == 0 then
		f352_local1 = false
	else
		f352_local1 = true
	end
	return f352_local1
end

