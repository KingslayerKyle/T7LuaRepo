require( "ui.T6.CoD9Button" )

CoD.CACUtility = {}
CoD.CACUtility.slotContainerAlpha = 0.04
CoD.CACUtility.defaultCustomClassCount = 5
CoD.CACUtility.maxAbilities = 7
CoD.CACUtility.maxAbilityWheelItems = 6
CoD.CACUtility.maxContextualAbilityItems = 2
CoD.CACUtility.maxCustomClass = 5
CoD.CACUtility.maxGrenades = 2
CoD.CACUtility.maxGadgets = 2
CoD.CACUtility.maxGadgetsMods = 3
CoD.CACUtility.maxSpecialtySlots = 6
CoD.CACUtility.maxPerks = 12
CoD.CACUtility.maxRewards = 3
CoD.CACUtility.maxRewardSlots = 3
CoD.CACUtility.maxPrimaryAttachments = 6
CoD.CACUtility.maxSecondaryAttachments = 4
CoD.CACUtility.maxAttachments = 2
CoD.CACUtility.maxPerkCategories = 3
CoD.CACUtility.maxPerksInEachCategory = 2
CoD.CACUtility.maxBonusCards = 3
CoD.CACUtility.maxDefaultClass = 5
CoD.CACUtility.maxMTXWeaponPacks = 10
CoD.CACUtility.maxPrimaryGunfighters = 3
CoD.CACUtility.maxSecondaryGunfighters = 1
CoD.CACUtility.maxScorestreaks = 4
CoD.CACUtility.maxWeaponPrestige = 2
CoD.CACUtility.mpPrestigeAttachments = {
	"gmod6",
	"gmod7"
}
CoD.CACUtility.primaryWeaponPrestigeSlot = "attachment" .. CoD.CACUtility.maxPrimaryAttachments + 1
CoD.CACUtility.secondaryWeaponPrestigeSlot = "attachment" .. CoD.CACUtility.maxSecondaryAttachments + 1
CoD.CACUtility.ButtonGridLockImageSize = 40
CoD.CACUtility.LockImageMaterial = "menu_mp_lobby_locked"
CoD.CACUtility.ButtonGridBigLockImageSize = 64
CoD.CACUtility.ButtonGridNewImageWidth = 64
CoD.CACUtility.ButtonGridNewImageHeight = 32
CoD.CACUtility.ButtonGridNewImageRightAlignWidth = 32
CoD.CACUtility.LockImageBigMaterial = "menu_mp_lobby_locked_big"
CoD.CACUtility.NewImageMaterial = "menu_mp_lobby_new"
CoD.CACUtility.DefaultLoadoutImage = "blacktransparent"
CoD.CACUtility.DefaultClassItemImage = "menu_mp_lobby_none_selected"
CoD.CACUtility.removeSFX = "cac_cmn_item_remove"
CoD.CACUtility.denySFX = "cac_cmn_deny"
CoD.CACUtility.carouselLRSFX = "cac_slide_nav_lr"
CoD.CACUtility.carouselUpSFX = "cac_slide_nav_up"
CoD.CACUtility.carouselDownSFX = "cac_slide_nav_down"
CoD.CACUtility.carouselEquipSFX = "cac_slide_equip_item"
CoD.CACUtility.EquipImageMaterial = "mutually_excl"
CoD.CACUtility.GainFocusSFX = "cac_loadout_nav"
CoD.CACUtility.WildcardGainFocusSFX = "cac_loadout_wildcard_nav"
CoD.CACUtility.classModels = {}
CoD.CACUtility.unlockTokenModel = {}
CoD.CACUtility.loadoutSlotNames = {
	primaryWeapon = "primary",
	secondaryWeapon = "secondary",
	primaryGrenade = "primarygrenade",
	specialGrenade = "specialgrenade",
	primaryGadget = "primarygadget",
	primaryGadgetAttachment1 = "primarygadgetattachment1",
	primaryGadgetAttachment2 = "primarygadgetattachment2",
	primaryGadgetAttachment3 = "primarygadgetattachment3",
	secondaryGadget = "secondarygadget",
	primaryAttachment1 = "primaryattachment1",
	primaryAttachment2 = "primaryattachment2",
	primaryAttachment3 = "primaryattachment3",
	primaryAttachment4 = "primaryattachment4",
	primaryAttachment5 = "primaryattachment5",
	primaryAttachment6 = "primaryattachment6",
	secondaryAttachment1 = "secondaryattachment1",
	secondaryAttachment2 = "secondaryattachment2",
	secondaryAttachment3 = "secondaryattachment3",
	secondaryAttachment4 = "secondaryattachment4",
	secondaryAttachment5 = "secondaryattachment5",
	secondaryAttachment6 = "secondaryattachment6",
	specialty1 = "specialty1",
	specialty2 = "specialty2",
	specialty3 = "specialty3",
	specialty4 = "specialty4",
	specialty5 = "specialty5",
	specialty6 = "specialty6",
	bonuscard1 = "bonuscard1",
	bonuscard2 = "bonuscard2",
	bonuscard3 = "bonuscard3",
	reward1 = "killstreak1",
	reward2 = "killstreak2",
	reward3 = "killstreak3",
	heroWeapon = "heroweapon",
	cybercore = "cybercore",
	cybercomAbility1 = "cybercom_ability1",
	cybercomAbility2 = "cybercom_ability2",
	cybercomAbility3 = "cybercom_ability3",
	cybercomTacRig1 = "cybercom_tacrig1",
	cybercomTacRigt2 = "cybercom_tacrig2"
}
CoD.CACUtility.loadoutSlotOrder = {
	"primary",
	"primaryattachment1",
	"primaryattachment2",
	"primaryattachment3",
	"primaryattachment4",
	"primaryattachment5",
	"primaryattachment6",
	"secondary",
	"secondaryattachment1",
	"secondaryattachment2",
	"secondaryattachment3",
	"secondaryattachment4",
	"secondaryattachment5",
	"secondaryattachment6",
	"primarygadget",
	"primarygadgetattachment1",
	"primarygadgetattachment2",
	"primarygadgetattachment3",
	"secondarygadget",
	"secondarygadgetattachment1",
	"secondarygadgetattachment2",
	"secondarygadgetattachment3",
	"specialgadget",
	"specialgadgetattachment1",
	"specialgadgetattachment2",
	"specialgadgetattachment3",
	"specialty1",
	"specialty2",
	"specialty3",
	"specialty4",
	"specialty5",
	"specialty6",
	"bonuscard1",
	"bonuscard2",
	"bonuscard3",
	"cybercom_tacrig1",
	"cybercom_tacrig2"
}
local f0_local0 = CoD.CACUtility
local f0_local1 = {
	"primary",
	"primarycamo",
	"primaryreticle",
	"primaryreticlecolor",
	"primarylens",
	"primaryemblem",
	"primarytag",
	"primarygunsmithvariant",
	"primaryattachment1",
	"primaryattachment2",
	"primaryattachment3",
	"primaryattachment4",
	"primaryattachment5",
	"primaryattachment6",
	"primaryattachment1cosmeticvariant",
	"primaryattachment2cosmeticvariant",
	"primaryattachment3cosmeticvariant",
	"primaryattachment4cosmeticvariant",
	"primaryattachment5cosmeticvariant",
	"primaryattachment6cosmeticvariant",
	"secondary",
	"secondarycamo",
	"secondaryreticle",
	"secondaryreticlecolor",
	"secondarylens",
	"secondaryemblem",
	"secondarytag",
	"secondarygunsmithvariant",
	"secondaryattachment1",
	"secondaryattachment2",
	"secondaryattachment3",
	"secondaryattachment4",
	"secondaryattachment5",
	"secondaryattachment6",
	"secondaryattachment1cosmeticvariant",
	"secondaryattachment2cosmeticvariant",
	"secondaryattachment3cosmeticvariant",
	"secondaryattachment4cosmeticvariant",
	"secondaryattachment5cosmeticvariant",
	"secondaryattachment6cosmeticvariant",
	"primarygadget",
	"primarygadgetattachment1",
	"primarygadgetattachment2",
	"primarygadgetattachment3",
	"secondarygadget",
	"secondarygadgetattachment1",
	"secondarygadgetattachment2",
	"secondarygadgetattachment3",
	"specialgadget",
	"specialgadgetattachment1"
}
local f0_local2 = "specialgadgetattachment2"
local f0_local3 = "specialgadgetattachment3"
local f0_local4 = "specialty1"
local f0_local5 = "specialty2"
local f0_local6 = "specialty3"
local f0_local7 = "specialty4"
local f0_local8 = "specialty5"
local f0_local9 = "specialty6"
local f0_local10 = "bonuscard1"
local f0_local11 = "bonuscard2"
local f0_local12 = "bonuscard3"
local f0_local13 = "cybercom_tacrig1"
local f0_local14 = "cybercom_tacrig2"
f0_local1[33] = f0_local2
f0_local1[34] = f0_local3
f0_local1[35] = f0_local4
f0_local1[36] = f0_local5
f0_local1[37] = f0_local6
f0_local1[38] = f0_local7
f0_local1[39] = f0_local8
f0_local1[40] = f0_local9
f0_local1[41] = f0_local10
f0_local1[42] = f0_local11
f0_local1[43] = f0_local12
f0_local1[44] = f0_local13
f0_local1[45] = f0_local14
f0_local0.clearLoadoutSlotOrder = f0_local1
CoD.CACUtility.overCapacityLoadoutSlotOrder = {
	"primary",
	"primaryattachment1",
	"primaryattachment2",
	"primaryattachment3",
	"primaryattachment4",
	"primaryattachment5",
	"primaryattachment6",
	"secondary",
	"secondaryattachment1",
	"secondaryattachment2",
	"secondaryattachment3",
	"secondaryattachment4",
	"primarygadget",
	"primarygadgetattachment1",
	"secondarygadget",
	"secondarygadgetattachment1",
	"specialty1",
	"specialty4",
	"specialty2",
	"specialty5",
	"specialty3",
	"specialty6",
	"bonuscard1",
	"bonuscard2",
	"bonuscard3"
}
CoD.CACUtility.emptyImageSlotList = {
	primary = "t7_menu_mp_weapons_primary_big",
	primaryattachment1 = "t7_menu_mp_weapons_primary_big",
	primaryattachment2 = "t7_menu_mp_weapons_primary_big",
	primaryattachment3 = "t7_menu_mp_weapons_primary_big",
	primaryattachment4 = "t7_menu_mp_weapons_primary_big",
	primaryattachment5 = "t7_menu_mp_weapons_primary_big",
	primaryattachment6 = "t7_menu_mp_weapons_primary_big",
	secondary = "t7_menu_mp_weapons_secondary_big",
	secondaryattachment1 = "t7_menu_mp_weapons_secondary_big",
	secondaryattachment2 = "t7_menu_mp_weapons_secondary_big",
	secondaryattachment3 = "t7_menu_mp_weapons_secondary_big",
	secondaryattachment4 = "t7_menu_mp_weapons_secondary_big",
	secondaryattachment5 = "t7_menu_mp_weapons_secondary_big",
	secondaryattachment6 = "t7_menu_mp_weapons_secondary_big",
	primarygadget = "t7_menu_mp_weapons_lethal_big",
	primarygadgetattachment1 = "t7_menu_mp_weapons_lethal_big",
	secondarygadget = "t7_menu_mp_weapons_tactical_big",
	secondarygadgetattachment1 = "t7_menu_mp_weapons_tactical_big",
	specialty1 = "t7_menu_mp_weapons_perk1_big",
	specialty2 = "t7_menu_mp_weapons_perk2_big",
	specialty3 = "t7_menu_mp_weapons_perk3_big",
	specialty4 = "t7_menu_mp_weapons_perk1_big",
	specialty5 = "t7_menu_mp_weapons_perk2_big",
	specialty6 = "t7_menu_mp_weapons_perk3_big",
	bonuscard1 = "t7_menu_mp_weapons_wildcard_big",
	bonuscard2 = "t7_menu_mp_weapons_wildcard_big",
	bonuscard3 = "t7_menu_mp_weapons_wildcard_big"
}
CoD.CACUtility.bonuscards = {
	primary_gunfighter = "bonuscard_primary_gunfighter",
	primary_gunfighter_2 = "bonuscard_primary_gunfighter_2",
	primary_gunfighter_3 = "bonuscard_primary_gunfighter_3",
	secondary_gunfighter = "bonuscard_secondary_gunfighter",
	overkill = "bonuscard_overkill",
	perk_1_greed = "bonuscard_perk_1_greed",
	perk_2_greed = "bonuscard_perk_2_greed",
	perk_3_greed = "bonuscard_perk_3_greed",
	danger_close = "bonuscard_danger_close",
	two_tacticals = "bonuscard_two_tacticals"
}
CoD.CACUtility.PrimaryGunfighterWildcards = {
	"bonuscard_primary_gunfighter",
	"bonuscard_primary_gunfighter_2",
	"bonuscard_primary_gunfighter_3"
}
CoD.CACUtility.LootMeleeWeapons = {
	"melee_knuckles",
	"melee_butterfly",
	"melee_wrench",
	"melee_crowbar",
	"melee_sword",
	"melee_bat",
	"melee_dagger",
	"melee_bowie",
	"melee_mace",
	"melee_fireaxe",
	"melee_boneglass",
	"melee_improvise",
	"melee_shockbaton",
	"melee_nunchuks",
	"melee_boxing",
	"melee_katana",
	"melee_shovel",
	"melee_prosthetic",
	"melee_chainsaw",
	"melee_crescent"
}
CoD.CACUtility.WeaponsWithNoCPCamos = {
	knife_loadout = true,
	melee_butterfly = true,
	melee_knuckles = true,
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
	sniper_xpr50 = true,
	smg_sten2 = true,
	lmg_rpk = true,
	ar_m14 = true,
	sniper_mosin = true
}
CoD.CACUtility.WeaponsWithNoMPCamos = {
	bowie_knife = true,
	launcher_standard_df = true
}
CoD.CACUtility.WeaponsWithNoZMCamos = {
	pistol_standard = true,
	knife_loadout = true,
	launcher_lockonly = true,
	smg_longrange = true,
	ar_fastburst = true,
	sniper_chargeshot = true,
	launcher_standard_df = true,
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
	sniper_xpr50 = true,
	smg_sten2 = true,
	lmg_rpk = true,
	ar_m14 = true,
	sniper_mosin = true
}
CoD.CACUtility.PregameLoadoutFilters = {
	{
		filters = {
			primary = true,
			secondary = true
		},
		title = "MPUI_WEAPONS_CAPS"
	},
	{
		filters = {
			attachment = true
		},
		title = "MPUI_ATTACHMENTS_CAPS"
	},
	{
		filters = {
			primarygadget = true,
			secondarygadget = true
		},
		title = "MPUI_EQUIPMENT_CAPS"
	},
	{
		filters = {
			heroweapon = true,
			herogadget = true,
			specialgadget = true
		},
		title = "MPUI_HEROES_CAPS"
	},
	{
		filters = {
			specialty1 = true,
			specialty2 = true,
			specialty3 = true
		},
		title = "MPUI_PERKS_CAPS"
	},
	{
		filters = {
			bonuscard1 = true,
			bonuscard2 = true,
			bonuscard3 = true
		},
		title = "MENU_WILDCARDS_CAPS"
	},
	{
		filters = {
			killstreak1 = true,
			killstreak2 = true,
			killstreak3 = true
		},
		title = "MENU_SCORESTREAKS_CAPS"
	}
}
CoD.CACUtility.CreateList = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = {}
	for f1_local1 = f1_arg1, f1_arg2, 1 do
		table.insert( f1_local0, f1_arg0 .. f1_local1 )
	end
	return f1_local0
end

CoD.CACUtility.CreateList2 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	local f2_local0 = {}
	for f2_local1 = f2_arg2, f2_arg3, 1 do
		table.insert( f2_local0, f2_arg0 .. f2_local1 .. f2_arg1 )
	end
	return f2_local0
end

