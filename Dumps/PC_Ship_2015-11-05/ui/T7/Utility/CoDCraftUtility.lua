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
CoD.CraftUtility.InvalidateWCItemRender = function ( f1_arg0, f1_arg1 )
	Engine.InvalidateWCItemRender( f1_arg0, f1_arg1 )
end

CoD.CraftUtility.GetUsedSlotsByFileType = function ( f2_arg0, f2_arg1 )
	local f2_local0 = 0
	if f2_arg1 == Enum.StorageFileType.STORAGE_PAINTJOBS then
		f2_local0 = CoD.CraftUtility.Paintjobs.GetTotalUsedPaintjobs()
	elseif f2_arg1 == Enum.StorageFileType.STORAGE_GUNSMITH then
		f2_local0 = CoD.CraftUtility.Gunsmith.GetTotalUsedVariants()
	elseif f2_arg1 == Enum.StorageFileType.STORAGE_EMBLEMS then
		f2_local0 = CoD.CraftUtility.Emblems.GetTotalUsedEmblems( f2_arg0, f2_arg1 )
	end
	return f2_local0
end

CoD.CraftUtility.GetTotalAllowedSlotsByFileType = function ( f3_arg0, f3_arg1 )
	local f3_local0 = 0
	if f3_arg1 == Enum.StorageFileType.STORAGE_PAINTJOBS then
		f3_local0 = CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs( f3_arg0 )
	elseif f3_arg1 == Enum.StorageFileType.STORAGE_GUNSMITH then
		f3_local0 = CoD.CraftUtility.Gunsmith.GetTotalAllowedVaraints()
	elseif f3_arg1 == Enum.StorageFileType.STORAGE_EMBLEMS then
		f3_local0 = CoD.CraftUtility.Emblems.GetTotalAllowedEmblems( f3_arg0, f3_arg1 )
	end
	return f3_local0
end

CoD.CraftUtility.GetGridTypeName = function ( f4_arg0 )
	local f4_local0 = "paintshop_grid_size"
	if not IsPaintshop( f4_arg0 ) then
		f4_local0 = "emblem_grid_size"
	end
	return f4_local0
end

CoD.CraftUtility.GetGridSize = function ( f5_arg0 )
	local f5_local0 = CoD.CraftUtility.PAINTSHOP_GRIDSIZE
	if not IsPaintshop( f5_arg0 ) then
		f5_local0 = CoD.CraftUtility.EMBLEM_GRIDSIZE
	end
	return f5_local0
end

CoD.CraftUtility.GetDDLRoot = function ( f6_arg0, f6_arg1, f6_arg2 )
	if f6_arg1 == "cacRoot" then
		return Engine.GetCACRoot( f6_arg0 )
	elseif f6_arg2 ~= nil then
		return Engine.StorageGetBuffer( f6_arg0, f6_arg1, f6_arg2 )
	else
		return Engine.StorageGetBuffer( f6_arg0, f6_arg1 )
	end
end

CoD.CraftUtility.UploadBuffer = function ( f7_arg0, f7_arg1, f7_arg2 )
	if f7_arg1 == Enum.StorageFileType.STORAGE_GUNSMITH then
		f7_arg1 = CoD.CraftUtility.Gunsmith.GetFileType()
	end
	if f7_arg1 == "cacRoot" then
		Engine.Exec( f7_arg0, "saveLoadout" )
	elseif f7_arg2 ~= nil then
		Engine.StorageWrite( f7_arg0, f7_arg1, f7_arg2 )
	else
		Engine.StorageWrite( f7_arg0, f7_arg1 )
	end
end

CoD.CraftUtility.UploadAndParseBuffer = function ( f8_arg0, f8_arg1, f8_arg2 )
	CoD.CraftUtility.UploadBuffer( f8_arg0, f8_arg1, f8_arg2 )
	if f8_arg1 == Enum.StorageFileType.STORAGE_GUNSMITH then
		CoD.CraftUtility.Gunsmith.ParseDDL( f8_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	elseif f8_arg1 == Enum.StorageFileType.STORAGE_EMBLEMS then
		CoD.CraftUtility.Emblems.ParseDDL( f8_arg0, f8_arg1 )
	elseif f8_arg1 == Enum.StorageFileType.STORAGE_PAINTJOBS then
		CoD.CraftUtility.Paintjobs.ParseDDL( f8_arg0, f8_arg1 )
	end
	MediaManagerMarkDirty( f8_arg0 )
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

CoD.CraftUtility.GetLoadoutSlot = function ( f11_arg0 )
	local f11_local0
	if CoD.GetCustomization( f11_arg0, "category_index" ) ~= nil then
		f11_local0 = CoD.GetCustomization( f11_arg0, "category_index" ) - 1
	else
		f11_local0 = 1
	end
	return CoD.Craft.WeaponGroupNames[f11_local0].loadout_slot
end

CoD.CraftUtility.DisplayWeaponInPaintshop = function ( f12_arg0, f12_arg1 )
	Engine.SendClientScriptNotify( f12_arg0, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f12_arg0 ), CoD.CraftUtility.GetLoadoutSlot( f12_arg0 ), Engine.GetItemRef( CoD.GetCustomization( f12_arg0, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER ) .. CoD.CraftUtility.GetModeAbbreviation(), f12_arg1, "0,0,1" )
end

CoD.CraftUtility.PaintjobClear = function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3, f13_arg4 )
	CoD.OverlayUtility.CreateOverlay( f13_arg2, f13_arg4, "PaintjobClearConfirmationOverlay" )
end

CoD.CraftUtility.PaintjobRename = function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3, f14_arg4 )
	ShowKeyboard( f14_arg4, f14_arg1, f14_arg2, "KEYBOARD_TYPE_PAINTJOB" )
end

CoD.CraftUtility.OpenPublishPromptPaintjob = function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3, f15_arg4 )
	local f15_local0 = CoD.perController[f15_arg2].selectedpaintjobModel
	local f15_local1 = Engine.GetModelValue( Engine.GetModel( f15_local0, "paintjobSlot" ) )
	local f15_local2 = Engine.GetModelValue( Engine.GetModel( f15_local0, "paintjobIndex" ) )
	local f15_local3 = CoD.CraftUtility.GetDDLRoot( f15_arg2, Enum.StorageFileType.STORAGE_PAINTJOBS, f15_local1 )
	local f15_local4 = ""
	if f15_local3 ~= nil then
		local f15_local5 = f15_local3.weaponPaintjob[f15_local2].paintjobName:get()
		if f15_local5 ~= nil then
			f15_local4 = f15_local5
		end
	end
	CoD.FileshareUtility.OpenPublishPrompt( f15_arg4, f15_arg2, "paintjob", f15_local4, CoD.CraftUtility.Paintjobs.PublishPaintjob )
end

CoD.CraftUtility.GunsmithClear = function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3, f16_arg4 )
	CoD.OverlayUtility.CreateOverlay( f16_arg2, f16_arg4, "GunsmithClearConfirmationOverlay" )
end

CoD.CraftUtility.GunsmithRename = function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3, f17_arg4 )
	ShowKeyboard( f17_arg4, f17_arg1, f17_arg2, "KEYBOARD_TYPE_GUNSMITH" )
end

CoD.CraftUtility.OpenPublishPromptGunsmith = function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3, f18_arg4 )
	CoD.FileshareUtility.OpenPublishPrompt( f18_arg4, f18_arg2, "variant", Engine.GetModelValue( Engine.GetModel( CoD.perController[f18_arg2].gunsmithVariantModel, "variantName" ) ), CoD.CraftUtility.Gunsmith.PublishVariant )
end

CoD.CraftUtility.EmblemClear = function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3, f19_arg4 )
	local f19_local0 = CoD.OverlayUtility.CreateOverlay( f19_arg2, f19_arg4, "EmblemClearConfirmationOverlay" )
end

CoD.CraftUtility.EmblemRename = function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3, f20_arg4 )
	ShowKeyboard( f20_arg4, f20_arg1, f20_arg2, "KEYBOARD_TYPE_EMBLEMS" )
end

CoD.CraftUtility.OpenPublishPromptEmblem = function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3, f21_arg4 )
	if CheckIfFeatureIsBanned( f21_arg2 + 1, LuaEnums.FEATURE_BAN.USER_GENERATED_CONTENT ) then
		LuaUtils.UI_ShowErrorMessageDialog( f21_arg2, GetFeatureBanInfo( f21_arg2 + 1, LuaEnums.FEATURE_BAN.USER_GENERATED_CONTENT ) )
		return 
	else
		CoD.FileshareUtility.OpenPublishPrompt( f21_arg4, f21_arg2, "emblem", Engine.GetModelValue( Engine.GetModel( CoD.perController[f21_arg2].selectedEmblemModel, "emblemName" ) ), CoD.CraftUtility.Emblems.PublishEmblem )
	end
end

CoD.CraftUtility.GetWeaponGroupName = function ( f22_arg0 )
	local f22_local0 = CoD.GetCustomization( f22_arg0, "weapon_index" )
	local f22_local1 = ""
	if f22_local0 then
		f22_local1 = Engine.GetItemGroup( f22_local0, Enum.eModes.MODE_MULTIPLAYER )
	end
	return f22_local1
end

CoD.CraftUtility.Gunsmith.IsCurrentVariantChanged = function ( f23_arg0, f23_arg1 )
	if f23_arg1 then
		local f23_local0 = Engine.GetModel( f23_arg1, "variantIndex" )
		if f23_local0 then
			local f23_local1 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f23_arg0, Engine.GetModelValue( f23_local0 ) )
			for f23_local2 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
				if f23_local1.attachment[f23_local2] ~= Engine.GetModelValue( Engine.GetModel( f23_arg1, "attachment" .. f23_local2 ) ) then
					return true
				end
			end
		end
	end
	return false
end

CoD.CraftUtility.Gunsmith.ClearVariantStatType = function ( f24_arg0, f24_arg1 )
	local f24_local0 = f24_arg0.stats[f24_arg1]
	if f24_local0 then
		f24_local0:set( 0 )
	end
end

