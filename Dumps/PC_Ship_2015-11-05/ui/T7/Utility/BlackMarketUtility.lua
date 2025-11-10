require( "lua.Shared.LuaEnums" )

CoD.BlackMarketUtility = {}
CoD.BlackMarketUtility.DropTypes = {
	COMMON = 0,
	RARE = 1,
	LEGENDARY = 2,
	EPIC = 3
}
CoD.BlackMarketUtility.BurnReturnXP = {
	[CoD.BlackMarketUtility.DropTypes.COMMON] = 10,
	[CoD.BlackMarketUtility.DropTypes.RARE] = 25,
	[CoD.BlackMarketUtility.DropTypes.LEGENDARY] = 50,
	[CoD.BlackMarketUtility.DropTypes.EPIC] = 100
}
CoD.BlackMarketUtility.CrateTypeStrings = {
	[CoD.BlackMarketUtility.DropTypes.COMMON] = "MPUI_BM_COMMON",
	[CoD.BlackMarketUtility.DropTypes.RARE] = "MPUI_BM_RARE",
	[CoD.BlackMarketUtility.DropTypes.LEGENDARY] = "MPUI_BM_LEGENDARY",
	[CoD.BlackMarketUtility.DropTypes.EPIC] = "MPUI_BM_EPIC"
}
CoD.BlackMarketUtility.CrateTypeIds = {
	[CoD.BlackMarketUtility.DropTypes.COMMON] = "common",
	[CoD.BlackMarketUtility.DropTypes.RARE] = "rare",
	[CoD.BlackMarketUtility.DropTypes.LEGENDARY] = "legendary",
	[CoD.BlackMarketUtility.DropTypes.EPIC] = "epic"
}
CoD.BlackMarketUtility.CrateTypeRevealAlias = {
	[CoD.BlackMarketUtility.DropTypes.RARE] = "uin_bm_cycle_item_rare_layer",
	[CoD.BlackMarketUtility.DropTypes.LEGENDARY] = "uin_bm_cycle_item_legend_layer",
	[CoD.BlackMarketUtility.DropTypes.EPIC] = "uin_bm_cycle_item_epic_layer"
}
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
	taunt = ""
}
CoD.BlackMarketUtility.GestureImages = {
	t7_loot_gesture_boast_ = "t7_icon_blackmarket_boast",
	t7_loot_gesture_threaten_ = "t7_icon_blackmarket_taunt",
	t7_loot_gesture_goodgame_ = "t7_icon_blackmarket_goodgame"
}
CoD.BlackMarketUtility.LootHeroNamesToAssetNames = {
	pbt_mp_battery = "pbt_mp_battery",
	pbt_mp_firebreak = "pbt_mp_firebreak",
	pbt_mp_trapper = "pbt_mp_trapper",
	pbt_mp_outrider = "pbt_mp_outrider",
	pbt_mp_technomancer = "pbt_mp_technomancer",
	pbt_mp_reaper = "pbt_mp_reaper",
	pbt_mp_mercenary = "pbt_mp_mercenary",
	pbt_mp_enforcer = "pbt_mp_enforcer",
	pbt_mp_spectre = "pbt_mp_spectre"
}
CoD.BlackMarketUtility.XPPerCryptoKey = 100
CoD.BlackMarketUtility.crateTable = "gamedata/loot/loot_crate.csv"
CoD.BlackMarketUtility.lootEmblemTableName = "gamedata/loot/mplootemblems.csv"
CoD.BlackMarketUtility.lootTableName = "gamedata/loot/mplootitems.csv"
CoD.BlackMarketUtility.emblemMaterialsTableName = "gamedata/emblems/emblemMaterials.csv"
CoD.BlackMarketUtility.emblemIconsTableName = "gamedata/emblems/emblemIcons.csv"
CoD.BlackMarketUtility.backgroundsTable = "gamedata/emblems/backgrounds.csv"
CoD.BlackMarketUtility.parsedEmblemDDLs = {}
CoD.BlackMarketUtility.CallingCardsTable = {}
CoD.BlackMarketUtility.CommonCallingCardsTable = {}
CoD.BlackMarketUtility.WeaponsWithNoBMCamos = {
	launcher_standard_df = true,
	bowie_knife = true
}
CoD.BlackMarketUtility.GetRarityIDForString = function ( f1_arg0 )
	for f1_local3, f1_local4 in pairs( CoD.BlackMarketUtility.CrateTypeIds ) do
		if f1_local4 == f1_arg0 then
			return f1_local3
		end
	end
	return CoD.BlackMarketUtility.DropTypes.COMMON
end

CoD.BlackMarketUtility.ConvertToLootDecalIndex = function ( f2_arg0 )
	local f2_local0 = 0
	for f2_local4 in string.gmatch( f2_arg0, "[^%s_]+" ) do
		f2_local0 = f2_local0 + 1
		if f2_local0 == 1 and f2_local4 ~= "decal" then
			break
		elseif f2_local0 == 2 then
			return f2_local4
		end
	end
	f2_local3 = Engine.TableLookup( nil, CoD.emblemIconsTable, 3, f2_arg0, 1 )
	if f2_local3 and f2_local3 ~= "" then
		return f2_local3
	end
	return nil
end

CoD.BlackMarketUtility.ConvertToLootDecalIndexIfDecal = function ( f3_arg0 )
	return CoD.BlackMarketUtility.ConvertToLootDecalIndex( f3_arg0 ) or f3_arg0
end

CoD.BlackMarketUtility.SplitIdIntoTwoValues = function ( f4_arg0 )
	local f4_local0 = nil
	for f4_local4 in string.gmatch( f4_arg0, "[^%s;]+" ) do
		if f4_local0 == nil then
			f4_local0 = f4_local4
		end
		return f4_local0, f4_local4
	end
	if f4_local0 ~= nil then
		return f4_local0, ""
	end
	return "", ""
end