CoD.CACUtility.PrimaryWeaponSlotNameList = {
	"primary"
}
CoD.CACUtility.PrimaryAttachmentSlotNameList = CoD.CACUtility.CreateList( "primaryattachment", 1, CoD.CACUtility.maxPrimaryAttachments )
table.insert( CoD.CACUtility.PrimaryAttachmentSlotNameList, "primary" .. CoD.CACUtility.primaryWeaponPrestigeSlot )
CoD.CACUtility.PrimaryAttachmentCVSlotNameList = CoD.CACUtility.CreateList2( "primaryattachment", "cosmeticvariant", 1, CoD.CACUtility.maxPrimaryAttachments )
table.insert( CoD.CACUtility.PrimaryAttachmentCVSlotNameList, "primary" .. CoD.CACUtility.primaryWeaponPrestigeSlot .. "cosmeticvariant" )
CoD.CACUtility.SecondaryWeaponSlotNameList = {
	"secondary"
}
CoD.CACUtility.SecondaryAttachmentSlotNameList = CoD.CACUtility.CreateList( "secondaryattachment", 1, CoD.CACUtility.maxSecondaryAttachments )
table.insert( CoD.CACUtility.SecondaryAttachmentSlotNameList, "secondary" .. CoD.CACUtility.secondaryWeaponPrestigeSlot )
CoD.CACUtility.SecondaryAttachmentCVSlotNameList = CoD.CACUtility.CreateList2( "secondaryattachment", "cosmeticvariant", 1, CoD.CACUtility.maxSecondaryAttachments )
table.insert( CoD.CACUtility.SecondaryAttachmentCVSlotNameList, "secondary" .. CoD.CACUtility.secondaryWeaponPrestigeSlot .. "cosmeticvariant" )
CoD.CACUtility.PrimaryGadgetWeaponSlotNameList = {
	"primarygadget"
}
CoD.CACUtility.PrimaryGadgetAttachmentSlotNameList = CoD.CACUtility.CreateList( "primarygadgetattachment", 1, CoD.CACUtility.maxGadgetsMods )
CoD.CACUtility.SecondaryGadgetWeaponSlotNameList = {
	"secondarygadget"
}
CoD.CACUtility.SecondaryGadgetAttachmentSlotNameList = CoD.CACUtility.CreateList( "secondarygadgetattachment", 1, CoD.CACUtility.maxGadgetsMods )
CoD.CACUtility.SpecialGadgetWeaponSlotNameList = {
	"specialgadget"
}
CoD.CACUtility.SpecialGadgetAttachmentSlotNameList = CoD.CACUtility.CreateList( "specialgadgetattachment", 1, CoD.CACUtility.maxGadgetsMods )
CoD.CACUtility.Perk1SlotNameList = {
	"specialty1",
	"specialty4"
}
CoD.CACUtility.Perk2SlotNameList = {
	"specialty2",
	"specialty5"
}
CoD.CACUtility.Perk3SlotNameList = {
	"specialty3",
	"specialty6"
}
CoD.CACUtility.CompletePerkSlotNameList = CoD.CACUtility.CreateList( "specialty", 1, CoD.CACUtility.maxPerkCategories * CoD.CACUtility.maxPerksInEachCategory )
CoD.CACUtility.BonuscardSlotNameList = CoD.CACUtility.CreateList( "bonuscard", 1, CoD.CACUtility.maxBonusCards )
CoD.CACUtility.BonuscardSlotNameCACCardList = {
	"bonuscard3",
	"bonuscard1",
	"bonuscard2"
}
CoD.CACUtility.KillstreakNameList = CoD.CACUtility.CreateList( "killstreak", 1, CoD.CACUtility.maxRewards )
CoD.CACUtility.CybercoreList = {
	"cybercore"
}
CoD.CACUtility.TacticalRigList = {
	"cybercom_tacrig1",
	"cybercom_tacrig2"
}
CoD.CACUtility.SlotLists = {
	CoD.CACUtility.PrimaryWeaponSlotNameList,
	CoD.CACUtility.PrimaryAttachmentSlotNameList,
	CoD.CACUtility.SecondaryWeaponSlotNameList,
	CoD.CACUtility.SecondaryAttachmentSlotNameList,
	CoD.CACUtility.PrimaryGadgetWeaponSlotNameList,
	CoD.CACUtility.PrimaryGadgetAttachmentSlotNameList,
	CoD.CACUtility.SecondaryGadgetWeaponSlotNameList,
	CoD.CACUtility.SecondaryGadgetAttachmentSlotNameList,
	CoD.CACUtility.SpecialGadgetWeaponSlotNameList,
	CoD.CACUtility.SpecialGadgetAttachmentSlotNameList,
	CoD.CACUtility.Perk1SlotNameList,
	CoD.CACUtility.Perk2SlotNameList,
	CoD.CACUtility.Perk3SlotNameList,
	CoD.CACUtility.BonuscardSlotNameList,
	CoD.CACUtility.KillstreakNameList,
	CoD.CACUtility.CybercoreList,
	CoD.CACUtility.TacticalRigList
}
CoD.CACUtility.EmptyItemIndex = 0
CoD.CACUtility.PrimaryWeaponGroupNames = {
	{
		index = 1,
		weapon_category = "weapon_smg",
		name = "MPUI_WEAPON_SMG_CAPS"
	},
	{
		index = 2,
		weapon_category = "weapon_assault",
		name = "MPUI_WEAPON_ASSAULT_CAPS"
	},
	{
		index = 3,
		weapon_category = "weapon_cqb",
		name = "MPUI_WEAPON_CQB_CAPS"
	},
	{
		index = 4,
		weapon_category = "weapon_lmg",
		name = "MPUI_WEAPON_LMG_CAPS"
	},
	{
		index = 5,
		weapon_category = "weapon_sniper",
		name = "MPUI_WEAPON_SNIPER_CAPS"
	}
}
CoD.CACUtility.SecondaryWeaponGroupNames = {
	{
		index = 6,
		weapon_category = "weapon_pistol",
		name = "MPUI_WEAPON_PISTOL_CAPS"
	},
	{
		index = 7,
		weapon_category = "weapon_launcher",
		name = "MPUI_WEAPON_LAUNCHER_CAPS"
	},
	{
		index = 8,
		weapon_category = "weapon_knife",
		name = "MPUI_WEAPON_KNIFE_CAPS"
	},
	{
		index = 9,
		weapon_category = "weapon_special",
		name = "MPUI_WEAPON_SPECIAL_CAPS"
	}
}
CoD.CACUtility.weaponOptionGroupNames = {
	[Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO] = "camo",
	[Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_TAG] = "tag",
	[Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_EMBLEM] = "emblem",
	[Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB] = "paintjob",
	[Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE] = "reticle",
	[Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_LENS] = "lens",
	[Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_RETICLE_COLOR] = "reticle_color"
}
CoD.CACUtility.MulticoreUnlockLevel = 20
CoD.CACUtility.CybercoreGroupNames = {
	{
		index = 0,
		itemRef = "cybercore_control",
		name = "MENU_CONTROL"
	},
	{
		index = 1,
		itemRef = "cybercore_martial",
		name = "MENU_MARTIAL"
	},
	{
		index = 2,
		itemRef = "cybercore_chaos",
		name = "MENU_CHAOS"
	}
}
CoD.CACUtility.CybercoreGroupBranchHeaders = {
	{
		itemRef = "cybercore_control",
		side = "left",
		name = "CPUI_CYBERCORE_CONTROL_LBRANCH"
	},
	{
		itemRef = "cybercore_control",
		side = "right",
		name = "CPUI_CYBERCORE_CONTROL_RBRANCH"
	},
	{
		itemRef = "cybercore_martial",
		side = "left",
		name = "CPUI_CYBERCORE_MARTIAL_LBRANCH"
	},
	{
		itemRef = "cybercore_martial",
		side = "right",
		name = "CPUI_CYBERCORE_MARTIAL_RBRANCH"
	},
	{
		itemRef = "cybercore_chaos",
		side = "left",
		name = "CPUI_CYBERCORE_CHAOS_LBRANCH"
	},
	{
		itemRef = "cybercore_chaos",
		side = "right",
		name = "CPUI_CYBERCORE_CHAOS_RBRANCH"
	}
}
CoD.CACUtility.abilityButtonNumMapping = {
	1,
	2,
	6,
	3,
	5,
	4
}
CoD.CACUtility.maxWeaponCustomizationCategories = 3
CoD.CACUtility.ATTACHMENT_NONE = 1
CoD.CACUtility.ATTACHMENT_ACOG = 2
CoD.CACUtility.ATTACHMENT_DAMAGE = 3
CoD.CACUtility.ATTACHMENT_DUALOPTIC = 4
CoD.CACUtility.ATTACHMENT_DW = 5
CoD.CACUtility.ATTACHMENT_FASTADS = 6
CoD.CACUtility.ATTACHMENT_GL = 7
CoD.CACUtility.ATTACHMENT_GADGET_MOD_0 = 8
CoD.CACUtility.ATTACHMENT_GADGET_MOD_1 = 9
CoD.CACUtility.ATTACHMENT_GADGET_MOD_2 = 10
CoD.CACUtility.ATTACHMENT_GADGET_MOD_3 = 11
CoD.CACUtility.ATTACHMENT_GADGET_MOD_4 = 12
CoD.CACUtility.ATTACHMENT_GADGET_MOD_5 = 13
CoD.CACUtility.ATTACHMENT_GADGET_MOD_6 = 14
CoD.CACUtility.ATTACHMENT_GADGET_MOD_7 = 15
CoD.CACUtility.ATTACHMENT_HOLO = 16
CoD.CACUtility.ATTACHMENT_IR = 17
CoD.CACUtility.ATTACHMENT_IRONSIGHTS = 18
CoD.CACUtility.ATTACHMENT_MK = 19
CoD.CACUtility.ATTACHMENT_MMS = 20
CoD.CACUtility.ATTACHMENT_PRECISION = 21
CoD.CACUtility.ATTACHMENT_QUICKDRAW = 22
CoD.CACUtility.ATTACHMENT_RANGEFINDER = 23
CoD.CACUtility.ATTACHMENT_RECON = 24
CoD.CACUtility.ATTACHMENT_REFLEX = 25
CoD.CACUtility.ATTACHMENT_STACKFIRE = 26
CoD.CACUtility.ATTACHMENT_STEADYAIM = 27
CoD.CACUtility.ATTACHMENT_SUPPLY = 28
CoD.CACUtility.ATTACHMENT_SUPPRESSED = 29
CoD.CACUtility.ATTACHMENT_SWAYREDUC = 30
CoD.CACUtility.ATTACHMENT_TACKNIFE = 31
CoD.CACUtility.ATTACHMENT_VZOOM = 32
CoD.CACUtility.ATTACHMENT_TYPE_COUNT = 33
CoD.CACUtility.ATTACHMENT_INVALID = 33
CoD.CACUtility.attachmentReferences = {
	"none",
	"acog",
	"damage",
	"dualoptic",
	"dw",
	"fastads",
	"gl",
	"gmod0",
	"gmod1",
	"gmod2",
	"gmod3",
	"gmod4",
	"gmod5",
	"gmod6",
	"gmod7",
	"holo",
	"ir",
	"is",
	"mk",
	"mms",
	"precision",
	"quickdraw",
	"rangefinder",
	"recon",
	"reflex",
	"stackfire",
	"steadyaim",
	"supply",
	"suppressed",
	"swayreduc",
	"tacknife",
	"vzoom"
}
CoD.CACUtility.attachmentsWithCustReticle = {
	acog = true,
	dualoptic = true,
	ir = true,
	reflex = true
}
CoD.CACUtility.defaultClassNames = {
	"class_custom_assault",
	"class_custom_smg",
	"class_custom_lmg",
	"class_custom_cqb",
	"class_custom_sniper"
}
CoD.CACUtility.defaultArenaClassNames = {
	"class_custom_assault_arena",
	"class_custom_smg_arena",
	"class_custom_lmg_arena",
	"class_custom_cqb_arena",
	"class_custom_sniper_arena"
}
CoD.CACUtility.BGBBuffGroups = {
	"bubblegum",
	"bubblegum_consumable"
}
CoD.CACUtility.CustomClass_LastClassNum = 0
CoD.CACUtility.CustomClass_LastSelection = "primary"
CoD.CACUtility.CustomClass_PerClassLastSelection = {}
CoD.CACUtility.CACStatusAvailable = {}
CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE = 1
CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD = 2
CoD.CACUtility.CACStatusAvailable.AVAILABLE = 3
CoD.CACUtility.ValidateMPClasses = function ( f3_arg0 )
	local f3_local0 = function ( f4_arg0, f4_arg1 )
		if f4_arg0 then
			local f4_local0 = LUI.getTableFromPath( f4_arg1, f4_arg0 )
			if f4_local0 then
				return f4_local0:get()
			end
		end
		return nil
	end
	
	local f3_local1 = function ( f5_arg0, f5_arg1 )
		local f5_local0 = Engine.GetItemRef( f5_arg0 )
		local f5_local1 = Engine.TableLookup( nil, CoD.attachmentTable, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_INDEX, f5_arg1, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_ATTACHPOINT, "camo", Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_WEAPONOPTION_FILTER )
		if f5_local1 == CoD.WeaponOptionFilterToString( Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_ZM ) and CoD.CACUtility.WeaponsWithNoZMCamos[f5_local0] then
			return true
		elseif f5_local1 == CoD.WeaponOptionFilterToString( Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_MP ) and CoD.CACUtility.WeaponsWithNoMPCamos[f5_local0] then
			return true
		elseif f5_local1 == CoD.WeaponOptionFilterToString( Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_CP ) and CoD.CACUtility.WeaponsWithNoCPCamos[f5_local0] then
			return true
		elseif f5_local1 == CoD.WeaponOptionFilterToString( Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_BM ) then
			if CoD.BlackMarketUtility.WeaponsWithNoBMCamos[f5_local0] then
				return true
			elseif CoD.BlackMarketUtility.IsItemLocked( f3_arg0, Engine.TableLookup( nil, CoD.attachmentTable, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_INDEX, f5_arg1, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_ATTACHPOINT, "camo", Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_REFERENCE ) .. ";" .. f5_local0 ) then
				return true
			end
		end
		return false
	end
	
	local f3_local2 = function ( f6_arg0 )
		if not f6_arg0 then
			return 
		end
		for f6_local14, f6_local15 in ipairs( {
			{
				slotName = "primary",
				attachments = CoD.CACUtility.PrimaryAttachmentSlotNameList
			},
			{
				slotName = "secondary",
				attachments = CoD.CACUtility.SecondaryAttachmentSlotNameList
			}
		} ) do
			local f6_local16 = f3_local0( f6_arg0, f6_local15.slotName )
			if f6_local16 and f6_local16 ~= CoD.CACUtility.EmptyItemIndex then
				local f6_local3 = Engine.GetItemRef( f6_local16, Enum.eModes.MODE_MULTIPLAYER ) .. "_mp"
				if f6_local3 == "gadget_heat_wave_mp" then
					f6_arg0[f6_local15.slotName]:set( 0 )
				end
				for f6_local10, f6_local11 in ipairs( f6_local15.attachments ) do
					local f6_local12 = f3_local0( f6_arg0, f6_local11 )
					local f6_local13 = f3_local0( f6_arg0, f6_local11 .. "cosmeticvariant" )
					if f6_local12 and f6_local12 ~= CoD.CACUtility.EmptyItemIndex and f6_local13 and f6_local13 ~= CoD.CACUtility.EmptyItemIndex then
						local f6_local7 = Engine.GetAttachmentRef( f6_local16, f6_local12, Enum.eModes.MODE_MULTIPLAYER )
						local f6_local8 = Engine.GetAttachmentCosmeticVariantTable( f6_local3 .. "+" .. f6_local7 )
						if not f6_local8 or not f6_local8[f6_local7] or not f6_local8[f6_local7].variants or not f6_local8[f6_local7].variants[f6_local13] or CoD.BlackMarketUtility.IsItemLocked( f3_arg0, f6_local8[f6_local7].variants[f6_local13].acvName ) then
							local f6_local9 = LUI.getTableFromPath( f6_local11 .. "cosmeticvariant", f6_arg0 )
							f6_local9:set( CoD.CACUtility.EmptyItemIndex )
						end
					end
				end
				if f6_local15.slotName == "secondary" then
					for f6_local4 = 4, 8, 1 do
						f6_local11 = "secondaryattachment" .. f6_local4
						local f6_local12 = f3_local0( f6_arg0, f6_local11 )
						if f6_local12 ~= nil and f6_local12 ~= 0 and not LuaUtils.FindItemInArray( CoD.CACUtility.mpPrestigeAttachments, Engine.GetAttachmentRef( f6_local16, f6_local12, Enum.eModes.MODE_MULTIPLAYER ) ) then
							f6_arg0[f6_local11]:set( 0 )
						end
						local f6_local13 = f3_local0( f6_arg0, f6_local11 .. "cosmeticvariant" )
						if f6_local13 ~= nil and f6_local13 ~= 0 then
							f6_arg0[f6_local11 .. "cosmeticvariant"]:set( 0 )
						end
					end
				end
			end
		end
		if CoD.ContractWeaponTiers[Engine.GetItemRef( f3_local0( f6_arg0, "primarygadget" ), Enum.eModes.MODE_MULTIPLAYER )] then
			f6_arg0.primarygadget:set( 0 )
		end
		for f6_local3, f6_local4 in ipairs( {
			{
				slotName = "primaryreticle",
				weaponIndex = f3_local0( f6_arg0, "primary" ),
				attachmentIndex = f3_local0( f6_arg0, "primaryattachment1" )
			},
			{
				slotName = "secondaryreticle",
				weaponIndex = f3_local0( f6_arg0, "secondary" ),
				attachmentIndex = f3_local0( f6_arg0, "secondaryattachment1" )
			}
		} ) do
			local f6_local5 = f3_local0( f6_arg0, f6_local4.slotName )
			if f6_local5 and Engine.IsWeaponOptionLockedEntitlement( f3_arg0, Engine.GetAttachmentIndexByRef( Engine.GetAttachmentRef( f6_local4.weaponIndex, f6_local4.attachmentIndex ) ), Engine.TableLookup( f3_arg0, CoD.attachmentTable, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_REFERENCE, "reticle_" .. f6_local5, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_INDEX ) ) then
				f6_arg0[f6_local4.slotName]:set( 0 )
			end
		end
		for f6_local4, f6_local5 in ipairs( {
			{
				slotName = "primarycamo",
				weaponIndex = f3_local0( f6_arg0, "primary" ),
				attachmentIndex = CoD.CACUtility.ATTACHMENT_NONE
			},
			{
				slotName = "secondarycamo",
				weaponIndex = f3_local0( f6_arg0, "secondary" ),
				attachmentIndex = CoD.CACUtility.ATTACHMENT_NONE
			}
		} ) do
			local f6_local6 = f3_local0( f6_arg0, f6_local5.slotName )
			if f6_local6 and (Engine.IsWeaponOptionLockedEntitlement( f3_arg0, f6_local5.attachmentIndex, f6_local6 ) or f3_local1( f6_local5.weaponIndex, f6_local6 )) then
				f6_arg0[f6_local5.slotName]:set( 0 )
			end
		end
		for f6_local5, f6_local6 in ipairs( {
			{
				slotName = "specialty1",
				expectedType = "specialty1"
			},
			{
				slotName = "specialty2",
				expectedType = "specialty2"
			},
			{
				slotName = "specialty3",
				expectedType = "specialty3"
			},
			{
				slotName = "specialty4",
				expectedType = "specialty1"
			},
			{
				slotName = "specialty5",
				expectedType = "specialty2"
			},
			{
				slotName = "specialty6",
				expectedType = "specialty3"
			}
		} ) do
			local f6_local10 = f3_local0( f6_arg0, f6_local6.slotName )
			if f6_local10 and Engine.GetLoadoutSlotForItem( f6_local10 ) ~= f6_local6.expectedType then
				f6_arg0[f6_local6.slotName]:set( 0 )
			end
		end
	end
	
	Engine.ExecNow( f3_arg0, "emblemGetProfile" )
	ValidateEmblemBackground( f3_arg0, Engine.GetEmblemBackgroundId() )
	for f3_local7, f3_local8 in ipairs( {
		Enum.eModes.MODE_MULTIPLAYER,
		Enum.eModes.MODE_CAMPAIGN,
		Enum.eModes.MODE_ZOMBIES
	} ) do
		local f3_local9 = Engine.GetHeroList( f3_local8 )
		for f3_local6 = 0, #f3_local9 - 1, 1 do
			if Engine.IsWeaponOptionLockedEntitlement( f3_arg0, CoD.CACUtility.ATTACHMENT_NONE, Engine.GetHeroShowcaseWeaponAttribute( f3_arg0, f3_local8, f3_local6, "camoIndex" ) ) then
				Engine.SetHeroShowcaseWeaponAttribute( f3_arg0, f3_local8, f3_local6, "camoIndex", 0 )
			end
		end
	end
	f3_local3 = Engine.StorageGetBuffer( f3_arg0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	if f3_local3 then
		for f3_local9, f3_local6 in ipairs( {
			"leagueCacLoadouts",
			"customMatchCacLoadouts",
			"cacLoadouts"
		} ) do
			local f3_local10 = f3_local3[f3_local6]
			if f3_local10 then
				for f3_local11 = 0, 9, 1 do
					f3_local2( f3_local10.customclass[f3_local11] )
				end
			end
		end
	end
	f3_local4 = Engine.StorageGetBuffer( f3_arg0, Enum.StorageFileType.STORAGE_MP_CLASS_SETS )
	if f3_local4 then
		for f3_local6, f3_local10 in ipairs( {
			"publicMatchClassSets",
			"customMatchClassSets",
			"leagueMatchClassSets"
		} ) do
			local f3_local11 = f3_local4[f3_local10]
			if f3_local11 then
				for f3_local12 = 0, 9, 1 do
					for f3_local15 = 0, 9, 1 do
						f3_local2( f3_local11[f3_local12].customclass[f3_local15] )
					end
				end
			end
		end
	end
	f3_local5 = Enum.StorageFileType.STORAGE_GUNSMITH
	f3_local7 = CoD.CraftUtility.GetDDLRoot( f3_arg0, f3_local5 )
	CoD.CraftUtility.Gunsmith.FileType = f3_local5
	f3_local8 = false
	if f3_local7 ~= nil then
		local f3_local9 = CoD.CraftUtility.Gunsmith.GetMaxVariantCount( f3_arg0, f3_local5 )
		for f3_local6 = 0, f3_local9 - 1, 1 do
			local f3_local13 = f3_local7.variant[f3_local6]
			local f3_local14 = f3_local0( f3_local13, "reticleIndex" )
			if f3_local14 and Engine.IsWeaponOptionLockedEntitlement( f3_arg0, f3_local0( f3_local13, "attachment.0" ), Engine.TableLookup( f3_arg0, CoD.attachmentTable, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_REFERENCE, "reticle_" .. f3_local14, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_INDEX ) ) then
				f3_local13.reticleIndex:set( 0 )
				f3_local8 = true
			end
			local f3_local15 = f3_local0( f3_local13, "weaponIndex" )
			for f3_local16 = 1, CoD.CACUtility.maxPrimaryAttachments, 1 do
				local f3_local19 = f3_local0( f3_local13, "attachment." .. f3_local16 )
				local f3_local20 = f3_local0( f3_local13, "attachmentVariant." .. f3_local16 )
				if f3_local19 and f3_local19 ~= CoD.CACUtility.EmptyItemIndex and f3_local20 and f3_local20 ~= CoD.CACUtility.EmptyItemIndex then
					local f3_local21 = Engine.GetItemRef( f3_local15 ) .. "_mp"
					local f3_local22 = Engine.GetAttachmentRefByIndex( f3_local19 )
					local f3_local23 = Engine.GetAttachmentCosmeticVariantTable( f3_local21 .. "+" .. f3_local22 )
					if not f3_local23 or not f3_local23[f3_local22] or not f3_local23[f3_local22].variants or not f3_local23[f3_local22].variants[f3_local20] or CoD.BlackMarketUtility.IsItemLocked( f3_arg0, f3_local23[f3_local22].variants[f3_local20].acvName ) then
						f3_local13.attachmentVariant[f3_local16]:set( 0 )
						f3_local8 = true
					end
				end
			end
			if CoD.CACUtility.GetLoadoutSlotForGunsmithWeapon( f3_local15 ) == "secondary" then
				for f3_local16 = 3, 7, 1 do
					local f3_local19 = f3_local0( f3_local13, "attachment." .. f3_local16 )
					if f3_local19 ~= nil and f3_local19 ~= 0 then
						f3_local13.attachment[f3_local16]:set( 0 )
						f3_local8 = true
					end
					local f3_local20 = f3_local0( f3_local13, "attachmentVariant." .. f3_local16 )
					if f3_local20 ~= nil and f3_local20 ~= 0 then
						f3_local13.attachmentVariant[f3_local16]:set( 0 )
						f3_local8 = true
					end
				end
			end
			local f3_local16 = f3_local0( f3_local13, "camoIndex" )
			if f3_local16 and (Engine.IsWeaponOptionLockedEntitlement( f3_arg0, CoD.CACUtility.ATTACHMENT_NONE, f3_local16 ) or f3_local1( f3_local15, f3_local16 )) then
				f3_local13.camoIndex:set( 0 )
				f3_local8 = true
			end
		end
	end
	if f3_local8 then
		CoD.CraftUtility.UploadBuffer( f3_arg0, f3_local5 )
	end
end

CoD.CACUtility.ValidateMPLootWeapons = function ( f7_arg0 )
	local f7_local0 = function ( f8_arg0, f8_arg1 )
		local f8_local0 = 0
		local f8_local1 = false
		for f8_local8, f8_local9 in ipairs( f8_arg0 ) do
			local f8_local10 = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, f8_local9, f8_local0 )
			local f8_local11 = CoD.CACUtility.GetMPItemIndexForItemRefString( f8_local10 )
			if f8_local11 ~= nil and f8_local11 ~= "" then
				local f8_local5 = CoD.BlackMarketUtility.GetItemQuantity( f7_arg0, f8_local10 )
				local f8_local6 = "itemstats." .. f8_local11 .. ".purchased"
				if f8_local5 == 0 then
					local f8_local7 = LUI.getTableFromPath( f8_local6, f8_arg1 )
					if f8_local7 and f8_local7:get() ~= 0 then
						f8_local7:set( 0 )
						f8_local1 = true
					end
				end
				local f8_local7 = LUI.getTableFromPath( f8_local6, f8_arg1 )
				if f8_local7 and f8_local7:get() == 0 then
					f8_local7:set( 1 )
					f8_local1 = true
				end
			end
		end
		return f8_local1
	end
	
	local f7_local1 = Engine.StorageGetBuffer( f7_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if f7_local1 then
		local f7_local2 = false
		if f7_local0( CoD.BlackMarketUtility.GetLootTypeRows( "weapon" ), f7_local1 ) or f7_local0( CoD.BlackMarketUtility.GetLootTypeRows( "melee_weapon" ), f7_local1 ) then
			UploadStats( nil, f7_arg0 )
		end
	end
end

CoD.CACUtility.ValidateZMBGBEntitlement = function ( f9_arg0 )
	for f9_local0 = 0, 9, 1 do
		for f9_local3 = 0, 4, 1 do
			local f9_local6 = CoD.CACUtility.GetDLCIdForBubbleGum( Engine.GetBubbleGumBuff( f9_arg0, f9_local0, f9_local3 ) )
			if f9_local6 and f9_local6 ~= "" and not Engine.HasEntitlementByOwnership( f9_arg0, f9_local6 ) then
				Engine.Exec( f9_arg0, "resetBubbleGumPackOnline " .. f9_local0 .. " MENU_BGB_PACK_" .. f9_local0 + 1 )
			end
		end
	end
end

CoD.CACUtility.GetDLCIdForBubbleGum = function ( f10_arg0 )
	return Engine.TableLookup( nil, "gamedata/stats/zm/zm_statsTable.csv", 0, f10_arg0, 15 )
end

CoD.CACUtility.GetLoadoutSlotForGunsmithWeapon = function ( f11_arg0 )
	return Engine.TableLookup( nil, "gamedata/stats/mp/mp_statsTable.csv", 0, f11_arg0, 13 )
end

CoD.OverlayUtility.AddSystemOverlay( "UnlockClassItem", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.systemOverlay_UnlockFrame",
	title = Engine.Localize( "MPUI_CONFIRM_PURCHASE_CAPS" ),
	description = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
		local f12_local0 = CoD.isCampaign and "CPUI_UNLOCK_ITEM" or "MPUI_UNLOCK_ITEM"
		if f12_arg2 then
			return Engine.Localize( f12_local0, Engine.GetItemName( f12_arg1 ) .. "_UPGRADED" )
		else
			return Engine.Localize( f12_local0, Engine.GetItemName( f12_arg1 ) )
		end
	end,
	supportText = function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3 )
		return Engine.Localize( Engine.GetItemName( f13_arg1 ) )
	end,
	image = function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
		local f14_local0 = CoD.perController[f14_arg0].weaponCategory
		local f14_local1 = ""
		if f14_local0 == "specialist" then
			return Engine.GetItemImage( f14_arg1, CoD.CCUtility.customizationMode )
		elseif f14_local0 and LUI.startswith( f14_local0, "killstreak" ) then
			f14_local1 = "_menu_large"
		elseif not (not f14_local0 or not LUI.startswith( f14_local0, "specialty" )) or f14_local0 == "primarygadget" or f14_local0 == "secondarygadget" then
			f14_local1 = "_256"
		elseif f14_local0 and LUI.startswith( f14_local0, "cybercom_ability" ) then
			f14_local1 = "_LR_tu1"
		end
		return Engine.GetItemImage( f14_arg1 ) .. f14_local1
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.Unlock,
	listDatasource = function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
		DataSources.UnlockTokenMenuList = DataSourceHelpers.ListSetup( "UnlockTokenMenuList", function ( f16_arg0 )
			local f16_local0 = {}
			local f16_local1 = CoD.perController[f16_arg0].weaponCategory
			local f16_local2 = CoD.perController[f16_arg0].isInCybercoreUpgrade or false
			local f16_local3 = function ( f17_arg0, f17_arg1 )
				return {
					models = {
						displayText = f17_arg0,
						itemIndex = f15_arg1,
						upgradeItemIndex = f15_arg2
					},
					properties = {
						action = f17_arg1
					}
				}
			end
			
			local f16_local4 = function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3, f18_arg4 )
				UnlockItem( f18_arg4, f18_arg1, f18_arg2 )
				local f18_local0 = GoBackAndUpdateStateOnPreviousMenu( f18_arg4, f18_arg2 )
				if f16_local1 == "specialist" and f18_local0.characterCarousel then
					f18_local0.characterCarousel.activeWidget:processEvent( {
						name = "update_state",
						controller = f18_arg2
					} )
				end
				if f16_local2 then
					UpdateCybercoreTree( f18_local0, f18_local0, f18_arg2 )
				end
			end
			
			local f16_local5 = function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3, f19_arg4 )
				UnlockItem( f19_arg4, f19_arg1, f19_arg2 )
				local f19_local0 = f19_arg4.acceptData.variantInfoElement
				if f19_local0 then
					SetWeaponVariant( GoBack( f19_arg4, f19_arg2 ), f19_local0, f19_arg2 )
				end
			end
			
			local f16_local6 = function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3, f20_arg4 )
				local f20_local0 = CoD.perController[f20_arg2].weaponCategory
				local f20_local1 = UnlockAndEquipItem( f20_arg4, f20_arg1, f20_arg2 )
				if f20_local0 == "specialist" then
					local f20_local2 = GoBack( f20_arg4, f20_arg2 )
					SendClientScriptMenuChangeNotify( f20_arg2, f20_local2, false )
					GoBack( f20_local2, f20_arg2 )
				elseif f20_local1 then
					GoBackToCustomClassMenu( f20_local1, f20_arg2 )
				else
					local f20_local2 = GoBack( f20_arg4, f20_arg2 )
					f20_local2:processEvent( {
						name = "update_state",
						menu = f20_local2
					} )
				end
			end
			
			local f16_local7 = function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3, f21_arg4 )
				local f21_local0 = CoD.CCUtility.Heroes.HeroIndexForEdits
				local f21_local1 = CoD.CCUtility.GetHeroEquippedSlot( f21_arg2, f15_arg1 )
				local f21_local2 = GoBack( f21_arg4, f21_arg2 )
				if f21_local1 then
					f21_arg1.itemIndex = f15_arg1
					if not f21_arg3 then
						f21_arg3 = {}
					end
					f21_arg3.previousMenu = f21_local2
					UnlockAndEquipHeroForMPFirstTimeSetup( f21_arg0, f21_arg1, f21_arg2, f21_arg3, f21_arg4 )
				end
				GoBackToMenu( f21_local2, f21_arg2, "Lobby" )
			end
			
			local f16_local8 = function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3, f22_arg4 )
				PermanentlyUnlockItem( f22_arg4, f22_arg1, f22_arg2 )
				local f22_local0 = GoBackAndUpdateStateOnPreviousMenu( f22_arg4, f22_arg2 )
			end
			
			local f16_local9 = function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3, f23_arg4 )
				GoBack( f23_arg4, f23_arg2 )
			end
			
			local f16_local10 = not f16_local2
			if CoD.CCUtility.customizationMode == Enum.eModes.MODE_MULTIPLAYER and IsFirstTimeSetup( f16_arg0, Enum.eModes.MODE_MULTIPLAYER ) then
				table.insert( f16_local0, f16_local3( "MENU_UNLOCK_AND_EQUIP", f16_local7 ) )
			elseif f16_local2 then
				table.insert( f16_local0, f16_local3( "MENU_UNLOCK", f16_local4 ) )
				table.insert( f16_local0, f16_local3( "MENU_CANCEL_UNLOCK", f16_local9 ) )
			elseif f15_arg2 ~= nil then
				local f16_local11 = false
				for f16_local15, f16_local16 in ipairs( CoD.CACUtility.GetSlotListWithSlot( f16_local1 ) ) do
					if CoD.CACUtility.GetItemEquippedInSlot( f16_local16, f16_arg0 ) == f15_arg1 then
						f16_local11 = true
					end
				end
				if f16_local11 then
					table.insert( f16_local0, f16_local3( "MENU_UNLOCK", f16_local6 ) )
				else
					table.insert( f16_local0, f16_local3( "MENU_UNLOCK", f16_local4 ) )
					table.insert( f16_local0, f16_local3( "MENU_UNLOCK_AND_EQUIP", f16_local6 ) )
				end
				table.insert( f16_local0, f16_local3( "MENU_CANCEL_UNLOCK", f16_local9 ) )
			elseif f15_arg3 then
				table.insert( f16_local0, f16_local3( "MENU_UNLOCK_AND_EQUIP", f16_local5 ) )
				table.insert( f16_local0, f16_local3( "MENU_CANCEL_UNLOCK", f16_local9 ) )
			elseif CoD.CCUtility.customizationMode == Enum.eModes.MODE_MULTIPLAYER and HavePermanentUnlockTokens( f16_arg0 ) then
				table.insert( f16_local0, f16_local3( "MENU_UNLOCK", f16_local4 ) )
				table.insert( f16_local0, f16_local3( "MENU_UNLOCK_AND_EQUIP", f16_local6 ) )
				table.insert( f16_local0, f16_local3( "MENU_PERMANENTLY_UNLOCK", f16_local8, false ) )
				table.insert( f16_local0, f16_local3( "MENU_CANCEL_UNLOCK", f16_local9 ) )
			else
				table.insert( f16_local0, f16_local3( "MENU_UNLOCK", f16_local4 ) )
				table.insert( f16_local0, f16_local3( "MENU_UNLOCK_AND_EQUIP", f16_local6 ) )
				table.insert( f16_local0, f16_local3( "MENU_CANCEL_UNLOCK", f16_local9 ) )
			end
			return f16_local0
		end, true )
		return "UnlockTokenMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
