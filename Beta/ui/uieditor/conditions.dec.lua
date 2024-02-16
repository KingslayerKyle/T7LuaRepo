function AlwaysFalse()
	return false
end

function AlwaysTrue()
	return true
end

function TestCondition()
	return true
end

function ConditionWithArguments( menu, element, event, arg1, expressionArg, booleanArg, menuName, enumValue )
	return true
end

function IsVisibilityBitSet( controller, enumValue )
	if Engine.IsVisibilityBitSet( controller, enumValue ) then
		return true
	else
		return false
	end
end

function FileshareIsDeleting()
	local deleteTaskState = Engine.GetModelValue( CoD.FileshareUtility.GetDeletingModel() )
	if deleteTaskState == Enum.FileshareTaskUIState.FILESHARE_TASK_UI_WORKING then
		return true
	else
		return false
	end
end

function FileshareIsDeletingInError()
	local deleteTaskState = Engine.GetModelValue( CoD.FileshareUtility.GetDeletingModel() )
	if deleteTaskState == Enum.FileshareTaskUIState.FILESHARE_TASK_UI_ERROR then
		return true
	else
		return false
	end
end

function FileshareIsPublishing()
	local publishTaskState = Engine.GetModelValue( CoD.FileshareUtility.GetPublishingModel() )
	if publishTaskState == Enum.FileshareTaskUIState.FILESHARE_TASK_UI_WORKING then
		return true
	else
		return false
	end
end

function FileshareIsPublishingInError()
	local publishTaskState = Engine.GetModelValue( CoD.FileshareUtility.GetPublishingModel() )
	if publishTaskState == Enum.FileshareTaskUIState.FILESHARE_TASK_UI_ERROR then
		return true
	else
		return false
	end
end

function FileshareIsPublishingInSuccess()
	local publishTaskState = Engine.GetModelValue( CoD.FileshareUtility.GetPublishingModel() )
	if publishTaskState == Enum.FileshareTaskUIState.FILESHARE_TASK_UI_DONE then
		return true
	else
		return false
	end
end

function FileshareIsSteamAgreed()
	return CoD.SteamWorkshopUtility.GetPublishSteamAgreement()
end

function FilesharePublishToSteamDisabled( controller )
	local f12_local0
	if FileshareIsSteamAgreed() then
		f12_local0 = not FileshareIsReady( controller )
	else
		f12_local0 = true
	end
	return f12_local0
end

function FileshareShouldAllowDownload()
	local shouldAllowDownload = CoD.FileshareUtility.GetPublishAllowDownload()
	return shouldAllowDownload
end

function FileshareIsReady( controller )
	local isReady = CoD.FileshareUtility.IsFileshareReady( controller )
	if isReady == 0 then
		return false
	else
		return true
	end
end

function FileshareIsQuotaLineDim( self, controller )
	local isDimModel = self:getModel( controller, "isDim" )
	local isDim = Engine.GetModelValue( isDimModel )
	return isDim
end

function ShouldOpenMessageDialog( self )
	if self:getParent() == nil then
		return 
	end
	local messageDialogModel = Engine.GetModel( Engine.GetGlobalModel(), "messageDialog" )
	if messageDialogModel ~= nil then
		local messagePendingModel = Engine.GetModel( messageDialogModel, "messagePending" )
		if messagePendingModel ~= nil and Engine.GetModelValue( messagePendingModel ) > 0 then
			return true
		end
	end
	return false
end

function IsInDefaultState( element )
	return element.currentState == "DefaultState"
end

function IsInDefaultStateOrStateNotSet( element )
	if not element.currentState then
		return true
	else
		return element.currentState == "DefaultState"
	end
end

function IsElementInState( element, stateName )
	return element.currentState == stateName
end

function IsSiblingElementInState( menu, elementName, stateName )
	return menu[elementName].currentState == stateName
end

function IsMenuInState( menu, stateName )
	return menu.currentState == stateName
end

function IsSelfInState( self, stateName )
	return self.currentState == stateName
end

function IsWidthZero( expr_width )
	return expr_width == 0
end

function IsFirstListElement( element )
	return element:isFirstItem()
end

function IsLastListElement( element )
	return element:isLastItem()
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

function ListElementHasElements( self, listElementName, modelArg )
	local listElement = self[listElementName]
	if listElement then
		local dataSource = listElement:getDataSource()
		if dataSource then
			local itemCount = dataSource:getCount()
			return itemCount > 0
		end
	end
	return false
end

function ListLoopEdgesEnabled( self, listElementName )
	local listElement = self[listElementName]
	if listElement then
		return listElement.loopEdges
	else
		return false
	end
end

function IsElementInFocus( element )
	return element:isInFocus()
end

function isClientListSlideFocus( self, focusableElementName, event, controller )
	if not CoD.isPC then
		return IsWidgetInFocus( self, focusableElementName, event )
	elseif self.defaultNav and self.defaultNav == "right" and IsWidgetInFocus( self, focusableElementName, event ) then
		return true
	end
	local f31_local0 = IsGamepad( controller )
	if f31_local0 then
		f31_local0 = IsWidgetInFocus( self, focusableElementName, event )
	end
	return f31_local0
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

function IsFirstTimeSetup( controller, enumValue )
	if Dvar.livestats_skipFirstTime:get() then
		return false
	elseif not (not Engine.IsMultiplayerGame() or not IsLAN()) or Engine.IsInGame() then
		return false
	else
		return not Engine.IsFirstTimeComplete( controller, enumValue )
	end
end

function IsMainFirstTimeSetup( controller )
	if Dvar.livestats_skipFirstTime:get() then
		return false
	else
		return Engine.GetProfileVarInt( controller, "com_first_time" ) ~= 0
	end
end

function GrayOutReplayMissionButton( controller )
	return false
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
	if self == nil then
		return false
	else
		return self[propertyName] == true
	end
end

function IsElementPropertyValue( element, propertyName, expressionArg )
	if element == nil then
		return false
	else
		return element[propertyName] == expressionArg
	end
end

function IsElementPropertyEnumValue( element, propertyName, enumValue )
	if element == nil then
		return false
	else
		return element[propertyName] == enumValue
	end
end

function HasProperty( element, propertyName )
	if element == nil then
		return false
	else
		return element[propertyName] ~= nil
	end
end

function ParentPropertyIsTrue( self, propertyName )
	if self == nil or self:getParent() == nil then
		return false
	else
		local f44_local0 = self:getParent()
		return f44_local0[propertyName] == true
	end
end

function IsPerControllerTablePropertyValue( controller, propertyName, expressionArg )
	return CoD.perController[controller][propertyName] == expressionArg
end

function IsPerControllerTablePropertyEnumValue( controller, propertyName, enumValue )
	return CoD.perController[controller][propertyName] == enumValue
end

function IsActiveLocalClientsCountEqualTo( expressionArg )
	return Engine.GetActiveLocalClientsCount() == expressionArg
end

function IsCampaign()
	return CoD.isCampaign
end

function IsMultiplayer()
	local f49_local0 = CoD.isMultiplayer
	if f49_local0 then
		f49_local0 = not CoD.isCampaign
	end
	return f49_local0
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
	local f52_local0 = IsGroupOwner( element, controller )
	if not f52_local0 then
		f52_local0 = IsGroupAdmin( element, controller )
	end
	return f52_local0
end

local GetMemberStatusFromElement = function ( element, controller )
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
		memberStatus = GetMemberStatusFromElement( element, controller )
	end
	return memberStatus == Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_NONE
end

function IsGroupMember( element, controller )
	local memberStatus = nil
	if CoD.perController[controller].selectedGroup then
		memberStatus = GetMemberStatusFromModel( CoD.perController[controller].selectedGroup )
	elseif element then
		memberStatus = GetMemberStatusFromElement( element, controller )
	end
	return memberStatus == Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_MEMBER
end

function IsGroupAdmin( element, controller )
	local memberStatus = nil
	if CoD.perController[controller].selectedGroup then
		memberStatus = GetMemberStatusFromModel( CoD.perController[controller].selectedGroup )
	elseif element then
		memberStatus = GetMemberStatusFromElement( element, controller )
	end
	return memberStatus == Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_ADMIN
end

function IsGroupOwner( element, controller )
	local memberStatus = nil
	if CoD.perController[controller].selectedGroup then
		memberStatus = GetMemberStatusFromModel( CoD.perController[controller].selectedGroup )
	elseif element then
		memberStatus = GetMemberStatusFromElement( element, controller )
	end
	return memberStatus == Enum.GroupMemberStatus.GROUP_MEMBER_STATUS_OWNER
end

function IsGroupListHeader( element )
	return element.type == "header"
end

function DoesGroupListHaveSelectedIcon( element )
	local f60_local0
	if element.showSelectedIcon == nil or element.showSelectedIcon ~= true then
		f60_local0 = false
	else
		f60_local0 = true
	end
	return f60_local0
end

function IsProcessingGroupTask( controller )
	local processingGroupTaskModel = GetProcessingGroupTaskModel( controller )
	local isProcessing = Engine.GetModelValue( processingGroupTaskModel )
	local f61_local0
	if isProcessing == nil or isProcessing ~= true then
		f61_local0 = false
	else
		f61_local0 = true
	end
	return f61_local0
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
	local f64_local0
	if inviteCount == nil or inviteCount <= 0 then
		f64_local0 = false
	else
		f64_local0 = true
	end
	return f64_local0
end

