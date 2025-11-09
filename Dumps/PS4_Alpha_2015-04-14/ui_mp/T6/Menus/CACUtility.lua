require( "ui.T6.MFSlide" )
require( "ui.T6.MFSlidePanel" )
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
	secondaryGadget = "secondarygadget",
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
	cybercomAbility3 = "cybercom_ability2",
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
CoD.CACUtility.GetCameraNameForAttachments = function ( attachmentsString )
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
	return "select0" .. 1 + suppressor + extbarrel
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

CoD.CACUtility.GetAttachmentListForSlot = function ( loadoutSlot )
	if loadoutSlot == "primary" then
		return CoD.CACUtility.PrimaryAttachmentSlotNameList
	elseif loadoutSlot == "secondary" then
		return CoD.CACUtility.SecondaryAttachmentSlotNameList
	elseif loadoutSlot == "primarygadget" then
		return CoD.CACUtility.PrimaryGadgetAttachmentSlotNameList
	elseif loadoutSlot == "secondarygadget" then
		return CoD.CACUtility.SecondaryGadgetAttachmentSlotNameList
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
	local f11_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_LOADOUTS_OFFLINE )
	return f11_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsMPOnlinePublic = function ( controller )
	local f12_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	return f12_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsMPOnlineCustom = function ( controller )
	local f13_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	return f13_local0.customMatchCacLoadouts
end

CoD.CACUtility.GetLoadoutsMPOnlineLeague = function ( controller )
	local f14_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	return f14_local0.leagueCacLoadouts
end

CoD.CACUtility.GetLoadoutsCP = function ( controller )
	local f15_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_CP_LOADOUTS )
	return f15_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsZMOffline = function ( controller )
	local f16_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_ZM_LOADOUTS_OFFLINE )
	return f16_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsZMOnlinePublic = function ( controller )
	local f17_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_ZM_LOADOUTS )
	return f17_local0.cacLoadouts
end

CoD.CACUtility.GetLoadoutsZMOnlineCustom = function ( controller )
	local f18_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_ZM_LOADOUTS )
	return f18_local0.customMatchCacLoadouts
end

CoD.CACUtility.SetDefaultCACRootOld = function ( controller )
	if CoD.isOnlineGame() ~= true then
		local f19_local0 = CoD.perController[controller]
		local f19_local1 = CoD.GetPlayerStats( controller )
		f19_local0.cacRoot = f19_local1.cacLoadouts
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
		local f19_local0 = CoD.perController[controller]
		local f19_local1 = CoD.GetPlayerStats( controller )
		f19_local0.cacRoot = f19_local1.leagueCacLoadouts
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) then
		local f19_local0 = CoD.perController[controller]
		local f19_local1 = CoD.GetPlayerStats( controller )
		f19_local0.cacRoot = f19_local1.customMatchCacLoadouts
	else
		local f19_local0 = CoD.perController[controller]
		local f19_local1 = CoD.GetPlayerStats( controller )
		f19_local0.cacRoot = f19_local1.cacLoadouts
	end
end

CoD.CACUtility.SetDefaultCACRoot = function ( controller )
	local loadoutFunc = nil
	if CoD.isOnlineGame() ~= true then
		loadoutFunc = CoD.CPMPZM( CoD.CACUtility.GetLoadoutsCP, CoD.CACUtility.GetLoadoutsMPOffline, CoD.CACUtility.GetLoadoutsZMOffline )
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_LEAGUE_MATCH ) then
		loadoutFunc = CoD.CPMPZM( nil, CoD.CACUtility.GetLoadoutsMPOnlineLeague, nil )
	elseif Engine.GameModeIsMode( CoD.GAMEMODE_PRIVATE_MATCH ) then
		loadoutFunc = CoD.CPMPZM( CoD.CACUtility.GetLoadoutsCP, CoD.CACUtility.GetLoadoutsMPOnlineCustom, CoD.CACUtility.GetLoadoutsZMOnlineCustom )
	else
		loadoutFunc = CoD.CPMPZM( CoD.CACUtility.GetLoadoutsCP, CoD.CACUtility.GetLoadoutsMPOnlinePublic, CoD.CACUtility.GetLoadoutsZMOnlinePublic )
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
	local f21_local0 = CoD.perController[controller]
	local f21_local1 = Engine.GetGametypeSettings()
	f21_local0.cacRoot = f21_local1.cacLoadouts[index]
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
	if CoD.isSinglePlayer == true then
		return CoD.CACUtility.GetLoadoutNames( controller )
	else
		local loadoutNames = CoD.CACUtility.GetLoadoutNames( controller )
		if loadoutNames then
			return loadoutNames[customClassNum]
		else
			return nil
		end
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
	if loadoutSlotName == "secondary" then
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

