require( "lua.Shared.LuaUtils" )

CoD.CraftUtility = {}
CoD.CraftUtility.Fileshare = {}
CoD.CraftUtility.Gunsmith = {}
CoD.CraftUtility.Gunsmith.CachedVariants = {}
CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS = 8
CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX = 0
CoD.CraftUtility.Gunsmith.CAMO_NONE = 0
CoD.CraftUtility.Gunsmith.RETICLE_NONE = 0
CoD.CraftUtility.PAINTSHOP_GRIDSIZE = 16
CoD.CraftUtility.EMBLEM_GRIDSIZE = 24
CoD.CraftUtility.DEFAULT_READ_ONLY_FLAG = 0
CoD.CraftUtility.EMBLEM_INVALID_ID = -1
CoD.CraftUtility.EMBLEM_MAX_COLOR_COMPONENT_VALUE = 255
CoD.CraftUtility.EMBLEM_MAX_GRADIENT_SLIDER_VALUE = 100
CoD.CraftUtility.EMBLEM_CLIPBOARDSTATE = {
	FULL = 0,
	EMPTY = 1
}
CoD.CraftUtility.EMBLEM_ADDDECAL = {
	REPLACE = 0,
	INSERT = 1
}
CoD.CraftUtility.PaintshopView = {
	{
		view_name = "left",
		customization_type = Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_LEFT,
		view_string_ref = "MENU_PAINTSHOP_VIEW_LEFT",
		edit_side_ref = "MENU_PAINTSHOP_EDIT_LAYER"
	},
	{
		view_name = "top",
		customization_type = Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_TOP,
		view_string_ref = "MENU_PAINTSHOP_VIEW_TOP",
		edit_side_ref = "MENU_PAINTSHOP_EDIT_LAYER"
	},
	{
		view_name = "right",
		customization_type = Enum.CustomizationType.CUSTOMIZATION_TYPE_PAINTSHOP_VIEW_RIGHT,
		view_string_ref = "MENU_PAINTSHOP_VIEW_RIGHT",
		edit_side_ref = "MENU_PAINTSHOP_EDIT_LAYER"
	}
}
CoD.CraftUtility.EmblemBlackMarketDecalCategory = 5
CoD.CraftUtility.EMBLEM_DECALTABS = {
	{
		type = "ICON",
		displayName = "MENU_EMBLEM_SELECTOR_ICONS_TAB",
		category = 1
	},
	{
		type = "PATTERNS",
		displayName = "MENU_EMBLEM_SELECTOR_PATTERNS_TAB",
		category = 2
	},
	{
		type = "TOOLS",
		displayName = "MENU_EMBLEM_SELECTOR_TOOLS_TAB",
		category = 3
	},
	{
		type = "TYPE",
		displayName = "MENU_EMBLEM_SELECTOR_TYPE_TAB",
		category = 4
	},
	{
		type = "BLACKMARKET",
		displayName = "MENU_BLACK_MARKET",
		category = 5
	}
}
CoD.CraftUtility.EmblemBlackMarketEmblemCategory = 3
CoD.CraftUtility.EmblemMaterialCategory = {
	{
		category = 1,
		type = "general",
		name = "MENU_EMBLEM_MATERIAL_GENERAL"
	},
	{
		category = 2,
		type = "camo",
		name = "MENU_EMBLEM_MATERIAL_CAMO"
	},
	{
		category = 3,
		type = "loot",
		name = "MENU_BLACK_MARKET"
	}
}
CoD.CraftUtility.WeaponGroupNames = {
	{
		index = 1,
		weapon_category = "weapon_smg",
		lowercaseName = "MPUI_SUB_MACHINE_GUNS",
		name = "MPUI_WEAPON_SMG_ABBR_CAPS_WITH_S",
		loadout_slot = "primary",
		weapon_image = "t7_wpn_build_kit_smg"
	},
	{
		index = 2,
		weapon_category = "weapon_assault",
		lowercaseName = "MPUI_ASSAULT_RIFLES",
		name = "MPUI_WEAPON_ASSAULT_CAPS",
		loadout_slot = "primary",
		weapon_image = "t7_wpn_build_kit_ar"
	},
	{
		index = 3,
		weapon_category = "weapon_cqb",
		lowercaseName = "MPUI_CQBS",
		name = "MPUI_CQBS_CAPS",
		loadout_slot = "primary",
		weapon_image = "t7_wpn_build_kit_shotgun"
	},
	{
		index = 4,
		weapon_category = "weapon_lmg",
		lowercaseName = "MPUI_LIGHT_MACHINE_GUNS",
		name = "MPUI_WEAPON_LMG_ABBR_CAPS_WITH_S",
		loadout_slot = "primary",
		weapon_image = "t7_wpn_build_kit_lmg"
	},
	{
		index = 5,
		weapon_category = "weapon_sniper",
		lowercaseName = "MPUI_SNIPER_RIFLES",
		name = "MPUI_WEAPON_SNIPER_CAPS",
		loadout_slot = "primary",
		weapon_image = "t7_wpn_build_kit_sniper"
	},
	{
		index = 6,
		weapon_category = "secondary",
		lowercaseName = "MPUI_WEAPON_SECONDARIES",
		name = "MPUI_WEAPON_SECONDARIES_CAPS",
		loadout_slot = "secondary",
		weapon_image = "t7_wpn_build_kit_pistol"
	}
}
CoD.CraftUtility.GetMaterialCategoryTypeByID = function ( id )
	for i = 1, #CoD.CraftUtility.EmblemMaterialCategory, 1 do
		if id and CoD.CraftUtility.EmblemMaterialCategory[i].category == id then
			return CoD.CraftUtility.EmblemMaterialCategory[i].type
		end
	end
	return nil
end

CoD.CraftUtility.GetDecalCategoryTypeByID = function ( id )
	for i = 1, #CoD.CraftUtility.EMBLEM_DECALTABS, 1 do
		if CoD.CraftUtility.EMBLEM_DECALTABS[i].category == id then
			return CoD.CraftUtility.EMBLEM_DECALTABS[i].type
		end
	end
	return nil
end

CoD.CraftUtility.InvalidateWCItemRender = function ( paintjobSlot, paintjobIndex )
	Engine.InvalidateWCItemRender( paintjobSlot, paintjobIndex )
end

CoD.CraftUtility.GetUsedSlotsByFileType = function ( controller, fileType )
	local usedSlots = 0
	if fileType == Enum.StorageFileType.STORAGE_PAINTJOBS then
		usedSlots = CoD.CraftUtility.Paintjobs.GetTotalUsedPaintjobs()
	elseif fileType == Enum.StorageFileType.STORAGE_GUNSMITH then
		usedSlots = CoD.CraftUtility.Gunsmith.GetTotalUsedVariants()
	elseif fileType == Enum.StorageFileType.STORAGE_EMBLEMS then
		usedSlots = CoD.CraftUtility.Emblems.GetTotalUsedEmblems( controller, fileType )
	end
	return usedSlots
end

CoD.CraftUtility.GetTotalAllowedSlotsByFileType = function ( controller, fileType )
	local allowedSlots = 0
	if fileType == Enum.StorageFileType.STORAGE_PAINTJOBS then
		allowedSlots = CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs( controller )
	elseif fileType == Enum.StorageFileType.STORAGE_GUNSMITH then
		allowedSlots = CoD.CraftUtility.Gunsmith.GetTotalAllowedVaraints()
	elseif fileType == Enum.StorageFileType.STORAGE_EMBLEMS then
		allowedSlots = CoD.CraftUtility.Emblems.GetTotalAllowedEmblems( controller, fileType )
	end
	return allowedSlots
end

CoD.CraftUtility.GetGridTypeName = function ( controller )
	local settingName = "paintshop_grid_size"
	if not IsPaintshop( controller ) then
		settingName = "emblem_grid_size"
	end
	return settingName
end

CoD.CraftUtility.GetGridSize = function ( controller )
	local gridSize = CoD.CraftUtility.PAINTSHOP_GRIDSIZE
	if not IsPaintshop( controller ) then
		gridSize = CoD.CraftUtility.EMBLEM_GRIDSIZE
	end
	return gridSize
end

CoD.CraftUtility.GetDDLRoot = function ( controller, fileType, slot )
	if fileType == "cacRoot" then
		return Engine.GetCACRoot( controller )
	elseif slot ~= nil then
		return Engine.StorageGetBuffer( controller, fileType, slot )
	else
		return Engine.StorageGetBuffer( controller, fileType )
	end
end

CoD.CraftUtility.UploadBuffer = function ( controller, fileType, slot )
	if fileType == Enum.StorageFileType.STORAGE_GUNSMITH then
		fileType = CoD.CraftUtility.Gunsmith.GetFileType()
	end
	if fileType == "cacRoot" then
		Engine.Exec( controller, "saveLoadout" )
	elseif slot ~= nil then
		Engine.StorageWrite( controller, fileType, slot )
	else
		Engine.StorageWrite( controller, fileType )
	end
end

CoD.CraftUtility.UploadAndParseBuffer = function ( controller, fileType, slot )
	CoD.CraftUtility.UploadBuffer( controller, fileType, slot )
	if fileType == Enum.StorageFileType.STORAGE_GUNSMITH then
		CoD.CraftUtility.Gunsmith.ParseDDL( controller, CoD.CraftUtility.Gunsmith.GetFileType() )
	elseif fileType == Enum.StorageFileType.STORAGE_EMBLEMS then
		CoD.CraftUtility.Emblems.ParseDDL( controller, fileType )
	elseif fileType == Enum.StorageFileType.STORAGE_PAINTJOBS then
		CoD.CraftUtility.Paintjobs.ParseDDL( controller, fileType )
	end
	MediaManagerMarkDirty( controller )
end

CoD.CraftUtility.GetModeAbbreviation = function ()
	if CoD.isSafehouse then
		return "_cp"
	else
		return "_mp"
	end
end

CoD.CraftUtility.GetCraftMode = function ()
	if CoD.isSafehouse then
		return Enum.eModes.MODE_CAMPAIGN
	else
		return Enum.eModes.MODE_MULTIPLAYER
	end
end

CoD.CraftUtility.GetLoadoutSlot = function ( controller )
	local category_index = CoD.GetCustomization( controller, "category_index" )
	if category_index ~= nil then
		category_index = CoD.GetCustomization( controller, "category_index" ) - 1
	else
		category_index = 1
	end
	return CoD.CraftUtility.WeaponGroupNames[category_index].loadout_slot
end

