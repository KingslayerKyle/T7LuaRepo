-- df03a5cee73160e5e43ebc386eda4670
-- This hash is used for caching, delete to decompile the file again

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
CoD.CraftUtility.GetMaterialCategoryTypeByID = function ( f1_arg0 )
	for f1_local0 = 1, #CoD.emblem.MaterialCategory, 1 do
		if f1_arg0 and CoD.emblem.MaterialCategory[f1_local0].category == f1_arg0 then
			return CoD.emblem.MaterialCategory[f1_local0].type
		end
	end
	return nil
end

CoD.CraftUtility.GetDecalCategoryTypeByID = function ( f2_arg0 )
	for f2_local0 = 1, #CoD.emblem.DECALTABS, 1 do
		if CoD.emblem.DECALTABS[f2_local0].category == f2_arg0 then
			return CoD.emblem.DECALTABS[f2_local0].type
		end
	end
	return nil
end

CoD.CraftUtility.InvalidateWCItemRender = function ( f3_arg0, f3_arg1 )
	Engine.InvalidateWCItemRender( f3_arg0, f3_arg1 )
end

CoD.CraftUtility.GetUsedSlotsByFileType = function ( f4_arg0, f4_arg1 )
	local f4_local0 = 0
	if f4_arg1 == Enum.StorageFileType.STORAGE_PAINTJOBS then
		f4_local0 = CoD.CraftUtility.Paintjobs.GetTotalUsedPaintjobs()
	elseif f4_arg1 == Enum.StorageFileType.STORAGE_GUNSMITH then
		f4_local0 = CoD.CraftUtility.Gunsmith.GetTotalUsedVariants()
	elseif f4_arg1 == Enum.StorageFileType.STORAGE_EMBLEMS then
		f4_local0 = CoD.CraftUtility.Emblems.GetTotalUsedEmblems( f4_arg0, f4_arg1 )
	end
	return f4_local0
end

CoD.CraftUtility.GetTotalAllowedSlotsByFileType = function ( f5_arg0, f5_arg1 )
	local f5_local0 = 0
	if f5_arg1 == Enum.StorageFileType.STORAGE_PAINTJOBS then
		f5_local0 = CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs( f5_arg0 )
	elseif f5_arg1 == Enum.StorageFileType.STORAGE_GUNSMITH then
		f5_local0 = CoD.CraftUtility.Gunsmith.GetTotalAllowedVaraints()
	elseif f5_arg1 == Enum.StorageFileType.STORAGE_EMBLEMS then
		f5_local0 = CoD.CraftUtility.Emblems.GetTotalAllowedEmblems( f5_arg0, f5_arg1 )
	end
	return f5_local0
end

CoD.CraftUtility.GetGridTypeName = function ( f6_arg0 )
	local f6_local0 = "paintshop_grid_size"
	if not IsPaintshop( f6_arg0 ) then
		f6_local0 = "emblem_grid_size"
	end
	return f6_local0
end

CoD.CraftUtility.GetGridSize = function ( f7_arg0 )
	local f7_local0 = CoD.CraftUtility.PAINTSHOP_GRIDSIZE
	if not IsPaintshop( f7_arg0 ) then
		f7_local0 = CoD.CraftUtility.EMBLEM_GRIDSIZE
	end
	return f7_local0
end

CoD.CraftUtility.GetDDLRoot = function ( f8_arg0, f8_arg1, f8_arg2 )
	if f8_arg1 == "cacRoot" then
		return Engine.GetCACRoot( f8_arg0 )
	elseif f8_arg2 ~= nil then
		return Engine.StorageGetBuffer( f8_arg0, f8_arg1, f8_arg2 )
	else
		return Engine.StorageGetBuffer( f8_arg0, f8_arg1 )
	end
end

CoD.CraftUtility.GetEmblemState = function ( f9_arg0, f9_arg1, f9_arg2 )
	local f9_local0 = math.floor( f9_arg2 / 32 )
	local f9_local1 = f9_arg2 % 32
	local f9_local2 = CoD.CraftUtility.GetDDLRoot( f9_arg0, f9_arg1, f9_local0 )
	return f9_local2.emblemList[f9_local1]
end

CoD.CraftUtility.UploadBuffer = function ( f10_arg0, f10_arg1, f10_arg2 )
	if f10_arg1 == Enum.StorageFileType.STORAGE_GUNSMITH then
		f10_arg1 = CoD.CraftUtility.Gunsmith.GetFileType()
	end
	if f10_arg1 == "cacRoot" then
		Engine.Exec( f10_arg0, "saveLoadout" )
	elseif f10_arg2 ~= nil then
		Engine.StorageWrite( f10_arg0, f10_arg1, f10_arg2 )
	else
		Engine.StorageWrite( f10_arg0, f10_arg1 )
	end
end

CoD.CraftUtility.UploadAndParseBuffer = function ( f11_arg0, f11_arg1, f11_arg2 )
	CoD.CraftUtility.UploadBuffer( f11_arg0, f11_arg1, f11_arg2 )
	if f11_arg1 == Enum.StorageFileType.STORAGE_GUNSMITH then
		CoD.CraftUtility.Gunsmith.ParseDDL( f11_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	elseif f11_arg1 == Enum.StorageFileType.STORAGE_EMBLEMS then
		CoD.CraftUtility.Emblems.ParseDDL( f11_arg0, f11_arg1 )
	elseif f11_arg1 == Enum.StorageFileType.STORAGE_PAINTJOBS then
		CoD.CraftUtility.Paintjobs.ParseDDL( f11_arg0, f11_arg1 )
	end
	MediaManagerMarkDirty( f11_arg0 )
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

CoD.CraftUtility.GetLoadoutSlot = function ( f14_arg0 )
	local f14_local0
	if CoD.GetCustomization( f14_arg0, "category_index" ) ~= nil then
		f14_local0 = CoD.GetCustomization( f14_arg0, "category_index" ) - 1
	else
		f14_local0 = 1
	end
	return CoD.Craft.WeaponGroupNames[f14_local0].loadout_slot
end

CoD.CraftUtility.DisplayWeaponInPaintshop = function ( f15_arg0, f15_arg1 )
	Engine.SendClientScriptNotify( f15_arg0, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f15_arg0 ), CoD.CraftUtility.GetLoadoutSlot( f15_arg0 ), Engine.GetItemRef( CoD.GetCustomization( f15_arg0, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER ) .. CoD.CraftUtility.GetModeAbbreviation(), f15_arg1, "0,0,1" )
end

CoD.CraftUtility.PaintjobClear = function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3, f16_arg4 )
	CoD.OverlayUtility.CreateOverlay( f16_arg2, f16_arg4, "PaintjobClearConfirmationOverlay" )
end

CoD.CraftUtility.PaintjobRename = function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3, f17_arg4 )
	ShowKeyboard( f17_arg4, f17_arg1, f17_arg2, "KEYBOARD_TYPE_PAINTJOB" )
end

CoD.CraftUtility.OpenPublishPromptPaintjob = function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3, f18_arg4 )
	local f18_local0 = CoD.perController[f18_arg2].selectedpaintjobModel
	local f18_local1 = Engine.GetModelValue( Engine.GetModel( f18_local0, "paintjobSlot" ) )
	local f18_local2 = Engine.GetModelValue( Engine.GetModel( f18_local0, "paintjobIndex" ) )
	local f18_local3 = CoD.CraftUtility.GetDDLRoot( f18_arg2, Enum.StorageFileType.STORAGE_PAINTJOBS, f18_local1 )
	local f18_local4 = ""
	if f18_local3 ~= nil then
		local f18_local5 = f18_local3.weaponPaintjob[f18_local2].paintjobName:get()
		if f18_local5 ~= nil then
			f18_local4 = f18_local5
		end
	end
	CoD.FileshareUtility.OpenPublishPrompt( f18_arg4, f18_arg2, "paintjob", f18_local4, "", CoD.CraftUtility.Paintjobs.PublishPaintjob )
end

CoD.CraftUtility.GunsmithClear = function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3, f19_arg4 )
	CoD.OverlayUtility.CreateOverlay( f19_arg2, f19_arg4, "GunsmithClearConfirmationOverlay" )
end

CoD.CraftUtility.GunsmithRename = function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3, f20_arg4 )
	ShowKeyboard( f20_arg4, f20_arg1, f20_arg2, "KEYBOARD_TYPE_GUNSMITH" )
end

CoD.CraftUtility.OpenPublishPromptGunsmith = function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3, f21_arg4 )
	CoD.FileshareUtility.OpenPublishPrompt( f21_arg4, f21_arg2, "variant", Engine.GetModelValue( Engine.GetModel( CoD.perController[f21_arg2].gunsmithVariantModel, "variantName" ) ), "", CoD.CraftUtility.Gunsmith.PublishVariant )
end

CoD.CraftUtility.EmblemClear = function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3, f22_arg4 )
	local f22_local0 = CoD.OverlayUtility.CreateOverlay( f22_arg2, f22_arg4, "EmblemClearConfirmationOverlay" )
end

CoD.CraftUtility.EmblemRename = function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3, f23_arg4 )
	ShowKeyboard( f23_arg4, f23_arg1, f23_arg2, "KEYBOARD_TYPE_EMBLEMS" )
end

CoD.CraftUtility.OpenPublishPromptEmblem = function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3, f24_arg4 )
	if CheckIfFeatureIsBanned( f24_arg2 + 1, LuaEnums.FEATURE_BAN.USER_GENERATED_CONTENT ) then
		LuaUtils.UI_ShowErrorMessageDialog( f24_arg2, GetFeatureBanInfo( f24_arg2 + 1, LuaEnums.FEATURE_BAN.USER_GENERATED_CONTENT ) )
		return 
	else
		CoD.FileshareUtility.OpenPublishPrompt( f24_arg4, f24_arg2, "emblem", Engine.GetModelValue( Engine.GetModel( CoD.perController[f24_arg2].selectedEmblemModel, "emblemName" ) ), "", CoD.CraftUtility.Emblems.PublishEmblem )
	end
end

CoD.CraftUtility.GetWeaponGroupName = function ( f25_arg0 )
	local f25_local0 = CoD.GetCustomization( f25_arg0, "weapon_index" )
	local f25_local1 = ""
	if f25_local0 then
		f25_local1 = Engine.GetItemGroup( f25_local0, Enum.eModes.MODE_MULTIPLAYER )
	end
	return f25_local1
end

CoD.CraftUtility.Gunsmith.IsCurrentVariantChanged = function ( f26_arg0, f26_arg1 )
	if f26_arg1 then
		local f26_local0 = Engine.GetModel( f26_arg1, "variantIndex" )
		if f26_local0 then
			local f26_local1 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f26_arg0, Engine.GetModelValue( f26_local0 ) )
			for f26_local2 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
				if f26_local1.attachment[f26_local2] ~= Engine.GetModelValue( Engine.GetModel( f26_arg1, "attachment" .. f26_local2 ) ) then
					return true
				end
			end
		end
	end
	return false
end

CoD.CraftUtility.Gunsmith.ClearVariantStatType = function ( f27_arg0, f27_arg1 )
	local f27_local0 = f27_arg0.stats[f27_arg1]
	if f27_local0 then
		f27_local0:set( 0 )
	end
end

CoD.CraftUtility.Gunsmith.ClearVariantStats = function ( f28_arg0, f28_arg1, f28_arg2 )
	local f28_local0 = f28_arg1 + 1
	local f28_local1 = CoD.CraftUtility.Gunsmith.GetStatsStorageType( f28_arg2 )
	local f28_local2 = CoD.CraftUtility.GetDDLRoot( f28_arg0, f28_local1 )
	local f28_local3 = f28_local2.VariantStats[f28_local0]
	if f28_local2 and f28_local3 then
		CoD.CraftUtility.Gunsmith.ClearVariantStatType( f28_local3, "kills" )
		CoD.CraftUtility.Gunsmith.ClearVariantStatType( f28_local3, "deaths" )
		CoD.CraftUtility.Gunsmith.ClearVariantStatType( f28_local3, "deathsDuringUse" )
		CoD.CraftUtility.Gunsmith.ClearVariantStatType( f28_local3, "shots" )
		CoD.CraftUtility.Gunsmith.ClearVariantStatType( f28_local3, "hits" )
		CoD.CraftUtility.Gunsmith.ClearVariantStatType( f28_local3, "headshots" )
		CoD.CraftUtility.Gunsmith.ClearVariantStatType( f28_local3, "destroyed" )
		CoD.CraftUtility.Gunsmith.ClearVariantStatType( f28_local3, "backstabber_kill" )
		Engine.StorageWrite( f28_arg0, f28_local1 )
	end