CoD.BlackMarketUtility.SplitAttachmentVariantID = function ( f5_arg0 )
	local f5_local0 = 0
	local f5_local1 = ""
	local f5_local2 = ""
	for f5_local6 in string.gmatch( f5_arg0, "[^%s_]+" ) do
		f5_local0 = f5_local0 + 1
		if f5_local0 == 1 then
			if f5_local6 ~= "acv" then
				return "", ""
			end
		end
		if f5_local0 == 2 then
			f5_local1 = f5_local6
		end
		if f5_local2 == "" then
			f5_local2 = f5_local6
		else
			f5_local2 = f5_local2 .. "_" .. f5_local6
		end
	end
	return f5_local1, f5_local2
end

CoD.BlackMarketUtility.GetItemTypeStringForLootItem = function ( f6_arg0, f6_arg1 )
	if f6_arg1 == "camo" then
		local f6_local0, f6_local1 = CoD.BlackMarketUtility.SplitIdIntoTwoValues( f6_arg0 )
		return Engine.Localize( "MPUI_BM_WEAPON_CAMO", CoD.CACUtility.GetNameForItemRefString( f6_local1 ) )
	elseif f6_arg1 == "attachment_variant" then
		local f6_local0, f6_local1 = CoD.BlackMarketUtility.SplitAttachmentVariantID( f6_arg0 )
		return Engine.Localize( "MPUI_BM_WEAPON_ATTACHMENT_VARIANT", CoD.CACUtility.GetNameForItemRefString( f6_local1 ), Engine.TableLookup( nil, CoD.attachmentTable, 4, f6_local0, 3 ) )
	elseif f6_arg1 == "gesture" then
		local f6_local0, f6_local1 = CoD.BlackMarketUtility.SplitIdIntoTwoValues( f6_arg0 )
		local f6_local2 = CoD.BlackMarketUtility.LootHeroNamesToAssetNames[f6_local1]
		local f6_local3, f6_local4 = CoD.CCUtility.GetHeroDisplayNameAndIndex( Enum.eModes.MODE_MULTIPLAYER, f6_local2 )
		return Engine.Localize( "MPUI_BM_HERO_AND_GESTURE_TYPE", f6_local3, CoD.CCUtility.GetTypeNameForGesture( Enum.eModes.MODE_MULTIPLAYER, f6_local2, f6_local0 ) )
	elseif f6_arg1 == "taunt" then
		local f6_local0, f6_local1 = CoD.CCUtility.GetHeroDisplayNameAndIndexForTaunt( Enum.eModes.MODE_MULTIPLAYER, f6_arg0 )
		return Engine.Localize( "MPUI_BM_HERO_TAUNT", f6_local0 )
	elseif f6_arg1 == "specialist_outfit" then
		local f6_local0, f6_local1 = CoD.BlackMarketUtility.SplitIdIntoTwoValues( f6_arg0 )
		local f6_local2 = "MENU_SPECIALIST_HEAD_THEME"
		if string.find( f6_local0, "body" ) then
			f6_local2 = "MENU_SPECIALIST_BODY_THEME"
		end
		return Engine.Localize( f6_local2, CoD.BlackMarketUtility.GetHeroDisplayNameForAssetName( f6_local1 ) )
	else
		return CoD.BlackMarketUtility.CategoryStrings[f6_arg1]
	end
end

CoD.BlackMarketUtility.GetImageForLootItem = function ( f7_arg0, f7_arg1 )
	if f7_arg1 == "camo" then
		local f7_local0, f7_local1 = CoD.BlackMarketUtility.SplitIdIntoTwoValues( f7_arg0 )
		return CoD.CACUtility.GetImageForItemRefString( f7_local1 ) .. "_" .. f7_local0
	elseif f7_arg1 == "emblem" then
		return "blacktransparent"
	elseif f7_arg1 == "attachment_variant" then
		return Engine.GetAttachmentCosmeticVariantImage( f7_arg0, 0 ) or "cac_mods_ar_standard_high_caliber_02_sm"
	elseif f7_arg1 == "material" then
		return f7_arg0
	elseif f7_arg1 == "gesture" then
		for f7_local3, f7_local4 in pairs( CoD.BlackMarketUtility.GestureImages ) do
			if LUI.startswith( f7_arg0, f7_local3 ) then
				return f7_local4
			end
		end
	elseif f7_arg1 == "taunt" then
		return "t7_icon_blackmarket_taunt"
	elseif f7_arg1 == "specialist_outfit" then
		local f7_local0, f7_local1 = CoD.BlackMarketUtility.SplitIdIntoTwoValues( f7_arg0 )
		return CoD.BlackMarketUtility.GetSpecialistOutfitFieldForId( f7_local0, f7_local1, "icon" )
	end
	return f7_arg0
end

CoD.BlackMarketUtility.GetStringRefForLootItem = function ( f8_arg0, f8_arg1, f8_arg2 )
	if f8_arg2 == "camo" then
		local f8_local0, f8_local1 = CoD.BlackMarketUtility.SplitIdIntoTwoValues( f8_arg1 )
		return Engine.TableLookup( nil, CoD.attachmentTable, 4, f8_local0, 3 )
	elseif f8_arg2 == "emblem" then
		local f8_local0, f8_local1, f8_local2 = CoD.BlackMarketUtility.GetLootEmblemIndexParams( f8_arg0, f8_arg1 )
		if CoD.BlackMarketUtility.parsedEmblemDDLs[f8_local2] == nil then
			CoD.CraftUtility.Emblems.ParseDDL( f8_local0, f8_local2 )
			CoD.BlackMarketUtility.parsedEmblemDDLs[f8_local2] = true
		end
		local f8_local3 = CoD.CraftUtility.Emblems.CachedEmblems[f8_local1 + 1]
		if f8_local3 ~= nil then
			return f8_local3.emblemName
		else
			return f8_arg1
		end
	elseif f8_arg2 == "calling_card" then
		return Engine.TableLookup( nil, CoD.backgroundsTable, 3, f8_arg1, 4 ) or ""
	elseif f8_arg2 == "decal" then
		local f8_local0 = CoD.BlackMarketUtility.ConvertToLootDecalIndexIfDecal( f8_arg1 )
		if f8_local0 == f8_arg1 then
			return ""
		else
			return GetEmblemDecalDesc( f8_local0 )
		end
	elseif f8_arg2 == "attachment_variant" then
		return Engine.GetAttachmentCosmeticVariantName( f8_arg1, 0 ) or "High Caliber 1"
	elseif f8_arg2 == "material" then
		return Engine.TableLookup( nil, CoD.BlackMarketUtility.emblemMaterialsTableName, 3, f8_arg1, 4 ) or ""
	elseif f8_arg2 == "gesture" then
		local f8_local0, f8_local1 = CoD.BlackMarketUtility.SplitIdIntoTwoValues( f8_arg1 )
		return CoD.CCUtility.GetDisplayNameForGesture( Enum.eModes.MODE_MULTIPLAYER, CoD.BlackMarketUtility.LootHeroNamesToAssetNames[f8_local1], f8_local0 )
	elseif f8_arg2 == "taunt" then
		return CoD.CCUtility.GetDisplayNameForTaunt( Enum.eModes.MODE_MULTIPLAYER, f8_arg1 )
	elseif f8_arg2 == "specialist_outfit" then
		local f8_local0, f8_local1 = CoD.BlackMarketUtility.SplitIdIntoTwoValues( f8_arg1 )
		return CoD.BlackMarketUtility.GetSpecialistOutfitFieldForId( f8_local0, f8_local1, "name" )
	else
		return f8_arg1
	end
