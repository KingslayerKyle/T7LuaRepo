require( "lua.Shared.LuaUtils" )

CoD.CraftUtility = {}
CoD.CraftUtility.Gunsmith = {}
CoD.CraftUtility.Gunsmith.CachedVariants = {}
CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS = 8
CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX = 0
CoD.CraftUtility.Gunsmith.CAMO_NONE = 0
CoD.CraftUtility.PAINTSHOP_GRIDSIZE = 16
CoD.CraftUtility.EMBLEM_GRIDSIZE = 24
CoD.CraftUtility.GetUsedSlotsByFileType = function ( f1_arg0, f1_arg1 )
	local f1_local0 = 0
	if f1_arg1 == Enum.StorageFileType.STORAGE_PAINTJOBS then
		f1_local0 = CoD.CraftUtility.Paintjobs.GetTotalUsedPaintjobs()
	elseif f1_arg1 == Enum.StorageFileType.STORAGE_GUNSMITH then
		f1_local0 = CoD.CraftUtility.Gunsmith.GetTotalUsedVariants()
	elseif f1_arg1 == Enum.StorageFileType.STORAGE_EMBLEMS then
		f1_local0 = CoD.CraftUtility.Emblems.GetTotalUsedEmblems()
	end
	return f1_local0
end

CoD.CraftUtility.GetTotalAllowedSlotsByFileType = function ( f2_arg0, f2_arg1 )
	local f2_local0 = 0
	if f2_arg1 == Enum.StorageFileType.STORAGE_PAINTJOBS then
		f2_local0 = CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs()
	elseif f2_arg1 == Enum.StorageFileType.STORAGE_GUNSMITH then
		f2_local0 = CoD.CraftUtility.Gunsmith.GetTotalAllowedVaraints()
	elseif f2_arg1 == Enum.StorageFileType.STORAGE_EMBLEMS then
		f2_local0 = CoD.CraftUtility.Emblems.GetTotalAllowedEmblems( f2_arg1 )
	end
	return f2_local0
end

CoD.CraftUtility.GetGridTypeName = function ( f3_arg0 )
	local f3_local0 = "paintshop_grid_size"
	if not IsPaintshop( f3_arg0 ) then
		f3_local0 = "emblem_grid_size"
	end
	return f3_local0
end

CoD.CraftUtility.GetGridSize = function ( f4_arg0 )
	local f4_local0 = CoD.CraftUtility.PAINTSHOP_GRIDSIZE
	if not IsPaintshop( f4_arg0 ) then
		f4_local0 = CoD.CraftUtility.EMBLEM_GRIDSIZE
	end
	return f4_local0
end

CoD.CraftUtility.GetDDLRoot = function ( f5_arg0, f5_arg1, f5_arg2 )
	if f5_arg1 == "cacRoot" then
		return Engine.GetCACRoot( f5_arg0 )
	elseif f5_arg2 ~= nil then
		return Engine.StorageGetBuffer( f5_arg0, f5_arg1, f5_arg2 )
	else
		return Engine.StorageGetBuffer( f5_arg0, f5_arg1 )
	end
end

CoD.CraftUtility.UploadBuffer = function ( f6_arg0, f6_arg1, f6_arg2 )
	if f6_arg1 == Enum.StorageFileType.STORAGE_GUNSMITH then
		f6_arg1 = CoD.CraftUtility.Gunsmith.GetFileType()
	end
	if f6_arg1 == "cacRoot" then
		Engine.Exec( f6_arg0, "saveLoadout" )
	elseif f6_arg2 ~= nil then
		Engine.StorageWrite( f6_arg0, f6_arg1, f6_arg2 )
	else
		Engine.StorageWrite( f6_arg0, f6_arg1 )
	end
end

CoD.CraftUtility.UploadAndParseBuffer = function ( f7_arg0, f7_arg1, f7_arg2 )
	CoD.CraftUtility.UploadBuffer( f7_arg0, f7_arg1, f7_arg2 )
	if f7_arg1 == Enum.StorageFileType.STORAGE_GUNSMITH then
		CoD.CraftUtility.Gunsmith.ParseDDL( f7_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	elseif f7_arg1 == Enum.StorageFileType.STORAGE_EMBLEMS then
		CoD.CraftUtility.Emblems.ParseDDL( f7_arg0, f7_arg1 )
	elseif f7_arg1 == Enum.StorageFileType.STORAGE_PAINTJOBS then
		CoD.CraftUtility.Paintjobs.ParseDDL( f7_arg0, f7_arg1 )
	end
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

CoD.CraftUtility.GetLoadoutSlot = function ( f10_arg0 )
	local f10_local0
	if CoD.GetCustomization( f10_arg0, "category_index" ) ~= nil then
		f10_local0 = CoD.GetCustomization( f10_arg0, "category_index" ) - 1
	else
		f10_local0 = 1
	end
	return CoD.Craft.WeaponGroupNames[f10_local0].loadout_slot
end

CoD.CraftUtility.DisplayWeaponInPaintshop = function ( f11_arg0, f11_arg1 )
	Engine.SendClientScriptNotify( f11_arg0, "CustomClass_update", CoD.CraftUtility.GetLoadoutSlot( f11_arg0 ), Engine.GetItemRef( CoD.GetCustomization( f11_arg0, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER ) .. CoD.CraftUtility.GetModeAbbreviation(), f11_arg1, "0,0,1" )
end

CoD.CraftUtility.PaintjobClear = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3, f12_arg4 )
	f12_arg4:openPopup( "PaintjobClearConfirmation", f12_arg2 )
end

CoD.CraftUtility.PaintjobRename = function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3, f13_arg4 )
	ShowKeyboard( f13_arg4, f13_arg1, f13_arg2, "KEYBOARD_TYPE_PAINTJOB" )
end

CoD.CraftUtility.OpenPublishPromptPaintjob = function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3, f14_arg4 )
	local f14_local0 = CoD.perController[f14_arg2].selectedpaintjobModel
	local f14_local1 = Engine.GetModelValue( Engine.GetModel( f14_local0, "paintjobSlot" ) )
	local f14_local2 = Engine.GetModelValue( Engine.GetModel( f14_local0, "paintjobIndex" ) )
	local f14_local3 = CoD.CraftUtility.GetDDLRoot( f14_arg2, Enum.StorageFileType.STORAGE_PAINTJOBS, f14_local1 )
	local f14_local4 = ""
	if f14_local3 ~= nil then
		local f14_local5 = f14_local3.weaponPaintjob[f14_local2].paintjobName:get()
		if f14_local5 ~= nil then
			f14_local4 = f14_local5
		end
	end
	CoD.FileshareUtility.OpenPublishPrompt( f14_arg4, f14_arg2, "paintjob", f14_local4, CoD.CraftUtility.Paintjobs.PublishPaintjob )
end

CoD.CraftUtility.PaintjobClearYes = function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3, f15_arg4 )
	PaintjobSelector_ClearPaintjob( f15_arg4, f15_arg1, f15_arg2 )
