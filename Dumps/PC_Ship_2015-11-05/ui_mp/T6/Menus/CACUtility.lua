require( "ui.T6.CoD9Button" )

CoD.CACUtility = {}
CoD.CACUtility.slotContainerAlpha = 0.04
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
CoD.CACUtility.PrimaryAttachmentCVSlotNameList = f0_local1( "primaryattachment", "cosmeticvariant", 1, CoD.CACUtility.maxPrimaryAttachments )
CoD.CACUtility.SecondaryWeaponSlotNameList = {
	"secondary"
}
CoD.CACUtility.SecondaryAttachmentSlotNameList = f0_local0( "secondaryattachment", 1, CoD.CACUtility.maxSecondaryAttachments )
CoD.CACUtility.SecondaryAttachmentCVSlotNameList = f0_local1( "secondaryattachment", "cosmeticvariant", 1, CoD.CACUtility.maxSecondaryAttachments )
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
CoD.CACUtility.maxWeaponCustomizationCategories = 9
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
	"acog",
	"dualoptic",
	"ir",
	"reflex"
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
				GoBack( GoBack( f12_local2, f12_arg2 ), f12_arg2 )
			end
			
			local f7_local8 = function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3, f13_arg4 )
				GoBack( f13_arg4, f13_arg2 )
			end
			
			local f7_local9 = not f7_local2
			if CoD.CCUtility.customizationMode == Enum.eModes.MODE_MULTIPLAYER and IsFirstTimeSetup( f7_arg0, Enum.eModes.MODE_MULTIPLAYER ) then
				table.insert( f7_local0, f7_local3( "MENU_UNLOCK_AND_EQUIP", f7_local7 ) )
			elseif f7_local2 then
				table.insert( f7_local0, f7_local3( "MENU_UNLOCK", f7_local4 ) )
				table.insert( f7_local0, f7_local3( "MENU_CANCEL_UNLOCK", f7_local8 ) )
			elseif f6_arg2 ~= nil then
				local f7_local10 = false
				for f7_local14, f7_local15 in ipairs( CoD.CACUtility.GetSlotListWithSlot( f7_local1 ) ) do
					if CoD.CACUtility.GetItemEquippedInSlot( f7_local15, f7_arg0 ) == f6_arg1 then
						f7_local10 = true
					end
				end
				if f7_local10 then
					table.insert( f7_local0, f7_local3( "MENU_UNLOCK", f7_local6 ) )
				else
					table.insert( f7_local0, f7_local3( "MENU_UNLOCK", f7_local4 ) )
					table.insert( f7_local0, f7_local3( "MENU_UNLOCK_AND_EQUIP", f7_local6 ) )
				end
				table.insert( f7_local0, f7_local3( "MENU_CANCEL_UNLOCK", f7_local8 ) )
			elseif f6_arg3 then
				table.insert( f7_local0, f7_local3( "MENU_UNLOCK_AND_EQUIP", f7_local5 ) )
				table.insert( f7_local0, f7_local3( "MENU_CANCEL_UNLOCK", f7_local8 ) )
			else
				table.insert( f7_local0, f7_local3( "MENU_UNLOCK", f7_local4 ) )
				table.insert( f7_local0, f7_local3( "MENU_UNLOCK_AND_EQUIP", f7_local6 ) )
				table.insert( f7_local0, f7_local3( "MENU_CANCEL_UNLOCK", f7_local8 ) )
			end
			return f7_local0
		end, true )
		return "UnlockTokenMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
CoD.CACUtility.GetCameraNameForAttachments = function ( f14_arg0, f14_arg1 )
	local f14_local0 = 0
	local f14_local1 = 0
	for f14_local5 in string.gmatch( f14_arg0, "[^+]+" ) do
		if f14_local5 == "suppressed" then
			f14_local0 = 1
		end
		if f14_local5 == "extbarrel" then
			f14_local1 = 1
		end
	end
	f14_local2 = "select"
	if f14_arg1 ~= nil and f14_arg1 then
		f14_local2 = "gunsmith"
	end
	f14_local3 = ""
	if f14_local0 == 1 then
		if f14_local1 == 1 then
			f14_local3 = "_extbarrel_suppressor"
		else
			f14_local3 = "_suppressor"
		end
	elseif f14_local1 == 1 then
		f14_local3 = "_extbarrel"
	else
		f14_local3 = "01"
	end
	return f14_local2 .. f14_local3
end

CoD.CACUtility.GetImageForItemRef = function ( f15_arg0 )
	return Engine.TableLookup( nil, CoD.statsTable, 0, f15_arg0, 6 )
end

CoD.CACUtility.GetNameForItemRef = function ( f16_arg0 )
	return Engine.TableLookup( nil, CoD.statsTable, 0, f16_arg0, 3 )
end

CoD.CACUtility.GetIdForItemRef = function ( f17_arg0 )
	return Engine.TableLookup( nil, CoD.statsTable, 0, f17_arg0, 4 )
end

CoD.CACUtility.GetNameForStatsTableImage = function ( f18_arg0 )
	return Engine.TableLookup( nil, CoD.statsTable, 6, f18_arg0, 3 )
end

CoD.CACUtility.IsSlotNameInList = function ( f19_arg0, f19_arg1 )
	for f19_local3, f19_local4 in ipairs( f19_arg0 ) do
		if f19_local4 == f19_arg1 then
			return true
		end
	end
	return false
end

CoD.CACUtility.GetSlotListWithSlot = function ( f20_arg0 )
	for f20_local3, f20_local4 in ipairs( CoD.CACUtility.SlotLists ) do
		if CoD.CACUtility.IsSlotNameInList( f20_local4, f20_arg0 ) then
			return f20_local4
		end
	end
	return {}
end

CoD.CACUtility.GetAttachmentListForSlot = function ( f21_arg0 )
	if LUI.startswith( f21_arg0, "primarygadget" ) then
		return CoD.CACUtility.PrimaryGadgetAttachmentSlotNameList
	elseif LUI.startswith( f21_arg0, "secondarygadget" ) then
		return CoD.CACUtility.SecondaryGadgetAttachmentSlotNameList
	elseif LUI.startswith( f21_arg0, "primary" ) then
		return CoD.CACUtility.PrimaryAttachmentSlotNameList
	elseif LUI.startswith( f21_arg0, "secondary" ) then
		return CoD.CACUtility.SecondaryAttachmentSlotNameList
	else
		return {}
	end
end

CoD.CACUtility.GetCACWeaponACVList = function ( f22_arg0 )
	if f22_arg0 == "primary" then
		return CoD.CACUtility.PrimaryAttachmentCVSlotNameList
	elseif f22_arg0 == "secondary" then
		return CoD.CACUtility.SecondaryAttachmentCVSlotNameList
	else
		return {}
	end
end

CoD.CACUtility.GetAllocationSpentFromClassData = function ( f23_arg0 )
	return CoD.SumClassItemCosts( f23_arg0.primaryWeapon ) + CoD.SumClassItemCosts( f23_arg0.primaryAttachments ) + CoD.SumClassItemCosts( f23_arg0.secondaryWeapon ) + CoD.SumClassItemCosts( f23_arg0.secondaryAttachments ) + CoD.SumClassItemCosts( f23_arg0.grenades ) + CoD.SumClassItemCosts( f23_arg0.gadgets ) + CoD.SumClassItemCosts( f23_arg0.perks ) + CoD.SumClassItemCosts( f23_arg0.rewards )
end

CoD.CACUtility.HowManyInClassData = function ( f24_arg0, f24_arg1 )
	return CoD.HowManyInClassSlot( f24_arg0, f24_arg1.primaryWeapon ) + CoD.HowManyInClassSlot( f24_arg0, f24_arg1.secondaryWeapon ) + CoD.HowManyInClassSlot( f24_arg0, f24_arg1.grenades ) + CoD.HowManyInClassSlot( f24_arg0, f24_arg1.gadgets ) + CoD.HowManyInClassSlot( f24_arg0, f24_arg1.perks ) + CoD.HowManyInClassSlot( f24_arg0, f24_arg1.rewards )
end

CoD.CACUtility.GetClassData = function ( f25_arg0, f25_arg1 )
	local f25_local0 = {}
	if f25_arg1 == nil then
		f25_arg1 = CoD.perController[f25_arg0].classNumInternal
	end
	local f25_local1 = CoD.CACUtility.loadoutSlotNames
	f25_local0.primaryWeapon = {}
	CoD.AddClassItemData( f25_local0.primaryWeapon, CoD.GetClassItem( f25_arg0, f25_arg1, f25_local1.primaryWeapon ) )
	f25_local0.secondaryWeapon = {}
	CoD.AddClassItemData( f25_local0.secondaryWeapon, CoD.GetClassItem( f25_arg0, f25_arg1, f25_local1.secondaryWeapon ) )
	f25_local0.primaryAttachments = {}
	f25_local0.secondaryAttachments = {}
	local f25_local2 = CoD.GetClassItem( f25_arg0, f25_arg1, f25_local1.primaryWeapon )
	local f25_local3 = CoD.GetClassItem( f25_arg0, f25_arg1, f25_local1.secondaryWeapon )
	for f25_local4 = 0, 2, 1 do
		CoD.AddClassAttachmentData( f25_local0.primaryAttachments, f25_local2, CoD.GetClassItem( f25_arg0, f25_arg1, f25_local1.primaryWeapon .. "attachment" .. f25_local4 + 1 ) )
		CoD.AddClassAttachmentData( f25_local0.secondaryAttachments, f25_local3, CoD.GetClassItem( f25_arg0, f25_arg1, f25_local1.secondaryWeapon .. "attachment" .. f25_local4 + 1 ) )
	end
	f25_local0.grenades = {}
	CoD.AddClassItemData( f25_local0.grenades, CoD.GetClassItem( f25_arg0, f25_arg1, f25_local1.primaryGrenade ), CoD.GetClassItem( f25_arg0, f25_arg1, "primarygrenadecount" ), f25_local1.primaryGrenade )
	CoD.AddClassItemData( f25_local0.grenades, CoD.GetClassItem( f25_arg0, f25_arg1, f25_local1.specialGrenade ), CoD.GetClassItem( f25_arg0, f25_arg1, "specialgrenadecount" ), f25_local1.specialGrenade )
	f25_local0.gadgets = {}
	CoD.AddClassItemData( f25_local0.gadgets, CoD.GetClassItem( f25_arg0, f25_arg1, f25_local1.primaryGadget ) )
	CoD.AddClassItemData( f25_local0.gadgets, CoD.GetClassItem( f25_arg0, f25_arg1, f25_local1.secondaryGadget ) )
	local f25_local4 = CoD.CACUtility.maxSpecialtySlots
	f25_local0.perks = {}
	for f25_local5 = 1, f25_local4, 1 do
		CoD.AddClassItemData( f25_local0.perks, CoD.GetClassItem( f25_arg0, f25_arg1, f25_local1["specialty" .. f25_local5] ) )
	end
	local f25_local5 = CoD.CACUtility.maxRewards
	f25_local0.rewards = {}
	for f25_local6 = 1, f25_local5, 1 do
		CoD.AddClassItemData( f25_local0.rewards, CoD.GetClassItem( f25_arg0, f25_arg1, "killstreak" .. f25_local6 ) )
	end
	table.sort( f25_local0.rewards, function ( f26_arg0, f26_arg1 )
		return f26_arg0.momentumCost < f26_arg1.momentumCost
	end )
	return f25_local0
end

