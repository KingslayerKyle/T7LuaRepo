CoD.BlackMarketUtility = {}
CoD.BlackMarketUtility.DropTypes = {
	COMMON = Enum.LootCrateType.LOOT_CRATE_TYPE_COMMON,
	RARE = Enum.LootCrateType.LOOT_CRATE_TYPE_RARE,
	BRIBE = Enum.LootCrateType.LOOT_CRATE_TYPE_BRIBE,
	LEGENDARY = 3,
	EPIC = 4
}
CoD.BlackMarketUtility.CrateTypeStrings = {
	[CoD.BlackMarketUtility.DropTypes.COMMON] = "MPUI_BM_COMMON",
	[CoD.BlackMarketUtility.DropTypes.RARE] = "MPUI_BM_RARE",
	[CoD.BlackMarketUtility.DropTypes.BRIBE] = "MPUI_BM_BRIBE",
	[CoD.BlackMarketUtility.DropTypes.LEGENDARY] = "MPUI_BM_LEGENDARY",
	[CoD.BlackMarketUtility.DropTypes.EPIC] = "MPUI_BM_EPIC"
}
CoD.BlackMarketUtility.CrateTypeSupplyDropStrings = {
	[CoD.BlackMarketUtility.DropTypes.COMMON] = "MPUI_BM_COMMON_DROP",
	[CoD.BlackMarketUtility.DropTypes.RARE] = "MPUI_BM_RARE_DROP",
	[CoD.BlackMarketUtility.DropTypes.BRIBE] = "MPUI_BM_BRIBE_DROP"
}
CoD.BlackMarketUtility.CrateTypeIds = {
	[CoD.BlackMarketUtility.DropTypes.COMMON] = "common",
	[CoD.BlackMarketUtility.DropTypes.RARE] = "rare",
	[CoD.BlackMarketUtility.DropTypes.BRIBE] = "bribe",
	[CoD.BlackMarketUtility.DropTypes.LEGENDARY] = "legendary",
	[CoD.BlackMarketUtility.DropTypes.EPIC] = "epic"
}
CoD.BlackMarketUtility.CrateTypeRevealAlias = {
	[CoD.BlackMarketUtility.DropTypes.RARE] = "uin_bm_cycle_item_rare_layer",
	[CoD.BlackMarketUtility.DropTypes.BRIBE] = "uin_bm_cycle_item_legend_layer"
}
CoD.BlackMarketUtility.BribeStrings = {
	[3] = "MPUI_BM_BRIBE_OUTFIT",
	[4] = "MPUI_BM_BRIBE_CALLINGCARD",
	[5] = "MPUI_BM_BRIBE_DECAL_MATERIAL_EMBLEM",
	[6] = "MPUI_BM_BRIBE_TAUNTS_GESTURES"
}
CoD.BlackMarketUtility.BribeDescriptions = {
	[3] = "MPUI_BM_BRIBE_OUTFIT_DESC",
	[4] = "MPUI_BM_BRIBE_CALLINGCARD_DESC",
	[5] = "MPUI_BM_BRIBE_DECAL_MATERIAL_EMBLEM_DESC",
	[6] = "MPUI_BM_BRIBE_TAUNTS_GESTURES_DESC"
}
CoD.BlackMarketUtility.BribeTitles = {
	[3] = "MPUI_BM_BRIBE_OUTFIT_PROMO_TITLE",
	[4] = "MPUI_BM_BRIBE_CALLINGCARD",
	[5] = "MPUI_BM_BRIBE_DECAL_MATERIAL_EMBLEM",
	[6] = "MPUI_BM_BRIBE_TAUNTS_GESTURES"
}
CoD.BlackMarketUtility.BribeHints = {
	[3] = "MPUI_BM_BRIBE_OUTFIT_HINT",
	[4] = "MPUI_BM_BRIBE_CALLINGCARD_HINT",
	[5] = "MPUI_BM_BRIBE_DECAL_MATERIAL_EMBLEM_HINT",
	[6] = "MPUI_BM_BRIBE_TAUNTS_GESTURES_HINT"
}
CoD.BlackMarketUtility.BribeImages = {
	[3] = "uie_t7_blackmarket_crate_bribe_chip",
	[4] = "uie_t7_blackmarket_crate_bribe_chip",
	[5] = "uie_t7_blackmarket_crate_bribe_chip",
	[6] = "uie_t7_blackmarket_crate_bribe_chip"
}
CoD.BlackMarketUtility.BundleString = "MPUI_BM_BUNDLE_SUPPLY_DROP"
CoD.BlackMarketUtility.BundleDescription = "MPUI_BM_BUNDLE_DESC"
CoD.BlackMarketUtility.BundleTitle = "MPUI_BM_BUNDLE_PROMO_TITLE"
CoD.BlackMarketUtility.BundleHints = "MPUI_BM_BUNDLE_HINT"
CoD.BlackMarketUtility.BundleImages = "uie_t7_blackmarket_crate_bundle"
CoD.BlackMarketUtility.CategoryStrings = {
	attachment_variant = "",
	calling_card = "MENU_CALLING_CARD",
	camo = "",
	decal = "MPUI_DECAL",
	emblem = "MENU_EMBLEM_UPPER",
	gesture = "",
	material = "MPUI_BM_LOOT_MATERIAL",
	paintjob = "MENU_PAINTJOB",
	specialist_outfit = "MENU_SPECIALIST_OUTFIT",
	taunt = "",
	melee_weapon = "MPUI_BM_MELEE_WEAPON_CAPS",
	weapon = "MENU_WEAPON_CAPS",
	reticle = "MPUI_RETICLE_CAPS"
}
CoD.BlackMarketUtility.GestureImages = {
	t7_loot_gesture_boast_ = "t7_icon_blackmarket_boast",
	t7_loot_gesture_threaten_ = "t7_icon_blackmarket_threaten",
	t7_loot_gesture_goodgame_ = "t7_icon_blackmarket_goodgame"
}
CoD.BlackMarketUtility.XPPerCryptoKey = 100
CoD.BlackMarketUtility.crateTable = "gamedata/loot/loot_crate.csv"
CoD.BlackMarketUtility.lootEmblemTableName = "gamedata/loot/mplootemblems.csv"
CoD.BlackMarketUtility.lootTableName = "gamedata/loot/mplootitems.csv"
CoD.BlackMarketUtility.emblemMaterialsTableName = "gamedata/emblems/emblemMaterials.csv"
CoD.BlackMarketUtility.emblemIconsTableName = "gamedata/emblems/emblemIcons.csv"
CoD.BlackMarketUtility.backgroundsTable = "gamedata/emblems/backgrounds.csv"
CoD.BlackMarketUtility.unreleasedLootTableName = "gamedata/loot/mpUnreleasedLoot.csv"
CoD.BlackMarketUtility.parsedEmblemDDLs = {}
CoD.BlackMarketUtility.CallingCardsTable = {}
CoD.BlackMarketUtility.CommonCallingCardsTable = {}
CoD.BlackMarketUtility.WeaponsWithNoBMCamos = {
	launcher_standard_df = true,
	bowie_knife = true,
	melee_knuckles = true,
	melee_butterfly = true,
	melee_wrench = true,
	pistol_shotgun = true,
	melee_crowbar = true,
	melee_sword = true,
	ar_garand = true,
	special_crossbow = true
}
CoD.BlackMarketUtility.GetCurrentBribeString = function ()
	local bribeId = Dvar.loot_bribeCrate_dwid:get()
	return CoD.BlackMarketUtility.BribeStrings[bribeId]
end

CoD.BlackMarketUtility.GetCurrentBribeImage = function ()
	local bribeId = Dvar.loot_bribeCrate_dwid:get()
	return CoD.BlackMarketUtility.BribeImages[bribeId]
end

CoD.BlackMarketUtility.GetCurrentBribeTitle = function ()
	local bribeId = Dvar.loot_bribeCrate_dwid:get()
	return CoD.BlackMarketUtility.BribeTitles[bribeId]
end

