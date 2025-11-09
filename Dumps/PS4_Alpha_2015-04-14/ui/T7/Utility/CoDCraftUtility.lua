CoD.CraftUtility = {}
CoD.CraftUtility.Gunsmith = {}
CoD.CraftUtility.Gunsmith.CachedVariants = {}
CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS = 8
CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX = 0
CoD.CraftUtility.Gunsmith.CAMO_NONE = 0
CoD.CraftUtility.Gunsmith.INVALID_PAINTSHOP_SLOT = 64
CoD.CraftUtility.Gunsmith.INVALID_PAINTSHOP_INDEX = 32
CoD.CraftUtility.Gunsmith.GetModeAbbreviation = function ()
	return "_mp"
end

CoD.CraftUtility.Gunsmith.GetLoadoutSlot = function ( controller )
	local weaponCategoryIndex = CoD.perController[controller].gunsmithWeaponCategoryIndex - 1
	return CoD.Craft.WeaponGroupNames[weaponCategoryIndex].loadout_slot
end

CoD.CraftUtility.Gunsmith.GetTotalVaraints = function ()
	return Dvar.gunsmith_totalvariants:get()
end

CoD.CraftUtility.Gunsmith.InitializeBuffer = function ( data )
	local controller = data.controller
	local fileType = Enum.StorageFileType.STORAGE_GUNSMITH
	Engine.StorageReset( controller, fileType )
	local rootState = CoD.CraftUtility.Gunsmith.GetDDLRoot( controller, fileType )
	local totalVariants = CoD.CraftUtility.Gunsmith.GetTotalVaraints()
	for index = 0, totalVariants - 1, 1 do
		local variantState = rootState.variant[index]
		variantState.variantIndex:set( index )
		variantState.paintjobSlot:set( CoD.CraftUtility.Gunsmith.INVALID_PAINTSHOP_SLOT )
		variantState.paintjobIndex:set( CoD.CraftUtility.Gunsmith.INVALID_PAINTSHOP_INDEX )
	end
	Engine.StorageWrite( controller, fileType )
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

CoD.CraftUtility.Gunsmith.GetDDLRoot = function ( controller, fileType )
	return Engine.StorageGetBuffer( controller, fileType )
end

