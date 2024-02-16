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
local CreateList = function ( baseString, minValue, maxValue )
	local listTable = {}
	for i = minValue, maxValue, 1 do
		table.insert( listTable, baseString .. i )
	end
	return listTable
end

local CreateList2 = function ( preString, postString, minValue, maxValue )
	local listTable = {}
	for i = minValue, maxValue, 1 do
		table.insert( listTable, preString .. i .. postString )
	end
	return listTable
end

CoD.CACUtility.PrimaryWeaponSlotNameList = {
	"primary"
}
CoD.CACUtility.PrimaryAttachmentSlotNameList = CreateList( "primaryattachment", 1, CoD.CACUtility.maxPrimaryAttachments )
CoD.CACUtility.PrimaryAttachmentCVSlotNameList = CreateList2( "primaryattachment", "cosmeticvariant", 1, CoD.CACUtility.maxPrimaryAttachments )
CoD.CACUtility.SecondaryWeaponSlotNameList = {
	"secondary"
}
CoD.CACUtility.SecondaryAttachmentSlotNameList = CreateList( "secondaryattachment", 1, CoD.CACUtility.maxSecondaryAttachments )
CoD.CACUtility.SecondaryAttachmentCVSlotNameList = CreateList2( "secondaryattachment", "cosmeticvariant", 1, CoD.CACUtility.maxSecondaryAttachments )
CoD.CACUtility.PrimaryGadgetWeaponSlotNameList = {
	"primarygadget"
}
CoD.CACUtility.PrimaryGadgetAttachmentSlotNameList = CreateList( "primarygadgetattachment", 1, CoD.CACUtility.maxGadgetsMods )
CoD.CACUtility.SecondaryGadgetWeaponSlotNameList = {
	"secondarygadget"
}
CoD.CACUtility.SecondaryGadgetAttachmentSlotNameList = CreateList( "secondarygadgetattachment", 1, CoD.CACUtility.maxGadgetsMods )
CoD.CACUtility.SpecialGadgetWeaponSlotNameList = {
	"specialgadget"
}
CoD.CACUtility.SpecialGadgetAttachmentSlotNameList = CreateList( "specialgadgetattachment", 1, CoD.CACUtility.maxGadgetsMods )
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
CoD.CACUtility.CompletePerkSlotNameList = CreateList( "specialty", 1, CoD.CACUtility.maxPerkCategories * CoD.CACUtility.maxPerksInEachCategory )
CoD.CACUtility.BonuscardSlotNameList = CreateList( "bonuscard", 1, CoD.CACUtility.maxBonusCards )
CoD.CACUtility.BonuscardSlotNameCACCardList = {
	"bonuscard3",
	"bonuscard1",
	"bonuscard2"
}
CoD.CACUtility.KillstreakNameList = CreateList( "killstreak", 1, CoD.CACUtility.maxRewards )
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
	description = function ( controller, itemIndex )
		return Engine.Localize( "MPUI_UNLOCK_ITEM", Engine.GetItemName( itemIndex ) )
	end,
	supportText = function ( controller, itemIndex )
		return Engine.Localize( Engine.GetItemName( itemIndex ) )
	end,
	image = function ( controller, itemIndex )
		local weaponCategory = CoD.perController[controller].weaponCategory
		local appendText = ""
		if weaponCategory == "specialist" then
			return Engine.GetItemImage( itemIndex, CoD.perController[controller].customizationMode ) .. "_large"
		elseif weaponCategory and LUI.startswith( weaponCategory, "killstreak" ) then
			appendText = "_menu_large"
		elseif LUI.startswith( weaponCategory, "specialty" ) or weaponCategory == "primarygadget" or weaponCategory == "secondarygadget" then
			appendText = "_256"
		end
		return Engine.GetItemImage( itemIndex ) .. appendText
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.Unlock,
	listDatasource = function ( controller, itemIndex )
		DataSources.UnlockTokenMenuList = DataSourceHelpers.ListSetup( "UnlockTokenMenuList", function ( controller )
			local list = {}
			local isInCybercoreUpgrade = CoD.perController[controller].isInCybercoreUpgrade or false
			local addItemListButton = function ( displayText, action )
				return {
					models = {
						displayText = displayText,
						itemIndex = itemIndex
					},
					properties = {
						action = action
					}
				}
			end
			
			local UnlockAction = function ( self, element, controller, actionParam, menu )
				UnlockItem( menu, element, controller )
				local previousMenu = GoBackAndUpdateStateOnPreviousMenu( menu, controller )
				if isInCybercoreUpgrade then
					UpdateCybercoreTree( previousMenu, previousMenu, controller )
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
				local heroIndex = CoD.CCUtility.Heroes.HeroIndexForEdits
				local equippedSlot = CoD.CCUtility.GetHeroEquippedSlot( controller, itemIndex )
				local previousMenu = GoBack( menu, controller )
				if equippedSlot then
					element.itemIndex = itemIndex
					if not actionParam then
						actionParam = {}
					end
					actionParam.previousMenu = previousMenu
					UnlockAndEquipHeroForMPFirstTimeSetup( self, element, controller, actionParam, menu )
				end
				GoBack( GoBack( previousMenu, controller ), controller )
			end
			
			local CancelUnlockAction = function ( self, element, controller, actionParam, menu )
				GoBack( self, controller )
			end
			
			local isEquippable = not isInCybercoreUpgrade
			if CoD.perController[controller].customizationMode == Enum.eModes.MODE_MULTIPLAYER and IsFirstTimeSetup( controller, Enum.eModes.MODE_MULTIPLAYER ) then
				table.insert( list, addItemListButton( "MENU_UNLOCK_AND_EQUIP", UnlockAndEquipActionForMPFirstTimeSetup ) )
			else
				table.insert( list, addItemListButton( "MENU_UNLOCK", UnlockAction ) )
				if isEquippable then
					table.insert( list, addItemListButton( "MENU_UNLOCK_AND_EQUIP", UnlockAndEquipAction ) )
				end
				table.insert( list, addItemListButton( "MENU_CANCEL_UNLOCK", CancelUnlockAction ) )
			end
			return list
		end, true )
		return "UnlockTokenMenuList"
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

CoD.CACUtility.GetImageForItemRef = function ( itemRef )
	local imageCol = 6
	return Engine.TableLookup( nil, CoD.statsTable, 0, itemRef, imageCol )
end

CoD.CACUtility.GetNameForItemRef = function ( itemRef )
	local nameCol = 3
	return Engine.TableLookup( nil, CoD.statsTable, 0, itemRef, nameCol )
end

CoD.CACUtility.GetIdForItemRef = function ( itemRef )
	local idCol = 4
	return Engine.TableLookup( nil, CoD.statsTable, 0, itemRef, idCol )
end

CoD.CACUtility.GetNameForStatsTableImage = function ( imageName )
	local nameCol = 3
	local imageCol = 6
	return Engine.TableLookup( nil, CoD.statsTable, imageCol, imageName, nameCol )
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
			return REG5
		end
	end
	return {}
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

CoD.CACUtility.GetAllocationSpentFromClassData = function ( classData )
	return CoD.SumClassItemCosts( classData.primaryWeapon ) + CoD.SumClassItemCosts( classData.primaryAttachments ) + CoD.SumClassItemCosts( classData.secondaryWeapon ) + CoD.SumClassItemCosts( classData.secondaryAttachments ) + CoD.SumClassItemCosts( classData.grenades ) + CoD.SumClassItemCosts( classData.gadgets ) + CoD.SumClassItemCosts( classData.perks ) + CoD.SumClassItemCosts( classData.rewards )
end

CoD.CACUtility.HowManyInClassData = function ( itemIndex, classData )
	return CoD.HowManyInClassSlot( itemIndex, classData.primaryWeapon ) + CoD.HowManyInClassSlot( itemIndex, classData.secondaryWeapon ) + CoD.HowManyInClassSlot( itemIndex, classData.grenades ) + CoD.HowManyInClassSlot( itemIndex, classData.gadgets ) + CoD.HowManyInClassSlot( itemIndex, classData.perks ) + CoD.HowManyInClassSlot( itemIndex, classData.rewards )
end

