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
CoD.CACUtility.maxSecondaryAttachments = 6
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
CoD.CACUtility.EXTRA_SLOTS_COD_POINTS_COST = 300
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
	killstreak1 = "killstreak1",
	killstreak2 = "killstreak2",
	killstreak3 = "killstreak3",
	heroAbility = "herogadget",
	heroWeapon = "heroweapon",
	cybercore = "cybercore",
	cybercomAbility1 = "cybercom_ability1",
	cybercomAbility2 = "cybercom_ability2",
	cybercomAbility3 = "cybercom_ability3",
	cybercomTacRig1 = "cybercom_tacrig1",
	cybercomTacRigt2 = "cybercom_tacrig2",
	major1 = "major1",
	major2 = "major2",
	general1 = "general1",
	general2 = "general2",
	general3 = "general3",
	general4 = "general4"
}
CoD.CACUtility.EscalationLoadoutSlots = {
	CoD.CACUtility.loadoutSlotNames.primaryWeapon,
	CoD.CACUtility.loadoutSlotNames.primaryGrenade,
	CoD.CACUtility.loadoutSlotNames.major1,
	CoD.CACUtility.loadoutSlotNames.major2,
	CoD.CACUtility.loadoutSlotNames.general1,
	CoD.CACUtility.loadoutSlotNames.general2,
	CoD.CACUtility.loadoutSlotNames.general3,
	CoD.CACUtility.loadoutSlotNames.general4
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
	"primarygrenade",
	"specicalgrenade",
	"primarygadget",
	"primarygadgetattachment1",
	"secondarygadget",
	"secondarygadgetattachment1",
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
	"cybercom_tacrig2",
	"major1",
	"major2",
	"general1",
	"general2",
	"general3",
	"general4"
}
local f0_local0 = CoD.CACUtility
local f0_local1 = {
	"primary",
	"primarycamo",
	"primaryreticle",
	"primaryemblem",
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
	"secondaryemblem",
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
	"primarygrenade",
	"specialgrenade",
	"primarygadget",
	"primarygadgetattachment1",
	"secondarygadget",
	"secondarygadgetattachment1",
	"herogadget",
	"heroweapon",
	"specialty1",
	"specialty2",
	"specialty3",
	"specialty4",
	"specialty5",
	"specialty6",
	"bonuscard1",
	"bonuscard2"
}
local f0_local2 = "bonuscard3"
local f0_local3 = "cybercom_tacrig1"
local f0_local4 = "cybercom_tacrig2"
local f0_local5 = "major1"
local f0_local6 = "major2"
local f0_local7 = "general1"
local f0_local8 = "general2"
local f0_local9 = "general3"
local f0_local10 = "general4"
f0_local1[33] = f0_local2
f0_local1[34] = f0_local3
f0_local1[35] = f0_local4
f0_local1[36] = f0_local5
f0_local1[37] = f0_local6
f0_local1[38] = f0_local7
f0_local1[39] = f0_local8
f0_local1[40] = f0_local9
f0_local1[41] = f0_local10
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
	"primarygrenade",
	"specialgrenade",
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
	"melee_sword"
}
CoD.CACUtility.WeaponsWithNoCPCamos = {
	bowie_knife = true,
	knife_loadout = true,
	melee_knuckles = true,
	melee_butterfly = true,
	melee_wrench = true,
	pistol_shotgun = true,
	melee_crowbar = true,
	melee_sword = true,
	ar_garand = true,
	special_crossbow = true
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
	special_crossbow = true
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
CoD.CACUtility.CreateList = function ( baseString, minValue, maxValue )
	local listTable = {}
	for i = minValue, maxValue, 1 do
		table.insert( listTable, baseString .. i )
	end
	return listTable
end

CoD.CACUtility.CreateList2 = function ( preString, postString, minValue, maxValue )
	local listTable = {}
	for i = minValue, maxValue, 1 do
		table.insert( listTable, preString .. i .. postString )
	end
	return listTable
end

CoD.CACUtility.PrimaryWeaponSlotNameList = {
	"primary"
}
CoD.CACUtility.PrimaryAttachmentSlotNameList = CoD.CACUtility.CreateList( "primaryattachment", 1, CoD.CACUtility.maxPrimaryAttachments )
CoD.CACUtility.PrimaryAttachmentCVSlotNameList = CoD.CACUtility.CreateList2( "primaryattachment", "cosmeticvariant", 1, CoD.CACUtility.maxPrimaryAttachments )
table.insert( CoD.CACUtility.PrimaryAttachmentCVSlotNameList, "primary" .. CoD.CACUtility.primaryWeaponPrestigeSlot .. "cosmeticvariant" )
CoD.CACUtility.SecondaryWeaponSlotNameList = {
	"secondary"
}
CoD.CACUtility.SecondaryAttachmentSlotNameList = CoD.CACUtility.CreateList( "secondaryattachment", 1, CoD.CACUtility.maxSecondaryAttachments )
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
CoD.CACUtility.PrimaryGrenadeWeaponSlotNameList = {
	"primarygrenade"
}
CoD.CACUtility.SpecialGrenadeWeaponSlotNameList = {
	"specialgrenade"
}
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
CoD.CACUtility.HeroWeaponList = {
	"heroweapon"
}
CoD.CACUtility.HeroAbilityList = {
	"herogadget"
}
CoD.CACUtility.MajorItemsList = {
	"major1",
	"major2"
}
CoD.CACUtility.GeneralItemsList = {
	"general1",
	"general2",
	"general3",
	"general4"
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
	CoD.CACUtility.PrimaryGrenadeWeaponSlotNameList,
	CoD.CACUtility.SpecialGrenadeWeaponSlotNameList,
	CoD.CACUtility.Perk1SlotNameList,
	CoD.CACUtility.Perk2SlotNameList,
	CoD.CACUtility.Perk3SlotNameList,
	CoD.CACUtility.BonuscardSlotNameList,
	CoD.CACUtility.KillstreakNameList,
	CoD.CACUtility.CybercoreList,
	CoD.CACUtility.TacticalRigList,
	CoD.CACUtility.HeroWeaponList,
	CoD.CACUtility.HeroAbilityList,
	CoD.CACUtility.MajorItemsList,
	CoD.CACUtility.GeneralItemsList
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
CoD.CACUtility.CustomClass_LastClassNum = 0
CoD.CACUtility.CustomClass_LastSelection = "primary"
CoD.CACUtility.CustomClass_PerClassLastSelection = {}
CoD.CACUtility.CACStatusAvailable = {}
CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE = 1
CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD = 2
CoD.CACUtility.CACStatusAvailable.AVAILABLE = 3
CoD.CACUtility.ValidateMPClasses = function ( controller )
	local isInvalidCamoEquipped = function ( itemIndex, camoIndex )
		local itemRef = Engine.GetItemRef( itemIndex )
		local camoMode = Engine.TableLookup( nil, CoD.attachmentTable, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_INDEX, camoIndex, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_ATTACHPOINT, "camo", Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_WEAPONOPTION_FILTER )
		if camoMode == CoD.WeaponOptionFilterToString( Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_ZM ) and CoD.CACUtility.WeaponsWithNoZMCamos[itemRef] then
			return true
		elseif camoMode == CoD.WeaponOptionFilterToString( Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_MP ) and CoD.CACUtility.WeaponsWithNoMPCamos[itemRef] then
			return true
		elseif camoMode == CoD.WeaponOptionFilterToString( Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_CP ) and CoD.CACUtility.WeaponsWithNoCPCamos[itemRef] then
			return true
		elseif camoMode == CoD.WeaponOptionFilterToString( Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_BM ) then
			if CoD.BlackMarketUtility.WeaponsWithNoBMCamos[itemRef] then
				return true
			end
			local camoId = Engine.TableLookup( nil, CoD.attachmentTable, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_INDEX, camoIndex, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_ATTACHPOINT, "camo", Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_REFERENCE )
			if CoD.BlackMarketUtility.IsItemLocked( controller, camoId .. ";" .. itemRef ) then
				return true
			end
		end
		return false
	end
	
	local validateClass = function ( classDDLRoot )
		if not classDDLRoot then
			return 
		end
		local weaponTypeTable = {
			{
				slotName = "primary",
				attachments = CoD.CACUtility.PrimaryAttachmentSlotNameList
			},
			{
				slotName = "secondary",
				attachments = CoD.CACUtility.SecondaryAttachmentSlotNameList
			}
		}
		for i, weaponType in ipairs( weaponTypeTable ) do
			local weapon = CoD.SafeGetDDL( classDDLRoot, weaponType.slotName )
			if weapon and weapon ~= CoD.CACUtility.EmptyItemIndex then
				local weaponRef = Engine.GetItemRef( weapon, Enum.eModes.MODE_MULTIPLAYER ) .. "_mp"
				if weaponRef == "gadget_heat_wave_mp" then
					classDDLRoot[weaponType.slotName]:set( 0 )
				end
				for _, attachmentName in ipairs( weaponType.attachments ) do
					local attachment = CoD.SafeGetDDL( classDDLRoot, attachmentName )
					local attachmentCV = CoD.SafeGetDDL( classDDLRoot, attachmentName .. "cosmeticvariant" )
					if attachment and attachment ~= CoD.CACUtility.EmptyItemIndex and attachmentCV and attachmentCV ~= CoD.CACUtility.EmptyItemIndex then
						local attachmentRef = Engine.GetAttachmentRef( weapon, attachment, Enum.eModes.MODE_MULTIPLAYER )
						local weaponWithAttachment = weaponRef .. "+" .. attachmentRef
						local variantTable = Engine.GetAttachmentCosmeticVariantTable( weaponWithAttachment )
						if not variantTable or not variantTable[attachmentRef] or not variantTable[attachmentRef].variants or not variantTable[attachmentRef].variants[attachmentCV] or CoD.BlackMarketUtility.IsItemLocked( controller, variantTable[attachmentRef].variants[attachmentCV].acvName ) then
							local f5_local6 = LUI.getTableFromPath( attachmentName .. "cosmeticvariant", classDDLRoot )
							f5_local6:set( CoD.CACUtility.EmptyItemIndex )
						end
					end
				end
				if weaponType.slotName == "secondary" then
					for iAttach = 4, 8, 1 do
						local attachmentName = "secondaryattachment" .. iAttach
						local attachment = CoD.SafeGetDDL( classDDLRoot, attachmentName )
						if attachment ~= nil and attachment ~= 0 and not LuaUtils.FindItemInArray( CoD.CACUtility.mpPrestigeAttachments, Engine.GetAttachmentRef( weapon, attachment, Enum.eModes.MODE_MULTIPLAYER ) ) then
							classDDLRoot[attachmentName]:set( 0 )
						end
						local attachmentCV = CoD.SafeGetDDL( classDDLRoot, attachmentName .. "cosmeticvariant" )
						if attachmentCV ~= nil and attachmentCV ~= 0 then
							classDDLRoot[attachmentName .. "cosmeticvariant"]:set( 0 )
						end
					end
				end
			end
		end
		local id = CoD.SafeGetDDL( classDDLRoot, "primarygadget" )
		local weaponRef = Engine.GetItemRef( id, Enum.eModes.MODE_MULTIPLAYER )
		if CoD.ContractWeaponTiers[weaponRef] then
			classDDLRoot.primarygadget:set( 0 )
		end
		local weaponReticleTable = {
			{
				slotName = "primaryreticle",
				weaponIndex = CoD.SafeGetDDL( classDDLRoot, "primary" ),
				attachmentIndex = CoD.SafeGetDDL( classDDLRoot, "primaryattachment1" )
			},
			{
				slotName = "secondaryreticle",
				weaponIndex = CoD.SafeGetDDL( classDDLRoot, "secondary" ),
				attachmentIndex = CoD.SafeGetDDL( classDDLRoot, "secondaryattachment1" )
			}
		}
		for _, f5_local3 in ipairs( weaponReticleTable ) do
			local weaponOption = CoD.SafeGetDDL( classDDLRoot, f5_local3.slotName )
			if weaponOption then
				local weaponOptionIndex = Engine.TableLookup( controller, CoD.attachmentTable, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_REFERENCE, "reticle_" .. weaponOption, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_INDEX )
				local attachmentRef = Engine.GetAttachmentRef( f5_local3.weaponIndex, f5_local3.attachmentIndex )
				local attachmentIndex = Engine.GetAttachmentIndexByRef( attachmentRef )
				if Engine.IsWeaponOptionLockedEntitlement( controller, attachmentIndex, weaponOptionIndex ) then
					classDDLRoot[f5_local3.slotName]:set( 0 )
				end
			end
		end
		local weaponCamoTable = {
			{
				slotName = "primarycamo",
				weaponIndex = CoD.SafeGetDDL( classDDLRoot, "primary" ),
				attachmentIndex = CoD.CACUtility.ATTACHMENT_NONE
			},
			{
				slotName = "secondarycamo",
				weaponIndex = CoD.SafeGetDDL( classDDLRoot, "secondary" ),
				attachmentIndex = CoD.CACUtility.ATTACHMENT_NONE
			}
		}
		for _, f5_local4 in ipairs( weaponCamoTable ) do
			local weaponOption = CoD.SafeGetDDL( classDDLRoot, f5_local4.slotName )
			if weaponOption and (Engine.IsWeaponOptionLockedEntitlement( controller, f5_local4.attachmentIndex, weaponOption ) or isInvalidCamoEquipped( f5_local4.weaponIndex, weaponOption )) then
				classDDLRoot[f5_local4.slotName]:set( 0 )
			end
		end
		local perkTable = {
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
		}
		for _, f5_local5 in ipairs( perkTable ) do
			local perk = CoD.SafeGetDDL( classDDLRoot, f5_local5.slotName )
			if perk and Engine.GetLoadoutSlotForItem( perk ) ~= f5_local5.expectedType then
				classDDLRoot[f5_local5.slotName]:set( 0 )
			end
		end
	end
	
	Engine.ExecNow( controller, "emblemGetProfile" )
	ValidateEmblemBackground( controller, Engine.GetEmblemBackgroundId() )
	for _, mode in ipairs( {
		Enum.eModes.MODE_MULTIPLAYER,
		Enum.eModes.MODE_CAMPAIGN,
		Enum.eModes.MODE_ZOMBIES
	} ) do
		local heroList = Engine.GetHeroList( mode )
		for _, hero in ipairs( heroList ) do
			local heroIndex = hero.bodyIndex
			local camoIndex = Engine.GetHeroShowcaseWeaponAttribute( controller, mode, heroIndex, "camoIndex" )
			if Engine.IsWeaponOptionLockedEntitlement( controller, CoD.CACUtility.ATTACHMENT_NONE, camoIndex ) then
				Engine.SetHeroShowcaseWeaponAttribute( controller, mode, heroIndex, "camoIndex", 0 )
			end
		end
	end
	f3_local0 = Engine.CreateModel( Engine.GetModelForController( controller ), "classesValidated", true )
	local classesValidated = f3_local0:get()
	if classesValidated ~= true then
		local ddlBase = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_LOADOUTS_OFFLINE )
		if ddlBase then
			local statsLocations = {
				"cacLoadouts"
			}
			for _, f3_local5 in ipairs( statsLocations ) do
				local loadoutsBase = ddlBase[f3_local5]
				if loadoutsBase then
					local heroList = Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER )
					for _, hero in ipairs( heroList ) do
						if IsIntDvarNonZero( "mp_prototype" ) then
							CoD.CACUtility.SetDefaultLoadout( loadoutsBase.customclass, hero.bodyIndex, Enum.eModes.MODE_MULTIPLAYER )
						end
					end
					Engine.Exec( controller, "saveLoadout " .. Enum.eModes.MODE_MULTIPLAYER )
					hero = Engine.GetModelForController( controller )
					hero = hero:create( "classesValidated" )
					hero:set( true )
				end
			end
		end
	end
end

CoD.CACUtility.SetDefaultLoadouts = function ( data )
	local cacRoot = Engine.GetCACRoot( data.controller )
	local mode = Engine.CurrentSessionMode()
	if mode == Enum.eModes.MODE_MULTIPLAYER then
		local heroList = Engine.GetHeroList( mode )
		if cacRoot then
			for _, hero in ipairs( heroList ) do
				CoD.CACUtility.SetDefaultLoadout( cacRoot.customclass, hero.bodyIndex, mode )
			end
		end
	end
end

CoD.CACUtility.SetDefaultLoadout = function ( customClassDDLRoot, characterIndex, mode )
	if not customClassDDLRoot then
		return 
	end
	local classIndex = Engine.GetPostionRoleCustomClassIndex( Engine.CurrentSessionMode(), characterIndex )
	local classDDLRoot = customClassDDLRoot[classIndex]
	if not classDDLRoot then
		return 
	end
	local defaultPositionRoleLoadout = Engine.GetPostionRoleDefaultLoadout( mode, characterIndex )
	if defaultPositionRoleLoadout then
		for i = 1, #CoD.CACUtility.clearLoadoutSlotOrder, 1 do
			local loadoutName = CoD.CACUtility.clearLoadoutSlotOrder[i]
			classDDLRoot[loadoutName]:set( CoD.CACUtility.EmptyItemIndex )
		end
		for loadoutName, itemIndex in pairs( defaultPositionRoleLoadout ) do
			if type( itemIndex ) == "table" then
				for attachmentName, attachmentIndex in pairs( itemIndex ) do
					classDDLRoot[attachmentName]:set( attachmentIndex )
				end
			end
			classDDLRoot[loadoutName]:set( itemIndex )
		end
	end
end

CoD.CACUtility.SetCACRootToDefault = function ( data )
	if data.classDDLRoot and data.eMode == Enum.eModes.MODE_MULTIPLAYER then
		local heroList = Engine.GetHeroList( data.eMode )
		for _, hero in ipairs( heroList ) do
			local customClassIndex = Engine.GetPostionRoleCustomClassIndex( data.eMode, hero.bodyIndex )
			CoD.CACUtility.SetDefaultLoadout( data.classDDLRoot.customclass, customClassIndex, data.eMode )
		end
	end
end

CoD.CACUtility.ValidateMPBlackMarketAttachments = function ( controller )
	local validateClass = function ( classDDLRoot )
		if not classDDLRoot then
			return 
		end
		local weaponTypeTable = {
			{
				slotName = "primary",
				attachments = CoD.CACUtility.PrimaryAttachmentSlotNameList
			},
			{
				slotName = "secondary",
				attachments = CoD.CACUtility.SecondaryAttachmentSlotNameList
			}
		}
		for i, weaponType in ipairs( weaponTypeTable ) do
			local weapon = CoD.SafeGetDDL( classDDLRoot, weaponType.slotName )
			if weapon and weapon ~= CoD.CACUtility.EmptyItemIndex then
				local weaponRef = Engine.GetItemRef( weapon, Enum.eModes.MODE_MULTIPLAYER ) .. "_mp"
				for _, attachmentName in ipairs( weaponType.attachments ) do
					local attachment = CoD.SafeGetDDL( classDDLRoot, attachmentName )
					local attachmentCV = CoD.SafeGetDDL( classDDLRoot, attachmentName .. "cosmeticvariant" )
					if attachment and attachment ~= CoD.CACUtility.EmptyItemIndex and attachmentCV and attachmentCV ~= CoD.CACUtility.EmptyItemIndex then
						local attachmentRef = Engine.GetAttachmentRef( weapon, attachment, Enum.eModes.MODE_MULTIPLAYER )
						local weaponWithAttachment = weaponRef .. "+" .. attachmentRef
						local variantTable = Engine.GetAttachmentCosmeticVariantTable( weaponWithAttachment )
						if not variantTable or not variantTable[attachmentRef] or not variantTable[attachmentRef].variants or not variantTable[attachmentRef].variants[attachmentCV] or CoD.BlackMarketUtility.IsItemLocked( controller, variantTable[attachmentRef].variants[attachmentCV].acvName ) then
							local f10_local6 = LUI.getTableFromPath( attachmentName .. "cosmeticvariant", classDDLRoot )
							f10_local6:set( CoD.CACUtility.EmptyItemIndex )
						end
					end
				end
			end
		end
		local weaponReticleTable = {
			{
				slotName = "primaryreticle",
				attachmentIndex = CoD.SafeGetDDL( classDDLRoot, "primaryattachment1" )
			},
			{
				slotName = "secondaryreticle",
				attachmentIndex = CoD.SafeGetDDL( classDDLRoot, "secondaryattachment1" )
			}
		}
		for _, weaponOptionType in ipairs( weaponReticleTable ) do
			local weaponOption = CoD.SafeGetDDL( classDDLRoot, weaponOptionType.slotName )
			if weaponOption then
				local attachmentIndex = Engine.TableLookup( CoD.attachmentTable, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_INDEX, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_REFERENCE, "reticle_" .. weaponOption )
				if Engine.IsWeaponOptionLockedEntitlement( controller, weaponOptionType.attachmentIndex, attachmentIndex ) then
					classDDLRoot[weaponOptionType.slotName]:set( 0 )
				end
			end
		end
		local weaponCamoTable = {
			{
				slotName = "primarycamo",
				attachmentIndex = CoD.CACUtility.ATTACHMENT_NONE
			},
			{
				slotName = "secondarycamo",
				attachmentIndex = CoD.CACUtility.ATTACHMENT_NONE
			}
		}
		for _, weaponOptionType in ipairs( weaponCamoTable ) do
			local weaponOption = CoD.SafeGetDDL( classDDLRoot, weaponOptionType.slotName )
			if weaponOption and Engine.IsWeaponOptionLockedEntitlement( controller, weaponOptionType.attachmentIndex, weaponOption ) then
				classDDLRoot[weaponOptionType.slotName]:set( 0 )
			end
		end
		for _, weaponOptionType in ipairs( {
			Enum.eModes.MODE_MULTIPLAYER,
			Enum.eModes.MODE_CAMPAIGN,
			Enum.eModes.MODE_ZOMBIES
		} ) do
			local heroList = Engine.GetHeroList( weaponOptionType )
			for _, hero in ipairs( heroList ) do
				local heroIndex = hero.bodyIndex
				local camoIndex = Engine.GetHeroShowcaseWeaponAttribute( controller, weaponOptionType, heroIndex, "camoIndex" )
				if Engine.IsWeaponOptionLockedEntitlement( controller, CoD.CACUtility.ATTACHMENT_NONE, camoIndex ) then
					Engine.SetHeroShowcaseWeaponAttribute( controller, weaponOptionType, heroIndex, "camoIndex", 0 )
				end
			end
		end
	end
	
	local f9_local0 = {}
	local f9_local1 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_LOADOUTS_ARENA )
	local f9_local2 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_LOADOUTS_CUSTOM )
	local f9_local3 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	local ddlBase = f9_local1
	for i = 1, #ddlBase, 1 do
		local loadoutsBase = ddlBase[i]
		if loadoutsBase then
			for i = 0, 9, 1 do
				validateClass( loadoutsBase.cacLoadouts[i] )
			end
		end
	end
	local ddlBase = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_CLASS_SETS )
	if ddlBase then
		local statsLocations = {
			"publicMatchClassSets",
			"customMatchClassSets",
			"leagueMatchClassSets"
		}
		for _, f9_local4 in ipairs( statsLocations ) do
			local classSetBase = ddlBase[f9_local4]
			if classSetBase then
				for i = 0, 9, 1 do
					for j = 0, 9, 1 do
						validateClass( classSetBase[i].customclass[j] )
					end
				end
			end
		end
	end
end

CoD.CACUtility.ValidateMPLootWeapons = function ( controller )
	local ValidateWeapons = function ( weaponRows, ddlBase )
		local lootNameCol = 0
		local modified = false
		for _, weaponRow in ipairs( weaponRows ) do
			local weaponName = Engine.TableLookupGetColumnValueForRow( CoD.BlackMarketUtility.lootTableName, weaponRow, lootNameCol )
			local itemIndex = Engine.GetItemIndexFromReference( weaponName, Enum.eModes.MODE_MULTIPLAYER )
			local itemQuantity = CoD.BlackMarketUtility.GetItemQuantity( controller, weaponName )
			local statPath = "itemstats." .. itemIndex .. ".purchased"
			if itemQuantity == 0 then
				local stat = LUI.getTableFromPath( statPath, ddlBase )
				if stat and stat:get() ~= 0 then
					stat:set( 0 )
					modified = true
				end
			end
			local stat = LUI.getTableFromPath( statPath, ddlBase )
			if stat and stat:get() == 0 then
				stat:set( 1 )
				modified = true
			end
		end
		return modified
	end
	
	local ddlBase = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if ddlBase then
		local modified = false
		if ValidateWeapons( CoD.BlackMarketUtility.GetLootTypeRows( "weapon" ), ddlBase ) or ValidateWeapons( CoD.BlackMarketUtility.GetLootTypeRows( "melee_weapon" ), ddlBase ) then
			UploadStats( nil, controller )
		end
	end
end

CoD.CACUtility.ValidateZMBGBEntitlement = function ( controller )
	for packIndex = 0, 9, 1 do
		for bgbIndex = 0, 4, 1 do
			local itemIndex = Engine.GetBubbleGumBuff( controller, packIndex, bgbIndex )
			local dlcId = CoD.CACUtility.GetDLCIdForBubbleGum( itemIndex )
			if dlcId and dlcId ~= "" and not Engine.HasEntitlement( controller, dlcId ) then
				Engine.Exec( controller, "resetBubbleGumPackOnline " .. packIndex .. " MENU_BGB_PACK_" .. packIndex + 1 )
			end
		end
	end
end

CoD.CACUtility.GetDLCIdForBubbleGum = function ( itemIndex )
	local idColumn = 0
	local dlcColumn = 15
	return Engine.TableLookup( "gamedata/stats/zm/zm_statsTable.csv", dlcColumn, idColumn, itemIndex )
end

