require( "lua.Shared.LuaUtils" )

CoD.CraftUtility = {}
CoD.CraftUtility.Gunsmith = {}
CoD.CraftUtility.Gunsmith.CachedVariants = {}
CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS = 8
CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX = 0
CoD.CraftUtility.Gunsmith.CAMO_NONE = 0
CoD.CraftUtility.GetDDLRoot = function ( f1_arg0, f1_arg1, f1_arg2 )
	if f1_arg1 == "cacRoot" then
		return Engine.GetCACRoot( f1_arg0 )
	elseif f1_arg2 ~= nil then
		return Engine.StorageGetBuffer( f1_arg0, f1_arg1, f1_arg2 )
	else
		return Engine.StorageGetBuffer( f1_arg0, f1_arg1 )
	end
end

CoD.CraftUtility.UploadBuffer = function ( f2_arg0, f2_arg1, f2_arg2 )
	if f2_arg1 == Enum.StorageFileType.STORAGE_GUNSMITH then
		f2_arg1 = CoD.CraftUtility.Gunsmith.GetFileType()
	end
	if f2_arg1 == "cacRoot" then
		Engine.Exec( f2_arg0, "saveLoadout" )
	elseif f2_arg2 ~= nil then
		Engine.StorageWrite( f2_arg0, f2_arg1, f2_arg2 )
	else
		Engine.StorageWrite( f2_arg0, f2_arg1 )
	end
end

CoD.CraftUtility.UploadAndParseBuffer = function ( f3_arg0, f3_arg1, f3_arg2 )
	CoD.CraftUtility.UploadBuffer( f3_arg0, f3_arg1, f3_arg2 )
	if f3_arg1 == Enum.StorageFileType.STORAGE_GUNSMITH then
		CoD.CraftUtility.Gunsmith.ParseDDL( f3_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	elseif f3_arg1 == Enum.StorageFileType.STORAGE_EMBLEMS then
		CoD.CraftUtility.Emblems.ParseDDL( f3_arg0, f3_arg1 )
	elseif f3_arg1 == Enum.StorageFileType.STORAGE_PAINTJOBS then
		CoD.CraftUtility.Paintjobs.ParseDDL( f3_arg0, f3_arg1 )
	end
end

CoD.CraftUtility.GetModeAbbreviation = function ()
	if CoD.isSafehouse then
		return "_cp"
	else
		return "_mp"
	end
end

CoD.CraftUtility.GetLoadoutSlot = function ( f5_arg0 )
	local f5_local0
	if CoD.GetCustomization( f5_arg0, "category_index" ) ~= nil then
		f5_local0 = CoD.GetCustomization( f5_arg0, "category_index" ) - 1
	else
		f5_local0 = 1
	end
	return CoD.Craft.WeaponGroupNames[f5_local0].loadout_slot
end

CoD.CraftUtility.DisplayWeaponInPaintshop = function ( f6_arg0, f6_arg1 )
	Engine.SendClientScriptNotify( f6_arg0, "CustomClass_update", CoD.CraftUtility.GetLoadoutSlot( f6_arg0 ), Engine.GetItemRef( CoD.GetCustomization( f6_arg0, "weapon_index" ) ) .. CoD.CraftUtility.GetModeAbbreviation(), f6_arg1, "0,0,1" )
end

CoD.CraftUtility.PaintjobClear = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3, f7_arg4 )
	f7_arg4:openPopup( "PaintjobClearConfirmation", f7_arg2 )
end

CoD.CraftUtility.PaintjobRename = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4 )
	ShowKeyboard( f8_arg4, f8_arg1, f8_arg2, "KEYBOARD_TYPE_PAINTJOB" )
end

CoD.CraftUtility.OpenPublishPromptPaintjob = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3, f9_arg4 )
	local f9_local0 = CoD.perController[f9_arg2].selectedpaintjobModel
	local f9_local1 = Engine.GetModelValue( Engine.GetModel( f9_local0, "paintjobSlot" ) )
	local f9_local2 = Engine.GetModelValue( Engine.GetModel( f9_local0, "paintjobIndex" ) )
	local f9_local3 = CoD.CraftUtility.GetDDLRoot( f9_arg2, Enum.StorageFileType.STORAGE_PAINTJOBS, f9_local1 )
	local f9_local4 = ""
	if f9_local3 ~= nil then
		local f9_local5 = f9_local3.weaponPaintjob[f9_local2].paintjobName:get()
		if f9_local5 ~= nil then
			f9_local4 = f9_local5
		end
	end
	CoD.FileshareUtility.OpenPublishPrompt( f9_arg4, f9_arg2, "paintjob", f9_local4, CoD.CraftUtility.Paintjobs.PublishPaintjob )
end

CoD.CraftUtility.OpenSteamPublishPromptPaintjob = function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3, f10_arg4 )
	local f10_local0 = CoD.perController[f10_arg2].selectedpaintjobModel
	local f10_local1 = Engine.GetModelValue( Engine.GetModel( f10_local0, "paintjobSlot" ) )
	local f10_local2 = Engine.GetModelValue( Engine.GetModel( f10_local0, "paintjobIndex" ) )
	local f10_local3 = CoD.CraftUtility.GetDDLRoot( f10_arg2, Enum.StorageFileType.STORAGE_PAINTJOBS, f10_local1 )
	local f10_local4 = ""
	if f10_local3 ~= nil then
		local f10_local5 = f10_local3.weaponPaintjob[f10_local2].paintjobName:get()
		if f10_local5 ~= nil then
			f10_local4 = f10_local5
		end
	end
	CoD.SteamWorkshopUtility.OpenPublishPrompt( f10_arg4, f10_arg2, "paintjob", f10_local4, CoD.CraftUtility.Paintjobs.PublishPaintjobToSteamWorkShop )
end