end

CoD.BlackMarketUtility.GetSpecialistOutfitFieldForId = function ( f9_arg0, f9_arg1, f9_arg2 )
	local f9_local0 = Enum.eModes.MODE_MULTIPLAYER
	for f9_local11, f9_local12 in ipairs( Engine.GetHeroList( f9_local0 ) ) do
		if f9_local12.assetName == f9_arg1 then
			for f9_local4 = 0, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_COUNT - 1, 1 do
				for f9_local7 = 0, 256, 1 do
					local f9_local10 = Engine.GetHeroItemInfo( f9_local0, f9_local12.bodyIndex, f9_local4, f9_local7 )
					if not f9_local10 then
						
					end
					if f9_local10.assetName ~= nil and f9_local10.assetName == f9_arg0 then
						return f9_local10[f9_arg2]
					end
				end
			end
		end
	end
	return ""
end

CoD.BlackMarketUtility.GetCallingCardSetName = function ( f10_arg0 )
	return Engine.TableLookup( nil, CoD.BlackMarketUtility.lootTableName, 0, f10_arg0, 4 )
end

CoD.BlackMarketUtility.GetNumOwnedAndTotalForCallingCardSet = function ( f11_arg0, f11_arg1 )
	local f11_local0 = 4
	local f11_local1 = 0
	local f11_local2 = Engine.TableFindRows( CoD.BlackMarketUtility.lootTableName, f11_local0, f11_arg1 )
	local f11_local3 = 0
	local f11_local4 = 0
	if not f11_local2 then
		return 0, 0, 0
	end
	for f11_local5 = 1, #f11_local2, 1 do
		local f11_local8 = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, f11_local2[f11_local5], f11_local1 )
		if not CoD.BlackMarketUtility.IsItemLocked( f11_arg0, f11_local8 ) then
			f11_local3 = f11_local3 + 1
			local f11_local9 = Engine.TableLookup( f11_arg0, CoD.BlackMarketUtility.backgroundsTable, 3, f11_local8, 1 )
			if f11_local9 and Engine.IsEmblemBackgroundNew( f11_arg0, f11_local9 ) then
				f11_local4 = f11_local4 + 1
			end
		end
	end
	return f11_local3, #f11_local2, f11_local4
end

CoD.BlackMarketUtility.GetSetNumOwnedAndTotalForCallingCard = function ( f12_arg0, f12_arg1 )
	local f12_local0 = CoD.BlackMarketUtility.GetCallingCardSetName( f12_arg1 )
	if f12_local0 == nil or f12_local0 == "" then
		return 0, 0, 0
	else
		return CoD.BlackMarketUtility.GetNumOwnedAndTotalForCallingCardSet( f12_arg0, f12_local0 )
	end
end

CoD.BlackMarketUtility.GetRewardAndCategoryForItem = function ( f13_arg0 )
	local f13_local0 = 0
	local f13_local1 = 2
	local f13_local2 = Engine.TableFindRows( CoD.BlackMarketUtility.lootTableName, 5, f13_arg0 )
	if f13_local2 ~= nil then
		return Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, f13_local2[1], f13_local0 ), Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, f13_local2[1], f13_local1 )
	else
		return nil, nil
	end
end

CoD.BlackMarketUtility.ShowToastIfApplicable = function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
	if LUI.DEV and Dvar.ui_forcetoast and Dvar.ui_forcetoast:exists() and tonumber( Dvar.ui_forcetoast:get() ) == 1 then
		if f14_arg3 == 2 then
			CoD.OverlayUtility.ShowToast( "LootBonusCallingCard", Engine.Localize( "MPUI_BM_BONUS_CALLING_CARD_SET_MASTER" ), Engine.Localize( "MPUI_BM_BONUS_CALLING_CARD_SET_MASTER_DESC", "Aliens" ), "t7_callingcard_mp_darkops_chainkiller" )
		elseif f14_arg3 == 3 then
			CoD.OverlayUtility.ShowToast( "LootBonusDecal", "MONSTER DECAL", Engine.Localize( "MPUI_BM_BONUS_DECAL_DESC", "True Monster" ), nil, nil, 2 )
		end
		return 
	elseif f14_arg2 == "emblem" then
		local f14_local0, f14_local1 = CoD.BlackMarketUtility.GetRewardAndCategoryForItem( f14_arg1 )
		if f14_local0 then
			local f14_local2 = CoD.BlackMarketUtility.GetStringRefForLootItem( f14_arg0, f14_local0, f14_local1 )
			local f14_local3 = CoD.BlackMarketUtility.GetItemTypeStringForLootItem( f14_local0, f14_local1 )
			local f14_local4 = nil
			local f14_local5 = f14_local0
			if f14_local1 == "decal" then
				f14_local4 = tonumber( CoD.BlackMarketUtility.ConvertToLootDecalIndexIfDecal( f14_local0 ) )
				f14_local5 = nil
			end
			CoD.OverlayUtility.ShowToast( "LootBonusDecal", f14_local2, Engine.Localize( f14_local3 ), f14_local5, nil, f14_local4 )
		end
	elseif f14_arg2 == "calling_card" then
		local f14_local0, f14_local1 = CoD.BlackMarketUtility.GetSetNumOwnedAndTotalForCallingCard( f14_arg0, f14_arg1 )
		if f14_local1 > 0 and f14_local0 == f14_local1 then
			local f14_local3, f14_local4 = CoD.BlackMarketUtility.GetRewardAndCategoryForItem( CoD.BlackMarketUtility.GetCallingCardSetName( f14_arg1 ) )
			CoD.OverlayUtility.ShowToast( "LootBonusCallingCard", Engine.Localize( CoD.BlackMarketUtility.GetStringRefForLootItem( f14_arg0, f14_local3, f14_local4 ) ), Engine.Localize( CoD.BlackMarketUtility.GetItemTypeStringForLootItem( f14_local3, f14_local4 ) ), nil, nil, nil, f14_local3 )
		end
	end