CoD.CACUtility.GetLoadoutsMPOffline = function ( f27_arg0 )
	local f27_local0 = Engine.StorageGetBuffer( f27_arg0, Enum.StorageFileType.STORAGE_MP_LOADOUTS_OFFLINE )
	return f27_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsMPOnlinePublic = function ( f28_arg0 )
	local f28_local0 = Engine.StorageGetBuffer( f28_arg0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	return f28_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsMPOnlineCustom = function ( f29_arg0 )
	local f29_local0 = Engine.StorageGetBuffer( f29_arg0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	return f29_local0.customMatchCacLoadouts
end

CoD.CACUtility.GetLoadoutsMPOnlineLeague = function ( f30_arg0 )
	local f30_local0 = Engine.StorageGetBuffer( f30_arg0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	return f30_local0.leagueCacLoadouts
end

CoD.CACUtility.GetLoadoutsCPOffline = function ( f31_arg0 )
	local f31_local0 = Engine.StorageGetBuffer( f31_arg0, Enum.StorageFileType.STORAGE_CP_LOADOUTS_OFFLINE )
	return f31_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsCPOnline = function ( f32_arg0 )
	local f32_local0 = Engine.StorageGetBuffer( f32_arg0, Enum.StorageFileType.STORAGE_CP_LOADOUTS )
	return f32_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsZMOffline = function ( f33_arg0 )
	local f33_local0 = Engine.StorageGetBuffer( f33_arg0, Enum.StorageFileType.STORAGE_ZM_LOADOUTS_OFFLINE )
	return f33_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsZMOnlinePublic = function ( f34_arg0 )
	local f34_local0 = Engine.StorageGetBuffer( f34_arg0, Enum.StorageFileType.STORAGE_ZM_LOADOUTS )
	return f34_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsZMOnlineCustom = function ( f35_arg0 )
	local f35_local0 = Engine.StorageGetBuffer( f35_arg0, Enum.StorageFileType.STORAGE_ZM_LOADOUTS )
	return f35_local0.customMatchCacLoadouts
end

CoD.CACUtility.SetDefaultCACRootOld = function ( f36_arg0 )
	if CoD.isOnlineGame() ~= true then
		local f36_local0 = CoD.perController[f36_arg0]
		local f36_local1 = CoD.GetPlayerStats( f36_arg0 )
		f36_local0.cacRoot = f36_local1.cacLoadouts
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
		local f36_local0 = CoD.perController[f36_arg0]
		local f36_local1 = CoD.GetPlayerStats( f36_arg0 )
		f36_local0.cacRoot = f36_local1.leagueCacLoadouts
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) then
		local f36_local0 = CoD.perController[f36_arg0]
		local f36_local1 = CoD.GetPlayerStats( f36_arg0 )
		f36_local0.cacRoot = f36_local1.customMatchCacLoadouts
	else
		local f36_local0 = CoD.perController[f36_arg0]
		local f36_local1 = CoD.GetPlayerStats( f36_arg0 )
		f36_local0.cacRoot = f36_local1.cacLoadouts
	end
end

CoD.CACUtility.SetDefaultCACRoot = function ( f37_arg0 )
	local f37_local0 = nil
	if CoD.isOnlineGame() ~= true then
		f37_local0 = CoD.CPMPZM( CoD.CACUtility.GetLoadoutsCPOffline, CoD.CACUtility.GetLoadoutsMPOffline, CoD.CACUtility.GetLoadoutsZMOffline )
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
		f37_local0 = CoD.CPMPZM( nil, CoD.CACUtility.GetLoadoutsMPOnlineLeague, nil )
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) then
		f37_local0 = CoD.CPMPZM( CoD.CACUtility.GetLoadoutsCPOnline, CoD.CACUtility.GetLoadoutsMPOnlineCustom, CoD.CACUtility.GetLoadoutsZMOnlineCustom )
	else
		f37_local0 = CoD.CPMPZM( CoD.CACUtility.GetLoadoutsCPOnline, CoD.CACUtility.GetLoadoutsMPOnlinePublic, CoD.CACUtility.GetLoadoutsZMOnlinePublic )
	end
	if f37_local0 ~= nil then
		CoD.perController[f37_arg0].cacRoot = f37_local0( f37_arg0 )
	else
		error( "LUI Error: could not set up loadout root - no valid game mode set" )
	end
end

CoD.CACUtility.SetGametypeSettingsCACRoot = function ( f38_arg0, f38_arg1 )
	local f38_local0 = nil
	if f38_arg1 == Enum.team_t.TEAM_FREE then
		f38_local0 = 0
	else
		f38_local0 = f38_arg1 - Enum.team_t.TEAM_FIRST_PLAYING_TEAM + 1
	end
	local f38_local1 = CoD.perController[f38_arg0]
	local f38_local2 = Engine.GetGametypeSettings()
	f38_local1.cacRoot = f38_local2.cacLoadouts[f38_local0]
end

CoD.CACUtility.GetCACRoot = function ( f39_arg0 )
	return CoD.perController[f39_arg0].cacRoot
end

CoD.CACUtility.GetLoadoutNames = function ( f40_arg0 )
	local f40_local0 = CoD.CACUtility.GetCACRoot( f40_arg0 )
	if f40_local0 then
		return f40_local0.customClassName
	else
		return nil
	end
end

CoD.CACUtility.GetLoadoutNameFromIndex = function ( f41_arg0, f41_arg1 )
	local f41_local0 = CoD.CACUtility.GetLoadoutNames( f41_arg0 )
	if f41_local0 then
		return f41_local0[f41_arg1]
	else
		return nil
	end
end

CoD.CACUtility.GetDefaultLoadoutNameFromIndex = function ( f42_arg0 )
	if f42_arg0 < 1 or f42_arg0 > CoD.CACUtility.maxDefaultClass then
		error( "LUI Error: Default loadout out with index " .. f42_arg0 .. " doesn't exist." )
	end
	return CoD.CACUtility.defaultClassNames[f42_arg0]
end

CoD.CACUtility.SetupCACLock = function ( f43_arg0 )
	CoD.SetupButtonLock( f43_arg0, nil, "FEATURE_CREATE_A_CLASS", "FEATURE_CREATE_A_CLASS_DESC" )
end

CoD.CACUtility.IsBonusCardEquippedByName = function ( f44_arg0, f44_arg1 )
	local f44_local0 = Engine.GetItemIndexFromReference( f44_arg1 )
	for f44_local1 = 1, CoD.CACUtility.maxBonusCards, 1 do
		if f44_local0 ~= nil and f44_arg0["bonuscard" .. f44_local1] == f44_local0 then
			return true
		end
	end
	return false
end

CoD.CACUtility.IsBonusCardEquippedByIndex = function ( f45_arg0, f45_arg1 )
	for f45_local0 = 1, CoD.CACUtility.maxBonusCards, 1 do
		if f45_arg1 ~= nil and f45_arg0["bonuscard" .. f45_local0] == f45_arg1 then
			return true
		end
	end
	return false
end

CoD.CACUtility.GetBonusCardLoadoutSlot = function ( f46_arg0, f46_arg1 )
	for f46_local0 = 1, CoD.CACUtility.maxBonusCards, 1 do
		local f46_local3 = "bonuscard" .. f46_local0
		if f46_arg1 ~= nil and f46_arg0[f46_local3] == f46_arg1 then
			return f46_local3
		end
	end
end

CoD.CACUtility.GetLoadoutSlotForAttachmentName = function ( f47_arg0, f47_arg1, f47_arg2 )
	local f47_local0 = CoD.CACUtility.PrimaryAttachmentSlotNameList
	if LUI.startswith( f47_arg1, "secondary" ) then
		f47_local0 = CoD.CACUtility.SecondaryAttachmentSlotNameList
	end
	for f47_local5, f47_local6 in ipairs( f47_local0 ) do
		local f47_local7 = Engine.GetModel( f47_arg0, f47_local6 )
		if f47_local7 then
			local f47_local4 = Engine.GetModel( f47_local7, "ref" )
			if f47_local4 and Engine.GetModelValue( f47_local4 ) == f47_arg2 then
				return f47_local6
			end
		end
	end
	return nil
end

CoD.CACUtility.GetAttachmentVariantForAttachmentList = function ( f48_arg0, f48_arg1 )
	local f48_local0 = CoD.CACUtility.PrimaryAttachmentSlotNameList
	if LUI.startswith( f48_arg1, "secondary" ) then
		f48_local0 = CoD.CACUtility.SecondaryAttachmentSlotNameList
	end
	local f48_local1 = {}
	for f48_local8, f48_local9 in ipairs( f48_local0 ) do
		local f48_local10 = Engine.GetModel( f48_arg0, f48_local9 )
		if f48_local10 then
			local f48_local5 = Engine.GetModel( f48_local10, "ref" )
			if f48_local5 then
				local f48_local6 = Engine.GetModelValue( f48_local5 )
				if f48_local6 ~= "" then
					local f48_local7 = Engine.GetModel( f48_arg0, f48_local9 .. "cosmeticvariant.itemIndex" )
					if f48_local7 then
						table.insert( f48_local1, {
							ref = f48_local6,
							attachmentIndex = Engine.GetModelValue( f48_local7 )
						} )
					end
				end
			end
		end
	end
	return f48_local1
end

CoD.CACUtility.IsAttachmentRefWeaponOption = function ( f49_arg0 )
	for f49_local0 = 0, #CoD.CACUtility.weaponOptionGroupNames - 1, 1 do
		if CoD.CACUtility.weaponOptionGroupNames[f49_local0] == f49_arg0 then
			return true
		end
	end
	return nil
end

CoD.CACUtility.GetWeaponOptionTypeForName = function ( f50_arg0 )
	for f50_local0 = 0, #CoD.CACUtility.weaponOptionGroupNames - 1, 1 do
		if CoD.CACUtility.weaponOptionGroupNames[f50_local0] == f50_arg0 then
			return f50_local0
		end
	end
	return nil
end

CoD.CACUtility.GetAttachedItemSlot = function ( f51_arg0, f51_arg1, f51_arg2 )
	for f51_local4, f51_local5 in ipairs( f51_arg2 ) do
		local f51_local6 = Engine.GetModel( f51_arg0, f51_local5 )
		if f51_local6 then
			local f51_local3 = Engine.GetModel( f51_local6, "itemIndex" )
			if f51_local3 and Engine.GetModelValue( f51_local3 ) == f51_arg1 then
				return f51_local5
			end
		end
	end
	return nil
end

CoD.CACUtility.FindFirstEmptySlotInList = function ( f52_arg0, f52_arg1 )
	for f52_local4, f52_local5 in ipairs( f52_arg1 ) do
		local f52_local6 = Engine.GetModel( f52_arg0, f52_local5 )
		if f52_local6 then
			local f52_local3 = Engine.GetModel( f52_local6, "itemIndex" )
			if f52_local3 and Engine.GetModelValue( f52_local3 ) <= CoD.CACUtility.EmptyItemIndex then
				return f52_local5
			end
		end
	end
	return nil
end

CoD.CACUtility.IsBonusCardEquipped = function ( f53_arg0, f53_arg1 )
	if not f53_arg1 then
		return false
	elseif f53_arg1 then
		for f53_local4, f53_local5 in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
			local f53_local6 = Engine.GetModel( f53_arg1, f53_local5 )
			if f53_local6 then
				local f53_local3 = Engine.GetModel( f53_local6, "itemIndex" )
				if f53_local3 and Engine.GetItemRef( Engine.GetModelValue( f53_local3 ) ) == f53_arg0 then
					return true
				end
			end
		end
	end
	return false
end

CoD.CACUtility.SpecificWildcardEquippedCount = function ( f54_arg0, f54_arg1 )
	local f54_local0 = 0
	if f54_arg0 then
		local f54_local1 = Engine.GetItemIndexFromReference( f54_arg1 )
		for f54_local6, f54_local7 in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
			local f54_local8 = Engine.GetModel( f54_arg0, f54_local7 .. ".itemIndex" )
			if f54_local8 then
				local f54_local5 = Engine.GetModelValue( f54_local8 )
				if f54_local5 > CoD.CACUtility.EmptyItemIndex and LUI.startswith( Engine.GetItemRef( f54_local5 ), f54_arg1 ) then
					f54_local0 = f54_local0 + 1
				end
			end
		end
	end
	return math.min( math.max( f54_local0, 0 ), CoD.CACUtility.maxBonusCards )
end

CoD.CACUtility.PrimaryGunfighterEquippedCount = function ( f55_arg0 )
	local f55_local0 = 0
	for f55_local4, f55_local5 in ipairs( CoD.CACUtility.PrimaryGunfighterWildcards ) do
		if CoD.CACUtility.IsBonusCardEquipped( f55_local5, f55_arg0 ) then
			f55_local0 = f55_local0 + 1
		end
	end
	return math.min( math.max( f55_local0, 0 ), CoD.CACUtility.maxPrimaryGunfighters )
end

CoD.CACUtility.SearchForBonusCard = function ( f56_arg0, f56_arg1, f56_arg2 )
	if not f56_arg1 then
		return ""
	end
	local f56_local0 = f56_arg2 or CoD.perController[f56_arg1].classModel
	if f56_local0 then
		for f56_local5, f56_local6 in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
			local f56_local7 = Engine.GetModel( f56_local0, f56_local6 )
			if f56_local7 then
				local f56_local4 = Engine.GetModel( f56_local7, "itemIndex" )
				if f56_local4 and Engine.GetItemRef( Engine.GetModelValue( f56_local4 ) ) == f56_arg0 then
					return f56_local6
				end
			end
		end
	end
	return ""
end

CoD.CACUtility.GetItemRefEquippedInSlot = function ( f57_arg0, f57_arg1, f57_arg2 )
	if not f57_arg1 then
		return 
	end
	local f57_local0 = f57_arg2 or CoD.perController[f57_arg1].classModel
	if f57_local0 then
		local f57_local1 = Engine.GetModel( f57_local0, f57_arg0 )
		if f57_local1 then
			local f57_local2 = Engine.GetModel( f57_local1, "ref" )
			if f57_local2 then
				return Engine.GetModelValue( f57_local2 )
			end
		end
	end
end

CoD.CACUtility.IsItemEquippedInAnySlot = function ( f58_arg0, f58_arg1 )
	for f58_local3, f58_local4 in ipairs( f58_arg1 ) do
		if CoD.CACUtility.ItemEquippedInSlot( f58_local4, nil, f58_arg0 ) then
			return true
		end
	end
	return false
end

CoD.CACUtility.GetItemEquippedInSlot = function ( f59_arg0, f59_arg1, f59_arg2 )
	local f59_local0 = f59_arg2
	if not f59_local0 and f59_arg1 then
		f59_local0 = CoD.perController[f59_arg1].classModel
	end
	if f59_local0 then
		local f59_local1 = Engine.GetModel( f59_local0, f59_arg0 )
		if f59_local1 then
			local f59_local2 = Engine.GetModel( f59_local1, "itemIndex" )
			if f59_local2 then
				return Engine.GetModelValue( f59_local2 )
			end
		end
	end
	return CoD.CACUtility.EmptyItemIndex
end

CoD.CACUtility.ItemEquippedInSlot = function ( f60_arg0, f60_arg1, f60_arg2 )
	return CoD.CACUtility.EmptyItemIndex < CoD.CACUtility.GetItemEquippedInSlot( f60_arg0, f60_arg1, f60_arg2 )
end

CoD.CACUtility.DoesWeaponHaveDWInSlot = function ( f61_arg0, f61_arg1, f61_arg2 )
	if f61_arg0 ~= "primary" and f61_arg0 ~= "secondary" then
		return false
	end
	local f61_local0 = Engine.GetModel( f61_arg2, f61_arg0 )
	if f61_local0 then
		local f61_local1 = Engine.GetModelValue( Engine.GetModel( f61_local0, "itemIndex" ) )
		if f61_local1 > CoD.CACUtility.EmptyItemIndex then
			for f61_local6, f61_local7 in ipairs( CoD.CACUtility.GetAttachmentListForSlot( f61_arg0 ) ) do
				local f61_local8 = Engine.GetModelValue( Engine.GetModel( f61_arg2, f61_local7 .. ".itemIndex" ) )
				if f61_local8 > CoD.CACUtility.EmptyItemIndex then
					local f61_local5 = Engine.GetAttachmentRef( f61_local1, f61_local8 )
					if f61_local5 and f61_local5 == "dw" then
						return true
					end
				end
			end
		end
	end
	return false
end

CoD.CACUtility.DoesWeaponHaveAnyAttachments = function ( f62_arg0, f62_arg1, f62_arg2 )
	local f62_local0 = Engine.GetModel( f62_arg2, f62_arg0 )
	if f62_local0 then
		local f62_local1 = Engine.GetModelValue( Engine.GetModel( f62_local0, "itemIndex" ) )
		if f62_local1 > CoD.CACUtility.EmptyItemIndex and Engine.GetNumAttachments( f62_local1 ) > 1 then
			return true
		end
	end
	return false
end

CoD.CACUtility.GetItemName = function ( f63_arg0, f63_arg1, f63_arg2 )
	local f63_local0 = f63_arg2
	if not f63_local0 and f63_arg1 then
		f63_local0 = CoD.perController[f63_arg1].classModel
	end
	if f63_local0 then
		local f63_local1 = Engine.GetModel( f63_local0, f63_arg0 )
		if f63_local1 then
			local f63_local2 = Engine.GetModel( f63_local1, "name" )
			if f63_local2 then
				return Engine.GetModelValue( f63_local2 )
			end
		end
	end
	return ""
end

CoD.CACUtility.GetItemReferenceName = function ( f64_arg0, f64_arg1 )
	local f64_local0 = Engine.GetModel( f64_arg0, "itemIndex" )
	if f64_local0 then
		return Engine.GetItemRef( Engine.GetModelValue( f64_local0 ) )
	else
		return ""
	end
end

CoD.CACUtility.AllowTwoPrimaryTacticals = function ( f65_arg0 )
	local f65_local0
	if CoD.CACUtility.SearchForBonusCard( "bonuscard_danger_close", f65_arg0 ) == "" and CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", f65_arg0 ) == "" then
		f65_local0 = false
	else
		f65_local0 = true
	end
	return f65_local0
end

CoD.CACUtility.GetMutuallyExclusiveSlotName = function ( f66_arg0, f66_arg1, f66_arg2, f66_arg3 )
	local f66_local0 = Engine.GetItemRef( f66_arg2 )
	local f66_local1 = {}
	if not f66_arg3 then
		f66_arg3 = CoD.perController[f66_arg1].classModel
	end
	local f66_local2 = function ( f67_arg0, f67_arg1, f67_arg2 )
		if LUI.endswith( f66_local0, "_pro" ) and CoD.CACUtility.GetItemEquippedInSlot( f67_arg1, f67_arg0, f66_arg3 ) == Engine.GetItemIndexFromReference( string.sub( f66_local0, 1, -string.len( "_pro" ) - 1 ) ) then
			return f67_arg1
		else
			return ""
		end
	end
	
	if LUI.startswith( f66_arg0, "bonuscard" ) then
		if f66_local0 == "bonuscard_danger_close" then
			table.insert( f66_local1, CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", f66_arg1 ) )
		elseif f66_local0 == "bonuscard_two_tacticals" then
			table.insert( f66_local1, CoD.CACUtility.SearchForBonusCard( "bonuscard_danger_close", f66_arg1 ) )
		end
	elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", f66_arg1 ) and f66_arg0 == "primarygadget" then
		if CoD.CACUtility.GetItemEquippedInSlot( "secondarygadget", f66_arg1, f66_arg3 ) == f66_arg2 then
			table.insert( f66_local1, "secondarygadget" )
		end
	elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", f66_arg1 ) and f66_arg0 == "secondarygadget" then
		if CoD.CACUtility.GetItemEquippedInSlot( "primarygadget", f66_arg1, f66_arg3 ) == f66_arg2 then
			table.insert( f66_local1, "primarygadget" )
		end
	elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_overkill", f66_arg1 ) and f66_arg0 == "primary" then
		if CoD.CACUtility.GetItemEquippedInSlot( "secondary", f66_arg1, f66_arg3 ) == f66_arg2 then
			table.insert( f66_local1, "secondary" )
		end
	elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_overkill", f66_arg1 ) and f66_arg0 == "secondary" then
		if CoD.CACUtility.GetItemEquippedInSlot( "primary", f66_arg1, f66_arg3 ) == f66_arg2 then
			table.insert( f66_local1, "primary" )
		end
	elseif CoD.CACUtility.IsSlotNameInList( CoD.CACUtility.PrimaryAttachmentSlotNameList, f66_arg0 ) or CoD.CACUtility.IsSlotNameInList( CoD.CACUtility.SecondaryAttachmentSlotNameList, f66_arg0 ) then
		local f66_local3 = CoD.CACUtility.GetAttachmentListForSlot( f66_arg0 )
		local f66_local4 = "primary"
		if LUI.startswith( f66_arg0, "secondary" ) then
			f66_local4 = "secondary"
		end
		local f66_local5 = CoD.CACUtility.GetItemEquippedInSlot( f66_local4, f66_arg1, f66_arg3 )
		for f66_local9, f66_local10 in ipairs( f66_local3 ) do
			local f66_local11 = CoD.CACUtility.GetItemEquippedInSlot( f66_local10, f66_arg1, f66_arg3 )
			if f66_local11 ~= f66_arg2 and not Engine.AreAttachmentsCompatible( f66_local5, f66_local11, f66_arg2 ) then
				table.insert( f66_local1, f66_local10 )
			end
		end
	elseif f66_arg0 == "cybercom_tacrig1" then
		if CoD.CACUtility.GetItemEquippedInSlot( "cybercom_tacrig2", f66_arg1, f66_arg3 ) == f66_arg2 then
			table.insert( f66_local1, "cybercom_tacrig2" )
		end
		local f66_local3 = f66_local2( f66_arg1, "cybercom_tacrig2", f66_arg2 )
		if f66_local3 ~= "" then
			table.insert( f66_local1, f66_local3 )
		end
	elseif f66_arg0 == "cybercom_tacrig2" then
		if CoD.CACUtility.GetItemEquippedInSlot( "cybercom_tacrig1", f66_arg1, f66_arg3 ) == f66_arg2 then
			table.insert( f66_local1, "cybercom_tacrig1" )
		end
		local f66_local3 = f66_local2( f66_arg1, "cybercom_tacrig1", f66_arg2 )
		if f66_local3 ~= "" then
			table.insert( f66_local1, f66_local3 )
		end
	end
	return f66_local1
end

CoD.CACUtility.AttachmentHasCustomReticle = function ( f68_arg0 )
	for f68_local3, f68_local4 in ipairs( CoD.CACUtility.attachmentsWithCustReticle ) do
		if f68_local4 == f68_arg0 then
			return f68_local4
		end
	end
	return nil
end

CoD.CACUtility.GetWeaponOptionMTXName = function ( f69_arg0 )
	return Engine.TableLookup( nil, CoD.attachmentTable, 0, f69_arg0, 16 )
end

CoD.CACUtility.GetBackingMTXName = function ( f70_arg0 )
	return Engine.TableLookup( nil, "gamedata/emblems/emblemsOrBackings.csv", 0, "background", 1, f70_arg0, 10 )
end

CoD.CACUtility.IsWeaponOptionMTX = function ( f71_arg0 )
	local f71_local0 = CoD.CACUtility.GetWeaponOptionMTXName( f71_arg0 )
	return f71_local0 and f71_local0 ~= ""
end

CoD.CACUtility.IsBackingMTX = function ( f72_arg0 )
	local f72_local0 = CoD.CACUtility.GetBackingMTXName( f72_arg0 )
	return f72_local0 and f72_local0 ~= ""
end

CoD.CACUtility.IsAnyWeaponMTXAvailable = function ()
	for f73_local0 = 0, CoD.CACUtility.maxMTXWeaponPacks, 1 do
		if Engine.IsMTXAvailable( "mtx_weapon" .. f73_local0 ) then
			return true
		end
	end
	return false
end

CoD.CACUtility.HasAnyWeaponMTX = function ( f74_arg0 )
	for f74_local0 = 0, CoD.CACUtility.maxMTXWeaponPacks, 1 do
		if Engine.HasMTX( f74_arg0, "mtx_weapon" .. f74_local0 ) then
			return true
		end
	end
	return false
end

CoD.CACUtility.ShouldDisplayWeaponOptionMTX = function ( f75_arg0, f75_arg1 )
	if Engine.SkipMTXItem( CoD.CACUtility.GetWeaponOptionMTXName( f75_arg1 ) ) == true then
		return false
	else
		return true
	end
end

CoD.CACUtility.GetMTXPurchaseMsg = function ( f76_arg0 )
	return "MPUI_" .. Engine.TableLookup( nil, "mp/mtxitems.csv", 1, f76_arg0, 3 ) .. "_MSG"
end

CoD.CACUtility.SelectedClassIndex = {}
CoD.CACUtility.IsOnlineGame = function ()
	if Engine.GameModeIsMode( CoD.GAMEMODE_LOCAL_SPLITSCREEN ) == false and not Engine.SessionMode_IsSystemlinkGame() then
		return true
	else
		return false
	end
end

CoD.CACUtility.SetProfileLoadoutChoice = function ( f78_arg0, f78_arg1 )
	local f78_local0 = "lastLoadoutSystemlink"
	if CoD.CACUtility.IsOnlineGame() == true then
		if Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
			f78_local0 = "lastLoadoutLeague"
		else
			f78_local0 = "lastLoadoutOnline"
		end
	end
	Engine.SetProfileVar( f78_arg0, f78_local0, f78_arg1 )
	Engine.CommitProfileChanges( f78_arg0 )
	CoD.CACUtility.SelectedClassIndex[f78_arg0] = f78_arg1
end

CoD.CACUtility.GetEquipmentLabel = function ( f79_arg0, f79_arg1 )
	local f79_local0 = false
	local f79_local1 = "BAD EQUIPMENT LABEL"
	if f79_local0 then
		if f79_arg0 == CoD.CACUtility.loadoutSlotNames.primaryGadget then
			f79_local1 = Engine.Localize( "MPUI_PRIMARY_GADGET_CAPS" )
		elseif f79_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryGadget then
			f79_local1 = Engine.Localize( "MPUI_SECONDARY_GADGET_CAPS" )
		end
	elseif f79_arg0 == CoD.CACUtility.loadoutSlotNames.primaryGadget then
		if f79_arg1 ~= nil and CoD.CACUtility.IsBonusCardEquippedByName( f79_arg1, "bonuscard_two_tacticals" ) then
			f79_local1 = Engine.Localize( "MPUI_SECOND_SPECIAL_GRENADE_CAPS" )
		else
			f79_local1 = Engine.Localize( "MPUI_PRIMARY_GRENADE_CAPS" )
		end
	elseif f79_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryGadget then
		f79_local1 = Engine.Localize( "MPUI_SPECIAL_GRENADE_CAPS" )
	end
	return f79_local1
end

CoD.CACUtility.UpdateHeaderNames = function ( f80_arg0, f80_arg1, f80_arg2 )
	local f80_local0 = Engine.GetCustomClass( f80_arg0, f80_arg1 )
	local f80_local1 = "MPUI_SECONDARY_WEAPON_CAPS"
	local f80_local2 = "MPUI_PRIMARYGRENADE_CAPS"
	local f80_local3 = "MPUI_SPECIALGRENADE_CAPS"
	if CoD.CACUtility.IsBonusCardEquippedByName( f80_local0, "bonuscard_overkill" ) == true then
		f80_local1 = "MPUI_SECOND_PRIMARY_CAPS"
	end
	if CoD.CACUtility.IsBonusCardEquippedByName( f80_local0, "bonuscard_two_tacticals" ) == true then
		f80_local2 = "MPUI_SECOND_SPECIAL_GRENADE_CAPS"
		f80_local3 = "MPUI_FIRST_SPECIAL_GRENADE_CAPS"
	end
	Engine.SetModelValue( Engine.CreateModel( f80_arg2, "secondary.headerName" ), f80_local1 )
	Engine.SetModelValue( Engine.CreateModel( f80_arg2, "primarygadget.headerName" ), f80_local2 )
	Engine.SetModelValue( Engine.CreateModel( f80_arg2, "primarygadgetattachment1.headerName" ), f80_local2 )
	Engine.SetModelValue( Engine.CreateModel( f80_arg2, "secondarygadget.headerName" ), f80_local3 )
	Engine.SetModelValue( Engine.CreateModel( f80_arg2, "secondarygadgetattachment1.headerName" ), f80_local3 )
	if not Engine.GetModel( f80_arg2, "primary.headerName" ) then
		Engine.SetModelValue( Engine.CreateModel( f80_arg2, "primary.headerName" ), "MPUI_PRIMARY_WEAPON_CAPS" )
		for f80_local7, f80_local8 in ipairs( CoD.CACUtility.PrimaryAttachmentSlotNameList ) do
			if f80_local7 == 1 then
				Engine.SetModelValue( Engine.CreateModel( f80_arg2, f80_local8 .. ".headerName" ), "MPUI_PRIMARY_OPTIC_CAPS" )
			else
				Engine.SetModelValue( Engine.CreateModel( f80_arg2, f80_local8 .. ".headerName" ), "MPUI_PRIMARY_ATTACHMENT_CAPS" )
			end
		end
		for f80_local7, f80_local8 in ipairs( CoD.CACUtility.SecondaryAttachmentSlotNameList ) do
			if f80_local7 == 1 then
				Engine.SetModelValue( Engine.CreateModel( f80_arg2, f80_local8 .. ".headerName" ), "MPUI_SECONDARY_OPTIC_CAPS" )
			else
				Engine.SetModelValue( Engine.CreateModel( f80_arg2, f80_local8 .. ".headerName" ), "MPUI_SECONDARY_ATTACHMENT_CAPS" )
			end
		end
		for f80_local7, f80_local8 in ipairs( CoD.CACUtility.Perk1SlotNameList ) do
			Engine.SetModelValue( Engine.CreateModel( f80_arg2, f80_local8 .. ".headerName" ), "MPUI_PERK1_CAPS" )
		end
		for f80_local7, f80_local8 in ipairs( CoD.CACUtility.Perk2SlotNameList ) do
			Engine.SetModelValue( Engine.CreateModel( f80_arg2, f80_local8 .. ".headerName" ), "MPUI_PERK2_CAPS" )
		end
		for f80_local7, f80_local8 in ipairs( CoD.CACUtility.Perk3SlotNameList ) do
			Engine.SetModelValue( Engine.CreateModel( f80_arg2, f80_local8 .. ".headerName" ), "MPUI_PERK3_CAPS" )
		end
		for f80_local7, f80_local8 in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
			Engine.SetModelValue( Engine.CreateModel( f80_arg2, f80_local8 .. ".headerName" ), "MENU_WILDCARD_CAPS" )
		end
	end
	local f80_local4 = "MENU_TACTICAL_RIG_CAPS"
	Engine.SetModelValue( Engine.CreateModel( f80_arg2, "cybercom_tacrig1.headerName" ), f80_local4 )
	Engine.SetModelValue( Engine.CreateModel( f80_arg2, "cybercom_tacrig2.headerName" ), f80_local4 )
end

CoD.CACUtility.AddBigImagesToCustomClassModel = function ( f81_arg0, f81_arg1, f81_arg2, f81_arg3 )
	local f81_local0 = Engine.GetModel( f81_arg1, f81_arg2 )
	if not f81_local0 then
		return 
	end
	local f81_local1 = Engine.GetModel( f81_local0, "image" )
	if f81_local1 then
		local f81_local2 = Engine.GetModelValue( f81_local1 )
		if f81_local2 then
			if f81_local2 == CoD.CACUtility.DefaultLoadoutImage then
				f81_arg3 = ""
			end
			Engine.SetModelValue( Engine.CreateModel( f81_local0, "image_big" ), f81_local2 .. f81_arg3 )
		end
	end
end

CoD.CACUtility.GetBonucardUnlockHint = function ( f82_arg0, f82_arg1 )
	local f82_local0 = Engine.GetItemIndexFromReference( f82_arg1 )
	return Engine.Localize( f82_arg0, Engine.GetItemName( f82_local0 ), Engine.GetItemUnlockLevel( f82_local0 ) + 1 )
end

CoD.CACUtility.GetCACSlotStatus = function ( f83_arg0, f83_arg1, f83_arg2 )
	local f83_local0 = CoD.CACUtility.CACStatusAvailable.AVAILABLE
	local f83_local1 = false
	local f83_local2 = ""
	local f83_local3 = nil
	if CoD.CACUtility.ItemEquippedInSlot( f83_arg2, f83_arg0, f83_arg1 ) then
		f83_local1 = true
		if f83_arg2 == "primary" or f83_arg2 == "secondary" then
			f83_local2 = "MPUI_BUTTON_PERSONALIZE_CAPS"
		end
	elseif f83_arg2 == "primary" or f83_arg2 == "secondary" then
		f83_local2 = "MPUI_EQUIP_WEAPON"
	elseif f83_arg2 == "primarygadget" then
		if CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", f83_arg0 ) ~= "" then
			f83_local2 = "MPUI_EQUIP_TACTICAL"
		else
			f83_local2 = "MPUI_EQUIP_LETHAL"
		end
	elseif f83_arg2 == "secondarygadget" then
		f83_local2 = "MPUI_EQUIP_TACTICAL"
	elseif LUI.startswith( f83_arg2, "specialty" ) then
		f83_local2 = "MPUI_EQUIP_PERK"
		if f83_arg2 == "specialty4" then
			if IsNonAttachmentItemLocked( f83_arg0, "bonuscard_perk_1_greed" ) then
				f83_local2 = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_perk_1_greed" )
				f83_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_1_greed", f83_arg0, f83_arg1 ) == "" then
				f83_local2 = "MPUI_REQUIRES_PERK_1_GREED"
				f83_local0 = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			end
		elseif f83_arg2 == "specialty5" then
			if IsNonAttachmentItemLocked( f83_arg0, "bonuscard_perk_2_greed" ) then
				f83_local2 = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_perk_2_greed" )
				f83_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_2_greed", f83_arg0, f83_arg1 ) == "" then
				f83_local2 = "MPUI_REQUIRES_PERK_2_GREED"
				f83_local0 = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			end
		elseif f83_arg2 == "specialty6" then
			if IsNonAttachmentItemLocked( f83_arg0, "bonuscard_perk_3_greed" ) then
				f83_local2 = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_perk_3_greed" )
				f83_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_3_greed", f83_arg0, f83_arg1 ) == "" then
				f83_local2 = "MPUI_REQUIRES_PERK_3_GREED"
				f83_local0 = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			end
		end
	elseif LUI.startswith( f83_arg2, "primaryattachment" ) then
		local f83_local4 = CoD.CACUtility.GetItemEquippedInSlot( "primary", f83_arg0, f83_arg1 )
		local f83_local5 = Engine.GetNumAttachments( f83_local4 )
		if f83_arg2 == "primaryattachment1" then
			f83_local2 = "MPUI_EQUIP_OPTIC"
		else
			f83_local2 = "MPUI_EQUIP_ATTACHMENT"
		end
		if f83_local4 <= CoD.CACUtility.EmptyItemIndex then
			f83_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			if f83_arg2 == "primaryattachment1" then
				f83_local2 = "MPUI_OPTICS_NOT_AVAILABLE"
			else
				f83_local2 = "MPUI_ATTACHMENTS_NOT_AVAILABLE"
			end
		elseif f83_arg2 == "primaryattachment1" and Engine.GetNumOptics( f83_local4 ) <= 1 then
			f83_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			f83_local2 = "MPUI_OPTICS_NOT_AVAILABLE"
		elseif (f83_arg2 == "primaryattachment2" or f83_arg2 == "primaryattachment3") and f83_local5 <= 1 then
			f83_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			f83_local2 = "MPUI_ATTACHMENTS_NOT_AVAILABLE"
		elseif f83_arg2 == "primaryattachment4" or f83_arg2 == "primaryattachment5" or f83_arg2 == "primaryattachment6" then
			if f83_local5 <= 1 then
				f83_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
				f83_local2 = "MPUI_ATTACHMENTS_NOT_AVAILABLE"
			elseif IsNonAttachmentItemLocked( f83_arg0, "bonuscard_primary_gunfighter" ) then
				f83_local2 = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_primary_gunfighter" )
				f83_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			else
				local f83_local6 = CoD.CACUtility.PrimaryGunfighterEquippedCount( f83_arg1 )
				if not (f83_arg2 ~= "primaryattachment4" or f83_local6 >= 1) or not (f83_arg2 ~= "primaryattachment5" or f83_local6 >= 2) or f83_arg2 == "primaryattachment6" and f83_local6 < 3 then
					f83_local2 = "MPUI_REQUIRES_PRIMARY_GUNFIGHTER"
					f83_local0 = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
				end
			end
		end
	elseif LUI.startswith( f83_arg2, "secondaryattachment" ) then
		local f83_local4 = CoD.CACUtility.GetItemEquippedInSlot( "secondary", f83_arg0, f83_arg1 )
		local f83_local5 = Engine.GetNumAttachments( f83_local4 )
		if f83_arg2 == "secondaryattachment1" then
			f83_local2 = "MPUI_EQUIP_OPTIC"
		else
			f83_local2 = "MPUI_EQUIP_ATTACHMENT"
		end
		if f83_local4 <= CoD.CACUtility.EmptyItemIndex then
			f83_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			if f83_arg2 == "secondaryattachment1" then
				f83_local2 = "MPUI_OPTICS_NOT_AVAILABLE"
			else
				f83_local2 = "MPUI_ATTACHMENTS_NOT_AVAILABLE"
			end
		elseif f83_arg2 == "secondaryattachment1" and Engine.GetNumOptics( f83_local4 ) <= 1 then
			f83_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			f83_local2 = "MPUI_OPTICS_NOT_AVAILABLE"
		elseif f83_arg2 == "secondaryattachment2" and f83_local5 <= 1 then
			f83_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			f83_local2 = "MPUI_ATTACHMENTS_NOT_AVAILABLE"
		elseif f83_arg2 == "secondaryattachment3" then
			if f83_local5 <= 1 then
				f83_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
				f83_local2 = "MPUI_ATTACHMENTS_NOT_AVAILABLE"
			elseif IsNonAttachmentItemLocked( f83_arg0, "bonuscard_secondary_gunfighter" ) then
				f83_local2 = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_secondary_gunfighter" )
				f83_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_secondary_gunfighter", f83_arg0, f83_arg1 ) == "" then
				f83_local2 = "MPUI_REQUIRES_SECONDARY_GUNFIGHTER"
				f83_local0 = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			end
		end
	elseif LUI.startswith( f83_arg2, "primarygadgetattachment" ) then
		local f83_local4 = CoD.CACUtility.GetItemEquippedInSlot( "primarygadget", f83_arg0, f83_arg1 )
		f83_local3 = CoD.CACUtility.GetItemName( "primarygadget", f83_arg0, f83_arg1 )
		f83_local2 = "MPUI_EQUIP_TAKE_TWO"
		if not f83_local4 or f83_local4 <= CoD.CACUtility.EmptyItemIndex then
			f83_local2 = "MPUI_TAKE_TWO_NOT_AVAILABLE"
			f83_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
		elseif IsNonAttachmentItemLocked( f83_arg0, "bonuscard_danger_close" ) then
			f83_local2 = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_danger_close" )
			f83_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
		elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_danger_close", f83_arg0 ) == "" and CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", f83_arg0 ) == "" then
			f83_local0 = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			f83_local2 = "MPUI_REQUIRES_DANGER_CLOSE"
		end
	elseif LUI.startswith( f83_arg2, "secondarygadgetattachment" ) then
		local f83_local4 = CoD.CACUtility.GetItemEquippedInSlot( "secondarygadget", f83_arg0, f83_arg1 )
		local f83_local5 = CoD.CACUtility.GetItemName( "secondarygadget", f83_arg0, f83_arg1 )
		f83_local2 = "MPUI_EQUIP_TAKE_TWO"
		f83_local3 = f83_local5
		if f83_local4 <= CoD.CACUtility.EmptyItemIndex or not Engine.GadgetHasTakeTwoAttachment( f83_local4 ) then
			f83_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			f83_local2 = "MPUI_TAKE_TWO_NOT_AVAILABLE"
		end
	elseif LUI.startswith( f83_arg2, "bonuscard" ) then
		f83_local2 = "MPUI_EQUIP_WILDCARD"
	elseif LUI.startswith( f83_arg2, "cybercom_tacrig" ) then
		f83_local2 = "MPUI_EQUIP_TACRIG"
	end
	return f83_local0, f83_local1, f83_local2, f83_local3
end

CoD.CACUtility.GetNextAvailablePrimaryGunfighter = function ( f84_arg0 )
	if f84_arg0 then
		for f84_local3, f84_local4 in ipairs( CoD.CACUtility.PrimaryGunfighterWildcards ) do
			if not CoD.CACUtility.IsBonusCardEquipped( f84_local4, f84_arg0 ) then
				return f84_local4
			end
		end
	end
	return ""
end

CoD.CACUtility.WildcardNeededForSlot = function ( f85_arg0, f85_arg1 )
	local f85_local0 = CoD.perController[f85_arg0].classModel
	local f85_local1 = nil
	local f85_local2 = false
	local f85_local3 = true
	if f85_arg1 == "specialty4" then
		f85_local1 = "bonuscard_perk_1_greed"
		f85_local2 = true
		f85_local3 = IsNonAttachmentItemLocked( f85_arg0, f85_local1 )
	elseif f85_arg1 == "specialty5" then
		f85_local1 = "bonuscard_perk_2_greed"
		f85_local2 = true
		f85_local3 = IsNonAttachmentItemLocked( f85_arg0, f85_local1 )
	elseif f85_arg1 == "specialty6" then
		f85_local1 = "bonuscard_perk_3_greed"
		f85_local2 = true
		f85_local3 = IsNonAttachmentItemLocked( f85_arg0, f85_local1 )
	elseif f85_arg1 == "primaryattachment4" or f85_arg1 == "primaryattachment5" or f85_arg1 == "primaryattachment6" then
		f85_local1 = CoD.CACUtility.GetNextAvailablePrimaryGunfighter( f85_local0 )
		f85_local2 = CoD.CACUtility.ItemEquippedInSlot( "primary", f85_arg0, f85_local0 )
		f85_local3 = IsNonAttachmentItemLocked( f85_arg0, f85_local1 )
	elseif f85_arg1 == "secondaryattachment3" then
		local f85_local4 = Engine.GetNumAttachments( CoD.CACUtility.GetItemEquippedInSlot( "secondary", f85_arg0, f85_local0 ) )
		f85_local1 = "bonuscard_secondary_gunfighter"
		if f85_local4 > 1 then
			f85_local2 = CoD.CACUtility.ItemEquippedInSlot( "secondary", f85_arg0, f85_local0 )
		else
			f85_local2 = false
		end
		f85_local3 = IsNonAttachmentItemLocked( f85_arg0, f85_local1 )
	elseif f85_arg1 == "primarygadgetattachment1" then
		f85_local1 = "bonuscard_danger_close"
		f85_local2 = CoD.CACUtility.ItemEquippedInSlot( "primarygadget", f85_arg0, f85_local0 )
		f85_local3 = IsNonAttachmentItemLocked( f85_arg0, f85_local1 )
	end
	return f85_local1, f85_local2, f85_local3
end

CoD.CACUtility.UpdateGrenadeNames = function ( f86_arg0, f86_arg1, f86_arg2 )
	local f86_local0 = function ( f87_arg0 )
		local f87_local0 = Engine.CreateModel( f86_arg2, f87_arg0 .. ".modifiedName" )
		if CoD.CACUtility.ItemEquippedInSlot( f87_arg0, f86_arg0, f86_arg2 ) then
			local f87_local1 = Engine.GetModel( f86_arg2, f87_arg0 .. ".name" )
			if f87_local1 and f87_local0 then
				local f87_local2 = Engine.GetModelValue( f87_local1 )
				if CoD.CACUtility.ItemEquippedInSlot( f87_arg0 .. "attachment1", f86_arg0, f86_arg2 ) then
					f87_local2 = Engine.Localize( "MPUI_X2_GRENADE", f87_local2 )
				end
				Engine.SetModelValue( f87_local0, f87_local2 )
			end
		else
			Engine.SetModelValue( f87_local0, "" )
		end
	end
	
	f86_local0( "primarygadget" )
	f86_local0( "secondarygadget" )
end

CoD.CACUtility.UpdateEmptySlotImages = function ( f88_arg0, f88_arg1, f88_arg2 )
	local f88_local0 = Engine.GetCustomClass( f88_arg0, f88_arg1 )
	local f88_local1 = CoD.CACUtility.IsBonusCardEquippedByName( f88_local0, "bonuscard_overkill" )
	local f88_local2 = CoD.CACUtility.IsBonusCardEquippedByName( f88_local0, "bonuscard_two_tacticals" )
	for f88_local7, f88_local6 in pairs( CoD.CACUtility.emptyImageSlotList ) do
		local f88_local8 = Engine.GetModel( f88_arg2, f88_local7 )
		if f88_local8 then
			if f88_local7 == "secondary" and f88_local1 == true then
				f88_local6 = CoD.CACUtility.emptyImageSlotList.primary
			elseif LUI.startswith( f88_local7, "primarygadget" ) and f88_local2 == true then
				f88_local6 = CoD.CACUtility.emptyImageSlotList.secondarygadget
			end
			Engine.SetModelValue( Engine.CreateModel( f88_local8, "emptyImage" ), f88_local6 )
		end
	end
end

CoD.CACUtility.GetCustomClassModel = function ( f89_arg0, f89_arg1, f89_arg2 )
	Engine.GetCustomClassModel( f89_arg0, f89_arg1, f89_arg2 )
	Engine.SetModelValue( Engine.CreateModel( f89_arg2, "classNum" ), f89_arg1 )
	if CoD.perController[f89_arg0].isPreset == true then
		local f89_local0 = Engine.GetModel( f89_arg2, "customClassName" )
		Engine.SetModelValue( f89_local0, Engine.Localize( Engine.GetModelValue( f89_local0 ) ) )
	end
	if IsCampaign() and f89_arg1 >= 5 and f89_arg1 <= 8 then
		Engine.SetModelValue( Engine.GetModel( f89_arg2, "customClassName" ), Engine.Localize( "CPUI_FIELD_OPS_KIT" ) )
	end
	if f89_arg1 >= 10 then
		Engine.SetModelValue( Engine.CreateModel( f89_arg2, "defaultClassName" ), Engine.GetDefaultClassName( f89_arg1 - 10 ) )
	end
	CoD.CACUtility.UpdateHeaderNames( f89_arg0, f89_arg1, f89_arg2 )
	local f89_local0 = function ( f90_arg0 )
		local f90_local0 = Engine.GetModel( f89_arg2, f90_arg0 .. "gunsmithvariant" )
		if f90_local0 then
			local f90_local1 = Engine.CreateModel( f89_arg2, f90_arg0 .. ".variantName" )
			local f90_local2 = Engine.GetModelValue( Engine.GetModel( f90_local0, "itemIndex" ) )
			if f90_local2 > CoD.CACUtility.EmptyItemIndex then
				local f90_local3 = CoD.CraftUtility.Gunsmith.GetVariantIndexFromCACVaraintIndex( f89_arg0, f90_local2 )
				if f90_local3 then
					Engine.SetModelValue( f90_local1, f90_local3.variantName )
				end
			else
				Engine.SetModelValue( f90_local1, "" )
			end
		end
	end
	
	if not Engine.IsInGame() then
		f89_local0( "primary" )
		f89_local0( "secondary" )
	end
	local f89_local1 = function ( f91_arg0 )
		local f91_local0 = Engine.GetModel( f89_arg2, f91_arg0 )
		if not f91_local0 then
			return 
		end
		local f91_local1 = Engine.GetModel( f91_local0, "image" )
		if f91_local1 then
			local f91_local2 = Engine.GetModelValue( f91_local1 )
			if f91_local2 and f91_local2 ~= CoD.CACUtility.DefaultLoadoutImage then
				Engine.SetModelValue( f91_local1, f91_local2 )
			end
		end
	end
	
	f89_local1( "primary" )
	f89_local1( "secondary" )
	local f89_local2 = function ( f92_arg0, f92_arg1, f92_arg2 )
		for f92_local4, f92_local5 in ipairs( f92_arg1 ) do
			local f92_local6 = Engine.GetModelValue( Engine.GetModel( f89_arg2, f92_local5 .. ".itemIndex" ) )
			if f92_local6 > CoD.CACUtility.EmptyItemIndex and Engine.GetModelValue( Engine.GetModel( f89_arg2, f92_arg2[f92_local4] .. ".itemIndex" ) ) > CoD.CACUtility.EmptyItemIndex then
				local f92_local3 = Engine.GetAttachmentCosmeticVariant( Engine.GetWeaponString( f89_arg0, f89_arg1, f92_arg0 ), Engine.GetItemAttachment( Engine.GetModelValue( Engine.GetModel( f89_arg2, f92_arg0 .. ".itemIndex" ) ), f92_local6 ) )
				if f92_local3 then
					Engine.SetModelValue( Engine.GetModel( f89_arg2, f92_local5 .. ".image" ), f92_local3.image )
					Engine.SetModelValue( Engine.GetModel( f89_arg2, f92_local5 .. "cosmeticvariant.image" ), f92_local3.image )
					Engine.SetModelValue( Engine.GetModel( f89_arg2, f92_local5 .. ".name" ), f92_local3.name )
					Engine.SetModelValue( Engine.GetModel( f89_arg2, f92_local5 .. "cosmeticvariant.name" ), f92_local3.name )
				end
			end
		end
	end
	
	f89_local2( "primary", CoD.CACUtility.PrimaryAttachmentSlotNameList, CoD.CACUtility.PrimaryAttachmentCVSlotNameList )
	f89_local2( "secondary", CoD.CACUtility.SecondaryAttachmentSlotNameList, CoD.CACUtility.SecondaryAttachmentCVSlotNameList )
	CoD.CACUtility.AddBigImagesToCustomClassModel( f89_arg0, f89_arg2, "primary", "_big" )
	CoD.CACUtility.AddBigImagesToCustomClassModel( f89_arg0, f89_arg2, "secondary", "_big" )
	CoD.CACUtility.AddBigImagesToCustomClassModel( f89_arg0, f89_arg2, "primarygadget", "_256" )
	CoD.CACUtility.AddBigImagesToCustomClassModel( f89_arg0, f89_arg2, "secondarygadget", "_256" )
	CoD.CACUtility.AddBigImagesToCustomClassModel( f89_arg0, f89_arg2, "specialgadget", "_256" )
	DataSources.CustomClassMenu.updateWeaponAttachmentList( f89_arg0, f89_arg2, "primary", CoD.CACUtility.maxPrimaryAttachments )
	DataSources.CustomClassMenu.updateWeaponAttachmentList( f89_arg0, f89_arg2, "secondary", CoD.CACUtility.maxSecondaryAttachments )
	DataSources.CustomClassMenu.updateCustomSlotModel( f89_arg2, "primarygadget", f89_arg0 )
	DataSources.CustomClassMenu.updateCustomSlotModel( f89_arg2, "secondarygadget", f89_arg0 )
	CoD.CACUtility.UpdateGrenadeNames( f89_arg0, f89_arg1, f89_arg2 )
	CoD.CACUtility.UpdateEmptySlotImages( f89_arg0, f89_arg1, f89_arg2 )
	for f89_local11, f89_local12 in ipairs( CoD.CACUtility.loadoutSlotOrder ) do
		local f89_local13 = Engine.GetModel( f89_arg2, f89_local12 )
		if f89_local13 then
			local f89_local6 = Engine.CreateModel( f89_local13, "hintText" )
			if f89_local6 then
				local f89_local7, f89_local8, f89_local9, f89_local10 = CoD.CACUtility.GetCACSlotStatus( f89_arg0, f89_arg2, f89_local12 )
				if f89_local10 ~= nil then
					Engine.SetModelValue( f89_local6, Engine.Localize( f89_local9, f89_local10 ) )
				else
					Engine.SetModelValue( f89_local6, Engine.Localize( f89_local9 ) )
				end
			end
		end
	end
end

CoD.CACUtility.UpdateWeaponOptions = function ( f93_arg0, f93_arg1 )
	local f93_local0 = CoD.perController[f93_arg0].weaponCategory
	local f93_local1 = Engine.GetModelForController( f93_arg0 )
	local f93_local2 = function ( f94_arg0, f94_arg1, f94_arg2 )
		local f94_local0 = Engine.GetModelForController( f94_arg0 )
		for f94_local1 = 0, #CoD.CACUtility.weaponOptionGroupNames - 1, 1 do
			local f94_local4 = CoD.CACUtility.weaponOptionGroupNames[f94_local1]
			local f94_local5 = f94_arg2 .. f94_local4
			local f94_local6 = Engine.GetModel( f94_arg1, f94_local5 .. ".itemIndex" )
			if f94_local6 then
				local f94_local7 = Engine.GetModel( f94_local0, "WeaponOptions." .. f94_local4 .. "." .. Engine.GetModelValue( f94_local6 ) )
				if f94_local7 then
					local f94_local8 = Engine.GetModel( f94_arg1, f94_local5 .. ".name" )
					local f94_local9 = Engine.GetModel( f94_arg1, f94_local5 .. ".image" )
					if f94_local8 and f94_local9 then
						Engine.SetModelValue( f94_local8, Engine.GetModelValue( Engine.GetModel( f94_local7, "name" ) ) )
						Engine.SetModelValue( f94_local9, Engine.GetModelValue( Engine.GetModel( f94_local7, "image" ) ) )
					end
				end
			end
		end
	end
	
	f93_local2( f93_arg0, f93_arg1, "primary" )
	f93_local2( f93_arg0, f93_arg1, "secondary" )
	CoD.CACUtility.UpdateWeaponCustomizationCategoryList( f93_arg0, f93_arg1 )
end

CoD.CACUtility.UpdateAttachmentCosmeticVariants = function ( f95_arg0, f95_arg1 )
	local f95_local0 = function ( f96_arg0, f96_arg1 )
		for f96_local15, f96_local16 in pairs( f96_arg1 ) do
			local f96_local17 = f96_local16 .. "cosmeticvariant"
			local f96_local18 = Engine.GetModel( f96_arg0, f96_local16 )
			local f96_local19 = Engine.GetModel( f96_arg0, f96_local17 )
			if f96_local19 and f96_local18 then
				local f96_local3 = Engine.GetModel( f96_local19, "itemIndex" )
				local f96_local4 = Engine.GetModel( f96_local18, "itemIndex" )
				if f96_local3 and f96_local4 then
					local f96_local5 = Engine.GetModelValue( f96_local3 )
					if f96_local5 > 0 and Engine.GetModelValue( f96_local4 ) > 0 then
						local f96_local6 = Engine.GetModel( f96_local19, "name" )
						local f96_local7 = Engine.GetModel( f96_local19, "image" )
						local f96_local8 = Engine.GetModel( f96_local19, "ref" )
						local f96_local9 = Engine.GetModel( f96_local18, "ref" )
						if f96_local6 and f96_local7 and f96_local8 and f96_local9 then
							local f96_local10 = Engine.GetModelValue( f96_local9 )
							if CoD.WC_Category.ACV.attachmentTable[f96_local10] then
								local f96_local11 = CoD.WC_Category.ACV.attachmentTable[f96_local10].variants[f96_local5]
								local f96_local12 = Engine.SetModelValue
								local f96_local13 = f96_local6
								local f96_local14
								if f96_local11 then
									f96_local14 = f96_local11.name
									if not f96_local14 then
									
									else
										f96_local12( f96_local13, f96_local14 )
										f96_local12 = Engine.SetModelValue
										f96_local13 = f96_local7
										if f96_local11 then
											f96_local14 = f96_local11.image
											if not f96_local14 then
											
											else
												f96_local12( f96_local13, f96_local14 )
												Engine.SetModelValue( f96_local8, f96_local10 )
											end
										end
										f96_local14 = ""
									end
								end
								f96_local14 = ""
							end
						end
					end
				end
			end
		end
	end
	
	f95_local0( f95_arg1, CoD.CACUtility.PrimaryAttachmentSlotNameList )
	f95_local0( f95_arg1, CoD.CACUtility.SecondaryAttachmentSlotNameList )
	CoD.CACUtility.UpdateWeaponCustomizationCategoryList( f95_arg0, f95_arg1 )
end

CoD.CACUtility.UpdateWeaponCustomizationCategoryList = function ( f97_arg0, f97_arg1 )
	local f97_local0 = Engine.GetModelForController( f97_arg0 )
	local f97_local1 = CoD.perController[f97_arg0].weaponCategory
	local f97_local2 = Engine.GetModel( f97_local0, "WeaponCustomizationCategory" )
	if f97_local2 then
		for f97_local3 = 1, CoD.CACUtility.maxWeaponCustomizationCategories, 1 do
			local f97_local6 = Engine.GetModel( f97_local2, f97_local3 )
			if f97_local6 then
				local f97_local7 = Engine.GetModel( f97_local6, "type" )
				if f97_local7 then
					local f97_local8 = Engine.GetModelValue( f97_local7 )
					if f97_local8 == "paintjob" then
						local f97_local9 = Engine.GetModelValue( Engine.GetModel( f97_arg1, f97_local1 .. "paintjobindex.itemIndex" ) )
						Engine.SetModelValue( Engine.GetModel( f97_local6, "paintjobIndex" ), f97_local9 )
						local f97_local10 = Engine.GetModelValue( Engine.GetModel( f97_arg1, f97_local1 .. "paintjobslot.itemIndex" ) )
						Engine.SetModelValue( Engine.GetModel( f97_local6, "paintjobSlot" ), f97_local10 )
						Engine.SetModelValue( Engine.GetModel( f97_local6, "paintjobSlotAndIndex" ), f97_local10 .. " " .. f97_local9 )
					end
					local f97_local11 = Engine.GetModel( f97_arg1, f97_local1 .. f97_local8 )
					local f97_local9 = Engine.GetModel( f97_local6, "attachmentIndex" )
					if f97_local11 then
						local f97_local12 = Engine.GetModelValue( Engine.GetModel( f97_local11, "name" ) )
						local f97_local10 = Engine.GetModelValue( Engine.GetModel( f97_local11, "image" ) )
						Engine.SetModelValue( Engine.GetModel( f97_local6, "name" ), f97_local12 )
						Engine.SetModelValue( Engine.GetModel( f97_local6, "image" ), f97_local10 )
					end
					if f97_local9 then
						local f97_local10 = f97_local1 .. "attachment" .. Engine.GetModelValue( f97_local9 ) .. "cosmeticvariant"
						local f97_local13 = Engine.GetModelValue( Engine.GetModel( f97_arg1, f97_local10 .. ".name" ) )
						local f97_local14 = Engine.GetModelValue( Engine.GetModel( f97_arg1, f97_local10 .. ".image" ) )
						Engine.SetModelValue( Engine.GetModel( f97_local6, "name" ), f97_local13 )
						Engine.SetModelValue( Engine.GetModel( f97_local6, "image" ), f97_local14 )
					end
				end
			end
		end
	end
end

CoD.CACUtility.UpdateAllClasses = function ( f98_arg0 )
	local f98_local0 = Engine.GetCustomClassCount( f98_arg0 )
	local f98_local1 = Engine.GetModel( Engine.GetModelForController( f98_arg0 ), "CustomClassList" )
	for f98_local2 = 1, f98_local0, 1 do
		CoD.CACUtility.GetCustomClassModel( f98_arg0, f98_local2 - 1, Engine.GetModel( f98_local1, "class" .. f98_local2 ) )
	end
end

CoD.CACUtility.GetWeaponOptionsFromClass = function ( f99_arg0, f99_arg1, f99_arg2 )
	if not f99_arg1 then
		f99_arg1 = CoD.perController[f99_arg0].classModel
	end
	local f99_local0 = Engine.GetModel( f99_arg1, f99_arg2 .. "camo.itemIndex" )
	local f99_local1 = Engine.GetModel( f99_arg1, f99_arg2 .. "reticle.itemIndex" )
	local f99_local2 = Engine.GetModel( f99_arg1, f99_arg2 .. "paintjobslot.itemIndex" )
	local f99_local3 = Engine.GetModel( f99_arg1, f99_arg2 .. "paintjobindex.itemIndex" )
	local f99_local4 = "0"
	local f99_local5 = "0"
	if f99_local0 then
		f99_local4 = Engine.GetModelValue( f99_local0 )
	end
	if f99_local1 then
		f99_local5 = Engine.GetModelValue( f99_local1 )
	end
	if IsLive() and f99_local2 and f99_local3 then
		Engine.SetupPaintjobData( f99_arg0, Engine.GetModelValue( f99_local2 ), Engine.GetModelValue( f99_local3 ) )
	end
	return f99_local4 .. "," .. f99_local5 .. ",1"
end

CoD.CACUtility.EmptyWeaponOptions = function ()
	return "0" .. "," .. "0" .. ",0"
end

CoD.CACUtility.GetAttachmentCosmeticVariantsFromClass = function ( f101_arg0, f101_arg1, f101_arg2 )
	if not f101_arg1 then
		f101_arg1 = CoD.perController[f101_arg0].classModel
	end
	local f101_local0 = ""
	local f101_local1 = CoD.CACUtility.GetAttachmentVariantForAttachmentList( f101_arg1, f101_arg2 )
	for f101_local2 = 1, #f101_local1, 1 do
		f101_local0 = f101_local0 .. f101_local1[f101_local2].ref .. "," .. f101_local1[f101_local2].attachmentIndex .. ","
	end
	return f101_local0
end

CoD.CACUtility.GetWeaponOptionsFromVariantInfo = function ( f102_arg0, f102_arg1 )
	local f102_local0 = "0"
	local f102_local1 = "0"
	if f102_arg1.camoIndex then
		f102_local0 = f102_arg1.camoIndex
	end
	if f102_arg1.reticleIndex then
		f102_local1 = f102_arg1.reticleIndex
	end
	if f102_arg1.paintjobSlot and f102_arg1.paintjobIndex then
		Engine.SetupPaintjobData( f102_arg0, f102_arg1.paintjobSlot, f102_arg1.paintjobIndex )
	end
	return f102_local0 .. "," .. f102_local1 .. ",1"
end

CoD.CACUtility.GetAttachmentCosmeticVariantsFromVariantInfo = function ( f103_arg0 )
	local f103_local0 = ""
	for f103_local4, f103_local5 in ipairs( f103_arg0.attachmentVariant ) do
		local f103_local6 = f103_arg0.attachment[f103_local4]
		if f103_local6 > CoD.CACUtility.EmptyItemIndex then
			f103_local0 = f103_local0 .. Engine.GetAttachmentRefByIndex( f103_local6 ) .. "," .. f103_local5 .. ","
		end
	end
	return f103_local0
end

CoD.CACUtility.GetBaseWeaponLoadoutSlotName = function ( f104_arg0 )
	local f104_local0 = nil
	if f104_arg0 == "primary" or f104_arg0 == "secondary" or f104_arg0 == "primarygadget" or f104_arg0 == "secondarygadget" or f104_arg0 == "cybercore" or LUI.startswith( f104_arg0, "specialty" ) or LUI.startswith( f104_arg0, "bonuscard" ) then
		f104_local0 = f104_arg0
	elseif LUI.startswith( f104_arg0, "primaryattachment" ) then
		f104_local0 = "primary"
	elseif LUI.startswith( f104_arg0, "secondaryattachment" ) then
		f104_local0 = "secondary"
	elseif LUI.startswith( f104_arg0, "primarygadgetattachment" ) then
		f104_local0 = "primarygadget"
	elseif LUI.startswith( f104_arg0, "secondarygadgetattachment" ) then
		f104_local0 = "secondarygadget"
	elseif LUI.startswith( f104_arg0, "cybercom_" ) then
		f104_local0 = "cybercom"
	end
	return f104_local0
end

CoD.CACUtility.GetGunLevelWeaponIndex = function ( f105_arg0, f105_arg1 )
	local f105_local0 = CoD.perController[f105_arg0].classModel
	local f105_local1 = CoD.perController[f105_arg0].weaponCategory
	local f105_local2 = CoD.perController[f105_arg0].weaponSlot
	if f105_local1 and (LUI.startswith( f105_local1, "primaryattachment" ) or LUI.startswith( f105_local1, "secondaryattachment" )) then
		if f105_local2 then
			local f105_local3 = Engine.GetModel( f105_local0, f105_local2 .. ".itemIndex" )
			if f105_local3 then
				return Engine.GetModelValue( f105_local3 )
			end
		end
	elseif f105_arg1 then
		local f105_local3 = f105_arg1:getModel( f105_arg0, "itemIndex" )
		if f105_local3 then
			return Engine.GetModelValue( f105_local3 )
		end
		local f105_local4 = f105_arg1:getModel( f105_arg0, "weaponIndex" )
		if f105_local4 then
			return Engine.GetModelValue( f105_local4 )
		end
	end
	return CoD.CACUtility.EmptyItemIndex
end

CoD.CACUtility.AttachmentEquippedInCACSlot = function ( f106_arg0, f106_arg1, f106_arg2 )
	local f106_local0 = CoD.perController[f106_arg0].classModel
	local f106_local1 = CoD.CACUtility.PrimaryAttachmentSlotNameList
	if f106_arg1 == "secondary" then
		f106_local1 = CoD.CACUtility.SecondaryAttachmentSlotNameList
	end
	for f106_local5, f106_local6 in ipairs( f106_local1 ) do
		if Engine.GetModelValue( Engine.GetModel( f106_local0, f106_local6 .. ".itemIndex" ) ) == f106_arg2 then
			return f106_local5
		end
	end
end

CoD.CACUtility.ValidateWeaponVariantForClass = function ( f107_arg0, f107_arg1 )
	local f107_local0 = CoD.perController[f107_arg0].classNum
	local f107_local1 = function ( f108_arg0, f108_arg1 )
		local f108_local0 = Engine.GetModelValue( Engine.GetModel( f107_arg1, f108_arg0 .. "gunsmithvariant.itemIndex" ) )
		if f108_local0 > CoD.CACUtility.EmptyItemIndex then
			local f108_local1 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f107_arg0, f108_local0 - 1 )
			local f108_local2 = false
			if Engine.GetModelValue( Engine.GetModel( f107_arg1, f108_arg0 .. ".itemIndex" ) ) == f108_local1.weaponIndex then
				for f108_local12, f108_local13 in ipairs( f108_local1.attachment ) do
					local f108_local9 = false
					local f108_local14 = Engine.GetAttachmentIndexByAttachmentTableIndex( f108_local1.weaponIndex, f108_local13 )
					if f108_local14 > CoD.CACUtility.EmptyItemIndex then
						for f108_local10, f108_local11 in ipairs( f108_arg1 ) do
							if f108_local14 == Engine.GetModelValue( Engine.GetModel( f107_arg1, f108_local11 .. ".itemIndex" ) ) then
								f108_local9 = true
								break
							end
						end
						if not f108_local9 then
							f108_local2 = true
						end
					end
				end
				if not f108_local2 and Engine.GetModelValue( Engine.GetModel( f107_arg1, f108_arg0 .. "camo.itemIndex" ) ) ~= f108_local1.camoIndex then
					f108_local2 = true
				end
			end
			if f108_local2 then
				CoD.SetClassItem( f107_arg0, f107_local0, f108_arg0 .. "gunsmithvariant", CoD.CACUtility.EmptyItemIndex )
			end
		end
	end
	
	f107_local1( "primary", CoD.CACUtility.PrimaryAttachmentSlotNameList )
	f107_local1( "secondary", CoD.CACUtility.SecondaryAttachmentSlotNameList )