CoD.OverlayUtility.AddSystemOverlay( "UnlockClassItem", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.systemOverlay_UnlockFrame",
	title = Engine.Localize( "MPUI_CONFIRM_PURCHASE_CAPS" ),
	description = function ( controller, itemIndex, upgradeItemIndex, weaponVariantEquip )
		local f15_local0 = CoD.isCampaign
		local f15_local1 = "CPUI_UNLOCK_ITEM"
		local unlockItemString = "MPUI_UNLOCK_ITEM"
		local f15_local2 = f15_local0 and f15_local1 or unlockItemString
		if upgradeItemIndex then
			return Engine.Localize( f15_local2, Engine.GetItemName( itemIndex ) .. "_UPGRADED" )
		else
			return Engine.Localize( f15_local2, Engine.GetItemName( itemIndex ) )
		end
	end,
	supportText = function ( controller, itemIndex, upgradeItemIndex, weaponVariantEquip )
		return Engine.Localize( Engine.GetItemName( itemIndex ) )
	end,
	image = function ( controller, itemIndex, upgradeItemIndex, weaponVariantEquip )
		local weaponCategory = CoD.perController[controller].weaponCategory
		local appendText = ""
		if weaponCategory == "specialist" then
			return Engine.GetItemImage( itemIndex, CoD.PlayerRoleUtility.customizationMode ) .. "_large"
		elseif weaponCategory and LUI.startswith( weaponCategory, "killstreak" ) then
			appendText = "_menu_large"
		elseif not (not weaponCategory or not LUI.startswith( weaponCategory, "specialty" )) or weaponCategory == "primarygadget" or weaponCategory == "secondarygadget" then
			appendText = "_256"
		elseif weaponCategory and LUI.startswith( weaponCategory, "cybercom_ability" ) then
			appendText = "_LR_tu1"
		end
		return Engine.GetItemImage( itemIndex ) .. appendText
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.Unlock,
	listDatasource = function ( controller, itemIndex, upgradeItemIndex, weaponVariantEquip )
		DataSources.UnlockTokenMenuList = DataSourceHelpers.ListSetup( "UnlockTokenMenuList", function ( controller )
			local list = {}
			local weaponCategory = CoD.perController[controller].weaponCategory
			local isInCybercoreUpgrade = CoD.perController[controller].isInCybercoreUpgrade or false
			local addItemListButton = function ( displayText, action )
				return {
					models = {
						displayText = displayText,
						itemIndex = itemIndex,
						upgradeItemIndex = upgradeItemIndex
					},
					properties = {
						action = action
					}
				}
			end
			
			local UnlockAction = function ( self, element, controller, actionParam, menu )
				UnlockItem( menu, element, controller )
				local previousMenu = GoBackAndUpdateStateOnPreviousMenu( menu, controller )
				if weaponCategory == "specialist" and previousMenu.characterCarousel then
					previousMenu.characterCarousel.activeWidget:processEvent( {
						name = "update_state",
						controller = controller
					} )
				end
				if isInCybercoreUpgrade then
					UpdateCybercoreTree( previousMenu, previousMenu, controller )
				end
			end
			
			local WeaponVariantUnlockAction = function ( self, element, controller, actionParam, menu )
				UnlockItem( menu, element, controller )
				local variantInfoElement = menu.acceptData.variantInfoElement
				if variantInfoElement then
					local previousMenu = GoBack( menu, controller )
					SetWeaponVariant( previousMenu, variantInfoElement, controller )
				end
			end
			
			local UnlockAndEquipAction = function ( self, element, controller, actionParam, menu )
				local weaponCategory = CoD.perController[controller].weaponCategory
				local newMenu = UnlockAndEquipItem( menu, element, controller )
				if weaponCategory == "specialist" then
					local previousMenu = GoBack( menu, controller )
					SendClientScriptMenuChangeNotify( controller, previousMenu, false )
					GoBack( previousMenu, controller )
				elseif newMenu then
					GoBackToCustomClassMenu( newMenu, controller )
				else
					local previousMenu = GoBack( menu, controller )
					previousMenu:processEvent( {
						name = "update_state",
						menu = previousMenu
					} )
				end
			end
			
			local UnlockAndEquipActionForMPFirstTimeSetup = function ( self, element, controller, actionParam, menu )
				local heroIndex = CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits
				local equippedSlot = CoD.PlayerRoleUtility.GetHeroEquippedSlot( controller, itemIndex )
				local previousMenu = GoBack( menu, controller )
				if equippedSlot then
					element.itemIndex = itemIndex
					if not actionParam then
						actionParam = {}
					end
					actionParam.previousMenu = previousMenu
					UnlockAndEquipHeroForMPFirstTimeSetup( self, element, controller, actionParam, menu )
				end
				GoBackToMenu( previousMenu, controller, "Lobby" )
			end
			
			local PermanentUnlockAction = function ( self, element, controller, actionParam, menu )
				PermanentlyUnlockItem( menu, element, controller )
				local previousMenu = GoBackAndUpdateStateOnPreviousMenu( menu, controller )
			end
			
			local CancelUnlockAction = function ( self, element, controller, actionParam, menu )
				GoBack( menu, controller )
			end
			
			local isEquippable = not isInCybercoreUpgrade
			if CoD.PlayerRoleUtility.customizationMode == Enum.eModes.MODE_MULTIPLAYER and IsFirstTimeSetup( controller, Enum.eModes.MODE_MULTIPLAYER ) then
				table.insert( list, addItemListButton( "MENU_UNLOCK_AND_EQUIP", UnlockAndEquipActionForMPFirstTimeSetup ) )
			elseif isInCybercoreUpgrade then
				table.insert( list, addItemListButton( "MENU_UNLOCK", UnlockAction ) )
				table.insert( list, addItemListButton( "MENU_CANCEL_UNLOCK", CancelUnlockAction ) )
			elseif upgradeItemIndex ~= nil then
				local isItemEquipped = false
				local searchingSlots = CoD.CACUtility.GetSlotListWithSlot( weaponCategory )
				for _, slotName in ipairs( searchingSlots ) do
					if CoD.CACUtility.GetItemEquippedInSlot( slotName, controller ) == itemIndex then
						isItemEquipped = true
					end
				end
				if isItemEquipped then
					table.insert( list, addItemListButton( "MENU_UNLOCK", UnlockAndEquipAction ) )
				else
					table.insert( list, addItemListButton( "MENU_UNLOCK", UnlockAction ) )
					table.insert( list, addItemListButton( "MENU_UNLOCK_AND_EQUIP", UnlockAndEquipAction ) )
				end
				table.insert( list, addItemListButton( "MENU_CANCEL_UNLOCK", CancelUnlockAction ) )
			elseif weaponVariantEquip then
				table.insert( list, addItemListButton( "MENU_UNLOCK_AND_EQUIP", WeaponVariantUnlockAction ) )
				table.insert( list, addItemListButton( "MENU_CANCEL_UNLOCK", CancelUnlockAction ) )
			elseif CoD.PlayerRoleUtility.customizationMode == Enum.eModes.MODE_MULTIPLAYER and HavePermanentUnlockTokens( controller ) then
				table.insert( list, addItemListButton( "MENU_UNLOCK", UnlockAction ) )
				table.insert( list, addItemListButton( "MENU_UNLOCK_AND_EQUIP", UnlockAndEquipAction ) )
				table.insert( list, addItemListButton( "MENU_PERMANENTLY_UNLOCK", PermanentUnlockAction, false ) )
				table.insert( list, addItemListButton( "MENU_CANCEL_UNLOCK", CancelUnlockAction ) )
			else
				table.insert( list, addItemListButton( "MENU_UNLOCK", UnlockAction ) )
				table.insert( list, addItemListButton( "MENU_UNLOCK_AND_EQUIP", UnlockAndEquipAction ) )
				table.insert( list, addItemListButton( "MENU_CANCEL_UNLOCK", CancelUnlockAction ) )
			end
			return list
		end, true )
		return "UnlockTokenMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
CoD.OverlayUtility.AddSystemOverlay( "PrestigeWeapon", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.systemOverlay_Full_BasicFrame_Prestige",
	title = function ( controller, itemIndexModel )
		return Engine.ToUpper( Engine.Localize( "MENU_ENTER_WEAPON_PRESTIGE_X", CoD.CACUtility.GetWeaponPLevel( controller, Engine.GetModelValue( itemIndexModel ) ) + 1 ) )
	end,
	description = function ( controller, itemIndexModel )
		return Engine.Localize( "MENU_WEAPON_PRESTIGE_MESSAGE_" .. CoD.CACUtility.GetWeaponPLevel( controller, Engine.GetModelValue( itemIndexModel ) ) + 1, Engine.GetItemName( Engine.GetModelValue( itemIndexModel ) ) )
	end,
	supportText = function ( controller, itemIndexModel )
		return Engine.Localize( Engine.GetItemName( Engine.GetModelValue( itemIndexModel ) ) )
	end,
	image = function ( controller, itemIndexModel )
		return Engine.GetItemImage( Engine.GetModelValue( itemIndexModel ) )
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.Unlock,
	listDatasource = function ( controller, itemIndexModel )
		DataSources.PrestigeWeaponOptionsList = DataSourceHelpers.ListSetup( "PrestigeWeaponOptionsList", function ( controller )
			local list = {}
			local addOption = function ( text, action )
				return {
					models = {
						displayText = text
					},
					properties = {
						action = action
					}
				}
			end
			
			local weaponPrestigeItem = function ( self, element, controller, actionParam, menu )
				local classCount = Engine.GetCustomClassCount( controller )
				local editClassModel = Engine.GetModel( Engine.GetModelForController( controller ), "CustomClassList" )
				local selectedItemIndex = Engine.GetModelValue( itemIndexModel )
				for index = 1, classCount, 1 do
					local classNum = index - 1
					local currentClassModel = Engine.GetModel( editClassModel, "class" .. index )
					if CoD.SafeGetModelValue( currentClassModel, "primary.itemIndex" ) == selectedItemIndex then
						for i = 1, CoD.CACUtility.maxPrimaryAttachments, 1 do
							Engine.SetClassItem( controller, classNum, "primaryattachment" .. i, CoD.CACUtility.EmptyItemIndex )
						end
					end
					if CoD.SafeGetModelValue( currentClassModel, "secondary.itemIndex" ) == selectedItemIndex then
						for i = 1, CoD.CACUtility.maxSecondaryAttachments, 1 do
							Engine.SetClassItem( controller, classNum, "secondaryattachment" .. i, CoD.CACUtility.EmptyItemIndex )
						end
					end
				end
				local classSetCount = Engine.GetNumberOfClassSetsOwned( controller )
				for classSetIndex = 1, classSetCount, 1 do
					local classSetNum = classSetIndex - 1
					for classIndex = 1, classCount, 1 do
						local classNum = classIndex - 1
						local primaryItemIndex = Engine.GetClassSetItem( controller, classSetNum, classNum, "primary" )
						local secondaryItemIndex = Engine.GetClassSetItem( controller, classSetNum, classNum, "secondary" )
						if primaryItemIndex == selectedItemIndex then
							for i = 1, CoD.CACUtility.maxPrimaryAttachments, 1 do
								Engine.SetClassSetItem( controller, classSetNum, classNum, "primaryattachment" .. i, CoD.CACUtility.EmptyItemIndex )
							end
						end
						if secondaryItemIndex == selectedItemIndex then
							for i = 1, CoD.CACUtility.maxPrimaryAttachments, 1 do
								Engine.SetClassSetItem( controller, classSetNum, classNum, "secondaryattachment" .. i, CoD.CACUtility.EmptyItemIndex )
							end
						end
					end
				end
				local classSetIndex = Engine.GetPlayerStats( controller )
				local weaponStats = classSetIndex.itemstats[Engine.GetModelValue( itemIndexModel )]
				weaponStats.xp:set( 0 )
				weaponStats.pLevel:set( math.min( weaponStats.pLevel:get() + 1, CoD.CACUtility.maxWeaponPrestige ) )
				UploadStats( menu, controller )
				SaveLoadout( menu, controller )
				Engine.ForceNotifyModelSubscriptions( itemIndexModel )
				GoBack( menu, controller )
			end
			
			table.insert( list, addOption( "MENU_ENTER_WEAPON_PRESTIGE", weaponPrestigeItem ) )
			table.insert( list, addOption( "MENU_CANCEL", CoD.OverlayUtility.DefaultButtonAction ) )
			return list
		end, true )
		return "PrestigeWeaponOptionsList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
CoD.CACUtility.GetCameraNameForAttachments = function ( attachmentsString, isGunsmithCamera )
	local suppressor = 0
	local extbarrel = 0
	for token in string.gmatch( attachmentsString, "[^+]+" ) do
		if token == "suppressed" then
			suppressor = 1
		end
		if token == "extbarrel" then
			extbarrel = 1
		end
	end
	local prefix = "select"
	if isGunsmithCamera ~= nil and isGunsmithCamera then
		prefix = "gunsmith"
	end
	local suffix = ""
	if suppressor == 1 then
		if extbarrel == 1 then
			suffix = "_extbarrel_suppressor"
		else
			suffix = "_suppressor"
		end
	elseif extbarrel == 1 then
		suffix = "_extbarrel"
	else
		suffix = "01"
	end
	return prefix .. suffix
end

CoD.CACUtility.GetImageForItemRefString = function ( itemRefString )
	local itemIndex = Engine.GetItemIndexFromReference( itemRefString )
	return Engine.GetItemImage( itemIndex )
end

CoD.CACUtility.GetNameForItemRefString = function ( itemRefString )
	local itemIndex = Engine.GetItemIndexFromReference( itemRefString )
	return Engine.GetItemName( itemIndex )
end

CoD.CACUtility.IsSlotNameInList = function ( list, loadoutSlot )
	for slotIndex, slotName in ipairs( list ) do
		if slotName == loadoutSlot then
			return true
		end
	end
	return false
end

CoD.CACUtility.GetSlotListWithSlot = function ( loadoutSlot )
	for listIndex, nameList in ipairs( CoD.CACUtility.SlotLists ) do
		if CoD.CACUtility.IsSlotNameInList( nameList, loadoutSlot ) then
			return nameList
		end
	end
	return {}
end

CoD.CACUtility.GetWeaponSlotForAttachmentSlot = function ( loadoutSlot )
	if CoD.CACUtility.IsSlotNameInList( CoD.CACUtility.SecondaryAttachmentSlotNameList, loadoutSlot ) then
		return CoD.CACUtility.loadoutSlotNames.secondaryWeapon
	else
		return CoD.CACUtility.loadoutSlotNames.primaryWeapon
	end
end

CoD.CACUtility.GetAttachmentListForSlot = function ( loadoutSlot )
	if LUI.startswith( loadoutSlot, "primarygadget" ) then
		return CoD.CACUtility.PrimaryGadgetAttachmentSlotNameList
	elseif LUI.startswith( loadoutSlot, "secondarygadget" ) then
		return CoD.CACUtility.SecondaryGadgetAttachmentSlotNameList
	elseif LUI.startswith( loadoutSlot, "primary" ) then
		return CoD.CACUtility.PrimaryAttachmentSlotNameList
	elseif LUI.startswith( loadoutSlot, "secondary" ) then
		return CoD.CACUtility.SecondaryAttachmentSlotNameList
	else
		return {}
	end
end

CoD.CACUtility.GetCACWeaponACVList = function ( baseWeaponLoadout )
	if baseWeaponLoadout == "primary" then
		return CoD.CACUtility.PrimaryAttachmentCVSlotNameList
	elseif baseWeaponLoadout == "secondary" then
		return CoD.CACUtility.SecondaryAttachmentCVSlotNameList
	else
		return {}
	end
end

CoD.CACUtility.IsMajorOrGeneralSlot = function ( loadoutSlot )
	local f43_local0 = LUI.startswith( loadoutSlot, "major" )
	if not f43_local0 then
		f43_local0 = LUI.startswith( loadoutSlot, "general" )
	end
	return f43_local0
end

CoD.CACUtility.GetAllocationSpentFromClassData = function ( classData )
	return CoD.CACUtility.SumClassItemCosts( classData.primaryWeapon ) + CoD.CACUtility.SumClassItemCosts( classData.primaryAttachments ) + CoD.CACUtility.SumClassItemCosts( classData.secondaryWeapon ) + CoD.CACUtility.SumClassItemCosts( classData.secondaryAttachments ) + CoD.CACUtility.SumClassItemCosts( classData.grenades ) + CoD.CACUtility.SumClassItemCosts( classData.gadgets ) + CoD.CACUtility.SumClassItemCosts( classData.perks ) + CoD.CACUtility.SumClassItemCosts( classData.rewards )
end

CoD.CACUtility.HowManyInClassData = function ( itemIndex, classData )
	return CoD.CACUtility.HowManyInClassSlot( itemIndex, classData.primaryWeapon ) + CoD.CACUtility.HowManyInClassSlot( itemIndex, classData.secondaryWeapon ) + CoD.CACUtility.HowManyInClassSlot( itemIndex, classData.grenades ) + CoD.CACUtility.HowManyInClassSlot( itemIndex, classData.gadgets ) + CoD.CACUtility.HowManyInClassSlot( itemIndex, classData.perks ) + CoD.CACUtility.HowManyInClassSlot( itemIndex, classData.rewards )
end

CoD.CACUtility.GetClassData = function ( controller, classNum )
	local classData = {}
	if classNum == nil then
		classNum = CoD.perController[controller].classNumInternal
	end
	local loadoutSlotNames = CoD.CACUtility.loadoutSlotNames
	classData.primaryWeapon = {}
	CoD.CACUtility.AddClassItemData( classData.primaryWeapon, CoD.CACUtility.GetClassItem( controller, classNum, loadoutSlotNames.primaryWeapon ) )
	classData.secondaryWeapon = {}
	CoD.CACUtility.AddClassItemData( classData.secondaryWeapon, CoD.CACUtility.GetClassItem( controller, classNum, loadoutSlotNames.secondaryWeapon ) )
	classData.primaryAttachments = {}
	classData.secondaryAttachments = {}
	local primaryWeaponIndex = CoD.CACUtility.GetClassItem( controller, classNum, loadoutSlotNames.primaryWeapon )
	local secondaryWeaponIndex = CoD.CACUtility.GetClassItem( controller, classNum, loadoutSlotNames.secondaryWeapon )
	for index = 0, 2, 1 do
		CoD.CACUtility.AddClassAttachmentData( classData.primaryAttachments, primaryWeaponIndex, CoD.CACUtility.GetClassItem( controller, classNum, loadoutSlotNames.primaryWeapon .. "attachment" .. index + 1 ) )
		CoD.CACUtility.AddClassAttachmentData( classData.secondaryAttachments, secondaryWeaponIndex, CoD.CACUtility.GetClassItem( controller, classNum, loadoutSlotNames.secondaryWeapon .. "attachment" .. index + 1 ) )
	end
	classData.grenades = {}
	CoD.CACUtility.AddClassItemData( classData.grenades, CoD.CACUtility.GetClassItem( controller, classNum, loadoutSlotNames.primaryGrenade ), CoD.CACUtility.GetClassItem( controller, classNum, "primarygrenadecount" ), loadoutSlotNames.primaryGrenade )
	CoD.CACUtility.AddClassItemData( classData.grenades, CoD.CACUtility.GetClassItem( controller, classNum, loadoutSlotNames.specialGrenade ), CoD.CACUtility.GetClassItem( controller, classNum, "specialgrenadecount" ), loadoutSlotNames.specialGrenade )
	classData.gadgets = {}
	CoD.CACUtility.AddClassItemData( classData.gadgets, CoD.CACUtility.GetClassItem( controller, classNum, loadoutSlotNames.primaryGadget ) )
	CoD.CACUtility.AddClassItemData( classData.gadgets, CoD.CACUtility.GetClassItem( controller, classNum, loadoutSlotNames.secondaryGadget ) )
	local numPerks = CoD.CACUtility.maxSpecialtySlots
	classData.perks = {}
	for i = 1, numPerks, 1 do
		CoD.CACUtility.AddClassItemData( classData.perks, CoD.CACUtility.GetClassItem( controller, classNum, loadoutSlotNames["specialty" .. i] ) )
	end
	local numRewards = CoD.CACUtility.maxRewards
	classData.rewards = {}
	for i = 1, numRewards, 1 do
		CoD.CACUtility.AddClassItemData( classData.rewards, CoD.CACUtility.GetClassItem( controller, classNum, "killstreak" .. i ) )
	end
	table.sort( classData.rewards, function ( a, b )
		return a.momentumCost < b.momentumCost
	end )
	return classData
end

CoD.CACUtility.GetLoadoutsMPOffline = function ( controller )
	local f48_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_LOADOUTS_OFFLINE )
	return f48_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsMPOnlinePublic = function ( controller )
	local f49_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	return f49_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsMPOnlineCustom = function ( controller )
	local f50_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_LOADOUTS_CUSTOM )
	return f50_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsMPOnlineLeague = function ( controller )
	local f51_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_LOADOUTS_ARENA )
	return f51_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsCPOffline = function ( controller )
	local f52_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_CP_LOADOUTS_OFFLINE )
	return f52_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsCPOnline = function ( controller )
	local f53_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_CP_LOADOUTS )
	return f53_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsZMOffline = function ( controller )
	local f54_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_ZM_LOADOUTS_OFFLINE )
	return f54_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsZMOnline = function ( controller )
	local f55_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_ZM_LOADOUTS )
	return f55_local0.cacLoadouts
end

CoD.CACUtility.SetDefaultCACRoot = function ( controller )
	local loadoutFunc = nil
	if CoD.isOnlineGame() ~= true then
		loadoutFunc = CoD.CPMPZM( CoD.CACUtility.GetLoadoutsCPOffline, CoD.CACUtility.GetLoadoutsMPOffline, CoD.CACUtility.GetLoadoutsZMOffline )
	elseif Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_LEAGUE ) then
		loadoutFunc = CoD.CPMPZM( nil, CoD.CACUtility.GetLoadoutsMPOnlineLeague, nil )
	elseif Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_MATCHMAKING_MANUAL ) then
		loadoutFunc = CoD.CPMPZM( CoD.CACUtility.GetLoadoutsCPOnline, CoD.CACUtility.GetLoadoutsMPOnlineCustom, CoD.CACUtility.GetLoadoutsZMOnline )
	else
		loadoutFunc = CoD.CPMPZM( CoD.CACUtility.GetLoadoutsCPOnline, CoD.CACUtility.GetLoadoutsMPOnlinePublic, CoD.CACUtility.GetLoadoutsZMOnline )
	end
	if loadoutFunc ~= nil then
		CoD.perController[controller].cacRoot = loadoutFunc( controller )
	else
		error( "LUI Error: could not set up loadout root - no valid game mode set" )
	end
end

CoD.CACUtility.SetGametypeSettingsCACRoot = function ( controller, team )
	local index = nil
	if team == Enum.team_t.TEAM_FREE then
		index = 0
	else
		index = team - Enum.team_t.TEAM_FIRST_PLAYING_TEAM + 1
	end
	local f57_local0 = CoD.perController[controller]
	local f57_local1 = Engine.GetGametypeSettings()
	f57_local0.cacRoot = f57_local1.cacLoadouts[index]
end

CoD.CACUtility.GetCACRoot = function ( controller )
	return CoD.perController[controller].cacRoot
end

CoD.CACUtility.GetLoadoutNames = function ( controller )
	local cacRoot = CoD.CACUtility.GetCACRoot( controller )
	if cacRoot then
		return cacRoot.customClassName
	else
		return nil
	end
end

CoD.CACUtility.GetLoadoutNameFromIndex = function ( controller, customClassNum )
	local loadoutNames = CoD.CACUtility.GetLoadoutNames( controller )
	if loadoutNames then
		return loadoutNames[customClassNum]
	else
		return nil
	end
end

CoD.CACUtility.GetDefaultLoadoutNameFromIndex = function ( defaultClassNum )
	if defaultClassNum < 1 or defaultClassNum > CoD.CACUtility.maxDefaultClass then
		error( "LUI Error: Default loadout out with index " .. defaultClassNum .. " doesn't exist." )
	end
	return CoD.CACUtility.defaultClassNames[defaultClassNum]
end

CoD.CACUtility.GetDefaultArenaLoadoutNameFromIndex = function ( defaultClassNum )
	if defaultClassNum < 1 or defaultClassNum > CoD.CACUtility.maxDefaultClass then
		error( "LUI Error: Default loadout out with index " .. defaultClassNum .. " doesn't exist." )
	end
	return CoD.CACUtility.defaultArenaClassNames[defaultClassNum]
end

CoD.CACUtility.IsBonusCardEquippedByName = function ( class, bonusCardName )
	local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local bonusCardItemIndex = Engine.GetItemIndexFromReference( bonusCardName, mode )
	for index = 1, CoD.CACUtility.maxBonusCards, 1 do
		local slotName = "bonuscard" .. index
		if bonusCardItemIndex ~= nil and class[slotName] == bonusCardItemIndex then
			return true
		end
	end
	return false
end

CoD.CACUtility.IsBonusCardEquippedByIndex = function ( class, bonusCardItemIndex )
	for index = 1, CoD.CACUtility.maxBonusCards, 1 do
		local slotName = "bonuscard" .. index
		if bonusCardItemIndex ~= nil and class[slotName] == bonusCardItemIndex then
			return true
		end
	end
	return false
end

CoD.CACUtility.GetBonusCardLoadoutSlot = function ( class, bonusCardItemIndex )
	for index = 1, CoD.CACUtility.maxBonusCards, 1 do
		local slotName = "bonuscard" .. index
		if bonusCardItemIndex ~= nil and class[slotName] == bonusCardItemIndex then
			return slotName
		end
	end
end

CoD.CACUtility.GetLoadoutSlotForAttachmentName = function ( classModel, loadoutSlotName, attachmentRef )
	local attachmentSlotList = CoD.CACUtility.PrimaryAttachmentSlotNameList
	if LUI.startswith( loadoutSlotName, "secondary" ) then
		attachmentSlotList = CoD.CACUtility.SecondaryAttachmentSlotNameList
	end
	for index, slot in ipairs( attachmentSlotList ) do
		local slotModel = Engine.GetModel( classModel, slot )
		if slotModel then
			local refModel = Engine.GetModel( slotModel, "ref" )
			if refModel and Engine.GetModelValue( refModel ) == attachmentRef then
				return slot
			end
		end
	end
	return nil
