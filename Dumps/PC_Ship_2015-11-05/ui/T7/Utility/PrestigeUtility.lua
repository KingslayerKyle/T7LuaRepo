CoD.PrestigeUtility = {}
CoD.PrestigeUtility.isInPermanentUnlockMenu = false
CoD.PrestigeUtility.previousGameMode = nil
CoD.PrestigeUtility.previousStatsMilestonePath = nil
CoD.PrestigeUtility.GetPrestigeGameMode = function ()
	local f1_local0 = Enum.eModes.MODE_MULTIPLAYER
	local f1_local1 = Engine.GetModel( Engine.GetGlobalModel(), "prestigeGameMode" )
	if f1_local1 == nil then
		return f1_local0
	end
	f1_local0 = Engine.GetModelValue( f1_local1 )
	if f1_local0 == nil or f1_local0 == Enum.eModes.MODE_INVALID then
		f1_local0 = Enum.eModes.MODE_MULTIPLAYER
	end
	return f1_local0
end

CoD.PrestigeUtility.GetPrestigeGameModeString = function ()
	if CoD.PrestigeUtility.GetPrestigeGameMode() == Enum.eModes.MODE_ZOMBIES then
		return "zm"
	else
		return "mp"
	end
end

CoD.PrestigeUtility.GetStringForMode = function ( f3_arg0 )
	if CoD.PrestigeUtility.GetPrestigeGameMode() == Enum.eModes.MODE_ZOMBIES then
		return "MENU_ZM_" .. f3_arg0
	else
		return "MENU_" .. f3_arg0
	end
end

CoD.PrestigeUtility.GetCurrentPLevel = function ( f4_arg0 )
	local f4_local0 = Engine.GetPlayerStats( f4_arg0, CoD.STATS_LOCATION_NORMAL, CoD.PrestigeUtility.GetPrestigeGameMode() )
	return f4_local0.PlayerStatsList.PLEVEL.StatValue:get()
end

CoD.PrestigeUtility.GetBackgroundIdByPLevel = function ( f5_arg0, f5_arg1 )
	if Engine.GetPrestigeCap( CoD.PrestigeUtility.GetPrestigeGameMode() ) < f5_arg1 then
		return 0
	else
		local f5_local0 = Engine.GetBackgroundsForCategoryName( f5_arg0, "prestige" )
		if #f5_local0 < f5_arg1 then
			return 0
		else
			return f5_local0[f5_arg1].id
		end
	end
end

CoD.PrestigeUtility.GetPermanentUnlockMode = function ()
	local f6_local0 = Engine.GetModel( Engine.GetGlobalModel(), "prestigeGameMode" )
	if f6_local0 ~= nil then
		local f6_local1 = Engine.GetModelValue( f6_local0 )
		if f6_local1 ~= nil and f6_local1 ~= Enum.eModes.MODE_INVALID then
			return f6_local1
		end
	end
	return Engine.CurrentSessionMode()
end

CoD.PrestigeUtility.CreatePermanentUnlockTokenModel = function ( f7_arg0 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f7_arg0 ), "permanentUnlockTokensCount" ), Engine.GetPermanentUnlockCount( f7_arg0, CoD.PrestigeUtility.GetPermanentUnlockMode() ) )
end

CoD.PrestigeUtility.ResetChallengeDatasources = function ( f8_arg0 )
	CoD.ChallengesUtility.ResetCategoryStats( f8_arg0 )
	CoD.ChallengesUtility.ResetNearCompletion( f8_arg0 )
	if CoD.ChallengesUtility.IsBackgroundLockByChallenge( f8_arg0, CoD.PrestigeUtility.GetPrestigeGameMode() ) then
		Engine.ExecNow( f8_arg0, "emblemSetRandomDefaultBackground" )
	end
end