end

CoD.CraftUtility.PaintjobClearNo = function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3, f16_arg4 )
	GoBack( f16_arg4, f16_arg2 )
end

CoD.CraftUtility.GunsmithClear = function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3, f17_arg4 )
	f17_arg4:openPopup( "GunsmithClearConfirmation", f17_arg2 )
end

CoD.CraftUtility.GunsmithRename = function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3, f18_arg4 )
	ShowKeyboard( f18_arg4, f18_arg1, f18_arg2, "KEYBOARD_TYPE_GUNSMITH" )
end

CoD.CraftUtility.OpenPublishPromptGunsmith = function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3, f19_arg4 )
	CoD.FileshareUtility.OpenPublishPrompt( f19_arg4, f19_arg2, "variant", Engine.GetModelValue( Engine.GetModel( CoD.perController[f19_arg2].gunsmithVariantModel, "variantName" ) ), CoD.CraftUtility.Gunsmith.PublishVariant )
end

CoD.CraftUtility.GunsmithClearYes = function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3, f20_arg4 )
	Gunsmith_ClearVariant( f20_arg0, f20_arg1, f20_arg2 )
end

CoD.CraftUtility.GunsmithClearNo = function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3, f21_arg4 )
	GoBack( f21_arg4, f21_arg2 )
end

CoD.CraftUtility.EmblemClear = function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3, f22_arg4 )
	f22_arg4:openPopup( "EmblemClearConfirmation", f22_arg2 )
end

CoD.CraftUtility.EmblemRename = function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3, f23_arg4 )
	ShowKeyboard( f23_arg4, f23_arg1, f23_arg2, "KEYBOARD_TYPE_EMBLEMS" )
end

CoD.CraftUtility.OpenPublishPromptEmblem = function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3, f24_arg4 )
	if CheckIfFeatureIsBanned( f24_arg2 + 1, LuaEnums.FEATURE_BAN.USER_GENERATED_CONTENT ) then
		LuaUtils.UI_ShowErrorMessageDialog( f24_arg2, GetFeatureBanInfo( f24_arg2 + 1, LuaEnums.FEATURE_BAN.USER_GENERATED_CONTENT ) )
		return 
	else
		CoD.FileshareUtility.OpenPublishPrompt( f24_arg4, f24_arg2, "emblem", Engine.GetModelValue( Engine.GetModel( CoD.perController[f24_arg2].selectedEmblemModel, "emblemName" ) ), CoD.CraftUtility.Emblems.PublishEmblem )
	end
end

CoD.CraftUtility.EmblemClearYes = function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3, f25_arg4 )
	EmblemSelect_ClearEmblem( f25_arg4, f25_arg1, f25_arg2 )
end

CoD.CraftUtility.EmblemClearNo = function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3, f26_arg4 )
	GoBack( f26_arg4, f26_arg2 )
end

CoD.CraftUtility.GetWeaponGroupName = function ( f27_arg0 )
	local f27_local0 = CoD.GetCustomization( f27_arg0, "weapon_index" )
	local f27_local1 = ""
	if f27_local0 then
		f27_local1 = Engine.GetItemGroup( f27_local0, Enum.eModes.MODE_MULTIPLAYER )
	end
	return f27_local1
end

CoD.CraftUtility.Gunsmith.GetFileType = function ()
	local f28_local0 = CoD.CraftUtility.Gunsmith.FileType
	if not f28_local0 then
		f28_local0 = Enum.StorageFileType.STORAGE_GUNSMITH
	end
	return f28_local0
end

CoD.CraftUtility.Gunsmith.GetTotalAllowedVaraints = function ()
	return CoD.CraftUtility.Gunsmith.TotalVariants
end

CoD.CraftUtility.Gunsmith.GetMaxVariantCount = function ( f30_arg0, f30_arg1 )
	local f30_local0 = CoD.CraftUtility.GetDDLRoot( f30_arg0, f30_arg1 )
	local f30_local1 = 0
	if f30_local0 ~= nil then
		local f30_local2 = #f30_local0.variant
		if CoD.CraftUtility.Gunsmith.FileType == Enum.StorageFileType.STORAGE_GUNSMITH then
			if Dvar.gunsmith_totalvariants:exists() then
				local f30_local3 = Dvar.gunsmith_totalvariants:get()
				if f30_local2 < f30_local3 then
					error( "Gunsmith DDL: DDL does not support " .. f30_local3 .. " variants." )
					return 0
				end
				f30_local1 = math.min( f30_local2, f30_local3 )
			end
		else
			f30_local1 = f30_local2
		end
	end
	return f30_local1
end

CoD.CraftUtility.Gunsmith.GetTotalUsedWeaponVariants = function ( f31_arg0 )
	local f31_local0 = CoD.CraftUtility.Gunsmith.CachedVariants
	local f31_local1 = 0
	for f31_local2 = 1, #f31_local0, 1 do
		if f31_local0[f31_local2].weaponIndex == f31_arg0 then
			f31_local1 = f31_local1 + 1
		end
	end
	return f31_local1
end

CoD.CraftUtility.Gunsmith.GetTotalUsedVariants = function ()
	local f32_local0 = CoD.CraftUtility.Gunsmith.CachedVariants
	local f32_local1 = 0
	for f32_local2 = 1, #f32_local0, 1 do
		if f32_local0[f32_local2].weaponIndex ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
			f32_local1 = f32_local1 + 1
		end
	end
	return f32_local1
end

CoD.CraftUtility.Gunsmith.ParseDDL = function ( f33_arg0, f33_arg1 )
	local f33_local0 = CoD.CraftUtility.GetDDLRoot( f33_arg0, f33_arg1 )
	CoD.CraftUtility.Gunsmith.FileType = f33_arg1
	if f33_local0 == nil then
		CoD.CraftUtility.Gunsmith.CachedVariants = {}
		return false
	end
	local f33_local1 = CoD.CraftUtility.Gunsmith.GetMaxVariantCount( f33_arg0, f33_arg1 )
	CoD.CraftUtility.Gunsmith.TotalVariants = f33_local1
	for f33_local2 = 0, f33_local1 - 1, 1 do
		local f33_local5 = {}
		local f33_local6 = f33_local0.variant[f33_local2]
		f33_local5.weaponIndex = f33_local6.weaponIndex:get()
		f33_local5.variantIndex = f33_local6.variantIndex:get()
		f33_local5.sortIndex = f33_local6.sortIndex:get()
		CoD.CraftUtility.Gunsmith.CachedVariants[f33_local2 + 1] = f33_local5
	end
	return true
end

CoD.CraftUtility.Gunsmith.PublishVariant = function ( f34_arg0 )
	local f34_local0 = CoD.perController[f34_arg0].gunsmithVariantModel
	Engine.PublishVariant( f34_arg0, "variant", Engine.GetModelValue( Engine.GetModel( f34_local0, "variantIndex" ) ), Engine.GetModelValue( Engine.GetModel( f34_local0, "paintjobSlot" ) ), Engine.GetModelValue( Engine.GetModel( f34_local0, "paintjobIndex" ) ), Engine.GetModelValue( Engine.GetModel( f34_local0, "weaponIndex" ) ), CoD.FileshareUtility.GetPublishName(), CoD.FileshareUtility.GetPublishAllowDownload() )