CoD.CraftUtility.PaintjobClearYes = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3, f11_arg4 )
	PaintjobSelector_ClearPaintjob( f11_arg4, f11_arg1, f11_arg2 )
end

CoD.CraftUtility.PaintjobClearNo = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3, f12_arg4 )
	GoBack( f12_arg4, f12_arg2 )
end

CoD.CraftUtility.GunsmithClear = function ( f13_arg0, f13_arg1, f13_arg2, f13_arg3, f13_arg4 )
	f13_arg4:openPopup( "GunsmithClearConfirmation", f13_arg2 )
end

CoD.CraftUtility.GunsmithRename = function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3, f14_arg4 )
	ShowKeyboard( f14_arg4, f14_arg1, f14_arg2, "KEYBOARD_TYPE_GUNSMITH" )
end

CoD.CraftUtility.OpenPublishPromptGunsmith = function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3, f15_arg4 )
	CoD.FileshareUtility.OpenPublishPrompt( f15_arg4, f15_arg2, "variant", Engine.GetModelValue( Engine.GetModel( CoD.perController[f15_arg2].gunsmithVariantModel, "variantName" ) ), CoD.CraftUtility.Gunsmith.PublishVariant )
end

CoD.CraftUtility.GunsmithClearYes = function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3, f16_arg4 )
	Gunsmith_ClearVariant( f16_arg0, f16_arg1, f16_arg2 )
end

CoD.CraftUtility.GunsmithClearNo = function ( f17_arg0, f17_arg1, f17_arg2, f17_arg3, f17_arg4 )
	GoBack( f17_arg4, f17_arg2 )
end

CoD.CraftUtility.EmblemClear = function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3, f18_arg4 )
	f18_arg4:openPopup( "EmblemClearConfirmation", f18_arg2 )
end

CoD.CraftUtility.EmblemRename = function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3, f19_arg4 )
	ShowKeyboard( f19_arg4, f19_arg1, f19_arg2, "KEYBOARD_TYPE_EMBLEMS" )
end

CoD.CraftUtility.OpenPublishPromptEmblem = function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3, f20_arg4 )
	CoD.FileshareUtility.OpenPublishPrompt( f20_arg4, f20_arg2, "emblem", Engine.GetModelValue( Engine.GetModel( CoD.perController[f20_arg2].selectedEmblemModel, "emblemName" ) ), CoD.CraftUtility.Emblems.PublishEmblem )
end

CoD.CraftUtility.EmblemClearYes = function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3, f21_arg4 )
	EmblemSelect_ClearEmblem( f21_arg4, f21_arg1, f21_arg2 )
end

CoD.CraftUtility.EmblemClearNo = function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3, f22_arg4 )
	GoBack( f22_arg4, f22_arg2 )
end

CoD.CraftUtility.GetWeaponGroupName = function ( f23_arg0 )
	local f23_local0 = CoD.GetCustomization( f23_arg0, "weapon_index" )
	local f23_local1 = ""
	if f23_local0 then
		f23_local1 = Engine.GetItemGroup( f23_local0, Enum.eModes.MODE_MULTIPLAYER )
	end
	return f23_local1
end

CoD.CraftUtility.Gunsmith.GetFileType = function ()
	local f24_local0 = CoD.CraftUtility.Gunsmith.FileType
	if not f24_local0 then
		f24_local0 = Enum.StorageFileType.STORAGE_GUNSMITH
	end
	return f24_local0
end

CoD.CraftUtility.Gunsmith.GetTotalVaraints = function ()
	return CoD.CraftUtility.Gunsmith.TotalVariants
end

CoD.CraftUtility.Gunsmith.GetTotalUsedWeaponVariants = function ( f26_arg0 )
	local f26_local0 = CoD.CraftUtility.Gunsmith.CachedVariants
	local f26_local1 = 0
	for f26_local2 = 1, #f26_local0, 1 do
		if f26_local0[f26_local2].weaponIndex == f26_arg0 then
			f26_local1 = f26_local1 + 1
		end
	end
	return f26_local1
end

CoD.CraftUtility.Gunsmith.GetTotalUsedVariants = function ()
	local f27_local0 = CoD.CraftUtility.Gunsmith.CachedVariants
	local f27_local1 = 0
	for f27_local2 = 1, #f27_local0, 1 do
		if f27_local0[f27_local2].weaponIndex ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
			f27_local1 = f27_local1 + 1
		end
	end
	return f27_local1
end

CoD.CraftUtility.Gunsmith.ParseDDL = function ( f28_arg0, f28_arg1 )
	local f28_local0 = CoD.CraftUtility.GetDDLRoot( f28_arg0, f28_arg1 )
	CoD.CraftUtility.Gunsmith.FileType = f28_arg1
	if f28_local0 == nil then
		CoD.CraftUtility.Gunsmith.CachedVariants = {}
		return false
	end
	local f28_local1 = #f28_local0.variant
	CoD.CraftUtility.Gunsmith.TotalVariants = f28_local1
	for f28_local2 = 0, f28_local1 - 1, 1 do
		local f28_local5 = {}
		local f28_local6 = f28_local0.variant[f28_local2]
		f28_local5.weaponIndex = f28_local6.weaponIndex:get()
		f28_local5.variantIndex = f28_local6.variantIndex:get()
		f28_local5.sortIndex = f28_local6.sortIndex:get()
		CoD.CraftUtility.Gunsmith.CachedVariants[f28_local2 + 1] = f28_local5
	end
	return true
end

CoD.CraftUtility.Gunsmith.PublishVariant = function ( f29_arg0 )
	local f29_local0 = CoD.perController[f29_arg0].gunsmithVariantModel
	Engine.PublishVariant( f29_arg0, "variant", Engine.GetModelValue( Engine.GetModel( f29_local0, "variantIndex" ) ), Engine.GetModelValue( Engine.GetModel( f29_local0, "paintjobSlot" ) ), Engine.GetModelValue( Engine.GetModel( f29_local0, "paintjobIndex" ) ), Engine.GetModelValue( Engine.GetModel( f29_local0, "weaponIndex" ) ), CoD.FileshareUtility.GetPublishName(), CoD.FileshareUtility.GetPublishAllowDownload() )