CoD.PrestigeUtility.ResetToFirstSelectedCharacterLoadout = function ( f9_arg0, f9_arg1, f9_arg2 )
	Engine.ExecNow( f9_arg0, "resetMPCharacterLoadout " .. f9_arg1 .. " " .. f9_arg2 )
	Engine.SetHeroForCACType( f9_arg0, Enum.eModes.MODE_MULTIPLAYER, Enum.CACType.CAC_TYPE_MP_PUBLIC, f9_arg1 )
	Engine.SetHeroLoadoutItemForCACType( f9_arg0, Enum.eModes.MODE_MULTIPLAYER, Enum.CACType.CAC_TYPE_MP_PUBLIC, f9_arg1, f9_arg2 )
	Engine.SetFirstTimeComplete( f9_arg0, Enum.eModes.MODE_MULTIPLAYER, true )
end

CoD.PrestigeUtility.EnterPrestigeActionMP = function ( f10_arg0, f10_arg1, f10_arg2 )
	local f10_local0 = Engine.GetFirstSelectedHeroLoadout( f10_arg1, Enum.CACType.CAC_TYPE_MP_PUBLIC )
	local f10_local1 = CoD.PrestigeUtility.GetCurrentPLevel( f10_arg1 )
	LUI.CoDMetrics.PrestigeEvent( f10_arg1, f10_local1, f10_local1 + 1, "mp" )
	Engine.ExecNow( f10_arg1, "exec gamedata/configs/mp/prestige_reset.cfg" )
	Engine.ExecNow( f10_arg1, "PrestigeAddCAC " .. tostring( Enum.eModes.MODE_MULTIPLAYER ) )
	CoD.PrestigeUtility.ResetToFirstSelectedCharacterLoadout( f10_arg1, f10_local0.characterType, f10_local0.loadoutSlot )
	CoD.PrestigeUtility.ResetChallengeDatasources( f10_arg1 )
	local f10_local2 = Engine.StorageGetBuffer( f10_arg1, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if f10_local2 ~= nil then
		f10_local2.validationEvent:set( "pres" )
	end
	SaveLoadout( f10_arg0, f10_arg1 )
	Engine.Exec( f10_arg1, "uploadstats " .. tostring( Enum.eModes.MODE_MULTIPLAYER ) )
	Engine.Exec( f10_arg1, "savegamerprofilestats" )
	DataSources.PrestigeStats.getModel( f10_arg1 )
	OpenSystemOverlay( f10_arg0, GoBack( f10_arg2, f10_arg1 ), f10_arg1, "PrestigeFanfare", nil )
end

CoD.PrestigeUtility.EnterPrestigeActionZM = function ( f11_arg0, f11_arg1, f11_arg2 )
	local f11_local0 = CoD.PrestigeUtility.GetCurrentPLevel( f11_arg1 )
	LUI.CoDMetrics.PrestigeEvent( f11_arg1, f11_local0, f11_local0 + 1, "zm" )
	Engine.ExecNow( f11_arg1, "exec gamedata/configs/zm/zm_prestige_reset.cfg" )
	Engine.ExecNow( f11_arg1, "PrestigeAddCAC " .. tostring( Enum.eModes.MODE_ZOMBIES ) )
	CoD.PrestigeUtility.ResetChallengeDatasources( f11_arg1 )
	SaveLoadout( f11_arg0, f11_arg1 )
	Engine.Exec( f11_arg1, "uploadstats " .. tostring( Enum.eModes.MODE_ZOMBIES ) )
	Engine.Exec( f11_arg1, "savegamerprofilestats" )
	DataSources.PrestigeStats.getModel( f11_arg1 )
	OpenSystemOverlay( f11_arg0, GoBack( f11_arg2, f11_arg1 ), f11_arg1, "PrestigeFanfare", nil )
end

CoD.PrestigeUtility.FreshStartActionMP = function ( f12_arg0, f12_arg1, f12_arg2 )
	local f12_local0 = Engine.GetFirstSelectedHeroLoadout( f12_arg1, Enum.CACType.CAC_TYPE_MP_PUBLIC )
	local f12_local1 = Engine.GetPlayerStats( f12_arg1, CoD.STATS_LOCATION_NORMAL, CoD.PrestigeUtility.GetPrestigeGameMode() )
	local f12_local2 = f12_local1.PlayerStatsList.STATRESETCOUNT.StatValue:get()
	Engine.ExecNow( f12_arg1, "PrestigeStatsResetAll " .. tostring( Enum.eModes.MODE_MULTIPLAYER ) )
	CoD.PrestigeUtility.ResetToFirstSelectedCharacterLoadout( f12_arg1, f12_local0.characterType, f12_local0.loadoutSlot )
	CoD.PrestigeUtility.ResetChallengeDatasources( f12_arg1 )
	local f12_local3 = Engine.StorageGetBuffer( f12_arg1, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if f12_local3 ~= nil then
		f12_local3.validationEvent:set( "fresh" )
	end
	f12_local1.PlayerStatsList.STATRESETCOUNT.StatValue:set( f12_local2 + 1 )
	SaveLoadout( f12_arg0, f12_arg1 )
	Engine.Exec( f12_arg1, "uploadstats " .. tostring( Enum.eModes.MODE_MULTIPLAYER ) )
	Engine.Exec( f12_arg1, "savegamerprofilestats" )
	SetIsInPrestigeMenu( false )
	CloseStartMenu( f12_arg2, f12_arg1 )
end

CoD.PrestigeUtility.FreshStartActionZM = function ( f13_arg0, f13_arg1, f13_arg2 )
	Engine.ExecNow( f13_arg1, "PrestigeStatsResetAll " .. tostring( Enum.eModes.MODE_ZOMBIES ) )
	CoD.PrestigeUtility.ResetChallengeDatasources( f13_arg1 )
	SaveLoadout( f13_arg0, f13_arg1 )
	Engine.Exec( f13_arg1, "uploadstats " .. tostring( Enum.eModes.MODE_ZOMBIES ) )
	Engine.Exec( f13_arg1, "savegamerprofilestats" )
	SetIsInPrestigeMenu( false )
	CloseStartMenu( f13_arg2, f13_arg1 )
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
CoD.PrestigeUtility.GetContentCategoryData = function ( f14_arg0 )
	if f14_arg0 == CoD.PrestigeUtility.ContentCategory.SPECIALISTS then
		return {
			menuName = "ChooseCharacterLoadout",
			weaponCategory = ""
		}
	elseif f14_arg0 == CoD.PrestigeUtility.ContentCategory.WEAPONS then
		return {
			menuName = "PrimaryWeaponSelect",
			weaponCategory = "primary"
		}
	elseif f14_arg0 == CoD.PrestigeUtility.ContentCategory.LETHAL then
		return {
			menuName = "LethalEquipmentSelect",
			weaponCategory = "primarygadget"
		}
	elseif f14_arg0 == CoD.PrestigeUtility.ContentCategory.TACTICAL then
		return {
			menuName = "TacticalEquipmentSelect",
			weaponCategory = "secondarygadget"
		}
	elseif f14_arg0 == CoD.PrestigeUtility.ContentCategory.PERK1 then
		return {
			menuName = "PerkSelect",
			weaponCategory = "specialty1"
		}
	elseif f14_arg0 == CoD.PrestigeUtility.ContentCategory.PERK2 then
		return {
			menuName = "PerkSelect",
			weaponCategory = "specialty2"
		}
	elseif f14_arg0 == CoD.PrestigeUtility.ContentCategory.PERK3 then
		return {
			menuName = "PerkSelect",
			weaponCategory = "specialty3"
		}
	elseif f14_arg0 == CoD.PrestigeUtility.ContentCategory.WILDCARDS then
		return {
			menuName = "WildcardSelect",
			weaponCategory = "bonuscard1"
		}
	elseif f14_arg0 == CoD.PrestigeUtility.ContentCategory.SCORESTREAKS then
		return {
			menuName = "Scorestreaks",
			weaponCategory = ""
		}
	elseif f14_arg0 == CoD.PrestigeUtility.ContentCategory.GOBBLEGUM then
		return {
			menuName = "BubblegumBuffSelect",
			weaponCategory = ""
		}
	else
		
	end
end

local f0_local0 = {
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
		action = OpenPermanentUnlockCategoryMenu,
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
local f0_local1 = {
	f0_local0.SPECIALISTS,
	f0_local0.WEAPONS,
	f0_local0.LETHAL,
	f0_local0.TACTICAL,
	f0_local0.PERK1,
	f0_local0.PERK2,
	f0_local0.PERK3,
	f0_local0.WILDCARDS,
	f0_local0.SCORESTREAKS
}
local f0_local2 = {
	f0_local0.WEAPONS,
	f0_local0.GOBBLEGUM
}
DataSources.PermanentUnlockCategoryList = DataSourceHelpers.ListSetup( "PermanentUnlockCategoryList", function ( f15_arg0 )
	local f15_local0 = {}
	local f15_local1 = f0_local1
	if CoD.PrestigeUtility.GetPrestigeGameMode() == Enum.eModes.MODE_ZOMBIES then
		f15_local1 = f0_local2
	end
	for f15_local5, f15_local6 in pairs( f15_local1 ) do
		table.insert( f15_local0, {
			models = {
				displayText = f15_local6.displayText,
				description = f15_local6.description,
				image = f15_local6.image,
				action = f15_local6.action,
				param = f15_local6.param
			}
		} )
	end
	return f15_local0
end, true )
CoD.OverlayUtility.AddSystemOverlay( "EnterPrestigeMode", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.systemOverlay_Prestige",
	title = function ( f16_arg0 )
		return Engine.Localize( "MENU_PRESTIGE_ENTER_LEVEL_QUESTION", CoD.PrestigeUtility.GetCurrentPLevel( f16_arg0 ) + 1 )
	end,
	description = function ()
		return Engine.Localize( CoD.PrestigeUtility.GetStringForMode( "PRESTIGE_MODE_DESC_3" ) )
	end,
	supportText = "",
	image = function ( f18_arg0 )
		return GetRankIconLarge( Engine.GetRankIcon( 0, CoD.PrestigeUtility.GetCurrentPLevel( f18_arg0 ) + 1, CoD.PrestigeUtility.GetPrestigeGameMode() ) )
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	listDatasource = function ( f19_arg0 )
		DataSources.UnlockTokenMenuList = DataSourceHelpers.ListSetup( "UnlockTokenMenuList", function ( f20_arg0 )
			local f20_local0 = {}
			local f20_local1 = CoD.PrestigeUtility.GetCurrentPLevel( f20_arg0 ) + 1
			local f20_local2 = function ( f21_arg0, f21_arg1, f21_arg2 )
				return {
					models = {
						displayText = f21_arg0,
						itemIndex = itemIndex
					},
					properties = {
						action = f21_arg1,
						selectIndex = f21_arg2
					}
				}
			end
			
			local f20_local3 = function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3, f22_arg4 )
				if CheckIfFeatureIsBanned( f22_arg2, LuaEnums.FEATURE_BAN.PRESTIGE ) then
					LuaUtils.UI_ShowErrorMessageDialog( f22_arg2, GetFeatureBanInfo( f22_arg2, LuaEnums.FEATURE_BAN.PRESTIGE ) )
					return 
				elseif CoD.PrestigeUtility.GetPrestigeGameMode() == Enum.eModes.MODE_ZOMBIES then
					CoD.PrestigeUtility.EnterPrestigeActionZM( f22_arg0, f22_arg2, f22_arg4 )
				else
					CoD.PrestigeUtility.EnterPrestigeActionMP( f22_arg0, f22_arg2, f22_arg4 )
				end
			end
			
			local f20_local4 = function ( f23_arg0, f23_arg1, f23_arg2, f23_arg3, f23_arg4 )
				GoBack( f23_arg4, f23_arg2 )
			end
			
			table.insert( f20_local0, f20_local2( Engine.Localize( "MENU_PRESTIGE_ENTER_LEVEL", f20_local1 ), f20_local3, false ) )
			table.insert( f20_local0, f20_local2( "MENU_CANCEL", f20_local4, true ) )
			return f20_local0
		end, true )
		return "UnlockTokenMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
CoD.OverlayUtility.AddSystemOverlay( "PrestigeFanfare", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.systemOverlay_PrestigeFanfare",
	title = function ( f24_arg0 )
		return Engine.Localize( "MPUI_PRESTIGE_N", CoD.PrestigeUtility.GetCurrentPLevel( f24_arg0 ) )
	end,
	description = function ( f25_arg0 )
		return Engine.Localize( "MENU_PRESTIGE_FANFARE_DESC", CoD.PrestigeUtility.GetCurrentPLevel( f25_arg0 ) )
	end,
	image = function ( f26_arg0 )
		return GetRankIconLarge( Engine.GetRankIcon( 0, CoD.PrestigeUtility.GetCurrentPLevel( f26_arg0 ), CoD.PrestigeUtility.GetPrestigeGameMode() ) )
	end,
	backgroundId = function ( f27_arg0 )
		return CoD.PrestigeUtility.GetBackgroundIdByPLevel( f27_arg0, CoD.PrestigeUtility.GetCurrentPLevel( f27_arg0 ) )
	end,
	[CoD.OverlayUtility.ContinuePropertyName] = function ()
		return function ( f29_arg0, f29_arg1, f29_arg2, f29_arg3 )
			CoD.PrestigeUtility.CreatePermanentUnlockTokenModel( f29_arg2 )
			GoBackAndUpdateStateOnPreviousMenu( f29_arg3, f29_arg2 )
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
	listDatasource = function ( f30_arg0 )
		DataSources.UnlockTokenMenuList = DataSourceHelpers.ListSetup( "UnlockTokenMenuList", function ( f31_arg0 )
			local f31_local0 = {}
			local f31_local1 = function ( f32_arg0, f32_arg1, f32_arg2 )
				return {
					models = {
						displayText = f32_arg0,
						itemIndex = itemIndex
					},
					properties = {
						action = f32_arg1,
						selectIndex = f32_arg2
					}
				}
			end
			
			local f31_local2 = function ( f33_arg0, f33_arg1, f33_arg2, f33_arg3, f33_arg4 )
				if CheckIfFeatureIsBanned( f33_arg2, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) then
					LuaUtils.UI_ShowErrorMessageDialog( f33_arg2, GetFeatureBanInfo( f33_arg2, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) )
					return 
				else
					local f33_local0 = Engine.GetFirstSelectedHeroLoadout( f33_arg2, Enum.CACType.CAC_TYPE_MP_PUBLIC )
					Engine.ExecNow( f33_arg2, "PrestigeRespec " .. tostring( CoD.PrestigeUtility.GetPrestigeGameMode() ) )
					CoD.PrestigeUtility.ResetToFirstSelectedCharacterLoadout( f33_arg2, f33_local0.characterType, f33_local0.loadoutSlot )
					CoD.PrestigeUtility.ResetChallengeDatasources( f33_arg2 )
					SaveLoadout( f33_arg0, f33_arg2 )
					Engine.Exec( f33_arg2, "uploadstats " .. tostring( CoD.PrestigeUtility.GetPrestigeGameMode() ) )
					Engine.Exec( f33_arg2, "savegamerprofilestats" )
					SetFocusToElement( GoBackAndUpdateStateOnPreviousMenu( f33_arg4, f33_arg2 ), "RefundButton", f33_arg2 )
				end
			end
			
			local f31_local3 = function ( f34_arg0, f34_arg1, f34_arg2, f34_arg3, f34_arg4 )
				GoBack( f34_arg4, f34_arg2 )
			end
			
			table.insert( f31_local0, f31_local1( Engine.Localize( "MENU_USE_REFUND" ), f31_local2, false ) )
			table.insert( f31_local0, f31_local1( "MENU_CANCEL", f31_local3, true ) )
			return f31_local0
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
	listDatasource = function ( f36_arg0 )
		DataSources.UnlockTokenMenuList = DataSourceHelpers.ListSetup( "UnlockTokenMenuList", function ( f37_arg0 )
			local f37_local0 = {}
			local f37_local1 = function ( f38_arg0, f38_arg1, f38_arg2 )
				return {
					models = {
						displayText = f38_arg0,
						itemIndex = itemIndex
					},
					properties = {
						action = f38_arg1,
						selectIndex = f38_arg2
					}
				}
			end
			
			local f37_local2 = function ( f39_arg0, f39_arg1, f39_arg2, f39_arg3, f39_arg4 )
				if CheckIfFeatureIsBanned( f39_arg2, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) then
					LuaUtils.UI_ShowErrorMessageDialog( f39_arg2, GetFeatureBanInfo( f39_arg2, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) )
					return 
				else
					OpenSystemOverlay( f39_arg0, GoBack( f39_arg4, f39_arg2 ), f39_arg2, "PrestigeFreshStart2", nil )
				end
			end
			
			local f37_local3 = function ( f40_arg0, f40_arg1, f40_arg2, f40_arg3, f40_arg4 )
				GoBack( f40_arg4, f40_arg2 )
			end
			
			table.insert( f37_local0, f37_local1( Engine.Localize( "MENU_USE_FRESH_START" ), f37_local2, false ) )
			table.insert( f37_local0, f37_local1( "MENU_CANCEL", f37_local3, true ) )
			return f37_local0
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
	listDatasource = function ( f42_arg0 )
		DataSources.UnlockTokenMenuList = DataSourceHelpers.ListSetup( "UnlockTokenMenuList", function ( f43_arg0 )
			local f43_local0 = {}
			local f43_local1 = function ( f44_arg0, f44_arg1, f44_arg2 )
				return {
					models = {
						displayText = f44_arg0,
						itemIndex = itemIndex
					},
					properties = {
						action = f44_arg1,
						selectIndex = f44_arg2
					}
				}
			end
			
			local f43_local2 = function ( f45_arg0, f45_arg1, f45_arg2, f45_arg3, f45_arg4 )
				if CheckIfFeatureIsBanned( f45_arg2, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) then
					LuaUtils.UI_ShowErrorMessageDialog( f45_arg2, GetFeatureBanInfo( f45_arg2, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) )
					return 
				elseif CoD.PrestigeUtility.GetPrestigeGameMode() == Enum.eModes.MODE_ZOMBIES then
					CoD.PrestigeUtility.FreshStartActionZM( f45_arg0, f45_arg2, f45_arg4 )
				else
					CoD.PrestigeUtility.FreshStartActionMP( f45_arg0, f45_arg2, f45_arg4 )
				end
			end
			
			local f43_local3 = function ( f46_arg0, f46_arg1, f46_arg2, f46_arg3, f46_arg4 )
				GoBack( f46_arg4, f46_arg2 )
			end
			
			table.insert( f43_local0, f43_local1( Engine.Localize( "MENU_USE_FRESH_START" ), f43_local2, false ) )
			table.insert( f43_local0, f43_local1( "MENU_CANCEL", f43_local3, true ) )
			return f43_local0
		end, true )
		return "UnlockTokenMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
CoD.OverlayUtility.AddSystemOverlay( "PermanentUnlockClassItem", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.Prestige_PermanentUnlockConfirmationOverlay",
	title = Engine.Localize( "MENU_CONFIRM_PERMANENT_UNLOCK_CAPS" ),
	description = function ( f47_arg0, f47_arg1, f47_arg2, f47_arg3 )
		return Engine.Localize( "MPUI_PERMANENT_UNLOCK_ITEM", Engine.GetItemName( f47_arg1, CoD.PrestigeUtility.GetPermanentUnlockMode() ) )
	end,
	supportText = function ( f48_arg0, f48_arg1, f48_arg2, f48_arg3 )
		return Engine.Localize( Engine.GetItemName( f48_arg1, CoD.PrestigeUtility.GetPermanentUnlockMode() ) )
	end,
	image = function ( f49_arg0, f49_arg1, f49_arg2, f49_arg3 )
		local f49_local0 = CoD.PrestigeUtility.GetPermanentUnlockMode()
		local f49_local1 = CoD.perController[f49_arg0].weaponCategory
		local f49_local2 = ""
		if f49_local1 == "specialist" then
			return Engine.GetItemImage( f49_arg1, CoD.CCUtility.customizationMode ) .. "_large"
		elseif f49_local1 and LUI.startswith( f49_local1, "killstreak" ) then
			f49_local2 = "_menu_large"
		elseif not (not f49_local1 or not LUI.startswith( f49_local1, "specialty" )) or f49_local1 == "primarygadget" or f49_local1 == "secondarygadget" then
			f49_local2 = "_256"
		end
		return Engine.GetItemImage( f49_arg1, f49_local0 ) .. f49_local2
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.Unlock,
	listDatasource = function ( f50_arg0, f50_arg1, f50_arg2, f50_arg3 )
		DataSources.UnlockTokenMenuList = DataSourceHelpers.ListSetup( "UnlockTokenMenuList", function ( f51_arg0 )
			local f51_local0 = {}
			local f51_local1 = CoD.perController[f51_arg0].weaponCategory
			local f51_local2 = function ( f52_arg0, f52_arg1, f52_arg2 )
				return {
					models = {
						displayText = f52_arg0,
						itemIndex = f50_arg1
					},
					properties = {
						action = f52_arg1,
						selectIndex = f52_arg2
					}
				}
			end
			
			local f51_local3 = function ( f53_arg0, f53_arg1, f53_arg2, f53_arg3, f53_arg4 )
				if CheckIfFeatureIsBanned( f53_arg2, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) then
					LuaUtils.UI_ShowErrorMessageDialog( f53_arg2, GetFeatureBanInfo( f53_arg2, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) )
					return 
				else
					PermanentlyUnlockItem( f53_arg4, f53_arg1, f53_arg2 )
					f53_arg4:dispatchEventToRoot( {
						name = "used_permanent_unlock_token",
						controller = f53_arg2
					} )
					GoBackAndUpdateStateOnPreviousMenu( f53_arg4, f53_arg2 )
				end
			end
			
			local f51_local4 = function ( f54_arg0, f54_arg1, f54_arg2, f54_arg3, f54_arg4 )
				GoBack( f54_arg4, f54_arg2 )
			end
			
			table.insert( f51_local0, f51_local2( "MENU_PERMANENTLY_UNLOCK", f51_local3, false ) )
			table.insert( f51_local0, f51_local2( "MENU_CANCEL", f51_local4, true ) )
			return f51_local0
		end, true )
		return "UnlockTokenMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
CoD.OverlayUtility.AddSystemOverlay( "PrestigeMasterNotification", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.systemOverlay_Prestige",
	title = Engine.Localize( "MENU_PRESTIGE_MASTER" ),
	description = Engine.Localize( "MENU_PRESTIGE_MASTER_NOTIFICATION" ),
	supportText = "",
	image = function ( f55_arg0 )
		return GetRankIconLarge( Engine.GetRankIcon( 0, Engine.GetPrestigeCap( CoD.PrestigeUtility.GetPrestigeGameMode() ), CoD.PrestigeUtility.GetPrestigeGameMode() ) )
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	listDatasource = nil,
	[CoD.OverlayUtility.ContinuePropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