end

CoD.CACUtility.GetAttachmentVariantForAttachmentList = function ( classModel, loadoutSlotName )
	local attachmentSlotList = CoD.CACUtility.PrimaryAttachmentSlotNameList
	if LUI.startswith( loadoutSlotName, "secondary" ) then
		attachmentSlotList = CoD.CACUtility.SecondaryAttachmentSlotNameList
	end
	local attachmentVariantList = {}
	for _, slot in ipairs( attachmentSlotList ) do
		local slotModel = Engine.GetModel( classModel, slot )
		if slotModel then
			local refModel = Engine.GetModel( slotModel, "ref" )
			if refModel then
				local refValue = Engine.GetModelValue( refModel )
				if refValue ~= "" then
					local acvIndexModel = Engine.GetModel( classModel, slot .. "cosmeticvariant.itemIndex" )
					if acvIndexModel then
						local acvIndex = Engine.GetModelValue( acvIndexModel )
						table.insert( attachmentVariantList, {
							ref = refValue,
							attachmentIndex = acvIndex
						} )
					end
				end
			end
		end
	end
	return attachmentVariantList
end

CoD.CACUtility.IsAttachmentRefWeaponOption = function ( attachmentRef )
	for index = 0, #CoD.CACUtility.weaponOptionGroupNames - 1, 1 do
		local value = CoD.CACUtility.weaponOptionGroupNames[index]
		if value == attachmentRef then
			return true
		end
	end
	return false
end

CoD.CACUtility.GetWeaponOptionTypeForName = function ( weaponOptionName )
	for index = 0, #CoD.CACUtility.weaponOptionGroupNames - 1, 1 do
		local value = CoD.CACUtility.weaponOptionGroupNames[index]
		if value == weaponOptionName then
			return index
		end
	end
	return nil
end

CoD.CACUtility.UpdateWeaponPrestigeAttachment = function ( controller, prestigeAttachment, itemIndex )
	local classModel = CoD.perController[controller].classModel
	local baseWeaponSlotName = CoD.perController[controller].weaponCategory
	local slotName = baseWeaponSlotName .. prestigeAttachment
	local attachmentList = nil
	if baseWeaponSlotName == "primary" then
		attachmentList = CoD.CACUtility.PrimaryAttachmentSlotNameList
	elseif baseWeaponSlotName == "secondary" then
		attachmentList = CoD.CACUtility.SecondaryAttachmentSlotNameList
	else
		return 
	end
	local weaponIndexModel = Engine.GetModel( classModel, baseWeaponSlotName .. ".itemIndex" )
	if weaponIndexModel then
		local weaponIndex = Engine.GetModelValue( weaponIndexModel )
		local weaponName = Engine.GetItemRef( weaponIndex ) .. "_" .. CoD.gameMode:lower()
		local focusAttachmentRef = Engine.GetAttachmentRef( weaponIndex, itemIndex )
		local cacAttachmentList = {}
		local focusAttachmentFound = false
		for index, attachmentSlot in ipairs( attachmentList ) do
			local cacAttachmentIndex = Engine.GetModelValue( Engine.GetModel( classModel, attachmentSlot .. ".itemIndex" ) )
			if CoD.CACUtility.EmptyItemIndex < cacAttachmentIndex then
				if attachmentSlot ~= slotName then
					local tempCACAttachmentRef = Engine.GetAttachmentRef( weaponIndex, cacAttachmentIndex )
					local tempAttachmentData = {
						index = cacAttachmentIndex,
						ref = tempCACAttachmentRef
					}
					table.insert( cacAttachmentList, tempAttachmentData )
				else
					focusAttachmentFound = true
				end
			end
		end
		for _, attachmentSlot in ipairs( cacAttachmentList ) do
			local attachmentRef = attachmentSlot.ref
			local attachmentIndex = attachmentSlot.index
			local isFocusAttachmentOptic = Engine.IsOptic( weaponIndex, itemIndex )
			local isAttachmentOptic = Engine.IsOptic( weaponIndex, attachmentIndex )
			if (not isFocusAttachmentOptic or not isAttachmentOptic) and Engine.AreAttachmentsCompatible( weaponIndex, itemIndex, attachmentIndex ) then
				weaponName = weaponName .. "+" .. attachmentRef
			end
		end
		weaponName = weaponName .. "+" .. focusAttachmentRef
		if weaponName and weaponName ~= "" then
			local attachmentInfo = CoD.CACUtility.GetACVariantsFromClassExcludeAttachment( controller, classModel, slotName, focusAttachmentRef )
			local focusACVInfo = focusAttachmentRef .. "," .. 0
			attachmentInfo = attachmentInfo .. focusACVInfo
			local weaponOptions = CoD.CACUtility.GetWeaponOptionsFromClass( controller, classModel, baseWeaponSlotName )
			Engine.SendClientScriptNotify( controller, "CustomClass_focus" .. CoD.GetLocalClientAdjustedNum( controller ), {
				base_weapon_slot = baseWeaponSlotName,
				weapon = weaponName,
				attachment = focusAttachmentRef,
				options = weaponOptions,
				acv = attachmentInfo,
				do_no_move_camera = true
			} )
		end
	end
end

CoD.CACUtility.GetAttachedItemSlot = function ( classModel, itemIndex, possibleLoadoutSlotNameList )
	for index, slot in ipairs( possibleLoadoutSlotNameList ) do
		local slotModel = Engine.GetModel( classModel, slot )
		if slotModel then
			local itemIndexModel = Engine.GetModel( slotModel, "itemIndex" )
			if itemIndexModel and Engine.GetModelValue( itemIndexModel ) == itemIndex then
				return slot
			end
		end
	end
	return nil
end

CoD.CACUtility.FindFirstEmptySlotInList = function ( classModel, slotNameList )
	for index, slotName in ipairs( slotNameList ) do
		local slotModel = Engine.GetModel( classModel, slotName )
		if slotModel then
			local itemIndexModel = Engine.GetModel( slotModel, "itemIndex" )
			if itemIndexModel and Engine.GetModelValue( itemIndexModel ) <= CoD.CACUtility.EmptyItemIndex then
				return slotName
			end
		end
	end
	return nil
end

CoD.CACUtility.IsBonusCardEquipped = function ( bonuscardName, classModel )
	if not classModel then
		return false
	elseif classModel then
		for _, slotName in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
			local cardModel = Engine.GetModel( classModel, slotName )
			if cardModel then
				local itemIndexModel = Engine.GetModel( cardModel, "itemIndex" )
				if itemIndexModel then
					local itemIndex = Engine.GetModelValue( itemIndexModel )
					if Engine.GetItemRef( itemIndex ) == bonuscardName then
						return true
					end
				end
			end
		end
	end
	return false
end

CoD.CACUtility.SpecificWildcardEquippedCount = function ( classModel, bonuscardName )
	local equippedCount = 0
	if classModel then
		local bonusCardItemIndex = Engine.GetItemIndexFromReference( bonuscardName )
		for _, slotName in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
			local bonusCardIndexModel = Engine.GetModel( classModel, slotName .. ".itemIndex" )
			if bonusCardIndexModel then
				local bonusCardIndex = Engine.GetModelValue( bonusCardIndexModel )
				if bonusCardIndex > CoD.CACUtility.EmptyItemIndex and LUI.startswith( Engine.GetItemRef( bonusCardIndex ), bonuscardName ) then
					equippedCount = equippedCount + 1
				end
			end
		end
	end
	return math.min( math.max( equippedCount, 0 ), CoD.CACUtility.maxBonusCards )
end

CoD.CACUtility.PrimaryGunfighterEquippedCount = function ( classModel )
	local equippedCount = 0
	for _, primaryGunfighterName in ipairs( CoD.CACUtility.PrimaryGunfighterWildcards ) do
		if CoD.CACUtility.IsBonusCardEquipped( primaryGunfighterName, classModel ) then
			equippedCount = equippedCount + 1
		end
	end
	return math.min( math.max( equippedCount, 0 ), CoD.CACUtility.maxPrimaryGunfighters )
end

CoD.CACUtility.SearchForBonusCard = function ( bonuscardName, controller, classModel )
	if not controller then
		return ""
	end
	local f76_local0 = classModel
	local currentClass = CoD.perController[controller].classModel
	local f76_local1 = f76_local0 or currentClass
	if f76_local1 then
		for index, slotName in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
			local cardModel = Engine.GetModel( f76_local1, slotName )
			if cardModel then
				local itemIndexModel = Engine.GetModel( cardModel, "itemIndex" )
				if itemIndexModel then
					local itemIndex = Engine.GetModelValue( itemIndexModel )
					if Engine.GetItemRef( itemIndex ) == bonuscardName then
						return slotName
					end
				end
			end
		end
	end
	return ""
end

CoD.CACUtility.GetItemIndexEquippedInSlot = function ( slotName, controller, classModel )
	if not controller then
		return 
	else
		local f77_local0 = classModel
		local currentClass = CoD.perController[controller].classModel
		local f77_local1 = f77_local0 or currentClass
		if f77_local1 then
			return CoD.SafeGetModelValue( f77_local1, slotName .. ".itemIndex" )
		else
			
		end
	end
end

CoD.CACUtility.GetItemRefEquippedInSlot = function ( slotName, controller, classModel )
	if not controller then
		return 
	else
		local f78_local0 = classModel
		local currentClass = CoD.perController[controller].classModel
		local f78_local1 = f78_local0 or currentClass
		if f78_local1 then
			return CoD.SafeGetModelValue( f78_local1, slotName .. ".ref" )
		else
			
		end
	end
end

CoD.CACUtility.IsItemEquippedInAnySlot = function ( classModel, slotTable )
	for _, slotName in ipairs( slotTable ) do
		if CoD.CACUtility.ItemEquippedInSlot( slotName, nil, classModel ) then
			return true
		end
	end
	return false
end

CoD.CACUtility.IsItemAlreadyEquippedInAnySlot = function ( classModel, itemIndex, slotTable )
	for _, slotName in ipairs( slotTable ) do
		if CoD.CACUtility.GetItemEquippedInSlot( slotName, nil, classModel ) == itemIndex then
			return slotName
		end
	end
	return false
end

CoD.CACUtility.GetItemEquippedInSlot = function ( slotName, controller, classModel )
	local currentClass = classModel
	if not currentClass and controller then
		currentClass = CoD.perController[controller].classModel
	end
	if currentClass then
		local slotModel = Engine.GetModel( currentClass, slotName )
		if slotModel then
			local itemIndexModel = Engine.GetModel( slotModel, "itemIndex" )
			if itemIndexModel then
				return Engine.GetModelValue( itemIndexModel )
			end
		end
	end
	return CoD.CACUtility.EmptyItemIndex
end

CoD.CACUtility.ItemEquippedInSlot = function ( slotName, controller, classModel )
	return CoD.CACUtility.EmptyItemIndex < CoD.CACUtility.GetItemEquippedInSlot( slotName, controller, classModel )
end

CoD.CACUtility.DoesWeaponHaveDWInSlot = function ( weaponSlot, controller, classModel )
	if weaponSlot ~= "primary" and weaponSlot ~= "secondary" then
		return false
	end
	local weaponSlotModel = Engine.GetModel( classModel, weaponSlot )
	if weaponSlotModel then
		local weaponItemIndex = Engine.GetModelValue( Engine.GetModel( weaponSlotModel, "itemIndex" ) )
		if weaponItemIndex > CoD.CACUtility.EmptyItemIndex then
			local attachmentList = CoD.CACUtility.GetAttachmentListForSlot( weaponSlot )
			for _, loadoutSlot in ipairs( attachmentList ) do
				local attachmentIndex = Engine.GetModelValue( Engine.GetModel( classModel, loadoutSlot .. ".itemIndex" ) )
				if attachmentIndex > CoD.CACUtility.EmptyItemIndex then
					local attachmentRef = Engine.GetAttachmentRef( weaponItemIndex, attachmentIndex )
					if attachmentRef and attachmentRef == "dw" then
						return true
					end
				end
			end
		end
	end
	return false
end

CoD.CACUtility.DoesWeaponHaveAnyAttachments = function ( slotName, controller, classModel )
	local slotModel = Engine.GetModel( classModel, slotName )
	if slotModel then
		local itemIndex = Engine.GetModelValue( Engine.GetModel( slotModel, "itemIndex" ) )
		if itemIndex > CoD.CACUtility.EmptyItemIndex then
			local numAttachments = Engine.GetNumAttachments( itemIndex )
			if numAttachments > 1 then
				return true
			end
		end
	end
	return false
end

CoD.CACUtility.GetItemName = function ( slotName, controller, classModel )
	local currentClass = classModel
	if not currentClass and controller then
		currentClass = CoD.perController[controller].classModel
	end
	if currentClass then
		local slotModel = Engine.GetModel( currentClass, slotName )
		if slotModel then
			local itemNameModel = Engine.GetModel( slotModel, "name" )
			if itemNameModel then
				return Engine.GetModelValue( itemNameModel )
			end
		end
	end
	return ""
end

CoD.CACUtility.GetItemReferenceName = function ( slotModel, slotName )
	local itemIndexModel = Engine.GetModel( slotModel, "itemIndex" )
	if itemIndexModel then
		local itemIndex = Engine.GetModelValue( itemIndexModel )
		return Engine.GetItemRef( itemIndex )
	else
		return ""
	end
end

CoD.CACUtility.AllowTwoPrimaryTacticals = function ( controller )
	local f87_local0
	if CoD.CACUtility.SearchForBonusCard( "bonuscard_danger_close", controller ) == "" and CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", controller ) == "" then
		f87_local0 = false
	else
		f87_local0 = true
	end
	return f87_local0
end

CoD.CACUtility.GetMutuallyExclusiveSlotName = function ( slotName, controller, itemIndex, classModel )
	local itemRef = Engine.GetItemRef( itemIndex )
	local mutuallyExclusiveSlotTable = {}
	if not classModel then
		classModel = CoD.perController[controller].classModel
	end
	local CheckMutuallyExclusiveBaseItem = function ( controller, slotName, itemIndex )
		if LUI.endswith( itemRef, "_pro" ) then
			local baseRef = string.sub( itemRef, 1, -string.len( "_pro" ) - 1 )
			local baseItemIndex = Engine.GetItemIndexFromReference( baseRef )
			if CoD.CACUtility.GetItemEquippedInSlot( slotName, controller, classModel ) == baseItemIndex then
				return slotName
			end
		end
		return ""
	end
	
	if LUI.startswith( slotName, "bonuscard" ) then
		if itemRef == "bonuscard_danger_close" then
			table.insert( mutuallyExclusiveSlotTable, CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", controller ) )
		elseif itemRef == "bonuscard_two_tacticals" then
			table.insert( mutuallyExclusiveSlotTable, CoD.CACUtility.SearchForBonusCard( "bonuscard_danger_close", controller ) )
		end
	elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", controller ) and slotName == "primarygadget" then
		if CoD.CACUtility.GetItemEquippedInSlot( "secondarygadget", controller, classModel ) == itemIndex then
			table.insert( mutuallyExclusiveSlotTable, "secondarygadget" )
		end
	elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", controller ) and slotName == "secondarygadget" then
		if CoD.CACUtility.GetItemEquippedInSlot( "primarygadget", controller, classModel ) == itemIndex then
			table.insert( mutuallyExclusiveSlotTable, "primarygadget" )
		end
	elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_overkill", controller ) and slotName == "primary" then
		if CoD.CACUtility.GetItemEquippedInSlot( "secondary", controller, classModel ) == itemIndex then
			table.insert( mutuallyExclusiveSlotTable, "secondary" )
		end
	elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_overkill", controller ) and slotName == "secondary" then
		if CoD.CACUtility.GetItemEquippedInSlot( "primary", controller, classModel ) == itemIndex then
			table.insert( mutuallyExclusiveSlotTable, "primary" )
		end
	elseif CoD.CACUtility.IsSlotNameInList( CoD.CACUtility.PrimaryAttachmentSlotNameList, slotName ) or CoD.CACUtility.IsSlotNameInList( CoD.CACUtility.SecondaryAttachmentSlotNameList, slotName ) then
		local attachmentList = CoD.CACUtility.GetAttachmentListForSlot( slotName )
		local weaponSlotName = "primary"
		if LUI.startswith( slotName, "secondary" ) then
			weaponSlotName = "secondary"
		end
		local weaponIndex = CoD.CACUtility.GetItemEquippedInSlot( weaponSlotName, controller, classModel )
		for _, loadoutSlot in ipairs( attachmentList ) do
			local slotIndex = CoD.CACUtility.GetItemEquippedInSlot( loadoutSlot, controller, classModel )
			if slotIndex ~= itemIndex and not Engine.AreAttachmentsCompatible( weaponIndex, slotIndex, itemIndex ) and (not Engine.IsOptic( weaponIndex, slotIndex ) or not Engine.IsOptic( weaponIndex, itemIndex )) then
				table.insert( mutuallyExclusiveSlotTable, loadoutSlot )
			end
		end
	elseif slotName == "cybercom_tacrig1" then
		if CoD.CACUtility.GetItemEquippedInSlot( "cybercom_tacrig2", controller, classModel ) == itemIndex then
			table.insert( mutuallyExclusiveSlotTable, "cybercom_tacrig2" )
		end
		local mutuallyExclusiveSlot = CheckMutuallyExclusiveBaseItem( controller, "cybercom_tacrig2", itemIndex )
		if mutuallyExclusiveSlot ~= "" then
			table.insert( mutuallyExclusiveSlotTable, mutuallyExclusiveSlot )
		end
	elseif slotName == "cybercom_tacrig2" then
		if CoD.CACUtility.GetItemEquippedInSlot( "cybercom_tacrig1", controller, classModel ) == itemIndex then
			table.insert( mutuallyExclusiveSlotTable, "cybercom_tacrig1" )
		end
		local mutuallyExclusiveSlot = CheckMutuallyExclusiveBaseItem( controller, "cybercom_tacrig1", itemIndex )
		if mutuallyExclusiveSlot ~= "" then
			table.insert( mutuallyExclusiveSlotTable, mutuallyExclusiveSlot )
		end
	end
	return mutuallyExclusiveSlotTable
end

CoD.CACUtility.AttachmentHasCustomReticle = function ( attachmentRef )
	return CoD.CACUtility.attachmentsWithCustReticle[attachmentRef] ~= nil
end

CoD.CACUtility.GetWeaponOptionMTXName = function ( weaponOption )
	return Engine.TableLookup( CoD.attachmentTable, 16, 0, weaponOption )
end

CoD.CACUtility.GetWeaponOptionId = function ( weaponOption )
	return Engine.TableLookup( CoD.attachmentTable, 4, 0, weaponOption )
end

CoD.CACUtility.GetBackingMTXName = function ( backingID )
	return Engine.TableLookup( "gamedata/emblems/emblemsOrBackings.csv", 10, 0, "background", 1, backingID )
end

CoD.CACUtility.IsWeaponOptionMTX = function ( weaponOption )
	local mtxValue = CoD.CACUtility.GetWeaponOptionMTXName( weaponOption )
	return mtxValue and mtxValue ~= ""
end

CoD.CACUtility.IsBackingMTX = function ( backingID )
	local mtxValue = CoD.CACUtility.GetBackingMTXName( backingID )
	return mtxValue and mtxValue ~= ""
end

CoD.CACUtility.IsAnyWeaponMTXAvailable = function ()
	for mtxIndex = 0, CoD.CACUtility.maxMTXWeaponPacks, 1 do
		if Engine.IsMTXAvailable( "mtx_weapon" .. mtxIndex ) then
			return true
		end
	end
	return false
end

CoD.CACUtility.HasAnyWeaponMTX = function ( controller )
	for mtxIndex = 0, CoD.CACUtility.maxMTXWeaponPacks, 1 do
		if Engine.HasMTX( controller, "mtx_weapon" .. mtxIndex ) then
			return true
		end
	end
	return false
end

CoD.CACUtility.ShouldDisplayWeaponOptionMTX = function ( controller, weaponOption )
	local mtxName = CoD.CACUtility.GetWeaponOptionMTXName( weaponOption )
	local skipMTXItem = Engine.SkipMTXItem( mtxName )
	if skipMTXItem == true then
		return false
	else
		return true
	end
end

CoD.CACUtility.GetMTXPurchaseMsg = function ( mtxName )
	local mtxCategory = Engine.TableLookup( "mp/mtxitems.csv", 3, 1, mtxName )
	return "MPUI_" .. mtxCategory .. "_MSG"
end

CoD.CACUtility.SelectedClassIndex = {}
CoD.CACUtility.IsOnlineGame = function ()
	if Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_DEFAULT ) == false and not Engine.SessionMode_IsSystemlinkGame() then
		return true
	else
		return false
	end
end

CoD.CACUtility.SetProfileLoadoutChoice = function ( controller, selectedClassIndex )
	local loadout = "lastLoadoutSystemlink"
	if CoD.CACUtility.IsOnlineGame() == true then
		if Engine.GameModeIsMode( Enum.eGameModes.MODE_GAME_LEAGUE ) then
			loadout = "lastLoadoutLeague"
		else
			loadout = "lastLoadoutOnline"
		end
	end
	Engine.SetProfileVar( controller, loadout, selectedClassIndex )
	Engine.CommitProfileChanges( controller )
	CoD.CACUtility.SelectedClassIndex[controller] = selectedClassIndex
end

CoD.CACUtility.GetEquipmentLabel = function ( weaponSlot, class )
	local usingGadgets = false
	local text = "BAD EQUIPMENT LABEL"
	if usingGadgets then
		if weaponSlot == CoD.CACUtility.loadoutSlotNames.primaryGadget then
			text = Engine.Localize( "MPUI_PRIMARY_GADGET_CAPS" )
		elseif weaponSlot == CoD.CACUtility.loadoutSlotNames.secondaryGadget then
			text = Engine.Localize( "MPUI_SECONDARY_GADGET_CAPS" )
		end
	elseif weaponSlot == CoD.CACUtility.loadoutSlotNames.primaryGadget then
		if class ~= nil and CoD.CACUtility.IsBonusCardEquippedByName( class, "bonuscard_two_tacticals" ) then
			text = Engine.Localize( "MPUI_SECOND_SPECIAL_GRENADE_CAPS" )
		else
			text = Engine.Localize( "MPUI_PRIMARY_GRENADE_CAPS" )
		end
	elseif weaponSlot == CoD.CACUtility.loadoutSlotNames.secondaryGadget then
		text = Engine.Localize( "MPUI_SPECIAL_GRENADE_CAPS" )
	end
	return text
end

CoD.CACUtility.UpdateHeaderNames = function ( controller, classNum, classModel, xuid )
	for key, value in pairs( CoD.CACUtility.loadoutSlotNames ) do
		local currItemModel = classModel[value]
		if currItemModel and currItemModel.itemIndex then
			local itemIndex = classModel[value].itemIndex:get()
			local loadoutSlot = Engine.GetLoadoutSlotForItem( itemIndex )
			if loadoutSlot and loadoutSlot ~= "" then
				local headerName = "MPUI_LOADOUTSLOT_" .. loadoutSlot
				if headerName ~= "" then
					local f103_local3 = currItemModel:create( "headerName" )
					f103_local3:set( headerName )
				end
			end
		end
	end
end

CoD.CACUtility.GetBonucardUnlockHint = function ( stringRef, bonuscardRef, mode )
	local itemIndex = Engine.GetItemIndexFromReference( bonuscardRef, mode )
	local unlockRank = Engine.GetItemUnlockLevel( itemIndex, mode )
	local wildcardName = Engine.GetItemName( itemIndex, mode )
	return Engine.Localize( stringRef, wildcardName, unlockRank + 1 )
end

CoD.CACUtility.IsCPHeroWeapon = function ( itemIndex )
	local itemRef = Engine.GetItemRef( itemIndex )
	local f105_local0 = IsCampaign()
	if f105_local0 then
		if itemRef ~= "hero_annihilator" and itemRef ~= "hero_pineapplegun" then
			f105_local0 = false
		else
			f105_local0 = true
		end
	end
	return f105_local0
end

