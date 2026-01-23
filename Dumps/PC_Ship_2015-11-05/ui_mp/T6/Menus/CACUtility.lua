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
	"secondaryattachment5",
	"secondaryattachment6",
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
CoD.CACUtility.WeaponsWithNoCPCamos = {
	bowie_knife = true,
	knife_loadout = true
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
	launcher_standard_df = true
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
f0_local0 = function ( f1_arg0, f1_arg1, f1_arg2 )
	local f1_local0 = {}
	for f1_local1 = f1_arg1, f1_arg2, 1 do
		table.insert( f1_local0, f1_arg0 .. f1_local1 )
	end
	return f1_local0
end

f0_local1 = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	local f2_local0 = {}
	for f2_local1 = f2_arg2, f2_arg3, 1 do
		table.insert( f2_local0, f2_arg0 .. f2_local1 .. f2_arg1 )
	end
	return f2_local0
end

CoD.CACUtility.PrimaryWeaponSlotNameList = {
	"primary"
}
CoD.CACUtility.PrimaryAttachmentSlotNameList = f0_local0( "primaryattachment", 1, CoD.CACUtility.maxPrimaryAttachments )
table.insert( CoD.CACUtility.PrimaryAttachmentSlotNameList, "primary" .. CoD.CACUtility.primaryWeaponPrestigeSlot )
CoD.CACUtility.PrimaryAttachmentCVSlotNameList = f0_local1( "primaryattachment", "cosmeticvariant", 1, CoD.CACUtility.maxPrimaryAttachments )
table.insert( CoD.CACUtility.PrimaryAttachmentCVSlotNameList, "primary" .. CoD.CACUtility.primaryWeaponPrestigeSlot .. "cosmeticvariant" )
CoD.CACUtility.SecondaryWeaponSlotNameList = {
	"secondary"
}
CoD.CACUtility.SecondaryAttachmentSlotNameList = f0_local0( "secondaryattachment", 1, CoD.CACUtility.maxSecondaryAttachments )
table.insert( CoD.CACUtility.SecondaryAttachmentSlotNameList, "secondary" .. CoD.CACUtility.secondaryWeaponPrestigeSlot )
CoD.CACUtility.SecondaryAttachmentCVSlotNameList = f0_local1( "secondaryattachment", "cosmeticvariant", 1, CoD.CACUtility.maxSecondaryAttachments )
table.insert( CoD.CACUtility.SecondaryAttachmentCVSlotNameList, "secondary" .. CoD.CACUtility.secondaryWeaponPrestigeSlot .. "cosmeticvariant" )
CoD.CACUtility.PrimaryGadgetWeaponSlotNameList = {
	"primarygadget"
}
CoD.CACUtility.PrimaryGadgetAttachmentSlotNameList = f0_local0( "primarygadgetattachment", 1, CoD.CACUtility.maxGadgetsMods )
CoD.CACUtility.SecondaryGadgetWeaponSlotNameList = {
	"secondarygadget"
}
CoD.CACUtility.SecondaryGadgetAttachmentSlotNameList = f0_local0( "secondarygadgetattachment", 1, CoD.CACUtility.maxGadgetsMods )
CoD.CACUtility.SpecialGadgetWeaponSlotNameList = {
	"specialgadget"
}
CoD.CACUtility.SpecialGadgetAttachmentSlotNameList = f0_local0( "specialgadgetattachment", 1, CoD.CACUtility.maxGadgetsMods )
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
CoD.CACUtility.CompletePerkSlotNameList = f0_local0( "specialty", 1, CoD.CACUtility.maxPerkCategories * CoD.CACUtility.maxPerksInEachCategory )
CoD.CACUtility.BonuscardSlotNameList = f0_local0( "bonuscard", 1, CoD.CACUtility.maxBonusCards )
CoD.CACUtility.BonuscardSlotNameCACCardList = {
	"bonuscard3",
	"bonuscard1",
	"bonuscard2"
}
CoD.CACUtility.KillstreakNameList = f0_local0( "killstreak", 1, CoD.CACUtility.maxRewards )
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
CoD.CACUtility.CustomClass_LastClassNum = 0
CoD.CACUtility.CustomClass_LastSelection = "primary"
CoD.CACUtility.CustomClass_PerClassLastSelection = {}
CoD.CACUtility.CACStatusAvailable = {}
CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE = 1
CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD = 2
CoD.CACUtility.CACStatusAvailable.AVAILABLE = 3
CoD.OverlayUtility.AddSystemOverlay( "UnlockClassItem", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.systemOverlay_UnlockFrame",
	title = Engine.Localize( "MPUI_CONFIRM_PURCHASE_CAPS" ),
	description = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
		local f3_local0 = CoD.isCampaign and "CPUI_UNLOCK_ITEM" or "MPUI_UNLOCK_ITEM"
		if f3_arg2 then
			return Engine.Localize( f3_local0, Engine.GetItemName( f3_arg1 ) .. "_UPGRADED" )
		else
			return Engine.Localize( f3_local0, Engine.GetItemName( f3_arg1 ) )
		end
	end,
	supportText = function ( f4_arg0, f4_arg1, f4_arg2, f4_arg3 )
		return Engine.Localize( Engine.GetItemName( f4_arg1 ) )
	end,
	image = function ( f5_arg0, f5_arg1, f5_arg2, f5_arg3 )
		local f5_local0 = CoD.perController[f5_arg0].weaponCategory
		local f5_local1 = ""
		if f5_local0 == "specialist" then
			return Engine.GetItemImage( f5_arg1, CoD.CCUtility.customizationMode ) .. "_large"
		elseif f5_local0 and LUI.startswith( f5_local0, "killstreak" ) then
			f5_local1 = "_menu_large"
		elseif not (not f5_local0 or not LUI.startswith( f5_local0, "specialty" )) or f5_local0 == "primarygadget" or f5_local0 == "secondarygadget" then
			f5_local1 = "_256"
		elseif f5_local0 and LUI.startswith( f5_local0, "cybercom_ability" ) then
			f5_local1 = "_LR_tu1"
		end
		return Engine.GetItemImage( f5_arg1 ) .. f5_local1
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.Unlock,
	listDatasource = function ( f6_arg0, f6_arg1, f6_arg2, f6_arg3 )
		DataSources.UnlockTokenMenuList = DataSourceHelpers.ListSetup( "UnlockTokenMenuList", function ( f7_arg0 )
			local f7_local0 = {}
			local f7_local1 = CoD.perController[f7_arg0].weaponCategory
			local f7_local2 = CoD.perController[f7_arg0].isInCybercoreUpgrade or false
			local f7_local3 = function ( f8_arg0, f8_arg1 )
				return {
					models = {
						displayText = f8_arg0,
						itemIndex = f6_arg1,
						upgradeItemIndex = f6_arg2
					},
					properties = {
						action = f8_arg1
					}
				}
			end
			
			local f7_local4 = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3, f9_arg4 )
				UnlockItem( f9_arg4, f9_arg1, f9_arg2 )
				local f9_local0 = GoBackAndUpdateStateOnPreviousMenu( f9_arg4, f9_arg2 )
				if f7_local1 == "specialist" and f9_local0.characterCarousel then
					f9_local0.characterCarousel.activeWidget:processEvent( {
						name = "update_state",
						controller = f9_arg2
					} )
				end
				if f7_local2 then
					UpdateCybercoreTree( f9_local0, f9_local0, f9_arg2 )
				end
			end
			
			local f7_local5 = function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3, f10_arg4 )
				UnlockItem( f10_arg4, f10_arg1, f10_arg2 )
				local f10_local0 = f10_arg4.acceptData.variantInfoElement
				if f10_local0 then
					SetWeaponVariant( GoBack( f10_arg4, f10_arg2 ), f10_local0, f10_arg2 )
				end
			end
			
			local f7_local6 = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3, f11_arg4 )
				local f11_local0 = CoD.perController[f11_arg2].weaponCategory
				local f11_local1 = UnlockAndEquipItem( f11_arg4, f11_arg1, f11_arg2 )
				if f11_local0 == "specialist" then
					local f11_local2 = GoBack( f11_arg4, f11_arg2 )
					SendClientScriptMenuChangeNotify( f11_arg2, f11_local2, false )
					GoBack( f11_local2, f11_arg2 )
				elseif f11_local1 then
					GoBackToCustomClassMenu( f11_local1, f11_arg2 )
				else
					local f11_local2 = GoBack( f11_arg4, f11_arg2 )
					f11_local2:processEvent( {
						name = "update_state",
						menu = f11_local2
					} )
				end
			end
			
			local f7_local7 = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3, f12_arg4 )
				local f12_local0 = CoD.CCUtility.Heroes.HeroIndexForEdits
				local f12_local1 = CoD.CCUtility.GetHeroEquippedSlot( f12_arg2, f6_arg1 )
				local f12_local2 = GoBack( f12_arg4, f12_arg2 )
				if f12_local1 then
					f12_arg1.itemIndex = f6_arg1
					if not f12_arg3 then
						f12_arg3 = {}
					end
					f12_arg3.previousMenu = f12_local2
					UnlockAndEquipHeroForMPFirstTimeSetup( f12_arg0, f12_arg1, f12_arg2, f12_arg3, f12_arg4 )
				end
				GoBackToMenu( f12_local2, f12_arg2, "Lobby" )
			end
			
			local f7_local8 = function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3, f13_arg4 )
				PermanentlyUnlockItem( f13_arg4, f13_arg1, f13_arg2 )
				local f13_local0 = GoBackAndUpdateStateOnPreviousMenu( f13_arg4, f13_arg2 )
			end
			
			local f7_local9 = function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3, f14_arg4 )
				GoBack( f14_arg4, f14_arg2 )
			end
			
			local f7_local10 = not f7_local2
			if CoD.CCUtility.customizationMode == Enum.eModes.MODE_MULTIPLAYER and IsFirstTimeSetup( f7_arg0, Enum.eModes.MODE_MULTIPLAYER ) then
				table.insert( f7_local0, f7_local3( "MENU_UNLOCK_AND_EQUIP", f7_local7 ) )
			elseif f7_local2 then
				table.insert( f7_local0, f7_local3( "MENU_UNLOCK", f7_local4 ) )
				table.insert( f7_local0, f7_local3( "MENU_CANCEL_UNLOCK", f7_local9 ) )
			elseif f6_arg2 ~= nil then
				local f7_local11 = false
				for f7_local15, f7_local16 in ipairs( CoD.CACUtility.GetSlotListWithSlot( f7_local1 ) ) do
					if CoD.CACUtility.GetItemEquippedInSlot( f7_local16, f7_arg0 ) == f6_arg1 then
						f7_local11 = true
					end
				end
				if f7_local11 then
					table.insert( f7_local0, f7_local3( "MENU_UNLOCK", f7_local6 ) )
				else
					table.insert( f7_local0, f7_local3( "MENU_UNLOCK", f7_local4 ) )
					table.insert( f7_local0, f7_local3( "MENU_UNLOCK_AND_EQUIP", f7_local6 ) )
				end
				table.insert( f7_local0, f7_local3( "MENU_CANCEL_UNLOCK", f7_local9 ) )
			elseif f6_arg3 then
				table.insert( f7_local0, f7_local3( "MENU_UNLOCK_AND_EQUIP", f7_local5 ) )
				table.insert( f7_local0, f7_local3( "MENU_CANCEL_UNLOCK", f7_local9 ) )
			elseif CoD.CCUtility.customizationMode == Enum.eModes.MODE_MULTIPLAYER and HavePermanentUnlockTokens( f7_arg0 ) then
				table.insert( f7_local0, f7_local3( "MENU_UNLOCK", f7_local4 ) )
				table.insert( f7_local0, f7_local3( "MENU_UNLOCK_AND_EQUIP", f7_local6 ) )
				table.insert( f7_local0, f7_local3( "MENU_PERMANENTLY_UNLOCK", f7_local8, false ) )
				table.insert( f7_local0, f7_local3( "MENU_CANCEL_UNLOCK", f7_local9 ) )
			else
				table.insert( f7_local0, f7_local3( "MENU_UNLOCK", f7_local4 ) )
				table.insert( f7_local0, f7_local3( "MENU_UNLOCK_AND_EQUIP", f7_local6 ) )
				table.insert( f7_local0, f7_local3( "MENU_CANCEL_UNLOCK", f7_local9 ) )
			end
			return f7_local0
		end, true )
		return "UnlockTokenMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
CoD.OverlayUtility.AddSystemOverlay( "PrestigeWeapon", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.systemOverlay_Full_BasicFrame_Prestige",
	title = function ( f15_arg0, f15_arg1 )
		return Engine.ToUpper( Engine.Localize( "MENU_ENTER_WEAPON_PRESTIGE_X", CoD.CACUtility.GetWeaponPLevel( f15_arg0, Engine.GetModelValue( f15_arg1 ) ) + 1 ) )
	end,
	description = function ( f16_arg0, f16_arg1 )
		return Engine.Localize( "MENU_WEAPON_PRESTIGE_MESSAGE_" .. CoD.CACUtility.GetWeaponPLevel( f16_arg0, Engine.GetModelValue( f16_arg1 ) ) + 1, Engine.GetItemName( Engine.GetModelValue( f16_arg1 ) ) )
	end,
	supportText = function ( f17_arg0, f17_arg1 )
		return Engine.Localize( Engine.GetItemName( Engine.GetModelValue( f17_arg1 ) ) )
	end,
	image = function ( f18_arg0, f18_arg1 )
		return Engine.GetItemImage( Engine.GetModelValue( f18_arg1 ) )
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.Unlock,
	listDatasource = function ( f19_arg0, f19_arg1 )
		DataSources.PrestigeWeaponOptionsList = DataSourceHelpers.ListSetup( "PrestigeWeaponOptionsList", function ( f20_arg0 )
			local f20_local0 = {}
			local f20_local1 = function ( f21_arg0, f21_arg1 )
				return {
					models = {
						displayText = f21_arg0
					},
					properties = {
						action = f21_arg1
					}
				}
			end
			
			table.insert( f20_local0, f20_local1( "MENU_ENTER_WEAPON_PRESTIGE", function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3, f22_arg4 )
				if CoD.perController[f22_arg2].weaponCategory == "primary" then
					for f22_local0 = 1, CoD.CACUtility.maxPrimaryAttachments, 1 do
						Engine.SetClassItem( f22_arg2, CoD.perController[f22_arg2].classNum, "primaryattachment" .. f22_local0, CoD.CACUtility.EmptyItemIndex )
					end
				elseif CoD.perController[f22_arg2].weaponCategory == "secondary" then
					for f22_local0 = 1, CoD.CACUtility.maxSecondaryAttachments, 1 do
						Engine.SetClassItem( f22_arg2, CoD.perController[f22_arg2].classNum, "secondaryattachment" .. f22_local0, CoD.CACUtility.EmptyItemIndex )
					end
				end
				local f22_local0 = Engine.GetPlayerStats( f22_arg2 )
				f22_local0 = f22_local0.itemstats[Engine.GetModelValue( f19_arg1 )]
				f22_local0.xp:set( 0 )
				f22_local0.pLevel:set( math.min( f22_local0.pLevel:get() + 1, CoD.CACUtility.maxWeaponPrestige ) )
				UploadStats( f22_arg4, f22_arg2 )
				Engine.ForceNotifyModelSubscriptions( f19_arg1 )
				GoBack( f22_arg4, f22_arg2 )
			end ) )
			table.insert( f20_local0, f20_local1( "MENU_CANCEL", CoD.OverlayUtility.DefaultButtonAction ) )
			return f20_local0
		end, true )
		return "PrestigeWeaponOptionsList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
CoD.CACUtility.GetCameraNameForAttachments = function ( f23_arg0, f23_arg1 )
	local f23_local0 = 0
	local f23_local1 = 0
	for f23_local5 in string.gmatch( f23_arg0, "[^+]+" ) do
		if f23_local5 == "suppressed" then
			f23_local0 = 1
		end
		if f23_local5 == "extbarrel" then
			f23_local1 = 1
		end
	end
	f23_local2 = "select"
	if f23_arg1 ~= nil and f23_arg1 then
		f23_local2 = "gunsmith"
	end
	f23_local3 = ""
	if f23_local0 == 1 then
		if f23_local1 == 1 then
			f23_local3 = "_extbarrel_suppressor"
		else
			f23_local3 = "_suppressor"
		end
	elseif f23_local1 == 1 then
		f23_local3 = "_extbarrel"
	else
		f23_local3 = "01"
	end
	return f23_local2 .. f23_local3
end

CoD.CACUtility.GetImageForItemRef = function ( f24_arg0 )
	return Engine.TableLookup( nil, CoD.statsTable, 0, f24_arg0, 6 )
end

CoD.CACUtility.GetNameForItemRef = function ( f25_arg0 )
	return Engine.TableLookup( nil, CoD.statsTable, 0, f25_arg0, 3 )
end

CoD.CACUtility.GetIdForItemRef = function ( f26_arg0 )
	return Engine.TableLookup( nil, CoD.statsTable, 0, f26_arg0, 4 )
end

CoD.CACUtility.GetNameForStatsTableImage = function ( f27_arg0 )
	return Engine.TableLookup( nil, CoD.statsTable, 6, f27_arg0, 3 )
end

CoD.CACUtility.GetImageForItemRefString = function ( f28_arg0 )
	return Engine.TableLookup( nil, CoD.statsTable, 4, f28_arg0, 6 )
end

CoD.CACUtility.GetNameForItemRefString = function ( f29_arg0 )
	return Engine.TableLookup( nil, CoD.statsTable, 4, f29_arg0, 3 )
end

CoD.CACUtility.IsSlotNameInList = function ( f30_arg0, f30_arg1 )
	for f30_local3, f30_local4 in ipairs( f30_arg0 ) do
		if f30_local4 == f30_arg1 then
			return true
		end
	end
	return false
end

CoD.CACUtility.GetSlotListWithSlot = function ( f31_arg0 )
	for f31_local3, f31_local4 in ipairs( CoD.CACUtility.SlotLists ) do
		if CoD.CACUtility.IsSlotNameInList( f31_local4, f31_arg0 ) then
			return f31_local4
		end
	end
	return {}
end