CoD.CACUtility.GetClassData = function ( controller, classNum )
	local classData = {}
	if classNum == nil then
		classNum = CoD.perController[controller].classNumInternal
	end
	local loadoutSlotNames = CoD.CACUtility.loadoutSlotNames
	classData.primaryWeapon = {}
	CoD.AddClassItemData( classData.primaryWeapon, CoD.GetClassItem( controller, classNum, loadoutSlotNames.primaryWeapon ) )
	classData.secondaryWeapon = {}
	CoD.AddClassItemData( classData.secondaryWeapon, CoD.GetClassItem( controller, classNum, loadoutSlotNames.secondaryWeapon ) )
	classData.primaryAttachments = {}
	classData.secondaryAttachments = {}
	local primaryWeaponIndex = CoD.GetClassItem( controller, classNum, loadoutSlotNames.primaryWeapon )
	local secondaryWeaponIndex = CoD.GetClassItem( controller, classNum, loadoutSlotNames.secondaryWeapon )
	for index = 0, 2, 1 do
		CoD.AddClassAttachmentData( classData.primaryAttachments, primaryWeaponIndex, CoD.GetClassItem( controller, classNum, loadoutSlotNames.primaryWeapon .. "attachment" .. index + 1 ) )
		CoD.AddClassAttachmentData( classData.secondaryAttachments, secondaryWeaponIndex, CoD.GetClassItem( controller, classNum, loadoutSlotNames.secondaryWeapon .. "attachment" .. index + 1 ) )
	end
	classData.grenades = {}
	CoD.AddClassItemData( classData.grenades, CoD.GetClassItem( controller, classNum, loadoutSlotNames.primaryGrenade ), CoD.GetClassItem( controller, classNum, "primarygrenadecount" ), loadoutSlotNames.primaryGrenade )
	CoD.AddClassItemData( classData.grenades, CoD.GetClassItem( controller, classNum, loadoutSlotNames.specialGrenade ), CoD.GetClassItem( controller, classNum, "specialgrenadecount" ), loadoutSlotNames.specialGrenade )
	classData.gadgets = {}
	CoD.AddClassItemData( classData.gadgets, CoD.GetClassItem( controller, classNum, loadoutSlotNames.primaryGadget ) )
	CoD.AddClassItemData( classData.gadgets, CoD.GetClassItem( controller, classNum, loadoutSlotNames.secondaryGadget ) )
	local numPerks = CoD.CACUtility.maxSpecialtySlots
	classData.perks = {}
	for i = 1, numPerks, 1 do
		CoD.AddClassItemData( classData.perks, CoD.GetClassItem( controller, classNum, loadoutSlotNames["specialty" .. i] ) )
	end
	local numRewards = CoD.CACUtility.maxRewards
	classData.rewards = {}
	for i = 1, numRewards, 1 do
		CoD.AddClassItemData( classData.rewards, CoD.GetClassItem( controller, classNum, "killstreak" .. i ) )
	end
	table.sort( classData.rewards, function ( a, b )
		return a.momentumCost < b.momentumCost
	end )
	return classData
end

CoD.CACUtility.GetLoadoutsMPOffline = function ( controller )
	local f26_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_LOADOUTS_OFFLINE )
	return f26_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsMPOnlinePublic = function ( controller )
	local f27_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	return f27_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsMPOnlineCustom = function ( controller )
	local f28_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	return f28_local0.customMatchCacLoadouts
end

CoD.CACUtility.GetLoadoutsMPOnlineLeague = function ( controller )
	local f29_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	return f29_local0.leagueCacLoadouts
end

CoD.CACUtility.GetLoadoutsCPOffline = function ( controller )
	if Dvar.tempCPOnline == nil or not Dvar.tempCPOnline:exists() or Dvar.tempCPOnline:get() ~= true then
		local f30_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_CP_LOADOUTS )
		return f30_local0.cacLoadouts
	else
		local f30_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_CP_LOADOUTS_OFFLINE )
		return f30_local0.cacLoadouts
	end
end

CoD.CACUtility.GetLoadoutsCPOnline = function ( controller )
	local f31_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_CP_LOADOUTS )
	return f31_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsZMOffline = function ( controller )
	local f32_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_ZM_LOADOUTS_OFFLINE )
	return f32_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsZMOnlinePublic = function ( controller )
	local f33_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_ZM_LOADOUTS )
	return f33_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsZMOnlineCustom = function ( controller )
	local f34_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_ZM_LOADOUTS )
	return f34_local0.customMatchCacLoadouts
end

CoD.CACUtility.SetDefaultCACRootOld = function ( controller )
	if CoD.isOnlineGame() ~= true then
		local f35_local0 = CoD.perController[controller]
		local f35_local1 = CoD.GetPlayerStats( controller )
		f35_local0.cacRoot = f35_local1.cacLoadouts
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
		local f35_local0 = CoD.perController[controller]
		local f35_local1 = CoD.GetPlayerStats( controller )
		f35_local0.cacRoot = f35_local1.leagueCacLoadouts
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) then
		local f35_local0 = CoD.perController[controller]
		local f35_local1 = CoD.GetPlayerStats( controller )
		f35_local0.cacRoot = f35_local1.customMatchCacLoadouts
	else
		local f35_local0 = CoD.perController[controller]
		local f35_local1 = CoD.GetPlayerStats( controller )
		f35_local0.cacRoot = f35_local1.cacLoadouts
	end
end

CoD.CACUtility.SetDefaultCACRoot = function ( controller )
	local loadoutFunc = nil
	if CoD.isOnlineGame() ~= true then
		loadoutFunc = CoD.CPMPZM( CoD.CACUtility.GetLoadoutsCPOffline, CoD.CACUtility.GetLoadoutsMPOffline, CoD.CACUtility.GetLoadoutsZMOffline )
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
		loadoutFunc = CoD.CPMPZM( nil, CoD.CACUtility.GetLoadoutsMPOnlineLeague, nil )
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) then
		loadoutFunc = CoD.CPMPZM( CoD.CACUtility.GetLoadoutsCPOnline, CoD.CACUtility.GetLoadoutsMPOnlineCustom, CoD.CACUtility.GetLoadoutsZMOnlineCustom )
	else
		loadoutFunc = CoD.CPMPZM( CoD.CACUtility.GetLoadoutsCPOnline, CoD.CACUtility.GetLoadoutsMPOnlinePublic, CoD.CACUtility.GetLoadoutsZMOnlinePublic )
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
	local f37_local0 = CoD.perController[controller]
	local f37_local1 = Engine.GetGametypeSettings()
	f37_local0.cacRoot = f37_local1.cacLoadouts[index]
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

CoD.CACUtility.SetupCACLock = function ( button )
	CoD.SetupButtonLock( button, nil, "FEATURE_CREATE_A_CLASS", "FEATURE_CREATE_A_CLASS_DESC" )
end

CoD.CACUtility.SetupCACNew = function ( button )
	button:registerEventHandler( "cac_closed", CoD.CACUtility.SetupCACNew )
	button:showNewIcon( Engine.IsAnythingInCACNew( Engine.GetPrimaryController() ) )
end

CoD.CACUtility.SetupScorestreaksNew = function ( button )
	button:registerEventHandler( "scorestreaks_closed", CoD.CACUtility.SetupScorestreaksNew )
	button:showNewIcon( Engine.WeaponGroupHasNewItem( Engine.GetPrimaryController(), "killstreak" ) )
end

CoD.CACUtility.IsBonusCardEquippedByName = function ( class, bonusCardName )
	local bonusCardItemIndex = Engine.GetItemIndex( bonusCardName )
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
				return REG8
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
					local acvIndexModel = Engine.GetModel( classModel, REG8 .. "cosmeticvariant.itemIndex" )
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
	return nil
end

CoD.CACUtility.GetAttachedItemSlot = function ( classModel, itemIndex, possibleLoadoutSlotNameList )
	for index, slot in ipairs( possibleLoadoutSlotNameList ) do
		local slotModel = Engine.GetModel( classModel, slot )
		if slotModel then
			local itemIndexModel = Engine.GetModel( slotModel, "itemIndex" )
			if itemIndexModel and Engine.GetModelValue( itemIndexModel ) == itemIndex then
				return REG7
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
				return REG6
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
		local bonusCardItemIndex = Engine.GetItemIndex( bonuscardName )
		for _, slotName in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
			local bonusCardIndexModel = Engine.GetModel( classModel, slotName .. ".itemIndex" )
			if bonusCardIndexModel then
				local bonusCardIndex = Engine.GetModelValue( bonusCardIndexModel )
				if Engine.GetItemRef( bonusCardIndex ) == bonuscardName then
					equippedCount = equippedCount + 1
				end
			end
		end
	end
	return math.min( math.max( equippedCount, 0 ), CoD.CACUtility.maxBonusCards )
end

CoD.CACUtility.SearchForBonusCard = function ( bonuscardName, controller, classModel )
	if not controller then
		return ""
	end
	local f55_local0 = classModel
	local currentClass = CoD.perController[controller].classModel
	local f55_local1 = f55_local0 or currentClass
	if f55_local1 then
		for index, slotName in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
			local cardModel = Engine.GetModel( f55_local1, slotName )
			if cardModel then
				local itemIndexModel = Engine.GetModel( cardModel, "itemIndex" )
				if itemIndexModel then
					local itemIndex = Engine.GetModelValue( itemIndexModel )
					if Engine.GetItemRef( itemIndex ) == bonuscardName then
						return REG8
					end
				end
			end
		end
	end
	return ""