CoD.CACUtility.GetCACWeaponAttachmentList = function ( baseWeaponLoadout )
	local attachmentList = CoD.CACUtility.PrimaryAttachmentSlotNameList
	if baseWeaponLoadout == "secondary" then
		attachmentList = CoD.CACUtility.SecondaryAttachmentSlotNameList
	end
	return attachmentList
end

CoD.CACUtility.GetCACWeaponACVList = function ( baseWeaponLoadout )
	local acvList = CoD.CACUtility.PrimaryAttachmentCVSlotNameList
	if baseWeaponLoadout == "secondary" then
		acvList = CoD.CACUtility.SecondaryAttachmentCVSlotNameList
	end
	return acvList
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
	return nil
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

CoD.CACUtility.SearchForBonusCard = function ( bonuscardName, controller, classModel )
	if not controller then
		return ""
	end
	local f40_local0 = classModel
	local currentClass = CoD.perController[controller].classModel
	local f40_local1 = f40_local0 or currentClass
	if f40_local1 then
		for index, slotName in ipairs( CoD.CACUtility.BonuscardSlotNameList ) do
			local cardModel = Engine.GetModel( f40_local1, slotName )
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

CoD.CACUtility.GetItemRefEquippedInSlot = function ( slotName, controller, classModel )
	if not controller then
		return 
	end
	local f41_local0 = classModel
	local currentClass = CoD.perController[controller].classModel
	local f41_local1 = f41_local0 or currentClass
	if f41_local1 then
		local slotModel = Engine.GetModel( f41_local1, slotName )
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
	local f47_local0
	if CoD.CACUtility.SearchForBonusCard( "bonuscard_danger_close", controller ) == "" and CoD.CACUtility.SearchForBonusCard( "bonuscard_two_tacticals", controller ) == "" then
		f47_local0 = false
	else
		f47_local0 = true
	end
	return f47_local0
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
	elseif CoD.CACUtility.IsSlotNameInList( CoD.CACUtility.PrimaryAttachmentSlotNameList, slotName ) then
		local weaponIndex = CoD.CACUtility.GetItemEquippedInSlot( CoD.perController[controller].weaponSlot, controller )
		for _, loadoutSlot in ipairs( CoD.CACUtility.PrimaryAttachmentSlotNameList ) do
			local slotIndex = CoD.CACUtility.GetItemEquippedInSlot( loadoutSlot, controller )
			if slotIndex ~= itemIndex and not Engine.AreAttachmentsCompatible( weaponIndex, slotIndex, itemIndex ) then
				return loadoutSlot
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
			return currAttachmentRef
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
				Engine.SetModelValue( Engine.CreateModel( classModel, slot .. ".headerName" ), "MPUI_PRIMARY_OPTIC_CAPS" )
			else
				Engine.SetModelValue( Engine.CreateModel( classModel, slot .. ".headerName" ), "MPUI_PRIMARY_ATTACHMENT_CAPS" )
			end
		end
		for index, slot in ipairs( CoD.CACUtility.SecondaryAttachmentSlotNameList ) do
			if index == 1 then
				Engine.SetModelValue( Engine.CreateModel( classModel, slot .. ".headerName" ), "MPUI_SECONDARY_OPTIC_CAPS" )
			else
				Engine.SetModelValue( Engine.CreateModel( classModel, slot .. ".headerName" ), "MPUI_SECONDARY_ATTACHMENT_CAPS" )
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

CoD.CACUtility.GetCACSlotStatus = function ( controller, classModel, slotName )
	local availability = CoD.CACUtility.CACStatusAvailable.AVAILABLE
	local equipped = false
	local statusString = ""
	local statusArg = nil
	if CoD.CACUtility.ItemEquippedInSlot( slotName, controller, classModel ) then
		equipped = true
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
			if CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_1_greed", controller, classModel ) == "" then
				statusString = "MPUI_REQUIRES_PERK_1_GREED"
				availability = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			end
		elseif slotName == "specialty5" then
			if CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_2_greed", controller, classModel ) == "" then
				statusString = "MPUI_REQUIRES_PERK_2_GREED"
				availability = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
			end
		elseif slotName == "specialty6" and CoD.CACUtility.SearchForBonusCard( "bonuscard_perk_3_greed", controller, classModel ) == "" then
			statusString = "MPUI_REQUIRES_PERK_3_GREED"
			availability = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
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
			elseif CoD.CACUtility.SearchForBonusCard( "bonuscard_primary_gunfighter", controller, classModel ) == "" then
				statusString = "MPUI_REQUIRES_PRIMARY_GUNFIGHTER"
				availability = CoD.CACUtility.CACStatusAvailable.REQUIRES_WILDCARD
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

