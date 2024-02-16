require( "lua.Shared.LuaUtils" )

CoD.CraftUtility = {}
CoD.CraftUtility.Gunsmith = {}
CoD.CraftUtility.Gunsmith.CachedVariants = {}
CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS = 8
CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX = 0
CoD.CraftUtility.Gunsmith.CAMO_NONE = 0
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
end

CoD.CraftUtility.GetModeAbbreviation = function ()
	if CoD.isSafehouse then
		return "_cp"
	else
		return "_mp"
	end
end

CoD.CraftUtility.GetLoadoutSlot = function ( controller )
	local category_index = CoD.GetCustomization( controller, "category_index" )
	if category_index ~= nil then
		category_index = CoD.GetCustomization( controller, "category_index" ) - 1
	else
		category_index = 1
	end
	return CoD.Craft.WeaponGroupNames[category_index].loadout_slot
end

CoD.CraftUtility.DisplayWeaponInPaintshop = function ( controller, camera )
	local weaponRef = Engine.GetItemRef( CoD.GetCustomization( controller, "weapon_index" ) )
	local weapon_name = weaponRef .. CoD.CraftUtility.GetModeAbbreviation()
	local loadoutSlot = CoD.CraftUtility.GetLoadoutSlot( controller )
	local weaponOptions = "0,0,1"
	Engine.SendClientScriptNotify( controller, "CustomClass_update", loadoutSlot, weapon_name, camera, weaponOptions )
end

CoD.CraftUtility.PaintjobClear = function ( self, element, controller, param, menu )
	menu:openPopup( "PaintjobClearConfirmation", controller )
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
	CoD.FileshareUtility.OpenPublishPrompt( menu, controller, "paintjob", initialItemName, CoD.CraftUtility.Paintjobs.PublishPaintjob )
end

CoD.CraftUtility.OpenSteamPublishPromptPaintjob = function ( self, element, controller, param, menu )
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
	CoD.SteamWorkshopUtility.OpenPublishPrompt( menu, controller, "paintjob", initialItemName, CoD.CraftUtility.Paintjobs.PublishPaintjobToSteamWorkShop )
end

CoD.CraftUtility.PaintjobClearYes = function ( self, element, controller, param, menu )
	PaintjobSelector_ClearPaintjob( menu, element, controller )
end

CoD.CraftUtility.PaintjobClearNo = function ( self, element, controller, param, menu )
	GoBack( menu, controller )
end

CoD.CraftUtility.GunsmithClear = function ( self, element, controller, param, menu )
	menu:openPopup( "GunsmithClearConfirmation", controller )
end

CoD.CraftUtility.GunsmithRename = function ( self, element, controller, param, menu )
	ShowKeyboard( menu, element, controller, "KEYBOARD_TYPE_GUNSMITH" )
end

CoD.CraftUtility.OpenPublishPromptGunsmith = function ( self, element, controller, param, menu )
	local selectedVariantModel = CoD.perController[controller].gunsmithVariantModel
	local variantNameModel = Engine.GetModel( selectedVariantModel, "variantName" )
	local initialItemName = Engine.GetModelValue( variantNameModel )
	CoD.FileshareUtility.OpenPublishPrompt( menu, controller, "variant", initialItemName, CoD.CraftUtility.Gunsmith.PublishVariant )
end

CoD.CraftUtility.GunsmithClearYes = function ( self, element, controller, param, menu )
	Gunsmith_ClearVariant( self, element, controller )
end

CoD.CraftUtility.GunsmithClearNo = function ( self, element, controller, param, menu )
	GoBack( menu, controller )
end

CoD.CraftUtility.EmblemClear = function ( self, element, controller, param, menu )
	menu:openPopup( "EmblemClearConfirmation", controller )
end

CoD.CraftUtility.EmblemRename = function ( self, element, controller, param, menu )
	ShowKeyboard( menu, element, controller, "KEYBOARD_TYPE_EMBLEMS" )
end

CoD.CraftUtility.OpenPublishPromptEmblem = function ( self, element, controller, param, menu )
	local selectedEmblemModel = CoD.perController[controller].selectedEmblemModel
	local emblemNameModel = Engine.GetModel( selectedEmblemModel, "emblemName" )
	local initialItemName = Engine.GetModelValue( emblemNameModel )
	CoD.FileshareUtility.OpenPublishPrompt( menu, controller, "emblem", initialItemName, CoD.CraftUtility.Emblems.PublishEmblem )
end

CoD.CraftUtility.EmblemClearYes = function ( self, element, controller, param, menu )
	EmblemSelect_ClearEmblem( menu, element, controller )