function IsMemberOfAnyGroup( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local groupsModel = Engine.CreateModel( perControllerModel, "groups" )
	local groupCountModel = Engine.CreateModel( groupsModel, "groupCount_self" )
	local groupCount = Engine.GetModelValue( groupCountModel )
	local f65_local0
	if groupCount == nil or groupCount <= 0 then
		f65_local0 = false
	else
		f65_local0 = true
	end
	return f65_local0
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
	local f67_local0
	if isInitialized == nil or isInitialized ~= true then
		f67_local0 = false
	else
		f67_local0 = true
	end
	return f67_local0
end

function IsGroupLeaderboardAvailable()
	local leaderboardIndex, sortColumn, timeFrame, isHardcore, isInitialized = Engine.GetGroupLeaderboardInfo()
	local f68_local0
	if isInitialized == nil or isInitialized ~= true or leaderboardIndex == nil or leaderboardIndex <= 0 then
		f68_local0 = false
	else
		f68_local0 = true
	end
	return f68_local0
end

function IsLeaderboardUpdating()
	local leaderboardModel = Engine.CreateModel( Engine.GetGlobalModel(), "leaderboard" )
	local leaderboardIsUpdatingModel = Engine.CreateModel( leaderboardModel, "isUpdating" )
	local isUpdating = Engine.GetModelValue( leaderboardIsUpdatingModel )
	local f69_local0
	if isUpdating == nil or isUpdating ~= true then
		f69_local0 = false
	else
		f69_local0 = true
	end
	return f69_local0
end

function IsLeaderboardEmpty()
	local leaderboardModel = Engine.CreateModel( Engine.GetGlobalModel(), "leaderboard" )
	local totalResults = Engine.GetModelValue( Engine.CreateModel( leaderboardModel, "totalResults" ) )
	local f70_local0
	if totalResults ~= nil and totalResults ~= 0 then
		f70_local0 = false
	else
		f70_local0 = true
	end
	return f70_local0
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

function HidePersonalizePrompt( controller )
	local f77_local0
	if not CoD.isPC or IsGamepad( controller ) then
		f77_local0 = Dvar.ui_execdemo_gamescom:get()
	else
		f77_local0 = true
	end
	return f77_local0
end

function IsCACLockedForEveryone()
	return Engine.IsItemLockedForAll( "FEATURE_CREATE_A_CLASS" )
end

function CACShowSelectPrompt( self, element, controller )
	local elementModel = element:getModel()
	local f79_local0 = elementModel
	local slotModel = Engine.GetModel( elementModel, "weaponSlot" )
	local f79_local1 = f79_local0 and slotModel
	local f79_local2 = f79_local1
	local loadoutSlotName = Engine.GetModelValue( f79_local1 )
	local f79_local3 = f79_local2 and loadoutSlotName
	if controller == nil and self ~= nil then
		controller = self.m_ownerController
	end
	if f79_local3 == nil or controller == nil then
		return false
	else
		local classModel = CoD.perController[controller].classModel
		if not ((not LUI.startswith( f79_local3, "primarygadgetattachment" ) or CoD.CACUtility.SearchForBonusCard( "bonuscard_danger_close", controller ) ~= "") and (f79_local3 ~= "specialty4" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_1_greed", controller ) ~= "") and (f79_local3 ~= "specialty5" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_2_greed", controller ) ~= "") and (f79_local3 ~= "specialty6" or CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_3_greed", controller ) ~= "") and (f79_local3 ~= "secondaryattachment3" or CoD.CACUtility.SearchForBonusCard( "bonuscard_secondary_gunfighter", controller ) ~= "") and (not (f79_local3 == "primaryattachment4" or f79_local3 == "primaryattachment5" or f79_local3 == "primaryattachment6") or CoD.CACUtility.SearchForBonusCard( "bonuscard_primary_gunfighter", controller ) ~= "")) or not (not LUI.startswith( f79_local3, "primaryattachment" ) or CoD.CACUtility.ItemEquippedInSlot( "primary", controller, classModel )) or not (not LUI.startswith( f79_local3, "secondaryattachment" ) or CoD.CACUtility.ItemEquippedInSlot( "secondary", controller, classModel ) and CoD.CACUtility.DoesWeaponHaveAnyAttachments( "secondary", controller, classModel )) or LUI.startswith( f79_local3, "secondarygadgetattachment" ) and not CoD.CACUtility.ItemEquippedInSlot( "secondarygadget", controller, classModel ) then
			local availability, equipped, hintText = CoD.CACUtility.GetCACSlotStatus( controller, classModel, f79_local3 )
			if availability == CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD and not IsElementInState( element, "NotVisible" ) then
				return true
			else
				return false
			end
		else
			return true
		end
	end
end

function CACShowRemovePrompt( self, element )
	local slotModel = element:getModel()
	local f80_local0 = slotModel
	local itemIndexModel = Engine.GetModel( slotModel, "itemIndex" )
	local f80_local1 = f80_local0 and itemIndexModel
	local f80_local2 = f80_local1
	local itemIndex = Engine.GetModelValue( f80_local1 )
	local f80_local3 = f80_local2 and itemIndex
	if f80_local3 ~= nil and f80_local3 > CoD.CACUtility.EmptyItemIndex then
		return true
	else
		
	end
end

function CACShowRotatePrompt( self, element, controller )
	local elementModel = element:getModel()
	local f81_local0 = elementModel
	local slotModel = Engine.GetModel( elementModel, "weaponSlot" )
	local f81_local1 = f81_local0 and slotModel
	local f81_local2 = f81_local1
	local loadoutSlotName = Engine.GetModelValue( f81_local1 )
	local f81_local3 = f81_local2 and loadoutSlotName
	if f81_local3 == nil then
		return false
	elseif CACShowRemovePrompt( self, element ) then
		return true
	end
	local f81_local4 = CACShowSelectPrompt( self, element, controller )
	if f81_local4 then
		f81_local4 = LUI.startswith( f81_local3, "primaryattachment" )
		if not f81_local4 then
			f81_local4 = LUI.startswith( f81_local3, "secondaryattachment" )
		end
	end
	return f81_local4
end

function IsCACSlotOvercapacity2by1AspectRatio( element )
	local model = element:getModel()
	if model then
		local slotModel = Engine.GetModel( model, "itemSlot" )
		if slotModel then
			local slotName = Engine.GetModelValue( slotModel )
			local f82_local0
			if slotName ~= "primary" and slotName ~= "secondary" then
				f82_local0 = false
			else
				f82_local0 = true
			end
			return f82_local0
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
			local f87_local0
			if slotName ~= "primary" and slotName ~= "secondary" then
				f87_local0 = false
			else
				f87_local0 = true
			end
			return f87_local0
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
			local f88_local0
			if slotName ~= "primary" and slotName ~= "secondary" then
				f88_local0 = LUI.startswith( slotName, "primaryattachment" )
				if not f88_local0 then
					f88_local0 = LUI.startswith( slotName, "secondaryattachment" )
				end
			else
				f88_local0 = true
			end
			return f88_local0
		end
	end
	return false
end

function IsCACItemConsumable( menu, element, controller )
	local elementModel = element:getModel()
	if elementModel then
		local itemIndexModel = Engine.GetModel( elementModel, "itemIndex" )
		if itemIndexModel then
			local itemIndex = Engine.GetModelValue( itemIndexModel )
			local itemGroup = Engine.GetItemGroup( itemIndex )
			return itemGroup == "bubblegum_consumable"
		end
	end
	return false
end

function DoesCACItemHaveConsumablesRemaining( menu, element, controller )
	if not IsCACItemConsumable( menu, element, controller ) then
		return true
	end
	local elementModel = element:getModel()
	if elementModel then
		local itemIndexModel = Engine.GetModel( elementModel, "itemIndex" )
		if itemIndexModel then
			local itemIndex = Engine.GetModelValue( itemIndexModel )
			return GetConsumableCountFromIndex( controller, itemIndex ) > 0
		end
	end
	return false
end

function IsCACItemEquipped( menu, element, controller )
	local weaponCategory = CoD.perController[controller].weaponCategory
	if weaponCategory == "bubblegum" or weaponCategory == "bubblegum_consumable" then
		return IsBubbleGumBuffEquipped( menu, element, controller )
	end
	local searchingSlots = CoD.CACUtility.GetSlotListWithSlot( weaponCategory )
	local elementModel = element:getModel()
	if elementModel then
		local indexModel = Engine.GetModel( elementModel, "itemIndex" )
		if indexModel then
			local itemIndex = Engine.GetModelValue( indexModel )
			for _, slotName in ipairs( searchingSlots ) do
				if CoD.CACUtility.GetItemEquippedInSlot( slotName, controller ) == itemIndex then
					return true
				end
			end
		end
	end
	return false
end

function IsCACWildcardEquipped( menu, element, controller )
	local weaponCategory = CoD.perController[controller].weaponCategory
	local searchingSlots = CoD.CACUtility.GetSlotListWithSlot( weaponCategory )
	local elementModel = element:getModel()
	if elementModel then
		local indexModel = Engine.GetModel( elementModel, "itemIndex" )
		if indexModel then
			local itemIndex = Engine.GetModelValue( indexModel )
			for _, slotName in ipairs( searchingSlots ) do
				if CoD.CACUtility.GetItemEquippedInSlot( slotName, controller ) == itemIndex then
					local itemRef = Engine.GetItemRef( itemIndex )
					if itemRef == "bonuscard_primary_gunfighter" then
						if IsCACEquippedWildcardItemCount( menu, "bonuscard_primary_gunfighter", 3 ) then
							return true
						end
						return false
					end
					return true
				end
			end
		end
	end
	return false
end

function IsCACItemNew( element, controller )
	if not IsProgressionEnabled() then
		return false
	else
		local itemIndexModel = element:getModel( controller, "itemIndex" )
		if itemIndexModel then
			local itemIndex = Engine.GetModelValue( itemIndexModel )
			return Engine.IsItemNew( controller, itemIndex )
		else
			return false
		end
	end
end

function IsCACAttachmentNew( menu, element, controller )
	if not IsProgressionEnabled() then
		return false
	end
	local weaponCategory = CoD.perController[controller].weaponCategory
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	local classModel = menu:getModel()
	if itemIndexModel then
		local slotName = "primary"
		if LUI.startswith( weaponCategory, "secondaryattachment" ) then
			slotName = "secondary"
		end
		local weaponIndexModel = Engine.GetModel( classModel, slotName .. ".itemIndex" )
		if weaponIndexModel then
			local weaponIndex = Engine.GetModelValue( weaponIndexModel )
			local attachmentIndex = Engine.GetModelValue( itemIndexModel )
			return Engine.IsAttachmentNew( controller, weaponIndex, attachmentIndex )
		end
	end
	return false
end

function IsCACAnyLoadoutSlotNew( element, controller )
	local loadoutSlotModel = element:getModel( controller, "weaponSlot" )
	if loadoutSlotModel then
		local loadoutSlot = Engine.GetModelValue( loadoutSlotModel )
		if LUI.startswith( loadoutSlot, "specialty" ) then
			loadoutSlot = "specialty"
		end
		return Engine.IsLoadoutSlotNew( controller, loadoutSlot )
	else
		return false
	end
end

function IsCACAnyOpticsNew( element, controller )
	return false
end

function IsCACAnyAttachmentsNew( element, controller )
	return false
end

function IsCACItemPurchased( element, controller )
	if not IsProgressionEnabled() then
		return true
	end
	local itemIndexModel = nil
	local itemIndex = element.itemIndex
	if not itemIndex then
		itemIndexModel = element:getModel( controller, "itemIndex" )
		if itemIndexModel then
			itemIndex = Engine.GetModelValue( itemIndexModel )
		end
	end
	if itemIndex then
		return Engine.IsItemPurchased( controller, itemIndex )
	end
	return false
end

function IsCACHaveTokens( controller )
	local itemGroup = "weapon_smg"
	local tokenCount = Engine.GetCurrentTokens( controller, itemGroup )
	return tokenCount > 0
end

function ShouldCACDisplayTokens( controller )
	if IsMultiplayer() then
		if IsLive() and not IsInGame() then
			return true
		end
	elseif IsCampaign() then
		if CoD.isSafehouse then
			return true
		end
	elseif IsFirstTimeSetup( controller, Enum.eModes.MODE_MULTIPLAYER ) then
		return true
	end
	return false
end

function IsCPAndInSafehouse()
	if IsCampaign() and CoD.isSafehouse then
		return true
	else
		return false
	end
end

function IsProgressionEnabled( controller )
	if not (not IsMultiplayer() or not IsLive() or Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH )) or IsCampaign() or IsZombies() then
		return true
	else
		return false
	end
end

function IsClassAllocationInState( controller, expressionArg )
	local maxAllocation = Engine.GetMaxAllocation( controller )
	return maxAllocation == expressionArg
end

function IsProgressionElementItemLocked( menu, element, controller )
	if not IsProgressionEnabled() then
		return false
	else
		return element.isLocked
	end
end

local IsCACItemLockedHelper = function ( menu, element, controller )
	local classModel = menu:getModel()
	local weaponCategory = CoD.perController[controller].weaponCategory
	local itemIndexModel = nil
	local itemIndex = element.itemIndex
	if not itemIndex then
		itemIndexModel = element:getModel( controller, "itemIndex" )
		if itemIndexModel then
			itemIndex = Engine.GetModelValue( itemIndexModel )
		end
	end
	if itemIndex then
		if not weaponCategory then
			weaponCategory = Engine.GetLoadoutSlotForItem( itemIndex )
		end
		if classModel and weaponCategory and (LUI.startswith( weaponCategory, "primaryattachment" ) or LUI.startswith( weaponCategory, "secondaryattachment" )) then
			local slotName = "primary"
			if LUI.startswith( weaponCategory, "secondaryattachment" ) then
				slotName = "secondary"
			end
			local weaponIndexModel = Engine.GetModel( classModel, slotName .. ".itemIndex" )
			if weaponIndexModel then
				local weaponIndex = Engine.GetModelValue( weaponIndexModel )
				return Engine.IsItemAttachmentLocked( controller, weaponIndex, itemIndex )
			end
		end
		return Engine.IsItemLocked( controller, itemIndex )
	else
		return false
	end
end

function IsCACItemLocked( menu, element, controller )
	if not IsProgressionEnabled() then
		return false
	else
		return IsCACItemLockedHelper( menu, element, controller )
	end
end

function IsCACItemLockedForGamesCom( menu, element, controller )
	if not IsProgressionEnabled() and not IsGamesComBuild() then
		return false
	else
		return IsCACItemLockedHelper( menu, element, controller )
	end
end

function IsCACItemLockedForBeta( menu, element, controller )
	if not IsProgressionEnabled() and not LuaUtils.IsBetaBuild() then
		return false
	else
		return IsCACItemLockedHelper( menu, element, controller )
	end
end

function IsCACItemClassified( menu, element, controller )
	if not IsProgressionEnabled() and not LuaUtils.IsBetaBuild() then
		return false
	else
		local unlockLevelModel = element:getModel( controller, "unlockLevel" )
		local unlockLevel = Engine.GetModelValue( unlockLevelModel )
		if unlockLevel >= 60 then
			return true
		else
			return false
		end
	end
end

function IsItemRefLocked( controller, expressionArg )
	local itemIndex = Engine.GetItemIndexFromReference( expressionArg )
	if itemIndex then
		return Engine.IsItemLocked( controller, itemIndex )
	else
		return true
	end
end

function IsNonAttachmentItemLocked( controller, itemRefArg )
	if not IsProgressionEnabled() then
		return false
	else
		local itemIndex = Engine.GetItemIndex( itemRefArg )
		if itemIndex > CoD.CACUtility.EmptyItemIndex then
			return Engine.IsItemLocked( controller, itemIndex )
		else
			return false
		end
	end
end

function IsNonAttachmentItemPurchased( controller, itemRefArg )
	if not IsProgressionEnabled() then
		return false
	else
		local itemIndex = Engine.GetItemIndex( itemRefArg )
		if itemIndex > CoD.CACUtility.EmptyItemIndex then
			return Engine.IsItemPurchased( controller, itemIndex )
		else
			return false
		end
	end
end

function IsCACItemMutuallyExclusiveWithSelection( element, controller )
	local category = CoD.perController[controller].weaponCategory
	local itemIndex = CoD.CACUtility.EmptyItemIndex
	local elementItemIndexModel = element:getModel( controller, "itemIndex" )
	if elementItemIndexModel then
		itemIndex = Engine.GetModelValue( elementItemIndexModel )
	end
	if not category then
		category = Engine.GetLoadoutSlotForItem( itemIndex )
	end
	if category then
		return CoD.CACUtility.GetMutuallyExclusiveSlotName( category, controller, itemIndex ) ~= ""
	else
		return false
	end
end

function IsMenuPreviewImageSquare( menu )
	if menu.menuName == "PerkSelect" or menu.menuName == "LethalEquipmentSelect" or menu.menuName == "TacticalEquipmentSelect" or menu.menuName == "TacticalRigSelect" or menu.menuName == "WildcardSelect" then
		return true
	else
		return false
	end
end

function IsCurrentMenuCybercoreOrRigMenu( menu )
	if menu.menuName == "TacticalRigSelect" then
		return true
	else
		return false
	end
end

function IsCurrentMenuEquipmentMenu( menu )
	if menu.menuName == "PerkSelect" or menu.menuName == "LethalEquipmentSelect" or menu.menuName == "TacticalEquipmentSelect" then
		return true
	else
		return false
	end
end

function IsCurrentMenuAttachmentMenu( menu )
	if menu.menuName == "PrimaryAttachmentSelect" or menu.menuName == "PrimaryOpticSelect" or menu.menuName == "SecondaryAttachmentSelect" or menu.menuName == "SecondaryOpticSelect" then
		return true
	else
		return false
	end
end

function IsCurrentMenuWeaponMenu( menu )
	if menu.menuName == "PrimaryWeaponSelect" or menu.menuName == "SecondaryWeaponSelect" or menu.menuName == "WeaponBuildKits" or menu.menuName == "WeaponBuildKitsCustomizeVariant" then
		return true
	else
		return false
	end
end

function IsCurrentMenuWeaponType( menu )
	if IsCurrentMenuAttachmentMenu( menu ) or IsCurrentMenuWeaponMenu( menu ) then
		return true
	else
		return false
	end
end

function IsMulticoreActivated( controller )
	return not IsItemRefLocked( controller, "feature_multicore" )
end

function IsMulticoreInMobileArmory( menu, controller )
	if CoD.perController[controller].isInMobileArmory then
		local f121_local0 = CoD.perController[controller].isInMobileArmory
		if f121_local0 then
			f121_local0 = IsMulticoreActivated( controller )
		end
		return f121_local0
	else
		return false
	end
end

function IsCybercoreItemEquipped( menu, element, controller )
	local equippedCore = Engine.GetEquippedCybercore( controller )
	local itemIndexModel = element:getModel( controller, "itemIndex" )
	if itemIndexModel then
		local itemIndex = Engine.GetModelValue( itemIndexModel )
		return itemIndex == equippedCore
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

function IsCurrentClassModelValueEqualToString( controller, modelArg, compareString )
	local loadoutSlot = CoD.perController[controller].weaponCategory
	local classModel = CoD.perController[controller].classModel
	local f128_local0 = classModel
	local model = Engine.GetModel( classModel, modelArg )
	local f128_local1 = f128_local0 and model
	local f128_local2 = f128_local1
	local modelValue = Engine.GetModelValue( f128_local1 )
	local f128_local3 = f128_local2 and modelValue
	local f128_local4
	if f128_local3 == nil or f128_local3 ~= compareString then
		f128_local4 = false
	else
		f128_local4 = true
	end
	return f128_local4
end

function IsCACSlotHaveModel( element )
	local elementModel = element:getModel()
	if elementModel then
		local weaponSlotModel = Engine.GetModel( elementModel, "weaponSlot" )
		if weaponSlotModel then
			local weaponSlotName = Engine.GetModelValue( weaponSlotModel )
			if weaponSlotName == "primary" or weaponSlotName == "secondary" or LUI.startswith( weaponSlotName, "primaryattachment" ) or LUI.startswith( weaponSlotName, "secondaryattachment" ) or weaponSlotName == "primarygadget" or weaponSlotName == "secondarygadget" or LUI.startswith( weaponSlotName, "primarygadgetattachment" ) or LUI.startswith( weaponSlotName, "secondarygadgetattachment" ) or LUI.startswith( weaponSlotName, "specialty" ) or LUI.startswith( weaponSlotName, "bonuscard" ) or weaponSlotName == "cybercore" then
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
		local wildcardNeeded = CoD.CACUtility.WildcardNeededForSlot( controller, weaponSlot )
		if wildcardNeeded then
			return true
		end
	end
	return false
end

function IsCACSlotCanEquipWildcard( menu, element, controller )
	local classModel = menu:getModel()
	local weaponSlot = GetWeaponSlotModel( menu, element, controller, classModel )
	if weaponSlot then
		local wildcardNeeded, isRequiredEquipped = CoD.CACUtility.WildcardNeededForSlot( controller, weaponSlot )
		if wildcardNeeded then
			return isRequiredEquipped
		end
	end
	return false
end

function IsCACSlotWildcardLocked( menu, element, controller )
	local classModel = menu:getModel()
	local weaponSlot = GetWeaponSlotModel( menu, element, controller, classModel )
	if weaponSlot then
		local wildcardNeeded, isRequiredEquipped, isRequiredLocked = CoD.CACUtility.WildcardNeededForSlot( controller, weaponSlot )
		if wildcardNeeded then
			return isRequiredLocked
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

function IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
	local elementModel = element:getModel()
	local classModel = menu:getModel()
	if elementModel then
		local weaponSlotModel = Engine.GetModel( elementModel, "weaponSlot" )
		if weaponSlotModel then
			local weaponSlotName = Engine.GetModelValue( weaponSlotModel )
			if LUI.startswith( weaponSlotName, "primaryattachment" ) then
				local availability, equipped, hintText = CoD.CACUtility.GetCACSlotStatus( controller, classModel, "primary" )
				return equipped
			elseif LUI.startswith( weaponSlotName, "secondaryattachment" ) then
				local availability, equipped, hintText = CoD.CACUtility.GetCACSlotStatus( controller, classModel, "secondary" )
				return equipped
			end
		end
	end
	return false
end

function IsCACSlotSpecificItemEquipped( element, controller, specificItemName )
	local elementIndexModel = element:getModel( controller, "itemIndex" )
	if elementIndexModel then
		local itemIndex = Engine.GetModelValue( elementIndexModel )
		if itemIndex > CoD.CACUtility.EmptyItemIndex then
			local itemRef = Engine.GetItemRef( itemIndex )
			if itemRef == specificItemName then
				return true
			end
		end
	end
	return false
end

function IsCACEquippedWildcardItemCount( menu, wildcardName, expressionArg )
	local classModel = menu:getModel()
	local count = CoD.CACUtility.SpecificWildcardEquippedCount( classModel, wildcardName )
	return expressionArg == count
end

function IsCACCountGreaterThanEquippedWildcardItem( menu, wildcardName, expressionArg )
	local classModel = menu:getModel()
	local count = CoD.CACUtility.SpecificWildcardEquippedCount( classModel, wildcardName )
	return expressionArg <= count
end

function IsCACAttachmentSlotVisible( menu, element, controller, expressionArg )
	local isWeaponEquipped = IsCACSlotWeaponForAttachmentEquipped( menu, element, controller )
	if isWeaponEquipped then
		return not IsCACCountGreaterThanEquippedWildcardItem( menu, "bonuscard_primary_gunfighter", expressionArg )
	else
		return IsCACCountGreaterThanEquippedWildcardItem( menu, "bonuscard_primary_gunfighter", 0 )
	end
end

function IsHintTextLeftAlign( element, controller )
	local slotModel = element:getModel( controller, "weaponSlot" )
	if slotModel then
		local slotName = Engine.GetModelValue( slotModel )
		if LUI.startswith( slotName, "primarygadget" ) then
			return true
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
		local weaponSlotModel = Engine.GetModel( elementModel, "weaponSlot" )
		if weaponSlotModel then
			local weaponSlotName = Engine.GetModelValue( Engine.GetModel( elementModel, "weaponSlot" ) )
			if LUI.startswith( weaponSlotName, "primaryattachment" ) or LUI.startswith( weaponSlotName, "secondaryattachment" ) then
				return true
			end
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

function IsCACFifthPrimaryAttachmentAvailable( controller, menu )
	return IsCACCountGreaterThanEquippedWildcardItem( menu, "bonuscard_primary_gunfighter", 2 )
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
	local f161_local0 = CoD.CACUtility.ItemEquippedInSlot( "primary", controller )
	if f161_local0 then
		f161_local0 = GetNumberOfAttachmentsForSlot( "primary", controller ) > 0
	end
	return f161_local0
end

function IsSecondaryWeaponAttachmentAvailable( controller )
	local f162_local0 = CoD.CACUtility.ItemEquippedInSlot( "secondary", controller )
	if f162_local0 then
		f162_local0 = GetNumberOfAttachmentsForSlot( "secondary", controller ) > 0
	end
	return f162_local0
end

function IsItemSlotLockedByWildcardLocked( self, element, controller, bonusCardNameArg )
	element.itemIndex = Engine.GetItemIndex( bonusCardNameArg )
	return IsCACItemLocked( self, element, controller )
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

function IsBaseWeaponVariantIndex( self, element, controller )
	local cacVariantIndexModel = element:getModel( controller, "cacVariantIndex" )
	if cacVariantIndexModel then
		local cacVariantIndex = Engine.GetModelValue( cacVariantIndexModel )
		return cacVariantIndex == 0
	else
		return false
	end
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

local WeaponAttributeCompare = function ( attributeValues )
	local attributeValueTable = {}
	for token in string.gmatch( attributeValues, "[^,]+" ) do
		table.insert( attributeValueTable, tonumber( token ) )
	end
	if #attributeValueTable == 2 and attributeValueTable[1] < attributeValueTable[2] then
		return true
	else
		return false
	end
end

function IsCACWeaponAttributeIncrease( element, controller, attributeName )
	if element:getModel( controller, attributeName ) then
		local attributeValues = Engine.GetModelValue( element:getModel( controller, attributeName ) )
		return WeaponAttributeCompare( attributeValues )
	else
		return false
	end
end

function IsCACGunLevelMax( self, element, controller )
	local weaponIndex = CoD.CACUtility.GetGunLevelWeaponIndex( controller, element )
	if weaponIndex == CoD.CACUtility.EmptyItemIndex then
		return false
	else
		local gunCurrentRank = Engine.GetGunCurrentRank( controller, weaponIndex )
		local gunNextRank = Engine.GetGunNextRank( controller, weaponIndex )
		return gunCurrentRank == gunNextRank
	end
end

function IsCACGunLevelExists( self, element, controller )
	if not IsProgressionEnabled() then
		return false
	else
		local weaponIndex = CoD.CACUtility.GetGunLevelWeaponIndex( controller, element )
		return weaponIndex ~= CoD.CACUtility.EmptyItemIndex
	end
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

function AmICarryingEnemyFlag( controller )
	local playerName = Engine.GetPlayerNameForClientNum( controller, Engine.GetPredictedClientNum( controller ) )
	if playerName == "" then
		return false
	end
	local flagCarrierModel = Engine.CreateModel( Engine.GetModelForController( controller ), "CTF.enemyFlagCarrier" )
	local f180_local0
	if flagCarrierModel == nil or playerName ~= Engine.GetModelValue( flagCarrierModel ) then
		f180_local0 = false
	else
		f180_local0 = true
	end
	return f180_local0
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

function AmICarryingBomb( controller )
	if CoD.SafeGetModelValue( Engine.GetModelForController( controller ), "Demolition.defending" ) == false then
		return true
	else
		return IsModelValueEqualTo( controller, "hudItems.SDBombClient", Engine.GetPredictedClientNum( controller ) )
	end
end

function HasNetworkConnection()
	return Engine.CheckNetConnection() == true
end

function IsPlayerSignedInToLive( controller )
	return Engine.IsSignedInToLive( controller ) == true
end

function IsPlayerConnectedToCodServers( controller )
	return Engine.IsDemonwareFetchingDone( controller ) == true
end

function IsPlayerJoinable( element )
	local joinableModel = nil
	if element.activeWidget ~= nil then
		joinableModel = element.activeWidget:getModel()
	else
		joinableModel = element:getModel()
	end
	if joinableModel then
		joinableModel = Engine.GetModel( joinableModel, "isJoinable" )
	end
	local f186_local0
	if not joinableModel or Engine.GetModelValue( joinableModel ) ~= 1 then
		f186_local0 = false
	else
		f186_local0 = true
	end
	return f186_local0
end

function IsSystemLinkLobby()
	return Engine.GetLobbyNetworkMode() == CoD.LOBBY.MODE_LAN
end

function ShouldLobbyListBeUp()
	local f188_local0
	if IsMainModeInvalidAndNotTheaterMode() or Dvar.ui_execdemo_beta:get() then
		f188_local0 = Dvar.ui_execdemo_beta:get()
		if f188_local0 then
			f188_local0 = IsGameLobby()
			if not f188_local0 then
				f188_local0 = IsCustomLobby()
			end
		end
	else
		f188_local0 = true
	end
	return f188_local0
end

function ShowHeaderKicker( menu )
	return menu.showHeaderKicker == true
end

function ShowHeaderIcon( menu )
	return menu.showHeaderIcon == true
end

function IsMP()
	local mainModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" )
	if Engine.GetModelValue( mainModeModel ) == Enum.LobbyMainMode.LOBBY_MAINMODE_MP then
		return true
	else
		return false
	end
end

function IsCP()
	local mainModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" )
	if Engine.GetModelValue( mainModeModel ) == Enum.LobbyMainMode.LOBBY_MAINMODE_CP then
		return true
	else
		return false
	end
end

function IsZM()
	local mainModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" )
	if Engine.GetModelValue( mainModeModel ) == Enum.LobbyMainMode.LOBBY_MAINMODE_ZM then
		return true
	else
		return false
	end
end

function IsMainModeInvalid()
	local mainModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" )
	if Engine.GetModelValue( mainModeModel ) == Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID then
		return true
	else
		return false
	end
end

function IsMainModeInvalidAndNotTheaterMode()
	local mainModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyMainMode" )
	if Engine.GetModelValue( mainModeModel ) == Enum.LobbyMainMode.LOBBY_MAINMODE_INVALID and not Engine.GameModeIsMode( CoD.GAMEMODE_THEATER ) then
		return true
	else
		return false
	end
end

function IsLive()
	local sessionModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" )
	if Engine.GetModelValue( sessionModeModel ) == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE then
		return true
	else
		return false
	end
end

function IsLAN()
	local sessionModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" )
	if Engine.GetModelValue( sessionModeModel ) == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		return true
	else
		return false
	end
end

function IsLocal()
	local sessionModeModel = Engine.GetModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNetworkMode" )
	if Engine.GetModelValue( sessionModeModel ) == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LOCAL then
		return true
	else
		return false
	end
end

function IsCustomLobby()
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	local f199_local0
	if lobbyNav ~= LobbyData.UITargets.UI_CPLOBBYONLINECUSTOMGAME.id and lobbyNav ~= LobbyData.UITargets.UI_CP2LOBBYONLINECUSTOMGAME.id and lobbyNav ~= LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME.id and lobbyNav ~= LobbyData.UITargets.UI_ZMLOBBYONLINECUSTOMGAME.id then
		f199_local0 = false
	else
		f199_local0 = true
	end
	return f199_local0
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

function IsLobbyMode( expressionArg )
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	if lobbyNav then
		local menu = LobbyData:UITargetFromId( lobbyNav )
		return menu.lobbyMode == expressionArg
	else
		
	end
end

function IsLobbyAdvertised()
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	if lobbyNav then
		local menu = LobbyData:UITargetFromId( lobbyNav )
		return menu.isAdvertised
	else
		return false
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

function IsLobbyHost()
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		return Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	elseif Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) then
		return Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	else
		return false
	end
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
	local f210_local0
	if lobbyNav ~= LobbyData.UITargets.UI_MPLOBBYONLINEPUBLICGAME.id and lobbyNav ~= LobbyData.UITargets.UI_ZMLOBBYONLINEPUBLICGAME.id then
		f210_local0 = false
	else
		f210_local0 = true
	end
	return f210_local0