CoD.BlackMarketUtility.GetCurrentBribeDescription = function ()
	local bribeId = Dvar.loot_bribeCrate_dwid:get()
	return CoD.BlackMarketUtility.BribeDescriptions[bribeId]
end

CoD.BlackMarketUtility.GetCrateTypeString = function ( type )
	if type == CoD.BlackMarketUtility.DropTypes.BRIBE then
		return CoD.BlackMarketUtility.GetCurrentBribeString()
	else
		return CoD.BlackMarketUtility.CrateTypeStrings[type]
	end
end

CoD.BlackMarketUtility.GetCrateTypeImage = function ( type )
	if type == CoD.BlackMarketUtility.DropTypes.BRIBE then
		return CoD.BlackMarketUtility.GetCurrentBribeImage()
	elseif type == CoD.BlackMarketUtility.DropTypes.RARE then
		return "uie_t7_blackmarket_crate_rare_focus"
	else
		return "uie_t7_blackmarket_crate_common_focus"
	end
end

CoD.BlackMarketUtility.BurnReturnXP = function ( rarity )
	if rarity == Enum.LootRarityType.LOOT_RARITY_TYPE_COMMON then
		if Dvar.loot_burnCommonRefund:exists() then
			return Dvar.loot_burnCommonRefund:get() * 100
		else
			return 100
		end
	elseif rarity == Enum.LootRarityType.LOOT_RARITY_TYPE_RARE then
		if Dvar.loot_burnRareRefund:exists() then
			return Dvar.loot_burnRareRefund:get() * 100
		else
			return 300
		end
	elseif rarity == Enum.LootRarityType.LOOT_RARITY_TYPE_LEGENDARY then
		if Dvar.loot_burnLegendaryRefund:exists() then
			return Dvar.loot_burnLegendaryRefund:get() * 100
		else
			return 700
		end
	elseif rarity == Enum.LootRarityType.LOOT_RARITY_TYPE_EPIC then
		if Dvar.loot_burnEpicRefund:exists() then
			return Dvar.loot_burnEpicRefund:get() * 100
		else
			return 1000
		end
	else
		
	end
end

CoD.BlackMarketUtility.GetRarityIDForString = function ( rarityString )
	for id, val in pairs( CoD.BlackMarketUtility.CrateTypeIds ) do
		if val == rarityString then
			return id
		end
	end
	return CoD.BlackMarketUtility.DropTypes.COMMON
end

CoD.BlackMarketUtility.ConvertToLootDecalIndex = function ( id )
	local tokenIndex = 0
	for token in string.gmatch( id, "[^%s_]+" ) do
		tokenIndex = tokenIndex + 1
		if tokenIndex == 1 and token ~= "decal" then
			break
		elseif tokenIndex == 2 then
			return token
		end
	end
	local imageCol = 3
	local indexCol = 1
	local lookupResult = Engine.TableLookup( CoD.emblemIconsTable, indexCol, imageCol, id )
	if lookupResult and lookupResult ~= "" then
		return lookupResult
	end
	return nil
end

CoD.BlackMarketUtility.ConvertToLootDecalIndexIfDecal = function ( id )
	return CoD.BlackMarketUtility.ConvertToLootDecalIndex( id ) or id
end

CoD.BlackMarketUtility.SplitIdIntoTwoValues = function ( id )
	local value1 = nil
	for token in string.gmatch( id, "[^%s;]+" ) do
		if value1 == nil then
			value1 = token
		end
		return value1, token
	end
	if value1 ~= nil then
		return value1, ""
	end
	return "", ""
end

CoD.BlackMarketUtility.SplitAttachmentVariantID = function ( id )
	local tokenIndex = 0
	local attachmentRef = ""
	local weaponRef = ""
	for token in string.gmatch( id, "[^%s_]+" ) do
		tokenIndex = tokenIndex + 1
		if tokenIndex == 1 then
			if token ~= "acv" then
				return "", ""
			end
		end
		if tokenIndex == 2 then
			attachmentRef = token
		end
		if weaponRef == "" then
			weaponRef = token
		else
			weaponRef = weaponRef .. "_" .. token
		end
	end
	return attachmentRef, weaponRef
end

CoD.BlackMarketUtility.GetSpecialistThemeType = function ( id )
	if string.find( id, "body" ) then
		return Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY
	else
		return Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET
	end
end

CoD.BlackMarketUtility.GetItemTypeStringForLootItem = function ( id, category )
	if category == "camo" then
		local _, weaponRef = CoD.BlackMarketUtility.SplitIdIntoTwoValues( id )
		local weaponName = CoD.CACUtility.GetNameForItemRefString( weaponRef )
		return Engine.Localize( "MPUI_BM_WEAPON_CAMO", weaponName )
	elseif category == "attachment_variant" then
		local attachmentRef, weaponRef = CoD.BlackMarketUtility.SplitAttachmentVariantID( id )
		local weaponName = CoD.CACUtility.GetNameForItemRefString( weaponRef )
		local attachmentName = Engine.TableLookup( CoD.attachmentTable, 3, 4, attachmentRef )
		return Engine.Localize( "MPUI_BM_WEAPON_ATTACHMENT_VARIANT", weaponName, attachmentName )
	elseif category == "gesture" then
		local gestureId, weaponRef = CoD.BlackMarketUtility.SplitIdIntoTwoValues( id )
		local heroName, _ = CoD.PlayerRoleUtility.GetHeroDisplayNameAndIndex( Enum.eModes.MODE_MULTIPLAYER, weaponRef )
		local gestureTypeName = CoD.PlayerRoleUtility.GetTypeNameForGesture( Enum.eModes.MODE_MULTIPLAYER, weaponRef, gestureId )
		return Engine.Localize( "MPUI_BM_HERO_AND_GESTURE_TYPE", heroName, gestureTypeName )
	elseif category == "taunt" then
		local heroName, weaponRef = CoD.PlayerRoleUtility.GetHeroDisplayNameAndIndexForTaunt( Enum.eModes.MODE_MULTIPLAYER, id )
		return Engine.Localize( "MPUI_BM_HERO_TAUNT", heroName )
	elseif category == "specialist_outfit" then
		local outfitId, weaponRef = CoD.BlackMarketUtility.SplitIdIntoTwoValues( id )
		local heroThemeString = "MENU_SPECIALIST_HEAD_THEME"
		if CoD.BlackMarketUtility.GetSpecialistThemeType( outfitId ) == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
			heroThemeString = "MENU_SPECIALIST_BODY_THEME"
		end
		return Engine.Localize( heroThemeString, CoD.BlackMarketUtility.GetHeroDisplayNameForAssetName( weaponRef ) )
	elseif category == "reticle" then
		local f14_local0, weaponRef, f14_local1 = string.gmatch( id, "[^%s_]+" )
		local token = f14_local0( weaponRef, f14_local1 )
		if token ~= nil then
			f14_local1 = token
			if Engine.LocalizeRefExists( "MPUI_" .. token .. "_CAPS" ) then
				return Engine.Localize( "MPUI_BM_RETICLE", Engine.Localize( "MPUI_" .. token .. "_CAPS" ) )
			else
				return CoD.BlackMarketUtility.CategoryStrings[category]
			end
		end
	end
	return CoD.BlackMarketUtility.CategoryStrings[category]
end

CoD.BlackMarketUtility.GetImageForLootItem = function ( id, category )
	if category == "camo" then
		local camoId, weaponRef = CoD.BlackMarketUtility.SplitIdIntoTwoValues( id )
		return CoD.CACUtility.GetImageForItemRefString( weaponRef ) .. "_" .. camoId
	elseif category == "emblem" then
		return "blacktransparent"
	elseif category == "attachment_variant" then
		return Engine.GetAttachmentCosmeticVariantImage( id, 0 ) or "cac_mods_ar_standard_high_caliber_02_sm"
	elseif category == "material" then
		return id
	elseif category == "gesture" then
		for substring, image in pairs( CoD.BlackMarketUtility.GestureImages ) do
			if LUI.startswith( id, substring ) then
				return image
			end
		end
	elseif category == "taunt" then
		return "t7_icon_blackmarket_taunt"
	elseif category == "specialist_outfit" then
		local outfitId, weaponRef = CoD.BlackMarketUtility.SplitIdIntoTwoValues( id )
		return CoD.BlackMarketUtility.GetSpecialistOutfitFieldForId( outfitId, weaponRef, "icon" )
	elseif category == "weapon" or category == "melee_weapon" then
		local suffix = "_" .. CoD.gameMode:lower()
		return Engine.GetHudIconForWeapon( id .. suffix, Enum.eModes.MODE_MULTIPLAYER )
	end
	return id