end

CoD.CraftUtility.EmblemClearNo = function ( self, element, controller, param, menu )
	GoBack( menu, controller )
end

CoD.CraftUtility.GetWeaponGroupName = function ( controller )
	local weaponIndex = CoD.GetCustomization( controller, "weapon_index" )
	local groupName = ""
	if weaponIndex then
		groupName = Engine.GetItemGroup( weaponIndex, Enum.eModes.MODE_MULTIPLAYER )
	end
	return groupName
end

CoD.CraftUtility.Gunsmith.GetFileType = function ()
	local fileType = CoD.CraftUtility.Gunsmith.FileType
	if not fileType then
		fileType = Enum.StorageFileType.STORAGE_GUNSMITH
	end
	return fileType
end

CoD.CraftUtility.Gunsmith.GetTotalVaraints = function ()
	return CoD.CraftUtility.Gunsmith.TotalVariants
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
	local totalVariants = #rootState.variant
	CoD.CraftUtility.Gunsmith.TotalVariants = totalVariants
	for index = 0, totalVariants - 1, 1 do
		local variant = {}
		local variantState = rootState.variant[index]
		variant.weaponIndex = variantState.weaponIndex:get()
		variant.variantIndex = variantState.variantIndex:get()
		variant.sortIndex = variantState.sortIndex:get()
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

CoD.CraftUtility.Gunsmith.GetSortedWeaponVariantList = function ( weaponIndex )
	local variantList = CoD.CraftUtility.Gunsmith.CachedVariants
	local variantCount = 0
	local weaponVariantList = {}
	local isFreeSlotSelected = false
	for index = 1, #variantList, 1 do
		local variant = variantList[index]
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

CoD.CraftUtility.Gunsmith.GetVariantByIndex = function ( controller, variantIndex )
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, CoD.CraftUtility.Gunsmith.GetFileType() )
	if rootState ~= nil then
		local variantState = rootState.variant[variantIndex]
		local variant = {
			attachment = {},
			attachmentVariant = {},
			variantName = variantState.variantName:get(),
			camoIndex = variantState.camoIndex:get(),
			paintjobSlot = variantState.paintjobSlot:get(),
			paintjobIndex = variantState.paintjobIndex:get(),
			weaponIndex = variantState.weaponIndex:get(),
			variantIndex = variantState.variantIndex:get(),
			sortIndex = variantState.sortIndex:get(),
			cacVariantIndex = variantState.variantIndex:get() + 1
		}
		for attachmentIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			table.insert( variant.attachment, variantState.attachment[attachmentIndex - 1]:get() )
		end
		for attachmentVariantIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			table.insert( variant.attachmentVariant, variantState.attachmentVariant[attachmentVariantIndex - 1]:get() )
		end
		return variant
	else
		
	end
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
	if rootState ~= nil then
		local variantIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "variantIndex" ) )
		local variantState = rootState.variant[variantIndex]
		local freeAttachmentIndex = 0
		local opticAttachmentIndex = 1
		for attachmentIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local attachmentIndexModel = Engine.GetModel( variantModel, "attachment" .. attachmentIndex )
			if attachmentIndexModel then
				local attachmentID = Engine.GetModelValue( attachmentIndexModel )
				if attachmentID ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX or attachmentIndex == opticAttachmentIndex then
					variantState.attachment[freeAttachmentIndex]:set( attachmentID )
					local attachmentVariantModel = Engine.GetModel( variantModel, "attachmentVariant" .. attachmentIndex )
					if attachmentVariantModel then
						local attachmentVariantID = Engine.GetModelValue( attachmentVariantModel )
						variantState.attachmentVariant[freeAttachmentIndex]:set( attachmentVariantID )
					end
					freeAttachmentIndex = freeAttachmentIndex + 1
				end
			end
		end
		for attachmentIndex = freeAttachmentIndex, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS - 1, 1 do
			variantState.attachment[attachmentIndex]:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
			variantState.attachmentVariant[attachmentIndex]:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		end
	end
end