end

CoD.CACUtility.CreateUnlockTokenModels = function ( f109_arg0 )
	if not CoD.CACUtility.unlockTokenModel[f109_arg0] then
		CoD.CACUtility.unlockTokenModel[f109_arg0] = Engine.CreateModel( Engine.GetModelForController( f109_arg0 ), "UnlockTokenInfo" )
		Engine.CreateModel( CoD.CACUtility.unlockTokenModel[f109_arg0], "itemIndex" )
		local f109_local0 = Engine.CreateModel( CoD.CACUtility.unlockTokenModel[f109_arg0], "xpBarInfo" )
		Engine.CreateModel( f109_local0, "rankXP" )
		Engine.CreateModel( f109_local0, "xpEarned" )
		Engine.CreateModel( f109_local0, "xpNeeded" )
		Engine.CreateModel( f109_local0, "currLevel" )
		Engine.CreateModel( f109_local0, "currLevelIcon" )
		Engine.CreateModel( f109_local0, "nextLevel" )
		Engine.CreateModel( f109_local0, "nextLevelIcon" )
	end
	local f109_local0 = Engine.GetModel( Engine.GetModelForController( f109_arg0 ), "unlockTokensCount" )
	local f109_local1 = "weapon_smg"
	local f109_local2 = CoD.CCUtility.customizationMode
	if f109_local2 then
		Engine.SetModelValue( f109_local0, Engine.GetCurrentTokens( f109_arg0, f109_local1, f109_local2 ) )
	else
		Engine.SetModelValue( f109_local0, Engine.GetCurrentTokens( f109_arg0, f109_local1 ) )
	end
