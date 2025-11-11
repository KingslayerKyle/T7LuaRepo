CoD.PrestigeUtility = {}
CoD.PrestigeUtility.INVALID_PARAGON_ICON_ID = 0
CoD.PrestigeUtility.DEFAULT_PARAGON_ICON_ID = 11
CoD.PrestigeUtility.PRESTIGE_MASTER_MAX_TIERS = 10
CoD.PrestigeUtility.LEADERBOARD_RESET_FILE_MP = "leaderboards/mp_leaderboards_reset.csv"
CoD.PrestigeUtility.isInPermanentUnlockMenu = false
CoD.PrestigeUtility.previousGameMode = nil
CoD.PrestigeUtility.previousStatsMilestonePath = nil
CoD.PrestigeUtility.GetPrestigeGameMode = function ()
	local mode = Enum.eModes.MODE_MULTIPLAYER
	local modeModel = Engine.GetModel( Engine.GetGlobalModel(), "prestigeGameMode" )
	if modeModel == nil then
		return mode
	end
	mode = Engine.GetModelValue( modeModel )
	if mode == nil or mode == Enum.eModes.MODE_INVALID then
		mode = Enum.eModes.MODE_MULTIPLAYER
	end
	return mode
end

CoD.PrestigeUtility.GetMaxRankByMode = function ( mode )
	if mode == Enum.eModes.MODE_CAMPAIGN then
		return CoD.maxRankByMode.CP
	elseif mode == Enum.eModes.MODE_MULTIPLAYER then
		return CoD.maxRankByMode.MP
	elseif mode == Enum.eModes.MODE_ZOMBIES then
		return CoD.maxRankByMode.ZM
	else
		return 0
	end
end

CoD.PrestigeUtility.GetPrestigeGameModeString = function ()
	if CoD.PrestigeUtility.GetPrestigeGameMode() == Enum.eModes.MODE_ZOMBIES then
		return "zm"
	else
		return "mp"
	end
end

CoD.PrestigeUtility.GetStringForMode = function ( str )
	if CoD.PrestigeUtility.GetPrestigeGameMode() == Enum.eModes.MODE_ZOMBIES then
		return "MENU_ZM_" .. str
	else
		return "MENU_" .. str
	end
end

CoD.PrestigeUtility.GetCurrentPLevel = function ( controller, mode )
	if not mode then
		mode = CoD.PrestigeUtility.GetPrestigeGameMode()
	end
	local currentStats = Engine.GetPlayerStats( controller, CoD.STATS_LOCATION_NORMAL, mode )
	return currentStats.PlayerStatsList.PLEVEL.StatValue:get()
end

CoD.PrestigeUtility.GetBackgroundIdByPLevel = function ( controller, plevel, mode )
	if not mode then
		mode = CoD.PrestigeUtility.GetPrestigeGameMode()
	end
	if Engine.GetPrestigeCap( mode ) < plevel then
		return 0
	else
		local prestigeBackgrounds = Engine.GetBackgroundsForCategoryName( controller, "prestige" )
		if #prestigeBackgrounds < plevel then
			return 0
		else
			return prestigeBackgrounds[plevel].id
		end
	end
end

CoD.PrestigeUtility.GetPermanentUnlockMode = function ()
	local modeModel = Engine.GetModel( Engine.GetGlobalModel(), "prestigeGameMode" )
	if modeModel ~= nil then
		local mode = Engine.GetModelValue( modeModel )
		if mode ~= nil and mode ~= Enum.eModes.MODE_INVALID then
			return mode
		end
	end
	return Engine.CurrentSessionMode()
end

CoD.PrestigeUtility.CreatePermanentUnlockTokenModel = function ( controller )
	local permanentUnlockTokensCountModel = Engine.GetModel( Engine.GetModelForController( controller ), "permanentUnlockTokensCount" )
	local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
	Engine.SetModelValue( permanentUnlockTokensCountModel, Engine.GetPermanentUnlockCount( controller, mode ) )
end

CoD.PrestigeUtility.IsPrestigeBackground = function ( controller )
	local currentBackgroundId = Engine.GetEmblemBackgroundId()
	local prestigeBackgrounds = Engine.GetBackgroundsForCategoryName( controller, "prestige" )
	local isPrestigeBackground = false
	for _, backgroundInfo in pairs( prestigeBackgrounds ) do
		if backgroundInfo.id == currentBackgroundId then
			isPrestigeBackground = true
			break
		end
	end
	local zmPrestigeBackgrounds = Engine.GetBackgroundsForCategoryName( controller, "zmprestige" )
	for _, backgroundInfo in pairs( zmPrestigeBackgrounds ) do
		if backgroundInfo.id == currentBackgroundId then
			isPrestigeBackground = true
			break
		end
	end
	return isPrestigeBackground
end

CoD.PrestigeUtility.ResetChallengeDatasources = function ( controller )
	CoD.ChallengesUtility.ResetCategoryStats( controller )
	CoD.ChallengesUtility.ResetNearCompletion( controller )
	if CoD.ChallengesUtility.IsBackgroundLockByChallenge( controller, CoD.PrestigeUtility.GetPrestigeGameMode() ) or CoD.PrestigeUtility.IsPrestigeBackground( controller ) then
		Engine.ExecNow( controller, "emblemSetRandomDefaultBackground" )
	end