end

CoD.CACUtility.GetItemRefEquippedInSlot = function ( slotName, controller, classModel )
	if not controller then
		return 
	end
	local f56_local0 = classModel
	local currentClass = CoD.perController[controller].classModel
	local f56_local1 = f56_local0 or currentClass
	if f56_local1 then
		local slotModel = Engine.GetModel( f56_local1, slotName )
		if slotModel then
			local nameRefModel = Engine.GetModel( slotModel, "ref" )
			if nameRefModel then
				return Engine.GetModelValue( nameRefModel )
			end
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
	local f63_local0
	if CoD.CACUtility.SearchForBonusCard( "bonuscard_danger_close", controller ) == "" and CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", controller ) == "" then
		f63_local0 = false
	else
		f63_local0 = true
	end
	return f63_local0
end

CoD.CACUtility.GetMutuallyExclusiveSlotName = function ( slotName, controller, itemIndex )
	local itemRef = Engine.GetItemRef( itemIndex )
	if LUI.startswith( slotName, "bonuscard" ) then
		if itemRef == "bonuscard_danger_close" then
			return CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", controller )
		elseif itemRef == "bonuscard_two_tacticals" then
			return CoD.CACUtility.SearchForBonusCard( "bonuscard_danger_close", controller )
		end
	elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", controller ) and slotName == "primarygadget" then
		if CoD.CACUtility.GetItemEquippedInSlot( "secondarygadget", controller ) == itemIndex then
			return "secondarygadget"
		end
	elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", controller ) and slotName == "secondarygadget" then
		if CoD.CACUtility.GetItemEquippedInSlot( "primarygadget", controller ) == itemIndex then
			return "primarygadget"
		end
	elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_overkill", controller ) and slotName == "primary" then
		if CoD.CACUtility.GetItemEquippedInSlot( "secondary", controller ) == itemIndex then
			return "secondary"
		end
	elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_overkill", controller ) and slotName == "secondary" then
		if CoD.CACUtility.GetItemEquippedInSlot( "primary", controller ) == itemIndex then
			return "primary"
		end
	elseif CoD.CACUtility.IsSlotNameInList( CoD.CACUtility.PrimaryAttachmentSlotNameList, slotName ) or CoD.CACUtility.IsSlotNameInList( CoD.CACUtility.SecondaryAttachmentSlotNameList, slotName ) then
		local attachmentList = CoD.CACUtility.GetAttachmentListForSlot( slotName )
		local weaponIndex = CoD.CACUtility.GetItemEquippedInSlot( CoD.perController[controller].weaponSlot, controller )
		for _, loadoutSlot in ipairs( attachmentList ) do
			local slotIndex = CoD.CACUtility.GetItemEquippedInSlot( loadoutSlot, controller )
			if slotIndex ~= itemIndex and not Engine.AreAttachmentsCompatible( weaponIndex, slotIndex, itemIndex ) then
				return REG10
			end
		end
	elseif slotName == "cybercom_tacrig1" then
		if CoD.CACUtility.GetItemEquippedInSlot( "cybercom_tacrig2", controller ) == itemIndex then
			return "cybercom_tacrig2"
		end
	elseif slotName == "cybercom_tacrig2" and CoD.CACUtility.GetItemEquippedInSlot( "cybercom_tacrig1", controller ) == itemIndex then
		return "cybercom_tacrig1"
	end
	return ""
end

CoD.CACUtility.AttachmentHasCustomReticle = function ( attachmentRef )
	for index, currAttachmentRef in ipairs( CoD.CACUtility.attachmentsWithCustReticle ) do
		if currAttachmentRef == attachmentRef then
			return REG5
		end
	end
	return nil
end

CoD.CACUtility.GetWeaponOptionMTXName = function ( weaponOption )
	return Engine.TableLookup( nil, CoD.attachmentTable, 0, weaponOption, 16 )
end

CoD.CACUtility.GetBackingMTXName = function ( backingID )
	return Engine.TableLookup( nil, "gamedata/emblems/emblemsOrBackings.csv", 0, "background", 1, backingID, 10 )
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
	local mtxCategory = Engine.TableLookup( nil, "mp/mtxitems.csv", 1, mtxName, 3 )
	return "MPUI_" .. mtxCategory .. "_MSG"
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

CoD.CACUtility.UpdateHeaderNames = function ( controller, classNum, classModel )
	local class = Engine.GetCustomClass( controller, classNum )
	local secondaryHeaderText = "MPUI_SECONDARY_WEAPON_CAPS"
	local primaryGadgetHeaderText = "MPUI_PRIMARYGRENADE_CAPS"
	local secondaryGadgetHeaderText = "MPUI_SPECIALGRENADE_CAPS"
	local isUsingOverkill = CoD.CACUtility.IsBonusCardEquippedByName( class, "bonuscard_overkill" )
	if isUsingOverkill == true then
		secondaryHeaderText = "MPUI_SECOND_PRIMARY_CAPS"
	end
	local isUsingTwoTacticals = CoD.CACUtility.IsBonusCardEquippedByName( class, "bonuscard_two_tacticals" )
	if isUsingTwoTacticals == true then
		primaryGadgetHeaderText = "MPUI_SECOND_SPECIAL_GRENADE_CAPS"
		secondaryGadgetHeaderText = "MPUI_FIRST_SPECIAL_GRENADE_CAPS"
	end
	Engine.SetModelValue( Engine.CreateModel( classModel, "secondary.headerName" ), secondaryHeaderText )
	Engine.SetModelValue( Engine.CreateModel( classModel, "primarygadget.headerName" ), primaryGadgetHeaderText )
	Engine.SetModelValue( Engine.CreateModel( classModel, "primarygadgetattachment1.headerName" ), primaryGadgetHeaderText )
	Engine.SetModelValue( Engine.CreateModel( classModel, "secondarygadget.headerName" ), secondaryGadgetHeaderText )
	Engine.SetModelValue( Engine.CreateModel( classModel, "secondarygadgetattachment1.headerName" ), secondaryGadgetHeaderText )
	if not Engine.GetModel( classModel, "primary.headerName" ) then
		Engine.SetModelValue( Engine.CreateModel( classModel, "primary.headerName" ), "MPUI_PRIMARY_WEAPON_CAPS" )
		for index, slot in ipairs( CoD.CACUtility.PrimaryAttachmentSlotNameList ) do
			if index == 1 then
				Engine.SetModelValue( Engine.CreateModel( classModel, REG13 .. ".headerName" ), "MPUI_PRIMARY_OPTIC_CAPS" )
			else
				Engine.SetModelValue( Engine.CreateModel( classModel, REG13 .. ".headerName" ), "MPUI_PRIMARY_ATTACHMENT_CAPS" )
			end
		end
		for index, slot in ipairs( CoD.CACUtility.SecondaryAttachmentSlotNameList ) do
			if index == 1 then
				Engine.SetModelValue( Engine.CreateModel( classModel, REG13 .. ".headerName" ), "MPUI_SECONDARY_OPTIC_CAPS" )
			else
				Engine.SetModelValue( Engine.CreateModel( classModel, REG13 .. ".headerName" ), "MPUI_SECONDARY_ATTACHMENT_CAPS" )
			end
		end
		for _, slot in ipairs( CoD.CACUtility.Perk1SlotNameList ) do
			Engine.SetModelValue( Engine.CreateModel( classModel, slot .. ".headerName" ), "MPUI_PERK1_CAPS" )
		end
		for _, slot in ipairs( CoD.CACUtility.Perk2SlotNameList ) do
			Engine.SetModelValue( Engine.CreateModel( classModel, slot .. ".headerName" ), "MPUI_PERK2_CAPS" )
		end
		for _, slot in ipairs( CoD.CACUtility.Perk3SlotNameList ) do
			Engine.SetModelValue( Engine.CreateModel( classModel, slot .. ".headerName" ), "MPUI_PERK3_CAPS" )
		end
		for _, slot in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
			Engine.SetModelValue( Engine.CreateModel( classModel, slot .. ".headerName" ), "MENU_WILDCARD_CAPS" )
		end
	end
	local tacrigHeaderText = "MENU_TACTICAL_RIG_CAPS"
	Engine.SetModelValue( Engine.CreateModel( classModel, "cybercom_tacrig1.headerName" ), tacrigHeaderText )
	Engine.SetModelValue( Engine.CreateModel( classModel, "cybercom_tacrig2.headerName" ), tacrigHeaderText )
