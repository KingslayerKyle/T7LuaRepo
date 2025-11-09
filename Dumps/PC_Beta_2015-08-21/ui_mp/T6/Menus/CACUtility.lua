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
	"bonuscard3"
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
	secondary_gunfighter = "bonuscard_secondary_gunfighter",
	overkill = "bonuscard_overkill",
	perk_1_greed = "bonuscard_perk_1_greed",
	perk_2_greed = "bonuscard_perk_2_greed",
	perk_3_greed = "bonuscard_perk_3_greed",
	danger_close = "bonuscard_danger_close",
	two_tacticals = "bonuscard_two_tacticals"
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
	"reflex",
	"holo",
	"acog",
	"dualoptic"
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
	description = function ( f3_arg0, f3_arg1 )
		return Engine.Localize( "MPUI_UNLOCK_ITEM", Engine.GetItemName( f3_arg1 ) )
	end,
	supportText = function ( f4_arg0, f4_arg1 )
		return Engine.Localize( Engine.GetItemName( f4_arg1 ) )
	end,
	image = function ( f5_arg0, f5_arg1 )
		local f5_local0 = CoD.perController[f5_arg0].weaponCategory
		local f5_local1 = ""
		if f5_local0 == "specialist" then
			return Engine.GetItemImage( f5_arg1, CoD.perController[f5_arg0].customizationMode ) .. "_large"
		elseif f5_local0 and LUI.startswith( f5_local0, "killstreak" ) then
			f5_local1 = "_menu_large"
		elseif LUI.startswith( f5_local0, "specialty" ) or f5_local0 == "primarygadget" or f5_local0 == "secondarygadget" then
			f5_local1 = "_256"
		end
		return Engine.GetItemImage( f5_arg1 ) .. f5_local1
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.Unlock,
	listDatasource = function ( f6_arg0, f6_arg1 )
		DataSources.UnlockTokenMenuList = DataSourceHelpers.ListSetup( "UnlockTokenMenuList", function ( f7_arg0 )
			local f7_local0 = {}
			local f7_local1 = CoD.perController[f7_arg0].isInCybercoreUpgrade or false
			local f7_local2 = function ( f8_arg0, f8_arg1 )
				return {
					models = {
						displayText = f8_arg0,
						itemIndex = f6_arg1
					},
					properties = {
						action = f8_arg1
					}
				}
			end
			
			local f7_local3 = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3, f9_arg4 )
				UnlockItem( f9_arg4, f9_arg1, f9_arg2 )
				local f9_local0 = GoBackAndUpdateStateOnPreviousMenu( f9_arg4, f9_arg2 )
				if f7_local1 then
					UpdateCybercoreTree( f9_local0, f9_local0, f9_arg2 )
				end
			end
			
			local f7_local4 = function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3, f10_arg4 )
				local f10_local0 = CoD.perController[f10_arg2].weaponCategory
				local f10_local1 = UnlockAndEquipItem( f10_arg4, f10_arg1, f10_arg2 )
				if f10_local0 == "specialist" then
					local f10_local2 = GoBack( f10_arg4, f10_arg2 )
					SendClientScriptMenuChangeNotify( f10_arg2, f10_local2, false )
					GoBack( f10_local2, f10_arg2 )
				elseif f10_local1 then
					GoBackToCustomClassMenu( f10_local1, f10_arg2 )
				else
					local f10_local2 = GoBack( f10_arg4, f10_arg2 )
					f10_local2:processEvent( {
						name = "update_state",
						menu = f10_local2
					} )
				end
			end
			
			local f7_local5 = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3, f11_arg4 )
				local f11_local0 = CoD.CCUtility.Heroes.HeroIndexForEdits
				local f11_local1 = CoD.CCUtility.GetHeroEquippedSlot( f11_arg2, f6_arg1 )
				local f11_local2 = GoBack( f11_arg4, f11_arg2 )
				if f11_local1 then
					f11_arg1.itemIndex = f6_arg1
					if not f11_arg3 then
						f11_arg3 = {}
					end
					f11_arg3.previousMenu = f11_local2
					UnlockAndEquipHeroForMPFirstTimeSetup( f11_arg0, f11_arg1, f11_arg2, f11_arg3, f11_arg4 )
				end
				GoBack( GoBack( f11_local2, f11_arg2 ), f11_arg2 )
			end
			
			local f7_local6 = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3, f12_arg4 )
				GoBack( f12_arg0, f12_arg2 )
			end
			
			local f7_local7 = not f7_local1
			if CoD.perController[f7_arg0].customizationMode == Enum.eModes.MODE_MULTIPLAYER and IsFirstTimeSetup( f7_arg0, Enum.eModes.MODE_MULTIPLAYER ) then
				table.insert( f7_local0, f7_local2( "MENU_UNLOCK_AND_EQUIP", f7_local5 ) )
			else
				table.insert( f7_local0, f7_local2( "MENU_UNLOCK", f7_local3 ) )
				if f7_local7 then
					table.insert( f7_local0, f7_local2( "MENU_UNLOCK_AND_EQUIP", f7_local4 ) )
				end
				table.insert( f7_local0, f7_local2( "MENU_CANCEL_UNLOCK", f7_local6 ) )
			end
			return f7_local0
		end, true )
		return "UnlockTokenMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
CoD.CACUtility.GetCameraNameForAttachments = function ( f13_arg0, f13_arg1 )
	local f13_local0 = 0
	local f13_local1 = 0
	for f13_local5 in string.gmatch( f13_arg0, "[^+]+" ) do
		if f13_local5 == "suppressed" then
			f13_local0 = 1
		end
		if f13_local5 == "extbarrel" then
			f13_local1 = 1
		end
	end
	f13_local2 = "select"
	if f13_arg1 ~= nil and f13_arg1 then
		f13_local2 = "gunsmith"
	end
	f13_local3 = ""
	if f13_local0 == 1 then
		if f13_local1 == 1 then
			f13_local3 = "_extbarrel_suppressor"
		else
			f13_local3 = "_suppressor"
		end
	elseif f13_local1 == 1 then
		f13_local3 = "_extbarrel"
	else
		f13_local3 = "01"
	end
	return f13_local2 .. f13_local3
end

CoD.CACUtility.GetImageForItemRef = function ( f14_arg0 )
	return Engine.TableLookup( nil, CoD.statsTable, 0, f14_arg0, 6 )
end

CoD.CACUtility.GetNameForItemRef = function ( f15_arg0 )
	return Engine.TableLookup( nil, CoD.statsTable, 0, f15_arg0, 3 )
end

CoD.CACUtility.GetIdForItemRef = function ( f16_arg0 )
	return Engine.TableLookup( nil, CoD.statsTable, 0, f16_arg0, 4 )
end

CoD.CACUtility.GetNameForStatsTableImage = function ( f17_arg0 )
	return Engine.TableLookup( nil, CoD.statsTable, 6, f17_arg0, 3 )
end

CoD.CACUtility.IsSlotNameInList = function ( f18_arg0, f18_arg1 )
	for f18_local3, f18_local4 in ipairs( f18_arg0 ) do
		if f18_local4 == f18_arg1 then
			return true
		end
	end
	return false
end

CoD.CACUtility.GetSlotListWithSlot = function ( f19_arg0 )
	for f19_local3, f19_local4 in ipairs( CoD.CACUtility.SlotLists ) do
		if CoD.CACUtility.IsSlotNameInList( f19_local4, f19_arg0 ) then
			return f19_local4
		end
	end
	return {}
end

CoD.CACUtility.GetAttachmentListForSlot = function ( f20_arg0 )
	if LUI.startswith( f20_arg0, "primarygadget" ) then
		return CoD.CACUtility.PrimaryGadgetAttachmentSlotNameList
	elseif LUI.startswith( f20_arg0, "secondarygadget" ) then
		return CoD.CACUtility.SecondaryGadgetAttachmentSlotNameList
	elseif LUI.startswith( f20_arg0, "primary" ) then
		return CoD.CACUtility.PrimaryAttachmentSlotNameList
	elseif LUI.startswith( f20_arg0, "secondary" ) then
		return CoD.CACUtility.SecondaryAttachmentSlotNameList
	else
		return {}
	end
end

CoD.CACUtility.GetCACWeaponACVList = function ( f21_arg0 )
	if f21_arg0 == "primary" then
		return CoD.CACUtility.PrimaryAttachmentCVSlotNameList
	elseif f21_arg0 == "secondary" then
		return CoD.CACUtility.SecondaryAttachmentCVSlotNameList
	else
		return {}
	end
end

CoD.CACUtility.GetAllocationSpentFromClassData = function ( f22_arg0 )
	return CoD.SumClassItemCosts( f22_arg0.primaryWeapon ) + CoD.SumClassItemCosts( f22_arg0.primaryAttachments ) + CoD.SumClassItemCosts( f22_arg0.secondaryWeapon ) + CoD.SumClassItemCosts( f22_arg0.secondaryAttachments ) + CoD.SumClassItemCosts( f22_arg0.grenades ) + CoD.SumClassItemCosts( f22_arg0.gadgets ) + CoD.SumClassItemCosts( f22_arg0.perks ) + CoD.SumClassItemCosts( f22_arg0.rewards )
end

CoD.CACUtility.HowManyInClassData = function ( f23_arg0, f23_arg1 )
	return CoD.HowManyInClassSlot( f23_arg0, f23_arg1.primaryWeapon ) + CoD.HowManyInClassSlot( f23_arg0, f23_arg1.secondaryWeapon ) + CoD.HowManyInClassSlot( f23_arg0, f23_arg1.grenades ) + CoD.HowManyInClassSlot( f23_arg0, f23_arg1.gadgets ) + CoD.HowManyInClassSlot( f23_arg0, f23_arg1.perks ) + CoD.HowManyInClassSlot( f23_arg0, f23_arg1.rewards )
end

CoD.CACUtility.GetClassData = function ( f24_arg0, f24_arg1 )
	local f24_local0 = {}
	if f24_arg1 == nil then
		f24_arg1 = CoD.perController[f24_arg0].classNumInternal
	end
	local f24_local1 = CoD.CACUtility.loadoutSlotNames
	f24_local0.primaryWeapon = {}
	CoD.AddClassItemData( f24_local0.primaryWeapon, CoD.GetClassItem( f24_arg0, f24_arg1, f24_local1.primaryWeapon ) )
	f24_local0.secondaryWeapon = {}
	CoD.AddClassItemData( f24_local0.secondaryWeapon, CoD.GetClassItem( f24_arg0, f24_arg1, f24_local1.secondaryWeapon ) )
	f24_local0.primaryAttachments = {}
	f24_local0.secondaryAttachments = {}
	local f24_local2 = CoD.GetClassItem( f24_arg0, f24_arg1, f24_local1.primaryWeapon )
	local f24_local3 = CoD.GetClassItem( f24_arg0, f24_arg1, f24_local1.secondaryWeapon )
	for f24_local4 = 0, 2, 1 do
		CoD.AddClassAttachmentData( f24_local0.primaryAttachments, f24_local2, CoD.GetClassItem( f24_arg0, f24_arg1, f24_local1.primaryWeapon .. "attachment" .. f24_local4 + 1 ) )
		CoD.AddClassAttachmentData( f24_local0.secondaryAttachments, f24_local3, CoD.GetClassItem( f24_arg0, f24_arg1, f24_local1.secondaryWeapon .. "attachment" .. f24_local4 + 1 ) )
	end
	f24_local0.grenades = {}
	CoD.AddClassItemData( f24_local0.grenades, CoD.GetClassItem( f24_arg0, f24_arg1, f24_local1.primaryGrenade ), CoD.GetClassItem( f24_arg0, f24_arg1, "primarygrenadecount" ), f24_local1.primaryGrenade )
	CoD.AddClassItemData( f24_local0.grenades, CoD.GetClassItem( f24_arg0, f24_arg1, f24_local1.specialGrenade ), CoD.GetClassItem( f24_arg0, f24_arg1, "specialgrenadecount" ), f24_local1.specialGrenade )
	f24_local0.gadgets = {}
	CoD.AddClassItemData( f24_local0.gadgets, CoD.GetClassItem( f24_arg0, f24_arg1, f24_local1.primaryGadget ) )
	CoD.AddClassItemData( f24_local0.gadgets, CoD.GetClassItem( f24_arg0, f24_arg1, f24_local1.secondaryGadget ) )
	local f24_local4 = CoD.CACUtility.maxSpecialtySlots
	f24_local0.perks = {}
	for f24_local5 = 1, f24_local4, 1 do
		CoD.AddClassItemData( f24_local0.perks, CoD.GetClassItem( f24_arg0, f24_arg1, f24_local1["specialty" .. f24_local5] ) )
	end
	local f24_local5 = CoD.CACUtility.maxRewards
	f24_local0.rewards = {}
	for f24_local6 = 1, f24_local5, 1 do
		CoD.AddClassItemData( f24_local0.rewards, CoD.GetClassItem( f24_arg0, f24_arg1, "killstreak" .. f24_local6 ) )
	end
	table.sort( f24_local0.rewards, function ( f25_arg0, f25_arg1 )
		return f25_arg0.momentumCost < f25_arg1.momentumCost
	end )
	return f24_local0
end