CoD.CraftUtility.DisplayWeaponInPaintshop = function ( controller, camera )
	local weaponRef = Engine.GetItemRef( CoD.GetCustomization( controller, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	local weapon_name = weaponRef .. CoD.CraftUtility.GetModeAbbreviation()
	local loadoutSlot = CoD.CraftUtility.GetLoadoutSlot( controller )
	local weaponOptions = "0,0,1"
	Engine.SendClientScriptNotify( controller, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( controller ), {
		base_weapon_slot = loadoutSlot,
		weapon = weapon_name,
		camera = camera,
		options = weaponOptions
	} )
end

CoD.CraftUtility.PaintjobClear = function ( self, element, controller, param, menu )
	CoD.OverlayUtility.CreateOverlay( controller, menu, "PaintjobClearConfirmationOverlay" )
end

CoD.CraftUtility.PaintjobRename = function ( self, element, controller, param, menu )
	ShowKeyboard( menu, element, controller, "KEYBOARD_TYPE_PAINTJOB" )
end

CoD.CraftUtility.OpenPublishPromptPaintjob = function ( self, element, controller, param, menu )
	local paintjobModel = CoD.perController[controller].selectedpaintjobModel
	local paintjobSlot = Engine.GetModelValue( Engine.GetModel( paintjobModel, "paintjobSlot" ) )
	local paintjobIndex = Engine.GetModelValue( Engine.GetModel( paintjobModel, "paintjobIndex" ) )
	local fileType = Enum.StorageFileType.STORAGE_PAINTJOBS
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, fileType, paintjobSlot )
	local initialItemName = ""
	if rootState ~= nil then
		local weaponPaintjobState = rootState.weaponPaintjob[paintjobIndex]
		local paintjobName = weaponPaintjobState.paintjobName:get()
		if paintjobName ~= nil then
			initialItemName = paintjobName
		end
	end
	CoD.FileshareUtility.OpenPublishPrompt( menu, controller, "paintjob", initialItemName, "", CoD.CraftUtility.Paintjobs.PublishPaintjob )
end

CoD.CraftUtility.GunsmithClear = function ( self, element, controller, param, menu )
	CoD.OverlayUtility.CreateOverlay( controller, menu, "GunsmithClearConfirmationOverlay" )
end

CoD.CraftUtility.GunsmithRename = function ( self, element, controller, param, menu )
	ShowKeyboard( menu, element, controller, "KEYBOARD_TYPE_GUNSMITH" )
end

CoD.CraftUtility.OpenPublishPromptGunsmith = function ( self, element, controller, param, menu )
	local selectedVariantModel = CoD.perController[controller].gunsmithVariantModel
	local variantNameModel = Engine.GetModel( selectedVariantModel, "variantName" )
	local initialItemName = Engine.GetModelValue( variantNameModel )
	CoD.FileshareUtility.OpenPublishPrompt( menu, controller, "variant", initialItemName, "", CoD.CraftUtility.Gunsmith.PublishVariant )
end

CoD.CraftUtility.EmblemClear = function ( self, element, controller, param, menu )
	local overlay = CoD.OverlayUtility.CreateOverlay( controller, menu, "EmblemClearConfirmationOverlay" )
end

CoD.CraftUtility.EmblemRename = function ( self, element, controller, param, menu )
	ShowKeyboard( menu, element, controller, "KEYBOARD_TYPE_EMBLEMS" )
end

CoD.CraftUtility.OpenPublishPromptEmblem = function ( self, element, controller, param, menu )
	if CheckIfFeatureIsBanned( controller + 1, LuaEnum.FEATURE_BAN.USER_GENERATED_CONTENT ) then
		LuaUtils.UI_ShowErrorMessageDialog( controller, GetFeatureBanInfo( controller + 1, LuaEnum.FEATURE_BAN.USER_GENERATED_CONTENT ) )
		return 
	else
		local selectedEmblemModel = CoD.perController[controller].selectedEmblemModel
		local emblemNameModel = Engine.GetModel( selectedEmblemModel, "emblemName" )
		local initialItemName = Engine.GetModelValue( emblemNameModel )
		CoD.FileshareUtility.OpenPublishPrompt( menu, controller, "emblem", initialItemName, "", CoD.CraftUtility.Emblems.PublishEmblem )
	end
end

CoD.CraftUtility.GetWeaponGroupName = function ( controller )
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	local groupName = ""
	if weaponIndex then
		groupName = Engine.GetItemGroup( weaponIndex, Enum.eModes.MODE_MULTIPLAYER )
	end
	return groupName
end

CoD.CraftUtility.Gunsmith.IsCurrentVariantChanged = function ( controller, variantModel )
	if variantModel then
		local variantIndexModel = Engine.GetModel( variantModel, "variantIndex" )
		if variantIndexModel then
			local variantIndex = Engine.GetModelValue( variantIndexModel )
			local variantData = CoD.CraftUtility.Gunsmith.GetVariantByIndex( controller, variantIndex )
			for attachmentIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
				local attachmentModel = Engine.GetModel( variantModel, "attachment" .. attachmentIndex )
				local attachmentID = Engine.GetModelValue( attachmentModel )
				if variantData.attachment[attachmentIndex] ~= attachmentID then
					return true
				end
			end
		end
	end
	return false
end

CoD.CraftUtility.Gunsmith.ClearVariantStatType = function ( state, statType )
	local statTypeState = state.stats[statType]
	if statTypeState then
		statTypeState:set( 0 )
	end
end

CoD.CraftUtility.Gunsmith.ClearVariantStats = function ( controller, variantIndex, mode )
	local statsVariantIndex = variantIndex + 1
	local statsStorageFileType = CoD.CraftUtility.Gunsmith.GetStatsStorageType( mode )
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, statsStorageFileType )
	local variantStatsState = rootState.VariantStats[statsVariantIndex]
	if rootState and variantStatsState then
		CoD.CraftUtility.Gunsmith.ClearVariantStatType( variantStatsState, "kills" )
		CoD.CraftUtility.Gunsmith.ClearVariantStatType( variantStatsState, "deaths" )
		CoD.CraftUtility.Gunsmith.ClearVariantStatType( variantStatsState, "deathsDuringUse" )
		CoD.CraftUtility.Gunsmith.ClearVariantStatType( variantStatsState, "shots" )
		CoD.CraftUtility.Gunsmith.ClearVariantStatType( variantStatsState, "hits" )
		CoD.CraftUtility.Gunsmith.ClearVariantStatType( variantStatsState, "headshots" )
		CoD.CraftUtility.Gunsmith.ClearVariantStatType( variantStatsState, "destroyed" )
		CoD.CraftUtility.Gunsmith.ClearVariantStatType( variantStatsState, "backstabber_kill" )
		Engine.StorageWrite( controller, statsStorageFileType )
	end
end

CoD.CraftUtility.Gunsmith.GetStatsStorageType = function ( mode )
	if mode == Enum.eModes.MODE_CAMPAIGN then
		return Enum.StorageFileType.STORAGE_CP_STATS_ONLINE
	else
		return Enum.StorageFileType.STORAGE_MP_STATS_ONLINE
	end
end

CoD.CraftUtility.Gunsmith.GetSnapshotSessionMode = function ()
	local sessionModeModel = Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.SessionMode" )
	local sessionMode = Enum.eModes.MODE_MULTIPLAYER
	if sessionModeModel then
		sessionMode = Engine.GetModelValue( sessionModeModel )
	end
	return sessionMode
end

CoD.CraftUtility.Gunsmith.GetRatio = function ( value1, value2 )
	local ratio = value1
	if value2 ~= 0 then
		ratio = value1 / value2
	end
	return ratio
end

CoD.CraftUtility.Gunsmith.GetVariantStatValue = function ( state, statType )
	local statTypeState = state.stats[statType]
	local statValue = 0
	if statTypeState then
		statValue = statTypeState:get()
	end
	return statValue
end

CoD.CraftUtility.Gunsmith.GetWeaponStatValue = function ( state, statType )
	local statTypeState = state.stats[statType]
	local statValue = 0
	if statTypeState then
		local statValueStatPath = statTypeState.statValue
		if statValueStatPath then
			statValue = statValueStatPath:get()
		end
	end
	return statValue
end

CoD.CraftUtility.Gunsmith.GetVariantStats = function ( controller, statType, variantIndex, mode )
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, CoD.CraftUtility.Gunsmith.GetStatsStorageType( mode ) )
	local variantStatsState = rootState.VariantStats[variantIndex]
	if rootState and variantStatsState then
		if statType == "accuracy" then
			local shots = CoD.CraftUtility.Gunsmith.GetVariantStatValue( variantStatsState, "shots" )
			local hits = CoD.CraftUtility.Gunsmith.GetVariantStatValue( variantStatsState, "hits" )
			local accuracy = CoD.CraftUtility.Gunsmith.GetRatio( hits, shots )
			return GunsmithAccuracyPercentage( accuracy )
		elseif statType == "kd" then
			local kills = CoD.CraftUtility.Gunsmith.GetVariantStatValue( variantStatsState, "kills" )
			local deaths = CoD.CraftUtility.Gunsmith.GetVariantStatValue( variantStatsState, "deathsDuringUse" )
			local kd = CoD.CraftUtility.Gunsmith.GetRatio( kills, deaths )
			return kd
		else
			return CoD.CraftUtility.Gunsmith.GetVariantStatValue( variantStatsState, statType )
		end
	else
		return 0
	end
end

CoD.CraftUtility.Gunsmith.GetWeaponStats = function ( controller, statType, weaponIndex, mode )
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, CoD.CraftUtility.Gunsmith.GetStatsStorageType( mode ) )
	local itemStatsState = rootState.ItemStats[weaponIndex]
	if rootState and itemStatsState then
		if statType == "accuracy" then
			local shots = CoD.CraftUtility.Gunsmith.GetWeaponStatValue( itemStatsState, "shots" )
			local hits = CoD.CraftUtility.Gunsmith.GetWeaponStatValue( itemStatsState, "hits" )
			local accuracy = CoD.CraftUtility.Gunsmith.GetRatio( hits, shots )
			return GunsmithAccuracyPercentage( accuracy )
		elseif statType == "kd" then
			local kills = CoD.CraftUtility.Gunsmith.GetWeaponStatValue( itemStatsState, "kills" )
			local deaths = CoD.CraftUtility.Gunsmith.GetWeaponStatValue( itemStatsState, "deathsDuringUse" )
			local kd = CoD.CraftUtility.Gunsmith.GetRatio( kills, deaths )
			return kd
		elseif statType == "backstabber_kill" then
			return 0
		else
			return CoD.CraftUtility.Gunsmith.GetWeaponStatValue( itemStatsState, statType )
		end
	else
		
	end
end

CoD.CraftUtility.Gunsmith.GetWeaponStatList = function ( controller, weaponIndex, mode )
	local statList = {}
	local itemName = Engine.GetItemRef( weaponIndex, mode )
	if itemName == "launcher_lockonly" then
		statList = {
			"destroyed"
		}
	elseif itemName == "launcher_standard" then
		statList = {
			"kills",
			"destroyed"
		}
	elseif itemName == "knife_loadout" then
		statList = {
			"kills",
			"backstabber_kill",
			"kd"
		}
	else
		statList = {
			"kills",
			"headshots",
			"accuracy"
		}
		if mode == Enum.eModes.MODE_MULTIPLAYER then
			table.insert( statList, "kd" )
		end
	end
	return statList
end

CoD.CraftUtility.Gunsmith.GetWeaponStatHeader = function ( statType )
	if statType == "kills" then
		return "MENU_GUNSMITH_KILLS_CAPS"
	elseif statType == "headshots" then
		return "MENU_GUNSMITH_HEADSHOTS_CAPS"
	elseif statType == "accuracy" then
		return "MENU_GUNSMITH_ACCURACY_CAPS"
	elseif statType == "kd" then
		return "MENU_GUNSMITH_KD_CAPS"
	elseif statType == "destroyed" then
		return "MENU_GUNSMITH_VEHICLES_DESTROYED_CAPS"
	elseif statType == "backstabber_kill" then
		return "MENU_GUNSMITH_BACKSTABS_CAPS"
	else
		return "MENU_GUNSMITH_UNKNOWN_CAPS"
	end
end

CoD.CraftUtility.Gunsmith.WeaponHasNewOptics = function ( controller, weaponIndex )
	if not IsProgressionEnabled( controller ) then
		return false
	else
		return Engine.AreAnyOpticsNew( controller, weaponIndex )
	end
end

CoD.CraftUtility.Gunsmith.WeaponHasNewNonOpticAttachments = function ( controller, weaponIndex )
	if not IsProgressionEnabled( controller ) then
		return false
	else
		return Engine.AreAnyNonOpticAttachmentsNew( controller, weaponIndex )
	end
end

CoD.CraftUtility.Gunsmith.WeaponHasNewCamos = function ( controller, weaponIndex )
	if not IsProgressionEnabled( controller ) then
		return false
	end
	for optionItemIndex = 0, Engine.GetWeaponOptionsCount(), 1 do
		if Engine.GetWeaponOptionGroupName( optionItemIndex ) == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO and Engine.IsWeaponOptionNew( controller, weaponIndex, optionItemIndex ) then
			return true
		end
	end
end

CoD.CraftUtility.Gunsmith.WeaponHasAnyNewItems = function ( controller, weaponIndex )
	if not IsProgressionEnabled( controller ) then
		return false
	end
	local f40_local0 = CoD.CraftUtility.Gunsmith.WeaponHasNewOptics( controller, weaponIndex )
	if not f40_local0 then
		f40_local0 = CoD.CraftUtility.Gunsmith.WeaponHasNewNonOpticAttachments( controller, weaponIndex )
		if not f40_local0 then
			f40_local0 = CoD.CraftUtility.Gunsmith.WeaponHasNewCamos( controller, weaponIndex )
		end
	end
	return f40_local0