end

CoD.CACUtility.GetPerkXModel = function ( f110_arg0 )
	return "p7_perk_" .. Engine.GetItemImage( f110_arg0 )
end

CoD.CACUtility.GetBonuscardXModel = function ( f111_arg0 )
	return "p7_" .. Engine.GetItemRef( f111_arg0 )
end

CoD.CACUtility.GetCybercoreXModel = function ( f112_arg0 )
	return "p7_core_" .. Engine.GetItemImage( f112_arg0 )
end

CoD.CACUtility.WeaponSelectFocusOnLastSelectedWeapon = function ( f113_arg0, f113_arg1 )
	local f113_local0 = DataSources.Unlockables:getCurrentFilterItem()
	if f113_arg0.weaponList.activeWidget then
		local f113_local1 = f113_arg0.weaponList.activeWidget.gridInfoTable.zeroBasedIndex + 1
		if f113_arg0.lastSelectionTable and f113_arg0.lastSelectionTable[f113_local0] then
			f113_arg0.lastSelectionTable[f113_local0] = f113_local1
		end
	end
end

CoD.CACUtility.WeaponSelectFocusOnLastSelectedCategory = function ( f114_arg0, f114_arg1, f114_arg2 )
	if not f114_arg1 then
		return 
	end
	local f114_local0 = f114_arg1.filter
	if not f114_local0 then
		f114_local0 = DataSources.Unlockables:getCurrentFilterItem()
	end
	DataSources.Unlockables.setCurrentFilterItem( f114_local0 )
	f114_arg0.weaponList:updateDataSource( true )
	if not f114_arg0.performingSetup then
		local f114_local1 = 1
		if f114_arg0.lastSelectionTable and f114_arg0.lastSelectionTable[f114_local0] then
			f114_local1 = f114_arg0.lastSelectionTable[f114_local0]
		end
		local f114_local2 = f114_arg0.weaponList:getItemAt( f114_local1 )
		if f114_local2 then
			f114_arg0.weaponList:setActiveItem( f114_local2, 0, true, true )
		end
	end