end

function IsLobbyWithTeamAssignment()
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	local f211_local0
	if lobbyNav ~= LobbyData.UITargets.UI_MPLOBBYONLINECUSTOMGAME.id and lobbyNav ~= LobbyData.UITargets.UI_MPLOBBYLANGAME.id then
		f211_local0 = false
	else
		f211_local0 = true
	end
	return f211_local0
end

function IsTeamAssignment( expressionArg )
	return Engine.GetGametypeSetting( "teamAssignment" ) == expressionArg
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
		local f216_local0
		if element:getParent() ~= nil then
			f216_local0 = element:getParent()
			f216_local0 = f216_local0.isPartyMemberItem
		else
			f216_local0 = false
		end
	end
	return f216_local0
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
	local returningFromBarracks = CoD.perController[controller].returningFromBarracks
	CoD.perController[controller].returningFromBarracks = false
	local f221_local0 = returningFromBarracks
	local f221_local1 = menu.previousMenuName
	if f221_local1 then
		f221_local1 = f221_local0 or menu.previousMenuName == "ModeSelect"
	end
	return f221_local1
end

function ShouldShowAddController( menu, element, controller )
	if Dvar.ui_execdemo_gamescom:get() then
		return false
	end
	local lobbyType = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		lobbyType = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	local playerCount = Engine.GetLobbyClientCount( lobbyType )
	local maxClientCount = Engine.GetLobbyMaxClients( lobbyType )
	local localClientCount = Engine.GetLobbyLocalClientCount( lobbyType )
	local maxLocalClients = Dvar.lobby_maxLocalPlayers:get()
	local f222_local0
	if playerCount >= maxClientCount or localClientCount >= maxLocalClients then
		f222_local0 = false
	else
		f222_local0 = true
	end
	return f222_local0
end

function ShouldDisableEditCodCasterSettingsButton( controller )
	if not IsCodCaster( controller ) then
		return true
	elseif MapVoteTimerActive() then
		return true
	else
		return false
	end
end

function ShouldShowEditCodCasterSettingsButton( controller )
	if Engine.GetGametypeSetting( "allowspectating" ) == 1 then
		return true
	else
		return false
	end
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
	if Dvar.ui_execdemo_gamescom:get() then
		return false
	elseif menu.currentFilter == filterText then
		return true
	elseif not menu.currentFilter and filterText == "all" then
		return true
	else
		return false
	end
end

function LobbyHas4PlayersOrLess()
	local clientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE )
	if Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME ) then
		clientCount = Engine.GetLobbyClientCount( Enum.LobbyType.LOBBY_TYPE_GAME )
	end
	return clientCount <= 4
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

function PregameActive()
	local pregameState = Engine.GetLobbyPregameState()
	return pregameState ~= Enum.LobbyPregameState.LOBBY_PREGAME_STATE_IDLE
end

function CharacterDraftActive()
	local pregameState = Engine.GetLobbyPregameState()
	return pregameState == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_CHARACTER_DRAFT
end

function CharacterDraftEnabled()
	return Engine.GetGametypeSetting( "pregameItemVoteEnabled" ) == 1
end

function ItemRestrictionVoteActive()
	local pregameState = Engine.GetLobbyPregameState()
	return pregameState == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_ITEM_VOTE
end

function ItemRestrictionCACEditActive()
	local pregameState = Engine.GetLobbyPregameState()
	return pregameState == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_CAC_EDIT
end

function ItemRestrictionScorestreakEditActive()
	local pregameState = Engine.GetLobbyPregameState()
	return pregameState == Enum.LobbyPregameState.LOBBY_PREGAME_STATE_SCORESTREAK_EDIT
end

function PregameStateEqualToEnum( enumValue )
	local pregameState = Engine.GetLobbyPregameState()
	return pregameState == enumValue
end

function CharacterLoadoutDrafted( menu, element, controller )
	if not CharacterDraftActive() then
		return false
	else
		local elementModel = element:getModel()
		if elementModel then
			local xuid = Engine.GetXUID64( controller )
			local team = Engine.GetTeamForXUID( xuid )
			local itemIndexModel = Engine.GetModel( elementModel, "itemIndex" )
			local itemIndex = Engine.GetModelValue( itemIndexModel )
			return Engine.CharacterLoadoutDrafted( itemIndex, team )
		else
			return false
		end
	end
end