CoD.OverlayUtility.AddSystemOverlay( "PrestigeWeapon", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.systemOverlay_Full_BasicFrame_Prestige",
	title = function ( f24_arg0, f24_arg1 )
		return Engine.ToUpper( Engine.Localize( "MENU_ENTER_WEAPON_PRESTIGE_X", CoD.CACUtility.GetWeaponPLevel( f24_arg0, Engine.GetModelValue( f24_arg1 ) ) + 1 ) )
	end,
	description = function ( f25_arg0, f25_arg1 )
		return Engine.Localize( "MENU_WEAPON_PRESTIGE_MESSAGE_" .. CoD.CACUtility.GetWeaponPLevel( f25_arg0, Engine.GetModelValue( f25_arg1 ) ) + 1, Engine.GetItemName( Engine.GetModelValue( f25_arg1 ) ) )
	end,
	supportText = function ( f26_arg0, f26_arg1 )
		return Engine.Localize( Engine.GetItemName( Engine.GetModelValue( f26_arg1 ) ) )
	end,
	image = function ( f27_arg0, f27_arg1 )
		return Engine.GetItemImage( Engine.GetModelValue( f27_arg1 ) )
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.Unlock,
	listDatasource = function ( f28_arg0, f28_arg1 )
		DataSources.PrestigeWeaponOptionsList = DataSourceHelpers.ListSetup( "PrestigeWeaponOptionsList", function ( f29_arg0 )
			local f29_local0 = {}
			local f29_local1 = function ( f30_arg0, f30_arg1 )
				return {
					models = {
						displayText = f30_arg0
					},
					properties = {
						action = f30_arg1
					}
				}
			end
			
			table.insert( f29_local0, f29_local1( "MENU_ENTER_WEAPON_PRESTIGE", function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3, f31_arg4 )
				local f31_local0 = Engine.GetCustomClassCount( f31_arg2 )
				local f31_local1 = Engine.GetModel( Engine.GetModelForController( f31_arg2 ), "CustomClassList" )
				local f31_local2 = Engine.GetModelValue( f28_arg1 )
				for f31_local3 = 1, f31_local0, 1 do
					local f31_local6 = f31_local3 - 1
					local f31_local7 = Engine.GetModel( f31_local1, "class" .. f31_local3 )
					if CoD.SafeGetModelValue( f31_local7, "primary.itemIndex" ) == f31_local2 then
						for f31_local8 = 1, CoD.CACUtility.maxPrimaryAttachments, 1 do
							Engine.SetClassItem( f31_arg2, f31_local6, "primaryattachment" .. f31_local8, CoD.CACUtility.EmptyItemIndex )
						end
					end
					if CoD.SafeGetModelValue( f31_local7, "secondary.itemIndex" ) == f31_local2 then
						for f31_local8 = 1, CoD.CACUtility.maxSecondaryAttachments, 1 do
							Engine.SetClassItem( f31_arg2, f31_local6, "secondaryattachment" .. f31_local8, CoD.CACUtility.EmptyItemIndex )
						end
					end
				end
				local f31_local3 = Engine.GetNumberOfClassSetsOwned( f31_arg2 )
				for f31_local4 = 1, f31_local3, 1 do
					local f31_local7 = f31_local4 - 1
					for f31_local8 = 1, f31_local0, 1 do
						local f31_local12 = f31_local8 - 1
						local f31_local13 = Engine.GetClassSetItem( f31_arg2, f31_local7, f31_local12, "primary" )
						local f31_local14 = Engine.GetClassSetItem( f31_arg2, f31_local7, f31_local12, "secondary" )
						if f31_local13 == f31_local2 then
							for f31_local15 = 1, CoD.CACUtility.maxPrimaryAttachments, 1 do
								Engine.SetClassSetItem( f31_arg2, f31_local7, f31_local12, "primaryattachment" .. f31_local15, CoD.CACUtility.EmptyItemIndex )
							end
						end
						if f31_local14 == f31_local2 then
							for f31_local15 = 1, CoD.CACUtility.maxPrimaryAttachments, 1 do
								Engine.SetClassSetItem( f31_arg2, f31_local7, f31_local12, "secondaryattachment" .. f31_local15, CoD.CACUtility.EmptyItemIndex )
							end
						end
					end
				end
				local f31_local4 = Engine.GetPlayerStats( f31_arg2 )
				f31_local4 = f31_local4.itemstats[Engine.GetModelValue( f28_arg1 )]
				f31_local4.xp:set( 0 )
				f31_local4.pLevel:set( math.min( f31_local4.pLevel:get() + 1, CoD.CACUtility.maxWeaponPrestige ) )
				UploadStats( f31_arg4, f31_arg2 )
				SaveLoadout( f31_arg4, f31_arg2 )
				Engine.ForceNotifyModelSubscriptions( f28_arg1 )
				GoBack( f31_arg4, f31_arg2 )
			end ) )
			table.insert( f29_local0, f29_local1( "MENU_CANCEL", CoD.OverlayUtility.DefaultButtonAction ) )
			return f29_local0
		end, true )
		return "PrestigeWeaponOptionsList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
CoD.CACUtility.GetCameraNameForAttachments = function ( f32_arg0, f32_arg1 )
	local f32_local0 = 0
	local f32_local1 = 0
	for f32_local5 in string.gmatch( f32_arg0, "[^+]+" ) do
		if f32_local5 == "suppressed" then
			f32_local0 = 1
		end
		if f32_local5 == "extbarrel" then
			f32_local1 = 1
		end
	end
	f32_local2 = "select"
	if f32_arg1 ~= nil and f32_arg1 then
		f32_local2 = "gunsmith"
	end
	f32_local3 = ""
	if f32_local0 == 1 then
		if f32_local1 == 1 then
			f32_local3 = "_extbarrel_suppressor"
		else
			f32_local3 = "_suppressor"
		end
	elseif f32_local1 == 1 then
		f32_local3 = "_extbarrel"
	else
		f32_local3 = "01"
	end
	return f32_local2 .. f32_local3
end

CoD.CACUtility.GetImageForItemRef = function ( f33_arg0 )
	return Engine.TableLookup( nil, CoD.statsTable, 0, f33_arg0, 6 )
end

CoD.CACUtility.GetNameForItemRef = function ( f34_arg0 )
	return Engine.TableLookup( nil, CoD.statsTable, 0, f34_arg0, 3 )
end

CoD.CACUtility.GetIdForItemRef = function ( f35_arg0 )
	return Engine.TableLookup( nil, CoD.statsTable, 0, f35_arg0, 4 )
end

CoD.CACUtility.GetNameForStatsTableImage = function ( f36_arg0 )
	return Engine.TableLookup( nil, CoD.statsTable, 6, f36_arg0, 3 )
end

CoD.CACUtility.GetImageForItemRefString = function ( f37_arg0 )
	return Engine.TableLookup( nil, CoD.statsTable, 4, f37_arg0, 6 )
end

CoD.CACUtility.GetNameForItemRefString = function ( f38_arg0 )
	return Engine.TableLookup( nil, CoD.statsTable, 4, f38_arg0, 3 )
end

CoD.CACUtility.GetItemIndexForItemRefString = function ( f39_arg0 )
	return Engine.TableLookup( nil, CoD.statsTable, 4, f39_arg0, 0 )
end

CoD.CACUtility.GetMPItemIndexForItemRefString = function ( f40_arg0 )
	return Engine.TableLookup( nil, "gamedata/stats/mp/mp_statsTable.csv", 4, f40_arg0, 0 )
end

CoD.CACUtility.CombatRecordGetFullNameStat = function ( f41_arg0, f41_arg1 )
	local f41_local0 = CoD.GetCombatRecordStatForPath( CoD.GetCombatRecordStats( f41_arg0 ), f41_arg1 )
	if f41_local0 then
		return f41_local0
	else
		return ""
	end
end

CoD.CACUtility.IsSlotNameInList = function ( f42_arg0, f42_arg1 )
	for f42_local3, f42_local4 in ipairs( f42_arg0 ) do
		if f42_local4 == f42_arg1 then
			return true
		end
	end
	return false
end

CoD.CACUtility.GetSlotListWithSlot = function ( f43_arg0 )
	for f43_local3, f43_local4 in ipairs( CoD.CACUtility.SlotLists ) do
		if CoD.CACUtility.IsSlotNameInList( f43_local4, f43_arg0 ) then
			return f43_local4
		end
	end
	return {}
end

CoD.CACUtility.GetWeaponSlotForAttachmentSlot = function ( f44_arg0 )
	if CoD.CACUtility.IsSlotNameInList( CoD.CACUtility.SecondaryAttachmentSlotNameList, f44_arg0 ) then
		return CoD.CACUtility.loadoutSlotNames.secondaryWeapon
	else
		return CoD.CACUtility.loadoutSlotNames.primaryWeapon
	end
end

CoD.CACUtility.GetAttachmentListForSlot = function ( f45_arg0 )
	if LUI.startswith( f45_arg0, "primarygadget" ) then
		return CoD.CACUtility.PrimaryGadgetAttachmentSlotNameList
	elseif LUI.startswith( f45_arg0, "secondarygadget" ) then
		return CoD.CACUtility.SecondaryGadgetAttachmentSlotNameList
	elseif LUI.startswith( f45_arg0, "primary" ) then
		return CoD.CACUtility.PrimaryAttachmentSlotNameList
	elseif LUI.startswith( f45_arg0, "secondary" ) then
		return CoD.CACUtility.SecondaryAttachmentSlotNameList
	else
		return {}
	end
end

CoD.CACUtility.GetCACWeaponACVList = function ( f46_arg0 )
	if f46_arg0 == "primary" then
		return CoD.CACUtility.PrimaryAttachmentCVSlotNameList
	elseif f46_arg0 == "secondary" then
		return CoD.CACUtility.SecondaryAttachmentCVSlotNameList
	else
		return {}
	end
end

CoD.CACUtility.GetAllocationSpentFromClassData = function ( f47_arg0 )
	return CoD.SumClassItemCosts( f47_arg0.primaryWeapon ) + CoD.SumClassItemCosts( f47_arg0.primaryAttachments ) + CoD.SumClassItemCosts( f47_arg0.secondaryWeapon ) + CoD.SumClassItemCosts( f47_arg0.secondaryAttachments ) + CoD.SumClassItemCosts( f47_arg0.grenades ) + CoD.SumClassItemCosts( f47_arg0.gadgets ) + CoD.SumClassItemCosts( f47_arg0.perks ) + CoD.SumClassItemCosts( f47_arg0.rewards )
end

CoD.CACUtility.HowManyInClassData = function ( f48_arg0, f48_arg1 )
	return CoD.HowManyInClassSlot( f48_arg0, f48_arg1.primaryWeapon ) + CoD.HowManyInClassSlot( f48_arg0, f48_arg1.secondaryWeapon ) + CoD.HowManyInClassSlot( f48_arg0, f48_arg1.grenades ) + CoD.HowManyInClassSlot( f48_arg0, f48_arg1.gadgets ) + CoD.HowManyInClassSlot( f48_arg0, f48_arg1.perks ) + CoD.HowManyInClassSlot( f48_arg0, f48_arg1.rewards )
end

CoD.CACUtility.GetClassData = function ( f49_arg0, f49_arg1 )
	local f49_local0 = {}
	if f49_arg1 == nil then
		f49_arg1 = CoD.perController[f49_arg0].classNumInternal
	end
	local f49_local1 = CoD.CACUtility.loadoutSlotNames
	f49_local0.primaryWeapon = {}
	CoD.AddClassItemData( f49_local0.primaryWeapon, CoD.GetClassItem( f49_arg0, f49_arg1, f49_local1.primaryWeapon ) )
	f49_local0.secondaryWeapon = {}
	CoD.AddClassItemData( f49_local0.secondaryWeapon, CoD.GetClassItem( f49_arg0, f49_arg1, f49_local1.secondaryWeapon ) )
	f49_local0.primaryAttachments = {}
	f49_local0.secondaryAttachments = {}
	local f49_local2 = CoD.GetClassItem( f49_arg0, f49_arg1, f49_local1.primaryWeapon )
	local f49_local3 = CoD.GetClassItem( f49_arg0, f49_arg1, f49_local1.secondaryWeapon )
	for f49_local4 = 0, 2, 1 do
		CoD.AddClassAttachmentData( f49_local0.primaryAttachments, f49_local2, CoD.GetClassItem( f49_arg0, f49_arg1, f49_local1.primaryWeapon .. "attachment" .. f49_local4 + 1 ) )
		CoD.AddClassAttachmentData( f49_local0.secondaryAttachments, f49_local3, CoD.GetClassItem( f49_arg0, f49_arg1, f49_local1.secondaryWeapon .. "attachment" .. f49_local4 + 1 ) )
	end
	f49_local0.grenades = {}
	CoD.AddClassItemData( f49_local0.grenades, CoD.GetClassItem( f49_arg0, f49_arg1, f49_local1.primaryGrenade ), CoD.GetClassItem( f49_arg0, f49_arg1, "primarygrenadecount" ), f49_local1.primaryGrenade )
	CoD.AddClassItemData( f49_local0.grenades, CoD.GetClassItem( f49_arg0, f49_arg1, f49_local1.specialGrenade ), CoD.GetClassItem( f49_arg0, f49_arg1, "specialgrenadecount" ), f49_local1.specialGrenade )
	f49_local0.gadgets = {}
	CoD.AddClassItemData( f49_local0.gadgets, CoD.GetClassItem( f49_arg0, f49_arg1, f49_local1.primaryGadget ) )
	CoD.AddClassItemData( f49_local0.gadgets, CoD.GetClassItem( f49_arg0, f49_arg1, f49_local1.secondaryGadget ) )
	local f49_local4 = CoD.CACUtility.maxSpecialtySlots
	f49_local0.perks = {}
	for f49_local5 = 1, f49_local4, 1 do
		CoD.AddClassItemData( f49_local0.perks, CoD.GetClassItem( f49_arg0, f49_arg1, f49_local1["specialty" .. f49_local5] ) )
	end
	local f49_local5 = CoD.CACUtility.maxRewards
	f49_local0.rewards = {}
	for f49_local6 = 1, f49_local5, 1 do
		CoD.AddClassItemData( f49_local0.rewards, CoD.GetClassItem( f49_arg0, f49_arg1, "killstreak" .. f49_local6 ) )
	end
	table.sort( f49_local0.rewards, function ( f50_arg0, f50_arg1 )
		return f50_arg0.momentumCost < f50_arg1.momentumCost
	end )
	return f49_local0
end