CoD.CACUtility.GetLoadoutsMPOffline = function ( f26_arg0 )
	local f26_local0 = Engine.StorageGetBuffer( f26_arg0, Enum.StorageFileType.STORAGE_MP_LOADOUTS_OFFLINE )
	return f26_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsMPOnlinePublic = function ( f27_arg0 )
	local f27_local0 = Engine.StorageGetBuffer( f27_arg0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	return f27_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsMPOnlineCustom = function ( f28_arg0 )
	local f28_local0 = Engine.StorageGetBuffer( f28_arg0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	return f28_local0.customMatchCacLoadouts
end

CoD.CACUtility.GetLoadoutsMPOnlineLeague = function ( f29_arg0 )
	local f29_local0 = Engine.StorageGetBuffer( f29_arg0, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	return f29_local0.leagueCacLoadouts
end

CoD.CACUtility.GetLoadoutsCPOffline = function ( f30_arg0 )
	if Dvar.tempCPOnline == nil or not Dvar.tempCPOnline:exists() or Dvar.tempCPOnline:get() ~= true then
		local f30_local0 = Engine.StorageGetBuffer( f30_arg0, Enum.StorageFileType.STORAGE_CP_LOADOUTS )
		return f30_local0.cacLoadouts
	else
		local f30_local0 = Engine.StorageGetBuffer( f30_arg0, Enum.StorageFileType.STORAGE_CP_LOADOUTS_OFFLINE )
		return f30_local0.cacLoadouts
	end
end

CoD.CACUtility.GetLoadoutsCPOnline = function ( f31_arg0 )
	local f31_local0 = Engine.StorageGetBuffer( f31_arg0, Enum.StorageFileType.STORAGE_CP_LOADOUTS )
	return f31_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsZMOffline = function ( f32_arg0 )
	local f32_local0 = Engine.StorageGetBuffer( f32_arg0, Enum.StorageFileType.STORAGE_ZM_LOADOUTS_OFFLINE )
	return f32_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsZMOnlinePublic = function ( f33_arg0 )
	local f33_local0 = Engine.StorageGetBuffer( f33_arg0, Enum.StorageFileType.STORAGE_ZM_LOADOUTS )
	return f33_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsZMOnlineCustom = function ( f34_arg0 )
	local f34_local0 = Engine.StorageGetBuffer( f34_arg0, Enum.StorageFileType.STORAGE_ZM_LOADOUTS )
	return f34_local0.customMatchCacLoadouts
end

CoD.CACUtility.SetDefaultCACRootOld = function ( f35_arg0 )
	if CoD.isOnlineGame() ~= true then
		local f35_local0 = CoD.perController[f35_arg0]
		local f35_local1 = CoD.GetPlayerStats( f35_arg0 )
		f35_local0.cacRoot = f35_local1.cacLoadouts
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
		local f35_local0 = CoD.perController[f35_arg0]
		local f35_local1 = CoD.GetPlayerStats( f35_arg0 )
		f35_local0.cacRoot = f35_local1.leagueCacLoadouts
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) then
		local f35_local0 = CoD.perController[f35_arg0]
		local f35_local1 = CoD.GetPlayerStats( f35_arg0 )
		f35_local0.cacRoot = f35_local1.customMatchCacLoadouts
	else
		local f35_local0 = CoD.perController[f35_arg0]
		local f35_local1 = CoD.GetPlayerStats( f35_arg0 )
		f35_local0.cacRoot = f35_local1.cacLoadouts
	end
end

CoD.CACUtility.SetDefaultCACRoot = function ( f36_arg0 )
	local f36_local0 = nil
	if CoD.isOnlineGame() ~= true then
		f36_local0 = CoD.CPMPZM( CoD.CACUtility.GetLoadoutsCPOffline, CoD.CACUtility.GetLoadoutsMPOffline, CoD.CACUtility.GetLoadoutsZMOffline )
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
		f36_local0 = CoD.CPMPZM( nil, CoD.CACUtility.GetLoadoutsMPOnlineLeague, nil )
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) then
		f36_local0 = CoD.CPMPZM( CoD.CACUtility.GetLoadoutsCPOnline, CoD.CACUtility.GetLoadoutsMPOnlineCustom, CoD.CACUtility.GetLoadoutsZMOnlineCustom )
	else
		f36_local0 = CoD.CPMPZM( CoD.CACUtility.GetLoadoutsCPOnline, CoD.CACUtility.GetLoadoutsMPOnlinePublic, CoD.CACUtility.GetLoadoutsZMOnlinePublic )
	end
	if f36_local0 ~= nil then
		CoD.perController[f36_arg0].cacRoot = f36_local0( f36_arg0 )
	else
		error( "LUI Error: could not set up loadout root - no valid game mode set" )
	end
end

CoD.CACUtility.SetGametypeSettingsCACRoot = function ( f37_arg0, f37_arg1 )
	local f37_local0 = nil
	if f37_arg1 == Enum.team_t.TEAM_FREE then
		f37_local0 = 0
	else
		f37_local0 = f37_arg1 - Enum.team_t.TEAM_FIRST_PLAYING_TEAM + 1
	end
	local f37_local1 = CoD.perController[f37_arg0]
	local f37_local2 = Engine.GetGametypeSettings()
	f37_local1.cacRoot = f37_local2.cacLoadouts[f37_local0]
end

CoD.CACUtility.GetCACRoot = function ( f38_arg0 )
	return CoD.perController[f38_arg0].cacRoot
end

CoD.CACUtility.GetLoadoutNames = function ( f39_arg0 )
	local f39_local0 = CoD.CACUtility.GetCACRoot( f39_arg0 )
	if f39_local0 then
		return f39_local0.customClassName
	else
		return nil
	end
end

CoD.CACUtility.GetLoadoutNameFromIndex = function ( f40_arg0, f40_arg1 )
	local f40_local0 = CoD.CACUtility.GetLoadoutNames( f40_arg0 )
	if f40_local0 then
		return f40_local0[f40_arg1]
	else
		return nil
	end
end

CoD.CACUtility.GetDefaultLoadoutNameFromIndex = function ( f41_arg0 )
	if f41_arg0 < 1 or f41_arg0 > CoD.CACUtility.maxDefaultClass then
		error( "LUI Error: Default loadout out with index " .. f41_arg0 .. " doesn't exist." )
	end
	return CoD.CACUtility.defaultClassNames[f41_arg0]
end

CoD.CACUtility.SetupCACLock = function ( f42_arg0 )
	CoD.SetupButtonLock( f42_arg0, nil, "FEATURE_CREATE_A_CLASS", "FEATURE_CREATE_A_CLASS_DESC" )
end

CoD.CACUtility.SetupCACNew = function ( f43_arg0 )
	f43_arg0:registerEventHandler( "cac_closed", CoD.CACUtility.SetupCACNew )
	f43_arg0:showNewIcon( Engine.IsAnythingInCACNew( Engine.GetPrimaryController() ) )
end

CoD.CACUtility.SetupScorestreaksNew = function ( f44_arg0 )
	f44_arg0:registerEventHandler( "scorestreaks_closed", CoD.CACUtility.SetupScorestreaksNew )
	f44_arg0:showNewIcon( Engine.WeaponGroupHasNewItem( Engine.GetPrimaryController(), "killstreak" ) )
end

CoD.CACUtility.IsBonusCardEquippedByName = function ( f45_arg0, f45_arg1 )
	local f45_local0 = Engine.GetItemIndex( f45_arg1 )
	for f45_local1 = 1, CoD.CACUtility.maxBonusCards, 1 do
		if f45_local0 ~= nil and f45_arg0["bonuscard" .. f45_local1] == f45_local0 then
			return true
		end
	end
	return false
end

CoD.CACUtility.IsBonusCardEquippedByIndex = function ( f46_arg0, f46_arg1 )
	for f46_local0 = 1, CoD.CACUtility.maxBonusCards, 1 do
		if f46_arg1 ~= nil and f46_arg0["bonuscard" .. f46_local0] == f46_arg1 then
			return true
		end
	end
	return false
end

CoD.CACUtility.GetBonusCardLoadoutSlot = function ( f47_arg0, f47_arg1 )
	for f47_local0 = 1, CoD.CACUtility.maxBonusCards, 1 do
		local f47_local3 = "bonuscard" .. f47_local0
		if f47_arg1 ~= nil and f47_arg0[f47_local3] == f47_arg1 then
			return f47_local3
		end
	end
end

CoD.CACUtility.GetLoadoutSlotForAttachmentName = function ( f48_arg0, f48_arg1, f48_arg2 )
	local f48_local0 = CoD.CACUtility.PrimaryAttachmentSlotNameList
	if LUI.startswith( f48_arg1, "secondary" ) then
		f48_local0 = CoD.CACUtility.SecondaryAttachmentSlotNameList
	end
	for f48_local5, f48_local6 in ipairs( f48_local0 ) do
		local f48_local7 = Engine.GetModel( f48_arg0, f48_local6 )
		if f48_local7 then
			local f48_local4 = Engine.GetModel( f48_local7, "ref" )
			if f48_local4 and Engine.GetModelValue( f48_local4 ) == f48_arg2 then
				return f48_local6
			end
		end
	end
	return nil
end

CoD.CACUtility.GetAttachmentVariantForAttachmentList = function ( f49_arg0, f49_arg1 )
	local f49_local0 = CoD.CACUtility.PrimaryAttachmentSlotNameList
	if LUI.startswith( f49_arg1, "secondary" ) then
		f49_local0 = CoD.CACUtility.SecondaryAttachmentSlotNameList
	end
	local f49_local1 = {}
	for f49_local8, f49_local9 in ipairs( f49_local0 ) do
		local f49_local10 = Engine.GetModel( f49_arg0, f49_local9 )
		if f49_local10 then
			local f49_local5 = Engine.GetModel( f49_local10, "ref" )
			if f49_local5 then
				local f49_local6 = Engine.GetModelValue( f49_local5 )
				if f49_local6 ~= "" then
					local f49_local7 = Engine.GetModel( f49_arg0, f49_local9 .. "cosmeticvariant.itemIndex" )
					if f49_local7 then
						table.insert( f49_local1, {
							ref = f49_local6,
							attachmentIndex = Engine.GetModelValue( f49_local7 )
						} )
					end
				end
			end
		end
	end
	return f49_local1
end

CoD.CACUtility.IsAttachmentRefWeaponOption = function ( f50_arg0 )
	for f50_local0 = 0, #CoD.CACUtility.weaponOptionGroupNames - 1, 1 do
		if CoD.CACUtility.weaponOptionGroupNames[f50_local0] == f50_arg0 then
			return true
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
		local f54_local1 = Engine.GetItemIndex( f54_arg1 )
		for f54_local5, f54_local6 in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
			local f54_local7 = Engine.GetModel( f54_arg0, f54_local6 .. ".itemIndex" )
			if f54_local7 and Engine.GetItemRef( Engine.GetModelValue( f54_local7 ) ) == f54_arg1 then
				f54_local0 = f54_local0 + 1
			end
		end
	end
	return math.min( math.max( f54_local0, 0 ), CoD.CACUtility.maxBonusCards )
end

CoD.CACUtility.SearchForBonusCard = function ( f55_arg0, f55_arg1, f55_arg2 )
	if not f55_arg1 then
		return ""
	end
	local f55_local0 = f55_arg2 or CoD.perController[f55_arg1].classModel
	if f55_local0 then
		for f55_local5, f55_local6 in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
			local f55_local7 = Engine.GetModel( f55_local0, f55_local6 )
			if f55_local7 then
				local f55_local4 = Engine.GetModel( f55_local7, "itemIndex" )
				if f55_local4 and Engine.GetItemRef( Engine.GetModelValue( f55_local4 ) ) == f55_arg0 then
					return f55_local6
				end
			end
		end
	end
	return ""
end

CoD.CACUtility.GetItemRefEquippedInSlot = function ( f56_arg0, f56_arg1, f56_arg2 )
	if not f56_arg1 then
		return 
	end
	local f56_local0 = f56_arg2 or CoD.perController[f56_arg1].classModel
	if f56_local0 then
		local f56_local1 = Engine.GetModel( f56_local0, f56_arg0 )
		if f56_local1 then
			local f56_local2 = Engine.GetModel( f56_local1, "ref" )
			if f56_local2 then
				return Engine.GetModelValue( f56_local2 )
			end
		end
	end
end

CoD.CACUtility.IsItemEquippedInAnySlot = function ( f57_arg0, f57_arg1 )
	for f57_local3, f57_local4 in ipairs( f57_arg1 ) do
		if CoD.CACUtility.ItemEquippedInSlot( f57_local4, nil, f57_arg0 ) then
			return true
		end
	end
	return false
end

CoD.CACUtility.GetItemEquippedInSlot = function ( f58_arg0, f58_arg1, f58_arg2 )
	local f58_local0 = f58_arg2
	if not f58_local0 and f58_arg1 then
		f58_local0 = CoD.perController[f58_arg1].classModel
	end
	if f58_local0 then
		local f58_local1 = Engine.GetModel( f58_local0, f58_arg0 )
		if f58_local1 then
			local f58_local2 = Engine.GetModel( f58_local1, "itemIndex" )
			if f58_local2 then
				return Engine.GetModelValue( f58_local2 )
			end
		end
	end
	return CoD.CACUtility.EmptyItemIndex
end

CoD.CACUtility.ItemEquippedInSlot = function ( f59_arg0, f59_arg1, f59_arg2 )
	return CoD.CACUtility.EmptyItemIndex < CoD.CACUtility.GetItemEquippedInSlot( f59_arg0, f59_arg1, f59_arg2 )
end

CoD.CACUtility.DoesWeaponHaveAnyAttachments = function ( f60_arg0, f60_arg1, f60_arg2 )
	local f60_local0 = Engine.GetModel( f60_arg2, f60_arg0 )
	if f60_local0 then
		local f60_local1 = Engine.GetModelValue( Engine.GetModel( f60_local0, "itemIndex" ) )
		if f60_local1 > CoD.CACUtility.EmptyItemIndex and Engine.GetNumAttachments( f60_local1 ) > 1 then
			return true
		end
	end
	return false
end

CoD.CACUtility.GetItemName = function ( f61_arg0, f61_arg1, f61_arg2 )
	local f61_local0 = f61_arg2
	if not f61_local0 and f61_arg1 then
		f61_local0 = CoD.perController[f61_arg1].classModel
	end
	if f61_local0 then
		local f61_local1 = Engine.GetModel( f61_local0, f61_arg0 )
		if f61_local1 then
			local f61_local2 = Engine.GetModel( f61_local1, "name" )
			if f61_local2 then
				return Engine.GetModelValue( f61_local2 )
			end
		end
	end
	return ""
end

CoD.CACUtility.GetItemReferenceName = function ( f62_arg0, f62_arg1 )
	local f62_local0 = Engine.GetModel( f62_arg0, "itemIndex" )
	if f62_local0 then
		return Engine.GetItemRef( Engine.GetModelValue( f62_local0 ) )
	else
		return ""
	end
end

CoD.CACUtility.AllowTwoPrimaryTacticals = function ( f63_arg0 )
	local f63_local0
	if CoD.CACUtility.SearchForBonusCard( "bonuscard_danger_close", f63_arg0 ) == "" and CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", f63_arg0 ) == "" then
		f63_local0 = false
	else
		f63_local0 = true
	end
	return f63_local0
end

CoD.CACUtility.GetMutuallyExclusiveSlotName = function ( f64_arg0, f64_arg1, f64_arg2 )
	local f64_local0 = Engine.GetItemRef( f64_arg2 )
	if LUI.startswith( f64_arg0, "bonuscard" ) then
		if f64_local0 == "bonuscard_danger_close" then
			return CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", f64_arg1 )
		elseif f64_local0 == "bonuscard_two_tacticals" then
			return CoD.CACUtility.SearchForBonusCard( "bonuscard_danger_close", f64_arg1 )
		end
	elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", f64_arg1 ) and f64_arg0 == "primarygadget" then
		if CoD.CACUtility.GetItemEquippedInSlot( "secondarygadget", f64_arg1 ) == f64_arg2 then
			return "secondarygadget"
		end
	elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", f64_arg1 ) and f64_arg0 == "secondarygadget" then
		if CoD.CACUtility.GetItemEquippedInSlot( "primarygadget", f64_arg1 ) == f64_arg2 then
			return "primarygadget"
		end
	elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_overkill", f64_arg1 ) and f64_arg0 == "primary" then
		if CoD.CACUtility.GetItemEquippedInSlot( "secondary", f64_arg1 ) == f64_arg2 then
			return "secondary"
		end
	elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_overkill", f64_arg1 ) and f64_arg0 == "secondary" then
		if CoD.CACUtility.GetItemEquippedInSlot( "primary", f64_arg1 ) == f64_arg2 then
			return "primary"
		end
	elseif CoD.CACUtility.IsSlotNameInList( CoD.CACUtility.PrimaryAttachmentSlotNameList, f64_arg0 ) or CoD.CACUtility.IsSlotNameInList( CoD.CACUtility.SecondaryAttachmentSlotNameList, f64_arg0 ) then
		local f64_local1 = CoD.CACUtility.GetAttachmentListForSlot( f64_arg0 )
		local f64_local2 = CoD.CACUtility.GetItemEquippedInSlot( CoD.perController[f64_arg1].weaponSlot, f64_arg1 )
		for f64_local6, f64_local7 in ipairs( f64_local1 ) do
			local f64_local8 = CoD.CACUtility.GetItemEquippedInSlot( f64_local7, f64_arg1 )
			if f64_local8 ~= f64_arg2 and not Engine.AreAttachmentsCompatible( f64_local2, f64_local8, f64_arg2 ) then
				return f64_local7
			end
		end
	elseif f64_arg0 == "cybercom_tacrig1" then
		if CoD.CACUtility.GetItemEquippedInSlot( "cybercom_tacrig2", f64_arg1 ) == f64_arg2 then
			return "cybercom_tacrig2"
		end
	elseif f64_arg0 == "cybercom_tacrig2" and CoD.CACUtility.GetItemEquippedInSlot( "cybercom_tacrig1", f64_arg1 ) == f64_arg2 then
		return "cybercom_tacrig1"
	end
	return ""
end

CoD.CACUtility.AttachmentHasCustomReticle = function ( f65_arg0 )
	for f65_local3, f65_local4 in ipairs( CoD.CACUtility.attachmentsWithCustReticle ) do
		if f65_local4 == f65_arg0 then
			return f65_local4
		end
	end
	return nil
end

CoD.CACUtility.GetWeaponOptionMTXName = function ( f66_arg0 )
	return Engine.TableLookup( nil, CoD.attachmentTable, 0, f66_arg0, 16 )
end

CoD.CACUtility.GetBackingMTXName = function ( f67_arg0 )
	return Engine.TableLookup( nil, "gamedata/emblems/emblemsOrBackings.csv", 0, "background", 1, f67_arg0, 10 )
end

CoD.CACUtility.IsWeaponOptionMTX = function ( f68_arg0 )
	local f68_local0 = CoD.CACUtility.GetWeaponOptionMTXName( f68_arg0 )
	return f68_local0 and f68_local0 ~= ""
end

CoD.CACUtility.IsBackingMTX = function ( f69_arg0 )
	local f69_local0 = CoD.CACUtility.GetBackingMTXName( f69_arg0 )
	return f69_local0 and f69_local0 ~= ""
end

CoD.CACUtility.IsAnyWeaponMTXAvailable = function ()
	for f70_local0 = 0, CoD.CACUtility.maxMTXWeaponPacks, 1 do
		if Engine.IsMTXAvailable( "mtx_weapon" .. f70_local0 ) then
			return true
		end
	end
	return false
end

CoD.CACUtility.HasAnyWeaponMTX = function ( f71_arg0 )
	for f71_local0 = 0, CoD.CACUtility.maxMTXWeaponPacks, 1 do
		if Engine.HasMTX( f71_arg0, "mtx_weapon" .. f71_local0 ) then
			return true
		end
	end
	return false
end

CoD.CACUtility.ShouldDisplayWeaponOptionMTX = function ( f72_arg0, f72_arg1 )
	if Engine.SkipMTXItem( CoD.CACUtility.GetWeaponOptionMTXName( f72_arg1 ) ) == true then
		return false
	else
		return true
	end
end

CoD.CACUtility.GetMTXPurchaseMsg = function ( f73_arg0 )
	return "MPUI_" .. Engine.TableLookup( nil, "mp/mtxitems.csv", 1, f73_arg0, 3 ) .. "_MSG"
end

CoD.CACUtility.GetEquipmentLabel = function ( f74_arg0, f74_arg1 )
	local f74_local0 = false
	local f74_local1 = "BAD EQUIPMENT LABEL"
	if f74_local0 then
		if f74_arg0 == CoD.CACUtility.loadoutSlotNames.primaryGadget then
			f74_local1 = Engine.Localize( "MPUI_PRIMARY_GADGET_CAPS" )
		elseif f74_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryGadget then
			f74_local1 = Engine.Localize( "MPUI_SECONDARY_GADGET_CAPS" )
		end
	elseif f74_arg0 == CoD.CACUtility.loadoutSlotNames.primaryGadget then
		if f74_arg1 ~= nil and CoD.CACUtility.IsBonusCardEquippedByName( f74_arg1, "bonuscard_two_tacticals" ) then
			f74_local1 = Engine.Localize( "MPUI_SECOND_SPECIAL_GRENADE_CAPS" )
		else
			f74_local1 = Engine.Localize( "MPUI_PRIMARY_GRENADE_CAPS" )
		end
	elseif f74_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryGadget then
		f74_local1 = Engine.Localize( "MPUI_SPECIAL_GRENADE_CAPS" )
	end
	return f74_local1
end

CoD.CACUtility.UpdateHeaderNames = function ( f75_arg0, f75_arg1, f75_arg2 )
	local f75_local0 = Engine.GetCustomClass( f75_arg0, f75_arg1 )
	local f75_local1 = "MPUI_SECONDARY_WEAPON_CAPS"
	local f75_local2 = "MPUI_PRIMARYGRENADE_CAPS"
	local f75_local3 = "MPUI_SPECIALGRENADE_CAPS"
	if CoD.CACUtility.IsBonusCardEquippedByName( f75_local0, "bonuscard_overkill" ) == true then
		f75_local1 = "MPUI_SECOND_PRIMARY_CAPS"
	end
	if CoD.CACUtility.IsBonusCardEquippedByName( f75_local0, "bonuscard_two_tacticals" ) == true then
		f75_local2 = "MPUI_SECOND_SPECIAL_GRENADE_CAPS"
		f75_local3 = "MPUI_FIRST_SPECIAL_GRENADE_CAPS"
	end
	Engine.SetModelValue( Engine.CreateModel( f75_arg2, "secondary.headerName" ), f75_local1 )
	Engine.SetModelValue( Engine.CreateModel( f75_arg2, "primarygadget.headerName" ), f75_local2 )
	Engine.SetModelValue( Engine.CreateModel( f75_arg2, "primarygadgetattachment1.headerName" ), f75_local2 )
	Engine.SetModelValue( Engine.CreateModel( f75_arg2, "secondarygadget.headerName" ), f75_local3 )
	Engine.SetModelValue( Engine.CreateModel( f75_arg2, "secondarygadgetattachment1.headerName" ), f75_local3 )
	if not Engine.GetModel( f75_arg2, "primary.headerName" ) then
		Engine.SetModelValue( Engine.CreateModel( f75_arg2, "primary.headerName" ), "MPUI_PRIMARY_WEAPON_CAPS" )
		for f75_local7, f75_local8 in ipairs( CoD.CACUtility.PrimaryAttachmentSlotNameList ) do
			if f75_local7 == 1 then
				Engine.SetModelValue( Engine.CreateModel( f75_arg2, f75_local8 .. ".headerName" ), "MPUI_PRIMARY_OPTIC_CAPS" )
			else
				Engine.SetModelValue( Engine.CreateModel( f75_arg2, f75_local8 .. ".headerName" ), "MPUI_PRIMARY_ATTACHMENT_CAPS" )
			end
		end
		for f75_local7, f75_local8 in ipairs( CoD.CACUtility.SecondaryAttachmentSlotNameList ) do
			if f75_local7 == 1 then
				Engine.SetModelValue( Engine.CreateModel( f75_arg2, f75_local8 .. ".headerName" ), "MPUI_SECONDARY_OPTIC_CAPS" )
			else
				Engine.SetModelValue( Engine.CreateModel( f75_arg2, f75_local8 .. ".headerName" ), "MPUI_SECONDARY_ATTACHMENT_CAPS" )
			end
		end
		for f75_local7, f75_local8 in ipairs( CoD.CACUtility.Perk1SlotNameList ) do
			Engine.SetModelValue( Engine.CreateModel( f75_arg2, f75_local8 .. ".headerName" ), "MPUI_PERK1_CAPS" )
		end
		for f75_local7, f75_local8 in ipairs( CoD.CACUtility.Perk2SlotNameList ) do
			Engine.SetModelValue( Engine.CreateModel( f75_arg2, f75_local8 .. ".headerName" ), "MPUI_PERK2_CAPS" )
		end
		for f75_local7, f75_local8 in ipairs( CoD.CACUtility.Perk3SlotNameList ) do
			Engine.SetModelValue( Engine.CreateModel( f75_arg2, f75_local8 .. ".headerName" ), "MPUI_PERK3_CAPS" )
		end
		for f75_local7, f75_local8 in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
			Engine.SetModelValue( Engine.CreateModel( f75_arg2, f75_local8 .. ".headerName" ), "MENU_WILDCARD_CAPS" )
		end
	end
	local f75_local4 = "MENU_TACTICAL_RIG_CAPS"
	Engine.SetModelValue( Engine.CreateModel( f75_arg2, "cybercom_tacrig1.headerName" ), f75_local4 )
	Engine.SetModelValue( Engine.CreateModel( f75_arg2, "cybercom_tacrig2.headerName" ), f75_local4 )
end

CoD.CACUtility.AddBigImagesToCustomClassModel = function ( f76_arg0, f76_arg1, f76_arg2, f76_arg3 )
	local f76_local0 = Engine.GetModel( f76_arg1, f76_arg2 )
	if not f76_local0 then
		return 
	end
	local f76_local1 = Engine.GetModel( f76_local0, "image" )
	if f76_local1 then
		local f76_local2 = Engine.GetModelValue( f76_local1 )
		if f76_local2 then
			if f76_local2 == CoD.CACUtility.DefaultLoadoutImage then
				f76_arg3 = ""
			end
			Engine.SetModelValue( Engine.CreateModel( f76_local0, "image_big" ), f76_local2 .. f76_arg3 )
		end
	end
end

CoD.CACUtility.GetBonucardUnlockHint = function ( f77_arg0, f77_arg1 )
	local f77_local0 = Engine.GetItemIndex( f77_arg1 )
	return Engine.Localize( f77_arg0, Engine.GetItemName( f77_local0 ), Engine.GetItemUnlockLevel( f77_local0 ) + 1 )
end

CoD.CACUtility.GetCACSlotStatus = function ( f78_arg0, f78_arg1, f78_arg2 )
	local f78_local0 = CoD.CACUtility.CACStatusAvailable.AVAILABLE
	local f78_local1 = false
	local f78_local2 = ""
	local f78_local3 = nil
	if CoD.CACUtility.ItemEquippedInSlot( f78_arg2, f78_arg0, f78_arg1 ) then
		f78_local1 = true
		if f78_arg2 == "primary" or f78_arg2 == "secondary" then
			if CoD.isPC then
				f78_local2 = CoD.CACUtility.GetItemName( f78_arg2, f78_arg0, f78_arg1 )
			else
				f78_local2 = "MPUI_BUTTON_PERSONALIZE_CAPS"
			end
		end
	elseif f78_arg2 == "primary" or f78_arg2 == "secondary" then
		f78_local2 = "MPUI_EQUIP_WEAPON"
	elseif f78_arg2 == "primarygadget" then
		if CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", f78_arg0 ) ~= "" then
			f78_local2 = "MPUI_EQUIP_TACTICAL"
		else
			f78_local2 = "MPUI_EQUIP_LETHAL"
		end
	elseif f78_arg2 == "secondarygadget" then
		f78_local2 = "MPUI_EQUIP_TACTICAL"
	elseif LUI.startswith( f78_arg2, "specialty" ) then
		f78_local2 = "MPUI_EQUIP_PERK"
		if f78_arg2 == "specialty4" then
			if IsNonAttachmentItemLocked( f78_arg0, "bonuscard_perk_1_greed" ) then
				f78_local2 = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_perk_1_greed" )
				f78_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_1_greed", f78_arg0, f78_arg1 ) == "" then
				f78_local2 = "MPUI_REQUIRES_PERK_1_GREED"
				f78_local0 = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			end
		elseif f78_arg2 == "specialty5" then
			if IsNonAttachmentItemLocked( f78_arg0, "bonuscard_perk_2_greed" ) then
				f78_local2 = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_perk_2_greed" )
				f78_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_2_greed", f78_arg0, f78_arg1 ) == "" then
				f78_local2 = "MPUI_REQUIRES_PERK_2_GREED"
				f78_local0 = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			end
		elseif f78_arg2 == "specialty6" then
			if IsNonAttachmentItemLocked( f78_arg0, "bonuscard_perk_3_greed" ) then
				f78_local2 = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_perk_3_greed" )
				f78_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_3_greed", f78_arg0, f78_arg1 ) == "" then
				f78_local2 = "MPUI_REQUIRES_PERK_3_GREED"
				f78_local0 = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			end
		end
	elseif LUI.startswith( f78_arg2, "primaryattachment" ) then
		local f78_local4 = CoD.CACUtility.GetItemEquippedInSlot( "primary", f78_arg0, f78_arg1 )
		local f78_local5 = Engine.GetNumAttachments( f78_local4 )
		if f78_arg2 == "primaryattachment1" then
			f78_local2 = "MPUI_EQUIP_OPTIC"
		else
			f78_local2 = "MPUI_EQUIP_ATTACHMENT"
		end
		if f78_local4 <= CoD.CACUtility.EmptyItemIndex then
			f78_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			if f78_arg2 == "primaryattachment1" then
				f78_local2 = "MPUI_OPTICS_NOT_AVAILABLE"
			else
				f78_local2 = "MPUI_ATTACHMENTS_NOT_AVAILABLE"
			end
		elseif f78_arg2 == "primaryattachment1" and Engine.GetNumOptics( f78_local4 ) <= 1 then
			f78_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			f78_local2 = "MPUI_OPTICS_NOT_AVAILABLE"
		elseif (f78_arg2 == "primaryattachment2" or f78_arg2 == "primaryattachment3") and f78_local5 <= 1 then
			f78_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			f78_local2 = "MPUI_ATTACHMENTS_NOT_AVAILABLE"
		elseif f78_arg2 == "primaryattachment4" or f78_arg2 == "primaryattachment5" or f78_arg2 == "primaryattachment6" then
			if f78_local5 <= 1 then
				f78_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
				f78_local2 = "MPUI_ATTACHMENTS_NOT_AVAILABLE"
			elseif IsNonAttachmentItemLocked( f78_arg0, "bonuscard_primary_gunfighter" ) then
				f78_local2 = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_primary_gunfighter" )
				f78_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			else
				local f78_local6 = CoD.CACUtility.SpecificWildcardEquippedCount( f78_arg1, "bonuscard_primary_gunfighter" )
				if not (f78_arg2 ~= "primaryattachment4" or f78_local6 >= 1) or not (f78_arg2 ~= "primaryattachment5" or f78_local6 >= 2) or f78_arg2 == "primaryattachment6" and f78_local6 < 3 then
					f78_local2 = "MPUI_REQUIRES_PRIMARY_GUNFIGHTER"
					f78_local0 = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
				end
			end
		end
	elseif LUI.startswith( f78_arg2, "secondaryattachment" ) then
		local f78_local4 = CoD.CACUtility.GetItemEquippedInSlot( "secondary", f78_arg0, f78_arg1 )
		local f78_local5 = Engine.GetNumAttachments( f78_local4 )
		if f78_arg2 == "primaryattachment1" then
			f78_local2 = "MPUI_EQUIP_OPTIC"
		else
			f78_local2 = "MPUI_EQUIP_ATTACHMENT"
		end
		if f78_local4 <= CoD.CACUtility.EmptyItemIndex then
			f78_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			if f78_arg2 == "secondaryattachment1" then
				f78_local2 = "MPUI_OPTICS_NOT_AVAILABLE"
			else
				f78_local2 = "MPUI_ATTACHMENTS_NOT_AVAILABLE"
			end
		elseif f78_arg2 == "secondaryattachment1" and Engine.GetNumOptics( f78_local4 ) <= 1 then
			f78_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			f78_local2 = "MPUI_OPTICS_NOT_AVAILABLE"
		elseif f78_arg2 == "secondaryattachment2" and f78_local5 <= 1 then
			f78_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			f78_local2 = "MPUI_ATTACHMENTS_NOT_AVAILABLE"
		elseif f78_arg2 == "secondaryattachment3" then
			if f78_local5 <= 1 then
				f78_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
				f78_local2 = "MPUI_ATTACHMENTS_NOT_AVAILABLE"
			elseif IsNonAttachmentItemLocked( f78_arg0, "bonuscard_secondary_gunfighter" ) then
				f78_local2 = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_secondary_gunfighter" )
				f78_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_secondary_gunfighter", f78_arg0, f78_arg1 ) == "" then
				f78_local2 = "MPUI_REQUIRES_SECONDARY_GUNFIGHTER"
				f78_local0 = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			end
		end
	elseif LUI.startswith( f78_arg2, "primarygadgetattachment" ) then
		local f78_local4 = CoD.CACUtility.GetItemEquippedInSlot( "primarygadget", f78_arg0, f78_arg1 )
		f78_local3 = CoD.CACUtility.GetItemName( "primarygadget", f78_arg0, f78_arg1 )
		f78_local2 = "MPUI_EQUIP_TAKE_TWO"
		if not f78_local4 or f78_local4 <= CoD.CACUtility.EmptyItemIndex then
			f78_local2 = "MPUI_TAKE_TWO_NOT_AVAILABLE"
			f78_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
		elseif IsNonAttachmentItemLocked( f78_arg0, "bonuscard_danger_close" ) then
			f78_local2 = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_danger_close" )
			f78_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
		elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_danger_close", f78_arg0 ) == "" and CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", f78_arg0 ) == "" then
			f78_local0 = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			f78_local2 = "MPUI_REQUIRES_DANGER_CLOSE"
		end
	elseif LUI.startswith( f78_arg2, "secondarygadgetattachment" ) then
		local f78_local4 = CoD.CACUtility.GetItemEquippedInSlot( "secondarygadget", f78_arg0, f78_arg1 )
		local f78_local5 = CoD.CACUtility.GetItemName( "secondarygadget", f78_arg0, f78_arg1 )
		f78_local2 = "MPUI_EQUIP_TAKE_TWO"
		f78_local3 = f78_local5
		if f78_local4 <= CoD.CACUtility.EmptyItemIndex or not Engine.GadgetHasTakeTwoAttachment( f78_local4 ) then
			f78_local0 = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			f78_local2 = "MPUI_TAKE_TWO_NOT_AVAILABLE"
		end
	elseif LUI.startswith( f78_arg2, "bonuscard" ) then
		f78_local2 = "MPUI_EQUIP_WILDCARD"
	end
	return f78_local0, f78_local1, f78_local2, f78_local3