end

CoD.CACUtility.AddBigImagesToCustomClassModel = function ( controller, classModel, slotName, postfixText )
	local slotModel = Engine.GetModel( classModel, slotName )
	if not slotModel then
		return 
	end
	local imageModel = Engine.GetModel( slotModel, "image" )
	if imageModel then
		local imageModelValue = Engine.GetModelValue( imageModel )
		if imageModelValue then
			if imageModelValue == CoD.CACUtility.DefaultLoadoutImage then
				postfixText = ""
			end
			Engine.SetModelValue( Engine.CreateModel( slotModel, "image_big" ), imageModelValue .. postfixText )
		end
	end
end

CoD.CACUtility.GetBonucardUnlockHint = function ( stringRef, bonuscardRef )
	local itemIndex = Engine.GetItemIndex( bonuscardRef )
	local unlockRank = Engine.GetItemUnlockLevel( itemIndex )
	local wildcardName = Engine.GetItemName( itemIndex )
	return Engine.Localize( stringRef, wildcardName, unlockRank + 1 )
end

CoD.CACUtility.GetCACSlotStatus = function ( controller, classModel, slotName )
	local availability = CoD.CACUtility.CACStatusAvailable.AVAILABLE
	local equipped = false
	local statusString = ""
	local statusArg = nil
	if CoD.CACUtility.ItemEquippedInSlot( slotName, controller, classModel ) then
		equipped = true
		if slotName == "primary" or slotName == "secondary" then
			statusString = "MPUI_BUTTON_PERSONALIZE_CAPS"
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
				statusString = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_perk_1_greed" )
				availability = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_1_greed", controller, classModel ) == "" then
				statusString = "MPUI_REQUIRES_PERK_1_GREED"
				availability = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			end
		elseif slotName == "specialty5" then
			if IsNonAttachmentItemLocked( controller, "bonuscard_perk_2_greed" ) then
				statusString = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_perk_2_greed" )
				availability = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_2_greed", controller, classModel ) == "" then
				statusString = "MPUI_REQUIRES_PERK_2_GREED"
				availability = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			end
		elseif slotName == "specialty6" then
			if IsNonAttachmentItemLocked( controller, "bonuscard_perk_3_greed" ) then
				statusString = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_perk_3_greed" )
				availability = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_3_greed", controller, classModel ) == "" then
				statusString = "MPUI_REQUIRES_PERK_3_GREED"
				availability = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			end
		end
	elseif LUI.startswith( slotName, "primaryattachment" ) then
		local primaryWeaponIndex = CoD.CACUtility.GetItemEquippedInSlot( "primary", controller, classModel )
		local numAttachments = Engine.GetNumAttachments( primaryWeaponIndex )
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
		elseif slotName == "primaryattachment1" and Engine.GetNumOptics( primaryWeaponIndex ) <= 1 then
			availability = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			statusString = "MPUI_OPTICS_NOT_AVAILABLE"
		elseif (slotName == "primaryattachment2" or slotName == "primaryattachment3") and numAttachments <= 1 then
			availability = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			statusString = "MPUI_ATTACHMENTS_NOT_AVAILABLE"
		elseif slotName == "primaryattachment4" or slotName == "primaryattachment5" or slotName == "primaryattachment6" then
			if numAttachments <= 1 then
				availability = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
				statusString = "MPUI_ATTACHMENTS_NOT_AVAILABLE"
			elseif IsNonAttachmentItemLocked( controller, "bonuscard_primary_gunfighter" ) then
				statusString = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_primary_gunfighter" )
				availability = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			else
				local primaryGunfighterCount = CoD.CACUtility.SpecificWildcardEquippedCount( classModel, "bonuscard_primary_gunfighter" )
				if not (slotName ~= "primaryattachment4" or primaryGunfighterCount >= 1) or not (slotName ~= "primaryattachment5" or primaryGunfighterCount >= 2) or slotName == "primaryattachment6" and primaryGunfighterCount < 3 then
					statusString = "MPUI_REQUIRES_PRIMARY_GUNFIGHTER"
					availability = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
				end
			end
		end
	elseif LUI.startswith( slotName, "secondaryattachment" ) then
		local secondaryWeaponIndex = CoD.CACUtility.GetItemEquippedInSlot( "secondary", controller, classModel )
		local numAttachments = Engine.GetNumAttachments( secondaryWeaponIndex )
		if slotName == "primaryattachment1" then
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
		elseif slotName == "secondaryattachment1" and Engine.GetNumOptics( secondaryWeaponIndex ) <= 1 then
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
				statusString = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_secondary_gunfighter" )
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
			statusString = CoD.CACUtility.GetBonucardUnlockHint( "MPUI_ITEM_UNLOCKS_AT_LVL", "bonuscard_danger_close" )
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
		if secondaryGadgetIndex <= CoD.CACUtility.EmptyItemIndex or not Engine.GadgetHasTakeTwoAttachment( secondaryGadgetIndex ) then
			availability = CoD.CACUtility.CACStatusAvailable.NOT_AVAILABLE
			statusString = "MPUI_TAKE_TWO_NOT_AVAILABLE"
		end
	elseif LUI.startswith( slotName, "bonuscard" ) then
		statusString = "MPUI_EQUIP_WILDCARD"
	end
	return availability, equipped, statusString, statusArg
end

CoD.CACUtility.WildcardNeededForSlot = function ( controller, slotName )
	local classModel = CoD.perController[controller].classModel
	local wildcardName = nil
	local isRequiredEquipped = false
	local isRequiredLocked = true
	if slotName == "specialty4" then
		wildcardName = "bonuscard_perk_1_greed"
		isRequiredEquipped = true
		isRequiredLocked = IsNonAttachmentItemLocked( controller, "bonuscard_perk_1_greed" )
	elseif slotName == "specialty5" then
		wildcardName = "bonuscard_perk_2_greed"
		isRequiredEquipped = true
		isRequiredLocked = IsNonAttachmentItemLocked( controller, "bonuscard_perk_2_greed" )
	elseif slotName == "specialty6" then
		wildcardName = "bonuscard_perk_3_greed"
		isRequiredEquipped = true
		isRequiredLocked = IsNonAttachmentItemLocked( controller, "bonuscard_perk_3_greed" )
	elseif slotName == "primaryattachment4" or slotName == "primaryattachment5" or slotName == "primaryattachment6" then
		wildcardName = "bonuscard_primary_gunfighter"
		isRequiredEquipped = CoD.CACUtility.ItemEquippedInSlot( "primary", controller, classModel )
		isRequiredLocked = IsNonAttachmentItemLocked( controller, "bonuscard_primary_gunfighter" )
	elseif slotName == "secondaryattachment3" then
		local secondaryWeaponIndex = CoD.CACUtility.GetItemEquippedInSlot( "secondary", controller, classModel )
		local numAttachments = Engine.GetNumAttachments( secondaryWeaponIndex )
		wildcardName = "bonuscard_secondary_gunfighter"
		if numAttachments > 1 then
			isRequiredEquipped = CoD.CACUtility.ItemEquippedInSlot( "secondary", controller, classModel )
		else
			isRequiredEquipped = false
		end
		isRequiredLocked = IsNonAttachmentItemLocked( controller, "bonuscard_secondary_gunfighter" )
	elseif slotName == "primarygadgetattachment1" then
		wildcardName = "bonuscard_danger_close"
		isRequiredEquipped = CoD.CACUtility.ItemEquippedInSlot( "primarygadget", controller, classModel )
		isRequiredLocked = IsNonAttachmentItemLocked( controller, "bonuscard_danger_close" )
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

CoD.CACUtility.UpdateEmptySlotImages = function ( controller, classNum, classModel )
	local class = Engine.GetCustomClass( controller, classNum )
	local isUsingOverkill = CoD.CACUtility.IsBonusCardEquippedByName( class, "bonuscard_overkill" )
	local isUsingTwoTacticals = CoD.CACUtility.IsBonusCardEquippedByName( class, "bonuscard_two_tacticals" )
	for slotName, imageName in pairs( CoD.CACUtility.emptyImageSlotList ) do
		local slotModel = Engine.GetModel( classModel, slotName )
		if slotModel then
			local f82_local3
			if REG9 == "secondary" and isUsingOverkill == true then
				f82_local3 = CoD.CACUtility.emptyImageSlotList.primary
			elseif LUI.startswith( REG9, "primarygadget" ) and isUsingTwoTacticals == true then
				f82_local3 = CoD.CACUtility.emptyImageSlotList.secondarygadget
			end
			Engine.SetModelValue( Engine.CreateModel( slotModel, "emptyImage" ), f82_local3 )
		end
	end