end

CoD.BlackMarketUtility.GetStringRefForLootItem = function ( controller, id, category )
	if category == "camo" then
		local camoRef, _ = CoD.BlackMarketUtility.SplitIdIntoTwoValues( id )
		return Engine.TableLookup( CoD.attachmentTable, 3, 4, camoRef )
	elseif category == "emblem" then
		local controller, _, storageFileType = CoD.BlackMarketUtility.GetLootEmblemIndexParams( controller, id )
		CoD.CraftUtility.Emblems.ParseDDL( controller, storageFileType )
		CoD.BlackMarketUtility.parsedEmblemDDLs[storageFileType] = true
		local emblem = CoD.CraftUtility.Emblems.CachedEmblems[_ + 1]
		if emblem ~= nil then
			return emblem.emblemName
		else
			return id
		end
	elseif category == "calling_card" then
		local descriptionCol = 4
		local imageCol = 3
		return Engine.TableLookup( CoD.backgroundsTable, descriptionCol, imageCol, id ) or ""
	elseif category == "decal" then
		local decalIndex = CoD.BlackMarketUtility.ConvertToLootDecalIndexIfDecal( id )
		if decalIndex == id then
			return ""
		else
			return GetEmblemDecalDesc( decalIndex )
		end
	elseif category == "attachment_variant" then
		return Engine.GetAttachmentCosmeticVariantName( id, 0 ) or "High Caliber 1"
	elseif category == "material" then
		local imageCol = 3
		local textCol = 4
		return Engine.TableLookup( CoD.BlackMarketUtility.emblemMaterialsTableName, textCol, imageCol, id ) or ""
	elseif category == "gesture" then
		local gestureId, _ = CoD.BlackMarketUtility.SplitIdIntoTwoValues( id )
		return CoD.PlayerRoleUtility.GetDisplayNameForGesture( Enum.eModes.MODE_MULTIPLAYER, _, gestureId )
	elseif category == "taunt" then
		return CoD.PlayerRoleUtility.GetDisplayNameForTaunt( Enum.eModes.MODE_MULTIPLAYER, id )
	elseif category == "specialist_outfit" then
		local outfitId, _ = CoD.BlackMarketUtility.SplitIdIntoTwoValues( id )
		return CoD.BlackMarketUtility.GetSpecialistOutfitFieldForId( outfitId, _, "name" )
	elseif category == "weapon" or category == "melee_weapon" then
		return CoD.CACUtility.GetNameForItemRefString( id )
	elseif category == "reticle" then
		return "MPUI_RETICLE_" .. id
	else
		return id
	end
end

CoD.BlackMarketUtility.GetSpecialistOutfitFieldForId = function ( id, heroId, field )
	local mode = Enum.eModes.MODE_MULTIPLAYER
	local heroList = Engine.GetHeroList( mode )
	for _, hero in ipairs( heroList ) do
		if hero.assetName == heroId then
			for type = 0, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_COUNT - 1, 1 do
				for itemIndex = 0, 256, 1 do
					local heroInfo = Engine.GetHeroItemInfo( mode, hero.bodyIndex, type, itemIndex )
					if not heroInfo then
						
					end
					if heroInfo.assetName ~= nil and heroInfo.assetName == id then
						return heroInfo[field]
					end
				end
			end
		end
	end
	return ""
end

CoD.BlackMarketUtility.GetSpecialistOutfitIndexForId = function ( id, heroId )
	local mode = Enum.eModes.MODE_MULTIPLAYER
	local heroList = Engine.GetHeroList( mode )
	for _, hero in ipairs( heroList ) do
		if hero.assetName == heroId then
			for type = 0, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_COUNT - 1, 1 do
				for itemIndex = 0, 256, 1 do
					local heroInfo = Engine.GetHeroItemInfo( mode, hero.bodyIndex, type, itemIndex )
					if not heroInfo then
						
					end
					if heroInfo.assetName ~= nil and heroInfo.assetName == id then
						return itemIndex
					end
				end
			end
		end
	end
	return ""
end

CoD.BlackMarketUtility.GetCallingCardSetName = function ( id )
	local itemNameColumn = 0
	local setColumn = 4
	return Engine.TableLookup( CoD.BlackMarketUtility.lootTableName, setColumn, itemNameColumn, id )
end

CoD.BlackMarketUtility.GetNumOwnedAndTotalForCallingCardSet = function ( controller, setName )
	local setColumn = 4
	local idColumn = 0
	local lootRows = Engine.TableFindRows( CoD.BlackMarketUtility.lootTableName, setColumn, setName )
	local numItemsUnlocked = 0
	local numNewItems = 0
	if not lootRows then
		return 0, 0, 0
	end
	for i = 1, #lootRows, 1 do
		local callingCardName = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, lootRows[i], idColumn )
		if not CoD.BlackMarketUtility.IsItemLocked( controller, callingCardName ) then
			numItemsUnlocked = numItemsUnlocked + 1
			local backgroundsTableId = CoD.BlackMarketUtility.GetLootCallingCardIndex( controller, callingCardName )
			if backgroundsTableId and Engine.IsEmblemBackgroundNew( controller, backgroundsTableId ) then
				numNewItems = numNewItems + 1
			end
		end
	end
	return numItemsUnlocked, #lootRows, numNewItems
end

CoD.BlackMarketUtility.GetSetNumOwnedAndTotalForCallingCard = function ( controller, id )
	local setName = CoD.BlackMarketUtility.GetCallingCardSetName( id )
	if setName == nil or setName == "" then
		return 0, 0, 0
	else
		return CoD.BlackMarketUtility.GetNumOwnedAndTotalForCallingCardSet( controller, setName )
	end
end

CoD.BlackMarketUtility.GetRewardAndCategoryForItem = function ( id )
	local itemNameColumn = 0
	local categoryColumn = 2
	local prereqColumn = 5
	local rewardRows = Engine.TableFindRows( CoD.BlackMarketUtility.lootTableName, prereqColumn, id )
	if rewardRows ~= nil then
		local itemId = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, rewardRows[1], itemNameColumn )
		local category = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, rewardRows[1], categoryColumn )
		return itemId, category
	else
		return nil, nil
	end
end

CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem = function ( id )
	local itemNameColumn = 0
	local f23_local0
	if id == nil or id ~= Engine.TableLookup( CoD.BlackMarketUtility.unreleasedLootTableName, itemNameColumn, itemNameColumn, id ) then
		f23_local0 = false
	else
		f23_local0 = true
	end
	return f23_local0
end

CoD.BlackMarketUtility.IsBlackMarketItem = function ( id )
	local itemNameColumn = 0
	return id == Engine.TableLookup( CoD.BlackMarketUtility.lootTableName, itemNameColumn, itemNameColumn, id )
end

CoD.BlackMarketUtility.IsReleasedBlackMarketItem = function ( id )
	local f25_local0
	if id ~= nil then
		f25_local0 = CoD.BlackMarketUtility.IsBlackMarketItem( id )
		if f25_local0 then
			f25_local0 = not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( id )
		end
	else
		f25_local0 = false
	end
	return f25_local0
end