end

CoD.CraftUtility.Gunsmith.GetHighestSortIndexForWeapon = function ( f30_arg0 )
	local f30_local0 = CoD.CraftUtility.Gunsmith.CachedVariants
	local f30_local1 = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
	for f30_local2 = 1, #f30_local0, 1 do
		if f30_local0[f30_local2].weaponIndex == f30_arg0 then
			local f30_local5 = f30_local0[f30_local2].sortIndex
			if f30_local1 < f30_local5 then
				f30_local1 = f30_local5
			end
		end
	end
	return f30_local1
end

CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList = function ( f31_arg0 )
	local f31_local0 = CoD.CraftUtility.Gunsmith.CachedVariants
	local f31_local1 = 0
	local f31_local2 = {}
	local f31_local3 = false
	for f31_local4 = 1, #f31_local0, 1 do
		local f31_local7 = f31_local0[f31_local4]
		if f31_local0[f31_local4].weaponIndex == CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX and not f31_local3 then
			f31_local7.sortIndex = CoD.CraftUtility.Gunsmith.GetHighestSortIndexForWeapon( f31_arg0 ) + 1
			f31_local3 = true
			table.insert( f31_local2, f31_local7 )
		end
		if f31_local0[f31_local4].weaponIndex == f31_arg0 then
			table.insert( f31_local2, f31_local7 )
		end
	end
	table.sort( f31_local2, function ( f32_arg0, f32_arg1 )
		return f32_arg1.sortIndex < f32_arg0.sortIndex
	end )
	return f31_local2
end