CoD.CraftUtility.Gunsmith.WriteVaraintDataToDDL = function ( controller, variantModel )
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, CoD.CraftUtility.Gunsmith.GetFileType() )
	if rootState ~= nil then
		local variantIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "variantIndex" ) )
		local variantState = rootState.variant[variantIndex]
		variantState.variantName:set( Engine.GetModelValue( Engine.GetModel( variantModel, "variantName" ) ) )
		variantState.camoIndex:set( Engine.GetModelValue( Engine.GetModel( variantModel, "camoIndex" ) ) )
		variantState.paintjobSlot:set( Engine.GetModelValue( Engine.GetModel( variantModel, "paintjobSlot" ) ) )
		variantState.paintjobIndex:set( Engine.GetModelValue( Engine.GetModel( variantModel, "paintjobIndex" ) ) )
		variantState.sortIndex:set( Engine.GetModelValue( Engine.GetModel( variantModel, "sortIndex" ) ) )
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
		variantState.paintjobSlot:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
		variantState.paintjobIndex:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
		variantState.weaponIndex:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		variantState.sortIndex:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		for attachmentIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			variantState.attachment[attachmentIndex - 1]:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		end
		for attachmentVariantIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			variantState.attachmentVariant[attachmentVariantIndex - 1]:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		end
		CoD.CraftUtility.UploadAndParseBuffer( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
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
	local attachmentRef = Engine.GetAttachmentRefByIndex( attachmentID )
	return attachmentVariantString .. attachmentRef .. "," .. attachmentVariantID .. ","
end

CoD.CraftUtility.Gunsmith.GetWeaponByVariantIndex = function ( controller, variantIndex )
	local variant = CoD.CraftUtility.Gunsmith.GetVariantByIndex( controller, variantIndex )
	local weaponRef = Engine.GetItemRef( variant.weaponIndex )
	if variant.weaponIndex == 0 then
		weaponRef = Engine.GetItemRef( CoD.GetCustomization( controller, "weapon_index" ) )
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
	local weaponRef = Engine.GetItemRef( variant.weaponIndex )
	if variant.weaponIndex == 0 then
		weaponRef = Engine.GetItemRef( CoD.GetCustomization( controller, "weapon_index" ) )
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
	local weaponRef = Engine.GetItemRef( CoD.GetCustomization( controller, "weapon_index" ) )
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

CoD.CraftUtility.Gunsmith.GetWeaponAttachmentVariantString = function ( controller, variantModel )
	local weaponRef = Engine.GetItemRef( CoD.GetCustomization( controller, "weapon_index" ) )
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

CoD.CraftUtility.Gunsmith.DisplayBaseWeapon = function ( controller )
	local weaponRef = Engine.GetItemRef( CoD.GetCustomization( controller, "weapon_index" ) )
	local weapon_name = weaponRef .. CoD.CraftUtility.GetModeAbbreviation()
	local loadoutSlot = CoD.CraftUtility.GetLoadoutSlot( controller )
	local camera = CoD.CACUtility.GetCameraNameForAttachments( weapon_name )
	local weaponOptions = "0,0,0"
	Engine.SendClientScriptNotify( controller, "CustomClass_update", loadoutSlot, weapon_name, camera, weaponOptions )
end

CoD.CraftUtility.Gunsmith.DisplayWeaponWithPaintjob = function ( controller, paintjobIndex, paintjobSlot )
	local weaponRef = Engine.GetItemRef( CoD.GetCustomization( controller, "weapon_index" ) )
	local weapon_name = weaponRef .. CoD.CraftUtility.GetModeAbbreviation()
	local loadoutSlot = CoD.CraftUtility.GetLoadoutSlot( controller )
	local camera = CoD.CACUtility.GetCameraNameForAttachments( weapon_name )
	local paintjobAvailable = 0
	if paintjobSlot ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and paintjobIndex ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
		Engine.SetupPaintjobData( controller, paintjobSlot, paintjobIndex )
		paintjobAvailable = 1
	end
	local weaponOptions = "0,0," .. paintjobAvailable
	Engine.SendClientScriptNotify( controller, "CustomClass_update", loadoutSlot, weapon_name, camera, weaponOptions )
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
		local paintjobAvailable = 0
		if paintjobSlot ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT and paintjobIndex ~= Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX then
			Engine.SetupPaintjobData( controller, paintjobSlot, paintjobIndex )
			paintjobAvailable = 1
		end
		local weaponOptions = camoIndex .. ",0," .. paintjobAvailable
		local attachmentVariantString = CoD.CraftUtility.Gunsmith.GetWeaponAttachmentVariantString( controller, variantModel )
		Engine.SendClientScriptNotify( controller, "CustomClass_update", loadoutSlot, weaponPlusAttachments, camera, weaponOptions, attachmentVariantString )
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

CoD.CraftUtility.Paintjobs = {}
CoD.CraftUtility.Paintjobs.CachedPaintjobs = {}
CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX = 0
CoD.CraftUtility.Paintjobs.GetPrevViewIndex = function ( controller )
	local groupName = CoD.CraftUtility.GetWeaponGroupName( controller )
	local totalViews = #CoD.Paintshop.View
	local view_index = CoD.perController[controller].viewIndex - 1
	if view_index == 0 then
		view_index = totalViews
	end
	if groupName == "weapon_knife" and view_index == 2 then
		view_index = view_index - 1
	end
	return view_index
end

CoD.CraftUtility.Paintjobs.GetNextViewIndex = function ( controller )
	local groupName = CoD.CraftUtility.GetWeaponGroupName( controller )
	local totalViews = #CoD.Paintshop.View
	local view_index = CoD.perController[controller].viewIndex % totalViews + 1
	if groupName == "weapon_knife" and view_index == 2 then
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
				if paintjob then
					paintjob.paintjobSlot = slot
					paintjob.paintjobIndex = paintjobIndex
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

CoD.CraftUtility.Paintjobs.GetSortedWeaponPaintjobList = function ( weaponIndex )
	local paintjobSlotList = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local weaponPaintjobList = {}
	local isFreePaintjobIndexSelected = false
	local slotInfo = Engine.GetPaintjobSlotInfo()
	local slotCount = slotInfo.slot_count
	local paintjobs_per_slot = slotInfo.paintjobs_per_slot
	for slot = 0, slotCount - 1, 1 do
		local paintjobsList = paintjobSlotList[slot]
		if paintjobsList then
			for paintjobIndex = 0, paintjobs_per_slot, 1 do
				local paintjob = paintjobsList[paintjobIndex]
				if paintjob then
					paintjob.paintjobSlot = slot
					paintjob.paintjobIndex = paintjobIndex
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

CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs = function ()
	return Dvar.total_paintjobs:get()
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
	local total_paintjobs = CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs()
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
			CoD.CraftUtility.Paintjobs.CachedPaintjobs[slot][paintjobIndex] = paintjob
		end
	end
	return true
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
		Engine.UploadPaintjobData( controller, slot, paintjobIndex )
	end
end

CoD.CraftUtility.Paintjobs.ClearPaintjob = function ( controller, paintjobSlot, paintjobIndex )
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, Enum.StorageFileType.STORAGE_PAINTJOBS, paintjobSlot )
	if rootState ~= nil then
		local weaponPaintjobState = rootState.weaponPaintjob[paintjobIndex]
		weaponPaintjobState.paintjobName:set( "" )
		weaponPaintjobState.sortIndex:set( CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX )
		weaponPaintjobState.weaponIndex:set( CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX )
		Engine.ClearPaintjobLayerData()
		Engine.UploadPaintjobData( controller, paintjobSlot, paintjobIndex )
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