end

CoD.CACUtility.WildcardNeededForSlot = function ( f79_arg0, f79_arg1 )
	local f79_local0 = CoD.perController[f79_arg0].classModel
	local f79_local1 = nil
	local f79_local2 = false
	local f79_local3 = true
	if f79_arg1 == "specialty4" then
		f79_local1 = "bonuscard_perk_1_greed"
		f79_local2 = true
		f79_local3 = IsNonAttachmentItemLocked( f79_arg0, "bonuscard_perk_1_greed" )
	elseif f79_arg1 == "specialty5" then
		f79_local1 = "bonuscard_perk_2_greed"
		f79_local2 = true
		f79_local3 = IsNonAttachmentItemLocked( f79_arg0, "bonuscard_perk_2_greed" )
	elseif f79_arg1 == "specialty6" then
		f79_local1 = "bonuscard_perk_3_greed"
		f79_local2 = true
		f79_local3 = IsNonAttachmentItemLocked( f79_arg0, "bonuscard_perk_3_greed" )
	elseif f79_arg1 == "primaryattachment4" or f79_arg1 == "primaryattachment5" or f79_arg1 == "primaryattachment6" then
		f79_local1 = "bonuscard_primary_gunfighter"
		f79_local2 = CoD.CACUtility.ItemEquippedInSlot( "primary", f79_arg0, f79_local0 )
		f79_local3 = IsNonAttachmentItemLocked( f79_arg0, "bonuscard_primary_gunfighter" )
	elseif f79_arg1 == "secondaryattachment3" then
		local f79_local4 = Engine.GetNumAttachments( CoD.CACUtility.GetItemEquippedInSlot( "secondary", f79_arg0, f79_local0 ) )
		f79_local1 = "bonuscard_secondary_gunfighter"
		if f79_local4 > 1 then
			f79_local2 = CoD.CACUtility.ItemEquippedInSlot( "secondary", f79_arg0, f79_local0 )
		else
			f79_local2 = false
		end
		f79_local3 = IsNonAttachmentItemLocked( f79_arg0, "bonuscard_secondary_gunfighter" )
	elseif f79_arg1 == "primarygadgetattachment1" then
		f79_local1 = "bonuscard_danger_close"
		f79_local2 = CoD.CACUtility.ItemEquippedInSlot( "primarygadget", f79_arg0, f79_local0 )
		f79_local3 = IsNonAttachmentItemLocked( f79_arg0, "bonuscard_danger_close" )
	end
	return f79_local1, f79_local2, f79_local3