end

CoD.CACUtility.GetCustomClassModel = function ( controller, classNum, classModel )
	Engine.GetCustomClassModel( controller, classNum, classModel )
	Engine.SetModelValue( Engine.CreateModel( classModel, "classNum" ), classNum )
	if CoD.perController[controller].isPreset == true then
		local customClassNameModel = Engine.GetModel( classModel, "customClassName" )
		local classNameRef = Engine.GetModelValue( customClassNameModel )
		Engine.SetModelValue( customClassNameModel, Engine.Localize( classNameRef ) )
	end
	if classNum >= 10 then
		Engine.SetModelValue( Engine.CreateModel( classModel, "defaultClassName" ), Engine.GetDefaultClassName( classNum - 10 ) )
	end
	CoD.CACUtility.UpdateHeaderNames( controller, classNum, classModel )
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
				local cacACVIndex = Engine.GetModelValue( Engine.GetModel( classModel, acvList[REG6] .. ".itemIndex" ) )
				if cacACVIndex > CoD.CACUtility.EmptyItemIndex then
					local weaponIndex = Engine.GetModelValue( Engine.GetModel( classModel, loadoutSlot .. ".itemIndex" ) )
					local weaponName = Engine.GetWeaponString( controller, classNum, loadoutSlot )
					local attachmentTableIndex = Engine.GetItemAttachment( weaponIndex, cacAttachmentIndex )
					local acv = Engine.GetAttachmentCosmeticVariant( weaponName, attachmentTableIndex )
					if acv then
						local attachmentImageModel = Engine.GetModel( classModel, REG7 .. ".image" )
						Engine.SetModelValue( attachmentImageModel, acv.image )
						local acvImageModel = Engine.GetModel( classModel, REG7 .. "cosmeticvariant.image" )
						Engine.SetModelValue( acvImageModel, acv.image )
						local attachmentNameModel = Engine.GetModel( classModel, REG7 .. ".name" )
						Engine.SetModelValue( attachmentNameModel, acv.name )
						local acvNameModel = Engine.GetModel( classModel, REG7 .. "cosmeticvariant.name" )
						Engine.SetModelValue( acvNameModel, acv.name )
					end
				end
			end
		end
	end
	
	updateAttachmentsForCosmeticVariants( "primary", CoD.CACUtility.PrimaryAttachmentSlotNameList, CoD.CACUtility.PrimaryAttachmentCVSlotNameList )
	updateAttachmentsForCosmeticVariants( "secondary", CoD.CACUtility.SecondaryAttachmentSlotNameList, CoD.CACUtility.SecondaryAttachmentCVSlotNameList )
	CoD.CACUtility.AddBigImagesToCustomClassModel( controller, classModel, "primary", "_big" )
	CoD.CACUtility.AddBigImagesToCustomClassModel( controller, classModel, "secondary", "_big" )
	CoD.CACUtility.AddBigImagesToCustomClassModel( controller, classModel, "primarygadget", "_256" )
	CoD.CACUtility.AddBigImagesToCustomClassModel( controller, classModel, "secondarygadget", "_256" )
	CoD.CACUtility.AddBigImagesToCustomClassModel( controller, classModel, "specialgadget", "_256" )
	DataSources.CustomClassMenu.updateWeaponAttachmentList( controller, classModel, "primary", CoD.CACUtility.maxPrimaryAttachments )
	DataSources.CustomClassMenu.updateWeaponAttachmentList( controller, classModel, "secondary", CoD.CACUtility.maxSecondaryAttachments )
	DataSources.CustomClassMenu.updateCustomSlotModel( classModel, "primarygadget", controller )
	DataSources.CustomClassMenu.updateCustomSlotModel( classModel, "secondarygadget", controller )
	CoD.CACUtility.UpdateGrenadeNames( controller, classNum, classModel )
	CoD.CACUtility.UpdateEmptySlotImages( controller, classNum, classModel )
	for _, slotName in ipairs( CoD.CACUtility.loadoutSlotOrder ) do
		local slotModel = Engine.GetModel( classModel, slotName )
		if slotModel then
			local hintTextModel = Engine.CreateModel( slotModel, "hintText" )
			if hintTextModel then
				local availability, equipped, hintText, hintArg = CoD.CACUtility.GetCACSlotStatus( controller, classModel, REG10 )
				if hintArg ~= nil then
					Engine.SetModelValue( hintTextModel, Engine.Localize( hintText, hintArg ) )
				else
					Engine.SetModelValue( hintTextModel, Engine.Localize( hintText ) )
				end
			end
		end
	end
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
								local f90_local3 = Engine.SetModelValue
								local f90_local4 = acvNameModel
								local f90_local5
								if variantInfo then
									f90_local5 = variantInfo.name
									if not f90_local5 then
									
									else
										f90_local3( f90_local4, f90_local5 )
										f90_local3 = Engine.SetModelValue
										f90_local4 = acvImageModel
										f90_local5
										if variantInfo then
											f90_local5 = variantInfo.image
											if not f90_local5 then
											
											else
												f90_local3( f90_local4, f90_local5 )
												Engine.SetModelValue( acvRefModel, attachmentRef )
											end
										end
										f90_local5 = ""
									end
								end
								f90_local5 = ""
							end
						end
					end
				end
			end
		end
	end
	
	updateVariants( classModel, CoD.CACUtility.PrimaryAttachmentSlotNameList )
	updateVariants( classModel, CoD.CACUtility.SecondaryAttachmentSlotNameList )
	CoD.CACUtility.UpdateWeaponCustomizationCategoryList( controller, classModel )
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
					local acvCategoryModel = Engine.GetModel( weaponCustomParentIndexModel, "attachmentIndex" )
					if currentWeaponSlotWeaponOption then
						local classOptionName = Engine.GetModelValue( Engine.GetModel( currentWeaponSlotWeaponOption, "name" ) )
						local classOptionImage = Engine.GetModelValue( Engine.GetModel( currentWeaponSlotWeaponOption, "image" ) )
						Engine.SetModelValue( Engine.GetModel( weaponCustomParentIndexModel, "name" ), classOptionName )
						Engine.SetModelValue( Engine.GetModel( weaponCustomParentIndexModel, "image" ), classOptionImage )
					end
					if acvCategoryModel then
						local attachmentSlotIndex = Engine.GetModelValue( acvCategoryModel )
						local attachmentSlotName = loadoutSlotName .. "attachment" .. attachmentSlotIndex .. "cosmeticvariant"
						local classOptionName = Engine.GetModelValue( Engine.GetModel( classModel, attachmentSlotName .. ".name" ) )
						local classOptionImage = Engine.GetModelValue( Engine.GetModel( classModel, attachmentSlotName .. ".image" ) )
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
	local paintJobAvailable = 0
	if camoIndexModel then
		camoIndex = Engine.GetModelValue( camoIndexModel )
	end
	if reticleIndexModel then
		reticleIndex = Engine.GetModelValue( reticleIndexModel )
	end
	if paintJobSlotIndexModel and paintJobIndexItemIndexModel then
		local paintJobSlot = Engine.GetModelValue( paintJobSlotIndexModel )
		local paintJobIndex = Engine.GetModelValue( paintJobIndexItemIndexModel )
		if paintJobSlot ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and paintJobIndex ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
			Engine.SetupPaintjobData( controller, paintJobSlot, paintJobIndex )
			paintJobAvailable = 1
		end
	end
	return camoIndex .. "," .. reticleIndex .. "," .. paintJobAvailable
end

CoD.CACUtility.EmptyWeaponOptions = function ()
	local camoIndex = "0"
	local reticleIndex = "0"
	local paintJobAvailable = 0
	return camoIndex .. "," .. reticleIndex .. "," .. paintJobAvailable
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

CoD.CACUtility.GetWeaponOptionsFromVariantInfo = function ( controller, variantInfo )
	local camoIndex = "0"
	local reticleIndex = "0"
	local paintJobAvailable = 0
	if variantInfo.camoIndex then
		camoIndex = variantInfo.camoIndex
	end
	if variantInfo.reticleIndex then
		reticleIndex = variantInfo.reticleIndex
	end
	if variantInfo.paintjobSlot and variantInfo.paintjobIndex and variantInfo.paintjobSlot ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and variantInfo.paintjobIndex ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
		Engine.SetupPaintjobData( controller, variantInfo.paintjobSlot, variantInfo.paintjobIndex )
		paintJobAvailable = 1
	end
	return camoIndex .. "," .. reticleIndex .. "," .. paintJobAvailable
end