CoD.CraftUtility.Paintjobs.PublishPaintjobToSteamWorkShop = function ( controller )
	local paintjobModel = CoD.perController[controller].selectedpaintjobModel
	local paintjobSlot = Engine.GetModelValue( Engine.GetModel( paintjobModel, "paintjobSlot" ) )
	local paintjobIndex = Engine.GetModelValue( Engine.GetModel( paintjobModel, "paintjobIndex" ) )
	local fileType = Enum.StorageFileType.STORAGE_PAINTJOBS
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, fileType, paintjobSlot )
	if rootState ~= nil then
		local weaponPaintjobState = rootState.weaponPaintjob[paintjobIndex]
		local weaponIndex = weaponPaintjobState.weaponIndex:get()
		local publishName = CoD.FileshareUtility.GetPublishName()
		local publishDesc = CoD.FileshareUtility.GetPublishDescription()
		local publishTags = CoD.FileshareUtility.GetPublishTags()
		Engine.PublishPaintjobToSteamWorkshop( controller, "paintjob", paintjobSlot, paintjobIndex, weaponIndex, publishName, publishDesc, publishTags )
	end
end

CoD.CraftUtility.Emblems = {}
CoD.CraftUtility.Emblems.CachedEmblems = {}
CoD.CraftUtility.Emblems.GetHighestSortIndex = function ()
	local cachedEmblemList = CoD.CraftUtility.Emblems.CachedEmblems
	local maxSortIndex = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
	for emblemIndex = 0, #cachedEmblemList - 1, 1 do
		local emblem = cachedEmblemList[emblemIndex]
		local sortIndex = emblem.sortIndex
		if maxSortIndex < sortIndex then
			maxSortIndex = sortIndex
		end
	end
	return maxSortIndex
end