CoD.CACUtility.GetAttachmentListForSlot = function ( f32_arg0 )
	if LUI.startswith( f32_arg0, "primarygadget" ) then
		return CoD.CACUtility.PrimaryGadgetAttachmentSlotNameList
	elseif LUI.startswith( f32_arg0, "secondarygadget" ) then
		return CoD.CACUtility.SecondaryGadgetAttachmentSlotNameList
	elseif LUI.startswith( f32_arg0, "primary" ) then
		return CoD.CACUtility.PrimaryAttachmentSlotNameList
	elseif LUI.startswith( f32_arg0, "secondary" ) then
		return CoD.CACUtility.SecondaryAttachmentSlotNameList
	else
		return {}
	end
end

CoD.CACUtility.GetCACWeaponACVList = function ( f33_arg0 )
	if f33_arg0 == "primary" then
		return CoD.CACUtility.PrimaryAttachmentCVSlotNameList
	elseif f33_arg0 == "secondary" then
		return CoD.CACUtility.SecondaryAttachmentCVSlotNameList
	else
		return {}
	end
end

CoD.CACUtility.GetAllocationSpentFromClassData = function ( f34_arg0 )
	return CoD.SumClassItemCosts( f34_arg0.primaryWeapon ) + CoD.SumClassItemCosts( f34_arg0.primaryAttachments ) + CoD.SumClassItemCosts( f34_arg0.secondaryWeapon ) + CoD.SumClassItemCosts( f34_arg0.secondaryAttachments ) + CoD.SumClassItemCosts( f34_arg0.grenades ) + CoD.SumClassItemCosts( f34_arg0.gadgets ) + CoD.SumClassItemCosts( f34_arg0.perks ) + CoD.SumClassItemCosts( f34_arg0.rewards )
end

CoD.CACUtility.HowManyInClassData = function ( f35_arg0, f35_arg1 )
	return CoD.HowManyInClassSlot( f35_arg0, f35_arg1.primaryWeapon ) + CoD.HowManyInClassSlot( f35_arg0, f35_arg1.secondaryWeapon ) + CoD.HowManyInClassSlot( f35_arg0, f35_arg1.grenades ) + CoD.HowManyInClassSlot( f35_arg0, f35_arg1.gadgets ) + CoD.HowManyInClassSlot( f35_arg0, f35_arg1.perks ) + CoD.HowManyInClassSlot( f35_arg0, f35_arg1.rewards )
end

CoD.CACUtility.GetClassData = function ( f36_arg0, f36_arg1 )
	local f36_local0 = {}
	if f36_arg1 == nil then
		f36_arg1 = CoD.perController[f36_arg0].classNumInternal
	end
	local f36_local1 = CoD.CACUtility.loadoutSlotNames
	f36_local0.primaryWeapon = {}
	CoD.AddClassItemData( f36_local0.primaryWeapon, CoD.GetClassItem( f36_arg0, f36_arg1, f36_local1.primaryWeapon ) )
	f36_local0.secondaryWeapon = {}
	CoD.AddClassItemData( f36_local0.secondaryWeapon, CoD.GetClassItem( f36_arg0, f36_arg1, f36_local1.secondaryWeapon ) )
	f36_local0.primaryAttachments = {}
	f36_local0.secondaryAttachments = {}
	local f36_local2 = CoD.GetClassItem( f36_arg0, f36_arg1, f36_local1.primaryWeapon )
	local f36_local3 = CoD.GetClassItem( f36_arg0, f36_arg1, f36_local1.secondaryWeapon )
	for f36_local4 = 0, 2, 1 do
		CoD.AddClassAttachmentData( f36_local0.primaryAttachments, f36_local2, CoD.GetClassItem( f36_arg0, f36_arg1, f36_local1.primaryWeapon .. "attachment" .. f36_local4 + 1 ) )
		CoD.AddClassAttachmentData( f36_local0.secondaryAttachments, f36_local3, CoD.GetClassItem( f36_arg0, f36_arg1, f36_local1.secondaryWeapon .. "attachment" .. f36_local4 + 1 ) )
	end
	f36_local0.grenades = {}
	CoD.AddClassItemData( f36_local0.grenades, CoD.GetClassItem( f36_arg0, f36_arg1, f36_local1.primaryGrenade ), CoD.GetClassItem( f36_arg0, f36_arg1, "primarygrenadecount" ), f36_local1.primaryGrenade )
	CoD.AddClassItemData( f36_local0.grenades, CoD.GetClassItem( f36_arg0, f36_arg1, f36_local1.specialGrenade ), CoD.GetClassItem( f36_arg0, f36_arg1, "specialgrenadecount" ), f36_local1.specialGrenade )
	f36_local0.gadgets = {}
	CoD.AddClassItemData( f36_local0.gadgets, CoD.GetClassItem( f36_arg0, f36_arg1, f36_local1.primaryGadget ) )
	CoD.AddClassItemData( f36_local0.gadgets, CoD.GetClassItem( f36_arg0, f36_arg1, f36_local1.secondaryGadget ) )
	local f36_local4 = CoD.CACUtility.maxSpecialtySlots
	f36_local0.perks = {}
	for f36_local5 = 1, f36_local4, 1 do
		CoD.AddClassItemData( f36_local0.perks, CoD.GetClassItem( f36_arg0, f36_arg1, f36_local1["specialty" .. f36_local5] ) )
	end
	local f36_local5 = CoD.CACUtility.maxRewards
	f36_local0.rewards = {}
	for f36_local6 = 1, f36_local5, 1 do
		CoD.AddClassItemData( f36_local0.rewards, CoD.GetClassItem( f36_arg0, f36_arg1, "killstreak" .. f36_local6 ) )
	end
	table.sort( f36_local0.rewards, function ( f37_arg0, f37_arg1 )
		return f37_arg0.momentumCost < f37_arg1.momentumCost
	end )
	return f36_local0
end