CoD.CACUtility.GetAttachmentCosmeticVariantsFromVariantInfo = function ( variantInfo )
	local attachmentInfo = ""
	for index, acvIndex in ipairs( variantInfo.attachmentVariant ) do
		local attachmentTableIndex = variantInfo.attachment[index]
		if attachmentTableIndex > CoD.CACUtility.EmptyItemIndex then
			local attachmentRef = Engine.GetAttachmentRefByIndex( attachmentTableIndex )
			attachmentInfo = attachmentInfo .. attachmentRef .. "," .. REG6 .. ","
		end
	end
	return attachmentInfo
end

CoD.CACUtility.GetBaseWeaponLoadoutSlotName = function ( loadoutSlot )
	local baseWeaponLoadoutSlot = nil
	if loadoutSlot == "primary" or loadoutSlot == "secondary" or loadoutSlot == "primarygadget" or loadoutSlot == "secondarygadget" or loadoutSlot == "cybercore" or LUI.startswith( loadoutSlot, "specialty" ) or LUI.startswith( loadoutSlot, "bonuscard" ) then
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
	end
	return baseWeaponLoadoutSlot
end

CoD.CACUtility.GetGunLevelWeaponIndex = function ( controller, element )
	local classModel = CoD.perController[controller].classModel
	local weaponCategory = CoD.perController[controller].weaponCategory
	local weaponSlot = CoD.perController[controller].weaponSlot
	if weaponCategory and (LUI.startswith( weaponCategory, "primaryattachment" ) or LUI.startswith( weaponCategory, "secondaryattachment" )) then
		if weaponSlot then
			local weaponIndexModel = Engine.GetModel( classModel, weaponSlot .. ".itemIndex" )
			if weaponIndexModel then
				return Engine.GetModelValue( weaponIndexModel )
			end
		end
	elseif element then
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
			return REG8
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
					local f102_local6 = false
					local attachmentIndexFromAttachmentTable = Engine.GetAttachmentIndexByAttachmentTableIndex( variant.weaponIndex, attachmentIndex )
					if attachmentIndexFromAttachmentTable > CoD.CACUtility.EmptyItemIndex then
						for cacAttachmentTableIndex, attachmentName in ipairs( attachmentList ) do
							local cacAttachmentIndex = Engine.GetModelValue( Engine.GetModel( classModel, attachmentName .. ".itemIndex" ) )
							if attachmentIndexFromAttachmentTable == cacAttachmentIndex then
								f102_local6 = true
								break
							end
						end
						if not f102_local6 then
							notVariantMatch = true
						end
					end
				end
				if not notVariantMatch then
					local cacCamoIndex = Engine.GetModelValue( Engine.GetModel( classModel, loadoutSlot .. "camo.itemIndex" ) )
					if cacCamoIndex ~= variant.camoIndex then
						notVariantMatch = true
					end
				end
			end
			if notVariantMatch then
				CoD.SetClassItem( controller, classNum, loadoutSlot .. "gunsmithvariant", CoD.CACUtility.EmptyItemIndex )
			end
		end
	end
	
	validateWeaponVariantSlot( "primary", CoD.CACUtility.PrimaryAttachmentSlotNameList )
	validateWeaponVariantSlot( "secondary", CoD.CACUtility.SecondaryAttachmentSlotNameList )
end

CoD.CACUtility.CreateUnlockTokenModels = function ( controller )
	if not CoD.CACUtility.unlockTokenModel then
		CoD.CACUtility.unlockTokenModel = Engine.CreateModel( Engine.GetModelForController( controller ), "UnlockTokenInfo" )
		Engine.CreateModel( CoD.CACUtility.unlockTokenModel, "itemIndex" )
		local xpBarInfoModel = Engine.CreateModel( CoD.CACUtility.unlockTokenModel, "xpBarInfo" )
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
	local mode = CoD.perController[controller].customizationMode
	if mode then
		Engine.SetModelValue( unlockTokensCountModel, Engine.GetCurrentTokens( controller, itemGroup, mode ) )
	else
		Engine.SetModelValue( unlockTokensCountModel, Engine.GetCurrentTokens( controller, itemGroup ) )
	end
end

CoD.CACUtility.GetPerkXModel = function ( itemIndex )
	return "p7_perk_" .. Engine.GetItemImage( itemIndex )
end

CoD.CACUtility.GetBonuscardXModel = function ( itemIndex )
	return "p7_" .. Engine.GetItemRef( itemIndex )
end

CoD.CACUtility.GetCybercoreXModel = function ( itemIndex )
	return "p7_core_" .. Engine.GetItemImage( itemIndex )
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
	if heroInfoTable then
		local cacMenuModel = Engine.GetModel( Engine.GetModelForController( controller ), "CACMenu" )
		if cacMenuModel then
			Engine.SetModelValue( Engine.GetModel( cacMenuModel, "currentHeroName" ), heroInfoTable.displayName )
			Engine.SetModelValue( Engine.GetModel( cacMenuModel, "currentHeroImage" ), heroInfoTable.defaultHeroRender )
		end
		if heroIndex then
			local loadoutType = Engine.GetLoadoutTypeForHero( controller, heroIndex )
			if loadoutType then
				local loadoutInfo = Engine.GetLoadoutInfoForHero( mode, heroIndex, loadoutType )
				if loadoutInfo then
					Engine.SetModelValue( Engine.GetModel( cacMenuModel, "currentHeroLoadout" ), Engine.Localize( loadoutInfo.itemName ) )
				end
			end
		end
	end
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
			local attachmentIndex = Engine.GetItemAttachment( class.primary, REG8 )
			table.insert( customClass.primaryAttachments, attachmentIndex )
		end
		if LUI.startswith( REG7, "secondaryattachment" ) then
			local attachmentIndex = Engine.GetItemAttachment( class.secondary, REG8 )
			table.insert( customClass.secondaryAttachments, attachmentIndex )
		end
		if LUI.startswith( REG7, "killstreak" ) then
			customClass.streaks[REG7] = REG8
		end
		if LUI.startswith( REG7, "hero" ) or REG7 == "specialgadget" then
			customClass.heroItem = REG8
		end
		if LUI.startswith( REG7, "specialty" ) then
			customClass.perks[REG7] = REG8
		end
		if LUI.startswith( REG7, "bonuscard" ) then
			customClass.wildcards[REG7] = REG8
		end
		if REG7 == "primary" or REG7 == "secondary" then
			customClass.weapons[REG7] = REG8
		end
		if REG7 == "primarygadget" or REG7 == "secondarygadget" then
			customClass.equipment[REG7] = REG8
		else
			customClass.other[REG7] = REG8
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

function AnyItemBanned( itemsTable )
	for slot, itemIndex in pairs( itemsTable ) do
		if Engine.GetItemVote( itemIndex ) == Enum.VoteType.VOTE_TYPE_BAN then
			return true
		end
	end
	return false
end

function AnyAttachmentBanned( weaponIndex, attachments )
	for attachmentIndex, attachment in ipairs( attachments ) do
		if Engine.GetAttachmentVote( attachment ) == Enum.VoteType.VOTE_TYPE_BAN then
			return true
		elseif Engine.GetItemAttachmentVote( weaponIndex, REG6 ) == Enum.VoteType.VOTE_TYPE_BAN then
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
	return AnyItemBanned( loadout.streaks )
end

CoD.CACUtility.ClassContainsRestrictedItems = function ( controller, classIndex )
	local class = CoD.CACUtility.GetLoadout( controller, classIndex )
	if AnyItemBanned( class.weapons ) then
		return true
	elseif AnyItemBanned( class.equipment ) then
		return true
	elseif AnyItemBanned( class.perks ) then
		return true
	elseif AnyItemBanned( class.wildcards ) then
		return true
	elseif class.weapons.primary ~= nil and AnyAttachmentBanned( class.weapons.primary, class.primaryAttachments ) then
		return true
	elseif class.weapons.secondary ~= nil and AnyAttachmentBanned( class.weapons.secondary, class.secondaryAttachments ) then
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
			for voteIndex, vote in ipairs( REG7.votes ) do
				if vote.voteType == Enum.VoteType.VOTE_TYPE_BAN then
					table.insert( restrictedItems, REG12 )
				end
			end
		end
	end
	return restrictedItems
end

CoD.CACUtility.AnyCACItemsBanned = function ()
	local bannedItems = CoD.CACUtility.GetAllRestrictedItems()
	for voteIndex, vote in ipairs( bannedItems ) do
		if vote.voteType == Enum.VoteType.VOTE_TYPE_BAN then
			if REG5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
				local itemInfo = Engine.GetUnlockableInfoByIndex( REG5.itemIndex )
				if not LuaUtils.StartsWith( itemInfo.loadoutSlot, "hero" ) and not LuaUtils.StartsWith( itemInfo.loadoutSlot, "killstreak" ) and itemInfo.loadoutSlot ~= "specialgadget" then
					return true
				end
			end
			if REG5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
				return true
			elseif REG5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
				return true
			elseif REG5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP then
				return true
			end
		end
	end
	return false