CoD.CraftUtility.Emblems.GetSortedEmblemsList = function ()
	local cachedEmblemList = CoD.CraftUtility.Emblems.CachedEmblems
	local sortedEmblemList = {}
	local isFreeEmblemSelected = false
	for emblemIndex = 0, #cachedEmblemList - 1, 1 do
		local emblem = cachedEmblemList[emblemIndex]
		emblem.emblemIndex = emblemIndex
		if emblem.isUsed == 0 and not isFreeEmblemSelected then
			emblem.sortIndex = CoD.CraftUtility.Emblems.GetHighestSortIndex() + 1
			isFreeEmblemSelected = true
			table.insert( sortedEmblemList, emblem )
		end
		if emblem.isUsed == 1 then
			table.insert( sortedEmblemList, emblem )
		end
	end
	table.sort( sortedEmblemList, function ( a, b )
		return b.sortIndex < a.sortIndex
	end )
	return sortedEmblemList
end

CoD.CraftUtility.Emblems.GetTotalUsedEmblems = function ()
	local emblemList = CoD.CraftUtility.Emblems.CachedEmblems
	local emblemCount = 0
	for index = 0, #emblemList - 1, 1 do
		if emblemList[index].isUsed == 1 then
			emblemCount = emblemCount + 1
		end
	end
	return emblemCount
end

CoD.CraftUtility.Emblems.GetTotalAllowedEmblems = function ()
	return Dvar.emblems_max_count:get()
end

CoD.CraftUtility.Emblems.ParseDDL = function ( controller, fileType )
	local totalEmblems = CoD.CraftUtility.Emblems.GetTotalAllowedEmblems()
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, fileType )
	if rootState == nil then
		CoD.CraftUtility.Emblems.CachedEmblems = {}
		return false
	end
	for index = 0, totalEmblems - 1, 1 do
		local emblem = {}
		local emblemState = rootState.emblemList[index]
		emblem.isUsed = emblemState.isUsed:get()
		emblem.sortIndex = emblemState.sortIndex:get()
		emblem.emblemName = emblemState.emblemName:get()
		CoD.CraftUtility.Emblems.CachedEmblems[index] = emblem
	end
	return true
end

CoD.CraftUtility.Emblems.IsEmblemIndexOccupied = function ( emblemIndex )
	local cachedEmblemList = CoD.CraftUtility.Emblems.CachedEmblems
	local emblem = cachedEmblemList[emblemIndex]
	return emblem.isUsed == 1
end

CoD.CraftUtility.Emblems.UploadEmblem = function ( controller, emblemModel )
	local emblemIndex = Engine.GetModelValue( Engine.GetModel( emblemModel, "emblemIndex" ) )
	local sortIndex = Engine.GetModelValue( Engine.GetModel( emblemModel, "sortIndex" ) )
	local emblemName = Engine.GetModelValue( Engine.GetModel( emblemModel, "emblemName" ) )
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, Enum.StorageFileType.STORAGE_EMBLEMS )
	if rootState ~= nil then
		local emblemState = rootState.emblemList[emblemIndex]
		emblemState.isUsed:set( 1 )
		emblemState.sortIndex:set( sortIndex )
		emblemState.emblemName:set( emblemName )
		Engine.UploadEmblemData( controller, emblemIndex )
	end
end

CoD.CraftUtility.Emblems.RenameEmblem = function ( controller, emblemIndex, emblemName )
	local fileType = Enum.StorageFileType.STORAGE_EMBLEMS
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, fileType )
	if rootState ~= nil then
		local emblemState = rootState.emblemList[emblemIndex]
		emblemState.emblemName:set( emblemName )
		CoD.CraftUtility.UploadAndParseBuffer( controller, fileType )
	end
end

CoD.CraftUtility.Emblems.ClearEmblem = function ( controller, emblemIndex )
	local fileType = Enum.StorageFileType.STORAGE_EMBLEMS
	local rootState = CoD.CraftUtility.GetDDLRoot( controller, fileType )
	local customizationType = Enum.CustomizationType.CUSTOMIZATION_TYPE_EMBLEM
	if rootState ~= nil then
		local emblemState = rootState.emblemList[emblemIndex]
		emblemState.emblemName:set( "" )
		emblemState.isUsed:set( 0 )
		emblemState.sortIndex:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		Engine.ExecNow( controller, "emblemClearAll " .. customizationType )
	end
end

CoD.CraftUtility.Emblems.PublishEmblem = function ( controller )
	local selectedEmblemModel = CoD.perController[controller].selectedEmblemModel
	local emblemIndex = Engine.GetModelValue( Engine.GetModel( selectedEmblemModel, "emblemIndex" ) )
	local publishName = CoD.FileshareUtility.GetPublishName()
	local publishAllowDownload = CoD.FileshareUtility.GetPublishAllowDownload()
	Engine.PublishEmblem( controller, "emblem", emblemIndex, publishName, publishAllowDownload )
end