end

CoD.BlackMarketUtility.GetSetPieceStringForLootItem = function ( f15_arg0, f15_arg1, f15_arg2 )
	if f15_arg2 == "calling_card" then
		local f15_local0, f15_local1 = CoD.BlackMarketUtility.GetSetNumOwnedAndTotalForCallingCard( f15_arg0, f15_arg1 )
		if f15_local1 > 0 then
			return Engine.Localize( "MPUI_BM_SET_PIECE_X_OF_Y", f15_local0, f15_local1 )
		end
	end
	return ""
end

CoD.BlackMarketUtility.GetSetPieceStringForLootSet = function ( f16_arg0, f16_arg1, f16_arg2 )
	if f16_arg2 == "calling_card" then
		local f16_local0, f16_local1 = CoD.BlackMarketUtility.GetNumOwnedAndTotalForCallingCardSet( f16_arg0, f16_arg1 )
		if f16_local1 > 0 then
			return Engine.Localize( "MPUI_BM_SET_X_OF_Y", f16_local0, f16_local1 )
		end
	end
	return ""
end

local f0_local0 = function ( f17_arg0 )
	local f17_local0 = Engine.GetPlayerStats( f17_arg0 )
	return f17_local0.PlayerStatsList.RANK.statValue:get()
end

CoD.BlackMarketUtility.GetItemLockedTextAndAvailability = function ( f18_arg0, f18_arg1, f18_arg2 )
	if f18_arg2 == "camo" then
		local f18_local0 = Enum.eModes.MODE_MULTIPLAYER
		local f18_local1 = f0_local0( f18_arg0 )
		local f18_local2, f18_local3 = CoD.BlackMarketUtility.SplitIdIntoTwoValues( f18_arg1 )
		local f18_local4 = Engine.GetItemIndexFromReference( f18_local3, f18_local0 )
		local f18_local5 = Engine.GetItemUnlockLevel( f18_local4, f18_local0 )
		if f18_local1 < f18_local5 then
			return Engine.GetItemName( f18_local4, f18_local0 ), Engine.Localize( "MENU_RANK_NAME_FULL", CoD.GetRankName( f18_local5, 0, f18_local0 ), "" .. f18_local5 + 1 )
		end
	elseif f18_arg2 == "attachment_variant" then
		local f18_local0 = Enum.eModes.MODE_MULTIPLAYER
		local f18_local1, f18_local2 = CoD.BlackMarketUtility.SplitAttachmentVariantID( f18_arg1 )
		local f18_local3 = Engine.GetItemIndexFromReference( f18_local2 )
		local f18_local5 = Engine.GetAttachmentIndexByAttachmentTableIndex( f18_local3, Engine.TableLookup( nil, CoD.attachmentTable, 4, f18_local1, 0 ), f18_local0 )
		local f18_local6 = Engine.GetItemAttachmentRank( f18_local3, f18_local5, f18_local0 )
		local f18_local7 = Engine.GetGunCurrentRank( f18_arg0, f18_local3, f18_local0 )
		if Engine.IsItemAttachmentLocked( f18_arg0, f18_local3, f18_local5, f18_local0 ) then
			local f18_local8 = Engine.GetItemName( f18_local3, f18_local0 )
			return Engine.Localize( Engine.TableLookup( nil, CoD.attachmentTable, 4, f18_local1, 3 ) ), Engine.Localize( "MPUI_WEAPON_RANK", f18_local6 + 2 )
		end
	elseif f18_arg2 == "taunt" or f18_arg2 == "gesture" then
		local f18_local0 = 0
		local f18_local1 = ""
		if f18_arg2 == "taunt" then
			f18_local1, f18_local0 = CoD.CCUtility.GetHeroDisplayNameAndIndexForTaunt( Enum.eModes.MODE_MULTIPLAYER, f18_arg1 )
		else
			local f18_local2, f18_local3 = CoD.BlackMarketUtility.SplitIdIntoTwoValues( f18_arg1 )
			f18_local1, f18_local0 = CoD.CCUtility.GetHeroDisplayNameAndIndex( Enum.eModes.MODE_MULTIPLAYER, CoD.BlackMarketUtility.LootHeroNamesToAssetNames[f18_local3] )
		end
		local f18_local2, f18_local3 = CoD.CCUtility.Heroes.GetHeroUnlockInfo( f18_arg0, f18_local0, Enum.eModes.MODE_MULTIPLAYER, "MENU_RANK_NAME_FULL" )
		if f18_local2 then
			return f18_local1, f18_local3
		end
	end
	return nil, nil
end

CoD.BlackMarketUtility.GetLootCallingCardIndex = function ( f19_arg0, f19_arg1 )
	return tonumber( Engine.TableLookup( f19_arg0, CoD.BlackMarketUtility.backgroundsTable, 3, f19_arg1, 1 ) )
end