CoD.CraftUtility.Gunsmith.ClearVariantStats = function ( f25_arg0, f25_arg1, f25_arg2 )
	local f25_local0 = f25_arg1 + 1
	local f25_local1 = CoD.CraftUtility.Gunsmith.GetStatsStorageType( f25_arg2 )
	local f25_local2 = CoD.CraftUtility.GetDDLRoot( f25_arg0, f25_local1 )
	local f25_local3 = f25_local2.VariantStats[f25_local0]
	if f25_local2 and f25_local3 then
		CoD.CraftUtility.Gunsmith.ClearVariantStatType( f25_local3, "kills" )
		CoD.CraftUtility.Gunsmith.ClearVariantStatType( f25_local3, "deaths" )
		CoD.CraftUtility.Gunsmith.ClearVariantStatType( f25_local3, "deathsDuringUse" )
		CoD.CraftUtility.Gunsmith.ClearVariantStatType( f25_local3, "shots" )
		CoD.CraftUtility.Gunsmith.ClearVariantStatType( f25_local3, "hits" )
		CoD.CraftUtility.Gunsmith.ClearVariantStatType( f25_local3, "headshots" )
		CoD.CraftUtility.Gunsmith.ClearVariantStatType( f25_local3, "destroyed" )
		CoD.CraftUtility.Gunsmith.ClearVariantStatType( f25_local3, "backstabber_kill" )
		Engine.StorageWrite( f25_arg0, f25_local1 )
	end
end

CoD.CraftUtility.Gunsmith.GetStatsStorageType = function ( f26_arg0 )
	if f26_arg0 == Enum.eModes.MODE_CAMPAIGN then
		return Enum.StorageFileType.STORAGE_CP_STATS_ONLINE
	else
		return Enum.StorageFileType.STORAGE_MP_STATS_ONLINE
	end
end

CoD.CraftUtility.Gunsmith.GetSnapshotSessionMode = function ()
	local f27_local0 = Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.SessionMode" )
	local f27_local1 = Enum.eModes.MODE_MULTIPLAYER
	if f27_local0 then
		f27_local1 = Engine.GetModelValue( f27_local0 )
	end
	return f27_local1
end

CoD.CraftUtility.Gunsmith.GetRatio = function ( f28_arg0, f28_arg1 )
	local f28_local0 = f28_arg0
	if f28_arg1 ~= 0 then
		f28_local0 = f28_arg0 / f28_arg1
	end
	return f28_local0
end

CoD.CraftUtility.Gunsmith.GetVariantStatValue = function ( f29_arg0, f29_arg1 )
	local f29_local0 = f29_arg0.stats[f29_arg1]
	local f29_local1 = 0
	if f29_local0 then
		f29_local1 = f29_local0:get()
	end
	return f29_local1
end

CoD.CraftUtility.Gunsmith.GetWeaponStatValue = function ( f30_arg0, f30_arg1 )
	local f30_local0 = f30_arg0.stats[f30_arg1]
	local f30_local1 = 0
	if f30_local0 then
		local f30_local2 = f30_local0.statValue
		if f30_local2 then
			f30_local1 = f30_local2:get()
		end
	end
	return f30_local1
end

CoD.CraftUtility.Gunsmith.GetVariantStats = function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3 )
	local f31_local0 = CoD.CraftUtility.GetDDLRoot( f31_arg0, CoD.CraftUtility.Gunsmith.GetStatsStorageType( f31_arg3 ) )
	local f31_local1 = f31_local0.VariantStats[f31_arg2]
	if f31_local0 and f31_local1 then
		if f31_arg1 == "accuracy" then
			return GunsmithAccuracyPercentage( CoD.CraftUtility.Gunsmith.GetRatio( CoD.CraftUtility.Gunsmith.GetVariantStatValue( f31_local1, "hits" ), CoD.CraftUtility.Gunsmith.GetVariantStatValue( f31_local1, "shots" ) ) )
		elseif f31_arg1 == "kd" then
			return CoD.CraftUtility.Gunsmith.GetRatio( CoD.CraftUtility.Gunsmith.GetVariantStatValue( f31_local1, "kills" ), CoD.CraftUtility.Gunsmith.GetVariantStatValue( f31_local1, "deathsDuringUse" ) )
		else
			return CoD.CraftUtility.Gunsmith.GetVariantStatValue( f31_local1, f31_arg1 )
		end
	else
		return 0
	end
end

CoD.CraftUtility.Gunsmith.GetWeaponStats = function ( f32_arg0, f32_arg1, f32_arg2, f32_arg3 )
	local f32_local0 = CoD.CraftUtility.GetDDLRoot( f32_arg0, CoD.CraftUtility.Gunsmith.GetStatsStorageType( f32_arg3 ) )
	local f32_local1 = f32_local0.ItemStats[f32_arg2]
	if f32_local0 and f32_local1 then
		if f32_arg1 == "accuracy" then
			return GunsmithAccuracyPercentage( CoD.CraftUtility.Gunsmith.GetRatio( CoD.CraftUtility.Gunsmith.GetWeaponStatValue( f32_local1, "hits" ), CoD.CraftUtility.Gunsmith.GetWeaponStatValue( f32_local1, "shots" ) ) )
		elseif f32_arg1 == "kd" then
			return CoD.CraftUtility.Gunsmith.GetRatio( CoD.CraftUtility.Gunsmith.GetWeaponStatValue( f32_local1, "kills" ), CoD.CraftUtility.Gunsmith.GetWeaponStatValue( f32_local1, "deathsDuringUse" ) )
		elseif f32_arg1 == "backstabber_kill" then
			return 0
		else
			return CoD.CraftUtility.Gunsmith.GetWeaponStatValue( f32_local1, f32_arg1 )
		end
	else
		
	end
end

CoD.CraftUtility.Gunsmith.GetWeaponStatList = function ( f33_arg0, f33_arg1, f33_arg2 )
	local f33_local0 = {}
	local f33_local1 = Engine.GetItemRef( f33_arg1, f33_arg2 )
	if f33_local1 == "launcher_lockonly" then
		f33_local0 = {
			"destroyed"
		}
	elseif f33_local1 == "launcher_standard" then
		f33_local0 = {
			"kills",
			"destroyed"
		}
	elseif f33_local1 == "knife_loadout" then
		f33_local0 = {
			"kills",
			"backstabber_kill",
			"kd"
		}
	else
		f33_local0 = {
			"kills",
			"headshots",
			"accuracy"
		}
		if f33_arg2 == Enum.eModes.MODE_MULTIPLAYER then
			table.insert( f33_local0, "kd" )
		end
	end
	return f33_local0
end

CoD.CraftUtility.Gunsmith.GetWeaponStatHeader = function ( f34_arg0 )
	if f34_arg0 == "kills" then
		return "MENU_GUNSMITH_KILLS_CAPS"
	elseif f34_arg0 == "headshots" then
		return "MENU_GUNSMITH_HEADSHOTS_CAPS"
	elseif f34_arg0 == "accuracy" then
		return "MENU_GUNSMITH_ACCURACY_CAPS"
	elseif f34_arg0 == "kd" then
		return "MENU_GUNSMITH_KD_CAPS"
	elseif f34_arg0 == "destroyed" then
		return "MENU_GUNSMITH_VEHICLES_DESTROYED_CAPS"
	elseif f34_arg0 == "backstabber_kill" then
		return "MENU_GUNSMITH_BACKSTABS_CAPS"
	else
		return "MENU_GUNSMITH_UNKNOWN_CAPS"
	end
end

CoD.CraftUtility.Gunsmith.WeaponHasNewOptics = function ( f35_arg0, f35_arg1 )
	if not IsProgressionEnabled( f35_arg0 ) then
		return false
	else
		return Engine.AreAnyOpticsNew( f35_arg0, f35_arg1 )
	end
end

CoD.CraftUtility.Gunsmith.WeaponHasNewNonOpticAttachments = function ( f36_arg0, f36_arg1 )
	if not IsProgressionEnabled( f36_arg0 ) then
		return false
	else
		return Engine.AreAnyNonOpticAttachmentsNew( f36_arg0, f36_arg1 )
	end
end

CoD.CraftUtility.Gunsmith.WeaponHasNewCamos = function ( f37_arg0, f37_arg1 )
	if not IsProgressionEnabled( f37_arg0 ) then
		return false
	end
	for f37_local0 = 0, Engine.GetWeaponOptionsCount(), 1 do
		if Engine.GetWeaponOptionGroupName( f37_local0 ) == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO and Engine.IsWeaponOptionNew( f37_arg0, f37_arg1, f37_local0 ) then
			return true
		end
	end
end

CoD.CraftUtility.Gunsmith.WeaponHasAnyNewItems = function ( f38_arg0, f38_arg1 )
	if not IsProgressionEnabled( f38_arg0 ) then
		return false
	end
	local f38_local0 = CoD.CraftUtility.Gunsmith.WeaponHasNewOptics( f38_arg0, f38_arg1 )
	if not f38_local0 then
		f38_local0 = CoD.CraftUtility.Gunsmith.WeaponHasNewNonOpticAttachments( f38_arg0, f38_arg1 )
		if not f38_local0 then
			f38_local0 = CoD.CraftUtility.Gunsmith.WeaponHasNewCamos( f38_arg0, f38_arg1 )
		end
	end
	return f38_local0
end

CoD.CraftUtility.Gunsmith.GetBreadcrumbCountForWeaponGroup = function ( f39_arg0, f39_arg1 )
	if not IsProgressionEnabled( f39_arg0 ) then
		return 0
	end
	local f39_local0 = 0
	local f39_local1 = CoD.GetUnlockablesTable( f39_arg0 )
	for f39_local5, f39_local6 in ipairs( f39_local1[f39_arg1] ) do
		local f39_local7 = Engine.GetModelValue( Engine.GetModel( f39_local6, "itemIndex" ) )
		local f39_local8 = CoD.PrestigeUtility.GetPermanentUnlockMode()
		if f39_local7 > CoD.CACUtility.EmptyItemIndex and Engine.IsItemNew( f39_arg0, f39_local7, f39_local8 ) then
			f39_local0 = f39_local0 + 1
		end
		if not Engine.IsItemLocked( f39_arg0, f39_local7, f39_local8 ) and CoD.CraftUtility.Gunsmith.WeaponHasAnyNewItems( f39_arg0, f39_local7 ) then
			f39_local0 = f39_local0 + 1
		end
	end
	return f39_local0