end

CoD.CACUtility.UpdateGrenadeNames = function ( f80_arg0, f80_arg1, f80_arg2 )
	local f80_local0 = function ( f81_arg0 )
		local f81_local0 = Engine.CreateModel( f80_arg2, f81_arg0 .. ".modifiedName" )
		if CoD.CACUtility.ItemEquippedInSlot( f81_arg0, f80_arg0, f80_arg2 ) then
			local f81_local1 = Engine.GetModel( f80_arg2, f81_arg0 .. ".name" )
			if f81_local1 and f81_local0 then
				local f81_local2 = Engine.GetModelValue( f81_local1 )
				if CoD.CACUtility.ItemEquippedInSlot( f81_arg0 .. "attachment1", f80_arg0, f80_arg2 ) then
					f81_local2 = Engine.Localize( "MPUI_X2_GRENADE", f81_local2 )
				end
				Engine.SetModelValue( f81_local0, f81_local2 )
			end
		else
			Engine.SetModelValue( f81_local0, "" )
		end
	end
	
	f80_local0( "primarygadget" )
	f80_local0( "secondarygadget" )
end

CoD.CACUtility.UpdateEmptySlotImages = function ( f82_arg0, f82_arg1, f82_arg2 )
	local f82_local0 = Engine.GetCustomClass( f82_arg0, f82_arg1 )
	local f82_local1 = CoD.CACUtility.IsBonusCardEquippedByName( f82_local0, "bonuscard_overkill" )
	local f82_local2 = CoD.CACUtility.IsBonusCardEquippedByName( f82_local0, "bonuscard_two_tacticals" )
	for f82_local7, f82_local6 in pairs( CoD.CACUtility.emptyImageSlotList ) do
		local f82_local8 = Engine.GetModel( f82_arg2, f82_local7 )
		if f82_local8 then
			if f82_local7 == "secondary" and f82_local1 == true then
				f82_local6 = CoD.CACUtility.emptyImageSlotList.primary
			elseif LUI.startswith( f82_local7, "primarygadget" ) and f82_local2 == true then
				f82_local6 = CoD.CACUtility.emptyImageSlotList.secondarygadget
			end
			Engine.SetModelValue( Engine.CreateModel( f82_local8, "emptyImage" ), f82_local6 )
		end
	end
end