CoD.CACUtility.GetLoadoutsMPOffline = function ( f38_arg0 )
	local f38_local0 = Engine.StorageGetBuffer( f38_arg0, Enum.StorageFileType.STORAGE_MP_LOADOUTS_OFFLINE )
	return f38_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsMPOnlinePublic = function ( f39_arg0 )
	local f39_local0 = Engine.StorageGetBuffer( f39_arg0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	return f39_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsMPOnlineCustom = function ( f40_arg0 )
	local f40_local0 = Engine.StorageGetBuffer( f40_arg0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	return f40_local0.customMatchCacLoadouts
end

CoD.CACUtility.GetLoadoutsMPOnlineLeague = function ( f41_arg0 )
	local f41_local0 = Engine.StorageGetBuffer( f41_arg0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	return f41_local0.leagueCacLoadouts
end

CoD.CACUtility.GetLoadoutsCPOffline = function ( f42_arg0 )
	local f42_local0 = Engine.StorageGetBuffer( f42_arg0, Enum.StorageFileType.STORAGE_CP_LOADOUTS_OFFLINE )
	return f42_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsCPOnline = function ( f43_arg0 )
	local f43_local0 = Engine.StorageGetBuffer( f43_arg0, Enum.StorageFileType.STORAGE_CP_LOADOUTS )
	return f43_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsZMOffline = function ( f44_arg0 )
	local f44_local0 = Engine.StorageGetBuffer( f44_arg0, Enum.StorageFileType.STORAGE_ZM_LOADOUTS_OFFLINE )
	return f44_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsZMOnline = function ( f45_arg0 )
	local f45_local0 = Engine.StorageGetBuffer( f45_arg0, Enum.StorageFileType.STORAGE_ZM_LOADOUTS )
	return f45_local0.cacLoadouts
end

CoD.CACUtility.SetDefaultCACRootOld = function ( f46_arg0 )
	if CoD.isOnlineGame() ~= true then
		local f46_local0 = CoD.perController[f46_arg0]
		local f46_local1 = CoD.GetPlayerStats( f46_arg0 )
		f46_local0.cacRoot = f46_local1.cacLoadouts
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
		local f46_local0 = CoD.perController[f46_arg0]
		local f46_local1 = CoD.GetPlayerStats( f46_arg0 )
		f46_local0.cacRoot = f46_local1.leagueCacLoadouts
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) then
		local f46_local0 = CoD.perController[f46_arg0]
		local f46_local1 = CoD.GetPlayerStats( f46_arg0 )
		f46_local0.cacRoot = f46_local1.customMatchCacLoadouts
	else
		local f46_local0 = CoD.perController[f46_arg0]
		local f46_local1 = CoD.GetPlayerStats( f46_arg0 )
		f46_local0.cacRoot = f46_local1.cacLoadouts
	end
end

CoD.CACUtility.SetDefaultCACRoot = function ( f47_arg0 )
	local f47_local0 = nil
	if CoD.isOnlineGame() ~= true then
		f47_local0 = CoD.CPMPZM( CoD.CACUtility.GetLoadoutsCPOffline, CoD.CACUtility.GetLoadoutsMPOffline, CoD.CACUtility.GetLoadoutsZMOffline )
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
		f47_local0 = CoD.CPMPZM( nil, CoD.CACUtility.GetLoadoutsMPOnlineLeague, nil )
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) then
		f47_local0 = CoD.CPMPZM( CoD.CACUtility.GetLoadoutsCPOnline, CoD.CACUtility.GetLoadoutsMPOnlineCustom, CoD.CACUtility.GetLoadoutsZMOnline )
	else
		f47_local0 = CoD.CPMPZM( CoD.CACUtility.GetLoadoutsCPOnline, CoD.CACUtility.GetLoadoutsMPOnlinePublic, CoD.CACUtility.GetLoadoutsZMOnline )
	end
	if f47_local0 ~= nil then
		CoD.perController[f47_arg0].cacRoot = f47_local0( f47_arg0 )
	else
		error( "LUI Error: could not set up loadout root - no valid game mode set" )
	end
end

CoD.CACUtility.SetGametypeSettingsCACRoot = function ( f48_arg0, f48_arg1 )
	local f48_local0 = nil
	if f48_arg1 == Enum.team_t.TEAM_FREE then
		f48_local0 = 0
	else
		f48_local0 = f48_arg1 - Enum.team_t.TEAM_FIRST_PLAYING_TEAM + 1
	end
	local f48_local1 = CoD.perController[f48_arg0]
	local f48_local2 = Engine.GetGametypeSettings()
	f48_local1.cacRoot = f48_local2.cacLoadouts[f48_local0]
end

CoD.CACUtility.GetCACRoot = function ( f49_arg0 )
	return CoD.perController[f49_arg0].cacRoot
end

CoD.CACUtility.GetLoadoutNames = function ( f50_arg0 )
	local f50_local0 = CoD.CACUtility.GetCACRoot( f50_arg0 )
	if f50_local0 then
		return f50_local0.customClassName
	else
		return nil
	end
end

CoD.CACUtility.GetLoadoutNameFromIndex = function ( f51_arg0, f51_arg1 )
	local f51_local0 = CoD.CACUtility.GetLoadoutNames( f51_arg0 )
	if f51_local0 then
		return f51_local0[f51_arg1]
	else
		return nil
	end
end

CoD.CACUtility.GetDefaultLoadoutNameFromIndex = function ( f52_arg0 )
	if f52_arg0 < 1 or f52_arg0 > CoD.CACUtility.maxDefaultClass then
		error( "LUI Error: Default loadout out with index " .. f52_arg0 .. " doesn't exist." )
	end
	return CoD.CACUtility.defaultClassNames[f52_arg0]
end

CoD.CACUtility.SetupCACLock = function ( f53_arg0 )
	CoD.SetupButtonLock( f53_arg0, nil, "FEATURE_CREATE_A_CLASS", "FEATURE_CREATE_A_CLASS_DESC" )
end

CoD.CACUtility.IsBonusCardEquippedByName = function ( f54_arg0, f54_arg1 )
	local f54_local0 = Engine.GetItemIndexFromReference( f54_arg1, CoD.PrestigeUtility.GetPermanentUnlockMode() )
	for f54_local1 = 1, CoD.CACUtility.maxBonusCards, 1 do
		if f54_local0 ~= nil and f54_arg0["bonuscard" .. f54_local1] == f54_local0 then
			return true
		end
	end
	return false
end

CoD.CACUtility.IsBonusCardEquippedByIndex = function ( f55_arg0, f55_arg1 )
	for f55_local0 = 1, CoD.CACUtility.maxBonusCards, 1 do
		if f55_arg1 ~= nil and f55_arg0["bonuscard" .. f55_local0] == f55_arg1 then
			return true
		end
	end
	return false
end

CoD.CACUtility.GetBonusCardLoadoutSlot = function ( f56_arg0, f56_arg1 )
	for f56_local0 = 1, CoD.CACUtility.maxBonusCards, 1 do
		local f56_local3 = "bonuscard" .. f56_local0
		if f56_arg1 ~= nil and f56_arg0[f56_local3] == f56_arg1 then
			return f56_local3
		end
	end
end

CoD.CACUtility.GetLoadoutSlotForAttachmentName = function ( f57_arg0, f57_arg1, f57_arg2 )
	local f57_local0 = CoD.CACUtility.PrimaryAttachmentSlotNameList
	if LUI.startswith( f57_arg1, "secondary" ) then
		f57_local0 = CoD.CACUtility.SecondaryAttachmentSlotNameList
	end
	for f57_local5, f57_local6 in ipairs( f57_local0 ) do
		local f57_local7 = Engine.GetModel( f57_arg0, f57_local6 )
		if f57_local7 then
			local f57_local4 = Engine.GetModel( f57_local7, "ref" )
			if f57_local4 and Engine.GetModelValue( f57_local4 ) == f57_arg2 then
				return f57_local6
			end
		end
	end
	return nil
end

CoD.CACUtility.GetAttachmentVariantForAttachmentList = function ( f58_arg0, f58_arg1 )
	local f58_local0 = CoD.CACUtility.PrimaryAttachmentSlotNameList
	if LUI.startswith( f58_arg1, "secondary" ) then
		f58_local0 = CoD.CACUtility.SecondaryAttachmentSlotNameList
	end
	local f58_local1 = {}
	for f58_local8, f58_local9 in ipairs( f58_local0 ) do
		local f58_local10 = Engine.GetModel( f58_arg0, f58_local9 )
		if f58_local10 then
			local f58_local5 = Engine.GetModel( f58_local10, "ref" )
			if f58_local5 then
				local f58_local6 = Engine.GetModelValue( f58_local5 )
				if f58_local6 ~= "" then
					local f58_local7 = Engine.GetModel( f58_arg0, f58_local9 .. "cosmeticvariant.itemIndex" )
					if f58_local7 then
						table.insert( f58_local1, {
							ref = f58_local6,
							attachmentIndex = Engine.GetModelValue( f58_local7 )
						} )
					end
				end
			end
		end
	end
	return f58_local1
end

CoD.CACUtility.IsAttachmentRefWeaponOption = function ( f59_arg0 )
	for f59_local0 = 0, #CoD.CACUtility.weaponOptionGroupNames - 1, 1 do
		if CoD.CACUtility.weaponOptionGroupNames[f59_local0] == f59_arg0 then
			return true
		end
	end
	return false
end

CoD.CACUtility.GetWeaponOptionTypeForName = function ( f60_arg0 )
	for f60_local0 = 0, #CoD.CACUtility.weaponOptionGroupNames - 1, 1 do
		if CoD.CACUtility.weaponOptionGroupNames[f60_local0] == f60_arg0 then
			return f60_local0
		end
	end
	return nil
end

CoD.CACUtility.UpdateWeaponPrestigeAttachment = function ( f61_arg0, f61_arg1, f61_arg2 )
	local f61_local0 = CoD.perController[f61_arg0].classModel
	local f61_local1 = CoD.perController[f61_arg0].weaponCategory
	local f61_local2 = f61_local1 .. f61_arg1
	local f61_local3 = nil
	if f61_local1 == "primary" then
		f61_local3 = CoD.CACUtility.PrimaryAttachmentSlotNameList
	elseif f61_local1 == "secondary" then
		f61_local3 = CoD.CACUtility.SecondaryAttachmentSlotNameList
	else
		return 
	end
	local f61_local4 = Engine.GetModel( f61_local0, f61_local1 .. ".itemIndex" )
	if f61_local4 then
		local f61_local5 = Engine.GetModelValue( f61_local4 )
		local f61_local6 = Engine.GetItemRef( f61_local5 ) .. "_" .. CoD.gameMode:lower()
		local f61_local7 = Engine.GetAttachmentRef( f61_local5, f61_arg2 )
		local f61_local8 = {}
		local f61_local9 = false
		for f61_local13, f61_local14 in ipairs( f61_local3 ) do
			local f61_local15 = Engine.GetModelValue( Engine.GetModel( f61_local0, f61_local14 .. ".itemIndex" ) )
			if CoD.CACUtility.EmptyItemIndex < f61_local15 then
				if f61_local14 ~= f61_local2 then
					table.insert( f61_local8, {
						index = f61_local15,
						ref = Engine.GetAttachmentRef( f61_local5, f61_local15 )
					} )
				else
					f61_local9 = true
				end
			end
		end
		for f61_local13, f61_local14 in ipairs( f61_local8 ) do
			local f61_local15 = f61_local14.ref
			local f61_local16 = f61_local14.index
			if (not Engine.IsOptic( f61_local5, f61_arg2 ) or not Engine.IsOptic( f61_local5, f61_local16 )) and Engine.AreAttachmentsCompatible( f61_local5, f61_arg2, f61_local16 ) then
				f61_local6 = f61_local6 .. "+" .. f61_local15
			end
		end
		f61_local6 = f61_local6 .. "+" .. f61_local7
		if f61_local6 and f61_local6 ~= "" then
			Engine.SendClientScriptNotify( f61_arg0, "CustomClass_focus" .. CoD.GetLocalClientAdjustedNum( f61_arg0 ), f61_local1, f61_local6, f61_local7, CoD.CACUtility.GetWeaponOptionsFromClass( f61_arg0, f61_local0, f61_local1 ), CoD.CACUtility.GetACVariantsFromClassExcludeAttachment( f61_arg0, f61_local0, f61_local2, f61_local7 ) .. f61_local7 .. "," .. 0, true )
		end
	end
end

CoD.CACUtility.GetAttachedItemSlot = function ( f62_arg0, f62_arg1, f62_arg2 )
	for f62_local4, f62_local5 in ipairs( f62_arg2 ) do
		local f62_local6 = Engine.GetModel( f62_arg0, f62_local5 )
		if f62_local6 then
			local f62_local3 = Engine.GetModel( f62_local6, "itemIndex" )
			if f62_local3 and Engine.GetModelValue( f62_local3 ) == f62_arg1 then
				return f62_local5
			end
		end
	end
	return nil
end

CoD.CACUtility.FindFirstEmptySlotInList = function ( f63_arg0, f63_arg1 )
	for f63_local4, f63_local5 in ipairs( f63_arg1 ) do
		local f63_local6 = Engine.GetModel( f63_arg0, f63_local5 )
		if f63_local6 then
			local f63_local3 = Engine.GetModel( f63_local6, "itemIndex" )
			if f63_local3 and Engine.GetModelValue( f63_local3 ) <= CoD.CACUtility.EmptyItemIndex then
				return f63_local5
			end
		end
	end
	return nil
end

CoD.CACUtility.IsBonusCardEquipped = function ( f64_arg0, f64_arg1 )
	if not f64_arg1 then
		return false
	elseif f64_arg1 then
		for f64_local4, f64_local5 in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
			local f64_local6 = Engine.GetModel( f64_arg1, f64_local5 )
			if f64_local6 then
				local f64_local3 = Engine.GetModel( f64_local6, "itemIndex" )
				if f64_local3 and Engine.GetItemRef( Engine.GetModelValue( f64_local3 ) ) == f64_arg0 then
					return true
				end
			end
		end
	end
	return false
end

CoD.CACUtility.SpecificWildcardEquippedCount = function ( f65_arg0, f65_arg1 )
	local f65_local0 = 0
	if f65_arg0 then
		local f65_local1 = Engine.GetItemIndexFromReference( f65_arg1 )
		for f65_local6, f65_local7 in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
			local f65_local8 = Engine.GetModel( f65_arg0, f65_local7 .. ".itemIndex" )
			if f65_local8 then
				local f65_local5 = Engine.GetModelValue( f65_local8 )
				if f65_local5 > CoD.CACUtility.EmptyItemIndex and LUI.startswith( Engine.GetItemRef( f65_local5 ), f65_arg1 ) then
					f65_local0 = f65_local0 + 1
				end
			end
		end
	end
	return math.min( math.max( f65_local0, 0 ), CoD.CACUtility.maxBonusCards )
end

CoD.CACUtility.PrimaryGunfighterEquippedCount = function ( f66_arg0 )
	local f66_local0 = 0
	for f66_local4, f66_local5 in ipairs( CoD.CACUtility.PrimaryGunfighterWildcards ) do
		if CoD.CACUtility.IsBonusCardEquipped( f66_local5, f66_arg0 ) then
			f66_local0 = f66_local0 + 1
		end
	end
	return math.min( math.max( f66_local0, 0 ), CoD.CACUtility.maxPrimaryGunfighters )
end

CoD.CACUtility.SearchForBonusCard = function ( f67_arg0, f67_arg1, f67_arg2 )
	if not f67_arg1 then
		return ""
	end
	local f67_local0 = f67_arg2 or CoD.perController[f67_arg1].classModel
	if f67_local0 then
		for f67_local5, f67_local6 in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
			local f67_local7 = Engine.GetModel( f67_local0, f67_local6 )
			if f67_local7 then
				local f67_local4 = Engine.GetModel( f67_local7, "itemIndex" )
				if f67_local4 and Engine.GetItemRef( Engine.GetModelValue( f67_local4 ) ) == f67_arg0 then
					return f67_local6
				end
			end
		end
	end
	return ""
end

CoD.CACUtility.GetItemRefEquippedInSlot = function ( f68_arg0, f68_arg1, f68_arg2 )
	if not f68_arg1 then
		return 
	end
	local f68_local0 = f68_arg2 or CoD.perController[f68_arg1].classModel
	if f68_local0 then
		local f68_local1 = Engine.GetModel( f68_local0, f68_arg0 )
		if f68_local1 then
			local f68_local2 = Engine.GetModel( f68_local1, "ref" )
			if f68_local2 then
				return Engine.GetModelValue( f68_local2 )
			end
		end
	end
end

CoD.CACUtility.IsItemEquippedInAnySlot = function ( f69_arg0, f69_arg1 )
	for f69_local3, f69_local4 in ipairs( f69_arg1 ) do
		if CoD.CACUtility.ItemEquippedInSlot( f69_local4, nil, f69_arg0 ) then
			return true
		end
	end
	return false
end

CoD.CACUtility.GetItemEquippedInSlot = function ( f70_arg0, f70_arg1, f70_arg2 )
	local f70_local0 = f70_arg2
	if not f70_local0 and f70_arg1 then
		f70_local0 = CoD.perController[f70_arg1].classModel
	end
	if f70_local0 then
		local f70_local1 = Engine.GetModel( f70_local0, f70_arg0 )
		if f70_local1 then
			local f70_local2 = Engine.GetModel( f70_local1, "itemIndex" )
			if f70_local2 then
				return Engine.GetModelValue( f70_local2 )
			end
		end
	end
	return CoD.CACUtility.EmptyItemIndex
end

CoD.CACUtility.ItemEquippedInSlot = function ( f71_arg0, f71_arg1, f71_arg2 )
	return CoD.CACUtility.EmptyItemIndex < CoD.CACUtility.GetItemEquippedInSlot( f71_arg0, f71_arg1, f71_arg2 )
end

CoD.CACUtility.DoesWeaponHaveDWInSlot = function ( f72_arg0, f72_arg1, f72_arg2 )
	if f72_arg0 ~= "primary" and f72_arg0 ~= "secondary" then
		return false
	end
	local f72_local0 = Engine.GetModel( f72_arg2, f72_arg0 )
	if f72_local0 then
		local f72_local1 = Engine.GetModelValue( Engine.GetModel( f72_local0, "itemIndex" ) )
		if f72_local1 > CoD.CACUtility.EmptyItemIndex then
			for f72_local6, f72_local7 in ipairs( CoD.CACUtility.GetAttachmentListForSlot( f72_arg0 ) ) do
				local f72_local8 = Engine.GetModelValue( Engine.GetModel( f72_arg2, f72_local7 .. ".itemIndex" ) )
				if f72_local8 > CoD.CACUtility.EmptyItemIndex then
					local f72_local5 = Engine.GetAttachmentRef( f72_local1, f72_local8 )
					if f72_local5 and f72_local5 == "dw" then
						return true
					end
				end
			end
		end
	end
	return false
end

CoD.CACUtility.DoesWeaponHaveAnyAttachments = function ( f73_arg0, f73_arg1, f73_arg2 )
	local f73_local0 = Engine.GetModel( f73_arg2, f73_arg0 )
	if f73_local0 then
		local f73_local1 = Engine.GetModelValue( Engine.GetModel( f73_local0, "itemIndex" ) )
		if f73_local1 > CoD.CACUtility.EmptyItemIndex and Engine.GetNumAttachments( f73_local1 ) > 1 then
			return true
		end
	end
	return false
end

CoD.CACUtility.GetItemName = function ( f74_arg0, f74_arg1, f74_arg2 )
	local f74_local0 = f74_arg2
	if not f74_local0 and f74_arg1 then
		f74_local0 = CoD.perController[f74_arg1].classModel
	end
	if f74_local0 then
		local f74_local1 = Engine.GetModel( f74_local0, f74_arg0 )
		if f74_local1 then
			local f74_local2 = Engine.GetModel( f74_local1, "name" )
			if f74_local2 then
				return Engine.GetModelValue( f74_local2 )
			end
		end
	end
	return ""
end

CoD.CACUtility.GetItemReferenceName = function ( f75_arg0, f75_arg1 )
	local f75_local0 = Engine.GetModel( f75_arg0, "itemIndex" )
	if f75_local0 then
		return Engine.GetItemRef( Engine.GetModelValue( f75_local0 ) )
	else
		return ""
	end
end

CoD.CACUtility.AllowTwoPrimaryTacticals = function ( f76_arg0 )
	local f76_local0
	if CoD.CACUtility.SearchForBonusCard( "bonuscard_danger_close", f76_arg0 ) == "" and CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", f76_arg0 ) == "" then
		f76_local0 = false
	else
		f76_local0 = true
	end
	return f76_local0
end

CoD.CACUtility.GetMutuallyExclusiveSlotName = function ( f77_arg0, f77_arg1, f77_arg2, f77_arg3 )
	local f77_local0 = Engine.GetItemRef( f77_arg2 )
	local f77_local1 = {}
	if not f77_arg3 then
		f77_arg3 = CoD.perController[f77_arg1].classModel
	end
	local f77_local2 = function ( f78_arg0, f78_arg1, f78_arg2 )
		if LUI.endswith( f77_local0, "_pro" ) and CoD.CACUtility.GetItemEquippedInSlot( f78_arg1, f78_arg0, f77_arg3 ) == Engine.GetItemIndexFromReference( string.sub( f77_local0, 1, -string.len( "_pro" ) - 1 ) ) then
			return f78_arg1
		else
			return ""
		end
	end
	
	if LUI.startswith( f77_arg0, "bonuscard" ) then
		if f77_local0 == "bonuscard_danger_close" then
			table.insert( f77_local1, CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", f77_arg1 ) )
		elseif f77_local0 == "bonuscard_two_tacticals" then
			table.insert( f77_local1, CoD.CACUtility.SearchForBonusCard( "bonuscard_danger_close", f77_arg1 ) )
		end
	elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", f77_arg1 ) and f77_arg0 == "primarygadget" then
		if CoD.CACUtility.GetItemEquippedInSlot( "secondarygadget", f77_arg1, f77_arg3 ) == f77_arg2 then
			table.insert( f77_local1, "secondarygadget" )
		end
	elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", f77_arg1 ) and f77_arg0 == "secondarygadget" then
		if CoD.CACUtility.GetItemEquippedInSlot( "primarygadget", f77_arg1, f77_arg3 ) == f77_arg2 then
			table.insert( f77_local1, "primarygadget" )
		end
	elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_overkill", f77_arg1 ) and f77_arg0 == "primary" then
		if CoD.CACUtility.GetItemEquippedInSlot( "secondary", f77_arg1, f77_arg3 ) == f77_arg2 then
			table.insert( f77_local1, "secondary" )
		end
	elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_overkill", f77_arg1 ) and f77_arg0 == "secondary" then
		if CoD.CACUtility.GetItemEquippedInSlot( "primary", f77_arg1, f77_arg3 ) == f77_arg2 then
			table.insert( f77_local1, "primary" )
		end
	elseif CoD.CACUtility.IsSlotNameInList( CoD.CACUtility.PrimaryAttachmentSlotNameList, f77_arg0 ) or CoD.CACUtility.IsSlotNameInList( CoD.CACUtility.SecondaryAttachmentSlotNameList, f77_arg0 ) then
		local f77_local3 = CoD.CACUtility.GetAttachmentListForSlot( f77_arg0 )
		local f77_local4 = "primary"
		if LUI.startswith( f77_arg0, "secondary" ) then
			f77_local4 = "secondary"
		end
		local f77_local5 = CoD.CACUtility.GetItemEquippedInSlot( f77_local4, f77_arg1, f77_arg3 )
		for f77_local9, f77_local10 in ipairs( f77_local3 ) do
			local f77_local11 = CoD.CACUtility.GetItemEquippedInSlot( f77_local10, f77_arg1, f77_arg3 )
			if f77_local11 ~= f77_arg2 and not Engine.AreAttachmentsCompatible( f77_local5, f77_local11, f77_arg2 ) then
				table.insert( f77_local1, f77_local10 )
			end
		end
	elseif f77_arg0 == "cybercom_tacrig1" then
		if CoD.CACUtility.GetItemEquippedInSlot( "cybercom_tacrig2", f77_arg1, f77_arg3 ) == f77_arg2 then
			table.insert( f77_local1, "cybercom_tacrig2" )
		end
		local f77_local3 = f77_local2( f77_arg1, "cybercom_tacrig2", f77_arg2 )
		if f77_local3 ~= "" then
			table.insert( f77_local1, f77_local3 )
		end
	elseif f77_arg0 == "cybercom_tacrig2" then
		if CoD.CACUtility.GetItemEquippedInSlot( "cybercom_tacrig1", f77_arg1, f77_arg3 ) == f77_arg2 then
			table.insert( f77_local1, "cybercom_tacrig1" )
		end
		local f77_local3 = f77_local2( f77_arg1, "cybercom_tacrig1", f77_arg2 )
		if f77_local3 ~= "" then
			table.insert( f77_local1, f77_local3 )
		end
	end
	return f77_local1
end

CoD.CACUtility.AttachmentHasCustomReticle = function ( f79_arg0 )
	return CoD.CACUtility.attachmentsWithCustReticle[f79_arg0] ~= nil
end

CoD.CACUtility.GetWeaponOptionMTXName = function ( f80_arg0 )
	return Engine.TableLookup( nil, CoD.attachmentTable, 0, f80_arg0, 16 )
end

CoD.CACUtility.GetBackingMTXName = function ( f81_arg0 )
	return Engine.TableLookup( nil, "gamedata/emblems/emblemsOrBackings.csv", 0, "background", 1, f81_arg0, 10 )
end

CoD.CACUtility.IsWeaponOptionMTX = function ( f82_arg0 )
	local f82_local0 = CoD.CACUtility.GetWeaponOptionMTXName( f82_arg0 )
	return f82_local0 and f82_local0 ~= ""
end

CoD.CACUtility.IsBackingMTX = function ( f83_arg0 )
	local f83_local0 = CoD.CACUtility.GetBackingMTXName( f83_arg0 )
	return f83_local0 and f83_local0 ~= ""
end

CoD.CACUtility.IsAnyWeaponMTXAvailable = function ()
	for f84_local0 = 0, CoD.CACUtility.maxMTXWeaponPacks, 1 do
		if Engine.IsMTXAvailable( "mtx_weapon" .. f84_local0 ) then
			return true
		end
	end
	return false
end

CoD.CACUtility.HasAnyWeaponMTX = function ( f85_arg0 )
	for f85_local0 = 0, CoD.CACUtility.maxMTXWeaponPacks, 1 do
		if Engine.HasMTX( f85_arg0, "mtx_weapon" .. f85_local0 ) then
			return true
		end
	end
	return false
end

CoD.CACUtility.ShouldDisplayWeaponOptionMTX = function ( f86_arg0, f86_arg1 )
	if Engine.SkipMTXItem( CoD.CACUtility.GetWeaponOptionMTXName( f86_arg1 ) ) == true then
		return false
	else
		return true
	end
end

CoD.CACUtility.GetMTXPurchaseMsg = function ( f87_arg0 )
	return "MPUI_" .. Engine.TableLookup( nil, "mp/mtxitems.csv", 1, f87_arg0, 3 ) .. "_MSG"
end

CoD.CACUtility.SelectedClassIndex = {}
CoD.CACUtility.IsOnlineGame = function ()
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false and not Engine.SessionMode_IsSystemlinkGame() then
		return true
	else
		return false
	end
end

CoD.CACUtility.SetProfileLoadoutChoice = function ( f89_arg0, f89_arg1 )
	local f89_local0 = "lastLoadoutSystemlink"
	if CoD.CACUtility.IsOnlineGame() == true then
		if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
			f89_local0 = "lastLoadoutLeague"
		else
			f89_local0 = "lastLoadoutOnline"
		end
	end
	Engine.SetProfileVar( f89_arg0, f89_local0, f89_arg1 )
	Engine.CommitProfileChanges( f89_arg0 )
	CoD.CACUtility.SelectedClassIndex[f89_arg0] = f89_arg1
end

CoD.CACUtility.GetEquipmentLabel = function ( f90_arg0, f90_arg1 )
	local f90_local0 = false
	local f90_local1 = "BAD EQUIPMENT LABEL"
	if f90_local0 then
		if f90_arg0 == CoD.CACUtility.loadoutSlotNames.primaryGadget then
			f90_local1 = Engine.Localize( "MPUI_PRIMARY_GADGET_CAPS" )
		elseif f90_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryGadget then
			f90_local1 = Engine.Localize( "MPUI_SECONDARY_GADGET_CAPS" )
		end
	elseif f90_arg0 == CoD.CACUtility.loadoutSlotNames.primaryGadget then
		if f90_arg1 ~= nil and CoD.CACUtility.IsBonusCardEquippedByName( f90_arg1, "bonuscard_two_tacticals" ) then
			f90_local1 = Engine.Localize( "MPUI_SECOND_SPECIAL_GRENADE_CAPS" )
		else
			f90_local1 = Engine.Localize( "MPUI_PRIMARY_GRENADE_CAPS" )
		end
	elseif f90_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryGadget then
		f90_local1 = Engine.Localize( "MPUI_SPECIAL_GRENADE_CAPS" )
	end
	return f90_local1
end

CoD.CACUtility.UpdateHeaderNames = function ( f91_arg0, f91_arg1, f91_arg2, f91_arg3 )
	local f91_local0 = Engine.GetCustomClass( f91_arg0, f91_arg1, CoD.PrestigeUtility.GetPermanentUnlockMode(), f91_arg3 )
	local f91_local1 = "MPUI_SECONDARY_WEAPON_CAPS"
	local f91_local2 = "MPUI_PRIMARYGRENADE_CAPS"
	local f91_local3 = "MPUI_SPECIALGRENADE_CAPS"
	if CoD.CACUtility.IsBonusCardEquippedByName( f91_local0, "bonuscard_overkill" ) == true then
		f91_local1 = "MPUI_SECOND_PRIMARY_CAPS"
	end
	if CoD.CACUtility.IsBonusCardEquippedByName( f91_local0, "bonuscard_two_tacticals" ) == true then
		f91_local2 = "MPUI_SECOND_SPECIAL_GRENADE_CAPS"
		f91_local3 = "MPUI_FIRST_SPECIAL_GRENADE_CAPS"
	end
	Engine.SetModelValue( Engine.CreateModel( f91_arg2, "secondary.headerName" ), f91_local1 )
	Engine.SetModelValue( Engine.CreateModel( f91_arg2, "primarygadget.headerName" ), f91_local2 )
	Engine.SetModelValue( Engine.CreateModel( f91_arg2, "primarygadgetattachment1.headerName" ), f91_local2 )
	Engine.SetModelValue( Engine.CreateModel( f91_arg2, "secondarygadget.headerName" ), f91_local3 )
	Engine.SetModelValue( Engine.CreateModel( f91_arg2, "secondarygadgetattachment1.headerName" ), f91_local3 )
	if not Engine.GetModel( f91_arg2, "primary.headerName" ) then
		Engine.SetModelValue( Engine.CreateModel( f91_arg2, "primary.headerName" ), "MPUI_PRIMARY_WEAPON_CAPS" )
		for f91_local7, f91_local8 in ipairs( CoD.CACUtility.PrimaryAttachmentSlotNameList ) do
			if f91_local7 == 1 then
				Engine.SetModelValue( Engine.CreateModel( f91_arg2, f91_local8 .. ".headerName" ), "MPUI_PRIMARY_OPTIC_CAPS" )
			else
				Engine.SetModelValue( Engine.CreateModel( f91_arg2, f91_local8 .. ".headerName" ), "MPUI_PRIMARY_ATTACHMENT_CAPS" )
			end
		end
		for f91_local7, f91_local8 in ipairs( CoD.CACUtility.SecondaryAttachmentSlotNameList ) do
			if f91_local7 == 1 then
				Engine.SetModelValue( Engine.CreateModel( f91_arg2, f91_local8 .. ".headerName" ), "MPUI_SECONDARY_OPTIC_CAPS" )
			else
				Engine.SetModelValue( Engine.CreateModel( f91_arg2, f91_local8 .. ".headerName" ), "MPUI_SECONDARY_ATTACHMENT_CAPS" )
			end
		end
		for f91_local7, f91_local8 in ipairs( CoD.CACUtility.Perk1SlotNameList ) do
			Engine.SetModelValue( Engine.CreateModel( f91_arg2, f91_local8 .. ".headerName" ), "MPUI_PERK1_CAPS" )
		end
		for f91_local7, f91_local8 in ipairs( CoD.CACUtility.Perk2SlotNameList ) do
			Engine.SetModelValue( Engine.CreateModel( f91_arg2, f91_local8 .. ".headerName" ), "MPUI_PERK2_CAPS" )
		end
		for f91_local7, f91_local8 in ipairs( CoD.CACUtility.Perk3SlotNameList ) do
			Engine.SetModelValue( Engine.CreateModel( f91_arg2, f91_local8 .. ".headerName" ), "MPUI_PERK3_CAPS" )
		end
		for f91_local7, f91_local8 in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
			Engine.SetModelValue( Engine.CreateModel( f91_arg2, f91_local8 .. ".headerName" ), "MENU_WILDCARD_CAPS" )
		end
	end
	local f91_local4 = "MENU_TACTICAL_RIG_CAPS"
	Engine.SetModelValue( Engine.CreateModel( f91_arg2, "cybercom_tacrig1.headerName" ), f91_local4 )
	Engine.SetModelValue( Engine.CreateModel( f91_arg2, "cybercom_tacrig2.headerName" ), f91_local4 )
end

CoD.CACUtility.AddBigImagesToCustomClassModel = function ( f92_arg0, f92_arg1, f92_arg2, f92_arg3 )
	local f92_local0 = Engine.GetModel( f92_arg1, f92_arg2 )
	if not f92_local0 then
		return 
	end
	local f92_local1 = Engine.GetModel( f92_local0, "image" )
	if f92_local1 then
		local f92_local2 = Engine.GetModelValue( f92_local1 )
		if f92_local2 then
			if f92_local2 == CoD.CACUtility.DefaultLoadoutImage then
				f92_arg3 = ""
			end
			Engine.SetModelValue( Engine.CreateModel( f92_local0, "image_big" ), f92_local2 .. f92_arg3 )
		end
	end
end

CoD.CACUtility.GetBonucardUnlockHint = function ( f93_arg0, f93_arg1, f93_arg2 )
	local f93_local0 = Engine.GetItemIndexFromReference( f93_arg1, f93_arg2 )
	return Engine.Localize( f93_arg0, Engine.GetItemName( f93_local0, f93_arg2 ), Engine.GetItemUnlockLevel( f93_local0, f93_arg2 ) + 1 )
end

CoD.CACUtility.IsCPHeroWeapon = function ( f94_arg0 )
	local f94_local0 = Engine.GetItemRef( f94_arg0 )
	local f94_local1 = IsCampaign()
	if f94_local1 then
		if f94_local0 ~= "hero_annihilator" and f94_local0 ~= "hero_pineapplegun" then
			f94_local1 = false
		else
			f94_local1 = true
		end
	end
	return f94_local1
end

CoD.CACUtility.GetCACSlotStatus = function ( f95_arg0, f95_arg1, f95_arg2 )
	local f95_local0 = CoD.CACUtility.CACStatusAvailable.AVAILABLE
	local f95_local1 = false
	local f95_local2 = ""
	local f95_local3 = nil
	local f95_local4 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	if CoD.CACUtility.ItemEquippedInSlot( f95_arg2, f95_arg0, f95_arg1 ) then
		f95_local1 = true
		if f95_arg2 == "primary" or f95_arg2 == "secondary" then
			if CoD.CACUtility.IsCPHeroWeapon( CoD.CACUtility.GetItemEquippedInSlot( f95_arg2, f95_arg0, f95_arg1 ) ) then
				f95_local2 = "MPUI_EQUIP_WEAPON"
			elseif Engine.LastInput_Gamepad( f95_arg0 ) then
				f95_local2 = "MPUI_BUTTON_PERSONALIZE_CAPS"
			end
		elseif LUI.startswith( f95_arg2, "primaryattachment" ) or LUI.startswith( f95_arg2, "secondaryattachment" ) then
			if f95_arg2 == "primaryattachment1" or f95_arg2 == "secondaryattachment1" then
				if CoD.CACUtility.attachmentsWithCustReticle[CoD.CACUtility.GetItemRefEquippedInSlot( f95_arg2, f95_arg0, f95_arg1 )] and Engine.LastInput_Gamepad( f95_arg0 ) then
					f95_local2 = "MPUI_BUTTON_PERSONALIZE_CAPS"
				end
			elseif Engine.LastInput_Gamepad( f95_arg0 ) then
				f95_local2 = "MPUI_BUTTON_PERSONALIZE_CAPS"
			end
		end
	elseif f95_arg2 == "primary" or f95_arg2 == "secondary" then
		f95_local2 = "MPUI_EQUIP_WEAPON"
	elseif f95_arg2 == "primarygadget" then
		if CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", f95_arg0 ) ~= "" then
			f95_local2 = "MPUI_EQUIP_TACTICAL"
		else
			f95_local2 = "MPUI_EQUIP_LETHAL"
		end
	elseif f95_arg2 == "secondarygadget" then
		f95_local2 = "MPUI_EQUIP_TACTICAL"
	elseif LUI.startswith( f95_arg2, "specialty" ) then
		f95_local2 = "MPUI_EQUIP_PERK"
		if f95_arg2 == "specialty4" then
			if IsNonAttachmentItemLocked( f95_arg0, "bonuscard_perk_1_greed" ) then
				f95_local2 = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_perk_1_greed", f95_local4 )
				f95_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_1_greed", f95_arg0, f95_arg1 ) == "" then
				f95_local2 = "MPUI_REQUIRES_PERK_1_GREED"
				f95_local0 = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			end
		elseif f95_arg2 == "specialty5" then
			if IsNonAttachmentItemLocked( f95_arg0, "bonuscard_perk_2_greed" ) then
				f95_local2 = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_perk_2_greed", f95_local4 )
				f95_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_2_greed", f95_arg0, f95_arg1 ) == "" then
				f95_local2 = "MPUI_REQUIRES_PERK_2_GREED"
				f95_local0 = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			end
		elseif f95_arg2 == "specialty6" then
			if IsNonAttachmentItemLocked( f95_arg0, "bonuscard_perk_3_greed" ) then
				f95_local2 = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_perk_3_greed", f95_local4 )
				f95_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_3_greed", f95_arg0, f95_arg1 ) == "" then
				f95_local2 = "MPUI_REQUIRES_PERK_3_GREED"
				f95_local0 = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			end
		end
	elseif LUI.startswith( f95_arg2, "primaryattachment" ) then
		local f95_local5 = CoD.CACUtility.GetItemEquippedInSlot( "primary", f95_arg0, f95_arg1 )
		local f95_local6 = Engine.GetNumAttachments( f95_local5, f95_local4 )
		if f95_arg2 == "primaryattachment1" then
			f95_local2 = "MPUI_EQUIP_OPTIC"
		else
			f95_local2 = "MPUI_EQUIP_ATTACHMENT"
		end
		if f95_local5 <= CoD.CACUtility.EmptyItemIndex then
			f95_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			if f95_arg2 == "primaryattachment1" then
				f95_local2 = "MPUI_OPTICS_NOT_AVAILABLE"
			else
				f95_local2 = "MPUI_ATTACHMENTS_NOT_AVAILABLE"
			end
		elseif f95_arg2 == "primaryattachment1" and Engine.GetNumOptics( f95_local5, f95_local4 ) <= 1 then
			f95_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			f95_local2 = "MPUI_OPTICS_NOT_AVAILABLE"
		elseif (f95_arg2 == "primaryattachment2" or f95_arg2 == "primaryattachment3") and f95_local6 <= 1 then
			f95_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			f95_local2 = "MPUI_ATTACHMENTS_NOT_AVAILABLE"
		elseif f95_arg2 == "primaryattachment4" or f95_arg2 == "primaryattachment5" or f95_arg2 == "primaryattachment6" then
			if f95_local6 <= 1 then
				f95_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
				f95_local2 = "MPUI_ATTACHMENTS_NOT_AVAILABLE"
			elseif IsNonAttachmentItemLocked( f95_arg0, "bonuscard_primary_gunfighter" ) then
				f95_local2 = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_primary_gunfighter", f95_local4 )
				f95_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			else
				local f95_local7 = CoD.CACUtility.PrimaryGunfighterEquippedCount( f95_arg1 )
				if not (f95_arg2 ~= "primaryattachment4" or f95_local7 >= 1) or not (f95_arg2 ~= "primaryattachment5" or f95_local7 >= 2) or f95_arg2 == "primaryattachment6" and f95_local7 < 3 then
					f95_local2 = "MPUI_REQUIRES_PRIMARY_GUNFIGHTER"
					f95_local0 = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
				end
			end
		end
	elseif LUI.startswith( f95_arg2, "secondaryattachment" ) then
		local f95_local5 = CoD.CACUtility.GetItemEquippedInSlot( "secondary", f95_arg0, f95_arg1 )
		local f95_local6 = Engine.GetNumAttachments( f95_local5, f95_local4 )
		if f95_arg2 == "secondaryattachment1" then
			f95_local2 = "MPUI_EQUIP_OPTIC"
		else
			f95_local2 = "MPUI_EQUIP_ATTACHMENT"
		end
		if f95_local5 <= CoD.CACUtility.EmptyItemIndex then
			f95_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			if f95_arg2 == "secondaryattachment1" then
				f95_local2 = "MPUI_OPTICS_NOT_AVAILABLE"
			else
				f95_local2 = "MPUI_ATTACHMENTS_NOT_AVAILABLE"
			end
		elseif f95_arg2 == "secondaryattachment1" and Engine.GetNumOptics( f95_local5, f95_local4 ) <= 1 then
			f95_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			f95_local2 = "MPUI_OPTICS_NOT_AVAILABLE"
		elseif f95_arg2 == "secondaryattachment2" and f95_local6 <= 1 then
			f95_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			f95_local2 = "MPUI_ATTACHMENTS_NOT_AVAILABLE"
		elseif f95_arg2 == "secondaryattachment3" then
			if f95_local6 <= 1 then
				f95_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
				f95_local2 = "MPUI_ATTACHMENTS_NOT_AVAILABLE"
			elseif IsNonAttachmentItemLocked( f95_arg0, "bonuscard_secondary_gunfighter" ) then
				f95_local2 = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_secondary_gunfighter", f95_local4 )
				f95_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_secondary_gunfighter", f95_arg0, f95_arg1 ) == "" then
				f95_local2 = "MPUI_REQUIRES_SECONDARY_GUNFIGHTER"
				f95_local0 = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			end
		end
	elseif LUI.startswith( f95_arg2, "primarygadgetattachment" ) then
		local f95_local5 = CoD.CACUtility.GetItemEquippedInSlot( "primarygadget", f95_arg0, f95_arg1 )
		f95_local3 = CoD.CACUtility.GetItemName( "primarygadget", f95_arg0, f95_arg1 )
		f95_local2 = "MPUI_EQUIP_TAKE_TWO"
		if not f95_local5 or f95_local5 <= CoD.CACUtility.EmptyItemIndex then
			f95_local2 = "MPUI_TAKE_TWO_NOT_AVAILABLE"
			f95_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
		elseif IsNonAttachmentItemLocked( f95_arg0, "bonuscard_danger_close" ) then
			f95_local2 = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_danger_close", f95_local4 )
			f95_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
		elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_danger_close", f95_arg0 ) == "" and CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", f95_arg0 ) == "" then
			f95_local0 = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			f95_local2 = "MPUI_REQUIRES_DANGER_CLOSE"
		end
	elseif LUI.startswith( f95_arg2, "secondarygadgetattachment" ) then
		local f95_local5 = CoD.CACUtility.GetItemEquippedInSlot( "secondarygadget", f95_arg0, f95_arg1 )
		local f95_local6 = CoD.CACUtility.GetItemName( "secondarygadget", f95_arg0, f95_arg1 )
		f95_local2 = "MPUI_EQUIP_TAKE_TWO"
		f95_local3 = f95_local6
		if f95_local5 <= CoD.CACUtility.EmptyItemIndex or not Engine.GadgetHasTakeTwoAttachment( f95_local5, f95_local4 ) then
			f95_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			f95_local2 = "MPUI_TAKE_TWO_NOT_AVAILABLE"
		end
	elseif LUI.startswith( f95_arg2, "bonuscard" ) then
		f95_local2 = "MPUI_EQUIP_WILDCARD"
	elseif LUI.startswith( f95_arg2, "cybercom_tacrig" ) then
		f95_local2 = "MPUI_EQUIP_TACRIG"
	end
	return f95_local0, f95_local1, f95_local2, f95_local3
end

CoD.CACUtility.GetNextAvailablePrimaryGunfighter = function ( f96_arg0 )
	if f96_arg0 then
		for f96_local3, f96_local4 in ipairs( CoD.CACUtility.PrimaryGunfighterWildcards ) do
			if not CoD.CACUtility.IsBonusCardEquipped( f96_local4, f96_arg0 ) then
				return f96_local4
			end
		end
	end
	return ""
end

CoD.CACUtility.WildcardNeededForSlot = function ( f97_arg0, f97_arg1 )
	local f97_local0 = CoD.perController[f97_arg0].classModel
	local f97_local1 = nil
	local f97_local2 = false
	local f97_local3 = true
	if f97_arg1 == "specialty4" then
		f97_local1 = "bonuscard_perk_1_greed"
		f97_local2 = true
		f97_local3 = IsNonAttachmentItemLocked( f97_arg0, f97_local1 )
	elseif f97_arg1 == "specialty5" then
		f97_local1 = "bonuscard_perk_2_greed"
		f97_local2 = true
		f97_local3 = IsNonAttachmentItemLocked( f97_arg0, f97_local1 )
	elseif f97_arg1 == "specialty6" then
		f97_local1 = "bonuscard_perk_3_greed"
		f97_local2 = true
		f97_local3 = IsNonAttachmentItemLocked( f97_arg0, f97_local1 )
	elseif f97_arg1 == "primaryattachment4" or f97_arg1 == "primaryattachment5" or f97_arg1 == "primaryattachment6" then
		f97_local1 = CoD.CACUtility.GetNextAvailablePrimaryGunfighter( f97_local0 )
		f97_local2 = CoD.CACUtility.ItemEquippedInSlot( "primary", f97_arg0, f97_local0 )
		f97_local3 = IsNonAttachmentItemLocked( f97_arg0, f97_local1 )
	elseif f97_arg1 == "secondaryattachment3" then
		local f97_local4 = Engine.GetNumAttachments( CoD.CACUtility.GetItemEquippedInSlot( "secondary", f97_arg0, f97_local0 ) )
		f97_local1 = "bonuscard_secondary_gunfighter"
		if f97_local4 > 1 then
			f97_local2 = CoD.CACUtility.ItemEquippedInSlot( "secondary", f97_arg0, f97_local0 )
		else
			f97_local2 = false
		end
		f97_local3 = IsNonAttachmentItemLocked( f97_arg0, f97_local1 )
	elseif f97_arg1 == "primarygadgetattachment1" then
		f97_local1 = "bonuscard_danger_close"
		f97_local2 = CoD.CACUtility.ItemEquippedInSlot( "primarygadget", f97_arg0, f97_local0 )
		f97_local3 = IsNonAttachmentItemLocked( f97_arg0, f97_local1 )
	end
	return f97_local1, f97_local2, f97_local3
end

CoD.CACUtility.UpdateGrenadeNames = function ( f98_arg0, f98_arg1, f98_arg2 )
	local f98_local0 = function ( f99_arg0 )
		local f99_local0 = Engine.CreateModel( f98_arg2, f99_arg0 .. ".modifiedName" )
		if CoD.CACUtility.ItemEquippedInSlot( f99_arg0, f98_arg0, f98_arg2 ) then
			local f99_local1 = Engine.GetModel( f98_arg2, f99_arg0 .. ".name" )
			if f99_local1 and f99_local0 then
				local f99_local2 = Engine.GetModelValue( f99_local1 )
				if CoD.CACUtility.ItemEquippedInSlot( f99_arg0 .. "attachment1", f98_arg0, f98_arg2 ) then
					f99_local2 = Engine.Localize( "MPUI_X2_GRENADE", f99_local2 )
				end
				Engine.SetModelValue( f99_local0, f99_local2 )
			end
		else
			Engine.SetModelValue( f99_local0, "" )
		end
	end
	
	f98_local0( "primarygadget" )
	f98_local0( "secondarygadget" )
end

CoD.CACUtility.UpdateEmptySlotImages = function ( f100_arg0, f100_arg1, f100_arg2 )
	local f100_local0 = Engine.GetCustomClass( f100_arg0, f100_arg1, CoD.PrestigeUtility.GetPermanentUnlockMode() )
	local f100_local1 = CoD.CACUtility.IsBonusCardEquippedByName( f100_local0, "bonuscard_overkill" )
	local f100_local2 = CoD.CACUtility.IsBonusCardEquippedByName( f100_local0, "bonuscard_two_tacticals" )
	for f100_local7, f100_local6 in pairs( CoD.CACUtility.emptyImageSlotList ) do
		local f100_local8 = Engine.GetModel( f100_arg2, f100_local7 )
		if f100_local8 then
			if f100_local7 == "secondary" and f100_local1 == true then
				f100_local6 = CoD.CACUtility.emptyImageSlotList.primary
			elseif LUI.startswith( f100_local7, "primarygadget" ) and f100_local2 == true then
				f100_local6 = CoD.CACUtility.emptyImageSlotList.secondarygadget
			end
			Engine.SetModelValue( Engine.CreateModel( f100_local8, "emptyImage" ), f100_local6 )
		end
	end
end

CoD.CACUtility.GetCustomClassModel = function ( f101_arg0, f101_arg1, f101_arg2, f101_arg3 )
	Engine.GetCustomClassModel( f101_arg0, f101_arg1, f101_arg2, CoD.PrestigeUtility.GetPermanentUnlockMode(), f101_arg3 )
	Engine.SetModelValue( Engine.CreateModel( f101_arg2, "classNum" ), f101_arg1 )
	if CoD.perController[f101_arg0].isPreset == true then
		local f101_local0 = Engine.GetModel( f101_arg2, "customClassName" )
		Engine.SetModelValue( f101_local0, Engine.Localize( Engine.GetModelValue( f101_local0 ) ) )
	end
	if IsCampaign() and f101_arg1 >= 5 and f101_arg1 <= 8 then
		Engine.SetModelValue( Engine.GetModel( f101_arg2, "customClassName" ), Engine.Localize( "CPUI_FIELD_OPS_KIT" ) )
	end
	if f101_arg1 >= 10 then
		Engine.SetModelValue( Engine.CreateModel( f101_arg2, "defaultClassName" ), Engine.GetDefaultClassName( f101_arg1 - 10 ) )
	end
	CoD.CACUtility.UpdateHeaderNames( f101_arg0, f101_arg1, f101_arg2, f101_arg3 )
	local f101_local0 = function ( f102_arg0 )
		local f102_local0 = Engine.GetModel( f101_arg2, f102_arg0 .. "gunsmithvariant" )
		if f102_local0 then
			local f102_local1 = Engine.CreateModel( f101_arg2, f102_arg0 .. ".variantName" )
			local f102_local2 = Engine.GetModelValue( Engine.GetModel( f102_local0, "itemIndex" ) )
			if f102_local2 > CoD.CACUtility.EmptyItemIndex then
				local f102_local3 = CoD.CraftUtility.Gunsmith.GetVariantIndexFromCACVaraintIndex( f101_arg0, f102_local2 )
				if f102_local3 then
					Engine.SetModelValue( f102_local1, f102_local3.variantName )
				end
			else
				Engine.SetModelValue( f102_local1, "" )
			end
		end
	end
	
	if not Engine.IsInGame() then
		f101_local0( "primary" )
		f101_local0( "secondary" )
	end
	local f101_local1 = function ( f103_arg0 )
		local f103_local0 = Engine.GetModel( f101_arg2, f103_arg0 )
		if not f103_local0 then
			return 
		end
		local f103_local1 = Engine.GetModel( f103_local0, "image" )
		if f103_local1 then
			local f103_local2 = Engine.GetModelValue( f103_local1 )
			if f103_local2 and f103_local2 ~= CoD.CACUtility.DefaultLoadoutImage then
				Engine.SetModelValue( f103_local1, f103_local2 )
			end
		end
	end
	
	f101_local1( "primary" )
	f101_local1( "secondary" )
	local f101_local2 = function ( f104_arg0, f104_arg1, f104_arg2 )
		for f104_local4, f104_local5 in ipairs( f104_arg1 ) do
			local f104_local6 = Engine.GetModelValue( Engine.GetModel( f101_arg2, f104_local5 .. ".itemIndex" ) )
			if f104_local6 > CoD.CACUtility.EmptyItemIndex and Engine.GetModelValue( Engine.GetModel( f101_arg2, f104_arg2[f104_local4] .. ".itemIndex" ) ) > CoD.CACUtility.EmptyItemIndex then
				local f104_local3 = Engine.GetAttachmentCosmeticVariant( Engine.GetWeaponString( f101_arg0, f101_arg1, f104_arg0 ), Engine.GetItemAttachment( Engine.GetModelValue( Engine.GetModel( f101_arg2, f104_arg0 .. ".itemIndex" ) ), f104_local6 ) )
				if f104_local3 then
					Engine.SetModelValue( Engine.GetModel( f101_arg2, f104_local5 .. ".image" ), f104_local3.image )
					Engine.SetModelValue( Engine.GetModel( f101_arg2, f104_local5 .. "cosmeticvariant.image" ), f104_local3.image )
					Engine.SetModelValue( Engine.GetModel( f101_arg2, f104_local5 .. "cosmeticvariant.name" ), f104_local3.name )
				end
			end
		end
	end
	
	f101_local2( "primary", CoD.CACUtility.PrimaryAttachmentSlotNameList, CoD.CACUtility.PrimaryAttachmentCVSlotNameList )
	f101_local2( "secondary", CoD.CACUtility.SecondaryAttachmentSlotNameList, CoD.CACUtility.SecondaryAttachmentCVSlotNameList )
	CoD.CACUtility.AddBigImagesToCustomClassModel( f101_arg0, f101_arg2, "primary", "_big" )
	CoD.CACUtility.AddBigImagesToCustomClassModel( f101_arg0, f101_arg2, "secondary", "_big" )
	CoD.CACUtility.AddBigImagesToCustomClassModel( f101_arg0, f101_arg2, "primarygadget", "_256" )
	CoD.CACUtility.AddBigImagesToCustomClassModel( f101_arg0, f101_arg2, "secondarygadget", "_256" )
	CoD.CACUtility.AddBigImagesToCustomClassModel( f101_arg0, f101_arg2, "specialgadget", "_256" )
	DataSources.CustomClassMenu.updateWeaponAttachmentList( f101_arg0, f101_arg2, "primary", CoD.CACUtility.maxPrimaryAttachments )
	DataSources.CustomClassMenu.updateWeaponAttachmentList( f101_arg0, f101_arg2, "secondary", CoD.CACUtility.maxSecondaryAttachments )
	DataSources.CustomClassMenu.updateCustomSlotModel( f101_arg2, "primarygadget", f101_arg0 )
	DataSources.CustomClassMenu.updateCustomSlotModel( f101_arg2, "secondarygadget", f101_arg0 )
	CoD.CACUtility.UpdateGrenadeNames( f101_arg0, f101_arg1, f101_arg2 )
	CoD.CACUtility.UpdateEmptySlotImages( f101_arg0, f101_arg1, f101_arg2 )
	for f101_local11, f101_local12 in ipairs( CoD.CACUtility.loadoutSlotOrder ) do
		local f101_local13 = Engine.GetModel( f101_arg2, f101_local12 )
		if f101_local13 then
			local f101_local6 = Engine.CreateModel( f101_local13, "hintText" )
			if f101_local6 then
				local f101_local7, f101_local8, f101_local9, f101_local10 = CoD.CACUtility.GetCACSlotStatus( f101_arg0, f101_arg2, f101_local12 )
				if f101_local10 ~= nil then
					Engine.SetModelValue( f101_local6, Engine.Localize( f101_local9, f101_local10 ) )
				else
					Engine.SetModelValue( f101_local6, Engine.Localize( f101_local9 ) )
				end
			end
		end
	end
end

CoD.CACUtility.UpdateWeaponOptions = function ( f105_arg0, f105_arg1 )
	local f105_local0 = CoD.perController[f105_arg0].weaponCategory
	local f105_local1 = Engine.GetModelForController( f105_arg0 )
	local f105_local2 = function ( f106_arg0, f106_arg1, f106_arg2 )
		local f106_local0 = Engine.GetModelForController( f106_arg0 )
		for f106_local1 = 0, #CoD.CACUtility.weaponOptionGroupNames - 1, 1 do
			local f106_local4 = CoD.CACUtility.weaponOptionGroupNames[f106_local1]
			local f106_local5 = f106_arg2 .. f106_local4
			local f106_local6 = Engine.GetModel( f106_arg1, f106_local5 .. ".itemIndex" )
			if f106_local6 then
				local f106_local7 = Engine.GetModel( f106_local0, "WeaponOptions." .. f106_local4 .. "." .. Engine.GetModelValue( f106_local6 ) )
				if f106_local7 then
					local f106_local8 = Engine.GetModel( f106_arg1, f106_local5 .. ".name" )
					local f106_local9 = Engine.GetModel( f106_arg1, f106_local5 .. ".image" )
					if f106_local8 and f106_local9 then
						Engine.SetModelValue( f106_local8, Engine.GetModelValue( Engine.GetModel( f106_local7, "name" ) ) )
						Engine.SetModelValue( f106_local9, Engine.GetModelValue( Engine.GetModel( f106_local7, "image" ) ) )
					end
				end
			end
		end
	end
	
	f105_local2( f105_arg0, f105_arg1, "primary" )
	f105_local2( f105_arg0, f105_arg1, "secondary" )
	CoD.CACUtility.UpdateWeaponCustomizationCategoryList( f105_arg0, f105_arg1 )
end

CoD.CACUtility.UpdateAttachmentCosmeticVariants = function ( f107_arg0, f107_arg1 )
	local f107_local0 = function ( f108_arg0, f108_arg1 )
		for f108_local15, f108_local16 in pairs( f108_arg1 ) do
			local f108_local17 = f108_local16 .. "cosmeticvariant"
			local f108_local18 = Engine.GetModel( f108_arg0, f108_local16 )
			local f108_local19 = Engine.GetModel( f108_arg0, f108_local17 )
			if f108_local19 and f108_local18 then
				local f108_local3 = Engine.GetModel( f108_local19, "itemIndex" )
				local f108_local4 = Engine.GetModel( f108_local18, "itemIndex" )
				if f108_local3 and f108_local4 then
					local f108_local5 = Engine.GetModelValue( f108_local3 )
					if f108_local5 > 0 and Engine.GetModelValue( f108_local4 ) > 0 then
						local f108_local6 = Engine.GetModel( f108_local19, "name" )
						local f108_local7 = Engine.GetModel( f108_local19, "image" )
						local f108_local8 = Engine.GetModel( f108_local19, "ref" )
						local f108_local9 = Engine.GetModel( f108_local18, "ref" )
						if f108_local6 and f108_local7 and f108_local8 and f108_local9 then
							local f108_local10 = Engine.GetModelValue( f108_local9 )
							if CoD.WC_Category.ACV.attachmentTable[f108_local10] then
								local f108_local11 = CoD.WC_Category.ACV.attachmentTable[f108_local10].variants[f108_local5]
								local f108_local12 = Engine.SetModelValue
								local f108_local13 = f108_local6
								local f108_local14
								if f108_local11 then
									f108_local14 = f108_local11.name
									if not f108_local14 then
									
									else
										f108_local12( f108_local13, f108_local14 )
										f108_local12 = Engine.SetModelValue
										f108_local13 = f108_local7
										if f108_local11 then
											f108_local14 = f108_local11.image
											if not f108_local14 then
											
											else
												f108_local12( f108_local13, f108_local14 )
												Engine.SetModelValue( f108_local8, f108_local10 )
											end
										end
										f108_local14 = ""
									end
								end
								f108_local14 = ""
							end
						end
					end
				end
			end
		end
	end
	
	f107_local0( f107_arg1, CoD.CACUtility.PrimaryAttachmentSlotNameList )
	f107_local0( f107_arg1, CoD.CACUtility.SecondaryAttachmentSlotNameList )
end

CoD.CACUtility.UpdateWeaponCustomizationCategoryList = function ( f109_arg0, f109_arg1 )
	local f109_local0 = Engine.GetModelForController( f109_arg0 )
	local f109_local1 = CoD.perController[f109_arg0].weaponCategory
	local f109_local2 = Engine.GetModel( f109_local0, "WeaponCustomizationCategory" )
	if f109_local2 then
		for f109_local3 = 1, CoD.CACUtility.maxWeaponCustomizationCategories, 1 do
			local f109_local6 = Engine.GetModel( f109_local2, f109_local3 )
			if f109_local6 then
				local f109_local7 = Engine.GetModel( f109_local6, "type" )
				if f109_local7 then
					local f109_local8 = Engine.GetModelValue( f109_local7 )
					if f109_local8 == "paintjob" then
						local f109_local9 = Engine.GetModelValue( Engine.GetModel( f109_arg1, f109_local1 .. "paintjobindex.itemIndex" ) )
						Engine.SetModelValue( Engine.GetModel( f109_local6, "paintjobIndex" ), f109_local9 )
						local f109_local10 = Engine.GetModelValue( Engine.GetModel( f109_arg1, f109_local1 .. "paintjobslot.itemIndex" ) )
						Engine.SetModelValue( Engine.GetModel( f109_local6, "paintjobSlot" ), f109_local10 )
						Engine.SetModelValue( Engine.GetModel( f109_local6, "paintjobSlotAndIndex" ), f109_local10 .. " " .. f109_local9 )
					end
					local f109_local11 = Engine.GetModel( f109_arg1, f109_local1 .. f109_local8 )
					if f109_local11 then
						local f109_local9 = Engine.GetModelValue( Engine.GetModel( f109_local11, "name" ) )
						local f109_local12 = Engine.GetModelValue( Engine.GetModel( f109_local11, "image" ) )
						Engine.SetModelValue( Engine.GetModel( f109_local6, "name" ), f109_local9 )
						Engine.SetModelValue( Engine.GetModel( f109_local6, "image" ), f109_local12 )
					end
				end
			end
		end
	end
end

CoD.CACUtility.UpdateAllClasses = function ( f110_arg0 )
	local f110_local0 = Engine.GetCustomClassCount( f110_arg0 )
	local f110_local1 = Engine.GetModel( Engine.GetModelForController( f110_arg0 ), "CustomClassList" )
	for f110_local2 = 1, f110_local0, 1 do
		CoD.CACUtility.GetCustomClassModel( f110_arg0, f110_local2 - 1, Engine.GetModel( f110_local1, "class" .. f110_local2 ) )
	end
end

CoD.CACUtility.GetWeaponOptionsFromClass = function ( f111_arg0, f111_arg1, f111_arg2 )
	if not f111_arg1 then
		f111_arg1 = CoD.perController[f111_arg0].classModel
	end
	local f111_local0 = Engine.GetModel( f111_arg1, f111_arg2 .. "camo.itemIndex" )
	local f111_local1 = Engine.GetModel( f111_arg1, f111_arg2 .. "reticle.itemIndex" )
	local f111_local2 = Engine.GetModel( f111_arg1, f111_arg2 .. "paintjobslot.itemIndex" )
	local f111_local3 = Engine.GetModel( f111_arg1, f111_arg2 .. "paintjobindex.itemIndex" )
	local f111_local4 = "0"
	local f111_local5 = "0"
	if f111_local0 then
		f111_local4 = Engine.GetModelValue( f111_local0 )
	end
	if f111_local1 then
		f111_local5 = Engine.GetModelValue( f111_local1 )
	end
	if IsLive() then
		if f111_local2 and f111_local3 then
			Engine.SetupPaintjobData( f111_arg0, Engine.GetModelValue( f111_local2 ), Engine.GetModelValue( f111_local3 ) )
		end
	else
		Engine.ClearPaintjobLayerData()
	end
	return f111_local4 .. "," .. f111_local5 .. ",1"
end

CoD.CACUtility.EmptyWeaponOptions = function ()
	return "0" .. "," .. "0" .. ",0"
end

CoD.CACUtility.GetAttachmentCosmeticVariantsFromClass = function ( f113_arg0, f113_arg1, f113_arg2 )
	if not f113_arg1 then
		f113_arg1 = CoD.perController[f113_arg0].classModel
	end
	local f113_local0 = ""
	local f113_local1 = CoD.CACUtility.GetAttachmentVariantForAttachmentList( f113_arg1, f113_arg2 )
	for f113_local2 = 1, #f113_local1, 1 do
		f113_local0 = f113_local0 .. f113_local1[f113_local2].ref .. "," .. f113_local1[f113_local2].attachmentIndex .. ","
	end
	return f113_local0
end

CoD.CACUtility.GetACVariantsFromClassExcludeAttachment = function ( f114_arg0, f114_arg1, f114_arg2, f114_arg3 )
	if not f114_arg1 then
		f114_arg1 = CoD.perController[f114_arg0].classModel
	end
	local f114_local0 = ""
	local f114_local1 = CoD.CACUtility.GetAttachmentVariantForAttachmentList( f114_arg1, f114_arg2 )
	for f114_local2 = 1, #f114_local1, 1 do
		if f114_local1[f114_local2].ref ~= f114_arg3 then
			f114_local0 = f114_local0 .. f114_local1[f114_local2].ref .. "," .. f114_local1[f114_local2].attachmentIndex .. ","
		end
	end
	return f114_local0
end

CoD.CACUtility.GetWeaponOptionsFromVariantInfo = function ( f115_arg0, f115_arg1 )
	local f115_local0 = "0"
	local f115_local1 = "0"
	if f115_arg1.camoIndex then
		f115_local0 = f115_arg1.camoIndex
	end
	if f115_arg1.reticleIndex then
		f115_local1 = f115_arg1.reticleIndex
	end
	if f115_arg1.paintjobSlot and f115_arg1.paintjobIndex then
		Engine.SetupPaintjobData( f115_arg0, f115_arg1.paintjobSlot, f115_arg1.paintjobIndex )
	end
	return f115_local0 .. "," .. f115_local1 .. ",1"
end

CoD.CACUtility.GetAttachmentCosmeticVariantsFromVariantInfo = function ( f116_arg0 )
	local f116_local0 = ""
	for f116_local4, f116_local5 in ipairs( f116_arg0.attachmentVariant ) do
		local f116_local6 = f116_arg0.attachment[f116_local4]
		if f116_local6 > CoD.CACUtility.EmptyItemIndex then
			f116_local0 = f116_local0 .. Engine.GetAttachmentRefByIndex( f116_local6 ) .. "," .. f116_local5 .. ","
		end
	end
	return f116_local0
end

CoD.CACUtility.GetBaseWeaponLoadoutSlotName = function ( f117_arg0 )
	local f117_local0 = nil
	if f117_arg0 == "primary" or f117_arg0 == "secondary" or f117_arg0 == "primarygadget" or f117_arg0 == "secondarygadget" or f117_arg0 == "cybercore" or LUI.startswith( f117_arg0, "specialty" ) or LUI.startswith( f117_arg0, "bonuscard" ) then
		f117_local0 = f117_arg0
	elseif LUI.startswith( f117_arg0, "primaryattachment" ) then
		f117_local0 = "primary"
	elseif LUI.startswith( f117_arg0, "secondaryattachment" ) then
		f117_local0 = "secondary"
	elseif LUI.startswith( f117_arg0, "primarygadgetattachment" ) then
		f117_local0 = "primarygadget"
	elseif LUI.startswith( f117_arg0, "secondarygadgetattachment" ) then
		f117_local0 = "secondarygadget"
	elseif LUI.startswith( f117_arg0, "cybercom_" ) then
		f117_local0 = "cybercom"
	end
	return f117_local0
end

CoD.CACUtility.GetGunLevelWeaponIndex = function ( f118_arg0, f118_arg1 )
	local f118_local0 = CoD.perController[f118_arg0].classModel
	local f118_local1 = CoD.perController[f118_arg0].weaponSlot
	local f118_local2 = CoD.perController[f118_arg0].weaponCategory
	local f118_local3 = f118_arg1 and f118_arg1:getModel( f118_arg0, "weaponSlot" )
	if f118_local3 then
		f118_local2 = Engine.GetModelValue( f118_local3 )
	end
	if f118_local2 and (LUI.startswith( f118_local2, "primaryattachment" ) or LUI.startswith( f118_local2, "secondaryattachment" )) and f118_local1 then
		local f118_local4 = Engine.GetModel( f118_local0, f118_local1 .. ".itemIndex" )
		if f118_local4 then
			return Engine.GetModelValue( f118_local4 )
		end
	end
	if f118_arg1 then
		local f118_local4 = f118_arg1:getModel( f118_arg0, "itemIndex" )
		if f118_local4 then
			return Engine.GetModelValue( f118_local4 )
		end
		local f118_local5 = f118_arg1:getModel( f118_arg0, "weaponIndex" )
		if f118_local5 then
			return Engine.GetModelValue( f118_local5 )
		end
	end
	return CoD.CACUtility.EmptyItemIndex
end

CoD.CACUtility.AttachmentEquippedInCACSlot = function ( f119_arg0, f119_arg1, f119_arg2 )
	local f119_local0 = CoD.perController[f119_arg0].classModel
	local f119_local1 = CoD.CACUtility.PrimaryAttachmentSlotNameList
	if f119_arg1 == "secondary" then
		f119_local1 = CoD.CACUtility.SecondaryAttachmentSlotNameList
	end
	for f119_local5, f119_local6 in ipairs( f119_local1 ) do
		if Engine.GetModelValue( Engine.GetModel( f119_local0, f119_local6 .. ".itemIndex" ) ) == f119_arg2 then
			return f119_local5
		end
	end
end

CoD.CACUtility.ValidateWeaponVariantForClass = function ( f120_arg0, f120_arg1 )
	local f120_local0 = CoD.perController[f120_arg0].classNum
	local f120_local1 = function ( f121_arg0, f121_arg1 )
		local f121_local0 = Engine.GetModelValue( Engine.GetModel( f120_arg1, f121_arg0 .. "gunsmithvariant.itemIndex" ) )
		if f121_local0 > CoD.CACUtility.EmptyItemIndex then
			local f121_local1 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f120_arg0, f121_local0 - 1 )
			local f121_local2 = false
			if Engine.GetModelValue( Engine.GetModel( f120_arg1, f121_arg0 .. ".itemIndex" ) ) == f121_local1.weaponIndex then
				for f121_local12, f121_local13 in ipairs( f121_local1.attachment ) do
					local f121_local9 = false
					local f121_local14 = Engine.GetAttachmentIndexByAttachmentTableIndex( f121_local1.weaponIndex, f121_local13 )
					if f121_local14 > CoD.CACUtility.EmptyItemIndex then
						for f121_local10, f121_local11 in ipairs( f121_arg1 ) do
							if f121_local14 == Engine.GetModelValue( Engine.GetModel( f120_arg1, f121_local11 .. ".itemIndex" ) ) then
								f121_local9 = true
								break
							end
						end
						if not f121_local9 then
							f121_local2 = true
						end
					end
				end
			end
			if f121_local2 then
				CoD.SetClassItem( f120_arg0, f120_local0, f121_arg0 .. "gunsmithvariant", CoD.CACUtility.EmptyItemIndex )
			end
		end
	end
	
	f120_local1( "primary", CoD.CACUtility.PrimaryAttachmentSlotNameList )
	f120_local1( "secondary", CoD.CACUtility.SecondaryAttachmentSlotNameList )