function ItemIsBanned( menu, element, controller )
	local itemInfo = CoD.CACUtility.GetItemInfoFromElement( controller, element )
	if itemInfo then
		if CoD.CACUtility.ItemSlotBannedByBonuscard( itemInfo.loadoutSlot, itemInfo.itemIndex ) then
			return true
		elseif CoD.CACUtility.ItemSlotBannedByBonuscard( itemInfo.weaponSlot, itemInfo.itemIndex ) then
			return true
		elseif (itemInfo.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM or itemInfo.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT) and Engine.GetItemVote( itemInfo.itemIndex ) == Enum.VoteType.VOTE_TYPE_BAN then
			return true
		elseif (itemInfo.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT or itemInfo.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT) and Engine.GetAttachmentVote( itemInfo.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_BAN then
			return true
		elseif itemInfo.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
			return Engine.GetItemAttachmentVote( itemInfo.itemIndex, itemInfo.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_BAN
		elseif itemInfo.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
			return Engine.GetAttachmentGroupVote( itemInfo.itemGroup, itemInfo.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_BAN
		end
	end
	return false
end

function ItemIsProtected( menu, element, controller )
	local itemInfo = CoD.CACUtility.GetItemInfoFromElement( controller, element )
	if itemInfo then
		if itemInfo.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
			return Engine.GetItemVote( itemInfo.itemIndex ) == Enum.VoteType.VOTE_TYPE_PROTECT
		elseif itemInfo.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
			return Engine.GetAttachmentVote( itemInfo.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_PROTECT
		elseif itemInfo.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
			return Engine.GetItemAttachmentVote( itemInfo.itemIndex, itemInfo.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_PROTECT
		elseif itemInfo.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
			return Engine.GetAttachmentGroupVote( itemInfo.itemGroup, itemInfo.attachmentIndex ) == Enum.VoteType.VOTE_TYPE_PROTECT
		end
	end
	return false
end

function ClassContainsRestrictedItems( menu, element, controller )
	local classIndexModel = element:getModel( controller, "classNum" )
	if classIndexModel then
		local classIndex = Engine.GetModelValue( classIndexModel )
		local bannedItems = CoD.CACUtility.GetAllRestrictedItems()
		if #bannedItems == 0 then
			return false
		else
			return CoD.CACUtility.ClassContainsRestrictedItems( controller, classIndex )
		end
	else
		return false
	end
end

function AnyClassContainsRestrictedItems( menu, element, controller )
	return CoD.CACUtility.AnyClassContainsRestrictedItems( controller )
end

function AnyEquippedScorestreaksBanned( menu, element, controller )
	return CoD.CACUtility.AnyEquippedScorestreaksBanned( controller )
end

function AnyCACContentBanned( menu, element, controller )
	return CoD.CACUtility.AnyCACItemsBanned()
end

function AnyScorestreaksBanned( menu, element, controller )
	return CoD.CACUtility.AnyStreaksBanned()
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
	local f249_local0 = CanAffordRaidPurchase( menu, element:getParent(), controller )
	if f249_local0 then
		f249_local0 = not RaidPurchaseItemDisabled( menu, element:getParent(), controller )
	end
	return f249_local0
end

function RaidPurchaseAllowed( menu, element, controller )
	local f250_local0 = CanAffordRaidPurchase( menu, element, controller )
	if f250_local0 then
		f250_local0 = not RaidPurchaseItemDisabled( menu, element, controller )
	end
	return f250_local0
end

function IsStoreAvailable()
	local f251_local0
	if not CoD.isPC and not CoD.isZombie then
		f251_local0 = Engine.IsFFOTDFetched()
		if f251_local0 then
			f251_local0 = Dvar.ui_inGameStoreVisible:get()
		end
	else
		f251_local0 = false
	end
	return f251_local0
end

function IsPlayerDead( element, controller )
	local model = element:getModel( controller, "clientNum" )
	if model then
		return Engine.IsPlayerDead( controller, Engine.GetModelValue( model ) )
	else
		return false
	end
end

function IsPlayerInLastStand( element, controller )
	local parent = element:getParent()
	local f253_local0 = parent
	local model = parent:getModel( controller, "clientNum" )
	local f253_local1 = f253_local0 and model
	if f253_local1 then
		return Engine.IsPlayerInLastStand( controller, Engine.GetModelValue( f253_local1 ) )
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
	local f258_local0 = element:getParent()
	local model = f258_local0:getModel( controller, "objectiveIcon" )
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
	local f261_local0
	if not IsWaitingForSignInToPlaySplitscreen() then
		f261_local0 = IsThereRoomForAnotherSplitscreenPlayer()
	else
		f261_local0 = false
	end
	return f261_local0
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
	local f263_local0
	if perkCount == nil or perkCount <= 0 then
		f263_local0 = false
	else
		f263_local0 = true
	end
	return f263_local0
end

function HasOnePerkInSlot0( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local perkCount = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "perks.perk0_count" ) )
	local f264_local0
	if perkCount == nil or perkCount ~= 1 then
		f264_local0 = false
	else
		f264_local0 = true
	end
	return f264_local0
end

function HasTwoPerksInSlot0( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local perkCount = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "perks.perk0_count" ) )
	local f265_local0
	if perkCount == nil or perkCount ~= 2 then
		f265_local0 = false
	else
		f265_local0 = true
	end
	return f265_local0
end

function HasPerksInSlot1( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local perkCount = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "perks.perk1_count" ) )
	local f266_local0
	if perkCount == nil or perkCount <= 0 then
		f266_local0 = false
	else
		f266_local0 = true
	end
	return f266_local0
end

function HasOnePerkInSlot1( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local perkCount = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "perks.perk1_count" ) )
	local f267_local0
	if perkCount == nil or perkCount ~= 1 then
		f267_local0 = false
	else
		f267_local0 = true
	end
	return f267_local0
end

function HasTwoPerksInSlot1( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local perkCount = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "perks.perk1_count" ) )
	local f268_local0
	if perkCount == nil or perkCount ~= 2 then
		f268_local0 = false
	else
		f268_local0 = true
	end
	return f268_local0
end

function HasPerksInSlot2( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local perkCount = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "perks.perk2_count" ) )
	local f269_local0
	if perkCount == nil or perkCount <= 0 then
		f269_local0 = false
	else
		f269_local0 = true
	end
	return f269_local0
end

function HasOnePerkInSlot2( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local perkCount = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "perks.perk2_count" ) )
	local f270_local0
	if perkCount == nil or perkCount ~= 1 then
		f270_local0 = false
	else
		f270_local0 = true
	end
	return f270_local0
end

function HasTwoPerksInSlot2( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local perkCount = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "perks.perk2_count" ) )
	local f271_local0
	if perkCount == nil or perkCount ~= 2 then
		f271_local0 = false
	else
		f271_local0 = true
	end
	return f271_local0
end

function IsGameTypeEqualToString( stringArg )
	local gameType = Engine.DvarString( nil, "g_gametype" )
	local f272_local0
	if gameType == nil or gameType ~= stringArg then
		f272_local0 = false
	else
		f272_local0 = true
	end
	return f272_local0
end

function IsBombBasedGameMode()
	local gameType = Engine.DvarString( nil, "g_gametype" )
	local f273_local0
	if gameType == nil or gameType ~= "sd" and gameType ~= "sr" and gameType ~= "dem" then
		f273_local0 = false
	else
		f273_local0 = true
	end
	return f273_local0
end

function IsGametypeSettingsValue( gametypeSetting, expressionArg )
	return Engine.GetGametypeSetting( gametypeSetting ) == expressionArg
end

function ShouldBootUpHUD( menu )
	if not Engine.IsVisibilityBitSet( 0, Enum.UIVisibilityBit.BIT_HUD_VISIBLE ) then
		return false
	else
		return not menu.hasBooted
	end
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
		local f278_local0
		if not Engine.IsWeaponType( weapon, "melee" ) and not Engine.IsWeaponType( weapon, "riotshield" ) then
			f278_local0 = not Engine.IsWeaponType( weapon, "grenade" )
		else
			f278_local0 = false
		end
	end
	return f278_local0
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

function IsLowAmmoDWClip( controller )
	local lowClip = Engine.IsDWAmmoClipLow( controller )
	if lowClip then
		return lowClip
	else
		return false
	end
end

function IsHeroWeaponGadgetCurrentWeapon( menu, controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if not IsModelValueTrue( controller, "playerAbilities.playerGadget3.isInUse" ) then
		return false
	elseif Engine.isValidGadgetSlot( slot ) and Engine.IsGadgetCurrentWeapon( controller, slot ) then
		menu.wasHeroWeaponActivated = true
		return true
	else
		return false
	end
end

function IsHeroWeaponOrGadgetInUse( menu, controller )
	local slot = Engine.getHeldGadgetSlotForLoadoutGadget( controller, Enum.loadoutGadgetType_e.LOADOUT_GADGETS_HERO_WEAPON )
	if Engine.isValidGadgetSlot( slot ) then
		if Engine.IsGadgetCurrentWeapon( controller, slot ) or Engine.IsGadgetContextualWeaponActive( controller, slot ) then
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
			return IsModelValueTrue( controller, "playerAbilities.playerGadget3.isInUse" )
		end
	end
end

function IsHeroGadgetInUse( menu, controller )
	return IsModelValueTrue( controller, "playerAbilities.playerGadget3.isInUse" )
end

function IsHeroWeaponSpeedBurst( menu, controller )
	return IsModelValueEqualTo( controller, "playerAbilities.playerGadget3.name", "WEAPON_GADGET_SPEED_BURST" )
end

function HasPerk( controller, perkId )
	local f287_local0 = IsModelValueEqualTo( controller, "playerAbilities.playerGadget3.name", "WEAPON_GADGET_COMBAT_EFFICIENCY" )
	if f287_local0 then
		f287_local0 = IsModelValueEqualTo( controller, "playerAbilities.playerGadget3.isInUse", true )
	end
	return f287_local0
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

function IsCurrentWeaponReference( controller, weaponReference )
	local weaponReferenceForMode = weaponReference .. "_" .. CoD.gameMode:lower()
	local model = Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.equippedWeaponReference" )
	local f289_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f289_local1 = f289_local0 and modelValue
	local f289_local2
	if f289_local1 == nil or f289_local1 ~= weaponReferenceForMode then
		f289_local2 = false
	else
		f289_local2 = true
	end
	return f289_local2
end

function IsCurrentViewmodelWeaponName( controller, weaponName )
	local weaponNameForMode = weaponName .. "_" .. CoD.gameMode:lower()
	local model = Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon.viewmodelWeaponName" )
	local f290_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f290_local1 = f290_local0 and modelValue
	local f290_local2
	if f290_local1 == nil or f290_local1 ~= weaponNameForMode then
		f290_local2 = false
	else
		f290_local2 = true
	end
	return f290_local2
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
	local f304_local0
	if menu.wasHeroWeaponActivated ~= nil then
		f304_local0 = menu.wasHeroWeaponActivated
	else
		f304_local0 = false
	end
	return f304_local0
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
	local f307_local0
	if power == nil or power < 1 then
		f307_local0 = false
	else
		f307_local0 = true
	end
	return f307_local0
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
		elseif isHeroVersion_2_0( controller, slot ) then
			return Engine.IsGadgetReady( controller, slot )
		else
			return not IsHeroWeaponGadgetAmmoEmpty( menu, controller )
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
	local f324_local0 = CoD.T6ChangeClass
	if f324_local0 then
		local selectedClassNum = CoD.T6ChangeClass.SelectedClassIndex[controller]
	end
	if f324_local0 ~= nil then
		local primaryGrenadeIndex = Engine.GetClassItem( controller, f324_local0, "primarygadget" )
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
	local f325_local0 = CoD.T6ChangeClass
	if f325_local0 then
		local selectedClassNum = CoD.T6ChangeClass.SelectedClassIndex[controller]
	end
	if f325_local0 ~= nil then
		local specialGrenadeIndex = Engine.GetClassItem( controller, f325_local0, "secondarygadget" )
		if specialGrenadeIndex == CoD.CACUtility.EmptyItemIndex then
			return false
		end
	end
	return true
end

function PulseNoAmmo( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local pulse = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "hudItems.pulseNoAmmo" ) )
	local f326_local0
	if pulse == nil or pulse <= 0 then
		f326_local0 = false
	else
		f326_local0 = true
	end
	return f326_local0
end

function IsStickyImageActive( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local stickyImage = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "hudItems.stickyImage" ) )
	local f327_local0 = stickyImage
	local f327_local1
	if stickyImage == "" or stickyImage == "blacktransparent" then
		f327_local1 = false
	else
		f327_local1 = f327_local0 and true
	end
	return f327_local1
end

function IsShockImageBottomActive( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local shockImage = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "hudItems.shockImageBottom" ) )
	local f328_local0 = shockImage
	local f328_local1
	if shockImage == "" or shockImage == "blacktransparent" then
		f328_local1 = false
	else
		f328_local1 = f328_local0 and true
	end
	return f328_local1
end

function IsShockImageRightActive( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local shockImage = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "hudItems.shockImageRight" ) )
	local f329_local0 = shockImage
	local f329_local1
	if shockImage == "" or shockImage == "blacktransparent" then
		f329_local1 = false
	else
		f329_local1 = f329_local0 and true
	end
	return f329_local1
end

function IsShockImageLeftActive( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local shockImage = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "hudItems.shockImageLeft" ) )
	local f330_local0 = shockImage
	local f330_local1
	if shockImage == "" or shockImage == "blacktransparent" then
		f330_local1 = false
	else
		f330_local1 = f330_local0 and true
	end
	return f330_local1
end

function IsShockImageTopActive( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local shockImage = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "hudItems.shockImageTop" ) )
	local f331_local0 = shockImage
	local f331_local1
	if shockImage == "" or shockImage == "blacktransparent" then
		f331_local1 = false
	else
		f331_local1 = f331_local0 and true
	end
	return f331_local1
end

function IsArmorOverlayActive( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local armorImage = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "hudItems.armorOverlay" ) )
	local f332_local0 = armorImage
	local f332_local1
	if armorImage == "" or armorImage == "blacktransparent" then
		f332_local1 = false
	else
		f332_local1 = f332_local0 and true
	end
	return f332_local1
end

function IsAnyKillstreakInRangeAvailable( controller, numArgStart, numArgEnd )
	local killstreaksModel = Engine.GetModel( Engine.GetModelForController( controller ), "killstreaks" )
	if not killstreaksModel then
		return false
	end
	for streak = numArgStart, numArgEnd, 1 do
		local killstreakModel = Engine.GetModel( killstreaksModel, "killstreak" .. streak .. ".rewardAmmo" )
		local f333_local2 = killstreakModel
		local streakAvailable = Engine.GetModelValue( killstreakModel )
		local f333_local3 = f333_local2 and streakAvailable
		if f333_local3 ~= nil and f333_local3 > 0 then
			return true
		end
	end
	return false
end

function HigherKillstreakHasAmmo( controller, element )
	local parent = element:getParent()
	local f334_local0 = parent
	local gridInfoTable = parent.gridInfoTable
	local f334_local1 = f334_local0 and gridInfoTable
	if f334_local1 == nil then
		return false
	else
		local index = 3 - f334_local1.zeroBasedIndex
		if index >= 3 then
			return false
		else
			return IsAnyKillstreakInRangeAvailable( controller, index + 1, 4 )
		end
	end
end