CoD.CACUtility.GetLoadoutsMPOffline = function ( f51_arg0 )
	local f51_local0 = Engine.StorageGetBuffer( f51_arg0, Enum.StorageFileType.STORAGE_MP_LOADOUTS_OFFLINE )
	return f51_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsMPOnlinePublic = function ( f52_arg0 )
	local f52_local0 = Engine.StorageGetBuffer( f52_arg0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	return f52_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsMPOnlineCustom = function ( f53_arg0 )
	local f53_local0 = Engine.StorageGetBuffer( f53_arg0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	return f53_local0.customMatchCacLoadouts
end

CoD.CACUtility.GetLoadoutsMPOnlineLeague = function ( f54_arg0 )
	local f54_local0 = Engine.StorageGetBuffer( f54_arg0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	return f54_local0.leagueCacLoadouts
end

CoD.CACUtility.GetLoadoutsCPOffline = function ( f55_arg0 )
	local f55_local0 = Engine.StorageGetBuffer( f55_arg0, Enum.StorageFileType.STORAGE_CP_LOADOUTS_OFFLINE )
	return f55_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsCPOnline = function ( f56_arg0 )
	local f56_local0 = Engine.StorageGetBuffer( f56_arg0, Enum.StorageFileType.STORAGE_CP_LOADOUTS )
	return f56_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsZMOffline = function ( f57_arg0 )
	local f57_local0 = Engine.StorageGetBuffer( f57_arg0, Enum.StorageFileType.STORAGE_ZM_LOADOUTS_OFFLINE )
	return f57_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsZMOnline = function ( f58_arg0 )
	local f58_local0 = Engine.StorageGetBuffer( f58_arg0, Enum.StorageFileType.STORAGE_ZM_LOADOUTS )
	return f58_local0.cacLoadouts
end

CoD.CACUtility.SetDefaultCACRootOld = function ( f59_arg0 )
	if CoD.isOnlineGame() ~= true then
		local f59_local0 = CoD.perController[f59_arg0]
		local f59_local1 = CoD.GetPlayerStats( f59_arg0 )
		f59_local0.cacRoot = f59_local1.cacLoadouts
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
		local f59_local0 = CoD.perController[f59_arg0]
		local f59_local1 = CoD.GetPlayerStats( f59_arg0 )
		f59_local0.cacRoot = f59_local1.leagueCacLoadouts
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) then
		local f59_local0 = CoD.perController[f59_arg0]
		local f59_local1 = CoD.GetPlayerStats( f59_arg0 )
		f59_local0.cacRoot = f59_local1.customMatchCacLoadouts
	else
		local f59_local0 = CoD.perController[f59_arg0]
		local f59_local1 = CoD.GetPlayerStats( f59_arg0 )
		f59_local0.cacRoot = f59_local1.cacLoadouts
	end
end

CoD.CACUtility.SetDefaultCACRoot = function ( f60_arg0 )
	local f60_local0 = nil
	if CoD.isOnlineGame() ~= true then
		f60_local0 = CoD.CPMPZM( CoD.CACUtility.GetLoadoutsCPOffline, CoD.CACUtility.GetLoadoutsMPOffline, CoD.CACUtility.GetLoadoutsZMOffline )
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
		f60_local0 = CoD.CPMPZM( nil, CoD.CACUtility.GetLoadoutsMPOnlineLeague, nil )
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) then
		f60_local0 = CoD.CPMPZM( CoD.CACUtility.GetLoadoutsCPOnline, CoD.CACUtility.GetLoadoutsMPOnlineCustom, CoD.CACUtility.GetLoadoutsZMOnline )
	else
		f60_local0 = CoD.CPMPZM( CoD.CACUtility.GetLoadoutsCPOnline, CoD.CACUtility.GetLoadoutsMPOnlinePublic, CoD.CACUtility.GetLoadoutsZMOnline )
	end
	if f60_local0 ~= nil then
		CoD.perController[f60_arg0].cacRoot = f60_local0( f60_arg0 )
	else
		error( "LUI Error: could not set up loadout root - no valid game mode set" )
	end
end

CoD.CACUtility.SetGametypeSettingsCACRoot = function ( f61_arg0, f61_arg1 )
	local f61_local0 = nil
	if f61_arg1 == Enum.team_t.TEAM_FREE then
		f61_local0 = 0
	else
		f61_local0 = f61_arg1 - Enum.team_t.TEAM_FIRST_PLAYING_TEAM + 1
	end
	local f61_local1 = CoD.perController[f61_arg0]
	local f61_local2 = Engine.GetGametypeSettings()
	f61_local1.cacRoot = f61_local2.cacLoadouts[f61_local0]
end

CoD.CACUtility.GetCACRoot = function ( f62_arg0 )
	return CoD.perController[f62_arg0].cacRoot
end

CoD.CACUtility.GetLoadoutNames = function ( f63_arg0 )
	local f63_local0 = CoD.CACUtility.GetCACRoot( f63_arg0 )
	if f63_local0 then
		return f63_local0.customClassName
	else
		return nil
	end
end

CoD.CACUtility.GetLoadoutNameFromIndex = function ( f64_arg0, f64_arg1 )
	local f64_local0 = CoD.CACUtility.GetLoadoutNames( f64_arg0 )
	if f64_local0 then
		return f64_local0[f64_arg1]
	else
		return nil
	end
end

CoD.CACUtility.GetDefaultLoadoutNameFromIndex = function ( f65_arg0 )
	if f65_arg0 < 1 or f65_arg0 > CoD.CACUtility.maxDefaultClass then
		error( "LUI Error: Default loadout out with index " .. f65_arg0 .. " doesn't exist." )
	end
	return CoD.CACUtility.defaultClassNames[f65_arg0]
end

CoD.CACUtility.GetDefaultArenaLoadoutNameFromIndex = function ( f66_arg0 )
	if f66_arg0 < 1 or f66_arg0 > CoD.CACUtility.maxDefaultClass then
		error( "LUI Error: Default loadout out with index " .. f66_arg0 .. " doesn't exist." )
	end
	return CoD.CACUtility.defaultArenaClassNames[f66_arg0]
end

CoD.CACUtility.SetupCACLock = function ( f67_arg0 )
	CoD.SetupButtonLock( f67_arg0, nil, "FEATURE_CREATE_A_CLASS", "FEATURE_CREATE_A_CLASS_DESC" )
end

CoD.CACUtility.IsBonusCardEquippedByName = function ( f68_arg0, f68_arg1 )
	local f68_local0 = Engine.GetItemIndexFromReference( f68_arg1, CoD.PrestigeUtility.GetPermanentUnlockMode() )
	for f68_local1 = 1, CoD.CACUtility.maxBonusCards, 1 do
		if f68_local0 ~= nil and f68_arg0["bonuscard" .. f68_local1] == f68_local0 then
			return true
		end
	end
	return false
end

CoD.CACUtility.IsBonusCardEquippedByIndex = function ( f69_arg0, f69_arg1 )
	for f69_local0 = 1, CoD.CACUtility.maxBonusCards, 1 do
		if f69_arg1 ~= nil and f69_arg0["bonuscard" .. f69_local0] == f69_arg1 then
			return true
		end
	end
	return false
end

CoD.CACUtility.GetBonusCardLoadoutSlot = function ( f70_arg0, f70_arg1 )
	for f70_local0 = 1, CoD.CACUtility.maxBonusCards, 1 do
		local f70_local3 = "bonuscard" .. f70_local0
		if f70_arg1 ~= nil and f70_arg0[f70_local3] == f70_arg1 then
			return f70_local3
		end
	end
end

CoD.CACUtility.GetLoadoutSlotForAttachmentName = function ( f71_arg0, f71_arg1, f71_arg2 )
	local f71_local0 = CoD.CACUtility.PrimaryAttachmentSlotNameList
	if LUI.startswith( f71_arg1, "secondary" ) then
		f71_local0 = CoD.CACUtility.SecondaryAttachmentSlotNameList
	end
	for f71_local5, f71_local6 in ipairs( f71_local0 ) do
		local f71_local7 = Engine.GetModel( f71_arg0, f71_local6 )
		if f71_local7 then
			local f71_local4 = Engine.GetModel( f71_local7, "ref" )
			if f71_local4 and Engine.GetModelValue( f71_local4 ) == f71_arg2 then
				return f71_local6
			end
		end
	end
	return nil
end

CoD.CACUtility.GetAttachmentVariantForAttachmentList = function ( f72_arg0, f72_arg1 )
	local f72_local0 = CoD.CACUtility.PrimaryAttachmentSlotNameList
	if LUI.startswith( f72_arg1, "secondary" ) then
		f72_local0 = CoD.CACUtility.SecondaryAttachmentSlotNameList
	end
	local f72_local1 = {}
	for f72_local8, f72_local9 in ipairs( f72_local0 ) do
		local f72_local10 = Engine.GetModel( f72_arg0, f72_local9 )
		if f72_local10 then
			local f72_local5 = Engine.GetModel( f72_local10, "ref" )
			if f72_local5 then
				local f72_local6 = Engine.GetModelValue( f72_local5 )
				if f72_local6 ~= "" then
					local f72_local7 = Engine.GetModel( f72_arg0, f72_local9 .. "cosmeticvariant.itemIndex" )
					if f72_local7 then
						table.insert( f72_local1, {
							ref = f72_local6,
							attachmentIndex = Engine.GetModelValue( f72_local7 )
						} )
					end
				end
			end
		end
	end
	return f72_local1
end

CoD.CACUtility.IsAttachmentRefWeaponOption = function ( f73_arg0 )
	for f73_local0 = 0, #CoD.CACUtility.weaponOptionGroupNames - 1, 1 do
		if CoD.CACUtility.weaponOptionGroupNames[f73_local0] == f73_arg0 then
			return true
		end
	end
	return false
end

CoD.CACUtility.GetWeaponOptionTypeForName = function ( f74_arg0 )
	for f74_local0 = 0, #CoD.CACUtility.weaponOptionGroupNames - 1, 1 do
		if CoD.CACUtility.weaponOptionGroupNames[f74_local0] == f74_arg0 then
			return f74_local0
		end
	end
	return nil
end

CoD.CACUtility.UpdateWeaponPrestigeAttachment = function ( f75_arg0, f75_arg1, f75_arg2 )
	local f75_local0 = CoD.perController[f75_arg0].classModel
	local f75_local1 = CoD.perController[f75_arg0].weaponCategory
	local f75_local2 = f75_local1 .. f75_arg1
	local f75_local3 = nil
	if f75_local1 == "primary" then
		f75_local3 = CoD.CACUtility.PrimaryAttachmentSlotNameList
	elseif f75_local1 == "secondary" then
		f75_local3 = CoD.CACUtility.SecondaryAttachmentSlotNameList
	else
		return 
	end
	local f75_local4 = Engine.GetModel( f75_local0, f75_local1 .. ".itemIndex" )
	if f75_local4 then
		local f75_local5 = Engine.GetModelValue( f75_local4 )
		local f75_local6 = Engine.GetItemRef( f75_local5 ) .. "_" .. CoD.gameMode:lower()
		local f75_local7 = Engine.GetAttachmentRef( f75_local5, f75_arg2 )
		local f75_local8 = {}
		local f75_local9 = false
		for f75_local13, f75_local14 in ipairs( f75_local3 ) do
			local f75_local15 = Engine.GetModelValue( Engine.GetModel( f75_local0, f75_local14 .. ".itemIndex" ) )
			if CoD.CACUtility.EmptyItemIndex < f75_local15 then
				if f75_local14 ~= f75_local2 then
					table.insert( f75_local8, {
						index = f75_local15,
						ref = Engine.GetAttachmentRef( f75_local5, f75_local15 )
					} )
				else
					f75_local9 = true
				end
			end
		end
		for f75_local13, f75_local14 in ipairs( f75_local8 ) do
			local f75_local15 = f75_local14.ref
			local f75_local16 = f75_local14.index
			if (not Engine.IsOptic( f75_local5, f75_arg2 ) or not Engine.IsOptic( f75_local5, f75_local16 )) and Engine.AreAttachmentsCompatible( f75_local5, f75_arg2, f75_local16 ) then
				f75_local6 = f75_local6 .. "+" .. f75_local15
			end
		end
		f75_local6 = f75_local6 .. "+" .. f75_local7
		if f75_local6 and f75_local6 ~= "" then
			Engine.SendClientScriptNotify( f75_arg0, "CustomClass_focus" .. CoD.GetLocalClientAdjustedNum( f75_arg0 ), f75_local1, f75_local6, f75_local7, CoD.CACUtility.GetWeaponOptionsFromClass( f75_arg0, f75_local0, f75_local1 ), CoD.CACUtility.GetACVariantsFromClassExcludeAttachment( f75_arg0, f75_local0, f75_local2, f75_local7 ) .. f75_local7 .. "," .. 0, true )
		end
	end
end

CoD.CACUtility.GetAttachedItemSlot = function ( f76_arg0, f76_arg1, f76_arg2 )
	for f76_local4, f76_local5 in ipairs( f76_arg2 ) do
		local f76_local6 = Engine.GetModel( f76_arg0, f76_local5 )
		if f76_local6 then
			local f76_local3 = Engine.GetModel( f76_local6, "itemIndex" )
			if f76_local3 and Engine.GetModelValue( f76_local3 ) == f76_arg1 then
				return f76_local5
			end
		end
	end
	return nil
end

CoD.CACUtility.FindFirstEmptySlotInList = function ( f77_arg0, f77_arg1 )
	for f77_local4, f77_local5 in ipairs( f77_arg1 ) do
		local f77_local6 = Engine.GetModel( f77_arg0, f77_local5 )
		if f77_local6 then
			local f77_local3 = Engine.GetModel( f77_local6, "itemIndex" )
			if f77_local3 and Engine.GetModelValue( f77_local3 ) <= CoD.CACUtility.EmptyItemIndex then
				return f77_local5
			end
		end
	end
	return nil
end

CoD.CACUtility.IsBonusCardEquipped = function ( f78_arg0, f78_arg1 )
	if not f78_arg1 then
		return false
	elseif f78_arg1 then
		for f78_local4, f78_local5 in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
			local f78_local6 = Engine.GetModel( f78_arg1, f78_local5 )
			if f78_local6 then
				local f78_local3 = Engine.GetModel( f78_local6, "itemIndex" )
				if f78_local3 and Engine.GetItemRef( Engine.GetModelValue( f78_local3 ) ) == f78_arg0 then
					return true
				end
			end
		end
	end
	return false
end

CoD.CACUtility.SpecificWildcardEquippedCount = function ( f79_arg0, f79_arg1 )
	local f79_local0 = 0
	if f79_arg0 then
		local f79_local1 = Engine.GetItemIndexFromReference( f79_arg1 )
		for f79_local6, f79_local7 in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
			local f79_local8 = Engine.GetModel( f79_arg0, f79_local7 .. ".itemIndex" )
			if f79_local8 then
				local f79_local5 = Engine.GetModelValue( f79_local8 )
				if f79_local5 > CoD.CACUtility.EmptyItemIndex and LUI.startswith( Engine.GetItemRef( f79_local5 ), f79_arg1 ) then
					f79_local0 = f79_local0 + 1
				end
			end
		end
	end
	return math.min( math.max( f79_local0, 0 ), CoD.CACUtility.maxBonusCards )
end

CoD.CACUtility.PrimaryGunfighterEquippedCount = function ( f80_arg0 )
	local f80_local0 = 0
	for f80_local4, f80_local5 in ipairs( CoD.CACUtility.PrimaryGunfighterWildcards ) do
		if CoD.CACUtility.IsBonusCardEquipped( f80_local5, f80_arg0 ) then
			f80_local0 = f80_local0 + 1
		end
	end
	return math.min( math.max( f80_local0, 0 ), CoD.CACUtility.maxPrimaryGunfighters )
end

CoD.CACUtility.SearchForBonusCard = function ( f81_arg0, f81_arg1, f81_arg2 )
	if not f81_arg1 then
		return ""
	end
	local f81_local0 = f81_arg2 or CoD.perController[f81_arg1].classModel
	if f81_local0 then
		for f81_local5, f81_local6 in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
			local f81_local7 = Engine.GetModel( f81_local0, f81_local6 )
			if f81_local7 then
				local f81_local4 = Engine.GetModel( f81_local7, "itemIndex" )
				if f81_local4 and Engine.GetItemRef( Engine.GetModelValue( f81_local4 ) ) == f81_arg0 then
					return f81_local6
				end
			end
		end
	end
	return ""
end

CoD.CACUtility.GetItemIndexEquippedInSlot = function ( f82_arg0, f82_arg1, f82_arg2 )
	if not f82_arg1 then
		return 
	else
		local f82_local0 = f82_arg2 or CoD.perController[f82_arg1].classModel
		if f82_local0 then
			return CoD.SafeGetModelValue( f82_local0, f82_arg0 .. ".itemIndex" )
		else
			
		end
	end
end

CoD.CACUtility.GetItemRefEquippedInSlot = function ( f83_arg0, f83_arg1, f83_arg2 )
	if not f83_arg1 then
		return 
	else
		local f83_local0 = f83_arg2 or CoD.perController[f83_arg1].classModel
		if f83_local0 then
			return CoD.SafeGetModelValue( f83_local0, f83_arg0 .. ".ref" )
		else
			
		end
	end
end

CoD.CACUtility.IsItemEquippedInAnySlot = function ( f84_arg0, f84_arg1 )
	for f84_local3, f84_local4 in ipairs( f84_arg1 ) do
		if CoD.CACUtility.ItemEquippedInSlot( f84_local4, nil, f84_arg0 ) then
			return true
		end
	end
	return false
end

CoD.CACUtility.GetItemEquippedInSlot = function ( f85_arg0, f85_arg1, f85_arg2 )
	local f85_local0 = f85_arg2
	if not f85_local0 and f85_arg1 then
		f85_local0 = CoD.perController[f85_arg1].classModel
	end
	if f85_local0 then
		local f85_local1 = Engine.GetModel( f85_local0, f85_arg0 )
		if f85_local1 then
			local f85_local2 = Engine.GetModel( f85_local1, "itemIndex" )
			if f85_local2 then
				return Engine.GetModelValue( f85_local2 )
			end
		end
	end
	return CoD.CACUtility.EmptyItemIndex
end

CoD.CACUtility.ItemEquippedInSlot = function ( f86_arg0, f86_arg1, f86_arg2 )
	return CoD.CACUtility.EmptyItemIndex < CoD.CACUtility.GetItemEquippedInSlot( f86_arg0, f86_arg1, f86_arg2 )
end

CoD.CACUtility.DoesWeaponHaveDWInSlot = function ( f87_arg0, f87_arg1, f87_arg2 )
	if f87_arg0 ~= "primary" and f87_arg0 ~= "secondary" then
		return false
	end
	local f87_local0 = Engine.GetModel( f87_arg2, f87_arg0 )
	if f87_local0 then
		local f87_local1 = Engine.GetModelValue( Engine.GetModel( f87_local0, "itemIndex" ) )
		if f87_local1 > CoD.CACUtility.EmptyItemIndex then
			for f87_local6, f87_local7 in ipairs( CoD.CACUtility.GetAttachmentListForSlot( f87_arg0 ) ) do
				local f87_local8 = Engine.GetModelValue( Engine.GetModel( f87_arg2, f87_local7 .. ".itemIndex" ) )
				if f87_local8 > CoD.CACUtility.EmptyItemIndex then
					local f87_local5 = Engine.GetAttachmentRef( f87_local1, f87_local8 )
					if f87_local5 and f87_local5 == "dw" then
						return true
					end
				end
			end
		end
	end
	return false
end

CoD.CACUtility.DoesWeaponHaveAnyAttachments = function ( f88_arg0, f88_arg1, f88_arg2 )
	local f88_local0 = Engine.GetModel( f88_arg2, f88_arg0 )
	if f88_local0 then
		local f88_local1 = Engine.GetModelValue( Engine.GetModel( f88_local0, "itemIndex" ) )
		if f88_local1 > CoD.CACUtility.EmptyItemIndex and Engine.GetNumAttachments( f88_local1 ) > 1 then
			return true
		end
	end
	return false
end

CoD.CACUtility.GetItemName = function ( f89_arg0, f89_arg1, f89_arg2 )
	local f89_local0 = f89_arg2
	if not f89_local0 and f89_arg1 then
		f89_local0 = CoD.perController[f89_arg1].classModel
	end
	if f89_local0 then
		local f89_local1 = Engine.GetModel( f89_local0, f89_arg0 )
		if f89_local1 then
			local f89_local2 = Engine.GetModel( f89_local1, "name" )
			if f89_local2 then
				return Engine.GetModelValue( f89_local2 )
			end
		end
	end
	return ""
end

CoD.CACUtility.GetItemReferenceName = function ( f90_arg0, f90_arg1 )
	local f90_local0 = Engine.GetModel( f90_arg0, "itemIndex" )
	if f90_local0 then
		return Engine.GetItemRef( Engine.GetModelValue( f90_local0 ) )
	else
		return ""
	end
end

CoD.CACUtility.AllowTwoPrimaryTacticals = function ( f91_arg0 )
	local f91_local0
	if CoD.CACUtility.SearchForBonusCard( "bonuscard_danger_close", f91_arg0 ) == "" and CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", f91_arg0 ) == "" then
		f91_local0 = false
	else
		f91_local0 = true
	end
	return f91_local0
end

CoD.CACUtility.GetMutuallyExclusiveSlotName = function ( f92_arg0, f92_arg1, f92_arg2, f92_arg3 )
	local f92_local0 = Engine.GetItemRef( f92_arg2 )
	local f92_local1 = {}
	if not f92_arg3 then
		f92_arg3 = CoD.perController[f92_arg1].classModel
	end
	local f92_local2 = function ( f93_arg0, f93_arg1, f93_arg2 )
		if LUI.endswith( f92_local0, "_pro" ) and CoD.CACUtility.GetItemEquippedInSlot( f93_arg1, f93_arg0, f92_arg3 ) == Engine.GetItemIndexFromReference( string.sub( f92_local0, 1, -string.len( "_pro" ) - 1 ) ) then
			return f93_arg1
		else
			return ""
		end
	end
	
	if LUI.startswith( f92_arg0, "bonuscard" ) then
		if f92_local0 == "bonuscard_danger_close" then
			table.insert( f92_local1, CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", f92_arg1 ) )
		elseif f92_local0 == "bonuscard_two_tacticals" then
			table.insert( f92_local1, CoD.CACUtility.SearchForBonusCard( "bonuscard_danger_close", f92_arg1 ) )
		end
	elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", f92_arg1 ) and f92_arg0 == "primarygadget" then
		if CoD.CACUtility.GetItemEquippedInSlot( "secondarygadget", f92_arg1, f92_arg3 ) == f92_arg2 then
			table.insert( f92_local1, "secondarygadget" )
		end
	elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", f92_arg1 ) and f92_arg0 == "secondarygadget" then
		if CoD.CACUtility.GetItemEquippedInSlot( "primarygadget", f92_arg1, f92_arg3 ) == f92_arg2 then
			table.insert( f92_local1, "primarygadget" )
		end
	elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_overkill", f92_arg1 ) and f92_arg0 == "primary" then
		if CoD.CACUtility.GetItemEquippedInSlot( "secondary", f92_arg1, f92_arg3 ) == f92_arg2 then
			table.insert( f92_local1, "secondary" )
		end
	elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_overkill", f92_arg1 ) and f92_arg0 == "secondary" then
		if CoD.CACUtility.GetItemEquippedInSlot( "primary", f92_arg1, f92_arg3 ) == f92_arg2 then
			table.insert( f92_local1, "primary" )
		end
	elseif CoD.CACUtility.IsSlotNameInList( CoD.CACUtility.PrimaryAttachmentSlotNameList, f92_arg0 ) or CoD.CACUtility.IsSlotNameInList( CoD.CACUtility.SecondaryAttachmentSlotNameList, f92_arg0 ) then
		local f92_local3 = CoD.CACUtility.GetAttachmentListForSlot( f92_arg0 )
		local f92_local4 = "primary"
		if LUI.startswith( f92_arg0, "secondary" ) then
			f92_local4 = "secondary"
		end
		local f92_local5 = CoD.CACUtility.GetItemEquippedInSlot( f92_local4, f92_arg1, f92_arg3 )
		for f92_local9, f92_local10 in ipairs( f92_local3 ) do
			local f92_local11 = CoD.CACUtility.GetItemEquippedInSlot( f92_local10, f92_arg1, f92_arg3 )
			if f92_local11 ~= f92_arg2 and not Engine.AreAttachmentsCompatible( f92_local5, f92_local11, f92_arg2 ) and (not Engine.IsOptic( f92_local5, f92_local11 ) or not Engine.IsOptic( f92_local5, f92_arg2 )) then
				table.insert( f92_local1, f92_local10 )
			end
		end
	elseif f92_arg0 == "cybercom_tacrig1" then
		if CoD.CACUtility.GetItemEquippedInSlot( "cybercom_tacrig2", f92_arg1, f92_arg3 ) == f92_arg2 then
			table.insert( f92_local1, "cybercom_tacrig2" )
		end
		local f92_local3 = f92_local2( f92_arg1, "cybercom_tacrig2", f92_arg2 )
		if f92_local3 ~= "" then
			table.insert( f92_local1, f92_local3 )
		end
	elseif f92_arg0 == "cybercom_tacrig2" then
		if CoD.CACUtility.GetItemEquippedInSlot( "cybercom_tacrig1", f92_arg1, f92_arg3 ) == f92_arg2 then
			table.insert( f92_local1, "cybercom_tacrig1" )
		end
		local f92_local3 = f92_local2( f92_arg1, "cybercom_tacrig1", f92_arg2 )
		if f92_local3 ~= "" then
			table.insert( f92_local1, f92_local3 )
		end
	end
	return f92_local1
end

CoD.CACUtility.AttachmentHasCustomReticle = function ( f94_arg0 )
	return CoD.CACUtility.attachmentsWithCustReticle[f94_arg0] ~= nil
end

CoD.CACUtility.GetWeaponOptionMTXName = function ( f95_arg0 )
	return Engine.TableLookup( nil, CoD.attachmentTable, 0, f95_arg0, 16 )
end

CoD.CACUtility.GetWeaponOptionId = function ( f96_arg0 )
	return Engine.TableLookup( nil, CoD.attachmentTable, 0, f96_arg0, 4 )
end

CoD.CACUtility.GetBackingMTXName = function ( f97_arg0 )
	return Engine.TableLookup( nil, "gamedata/emblems/emblemsOrBackings.csv", 0, "background", 1, f97_arg0, 10 )
end

CoD.CACUtility.IsWeaponOptionMTX = function ( f98_arg0 )
	local f98_local0 = CoD.CACUtility.GetWeaponOptionMTXName( f98_arg0 )
	return f98_local0 and f98_local0 ~= ""
end

CoD.CACUtility.IsBackingMTX = function ( f99_arg0 )
	local f99_local0 = CoD.CACUtility.GetBackingMTXName( f99_arg0 )
	return f99_local0 and f99_local0 ~= ""
end

CoD.CACUtility.IsAnyWeaponMTXAvailable = function ()
	for f100_local0 = 0, CoD.CACUtility.maxMTXWeaponPacks, 1 do
		if Engine.IsMTXAvailable( "mtx_weapon" .. f100_local0 ) then
			return true
		end
	end
	return false
end

CoD.CACUtility.HasAnyWeaponMTX = function ( f101_arg0 )
	for f101_local0 = 0, CoD.CACUtility.maxMTXWeaponPacks, 1 do
		if Engine.HasMTX( f101_arg0, "mtx_weapon" .. f101_local0 ) then
			return true
		end
	end
	return false
end

CoD.CACUtility.ShouldDisplayWeaponOptionMTX = function ( f102_arg0, f102_arg1 )
	if Engine.SkipMTXItem( CoD.CACUtility.GetWeaponOptionMTXName( f102_arg1 ) ) == true then
		return false
	else
		return true
	end
end

CoD.CACUtility.GetMTXPurchaseMsg = function ( f103_arg0 )
	return "MPUI_" .. Engine.TableLookup( nil, "mp/mtxitems.csv", 1, f103_arg0, 3 ) .. "_MSG"
end

CoD.CACUtility.SelectedClassIndex = {}
CoD.CACUtility.IsOnlineGame = function ()
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false and not Engine.SessionMode_IsSystemlinkGame() then
		return true
	else
		return false
	end
end

CoD.CACUtility.SetProfileLoadoutChoice = function ( f105_arg0, f105_arg1 )
	local f105_local0 = "lastLoadoutSystemlink"
	if CoD.CACUtility.IsOnlineGame() == true then
		if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
			f105_local0 = "lastLoadoutLeague"
		else
			f105_local0 = "lastLoadoutOnline"
		end
	end
	Engine.SetProfileVar( f105_arg0, f105_local0, f105_arg1 )
	Engine.CommitProfileChanges( f105_arg0 )
	CoD.CACUtility.SelectedClassIndex[f105_arg0] = f105_arg1
end

CoD.CACUtility.GetEquipmentLabel = function ( f106_arg0, f106_arg1 )
	local f106_local0 = false
	local f106_local1 = "BAD EQUIPMENT LABEL"
	if f106_local0 then
		if f106_arg0 == CoD.CACUtility.loadoutSlotNames.primaryGadget then
			f106_local1 = Engine.Localize( "MPUI_PRIMARY_GADGET_CAPS" )
		elseif f106_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryGadget then
			f106_local1 = Engine.Localize( "MPUI_SECONDARY_GADGET_CAPS" )
		end
	elseif f106_arg0 == CoD.CACUtility.loadoutSlotNames.primaryGadget then
		if f106_arg1 ~= nil and CoD.CACUtility.IsBonusCardEquippedByName( f106_arg1, "bonuscard_two_tacticals" ) then
			f106_local1 = Engine.Localize( "MPUI_SECOND_SPECIAL_GRENADE_CAPS" )
		else
			f106_local1 = Engine.Localize( "MPUI_PRIMARY_GRENADE_CAPS" )
		end
	elseif f106_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryGadget then
		f106_local1 = Engine.Localize( "MPUI_SPECIAL_GRENADE_CAPS" )
	end
	return f106_local1
end

CoD.CACUtility.UpdateHeaderNames = function ( f107_arg0, f107_arg1, f107_arg2, f107_arg3 )
	local f107_local0 = Engine.GetCustomClass( f107_arg0, f107_arg1, CoD.PrestigeUtility.GetPermanentUnlockMode(), f107_arg3 )
	local f107_local1 = "MPUI_SECONDARY_WEAPON_CAPS"
	local f107_local2 = "MPUI_PRIMARYGRENADE_CAPS"
	local f107_local3 = "MPUI_SPECIALGRENADE_CAPS"
	if CoD.CACUtility.IsBonusCardEquippedByName( f107_local0, "bonuscard_overkill" ) == true then
		f107_local1 = "MPUI_SECOND_PRIMARY_CAPS"
	end
	if CoD.CACUtility.IsBonusCardEquippedByName( f107_local0, "bonuscard_two_tacticals" ) == true then
		f107_local2 = "MPUI_SECOND_SPECIAL_GRENADE_CAPS"
		f107_local3 = "MPUI_FIRST_SPECIAL_GRENADE_CAPS"
	end
	Engine.SetModelValue( Engine.CreateModel( f107_arg2, "secondary.headerName" ), f107_local1 )
	Engine.SetModelValue( Engine.CreateModel( f107_arg2, "primarygadget.headerName" ), f107_local2 )
	Engine.SetModelValue( Engine.CreateModel( f107_arg2, "primarygadgetattachment1.headerName" ), f107_local2 )
	Engine.SetModelValue( Engine.CreateModel( f107_arg2, "secondarygadget.headerName" ), f107_local3 )
	Engine.SetModelValue( Engine.CreateModel( f107_arg2, "secondarygadgetattachment1.headerName" ), f107_local3 )
	if not Engine.GetModel( f107_arg2, "primary.headerName" ) then
		Engine.SetModelValue( Engine.CreateModel( f107_arg2, "primary.headerName" ), "MPUI_PRIMARY_WEAPON_CAPS" )
		for f107_local7, f107_local8 in ipairs( CoD.CACUtility.PrimaryAttachmentSlotNameList ) do
			if f107_local7 == 1 then
				Engine.SetModelValue( Engine.CreateModel( f107_arg2, f107_local8 .. ".headerName" ), "MPUI_PRIMARY_OPTIC_CAPS" )
			else
				Engine.SetModelValue( Engine.CreateModel( f107_arg2, f107_local8 .. ".headerName" ), "MPUI_PRIMARY_ATTACHMENT_CAPS" )
			end
		end
		for f107_local7, f107_local8 in ipairs( CoD.CACUtility.SecondaryAttachmentSlotNameList ) do
			if f107_local7 == 1 then
				Engine.SetModelValue( Engine.CreateModel( f107_arg2, f107_local8 .. ".headerName" ), "MPUI_SECONDARY_OPTIC_CAPS" )
			else
				Engine.SetModelValue( Engine.CreateModel( f107_arg2, f107_local8 .. ".headerName" ), "MPUI_SECONDARY_ATTACHMENT_CAPS" )
			end
		end
		for f107_local7, f107_local8 in ipairs( CoD.CACUtility.Perk1SlotNameList ) do
			Engine.SetModelValue( Engine.CreateModel( f107_arg2, f107_local8 .. ".headerName" ), "MPUI_PERK1_CAPS" )
		end
		for f107_local7, f107_local8 in ipairs( CoD.CACUtility.Perk2SlotNameList ) do
			Engine.SetModelValue( Engine.CreateModel( f107_arg2, f107_local8 .. ".headerName" ), "MPUI_PERK2_CAPS" )
		end
		for f107_local7, f107_local8 in ipairs( CoD.CACUtility.Perk3SlotNameList ) do
			Engine.SetModelValue( Engine.CreateModel( f107_arg2, f107_local8 .. ".headerName" ), "MPUI_PERK3_CAPS" )
		end
		for f107_local7, f107_local8 in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
			Engine.SetModelValue( Engine.CreateModel( f107_arg2, f107_local8 .. ".headerName" ), "MENU_WILDCARD_CAPS" )
		end
	end
	local f107_local4 = "MENU_TACTICAL_RIG_CAPS"
	Engine.SetModelValue( Engine.CreateModel( f107_arg2, "cybercom_tacrig1.headerName" ), f107_local4 )
	Engine.SetModelValue( Engine.CreateModel( f107_arg2, "cybercom_tacrig2.headerName" ), f107_local4 )
end

CoD.CACUtility.AddBigImagesToCustomClassModel = function ( f108_arg0, f108_arg1, f108_arg2, f108_arg3 )
	local f108_local0 = Engine.GetModel( f108_arg1, f108_arg2 )
	if not f108_local0 then
		return 
	end
	local f108_local1 = Engine.GetModel( f108_local0, "image" )
	if f108_local1 then
		local f108_local2 = Engine.GetModelValue( f108_local1 )
		if f108_local2 then
			if f108_local2 == CoD.CACUtility.DefaultLoadoutImage then
				f108_arg3 = ""
			end
			Engine.SetModelValue( Engine.CreateModel( f108_local0, "image_big" ), f108_local2 .. f108_arg3 )
		end
	end
end

CoD.CACUtility.GetBonucardUnlockHint = function ( f109_arg0, f109_arg1, f109_arg2 )
	local f109_local0 = Engine.GetItemIndexFromReference( f109_arg1, f109_arg2 )
	return Engine.Localize( f109_arg0, Engine.GetItemName( f109_local0, f109_arg2 ), Engine.GetItemUnlockLevel( f109_local0, f109_arg2 ) + 1 )
end

CoD.CACUtility.IsCPHeroWeapon = function ( f110_arg0 )
	local f110_local0 = Engine.GetItemRef( f110_arg0 )
	local f110_local1 = IsCampaign()
	if f110_local1 then
		if f110_local0 ~= "hero_annihilator" and f110_local0 ~= "hero_pineapplegun" then
			f110_local1 = false
		else
			f110_local1 = true
		end
	end
	return f110_local1
end

CoD.CACUtility.GetCACSlotStatus = function ( f111_arg0, f111_arg1, f111_arg2 )
	local f111_local0 = CoD.CACUtility.CACStatusAvailable.AVAILABLE
	local f111_local1 = false
	local f111_local2 = ""
	local f111_local3 = nil
	local f111_local4 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	if CoD.CACUtility.ItemEquippedInSlot( f111_arg2, f111_arg0, f111_arg1 ) then
		f111_local1 = true
		local f111_local5 = "MPUI_BUTTON_PERSONALIZE_CAPS"
		if not Engine.LastInput_Gamepad( f111_arg0 ) then
			f111_local5 = "^3[P^7] " .. Engine.Localize( "MPUI_PERSONALIZE_CAPS" )
		end
		if f111_arg2 == "primary" or f111_arg2 == "secondary" then
			if CoD.CACUtility.IsCPHeroWeapon( CoD.CACUtility.GetItemEquippedInSlot( f111_arg2, f111_arg0, f111_arg1 ) ) then
				f111_local2 = "MPUI_EQUIP_WEAPON"
			else
				f111_local2 = f111_local5
			end
		elseif LUI.startswith( f111_arg2, "primaryattachment" ) or LUI.startswith( f111_arg2, "secondaryattachment" ) then
			if f111_arg2 == "primaryattachment1" or f111_arg2 == "secondaryattachment1" then
				if CoD.CACUtility.attachmentsWithCustReticle[CoD.CACUtility.GetItemRefEquippedInSlot( f111_arg2, f111_arg0, f111_arg1 )] then
					f111_local2 = f111_local5
				end
			else
				local f111_local6 = CoD.CACUtility.GetWeaponSlotForAttachmentSlot( f111_arg2 )
				if f111_local6 then
					local f111_local7 = Engine.GetAttachmentCosmeticVariantCountForAttachment( CoD.CACUtility.GetItemRefEquippedInSlot( f111_local6, f111_arg0, f111_arg1 ), Engine.GetItemAttachment( CoD.CACUtility.GetItemIndexEquippedInSlot( f111_local6, f111_arg0, f111_arg1 ), CoD.CACUtility.GetItemIndexEquippedInSlot( f111_arg2, f111_arg0, f111_arg1 ) ) )
					if f111_local7 and f111_local7 > 0 then
						f111_local2 = f111_local5
					end
				end
			end
		end
	elseif f111_arg2 == "primary" or f111_arg2 == "secondary" then
		f111_local2 = "MPUI_EQUIP_WEAPON"
	elseif f111_arg2 == "primarygadget" then
		if CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", f111_arg0 ) ~= "" then
			f111_local2 = "MPUI_EQUIP_TACTICAL"
		else
			f111_local2 = "MPUI_EQUIP_LETHAL"
		end
	elseif f111_arg2 == "secondarygadget" then
		f111_local2 = "MPUI_EQUIP_TACTICAL"
	elseif LUI.startswith( f111_arg2, "specialty" ) then
		f111_local2 = "MPUI_EQUIP_PERK"
		if f111_arg2 == "specialty4" then
			if IsNonAttachmentItemLocked( f111_arg0, "bonuscard_perk_1_greed" ) then
				f111_local2 = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_perk_1_greed", f111_local4 )
				f111_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_1_greed", f111_arg0, f111_arg1 ) == "" then
				f111_local2 = "MPUI_REQUIRES_PERK_1_GREED"
				f111_local0 = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			end
		elseif f111_arg2 == "specialty5" then
			if IsNonAttachmentItemLocked( f111_arg0, "bonuscard_perk_2_greed" ) then
				f111_local2 = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_perk_2_greed", f111_local4 )
				f111_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_2_greed", f111_arg0, f111_arg1 ) == "" then
				f111_local2 = "MPUI_REQUIRES_PERK_2_GREED"
				f111_local0 = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			end
		elseif f111_arg2 == "specialty6" then
			if IsNonAttachmentItemLocked( f111_arg0, "bonuscard_perk_3_greed" ) then
				f111_local2 = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_perk_3_greed", f111_local4 )
				f111_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_3_greed", f111_arg0, f111_arg1 ) == "" then
				f111_local2 = "MPUI_REQUIRES_PERK_3_GREED"
				f111_local0 = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			end
		end
	elseif LUI.startswith( f111_arg2, "primaryattachment" ) then
		local f111_local5 = CoD.CACUtility.GetItemEquippedInSlot( "primary", f111_arg0, f111_arg1 )
		local f111_local6 = Engine.GetNumAttachments( f111_local5, f111_local4 )
		if f111_arg2 == "primaryattachment1" then
			f111_local2 = "MPUI_EQUIP_OPTIC"
		else
			f111_local2 = "MPUI_EQUIP_ATTACHMENT"
		end
		if f111_local5 <= CoD.CACUtility.EmptyItemIndex then
			f111_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			if f111_arg2 == "primaryattachment1" then
				f111_local2 = "MPUI_OPTICS_NOT_AVAILABLE"
			else
				f111_local2 = "MPUI_ATTACHMENTS_NOT_AVAILABLE"
			end
		elseif f111_arg2 == "primaryattachment1" and Engine.GetNumOptics( f111_local5, f111_local4 ) <= 1 then
			f111_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			f111_local2 = "MPUI_OPTICS_NOT_AVAILABLE"
		elseif (f111_arg2 == "primaryattachment2" or f111_arg2 == "primaryattachment3") and f111_local6 <= 1 then
			f111_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			f111_local2 = "MPUI_ATTACHMENTS_NOT_AVAILABLE"
		elseif f111_arg2 == "primaryattachment4" or f111_arg2 == "primaryattachment5" or f111_arg2 == "primaryattachment6" then
			if f111_local6 <= 1 then
				f111_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
				f111_local2 = "MPUI_ATTACHMENTS_NOT_AVAILABLE"
			elseif IsCACPrimaryAttachmentSlotLockedByWildcard( f111_arg0 ) then
				f111_local2 = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_primary_gunfighter", f111_local4 )
				f111_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			else
				local f111_local8 = CoD.CACUtility.PrimaryGunfighterEquippedCount( f111_arg1 )
				if not (f111_arg2 ~= "primaryattachment4" or f111_local8 >= 1) or not (f111_arg2 ~= "primaryattachment5" or f111_local8 >= 2) or f111_arg2 == "primaryattachment6" and f111_local8 < 3 then
					f111_local2 = "MPUI_REQUIRES_PRIMARY_GUNFIGHTER"
					f111_local0 = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
				end
			end
		end
	elseif LUI.startswith( f111_arg2, "secondaryattachment" ) then
		local f111_local5 = CoD.CACUtility.GetItemEquippedInSlot( "secondary", f111_arg0, f111_arg1 )
		local f111_local6 = Engine.GetNumAttachments( f111_local5, f111_local4 )
		if f111_arg2 == "secondaryattachment1" then
			f111_local2 = "MPUI_EQUIP_OPTIC"
		else
			f111_local2 = "MPUI_EQUIP_ATTACHMENT"
		end
		if f111_local5 <= CoD.CACUtility.EmptyItemIndex then
			f111_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			if f111_arg2 == "secondaryattachment1" then
				f111_local2 = "MPUI_OPTICS_NOT_AVAILABLE"
			else
				f111_local2 = "MPUI_ATTACHMENTS_NOT_AVAILABLE"
			end
		elseif f111_arg2 == "secondaryattachment1" and Engine.GetNumOptics( f111_local5, f111_local4 ) <= 1 then
			f111_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			f111_local2 = "MPUI_OPTICS_NOT_AVAILABLE"
		elseif f111_arg2 == "secondaryattachment2" and f111_local6 <= 1 then
			f111_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			f111_local2 = "MPUI_ATTACHMENTS_NOT_AVAILABLE"
		elseif f111_arg2 == "secondaryattachment3" then
			if f111_local6 <= 1 then
				f111_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
				f111_local2 = "MPUI_ATTACHMENTS_NOT_AVAILABLE"
			elseif IsNonAttachmentItemLocked( f111_arg0, "bonuscard_secondary_gunfighter" ) then
				f111_local2 = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_secondary_gunfighter", f111_local4 )
				f111_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_secondary_gunfighter", f111_arg0, f111_arg1 ) == "" then
				f111_local2 = "MPUI_REQUIRES_SECONDARY_GUNFIGHTER"
				f111_local0 = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			end
		end
	elseif LUI.startswith( f111_arg2, "primarygadgetattachment" ) then
		local f111_local5 = CoD.CACUtility.GetItemEquippedInSlot( "primarygadget", f111_arg0, f111_arg1 )
		f111_local3 = CoD.CACUtility.GetItemName( "primarygadget", f111_arg0, f111_arg1 )
		f111_local2 = "MPUI_EQUIP_TAKE_TWO"
		if not f111_local5 or f111_local5 <= CoD.CACUtility.EmptyItemIndex then
			f111_local2 = "MPUI_TAKE_TWO_NOT_AVAILABLE"
			f111_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
		elseif IsNonAttachmentItemLocked( f111_arg0, "bonuscard_danger_close" ) then
			f111_local2 = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_danger_close", f111_local4 )
			f111_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
		elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_danger_close", f111_arg0 ) == "" and CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", f111_arg0 ) == "" then
			f111_local0 = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			f111_local2 = "MPUI_REQUIRES_DANGER_CLOSE"
		end
	elseif LUI.startswith( f111_arg2, "secondarygadgetattachment" ) then
		local f111_local5 = CoD.CACUtility.GetItemEquippedInSlot( "secondarygadget", f111_arg0, f111_arg1 )
		local f111_local6 = CoD.CACUtility.GetItemName( "secondarygadget", f111_arg0, f111_arg1 )
		f111_local2 = "MPUI_EQUIP_TAKE_TWO"
		f111_local3 = f111_local6
		if f111_local5 <= CoD.CACUtility.EmptyItemIndex or not Engine.GadgetHasTakeTwoAttachment( f111_local5, f111_local4 ) then
			f111_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			f111_local2 = "MPUI_TAKE_TWO_NOT_AVAILABLE"
		end
	elseif LUI.startswith( f111_arg2, "bonuscard" ) then
		f111_local2 = "MPUI_EQUIP_WILDCARD"
	elseif LUI.startswith( f111_arg2, "cybercom_tacrig" ) then
		f111_local2 = "MPUI_EQUIP_TACRIG"
	end
	return f111_local0, f111_local1, f111_local2, f111_local3
end

CoD.CACUtility.GetNextAvailablePrimaryGunfighter = function ( f112_arg0 )
	if f112_arg0 then
		for f112_local3, f112_local4 in ipairs( CoD.CACUtility.PrimaryGunfighterWildcards ) do
			if not CoD.CACUtility.IsBonusCardEquipped( f112_local4, f112_arg0 ) then
				return f112_local4
			end
		end
	end
	return ""
end

CoD.CACUtility.WildcardNeededForSlot = function ( f113_arg0, f113_arg1 )
	local f113_local0 = CoD.perController[f113_arg0].classModel
	local f113_local1 = nil
	local f113_local2 = false
	local f113_local3 = true
	if f113_arg1 == "specialty4" then
		f113_local1 = "bonuscard_perk_1_greed"
		f113_local2 = true
		f113_local3 = IsNonAttachmentItemLocked( f113_arg0, f113_local1 )
	elseif f113_arg1 == "specialty5" then
		f113_local1 = "bonuscard_perk_2_greed"
		f113_local2 = true
		f113_local3 = IsNonAttachmentItemLocked( f113_arg0, f113_local1 )
	elseif f113_arg1 == "specialty6" then
		f113_local1 = "bonuscard_perk_3_greed"
		f113_local2 = true
		f113_local3 = IsNonAttachmentItemLocked( f113_arg0, f113_local1 )
	elseif f113_arg1 == "primaryattachment4" or f113_arg1 == "primaryattachment5" or f113_arg1 == "primaryattachment6" then
		f113_local1 = CoD.CACUtility.GetNextAvailablePrimaryGunfighter( f113_local0 )
		f113_local2 = CoD.CACUtility.ItemEquippedInSlot( "primary", f113_arg0, f113_local0 )
		f113_local3 = IsNonAttachmentItemLocked( f113_arg0, f113_local1 )
	elseif f113_arg1 == "secondaryattachment3" then
		local f113_local4 = Engine.GetNumAttachments( CoD.CACUtility.GetItemEquippedInSlot( "secondary", f113_arg0, f113_local0 ) )
		f113_local1 = "bonuscard_secondary_gunfighter"
		if f113_local4 > 1 then
			f113_local2 = CoD.CACUtility.ItemEquippedInSlot( "secondary", f113_arg0, f113_local0 )
		else
			f113_local2 = false
		end
		f113_local3 = IsNonAttachmentItemLocked( f113_arg0, f113_local1 )
	elseif f113_arg1 == "primarygadgetattachment1" then
		f113_local1 = "bonuscard_danger_close"
		f113_local2 = CoD.CACUtility.ItemEquippedInSlot( "primarygadget", f113_arg0, f113_local0 )
		f113_local3 = IsNonAttachmentItemLocked( f113_arg0, f113_local1 )
	end
	return f113_local1, f113_local2, f113_local3
end

CoD.CACUtility.UpdateGrenadeNames = function ( f114_arg0, f114_arg1, f114_arg2 )
	local f114_local0 = function ( f115_arg0 )
		local f115_local0 = Engine.CreateModel( f114_arg2, f115_arg0 .. ".modifiedName" )
		if CoD.CACUtility.ItemEquippedInSlot( f115_arg0, f114_arg0, f114_arg2 ) then
			local f115_local1 = Engine.GetModel( f114_arg2, f115_arg0 .. ".name" )
			if f115_local1 and f115_local0 then
				local f115_local2 = Engine.GetModelValue( f115_local1 )
				if CoD.CACUtility.ItemEquippedInSlot( f115_arg0 .. "attachment1", f114_arg0, f114_arg2 ) then
					f115_local2 = Engine.Localize( "MPUI_X2_GRENADE", f115_local2 )
				end
				Engine.SetModelValue( f115_local0, f115_local2 )
			end
		else
			Engine.SetModelValue( f115_local0, "" )
		end
	end
	
	f114_local0( "primarygadget" )
	f114_local0( "secondarygadget" )
end

CoD.CACUtility.UpdateEmptySlotImages = function ( f116_arg0, f116_arg1, f116_arg2 )
	local f116_local0 = Engine.GetCustomClass( f116_arg0, f116_arg1, CoD.PrestigeUtility.GetPermanentUnlockMode() )
	local f116_local1 = CoD.CACUtility.IsBonusCardEquippedByName( f116_local0, "bonuscard_overkill" )
	local f116_local2 = CoD.CACUtility.IsBonusCardEquippedByName( f116_local0, "bonuscard_two_tacticals" )
	for f116_local7, f116_local6 in pairs( CoD.CACUtility.emptyImageSlotList ) do
		local f116_local8 = Engine.GetModel( f116_arg2, f116_local7 )
		if f116_local8 then
			if f116_local7 == "secondary" and f116_local1 == true then
				f116_local6 = CoD.CACUtility.emptyImageSlotList.primary
			elseif LUI.startswith( f116_local7, "primarygadget" ) and f116_local2 == true then
				f116_local6 = CoD.CACUtility.emptyImageSlotList.secondarygadget
			end
			Engine.SetModelValue( Engine.CreateModel( f116_local8, "emptyImage" ), f116_local6 )
		end
	end
end

CoD.CACUtility.GetCustomClassModel = function ( f117_arg0, f117_arg1, f117_arg2, f117_arg3 )
	Engine.GetCustomClassModel( f117_arg0, f117_arg1, f117_arg2, CoD.PrestigeUtility.GetPermanentUnlockMode(), f117_arg3 )
	Engine.SetModelValue( Engine.CreateModel( f117_arg2, "classNum" ), f117_arg1 )
	if CoD.perController[f117_arg0].isPreset == true then
		local f117_local0 = Engine.GetModel( f117_arg2, "customClassName" )
		Engine.SetModelValue( f117_local0, Engine.Localize( Engine.GetModelValue( f117_local0 ) ) )
	end
	if IsCampaign() and f117_arg1 >= 5 and f117_arg1 <= 8 then
		Engine.SetModelValue( Engine.GetModel( f117_arg2, "customClassName" ), Engine.Localize( "CPUI_FIELD_OPS_KIT" ) )
	end
	if f117_arg1 >= 10 then
		Engine.SetModelValue( Engine.CreateModel( f117_arg2, "defaultClassName" ), Engine.GetDefaultClassName( f117_arg1 - 10 ) )
	end
	CoD.CACUtility.UpdateHeaderNames( f117_arg0, f117_arg1, f117_arg2, f117_arg3 )
	local f117_local0 = function ( f118_arg0 )
		local f118_local0 = Engine.GetModel( f117_arg2, f118_arg0 .. "gunsmithvariant" )
		if f118_local0 then
			local f118_local1 = Engine.CreateModel( f117_arg2, f118_arg0 .. ".variantName" )
			local f118_local2 = Engine.GetModelValue( Engine.GetModel( f118_local0, "itemIndex" ) )
			if f118_local2 > CoD.CACUtility.EmptyItemIndex then
				local f118_local3 = CoD.CraftUtility.Gunsmith.GetVariantIndexFromCACVaraintIndex( f117_arg0, f118_local2 )
				if f118_local3 then
					Engine.SetModelValue( f118_local1, f118_local3.variantName )
				end
			else
				Engine.SetModelValue( f118_local1, "" )
			end
		end
	end
	
	if not Engine.IsInGame() then
		f117_local0( "primary" )
		f117_local0( "secondary" )
	end
	local f117_local1 = function ( f119_arg0 )
		local f119_local0 = Engine.GetModel( f117_arg2, f119_arg0 )
		if not f119_local0 then
			return 
		end
		local f119_local1 = Engine.GetModel( f119_local0, "image" )
		if f119_local1 then
			local f119_local2 = Engine.GetModelValue( f119_local1 )
			if f119_local2 and f119_local2 ~= CoD.CACUtility.DefaultLoadoutImage then
				Engine.SetModelValue( f119_local1, f119_local2 )
			end
		end
	end
	
	f117_local1( "primary" )
	f117_local1( "secondary" )
	local f117_local2 = function ( f120_arg0, f120_arg1, f120_arg2 )
		for f120_local4, f120_local5 in ipairs( f120_arg1 ) do
			local f120_local6 = Engine.GetModelValue( Engine.GetModel( f117_arg2, f120_local5 .. ".itemIndex" ) )
			if f120_local6 > CoD.CACUtility.EmptyItemIndex and Engine.GetModelValue( Engine.GetModel( f117_arg2, f120_arg2[f120_local4] .. ".itemIndex" ) ) > CoD.CACUtility.EmptyItemIndex then
				local f120_local3 = Engine.GetAttachmentCosmeticVariant( Engine.GetWeaponString( f117_arg0, f117_arg1, f120_arg0 ), Engine.GetItemAttachment( Engine.GetModelValue( Engine.GetModel( f117_arg2, f120_arg0 .. ".itemIndex" ) ), f120_local6 ) )
				if f120_local3 then
					Engine.SetModelValue( Engine.GetModel( f117_arg2, f120_local5 .. ".image" ), f120_local3.image )
					Engine.SetModelValue( Engine.GetModel( f117_arg2, f120_local5 .. "cosmeticvariant.image" ), f120_local3.image )
					Engine.SetModelValue( Engine.GetModel( f117_arg2, f120_local5 .. "cosmeticvariant.name" ), f120_local3.name )
				end
			end
		end
	end
	
	f117_local2( "primary", CoD.CACUtility.PrimaryAttachmentSlotNameList, CoD.CACUtility.PrimaryAttachmentCVSlotNameList )
	f117_local2( "secondary", CoD.CACUtility.SecondaryAttachmentSlotNameList, CoD.CACUtility.SecondaryAttachmentCVSlotNameList )
	CoD.CACUtility.AddBigImagesToCustomClassModel( f117_arg0, f117_arg2, "primary", "_big" )
	CoD.CACUtility.AddBigImagesToCustomClassModel( f117_arg0, f117_arg2, "secondary", "_big" )
	CoD.CACUtility.AddBigImagesToCustomClassModel( f117_arg0, f117_arg2, "primarygadget", "_256" )
	CoD.CACUtility.AddBigImagesToCustomClassModel( f117_arg0, f117_arg2, "secondarygadget", "_256" )
	CoD.CACUtility.AddBigImagesToCustomClassModel( f117_arg0, f117_arg2, "specialgadget", "_256" )
	DataSources.CustomClassMenu.updateWeaponAttachmentList( f117_arg0, f117_arg2, "primary", CoD.CACUtility.maxPrimaryAttachments )
	DataSources.CustomClassMenu.updateWeaponAttachmentList( f117_arg0, f117_arg2, "secondary", CoD.CACUtility.maxSecondaryAttachments )
	DataSources.CustomClassMenu.updateCustomSlotModel( f117_arg2, "primarygadget", f117_arg0 )
	DataSources.CustomClassMenu.updateCustomSlotModel( f117_arg2, "secondarygadget", f117_arg0 )
	CoD.CACUtility.UpdateGrenadeNames( f117_arg0, f117_arg1, f117_arg2 )
	CoD.CACUtility.UpdateEmptySlotImages( f117_arg0, f117_arg1, f117_arg2 )
	for f117_local11, f117_local12 in ipairs( CoD.CACUtility.loadoutSlotOrder ) do
		local f117_local13 = Engine.GetModel( f117_arg2, f117_local12 )
		if f117_local13 then
			local f117_local6 = Engine.CreateModel( f117_local13, "hintText" )
			if f117_local6 then
				local f117_local7, f117_local8, f117_local9, f117_local10 = CoD.CACUtility.GetCACSlotStatus( f117_arg0, f117_arg2, f117_local12 )
				if not f117_local9 or f117_local9 == "" then
					Engine.SetModelValue( f117_local6, "" )
				end
				if f117_local10 ~= nil then
					Engine.SetModelValue( f117_local6, Engine.Localize( f117_local9, f117_local10 ) )
				else
					Engine.SetModelValue( f117_local6, Engine.Localize( f117_local9 ) )
				end
			end
		end
	end
	Engine.SetModelValue( Engine.CreateModel( f117_arg2, "disabled" ), CoD.BlackMarketUtility.ClassContainsLockedItems( f117_arg0, f117_arg2 ) )
end

CoD.CACUtility.UpdateWeaponOptions = function ( f121_arg0, f121_arg1 )
	local f121_local0 = CoD.perController[f121_arg0].weaponCategory
	local f121_local1 = Engine.GetModelForController( f121_arg0 )
	local f121_local2 = function ( f122_arg0, f122_arg1, f122_arg2 )
		local f122_local0 = Engine.GetModelForController( f122_arg0 )
		for f122_local1 = 0, #CoD.CACUtility.weaponOptionGroupNames - 1, 1 do
			local f122_local4 = CoD.CACUtility.weaponOptionGroupNames[f122_local1]
			local f122_local5 = f122_arg2 .. f122_local4
			local f122_local6 = Engine.GetModel( f122_arg1, f122_local5 .. ".itemIndex" )
			if f122_local6 then
				local f122_local7 = Engine.GetModel( f122_local0, "WeaponOptions." .. f122_local4 .. "." .. Engine.GetModelValue( f122_local6 ) )
				if f122_local7 then
					local f122_local8 = Engine.GetModel( f122_arg1, f122_local5 .. ".name" )
					local f122_local9 = Engine.GetModel( f122_arg1, f122_local5 .. ".image" )
					if f122_local8 and f122_local9 then
						Engine.SetModelValue( f122_local8, Engine.GetModelValue( Engine.GetModel( f122_local7, "name" ) ) )
						Engine.SetModelValue( f122_local9, Engine.GetModelValue( Engine.GetModel( f122_local7, "image" ) ) )
					end
				end
			end
		end
	end
	
	f121_local2( f121_arg0, f121_arg1, "primary" )
	f121_local2( f121_arg0, f121_arg1, "secondary" )
	CoD.CACUtility.UpdateWeaponCustomizationCategoryList( f121_arg0, f121_arg1 )
end

CoD.CACUtility.UpdateAttachmentCosmeticVariants = function ( f123_arg0, f123_arg1 )
	local f123_local0 = function ( f124_arg0, f124_arg1 )
		for f124_local15, f124_local16 in pairs( f124_arg1 ) do
			local f124_local17 = f124_local16 .. "cosmeticvariant"
			local f124_local18 = Engine.GetModel( f124_arg0, f124_local16 )
			local f124_local19 = Engine.GetModel( f124_arg0, f124_local17 )
			if f124_local19 and f124_local18 then
				local f124_local3 = Engine.GetModel( f124_local19, "itemIndex" )
				local f124_local4 = Engine.GetModel( f124_local18, "itemIndex" )
				if f124_local3 and f124_local4 then
					local f124_local5 = Engine.GetModelValue( f124_local3 )
					if f124_local5 > 0 and Engine.GetModelValue( f124_local4 ) > 0 then
						local f124_local6 = Engine.GetModel( f124_local19, "name" )
						local f124_local7 = Engine.GetModel( f124_local19, "image" )
						local f124_local8 = Engine.GetModel( f124_local19, "ref" )
						local f124_local9 = Engine.GetModel( f124_local18, "ref" )
						if f124_local6 and f124_local7 and f124_local8 and f124_local9 then
							local f124_local10 = Engine.GetModelValue( f124_local9 )
							if CoD.WC_Category.ACV.attachmentTable[f124_local10] then
								local f124_local11 = CoD.WC_Category.ACV.attachmentTable[f124_local10].variants[f124_local5]
								local f124_local12 = Engine.SetModelValue
								local f124_local13 = f124_local6
								local f124_local14
								if f124_local11 then
									f124_local14 = f124_local11.name
									if not f124_local14 then
									
									else
										f124_local12( f124_local13, f124_local14 )
										f124_local12 = Engine.SetModelValue
										f124_local13 = f124_local7
										if f124_local11 then
											f124_local14 = f124_local11.image
											if not f124_local14 then
											
											else
												f124_local12( f124_local13, f124_local14 )
												Engine.SetModelValue( f124_local8, f124_local10 )
											end
										end
										f124_local14 = ""
									end
								end
								f124_local14 = ""
							end
						end
					end
				end
			end
		end
	end
	
	f123_local0( f123_arg1, CoD.CACUtility.PrimaryAttachmentSlotNameList )
	f123_local0( f123_arg1, CoD.CACUtility.SecondaryAttachmentSlotNameList )
end

CoD.CACUtility.UpdateWeaponCustomizationCategoryList = function ( f125_arg0, f125_arg1 )
	local f125_local0 = Engine.GetModelForController( f125_arg0 )
	local f125_local1 = CoD.perController[f125_arg0].weaponCategory
	local f125_local2 = Engine.GetModel( f125_local0, "WeaponCustomizationCategory" )
	if f125_local2 then
		for f125_local3 = 1, CoD.CACUtility.maxWeaponCustomizationCategories, 1 do
			local f125_local6 = Engine.GetModel( f125_local2, f125_local3 )
			if f125_local6 then
				local f125_local7 = Engine.GetModel( f125_local6, "type" )
				if f125_local7 then
					local f125_local8 = Engine.GetModelValue( f125_local7 )
					if f125_local8 == "paintjob" then
						local f125_local9 = Engine.GetModelValue( Engine.GetModel( f125_arg1, f125_local1 .. "paintjobindex.itemIndex" ) )
						Engine.SetModelValue( Engine.GetModel( f125_local6, "paintjobIndex" ), f125_local9 )
						local f125_local10 = Engine.GetModelValue( Engine.GetModel( f125_arg1, f125_local1 .. "paintjobslot.itemIndex" ) )
						Engine.SetModelValue( Engine.GetModel( f125_local6, "paintjobSlot" ), f125_local10 )
						Engine.SetModelValue( Engine.GetModel( f125_local6, "paintjobSlotAndIndex" ), f125_local10 .. " " .. f125_local9 )
					end
					local f125_local11 = Engine.GetModel( f125_arg1, f125_local1 .. f125_local8 )
					if f125_local11 then
						local f125_local9 = Engine.GetModelValue( Engine.GetModel( f125_local11, "name" ) )
						local f125_local12 = Engine.GetModelValue( Engine.GetModel( f125_local11, "image" ) )
						Engine.SetModelValue( Engine.GetModel( f125_local6, "name" ), f125_local9 )
						Engine.SetModelValue( Engine.GetModel( f125_local6, "image" ), f125_local12 )
					end
				end
			end
		end
	end
end

CoD.CACUtility.UpdateAllClasses = function ( f126_arg0 )
	local f126_local0 = Engine.GetCustomClassCount( f126_arg0 )
	local f126_local1 = Engine.GetModel( Engine.GetModelForController( f126_arg0 ), "CustomClassList" )
	for f126_local2 = 1, f126_local0, 1 do
		CoD.CACUtility.GetCustomClassModel( f126_arg0, f126_local2 - 1, Engine.GetModel( f126_local1, "class" .. f126_local2 ) )
	end
end

CoD.CACUtility.GetWeaponOptionsFromClass = function ( f127_arg0, f127_arg1, f127_arg2 )
	if not f127_arg1 then
		f127_arg1 = CoD.perController[f127_arg0].classModel
	end
	local f127_local0 = Engine.GetModel( f127_arg1, f127_arg2 .. "camo.itemIndex" )
	local f127_local1 = Engine.GetModel( f127_arg1, f127_arg2 .. "reticle.itemIndex" )
	local f127_local2 = Engine.GetModel( f127_arg1, f127_arg2 .. "paintjobslot.itemIndex" )
	local f127_local3 = Engine.GetModel( f127_arg1, f127_arg2 .. "paintjobindex.itemIndex" )
	local f127_local4 = "0"
	local f127_local5 = "0"
	if f127_local0 then
		f127_local4 = Engine.GetModelValue( f127_local0 )
	end
	if f127_local1 then
		f127_local5 = Engine.GetModelValue( f127_local1 )
	end
	if IsLive() then
		if f127_local2 and f127_local3 then
			Engine.SetupPaintjobData( f127_arg0, Engine.GetModelValue( f127_local2 ), Engine.GetModelValue( f127_local3 ) )
		end
	else
		Engine.ClearPaintjobLayerData()
	end
	return f127_local4 .. "," .. f127_local5 .. ",1"
end

CoD.CACUtility.EmptyWeaponOptions = function ()
	return "0" .. "," .. "0" .. ",0"
end

CoD.CACUtility.GetAttachmentCosmeticVariantsFromClass = function ( f129_arg0, f129_arg1, f129_arg2 )
	if not f129_arg1 then
		f129_arg1 = CoD.perController[f129_arg0].classModel
	end
	local f129_local0 = ""
	local f129_local1 = CoD.CACUtility.GetAttachmentVariantForAttachmentList( f129_arg1, f129_arg2 )
	for f129_local2 = 1, #f129_local1, 1 do
		f129_local0 = f129_local0 .. f129_local1[f129_local2].ref .. "," .. f129_local1[f129_local2].attachmentIndex .. ","
	end
	return f129_local0
end

CoD.CACUtility.GetACVariantsFromClassExcludeAttachment = function ( f130_arg0, f130_arg1, f130_arg2, f130_arg3 )
	if not f130_arg1 then
		f130_arg1 = CoD.perController[f130_arg0].classModel
	end
	local f130_local0 = ""
	local f130_local1 = CoD.CACUtility.GetAttachmentVariantForAttachmentList( f130_arg1, f130_arg2 )
	for f130_local2 = 1, #f130_local1, 1 do
		if f130_local1[f130_local2].ref ~= f130_arg3 then
			f130_local0 = f130_local0 .. f130_local1[f130_local2].ref .. "," .. f130_local1[f130_local2].attachmentIndex .. ","
		end
	end
	return f130_local0
end

CoD.CACUtility.GetWeaponOptionsFromVariantInfo = function ( f131_arg0, f131_arg1 )
	local f131_local0 = "0"
	local f131_local1 = "0"
	if f131_arg1.camoIndex then
		f131_local0 = f131_arg1.camoIndex
	end
	if f131_arg1.reticleIndex then
		f131_local1 = f131_arg1.reticleIndex
	end
	if f131_arg1.paintjobSlot and f131_arg1.paintjobIndex then
		Engine.SetupPaintjobData( f131_arg0, f131_arg1.paintjobSlot, f131_arg1.paintjobIndex )
	end
	return f131_local0 .. "," .. f131_local1 .. ",1"
end

CoD.CACUtility.GetAttachmentCosmeticVariantsFromVariantInfo = function ( f132_arg0 )
	local f132_local0 = ""
	for f132_local4, f132_local5 in ipairs( f132_arg0.attachmentVariant ) do
		local f132_local6 = f132_arg0.attachment[f132_local4]
		if f132_local6 > CoD.CACUtility.EmptyItemIndex then
			f132_local0 = f132_local0 .. Engine.GetAttachmentRefByIndex( f132_local6 ) .. "," .. f132_local5 .. ","
		end
	end
	return f132_local0
end

CoD.CACUtility.GetBaseWeaponLoadoutSlotName = function ( f133_arg0 )
	local f133_local0 = nil
	if f133_arg0 == "primary" or f133_arg0 == "secondary" or f133_arg0 == "primarygadget" or f133_arg0 == "secondarygadget" or f133_arg0 == "cybercore" or LUI.startswith( f133_arg0, "specialty" ) or LUI.startswith( f133_arg0, "bonuscard" ) then
		f133_local0 = f133_arg0
	elseif LUI.startswith( f133_arg0, "primaryattachment" ) then
		f133_local0 = "primary"
	elseif LUI.startswith( f133_arg0, "secondaryattachment" ) then
		f133_local0 = "secondary"
	elseif LUI.startswith( f133_arg0, "primarygadgetattachment" ) then
		f133_local0 = "primarygadget"
	elseif LUI.startswith( f133_arg0, "secondarygadgetattachment" ) then
		f133_local0 = "secondarygadget"
	elseif LUI.startswith( f133_arg0, "cybercom_" ) then
		f133_local0 = "cybercom"
	end
	return f133_local0
end

CoD.CACUtility.GetGunLevelWeaponIndex = function ( f134_arg0, f134_arg1 )
	local f134_local0 = CoD.perController[f134_arg0].classModel
	local f134_local1 = CoD.perController[f134_arg0].weaponSlot
	local f134_local2 = CoD.perController[f134_arg0].weaponCategory
	local f134_local3 = f134_arg1 and f134_arg1:getModel( f134_arg0, "weaponSlot" )
	if f134_local3 then
		f134_local2 = Engine.GetModelValue( f134_local3 )
	end
	if f134_local2 and (LUI.startswith( f134_local2, "primaryattachment" ) or LUI.startswith( f134_local2, "secondaryattachment" )) and f134_local1 then
		local f134_local4 = Engine.GetModel( f134_local0, f134_local1 .. ".itemIndex" )
		if f134_local4 then
			return Engine.GetModelValue( f134_local4 )
		end
	end
	if f134_arg1 then
		local f134_local4 = f134_arg1:getModel( f134_arg0, "itemIndex" )
		if f134_local4 then
			return Engine.GetModelValue( f134_local4 )
		end
		local f134_local5 = f134_arg1:getModel( f134_arg0, "weaponIndex" )
		if f134_local5 then
			return Engine.GetModelValue( f134_local5 )
		end
	end
	return CoD.CACUtility.EmptyItemIndex
end

CoD.CACUtility.AttachmentEquippedInCACSlot = function ( f135_arg0, f135_arg1, f135_arg2 )
	local f135_local0 = CoD.perController[f135_arg0].classModel
	local f135_local1 = CoD.CACUtility.PrimaryAttachmentSlotNameList
	if f135_arg1 == "secondary" then
		f135_local1 = CoD.CACUtility.SecondaryAttachmentSlotNameList
	end
	for f135_local5, f135_local6 in ipairs( f135_local1 ) do
		if Engine.GetModelValue( Engine.GetModel( f135_local0, f135_local6 .. ".itemIndex" ) ) == f135_arg2 then
			return f135_local5
		end
	end
end

CoD.CACUtility.ValidateWeaponVariantForClass = function ( f136_arg0, f136_arg1 )
	local f136_local0 = CoD.perController[f136_arg0].classNum
	local f136_local1 = function ( f137_arg0, f137_arg1 )
		local f137_local0 = Engine.GetModelValue( Engine.GetModel( f136_arg1, f137_arg0 .. "gunsmithvariant.itemIndex" ) )
		if f137_local0 ~= nil and f137_local0 > CoD.CACUtility.EmptyItemIndex then
			local f137_local1 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f136_arg0, f137_local0 - 1 )
			local f137_local2 = false
			if Engine.GetModelValue( Engine.GetModel( f136_arg1, f137_arg0 .. ".itemIndex" ) ) == f137_local1.weaponIndex then
				for f137_local12, f137_local13 in ipairs( f137_local1.attachment ) do
					local f137_local9 = false
					local f137_local14 = Engine.GetAttachmentIndexByAttachmentTableIndex( f137_local1.weaponIndex, f137_local13 )
					if f137_local14 > CoD.CACUtility.EmptyItemIndex then
						for f137_local10, f137_local11 in ipairs( f137_arg1 ) do
							if f137_local14 == Engine.GetModelValue( Engine.GetModel( f136_arg1, f137_local11 .. ".itemIndex" ) ) then
								f137_local9 = true
								break
							end
						end
						if not f137_local9 then
							f137_local2 = true
						end
					end
				end
			end
			if f137_local2 then
				CoD.SetClassItem( f136_arg0, f136_local0, f137_arg0 .. "gunsmithvariant", CoD.CACUtility.EmptyItemIndex )
			end
		end
	end
	
	f136_local1( "primary", CoD.CACUtility.PrimaryAttachmentSlotNameList )
	f136_local1( "secondary", CoD.CACUtility.SecondaryAttachmentSlotNameList )