end

CoD.CACUtility.CreateUnlockTokenModels = function ( f122_arg0 )
	if not CoD.CACUtility.unlockTokenModel[f122_arg0] then
		CoD.CACUtility.unlockTokenModel[f122_arg0] = Engine.CreateModel( Engine.GetModelForController( f122_arg0 ), "UnlockTokenInfo" )
		Engine.CreateModel( CoD.CACUtility.unlockTokenModel[f122_arg0], "itemIndex" )
		local f122_local0 = Engine.CreateModel( CoD.CACUtility.unlockTokenModel[f122_arg0], "xpBarInfo" )
		Engine.CreateModel( f122_local0, "rankXP" )
		Engine.CreateModel( f122_local0, "xpEarned" )
		Engine.CreateModel( f122_local0, "xpNeeded" )
		Engine.CreateModel( f122_local0, "currLevel" )
		Engine.CreateModel( f122_local0, "currLevelIcon" )
		Engine.CreateModel( f122_local0, "nextLevel" )
		Engine.CreateModel( f122_local0, "nextLevelIcon" )
	end
	local f122_local0 = Engine.GetModel( Engine.GetModelForController( f122_arg0 ), "unlockTokensCount" )
	local f122_local1 = "weapon_smg"
	local f122_local2 = CoD.CCUtility.customizationMode
	if not f122_local2 then
		f122_local2 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	end
	Engine.SetModelValue( f122_local0, Engine.GetCurrentTokens( f122_arg0, f122_local1, f122_local2 ) )