end

CoD.CACUtility.AnyStreaksBanned = function ()
	local bannedItems = CoD.CACUtility.GetAllRestrictedItems()
	for voteIndex, vote in ipairs( bannedItems ) do
		if vote.voteType == Enum.VoteType.VOTE_TYPE_BAN and REG5.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
			local itemInfo = Engine.GetUnlockableInfoByIndex( REG5.itemIndex )
			if LUI.startswith( itemInfo.loadoutSlot, "killstreak" ) then
				return true
			end
		end
	end
	return false
end

CoD.CACUtility.ItemSlotBannedByBonuscard = function ( slotName, itemIndex )
	if not slotName then
		return false
	elseif not itemIndex or itemIndex <= 0 then
		return false
	end
	local wildcardIndex = nil
	if slotName == CoD.CACUtility.loadoutSlotNames.secondaryWeapon then
		local itemInfo = Engine.GetUnlockableInfoByIndex( itemIndex )
		if itemInfo.loadoutSlot == CoD.CACUtility.loadoutSlotNames.primaryWeapon then
			wildcardIndex = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.overkill )
		end
	elseif slotName == CoD.CACUtility.loadoutSlotNames.primaryAttachment4 or slotName == CoD.CACUtility.loadoutSlotNames.primaryAttachment5 or slotName == CoD.CACUtility.loadoutSlotNames.primaryAttachment6 then
		wildcardIndex = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.primary_gunfighter )
	elseif slotName == CoD.CACUtility.loadoutSlotNames.secondaryAttachment1 or slotName == CoD.CACUtility.loadoutSlotNames.secondaryAttachment2 or slotName == CoD.CACUtility.loadoutSlotNames.secondaryAttachment3 or slotName == CoD.CACUtility.loadoutSlotNames.secondaryAttachment4 or slotName == CoD.CACUtility.loadoutSlotNames.secondaryAttachment5 or slotName == CoD.CACUtility.loadoutSlotNames.secondaryAttachment6 then
		local itemInfo = Engine.GetUnlockableInfoByIndex( itemIndex )
		if itemInfo.loadoutSlot == CoD.CACUtility.loadoutSlotNames.primaryWeapon then
			wildcardIndex = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.overkill )
		elseif slotName ~= CoD.CACUtility.loadoutSlotNames.secondaryAttachment1 and slotName ~= CoD.CACUtility.loadoutSlotNames.secondaryAttachment2 then
			wildcardIndex = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.secondary_gunfighter )
		end
	elseif slotName == CoD.CACUtility.loadoutSlotNames.specialty4 then
		wildcardIndex = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.perk_1_greed )
	elseif slotName == CoD.CACUtility.loadoutSlotNames.specialty5 then
		wildcardIndex = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.perk_2_greed )
	elseif slotName == CoD.CACUtility.loadoutSlotNames.specialty6 then
		wildcardIndex = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.perk_3_greed )
	elseif slotName == CoD.CACUtility.loadoutSlotNames.primaryGadgetAttachment1 then
		wildcardIndex = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.danger_close )
	elseif slotName == CoD.CACUtility.loadoutSlotNames.primaryGadget then
		local itemInfo = Engine.GetUnlockableInfoByIndex( itemIndex )
		if itemInfo.loadoutSlot == CoD.CACUtility.loadoutSlotNames.secondaryGadget then
			wildcardIndex = Engine.GetItemIndexFromReference( CoD.CACUtility.bonuscards.two_tacticals )
		end
	end
	if wildcardIndex then
		return Engine.GetItemVote( wildcardIndex ) == Enum.VoteType.VOTE_TYPE_BAN
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
			return properties
		end
	end
end

CoD.CACUtility.GetItemVotedBy = function ( itemInfo )
	local session = Engine.LobbyGetSessionClients( Enum.LobbyModule.LOBBY_MODULE_CLIENT, Enum.LobbyType.LOBBY_TYPE_GAME )
	local clients = session.sessionClients
	local restrictedItems = {}
	for index, client in ipairs( clients ) do
		if client.voteCount > 0 then
			for voteIndex, vote in ipairs( REG8.votes ) do
				if vote.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM and itemInfo.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM then
					if REG13.itemIndex == itemInfo.itemIndex then
						return REG8.gamertag
					end
				end
				if REG13.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT and itemInfo.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT then
					if REG13.attachmentIndex == itemInfo.attachmentIndex then
						return REG8.gamertag
					end
				end
				if REG13.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT and itemInfo.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM_ATTACHMENT then
					if REG13.itemIndex == itemInfo.itemIndex and REG13.attachmentIndex == itemInfo.attachmentIndex then
						return REG8.gamertag
					end
				end
				if REG13.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP and itemInfo.itemType == Enum.VoteItemType.VOTE_ITEM_TYPE_ATTACHMENT_GROUP and REG13.itemGroup == itemInfo.itemGroup then
					return REG8.gamertag
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
	if classModel then
		for index, slotName in ipairs( CoD.CACUtility.overCapacityLoadoutSlotOrder ) do
			local slotModel = Engine.GetModel( classModel, slotName )
			local spacing = categorySpacing
			local itemListPrevIndex = #completeItemList
			local prevSlotListItem, f124_local4 = nil
			local f124_local5 = true
			local overCapacityItemIndex = CoD.perController[controller].overCapacityItemIndex
			local f124_local3 = ""
			if overCapacityItemIndex then
				f124_local3 = Engine.GetItemRef( overCapacityItemIndex )
			end
			if itemListPrevIndex > 0 then
				f124_local4 = completeItemList[itemListPrevIndex].models.itemSlot
			end
			if LUI.startswith( weaponCategory, "primaryattachment" ) and REG11 == "primary" then
				
			end
			if LUI.startswith( weaponCategory, "secondaryattachment" ) and REG11 == "secondary" then
				
			end
			if LUI.startswith( weaponCategory, "primarygadgetattachment" ) then
				if REG11 ~= "primarygadget" then
					if CoD.CACUtility.GetItemReferenceName( slotModel, REG11 ) == "bonuscard_danger_close" then
						
					end
				end
			end
			if LUI.startswith( weaponCategory, "secondarygadgetattachment" ) and REG11 == "secondarygadget" then
				
			end
			if f124_local3 == "bonuscard_primary_gunfighter" then
				if REG11 ~= "primary" then
					if LUI.startswith( REG11, "primaryattachment" ) then
						
					end
				end
			end
			if f124_local3 == "bonuscard_secondary_gunfighter" then
				if REG11 ~= "secondary" then
					if LUI.startswith( REG11, "secondaryattachment" ) then
						
					end
				end
			end
			if slotModel then
				local indexModel = Engine.GetModel( slotModel, "itemIndex" )
				if indexModel then
					local itemIndex = Engine.GetModelValue( indexModel )
					local itemName = Engine.GetItemRef( itemIndex )
					if itemIndex > CoD.CACUtility.EmptyItemIndex then
						if LUI.startswith( REG11, "primarygadgetattachment" ) then
							local gadgetIndexModel = Engine.GetModel( classModel, "primarygadget.itemIndex" )
							if gadgetIndexModel then
								local gadgetIndex = Engine.GetModelValue( gadgetIndexModel )
								local customSlotModel = Engine.GetModel( classModel, "primarygadgetattachment1" )
								if f124_local4 and f124_local4 == "primarygadget" then
									completeItemList[itemListPrevIndex].properties.spacing = itemSpacing
									f124_local5 = false
								end
								table.insert( completeItemList, getItemModels( REG11, customSlotModel, categorySpacing, f124_local5 ) )
							end
						end
						if LUI.startswith( REG11, "secondarygadgetattachment" ) then
							local gadgetIndexModel = Engine.GetModel( classModel, "secondarygadget.itemIndex" )
							if gadgetIndexModel then
								local gadgetIndex = Engine.GetModelValue( gadgetIndexModel )
								local customSlotModel = Engine.GetModel( classModel, "secondarygadgetattachment1" )
								if f124_local4 and f124_local4 == "secondarygadget" then
									completeItemList[itemListPrevIndex].properties.spacing = itemSpacing
									f124_local5 = false
								end
								table.insert( completeItemList, getItemModels( REG11, customSlotModel, categorySpacing, f124_local5 ) )
							end
						end
						if weaponCategory == "specialty4" and itemName == "bonuscard_perk_1_greed" then
							
						end
						if weaponCategory == "specialty5" and itemName == "bonuscard_perk_2_greed" then
							
						end
						if weaponCategory == "specialty6" and itemName == "bonuscard_perk_3_greed" then
							
						end
						if (weaponCategory == "primaryattachment4" or weaponCategory == "primaryattachment5" or weaponCategory == "primaryattachment6") and itemName == "bonuscard_primary_gunfighter" then
							
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
							if f124_local4 and (not (f124_local4 ~= "primary" or not LUI.startswith( REG11, "primaryattachment" )) or not (not LUI.startswith( REG11, "primaryattachment" ) or not LUI.startswith( REG11, "primaryattachment" )) or not (f124_local4 ~= "secondary" or not LUI.startswith( REG11, "secondaryattachment" )) or not (not LUI.startswith( REG11, "secondaryattachment" ) or not LUI.startswith( REG11, "secondaryattachment" )) or not (f124_local4 ~= "specialty1" or REG11 ~= "specialty4") or not (f124_local4 ~= "specialty2" or REG11 ~= "specialty5") or not (f124_local4 ~= "specialty3" or REG11 ~= "specialty6") or LUI.startswith( f124_local4, "bonuscard" ) and LUI.startswith( REG11, "bonuscard" )) then
								completeItemList[itemListPrevIndex].properties.spacing = itemSpacing
								f124_local5 = false
							end
							table.insert( completeItemList, getItemModels( REG11, slotModel, spacing, f124_local5 ) )
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
	if CoD.perController[controller].wildcardNeededForWeaponVariant then
		local i = weaponSlotName == "primary"
		local bonuscardGunfighterForSlot = "bonuscard_primary_gunfighter"
		if not i then
			bonuscardGunfighterForSlot = "bonuscard_secondary_gunfighter"
		end
		for i = #itemList, 1, -1 do
			local itemRefName = itemList[i].properties.itemRef
			if itemRefName == bonuscardGunfighterForSlot then
				table.remove( itemList, i )
			end
		end
	end
	return itemList