CoD.BlackMarketUtility.GetLootEmblemIndexParams = function ( f20_arg0, f20_arg1 )
	local f20_local0 = 0
	local f20_local1 = 1
	local f20_local2 = 2
	local f20_local3 = Engine.TableFindRows( CoD.BlackMarketUtility.lootEmblemTableName, f20_local0, f20_arg1 )
	if f20_local3 then
		return f20_arg0, tonumber( Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootEmblemTableName, f20_local3[1], f20_local1 ) ), Enum.StorageFileType[Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootEmblemTableName, f20_local3[1], f20_local2 )]
	else
		return f20_arg0, 0, Enum.StorageFileType.STORAGE_DEFAULT_EMBLEMS
	end
end

CoD.BlackMarketUtility.GetLootEmblemIDName = function ( f21_arg0, f21_arg1 )
	local f21_local0 = 0
	local f21_local1 = 1
	local f21_local2 = 2
	return Engine.TableLookup( nil, CoD.BlackMarketUtility.lootEmblemTableName, f21_local1, f21_arg1, f21_local0 )
end

CoD.BlackMarketUtility.GetLootDecalName = function ( f22_arg0, f22_arg1 )
	return Engine.TableLookup( nil, CoD.BlackMarketUtility.emblemIconsTableName, 1, f22_arg1, 3 )
end

CoD.BlackMarketUtility.GetCallingCardTitleFromImage = function ( f23_arg0 )
	return Engine.TableLookup( nil, CoD.BlackMarketUtility.backgroundsTable, 3, f23_arg0, 4 )
end

CoD.BlackMarketUtility.GetCallingCardSortKeyFromImage = function ( f24_arg0 )
	return Engine.TableLookup( nil, CoD.BlackMarketUtility.backgroundsTable, 3, f24_arg0, 2 )
end

CoD.BlackMarketUtility.GetRarityForCallingCardSetFromSetName = function ( f25_arg0 )
	return CoD.BlackMarketUtility.CrateTypeStrings[CoD.BlackMarketUtility.GetRarityIDForString( Engine.TableLookup( nil, CoD.BlackMarketUtility.lootTableName, 4, f25_arg0, 3 ) )]
end

CoD.BlackMarketUtility.GetRarityForLootItemFromName = function ( f26_arg0 )
	local f26_local0 = Engine.TableLookup( nil, CoD.BlackMarketUtility.lootTableName, 0, f26_arg0, 3 )
	if f26_local0 == "" then
		return ""
	else
		return CoD.BlackMarketUtility.CrateTypeStrings[CoD.BlackMarketUtility.GetRarityIDForString( f26_local0 )]
	end
end

CoD.BlackMarketUtility.GetSpecialistNameForHeroAssetName = function ( f27_arg0 )
	for f27_local3, f27_local4 in pairs( CoD.BlackMarketUtility.LootHeroNamesToAssetNames ) do
		if f27_local4 == f27_arg0 then
			return f27_local3
		end
	end
	return ""
end

CoD.BlackMarketUtility.GetHeroDisplayNameForAssetName = function ( f28_arg0 )
	local f28_local0 = Enum.eModes.MODE_MULTIPLAYER
	for f28_local4, f28_local5 in ipairs( Engine.GetHeroList( f28_local0 ) ) do
		if f28_local5.assetName == f28_arg0 then
			return Engine.GetHeroName( f28_local0, f28_local5.bodyIndex )
		end
	end
	return f28_arg0
end

CoD.BlackMarketUtility.GetCrateCryptoKeyCost = function ( f29_arg0 )
	return tonumber( Engine.TableLookup( 0, CoD.BlackMarketUtility.crateTable, 0, f29_arg0, 3 ) )
end

CoD.BlackMarketUtility.GetCrateCoDPointCost = function ( f30_arg0 )
	return tonumber( Engine.TableLookup( 0, CoD.BlackMarketUtility.crateTable, 0, f30_arg0, 4 ) )
end

CoD.BlackMarketUtility.GetCurrentCryptoKeyCount = function ( f31_arg0 )
	if LUI.DEV and Dvar.ui_cryptokeys:exists() then
		return tonumber( Dvar.ui_cryptokeys:get() )
	elseif not f31_arg0 then
		f31_arg0 = Engine.GetPrimaryController()
	end
	return Engine.GetCryptoKeyCount( f31_arg0 ) or 0
end

CoD.BlackMarketUtility.GetProgressTowardNextKey = function ( f32_arg0 )
	if LUI.DEV and Dvar.ui_cryptokeyprogress:exists() then
		return tonumber( Dvar.ui_cryptokeyprogress:get() )
	elseif not f32_arg0 then
		f32_arg0 = Engine.GetPrimaryController()
	end
	return (Engine.GetCryptoKeyProgress( f32_arg0 ) or 0) / CoD.BlackMarketUtility.XPPerCryptoKey
end

CoD.BlackMarketUtility.GetNumDupesForType = function ( f33_arg0, f33_arg1 )
	if LUI.DEV then
		if f33_arg1 == CoD.BlackMarketUtility.DropTypes.COMMON and Dvar.ui_cryptocommondupes:exists() then
			return tonumber( Dvar.ui_cryptocommondupes:get() )
		elseif f33_arg1 == CoD.BlackMarketUtility.DropTypes.RARE and Dvar.ui_cryptoraredupes:exists() then
			return tonumber( Dvar.ui_cryptoraredupes:get() )
		elseif f33_arg1 == CoD.BlackMarketUtility.DropTypes.LEGENDARY and Dvar.ui_cryptolegendarydupes:exists() then
			return tonumber( Dvar.ui_cryptolegendarydupes:get() )
		elseif f33_arg1 == CoD.BlackMarketUtility.DropTypes.EPIC and Dvar.ui_cryptoepicdupes:exists() then
			return tonumber( Dvar.ui_cryptoepicdupes:get() )
		end
	end
	return 0
end