end

CoD.PrestigeUtility.ResetToFirstSelectedCharacterLoadout = function ( controller, characterType, loadoutSlot )
	if 10 <= characterType then
		characterType = 0
	end
	Engine.ExecNow( controller, "resetMPCharacterLoadout " .. characterType .. " " .. loadoutSlot )
	Engine.SetHeroForCACType( controller, Enum.eModes.MODE_MULTIPLAYER, Enum.CACType.CAC_TYPE_MP_PUBLIC, characterType )
	Engine.SetHeroLoadoutItemForCACType( controller, Enum.eModes.MODE_MULTIPLAYER, Enum.CACType.CAC_TYPE_MP_PUBLIC, characterType, loadoutSlot )
	Engine.SetFirstTimeComplete( controller, Enum.eModes.MODE_MULTIPLAYER, true )
end

CoD.PrestigeUtility.EnterPrestigeActionMP = function ( self, controller, menu )
	local loadout = Engine.GetFirstSelectedHeroLoadout( controller, Enum.CACType.CAC_TYPE_MP_PUBLIC )
	local prestigeLevelOld = CoD.PrestigeUtility.GetCurrentPLevel( controller, Enum.eModes.MODE_MULTIPLAYER )
	CoD.MetricsUtility.PrestigeEvent( controller, prestigeLevelOld, prestigeLevelOld + 1, "mp" )
	Engine.ExecNow( controller, "exec gamedata/configs/mp/prestige_reset.cfg" )
	Engine.ExecNow( controller, "PrestigeAddCAC " .. tostring( Enum.eModes.MODE_MULTIPLAYER ) )
	CoD.PrestigeUtility.ResetToFirstSelectedCharacterLoadout( controller, loadout.characterType, loadout.loadoutSlot )
	CoD.PrestigeUtility.ResetChallengeDatasources( controller )
	local postPrestigeStats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if postPrestigeStats ~= nil then
		postPrestigeStats.validationEvent:set( "pres" )
	end
	SaveLoadout( self, controller )
	Engine.Exec( controller, "uploadstats " .. tostring( Enum.eModes.MODE_MULTIPLAYER ) )
	Engine.Exec( controller, "savegamerprofilestats" )
	DataSources.PrestigeStats.getModel( controller )
	local previousMenu = GoBack( menu, controller )
	OpenSystemOverlay( self, previousMenu, controller, "PrestigeFanfare", nil )
end

CoD.PrestigeUtility.SavePermanentlyUnlockedWeaponVariants = function ( controller, mode )
	local permanentlyUnlockedWeapons = {}
	if mode == Enum.eModes.MODE_ZOMBIES then
		local statsState = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
		local totalPermanentUnlocks = #statsState.prestigeTokens
		for index = 0, totalPermanentUnlocks - 1, 1 do
			local permanentTokenState = statsState.prestigeTokens[index]
			if permanentTokenState.itemUnlocked:get() ~= 0 then
				permanentlyUnlockedWeapons[permanentTokenState.itemUnlocked:get()] = {}
			end
		end
		local index = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_ZM_LOADOUTS )
		local loadoutState = index.cacLoadouts
		local totalVariants = #loadoutState.variant
		for index = 0, totalVariants - 1, 1 do
			local variantState = loadoutState.variant[index]
			local unlockedWeapon = permanentlyUnlockedWeapons[variantState.weaponIndex:get()]
			if unlockedWeapon then
				unlockedWeapon.variantName = variantState.variantName:get()
				unlockedWeapon.attachment = {}
				local totalAttachments = #variantState.attachment
				for attachmentIndex = 0, totalAttachments - 1, 1 do
					unlockedWeapon.attachment[attachmentIndex] = variantState.attachment[attachmentIndex]:get()
				end
				unlockedWeapon.attachmentVariant = {}
				local totalAttachmentVariants = #variantState.attachmentVariant
				for attachmentVarIndex = 0, totalAttachmentVariants - 1, 1 do
					unlockedWeapon.attachmentVariant[attachmentVarIndex] = variantState.attachmentVariant[attachmentVarIndex]:get()
				end
				unlockedWeapon.reticleIndex = variantState.reticleIndex:get()
				unlockedWeapon.camoIndex = variantState.camoIndex:get()
				unlockedWeapon.paintjobSlot = variantState.paintjobSlot:get()
				unlockedWeapon.paintjobIndex = variantState.paintjobIndex:get()
				unlockedWeapon.weaponIndex = variantState.weaponIndex:get()
				unlockedWeapon.variantIndex = variantState.variantIndex:get()
				unlockedWeapon.sortIndex = variantState.sortIndex:get()
				unlockedWeapon.readOnly = variantState.readOnly:get()
				unlockedWeapon.createTime = variantState.createTime:get()
			end
		end
	end
	return permanentlyUnlockedWeapons