end

CoD.CACUtility.SetCACMenuHeroInfoModels = function ( f115_arg0 )
	local f115_local0 = Engine.CurrentSessionMode()
	local f115_local1 = Engine.GetEquippedHero( f115_arg0, f115_local0 )
	local f115_local2 = Engine.GetEquippedHeroInfo( f115_arg0, f115_local0 )
	if f115_local2 and f115_local1 then
		local f115_local3 = Engine.GetLoadoutTypeForHero( f115_arg0, f115_local1 )
		if f115_local3 then
			local f115_local4 = Engine.GetModel( Engine.GetModelForController( f115_arg0 ), "CACMenu" )
			if f115_local4 then
				local f115_local5 = f115_local2.defaultHeroRender
				if f115_local3 == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET then
					f115_local5 = f115_local2.defaultHeroRenderAbility
				end
				Engine.SetModelValue( Engine.GetModel( f115_local4, "currentHeroImage" ), f115_local5 )
				Engine.SetModelValue( Engine.GetModel( f115_local4, "currentHeroName" ), f115_local2.displayName )
			end
			local f115_local5 = Engine.GetLoadoutInfoForHero( f115_local0, f115_local1, f115_local3 )
			if f115_local5 then
				Engine.SetModelValue( Engine.GetModel( f115_local4, "currentHeroLoadout" ), Engine.Localize( f115_local5.itemName ) )
			end
		end
	end