CoD.CACUtility.GetCustomClassModel = function ( f83_arg0, f83_arg1, f83_arg2 )
	Engine.GetCustomClassModel( f83_arg0, f83_arg1, f83_arg2 )
	Engine.SetModelValue( Engine.CreateModel( f83_arg2, "classNum" ), f83_arg1 )
	if CoD.perController[f83_arg0].isPreset == true then
		local f83_local0 = Engine.GetModel( f83_arg2, "customClassName" )
		Engine.SetModelValue( f83_local0, Engine.Localize( Engine.GetModelValue( f83_local0 ) ) )
	end
	if f83_arg1 >= 10 then
		Engine.SetModelValue( Engine.CreateModel( f83_arg2, "defaultClassName" ), Engine.GetDefaultClassName( f83_arg1 - 10 ) )
	end
	CoD.CACUtility.UpdateHeaderNames( f83_arg0, f83_arg1, f83_arg2 )
	local f83_local0 = function ( f84_arg0 )
		local f84_local0 = Engine.GetModel( f83_arg2, f84_arg0 .. "gunsmithvariant" )
		if f84_local0 then
			local f84_local1 = Engine.CreateModel( f83_arg2, f84_arg0 .. ".variantName" )
			local f84_local2 = Engine.GetModelValue( Engine.GetModel( f84_local0, "itemIndex" ) )
			if f84_local2 > CoD.CACUtility.EmptyItemIndex then
				local f84_local3 = CoD.CraftUtility.Gunsmith.GetVariantIndexFromCACVaraintIndex( f83_arg0, f84_local2 )
				if f84_local3 then
					Engine.SetModelValue( f84_local1, f84_local3.variantName )
				end
			else
				Engine.SetModelValue( f84_local1, "" )
			end
		end
	end
	
	if not Engine.IsInGame() then
		f83_local0( "primary" )
		f83_local0( "secondary" )
	end
	local f83_local1 = function ( f85_arg0 )
		local f85_local0 = Engine.GetModel( f83_arg2, f85_arg0 )
		if not f85_local0 then
			return 
		end
		local f85_local1 = Engine.GetModel( f85_local0, "image" )
		if f85_local1 then
			local f85_local2 = Engine.GetModelValue( f85_local1 )
			if f85_local2 and f85_local2 ~= CoD.CACUtility.DefaultLoadoutImage then
				Engine.SetModelValue( f85_local1, f85_local2 )
			end
		end
	end
	
	f83_local1( "primary" )
	f83_local1( "secondary" )
	local f83_local2 = function ( f86_arg0, f86_arg1, f86_arg2 )
		for f86_local4, f86_local5 in ipairs( f86_arg1 ) do
			local f86_local6 = Engine.GetModelValue( Engine.GetModel( f83_arg2, f86_local5 .. ".itemIndex" ) )
			if f86_local6 > CoD.CACUtility.EmptyItemIndex and Engine.GetModelValue( Engine.GetModel( f83_arg2, f86_arg2[f86_local4] .. ".itemIndex" ) ) > CoD.CACUtility.EmptyItemIndex then
				local f86_local3 = Engine.GetAttachmentCosmeticVariant( Engine.GetWeaponString( f83_arg0, f83_arg1, f86_arg0 ), Engine.GetItemAttachment( Engine.GetModelValue( Engine.GetModel( f83_arg2, f86_arg0 .. ".itemIndex" ) ), f86_local6 ) )
				if f86_local3 then
					Engine.SetModelValue( Engine.GetModel( f83_arg2, f86_local5 .. ".image" ), f86_local3.image )
					Engine.SetModelValue( Engine.GetModel( f83_arg2, f86_local5 .. "cosmeticvariant.image" ), f86_local3.image )
					Engine.SetModelValue( Engine.GetModel( f83_arg2, f86_local5 .. ".name" ), f86_local3.name )
					Engine.SetModelValue( Engine.GetModel( f83_arg2, f86_local5 .. "cosmeticvariant.name" ), f86_local3.name )
				end
			end
		end
	end
	
	f83_local2( "primary", CoD.CACUtility.PrimaryAttachmentSlotNameList, CoD.CACUtility.PrimaryAttachmentCVSlotNameList )
	f83_local2( "secondary", CoD.CACUtility.SecondaryAttachmentSlotNameList, CoD.CACUtility.SecondaryAttachmentCVSlotNameList )
	CoD.CACUtility.AddBigImagesToCustomClassModel( f83_arg0, f83_arg2, "primary", "_big" )
	CoD.CACUtility.AddBigImagesToCustomClassModel( f83_arg0, f83_arg2, "secondary", "_big" )
	CoD.CACUtility.AddBigImagesToCustomClassModel( f83_arg0, f83_arg2, "primarygadget", "_256" )
	CoD.CACUtility.AddBigImagesToCustomClassModel( f83_arg0, f83_arg2, "secondarygadget", "_256" )
	CoD.CACUtility.AddBigImagesToCustomClassModel( f83_arg0, f83_arg2, "specialgadget", "_256" )
	DataSources.CustomClassMenu.updateWeaponAttachmentList( f83_arg0, f83_arg2, "primary", CoD.CACUtility.maxPrimaryAttachments )
	DataSources.CustomClassMenu.updateWeaponAttachmentList( f83_arg0, f83_arg2, "secondary", CoD.CACUtility.maxSecondaryAttachments )
	DataSources.CustomClassMenu.updateCustomSlotModel( f83_arg2, "primarygadget", f83_arg0 )
	DataSources.CustomClassMenu.updateCustomSlotModel( f83_arg2, "secondarygadget", f83_arg0 )
	CoD.CACUtility.UpdateGrenadeNames( f83_arg0, f83_arg1, f83_arg2 )
	CoD.CACUtility.UpdateEmptySlotImages( f83_arg0, f83_arg1, f83_arg2 )
	for f83_local11, f83_local12 in ipairs( CoD.CACUtility.loadoutSlotOrder ) do
		local f83_local13 = Engine.GetModel( f83_arg2, f83_local12 )
		if f83_local13 then
			local f83_local6 = Engine.CreateModel( f83_local13, "hintText" )
			if f83_local6 then
				local f83_local7, f83_local8, f83_local9, f83_local10 = CoD.CACUtility.GetCACSlotStatus( f83_arg0, f83_arg2, f83_local12 )
				if f83_local10 ~= nil then
					Engine.SetModelValue( f83_local6, Engine.Localize( f83_local9, f83_local10 ) )
				else
					Engine.SetModelValue( f83_local6, Engine.Localize( f83_local9 ) )
				end
			end
		end
	end
end

CoD.CACUtility.UpdateWeaponOptions = function ( f87_arg0, f87_arg1 )
	local f87_local0 = CoD.perController[f87_arg0].weaponCategory
	local f87_local1 = Engine.GetModelForController( f87_arg0 )
	local f87_local2 = function ( f88_arg0, f88_arg1, f88_arg2 )
		local f88_local0 = Engine.GetModelForController( f88_arg0 )
		for f88_local1 = 0, #CoD.CACUtility.weaponOptionGroupNames - 1, 1 do
			local f88_local4 = CoD.CACUtility.weaponOptionGroupNames[f88_local1]
			local f88_local5 = f88_arg2 .. f88_local4
			local f88_local6 = Engine.GetModel( f88_arg1, f88_local5 .. ".itemIndex" )
			if f88_local6 then
				local f88_local7 = Engine.GetModel( f88_local0, "WeaponOptions." .. f88_local4 .. "." .. Engine.GetModelValue( f88_local6 ) )
				if f88_local7 then
					local f88_local8 = Engine.GetModel( f88_arg1, f88_local5 .. ".name" )
					local f88_local9 = Engine.GetModel( f88_arg1, f88_local5 .. ".image" )
					if f88_local8 and f88_local9 then
						Engine.SetModelValue( f88_local8, Engine.GetModelValue( Engine.GetModel( f88_local7, "name" ) ) )
						Engine.SetModelValue( f88_local9, Engine.GetModelValue( Engine.GetModel( f88_local7, "image" ) ) )
					end
				end
			end
		end
	end
	
	f87_local2( f87_arg0, f87_arg1, "primary" )
	f87_local2( f87_arg0, f87_arg1, "secondary" )
	CoD.CACUtility.UpdateWeaponCustomizationCategoryList( f87_arg0, f87_arg1 )
end

CoD.CACUtility.UpdateAttachmentCosmeticVariants = function ( f89_arg0, f89_arg1 )
	local f89_local0 = function ( f90_arg0, f90_arg1 )
		for f90_local15, f90_local16 in pairs( f90_arg1 ) do
			local f90_local17 = f90_local16 .. "cosmeticvariant"
			local f90_local18 = Engine.GetModel( f90_arg0, f90_local16 )
			local f90_local19 = Engine.GetModel( f90_arg0, f90_local17 )
			if f90_local19 and f90_local18 then
				local f90_local3 = Engine.GetModel( f90_local19, "itemIndex" )
				local f90_local4 = Engine.GetModel( f90_local18, "itemIndex" )
				if f90_local3 and f90_local4 then
					local f90_local5 = Engine.GetModelValue( f90_local3 )
					if f90_local5 > 0 and Engine.GetModelValue( f90_local4 ) > 0 then
						local f90_local6 = Engine.GetModel( f90_local19, "name" )
						local f90_local7 = Engine.GetModel( f90_local19, "image" )
						local f90_local8 = Engine.GetModel( f90_local19, "ref" )
						local f90_local9 = Engine.GetModel( f90_local18, "ref" )
						if f90_local6 and f90_local7 and f90_local8 and f90_local9 then
							local f90_local10 = Engine.GetModelValue( f90_local9 )
							if CoD.WC_Category.ACV.attachmentTable[f90_local10] then
								local f90_local11 = CoD.WC_Category.ACV.attachmentTable[f90_local10].variants[f90_local5]
								local f90_local12 = Engine.SetModelValue
								local f90_local13 = f90_local6
								local f90_local14
								if f90_local11 then
									f90_local14 = f90_local11.name
									if not f90_local14 then
									
									else
										f90_local12( f90_local13, f90_local14 )
										f90_local12 = Engine.SetModelValue
										f90_local13 = f90_local7
										if f90_local11 then
											f90_local14 = f90_local11.image
											if not f90_local14 then
											
											else
												f90_local12( f90_local13, f90_local14 )
												Engine.SetModelValue( f90_local8, f90_local10 )
											end
										end
										f90_local14 = ""
									end
								end
								f90_local14 = ""
							end
						end
					end
				end
			end
		end
	end
	
	f89_local0( f89_arg1, CoD.CACUtility.PrimaryAttachmentSlotNameList )
	f89_local0( f89_arg1, CoD.CACUtility.SecondaryAttachmentSlotNameList )
	CoD.CACUtility.UpdateWeaponCustomizationCategoryList( f89_arg0, f89_arg1 )
end

CoD.CACUtility.UpdateWeaponCustomizationCategoryList = function ( f91_arg0, f91_arg1 )
	local f91_local0 = Engine.GetModelForController( f91_arg0 )
	local f91_local1 = CoD.perController[f91_arg0].weaponCategory
	local f91_local2 = Engine.GetModel( f91_local0, "WeaponCustomizationCategory" )
	if f91_local2 then
		for f91_local3 = 1, CoD.CACUtility.maxWeaponCustomizationCategories, 1 do
			local f91_local6 = Engine.GetModel( f91_local2, f91_local3 )
			if f91_local6 then
				local f91_local7 = Engine.GetModel( f91_local6, "type" )
				if f91_local7 then
					local f91_local8 = Engine.GetModelValue( f91_local7 )
					if f91_local8 == "paintjob" then
						local f91_local9 = Engine.GetModelValue( Engine.GetModel( f91_arg1, f91_local1 .. "paintjobindex.itemIndex" ) )
						Engine.SetModelValue( Engine.GetModel( f91_local6, "paintjobIndex" ), f91_local9 )
						local f91_local10 = Engine.GetModelValue( Engine.GetModel( f91_arg1, f91_local1 .. "paintjobslot.itemIndex" ) )
						Engine.SetModelValue( Engine.GetModel( f91_local6, "paintjobSlot" ), f91_local10 )
						Engine.SetModelValue( Engine.GetModel( f91_local6, "paintjobSlotAndIndex" ), f91_local10 .. " " .. f91_local9 )
					end
					local f91_local11 = Engine.GetModel( f91_arg1, f91_local1 .. f91_local8 )
					local f91_local9 = Engine.GetModel( f91_local6, "attachmentIndex" )
					if f91_local11 then
						local f91_local12 = Engine.GetModelValue( Engine.GetModel( f91_local11, "name" ) )
						local f91_local10 = Engine.GetModelValue( Engine.GetModel( f91_local11, "image" ) )
						Engine.SetModelValue( Engine.GetModel( f91_local6, "name" ), f91_local12 )
						Engine.SetModelValue( Engine.GetModel( f91_local6, "image" ), f91_local10 )
					end
					if f91_local9 then
						local f91_local10 = f91_local1 .. "attachment" .. Engine.GetModelValue( f91_local9 ) .. "cosmeticvariant"
						local f91_local13 = Engine.GetModelValue( Engine.GetModel( f91_arg1, f91_local10 .. ".name" ) )
						local f91_local14 = Engine.GetModelValue( Engine.GetModel( f91_arg1, f91_local10 .. ".image" ) )
						Engine.SetModelValue( Engine.GetModel( f91_local6, "name" ), f91_local13 )
						Engine.SetModelValue( Engine.GetModel( f91_local6, "image" ), f91_local14 )
					end
				end
			end
		end
	end
end

CoD.CACUtility.UpdateAllClasses = function ( f92_arg0 )
	local f92_local0 = Engine.GetCustomClassCount( f92_arg0 )
	local f92_local1 = Engine.GetModel( Engine.GetModelForController( f92_arg0 ), "CustomClassList" )
	for f92_local2 = 1, f92_local0, 1 do
		CoD.CACUtility.GetCustomClassModel( f92_arg0, f92_local2 - 1, Engine.GetModel( f92_local1, "class" .. f92_local2 ) )
	end