end

CoD.CACUtility.GetPerkXModel = function ( f123_arg0, f123_arg1 )
	return "p7_perk_" .. Engine.GetItemImage( f123_arg0, f123_arg1 )
end

CoD.CACUtility.GetBonuscardXModel = function ( f124_arg0, f124_arg1 )
	return "p7_" .. Engine.GetItemRef( f124_arg0, f124_arg1 )
end

CoD.CACUtility.GetCybercoreXModel = function ( f125_arg0, f125_arg1 )
	return "p7_core_" .. Engine.GetItemImage( f125_arg0, f125_arg1 )
end

CoD.CACUtility.WeaponSelectFocusOnLastSelectedWeapon = function ( f126_arg0, f126_arg1 )
	local f126_local0 = DataSources.Unlockables:getCurrentFilterItem()
	if f126_arg0.weaponList.activeWidget then
		local f126_local1 = f126_arg0.weaponList.activeWidget.gridInfoTable.zeroBasedIndex + 1
		if f126_arg0.lastSelectionTable and f126_arg0.lastSelectionTable[f126_local0] then
			f126_arg0.lastSelectionTable[f126_local0] = f126_local1
		end
	end
end

CoD.CACUtility.WeaponSelectFocusOnLastSelectedCategory = function ( f127_arg0, f127_arg1, f127_arg2 )
	if not f127_arg1 then
		return 
	end
	local f127_local0 = f127_arg1.filter
	if not f127_local0 then
		f127_local0 = DataSources.Unlockables:getCurrentFilterItem()
	end
	DataSources.Unlockables.setCurrentFilterItem( f127_local0 )
	f127_arg0.weaponList:updateDataSource( true )
	if not f127_arg0.performingSetup then
		local f127_local1 = 1
		if f127_arg0.lastSelectionTable and f127_arg0.lastSelectionTable[f127_local0] then
			f127_local1 = f127_arg0.lastSelectionTable[f127_local0]
		end
		local f127_local2 = f127_arg0.weaponList:getItemAt( f127_local1 )
		if f127_local2 then
			f127_arg0.weaponList:setActiveItem( f127_local2, 0, true, true )
		end
	end
