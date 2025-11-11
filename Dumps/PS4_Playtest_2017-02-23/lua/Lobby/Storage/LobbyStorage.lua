require( "lua.Lobby.Common.LobbyCore" )

Lobby.Storage = {}
Lobby.Gunsmith = {}
Lobby.Storage.OnStorageRead = function ( data )
	if data.result ~= Enum.StorageResult.STORAGE_SUCCESS then
		LuaUtils.LogQoS( "storage", data )
	elseif data.fileType == Enum.StorageFileType.STORAGE_MP_STATS_ONLINE then
		Lobby.Stats.OnMPOnlineStatsDownloaded( data.controller )
	elseif data.fileType == Enum.StorageFileType.STORAGE_MP_LOADOUTS then
		Lobby.Stats.ValidateLoadouts( data.controller )
	elseif data.fileType == Enum.StorageFileType.STORAGE_MP_CLASS_SETS then
		Lobby.Stats.ValidateLoadouts( data.controller )
	elseif data.fileType == Enum.StorageFileType.STORAGE_COMMON_SETTINGS then
		Lobby.Stats.OnProfileCommonStatsDownloaded( data.controller )
	elseif data.fileType == Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE then
		Lobby.Stats.OnZMOnlineStatsDownloaded( data.controller )
	end
end

Lobby.Storage.OnStorageWrite = function ( data )
	if data.result ~= Enum.StorageResult.STORAGE_SUCCESS then
		LuaUtils.LogQoS( "storage", data )
	else
		Engine.PrintError( Enum.consoleLabel.LABEL_LOBBYVM, "Lobby.Storage.OnStorageWrite(): MP stats validation is disabled, enable before ship.\n" )
	end
end

Lobby.Storage.OnStorageWriteDispatch = function ( data )
	local controller = data.controller
end

Lobby.Gunsmith.InitializeBuffer = function ( rootState )
	local totalVariants = #rootState.variant
	for index = 0, totalVariants - 1, 1 do
		local variantState = rootState.variant[index]
		variantState.variantIndex:set( index )
		variantState.paintjobSlot:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
		variantState.paintjobIndex:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
	end
end

Lobby.Gunsmith.ClearBuffer = function ( rootState )
	local totalVariants = #rootState.variant
	for index = 0, totalVariants - 1, 1 do
		local variantState = rootState.variant[index]
		variantState.variantName:set( "" )
		local totalAttachments = #variantState.attachment
		for attachmentIndex = 0, totalAttachments - 1, 1 do
			variantState.attachment[attachmentIndex]:set( 0 )
		end
		local totalAttachmentVariants = #variantState.attachmentVariant
		for attachmentVarIndex = 0, totalAttachmentVariants - 1, 1 do
			variantState.attachmentVariant[attachmentVarIndex]:set( 0 )
		end
		variantState.reticleIndex:set( 0 )
		variantState.camoIndex:set( 0 )
		variantState.paintjobSlot:set( 0 )
		variantState.paintjobIndex:set( 0 )
		variantState.weaponIndex:set( 0 )
		variantState.variantIndex:set( 0 )
		variantState.sortIndex:set( 0 )
		variantState.readOnly:set( 0 )
		variantState.createTime:set( 0 )
	end
end