end

CoD.CACUtility.GetWeaponOptionsFromClass = function ( f93_arg0, f93_arg1, f93_arg2 )
	if not f93_arg1 then
		f93_arg1 = CoD.perController[f93_arg0].classModel
	end
	local f93_local0 = Engine.GetModel( f93_arg1, f93_arg2 .. "camo.itemIndex" )
	local f93_local1 = Engine.GetModel( f93_arg1, f93_arg2 .. "reticle.itemIndex" )
	local f93_local2 = Engine.GetModel( f93_arg1, f93_arg2 .. "paintjobslot.itemIndex" )
	local f93_local3 = Engine.GetModel( f93_arg1, f93_arg2 .. "paintjobindex.itemIndex" )
	local f93_local4 = "0"
	local f93_local5 = "0"
	local f93_local6 = 0
	if f93_local0 then
		f93_local4 = Engine.GetModelValue( f93_local0 )
	end
	if f93_local1 then
		f93_local5 = Engine.GetModelValue( f93_local1 )
	end
	if f93_local2 and f93_local3 then
		local f93_local7 = Engine.GetModelValue( f93_local2 )
		local f93_local8 = Engine.GetModelValue( f93_local3 )
		if f93_local7 ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and f93_local8 ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
			Engine.SetupPaintjobData( f93_arg0, f93_local7, f93_local8 )
			f93_local6 = 1
		end
	end
	return f93_local4 .. "," .. f93_local5 .. "," .. f93_local6
end

CoD.CACUtility.EmptyWeaponOptions = function ()
	return "0" .. "," .. "0" .. "," .. 0
end

CoD.CACUtility.GetAttachmentCosmeticVariantsFromClass = function ( f95_arg0, f95_arg1, f95_arg2 )
	if not f95_arg1 then
		f95_arg1 = CoD.perController[f95_arg0].classModel
	end
	local f95_local0 = ""
	local f95_local1 = CoD.CACUtility.GetAttachmentVariantForAttachmentList( f95_arg1, f95_arg2 )
	for f95_local2 = 1, #f95_local1, 1 do
		f95_local0 = f95_local0 .. f95_local1[f95_local2].ref .. "," .. f95_local1[f95_local2].attachmentIndex .. ","
	end
	return f95_local0
end

CoD.CACUtility.GetWeaponOptionsFromVariantInfo = function ( f96_arg0, f96_arg1 )
	local f96_local0 = "0"
	local f96_local1 = "0"
	local f96_local2 = 0
	if f96_arg1.camoIndex then
		f96_local0 = f96_arg1.camoIndex
	end
	if f96_arg1.reticleIndex then
		f96_local1 = f96_arg1.reticleIndex
	end
	if f96_arg1.paintjobSlot and f96_arg1.paintjobIndex and f96_arg1.paintjobSlot ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and f96_arg1.paintjobIndex ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
		Engine.SetupPaintjobData( f96_arg0, f96_arg1.paintjobSlot, f96_arg1.paintjobIndex )
		f96_local2 = 1
	end
	return f96_local0 .. "," .. f96_local1 .. "," .. f96_local2
end

CoD.CACUtility.GetAttachmentCosmeticVariantsFromVariantInfo = function ( f97_arg0 )
	local f97_local0 = ""
	for f97_local4, f97_local5 in ipairs( f97_arg0.attachmentVariant ) do
		local f97_local6 = f97_arg0.attachment[f97_local4]
		if f97_local6 > CoD.CACUtility.EmptyItemIndex then
			f97_local0 = f97_local0 .. Engine.GetAttachmentRefByIndex( f97_local6 ) .. "," .. f97_local5 .. ","
		end
	end
	return f97_local0
end

CoD.CACUtility.GetBaseWeaponLoadoutSlotName = function ( f98_arg0 )
	local f98_local0 = nil
	if f98_arg0 == "primary" or f98_arg0 == "secondary" or f98_arg0 == "primarygadget" or f98_arg0 == "secondarygadget" or f98_arg0 == "cybercore" or LUI.startswith( f98_arg0, "specialty" ) or LUI.startswith( f98_arg0, "bonuscard" ) then
		f98_local0 = f98_arg0
	elseif LUI.startswith( f98_arg0, "primaryattachment" ) then
		f98_local0 = "primary"
	elseif LUI.startswith( f98_arg0, "secondaryattachment" ) then
		f98_local0 = "secondary"
	elseif LUI.startswith( f98_arg0, "primarygadgetattachment" ) then
		f98_local0 = "primarygadget"
	elseif LUI.startswith( f98_arg0, "secondarygadgetattachment" ) then
		f98_local0 = "secondarygadget"
	elseif LUI.startswith( f98_arg0, "cybercom_" ) then
		f98_local0 = "cybercom"
	end
	return f98_local0
end

CoD.CACUtility.GetGunLevelWeaponIndex = function ( f99_arg0, f99_arg1 )
	local f99_local0 = CoD.perController[f99_arg0].classModel
	local f99_local1 = CoD.perController[f99_arg0].weaponCategory
	local f99_local2 = CoD.perController[f99_arg0].weaponSlot
	if f99_local1 and (LUI.startswith( f99_local1, "primaryattachment" ) or LUI.startswith( f99_local1, "secondaryattachment" )) then
		if f99_local2 then
			local f99_local3 = Engine.GetModel( f99_local0, f99_local2 .. ".itemIndex" )
			if f99_local3 then
				return Engine.GetModelValue( f99_local3 )
			end
		end
	elseif f99_arg1 then
		local f99_local3 = f99_arg1:getModel( f99_arg0, "itemIndex" )
		if f99_local3 then
			return Engine.GetModelValue( f99_local3 )
		end
		local f99_local4 = f99_arg1:getModel( f99_arg0, "weaponIndex" )
		if f99_local4 then
			return Engine.GetModelValue( f99_local4 )
		end
	end
	return CoD.CACUtility.EmptyItemIndex
end

CoD.CACUtility.AttachmentEquippedInCACSlot = function ( f100_arg0, f100_arg1, f100_arg2 )
	local f100_local0 = CoD.perController[f100_arg0].classModel
	local f100_local1 = CoD.CACUtility.PrimaryAttachmentSlotNameList
	if f100_arg1 == "secondary" then
		f100_local1 = CoD.CACUtility.SecondaryAttachmentSlotNameList
	end
	for f100_local5, f100_local6 in ipairs( f100_local1 ) do
		if Engine.GetModelValue( Engine.GetModel( f100_local0, f100_local6 .. ".itemIndex" ) ) == f100_arg2 then
			return f100_local5
		end
	end
end

CoD.CACUtility.ValidateWeaponVariantForClass = function ( f101_arg0, f101_arg1 )
	local f101_local0 = CoD.perController[f101_arg0].classNum
	local f101_local1 = function ( f102_arg0, f102_arg1 )
		local f102_local0 = Engine.GetModelValue( Engine.GetModel( f101_arg1, f102_arg0 .. "gunsmithvariant.itemIndex" ) )
		if f102_local0 > CoD.CACUtility.EmptyItemIndex then
			local f102_local1 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f101_arg0, f102_local0 - 1 )
			local f102_local2 = false
			if Engine.GetModelValue( Engine.GetModel( f101_arg1, f102_arg0 .. ".itemIndex" ) ) == f102_local1.weaponIndex then
				for f102_local12, f102_local13 in ipairs( f102_local1.attachment ) do
					local f102_local9 = false
					local f102_local14 = Engine.GetAttachmentIndexByAttachmentTableIndex( f102_local1.weaponIndex, f102_local13 )
					if f102_local14 > CoD.CACUtility.EmptyItemIndex then
						for f102_local10, f102_local11 in ipairs( f102_arg1 ) do
							if f102_local14 == Engine.GetModelValue( Engine.GetModel( f101_arg1, f102_local11 .. ".itemIndex" ) ) then
								f102_local9 = true
								break
							end
						end
						if not f102_local9 then
							f102_local2 = true
						end
					end
				end
				if not f102_local2 and Engine.GetModelValue( Engine.GetModel( f101_arg1, f102_arg0 .. "camo.itemIndex" ) ) ~= f102_local1.camoIndex then
					f102_local2 = true
				end
			end
			if f102_local2 then
				CoD.SetClassItem( f101_arg0, f101_local0, f102_arg0 .. "gunsmithvariant", CoD.CACUtility.EmptyItemIndex )
			end
		end
	end
	
	f101_local1( "primary", CoD.CACUtility.PrimaryAttachmentSlotNameList )
	f101_local1( "secondary", CoD.CACUtility.SecondaryAttachmentSlotNameList )
end

CoD.CACUtility.CreateUnlockTokenModels = function ( f103_arg0 )
	if not CoD.CACUtility.unlockTokenModel then
		CoD.CACUtility.unlockTokenModel = Engine.CreateModel( Engine.GetModelForController( f103_arg0 ), "UnlockTokenInfo" )
		Engine.CreateModel( CoD.CACUtility.unlockTokenModel, "itemIndex" )
		local f103_local0 = Engine.CreateModel( CoD.CACUtility.unlockTokenModel, "xpBarInfo" )
		Engine.CreateModel( f103_local0, "rankXP" )
		Engine.CreateModel( f103_local0, "xpEarned" )
		Engine.CreateModel( f103_local0, "xpNeeded" )
		Engine.CreateModel( f103_local0, "currLevel" )
		Engine.CreateModel( f103_local0, "currLevelIcon" )
		Engine.CreateModel( f103_local0, "nextLevel" )
		Engine.CreateModel( f103_local0, "nextLevelIcon" )
	end
	local f103_local0 = Engine.GetModel( Engine.GetModelForController( f103_arg0 ), "unlockTokensCount" )
	local f103_local1 = "weapon_smg"
	local f103_local2 = CoD.perController[f103_arg0].customizationMode
	if f103_local2 then
		Engine.SetModelValue( f103_local0, Engine.GetCurrentTokens( f103_arg0, f103_local1, f103_local2 ) )
	else
		Engine.SetModelValue( f103_local0, Engine.GetCurrentTokens( f103_arg0, f103_local1 ) )
	end
end

CoD.CACUtility.GetPerkXModel = function ( f104_arg0 )
	return "p7_perk_" .. Engine.GetItemImage( f104_arg0 )
end

CoD.CACUtility.GetBonuscardXModel = function ( f105_arg0 )
	return "p7_" .. Engine.GetItemRef( f105_arg0 )
end

CoD.CACUtility.GetCybercoreXModel = function ( f106_arg0 )
	return "p7_core_" .. Engine.GetItemImage( f106_arg0 )
end

CoD.CACUtility.WeaponSelectFocusOnLastSelectedWeapon = function ( f107_arg0, f107_arg1 )
	local f107_local0 = DataSources.Unlockables:getCurrentFilterItem()
	if f107_arg0.weaponList.activeWidget then
		local f107_local1 = f107_arg0.weaponList.activeWidget.gridInfoTable.zeroBasedIndex + 1
		if f107_arg0.lastSelectionTable and f107_arg0.lastSelectionTable[f107_local0] then
			f107_arg0.lastSelectionTable[f107_local0] = f107_local1
		end
	end
end

CoD.CACUtility.WeaponSelectFocusOnLastSelectedCategory = function ( f108_arg0, f108_arg1, f108_arg2 )
	if not f108_arg1 then
		return 
	end
	local f108_local0 = f108_arg1.filter
	if not f108_local0 then
		f108_local0 = DataSources.Unlockables:getCurrentFilterItem()
	end
	DataSources.Unlockables.setCurrentFilterItem( f108_local0 )
	f108_arg0.weaponList:updateDataSource( true )
	if not f108_arg0.performingSetup then
		local f108_local1 = 1
		if f108_arg0.lastSelectionTable and f108_arg0.lastSelectionTable[f108_local0] then
			f108_local1 = f108_arg0.lastSelectionTable[f108_local0]
		end
		local f108_local2 = f108_arg0.weaponList:getItemAt( f108_local1 )
		if f108_local2 then
			f108_arg0.weaponList:setActiveItem( f108_local2, 0, true, true )
		end
	end
end

CoD.CACUtility.SetCACMenuHeroInfoModels = function ( f109_arg0 )
	local f109_local0 = Engine.CurrentSessionMode()
	local f109_local1 = Engine.GetEquippedHero( f109_arg0, f109_local0 )
	local f109_local2 = Engine.GetEquippedHeroInfo( f109_arg0, f109_local0 )
	if f109_local2 then
		local f109_local3 = Engine.GetModel( Engine.GetModelForController( f109_arg0 ), "CACMenu" )
		if f109_local3 then
			Engine.SetModelValue( Engine.GetModel( f109_local3, "currentHeroName" ), f109_local2.displayName )
			Engine.SetModelValue( Engine.GetModel( f109_local3, "currentHeroImage" ), f109_local2.defaultHeroRender )
		end
		if f109_local1 then
			local f109_local4 = Engine.GetLoadoutTypeForHero( f109_arg0, f109_local1 )
			if f109_local4 then
				local f109_local5 = Engine.GetLoadoutInfoForHero( f109_local0, f109_local1, f109_local4 )
				if f109_local5 then
					Engine.SetModelValue( Engine.GetModel( f109_local3, "currentHeroLoadout" ), Engine.Localize( f109_local5.itemName ) )
				end
			end
		end
	end
end