end

CoD.CACUtility.SetCACMenuHeroInfoModels = function ( f128_arg0 )
	local f128_local0 = Engine.CurrentSessionMode()
	local f128_local1 = Engine.GetEquippedHero( f128_arg0, f128_local0 )
	local f128_local2 = Engine.GetEquippedHeroInfo( f128_arg0, f128_local0 )
	if f128_local2 and f128_local1 then
		local f128_local3 = Engine.GetLoadoutTypeForHero( f128_arg0, f128_local1 )
		if f128_local3 then
			local f128_local4 = Engine.GetModel( Engine.GetModelForController( f128_arg0 ), "CACMenu" )
			if f128_local4 then
				local f128_local5 = f128_local2.defaultHeroRender
				if f128_local3 == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET then
					f128_local5 = f128_local2.defaultHeroRenderAbility
				end
				Engine.SetModelValue( Engine.GetModel( f128_local4, "currentHeroImage" ), f128_local5 )
				Engine.SetModelValue( Engine.GetModel( f128_local4, "currentHeroName" ), f128_local2.displayName )
			end
			local f128_local5 = Engine.GetLoadoutInfoForHero( f128_local0, f128_local1, f128_local3 )
			if f128_local5 then
				Engine.SetModelValue( Engine.GetModel( f128_local4, "currentHeroLoadout" ), Engine.Localize( f128_local5.itemName ) )
			end
		end
	end
end

CoD.CACUtility.UpgradeEquippedCACItems = function ( f129_arg0, f129_arg1, f129_arg2, f129_arg3 )
	local f129_local0 = Engine.GetModel( Engine.GetModelForController( f129_arg0 ), "CustomClassList" )
	for f129_local1 = 1, Engine.GetCustomClassCount( f129_arg0 ), 1 do
		local f129_local4 = f129_local1 - 1
		local f129_local5 = Engine.GetModel( f129_local0, "class" .. f129_local1 )
		local f129_local6 = CoD.CACUtility.GetMutuallyExclusiveSlotName( f129_arg1, f129_arg0, f129_arg2, f129_local5 )
		local f129_local7 = function ( f130_arg0 )
			if f130_arg0 ~= nil then
				local f130_local0 = Engine.GetModel( f129_local5, f130_arg0 )
				if f130_local0 then
					local f130_local1 = Engine.GetModel( f130_local0, "itemIndex" )
					if f130_local1 and Engine.GetModelValue( f130_local1 ) == f129_arg2 then
						CoD.SetClassItem( f129_arg0, f129_local4, f130_arg0, f129_arg3 )
					end
				end
			end
		end
		
		f129_local7( f129_arg1 )
		for f129_local8 = 1, #f129_local6, 1 do
			local f129_local11 = f129_local6[f129_local8]
			if f129_local11 and f129_local11 ~= "" then
				f129_local7( f129_local11 )
			end
		end
	end
end