end

CoD.CraftUtility.Gunsmith.GetStatsStorageType = function ( f29_arg0 )
	if f29_arg0 == Enum.eModes.MODE_CAMPAIGN then
		return Enum.StorageFileType.STORAGE_CP_STATS_ONLINE
	else
		return Enum.StorageFileType.STORAGE_MP_STATS_ONLINE
	end
end

CoD.CraftUtility.Gunsmith.GetSnapshotSessionMode = function ()
	local f30_local0 = Engine.GetModel( Engine.GetGlobalModel(), "GunsmithSnapshot.SessionMode" )
	local f30_local1 = Enum.eModes.MODE_MULTIPLAYER
	if f30_local0 then
		f30_local1 = Engine.GetModelValue( f30_local0 )
	end
	return f30_local1
end

CoD.CraftUtility.Gunsmith.GetRatio = function ( f31_arg0, f31_arg1 )
	local f31_local0 = f31_arg0
	if f31_arg1 ~= 0 then
		f31_local0 = f31_arg0 / f31_arg1
	end
	return f31_local0
end

CoD.CraftUtility.Gunsmith.GetVariantStatValue = function ( f32_arg0, f32_arg1 )
	local f32_local0 = f32_arg0.stats[f32_arg1]
	local f32_local1 = 0
	if f32_local0 then
		f32_local1 = f32_local0:get()
	end
	return f32_local1
end

CoD.CraftUtility.Gunsmith.GetWeaponStatValue = function ( f33_arg0, f33_arg1 )
	local f33_local0 = f33_arg0.stats[f33_arg1]
	local f33_local1 = 0
	if f33_local0 then
		local f33_local2 = f33_local0.statValue
		if f33_local2 then
			f33_local1 = f33_local2:get()
		end
	end
	return f33_local1
end

CoD.CraftUtility.Gunsmith.GetVariantStats = function ( f34_arg0, f34_arg1, f34_arg2, f34_arg3 )
	local f34_local0 = CoD.CraftUtility.GetDDLRoot( f34_arg0, CoD.CraftUtility.Gunsmith.GetStatsStorageType( f34_arg3 ) )
	local f34_local1 = f34_local0.VariantStats[f34_arg2]
	if f34_local0 and f34_local1 then
		if f34_arg1 == "accuracy" then
			return GunsmithAccuracyPercentage( CoD.CraftUtility.Gunsmith.GetRatio( CoD.CraftUtility.Gunsmith.GetVariantStatValue( f34_local1, "hits" ), CoD.CraftUtility.Gunsmith.GetVariantStatValue( f34_local1, "shots" ) ) )
		elseif f34_arg1 == "kd" then
			return CoD.CraftUtility.Gunsmith.GetRatio( CoD.CraftUtility.Gunsmith.GetVariantStatValue( f34_local1, "kills" ), CoD.CraftUtility.Gunsmith.GetVariantStatValue( f34_local1, "deathsDuringUse" ) )
		else
			return CoD.CraftUtility.Gunsmith.GetVariantStatValue( f34_local1, f34_arg1 )
		end
	else
		return 0
	end
end

CoD.CraftUtility.Gunsmith.GetWeaponStats = function ( f35_arg0, f35_arg1, f35_arg2, f35_arg3 )
	local f35_local0 = CoD.CraftUtility.GetDDLRoot( f35_arg0, CoD.CraftUtility.Gunsmith.GetStatsStorageType( f35_arg3 ) )
	local f35_local1 = f35_local0.ItemStats[f35_arg2]
	if f35_local0 and f35_local1 then
		if f35_arg1 == "accuracy" then
			return GunsmithAccuracyPercentage( CoD.CraftUtility.Gunsmith.GetRatio( CoD.CraftUtility.Gunsmith.GetWeaponStatValue( f35_local1, "hits" ), CoD.CraftUtility.Gunsmith.GetWeaponStatValue( f35_local1, "shots" ) ) )
		elseif f35_arg1 == "kd" then
			return CoD.CraftUtility.Gunsmith.GetRatio( CoD.CraftUtility.Gunsmith.GetWeaponStatValue( f35_local1, "kills" ), CoD.CraftUtility.Gunsmith.GetWeaponStatValue( f35_local1, "deathsDuringUse" ) )
		elseif f35_arg1 == "backstabber_kill" then
			return 0
		else
			return CoD.CraftUtility.Gunsmith.GetWeaponStatValue( f35_local1, f35_arg1 )
		end
	else
		
	end
end

CoD.CraftUtility.Gunsmith.GetWeaponStatList = function ( f36_arg0, f36_arg1, f36_arg2 )
	local f36_local0 = {}
	local f36_local1 = CoD.CraftUtility.GetWeaponGroupName( f36_arg0 )
	local f36_local2 = Engine.GetItemRef( f36_arg1, f36_arg2 )
	if f36_local2 == "launcher_lockonly" then
		f36_local0 = {
			"destroyed"
		}
	elseif f36_local1 == "weapon_launcher" then
		f36_local0 = {
			"kills",
			"destroyed"
		}
	elseif f36_local2 == "special_discgun" then
		f36_local0 = {
			"kills",
			"accuracy"
		}
		if f36_arg2 == Enum.eModes.MODE_MULTIPLAYER then
			table.insert( f36_local0, "kd" )
		end
	elseif f36_local1 == "weapon_knife" then
		f36_local0 = {
			"kills",
			"backstabber_kill",
			"kd"
		}
	else
		f36_local0 = {
			"kills",
			"headshots",
			"accuracy"
		}
		if f36_arg2 == Enum.eModes.MODE_MULTIPLAYER then
			table.insert( f36_local0, "kd" )
		end
	end
	return f36_local0
end

CoD.CraftUtility.Gunsmith.GetWeaponStatHeader = function ( f37_arg0 )
	if f37_arg0 == "kills" then
		return "MENU_GUNSMITH_KILLS_CAPS"
	elseif f37_arg0 == "headshots" then
		return "MENU_GUNSMITH_HEADSHOTS_CAPS"
	elseif f37_arg0 == "accuracy" then
		return "MENU_GUNSMITH_ACCURACY_CAPS"
	elseif f37_arg0 == "kd" then
		return "MENU_GUNSMITH_KD_CAPS"
	elseif f37_arg0 == "destroyed" then
		return "MENU_GUNSMITH_VEHICLES_DESTROYED_CAPS"
	elseif f37_arg0 == "backstabber_kill" then
		return "MENU_GUNSMITH_BACKSTABS_CAPS"
	else
		return "MENU_GUNSMITH_UNKNOWN_CAPS"
	end
end

CoD.CraftUtility.Gunsmith.WeaponHasNewOptics = function ( f38_arg0, f38_arg1 )
	if not IsProgressionEnabled( f38_arg0 ) then
		return false
	else
		return Engine.AreAnyOpticsNew( f38_arg0, f38_arg1 )
	end
end

CoD.CraftUtility.Gunsmith.WeaponHasNewNonOpticAttachments = function ( f39_arg0, f39_arg1 )
	if not IsProgressionEnabled( f39_arg0 ) then
		return false
	else
		return Engine.AreAnyNonOpticAttachmentsNew( f39_arg0, f39_arg1 )
	end
end

CoD.CraftUtility.Gunsmith.WeaponHasNewCamos = function ( f40_arg0, f40_arg1 )
	if not IsProgressionEnabled( f40_arg0 ) then
		return false
	end
	for f40_local0 = 0, Engine.GetWeaponOptionsCount(), 1 do
		if Engine.GetWeaponOptionGroupName( f40_local0 ) == Enum.eWeaponOptionGroup.WEAPONOPTION_GROUP_CAMO and Engine.IsWeaponOptionNew( f40_arg0, f40_arg1, f40_local0 ) then
			return true
		end
	end
end

CoD.CraftUtility.Gunsmith.WeaponHasAnyNewItems = function ( f41_arg0, f41_arg1 )
	if not IsProgressionEnabled( f41_arg0 ) then
		return false
	end
	local f41_local0 = CoD.CraftUtility.Gunsmith.WeaponHasNewOptics( f41_arg0, f41_arg1 )
	if not f41_local0 then
		f41_local0 = CoD.CraftUtility.Gunsmith.WeaponHasNewNonOpticAttachments( f41_arg0, f41_arg1 )
		if not f41_local0 then
			f41_local0 = CoD.CraftUtility.Gunsmith.WeaponHasNewCamos( f41_arg0, f41_arg1 )
		end
	end
	return f41_local0
end

CoD.CraftUtility.Gunsmith.GetBreadcrumbCountForWeaponGroup = function ( f42_arg0, f42_arg1 )
	if not IsProgressionEnabled( f42_arg0 ) then
		return 0
	end
	local f42_local0 = 0
	local f42_local1 = CoD.GetUnlockablesTable( f42_arg0 )
	for f42_local5, f42_local6 in ipairs( f42_local1[f42_arg1] ) do
		local f42_local7 = Engine.GetModelValue( Engine.GetModel( f42_local6, "itemIndex" ) )
		local f42_local8 = CoD.PrestigeUtility.GetPermanentUnlockMode()
		if f42_local7 > CoD.CACUtility.EmptyItemIndex and Engine.IsItemNew( f42_arg0, f42_local7, f42_local8 ) then
			f42_local0 = f42_local0 + 1
		end
		if not Engine.IsItemLocked( f42_arg0, f42_local7, f42_local8 ) and CoD.CraftUtility.Gunsmith.WeaponHasAnyNewItems( f42_arg0, f42_local7 ) then
			f42_local0 = f42_local0 + 1
		end
	end
	return f42_local0
end

CoD.CraftUtility.Gunsmith.AnyNewWeaponsOrAttachmentsForGroup = function ( f43_arg0, f43_arg1 )
	if not IsProgressionEnabled( f43_arg0 ) then
		return false
	end
	local f43_local0 = CoD.GetUnlockablesTable( f43_arg0 )
	for f43_local4, f43_local5 in ipairs( f43_local0[f43_arg1] ) do
		local f43_local6 = Engine.GetModelValue( Engine.GetModel( f43_local5, "itemIndex" ) )
		local f43_local7 = CoD.PrestigeUtility.GetPermanentUnlockMode()
		if f43_local6 > CoD.CACUtility.EmptyItemIndex and Engine.IsItemNew( f43_arg0, f43_local6, f43_local7 ) then
			return true
		elseif not Engine.IsItemLocked( f43_arg0, f43_local6, f43_local7 ) and CoD.CraftUtility.Gunsmith.WeaponHasAnyNewItems( f43_arg0, f43_local6 ) then
			return true
		end
	end
	return false
end