local f0_local1 = {
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
		"t7_callingcard_mp_darkops_100percenter",
		"calling_card",
		"common"
	},
	{
		"t7_callingcard_mp_darkops_brutalkiller",
		"calling_card",
		"common"
	},
	{
		"t7_callingcard_mp_darkops_calamity",
		"calling_card",
		"common"
	},
	{
		"t7_callingcard_mp_darkops_chainkiller",
		"calling_card",
		"common"
	},
	{
		"t7_callingcard_mp_darkops_drlung",
		"calling_card",
		"common"
	},
	{
		"t7_callingcard_mp_darkops_finishthejob",
		"calling_card",
		"common"
	},
	{
		"t7_callingcard_mp_darkops_frenzykiller",
		"calling_card",
		"common"
	},
	{
		"t7_callingcard_mp_darkops_megakiller",
		"calling_card",
		"common"
	},
	{
		"t7_callingcard_mp_darkops_nuclearkiller",
		"calling_card",
		"common"
	},
	{
		"t7_callingcard_mp_darkops_nukedout",
		"calling_card",
		"common"
	},
	{
		"t7_callingcard_mp_darkops_obtained",
		"calling_card",
		"common"
	},
	{
		"t7_callingcard_mp_darkops_relentlesskiller1",
		"calling_card",
		"common"
	},
	{
		"t7_callingcard_mp_darkops_superkiller",
		"calling_card",
		"common"
	},
	{
		"t7_callingcard_mp_darkops_trickshot",
		"calling_card",
		"rare"
	},
	{
		"t7_callingcard_mp_darkops_ultrakiller",
		"calling_card",
		"legendary"
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
	{
		"acv_extbarrel_shotgun_fullauto",
		"attachment_variant",
		"legendary"
	}
}
CoD.BlackMarketUtility.DoCryptoKeyAnimationSequenceStage = function ( f34_arg0, f34_arg1, f34_arg2, f34_arg3, f34_arg4 )
	f34_arg0.cryptokeyProgressForNewKey:setShaderVector( 0, f34_arg2 / CoD.BlackMarketUtility.XPPerCryptoKey, 0, 0, 0 )
	f34_arg0:playClip( "NewKey" )
	f34_arg0.cryptokeyProgressForNewKey:setShaderVector( 0, 1, 0, 0, 0 )
	f34_arg0:registerEventHandler( "clip_over", function ( element, event )
		f34_arg3 = f34_arg3 - CoD.BlackMarketUtility.XPPerCryptoKey
		if CoD.BlackMarketUtility.XPPerCryptoKey <= f34_arg3 then
			f34_arg2 = 0
			CoD.BlackMarketUtility.DoCryptoKeyAnimationSequenceStage( f34_arg0, f34_arg1, f34_arg2, f34_arg3, f34_arg4 )
		else
			f34_arg0.cryptokeyProgressForNewKey:setShaderVector( 0, 0, 0, 0, 0 )
			f34_arg0:playClip( "NewXPNoNewKey" )
			f34_arg0.cryptokeyProgressForNewKey:setShaderVector( 0, f34_arg3 / CoD.BlackMarketUtility.XPPerCryptoKey, 0, 0, 0 )
			f34_arg0:registerEventHandler( "clip_over", function ( element, event )
				f34_arg0:registerEventHandler( "clip_over", CoD.NullFunction )
				f34_arg0:playClip( "DefaultClip" )
				if f34_arg4 then
					f34_arg4()
				end
			end )
		end
	end )
end

CoD.BlackMarketUtility.DoCryptoKeyAnimationSequence = function ( f37_arg0, f37_arg1, f37_arg2, f37_arg3, f37_arg4 )
	if f37_arg3 < CoD.BlackMarketUtility.XPPerCryptoKey then
		f37_arg0.cryptokeyProgressForNewKey:setShaderVector( 0, f37_arg2 / CoD.BlackMarketUtility.XPPerCryptoKey, 0, 0, 0 )
		f37_arg0:playClip( "NewXPNoNewKey" )
		f37_arg0.cryptokeyProgressForNewKey:setShaderVector( 0, f37_arg3 / CoD.BlackMarketUtility.XPPerCryptoKey, 0, 0, 0 )
		f37_arg0:registerEventHandler( "clip_over", function ( element, event )
			f37_arg0:registerEventHandler( "clip_over", CoD.NullFunction )
			f37_arg0:playClip( "DefaultClip" )
			if f37_arg4 then
				f37_arg4()
			end
		end )
	else
		CoD.BlackMarketUtility.DoCryptoKeyAnimationSequenceStage( f37_arg0, f37_arg1, f37_arg2, f37_arg3, f37_arg4 )
	end
end

CoD.BlackMarketUtility.HasShownAARCryptoKeyAnimation = false
CoD.BlackMarketUtility.DoAARCryptoKeyAnimation = function ( f39_arg0, f39_arg1 )
	CoD.BlackMarketUtility.HasShownAARCryptoKeyAnimation = false
	if CoD.BlackMarketUtility.HasShownAARCryptoKeyAnimation and not CoD.AARUtility.UseTestData() then
		return 
	end
	local f39_local0 = CoD.GetPlayerStats( f39_arg1 )
	if (not f39_local0 or not f39_local0.AfterActionReportStats or not f39_local0.AfterActionReportStats.cryptoKeysBeforeMatch) and not CoD.AARUtility.UseTestData() then
		return 
	end
	local f39_local1 = 0
	local f39_local2 = 0
	local f39_local3 = 0
	if CoD.AARUtility.UseTestData() then
		f39_local1 = CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f39_arg1 )
		f39_local2 = CoD.BlackMarketUtility.GetProgressTowardNextKey( f39_arg1 ) * CoD.BlackMarketUtility.XPPerCryptoKey
		f39_local3 = 33
	else
		local f39_local4 = f39_local0.AfterActionReportStats
		f39_local1 = f39_local4.cryptoKeysBeforeMatch:get()
		f39_local2 = f39_local4.lootXPBeforeMatch:get()
		f39_local3 = f39_local4.lootXPEarned:get()
	end
	local f39_local4 = f39_local2 + f39_local3
	if LUI.DEV and Dvar.ui_cryptokeys:exists() and Dvar.ui_cryptokeyprogress:exists() then
		if CoD.BlackMarketUtility.XPPerCryptoKey < f39_local4 then
			Dvar.ui_cryptokeys:set( Dvar.ui_cryptokeys:get() + 1 )
		end
		Dvar.ui_cryptokeyprogress:set( f39_local4 % CoD.BlackMarketUtility.XPPerCryptoKey / CoD.BlackMarketUtility.XPPerCryptoKey )
		DataSources.CryptoKeyProgress.getModel( f39_arg1 )
	end
	CoD.BlackMarketUtility.DoCryptoKeyAnimationSequence( f39_arg0, f39_arg1, f39_local2, f39_local4, function ()
		CoD.BlackMarketUtility.HasShownAARCryptoKeyAnimation = true
	end )