end

DataSources.RemoveItemFromClassList = DataSourceHelpers.ListSetup( "RemoveItemFromClassList", CoD.CACUtility.RemoveItemFromClassList, true, OverCapacity_CustomListFns )
DataSources.OverCapacityList = DataSourceHelpers.ListSetup( "OverCapacityList", CoD.CACUtility.PrepareOverCapactiyList, true, OverCapacity_CustomListFns )
CoD.CACUtility.PrepareWildcardOverCapactiyList = function ( controller )
	local capacityList = {}
	local getItemModels = function ( name, image, slotName )
		return {
			models = {
				name = name,
				image = image or "blacktransparent",
				itemSlot = slotName
			}
		}
	end
	
	local classModel = CoD.perController[controller].classModel
	for _, slotName in ipairs( CoD.CACUtility.BonuscardSlotNameCACCardList ) do
		local slotModel = Engine.GetModel( classModel, slotName )
		local nameValue = Engine.GetModelValue( Engine.GetModel( slotModel, "name" ) )
		local imageValue = Engine.GetModelValue( Engine.GetModel( slotModel, "image" ) )
		table.insert( capacityList, getItemModels( nameValue, imageValue, slotName ) )
	end
	return capacityList
end

DataSources.WildcardOvercapacityList = DataSourceHelpers.ListSetup( "WildcardOvercapacityList", CoD.CACUtility.PrepareWildcardOverCapactiyList, true )
f0_local3 = function ( controller, infoTable, weaponVariantInfo )
	local dataSourceName = "WeaponVariantAttachmentList" .. infoTable.properties.index
	DataSources[dataSourceName] = DataSourceHelpers.ListSetup( dataSourceName, function ( controller )
		local attachmentTable = {}
		local weaponIndex = weaponVariantInfo.weaponIndex
		for index, attachmentIndex in ipairs( weaponVariantInfo.attachmentsByIndex ) do
			if attachmentIndex > CoD.CACUtility.EmptyItemIndex then
				table.insert( attachmentTable, {
					models = {
						image = Engine.GetAttachmentImage( weaponIndex, REG7 ) .. "_wv_icon"
					}
				} )
			end
		end
		if weaponVariantInfo.isWildcardNeeded then
			table.insert( attachmentTable, {
				models = {
					image = "cac_mods_primary_gunfighter_wv_icon"
				}
			} )
		end
		return attachmentTable
	end, true )
	return dataSourceName
end

f0_local4 = function ( controller, weaponVariantInfo )
	local infoTable = {
		models = {
			variantIndex = weaponVariantInfo.variantIndex,
			variantName = weaponVariantInfo.variantName,
			variantNameBig = weaponVariantInfo.variantNameBig,
			weaponItemIndex = weaponVariantInfo.weaponIndex,
			cacVariantIndex = weaponVariantInfo.cacVariantIndex
		},
		properties = {
			index = weaponVariantInfo.index,
			weaponVariantInfo = weaponVariantInfo
		},
		models = f0_local3( controller, REG2, weaponVariantInfo )
	}
	return infoTable
end

f0_local5 = function ( attachmentList )
	local count = 0
	for index, attachmentIndex in ipairs( attachmentList ) do
		if attachmentIndex > CoD.CACUtility.EmptyItemIndex then
			count = count + 1
		end
	end
	return count
end

local WeaponVariantListPrepare = function ( controller )
	local infoTable = {}
	local baseWeaponIndex = CoD.perController[controller].weaponIndexForVariant
	local baseWeaponVariant = {
		variantName = Engine.GetItemName( baseWeaponIndex ),
		variantNameBig = "",
		variantIndex = CoD.CACUtility.EmptyItemIndex,
		weaponIndex = baseWeaponIndex,
		index = 0,
		attachmentsByIndex = {},
		attachmentVariant = {},
		camoIndex = 0,
		reticleIndex = 0,
		paintjobIndex = 0,
		cacVariantIndex = 0
	}
	table.insert( infoTable, f0_local4( controller, baseWeaponVariant ) )
	local weaponVaraintTable = CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList( baseWeaponIndex )
	for index, weaponVariantInfo in ipairs( weaponVaraintTable ) do
		local variant = CoD.CraftUtility.Gunsmith.GetVariantByIndex( controller, weaponVariantInfo.variantIndex )
		if CoD.CACUtility.EmptyItemIndex < variant.weaponIndex then
			local attachmentsByIndex = {}
			local attachments = variant.attachment
			local numAttachments = f0_local5( attachments )
			local isWildcardNeeded = false
			local variantHasOpticAttachment = false
			local f134_local3 = CoD.perController[controller].weaponCategory == "primary"
			local maxNonOpticsAttachmentsWithoutWildcard = 2
			if not f134_local3 then
				maxNonOpticsAttachmentsWithoutWildcard = 1
			end
			local maxAttachmentsWithoutWildcard = maxNonOpticsAttachmentsWithoutWildcard + 1
			for i, attachmentTableIndex in ipairs( attachments ) do
				if CoD.CACUtility.EmptyItemIndex < attachmentTableIndex then
					local newAttachmentIndex = Engine.GetAttachmentIndexByAttachmentTableIndex( variant.weaponIndex, REG23 )
					if Engine.IsOptic( variant.weaponIndex, newAttachmentIndex ) then
						variantHasOpticAttachment = true
					end
					table.insert( attachmentsByIndex, newAttachmentIndex )
				end
				table.insert( attachmentsByIndex, CoD.CACUtility.EmptyItemIndex )
			end
			if f134_local3 and (CoD.CACUtility.EmptyItemIndex < attachmentsByIndex[4] or CoD.CACUtility.EmptyItemIndex < attachmentsByIndex[5] or CoD.CACUtility.EmptyItemIndex < attachmentsByIndex[6]) then
				isWildcardNeeded = true
			elseif not f134_local3 and CoD.CACUtility.EmptyItemIndex < attachmentsByIndex[3] then
				isWildcardNeeded = true
			end
			variant.variantNameBig = variant.variantName
			variant.attachmentsByIndex = attachmentsByIndex
			variant.index = REG8
			variant.isWildcardNeeded = isWildcardNeeded
			table.insert( infoTable, f0_local4( controller, variant ) )
		end
	end
	return infoTable
end

DataSources.WeaponVariantList = DataSourceHelpers.ListSetup( "WeaponVariantList", WeaponVariantListPrepare, false )
CoD.WGSV_Category = {}
CoD.WGSV_Category.WEAPON = 1
CoD.WGSV_Category.GUNSMITH_VARIANT = 2
DataSources.WGSV_Category = Engine.CreateModel( Engine.GetGlobalModel(), "WGSV_Category" )