Lobby.Gunsmith.OnInitilizeGunsmithBuffer = function ( data )
	local controller = data.controller
	Engine.StorageReset( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
	local rootState = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
	Lobby.Gunsmith.InitializeBuffer( rootState )
	Engine.StorageWrite( controller, Enum.StorageFileType.STORAGE_GUNSMITH )
end

Lobby.Storage.OnInitilizeZMLoadoutBuffer = function ( data )
	local controller = data.controller
	local storageFileType = data.storageFileType
	local buffer = Engine.StorageGetBuffer( controller, storageFileType )
	if buffer then
		local cacLoadouts = buffer.cacLoadouts
		if cacLoadouts then
			Lobby.Gunsmith.ClearBuffer( cacLoadouts )
			Lobby.Gunsmith.InitializeBuffer( cacLoadouts )
		end
	end
end

Lobby.Storage.OnInitializeStats = function ( data )
	local controller = data.controller
	local storageFileType = data.storageFileType
	if storageFileType == Enum.StorageFileType.STORAGE_MP_STATS_ONLINE then
		local f8_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		local itemStats = f8_local0.itemStats
		local f8_local1 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
		local weaponStats = f8_local1.weaponStats
		if itemStats then
			for itemIndex = 1, 255, 1 do
				if Engine.ItemIndexValid( itemIndex, Enum.eModes.MODE_MULTIPLAYER ) and Engine.GetItemUnlockLevel( itemIndex, Enum.eModes.MODE_MULTIPLAYER ) == 0 and not Engine.ItemIndexIsBlackMarket( itemIndex, Enum.eModes.MODE_MULTIPLAYER ) then
					itemStats[itemIndex].markedOld:set( 1 )
				end
			end
		end
		if weaponStats then
			for weaponIndex = 1, 199, 1 do
				weaponStats[weaponIndex].attachmentMarkedOld.clantag:set( 1 )
				weaponStats[weaponIndex].attachmentMarkedOld.killcounter:set( 1 )
			end
		end
	elseif storageFileType == Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE then
		local f8_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
		local itemStats = f8_local0.itemStats
		if itemStats then
			for itemIndex = 1, 255, 1 do
				if Engine.ItemIndexValid( itemIndex, Enum.eModes.MODE_ZOMBIES ) and Engine.GetItemUnlockLevel( itemIndex, Enum.eModes.MODE_ZOMBIES ) == 0 and Engine.GetDLCNameForItem( itemIndex, Enum.eModes.MODE_ZOMBIES ) == nil then
					itemStats[itemIndex].markedOld:set( 1 )
				end
			end
		end
	elseif storageFileType == Enum.StorageFileType.STORAGE_CP_STATS_ONLINE then
		Lobby.Stats.InitializeCareerStats( controller, storageFileType )
	elseif storageFileType == Enum.StorageFileType.STORAGE_CP_STATS_OFFLINE then
		Lobby.Stats.InitializeCareerStats( controller, storageFileType )
	end
end

Lobby.Storage.SetDefaultShowcaseWeapon = function ( cacLoadouts, mode )
	local arakIndex = Engine.GetItemIndexFromReference( "ar_standard", mode )
	for index = 0, #cacLoadouts.characters - 1, 1 do
		local showcaseWeapon = cacLoadouts.characters[index].showcaseWeapon
		showcaseWeapon.weaponIndex:set( arakIndex )
		showcaseWeapon.paintjobSlot:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT )
		showcaseWeapon.paintjobIndex:set( Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX )
	end
end