CoD.CACUtility.GetLoadout = function ( f110_arg0, f110_arg1 )
	local f110_local0 = {
		weapons = {},
		primaryAttachments = {},
		secondaryAttachments = {},
		equipment = {},
		perks = {},
		wildcards = {},
		other = {},
		streaks = {}
	}
	local f110_local1 = Engine.GetCustomClass( f110_arg0, f110_arg1 )
	for f110_local5, f110_local6 in pairs( f110_local1 ) do
		if LUI.startswith( f110_local5, "primaryattachment" ) then
			table.insert( f110_local0.primaryAttachments, Engine.GetItemAttachment( f110_local1.primary, f110_local6 ) )
		end
		if LUI.startswith( f110_local5, "secondaryattachment" ) then
			table.insert( f110_local0.secondaryAttachments, Engine.GetItemAttachment( f110_local1.secondary, f110_local6 ) )
		end
		if LUI.startswith( f110_local5, "killstreak" ) then
			f110_local0.streaks[f110_local5] = f110_local6
		end
		if LUI.startswith( f110_local5, "hero" ) or f110_local5 == "specialgadget" then
			f110_local0.heroItem = f110_local6
		end
		if LUI.startswith( f110_local5, "specialty" ) then
			f110_local0.perks[f110_local5] = f110_local6
		end
		if LUI.startswith( f110_local5, "bonuscard" ) then
			f110_local0.wildcards[f110_local5] = f110_local6
		end
		if f110_local5 == "primary" or f110_local5 == "secondary" then
			f110_local0.weapons[f110_local5] = f110_local6
		end
		if f110_local5 == "primarygadget" or f110_local5 == "secondarygadget" then
			f110_local0.equipment[f110_local5] = f110_local6
		else
			f110_local0.other[f110_local5] = f110_local6
		end
	end
	return f110_local0
end

CoD.CACUtility.GetFullLoadout = function ( f111_arg0 )
	local f111_local0 = {
		classes = {}
	}
	local f111_local1 = Engine.GetCustomClassCount( f111_arg0 )
	for f111_local2 = 0, f111_local1 - 1, 1 do
		local f111_local5 = CoD.CACUtility.GetLoadout( f111_arg0, f111_local2 )
		if f111_local0.streaks == nil then
			f111_local0.streaks = f111_local5.streaks
		end
		if f111_local0.heroItem == nil then
			f111_local0.heroItem = f111_local5.heroItem
		end
		table.insert( f111_local0.classes, f111_local5 )
	end
	return f111_local0
end

function AnyItemBanned( f112_arg0 )
	for f112_local3, f112_local4 in pairs( f112_arg0 ) do
		if Engine.GetItemVote( f112_local4 ) == Enum.VoteType.VOTE_TYPE_BAN then
			return true
		end
	end
	return false
end

function AnyAttachmentBanned( f113_arg0, f113_arg1 )
	for f113_local3, f113_local4 in ipairs( f113_arg1 ) do
		if Engine.GetAttachmentVote( f113_local4 ) == Enum.VoteType.VOTE_TYPE_BAN then
			return true
		elseif Engine.GetItemAttachmentVote( f113_arg0, f113_local4 ) == Enum.VoteType.VOTE_TYPE_BAN then
			return true
		end
	end
	return false
end

CoD.CACUtility.AnyClassContainsRestrictedItems = function ( f114_arg0 )
	local f114_local0 = Engine.GetCustomClassCount( f114_arg0 )
	for f114_local1 = 0, f114_local0 - 1, 1 do
		if CoD.CACUtility.ClassContainsRestrictedItems( f114_arg0, f114_local1 ) then
			return true
		end
	end
	return false
end

CoD.CACUtility.AnyEquippedScorestreaksBanned = function ( f115_arg0 )
	local f115_local0 = CoD.CACUtility.GetFullLoadout( f115_arg0 )
	return AnyItemBanned( f115_local0.streaks )
end

CoD.CACUtility.ClassContainsRestrictedItems = function ( f116_arg0, f116_arg1 )
	local f116_local0 = CoD.CACUtility.GetLoadout( f116_arg0, f116_arg1 )
	if AnyItemBanned( f116_local0.weapons ) then
		return true
	elseif AnyItemBanned( f116_local0.equipment ) then
		return true
	elseif AnyItemBanned( f116_local0.perks ) then
		return true
	elseif AnyItemBanned( f116_local0.wildcards ) then
		return true
	elseif f116_local0.weapons.primary ~= nil and AnyAttachmentBanned( f116_local0.weapons.primary, f116_local0.primaryAttachments ) then
		return true
	elseif f116_local0.weapons.secondary ~= nil and AnyAttachmentBanned( f116_local0.weapons.secondary, f116_local0.secondaryAttachments ) then
		return true
	else
		return false
	end
end

CoD.CACUtility.GetAllRestrictedItems = function ()
	local f117_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	local f117_local1 = f117_local0.sessionClients
	local f117_local2 = {}
	for f117_local11, f117_local12 in ipairs( f117_local1 ) do
		if f117_local12.voteCount > 0 then
			for f117_local9, f117_local10 in ipairs( f117_local12.votes ) do
				if f117_local10.voteType == Enum.VoteType.VOTE_TYPE_BAN then
					table.insert( f117_local2, f117_local10 )
				end
			end
		end
	end
	return f117_local2
end

CoD.CACUtility.AnyCACItemsBanned = function ()
	for f118_local4, f118_local5 in ipairs( CoD.CACUtility.GetAllRestrictedItems() ) do
		if f118_local5.voteType == Enum.VoteType.VOTE_TYPE_BAN then
			if f118_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
				local f118_local3 = Engine.GetUnlockableInfoByIndex( f118_local5.itemIndex )
				if not LuaUtils.StartsWith( f118_local3.loadoutSlot, "hero" ) and not LuaUtils.StartsWith( f118_local3.loadoutSlot, "killstreak" ) and f118_local3.loadoutSlot ~= "specialgadget" then
					return true
				end
			end
			if f118_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
				return true
			elseif f118_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
				return true
			elseif f118_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
				return true
			end
		end
	end
	return false
end

CoD.CACUtility.AnyStreaksBanned = function ()
	for f119_local4, f119_local5 in ipairs( CoD.CACUtility.GetAllRestrictedItems() ) do
		if f119_local5.voteType == Enum.VoteType.VOTE_TYPE_BAN and f119_local5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
			local f119_local3 = Engine.GetUnlockableInfoByIndex( f119_local5.itemIndex )
			if LUI.startswith( f119_local3.loadoutSlot, "killstreak" ) then
				return true
			end
		end
	end
	return false
end

CoD.CACUtility.ItemSlotBannedByBonuscard = function ( f120_arg0, f120_arg1 )
	if not f120_arg0 then
		return false
	elseif not f120_arg1 or f120_arg1 <= 0 then
		return false
	end
	local f120_local0 = nil
	if f120_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryWeapon then
		local f120_local1 = Engine.GetUnlockableInfoByIndex( f120_arg1 )
		if f120_local1.loadoutSlot == CoD.CACUtility.loadoutSlotNames.primaryWeapon then
			f120_local0 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.overkill )
		end
	elseif f120_arg0 == CoD.CACUtility.loadoutSlotNames.primaryAttachment4 or f120_arg0 == CoD.CACUtility.loadoutSlotNames.primaryAttachment5 or f120_arg0 == CoD.CACUtility.loadoutSlotNames.primaryAttachment6 then
		f120_local0 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.primary_gunfighter )
	elseif f120_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryAttachment1 or f120_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryAttachment2 or f120_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryAttachment3 or f120_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryAttachment4 or f120_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryAttachment5 or f120_arg0 == CoD.CACUtility.loadoutSlotNames.secondaryAttachment6 then
		local f120_local1 = Engine.GetUnlockableInfoByIndex( f120_arg1 )
		if f120_local1.loadoutSlot == CoD.CACUtility.loadoutSlotNames.primaryWeapon then
			f120_local0 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.overkill )
		elseif f120_arg0 ~= CoD.CACUtility.loadoutSlotNames.secondaryAttachment1 and f120_arg0 ~= CoD.CACUtility.loadoutSlotNames.secondaryAttachment2 then
			f120_local0 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.secondary_gunfighter )
		end
	elseif f120_arg0 == CoD.CACUtility.loadoutSlotNames.specialty4 then
		f120_local0 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.perk_1_greed )
	elseif f120_arg0 == CoD.CACUtility.loadoutSlotNames.specialty5 then
		f120_local0 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.perk_2_greed )
	elseif f120_arg0 == CoD.CACUtility.loadoutSlotNames.specialty6 then
		f120_local0 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.perk_3_greed )
	elseif f120_arg0 == CoD.CACUtility.loadoutSlotNames.primaryGadgetAttachment1 then
		f120_local0 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.danger_close )
	elseif f120_arg0 == CoD.CACUtility.loadoutSlotNames.primaryGadget then
		local f120_local1 = Engine.GetUnlockableInfoByIndex( f120_arg1 )
		if f120_local1.loadoutSlot == CoD.CACUtility.loadoutSlotNames.secondaryGadget then
			f120_local0 = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.two_tacticals )
		end
	end
	if f120_local0 then
		return Engine.GetItemVote( f120_local0 ) == Enum.VoteType.VOTE_TYPE_BAN
	end
	return false
end

CoD.CACUtility.GetItemInfoFromElementModel = function ( f121_arg0, f121_arg1 )
	if f121_arg1 then
		local f121_local0 = {}
		local f121_local1 = Engine.GetModel( f121_arg1, "itemType" )
		if f121_local1 then
			f121_local0.itemType = Engine.GetModelValue( f121_local1 )
			local f121_local2 = Engine.GetModel( f121_arg1, "itemIndex" )
			if f121_local2 then
				f121_local0.itemIndex = Engine.GetModelValue( f121_local2 )
			end
			local f121_local3 = Engine.GetModel( f121_arg1, "weaponIndex" )
			if f121_local3 then
				local f121_local4 = Engine.GetModelValue( f121_local3 )
				if f121_local4 > 0 then
					f121_local0.itemIndex = f121_local4
				end
			end
			local f121_local4 = Engine.GetModel( f121_arg1, "attachmentIndex" )
			if f121_local4 then
				f121_local0.attachmentIndex = Engine.GetModelValue( f121_local4 )
			end
			local f121_local5 = Engine.GetModel( f121_arg1, "itemGroup" )
			if f121_local5 then
				f121_local0.itemGroup = Engine.GetModelValue( f121_local5 )
			end
			local f121_local6 = Engine.GetModel( f121_arg1, "weaponSlot" )
			if f121_local6 then
				f121_local0.weaponSlot = Engine.GetModelValue( f121_local6 )
			end
			local f121_local7 = Engine.GetModel( f121_arg1, "loadoutSlot" )
			if f121_local7 then
				f121_local0.loadoutSlot = Engine.GetModelValue( f121_local7 )
			end
			return f121_local0
		end
	end
end

CoD.CACUtility.GetItemVotedBy = function ( f122_arg0 )
	local f122_local0 = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	local f122_local1 = f122_local0.sessionClients
	local f122_local2 = {}
	for f122_local11, f122_local12 in ipairs( f122_local1 ) do
		if f122_local12.voteCount > 0 then
			for f122_local9, f122_local10 in ipairs( f122_local12.votes ) do
				if f122_local10.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM and f122_arg0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
					if f122_local10.itemIndex == f122_arg0.itemIndex then
						return f122_local12.gamertag
					end
				end
				if f122_local10.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT and f122_arg0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
					if f122_local10.attachmentIndex == f122_arg0.attachmentIndex then
						return f122_local12.gamertag
					end
				end
				if f122_local10.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT and f122_arg0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
					if f122_local10.itemIndex == f122_arg0.itemIndex and f122_local10.attachmentIndex == f122_arg0.attachmentIndex then
						return f122_local12.gamertag
					end
				end
				if f122_local10.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP and f122_arg0.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP and f122_local10.itemGroup == f122_arg0.itemGroup then
					return f122_local12.gamertag
				end
			end
		end
	end
	return ""
end

CoD.CACUtility.GetItemInfoFromElement = function ( f123_arg0, f123_arg1 )
	return CoD.CACUtility.GetItemInfoFromElementModel( f123_arg0, f123_arg1:getModel() )
end