CoD.CACUtility.GetCACSlotStatus = function ( controller, classModel, slotName )
	local availability = CoD.CACUtility.CACStatusAvailable.AVAILABLE
	local equipped = false
	local statusString = ""
	local statusArg = nil
	local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
	if CoD.CACUtility.ItemEquippedInSlot( slotName, controller, classModel ) then
		equipped = true
		if slotName == "primary" or slotName == "secondary" then
			local equippedItemIndex = CoD.CACUtility.GetItemEquippedInSlot( slotName, controller, classModel )
			if CoD.CACUtility.IsCPHeroWeapon( equippedItemIndex ) then
				statusString = "MPUI_EQUIP_WEAPON"
			else
				statusString = "MPUI_BUTTON_PERSONALIZE_CAPS"
			end
		elseif LUI.startswith( slotName, "primaryattachment" ) or LUI.startswith( slotName, "secondaryattachment" ) then
			if slotName == "primaryattachment1" or slotName == "secondaryattachment1" then
				local equippedItemRef = CoD.CACUtility.GetItemRefEquippedInSlot( slotName, controller, classModel )
				if CoD.CACUtility.attachmentsWithCustReticle[equippedItemRef] then
					statusString = "MPUI_BUTTON_PERSONALIZE_CAPS"
				end
			else
				local weaponSlot = CoD.CACUtility.GetWeaponSlotForAttachmentSlot( slotName )
				if weaponSlot then
					local weaponRef = CoD.CACUtility.GetItemRefEquippedInSlot( weaponSlot, controller, classModel )
					local weaponIndex = CoD.CACUtility.GetItemIndexEquippedInSlot( weaponSlot, controller, classModel )
					local attachmentIndex = CoD.CACUtility.GetItemIndexEquippedInSlot( slotName, controller, classModel )
					local attachmentTableIndex = Engine.GetItemAttachment( weaponIndex, attachmentIndex )
					local acvCount = Engine.GetAttachmentCosmeticVariantCountForAttachment( weaponRef, attachmentTableIndex )
					if acvCount and acvCount > 0 then
						statusString = "MPUI_BUTTON_PERSONALIZE_CAPS"
					end
				end
			end
		end
	elseif slotName == "primary" or slotName == "secondary" then
		statusString = "MPUI_EQUIP_WEAPON"
	elseif slotName == "primarygadget" then
		if CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", controller ) ~= "" then
			statusString = "MPUI_EQUIP_TACTICAL"
		else
			statusString = "MPUI_EQUIP_LETHAL"
		end
	elseif slotName == "secondarygadget" then
		statusString = "MPUI_EQUIP_TACTICAL"
	elseif LUI.startswith( slotName, "specialty" ) then
		statusString = "MPUI_EQUIP_PERK"
		if slotName == "specialty4" then
			if IsNonAttachmentItemLocked( controller, "bonuscard_perk_1_greed" ) then
				statusString = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_perk_1_greed", mode )
				availability = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_1_greed", controller, classModel ) == "" then
				statusString = "MPUI_REQUIRES_PERK_1_GREED"
				availability = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			end
		elseif slotName == "specialty5" then
			if IsNonAttachmentItemLocked( controller, "bonuscard_perk_2_greed" ) then
				statusString = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_perk_2_greed", mode )
				availability = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_2_greed", controller, classModel ) == "" then
				statusString = "MPUI_REQUIRES_PERK_2_GREED"
				availability = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			end
		elseif slotName == "specialty6" then
			if IsNonAttachmentItemLocked( controller, "bonuscard_perk_3_greed" ) then
				statusString = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_perk_3_greed", mode )
				availability = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_3_greed", controller, classModel ) == "" then
				statusString = "MPUI_REQUIRES_PERK_3_GREED"
				availability = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			end
		end
	elseif LUI.startswith( slotName, "primaryattachment" ) then
		local primaryWeaponIndex = CoD.CACUtility.GetItemEquippedInSlot( "primary", controller, classModel )
		local numAttachments = Engine.GetNumAttachments( primaryWeaponIndex, mode )
		if slotName == "primaryattachment1" then
			statusString = "MPUI_EQUIP_OPTIC"
		else
			statusString = "MPUI_EQUIP_ATTACHMENT"
		end
		if primaryWeaponIndex <= CoD.CACUtility.EmptyItemIndex then
			availability = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			if slotName == "primaryattachment1" then
				statusString = "MPUI_OPTICS_NOT_AVAILABLE"
			else
				statusString = "MPUI_ATTACHMENTS_NOT_AVAILABLE"
			end
		elseif slotName == "primaryattachment1" and Engine.GetNumOptics( primaryWeaponIndex, mode ) <= 1 then
			availability = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			statusString = "MPUI_OPTICS_NOT_AVAILABLE"
		elseif (slotName == "primaryattachment2" or slotName == "primaryattachment3") and numAttachments <= 1 then
			availability = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			statusString = "MPUI_ATTACHMENTS_NOT_AVAILABLE"
		elseif slotName == "primaryattachment4" or slotName == "primaryattachment5" or slotName == "primaryattachment6" then
			if numAttachments <= 1 then
				availability = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
				statusString = "MPUI_ATTACHMENTS_NOT_AVAILABLE"
			elseif IsCACPrimaryAttachmentSlotLockedByWildcard( controller ) then
				statusString = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_primary_gunfighter", mode )
				availability = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			else
				local primaryGunfighterCount = CoD.CACUtility.PrimaryGunfighterEquippedCount( classModel )
				if not (slotName ~= "primaryattachment4" or primaryGunfighterCount >= 1) or not (slotName ~= "primaryattachment5" or primaryGunfighterCount >= 2) or slotName == "primaryattachment6" and primaryGunfighterCount < 3 then
					statusString = "MPUI_REQUIRES_PRIMARY_GUNFIGHTER"
					availability = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
				end
			end
		end
	elseif LUI.startswith( slotName, "secondaryattachment" ) then
		local secondaryWeaponIndex = CoD.CACUtility.GetItemEquippedInSlot( "secondary", controller, classModel )
		local numAttachments = Engine.GetNumAttachments( secondaryWeaponIndex, mode )
		if slotName == "secondaryattachment1" then
			statusString = "MPUI_EQUIP_OPTIC"
		else
			statusString = "MPUI_EQUIP_ATTACHMENT"
		end
		if secondaryWeaponIndex <= CoD.CACUtility.EmptyItemIndex then
			availability = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			if slotName == "secondaryattachment1" then
				statusString = "MPUI_OPTICS_NOT_AVAILABLE"
			else
				statusString = "MPUI_ATTACHMENTS_NOT_AVAILABLE"
			end
		elseif slotName == "secondaryattachment1" and Engine.GetNumOptics( secondaryWeaponIndex, mode ) <= 1 then
			availability = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			statusString = "MPUI_OPTICS_NOT_AVAILABLE"
		elseif slotName == "secondaryattachment2" and numAttachments <= 1 then
			availability = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			statusString = "MPUI_ATTACHMENTS_NOT_AVAILABLE"
		elseif slotName == "secondaryattachment3" then
			if numAttachments <= 1 then
				availability = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
				statusString = "MPUI_ATTACHMENTS_NOT_AVAILABLE"
			elseif IsNonAttachmentItemLocked( controller, "bonuscard_secondary_gunfighter" ) then
				statusString = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_secondary_gunfighter", mode )
				availability = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_secondary_gunfighter", controller, classModel ) == "" then
				statusString = "MPUI_REQUIRES_SECONDARY_GUNFIGHTER"
				availability = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			end
		end
	elseif LUI.startswith( slotName, "primarygadgetattachment" ) then
		local primaryGadgetIndex = CoD.CACUtility.GetItemEquippedInSlot( "primarygadget", controller, classModel )
		local primaryGadgetName = CoD.CACUtility.GetItemName( "primarygadget", controller, classModel )
		statusArg = primaryGadgetName
		statusString = "MPUI_EQUIP_TAKE_TWO"
		if not primaryGadgetIndex or primaryGadgetIndex <= CoD.CACUtility.EmptyItemIndex then
			statusString = "MPUI_TAKE_TWO_NOT_AVAILABLE"
			availability = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
		elseif IsNonAttachmentItemLocked( controller, "bonuscard_danger_close" ) then
			statusString = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_danger_close", mode )
			availability = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
		elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_danger_close", controller ) == "" and CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", controller ) == "" then
			availability = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			statusString = "MPUI_REQUIRES_DANGER_CLOSE"
		end
	elseif LUI.startswith( slotName, "secondarygadgetattachment" ) then
		local secondaryGadgetIndex = CoD.CACUtility.GetItemEquippedInSlot( "secondarygadget", controller, classModel )
		local secondaryGadgetName = CoD.CACUtility.GetItemName( "secondarygadget", controller, classModel )
		statusString = "MPUI_EQUIP_TAKE_TWO"
		statusArg = secondaryGadgetName
		if secondaryGadgetIndex <= CoD.CACUtility.EmptyItemIndex or not Engine.GadgetHasTakeTwoAttachment( secondaryGadgetIndex, mode ) then
			availability = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			statusString = "MPUI_TAKE_TWO_NOT_AVAILABLE"
		end
	elseif LUI.startswith( slotName, "bonuscard" ) then
		statusString = "MPUI_EQUIP_WILDCARD"
	elseif LUI.startswith( slotName, "cybercom_tacrig" ) then
		statusString = "MPUI_EQUIP_TACRIG"
	end
	return availability, equipped, statusString, statusArg
end

CoD.CACUtility.GetNextAvailablePrimaryGunfighter = function ( classModel )
	if classModel then
		for _, primaryGunfighterName in ipairs( CoD.CACUtility.PrimaryGunfighterWildcards ) do
			if not CoD.CACUtility.IsBonusCardEquipped( primaryGunfighterName, classModel ) then
				return primaryGunfighterName
			end
		end
	end
	return ""
end

CoD.CACUtility.WildcardNeededForSlot = function ( controller, slotName )
	local classModel = CoD.perController[controller].classModel
	local wildcardName = nil
	local isRequiredEquipped = false
	local isRequiredLocked = true
	if slotName == "specialty4" then
		wildcardName = "bonuscard_perk_1_greed"
		isRequiredEquipped = true
		isRequiredLocked = IsNonAttachmentItemLocked( controller, wildcardName )
	elseif slotName == "specialty5" then
		wildcardName = "bonuscard_perk_2_greed"
		isRequiredEquipped = true
		isRequiredLocked = IsNonAttachmentItemLocked( controller, wildcardName )
	elseif slotName == "specialty6" then
		wildcardName = "bonuscard_perk_3_greed"
		isRequiredEquipped = true
		isRequiredLocked = IsNonAttachmentItemLocked( controller, wildcardName )
	elseif slotName == "primaryattachment4" or slotName == "primaryattachment5" or slotName == "primaryattachment6" then
		wildcardName = CoD.CACUtility.GetNextAvailablePrimaryGunfighter( classModel )
		isRequiredEquipped = CoD.CACUtility.ItemEquippedInSlot( "primary", controller, classModel )
		isRequiredLocked = IsNonAttachmentItemLocked( controller, wildcardName )
	elseif slotName == "secondaryattachment3" then
		local secondaryWeaponIndex = CoD.CACUtility.GetItemEquippedInSlot( "secondary", controller, classModel )
		local numAttachments = Engine.GetNumAttachments( secondaryWeaponIndex )
		wildcardName = "bonuscard_secondary_gunfighter"
		if numAttachments > 1 then
			isRequiredEquipped = CoD.CACUtility.ItemEquippedInSlot( "secondary", controller, classModel )
		else
			isRequiredEquipped = false
		end
		isRequiredLocked = IsNonAttachmentItemLocked( controller, wildcardName )
	elseif slotName == "primarygadgetattachment1" then
		wildcardName = "bonuscard_danger_close"
		isRequiredEquipped = CoD.CACUtility.ItemEquippedInSlot( "primarygadget", controller, classModel )
		isRequiredLocked = IsNonAttachmentItemLocked( controller, wildcardName )
	end
	return wildcardName, isRequiredEquipped, isRequiredLocked
end

CoD.CACUtility.UpdateGrenadeNames = function ( controller, classNum, classModel )
	local updateFunction = function ( slotName )
		local gadgetModifiedNameModel = Engine.CreateModel( classModel, slotName .. ".modifiedName" )
		if CoD.CACUtility.ItemEquippedInSlot( slotName, controller, classModel ) then
			local gadgetNameModel = Engine.GetModel( classModel, slotName .. ".name" )
			if gadgetNameModel and gadgetModifiedNameModel then
				local modifiedName = Engine.GetModelValue( gadgetNameModel )
				if CoD.CACUtility.ItemEquippedInSlot( slotName .. "attachment1", controller, classModel ) then
					modifiedName = Engine.Localize( "MPUI_X2_GRENADE", modifiedName )
				end
				Engine.SetModelValue( gadgetModifiedNameModel, modifiedName )
			end
		else
			Engine.SetModelValue( gadgetModifiedNameModel, "" )
		end
	end
	
	updateFunction( "primarygadget" )
	updateFunction( "secondarygadget" )
end

CoD.CACUtility.GetCustomClassModel = function ( controller, classNum, classModel, xuid )
	local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
	Engine.GetCustomClassModel( controller, classNum, classModel, mode, xuid )
	local f111_local0 = classModel:create( "classNum" )
	f111_local0:set( classNum )
	if CoD.perController[controller].isPreset == true then
		local classNameRef = classModel.customClassName:get()
		classModel.customClassName:set( Engine.Localize( classNameRef ) )
	end
	if IsCampaign() and classNum >= 5 and classNum <= 8 then
		classModel.customClassName:set( Engine.Localize( "CPUI_FIELD_OPS_KIT" ) )
	end
	if classNum >= 10 then
		Engine.SetModelValue( Engine.CreateModel( classModel, "defaultClassName" ), Engine.GetDefaultClassName( classNum - 10 ) )
	end
	CoD.CACUtility.UpdateHeaderNames( controller, classNum, classModel, xuid, mode )
	local updateWeaponVariantName = function ( loadoutSlot )
		local gunsmithVariantModel = Engine.GetModel( classModel, loadoutSlot .. "gunsmithvariant" )
		if gunsmithVariantModel then
			local slotModel = Engine.CreateModel( classModel, loadoutSlot .. ".variantName" )
			local gunsmithVariantIndex = Engine.GetModelValue( Engine.GetModel( gunsmithVariantModel, "itemIndex" ) )
			if gunsmithVariantIndex > CoD.CACUtility.EmptyItemIndex then
				local weaponVariant = CoD.CraftUtility.Gunsmith.GetVariantIndexFromCACVaraintIndex( controller, gunsmithVariantIndex )
				if weaponVariant then
					Engine.SetModelValue( slotModel, weaponVariant.variantName )
				end
			else
				Engine.SetModelValue( slotModel, "" )
			end
		end
	end
	
	if not Engine.IsInGame() then
		updateWeaponVariantName( "primary" )
		updateWeaponVariantName( "secondary" )
	end
	local updateImageModel = function ( loadoutSlot )
		local slotModel = Engine.GetModel( classModel, loadoutSlot )
		if not slotModel then
			return 
		end
		local imageModel = Engine.GetModel( slotModel, "image" )
		if imageModel then
			local imageModelValue = Engine.GetModelValue( imageModel )
			if imageModelValue and imageModelValue ~= CoD.CACUtility.DefaultLoadoutImage then
				Engine.SetModelValue( imageModel, imageModelValue )
			end
		end
	end
	
	updateImageModel( "primary" )
	updateImageModel( "secondary" )
	local updateAttachmentsForCosmeticVariants = function ( loadoutSlot, attachmentList, acvList )
		for index, attachmentSlot in ipairs( attachmentList ) do
			local cacAttachmentIndex = Engine.GetModelValue( Engine.GetModel( classModel, attachmentSlot .. ".itemIndex" ) )
			if cacAttachmentIndex > CoD.CACUtility.EmptyItemIndex then
				local cacACVIndex = Engine.GetModelValue( Engine.GetModel( classModel, acvList[index] .. ".itemIndex" ) )
				if cacACVIndex > CoD.CACUtility.EmptyItemIndex then
					local weaponIndex = Engine.GetModelValue( Engine.GetModel( classModel, loadoutSlot .. ".itemIndex" ) )
					local weaponName = Engine.GetWeaponString( controller, classNum, loadoutSlot )
					local attachmentTableIndex = Engine.GetItemAttachment( weaponIndex, cacAttachmentIndex )
					local acv = Engine.GetAttachmentCosmeticVariant( weaponName, attachmentTableIndex )
					if acv then
						local attachmentImageModel = Engine.GetModel( classModel, attachmentSlot .. ".image" )
						Engine.SetModelValue( attachmentImageModel, acv.image )
						local acvImageModel = Engine.GetModel( classModel, attachmentSlot .. "cosmeticvariant.image" )
						Engine.SetModelValue( acvImageModel, acv.image )
						local acvNameModel = Engine.GetModel( classModel, attachmentSlot .. "cosmeticvariant.name" )
						Engine.SetModelValue( acvNameModel, acv.name )
					end
				end
			end
		end
	end
	
	updateAttachmentsForCosmeticVariants( "primary", CoD.CACUtility.PrimaryAttachmentSlotNameList, CoD.CACUtility.PrimaryAttachmentCVSlotNameList )
	updateAttachmentsForCosmeticVariants( "secondary", CoD.CACUtility.SecondaryAttachmentSlotNameList, CoD.CACUtility.SecondaryAttachmentCVSlotNameList )
	DataSources.CustomClassMenu.updateCustomSlotModel( classModel, "primarygadget", controller )
	DataSources.CustomClassMenu.updateCustomSlotModel( classModel, "secondarygadget", controller )
	CoD.CACUtility.UpdateGrenadeNames( controller, classNum, classModel )
	local characterIndex = Engine.GetCharacterIndexForClientNum( controller, Engine.GetPredictedClientNum( controller ) )
	local positionRoleInventoryInfo = Engine.GetPostionRoleInventoryInfo( mode, characterIndex )
	for _, slotName in ipairs( CoD.CACUtility.loadoutSlotOrder ) do
		local slotModel = Engine.GetModel( classModel, slotName )
		if slotModel then
			local hintTextModel = Engine.CreateModel( slotModel, "hintText" )
			if hintTextModel then
				local availability, equipped, hintText, hintArg = CoD.CACUtility.GetCACSlotStatus( controller, classModel, slotName )
				if not hintText or hintText == "" then
					Engine.SetModelValue( hintTextModel, "" )
				elseif hintArg ~= nil then
					Engine.SetModelValue( hintTextModel, Engine.Localize( hintText, hintArg ) )
				else
					Engine.SetModelValue( hintTextModel, Engine.Localize( hintText ) )
				end
			end
			local levelUnlockDescription = ""
			local itemCost = 0
			if slotName ~= "primary" and slotName ~= "primarygrenade" then
				local itemIndex = slotModel.itemIndex:get()
				local slotType = positionRoleInventoryInfo[slotName]
				if LUI.startswith( slotName, "major" ) then
					slotType = positionRoleInventoryInfo.major
				elseif LUI.startswith( slotName, "general" ) then
					slotType = positionRoleInventoryInfo.general
				end
				if slotType then
					for _, itemInfo in ipairs( slotType ) do
						if itemInfo.itemIndex == itemIndex then
							if itemInfo.unlockIngameLevel > 1 then
							
							else
								if itemInfo.cost == 0 then
									levelUnlockDescription = Engine.Localize( "MENU_FREE" )
								end
								itemCost = itemInfo.cost
							end
							levelUnlockDescription = Engine.Localize( "MENU_ESCALATION_LEVEL_UNLOCK_DESC", itemInfo.unlockIngameLevel )
						end
					end
				end
			end
			local hintText = slotModel:create( "cost" )
			hintText:set( itemCost )
			hintText = slotModel:create( "levelUnlockDescription" )
			hintText:set( levelUnlockDescription )
		end
	end
	Engine.SetModelValue( Engine.CreateModel( classModel, "disabled" ), CoD.BlackMarketUtility.ClassContainsLockedItems( controller, classModel ) )
end

CoD.CACUtility.UpdateWeaponOptions = function ( controller, classModel )
	local loadoutSlotName = CoD.perController[controller].weaponCategory
	local perControllerModel = Engine.GetModelForController( controller )
	local updateWeaponOptions = function ( controller, classModel, loadoutSlotName )
		local perControllerModel = Engine.GetModelForController( controller )
		for index = 0, #CoD.CACUtility.weaponOptionGroupNames - 1, 1 do
			local value = CoD.CACUtility.weaponOptionGroupNames[index]
			local weaponOptionSlotName = loadoutSlotName .. value
			local weaponOptionIndexModel = Engine.GetModel( classModel, weaponOptionSlotName .. ".itemIndex" )
			if weaponOptionIndexModel then
				local weaponOptionIndex = Engine.GetModelValue( weaponOptionIndexModel )
				local weaponOptionModel = Engine.GetModel( perControllerModel, "WeaponOptions." .. value .. "." .. weaponOptionIndex )
				if weaponOptionModel then
					local nameModel = Engine.GetModel( classModel, weaponOptionSlotName .. ".name" )
					local imageModel = Engine.GetModel( classModel, weaponOptionSlotName .. ".image" )
					if nameModel and imageModel then
						Engine.SetModelValue( nameModel, Engine.GetModelValue( Engine.GetModel( weaponOptionModel, "name" ) ) )
						Engine.SetModelValue( imageModel, Engine.GetModelValue( Engine.GetModel( weaponOptionModel, "image" ) ) )
					end
				end
			end
		end
	end
	
	updateWeaponOptions( controller, classModel, "primary" )
	updateWeaponOptions( controller, classModel, "secondary" )
	CoD.CACUtility.UpdateWeaponCustomizationCategoryList( controller, classModel )
end

CoD.CACUtility.UpdateAttachmentCosmeticVariants = function ( controller, classModel )
	local updateVariants = function ( classModel, attachmentSlotList )
		for key, attachmentSlotName in pairs( attachmentSlotList ) do
			local acvSlotName = attachmentSlotName .. "cosmeticvariant"
			local attachmentModel = Engine.GetModel( classModel, attachmentSlotName )
			local acvSlotModel = Engine.GetModel( classModel, acvSlotName )
			if acvSlotModel and attachmentModel then
				local acvIndexModel = Engine.GetModel( acvSlotModel, "itemIndex" )
				local attachmentIndexModel = Engine.GetModel( attachmentModel, "itemIndex" )
				if acvIndexModel and attachmentIndexModel then
					local acvIndex = Engine.GetModelValue( acvIndexModel )
					local attachmentIndex = Engine.GetModelValue( attachmentIndexModel )
					if acvIndex > 0 and attachmentIndex > 0 then
						local acvNameModel = Engine.GetModel( acvSlotModel, "name" )
						local acvImageModel = Engine.GetModel( acvSlotModel, "image" )
						local acvRefModel = Engine.GetModel( acvSlotModel, "ref" )
						local attachmentRefModel = Engine.GetModel( attachmentModel, "ref" )
						if acvNameModel and acvImageModel and acvRefModel and attachmentRefModel then
							local attachmentRef = Engine.GetModelValue( attachmentRefModel )
							if CoD.WC_Category.ACV.attachmentTable[attachmentRef] then
								local variantInfo = CoD.WC_Category.ACV.attachmentTable[attachmentRef].variants[acvIndex]
								local f118_local3 = Engine.SetModelValue
								local f118_local4 = acvNameModel
								local f118_local5
								if variantInfo then
									f118_local5 = variantInfo.name
									if not f118_local5 then
									
									else
										f118_local3( f118_local4, f118_local5 )
										f118_local3 = Engine.SetModelValue
										f118_local4 = acvImageModel
										if variantInfo then
											f118_local5 = variantInfo.image
											if not f118_local5 then
											
											else
												f118_local3( f118_local4, f118_local5 )
												Engine.SetModelValue( acvRefModel, attachmentRef )
											end
										end
										f118_local5 = ""
									end
								end
								f118_local5 = ""
							end
						end
					end
				end
			end
		end
	end
	
	updateVariants( classModel, CoD.CACUtility.PrimaryAttachmentSlotNameList )
	updateVariants( classModel, CoD.CACUtility.SecondaryAttachmentSlotNameList )
end

CoD.CACUtility.UpdateWeaponCustomizationCategoryList = function ( controller, classModel )
	local perControllerModel = Engine.GetModelForController( controller )
	local loadoutSlotName = CoD.perController[controller].weaponCategory
	local weaponCustomModel = Engine.GetModel( perControllerModel, "WeaponCustomizationCategory" )
	if weaponCustomModel then
		for index = 1, CoD.CACUtility.maxWeaponCustomizationCategories, 1 do
			local weaponCustomParentIndexModel = Engine.GetModel( weaponCustomModel, index )
			if weaponCustomParentIndexModel then
				local weaponCustomTypeModel = Engine.GetModel( weaponCustomParentIndexModel, "type" )
				if weaponCustomTypeModel then
					local weaponCustomType = Engine.GetModelValue( weaponCustomTypeModel )
					if weaponCustomType == "paintjob" then
						local paintjobIndexModel = Engine.GetModel( classModel, loadoutSlotName .. "paintjobindex.itemIndex" )
						local paintjobIndex = Engine.GetModelValue( paintjobIndexModel )
						Engine.SetModelValue( Engine.GetModel( weaponCustomParentIndexModel, "paintjobIndex" ), paintjobIndex )
						local paintjobSlotModel = Engine.GetModel( classModel, loadoutSlotName .. "paintjobslot.itemIndex" )
						local paintjobSlot = Engine.GetModelValue( paintjobSlotModel )
						Engine.SetModelValue( Engine.GetModel( weaponCustomParentIndexModel, "paintjobSlot" ), paintjobSlot )
						Engine.SetModelValue( Engine.GetModel( weaponCustomParentIndexModel, "paintjobSlotAndIndex" ), paintjobSlot .. " " .. paintjobIndex )
					end
					local currentWeaponSlotWeaponOption = Engine.GetModel( classModel, loadoutSlotName .. weaponCustomType )
					if currentWeaponSlotWeaponOption then
						local classOptionName = Engine.GetModelValue( Engine.GetModel( currentWeaponSlotWeaponOption, "name" ) )
						local classOptionImage = Engine.GetModelValue( Engine.GetModel( currentWeaponSlotWeaponOption, "image" ) )
						Engine.SetModelValue( Engine.GetModel( weaponCustomParentIndexModel, "name" ), classOptionName )
						Engine.SetModelValue( Engine.GetModel( weaponCustomParentIndexModel, "image" ), classOptionImage )
					end
				end
			end
		end
	end
end

CoD.CACUtility.UpdateAllClasses = function ( controller )
	local classCount = Engine.GetCustomClassCount( controller )
	local editClassModel = Engine.GetModel( Engine.GetModelForController( controller ), "CustomClassList" )
	for index = 1, classCount, 1 do
		local classNum = index - 1
		local currentClassModel = Engine.GetModel( editClassModel, "class" .. index )
		CoD.CACUtility.GetCustomClassModel( controller, classNum, currentClassModel )
	end
end