end

CoD.CACUtility.CreateUnlockTokenModels = function ( f138_arg0 )
	if not CoD.CACUtility.unlockTokenModel[f138_arg0] then
		CoD.CACUtility.unlockTokenModel[f138_arg0] = Engine.CreateModel( Engine.GetModelForController( f138_arg0 ), "UnlockTokenInfo" )
		Engine.CreateModel( CoD.CACUtility.unlockTokenModel[f138_arg0], "itemIndex" )
		local f138_local0 = Engine.CreateModel( CoD.CACUtility.unlockTokenModel[f138_arg0], "xpBarInfo" )
		Engine.CreateModel( f138_local0, "rankXP" )
		Engine.CreateModel( f138_local0, "xpEarned" )
		Engine.CreateModel( f138_local0, "xpNeeded" )
		Engine.CreateModel( f138_local0, "currLevel" )
		Engine.CreateModel( f138_local0, "currLevelIcon" )
		Engine.CreateModel( f138_local0, "nextLevel" )
		Engine.CreateModel( f138_local0, "nextLevelIcon" )
	end
	local f138_local0 = Engine.GetModel( Engine.GetModelForController( f138_arg0 ), "unlockTokensCount" )
	local f138_local1 = "weapon_smg"
	local f138_local2 = CoD.CCUtility.customizationMode
	if not f138_local2 then
		f138_local2 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	end
	Engine.SetModelValue( f138_local0, Engine.GetCurrentTokens( f138_arg0, f138_local1, f138_local2 ) )