end

CoD.CACUtility.UpgradeEquippedCACItems = function ( f116_arg0, f116_arg1, f116_arg2, f116_arg3 )
	local f116_local0 = Engine.GetModel( Engine.GetModelForController( f116_arg0 ), "CustomClassList" )
	for f116_local1 = 1, Engine.GetCustomClassCount( f116_arg0 ), 1 do
		local f116_local4 = f116_local1 - 1
		local f116_local5 = Engine.GetModel( f116_local0, "class" .. f116_local1 )
		local f116_local6 = CoD.CACUtility.GetMutuallyExclusiveSlotName( f116_arg1, f116_arg0, f116_arg2, f116_local5 )
		local f116_local7 = function ( f117_arg0 )
			if f117_arg0 ~= nil then
				local f117_local0 = Engine.GetModel( f116_local5, f117_arg0 )
				if f117_local0 then
					local f117_local1 = Engine.GetModel( f117_local0, "itemIndex" )
					if f117_local1 and Engine.GetModelValue( f117_local1 ) == f116_arg2 then
						CoD.SetClassItem( f116_arg0, f116_local4, f117_arg0, f116_arg3 )
					end
				end
			end
		end
		
		f116_local7( f116_arg1 )
		for f116_local8 = 1, #f116_local6, 1 do
			local f116_local11 = f116_local6[f116_local8]
			if mutuallyExclusiveSlot ~= "" then
				f116_local7( mutuallyExclusiveSlot )
			end
		end
	end
end

CoD.CACUtility.GetAllItems = function ( f118_arg0, f118_arg1 )
	if f118_arg0 ~= true and CoD.CACUtility.Items then
		return unpack( CoD.CACUtility.Items )
	end
	local f118_local0 = {}
	for f118_local1 = 0, 43, 1 do
		f118_local0[f118_local1] = {
			index = f118_local1,
			desc = Engine.GetAttachmentDescByAttachmentIndex( f118_local1 ),
			name = Engine.GetAttachmentNameByIndex( f118_local1 ),
			image = Engine.GetAttachmentImageByIndex( f118_local1 ),
			isOptic = Engine.IsOpticByAttachmentIndex( f118_local1 ),
			items = {}
		}
	end
	local f118_local1 = {}
	for f118_local2 = 0, 255, 1 do
		if Engine.ItemIndexValid( f118_local2 ) then
			local f118_local5 = Engine.GetUnlockableInfoByIndex( f118_local2 )
			if f118_local5.allocation >= 0 then
				local f118_local6 = {
					index = f118_local2,
					name = f118_local5.name,
					image = f118_local5.image,
					groupIndex = f118_local5.groupIndex,
					groupName = f118_local5.group,
					loadoutSlot = f118_local5.loadoutSlot,
					loadoutSlotIndex = f118_local5.loadoutSlotIndex,
					unlockLevel = f118_local5.unlockLevel,
					momentum = f118_local5.momentum,
					restrictionState = f118_local5.restrictionState,
					allocation = f118_local5.allocation
				}
				if LuaUtils.StartsWith( f118_local6.loadoutSlot, "hero" ) or f118_local6.loadoutSlot == "specialgadget" then
					f118_local6.image = f118_local5.image .. "_large"
				end
				if LuaUtils.StartsWith( f118_local6.loadoutSlot, "killstreak" ) then
					f118_local6.image = f118_local5.image .. "_menu"
				end
				if f118_local6.loadoutSlot == "primary" or f118_local6.loadoutSlot == "secondary" then
					local f118_local7 = Engine.GetNumAttachments( f118_local2 )
					if f118_local7 > 0 then
						f118_local6.attachments = {}
						for f118_local8 = 0, f118_local7 - 1, 1 do
							local f118_local11 = Engine.GetItemAttachment( f118_local2, f118_local8 )
							if f118_local11 > CoD.CACUtility.EmptyItemIndex then
								f118_local6.attachments[f118_local11] = {
									attachmentIndex = f118_local11,
									restrictionState = Engine.GetAttachmentRestrictionState( f118_local11, f118_local2, false )
								}
								table.insert( f118_local0[f118_local11].items, {
									itemIndex = f118_local2
								} )
							end
						end
					end
				end
				f118_local1[f118_local2] = f118_local6
			end
		end
	end
	if f118_arg1 == true then
		local f118_local2 = function ( f119_arg0, f119_arg1 )
			if f118_local0[f119_arg0].isOptic and f118_local0[f119_arg1].isOptic then
				return Engine.Localize( f118_local0[f119_arg0].name ) < Engine.Localize( f118_local0[f119_arg1].name )
			elseif f118_local0[f119_arg0].isOptic ~= f118_local0[f119_arg1].isOptic then
				return f118_local0[f119_arg0].isOptic
			else
				return Engine.Localize( f118_local0[f119_arg0].name ) < Engine.Localize( f118_local0[f119_arg1].name )
			end
		end
		
		local f118_local3 = {}
		for f118_local6, f118_local7 in LUI.IterateTableBySortedKeys( f118_local0, f118_local2, nil ) do
			f118_local3[f118_local7.index] = f118_local7
		end
		f118_local4 = Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER )
		f118_local12 = function ( f120_arg0, f120_arg1 )
			if LuaUtils.StartsWith( f118_local1[f120_arg0].loadoutSlot, "hero" ) or f118_local1[f120_arg0].loadoutSlot == "specialgadget" or LuaUtils.StartsWith( f118_local1[f120_arg1].loadoutSlot, "hero" ) or f118_local1[f120_arg1].loadoutSlot == "specialgadget" then
				local f120_local0 = -1
				local f120_local1 = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_INVALID
				local f120_local2 = -1
				local f120_local3 = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_INVALID
				for f120_local7, f120_local8 in ipairs( f118_local4 ) do
					local f120_local9 = Engine.GetLoadoutItemIndexForHero( Engine.CurrentSessionMode(), f120_local7 - 1, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
					local f120_local10 = Engine.GetLoadoutItemIndexForHero( Engine.CurrentSessionMode(), f120_local7 - 1, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET )
					if f118_local1[f120_arg0].index == f120_local9 then
						f120_local0 = f120_local7
						f120_local1 = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON
					elseif f118_local1[f120_arg0].index == f120_local10 then
						f120_local0 = f120_local7
						f120_local1 = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET
					end
					if f118_local1[f120_arg1].index == f120_local9 then
						f120_local2 = f120_local7
						f120_local3 = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON
					end
					if f118_local1[f120_arg1].index == f120_local10 then
						f120_local2 = f120_local7
						f120_local3 = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET
					end
				end
				if f120_local0 == f120_local2 then
					return f120_local1 < f120_local3
				end
				return f120_local0 < f120_local2
			elseif LUI.startswith( f118_local1[f120_arg0].loadoutSlot, "killstreak" ) or LUI.startswith( f118_local1[f120_arg1].loadoutSlot, "killstreak" ) then
				return f118_local1[f120_arg0].momentum < f118_local1[f120_arg1].momentum
			elseif f118_local1[f120_arg0].groupIndex ~= f118_local1[f120_arg1].groupIndex then
				return f118_local1[f120_arg0].groupIndex < f118_local1[f120_arg1].groupIndex
			elseif f118_local1[f120_arg0].loadoutSlot == f118_local1[f120_arg1].loadoutSlot then
				return Engine.Localize( f118_local1[f120_arg0].name ) < Engine.Localize( f118_local1[f120_arg1].name )
			else
				return Engine.Localize( f118_local1[f120_arg0].loadoutSlot ) < Engine.Localize( f118_local1[f120_arg1].loadoutSlot )
			end
		end
		
		f118_local5 = {}
		for f118_local9, f118_local10 in LUI.IterateTableBySortedKeys( f118_local1, f118_local12, nil ) do
			f118_local5[f118_local9] = f118_local10
		end
		CoD.CACUtility.Items = {
			f118_local5,
			f118_local3
		}
		return unpack( CoD.CACUtility.Items )
	end
	CoD.CACUtility.Items = {
		f118_local1,
		f118_local0
	}
	return unpack( CoD.CACUtility.Items )
end

CoD.CACUtility.GetLoadout = function ( f121_arg0, f121_arg1 )
	local f121_local0 = {
		weapons = {},
		primaryAttachments = {},
		secondaryAttachments = {},
		equipment = {},
		perks = {},
		wildcards = {},
		other = {},
		streaks = {}
	}
	local f121_local1 = Engine.GetCustomClass( f121_arg0, f121_arg1 )
	for f121_local5, f121_local6 in pairs( f121_local1 ) do
		if LUI.startswith( f121_local5, "primaryattachment" ) then
			table.insert( f121_local0.primaryAttachments, Engine.GetItemAttachment( f121_local1.primary, f121_local6 ) )
		end
		if LUI.startswith( f121_local5, "secondaryattachment" ) then
			table.insert( f121_local0.secondaryAttachments, Engine.GetItemAttachment( f121_local1.secondary, f121_local6 ) )
		end
		if LUI.startswith( f121_local5, "killstreak" ) then
			f121_local0.streaks[f121_local5] = f121_local6
		end
		if LUI.startswith( f121_local5, "hero" ) or f121_local5 == "specialgadget" then
			f121_local0.heroItem = f121_local6
		end
		if LUI.startswith( f121_local5, "specialty" ) then
			f121_local0.perks[f121_local5] = f121_local6
		end
		if LUI.startswith( f121_local5, "bonuscard" ) then
			f121_local0.wildcards[f121_local5] = f121_local6
		end
		if f121_local5 == "primary" or f121_local5 == "secondary" then
			f121_local0.weapons[f121_local5] = f121_local6
		end
		if f121_local5 == "primarygadget" or f121_local5 == "secondarygadget" then
			f121_local0.equipment[f121_local5] = f121_local6
		else
			f121_local0.other[f121_local5] = f121_local6
		end
	end
	return f121_local0
end

CoD.CACUtility.GetFullLoadout = function ( f122_arg0 )
	local f122_local0 = {
		classes = {}
	}
	local f122_local1 = Engine.GetCustomClassCount( f122_arg0 )
	for f122_local2 = 0, f122_local1 - 1, 1 do
		local f122_local5 = CoD.CACUtility.GetLoadout( f122_arg0, f122_local2 )
		if f122_local0.streaks == nil then
			f122_local0.streaks = f122_local5.streaks
		end
		if f122_local0.heroItem == nil then
			f122_local0.heroItem = f122_local5.heroItem
		end
		table.insert( f122_local0.classes, f122_local5 )
	end
	return f122_local0
end

function AnyItemBanned( f123_arg0 )
	for f123_local3, f123_local4 in pairs( f123_arg0 ) do
		if Engine.GetItemVote( f123_local4 ) == Enum.VoteType.VOTE_TYPE_BAN then
			return true
		elseif Engine.IsItemIndexRestricted( f123_local4, false ) then
			return true
		end
	end
	return false
end

function AnyAttachmentBanned( f124_arg0, f124_arg1 )
	for f124_local3, f124_local4 in ipairs( f124_arg1 ) do
		if Engine.GetAttachmentVote( f124_local4 ) == Enum.VoteType.VOTE_TYPE_BAN then
			return true
		elseif Engine.GetItemAttachmentVote( f124_arg0, f124_local4 ) == Enum.VoteType.VOTE_TYPE_BAN then
			return true
		elseif Engine.GetAttachmentRestrictionState( f124_local4, f124_arg0, false ) == Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_RESTRICTED then
			return true
		end
	end
	return false
end

CoD.CACUtility.AnyClassContainsRestrictedItems = function ( f125_arg0 )
	local f125_local0 = Engine.GetCustomClassCount( f125_arg0 )
	for f125_local1 = 0, f125_local0 - 1, 1 do
		if CoD.CACUtility.ClassContainsRestrictedItems( f125_arg0, f125_local1 ) then
			return true
		end
	end
	return false
end

CoD.CACUtility.AnyEquippedScorestreaksBanned = function ( f126_arg0 )
	local f126_local0 = CoD.CACUtility.GetFullLoadout( f126_arg0 )
	return AnyItemBanned( f126_local0.streaks )
end

CoD.CACUtility.ClassContainsRestrictedItems = function ( f127_arg0, f127_arg1 )
	local f127_local0 = CoD.CACUtility.GetLoadout( f127_arg0, f127_arg1 )
	if AnyItemBanned( f127_local0.weapons ) then
		return true
	elseif AnyItemBanned( f127_local0.equipment ) then
		return true
	elseif AnyItemBanned( f127_local0.perks ) then
		return true
	elseif AnyItemBanned( f127_local0.wildcards ) then
		return true
	elseif f127_local0.weapons.primary ~= nil and AnyAttachmentBanned( f127_local0.weapons.primary, f127_local0.primaryAttachments ) then
		return true
	elseif f127_local0.weapons.secondary ~= nil and AnyAttachmentBanned( f127_local0.weapons.secondary, f127_local0.secondaryAttachments ) then
		return true
	else
		return false
	end
end

CoD.CACUtility.GetAllRestrictedItems = function ()
	local f128_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	local f128_local1 = f128_local0.sessionClients
	local f128_local2 = {}
	for f128_local11, f128_local12 in ipairs( f128_local1 ) do
		if f128_local12.voteCount > 0 then
			for f128_local9, f128_local10 in ipairs( f128_local12.votes ) do
				if f128_local10.voteType == Enum.VoteType.VOTE_TYPE_BAN then
					table.insert( f128_local2, f128_local10 )
				end
			end
		end
	end
	return f128_local2
end

CoD.CACUtility.AnyCACItemsBanned = function ()
	for f129_local4, f129_local5 in ipairs( CoD.CACUtility.GetAllRestrictedItems() ) do
		if f129_local5.voteType == Enum.VoteType.VOTE_TYPE_BAN then
			if f129_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
				local f129_local3 = Engine.GetUnlockableInfoByIndex( f129_local5.itemIndex )
				if not LuaUtils.StartsWith( f129_local3.loadoutSlot, "hero" ) and not LuaUtils.StartsWith( f129_local3.loadoutSlot, "killstreak" ) and f129_local3.loadoutSlot ~= "specialgadget" then
					return true
				end
			end
			if f129_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
				return true
			elseif f129_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
				return true
			elseif f129_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
				return true
			end
		end
	end
	return false
end

CoD.CACUtility.AnyStreaksBanned = function ()
	for f130_local4, f130_local5 in ipairs( CoD.CACUtility.GetAllRestrictedItems() ) do
		if f130_local5.voteType == Enum.VoteType.VOTE_TYPE_BAN and f130_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
			local f130_local3 = Engine.GetUnlockableInfoByIndex( f130_local5.itemIndex )
			if LUI.startswith( f130_local3.loadoutSlot, "killstreak" ) then
				return true
			end
		end
	end
	return false
end

CoD.CACUtility.ItemSlotBannedByBonuscard = function ( f131_arg0, f131_arg1 )
	if not f131_arg0 then
		return false
	elseif not f131_arg1 or f131_arg1 <= 0 then
		return false
	end
	local f131_local0 = nil
	if f131_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryWeapon then
		local f131_local1 = Engine.GetUnlockableInfoByIndex( f131_arg1 )
		if f131_local1.loadoutSlot == CoD.CACUtility.loadoutSlotNames.primaryWeapon then
			f131_local0 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.overkill )
		end
	elseif f131_arg0 == CoD.CACUtility.loadoutSlotNames.primaryAttachment4 or f131_arg0 == CoD.CACUtility.loadoutSlotNames.primaryAttachment5 or f131_arg0 == CoD.CACUtility.loadoutSlotNames.primaryAttachment6 then
		f131_local0 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.primary_gunfighter )
	elseif f131_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryAttachment1 or f131_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryAttachment2 or f131_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryAttachment3 or f131_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryAttachment4 or f131_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryAttachment5 or f131_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryAttachment6 then
		local f131_local1 = Engine.GetUnlockableInfoByIndex( f131_arg1 )
		if f131_local1.loadoutSlot == CoD.CACUtility.loadoutSlotNames.primaryWeapon then
			f131_local0 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.overkill )
		elseif f131_arg0 ~= CoD.CACUtility.loadoutSlotNames.secondaryAttachment1 and f131_arg0 ~= CoD.CACUtility.loadoutSlotNames.secondaryAttachment2 then
			f131_local0 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.secondary_gunfighter )
		end
	elseif f131_arg0 == CoD.CACUtility.loadoutSlotNames.specialty4 then
		f131_local0 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.perk_1_greed )
	elseif f131_arg0 == CoD.CACUtility.loadoutSlotNames.specialty5 then
		f131_local0 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.perk_2_greed )
	elseif f131_arg0 == CoD.CACUtility.loadoutSlotNames.specialty6 then
		f131_local0 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.perk_3_greed )
	elseif f131_arg0 == CoD.CACUtility.loadoutSlotNames.primaryGadgetAttachment1 then
		f131_local0 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.danger_close )
	elseif f131_arg0 == CoD.CACUtility.loadoutSlotNames.primaryGadget then
		local f131_local1 = Engine.GetUnlockableInfoByIndex( f131_arg1 )
		if f131_local1.loadoutSlot == CoD.CACUtility.loadoutSlotNames.secondaryGadget then
			f131_local0 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.two_tacticals )
		end
	end
	if f131_local0 then
		if Engine.GetItemVote( f131_local0 ) == Enum.VoteType.VOTE_TYPE_BAN then
			return true
		elseif Engine.IsItemIndexRestricted( f131_local0, false ) then
			return true
		end
	end
	return false