end

CoD.CraftUtility.Gunsmith.AnyNewWeaponsOrAttachmentsForGroup = function ( f40_arg0, f40_arg1 )
	if not IsProgressionEnabled( f40_arg0 ) then
		return false
	end
	local f40_local0 = CoD.GetUnlockablesTable( f40_arg0 )
	for f40_local4, f40_local5 in ipairs( f40_local0[f40_arg1] ) do
		local f40_local6 = Engine.GetModelValue( Engine.GetModel( f40_local5, "itemIndex" ) )
		local f40_local7 = CoD.PrestigeUtility.GetPermanentUnlockMode()
		if f40_local6 > CoD.CACUtility.EmptyItemIndex and Engine.IsItemNew( f40_arg0, f40_local6, f40_local7 ) then
			return true
		elseif not Engine.IsItemLocked( f40_arg0, f40_local6, f40_local7 ) and CoD.CraftUtility.Gunsmith.WeaponHasAnyNewItems( f40_arg0, f40_local6 ) then
			return true
		end
	end
	return false
end

CoD.CraftUtility.Gunsmith.GetSortedAttachmentList = function ( f41_arg0, f41_arg1 )
	local f41_local0 = {
		baseAttachmentList = {},
		attachmentVariantList = {}
	}
	local f41_local1 = 1
	local f41_local2 = 0
	for f41_local3 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
		local f41_local6 = Engine.GetModel( f41_arg1, "attachment" .. f41_local3 )
		if f41_local6 then
			local f41_local7 = Engine.GetModelValue( f41_local6 )
			if f41_local1 == f41_local3 or f41_local7 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				table.insert( f41_local0.baseAttachmentList, f41_local7 )
				local f41_local8 = Engine.GetModel( f41_arg1, "attachmentVariant" .. f41_local3 )
				if f41_local8 then
					table.insert( f41_local0.attachmentVariantList, Engine.GetModelValue( f41_local8 ) )
				end
				f41_local2 = f41_local2 + 1
			end
		end
	end
	for f41_local3 = f41_local2 + 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
		local f41_local9 = f41_local3
		table.insert( f41_local0.baseAttachmentList, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		table.insert( f41_local0.attachmentVariantList, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
	end
	return f41_local0
end

CoD.CraftUtility.Gunsmith.GetAttachmentIconList = function ( f42_arg0, f42_arg1, f42_arg2, f42_arg3 )
	return DataSourceHelpers.ListSetup( f42_arg1, function ( f43_arg0 )
		local f43_local0 = {}
		local f43_local1 = Enum.eModes.MODE_MULTIPLAYER
		for f43_local6, f43_local7 in ipairs( f42_arg3 ) do
			if f43_local7 > CoD.CACUtility.EmptyItemIndex then
				local f43_local5 = Engine.GetAttachmentIndexByAttachmentTableIndex( f42_arg2, f43_local7, f43_local1 )
				if f43_local5 > CoD.CACUtility.EmptyItemIndex then
					table.insert( f43_local0, {
						models = {
							image = Engine.GetAttachmentImage( f42_arg2, f43_local5, f43_local1 ) .. "_wv_icon"
						}
					} )
				end
			end
		end
		f43_local2 = 0
		f43_local3 = CoD.CraftUtility.GetLoadoutSlot( f43_arg0 ) == "primary"
		f43_local4 = "cac_mods_primary_gunfighter_wv_icon"
		if f43_local3 then
			f43_local4 = "cac_mods_primary_gunfighter_wv_icon"
			f43_local6 = 4
			for f43_local7 = 0, 2, 1 do
				if f42_arg3[f43_local6 + f43_local7] > CoD.CACUtility.EmptyItemIndex then
					f43_local2 = f43_local2 + 1
				end
			end
		else
			f43_local4 = "cac_mods_secondary_gunfighter_wv_icon"
			if f42_arg3[3] > CoD.CACUtility.EmptyItemIndex then
				f43_local2 = 1
				while f43_local2 > 0 do
					table.insert( f43_local0, {
						models = {
							image = f43_local4
						}
					} )
					f43_local2 = f43_local2 - 1
				end
				return f43_local0
			end
		end
	end
	, true )
end

CoD.CraftUtility.Gunsmith.GetFileType = function ()
	local f44_local0 = CoD.CraftUtility.Gunsmith.FileType
	if not f44_local0 then
		f44_local0 = Enum.StorageFileType.STORAGE_GUNSMITH
	end
	return f44_local0
end

CoD.CraftUtility.Gunsmith.GetTotalAllowedVaraints = function ()
	return CoD.CraftUtility.Gunsmith.TotalVariants
end

CoD.CraftUtility.Gunsmith.GetMaxVariantCount = function ( f46_arg0, f46_arg1 )
	local f46_local0 = CoD.CraftUtility.GetDDLRoot( f46_arg0, f46_arg1 )
	local f46_local1 = 0
	if f46_local0 ~= nil then
		local f46_local2 = #f46_local0.variant
		if CoD.CraftUtility.Gunsmith.FileType == Enum.StorageFileType.STORAGE_GUNSMITH then
			if Dvar.gunsmith_totalvariants:exists() then
				local f46_local3 = Engine.MediaManagerGetQuota( f46_arg0, "variant" )
				local f46_local4 = f46_local3.categoryQuota
				if f46_local2 < f46_local4 then
					error( "Gunsmith DDL: DDL does not support " .. f46_local4 .. " variants." )
					return 0
				end
				f46_local1 = math.min( f46_local2, f46_local4 )
			end
		else
			f46_local1 = f46_local2
		end
	end
	return f46_local1
end

CoD.CraftUtility.Gunsmith.GetTotalUsedWeaponVariants = function ( f47_arg0 )
	local f47_local0 = CoD.CraftUtility.Gunsmith.CachedVariants
	local f47_local1 = 0
	for f47_local2 = 1, #f47_local0, 1 do
		if f47_local0[f47_local2].weaponIndex == f47_arg0 then
			f47_local1 = f47_local1 + 1
		end
	end
	return f47_local1
end

CoD.CraftUtility.Gunsmith.GetTotalUsedVariants = function ()
	local f48_local0 = CoD.CraftUtility.Gunsmith.CachedVariants
	local f48_local1 = 0
	for f48_local2 = 1, #f48_local0, 1 do
		if f48_local0[f48_local2].weaponIndex ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
			f48_local1 = f48_local1 + 1
		end
	end
	return f48_local1
end

CoD.CraftUtility.Gunsmith.ParseDDL = function ( f49_arg0, f49_arg1 )
	local f49_local0 = CoD.CraftUtility.GetDDLRoot( f49_arg0, f49_arg1 )
	CoD.CraftUtility.Gunsmith.FileType = f49_arg1
	if f49_local0 == nil then
		CoD.CraftUtility.Gunsmith.CachedVariants = {}
		return false
	end
	local f49_local1 = CoD.CraftUtility.Gunsmith.GetMaxVariantCount( f49_arg0, f49_arg1 )
	CoD.CraftUtility.Gunsmith.TotalVariants = f49_local1
	for f49_local2 = 0, f49_local1 - 1, 1 do
		local f49_local5 = {}
		local f49_local6 = f49_local0.variant[f49_local2]
		f49_local5.weaponIndex = f49_local6.weaponIndex:get()
		f49_local5.variantIndex = f49_local6.variantIndex:get()
		f49_local5.sortIndex = f49_local6.sortIndex:get()
		f49_local5.readOnly = f49_local6.readOnly:get()
		if f49_local6.createTime ~= nil then
			f49_local5.createTime = Engine.GetLocalizedTimeStr( f49_local6.createTime:get() )
		end
		CoD.CraftUtility.Gunsmith.CachedVariants[f49_local2 + 1] = f49_local5
	end
	return true
end

CoD.CraftUtility.Gunsmith.PublishVariant = function ( f50_arg0 )
	local f50_local0 = CoD.perController[f50_arg0].gunsmithVariantModel
	Engine.PublishVariant( f50_arg0, "variant", Engine.GetModelValue( Engine.GetModel( f50_local0, "variantIndex" ) ), Engine.GetModelValue( Engine.GetModel( f50_local0, "paintjobSlot" ) ), Engine.GetModelValue( Engine.GetModel( f50_local0, "paintjobIndex" ) ), Engine.GetModelValue( Engine.GetModel( f50_local0, "weaponIndex" ) ), CoD.FileshareUtility.GetPublishName(), CoD.FileshareUtility.GetPublishAllowDownload() )
end

CoD.CraftUtility.Gunsmith.GetHighestSortIndexForWeapon = function ( f51_arg0 )
	local f51_local0 = CoD.CraftUtility.Gunsmith.CachedVariants
	local f51_local1 = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
	for f51_local2 = 1, #f51_local0, 1 do
		if f51_local0[f51_local2].weaponIndex == f51_arg0 then
			local f51_local5 = f51_local0[f51_local2].sortIndex
			if f51_local1 < f51_local5 then
				f51_local1 = f51_local5
			end
		end
	end
	return f51_local1
end

CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList = function ( f52_arg0 )
	local f52_local0 = CoD.CraftUtility.Gunsmith.CachedVariants
	local f52_local1 = 0
	local f52_local2 = {}
	local f52_local3 = false
	for f52_local4 = 1, #f52_local0, 1 do
		local f52_local7 = f52_local0[f52_local4]
		if f52_arg0 == nil and f52_local7.weaponIndex ~= 0 then
			table.insert( f52_local2, f52_local7 )
		end
		if f52_local0[f52_local4].weaponIndex == CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX and not f52_local3 then
			f52_local7.sortIndex = CoD.CraftUtility.Gunsmith.GetHighestSortIndexForWeapon( f52_arg0 ) + 1
			f52_local3 = true
			table.insert( f52_local2, f52_local7 )
		end
		if f52_local0[f52_local4].weaponIndex == f52_arg0 then
			table.insert( f52_local2, f52_local7 )
		end
	end
	table.sort( f52_local2, function ( f53_arg0, f53_arg1 )
		return f53_arg1.sortIndex < f53_arg0.sortIndex
	end )
	return f52_local2
end

CoD.CraftUtility.Gunsmith.AreMaxVariantSlotsUsed = function ()
	local f54_local0 = CoD.CraftUtility.Gunsmith.CachedVariants
	local f54_local1 = true
	for f54_local2 = 1, #f54_local0, 1 do
		if f54_local0[f54_local2].weaponIndex == CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
			f54_local1 = false
			break
		end
	end
	return f54_local1
end

CoD.CraftUtility.Gunsmith.GetVariantByIndex = function ( f55_arg0, f55_arg1 )
	local f55_local0 = CoD.CraftUtility.GetDDLRoot( f55_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	if f55_local0 ~= nil then
		local f55_local1 = f55_local0.variant[f55_arg1]
		local f55_local2 = {
			attachment = {},
			attachmentVariant = {},
			variantName = f55_local1.variantName:get(),
			camoIndex = f55_local1.camoIndex:get(),
			reticleIndex = f55_local1.reticleIndex:get(),
			paintjobSlot = f55_local1.paintjobSlot:get(),
			paintjobIndex = f55_local1.paintjobIndex:get(),
			weaponIndex = f55_local1.weaponIndex:get(),
			variantIndex = f55_local1.variantIndex:get(),
			sortIndex = f55_local1.sortIndex:get(),
			readOnly = f55_local1.readOnly:get(),
			cacVariantIndex = f55_local1.variantIndex:get() + 1
		}
		if f55_local1.createTime ~= nil then
			f55_local2.createTime = Engine.GetLocalizedTimeStr( f55_local1.createTime:get() )
		end
		for f55_local3 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			table.insert( f55_local2.attachment, f55_local1.attachment[f55_local3 - 1]:get() )
		end
		for f55_local3 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			table.insert( f55_local2.attachmentVariant, f55_local1.attachmentVariant[f55_local3 - 1]:get() )
		end
		return f55_local2
	else
		
	end
end

CoD.CraftUtility.Gunsmith.GetVariantIndexFromCACVaraintIndex = function ( f56_arg0, f56_arg1 )
	return CoD.CraftUtility.Gunsmith.GetVariantByIndex( f56_arg0, f56_arg1 - 1 )
end

CoD.CraftUtility.Gunsmith.IsVariantIndexOccupied = function ( f57_arg0 )
	if CoD.CraftUtility.Gunsmith.CachedVariants[f57_arg0 + 1].weaponIndex ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
		return true
	else
		return false
	end
end

CoD.CraftUtility.Gunsmith.WriteVariantAttachmentDataToDDL = function ( f58_arg0, f58_arg1 )
	local f58_local0 = CoD.CraftUtility.GetDDLRoot( f58_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	if f58_local0 and f58_arg1 then
		local f58_local1 = f58_local0.variant[Engine.GetModelValue( Engine.GetModel( f58_arg1, "variantIndex" ) )]
		if f58_local1 then
			local f58_local2 = CoD.CraftUtility.Gunsmith.GetSortedAttachmentList( f58_arg0, f58_arg1 )
			for f58_local3 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
				local f58_local6 = f58_local2.baseAttachmentList[f58_local3]
				local f58_local7 = f58_local2.attachmentVariantList[f58_local3]
				if f58_local6 and f58_local7 then
					f58_local1.attachment[f58_local3 - 1]:set( f58_local6 )
					f58_local1.attachmentVariant[f58_local3 - 1]:set( f58_local7 )
				end
			end
		end
	end
end

CoD.CraftUtility.Gunsmith.WriteVaraintDataToDDL = function ( f59_arg0, f59_arg1 )
	local f59_local0 = CoD.CraftUtility.GetDDLRoot( f59_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	if f59_local0 ~= nil then
		local f59_local1 = f59_local0.variant[Engine.GetModelValue( Engine.GetModel( f59_arg1, "variantIndex" ) )]
		f59_local1.variantName:set( Engine.GetModelValue( Engine.GetModel( f59_arg1, "variantName" ) ) )
		f59_local1.camoIndex:set( Engine.GetModelValue( Engine.GetModel( f59_arg1, "camoIndex" ) ) )
		f59_local1.reticleIndex:set( Engine.GetModelValue( Engine.GetModel( f59_arg1, "reticleIndex" ) ) )
		f59_local1.paintjobSlot:set( Engine.GetModelValue( Engine.GetModel( f59_arg1, "paintjobSlot" ) ) )
		f59_local1.paintjobIndex:set( Engine.GetModelValue( Engine.GetModel( f59_arg1, "paintjobIndex" ) ) )
		f59_local1.sortIndex:set( Engine.GetModelValue( Engine.GetModel( f59_arg1, "sortIndex" ) ) )
		f59_local1.createTime:set( Engine.GetCurrentUTCTimeStr() )
		f59_local1.weaponIndex:set( Engine.GetModelValue( Engine.GetModel( f59_arg1, "weaponIndex" ) ) )
		CoD.CraftUtility.Gunsmith.WriteVariantAttachmentDataToDDL( f59_arg0, f59_arg1 )
		CoD.CraftUtility.UploadAndParseBuffer( f59_arg0, Enum.StorageFileType.STORAGE_GUNSMITH )
	end
end

CoD.CraftUtility.Gunsmith.RenameVariant = function ( f60_arg0, f60_arg1, f60_arg2 )
	local f60_local0 = CoD.CraftUtility.GetDDLRoot( f60_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	if f60_local0 ~= nil then
		f60_local0.variant[f60_arg1].variantName:set( f60_arg2 )
		CoD.CraftUtility.UploadAndParseBuffer( f60_arg0, Enum.StorageFileType.STORAGE_GUNSMITH )
	end
end

CoD.CraftUtility.Gunsmith.ClearVariant = function ( f61_arg0, f61_arg1 )
	local f61_local0 = CoD.CraftUtility.GetDDLRoot( f61_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	if f61_local0 ~= nil then
		local f61_local1 = f61_local0.variant[f61_arg1]
		f61_local1.variantName:set( "" )
		f61_local1.variantIndex:set( f61_arg1 )
		f61_local1.camoIndex:set( CoD.CraftUtility.Gunsmith.CAMO_NONE )
		f61_local1.reticleIndex:set( CoD.CraftUtility.Gunsmith.RETICLE_NONE )
		f61_local1.paintjobSlot:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
		f61_local1.paintjobIndex:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
		f61_local1.weaponIndex:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		f61_local1.sortIndex:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		for f61_local2 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			f61_local1.attachment[f61_local2 - 1]:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		end
		for f61_local2 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			f61_local1.attachmentVariant[f61_local2 - 1]:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		end
		CoD.CraftUtility.UploadAndParseBuffer( f61_arg0, Enum.StorageFileType.STORAGE_GUNSMITH )
	end
end

CoD.CraftUtility.Gunsmith.GetEmptyVariantIndex = function ()
	local f62_local0 = CoD.CraftUtility.Gunsmith.CachedVariants
	for f62_local1 = 1, #f62_local0, 1 do
		local f62_local4 = f62_local0[f62_local1]
		if f62_local0[f62_local1].weaponIndex == CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
			return f62_local0[f62_local1].variantIndex
		end
	end
end

CoD.CraftUtility.Gunsmith.Copy = function ( f63_arg0, f63_arg1 )
	local f63_local0 = CoD.CraftUtility.GetDDLRoot( f63_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	local f63_local1 = CoD.CraftUtility.Gunsmith.GetEmptyVariantIndex()
	if f63_local0 ~= nil and f63_local1 >= 0 then
		local f63_local2 = f63_local0.variant[f63_arg1]
		local f63_local3 = f63_local0.variant[f63_local1]
		f63_local3.variantName:set( f63_local2.variantName:get() )
		f63_local3.camoIndex:set( f63_local2.camoIndex:get() )
		f63_local3.reticleIndex:set( f63_local2.reticleIndex:get() )
		f63_local3.paintjobSlot:set( f63_local2.paintjobSlot:get() )
		f63_local3.paintjobIndex:set( f63_local2.paintjobIndex:get() )
		f63_local3.weaponIndex:set( f63_local2.weaponIndex:get() )
		for f63_local4 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			f63_local3.attachment[f63_local4 - 1]:set( f63_local2.attachment[f63_local4 - 1]:get() )
		end
		for f63_local4 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			f63_local3.attachmentVariant[f63_local4 - 1]:set( f63_local2.attachmentVariant[f63_local4 - 1]:get() )
		end
		f63_local3.sortIndex:set( CoD.CraftUtility.Gunsmith.GetHighestSortIndexForWeapon( f63_local2.weaponIndex:get() ) + 1 )
		CoD.CraftUtility.UploadAndParseBuffer( f63_arg0, Enum.StorageFileType.STORAGE_GUNSMITH )
		return f63_local1
	else
		
	end
end

CoD.CraftUtility.Gunsmith.AddAttachmentToWeapon = function ( f64_arg0, f64_arg1 )
	if f64_arg1 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
		f64_arg0 = f64_arg0 .. "+" .. Engine.GetAttachmentRefByIndex( f64_arg1 )
	end
	return f64_arg0
end

CoD.CraftUtility.Gunsmith.AddAttachmentVariant = function ( f65_arg0, f65_arg1, f65_arg2 )
	return f65_arg0 .. Engine.GetAttachmentRefByIndex( f65_arg1 ) .. "," .. f65_arg2 .. ","
end

CoD.CraftUtility.Gunsmith.GetWeaponByVariantIndex = function ( f66_arg0, f66_arg1 )
	local f66_local0 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f66_arg0, f66_arg1 )
	local f66_local1 = Engine.GetItemRef( f66_local0.weaponIndex, Enum.eModes.MODE_MULTIPLAYER )
	if f66_local0.weaponIndex == 0 then
		f66_local1 = Engine.GetItemRef( CoD.GetCustomization( f66_arg0, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	end
	local f66_local2 = f66_local1 .. CoD.CraftUtility.GetModeAbbreviation()
	if f66_local0.weaponIndex ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
		for f66_local3 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			f66_local2 = CoD.CraftUtility.Gunsmith.AddAttachmentToWeapon( f66_local2, f66_local0.attachment[f66_local3] )
		end
	end
	return f66_local2
end

CoD.CraftUtility.Gunsmith.GetAttachmentVariantByVariantIndex = function ( f67_arg0, f67_arg1 )
	local f67_local0 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f67_arg0, f67_arg1 )
	local f67_local1 = Engine.GetItemRef( f67_local0.weaponIndex, Enum.eModes.MODE_MULTIPLAYER )
	if f67_local0.weaponIndex == 0 then
		f67_local1 = Engine.GetItemRef( CoD.GetCustomization( f67_arg0, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	end
	local f67_local2 = ""
	if f67_local0.weaponIndex ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
		for f67_local3 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f67_local6 = f67_local0.attachment[f67_local3]
			if f67_local6 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				f67_local2 = CoD.CraftUtility.Gunsmith.AddAttachmentVariant( f67_local2, f67_local6, f67_local0.attachmentVariant[f67_local3] )
			end
		end
	end
	return f67_local2
end

CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant = function ( f68_arg0, f68_arg1 )
	local f68_local0 = Engine.GetItemRef( CoD.GetCustomization( f68_arg0, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER ) .. CoD.CraftUtility.GetModeAbbreviation()
	if f68_arg1 then
		for f68_local1 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			f68_local0 = CoD.CraftUtility.Gunsmith.AddAttachmentToWeapon( f68_local0, Engine.GetModelValue( Engine.GetModel( f68_arg1, "attachment" .. f68_local1 ) ) )
		end
	end
	return f68_local0
end

CoD.CraftUtility.Gunsmith.GetWeaponAttachmentList = function ( f69_arg0, f69_arg1 )
	local f69_local0 = CoD.GetCustomization( f69_arg0, "weapon_index" )
	local f69_local1 = Engine.GetItemRef( f69_local0, Enum.eModes.MODE_MULTIPLAYER )
	local f69_local2 = {}
	if f69_arg1 then
		for f69_local3 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f69_local6 = Engine.GetModelValue( Engine.GetModel( f69_arg1, "attachment" .. f69_local3 ) )
			if f69_local6 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				table.insert( f69_local2, {
					index = Engine.GetAttachmentIndexByAttachmentTableIndex( f69_local0, f69_local6, Enum.eModes.MODE_MULTIPLAYER ),
					ref = Engine.GetAttachmentRefByIndex( f69_local6 )
				} )
			end
		end
	end
	return f69_local2
end

CoD.CraftUtility.Gunsmith.GetWeaponAttachmentVariantString = function ( f70_arg0, f70_arg1 )
	local f70_local0 = Engine.GetItemRef( CoD.GetCustomization( f70_arg0, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	local f70_local1 = ""
	if f70_arg1 then
		for f70_local2 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f70_local5 = Engine.GetModelValue( Engine.GetModel( f70_arg1, "attachment" .. f70_local2 ) )
			if f70_local5 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				f70_local1 = CoD.CraftUtility.Gunsmith.AddAttachmentVariant( f70_local1, f70_local5, Engine.GetModelValue( Engine.GetModel( f70_arg1, "attachmentVariant" .. f70_local2 ) ) )
			end
		end
	end
	return f70_local1
end

CoD.CraftUtility.Gunsmith.GetWeaponAttachmentStringWithoutVariants = function ( f71_arg0, f71_arg1 )
	local f71_local0 = Engine.GetItemRef( CoD.GetCustomization( f71_arg0, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	local f71_local1 = ""
	if f71_arg1 then
		for f71_local2 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f71_local5 = Engine.GetModelValue( Engine.GetModel( f71_arg1, "attachment" .. f71_local2 ) )
			if f71_local5 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				f71_local1 = CoD.CraftUtility.Gunsmith.AddAttachmentVariant( f71_local1, f71_local5, 0 )
			end
		end
	end
	return f71_local1
end

CoD.CraftUtility.Gunsmith.GetAttachmentVariantStringWithSelectedVariant = function ( f72_arg0, f72_arg1, f72_arg2, f72_arg3 )
	local f72_local0 = Engine.GetItemRef( CoD.GetCustomization( f72_arg0, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	local f72_local1 = ""
	if f72_arg1 then
		for f72_local2 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f72_local5 = Engine.GetModelValue( Engine.GetModel( f72_arg1, "attachment" .. f72_local2 ) )
			if f72_local5 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				local f72_local6 = Engine.GetModelValue( Engine.GetModel( f72_arg1, "attachmentVariant" .. f72_local2 ) )
				if f72_arg2 == f72_local5 then
					f72_local1 = CoD.CraftUtility.Gunsmith.AddAttachmentVariant( f72_local1, f72_local5, f72_arg3 )
				else
					f72_local1 = CoD.CraftUtility.Gunsmith.AddAttachmentVariant( f72_local1, f72_local5, f72_local6 )
				end
			end
		end
	end
	return f72_local1
end

CoD.CraftUtility.Gunsmith.DisplayBaseWeapon = function ( f73_arg0, f73_arg1, f73_arg2 )
	local f73_local0 = CoD.GetCustomization( f73_arg2, "weapon_index" )
	local f73_local1 = true
	local f73_local2 = nil
	if CoD.perController[f73_arg2].editingWeaponBuildKits then
		f73_local1 = not IsCACItemLocked( f73_arg0, f73_arg1, f73_arg2 )
	end
	local f73_local3 = Engine.GetItemRef( f73_local0, Enum.eModes.MODE_MULTIPLAYER ) .. CoD.CraftUtility.GetModeAbbreviation()
	Engine.SendClientScriptNotify( f73_arg2, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f73_arg2 ), CoD.CraftUtility.GetLoadoutSlot( f73_arg2 ), f73_local3, CoD.CACUtility.GetCameraNameForAttachments( f73_local3 ), "0,0,0", f73_local2, f73_local1 )
end

CoD.CraftUtility.Gunsmith.DisplayWeaponWithPaintjob = function ( f74_arg0, f74_arg1, f74_arg2 )
	local f74_local0 = Engine.GetItemRef( CoD.GetCustomization( f74_arg0, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER ) .. CoD.CraftUtility.GetModeAbbreviation()
	local f74_local1 = CoD.CraftUtility.GetLoadoutSlot( f74_arg0 )
	local f74_local2 = CoD.CACUtility.GetCameraNameForAttachments( f74_local0 )
	Engine.SetupPaintjobData( f74_arg0, f74_arg2, f74_arg1 )
	Engine.SendClientScriptNotify( f74_arg0, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f74_arg0 ), f74_local1, f74_local0, f74_local2, "0,0,1" )
end

CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant = function ( f75_arg0, f75_arg1, f75_arg2, f75_arg3, f75_arg4, f75_arg5 )
	if f75_arg1 then
		local f75_local0 = CoD.CraftUtility.GetLoadoutSlot( f75_arg0 )
		local f75_local1 = CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant( f75_arg0, f75_arg1 )
		local f75_local2 = CoD.CACUtility.GetCameraNameForAttachments( f75_local1, f75_arg2 )
		if f75_arg5 == nil then
			f75_arg5 = Engine.GetModelValue( Engine.GetModel( f75_arg1, "camoIndex" ) )
		end
		if f75_arg3 == nil then
			f75_arg3 = Engine.GetModelValue( Engine.GetModel( f75_arg1, "paintjobSlot" ) )
		end
		if f75_arg4 == nil then
			f75_arg4 = Engine.GetModelValue( Engine.GetModel( f75_arg1, "paintjobIndex" ) )
		end
		Engine.SetupPaintjobData( f75_arg0, f75_arg3, f75_arg4 )
		Engine.SendClientScriptNotify( f75_arg0, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f75_arg0 ), f75_local0, f75_local1, f75_local2, f75_arg5 .. ",0,1", CoD.CraftUtility.Gunsmith.GetWeaponAttachmentVariantString( f75_arg0, f75_arg1 ) )
	end
end

CoD.CraftUtility.Gunsmith.GetVariantAttachmentList = function ( f76_arg0, f76_arg1 )
	local f76_local0 = {}
	if f76_arg1 then
		for f76_local1 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			table.insert( f76_local0, Engine.GetModelValue( Engine.GetModel( f76_arg1, "attachment" .. f76_local1 ) ) )
		end
	end
	return f76_local0
end

CoD.CraftUtility.Gunsmith.ClearVariantSlotByAttachmentIndex = function ( f77_arg0, f77_arg1, f77_arg2 )
	if f77_arg1 then
		for f77_local0 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f77_local3 = Engine.GetModel( f77_arg1, "attachment" .. f77_local0 )
			local f77_local4 = Engine.GetModelValue( f77_local3 )
			local f77_local5 = Engine.GetModel( f77_arg1, "attachmentVariant" .. f77_local0 )
			if f77_arg2 == f77_local4 then
				Engine.SetModelValue( f77_local5, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
				Engine.SetModelValue( f77_local3, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
				if f77_local0 == 1 then
					Engine.SetModelValue( Engine.GetModel( f77_arg1, "reticleIndex" ), CoD.CraftUtility.Gunsmith.RETICLE_NONE )
				end
			end
		end
	end
end

CoD.CraftUtility.Gunsmith.IsFocusAttachmentEquipped = function ( f78_arg0, f78_arg1, f78_arg2 )
	if f78_arg1 then
		for f78_local0 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			if f78_arg2 == Engine.GetModelValue( Engine.GetModel( f78_arg1, "attachment" .. f78_local0 ) ) then
				return true
			end
		end
	end
end

CoD.CraftUtility.Gunsmith.SetFocusAttachmentVariant = function ( f79_arg0, f79_arg1, f79_arg2, f79_arg3 )
	if f79_arg1 then
		for f79_local0 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f79_local3 = Engine.GetModelValue( Engine.GetModel( f79_arg1, "attachment" .. f79_local0 ) )
			local f79_local4 = Engine.GetModel( f79_arg1, "attachmentVariant" .. f79_local0 )
			if f79_arg2 == f79_local3 then
				Engine.SetModelValue( f79_local4, f79_arg3 )
			end
		end
	end
end

CoD.CraftUtility.Gunsmith.InvalidateRender = function ( f80_arg0, f80_arg1 )
	CoD.CraftUtility.InvalidateWCItemRender( Engine.GetModelValue( Engine.GetModel( f80_arg1, "paintjobSlot" ) ), Engine.GetModelValue( Engine.GetModel( f80_arg1, "paintjobIndex" ) ) )
end

CoD.CraftUtility.Paintjobs = {}
CoD.CraftUtility.Paintjobs.CachedPaintjobs = {}
CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX = 0
CoD.CraftUtility.Paintjobs.GetPrevViewIndex = function ( f81_arg0 )
	local f81_local0 = CoD.CraftUtility.GetWeaponGroupName( f81_arg0 )
	local f81_local1 = #CoD.Paintshop.View
	local f81_local2 = CoD.perController[f81_arg0].viewIndex - 1
	if f81_local2 == 0 then
		f81_local2 = f81_local1
	end
	if f81_local0 == "weapon_knife" and f81_local2 == 2 then
		f81_local2 = f81_local2 - 1
	end
	return f81_local2
end

CoD.CraftUtility.Paintjobs.GetNextViewIndex = function ( f82_arg0 )
	local f82_local0 = CoD.CraftUtility.GetWeaponGroupName( f82_arg0 )
	local f82_local1 = CoD.perController[f82_arg0].viewIndex % #CoD.Paintshop.View + 1
	if f82_local0 == "weapon_knife" and f82_local1 == 2 then
		f82_local1 = f82_local1 + 1
	end
	return f82_local1
end

CoD.CraftUtility.Paintjobs.GetTotalWeaponPaintjobs = function ( f83_arg0 )
	local f83_local0 = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local f83_local1 = 0
	local f83_local2 = Engine.GetPaintjobSlotInfo()
	local f83_local3 = f83_local2.slot_count
	local f83_local4 = f83_local2.paintjobs_per_slot
	for f83_local5 = 0, f83_local3 - 1, 1 do
		local f83_local8 = f83_local0[f83_local5]
		if f83_local8 then
			for f83_local9 = 0, f83_local4 - 1, 1 do
				local f83_local12 = f83_local8[f83_local9]
				if f83_local12 and f83_local12.weaponIndex == f83_arg0 then
					f83_local1 = f83_local1 + 1
				end
			end
		end
	end
	return f83_local1
end

CoD.CraftUtility.Paintjobs.GetTotalUsedPaintjobs = function ()
	local f84_local0 = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local f84_local1 = 0
	local f84_local2 = Engine.GetPaintjobSlotInfo()
	local f84_local3 = f84_local2.slot_count
	local f84_local4 = f84_local2.paintjobs_per_slot
	for f84_local5 = 0, f84_local3 - 1, 1 do
		local f84_local8 = f84_local0[f84_local5]
		if f84_local8 then
			for f84_local9 = 0, f84_local4 - 1, 1 do
				local f84_local12 = f84_local8[f84_local9]
				if f84_local12 and f84_local12.weaponIndex ~= CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX then
					f84_local1 = f84_local1 + 1
				end
			end
		end
	end
	return f84_local1
end

CoD.CraftUtility.Paintjobs.GetHighestSortIndexForWeapon = function ( f85_arg0 )
	local f85_local0 = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local f85_local1 = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
	local f85_local2 = Engine.GetPaintjobSlotInfo()
	local f85_local3 = f85_local2.slot_count
	local f85_local4 = f85_local2.paintjobs_per_slot
	for f85_local5 = 0, f85_local3 - 1, 1 do
		local f85_local8 = f85_local0[f85_local5]
		if f85_local8 then
			for f85_local9 = 0, f85_local4 - 1, 1 do
				local f85_local12 = f85_local8[f85_local9]
				if f85_local12 and f85_local12.weaponIndex == f85_arg0 then
					local f85_local13 = f85_local12.sortIndex
					if f85_local1 < f85_local13 then
						f85_local1 = f85_local13
					end
				end
			end
		end
	end
	return f85_local1
end

CoD.CraftUtility.Paintjobs.GetCACPaintjobList = function ( f86_arg0 )
	local f86_local0 = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local f86_local1 = {}
	local f86_local2 = Engine.GetPaintjobSlotInfo()
	local f86_local3 = f86_local2.slot_count
	local f86_local4 = f86_local2.paintjobs_per_slot
	for f86_local5 = 0, f86_local3 - 1, 1 do
		local f86_local8 = f86_local0[f86_local5]
		if f86_local8 then
			for f86_local9 = 0, f86_local4 - 1, 1 do
				local f86_local12 = f86_local8[f86_local9]
				if f86_local12 and f86_local12.weaponIndex == f86_arg0 then
					table.insert( f86_local1, f86_local12 )
				end
			end
		end
	end
	table.sort( f86_local1, function ( f87_arg0, f87_arg1 )
		return f87_arg1.sortIndex < f87_arg0.sortIndex
	end )
	return f86_local1
end

CoD.CraftUtility.Paintjobs.GetSortedWeaponPaintjobList = function ( f88_arg0 )
	local f88_local0 = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local f88_local1 = {}
	local f88_local2 = false
	local f88_local3 = Engine.GetPaintjobSlotInfo()
	local f88_local4 = f88_local3.slot_count
	local f88_local5 = f88_local3.paintjobs_per_slot
	for f88_local6 = 0, f88_local4 - 1, 1 do
		local f88_local9 = f88_local0[f88_local6]
		if f88_local9 then
			for f88_local10 = 0, f88_local5 - 1, 1 do
				local f88_local13 = f88_local9[f88_local10]
				if f88_local13 then
					if f88_arg0 == nil and f88_local13.weaponIndex ~= 0 then
						table.insert( f88_local1, f88_local13 )
					end
					if f88_local13.weaponIndex == CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX and not f88_local2 then
						f88_local13.sortIndex = CoD.CraftUtility.Paintjobs.GetHighestSortIndexForWeapon( f88_arg0 ) + 1
						f88_local2 = true
						table.insert( f88_local1, f88_local13 )
					end
					if f88_local13.weaponIndex == f88_arg0 then
						table.insert( f88_local1, f88_local13 )
					end
				end
			end
		end
	end
	table.sort( f88_local1, function ( f89_arg0, f89_arg1 )
		return f89_arg1.sortIndex < f89_arg0.sortIndex
	end )
	return f88_local1
end

CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs = function ( f90_arg0 )
	local f90_local0 = Engine.MediaManagerGetQuota( f90_arg0, "paintjob" )
	return f90_local0.categoryQuota
end

CoD.CraftUtility.Paintjobs.IsPaintjobIndexOccupied = function ( f91_arg0, f91_arg1 )
	if CoD.CraftUtility.Paintjobs.CachedPaintjobs[f91_arg0][f91_arg1].weaponIndex ~= CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX then
		return true
	else
		return false
	end
end

CoD.CraftUtility.Paintjobs.ParseDDL = function ( f92_arg0, f92_arg1 )
	local f92_local0 = Engine.GetPaintjobSlotInfo()
	local f92_local1 = f92_local0.slot_count
	local f92_local2 = f92_local0.paintjobs_per_slot
	local f92_local3 = CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs( f92_arg0 )
	if f92_local1 * f92_local2 < f92_local3 then
		error( "Paintjob DDL: DDL does not support " .. f92_local3 .. " paintjobs." )
		return false
	end
	for f92_local4 = 0, f92_local1 - 1, 1 do
		local f92_local7 = CoD.CraftUtility.GetDDLRoot( f92_arg0, f92_arg1, f92_local4 )
		CoD.CraftUtility.Paintjobs.CachedPaintjobs[f92_local4] = {}
		if f92_local7 == nil then
			CoD.CraftUtility.Paintjobs.CachedPaintjobs = {}
			return false
		end
		for f92_local8 = 0, f92_local2 - 1, 1 do
			if f92_local3 <= f92_local4 * f92_local2 + f92_local8 then
				return true
			end
			local f92_local11 = {}
			local f92_local12 = f92_local7.weaponPaintjob[f92_local8]
			f92_local11.weaponIndex = f92_local12.weaponIndex:get()
			f92_local11.sortIndex = f92_local12.sortIndex:get()
			f92_local11.paintjobName = f92_local12.paintjobName:get()
			f92_local11.paintjobSlot = f92_local4
			f92_local11.paintjobIndex = f92_local8
			f92_local11.readOnly = f92_local12.readOnly:get()
			if f92_local12.createTime ~= nil then
				f92_local11.createTime = Engine.GetLocalizedTimeStr( f92_local12.createTime:get() )
			end
			CoD.CraftUtility.Paintjobs.CachedPaintjobs[f92_local4][f92_local8] = f92_local11
		end
	end
	return true
end

CoD.CraftUtility.Paintjobs.InvalidateRender = function ( f93_arg0, f93_arg1 )
	CoD.CraftUtility.InvalidateWCItemRender( Engine.GetModelValue( Engine.GetModel( f93_arg1, "paintjobSlot" ) ), Engine.GetModelValue( Engine.GetModel( f93_arg1, "paintjobIndex" ) ) )
end

CoD.CraftUtility.Paintjobs.UploadPaintjob = function ( f94_arg0, f94_arg1 )
	local f94_local0 = Engine.GetModelValue( Engine.GetModel( f94_arg1, "paintjobSlot" ) )
	local f94_local1 = Engine.GetModelValue( Engine.GetModel( f94_arg1, "paintjobIndex" ) )
	local f94_local2 = Engine.GetModelValue( Engine.GetModel( f94_arg1, "weaponIndex" ) )
	local f94_local3 = Engine.GetModelValue( Engine.GetModel( f94_arg1, "sortIndex" ) )
	local f94_local4 = Engine.GetModelValue( Engine.GetModel( f94_arg1, "paintjobName" ) )
	local f94_local5 = CoD.CraftUtility.GetDDLRoot( f94_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS, f94_local0 )
	if f94_local5 ~= nil then
		local f94_local6 = f94_local5.weaponPaintjob[f94_local1]
		f94_local6.weaponIndex:set( f94_local2 )
		f94_local6.sortIndex:set( f94_local3 )
		f94_local6.paintjobName:set( f94_local4 )
		f94_local6.createTime:set( Engine.GetCurrentUTCTimeStr() )
		Engine.UploadPaintjobData( f94_arg0, f94_local0, f94_local1 )
	end
end

CoD.CraftUtility.Paintjobs.GetEmptyPaintjob = function ( f95_arg0 )
	local f95_local0 = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local f95_local1 = Engine.GetPaintjobSlotInfo()
	local f95_local2 = f95_local1.slot_count
	local f95_local3 = f95_local1.paintjobs_per_slot
	for f95_local4 = 0, f95_local2 - 1, 1 do
		local f95_local7 = f95_local0[f95_local4]
		if f95_local7 then
			for f95_local8 = 0, f95_local3 - 1, 1 do
				local f95_local11 = f95_local7[f95_local8]
				if f95_local11.weaponIndex == CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX then
					f95_local11.sortIndex = CoD.CraftUtility.Paintjobs.GetHighestSortIndexForWeapon( f95_arg0 ) + 1
					return f95_local11
				end
			end
		end
	end
end

CoD.CraftUtility.Paintjobs.Copy = function ( f96_arg0, f96_arg1 )
	local f96_local0 = Engine.GetModelValue( Engine.GetModel( f96_arg1, "paintjobSlot" ) )
	local f96_local1 = Engine.GetModelValue( Engine.GetModel( f96_arg1, "weaponIndex" ) )
	local f96_local2 = Engine.GetModelValue( Engine.GetModel( f96_arg1, "paintjobName" ) )
	local f96_local3 = CoD.CraftUtility.GetDDLRoot( f96_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS, f96_local0 )
	local f96_local4 = CoD.CraftUtility.Paintjobs.GetEmptyPaintjob( f96_local1 )
	if f96_local3 ~= nil and f96_local4 ~= nil then
		local f96_local5 = CoD.CraftUtility.GetDDLRoot( f96_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS, f96_local4.paintjobSlot )
		if f96_local5 ~= nil then
			local f96_local6 = f96_local5.weaponPaintjob[f96_local4.paintjobIndex]
			f96_local6.weaponIndex:set( f96_local1 )
			f96_local6.sortIndex:set( f96_local4.sortIndex )
			f96_local6.paintjobName:set( f96_local2 )
			Engine.UploadPaintjobData( f96_arg0, f96_local4.paintjobSlot, f96_local4.paintjobIndex )
			return f96_local4.paintjobSlot, f96_local4.paintjobIndex
		end
	end
end

CoD.CraftUtility.Paintjobs.ClearPaintjob = function ( f97_arg0, f97_arg1, f97_arg2 )
	local f97_local0 = CoD.CraftUtility.GetDDLRoot( f97_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS, f97_arg1 )
	if f97_local0 ~= nil then
		local f97_local1 = f97_local0.weaponPaintjob[f97_arg2]
		f97_local1.paintjobName:set( "" )
		f97_local1.sortIndex:set( CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX )
		f97_local1.weaponIndex:set( CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX )
		Engine.ClearPaintjobLayerData()
		Engine.UploadPaintjobData( f97_arg0, f97_arg1, f97_arg2 )
	end
end

CoD.CraftUtility.Paintjobs.GetPaintjobName = function ( f98_arg0, f98_arg1, f98_arg2 )
	local f98_local0 = CoD.CraftUtility.GetDDLRoot( f98_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS, f98_arg1 )
	if f98_local0 ~= nil then
		return f98_local0.weaponPaintjob[f98_arg2].paintjobName:get()
	else
		return ""
	end
end

CoD.CraftUtility.Paintjobs.RenamePaintjob = function ( f99_arg0, f99_arg1, f99_arg2, f99_arg3 )
	local f99_local0 = Enum.StorageFileType.STORAGE_PAINTJOBS
	local f99_local1 = CoD.CraftUtility.GetDDLRoot( f99_arg0, f99_local0, f99_arg1 )
	if f99_local1 ~= nil then
		f99_local1.weaponPaintjob[f99_arg2].paintjobName:set( f99_arg3 )
		CoD.CraftUtility.UploadAndParseBuffer( f99_arg0, f99_local0, f99_arg1 )
	end
end

CoD.CraftUtility.Paintjobs.PublishPaintjob = function ( f100_arg0 )
	local f100_local0 = CoD.perController[f100_arg0].selectedpaintjobModel
	local f100_local1 = Engine.GetModelValue( Engine.GetModel( f100_local0, "paintjobSlot" ) )
	local f100_local2 = Engine.GetModelValue( Engine.GetModel( f100_local0, "paintjobIndex" ) )
	local f100_local3 = CoD.CraftUtility.GetDDLRoot( f100_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS, f100_local1 )
	if f100_local3 ~= nil then
		Engine.PublishPaintjob( f100_arg0, "paintjob", f100_local1, f100_local2, f100_local3.weaponPaintjob[f100_local2].weaponIndex:get(), CoD.FileshareUtility.GetPublishName(), CoD.FileshareUtility.GetPublishAllowDownload() )
	end
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
	local f101_local0 = CoD.CraftUtility.Emblems.CachedEmblems
	local f101_local1 = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
	for f101_local2 = 1, #f101_local0, 1 do
		local f101_local5 = f101_local0[f101_local2].sortIndex
		if f101_local1 < f101_local5 then
			f101_local1 = f101_local5
		end
	end
	return f101_local1
end

CoD.CraftUtility.Emblems.GetSortedEmblemsList = function ( f102_arg0 )
	local f102_local0 = CoD.CraftUtility.Emblems.CachedEmblems
	local f102_local1 = {}
	local f102_local2 = false
	for f102_local3 = 1, #f102_local0, 1 do
		local f102_local6 = f102_local0[f102_local3]
		if f102_local6.isUsed == 0 and not f102_local2 and f102_arg0 == Enum.StorageFileType.STORAGE_EMBLEMS then
			f102_local6.sortIndex = CoD.CraftUtility.Emblems.GetHighestSortIndex() + 1
			f102_local2 = true
			table.insert( f102_local1, f102_local6 )
		end
		if f102_local6.isUsed == 1 then
			table.insert( f102_local1, f102_local6 )
		end
	end
	table.sort( f102_local1, function ( f103_arg0, f103_arg1 )
		return f103_arg1.sortIndex < f103_arg0.sortIndex
	end )
	return f102_local1
end

CoD.CraftUtility.Emblems.GetTotalUsedEmblems = function ( f104_arg0, f104_arg1 )
	local f104_local0 = CoD.CraftUtility.Emblems.GetTotalAllowedEmblems( f104_arg0, f104_arg1 )
	local f104_local1 = CoD.CraftUtility.GetDDLRoot( f104_arg0, f104_arg1 )
	local f104_local2 = 0
	for f104_local3 = 0, f104_local0, 1 do
		if f104_local1.emblemList[f104_local3].isUsed:get() == 1 then
			f104_local2 = f104_local2 + 1
		end
	end
	return f104_local2
end

CoD.CraftUtility.Emblems.GetTotalAllowedEmblems = function ( f105_arg0, f105_arg1 )
	if f105_arg1 == Enum.StorageFileType.STORAGE_DEFAULT_EMBLEMS then
		return Dvar.default_emblems_max_count:get()
	elseif f105_arg1 == Enum.StorageFileType.STORAGE_EMBLEMS_LOOT then
		return Dvar.loot_emblems_max_count:get()
	else
		local f105_local0 = Engine.MediaManagerGetQuota( f105_arg0, "emblem" )
		return f105_local0.categoryQuota
	end
end

CoD.CraftUtility.Emblems.GetEmblemName = function ( f106_arg0, f106_arg1, f106_arg2 )
	if f106_arg2 ~= Enum.StorageFileType.STORAGE_EMBLEMS then
		return Engine.Localize( "EM_" .. f106_arg1 )
	else
		return f106_arg1
	end
end

CoD.CraftUtility.Emblems.ParseDDL = function ( f107_arg0, f107_arg1 )
	local f107_local0 = CoD.CraftUtility.Emblems.GetTotalAllowedEmblems( f107_arg0, f107_arg1 )
	local f107_local1 = CoD.CraftUtility.GetDDLRoot( f107_arg0, f107_arg1 )
	if f107_local1 == nil then
		CoD.CraftUtility.Emblems.CachedEmblems = {}
		return false
	elseif #f107_local1.emblemList < f107_local0 then
		error( "Emblems DDL: DDL does not support " .. f107_local0 .. " emblems." )
		return false
	end
	for f107_local2 = 0, f107_local0, 1 do
		local f107_local5 = {}
		local f107_local6 = f107_local1.emblemList[f107_local2]
		f107_local5.emblemIndex = f107_local2
		f107_local5.isUsed = f107_local6.isUsed:get()
		f107_local5.sortIndex = f107_local6.sortIndex:get()
		f107_local5.readOnly = f107_local6.readOnly:get()
		f107_local5.emblemName = CoD.CraftUtility.Emblems.GetEmblemName( f107_arg0, f107_local6.emblemName:get(), f107_arg1 )
		if f107_local6.createTime ~= nil then
			f107_local5.createTime = Engine.GetLocalizedTimeStr( f107_local6.createTime:get() )
		end
		CoD.CraftUtility.Emblems.CachedEmblems[f107_local2 + 1] = f107_local5
	end
	return true
end

CoD.CraftUtility.Emblems.IsEmblemIndexOccupied = function ( f108_arg0 )
	local f108_local0 = CoD.CraftUtility.Emblems.CachedEmblems
	for f108_local1 = 1, #f108_local0, 1 do
		local f108_local4 = f108_local0[f108_local1]
		if f108_local4.emblemIndex == f108_arg0 then
			return f108_local4.isUsed == 1
		end
	end
	return false
end

CoD.CraftUtility.Emblems.UploadEmblem = function ( f109_arg0, f109_arg1 )
	local f109_local0 = Engine.GetModelValue( Engine.GetModel( f109_arg1, "emblemIndex" ) )
	local f109_local1 = Engine.GetModelValue( Engine.GetModel( f109_arg1, "sortIndex" ) )
	local f109_local2 = Engine.GetModelValue( Engine.GetModel( f109_arg1, "emblemName" ) )
	local f109_local3 = CoD.CraftUtility.GetDDLRoot( f109_arg0, CoD.perController[f109_arg0].selectedEmblemTabStorageType )
	if f109_local3 ~= nil and f109_local0 >= 0 then
		local f109_local4 = f109_local3.emblemList[f109_local0]
		f109_local4.isUsed:set( 1 )
		f109_local4.sortIndex:set( f109_local1 )
		f109_local4.emblemName:set( f109_local2 )
		f109_local4.createTime:set( Engine.GetCurrentUTCTimeStr() )
		Engine.UploadEmblemData( f109_arg0, f109_local0 )
	end
end

CoD.CraftUtility.Emblems.RenameEmblem = function ( f110_arg0, f110_arg1, f110_arg2 )
	local f110_local0 = CoD.perController[f110_arg0].selectedEmblemTabStorageType
	local f110_local1 = CoD.CraftUtility.GetDDLRoot( f110_arg0, f110_local0 )
	if f110_local1 ~= nil and f110_arg1 >= 0 then
		f110_local1.emblemList[f110_arg1].emblemName:set( f110_arg2 )
		CoD.CraftUtility.UploadAndParseBuffer( f110_arg0, f110_local0 )
	end
end

CoD.CraftUtility.Emblems.ClearEmblem = function ( f111_arg0, f111_arg1 )
	local f111_local0 = CoD.CraftUtility.GetDDLRoot( f111_arg0, CoD.perController[f111_arg0].selectedEmblemTabStorageType )
	local f111_local1 = Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM
	if f111_local0 ~= nil and f111_arg1 >= 0 then
		local f111_local2 = f111_local0.emblemList[f111_arg1]
		f111_local2.emblemName:set( "" )
		f111_local2.isUsed:set( 0 )
		f111_local2.sortIndex:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		Engine.ExecNow( f111_arg0, "emblemClearAll " .. f111_local1 )
	end
end

CoD.CraftUtility.Emblems.GetEmptyEmblem = function ()
	local f112_local0 = CoD.CraftUtility.Emblems.CachedEmblems
	for f112_local1 = 1, #f112_local0, 1 do
		local f112_local4 = f112_local0[f112_local1]
		if f112_local4.isUsed == 0 then
			f112_local4.sortIndex = CoD.CraftUtility.Emblems.GetHighestSortIndex() + 1
			return f112_local4
		end
	end
end

CoD.CraftUtility.Emblems.Copy = function ( f113_arg0, f113_arg1, f113_arg2 )
	local f113_local0 = Engine.GetModelValue( Engine.GetModel( f113_arg1, "emblemIndex" ) )
	local f113_local1 = Engine.GetModelValue( Engine.GetModel( f113_arg1, "sortIndex" ) )
	local f113_local2 = Engine.GetModelValue( Engine.GetModel( f113_arg1, "emblemName" ) )
	local f113_local3 = CoD.CraftUtility.GetDDLRoot( f113_arg0, f113_arg2 )
	local f113_local4 = CoD.CraftUtility.Emblems.GetEmptyEmblem()
	if f113_local3 ~= nil and f113_local0 >= 0 and f113_local4 and f113_local4.emblemIndex >= 0 then
		local f113_local5 = f113_local3.emblemList[f113_local4.emblemIndex]
		f113_local5.isUsed:set( 1 )
		f113_local5.sortIndex:set( f113_local4.sortIndex )
		f113_local5.emblemName:set( f113_local2 )
		Engine.UploadEmblemData( f113_arg0, f113_local4.emblemIndex )
		return f113_local4.emblemIndex
	else
		
	end
end

CoD.CraftUtility.Emblems.PublishEmblem = function ( f114_arg0 )
	local modelValue = Engine.GetModelValue( Engine.GetModel( CoD.perController[f114_arg0].selectedEmblemModel, "emblemIndex" ) )
	local f114_local1 = CoD.FileshareUtility.GetPublishName()
	local f114_local2 = CoD.FileshareUtility.GetPublishAllowDownload()
	if modelValue >= 0 then
		Engine.PublishEmblem( f114_arg0, "emblem", modelValue - 1, f114_local1, f114_local2 )
	end
end

CoD.CraftUtility.Emblems.FileshareBreadcrumbPaths = {
	[Enum.StorageFileType.STORAGE_DEFAULT_EMBLEMS] = "default",
	[Enum.StorageFileType.STORAGE_EMBLEMS_LOOT] = "blackMarket"
}
CoD.CraftUtility.Emblems.GetEmblemBreadcrumbRoot = function ( f115_arg0, f115_arg1, f115_arg2 )
	local f115_local0 = CoD.CraftUtility.Emblems.FileshareBreadcrumbPaths[f115_arg2]
	if f115_local0 then
		local f115_local1 = Engine.StorageGetBuffer( f115_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		if f115_local1 then
			return f115_local1.emblemBreadcrumbs[f115_local0].markedOld[f115_arg1]
		end
	end
	return nil
end

CoD.CraftUtility.Emblems.IsEmblemNew = function ( f116_arg0, f116_arg1, f116_arg2 )
	local f116_local0 = CoD.CraftUtility.Emblems.GetEmblemBreadcrumbRoot( f116_arg0, f116_arg1, f116_arg2 )
	if f116_local0 then
		return f116_local0:get() == 0
	else
		return false
	end
end

CoD.CraftUtility.Emblems.IsAnyEmblemNew = function ( f117_arg0 )
	if IsLive() then
		for f117_local5, f117_local6 in pairs( CoD.CraftUtility.Emblems.FileshareBreadcrumbPaths ) do
			local f117_local7 = CoD.CraftUtility.Emblems.GetTotalUsedEmblems( f117_arg0, f117_local5 )
			for f117_local4 = 0, f117_local7 - 1, 1 do
				local f117_local3 = false
				if f117_local5 == Enum.StorageFileType.STORAGE_EMBLEMS_LOOT then
					f117_local3 = CoD.BlackMarketUtility.IsItemLocked( f117_arg0, CoD.BlackMarketUtility.GetLootEmblemIDName( f117_arg0, f117_local4 ) )
				end
				if not f117_local3 and CoD.CraftUtility.Emblems.IsEmblemNew( f117_arg0, f117_local4, f117_local5 ) then
					return true
				end
			end
		end
	end
	return false
end

CoD.CraftUtility.Emblems.GetEmblemMaterialBreadcrumbRoot = function ( f118_arg0, f118_arg1 )
	local f118_local0 = Engine.StorageGetBuffer( f118_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if f118_local0 then
		return f118_local0.emblemStats.materials[f118_arg1].markedOld
	else
		
	end
end

CoD.CraftUtility.Emblems.IsMaterialNew = function ( f119_arg0, f119_arg1 )
	local f119_local0 = CoD.CraftUtility.Emblems.GetEmblemMaterialBreadcrumbRoot( f119_arg0, f119_arg1 )
	if f119_local0 then
		return f119_local0:get() == 0
	else
		return false
	end
end

CoD.CraftUtility.Fileshare.DisplayWeaponWithPaintjob = function ( f120_arg0, f120_arg1, f120_arg2, f120_arg3 )
	if f120_arg1 == 0 then
		CoD.CraftUtility.Fileshare.ClearDisplay( f120_arg0 )
		return 
	else
		Engine.SetupFilesharePaintjobData( f120_arg0, f120_arg2 )
		Engine.SendClientScriptNotify( f120_arg0, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f120_arg0 ), CoD.CraftUtility.GetLoadoutSlot( f120_arg0 ), Engine.GetItemRef( f120_arg1 ) .. CoD.CraftUtility.GetModeAbbreviation(), CoD.CACUtility.GetCameraNameForAttachments( "", f120_arg3 == true ), "0,0,1" )
	end
end

CoD.CraftUtility.Fileshare.DisplayWeaponVariants = function ( f121_arg0, f121_arg1, f121_arg2, f121_arg3 )
	if f121_arg1 == 0 then
		CoD.CraftUtility.Fileshare.ClearDisplay( f121_arg0 )
		return 
	else
		Engine.SetupFilesharePaintjobData( f121_arg0, f121_arg2 )
		local f121_local0 = Engine.GetFileshareWeaponVariantData( f121_arg0, f121_arg2 )
		local f121_local1 = Engine.GetItemRef( f121_arg1 )
		local f121_local2 = f121_local1 .. CoD.CraftUtility.GetModeAbbreviation()
		local f121_local3 = f121_local0.camoIndex
		local f121_local4 = CoD.CraftUtility.GetLoadoutSlot( f121_arg0 )
		local f121_local5 = f121_local1 .. CoD.CraftUtility.GetModeAbbreviation() .. CoD.CraftUtility.Fileshare.GetWeaponsAttachmentsString( f121_local0 )
		Engine.SendClientScriptNotify( f121_arg0, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f121_arg0 ), f121_local4, f121_local5, CoD.CACUtility.GetCameraNameForAttachments( f121_local5, f121_arg3 == true ), f121_local3 .. ",0,1", CoD.CraftUtility.Fileshare.GetWeaponAttachmentVariantString( f121_local0 ) )
	end
end

CoD.CraftUtility.Fileshare.GetWeaponsAttachmentsString = function ( f122_arg0 )
	local f122_local0 = ""
	for f122_local1 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
		local f122_local4 = f122_arg0.attachments[f122_local1 - 1]
		if f122_local4 ~= nil then
			f122_local0 = CoD.CraftUtility.Gunsmith.AddAttachmentToWeapon( f122_local0, f122_local4 )
		end
	end
	return f122_local0
end

CoD.CraftUtility.Fileshare.GetWeaponAttachmentVariantString = function ( f123_arg0 )
	local f123_local0 = ""
	for f123_local1 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
		local f123_local4 = f123_arg0.attachments[f123_local1 - 1]
		if f123_local4 ~= nil and f123_local4 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
			f123_local0 = CoD.CraftUtility.Gunsmith.AddAttachmentVariant( f123_local0, f123_local4, f123_arg0.attachmentVariants[f123_local1 - 1] )
		end
	end
	return f123_local0
end

CoD.CraftUtility.Fileshare.ClearDisplay = function ( f124_arg0 )
	Engine.SendClientScriptNotify( f124_arg0, "CustomClass_remove" .. CoD.GetLocalClientAdjustedNum( f124_arg0 ) )
end