CoD.CACUtility.GetAllItems = function ( f131_arg0, f131_arg1 )
	if f131_arg0 ~= true and CoD.CACUtility.Items then
		return unpack( CoD.CACUtility.Items )
	end
	local f131_local0 = {}
	for f131_local1 = 0, 43, 1 do
		f131_local0[f131_local1] = {
			index = f131_local1,
			desc = Engine.GetAttachmentDescByAttachmentIndex( f131_local1 ),
			name = Engine.GetAttachmentNameByIndex( f131_local1 ),
			image = Engine.GetAttachmentImageByIndex( f131_local1 ),
			isOptic = Engine.IsOpticByAttachmentIndex( f131_local1 ),
			items = {}
		}
	end
	local f131_local1 = {}
	local f131_local2 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	for f131_local3 = 0, 255, 1 do
		if Engine.ItemIndexValid( f131_local3, f131_local2 ) then
			local f131_local6 = Engine.GetUnlockableInfoByIndex( f131_local3, f131_local2 )
			if f131_local6.allocation >= 0 then
				local f131_local7 = {
					index = f131_local3,
					name = f131_local6.name,
					image = f131_local6.image,
					groupIndex = f131_local6.groupIndex,
					groupName = f131_local6.group,
					loadoutSlot = f131_local6.loadoutSlot,
					loadoutSlotIndex = f131_local6.loadoutSlotIndex,
					unlockLevel = f131_local6.unlockLevel,
					momentum = f131_local6.momentum,
					restrictionState = f131_local6.restrictionState,
					allocation = f131_local6.allocation
				}
				if LuaUtils.StartsWith( f131_local7.loadoutSlot, "hero" ) or f131_local7.loadoutSlot == "specialgadget" then
					f131_local7.image = f131_local6.image .. "_large"
				end
				if LuaUtils.StartsWith( f131_local7.loadoutSlot, "killstreak" ) then
					f131_local7.image = f131_local6.image .. "_menu"
				end
				if f131_local7.loadoutSlot == "primary" or f131_local7.loadoutSlot == "secondary" then
					local f131_local8 = Engine.GetNumAttachments( f131_local3 )
					if f131_local8 > 0 then
						f131_local7.attachments = {}
						for f131_local9 = 0, f131_local8 - 1, 1 do
							local f131_local12 = Engine.GetItemAttachment( f131_local3, f131_local9 )
							if f131_local12 > CoD.CACUtility.EmptyItemIndex then
								f131_local7.attachments[f131_local12] = {
									attachmentIndex = f131_local12,
									restrictionState = Engine.GetAttachmentRestrictionState( f131_local12, f131_local3, false )
								}
								table.insert( f131_local0[f131_local12].items, {
									itemIndex = f131_local3
								} )
							end
						end
					end
				end
				f131_local1[f131_local3] = f131_local7
			end
		end
	end
	if f131_arg1 == true then
		local f131_local3 = function ( f132_arg0, f132_arg1 )
			if f131_local0[f132_arg0].isOptic and f131_local0[f132_arg1].isOptic then
				return Engine.Localize( f131_local0[f132_arg0].name ) < Engine.Localize( f131_local0[f132_arg1].name )
			elseif f131_local0[f132_arg0].isOptic ~= f131_local0[f132_arg1].isOptic then
				return f131_local0[f132_arg0].isOptic
			else
				return Engine.Localize( f131_local0[f132_arg0].name ) < Engine.Localize( f131_local0[f132_arg1].name )
			end
		end
		
		local f131_local4 = {}
		for f131_local7, f131_local8 in LUI.IterateTableBySortedKeys( f131_local0, f131_local3, nil ) do
			f131_local4[f131_local8.index] = f131_local8
		end
		f131_local5 = Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER )
		f131_local13 = function ( f133_arg0, f133_arg1 )
			if LuaUtils.StartsWith( f131_local1[f133_arg0].loadoutSlot, "hero" ) or f131_local1[f133_arg0].loadoutSlot == "specialgadget" or LuaUtils.StartsWith( f131_local1[f133_arg1].loadoutSlot, "hero" ) or f131_local1[f133_arg1].loadoutSlot == "specialgadget" then
				local f133_local0 = -1
				local f133_local1 = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_INVALID
				local f133_local2 = -1
				local f133_local3 = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_INVALID
				for f133_local7, f133_local8 in ipairs( f131_local5 ) do
					local f133_local9 = Engine.GetLoadoutItemIndexForHero( Engine.CurrentSessionMode(), f133_local7 - 1, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
					local f133_local10 = Engine.GetLoadoutItemIndexForHero( Engine.CurrentSessionMode(), f133_local7 - 1, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET )
					if f131_local1[f133_arg0].index == f133_local9 then
						f133_local0 = f133_local7
						f133_local1 = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON
					elseif f131_local1[f133_arg0].index == f133_local10 then
						f133_local0 = f133_local7
						f133_local1 = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET
					end
					if f131_local1[f133_arg1].index == f133_local9 then
						f133_local2 = f133_local7
						f133_local3 = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON
					end
					if f131_local1[f133_arg1].index == f133_local10 then
						f133_local2 = f133_local7
						f133_local3 = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET
					end
				end
				if f133_local0 == f133_local2 then
					return f133_local1 < f133_local3
				end
				return f133_local0 < f133_local2
			elseif LUI.startswith( f131_local1[f133_arg0].loadoutSlot, "killstreak" ) or LUI.startswith( f131_local1[f133_arg1].loadoutSlot, "killstreak" ) then
				return f131_local1[f133_arg0].momentum < f131_local1[f133_arg1].momentum
			elseif f131_local1[f133_arg0].groupIndex ~= f131_local1[f133_arg1].groupIndex then
				return f131_local1[f133_arg0].groupIndex < f131_local1[f133_arg1].groupIndex
			elseif f131_local1[f133_arg0].loadoutSlot == f131_local1[f133_arg1].loadoutSlot then
				return Engine.Localize( f131_local1[f133_arg0].name ) < Engine.Localize( f131_local1[f133_arg1].name )
			else
				return Engine.Localize( f131_local1[f133_arg0].loadoutSlot ) < Engine.Localize( f131_local1[f133_arg1].loadoutSlot )
			end
		end
		
		f131_local6 = {}
		for f131_local10, f131_local11 in LUI.IterateTableBySortedKeys( f131_local1, f131_local13, nil ) do
			f131_local6[f131_local10] = f131_local11
		end
		CoD.CACUtility.Items = {
			f131_local6,
			f131_local4
		}
		return unpack( CoD.CACUtility.Items )
	end
	CoD.CACUtility.Items = {
		f131_local1,
		f131_local0
	}
	return unpack( CoD.CACUtility.Items )
end

CoD.CACUtility.GetLoadout = function ( f134_arg0, f134_arg1 )
	local f134_local0 = {
		weapons = {},
		primaryAttachments = {},
		secondaryAttachments = {},
		equipment = {},
		perks = {},
		wildcards = {},
		other = {},
		streaks = {}
	}
	local f134_local1 = Engine.GetCustomClass( f134_arg0, f134_arg1 )
	for f134_local5, f134_local6 in pairs( f134_local1 ) do
		if LUI.startswith( f134_local5, "primaryattachment" ) then
			table.insert( f134_local0.primaryAttachments, Engine.GetItemAttachment( f134_local1.primary, f134_local6 ) )
		end
		if LUI.startswith( f134_local5, "secondaryattachment" ) then
			table.insert( f134_local0.secondaryAttachments, Engine.GetItemAttachment( f134_local1.secondary, f134_local6 ) )
		end
		if LUI.startswith( f134_local5, "killstreak" ) then
			f134_local0.streaks[f134_local5] = f134_local6
		end
		if LUI.startswith( f134_local5, "hero" ) or f134_local5 == "specialgadget" then
			f134_local0.heroItem = f134_local6
		end
		if LUI.startswith( f134_local5, "specialty" ) then
			f134_local0.perks[f134_local5] = f134_local6
		end
		if LUI.startswith( f134_local5, "bonuscard" ) then
			f134_local0.wildcards[f134_local5] = f134_local6
		end
		if f134_local5 == "primary" or f134_local5 == "secondary" then
			f134_local0.weapons[f134_local5] = f134_local6
		end
		if f134_local5 == "primarygadget" or f134_local5 == "secondarygadget" then
			f134_local0.equipment[f134_local5] = f134_local6
		else
			f134_local0.other[f134_local5] = f134_local6
		end
	end
	return f134_local0
end

CoD.CACUtility.GetFullLoadout = function ( f135_arg0 )
	local f135_local0 = {
		classes = {}
	}
	local f135_local1 = Engine.GetCustomClassCount( f135_arg0 )
	for f135_local2 = 0, f135_local1 - 1, 1 do
		local f135_local5 = CoD.CACUtility.GetLoadout( f135_arg0, f135_local2 )
		if f135_local0.streaks == nil then
			f135_local0.streaks = f135_local5.streaks
		end
		if f135_local0.heroItem == nil then
			f135_local0.heroItem = f135_local5.heroItem
		end
		table.insert( f135_local0.classes, f135_local5 )
	end
	return f135_local0
end

function AnyItemBanned( f136_arg0 )
	for f136_local3, f136_local4 in pairs( f136_arg0 ) do
		if Engine.GetItemVote( f136_local4 ) == Enum.VoteType.VOTE_TYPE_BAN then
			return true
		elseif Engine.IsItemIndexRestricted( f136_local4, false ) then
			return true
		end
	end
	return false
end

function AnyAttachmentBanned( f137_arg0, f137_arg1 )
	for f137_local3, f137_local4 in ipairs( f137_arg1 ) do
		if Engine.GetAttachmentVote( f137_local4 ) == Enum.VoteType.VOTE_TYPE_BAN then
			return true
		elseif Engine.GetItemAttachmentVote( f137_arg0, f137_local4 ) == Enum.VoteType.VOTE_TYPE_BAN then
			return true
		elseif Engine.GetAttachmentRestrictionState( f137_local4, f137_arg0, false ) == Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_RESTRICTED then
			return true
		end
	end
	return false
end

CoD.CACUtility.AnyClassContainsRestrictedItems = function ( f138_arg0 )
	local f138_local0 = Engine.GetCustomClassCount( f138_arg0 )
	for f138_local1 = 0, f138_local0 - 1, 1 do
		if CoD.CACUtility.ClassContainsRestrictedItems( f138_arg0, f138_local1 ) then
			return true
		end
	end
	return false
end

CoD.CACUtility.AnyEquippedScorestreaksBanned = function ( f139_arg0 )
	local f139_local0 = CoD.CACUtility.GetFullLoadout( f139_arg0 )
	return AnyItemBanned( f139_local0.streaks )
end

CoD.CACUtility.ClassContainsRestrictedItems = function ( f140_arg0, f140_arg1 )
	local f140_local0 = CoD.CACUtility.GetLoadout( f140_arg0, f140_arg1 )
	if AnyItemBanned( f140_local0.weapons ) then
		return true
	elseif AnyItemBanned( f140_local0.equipment ) then
		return true
	elseif AnyItemBanned( f140_local0.perks ) then
		return true
	elseif AnyItemBanned( f140_local0.wildcards ) then
		return true
	elseif f140_local0.weapons.primary ~= nil and AnyAttachmentBanned( f140_local0.weapons.primary, f140_local0.primaryAttachments ) then
		return true
	elseif f140_local0.weapons.secondary ~= nil and AnyAttachmentBanned( f140_local0.weapons.secondary, f140_local0.secondaryAttachments ) then
		return true
	else
		return false
	end
end

CoD.CACUtility.GetAllRestrictedItems = function ()
	local f141_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	local f141_local1 = f141_local0.sessionClients
	local f141_local2 = {}
	for f141_local11, f141_local12 in ipairs( f141_local1 ) do
		if f141_local12.voteCount > 0 then
			for f141_local9, f141_local10 in ipairs( f141_local12.votes ) do
				if f141_local10.voteType == Enum.VoteType.VOTE_TYPE_BAN then
					table.insert( f141_local2, f141_local10 )
				end
			end
		end
	end
	return f141_local2
end

CoD.CACUtility.AnyCACItemsBanned = function ()
	for f142_local4, f142_local5 in ipairs( CoD.CACUtility.GetAllRestrictedItems() ) do
		if f142_local5.voteType == Enum.VoteType.VOTE_TYPE_BAN then
			if f142_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
				local f142_local3 = Engine.GetUnlockableInfoByIndex( f142_local5.itemIndex )
				if not LuaUtils.StartsWith( f142_local3.loadoutSlot, "hero" ) and not LuaUtils.StartsWith( f142_local3.loadoutSlot, "killstreak" ) and f142_local3.loadoutSlot ~= "specialgadget" then
					return true
				end
			end
			if f142_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
				return true
			elseif f142_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
				return true
			elseif f142_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
				return true
			end
		end
	end
	return false
end

CoD.CACUtility.AnyStreaksBanned = function ()
	for f143_local4, f143_local5 in ipairs( CoD.CACUtility.GetAllRestrictedItems() ) do
		if f143_local5.voteType == Enum.VoteType.VOTE_TYPE_BAN and f143_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
			local f143_local3 = Engine.GetUnlockableInfoByIndex( f143_local5.itemIndex )
			if LUI.startswith( f143_local3.loadoutSlot, "killstreak" ) then
				return true
			end
		end
	end
	return false
end

CoD.CACUtility.ItemSlotBannedByBonuscard = function ( f144_arg0, f144_arg1 )
	if not f144_arg0 then
		return false
	elseif not f144_arg1 or f144_arg1 <= 0 then
		return false
	end
	local f144_local0 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local f144_local1 = nil
	local f144_local2 = 0
	local f144_local3 = {}
	local f144_local4 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.primary_gunfighter, f144_local0 )
	local f144_local5 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.primary_gunfighter_2, f144_local0 )
	local f144_local6 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.primary_gunfighter_3, f144_local0 )
	f144_local3 = f144_local4
	if f144_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryWeapon then
		f144_local4 = Engine.GetUnlockableInfoByIndex( f144_arg1, f144_local0 )
		if f144_local4.loadoutSlot == CoD.CACUtility.loadoutSlotNames.primaryWeapon then
			f144_local1 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.overkill, f144_local0 )
		end
	elseif f144_arg0 == CoD.CACUtility.loadoutSlotNames.primaryAttachment4 then
		f144_local2 = 1
	elseif f144_arg0 == CoD.CACUtility.loadoutSlotNames.primaryAttachment5 then
		f144_local2 = 2
	elseif f144_arg0 == CoD.CACUtility.loadoutSlotNames.primaryAttachment6 then
		f144_local2 = 3
	elseif f144_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryAttachment1 or f144_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryAttachment2 or f144_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryAttachment3 or f144_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryAttachment4 or f144_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryAttachment5 or f144_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryAttachment6 then
		f144_local4 = Engine.GetUnlockableInfoByIndex( f144_arg1, f144_local0 )
		if f144_local4.loadoutSlot == CoD.CACUtility.loadoutSlotNames.primaryWeapon then
			f144_local1 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.overkill, f144_local0 )
		elseif f144_arg0 ~= CoD.CACUtility.loadoutSlotNames.secondaryAttachment1 and f144_arg0 ~= CoD.CACUtility.loadoutSlotNames.secondaryAttachment2 then
			f144_local1 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.secondary_gunfighter, f144_local0 )
		end
	elseif f144_arg0 == CoD.CACUtility.loadoutSlotNames.specialty4 then
		f144_local1 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.perk_1_greed, f144_local0 )
	elseif f144_arg0 == CoD.CACUtility.loadoutSlotNames.specialty5 then
		f144_local1 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.perk_2_greed, f144_local0 )
	elseif f144_arg0 == CoD.CACUtility.loadoutSlotNames.specialty6 then
		f144_local1 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.perk_3_greed, f144_local0 )
	elseif f144_arg0 == CoD.CACUtility.loadoutSlotNames.primaryGadgetAttachment1 then
		f144_local1 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.danger_close, f144_local0 )
	elseif f144_arg0 == CoD.CACUtility.loadoutSlotNames.primaryGadget then
		f144_local4 = Engine.GetUnlockableInfoByIndex( f144_arg1, f144_local0 )
		if f144_local4.loadoutSlot == CoD.CACUtility.loadoutSlotNames.secondaryGadget then
			f144_local1 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.two_tacticals, f144_local0 )
		end
	end
	if 0 < f144_local2 then
		f144_local4 = 3
		for f144_local5 = 1, #f144_local3, 1 do
			if Engine.GetItemVote( f144_local3[f144_local5] ) == Enum.VoteType.VOTE_TYPE_BAN or Engine.IsItemIndexRestricted( f144_local3[f144_local5], false ) then
				f144_local4 = f144_local4 - 1
			end
		end
		return f144_local4 < f144_local2
	elseif f144_local1 then
		if Engine.GetItemVote( f144_local1 ) == Enum.VoteType.VOTE_TYPE_BAN then
			return true
		elseif Engine.IsItemIndexRestricted( f144_local1, false ) then
			return true
		end
	end
	return false
end

CoD.CACUtility.GetItemInfoFromElementModel = function ( f145_arg0, f145_arg1 )
	if f145_arg1 then
		local f145_local0 = {}
		local f145_local1 = Engine.GetModel( f145_arg1, "itemType" )
		if f145_local1 then
			f145_local0.itemType = Engine.GetModelValue( f145_local1 )
			local f145_local2 = Engine.GetModel( f145_arg1, "itemIndex" )
			if f145_local2 then
				f145_local0.itemIndex = Engine.GetModelValue( f145_local2 )
			end
			local f145_local3 = Engine.GetModel( f145_arg1, "weaponIndex" )
			if f145_local3 then
				local f145_local4 = Engine.GetModelValue( f145_local3 )
				if f145_local4 > 0 then
					f145_local0.itemIndex = f145_local4
				end
			end
			local f145_local4 = Engine.GetModel( f145_arg1, "attachmentIndex" )
			if f145_local4 then
				f145_local0.attachmentIndex = Engine.GetModelValue( f145_local4 )
			end
			local f145_local5 = Engine.GetModel( f145_arg1, "itemGroup" )
			if f145_local5 then
				f145_local0.itemGroup = Engine.GetModelValue( f145_local5 )
			end
			local f145_local6 = Engine.GetModel( f145_arg1, "weaponSlot" )
			if f145_local6 then
				f145_local0.weaponSlot = Engine.GetModelValue( f145_local6 )
			end
			local f145_local7 = Engine.GetModel( f145_arg1, "loadoutSlot" )
			if f145_local7 then
				f145_local0.loadoutSlot = Engine.GetModelValue( f145_local7 )
			end
			local f145_local8 = Engine.GetModel( f145_arg1, "restrictionState" )
			if f145_local8 then
				f145_local0.restrictionState = Engine.GetModelValue( f145_local8 )
			end
			return f145_local0
		end
	end
end

CoD.CACUtility.ResetCPCustomClasses = function ( f146_arg0 )
	if CoD.isCampaign then
		local f146_local0 = Engine.GetModelForController( f146_arg0 )
		local f146_local1 = Engine.GetModel( Engine.GetModelForController( f146_arg0 ), "CustomClassList.prepared" )
		if f146_local1 then
			Engine.UnsubscribeAndFreeModel( f146_local1 )
		end
		local f146_local2 = Engine.GetModel( f146_local0, "CustomClassList" )
		if f146_local2 then
			for f146_local3 = 1, 6, 1 do
				local f146_local6 = Engine.GetModel( f146_local2, "class" .. f146_local3 )
				if f146_local6 ~= nil then
					Engine.UnsubscribeAndFreeModel( f146_local6 )
				end
			end
		end
	end
end

CoD.CACUtility.GetItemVotedBy = function ( f147_arg0 )
	local f147_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	local f147_local1 = f147_local0.sessionClients
	local f147_local2 = {}
	for f147_local11, f147_local12 in ipairs( f147_local1 ) do
		if f147_local12.voteCount > 0 then
			for f147_local9, f147_local10 in ipairs( f147_local12.votes ) do
				if f147_local10.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM and f147_arg0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
					if f147_local10.itemIndex == f147_arg0.itemIndex then
						return f147_local12.gamertag
					end
				end
				if f147_local10.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT and f147_arg0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
					if f147_local10.attachmentIndex == f147_arg0.attachmentIndex then
						return f147_local12.gamertag
					end
				end
				if f147_local10.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT and f147_arg0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
					if f147_local10.itemIndex == f147_arg0.itemIndex and f147_local10.attachmentIndex == f147_arg0.attachmentIndex then
						return f147_local12.gamertag
					end
				end
				if f147_local10.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP and f147_arg0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP and f147_local10.itemGroup == f147_arg0.itemGroup then
					return f147_local12.gamertag
				end
			end
		end
	end
	return ""
end

CoD.CACUtility.GetItemInfoFromElement = function ( f148_arg0, f148_arg1 )
	return CoD.CACUtility.GetItemInfoFromElementModel( f148_arg0, f148_arg1:getModel() )
end

CoD.CACUtility.IsItemConsumable = function ( f149_arg0 )
	if Engine.CurrentSessionMode() == Enum.eModes.MODE_INVALID then
		return false
	else
		return Engine.GetItemGroup( f149_arg0 ) == "bubblegum_consumable"
	end
end

CoD.CACUtility.GetCurrentWeaponXP = function ( f150_arg0, f150_arg1, f150_arg2 )
	local f150_local0 = nil
	return Engine.GetDStatForMode( f150_arg0, f150_arg2, "itemstats", f150_arg1, "xp" )
end

CoD.CACUtility.GetWeaponPLevel = function ( f151_arg0, f151_arg1 )
	local f151_local0 = Engine.GetPlayerStats( f151_arg0 )
	return f151_local0.itemstats[f151_arg1].pLevel:get()
end

