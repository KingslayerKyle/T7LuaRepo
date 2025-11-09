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

CoD.CraftUtility.OpenSteamPublishPromptPaintjob = function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3, f15_arg4 )
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
	CoD.SteamWorkshopUtility.OpenPublishPrompt( f15_arg4, f15_arg2, "paintjob", f15_local4, CoD.CraftUtility.Paintjobs.PublishPaintjobToSteamWorkShop )
end

CoD.CraftUtility.PaintjobClearYes = function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3, f16_arg4 )
	PaintjobSelector_ClearPaintjob( f16_arg4, f16_arg1, f16_arg2 )
end

CoD.CraftUtility.PaintjobClearNo = function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3, f17_arg4 )
	GoBack( f17_arg4, f17_arg2 )
end

CoD.CraftUtility.GunsmithClear = function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3, f18_arg4 )
	f18_arg4:openPopup( "GunsmithClearConfirmation", f18_arg2 )
end

CoD.CraftUtility.GunsmithRename = function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3, f19_arg4 )
	ShowKeyboard( f19_arg4, f19_arg1, f19_arg2, "KEYBOARD_TYPE_GUNSMITH" )
end

CoD.CraftUtility.OpenPublishPromptGunsmith = function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3, f20_arg4 )
	CoD.FileshareUtility.OpenPublishPrompt( f20_arg4, f20_arg2, "variant", Engine.GetModelValue( Engine.GetModel( CoD.perController[f20_arg2].gunsmithVariantModel, "variantName" ) ), CoD.CraftUtility.Gunsmith.PublishVariant )
end

CoD.CraftUtility.GunsmithClearYes = function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3, f21_arg4 )
	Gunsmith_ClearVariant( f21_arg0, f21_arg1, f21_arg2 )
end

CoD.CraftUtility.GunsmithClearNo = function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3, f22_arg4 )
	GoBack( f22_arg4, f22_arg2 )
end

CoD.CraftUtility.EmblemClear = function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3, f23_arg4 )
	f23_arg4:openPopup( "EmblemClearConfirmation", f23_arg2 )
end

CoD.CraftUtility.EmblemRename = function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3, f24_arg4 )
	ShowKeyboard( f24_arg4, f24_arg1, f24_arg2, "KEYBOARD_TYPE_EMBLEMS" )
end

CoD.CraftUtility.OpenPublishPromptEmblem = function ( f25_arg0, f25_arg1, f25_arg2, f25_arg3, f25_arg4 )
	if CheckIfFeatureIsBanned( f25_arg2 + 1, LuaEnums.FEATURE_BAN.USER_GENERATED_CONTENT ) then
		LuaUtils.UI_ShowErrorMessageDialog( f25_arg2, GetFeatureBanInfo( f25_arg2 + 1, LuaEnums.FEATURE_BAN.USER_GENERATED_CONTENT ) )
		return 
	else
		CoD.FileshareUtility.OpenPublishPrompt( f25_arg4, f25_arg2, "emblem", Engine.GetModelValue( Engine.GetModel( CoD.perController[f25_arg2].selectedEmblemModel, "emblemName" ) ), CoD.CraftUtility.Emblems.PublishEmblem )
	end
end

CoD.CraftUtility.EmblemClearYes = function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3, f26_arg4 )
	EmblemSelect_ClearEmblem( f26_arg4, f26_arg1, f26_arg2 )
end

CoD.CraftUtility.EmblemClearNo = function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3, f27_arg4 )
	GoBack( f27_arg4, f27_arg2 )
end

CoD.CraftUtility.GetWeaponGroupName = function ( f28_arg0 )
	local f28_local0 = CoD.GetCustomization( f28_arg0, "weapon_index" )
	local f28_local1 = ""
	if f28_local0 then
		f28_local1 = Engine.GetItemGroup( f28_local0, Enum.eModes.MODE_MULTIPLAYER )
	end
	return f28_local1
end

CoD.CraftUtility.Gunsmith.GetFileType = function ()
	local f29_local0 = CoD.CraftUtility.Gunsmith.FileType
	if not f29_local0 then
		f29_local0 = Enum.StorageFileType.STORAGE_GUNSMITH
	end
	return f29_local0
end

CoD.CraftUtility.Gunsmith.GetTotalAllowedVaraints = function ()
	return CoD.CraftUtility.Gunsmith.TotalVariants
end

CoD.CraftUtility.Gunsmith.GetMaxVariantCount = function ( f31_arg0, f31_arg1 )
	local f31_local0 = CoD.CraftUtility.GetDDLRoot( f31_arg0, f31_arg1 )
	local f31_local1 = 0
	if f31_local0 ~= nil then
		local f31_local2 = #f31_local0.variant
		if CoD.CraftUtility.Gunsmith.FileType == Enum.StorageFileType.STORAGE_GUNSMITH then
			if Dvar.gunsmith_totalvariants:exists() then
				local f31_local3 = Dvar.gunsmith_totalvariants:get()
				if f31_local2 < f31_local3 then
					error( "Gunsmith DDL: DDL does not support " .. f31_local3 .. " variants." )
					return 0
				end
				f31_local1 = math.min( f31_local2, f31_local3 )
			end
		else
			f31_local1 = f31_local2
		end
	end
	return f31_local1
end

CoD.CraftUtility.Gunsmith.GetTotalUsedWeaponVariants = function ( f32_arg0 )
	local f32_local0 = CoD.CraftUtility.Gunsmith.CachedVariants
	local f32_local1 = 0
	for f32_local2 = 1, #f32_local0, 1 do
		if f32_local0[f32_local2].weaponIndex == f32_arg0 then
			f32_local1 = f32_local1 + 1
		end
	end
	return f32_local1
end

CoD.CraftUtility.Gunsmith.GetTotalUsedVariants = function ()
	local f33_local0 = CoD.CraftUtility.Gunsmith.CachedVariants
	local f33_local1 = 0
	for f33_local2 = 1, #f33_local0, 1 do
		if f33_local0[f33_local2].weaponIndex ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
			f33_local1 = f33_local1 + 1
		end
	end
	return f33_local1
end