CoD.CACUtility.GetWeaponOptionsFromClass = function ( controller, classModel, loadoutSlotName )
	if not classModel then
		classModel = CoD.perController[controller].classModel
	end
	local camoIndexModel = Engine.GetModel( classModel, loadoutSlotName .. "camo.itemIndex" )
	local reticleIndexModel = Engine.GetModel( classModel, loadoutSlotName .. "reticle.itemIndex" )
	local paintJobSlotIndexModel = Engine.GetModel( classModel, loadoutSlotName .. "paintjobslot.itemIndex" )
	local paintJobIndexItemIndexModel = Engine.GetModel( classModel, loadoutSlotName .. "paintjobindex.itemIndex" )
	local camoIndex = "0"
	local reticleIndex = "0"
	if camoIndexModel then
		camoIndex = Engine.GetModelValue( camoIndexModel )
	end
	if reticleIndexModel then
		reticleIndex = Engine.GetModelValue( reticleIndexModel )
	end
	if IsLive() then
		if paintJobSlotIndexModel and paintJobIndexItemIndexModel then
			local paintJobSlot = Engine.GetModelValue( paintJobSlotIndexModel )
			local paintJobIndex = Engine.GetModelValue( paintJobIndexItemIndexModel )
			Engine.SetupPaintjobData( controller, paintJobSlot, paintJobIndex )
		end
	else
		Engine.ClearPaintjobLayerData()
	end
	return camoIndex .. "," .. reticleIndex .. ",1"
end

CoD.CACUtility.EmptyWeaponOptions = function ()
	local camoIndex = "0"
	local reticleIndex = "0"
	return camoIndex .. "," .. reticleIndex .. ",0"
end

CoD.CACUtility.GetAttachmentCosmeticVariantsFromClass = function ( controller, classModel, loadoutSlotName )
	if not classModel then
		classModel = CoD.perController[controller].classModel
	end
	local attachmentInfo = ""
	local variantAttachmentList = CoD.CACUtility.GetAttachmentVariantForAttachmentList( classModel, loadoutSlotName )
	for index = 1, #variantAttachmentList, 1 do
		attachmentInfo = attachmentInfo .. variantAttachmentList[index].ref .. "," .. variantAttachmentList[index].attachmentIndex .. ","
	end
	return attachmentInfo
end

CoD.CACUtility.GetACVariantsFromClassExcludeAttachment = function ( controller, classModel, loadoutSlotName, excludeAttachment )
	if not classModel then
		classModel = CoD.perController[controller].classModel
	end
	local attachmentInfo = ""
	local variantAttachmentList = CoD.CACUtility.GetAttachmentVariantForAttachmentList( classModel, loadoutSlotName )
	for index = 1, #variantAttachmentList, 1 do
		if variantAttachmentList[index].ref ~= excludeAttachment then
			attachmentInfo = attachmentInfo .. variantAttachmentList[index].ref .. "," .. variantAttachmentList[index].attachmentIndex .. ","
		end
	end
	return attachmentInfo
end

CoD.CACUtility.GetWeaponOptionsFromVariantInfo = function ( controller, variantInfo )
	local camoIndex = "0"
	local reticleIndex = "0"
	if variantInfo.camoIndex then
		camoIndex = variantInfo.camoIndex
	end
	if variantInfo.reticleIndex then
		reticleIndex = variantInfo.reticleIndex
	end
	if variantInfo.paintjobSlot and variantInfo.paintjobIndex then
		Engine.SetupPaintjobData( controller, variantInfo.paintjobSlot, variantInfo.paintjobIndex )
	end
	return camoIndex .. "," .. reticleIndex .. ",1"
end

CoD.CACUtility.GetAttachmentCosmeticVariantsFromVariantInfo = function ( variantInfo )
	local attachmentInfo = ""
	for index, acvIndex in ipairs( variantInfo.attachmentVariant ) do
		local attachmentTableIndex = variantInfo.attachment[index]
		if attachmentTableIndex > CoD.CACUtility.EmptyItemIndex then
			local attachmentRef = Engine.GetAttachmentRefByIndex( attachmentTableIndex )
			attachmentInfo = attachmentInfo .. attachmentRef .. "," .. acvIndex .. ","
		end
	end
	return attachmentInfo
end

CoD.CACUtility.GetBaseWeaponLoadoutSlotName = function ( loadoutSlot )
	local baseWeaponLoadoutSlot = nil
	if loadoutSlot == "primary" or loadoutSlot == "secondary" or loadoutSlot == "primarygrenade" or loadoutSlot == "secondarygadget" or loadoutSlot == "primarygadget" or loadoutSlot == "specialgrenade" or loadoutSlot == "heroweapon" or loadoutSlot == "herogadget" or loadoutSlot == "cybercore" or LUI.startswith( loadoutSlot, "killstreak" ) or LUI.startswith( loadoutSlot, "specialty" ) or LUI.startswith( loadoutSlot, "bonuscard" ) then
		baseWeaponLoadoutSlot = loadoutSlot
	elseif LUI.startswith( loadoutSlot, "primaryattachment" ) then
		baseWeaponLoadoutSlot = "primary"
	elseif LUI.startswith( loadoutSlot, "secondaryattachment" ) then
		baseWeaponLoadoutSlot = "secondary"
	elseif LUI.startswith( loadoutSlot, "primarygadgetattachment" ) then
		baseWeaponLoadoutSlot = "primarygadget"
	elseif LUI.startswith( loadoutSlot, "secondarygadgetattachment" ) then
		baseWeaponLoadoutSlot = "secondarygadget"
	elseif LUI.startswith( loadoutSlot, "cybercom_" ) then
		baseWeaponLoadoutSlot = "cybercom"
	elseif LUI.startswith( loadoutSlot, "major" ) then
		baseWeaponLoadoutSlot = "major"
	elseif LUI.startswith( loadoutSlot, "general" ) then
		baseWeaponLoadoutSlot = "general"
	end
	return baseWeaponLoadoutSlot
end

CoD.CACUtility.GetGunLevelWeaponIndex = function ( controller, element )
	local classModel = CoD.perController[controller].classModel
	local weaponSlot = CoD.perController[controller].weaponSlot
	local weaponCategory = CoD.perController[controller].weaponCategory
	local f128_local0 = element
	local elementWeaponSlotModel = element:getModel( controller, "weaponSlot" )
	local f128_local1 = f128_local0 and elementWeaponSlotModel
	if f128_local1 then
		weaponCategory = Engine.GetModelValue( f128_local1 )
	end
	if weaponCategory and (LUI.startswith( weaponCategory, "primaryattachment" ) or LUI.startswith( weaponCategory, "secondaryattachment" )) and weaponSlot then
		local weaponIndexModel = Engine.GetModel( classModel, weaponSlot .. ".itemIndex" )
		if weaponIndexModel then
			return Engine.GetModelValue( weaponIndexModel )
		end
	end
	if element then
		local itemIndexModel = element:getModel( controller, "itemIndex" )
		if itemIndexModel then
			return Engine.GetModelValue( itemIndexModel )
		end
		local weaponIndexModel = element:getModel( controller, "weaponIndex" )
		if weaponIndexModel then
			return Engine.GetModelValue( weaponIndexModel )
		end
	end
	return CoD.CACUtility.EmptyItemIndex
end

CoD.CACUtility.AttachmentEquippedInCACSlot = function ( controller, baseWeaponLoadout, attachmentIndex )
	local classModel = CoD.perController[controller].classModel
	local attachmentList = CoD.CACUtility.PrimaryAttachmentSlotNameList
	if baseWeaponLoadout == "secondary" then
		attachmentList = CoD.CACUtility.SecondaryAttachmentSlotNameList
	end
	for index, attachmentSlot in ipairs( attachmentList ) do
		local cacAttachmentIndex = Engine.GetModelValue( Engine.GetModel( classModel, attachmentSlot .. ".itemIndex" ) )
		if cacAttachmentIndex == attachmentIndex then
			return index
		end
	end
end

CoD.CACUtility.ValidateWeaponVariantForClass = function ( controller, classModel )
	local classNum = CoD.perController[controller].classNum
	local validateWeaponVariantSlot = function ( loadoutSlot, attachmentList )
		local cacVariantIndex = Engine.GetModelValue( Engine.GetModel( classModel, loadoutSlot .. "gunsmithvariant.itemIndex" ) )
		if cacVariantIndex > CoD.CACUtility.EmptyItemIndex then
			local variant = CoD.CraftUtility.Gunsmith.GetVariantByIndex( controller, cacVariantIndex - 1 )
			local notVariantMatch = false
			local cacWeaponIndex = Engine.GetModelValue( Engine.GetModel( classModel, loadoutSlot .. ".itemIndex" ) )
			if cacWeaponIndex == variant.weaponIndex then
				for variantAttachmentTableIndex, attachmentIndex in ipairs( variant.attachment ) do
					local f131_local6 = false
					local attachmentIndexFromAttachmentTable = Engine.GetAttachmentIndexByAttachmentTableIndex( variant.weaponIndex, attachmentIndex )
					if attachmentIndexFromAttachmentTable > CoD.CACUtility.EmptyItemIndex then
						for cacAttachmentTableIndex, attachmentName in ipairs( attachmentList ) do
							local cacAttachmentIndex = Engine.GetModelValue( Engine.GetModel( classModel, attachmentName .. ".itemIndex" ) )
							if attachmentIndexFromAttachmentTable == cacAttachmentIndex then
								f131_local6 = true
								break
							end
						end
						if not f131_local6 then
							notVariantMatch = true
						end
					end
				end
			end
			if notVariantMatch then
				CoD.CACUtility.SetClassItem( controller, classNum, loadoutSlot .. "gunsmithvariant", CoD.CACUtility.EmptyItemIndex )
			end
		end
	end
	
	validateWeaponVariantSlot( "primary", CoD.CACUtility.PrimaryAttachmentSlotNameList )
	validateWeaponVariantSlot( "secondary", CoD.CACUtility.SecondaryAttachmentSlotNameList )
end

CoD.CACUtility.CreateUnlockTokenModels = function ( controller )
	if not CoD.CACUtility.unlockTokenModel[controller] then
		CoD.CACUtility.unlockTokenModel[controller] = Engine.CreateModel( Engine.GetModelForController( controller ), "UnlockTokenInfo" )
		Engine.CreateModel( CoD.CACUtility.unlockTokenModel[controller], "itemIndex" )
		local xpBarInfoModel = Engine.CreateModel( CoD.CACUtility.unlockTokenModel[controller], "xpBarInfo" )
		Engine.CreateModel( xpBarInfoModel, "rankXP" )
		Engine.CreateModel( xpBarInfoModel, "xpEarned" )
		Engine.CreateModel( xpBarInfoModel, "xpNeeded" )
		Engine.CreateModel( xpBarInfoModel, "currLevel" )
		Engine.CreateModel( xpBarInfoModel, "currLevelIcon" )
		Engine.CreateModel( xpBarInfoModel, "nextLevel" )
		Engine.CreateModel( xpBarInfoModel, "nextLevelIcon" )
	end
	local unlockTokensCountModel = Engine.GetModel( Engine.GetModelForController( controller ), "unlockTokensCount" )
	local itemGroup = "weapon_smg"
	local mode = CoD.PlayerRoleUtility.customizationMode
	if not mode then
		mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
	end
	Engine.SetModelValue( unlockTokensCountModel, Engine.GetCurrentTokens( controller, itemGroup, mode ) )
end

CoD.CACUtility.GetPerkXModel = function ( itemIndex, mode )
	return "p7_perk_" .. Engine.GetItemImage( itemIndex, mode )
end

CoD.CACUtility.GetBonuscardXModel = function ( itemIndex, mode )
	return "p7_" .. Engine.GetItemRef( itemIndex, mode )
end

CoD.CACUtility.GetCybercoreXModel = function ( itemIndex, mode )
	return "p7_core_" .. Engine.GetItemImage( itemIndex, mode )
end

CoD.CACUtility.WeaponSelectFocusOnLastSelectedWeapon = function ( self, controller )
	local categoryGroup = DataSources.Unlockables:getCurrentFilterItem()
	if self.weaponList.activeWidget then
		local lastIndex = self.weaponList.activeWidget.gridInfoTable.zeroBasedIndex + 1
		if self.lastSelectionTable and self.lastSelectionTable[categoryGroup] then
			self.lastSelectionTable[categoryGroup] = lastIndex
		end
	end
end

CoD.CACUtility.WeaponSelectFocusOnLastSelectedCategory = function ( self, element, controller )
	if not element then
		return 
	end
	local categoryGroup = element.filter
	if not categoryGroup then
		categoryGroup = DataSources.Unlockables:getCurrentFilterItem()
	end
	DataSources.Unlockables.setCurrentFilterItem( categoryGroup )
	self.weaponList:updateDataSource( true )
	if not self.performingSetup then
		local lastIndex = 1
		if self.lastSelectionTable and self.lastSelectionTable[categoryGroup] then
			lastIndex = self.lastSelectionTable[categoryGroup]
		end
		local weaponWidget = self.weaponList:getItemAt( lastIndex )
		if weaponWidget then
			self.weaponList:setActiveItem( weaponWidget, 0, true, true )
		end
	end
end

CoD.CACUtility.SetCACMenuHeroInfoModels = function ( controller )
	local mode = Engine.CurrentSessionMode()
	local heroIndex = Engine.GetEquippedHero( controller, mode )
	local heroInfoTable = Engine.GetEquippedHeroInfo( controller, mode )
	if heroInfoTable and heroIndex then
		local loadoutType = Engine.GetLoadoutTypeForHero( controller, heroIndex )
		if loadoutType then
			local cacMenuModel = Engine.GetModel( Engine.GetModelForController( controller ), "CACMenu" )
			if cacMenuModel then
				local heroRender = heroInfoTable.defaultHeroRender
				if loadoutType == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET then
					heroRender = heroInfoTable.defaultHeroRenderAbility
				end
				Engine.SetModelValue( Engine.GetModel( cacMenuModel, "currentHeroImage" ), heroRender )
				Engine.SetModelValue( Engine.GetModel( cacMenuModel, "currentHeroName" ), heroInfoTable.displayName )
			end
			local loadoutInfo = Engine.GetLoadoutInfoForHero( mode, heroIndex, loadoutType )
			if loadoutInfo then
				Engine.SetModelValue( Engine.GetModel( cacMenuModel, "currentHeroLoadout" ), Engine.Localize( loadoutInfo.itemName ) )
			end
		end
	end
end

CoD.CACUtility.UpgradeEquippedCACItems = function ( controller, loadoutSlot, baseItemIndex, upgradeItemIndex )
	local classListModel = Engine.GetModel( Engine.GetModelForController( controller ), "CustomClassList" )
	for classIndex = 1, Engine.GetCustomClassCount( controller ), 1 do
		local classNum = classIndex - 1
		local classModel = Engine.GetModel( classListModel, "class" .. classIndex )
		local mutuallyExclusiveSlotTable = CoD.CACUtility.GetMutuallyExclusiveSlotName( loadoutSlot, controller, baseItemIndex, classModel )
		local UpgradeForLoadoutSlot = function ( loadoutSlot )
			if loadoutSlot ~= nil then
				local loadoutSlotModel = Engine.GetModel( classModel, loadoutSlot )
				if loadoutSlotModel then
					local itemIndexModel = Engine.GetModel( loadoutSlotModel, "itemIndex" )
					if itemIndexModel then
						local itemIndex = Engine.GetModelValue( itemIndexModel )
						if itemIndex == baseItemIndex then
							CoD.CACUtility.SetClassItem( controller, classNum, loadoutSlot, upgradeItemIndex )
						end
					end
				end
			end
		end
		
		UpgradeForLoadoutSlot( loadoutSlot )
		for i = 1, #mutuallyExclusiveSlotTable, 1 do
			local mutuallyExclusiveSlot = mutuallyExclusiveSlotTable[i]
			if mutuallyExclusiveSlot and mutuallyExclusiveSlot ~= "" then
				UpgradeForLoadoutSlot( mutuallyExclusiveSlot )
			end
		end
	end
end

CoD.CACUtility.GetAllItems = function ( force, sort )
	if force ~= true and CoD.CACUtility.Items then
		return unpack( CoD.CACUtility.Items )
	end
	local attachments = {}
	for attachmentIndex = 0, 43, 1 do
		local attachmentRestrictionState = Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_NONE
		if Engine.IsAttachmentRestrictedForAllWeapons( attachmentIndex ) == true then
			attachmentRestrictionState = Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_RESTRICTED
		end
		local attachment = {
			index = attachmentIndex,
			desc = Engine.GetAttachmentDescByAttachmentIndex( attachmentIndex ),
			name = Engine.GetAttachmentNameByIndex( attachmentIndex ),
			image = Engine.GetAttachmentImageByIndex( attachmentIndex ),
			isOptic = Engine.IsOpticByAttachmentIndex( attachmentIndex ),
			restrictionState = attachmentRestrictionState,
			items = {}
		}
		attachments[attachmentIndex] = attachment
	end
	local attachmentIndex = {}
	local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
	for itemIndex = 0, 255, 1 do
		local itemId = Engine.GetItemRef( itemIndex )
		if Engine.ItemIndexValid( itemIndex, mode ) and not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( itemId ) then
			local itemInfo = Engine.GetUnlockableInfoByIndex( itemIndex, mode )
			if itemInfo.allocation >= 0 then
				local item = {
					index = itemIndex,
					name = itemInfo.name,
					image = itemInfo.image,
					groupIndex = itemInfo.groupIndex,
					groupName = itemInfo.group,
					loadoutSlot = itemInfo.loadoutSlot,
					loadoutSlotIndex = itemInfo.loadoutSlotIndex,
					unlockLevel = itemInfo.unlockLevel,
					momentum = itemInfo.momentum,
					restrictionState = itemInfo.restrictionState,
					allocation = itemInfo.allocation
				}
				if LuaUtils.StartsWith( item.loadoutSlot, "hero" ) or item.loadoutSlot == "specialgadget" then
					item.image = itemInfo.image .. "_large"
				end
				if LuaUtils.StartsWith( item.loadoutSlot, "killstreak" ) then
					item.image = itemInfo.image .. "_menu"
				end
				if item.loadoutSlot == "primary" or item.loadoutSlot == "secondary" then
					local attachmentCount = Engine.GetNumAttachments( itemIndex )
					if attachmentCount > 0 then
						item.attachments = {}
						for attachmentIndex = 0, attachmentCount - 1, 1 do
							local attachment = Engine.GetItemAttachment( itemIndex, attachmentIndex )
							if attachment > CoD.CACUtility.EmptyItemIndex then
								item.attachments[attachment] = {
									attachmentIndex = attachment,
									restrictionState = Engine.GetAttachmentRestrictionState( attachment, itemIndex, false )
								}
								table.insert( attachments[attachment].items, {
									itemIndex = itemIndex
								} )
							end
						end
					end
				end
				attachmentIndex[itemIndex] = item
			end
		end
	end
	if sort == true then
		local attachmentSort = function ( a, b )
			if attachments[a].isOptic and attachments[b].isOptic then
				return Engine.Localize( attachments[a].name ) < Engine.Localize( attachments[b].name )
			elseif attachments[a].isOptic ~= attachments[b].isOptic then
				return attachments[a].isOptic
			else
				return Engine.Localize( attachments[a].name ) < Engine.Localize( attachments[b].name )
			end
		end
		
		local sortedAttachments = {}
		for attachmentIndex, attachment in LUI.IterateTableBySortedKeys( attachments, attachmentSort, nil ) do
			sortedAttachments[attachment.index] = attachment
		end
		attachmentRestrictionState = Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER )
		local itemSort = function ( a, b )
			if LuaUtils.StartsWith( attachmentIndex[a].loadoutSlot, "hero" ) or attachmentIndex[a].loadoutSlot == "specialgadget" or LuaUtils.StartsWith( attachmentIndex[b].loadoutSlot, "hero" ) or attachmentIndex[b].loadoutSlot == "specialgadget" then
				local heroIndexA = -1
				local heroLoadoutTypeA = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_INVALID
				local heroIndexB = -1
				local heroLoadoutTypeB = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_INVALID
				for _, hero in ipairs( attachmentRestrictionState ) do
					local heroIndex = hero.bodyIndex
					local weapon = Engine.GetLoadoutItemIndexForHero( Engine.CurrentSessionMode(), heroIndex, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
					local ability = Engine.GetLoadoutItemIndexForHero( Engine.CurrentSessionMode(), heroIndex, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET )
					if attachmentIndex[a].index == weapon then
						heroIndexA = heroIndex
						heroLoadoutTypeA = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON
					elseif attachmentIndex[a].index == ability then
						heroIndexA = heroIndex
						heroLoadoutTypeA = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET
					end
					if attachmentIndex[b].index == weapon then
						heroIndexB = heroIndex
						heroLoadoutTypeB = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON
					end
					if attachmentIndex[b].index == ability then
						heroIndexB = heroIndex
						heroLoadoutTypeB = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET
					end
				end
				if heroIndexA == heroIndexB then
					return heroLoadoutTypeA < heroLoadoutTypeB
				end
				return heroIndexA < heroIndexB
			elseif LUI.startswith( attachmentIndex[a].loadoutSlot, "killstreak" ) or LUI.startswith( attachmentIndex[b].loadoutSlot, "killstreak" ) then
				return attachmentIndex[a].momentum < attachmentIndex[b].momentum
			elseif attachmentIndex[a].groupIndex ~= attachmentIndex[b].groupIndex then
				return attachmentIndex[a].groupIndex < attachmentIndex[b].groupIndex
			elseif attachmentIndex[a].loadoutSlot == attachmentIndex[b].loadoutSlot then
				return Engine.Localize( attachmentIndex[a].name ) < Engine.Localize( attachmentIndex[b].name )
			else
				return Engine.Localize( attachmentIndex[a].loadoutSlot ) < Engine.Localize( attachmentIndex[b].loadoutSlot )
			end
		end
		
		local sortedItems = {}
		for itemIndex, f141_local3 in LUI.IterateTableBySortedKeys( attachmentIndex, itemSort, nil ) do
			sortedItems[itemIndex] = f141_local3
		end
		CoD.CACUtility.Items = {
			sortedItems,
			sortedAttachments
		}
		return unpack( CoD.CACUtility.Items )
	end
	CoD.CACUtility.Items = {
		attachmentIndex,
		attachments
	}
	return unpack( CoD.CACUtility.Items )
end

CoD.CACUtility.GetLoadout = function ( controller, classIndex )
	local customClass = {
		weapons = {},
		primaryAttachments = {},
		secondaryAttachments = {},
		equipment = {},
		perks = {},
		wildcards = {},
		other = {},
		streaks = {}
	}
	local class = Engine.GetCustomClass( controller, classIndex )
	for loadoutName, selectedIndex in pairs( class ) do
		if LUI.startswith( loadoutName, "primaryattachment" ) then
			local attachmentIndex = Engine.GetItemAttachment( class.primary, selectedIndex )
			table.insert( customClass.primaryAttachments, attachmentIndex )
		end
		if LUI.startswith( loadoutName, "secondaryattachment" ) then
			local attachmentIndex = Engine.GetItemAttachment( class.secondary, selectedIndex )
			table.insert( customClass.secondaryAttachments, attachmentIndex )
		end
		if LUI.startswith( loadoutName, "killstreak" ) then
			customClass.streaks[loadoutName] = selectedIndex
		end
		if LUI.startswith( loadoutName, "hero" ) or loadoutName == "specialgadget" then
			customClass.heroItem = selectedIndex
		end
		if LUI.startswith( loadoutName, "specialty" ) then
			customClass.perks[loadoutName] = selectedIndex
		end
		if LUI.startswith( loadoutName, "bonuscard" ) then
			customClass.wildcards[loadoutName] = selectedIndex
		end
		if loadoutName == "primary" or loadoutName == "secondary" then
			customClass.weapons[loadoutName] = selectedIndex
		end
		if loadoutName == "primarygadget" or loadoutName == "secondarygadget" then
			customClass.equipment[loadoutName] = selectedIndex
		else
			customClass.other[loadoutName] = selectedIndex
		end
	end
	return customClass
end

CoD.CACUtility.GetFullLoadout = function ( controller )
	local loadout = {
		classes = {}
	}
	local classCount = Engine.GetCustomClassCount( controller )
	for classIndex = 0, classCount - 1, 1 do
		local customClass = CoD.CACUtility.GetLoadout( controller, classIndex )
		if loadout.streaks == nil then
			loadout.streaks = customClass.streaks
		end
		if loadout.heroItem == nil then
			loadout.heroItem = customClass.heroItem
		end
		table.insert( loadout.classes, customClass )
	end
	return loadout
end

CoD.CACUtility.SetShowcaseWeaponToClassPrimary = function ( controller, classNum )
	local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local classIndex = classNum + 1
	local classListModel = Engine.GetModel( Engine.GetModelForController( controller ), "CustomClassList" )
	local classModel = Engine.GetModel( classListModel, "class" .. classIndex )
	local heroIndex = Engine.GetEquippedHero( controller, mode )
	local primaryModel = Engine.GetModel( classModel, "primary" )
	local variantNameModel = Engine.GetModel( primaryModel, "variantName" )
	if variantNameModel then
		Engine.SetHeroShowcaseWeaponVariantName( controller, mode, heroIndex, Engine.GetModelValue( variantNameModel ) )
	end
	local primaryWeaponIndex = CoD.CACUtility.GetItemEquippedInSlot( "primary", controller, classModel )
	if CoD.CACUtility.EmptyItemIndex < primaryWeaponIndex then
		Engine.SetHeroShowcaseWeaponAttribute( controller, mode, heroIndex, "weaponIndex", primaryWeaponIndex )
	end
	for attachmentIndex = 1, CoD.CACUtility.maxPrimaryAttachments, 1 do
		local loadoutName = "primaryattachment" .. attachmentIndex
		local primaryAttachmentIndex = CoD.CACUtility.GetItemEquippedInSlot( loadoutName, controller, classModel )
		if CoD.CACUtility.EmptyItemIndex < primaryAttachmentIndex then
			Engine.SetHeroShowcaseWeaponAttribute( controller, mode, heroIndex, "attachment", primaryAttachmentIndex, attachmentIndex - 1 )
		end
	end
	local variantAttachmentList = CoD.CACUtility.GetAttachmentVariantForAttachmentList( classModel, "primary" )
	for index = 1, #variantAttachmentList, 1 do
		Engine.SetHeroShowcaseWeaponAttribute( controller, mode, heroIndex, "attachmentVariant", variantAttachmentList[index].attachmentIndex, index - 1 )
	end
	local camoIndex = CoD.CACUtility.GetItemEquippedInSlot( "primaryCamo", controller, classModel )
	Engine.SetHeroShowcaseWeaponAttribute( controller, mode, heroIndex, "camoIndex", camoIndex )
	local primaryPaintJobSlotIndex = CoD.CACUtility.GetItemEquippedInSlot( "primarypaintjobslot", controller, classModel )
	Engine.SetHeroShowcaseWeaponAttribute( controller, mode, heroIndex, "paintjobSlot", primaryPaintJobSlotIndex )
	local primaryPaintJobIndex = CoD.CACUtility.GetItemEquippedInSlot( "primarypaintjobindex", controller, classModel )
	Engine.SetHeroShowcaseWeaponAttribute( controller, mode, heroIndex, "paintjobIndex", primaryPaintJobIndex )
	MarkCACPaintshopDataDirty( nil, controller )
end

CoD.CACUtility.AnyItemBanned = function ( itemsTable )
	for slot, itemIndex in pairs( itemsTable ) do
		if Engine.IsItemIndexRestricted( itemIndex, false ) then
			return true
		end
	end
	return false
end

CoD.CACUtility.AnyAttachmentBanned = function ( weaponIndex, attachments )
	for attachmentIndex, attachment in ipairs( attachments ) do
		if Engine.IsAttachmentRestricted( attachment, weaponIndex, false ) == true then
			return true
		end
	end
	return false
end

CoD.CACUtility.AnyClassContainsRestrictedItems = function ( controller )
	local classCount = Engine.GetCustomClassCount( controller )
	for classIndex = 0, classCount - 1, 1 do
		if CoD.CACUtility.ClassContainsRestrictedItems( controller, classIndex ) then
			return true
		end
	end
	return false
end

CoD.CACUtility.AnyEquippedScorestreaksBanned = function ( controller )
	local loadout = CoD.CACUtility.GetFullLoadout( controller )
	return CoD.CACUtility.AnyItemBanned( loadout.streaks )
end

CoD.CACUtility.ClassContainsRestrictedItems = function ( controller, classIndex )
	local class = CoD.CACUtility.GetLoadout( controller, classIndex )
	if CoD.CACUtility.AnyItemBanned( class.weapons ) then
		return true
	elseif CoD.CACUtility.AnyItemBanned( class.equipment ) then
		return true
	elseif CoD.CACUtility.AnyItemBanned( class.perks ) then
		return true
	elseif CoD.CACUtility.AnyItemBanned( class.wildcards ) then
		return true
	elseif class.weapons.primary ~= nil and CoD.CACUtility.AnyAttachmentBanned( class.weapons.primary, class.primaryAttachments ) then
		return true
	elseif class.weapons.secondary ~= nil and CoD.CACUtility.AnyAttachmentBanned( class.weapons.secondary, class.secondaryAttachments ) then
		return true
	else
		return false
	end
end

CoD.CACUtility.GetAllRestrictedItems = function ()
	local session = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	local clients = session.sessionClients
	local restrictedItems = {}
	for index, client in ipairs( clients ) do
		if client.voteCount > 0 then
			for voteIndex, vote in ipairs( client.votes ) do
				if vote.voteType == Enum.VoteType.VOTE_TYPE_BAN then
					table.insert( restrictedItems, vote )
				end
			end
		end
	end
	local items, f152_local1 = CoD.CACUtility.GetAllItems( true, true )
	for iterIndex, f152_local4 in pairs( items ) do
		if Engine.GetItemRestrictionState( f152_local4.index ) == Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_RESTRICTED then
			table.insert( restrictedItems, {
				globalVoteIndex = -1,
				itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM,
				itemIndex = f152_local4.index,
				itemGroup = -1,
				attachmentIndex = -1,
				voteType = Enum.VoteType.VOTE_TYPE_BAN
			} )
		end
	end
	for iterIndex, f152_local4 in pairs( f152_local1 ) do
		if Engine.IsAttachmentRestrictedForAnyWeapon( f152_local4.index ) == true then
			table.insert( restrictedItems, {
				globalVoteIndex = -1,
				itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT,
				itemIndex = f152_local4.index,
				itemGroup = -1,
				attachmentIndex = -1,
				voteType = Enum.VoteType.VOTE_TYPE_BAN
			} )
		end
	end
	return restrictedItems
end

CoD.CACUtility.AnyCACItemsBanned = function ()
	local bannedItems = CoD.CACUtility.GetAllRestrictedItems()
	for voteIndex, vote in ipairs( bannedItems ) do
		if vote.voteType == Enum.VoteType.VOTE_TYPE_BAN then
			if vote.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
				local itemInfo = Engine.GetUnlockableInfoByIndex( vote.itemIndex )
				if not LuaUtils.StartsWith( itemInfo.loadoutSlot, "hero" ) and not LuaUtils.StartsWith( itemInfo.loadoutSlot, "killstreak" ) and itemInfo.loadoutSlot ~= "specialgadget" then
					return true
				end
			end
			if vote.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
				return true
			elseif vote.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
				return true
			elseif vote.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
				return true
			end
		end
	end
	return false
end

CoD.CACUtility.AnyStreaksBanned = function ()
	local bannedItems = CoD.CACUtility.GetAllRestrictedItems()
	for voteIndex, vote in ipairs( bannedItems ) do
		if vote.voteType == Enum.VoteType.VOTE_TYPE_BAN and vote.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
			local itemInfo = Engine.GetUnlockableInfoByIndex( vote.itemIndex )
			if LUI.startswith( itemInfo.loadoutSlot, "killstreak" ) then
				return true
			end
		end
	end
	return false
end

CoD.CACUtility.AnySpecialistBanned = function ()
	local items, attachments = CoD.CACUtility.GetAllItems( false, true )
	for iterIndex, item in pairs( items ) do
		if LuaUtils.StartsWith( item.loadoutSlot, "hero" ) and Engine.IsItemIndexRestricted( item.index, false ) then
			return true
		end
	end
	return false
end

CoD.CACUtility.EquippedSpecialistBanned = function ( controller )
	local loadout = CoD.CACUtility.GetFullLoadout( controller )
	if loadout.heroItem then
		return Engine.IsItemIndexRestricted( loadout.heroItem, false )
	else
		return false
	end
end

CoD.CACUtility.ItemSlotBannedByBonuscard = function ( slotName, itemIndex )
	if not slotName then
		return false
	elseif not itemIndex or itemIndex <= 0 then
		return false
	end
	local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local wildcardIndex = nil
	local primaryGunfighterCardsRequired = 0
	local f157_local0 = {}
	local f157_local1 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.primary_gunfighter, mode )
	local f157_local2 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.primary_gunfighter_2, mode )
	local f157_local3 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.primary_gunfighter_3, mode )
	local primaryGunfighterCards = f157_local1
	if slotName == CoD.CACUtility.loadoutSlotNames.secondaryWeapon then
		local itemInfo = Engine.GetUnlockableInfoByIndex( itemIndex, mode )
		if itemInfo.loadoutSlot == CoD.CACUtility.loadoutSlotNames.primaryWeapon then
			wildcardIndex = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.overkill, mode )
		end
	elseif slotName == CoD.CACUtility.loadoutSlotNames.primaryAttachment4 then
		primaryGunfighterCardsRequired = 1
	elseif slotName == CoD.CACUtility.loadoutSlotNames.primaryAttachment5 then
		primaryGunfighterCardsRequired = 2
	elseif slotName == CoD.CACUtility.loadoutSlotNames.primaryAttachment6 then
		primaryGunfighterCardsRequired = 3
	elseif slotName == CoD.CACUtility.loadoutSlotNames.secondaryAttachment1 or slotName == CoD.CACUtility.loadoutSlotNames.secondaryAttachment2 or slotName == CoD.CACUtility.loadoutSlotNames.secondaryAttachment3 or slotName == CoD.CACUtility.loadoutSlotNames.secondaryAttachment4 or slotName == CoD.CACUtility.loadoutSlotNames.secondaryAttachment5 or slotName == CoD.CACUtility.loadoutSlotNames.secondaryAttachment6 then
		local itemInfo = Engine.GetUnlockableInfoByIndex( itemIndex, mode )
		if itemInfo.loadoutSlot == CoD.CACUtility.loadoutSlotNames.primaryWeapon then
			wildcardIndex = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.overkill, mode )
		elseif slotName ~= CoD.CACUtility.loadoutSlotNames.secondaryAttachment1 and slotName ~= CoD.CACUtility.loadoutSlotNames.secondaryAttachment2 then
			wildcardIndex = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.secondary_gunfighter, mode )
		end
	elseif slotName == CoD.CACUtility.loadoutSlotNames.specialty4 then
		wildcardIndex = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.perk_1_greed, mode )
	elseif slotName == CoD.CACUtility.loadoutSlotNames.specialty5 then
		wildcardIndex = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.perk_2_greed, mode )
	elseif slotName == CoD.CACUtility.loadoutSlotNames.specialty6 then
		wildcardIndex = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.perk_3_greed, mode )
	elseif slotName == CoD.CACUtility.loadoutSlotNames.primaryGadgetAttachment1 then
		wildcardIndex = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.danger_close, mode )
	elseif slotName == CoD.CACUtility.loadoutSlotNames.primaryGadget then
		local itemInfo = Engine.GetUnlockableInfoByIndex( itemIndex, mode )
		if itemInfo.loadoutSlot == CoD.CACUtility.loadoutSlotNames.secondaryGadget then
			wildcardIndex = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.two_tacticals, mode )
		end
	end
	if 0 < primaryGunfighterCardsRequired then
		local primaryGunfighterCardsAllowed = 3
		for i = 1, #primaryGunfighterCards, 1 do
			if Engine.IsItemIndexRestricted( primaryGunfighterCards[i], false ) then
				primaryGunfighterCardsAllowed = primaryGunfighterCardsAllowed - 1
			end
		end
		return primaryGunfighterCardsAllowed < primaryGunfighterCardsRequired
	elseif wildcardIndex and Engine.IsItemIndexRestricted( wildcardIndex, false ) then
		return true
	end
	return false