end

CoD.CraftUtility.Gunsmith.GetHighestSortIndexForWeapon = function ( f35_arg0 )
	local f35_local0 = CoD.CraftUtility.Gunsmith.CachedVariants
	local f35_local1 = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
	for f35_local2 = 1, #f35_local0, 1 do
		if f35_local0[f35_local2].weaponIndex == f35_arg0 then
			local f35_local5 = f35_local0[f35_local2].sortIndex
			if f35_local1 < f35_local5 then
				f35_local1 = f35_local5
			end
		end
	end
	return f35_local1
end

CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList = function ( f36_arg0 )
	local f36_local0 = CoD.CraftUtility.Gunsmith.CachedVariants
	local f36_local1 = 0
	local f36_local2 = {}
	local f36_local3 = false
	for f36_local4 = 1, #f36_local0, 1 do
		local f36_local7 = f36_local0[f36_local4]
		if f36_local0[f36_local4].weaponIndex == CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX and not f36_local3 then
			f36_local7.sortIndex = CoD.CraftUtility.Gunsmith.GetHighestSortIndexForWeapon( f36_arg0 ) + 1
			f36_local3 = true
			table.insert( f36_local2, f36_local7 )
		end
		if f36_local0[f36_local4].weaponIndex == f36_arg0 then
			table.insert( f36_local2, f36_local7 )
		end
	end
	table.sort( f36_local2, function ( f37_arg0, f37_arg1 )
		return f37_arg1.sortIndex < f37_arg0.sortIndex
	end )
	return f36_local2
end