CoD.CACUtility.WildcardNeededForSlot = function ( slotName )
	if slotName == "specialty4" then
		return "bonuscard_perk_1_greed"
	elseif slotName == "specialty5" then
		return "bonuscard_perk_2_greed"
	elseif slotName == "specialty6" then
		return "bonuscard_perk_3_greed"
	elseif slotName == "primaryattachment4" or slotName == "primaryattachment5" or slotName == "primaryattachment6" then
		return "bonuscard_primary_gunfighter"
	elseif slotName == "secondaryattachment3" then
		return "bonuscard_secondary_gunfighter"
	elseif slotName == "primarygadgetattachment1" then
		return "bonuscard_danger_close"
	else
		return nil
	end
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
	for slotName, f65_local3 in pairs( CoD.CACUtility.emptyImageSlotList ) do
		local slotModel = Engine.GetModel( classModel, slotName )
		if slotModel then
			if slotName == "secondary" and isUsingOverkill == true then
				f65_local3 = CoD.CACUtility.emptyImageSlotList.primary
			elseif LUI.startswith( slotName, "primarygadget" ) and isUsingTwoTacticals == true then
				f65_local3 = CoD.CACUtility.emptyImageSlotList.secondarygadget
			end
			Engine.SetModelValue( Engine.CreateModel( slotModel, "emptyImage" ), f65_local3 )
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
	
	updateWeaponVariantName( "primary" )
	updateWeaponVariantName( "secondary" )
	local updateImageModel = function ( loadoutSlot, postfixText )
		local slotModel = Engine.GetModel( classModel, loadoutSlot )
		if not slotModel then
			return 
		end
		local imageModel = Engine.GetModel( slotModel, "image" )
		if imageModel then
			local imageModelValue = Engine.GetModelValue( imageModel )
			if imageModelValue and imageModelValue ~= CoD.CACUtility.DefaultLoadoutImage then
				Engine.SetModelValue( imageModel, imageModelValue .. postfixText )
			end
		end
	end
	
	updateImageModel( "primary", "_sm" )
	updateImageModel( "secondary", "_sm" )
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
						local attachmentNameModel = Engine.GetModel( classModel, attachmentSlot .. ".name" )
						Engine.SetModelValue( attachmentNameModel, acv.name )
						local acvNameModel = Engine.GetModel( classModel, attachmentSlot .. "cosmeticvariant.name" )
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
	DataSources.CustomClassMenu.updateCustomSlotModel( classModel, "specialgadget", controller )
	CoD.CACUtility.UpdateGrenadeNames( controller, classNum, classModel )
	CoD.CACUtility.UpdateEmptySlotImages( controller, classNum, classModel )
	for _, slotName in ipairs( CoD.CACUtility.loadoutSlotOrder ) do
		local slotModel = Engine.GetModel( classModel, slotName )
		if slotModel then
			local hintTextModel = Engine.CreateModel( slotModel, "hintText" )
			if hintTextModel then
				local availability, equipped, hintText, hintArg = CoD.CACUtility.GetCACSlotStatus( controller, classModel, slotName )
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
								local f73_local3 = Engine.SetModelValue
								local f73_local4 = acvNameModel
								local f73_local5
								if variantInfo then
									f73_local5 = variantInfo.name
									if not f73_local5 then
									
									else
										f73_local3( f73_local4, f73_local5 )
										f73_local3 = Engine.SetModelValue
										f73_local4 = acvImageModel
										if variantInfo then
											f73_local5 = variantInfo.image
											if not f73_local5 then
											
											else
												f73_local3( f73_local4, f73_local5 )
												Engine.SetModelValue( acvRefModel, attachmentRef )
											end
										end
										f73_local5 = ""
									end
								end
								f73_local5 = ""
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
		if paintJobSlot ~= CoD.CraftUtility.Gunsmith.INVALID_PAINTSHOP_SLOT and paintJobIndex ~= CoD.CraftUtility.Gunsmith.INVALID_PAINTSHOP_INDEX then
			Engine.SetupPaintjobData( controller, paintJobSlot, paintJobIndex )
			paintJobAvailable = 1
		end
	end
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
	if variantInfo.paintjobSlot and variantInfo.paintjobIndex and variantInfo.paintjobSlot ~= CoD.CraftUtility.Gunsmith.INVALID_PAINTSHOP_SLOT and variantInfo.paintjobIndex ~= CoD.CraftUtility.Gunsmith.INVALID_PAINTSHOP_INDEX then
		Engine.SetupPaintjobData( controller, variantInfo.paintjobSlot, variantInfo.paintjobIndex )
		paintJobAvailable = 1
	end
	return camoIndex .. "," .. reticleIndex .. "," .. paintJobAvailable