function LowerKillstreakHasAmmo( controller, element )
	local parent = element:getParent()
	local f335_local0 = parent
	local gridInfoTable = parent.gridInfoTable
	local f335_local1 = f335_local0 and gridInfoTable
	if f335_local1 == nil then
		return false
	else
		local index = 3 - f335_local1.zeroBasedIndex
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
				local f336_local0 = killstreakModel
				local killstreakMomentum = Engine.GetModelValue( killstreakModel )
				local f336_local1 = f336_local0 and killstreakMomentum
				if f336_local1 == nil or rewardMomentum < f336_local1 then
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
	local f337_local0 = controllerModel
	local scoreLimit = Engine.GetModel( controllerModel, "gameScore.scoreLimit" )
	local f337_local1 = f337_local0 and scoreLimit
	if f337_local1 then
		f337_local1 = Engine.GetModelValue( f337_local1 )
	end
	local f337_local2 = controllerModel
	local model = Engine.GetModel( controllerModel, modelArg )
	local f337_local3 = f337_local2 and model
	local f337_local4 = f337_local3
	local modelValue = Engine.GetModelValue( f337_local3 )
	local f337_local5 = f337_local4 and modelValue
	local f337_local6
	if f337_local1 == nil or f337_local5 == nil or f337_local1 > f337_local5 * 2 then
		f337_local6 = false
	else
		f337_local6 = true
	end
	return f337_local6
end

function IsCursorHintActive( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local showCursorHint = Engine.GetModelValue( Engine.CreateModel( perControllerModel, "hudItems.showCursorHint" ) )
	local f338_local0
	if showCursorHint == nil or showCursorHint ~= true then
		f338_local0 = false
	else
		f338_local0 = true
	end
	return f338_local0
end

function IsGameTypeDOA()
	local f339_local0
	if Dvar.ui_gametype == nil or Dvar.ui_gametype:get() ~= "doa" then
		f339_local0 = false
	else
		f339_local0 = true
	end
	return f339_local0
end

function HideScoreMeterDueToGameType()
	local actualGameType = Engine.DvarString( nil, "g_gametype" )
	local f340_local0
	if actualGameType == nil or actualGameType ~= "ctf" and actualGameType ~= "dem" and actualGameType ~= "sd" then
		f340_local0 = false
	else
		f340_local0 = true
	end
	return f340_local0
end

function IsGameTypeCodfu( menu, element, event )
	local f341_local0
	if Dvar.ui_gametype == nil or Dvar.ui_gametype:get() ~= "codfu" then
		f341_local0 = false
	else
		f341_local0 = true
	end
	return f341_local0
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

function IsZombieRoundEqualTo( element, controller, expressionArg )
	IsSelfModelValueEqualTo( element, controller, "roundsPlayed", Engine.GetGametypeSetting( "startRound" ) + expressionArg )
end

function IsZombieRoundOnesDigitEqualTo( element, controller, expressionArg )
	local model = element:getModel()
	if model then
		model = Engine.GetModel( model, "roundsPlayed" )
	end
	local f347_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f347_local1 = f347_local0 and modelValue
	if f347_local1 == nil then
		return false
	else
		return (f347_local1 - Engine.GetGametypeSetting( "startRound" )) % 10 == expressionArg
	end
end

function IsZombieRoundTensDigitEqualTo( element, controller, expressionArg )
	local model = element:getModel()
	if model then
		model = Engine.GetModel( model, "roundsPlayed" )
	end
	local f348_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f348_local1 = f348_local0 and modelValue
	if f348_local1 == nil then
		return false
	else
		f348_local1 = f348_local1 - Engine.GetGametypeSetting( "startRound" )
		local ones = f348_local1 % 10
		local tens = (f348_local1 % 100 - ones) / 10
		return tens == expressionArg
	end
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

function IsEnabledByGametypeSetting( element, controller )
	if element.enabledWithGametypeSetting ~= nil then
		return Engine.GetGametypeSetting( element.enabledWithGametypeSetting ) == 1
	else
		return true
	end
end

function IsSelected( element, controller )
	local selectedModel = element:getModel( controller, "selected" )
	if selectedModel then
		element.selected = Engine.GetModelValue( selectedModel )
	end
	return element.selected
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
	local f354_local0
	if self.layoutItems == nil or #self.layoutItems <= 0 then
		f354_local0 = false
	else
		f354_local0 = true
	end
	return f354_local0
end

function IsFirstItem( self )
	local f355_local0 = self.isFirstItem
	if f355_local0 then
		f355_local0 = self:isFirstItem()
	end
	return f355_local0
end

function IsLastItem( self )
	local f356_local0 = self.isLastItem
	if f356_local0 then
		f356_local0 = self:isLastItem()
	end
	return f356_local0
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

function IsHeroWeaponAbilityNotAvailable( element, controller )
	local isItemNotPurchased = not IsCACItemPurchased( element, controller )
	local isFirstTimeSetup = IsFirstTimeSetup( controller, Enum.eModes.MODE_MULTIPLAYER )
	local f359_local0 = isItemNotPurchased
	local f359_local1 = IsLive()
	if f359_local1 then
		f359_local1 = f359_local0 or isFirstTimeSetup
	end
	return f359_local1
end

function IsHeroOnDisabledLoadoutItem( element )
	return element.disabled
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

function FirstTimeSetup_IsActive( controller )
	local firstTimeFlowStateModel = Engine.CreateModel( Engine.GetModelForController( controller ), "firstTimeFlowState" )
	local firstTimeFlowState = Engine.GetModelValue( firstTimeFlowStateModel )
	return firstTimeFlowState ~= CoD.CCUtility.FirstTimeFlowState.None
end

function FirstTimeSetup_Overview( controller )
	local firstTimeFlowStateModel = Engine.CreateModel( Engine.GetModelForController( controller ), "firstTimeFlowState" )
	local firstTimeFlowState = Engine.GetModelValue( firstTimeFlowStateModel )
	return firstTimeFlowState == CoD.CCUtility.FirstTimeFlowState.Overview
end

function FirstTimeSetup_ChangedCharacter( controller )
	local firstTimeFlowStateModel = Engine.CreateModel( Engine.GetModelForController( controller ), "firstTimeFlowState" )
	local firstTimeFlowState = Engine.GetModelValue( firstTimeFlowStateModel )
	return firstTimeFlowState == CoD.CCUtility.FirstTimeFlowState.SelectionChanged
end

function FirstTimeSetup_Complete( controller )
	local firstTimeFlowStateModel = Engine.CreateModel( Engine.GetModelForController( controller ), "firstTimeFlowState" )
	local firstTimeFlowState = Engine.GetModelValue( firstTimeFlowStateModel )
	return firstTimeFlowState == CoD.CCUtility.FirstTimeFlowState.Complete
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
		local f373_local0
		if Engine.GetModelValue( statusModel ) ~= "current" and Engine.GetModelValue( statusModel ) ~= "active" then
			f373_local0 = false
		else
			f373_local0 = true
		end
		return f373_local0
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
		local f377_local0 = stateModel
		local state = Engine.GetModelValue( stateModel )
		local f377_local1 = f377_local0 and state
		local clientNum = Engine.GetPredictedClientNum( controller )
		if f377_local1 == nil or f377_local1 == CoD.OBJECTIVESTATE_INVISIBLE then
			return true
		else
			local clientUseMaskModel = Engine.GetModel( element:getModel(), "clientUseMask" )
			local f377_local2 = clientUseMaskModel
			local clientUseMask = Engine.GetModelValue( clientUseMaskModel )
			local f377_local3 = f377_local2 and clientUseMask
			if f377_local3 == nil or f377_local3 == 0 then
				return false
			else
				local clientNum = Engine.GetPredictedClientNum( controller )
				return f377_local3 & 1 << clientNum == 0
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

function IsListSelectionMode( menu, expressionArg )
	return menu.currentMode == expressionArg
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
		if typeName == "paintjob" and paintjobSlot ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and paintjobIndex ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
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
	if slotModel and Engine.GetCollectibleInBunkSlot( controller, Engine.GetModelValue( slotModel ) ) ~= nil then
		return true
	else
		return false
	end
end

function Gunsmith_IsEnabled( element, controller )
	if Dvar.ui_execdemo_beta:get() then
		return false
	end
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
	end
	return paintshopDataDownloaded and gunsmithDataDownloaded and IsIntDvarNonZero( "gunsmith_enabled" )
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

function Gunsmith_IsItemMutuallyExclusiveWithSelection( element, controller )
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	local attachmentList = CoD.CraftUtility.Gunsmith.GetVariantAttachmentList( controller, variantModel )
	local itemIndex = CoD.CACUtility.EmptyItemIndex
	local itemIndexModel = element:getModel( controller, "attachmentIndex" )
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	if itemIndexModel then
		itemIndex = Engine.GetModelValue( itemIndexModel )
		for _, attachmentIndex in ipairs( attachmentList ) do
			if CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX < attachmentIndex and itemIndex ~= REG11 then
				local attachmentTableItemIndex = Engine.GetAttachmentIndexByAttachmentTableIndex( weaponIndex, itemIndex, Enum.eModes.MODE_MULTIPLAYER )
				local attachmentTableAttachmentIndex = Engine.GetAttachmentIndexByAttachmentTableIndex( weaponIndex, REG11, Enum.eModes.MODE_MULTIPLAYER )
				return not Engine.AreAttachmentsCompatible( weaponIndex, attachmentTableItemIndex, attachmentTableAttachmentIndex, Enum.eModes.MODE_MULTIPLAYER )
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

function Gunsmith_IsSpecialWeapon( menu, element, controller )
	local groupName = CoD.CraftUtility.GetWeaponGroupName( controller )
	local isSpecialWeapon = false
	if groupName == "weapon_launcher" or groupName == "weapon_knife" then
		isSpecialWeapon = true
	end
	return isSpecialWeapon
end

function Gunsmith_IsHandguns( menu, element, controller )
	local groupName = CoD.CraftUtility.GetWeaponGroupName( controller )
	return groupName == "weapon_pistol"
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

function Gunsmith_IsVariantCountEmpty( element, controller )
	local weaponIndexModel = element:getModel( controller, "itemIndex" )
	if weaponIndexModel then
		local weaponIndex = Engine.GetModelValue( weaponIndexModel )
		if weaponIndex > CoD.CACUtility.EmptyItemIndex then
			local totalVariantCount = CoD.CraftUtility.Gunsmith.GetTotalUsedWeaponVariants( weaponIndex )
			if totalVariantCount <= 0 then
				return false
			end
		end
	end
	return true
end

function IsAttachmentLockedInWeaponBuildKits( element, controller )
	local itemIndex = CoD.GetCustomization( controller, "weapon_index" )
	local attachmentIndexModel = element:getModel( controller, "attachmentIndex" )
	if itemIndex and attachmentIndexModel then
		local attachmentIndex = Engine.GetModelValue( attachmentIndexModel )
		local attachmentTableAttachmentIndex = Engine.GetAttachmentIndexByAttachmentTableIndex( itemIndex, attachmentIndex, Enum.eModes.MODE_ZOMBIES )
		return Engine.IsItemAttachmentLocked( controller, itemIndex, attachmentTableAttachmentIndex )
	else
		
	end
end

function IsAttachmentSlotLocked( element, controller, expressionArg )
	local itemIndexModel = element:getModel( controller, "weaponIndex" )
	if not itemIndexModel then
		return false
	end
	local itemIndex = Engine.GetModelValue( itemIndexModel )
	local returnValue = Engine.IsAttachmentSlotLocked( controller, itemIndex, expressionArg )
	if returnValue == nil then
		returnValue = false
	end
	return returnValue
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

function Paintjobs_SlotsFull()
	local totalUsedPaintjobs = CoD.CraftUtility.Paintjobs.GetTotalUsedPaintjobs()
	local totalAllowedPaintjobs = CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs()
	if totalAllowedPaintjobs <= totalUsedPaintjobs then
		return true
	else
		return false
	end
end

function Paintjobs_IsCountGreaterThanZero( element, controller )
	local weaponIndexModel = element:getModel( controller, "itemIndex" )
	if weaponIndexModel then
		local weaponIndex = Engine.GetModelValue( weaponIndexModel )
		if weaponIndex > CoD.CACUtility.EmptyItemIndex then
			local paintjobCount = CoD.CraftUtility.Paintjobs.GetTotalWeaponPaintjobs( weaponIndex )
			if paintjobCount <= 0 then
				return false
			end
		end
	end
	return true
end

function Paintjobs_IsEnabled( element, controller )
	if Dvar.storage_offline:get() == false and Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		return false
	elseif Engine.IsUserContentRestricted( controller ) then
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

function Paintjobs_ValidPaintjobNameEntered( element, controller )
	local validPaintjobNameModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Paintshop.validPaintjobNameEntered" )
	local validPaintjobNameEntered = Engine.GetModelValue( validPaintjobNameModel )
	if validPaintjobNameEntered ~= nil and validPaintjobNameEntered == true then
		element:makeFocusableWithoutResettingNavigation()
		return true
	else
		element:makeNotFocusable()
		return false
	end
end

function Emblem_IsOccupied( element, controller )
	local emblemIndexModel = Engine.GetModel( element:getModel(), "emblemIndex" )
	if emblemIndexModel then
		local emblemIndex = Engine.GetModelValue( emblemIndexModel )
		if CoD.CraftUtility.Emblems.IsEmblemIndexOccupied( emblemIndex ) then
			return true
		end
	end
	return false
end

function Emblem_IsLayerInBrowseMode( element, controller )
	local editorMode = CoD.GetEditorProperties( controller, "editorMode" )
	if editorMode == Enum.CustomizationEditorMode.CUSTOMIZATION_EDITOR_MODE_BROWSE then
		local linkedLayerCount = CoD.GetEditorProperties( controller, "linkedLayerCount" )
		if not Emblem_IsLayerGrouped( element, controller ) then
			if not Emblems_IsLayerLinked( element, controller ) then
				return true
			elseif Emblems_IsLayerLinked( element, controller ) and linkedLayerCount < 2 then
				return true
			end
		end
		return false
	else
		return false
	end
end

function Emblems_ValidEmblemNameEntered( element, controller )
	local validEmblemNameModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Emblem.validEmblemNameEntered" )
	local validEmblemNameEntered = Engine.GetModelValue( validEmblemNameModel )
	if validEmblemNameEntered ~= nil and validEmblemNameEntered == true then
		return true
	else
		return false
	end
end

function Emblems_IsEnabled( element, controller )
	if Dvar.ui_execdemo_beta:get() then
		return false
	elseif Dvar.storage_offline:get() == false and Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		return false
	else
		return Emblems_IsDataDownloaded( element, controller )
	end
end

function Emblems_IsDataDownloaded( element, controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local dataDownloadedModel = Engine.GetModel( perControllerModel, "Emblem.DataDownloaded" )
	local dataDownloaded = false
	if dataDownloadedModel then
		dataDownloaded = Engine.GetModelValue( dataDownloadedModel )
	end
	return dataDownloaded
end

function Emblems_IsLayerLinked( element, controller )
	local isLinkedModel = element:getModel( controller, "isLinked" )
	if isLinkedModel then
		local isLayerLinked = Engine.GetModelValue( isLinkedModel )
		return isLayerLinked
	else
		return false
	end
end

function Emblem_IsLayerGrouped( element, controller )
	local isGroupedModel = element:getModel( controller, "isGrouped" )
	if isGroupedModel then
		return Engine.GetModelValue( isGroupedModel )
	else
		return false
	end
end

function Emblem_IsLayerGroupedByLayerIndex( element, controller )
	local customizationType = CoD.GetCustomization( controller, "type" )
	if CoD.perController[controller].selectedLayerIndex ~= nil then
		local layerIndex = CoD.perController[controller].selectedLayerIndex
		local layerData = Engine.GetSelectedLayerData( controller, layerIndex, customizationType )
		return layerData.isGrouped
	else
		return false
	end
end

function IsEmblemEmpty( controller )
	local totalLayers = CoD.perController[controller].totalLayers
	local customizationType = CoD.GetCustomization( controller, "type" )
	return Engine.IsEmblemEmpty( controller, customizationType, totalLayers )
end

function IsLayerEmpty( self, element, controller )
	if self.layerCarousel ~= nil then
		local row = self.layerCarousel.currentStartRow
		local column = self.layerCarousel.currentStartColumn
		element = self.layerCarousel.layoutItems[row][column]
	end
	if element then
		local layerIndexModel = element:getModel( controller, "layerIndex" )
		if not layerIndexModel then
			return true
		else
			local index = Engine.GetModelValue( layerIndexModel )
			local selectedLayerIconID = Engine.GetSelectedLayerIconID( controller, index )
			if selectedLayerIconID == CoD.emblem.INVALID_ID then
				return true
			else
				return false
			end
		end
	else
		return true
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

function IsSelectedColorEmpty( element, controller )
	local colorNum = CoD.GetEditorProperties( controller, "colorNum" )
	local isColor0NoColor = CoD.GetEditorProperties( controller, "isColor0NoColor" )
	local isColor1NoColor = CoD.GetEditorProperties( controller, "isColor1NoColor" )
	if colorNum == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_0 and isColor0NoColor == 1 then
		return true
	elseif colorNum == Enum.CustomizationColorNum.CUSTOMIZATION_COLOR_1 and isColor1NoColor == 1 then
		return true
	else
		return false
	end
end

function IsEmblemEditor( controller )
	local customizationType = CoD.GetCustomization( controller, "type" )
	return customizationType == Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM
end

function IsPaintshop( controller )
	local customizationType = CoD.GetCustomization( controller, "type" )
	local f422_local0
	if customizationType ~= Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT and customizationType ~= Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_TOP and customizationType ~= Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_RIGHT then
		f422_local0 = false
	else
		f422_local0 = true
	end
	return f422_local0
end

function IsArenaStarInvisible( element, controller, indexStr )
	local parent = element:getParent()
	if parent == nil then
		return false
	end
	local model = parent:getModel( controller, "levelStars" )
	local index = tonumber( indexStr )
	local f423_local0
	if model and Engine.GetModelValue( model ) >= index then
		f423_local0 = false
	else
		f423_local0 = true
	end
	return f423_local0
end

function IsArenaStarInactive( element, controller, indexStr )
	local parent = element:getParent()
	if parent == nil then
		return false
	end
	local levelModel = parent:getModel( controller, "levelStars" )
	local earnedModel = parent:getModel( controller, "earnedStars" )
	local index = tonumber( indexStr )
	local f424_local0 = levelModel
	local f424_local1 = earnedModel
	local f424_local2
	if index > Engine.GetModelValue( levelModel ) or Engine.GetModelValue( earnedModel ) >= index then
		f424_local2 = false
	else
		f424_local2 = f424_local1 and f424_local0 and true
	end
	return f424_local2
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

function IsParamModelEqualTo( model, expressionArg )
	return model and Engine.GetModelValue( model ) == expressionArg
end

function IsParamModelEqualToString( model, stringArg )
	return model and Engine.GetModelValue( model ) == stringArg
end

function IsModelParameterValueEnum( model, enumValue )
	return model and Engine.GetModelValue( model ) == enumValue
end

function IsModelValueNil( controller, modelArg )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelArg )
	return model == nil
end

function IsModelValueNonEmptyString( controller, modelArg )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelArg )
	local f430_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f430_local1 = f430_local0 and modelValue
	local f430_local2
	if f430_local1 == nil or f430_local1 == "" then
		f430_local2 = false
	else
		f430_local2 = true
	end
	return f430_local2