CoD.CACUtility.PrepareOverCapactiyList = function ( f152_arg0 )
	local f152_local0 = {}
	local f152_local1 = 10
	local f152_local2 = -2
	local f152_local3 = CoD.perController[f152_arg0].classModel
	local f152_local4 = function ( f153_arg0, f153_arg1, f153_arg2, f153_arg3 )
		local f153_local0 = ""
		if f153_arg3 then
			local f153_local1 = f153_arg1
			if LUI.startswith( f153_arg0, "primaryattachment" ) then
				f153_local1 = Engine.GetModel( f152_local3, "primary" )
			elseif LUI.startswith( f153_arg0, "secondaryattachment" ) then
				f153_local1 = Engine.GetModel( f152_local3, "secondary" )
			end
			f153_local0 = Engine.GetModelValue( Engine.GetModel( f153_local1, "headerName" ) )
		end
		return {
			models = {
				headerName = f153_local0,
				name = Engine.GetModelValue( Engine.GetModel( f153_arg1, "name" ) ),
				image = Engine.GetModelValue( Engine.GetModel( f153_arg1, "image" ) ) or "blacktransparent",
				itemSlot = f153_arg0
			},
			properties = {
				itemRef = Engine.GetModelValue( Engine.GetModel( f153_arg1, "ref" ) ),
				spacing = f153_arg2 or f152_local2
			}
		}
	end
	
	local f152_local5 = CoD.perController[f152_arg0].weaponCategory
	local f152_local6 = CoD.perController[f152_arg0].overCapacityItemIndex
	local f152_local7 = ""
	if f152_local6 then
		f152_local7 = Engine.GetItemRef( f152_local6 )
	end
	if f152_local3 then
		for f152_local19, f152_local20 in ipairs( CoD.CACUtility.overCapacityLoadoutSlotOrder ) do
			local f152_local21 = Engine.GetModel( f152_local3, f152_local20 )
			local f152_local22 = f152_local1
			local f152_local23 = #f152_local0
			local f152_local24, f152_local11 = nil
			local f152_local18 = true
			if f152_local23 > 0 then
				f152_local11 = f152_local0[f152_local23].models.itemSlot
			end
			if LUI.startswith( f152_local5, "primaryattachment" ) and f152_local20 == "primary" then
				
			end
			if LUI.startswith( f152_local5, "secondaryattachment" ) and f152_local20 == "secondary" then
				
			end
			if LUI.startswith( f152_local5, "primarygadgetattachment" ) then
				if f152_local20 ~= "primarygadget" then
					if CoD.CACUtility.GetItemReferenceName( f152_local21, f152_local20 ) == "bonuscard_danger_close" then
						
					end
				end
			end
			if LUI.startswith( f152_local5, "secondarygadgetattachment" ) and f152_local20 == "secondarygadget" then
				
			end
			if LUI.startswith( f152_local7, "bonuscard_primary_gunfighter" ) then
				if f152_local20 ~= "primary" then
					if LUI.startswith( f152_local20, "primaryattachment" ) then
						
					end
				end
			end
			if f152_local7 == "bonuscard_secondary_gunfighter" then
				if f152_local20 ~= "secondary" then
					if LUI.startswith( f152_local20, "secondaryattachment" ) then
						
					end
				end
			end
			if f152_local21 then
				local f152_local12 = Engine.GetModel( f152_local21, "itemIndex" )
				if f152_local12 then
					local f152_local13 = Engine.GetModelValue( f152_local12 )
					local f152_local14 = Engine.GetItemRef( f152_local13 )
					if f152_local13 > CoD.CACUtility.EmptyItemIndex then
						if LUI.startswith( f152_local20, "primarygadgetattachment" ) then
							local f152_local15 = Engine.GetModel( f152_local3, "primarygadget.itemIndex" )
							if f152_local15 then
								local f152_local16 = Engine.GetModelValue( f152_local15 )
								local f152_local17 = Engine.GetModel( f152_local3, "primarygadgetattachment1" )
								if f152_local11 and f152_local11 == "primarygadget" then
									f152_local0[f152_local23].properties.spacing = f152_local2
									f152_local18 = false
								end
								table.insert( f152_local0, f152_local4( f152_local20, f152_local17, f152_local1, f152_local18 ) )
							end
						end
						if LUI.startswith( f152_local20, "secondarygadgetattachment" ) then
							local f152_local15 = Engine.GetModel( f152_local3, "secondarygadget.itemIndex" )
							if f152_local15 then
								local f152_local16 = Engine.GetModelValue( f152_local15 )
								local f152_local17 = Engine.GetModel( f152_local3, "secondarygadgetattachment1" )
								if f152_local11 and f152_local11 == "secondarygadget" then
									f152_local0[f152_local23].properties.spacing = f152_local2
									f152_local18 = false
								end
								table.insert( f152_local0, f152_local4( f152_local20, f152_local17, f152_local1, f152_local18 ) )
							end
						end
						if f152_local5 == "specialty4" and f152_local14 == "bonuscard_perk_1_greed" then
							
						end
						if f152_local5 == "specialty5" and f152_local14 == "bonuscard_perk_2_greed" then
							
						end
						if f152_local5 == "specialty6" and f152_local14 == "bonuscard_perk_3_greed" then
							
						end
						if (f152_local5 == "primaryattachment4" or f152_local5 == "primaryattachment5" or f152_local5 == "primaryattachment6") and LUI.startswith( f152_local14, "bonuscard_primary_gunfighter" ) then
							
						end
						if f152_local5 == "secondary" and f152_local14 == "bonuscard_overkill" then
							
						end
						if not LUI.startswith( f152_local5, "secondaryattachment" ) or f152_local14 ~= "bonuscard_overkill" then
							if f152_local5 == "secondaryattachment3" and f152_local14 == "bonuscard_secondary_gunfighter" then
								
							end
							if f152_local5 == "primarygadget" and f152_local14 == "bonuscard_two_tacticals" then
								
							end
							if f152_local5 == "primarygadgetattachment2" and f152_local14 == "bonuscard_danger_close" then
								
							end
							if LUI.startswith( f152_local5, "primarygadgetattachment" ) and f152_local14 == "bonuscard_two_tacticals" then
								
							end
							if f152_local11 and (not (f152_local11 ~= "primary" or not LUI.startswith( f152_local20, "primaryattachment" )) or not (not LUI.startswith( f152_local20, "primaryattachment" ) or not LUI.startswith( f152_local20, "primaryattachment" )) or not (f152_local11 ~= "secondary" or not LUI.startswith( f152_local20, "secondaryattachment" )) or not (not LUI.startswith( f152_local20, "secondaryattachment" ) or not LUI.startswith( f152_local20, "secondaryattachment" )) or not (f152_local11 ~= "specialty1" or f152_local20 ~= "specialty4") or not (f152_local11 ~= "specialty2" or f152_local20 ~= "specialty5") or not (f152_local11 ~= "specialty3" or f152_local20 ~= "specialty6") or LUI.startswith( f152_local11, "bonuscard" ) and LUI.startswith( f152_local20, "bonuscard" )) then
								f152_local0[f152_local23].properties.spacing = f152_local2
								f152_local18 = false
							end
							table.insert( f152_local0, f152_local4( f152_local20, f152_local21, f152_local22, f152_local18 ) )
						end
					end
				end
			end
		end
	end
	return f152_local0
end

f0_local2 = {
	getSpacerAfterColumn = function ( f154_arg0, f154_arg1 )
		local f154_local0 = f154_arg0[f154_arg0.dataSourceName]
		if f154_local0[f154_arg1] then
			return f154_local0[f154_arg1].properties.spacing
		else
			return -2
		end
	end
}
CoD.CACUtility.RemoveItemFromClassList = function ( f155_arg0 )
	local f155_local0 = CoD.perController[f155_arg0].weaponCategory
	local f155_local1 = CoD.CACUtility.PrepareOverCapactiyList( f155_arg0 )
	local f155_local2 = nil
	for f155_local3 = #f155_local1, 1, -1 do
		local f155_local6 = f155_local1[f155_local3].models.itemSlot
		if f155_local0 == f155_local6 or LUI.startswith( f155_local6, f155_local0 .. "attachment" ) then
			table.remove( f155_local1, f155_local3 )
		end
	end
	local f155_local3 = f155_local0 == "primary"
	local f155_local4 = "bonuscard_primary_gunfighter"
	if not f155_local3 then
		f155_local4 = "bonuscard_secondary_gunfighter"
	end
	for f155_local5 = #f155_local1, 1, -1 do
		if LUI.startswith( f155_local1[f155_local5].properties.itemRef, f155_local4 ) then
			table.remove( f155_local1, f155_local5 )
		end
	end
	return f155_local1
end

DataSources.RemoveItemFromClassList = DataSourceHelpers.ListSetup( "RemoveItemFromClassList", CoD.CACUtility.RemoveItemFromClassList, true, f0_local2 )
DataSources.OverCapacityList = DataSourceHelpers.ListSetup( "OverCapacityList", CoD.CACUtility.PrepareOverCapactiyList, true, f0_local2 )
CoD.CACUtility.PrepareWildcardOverCapactiyList = function ( f156_arg0 )
	local f156_local0 = {}
	local f156_local1 = function ( f157_arg0, f157_arg1, f157_arg2, f157_arg3 )
		return {
			models = {
				name = f157_arg0,
				image = f157_arg1 or "blacktransparent",
				itemSlot = f157_arg2
			},
			properties = {
				itemIndex = f157_arg3
			}
		}
	end
	
	local f156_local2 = CoD.perController[f156_arg0].classModel
	local f156_local3 = CoD.perController[f156_arg0].wildcardOverCapacityRefName
	local f156_local4 = CoD.perController[f156_arg0].weaponCategory == "primary"
	local f156_local5 = "bonuscard_primary_gunfighter"
	if not f156_local4 then
		f156_local5 = "bonuscard_secondary_gunfighter"
	end
	for f156_local9, f156_local10 in ipairs( CoD.CACUtility.BonuscardSlotNameCACCardList ) do
		local f156_local11 = Engine.GetModel( f156_local2, f156_local10 )
		local f156_local12 = Engine.GetModelValue( Engine.GetModel( f156_local11, "name" ) )
		local f156_local13 = Engine.GetModelValue( Engine.GetModel( f156_local11, "image" ) )
		local f156_local14 = Engine.GetModelValue( Engine.GetModel( f156_local11, "itemIndex" ) )
		if not LUI.startswith( Engine.GetModelValue( Engine.GetModel( f156_local11, "ref" ) ), f156_local5 ) then
			table.insert( f156_local0, f156_local1( f156_local12, f156_local13, f156_local10, f156_local14 ) )
		end
	end
	return f156_local0
end

DataSources.WildcardOvercapacityList = DataSourceHelpers.ListSetup( "WildcardOvercapacityList", CoD.CACUtility.PrepareWildcardOverCapactiyList, true )
f0_local3 = function ( f158_arg0, f158_arg1, f158_arg2 )
	local f158_local0 = "WeaponVariantAttachmentList" .. f158_arg1.properties.index
	DataSources[f158_local0] = DataSourceHelpers.ListSetup( f158_local0, function ( f159_arg0 )
		local f159_local0 = {}
		local f159_local1 = f158_arg2.weaponIndex
		local f159_local2 = 0
		for f159_local6, f159_local7 in ipairs( f158_arg2.attachmentsByIndex ) do
			if f159_local7 > CoD.CACUtility.EmptyItemIndex then
				f159_local2 = f159_local2 + 1
				table.insert( f159_local0, {
					models = {
						image = Engine.GetAttachmentImage( f159_local1, f159_local7 ) .. "_wv_icon"
					},
					properties = {
						isLocked = Engine.IsItemAttachmentLocked( f159_arg0, f159_local1, f159_local7 )
					}
				} )
			end
		end
		if CoD.perController[f159_arg0].isShowcaseWeaponMenu then
			return f159_local0
		end
		f159_local3 = CoD.perController[f159_arg0].weaponCategory
		f159_local4 = CoD.CACUtility.PrimaryGunfighterWildcards
		f159_local5 = "cac_mods_primary_gunfighter_wv_icon"
		if f159_local3 == "secondary" then
			f159_local4 = {
				"bonuscard_secondary_gunfighter"
			}
			f159_local5 = "cac_mods_secondary_gunfighter_wv_icon"
		end
		for f159_local6 = 1, f158_arg2.wildcardNeededFromVariantCount, 1 do
			local f159_local9 = Engine.GetItemIndexFromReference( f159_local4[f159_local6] )
			local f159_local10 = f159_local9 and Engine.IsItemLocked( f159_arg0, f159_local9 )
			local f159_local11 = f159_local0[#f159_local0 - #f159_local4 + 1]
			f159_local11.properties.isLocked = f159_local11.properties.isLocked or f159_local10
			table.insert( f159_local0, {
				models = {
					image = f159_local5
				},
				properties = {
					isLocked = f159_local10
				}
			} )
		end
		return f159_local0
	end, true )
	return f158_local0
end

f0_local4 = function ( f160_arg0, f160_arg1 )
	local f160_local0 = {
		models = {
			index = f160_arg1.index,
			variantIndex = f160_arg1.variantIndex,
			variantName = f160_arg1.variantName,
			variantNameBig = f160_arg1.variantNameBig,
			weaponItemIndex = f160_arg1.weaponIndex,
			cacVariantIndex = f160_arg1.cacVariantIndex,
			hintText = Engine.Localize( "MPUI_VARIANT_CONTAINS_LOCKED_ITEMS_DESC" )
		},
		properties = {
			index = f160_arg1.index,
			weaponVariantInfo = f160_arg1
		}
	}
	f160_local0.models.listDataSource = f0_local3( f160_arg0, f160_local0, f160_arg1 )
	return f160_local0
end

f0_local5 = function ( f161_arg0 )
	local f161_local0 = 0
	for f161_local4, f161_local5 in ipairs( f161_arg0 ) do
		if f161_local5 > CoD.CACUtility.EmptyItemIndex then
			f161_local0 = f161_local0 + 1
		end
	end
	return f161_local0
end

f0_local6 = function ( f162_arg0 )
	local f162_local0 = {}
	local f162_local1 = CoD.perController[f162_arg0].weaponIndexForVariant
	table.insert( f162_local0, f0_local4( f162_arg0, {
		variantName = Engine.GetItemName( f162_local1 ),
		variantNameBig = "",
		variantIndex = CoD.CACUtility.EmptyItemIndex,
		weaponIndex = f162_local1,
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
	local f162_local2 = function ( f163_arg0, f163_arg1 )
		local f163_local0 = 0
		if f163_arg0 then
			if f163_arg1[4] > CoD.CACUtility.EmptyItemIndex then
				f163_local0 = f163_local0 + 1
			end
			if f163_arg1[5] > CoD.CACUtility.EmptyItemIndex then
				f163_local0 = f163_local0 + 1
			end
			if f163_arg1[6] > CoD.CACUtility.EmptyItemIndex then
				f163_local0 = f163_local0 + 1
			end
		elseif f163_arg1[3] > CoD.CACUtility.EmptyItemIndex then
			f163_local0 = f163_local0 + 1
		end
		return f163_local0
	end
	
	for f162_local25, f162_local26 in ipairs( CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList( f162_local1 ) ) do
		local f162_local27 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f162_arg0, f162_local26.variantIndex )
		if CoD.CACUtility.EmptyItemIndex < f162_local27.weaponIndex then
			local f162_local6 = {}
			local f162_local7 = {}
			local f162_local8 = f162_local27.attachment
			local f162_local9 = f0_local5( f162_local8 )
			local f162_local10 = 0
			local f162_local11 = 0
			local f162_local12 = false
			local f162_local13 = CoD.perController[f162_arg0].weaponCategory == "primary"
			local f162_local14 = false
			local f162_local15 = false
			local f162_local16 = 2
			if not f162_local13 then
				f162_local16 = 1
			end
			local f162_local17 = f162_local16 + 1
			local f162_local18 = {}
			for f162_local23, f162_local24 in ipairs( f162_local8 ) do
				if CoD.CACUtility.EmptyItemIndex < f162_local24 then
					local f162_local22 = Engine.GetAttachmentIndexByAttachmentTableIndex( f162_local27.weaponIndex, f162_local24 )
					if Engine.IsOptic( f162_local27.weaponIndex, f162_local22 ) then
						f162_local12 = true
					end
					table.insert( f162_local6, f162_local22 )
					if not Engine.IsItemAttachmentLocked( f162_arg0, f162_local27.weaponIndex, f162_local22 ) then
						table.insert( f162_local18, {
							indexSlot = f162_local23,
							index = f162_local22
						} )
					else
						f162_local15 = true
						f162_local14 = true
						table.insert( f162_local18, {
							indexSlot = f162_local23,
							index = CoD.CACUtility.EmptyItemIndex
						} )
						goto basicblock_13:
					end
				end
				table.insert( f162_local6, CoD.CACUtility.EmptyItemIndex )
				table.insert( f162_local18, {
					indexSlot = f162_local23,
					index = CoD.CACUtility.EmptyItemIndex
				} )
			end
			table.sort( f162_local18, function ( f164_arg0, f164_arg1 )
				if f164_arg0.indexSlot == 1 or f164_arg1.indexSlot == 1 then
					return f164_arg0.indexSlot < f164_arg1.indexSlot
				elseif f164_arg0.index == CoD.CACUtility.EmptyItemIndex or f164_arg1.index == CoD.CACUtility.EmptyItemIndex then
					return f164_arg1.index < f164_arg0.index
				else
					return f164_arg0.indexSlot < f164_arg1.indexSlot
				end
			end )
			for f162_local23, f162_local24 in ipairs( f162_local18 ) do
				table.insert( f162_local7, f162_local24.index )
			end
			if IsProgressionEnabled( f162_arg0 ) then
				f162_local11 = f162_local2( f162_local13, f162_local7 )
			end
			f162_local10 = f162_local2( f162_local13, f162_local6 )
			f162_local19 = CoD.CACUtility.PrimaryGunfighterWildcards
			if not f162_local13 then
				f162_local19 = {
					"bonuscard_secondary_gunfighter"
				}
			end
			f162_local20 = false
			for f162_local21 = 1, f162_local10, 1 do
				if Engine.IsItemLocked( f162_arg0, Engine.GetItemIndexFromReference( f162_local19[f162_local21] ) ) then
					f162_local20 = true
					break
				end
			end
			f162_local27.variantNameBig = f162_local27.variantName
			f162_local27.attachmentsByIndex = f162_local6
			f162_local27.unlockedAttachmentsByIndex = f162_local7
			f162_local27.index = f162_local25
			f162_local27.wildcardNeededCount = f162_local11
			f162_local27.wildcardNeededFromVariantCount = f162_local10
			f162_local27.isVariantLinkBroken = f162_local15
			f162_local27.hasLockedAttachments = f162_local14
			f162_local27.hasLockedItems = f162_local14 or f162_local20
			table.insert( f162_local0, f0_local4( f162_arg0, f162_local27 ) )
		end
	end
	return f162_local0
end

CoD.CACUtility.GetWeaponAndAttachments = function ( f165_arg0, f165_arg1 )
	local f165_local0 = 0
	local f165_local1 = false
	local f165_local2 = Engine.GetModel( Engine.GetModelForController( f165_arg1 ), "currentWeapon" )
	if f165_local2 == nil then
		return f165_local0, f165_local1
	end
	for f165_local3 = 1, 4, 1 do
		local f165_local6 = Engine.GetModel( f165_local2, "attachmentName" .. f165_local3 )
		local f165_local7 = Engine.GetModelValue( f165_local6 )
		if f165_local6 and f165_local7 ~= "" then
			f165_local0 = f165_local0 + 1
		end
		if f165_arg0["currentAttachment" .. f165_local3] ~= f165_local7 then
			f165_arg0["currentAttachment" .. f165_local3] = f165_local7
			f165_local1 = true
		end
	end
	f165_arg0.currentWeapon = Engine.GetModelValue( Engine.GetModel( f165_local2, "weaponName" ) )
	return f165_local0, f165_local1
end

CoD.CACUtility.GetLocalizedAttachmentsString = function ( f166_arg0 )
	local f166_local0 = ""
	if f166_arg0.currentAttachment1 ~= nil and f166_arg0.currentAttachment1 ~= "" then
		f166_local0 = Engine.Localize( f166_arg0.currentAttachment1 )
	end
	if f166_arg0.currentAttachment2 ~= nil and f166_arg0.currentAttachment2 ~= "" then
		f166_local0 = f166_local0 .. " + " .. Engine.Localize( f166_arg0.currentAttachment2 )
	end
	if f166_arg0.currentAttachment3 ~= nil and f166_arg0.currentAttachment3 ~= "" then
		f166_local0 = f166_local0 .. " + " .. Engine.Localize( f166_arg0.currentAttachment3 )
	end
	return f166_local0
end

DataSources.WeaponVariantList = DataSourceHelpers.ListSetup( "WeaponVariantList", f0_local6, false )
CoD.WGSV_Category = {}
CoD.WGSV_Category.WEAPON = 1
CoD.WGSV_Category.GUNSMITH_VARIANT = 2
DataSources.WGSV_Category = Engine.CreateModel( Engine.GetGlobalModel(), "WGSV_Category" )
