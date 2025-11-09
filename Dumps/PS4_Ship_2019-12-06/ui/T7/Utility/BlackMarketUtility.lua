require( "lua.Shared.LuaEnums" )

CoD.BlackMarketUtility = {}
CoD.BlackMarketUtility.CurrentPromotionIndex = 0
CoD.BlackMarketUtility.DropTypes = {
	COMMON = Enum.LootCrateType.LOOT_CRATE_TYPE_COMMON,
	RARE = Enum.LootCrateType.LOOT_CRATE_TYPE_RARE,
	BRIBE = Enum.LootCrateType.LOOT_CRATE_TYPE_BRIBE,
	LEGENDARY = 3,
	EPIC = 4,
	BUNDLE = 5,
	INCENTIVE_WEAPON_BUNDLE = 6,
	INCENTIVE_RARE_BUNDLE = 7,
	TRADE_KEYS_FOR_VIALS = 8,
	TRIFECTA = 9,
	NO_DUPES_RANGE = 10,
	NO_DUPES_MELEE = 11,
	SIX_PACK = 12,
	DAILY_DOUBLE = 13,
	DAILY_DOUBLE_RARE_BUNDLE = 14,
	HUNDRED_BUNDLE = 15,
	LIMITED = 16,
	BUNDLE_EXPERIMENT = 17,
	NO_DUPES_CRATE = 18,
	NO_DUPES_BUNDLE = 19,
	CODE_BUNDLE = 20,
	GRAND_SLAM = 21,
	WEAPON_3X = 22,
	LIMITED_EDITION_CAMO = 23,
	RARE_BUNDLE_10FOR5 = 24
}
CoD.BlackMarketUtility.CrateTypeStrings = {
	[CoD.BlackMarketUtility.DropTypes.COMMON] = "MPUI_BM_COMMON",
	[CoD.BlackMarketUtility.DropTypes.RARE] = "MPUI_BM_RARE",
	[CoD.BlackMarketUtility.DropTypes.BRIBE] = "MPUI_BM_BRIBE",
	[CoD.BlackMarketUtility.DropTypes.LEGENDARY] = "MPUI_BM_LEGENDARY",
	[CoD.BlackMarketUtility.DropTypes.EPIC] = "MPUI_BM_EPIC",
	[CoD.BlackMarketUtility.DropTypes.BUNDLE] = "MPUI_BM_BUNDLE",
	[CoD.BlackMarketUtility.DropTypes.INCENTIVE_WEAPON_BUNDLE] = "rare",
	[CoD.BlackMarketUtility.DropTypes.INCENTIVE_RARE_BUNDLE] = "rare",
	[CoD.BlackMarketUtility.DropTypes.TRADE_KEYS_FOR_VIALS] = "vials",
	[CoD.BlackMarketUtility.DropTypes.TRIFECTA] = "trifecta",
	[CoD.BlackMarketUtility.DropTypes.NO_DUPES_RANGE] = "rare",
	[CoD.BlackMarketUtility.DropTypes.NO_DUPES_MELEE] = "rare",
	[CoD.BlackMarketUtility.DropTypes.SIX_PACK] = "MPUI_BM_SIX_PACK",
	[CoD.BlackMarketUtility.DropTypes.DAILY_DOUBLE] = "MPUI_BM_DAILY_DOUBLE",
	[CoD.BlackMarketUtility.DropTypes.DAILY_DOUBLE_RARE_BUNDLE] = "rare",
	[CoD.BlackMarketUtility.DropTypes.HUNDRED_BUNDLE] = "MPUI_BM_BUNDLE",
	[CoD.BlackMarketUtility.DropTypes.RARE_BUNDLE_10FOR5] = "MPUI_BM_BUNDLE",
	[CoD.BlackMarketUtility.DropTypes.LIMITED] = "MPUI_BM_LIMITED",
	[CoD.BlackMarketUtility.DropTypes.BUNDLE_EXPERIMENT] = "MPUI_BM_BUNDLE_EXPERIMENT",
	[CoD.BlackMarketUtility.DropTypes.NO_DUPES_CRATE] = "MPUI_BM_NO_DUPES_CRATE",
	[CoD.BlackMarketUtility.DropTypes.NO_DUPES_BUNDLE] = "MPUI_BM_BUNDLE",
	[CoD.BlackMarketUtility.DropTypes.CODE_BUNDLE] = "MPUI_BM_BUNDLE",
	[CoD.BlackMarketUtility.DropTypes.GRAND_SLAM] = "grandslam",
	[CoD.BlackMarketUtility.DropTypes.WEAPON_3X] = "weapon3x",
	[CoD.BlackMarketUtility.DropTypes.LIMITED_EDITION_CAMO] = "limitededitioncamo"
}
CoD.BlackMarketUtility.CrateTypeSupplyDropStrings = {
	[CoD.BlackMarketUtility.DropTypes.COMMON] = "MPUI_BM_COMMON_DROP",
	[CoD.BlackMarketUtility.DropTypes.RARE] = "MPUI_BM_RARE_DROP",
	[CoD.BlackMarketUtility.DropTypes.BRIBE] = "MPUI_BM_BRIBE_DROP",
	[CoD.BlackMarketUtility.DropTypes.BUNDLE] = "MPUI_BM_BUNDLE_PROMO_TITLE"
}
CoD.BlackMarketUtility.CrateTypeIds = {
	[CoD.BlackMarketUtility.DropTypes.COMMON] = "common",
	[CoD.BlackMarketUtility.DropTypes.RARE] = "rare",
	[CoD.BlackMarketUtility.DropTypes.BRIBE] = "bribe",
	[CoD.BlackMarketUtility.DropTypes.LEGENDARY] = "legendary",
	[CoD.BlackMarketUtility.DropTypes.EPIC] = "epic",
	[CoD.BlackMarketUtility.DropTypes.BUNDLE] = "bundle",
	[CoD.BlackMarketUtility.DropTypes.INCENTIVE_WEAPON_BUNDLE] = "rare",
	[CoD.BlackMarketUtility.DropTypes.INCENTIVE_RARE_BUNDLE] = "rare",
	[CoD.BlackMarketUtility.DropTypes.TRADE_KEYS_FOR_VIALS] = "vials",
	[CoD.BlackMarketUtility.DropTypes.TRIFECTA] = "trifecta",
	[CoD.BlackMarketUtility.DropTypes.NO_DUPES_RANGE] = "rare",
	[CoD.BlackMarketUtility.DropTypes.NO_DUPES_MELEE] = "rare",
	[CoD.BlackMarketUtility.DropTypes.SIX_PACK] = "sixpack",
	[CoD.BlackMarketUtility.DropTypes.DAILY_DOUBLE] = "dailydouble",
	[CoD.BlackMarketUtility.DropTypes.DAILY_DOUBLE_RARE_BUNDLE] = "rare",
	[CoD.BlackMarketUtility.DropTypes.HUNDRED_BUNDLE] = "rare",
	[CoD.BlackMarketUtility.DropTypes.RARE_BUNDLE_10FOR5] = "rare",
	[CoD.BlackMarketUtility.DropTypes.LIMITED] = "limited",
	[CoD.BlackMarketUtility.DropTypes.BUNDLE_EXPERIMENT] = "rare",
	[CoD.BlackMarketUtility.DropTypes.NO_DUPES_CRATE] = "rare",
	[CoD.BlackMarketUtility.DropTypes.NO_DUPES_BUNDLE] = "rare",
	[CoD.BlackMarketUtility.DropTypes.CODE_BUNDLE] = "rare",
	[CoD.BlackMarketUtility.DropTypes.GRAND_SLAM] = "grandslam",
	[CoD.BlackMarketUtility.DropTypes.WEAPON_3X] = "rare",
	[CoD.BlackMarketUtility.DropTypes.LIMITED_EDITION_CAMO] = "rare"
}
CoD.BlackMarketUtility.CrateTypeRevealAlias = {
	[CoD.BlackMarketUtility.DropTypes.RARE] = "uin_bm_cycle_item_rare_layer",
	[CoD.BlackMarketUtility.DropTypes.LEGENDARY] = "uin_bm_cycle_item_legend_layer",
	[CoD.BlackMarketUtility.DropTypes.EPIC] = "uin_bm_cycle_item_epic_layer",
	[CoD.BlackMarketUtility.DropTypes.LIMITED] = "uin_bm_cycle_item_ltd_layer"
}
CoD.BlackMarketUtility.BribeSpecialistIndices = {
	[20] = 3,
	[21] = 8,
	[22] = 5,
	[23] = 1,
	[24] = 2,
	[25] = 6,
	[26] = 0,
	[27] = 4,
	[28] = 7,
	[29] = 9
}
CoD.BlackMarketUtility.LocalizeForHeroBribe = function ( f1_arg0, f1_arg1 )
	local f1_local0 = Engine.GetHeroName( Enum.eModes.MODE_MULTIPLAYER, CoD.BlackMarketUtility.BribeSpecialistIndices[f1_arg0] )
	return Engine.Localize( f1_arg1, f1_local0, f1_local0 )
end