CoD.CraftUtility.Gunsmith.GetVariantByIndex = function ( f38_arg0, f38_arg1 )
	local f38_local0 = CoD.CraftUtility.GetDDLRoot( f38_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	if f38_local0 ~= nil then
		local f38_local1 = f38_local0.variant[f38_arg1]
		local f38_local2 = {
			attachment = {},
			attachmentVariant = {},
			variantName = f38_local1.variantName:get(),
			camoIndex = f38_local1.camoIndex:get(),
			paintjobSlot = f38_local1.paintjobSlot:get(),
			paintjobIndex = f38_local1.paintjobIndex:get(),
			weaponIndex = f38_local1.weaponIndex:get(),
			variantIndex = f38_local1.variantIndex:get(),
			sortIndex = f38_local1.sortIndex:get(),
			cacVariantIndex = f38_local1.variantIndex:get() + 1
		}
		for f38_local3 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			table.insert( f38_local2.attachment, f38_local1.attachment[f38_local3 - 1]:get() )
		end
		for f38_local3 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			table.insert( f38_local2.attachmentVariant, f38_local1.attachmentVariant[f38_local3 - 1]:get() )
		end
		return f38_local2
	else
		
	end
end

CoD.CraftUtility.Gunsmith.GetVariantIndexFromCACVaraintIndex = function ( f39_arg0, f39_arg1 )
	return CoD.CraftUtility.Gunsmith.GetVariantByIndex( f39_arg0, f39_arg1 - 1 )
end

CoD.CraftUtility.Gunsmith.IsVariantIndexOccupied = function ( f40_arg0 )
	if CoD.CraftUtility.Gunsmith.CachedVariants[f40_arg0 + 1].weaponIndex ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
		return true
	else
		return false
	end
end

CoD.CraftUtility.Gunsmith.WriteVariantAttachmentDataToDDL = function ( f41_arg0, f41_arg1 )
	local f41_local0 = CoD.CraftUtility.GetDDLRoot( f41_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	if f41_local0 ~= nil then
		local f41_local1 = f41_local0.variant[Engine.GetModelValue( Engine.GetModel( f41_arg1, "variantIndex" ) )]
		local f41_local2 = 0
		local f41_local3 = 1
		for f41_local4 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f41_local7 = Engine.GetModel( f41_arg1, "attachment" .. f41_local4 )
			if f41_local7 then
				local f41_local8 = Engine.GetModelValue( f41_local7 )
				if f41_local8 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX or f41_local4 == f41_local3 then
					f41_local1.attachment[f41_local2]:set( f41_local8 )
					local f41_local9 = Engine.GetModel( f41_arg1, "attachmentVariant" .. f41_local4 )
					if f41_local9 then
						f41_local1.attachmentVariant[f41_local2]:set( Engine.GetModelValue( f41_local9 ) )
					end
					f41_local2 = f41_local2 + 1
				end
			end
		end
		for f41_local4 = f41_local2, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS - 1, 1 do
			f41_local1.attachment[f41_local4]:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
			f41_local1.attachmentVariant[f41_local4]:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		end
	end
end

CoD.CraftUtility.Gunsmith.WriteVaraintDataToDDL = function ( f42_arg0, f42_arg1 )
	local f42_local0 = CoD.CraftUtility.GetDDLRoot( f42_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	if f42_local0 ~= nil then
		local f42_local1 = f42_local0.variant[Engine.GetModelValue( Engine.GetModel( f42_arg1, "variantIndex" ) )]
		f42_local1.variantName:set( Engine.GetModelValue( Engine.GetModel( f42_arg1, "variantName" ) ) )
		f42_local1.camoIndex:set( Engine.GetModelValue( Engine.GetModel( f42_arg1, "camoIndex" ) ) )
		f42_local1.paintjobSlot:set( Engine.GetModelValue( Engine.GetModel( f42_arg1, "paintjobSlot" ) ) )
		f42_local1.paintjobIndex:set( Engine.GetModelValue( Engine.GetModel( f42_arg1, "paintjobIndex" ) ) )
		f42_local1.sortIndex:set( Engine.GetModelValue( Engine.GetModel( f42_arg1, "sortIndex" ) ) )
		f42_local1.weaponIndex:set( Engine.GetModelValue( Engine.GetModel( f42_arg1, "weaponIndex" ) ) )
		CoD.CraftUtility.Gunsmith.WriteVariantAttachmentDataToDDL( f42_arg0, f42_arg1 )
		CoD.CraftUtility.UploadAndParseBuffer( f42_arg0, Enum.StorageFileType.STORAGE_GUNSMITH )
	end
end

CoD.CraftUtility.Gunsmith.RenameVariant = function ( f43_arg0, f43_arg1, f43_arg2 )
	local f43_local0 = CoD.CraftUtility.GetDDLRoot( f43_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	if f43_local0 ~= nil then
		f43_local0.variant[f43_arg1].variantName:set( f43_arg2 )
		CoD.CraftUtility.UploadAndParseBuffer( f43_arg0, Enum.StorageFileType.STORAGE_GUNSMITH )
	end
end

CoD.CraftUtility.Gunsmith.ClearVariant = function ( f44_arg0, f44_arg1 )
	local f44_local0 = CoD.CraftUtility.GetDDLRoot( f44_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	if f44_local0 ~= nil then
		local f44_local1 = f44_local0.variant[f44_arg1]
		f44_local1.variantName:set( "" )
		f44_local1.variantIndex:set( f44_arg1 )
		f44_local1.camoIndex:set( CoD.CraftUtility.Gunsmith.CAMO_NONE )
		f44_local1.paintjobSlot:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
		f44_local1.paintjobIndex:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
		f44_local1.weaponIndex:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		f44_local1.sortIndex:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		for f44_local2 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			f44_local1.attachment[f44_local2 - 1]:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		end
		for f44_local2 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			f44_local1.attachmentVariant[f44_local2 - 1]:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		end
		CoD.CraftUtility.UploadAndParseBuffer( f44_arg0, Enum.StorageFileType.STORAGE_GUNSMITH )
	end
end

CoD.CraftUtility.Gunsmith.GetEmptyVariantIndex = function ()
	local f45_local0 = CoD.CraftUtility.Gunsmith.CachedVariants
	for f45_local1 = 1, #f45_local0, 1 do
		local f45_local4 = f45_local0[f45_local1]
		if f45_local0[f45_local1].weaponIndex == CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
			return f45_local0[f45_local1].variantIndex
		end
	end
end

CoD.CraftUtility.Gunsmith.Copy = function ( f46_arg0, f46_arg1 )
	local f46_local0 = CoD.CraftUtility.GetDDLRoot( f46_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	local f46_local1 = CoD.CraftUtility.Gunsmith.GetEmptyVariantIndex()
	if f46_local0 ~= nil and f46_local1 >= 0 then
		local f46_local2 = f46_local0.variant[f46_arg1]
		local f46_local3 = f46_local0.variant[f46_local1]
		f46_local3.variantName:set( f46_local2.variantName:get() )
		f46_local3.camoIndex:set( f46_local2.camoIndex:get() )
		f46_local3.paintjobSlot:set( f46_local2.paintjobSlot:get() )
		f46_local3.paintjobIndex:set( f46_local2.paintjobIndex:get() )
		f46_local3.weaponIndex:set( f46_local2.weaponIndex:get() )
		for f46_local4 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			f46_local3.attachment[f46_local4 - 1]:set( f46_local2.attachment[f46_local4 - 1]:get() )
		end
		for f46_local4 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			f46_local3.attachmentVariant[f46_local4 - 1]:set( f46_local2.attachmentVariant[f46_local4 - 1]:get() )
		end
		f46_local3.sortIndex:set( CoD.CraftUtility.Gunsmith.GetHighestSortIndexForWeapon( f46_local2.weaponIndex:get() ) + 1 )
		CoD.CraftUtility.UploadAndParseBuffer( f46_arg0, Enum.StorageFileType.STORAGE_GUNSMITH )
		return f46_local1
	else
		
	end
end

CoD.CraftUtility.Gunsmith.AddAttachmentToWeapon = function ( f47_arg0, f47_arg1 )
	if f47_arg1 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
		f47_arg0 = f47_arg0 .. "+" .. Engine.GetAttachmentRefByIndex( f47_arg1 )
	end
	return f47_arg0
end

CoD.CraftUtility.Gunsmith.AddAttachmentVariant = function ( f48_arg0, f48_arg1, f48_arg2 )
	return f48_arg0 .. Engine.GetAttachmentRefByIndex( f48_arg1 ) .. "," .. f48_arg2 .. ","
end

CoD.CraftUtility.Gunsmith.GetWeaponByVariantIndex = function ( f49_arg0, f49_arg1 )
	local f49_local0 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f49_arg0, f49_arg1 )
	local f49_local1 = Engine.GetItemRef( f49_local0.weaponIndex, Enum.eModes.MODE_MULTIPLAYER )
	if f49_local0.weaponIndex == 0 then
		f49_local1 = Engine.GetItemRef( CoD.GetCustomization( f49_arg0, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	end
	local f49_local2 = f49_local1 .. CoD.CraftUtility.GetModeAbbreviation()
	if f49_local0.weaponIndex ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
		for f49_local3 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			f49_local2 = CoD.CraftUtility.Gunsmith.AddAttachmentToWeapon( f49_local2, f49_local0.attachment[f49_local3] )
		end
	end
	return f49_local2
end

CoD.CraftUtility.Gunsmith.GetAttachmentVariantByVariantIndex = function ( f50_arg0, f50_arg1 )
	local f50_local0 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f50_arg0, f50_arg1 )
	local f50_local1 = Engine.GetItemRef( f50_local0.weaponIndex, Enum.eModes.MODE_MULTIPLAYER )
	if f50_local0.weaponIndex == 0 then
		f50_local1 = Engine.GetItemRef( CoD.GetCustomization( f50_arg0, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	end
	local f50_local2 = ""
	if f50_local0.weaponIndex ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
		for f50_local3 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f50_local6 = f50_local0.attachment[f50_local3]
			if f50_local6 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				f50_local2 = CoD.CraftUtility.Gunsmith.AddAttachmentVariant( f50_local2, f50_local6, f50_local0.attachmentVariant[f50_local3] )
			end
		end
	end
	return f50_local2
end

CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant = function ( f51_arg0, f51_arg1 )
	local f51_local0 = Engine.GetItemRef( CoD.GetCustomization( f51_arg0, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER ) .. CoD.CraftUtility.GetModeAbbreviation()
	if f51_arg1 then
		for f51_local1 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			f51_local0 = CoD.CraftUtility.Gunsmith.AddAttachmentToWeapon( f51_local0, Engine.GetModelValue( Engine.GetModel( f51_arg1, "attachment" .. f51_local1 ) ) )
		end
	end
	return f51_local0
end

CoD.CraftUtility.Gunsmith.GetWeaponAttachmentList = function ( f52_arg0, f52_arg1 )
	local f52_local0 = CoD.GetCustomization( f52_arg0, "weapon_index" )
	local f52_local1 = Engine.GetItemRef( f52_local0, Enum.eModes.MODE_MULTIPLAYER )
	local f52_local2 = {}
	if f52_arg1 then
		for f52_local3 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f52_local6 = Engine.GetModelValue( Engine.GetModel( f52_arg1, "attachment" .. f52_local3 ) )
			if f52_local6 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				table.insert( f52_local2, {
					index = Engine.GetAttachmentIndexByAttachmentTableIndex( f52_local0, f52_local6, Enum.eModes.MODE_MULTIPLAYER ),
					ref = Engine.GetAttachmentRefByIndex( f52_local6 )
				} )
			end
		end
	end
	return f52_local2
end

CoD.CraftUtility.Gunsmith.GetWeaponAttachmentVariantString = function ( f53_arg0, f53_arg1 )
	local f53_local0 = Engine.GetItemRef( CoD.GetCustomization( f53_arg0, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	local f53_local1 = ""
	if f53_arg1 then
		for f53_local2 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f53_local5 = Engine.GetModelValue( Engine.GetModel( f53_arg1, "attachment" .. f53_local2 ) )
			if f53_local5 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				f53_local1 = CoD.CraftUtility.Gunsmith.AddAttachmentVariant( f53_local1, f53_local5, Engine.GetModelValue( Engine.GetModel( f53_arg1, "attachmentVariant" .. f53_local2 ) ) )
			end
		end
	end
	return f53_local1
end

CoD.CraftUtility.Gunsmith.DisplayBaseWeapon = function ( f54_arg0, f54_arg1, f54_arg2 )
	local f54_local0 = CoD.GetCustomization( f54_arg2, "weapon_index" )
	local f54_local1 = true
	local f54_local2 = nil
	if CoD.perController[f54_arg2].editingWeaponBuildKits then
		f54_local1 = not IsCACItemLocked( f54_arg0, f54_arg1, f54_arg2 )
	end
	local f54_local3 = Engine.GetItemRef( f54_local0, Enum.eModes.MODE_MULTIPLAYER ) .. CoD.CraftUtility.GetModeAbbreviation()
	Engine.SendClientScriptNotify( f54_arg2, "CustomClass_update", CoD.CraftUtility.GetLoadoutSlot( f54_arg2 ), f54_local3, CoD.CACUtility.GetCameraNameForAttachments( f54_local3 ), "0,0,0", f54_local2, f54_local1 )
end

CoD.CraftUtility.Gunsmith.DisplayWeaponWithPaintjob = function ( f55_arg0, f55_arg1, f55_arg2 )
	local f55_local0 = Engine.GetItemRef( CoD.GetCustomization( f55_arg0, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER ) .. CoD.CraftUtility.GetModeAbbreviation()
	local f55_local1 = CoD.CraftUtility.GetLoadoutSlot( f55_arg0 )
	local f55_local2 = CoD.CACUtility.GetCameraNameForAttachments( f55_local0 )
	Engine.SetupPaintjobData( f55_arg0, f55_arg2, f55_arg1 )
	Engine.SendClientScriptNotify( f55_arg0, "CustomClass_update", f55_local1, f55_local0, f55_local2, "0,0,1" )
end

CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant = function ( f56_arg0, f56_arg1, f56_arg2, f56_arg3, f56_arg4, f56_arg5 )
	if f56_arg1 then
		local f56_local0 = CoD.CraftUtility.GetLoadoutSlot( f56_arg0 )
		local f56_local1 = CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant( f56_arg0, f56_arg1 )
		local f56_local2 = CoD.CACUtility.GetCameraNameForAttachments( f56_local1, f56_arg2 )
		if f56_arg5 == nil then
			f56_arg5 = Engine.GetModelValue( Engine.GetModel( f56_arg1, "camoIndex" ) )
		end
		if f56_arg3 == nil then
			f56_arg3 = Engine.GetModelValue( Engine.GetModel( f56_arg1, "paintjobSlot" ) )
		end
		if f56_arg4 == nil then
			f56_arg4 = Engine.GetModelValue( Engine.GetModel( f56_arg1, "paintjobIndex" ) )
		end
		Engine.SetupPaintjobData( f56_arg0, f56_arg3, f56_arg4 )
		Engine.SendClientScriptNotify( f56_arg0, "CustomClass_update", f56_local0, f56_local1, f56_local2, f56_arg5 .. ",0,1", CoD.CraftUtility.Gunsmith.GetWeaponAttachmentVariantString( f56_arg0, f56_arg1 ) )
	end
end

CoD.CraftUtility.Gunsmith.GetVariantAttachmentList = function ( f57_arg0, f57_arg1 )
	local f57_local0 = {}
	if f57_arg1 then
		for f57_local1 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			table.insert( f57_local0, Engine.GetModelValue( Engine.GetModel( f57_arg1, "attachment" .. f57_local1 ) ) )
		end
	end
	return f57_local0
end

CoD.CraftUtility.Gunsmith.ClearVariantSlotByAttachmentIndex = function ( f58_arg0, f58_arg1, f58_arg2 )
	if f58_arg1 then
		for f58_local0 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f58_local3 = Engine.GetModel( f58_arg1, "attachment" .. f58_local0 )
			local f58_local4 = Engine.GetModelValue( f58_local3 )
			local f58_local5 = Engine.GetModel( f58_arg1, "attachmentVariant" .. f58_local0 )
			if f58_arg2 == f58_local4 then
				Engine.SetModelValue( f58_local5, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
				Engine.SetModelValue( f58_local3, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
			end
		end
	end
end

CoD.CraftUtility.Gunsmith.IsFocusAttachmentEquipped = function ( f59_arg0, f59_arg1, f59_arg2 )
	if f59_arg1 then
		for f59_local0 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			if f59_arg2 == Engine.GetModelValue( Engine.GetModel( f59_arg1, "attachment" .. f59_local0 ) ) then
				return true
			end
		end
	end
end

CoD.CraftUtility.Gunsmith.SetFocusAttachmentVariant = function ( f60_arg0, f60_arg1, f60_arg2, f60_arg3 )
	if f60_arg1 then
		for f60_local0 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f60_local3 = Engine.GetModelValue( Engine.GetModel( f60_arg1, "attachment" .. f60_local0 ) )
			local f60_local4 = Engine.GetModel( f60_arg1, "attachmentVariant" .. f60_local0 )
			if f60_arg2 == f60_local3 then
				Engine.SetModelValue( f60_local4, f60_arg3 )
			end
		end
	end
end

CoD.CraftUtility.Paintjobs = {}
CoD.CraftUtility.Paintjobs.CachedPaintjobs = {}
CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX = 0
CoD.CraftUtility.Paintjobs.GetPrevViewIndex = function ( f61_arg0 )
	local f61_local0 = CoD.CraftUtility.GetWeaponGroupName( f61_arg0 )
	local f61_local1 = #CoD.Paintshop.View
	local f61_local2 = CoD.perController[f61_arg0].viewIndex - 1
	if f61_local2 == 0 then
		f61_local2 = f61_local1
	end
	if f61_local0 == "weapon_knife" and f61_local2 == 2 then
		f61_local2 = f61_local2 - 1
	end
	return f61_local2
end

CoD.CraftUtility.Paintjobs.GetNextViewIndex = function ( f62_arg0 )
	local f62_local0 = CoD.CraftUtility.GetWeaponGroupName( f62_arg0 )
	local f62_local1 = CoD.perController[f62_arg0].viewIndex % #CoD.Paintshop.View + 1
	if f62_local0 == "weapon_knife" and f62_local1 == 2 then
		f62_local1 = f62_local1 + 1
	end
	return f62_local1
end

CoD.CraftUtility.Paintjobs.GetTotalWeaponPaintjobs = function ( f63_arg0 )
	local f63_local0 = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local f63_local1 = 0
	local f63_local2 = Engine.GetPaintjobSlotInfo()
	local f63_local3 = f63_local2.slot_count
	local f63_local4 = f63_local2.paintjobs_per_slot
	for f63_local5 = 0, f63_local3 - 1, 1 do
		local f63_local8 = f63_local0[f63_local5]
		if f63_local8 then
			for f63_local9 = 0, f63_local4 - 1, 1 do
				local f63_local12 = f63_local8[f63_local9]
				if f63_local12 and f63_local12.weaponIndex == f63_arg0 then
					f63_local1 = f63_local1 + 1
				end
			end
		end
	end
	return f63_local1
end

CoD.CraftUtility.Paintjobs.GetTotalUsedPaintjobs = function ()
	local f64_local0 = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local f64_local1 = 0
	local f64_local2 = Engine.GetPaintjobSlotInfo()
	local f64_local3 = f64_local2.slot_count
	local f64_local4 = f64_local2.paintjobs_per_slot
	for f64_local5 = 0, f64_local3 - 1, 1 do
		local f64_local8 = f64_local0[f64_local5]
		if f64_local8 then
			for f64_local9 = 0, f64_local4 - 1, 1 do
				local f64_local12 = f64_local8[f64_local9]
				if f64_local12 and f64_local12.weaponIndex ~= CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX then
					f64_local1 = f64_local1 + 1
				end
			end
		end
	end
	return f64_local1
end

CoD.CraftUtility.Paintjobs.GetHighestSortIndexForWeapon = function ( f65_arg0 )
	local f65_local0 = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local f65_local1 = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
	local f65_local2 = Engine.GetPaintjobSlotInfo()
	local f65_local3 = f65_local2.slot_count
	local f65_local4 = f65_local2.paintjobs_per_slot
	for f65_local5 = 0, f65_local3 - 1, 1 do
		local f65_local8 = f65_local0[f65_local5]
		if f65_local8 then
			for f65_local9 = 0, f65_local4 - 1, 1 do
				local f65_local12 = f65_local8[f65_local9]
				if f65_local12 and f65_local12.weaponIndex == f65_arg0 then
					local f65_local13 = f65_local12.sortIndex
					if f65_local1 < f65_local13 then
						f65_local1 = f65_local13
					end
				end
			end
		end
	end
	return f65_local1
end

CoD.CraftUtility.Paintjobs.GetCACPaintjobList = function ( f66_arg0 )
	local f66_local0 = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local f66_local1 = {}
	local f66_local2 = Engine.GetPaintjobSlotInfo()
	local f66_local3 = f66_local2.slot_count
	local f66_local4 = f66_local2.paintjobs_per_slot
	for f66_local5 = 0, f66_local3 - 1, 1 do
		local f66_local8 = f66_local0[f66_local5]
		if f66_local8 then
			for f66_local9 = 0, f66_local4 - 1, 1 do
				local f66_local12 = f66_local8[f66_local9]
				if f66_local12 and f66_local12.weaponIndex == f66_arg0 then
					table.insert( f66_local1, f66_local12 )
				end
			end
		end
	end
	table.sort( f66_local1, function ( f67_arg0, f67_arg1 )
		return f67_arg1.sortIndex < f67_arg0.sortIndex
	end )
	return f66_local1
end

CoD.CraftUtility.Paintjobs.GetSortedWeaponPaintjobList = function ( f68_arg0 )
	local f68_local0 = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local f68_local1 = {}
	local f68_local2 = false
	local f68_local3 = Engine.GetPaintjobSlotInfo()
	local f68_local4 = f68_local3.slot_count
	local f68_local5 = f68_local3.paintjobs_per_slot
	for f68_local6 = 0, f68_local4 - 1, 1 do
		local f68_local9 = f68_local0[f68_local6]
		if f68_local9 then
			for f68_local10 = 0, f68_local5 - 1, 1 do
				local f68_local13 = f68_local9[f68_local10]
				if f68_local13 then
					if f68_local13.weaponIndex == CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX and not f68_local2 then
						f68_local13.sortIndex = CoD.CraftUtility.Paintjobs.GetHighestSortIndexForWeapon( f68_arg0 ) + 1
						f68_local2 = true
						table.insert( f68_local1, f68_local13 )
					end
					if f68_local13.weaponIndex == f68_arg0 then
						table.insert( f68_local1, f68_local13 )
					end
				end
			end
		end
	end
	table.sort( f68_local1, function ( f69_arg0, f69_arg1 )
		return f69_arg1.sortIndex < f69_arg0.sortIndex
	end )
	return f68_local1
end

CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs = function ()
	return Dvar.total_paintjobs:get()
end

CoD.CraftUtility.Paintjobs.IsPaintjobIndexOccupied = function ( f71_arg0, f71_arg1 )
	if CoD.CraftUtility.Paintjobs.CachedPaintjobs[f71_arg0][f71_arg1].weaponIndex ~= CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX then
		return true
	else
		return false
	end
end

CoD.CraftUtility.Paintjobs.ParseDDL = function ( f72_arg0, f72_arg1 )
	local f72_local0 = Engine.GetPaintjobSlotInfo()
	local f72_local1 = f72_local0.slot_count
	local f72_local2 = f72_local0.paintjobs_per_slot
	local f72_local3 = CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs()
	if f72_local1 * f72_local2 < f72_local3 then
		error( "Paintjob DDL: DDL does not support " .. f72_local3 .. " paintjobs." )
		return false
	end
	for f72_local4 = 0, f72_local1 - 1, 1 do
		local f72_local7 = CoD.CraftUtility.GetDDLRoot( f72_arg0, f72_arg1, f72_local4 )
		CoD.CraftUtility.Paintjobs.CachedPaintjobs[f72_local4] = {}
		if f72_local7 == nil then
			CoD.CraftUtility.Paintjobs.CachedPaintjobs = {}
			return false
		end
		for f72_local8 = 0, f72_local2 - 1, 1 do
			if f72_local3 <= f72_local4 * f72_local2 + f72_local8 then
				return true
			end
			local f72_local11 = {}
			local f72_local12 = f72_local7.weaponPaintjob[f72_local8]
			f72_local11.weaponIndex = f72_local12.weaponIndex:get()
			f72_local11.sortIndex = f72_local12.sortIndex:get()
			f72_local11.paintjobName = f72_local12.paintjobName:get()
			f72_local11.paintjobSlot = f72_local4
			f72_local11.paintjobIndex = f72_local8
			CoD.CraftUtility.Paintjobs.CachedPaintjobs[f72_local4][f72_local8] = f72_local11
		end
	end
	return true
end

CoD.CraftUtility.Paintjobs.UploadPaintjob = function ( f73_arg0, f73_arg1 )
	local f73_local0 = Engine.GetModelValue( Engine.GetModel( f73_arg1, "paintjobSlot" ) )
	local f73_local1 = Engine.GetModelValue( Engine.GetModel( f73_arg1, "paintjobIndex" ) )
	local f73_local2 = Engine.GetModelValue( Engine.GetModel( f73_arg1, "weaponIndex" ) )
	local f73_local3 = Engine.GetModelValue( Engine.GetModel( f73_arg1, "sortIndex" ) )
	local f73_local4 = Engine.GetModelValue( Engine.GetModel( f73_arg1, "paintjobName" ) )
	local f73_local5 = CoD.CraftUtility.GetDDLRoot( f73_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS, f73_local0 )
	if f73_local5 ~= nil then
		local f73_local6 = f73_local5.weaponPaintjob[f73_local1]
		f73_local6.weaponIndex:set( f73_local2 )
		f73_local6.sortIndex:set( f73_local3 )
		f73_local6.paintjobName:set( f73_local4 )
		Engine.UploadPaintjobData( f73_arg0, f73_local0, f73_local1 )
	end
end

CoD.CraftUtility.Paintjobs.GetEmptyPaintjob = function ( f74_arg0 )
	local f74_local0 = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local f74_local1 = Engine.GetPaintjobSlotInfo()
	local f74_local2 = f74_local1.slot_count
	local f74_local3 = f74_local1.paintjobs_per_slot
	for f74_local4 = 0, f74_local2 - 1, 1 do
		local f74_local7 = f74_local0[f74_local4]
		if f74_local7 then
			for f74_local8 = 0, f74_local3 - 1, 1 do
				local f74_local11 = f74_local7[f74_local8]
				if f74_local11.weaponIndex == CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX then
					f74_local11.sortIndex = CoD.CraftUtility.Paintjobs.GetHighestSortIndexForWeapon( f74_arg0 ) + 1
					return f74_local11
				end
			end
		end
	end
end

CoD.CraftUtility.Paintjobs.Copy = function ( f75_arg0, f75_arg1 )
	local f75_local0 = Engine.GetModelValue( Engine.GetModel( f75_arg1, "paintjobSlot" ) )
	local f75_local1 = Engine.GetModelValue( Engine.GetModel( f75_arg1, "weaponIndex" ) )
	local f75_local2 = Engine.GetModelValue( Engine.GetModel( f75_arg1, "paintjobName" ) )
	local f75_local3 = CoD.CraftUtility.GetDDLRoot( f75_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS, f75_local0 )
	local f75_local4 = CoD.CraftUtility.Paintjobs.GetEmptyPaintjob( f75_local1 )
	if f75_local3 ~= nil and f75_local4 ~= nil then
		local f75_local5 = CoD.CraftUtility.GetDDLRoot( f75_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS, f75_local4.paintjobSlot )
		if f75_local5 ~= nil then
			local f75_local6 = f75_local5.weaponPaintjob[f75_local4.paintjobIndex]
			f75_local6.weaponIndex:set( f75_local1 )
			f75_local6.sortIndex:set( f75_local4.sortIndex )
			f75_local6.paintjobName:set( f75_local2 )
			Engine.UploadPaintjobData( f75_arg0, f75_local4.paintjobSlot, f75_local4.paintjobIndex )
			return f75_local4.paintjobSlot, f75_local4.paintjobIndex
		end
	end
end

CoD.CraftUtility.Paintjobs.ClearPaintjob = function ( f76_arg0, f76_arg1, f76_arg2 )
	local f76_local0 = CoD.CraftUtility.GetDDLRoot( f76_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS, f76_arg1 )
	if f76_local0 ~= nil then
		local f76_local1 = f76_local0.weaponPaintjob[f76_arg2]
		f76_local1.paintjobName:set( "" )
		f76_local1.sortIndex:set( CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX )
		f76_local1.weaponIndex:set( CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX )
		Engine.ClearPaintjobLayerData()
		Engine.UploadPaintjobData( f76_arg0, f76_arg1, f76_arg2 )
	end
end

CoD.CraftUtility.Paintjobs.GetPaintjobName = function ( f77_arg0, f77_arg1, f77_arg2 )
	local f77_local0 = CoD.CraftUtility.GetDDLRoot( f77_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS, f77_arg1 )
	if f77_local0 ~= nil then
		return f77_local0.weaponPaintjob[f77_arg2].paintjobName:get()
	else
		return ""
	end
end

CoD.CraftUtility.Paintjobs.RenamePaintjob = function ( f78_arg0, f78_arg1, f78_arg2, f78_arg3 )
	local f78_local0 = Enum.StorageFileType.STORAGE_PAINTJOBS
	local f78_local1 = CoD.CraftUtility.GetDDLRoot( f78_arg0, f78_local0, f78_arg1 )
	if f78_local1 ~= nil then
		f78_local1.weaponPaintjob[f78_arg2].paintjobName:set( f78_arg3 )
		CoD.CraftUtility.UploadAndParseBuffer( f78_arg0, f78_local0, f78_arg1 )
	end
end

CoD.CraftUtility.Paintjobs.PublishPaintjob = function ( f79_arg0 )
	local f79_local0 = CoD.perController[f79_arg0].selectedpaintjobModel
	local f79_local1 = Engine.GetModelValue( Engine.GetModel( f79_local0, "paintjobSlot" ) )
	local f79_local2 = Engine.GetModelValue( Engine.GetModel( f79_local0, "paintjobIndex" ) )
	local f79_local3 = CoD.CraftUtility.GetDDLRoot( f79_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS, f79_local1 )
	if f79_local3 ~= nil then
		Engine.PublishPaintjob( f79_arg0, "paintjob", f79_local1, f79_local2, f79_local3.weaponPaintjob[f79_local2].weaponIndex:get(), CoD.FileshareUtility.GetPublishName(), CoD.FileshareUtility.GetPublishAllowDownload() )
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
	}
}
CoD.CraftUtility.Emblems.GetHighestSortIndex = function ()
	local f80_local0 = CoD.CraftUtility.Emblems.CachedEmblems
	local f80_local1 = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
	for f80_local2 = 1, #f80_local0, 1 do
		local f80_local5 = f80_local0[f80_local2].sortIndex
		if f80_local1 < f80_local5 then
			f80_local1 = f80_local5
		end
	end
	return f80_local1
end

CoD.CraftUtility.Emblems.GetSortedEmblemsList = function ( f81_arg0 )
	local f81_local0 = CoD.CraftUtility.Emblems.CachedEmblems
	local f81_local1 = {}
	local f81_local2 = false
	for f81_local3 = 1, #f81_local0, 1 do
		local f81_local6 = f81_local0[f81_local3]
		if f81_local6.isUsed == 0 and not f81_local2 and f81_arg0 == Enum.StorageFileType.STORAGE_EMBLEMS then
			f81_local6.sortIndex = CoD.CraftUtility.Emblems.GetHighestSortIndex() + 1
			f81_local2 = true
			table.insert( f81_local1, f81_local6 )
		end
		if f81_local6.isUsed == 1 then
			table.insert( f81_local1, f81_local6 )
		end
	end
	table.sort( f81_local1, function ( f82_arg0, f82_arg1 )
		return f82_arg1.sortIndex < f82_arg0.sortIndex
	end )
	return f81_local1
end

CoD.CraftUtility.Emblems.GetTotalUsedEmblems = function ()
	local f83_local0 = CoD.CraftUtility.Emblems.CachedEmblems
	local f83_local1 = 0
	for f83_local2 = 1, #f83_local0, 1 do
		if f83_local0[f83_local2].isUsed == 1 then
			f83_local1 = f83_local1 + 1
		end
	end
	return f83_local1
end

CoD.CraftUtility.Emblems.GetTotalAllowedEmblems = function ( f84_arg0 )
	if f84_arg0 == Enum.StorageFileType.STORAGE_DEFAULT_EMBLEMS then
		return Dvar.default_emblems_max_count:get()
	else
		return Dvar.emblems_max_count:get()
	end
end

CoD.CraftUtility.Emblems.ParseDDL = function ( f85_arg0, f85_arg1 )
	local f85_local0 = CoD.CraftUtility.Emblems.GetTotalAllowedEmblems( f85_arg1 )
	local f85_local1 = CoD.CraftUtility.GetDDLRoot( f85_arg0, f85_arg1 )
	if f85_local1 == nil then
		CoD.CraftUtility.Emblems.CachedEmblems = {}
		return false
	elseif #f85_local1.emblemList < f85_local0 then
		error( "Emblems DDL: DDL does not support " .. f85_local0 .. " emblems." )
		return false
	end
	for f85_local2 = 0, f85_local0, 1 do
		local f85_local5 = {}
		local f85_local6 = f85_local1.emblemList[f85_local2]
		f85_local5.emblemIndex = f85_local2
		f85_local5.isUsed = f85_local6.isUsed:get()
		f85_local5.sortIndex = f85_local6.sortIndex:get()
		f85_local5.emblemName = f85_local6.emblemName:get()
		CoD.CraftUtility.Emblems.CachedEmblems[f85_local2 + 1] = f85_local5
	end
	return true
end

CoD.CraftUtility.Emblems.IsEmblemIndexOccupied = function ( f86_arg0 )
	local f86_local0 = CoD.CraftUtility.Emblems.CachedEmblems
	for f86_local1 = 1, #f86_local0, 1 do
		local f86_local4 = f86_local0[f86_local1]
		if f86_local4.emblemIndex == f86_arg0 then
			return f86_local4.isUsed == 1
		end
	end
	return false
end

CoD.CraftUtility.Emblems.UploadEmblem = function ( f87_arg0, f87_arg1 )
	local f87_local0 = Engine.GetModelValue( Engine.GetModel( f87_arg1, "emblemIndex" ) )
	local f87_local1 = Engine.GetModelValue( Engine.GetModel( f87_arg1, "sortIndex" ) )
	local f87_local2 = Engine.GetModelValue( Engine.GetModel( f87_arg1, "emblemName" ) )
	local f87_local3 = CoD.CraftUtility.GetDDLRoot( f87_arg0, CoD.perController[f87_arg0].selectedEmblemTabStorageType )
	if f87_local3 ~= nil and f87_local0 >= 0 then
		local f87_local4 = f87_local3.emblemList[f87_local0]
		f87_local4.isUsed:set( 1 )
		f87_local4.sortIndex:set( f87_local1 )
		f87_local4.emblemName:set( f87_local2 )
		Engine.UploadEmblemData( f87_arg0, f87_local0 )
	end
end

CoD.CraftUtility.Emblems.RenameEmblem = function ( f88_arg0, f88_arg1, f88_arg2 )
	local f88_local0 = CoD.perController[f88_arg0].selectedEmblemTabStorageType
	local f88_local1 = CoD.CraftUtility.GetDDLRoot( f88_arg0, f88_local0 )
	if f88_local1 ~= nil and f88_arg1 >= 0 then
		f88_local1.emblemList[f88_arg1].emblemName:set( f88_arg2 )
		CoD.CraftUtility.UploadAndParseBuffer( f88_arg0, f88_local0 )
	end
end

CoD.CraftUtility.Emblems.ClearEmblem = function ( f89_arg0, f89_arg1 )
	local f89_local0 = CoD.CraftUtility.GetDDLRoot( f89_arg0, CoD.perController[f89_arg0].selectedEmblemTabStorageType )
	local f89_local1 = Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM
	if f89_local0 ~= nil and f89_arg1 >= 0 then
		local f89_local2 = f89_local0.emblemList[f89_arg1]
		f89_local2.emblemName:set( "" )
		f89_local2.isUsed:set( 0 )
		f89_local2.sortIndex:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		Engine.ExecNow( f89_arg0, "emblemClearAll " .. f89_local1 )
	end
end

CoD.CraftUtility.Emblems.GetEmptyEmblem = function ()
	local f90_local0 = CoD.CraftUtility.Emblems.CachedEmblems
	for f90_local1 = 1, #f90_local0, 1 do
		local f90_local4 = f90_local0[f90_local1]
		if f90_local4.isUsed == 0 then
			f90_local4.sortIndex = CoD.CraftUtility.Emblems.GetHighestSortIndex() + 1
			return f90_local4
		end
	end
end

CoD.CraftUtility.Emblems.Copy = function ( f91_arg0, f91_arg1 )
	local f91_local0 = Engine.GetModelValue( Engine.GetModel( f91_arg1, "emblemIndex" ) )
	local f91_local1 = Engine.GetModelValue( Engine.GetModel( f91_arg1, "sortIndex" ) )
	local f91_local2 = Engine.GetModelValue( Engine.GetModel( f91_arg1, "emblemName" ) )
	local f91_local3 = CoD.CraftUtility.GetDDLRoot( f91_arg0, CoD.perController[f91_arg0].selectedEmblemTabStorageType )
	local f91_local4 = CoD.CraftUtility.Emblems.GetEmptyEmblem()
	if f91_local3 ~= nil and f91_local0 >= 0 and f91_local4 and f91_local4.emblemIndex >= 0 then
		local f91_local5 = f91_local3.emblemList[f91_local0]
		local f91_local6 = f91_local3.emblemList[f91_local4.emblemIndex]
		f91_local6.isUsed:set( 1 )
		f91_local6.sortIndex:set( f91_local4.sortIndex )
		f91_local6.emblemName:set( f91_local2 )
		Engine.UploadEmblemData( f91_arg0, f91_local4.emblemIndex )
		return f91_local4.emblemIndex
	else
		
	end
end

CoD.CraftUtility.Emblems.PublishEmblem = function ( f92_arg0 )
	local modelValue = Engine.GetModelValue( Engine.GetModel( CoD.perController[f92_arg0].selectedEmblemModel, "emblemIndex" ) )
	local f92_local1 = CoD.FileshareUtility.GetPublishName()
	local f92_local2 = CoD.FileshareUtility.GetPublishAllowDownload()
	if modelValue > 0 then
		Engine.PublishEmblem( f92_arg0, "emblem", modelValue - 1, f92_local1, f92_local2 )
	end
end