end

CoD.BlackMarketUtility.DoBurnCryptoKeyAnimation = function ( f41_arg0, f41_arg1, f41_arg2, f41_arg3, f41_arg4 )
	CoD.BlackMarketUtility.DoCryptoKeyAnimationSequence( f41_arg0, f41_arg1, f41_arg2, f41_arg3, f41_arg4 )
end

CoD.BlackMarketUtility.GetFakeItem = function ( f42_arg0 )
	return f0_local1[math.random( 1, #f0_local1 )]
end

CoD.BlackMarketUtility.SpendKeysForCrate = function ( f43_arg0, f43_arg1 )
	if LUI.DEV and Dvar.ui_cryptokeys:exists() then
		Dvar.ui_cryptokeys:set( tonumber( Dvar.ui_cryptokeys:get() ) - f43_arg1 )
	end
end

CoD.BlackMarketUtility.GetNumDupesTotal = function ( f44_arg0 )
	return CoD.BlackMarketUtility.GetNumDupesForType( f44_arg0, CoD.BlackMarketUtility.DropTypes.COMMON ) + CoD.BlackMarketUtility.GetNumDupesForType( f44_arg0, CoD.BlackMarketUtility.DropTypes.RARE ) + CoD.BlackMarketUtility.GetNumDupesForType( f44_arg0, CoD.BlackMarketUtility.DropTypes.LEGENDARY ) + CoD.BlackMarketUtility.GetNumDupesForType( f44_arg0, CoD.BlackMarketUtility.DropTypes.EPIC )
end

CoD.BlackMarketUtility.GetXPEarnedForBurning = function ( f45_arg0, f45_arg1, f45_arg2, f45_arg3, f45_arg4 )
	return f45_arg1 * CoD.BlackMarketUtility.BurnReturnXP[CoD.BlackMarketUtility.DropTypes.COMMON] + f45_arg2 * CoD.BlackMarketUtility.BurnReturnXP[CoD.BlackMarketUtility.DropTypes.RARE] + f45_arg3 * CoD.BlackMarketUtility.BurnReturnXP[CoD.BlackMarketUtility.DropTypes.LEGENDARY] + f45_arg4 * CoD.BlackMarketUtility.BurnReturnXP[CoD.BlackMarketUtility.DropTypes.EPIC]
end

CoD.BlackMarketUtility.GetNumKeysEarnedForBurning = function ( f46_arg0, f46_arg1, f46_arg2, f46_arg3, f46_arg4 )
	return math.floor( (CoD.BlackMarketUtility.GetProgressTowardNextKey( f46_arg0 ) * CoD.BlackMarketUtility.XPPerCryptoKey + CoD.BlackMarketUtility.GetXPEarnedForBurning( f46_arg0, f46_arg1, f46_arg2, f46_arg3, f46_arg4 )) / CoD.BlackMarketUtility.XPPerCryptoKey )
end

CoD.BlackMarketUtility.GetItemQuantity = function ( f47_arg0, f47_arg1 )
	return Engine.GetLootItemQuantity( f47_arg0, f47_arg1, Enum.eModes.MODE_MULTIPLAYER )
end

CoD.BlackMarketUtility.UnlockedByPrerequisites = function ( f48_arg0, f48_arg1 )
	return Engine.IsLootItemUnlockedByPreRequisites( f48_arg0, f48_arg1, Enum.eModes.MODE_MULTIPLAYER )
end

CoD.BlackMarketUtility.IsItemLocked = function ( f49_arg0, f49_arg1 )
	if f49_arg1 then
		local f49_local0 = CoD.BlackMarketUtility.GetItemQuantity( f49_arg0, f49_arg1 )
		if f49_local0 == nil then
			local f49_local1 = CoD.BlackMarketUtility.UnlockedByPrerequisites( f49_arg0, f49_arg1 )
			if f49_local1 ~= nil then
				return not f49_local1
			end
		end
		if f49_local0 == nil or f49_local0 == 0 then
			return true
		else
			return false
		end
	else
		return false
	end
end

CoD.BlackMarketUtility.ClassifiedName = function ( f50_arg0 )
	local f50_local0 = "MENU_CLASSIFIED"
	if f50_arg0 then
		return Engine.Localize( f50_local0 )
	else
		return f50_local0
	end
end

CoD.BlackMarketUtility.GetCallingCardSetTable = function ( f51_arg0 )
	for f51_local3, f51_local4 in ipairs( CoD.BlackMarketUtility.CallingCardsTable ) do
		if f51_local4.name == f51_arg0 then
			return f51_local4
		end
	end
end

CoD.BlackMarketUtility.GetCallingCardRows = function ()
	return Engine.TableFindRows( CoD.BlackMarketUtility.lootTableName, 2, "calling_card" )
end

CoD.BlackMarketUtility.BuildCallingCardSets = function ( f53_arg0 )
	CoD.BlackMarketUtility.CallingCardsTable = {}
	CoD.BlackMarketUtility.CommonCallingCardsTable = {}
	local f53_local0 = {}
	local f53_local1 = {}
	local f53_local2 = "calling_card"
	local f53_local3 = 0
	local f53_local4 = 4
	local f53_local5 = 5
	local f53_local6 = CoD.BlackMarketUtility.GetCallingCardRows()
	local f53_local7 = 0
	local f53_local8 = 0
	local f53_local9 = 0
	for f53_local16, f53_local17 in ipairs( f53_local6 ) do
		local f53_local18 = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, f53_local17, f53_local3 )
		local f53_local19 = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, f53_local17, f53_local4 )
		local f53_local20 = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, f53_local17, f53_local5 )
		local f53_local21 = CoD.BlackMarketUtility.GetCallingCardTitleFromImage( f53_local18 )
		local f53_local22 = CoD.BlackMarketUtility.GetLootCallingCardIndex( f53_arg0, f53_local18 )
		local f53_local23 = CoD.BlackMarketUtility.GetRarityForLootItemFromName( f53_local18 )
		if f53_local19 ~= "" then
			if not f53_local1[f53_local19] then
				f53_local1[f53_local19] = {}
			end
			table.insert( f53_local1[f53_local19], {
				title = f53_local21,
				name = f53_local18,
				rarity = f53_local23,
				iconId = f53_local22,
				sortKey = CoD.BlackMarketUtility.GetCallingCardSortKeyFromImage( f53_local18 ),
				isBMClassified = CoD.BlackMarketUtility.IsItemLocked( f53_arg0, f53_local18 )
			} )
		end
		if f53_local20 ~= "" then
			local f53_local13 = {}
			local f53_local14 = CoD.BlackMarketUtility.GetRarityForCallingCardSetFromSetName( f53_local20 )
			local f53_local15 = nil
			f53_local13.name = f53_local20
			f53_local13.title = f53_local21
			f53_local13.setCount = CoD.BlackMarketUtility.GetSetPieceStringForLootSet( f53_arg0, f53_local20, f53_local2 )
			f53_local15, f53_local13.totalSetCount, f53_local13.newCount = CoD.BlackMarketUtility.GetNumOwnedAndTotalForCallingCardSet( f53_arg0, f53_local20 )
			f53_local13.iconId = 0
			f53_local13.masterCardIconId = f53_local22
			f53_local13.rarity = f53_local14
			if Engine.IsEmblemBackgroundNew( f53_arg0, f53_local22 ) then
				f53_local13.newCount = f53_local13.newCount + 1
			end
			table.insert( f53_local0, f53_local13 )
		end
		f53_local7 = f53_local7 + 1
		local f53_local13 = CoD.BlackMarketUtility.IsItemLocked( f53_arg0, f53_local18 )
		if not f53_local13 then
			f53_local8 = f53_local8 + 1
		end
		local f53_local14 = Engine.TableLookup( f53_arg0, CoD.BlackMarketUtility.backgroundsTable, 3, f53_local18, 1 )
		if f53_local14 and Engine.IsEmblemBackgroundNew( f53_arg0, f53_local14 ) then
			f53_local9 = f53_local9 + 1
		end
		table.insert( CoD.BlackMarketUtility.CommonCallingCardsTable, {
			title = f53_local21,
			name = f53_local18,
			rarity = f53_local23,
			iconId = f53_local22,
			isBMClassified = f53_local13
		} )
	end
	for f53_local16, f53_local17 in pairs( f53_local0 ) do
		if f53_local1[f53_local17.name] then
			f53_local17.callingCards = f53_local1[f53_local17.name]
			local f53_local18 = true
			local f53_local19 = false
			for f53_local23, f53_local13 in ipairs( f53_local17.callingCards ) do
				if f53_local13.isBMClassified == false then
					f53_local18 = false
					if f53_local17.iconId == 0 then
						f53_local17.iconId = CoD.BlackMarketUtility.GetLootCallingCardIndex( f53_arg0, f53_local13.name )
					end
				end
				f53_local19 = true
			end
			f53_local17.isBMClassified = f53_local19
			f53_local17.isSetBMClassified = f53_local18
		end
	end
	table.sort( f53_local0, CoD.BlackMarketUtility.SortUnlockIconId )
	CoD.BlackMarketUtility.CallingCardsTable = f53_local0
	return f53_local8, f53_local8 .. " / " .. f53_local7, f53_local9