end

CoD.PrestigeUtility.RestorePermanentlyUnlockedWeaponVariants = function ( controller, mode, unlockedWeapons )
	if mode == Enum.eModes.MODE_ZOMBIES then
		local f14_local0 = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_ZM_LOADOUTS )
		local loadoutState = f14_local0.cacLoadouts
		local currentVariantIndex = 0
		for weaponIndex, unlockedWeapon in pairs( unlockedWeapons ) do
			local variantState = loadoutState.variant[currentVariantIndex]
			variantState.variantName:set( unlockedWeapon.variantName )
			local totalAttachments = #unlockedWeapon.attachment
			for f14_local4 = 0, totalAttachments - 1, 1 do
				variantState.attachment[f14_local4]:set( unlockedWeapon.attachment[f14_local4] )
			end
			local totalAttachmentVariants = #unlockedWeapon.attachmentVariant
			for attachmentVarIndex = 0, totalAttachmentVariants - 1, 1 do
				variantState.attachmentVariant[attachmentVarIndex]:set( unlockedWeapon.attachmentVariant[attachmentVarIndex] )
			end
			variantState.reticleIndex:set( unlockedWeapon.reticleIndex )
			variantState.camoIndex:set( unlockedWeapon.camoIndex )
			variantState.paintjobSlot:set( unlockedWeapon.paintjobSlot )
			variantState.paintjobIndex:set( unlockedWeapon.paintjobIndex )
			variantState.weaponIndex:set( unlockedWeapon.weaponIndex )
			variantState.variantIndex:set( unlockedWeapon.variantIndex )
			variantState.sortIndex:set( unlockedWeapon.sortIndex )
			variantState.readOnly:set( unlockedWeapon.readOnly )
			variantState.createTime:set( unlockedWeapon.createTime )
		end
	end
end

CoD.PrestigeUtility.EnterPrestigeActionZM = function ( self, controller, menu )
	local prestigeLevelOld = CoD.PrestigeUtility.GetCurrentPLevel( controller )
	CoD.MetricsUtility.PrestigeEvent( controller, prestigeLevelOld, prestigeLevelOld + 1, "zm" )
	local unlockedWeapons = CoD.PrestigeUtility.SavePermanentlyUnlockedWeaponVariants( controller, Enum.eModes.MODE_ZOMBIES )
	Engine.ExecNow( controller, "exec gamedata/configs/zm/zm_prestige_reset.cfg" )
	Engine.ExecNow( controller, "PrestigeAddCAC " .. tostring( Enum.eModes.MODE_ZOMBIES ) )
	CoD.PrestigeUtility.ResetChallengeDatasources( controller )
	CoD.PrestigeUtility.RestorePermanentlyUnlockedWeaponVariants( controller, Enum.eModes.MODE_ZOMBIES, unlockedWeapons )
	SaveLoadout( self, controller )
	Engine.Exec( controller, "uploadstats " .. tostring( Enum.eModes.MODE_ZOMBIES ) )
	Engine.Exec( controller, "savegamerprofilestats" )
	DataSources.PrestigeStats.getModel( controller )
	local previousMenu = GoBack( menu, controller )
	OpenSystemOverlay( self, previousMenu, controller, "PrestigeFanfare", nil )
end