Lobby.Storage.OnInitializeLoadouts = function ( data )
	local controller = data.controller
	local storageFileType = data.storageFileType
	local statsNetworkType = data.statsNetworkType
	if storageFileType == Enum.StorageFileType.STORAGE_ZM_LOADOUTS then
		local f10_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_ZM_LOADOUTS )
		local cacLoadouts = f10_local0.cacLoadouts
		Lobby.Gunsmith.InitializeBuffer( cacLoadouts )
		cacLoadouts.characterContext.characterIndex:set( 6 )
		Lobby.Storage.SetDefaultShowcaseWeapon( cacLoadouts, Enum.eModes.MODE_ZOMBIES )
	elseif storageFileType == Enum.StorageFileType.STORAGE_ZM_LOADOUTS_OFFLINE then
		local f10_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_ZM_LOADOUTS_OFFLINE )
		local cacLoadouts = f10_local0.cacLoadouts
		Lobby.Gunsmith.InitializeBuffer( cacLoadouts )
		cacLoadouts.characterContext.characterIndex:set( 6 )
		Lobby.Storage.SetDefaultShowcaseWeapon( cacLoadouts, Enum.eModes.MODE_ZOMBIES )
	elseif storageFileType == Enum.StorageFileType.STORAGE_MP_LOADOUTS_OFFLINE then
		local f10_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_LOADOUTS_OFFLINE )
		local cacLoadouts = f10_local0.cacLoadouts
		Lobby.Storage.SetDefaultShowcaseWeapon( cacLoadouts, Enum.eModes.MODE_MULTIPLAYER )
		local equippedHeroIndex = Engine.GetEquippedHeroForCACType( controller, Enum.eModes.MODE_MULTIPLAYER, Enum.CACType.CAC_TYPE_MP_OFFLINE )
		if equippedHeroIndex then
			local heroWeapon = Engine.GetLoadoutItemIndexForHero( Enum.eModes.MODE_MULTIPLAYER, equippedHeroIndex, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
			if cacLoadouts and cacLoadouts.heroweapon then
				cacLoadouts.heroweapon:set( heroWeapon )
			end
		end
	elseif storageFileType == Enum.StorageFileType.STORAGE_MP_LOADOUTS or storageFileType == Enum.StorageFileType.STORAGE_MP_LOADOUTS_CUSTOM or storageFileType == Enum.StorageFileType.STORAGE_MP_LOADOUTS_ARENA then
		local f10_local0 = Engine.StorageGetBuffer( controller, storageFileType )
		local cacLoadouts = f10_local0.cacLoadouts
		Lobby.Storage.SetDefaultShowcaseWeapon( cacLoadouts, Enum.eModes.MODE_MULTIPLAYER )
		if storageFileType ~= Enum.StorageFileType.STORAGE_MP_LOADOUTS_ARENA then
			local equippedHeroIndex = Engine.GetEquippedHeroForCACType( controller, Enum.eModes.MODE_MULTIPLAYER, Enum.CACType.CAC_TYPE_MP_PUBLIC )
			if equippedHeroIndex then
				local heroWeapon = Engine.GetLoadoutItemIndexForHero( Enum.eModes.MODE_MULTIPLAYER, equippedHeroIndex, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
				if cacLoadouts and cacLoadouts.heroweapon then
					cacLoadouts.heroweapon:set( heroWeapon )
				end
			end
			if cacLoadouts and storageFileType == Enum.StorageFileType.STORAGE_MP_LOADOUTS then
				local mode = Enum.eModes.MODE_MULTIPLAYER
				local heroTable = Engine.GetHeroList( mode )
				for characterIndex = 0, #heroTable - 1, 1 do
					if cacLoadouts.characters[characterIndex].itemList then
						cacLoadouts.characters[characterIndex].itemList.body.items[0].markedOld:set( 1 )
						cacLoadouts.characters[characterIndex].itemList.helmet.items[0].markedOld:set( 1 )
					end
					if cacLoadouts.characters[characterIndex].tauntMarkedOld and cacLoadouts.characters[characterIndex].tauntMarkedOld.first_place and cacLoadouts.characters[characterIndex].tauntMarkedOld.first_place.markedOld then
						cacLoadouts.characters[characterIndex].tauntMarkedOld.first_place.markedOld[0]:set( 1 )
					end
				end
			end
		end
	elseif storageFileType == Enum.StorageFileType.STORAGE_CP_LOADOUTS then
		local f10_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_CP_LOADOUTS )
		local cacLoadouts = f10_local0.cacLoadouts
		Lobby.Storage.SetDefaultShowcaseWeapon( cacLoadouts, Enum.eModes.MODE_CAMPAIGN )
		if cacLoadouts then
			local mode = Enum.eModes.MODE_CAMPAIGN
			local heroTable = Engine.GetHeroList( mode )
			for characterIndex = 0, #heroTable - 1, 1 do
				if cacLoadouts.characters[characterIndex].itemList then
					cacLoadouts.characters[characterIndex].itemList.body.items[0].markedOld:set( 1 )
					cacLoadouts.characters[characterIndex].itemList.helmet.items[0].markedOld:set( 1 )
					cacLoadouts.characters[characterIndex].itemList.helmet.items[1].markedOld:set( 1 )
				end
			end
		end
	elseif storageFileType == Enum.StorageFileType.STORAGE_CP_LOADOUTS_OFFLINE then
		local f10_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_CP_LOADOUTS_OFFLINE )
		local cacLoadouts = f10_local0.cacLoadouts
		Lobby.Storage.SetDefaultShowcaseWeapon( cacLoadouts, Enum.eModes.MODE_CAMPAIGN )
	end
end