end

CoD.CACUtility.GetAttachmentCosmeticVariantsFromVariantInfo = function ( variantInfo )
	local attachmentInfo = ""
	return attachmentInfo
end

CoD.CACUtility.GetBaseWeaponLoadoutSlotName = function ( loadoutSlot )
	local baseWeaponLoadoutSlot = nil
	if loadoutSlot == "primary" or loadoutSlot == "secondary" or loadoutSlot == "primarygadget" or loadoutSlot == "secondarygadget" then
		baseWeaponLoadoutSlot = loadoutSlot
	elseif LUI.startswith( loadoutSlot, "primaryattachment" ) then
		baseWeaponLoadoutSlot = "primary"
	elseif LUI.startswith( loadoutSlot, "secondaryattachment" ) then
		baseWeaponLoadoutSlot = "secondary"
	elseif LUI.startswith( loadoutSlot, "primarygadgetattachment" ) then
		baseWeaponLoadoutSlot = "primarygadget"
	elseif LUI.startswith( loadoutSlot, "secondarygadgetattachment" ) then
		baseWeaponLoadoutSlot = "secondarygadget"
	end
	return baseWeaponLoadoutSlot
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
					local f83_local6 = false
					local attachmentIndexFromAttachmentTable = Engine.GetAttachmentIndexByAttachmentTableIndex( variant.weaponIndex, attachmentIndex )
					if attachmentIndexFromAttachmentTable > CoD.CACUtility.EmptyItemIndex then
						for cacAttachmentTableIndex, attachmentName in ipairs( attachmentList ) do
							local cacAttachmentIndex = Engine.GetModelValue( Engine.GetModel( classModel, attachmentName .. ".itemIndex" ) )
							if attachmentIndexFromAttachmentTable == cacAttachmentIndex then
								f83_local6 = true
								break
							end
						end
						if not f83_local6 then
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
			local prevSlotListItem, f84_local3 = nil
			local f84_local4 = true
			if itemListPrevIndex > 0 then
				f84_local3 = completeItemList[itemListPrevIndex].models.itemSlot
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
								if f84_local3 and f84_local3 == "primarygadget" then
									completeItemList[itemListPrevIndex].properties.spacing = itemSpacing
									f84_local4 = false
								end
								table.insert( completeItemList, getItemModels( slotName, customSlotModel, categorySpacing, f84_local4 ) )
							end
						end
						if LUI.startswith( slotName, "secondarygadgetattachment" ) then
							local gadgetIndexModel = Engine.GetModel( classModel, "secondarygadget.itemIndex" )
							if gadgetIndexModel then
								local gadgetIndex = Engine.GetModelValue( gadgetIndexModel )
								local customSlotModel = Engine.GetModel( classModel, "secondarygadgetattachment1" )
								if f84_local3 and f84_local3 == "secondarygadget" then
									completeItemList[itemListPrevIndex].properties.spacing = itemSpacing
									f84_local4 = false
								end
								table.insert( completeItemList, getItemModels( slotName, customSlotModel, categorySpacing, f84_local4 ) )
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
							if f84_local3 and (not (f84_local3 ~= "primary" or not LUI.startswith( slotName, "primaryattachment" )) or not (not LUI.startswith( slotName, "primaryattachment" ) or not LUI.startswith( slotName, "primaryattachment" )) or not (f84_local3 ~= "secondary" or not LUI.startswith( slotName, "secondaryattachment" )) or not (not LUI.startswith( slotName, "secondaryattachment" ) or not LUI.startswith( slotName, "secondaryattachment" )) or not (f84_local3 ~= "specialty1" or slotName ~= "specialty4") or not (f84_local3 ~= "specialty2" or slotName ~= "specialty5") or not (f84_local3 ~= "specialty3" or slotName ~= "specialty6") or LUI.startswith( f84_local3, "bonuscard" ) and LUI.startswith( slotName, "bonuscard" )) then
								completeItemList[itemListPrevIndex].properties.spacing = itemSpacing
								f84_local4 = false
							end
							table.insert( completeItemList, getItemModels( slotName, slotModel, spacing, f84_local4 ) )
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