end

CoD.CraftUtility.Gunsmith.GetBreadcrumbCountForWeaponGroup = function ( controller, weaponGroup )
	if not IsProgressionEnabled( controller ) then
		return 0
	end
	local count = 0
	local unlockablesTable = CoD.CACUtility.GetUnlockablesTable( controller )
	for index, model in ipairs( unlockablesTable[weaponGroup] ) do
		local weaponIndex = Engine.GetModelValue( Engine.GetModel( model, "itemIndex" ) )
		local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
		if weaponIndex > CoD.CACUtility.EmptyItemIndex and Engine.IsItemNew( controller, weaponIndex, mode ) then
			count = count + 1
		end
		if not Engine.IsItemLocked( controller, weaponIndex, mode ) and CoD.CraftUtility.Gunsmith.WeaponHasAnyNewItems( controller, weaponIndex ) then
			count = count + 1
		end
	end
	return count
end

CoD.CraftUtility.Gunsmith.AnyNewWeaponsOrAttachmentsForGroup = function ( controller, weaponGroup )
	if not IsProgressionEnabled( controller ) then
		return false
	end
	local unlockablesTable = CoD.CACUtility.GetUnlockablesTable( controller )
	for index, model in ipairs( unlockablesTable[weaponGroup] ) do
		local weaponIndex = Engine.GetModelValue( Engine.GetModel( model, "itemIndex" ) )
		local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
		if weaponIndex > CoD.CACUtility.EmptyItemIndex and Engine.IsItemNew( controller, weaponIndex, mode ) then
			return true
		elseif not Engine.IsItemLocked( controller, weaponIndex, mode ) and CoD.CraftUtility.Gunsmith.WeaponHasAnyNewItems( controller, weaponIndex ) then
			return true
		end
	end
	return false
end

CoD.CraftUtility.Gunsmith.GetSortedAttachmentList = function ( controller, variantModel )
	local attachment = {
		baseAttachmentList = {},
		attachmentVariantList = {}
	}
	local opticAttachmentIndex = 1
	local totalAttachments = 0
	for attachmentIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
		local attachmentIndexModel = Engine.GetModel( variantModel, "attachment" .. attachmentIndex )
		if attachmentIndexModel then
			local attachmentID = Engine.GetModelValue( attachmentIndexModel )
			if opticAttachmentIndex == attachmentIndex or attachmentID ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				table.insert( attachment.baseAttachmentList, attachmentID )
				local attachmentVariantModel = Engine.GetModel( variantModel, "attachmentVariant" .. attachmentIndex )
				if attachmentVariantModel then
					local attachmentVariantID = Engine.GetModelValue( attachmentVariantModel )
					table.insert( attachment.attachmentVariantList, attachmentVariantID )
				end
				totalAttachments = totalAttachments + 1
			end
		end
	end
	for attachmentIndex = totalAttachments + 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
		local f43_local2 = attachmentIndex
		table.insert( attachment.baseAttachmentList, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		table.insert( attachment.attachmentVariantList, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
	end
	return attachment
end

CoD.CraftUtility.Gunsmith.GetAttachmentIconList = function ( controller, dataSourceName, weaponIndex, attachmentList )
	return DataSourceHelpers.ListSetup( dataSourceName, function ( controller )
		local attachmentTable = {}
		local mode = Enum.eModes.MODE_MULTIPLAYER
		for i, attachmentTableIndex in ipairs( attachmentList ) do
			if attachmentTableIndex > CoD.CACUtility.EmptyItemIndex then
				local newAttachmentIndex = Engine.GetAttachmentIndexByAttachmentTableIndex( weaponIndex, attachmentTableIndex, mode )
				if newAttachmentIndex > CoD.CACUtility.EmptyItemIndex then
					table.insert( attachmentTable, {
						models = {
							image = Engine.GetAttachmentImage( weaponIndex, newAttachmentIndex, mode ) .. "_wv_icon"
						}
					} )
				end
			end
		end
		local wildcardCount = 0
		f45_local1 = CoD.CraftUtility.GetLoadoutSlot( controller ) == "primary"
		local gunfighterImage = "cac_mods_primary_gunfighter_wv_icon"
		if f45_local1 then
			gunfighterImage = "cac_mods_primary_gunfighter_wv_icon"
			local primaryWildcardStartIndex = 4
			for i = 0, 2, 1 do
				if attachmentList[primaryWildcardStartIndex + i] > CoD.CACUtility.EmptyItemIndex then
					wildcardCount = wildcardCount + 1
				end
			end
		else
			gunfighterImage = "cac_mods_secondary_gunfighter_wv_icon"
			local secondaryWildcardStartIndex = 3
			if attachmentList[secondaryWildcardStartIndex] > CoD.CACUtility.EmptyItemIndex then
				wildcardCount = 1
				while wildcardCount > 0 do
					table.insert( attachmentTable, {
						models = {
							image = gunfighterImage
						}
					} )
					wildcardCount = wildcardCount - 1
				end
				return attachmentTable
			end
		end
	end
	, true )
end

CoD.CraftUtility.Gunsmith.GetFileType = function ()
	local fileType = CoD.CraftUtility.Gunsmith.FileType
	if not fileType then
		fileType = Enum.StorageFileType.STORAGE_GUNSMITH
	end
	return fileType
end

CoD.CraftUtility.Gunsmith.GetTotalAllowedVaraints = function ()
	return CoD.CraftUtility.Gunsmith.TotalVariants
end

CoD.CraftUtility.Gunsmith.GetMaxVariantCount = function ( controller, fileType )
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, fileType )
	local totalVariants = 0
	if rootState ~= nil then
		local totalDDLVariants = #rootState.variant
		if CoD.CraftUtility.Gunsmith.FileType == Enum.StorageFileType.STORAGE_GUNSMITH then
			if Dvar.gunsmith_totalvariants:exists() then
				local quota = Engine.MediaManagerGetQuota( controller, "variant" )
				local variantLimit = quota.categoryQuota
				if totalDDLVariants < variantLimit then
					error( "Gunsmith DDL: DDL does not support " .. variantLimit .. " variants." )
					return 0
				end
				totalVariants = math.min( totalDDLVariants, variantLimit )
			end
		else
			totalVariants = totalDDLVariants
		end
	end
	return totalVariants
end

CoD.CraftUtility.Gunsmith.GetTotalUsedWeaponVariantsByWeaponGroup = function ( weaponGroup )
	local variantList = CoD.CraftUtility.Gunsmith.CachedVariants
	local variantCount = 0
	for index = 1, #variantList, 1 do
		if variantList[index].weaponIndex and Engine.GetWeaponGroup( variantList[index].weaponIndex, Enum.eModes.MODE_MULTIPLAYER ) == tonumber( weaponGroup ) then
			variantCount = variantCount + 1
		end
	end
	return variantCount
end

CoD.CraftUtility.Gunsmith.GetTotalUsedWeaponVariants = function ( weaponIndex )
	local variantList = CoD.CraftUtility.Gunsmith.CachedVariants
	local variantCount = 0
	for index = 1, #variantList, 1 do
		if variantList[index].weaponIndex == weaponIndex then
			variantCount = variantCount + 1
		end
	end
	return variantCount
end

CoD.CraftUtility.Gunsmith.GetTotalUsedVariants = function ()
	local variantList = CoD.CraftUtility.Gunsmith.CachedVariants
	local variantCount = 0
	for index = 1, #variantList, 1 do
		if variantList[index].weaponIndex ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
			variantCount = variantCount + 1
		end
	end
	return variantCount
end

CoD.CraftUtility.Gunsmith.ParseDDL = function ( controller, fileType )
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, fileType )
	CoD.CraftUtility.Gunsmith.FileType = fileType
	if rootState == nil then
		CoD.CraftUtility.Gunsmith.CachedVariants = {}
		return false
	end
	local totalVariants = CoD.CraftUtility.Gunsmith.GetMaxVariantCount( controller, fileType )
	CoD.CraftUtility.Gunsmith.TotalVariants = totalVariants
	for index = 0, totalVariants - 1, 1 do
		local variant = {}
		local variantState = rootState.variant[index]
		variant.weaponIndex = variantState.weaponIndex:get()
		variant.variantIndex = variantState.variantIndex:get()
		variant.sortIndex = variantState.sortIndex:get()
		variant.readOnly = variantState.readOnly:get()
		if variantState.createTime ~= nil then
			variant.createTime = Engine.GetLocalizedTimeStr( variantState.createTime:get() )
		end
		CoD.CraftUtility.Gunsmith.CachedVariants[index + 1] = variant
	end
	return true
end

CoD.CraftUtility.Gunsmith.PublishVariant = function ( controller )
	local variantModel = CoD.perController[controller].gunsmithVariantModel
	local variantIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "variantIndex" ) )
	local paintjobSlot = Engine.GetModelValue( Engine.GetModel( variantModel, "paintjobSlot" ) )
	local paintjobIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "paintjobIndex" ) )
	local weaponIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "weaponIndex" ) )
	local publishName = CoD.FileshareUtility.GetPublishName()
	local publishAllowDownload = CoD.FileshareUtility.GetPublishAllowDownload()
	Engine.PublishVariant( controller, "variant", variantIndex, paintjobSlot, paintjobIndex, weaponIndex, publishName, publishAllowDownload )
end

CoD.CraftUtility.Gunsmith.GetHighestSortIndexForWeapon = function ( weaponIndex )
	local variantList = CoD.CraftUtility.Gunsmith.CachedVariants
	local maxSortIndex = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
	for index = 1, #variantList, 1 do
		if variantList[index].weaponIndex == weaponIndex then
			local sortIndex = variantList[index].sortIndex
			if maxSortIndex < sortIndex then
				maxSortIndex = sortIndex
			end
		end
	end
	return maxSortIndex
end

CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList = function ( weaponIndex, weaponGroup )
	local variantList = CoD.CraftUtility.Gunsmith.CachedVariants
	local variantCount = 0
	local weaponVariantList = {}
	local isFreeSlotSelected = false
	for index = 1, #variantList, 1 do
		local variant = variantList[index]
		if weaponGroup then
			if not (weaponGroup ~= "" or variantList[index].weaponIndex == 0) or Engine.GetWeaponGroup( variantList[index].weaponIndex, Enum.eModes.MODE_MULTIPLAYER ) == tonumber( weaponGroup ) then
				table.insert( weaponVariantList, variant )
			end
		end
		if weaponIndex == nil and variant.weaponIndex ~= 0 then
			table.insert( weaponVariantList, variant )
		end
		if variantList[index].weaponIndex == CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX and not isFreeSlotSelected then
			variant.sortIndex = CoD.CraftUtility.Gunsmith.GetHighestSortIndexForWeapon( weaponIndex ) + 1
			isFreeSlotSelected = true
			table.insert( weaponVariantList, variant )
		end
		if variantList[index].weaponIndex == weaponIndex then
			table.insert( weaponVariantList, variant )
		end
	end
	table.sort( weaponVariantList, function ( a, b )
		return b.sortIndex < a.sortIndex
	end )
	return weaponVariantList
end

CoD.CraftUtility.Gunsmith.AreMaxVariantSlotsUsed = function ()
	local variantList = CoD.CraftUtility.Gunsmith.CachedVariants
	local maxSlotsUsed = true
	for index = 1, #variantList, 1 do
		if variantList[index].weaponIndex == CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
			maxSlotsUsed = false
			break
		end
	end
	return maxSlotsUsed
end