end

CoD.CACUtility.GetPerkXModel = function ( f139_arg0, f139_arg1 )
	return "p7_perk_" .. Engine.GetItemImage( f139_arg0, f139_arg1 )
end

CoD.CACUtility.GetBonuscardXModel = function ( f140_arg0, f140_arg1 )
	return "p7_" .. Engine.GetItemRef( f140_arg0, f140_arg1 )
end

CoD.CACUtility.GetCybercoreXModel = function ( f141_arg0, f141_arg1 )
	return "p7_core_" .. Engine.GetItemImage( f141_arg0, f141_arg1 )
end

CoD.CACUtility.WeaponSelectFocusOnLastSelectedWeapon = function ( f142_arg0, f142_arg1 )
	local f142_local0 = DataSources.Unlockables:getCurrentFilterItem()
	if f142_arg0.weaponList.activeWidget then
		local f142_local1 = f142_arg0.weaponList.activeWidget.gridInfoTable.zeroBasedIndex + 1
		if f142_arg0.lastSelectionTable and f142_arg0.lastSelectionTable[f142_local0] then
			f142_arg0.lastSelectionTable[f142_local0] = f142_local1
		end
	end
end

CoD.CACUtility.WeaponSelectFocusOnLastSelectedCategory = function ( f143_arg0, f143_arg1, f143_arg2 )
	if not f143_arg1 then
		return 
	end
	local f143_local0 = f143_arg1.filter
	if not f143_local0 then
		f143_local0 = DataSources.Unlockables:getCurrentFilterItem()
	end
	DataSources.Unlockables.setCurrentFilterItem( f143_local0 )
	f143_arg0.weaponList:updateDataSource( true )
	if not f143_arg0.performingSetup then
		local f143_local1 = 1
		if f143_arg0.lastSelectionTable and f143_arg0.lastSelectionTable[f143_local0] then
			f143_local1 = f143_arg0.lastSelectionTable[f143_local0]
		end
		local f143_local2 = f143_arg0.weaponList:getItemAt( f143_local1 )
		if f143_local2 then
			f143_arg0.weaponList:setActiveItem( f143_local2, 0, true, true )
		end
	end
end

CoD.CACUtility.SetCACMenuHeroInfoModels = function ( f144_arg0 )
	local f144_local0 = Engine.CurrentSessionMode()
	local f144_local1 = Engine.GetEquippedHero( f144_arg0, f144_local0 )
	local f144_local2 = Engine.GetEquippedHeroInfo( f144_arg0, f144_local0 )
	if f144_local2 and f144_local1 then
		local f144_local3 = Engine.GetLoadoutTypeForHero( f144_arg0, f144_local1 )
		if f144_local3 then
			local f144_local4 = Engine.GetModel( Engine.GetModelForController( f144_arg0 ), "CACMenu" )
			if f144_local4 then
				local f144_local5 = f144_local2.defaultHeroRender
				if f144_local3 == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET then
					f144_local5 = f144_local2.defaultHeroRenderAbility
				end
				Engine.SetModelValue( Engine.GetModel( f144_local4, "currentHeroImage" ), f144_local5 )
				Engine.SetModelValue( Engine.GetModel( f144_local4, "currentHeroName" ), f144_local2.displayName )
			end
			local f144_local5 = Engine.GetLoadoutInfoForHero( f144_local0, f144_local1, f144_local3 )
			if f144_local5 then
				Engine.SetModelValue( Engine.GetModel( f144_local4, "currentHeroLoadout" ), Engine.Localize( f144_local5.itemName ) )
			end
		end
	end
end

CoD.CACUtility.UpgradeEquippedCACItems = function ( f145_arg0, f145_arg1, f145_arg2, f145_arg3 )
	local f145_local0 = Engine.GetModel( Engine.GetModelForController( f145_arg0 ), "CustomClassList" )
	for f145_local1 = 1, Engine.GetCustomClassCount( f145_arg0 ), 1 do
		local f145_local4 = f145_local1 - 1
		local f145_local5 = Engine.GetModel( f145_local0, "class" .. f145_local1 )
		local f145_local6 = CoD.CACUtility.GetMutuallyExclusiveSlotName( f145_arg1, f145_arg0, f145_arg2, f145_local5 )
		local f145_local7 = function ( f146_arg0 )
			if f146_arg0 ~= nil then
				local f146_local0 = Engine.GetModel( f145_local5, f146_arg0 )
				if f146_local0 then
					local f146_local1 = Engine.GetModel( f146_local0, "itemIndex" )
					if f146_local1 and Engine.GetModelValue( f146_local1 ) == f145_arg2 then
						CoD.SetClassItem( f145_arg0, f145_local4, f146_arg0, f145_arg3 )
					end
				end
			end
		end
		
		f145_local7( f145_arg1 )
		for f145_local8 = 1, #f145_local6, 1 do
			local f145_local11 = f145_local6[f145_local8]
			if f145_local11 and f145_local11 ~= "" then
				f145_local7( f145_local11 )
			end
		end
	end
end