CoD.BlackMarketUtility.ShowToastIfApplicable = function ( controller, id, category, index )
	if LUI.DEV and Dvar.ui_forcetoast and Dvar.ui_forcetoast:exists() and tonumber( Dvar.ui_forcetoast:get() ) == 1 then
		if index == 2 then
			CoD.OverlayUtility.ShowToast( "LootBonusCallingCard", Engine.Localize( "MPUI_BM_BONUS_CALLING_CARD_SET_MASTER" ), Engine.Localize( "MPUI_BM_BONUS_CALLING_CARD_SET_MASTER_DESC", "Aliens" ), "t7_callingcard_mp_darkops_chainkiller" )
		elseif index == 3 then
			CoD.OverlayUtility.ShowToast( "LootBonusDecal", "MONSTER DECAL", Engine.Localize( "MPUI_BM_BONUS_DECAL_DESC", "True Monster" ), nil, nil, 2 )
		end
		return 
	end
	local itemQuantity = CoD.BlackMarketUtility.GetItemQuantity( controller, id )
	if itemQuantity == nil or itemQuantity > 1 then
		return 
	elseif category == "emblem" then
		local rewardId, rewardCategory = CoD.BlackMarketUtility.GetRewardAndCategoryForItem( id )
		if rewardId then
			local kickerText = CoD.BlackMarketUtility.GetStringRefForLootItem( controller, rewardId, rewardCategory )
			local description = CoD.BlackMarketUtility.GetItemTypeStringForLootItem( rewardId, rewardCategory )
			local decalIndex = nil
			local image = rewardId
			if rewardCategory == "decal" then
				decalIndex = tonumber( CoD.BlackMarketUtility.ConvertToLootDecalIndexIfDecal( rewardId ) )
				image = nil
			end
			CoD.OverlayUtility.ShowToast( "LootBonusDecal", kickerText, Engine.Localize( description ), image, nil, decalIndex )
		end
	elseif category == "calling_card" then
		local numUnlocked, rewardCategory = CoD.BlackMarketUtility.GetSetNumOwnedAndTotalForCallingCard( controller, id )
		if rewardCategory > 0 and numUnlocked == rewardCategory then
			local setName = CoD.BlackMarketUtility.GetCallingCardSetName( id )
			local rewardId, rewardCategory = CoD.BlackMarketUtility.GetRewardAndCategoryForItem( setName )
			local kickerText = CoD.BlackMarketUtility.GetStringRefForLootItem( controller, rewardId, rewardCategory )
			local description = CoD.BlackMarketUtility.GetItemTypeStringForLootItem( rewardId, rewardCategory )
			CoD.OverlayUtility.ShowToast( "LootBonusCallingCard", Engine.Localize( kickerText ), Engine.Localize( description ), nil, nil, nil, rewardId )
		end
	end
end

CoD.BlackMarketUtility.GetSetPieceStringForLootItem = function ( controller, id, category )
	if category == "calling_card" then
		local numUnlocked, numRows = CoD.BlackMarketUtility.GetSetNumOwnedAndTotalForCallingCard( controller, id )
		if numRows > 0 then
			return Engine.Localize( "MPUI_BM_SET_PIECE_X_OF_Y", numUnlocked, numRows )
		end
	end
	return ""
end

CoD.BlackMarketUtility.GetSetPieceStringForLootSet = function ( controller, setName, category )
	if category == "calling_card" then
		local numUnlocked, numRows = CoD.BlackMarketUtility.GetNumOwnedAndTotalForCallingCardSet( controller, setName )
		if numRows > 0 then
			return Engine.Localize( "MPUI_BM_SET_X_OF_Y", numUnlocked, numRows )
		end
	end
	return ""
end

CoD.BlackMarketUtility.GetCurrentRank = function ( controller )
	local currentStats = Engine.GetPlayerStats( controller )
	return currentStats.PlayerStatsList.RANK.statValue:get()
end

CoD.BlackMarketUtility.GetItemLockedTextAndAvailability = function ( controller, id, category )
	if category == "camo" then
		local mode = Enum.eModes.MODE_MULTIPLAYER
		local rank = CoD.BlackMarketUtility.GetCurrentRank( controller )
		local _, weaponRef = CoD.BlackMarketUtility.SplitIdIntoTwoValues( id )
		local weaponItemIndex = Engine.GetItemIndexFromReference( weaponRef, mode )
		local unlockRank = Engine.GetItemUnlockLevel( weaponItemIndex, mode )
		if rank < unlockRank then
			local rankName = CoD.GetRankName( unlockRank, 0, mode )
			local rankNumber = "" .. unlockRank + 1
			return Engine.GetItemName( weaponItemIndex, mode ), Engine.Localize( "MENU_RANK_NAME_FULL", rankName, rankNumber )
		end
	elseif category == "attachment_variant" then
		local mode = Enum.eModes.MODE_MULTIPLAYER
		local attachmentRef, weaponRef = CoD.BlackMarketUtility.SplitAttachmentVariantID( id )
		local weaponItemIndex = Engine.GetItemIndexFromReference( weaponRef )
		local cacAttachmentIndex = Engine.TableLookup( CoD.attachmentTable, 0, 4, attachmentRef )
		local attachmentItemIndex = Engine.GetAttachmentIndexByAttachmentTableIndex( weaponItemIndex, cacAttachmentIndex, mode )
		local requiredGunRank = Engine.GetItemAttachmentRank( weaponItemIndex, attachmentItemIndex, mode )
		local gunCurrentRank = Engine.GetGunCurrentRank( controller, weaponItemIndex, mode )
		if Engine.IsItemAttachmentLocked( controller, weaponItemIndex, attachmentItemIndex, mode ) then
			local weaponName = Engine.GetItemName( weaponItemIndex, mode )
			local attachmentName = Engine.TableLookup( CoD.attachmentTable, 3, 4, attachmentRef )
			return Engine.Localize( attachmentName ), Engine.Localize( "MPUI_WEAPON_RANK", requiredGunRank + 2 )
		end
	elseif category == "taunt" or category == "gesture" or category == "specialist_outfit" then
		local heroIndex = 0
		local heroName = ""
		if category == "taunt" then
			heroName, heroIndex = CoD.PlayerRoleUtility.GetHeroDisplayNameAndIndexForTaunt( Enum.eModes.MODE_MULTIPLAYER, id )
		else
			local _, weaponRef = CoD.BlackMarketUtility.SplitIdIntoTwoValues( id )
			heroName, heroIndex = CoD.PlayerRoleUtility.GetHeroDisplayNameAndIndex( Enum.eModes.MODE_MULTIPLAYER, weaponRef )
		end
		local isLocked, weaponRef = CoD.PlayerRoleUtility.Heroes.GetHeroUnlockInfo( controller, heroIndex, Enum.eModes.MODE_MULTIPLAYER, "MENU_RANK_NAME_FULL" )
		if isLocked then
			return heroName, weaponRef
		end
	end
	return nil, nil
end

CoD.BlackMarketUtility.GetLootCallingCardIndex = function ( controller, id )
	local imageColumn = 3
	local indexColumn = 1
	local unlockedImageId = Engine.TableLookup( CoD.BlackMarketUtility.backgroundsTable, indexColumn, imageColumn, id )
	return tonumber( unlockedImageId )
end

CoD.BlackMarketUtility.GetLootEmblemIndexParams = function ( controller, id )
	local nameColumn = 0
	local itemIdColumn = 1
	local storageColumn = 2
	local lootRows = Engine.TableFindRows( CoD.BlackMarketUtility.lootEmblemTableName, nameColumn, id )
	if lootRows then
		local storageString = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootEmblemTableName, lootRows[1], storageColumn )
		local storageFileType = Enum.StorageFileType[storageString]
		local emblemId = tonumber( Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootEmblemTableName, lootRows[1], itemIdColumn ) )
		return controller, emblemId, storageFileType
	else
		return controller, 0, Enum.StorageFileType.STORAGE_DEFAULT_EMBLEMS
	end
end

CoD.BlackMarketUtility.GetLootEmblemIDName = function ( id )
	local nameColumn = 0
	local itemIdColumn = 1
	local storageColumn = 2
	local emblemName = Engine.TableLookup( CoD.BlackMarketUtility.lootEmblemTableName, nameColumn, itemIdColumn, id )
	return emblemName
end