end

CoD.CACUtility.GetItemInfoFromElementModel = function ( controller, elementModel )
	if elementModel then
		local properties = {}
		local itemTypeModel = Engine.GetModel( elementModel, "itemType" )
		if itemTypeModel then
			properties.itemType = Engine.GetModelValue( itemTypeModel )
			local itemIndexModel = Engine.GetModel( elementModel, "itemIndex" )
			if itemIndexModel then
				properties.itemIndex = Engine.GetModelValue( itemIndexModel )
			end
			local weaponIndexModel = Engine.GetModel( elementModel, "weaponIndex" )
			if weaponIndexModel then
				local weaponIndex = Engine.GetModelValue( weaponIndexModel )
				if weaponIndex > 0 then
					properties.itemIndex = weaponIndex
				end
			end
			local attachmentIndexModel = Engine.GetModel( elementModel, "attachmentIndex" )
			if attachmentIndexModel then
				properties.attachmentIndex = Engine.GetModelValue( attachmentIndexModel )
			end
			local itemGroupModel = Engine.GetModel( elementModel, "itemGroup" )
			if itemGroupModel then
				properties.itemGroup = Engine.GetModelValue( itemGroupModel )
			end
			local weaponSlotModel = Engine.GetModel( elementModel, "weaponSlot" )
			if weaponSlotModel then
				properties.weaponSlot = Engine.GetModelValue( weaponSlotModel )
			end
			local loadoutSlotModel = Engine.GetModel( elementModel, "loadoutSlot" )
			if loadoutSlotModel then
				properties.loadoutSlot = Engine.GetModelValue( loadoutSlotModel )
			end
			local restrictionStateModel = Engine.GetModel( elementModel, "restrictionState" )
			if restrictionStateModel then
				properties.restrictionState = Engine.GetModelValue( restrictionStateModel )
			end
			return properties
		end
	end
end

CoD.CACUtility.ResetCPCustomClasses = function ( controller )
	if CoD.isCampaign then
		local controllerModel = Engine.GetModelForController( controller )
		local preparedModel = Engine.GetModel( Engine.GetModelForController( controller ), "CustomClassList.prepared" )
		if preparedModel then
			Engine.UnsubscribeAndFreeModel( preparedModel )
		end
		local customClassListModel = Engine.GetModel( controllerModel, "CustomClassList" )
		if customClassListModel then
			for classIndex = 1, 6, 1 do
				local classModel = Engine.GetModel( customClassListModel, "class" .. classIndex )
				if classModel ~= nil then
					Engine.UnsubscribeAndFreeModel( classModel )
				end
			end
		end
	end
end

CoD.CACUtility.GetItemVotedBy = function ( itemInfo )
	local session = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	local clients = session.sessionClients
	local restrictedItems = {}
	for index, client in ipairs( clients ) do
		if client.voteCount > 0 then
			for voteIndex, vote in ipairs( client.votes ) do
				if vote.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM and itemInfo.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
					if vote.itemIndex == itemInfo.itemIndex then
						return client.gamertag
					end
				end
				if vote.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT and itemInfo.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
					if vote.attachmentIndex == itemInfo.attachmentIndex then
						return client.gamertag
					end
				end
				if vote.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT and itemInfo.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
					if vote.itemIndex == itemInfo.itemIndex and vote.attachmentIndex == itemInfo.attachmentIndex then
						return client.gamertag
					end
				end
				if vote.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP and itemInfo.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP and vote.itemGroup == itemInfo.itemGroup then
					return client.gamertag
				end
			end
		end
	end
	return ""
end

CoD.CACUtility.GetItemInfoFromElement = function ( controller, element )
	local elementModel = element:getModel()
	return CoD.CACUtility.GetItemInfoFromElementModel( controller, elementModel )
end

CoD.CACUtility.IsItemConsumable = function ( itemIndex )
	if Engine.CurrentSessionMode() == Enum.eModes.MODE_INVALID then
		return false
	else
		local itemGroup = Engine.GetItemGroup( itemIndex )
		return itemGroup == "bubblegum_consumable"
	end
end

CoD.CACUtility.GetCurrentWeaponXP = function ( controller, itemIndex, mode )
	return Engine.GetDStatForMode( controller, mode, "WeaponStats", itemIndex, "xp" )
end

CoD.CACUtility.GetWeaponPLevel = function ( controller, weaponItemIndex )
	local f164_local0 = Engine.GetPlayerStats( controller )
	return f164_local0.WeaponStats[weaponItemIndex].pLevel:get()
end

CoD.CACUtility.GetWeaponAttributeValuesForVariant = function ( controller, weaponVariantInfo )
	local attributeTable = {
		damage = "0",
		range = "0",
		fireRate = "0",
		accuracy = "0"
	}
	if weaponVariantInfo.weaponIndex <= CoD.CACUtility.EmptyItemIndex then
		return attributeTable
	end
	local weaponItemIndex = weaponVariantInfo.weaponIndex
	local weaponRef = Engine.GetItemRef( weaponItemIndex )
	local unlockablesModel = Engine.GetModel( Engine.GetGlobalModel(), "Unlockables" )
	local weaponAttributesModel = Engine.GetModel( unlockablesModel, weaponItemIndex .. ".weaponAttributes" )
	if LuaUtils.IsTableEmpty( weaponVariantInfo.attachment ) then
		local damageStat = CoD.SafeGetModelValue( weaponAttributesModel, "damage" )
		local rangeStat = CoD.SafeGetModelValue( weaponAttributesModel, "range" )
		local fireRateStat = CoD.SafeGetModelValue( weaponAttributesModel, "fireRate" )
		local accuracyStat = CoD.SafeGetModelValue( weaponAttributesModel, "accuracy" )
		attributeTable.damage = damageStat .. "," .. damageStat
		attributeTable.range = rangeStat .. "," .. rangeStat
		attributeTable.fireRate = fireRateStat .. "," .. fireRateStat
		attributeTable.accuracy = accuracyStat .. "," .. accuracyStat
		return attributeTable
	end
	local damageStat = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_REFERENCE
	local rangeStat = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_WEAPON_NAME
	local damageLookupEnum = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_DAMAGE
	local rangeLookupEnum = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_RANGE
	local fireRateLookupEnum = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_FIRE_RATE
	local accuracyLookupEnum = Enum.WeaponAttributesColumn.WEAPONATTRIBUTES_ACCURACY
	local attachmentAttributes = {
		damage = 0,
		range = 0,
		fireRate = 0,
		accuracy = 0
	}
	for _, attachmentTableIndex in ipairs( weaponVariantInfo.attachment ) do
		if attachmentTableIndex > CoD.CACUtility.EmptyItemIndex then
			local attachmentRef = Engine.GetAttachmentRefByIndex( attachmentTableIndex )
			local damageStat = Engine.TableLookup( CoD.weaponAttributes, damageLookupEnum, damageStat, attachmentRef, rangeStat, weaponRef )
			local rangeStat = Engine.TableLookup( CoD.weaponAttributes, rangeLookupEnum, damageStat, attachmentRef, rangeStat, weaponRef )
			local fireRateStat = Engine.TableLookup( CoD.weaponAttributes, fireRateLookupEnum, damageStat, attachmentRef, rangeStat, weaponRef )
			local accuracyStat = Engine.TableLookup( CoD.weaponAttributes, accuracyLookupEnum, damageStat, attachmentRef, rangeStat, weaponRef )
			local f165_local3 = attachmentAttributes.damage
			local f165_local4
			if damageStat == "" then
				f165_local4 = 0
				if not f165_local4 then
				
				else
					attachmentAttributes.damage = f165_local3 + f165_local4
					f165_local3 = attachmentAttributes.range
					if rangeStat == "" then
						f165_local4 = 0
						if not f165_local4 then
						
						else
							attachmentAttributes.range = f165_local3 + f165_local4
							f165_local3 = attachmentAttributes.fireRate
							if fireRateStat == "" then
								f165_local4 = 0
								if not f165_local4 then
								
								else
									attachmentAttributes.fireRate = f165_local3 + f165_local4
									f165_local3 = attachmentAttributes.accuracy
									if accuracyStat == "" then
										f165_local4 = 0
										if not f165_local4 then
										
										else
											attachmentAttributes.accuracy = f165_local3 + f165_local4
											local getWeaponAttributeValues = function ( attributeName, attributeLookupEnum )
												local weaponAttributeValue = Engine.GetModelValue( Engine.GetModel( weaponAttributesModel, attributeName ) )
												local attachmentAttributeValue = Engine.TableLookup( CoD.weaponAttributes, attributeLookupEnum, damageStat, attachmentRef, rangeStat, weaponRef )
												if weaponAttributeValue == "" then
													weaponAttributeValue = 0
												end
												if attachmentAttributeValue == "" then
													attachmentAttributeValue = 0
												end
												return weaponAttributeValue .. "," .. weaponAttributeValue + attachmentAttributes[attributeName]
											end
											
											attributeTable.damage = getWeaponAttributeValues( "damage", damageLookupEnum )
											attributeTable.range = getWeaponAttributeValues( "range", rangeLookupEnum )
											attributeTable.fireRate = getWeaponAttributeValues( "fireRate", fireRateLookupEnum )
											attributeTable.accuracy = getWeaponAttributeValues( "accuracy", accuracyLookupEnum )
										end
									end
									f165_local4 = accuracyStat
								end
							end
							f165_local4 = fireRateStat
						end
					end
					f165_local4 = rangeStat
				end
			end
			f165_local4 = damageStat
		end
	end
	return attributeTable
end

CoD.CACUtility.GetExtraSlotCODPointCost = function ()
	if not AreCodPointsEnabled( 0 ) then
		return 0
	else
		return CoD.CACUtility.EXTRA_SLOTS_COD_POINTS_COST
	end
end

CoD.CACUtility.ChangeClassMenuName = "ChooseClass_InGame"
CoD.CACUtility.PositionDraftMenuName = "PositionDraft"
CoD.CACUtility.UnlockablesTable = nil
CoD.CACUtility.WeaponListSessionMode = nil
CoD.CACUtility.GenericCACSelectionPreLoadFunc = function ( self, controller, weaponCategory, itemSlot )
	self:setModel( CoD.perController[controller].classModel )
	if not weaponCategory then
		weaponCategory = CoD.perController[controller].weaponCategory
	end
	if weaponCategory ~= "" then
		DataSources.Unlockables.setCurrentFilterItem( weaponCategory )
	end
	self.restoreState = function ()
		local filterCategory = DataSources.Unlockables.getCurrentFilterItem()
		local unlockableItems = self.selectionList.dataSource[filterCategory]
		itemSlot = itemSlot or filterCategory
		local selectedItemIndex = 0
		if not CoD.PrestigeUtility.isInPermanentUnlockMenu then
			selectedItemIndex = Engine.GetModelValue( self:getModel( controller, itemSlot .. ".itemIndex" ) )
		end
		local cacSpecficModelFocusTable = CoD.perController[controller].CACSpecficModelValueFocusTable
		local selectWidget = nil
		if cacSpecficModelFocusTable then
			selectWidget = self.selectionList:findItem( cacSpecficModelFocusTable, nil, false, nil )
		else
			selectWidget = self.selectionList:findItem( {
				itemIndex = selectedItemIndex
			}, nil, false, nil )
		end
		local gainFocusEv = {
			name = "gain_focus",
			controller = controller
		}
		if selectWidget then
			gainFocusEv.selectIndex = selectWidget.gridInfoTable.zeroBasedIndex
		end
		self.selectionList:processEvent( gainFocusEv )
		return true
	end
	
end

CoD.CACUtility.UpdateUnlockableTableBMItems = function ( controller, unlockablesTable )
	local modifiedEntries = {}
	for loadoutSlot, loadoutItems in pairs( unlockablesTable ) do
		local f170_local3 = false
		for _, model in ipairs( loadoutItems ) do
			if modifiedEntries[model] == nil then
				modifiedEntries[model] = false
				if CoD.SafeGetModelValue( model, "isBMItem" ) then
					local itemIndex = CoD.SafeGetModelValue( model, "itemIndex" )
					local classified = false
					if itemIndex then
						classified = CoD.BlackMarketUtility.IsItemLocked( controller, Engine.GetItemRef( itemIndex ) )
					end
					local classifiedModel = Engine.CreateModel( model, "isBMClassified" )
					if Engine.GetModelValue( classifiedModel ) ~= classified then
						modifiedEntries[model] = true
						Engine.SetModelValue( classifiedModel, classified )
						local nameModel = Engine.CreateModel( model, "name" )
						local descriptionModel = Engine.CreateModel( model, "description" )
						if classified then
							Engine.SetModelValue( nameModel, CoD.BlackMarketUtility.ClassifiedName( false ) )
							Engine.SetModelValue( descriptionModel, "" )
						else
							Engine.SetModelValue( nameModel, Engine.GetItemName( itemIndex ) )
							Engine.SetModelValue( descriptionModel, Engine.GetItemDesc( itemIndex ) )
						end
						f170_local3 = true
					end
				end
			end
			if modifiedEntries[model] then
				f170_local3 = true
			end
		end
		if f170_local3 then
			table.sort( loadoutItems, CoD.UnlockablesDataSourceComparisonFunction )
		end
	end
end

CoD.CACUtility.GetCraftWeaponListTable = function ( controller, filter )
	local unlockablesTable = CoD.CACUtility.GetUnlockablesTable( controller, filter, Enum.eModes.MODE_MULTIPLAYER )
	CoD.CACUtility.UpdateUnlockableTableBMItems( controller, unlockablesTable )
	return unlockablesTable
end

CoD.CACUtility.GetUnlockablesTable = function ( controller, filter, mode )
	local addImagesToModel = function ( itemInfoModel )
		if itemInfoModel then
			local groupModel = Engine.GetModel( itemInfoModel, "group" )
			local imageModel = Engine.GetModel( itemInfoModel, "image" )
			local loadoutSlotModel = Engine.GetModel( itemInfoModel, "loadoutSlot" )
			if groupModel and imageModel and loadoutSlotModel then
				local imageModelValue = Engine.GetModelValue( imageModel )
				if imageModelValue and imageModelValue ~= CoD.CACUtility.DefaultClassItemImage then
					local postfixText = "_big"
					local groupName = Engine.GetModelValue( groupModel )
					if groupName == "weapon_grenade" then
						postfixText = "_256"
					elseif groupName == "specialty" then
						postfixText = ""
					end
					Engine.SetModelValue( Engine.CreateModel( itemInfoModel, "image_big" ), imageModelValue .. postfixText )
					local loadoutName = Engine.GetModelValue( loadoutSlotModel )
					if loadoutName then
						local postfixText = ""
						if loadoutName == "primary" or loadoutName == "secondary" then
							postfixText = ""
						end
						Engine.SetModelValue( Engine.CreateModel( itemInfoModel, "image" ), imageModelValue .. postfixText )
					end
				end
			end
		end
	end
	
	local dataSource = {}
	for itemIndex = 0, 255, 1 do
		local itemInfoModel = nil
		local itemRef = Engine.GetItemRef( itemIndex, Enum.eModes.MODE_MULTIPLAYER )
		local isBlackMarketItem = CoD.BlackMarketUtility.IsBlackMarketItem( itemRef )
		if not CoD.isCampaign or CoD.isFrontend or not isBlackMarketItem then
			if mode ~= nil then
				CoD.CACUtility.WeaponListSessionMode = mode
				itemInfoModel = Engine.GetUnlockableInfoModelByIndex( itemIndex, "CraftWeaponList." .. itemIndex, mode )
			else
				local currentSessionMode = CoD.PrestigeUtility.GetPermanentUnlockMode()
				CoD.CACUtility.WeaponListSessionMode = currentSessionMode
				itemInfoModel = Engine.GetUnlockableInfoModelByIndex( itemIndex, "Unlockables." .. itemIndex, currentSessionMode )
			end
		end
		local dlcIndex = CoD.SafeGetModelValue( itemInfoModel, "dlcIndex" )
		local showItem = true
		if CoD.isZombie then
			local dlcID = CoD.CACUtility.GetDLCIdForBubbleGum( itemIndex )
			if CoD.BaseUtility.IsHiddenDLC( CoD.ProductBitFromId[dlcID] ) then
				showItem = false
			end
		end
		if showItem and itemInfoModel and itemInfoModel.isBMItem:get() and isBlackMarketItem and CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( itemRef ) then
			showItem = false
		end
		if showItem then
			addImagesToModel( itemInfoModel )
			if itemInfoModel and 0 <= Engine.GetModelValue( Engine.GetModel( itemInfoModel, "allocation" ) ) then
				if not filter or filter( itemInfoModel ) then
					if not dataSource.filterList then
						dataSource.filterList = {}
					end
					table.insert( dataSource.filterList, itemInfoModel )
				end
				local typeGroup = Engine.GetModelValue( Engine.GetModel( itemInfoModel, "group" ) )
				if typeGroup == "weapon_knuckles" or typeGroup == "weapon_wrench" then
					typeGroup = "weapon_knife"
				end
				if typeGroup then
					if not dataSource[typeGroup] then
						dataSource[typeGroup] = {}
					end
					table.insert( dataSource[typeGroup], itemInfoModel )
				end
				local loadoutSlot = Engine.GetModelValue( Engine.GetModel( itemInfoModel, "loadoutSlot" ) )
				if loadoutSlot then
					if not dataSource[loadoutSlot] then
						dataSource[loadoutSlot] = {}
					end
					table.insert( dataSource[loadoutSlot], itemInfoModel )
				end
				Engine.SetModelValue( Engine.CreateModel( itemInfoModel, "itemType" ), Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM )
			end
		end
	end
	for key, unlockableList in pairs( dataSource ) do
		table.sort( unlockableList, CoD.UnlockablesDataSourceComparisonFunction )
	end
	return dataSource