end

function IsModelValueTrue( controller, modelArg )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelArg )
	local f431_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f431_local1 = f431_local0 and modelValue
	local f431_local2
	if f431_local1 == nil or f431_local1 ~= true then
		f431_local2 = false
	else
		f431_local2 = true
	end
	return f431_local2
end

function IsModelValueGreaterThan( controller, modelArg, expressionArg )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelArg )
	local f432_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f432_local1 = f432_local0 and modelValue
	local f432_local2
	if f432_local1 == nil or expressionArg >= f432_local1 then
		f432_local2 = false
	else
		f432_local2 = true
	end
	return f432_local2
end

function IsModelValueLessThan( controller, modelArg, expressionArg )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelArg )
	local f433_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f433_local1 = f433_local0 and modelValue
	local f433_local2
	if f433_local1 == nil or f433_local1 >= expressionArg then
		f433_local2 = false
	else
		f433_local2 = true
	end
	return f433_local2
end

function IsModelValueGreaterThanOrEqualTo( controller, modelArg, expressionArg )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelArg )
	local f434_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f434_local1 = f434_local0 and modelValue
	local f434_local2
	if f434_local1 == nil or expressionArg > f434_local1 then
		f434_local2 = false
	else
		f434_local2 = true
	end
	return f434_local2
end

function IsModelValueLessThanOrEqualTo( controller, modelArg, expressionArg )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelArg )
	local f435_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f435_local1 = f435_local0 and modelValue
	local f435_local2
	if f435_local1 == nil or f435_local1 > expressionArg then
		f435_local2 = false
	else
		f435_local2 = true
	end
	return f435_local2
end

function IsModelValueEqualTo( controller, modelArg, expressionArg )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelArg )
	local f436_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f436_local1 = f436_local0 and modelValue
	local f436_local2
	if f436_local1 == nil or f436_local1 ~= expressionArg then
		f436_local2 = false
	else
		f436_local2 = true
	end
	return f436_local2
end

function IsModelValueEqualToEnum( controller, modelArg, enumValue )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelArg )
	local f437_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f437_local1 = f437_local0 and modelValue
	local f437_local2
	if f437_local1 == nil or f437_local1 ~= enumValue then
		f437_local2 = false
	else
		f437_local2 = true
	end
	return f437_local2
end

function IsModelValueEnumBitSet( controller, modelArg, enumValue )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelArg )
	local f438_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f438_local1 = f438_local0 and modelValue
	local f438_local2
	if f438_local1 ~= nil then
		f438_local2 = CoD.BitUtility.IsBitSet( f438_local1, enumValue )
	else
		f438_local2 = false
	end
	return f438_local2
end

function ModelValueStartsWith( controller, modelArg, stringArg )
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelArg )
	local f439_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f439_local1 = f439_local0 and modelValue
	local f439_local2
	if f439_local1 ~= nil then
		f439_local2 = LUI.startswith( f439_local1, stringArg )
	else
		f439_local2 = false
	end
	return f439_local2
end

function IsControllerModelValueEqualToSelfModelValue( element, controller, modelArgController, modelArgSelf )
	local elementModel = element:getModel()
	if not elementModel then
		return false
	else
		local perControllerModel = Engine.GetModel( Engine.GetModelForController( controller ), modelArgController )
		if not perControllerModel then
			return false
		else
			local selfModel = Engine.GetModel( element:getModel(), modelArgSelf )
			if not selfModel then
				return false
			else
				local perControllerModelValue = Engine.GetModelValue( perControllerModel )
				local selfModelValue = Engine.GetModelValue( selfModel )
				return perControllerModelValue == selfModelValue
			end
		end
	end
end

function IsGlobalModelValueEqualToSelfModelValue( element, controller, modelArgGlobal, modelArgSelf )
	local elementModel = element:getModel()
	if not elementModel then
		return false
	else
		local globalModel = Engine.GetModel( Engine.GetGlobalModel(), modelArgGlobal )
		if not globalModel then
			return false
		else
			local selfModel = Engine.GetModel( element:getModel(), modelArgSelf )
			if not selfModel then
				return false
			else
				local globalModelValue = Engine.GetModelValue( globalModel )
				local selfModelValue = Engine.GetModelValue( selfModel )
				return globalModelValue == selfModelValue
			end
		end
	end
end

function IsSelfModelValueNil( element, controller, modelArg )
	local model = element:getModel()
	if modelArg ~= "" and model then
		model = Engine.GetModel( model, modelArg )
	end
	return model == nil
end

function IsSelfModelValueNilOrZero( element, controller, modelArg )
	local model = element:getModel()
	if modelArg ~= "" and model then
		model = Engine.GetModel( model, modelArg )
	end
	local f443_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f443_local1
	if model ~= nil and (f443_local0 and modelValue) ~= 0 then
		f443_local1 = false
	else
		f443_local1 = true
	end
	return f443_local1
end

function IsSelfModelValueNonEmptyString( element, controller, modelArg )
	local model = element:getModel()
	if modelArg ~= "" and model then
		model = Engine.GetModel( model, modelArg )
	end
	local f444_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f444_local1 = f444_local0 and modelValue
	local f444_local2
	if f444_local1 == nil or f444_local1 == "" then
		f444_local2 = false
	else
		f444_local2 = true
	end
	return f444_local2
end

function IsSelfModelValueTrue( element, controller, modelArg )
	local model = element:getModel()
	if modelArg ~= "" and model then
		model = Engine.GetModel( model, modelArg )
	end
	local f445_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f445_local1 = f445_local0 and modelValue
	local f445_local2
	if f445_local1 == nil or f445_local1 ~= true then
		f445_local2 = false
	else
		f445_local2 = true
	end
	return f445_local2
end

function IsSelfEnumModelValueTrue( element, controller, enumValue )
	local model = element:getModel()
	if enumValue ~= "" and model then
		model = Engine.GetModel( model, enumValue )
	end
	local f446_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f446_local1 = f446_local0 and modelValue
	local f446_local2
	if f446_local1 == nil or f446_local1 ~= true then
		f446_local2 = false
	else
		f446_local2 = true
	end
	return f446_local2
end

function IsSelfModelValueGreaterThan( element, controller, modelArg, expressionArg )
	local model = element:getModel()
	if modelArg ~= "" and model then
		model = Engine.GetModel( model, modelArg )
	end
	local f447_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f447_local1 = f447_local0 and modelValue
	local f447_local2
	if f447_local1 == nil or expressionArg >= f447_local1 then
		f447_local2 = false
	else
		f447_local2 = true
	end
	return f447_local2
end

function IsSelfModelValueLessThan( element, controller, modelArg, expressionArg )
	local model = element:getModel()
	if modelArg ~= "" and model then
		model = Engine.GetModel( model, modelArg )
	end
	local f448_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f448_local1 = f448_local0 and modelValue
	local f448_local2
	if f448_local1 == nil or f448_local1 >= expressionArg then
		f448_local2 = false
	else
		f448_local2 = true
	end
	return f448_local2
end

function IsSelfModelValueGreaterThanOrEqualTo( element, controller, modelArg, expressionArg )
	local model = element:getModel()
	if modelArg ~= "" and model then
		model = Engine.GetModel( model, modelArg )
	end
	local f449_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f449_local1 = f449_local0 and modelValue
	local f449_local2
	if f449_local1 == nil or expressionArg > f449_local1 then
		f449_local2 = false
	else
		f449_local2 = true
	end
	return f449_local2
end

function IsSelfModelValueLessThanOrEqualTo( element, controller, modelArg, expressionArg )
	local model = element:getModel()
	if modelArg ~= "" and model then
		model = Engine.GetModel( model, modelArg )
	end
	local f450_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f450_local1 = f450_local0 and modelValue
	local f450_local2
	if f450_local1 == nil or f450_local1 > expressionArg then
		f450_local2 = false
	else
		f450_local2 = true
	end
	return f450_local2
end

function IsSelfModelValueEqualTo( element, controller, modelArg, expressionArg )
	local model = element:getModel()
	if modelArg ~= "" and model then
		model = Engine.GetModel( model, modelArg )
	end
	local f451_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f451_local1 = f451_local0 and modelValue
	local f451_local2
	if f451_local1 == nil or f451_local1 ~= expressionArg then
		f451_local2 = false
	else
		f451_local2 = true
	end
	return f451_local2
end

function IsSelfModelValueEqualToEnum( element, controller, modelArg, enumValue )
	local model = element:getModel()
	if modelArg ~= "" and model then
		model = Engine.GetModel( model, modelArg )
	end
	local f452_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f452_local1 = f452_local0 and modelValue
	local f452_local2
	if f452_local1 == nil or f452_local1 ~= enumValue then
		f452_local2 = false
	else
		f452_local2 = true
	end
	return f452_local2
end

function IsSelfModelValueEqualToEnumOrSelfModelNil( element, controller, modelArg, enumValue )
	if element:getModel() == nil then
		return true
	else
		return IsSelfModelValueEqualToEnum( element, controller, modelArg, enumValue )
	end
end

function IsGlobalModelValueNonEmptyString( element, controller, modelArg )
	local model = Engine.GetModel( Engine.GetGlobalModel(), modelArg )
	local f454_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f454_local1 = f454_local0 and modelValue
	local f454_local2
	if f454_local1 == nil or f454_local1 == "" then
		f454_local2 = false
	else
		f454_local2 = true
	end
	return f454_local2
end

function IsGlobalModelValueTrue( element, controller, modelArg )
	local model = Engine.GetModel( Engine.GetGlobalModel(), modelArg )
	local f455_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f455_local1 = f455_local0 and modelValue
	local f455_local2
	if f455_local1 == nil or f455_local1 ~= true then
		f455_local2 = false
	else
		f455_local2 = true
	end
	return f455_local2
end

function IsGlobalModelValueEqualTo( element, controller, modelArg, expressionArg )
	local model = Engine.GetModel( Engine.GetGlobalModel(), modelArg )
	local f456_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f456_local1 = f456_local0 and modelValue
	local f456_local2
	if f456_local1 == nil or f456_local1 ~= expressionArg then
		f456_local2 = false
	else
		f456_local2 = true
	end
	return f456_local2
end

function IsGlobalModelValueEqualToEnum( element, controller, modelArg, enumValue )
	local model = Engine.GetModel( Engine.GetGlobalModel(), modelArg )
	local f457_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f457_local1 = f457_local0 and modelValue
	local f457_local2
	if f457_local1 == nil or f457_local1 ~= enumValue then
		f457_local2 = false
	else
		f457_local2 = true
	end
	return f457_local2
end

function IsGlobalModelValueGreaterThan( controller, modelArg, expressionArg )
	local model = Engine.GetModel( Engine.GetGlobalModel(), modelArg )
	local f458_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f458_local1 = f458_local0 and modelValue
	local f458_local2
	if f458_local1 == nil or expressionArg >= tonumber( f458_local1 ) then
		f458_local2 = false
	else
		f458_local2 = true
	end
	return f458_local2
end

function IsSelfModelValueEnumBitSet( element, controller, modelArg, enumValue )
	local model = element:getModel()
	if modelArg ~= "" and model then
		model = Engine.GetModel( model, modelArg )
	end
	local f459_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f459_local1 = f459_local0 and modelValue
	local f459_local2
	if f459_local1 ~= nil then
		f459_local2 = CoD.BitUtility.IsBitSet( f459_local1, enumValue )
	else
		f459_local2 = false
	end
	return f459_local2
end

function IsSelfModelValueMyXuid( element, controller, modelArg )
	local model = element:getModel()
	if model then
		model = Engine.GetModel( model, modelArg )
	end
	local f460_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f460_local1 = f460_local0 and modelValue
	local f460_local2
	if f460_local1 == nil or f460_local1 ~= Engine.GetXUID64( controller ) then
		f460_local2 = false
	else
		f460_local2 = true
	end
	return f460_local2
end

function IsPrimaryButton( event )
	local f461_local0
	if event.button == "primary" then
		f461_local0 = event.down
	else
		f461_local0 = false
	end
	return f461_local0
end

function IsDpadButton( model )
	local f462_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f462_local1 = f462_local0 and modelValue
	local f462_local2
	if f462_local1 ~= nil then
		f462_local2 = CoD.BitUtility.IsBitwiseAndNonZero( f462_local1, Enum.LUIButtonFlags.FLAG_DPAD )
	else
		f462_local2 = true
	end
	return f462_local2