CoD.BlackMarketUtility.GetLootDecalName = function ( controller, id )
	local iconIndexColumn = 1
	local imageColumn = 3
	local imageDecalName = Engine.TableLookup( CoD.BlackMarketUtility.emblemIconsTableName, imageColumn, iconIndexColumn, id )
	return imageDecalName
end

CoD.BlackMarketUtility.GetCallingCardTitleFromImage = function ( callingCardImage )
	local imageCol = 3
	local descCol = 4
	return Engine.TableLookup( CoD.BlackMarketUtility.backgroundsTable, descCol, imageCol, callingCardImage )
end

CoD.BlackMarketUtility.GetCallingCardSortKeyFromImage = function ( callingCardImage )
	local imageCol = 3
	local sortKeyCol = 2
	return Engine.TableLookup( CoD.BlackMarketUtility.backgroundsTable, sortKeyCol, imageCol, callingCardImage )
end

CoD.BlackMarketUtility.GetRarityForCallingCardSetFromSetName = function ( callingCardSetName )
	local setNameCol = 4
	local rarityCol = 3
	local rarityType = Engine.TableLookup( CoD.BlackMarketUtility.lootTableName, rarityCol, setNameCol, callingCardSetName )
	return CoD.BlackMarketUtility.CrateTypeStrings[CoD.BlackMarketUtility.GetRarityIDForString( rarityType )]
end

CoD.BlackMarketUtility.GetRarityTypeForLootItemFromName = function ( lootItemName )
	local nameCol = 0
	local rarityCol = 3
	local rarityType = Engine.TableLookup( CoD.BlackMarketUtility.lootTableName, rarityCol, nameCol, lootItemName )
	return rarityType
end

CoD.BlackMarketUtility.GetRarityForLootItemFromName = function ( lootItemName )
	local rarityType = CoD.BlackMarketUtility.GetRarityTypeForLootItemFromName( lootItemName )
	if rarityType == "" then
		return ""
	else
		return CoD.BlackMarketUtility.CrateTypeStrings[CoD.BlackMarketUtility.GetRarityIDForString( rarityType )]
	end
end

CoD.BlackMarketUtility.GetHeroDisplayNameForAssetName = function ( heroAssetName )
	local mode = Enum.eModes.MODE_MULTIPLAYER
	local heroList = Engine.GetHeroList( mode )
	for _, hero in ipairs( heroList ) do
		if hero.assetName == heroAssetName then
			return Engine.GetHeroName( mode, hero.bodyIndex )
		end
	end
	return heroAssetName
end

CoD.BlackMarketUtility.GetCrateDvarVal = function ( dropType, dvarPostfix )
	local dropName = Engine.TableLookup( CoD.BlackMarketUtility.crateTable, 1, 0, dropType )
	local dvarName = dropName .. dvarPostfix
	local val = Engine.GetDvarString( dvarName )
	return tonumber( val )
end

CoD.BlackMarketUtility.GetCrateCryptoKeyCost = function ( dropType )
	return CoD.BlackMarketUtility.GetCrateDvarVal( dropType, "_cryptoCost" )
end

CoD.BlackMarketUtility.GetCrateCryptoKeyDiscount = function ( dropType )
	return CoD.BlackMarketUtility.GetCrateDvarVal( dropType, "_cryptoDiscount" )
end

CoD.BlackMarketUtility.GetCryptoKeyCountPostMatch = function ( aarStats )
	local cryptoKeysBeforeMatch = aarStats.cryptoKeysBeforeMatch:get()
	local lootXPBeforeMatch = aarStats.lootXPBeforeMatch:get()
	local lootXPEarned = aarStats.lootXPEarned:get()
	return cryptoKeysBeforeMatch + math.floor( (lootXPBeforeMatch + lootXPEarned) / CoD.BlackMarketUtility.XPPerCryptoKey )
end

CoD.BlackMarketUtility.GetCrateCODPointCost = function ( dropType )
	if not AreCodPointsEnabled( 0 ) then
		return 0
	else
		return CoD.BlackMarketUtility.GetCrateDvarVal( dropType, "_cpCost" )
	end
end

CoD.BlackMarketUtility.GetCrateCODPointDiscount = function ( dropType )
	if not AreCodPointsEnabled( 0 ) then
		return 0
	else
		return CoD.BlackMarketUtility.GetCrateDvarVal( dropType, "_cpDiscount" )
	end
end

CoD.BlackMarketUtility.GetCurrentCryptoKeyCount = function ( controller )
	if LUI.DEV and Dvar.ui_cryptokeys:exists() then
		return tonumber( Dvar.ui_cryptokeys:get() )
	elseif not controller then
		controller = Engine.GetPrimaryController()
	end
	local count = Engine.GetCryptoKeyCount( controller ) or 0
	return count
end

CoD.BlackMarketUtility.GetProgressTowardNextKey = function ( controller )
	if LUI.DEV and Dvar.ui_cryptokeyprogress:exists() then
		return tonumber( Dvar.ui_cryptokeyprogress:get() )
	elseif not controller then
		controller = Engine.GetPrimaryController()
	end
	local progress = Engine.GetCryptoKeyProgress( controller ) or 0
	return progress / CoD.BlackMarketUtility.XPPerCryptoKey
end

CoD.BlackMarketUtility.GetNumDupesForType = function ( controller, rarity )
	if LUI.DEV then
		if rarity == Enum.LootRarityType.LOOT_RARITY_TYPE_COMMON and Dvar.ui_cryptocommondupes:exists() then
			return tonumber( Dvar.ui_cryptocommondupes:get() )
		elseif rarity == Enum.LootRarityType.LOOT_RARITY_TYPE_RARE and Dvar.ui_cryptoraredupes:exists() then
			return tonumber( Dvar.ui_cryptoraredupes:get() )
		elseif rarity == Enum.LootRarityType.LOOT_RARITY_TYPE_LEGENDARY and Dvar.ui_cryptolegendarydupes:exists() then
			return tonumber( Dvar.ui_cryptolegendarydupes:get() )
		elseif rarity == Enum.LootRarityType.LOOT_RARITY_TYPE_EPIC and Dvar.ui_cryptoepicdupes:exists() then
			return tonumber( Dvar.ui_cryptoepicdupes:get() )
		end
	end
	local numDupes = Engine.GetLootDuplicateCount( controller, Enum.eModes.MODE_MULTIPLAYER, rarity )
	if numDupes == nil then
		numDupes = 0
	end
	return numDupes
end