CoD.CraftUtility.Gunsmith.GetSortedAttachmentList = function ( f44_arg0, f44_arg1 )
	local f44_local0 = {
		baseAttachmentList = {},
		attachmentVariantList = {}
	}
	local f44_local1 = 1
	local f44_local2 = 0
	for f44_local3 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
		local f44_local6 = Engine.GetModel( f44_arg1, "attachment" .. f44_local3 )
		if f44_local6 then
			local f44_local7 = Engine.GetModelValue( f44_local6 )
			if f44_local1 == f44_local3 or f44_local7 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				table.insert( f44_local0.baseAttachmentList, f44_local7 )
				local f44_local8 = Engine.GetModel( f44_arg1, "attachmentVariant" .. f44_local3 )
				if f44_local8 then
					table.insert( f44_local0.attachmentVariantList, Engine.GetModelValue( f44_local8 ) )
				end
				f44_local2 = f44_local2 + 1
			end
		end
	end
	for f44_local3 = f44_local2 + 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
		local f44_local9 = f44_local3
		table.insert( f44_local0.baseAttachmentList, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		table.insert( f44_local0.attachmentVariantList, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
	end
	return f44_local0
end

CoD.CraftUtility.Gunsmith.GetAttachmentIconList = function ( f45_arg0, f45_arg1, f45_arg2, f45_arg3 )
	return DataSourceHelpers.ListSetup( f45_arg1, function ( f46_arg0 )
		local f46_local0 = {}
		local f46_local1 = Enum.eModes.MODE_MULTIPLAYER
		for f46_local6, f46_local7 in ipairs( f45_arg3 ) do
			if f46_local7 > CoD.CACUtility.EmptyItemIndex then
				local f46_local5 = Engine.GetAttachmentIndexByAttachmentTableIndex( f45_arg2, f46_local7, f46_local1 )
				if f46_local5 > CoD.CACUtility.EmptyItemIndex then
					table.insert( f46_local0, {
						models = {
							image = Engine.GetAttachmentImage( f45_arg2, f46_local5, f46_local1 ) .. "_wv_icon"
						}
					} )
				end
			end
		end
		f46_local2 = 0
		f46_local3 = CoD.CraftUtility.GetLoadoutSlot( f46_arg0 ) == "primary"
		f46_local4 = "cac_mods_primary_gunfighter_wv_icon"
		if f46_local3 then
			f46_local4 = "cac_mods_primary_gunfighter_wv_icon"
			f46_local6 = 4
			for f46_local7 = 0, 2, 1 do
				if f45_arg3[f46_local6 + f46_local7] > CoD.CACUtility.EmptyItemIndex then
					f46_local2 = f46_local2 + 1
				end
			end
		else
			f46_local4 = "cac_mods_secondary_gunfighter_wv_icon"
			if f45_arg3[3] > CoD.CACUtility.EmptyItemIndex then
				f46_local2 = 1
				while f46_local2 > 0 do
					table.insert( f46_local0, {
						models = {
							image = f46_local4
						}
					} )
					f46_local2 = f46_local2 - 1
				end
				return f46_local0
			end
		end
	end
	, true )
end

CoD.CraftUtility.Gunsmith.GetFileType = function ()
	local f47_local0 = CoD.CraftUtility.Gunsmith.FileType
	if not f47_local0 then
		f47_local0 = Enum.StorageFileType.STORAGE_GUNSMITH
	end
	return f47_local0
end

CoD.CraftUtility.Gunsmith.GetTotalAllowedVaraints = function ()
	return CoD.CraftUtility.Gunsmith.TotalVariants
end

CoD.CraftUtility.Gunsmith.GetMaxVariantCount = function ( f49_arg0, f49_arg1 )
	local f49_local0 = CoD.CraftUtility.GetDDLRoot( f49_arg0, f49_arg1 )
	local f49_local1 = 0
	if f49_local0 ~= nil then
		local f49_local2 = #f49_local0.variant
		if CoD.CraftUtility.Gunsmith.FileType == Enum.StorageFileType.STORAGE_GUNSMITH then
			if Dvar.gunsmith_totalvariants:exists() then
				local f49_local3 = MediaManagerGetQuotaForCategory( f49_arg0, "variant" )
				local f49_local4 = f49_local3.categoryQuota
				if f49_local2 < f49_local4 then
					error( "Gunsmith DDL: DDL does not support " .. f49_local4 .. " variants." )
					return 0
				end
				f49_local1 = math.min( f49_local2, f49_local4 )
			end
		else
			f49_local1 = f49_local2
		end
	end
	return f49_local1
end

CoD.CraftUtility.Gunsmith.GetTotalUsedWeaponVariantsByWeaponGroup = function ( f50_arg0 )
	local f50_local0 = CoD.CraftUtility.Gunsmith.CachedVariants
	local f50_local1 = 0
	for f50_local2 = 1, #f50_local0, 1 do
		if f50_local0[f50_local2].weaponIndex and Engine.GetWeaponGroup( f50_local0[f50_local2].weaponIndex, Enum.eModes.MODE_MULTIPLAYER ) == tonumber( f50_arg0 ) then
			f50_local1 = f50_local1 + 1
		end
	end
	return f50_local1
end

CoD.CraftUtility.Gunsmith.GetTotalUsedWeaponVariants = function ( f51_arg0 )
	local f51_local0 = CoD.CraftUtility.Gunsmith.CachedVariants
	local f51_local1 = 0
	for f51_local2 = 1, #f51_local0, 1 do
		if f51_local0[f51_local2].weaponIndex == f51_arg0 then
			f51_local1 = f51_local1 + 1
		end
	end
	return f51_local1
end

CoD.CraftUtility.Gunsmith.GetTotalUsedVariants = function ()
	local f52_local0 = CoD.CraftUtility.Gunsmith.CachedVariants
	local f52_local1 = 0
	for f52_local2 = 1, #f52_local0, 1 do
		if f52_local0[f52_local2].weaponIndex ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
			f52_local1 = f52_local1 + 1
		end
	end
	return f52_local1
end

CoD.CraftUtility.Gunsmith.ParseDDL = function ( f53_arg0, f53_arg1 )
	local f53_local0 = CoD.CraftUtility.GetDDLRoot( f53_arg0, f53_arg1 )
	CoD.CraftUtility.Gunsmith.FileType = f53_arg1
	if f53_local0 == nil then
		CoD.CraftUtility.Gunsmith.CachedVariants = {}
		return false
	end
	local f53_local1 = CoD.CraftUtility.Gunsmith.GetMaxVariantCount( f53_arg0, f53_arg1 )
	CoD.CraftUtility.Gunsmith.TotalVariants = f53_local1
	for f53_local2 = 0, f53_local1 - 1, 1 do
		local f53_local5 = {}
		local f53_local6 = f53_local0.variant[f53_local2]
		f53_local5.weaponIndex = f53_local6.weaponIndex:get()
		f53_local5.variantIndex = f53_local6.variantIndex:get()
		f53_local5.sortIndex = f53_local6.sortIndex:get()
		f53_local5.readOnly = f53_local6.readOnly:get()
		if f53_local6.createTime ~= nil then
			f53_local5.createTime = Engine.GetLocalizedTimeStr( f53_local6.createTime:get() )
		end
		CoD.CraftUtility.Gunsmith.CachedVariants[f53_local2 + 1] = f53_local5
	end
	return true
end

CoD.CraftUtility.Gunsmith.PublishVariant = function ( f54_arg0 )
	local f54_local0 = CoD.perController[f54_arg0].gunsmithVariantModel
	Engine.PublishVariant( f54_arg0, "variant", Engine.GetModelValue( Engine.GetModel( f54_local0, "variantIndex" ) ), Engine.GetModelValue( Engine.GetModel( f54_local0, "paintjobSlot" ) ), Engine.GetModelValue( Engine.GetModel( f54_local0, "paintjobIndex" ) ), Engine.GetModelValue( Engine.GetModel( f54_local0, "weaponIndex" ) ), CoD.FileshareUtility.GetPublishName(), CoD.FileshareUtility.GetPublishAllowDownload() )
end

CoD.CraftUtility.Gunsmith.GetHighestSortIndexForWeapon = function ( f55_arg0 )
	local f55_local0 = CoD.CraftUtility.Gunsmith.CachedVariants
	local f55_local1 = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
	for f55_local2 = 1, #f55_local0, 1 do
		if f55_local0[f55_local2].weaponIndex == f55_arg0 then
			local f55_local5 = f55_local0[f55_local2].sortIndex
			if f55_local1 < f55_local5 then
				f55_local1 = f55_local5
			end
		end
	end
	return f55_local1
end

CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList = function ( f56_arg0, f56_arg1 )
	local f56_local0 = CoD.CraftUtility.Gunsmith.CachedVariants
	local f56_local1 = 0
	local f56_local2 = {}
	local f56_local3 = false
	for f56_local4 = 1, #f56_local0, 1 do
		local f56_local7 = f56_local0[f56_local4]
		if f56_arg1 then
			if not (f56_arg1 ~= "" or f56_local0[f56_local4].weaponIndex == 0) or Engine.GetWeaponGroup( f56_local0[f56_local4].weaponIndex, Enum.eModes.MODE_MULTIPLAYER ) == tonumber( f56_arg1 ) then
				table.insert( f56_local2, f56_local7 )
			end
		end
		if f56_arg0 == nil and f56_local7.weaponIndex ~= 0 then
			table.insert( f56_local2, f56_local7 )
		end
		if f56_local0[f56_local4].weaponIndex == CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX and not f56_local3 then
			f56_local7.sortIndex = CoD.CraftUtility.Gunsmith.GetHighestSortIndexForWeapon( f56_arg0 ) + 1
			f56_local3 = true
			table.insert( f56_local2, f56_local7 )
		end
		if f56_local0[f56_local4].weaponIndex == f56_arg0 then
			table.insert( f56_local2, f56_local7 )
		end
	end
	table.sort( f56_local2, function ( f57_arg0, f57_arg1 )
		return f57_arg1.sortIndex < f57_arg0.sortIndex
	end )
	return f56_local2
end

CoD.CraftUtility.Gunsmith.AreMaxVariantSlotsUsed = function ()
	local f58_local0 = CoD.CraftUtility.Gunsmith.CachedVariants
	local f58_local1 = true
	for f58_local2 = 1, #f58_local0, 1 do
		if f58_local0[f58_local2].weaponIndex == CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
			f58_local1 = false
			break
		end
	end
	return f58_local1
end

CoD.CraftUtility.Gunsmith.GetEmptyTable = function ( f59_arg0 )
	local f59_local0 = {}
	for f59_local1 = 1, f59_arg0, 1 do
		local f59_local4 = f59_local1
		table.insert( f59_local0, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
	end
	return f59_local0
end

CoD.CraftUtility.Gunsmith.GetVariantByIndex = function ( f60_arg0, f60_arg1 )
	local f60_local0 = CoD.CraftUtility.GetDDLRoot( f60_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	local f60_local1 = {
		attachment = CoD.CraftUtility.Gunsmith.GetEmptyTable( CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS ),
		attachmentVariant = CoD.CraftUtility.Gunsmith.GetEmptyTable( CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS ),
		variantName = "",
		camoIndex = CoD.CraftUtility.Gunsmith.CAMO_NONE,
		reticleIndex = CoD.CraftUtility.Gunsmith.RETICLE_NONE,
		paintjobSlot = Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT,
		paintjobIndex = Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX
	}
	local f60_local2 = CoD.GetCustomization( f60_arg0, "weapon_index" )
	if not f60_local2 then
		f60_local2 = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
	end
	f60_local1.weaponIndex = f60_local2
	f60_local1.variantIndex = f60_arg1
	f60_local1.sortIndex = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
	if f60_local0 ~= nil and f60_local0.variant ~= nil then
		f60_local2 = f60_local0.variant[f60_arg1]
		f60_local1.attachment = {}
		f60_local1.attachmentVariant = {}
		f60_local1.variantName = f60_local2.variantName:get()
		f60_local1.camoIndex = f60_local2.camoIndex:get()
		f60_local1.reticleIndex = f60_local2.reticleIndex:get()
		f60_local1.paintjobSlot = f60_local2.paintjobSlot:get()
		f60_local1.paintjobIndex = f60_local2.paintjobIndex:get()
		f60_local1.weaponIndex = f60_local2.weaponIndex:get()
		f60_local1.variantIndex = f60_local2.variantIndex:get()
		f60_local1.sortIndex = f60_local2.sortIndex:get()
		f60_local1.readOnly = f60_local2.readOnly:get()
		f60_local1.cacVariantIndex = f60_local2.variantIndex:get() + 1
		if f60_local2.createTime ~= nil then
			f60_local1.createTime = Engine.GetLocalizedTimeStr( f60_local2.createTime:get() )
		end
		for f60_local3 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			table.insert( f60_local1.attachment, f60_local2.attachment[f60_local3 - 1]:get() )
		end
		for f60_local3 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			table.insert( f60_local1.attachmentVariant, f60_local2.attachmentVariant[f60_local3 - 1]:get() )
		end
	end
	return f60_local1
end

CoD.CraftUtility.Gunsmith.GetVariantIndexFromCACVaraintIndex = function ( f61_arg0, f61_arg1 )
	return CoD.CraftUtility.Gunsmith.GetVariantByIndex( f61_arg0, f61_arg1 - 1 )
end

CoD.CraftUtility.Gunsmith.IsVariantIndexOccupied = function ( f62_arg0 )
	if CoD.CraftUtility.Gunsmith.CachedVariants[f62_arg0 + 1].weaponIndex ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
		return true
	else
		return false
	end
end

CoD.CraftUtility.Gunsmith.WriteVariantAttachmentDataToDDL = function ( f63_arg0, f63_arg1 )
	local f63_local0 = CoD.CraftUtility.GetDDLRoot( f63_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	if f63_local0 and f63_arg1 then
		local f63_local1 = f63_local0.variant[Engine.GetModelValue( Engine.GetModel( f63_arg1, "variantIndex" ) )]
		if f63_local1 then
			local f63_local2 = CoD.CraftUtility.Gunsmith.GetSortedAttachmentList( f63_arg0, f63_arg1 )
			for f63_local3 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
				local f63_local6 = f63_local2.baseAttachmentList[f63_local3]
				local f63_local7 = f63_local2.attachmentVariantList[f63_local3]
				if f63_local6 and f63_local7 then
					f63_local1.attachment[f63_local3 - 1]:set( f63_local6 )
					f63_local1.attachmentVariant[f63_local3 - 1]:set( f63_local7 )
				end
			end
		end
	end
end

CoD.CraftUtility.Gunsmith.WriteVaraintDataToDDL = function ( f64_arg0, f64_arg1 )
	local f64_local0 = CoD.CraftUtility.GetDDLRoot( f64_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	if f64_local0 ~= nil and f64_local0.variant ~= nil then
		local f64_local1 = f64_local0.variant[Engine.GetModelValue( Engine.GetModel( f64_arg1, "variantIndex" ) )]
		f64_local1.variantName:set( Engine.GetModelValue( Engine.GetModel( f64_arg1, "variantName" ) ) )
		f64_local1.camoIndex:set( Engine.GetModelValue( Engine.GetModel( f64_arg1, "camoIndex" ) ) )
		f64_local1.reticleIndex:set( Engine.GetModelValue( Engine.GetModel( f64_arg1, "reticleIndex" ) ) )
		f64_local1.paintjobSlot:set( Engine.GetModelValue( Engine.GetModel( f64_arg1, "paintjobSlot" ) ) )
		f64_local1.paintjobIndex:set( Engine.GetModelValue( Engine.GetModel( f64_arg1, "paintjobIndex" ) ) )
		f64_local1.sortIndex:set( Engine.GetModelValue( Engine.GetModel( f64_arg1, "sortIndex" ) ) )
		f64_local1.createTime:set( Engine.GetCurrentUTCTimeStr() )
		f64_local1.weaponIndex:set( Engine.GetModelValue( Engine.GetModel( f64_arg1, "weaponIndex" ) ) )
		CoD.CraftUtility.Gunsmith.WriteVariantAttachmentDataToDDL( f64_arg0, f64_arg1 )
		CoD.CraftUtility.UploadAndParseBuffer( f64_arg0, Enum.StorageFileType.STORAGE_GUNSMITH )
	end
end

CoD.CraftUtility.Gunsmith.RenameVariant = function ( f65_arg0, f65_arg1, f65_arg2 )
	local f65_local0 = CoD.CraftUtility.GetDDLRoot( f65_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	if f65_local0 ~= nil then
		f65_local0.variant[f65_arg1].variantName:set( f65_arg2 )
		CoD.CraftUtility.UploadAndParseBuffer( f65_arg0, Enum.StorageFileType.STORAGE_GUNSMITH )
	end
end

CoD.CraftUtility.Gunsmith.ClearVariant = function ( f66_arg0, f66_arg1 )
	local f66_local0 = CoD.CraftUtility.GetDDLRoot( f66_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	if f66_local0 ~= nil then
		local f66_local1 = f66_local0.variant[f66_arg1]
		if f66_local1 then
			f66_local1.variantName:set( "" )
			f66_local1.variantIndex:set( f66_arg1 )
			f66_local1.camoIndex:set( CoD.CraftUtility.Gunsmith.CAMO_NONE )
			f66_local1.reticleIndex:set( CoD.CraftUtility.Gunsmith.RETICLE_NONE )
			f66_local1.paintjobSlot:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
			f66_local1.paintjobIndex:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
			f66_local1.weaponIndex:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
			f66_local1.sortIndex:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
			f66_local1.readOnly:set( CoD.CraftUtility.DEFAULT_READ_ONLY_FLAG )
			for f66_local2 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
				f66_local1.attachment[f66_local2 - 1]:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
			end
			for f66_local2 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
				f66_local1.attachmentVariant[f66_local2 - 1]:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
			end
			CoD.CraftUtility.UploadAndParseBuffer( f66_arg0, Enum.StorageFileType.STORAGE_GUNSMITH )
		end
	end
end

CoD.CraftUtility.Gunsmith.GetEmptyVariantIndex = function ()
	local f67_local0 = CoD.CraftUtility.Gunsmith.CachedVariants
	for f67_local1 = 1, #f67_local0, 1 do
		local f67_local4 = f67_local0[f67_local1]
		if f67_local0[f67_local1].weaponIndex == CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
			return f67_local0[f67_local1].variantIndex
		end
	end
end

CoD.CraftUtility.Gunsmith.Copy = function ( f68_arg0, f68_arg1 )
	local f68_local0 = CoD.CraftUtility.GetDDLRoot( f68_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	local f68_local1 = CoD.CraftUtility.Gunsmith.GetEmptyVariantIndex()
	if f68_local0 ~= nil and f68_local1 >= 0 then
		local f68_local2 = f68_local0.variant[f68_arg1]
		local f68_local3 = f68_local0.variant[f68_local1]
		f68_local3.variantName:set( f68_local2.variantName:get() )
		f68_local3.camoIndex:set( f68_local2.camoIndex:get() )
		f68_local3.reticleIndex:set( f68_local2.reticleIndex:get() )
		f68_local3.paintjobSlot:set( f68_local2.paintjobSlot:get() )
		f68_local3.paintjobIndex:set( f68_local2.paintjobIndex:get() )
		f68_local3.weaponIndex:set( f68_local2.weaponIndex:get() )
		for f68_local4 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			f68_local3.attachment[f68_local4 - 1]:set( f68_local2.attachment[f68_local4 - 1]:get() )
		end
		for f68_local4 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			f68_local3.attachmentVariant[f68_local4 - 1]:set( f68_local2.attachmentVariant[f68_local4 - 1]:get() )
		end
		f68_local3.sortIndex:set( CoD.CraftUtility.Gunsmith.GetHighestSortIndexForWeapon( f68_local2.weaponIndex:get() ) + 1 )
		CoD.CraftUtility.UploadAndParseBuffer( f68_arg0, Enum.StorageFileType.STORAGE_GUNSMITH )
		return f68_local1
	else
		
	end
end

CoD.CraftUtility.Gunsmith.AddAttachmentToWeapon = function ( f69_arg0, f69_arg1 )
	if f69_arg1 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
		f69_arg0 = f69_arg0 .. "+" .. Engine.GetAttachmentRefByIndex( f69_arg1 )
	end
	return f69_arg0
end

CoD.CraftUtility.Gunsmith.AddAttachmentVariant = function ( f70_arg0, f70_arg1, f70_arg2 )
	if not f70_arg1 or not f70_arg2 then
		return f70_arg0
	else
		local f70_local0 = Engine.GetAttachmentRefByIndex( f70_arg1 )
		if not f70_local0 then
			return f70_arg0
		else
			return f70_arg0 .. f70_local0 .. "," .. f70_arg2 .. ","
		end
	end
end

CoD.CraftUtility.Gunsmith.GetWeaponByVariantIndex = function ( f71_arg0, f71_arg1 )
	local f71_local0 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f71_arg0, f71_arg1 )
	local f71_local1 = Engine.GetItemRef( f71_local0.weaponIndex, Enum.eModes.MODE_MULTIPLAYER )
	if f71_local0.weaponIndex == 0 then
		f71_local1 = Engine.GetItemRef( CoD.GetCustomization( f71_arg0, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	end
	local f71_local2 = f71_local1 .. CoD.CraftUtility.GetModeAbbreviation()
	if f71_local0.weaponIndex ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
		for f71_local3 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			f71_local2 = CoD.CraftUtility.Gunsmith.AddAttachmentToWeapon( f71_local2, f71_local0.attachment[f71_local3] )
		end
	end
	return f71_local2
end

CoD.CraftUtility.Gunsmith.GetAttachmentVariantByVariantIndex = function ( f72_arg0, f72_arg1 )
	local f72_local0 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f72_arg0, f72_arg1 )
	local f72_local1 = Engine.GetItemRef( f72_local0.weaponIndex, Enum.eModes.MODE_MULTIPLAYER )
	if f72_local0.weaponIndex == 0 then
		f72_local1 = Engine.GetItemRef( CoD.GetCustomization( f72_arg0, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	end
	local f72_local2 = ""
	if f72_local0.weaponIndex ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
		for f72_local3 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f72_local6 = f72_local0.attachment[f72_local3]
			if f72_local6 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				f72_local2 = CoD.CraftUtility.Gunsmith.AddAttachmentVariant( f72_local2, f72_local6, f72_local0.attachmentVariant[f72_local3] )
			end
		end
	end
	return f72_local2
end

CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant = function ( f73_arg0, f73_arg1 )
	local f73_local0 = Engine.GetItemRef( CoD.GetCustomization( f73_arg0, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER ) .. CoD.CraftUtility.GetModeAbbreviation()
	if f73_arg1 then
		for f73_local1 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			f73_local0 = CoD.CraftUtility.Gunsmith.AddAttachmentToWeapon( f73_local0, Engine.GetModelValue( Engine.GetModel( f73_arg1, "attachment" .. f73_local1 ) ) )
		end
	end
	return f73_local0
end

CoD.CraftUtility.Gunsmith.GetWeaponAttachmentList = function ( f74_arg0, f74_arg1 )
	local f74_local0 = CoD.GetCustomization( f74_arg0, "weapon_index" )
	local f74_local1 = Engine.GetItemRef( f74_local0, Enum.eModes.MODE_MULTIPLAYER )
	local f74_local2 = {}
	if f74_arg1 then
		for f74_local3 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f74_local6 = Engine.GetModelValue( Engine.GetModel( f74_arg1, "attachment" .. f74_local3 ) )
			if f74_local6 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				table.insert( f74_local2, {
					index = Engine.GetAttachmentIndexByAttachmentTableIndex( f74_local0, f74_local6, Enum.eModes.MODE_MULTIPLAYER ),
					ref = Engine.GetAttachmentRefByIndex( f74_local6 )
				} )
			end
		end
	end
	return f74_local2
end

CoD.CraftUtility.Gunsmith.GetWeaponAttachmentVariantString = function ( f75_arg0, f75_arg1 )
	local f75_local0 = Engine.GetItemRef( CoD.GetCustomization( f75_arg0, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	local f75_local1 = ""
	if f75_arg1 then
		for f75_local2 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f75_local5 = Engine.GetModelValue( Engine.GetModel( f75_arg1, "attachment" .. f75_local2 ) )
			if f75_local5 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				f75_local1 = CoD.CraftUtility.Gunsmith.AddAttachmentVariant( f75_local1, f75_local5, Engine.GetModelValue( Engine.GetModel( f75_arg1, "attachmentVariant" .. f75_local2 ) ) )
			end
		end
	end
	return f75_local1
end

CoD.CraftUtility.Gunsmith.GetWeaponAttachmentStringWithoutVariants = function ( f76_arg0, f76_arg1 )
	local f76_local0 = Engine.GetItemRef( CoD.GetCustomization( f76_arg0, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	local f76_local1 = ""
	if f76_arg1 then
		for f76_local2 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f76_local5 = Engine.GetModelValue( Engine.GetModel( f76_arg1, "attachment" .. f76_local2 ) )
			if f76_local5 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				f76_local1 = CoD.CraftUtility.Gunsmith.AddAttachmentVariant( f76_local1, f76_local5, 0 )
			end
		end
	end
	return f76_local1
end

CoD.CraftUtility.Gunsmith.GetAttachmentVariantStringWithSelectedVariant = function ( f77_arg0, f77_arg1, f77_arg2, f77_arg3 )
	local f77_local0 = Engine.GetItemRef( CoD.GetCustomization( f77_arg0, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	local f77_local1 = ""
	if f77_arg1 then
		for f77_local2 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f77_local5 = Engine.GetModelValue( Engine.GetModel( f77_arg1, "attachment" .. f77_local2 ) )
			if f77_local5 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				local f77_local6 = Engine.GetModelValue( Engine.GetModel( f77_arg1, "attachmentVariant" .. f77_local2 ) )
				if f77_arg2 == f77_local5 then
					f77_local1 = CoD.CraftUtility.Gunsmith.AddAttachmentVariant( f77_local1, f77_local5, f77_arg3 )
				else
					f77_local1 = CoD.CraftUtility.Gunsmith.AddAttachmentVariant( f77_local1, f77_local5, f77_local6 )
				end
			end
		end
	end
	return f77_local1
end

CoD.CraftUtility.Gunsmith.DisplayBaseWeapon = function ( f78_arg0, f78_arg1, f78_arg2 )
	local f78_local0 = CoD.GetCustomization( f78_arg2, "weapon_index" )
	local f78_local1 = true
	local f78_local2 = nil
	if f78_local1 and CoD.perController[f78_arg2].editingWeaponBuildKits then
		f78_local1 = not IsCACItemLocked( f78_arg0, f78_arg1, f78_arg2 )
	end
	local f78_local3 = Engine.GetItemRef( f78_local0, Enum.eModes.MODE_MULTIPLAYER ) .. CoD.CraftUtility.GetModeAbbreviation()
	Engine.SendClientScriptNotify( f78_arg2, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f78_arg2 ), CoD.CraftUtility.GetLoadoutSlot( f78_arg2 ), f78_local3, CoD.CACUtility.GetCameraNameForAttachments( f78_local3 ), "0,0,0", f78_local2, f78_local1 )
end

CoD.CraftUtility.Gunsmith.DisplayWeaponWithPaintjob = function ( f79_arg0, f79_arg1, f79_arg2 )
	local f79_local0 = Engine.GetItemRef( CoD.GetCustomization( f79_arg0, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER ) .. CoD.CraftUtility.GetModeAbbreviation()
	local f79_local1 = CoD.CraftUtility.GetLoadoutSlot( f79_arg0 )
	local f79_local2 = CoD.CACUtility.GetCameraNameForAttachments( f79_local0 )
	Engine.SetupPaintjobData( f79_arg0, f79_arg2, f79_arg1 )
	Engine.SendClientScriptNotify( f79_arg0, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f79_arg0 ), f79_local1, f79_local0, f79_local2, "0,0,1" )
end

CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant = function ( f80_arg0, f80_arg1, f80_arg2, f80_arg3, f80_arg4, f80_arg5 )
	if f80_arg1 then
		local f80_local0 = CoD.CraftUtility.GetLoadoutSlot( f80_arg0 )
		local f80_local1 = CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant( f80_arg0, f80_arg1 )
		local f80_local2 = CoD.CACUtility.GetCameraNameForAttachments( f80_local1, f80_arg2 )
		if f80_arg5 == nil then
			f80_arg5 = Engine.GetModelValue( Engine.GetModel( f80_arg1, "camoIndex" ) )
		end
		if f80_arg3 == nil then
			f80_arg3 = Engine.GetModelValue( Engine.GetModel( f80_arg1, "paintjobSlot" ) )
		end
		if f80_arg4 == nil then
			f80_arg4 = Engine.GetModelValue( Engine.GetModel( f80_arg1, "paintjobIndex" ) )
		end
		Engine.SetupPaintjobData( f80_arg0, f80_arg3, f80_arg4 )
		Engine.SendClientScriptNotify( f80_arg0, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f80_arg0 ), f80_local0, f80_local1, f80_local2, f80_arg5 .. ",0,1", CoD.CraftUtility.Gunsmith.GetWeaponAttachmentVariantString( f80_arg0, f80_arg1 ) )
	end
end

CoD.CraftUtility.Gunsmith.GetVariantAttachmentList = function ( f81_arg0, f81_arg1 )
	local f81_local0 = {}
	if f81_arg1 then
		for f81_local1 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			table.insert( f81_local0, Engine.GetModelValue( Engine.GetModel( f81_arg1, "attachment" .. f81_local1 ) ) )
		end
	end
	return f81_local0
end

CoD.CraftUtility.Gunsmith.ClearVariantSlotByAttachmentIndex = function ( f82_arg0, f82_arg1, f82_arg2 )
	if f82_arg1 then
		for f82_local0 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f82_local3 = Engine.GetModel( f82_arg1, "attachment" .. f82_local0 )
			local f82_local4 = Engine.GetModelValue( f82_local3 )
			local f82_local5 = Engine.GetModel( f82_arg1, "attachmentVariant" .. f82_local0 )
			if f82_arg2 == f82_local4 then
				Engine.SetModelValue( f82_local5, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
				Engine.SetModelValue( f82_local3, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
				if f82_local0 == 1 then
					Engine.SetModelValue( Engine.GetModel( f82_arg1, "reticleIndex" ), CoD.CraftUtility.Gunsmith.RETICLE_NONE )
				end
			end
		end
	end
end

CoD.CraftUtility.Gunsmith.IsFocusAttachmentEquipped = function ( f83_arg0, f83_arg1, f83_arg2 )
	if f83_arg1 then
		for f83_local0 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			if f83_arg2 == Engine.GetModelValue( Engine.GetModel( f83_arg1, "attachment" .. f83_local0 ) ) then
				return true
			end
		end
	end
end

CoD.CraftUtility.Gunsmith.SetFocusAttachmentVariant = function ( f84_arg0, f84_arg1, f84_arg2, f84_arg3 )
	if f84_arg1 then
		for f84_local0 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f84_local3 = Engine.GetModelValue( Engine.GetModel( f84_arg1, "attachment" .. f84_local0 ) )
			local f84_local4 = Engine.GetModel( f84_arg1, "attachmentVariant" .. f84_local0 )
			if f84_arg2 == f84_local3 then
				Engine.SetModelValue( f84_local4, f84_arg3 )
			end
		end
	end
end

CoD.CraftUtility.Gunsmith.InvalidateRender = function ( f85_arg0, f85_arg1 )
	CoD.CraftUtility.InvalidateWCItemRender( Engine.GetModelValue( Engine.GetModel( f85_arg1, "paintjobSlot" ) ), Engine.GetModelValue( Engine.GetModel( f85_arg1, "paintjobIndex" ) ) )
end

CoD.CraftUtility.Paintjobs = {}
CoD.CraftUtility.Paintjobs.CachedPaintjobs = {}
CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX = 0
CoD.CraftUtility.Paintjobs.GetPrevViewIndex = function ( f86_arg0 )
	local f86_local0 = CoD.CraftUtility.GetWeaponGroupName( f86_arg0 )
	local f86_local1 = #CoD.Paintshop.View
	local f86_local2 = CoD.perController[f86_arg0].viewIndex - 1
	if f86_local2 == 0 then
		f86_local2 = f86_local1
	end
	local f86_local3 = Engine.GetItemRef( CoD.GetCustomization( f86_arg0, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	if (f86_local0 == "weapon_knife" or f86_local3 == "special_crossbow" or f86_local3 == "ar_m16" or f86_local3 == "ar_galil" or f86_local3 == "lmg_rpk" or f86_local3 == "smg_sten2" or f86_local3 == "knife_ballistic") and f86_local2 == 2 then
		f86_local2 = f86_local2 - 1
	end
	return f86_local2
end

CoD.CraftUtility.Paintjobs.GetNextViewIndex = function ( f87_arg0 )
	local f87_local0 = CoD.CraftUtility.GetWeaponGroupName( f87_arg0 )
	local f87_local1 = CoD.perController[f87_arg0].viewIndex % #CoD.Paintshop.View + 1
	local f87_local2 = Engine.GetItemRef( CoD.GetCustomization( f87_arg0, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	if (f87_local0 == "weapon_knife" or f87_local2 == "special_crossbow" or f87_local2 == "ar_m16" or f87_local2 == "ar_galil" or f87_local2 == "lmg_rpk" or f87_local2 == "smg_sten2" or f87_local2 == "knife_ballistic") and f87_local1 == 2 then
		f87_local1 = f87_local1 + 1
	end
	return f87_local1
end

CoD.CraftUtility.Paintjobs.GetTotalWeaponPaintjobs = function ( f88_arg0 )
	local f88_local0 = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local f88_local1 = 0
	local f88_local2 = Engine.GetPaintjobSlotInfo()
	local f88_local3 = f88_local2.slot_count
	local f88_local4 = f88_local2.paintjobs_per_slot
	for f88_local5 = 0, f88_local3 - 1, 1 do
		local f88_local8 = f88_local0[f88_local5]
		if f88_local8 then
			for f88_local9 = 0, f88_local4 - 1, 1 do
				local f88_local12 = f88_local8[f88_local9]
				if f88_local12 and f88_local12.weaponIndex == f88_arg0 and f88_arg0 ~= CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX then
					f88_local1 = f88_local1 + 1
				end
			end
		end
	end
	return f88_local1
end

CoD.CraftUtility.Paintjobs.GetTotalWeaponPaintjobsByWeaponGroup = function ( f89_arg0 )
	local f89_local0 = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local f89_local1 = 0
	local f89_local2 = Engine.GetPaintjobSlotInfo()
	local f89_local3 = f89_local2.slot_count
	local f89_local4 = f89_local2.paintjobs_per_slot
	for f89_local5 = 0, f89_local3 - 1, 1 do
		local f89_local8 = f89_local0[f89_local5]
		if f89_local8 then
			for f89_local9 = 0, f89_local4 - 1, 1 do
				local f89_local12 = f89_local8[f89_local9]
				if f89_local12 and Engine.GetWeaponGroup( f89_local12.weaponIndex, Enum.eModes.MODE_MULTIPLAYER ) == tonumber( f89_arg0 ) then
					f89_local1 = f89_local1 + 1
				end
			end
		end
	end
	return f89_local1
end

CoD.CraftUtility.Paintjobs.GetTotalUsedPaintjobs = function ()
	local f90_local0 = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local f90_local1 = 0
	local f90_local2 = Engine.GetPaintjobSlotInfo()
	local f90_local3 = f90_local2.slot_count
	local f90_local4 = f90_local2.paintjobs_per_slot
	for f90_local5 = 0, f90_local3 - 1, 1 do
		local f90_local8 = f90_local0[f90_local5]
		if f90_local8 then
			for f90_local9 = 0, f90_local4 - 1, 1 do
				local f90_local12 = f90_local8[f90_local9]
				if f90_local12 and f90_local12.weaponIndex ~= CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX then
					f90_local1 = f90_local1 + 1
				end
			end
		end
	end
	return f90_local1
end

CoD.CraftUtility.Paintjobs.GetHighestSortIndexForWeapon = function ( f91_arg0 )
	local f91_local0 = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local f91_local1 = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
	local f91_local2 = Engine.GetPaintjobSlotInfo()
	local f91_local3 = f91_local2.slot_count
	local f91_local4 = f91_local2.paintjobs_per_slot
	for f91_local5 = 0, f91_local3 - 1, 1 do
		local f91_local8 = f91_local0[f91_local5]
		if f91_local8 then
			for f91_local9 = 0, f91_local4 - 1, 1 do
				local f91_local12 = f91_local8[f91_local9]
				if f91_local12 and f91_local12.weaponIndex == f91_arg0 then
					local f91_local13 = f91_local12.sortIndex
					if f91_local1 < f91_local13 then
						f91_local1 = f91_local13
					end
				end
			end
		end
	end
	return f91_local1
end

CoD.CraftUtility.Paintjobs.GetCACPaintjobList = function ( f92_arg0 )
	local f92_local0 = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local f92_local1 = {}
	local f92_local2 = Engine.GetPaintjobSlotInfo()
	local f92_local3 = f92_local2.slot_count
	local f92_local4 = f92_local2.paintjobs_per_slot
	for f92_local5 = 0, f92_local3 - 1, 1 do
		local f92_local8 = f92_local0[f92_local5]
		if f92_local8 then
			for f92_local9 = 0, f92_local4 - 1, 1 do
				local f92_local12 = f92_local8[f92_local9]
				if f92_local12 and f92_local12.weaponIndex == f92_arg0 then
					table.insert( f92_local1, f92_local12 )
				end
			end
		end
	end
	table.sort( f92_local1, function ( f93_arg0, f93_arg1 )
		return f93_arg1.sortIndex < f93_arg0.sortIndex
	end )
	return f92_local1
end

CoD.CraftUtility.Paintjobs.GetSortedWeaponPaintjobList = function ( f94_arg0, f94_arg1 )
	local f94_local0 = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local f94_local1 = {}
	local f94_local2 = false
	local f94_local3 = Engine.GetPaintjobSlotInfo()
	local f94_local4 = f94_local3.slot_count
	local f94_local5 = f94_local3.paintjobs_per_slot
	for f94_local6 = 0, f94_local4 - 1, 1 do
		local f94_local9 = f94_local0[f94_local6]
		if f94_local9 then
			for f94_local10 = 0, f94_local5 - 1, 1 do
				local f94_local13 = f94_local9[f94_local10]
				if f94_local13 then
					if f94_arg1 then
						if not (f94_arg1 ~= "" or f94_local13.weaponIndex == CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX) or Engine.GetWeaponGroup( f94_local13.weaponIndex, Enum.eModes.MODE_MULTIPLAYER ) == tonumber( f94_arg1 ) then
							table.insert( f94_local1, f94_local13 )
						end
					end
					if f94_arg0 == nil and f94_local13.weaponIndex ~= 0 then
						table.insert( f94_local1, f94_local13 )
					end
					if f94_local13.weaponIndex == CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX and not f94_local2 then
						f94_local13.sortIndex = CoD.CraftUtility.Paintjobs.GetHighestSortIndexForWeapon( f94_arg0 ) + 1
						f94_local2 = true
						table.insert( f94_local1, f94_local13 )
					end
					if f94_local13.weaponIndex == f94_arg0 then
						table.insert( f94_local1, f94_local13 )
					end
				end
			end
		end
	end
	table.sort( f94_local1, function ( f95_arg0, f95_arg1 )
		return f95_arg1.sortIndex < f95_arg0.sortIndex
	end )
	return f94_local1
end

CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs = function ( f96_arg0 )
	local f96_local0 = MediaManagerGetQuotaForCategory( f96_arg0, "paintjob" )
	return f96_local0.categoryQuota
end

CoD.CraftUtility.Paintjobs.IsPaintjobIndexOccupied = function ( f97_arg0, f97_arg1 )
	if CoD.CraftUtility.Paintjobs.CachedPaintjobs[f97_arg0][f97_arg1].weaponIndex ~= CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX then
		return true
	else
		return false
	end
end

CoD.CraftUtility.Paintjobs.ParseDDL = function ( f98_arg0, f98_arg1 )
	local f98_local0 = Engine.GetPaintjobSlotInfo()
	local f98_local1 = f98_local0.slot_count
	local f98_local2 = f98_local0.paintjobs_per_slot
	local f98_local3 = CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs( f98_arg0 )
	if f98_local1 * f98_local2 < f98_local3 then
		error( "Paintjob DDL: DDL does not support " .. f98_local3 .. " paintjobs." )
		return false
	end
	for f98_local4 = 0, f98_local1 - 1, 1 do
		local f98_local7 = CoD.CraftUtility.GetDDLRoot( f98_arg0, f98_arg1, f98_local4 )
		CoD.CraftUtility.Paintjobs.CachedPaintjobs[f98_local4] = {}
		if f98_local7 == nil then
			CoD.CraftUtility.Paintjobs.CachedPaintjobs = {}
			return false
		end
		for f98_local8 = 0, f98_local2 - 1, 1 do
			if f98_local3 <= f98_local4 * f98_local2 + f98_local8 then
				return true
			end
			local f98_local11 = {}
			local f98_local12 = f98_local7.weaponPaintjob[f98_local8]
			f98_local11.weaponIndex = f98_local12.weaponIndex:get()
			f98_local11.sortIndex = f98_local12.sortIndex:get()
			f98_local11.paintjobName = f98_local12.paintjobName:get()
			f98_local11.paintjobSlot = f98_local4
			f98_local11.paintjobIndex = f98_local8
			f98_local11.readOnly = f98_local12.readOnly:get()
			if f98_local12.createTime ~= nil then
				f98_local11.createTime = Engine.GetLocalizedTimeStr( f98_local12.createTime:get() )
			end
			CoD.CraftUtility.Paintjobs.CachedPaintjobs[f98_local4][f98_local8] = f98_local11
		end
	end
	return true
end

CoD.CraftUtility.Paintjobs.InvalidateRender = function ( f99_arg0, f99_arg1 )
	CoD.CraftUtility.InvalidateWCItemRender( Engine.GetModelValue( Engine.GetModel( f99_arg1, "paintjobSlot" ) ), Engine.GetModelValue( Engine.GetModel( f99_arg1, "paintjobIndex" ) ) )
end

CoD.CraftUtility.Paintjobs.UploadPaintjob = function ( f100_arg0, f100_arg1 )
	local f100_local0 = Engine.GetModelValue( Engine.GetModel( f100_arg1, "paintjobSlot" ) )
	local f100_local1 = Engine.GetModelValue( Engine.GetModel( f100_arg1, "paintjobIndex" ) )
	local f100_local2 = Engine.GetModelValue( Engine.GetModel( f100_arg1, "weaponIndex" ) )
	local f100_local3 = Engine.GetModelValue( Engine.GetModel( f100_arg1, "sortIndex" ) )
	local f100_local4 = Engine.GetModelValue( Engine.GetModel( f100_arg1, "paintjobName" ) )
	local f100_local5 = CoD.CraftUtility.GetDDLRoot( f100_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS, f100_local0 )
	if f100_local5 ~= nil then
		local f100_local6 = f100_local5.weaponPaintjob[f100_local1]
		f100_local6.weaponIndex:set( f100_local2 )
		f100_local6.sortIndex:set( f100_local3 )
		f100_local6.paintjobName:set( f100_local4 )
		f100_local6.createTime:set( Engine.GetCurrentUTCTimeStr() )
		Engine.UploadPaintjobData( f100_arg0, f100_local0, f100_local1 )
	end
end

CoD.CraftUtility.Paintjobs.GetEmptyPaintjob = function ( f101_arg0 )
	local f101_local0 = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local f101_local1 = Engine.GetPaintjobSlotInfo()
	local f101_local2 = f101_local1.slot_count
	local f101_local3 = f101_local1.paintjobs_per_slot
	for f101_local4 = 0, f101_local2 - 1, 1 do
		local f101_local7 = f101_local0[f101_local4]
		if f101_local7 then
			for f101_local8 = 0, f101_local3 - 1, 1 do
				local f101_local11 = f101_local7[f101_local8]
				if f101_local11.weaponIndex == CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX then
					f101_local11.sortIndex = CoD.CraftUtility.Paintjobs.GetHighestSortIndexForWeapon( f101_arg0 ) + 1
					return f101_local11
				end
			end
		end
	end
end

CoD.CraftUtility.Paintjobs.Copy = function ( f102_arg0, f102_arg1 )
	local f102_local0 = Engine.GetModelValue( Engine.GetModel( f102_arg1, "paintjobSlot" ) )
	local f102_local1 = Engine.GetModelValue( Engine.GetModel( f102_arg1, "weaponIndex" ) )
	local f102_local2 = Engine.GetModelValue( Engine.GetModel( f102_arg1, "paintjobName" ) )
	local f102_local3 = CoD.CraftUtility.GetDDLRoot( f102_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS, f102_local0 )
	local f102_local4 = CoD.CraftUtility.Paintjobs.GetEmptyPaintjob( f102_local1 )
	if f102_local3 ~= nil and f102_local4 ~= nil then
		local f102_local5 = CoD.CraftUtility.GetDDLRoot( f102_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS, f102_local4.paintjobSlot )
		if f102_local5 ~= nil then
			local f102_local6 = f102_local5.weaponPaintjob[f102_local4.paintjobIndex]
			f102_local6.weaponIndex:set( f102_local1 )
			f102_local6.sortIndex:set( f102_local4.sortIndex )
			f102_local6.paintjobName:set( f102_local2 )
			Engine.UploadPaintjobData( f102_arg0, f102_local4.paintjobSlot, f102_local4.paintjobIndex )
			return f102_local4.paintjobSlot, f102_local4.paintjobIndex
		end
	end
end

CoD.CraftUtility.Paintjobs.RemovePaintJobFromLoadout = function ( f103_arg0, f103_arg1, f103_arg2, f103_arg3, f103_arg4 )
	local f103_local0 = Engine.StorageGetBuffer( f103_arg0, f103_arg3 )
	f103_local0 = f103_local0.cacloadouts
	local f103_local1 = Engine.GetCustomClassCount( f103_arg0, f103_arg4 )
	for f103_local2 = 0, f103_local1 - 1, 1 do
		local f103_local5 = f103_local0.customclass[f103_local2].primarypaintjobslot:get()
		local f103_local6 = f103_local0.customclass[f103_local2].primarypaintjobindex:get()
		local f103_local7 = f103_local0.customclass[f103_local2].secondarypaintjobindex:get()
		local f103_local8 = f103_local0.customclass[f103_local2].secondarypaintjobslot:get()
		if f103_local5 == f103_arg1 and f103_local6 == f103_arg2 then
			f103_local0.customclass[f103_local2].primarypaintjobslot:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
			f103_local0.customclass[f103_local2].primarypaintjobindex:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
		end
		if f103_local8 == f103_arg1 and f103_local7 == f103_arg2 then
			f103_local0.customclass[f103_local2].secondarypaintjobslot:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
			f103_local0.customclass[f103_local2].secondarypaintjobindex:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
		end
	end
end

CoD.CraftUtility.Paintjobs.RemovePaintJobFromVariantList = function ( f104_arg0, f104_arg1, f104_arg2, f104_arg3 )
	for f104_local0 = 0, f104_arg1 - 1, 1 do
		if f104_arg0.variant[f104_local0].paintjobSlot:get() == f104_arg2 and f104_arg0.variant[f104_local0].paintjobIndex:get() == f104_arg3 then
			f104_arg0.variant[f104_local0].paintjobSlot:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
			f104_arg0.variant[f104_local0].paintjobIndex:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
		end
	end
end

CoD.CraftUtility.Paintjobs.RemovePaintJobFromZM = function ( f105_arg0, f105_arg1, f105_arg2 )
	local f105_local0 = Engine.StorageGetBuffer( f105_arg0, Enum.StorageFileType.STORAGE_ZM_LOADOUTS )
	f105_local0 = f105_local0.cacloadouts
	CoD.CraftUtility.Paintjobs.RemovePaintJobFromVariantList( f105_local0, #f105_local0.variant, f105_arg1, f105_arg2 )
end

CoD.CraftUtility.Paintjobs.RemovePaintJobFromAllLoadouts = function ( f106_arg0, f106_arg1, f106_arg2 )
	CoD.CraftUtility.Paintjobs.RemovePaintJobFromLoadout( f106_arg0, f106_arg1, f106_arg2, Enum.StorageFileType.STORAGE_CP_LOADOUTS, Enum.eModes.MODE_CAMPAIGN )
	CoD.CraftUtility.Paintjobs.RemovePaintJobFromLoadout( f106_arg0, f106_arg1, f106_arg2, Enum.StorageFileType.STORAGE_MP_LOADOUTS, Enum.eModes.MODE_MULTIPLAYER )
	CoD.CraftUtility.Paintjobs.RemovePaintJobFromZM( f106_arg0, f106_arg1, f106_arg2 )
end

CoD.CraftUtility.Paintjobs.RemovePaintJobFromGunsmith = function ( f107_arg0, f107_arg1, f107_arg2 )
	CoD.CraftUtility.Paintjobs.RemovePaintJobFromVariantList( CoD.CraftUtility.GetDDLRoot( f107_arg0, Enum.StorageFileType.STORAGE_GUNSMITH ), CoD.CraftUtility.Gunsmith.GetMaxVariantCount( f107_arg0, Enum.StorageFileType.STORAGE_GUNSMITH ), f107_arg1, f107_arg2 )
end

CoD.CraftUtility.Paintjobs.ClearPaintjob = function ( f108_arg0, f108_arg1, f108_arg2 )
	local f108_local0 = CoD.CraftUtility.GetDDLRoot( f108_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS, f108_arg1 )
	if f108_local0 ~= nil then
		local f108_local1 = f108_local0.weaponPaintjob[f108_arg2]
		f108_local1.paintjobName:set( "" )
		f108_local1.sortIndex:set( CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX )
		f108_local1.weaponIndex:set( CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX )
		f108_local1.readOnly:set( CoD.CraftUtility.DEFAULT_READ_ONLY_FLAG )
		Engine.ClearPaintjobLayerData()
		Engine.UploadPaintjobData( f108_arg0, f108_arg1, f108_arg2 )
		CoD.CraftUtility.Paintjobs.RemovePaintJobFromAllLoadouts( f108_arg0, f108_arg1, f108_arg2 )
		CoD.CraftUtility.Paintjobs.RemovePaintJobFromGunsmith( f108_arg0, f108_arg1, f108_arg2 )
	end
end

CoD.CraftUtility.Paintjobs.GetPaintjobName = function ( f109_arg0, f109_arg1, f109_arg2 )
	local f109_local0 = CoD.CraftUtility.GetDDLRoot( f109_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS, f109_arg1 )
	if f109_local0 ~= nil then
		return f109_local0.weaponPaintjob[f109_arg2].paintjobName:get()
	else
		return ""
	end
end

CoD.CraftUtility.Paintjobs.RenamePaintjob = function ( f110_arg0, f110_arg1, f110_arg2, f110_arg3 )
	local f110_local0 = Enum.StorageFileType.STORAGE_PAINTJOBS
	local f110_local1 = CoD.CraftUtility.GetDDLRoot( f110_arg0, f110_local0, f110_arg1 )
	if f110_local1 ~= nil then
		f110_local1.weaponPaintjob[f110_arg2].paintjobName:set( f110_arg3 )
		CoD.CraftUtility.UploadAndParseBuffer( f110_arg0, f110_local0, f110_arg1 )
	end
end

CoD.CraftUtility.Paintjobs.PublishPaintjob = function ( f111_arg0 )
	local f111_local0 = CoD.perController[f111_arg0].selectedpaintjobModel
	local f111_local1 = Engine.GetModelValue( Engine.GetModel( f111_local0, "paintjobSlot" ) )
	local f111_local2 = Engine.GetModelValue( Engine.GetModel( f111_local0, "paintjobIndex" ) )
	local f111_local3 = CoD.CraftUtility.GetDDLRoot( f111_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS, f111_local1 )
	if f111_local3 ~= nil then
		Engine.PublishPaintjob( f111_arg0, "paintjob", f111_local1, f111_local2, f111_local3.weaponPaintjob[f111_local2].weaponIndex:get(), CoD.FileshareUtility.GetPublishName(), CoD.FileshareUtility.GetPublishAllowDownload() )
	end
end

CoD.CraftUtility.Paintjobs.GetPaintjobWeaponIndex = function ( f112_arg0, f112_arg1, f112_arg2 )
	local f112_local0 = CoD.CraftUtility.Paintjobs.CachedPaintjobs[tonumber( f112_arg1 )]
	if f112_local0 then
		local f112_local1 = f112_local0[tonumber( f112_arg2 )]
		if f112_local1 then
			return f112_local1.weaponIndex
		end
	end
	return CoD.GetCustomization( f112_arg0, "weapon_index" )
end

CoD.CraftUtility.Emblems = {}
CoD.CraftUtility.Emblems.CachedEmblems = {}
CoD.CraftUtility.Emblems.CachedEmblemIndexMapping = {}
CoD.CraftUtility.Emblems.INVALID_DEFAULT_EMBLEMINDEX = -1
CoD.CraftUtility.Emblems.INVALID_EMBLEMINDEX = -1
CoD.CraftUtility.Emblems.GetHighestSortIndex = function ()
	local f113_local0 = CoD.CraftUtility.Emblems.CachedEmblems
	local f113_local1 = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
	for f113_local2 = 1, #f113_local0, 1 do
		local f113_local5 = f113_local0[f113_local2].sortIndex
		if f113_local1 < f113_local5 then
			f113_local1 = f113_local5
		end
	end
	return f113_local1
end

CoD.CraftUtility.Emblems.GetSortedEmblemsList = function ( f114_arg0, f114_arg1 )
	local f114_local0 = CoD.CraftUtility.Emblems.CachedEmblems
	local f114_local1 = {}
	local f114_local2 = false
	for f114_local3 = 1, #f114_local0, 1 do
		local f114_local6 = f114_local0[f114_local3]
		if f114_local6.isUsed == 0 and not f114_local2 and f114_arg1 == Enum.StorageFileType.STORAGE_EMBLEMS and not SelectingGroupEmblem( f114_arg0 ) then
			f114_local6.sortIndex = CoD.CraftUtility.Emblems.GetHighestSortIndex() + 1
			f114_local2 = true
			table.insert( f114_local1, f114_local6 )
		end
		if f114_local6.isUsed == 1 then
			local f114_local7 = false
			if f114_arg1 ~= Enum.StorageFileType.STORAGE_EMBLEMS_LOOT or not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( CoD.BlackMarketUtility.GetLootEmblemIDName( f114_local6.emblemIndex ) ) then
				table.insert( f114_local1, f114_local6 )
			end
		end
	end
	table.sort( f114_local1, function ( f115_arg0, f115_arg1 )
		return f115_arg1.sortIndex < f115_arg0.sortIndex
	end )
	return f114_local1
end

CoD.CraftUtility.Emblems.GetTotalUsedEmblems = function ( f116_arg0, f116_arg1 )
	local f116_local0 = CoD.CraftUtility.Emblems.GetTotalAllowedEmblems( f116_arg0, f116_arg1 )
	local f116_local1 = 0
	for f116_local2 = 0, f116_local0 - 1, 1 do
		local f116_local5 = CoD.CraftUtility.GetEmblemState( f116_arg0, f116_arg1, f116_local2 )
		if f116_local5.isUsed:get() == 1 then
			f116_local1 = f116_local1 + 1
		end
	end
	return f116_local1
end

CoD.CraftUtility.Emblems.GetTotalAllowedEmblems = function ( f117_arg0, f117_arg1 )
	if f117_arg1 == Enum.StorageFileType.STORAGE_DEFAULT_EMBLEMS then
		return Dvar.default_emblems_max_count:get()
	elseif f117_arg1 == Enum.StorageFileType.STORAGE_EMBLEMS_LOOT then
		return Dvar.loot_emblems_max_count:get()
	else
		local f117_local0 = MediaManagerGetQuotaForCategory( f117_arg0, "emblem" )
		return f117_local0.categoryQuota
	end
end

CoD.CraftUtility.Emblems.GetEmblemName = function ( f118_arg0, f118_arg1, f118_arg2 )
	if f118_arg2 ~= Enum.StorageFileType.STORAGE_EMBLEMS then
		return Engine.Localize( "EM_" .. f118_arg1 )
	else
		return f118_arg1
	end
end

CoD.CraftUtility.Emblems.ParseDDL = function ( f119_arg0, f119_arg1 )
	local f119_local0 = CoD.CraftUtility.Emblems.GetTotalAllowedEmblems( f119_arg0, f119_arg1 )
	if CoD.CraftUtility.GetDDLRoot( f119_arg0, f119_arg1 ) == nil then
		CoD.CraftUtility.Emblems.CachedEmblems = {}
		CoD.CraftUtility.Emblems.CachedEmblemIndexMapping = {}
		return false
	end
	local f119_local1 = 1
	for f119_local2 = 0, f119_local0 - 1, 1 do
		local f119_local5 = {}
		local f119_local6 = CoD.CraftUtility.GetEmblemState( f119_arg0, f119_arg1, f119_local2 )
		if f119_local6 == nil then
			error( "Emblems DDL: DDL of type " .. f119_arg1 .. " does not support " .. f119_local0 .. " emblems. Failed on index " .. f119_local2 )
			return false
		end
		f119_local5.emblemIndex = f119_local2
		f119_local5.isUsed = f119_local6.isUsed:get()
		f119_local5.sortIndex = f119_local6.sortIndex:get()
		f119_local5.readOnly = f119_local6.readOnly:get()
		f119_local5.emblemName = CoD.CraftUtility.Emblems.GetEmblemName( f119_arg0, f119_local6.emblemName:get(), f119_arg1 )
		if f119_local6.createTime ~= nil then
			f119_local5.createTime = Engine.GetLocalizedTimeStr( f119_local6.createTime:get() )
		end
		if f119_arg1 ~= Enum.StorageFileType.STORAGE_EMBLEMS_LOOT or f119_local5.isUsed == 1 then
			CoD.CraftUtility.Emblems.CachedEmblems[f119_local1] = f119_local5
			CoD.CraftUtility.Emblems.CachedEmblemIndexMapping[f119_local2 + 1] = f119_local1
			f119_local1 = f119_local1 + 1
		end
	end
	return true
end

CoD.CraftUtility.Emblems.IsEmblemIndexOccupied = function ( f120_arg0 )
	local f120_local0 = CoD.CraftUtility.Emblems.CachedEmblems
	for f120_local1 = 1, #f120_local0, 1 do
		local f120_local4 = f120_local0[f120_local1]
		if f120_local4.emblemIndex == f120_arg0 then
			return f120_local4.isUsed == 1
		end
	end
	return false
end

CoD.CraftUtility.Emblems.UploadEmblem = function ( f121_arg0, f121_arg1 )
	local f121_local0 = Engine.GetModelValue( Engine.GetModel( f121_arg1, "emblemIndex" ) )
	local f121_local1 = Engine.GetModelValue( Engine.GetModel( f121_arg1, "sortIndex" ) )
	local f121_local2 = Engine.GetModelValue( Engine.GetModel( f121_arg1, "emblemName" ) )
	local f121_local3 = CoD.CraftUtility.GetDDLRoot( f121_arg0, CoD.perController[f121_arg0].selectedEmblemTabStorageType )
	if f121_local3 ~= nil and f121_local0 >= 0 then
		local f121_local4 = f121_local3.emblemList[f121_local0]
		f121_local4.isUsed:set( 1 )
		f121_local4.sortIndex:set( f121_local1 )
		f121_local4.emblemName:set( f121_local2 )
		f121_local4.createTime:set( Engine.GetCurrentUTCTimeStr() )
		Engine.UploadEmblemData( f121_arg0, f121_local0 )
	end
end

CoD.CraftUtility.Emblems.RenameEmblem = function ( f122_arg0, f122_arg1, f122_arg2 )
	local f122_local0 = CoD.perController[f122_arg0].selectedEmblemTabStorageType
	local f122_local1 = CoD.CraftUtility.GetDDLRoot( f122_arg0, f122_local0 )
	if f122_local1 ~= nil and f122_arg1 >= 0 then
		f122_local1.emblemList[f122_arg1].emblemName:set( f122_arg2 )
		CoD.CraftUtility.UploadAndParseBuffer( f122_arg0, f122_local0 )
	end
	ForceNotifyModel( f122_arg0, "Emblem.UpdateDataSource" )
end

CoD.CraftUtility.Emblems.ClearEmblem = function ( f123_arg0, f123_arg1 )
	local f123_local0 = CoD.CraftUtility.GetDDLRoot( f123_arg0, CoD.perController[f123_arg0].selectedEmblemTabStorageType )
	local f123_local1 = Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM
	if f123_local0 ~= nil and f123_arg1 >= 0 then
		local f123_local2 = f123_local0.emblemList[f123_arg1]
		f123_local2.emblemName:set( "" )
		f123_local2.isUsed:set( 0 )
		f123_local2.sortIndex:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		f123_local2.readOnly:set( CoD.CraftUtility.DEFAULT_READ_ONLY_FLAG )
		Engine.ExecNow( f123_arg0, "emblemClearAll " .. f123_local1 )
	end
end

CoD.CraftUtility.Emblems.GetEmptyEmblem = function ()
	local f124_local0 = CoD.CraftUtility.Emblems.CachedEmblems
	for f124_local1 = 1, #f124_local0, 1 do
		local f124_local4 = f124_local0[f124_local1]
		if f124_local4.isUsed == 0 then
			f124_local4.sortIndex = CoD.CraftUtility.Emblems.GetHighestSortIndex() + 1
			return f124_local4
		end
	end
end

CoD.CraftUtility.Emblems.Copy = function ( f125_arg0, f125_arg1, f125_arg2 )
	local f125_local0 = Engine.GetModelValue( Engine.GetModel( f125_arg1, "emblemIndex" ) )
	local f125_local1 = Engine.GetModelValue( Engine.GetModel( f125_arg1, "sortIndex" ) )
	local f125_local2 = Engine.GetModelValue( Engine.GetModel( f125_arg1, "emblemName" ) )
	local f125_local3 = CoD.CraftUtility.GetDDLRoot( f125_arg0, f125_arg2 )
	local f125_local4 = CoD.CraftUtility.Emblems.GetEmptyEmblem()
	if f125_local3 ~= nil and f125_local0 >= 0 and f125_local4 and f125_local4.emblemIndex >= 0 then
		local f125_local5 = f125_local3.emblemList[f125_local4.emblemIndex]
		f125_local5.isUsed:set( 1 )
		f125_local5.sortIndex:set( f125_local4.sortIndex )
		f125_local5.emblemName:set( f125_local2 )
		Engine.UploadEmblemData( f125_arg0, f125_local4.emblemIndex )
		return f125_local4.emblemIndex
	else
		
	end
end

CoD.CraftUtility.Emblems.PublishEmblem = function ( f126_arg0 )
	local modelValue = Engine.GetModelValue( Engine.GetModel( CoD.perController[f126_arg0].selectedEmblemModel, "emblemIndex" ) )
	local f126_local1 = CoD.FileshareUtility.GetPublishName()
	local f126_local2 = CoD.FileshareUtility.GetPublishAllowDownload()
	if modelValue >= 0 then
		Engine.PublishEmblem( f126_arg0, "emblem", modelValue - 1, f126_local1, f126_local2 )
	end
end

CoD.CraftUtility.Emblems.FileshareBreadcrumbPaths = {
	[Enum.StorageFileType.STORAGE_EMBLEMS_LOOT] = "blackMarket"
}
CoD.CraftUtility.Emblems.GetEmblemBreadcrumbRoot = function ( f127_arg0, f127_arg1, f127_arg2 )
	local f127_local0 = CoD.CraftUtility.Emblems.FileshareBreadcrumbPaths[f127_arg2]
	if f127_local0 then
		local f127_local1 = Engine.StorageGetBuffer( f127_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		if f127_local1 then
			return f127_local1.emblemBreadcrumbs[f127_local0].markedOld[f127_arg1]
		end
	end
	return nil
end

CoD.CraftUtility.Emblems.IsEmblemNew = function ( f128_arg0, f128_arg1, f128_arg2 )
	local f128_local0 = CoD.CraftUtility.Emblems.GetEmblemBreadcrumbRoot( f128_arg0, f128_arg1, f128_arg2 )
	if f128_local0 then
		return f128_local0:get() == 0
	else
		return false
	end
end

CoD.CraftUtility.Emblems.IsAnyEmblemNew = function ( f129_arg0 )
	if IsLive() then
		for f129_local5, f129_local6 in pairs( CoD.CraftUtility.Emblems.FileshareBreadcrumbPaths ) do
			local f129_local7 = CoD.CraftUtility.Emblems.GetTotalUsedEmblems( f129_arg0, f129_local5 )
			for f129_local4 = 0, f129_local7 - 1, 1 do
				local f129_local3 = false
				if f129_local5 == Enum.StorageFileType.STORAGE_EMBLEMS_LOOT then
					f129_local3 = CoD.BlackMarketUtility.IsItemLocked( f129_arg0, CoD.BlackMarketUtility.GetLootEmblemIDNameFromIndex( f129_local4 ) )
				end
				if not f129_local3 and CoD.CraftUtility.Emblems.IsEmblemNew( f129_arg0, f129_local4, f129_local5 ) then
					return true
				end
			end
		end
	end
	return false
end

CoD.CraftUtility.Emblems.GetEmblemMaterialBreadcrumbRoot = function ( f130_arg0, f130_arg1 )
	local f130_local0 = Engine.StorageGetBuffer( f130_arg0, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if f130_local0 then
		return f130_local0.emblemStats.materials[f130_arg1].markedOld
	else
		
	end
end

CoD.CraftUtility.Emblems.IsMaterialNew = function ( f131_arg0, f131_arg1 )
	local f131_local0 = CoD.CraftUtility.Emblems.GetEmblemMaterialBreadcrumbRoot( f131_arg0, f131_arg1 )
	if f131_local0 then
		return f131_local0:get() == 0
	else
		return false
	end
end

CoD.CraftUtility.Fileshare.DisplayWeaponWithPaintjob = function ( f132_arg0, f132_arg1, f132_arg2, f132_arg3 )
	if f132_arg1 == 0 then
		CoD.CraftUtility.Fileshare.ClearDisplay( f132_arg0 )
		return 
	else
		Engine.SetupFilesharePaintjobData( f132_arg0, f132_arg2 )
		Engine.SendClientScriptNotify( f132_arg0, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f132_arg0 ), CoD.CraftUtility.GetLoadoutSlot( f132_arg0 ), Engine.GetItemRef( f132_arg1 ) .. CoD.CraftUtility.GetModeAbbreviation(), CoD.CACUtility.GetCameraNameForAttachments( "", f132_arg3 == true ), "0,0,1" )
	end
end

CoD.CraftUtility.Fileshare.DisplayWeaponVariants = function ( f133_arg0, f133_arg1, f133_arg2, f133_arg3 )
	if f133_arg1 == 0 then
		CoD.CraftUtility.Fileshare.ClearDisplay( f133_arg0 )
		return 
	else
		Engine.SetupFilesharePaintjobData( f133_arg0, f133_arg2 )
		local f133_local0 = Engine.GetFileshareWeaponVariantData( f133_arg0, f133_arg2 )
		local f133_local1 = Engine.GetItemRef( f133_arg1 )
		local f133_local2 = f133_local1 .. CoD.CraftUtility.GetModeAbbreviation()
		local f133_local3 = f133_local0.camoIndex
		local f133_local4 = CoD.CraftUtility.GetLoadoutSlot( f133_arg0 )
		local f133_local5 = f133_local1 .. CoD.CraftUtility.GetModeAbbreviation() .. CoD.CraftUtility.Fileshare.GetWeaponsAttachmentsString( f133_local0 )
		Engine.SendClientScriptNotify( f133_arg0, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f133_arg0 ), f133_local4, f133_local5, CoD.CACUtility.GetCameraNameForAttachments( f133_local5, f133_arg3 == true ), f133_local3 .. ",0,1", CoD.CraftUtility.Fileshare.GetWeaponAttachmentVariantString( f133_local0 ) )
	end
end

CoD.CraftUtility.Fileshare.GetWeaponsAttachmentsString = function ( f134_arg0 )
	local f134_local0 = ""
	for f134_local1 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
		local f134_local4 = f134_arg0.attachments[f134_local1 - 1]
		if f134_local4 ~= nil then
			f134_local0 = CoD.CraftUtility.Gunsmith.AddAttachmentToWeapon( f134_local0, f134_local4 )
		end
	end
	return f134_local0
end

CoD.CraftUtility.Fileshare.GetWeaponAttachmentVariantString = function ( f135_arg0 )
	local f135_local0 = ""
	for f135_local1 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
		local f135_local4 = f135_arg0.attachments[f135_local1 - 1]
		if f135_local4 ~= nil and f135_local4 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
			f135_local0 = CoD.CraftUtility.Gunsmith.AddAttachmentVariant( f135_local0, f135_local4, f135_arg0.attachmentVariants[f135_local1 - 1] )
		end
	end
	return f135_local0
end

CoD.CraftUtility.Fileshare.ClearDisplay = function ( f136_arg0 )
	Engine.SendClientScriptNotify( f136_arg0, "CustomClass_remove" .. CoD.GetLocalClientAdjustedNum( f136_arg0 ) )
end

CoD.CraftUtility.Fileshare.DisplayWeaponWithPaintjobUsingModel = function ( f137_arg0, f137_arg1 )
	local f137_local0 = CoD.Paintshop.View[CoD.perController[f137_arg0].viewIndex].customization_type
	local f137_local1 = Engine.GetModelValue( Engine.GetModel( f137_arg1, "paintjobSlot" ) )
	local f137_local2 = Engine.GetModelValue( Engine.GetModel( f137_arg1, "paintjobIndex" ) )
	local f137_local3 = Engine.GetItemRef( Engine.GetModelValue( Engine.GetModel( f137_arg1, "weaponIndex" ) ) ) .. CoD.CraftUtility.GetModeAbbreviation()
	local f137_local4 = CoD.CraftUtility.GetLoadoutSlot( f137_arg0 )
	local f137_local5 = CoD.CACUtility.GetCameraNameForAttachments( f137_local3 )
	Engine.SetupPaintjobData( f137_arg0, f137_local1, f137_local2 )
	Engine.SendClientScriptNotify( f137_arg0, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f137_arg0 ), f137_local4, f137_local3, f137_local5, "0,0,1" )
end

CoD.CraftUtility.Fileshare.DisplayWeaponWithVariant = function ( f138_arg0, f138_arg1, f138_arg2, f138_arg3, f138_arg4, f138_arg5 )
	if f138_arg1 then
		local f138_local0 = CoD.CraftUtility.GetLoadoutSlot( f138_arg0 )
		local f138_local1 = Engine.GetItemRef( Engine.GetModelValue( Engine.GetModel( f138_arg1, "weaponIndex" ) ) ) .. CoD.CraftUtility.GetModeAbbreviation()
		for f138_local2 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			f138_local1 = CoD.CraftUtility.Gunsmith.AddAttachmentToWeapon( f138_local1, Engine.GetModelValue( Engine.GetModel( f138_arg1, "attachment" .. f138_local2 ) ) )
		end
		local f138_local2 = CoD.CACUtility.GetCameraNameForAttachments( f138_local1, f138_arg2 )
		if f138_arg5 == nil then
			f138_arg5 = Engine.GetModelValue( Engine.GetModel( f138_arg1, "camoIndex" ) )
		end
		if f138_arg3 == nil then
			f138_arg3 = Engine.GetModelValue( Engine.GetModel( f138_arg1, "paintjobSlot" ) )
		end
		if f138_arg4 == nil then
			f138_arg4 = Engine.GetModelValue( Engine.GetModel( f138_arg1, "paintjobIndex" ) )
		end
		Engine.SetupPaintjobData( f138_arg0, f138_arg3, f138_arg4 )
		Engine.SendClientScriptNotify( f138_arg0, "CustomClass_update" .. CoD.GetLocalClientAdjustedNum( f138_arg0 ), f138_local0, f138_local1, f138_local2, f138_arg5 .. ",0,1", CoD.CraftUtility.Gunsmith.GetWeaponAttachmentVariantString( f138_arg0, f138_arg1 ) )
	end
end