CoD.CACUtility.GetAllItems = function ( f147_arg0, f147_arg1 )
	if f147_arg0 ~= true and CoD.CACUtility.Items then
		return unpack( CoD.CACUtility.Items )
	end
	local f147_local0 = Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER )
	local f147_local1, f147_local2 = nil
	for f147_local8, f147_local9 in ipairs( f147_local0 ) do
		if CoDShared.IsLootHero( f147_local9 ) then
			local f147_local6 = Engine.GetLoadoutInfoForHero( Enum.eModes.MODE_MULTIPLAYER, f147_local9.bodyIndex, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
			if f147_local6 then
			
			else
				local f147_local7 = Engine.GetLoadoutInfoForHero( Enum.eModes.MODE_MULTIPLAYER, f147_local9.bodyIndex, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET )
				if f147_local7 then
					f147_local2 = f147_local7.itemIndex
					break
				end
			end
			f147_local1 = f147_local6.itemIndex
		end
	end
	f147_local3 = {}
	for f147_local4 = 0, 43, 1 do
		local f147_local6 = Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_NONE
		if Engine.IsAttachmentRestrictedForAllWeapons( f147_local4 ) == true then
			f147_local6 = Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_RESTRICTED
		end
		f147_local3[f147_local4] = {
			index = f147_local4,
			desc = Engine.GetAttachmentDescByAttachmentIndex( f147_local4 ),
			name = Engine.GetAttachmentNameByIndex( f147_local4 ),
			image = Engine.GetAttachmentImageByIndex( f147_local4 ),
			isOptic = Engine.IsOpticByAttachmentIndex( f147_local4 ),
			restrictionState = f147_local6,
			items = {}
		}
	end
	f147_local4 = {}
	f147_local5 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	for f147_local8 = 0, 255, 1 do
		local f147_local10 = CoD.statsTable
		if f147_local10 then
			f147_local10 = CoD.CACUtility.GetIdForItemRef( f147_local8 )
		end
		if f147_local8 ~= f147_local1 and f147_local8 ~= f147_local2 and Engine.ItemIndexValid( f147_local8, f147_local5 ) and not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( f147_local10 ) then
			local f147_local11 = Engine.GetUnlockableInfoByIndex( f147_local8, f147_local5 )
			if f147_local11.allocation >= 0 then
				local f147_local12 = {
					index = f147_local8,
					name = f147_local11.name,
					image = f147_local11.image,
					groupIndex = f147_local11.groupIndex,
					groupName = f147_local11.group,
					loadoutSlot = f147_local11.loadoutSlot,
					loadoutSlotIndex = f147_local11.loadoutSlotIndex,
					unlockLevel = f147_local11.unlockLevel,
					momentum = f147_local11.momentum,
					restrictionState = f147_local11.restrictionState,
					allocation = f147_local11.allocation
				}
				if LuaUtils.StartsWith( f147_local12.loadoutSlot, "hero" ) or f147_local12.loadoutSlot == "specialgadget" then
					f147_local12.image = f147_local11.image
				end
				if LuaUtils.StartsWith( f147_local12.loadoutSlot, "killstreak" ) then
					f147_local12.image = f147_local11.image .. "_menu"
				end
				if f147_local12.loadoutSlot == "primary" or f147_local12.loadoutSlot == "secondary" then
					local f147_local13 = Engine.GetNumAttachments( f147_local8 )
					if f147_local13 > 0 then
						f147_local12.attachments = {}
						for f147_local14 = 0, f147_local13 - 1, 1 do
							local f147_local17 = Engine.GetItemAttachment( f147_local8, f147_local14 )
							if f147_local17 > CoD.CACUtility.EmptyItemIndex then
								f147_local12.attachments[f147_local17] = {
									attachmentIndex = f147_local17,
									restrictionState = Engine.GetAttachmentRestrictionState( f147_local17, f147_local8, false )
								}
								table.insert( f147_local3[f147_local17].items, {
									itemIndex = f147_local8
								} )
							end
						end
					end
				end
				f147_local4[f147_local8] = f147_local12
			end
		end
	end
	if f147_arg1 == true then
		f147_local8 = function ( f148_arg0, f148_arg1 )
			if f147_local3[f148_arg0].isOptic and f147_local3[f148_arg1].isOptic then
				return Engine.Localize( f147_local3[f148_arg0].name ) < Engine.Localize( f147_local3[f148_arg1].name )
			elseif f147_local3[f148_arg0].isOptic or f147_local3[f148_arg1].isOptic then
				return f147_local3[f148_arg0].isOptic
			else
				return Engine.Localize( f147_local3[f148_arg0].name ) < Engine.Localize( f147_local3[f148_arg1].name )
			end
		end
		
		f147_local9 = {}
		local f147_local6 = 1
		for f147_local12, f147_local13 in LUI.IterateTableBySortedKeys( f147_local3, f147_local8, nil ) do
			f147_local9[f147_local6] = f147_local13
			f147_local6 = f147_local6 + 1
		end
		f147_local7 = function ( f149_arg0, f149_arg1 )
			if LuaUtils.StartsWith( f147_local4[f149_arg0].loadoutSlot, "hero" ) or f147_local4[f149_arg0].loadoutSlot == "specialgadget" or LuaUtils.StartsWith( f147_local4[f149_arg1].loadoutSlot, "hero" ) or f147_local4[f149_arg1].loadoutSlot == "specialgadget" then
				local f149_local0 = -1
				local f149_local1 = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_INVALID
				local f149_local2 = -1
				local f149_local3 = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_INVALID
				for f149_local7, f149_local8 in ipairs( f147_local0 ) do
					local f149_local9 = Engine.GetLoadoutItemIndexForHero( Engine.CurrentSessionMode(), f149_local7 - 1, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
					local f149_local10 = Engine.GetLoadoutItemIndexForHero( Engine.CurrentSessionMode(), f149_local7 - 1, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET )
					if f147_local4[f149_arg0].index == f149_local9 then
						f149_local0 = f149_local7
						f149_local1 = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON
					elseif f147_local4[f149_arg0].index == f149_local10 then
						f149_local0 = f149_local7
						f149_local1 = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET
					end
					if f147_local4[f149_arg1].index == f149_local9 then
						f149_local2 = f149_local7
						f149_local3 = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON
					end
					if f147_local4[f149_arg1].index == f149_local10 then
						f149_local2 = f149_local7
						f149_local3 = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET
					end
				end
				if f149_local0 == f149_local2 then
					return f149_local1 < f149_local3
				end
				return f149_local0 < f149_local2
			elseif LUI.startswith( f147_local4[f149_arg0].loadoutSlot, "killstreak" ) or LUI.startswith( f147_local4[f149_arg1].loadoutSlot, "killstreak" ) then
				return f147_local4[f149_arg0].momentum < f147_local4[f149_arg1].momentum
			elseif f147_local4[f149_arg0].groupIndex ~= f147_local4[f149_arg1].groupIndex then
				return f147_local4[f149_arg0].groupIndex < f147_local4[f149_arg1].groupIndex
			elseif f147_local4[f149_arg0].loadoutSlot == f147_local4[f149_arg1].loadoutSlot then
				return Engine.Localize( f147_local4[f149_arg0].name ) < Engine.Localize( f147_local4[f149_arg1].name )
			else
				return Engine.Localize( f147_local4[f149_arg0].loadoutSlot ) < Engine.Localize( f147_local4[f149_arg1].loadoutSlot )
			end
		end
		
		f147_local10 = {}
		f147_local6 = 1
		for f147_local14, f147_local15 in LUI.IterateTableBySortedKeys( f147_local4, f147_local7, nil ) do
			f147_local10[f147_local6] = f147_local15
			f147_local6 = f147_local6 + 1
		end
		CoD.CACUtility.Items = {
			f147_local10,
			f147_local9
		}
		return unpack( CoD.CACUtility.Items )
	end
	CoD.CACUtility.Items = {
		f147_local4,
		f147_local3
	}
	return unpack( CoD.CACUtility.Items )
end

CoD.CACUtility.GetLoadout = function ( f150_arg0, f150_arg1 )
	local f150_local0 = {
		weapons = {},
		primaryAttachments = {},
		secondaryAttachments = {},
		equipment = {},
		perks = {},
		wildcards = {},
		other = {},
		streaks = {}
	}
	if Engine.CurrentSessionMode() == Enum.eModes.MODE_INVALID then
		return f150_local0
	end
	local f150_local1 = Engine.GetCustomClass( f150_arg0, f150_arg1 )
	for f150_local5, f150_local6 in pairs( f150_local1 ) do
		if LUI.startswith( f150_local5, "primaryattachment" ) then
			table.insert( f150_local0.primaryAttachments, Engine.GetItemAttachment( f150_local1.primary, f150_local6 ) )
		end
		if LUI.startswith( f150_local5, "secondaryattachment" ) then
			table.insert( f150_local0.secondaryAttachments, Engine.GetItemAttachment( f150_local1.secondary, f150_local6 ) )
		end
		if LUI.startswith( f150_local5, "killstreak" ) then
			f150_local0.streaks[f150_local5] = f150_local6
		end
		if LUI.startswith( f150_local5, "hero" ) or f150_local5 == "specialgadget" then
			f150_local0.heroItem = f150_local6
		end
		if LUI.startswith( f150_local5, "specialty" ) then
			f150_local0.perks[f150_local5] = f150_local6
		end
		if LUI.startswith( f150_local5, "bonuscard" ) then
			f150_local0.wildcards[f150_local5] = f150_local6
		end
		if f150_local5 == "primary" or f150_local5 == "secondary" then
			f150_local0.weapons[f150_local5] = f150_local6
		end
		if f150_local5 == "primarygadget" or f150_local5 == "secondarygadget" then
			f150_local0.equipment[f150_local5] = f150_local6
		else
			f150_local0.other[f150_local5] = f150_local6
		end
	end
	return f150_local0
end

CoD.CACUtility.GetFullLoadout = function ( f151_arg0 )
	local f151_local0 = {
		classes = {}
	}
	local f151_local1 = Engine.GetCustomClassCount( f151_arg0 )
	for f151_local2 = 0, f151_local1 - 1, 1 do
		local f151_local5 = CoD.CACUtility.GetLoadout( f151_arg0, f151_local2 )
		if f151_local0.streaks == nil then
			f151_local0.streaks = f151_local5.streaks
		end
		if f151_local0.heroItem == nil then
			f151_local0.heroItem = f151_local5.heroItem
		end
		table.insert( f151_local0.classes, f151_local5 )
	end
	return f151_local0
end

CoD.CACUtility.SetShowcaseWeaponToClassPrimary = function ( f152_arg0, f152_arg1 )
	local f152_local0 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local f152_local1 = Engine.GetModel( Engine.GetModel( Engine.GetModelForController( f152_arg0 ), "CustomClassList" ), "class" .. f152_arg1 + 1 )
	local f152_local2 = Engine.GetEquippedHero( f152_arg0, f152_local0 )
	local f152_local3 = Engine.GetModel( Engine.GetModel( f152_local1, "primary" ), "variantName" )
	if f152_local3 then
		Engine.SetHeroShowcaseWeaponVariantName( f152_arg0, f152_local0, f152_local2, Engine.GetModelValue( f152_local3 ) )
	end
	local f152_local4 = CoD.CACUtility.GetItemEquippedInSlot( "primary", f152_arg0, f152_local1 )
	if CoD.CACUtility.EmptyItemIndex < f152_local4 then
		Engine.SetHeroShowcaseWeaponAttribute( f152_arg0, f152_local0, f152_local2, "weaponIndex", f152_local4 )
	end
	for f152_local5 = 1, CoD.CACUtility.maxPrimaryAttachments, 1 do
		local f152_local8 = CoD.CACUtility.GetItemEquippedInSlot( "primaryattachment" .. f152_local5, f152_arg0, f152_local1 )
		if CoD.CACUtility.EmptyItemIndex < f152_local8 then
			Engine.SetHeroShowcaseWeaponAttribute( f152_arg0, f152_local0, f152_local2, "attachment", f152_local8, f152_local5 - 1 )
		end
	end
	local f152_local5 = CoD.CACUtility.GetAttachmentVariantForAttachmentList( f152_local1, "primary" )
	for f152_local6 = 1, #f152_local5, 1 do
		Engine.SetHeroShowcaseWeaponAttribute( f152_arg0, f152_local0, f152_local2, "attachmentVariant", f152_local5[f152_local6].attachmentIndex, f152_local6 - 1 )
	end
	Engine.SetHeroShowcaseWeaponAttribute( f152_arg0, f152_local0, f152_local2, "camoIndex", CoD.CACUtility.GetItemEquippedInSlot( "primaryCamo", f152_arg0, f152_local1 ) )
	Engine.SetHeroShowcaseWeaponAttribute( f152_arg0, f152_local0, f152_local2, "paintjobSlot", CoD.CACUtility.GetItemEquippedInSlot( "primarypaintjobslot", f152_arg0, f152_local1 ) )
	Engine.SetHeroShowcaseWeaponAttribute( f152_arg0, f152_local0, f152_local2, "paintjobIndex", CoD.CACUtility.GetItemEquippedInSlot( "primarypaintjobindex", f152_arg0, f152_local1 ) )
	MarkCACPaintshopDataDirty( nil, f152_arg0 )
end

function AnyItemBanned( f153_arg0 )
	for f153_local3, f153_local4 in pairs( f153_arg0 ) do
		if Engine.IsItemIndexRestricted( f153_local4, false ) then
			return true
		end
	end
	return false
end

function AnyAttachmentBanned( f154_arg0, f154_arg1 )
	for f154_local3, f154_local4 in ipairs( f154_arg1 ) do
		if Engine.IsAttachmentRestricted( f154_local4, f154_arg0, false ) == true then
			return true
		end
	end
	return false
end

CoD.CACUtility.AnyClassContainsRestrictedItems = function ( f155_arg0 )
	local f155_local0 = Engine.GetCustomClassCount( f155_arg0 )
	for f155_local1 = 0, f155_local0 - 1, 1 do
		if CoD.CACUtility.ClassContainsRestrictedItems( f155_arg0, f155_local1 ) then
			return true
		end
	end
	return false
end

CoD.CACUtility.AnyEquippedScorestreaksBanned = function ( f156_arg0 )
	local f156_local0 = CoD.CACUtility.GetFullLoadout( f156_arg0 )
	return AnyItemBanned( f156_local0.streaks )
end

CoD.CACUtility.ClassContainsRestrictedItems = function ( f157_arg0, f157_arg1 )
	local f157_local0 = CoD.CACUtility.GetLoadout( f157_arg0, f157_arg1 )
	if AnyItemBanned( f157_local0.weapons ) then
		return true
	elseif AnyItemBanned( f157_local0.equipment ) then
		return true
	elseif AnyItemBanned( f157_local0.perks ) then
		return true
	elseif AnyItemBanned( f157_local0.wildcards ) then
		return true
	elseif f157_local0.weapons.primary ~= nil and AnyAttachmentBanned( f157_local0.weapons.primary, f157_local0.primaryAttachments ) then
		return true
	elseif f157_local0.weapons.secondary ~= nil and AnyAttachmentBanned( f157_local0.weapons.secondary, f157_local0.secondaryAttachments ) then
		return true
	else
		return false
	end
end

CoD.CACUtility.GetAllRestrictedItems = function ()
	local f158_local0 = {}
	for f158_local4, f158_local5 in ipairs( Engine.GetPregameItemVotes() ) do
		if f158_local5.voteType == Enum.VoteType.VOTE_TYPE_BAN then
			table.insert( f158_local0, f158_local5 )
		end
	end
	f158_local1, f158_local2 = CoD.CACUtility.GetAllItems( true, true )
	for f158_local6, f158_local7 in pairs( f158_local1 ) do
		if Engine.GetItemRestrictionState( f158_local7.index ) == Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_RESTRICTED then
			table.insert( f158_local0, {
				itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM,
				itemIndex = f158_local7.index,
				itemGroup = -1,
				attachmentIndex = -1,
				voteType = Enum.VoteType.VOTE_TYPE_BAN
			} )
		end
	end
	for f158_local6, f158_local7 in pairs( f158_local2 ) do
		if Engine.IsAttachmentRestrictedForAnyWeapon( f158_local7.index ) == true then
			table.insert( f158_local0, {
				itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT,
				itemIndex = f158_local7.index,
				itemGroup = -1,
				attachmentIndex = -1,
				voteType = Enum.VoteType.VOTE_TYPE_BAN
			} )
		end
	end
	return f158_local0
end

CoD.CACUtility.AnyCACItemsBanned = function ()
	for f159_local4, f159_local5 in ipairs( CoD.CACUtility.GetAllRestrictedItems() ) do
		if f159_local5.voteType == Enum.VoteType.VOTE_TYPE_BAN then
			if f159_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
				local f159_local3 = Engine.GetUnlockableInfoByIndex( f159_local5.itemIndex )
				if not LuaUtils.StartsWith( f159_local3.loadoutSlot, "hero" ) and not LuaUtils.StartsWith( f159_local3.loadoutSlot, "killstreak" ) and f159_local3.loadoutSlot ~= "specialgadget" then
					return true
				end
			end
			if f159_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
				return true
			elseif f159_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
				return true
			elseif f159_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
				return true
			end
		end
	end
	return false
end

CoD.CACUtility.AnyStreaksBanned = function ()
	for f160_local4, f160_local5 in ipairs( CoD.CACUtility.GetAllRestrictedItems() ) do
		if f160_local5.voteType == Enum.VoteType.VOTE_TYPE_BAN and f160_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
			local f160_local3 = Engine.GetUnlockableInfoByIndex( f160_local5.itemIndex )
			if LUI.startswith( f160_local3.loadoutSlot, "killstreak" ) then
				return true
			end
		end
	end
	return false
end

CoD.CACUtility.AnySpecialistBanned = function ()
	local f161_local0, f161_local1 = CoD.CACUtility.GetAllItems( false, true )
	for f161_local5, f161_local6 in pairs( f161_local0 ) do
		if LuaUtils.StartsWith( f161_local6.loadoutSlot, "hero" ) and Engine.IsItemIndexRestricted( f161_local6.index, false ) then
			return true
		end
	end
	return false
end

CoD.CACUtility.EquippedSpecialistBanned = function ( f162_arg0 )
	local f162_local0 = CoD.CACUtility.GetFullLoadout( f162_arg0 )
	if f162_local0.heroItem then
		return Engine.IsItemIndexRestricted( f162_local0.heroItem, false )
	else
		return false
	end
end

CoD.CACUtility.ItemSlotBannedByBonuscard = function ( f163_arg0, f163_arg1 )
	if not f163_arg0 then
		return false
	elseif not f163_arg1 or f163_arg1 <= 0 then
		return false
	end
	local f163_local0 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local f163_local1 = nil
	local f163_local2 = 0
	local f163_local3 = {}
	local f163_local4 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.primary_gunfighter, f163_local0 )
	local f163_local5 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.primary_gunfighter_2, f163_local0 )
	local f163_local6 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.primary_gunfighter_3, f163_local0 )
	f163_local3 = f163_local4
	if f163_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryWeapon then
		f163_local4 = Engine.GetUnlockableInfoByIndex( f163_arg1, f163_local0 )
		if f163_local4.loadoutSlot == CoD.CACUtility.loadoutSlotNames.primaryWeapon then
			f163_local1 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.overkill, f163_local0 )
		end
	elseif f163_arg0 == CoD.CACUtility.loadoutSlotNames.primaryAttachment4 then
		f163_local2 = 1
	elseif f163_arg0 == CoD.CACUtility.loadoutSlotNames.primaryAttachment5 then
		f163_local2 = 2
	elseif f163_arg0 == CoD.CACUtility.loadoutSlotNames.primaryAttachment6 then
		f163_local2 = 3
	elseif f163_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryAttachment1 or f163_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryAttachment2 or f163_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryAttachment3 or f163_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryAttachment4 or f163_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryAttachment5 or f163_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryAttachment6 then
		f163_local4 = Engine.GetUnlockableInfoByIndex( f163_arg1, f163_local0 )
		if f163_local4.loadoutSlot == CoD.CACUtility.loadoutSlotNames.primaryWeapon then
			f163_local1 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.overkill, f163_local0 )
		elseif f163_arg0 ~= CoD.CACUtility.loadoutSlotNames.secondaryAttachment1 and f163_arg0 ~= CoD.CACUtility.loadoutSlotNames.secondaryAttachment2 then
			f163_local1 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.secondary_gunfighter, f163_local0 )
		end
	elseif f163_arg0 == CoD.CACUtility.loadoutSlotNames.specialty4 then
		f163_local1 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.perk_1_greed, f163_local0 )
	elseif f163_arg0 == CoD.CACUtility.loadoutSlotNames.specialty5 then
		f163_local1 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.perk_2_greed, f163_local0 )
	elseif f163_arg0 == CoD.CACUtility.loadoutSlotNames.specialty6 then
		f163_local1 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.perk_3_greed, f163_local0 )
	elseif f163_arg0 == CoD.CACUtility.loadoutSlotNames.primaryGadgetAttachment1 then
		f163_local1 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.danger_close, f163_local0 )
	elseif f163_arg0 == CoD.CACUtility.loadoutSlotNames.primaryGadget then
		f163_local4 = Engine.GetUnlockableInfoByIndex( f163_arg1, f163_local0 )
		if f163_local4.loadoutSlot == CoD.CACUtility.loadoutSlotNames.secondaryGadget then
			f163_local1 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.two_tacticals, f163_local0 )
		end
	end
	if 0 < f163_local2 then
		f163_local4 = 3
		for f163_local5 = 1, #f163_local3, 1 do
			if Engine.IsItemIndexRestricted( f163_local3[f163_local5], false ) then
				f163_local4 = f163_local4 - 1
			end
		end
		return f163_local4 < f163_local2
	elseif f163_local1 and Engine.IsItemIndexRestricted( f163_local1, false ) then
		return true
	end
	return false
end

CoD.CACUtility.GetItemInfoFromElementModel = function ( f164_arg0, f164_arg1 )
	if f164_arg1 then
		local f164_local0 = {}
		local f164_local1 = Engine.GetModel( f164_arg1, "itemType" )
		if f164_local1 then
			f164_local0.itemType = Engine.GetModelValue( f164_local1 )
			local f164_local2 = Engine.GetModel( f164_arg1, "itemIndex" )
			if f164_local2 then
				f164_local0.itemIndex = Engine.GetModelValue( f164_local2 )
			end
			local f164_local3 = Engine.GetModel( f164_arg1, "weaponIndex" )
			if f164_local3 then
				local f164_local4 = Engine.GetModelValue( f164_local3 )
				if f164_local4 > 0 then
					f164_local0.itemIndex = f164_local4
				end
			end
			local f164_local4 = Engine.GetModel( f164_arg1, "attachmentIndex" )
			if f164_local4 then
				f164_local0.attachmentIndex = Engine.GetModelValue( f164_local4 )
			end
			local f164_local5 = Engine.GetModel( f164_arg1, "itemGroup" )
			if f164_local5 then
				f164_local0.itemGroup = Engine.GetModelValue( f164_local5 )
			end
			local f164_local6 = Engine.GetModel( f164_arg1, "weaponSlot" )
			if f164_local6 then
				f164_local0.weaponSlot = Engine.GetModelValue( f164_local6 )
			end
			local f164_local7 = Engine.GetModel( f164_arg1, "loadoutSlot" )
			if f164_local7 then
				f164_local0.loadoutSlot = Engine.GetModelValue( f164_local7 )
			end
			local f164_local8 = Engine.GetModel( f164_arg1, "restrictionState" )
			if f164_local8 then
				f164_local0.restrictionState = Engine.GetModelValue( f164_local8 )
			end
			return f164_local0
		end
	end
end

CoD.CACUtility.ResetCPCustomClasses = function ( f165_arg0 )
	if CoD.isCampaign then
		local f165_local0 = Engine.GetModelForController( f165_arg0 )
		local f165_local1 = Engine.GetModel( Engine.GetModelForController( f165_arg0 ), "CustomClassList.prepared" )
		if f165_local1 then
			Engine.UnsubscribeAndFreeModel( f165_local1 )
		end
		local f165_local2 = Engine.GetModel( f165_local0, "CustomClassList" )
		if f165_local2 then
			for f165_local3 = 1, 6, 1 do
				local f165_local6 = Engine.GetModel( f165_local2, "class" .. f165_local3 )
				if f165_local6 ~= nil then
					Engine.UnsubscribeAndFreeModel( f165_local6 )
				end
			end
		end
	end
end

CoD.CACUtility.GetItemVotedBy = function ( f166_arg0 )
	local f166_local0 = Engine.GetPregameItemVotes()
	local f166_local1 = {}
	for f166_local5, f166_local6 in ipairs( f166_local0 ) do
		if f166_local6.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM and f166_arg0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
			if f166_local6.itemIndex == f166_arg0.itemIndex then
				return f166_local6.gamertag
			end
		end
		if f166_local6.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT and f166_arg0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
			if f166_local6.attachmentIndex == f166_arg0.attachmentIndex then
				return f166_local6.gamertag
			end
		end
		if f166_local6.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT and f166_arg0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
			if f166_local6.itemIndex == f166_arg0.itemIndex and f166_local6.attachmentIndex == f166_arg0.attachmentIndex then
				return f166_local6.gamertag
			end
		end
		if f166_local6.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP and f166_arg0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP and f166_local6.itemGroup == f166_arg0.itemGroup then
			return f166_local6.gamertag
		end
	end
	return ""
end

CoD.CACUtility.GetItemInfoFromElement = function ( f167_arg0, f167_arg1 )
	return CoD.CACUtility.GetItemInfoFromElementModel( f167_arg0, f167_arg1:getModel() )
end

CoD.CACUtility.IsItemConsumable = function ( f168_arg0 )
	if Engine.CurrentSessionMode() == Enum.eModes.MODE_INVALID then
		return false
	else
		return Engine.GetItemGroup( f168_arg0 ) == "bubblegum_consumable"
	end
end

CoD.CACUtility.GetCurrentWeaponXP = function ( f169_arg0, f169_arg1, f169_arg2 )
	local f169_local0 = nil
	return Engine.GetDStatForMode( f169_arg0, f169_arg2, "itemstats", f169_arg1, "xp" )
end

CoD.CACUtility.GetWeaponPLevel = function ( f170_arg0, f170_arg1 )
	local f170_local0 = Engine.GetPlayerStats( f170_arg0 )
	return f170_local0.itemstats[f170_arg1].pLevel:get()
end

CoD.CACUtility.GetWeaponAttributeValuesForVariant = function ( f171_arg0, f171_arg1 )
	local f171_local0 = {
		damage = "0",
		range = "0",
		fireRate = "0",
		accuracy = "0"
	}
	if f171_arg1.weaponIndex <= CoD.CACUtility.EmptyItemIndex then
		return f171_local0
	end
	local f171_local1 = f171_arg1.weaponIndex
	local f171_local2 = Engine.GetItemRef( f171_local1 )
	local f171_local3 = Engine.GetModel( Engine.GetModel( Engine.GetGlobalModel(), "Unlockables" ), f171_local1 .. ".weaponAttributes" )
	if LuaUtils.IsTableEmpty( f171_arg1.attachment ) then
		local f171_local4 = CoD.SafeGetModelValue( f171_local3, "damage" )
		local f171_local5 = CoD.SafeGetModelValue( f171_local3, "range" )
		local f171_local6 = CoD.SafeGetModelValue( f171_local3, "fireRate" )
		local f171_local7 = CoD.SafeGetModelValue( f171_local3, "accuracy" )
		f171_local0.damage = f171_local4 .. "," .. f171_local4
		f171_local0.range = f171_local5 .. "," .. f171_local5
		f171_local0.fireRate = f171_local6 .. "," .. f171_local6
		f171_local0.accuracy = f171_local7 .. "," .. f171_local7
		return f171_local0
	end
	local f171_local4 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_REFERENCE
	local f171_local5 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_WEAPON_NAME
	local f171_local6 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_DAMAGE
	local f171_local7 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_RANGE
	local f171_local8 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_FIRE_RATE
	local f171_local9 = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_ACCURACY
	local f171_local10 = {
		damage = 0,
		range = 0,
		fireRate = 0,
		accuracy = 0
	}
	for f171_local21, f171_local22 in ipairs( f171_arg1.attachment ) do
		if f171_local22 > CoD.CACUtility.EmptyItemIndex then
			local f171_local14 = Engine.GetAttachmentRefByIndex( f171_local22 )
			local f171_local15 = Engine.TableLookup( nil, CoD.weaponAttributes, f171_local4, f171_local14, f171_local5, f171_local2, f171_local6 )
			local f171_local16 = Engine.TableLookup( nil, CoD.weaponAttributes, f171_local4, f171_local14, f171_local5, f171_local2, f171_local7 )
			local f171_local17 = Engine.TableLookup( nil, CoD.weaponAttributes, f171_local4, f171_local14, f171_local5, f171_local2, f171_local8 )
			local f171_local18 = Engine.TableLookup( nil, CoD.weaponAttributes, f171_local4, f171_local14, f171_local5, f171_local2, f171_local9 )
			local f171_local19 = f171_local10.damage
			local f171_local20
			if f171_local15 == "" then
				f171_local20 = 0
				if not f171_local20 then
				
				else
					f171_local10.damage = f171_local19 + f171_local20
					f171_local19 = f171_local10.range
					if f171_local16 == "" then
						f171_local20 = 0
						if not f171_local20 then
						
						else
							f171_local10.range = f171_local19 + f171_local20
							f171_local19 = f171_local10.fireRate
							if f171_local17 == "" then
								f171_local20 = 0
								if not f171_local20 then
								
								else
									f171_local10.fireRate = f171_local19 + f171_local20
									f171_local19 = f171_local10.accuracy
									if f171_local18 == "" then
										f171_local20 = 0
										if not f171_local20 then
										
										else
											f171_local10.accuracy = f171_local19 + f171_local20
										end
									end
									f171_local20 = f171_local18
								end
							end
							f171_local20 = f171_local17
						end
					end
					f171_local20 = f171_local16
				end
			end
			f171_local20 = f171_local15
		end
		local f171_local14 = function ( f172_arg0, f172_arg1 )
			local f172_local0 = Engine.GetModelValue( Engine.GetModel( f171_local3, f172_arg0 ) )
			if f172_local0 == "" then
				f172_local0 = 0
			end
			return f172_local0 .. "," .. f172_local0 + f171_local10[f172_arg0]
		end
		
		f171_local0.damage = f171_local14( "damage", f171_local6 )
		f171_local0.range = f171_local14( "range", f171_local7 )
		f171_local0.fireRate = f171_local14( "fireRate", f171_local8 )
		f171_local0.accuracy = f171_local14( "accuracy", f171_local9 )
	end
	return f171_local0
end