CoD.CraftUtility.Gunsmith.GetVariantByIndex = function ( f33_arg0, f33_arg1 )
	local f33_local0 = CoD.CraftUtility.GetDDLRoot( f33_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	if f33_local0 ~= nil then
		local f33_local1 = f33_local0.variant[f33_arg1]
		local f33_local2 = {
			attachment = {},
			attachmentVariant = {},
			variantName = f33_local1.variantName:get(),
			camoIndex = f33_local1.camoIndex:get(),
			paintjobSlot = f33_local1.paintjobSlot:get(),
			paintjobIndex = f33_local1.paintjobIndex:get(),
			weaponIndex = f33_local1.weaponIndex:get(),
			variantIndex = f33_local1.variantIndex:get(),
			sortIndex = f33_local1.sortIndex:get(),
			cacVariantIndex = f33_local1.variantIndex:get() + 1
		}
		for f33_local3 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			table.insert( f33_local2.attachment, f33_local1.attachment[f33_local3 - 1]:get() )
		end
		for f33_local3 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			table.insert( f33_local2.attachmentVariant, f33_local1.attachmentVariant[f33_local3 - 1]:get() )
		end
		return f33_local2
	else
		
	end
end

CoD.CraftUtility.Gunsmith.GetVariantIndexFromCACVaraintIndex = function ( f34_arg0, f34_arg1 )
	return CoD.CraftUtility.Gunsmith.GetVariantByIndex( f34_arg0, f34_arg1 - 1 )
end

CoD.CraftUtility.Gunsmith.IsVariantIndexOccupied = function ( f35_arg0 )
	if CoD.CraftUtility.Gunsmith.CachedVariants[f35_arg0 + 1].weaponIndex ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
		return true
	else
		return false
	end
end

CoD.CraftUtility.Gunsmith.WriteVariantAttachmentDataToDDL = function ( f36_arg0, f36_arg1 )
	local f36_local0 = CoD.CraftUtility.GetDDLRoot( f36_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	if f36_local0 ~= nil then
		local f36_local1 = f36_local0.variant[Engine.GetModelValue( Engine.GetModel( f36_arg1, "variantIndex" ) )]
		local f36_local2 = 0
		local f36_local3 = 1
		for f36_local4 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f36_local7 = Engine.GetModel( f36_arg1, "attachment" .. f36_local4 )
			if f36_local7 then
				local f36_local8 = Engine.GetModelValue( f36_local7 )
				if f36_local8 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX or f36_local4 == f36_local3 then
					f36_local1.attachment[f36_local2]:set( f36_local8 )
					local f36_local9 = Engine.GetModel( f36_arg1, "attachmentVariant" .. f36_local4 )
					if f36_local9 then
						f36_local1.attachmentVariant[f36_local2]:set( Engine.GetModelValue( f36_local9 ) )
					end
					f36_local2 = f36_local2 + 1
				end
			end
		end
		for f36_local4 = f36_local2, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS - 1, 1 do
			f36_local1.attachment[f36_local4]:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
			f36_local1.attachmentVariant[f36_local4]:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		end
	end
end

CoD.CraftUtility.Gunsmith.WriteVaraintDataToDDL = function ( f37_arg0, f37_arg1 )
	local f37_local0 = CoD.CraftUtility.GetDDLRoot( f37_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	if f37_local0 ~= nil then
		local f37_local1 = f37_local0.variant[Engine.GetModelValue( Engine.GetModel( f37_arg1, "variantIndex" ) )]
		f37_local1.variantName:set( Engine.GetModelValue( Engine.GetModel( f37_arg1, "variantName" ) ) )
		f37_local1.camoIndex:set( Engine.GetModelValue( Engine.GetModel( f37_arg1, "camoIndex" ) ) )
		f37_local1.paintjobSlot:set( Engine.GetModelValue( Engine.GetModel( f37_arg1, "paintjobSlot" ) ) )
		f37_local1.paintjobIndex:set( Engine.GetModelValue( Engine.GetModel( f37_arg1, "paintjobIndex" ) ) )
		f37_local1.sortIndex:set( Engine.GetModelValue( Engine.GetModel( f37_arg1, "sortIndex" ) ) )
		f37_local1.weaponIndex:set( Engine.GetModelValue( Engine.GetModel( f37_arg1, "weaponIndex" ) ) )
		CoD.CraftUtility.Gunsmith.WriteVariantAttachmentDataToDDL( f37_arg0, f37_arg1 )
		CoD.CraftUtility.UploadAndParseBuffer( f37_arg0, Enum.StorageFileType.STORAGE_GUNSMITH )
	end
end

CoD.CraftUtility.Gunsmith.RenameVariant = function ( f38_arg0, f38_arg1, f38_arg2 )
	local f38_local0 = CoD.CraftUtility.GetDDLRoot( f38_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	if f38_local0 ~= nil then
		f38_local0.variant[f38_arg1].variantName:set( f38_arg2 )
		CoD.CraftUtility.UploadAndParseBuffer( f38_arg0, Enum.StorageFileType.STORAGE_GUNSMITH )
	end
end

CoD.CraftUtility.Gunsmith.ClearVariant = function ( f39_arg0, f39_arg1 )
	local f39_local0 = CoD.CraftUtility.GetDDLRoot( f39_arg0, CoD.CraftUtility.Gunsmith.GetFileType() )
	if f39_local0 ~= nil then
		local f39_local1 = f39_local0.variant[f39_arg1]
		f39_local1.variantName:set( "" )
		f39_local1.variantIndex:set( f39_arg1 )
		f39_local1.camoIndex:set( CoD.CraftUtility.Gunsmith.CAMO_NONE )
		f39_local1.paintjobSlot:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
		f39_local1.paintjobIndex:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
		f39_local1.weaponIndex:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		f39_local1.sortIndex:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		for f39_local2 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			f39_local1.attachment[f39_local2 - 1]:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		end
		for f39_local2 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			f39_local1.attachmentVariant[f39_local2 - 1]:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		end
		CoD.CraftUtility.UploadAndParseBuffer( f39_arg0, Enum.StorageFileType.STORAGE_GUNSMITH )
	end
end

CoD.CraftUtility.Gunsmith.AddAttachmentToWeapon = function ( f40_arg0, f40_arg1 )
	if f40_arg1 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
		f40_arg0 = f40_arg0 .. "+" .. Engine.GetAttachmentRefByIndex( f40_arg1 )
	end
	return f40_arg0
end

CoD.CraftUtility.Gunsmith.AddAttachmentVariant = function ( f41_arg0, f41_arg1, f41_arg2 )
	return f41_arg0 .. Engine.GetAttachmentRefByIndex( f41_arg1 ) .. "," .. f41_arg2 .. ","
end

CoD.CraftUtility.Gunsmith.GetWeaponByVariantIndex = function ( f42_arg0, f42_arg1 )
	local f42_local0 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f42_arg0, f42_arg1 )
	local f42_local1 = Engine.GetItemRef( f42_local0.weaponIndex )
	if f42_local0.weaponIndex == 0 then
		f42_local1 = Engine.GetItemRef( CoD.GetCustomization( f42_arg0, "weapon_index" ) )
	end
	local f42_local2 = f42_local1 .. CoD.CraftUtility.GetModeAbbreviation()
	if f42_local0.weaponIndex ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
		for f42_local3 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			f42_local2 = CoD.CraftUtility.Gunsmith.AddAttachmentToWeapon( f42_local2, f42_local0.attachment[f42_local3] )
		end
	end
	return f42_local2
end

CoD.CraftUtility.Gunsmith.GetAttachmentVariantByVariantIndex = function ( f43_arg0, f43_arg1 )
	local f43_local0 = CoD.CraftUtility.Gunsmith.GetVariantByIndex( f43_arg0, f43_arg1 )
	local f43_local1 = Engine.GetItemRef( f43_local0.weaponIndex )
	if f43_local0.weaponIndex == 0 then
		f43_local1 = Engine.GetItemRef( CoD.GetCustomization( f43_arg0, "weapon_index" ) )
	end
	local f43_local2 = ""
	if f43_local0.weaponIndex ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
		for f43_local3 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f43_local6 = f43_local0.attachment[f43_local3]
			if f43_local6 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				f43_local2 = CoD.CraftUtility.Gunsmith.AddAttachmentVariant( f43_local2, f43_local6, f43_local0.attachmentVariant[f43_local3] )
			end
		end
	end
	return f43_local2
end

CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant = function ( f44_arg0, f44_arg1 )
	local f44_local0 = Engine.GetItemRef( CoD.GetCustomization( f44_arg0, "weapon_index" ) ) .. CoD.CraftUtility.GetModeAbbreviation()
	if f44_arg1 then
		for f44_local1 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			f44_local0 = CoD.CraftUtility.Gunsmith.AddAttachmentToWeapon( f44_local0, Engine.GetModelValue( Engine.GetModel( f44_arg1, "attachment" .. f44_local1 ) ) )
		end
	end
	return f44_local0
end

CoD.CraftUtility.Gunsmith.GetWeaponAttachmentVariantString = function ( f45_arg0, f45_arg1 )
	local f45_local0 = Engine.GetItemRef( CoD.GetCustomization( f45_arg0, "weapon_index" ) )
	local f45_local1 = ""
	if f45_arg1 then
		for f45_local2 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f45_local5 = Engine.GetModelValue( Engine.GetModel( f45_arg1, "attachment" .. f45_local2 ) )
			if f45_local5 ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				f45_local1 = CoD.CraftUtility.Gunsmith.AddAttachmentVariant( f45_local1, f45_local5, Engine.GetModelValue( Engine.GetModel( f45_arg1, "attachmentVariant" .. f45_local2 ) ) )
			end
		end
	end
	return f45_local1
end

CoD.CraftUtility.Gunsmith.DisplayBaseWeapon = function ( f46_arg0 )
	local f46_local0 = Engine.GetItemRef( CoD.GetCustomization( f46_arg0, "weapon_index" ) ) .. CoD.CraftUtility.GetModeAbbreviation()
	Engine.SendClientScriptNotify( f46_arg0, "CustomClass_update", CoD.CraftUtility.GetLoadoutSlot( f46_arg0 ), f46_local0, CoD.CACUtility.GetCameraNameForAttachments( f46_local0 ), "0,0,0" )
end

CoD.CraftUtility.Gunsmith.DisplayWeaponWithPaintjob = function ( f47_arg0, f47_arg1, f47_arg2 )
	local f47_local0 = Engine.GetItemRef( CoD.GetCustomization( f47_arg0, "weapon_index" ) ) .. CoD.CraftUtility.GetModeAbbreviation()
	local f47_local1 = CoD.CraftUtility.GetLoadoutSlot( f47_arg0 )
	local f47_local2 = CoD.CACUtility.GetCameraNameForAttachments( f47_local0 )
	local f47_local3 = 0
	if f47_arg2 ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and f47_arg1 ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
		Engine.SetupPaintjobData( f47_arg0, f47_arg2, f47_arg1 )
		f47_local3 = 1
	end
	Engine.SendClientScriptNotify( f47_arg0, "CustomClass_update", f47_local1, f47_local0, f47_local2, "0,0," .. f47_local3 )
end

CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant = function ( f48_arg0, f48_arg1, f48_arg2, f48_arg3, f48_arg4, f48_arg5 )
	if f48_arg1 then
		local f48_local0 = CoD.CraftUtility.GetLoadoutSlot( f48_arg0 )
		local f48_local1 = CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant( f48_arg0, f48_arg1 )
		local f48_local2 = CoD.CACUtility.GetCameraNameForAttachments( f48_local1, f48_arg2 )
		if f48_arg5 == nil then
			f48_arg5 = Engine.GetModelValue( Engine.GetModel( f48_arg1, "camoIndex" ) )
		end
		if f48_arg3 == nil then
			f48_arg3 = Engine.GetModelValue( Engine.GetModel( f48_arg1, "paintjobSlot" ) )
		end
		if f48_arg4 == nil then
			f48_arg4 = Engine.GetModelValue( Engine.GetModel( f48_arg1, "paintjobIndex" ) )
		end
		local f48_local3 = 0
		if f48_arg3 ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and f48_arg4 ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
			Engine.SetupPaintjobData( f48_arg0, f48_arg3, f48_arg4 )
			f48_local3 = 1
		end
		Engine.SendClientScriptNotify( f48_arg0, "CustomClass_update", f48_local0, f48_local1, f48_local2, f48_arg5 .. ",0," .. f48_local3, CoD.CraftUtility.Gunsmith.GetWeaponAttachmentVariantString( f48_arg0, f48_arg1 ) )
	end
end

CoD.CraftUtility.Gunsmith.GetVariantAttachmentList = function ( f49_arg0, f49_arg1 )
	local f49_local0 = {}
	if f49_arg1 then
		for f49_local1 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			table.insert( f49_local0, Engine.GetModelValue( Engine.GetModel( f49_arg1, "attachment" .. f49_local1 ) ) )
		end
	end
	return f49_local0
end

CoD.CraftUtility.Gunsmith.ClearVariantSlotByAttachmentIndex = function ( f50_arg0, f50_arg1, f50_arg2 )
	if f50_arg1 then
		for f50_local0 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f50_local3 = Engine.GetModel( f50_arg1, "attachment" .. f50_local0 )
			local f50_local4 = Engine.GetModelValue( f50_local3 )
			local f50_local5 = Engine.GetModel( f50_arg1, "attachmentVariant" .. f50_local0 )
			if f50_arg2 == f50_local4 then
				Engine.SetModelValue( f50_local5, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
				Engine.SetModelValue( f50_local3, CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
			end
		end
	end
end

CoD.CraftUtility.Gunsmith.IsFocusAttachmentEquipped = function ( f51_arg0, f51_arg1, f51_arg2 )
	if f51_arg1 then
		for f51_local0 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			if f51_arg2 == Engine.GetModelValue( Engine.GetModel( f51_arg1, "attachment" .. f51_local0 ) ) then
				return true
			end
		end
	end
end

CoD.CraftUtility.Gunsmith.SetFocusAttachmentVariant = function ( f52_arg0, f52_arg1, f52_arg2, f52_arg3 )
	if f52_arg1 then
		for f52_local0 = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local f52_local3 = Engine.GetModelValue( Engine.GetModel( f52_arg1, "attachment" .. f52_local0 ) )
			local f52_local4 = Engine.GetModel( f52_arg1, "attachmentVariant" .. f52_local0 )
			if f52_arg2 == f52_local3 then
				Engine.SetModelValue( f52_local4, f52_arg3 )
			end
		end
	end
end

CoD.CraftUtility.Paintjobs = {}
CoD.CraftUtility.Paintjobs.CachedPaintjobs = {}
CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX = 0
CoD.CraftUtility.Paintjobs.GetPrevViewIndex = function ( f53_arg0 )
	local f53_local0 = CoD.CraftUtility.GetWeaponGroupName( f53_arg0 )
	local f53_local1 = #CoD.Paintshop.View
	local f53_local2 = CoD.perController[f53_arg0].viewIndex - 1
	if f53_local2 == 0 then
		f53_local2 = f53_local1
	end
	if f53_local0 == "weapon_knife" and f53_local2 == 2 then
		f53_local2 = f53_local2 - 1
	end
	return f53_local2
end

CoD.CraftUtility.Paintjobs.GetNextViewIndex = function ( f54_arg0 )
	local f54_local0 = CoD.CraftUtility.GetWeaponGroupName( f54_arg0 )
	local f54_local1 = CoD.perController[f54_arg0].viewIndex % #CoD.Paintshop.View + 1
	if f54_local0 == "weapon_knife" and f54_local1 == 2 then
		f54_local1 = f54_local1 + 1
	end
	return f54_local1
end

CoD.CraftUtility.Paintjobs.GetTotalWeaponPaintjobs = function ( f55_arg0 )
	local f55_local0 = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local f55_local1 = 0
	local f55_local2 = Engine.GetPaintjobSlotInfo()
	local f55_local3 = f55_local2.slot_count
	local f55_local4 = f55_local2.paintjobs_per_slot
	for f55_local5 = 0, f55_local3 - 1, 1 do
		local f55_local8 = f55_local0[f55_local5]
		if f55_local8 then
			for f55_local9 = 0, f55_local4 - 1, 1 do
				local f55_local12 = f55_local8[f55_local9]
				if f55_local12 and f55_local12.weaponIndex == f55_arg0 then
					f55_local1 = f55_local1 + 1
				end
			end
		end
	end
	return f55_local1
end

CoD.CraftUtility.Paintjobs.GetTotalUsedPaintjobs = function ()
	local f56_local0 = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local f56_local1 = 0
	local f56_local2 = Engine.GetPaintjobSlotInfo()
	local f56_local3 = f56_local2.slot_count
	local f56_local4 = f56_local2.paintjobs_per_slot
	for f56_local5 = 0, f56_local3 - 1, 1 do
		local f56_local8 = f56_local0[f56_local5]
		if f56_local8 then
			for f56_local9 = 0, f56_local4 - 1, 1 do
				local f56_local12 = f56_local8[f56_local9]
				if f56_local12 and f56_local12.weaponIndex ~= CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX then
					f56_local1 = f56_local1 + 1
				end
			end
		end
	end
	return f56_local1
end

CoD.CraftUtility.Paintjobs.GetHighestSortIndexForWeapon = function ( f57_arg0 )
	local f57_local0 = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local f57_local1 = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
	local f57_local2 = Engine.GetPaintjobSlotInfo()
	local f57_local3 = f57_local2.slot_count
	local f57_local4 = f57_local2.paintjobs_per_slot
	for f57_local5 = 0, f57_local3 - 1, 1 do
		local f57_local8 = f57_local0[f57_local5]
		if f57_local8 then
			for f57_local9 = 0, f57_local4 - 1, 1 do
				local f57_local12 = f57_local8[f57_local9]
				if f57_local12 and f57_local12.weaponIndex == f57_arg0 then
					local f57_local13 = f57_local12.sortIndex
					if f57_local1 < f57_local13 then
						f57_local1 = f57_local13
					end
				end
			end
		end
	end
	return f57_local1
end

CoD.CraftUtility.Paintjobs.GetCACPaintjobList = function ( f58_arg0 )
	local f58_local0 = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local f58_local1 = {}
	local f58_local2 = Engine.GetPaintjobSlotInfo()
	local f58_local3 = f58_local2.slot_count
	local f58_local4 = f58_local2.paintjobs_per_slot
	for f58_local5 = 0, f58_local3 - 1, 1 do
		local f58_local8 = f58_local0[f58_local5]
		if f58_local8 then
			for f58_local9 = 0, f58_local4 - 1, 1 do
				local f58_local12 = f58_local8[f58_local9]
				if f58_local12 then
					f58_local12.paintjobSlot = f58_local5
					f58_local12.paintjobIndex = f58_local9
					if f58_local12.weaponIndex == f58_arg0 then
						table.insert( f58_local1, f58_local12 )
					end
				end
			end
		end
	end
	table.sort( f58_local1, function ( f59_arg0, f59_arg1 )
		return f59_arg1.sortIndex < f59_arg0.sortIndex
	end )
	return f58_local1
end

CoD.CraftUtility.Paintjobs.GetSortedWeaponPaintjobList = function ( f60_arg0 )
	local f60_local0 = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local f60_local1 = {}
	local f60_local2 = false
	local f60_local3 = Engine.GetPaintjobSlotInfo()
	local f60_local4 = f60_local3.slot_count
	local f60_local5 = f60_local3.paintjobs_per_slot
	for f60_local6 = 0, f60_local4 - 1, 1 do
		local f60_local9 = f60_local0[f60_local6]
		if f60_local9 then
			for f60_local10 = 0, f60_local5, 1 do
				local f60_local13 = f60_local9[f60_local10]
				if f60_local13 then
					f60_local13.paintjobSlot = f60_local6
					f60_local13.paintjobIndex = f60_local10
					if f60_local13.weaponIndex == CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX and not f60_local2 then
						f60_local13.sortIndex = CoD.CraftUtility.Paintjobs.GetHighestSortIndexForWeapon( f60_arg0 ) + 1
						f60_local2 = true
						table.insert( f60_local1, f60_local13 )
					end
					if f60_local13.weaponIndex == f60_arg0 then
						table.insert( f60_local1, f60_local13 )
					end
				end
			end
		end
	end
	table.sort( f60_local1, function ( f61_arg0, f61_arg1 )
		return f61_arg1.sortIndex < f61_arg0.sortIndex
	end )
	return f60_local1
end

CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs = function ()
	return Dvar.total_paintjobs:get()
end

CoD.CraftUtility.Paintjobs.IsPaintjobIndexOccupied = function ( f63_arg0, f63_arg1 )
	if CoD.CraftUtility.Paintjobs.CachedPaintjobs[f63_arg0][f63_arg1].weaponIndex ~= CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX then
		return true
	else
		return false
	end
end

CoD.CraftUtility.Paintjobs.ParseDDL = function ( f64_arg0, f64_arg1 )
	local f64_local0 = Engine.GetPaintjobSlotInfo()
	local f64_local1 = f64_local0.slot_count
	local f64_local2 = f64_local0.paintjobs_per_slot
	local f64_local3 = CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs()
	for f64_local4 = 0, f64_local1 - 1, 1 do
		local f64_local7 = CoD.CraftUtility.GetDDLRoot( f64_arg0, f64_arg1, f64_local4 )
		CoD.CraftUtility.Paintjobs.CachedPaintjobs[f64_local4] = {}
		if f64_local7 == nil then
			CoD.CraftUtility.Paintjobs.CachedPaintjobs = {}
			return false
		end
		for f64_local8 = 0, f64_local2 - 1, 1 do
			if f64_local3 <= f64_local4 * f64_local2 + f64_local8 then
				return true
			end
			local f64_local11 = {}
			local f64_local12 = f64_local7.weaponPaintjob[f64_local8]
			f64_local11.weaponIndex = f64_local12.weaponIndex:get()
			f64_local11.sortIndex = f64_local12.sortIndex:get()
			f64_local11.paintjobName = f64_local12.paintjobName:get()
			CoD.CraftUtility.Paintjobs.CachedPaintjobs[f64_local4][f64_local8] = f64_local11
		end
	end
	return true
end

CoD.CraftUtility.Paintjobs.UploadPaintjob = function ( f65_arg0, f65_arg1 )
	local f65_local0 = Engine.GetModelValue( Engine.GetModel( f65_arg1, "paintjobSlot" ) )
	local f65_local1 = Engine.GetModelValue( Engine.GetModel( f65_arg1, "paintjobIndex" ) )
	local f65_local2 = Engine.GetModelValue( Engine.GetModel( f65_arg1, "weaponIndex" ) )
	local f65_local3 = Engine.GetModelValue( Engine.GetModel( f65_arg1, "sortIndex" ) )
	local f65_local4 = Engine.GetModelValue( Engine.GetModel( f65_arg1, "paintjobName" ) )
	local f65_local5 = CoD.CraftUtility.GetDDLRoot( f65_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS, f65_local0 )
	if f65_local5 ~= nil then
		local f65_local6 = f65_local5.weaponPaintjob[f65_local1]
		f65_local6.weaponIndex:set( f65_local2 )
		f65_local6.sortIndex:set( f65_local3 )
		f65_local6.paintjobName:set( f65_local4 )
		Engine.UploadPaintjobData( f65_arg0, f65_local0, f65_local1 )
	end
end

CoD.CraftUtility.Paintjobs.ClearPaintjob = function ( f66_arg0, f66_arg1, f66_arg2 )
	local f66_local0 = CoD.CraftUtility.GetDDLRoot( f66_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS, f66_arg1 )
	if f66_local0 ~= nil then
		local f66_local1 = f66_local0.weaponPaintjob[f66_arg2]
		f66_local1.paintjobName:set( "" )
		f66_local1.sortIndex:set( CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX )
		f66_local1.weaponIndex:set( CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX )
		Engine.ClearPaintjobLayerData()
		Engine.UploadPaintjobData( f66_arg0, f66_arg1, f66_arg2 )
	end
end

CoD.CraftUtility.Paintjobs.GetPaintjobName = function ( f67_arg0, f67_arg1, f67_arg2 )
	local f67_local0 = CoD.CraftUtility.GetDDLRoot( f67_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS, f67_arg1 )
	if f67_local0 ~= nil then
		return f67_local0.weaponPaintjob[f67_arg2].paintjobName:get()
	else
		return ""
	end
end

CoD.CraftUtility.Paintjobs.RenamePaintjob = function ( f68_arg0, f68_arg1, f68_arg2, f68_arg3 )
	local f68_local0 = Enum.StorageFileType.STORAGE_PAINTJOBS
	local f68_local1 = CoD.CraftUtility.GetDDLRoot( f68_arg0, f68_local0, f68_arg1 )
	if f68_local1 ~= nil then
		f68_local1.weaponPaintjob[f68_arg2].paintjobName:set( f68_arg3 )
		CoD.CraftUtility.UploadAndParseBuffer( f68_arg0, f68_local0, f68_arg1 )
	end
end

CoD.CraftUtility.Paintjobs.PublishPaintjob = function ( f69_arg0 )
	local f69_local0 = CoD.perController[f69_arg0].selectedpaintjobModel
	local f69_local1 = Engine.GetModelValue( Engine.GetModel( f69_local0, "paintjobSlot" ) )
	local f69_local2 = Engine.GetModelValue( Engine.GetModel( f69_local0, "paintjobIndex" ) )
	local f69_local3 = CoD.CraftUtility.GetDDLRoot( f69_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS, f69_local1 )
	if f69_local3 ~= nil then
		Engine.PublishPaintjob( f69_arg0, "paintjob", f69_local1, f69_local2, f69_local3.weaponPaintjob[f69_local2].weaponIndex:get(), CoD.FileshareUtility.GetPublishName(), CoD.FileshareUtility.GetPublishAllowDownload() )
	end
end

CoD.CraftUtility.Paintjobs.PublishPaintjobToSteamWorkShop = function ( f70_arg0 )
	local f70_local0 = CoD.perController[f70_arg0].selectedpaintjobModel
	local f70_local1 = Engine.GetModelValue( Engine.GetModel( f70_local0, "paintjobSlot" ) )
	local f70_local2 = Engine.GetModelValue( Engine.GetModel( f70_local0, "paintjobIndex" ) )
	local f70_local3 = CoD.CraftUtility.GetDDLRoot( f70_arg0, Enum.StorageFileType.STORAGE_PAINTJOBS, f70_local1 )
	if f70_local3 ~= nil then
		Engine.PublishPaintjobToSteamWorkshop( f70_arg0, "paintjob", f70_local1, f70_local2, f70_local3.weaponPaintjob[f70_local2].weaponIndex:get(), CoD.FileshareUtility.GetPublishName(), CoD.FileshareUtility.GetPublishDescription(), CoD.FileshareUtility.GetPublishTags() )
	end
end

CoD.CraftUtility.Emblems = {}
CoD.CraftUtility.Emblems.CachedEmblems = {}
CoD.CraftUtility.Emblems.GetHighestSortIndex = function ()
	local f71_local0 = CoD.CraftUtility.Emblems.CachedEmblems
	local f71_local1 = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
	for f71_local2 = 0, #f71_local0 - 1, 1 do
		local f71_local5 = f71_local0[f71_local2].sortIndex
		if f71_local1 < f71_local5 then
			f71_local1 = f71_local5
		end
	end
	return f71_local1
end

CoD.CraftUtility.Emblems.GetSortedEmblemsList = function ()
	local f72_local0 = CoD.CraftUtility.Emblems.CachedEmblems
	local f72_local1 = {}
	local f72_local2 = false
	for f72_local3 = 0, #f72_local0 - 1, 1 do
		local f72_local6 = f72_local0[f72_local3]
		f72_local6.emblemIndex = f72_local3
		if f72_local6.isUsed == 0 and not f72_local2 then
			f72_local6.sortIndex = CoD.CraftUtility.Emblems.GetHighestSortIndex() + 1
			f72_local2 = true
			table.insert( f72_local1, f72_local6 )
		end
		if f72_local6.isUsed == 1 then
			table.insert( f72_local1, f72_local6 )
		end
	end
	table.sort( f72_local1, function ( f73_arg0, f73_arg1 )
		return f73_arg1.sortIndex < f73_arg0.sortIndex
	end )
	return f72_local1
end

CoD.CraftUtility.Emblems.GetTotalUsedEmblems = function ()
	local f74_local0 = CoD.CraftUtility.Emblems.CachedEmblems
	local f74_local1 = 0
	for f74_local2 = 0, #f74_local0 - 1, 1 do
		if f74_local0[f74_local2].isUsed == 1 then
			f74_local1 = f74_local1 + 1
		end
	end
	return f74_local1
end

CoD.CraftUtility.Emblems.GetTotalAllowedEmblems = function ()
	return Dvar.emblems_max_count:get()
end

CoD.CraftUtility.Emblems.ParseDDL = function ( f76_arg0, f76_arg1 )
	local f76_local0 = CoD.CraftUtility.Emblems.GetTotalAllowedEmblems()
	local f76_local1 = CoD.CraftUtility.GetDDLRoot( f76_arg0, f76_arg1 )
	if f76_local1 == nil then
		CoD.CraftUtility.Emblems.CachedEmblems = {}
		return false
	end
	for f76_local2 = 0, f76_local0 - 1, 1 do
		local f76_local5 = {}
		local f76_local6 = f76_local1.emblemList[f76_local2]
		f76_local5.isUsed = f76_local6.isUsed:get()
		f76_local5.sortIndex = f76_local6.sortIndex:get()
		f76_local5.emblemName = f76_local6.emblemName:get()
		CoD.CraftUtility.Emblems.CachedEmblems[f76_local2] = f76_local5
	end
	return true
end

CoD.CraftUtility.Emblems.IsEmblemIndexOccupied = function ( f77_arg0 )
	return CoD.CraftUtility.Emblems.CachedEmblems[f77_arg0].isUsed == 1
end

CoD.CraftUtility.Emblems.UploadEmblem = function ( f78_arg0, f78_arg1 )
	local f78_local0 = Engine.GetModelValue( Engine.GetModel( f78_arg1, "emblemIndex" ) )
	local f78_local1 = Engine.GetModelValue( Engine.GetModel( f78_arg1, "sortIndex" ) )
	local f78_local2 = Engine.GetModelValue( Engine.GetModel( f78_arg1, "emblemName" ) )
	local f78_local3 = CoD.CraftUtility.GetDDLRoot( f78_arg0, Enum.StorageFileType.STORAGE_EMBLEMS )
	if f78_local3 ~= nil then
		local f78_local4 = f78_local3.emblemList[f78_local0]
		f78_local4.isUsed:set( 1 )
		f78_local4.sortIndex:set( f78_local1 )
		f78_local4.emblemName:set( f78_local2 )
		Engine.UploadEmblemData( f78_arg0, f78_local0 )
	end
end

CoD.CraftUtility.Emblems.RenameEmblem = function ( f79_arg0, f79_arg1, f79_arg2 )
	local f79_local0 = Enum.StorageFileType.STORAGE_EMBLEMS
	local f79_local1 = CoD.CraftUtility.GetDDLRoot( f79_arg0, f79_local0 )
	if f79_local1 ~= nil then
		f79_local1.emblemList[f79_arg1].emblemName:set( f79_arg2 )
		CoD.CraftUtility.UploadAndParseBuffer( f79_arg0, f79_local0 )
	end
end

CoD.CraftUtility.Emblems.ClearEmblem = function ( f80_arg0, f80_arg1 )
	local f80_local0 = CoD.CraftUtility.GetDDLRoot( f80_arg0, Enum.StorageFileType.STORAGE_EMBLEMS )
	local f80_local1 = Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM
	if f80_local0 ~= nil then
		local f80_local2 = f80_local0.emblemList[f80_arg1]
		f80_local2.emblemName:set( "" )
		f80_local2.isUsed:set( 0 )
		f80_local2.sortIndex:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		Engine.ExecNow( f80_arg0, "emblemClearAll " .. f80_local1 )
	end
end

CoD.CraftUtility.Emblems.PublishEmblem = function ( f81_arg0 )
	Engine.PublishEmblem( f81_arg0, "emblem", Engine.GetModelValue( Engine.GetModel( CoD.perController[f81_arg0].selectedEmblemModel, "emblemIndex" ) ), CoD.FileshareUtility.GetPublishName(), CoD.FileshareUtility.GetPublishAllowDownload() )
end