local randomResultPool = {
	{
		"camo_ce_bo3;ar_damage",
		"camo",
		"common"
	},
	{
		"camo_ce_bo3;ar_fastburst",
		"camo",
		"common"
	},
	{
		"camo_ce_bo3;ar_longburst",
		"camo",
		"common"
	},
	{
		"camo_ce_bo3;ar_marksman",
		"camo",
		"common"
	},
	{
		"camo_ce_bo3;lmg_cqb",
		"camo",
		"common"
	},
	{
		"camo_ce_bo3;lmg_heavy",
		"camo",
		"common"
	},
	{
		"camo_ce_bo3;lmg_light",
		"camo",
		"common"
	},
	{
		"camo_ce_bo3;lmg_slowfire",
		"camo",
		"common"
	},
	{
		"camo_ce_bo3;sniper_fastbolt",
		"camo",
		"common"
	},
	{
		"camo_ce_bo3;sniper_fastsemi",
		"camo",
		"common"
	},
	{
		"camo_ce_bo3;sniper_powerbolt",
		"camo",
		"common"
	},
	{
		"camo_ce_bo3;sniper_chargeshot",
		"camo",
		"common"
	},
	{
		"camo_ce_bo3;shotgun_fullauto",
		"camo",
		"rare"
	},
	{
		"camo_ce_bo3;shotgun_precision",
		"camo",
		"epic"
	},
	{
		"t7_loot_callingcard_dinosaurs_05",
		"calling_card",
		"rare"
	},
	{
		"t7_loot_callingcard_luchalibre_06",
		"calling_card",
		"legendary"
	},
	{
		"t7_loot_callingcard_space_airbrush_04",
		"calling_card",
		"rare"
	},
	{
		"t7_loot_callingcard_tiki",
		"calling_card",
		"common"
	},
	{
		"t7_loot_callingcard_spyposter",
		"calling_card",
		"common"
	},
	{
		"t7_loot_callingcard_twistedcircus_ringmaster",
		"calling_card",
		"rare"
	},
	{
		"t7_loot_callingcard_stylizedtanks",
		"calling_card",
		"common"
	},
	{
		"t7_loot_callingcard_epicspacebattle_6",
		"calling_card",
		"legendary"
	},
	{
		"t7_loot_callingcard_folkheroes",
		"calling_card",
		"common"
	},
	{
		"t7_loot_callingcard_manga_cockpit",
		"calling_card",
		"rare"
	},
	{
		"t7_loot_callingcard_epicspacebattle_12",
		"calling_card",
		"legendary"
	},
	{
		"t7_loot_callingcard_deepsea_f",
		"calling_card",
		"legendary"
	},
	{
		"t7_loot_callingcard_girlpower_01",
		"calling_card",
		"legendary"
	},
	{
		"t7_loot_callingcard_tomb",
		"calling_card",
		"common"
	},
	{
		"t7_loot_callingcard_legendaryanimals_centaur",
		"calling_card",
		"rare"
	},
	{
		"t7_loot_callingcard_space_airbrush_08",
		"calling_card",
		"rare"
	},
	{
		"acv_damage_ar_accurate",
		"attachment_variant",
		"common"
	},
	{
		"acv_damage_ar_cqb",
		"attachment_variant",
		"common"
	},
	{
		"acv_damage_ar_damage",
		"attachment_variant",
		"common"
	},
	{
		"acv_damage_ar_fastburst",
		"attachment_variant",
		"common"
	},
	{
		"acv_damage_ar_longburst",
		"attachment_variant",
		"common"
	},
	{
		"acv_damage_ar_marksman",
		"attachment_variant",
		"common"
	},
	{
		"acv_damage_ar_standard",
		"attachment_variant",
		"common"
	},
	{
		"acv_damage_pistol_burst",
		"attachment_variant",
		"common"
	},
	{
		"acv_damage_pistol_fullauto",
		"attachment_variant",
		"common"
	},
	{
		"acv_damage_pistol_standard",
		"attachment_variant",
		"common"
	},
	{
		"acv_extbarrel_ar_accurate",
		"attachment_variant",
		"common"
	},
	{
		"acv_extbarrel_ar_cqb",
		"attachment_variant",
		"common"
	},
	{
		"acv_extbarrel_ar_damage",
		"attachment_variant",
		"common"
	},
	{
		"acv_extbarrel_ar_fastburst",
		"attachment_variant",
		"common"
	},
	{
		"acv_extbarrel_ar_longburst",
		"attachment_variant",
		"common"
	},
	{
		"acv_extbarrel_ar_marksman",
		"attachment_variant",
		"common"
	},
	{
		"acv_extbarrel_ar_standard",
		"attachment_variant",
		"common"
	},
	{
		"acv_extbarrel_pistol_burst",
		"attachment_variant",
		"common"
	},
	{
		"acv_extbarrel_pistol_fullauto",
		"attachment_variant",
		"common"
	},
	{
		"acv_extbarrel_pistol_standard",
		"attachment_variant",
		"rare"
	},
	[33] = {
		"acv_extbarrel_shotgun_fullauto",
		"attachment_variant",
		"legendary"
	}
}
CoD.BlackMarketUtility.DoCryptoKeyAnimationSequenceStage = function ( self, controller, lootXPBeforeMatch, finalXP, finishedFn )
	self.cryptokeyProgressForNewKey:setShaderVector( 0, lootXPBeforeMatch / CoD.BlackMarketUtility.XPPerCryptoKey, 0, 0, 0 )
	local perControllerModel = Engine.GetModelForController( controller )
	local cryptoKeyModel = Engine.CreateModel( perControllerModel, "CryptoKeyProgress" )
	local cryptoKeyCount = CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( controller ) - math.floor( finalXP / CoD.BlackMarketUtility.XPPerCryptoKey ) - math.floor( lootXPBeforeMatch / CoD.BlackMarketUtility.XPPerCryptoKey )
	Engine.SetModelValue( Engine.CreateModel( cryptoKeyModel, "keyCount" ), cryptoKeyCount )
	self:playClip( "NewKey" )
	self:addElement( LUI.UITimer.newElementTimer( 220, true, function ()
		Engine.SetModelValue( Engine.GetModel( cryptoKeyModel, "keyCount" ), cryptoKeyCount + 1 )
	end ) )
	self.cryptokeyProgressForNewKey:setShaderVector( 0, 1, 0, 0, 0 )
	self:registerEventHandler( "clip_over", function ( element, event )
		finalXP = finalXP - CoD.BlackMarketUtility.XPPerCryptoKey
		if CoD.BlackMarketUtility.XPPerCryptoKey <= finalXP then
			lootXPBeforeMatch = 0
			CoD.BlackMarketUtility.DoCryptoKeyAnimationSequenceStage( self, controller, lootXPBeforeMatch, finalXP, finishedFn )
		else
			self.cryptokeyProgressForNewKey:setShaderVector( 0, 0, 0, 0, 0 )
			self:playClip( "NewXPNoNewKey" )
			self.cryptokeyProgressForNewKey:setShaderVector( 0, finalXP / CoD.BlackMarketUtility.XPPerCryptoKey, 0, 0, 0 )
			self:registerEventHandler( "clip_over", function ( element, event )
				self:registerEventHandler( "clip_over", CoD.NullFunction )
				self:playClip( "DefaultClip" )
				if finishedFn then
					finishedFn()
				end
			end )
		end
	end )
end

CoD.BlackMarketUtility.DoCryptoKeyAnimationSequence = function ( self, controller, lootXPBeforeMatch, finalXP, finishedFn )
	if finalXP < CoD.BlackMarketUtility.XPPerCryptoKey then
		self.cryptokeyProgressForNewKey:setShaderVector( 0, lootXPBeforeMatch / CoD.BlackMarketUtility.XPPerCryptoKey, 0, 0, 0 )
		self:playClip( "NewXPNoNewKey" )
		self.cryptokeyProgressForNewKey:setShaderVector( 0, finalXP / CoD.BlackMarketUtility.XPPerCryptoKey, 0, 0, 0 )
		self:registerEventHandler( "clip_over", function ( element, event )
			self:registerEventHandler( "clip_over", CoD.NullFunction )
			self:playClip( "DefaultClip" )
			if finishedFn then
				finishedFn()
			end
		end )
	else
		CoD.BlackMarketUtility.DoCryptoKeyAnimationSequenceStage( self, controller, lootXPBeforeMatch, finalXP, finishedFn )
	end
end