end

CoD.CACUtility.GetEmblemColorList = function ( controller )
	local emblemColorList = {}
	local emblemColorListModel = Engine.CreateModel( Engine.GetModelForController( controller ), "Emblem.EmblemColorList" )
	local totalRows = Enum.CustomizationColorSwatch.CUSTOMIZATION_COLOR_SWATCH_ROWS
	local totalColumns = Enum.CustomizationColorSwatch.CUSTOMIZATION_COLOR_SWATCH_COLUMNS
	local totalColors = totalRows * totalColumns
	for index = 0, totalColors - 1, 1 do
		local row = index / totalColumns
		local column = index % totalColumns
		local red, green, blue = Engine.GetEmblemSwatchColor( row, column )
		local colorModel = Engine.CreateModel( emblemColorListModel, "color_" .. index )
		Engine.SetModelValue( Engine.CreateModel( colorModel, "color" ), string.format( "%d %d %d", red, green, blue ) )
		table.insert( emblemColorList, colorModel )
	end
	return emblemColorList
end

CoD.CACUtility.GunsmithWeaponOptionsTable = nil
CoD.CACUtility.GetGunsmithWeaponOptionsTable = function ( controller, list, filter )
	local weaponOptions = {}
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	CoD.CACUtility.GetWeaponOptionsTableForCategory( controller, weaponOptions, Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO, weaponIndex, 0, false )
	return weaponOptions
end

CoD.CACUtility.WeaponOptionsTable = nil
CoD.CACUtility.GetWeaponOptionsTableForCategory = function ( controller, weaponOptions, eWeaponOptionGroup, weaponItemIndex, attachmentIndex, addNone )
	local isSpecialMPCamo = function ( camoRef )
		local f177_local0
		if camoRef ~= "camo_gold" and camoRef ~= "camo_diamond" and camoRef ~= "camo_darkmatter" then
			f177_local0 = false
		else
			f177_local0 = true
		end
		return f177_local0
	end
	
	if CoD.CACUtility.EmptyItemIndex < weaponItemIndex then
		local weaponRef = Engine.GetItemRef( weaponItemIndex )
		for itemIndex = 0, Engine.GetNumWeaponOptionsForGroup( eWeaponOptionGroup ), 1 do
			local weaponOptionGroupIndex = Engine.GetWeaponOptionGroupIndex( itemIndex, eWeaponOptionGroup )
			local hideOption = false
			local camoRef = nil
			local isChallengeClassified = false
			if eWeaponOptionGroup == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO then
				camoRef = Engine.TableLookup( CoD.attachmentTable, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_REFERENCE, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_INDEX, weaponOptionGroupIndex, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_ATTACHPOINT, "camo" )
				local camoMode = Engine.TableLookup( CoD.attachmentTable, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_WEAPONOPTION_FILTER, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_INDEX, weaponOptionGroupIndex, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_ATTACHPOINT, "camo" )
				if IsProgressionEnabled( controller ) and camoMode == "mp" then
					if camoRef == "camo_darkmatter" then
						local darkMatterCamoTable = CoD.getStatsMilestoneTable( 1, Enum.eModes.MODE_MULTIPLAYER )
						local challengeRows = Engine.TableFindRows( darkMatterCamoTable, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_UNLOCKITEM, "camo_darkmatter" )
						hideOption = true
						if challengeRows then
							for _, row in ipairs( challengeRows ) do
								local challengeIndex = tonumber( Engine.TableLookupGetColumnValueForRow( darkMatterCamoTable, row, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_INDEX ) )
								if not Engine.GetChallengeCompleteForChallengeIndex( Enum.eModes.MODE_MULTIPLAYER, controller, challengeIndex ) then
									isChallengeClassified = true
								else
									hideOption = false
								end
							end
						end
						if not hideOption and CoD.BlackMarketUtility.IsBlackMarketItem( weaponRef ) then
							local weaponCamoTable = CoD.getStatsMilestoneTable( 3, Enum.eModes.MODE_MULTIPLAYER )
							local challengeIndex = tonumber( Engine.TableLookup( weaponCamoTable, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_INDEX, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_UNLOCKITEM, "camo_diamond", Enum.milestoneTableColumns_t.MILESTONE_COLUMN_INCLUDE, weaponRef ) )
							if not challengeIndex or not Engine.GetChallengeCompleteForChallengeIndex( Enum.eModes.MODE_MULTIPLAYER, controller, challengeIndex ) then
								challengeIndex = tonumber( Engine.TableLookup( CoD.getStatsMilestoneTable( 5, Enum.eModes.MODE_MULTIPLAYER ), Enum.milestoneTableColumns_t.MILESTONE_COLUMN_INDEX, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_UNLOCKITEM, "camo_diamond", Enum.milestoneTableColumns_t.MILESTONE_COLUMN_INCLUDE, weaponRef ) )
								if not challengeIndex or not Engine.GetChallengeCompleteForChallengeIndex( Enum.eModes.MODE_MULTIPLAYER, controller, challengeIndex ) then
									hideOption = true
								end
							end
						end
					end
				else
					hideOption = isSpecialMPCamo( camoRef )
				end
			end
			if not hideOption then
				local optionInfoModel = Engine.GetWeaponOptionsInfoModelByIndex( controller, weaponOptionGroupIndex, "WeaponOptions", weaponItemIndex, attachmentIndex )
				if optionInfoModel and eWeaponOptionGroup == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO and isSpecialMPCamo( camoRef ) then
					local unlockProgressStringModel = Engine.GetModel( optionInfoModel, "unlockProgressAndTarget" )
					if unlockProgressStringModel then
						Engine.SetModelValue( unlockProgressStringModel, "" )
					end
				end
				if optionInfoModel and Engine.GetModelValue( Engine.GetModel( optionInfoModel, "allocation" ) ) >= 0 then
					local weaponOptionName = Engine.GetModelValue( Engine.GetModel( optionInfoModel, "weaponOptionTypeName" ) )
					local subIndex = Engine.GetModelValue( Engine.GetModel( optionInfoModel, "weaponOptionSubIndex" ) )
					local rarityTypeModel = Engine.CreateModel( optionInfoModel, "rarityType" )
					local rarityModel = Engine.CreateModel( rarityTypeModel, "rarity" )
					local rarityisBMClassifiedModel = Engine.CreateModel( rarityTypeModel, "isBMClassified" )
					local rarityDuplicateCountModel = Engine.CreateModel( rarityTypeModel, "duplicateCount" )
					if weaponOptionName then
						if not weaponOptions[weaponOptionName] then
							weaponOptions[weaponOptionName] = {}
						end
						table.insert( weaponOptions[weaponOptionName], optionInfoModel )
						Engine.SetModelValue( Engine.CreateModel( optionInfoModel, "isChallengeClassified" ), isChallengeClassified )
						if subIndex == 0 and addNone and addNone == true then
							for row = Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_FIRST, Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_COUNT - 1, 1 do
								local weaponOptionAndFilter = weaponOptionName .. "_" .. CoD.WeaponOptionFilterToString( row )
								if not weaponOptions[weaponOptionAndFilter] then
									weaponOptions[weaponOptionAndFilter] = {}
								end
								Engine.SetModelValue( Engine.CreateModel( optionInfoModel, "isBMClassified" ), false )
								table.insert( weaponOptions[weaponOptionAndFilter], optionInfoModel )
							end
						end
						local hasMaterial = true
						if weaponOptionName == "reticle" then
							local mode = Engine.CurrentSessionMode()
							if mode == Enum.eModes.MODE_COUNT then
								mode = Enum.eModes.MODE_MULTIPLAYER
							end
							local ref = Engine.GetAttachmentRefByIndex( attachmentIndex )
							local material = Engine.TableLookup( "gamedata/weapons/common/weaponOptions.csv", 3, 2, ref, 0, subIndex )
							hasMaterial = material ~= ""
						end
						local filterMode = Engine.GetModelValue( Engine.GetModel( optionInfoModel, "filterMode" ) )
						if hasMaterial and filterMode then
							local blackMarketItem = nil
							if CoD.WeaponOptionFilterStringToEnum( filterMode ) == Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_BM then
								local refName = Engine.GetModelValue( Engine.GetModel( optionInfoModel, "ref" ) )
								blackMarketItem = refName .. ";" .. weaponRef
								if weaponOptionName == "reticle" then
									if CoD.perController[controller].customReticleAttachment then
										blackMarketItem = CoD.perController[controller].customReticleAttachment .. "_" .. Engine.GetModelValue( Engine.GetModel( optionInfoModel, "weaponOptionSubIndex" ) )
									elseif CoD.perController[controller].editingWeaponBuildKits then
										local reticle = CoD.SafeGetModelValue( Engine.GetModelForController( controller ), "WeaponBuildKitVariant.attachment1" )
										if reticle then
											blackMarketItem = Engine.GetAttachmentRefByIndex( reticle ) .. "_" .. Engine.GetModelValue( Engine.GetModel( optionInfoModel, "weaponOptionSubIndex" ) )
										end
									elseif CoD.perController[controller].gunsmithAttachmentModel then
										local gunsmithAttachment = Engine.GetModelValue( CoD.perController[controller].gunsmithAttachmentModel )
										blackMarketItem = Engine.GetAttachmentRefByIndex( gunsmithAttachment ) .. "_" .. Engine.GetModelValue( Engine.GetModel( optionInfoModel, "weaponOptionSubIndex" ) )
									end
								end
								local isBMClassified = CoD.BlackMarketUtility.IsItemLocked( controller, blackMarketItem )
								if isBMClassified then
									local nameModel = Engine.GetModel( optionInfoModel, "name" )
									Engine.SetModelValue( nameModel, CoD.BlackMarketUtility.ClassifiedName() )
								end
								Engine.SetModelValue( Engine.CreateModel( optionInfoModel, "isBMClassified" ), isBMClassified )
								local rarityString = CoD.BlackMarketUtility.GetRarityForLootItemFromName( blackMarketItem )
								local duplicateCount = CoD.BlackMarketUtility.GetItemQuantity( controller, blackMarketItem )
								Engine.SetModelValue( rarityModel, rarityString )
								Engine.SetModelValue( rarityisBMClassifiedModel, isBMClassified )
								Engine.SetModelValue( rarityDuplicateCountModel, duplicateCount )
							else
								Engine.SetModelValue( Engine.CreateModel( optionInfoModel, "isBMClassified" ), false )
								Engine.SetModelValue( rarityDuplicateCountModel, 0 )
							end
							local weaponOptionAndFilter = weaponOptionName .. "_" .. filterMode
							if not weaponOptions[weaponOptionAndFilter] then
								weaponOptions[weaponOptionAndFilter] = {}
							end
							if not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( blackMarketItem ) and (not (weaponOptionName ~= "reticle" or Engine.IsWeaponOptionLockedEntitlement( controller, attachmentIndex, weaponOptionGroupIndex )) or not Engine.IsWeaponOptionLockedEntitlement( controller, CoD.CACUtility.ATTACHMENT_NONE, weaponOptionGroupIndex )) then
								table.insert( weaponOptions[weaponOptionAndFilter], optionInfoModel )
							end
						end
					end
				end
			end
		end
	end
	local getWeaponFilterTableFromWeaponOptions = function ( weaponOptions, filterName )
		for filterCategoryName, filterTable in pairs( weaponOptions ) do
			if LUI.endswith( filterCategoryName, filterName ) then
				return filterTable
			end
		end
	end
	
	local filterName = CoD.WeaponOptionFilterToString( Enum.WeaponOptionFilter.WEAPONOPTION_FILTER_BM )
	local lootTable = getWeaponFilterTableFromWeaponOptions( weaponOptions, filterName )
	if lootTable then
		table.sort( lootTable, CoD.BlackMarketUtility.SortUnlocksModelWOSubIndex )
	end
end