CoD.PrestigeUtility.FreshStartActionMP = function ( self, controller, menu )
	local loadout = Engine.GetFirstSelectedHeroLoadout( controller, Enum.CACType.CAC_TYPE_MP_PUBLIC )
	local currentStats = Engine.GetPlayerStats( controller, CoD.STATS_LOCATION_NORMAL, CoD.PrestigeUtility.GetPrestigeGameMode() )
	local resetCount = currentStats.PlayerStatsList.STATRESETCOUNT.StatValue:get()
	Engine.ExecNow( controller, "PrestigeStatsResetAll " .. tostring( Enum.eModes.MODE_MULTIPLAYER ) )
	Engine.ExecNow( controller, "resetLeaderboards " .. CoD.PrestigeUtility.LEADERBOARD_RESET_FILE_MP .. " LEADERBOARD_RESET_FAILED" )
	CoD.PrestigeUtility.ResetToFirstSelectedCharacterLoadout( controller, loadout.characterType, loadout.loadoutSlot )
	CoD.PrestigeUtility.ResetChallengeDatasources( controller )
	local freshStats = Engine.StorageGetBuffer( controller, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if freshStats ~= nil then
		freshStats.validationEvent:set( "fresh" )
	end
	currentStats.PlayerStatsList.STATRESETCOUNT.StatValue:set( resetCount + 1 )
	SaveLoadout( self, controller )
	Engine.Exec( controller, "uploadstats " .. tostring( Enum.eModes.MODE_MULTIPLAYER ) )
	Engine.Exec( controller, "savegamerprofilestats" )
	SetIsInPrestigeMenu( false )
	CloseStartMenu( menu, controller )
end

CoD.PrestigeUtility.FreshStartActionZM = function ( self, controller, menu )
	Engine.ExecNow( controller, "PrestigeStatsResetAll " .. tostring( Enum.eModes.MODE_ZOMBIES ) )
	CoD.PrestigeUtility.ResetChallengeDatasources( controller )
	SaveLoadout( self, controller )
	Engine.Exec( controller, "uploadstats " .. tostring( Enum.eModes.MODE_ZOMBIES ) )
	Engine.Exec( controller, "savegamerprofilestats" )
	SetIsInPrestigeMenu( false )
	CloseStartMenu( menu, controller )
end

CoD.PrestigeUtility.ChooseClassSets = {}
CoD.PrestigeUtility.ChooseClassSets.Default = 0
CoD.PrestigeUtility.ChooseClassSets.Custom = 1
CoD.PrestigeUtility.ContentCategory = {}
CoD.PrestigeUtility.ContentCategory.SPECIALISTS = 1
CoD.PrestigeUtility.ContentCategory.WEAPONS = 2
CoD.PrestigeUtility.ContentCategory.LETHAL = 3
CoD.PrestigeUtility.ContentCategory.TACTICAL = 4
CoD.PrestigeUtility.ContentCategory.PERK1 = 5
CoD.PrestigeUtility.ContentCategory.PERK2 = 6
CoD.PrestigeUtility.ContentCategory.PERK3 = 7
CoD.PrestigeUtility.ContentCategory.WILDCARDS = 8
CoD.PrestigeUtility.ContentCategory.SCORESTREAKS = 9
CoD.PrestigeUtility.ContentCategory.GOBBLEGUM = 10
CoD.PrestigeUtility.GetContentCategoryData = function ( categoryIndex )
	if categoryIndex == CoD.PrestigeUtility.ContentCategory.SPECIALISTS then
		return {
			menuName = "ChooseCharacterLoadout",
			weaponCategory = ""
		}
	elseif categoryIndex == CoD.PrestigeUtility.ContentCategory.WEAPONS then
		return {
			menuName = "PrimaryWeaponSelect",
			weaponCategory = "primary"
		}
	elseif categoryIndex == CoD.PrestigeUtility.ContentCategory.LETHAL then
		return {
			menuName = "LethalEquipmentSelect",
			weaponCategory = "primarygadget"
		}
	elseif categoryIndex == CoD.PrestigeUtility.ContentCategory.TACTICAL then
		return {
			menuName = "TacticalEquipmentSelect",
			weaponCategory = "secondarygadget"
		}
	elseif categoryIndex == CoD.PrestigeUtility.ContentCategory.PERK1 then
		return {
			menuName = "PerkSelect",
			weaponCategory = "specialty1"
		}
	elseif categoryIndex == CoD.PrestigeUtility.ContentCategory.PERK2 then
		return {
			menuName = "PerkSelect",
			weaponCategory = "specialty2"
		}
	elseif categoryIndex == CoD.PrestigeUtility.ContentCategory.PERK3 then
		return {
			menuName = "PerkSelect",
			weaponCategory = "specialty3"
		}
	elseif categoryIndex == CoD.PrestigeUtility.ContentCategory.WILDCARDS then
		return {
			menuName = "WildcardSelect",
			weaponCategory = "bonuscard1"
		}
	elseif categoryIndex == CoD.PrestigeUtility.ContentCategory.SCORESTREAKS then
		return {
			menuName = "Scorestreaks",
			weaponCategory = ""
		}
	elseif categoryIndex == CoD.PrestigeUtility.ContentCategory.GOBBLEGUM then
		return {
			menuName = "BubblegumBuffSelect",
			weaponCategory = ""
		}
	else
		
	end
end

CoD.PrestigeUtility.AddPrestigeCallingCards = function ( controller, mode, callingCardTable )
	if type( callingCardTable ) ~= "table" then
		return 
	end
	local currentPLevel = CoD.PrestigeUtility.GetCurrentPLevel( controller, mode )
	local maxPLevel = Engine.GetPrestigeCap( mode )
	if mode == Enum.eModes.MODE_ZOMBIES then
		if currentPLevel ~= maxPLevel then
			return 
		else
			local zmPrestigeBackgrounds = Engine.GetBackgroundsForCategoryName( controller, "zmprestige" )
			if #zmPrestigeBackgrounds == 0 then
				return 
			else
				table.insert( callingCardTable, {
					models = {
						title = GetPrestigeTitleForPLevelAndMode( CoD.ModeToModeString( mode ), maxPLevel ),
						description = Engine.Localize( "CLASS_PRESTIGE_MASTER_UNLOCK_DESC" ),
						iconId = zmPrestigeBackgrounds[1].id,
						maxTier = 0,
						currentTier = 0,
						statPercent = 1,
						statFractionText = "",
						tierStatus = "",
						xp = "",
						percentComplete = 1,
						isLocked = false
					},
					properties = {
						isPrestige = true
					}
				} )
				return 
			end
		end
	end
	for plevel = 1, currentPLevel, 1 do
		local unlockDesc = Engine.Localize( "CLASS_PRESTIGE_UNLOCK_DESC", plevel )
		if plevel == maxPLevel then
			unlockDesc = Engine.Localize( "CLASS_PRESTIGE_MASTER_UNLOCK_DESC" )
		end
		table.insert( callingCardTable, {
			models = {
				title = GetPrestigeTitleForPLevelAndMode( CoD.ModeToModeString( mode ), plevel ),
				description = unlockDesc,
				iconId = CoD.PrestigeUtility.GetBackgroundIdByPLevel( controller, plevel, mode ),
				maxTier = 0,
				currentTier = 0,
				statPercent = 1,
				statFractionText = "",
				tierStatus = "",
				xp = "",
				percentComplete = 1,
				isLocked = false
			},
			properties = {
				isPrestige = true
			}
		} )
	end
end

local ContentCategories = {
	SPECIALISTS = {
		displayText = "MENU_SPECIALISTS",
		description = "MENU_PERMANENT_UNLOCKS_SPECIALISTS_DESC",
		image = "t7_icon_pbt_mp_battery_head1_skin1_rwd",
		action = OpenChooseCharacterLoadout,
		param = ""
	},
	WEAPONS = {
		displayText = "MENU_WEAPONS",
		description = "MENU_PERMANENT_UNLOCKS_WEAPONS_DESC",
		image = "t7_icon_weapon_ar_standard_rwd",
		action = OpenPermanentWeaponUnlockCategoryMenu,
		param = CoD.PrestigeUtility.ContentCategory.WEAPONS
	},
	LETHAL = {
		displayText = "MPUI_PRIMARYGADGET",
		description = "MENU_PERMANENT_UNLOCKS_LETHALS_DESC",
		image = "t7_hud_icon_menu_frag_rwd",
		action = OpenPermanentUnlockCategoryMenu,
		param = CoD.PrestigeUtility.ContentCategory.LETHAL
	},
	TACTICAL = {
		displayText = "MENU_TACTICAL",
		description = "MENU_PERMANENT_UNLOCKS_TACTICALS_DESC",
		image = "t7_hud_icon_menu_concussion_rwd",
		action = OpenPermanentUnlockCategoryMenu,
		param = CoD.PrestigeUtility.ContentCategory.TACTICAL
	},
	PERK1 = {
		displayText = "MPUI_PERK1",
		description = "MENU_PERMANENT_UNLOCKS_PERK1_DESC",
		image = "t7_hud_perk_jetcharge_rwd",
		action = OpenPermanentUnlockCategoryMenu,
		param = CoD.PrestigeUtility.ContentCategory.PERK1
	},
	PERK2 = {
		displayText = "MPUI_PERK2",
		description = "MENU_PERMANENT_UNLOCKS_PERK2_DESC",
		image = "t7_hud_perk_fasthands_rwd",
		action = OpenPermanentUnlockCategoryMenu,
		param = CoD.PrestigeUtility.ContentCategory.PERK2
	},
	PERK3 = {
		displayText = "MPUI_PERK3",
		description = "MENU_PERMANENT_UNLOCKS_PERK3_DESC",
		image = "t7_hud_perk_gungho_rwd",
		action = OpenPermanentUnlockCategoryMenu,
		param = CoD.PrestigeUtility.ContentCategory.PERK3
	},
	WILDCARDS = {
		displayText = "MENU_WILDCARDS",
		description = "MENU_PERMANENT_UNLOCKS_WILDCARDS_DESC",
		image = "t7_hud_cac_wildcards_perk3greed_256_rwd",
		action = OpenPermanentUnlockCategoryMenu,
		param = CoD.PrestigeUtility.ContentCategory.WILDCARDS
	},
	SCORESTREAKS = {
		displayText = "MENU_SCORESTREAKS",
		description = "MENU_PERMANENT_UNLOCKS_SCORESTREAKS_DESC",
		image = "t7_hud_ks_drone_attack_rwd",
		action = OpenScorestreaks,
		param = ""
	},
	GOBBLEGUM = {
		displayText = "MENU_STORE_BUBBLEGUM_BUFFS",
		description = "MENU_PERMANENT_UNLOCKS_GOBBLEGUM_DESC",
		image = "uie_t7_menu_gobblegum_comsumable",
		action = OpenPermanentUnlockCategoryMenu,
		param = CoD.PrestigeUtility.ContentCategory.GOBBLEGUM
	}
}
local sortedContentCategoriesMP = {
	ContentCategories.SPECIALISTS,
	ContentCategories.WEAPONS,
	ContentCategories.LETHAL,
	ContentCategories.TACTICAL,
	ContentCategories.PERK1,
	ContentCategories.PERK2,
	ContentCategories.PERK3,
	ContentCategories.WILDCARDS,
	ContentCategories.SCORESTREAKS
}
local sortedContentCategoriesZM = {
	ContentCategories.WEAPONS,
	ContentCategories.GOBBLEGUM
}
CoD.PrestigeUtility.PermanentUnlockCategoryListPrepare = function ( controller )
	local categoryList = {}
	local categories = sortedContentCategoriesMP
	if CoD.PrestigeUtility.GetPrestigeGameMode() == Enum.eModes.MODE_ZOMBIES then
		categories = sortedContentCategoriesZM
	end
	for _, category in pairs( categories ) do
		table.insert( categoryList, {
			models = {
				displayText = category.displayText,
				description = category.description,
				image = category.image,
				action = category.action,
				param = category.param
			}
		} )
	end
	return categoryList
end

DataSources.PermanentUnlockCategoryList = DataSourceHelpers.ListSetup( "PermanentUnlockCategoryList", CoD.PrestigeUtility.PermanentUnlockCategoryListPrepare, true )
CoD.OverlayUtility.AddSystemOverlay( "EnterPrestigeMode", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.systemOverlay_Prestige",
	title = function ( controller )
		local nextPLevel = CoD.PrestigeUtility.GetCurrentPLevel( controller ) + 1
		return Engine.Localize( "MENU_PRESTIGE_ENTER_LEVEL_QUESTION", nextPLevel )
	end,
	description = function ()
		return Engine.Localize( CoD.PrestigeUtility.GetStringForMode( "PRESTIGE_MODE_DESC_3" ) )
	end,
	supportText = "",
	image = function ( controller )
		local nextPLevel = CoD.PrestigeUtility.GetCurrentPLevel( controller ) + 1
		local rankIconName = Engine.GetRankIcon( 0, nextPLevel, CoD.PrestigeUtility.GetPrestigeGameMode() )
		return GetRankIconLarge( rankIconName )
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	listDatasource = function ( controller )
		DataSources.UnlockTokenMenuList = DataSourceHelpers.ListSetup( "UnlockTokenMenuList", function ( controller )
			local list = {}
			local nextPLevel = CoD.PrestigeUtility.GetCurrentPLevel( controller ) + 1
			local addItemListButton = function ( displayText, action, isDefaultFocus )
				return {
					models = {
						displayText = displayText
					},
					properties = {
						action = action,
						selectIndex = isDefaultFocus
					}
				}
			end
			
			local EnterPrestigeAction = function ( self, element, controller, actionParam, menu )
				if CheckIfFeatureIsBanned( controller, LuaEnum.FEATURE_BAN.PRESTIGE ) then
					LuaUtils.UI_ShowErrorMessageDialog( controller, GetFeatureBanInfo( controller, LuaEnum.FEATURE_BAN.PRESTIGE ) )
					return 
				elseif CoD.PrestigeUtility.GetPrestigeGameMode() == Enum.eModes.MODE_ZOMBIES then
					CoD.PrestigeUtility.EnterPrestigeActionZM( self, controller, menu )
				else
					CoD.PrestigeUtility.EnterPrestigeActionMP( self, controller, menu )
				end
			end
			
			local CancelPrestigeAction = function ( self, element, controller, actionParam, menu )
				GoBack( menu, controller )
			end
			
			table.insert( list, addItemListButton( Engine.Localize( "MENU_PRESTIGE_ENTER_LEVEL", nextPLevel ), EnterPrestigeAction, false ) )
			table.insert( list, addItemListButton( "MENU_CANCEL", CancelPrestigeAction, true ) )
			return list
		end, true )
		return "UnlockTokenMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
CoD.OverlayUtility.AddSystemOverlay( "PrestigeFanfare", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.systemOverlay_PrestigeFanfare",
	title = function ( controller )
		local plevel = CoD.PrestigeUtility.GetCurrentPLevel( controller )
		return Engine.Localize( "MPUI_PRESTIGE_N", plevel )
	end,
	description = function ( controller )
		local plevel = CoD.PrestigeUtility.GetCurrentPLevel( controller )
		return Engine.Localize( "MENU_PRESTIGE_FANFARE_DESC", plevel )
	end,
	image = function ( controller )
		local plevel = CoD.PrestigeUtility.GetCurrentPLevel( controller )
		local rankIconName = Engine.GetRankIcon( 0, plevel, CoD.PrestigeUtility.GetPrestigeGameMode() )
		return GetRankIconLarge( rankIconName )
	end,
	backgroundId = function ( controller )
		local plevel = CoD.PrestigeUtility.GetCurrentPLevel( controller )
		return CoD.PrestigeUtility.GetBackgroundIdByPLevel( controller, plevel )
	end,
	[CoD.OverlayUtility.ContinuePropertyName] = function ()
		return function ( self, element, controller, menu )
			CoD.PrestigeUtility.CreatePermanentUnlockTokenModel( controller )
			GoBackAndUpdateStateOnPreviousMenu( menu, controller )
		end
		
	end
} )
CoD.OverlayUtility.AddSystemOverlay( "PrestigeRefundTokens", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.systemOverlay_Prestige",
	title = Engine.Localize( "MENU_PRESTIGE_USE_REFUND_QUESTION" ),
	description = Engine.Localize( "MENU_PRESTIGE_USE_REFUND_DESC" ),
	supportText = "",
	image = "t7_icons_prestige_mp_refund",
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	listDatasource = function ( controller )
		DataSources.UnlockTokenMenuList = DataSourceHelpers.ListSetup( "UnlockTokenMenuList", function ( controller )
			local list = {}
			local addItemListButton = function ( displayText, action, isDefaultFocus )
				return {
					models = {
						displayText = displayText
					},
					properties = {
						action = action,
						selectIndex = isDefaultFocus
					}
				}
			end
			
			local RefundAction = function ( self, element, controller, actionParam, menu )
				if CheckIfFeatureIsBanned( controller, LuaEnum.FEATURE_BAN.PRESTIGE_EXTRAS ) then
					LuaUtils.UI_ShowErrorMessageDialog( controller, GetFeatureBanInfo( controller, LuaEnum.FEATURE_BAN.PRESTIGE_EXTRAS ) )
					return 
				else
					local loadout = Engine.GetFirstSelectedHeroLoadout( controller, Enum.CACType.CAC_TYPE_MP_PUBLIC )
					Engine.ExecNow( controller, "PrestigeRespec " .. tostring( CoD.PrestigeUtility.GetPrestigeGameMode() ) )
					Engine.ExecNow( controller, "exec gamedata/configs/mp/mp_reset_class_sets.cfg" )
					CoD.PrestigeUtility.ResetToFirstSelectedCharacterLoadout( controller, loadout.characterType, loadout.loadoutSlot )
					CoD.PrestigeUtility.ResetChallengeDatasources( controller )
					SaveLoadout( self, controller )
					Engine.Exec( controller, "uploadstats " .. tostring( CoD.PrestigeUtility.GetPrestigeGameMode() ) )
					Engine.Exec( controller, "savegamerprofilestats" )
					local previousMenu = GoBackAndUpdateStateOnPreviousMenu( menu, controller )
					SetFocusToElement( previousMenu, "RefundButton", controller )
				end
			end
			
			local CancelRefundAction = function ( self, element, controller, actionParam, menu )
				GoBack( menu, controller )
			end
			
			table.insert( list, addItemListButton( Engine.Localize( "MENU_USE_REFUND" ), RefundAction, false ) )
			table.insert( list, addItemListButton( "MENU_CANCEL", CancelRefundAction, true ) )
			return list
		end, true )
		return "UnlockTokenMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
CoD.OverlayUtility.AddSystemOverlay( "PrestigeFreshStart1", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.systemOverlay_Prestige",
	title = Engine.Localize( "MENU_PRESTIGE_FRESH_START_QUESTION" ),
	description = function ()
		return Engine.Localize( CoD.PrestigeUtility.GetStringForMode( "PRESTIGE_FRESH_START_DESC" ) )
	end,
	supportText = "",
	image = "t7_icons_prestige_mp_freshstart",
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	listDatasource = function ( controller )
		DataSources.UnlockTokenMenuList = DataSourceHelpers.ListSetup( "UnlockTokenMenuList", function ( controller )
			local list = {}
			local addItemListButton = function ( displayText, action, isDefaultFocus )
				return {
					models = {
						displayText = displayText
					},
					properties = {
						action = action,
						selectIndex = isDefaultFocus
					}
				}
			end
			
			local NextWarningAction = function ( self, element, controller, actionParam, menu )
				if CheckIfFeatureIsBanned( controller, LuaEnum.FEATURE_BAN.PRESTIGE_EXTRAS ) then
					LuaUtils.UI_ShowErrorMessageDialog( controller, GetFeatureBanInfo( controller, LuaEnum.FEATURE_BAN.PRESTIGE_EXTRAS ) )
					return 
				else
					local previousMenu = GoBack( menu, controller )
					OpenSystemOverlay( self, previousMenu, controller, "PrestigeFreshStart2", nil )
				end
			end
			
			local CancelRefundAction = function ( self, element, controller, actionParam, menu )
				GoBack( menu, controller )
			end
			
			table.insert( list, addItemListButton( Engine.Localize( "MENU_USE_FRESH_START" ), NextWarningAction, false ) )
			table.insert( list, addItemListButton( "MENU_CANCEL", CancelRefundAction, true ) )
			return list
		end, true )
		return "UnlockTokenMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
CoD.OverlayUtility.AddSystemOverlay( "PrestigeFreshStart2", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.systemOverlay_Prestige",
	title = Engine.Localize( "MENU_ARE_YOU_SURE" ),
	description = function ()
		return Engine.Localize( CoD.PrestigeUtility.GetStringForMode( "PRESTIGE_FRESH_START_WARNING" ) )
	end,
	supportText = "",
	image = "t7_icons_prestige_mp_freshstart",
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	listDatasource = function ( controller )
		DataSources.UnlockTokenMenuList = DataSourceHelpers.ListSetup( "UnlockTokenMenuList", function ( controller )
			local list = {}
			local addItemListButton = function ( displayText, action, isDefaultFocus )
				return {
					models = {
						displayText = displayText,
						itemIndex = itemIndex
					},
					properties = {
						action = action,
						selectIndex = isDefaultFocus
					}
				}
			end
			
			local FreshStartAction = function ( self, element, controller, actionParam, menu )
				if CheckIfFeatureIsBanned( controller, LuaEnum.FEATURE_BAN.PRESTIGE_EXTRAS ) then
					LuaUtils.UI_ShowErrorMessageDialog( controller, GetFeatureBanInfo( controller, LuaEnum.FEATURE_BAN.PRESTIGE_EXTRAS ) )
					return 
				elseif CoD.PrestigeUtility.GetPrestigeGameMode() == Enum.eModes.MODE_ZOMBIES then
					CoD.PrestigeUtility.FreshStartActionZM( self, controller, menu )
				else
					CoD.PrestigeUtility.FreshStartActionMP( self, controller, menu )
				end
			end
			
			local CancelRefundAction = function ( self, element, controller, actionParam, menu )
				GoBack( menu, controller )
			end
			
			table.insert( list, addItemListButton( Engine.Localize( "MENU_USE_FRESH_START" ), FreshStartAction, false ) )
			table.insert( list, addItemListButton( "MENU_CANCEL", CancelRefundAction, true ) )
			return list
		end, true )
		return "UnlockTokenMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
CoD.OverlayUtility.AddSystemOverlay( "PermanentUnlockClassItem", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.Prestige_PermanentUnlockConfirmationOverlay",
	title = Engine.Localize( "MENU_CONFIRM_PERMANENT_UNLOCK_CAPS" ),
	description = function ( controller, itemIndex, upgradeItemIndex, weaponVariantEquip )
		local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
		return Engine.Localize( "MPUI_PERMANENT_UNLOCK_ITEM", Engine.GetItemName( itemIndex, mode ) )
	end,
	supportText = function ( controller, itemIndex, upgradeItemIndex, weaponVariantEquip )
		local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
		return Engine.Localize( Engine.GetItemName( itemIndex, mode ) )
	end,
	image = function ( controller, itemIndex, upgradeItemIndex, weaponVariantEquip )
		local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
		local weaponCategory = CoD.perController[controller].weaponCategory
		local appendText = ""
		if weaponCategory == "specialist" then
			return Engine.GetItemImage( itemIndex, CoD.PlayerRoleUtility.customizationMode ) .. "_large"
		elseif weaponCategory and LUI.startswith( weaponCategory, "killstreak" ) then
			appendText = "_menu_large"
		elseif not (not weaponCategory or not LUI.startswith( weaponCategory, "specialty" )) or weaponCategory == "primarygadget" or weaponCategory == "secondarygadget" then
			appendText = "_256"
		end
		return Engine.GetItemImage( itemIndex, mode ) .. appendText
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.Unlock,
	listDatasource = function ( controller, itemIndex, upgradeItemIndex, weaponVariantEquip )
		DataSources.UnlockTokenMenuList = DataSourceHelpers.ListSetup( "UnlockTokenMenuList", function ( controller )
			local list = {}
			local weaponCategory = CoD.perController[controller].weaponCategory
			local addItemListButton = function ( displayText, action, isDefaultFocus )
				return {
					models = {
						displayText = displayText,
						itemIndex = itemIndex
					},
					properties = {
						action = action,
						selectIndex = isDefaultFocus
					}
				}
			end
			
			local PermanentUnlockAction = function ( self, element, controller, actionParam, menu )
				if CheckIfFeatureIsBanned( controller, LuaEnum.FEATURE_BAN.PRESTIGE_EXTRAS ) then
					LuaUtils.UI_ShowErrorMessageDialog( controller, GetFeatureBanInfo( controller, LuaEnum.FEATURE_BAN.PRESTIGE_EXTRAS ) )
					return 
				else
					PermanentlyUnlockItem( menu, element, controller )
					menu:dispatchEventToRoot( {
						name = "used_permanent_unlock_token",
						controller = controller
					} )
					GoBackAndUpdateStateOnPreviousMenu( menu, controller )
				end
			end
			
			local CancelUnlockAction = function ( self, element, controller, actionParam, menu )
				GoBack( menu, controller )
			end
			
			table.insert( list, addItemListButton( "MENU_PERMANENTLY_UNLOCK", PermanentUnlockAction, false ) )
			table.insert( list, addItemListButton( "MENU_CANCEL", CancelUnlockAction, true ) )
			return list
		end, true )
		return "UnlockTokenMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
CoD.OverlayUtility.AddSystemOverlay( "PrestigeMasterNotification", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.systemOverlay_Prestige",
	title = Engine.Localize( "MENU_PRESTIGE_MASTER" ),
	description = function ()
		if CoD.isZombie == true then
			return Engine.Localize( "MENU_ZM_PRESTIGE_MASTER_NOTIFICATION" )
		else
			return Engine.Localize( "MENU_PRESTIGE_MASTER_NOTIFICATION" )
		end
	end,
	supportText = "",
	image = function ( controller )
		local mode = Enum.eModes.MODE_MULTIPLAYER
		if CoD.isZombie == true then
			mode = Enum.eModes.MODE_ZOMBIES
		end
		local rankIconName = Engine.GetRankIcon( 0, Engine.GetPrestigeCap( mode ), mode )
		return GetRankIconLarge( rankIconName )
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	listDatasource = nil,
	[CoD.OverlayUtility.ContinuePropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
