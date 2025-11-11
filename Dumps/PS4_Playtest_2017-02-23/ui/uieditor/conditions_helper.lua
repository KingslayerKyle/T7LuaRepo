function GetMemberStatusFromElement( element, controller )
	local memberStatusModel = element:getModel( controller, "memberStatus" )
	local memberStatus = Engine.GetModelValue( memberStatusModel )
	return memberStatus
end

function GetMemberStatusFromModel( parentModel )
	local memberStatusModel = Engine.GetModel( parentModel, "memberStatus" )
	local memberStatus = Engine.GetModelValue( memberStatusModel )
	return memberStatus
end

function GetUpgradableItemRef( menu, element, controller )
	local itemIndexModel = Engine.GetModel( element:getModel(), "itemIndex" )
	if itemIndexModel and Engine.GetModelValue( itemIndexModel ) ~= 0 then
		local itemRef = Engine.GetModelValue( Engine.GetModel( element:getModel(), "ref" ) )
		local weaponSlot = Engine.GetModelValue( Engine.GetModel( element:getModel(), "weaponSlot" ) )
		if LUI.startswith( weaponSlot, "cybercom_tacrig" ) or LUI.startswith( weaponSlot, "cybercom_ability" ) then
			return itemRef
		end
	end
end

function IsCACItemLockedHelper( menu, element, controller )
	local classModel = CoD.perController[controller].classModel
	local weaponCategory = CoD.perController[controller].weaponCategory
	local itemIndexModel = nil
	local itemIndex = element.itemIndex
	local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
	if not itemIndex then
		itemIndexModel = element:getModel( controller, "itemIndex" )
		if itemIndexModel then
			itemIndex = Engine.GetModelValue( itemIndexModel )
		end
	end
	if itemIndex then
		if not weaponCategory then
			weaponCategory = Engine.GetLoadoutSlotForItem( itemIndex, mode )
		end
		if classModel and weaponCategory and (LUI.startswith( weaponCategory, "primaryattachment" ) or LUI.startswith( weaponCategory, "secondaryattachment" )) then
			local slotName = "primary"
			if LUI.startswith( weaponCategory, "secondaryattachment" ) then
				slotName = "secondary"
			end
			local weaponIndexModel = Engine.GetModel( classModel, slotName .. ".itemIndex" )
			if weaponIndexModel then
				local weaponIndex = Engine.GetModelValue( weaponIndexModel )
				return Engine.IsItemAttachmentLocked( controller, weaponIndex, itemIndex, mode )
			end
		end
		return Engine.IsItemLocked( controller, itemIndex, mode )
	else
		return false
	end
end

function GetWeaponSlotModel( menu, element, controller, classModel )
	if not controller or not classModel then
		return nil
	else
		local weaponSlotModel = element:getModel( controller, "weaponSlot" )
		if not weaponSlotModel then
			return element.weaponSlot
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

function IsTakeTwoGadgetAttachmentForSlot( classModel, customModel, slotName )
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

function WeaponAttributeCompare( attributeValues )
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

function IsWeaponLevelMax( weaponIndex, controller, mode )
	local gunCurrentRank = Engine.GetGunCurrentRank( controller, weaponIndex, mode )
	local gunNextRank = Engine.GetGunNextRank( controller, weaponIndex, mode )
	local currentWeaponXPReq = Engine.GetGunCurrentRankXP( controller, weaponIndex, mode )
	local currentWeaponXP = CoD.CACUtility.GetCurrentWeaponXP( controller, weaponIndex, mode )
	local f8_local0 = gunCurrentRank
	local f8_local1 = gunNextRank
	local f8_local2 = currentWeaponXPReq
	local f8_local3 = currentWeaponXP
	local f8_local4
	if gunCurrentRank ~= gunNextRank or currentWeaponXPReq > currentWeaponXP then
		f8_local4 = false
	else
		f8_local4 = f8_local3 and f8_local2 and f8_local1 and f8_local0 and true
	end
	return f8_local4
end

function IsACVItemNewHelper( controller, weaponIndex, attachmentIndex, variantIndex, mode )
	return Engine.IsACVItemNew( controller, weaponIndex, attachmentIndex, variantIndex, mode )
end

function GetNumberOfAttachmentsForSlot( slotName, controller )
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

function SearchForTakeTwoGadgetMod( classModel, possibleSlots )
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

function IsFilmReadyForPlayback()
	local lobbyType = Engine.LobbyGetControllingLobbySession( Enum.LobbyModule.LOBBY_MODULE_CLIENT )
	local info = Engine.LobbyGetDemoInformation( Enum.LobbyModule.LOBBY_MODULE_CLIENT, lobbyType )
	if info and info.readyForPlayback then
		return true
	else
		return false
	end
end

function GetDemoContextMode()
	local contextModeModel = Engine.GetModel( Engine.GetGlobalModel(), "demo.contextMode" )
	if contextModeModel then
		return Engine.GetModelValue( contextModeModel )
	else
		return Enum.demoContextMode.DEMO_CONTEXT_MODE_PLAYBACK
	end
end

function CheckMemento( controller, ritualItemCharacter )
	local checkModelPath = "zmInventory." .. CoD.Zombie.CLIENTFIELD_CHECK_BASE .. ritualItemCharacter .. CoD.Zombie.MEMENTO_SUFFIX
	local checkModel = Engine.GetModel( Engine.GetModelForController( controller ), checkModelPath )
	return checkModel and Engine.GetModelValue( checkModel ) == 1
end

function ShowPurchasableMap( controller, id )
	local dlcBit = Engine.GetDLCBitForMapName( id )
	if not CoD.BaseUtility.IsKnownDLC( dlcBit ) then
		return false
	elseif not IsGameModeInstalled( controller, Engine.CurrentSessionMode() ) then
		return false
	else
		return Engine.GetLobbyNetworkMode() == Enum.LobbyNetworkMode.LOBBY_NETWORKMODE_LIVE
	end
end

function IsObjectiveVisibleForMyTeam( controller, objId )
	local clientNum = Engine.GetPredictedClientNum( controller )
	local visibleTeams = Engine.GetObjectiveVisibleTeams( controller, objId )
	local myTeam = Engine.GetTeamID( controller, clientNum )
	if not CoD.BitUtility.IsBitwiseAndNonZero( visibleTeams, 1 << myTeam ) then
		return false
	else
		return true
	end
end