CoD.BlackMarketUtility.HasShownAARCryptoKeyAnimation = false
CoD.BlackMarketUtility.DoAARCryptoKeyAnimation = function ( self, controller )
	CoD.BlackMarketUtility.HasShownAARCryptoKeyAnimation = false
	if CoD.BlackMarketUtility.HasShownAARCryptoKeyAnimation and not CoD.AARUtility.UseTestData() then
		return 
	end
	local currentStats = CoD.GetPlayerStats( controller )
	if (not currentStats or not currentStats.AfterActionReportStats or not currentStats.AfterActionReportStats.cryptoKeysBeforeMatch) and not CoD.AARUtility.UseTestData() then
		return 
	end
	local cryptoKeysBeforeMatch = 0
	local lootXPBeforeMatch = 0
	local lootXPEarned = 0
	local aarStats = currentStats.AfterActionReportStats
	if CoD.AARUtility.UseTestData() then
		cryptoKeysBeforeMatch = CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( controller )
		lootXPBeforeMatch = CoD.BlackMarketUtility.GetProgressTowardNextKey( controller ) * CoD.BlackMarketUtility.XPPerCryptoKey
		lootXPEarned = 33
	else
		cryptoKeysBeforeMatch = aarStats.cryptoKeysBeforeMatch:get()
		lootXPBeforeMatch = aarStats.lootXPBeforeMatch:get()
		lootXPEarned = aarStats.lootXPEarned:get()
	end
	local finalXP = lootXPBeforeMatch + lootXPEarned
	local commonCrateCost = CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.COMMON )
	if math.floor( cryptoKeysBeforeMatch / commonCrateCost ) < math.floor( finalXP / CoD.BlackMarketUtility.XPPerCryptoKey / commonCrateCost ) then
		local stats = CoD.GetPlayerStats( controller )
		stats.blackMarketShowBreadcrumb:set( 1 )
	end
	if LUI.DEV and Dvar.ui_cryptokeys:exists() and Dvar.ui_cryptokeyprogress:exists() then
		if CoD.BlackMarketUtility.XPPerCryptoKey < finalXP then
			Dvar.ui_cryptokeys:set( Dvar.ui_cryptokeys:get() + 1 )
		end
		Dvar.ui_cryptokeyprogress:set( finalXP % CoD.BlackMarketUtility.XPPerCryptoKey / CoD.BlackMarketUtility.XPPerCryptoKey )
		DataSources.CryptoKeyProgress.getModel( controller )
	end
	if not CoD.AARUtility.UseTestData() and CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( controller ) ~= CoD.BlackMarketUtility.GetCryptoKeyCountPostMatch( aarStats ) then
		lootXPBeforeMatch = finalXP % CoD.BlackMarketUtility.XPPerCryptoKey
		finalXP = finalXP % CoD.BlackMarketUtility.XPPerCryptoKey
	end
	CoD.BlackMarketUtility.DoCryptoKeyAnimationSequence( self, controller, lootXPBeforeMatch, finalXP, function ()
		CoD.BlackMarketUtility.HasShownAARCryptoKeyAnimation = true
	end )
end

CoD.BlackMarketUtility.DoBurnCryptoKeyAnimation = function ( self, controller, lootXPBeforeMatch, finalXP, finishedFn )
	CoD.BlackMarketUtility.DoCryptoKeyAnimationSequence( self, controller, lootXPBeforeMatch, finalXP, finishedFn )
end

CoD.BlackMarketUtility.GetFakeItem = function ( controller )
	local randomIndex = math.random( 1, #randomResultPool )
	return randomResultPool[randomIndex]
end

CoD.BlackMarketUtility.SpendKeysForCrate = function ( controller, keys )
	if LUI.DEV and Dvar.ui_cryptokeys:exists() then
		local currentKeys = tonumber( Dvar.ui_cryptokeys:get() )
		Dvar.ui_cryptokeys:set( currentKeys - keys )
	end
end

CoD.BlackMarketUtility.GetNumDupesTotal = function ( controller )
	return CoD.BlackMarketUtility.GetNumDupesForType( controller, Enum.LootRarityType.LOOT_RARITY_TYPE_COMMON ) + CoD.BlackMarketUtility.GetNumDupesForType( controller, Enum.LootRarityType.LOOT_RARITY_TYPE_RARE ) + CoD.BlackMarketUtility.GetNumDupesForType( controller, Enum.LootRarityType.LOOT_RARITY_TYPE_LEGENDARY ) + CoD.BlackMarketUtility.GetNumDupesForType( controller, Enum.LootRarityType.LOOT_RARITY_TYPE_EPIC )
end

CoD.BlackMarketUtility.GetXPEarnedForBurning = function ( controller, commonDupeCount, rareDupeCount, legendaryDupeCount, epicDupeCount )
	return commonDupeCount * CoD.BlackMarketUtility.BurnReturnXP( Enum.LootRarityType.LOOT_RARITY_TYPE_COMMON ) + rareDupeCount * CoD.BlackMarketUtility.BurnReturnXP( Enum.LootRarityType.LOOT_RARITY_TYPE_RARE ) + legendaryDupeCount * CoD.BlackMarketUtility.BurnReturnXP( Enum.LootRarityType.LOOT_RARITY_TYPE_LEGENDARY ) + epicDupeCount * CoD.BlackMarketUtility.BurnReturnXP( Enum.LootRarityType.LOOT_RARITY_TYPE_EPIC )
end

CoD.BlackMarketUtility.GetNumKeysEarnedForBurning = function ( controller, commonDupeCount, rareDupeCount, legendaryDupeCount, epicDupeCount )
	local progressPct = CoD.BlackMarketUtility.GetProgressTowardNextKey( controller )
	local earnedXP = CoD.BlackMarketUtility.GetXPEarnedForBurning( controller, commonDupeCount, rareDupeCount, legendaryDupeCount, epicDupeCount )
	local earnCount = math.floor( (progressPct * CoD.BlackMarketUtility.XPPerCryptoKey + earnedXP) / CoD.BlackMarketUtility.XPPerCryptoKey )
	return earnCount
end

CoD.BlackMarketUtility.GetItemQuantity = function ( controller, lootItemName )
	if lootItemName then
		return Engine.GetLootItemQuantity( controller, lootItemName, Enum.eModes.MODE_MULTIPLAYER )
	else
		return 0
	end
end

CoD.BlackMarketUtility.UnlockedByPrerequisites = function ( controller, lootItemName )
	return Engine.IsLootItemUnlockedByPreRequisites( controller, lootItemName, Enum.eModes.MODE_MULTIPLAYER )
end

CoD.BlackMarketUtility.IsItemLocked = function ( controller, lootItemName )
	if Dvar.ui_allLootUnlocked:get() == "1" then
		return false
	elseif lootItemName then
		local quantity = CoD.BlackMarketUtility.GetItemQuantity( controller, lootItemName )
		if quantity == nil then
			local unlockedByPrerequisites = CoD.BlackMarketUtility.UnlockedByPrerequisites( controller, lootItemName )
			if unlockedByPrerequisites ~= nil then
				return not unlockedByPrerequisites
			end
		end
		if quantity == nil or quantity == 0 then
			return true
		else
			return false
		end
	else
		return false
	end
end

CoD.BlackMarketUtility.ClassContainsLockedItems = function ( controller, classModel )
	local primaryWeaponRef = CoD.SafeGetModelValue( classModel, "primary.ref" )
	if primaryWeaponRef and primaryWeaponRef ~= "" then
		local primaryWeaponQuantity = CoD.BlackMarketUtility.GetItemQuantity( controller, primaryWeaponRef )
		if primaryWeaponQuantity == 0 then
			return true
		end
	end
	local secondaryWeaponRef = CoD.SafeGetModelValue( classModel, "secondary.ref" )
	if secondaryWeaponRef and secondaryWeaponRef ~= "" then
		local secondaryWeaponQuantity = CoD.BlackMarketUtility.GetItemQuantity( controller, secondaryWeaponRef )
		if secondaryWeaponQuantity == 0 then
			return true
		end
	end
	return false
end

CoD.BlackMarketUtility.ClassifiedName = function ( shouldLocalize )
	local classifiedText = "MENU_CLASSIFIED"
	if shouldLocalize then
		return Engine.Localize( classifiedText )
	else
		return classifiedText
	end
end

CoD.BlackMarketUtility.GetCallingCardSetTable = function ( callingCardSetName )
	for _, callingCardSet in ipairs( CoD.BlackMarketUtility.CallingCardsTable ) do
		if callingCardSet.name == callingCardSetName then
			return callingCardSet
		end
	end
end

CoD.BlackMarketUtility.GetCallingCardRows = function ()
	local category = "calling_card"
	local lootTypeCol = 2
	local lootNameCol = 0
	local allBlackMarketCallingCards = Engine.TableFindRows( CoD.BlackMarketUtility.lootTableName, lootTypeCol, category )
	for index = #allBlackMarketCallingCards, 1, -1 do
		local callingCardRowName = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, allBlackMarketCallingCards[index], lootNameCol )
		if CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( callingCardRowName ) then
			table.remove( allBlackMarketCallingCards, index )
		end
	end
	return allBlackMarketCallingCards
end

CoD.BlackMarketUtility.GetLootTypeRows = function ( type )
	local typeCol = 2
	local lootItemsOfType = Engine.TableFindRows( CoD.BlackMarketUtility.lootTableName, typeCol, type )
	return lootItemsOfType