CoD.CraftUtility.Gunsmith.ParseDDL = function ( controller, fileType )
	local totalVariants = CoD.CraftUtility.Gunsmith.GetTotalVaraints()
	local rootState = CoD.CraftUtility.Gunsmith.GetDDLRoot( controller, fileType )
	if rootState == nil then
		CoD.CraftUtility.Gunsmith.CachedVariants = {}
		return false
	end
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
	local rootState = CoD.CraftUtility.Gunsmith.GetDDLRoot( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
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

CoD.CraftUtility.Gunsmith.UploadAndParseBuffer = function ( controller )
	local fileType = Enum.StorageFileType.STORAGE_GUNSMITH
	Engine.StorageWrite( controller, fileType )
	CoD.CraftUtility.Gunsmith.ParseDDL( controller, fileType )
end

CoD.CraftUtility.Gunsmith.WriteVaraintDataToDDL = function ( controller, variantModel )
	local rootState = CoD.CraftUtility.Gunsmith.GetDDLRoot( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
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
		for attachmentIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			variantState.attachment[attachmentIndex - 1]:set( Engine.GetModelValue( Engine.GetModel( variantModel, "attachment" .. attachmentIndex ) ) )
		end
		for attachmentVariantIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			variantState.attachmentVariant[attachmentVariantIndex - 1]:set( Engine.GetModelValue( Engine.GetModel( variantModel, "attachmentVariant" .. attachmentVariantIndex ) ) )
		end
		CoD.CraftUtility.Gunsmith.UploadAndParseBuffer( controller )
	end
end

CoD.CraftUtility.Gunsmith.RenameVariant = function ( controller, variantIndex, variantName )
	local rootState = CoD.CraftUtility.Gunsmith.GetDDLRoot( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
	if rootState ~= nil then
		local variantState = rootState.variant[variantIndex]
		variantState.variantName:set( variantName )
		CoD.CraftUtility.Gunsmith.UploadAndParseBuffer( controller )
	end
end

CoD.CraftUtility.Gunsmith.ClearVariant = function ( controller, variantIndex )
	local rootState = CoD.CraftUtility.Gunsmith.GetDDLRoot( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
	if rootState ~= nil then
		local variantState = rootState.variant[variantIndex]
		variantState.variantName:set( "" )
		variantState.variantIndex:set( variantIndex )
		variantState.camoIndex:set( CoD.CraftUtility.Gunsmith.CAMO_NONE )
		variantState.paintjobSlot:set( CoD.CraftUtility.Gunsmith.INVALID_PAINTSHOP_SLOT )
		variantState.paintjobIndex:set( CoD.CraftUtility.Gunsmith.INVALID_PAINTSHOP_INDEX )
		variantState.weaponIndex:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		variantState.sortIndex:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		for attachmentIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			variantState.attachment[attachmentIndex - 1]:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		end
		for attachmentVariantIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			variantState.attachmentVariant[attachmentVariantIndex - 1]:set( CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX )
		end
		CoD.CraftUtility.Gunsmith.UploadAndParseBuffer( controller )
	end
end

CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant = function ( controller, variantModel )
	local weaponRef = Engine.GetItemRef( CoD.GetCustomization( controller, "weapon_index" ) )
	local weaponPlusAttachments = weaponRef .. CoD.CraftUtility.Gunsmith.GetModeAbbreviation()
	if variantModel then
		for attachmentIndex = 1, CoD.CraftUtility.Gunsmith.MAX_ATTACHMENTS, 1 do
			local attachmentModel = Engine.GetModel( variantModel, "attachment" .. attachmentIndex )
			local attachmentID = Engine.GetModelValue( attachmentModel )
			if attachmentID ~= CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX then
				local attachmentRef = Engine.GetAttachmentRefByIndex( attachmentID )
				weaponPlusAttachments = weaponPlusAttachments .. "+" .. attachmentRef
			end
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
				local attachmentRef = Engine.GetAttachmentRefByIndex( attachmentID )
				attachmentVariantString = attachmentVariantString .. attachmentRef .. "," .. attachmentVariantID .. ","
			end
		end
	end
	return attachmentVariantString
end

CoD.CraftUtility.Gunsmith.DisplayWeaponWithVariant = function ( controller, variantModel, isGunsmithCamera )
	if variantModel then
		local loadoutSlot = CoD.CraftUtility.Gunsmith.GetLoadoutSlot( controller )
		local weaponPlusAttachments = CoD.CraftUtility.Gunsmith.GetWeaponPlusAttachmentsForVariant( controller, variantModel )
		local camera = CoD.CACUtility.GetCameraNameForAttachments( weaponPlusAttachments )
		local camoIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "camoIndex" ) )
		local paintjobSlot = Engine.GetModelValue( Engine.GetModel( variantModel, "paintjobSlot" ) )
		local paintjobIndex = Engine.GetModelValue( Engine.GetModel( variantModel, "paintjobIndex" ) )
		local paintjobAvailable = 0
		if paintjobSlot ~= CoD.CraftUtility.Gunsmith.INVALID_PAINTSHOP_SLOT and paintjobIndex ~= CoD.CraftUtility.Gunsmith.INVALID_PAINTSHOP_INDEX then
			Engine.SetupPaintjobData( controller, paintjobSlot, paintjobIndex )
			paintjobAvailable = 1
		end
		local weaponOptions = camoIndex .. ",0," .. paintjobAvailable
		local attachmentVariantString = CoD.CraftUtility.Gunsmith.GetWeaponAttachmentVariantString( controller, variantModel )
		if isGunsmithCamera ~= nil and isGunsmithCamera then
			Engine.SendClientScriptNotify( controller, "CustomClass_update", loadoutSlot, weaponPlusAttachments, camera, weaponOptions, attachmentVariantString, true )
		else
			Engine.SendClientScriptNotify( controller, "CustomClass_update", loadoutSlot, weaponPlusAttachments, camera, weaponOptions, attachmentVariantString, false )
		end
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
CoD.CraftUtility.Paintjobs.GetTotalWeaponPaintjobs = function ( weaponIndex )
	local paintjobSlotList = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local paintjobCount = 0
	for slot = 0, #paintjobSlotList - 1, 1 do
		local paintjobsList = paintjobSlotList[slot]
		for paintjobIndex = 0, #paintjobsList - 1, 1 do
			local paintjob = paintjobsList[paintjobIndex]
			if paintjob.weaponIndex == weaponIndex then
				paintjobCount = paintjobCount + 1
			end
		end
	end
	return paintjobCount
end

CoD.CraftUtility.Paintjobs.GetTotalUsedPaintjobs = function ()
	local paintjobSlotList = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local paintjobCount = 0
	for slot = 0, #paintjobSlotList - 1, 1 do
		local paintjobsList = paintjobSlotList[slot]
		for paintjobIndex = 0, #paintjobsList - 1, 1 do
			local paintjob = paintjobsList[paintjobIndex]
			if paintjob.weaponIndex ~= CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX then
				paintjobCount = paintjobCount + 1
			end
		end
	end
	return paintjobCount
end

CoD.CraftUtility.Paintjobs.GetHighestSortIndexForWeapon = function ( weaponIndex )
	local paintjobSlotList = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local maxSortIndex = CoD.CraftUtility.Gunsmith.EMPTY_ITEM_INDEX
	for slot = 0, #paintjobSlotList - 1, 1 do
		local paintjobsList = paintjobSlotList[slot]
		for paintjobIndex = 0, #paintjobsList - 1, 1 do
			local paintjob = paintjobsList[paintjobIndex]
			if paintjob.weaponIndex == weaponIndex then
				local sortIndex = paintjob.sortIndex
				if maxSortIndex < sortIndex then
					maxSortIndex = sortIndex
				end
			end
		end
	end
	return maxSortIndex
end

CoD.CraftUtility.Paintjobs.GetCACPaintjobList = function ( weaponIndex )
	local paintjobSlotList = CoD.CraftUtility.Paintjobs.CachedPaintjobs
	local weaponPaintjobList = {}
	for slot = 0, #paintjobSlotList - 1, 1 do
		local paintjobsList = paintjobSlotList[slot]
		for paintjobIndex = 0, #paintjobsList - 1, 1 do
			local paintjob = paintjobsList[paintjobIndex]
			paintjob.paintjobSlot = slot
			paintjob.paintjobIndex = paintjobIndex
			if paintjob.weaponIndex == weaponIndex then
				table.insert( weaponPaintjobList, paintjob )
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
	for slot = 0, #paintjobSlotList - 1, 1 do
		local paintjobsList = paintjobSlotList[slot]
		for paintjobIndex = 0, #paintjobsList - 1, 1 do
			local paintjob = paintjobsList[paintjobIndex]
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
	table.sort( weaponPaintjobList, function ( a, b )
		return b.sortIndex < a.sortIndex
	end )
	return weaponPaintjobList
end

CoD.CraftUtility.Paintjobs.GetTotalAllowedPaintjobs = function ()
	return Dvar.total_paintjobs:get()
end

CoD.CraftUtility.Paintjobs.GetDDLRoot = function ( controller, fileType, slot )
	return Engine.StorageGetBuffer( controller, fileType, slot )
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
		local rootState = CoD.CraftUtility.Paintjobs.GetDDLRoot( controller, fileType, slot )
		CoD.CraftUtility.Paintjobs.CachedPaintjobs[slot] = {}
		if rootState == nil then
			CoD.CraftUtility.Paintjobs.CachedPaintjobs = {}
			return false
		end
		for paintjobIndex = 0, paintjobs_per_slot - 1, 1 do
			local total_paintjobs_cached = slot * paintjobs_per_slot + paintjobIndex
			if total_paintjobs <= total_paintjobs_cached then
				return 
			end
			local paintjob = {}
			local paintjobState = rootState.weaponPaintjob[paintjobIndex]
			paintjob.weaponIndex = paintjobState.weaponIndex:get()
			paintjob.sortIndex = paintjobState.sortIndex:get()
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
	local rootState = CoD.CraftUtility.Paintjobs.GetDDLRoot( controller, Enum.StorageFileType.STORAGE_PAINTJOBS, slot )
	if rootState ~= nil then
		local weaponPaintjobState = rootState.weaponPaintjob[paintjobIndex]
		weaponPaintjobState.weaponIndex:set( weaponIndex )
		weaponPaintjobState.sortIndex:set( sortIndex )
		Engine.UploadPaintjobData( controller, slot, paintjobIndex )
	end
end

CoD.CraftUtility.Paintjobs.ClearPaintjob = function ( controller, paintjobSlot, paintjobIndex )
	local rootState = CoD.CraftUtility.Paintjobs.GetDDLRoot( controller, Enum.StorageFileType.STORAGE_PAINTJOBS, paintjobSlot )
	if rootState ~= nil then
		local weaponPaintjobState = rootState.weaponPaintjob[paintjobIndex]
		weaponPaintjobState.sortIndex:set( CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX )
		weaponPaintjobState.weaponIndex:set( CoD.CraftUtility.Paintjobs.EMPTY_PAINTJOB_SLOT_WEAPON_INDEX )
		Engine.UploadPaintjobData( controller, paintjobSlot, paintjobIndex )
	end
end