CoD.CraftUtility.Gunsmith.ParseDDL = function ( f34_arg0, f34_arg1 )
	local f34_local0 = CoD.CraftUtility.GetDDLRoot( f34_arg0, f34_arg1 )
	CoD.CraftUtility.Gunsmith.FileType = f34_arg1
	if f34_local0 == nil then
		CoD.CraftUtility.Gunsmith.CachedVariants = {}
		return false
	end
	local f34_local1 = CoD.CraftUtility.Gunsmith.GetMaxVariantCount( f34_arg0, f34_arg1 )
	CoD.CraftUtility.Gunsmith.TotalVariants = f34_local1
	for f34_local2 = 0, f34_local1 - 1, 1 do
		local f34_local5 = {}
		local f34_local6 = f34_local0.variant[f34_local2]
		f34_local5.weaponIndex = f34_local6.weaponIndex:get()
		f34_local5.variantIndex = f34_local6.variantIndex:get()
		f34_local5.sortIndex = f34_local6.sortIndex:get()
		CoD.CraftUtility.Gunsmith.CachedVariants[f34_local2 + 1] = f34_local5
	end
	return true
end

CoD.CraftUtility.Gunsmith.PublishVariant = function ( f35_arg0 )
	local f35_local0 = CoD.perController[f35_arg0].gunsmithVariantModel
	Engine.PublishVariant( f35_arg0, "variant", Engine.GetModelValue( Engine.GetModel( f35_local0, "variantIndex" ) ), Engine.GetModelValue( Engine.GetModel( f35_local0, "paintjobSlot" ) ), Engine.GetModelValue( Engine.GetModel( f35_local0, "paintjobIndex" ) ), Engine.GetModelValue( Engine.GetModel( f35_local0, "weaponIndex" ) ), CoD.FileshareUtility.GetPublishName(), CoD.FileshareUtility.GetPublishAllowDownload() )
end

CoD.CraftUtility.Gunsmith.GetHighestSortIndexForWeapon = function ( f36_arg0 )
	local f36_local0 = CoD.CraftUtility.Gunsmith.CachedVariants
	local f36_local1 = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
	for f36_local2 = 1, #f36_local0, 1 do
		if f36_local0[f36_local2].weaponIndex == f36_arg0 then
			local f36_local5 = f36_local0[f36_local2].sortIndex
			if f36_local1 < f36_local5 then
				f36_local1 = f36_local5
			end
		end
	end
	return f36_local1
end

CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList = function ( f37_arg0 )
	local f37_local0 = CoD.CraftUtility.Gunsmith.CachedVariants
	local f37_local1 = 0
	local f37_local2 = {}
	local f37_local3 = false
	for f37_local4 = 1, #f37_local0, 1 do
		local f37_local7 = f37_local0[f37_local4]
		if f37_local0[f37_local4].weaponIndex == CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX and not f37_local3 then
			f37_local7.sortIndex = CoD.CraftUtility.Gunsmith.GetHighestSortIndexForWeapon( f37_arg0 ) + 1
			f37_local3 = true
			table.insert( f37_local2, f37_local7 )
		end
		if f37_local0[f37_local4].weaponIndex == f37_arg0 then
			table.insert( f37_local2, f37_local7 )
		end
	end
	table.sort( f37_local2, function ( f38_arg0, f38_arg1 )
		return f38_arg1.sortIndex < f38_arg0.sortIndex
	end )
	return f37_local2
end