end

CoD.BlackMarketUtility.BuildCallingCardSets = function ( controller )
	CoD.BlackMarketUtility.CallingCardsTable = {}
	CoD.BlackMarketUtility.CommonCallingCardsTable = {}
	local callingCardSetsTable = {}
	local callingCardSets = {}
	local category = "calling_card"
	local lootNameCol = 0
	local lootSetNameCol = 4
	local lootPreRequisiteCol = 5
	local callingCardRows = CoD.BlackMarketUtility.GetCallingCardRows()
	local totalCommonCallingCards = 0
	local ownedCommonCallingCards = 0
	local newCommonCallingCards = 0
	for _, callingCardRowInfo in ipairs( callingCardRows ) do
		local callingCardRowName = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, callingCardRowInfo, lootNameCol )
		local callingCardRowSetName = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, callingCardRowInfo, lootSetNameCol )
		local callingCardRowPreReq = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, callingCardRowInfo, lootPreRequisiteCol )
		local callingCardTitle = CoD.BlackMarketUtility.GetCallingCardTitleFromImage( callingCardRowName )
		local callingCardIconId = CoD.BlackMarketUtility.GetLootCallingCardIndex( controller, callingCardRowName )
		local rarityString = CoD.BlackMarketUtility.GetRarityForLootItemFromName( callingCardRowName )
		local duplicateCount = CoD.BlackMarketUtility.GetItemQuantity( controller, callingCardRowName )
		if callingCardRowSetName ~= "" then
			if not callingCardSets[callingCardRowSetName] then
				callingCardSets[callingCardRowSetName] = {}
			end
			local callingCardSortKey = CoD.BlackMarketUtility.GetCallingCardSortKeyFromImage( callingCardRowName )
			local isBMClassified = CoD.BlackMarketUtility.IsItemLocked( controller, callingCardRowName )
			table.insert( callingCardSets[callingCardRowSetName], {
				title = callingCardTitle,
				name = callingCardRowName,
				rarity = rarityString,
				duplicateCount = duplicateCount,
				iconId = callingCardIconId,
				sortKey = callingCardSortKey,
				isBMClassified = isBMClassified
			} )
		end
		if callingCardRowPreReq ~= "" then
			local callingCardSetInfo = {}
			local rarity = CoD.BlackMarketUtility.GetRarityForCallingCardSetFromSetName( callingCardRowPreReq )
			local totalOwned = nil
			callingCardSetInfo.name = callingCardRowPreReq
			callingCardSetInfo.title = callingCardTitle
			callingCardSetInfo.setCount = CoD.BlackMarketUtility.GetSetPieceStringForLootSet( controller, callingCardRowPreReq, category )
			totalOwned, callingCardSetInfo.totalSetCount, callingCardSetInfo.newCount = CoD.BlackMarketUtility.GetNumOwnedAndTotalForCallingCardSet( controller, callingCardRowPreReq )
			callingCardSetInfo.iconId = 0
			callingCardSetInfo.masterCardIconId = callingCardIconId
			callingCardSetInfo.rarity = rarity
			if Engine.IsEmblemBackgroundNew( controller, callingCardIconId ) then
				callingCardSetInfo.newCount = callingCardSetInfo.newCount + 1
			end
			table.insert( callingCardSetsTable, callingCardSetInfo )
		end
		totalCommonCallingCards = totalCommonCallingCards + 1
		local isBMClassified = CoD.BlackMarketUtility.IsItemLocked( controller, callingCardRowName )
		if not isBMClassified then
			ownedCommonCallingCards = ownedCommonCallingCards + 1
		end
		local backgroundsTableId = CoD.BlackMarketUtility.GetLootCallingCardIndex( controller, callingCardRowName )
		if backgroundsTableId and Engine.IsEmblemBackgroundNew( controller, backgroundsTableId ) then
			newCommonCallingCards = newCommonCallingCards + 1
		end
		table.insert( CoD.BlackMarketUtility.CommonCallingCardsTable, {
			title = callingCardTitle,
			name = callingCardRowName,
			rarity = rarityString,
			duplicateCount = duplicateCount,
			iconId = callingCardIconId,
			isBMClassified = isBMClassified
		} )
	end
	for _, callingCardRowInfo in pairs( callingCardSetsTable ) do
		if callingCardSets[callingCardRowInfo.name] then
			callingCardRowInfo.callingCards = callingCardSets[callingCardRowInfo.name]
			local isSetBMClassified = true
			local isMasterCallingCardBMClassified = false
			for _, callingCard in ipairs( callingCardRowInfo.callingCards ) do
				if callingCard.isBMClassified == false then
					isSetBMClassified = false
					if callingCardRowInfo.iconId == 0 then
						callingCardRowInfo.iconId = CoD.BlackMarketUtility.GetLootCallingCardIndex( controller, callingCard.name )
					end
				end
				isMasterCallingCardBMClassified = true
			end
			if not callingCardRowInfo.iconId then
				callingCardRowInfo.iconId = 0
			end
			callingCardRowInfo.isBMClassified = isMasterCallingCardBMClassified
			callingCardRowInfo.isSetBMClassified = isSetBMClassified
		end
	end
	table.sort( callingCardSetsTable, CoD.BlackMarketUtility.SortUnlockIconId )
	CoD.BlackMarketUtility.CallingCardsTable = callingCardSetsTable
	local commonSetCountString = ownedCommonCallingCards .. " / " .. totalCommonCallingCards
	return ownedCommonCallingCards, commonSetCountString, newCommonCallingCards
end

CoD.BlackMarketUtility.SortUnlockIconId = function ( a, b )
	if a.isSetBMClassified ~= b.isSetBMClassified then
		return b.isSetBMClassified
	else
		return a.iconId < b.iconId
	end
end

CoD.BlackMarketUtility.SortUnlocksModelIconId = function ( a, b )
	if a.models.isBMClassified ~= b.models.isBMClassified then
		return b.models.isBMClassified
	else
		return a.models.iconId < b.models.iconId
	end
end

CoD.BlackMarketUtility.SortUnlocksPropertyIndex = function ( a, b )
	if a.models.isBMClassified ~= b.models.isBMClassified then
		return b.models.isBMClassified
	else
		return a.properties.index < b.properties.index
	end
end

CoD.BlackMarketUtility.SortUnlocksPropertyVariantIndex = function ( a, b )
	if a.models.isBMClassified ~= b.models.isBMClassified then
		return b.models.isBMClassified
	else
		return a.properties.variantIndex < b.properties.variantIndex
	end
end

CoD.BlackMarketUtility.SortUnlocksModelIconID = function ( a, b )
	local aIsBMClassifiedValue = Engine.GetModelValue( Engine.GetModel( a, "isBMClassified" ) )
	local bIsBMClassifiedValue = Engine.GetModelValue( Engine.GetModel( b, "isBMClassified" ) )
	if aIsBMClassifiedValue ~= bIsBMClassifiedValue then
		return bIsBMClassifiedValue
	else
		local aIconID = Engine.GetModelValue( Engine.GetModel( a, "iconID" ) )
		local bIconID = Engine.GetModelValue( Engine.GetModel( b, "iconID" ) )
		return aIconID < bIconID
	end
end

CoD.BlackMarketUtility.SortUnlocksModelWOSubIndex = function ( a, b )
	local aIsBMClassifiedValue = Engine.GetModelValue( Engine.GetModel( a, "isBMClassified" ) )
	local bIsBMClassifiedValue = Engine.GetModelValue( Engine.GetModel( b, "isBMClassified" ) )
	if aIsBMClassifiedValue ~= bIsBMClassifiedValue then
		return bIsBMClassifiedValue
	else
		local aSubIndex = Engine.GetModelValue( Engine.GetModel( a, "weaponOptionSubIndex" ) )
		local bSubIndex = Engine.GetModelValue( Engine.GetModel( b, "weaponOptionSubIndex" ) )
		return aSubIndex < bSubIndex
	end
end