CoD.BlackMarketUtility.BribeStrings = {
	[3] = "MPUI_BM_BRIBE_OUTFIT",
	[4] = "MPUI_BM_BRIBE_CALLINGCARD",
	[5] = "MPUI_BM_BRIBE_TAUNTS",
	[6] = "MPUI_BM_BRIBE_GESTURES",
	[7] = "MPUI_BM_BRIBE_ATTACHMENT_VARIANT",
	[8] = "MPUI_BM_BRIBE_CALLINGCARD_SET",
	[9] = "MPUI_BM_BRIBE_OUTFIT",
	[20] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 20, "MPUI_BM_SPECIALIST_ITEM_BRIBE" ),
	[21] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 21, "MPUI_BM_SPECIALIST_ITEM_BRIBE" ),
	[22] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 22, "MPUI_BM_SPECIALIST_ITEM_BRIBE" ),
	[23] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 23, "MPUI_BM_SPECIALIST_ITEM_BRIBE" ),
	[24] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 24, "MPUI_BM_SPECIALIST_ITEM_BRIBE" ),
	[25] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 25, "MPUI_BM_SPECIALIST_ITEM_BRIBE" ),
	[26] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 26, "MPUI_BM_SPECIALIST_ITEM_BRIBE" ),
	[27] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 27, "MPUI_BM_SPECIALIST_ITEM_BRIBE" ),
	[28] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 28, "MPUI_BM_SPECIALIST_ITEM_BRIBE" ),
	[29] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 29, "MPUI_BM_SPECIALIST_ITEM_BRIBE" ),
	[40] = "MPUI_BM_BRIBE_CALLINGCARD_TRIPLE",
	[52] = "MPUI_BM_BRIBE_OUTFIT_TRIPLE"
}
CoD.BlackMarketUtility.BribeDescriptions = {
	[3] = "MPUI_BM_BRIBE_OUTFIT_DESC",
	[4] = "MPUI_BM_BRIBE_CALLINGCARD_DESC",
	[40] = "MPUI_BM_BRIBE_CALLINGCARD_TRIPLE_DESC",
	[52] = "MPUI_BM_BRIBE_OUTFIT_TRIPLE_DESC"
}
CoD.BlackMarketUtility.BribeTitles = {
	[3] = "MPUI_BM_BRIBE_OUTFIT_PROMO_TITLE",
	[4] = "MPUI_BM_BRIBE_CALLINGCARD_PROMO_TITLE",
	[5] = "MPUI_BM_BRIBE_TAUNTS_PROMO_TITLE",
	[6] = "MPUI_BM_BRIBE_GESTURES_PROMO_TITLE",
	[7] = "MPUI_BM_BRIBE_ATTACHMENT_VARIANT_PROMO_TITLE",
	[8] = "MPUI_BM_BRIBE_CALLINGCARD_SET_PROMO_TITLE",
	[9] = "MPUI_BM_BRIBE_OUTFIT_PROMO_TITLE",
	[20] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 20, "MPUI_BM_SPECIALIST_ITEM_BRIBE_PROMO_TITLE" ),
	[21] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 21, "MPUI_BM_SPECIALIST_ITEM_BRIBE_PROMO_TITLE" ),
	[22] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 22, "MPUI_BM_SPECIALIST_ITEM_BRIBE_PROMO_TITLE" ),
	[23] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 23, "MPUI_BM_SPECIALIST_ITEM_BRIBE_PROMO_TITLE" ),
	[24] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 24, "MPUI_BM_SPECIALIST_ITEM_BRIBE_PROMO_TITLE" ),
	[25] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 25, "MPUI_BM_SPECIALIST_ITEM_BRIBE_PROMO_TITLE" ),
	[26] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 26, "MPUI_BM_SPECIALIST_ITEM_BRIBE_PROMO_TITLE" ),
	[27] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 27, "MPUI_BM_SPECIALIST_ITEM_BRIBE_PROMO_TITLE" ),
	[28] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 28, "MPUI_BM_SPECIALIST_ITEM_BRIBE_PROMO_TITLE" ),
	[29] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 29, "MPUI_BM_SPECIALIST_ITEM_BRIBE_PROMO_TITLE" ),
	[40] = "MPUI_BM_BRIBE_CALLINGCARD_TRIPLE_PROMO_TITLE",
	[52] = "MPUI_BM_BRIBE_OUTFIT_TRIPLE_PROMO_TITLE"
}
CoD.BlackMarketUtility.BribeHints = {
	[3] = "MPUI_BM_BRIBE_OUTFIT_HINT",
	[4] = "MPUI_BM_BRIBE_CALLINGCARD_HINT",
	[5] = "MPUI_BM_BRIBE_TAUNTS_HINT",
	[6] = "MPUI_BM_BRIBE_GESTURES_HINT",
	[7] = "MPUI_BM_BRIBE_ATTACHMENT_VARIANT_HINT",
	[8] = "MPUI_BM_BRIBE_CALLINGCARD_SET_HINT",
	[9] = "MPUI_BM_BRIBE_OUTFIT_HINT",
	[40] = "MPUI_BM_BRIBE_CALLINGCARD_TRIPLE_HINT",
	[52] = "MPUI_BM_BRIBE_OUTFIT_TRIPLE_HINT"
}
CoD.BlackMarketUtility.BribeImages = {
	[3] = "uie_t7_blackmarket_crate_bribe_chip",
	[4] = "t7_blackmarket_crate_bribe_chip_callingcard",
	[5] = "t7_blackmarket_crate_bribe_chip_taunt",
	[6] = "t7_blackmarket_crate_bribe_chip_gesture",
	[7] = "t7_blackmarket_crate_bribe_chip_attach",
	[8] = "t7_blackmarket_crate_bribe_chip_callingcard_color",
	[9] = "uie_t7_blackmarket_crate_bribe_chip",
	[20] = "uie_t7_blackmarket_crate_bribe_chip",
	[21] = "uie_t7_blackmarket_crate_bribe_chip",
	[22] = "uie_t7_blackmarket_crate_bribe_chip",
	[23] = "uie_t7_blackmarket_crate_bribe_chip",
	[24] = "uie_t7_blackmarket_crate_bribe_chip",
	[25] = "uie_t7_blackmarket_crate_bribe_chip",
	[26] = "uie_t7_blackmarket_crate_bribe_chip",
	[27] = "uie_t7_blackmarket_crate_bribe_chip",
	[28] = "uie_t7_blackmarket_crate_bribe_chip",
	[29] = "uie_t7_blackmarket_crate_bribe_chip",
	[40] = "t7_blackmarket_crate_bribe_chip_callingcard",
	[52] = "uie_t7_blackmarket_crate_bribe_chip"
}
CoD.BlackMarketUtility.BribePromoImages = {
	[3] = "uie_t7_blackmarket_promo_bribe",
	[4] = "t7_blackmarket_promo_bribe_callingcard",
	[5] = "t7_blackmarket_promo_bribe_taunt",
	[6] = "t7_blackmarket_promo_bribe_gesture",
	[7] = "t7_blackmarket_promo_bribe_attach",
	[8] = "t7_blackmarket_promo_bribe_callingcard_color",
	[9] = "uie_t7_blackmarket_promo_bribe",
	[20] = "uie_t7_blackmarket_promo_bribe",
	[21] = "uie_t7_blackmarket_promo_bribe",
	[22] = "uie_t7_blackmarket_promo_bribe",
	[23] = "uie_t7_blackmarket_promo_bribe",
	[24] = "uie_t7_blackmarket_promo_bribe",
	[25] = "uie_t7_blackmarket_promo_bribe",
	[26] = "uie_t7_blackmarket_promo_bribe",
	[27] = "uie_t7_blackmarket_promo_bribe",
	[28] = "uie_t7_blackmarket_promo_bribe",
	[29] = "uie_t7_blackmarket_promo_bribe",
	[40] = "t7_blackmarket_promo_bribe_callingcard",
	[52] = "uie_t7_blackmarket_promo_bribe"
}
CoD.BlackMarketUtility.BribePopupTitles = {
	[3] = "MPUI_BM_BRIBE_POPUP_OUTFIT_TITLE",
	[4] = "MPUI_BM_BRIBE_POPUP_CALLINGCARD_TITLE",
	[5] = "MPUI_BM_BRIBE_POPUP_TAUNTS_TITLE",
	[6] = "MPUI_BM_BRIBE_POPUP_GESTURES_TITLE",
	[7] = "MPUI_BM_BRIBE_POPUP_ATTACHMENT_VARIANT_TITLE",
	[8] = "MPUI_BM_BRIBE_POPUP_CALLINGCARD_SET_TITLE",
	[9] = "MPUI_BM_BRIBE_POPUP_OUTFIT_TITLE",
	[20] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 20, "MPUI_BM_SPECIALIST_ITEM_BRIBE_POPUP_TITLE" ),
	[21] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 21, "MPUI_BM_SPECIALIST_ITEM_BRIBE_POPUP_TITLE" ),
	[22] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 22, "MPUI_BM_SPECIALIST_ITEM_BRIBE_POPUP_TITLE" ),
	[23] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 23, "MPUI_BM_SPECIALIST_ITEM_BRIBE_POPUP_TITLE" ),
	[24] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 24, "MPUI_BM_SPECIALIST_ITEM_BRIBE_POPUP_TITLE" ),
	[25] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 25, "MPUI_BM_SPECIALIST_ITEM_BRIBE_POPUP_TITLE" ),
	[26] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 26, "MPUI_BM_SPECIALIST_ITEM_BRIBE_POPUP_TITLE" ),
	[27] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 27, "MPUI_BM_SPECIALIST_ITEM_BRIBE_POPUP_TITLE" ),
	[28] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 28, "MPUI_BM_SPECIALIST_ITEM_BRIBE_POPUP_TITLE" ),
	[29] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 29, "MPUI_BM_SPECIALIST_ITEM_BRIBE_POPUP_TITLE" ),
	[40] = "MPUI_BM_BRIBE_POPUP_CALLINGCARD_TRIPLE_TITLE",
	[52] = "MPUI_BM_BRIBE_POPUP_OUTFIT_TRIPLE_TITLE"
}
CoD.BlackMarketUtility.BribePopupDescriptions = {
	[3] = "MPUI_BM_BRIBE_POPUP_OUTFIT_DESC",
	[4] = "MPUI_BM_BRIBE_POPUP_CALLINGCARD_DESC",
	[5] = "MPUI_BM_BRIBE_POPUP_TAUNTS_DESC",
	[6] = "MPUI_BM_BRIBE_POPUP_GESTURES_DESC",
	[7] = "MPUI_BM_BRIBE_POPUP_ATTACHMENT_VARIANT_DESC",
	[8] = "MPUI_BM_BRIBE_POPUP_CALLINGCARD_SET_DESC",
	[9] = "MPUI_BM_BRIBE_POPUP_OUTFIT_DESC",
	[20] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 20, "MPUI_BM_SPECIALIST_ITEM_BRIBE_POPUP_DESC" ),
	[21] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 21, "MPUI_BM_SPECIALIST_ITEM_BRIBE_POPUP_DESC" ),
	[22] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 22, "MPUI_BM_SPECIALIST_ITEM_BRIBE_POPUP_DESC" ),
	[23] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 23, "MPUI_BM_SPECIALIST_ITEM_BRIBE_POPUP_DESC" ),
	[24] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 24, "MPUI_BM_SPECIALIST_ITEM_BRIBE_POPUP_DESC" ),
	[25] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 25, "MPUI_BM_SPECIALIST_ITEM_BRIBE_POPUP_DESC" ),
	[26] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 26, "MPUI_BM_SPECIALIST_ITEM_BRIBE_POPUP_DESC" ),
	[27] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 27, "MPUI_BM_SPECIALIST_ITEM_BRIBE_POPUP_DESC" ),
	[28] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 28, "MPUI_BM_SPECIALIST_ITEM_BRIBE_POPUP_DESC" ),
	[29] = CoD.BlackMarketUtility.LocalizeForHeroBribe( 29, "MPUI_BM_SPECIALIST_ITEM_BRIBE_POPUP_DESC" ),
	[40] = "MPUI_BM_BRIBE_POPUP_CALLINGCARD_TRIPLE_DESC",
	[52] = "MPUI_BM_BRIBE_POPUP_OUTFIT_TRIPLE_DESC"
}
CoD.BlackMarketUtility.BribeFrameTitle = {
	[3] = "MPUI_BM_BRIBE",
	[4] = "MPUI_BM_BRIBE",
	[5] = "MPUI_BM_BRIBE",
	[6] = "MPUI_BM_BRIBE",
	[7] = "MPUI_BM_BRIBE",
	[8] = "MPUI_BM_BRIBE",
	[9] = "MPUI_BM_BRIBE",
	[40] = "MPUI_BM_3_OF_A_KIND",
	[52] = "MPUI_BM_3_OF_A_KIND"
}
CoD.BlackMarketUtility.BundleString = "MPUI_BM_BUNDLE_SUPPLY_DROP"
CoD.BlackMarketUtility.BundleDescription = "MPUI_BM_BUNDLE_DESC"
CoD.BlackMarketUtility.BundleTitle = "MPUI_BM_BUNDLE_PROMO_TITLE"
CoD.BlackMarketUtility.BundleHint = "MPUI_BM_BUNDLE_HINT"
CoD.BlackMarketUtility.BundleImage = "uie_t7_blackmarket_crate_bundle"
CoD.BlackMarketUtility.SeasonPassRewardImage = "uie_t7_icon_seasonpassreward"
CoD.BlackMarketUtility.SeasonPassRewardTitle = "MPUI_BM_INCENTIVE_SEASONPASS_TITLE"
CoD.BlackMarketUtility.SeasonPassRewardDesc = "MPUI_BM_INCENTIVE_SEASONPASS_DESC"
CoD.BlackMarketUtility.PrestigeMasterRewardImage = "uie_t7_icon_prestigemasterreward"
CoD.BlackMarketUtility.PrestigeMasterRewardTitle = "MPUI_BM_INCENTIVE_MASTERREWARD_TITLE"
CoD.BlackMarketUtility.PrestigeMasterRewardDesc = "MPUI_BM_INCENTIVE_MASTERREWARD_DESC"
CoD.BlackMarketUtility.IncentiveWeaponBundleTitle = "MPUI_BM_INCENTIVE_WEAPONBRIBE_TITLE"
CoD.BlackMarketUtility.IncentiveWeaponBundleHint = "MPUI_BM_INCENTIVE_WEAPONBRIBE_REMAINING"
CoD.BlackMarketUtility.IncentiveRareBundleTitle = "MPUI_BM_INCENTIVE_BUNDLE_TITLE"
CoD.BlackMarketUtility.IncentiveRareBundleHint = "MPUI_BM_INCENTIVE_BUNDLE_REMAINING"
CoD.BlackMarketUtility.HundredBundleTitle = "MPUI_BM_HUNDRED_BUNDLE_PROMO_TITLE"
CoD.BlackMarketUtility.HundredBundleHint = "MPUI_BM_HUNDRED_BUNDLE_HINT"
CoD.BlackMarketUtility.HundredBundleImage = "uie_t7_blackmarket_crate_bundlebig"
CoD.BlackMarketUtility.RareBundle10for5Title = "MPUI_BM_RARE_BUNDLE_10FOR5_PROMO_TITLE"
CoD.BlackMarketUtility.RareBundle10for5Hint = "MPUI_BM_RARE_BUNDLE_10FOR5_HINT"
CoD.BlackMarketUtility.RareBundle10for5Image = "uie_t7_blackmarket_crate_bundlebig"
CoD.BlackMarketUtility.BundleSupplySubtitle = "MPUI_BM_BUNDLE_SUBTITLE"
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
CoD.BlackMarketUtility.loot_hundred_bundle_drop_id = 99057
CoD.BlackMarketUtility.loot_hundred_bundle_sku = 99058
CoD.BlackMarketUtility.loot_hundred_bundle_crate_dwid = 13
CoD.BlackMarketUtility.rare_bundle_10for5_drop_id = 99125
CoD.BlackMarketUtility.rare_bundle_10for5_sku = 99126
CoD.BlackMarketUtility.rare_bundle_10for5_crate_dwid = 51
CoD.BlackMarketUtility.loot_code_bundle_drop_id = 99074
CoD.BlackMarketUtility.loot_code_bundle_crate_dwid = 41
CoD.BlackMarketUtility.loot_grand_slam_sku = 99082
CoD.BlackMarketUtility.loot_grand_slam_drop_id = 99083
CoD.BlackMarketUtility.loot_weapon_3x_drop_id = 99087
CoD.BlackMarketUtility.loot_weapon_3x_crate_dwid = 48
CoD.BlackMarketUtility.loot_limited_edition_camo_drop_id = 99086
CoD.BlackMarketUtility.loot_limited_edition_camo_crate_dwid = 49
CoD.BlackMarketUtility.winter_challenge_sentinel_tier1 = 99117
CoD.BlackMarketUtility.winter_challenge_sentinel_tier2 = 99118
CoD.BlackMarketUtility.winter_challenge_sentinel_tier3 = 99119
CoD.BlackMarketUtility.winter_challenge_sentinel_tier4 = 99120
CoD.BlackMarketUtility.winter_challenge_reward_sku_tier1 = 99121
CoD.BlackMarketUtility.winter_challenge_reward_sku_tier2 = 99122
CoD.BlackMarketUtility.winter_challenge_reward_sku_tier3 = 99123
CoD.BlackMarketUtility.winter_challenge_reward_sku_tier4 = 99124
CoD.BlackMarketUtility.crateTable = "gamedata/loot/loot_crate.csv"
CoD.BlackMarketUtility.lootEmblemTableName = "gamedata/loot/mplootemblems.csv"
CoD.BlackMarketUtility.lootTableName = "gamedata/loot/mplootitems.csv"
CoD.BlackMarketUtility.emblemMaterialsTableName = "gamedata/emblems/emblemMaterials.csv"
CoD.BlackMarketUtility.emblemIconsTableName = "gamedata/emblems/emblemIcons.csv"
CoD.BlackMarketUtility.backgroundsTable = "gamedata/emblems/backgrounds.csv"
CoD.BlackMarketUtility.unreleasedLootTableName = "gamedata/loot/mpUnreleasedLoot.csv"
CoD.BlackMarketUtility.parsedEmblemDDLs = {}
CoD.BlackMarketUtility.SideBetSetName = "t7_fakeloot_callingcard_set_side_bet"
CoD.BlackMarketUtility.CallingCardsTable = {}
CoD.BlackMarketUtility.CommonCallingCardsTable = {}
CoD.BlackMarketUtility.MatchChallengeType = {
	dailyContract = 0,
	weeklyContract = 1,
	dailyAndWeeklyContract = 2
}
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
	special_crossbow = true,
	melee_bat = true,
	melee_bowie = true,
	melee_dagger = true,
	smg_mp40 = true,
	sniper_quickscope = true,
	melee_mace = true,
	melee_fireaxe = true,
	ar_famas = true,
	launcher_multi = true,
	melee_boneglass = true,
	melee_improvise = true,
	pistol_energy = true,
	shotgun_energy = true,
	lmg_infinite = true,
	sniper_double = true,
	ar_peacekeeper = true,
	melee_shockbaton = true,
	melee_nunchuks = true,
	melee_boxing = true,
	melee_katana = true,
	melee_shovel = true,
	smg_nailgun = true,
	special_discgun = true,
	melee_prosthetic = true,
	melee_chainsaw = true,
	ar_pulse = true,
	smg_rechamber = true,
	melee_crescent = true,
	ar_m16 = true,
	smg_ppsh = true,
	ar_galil = true,
	knife_ballistic = true,
	smg_ak74u = true,
	pistol_m1911 = true,
	ar_an94 = true,
	launcher_ex41 = true,
	smg_msmc = true,
	shotgun_olympia = true,
	sniper_xpr50 = true
}
CoD.BlackMarketUtility.LimitedCountItems = {
	camo_loot_nightmare = "archive",
	mtl_t7_camo_loot_patricks_03 = "archive",
	camo_dlc4_pap_04 = "archive",
	camo_cherry_fizz = "archive",
	camo_vip_bubbles = "archive",
	camo_dlc3_pap_var_02 = "active",
	camo_dlc3_pap_var_03 = "active",
	mtl_t7_camo_soviet_winter_blue = "active"
}
CoD.BlackMarketUtility.LootItemImageOverride = {
	camo_loot_nightmare = "t7_icon_blackmarket_promo_valentine",
	mtl_t7_camo_loot_patricks_03 = "t7_icon_blackmarket_promo_patricks",
	camo_dlc4_pap_04 = "t7_icon_blackmarket_promo_punch",
	camo_cherry_fizz = "t7_icon_blackmarket_promo_summer",
	camo_vip_bubbles = "t7_icon_blackmarket_promo_empire",
	camo_dlc3_pap_var_02 = "t7_icon_blackmarket_promo_grandslam_green",
	camo_dlc3_pap_var_03 = "t7_icon_blackmarket_promo_grandslam_purple",
	mtl_t7_camo_soviet_winter_blue = "t7_icon_blackmarket_promo_winter"
}
CoD.BlackMarketUtility.LimitedEditionCamoBundleItems = {
	camo_dlc3_pap_var_02 = "grand_slam",
	camo_dlc3_pap_var_03 = "grand_slam"
}
CoD.BlackMarketUtility.PromoRewardCompletionValues = {
	{
		completeValue = 0.25,
		nearCompleteValue = 0.12
	},
	{
		completeValue = 0.5,
		nearCompleteValue = 0.38
	},
	{
		completeValue = 0.75,
		nearCompleteValue = 0.62
	},
	{
		completeValue = 1,
		nearCompleteValue = 0.88
	}
}
CoD.BlackMarketUtility.CooldownTimerBufferSeconds = 10
CoD.BlackMarketUtility.GetBundleCountForCurrentDropType = function ( f2_arg0 )
	if CoD.perController[f2_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.INCENTIVE_WEAPON_BUNDLE then
		return CoD.BlackMarketUtility.GetCurrentIncentiveWeaponBundleCount( f2_arg0 )
	elseif CoD.perController[f2_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.INCENTIVE_RARE_BUNDLE then
		return CoD.BlackMarketUtility.GetCurrentIncentiveRareBundleCount( f2_arg0 )
	elseif CoD.perController[f2_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.NO_DUPES_RANGE then
		return CoD.BlackMarketUtility.GetCurrentNoDupeRangeBundleCount( f2_arg0 )
	elseif CoD.perController[f2_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.NO_DUPES_MELEE then
		return CoD.BlackMarketUtility.GetCurrentNoDupeMeleeBundleCount( f2_arg0 )
	elseif CoD.perController[f2_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.COMMON then
		return CoD.BlackMarketUtility.GetCurrentSixPackCommonBundleCount( f2_arg0 )
	elseif CoD.perController[f2_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.DAILY_DOUBLE_RARE_BUNDLE then
		return CoD.BlackMarketUtility.GetCurrentDailyDoubleRareBundleCount( f2_arg0 )
	elseif CoD.perController[f2_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.HUNDRED_BUNDLE then
		return CoD.BlackMarketUtility.GetCurrentHundredBundleCount( f2_arg0 )
	elseif CoD.perController[f2_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.RARE_BUNDLE_10FOR5 then
		return CoD.BlackMarketUtility.GetCurrentRareBundle10for5Count( f2_arg0 )
	elseif CoD.perController[f2_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.BUNDLE_EXPERIMENT then
		return CoD.BlackMarketUtility.GetCurrentBundleExperimentRareBundleCount( f2_arg0 )
	elseif CoD.perController[f2_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.NO_DUPES_BUNDLE then
		return CoD.BlackMarketUtility.GetCurrentNoDupesBundleRareBundleCount( f2_arg0 )
	elseif CoD.perController[f2_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.CODE_BUNDLE then
		return CoD.BlackMarketUtility.GetCurrentCodeBundleRareBundleCount( f2_arg0 )
	elseif CoD.perController[f2_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.WEAPON_3X then
		return CoD.BlackMarketUtility.GetCurrentWeapon3XBundleCount( f2_arg0 )
	elseif CoD.perController[f2_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.LIMITED_EDITION_CAMO then
		return CoD.BlackMarketUtility.GetCurrentLimitedEditionCamoBundleCount( f2_arg0 )
	elseif CoD.perController[f2_arg0].supplyDropType == CoD.BlackMarketUtility.DropTypes.RARE and not IsBundleActive( f2_arg0 ) then
		return CoD.BlackMarketUtility.GetCurrentBundleCount( f2_arg0 ) + CoD.BlackMarketUtility.GetCurrentHundredBundleCount( f2_arg0 ) + CoD.BlackMarketUtility.GetCurrentRareBundle10for5Count( f2_arg0 )
	else
		return CoD.BlackMarketUtility.GetCurrentBundleCount( f2_arg0 )
	end
end

CoD.BlackMarketUtility.GetCurrentBundleCount = function ( f3_arg0 )
	return Engine.GetInventoryItemQuantity( f3_arg0, Dvar.rare_crate_bundle_id:get() ) or 0
end

CoD.BlackMarketUtility.GetCurrentHundredBundleCount = function ( f4_arg0 )
	return Engine.GetInventoryItemQuantity( f4_arg0, CoD.BlackMarketUtility.loot_hundred_bundle_drop_id ) or 0
end

CoD.BlackMarketUtility.GetCurrentRareBundle10for5Count = function ( f5_arg0 )
	return Engine.GetInventoryItemQuantity( f5_arg0, CoD.BlackMarketUtility.rare_bundle_10for5_drop_id ) or 0
end

CoD.BlackMarketUtility.GetCurrentIncentiveWeaponBundleCount = function ( f6_arg0 )
	if LUI.DEV and Dvar.ui_incentive_weapons:exists() then
		return tonumber( Dvar.ui_incentive_weapons:get() )
	else
		return Engine.GetInventoryItemQuantity( f6_arg0, Dvar.incentive_weapon_drop_id:get() ) or 0
	end
end

CoD.BlackMarketUtility.GetCurrentIncentiveRareBundleCount = function ( f7_arg0 )
	if LUI.DEV and Dvar.ui_incentive_rares:exists() then
		return tonumber( Dvar.ui_incentive_rares:get() )
	else
		return Engine.GetInventoryItemQuantity( f7_arg0, Dvar.incentive_rare_drop_id:get() ) or 0
	end
end

CoD.BlackMarketUtility.GetCurrentNoDupeRangeBundleCount = function ( f8_arg0 )
	if not Dvar.range_weapon_no_dupes_drop_id:exists() then
		return 0
	else
		return Engine.GetInventoryItemQuantity( f8_arg0, Dvar.range_weapon_no_dupes_drop_id:get() ) or 0
	end
end

CoD.BlackMarketUtility.GetCurrentNoDupeMeleeBundleCount = function ( f9_arg0 )
	if not Dvar.melee_weapon_no_dupes_drop_id:exists() then
		return 0
	else
		return Engine.GetInventoryItemQuantity( f9_arg0, Dvar.melee_weapon_no_dupes_drop_id:get() ) or 0
	end
end

CoD.BlackMarketUtility.GetCurrentSixPackCommonBundleCount = function ( f10_arg0 )
	local f10_local0 = Engine.DvarInt( nil, "loot_sixPack_drop_id" )
	if f10_local0 == 0 then
		return 0
	else
		return Engine.GetInventoryItemQuantity( f10_arg0, f10_local0 ) or 0
	end
end

CoD.BlackMarketUtility.GetCurrentDailyDoubleRareBundleCount = function ( f11_arg0 )
	local f11_local0 = Engine.DvarInt( nil, "loot_dailyDouble_drop_id" )
	if f11_local0 == 0 then
		return 0
	else
		return Engine.GetInventoryItemQuantity( f11_arg0, f11_local0 ) or 0
	end
end

CoD.BlackMarketUtility.GetCurrentBundleExperimentRareBundleCount = function ( f12_arg0 )
	local f12_local0 = Engine.DvarInt( nil, "loot_3pack_bundle_id" )
	if f12_local0 == 0 then
		return 0
	else
		return Engine.GetInventoryItemQuantity( f12_arg0, f12_local0 ) or 0
	end
end

CoD.BlackMarketUtility.GetCurrentNoDupesBundleRareBundleCount = function ( f13_arg0 )
	local f13_local0 = Engine.DvarInt( nil, "loot_noDupeRare20Bundle_drop_id" )
	if f13_local0 == 0 then
		return 0
	else
		return Engine.GetInventoryItemQuantity( f13_arg0, f13_local0 ) or 0
	end
end

CoD.BlackMarketUtility.GetCurrentCodeBundleRareBundleCount = function ( f14_arg0 )
	return Engine.GetInventoryItemQuantity( f14_arg0, CoD.BlackMarketUtility.loot_code_bundle_drop_id ) or 0
end

CoD.BlackMarketUtility.GetCurrentWeapon3XBundleCount = function ( f15_arg0 )
	return Engine.GetInventoryItemQuantity( f15_arg0, CoD.BlackMarketUtility.loot_weapon_3x_drop_id ) or 0
end

CoD.BlackMarketUtility.GetCurrentLimitedEditionCamoBundleCount = function ( f16_arg0 )
	return Engine.GetInventoryItemQuantity( f16_arg0, CoD.BlackMarketUtility.loot_limited_edition_camo_drop_id ) or 0
end

CoD.BlackMarketUtility.GetCurrentBribePopupTitle = function ()
	local f17_local0 = Dvar.loot_bribeCrate_dwid:get()
	if f17_local0 == Dvar.incentive_weapon_crate_dwid:get() then
		
	else
		
	end
	return CoD.BlackMarketUtility.BribePopupTitles[f17_local0] or ""
end

CoD.BlackMarketUtility.GetCurrentBribePopupDescription = function ()
	local f18_local0 = Dvar.loot_bribeCrate_dwid:get()
	if f18_local0 == Dvar.incentive_weapon_crate_dwid:get() then
		
	else
		
	end
	return CoD.BlackMarketUtility.BribePopupDescriptions[f18_local0] or ""
end

CoD.BlackMarketUtility.GetCurrentBribeString = function ()
	local f19_local0 = Dvar.loot_bribeCrate_dwid:get()
	if f19_local0 == Dvar.incentive_weapon_crate_dwid:get() then
		
	else
		
	end
	return CoD.BlackMarketUtility.BribeStrings[f19_local0]
end

CoD.BlackMarketUtility.GetCurrentBribeHint = function ()
	local f20_local0 = Dvar.loot_bribeCrate_dwid:get()
	if f20_local0 == Dvar.incentive_weapon_crate_dwid:get() then
		
	else
		
	end
	if f20_local0 >= 20 and f20_local0 <= 29 then
		return CoD.BlackMarketUtility.LocalizeForHeroBribe( f20_local0, "MPUI_BM_SPECIALIST_ITEM_BRIBE_HINT" )
	else
		return CoD.BlackMarketUtility.BribeHints[f20_local0]
	end
end

CoD.BlackMarketUtility.GetCurrentBribeImage = function ()
	local f21_local0 = Dvar.loot_bribeCrate_dwid:get()
	if f21_local0 == Dvar.incentive_weapon_crate_dwid:get() then
		return "t7_blackmarket_crate_bribe_chip_weapon"
	else
		return CoD.BlackMarketUtility.BribeImages[f21_local0]
	end
end

CoD.BlackMarketUtility.GetCurrentBribePromoImage = function ()
	local f22_local0 = Dvar.loot_bribeCrate_dwid:get()
	if f22_local0 == Dvar.incentive_weapon_crate_dwid:get() then
		return "t7_blackmarket_promo_bribe_weapon"
	else
		return CoD.BlackMarketUtility.BribePromoImages[f22_local0]
	end
end

CoD.BlackMarketUtility.GetCurrentBribeTitle = function ()
	local f23_local0 = Dvar.loot_bribeCrate_dwid:get()
	if f23_local0 == Dvar.incentive_weapon_crate_dwid:get() then
		
	else
		
	end
	return CoD.BlackMarketUtility.BribeTitles[f23_local0]
end

CoD.BlackMarketUtility.GetCurrentBribeDescription = function ()
	local f24_local0 = Dvar.loot_bribeCrate_dwid:get()
	if f24_local0 == Dvar.incentive_weapon_crate_dwid:get() then
		
	else
		
	end
	if f24_local0 >= 20 and f24_local0 <= 29 then
		return Engine.Localize( CoD.BlackMarketUtility.LocalizeForHeroBribe( f24_local0, "MPUI_BM_BRIBE_SPECIALIST_EXPIRY" ), "<SPNAME>", Engine.GetModelValue( Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "Autoevents" ), "autoevent_timer_bribe" ) ) )
	else
		local f24_local1 = CoD.BlackMarketUtility.BribeDescriptions[f24_local0]
		if f24_local1 then
			return LocalizeIntoStringWithPSTOrPDT( f24_local1, GetWeekDayFromIntDvar( "loot_mp_saleEndDay", "" ) )
		else
			return nil
		end
	end
end

CoD.BlackMarketUtility.GetCurrentBribeFrameTitle = function ()
	return CoD.BlackMarketUtility.BribeFrameTitle[Dvar.loot_bribeCrate_dwid:get()]
end

CoD.BlackMarketUtility.GetCrateTypeString = function ( f26_arg0 )
	if f26_arg0 == CoD.BlackMarketUtility.DropTypes.BRIBE then
		return CoD.BlackMarketUtility.GetCurrentBribeString()
	elseif f26_arg0 == CoD.BlackMarketUtility.DropTypes.BUNDLE_EXPERIMENT then
		return Engine.Localize( CoD.BlackMarketUtility.CrateTypeStrings[f26_arg0], Engine.Localize( Engine.DvarString( nil, "loot_3pack_final_count_string_ref" ) ) )
	elseif f26_arg0 == CoD.BlackMarketUtility.DropTypes.GRAND_SLAM then
		return ""
	else
		return CoD.BlackMarketUtility.CrateTypeStrings[f26_arg0]
	end
end

CoD.BlackMarketUtility.GetCrateTypeImage = function ( f27_arg0 )
	if f27_arg0 == CoD.BlackMarketUtility.DropTypes.BRIBE then
		return CoD.BlackMarketUtility.GetCurrentBribeImage()
	elseif f27_arg0 == CoD.BlackMarketUtility.DropTypes.RARE or f27_arg0 == CoD.BlackMarketUtility.DropTypes.NO_DUPES_CRATE then
		return "uie_t7_blackmarket_crate_rare_focus"
	else
		return "uie_t7_blackmarket_crate_common_focus"
	end
end

CoD.BlackMarketUtility.BurnReturnXP = function ( f28_arg0 )
	if f28_arg0 == Enum.LootRarityType.LOOT_RARITY_TYPE_COMMON then
		if Dvar.loot_burnCommonRefund:exists() then
			return Dvar.loot_burnCommonRefund:get() * 100
		else
			return 100
		end
	elseif f28_arg0 == Enum.LootRarityType.LOOT_RARITY_TYPE_RARE then
		if Dvar.loot_burnRareRefund:exists() then
			return Dvar.loot_burnRareRefund:get() * 100
		else
			return 300
		end
	elseif f28_arg0 == Enum.LootRarityType.LOOT_RARITY_TYPE_LEGENDARY then
		if Dvar.loot_burnLegendaryRefund:exists() then
			return Dvar.loot_burnLegendaryRefund:get() * 100
		else
			return 700
		end
	elseif f28_arg0 == Enum.LootRarityType.LOOT_RARITY_TYPE_EPIC then
		if Dvar.loot_burnEpicRefund:exists() then
			return Dvar.loot_burnEpicRefund:get() * 100
		else
			return 1000
		end
	else
		
	end
end

CoD.BlackMarketUtility.GetRarityIDForString = function ( f29_arg0 )
	for f29_local3, f29_local4 in pairs( CoD.BlackMarketUtility.CrateTypeIds ) do
		if f29_local4 == f29_arg0 then
			return f29_local3
		end
	end
	return CoD.BlackMarketUtility.DropTypes.COMMON
end

CoD.BlackMarketUtility.ConvertToLootDecalIndex = function ( f30_arg0 )
	local f30_local0 = 0
	for f30_local4 in string.gmatch( f30_arg0, "[^%s_]+" ) do
		f30_local0 = f30_local0 + 1
		if f30_local0 == 1 and f30_local4 ~= "decal" then
			break
		elseif f30_local0 == 2 then
			return f30_local4
		end
	end
	f30_local3 = Engine.TableLookup( nil, CoD.emblemIconsTable, 3, f30_arg0, 1 )
	if f30_local3 and f30_local3 ~= "" then
		return f30_local3
	end
	return nil
end

CoD.BlackMarketUtility.ConvertToLootDecalIndexIfDecal = function ( f31_arg0 )
	return CoD.BlackMarketUtility.ConvertToLootDecalIndex( f31_arg0 ) or f31_arg0
end

CoD.BlackMarketUtility.SplitIdIntoTwoValues = function ( f32_arg0 )
	local f32_local0 = nil
	for f32_local4 in string.gmatch( f32_arg0, "[^%s;]+" ) do
		if f32_local0 == nil then
			f32_local0 = f32_local4
		end
		return f32_local0, f32_local4
	end
	if f32_local0 ~= nil then
		return f32_local0, ""
	end
	return "", ""
end

CoD.BlackMarketUtility.SplitAttachmentVariantID = function ( f33_arg0 )
	local f33_local0 = 0
	local f33_local1 = ""
	local f33_local2 = ""
	for f33_local6 in string.gmatch( f33_arg0, "[^%s_]+" ) do
		f33_local0 = f33_local0 + 1
		if f33_local0 == 1 then
			if f33_local6 ~= "acv" then
				return "", ""
			end
		end
		if f33_local0 == 2 then
			f33_local1 = f33_local6
		end
		if f33_local2 == "" then
			f33_local2 = f33_local6
		else
			f33_local2 = f33_local2 .. "_" .. f33_local6
		end
	end
	return f33_local1, f33_local2
end

CoD.BlackMarketUtility.GetSpecialistThemeType = function ( f34_arg0 )
	if string.find( f34_arg0, "body" ) then
		return Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY
	else
		return Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET
	end
end

CoD.BlackMarketUtility.GetItemTypeStringForLootItem = function ( f35_arg0, f35_arg1 )
	if f35_arg1 == "camo" then
		if CoD.BlackMarketUtility.IsLimitedBlackMarketItem( f35_arg0 ) then
			return Engine.Localize( "MPUI_CAMO" )
		else
			local f35_local0, f35_local1 = CoD.BlackMarketUtility.SplitIdIntoTwoValues( f35_arg0 )
			return Engine.Localize( "MPUI_BM_WEAPON_CAMO", CoD.CACUtility.GetNameForItemRefString( f35_local1 ) )
		end
	elseif f35_arg1 == "attachment_variant" then
		local f35_local0, f35_local1 = CoD.BlackMarketUtility.SplitAttachmentVariantID( f35_arg0 )
		return Engine.Localize( "MPUI_BM_WEAPON_ATTACHMENT_VARIANT", CoD.CACUtility.GetNameForItemRefString( f35_local1 ), Engine.TableLookup( nil, CoD.attachmentTable, 4, f35_local0, 3 ) )
	elseif f35_arg1 == "gesture" then
		local f35_local0, f35_local1 = CoD.BlackMarketUtility.SplitIdIntoTwoValues( f35_arg0 )
		local f35_local2, f35_local3 = CoD.CCUtility.GetHeroDisplayNameAndIndex( Enum.eModes.MODE_MULTIPLAYER, f35_local1 )
		return Engine.Localize( "MPUI_BM_HERO_AND_GESTURE_TYPE", f35_local2, CoD.CCUtility.GetTypeNameForGesture( Enum.eModes.MODE_MULTIPLAYER, f35_local1, f35_local0 ) )
	elseif f35_arg1 == "taunt" then
		local f35_local0, f35_local1 = CoD.CCUtility.GetHeroDisplayNameAndIndexForTaunt( Enum.eModes.MODE_MULTIPLAYER, f35_arg0 )
		return Engine.Localize( "MPUI_BM_HERO_TAUNT", f35_local0 )
	elseif f35_arg1 == "specialist_outfit" then
		local f35_local0, f35_local1 = CoD.BlackMarketUtility.SplitIdIntoTwoValues( f35_arg0 )
		local f35_local2 = "MENU_SPECIALIST_HEAD_THEME"
		if CoD.BlackMarketUtility.GetSpecialistThemeType( f35_local0 ) == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
			f35_local2 = "MENU_SPECIALIST_BODY_THEME"
		end
		return Engine.Localize( f35_local2, CoD.BlackMarketUtility.GetHeroDisplayNameForAssetName( f35_local1 ) )
	elseif f35_arg1 == "reticle" then
		local f35_local0, f35_local1, f35_local2 = string.gmatch( f35_arg0, "[^%s_]+" )
		local f35_local3 = f35_local0( f35_local1, f35_local2 )
		if f35_local3 ~= nil then
			f35_local2 = f35_local3
			if Engine.LocalizeRefExists( "MPUI_" .. f35_local3 .. "_CAPS" ) then
				return Engine.Localize( "MPUI_BM_RETICLE", Engine.Localize( "MPUI_" .. f35_local3 .. "_CAPS" ) )
			else
				return CoD.BlackMarketUtility.CategoryStrings[f35_arg1]
			end
		end
	end
	return CoD.BlackMarketUtility.CategoryStrings[f35_arg1]
end

CoD.BlackMarketUtility.GetImageForLootItem = function ( f36_arg0, f36_arg1 )
	if CoD.BlackMarketUtility.LootItemImageOverride[f36_arg0] then
		return CoD.BlackMarketUtility.LootItemImageOverride[f36_arg0]
	elseif f36_arg1 == "camo" then
		local f36_local0, f36_local1 = CoD.BlackMarketUtility.SplitIdIntoTwoValues( f36_arg0 )
		return CoD.CACUtility.GetImageForItemRefString( f36_local1 ) .. "_" .. f36_local0
	elseif f36_arg1 == "emblem" then
		return "blacktransparent"
	elseif f36_arg1 == "attachment_variant" then
		return Engine.GetAttachmentCosmeticVariantImage( f36_arg0, 0 ) or "cac_mods_ar_standard_high_caliber_02_sm"
	elseif f36_arg1 == "material" then
		return f36_arg0
	elseif f36_arg1 == "gesture" then
		for f36_local3, f36_local4 in pairs( CoD.BlackMarketUtility.GestureImages ) do
			if LUI.startswith( f36_arg0, f36_local3 ) then
				return f36_local4
			end
		end
	elseif f36_arg1 == "taunt" then
		local f36_local0 = CoD.BlackMarketUtility.GetRarityForLootItemFromName( f36_arg0 )
		if CoD.BlackMarketUtility.GetRarityForLootItemFromName( f36_arg0 ) == "MPUI_BM_EPIC" then
			return "t7_icon_blackmarket_taunt_epic"
		else
			return "t7_icon_blackmarket_taunt"
		end
	elseif f36_arg1 == "specialist_outfit" then
		local f36_local0, f36_local1 = CoD.BlackMarketUtility.SplitIdIntoTwoValues( f36_arg0 )
		return CoD.BlackMarketUtility.GetSpecialistOutfitFieldForId( f36_local0, f36_local1, "icon" )
	elseif f36_arg1 == "weapon" or f36_arg1 == "melee_weapon" then
		return Engine.GetHudIconForWeapon( f36_arg0 .. "_" .. CoD.gameMode:lower(), Enum.eModes.MODE_MULTIPLAYER )
	end
	return f36_arg0
end

CoD.BlackMarketUtility.GetStringRefForLootItem = function ( f37_arg0, f37_arg1, f37_arg2 )
	if f37_arg2 == "camo" then
		local f37_local0, f37_local1 = CoD.BlackMarketUtility.SplitIdIntoTwoValues( f37_arg1 )
		return Engine.TableLookup( nil, CoD.attachmentTable, 4, f37_local0, 3 )
	elseif f37_arg2 == "emblem" then
		local f37_local0, f37_local1, f37_local2 = CoD.BlackMarketUtility.GetLootEmblemIndexParams( f37_arg0, f37_arg1 )
		CoD.CraftUtility.Emblems.ParseDDL( f37_local0, f37_local2 )
		CoD.BlackMarketUtility.parsedEmblemDDLs[f37_local2] = true
		local f37_local3 = CoD.CraftUtility.Emblems.CachedEmblems[CoD.CraftUtility.Emblems.CachedEmblemIndexMapping[f37_local1 + 1]]
		if f37_local3 ~= nil then
			return f37_local3.emblemName
		else
			return f37_arg1
		end
	elseif f37_arg2 == "calling_card" then
		return Engine.TableLookup( nil, CoD.backgroundsTable, 3, f37_arg1, 4 ) or ""
	elseif f37_arg2 == "decal" then
		local f37_local0 = CoD.BlackMarketUtility.ConvertToLootDecalIndexIfDecal( f37_arg1 )
		if f37_local0 == f37_arg1 then
			return ""
		else
			return GetEmblemDecalDesc( f37_local0 )
		end
	elseif f37_arg2 == "attachment_variant" then
		return Engine.GetAttachmentCosmeticVariantName( f37_arg1, 0 ) or "High Caliber 1"
	elseif f37_arg2 == "material" then
		return Engine.TableLookup( nil, CoD.BlackMarketUtility.emblemMaterialsTableName, 3, f37_arg1, 4 ) or ""
	elseif f37_arg2 == "gesture" then
		local f37_local0, f37_local1 = CoD.BlackMarketUtility.SplitIdIntoTwoValues( f37_arg1 )
		return CoD.CCUtility.GetDisplayNameForGesture( Enum.eModes.MODE_MULTIPLAYER, f37_local1, f37_local0 )
	elseif f37_arg2 == "taunt" then
		return CoD.CCUtility.GetDisplayNameForTaunt( Enum.eModes.MODE_MULTIPLAYER, f37_arg1 )
	elseif f37_arg2 == "specialist_outfit" then
		local f37_local0, f37_local1 = CoD.BlackMarketUtility.SplitIdIntoTwoValues( f37_arg1 )
		return CoD.BlackMarketUtility.GetSpecialistOutfitFieldForId( f37_local0, f37_local1, "name" )
	elseif f37_arg2 == "weapon" or f37_arg2 == "melee_weapon" then
		return CoD.CACUtility.GetNameForItemRefString( f37_arg1 )
	elseif f37_arg2 == "reticle" then
		return "MPUI_RETICLE_" .. f37_arg1
	else
		return f37_arg1
	end
end

CoD.BlackMarketUtility.GetSpecialistOutfitFieldForId = function ( f38_arg0, f38_arg1, f38_arg2 )
	local f38_local0 = Enum.eModes.MODE_MULTIPLAYER
	for f38_local11, f38_local12 in ipairs( Engine.GetHeroList( f38_local0 ) ) do
		if f38_local12.assetName == f38_arg1 then
			for f38_local4 = 0, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_COUNT - 1, 1 do
				for f38_local7 = 0, 256, 1 do
					local f38_local10 = Engine.GetHeroItemInfo( f38_local0, f38_local12.bodyIndex, f38_local4, f38_local7 )
					if not f38_local10 then
						
					end
					if f38_local10.assetName ~= nil and f38_local10.assetName == f38_arg0 then
						return f38_local10[f38_arg2]
					end
				end
			end
		end
	end
	return ""
end

CoD.BlackMarketUtility.GetSpecialistOutfitIndexForId = function ( f39_arg0, f39_arg1 )
	local f39_local0 = Enum.eModes.MODE_MULTIPLAYER
	for f39_local11, f39_local12 in ipairs( Engine.GetHeroList( f39_local0 ) ) do
		if f39_local12.assetName == f39_arg1 then
			for f39_local4 = 0, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_COUNT - 1, 1 do
				for f39_local7 = 0, 256, 1 do
					local f39_local10 = Engine.GetHeroItemInfo( f39_local0, f39_local12.bodyIndex, f39_local4, f39_local7 )
					if not f39_local10 then
						
					end
					if f39_local10.assetName ~= nil and f39_local10.assetName == f39_arg0 then
						return f39_local7
					end
				end
			end
		end
	end
	return ""
end

CoD.BlackMarketUtility.GetCallingCardSetName = function ( f40_arg0 )
	return Engine.TableLookup( nil, CoD.BlackMarketUtility.lootTableName, 0, f40_arg0, 4 )
end

CoD.BlackMarketUtility.GetNumOwnedAndTotalForCallingCardSet = function ( f41_arg0, f41_arg1 )
	local f41_local0 = 4
	local f41_local1 = 0
	local f41_local2 = Engine.TableFindRows( CoD.BlackMarketUtility.lootTableName, f41_local0, f41_arg1 )
	local f41_local3 = 0
	local f41_local4 = 0
	if not f41_local2 then
		return 0, 0, 0
	end
	for f41_local5 = 1, #f41_local2, 1 do
		local f41_local8 = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, f41_local2[f41_local5], f41_local1 )
		if not CoD.BlackMarketUtility.IsItemLocked( f41_arg0, f41_local8 ) then
			f41_local3 = f41_local3 + 1
			local f41_local9 = CoD.BlackMarketUtility.GetLootCallingCardIndex( f41_arg0, f41_local8 )
			if f41_local9 and Engine.IsEmblemBackgroundNew( f41_arg0, f41_local9 ) then
				f41_local4 = f41_local4 + 1
			end
		end
	end
	return f41_local3, #f41_local2, f41_local4
end

CoD.BlackMarketUtility.GetSetNumOwnedAndTotalForCallingCard = function ( f42_arg0, f42_arg1 )
	local f42_local0 = CoD.BlackMarketUtility.GetCallingCardSetName( f42_arg1 )
	if f42_local0 == nil or f42_local0 == "" then
		return 0, 0, 0
	else
		return CoD.BlackMarketUtility.GetNumOwnedAndTotalForCallingCardSet( f42_arg0, f42_local0 )
	end
end

CoD.BlackMarketUtility.GetRewardAndCategoryForItem = function ( f43_arg0 )
	local f43_local0 = 0
	local f43_local1 = 2
	local f43_local2 = Engine.TableFindRows( CoD.BlackMarketUtility.lootTableName, 5, f43_arg0 )
	if f43_local2 ~= nil then
		return Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, f43_local2[1], f43_local0 ), Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, f43_local2[1], f43_local1 )
	else
		return nil, nil
	end
end

CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem = function ( f44_arg0 )
	if Dvar.loot_unlockUnreleasedLoot:exists() and Dvar.loot_unlockUnreleasedLoot:get() == true then
		return false
	end
	local f44_local0 = 0
	local f44_local1
	if f44_arg0 == nil or f44_arg0 ~= Engine.TableLookup( nil, CoD.BlackMarketUtility.unreleasedLootTableName, f44_local0, f44_arg0, f44_local0 ) then
		f44_local1 = false
	else
		f44_local1 = true
	end
	return f44_local1
end

CoD.BlackMarketUtility.IsBlackMarketItem = function ( f45_arg0 )
	local f45_local0 = 0
	return f45_arg0 == Engine.TableLookup( nil, CoD.BlackMarketUtility.lootTableName, f45_local0, f45_arg0, f45_local0 )
end

CoD.BlackMarketUtility.IsReleasedBlackMarketItem = function ( f46_arg0 )
	local f46_local0
	if f46_arg0 ~= nil then
		f46_local0 = CoD.BlackMarketUtility.IsBlackMarketItem( f46_arg0 )
		if f46_local0 then
			f46_local0 = not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( f46_arg0 )
		end
	else
		f46_local0 = false
	end
	return f46_local0
end

CoD.BlackMarketUtility.IsLimitedBlackMarketItem = function ( f47_arg0 )
	if CoD.BlackMarketUtility.LimitedCountItems[f47_arg0] then
		return true
	else
		return false
	end
end

CoD.BlackMarketUtility.IsLimitedEditionCamoBundleItem = function ( f48_arg0 )
	if CoD.BlackMarketUtility.LimitedEditionCamoBundleItems[f48_arg0] then
		return true
	else
		return false
	end
end

CoD.BlackMarketUtility.IsHiddenLimitedBlackMarketItem = function ( f49_arg0, f49_arg1 )
	if not CoD.BlackMarketUtility.IsLimitedBlackMarketItem( f49_arg1 ) then
		return false
	elseif (IsLimitedLootPromoActive( f49_arg0 ) or IsGrandSlamActive( f49_arg0 )) and CoD.BlackMarketUtility.LimitedCountItems[f49_arg1] == "active" then
		return false
	else
		return CoD.BlackMarketUtility.IsItemLocked( f49_arg0, f49_arg1 )
	end
end

CoD.BlackMarketUtility.IsHiddenLimitedEditionCamoBundleItem = function ( f50_arg0, f50_arg1 )
	if not CoD.BlackMarketUtility.IsLimitedEditionCamoBundleItem( f50_arg1 ) then
		return false
	elseif IsGrandSlamActive( f50_arg0 ) and CoD.BlackMarketUtility.LimitedCountItems[f50_arg1] == "active" then
		return false
	elseif CoD.BlackMarketUtility.GetCurrentLimitedEditionCamoBundleCount( f50_arg0 ) > 0 then
		return false
	else
		local f50_local0 = CoD.GetContractStatValuesForIndex( f50_arg0, LuaUtils.BMContracts.specialContractIndex )
		if f50_local0 and f50_local0.category == CoD.BlackMarketUtility.LimitedEditionCamoBundleItems[f50_arg1] and not f50_local0.isAwardGiven then
			return false
		else
			return CoD.BlackMarketUtility.IsItemLocked( f50_arg0, f50_arg1 )
		end
	end
end

CoD.BlackMarketUtility.ShowToastIfApplicable = function ( f51_arg0, f51_arg1, f51_arg2, f51_arg3 )
	if LUI.DEV and Dvar.ui_forcetoast and Dvar.ui_forcetoast:exists() and tonumber( Dvar.ui_forcetoast:get() ) == 1 then
		if f51_arg3 == 2 then
			CoD.OverlayUtility.ShowToast( "LootBonusCallingCard", Engine.Localize( "MPUI_BM_BONUS_CALLING_CARD_SET_MASTER" ), Engine.Localize( "MPUI_BM_BONUS_CALLING_CARD_SET_MASTER_DESC", "Aliens" ), "t7_callingcard_mp_darkops_chainkiller" )
		elseif f51_arg3 == 3 then
			CoD.OverlayUtility.ShowToast( "LootBonusDecal", "MONSTER DECAL", Engine.Localize( "MPUI_BM_BONUS_DECAL_DESC", "True Monster" ), nil, nil, 2 )
		end
		return 
	end
	local f51_local0 = CoD.BlackMarketUtility.GetItemQuantity( f51_arg0, f51_arg1 )
	if f51_local0 == nil or f51_local0 > 1 then
		return 
	elseif f51_arg2 == "emblem" then
		local f51_local1, f51_local2 = CoD.BlackMarketUtility.GetRewardAndCategoryForItem( f51_arg1 )
		if f51_local1 then
			local f51_local3 = CoD.BlackMarketUtility.GetStringRefForLootItem( f51_arg0, f51_local1, f51_local2 )
			local f51_local4 = CoD.BlackMarketUtility.GetItemTypeStringForLootItem( f51_local1, f51_local2 )
			local f51_local5 = nil
			local f51_local6 = f51_local1
			if f51_local2 == "decal" then
				f51_local5 = tonumber( CoD.BlackMarketUtility.ConvertToLootDecalIndexIfDecal( f51_local1 ) )
				f51_local6 = nil
			end
			CoD.OverlayUtility.ShowToast( "LootBonusDecal", f51_local3, Engine.Localize( f51_local4 ), f51_local6, nil, f51_local5 )
		end
	elseif f51_arg2 == "calling_card" then
		local f51_local1, f51_local2 = CoD.BlackMarketUtility.GetSetNumOwnedAndTotalForCallingCard( f51_arg0, f51_arg1 )
		if f51_local2 > 0 and f51_local1 == f51_local2 and not BlackMarketHideMasterCallingCards() then
			local f51_local4, f51_local5 = CoD.BlackMarketUtility.GetRewardAndCategoryForItem( CoD.BlackMarketUtility.GetCallingCardSetName( f51_arg1 ) )
			CoD.OverlayUtility.ShowToast( "LootBonusCallingCard", Engine.Localize( CoD.BlackMarketUtility.GetStringRefForLootItem( f51_arg0, f51_local4, f51_local5 ) ), Engine.Localize( CoD.BlackMarketUtility.GetItemTypeStringForLootItem( f51_local4, f51_local5 ) ), nil, nil, nil, f51_local4 )
		end
	end
end

CoD.BlackMarketUtility.GetSetPieceStringForLootItem = function ( f52_arg0, f52_arg1, f52_arg2 )
	if f52_arg2 == "calling_card" then
		local f52_local0, f52_local1 = CoD.BlackMarketUtility.GetSetNumOwnedAndTotalForCallingCard( f52_arg0, f52_arg1 )
		if f52_local1 > 0 then
			return Engine.Localize( "MPUI_BM_SET_PIECE_X_OF_Y", f52_local0, f52_local1 )
		end
	end
	return ""
end

CoD.BlackMarketUtility.GetSetPieceStringForLootSet = function ( f53_arg0, f53_arg1, f53_arg2 )
	if f53_arg2 == "calling_card" then
		local f53_local0, f53_local1 = CoD.BlackMarketUtility.GetNumOwnedAndTotalForCallingCardSet( f53_arg0, f53_arg1 )
		if f53_local1 > 0 then
			return Engine.Localize( "MPUI_BM_SET_X_OF_Y", f53_local0, f53_local1 )
		end
	end
	return ""
end

CoD.BlackMarketUtility.GetCurrentRank = function ( f54_arg0 )
	local f54_local0 = Engine.GetPlayerStats( f54_arg0 )
	return f54_local0.PlayerStatsList.RANK.statValue:get()
end

CoD.BlackMarketUtility.GetItemLockedTextAndAvailability = function ( f55_arg0, f55_arg1, f55_arg2 )
	if f55_arg2 == "camo" then
		local f55_local0 = Enum.eModes.MODE_MULTIPLAYER
		local f55_local1 = CoD.BlackMarketUtility.GetCurrentRank( f55_arg0 )
		local f55_local2, f55_local3 = CoD.BlackMarketUtility.SplitIdIntoTwoValues( f55_arg1 )
		local f55_local4 = Engine.GetItemIndexFromReference( f55_local3, f55_local0 )
		local f55_local5 = Engine.GetItemUnlockLevel( f55_local4, f55_local0 )
		if f55_local1 < f55_local5 then
			return Engine.GetItemName( f55_local4, f55_local0 ), Engine.Localize( "MENU_RANK_NAME_FULL", CoD.GetRankName( f55_local5, 0, f55_local0 ), "" .. f55_local5 + 1 )
		end
	elseif f55_arg2 == "attachment_variant" then
		local f55_local0 = Enum.eModes.MODE_MULTIPLAYER
		local f55_local1, f55_local2 = CoD.BlackMarketUtility.SplitAttachmentVariantID( f55_arg1 )
		local f55_local3 = Engine.GetItemIndexFromReference( f55_local2 )
		local f55_local5 = Engine.GetAttachmentIndexByAttachmentTableIndex( f55_local3, Engine.TableLookup( nil, CoD.attachmentTable, 4, f55_local1, 0 ), f55_local0 )
		local f55_local6 = Engine.GetItemAttachmentRank( f55_local3, f55_local5, f55_local0 )
		local f55_local7 = Engine.GetGunCurrentRank( f55_arg0, f55_local3, f55_local0 )
		if Engine.IsItemAttachmentLocked( f55_arg0, f55_local3, f55_local5, f55_local0 ) then
			local f55_local8 = Engine.GetItemName( f55_local3, f55_local0 )
			return Engine.Localize( Engine.TableLookup( nil, CoD.attachmentTable, 4, f55_local1, 3 ) ), Engine.Localize( "MPUI_WEAPON_RANK", f55_local6 + 2 )
		end
	elseif f55_arg2 == "taunt" or f55_arg2 == "gesture" or f55_arg2 == "specialist_outfit" then
		local f55_local0 = 0
		local f55_local1 = ""
		if f55_arg2 == "taunt" then
			f55_local1, f55_local0 = CoD.CCUtility.GetHeroDisplayNameAndIndexForTaunt( Enum.eModes.MODE_MULTIPLAYER, f55_arg1 )
		else
			local f55_local2, f55_local3 = CoD.BlackMarketUtility.SplitIdIntoTwoValues( f55_arg1 )
			f55_local1, f55_local0 = CoD.CCUtility.GetHeroDisplayNameAndIndex( Enum.eModes.MODE_MULTIPLAYER, f55_local3 )
		end
		local f55_local2, f55_local3 = CoD.CCUtility.Heroes.GetHeroUnlockInfo( f55_arg0, f55_local0, Enum.eModes.MODE_MULTIPLAYER, "MENU_RANK_NAME_FULL" )
		if f55_local2 then
			return f55_local1, f55_local3
		end
	end
	return nil, nil
end

CoD.BlackMarketUtility.GetLootCallingCardIndex = function ( f56_arg0, f56_arg1 )
	return tonumber( Engine.TableLookup( f56_arg0, CoD.BlackMarketUtility.backgroundsTable, 3, f56_arg1, 1 ) )
end

CoD.BlackMarketUtility.GetLootEmblemIndexParams = function ( f57_arg0, f57_arg1 )
	local f57_local0 = 0
	local f57_local1 = 1
	local f57_local2 = 3
	local f57_local3 = Engine.TableFindRows( CoD.BlackMarketUtility.lootEmblemTableName, f57_local0, f57_arg1 )
	if f57_local3 then
		return f57_arg0, tonumber( Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootEmblemTableName, f57_local3[1], f57_local1 ) ), Enum.StorageFileType[Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootEmblemTableName, f57_local3[1], f57_local2 )]
	else
		return f57_arg0, 0, Enum.StorageFileType.STORAGE_DEFAULT_EMBLEMS
	end
end

CoD.BlackMarketUtility.GetLootEmblemIDName = function ( f58_arg0 )
	return Engine.TableLookup( nil, CoD.BlackMarketUtility.lootEmblemTableName, 1, f58_arg0, 0 )
end

CoD.BlackMarketUtility.GetLootEmblemIDNameFromIndex = function ( f59_arg0 )
	return Engine.TableLookup( nil, CoD.BlackMarketUtility.lootEmblemTableName, 2, f59_arg0, 0 )
end

CoD.BlackMarketUtility.GetLootEmblemSortIndexFromEmblemId = function ( f60_arg0 )
	return Engine.TableLookup( nil, CoD.BlackMarketUtility.lootEmblemTableName, 1, f60_arg0, 2 )
end

CoD.BlackMarketUtility.GetLootDecalName = function ( f61_arg0, f61_arg1 )
	return Engine.TableLookup( nil, CoD.BlackMarketUtility.emblemIconsTableName, 1, f61_arg1, 3 )
end

CoD.BlackMarketUtility.IsLootDecalHiddenIfClassified = function ( f62_arg0, f62_arg1 )
	return (tonumber( Engine.TableLookup( nil, CoD.BlackMarketUtility.emblemIconsTableName, 1, f62_arg1, 12 ) ) or 0) > 0
end

CoD.BlackMarketUtility.GetCallingCardTitleFromImage = function ( f63_arg0 )
	return Engine.TableLookup( nil, CoD.BlackMarketUtility.backgroundsTable, 3, f63_arg0, 4 )
end

CoD.BlackMarketUtility.GetCallingCardSortKeyFromImage = function ( f64_arg0 )
	return Engine.TableLookup( nil, CoD.BlackMarketUtility.backgroundsTable, 3, f64_arg0, 2 )
end

CoD.BlackMarketUtility.GetRarityForCallingCardSetFromSetName = function ( f65_arg0 )
	return CoD.BlackMarketUtility.CrateTypeStrings[CoD.BlackMarketUtility.GetRarityIDForString( Engine.TableLookup( nil, CoD.BlackMarketUtility.lootTableName, 4, f65_arg0, 3 ) )]
end

CoD.BlackMarketUtility.GetRarityTypeForLootItemFromName = function ( f66_arg0 )
	return Engine.TableLookup( nil, CoD.BlackMarketUtility.lootTableName, 0, f66_arg0, 3 )
end

CoD.BlackMarketUtility.GetRarityForLootItemFromName = function ( f67_arg0 )
	local f67_local0 = CoD.BlackMarketUtility.GetRarityTypeForLootItemFromName( f67_arg0 )
	if f67_local0 == "" then
		return ""
	elseif CoD.BlackMarketUtility.IsLimitedBlackMarketItem( f67_arg0 ) then
		f67_local0 = "limited"
	end
	return CoD.BlackMarketUtility.CrateTypeStrings[CoD.BlackMarketUtility.GetRarityIDForString( f67_local0 )]
end

CoD.BlackMarketUtility.GetHeroDisplayNameForAssetName = function ( f68_arg0 )
	local f68_local0 = Enum.eModes.MODE_MULTIPLAYER
	for f68_local4, f68_local5 in ipairs( Engine.GetHeroList( f68_local0 ) ) do
		if f68_local5.assetName == f68_arg0 then
			return Engine.GetHeroName( f68_local0, f68_local5.bodyIndex )
		end
	end
	return f68_arg0
end

CoD.BlackMarketUtility.GetCrateDvarVal = function ( f69_arg0, f69_arg1 )
	return tonumber( Engine.DvarString( nil, Engine.TableLookup( 0, CoD.BlackMarketUtility.crateTable, 0, f69_arg0, 1 ) .. f69_arg1 ) )
end

CoD.BlackMarketUtility.GetCrateCryptoKeyCost = function ( f70_arg0 )
	return CoD.BlackMarketUtility.GetCrateDvarVal( f70_arg0, "_cryptoCost" )
end

CoD.BlackMarketUtility.GetCrateCryptoKeyDiscount = function ( f71_arg0 )
	return CoD.BlackMarketUtility.GetCrateDvarVal( f71_arg0, "_cryptoDiscount" )
end

CoD.BlackMarketUtility.GetCryptoKeysFromMatchChallenges = function ( f72_arg0, f72_arg1 )
	if CoD.AARUtility.UseTestData() then
		return 20
	end
	local f72_local0 = 0
	if Engine.SessionMode_IsPublicOnlineGame() then
		local f72_local1 = CoD.GetPlayerStats( f72_arg0, CoD.STATS_LOCATION_STABLE )
		local f72_local2 = CoD.GetPlayerStats( f72_arg0 )
		if f72_arg1 == CoD.BlackMarketUtility.MatchChallengeType.dailyContract or f72_arg1 == CoD.BlackMarketUtility.MatchChallengeType.dailyAndWeeklyContract then
			local f72_local3 = CoD.GetContractStatValuesForIndex( f72_arg0, LuaUtils.BMContracts.dailyContractIndex, f72_local1, false )
			local f72_local4 = CoD.GetContractStatValuesForIndex( f72_arg0, LuaUtils.BMContracts.dailyContractIndex, f72_local2, true )
			if f72_local3 and f72_local4 and f72_local4.isActive and f72_local3.progress < f72_local3.targetValue and f72_local4.targetValue <= f72_local4.progress then
				f72_local0 = f72_local0 + Dvar.daily_contract_cryptokey_reward_count:get()
			end
		end
		if f72_arg1 == CoD.BlackMarketUtility.MatchChallengeType.weeklyContract or f72_arg1 == CoD.BlackMarketUtility.MatchChallengeType.dailyAndWeeklyContract then
			local f72_local3 = CoD.GetContractStatValuesForIndex( f72_arg0, LuaUtils.BMContracts.weeklyContractIndex1, f72_local1, false )
			local f72_local4 = CoD.GetContractStatValuesForIndex( f72_arg0, LuaUtils.BMContracts.weeklyContractIndex1, f72_local2, true )
			local f72_local5 = CoD.GetContractStatValuesForIndex( f72_arg0, LuaUtils.BMContracts.weeklyContractIndex2, f72_local1, false )
			local f72_local6 = CoD.GetContractStatValuesForIndex( f72_arg0, LuaUtils.BMContracts.weeklyContractIndex2, f72_local2, true )
			if f72_local3 and f72_local4 and f72_local5 and f72_local6 then
				if f72_local4.isActive and f72_local3.progress < f72_local3.targetValue and f72_local4.targetValue <= f72_local4.progress and f72_local5.targetValue <= f72_local5.progress then
					f72_local0 = f72_local0 + Dvar.weekly_contract_cryptokey_reward_count:get()
				end
				if f72_local6.isActive and f72_local5.progress < f72_local5.targetValue and f72_local6.targetValue <= f72_local6.progress and f72_local4.targetValue <= f72_local4.progress then
					f72_local0 = f72_local0 + Dvar.weekly_contract_cryptokey_reward_count:get()
				end
			end
		end
	end
	return f72_local0
end

CoD.BlackMarketUtility.GetCryptoKeyCountPostMatch = function ( f73_arg0, f73_arg1 )
	return f73_arg1.cryptoKeysBeforeMatch:get() + CoD.BlackMarketUtility.GetCryptoKeysFromMatchChallenges( f73_arg0, CoD.BlackMarketUtility.MatchChallengeType.dailyAndWeeklyContract ) + math.floor( (f73_arg1.lootXPBeforeMatch:get() + f73_arg1.lootXPEarned:get()) / CoD.BlackMarketUtility.XPPerCryptoKey )
end

CoD.BlackMarketUtility.GetCrateCODPointCost = function ( f74_arg0 )
	if not AreCodPointsEnabled( 0 ) then
		return 0
	else
		return CoD.BlackMarketUtility.GetCrateDvarVal( f74_arg0, "_cpCost" )
	end
end

CoD.BlackMarketUtility.GetCrateCODPointDiscount = function ( f75_arg0 )
	if not AreCodPointsEnabled( 0 ) then
		return 0
	else
		return CoD.BlackMarketUtility.GetCrateDvarVal( f75_arg0, "_cpDiscount" )
	end
end

CoD.BlackMarketUtility.GetCurrentCryptoKeyCount = function ( f76_arg0 )
	if LUI.DEV and Dvar.ui_cryptokeys:exists() then
		return tonumber( Dvar.ui_cryptokeys:get() )
	elseif not f76_arg0 then
		f76_arg0 = Engine.GetPrimaryController()
	end
	return Engine.GetCryptoKeyCount( f76_arg0 ) or 0
end

CoD.BlackMarketUtility.GetProgressTowardNextKey = function ( f77_arg0 )
	if LUI.DEV and Dvar.ui_cryptokeyprogress:exists() then
		return tonumber( Dvar.ui_cryptokeyprogress:get() )
	elseif not f77_arg0 then
		f77_arg0 = Engine.GetPrimaryController()
	end
	return (Engine.GetCryptoKeyProgress( f77_arg0 ) or 0) / CoD.BlackMarketUtility.XPPerCryptoKey
end

CoD.BlackMarketUtility.GetNumDupesForType = function ( f78_arg0, f78_arg1 )
	if LUI.DEV then
		if f78_arg1 == Enum.LootRarityType.LOOT_RARITY_TYPE_COMMON and Dvar.ui_cryptocommondupes:exists() then
			return tonumber( Dvar.ui_cryptocommondupes:get() )
		elseif f78_arg1 == Enum.LootRarityType.LOOT_RARITY_TYPE_RARE and Dvar.ui_cryptoraredupes:exists() then
			return tonumber( Dvar.ui_cryptoraredupes:get() )
		elseif f78_arg1 == Enum.LootRarityType.LOOT_RARITY_TYPE_LEGENDARY and Dvar.ui_cryptolegendarydupes:exists() then
			return tonumber( Dvar.ui_cryptolegendarydupes:get() )
		elseif f78_arg1 == Enum.LootRarityType.LOOT_RARITY_TYPE_EPIC and Dvar.ui_cryptoepicdupes:exists() then
			return tonumber( Dvar.ui_cryptoepicdupes:get() )
		end
	end
	local f78_local0 = Engine.GetLootDuplicateCount( f78_arg0, Enum.eModes.MODE_MULTIPLAYER, f78_arg1 )
	if f78_local0 == nil then
		f78_local0 = 0
	end
	return f78_local0
end

local f0_local0 = {
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
CoD.BlackMarketUtility.CreateBatchKeysBundle = function ( f79_arg0, f79_arg1 )
	return {
		batchKeys = f79_arg0,
		stateName = f79_arg1
	}
end

CoD.BlackMarketUtility.DoCryptoKeyAnimationSequenceStage = function ( f80_arg0, f80_arg1, f80_arg2, f80_arg3, f80_arg4, f80_arg5 )
	f80_arg0.cryptokeyProgressForNewKey:setShaderVector( 0, f80_arg2 / CoD.BlackMarketUtility.XPPerCryptoKey, 0, 0, 0 )
	local f80_local0 = Engine.CreateModel( Engine.GetModelForController( f80_arg1 ), "CryptoKeyProgress" )
	local f80_local1 = CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f80_arg1 ) - math.floor( f80_arg3 / CoD.BlackMarketUtility.XPPerCryptoKey ) - math.floor( f80_arg2 / CoD.BlackMarketUtility.XPPerCryptoKey )
	local f80_local2 = 0
	local f80_local3 = "DefaultState"
	if #f80_arg4 > 0 then
		f80_local2 = f80_arg4[1].batchKeys or 0
		f80_local3 = f80_arg4[1].stateName or "DefaultState"
		table.remove( f80_arg4, 1 )
	end
	Engine.SetModelValue( Engine.CreateModel( f80_local0, "keyCount" ), f80_local1 )
	Engine.SetModelValue( Engine.CreateModel( f80_local0, "challengeCryptoKeys" ), f80_local2 )
	if f80_arg0.ContractCryptokeyBatch then
		f80_arg0.ContractCryptokeyBatch:setState( f80_local3 )
	end
	if f80_local2 > 0 then
		f80_arg0:playClip( "NewKeyBatch" )
	else
		f80_arg0:playClip( "NewKey" )
	end
	f80_arg0:addElement( LUI.UITimer.newElementTimer( 600, true, function ()
		if 0 < f80_local2 then
			Engine.SetModelValue( Engine.GetModel( f80_local0, "keyCount" ), f80_local1 + f80_local2 )
		else
			Engine.SetModelValue( Engine.GetModel( f80_local0, "keyCount" ), f80_local1 + 1 )
		end
	end ) )
	f80_arg0.cryptokeyProgressForNewKey:setShaderVector( 0, 1, 0, 0, 0 )
	f80_arg0:registerEventHandler( "clip_over", function ( element, event )
		if 0 < f80_local2 then
			f80_arg3 = f80_arg3 - f80_local2 * CoD.BlackMarketUtility.XPPerCryptoKey
		else
			f80_arg3 = f80_arg3 - CoD.BlackMarketUtility.XPPerCryptoKey
		end
		if f80_arg3 >= CoD.BlackMarketUtility.XPPerCryptoKey then
			f80_arg2 = 0
			CoD.BlackMarketUtility.DoCryptoKeyAnimationSequenceStage( f80_arg0, f80_arg1, f80_arg2, f80_arg3, f80_arg4, f80_arg5 )
		else
			f80_arg0.cryptokeyProgressForNewKey:setShaderVector( 0, 0, 0, 0, 0 )
			f80_arg0:playClip( "NewXPNoNewKey" )
			f80_arg0.cryptokeyProgressForNewKey:setShaderVector( 0, f80_arg3 / CoD.BlackMarketUtility.XPPerCryptoKey, 0, 0, 0 )
			f80_arg0:registerEventHandler( "clip_over", function ( element, event )
				f80_arg0:registerEventHandler( "clip_over", CoD.NullFunction )
				f80_arg0:playClip( "DefaultClip" )
				if f80_arg5 then
					f80_arg5()
				end
			end )
		end
	end )
end

CoD.BlackMarketUtility.DoCryptoKeyAnimationSequence = function ( f84_arg0, f84_arg1, f84_arg2, f84_arg3, f84_arg4, f84_arg5 )
	if f84_arg3 < CoD.BlackMarketUtility.XPPerCryptoKey then
		f84_arg0.cryptokeyProgressForNewKey:setShaderVector( 0, f84_arg2 / CoD.BlackMarketUtility.XPPerCryptoKey, 0, 0, 0 )
		f84_arg0:playClip( "NewXPNoNewKey" )
		f84_arg0.cryptokeyProgressForNewKey:setShaderVector( 0, f84_arg3 / CoD.BlackMarketUtility.XPPerCryptoKey, 0, 0, 0 )
		f84_arg0:registerEventHandler( "clip_over", function ( element, event )
			f84_arg0:registerEventHandler( "clip_over", CoD.NullFunction )
			f84_arg0:playClip( "DefaultClip" )
			if f84_arg5 then
				f84_arg5()
			end
		end )
	else
		CoD.BlackMarketUtility.DoCryptoKeyAnimationSequenceStage( f84_arg0, f84_arg1, f84_arg2, f84_arg3, f84_arg4, f84_arg5 )
	end
end

CoD.BlackMarketUtility.HasShownAARCryptoKeyAnimation = false
CoD.BlackMarketUtility.DoAARCryptoKeyAnimation = function ( f86_arg0, f86_arg1 )
	CoD.BlackMarketUtility.HasShownAARCryptoKeyAnimation = false
	if CoD.BlackMarketUtility.HasShownAARCryptoKeyAnimation and not CoD.AARUtility.UseTestData() then
		return 
	end
	local f86_local0 = CoD.GetPlayerStats( f86_arg1 )
	if (not f86_local0 or not f86_local0.AfterActionReportStats or not f86_local0.AfterActionReportStats.cryptoKeysBeforeMatch) and not CoD.AARUtility.UseTestData() then
		return 
	end
	local f86_local1 = 0
	local f86_local2 = 0
	local f86_local3 = 0
	local f86_local4 = f86_local0.AfterActionReportStats
	local f86_local5 = CoD.BlackMarketUtility.GetCryptoKeysFromMatchChallenges( f86_arg1, CoD.BlackMarketUtility.MatchChallengeType.dailyContract )
	local f86_local6 = CoD.BlackMarketUtility.GetCryptoKeysFromMatchChallenges( f86_arg1, CoD.BlackMarketUtility.MatchChallengeType.weeklyContract )
	if CoD.AARUtility.UseTestData() then
		f86_local1 = CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f86_arg1 )
		f86_local2 = CoD.BlackMarketUtility.GetProgressTowardNextKey( f86_arg1 ) * CoD.BlackMarketUtility.XPPerCryptoKey
		f86_local3 = 333 + f86_local5 * CoD.BlackMarketUtility.XPPerCryptoKey + f86_local6 * CoD.BlackMarketUtility.XPPerCryptoKey
	else
		f86_local1 = f86_local4.cryptoKeysBeforeMatch:get()
		f86_local2 = f86_local4.lootXPBeforeMatch:get()
		f86_local3 = f86_local4.lootXPEarned:get() + (f86_local5 + f86_local6) * CoD.BlackMarketUtility.XPPerCryptoKey
	end
	local f86_local7 = f86_local2 + f86_local3
	local f86_local8 = CoD.BlackMarketUtility.GetCrateCryptoKeyCost( CoD.BlackMarketUtility.DropTypes.COMMON )
	if math.floor( f86_local1 / f86_local8 ) < math.floor( f86_local7 / CoD.BlackMarketUtility.XPPerCryptoKey / f86_local8 ) then
		local f86_local9 = CoD.GetPlayerStats( f86_arg1 )
		f86_local9.blackMarketShowBreadcrumb:set( 1 )
	end
	if LUI.DEV and Dvar.ui_cryptokeys:exists() and Dvar.ui_cryptokeyprogress:exists() then
		if CoD.BlackMarketUtility.XPPerCryptoKey < f86_local7 then
			Dvar.ui_cryptokeys:set( Dvar.ui_cryptokeys:get() + 1 )
		end
		Dvar.ui_cryptokeyprogress:set( f86_local7 % CoD.BlackMarketUtility.XPPerCryptoKey / CoD.BlackMarketUtility.XPPerCryptoKey )
		DataSources.CryptoKeyProgress.getModel( f86_arg1 )
	end
	if not CoD.AARUtility.UseTestData() and CoD.BlackMarketUtility.GetCurrentCryptoKeyCount( f86_arg1 ) ~= CoD.BlackMarketUtility.GetCryptoKeyCountPostMatch( f86_arg1, f86_local4 ) then
		f86_local2 = f86_local7 % CoD.BlackMarketUtility.XPPerCryptoKey
		f86_local7 = f86_local7 % CoD.BlackMarketUtility.XPPerCryptoKey
		f86_local5 = 0
		f86_local6 = 0
		local f86_local9 = CoD.GetPlayerStats( f86_arg1 )
		f86_local9.blackMarketShowBreadcrumb:set( 0 )
	end
	local f86_local9 = {}
	if f86_local5 > 0 then
		table.insert( f86_local9, CoD.BlackMarketUtility.CreateBatchKeysBundle( f86_local5, "DailyContract" ) )
	end
	if f86_local6 > 0 then
		table.insert( f86_local9, CoD.BlackMarketUtility.CreateBatchKeysBundle( f86_local6, "WeeklyContract" ) )
	end
	CoD.BlackMarketUtility.DoCryptoKeyAnimationSequence( f86_arg0, f86_arg1, f86_local2, f86_local7, f86_local9, function ()
		CoD.BlackMarketUtility.HasShownAARCryptoKeyAnimation = true
	end )
end

CoD.BlackMarketUtility.DoBurnCryptoKeyAnimation = function ( f88_arg0, f88_arg1, f88_arg2, f88_arg3, f88_arg4 )
	CoD.BlackMarketUtility.DoCryptoKeyAnimationSequence( f88_arg0, f88_arg1, f88_arg2, f88_arg3, {}, f88_arg4 )
end

CoD.BlackMarketUtility.GetFakeItem = function ( f89_arg0 )
	return f0_local0[math.random( 1, #f0_local0 )]
end

CoD.BlackMarketUtility.SpendKeysForCrate = function ( f90_arg0, f90_arg1 )
	if LUI.DEV and Dvar.ui_cryptokeys:exists() then
		Dvar.ui_cryptokeys:set( tonumber( Dvar.ui_cryptokeys:get() ) - f90_arg1 )
	end
end

CoD.BlackMarketUtility.GetNumDupesTotal = function ( f91_arg0 )
	return CoD.BlackMarketUtility.GetNumDupesForType( f91_arg0, Enum.LootRarityType.LOOT_RARITY_TYPE_COMMON ) + CoD.BlackMarketUtility.GetNumDupesForType( f91_arg0, Enum.LootRarityType.LOOT_RARITY_TYPE_RARE ) + CoD.BlackMarketUtility.GetNumDupesForType( f91_arg0, Enum.LootRarityType.LOOT_RARITY_TYPE_LEGENDARY ) + CoD.BlackMarketUtility.GetNumDupesForType( f91_arg0, Enum.LootRarityType.LOOT_RARITY_TYPE_EPIC )
end

CoD.BlackMarketUtility.GetXPEarnedForBurning = function ( f92_arg0, f92_arg1, f92_arg2, f92_arg3, f92_arg4 )
	return f92_arg1 * CoD.BlackMarketUtility.BurnReturnXP( Enum.LootRarityType.LOOT_RARITY_TYPE_COMMON ) + f92_arg2 * CoD.BlackMarketUtility.BurnReturnXP( Enum.LootRarityType.LOOT_RARITY_TYPE_RARE ) + f92_arg3 * CoD.BlackMarketUtility.BurnReturnXP( Enum.LootRarityType.LOOT_RARITY_TYPE_LEGENDARY ) + f92_arg4 * CoD.BlackMarketUtility.BurnReturnXP( Enum.LootRarityType.LOOT_RARITY_TYPE_EPIC )
end

CoD.BlackMarketUtility.GetNumKeysEarnedForBurning = function ( f93_arg0, f93_arg1, f93_arg2, f93_arg3, f93_arg4 )
	return math.floor( (CoD.BlackMarketUtility.GetProgressTowardNextKey( f93_arg0 ) * CoD.BlackMarketUtility.XPPerCryptoKey + CoD.BlackMarketUtility.GetXPEarnedForBurning( f93_arg0, f93_arg1, f93_arg2, f93_arg3, f93_arg4 )) / CoD.BlackMarketUtility.XPPerCryptoKey )
end

CoD.BlackMarketUtility.GetItemQuantity = function ( f94_arg0, f94_arg1 )
	if f94_arg1 then
		return Engine.GetLootItemQuantity( f94_arg0, f94_arg1, Enum.eModes.MODE_MULTIPLAYER )
	else
		return 0
	end
end

CoD.BlackMarketUtility.UnlockedByPrerequisites = function ( f95_arg0, f95_arg1 )
	return Engine.IsLootItemUnlockedByPreRequisites( f95_arg0, f95_arg1, Enum.eModes.MODE_MULTIPLAYER )
end

CoD.BlackMarketUtility.IsItemLocked = function ( f96_arg0, f96_arg1 )
	if Dvar.ui_allLootUnlocked:get() == "1" then
		return false
	elseif f96_arg1 then
		local f96_local0 = CoD.BlackMarketUtility.GetItemQuantity( f96_arg0, f96_arg1 )
		if f96_local0 == nil then
			local f96_local1 = CoD.BlackMarketUtility.UnlockedByPrerequisites( f96_arg0, f96_arg1 )
			if f96_local1 ~= nil then
				return not f96_local1
			end
		end
		if f96_local0 == nil or f96_local0 == 0 then
			return true
		else
			return false
		end
	else
		return false
	end
end

CoD.BlackMarketUtility.ClassContainsLockedItems = function ( f97_arg0, f97_arg1 )
	local f97_local0 = CoD.SafeGetModelValue( f97_arg1, "primary.ref" )
	if f97_local0 and f97_local0 ~= "" and CoD.BlackMarketUtility.GetItemQuantity( f97_arg0, f97_local0 ) == 0 then
		return true
	else
		local f97_local1 = CoD.SafeGetModelValue( f97_arg1, "secondary.ref" )
		if f97_local1 and f97_local1 ~= "" and CoD.BlackMarketUtility.GetItemQuantity( f97_arg0, f97_local1 ) == 0 then
			return true
		else
			return false
		end
	end
end

CoD.BlackMarketUtility.ClassifiedName = function ( f98_arg0 )
	local f98_local0 = "MENU_CLASSIFIED"
	if f98_arg0 then
		return Engine.Localize( f98_local0 )
	else
		return f98_local0
	end
end

CoD.BlackMarketUtility.GetCallingCardSetTable = function ( f99_arg0 )
	for f99_local3, f99_local4 in ipairs( CoD.BlackMarketUtility.CallingCardsTable ) do
		if f99_local4.name == f99_arg0 then
			return f99_local4
		end
	end
end

CoD.BlackMarketUtility.GetCallingCardRows = function ()
	local f100_local0 = "calling_card"
	local f100_local1 = 2
	local f100_local2 = 0
	local f100_local3 = Engine.TableFindRows( CoD.BlackMarketUtility.lootTableName, f100_local1, f100_local0 )
	for f100_local4 = #f100_local3, 1, -1 do
		if CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, f100_local3[f100_local4], f100_local2 ) ) then
			table.remove( f100_local3, f100_local4 )
		end
	end
	return f100_local3
end

CoD.BlackMarketUtility.GetLootTypeRows = function ( f101_arg0 )
	return Engine.TableFindRows( CoD.BlackMarketUtility.lootTableName, 2, f101_arg0 )
end

CoD.BlackMarketUtility.AddSpecialContractCallingCardSet = function ( f102_arg0, f102_arg1 )
	local f102_local0 = CoD.ChallengesUtility.GetChallengeTable( f102_arg0, Enum.eModes.MODE_MULTIPLAYER, "mp", f102_arg1, function ( f103_arg0, f103_arg1 )
		return tonumber( f103_arg0.imageID ) < tonumber( f103_arg1.imageID )
	end, false )
	local f102_local1 = {
		name = f102_arg1,
		callingCards = {},
		iconId = 0,
		newCount = 0,
		masterCardIconId = 0,
		isSetBMClassified = false,
		isSetContractClassified = false,
		totalSetCount = #f102_local0 - 1,
		setCount = Engine.Localize( "MPUI_BM_SET_X_OF_Y", 0, 6 ),
		isBMClassified = false,
		isContractClassified = true,
		rarity = "",
		title = "CONTRACT_MP_ACTION_CALLING_CARD"
	}
	local f102_local2 = 0
	for f102_local6, f102_local7 in ipairs( f102_local0 ) do
		if not f102_local7.properties.isExpert then
			if not f102_local7.models.isLocked then
				f102_local2 = f102_local2 + 1
				if f102_local1.iconId == 0 then
					f102_local1.iconId = f102_local7.models.iconId
				end
			end
			if not f102_local7.models.isLocked and Engine.IsEmblemBackgroundNew( f102_arg0, f102_local7.models.iconId ) then
				f102_local1.newCount = f102_local1.newCount + 1
			end
			table.insert( f102_local1.callingCards, {
				rarity = "",
				title = Engine.TableLookup( nil, CoD.backgroundsTable, 1, f102_local7.models.iconId, 4 ),
				isBMClassified = false,
				isContractClassified = f102_local7.models.isLocked,
				isLocked = false,
				sortKey = f102_local6,
				iconId = f102_local7.models.iconId,
				name = f102_arg1,
				duplicateCount = 0,
				description = f102_local7.models.description
			} )
		end
		f102_local1.masterCardIconId = f102_local7.models.iconId
	end
	if f102_local2 == f102_local1.totalSetCount then
		f102_local1.iconId = f102_local1.masterCardIconId
		f102_local1.isContractClassified = false
		if Engine.IsEmblemBackgroundNew( f102_arg0, f102_local1.masterCardIconId ) then
			f102_local1.newCount = f102_local1.newCount + 1
		end
	end
	f102_local1.setCount = Engine.Localize( "MPUI_BM_SET_X_OF_Y", f102_local2, f102_local1.totalSetCount )
	f102_local1.isSetContractClassified = f102_local2 < 1
	f102_local1.isSpecialContractSet = true
	return f102_local1
end

CoD.BlackMarketUtility.BuildCallingCardSets = function ( f104_arg0 )
	CoD.BlackMarketUtility.CallingCardsTable = {}
	CoD.BlackMarketUtility.CommonCallingCardsTable = {}
	local f104_local0 = {}
	local f104_local1 = {}
	local f104_local2 = "calling_card"
	local f104_local3 = 0
	local f104_local4 = 4
	local f104_local5 = 5
	local f104_local6 = CoD.BlackMarketUtility.GetCallingCardRows()
	local f104_local7 = 0
	local f104_local8 = 0
	local f104_local9 = 0
	for f104_local16, f104_local17 in ipairs( f104_local6 ) do
		local f104_local18 = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, f104_local17, f104_local3 )
		local f104_local19 = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, f104_local17, f104_local4 )
		local f104_local20 = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, f104_local17, f104_local5 )
		local f104_local21 = CoD.BlackMarketUtility.GetCallingCardTitleFromImage( f104_local18 )
		local f104_local22 = CoD.BlackMarketUtility.GetLootCallingCardIndex( f104_arg0, f104_local18 )
		local f104_local23 = CoD.BlackMarketUtility.GetRarityForLootItemFromName( f104_local18 )
		local f104_local24 = CoD.BlackMarketUtility.GetItemQuantity( f104_arg0, f104_local18 )
		if f104_local19 ~= "" then
			if not f104_local1[f104_local19] then
				f104_local1[f104_local19] = {}
			end
			table.insert( f104_local1[f104_local19], {
				title = f104_local21,
				name = f104_local18,
				rarity = f104_local23,
				duplicateCount = f104_local24,
				iconId = f104_local22,
				sortKey = CoD.BlackMarketUtility.GetCallingCardSortKeyFromImage( f104_local18 ),
				isBMClassified = CoD.BlackMarketUtility.IsItemLocked( f104_arg0, f104_local18 ),
				isContractClassified = false
			} )
		end
		if f104_local20 ~= "" then
			local f104_local13 = {}
			local f104_local14 = CoD.BlackMarketUtility.GetRarityForCallingCardSetFromSetName( f104_local20 )
			local f104_local15 = nil
			f104_local13.name = f104_local20
			f104_local13.title = f104_local21
			f104_local13.setCount = CoD.BlackMarketUtility.GetSetPieceStringForLootSet( f104_arg0, f104_local20, f104_local2 )
			f104_local15, f104_local13.totalSetCount, f104_local13.newCount = CoD.BlackMarketUtility.GetNumOwnedAndTotalForCallingCardSet( f104_arg0, f104_local20 )
			f104_local13.iconId = 0
			f104_local13.masterCardIconId = f104_local22
			f104_local13.rarity = f104_local14
			if Engine.IsEmblemBackgroundNew( f104_arg0, f104_local22 ) and not BlackMarketHideMasterCallingCards() then
				f104_local13.newCount = f104_local13.newCount + 1
			end
			table.insert( f104_local0, f104_local13 )
		end
		f104_local7 = f104_local7 + 1
		local f104_local13 = CoD.BlackMarketUtility.IsItemLocked( f104_arg0, f104_local18 )
		if not f104_local13 then
			f104_local8 = f104_local8 + 1
		end
		local f104_local14 = CoD.BlackMarketUtility.GetLootCallingCardIndex( f104_arg0, f104_local18 )
		if f104_local14 and Engine.IsEmblemBackgroundNew( f104_arg0, f104_local14 ) then
			f104_local9 = f104_local9 + 1
		end
		table.insert( CoD.BlackMarketUtility.CommonCallingCardsTable, {
			title = f104_local21,
			name = f104_local18,
			rarity = f104_local23,
			duplicateCount = f104_local24,
			iconId = f104_local22,
			isBMClassified = f104_local13,
			isContractClassified = false
		} )
	end
	for f104_local16, f104_local17 in pairs( f104_local0 ) do
		if f104_local1[f104_local17.name] then
			f104_local17.callingCards = f104_local1[f104_local17.name]
			local f104_local18 = true
			local f104_local19 = false
			for f104_local23, f104_local24 in ipairs( f104_local17.callingCards ) do
				if f104_local24.isBMClassified == false then
					f104_local18 = false
					if f104_local17.iconId == 0 then
						f104_local17.iconId = CoD.BlackMarketUtility.GetLootCallingCardIndex( f104_arg0, f104_local24.name )
					end
				end
				f104_local19 = true
			end
			if BlackMarketHideMasterCallingCards() then
				f104_local19 = true
			end
			if not f104_local17.iconId then
				f104_local17.iconId = 0
			end
			f104_local17.isBMClassified = f104_local19
			f104_local17.isSetBMClassified = f104_local18
			f104_local17.isSetContractClassified = false
		end
	end
	if not Dvar.ui_disable_side_bet:exists() or Dvar.ui_disable_side_bet:get() == "0" then
		f104_local11 = CoD.ChallengesUtility.GetSideBetCallingCards( f104_arg0, function ( f105_arg0, f105_arg1 )
			return tonumber( f105_arg0.imageID ) < tonumber( f105_arg1.imageID )
		end )
		f104_local12 = {
			name = CoD.BlackMarketUtility.SideBetSetName,
			callingCards = {},
			iconId = f104_local11[1].models.iconId,
			newCount = 0,
			masterCardIconId = 0,
			isSetBMClassified = false,
			isSetContractClassified = false,
			totalSetCount = #f104_local11 - 1,
			setCount = Engine.Localize( "MPUI_BM_SET_X_OF_Y", 0, 6 ),
			isBMClassified = true,
			isContractClassified = false,
			rarity = "",
			title = "CONTRACT_SIDE_BET_CALLING_CARD"
		}
		f104_local16 = 0
		for f104_local20, f104_local21 in ipairs( f104_local11 ) do
			if not f104_local21.properties.isExpert then
				if not f104_local21.models.isLocked then
					f104_local16 = f104_local16 + 1
					f104_local12.iconId = f104_local21.models.iconId
				end
				if not f104_local21.models.isLocked and Engine.IsEmblemBackgroundNew( f104_arg0, f104_local21.models.iconId ) then
					f104_local12.newCount = f104_local12.newCount + 1
				end
				table.insert( f104_local12.callingCards, {
					rarity = "",
					title = Engine.TableLookup( nil, CoD.backgroundsTable, 1, f104_local21.models.iconId, 4 ),
					isBMClassified = f104_local16 < f104_local20 - 1,
					isContractClassified = false,
					isLocked = f104_local16 < f104_local20,
					sortKey = f104_local20,
					iconId = f104_local21.models.iconId,
					name = CoD.BlackMarketUtility.SideBetSetName,
					duplicateCount = 0,
					description = f104_local21.models.description
				} )
			end
			f104_local12.masterCardIconId = f104_local21.models.iconId
			if not f104_local21.models.isLocked then
				f104_local12.iconId = f104_local21.models.iconId
				f104_local12.isBMClassified = false
				if Engine.IsEmblemBackgroundNew( f104_arg0, f104_local21.models.iconId ) then
					f104_local12.newCount = f104_local12.newCount + 1
				end
			end
		end
		f104_local12.setCount = Engine.Localize( "MPUI_BM_SET_X_OF_Y", f104_local16, f104_local12.totalSetCount )
		f104_local12.isSetBMClassified = f104_local16 < 1
		table.insert( f104_local0, f104_local12 )
	end
	table.insert( f104_local0, CoD.BlackMarketUtility.AddSpecialContractCallingCardSet( f104_arg0, "mp_action" ) )
	table.sort( f104_local0, CoD.BlackMarketUtility.SortUnlockIconId )
	CoD.BlackMarketUtility.CallingCardsTable = f104_local0
	return f104_local8, f104_local8 .. " / " .. f104_local7, f104_local9
end

CoD.BlackMarketUtility.SortUnlockIconId = function ( f106_arg0, f106_arg1 )
	if f106_arg0.isSetBMClassified ~= f106_arg1.isSetBMClassified then
		return f106_arg1.isSetBMClassified
	elseif f106_arg0.isSetContractClassified ~= f106_arg1.isSetContractClassified then
		return f106_arg1.isSetContractClassified
	elseif f106_arg0.name == CoD.BlackMarketUtility.SideBetSetName then
		return true
	elseif f106_arg1.name == CoD.BlackMarketUtility.SideBetSetName then
		return false
	elseif f106_arg0.isSpecialContractSet ~= f106_arg1.isSpecialContractSet then
		return f106_arg0.isSpecialContractSet == true
	else
		return f106_arg0.iconId < f106_arg1.iconId
	end
end

CoD.BlackMarketUtility.SortUnlocksModelIconId = function ( f107_arg0, f107_arg1 )
	if f107_arg0.models.isBMClassified ~= f107_arg1.models.isBMClassified then
		return f107_arg1.models.isBMClassified
	else
		return f107_arg0.models.iconId < f107_arg1.models.iconId
	end
end

CoD.BlackMarketUtility.SortUnlocksPropertyIndex = function ( f108_arg0, f108_arg1 )
	if f108_arg0.models.isBMClassified ~= f108_arg1.models.isBMClassified then
		return f108_arg1.models.isBMClassified
	else
		return f108_arg0.properties.index < f108_arg1.properties.index
	end
end

CoD.BlackMarketUtility.SortUnlocksPropertyVariantIndex = function ( f109_arg0, f109_arg1 )
	if f109_arg0.models.isBMClassified ~= f109_arg1.models.isBMClassified then
		return f109_arg1.models.isBMClassified
	else
		return f109_arg0.properties.variantIndex < f109_arg1.properties.variantIndex
	end
end

CoD.BlackMarketUtility.SortUnlocksModelIconID = function ( f110_arg0, f110_arg1 )
	local f110_local0 = Engine.GetModelValue( Engine.GetModel( f110_arg0, "isBMClassified" ) )
	local f110_local1 = Engine.GetModelValue( Engine.GetModel( f110_arg1, "isBMClassified" ) )
	if f110_local0 ~= f110_local1 then
		return f110_local1
	else
		return Engine.GetModelValue( Engine.GetModel( f110_arg0, "iconID" ) ) < Engine.GetModelValue( Engine.GetModel( f110_arg1, "iconID" ) )
	end
end

CoD.BlackMarketUtility.SortUnlocksModelWOSubIndex = function ( f111_arg0, f111_arg1 )
	local f111_local0 = Engine.GetModelValue( Engine.GetModel( f111_arg0, "isBMClassified" ) )
	local f111_local1 = Engine.GetModelValue( Engine.GetModel( f111_arg1, "isBMClassified" ) )
	if f111_local0 ~= f111_local1 then
		return f111_local1
	else
		return Engine.GetModelValue( Engine.GetModel( f111_arg0, "weaponOptionSubIndex" ) ) < Engine.GetModelValue( Engine.GetModel( f111_arg1, "weaponOptionSubIndex" ) )
	end
end

CoD.BlackMarketUtility.TradeForCrateAction = function ( f112_arg0, f112_arg1, f112_arg2, f112_arg3, f112_arg4, f112_arg5, f112_arg6 )
	local f112_local0 = f112_arg3.supplyDropType
	if not (f112_local0 ~= CoD.BlackMarketUtility.DropTypes.BUNDLE and (f112_local0 ~= CoD.BlackMarketUtility.DropTypes.HUNDRED_BUNDLE or f112_arg5 == Enum.InventoryCurrency.INVENTORY_CURRENCY_MP_BUNDLE_ITEM)) or f112_local0 == CoD.BlackMarketUtility.DropTypes.RARE_BUNDLE_10FOR5 and f112_arg5 ~= Enum.InventoryCurrency.INVENTORY_CURRENCY_MP_BUNDLE_ITEM then
		local f112_local1 = f112_local0 == CoD.BlackMarketUtility.DropTypes.HUNDRED_BUNDLE
		local f112_local2 = f112_local0 == CoD.BlackMarketUtility.DropTypes.RARE_BUNDLE_10FOR5
		local f112_local3 = Engine.DvarInt( f112_arg2, "rare_crate_bundle_sku" )
		if f112_local1 then
			f112_local3 = CoD.BlackMarketUtility.loot_hundred_bundle_sku
		elseif f112_local2 then
			f112_local3 = CoD.BlackMarketUtility.rare_bundle_10for5_sku
		end
		if f112_local3 == nil or f112_local3 == 0 or not Engine.PurchaseDWSKU( f112_arg2, f112_local3 ) then
			GoBack( f112_arg4, f112_arg2 )
			LuaUtils.UI_ShowErrorMessageDialog( f112_arg2, "MPUI_BM_BUNDLE_PURCHASE_FAILED", "" )
			return 
		else
			f112_arg4[CoD.OverlayUtility.GoBackPropertyName] = nil
			CoD.Menu.UpdateAllButtonPrompts( f112_arg4, f112_arg2 )
			f112_arg0:setState( "PurchasingBundle" )
			f112_arg0.PurchasingBundle:playClip( "StartPurchasing" )
			f112_arg0.PurchasingBundle.nextClip = "Purchasing"
			f112_arg6.purchasingBundle = true
			f112_arg6:updateDataSource()
			f112_arg0.PurchasingBundle:registerEventHandler( "clip_over", function ( element, event )
				if Engine.IsInventoryBusy( f112_arg2 ) or Engine.GetPurchaseDWSKUResult( f112_arg2 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_INPROGRESS then
					LUI.UIElement.clipOver( element, event )
				else
					if Engine.GetPurchaseDWSKUResult( f112_arg2 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_FAILURE then
						GoBack( f112_arg4, f112_arg2 )
						LuaUtils.UI_ShowErrorMessageDialog( f112_arg2, "MPUI_BM_CRATE_PURCHASED_FAILED", "" )
						return 
					end
					f112_arg4[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack()
					CoD.Menu.UpdateAllButtonPrompts( f112_arg4, f112_arg2 )
					element:registerEventHandler( "clip_over", function ( element, event )
						element:registerEventHandler( "clip_over", LUI.UIElement.clipOver )
					end )
					element:playClip( "StopPurchasing" )
					f112_arg0:setState( "PurchasedBundle" )
					f112_arg6.purchasedBundleType = CoD.BlackMarketUtility.DropTypes.RARE
					if f112_local1 then
						f112_arg6.purchasedBundleType = CoD.BlackMarketUtility.DropTypes.HUNDRED_BUNDLE
					elseif f112_local2 then
						f112_arg6.purchasedBundleType = CoD.BlackMarketUtility.DropTypes.RARE_BUNDLE_10FOR5
					end
					f112_arg6.purchasingBundle = false
					f112_arg6.purchasedBundle = true
					f112_arg6:updateDataSource()
				end
			end )
			return 
		end
	end
	local f112_local1 = f112_local0 == CoD.BlackMarketUtility.DropTypes.SIX_PACK
	local f112_local2 = f112_local0 == CoD.BlackMarketUtility.DropTypes.DAILY_DOUBLE
	local f112_local3 = f112_local0 == CoD.BlackMarketUtility.DropTypes.BUNDLE_EXPERIMENT
	local f112_local4 = f112_local0 == CoD.BlackMarketUtility.DropTypes.NO_DUPES_BUNDLE
	local f112_local5 = f112_local0 == CoD.BlackMarketUtility.DropTypes.GRAND_SLAM
	if (f112_local1 or f112_local2 or f112_local3 or f112_local4 or f112_local5) and f112_arg5 ~= Enum.InventoryCurrency.INVENTORY_CURRENCY_MP_BUNDLE_ITEM then
		local f112_local6 = Engine.DvarInt( nil, "loot_sixPack_crate_dwid" )
		if f112_local2 then
			f112_local6 = Engine.DvarInt( nil, "loot_dailyDouble_dwid" )
		elseif f112_local3 then
			f112_local6 = Engine.DvarInt( nil, "loot_3pack_bundle_sku" )
		elseif f112_local4 then
			f112_local6 = Engine.DvarInt( nil, "loot_noduperare20bundle_sku_id" )
		elseif f112_local5 then
			f112_local6 = CoD.BlackMarketUtility.loot_grand_slam_sku
		end
		if f112_local6 == nil or f112_local6 == 0 or not Engine.PurchaseDWSKU( f112_arg2, f112_local6, true, 2 ) then
			GoBack( f112_arg4, f112_arg2 )
			LuaUtils.UI_ShowErrorMessageDialog( f112_arg2, "MPUI_BM_BUNDLE_PURCHASE_FAILED", "" )
			return 
		else
			f112_arg4[CoD.OverlayUtility.GoBackPropertyName] = nil
			CoD.Menu.UpdateAllButtonPrompts( f112_arg4, f112_arg2 )
			f112_arg0:setState( "PurchasingBundle" )
			f112_arg0.PurchasingBundle:playClip( "StartPurchasing" )
			f112_arg0.PurchasingBundle.nextClip = "Purchasing"
			f112_arg6.purchasingBundle = true
			f112_arg6:updateDataSource()
			f112_arg0.PurchasingBundle:registerEventHandler( "clip_over", function ( element, event )
				if Engine.IsInventoryBusy( f112_arg2 ) or Engine.GetPurchaseDWSKUResult( f112_arg2 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_INPROGRESS then
					LUI.UIElement.clipOver( element, event )
				else
					if Engine.GetPurchaseDWSKUResult( f112_arg2 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_FAILURE then
						GoBack( f112_arg4, f112_arg2 )
						LuaUtils.UI_ShowErrorMessageDialog( f112_arg2, "MPUI_BM_BUNDLE_PURCHASE_FAILED", "" )
						return 
					end
					f112_arg4[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack()
					CoD.Menu.UpdateAllButtonPrompts( f112_arg4, f112_arg2 )
					element:registerEventHandler( "clip_over", function ( element, event )
						element:registerEventHandler( "clip_over", LUI.UIElement.clipOver )
					end )
					element:playClip( "StopPurchasing" )
					if f112_local1 then
						f112_arg0:setState( "PurchasedSixPack" )
						f112_arg6.purchasedBundleType = CoD.BlackMarketUtility.DropTypes.COMMON
					elseif f112_local2 then
						f112_arg0:setState( "PurchasedBundle" )
						f112_arg6.purchasedBundleType = CoD.BlackMarketUtility.DropTypes.DAILY_DOUBLE_RARE_BUNDLE
					elseif f112_local3 then
						f112_arg0:setState( "PurchasedBundle" )
						f112_arg6.purchasedBundleType = CoD.BlackMarketUtility.DropTypes.BUNDLE_EXPERIMENT
					elseif f112_local4 then
						f112_arg0:setState( "PurchasedBundle" )
						f112_arg6.purchasedBundleType = CoD.BlackMarketUtility.DropTypes.NO_DUPES_BUNDLE
					elseif f112_local5 then
						f112_arg0:setState( "PurchaseComplete" )
						f112_arg6.purchasedBundleType = CoD.BlackMarketUtility.DropTypes.GRAND_SLAM
					end
					f112_arg6.purchasingBundle = false
					f112_arg6.purchasedBundle = true
					f112_arg6:updateDataSource()
				end
			end )
			return 
		end
	end
	local f112_local6 = f112_arg4
	if f112_arg5 ~= Enum.InventoryCurrency.INVENTORY_CURRENCY_MP_BUNDLE_ITEM then
		f112_local6 = GoBack( f112_arg4, f112_arg2 )
	end
	if f112_local0 == CoD.BlackMarketUtility.DropTypes.SIX_PACK then
		f112_local0 = CoD.BlackMarketUtility.DropTypes.COMMON
	end
	if f112_local0 == CoD.BlackMarketUtility.DropTypes.RARE and f112_arg5 == Enum.InventoryCurrency.INVENTORY_CURRENCY_MP_BUNDLE_ITEM and not IsBundleActive( f112_arg2 ) then
		if CoD.BlackMarketUtility.GetCurrentBundleCount( f112_arg2 ) <= 0 and CoD.BlackMarketUtility.GetCurrentHundredBundleCount( f112_arg2 ) > 0 then
			f112_local0 = CoD.BlackMarketUtility.DropTypes.HUNDRED_BUNDLE
		elseif CoD.BlackMarketUtility.GetCurrentBundleCount( f112_arg2 ) <= 0 and CoD.BlackMarketUtility.GetCurrentRareBundle10for5Count( f112_arg2 ) > 0 then
			f112_local0 = CoD.BlackMarketUtility.DropTypes.RARE_BUNDLE_10FOR5
		end
	end
	local f112_local7 = f112_local0
	if f112_local7 == CoD.BlackMarketUtility.DropTypes.INCENTIVE_RARE_BUNDLE then
		f112_local7 = Dvar.incentive_rare_crate_dwid:get()
	elseif f112_local7 == CoD.BlackMarketUtility.DropTypes.INCENTIVE_WEAPON_BUNDLE then
		f112_local7 = Dvar.incentive_weapon_crate_dwid:get()
	elseif f112_local7 == CoD.BlackMarketUtility.DropTypes.NO_DUPES_RANGE then
		f112_local7 = Dvar.range_weapon_no_dupes_crate_dwid:get()
	elseif f112_local7 == CoD.BlackMarketUtility.DropTypes.NO_DUPES_MELEE then
		f112_local7 = Dvar.melee_weapon_no_dupes_crate_dwid:get()
	elseif f112_local0 == CoD.BlackMarketUtility.DropTypes.DAILY_DOUBLE_RARE_BUNDLE then
		f112_local7 = Dvar.loot_dailyDouble_rare_crate_dwid:get()
	elseif f112_local0 == CoD.BlackMarketUtility.DropTypes.HUNDRED_BUNDLE then
		f112_local7 = Engine.DvarInt( nil, "loot_rare100_dwid" )
	elseif f112_local0 == CoD.BlackMarketUtility.DropTypes.RARE_BUNDLE_10FOR5 then
		f112_local7 = Engine.DvarInt( nil, "rare__bundle_10for5_dwid" )
	elseif f112_local0 == CoD.BlackMarketUtility.DropTypes.BUNDLE_EXPERIMENT then
		f112_local7 = Engine.DvarInt( nil, "loot_3pack_dwid" )
	elseif f112_local0 == CoD.BlackMarketUtility.DropTypes.NO_DUPES_CRATE then
		f112_local7 = Engine.DvarInt( nil, "loot_noDupeRare_dwid" )
	elseif f112_local0 == CoD.BlackMarketUtility.DropTypes.NO_DUPES_BUNDLE then
		f112_local7 = Engine.DvarInt( nil, "loot_noDupeRare20Bundle_dwid" )
	elseif f112_local0 == CoD.BlackMarketUtility.DropTypes.CODE_BUNDLE then
		f112_local7 = CoD.BlackMarketUtility.loot_code_bundle_crate_dwid
	elseif f112_local0 == CoD.BlackMarketUtility.DropTypes.WEAPON_3X then
		f112_local7 = CoD.BlackMarketUtility.loot_weapon_3x_crate_dwid
	elseif f112_local0 == CoD.BlackMarketUtility.DropTypes.LIMITED_EDITION_CAMO then
		f112_local7 = CoD.BlackMarketUtility.loot_limited_edition_camo_crate_dwid
	end
	if Engine.BuyLootCrate( f112_arg2, f112_local7, f112_arg5 ) == false then
		LuaUtils.UI_ShowErrorMessageDialog( f112_arg2, "MPUI_BM_CRATE_PURCHASED_FAILED", "" )
	else
		CoD.perController[f112_arg2].cryptokeysToSpend = f112_arg3.itemCost
		CoD.perController[f112_arg2].supplyDropType = f112_local0
		CoD.perController[f112_arg2].currencySpent = f112_arg5
		if f112_arg5 == Enum.InventoryCurrency.INVENTORY_CURRENCY_COD_POINTS then
			CoD.perController[f112_arg2].codPointsSpent = f112_arg3.itemCODPointCost
		else
			CoD.perController[f112_arg2].codPointsSpent = 0
		end
		if f112_arg3.again then
			f112_local6 = GoBack( f112_local6, f112_arg2 )
			CoD.perController[f112_arg2].supplyDropQuickAnim = true
		else
			local f112_local8 = CoD.BlackMarketUtility.CrateTypeIds[f112_local0]
			if f112_local8 == "bribe" then
				f112_local8 = "rare"
			end
			Engine.SendClientScriptNotify( f112_arg2, "BlackMarket", "crate_camera", f112_local8 )
			SendFrontendControllerZeroMenuResponse( f112_arg2, "BlackMarket", "roll" )
			Engine.PlaySound( "uin_bm_camera_pan" )
			CoD.perController[f112_arg2].supplyDropQuickAnim = false
		end
		OpenOverlay( f112_local6, "BM_Decryption", f112_arg2 )
	end
end

CoD.BlackMarketUtility.TradeForTrifectaAction = function ( f117_arg0, f117_arg1, f117_arg2, f117_arg3, f117_arg4, f117_arg5, f117_arg6, f117_arg7 )
	if f117_arg3.supplyDropType == CoD.BlackMarketUtility.DropTypes.TRIFECTA then
		if Engine.DvarString( 0, "tu14_skipQuickTrifectaPurchaseHack" ) == "1" then
			if f117_arg7 == nil or f117_arg7 == 0 or not Engine.PurchaseDWSKU( f117_arg2, f117_arg7 ) then
				GoBack( f117_arg4, f117_arg2 )
				LuaUtils.UI_ShowErrorMessageDialog( f117_arg2, "MPUI_BM_TRIFECTA_PURCHASE_FAILED", "" )
				return 
			end
		elseif f117_arg7 == nil or f117_arg7 == 0 or not Engine.PurchaseDWSKU( f117_arg2, f117_arg7, false ) then
			GoBack( f117_arg4, f117_arg2 )
			LuaUtils.UI_ShowErrorMessageDialog( f117_arg2, "MPUI_BM_TRIFECTA_PURCHASE_FAILED", "" )
			return 
		end
		f117_arg4[CoD.OverlayUtility.GoBackPropertyName] = nil
		CoD.Menu.UpdateAllButtonPrompts( f117_arg4, f117_arg2 )
		f117_arg0:setState( "PurchasingBundle" )
		f117_arg0.PurchasingBundle:playClip( "StartPurchasing" )
		f117_arg0.PurchasingBundle.nextClip = "Purchasing"
		f117_arg6.purchasingBundle = true
		f117_arg6:updateDataSource()
		f117_arg0.fullInventoryRefetchRequested = false
		f117_arg0.dwInventoryFetchCompleteEvents = 0
		f117_arg0.bailOutTime = Engine.seconds() + 5
		f117_arg0:registerEventHandler( "refresh_dw_inventory_menu", function ( element, event )
			f117_arg0.dwInventoryFetchCompleteEvents = f117_arg0.dwInventoryFetchCompleteEvents + 1
		end )
		f117_arg0.PurchasingBundle:registerEventHandler( "clip_over", function ( element, event )
			if Engine.IsInventoryBusy( f117_arg2 ) or Engine.GetPurchaseDWSKUResult( f117_arg2 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_INPROGRESS or Engine.DvarString( 0, "tu14_skipQuickTrifectaPurchaseHack" ) ~= "1" and f117_arg0.dwInventoryFetchCompleteEvents < 5 and not f117_arg0.fullInventoryRefetchRequested then
				if Engine.DvarString( 0, "tu14_skipQuickTrifectaPurchaseHack" ) ~= "1" and not f117_arg0.fullInventoryRefetchRequested and f117_arg0.bailOutTime < Engine.seconds() then
					f117_arg0.fullInventoryRefetchRequested = true
					Engine.ExecNow( f117_arg2, "refetchInventory" )
				end
				LUI.UIElement.clipOver( element, event )
			else
				if Engine.GetPurchaseDWSKUResult( f117_arg2 ) == Enum.InventoryPurchaseResult.INVENTORY_PURCHASE_RESULT_FAILURE then
					GoBack( f117_arg4, f117_arg2 )
					LuaUtils.UI_ShowErrorMessageDialog( f117_arg2, "MPUI_BM_TRIFECTA_PURCHASE_FAILED", "" )
					return 
				end
				f117_arg4[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack()
				CoD.Menu.UpdateAllButtonPrompts( f117_arg4, f117_arg2 )
				element:registerEventHandler( "clip_over", function ( element, event )
					element:registerEventHandler( "clip_over", LUI.UIElement.clipOver )
				end )
				element:playClip( "StopPurchasing" )
				f117_arg0:setState( "PurchaseComplete" )
				f117_arg6.purchasingBundle = false
				f117_arg6.purchasedBundle = true
				f117_arg6:updateDataSource()
			end
		end )
		return 
	else
		
	end
end