CoD.CraftUtility.Gunsmith.GetEmptyTable = function ( numItems )
	local result = {}
	for i = 1, numItems, 1 do
		local f58_local2 = i
		table.insert( result, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
	end
	return result
end

CoD.CraftUtility.Gunsmith.GetVariantByIndex = function ( controller, variantIndex )
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, CoD.CraftUtility.Gunsmith.GetFileType() )
	local f59_local0 = {
		attachment = CoD.CraftUtility.Gunsmith.GetEmptyTable( CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS ),
		attachmentVariant = CoD.CraftUtility.Gunsmith.GetEmptyTable( CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS ),
		variantName = "",
		camoIndex = CoD.CraftUtility.Gunsmith.CAMO_NONE,
		reticleIndex = CoD.CraftUtility.Gunsmith.RETICLE_NONE,
		paintjobSlot = Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT,
		paintjobIndex = Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX
	}
	local f59_local1 = CoD.GetCustomization( controller, "weapon_index" )
	if not f59_local1 then
		f59_local1 = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
	end
	f59_local0.weaponIndex = f59_local1
	f59_local0.variantIndex = variantIndex
	f59_local0.sortIndex = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
	if rootState ~= nil and rootState.variant ~= nil then
		local variantState = rootState.variant[variantIndex]
		f59_local0.attachment = {}
		f59_local0.attachmentVariant = {}
		f59_local0.variantName = variantState.variantName:get()
		f59_local0.camoIndex = variantState.camoIndex:get()
		f59_local0.reticleIndex = variantState.reticleIndex:get()
		f59_local0.paintjobSlot = variantState.paintjobSlot:get()
		f59_local0.paintjobIndex = variantState.paintjobIndex:get()
		f59_local0.weaponIndex = variantState.weaponIndex:get()
		f59_local0.variantIndex = variantState.variantIndex:get()
		f59_local0.sortIndex = variantState.sortIndex:get()
		f59_local0.readOnly = variantState.readOnly:get()
		f59_local0.cacVariantIndex = variantState.variantIndex:get() + 1
		if variantState.createTime ~= nil then
			f59_local0.createTime = Engine.GetLocalizedTimeStr( variantState.createTime:get() )
		end
		for attachmentIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			table.insert( f59_local0.attachment, variantState.attachment[attachmentIndex - 1]:get() )
		end
		for attachmentVariantIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			table.insert( f59_local0.attachmentVariant, variantState.attachmentVariant[attachmentVariantIndex - 1]:get() )
		end
	end
	return f59_local0
end

CoD.CraftUtility.Gunsmith.GetVariantIndexFromCACVaraintIndex = function ( controller, cacVariantIndex )
	return CoD.CraftUtility.Gunsmith.GetVariantByIndex( controller, cacVariantIndex - 1 )
end

CoD.CraftUtility.Gunsmith.IsVariantIndexOccupied = function ( variantIndex )
	if CoD.CraftUtility.Gunsmith.CachedVariants[variantIndex + 1].weaponIndex ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
		return true
	else
		return false
	end
end

CoD.CraftUtility.Gunsmith.WriteVariantAttachmentDataToDDL = function ( controller, variantModel )
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, CoD.CraftUtility.Gunsmith.GetFileType() )
	if rootState and variantModel then
		local variantIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "variantIndex" ) )
		local variantState = rootState.variant[variantIndex]
		if variantState then
			local attachmentList = CoD.CraftUtility.Gunsmith.GetSortedAttachmentList( controller, variantModel )
			for attachmentIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
				local attachmentID = attachmentList.baseAttachmentList[attachmentIndex]
				local variantAttachmentID = attachmentList.attachmentVariantList[attachmentIndex]
				if attachmentID and variantAttachmentID then
					variantState.attachment[attachmentIndex - 1]:set( attachmentID )
					variantState.attachmentVariant[attachmentIndex - 1]:set( variantAttachmentID )
				end
			end
		end
	end
end