end

function IsRepeatButtonPress( model )
	local f463_local0 = model
	local modelValue = Engine.GetModelValue( model )
	local f463_local1 = f463_local0 and modelValue
	local f463_local2
	if f463_local1 ~= nil then
		f463_local2 = CoD.BitUtility.IsBitwiseAndNonZero( f463_local1, Enum.LUIButtonFlags.FLAG_ISREPEAT )
	else
		f463_local2 = false
	end
	return f463_local2
end

function IsPartyLeaderStatusVisible()
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	if lobbyNav then
		local menu = LobbyData:UITargetFromId( lobbyNav )
		if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN and menu.id == LobbyData.UITargets.UI_MODESELECT.id then
			return false
		elseif menu.isAdvertised then
			return false
		else
			return true
		end
	else
		return false
	end
end

function IsLobbyStatusVisible()
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	if lobbyNav then
		local menu = LobbyData:UITargetFromId( lobbyNav )
		if menu.isAdvertised then
			return true
		end
	end
	return false
end

function IsPartyPrivacyVisible()
	if Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LAN then
		return false
	else
		local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
		local lobbyNav = Engine.GetModelValue( lobbyNavModel )
		if lobbyNav then
			local menu = LobbyData:UITargetFromId( lobbyNav )
			if menu.isAdvertised == true then
				return false
			else
				return true
			end
		else
			return false
		end
	end
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

function IsUploadClipButtonDisabled()
	local isClipPlaying = Engine.IsDemoClipPlaying()
	local isClipRecording = Engine.IsDemoClipRecording()
	local segmentCount = Engine.GetDemoSegmentCount()
	local isRepositioningCameraMarker = Engine.IsRepositioningCameraMarker()
	if isClipPlaying or isClipRecording or segmentCount <= 0 or isRepositioningCameraMarker then
		return true
	else
		return false
	end
end

function IsManageSegmentsButtonDisabled()
	local isClipPlaying = Engine.IsDemoClipPlaying()
	local isClipRecording = Engine.IsDemoClipRecording()
	local segmentCount = Engine.GetDemoSegmentCount()
	local isRepositioningCameraMarker = Engine.IsRepositioningCameraMarker()
	if isClipPlaying or isClipRecording or segmentCount <= 0 or isRepositioningCameraMarker then
		return true
	else
		return false
	end
end

function IsCustomizeHighlightReelButtonDisabled()
	local isClipRecording = Engine.IsDemoClipRecording()
	local isRepositioningCameraMarker = Engine.IsRepositioningCameraMarker()
	local isGameHost = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local isInLobby = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	if isClipRecording or isRepositioningCameraMarker or not isGameHost or not isInLobby then
		return true
	else
		return false
	end
end

function IsJumpToStartButtonDisabled()
	local isClipRecording = Engine.IsDemoClipRecording()
	local isRepositioningCameraMarker = Engine.IsRepositioningCameraMarker()
	local isGameHost = Engine.IsLobbyHost( Enum.LobbyType.LOBBY_TYPE_GAME )
	local isInLobby = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	if isClipRecording or isRepositioningCameraMarker or not isGameHost or not isInLobby then
		return true
	else
		return false
	end
end

function IsDemoPlaying()
	return Engine.IsDemoPlaying()
end

function IsDollyCameraPictureWindowVisible( controller )
	if not Engine.IsDemoPlaying() then
		return false
	elseif Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_DEMO_ALL_GAME_HUD_HIDDEN ) then
		return false
	elseif not Engine.IsDemoCameraEditMode() then
		return false
	elseif Engine.GetDollyCamMarkerCount() <= 0 then
		return false
	elseif Engine.IsDemoClipPreviewRunning() then
		return false
	else
		return true
	end
end

function IsSegmentInSelectedState( element, controller )
	local selectedSegmentModel = GetSelectedSegmentModel()
	if selectedSegmentModel and selectedSegmentModel == element:getModel() then
		local model = Engine.GetModel( selectedSegmentModel, "selected" )
		if model then
			local isSelected = Engine.GetModelValue( model )
			return isSelected
		end
	end
	return false
end

function IsSegmentSelectedForMove( element, controller )
	return GetSelectedSegmentModel() ~= nil
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

function VehicleHasEnemyLock( element, controller )
	local f486_local0 = IsSelfEnumModelValueTrue( element, controller, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_UP )
	if not f486_local0 then
		f486_local0 = IsSelfEnumModelValueTrue( element, controller, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_DOWN )
		if not f486_local0 then
			f486_local0 = IsSelfEnumModelValueTrue( element, controller, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_LEFT )
			if not f486_local0 then
				f486_local0 = IsSelfEnumModelValueTrue( element, controller, Enum.MissileLockedOnDirection.MISSILE_LOCKED_ON_DIRECTION_RIGHT )
			end
		end
	end
	return f486_local0
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
	end
	local lobbyNavModel = Engine.CreateModel( Engine.GetGlobalModel(), "lobbyRoot.lobbyNav" )
	local lobbyNav = Engine.GetModelValue( lobbyNavModel )
	if lobbyNav then
		local menu = LobbyData:UITargetFromId( lobbyNav )
		if menu.lobbyType ~= Enum.LobbyType.LOBBY_TYPE_GAME then
			return false
		end
	end
	local currentState = Engine.GetModelValue( mapVoteModel )
	return tonumber( state ) == currentState
end

function MapVoteTimerActive()
	local timerActiveModel = Engine.GetModel( Engine.GetGlobalModel(), "MapVote.timerActive" )
	if timerActiveModel == nil then
		return false
	end
	local currentMenuId = LobbyData.GetLobbyNav()
	local menu = LobbyData:UITargetFromId( currentMenuId )
	if menu.lobbyTimerType == LuaEnums.TIMER_TYPE.TESTING then
		return false
	end
	local active = Engine.GetModelValue( timerActiveModel )
	local f490_local0
	if active == nil or active == 0 then
		f490_local0 = false
	else
		f490_local0 = true
	end
	return f490_local0
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
	local f493_local0 = CoD.useController
	if f493_local0 then
		f493_local0 = Engine.LastInput_Gamepad()
	end
	return f493_local0
end

function AutomaticallyOpenAAR( controller )
	local stats = CoD.GetPlayerStats( controller )
	local value = stats.AfterActionReportStats.lobbyPopup:get()
	if value == "summary" then
		return true
	else
		
	end
end

function IsAARValid( controller )
	if Engine.IsMultiplayerGame() then
		if CoD.AARUtility.UseTestData() then
			return true
		else
			local f495_local0 = CoD.GetPlayerStats( controller )
			if f495_local0.AfterActionReportStats.lobbyPopup:get() == "summary" then
				return true
			else
				local aarTypeModel = Engine.GetModel( Engine.GetModelForController( controller ), "aarType" )
				if aarTypeModel then
					local aarType = Engine.GetModelValue( aarTypeModel )
					local f495_local1
					if (not IsLAN() or aarType ~= "lan") and (IsLAN() or aarType ~= "custom" and aarType ~= "public") then
						f495_local1 = false
					else
						f495_local1 = true
					end
					return f495_local1
				else
					
				end
			end
		end
	else
		return true
	end
end

function CanShowAAR( controller )
	local isMultiplayer = Engine.IsMultiplayerGame()
	local isZombies = Engine.IsZombiesGame()
	if not isMultiplayer then
		local f496_local0 = isZombies
	end
	local f496_local1 = CoD.AARUtility.UseTestData()
	if not f496_local1 then
		f496_local1 = f496_local0 and Engine.IsStableStatsBufferInitialized( controller )
	end
	return f496_local1
end

function HasFriends( controller )
	local numFriends = Engine.GetFriendsCount( controller, Enum.PresenceFilter.PRESENCE_FILTER_ALL )
	return numFriends > 0
end

function HasRecentPlayers( controller )
	local numFriends = Engine.GetRecentPlayersCount( controller, Enum.PresenceFilter.PRESENCE_FILTER_ALL )
	return numFriends > 0
end

function IsSocialPlayersListEmpty( controller )
	local socialRootModel = Engine.CreateModel( Engine.GetGlobalModel(), "socialRoot" )
	local tabModel = Engine.CreateModel( socialRootModel, "tab" )
	local selectedTab = Engine.GetModelValue( tabModel )
	if selectedTab ~= nil then
		if selectedTab == "friends" then
			return HasFriends( controller )
		elseif selectedTab == "recent" then
			return HasRecentPlayers( controller )
		end
	end
	return false
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

function IsSocialPartyLeader( self, controller )
	local isPartyLeaderModel = self:getModel( controller, "leader" )
	local f503_local0 = isPartyLeaderModel
	local isPartyLeader = Engine.GetModelValue( isPartyLeaderModel )
	if (f503_local0 and isPartyLeader) == 1 then
		return true
	else
		return false
	end
end