CoD.CraftUtility.Gunsmith.GetVariantByIndex = function ( f39_arg0, f39_arg1 )
	local f39_local0 = CoD.CraftUtility.GetDDLRoot( f39_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	if f39_local0 ~= nil then
		local f39_local1 = f39_local0.variant[f39_arg1]
		local f39_local2 = {
			attachment = {},
			attachmentVariant = {},
			variantName = f39_local1.variantName:get(),
			camoIndex = f39_local1.camoIndex:get(),
			paintjobSlot = f39_local1.paintjobSlot:get(),
			paintjobIndex = f39_local1.paintjobIndex:get(),
			weaponIndex = f39_local1.weaponIndex:get(),
			variantIndex = f39_local1.variantIndex:get(),
			sortIndex = f39_local1.sortIndex:get(),
			cacVariantIndex = f39_local1.variantIndex:get() + 1
		}
		for f39_local3 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			table.insert( f39_local2.attachment, f39_local1.attachment[f39_local3 - 1]:get() )
		end
		for f39_local3 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			table.insert( f39_local2.attachmentVariant, f39_local1.attachmentVariant[f39_local3 - 1]:get() )
		end
		return f39_local2
	else
		
	end
end

CoD.CraftUtility.Gunsmith.GetVariantIndexFromCACVaraintIndex = function ( f40_arg0, f40_arg1 )
	return CoD.CraftUtility.Gunsmith.GetVariantByIndex( f40_arg0, f40_arg1 - 1 )
end

CoD.CraftUtility.Gunsmith.IsVariantIndexOccupied = function ( f41_arg0 )
	if CoD.CraftUtility.Gunsmith.CachedVariants[f41_arg0 + 1].weaponIndex ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
		return true
	else
		return false
	end
end

CoD.CraftUtility.Gunsmith.WriteVariantAttachmentDataToDDL = function ( f42_arg0, f42_arg1 )
	local f42_local0 = CoD.CraftUtility.GetDDLRoot( f42_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	if f42_local0 ~= nil then
		local f42_local1 = f42_local0.variant[Engine.GetModelValue( Engine.GetModel( f42_arg1, "variantIndex" ) )]
		local f42_local2 = 0
		local f42_local3 = 1
		for f42_local4 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f42_local7 = Engine.GetModel( f42_arg1, "attachment" .. f42_local4 )
			if f42_local7 then
				local f42_local8 = Engine.GetModelValue( f42_local7 )
				if f42_local8 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX or f42_local4 == f42_local3 then
					f42_local1.attachment[f42_local2]:set( f42_local8 )
					local f42_local9 = Engine.GetModel( f42_arg1, "attachmentVariant" .. f42_local4 )
					if f42_local9 then
						f42_local1.attachmentVariant[f42_local2]:set( Engine.GetModelValue( f42_local9 ) )
					end
					f42_local2 = f42_local2 + 1
				end
			end
		end
		for f42_local4 = f42_local2, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS - 1, 1 do
			f42_local1.attachment[f42_local4]:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
			f42_local1.attachmentVariant[f42_local4]:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		end
	end
end

CoD.CraftUtility.Gunsmith.WriteVaraintDataToDDL = function ( f43_arg0, f43_arg1 )
	local f43_local0 = CoD.CraftUtility.GetDDLRoot( f43_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	if f43_local0 ~= nil then
		local f43_local1 = f43_local0.variant[Engine.GetModelValue( Engine.GetModel( f43_arg1, "variantIndex" ) )]
		f43_local1.variantName:set( Engine.GetModelValue( Engine.GetModel( f43_arg1, "variantName" ) ) )
		f43_local1.camoIndex:set( Engine.GetModelValue( Engine.GetModel( f43_arg1, "camoIndex" ) ) )
		f43_local1.paintjobSlot:set( Engine.GetModelValue( Engine.GetModel( f43_arg1, "paintjobSlot" ) ) )
		f43_local1.paintjobIndex:set( Engine.GetModelValue( Engine.GetModel( f43_arg1, "paintjobIndex" ) ) )
		f43_local1.sortIndex:set( Engine.GetModelValue( Engine.GetModel( f43_arg1, "sortIndex" ) ) )
		f43_local1.weaponIndex:set( Engine.GetModelValue( Engine.GetModel( f43_arg1, "weaponIndex" ) ) )
		CoD.CraftUtility.Gunsmith.WriteVariantAttachmentDataToDDL( f43_arg0, f43_arg1 )
		CoD.CraftUtility.UploadAndParseBuffer( f43_arg0, Enum.StorageFileType.STORAGE_GUNSMITH )
	end
end

CoD.CraftUtility.Gunsmith.RenameVariant = function ( f44_arg0, f44_arg1, f44_arg2 )
	local f44_local0 = CoD.CraftUtility.GetDDLRoot( f44_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	if f44_local0 ~= nil then
		f44_local0.variant[f44_arg1].variantName:set( f44_arg2 )
		CoD.CraftUtility.UploadAndParseBuffer( f44_arg0, Enum.StorageFileType.STORAGE_GUNSMITH )
	end
end

CoD.CraftUtility.Gunsmith.ClearVariant = function ( f45_arg0, f45_arg1 )
	local f45_local0 = CoD.CraftUtility.GetDDLRoot( f45_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	if f45_local0 ~= nil then
		local f45_local1 = f45_local0.variant[f45_arg1]
		f45_local1.variantName:set( "" )
		f45_local1.variantIndex:set( f45_arg1 )
		f45_local1.camoIndex:set( CoD.CraftUtility.Gunsmith.CAMO_NONE )
		f45_local1.paintjobSlot:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
		f45_local1.paintjobIndex:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
		f45_local1.weaponIndex:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		f45_local1.sortIndex:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		for f45_local2 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			f45_local1.attachment[f45_local2 - 1]:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		end
		for f45_local2 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			f45_local1.attachmentVariant[f45_local2 - 1]:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		end
		CoD.CraftUtility.UploadAndParseBuffer( f45_arg0, Enum.StorageFileType.STORAGE_GUNSMITH )
	end
end

CoD.CraftUtility.Gunsmith.GetEmptyVariantIndex = function ()
	local f46_local0 = CoD.CraftUtility.Gunsmith.CachedVariants
	for f46_local1 = 1, #f46_local0, 1 do
		local f46_local4 = f46_local0[f46_local1]
		if f46_local0[f46_local1].weaponIndex == CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
			return f46_local0[f46_local1].variantIndex
		end
	end
end

CoD.CraftUtility.Gunsmith.Copy = function ( f47_arg0, f47_arg1 )
	local f47_local0 = CoD.CraftUtility.GetDDLRoot( f47_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	local f47_local1 = CoD.CraftUtility.Gunsmith.GetEmptyVariantIndex()
	if f47_local0 ~= nil and f47_local1 >= 0 then
		local f47_local2 = f47_local0.variant[f47_arg1]
		local f47_local3 = f47_local0.variant[f47_local1]
		f47_local3.variantName:set( f47_local2.variantName:get() )
		f47_local3.camoIndex:set( f47_local2.camoIndex:get() )
		f47_local3.paintjobSlot:set( f47_local2.paintjobSlot:get() )
		f47_local3.paintjobIndex:set( f47_local2.paintjobIndex:get() )
		f47_local3.weaponIndex:set( f47_local2.weaponIndex:get() )
		for f47_local4 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			f47_local3.attachment[f47_local4 - 1]:set( f47_local2.attachment[f47_local4 - 1]:get() )
		end
		for f47_local4 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			f47_local3.attachmentVariant[f47_local4 - 1]:set( f47_local2.attachmentVariant[f47_local4 - 1]:get() )
		end
		f47_local3.sortIndex:set( CoD.CraftUtility.Gunsmith.GetHighestSortIndexForWeapon( f47_local2.weaponIndex:get() ) + 1 )
		CoD.CraftUtility.UploadAndParseBuffer( f47_arg0, Enum.StorageFileType.STORAGE_GUNSMITH )
		return f47_local1
	else
		
	end
end

CoD.CraftUtility.Gunsmith.AddAttachmentToWeapon = function ( f48_arg0, f48_arg1 )
	if f48_arg1 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
		f48_arg0 = f48_arg0 .. "+" .. Engine.GetAttachmentRefByIndex( f48_arg1 )
	end
	return f48_arg0
end

CoD.CraftUtility.Gunsmith.AddAttachmentVariant = function ( f49_arg0, f49_arg1, f49_arg2 )
	return f49_arg0 .. Engine.GetAttachmentRefByIndex( f49_arg1 ) .. "," .. f49_arg2 .. ","
end

CoD.CraftUtility.Gunsmith.GetWeaponByVariantIndex = function ( f50_arg0, f50_arg1 )
	local f50_local0 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f50_arg0, f50_arg1 )
	local f50_local1 = Engine.GetItemRef( f50_local0.weaponIndex, Enum.eModes.MODE_MULTIPLAYER )
	if f50_local0.weaponIndex == 0 then
		f50_local1 = Engine.GetItemRef( CoD.GetCustomization( f50_arg0, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	end
	local f50_local2 = f50_local1 .. CoD.CraftUtility.GetModeAbbreviation()
	if f50_local0.weaponIndex ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
		for f50_local3 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			f50_local2 = CoD.CraftUtility.Gunsmith.AddAttachmentToWeapon( f50_local2, f50_local0.attachment[f50_local3] )
		end
	end
	return f50_local2
end

CoD.CraftUtility.Gunsmith.GetAttachmentVariantByVariantIndex = function ( f51_arg0, f51_arg1 )
	local f51_local0 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f51_arg0, f51_arg1 )
	local f51_local1 = Engine.GetItemRef( f51_local0.weaponIndex, Enum.eModes.MODE_MULTIPLAYER )
	if f51_local0.weaponIndex == 0 then
		f51_local1 = Engine.GetItemRef( CoD.GetCustomization( f51_arg0, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	end
	local f51_local2 = ""
	if f51_local0.weaponIndex ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
		for f51_local3 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f51_local6 = f51_local0.attachment[f51_local3]
			if f51_local6 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				f51_local2 = CoD.CraftUtility.Gunsmith.AddAttachmentVariant( f51_local2, f51_local6, f51_local0.attachmentVariant[f51_local3] )
			end
		end
	end
	return f51_local2
end

CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant = function ( f52_arg0, f52_arg1 )
	local f52_local0 = Engine.GetItemRef( CoD.GetCustomization( f52_arg0, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER ) .. CoD.CraftUtility.GetModeAbbreviation()
	if f52_arg1 then
		for f52_local1 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			f52_local0 = CoD.CraftUtility.Gunsmith.AddAttachmentToWeapon( f52_local0, Engine.GetModelValue( Engine.GetModel( f52_arg1, "attachment" .. f52_local1 ) ) )
		end
	end
	return f52_local0
end

CoD.CraftUtility.Gunsmith.GetWeaponAttachmentList = function ( f53_arg0, f53_arg1 )
	local f53_local0 = CoD.GetCustomization( f53_arg0, "weapon_index" )
	local f53_local1 = Engine.GetItemRef( f53_local0, Enum.eModes.MODE_MULTIPLAYER )
	local f53_local2 = {}
	if f53_arg1 then
		for f53_local3 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f53_local6 = Engine.GetModelValue( Engine.GetModel( f53_arg1, "attachment" .. f53_local3 ) )
			if f53_local6 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				table.insert( f53_local2, {
					index = Engine.GetAttachmentIndexByAttachmentTableIndex( f53_local0, f53_local6, Enum.eModes.MODE_MULTIPLAYER ),
					ref = Engine.GetAttachmentRefByIndex( f53_local6 )
				} )
			end
		end
	end
	return f53_local2
end

CoD.CraftUtility.Gunsmith.GetWeaponAttachmentVariantString = function ( f54_arg0, f54_arg1 )
	local f54_local0 = Engine.GetItemRef( CoD.GetCustomization( f54_arg0, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER )
	local f54_local1 = ""
	if f54_arg1 then
		for f54_local2 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f54_local5 = Engine.GetModelValue( Engine.GetModel( f54_arg1, "attachment" .. f54_local2 ) )
			if f54_local5 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				f54_local1 = CoD.CraftUtility.Gunsmith.AddAttachmentVariant( f54_local1, f54_local5, Engine.GetModelValue( Engine.GetModel( f54_arg1, "attachmentVariant" .. f54_local2 ) ) )
			end
		end
	end
	return f54_local1
end

CoD.CraftUtility.Gunsmith.DisplayBaseWeapon = function ( f55_arg0, f55_arg1, f55_arg2 )
	local f55_local0 = CoD.GetCustomization( f55_arg2, "weapon_index" )
	local f55_local1 = true
	local f55_local2 = nil
	if CoD.perController[f55_arg2].editingWeaponBuildKits then
		f55_local1 = not IsCACItemLocked( f55_arg0, f55_arg1, f55_arg2 )
	end
	local f55_local3 = Engine.GetItemRef( f55_local0, Enum.eModes.MODE_MULTIPLAYER ) .. CoD.CraftUtility.GetModeAbbreviation()
	Engine.SendClientScriptNotify( f55_arg2, "CustomClass_update", CoD.CraftUtility.GetLoadoutSlot( f55_arg2 ), f55_local3, CoD.CACUtility.GetCameraNameForAttachments( f55_local3 ), "0,0,0", f55_local2, f55_local1 )
end

CoD.CraftUtility.Gunsmith.DisplayWeaponWithPaintjob = function ( f56_arg0, f56_arg1, f56_arg2 )
	local f56_local0 = Engine.GetItemRef( CoD.GetCustomization( f56_arg0, "weapon_index" ), Enum.eModes.MODE_MULTIPLAYER ) .. CoD.CraftUtility.GetModeAbbreviation()
	local f56_local1 = CoD.CraftUtility.GetLoadoutSlot( f56_arg0 )
	local f56_local2 = CoD.CACUtility.GetCameraNameForAttachments( f56_local0 )
	Engine.SetupPaintjobData( f56_arg0, f56_arg2, f56_arg1 )
	Engine.SendClientScriptNotify( f56_arg0, "CustomClass_update", f56_local1, f56_local0, f56_local2, "0,0,1" )
end

CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant = function ( f57_arg0, f57_arg1, f57_arg2, f57_arg3, f57_arg4, f57_arg5 )
	if f57_arg1 then
		local f57_local0 = CoD.CraftUtility.GetLoadoutSlot( f57_arg0 )
		local f57_local1 = CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant( f57_arg0, f57_arg1 )
		local f57_local2 = CoD.CACUtility.GetCameraNameForAttachments( f57_local1, f57_arg2 )
		if f57_arg5 == nil then
			f57_arg5 = Engine.GetModelValue( Engine.GetModel( f57_arg1, "camoIndex" ) )
		end
		if f57_arg3 == nil then
			f57_arg3 = Engine.GetModelValue( Engine.GetModel( f57_arg1, "paintjobSlot" ) )
		end
		if f57_arg4 == nil then
			f57_arg4 = Engine.GetModelValue( Engine.GetModel( f57_arg1, "paintjobIndex" ) )
		end
		Engine.SetupPaintjobData( f57_arg0, f57_arg3, f57_arg4 )
		Engine.SendClientScriptNotify( f57_arg0, "CustomClass_update", f57_local0, f57_local1, f57_local2, f57_arg5 .. ",0,1", CoD.CraftUtility.Gunsmith.GetWeaponAttachmentVariantString( f57_arg0, f57_arg1 ) )
	end
end

CoD.CraftUtility.Gunsmith.GetVariantAttachmentList = function ( f58_arg0, f58_arg1 )
	local f58_local0 = {}
	if f58_arg1 then
		for f58_local1 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			table.insert( f58_local0, Engine.GetModelValue( Engine.GetModel( f58_arg1, "attachment" .. f58_local1 ) ) )
		end
	end
	return f58_local0
end

CoD.CraftUtility.Gunsmith.ClearVariantSlotByAttachmentIndex = function ( f59_arg0, f59_arg1, f59_arg2 )
	if f59_arg1 then
		for f59_local0 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f59_local3 = Engine.GetModel( f59_arg1, "attachment" .. f59_local0 )
			local f59_local4 = Engine.GetModelValue( f59_local3 )
			local f59_local5 = Engine.GetModel( f59_arg1, "attachmentVariant" .. f59_local0 )
			if f59_arg2 == f59_local4 then
				Engine.SetModelValue( f59_local5, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
				Engine.SetModelValue( f59_local3, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
			end
		end
	end
end

CoD.CraftUtility.Gunsmith.IsFocusAttachmentEquipped = function ( f60_arg0, f60_arg1, f60_arg2 )
	if f60_arg1 then
		for f60_local0 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			if f60_arg2 == Engine.GetModelValue( Engine.GetModel( f60_arg1, "attachment" .. f60_local0 ) ) then
				return true
			end
		end
	end
end

CoD.CraftUtility.Gunsmith.SetFocusAttachmentVariant = function ( f61_arg0, f61_arg1, f61_arg2, f61_arg3 )
	if f61_arg1 then
		for f61_local0 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f61_local3 = Engine.GetModelValue( Engine.GetModel( f61_arg1, "attachment" .. f61_local0 ) )
			local f61_local4 = Engine.GetModel( f61_arg1, "attachmentVariant" .. f61_local0 )
			if f61_arg2 == f61_local3 then
				Engine.SetModelValue( f61_local4, f61_arg3 )
			end
		end
	end
end

CoD.CraftUtility.Paintjobs = {}
CoD.CraftUtility.Paintjobs.CachedPaintjobs = {}
CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX = 0
CoD.CraftUtility.Paintjobs.GetPrevViewIndex = function ( f62_arg0 )
	local f62_local0 = CoD.CraftUtility.GetWeaponGroupName( f62_arg0 )
	local f62_local1 = #CoD.Paintshop.View
	local f62_local2 = CoD.perController[f62_arg0].viewIndex - 1
	if f62_local2 == 0 then
		f62_local2 = f62_local1
	end
	if f62_local0 == "weapon_knife" and f62_local2 == 2 then
		f62_local2 = f62_local2 - 1
	end
	return f62_local2
end

CoD.CraftUtility.Paintjobs.GetNextViewIndex = function ( f63_arg0 )
	local f63_local0 = CoD.CraftUtility.GetWeaponGroupName( f63_arg0 )
	local f63_local1 = CoD.perController[f63_arg0].viewIndex % #CoD.Paintshop.View + 1
	if f63_local0 == "weapon_knife" and f63_local1 == 2 then
		f63_local1 = f63_local1 + 1
	end
	return f63_local1
end

CoD.CraftUtility.Paintjobs.GetTotalWeaponPaintjobs = function ( f64_arg0 )
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
				if f64_local12 and f64_local12.weaponIndex == f64_arg0 then
					f64_local1 = f64_local1 + 1
				end
			end
		end
	end
	return f64_local1
end

CoD.CraftUtility.Paintjobs.GetTotalUsedPaintjobs = function ()
	local f65_local0 = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local f65_local1 = 0
	local f65_local2 = Engine.GetPaintjobSlotInfo()
	local f65_local3 = f65_local2.slot_count
	local f65_local4 = f65_local2.paintjobs_per_slot
	for f65_local5 = 0, f65_local3 - 1, 1 do
		local f65_local8 = f65_local0[f65_local5]
		if f65_local8 then
			for f65_local9 = 0, f65_local4 - 1, 1 do
				local f65_local12 = f65_local8[f65_local9]
				if f65_local12 and f65_local12.weaponIndex ~= CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX then
					f65_local1 = f65_local1 + 1
				end
			end
		end
	end
	return f65_local1
end

CoD.CraftUtility.Paintjobs.GetHighestSortIndexForWeapon = function ( f66_arg0 )
	local f66_local0 = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local f66_local1 = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
	local f66_local2 = Engine.GetPaintjobSlotInfo()
	local f66_local3 = f66_local2.slot_count
	local f66_local4 = f66_local2.paintjobs_per_slot
	for f66_local5 = 0, f66_local3 - 1, 1 do
		local f66_local8 = f66_local0[f66_local5]
		if f66_local8 then
			for f66_local9 = 0, f66_local4 - 1, 1 do
				local f66_local12 = f66_local8[f66_local9]
				if f66_local12 and f66_local12.weaponIndex == f66_arg0 then
					local f66_local13 = f66_local12.sortIndex
					if f66_local1 < f66_local13 then
						f66_local1 = f66_local13
					end
				end
			end
		end
	end
	return f66_local1
end

CoD.CraftUtility.Paintjobs.GetCACPaintjobList = function ( f67_arg0 )
	local f67_local0 = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local f67_local1 = {}
	local f67_local2 = Engine.GetPaintjobSlotInfo()
	local f67_local3 = f67_local2.slot_count
	local f67_local4 = f67_local2.paintjobs_per_slot
	for f67_local5 = 0, f67_local3 - 1, 1 do
		local f67_local8 = f67_local0[f67_local5]
		if f67_local8 then
			for f67_local9 = 0, f67_local4 - 1, 1 do
				local f67_local12 = f67_local8[f67_local9]
				if f67_local12 and f67_local12.weaponIndex == f67_arg0 then
					table.insert( f67_local1, f67_local12 )
				end
			end
		end
	end
	table.sort( f67_local1, function ( f68_arg0, f68_arg1 )
		return f68_arg1.sortIndex < f68_arg0.sortIndex
	end )
	return f67_local1
end

CoD.CraftUtility.Paintjobs.GetSortedWeaponPaintjobList = function ( f69_arg0 )
	local f69_local0 = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local f69_local1 = {}
	local f69_local2 = false
	local f69_local3 = Engine.GetPaintjobSlotInfo()
	local f69_local4 = f69_local3.slot_count
	local f69_local5 = f69_local3.paintjobs_per_slot
	for f69_local6 = 0, f69_local4 - 1, 1 do
		local f69_local9 = f69_local0[f69_local6]
		if f69_local9 then
			for f69_local10 = 0, f69_local5 - 1, 1 do
				local f69_local13 = f69_local9[f69_local10]
				if f69_local13 then
					if f69_local13.weaponIndex == CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX and not f69_local2 then
						f69_local13.sortIndex = CoD.CraftUtility.Paintjobs.GetHighestSortIndexForWeapon( f69_arg0 ) + 1
						f69_local2 = true
						table.insert( f69_local1, f69_local13 )
					end
					if f69_local13.weaponIndex == f69_arg0 then
						table.insert( f69_local1, f69_local13 )
					end
				end
			end
		end
	end
	table.sort( f69_local1, function ( f70_arg0, f70_arg1 )
		return f70_arg1.sortIndex < f70_arg0.sortIndex
	end )
	return f69_local1
end

CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs = function ()
	return Dvar.total_paintjobs:get()
end

CoD.CraftUtility.Paintjobs.IsPaintjobIndexOccupied = function ( f72_arg0, f72_arg1 )
	if CoD.CraftUtility.Paintjobs.CachedPaintjobs[f72_arg0][f72_arg1].weaponIndex ~= CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX then
		return true
	else
		return false
	end
end

CoD.CraftUtility.Paintjobs.ParseDDL = function ( f73_arg0, f73_arg1 )
	local f73_local0 = Engine.GetPaintjobSlotInfo()
	local f73_local1 = f73_local0.slot_count
	local f73_local2 = f73_local0.paintjobs_per_slot
	local f73_local3 = CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs()
	if f73_local1 * f73_local2 < f73_local3 then
		error( "Paintjob DDL: DDL does not support " .. f73_local3 .. " paintjobs." )
		return false
	end
	for f73_local4 = 0, f73_local1 - 1, 1 do
		local f73_local7 = CoD.CraftUtility.GetDDLRoot( f73_arg0, f73_arg1, f73_local4 )
		CoD.CraftUtility.Paintjobs.CachedPaintjobs[f73_local4] = {}
		if f73_local7 == nil then
			CoD.CraftUtility.Paintjobs.CachedPaintjobs = {}
			return false
		end
		for f73_local8 = 0, f73_local2 - 1, 1 do
			if f73_local3 <= f73_local4 * f73_local2 + f73_local8 then
				return true
			end
			local f73_local11 = {}
			local f73_local12 = f73_local7.weaponPaintjob[f73_local8]
			f73_local11.weaponIndex = f73_local12.weaponIndex:get()
			f73_local11.sortIndex = f73_local12.sortIndex:get()
			f73_local11.paintjobName = f73_local12.paintjobName:get()
			f73_local11.paintjobSlot = f73_local4
			f73_local11.paintjobIndex = f73_local8
			CoD.CraftUtility.Paintjobs.CachedPaintjobs[f73_local4][f73_local8] = f73_local11
		end
	end
	return true
end

CoD.CraftUtility.Paintjobs.UploadPaintjob = function ( f74_arg0, f74_arg1 )
	local f74_local0 = Engine.GetModelValue( Engine.GetModel( f74_arg1, "paintjobSlot" ) )
	local f74_local1 = Engine.GetModelValue( Engine.GetModel( f74_arg1, "paintjobIndex" ) )
	local f74_local2 = Engine.GetModelValue( Engine.GetModel( f74_arg1, "weaponIndex" ) )
	local f74_local3 = Engine.GetModelValue( Engine.GetModel( f74_arg1, "sortIndex" ) )
	local f74_local4 = Engine.GetModelValue( Engine.GetModel( f74_arg1, "paintjobName" ) )
	local f74_local5 = CoD.CraftUtility.GetDDLRoot( f74_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS, f74_local0 )
	if f74_local5 ~= nil then
		local f74_local6 = f74_local5.weaponPaintjob[f74_local1]
		f74_local6.weaponIndex:set( f74_local2 )
		f74_local6.sortIndex:set( f74_local3 )
		f74_local6.paintjobName:set( f74_local4 )
		Engine.UploadPaintjobData( f74_arg0, f74_local0, f74_local1 )
	end
end

CoD.CraftUtility.Paintjobs.GetEmptyPaintjob = function ( f75_arg0 )
	local f75_local0 = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local f75_local1 = Engine.GetPaintjobSlotInfo()
	local f75_local2 = f75_local1.slot_count
	local f75_local3 = f75_local1.paintjobs_per_slot
	for f75_local4 = 0, f75_local2 - 1, 1 do
		local f75_local7 = f75_local0[f75_local4]
		if f75_local7 then
			for f75_local8 = 0, f75_local3 - 1, 1 do
				local f75_local11 = f75_local7[f75_local8]
				if f75_local11.weaponIndex == CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX then
					f75_local11.sortIndex = CoD.CraftUtility.Paintjobs.GetHighestSortIndexForWeapon( f75_arg0 ) + 1
					return f75_local11
				end
			end
		end
	end
end

CoD.CraftUtility.Paintjobs.Copy = function ( f76_arg0, f76_arg1 )
	local f76_local0 = Engine.GetModelValue( Engine.GetModel( f76_arg1, "paintjobSlot" ) )
	local f76_local1 = Engine.GetModelValue( Engine.GetModel( f76_arg1, "weaponIndex" ) )
	local f76_local2 = Engine.GetModelValue( Engine.GetModel( f76_arg1, "paintjobName" ) )
	local f76_local3 = CoD.CraftUtility.GetDDLRoot( f76_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS, f76_local0 )
	local f76_local4 = CoD.CraftUtility.Paintjobs.GetEmptyPaintjob( f76_local1 )
	if f76_local3 ~= nil and f76_local4 ~= nil then
		local f76_local5 = CoD.CraftUtility.GetDDLRoot( f76_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS, f76_local4.paintjobSlot )
		if f76_local5 ~= nil then
			local f76_local6 = f76_local5.weaponPaintjob[f76_local4.paintjobIndex]
			f76_local6.weaponIndex:set( f76_local1 )
			f76_local6.sortIndex:set( f76_local4.sortIndex )
			f76_local6.paintjobName:set( f76_local2 )
			Engine.UploadPaintjobData( f76_arg0, f76_local4.paintjobSlot, f76_local4.paintjobIndex )
			return f76_local4.paintjobSlot, f76_local4.paintjobIndex
		end
	end
end

CoD.CraftUtility.Paintjobs.ClearPaintjob = function ( f77_arg0, f77_arg1, f77_arg2 )
	local f77_local0 = CoD.CraftUtility.GetDDLRoot( f77_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS, f77_arg1 )
	if f77_local0 ~= nil then
		local f77_local1 = f77_local0.weaponPaintjob[f77_arg2]
		f77_local1.paintjobName:set( "" )
		f77_local1.sortIndex:set( CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX )
		f77_local1.weaponIndex:set( CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX )
		Engine.ClearPaintjobLayerData()
		Engine.UploadPaintjobData( f77_arg0, f77_arg1, f77_arg2 )
	end
end

CoD.CraftUtility.Paintjobs.GetPaintjobName = function ( f78_arg0, f78_arg1, f78_arg2 )
	local f78_local0 = CoD.CraftUtility.GetDDLRoot( f78_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS, f78_arg1 )
	if f78_local0 ~= nil then
		return f78_local0.weaponPaintjob[f78_arg2].paintjobName:get()
	else
		return ""
	end
end

CoD.CraftUtility.Paintjobs.RenamePaintjob = function ( f79_arg0, f79_arg1, f79_arg2, f79_arg3 )
	local f79_local0 = Enum.StorageFileType.STORAGE_PAINTJOBS
	local f79_local1 = CoD.CraftUtility.GetDDLRoot( f79_arg0, f79_local0, f79_arg1 )
	if f79_local1 ~= nil then
		f79_local1.weaponPaintjob[f79_arg2].paintjobName:set( f79_arg3 )
		CoD.CraftUtility.UploadAndParseBuffer( f79_arg0, f79_local0, f79_arg1 )
	end
end

CoD.CraftUtility.Paintjobs.PublishPaintjob = function ( f80_arg0 )
	local f80_local0 = CoD.perController[f80_arg0].selectedpaintjobModel
	local f80_local1 = Engine.GetModelValue( Engine.GetModel( f80_local0, "paintjobSlot" ) )
	local f80_local2 = Engine.GetModelValue( Engine.GetModel( f80_local0, "paintjobIndex" ) )
	local f80_local3 = CoD.CraftUtility.GetDDLRoot( f80_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS, f80_local1 )
	if f80_local3 ~= nil then
		Engine.PublishPaintjob( f80_arg0, "paintjob", f80_local1, f80_local2, f80_local3.weaponPaintjob[f80_local2].weaponIndex:get(), CoD.FileshareUtility.GetPublishName(), CoD.FileshareUtility.GetPublishAllowDownload() )
	end
end

CoD.CraftUtility.Paintjobs.PublishPaintjobToSteamWorkShop = function ( f81_arg0 )
	local f81_local0 = CoD.perController[f81_arg0].selectedpaintjobModel
	local f81_local1 = Engine.GetModelValue( Engine.GetModel( f81_local0, "paintjobSlot" ) )
	local f81_local2 = Engine.GetModelValue( Engine.GetModel( f81_local0, "paintjobIndex" ) )
	local f81_local3 = CoD.CraftUtility.GetDDLRoot( f81_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS, f81_local1 )
	if f81_local3 ~= nil then
		Engine.PublishPaintjobToSteamWorkshop( f81_arg0, "paintjob", f81_local1, f81_local2, f81_local3.weaponPaintjob[f81_local2].weaponIndex:get(), CoD.FileshareUtility.GetPublishName(), CoD.FileshareUtility.GetPublishDescription(), CoD.FileshareUtility.GetPublishTags() )
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
	local f82_local0 = CoD.CraftUtility.Emblems.CachedEmblems
	local f82_local1 = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
	for f82_local2 = 1, #f82_local0, 1 do
		local f82_local5 = f82_local0[f82_local2].sortIndex
		if f82_local1 < f82_local5 then
			f82_local1 = f82_local5
		end
	end
	return f82_local1
end

CoD.CraftUtility.Emblems.GetSortedEmblemsList = function ( f83_arg0 )
	local f83_local0 = CoD.CraftUtility.Emblems.CachedEmblems
	local f83_local1 = {}
	local f83_local2 = false
	for f83_local3 = 1, #f83_local0, 1 do
		local f83_local6 = f83_local0[f83_local3]
		if f83_local6.isUsed == 0 and not f83_local2 and f83_arg0 == Enum.StorageFileType.STORAGE_EMBLEMS then
			f83_local6.sortIndex = CoD.CraftUtility.Emblems.GetHighestSortIndex() + 1
			f83_local2 = true
			table.insert( f83_local1, f83_local6 )
		end
		if f83_local6.isUsed == 1 then
			table.insert( f83_local1, f83_local6 )
		end
	end
	table.sort( f83_local1, function ( f84_arg0, f84_arg1 )
		return f84_arg1.sortIndex < f84_arg0.sortIndex
	end )
	return f83_local1
end

CoD.CraftUtility.Emblems.GetTotalUsedEmblems = function ()
	local f85_local0 = CoD.CraftUtility.Emblems.CachedEmblems
	local f85_local1 = 0
	for f85_local2 = 1, #f85_local0, 1 do
		if f85_local0[f85_local2].isUsed == 1 then
			f85_local1 = f85_local1 + 1
		end
	end
	return f85_local1
end

CoD.CraftUtility.Emblems.GetTotalAllowedEmblems = function ( f86_arg0 )
	if f86_arg0 == Enum.StorageFileType.STORAGE_DEFAULT_EMBLEMS then
		return Dvar.default_emblems_max_count:get()
	else
		return Dvar.emblems_max_count:get()
	end
end

CoD.CraftUtility.Emblems.ParseDDL = function ( f87_arg0, f87_arg1 )
	local f87_local0 = CoD.CraftUtility.Emblems.GetTotalAllowedEmblems( f87_arg1 )
	local f87_local1 = CoD.CraftUtility.GetDDLRoot( f87_arg0, f87_arg1 )
	if f87_local1 == nil then
		CoD.CraftUtility.Emblems.CachedEmblems = {}
		return false
	elseif #f87_local1.emblemList < f87_local0 then
		error( "Emblems DDL: DDL does not support " .. f87_local0 .. " emblems." )
		return false
	end
	for f87_local2 = 0, f87_local0, 1 do
		local f87_local5 = {}
		local f87_local6 = f87_local1.emblemList[f87_local2]
		f87_local5.emblemIndex = f87_local2
		f87_local5.isUsed = f87_local6.isUsed:get()
		f87_local5.sortIndex = f87_local6.sortIndex:get()
		f87_local5.emblemName = f87_local6.emblemName:get()
		CoD.CraftUtility.Emblems.CachedEmblems[f87_local2 + 1] = f87_local5
	end
	return true
end

CoD.CraftUtility.Emblems.IsEmblemIndexOccupied = function ( f88_arg0 )
	local f88_local0 = CoD.CraftUtility.Emblems.CachedEmblems
	for f88_local1 = 1, #f88_local0, 1 do
		local f88_local4 = f88_local0[f88_local1]
		if f88_local4.emblemIndex == f88_arg0 then
			return f88_local4.isUsed == 1
		end
	end
	return false
end

CoD.CraftUtility.Emblems.UploadEmblem = function ( f89_arg0, f89_arg1 )
	local f89_local0 = Engine.GetModelValue( Engine.GetModel( f89_arg1, "emblemIndex" ) )
	local f89_local1 = Engine.GetModelValue( Engine.GetModel( f89_arg1, "sortIndex" ) )
	local f89_local2 = Engine.GetModelValue( Engine.GetModel( f89_arg1, "emblemName" ) )
	local f89_local3 = CoD.CraftUtility.GetDDLRoot( f89_arg0, CoD.perController[f89_arg0].selectedEmblemTabStorageType )
	if f89_local3 ~= nil and f89_local0 >= 0 then
		local f89_local4 = f89_local3.emblemList[f89_local0]
		f89_local4.isUsed:set( 1 )
		f89_local4.sortIndex:set( f89_local1 )
		f89_local4.emblemName:set( f89_local2 )
		Engine.UploadEmblemData( f89_arg0, f89_local0 )
	end
end

CoD.CraftUtility.Emblems.RenameEmblem = function ( f90_arg0, f90_arg1, f90_arg2 )
	local f90_local0 = CoD.perController[f90_arg0].selectedEmblemTabStorageType
	local f90_local1 = CoD.CraftUtility.GetDDLRoot( f90_arg0, f90_local0 )
	if f90_local1 ~= nil and f90_arg1 >= 0 then
		f90_local1.emblemList[f90_arg1].emblemName:set( f90_arg2 )
		CoD.CraftUtility.UploadAndParseBuffer( f90_arg0, f90_local0 )
	end
end

CoD.CraftUtility.Emblems.ClearEmblem = function ( f91_arg0, f91_arg1 )
	local f91_local0 = CoD.CraftUtility.GetDDLRoot( f91_arg0, CoD.perController[f91_arg0].selectedEmblemTabStorageType )
	local f91_local1 = Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM
	if f91_local0 ~= nil and f91_arg1 >= 0 then
		local f91_local2 = f91_local0.emblemList[f91_arg1]
		f91_local2.emblemName:set( "" )
		f91_local2.isUsed:set( 0 )
		f91_local2.sortIndex:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		Engine.ExecNow( f91_arg0, "emblemClearAll " .. f91_local1 )
	end
end

CoD.CraftUtility.Emblems.GetEmptyEmblem = function ()
	local f92_local0 = CoD.CraftUtility.Emblems.CachedEmblems
	for f92_local1 = 1, #f92_local0, 1 do
		local f92_local4 = f92_local0[f92_local1]
		if f92_local4.isUsed == 0 then
			f92_local4.sortIndex = CoD.CraftUtility.Emblems.GetHighestSortIndex() + 1
			return f92_local4
		end
	end
end

CoD.CraftUtility.Emblems.Copy = function ( f93_arg0, f93_arg1 )
	local f93_local0 = Engine.GetModelValue( Engine.GetModel( f93_arg1, "emblemIndex" ) )
	local f93_local1 = Engine.GetModelValue( Engine.GetModel( f93_arg1, "sortIndex" ) )
	local f93_local2 = Engine.GetModelValue( Engine.GetModel( f93_arg1, "emblemName" ) )
	local f93_local3 = CoD.CraftUtility.GetDDLRoot( f93_arg0, CoD.perController[f93_arg0].selectedEmblemTabStorageType )
	local f93_local4 = CoD.CraftUtility.Emblems.GetEmptyEmblem()
	if f93_local3 ~= nil and f93_local0 >= 0 and f93_local4 and f93_local4.emblemIndex >= 0 then
		local f93_local5 = f93_local3.emblemList[f93_local0]
		local f93_local6 = f93_local3.emblemList[f93_local4.emblemIndex]
		f93_local6.isUsed:set( 1 )
		f93_local6.sortIndex:set( f93_local4.sortIndex )
		f93_local6.emblemName:set( f93_local2 )
		Engine.UploadEmblemData( f93_arg0, f93_local4.emblemIndex )
		return f93_local4.emblemIndex
	else
		
	end
end

CoD.CraftUtility.Emblems.PublishEmblem = function ( f94_arg0 )
	local modelValue = Engine.GetModelValue( Engine.GetModel( CoD.perController[f94_arg0].selectedEmblemModel, "emblemIndex" ) )
	local f94_local1 = CoD.FileshareUtility.GetPublishName()
	local f94_local2 = CoD.FileshareUtility.GetPublishAllowDownload()
	if modelValue > 0 then
		Engine.PublishEmblem( f94_arg0, "emblem", modelValue - 1, f94_local1, f94_local2 )
	end
end