CoD.CACUtility.PrepareOverCapactiyList = function ( f173_arg0 )
	local f173_local0 = {}
	local f173_local1 = 10
	local f173_local2 = -2
	local f173_local3 = CoD.perController[f173_arg0].classModel
	local f173_local4 = function ( f174_arg0, f174_arg1, f174_arg2, f174_arg3 )
		local f174_local0 = ""
		if f174_arg3 then
			local f174_local1 = f174_arg1
			if LUI.startswith( f174_arg0, "primaryattachment" ) then
				f174_local1 = Engine.GetModel( f173_local3, "primary" )
			elseif LUI.startswith( f174_arg0, "secondaryattachment" ) then
				f174_local1 = Engine.GetModel( f173_local3, "secondary" )
			end
			f174_local0 = Engine.GetModelValue( Engine.GetModel( f174_local1, "headerName" ) )
		end
		return {
			models = {
				headerName = f174_local0,
				name = Engine.GetModelValue( Engine.GetModel( f174_arg1, "name" ) ),
				image = Engine.GetModelValue( Engine.GetModel( f174_arg1, "image" ) ) or "blacktransparent",
				itemSlot = f174_arg0
			},
			properties = {
				itemRef = Engine.GetModelValue( Engine.GetModel( f174_arg1, "ref" ) ),
				spacing = f174_arg2 or f173_local2
			}
		}
	end
	
	local f173_local5 = CoD.perController[f173_arg0].weaponCategory
	local f173_local6 = CoD.perController[f173_arg0].overCapacityItemIndex
	local f173_local7 = ""
	if f173_local6 then
		f173_local7 = Engine.GetItemRef( f173_local6 )
	end
	if f173_local3 then
		for f173_local19, f173_local20 in ipairs( CoD.CACUtility.overCapacityLoadoutSlotOrder ) do
			local f173_local21 = Engine.GetModel( f173_local3, f173_local20 )
			local f173_local22 = f173_local1
			local f173_local23 = #f173_local0
			local f173_local24, f173_local11 = nil
			local f173_local18 = true
			if f173_local23 > 0 then
				f173_local11 = f173_local0[f173_local23].models.itemSlot
			end
			if LUI.startswith( f173_local5, "primaryattachment" ) and f173_local20 == "primary" then
				
			end
			if LUI.startswith( f173_local5, "secondaryattachment" ) and f173_local20 == "secondary" then
				
			end
			if LUI.startswith( f173_local5, "primarygadgetattachment" ) then
				if f173_local20 ~= "primarygadget" then
					if CoD.CACUtility.GetItemReferenceName( f173_local21, f173_local20 ) == "bonuscard_danger_close" then
						
					end
				end
			end
			if LUI.startswith( f173_local5, "secondarygadgetattachment" ) and f173_local20 == "secondarygadget" then
				
			end
			if LUI.startswith( f173_local7, "bonuscard_primary_gunfighter" ) then
				if f173_local20 ~= "primary" then
					if LUI.startswith( f173_local20, "primaryattachment" ) then
						
					end
				end
			end
			if f173_local7 == "bonuscard_secondary_gunfighter" then
				if f173_local20 ~= "secondary" then
					if LUI.startswith( f173_local20, "secondaryattachment" ) then
						
					end
				end
			end
			if f173_local21 then
				local f173_local12 = Engine.GetModel( f173_local21, "itemIndex" )
				if f173_local12 then
					local f173_local13 = Engine.GetModelValue( f173_local12 )
					local f173_local14 = Engine.GetItemRef( f173_local13 )
					if f173_local13 > CoD.CACUtility.EmptyItemIndex then
						if LUI.startswith( f173_local20, "primarygadgetattachment" ) then
							local f173_local15 = Engine.GetModel( f173_local3, "primarygadget.itemIndex" )
							if f173_local15 then
								local f173_local16 = Engine.GetModelValue( f173_local15 )
								local f173_local17 = Engine.GetModel( f173_local3, "primarygadgetattachment1" )
								if f173_local11 and f173_local11 == "primarygadget" then
									f173_local0[f173_local23].properties.spacing = f173_local2
									f173_local18 = false
								end
								table.insert( f173_local0, f173_local4( f173_local20, f173_local17, f173_local1, f173_local18 ) )
							end
						end
						if LUI.startswith( f173_local20, "secondarygadgetattachment" ) then
							local f173_local15 = Engine.GetModel( f173_local3, "secondarygadget.itemIndex" )
							if f173_local15 then
								local f173_local16 = Engine.GetModelValue( f173_local15 )
								local f173_local17 = Engine.GetModel( f173_local3, "secondarygadgetattachment1" )
								if f173_local11 and f173_local11 == "secondarygadget" then
									f173_local0[f173_local23].properties.spacing = f173_local2
									f173_local18 = false
								end
								table.insert( f173_local0, f173_local4( f173_local20, f173_local17, f173_local1, f173_local18 ) )
							end
						end
						if f173_local5 == "specialty4" and f173_local14 == "bonuscard_perk_1_greed" then
							
						end
						if f173_local5 == "specialty5" and f173_local14 == "bonuscard_perk_2_greed" then
							
						end
						if f173_local5 == "specialty6" and f173_local14 == "bonuscard_perk_3_greed" then
							
						end
						if (f173_local5 == "primaryattachment4" or f173_local5 == "primaryattachment5" or f173_local5 == "primaryattachment6") and LUI.startswith( f173_local14, "bonuscard_primary_gunfighter" ) then
							
						end
						if f173_local5 == "secondary" and f173_local14 == "bonuscard_overkill" then
							
						end
						if not LUI.startswith( f173_local5, "secondaryattachment" ) or f173_local14 ~= "bonuscard_overkill" then
							if f173_local5 == "secondaryattachment3" and f173_local14 == "bonuscard_secondary_gunfighter" then
								
							end
							if f173_local5 == "primarygadget" and f173_local14 == "bonuscard_two_tacticals" then
								
							end
							if f173_local5 == "primarygadgetattachment2" and f173_local14 == "bonuscard_danger_close" then
								
							end
							if LUI.startswith( f173_local5, "primarygadgetattachment" ) and f173_local14 == "bonuscard_two_tacticals" then
								
							end
							if f173_local11 and (not (not LUI.startswith( f173_local20, "primaryattachment" ) and not LUI.startswith( f173_local20, "secondaryattachment" ) and (f173_local11 ~= "specialty1" or f173_local20 ~= "specialty4")) or not (f173_local11 ~= "specialty2" or f173_local20 ~= "specialty5") or not (f173_local11 ~= "specialty3" or f173_local20 ~= "specialty6") or LUI.startswith( f173_local11, "bonuscard" ) and LUI.startswith( f173_local20, "bonuscard" )) then
								f173_local0[f173_local23].properties.spacing = f173_local2
								f173_local18 = false
							end
							table.insert( f173_local0, f173_local4( f173_local20, f173_local21, f173_local22, f173_local18 ) )
						end
					end
				end
			end
		end
	end
	return f173_local0
end

f0_local0 = {
	getSpacerAfterColumn = function ( f175_arg0, f175_arg1 )
		local f175_local0 = f175_arg0[f175_arg0.dataSourceName]
		if f175_local0[f175_arg1] then
			return f175_local0[f175_arg1].properties.spacing
		else
			return -2
		end
	end
}
CoD.CACUtility.RemoveItemFromClassList = function ( f176_arg0 )
	local f176_local0 = CoD.perController[f176_arg0].weaponCategory
	local f176_local1 = CoD.CACUtility.PrepareOverCapactiyList( f176_arg0 )
	local f176_local2 = nil
	for f176_local3 = #f176_local1, 1, -1 do
		local f176_local6 = f176_local1[f176_local3].models.itemSlot
		if f176_local0 == f176_local6 or LUI.startswith( f176_local6, f176_local0 .. "attachment" ) then
			table.remove( f176_local1, f176_local3 )
		end
	end
	local f176_local3 = f176_local0 == "primary"
	local f176_local4 = "bonuscard_primary_gunfighter"
	if not f176_local3 then
		f176_local4 = "bonuscard_secondary_gunfighter"
	end
	for f176_local5 = #f176_local1, 1, -1 do
		if LUI.startswith( f176_local1[f176_local5].properties.itemRef, f176_local4 ) then
			table.remove( f176_local1, f176_local5 )
		end
	end
	return f176_local1
end

DataSources.RemoveItemFromClassList = DataSourceHelpers.ListSetup( "RemoveItemFromClassList", CoD.CACUtility.RemoveItemFromClassList, true, f0_local0 )
DataSources.OverCapacityList = DataSourceHelpers.ListSetup( "OverCapacityList", CoD.CACUtility.PrepareOverCapactiyList, true, f0_local0 )
CoD.CACUtility.PrepareWildcardOverCapactiyList = function ( f177_arg0 )
	local f177_local0 = {}
	local f177_local1 = function ( f178_arg0, f178_arg1, f178_arg2, f178_arg3 )
		return {
			models = {
				name = f178_arg0,
				image = f178_arg1 or "blacktransparent",
				itemSlot = f178_arg2
			},
			properties = {
				itemIndex = f178_arg3
			}
		}
	end
	
	local f177_local2 = CoD.perController[f177_arg0].classModel
	local f177_local3 = CoD.perController[f177_arg0].wildcardOverCapacityRefName
	local f177_local4 = CoD.perController[f177_arg0].weaponCategory == "primary"
	local f177_local5 = "bonuscard_primary_gunfighter"
	if not f177_local4 then
		f177_local5 = "bonuscard_secondary_gunfighter"
	end
	for f177_local9, f177_local10 in ipairs( CoD.CACUtility.BonuscardSlotNameCACCardList ) do
		local f177_local11 = Engine.GetModel( f177_local2, f177_local10 )
		local f177_local12 = Engine.GetModelValue( Engine.GetModel( f177_local11, "name" ) )
		local f177_local13 = Engine.GetModelValue( Engine.GetModel( f177_local11, "image" ) )
		local f177_local14 = Engine.GetModelValue( Engine.GetModel( f177_local11, "itemIndex" ) )
		local f177_local15 = Engine.GetModelValue( Engine.GetModel( f177_local11, "ref" ) )
		if f177_local15 ~= "" and not LUI.startswith( f177_local15, f177_local5 ) then
			table.insert( f177_local0, f177_local1( f177_local12, f177_local13, f177_local10, f177_local14 ) )
		end
	end
	return f177_local0
end

DataSources.WildcardOvercapacityList = DataSourceHelpers.ListSetup( "WildcardOvercapacityList", CoD.CACUtility.PrepareWildcardOverCapactiyList, true )
CoD.CACUtility.CreateItemListDataSource = function ( f179_arg0, f179_arg1, f179_arg2 )
	local f179_local0 = "WeaponVariantAttachmentList" .. f179_arg1.properties.index
	DataSources[f179_local0] = DataSourceHelpers.ListSetup( f179_local0, function ( f180_arg0 )
		local f180_local0 = {}
		local f180_local1 = f179_arg2.weaponIndex
		local f180_local2 = 0
		for f180_local6, f180_local7 in ipairs( f179_arg2.attachmentsByIndex ) do
			if f180_local7 > CoD.CACUtility.EmptyItemIndex then
				f180_local2 = f180_local2 + 1
				table.insert( f180_local0, {
					models = {
						image = Engine.GetAttachmentImage( f180_local1, f180_local7 ) .. "_wv_icon"
					},
					properties = {
						isLocked = IsItemAttachmentLocked( f180_arg0, f180_local1, f180_local7, "CILDS" )
					}
				} )
			end
		end
		if CoD.perController[f180_arg0].isShowcaseWeaponMenu then
			return f180_local0
		end
		f180_local3 = CoD.perController[f180_arg0].weaponCategory
		f180_local4 = CoD.CACUtility.PrimaryGunfighterWildcards
		f180_local5 = "cac_mods_primary_gunfighter_wv_icon"
		if f180_local3 == "secondary" then
			f180_local4 = {
				"bonuscard_secondary_gunfighter"
			}
			f180_local5 = "cac_mods_secondary_gunfighter_wv_icon"
		end
		for f180_local6 = 1, f179_arg2.wildcardNeededFromVariantCount, 1 do
			local f180_local9 = Engine.GetItemIndexFromReference( f180_local4[f180_local6] )
			local f180_local10 = f180_local9 and Engine.IsItemLocked( f180_arg0, f180_local9 )
			local f180_local11 = f180_local0[#f180_local0 - #f180_local4 + 1]
			f180_local11.properties.isLocked = f180_local11.properties.isLocked or f180_local10
			table.insert( f180_local0, {
				models = {
					image = f180_local5
				},
				properties = {
					isLocked = f180_local10
				}
			} )
		end
		return f180_local0
	end, true )
	return f179_local0
end

CoD.CACUtility.GetWeaponVariantListModels = function ( f181_arg0, f181_arg1 )
	local f181_local0 = CoD.CACUtility.GetWeaponAttributeValuesForVariant( f181_arg0, f181_arg1 )
	local f181_local1 = {
		models = {
			index = f181_arg1.index,
			variantIndex = f181_arg1.variantIndex,
			variantName = f181_arg1.variantName,
			variantNameBig = f181_arg1.variantNameBig,
			weaponItemIndex = f181_arg1.weaponIndex,
			cacVariantIndex = f181_arg1.cacVariantIndex,
			hintText = Engine.Localize( "MPUI_VARIANT_CONTAINS_LOCKED_ITEMS_DESC" ),
			weaponAttributes = {
				damage = f181_local0.damage,
				range = f181_local0.range,
				fireRate = f181_local0.fireRate,
				accuracy = f181_local0.accuracy
			}
		},
		properties = {
			index = f181_arg1.index,
			weaponVariantInfo = f181_arg1,
			selectIndex = CoD.CACUtility.IsVariantEquippedToClass( CoD.perController[f181_arg0].classModel, CoD.perController[f181_arg0].weaponCategory, f181_arg1.weaponIndex, f181_arg1.cacVariantIndex )
		}
	}
	f181_local1.models.listDataSource = CoD.CACUtility.CreateItemListDataSource( f181_arg0, f181_local1, f181_arg1 )
	return f181_local1
end

CoD.CACUtility.GetNonZeroNumberOfAttachment = function ( f182_arg0 )
	local f182_local0 = 0
	for f182_local4, f182_local5 in ipairs( f182_arg0 ) do
		if f182_local5 > CoD.CACUtility.EmptyItemIndex then
			f182_local0 = f182_local0 + 1
		end
	end
	return f182_local0
end

CoD.CACUtility.IsVariantEquippedToClass = function ( f183_arg0, f183_arg1, f183_arg2, f183_arg3 )
	if f183_arg0 and (f183_arg1 == "primary" or f183_arg1 == "secondary") then
		local f183_local0 = CoD.SafeGetModelValue( f183_arg0, f183_arg1 .. ".itemIndex" )
		local f183_local1 = CoD.SafeGetModelValue( f183_arg0, f183_arg1 .. "gunsmithvariant.itemIndex" )
		local f183_local2 = f183_local1
		local f183_local3 = f183_local0
		local f183_local4
		if f183_local0 ~= f183_arg2 or f183_local1 ~= f183_arg3 then
			f183_local4 = false
		else
			f183_local4 = f183_local3 and f183_local2 and true
		end
		return f183_local4
	else
		return false
	end
end

CoD.CACUtility.WeaponVariantListPrepare = function ( f184_arg0 )
	local f184_local0 = {}
	local f184_local1 = CoD.perController[f184_arg0].weaponIndexForVariant
	table.insert( f184_local0, CoD.CACUtility.GetWeaponVariantListModels( f184_arg0, {
		variantName = Engine.Localize( Engine.GetItemName( f184_local1 ) ),
		variantNameBig = "",
		variantIndex = CoD.CACUtility.EmptyItemIndex,
		weaponIndex = f184_local1,
		index = 0,
		attachmentsByIndex = {},
		unlockedAttachmentsByIndex = {},
		attachmentVariant = {},
		camoIndex = 0,
		reticleIndex = 0,
		paintjobIndex = Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX,
		paintjobSlot = Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT,
		cacVariantIndex = 0,
		wildcardNeededCount = 0,
		wildcardNeededFromVariantCount = 0,
		isVariantLinkBroken = false,
		hasLockedAttachments = false,
		hasLockedItems = false
	} ) )
	local f184_local2 = function ( f185_arg0, f185_arg1 )
		local f185_local0 = 0
		if f185_arg0 then
			if f185_arg1[4] > CoD.CACUtility.EmptyItemIndex then
				f185_local0 = f185_local0 + 1
			end
			if f185_arg1[5] > CoD.CACUtility.EmptyItemIndex then
				f185_local0 = f185_local0 + 1
			end
			if f185_arg1[6] > CoD.CACUtility.EmptyItemIndex then
				f185_local0 = f185_local0 + 1
			end
		elseif f185_arg1[3] > CoD.CACUtility.EmptyItemIndex then
			f185_local0 = f185_local0 + 1
		end
		return f185_local0
	end
	
	for f184_local25, f184_local26 in ipairs( CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList( f184_local1 ) ) do
		local f184_local27 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f184_arg0, f184_local26.variantIndex )
		if CoD.CACUtility.EmptyItemIndex < f184_local27.weaponIndex then
			local f184_local6 = {}
			local f184_local7 = {}
			local f184_local8 = f184_local27.attachment
			local f184_local9 = CoD.CACUtility.GetNonZeroNumberOfAttachment( f184_local8 )
			local f184_local10 = 0
			local f184_local11 = 0
			local f184_local12 = false
			local f184_local13 = CoD.perController[f184_arg0].weaponCategory == "primary"
			local f184_local14 = false
			local f184_local15 = false
			local f184_local16 = 2
			if not f184_local13 then
				f184_local16 = 1
			end
			local f184_local17 = f184_local16 + 1
			local f184_local18 = {}
			for f184_local23, f184_local24 in ipairs( f184_local8 ) do
				if CoD.CACUtility.EmptyItemIndex < f184_local24 then
					local f184_local22 = Engine.GetAttachmentIndexByAttachmentTableIndex( f184_local27.weaponIndex, f184_local24 )
					if Engine.IsOptic( f184_local27.weaponIndex, f184_local22 ) then
						f184_local12 = true
					end
					table.insert( f184_local6, f184_local22 )
					if not IsItemAttachmentLocked( f184_arg0, f184_local27.weaponIndex, f184_local22, "WVLP" ) then
						table.insert( f184_local18, {
							indexSlot = f184_local23,
							index = f184_local22
						} )
					else
						f184_local15 = true
						f184_local14 = true
						table.insert( f184_local18, {
							indexSlot = f184_local23,
							index = CoD.CACUtility.EmptyItemIndex
						} )
						goto basicblock_13:
					end
				end
				table.insert( f184_local6, CoD.CACUtility.EmptyItemIndex )
				table.insert( f184_local18, {
					indexSlot = f184_local23,
					index = CoD.CACUtility.EmptyItemIndex
				} )
			end
			table.sort( f184_local18, function ( f186_arg0, f186_arg1 )
				if f186_arg0.indexSlot == 1 or f186_arg1.indexSlot == 1 then
					return f186_arg0.indexSlot < f186_arg1.indexSlot
				elseif f186_arg0.index == CoD.CACUtility.EmptyItemIndex or f186_arg1.index == CoD.CACUtility.EmptyItemIndex then
					return f186_arg1.index < f186_arg0.index
				else
					return f186_arg0.indexSlot < f186_arg1.indexSlot
				end
			end )
			for f184_local23, f184_local24 in ipairs( f184_local18 ) do
				table.insert( f184_local7, f184_local24.index )
			end
			if IsProgressionEnabled( f184_arg0 ) then
				f184_local11 = f184_local2( f184_local13, f184_local7 )
			end
			f184_local10 = f184_local2( f184_local13, f184_local6 )
			f184_local19 = CoD.CACUtility.PrimaryGunfighterWildcards
			if not f184_local13 then
				f184_local19 = {
					"bonuscard_secondary_gunfighter"
				}
			end
			f184_local20 = false
			for f184_local21 = 1, f184_local10, 1 do
				if Engine.IsItemLocked( f184_arg0, Engine.GetItemIndexFromReference( f184_local19[f184_local21] ) ) then
					f184_local20 = true
					break
				end
			end
			f184_local27.variantNameBig = f184_local27.variantName
			f184_local27.attachmentsByIndex = f184_local6
			f184_local27.unlockedAttachmentsByIndex = f184_local7
			f184_local27.index = f184_local25
			f184_local27.wildcardNeededCount = f184_local11
			f184_local27.wildcardNeededFromVariantCount = f184_local10
			f184_local27.isVariantLinkBroken = f184_local15
			f184_local27.hasLockedAttachments = f184_local14
			f184_local27.hasLockedItems = f184_local14 or f184_local20
			table.insert( f184_local0, CoD.CACUtility.GetWeaponVariantListModels( f184_arg0, f184_local27 ) )
		end
	end
	return f184_local0
end

CoD.CACUtility.GetWeaponAndAttachments = function ( f187_arg0, f187_arg1 )
	local f187_local0 = 0
	local f187_local1 = false
	local f187_local2 = Engine.GetModel( Engine.GetModelForController( f187_arg1 ), "currentWeapon" )
	if f187_local2 == nil then
		return f187_local0, f187_local1
	end
	for f187_local3 = 1, 4, 1 do
		local f187_local6 = Engine.GetModel( f187_local2, "attachmentName" .. f187_local3 )
		local f187_local7 = Engine.GetModelValue( f187_local6 )
		if f187_local6 and f187_local7 ~= "" then
			f187_local0 = f187_local0 + 1
		end
		if f187_arg0["currentAttachment" .. f187_local3] ~= f187_local7 then
			f187_arg0["currentAttachment" .. f187_local3] = f187_local7
			f187_local1 = true
		end
	end
	f187_arg0.currentWeapon = Engine.GetModelValue( Engine.GetModel( f187_local2, "weaponName" ) )
	return f187_local0, f187_local1
end

CoD.CACUtility.GetLocalizedAttachmentsString = function ( f188_arg0 )
	local f188_local0 = ""
	if f188_arg0.currentAttachment1 ~= nil and f188_arg0.currentAttachment1 ~= "" then
		f188_local0 = Engine.Localize( f188_arg0.currentAttachment1 )
	end
	if f188_arg0.currentAttachment2 ~= nil and f188_arg0.currentAttachment2 ~= "" then
		f188_local0 = f188_local0 .. " + " .. Engine.Localize( f188_arg0.currentAttachment2 )
	end
	if f188_arg0.currentAttachment3 ~= nil and f188_arg0.currentAttachment3 ~= "" then
		f188_local0 = f188_local0 .. " + " .. Engine.Localize( f188_arg0.currentAttachment3 )
	end
	return f188_local0
end

CoD.CACUtility.ForceStreamedWeaponImages = {}
CoD.CACUtility.ForceStreamAttachmentImages = function ( f189_arg0 )
	local f189_local0 = {}
	local f189_local1 = {}
	local f189_local2 = {}
	local f189_local3 = {
		"cacLoadouts"
	}
	local f189_local4 = Engine.CurrentSessionMode()
	if CoD.isFrontend then
		if CoD.isOnlineGame() then
			table.insert( f189_local2, Engine.StorageGetBuffer( f189_arg0, Enum.StorageFileType.STORAGE_MP_LOADOUTS ) )
			if CoD.isZombie then
				table.insert( f189_local2, Engine.StorageGetBuffer( f189_arg0, Enum.StorageFileType.STORAGE_ZM_LOADOUTS ) )
			end
			table.insert( f189_local3, "leagueCacLoadouts" )
			table.insert( f189_local3, "customMatchCacLoadouts" )
		else
			table.insert( f189_local2, Engine.StorageGetBuffer( f189_arg0, Enum.StorageFileType.STORAGE_MP_LOADOUTS_OFFLINE ) )
			table.insert( f189_local2, Engine.StorageGetBuffer( f189_arg0, Enum.StorageFileType.STORAGE_ZM_LOADOUTS_OFFLINE ) )
		end
	elseif f189_local4 == Enum.eModes.MODE_MULTIPLAYER then
		table.insert( f189_local2, Engine.StorageGetBuffer( f189_arg0, CoD.isOnlineGame() and Enum.StorageFileType.STORAGE_MP_LOADOUTS or Enum.StorageFileType.STORAGE_MP_LOADOUTS_OFFLINE ) )
		if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
			f189_local3 = {
				"leagueCacLoadouts"
			}
		elseif Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) and CoD.isOnlineGame() then
			f189_local3 = {
				"customMatchCacLoadouts"
			}
		end
	elseif f189_local4 == Enum.eModes.MODE_ZOMBIES then
		table.insert( f189_local2, Engine.StorageGetBuffer( f189_arg0, CoD.isOnlineGame() and Enum.StorageFileType.STORAGE_ZM_LOADOUTS or Enum.StorageFileType.STORAGE_ZM_LOADOUTS_OFFLINE ) )
	elseif f189_local4 == Enum.eModes.MODE_CAMPAIGN then
		table.insert( f189_local2, Engine.StorageGetBuffer( f189_arg0, CoD.isOnlineGame() and Enum.StorageFileType.STORAGE_CP_LOADOUTS or Enum.StorageFileType.STORAGE_CP_LOADOUTS_OFFLINE ) )
	end
	local f189_local5 = function ( f190_arg0 )
		if f190_arg0 and f190_arg0 ~= 0 then
			f189_local0[f190_arg0] = true
		end
	end
	
	local f189_local6 = function ( f191_arg0, f191_arg1 )
		if f191_arg1 and f191_arg1 ~= 0 then
			f189_local1[f191_arg0] = true
		end
	end
	
	for f189_local25, f189_local26 in ipairs( f189_local2 ) do
		for f189_local21, f189_local22 in ipairs( f189_local3 ) do
			local f189_local24 = f189_local26 and f189_local26[f189_local22]
			if f189_local24 then
				local f189_local10 = Engine.GetModel( Engine.GetModelForController( f189_arg0 ), "CustomClassList" )
				local f189_local11 = 0
				if f189_local4 ~= Enum.eModes.MODE_INVALID then
					f189_local11 = Engine.GetCustomClassCount( f189_arg0 )
				end
				if CoD.isFrontend then
					for f189_local12 = 0, f189_local11 - 1, 1 do
						f189_local5( f189_local24.customclass[f189_local12].primary:get() )
						f189_local5( f189_local24.customclass[f189_local12].secondary:get() )
					end
				end
				if f189_local10 then
					if CoD.isFrontend then
						local f189_local12 = math.min( math.max( 10 - f189_local11, 0 ), 5 )
						for f189_local13 = 1, f189_local12, 1 do
							local f189_local16 = Engine.GetModel( f189_local10, "class" .. 10 + f189_local13 )
							f189_local5( CoD.SafeGetModelValue( f189_local16, "primary.itemIndex" ) )
							f189_local5( CoD.SafeGetModelValue( f189_local16, "secondary.itemIndex" ) )
						end
					end
					for f189_local12 = 1, 15, 1 do
						local f189_local17 = Engine.GetModel( f189_local10, "class" .. f189_local12 )
						if f189_local17 then
							for f189_local16 = 1, 8, 1 do
								local f189_local20 = Engine.GetModel( f189_local17, "primaryattachment" .. f189_local16 )
								if f189_local20 then
									f189_local6( CoD.SafeGetModelValue( f189_local20, "image" ), CoD.SafeGetModelValue( f189_local20, "itemIndex" ) )
								end
								if f189_local16 <= 3 then
									f189_local20 = Engine.GetModel( f189_local17, "secondaryattachment" .. f189_local16 )
									if f189_local20 then
										f189_local6( CoD.SafeGetModelValue( f189_local20, "image" ), CoD.SafeGetModelValue( f189_local20, "itemIndex" ) )
									end
								end
							end
						end
					end
				end
			end
		end
	end
	for f189_local25, f189_local26 in pairs( f189_local0 ) do
		local f189_local27 = Engine.GetNumAttachments( f189_local25 )
		for f189_local28 = 1, f189_local27 - 1, 1 do
			local f189_local24 = Engine.GetAttachmentUniqueImageByIndex( f189_local25, f189_local28 )
			if f189_local24 and f189_local24 ~= "" then
				f189_local1[f189_local24] = true
			end
		end
	end
	for f189_local25, f189_local26 in pairs( f189_local1 ) do
		Engine.StreamForceImage( f189_local25 )
	end
	for f189_local25, f189_local26 in pairs( CoD.CACUtility.ForceStreamedWeaponImages ) do
		if not f189_local1[f189_local25] then
			Engine.StreamStopForcingImage( f189_local25 )
		end
	end
	CoD.CACUtility.ForceStreamedWeaponImages = f189_local1
end

DataSources.WeaponVariantList = DataSourceHelpers.ListSetup( "WeaponVariantList", CoD.CACUtility.WeaponVariantListPrepare, false )
CoD.WGSV_Category = {}
CoD.WGSV_Category.WEAPON = 1
CoD.WGSV_Category.GUNSMITH_VARIANT = 2
DataSources.WGSV_Category = Engine.CreateModel( Engine.GetGlobalModel(), "WGSV_Category" )