end

CoD.BlackMarketUtility.SortUnlockIconId = function ( f54_arg0, f54_arg1 )
	if f54_arg0.isSetBMClassified ~= f54_arg1.isSetBMClassified then
		return f54_arg1.isSetBMClassified
	else
		return f54_arg0.iconId < f54_arg1.iconId
	end
end

CoD.BlackMarketUtility.SortUnlocksModelIconId = function ( f55_arg0, f55_arg1 )
	if f55_arg0.models.isBMClassified ~= f55_arg1.models.isBMClassified then
		return f55_arg1.models.isBMClassified
	else
		return f55_arg0.models.iconId < f55_arg1.models.iconId
	end
end

CoD.BlackMarketUtility.SortUnlocksPropertyIndex = function ( f56_arg0, f56_arg1 )
	if f56_arg0.models.isBMClassified ~= f56_arg1.models.isBMClassified then
		return f56_arg1.models.isBMClassified
	else
		return f56_arg0.properties.index < f56_arg1.properties.index
	end
end

CoD.BlackMarketUtility.SortUnlocksPropertyVariantIndex = function ( f57_arg0, f57_arg1 )
	if f57_arg0.models.isBMClassified ~= f57_arg1.models.isBMClassified then
		return f57_arg1.models.isBMClassified
	else
		return f57_arg0.properties.variantIndex < f57_arg1.properties.variantIndex
	end
end

CoD.BlackMarketUtility.SortUnlocksModelIconID = function ( f58_arg0, f58_arg1 )
	local f58_local0 = Engine.GetModelValue( Engine.GetModel( f58_arg0, "isBMClassified" ) )
	local f58_local1 = Engine.GetModelValue( Engine.GetModel( f58_arg1, "isBMClassified" ) )
	if f58_local0 ~= f58_local1 then
		return f58_local1
	else
		return Engine.GetModelValue( Engine.GetModel( f58_arg0, "iconID" ) ) < Engine.GetModelValue( Engine.GetModel( f58_arg1, "iconID" ) )
	end
end

CoD.BlackMarketUtility.SortUnlocksModelWOSubIndex = function ( f59_arg0, f59_arg1 )
	local f59_local0 = Engine.GetModelValue( Engine.GetModel( f59_arg0, "isBMClassified" ) )
	local f59_local1 = Engine.GetModelValue( Engine.GetModel( f59_arg1, "isBMClassified" ) )
	if f59_local0 ~= f59_local1 then
		return f59_local1
	else
		return Engine.GetModelValue( Engine.GetModel( f59_arg0, "weaponOptionSubIndex" ) ) < Engine.GetModelValue( Engine.GetModel( f59_arg1, "weaponOptionSubIndex" ) )
	end
end