function HideWinnersLabelsAndInfo( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local isRoundEndModel = Engine.GetModel( perControllerModel, "gameScore.isRoundEnd" )
	local isDrawModel = Engine.GetModel( perControllerModel, "gameScore.draw" )
	local f504_local0 = Engine.GetGametypeSetting( "teamCount" ) < 2
	local f504_local1 = isRoundEndModel
	local isRoundEnd = Engine.GetModelValue( isRoundEndModel )
	local f504_local2 = f504_local1 and isRoundEnd
	local f504_local3 = isDrawModel
	local isDrawModel = Engine.GetModelValue( isDrawModel )
	if f504_local2 or (f504_local3 and isDrawModel) or f504_local0 then
		return true
	else
		
	end
end

function IsOutcomeVictory( controller )
	local isRoundEndModel = Engine.GetModel( perControllerModel, "gameScore.isRoundEnd" )
	local f505_local0 = isRoundEndModel
	local isRoundEnd = Engine.GetModelValue( isRoundEndModel )
	local f505_local1 = f505_local0 and isRoundEnd
	local victoryModel = Engine.GetModel( perControllerModel, "gameScore.victory" )
	local f505_local2 = victoryModel
	local victory = Engine.GetModelValue( victoryModel )
	local f505_local3 = f505_local2 and victory
	local f505_local4
	if not f505_local1 then
		f505_local4 = f505_local3
	else
		f505_local4 = false
	end
	return f505_local4
end

function IsOutcomeDefeat( controller )
	local isRoundEndModel = Engine.GetModel( perControllerModel, "gameScore.isRoundEnd" )
	local f506_local0 = isRoundEndModel
	local isRoundEnd = Engine.GetModelValue( isRoundEndModel )
	local f506_local1 = f506_local0 and isRoundEnd
	local defeatModel = Engine.GetModel( perControllerModel, "gameScore.defeat" )
	local f506_local2 = defeatModel
	local defeat = Engine.GetModelValue( defeatModel )
	local f506_local3 = f506_local2 and defeat
	local f506_local4
	if not f506_local1 then
		f506_local4 = f506_local3
	else
		f506_local4 = false
	end
	return f506_local4
end

function IsScoreboardPingAsBars( element, controller )
	return Dvar.cg_ScoresPing_Interval:get() > 1
end

function ScoreboardVisible( controller )
	local f508_local0 = Engine.IsVisibilityBitSet( controller, Enum.UIVisibilityBit.BIT_SCOREBOARD_OPEN )
	if not f508_local0 then
		f508_local0 = IsModelValueEqualTo( controller, "forceScoreboard", 1 )
	end
	return f508_local0
end

function ScoreboardMuteButtonPromptHidden( controller )
	if not ScoreboardVisible( controller ) then
		return true
	elseif CoD.IsShoutcaster( controller ) then
		return true
	else
		local scoreboardButtonPromptVisibleModel = Engine.GetModel( Engine.GetModelForController( controller ), "scoreboardInfo.muteButtonPromptVisible" )
		if scoreboardButtonPromptVisibleModel and not Engine.GetModelValue( scoreboardButtonPromptVisibleModel ) then
			return true
		else
			
		end
	end
end

function IsScoreboardPlayerSelf( element, controller )
	local model = element:getModel( controller, "clientNum" )
	if model then
		if CoD.IsShoutcaster( controller ) then
			local myClientNum = Engine.GetPredictedClientNum( controller )
			return myClientNum == Engine.GetModelValue( model )
		else
			return string.gsub( GetScoreboardPlayerName( controller, Engine.GetModelValue( model ) ), "%[.+%]", "" ) == Engine.GetSelfGamertag( controller )
		end
	else
		return false
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
	local f511_local0 = isRoundEndModel
	local isRoundEnd = Engine.GetModelValue( isRoundEndModel )
	local f511_local1
	if (f511_local0 and isRoundEnd) or matchBonus == 0 then
		f511_local1 = false
	else
		f511_local1 = true
	end
	return f511_local1
end

function IsVictory( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local isRoundEndModel = Engine.GetModel( perControllerModel, "gameScore.isRoundEnd" )
	local f512_local0 = isRoundEndModel
	local isRoundEnd = Engine.GetModelValue( isRoundEndModel )
	local f512_local1 = f512_local0 and isRoundEnd
	local victoryModel = Engine.GetModel( perControllerModel, "gameScore.victory" )
	local f512_local2 = victoryModel
	local isVictory = Engine.GetModelValue( victoryModel )
	local f512_local3 = f512_local2 and isVictory
	local f512_local4
	if not f512_local1 then
		f512_local4 = f512_local3
	else
		f512_local4 = false
	end
	return f512_local4
end

function IsDefeat( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local isRoundEndModel = Engine.GetModel( perControllerModel, "gameScore.isRoundEnd" )
	local f513_local0 = isRoundEndModel
	local isRoundEnd = Engine.GetModelValue( isRoundEndModel )
	local f513_local1 = f513_local0 and isRoundEnd
	local defeatModel = Engine.GetModel( perControllerModel, "gameScore.defeat" )
	local f513_local2 = defeatModel
	local isDefeat = Engine.GetModelValue( defeatModel )
	local f513_local3 = f513_local2 and isDefeat
	local f513_local4
	if not f513_local1 then
		f513_local4 = f513_local3
	else
		f513_local4 = false
	end
	return f513_local4
end

function IsStarterPack( controller )
	local f514_local0 = CoD.isPC
	if f514_local0 then
		f514_local0 = Engine.IsStarterPack()
	end
	return f514_local0
end

function IsFreeRunPreStart( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local freeRunModel = Engine.GetModel( perControllerModel, "FreeRun" )
	local stateModel = Engine.GetModel( freeRunModel, "runState" )
	local isPreMatch = false
	if Engine.GetModelValue( stateModel ) == 0 then
		isPreMatch = true
	end
	return isPreMatch
end

function IsFreeRunPreStarted( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local freeRunModel = Engine.GetModel( perControllerModel, "FreeRun" )
	local stateModel = Engine.GetModel( freeRunModel, "runState" )
	local isStarted = false
	if Engine.GetModelValue( stateModel ) == 1 then
		isStarted = true
	end
	return isStarted
end

function IsFreeRunFinished( controller )
	local perControllerModel = Engine.GetModelForController( controller )
	local freeRunModel = Engine.GetModel( perControllerModel, "FreeRun" )
	local stateModel = Engine.GetModel( freeRunModel, "runState" )
	local isFinished = false
	if Engine.GetModelValue( stateModel ) == 2 then
		isFinished = true
	end
	return isFinished
end

function ShouldShowPartyPrivacy( controller )
	local currentMenuIdx = Engine.GetLobbyUIScreen()
	local currTarget = LobbyData:UITargetFromId( currentMenuIdx )
	local gameActive = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local partyLobby = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if gameActive and currTarget.lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
		partyLobby = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if not Engine.IsLobbyHost( partyLobby ) then
		return false
	else
		return true
	end
end

function ShouldShowLeaveParty( controller )
	local currentMenuIdx = Engine.GetLobbyUIScreen()
	local currTarget = LobbyData:UITargetFromId( currentMenuIdx )
	local gameActive = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local partyLobby = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if gameActive and currTarget.lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
		partyLobby = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	local partyList = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, partyLobby )
	if #partyList.sessionClients == 1 then
		return false
	end
	local localPlayerCount = 0
	for index, client in ipairs( partyList.sessionClients ) do
		if client.isLocal == true then
			localPlayerCount = localPlayerCount + 1
		end
	end
	if localPlayerCount == #partyList.sessionClients then
		return false
	end
	return true
end

function ShouldShowPromotePlayer( controller )
	local currentMenuIdx = Engine.GetLobbyUIScreen()
	local currTarget = LobbyData:UITargetFromId( currentMenuIdx )
	local gameActive = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local partyLobby = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if gameActive and currTarget.lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
		partyLobby = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if not Engine.IsLobbyHost( partyLobby ) then
		return false
	end
	local partyList = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, partyLobby )
	if #partyList.sessionClients == 1 then
		return false
	end
	local localPlayerCount = 0
	for index, client in ipairs( partyList.sessionClients ) do
		if client.isLocal == true then
			localPlayerCount = localPlayerCount + 1
		end
	end
	if localPlayerCount == #partyList.sessionClients then
		return false
	end
	return true
end

function ShouldShowBootPlayer( controller )
	local currentMenuIdx = Engine.GetLobbyUIScreen()
	local currTarget = LobbyData:UITargetFromId( currentMenuIdx )
	local gameActive = Engine.IsLobbyActive( Enum.LobbyType.LOBBY_TYPE_GAME )
	local partyLobby = Enum.LobbyType.LOBBY_TYPE_PRIVATE
	if gameActive and currTarget.lobbyMode == Enum.LobbyMode.LOBBY_MODE_CUSTOM then
		partyLobby = Enum.LobbyType.LOBBY_TYPE_GAME
	end
	if not Engine.IsLobbyHost( partyLobby ) then
		return false
	end
	local partyList = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_HOST, partyLobby )
	if #partyList.sessionClients == 1 then
		return false
	end
	local localPlayerCount = 0
	for index, client in ipairs( partyList.sessionClients ) do
		if client.isLocal == true then
			localPlayerCount = localPlayerCount + 1
		end
	end
	if localPlayerCount == #partyList.sessionClients then
		return false
	end
	return true
end

function IsBleedOutVisible( element, controller )
	local stateFlagModel = element:getModel( controller, "stateFlags" )
	if stateFlagModel then
		local stateFlags = Engine.GetModelValue( stateFlagModel )
		if stateFlags ~= nil then
			return CoD.BitUtility.IsAnyBitSet( stateFlags, {
				Enum.BleedOutStateFlags.BLEEDOUT_STATE_FLAG_BLEEDING_OUT,
				Enum.BleedOutStateFlags.BLEEDOUT_STATE_FLAG_BEING_REVIVED
			} )
		end
	end
	return false
end

function DropDownListIsInUse( element )
	return element.inUse
end

function CheckBoxOptionChecked( element, event )
	local controller = nil
	if event.menu then
		controller = event.menu.m_ownerController
	else
		controller = event.controller
	end
	local model = element:getModel()
	if model then
		local optionInfo = CoD.PCUtil.GetOptionInfo( model, controller )
		if type( optionInfo.currentValue ) == "number" then
			return math.abs( optionInfo.currentValue - optionInfo.highValue ) < 0.01
		elseif type( optionInfo.currentValue ) == "string" then
			return optionInfo.currentValue == optionInfo.highValue
		end
	end
	return false
end

function MouseButtonEnabled( element )
	return element.handleMouseButton ~= false
end

function DropdownListIsInUse_Console( element )
	return element.inUse
end

function ShouldShowMOTD( controller )
	return Engine.ShouldShowMOTD( controller )
end

function ShouldShowMtxCommsMOTD( controller )
	if Dvar.ui_execdemo_beta:get() then
		return 
	else
		local data = Engine.GetMarketingMessage( controller, "motd" )
		if data ~= nil then
			return true
		else
			return false
		end
	end
end

function ShouldShowMtxCommsMOTDPopup( controller )
	if Dvar.ui_execdemo_beta:get() and IsFirstTimeSetup( controller, Enum.eModes.MODE_MULTIPLAYER ) then
		return false
	else
		local data = Engine.GetMarketingMessage( controller, "motd" )
		if data ~= nil and data.messageViewReported ~= true then
			return true
		else
			return false
		end
	end
end

function FeaturedWidgetVisible( controller )
	local f530_local0 = IsMainModeInvalidAndNotTheaterMode()
	if f530_local0 then
		if not IsLAN() then
			f530_local0 = not ShouldShowMtxCommsMOTD( controller )
		else
			f530_local0 = false
		end
	end
	return f530_local0
end

function FeaturedWidgetControllerVisible( controller )
	local cardsData = Engine.GetFeaturedCardsData()
	if cardsData and cardsData.validCardsCount >= 2 then
		return true
	else
		return false
	end
end

function IsBubbleGumBuffEquipped( menu, element, controller )
	local elementModel = element:getModel()
	if not elementModel then
		return false
	end
	local indexModel = Engine.GetModel( elementModel, "itemIndex" )
	if not indexModel then
		return false
	end
	local itemIndex = Engine.GetModelValue( indexModel )
	local bgbPackIndex = Engine.GetEquippedBubbleGumPack( controller )
	for bgbIndex = 0, CoD.BubbleGumBuffs.NumBuffsPerPack - 1, 1 do
		if Engine.GetBubbleGumBuff( controller, bgbPackIndex, bgbIndex ) == itemIndex then
			return true
		end
	end
	return false
end

function HasBGBTokensRemaining( element, controller )
	if Engine.GetBGBTokensRemaining( controller ) > 0 == false then
		return false
	else
		local machinePriceModel = element:getModel( controller, "price" )
		local machinePrice = Engine.GetModelValue( machinePriceModel )
		return machinePrice <= Engine.GetBGBTokensRemaining( controller )
	end
end

function HasStoreItems( controller )
	local products = Engine.GetStoreProductsByCategory( controller, "BETA" )
	return #products > 0
end

function IsDemoBuild()
	return Dvar.ui_execdemo:get()
end

function IsDemoBuildCP()
	return Dvar.ui_execdemo_cp:get()
end

function IsDemoBuildBeta()
	return Dvar.ui_execdemo_beta:get()
end

function DisableStore()
	local f538_local0
	if Dvar.ui_execdemo_beta:get() and Dvar.live_store_enable:exists() then
		f538_local0 = not Dvar.live_store_enable:get()
	else
		f538_local0 = true
	end
	return f538_local0
end

function ShouldOpenGraphicsAndSoundOptions()
	if IsDurango() then
		return true
	else
		local f539_local0
		if Dvar.ui_execdemo:get() then
			f539_local0 = Dvar.ui_execdemo:get()
			if f539_local0 then
				f539_local0 = Dvar.ui_execdemo_beta:get()
			end
		else
			f539_local0 = true
		end
	end
	return f539_local0
end

function ShouldOpenSocialOptions()
	if IsDurango() then
		return true
	else
		return not Dvar.ui_execdemo:get()
	end
end

function ShouldOpenMutingOptions()
	return not Dvar.ui_execdemo_gamescom:get()
end

function IsGamesComBuild()
	return LuaUtils.IsGamescomBuild()
end

function IsBetaBuild()
	return LuaUtils.IsBetaBuild()
end

function ShouldOpenNetworkOptions()
	return true
end

function IsBlackhatHacking( controller )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "hudItems.blackhat.status" ) ) == CoD.BlackhatStatus.Hacking
end

function IsBlackhatBreaching( controller )
	return Engine.GetModelValue( Engine.CreateModel( Engine.GetModelForController( controller ), "hudItems.blackhat.status" ) ) == CoD.BlackhatStatus.Breaching
end

function IsBrightnessSliderPipEmpty( element )
	local elementsIndex = element.gridInfoTable.zeroBasedIndex
	local currentlyFocusedElement = element.gridInfoTable.parentGrid.activeWidget
	local currentlyFocusedElementIndex = 0
	if currentlyFocusedElement then
		currentlyFocusedElementIndex = currentlyFocusedElement.gridInfoTable.zeroBasedIndex
	end
	if currentlyFocusedElementIndex < elementsIndex then
		return true
	else
		
	end
end

function IsAlertOverlay( self, controller )
	local typeModel = self:getModel( controller, "categoryType" )
	if typeModel then
		local type = Engine.GetModelValue( typeModel )
		local f548_local0
		if type ~= CoD.OverlayUtility.OverlayTypes.Alert and type ~= CoD.OverlayUtility.OverlayTypes.Error then
			f548_local0 = false
		else
			f548_local0 = true
		end
		return f548_local0
	else
		return false
	end
end

function HasOverlayBackAction( menu )
	return menu[CoD.OverlayUtility.GoBackPropertyName] ~= nil
end

function IsPrimaryControllerIndex( controller )
	if Engine.GetPrimaryController() == controller then
		return true
	else
		return false
	end
end

function IsTriggersFlipped( controller )
	return Engine.GetProfileVarInt( controller, "flipped_control_config" ) == 1
end

function IsCodCasterQuickSettingEnabled( menu, element, controller )
	if not element.profileVar then
		return false
	else
		return CoD.ShoutcasterProfileVarBool( controller, element.profileVar )
	end
end

function IsCodCaster( controller )
	if CoD.IsShoutcaster( controller ) then
		return true
	else
		return false
	end
end

function IsCodCasterProfileValueEqualTo( controller, profileVarName, expressionArg )
	local profileVarValue = CoD.ShoutcasterProfileVarValue( controller, profileVarName )
	local f554_local0
	if profileVarValue == nil or profileVarValue ~= expressionArg then
		f554_local0 = false
	else
		f554_local0 = true
	end
	return f554_local0
end

function ShouldPresentRegistration( controller )
	if Engine.ShouldPresentRegistration then
		if Engine.ShouldPresentRegistration( controller ) then
			local status = Engine.GetRegistrationStatus( controller )
			local data = Engine.GetMarketingMessage( controller, "registration" )
			if data == nil or data.messageViewReported == true then
				return false
			else
				local action = data.action
				if action == "registration" and status == Enum.AccountRegistrationStatus.ACCOUNT_REGISTRATION_NEW_USER then
					return true
				elseif action == "opt-in" and status == Enum.AccountRegistrationStatus.ACCOUNT_REGISTRATION_OPTED_OUT then
					return true
				else
					return false
				end
			end
		else
			return false
		end
	else
		return false
	end
end

function ShouldPresentMOTDBanner( controller, overlay )
	if ShouldShowMtxCommsMOTDPopup( controller ) then
		local data = Engine.GetMarketingMessage( controller, "motd" )
		if data == nil or not data.hasBanner then
			return false
		else
			return true
		end
	else
		return false
	end
end

function FuseBoxVisible( controller, fuseStr )
	if CoD.Zombie[fuseStr] then
		local modelPath = "zmInventory." .. CoD.Zombie.ZOD_CRAFTABLE_POLICE_BOX .. "_" .. CoD.Zombie[fuseStr]
		local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
		return model and Engine.GetModelValue( model ) == 1
	else
		
	end
end

function RocketShieldBlueprintPieceVisible( controller, pieceStr )
	if CoD.Zombie[pieceStr] then
		local modelPath = "zmInventory." .. CoD.Zombie[pieceStr]
		local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
		return model and Engine.GetModelValue( model ) == 1
	else
		
	end
end

function IDGunBlueprintPieceVisible( controller, pieceStr )
	if CoD.Zombie[pieceStr] then
		local modelPath = "zmInventory." .. CoD.Zombie.ZOD_CRAFTABLE_IDGUN .. "_" .. CoD.Zombie[pieceStr]
		local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
		return model and Engine.GetModelValue( model ) == 1
	else
		
	end
end

function SummonningKeyVisible( controller )
	local modelPath = "zmInventory." .. CoD.Zombie.CLIENTFIELD_ZOD_CRAFTABLE_PIECE_QUEST_KEY
	local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
	return model and Engine.GetModelValue( model ) == 1
end

function IsRitualItemInState( controller, characterName, stateName )
	if CoD.Zombie[characterName] and CoD.Zombie[stateName] then
		local modelPath = "zmInventory." .. CoD.Zombie.CLIENTFIELD_QUEST_STATE_BASE .. CoD.Zombie[characterName]
		local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
		return model and Engine.GetModelValue( model ) == CoD.Zombie[stateName]
	else
		
	end
end

function IsRitualItemHeldBy( controller, ritualItemCharacter, characterEnum )
	if CoD.Zombie[ritualItemCharacter] and CoD.Zombie[characterEnum] then
		local modelPath = "zmInventory." .. CoD.Zombie.CLIENTFIELD_HOLDER_OF_BASE .. CoD.Zombie[ritualItemCharacter]
		local model = Engine.GetModel( Engine.GetModelForController( controller ), modelPath )
		return model and Engine.GetModelValue( model ) == CoD.Zombie[characterEnum]
	else
		
	end
end

function ChatClientIsChatting( controller )
	return Engine.ChatClient_IsChatting( controller )
end

function ChatClientIsAvailable( self, element, controller )
	local f564_local0 = ChatClientEnabled( controller )
	if f564_local0 then
		f564_local0 = Engine.ChatClient_IsAvailable( controller )
	end
	return f564_local0
end

function ChatClientEnabled( controller )
	local f565_local0 = CoD.isPC
	if f565_local0 then
		f565_local0 = Dvar.ui_execdemo_gamescom:get() == false
	end
	return f565_local0
end

function CharacterCustomization_IsEnabled( controller )
	if LuaUtils.IsGamescomBuild() or Dvar.ui_execdemo_beta:get() then
		return false
	else
		return true
	end
end

function IsArabicSku()
	return false
end

function IsChineseSku()
	return false
end

function IsJapaneseSku()
	return false
end

function IsCurrentLanguageEnglish()
	return true
end

function ShouldDisplayLanguageSelectionScreen()
	local f571_local0 = IsArabicSku()
	if not f571_local0 then
		f571_local0 = IsChineseSku()
		if not f571_local0 then
			f571_local0 = IsJapaneseSku()
		end
	end
	return f571_local0
end

function IsFeaturedCardButtonPressed( event )
	local f572_local0
	if event.button == "alt1" then
		f572_local0 = event.down
	else
		f572_local0 = false
	end
	return f572_local0
end

function FeaturedCards_IsEnabled( element, controller )
	if LuaUtils.IsGamescomBuild() then
		return false
	else
		local rootModel = Engine.CreateModel( Engine.GetGlobalModel(), "FeaturedCardsRoot", true )
		local myModel = Engine.CreateModel( rootModel, "Enabled", true )
		local v = Engine.GetModelValue( myModel )
		local cardsData = Engine.GetFeaturedCardsData()
		if Dvar.live_featuredEnabled:get() == false or cardsData.enabled == false then
			return false
		else
			return true
		end
	end
end

function FeaturedCards_Update( element, controller )
	return true
end

function ConnectionMeter_isEnabled( element, controller )
	if Dvar.ui_enableConnectionMetricGraphs:get() == 0 then
		return false
	else
		return true
	end
end