CoD.CACUtility.GetWeaponOptionsTable = function ( controller, list, filter )
	local weaponOptions = {}
	local classModel = CoD.perController[controller].classModel
	local loadoutSlotName = CoD.perController[controller].weaponCategory
	local weaponIndexModel = Engine.GetModel( classModel, loadoutSlotName .. ".itemIndex" )
	local attachmentIndex = 0
	if weaponIndexModel then
		local weaponItemIndex = Engine.GetModelValue( weaponIndexModel )
		CoD.CACUtility.GetWeaponOptionsTableForCategory( controller, weaponOptions, Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO, weaponItemIndex, attachmentIndex, true )
	end
	local weaponOptionsModel = Engine.GetModel( Engine.GetModelForController( controller ), "WeaponOptions" )
	local paintJobModel = Engine.CreateModel( weaponOptionsModel, "paintjob" )
	if not weaponOptions.paintjob then
		weaponOptions.paintjob = {}
	end
	local addPaintshopSelections = function ( model, image, index, name, ref, categoryName, paintjobIndex, paintjobSlot )
		local paintJobSelectionModel = Engine.CreateModel( model, index )
		Engine.SetModelValue( Engine.CreateModel( paintJobSelectionModel, "image" ), image )
		Engine.SetModelValue( Engine.CreateModel( paintJobSelectionModel, "itemIndex" ), index )
		Engine.SetModelValue( Engine.CreateModel( paintJobSelectionModel, "name" ), name )
		Engine.SetModelValue( Engine.CreateModel( paintJobSelectionModel, "ref" ), ref )
		Engine.SetModelValue( Engine.CreateModel( paintJobSelectionModel, "weaponOptionTypeName" ), categoryName )
		Engine.SetModelValue( Engine.CreateModel( paintJobSelectionModel, "weaponOptionType" ), Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_PAINTJOB )
		Engine.SetModelValue( Engine.CreateModel( paintJobSelectionModel, "weaponOptionSubIndex" ), index )
		Engine.SetModelValue( Engine.CreateModel( paintJobSelectionModel, "paintjobIndex" ), paintjobIndex )
		Engine.SetModelValue( Engine.CreateModel( paintJobSelectionModel, "paintjobSlot" ), paintjobSlot )
		Engine.SetModelValue( Engine.CreateModel( paintJobSelectionModel, "paintjobSlotAndIndex" ), paintjobSlot .. " " .. paintjobIndex )
		local rarityTypeModel = Engine.CreateModel( paintJobSelectionModel, "rarityType" )
		LUI.CreateModelAndInitialize( rarityTypeModel, "rarity", "" )
		LUI.CreateModelAndInitialize( paintJobSelectionModel, "unlockSessionMode", Enum.eModes.MODE_INVALID )
		table.insert( weaponOptions[categoryName], paintJobSelectionModel )
	end
	
	if weaponIndexModel then
		local weaponItemIndex = Engine.GetModelValue( weaponIndexModel )
		local paintjobList = CoD.CraftUtility.Paintjobs.GetCACPaintjobList( weaponItemIndex )
		addPaintshopSelections( paintJobModel, "menu_cac_none", 0, "MPUI_NONE", "paintshop_0", "paintjob", Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX, Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
		for index = 1, #paintjobList, 1 do
			addPaintshopSelections( paintJobModel, "blacktransparent", index, paintjobList[index].paintjobName, "paintshop_1", "paintjob", paintjobList[index].paintjobIndex, paintjobList[index].paintjobSlot )
		end
	end
	if AllowWeaponPrestige( controller ) and (loadoutSlotName == "primary" or loadoutSlotName == "secondary") then
		local weaponItemIndex = Engine.CreateModel( weaponOptionsModel, "mpPrestigeAttachments" )
		local paintjobList = CoD.CACUtility[loadoutSlotName .. "WeaponPrestigeSlot"]
		weaponOptions[paintjobList] = {}
		local addMPPrestigeAttachment = function ( index, weaponItemIndex, ref, attachmentIndex )
			local baseModel = Engine.CreateModel( weaponItemIndex, index )
			LUI.CreateModelAndInitialize( baseModel, "ref", ref )
			LUI.CreateModelAndInitialize( baseModel, "name", Engine.GetAttachmentName( weaponItemIndex, attachmentIndex ) )
			local image = "blacktransparent"
			if attachmentIndex ~= CoD.CACUtility.EmptyItemIndex then
				image = Engine.GetAttachmentImage( weaponItemIndex, attachmentIndex )
			end
			local isLocked = false
			local weaponPLevel = 0
			for index, attachmentRef in ipairs( CoD.CACUtility.mpPrestigeAttachments ) do
				if ref == attachmentRef then
					weaponPLevel = index
					isLocked = CoD.CACUtility.GetWeaponPLevel( controller, weaponItemIndex ) < index
					break
				end
			end
			local description = ""
			if isLocked then
				description = Engine.Localize( "MENU_REQUIRES_WEAPON_PRESTIGE", index )
			elseif ref == CoD.CACUtility.mpPrestigeAttachments[1] then
				description = Engine.Localize( "MENU_WEAPON_PRESTIGE_CLAN_TAG", Engine.GetItemName( weaponItemIndex ) )
			elseif ref == CoD.CACUtility.mpPrestigeAttachments[2] then
				description = Engine.Localize( "MENU_WEAPON_PRESTIGE_KILL_COUNTER", Engine.GetItemName( weaponItemIndex ) )
			end
			LUI.CreateModelAndInitialize( baseModel, "image", image )
			LUI.CreateModelAndInitialize( baseModel, "itemIndex", attachmentIndex )
			LUI.CreateModelAndInitialize( baseModel, "weaponOptionTypeName", paintjobList )
			LUI.CreateModelAndInitialize( baseModel, "weaponOptionType", Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_INVALID )
			LUI.CreateModelAndInitialize( baseModel, "weaponOptionSubIndex", attachmentIndex )
			LUI.CreateModelAndInitialize( baseModel, "description", description )
			LUI.CreateModelAndInitialize( baseModel, "allocation", Engine.GetAttachmentAllocationCost( attachmentIndex ) )
			LUI.CreateModelAndInitialize( baseModel, "type", paintjobList )
			LUI.CreateModelAndInitialize( baseModel, "unlockSessionMode", Enum.eModes.MODE_MULTIPLAYER )
			local rarityTypeModel = Engine.CreateModel( baseModel, "rarityType" )
			LUI.CreateModelAndInitialize( rarityTypeModel, "rarity", "" )
			table.insert( weaponOptions[paintjobList], baseModel )
		end
		
		if weaponIndexModel then
			local weaponItemIndex = Engine.GetModelValue( weaponIndexModel )
			addMPPrestigeAttachment( 0, weaponItemIndex, "", CoD.CACUtility.EmptyItemIndex )
			for index, ref in ipairs( CoD.CACUtility.mpPrestigeAttachments ) do
				local attachmentIndex = Engine.GetAttachmentIndexByAttachmentTableIndex( weaponItemIndex, Engine.GetAttachmentIndexByRef( ref ) )
				if attachmentIndex and CoD.CACUtility.EmptyItemIndex < attachmentIndex then
					addMPPrestigeAttachment( index, weaponItemIndex, ref, attachmentIndex )
				end
			end
			if #weaponOptions[paintjobList] < 2 then
				weaponOptions[paintjobList] = {}
			end
		end
	end
	return weaponOptions
end

CoD.CACUtility.OpenCACMenu = function ( self, controller )
	CoD.perController[controller].enableClassOptions = true
	return OpenOverlay( self, "chooseClass", controller )
end

CoD.CACUtility.OpenCACMenuEditClass = function ( self, controller )
	CoD.perController[controller].enableClassOptions = false
	return OpenOverlay( self, "chooseClass", controller )
end

CoD.CACUtility.AddClassItemData = function ( itemTable, itemIndex, count, loadoutSlot )
	if itemIndex ~= nil and itemIndex > 0 then
		local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
		local cost = Engine.GetItemAllocationCost( itemIndex, mode )
		if cost >= 0 then
			local itemInfo = {
				name = Engine.GetItemName( itemIndex, mode ),
				description = Engine.GetItemDesc( itemIndex, mode ),
				ref = Engine.GetItemRef( itemIndex, mode ),
				cost = cost,
				momentumCost = Engine.GetItemMomentumCost( itemIndex, mode ),
				itemIndex = itemIndex,
				count = count,
				loadoutSlot = loadoutSlot
			}
			table.insert( itemTable, itemInfo )
		end
	end
end

CoD.CACUtility.AddClassAttachmentData = function ( itemTable, weaponIndex, attachmentIndex )
	if weaponIndex ~= nil and weaponIndex > 0 and attachmentIndex ~= nil and attachmentIndex > 0 then
		local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
		local cost = Engine.GetAttachmentAllocationCost( weaponIndex, attachmentIndex, mode )
		if cost >= 0 then
			local itemInfo = {
				name = Engine.GetAttachmentNameByIndex( attachmentIndex ),
				description = Engine.GetAttachmentDesc( weaponIndex, attachmentIndex, mode ),
				cost = cost,
				weaponIndex = weaponIndex,
				attachmentIndex = attachmentIndex,
				count = 1
			}
			table.insert( itemTable, itemInfo )
		end
	end
end

CoD.CACUtility.GetAttachments = function ( weaponItemIndex )
	local numAttachments = Engine.GetNumAttachments( weaponItemIndex )
	if numAttachments == nil then
		return nil
	end
	local attachments = {}
	for attachmentIndex = 1, numAttachments - 1, 1 do
		local newAttachment = {
			weaponItemIndex = weaponItemIndex,
			attachmentIndex = attachmentIndex
		}
		table.insert( attachments, newAttachment )
	end
	return attachments
end

CoD.CACUtility.GetClassItem = function ( controller, classNum, slotName )
	local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
	return Engine.GetClassItem( controller, classNum, slotName, mode )
end

CoD.CACUtility.SetClassItem = function ( controller, classNum, slotName, itemIndex, itemCount )
	Engine.SetClassItem( controller, classNum, slotName, itemIndex )
	if itemCount ~= nil then
		Engine.SetClassItem( controller, classNum, slotName .. "count", itemCount )
	end
end

CoD.CACUtility.HowManyInClassSlot = function ( itemIndex, itemTable )
	for index, itemInfo in pairs( itemTable ) do
		if itemInfo.itemIndex == itemIndex then
			if itemInfo.count == nil then
				return 1
			end
			return itemInfo.count
		end
	end
	return 0
end

CoD.CACUtility.SumClassItemCosts = function ( itemSet )
	local sum = 0
	for index, item in pairs( itemSet ) do
		local f190_local3 = 1
		if item.count ~= nil then
			f190_local3 = item.count
		end
		sum = sum + item.cost * f190_local3
	end
	return sum
end

CoD.CACUtility.CACRewardComparisonFunction = function ( a, b )
	local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
	local costA = Engine.GetItemAllocationCost( a, mode )
	local costB = Engine.GetItemAllocationCost( b, mode )
	if costA == costB then
		return Engine.GetItemMomentumCost( a, mode ) < Engine.GetItemMomentumCost( b, mode )
	else
		return costA < costB
	end
end

CoD.CACUtility.PrepareOverCapactiyList = function ( controller )
	local completeItemList = {}
	local categorySpacing = 10
	local itemSpacing = -2
	local classModel = CoD.perController[controller].classModel
	local getItemModels = function ( slotName, slotModel, spacing, shouldDisplayHeader )
		local headerNameValue = ""
		if shouldDisplayHeader then
			local slotModelForName = slotModel
			if LUI.startswith( slotName, "primaryattachment" ) then
				slotModelForName = Engine.GetModel( classModel, "primary" )
			elseif LUI.startswith( slotName, "secondaryattachment" ) then
				slotModelForName = Engine.GetModel( classModel, "secondary" )
			end
			headerNameValue = Engine.GetModelValue( Engine.GetModel( slotModelForName, "headerName" ) )
		end
		local nameValue = Engine.GetModelValue( Engine.GetModel( slotModel, "name" ) )
		local imageValue = Engine.GetModelValue( Engine.GetModel( slotModel, "image" ) )
		local itemRef = Engine.GetModelValue( Engine.GetModel( slotModel, "ref" ) )
		return {
			models = {
				headerName = headerNameValue,
				name = nameValue,
				image = imageValue or "blacktransparent",
				itemSlot = slotName
			},
			properties = {
				itemRef = itemRef,
				spacing = spacing or itemSpacing
			}
		}
	end
	
	local weaponCategory = CoD.perController[controller].weaponCategory
	local overCapacityItemIndex = CoD.perController[controller].overCapacityItemIndex
	local overCapacityRef = ""
	if overCapacityItemIndex then
		overCapacityRef = Engine.GetItemRef( overCapacityItemIndex )
	end
	if classModel then
		for index, slotName in ipairs( CoD.CACUtility.overCapacityLoadoutSlotOrder ) do
			local slotModel = Engine.GetModel( classModel, slotName )
			local spacing = categorySpacing
			local itemListPrevIndex = #completeItemList
			local prevSlotListItem, f192_local3 = nil
			local f192_local4 = true
			if itemListPrevIndex > 0 then
				f192_local3 = completeItemList[itemListPrevIndex].models.itemSlot
			end
			if LUI.startswith( weaponCategory, "primaryattachment" ) and slotName == "primary" then
				
			end
			if LUI.startswith( weaponCategory, "secondaryattachment" ) and slotName == "secondary" then
				
			end
			if LUI.startswith( weaponCategory, "primarygadgetattachment" ) then
				if slotName ~= "primarygadget" then
					if CoD.CACUtility.GetItemReferenceName( slotModel, slotName ) == "bonuscard_danger_close" then
						
					end
				end
			end
			if LUI.startswith( weaponCategory, "secondarygadgetattachment" ) and slotName == "secondarygadget" then
				
			end
			if LUI.startswith( overCapacityRef, "bonuscard_primary_gunfighter" ) then
				if slotName ~= "primary" then
					if LUI.startswith( slotName, "primaryattachment" ) then
						
					end
				end
			end
			if overCapacityRef == "bonuscard_secondary_gunfighter" then
				if slotName ~= "secondary" then
					if LUI.startswith( slotName, "secondaryattachment" ) then
						
					end
				end
			end
			if slotModel then
				local indexModel = Engine.GetModel( slotModel, "itemIndex" )
				if indexModel then
					local itemIndex = Engine.GetModelValue( indexModel )
					local itemName = Engine.GetItemRef( itemIndex )
					if itemIndex > CoD.CACUtility.EmptyItemIndex then
						if LUI.startswith( slotName, "primarygadgetattachment" ) then
							local gadgetIndexModel = Engine.GetModel( classModel, "primarygadget.itemIndex" )
							if gadgetIndexModel then
								local gadgetIndex = Engine.GetModelValue( gadgetIndexModel )
								local customSlotModel = Engine.GetModel( classModel, "primarygadgetattachment1" )
								if f192_local3 and f192_local3 == "primarygadget" then
									completeItemList[itemListPrevIndex].properties.spacing = itemSpacing
									f192_local4 = false
								end
								table.insert( completeItemList, getItemModels( slotName, customSlotModel, categorySpacing, f192_local4 ) )
							end
						end
						if LUI.startswith( slotName, "secondarygadgetattachment" ) then
							local gadgetIndexModel = Engine.GetModel( classModel, "secondarygadget.itemIndex" )
							if gadgetIndexModel then
								local gadgetIndex = Engine.GetModelValue( gadgetIndexModel )
								local customSlotModel = Engine.GetModel( classModel, "secondarygadgetattachment1" )
								if f192_local3 and f192_local3 == "secondarygadget" then
									completeItemList[itemListPrevIndex].properties.spacing = itemSpacing
									f192_local4 = false
								end
								table.insert( completeItemList, getItemModels( slotName, customSlotModel, categorySpacing, f192_local4 ) )
							end
						end
						if weaponCategory == "specialty4" and itemName == "bonuscard_perk_1_greed" then
							
						end
						if weaponCategory == "specialty5" and itemName == "bonuscard_perk_2_greed" then
							
						end
						if weaponCategory == "specialty6" and itemName == "bonuscard_perk_3_greed" then
							
						end
						if (weaponCategory == "primaryattachment4" or weaponCategory == "primaryattachment5" or weaponCategory == "primaryattachment6") and LUI.startswith( itemName, "bonuscard_primary_gunfighter" ) then
							
						end
						if weaponCategory == "secondary" and itemName == "bonuscard_overkill" then
							
						end
						if not LUI.startswith( weaponCategory, "secondaryattachment" ) or itemName ~= "bonuscard_overkill" then
							if weaponCategory == "secondaryattachment3" and itemName == "bonuscard_secondary_gunfighter" then
								
							end
							if weaponCategory == "primarygadget" and itemName == "bonuscard_two_tacticals" then
								
							end
							if weaponCategory == "primarygadgetattachment2" and itemName == "bonuscard_danger_close" then
								
							end
							if LUI.startswith( weaponCategory, "primarygadgetattachment" ) and itemName == "bonuscard_two_tacticals" then
								
							end
							if f192_local3 and (not (not LUI.startswith( slotName, "primaryattachment" ) and not LUI.startswith( slotName, "secondaryattachment" ) and (f192_local3 ~= "specialty1" or slotName ~= "specialty4")) or not (f192_local3 ~= "specialty2" or slotName ~= "specialty5") or not (f192_local3 ~= "specialty3" or slotName ~= "specialty6") or LUI.startswith( f192_local3, "bonuscard" ) and LUI.startswith( slotName, "bonuscard" )) then
								completeItemList[itemListPrevIndex].properties.spacing = itemSpacing
								f192_local4 = false
							end
							table.insert( completeItemList, getItemModels( slotName, slotModel, spacing, f192_local4 ) )
						end
					end
				end
			end
		end
	end
	return completeItemList
end

local OverCapacity_CustomListFns = {
	getSpacerAfterColumn = function ( list, col )
		local dataSourceList = list[list.dataSourceName]
		if dataSourceList[col] then
			local itemProperties = dataSourceList[col].properties
			return itemProperties.spacing
		else
			return -2
		end
	end
}
CoD.CACUtility.RemoveItemFromClassList = function ( controller )
	local weaponSlotName = CoD.perController[controller].weaponCategory
	local itemList = CoD.CACUtility.PrepareOverCapactiyList( controller )
	local attachmentSlotName = nil
	for i = #itemList, 1, -1 do
		local itemSlotName = itemList[i].models.itemSlot
		if weaponSlotName == itemSlotName or LUI.startswith( itemSlotName, weaponSlotName .. "attachment" ) then
			table.remove( itemList, i )
		end
	end
	local i = weaponSlotName == "primary"
	local bonuscardGunfighterForSlot = "bonuscard_primary_gunfighter"
	if not i then
		bonuscardGunfighterForSlot = "bonuscard_secondary_gunfighter"
	end
	for i = #itemList, 1, -1 do
		local itemRefName = itemList[i].properties.itemRef
		if LUI.startswith( itemRefName, bonuscardGunfighterForSlot ) then
			table.remove( itemList, i )
		end
	end
	return itemList
end

DataSources.RemoveItemFromClassList = DataSourceHelpers.ListSetup( "RemoveItemFromClassList", CoD.CACUtility.RemoveItemFromClassList, true, OverCapacity_CustomListFns )
DataSources.OverCapacityList = DataSourceHelpers.ListSetup( "OverCapacityList", CoD.CACUtility.PrepareOverCapactiyList, true, OverCapacity_CustomListFns )
CoD.CACUtility.PrepareWildcardOverCapactiyList = function ( controller )
	local capacityList = {}
	local getItemModels = function ( name, image, slotName, itemIndex )
		return {
			models = {
				name = name,
				image = image or "blacktransparent",
				itemSlot = slotName
			},
			properties = {
				itemIndex = itemIndex
			}
		}
	end
	
	local classModel = CoD.perController[controller].classModel
	local wildcardToEquipRef = CoD.perController[controller].wildcardOverCapacityRefName
	local f196_local0 = CoD.perController[controller].weaponCategory == "primary"
	local bonuscardGunfighterForSlot = "bonuscard_primary_gunfighter"
	if not f196_local0 then
		bonuscardGunfighterForSlot = "bonuscard_secondary_gunfighter"
	end
	for _, slotName in ipairs( CoD.CACUtility.BonuscardSlotNameCACCardList ) do
		local slotModel = Engine.GetModel( classModel, slotName )
		local nameValue = Engine.GetModelValue( Engine.GetModel( slotModel, "name" ) )
		local imageValue = Engine.GetModelValue( Engine.GetModel( slotModel, "image" ) )
		local itemIndex = Engine.GetModelValue( Engine.GetModel( slotModel, "itemIndex" ) )
		local refName = Engine.GetModelValue( Engine.GetModel( slotModel, "ref" ) )
		if refName ~= "" and not LUI.startswith( refName, bonuscardGunfighterForSlot ) then
			table.insert( capacityList, getItemModels( nameValue, imageValue, slotName, itemIndex ) )
		end
	end
	return capacityList
end

DataSources.WildcardOvercapacityList = DataSourceHelpers.ListSetup( "WildcardOvercapacityList", CoD.CACUtility.PrepareWildcardOverCapactiyList, true )
CoD.CACUtility.CreateItemListDataSource = function ( controller, infoTable, weaponVariantInfo )
	local dataSourceName = "WeaponVariantAttachmentList" .. infoTable.properties.index
	DataSources[dataSourceName] = DataSourceHelpers.ListSetup( dataSourceName, function ( controller )
		local attachmentTable = {}
		local weaponIndex = weaponVariantInfo.weaponIndex
		local attachmentCount = 0
		for index, attachmentIndex in ipairs( weaponVariantInfo.attachmentsByIndex ) do
			if attachmentIndex > CoD.CACUtility.EmptyItemIndex then
				attachmentCount = attachmentCount + 1
				table.insert( attachmentTable, {
					models = {
						image = Engine.GetAttachmentImage( weaponIndex, attachmentIndex ) .. "_wv_icon"
					},
					properties = {
						isLocked = Engine.IsItemAttachmentLocked( controller, weaponIndex, attachmentIndex )
					}
				} )
			end
		end
		if CoD.perController[controller].isShowcaseWeaponMenu then
			return attachmentTable
		end
		local weaponCategory = CoD.perController[controller].weaponCategory
		local wildcardGunfighterList = CoD.CACUtility.PrimaryGunfighterWildcards
		local wildcardImage = "cac_mods_primary_gunfighter_wv_icon"
		if weaponCategory == "secondary" then
			wildcardGunfighterList = {
				"bonuscard_secondary_gunfighter"
			}
			wildcardImage = "cac_mods_secondary_gunfighter_wv_icon"
		end
		for i = 1, weaponVariantInfo.wildcardNeededFromVariantCount, 1 do
			local wildcardGunfighterItemIndex = Engine.GetItemIndexFromReference( wildcardGunfighterList[i] )
			local f199_local4 = wildcardGunfighterItemIndex
			local isWildcardLocked = Engine.IsItemLocked( controller, wildcardGunfighterItemIndex )
			local f199_local5 = f199_local4 and isWildcardLocked
			local affectedAttachmentIndex = #attachmentTable - #wildcardGunfighterList + 1
			local affectedAttachment = attachmentTable[affectedAttachmentIndex]
			affectedAttachment.properties.isLocked = affectedAttachment.properties.isLocked or f199_local5
			table.insert( attachmentTable, {
				models = {
					image = wildcardImage
				},
				properties = {
					isLocked = f199_local5
				}
			} )
		end
		return attachmentTable
	end, true )
	return dataSourceName
end

CoD.CACUtility.GetWeaponVariantListModels = function ( controller, weaponVariantInfo )
	local weaponAttributes = CoD.CACUtility.GetWeaponAttributeValuesForVariant( controller, weaponVariantInfo )
	local infoTable = {
		models = {
			index = weaponVariantInfo.index,
			variantIndex = weaponVariantInfo.variantIndex,
			variantName = weaponVariantInfo.variantName,
			variantNameBig = weaponVariantInfo.variantNameBig,
			weaponItemIndex = weaponVariantInfo.weaponIndex,
			cacVariantIndex = weaponVariantInfo.cacVariantIndex,
			hintText = Engine.Localize( "MPUI_VARIANT_CONTAINS_LOCKED_ITEMS_DESC" ),
			weaponAttributes = {
				damage = weaponAttributes.damage,
				range = weaponAttributes.range,
				fireRate = weaponAttributes.fireRate,
				accuracy = weaponAttributes.accuracy
			}
		},
		properties = {
			index = weaponVariantInfo.index,
			weaponVariantInfo = weaponVariantInfo,
			selectIndex = CoD.CACUtility.IsVariantEquippedToClass( CoD.perController[controller].classModel, CoD.perController[controller].weaponCategory, weaponVariantInfo.weaponIndex, weaponVariantInfo.cacVariantIndex )
		}
	}
	infoTable.models.listDataSource = CoD.CACUtility.CreateItemListDataSource( controller, infoTable, weaponVariantInfo )
	return infoTable
end

CoD.CACUtility.GetNonZeroNumberOfAttachment = function ( attachmentList )
	local count = 0
	for index, attachmentIndex in ipairs( attachmentList ) do
		if attachmentIndex > CoD.CACUtility.EmptyItemIndex then
			count = count + 1
		end
	end
	return count
end

CoD.CACUtility.IsVariantEquippedToClass = function ( classModel, loadoutSlot, variantWeaponIndex, variantCACIndex )
	if classModel and (loadoutSlot == "primary" or loadoutSlot == "secondary") then
		local equippedWeaponIndex = CoD.SafeGetModelValue( classModel, loadoutSlot .. ".itemIndex" )
		local equippedGunsmithVariantIndex = CoD.SafeGetModelValue( classModel, loadoutSlot .. "gunsmithvariant.itemIndex" )
		local f202_local0 = equippedGunsmithVariantIndex
		local f202_local1 = equippedWeaponIndex
		local f202_local2
		if equippedWeaponIndex ~= variantWeaponIndex or equippedGunsmithVariantIndex ~= variantCACIndex then
			f202_local2 = false
		else
			f202_local2 = f202_local1 and f202_local0 and true
		end
		return f202_local2
	else
		return false
	end
end

CoD.CACUtility.WeaponVariantListPrepare = function ( controller )
	local infoTable = {}
	local baseWeaponIndex = CoD.perController[controller].weaponIndexForVariant
	local baseWeaponVariant = {
		variantName = Engine.GetItemName( baseWeaponIndex ),
		variantNameBig = "",
		variantIndex = CoD.CACUtility.EmptyItemIndex,
		weaponIndex = baseWeaponIndex,
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
	}
	table.insert( infoTable, CoD.CACUtility.GetWeaponVariantListModels( controller, baseWeaponVariant ) )
	local updateWildcardNeededCount = function ( isPrimary, variantAttachmentList )
		local wildcardNeededCount = 0
		if isPrimary then
			if variantAttachmentList[4] > CoD.CACUtility.EmptyItemIndex then
				wildcardNeededCount = wildcardNeededCount + 1
			end
			if variantAttachmentList[5] > CoD.CACUtility.EmptyItemIndex then
				wildcardNeededCount = wildcardNeededCount + 1
			end
			if variantAttachmentList[6] > CoD.CACUtility.EmptyItemIndex then
				wildcardNeededCount = wildcardNeededCount + 1
			end
		elseif variantAttachmentList[3] > CoD.CACUtility.EmptyItemIndex then
			wildcardNeededCount = wildcardNeededCount + 1
		end
		return wildcardNeededCount
	end
	
	local weaponVaraintTable = CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList( baseWeaponIndex )
	for index, weaponVariantInfo in ipairs( weaponVaraintTable ) do
		local variant = CoD.CraftUtility.Gunsmith.GetVariantByIndex( controller, weaponVariantInfo.variantIndex )
		if CoD.CACUtility.EmptyItemIndex < variant.weaponIndex then
			local attachmentsByIndex = {}
			local unlockedAttachmentsByIndex = {}
			local attachments = variant.attachment
			local numAttachments = CoD.CACUtility.GetNonZeroNumberOfAttachment( attachments )
			local wildcardNeededFromVariantCount = 0
			local wildcardNeededCount = 0
			local variantHasOpticAttachment = false
			local f203_local3 = CoD.perController[controller].weaponCategory == "primary"
			local hasLockedAttachments = false
			local isVariantLinkBroken = false
			local maxNonOpticsAttachmentsWithoutWildcard = 2
			if not f203_local3 then
				maxNonOpticsAttachmentsWithoutWildcard = 1
			end
			local maxAttachmentsWithoutWildcard = maxNonOpticsAttachmentsWithoutWildcard + 1
			local unsortedUnlockedAttachments = {}
			for i, attachmentTableIndex in ipairs( attachments ) do
				if CoD.CACUtility.EmptyItemIndex < attachmentTableIndex then
					local newAttachmentIndex = Engine.GetAttachmentIndexByAttachmentTableIndex( variant.weaponIndex, attachmentTableIndex )
					if Engine.IsOptic( variant.weaponIndex, newAttachmentIndex ) then
						variantHasOpticAttachment = true
					end
					table.insert( attachmentsByIndex, newAttachmentIndex )
					if not Engine.IsItemAttachmentLocked( controller, variant.weaponIndex, newAttachmentIndex ) then
						table.insert( unsortedUnlockedAttachments, {
							indexSlot = i,
							index = newAttachmentIndex
						} )
					else
						isVariantLinkBroken = true
						hasLockedAttachments = true
						table.insert( unsortedUnlockedAttachments, {
							indexSlot = i,
							index = CoD.CACUtility.EmptyItemIndex
						} )
						goto basicblock_13:
					end
				end
				table.insert( attachmentsByIndex, CoD.CACUtility.EmptyItemIndex )
				table.insert( unsortedUnlockedAttachments, {
					indexSlot = i,
					index = CoD.CACUtility.EmptyItemIndex
				} )
			end
			table.sort( unsortedUnlockedAttachments, function ( a, b )
				if a.indexSlot == 1 or b.indexSlot == 1 then
					return a.indexSlot < b.indexSlot
				elseif a.index == CoD.CACUtility.EmptyItemIndex or b.index == CoD.CACUtility.EmptyItemIndex then
					return b.index < a.index
				else
					return a.indexSlot < b.indexSlot
				end
			end )
			for _, attachmentTableIndex in ipairs( unsortedUnlockedAttachments ) do
				table.insert( unlockedAttachmentsByIndex, attachmentTableIndex.index )
			end
			if IsProgressionEnabled( controller ) then
				wildcardNeededCount = updateWildcardNeededCount( f203_local3, unlockedAttachmentsByIndex )
			end
			wildcardNeededFromVariantCount = updateWildcardNeededCount( f203_local3, attachmentsByIndex )
			local wildcardGunfighterList = CoD.CACUtility.PrimaryGunfighterWildcards
			if not f203_local3 then
				wildcardGunfighterList = {
					"bonuscard_secondary_gunfighter"
				}
			end
			local hasLockedWildcards = false
			for i = 1, wildcardNeededFromVariantCount, 1 do
				local wildcardGunfighterItemIndex = Engine.GetItemIndexFromReference( wildcardGunfighterList[i] )
				if Engine.IsItemLocked( controller, wildcardGunfighterItemIndex ) then
					hasLockedWildcards = true
					break
				end
			end
			variant.variantNameBig = variant.variantName
			variant.attachmentsByIndex = attachmentsByIndex
			variant.unlockedAttachmentsByIndex = unlockedAttachmentsByIndex
			variant.index = index
			variant.wildcardNeededCount = wildcardNeededCount
			variant.wildcardNeededFromVariantCount = wildcardNeededFromVariantCount
			variant.isVariantLinkBroken = isVariantLinkBroken
			variant.hasLockedAttachments = hasLockedAttachments
			variant.hasLockedItems = hasLockedAttachments or hasLockedWildcards
			table.insert( infoTable, CoD.CACUtility.GetWeaponVariantListModels( controller, variant ) )
		end
	end
	return infoTable
end

CoD.CACUtility.GetWeaponAndAttachments = function ( self, controller )
	local numAttachments = 0
	local anyAttachmentsChanged = false
	local currentWeaponModel = Engine.GetModel( Engine.GetModelForController( controller ), "currentWeapon" )
	if currentWeaponModel == nil then
		return numAttachments, anyAttachmentsChanged
	end
	for i = 1, 4, 1 do
		local model = Engine.GetModel( currentWeaponModel, "attachmentName" .. i )
		local attachmentName = Engine.GetModelValue( model )
		if model and attachmentName ~= "" then
			numAttachments = numAttachments + 1
		end
		if self["currentAttachment" .. i] ~= attachmentName then
			self["currentAttachment" .. i] = attachmentName
			anyAttachmentsChanged = true
		end
	end
	self.currentWeapon = Engine.GetModelValue( Engine.GetModel( currentWeaponModel, "weaponName" ) )
	return numAttachments, anyAttachmentsChanged
end

CoD.CACUtility.GetLocalizedAttachmentsString = function ( self )
	local localizedAttachments = ""
	if self.currentAttachment1 ~= nil and self.currentAttachment1 ~= "" then
		localizedAttachments = Engine.Localize( self.currentAttachment1 )
	end
	if self.currentAttachment2 ~= nil and self.currentAttachment2 ~= "" then
		localizedAttachments = localizedAttachments .. " + " .. Engine.Localize( self.currentAttachment2 )
	end
	if self.currentAttachment3 ~= nil and self.currentAttachment3 ~= "" then
		localizedAttachments = localizedAttachments .. " + " .. Engine.Localize( self.currentAttachment3 )
	end
	return localizedAttachments
end

DataSources.WeaponVariantList = DataSourceHelpers.ListSetup( "WeaponVariantList", CoD.CACUtility.WeaponVariantListPrepare, false )
CoD.WGSV_Category = {}
CoD.WGSV_Category.WEAPON = 1
CoD.WGSV_Category.GUNSMITH_VARIANT = 2
DataSources.WGSV_Category = Engine.CreateModel( Engine.GetGlobalModel(), "WGSV_Category" )
local PrepareEquippedWeaponAttachments = function ( controller )
	local results = {}
	local loadoutSlot = CoD.perController[controller].weaponSlot
	local classNum = CoD.perController[controller].classNum
	local classModel = CoD.perController[controller].classModel
	if loadoutSlot and classNum and classModel then
		local attachedWeapon = classModel[loadoutSlot].itemIndex:get()
		if attachedWeapon >= 0 then
			local attachmentSlots = CoD.CACUtility.GetAttachmentListForSlot( loadoutSlot )
			for attachmentSlotIndex, attachmentSlot in ipairs( attachmentSlots ) do
				local attachment = classModel[attachmentSlot].itemIndex:get()
				local f208_local3 = nil
				if attachment > 0 then
					f208_local3 = {
						models = {
							name = Engine.GetAttachmentName( attachedWeapon, attachment ),
							description = Engine.GetAttachmentDesc( attachedWeapon, attachment ),
							image = Engine.GetAttachmentImage( attachedWeapon, attachment )
						},
						properties = {
							isOptic = attachmentSlotIndex == 1,
							weaponSlot = attachmentSlot
						}
					}
				else
					f208_local3 = {
						models = {
							name = "MENU_NONE",
							image = "blacktransparent"
						},
						properties = {
							isOptic = attachmentSlotIndex == 1,
							weaponSlot = attachmentSlot
						}
					}
				end
				table.insert( results, f208_local3 )
			end
		end
	end
	return results
end

DataSources.EquippedWeaponAttachments = DataSourceHelpers.ListSetup( "EquippedWeaponAttachments", PrepareEquippedWeaponAttachments, true )
CoD.CACUtility.CreateContextualWeaponAttachmentsDataSources = function ( datasourcePrefix, controller, classModel )
	local loadoutAttachmentsDSourceMap = {
		[CoD.CACUtility.loadoutSlotNames.primaryWeapon] = "primaryAttachemts",
		[CoD.CACUtility.loadoutSlotNames.secondaryWeapon] = "secondaryAttachments"
	}
	for slot, dsource in pairs( loadoutAttachmentsDSourceMap ) do
		local dsourceSetup = function ( controller )
			local results = {}
			local attachedWeapon = classModel[slot].itemIndex:get()
			if attachedWeapon >= 0 then
				local attachmentSlots = CoD.CACUtility.GetAttachmentListForSlot( slot )
				for _, attachmentSlot in ipairs( attachmentSlots ) do
					local attachment = classModel[attachmentSlot].itemIndex:get()
					if attachment > 0 then
						local newItem = {
							models = {
								name = Engine.GetAttachmentName( attachedWeapon, attachment ),
								image = Engine.GetAttachmentImage( attachedWeapon, attachment ) .. "_wv_icon"
							}
						}
						table.insert( results, newItem )
					end
				end
			end
			return results
		end
		
		local dsourceName = datasourcePrefix .. "_" .. dsource
		DataSources[dsourceName] = DataSourceHelpers.ListSetup( dsourceName, dsourceSetup, false )
		local f209_local3 = classModel[slot]:create( "attachmentDataSource" )
		f209_local3:set( dsourceName )
	end
end

DataSourceHelpers.PerControllerDataSourceSetup( "PrototypeCareerAbilities", "prototypeAbilities", function ( rootModel, controller )
	local prototypeAbilities = {
		"gadget_disruptor",
		"gadget_group_revive",
		"gadget_hornet_swarm"
	}
	for i, ability in ipairs( prototypeAbilities ) do
		local itemModel = rootModel:create( "playerAbility" .. i )
		local itemIndex = Engine.GetItemIndexFromReference( ability )
		if itemIndex ~= CoD.CACUtility.EmptyItemIndex then
			local f211_local3 = itemModel:create( "name" )
			f211_local3:set( Engine.GetItemName( itemIndex ) )
			f211_local3 = itemModel:create( "desc" )
			f211_local3:set( Engine.GetItemDesc( itemIndex ) )
			f211_local3 = itemModel:create( "image" )
			f211_local3:set( Engine.GetItemImage( itemIndex ) )
		end
	end
end )