end

CoD.CACUtility.GetItemInfoFromElementModel = function ( f132_arg0, f132_arg1 )
	if f132_arg1 then
		local f132_local0 = {}
		local f132_local1 = Engine.GetModel( f132_arg1, "itemType" )
		if f132_local1 then
			f132_local0.itemType = Engine.GetModelValue( f132_local1 )
			local f132_local2 = Engine.GetModel( f132_arg1, "itemIndex" )
			if f132_local2 then
				f132_local0.itemIndex = Engine.GetModelValue( f132_local2 )
			end
			local f132_local3 = Engine.GetModel( f132_arg1, "weaponIndex" )
			if f132_local3 then
				local f132_local4 = Engine.GetModelValue( f132_local3 )
				if f132_local4 > 0 then
					f132_local0.itemIndex = f132_local4
				end
			end
			local f132_local4 = Engine.GetModel( f132_arg1, "attachmentIndex" )
			if f132_local4 then
				f132_local0.attachmentIndex = Engine.GetModelValue( f132_local4 )
			end
			local f132_local5 = Engine.GetModel( f132_arg1, "itemGroup" )
			if f132_local5 then
				f132_local0.itemGroup = Engine.GetModelValue( f132_local5 )
			end
			local f132_local6 = Engine.GetModel( f132_arg1, "weaponSlot" )
			if f132_local6 then
				f132_local0.weaponSlot = Engine.GetModelValue( f132_local6 )
			end
			local f132_local7 = Engine.GetModel( f132_arg1, "loadoutSlot" )
			if f132_local7 then
				f132_local0.loadoutSlot = Engine.GetModelValue( f132_local7 )
			end
			local f132_local8 = Engine.GetModel( f132_arg1, "restrictionState" )
			if f132_local8 then
				f132_local0.restrictionState = Engine.GetModelValue( f132_local8 )
			end
			return f132_local0
		end
	end
end

CoD.CACUtility.GetItemVotedBy = function ( f133_arg0 )
	local f133_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	local f133_local1 = f133_local0.sessionClients
	local f133_local2 = {}
	for f133_local11, f133_local12 in ipairs( f133_local1 ) do
		if f133_local12.voteCount > 0 then
			for f133_local9, f133_local10 in ipairs( f133_local12.votes ) do
				if f133_local10.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM and f133_arg0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
					if f133_local10.itemIndex == f133_arg0.itemIndex then
						return f133_local12.gamertag
					end
				end
				if f133_local10.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT and f133_arg0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
					if f133_local10.attachmentIndex == f133_arg0.attachmentIndex then
						return f133_local12.gamertag
					end
				end
				if f133_local10.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT and f133_arg0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
					if f133_local10.itemIndex == f133_arg0.itemIndex and f133_local10.attachmentIndex == f133_arg0.attachmentIndex then
						return f133_local12.gamertag
					end
				end
				if f133_local10.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP and f133_arg0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP and f133_local10.itemGroup == f133_arg0.itemGroup then
					return f133_local12.gamertag
				end
			end
		end
	end
	return ""
end

CoD.CACUtility.GetItemInfoFromElement = function ( f134_arg0, f134_arg1 )
	return CoD.CACUtility.GetItemInfoFromElementModel( f134_arg0, f134_arg1:getModel() )
end

CoD.CACUtility.IsItemConsumable = function ( f135_arg0 )
	if Engine.CurrentSessionMode() == Enum.eModes.MODE_INVALID then
		return false
	else
		return Engine.GetItemGroup( f135_arg0 ) == "bubblegum_consumable"
	end
end

CoD.CACUtility.GetCurrentWeaponXP = function ( f136_arg0, f136_arg1 )
	local f136_local0 = nil
	return Engine.GetDStat( f136_arg0, "itemstats", f136_arg1, "xp" )
end

CoD.CACUtility.PrepareOverCapactiyList = function ( f137_arg0 )
	local f137_local0 = {}
	local f137_local1 = 10
	local f137_local2 = -2
	local f137_local3 = CoD.perController[f137_arg0].classModel
	local f137_local4 = function ( f138_arg0, f138_arg1, f138_arg2, f138_arg3 )
		local f138_local0 = ""
		if f138_arg3 then
			local f138_local1 = f138_arg1
			if LUI.startswith( f138_arg0, "primaryattachment" ) then
				f138_local1 = Engine.GetModel( f137_local3, "primary" )
			elseif LUI.startswith( f138_arg0, "secondaryattachment" ) then
				f138_local1 = Engine.GetModel( f137_local3, "secondary" )
			end
			f138_local0 = Engine.GetModelValue( Engine.GetModel( f138_local1, "headerName" ) )
		end
		return {
			models = {
				headerName = f138_local0,
				name = Engine.GetModelValue( Engine.GetModel( f138_arg1, "name" ) ),
				image = Engine.GetModelValue( Engine.GetModel( f138_arg1, "image" ) ) or "blacktransparent",
				itemSlot = f138_arg0
			},
			properties = {
				itemRef = Engine.GetModelValue( Engine.GetModel( f138_arg1, "ref" ) ),
				spacing = f138_arg2 or f137_local2
			}
		}
	end
	
	local f137_local5 = CoD.perController[f137_arg0].weaponCategory
	local f137_local6 = CoD.perController[f137_arg0].overCapacityItemIndex
	local f137_local7 = ""
	if f137_local6 then
		f137_local7 = Engine.GetItemRef( f137_local6 )
	end
	if f137_local3 then
		for f137_local19, f137_local20 in ipairs( CoD.CACUtility.overCapacityLoadoutSlotOrder ) do
			local f137_local21 = Engine.GetModel( f137_local3, f137_local20 )
			local f137_local22 = f137_local1
			local f137_local23 = #f137_local0
			local f137_local24, f137_local11 = nil
			local f137_local18 = true
			if f137_local23 > 0 then
				f137_local11 = f137_local0[f137_local23].models.itemSlot
			end
			if LUI.startswith( f137_local5, "primaryattachment" ) and f137_local20 == "primary" then
				
			end
			if LUI.startswith( f137_local5, "secondaryattachment" ) and f137_local20 == "secondary" then
				
			end
			if LUI.startswith( f137_local5, "primarygadgetattachment" ) then
				if f137_local20 ~= "primarygadget" then
					if CoD.CACUtility.GetItemReferenceName( f137_local21, f137_local20 ) == "bonuscard_danger_close" then
						
					end
				end
			end
			if LUI.startswith( f137_local5, "secondarygadgetattachment" ) and f137_local20 == "secondarygadget" then
				
			end
			if LUI.startswith( f137_local7, "bonuscard_primary_gunfighter" ) then
				if f137_local20 ~= "primary" then
					if LUI.startswith( f137_local20, "primaryattachment" ) then
						
					end
				end
			end
			if f137_local7 == "bonuscard_secondary_gunfighter" then
				if f137_local20 ~= "secondary" then
					if LUI.startswith( f137_local20, "secondaryattachment" ) then
						
					end
				end
			end
			if f137_local21 then
				local f137_local12 = Engine.GetModel( f137_local21, "itemIndex" )
				if f137_local12 then
					local f137_local13 = Engine.GetModelValue( f137_local12 )
					local f137_local14 = Engine.GetItemRef( f137_local13 )
					if f137_local13 > CoD.CACUtility.EmptyItemIndex then
						if LUI.startswith( f137_local20, "primarygadgetattachment" ) then
							local f137_local15 = Engine.GetModel( f137_local3, "primarygadget.itemIndex" )
							if f137_local15 then
								local f137_local16 = Engine.GetModelValue( f137_local15 )
								local f137_local17 = Engine.GetModel( f137_local3, "primarygadgetattachment1" )
								if f137_local11 and f137_local11 == "primarygadget" then
									f137_local0[f137_local23].properties.spacing = f137_local2
									f137_local18 = false
								end
								table.insert( f137_local0, f137_local4( f137_local20, f137_local17, f137_local1, f137_local18 ) )
							end
						end
						if LUI.startswith( f137_local20, "secondarygadgetattachment" ) then
							local f137_local15 = Engine.GetModel( f137_local3, "secondarygadget.itemIndex" )
							if f137_local15 then
								local f137_local16 = Engine.GetModelValue( f137_local15 )
								local f137_local17 = Engine.GetModel( f137_local3, "secondarygadgetattachment1" )
								if f137_local11 and f137_local11 == "secondarygadget" then
									f137_local0[f137_local23].properties.spacing = f137_local2
									f137_local18 = false
								end
								table.insert( f137_local0, f137_local4( f137_local20, f137_local17, f137_local1, f137_local18 ) )
							end
						end
						if f137_local5 == "specialty4" and f137_local14 == "bonuscard_perk_1_greed" then
							
						end
						if f137_local5 == "specialty5" and f137_local14 == "bonuscard_perk_2_greed" then
							
						end
						if f137_local5 == "specialty6" and f137_local14 == "bonuscard_perk_3_greed" then
							
						end
						if (f137_local5 == "primaryattachment4" or f137_local5 == "primaryattachment5" or f137_local5 == "primaryattachment6") and LUI.startswith( f137_local14, "bonuscard_primary_gunfighter" ) then
							
						end
						if f137_local5 == "secondary" and f137_local14 == "bonuscard_overkill" then
							
						end
						if not LUI.startswith( f137_local5, "secondaryattachment" ) or f137_local14 ~= "bonuscard_overkill" then
							if f137_local5 == "secondaryattachment3" and f137_local14 == "bonuscard_secondary_gunfighter" then
								
							end
							if f137_local5 == "primarygadget" and f137_local14 == "bonuscard_two_tacticals" then
								
							end
							if f137_local5 == "primarygadgetattachment2" and f137_local14 == "bonuscard_danger_close" then
								
							end
							if LUI.startswith( f137_local5, "primarygadgetattachment" ) and f137_local14 == "bonuscard_two_tacticals" then
								
							end
							if f137_local11 and (not (f137_local11 ~= "primary" or not LUI.startswith( f137_local20, "primaryattachment" )) or not (not LUI.startswith( f137_local20, "primaryattachment" ) or not LUI.startswith( f137_local20, "primaryattachment" )) or not (f137_local11 ~= "secondary" or not LUI.startswith( f137_local20, "secondaryattachment" )) or not (not LUI.startswith( f137_local20, "secondaryattachment" ) or not LUI.startswith( f137_local20, "secondaryattachment" )) or not (f137_local11 ~= "specialty1" or f137_local20 ~= "specialty4") or not (f137_local11 ~= "specialty2" or f137_local20 ~= "specialty5") or not (f137_local11 ~= "specialty3" or f137_local20 ~= "specialty6") or LUI.startswith( f137_local11, "bonuscard" ) and LUI.startswith( f137_local20, "bonuscard" )) then
								f137_local0[f137_local23].properties.spacing = f137_local2
								f137_local18 = false
							end
							table.insert( f137_local0, f137_local4( f137_local20, f137_local21, f137_local22, f137_local18 ) )
						end
					end
				end
			end
		end
	end
	return f137_local0