CoD.CACUtility.PrepareOverCapactiyList = function ( f124_arg0 )
	local f124_local0 = {}
	local f124_local1 = 10
	local f124_local2 = -2
	local f124_local3 = CoD.perController[f124_arg0].classModel
	local f124_local4 = function ( f125_arg0, f125_arg1, f125_arg2, f125_arg3 )
		local f125_local0 = ""
		if f125_arg3 then
			local f125_local1 = f125_arg1
			if LUI.startswith( f125_arg0, "primaryattachment" ) then
				f125_local1 = Engine.GetModel( f124_local3, "primary" )
			elseif LUI.startswith( f125_arg0, "secondaryattachment" ) then
				f125_local1 = Engine.GetModel( f124_local3, "secondary" )
			end
			f125_local0 = Engine.GetModelValue( Engine.GetModel( f125_local1, "headerName" ) )
		end
		return {
			models = {
				headerName = f125_local0,
				name = Engine.GetModelValue( Engine.GetModel( f125_arg1, "name" ) ),
				image = Engine.GetModelValue( Engine.GetModel( f125_arg1, "image" ) ) or "blacktransparent",
				itemSlot = f125_arg0
			},
			properties = {
				itemRef = Engine.GetModelValue( Engine.GetModel( f125_arg1, "ref" ) ),
				spacing = f125_arg2 or f124_local2
			}
		}
	end
	
	local f124_local5 = CoD.perController[f124_arg0].weaponCategory
	if f124_local3 then
		for f124_local18, f124_local19 in ipairs( CoD.CACUtility.overCapacityLoadoutSlotOrder ) do
			local f124_local20 = Engine.GetModel( f124_local3, f124_local19 )
			local f124_local21 = f124_local1
			local f124_local22 = #f124_local0
			local f124_local23, f124_local10 = nil
			local f124_local17 = true
			local f124_local24 = CoD.perController[f124_arg0].overCapacityItemIndex
			local f124_local9 = ""
			if f124_local24 then
				f124_local9 = Engine.GetItemRef( f124_local24 )
			end
			if f124_local22 > 0 then
				f124_local10 = f124_local0[f124_local22].models.itemSlot
			end
			if LUI.startswith( f124_local5, "primaryattachment" ) and f124_local19 == "primary" then
				
			end
			if LUI.startswith( f124_local5, "secondaryattachment" ) and f124_local19 == "secondary" then
				
			end
			if LUI.startswith( f124_local5, "primarygadgetattachment" ) then
				if f124_local19 ~= "primarygadget" then
					if CoD.CACUtility.GetItemReferenceName( f124_local20, f124_local19 ) == "bonuscard_danger_close" then
						
					end
				end
			end
			if LUI.startswith( f124_local5, "secondarygadgetattachment" ) and f124_local19 == "secondarygadget" then
				
			end
			if f124_local9 == "bonuscard_primary_gunfighter" then
				if f124_local19 ~= "primary" then
					if LUI.startswith( f124_local19, "primaryattachment" ) then
						
					end
				end
			end
			if f124_local9 == "bonuscard_secondary_gunfighter" then
				if f124_local19 ~= "secondary" then
					if LUI.startswith( f124_local19, "secondaryattachment" ) then
						
					end
				end
			end
			if f124_local20 then
				local f124_local11 = Engine.GetModel( f124_local20, "itemIndex" )
				if f124_local11 then
					local f124_local12 = Engine.GetModelValue( f124_local11 )
					local f124_local13 = Engine.GetItemRef( f124_local12 )
					if f124_local12 > CoD.CACUtility.EmptyItemIndex then
						if LUI.startswith( f124_local19, "primarygadgetattachment" ) then
							local f124_local14 = Engine.GetModel( f124_local3, "primarygadget.itemIndex" )
							if f124_local14 then
								local f124_local15 = Engine.GetModelValue( f124_local14 )
								local f124_local16 = Engine.GetModel( f124_local3, "primarygadgetattachment1" )
								if f124_local10 and f124_local10 == "primarygadget" then
									f124_local0[f124_local22].properties.spacing = f124_local2
									f124_local17 = false
								end
								table.insert( f124_local0, f124_local4( f124_local19, f124_local16, f124_local1, f124_local17 ) )
							end
						end
						if LUI.startswith( f124_local19, "secondarygadgetattachment" ) then
							local f124_local14 = Engine.GetModel( f124_local3, "secondarygadget.itemIndex" )
							if f124_local14 then
								local f124_local15 = Engine.GetModelValue( f124_local14 )
								local f124_local16 = Engine.GetModel( f124_local3, "secondarygadgetattachment1" )
								if f124_local10 and f124_local10 == "secondarygadget" then
									f124_local0[f124_local22].properties.spacing = f124_local2
									f124_local17 = false
								end
								table.insert( f124_local0, f124_local4( f124_local19, f124_local16, f124_local1, f124_local17 ) )
							end
						end
						if f124_local5 == "specialty4" and f124_local13 == "bonuscard_perk_1_greed" then
							
						end
						if f124_local5 == "specialty5" and f124_local13 == "bonuscard_perk_2_greed" then
							
						end
						if f124_local5 == "specialty6" and f124_local13 == "bonuscard_perk_3_greed" then
							
						end
						if (f124_local5 == "primaryattachment4" or f124_local5 == "primaryattachment5" or f124_local5 == "primaryattachment6") and f124_local13 == "bonuscard_primary_gunfighter" then
							
						end
						if f124_local5 == "secondary" and f124_local13 == "bonuscard_overkill" then
							
						end
						if not LUI.startswith( f124_local5, "secondaryattachment" ) or f124_local13 ~= "bonuscard_overkill" then
							if f124_local5 == "secondaryattachment3" and f124_local13 == "bonuscard_secondary_gunfighter" then
								
							end
							if f124_local5 == "primarygadget" and f124_local13 == "bonuscard_two_tacticals" then
								
							end
							if f124_local5 == "primarygadgetattachment2" and f124_local13 == "bonuscard_danger_close" then
								
							end
							if LUI.startswith( f124_local5, "primarygadgetattachment" ) and f124_local13 == "bonuscard_two_tacticals" then
								
							end
							if f124_local10 and (not (f124_local10 ~= "primary" or not LUI.startswith( f124_local19, "primaryattachment" )) or not (not LUI.startswith( f124_local19, "primaryattachment" ) or not LUI.startswith( f124_local19, "primaryattachment" )) or not (f124_local10 ~= "secondary" or not LUI.startswith( f124_local19, "secondaryattachment" )) or not (not LUI.startswith( f124_local19, "secondaryattachment" ) or not LUI.startswith( f124_local19, "secondaryattachment" )) or not (f124_local10 ~= "specialty1" or f124_local19 ~= "specialty4") or not (f124_local10 ~= "specialty2" or f124_local19 ~= "specialty5") or not (f124_local10 ~= "specialty3" or f124_local19 ~= "specialty6") or LUI.startswith( f124_local10, "bonuscard" ) and LUI.startswith( f124_local19, "bonuscard" )) then
								f124_local0[f124_local22].properties.spacing = f124_local2
								f124_local17 = false
							end
							table.insert( f124_local0, f124_local4( f124_local19, f124_local20, f124_local21, f124_local17 ) )
						end
					end
				end
			end
		end
	end
	return f124_local0
end

f0_local2 = {
	getSpacerAfterColumn = function ( f126_arg0, f126_arg1 )
		local f126_local0 = f126_arg0[f126_arg0.dataSourceName]
		if f126_local0[f126_arg1] then
			return f126_local0[f126_arg1].properties.spacing
		else
			return -2
		end
	end
}
CoD.CACUtility.RemoveItemFromClassList = function ( f127_arg0 )
	local f127_local0 = CoD.perController[f127_arg0].weaponCategory
	local f127_local1 = CoD.CACUtility.PrepareOverCapactiyList( f127_arg0 )
	local f127_local2 = nil
	for f127_local3 = #f127_local1, 1, -1 do
		local f127_local6 = f127_local1[f127_local3].models.itemSlot
		if f127_local0 == f127_local6 or LUI.startswith( f127_local6, f127_local0 .. "attachment" ) then
			table.remove( f127_local1, f127_local3 )
		end
	end
	if CoD.perController[f127_arg0].wildcardNeededForWeaponVariant then
		local f127_local3 = f127_local0 == "primary"
		local f127_local4 = "bonuscard_primary_gunfighter"
		if not f127_local3 then
			f127_local4 = "bonuscard_secondary_gunfighter"
		end
		for f127_local5 = #f127_local1, 1, -1 do
			if f127_local1[f127_local5].properties.itemRef == f127_local4 then
				table.remove( f127_local1, f127_local5 )
			end
		end
	end
	return f127_local1
end

DataSources.RemoveItemFromClassList = DataSourceHelpers.ListSetup( "RemoveItemFromClassList", CoD.CACUtility.RemoveItemFromClassList, true, f0_local2 )
DataSources.OverCapacityList = DataSourceHelpers.ListSetup( "OverCapacityList", CoD.CACUtility.PrepareOverCapactiyList, true, f0_local2 )
CoD.CACUtility.PrepareWildcardOverCapactiyList = function ( f128_arg0 )
	local f128_local0 = {}
	local f128_local1 = function ( f129_arg0, f129_arg1, f129_arg2 )
		return {
			models = {
				name = f129_arg0,
				image = f129_arg1 or "blacktransparent",
				itemSlot = f129_arg2
			}
		}
	end
	
	local f128_local2 = CoD.perController[f128_arg0].classModel
	for f128_local6, f128_local7 in ipairs( CoD.CACUtility.BonuscardSlotNameCACCardList ) do
		local f128_local8 = Engine.GetModel( f128_local2, f128_local7 )
		table.insert( f128_local0, f128_local1( Engine.GetModelValue( Engine.GetModel( f128_local8, "name" ) ), Engine.GetModelValue( Engine.GetModel( f128_local8, "image" ) ), f128_local7 ) )
	end
	return f128_local0
end

DataSources.WildcardOvercapacityList = DataSourceHelpers.ListSetup( "WildcardOvercapacityList", CoD.CACUtility.PrepareWildcardOverCapactiyList, true )
f0_local3 = function ( f130_arg0, f130_arg1, f130_arg2 )
	local f130_local0 = "WeaponVariantAttachmentList" .. f130_arg1.properties.index
	DataSources[f130_local0] = DataSourceHelpers.ListSetup( f130_local0, function ( f131_arg0 )
		local f131_local0 = {}
		local f131_local1 = f130_arg2.weaponIndex
		for f131_local5, f131_local6 in ipairs( f130_arg2.attachmentsByIndex ) do
			if f131_local6 > CoD.CACUtility.EmptyItemIndex then
				table.insert( f131_local0, {
					models = {
						image = Engine.GetAttachmentImage( f131_local1, f131_local6 ) .. "_wv_icon"
					}
				} )
			end
		end
		if f130_arg2.isWildcardNeeded then
			table.insert( f131_local0, {
				models = {
					image = "cac_mods_primary_gunfighter_wv_icon"
				}
			} )
		end
		return f131_local0
	end, true )
	return f130_local0
end

f0_local4 = function ( f132_arg0, f132_arg1 )
	local f132_local0 = {
		models = {
			variantIndex = f132_arg1.variantIndex,
			variantName = f132_arg1.variantName,
			variantNameBig = f132_arg1.variantNameBig,
			weaponItemIndex = f132_arg1.weaponIndex,
			cacVariantIndex = f132_arg1.cacVariantIndex
		},
		properties = {
			index = f132_arg1.index,
			weaponVariantInfo = f132_arg1
		}
	}
	f132_local0.models.listDataSource = f0_local3( f132_arg0, f132_local0, f132_arg1 )
	return f132_local0
end

f0_local5 = function ( f133_arg0 )
	local f133_local0 = 0
	for f133_local4, f133_local5 in ipairs( f133_arg0 ) do
		if f133_local5 > CoD.CACUtility.EmptyItemIndex then
			f133_local0 = f133_local0 + 1
		end
	end
	return f133_local0
end

DataSources.WeaponVariantList = DataSourceHelpers.ListSetup( "WeaponVariantList", function ( f134_arg0 )
	local f134_local0 = {}
	local f134_local1 = CoD.perController[f134_arg0].weaponIndexForVariant
	table.insert( f134_local0, f0_local4( f134_arg0, {
		variantName = Engine.GetItemName( f134_local1 ),
		variantNameBig = "",
		variantIndex = CoD.CACUtility.EmptyItemIndex,
		weaponIndex = f134_local1,
		index = 0,
		attachmentsByIndex = {},
		attachmentVariant = {},
		camoIndex = 0,
		reticleIndex = 0,
		paintjobIndex = 0,
		cacVariantIndex = 0
	} ) )
	for f134_local19, f134_local20 in ipairs( CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList( f134_local1 ) ) do
		local f134_local21 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f134_arg0, f134_local20.variantIndex )
		if CoD.CACUtility.EmptyItemIndex < f134_local21.weaponIndex then
			local f134_local5 = {}
			local f134_local6 = f134_local21.attachment
			local f134_local7 = f0_local5( f134_local6 )
			local f134_local8 = false
			local f134_local9 = false
			local f134_local10 = CoD.perController[f134_arg0].weaponCategory == "primary"
			local f134_local11 = 2
			if not f134_local10 then
				f134_local11 = 1
			end
			local f134_local12 = f134_local11 + 1
			for f134_local17, f134_local18 in ipairs( f134_local6 ) do
				if CoD.CACUtility.EmptyItemIndex < f134_local18 then
					local f134_local16 = Engine.GetAttachmentIndexByAttachmentTableIndex( f134_local21.weaponIndex, f134_local18 )
					if Engine.IsOptic( f134_local21.weaponIndex, f134_local16 ) then
						f134_local9 = true
					end
					table.insert( f134_local5, f134_local16 )
				end
				table.insert( f134_local5, CoD.CACUtility.EmptyItemIndex )
			end
			if f134_local10 and (CoD.CACUtility.EmptyItemIndex < f134_local5[4] or CoD.CACUtility.EmptyItemIndex < f134_local5[5] or CoD.CACUtility.EmptyItemIndex < f134_local5[6]) then
				f134_local8 = true
			elseif not f134_local10 and CoD.CACUtility.EmptyItemIndex < f134_local5[3] then
				f134_local8 = true
			end
			f134_local21.variantNameBig = f134_local21.variantName
			f134_local21.attachmentsByIndex = f134_local5
			f134_local21.index = f134_local19
			f134_local21.isWildcardNeeded = f134_local8
			table.insert( f134_local0, f0_local4( f134_arg0, f134_local21 ) )
		end
	end
	return f134_local0
end, false )
CoD.WGSV_Category = {}
CoD.WGSV_Category.WEAPON = 1
CoD.WGSV_Category.GUNSMITH_VARIANT = 2
DataSources.WGSV_Category = Engine.CreateModel( Engine.GetGlobalModel(), "WGSV_Category" )