CoD.CraftUtility.Gunsmith.WriteVaraintDataToDDL = function ( controller, variantModel )
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, CoD.CraftUtility.Gunsmith.GetFileType() )
	if rootState ~= nil and rootState.variant ~= nil then
		local variantIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "variantIndex" ) )
		local variantState = rootState.variant[variantIndex]
		variantState.variantName:set( Engine.GetModelValue( Engine.GetModel( variantModel, "variantName" ) ) )
		variantState.camoIndex:set( Engine.GetModelValue( Engine.GetModel( variantModel, "camoIndex" ) ) )
		variantState.reticleIndex:set( Engine.GetModelValue( Engine.GetModel( variantModel, "reticleIndex" ) ) )
		variantState.paintjobSlot:set( Engine.GetModelValue( Engine.GetModel( variantModel, "paintjobSlot" ) ) )
		variantState.paintjobIndex:set( Engine.GetModelValue( Engine.GetModel( variantModel, "paintjobIndex" ) ) )
		variantState.sortIndex:set( Engine.GetModelValue( Engine.GetModel( variantModel, "sortIndex" ) ) )
		variantState.createTime:set( Engine.GetCurrentUTCTimeStr() )
		local weaponIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "weaponIndex" ) )
		variantState.weaponIndex:set( weaponIndex )
		CoD.CraftUtility.Gunsmith.WriteVariantAttachmentDataToDDL( controller, variantModel )
		CoD.CraftUtility.UploadAndParseBuffer( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
	end
end

CoD.CraftUtility.Gunsmith.RenameVariant = function ( controller, variantIndex, variantName )
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, CoD.CraftUtility.Gunsmith.GetFileType() )
	if rootState ~= nil then
		local variantState = rootState.variant[variantIndex]
		variantState.variantName:set( variantName )
		CoD.CraftUtility.UploadAndParseBuffer( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
	end
end

CoD.CraftUtility.Gunsmith.ClearVariant = function ( controller, variantIndex )
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, CoD.CraftUtility.Gunsmith.GetFileType() )
	if rootState ~= nil then
		local variantState = rootState.variant[variantIndex]
		variantState.variantName:set( "" )
		variantState.variantIndex:set( variantIndex )
		variantState.camoIndex:set( CoD.CraftUtility.Gunsmith.CAMO_NONE )
		variantState.reticleIndex:set( CoD.CraftUtility.Gunsmith.RETICLE_NONE )
		variantState.paintjobSlot:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
		variantState.paintjobIndex:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
		variantState.weaponIndex:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		variantState.sortIndex:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		variantState.readOnly:set( CoD.CraftUtility.DEFAULT_READ_ONLY_FLAG )
		for attachmentIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			variantState.attachment[attachmentIndex - 1]:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		end
		for attachmentVariantIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			variantState.attachmentVariant[attachmentVariantIndex - 1]:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		end
		CoD.CraftUtility.UploadAndParseBuffer( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
	end
end

CoD.CraftUtility.Gunsmith.GetEmptyVariantIndex = function ()
	local variantList = CoD.CraftUtility.Gunsmith.CachedVariants
	for index = 1, #variantList, 1 do
		local variant = variantList[index]
		if variantList[index].weaponIndex == CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
			return variantList[index].variantIndex
		end
	end
end

CoD.CraftUtility.Gunsmith.Copy = function ( controller, variantIndex )
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, CoD.CraftUtility.Gunsmith.GetFileType() )
	local destVariantIndex = CoD.CraftUtility.Gunsmith.GetEmptyVariantIndex()
	if rootState ~= nil and destVariantIndex >= 0 then
		local fromState = rootState.variant[variantIndex]
		local toState = rootState.variant[destVariantIndex]
		toState.variantName:set( fromState.variantName:get() )
		toState.camoIndex:set( fromState.camoIndex:get() )
		toState.reticleIndex:set( fromState.reticleIndex:get() )
		toState.paintjobSlot:set( fromState.paintjobSlot:get() )
		toState.paintjobIndex:set( fromState.paintjobIndex:get() )
		toState.weaponIndex:set( fromState.weaponIndex:get() )
		for attachmentIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			toState.attachment[attachmentIndex - 1]:set( fromState.attachment[attachmentIndex - 1]:get() )
		end
		for attachmentVariantIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			toState.attachmentVariant[attachmentVariantIndex - 1]:set( fromState.attachmentVariant[attachmentVariantIndex - 1]:get() )
		end
		local sortIndex = CoD.CraftUtility.Gunsmith.GetHighestSortIndexForWeapon( fromState.weaponIndex:get() ) + 1
		toState.sortIndex:set( sortIndex )
		CoD.CraftUtility.UploadAndParseBuffer( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
		return destVariantIndex
	else
		
	end
end

CoD.CraftUtility.Gunsmith.AddAttachmentToWeapon = function ( weaponString, attachmentID )
	if attachmentID ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
		local attachmentRef = Engine.GetAttachmentRefByIndex( attachmentID )
		weaponString = weaponString .. "+" .. attachmentRef
	end
	return weaponString
end

CoD.CraftUtility.Gunsmith.AddAttachmentVariant = function ( attachmentVariantString, attachmentID, attachmentVariantID )
	if not attachmentID or not attachmentVariantID then
		return attachmentVariantString
	else
		local attachmentRef = Engine.GetAttachmentRefByIndex( attachmentID )
		if not attachmentRef then
			return attachmentVariantString
		else
			return attachmentVariantString .. attachmentRef .. "," .. attachmentVariantID .. ","
		end
	end
end

CoD.CraftUtility.Gunsmith.GetWeaponByVariantIndex = function ( controller, variantIndex )
	local variant = CoD.CraftUtility.Gunsmith.GetVariantByIndex( controller, variantIndex )
	local weaponRef = Engine.GetItemRef( variant.weaponIndex, Enum.eModes.MODE_MULTIPLAYER )
	if variant.weaponIndex == 0 then
		weaponRef = Engine.GetItemRef( CoD.GetCustomization( controller, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	end
	local weaponPlusAttachments = weaponRef .. CoD.CraftUtility.GetModeAbbreviation()
	if variant.weaponIndex ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
		for attachmentIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local attachmentID = variant.attachment[attachmentIndex]
			weaponPlusAttachments = CoD.CraftUtility.Gunsmith.AddAttachmentToWeapon( weaponPlusAttachments, attachmentID )
		end
	end
	return weaponPlusAttachments
end

CoD.CraftUtility.Gunsmith.GetAttachmentVariantByVariantIndex = function ( controller, variantIndex )
	local variant = CoD.CraftUtility.Gunsmith.GetVariantByIndex( controller, variantIndex )
	local weaponRef = Engine.GetItemRef( variant.weaponIndex, Enum.eModes.MODE_MULTIPLAYER )
	if variant.weaponIndex == 0 then
		weaponRef = Engine.GetItemRef( CoD.GetCustomization( controller, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	end
	local attachmentVariantString = ""
	if variant.weaponIndex ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
		for attachmentIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local attachmentID = variant.attachment[attachmentIndex]
			if attachmentID ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				local attachmentVariantID = variant.attachmentVariant[attachmentIndex]
				attachmentVariantString = CoD.CraftUtility.Gunsmith.AddAttachmentVariant( attachmentVariantString, attachmentID, attachmentVariantID )
			end
		end
	end
	return attachmentVariantString
end

CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant = function ( controller, variantModel )
	local weaponRef = Engine.GetItemRef( CoD.GetCustomization( controller, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	local weaponPlusAttachments = weaponRef .. CoD.CraftUtility.GetModeAbbreviation()
	if variantModel then
		for attachmentIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local attachmentModel = Engine.GetModel( variantModel, "attachment" .. attachmentIndex )
			local attachmentID = Engine.GetModelValue( attachmentModel )
			weaponPlusAttachments = CoD.CraftUtility.Gunsmith.AddAttachmentToWeapon( weaponPlusAttachments, attachmentID )
		end
	end
	return weaponPlusAttachments
end

CoD.CraftUtility.Gunsmith.GetWeaponAttachmentList = function ( controller, variantModel )
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	local weaponRef = Engine.GetItemRef( weaponIndex, Enum.eModes.MODE_MULTIPLAYER )
	local attachmentList = {}
	if variantModel then
		for attachmentIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local attachmentModel = Engine.GetModel( variantModel, "attachment" .. attachmentIndex )
			local attachmentID = Engine.GetModelValue( attachmentModel )
			if attachmentID ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				local attachmentRef = Engine.GetAttachmentRefByIndex( attachmentID )
				local attachmentIndex = Engine.GetAttachmentIndexByAttachmentTableIndex( weaponIndex, attachmentID, Enum.eModes.MODE_MULTIPLAYER )
				table.insert( attachmentList, {
					index = attachmentIndex,
					ref = attachmentRef
				} )
			end
		end
	end
	return attachmentList
end

CoD.CraftUtility.Gunsmith.GetWeaponAttachmentVariantString = function ( controller, variantModel )
	local weaponRef = Engine.GetItemRef( CoD.GetCustomization( controller, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	local attachmentVariantString = ""
	if variantModel then
		for attachmentIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local attachmentModel = Engine.GetModel( variantModel, "attachment" .. attachmentIndex )
			local attachmentID = Engine.GetModelValue( attachmentModel )
			if attachmentID ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				local attachmentVariantModel = Engine.GetModel( variantModel, "attachmentVariant" .. attachmentIndex )
				local attachmentVariantID = Engine.GetModelValue( attachmentVariantModel )
				attachmentVariantString = CoD.CraftUtility.Gunsmith.AddAttachmentVariant( attachmentVariantString, attachmentID, attachmentVariantID )
			end
		end
	end
	return attachmentVariantString
end

CoD.CraftUtility.Gunsmith.GetWeaponAttachmentStringWithoutVariants = function ( controller, variantModel )
	local weaponRef = Engine.GetItemRef( CoD.GetCustomization( controller, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	local attachmentVariantString = ""
	if variantModel then
		for attachmentIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local attachmentModel = Engine.GetModel( variantModel, "attachment" .. attachmentIndex )
			local attachmentID = Engine.GetModelValue( attachmentModel )
			if attachmentID ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				attachmentVariantString = CoD.CraftUtility.Gunsmith.AddAttachmentVariant( attachmentVariantString, attachmentID, 0 )
			end
		end
	end
	return attachmentVariantString
end

CoD.CraftUtility.Gunsmith.GetAttachmentVariantStringWithSelectedVariant = function ( controller, variantModel, selectedAttachmentID, attachmentVariantIndex )
	local weaponRef = Engine.GetItemRef( CoD.GetCustomization( controller, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	local attachmentVariantString = ""
	if variantModel then
		for attachmentIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local attachmentModel = Engine.GetModel( variantModel, "attachment" .. attachmentIndex )
			local attachmentID = Engine.GetModelValue( attachmentModel )
			if attachmentID ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				local attachmentVariantModel = Engine.GetModel( variantModel, "attachmentVariant" .. attachmentIndex )
				local attachmentVariantID = Engine.GetModelValue( attachmentVariantModel )
				if selectedAttachmentID == attachmentID then
					attachmentVariantString = CoD.CraftUtility.Gunsmith.AddAttachmentVariant( attachmentVariantString, attachmentID, attachmentVariantIndex )
				else
					attachmentVariantString = CoD.CraftUtility.Gunsmith.AddAttachmentVariant( attachmentVariantString, attachmentID, attachmentVariantID )
				end
			end
		end
	end
	return attachmentVariantString
end

CoD.CraftUtility.Gunsmith.DisplayBaseWeapon = function ( self, element, controller )
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	local isItemUnlocked = not CoD.SafeGetModelValue( element:getModel(), "isBMClassified" )
	local acvi = nil
	if isItemUnlocked and CoD.perController[controller].editingWeaponBuildKits then
		isItemUnlocked = not IsCACItemLocked( self, element, controller )
	end
	local weaponRef = Engine.GetItemRef( weaponIndex, Enum.eModes.MODE_MULTIPLAYER )
	local weapon_name = weaponRef .. CoD.CraftUtility.GetModeAbbreviation()
	local loadoutSlot = CoD.CraftUtility.GetLoadoutSlot( controller )
	local camera = CoD.CACUtility.GetCameraNameForAttachments( weapon_name )
	local weaponOptions = "0,0,0"
	Engine.SendClientScriptNotify( controller, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( controller ), {
		base_weapon_slot = loadoutSlot,
		weapon = weapon_name,
		camera = camera,
		options = weaponOptions,
		acv = acvi,
		is_item_unlocked = isItemUnlocked
	} )
end

CoD.CraftUtility.Gunsmith.DisplayWeaponWithPaintjob = function ( controller, paintjobIndex, paintjobSlot )
	local weaponRef = Engine.GetItemRef( CoD.GetCustomization( controller, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	local weapon_name = weaponRef .. CoD.CraftUtility.GetModeAbbreviation()
	local loadoutSlot = CoD.CraftUtility.GetLoadoutSlot( controller )
	local camera = CoD.CACUtility.GetCameraNameForAttachments( weapon_name )
	Engine.SetupPaintjobData( controller, paintjobSlot, paintjobIndex )
	local weaponOptions = "0,0,1"
	Engine.SendClientScriptNotify( controller, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( controller ), {
		base_weapon_slot = loadoutSlot,
		weapon = weapon_name,
		camera = camera,
		options = weaponOptions
	} )
end

CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant = function ( controller, variantModel, isGunsmithCamera, paintjobSlot, paintjobIndex, camoIndex )
	if variantModel then
		local loadoutSlot = CoD.CraftUtility.GetLoadoutSlot( controller )
		local weaponPlusAttachments = CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant( controller, variantModel )
		local camera = CoD.CACUtility.GetCameraNameForAttachments( weaponPlusAttachments, isGunsmithCamera )
		if camoIndex == nil then
			camoIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "camoIndex" ) )
		end
		if paintjobSlot == nil then
			paintjobSlot = Engine.GetModelValue( Engine.GetModel( variantModel, "paintjobSlot" ) )
		end
		if paintjobIndex == nil then
			paintjobIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "paintjobIndex" ) )
		end
		Engine.SetupPaintjobData( controller, paintjobSlot, paintjobIndex )
		local weaponOptions = camoIndex .. ",0,1"
		local attachmentVariantString = CoD.CraftUtility.Gunsmith.GetWeaponAttachmentVariantString( controller, variantModel )
		Engine.SendClientScriptNotify( controller, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( controller ), {
			base_weapon_slot = loadoutSlot,
			weapon = weaponPlusAttachments,
			camera = camera,
			options = weaponOptions,
			acv = attachmentVariantString
		} )
	end
end

CoD.CraftUtility.Gunsmith.GetVariantAttachmentList = function ( controller, variantModel )
	local attachmentList = {}
	if variantModel then
		for attachmentIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local attachmentModel = Engine.GetModel( variantModel, "attachment" .. attachmentIndex )
			local attachmentID = Engine.GetModelValue( attachmentModel )
			table.insert( attachmentList, attachmentID )
		end
	end
	return attachmentList
end

CoD.CraftUtility.Gunsmith.ClearVariantSlotByAttachmentIndex = function ( controller, variantModel, selectedAttachmentID )
	if variantModel then
		for attachmentIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local attachmentModel = Engine.GetModel( variantModel, "attachment" .. attachmentIndex )
			local attachmentID = Engine.GetModelValue( attachmentModel )
			local attachmentVariantModel = Engine.GetModel( variantModel, "attachmentVariant" .. attachmentIndex )
			if selectedAttachmentID == attachmentID then
				Engine.SetModelValue( attachmentVariantModel, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
				Engine.SetModelValue( attachmentModel, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
				if attachmentIndex == 1 then
					local reticleIndexModel = Engine.GetModel( variantModel, "reticleIndex" )
					Engine.SetModelValue( reticleIndexModel, CoD.CraftUtility.Gunsmith.RETICLE_NONE )
				end
			end
		end
	end
end

CoD.CraftUtility.Gunsmith.IsFocusAttachmentEquipped = function ( controller, variantModel, focusAttachmentID )
	if variantModel then
		for attachmentIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local attachmentModel = Engine.GetModel( variantModel, "attachment" .. attachmentIndex )
			local attachmentID = Engine.GetModelValue( attachmentModel )
			if focusAttachmentID == attachmentID then
				return true
			end
		end
	end
end

CoD.CraftUtility.Gunsmith.SetFocusAttachmentVariant = function ( controller, variantModel, focusAttachmentID, attachmentVariantID )
	if variantModel then
		for attachmentIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local attachmentModel = Engine.GetModel( variantModel, "attachment" .. attachmentIndex )
			local attachmentID = Engine.GetModelValue( attachmentModel )
			local attachmentVariantModel = Engine.GetModel( variantModel, "attachmentVariant" .. attachmentIndex )
			if focusAttachmentID == attachmentID then
				Engine.SetModelValue( attachmentVariantModel, attachmentVariantID )
			end
		end
	end
end

CoD.CraftUtility.Gunsmith.InvalidateRender = function ( controller, variantModel )
	local slot = Engine.GetModelValue( Engine.GetModel( variantModel, "paintjobSlot" ) )
	local paintjobIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "paintjobIndex" ) )
	CoD.CraftUtility.InvalidateWCItemRender( slot, paintjobIndex )
end

CoD.CraftUtility.Paintjobs = {}
CoD.CraftUtility.Paintjobs.CachedPaintjobs = {}
CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX = 0
CoD.CraftUtility.Paintjobs.GetPrevViewIndex = function ( controller )
	local groupName = CoD.CraftUtility.GetWeaponGroupName( controller )
	local totalViews = #CoD.CraftUtility.PaintshopView
	local view_index = CoD.perController[controller].viewIndex - 1
	if view_index == 0 then
		view_index = totalViews
	end
	local weaponRef = Engine.GetItemRef( CoD.GetCustomization( controller, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	if (groupName == "weapon_knife" or weaponRef == "special_crossbow") and view_index == 2 then
		view_index = view_index - 1
	end
	return view_index
end

CoD.CraftUtility.Paintjobs.GetNextViewIndex = function ( controller )
	local groupName = CoD.CraftUtility.GetWeaponGroupName( controller )
	local totalViews = #CoD.CraftUtility.PaintshopView
	local view_index = CoD.perController[controller].viewIndex % totalViews + 1
	local weaponRef = Engine.GetItemRef( CoD.GetCustomization( controller, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	if (groupName == "weapon_knife" or weaponRef == "special_crossbow") and view_index == 2 then
		view_index = view_index + 1
	end
	return view_index
end

CoD.CraftUtility.Paintjobs.GetTotalWeaponPaintjobs = function ( weaponIndex )
	local paintjobSlotList = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local paintjobCount = 0
	local slotInfo = Engine.GetPaintjobSlotInfo()
	local slotCount = slotInfo.slot_count
	local paintjobs_per_slot = slotInfo.paintjobs_per_slot
	for slot = 0, slotCount - 1, 1 do
		local paintjobsList = paintjobSlotList[slot]
		if paintjobsList then
			for paintjobIndex = 0, paintjobs_per_slot - 1, 1 do
				local paintjob = paintjobsList[paintjobIndex]
				if paintjob and paintjob.weaponIndex == weaponIndex then
					paintjobCount = paintjobCount + 1
				end
			end
		end
	end
	return paintjobCount
end

CoD.CraftUtility.Paintjobs.GetTotalWeaponPaintjobsByWeaponGroup = function ( weaponGroup )
	local paintjobSlotList = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local paintjobCount = 0
	local slotInfo = Engine.GetPaintjobSlotInfo()
	local slotCount = slotInfo.slot_count
	local paintjobs_per_slot = slotInfo.paintjobs_per_slot
	for slot = 0, slotCount - 1, 1 do
		local paintjobsList = paintjobSlotList[slot]
		if paintjobsList then
			for paintjobIndex = 0, paintjobs_per_slot - 1, 1 do
				local paintjob = paintjobsList[paintjobIndex]
				if paintjob and Engine.GetWeaponGroup( paintjob.weaponIndex, Enum.eModes.MODE_MULTIPLAYER ) == tonumber( weaponGroup ) then
					paintjobCount = paintjobCount + 1
				end
			end
		end
	end
	return paintjobCount
end

CoD.CraftUtility.Paintjobs.GetTotalUsedPaintjobs = function ()
	local paintjobSlotList = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local paintjobCount = 0
	local slotInfo = Engine.GetPaintjobSlotInfo()
	local slotCount = slotInfo.slot_count
	local paintjobs_per_slot = slotInfo.paintjobs_per_slot
	for slot = 0, slotCount - 1, 1 do
		local paintjobsList = paintjobSlotList[slot]
		if paintjobsList then
			for paintjobIndex = 0, paintjobs_per_slot - 1, 1 do
				local paintjob = paintjobsList[paintjobIndex]
				if paintjob and paintjob.weaponIndex ~= CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX then
					paintjobCount = paintjobCount + 1
				end
			end
		end
	end
	return paintjobCount
end

CoD.CraftUtility.Paintjobs.GetHighestSortIndexForWeapon = function ( weaponIndex )
	local paintjobSlotList = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local maxSortIndex = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
	local slotInfo = Engine.GetPaintjobSlotInfo()
	local slotCount = slotInfo.slot_count
	local paintjobs_per_slot = slotInfo.paintjobs_per_slot
	for slot = 0, slotCount - 1, 1 do
		local paintjobsList = paintjobSlotList[slot]
		if paintjobsList then
			for paintjobIndex = 0, paintjobs_per_slot - 1, 1 do
				local paintjob = paintjobsList[paintjobIndex]
				if paintjob and paintjob.weaponIndex == weaponIndex then
					local sortIndex = paintjob.sortIndex
					if maxSortIndex < sortIndex then
						maxSortIndex = sortIndex
					end
				end
			end
		end
	end
	return maxSortIndex
end

CoD.CraftUtility.Paintjobs.GetCACPaintjobList = function ( weaponIndex )
	local paintjobSlotList = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local weaponPaintjobList = {}
	local slotInfo = Engine.GetPaintjobSlotInfo()
	local slotCount = slotInfo.slot_count
	local paintjobs_per_slot = slotInfo.paintjobs_per_slot
	for slot = 0, slotCount - 1, 1 do
		local paintjobsList = paintjobSlotList[slot]
		if paintjobsList then
			for paintjobIndex = 0, paintjobs_per_slot - 1, 1 do
				local paintjob = paintjobsList[paintjobIndex]
				if paintjob and paintjob.weaponIndex == weaponIndex then
					table.insert( weaponPaintjobList, paintjob )
				end
			end
		end
	end
	table.sort( weaponPaintjobList, function ( a, b )
		return b.sortIndex < a.sortIndex
	end )
	return weaponPaintjobList
end

CoD.CraftUtility.Paintjobs.GetSortedWeaponPaintjobList = function ( weaponIndex, weaponGroup )
	local paintjobSlotList = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local weaponPaintjobList = {}
	local isFreePaintjobIndexSelected = false
	local slotInfo = Engine.GetPaintjobSlotInfo()
	local slotCount = slotInfo.slot_count
	local paintjobs_per_slot = slotInfo.paintjobs_per_slot
	for slot = 0, slotCount - 1, 1 do
		local paintjobsList = paintjobSlotList[slot]
		if paintjobsList then
			for paintjobIndex = 0, paintjobs_per_slot - 1, 1 do
				local paintjob = paintjobsList[paintjobIndex]
				if paintjob then
					if weaponGroup then
						if not (weaponGroup ~= "" or paintjob.weaponIndex == CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX) or Engine.GetWeaponGroup( paintjob.weaponIndex, Enum.eModes.MODE_MULTIPLAYER ) == tonumber( weaponGroup ) then
							table.insert( weaponPaintjobList, paintjob )
						end
					end
					if weaponIndex == nil and paintjob.weaponIndex ~= 0 then
						table.insert( weaponPaintjobList, paintjob )
					end
					if paintjob.weaponIndex == CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX and not isFreePaintjobIndexSelected then
						paintjob.sortIndex = CoD.CraftUtility.Paintjobs.GetHighestSortIndexForWeapon( weaponIndex ) + 1
						isFreePaintjobIndexSelected = true
						table.insert( weaponPaintjobList, paintjob )
					end
					if paintjob.weaponIndex == weaponIndex then
						table.insert( weaponPaintjobList, paintjob )
					end
				end
			end
		end
	end
	table.sort( weaponPaintjobList, function ( a, b )
		return b.sortIndex < a.sortIndex
	end )
	return weaponPaintjobList
end

CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs = function ( controller )
	local quota = Engine.MediaManagerGetQuota( controller, "paintjob" )
	return quota.categoryQuota
end

CoD.CraftUtility.Paintjobs.IsPaintjobIndexOccupied = function ( slot, index )
	local paintjob = CoD.CraftUtility.Paintjobs.CachedPaintjobs[slot][index]
	if paintjob.weaponIndex ~= CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX then
		return true
	else
		return false
	end
end

CoD.CraftUtility.Paintjobs.ParseDDL = function ( controller, fileType )
	local slotInfo = Engine.GetPaintjobSlotInfo()
	local slotCount = slotInfo.slot_count
	local paintjobs_per_slot = slotInfo.paintjobs_per_slot
	local total_paintjobs = CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs( controller )
	if slotCount * paintjobs_per_slot < total_paintjobs then
		error( "Paintjob DDL: DDL does not support " .. total_paintjobs .. " paintjobs." )
		return false
	end
	for slot = 0, slotCount - 1, 1 do
		local rootState = CoD.CraftUtility.GetDDLRoot( controller, fileType, slot )
		CoD.CraftUtility.Paintjobs.CachedPaintjobs[slot] = {}
		if rootState == nil then
			CoD.CraftUtility.Paintjobs.CachedPaintjobs = {}
			return false
		end
		for paintjobIndex = 0, paintjobs_per_slot - 1, 1 do
			local total_paintjobs_cached = slot * paintjobs_per_slot + paintjobIndex
			if total_paintjobs <= total_paintjobs_cached then
				return true
			end
			local paintjob = {}
			local paintjobState = rootState.weaponPaintjob[paintjobIndex]
			paintjob.weaponIndex = paintjobState.weaponIndex:get()
			paintjob.sortIndex = paintjobState.sortIndex:get()
			paintjob.paintjobName = paintjobState.paintjobName:get()
			paintjob.paintjobSlot = slot
			paintjob.paintjobIndex = paintjobIndex
			paintjob.readOnly = paintjobState.readOnly:get()
			if paintjobState.createTime ~= nil then
				paintjob.createTime = Engine.GetLocalizedTimeStr( paintjobState.createTime:get() )
			end
			CoD.CraftUtility.Paintjobs.CachedPaintjobs[slot][paintjobIndex] = paintjob
		end
	end
	return true
end

CoD.CraftUtility.Paintjobs.InvalidateRender = function ( controller, paintjobModel )
	local slot = Engine.GetModelValue( Engine.GetModel( paintjobModel, "paintjobSlot" ) )
	local paintjobIndex = Engine.GetModelValue( Engine.GetModel( paintjobModel, "paintjobIndex" ) )
	CoD.CraftUtility.InvalidateWCItemRender( slot, paintjobIndex )
end

CoD.CraftUtility.Paintjobs.UploadPaintjob = function ( controller, paintjobModel )
	local slot = Engine.GetModelValue( Engine.GetModel( paintjobModel, "paintjobSlot" ) )
	local paintjobIndex = Engine.GetModelValue( Engine.GetModel( paintjobModel, "paintjobIndex" ) )
	local weaponIndex = Engine.GetModelValue( Engine.GetModel( paintjobModel, "weaponIndex" ) )
	local sortIndex = Engine.GetModelValue( Engine.GetModel( paintjobModel, "sortIndex" ) )
	local paintjobName = Engine.GetModelValue( Engine.GetModel( paintjobModel, "paintjobName" ) )
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, Enum.StorageFileType.STORAGE_PAINTJOBS, slot )
	if rootState ~= nil then
		local weaponPaintjobState = rootState.weaponPaintjob[paintjobIndex]
		weaponPaintjobState.weaponIndex:set( weaponIndex )
		weaponPaintjobState.sortIndex:set( sortIndex )
		weaponPaintjobState.paintjobName:set( paintjobName )
		weaponPaintjobState.createTime:set( Engine.GetCurrentUTCTimeStr() )
		Engine.UploadPaintjobData( controller, slot, paintjobIndex )
	end
end

CoD.CraftUtility.Paintjobs.GetEmptyPaintjob = function ( weaponIndex )
	local paintjobSlotList = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local slotInfo = Engine.GetPaintjobSlotInfo()
	local slotCount = slotInfo.slot_count
	local paintjobs_per_slot = slotInfo.paintjobs_per_slot
	for slot = 0, slotCount - 1, 1 do
		local paintjobsList = paintjobSlotList[slot]
		if paintjobsList then
			for paintjobIndex = 0, paintjobs_per_slot - 1, 1 do
				local paintjob = paintjobsList[paintjobIndex]
				if paintjob.weaponIndex == CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX then
					paintjob.sortIndex = CoD.CraftUtility.Paintjobs.GetHighestSortIndexForWeapon( weaponIndex ) + 1
					return paintjob
				end
			end
		end
	end
end

CoD.CraftUtility.Paintjobs.Copy = function ( controller, paintjobModel )
	local slot = Engine.GetModelValue( Engine.GetModel( paintjobModel, "paintjobSlot" ) )
	local weaponIndex = Engine.GetModelValue( Engine.GetModel( paintjobModel, "weaponIndex" ) )
	local paintjobName = Engine.GetModelValue( Engine.GetModel( paintjobModel, "paintjobName" ) )
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, Enum.StorageFileType.STORAGE_PAINTJOBS, slot )
	local emptyPaintjob = CoD.CraftUtility.Paintjobs.GetEmptyPaintjob( weaponIndex )
	if rootState ~= nil and emptyPaintjob ~= nil then
		local emptyPaintjobRootState = CoD.CraftUtility.GetDDLRoot( controller, Enum.StorageFileType.STORAGE_PAINTJOBS, emptyPaintjob.paintjobSlot )
		if emptyPaintjobRootState ~= nil then
			local weaponPaintjobState = emptyPaintjobRootState.weaponPaintjob[emptyPaintjob.paintjobIndex]
			weaponPaintjobState.weaponIndex:set( weaponIndex )
			weaponPaintjobState.sortIndex:set( emptyPaintjob.sortIndex )
			weaponPaintjobState.paintjobName:set( paintjobName )
			Engine.UploadPaintjobData( controller, emptyPaintjob.paintjobSlot, emptyPaintjob.paintjobIndex )
			return emptyPaintjob.paintjobSlot, emptyPaintjob.paintjobIndex
		end
	end
end

CoD.CraftUtility.Paintjobs.RemovePaintJobFromLoadout = function ( controller, paintjobSlot, paintjobIndex, loadoutType, sessionMode )
	local f102_local0 = Engine.StorageGetBuffer( controller, loadoutType )
	local cacRoot = f102_local0.cacloadouts
	local classCount = Engine.GetCustomClassCount( controller, sessionMode )
	for classIndex = 0, classCount - 1, 1 do
		local primaryPaintJobSlot = cacRoot.customclass[classIndex].primarypaintjobslot:get()
		local primaryPaintjobIndex = cacRoot.customclass[classIndex].primarypaintjobindex:get()
		local secondaryPaintjobIndex = cacRoot.customclass[classIndex].secondarypaintjobindex:get()
		local secondaryPaintjobSlot = cacRoot.customclass[classIndex].secondarypaintjobslot:get()
		if primaryPaintJobSlot == paintjobSlot and primaryPaintjobIndex == paintjobIndex then
			cacRoot.customclass[classIndex].primarypaintjobslot:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
			cacRoot.customclass[classIndex].primarypaintjobindex:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
		end
		if secondaryPaintjobSlot == paintjobSlot and secondaryPaintjobIndex == paintjobIndex then
			cacRoot.customclass[classIndex].secondarypaintjobslot:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
			cacRoot.customclass[classIndex].secondarypaintjobindex:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
		end
	end
end

CoD.CraftUtility.Paintjobs.RemovePaintJobFromVariantList = function ( ddlRoot, variantMax, paintjobSlot, paintjobIndex )
	for variantIndex = 0, variantMax - 1, 1 do
		local variantPaintjobSlot = ddlRoot.variant[variantIndex].paintjobSlot:get()
		local variantPaintjobIndex = ddlRoot.variant[variantIndex].paintjobIndex:get()
		if variantPaintjobSlot == paintjobSlot and variantPaintjobIndex == paintjobIndex then
			ddlRoot.variant[variantIndex].paintjobSlot:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
			ddlRoot.variant[variantIndex].paintjobIndex:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
		end
	end
end

CoD.CraftUtility.Paintjobs.RemovePaintJobFromZM = function ( controller, paintjobSlot, paintjobIndex )
	local f104_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_ZM_LOADOUTS )
	local cacRoot = f104_local0.cacloadouts
	CoD.CraftUtility.Paintjobs.RemovePaintJobFromVariantList( cacRoot, #cacRoot.variant, paintjobSlot, paintjobIndex )
end

CoD.CraftUtility.Paintjobs.RemovePaintJobFromAllLoadouts = function ( controller, paintjobSlot, paintjobIndex )
	CoD.CraftUtility.Paintjobs.RemovePaintJobFromLoadout( controller, paintjobSlot, paintjobIndex, Enum.StorageFileType.STORAGE_CP_LOADOUTS, Enum.eModes.MODE_CAMPAIGN )
	CoD.CraftUtility.Paintjobs.RemovePaintJobFromLoadout( controller, paintjobSlot, paintjobIndex, Enum.StorageFileType.STORAGE_MP_LOADOUTS, Enum.eModes.MODE_MULTIPLAYER )
	CoD.CraftUtility.Paintjobs.RemovePaintJobFromZM( controller, paintjobSlot, paintjobIndex )
end

CoD.CraftUtility.Paintjobs.RemovePaintJobFromGunsmith = function ( controller, paintjobSlot, paintjobIndex )
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
	local variantCount = CoD.CraftUtility.Gunsmith.GetMaxVariantCount( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
	CoD.CraftUtility.Paintjobs.RemovePaintJobFromVariantList( rootState, variantCount, paintjobSlot, paintjobIndex )
end

CoD.CraftUtility.Paintjobs.ClearPaintjob = function ( controller, paintjobSlot, paintjobIndex )
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, Enum.StorageFileType.STORAGE_PAINTJOBS, paintjobSlot )
	if rootState ~= nil then
		local weaponPaintjobState = rootState.weaponPaintjob[paintjobIndex]
		weaponPaintjobState.paintjobName:set( "" )
		weaponPaintjobState.sortIndex:set( CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX )
		weaponPaintjobState.weaponIndex:set( CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX )
		weaponPaintjobState.readOnly:set( CoD.CraftUtility.DEFAULT_READ_ONLY_FLAG )
		Engine.ClearPaintjobLayerData()
		Engine.UploadPaintjobData( controller, paintjobSlot, paintjobIndex )
		CoD.CraftUtility.Paintjobs.RemovePaintJobFromAllLoadouts( controller, paintjobSlot, paintjobIndex )
		CoD.CraftUtility.Paintjobs.RemovePaintJobFromGunsmith( controller, paintjobSlot, paintjobIndex )
	end
end

CoD.CraftUtility.Paintjobs.GetPaintjobName = function ( controller, paintjobSlot, paintjobIndex )
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, Enum.StorageFileType.STORAGE_PAINTJOBS, paintjobSlot )
	if rootState ~= nil then
		local weaponPaintjobState = rootState.weaponPaintjob[paintjobIndex]
		return weaponPaintjobState.paintjobName:get()
	else
		return ""
	end
end

CoD.CraftUtility.Paintjobs.RenamePaintjob = function ( controller, paintjobSlot, paintjobIndex, paintjobName )
	local fileType = Enum.StorageFileType.STORAGE_PAINTJOBS
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, fileType, paintjobSlot )
	if rootState ~= nil then
		local weaponPaintjobState = rootState.weaponPaintjob[paintjobIndex]
		weaponPaintjobState.paintjobName:set( paintjobName )
		CoD.CraftUtility.UploadAndParseBuffer( controller, fileType, paintjobSlot )
	end
end

CoD.CraftUtility.Paintjobs.PublishPaintjob = function ( controller )
	local paintjobModel = CoD.perController[controller].selectedpaintjobModel
	local paintjobSlot = Engine.GetModelValue( Engine.GetModel( paintjobModel, "paintjobSlot" ) )
	local paintjobIndex = Engine.GetModelValue( Engine.GetModel( paintjobModel, "paintjobIndex" ) )
	local fileType = Enum.StorageFileType.STORAGE_PAINTJOBS
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, fileType, paintjobSlot )
	if rootState ~= nil then
		local weaponPaintjobState = rootState.weaponPaintjob[paintjobIndex]
		local weaponIndex = weaponPaintjobState.weaponIndex:get()
		local publishName = CoD.FileshareUtility.GetPublishName()
		local publishAllowDownload = CoD.FileshareUtility.GetPublishAllowDownload()
		Engine.PublishPaintjob( controller, "paintjob", paintjobSlot, paintjobIndex, weaponIndex, publishName, publishAllowDownload )
	end
end

CoD.CraftUtility.Paintjobs.GetPaintjobWeaponIndex = function ( controller, paintjobSlot, paintjobIndex )
	local paintjobSlotList = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local paintjobsList = paintjobSlotList[tonumber( paintjobSlot )]
	if paintjobsList then
		local paintjob = paintjobsList[tonumber( paintjobIndex )]
		if paintjob then
			return paintjob.weaponIndex
		end
	end
	return CoD.GetCustomization( controller, "weapon_index" )
end

CoD.CraftUtility.Emblems = {}
CoD.CraftUtility.Emblems.CachedEmblems = {}
CoD.CraftUtility.Emblems.INVALID_DEFAULT_EMBLEMINDEX = -1
CoD.CraftUtility.Emblems.INVALID_EMBLEMINDEX = -1
CoD.CraftUtility.Emblems.CATEGORYTAB = {
	{
		type = "custom",
		displayName = "MENU_EMBLEM_CUSTOM_TAB",
		category = 1,
		storageType = Enum.StorageFileType.STORAGE_EMBLEMS
	},
	{
		type = "prebuilt",
		displayName = "MENU_EMBLEM_PREBUILT_TAB",
		category = 2,
		storageType = Enum.StorageFileType.STORAGE_DEFAULT_EMBLEMS
	},
	{
		type = "loot",
		displayName = "MENU_BLACK_MARKET",
		category = 3,
		storageType = Enum.StorageFileType.STORAGE_EMBLEMS_LOOT
	}
}
CoD.CraftUtility.Emblems.GetHighestSortIndex = function ()
	local cachedEmblemList = CoD.CraftUtility.Emblems.CachedEmblems
	local maxSortIndex = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
	for index = 1, #cachedEmblemList, 1 do
		local emblem = cachedEmblemList[index]
		local sortIndex = emblem.sortIndex
		if maxSortIndex < sortIndex then
			maxSortIndex = sortIndex
		end
	end
	return maxSortIndex
end

CoD.CraftUtility.Emblems.GetSortedEmblemsList = function ( controller, storageFileType )
	local cachedEmblemList = CoD.CraftUtility.Emblems.CachedEmblems
	local sortedEmblemList = {}
	local isFreeEmblemSelected = false
	for index = 1, #cachedEmblemList, 1 do
		local emblem = cachedEmblemList[index]
		if emblem.isUsed == 0 and not isFreeEmblemSelected and storageFileType == Enum.StorageFileType.STORAGE_EMBLEMS and not SelectingGroupEmblem( controller ) then
			emblem.sortIndex = CoD.CraftUtility.Emblems.GetHighestSortIndex() + 1
			isFreeEmblemSelected = true
			table.insert( sortedEmblemList, emblem )
		end
		if emblem.isUsed == 1 then
			local isBlackMarketUnreleased = false
			if storageFileType ~= Enum.StorageFileType.STORAGE_EMBLEMS_LOOT or not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( CoD.BlackMarketUtility.GetLootEmblemIDName( emblem.emblemIndex ) ) then
				table.insert( sortedEmblemList, emblem )
			end
		end
	end
	table.sort( sortedEmblemList, function ( a, b )
		return b.sortIndex < a.sortIndex
	end )
	return sortedEmblemList
end

CoD.CraftUtility.Emblems.GetTotalUsedEmblems = function ( controller, fileType )
	local totalEmblems = CoD.CraftUtility.Emblems.GetTotalAllowedEmblems( controller, fileType )
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, fileType )
	local emblemCount = 0
	for index = 0, totalEmblems, 1 do
		local emblemState = rootState.emblemList[index]
		local f115_local2 = emblemState
		local isUsed = emblemState.isUsed:get()
		if (f115_local2 and isUsed) == 1 then
			emblemCount = emblemCount + 1
		end
	end
	return emblemCount
end

CoD.CraftUtility.Emblems.GetTotalAllowedEmblems = function ( controller, fileType )
	if fileType == Enum.StorageFileType.STORAGE_DEFAULT_EMBLEMS then
		return Dvar.default_emblems_max_count:get()
	elseif fileType == Enum.StorageFileType.STORAGE_EMBLEMS_LOOT then
		return Dvar.loot_emblems_max_count:get()
	else
		local quota = Engine.MediaManagerGetQuota( controller, "emblem" )
		return quota.categoryQuota
	end
end

CoD.CraftUtility.Emblems.GetEmblemName = function ( controller, emblemName, fileType )
	if fileType ~= Enum.StorageFileType.STORAGE_EMBLEMS then
		return Engine.Localize( "EM_" .. emblemName )
	else
		return emblemName
	end
end

CoD.CraftUtility.Emblems.ParseDDL = function ( controller, fileType )
	local totalEmblems = CoD.CraftUtility.Emblems.GetTotalAllowedEmblems( controller, fileType )
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, fileType )
	if rootState == nil then
		CoD.CraftUtility.Emblems.CachedEmblems = {}
		return false
	elseif #rootState.emblemList < totalEmblems then
		error( "Emblems DDL: DDL does not support " .. totalEmblems .. " emblems." )
		return false
	end
	for index = 0, totalEmblems, 1 do
		local emblem = {}
		local emblemState = rootState.emblemList[index]
		emblem.emblemIndex = index
		emblem.isUsed = emblemState.isUsed:get()
		emblem.sortIndex = emblemState.sortIndex:get()
		emblem.readOnly = emblemState.readOnly:get()
		emblem.emblemName = CoD.CraftUtility.Emblems.GetEmblemName( controller, emblemState.emblemName:get(), fileType )
		if emblemState.createTime ~= nil then
			emblem.createTime = Engine.GetLocalizedTimeStr( emblemState.createTime:get() )
		end
		CoD.CraftUtility.Emblems.CachedEmblems[index + 1] = emblem
	end
	return true
end

CoD.CraftUtility.Emblems.IsEmblemIndexOccupied = function ( emblemIndex )
	local cachedEmblemList = CoD.CraftUtility.Emblems.CachedEmblems
	for index = 1, #cachedEmblemList, 1 do
		local emblem = cachedEmblemList[index]
		if emblem.emblemIndex == emblemIndex then
			return emblem.isUsed == 1
		end
	end
	return false
end

CoD.CraftUtility.Emblems.UploadEmblem = function ( controller, emblemModel )
	local emblemIndex = Engine.GetModelValue( Engine.GetModel( emblemModel, "emblemIndex" ) )
	local sortIndex = Engine.GetModelValue( Engine.GetModel( emblemModel, "sortIndex" ) )
	local emblemName = Engine.GetModelValue( Engine.GetModel( emblemModel, "emblemName" ) )
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, CoD.perController[controller].selectedEmblemTabStorageType )
	if rootState ~= nil and emblemIndex >= 0 then
		local emblemState = rootState.emblemList[emblemIndex]
		emblemState.isUsed:set( 1 )
		emblemState.sortIndex:set( sortIndex )
		emblemState.emblemName:set( emblemName )
		emblemState.createTime:set( Engine.GetCurrentUTCTimeStr() )
		Engine.UploadEmblemData( controller, emblemIndex )
	end
end

CoD.CraftUtility.Emblems.RenameEmblem = function ( controller, emblemIndex, emblemName )
	local fileType = CoD.perController[controller].selectedEmblemTabStorageType
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, fileType )
	if rootState ~= nil and emblemIndex >= 0 then
		local emblemState = rootState.emblemList[emblemIndex]
		emblemState.emblemName:set( emblemName )
		CoD.CraftUtility.UploadAndParseBuffer( controller, fileType )
	end
end

CoD.CraftUtility.Emblems.ClearEmblem = function ( controller, emblemIndex )
	local fileType = CoD.perController[controller].selectedEmblemTabStorageType
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, fileType )
	local customizationType = Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM
	if rootState ~= nil and emblemIndex >= 0 then
		local emblemState = rootState.emblemList[emblemIndex]
		emblemState.emblemName:set( "" )
		emblemState.isUsed:set( 0 )
		emblemState.sortIndex:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		emblemState.readOnly:set( CoD.CraftUtility.DEFAULT_READ_ONLY_FLAG )
		Engine.ExecNow( controller, "emblemClearAll " .. customizationType )
	end
end

CoD.CraftUtility.Emblems.GetEmptyEmblem = function ()
	local cachedEmblemList = CoD.CraftUtility.Emblems.CachedEmblems
	for index = 1, #cachedEmblemList, 1 do
		local emblem = cachedEmblemList[index]
		if emblem.isUsed == 0 then
			emblem.sortIndex = CoD.CraftUtility.Emblems.GetHighestSortIndex() + 1
			return emblem
		end
	end
end

CoD.CraftUtility.Emblems.Copy = function ( controller, emblemModel, storageFileType )
	local emblemIndex = Engine.GetModelValue( Engine.GetModel( emblemModel, "emblemIndex" ) )
	local sortIndex = Engine.GetModelValue( Engine.GetModel( emblemModel, "sortIndex" ) )
	local emblemName = Engine.GetModelValue( Engine.GetModel( emblemModel, "emblemName" ) )
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, storageFileType )
	local destEmblem = CoD.CraftUtility.Emblems.GetEmptyEmblem()
	if rootState ~= nil and emblemIndex >= 0 and destEmblem and destEmblem.emblemIndex >= 0 then
		local destEmblemState = rootState.emblemList[destEmblem.emblemIndex]
		destEmblemState.isUsed:set( 1 )
		destEmblemState.sortIndex:set( destEmblem.sortIndex )
		destEmblemState.emblemName:set( emblemName )
		Engine.UploadEmblemData( controller, destEmblem.emblemIndex )
		return destEmblem.emblemIndex
	else
		
	end
end

CoD.CraftUtility.Emblems.PublishEmblem = function ( controller )
	local selectedEmblemModel = CoD.perController[controller].selectedEmblemModel
	local emblemIndex = Engine.GetModelValue( Engine.GetModel( selectedEmblemModel, "emblemIndex" ) )
	local publishName = CoD.FileshareUtility.GetPublishName()
	local publishAllowDownload = CoD.FileshareUtility.GetPublishAllowDownload()
	if emblemIndex >= 0 then
		Engine.PublishEmblem( controller, "emblem", emblemIndex - 1, publishName, publishAllowDownload )
	end
end

CoD.CraftUtility.Emblems.FileshareBreadcrumbPaths = {
	[Enum.StorageFileType.STORAGE_EMBLEMS_LOOT] = "blackMarket"
}
CoD.CraftUtility.Emblems.GetEmblemBreadcrumbRoot = function ( controller, emblemIndex, fileshareType )
	local ddlPath = CoD.CraftUtility.Emblems.FileshareBreadcrumbPaths[fileshareType]
	if ddlPath then
		local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		if stats then
			return stats.emblemBreadcrumbs[ddlPath].markedOld[emblemIndex]
		end
	end
	return nil
end

CoD.CraftUtility.Emblems.IsEmblemNew = function ( controller, emblemIndex, fileshareType )
	local crumbRoot = CoD.CraftUtility.Emblems.GetEmblemBreadcrumbRoot( controller, emblemIndex, fileshareType )
	if crumbRoot then
		return crumbRoot:get() == 0
	else
		return false
	end
end

CoD.CraftUtility.Emblems.IsAnyEmblemNew = function ( controller )
	if IsLive() then
		for fileshareType, _ in pairs( CoD.CraftUtility.Emblems.FileshareBreadcrumbPaths ) do
			local emblemCount = CoD.CraftUtility.Emblems.GetTotalUsedEmblems( controller, fileshareType )
			for f128_local3 = 0, emblemCount - 1, 1 do
				local isBMClassified = false
				if fileshareType == Enum.StorageFileType.STORAGE_EMBLEMS_LOOT then
					local emblemName = CoD.BlackMarketUtility.GetLootEmblemIDName( f128_local3 )
					isBMClassified = CoD.BlackMarketUtility.IsItemLocked( controller, emblemName )
				end
				if not isBMClassified and CoD.CraftUtility.Emblems.IsEmblemNew( controller, f128_local3, fileshareType ) then
					return true
				end
			end
		end
	end
	return false
end

CoD.CraftUtility.Emblems.GetEmblemMaterialBreadcrumbRoot = function ( controller, materialIndex )
	local stats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if stats then
		return stats.emblemStats.materials[materialIndex].markedOld
	else
		
	end
end

CoD.CraftUtility.Emblems.IsMaterialNew = function ( controller, materialIndex )
	local crumbRoot = CoD.CraftUtility.Emblems.GetEmblemMaterialBreadcrumbRoot( controller, materialIndex )
	if crumbRoot then
		return crumbRoot:get() == 0
	else
		return false
	end
end

CoD.CraftUtility.Fileshare.DisplayWeaponWithPaintjob = function ( controller, weaponId, fileId, fullView )
	if weaponId == 0 then
		CoD.CraftUtility.Fileshare.ClearDisplay( controller )
		return 
	else
		Engine.SetupFilesharePaintjobData( controller, fileId )
		local weaponRef = Engine.GetItemRef( weaponId )
		local weapon_name = weaponRef .. CoD.CraftUtility.GetModeAbbreviation()
		local loadoutSlot = CoD.CraftUtility.GetLoadoutSlot( controller )
		local camera = CoD.CACUtility.GetCameraNameForAttachments( "", fullView == true )
		local weaponOptions = "0,0,1"
		Engine.SendClientScriptNotify( controller, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( controller ), {
			base_weapon_slot = loadoutSlot,
			weapon = weapon_name,
			camera = camera,
			options = weaponOptions
		} )
	end
end

CoD.CraftUtility.Fileshare.DisplayWeaponVariants = function ( controller, weaponId, fileId, fullView )
	if weaponId == 0 then
		CoD.CraftUtility.Fileshare.ClearDisplay( controller )
		return 
	else
		Engine.SetupFilesharePaintjobData( controller, fileId )
		local variant = Engine.GetFileshareWeaponVariantData( controller, fileId )
		local weaponRef = Engine.GetItemRef( weaponId )
		local weapon_name = weaponRef .. CoD.CraftUtility.GetModeAbbreviation()
		local camoIndex = variant.camoIndex
		local loadoutSlot = CoD.CraftUtility.GetLoadoutSlot( controller )
		local weaponPlusAttachments = weaponRef .. CoD.CraftUtility.GetModeAbbreviation() .. CoD.CraftUtility.Fileshare.GetWeaponsAttachmentsString( variant )
		local attachmentVariantString = CoD.CraftUtility.Fileshare.GetWeaponAttachmentVariantString( variant )
		local camera = CoD.CACUtility.GetCameraNameForAttachments( weaponPlusAttachments, fullView == true )
		local weaponOptions = camoIndex .. ",0,1"
		Engine.SendClientScriptNotify( controller, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( controller ), {
			base_weapon_slot = loadoutSlot,
			weapon = weaponPlusAttachments,
			camera = camera,
			options = weaponOptions,
			acv = attachmentVariantString
		} )
	end
end

CoD.CraftUtility.Fileshare.GetWeaponsAttachmentsString = function ( variant )
	local weaponAttachments = ""
	for attachmentIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
		local attachmentID = variant.attachments[attachmentIndex - 1]
		if attachmentID ~= nil then
			weaponAttachments = CoD.CraftUtility.Gunsmith.AddAttachmentToWeapon( weaponAttachments, attachmentID )
		end
	end
	return weaponAttachments
end

CoD.CraftUtility.Fileshare.GetWeaponAttachmentVariantString = function ( variant )
	local attachmentVariantString = ""
	for attachmentIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
		local attachmentID = variant.attachments[attachmentIndex - 1]
		if attachmentID ~= nil and attachmentID ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
			local attachmentVariantID = variant.attachmentVariants[attachmentIndex - 1]
			attachmentVariantString = CoD.CraftUtility.Gunsmith.AddAttachmentVariant( attachmentVariantString, attachmentID, attachmentVariantID )
		end
	end
	return attachmentVariantString
end

CoD.CraftUtility.Fileshare.ClearDisplay = function ( controller )
	Engine.SendClientScriptNotify( controller, "CustomClass_remove" .. CoD.GetLocalClientAdjustedNum( controller ), {} )
end

CoD.CraftUtility.Fileshare.DisplayWeaponWithPaintjobUsingModel = function ( controller, paintjobModel )
	local customizationType = CoD.CraftUtility.PaintshopView[CoD.perController[controller].viewIndex].customization_type
	local paintjobSlot = Engine.GetModelValue( Engine.GetModel( paintjobModel, "paintjobSlot" ) )
	local paintjobIndex = Engine.GetModelValue( Engine.GetModel( paintjobModel, "paintjobIndex" ) )
	local weaponId = Engine.GetModelValue( Engine.GetModel( paintjobModel, "weaponIndex" ) )
	local weaponRef = Engine.GetItemRef( weaponId )
	local weapon_name = weaponRef .. CoD.CraftUtility.GetModeAbbreviation()
	local loadoutSlot = CoD.CraftUtility.GetLoadoutSlot( controller )
	local camera = CoD.CACUtility.GetCameraNameForAttachments( weapon_name )
	Engine.SetupPaintjobData( controller, paintjobSlot, paintjobIndex )
	local weaponOptions = "0,0,1"
	Engine.SendClientScriptNotify( controller, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( controller ), {
		base_weapon_slot = loadoutSlot,
		weapon = weapon_name,
		camera = camera,
		options = weaponOptions
	} )
end

CoD.CraftUtility.Fileshare.DisplayWeaponWithVariant = function ( controller, variantModel, isGunsmithCamera, paintjobSlot, paintjobIndex, camoIndex )
	if variantModel then
		local loadoutSlot = CoD.CraftUtility.GetLoadoutSlot( controller )
		local weaponId = Engine.GetModelValue( Engine.GetModel( variantModel, "weaponIndex" ) )
		local weaponRef = Engine.GetItemRef( weaponId )
		local weaponPlusAttachments = weaponRef .. CoD.CraftUtility.GetModeAbbreviation()
		for attachmentIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local attachmentModel = Engine.GetModel( variantModel, "attachment" .. attachmentIndex )
			local attachmentID = Engine.GetModelValue( attachmentModel )
			weaponPlusAttachments = CoD.CraftUtility.Gunsmith.AddAttachmentToWeapon( weaponPlusAttachments, attachmentID )
		end
		local camera = CoD.CACUtility.GetCameraNameForAttachments( weaponPlusAttachments, isGunsmithCamera )
		if camoIndex == nil then
			camoIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "camoIndex" ) )
		end
		if paintjobSlot == nil then
			paintjobSlot = Engine.GetModelValue( Engine.GetModel( variantModel, "paintjobSlot" ) )
		end
		if paintjobIndex == nil then
			paintjobIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "paintjobIndex" ) )
		end
		Engine.SetupPaintjobData( controller, paintjobSlot, paintjobIndex )
		local weaponOptions = camoIndex .. ",0,1"
		local attachmentVariantString = CoD.CraftUtility.Gunsmith.GetWeaponAttachmentVariantString( controller, variantModel )
		Engine.SendClientScriptNotify( controller, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( controller ), {
			base_weapon_slot = loadoutSlot,
			weapon = weaponPlusAttachments,
			camera = camera,
			options = weaponOptions,
			acv = attachmentVariantString
		} )
	end
end