end

f0_local2 = {
	getSpacerAfterColumn = function ( f139_arg0, f139_arg1 )
		local f139_local0 = f139_arg0[f139_arg0.dataSourceName]
		if f139_local0[f139_arg1] then
			return f139_local0[f139_arg1].properties.spacing
		else
			return -2
		end
	end
}
CoD.CACUtility.RemoveItemFromClassList = function ( f140_arg0 )
	local f140_local0 = CoD.perController[f140_arg0].weaponCategory
	local f140_local1 = CoD.CACUtility.PrepareOverCapactiyList( f140_arg0 )
	local f140_local2 = nil
	for f140_local3 = #f140_local1, 1, -1 do
		local f140_local6 = f140_local1[f140_local3].models.itemSlot
		if f140_local0 == f140_local6 or LUI.startswith( f140_local6, f140_local0 .. "attachment" ) then
			table.remove( f140_local1, f140_local3 )
		end
	end
	local f140_local3 = f140_local0 == "primary"
	local f140_local4 = "bonuscard_primary_gunfighter"
	if not f140_local3 then
		f140_local4 = "bonuscard_secondary_gunfighter"
	end
	for f140_local5 = #f140_local1, 1, -1 do
		if LUI.startswith( f140_local1[f140_local5].properties.itemRef, f140_local4 ) then
			table.remove( f140_local1, f140_local5 )
		end
	end
	return f140_local1
end

DataSources.RemoveItemFromClassList = DataSourceHelpers.ListSetup( "RemoveItemFromClassList", CoD.CACUtility.RemoveItemFromClassList, true, f0_local2 )
DataSources.OverCapacityList = DataSourceHelpers.ListSetup( "OverCapacityList", CoD.CACUtility.PrepareOverCapactiyList, true, f0_local2 )
CoD.CACUtility.PrepareWildcardOverCapactiyList = function ( f141_arg0 )
	local f141_local0 = {}
	local f141_local1 = function ( f142_arg0, f142_arg1, f142_arg2, f142_arg3 )
		return {
			models = {
				name = f142_arg0,
				image = f142_arg1 or "blacktransparent",
				itemSlot = f142_arg2
			},
			properties = {
				itemIndex = f142_arg3
			}
		}
	end
	
	local f141_local2 = CoD.perController[f141_arg0].wildcardOverCapacityRefName
	local f141_local3 = CoD.perController[f141_arg0].classModel
	for f141_local7, f141_local8 in ipairs( CoD.CACUtility.BonuscardSlotNameCACCardList ) do
		local f141_local9 = Engine.GetModel( f141_local3, f141_local8 )
		local f141_local10 = Engine.GetModelValue( Engine.GetModel( f141_local9, "name" ) )
		local f141_local11 = Engine.GetModelValue( Engine.GetModel( f141_local9, "image" ) )
		local f141_local12 = Engine.GetModelValue( Engine.GetModel( f141_local9, "itemIndex" ) )
		if not LUI.startswith( f141_local2, Engine.GetModelValue( Engine.GetModel( f141_local9, "ref" ) ) ) then
			table.insert( f141_local0, f141_local1( f141_local10, f141_local11, f141_local8, f141_local12 ) )
		end
	end
	return f141_local0
end

DataSources.WildcardOvercapacityList = DataSourceHelpers.ListSetup( "WildcardOvercapacityList", CoD.CACUtility.PrepareWildcardOverCapactiyList, true )
f0_local3 = function ( f143_arg0, f143_arg1, f143_arg2 )
	local f143_local0 = "WeaponVariantAttachmentList" .. f143_arg1.properties.index
	DataSources[f143_local0] = DataSourceHelpers.ListSetup( f143_local0, function ( f144_arg0 )
		local f144_local0 = {}
		local f144_local1 = f143_arg2.weaponIndex
		for f144_local5, f144_local6 in ipairs( f143_arg2.attachmentsByIndex ) do
			if f144_local6 > CoD.CACUtility.EmptyItemIndex then
				table.insert( f144_local0, {
					models = {
						image = Engine.GetAttachmentImage( f144_local1, f144_local6 ) .. "_wv_icon"
					},
					properties = {
						isLocked = Engine.IsItemAttachmentLocked( f144_arg0, f144_local1, f144_local6 )
					}
				} )
			end
		end
		f144_local2 = CoD.perController[f144_arg0].weaponCategory
		f144_local3 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.primary_gunfighter )
		f144_local4 = "cac_mods_primary_gunfighter_wv_icon"
		if f144_local2 == "secondary" then
			f144_local3 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.secondary_gunfighter )
			f144_local4 = "cac_mods_secondary_gunfighter_wv_icon"
		end
		for f144_local5 = 1, f143_arg2.wildcardNeededFromVariantCount, 1 do
			local f144_local8 = f144_local5
			table.insert( f144_local0, {
				models = {
					image = f144_local4
				},
				properties = {
					isLocked = f144_local3 and Engine.IsItemLocked( f144_arg0, f144_local3 )
				}
			} )
		end
		return f144_local0
	end, true )
	return f143_local0
end

f0_local4 = function ( f145_arg0, f145_arg1 )
	local f145_local0 = {
		models = {
			index = f145_arg1.index,
			variantIndex = f145_arg1.variantIndex,
			variantName = f145_arg1.variantName,
			variantNameBig = f145_arg1.variantNameBig,
			weaponItemIndex = f145_arg1.weaponIndex,
			cacVariantIndex = f145_arg1.cacVariantIndex,
			hintText = Engine.Localize( "MPUI_VARIANT_CONTAINS_LOCKED_ITEMS_DESC" )
		},
		properties = {
			index = f145_arg1.index,
			weaponVariantInfo = f145_arg1
		}
	}
	f145_local0.models.listDataSource = f0_local3( f145_arg0, f145_local0, f145_arg1 )
	return f145_local0
end

f0_local5 = function ( f146_arg0 )
	local f146_local0 = 0
	for f146_local4, f146_local5 in ipairs( f146_arg0 ) do
		if f146_local5 > CoD.CACUtility.EmptyItemIndex then
			f146_local0 = f146_local0 + 1
		end
	end
	return f146_local0
end

f0_local6 = function ( f147_arg0 )
	local f147_local0 = {}
	local f147_local1 = CoD.perController[f147_arg0].weaponIndexForVariant
	table.insert( f147_local0, f0_local4( f147_arg0, {
		variantName = Engine.GetItemName( f147_local1 ),
		variantNameBig = "",
		variantIndex = CoD.CACUtility.EmptyItemIndex,
		weaponIndex = f147_local1,
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
		hasLockedAttachments = false
	} ) )
	local f147_local2 = function ( f148_arg0, f148_arg1 )
		local f148_local0 = false
		local f148_local1 = 0
		if f148_arg0 then
			if f148_arg1[4] > CoD.CACUtility.EmptyItemIndex then
				f148_local0 = true
				f148_local1 = f148_local1 + 1
			end
			if f148_arg1[5] > CoD.CACUtility.EmptyItemIndex then
				f148_local0 = true
				f148_local1 = f148_local1 + 1
			end
			if f148_arg1[6] > CoD.CACUtility.EmptyItemIndex then
				f148_local0 = true
				f148_local1 = f148_local1 + 1
			end
		elseif f148_arg1[3] > CoD.CACUtility.EmptyItemIndex then
			f148_local0 = true
			f148_local1 = f148_local1 + 1
		end
		return f148_local0, f148_local1
	end
	
	for f147_local26, f147_local27 in ipairs( CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList( f147_local1 ) ) do
		local f147_local28 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f147_arg0, f147_local27.variantIndex )
		if CoD.CACUtility.EmptyItemIndex < f147_local28.weaponIndex then
			local f147_local6 = {}
			local f147_local7 = {}
			local f147_local8 = f147_local28.attachment
			local f147_local9 = f0_local5( f147_local8 )
			local f147_local10 = false
			local f147_local11 = 0
			local f147_local12 = 0
			local f147_local13 = false
			local f147_local14 = CoD.perController[f147_arg0].weaponCategory == "primary"
			local f147_local15 = false
			local f147_local16 = false
			local f147_local17 = 2
			if not f147_local14 then
				f147_local17 = 1
			end
			local f147_local18 = f147_local17 + 1
			local f147_local19 = {}
			for f147_local24, f147_local25 in ipairs( f147_local8 ) do
				if CoD.CACUtility.EmptyItemIndex < f147_local25 then
					local f147_local23 = Engine.GetAttachmentIndexByAttachmentTableIndex( f147_local28.weaponIndex, f147_local25 )
					if Engine.IsOptic( f147_local28.weaponIndex, f147_local23 ) then
						f147_local13 = true
					end
					table.insert( f147_local6, f147_local23 )
					if not Engine.IsItemAttachmentLocked( f147_arg0, f147_local28.weaponIndex, f147_local23 ) then
						table.insert( f147_local19, {
							indexSlot = f147_local24,
							index = f147_local23
						} )
					else
						f147_local16 = true
						f147_local15 = true
						table.insert( f147_local19, {
							indexSlot = f147_local24,
							index = CoD.CACUtility.EmptyItemIndex
						} )
						goto basicblock_13:
					end
				end
				table.insert( f147_local6, CoD.CACUtility.EmptyItemIndex )
				table.insert( f147_local19, {
					indexSlot = f147_local24,
					index = CoD.CACUtility.EmptyItemIndex
				} )
			end
			table.sort( f147_local19, function ( f149_arg0, f149_arg1 )
				if f149_arg0.indexSlot == 1 or f149_arg1.indexSlot == 1 then
					return f149_arg0.indexSlot < f149_arg1.indexSlot
				elseif f149_arg0.index == CoD.CACUtility.EmptyItemIndex or f149_arg1.index == CoD.CACUtility.EmptyItemIndex then
					return f149_arg1.index < f149_arg0.index
				else
					return f149_arg0.indexSlot < f149_arg1.indexSlot
				end
			end )
			for f147_local24, f147_local25 in ipairs( f147_local19 ) do
				table.insert( f147_local7, f147_local25.index )
			end
			if IsProgressionEnabled() then
				f147_local10, f147_local12 = f147_local2( f147_local14, f147_local7 )
			end
			f147_local10, f147_local11 = f147_local2( f147_local14, f147_local6 )
			f147_local28.variantNameBig = f147_local28.variantName
			f147_local28.attachmentsByIndex = f147_local6
			f147_local28.unlockedAttachmentsByIndex = f147_local7
			f147_local28.index = f147_local26
			f147_local28.isWildcardNeeded = f147_local10
			f147_local28.wildcardNeededCount = f147_local12
			f147_local28.wildcardNeededFromVariantCount = f147_local11
			f147_local28.isVariantLinkBroken = f147_local16
			f147_local28.hasLockedAttachments = f147_local15
			table.insert( f147_local0, f0_local4( f147_arg0, f147_local28 ) )
		end
	end
	return f147_local0
end

CoD.CACUtility.GetWeaponAndAttachments = function ( f150_arg0, f150_arg1 )
	local f150_local0 = 0
	local f150_local1 = false
	local f150_local2 = Engine.GetModel( Engine.GetModelForController( f150_arg1 ), "currentWeapon" )
	if f150_local2 == nil then
		return f150_local0, f150_local1
	end
	for f150_local3 = 1, 4, 1 do
		local f150_local6 = Engine.GetModel( f150_local2, "attachmentName" .. f150_local3 )
		local f150_local7 = Engine.GetModelValue( f150_local6 )
		if f150_local6 and f150_local7 ~= "" then
			f150_local0 = f150_local0 + 1
		end
		if f150_arg0["currentAttachment" .. f150_local3] ~= f150_local7 then
			f150_arg0["currentAttachment" .. f150_local3] = f150_local7
			f150_local1 = true
		end
	end
	f150_arg0.currentWeapon = Engine.GetModelValue( Engine.GetModel( f150_local2, "weaponName" ) )
	return f150_local0, f150_local1
end

CoD.CACUtility.GetLocalizedAttachmentsString = function ( f151_arg0 )
	local f151_local0 = ""
	if f151_arg0.currentAttachment1 ~= nil and f151_arg0.currentAttachment1 ~= "" then
		f151_local0 = Engine.Localize( f151_arg0.currentAttachment1 )
	end
	if f151_arg0.currentAttachment2 ~= nil and f151_arg0.currentAttachment2 ~= "" then
		f151_local0 = f151_local0 .. " + " .. Engine.Localize( f151_arg0.currentAttachment2 )
	end
	if f151_arg0.currentAttachment3 ~= nil and f151_arg0.currentAttachment3 ~= "" then
		f151_local0 = f151_local0 .. " + " .. Engine.Localize( f151_arg0.currentAttachment3 )
	end
	return f151_local0
end

DataSources.WeaponVariantList = DataSourceHelpers.ListSetup( "WeaponVariantList", f0_local6, false )
CoD.WGSV_Category = {}
CoD.WGSV_Category.WEAPON = 1
CoD.WGSV_Category.GUNSMITH_VARIANT = 2
DataSources.WGSV_Category = Engine.CreateModel( Engine.GetGlobalModel(), "WGSV_Category" )
