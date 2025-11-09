CoD.PrestigeUtility = {}
CoD.PrestigeUtility.INVALID_PARAGON_ICON_ID = 0
CoD.PrestigeUtility.DEFAULT_PARAGON_ICON_ID = 11
CoD.PrestigeUtility.PRESTIGE_MASTER_MAX_TIERS = 10
CoD.PrestigeUtility.LEADERBOARD_RESET_FILE_MP = "leaderboards/mp_leaderboards_reset.csv"
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

CoD.PrestigeUtility.GetMaxRankByMode = function ( f2_arg0 )
	if f2_arg0 == Enum.eModes.MODE_CAMPAIGN then
		return CoD.maxRankByMode.CP
	elseif f2_arg0 == Enum.eModes.MODE_MULTIPLAYER then
		return CoD.maxRankByMode.MP
	elseif f2_arg0 == Enum.eModes.MODE_ZOMBIES then
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

CoD.PrestigeUtility.GetStringForMode = function ( f4_arg0 )
	if CoD.PrestigeUtility.GetPrestigeGameMode() == Enum.eModes.MODE_ZOMBIES then
		return "MENU_ZM_" .. f4_arg0
	else
		return "MENU_" .. f4_arg0
	end
end

CoD.PrestigeUtility.GetCurrentPLevel = function ( f5_arg0, f5_arg1 )
	if not f5_arg1 then
		f5_arg1 = CoD.PrestigeUtility.GetPrestigeGameMode()
	end
	local f5_local0 = Engine.GetPlayerStats( f5_arg0, CoD.STATS_LOCATION_NORMAL, f5_arg1 )
	return f5_local0.PlayerStatsList.PLEVEL.StatValue:get()
end

CoD.PrestigeUtility.GetBackgroundIdByPLevel = function ( f6_arg0, f6_arg1, f6_arg2 )
	if not f6_arg2 then
		f6_arg2 = CoD.PrestigeUtility.GetPrestigeGameMode()
	end
	if Engine.GetPrestigeCap( f6_arg2 ) < f6_arg1 then
		return 0
	else
		local f6_local0 = Engine.GetBackgroundsForCategoryName( f6_arg0, "prestige" )
		if #f6_local0 < f6_arg1 then
			return 0
		else
			return f6_local0[f6_arg1].id
		end
	end
end

CoD.PrestigeUtility.GetPermanentUnlockMode = function ()
	local f7_local0 = Engine.GetModel( Engine.GetGlobalModel(), "prestigeGameMode" )
	if f7_local0 ~= nil then
		local f7_local1 = Engine.GetModelValue( f7_local0 )
		if f7_local1 ~= nil and f7_local1 ~= Enum.eModes.MODE_INVALID then
			return f7_local1
		end
	end
	return Engine.CurrentSessionMode()
end

CoD.PrestigeUtility.CreatePermanentUnlockTokenModel = function ( f8_arg0 )
	Engine.SetModelValue( Engine.GetModel( Engine.GetModelForController( f8_arg0 ), "permanentUnlockTokensCount" ), Engine.GetPermanentUnlockCount( f8_arg0, CoD.PrestigeUtility.GetPermanentUnlockMode() ) )
end

CoD.PrestigeUtility.IsPrestigeBackground = function ( f9_arg0 )
	local f9_local0 = Engine.GetEmblemBackgroundId()
	local f9_local1 = Engine.GetBackgroundsForCategoryName( f9_arg0, "prestige" )
	local f9_local2 = false
	for f9_local6, f9_local7 in pairs( f9_local1 ) do
		if f9_local7.id == f9_local0 then
			f9_local2 = true
			break
		end
	end
	for f9_local7, f9_local8 in pairs( Engine.GetBackgroundsForCategoryName( f9_arg0, "zmprestige" ) ) do
		if f9_local8.id == f9_local0 then
			f9_local2 = true
			break
		end
	end
	return f9_local2
end

CoD.PrestigeUtility.ResetChallengeDatasources = function ( f10_arg0 )
	CoD.ChallengesUtility.ResetCategoryStats( f10_arg0 )
	CoD.ChallengesUtility.ResetNearCompletion( f10_arg0 )
	if CoD.ChallengesUtility.IsBackgroundLockByChallenge( f10_arg0, CoD.PrestigeUtility.GetPrestigeGameMode() ) or CoD.PrestigeUtility.IsPrestigeBackground( f10_arg0 ) then
		Engine.ExecNow( f10_arg0, "emblemSetRandomDefaultBackground" )
	end
end

CoD.PrestigeUtility.ResetToFirstSelectedCharacterLoadout = function ( f11_arg0, f11_arg1, f11_arg2 )
	if 10 <= f11_arg1 then
		f11_arg1 = 0
	end
	Engine.ExecNow( f11_arg0, "resetMPCharacterLoadout " .. f11_arg1 .. " " .. f11_arg2 )
	Engine.SetHeroForCACType( f11_arg0, Enum.eModes.MODE_MULTIPLAYER, Enum.CACType.CAC_TYPE_MP_PUBLIC, f11_arg1 )
	Engine.SetHeroLoadoutItemForCACType( f11_arg0, Enum.eModes.MODE_MULTIPLAYER, Enum.CACType.CAC_TYPE_MP_PUBLIC, f11_arg1, f11_arg2 )
	Engine.SetFirstTimeComplete( f11_arg0, Enum.eModes.MODE_MULTIPLAYER, true )
end

CoD.PrestigeUtility.EnterPrestigeActionMP = function ( f12_arg0, f12_arg1, f12_arg2 )
	local f12_local0, f12_local1, f12_local2, f12_local3 = nil
	local f12_local4 = Engine.StorageGetBuffer( f12_arg1, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	if f12_local4 then
		f12_local0 = f12_local4.leagueCacLoadouts.herogadget:get()
		f12_local1 = f12_local4.leagueCacLoadouts.heroweapon:get()
		f12_local2 = f12_local4.customMatchCacLoadouts.herogadget:get()
		f12_local3 = f12_local4.customMatchCacLoadouts.heroweapon:get()
	end
	local f12_local5 = Engine.GetFirstSelectedHeroLoadout( f12_arg1, Enum.CACType.CAC_TYPE_MP_PUBLIC )
	local f12_local6 = CoD.PrestigeUtility.GetCurrentPLevel( f12_arg1, Enum.eModes.MODE_MULTIPLAYER )
	LUI.CoDMetrics.PrestigeEvent( f12_arg1, f12_local6, f12_local6 + 1, "mp" )
	Engine.ExecNow( f12_arg1, "exec gamedata/configs/mp/prestige_reset.cfg" )
	Engine.ExecNow( f12_arg1, "PrestigeAddCAC " .. tostring( Enum.eModes.MODE_MULTIPLAYER ) )
	CoD.PrestigeUtility.ResetToFirstSelectedCharacterLoadout( f12_arg1, f12_local5.characterType, f12_local5.loadoutSlot )
	CoD.PrestigeUtility.ResetChallengeDatasources( f12_arg1 )
	local f12_local7 = Engine.StorageGetBuffer( f12_arg1, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if f12_local7 ~= nil then
		f12_local7.validationEvent:set( "pres" )
	end
	local f12_local8 = Engine.StorageGetBuffer( f12_arg1, Enum.StorageFileType.STORAGE_MP_LOADOUTS )
	if f12_local8 and f12_local0 and f12_local1 and f12_local2 and f12_local3 then
		f12_local8.leagueCacLoadouts.herogadget:set( f12_local0 )
		f12_local8.leagueCacLoadouts.heroweapon:set( f12_local1 )
		f12_local8.customMatchCacLoadouts.herogadget:set( f12_local2 )
		f12_local8.customMatchCacLoadouts.heroweapon:set( f12_local3 )
	end
	SaveLoadout( f12_arg0, f12_arg1 )
	Engine.Exec( f12_arg1, "uploadstats " .. tostring( Enum.eModes.MODE_MULTIPLAYER ) )
	Engine.Exec( f12_arg1, "savegamerprofilestats" )
	DataSources.PrestigeStats.getModel( f12_arg1 )
	OpenSystemOverlay( f12_arg0, GoBack( f12_arg2, f12_arg1 ), f12_arg1, "PrestigeFanfare", nil )
end

CoD.PrestigeUtility.SavePermanentlyUnlockedWeaponVariants = function ( f13_arg0, f13_arg1 )
	local f13_local0 = {}
	if f13_arg1 == Enum.eModes.MODE_ZOMBIES then
		local f13_local1 = {}
		local f13_local2 = Engine.StorageGetBuffer( f13_arg0, Enum.StorageFileType.STORAGE_ZM_STATS_ONLINE )
		local f13_local3 = #f13_local2.prestigeTokens
		for f13_local4 = 0, f13_local3 - 1, 1 do
			local f13_local7 = f13_local2.prestigeTokens[f13_local4]
			if f13_local7.itemUnlocked:get() ~= 0 then
				table.insert( f13_local1, {
					itemIndex = f13_local7.itemUnlocked:get()
				} )
			end
		end
		local f13_local4 = Engine.StorageGetBuffer( f13_arg0, Enum.StorageFileType.STORAGE_ZM_LOADOUTS )
		f13_local4 = f13_local4.cacLoadouts
		local f13_local5 = #f13_local4.variant
		for f13_local6 = 0, f13_local5 - 1, 1 do
			local f13_local9 = f13_local4.variant[f13_local6]
			local f13_local10 = nil
			for f13_local14, f13_local15 in ipairs( f13_local1 ) do
				if f13_local15.itemIndex == f13_local9.weaponIndex:get() then
					f13_local10 = f13_local15
				end
			end
			if f13_local10 then
				f13_local10.variantName = f13_local9.variantName:get()
				f13_local10.attachment = {}
				f13_local11 = #f13_local9.attachment
				for f13_local12 = 0, f13_local11 - 1, 1 do
					f13_local10.attachment[f13_local12] = f13_local9.attachment[f13_local12]:get()
				end
				f13_local10.attachmentVariant = {}
				f13_local12 = #f13_local9.attachmentVariant
				for f13_local13 = 0, f13_local12 - 1, 1 do
					f13_local10.attachmentVariant[f13_local13] = f13_local9.attachmentVariant[f13_local13]:get()
				end
				f13_local10.reticleIndex = f13_local9.reticleIndex:get()
				f13_local10.camoIndex = f13_local9.camoIndex:get()
				f13_local10.paintjobSlot = f13_local9.paintjobSlot:get()
				f13_local10.paintjobIndex = f13_local9.paintjobIndex:get()
				f13_local10.weaponIndex = f13_local9.weaponIndex:get()
				f13_local10.variantIndex = f13_local9.variantIndex:get()
				f13_local10.sortIndex = f13_local9.sortIndex:get()
				f13_local10.readOnly = f13_local9.readOnly:get()
				f13_local10.createTime = f13_local9.createTime:get()
				table.insert( f13_local0, f13_local10 )
			end
		end
	end
	return f13_local0
end

CoD.PrestigeUtility.RestorePermanentlyUnlockedWeaponVariants = function ( f14_arg0, f14_arg1, f14_arg2 )
	if f14_arg1 == Enum.eModes.MODE_ZOMBIES then
		local f14_local0 = Engine.StorageGetBuffer( f14_arg0, Enum.StorageFileType.STORAGE_ZM_LOADOUTS )
		f14_local0 = f14_local0.cacLoadouts
		for f14_local10, f14_local11 in ipairs( f14_arg2 ) do
			if not LuaUtils.IsTableEmpty( f14_local11 ) then
				local f14_local4 = f14_local0.variant[f14_local10 - 1]
				f14_local4.variantName:set( f14_local11.variantName )
				local f14_local5 = #f14_local11.attachment
				for f14_local6 = 0, f14_local5 - 1, 1 do
					f14_local4.attachment[f14_local6]:set( f14_local11.attachment[f14_local6] )
				end
				local f14_local6 = #f14_local11.attachmentVariant
				for f14_local7 = 0, f14_local6 - 1, 1 do
					f14_local4.attachmentVariant[f14_local7]:set( f14_local11.attachmentVariant[f14_local7] )
				end
				f14_local4.reticleIndex:set( f14_local11.reticleIndex )
				f14_local4.camoIndex:set( f14_local11.camoIndex )
				f14_local4.paintjobSlot:set( f14_local11.paintjobSlot )
				f14_local4.paintjobIndex:set( f14_local11.paintjobIndex )
				f14_local4.weaponIndex:set( f14_local11.weaponIndex )
				f14_local4.variantIndex:set( f14_local11.variantIndex )
				f14_local4.sortIndex:set( f14_local11.sortIndex )
				f14_local4.readOnly:set( f14_local11.readOnly )
				f14_local4.createTime:set( f14_local11.createTime )
			end
		end
	end
end

CoD.PrestigeUtility.EnterPrestigeActionZM = function ( f15_arg0, f15_arg1, f15_arg2 )
	local f15_local0 = CoD.PrestigeUtility.GetCurrentPLevel( f15_arg1 )
	LUI.CoDMetrics.PrestigeEvent( f15_arg1, f15_local0, f15_local0 + 1, "zm" )
	local f15_local1 = CoD.PrestigeUtility.SavePermanentlyUnlockedWeaponVariants( f15_arg1, Enum.eModes.MODE_ZOMBIES )
	Engine.ExecNow( f15_arg1, "exec gamedata/configs/zm/zm_prestige_reset.cfg" )
	Engine.ExecNow( f15_arg1, "PrestigeAddCAC " .. tostring( Enum.eModes.MODE_ZOMBIES ) )
	CoD.PrestigeUtility.ResetChallengeDatasources( f15_arg1 )
	CoD.PrestigeUtility.RestorePermanentlyUnlockedWeaponVariants( f15_arg1, Enum.eModes.MODE_ZOMBIES, f15_local1 )
	SaveLoadout( f15_arg0, f15_arg1 )
	Engine.Exec( f15_arg1, "uploadstats " .. tostring( Enum.eModes.MODE_ZOMBIES ) )
	Engine.Exec( f15_arg1, "savegamerprofilestats" )
	DataSources.PrestigeStats.getModel( f15_arg1 )
	OpenSystemOverlay( f15_arg0, GoBack( f15_arg2, f15_arg1 ), f15_arg1, "PrestigeFanfare", nil )
end

CoD.PrestigeUtility.FreshStartActionMP = function ( f16_arg0, f16_arg1, f16_arg2 )
	local f16_local0 = Engine.GetFirstSelectedHeroLoadout( f16_arg1, Enum.CACType.CAC_TYPE_MP_PUBLIC )
	local f16_local1 = function ( f17_arg0, f17_arg1 )
		table.insert( f17_arg0, {
			"contracts",
			f17_arg1,
			"active"
		} )
		table.insert( f17_arg0, {
			"contracts",
			f17_arg1,
			"award_given"
		} )
		table.insert( f17_arg0, {
			"contracts",
			f17_arg1,
			"index"
		} )
		table.insert( f17_arg0, {
			"contracts",
			f17_arg1,
			"progress"
		} )
	end
	
	local f16_local2 = function ( f18_arg0, f18_arg1 )
		table.insert( f18_arg0, {
			"consumables",
			f18_arg1,
			"awarded"
		} )
		table.insert( f18_arg0, {
			"consumables",
			f18_arg1,
			"consumed"
		} )
	end
	
	local f16_local3 = {
		{
			"blackMarketShowBreadcrumb"
		},
		{
			"codPointMsgSeen"
		},
		{
			"retailIncentiveMsgSeen"
		},
		{
			"digitalIncentiveMsgSeen"
		},
		{
			"spIncentiveMsgSeen"
		},
		{
			"weaponContractData",
			"currentValue"
		},
		{
			"weaponContractData",
			"matchesPlayed"
		},
		{
			"weaponContractData",
			"startTimestamp"
		},
		{
			"weaponContractData",
			"completeTimestamp"
		},
		{
			"blackjack_contract_count"
		},
		{
			"blackjack_purchase_count"
		},
		{
			"ui_seen_community_contract"
		},
		{
			"ui_community_contract_milestone"
		},
		{
			"ui_seen_new_contracts"
		},
		{
			"lastSeenThermometerValue"
		},
		{
			"TenthSpecialistContract",
			"working_towards_special_card_number"
		},
		{
			"TenthSpecialistContract",
			"special_card_earned"
		},
		{
			"PlayerStatsList",
			"BLACKJACK_CHALLENGE",
			"statValue"
		},
		{
			"PlayerStatsList",
			"BLACKJACK_CHALLENGE",
			"challengeValue"
		},
		{
			"PlayerStatsList",
			"TSCC_CHALLENGE_MASTERY",
			"statValue"
		},
		{
			"PlayerStatsList",
			"TSCC_CHALLENGE_MASTERY",
			"challengeValue"
		},
		{
			"PlayerStatsList",
			"CONTRACT_HUGE_AR_KILLS",
			"statValue"
		},
		{
			"PlayerStatsList",
			"CONTRACT_HUGE_AR_KILLS",
			"challengeValue"
		},
		{
			"PlayerStatsList",
			"CONTRACT_HUGE_LMG_KILLS",
			"statValue"
		},
		{
			"PlayerStatsList",
			"CONTRACT_HUGE_LMG_KILLS",
			"challengeValue"
		},
		{
			"PlayerStatsList",
			"CONTRACT_HUGE_MELEE_WEAPON_KILLS",
			"statValue"
		},
		{
			"PlayerStatsList",
			"CONTRACT_HUGE_MELEE_WEAPON_KILLS",
			"challengeValue"
		},
		{
			"PlayerStatsList",
			"CONTRACT_HUGE_SHOTGUN_KILLS",
			"statValue"
		},
		{
			"PlayerStatsList",
			"CONTRACT_HUGE_SHOTGUN_KILLS",
			"challengeValue"
		},
		{
			"PlayerStatsList",
			"CONTRACT_HUGE_SMG_KILLS",
			"statValue"
		},
		{
			"PlayerStatsList",
			"CONTRACT_HUGE_SMG_KILLS",
			"challengeValue"
		},
		{
			"PlayerStatsList",
			"CONTRACT_HUGE_SNIPER_KILLS",
			"statValue"
		},
		{
			"PlayerStatsList",
			"CONTRACT_HUGE_SNIPER_KILLS",
			"challengeValue"
		},
		{
			"PlayerStatsList",
			"CONTRACT_HUGE_SPECIALIST_WEAPON_KILLS",
			"statValue"
		},
		{
			"PlayerStatsList",
			"CONTRACT_HUGE_SPECIALIST_WEAPON_KILLS",
			"challengeValue"
		},
		{
			"extraBools",
			2
		},
		{
			"PlayerStatsList",
			"ARENA_MAX_RANK",
			"statValue"
		},
		{
			"extraBools",
			3
		},
		{
			"extraBools",
			4
		},
		{
			"extraBytes",
			1
		},
		{
			"extraBools",
			7
		},
		{
			"extraBools",
			8
		},
		{
			"extraBools",
			9
		},
		{
			"extraBools",
			10
		},
		{
			"extraBytes",
			2
		},
		{
			"extraBytes",
			3
		},
		{
			"extraBools",
			11
		},
		{
			"extraBools",
			12
		},
		{
			"extraBools",
			13
		},
		{
			"extraBools",
			14
		},
		[33] = {
			"extraBools",
			15
		}
	}
	for f16_local7, f16_local8 in pairs( LuaUtils.BMContracts ) do
		f16_local1( f16_local3, f16_local8 )
	end
	f16_local4 = {}
	f16_local5 = Engine.GetPlayerStats( f16_arg1, CoD.STATS_LOCATION_NORMAL, CoD.PrestigeUtility.GetPrestigeGameMode() )
	f16_local6 = f16_local5.PlayerStatsList.STATRESETCOUNT.StatValue:get()
	for f16_local7 = 0, #f16_local5.consumables - 1, 1 do
		f16_local2( f16_local3, f16_local7 )
	end
	for f16_local15, f16_local16 in pairs( f16_local3 ) do
		local f16_local13 = f16_local5
		local f16_local14 = ""
		for f16_local10, f16_local11 in pairs( f16_local16 ) do
			f16_local13 = f16_local13[f16_local11]
			f16_local14 = f16_local14 .. f16_local11
		end
		f16_local4[f16_local14] = f16_local13:get()
	end
	Engine.ExecNow( f16_arg1, "PrestigeStatsResetAll " .. tostring( Enum.eModes.MODE_MULTIPLAYER ) )
	Engine.ExecNow( f16_arg1, "resetLeaderboards " .. CoD.PrestigeUtility.LEADERBOARD_RESET_FILE_MP .. " LEADERBOARD_RESET_FAILED" )
	for f16_local15, f16_local16 in pairs( f16_local3 ) do
		local f16_local13 = f16_local5
		local f16_local14 = ""
		for f16_local10, f16_local11 in pairs( f16_local16 ) do
			f16_local13 = f16_local13[f16_local11]
			f16_local14 = f16_local14 .. f16_local11
		end
		f16_local13:set( f16_local4[f16_local14] )
	end
	Engine.ExecNow( f16_arg1, "RemoveLockedCamosMP" )
	Engine.ExecNow( f16_arg1, "RemoveLockedReticlesMP" )
	CoD.PrestigeUtility.ResetToFirstSelectedCharacterLoadout( f16_arg1, f16_local0.characterType, f16_local0.loadoutSlot )
	CoD.PrestigeUtility.ResetChallengeDatasources( f16_arg1 )
	f16_local7 = Engine.StorageGetBuffer( f16_arg1, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
	if f16_local7 ~= nil then
		f16_local7.validationEvent:set( "fresh" )
	end
	f16_local5.PlayerStatsList.STATRESETCOUNT.StatValue:set( f16_local6 + 1 )
	SaveLoadout( f16_arg0, f16_arg1 )
	Engine.Exec( f16_arg1, "uploadstats " .. tostring( Enum.eModes.MODE_MULTIPLAYER ) )
	Engine.Exec( f16_arg1, "savegamerprofilestats" )
	CoD.mpFreshStartPerformed = true
	SetIsInPrestigeMenu( false )
	CloseStartMenu( f16_arg2, f16_arg1 )
end

CoD.PrestigeUtility.FreshStartActionZM = function ( f19_arg0, f19_arg1, f19_arg2 )
	Engine.ExecNow( f19_arg1, "PrestigeStatsResetAll " .. tostring( Enum.eModes.MODE_ZOMBIES ) )
	Engine.ExecNow( f19_arg1, "RemoveLockedCamosZM" )
	Engine.ExecNow( f19_arg1, "RemoveLockedReticlesZM" )
	CoD.PrestigeUtility.ResetChallengeDatasources( f19_arg1 )
	SaveLoadout( f19_arg0, f19_arg1 )
	Engine.Exec( f19_arg1, "uploadstats " .. tostring( Enum.eModes.MODE_ZOMBIES ) )
	Engine.Exec( f19_arg1, "savegamerprofilestats" )
	CoD.zmFreshStartPerformed = true
	SetIsInPrestigeMenu( false )
	CloseStartMenu( f19_arg2, f19_arg1 )
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
CoD.PrestigeUtility.GetContentCategoryData = function ( f20_arg0 )
	if f20_arg0 == CoD.PrestigeUtility.ContentCategory.SPECIALISTS then
		return {
			menuName = "ChooseCharacterLoadout",
			weaponCategory = ""
		}
	elseif f20_arg0 == CoD.PrestigeUtility.ContentCategory.WEAPONS then
		return {
			menuName = "PrimaryWeaponSelect",
			weaponCategory = "primary"
		}
	elseif f20_arg0 == CoD.PrestigeUtility.ContentCategory.LETHAL then
		return {
			menuName = "LethalEquipmentSelect",
			weaponCategory = "primarygadget"
		}
	elseif f20_arg0 == CoD.PrestigeUtility.ContentCategory.TACTICAL then
		return {
			menuName = "TacticalEquipmentSelect",
			weaponCategory = "secondarygadget"
		}
	elseif f20_arg0 == CoD.PrestigeUtility.ContentCategory.PERK1 then
		return {
			menuName = "PerkSelect",
			weaponCategory = "specialty1"
		}
	elseif f20_arg0 == CoD.PrestigeUtility.ContentCategory.PERK2 then
		return {
			menuName = "PerkSelect",
			weaponCategory = "specialty2"
		}
	elseif f20_arg0 == CoD.PrestigeUtility.ContentCategory.PERK3 then
		return {
			menuName = "PerkSelect",
			weaponCategory = "specialty3"
		}
	elseif f20_arg0 == CoD.PrestigeUtility.ContentCategory.WILDCARDS then
		return {
			menuName = "WildcardSelect",
			weaponCategory = "bonuscard1"
		}
	elseif f20_arg0 == CoD.PrestigeUtility.ContentCategory.SCORESTREAKS then
		return {
			menuName = "Scorestreaks",
			weaponCategory = ""
		}
	elseif f20_arg0 == CoD.PrestigeUtility.ContentCategory.GOBBLEGUM then
		return {
			menuName = "BubblegumBuffSelect",
			weaponCategory = ""
		}
	else
		
	end
end

CoD.PrestigeUtility.AddPrestigeChallenges = function ( f21_arg0, f21_arg1, f21_arg2 )
	local f21_local0 = {}
	CoD.PrestigeUtility.AddPrestigeCallingCards( f21_arg0, f21_arg1, f21_local0 )
	for f21_local4, f21_local5 in ipairs( f21_local0 ) do
		table.insert( f21_arg2, {
			challengeRow = 0,
			imageID = f21_local5.models.iconId,
			isLocked = f21_local5.models.isLocked,
			isMastery = false
		} )
	end
end

CoD.PrestigeUtility.AddPrestigeCallingCards = function ( f22_arg0, f22_arg1, f22_arg2 )
	if type( f22_arg2 ) ~= "table" then
		return 
	end
	local f22_local0 = CoD.PrestigeUtility.GetCurrentPLevel( f22_arg0, f22_arg1 )
	local f22_local1 = Engine.GetPrestigeCap( f22_arg1 )
	if f22_arg1 == Enum.eModes.MODE_ZOMBIES then
		if f22_local0 ~= f22_local1 then
			return 
		else
			local f22_local2 = Engine.GetBackgroundsForCategoryName( f22_arg0, "zmprestige" )
			if #f22_local2 == 0 then
				return 
			else
				table.insert( f22_arg2, {
					models = {
						title = GetPrestigeTitleForPLevelAndMode( CoD.ModeToModeString( f22_arg1 ), f22_local1 ),
						description = Engine.Localize( "CLASS_PRESTIGE_MASTER_UNLOCK_DESC" ),
						iconId = f22_local2[1].id,
						maxTier = 0,
						currentTier = 0,
						statPercent = 1,
						statFractionText = "",
						tierStatus = "",
						xp = "",
						percentComplete = 1,
						isLocked = false,
						hideProgress = false
					},
					properties = {
						isPrestige = true
					}
				} )
				return 
			end
		end
	end
	for f22_local2 = 1, f22_local0, 1 do
		local f22_local5 = Engine.Localize( "CLASS_PRESTIGE_UNLOCK_DESC", f22_local2 )
		if f22_local2 == f22_local1 then
			f22_local5 = Engine.Localize( "CLASS_PRESTIGE_MASTER_UNLOCK_DESC" )
		end
		table.insert( f22_arg2, {
			models = {
				title = GetPrestigeTitleForPLevelAndMode( CoD.ModeToModeString( f22_arg1 ), f22_local2 ),
				description = f22_local5,
				iconId = CoD.PrestigeUtility.GetBackgroundIdByPLevel( f22_arg0, f22_local2, f22_arg1 ),
				maxTier = 0,
				currentTier = 0,
				statPercent = 1,
				statFractionText = "",
				tierStatus = "",
				xp = "",
				percentComplete = 1,
				isLocked = false,
				hideProgress = false
			},
			properties = {
				isPrestige = true
			}
		} )
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
CoD.PrestigeUtility.PermanentUnlockCategoryListPrepare = function ( f23_arg0 )
	local f23_local0 = {}
	local f23_local1 = f0_local1
	if CoD.PrestigeUtility.GetPrestigeGameMode() == Enum.eModes.MODE_ZOMBIES then
		f23_local1 = f0_local2
	end
	for f23_local5, f23_local6 in pairs( f23_local1 ) do
		table.insert( f23_local0, {
			models = {
				displayText = f23_local6.displayText,
				description = f23_local6.description,
				image = f23_local6.image,
				action = f23_local6.action,
				param = f23_local6.param
			}
		} )
	end
	return f23_local0
end

DataSources.PermanentUnlockCategoryList = DataSourceHelpers.ListSetup( "PermanentUnlockCategoryList", CoD.PrestigeUtility.PermanentUnlockCategoryListPrepare, true )
CoD.OverlayUtility.AddSystemOverlay( "EnterPrestigeMode", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.systemOverlay_Prestige",
	title = function ( f24_arg0 )
		return Engine.Localize( "MENU_PRESTIGE_ENTER_LEVEL_QUESTION", CoD.PrestigeUtility.GetCurrentPLevel( f24_arg0 ) + 1 )
	end,
	description = function ()
		return Engine.Localize( CoD.PrestigeUtility.GetStringForMode( "PRESTIGE_MODE_DESC_3" ) )
	end,
	supportText = "",
	image = function ( f26_arg0 )
		return GetRankIconLarge( Engine.GetRankIcon( 0, CoD.PrestigeUtility.GetCurrentPLevel( f26_arg0 ) + 1, CoD.PrestigeUtility.GetPrestigeGameMode() ) )
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	listDatasource = function ( f27_arg0 )
		DataSources.UnlockTokenMenuList = DataSourceHelpers.ListSetup( "UnlockTokenMenuList", function ( f28_arg0 )
			local f28_local0 = {}
			local f28_local1 = CoD.PrestigeUtility.GetCurrentPLevel( f28_arg0 ) + 1
			local f28_local2 = function ( f29_arg0, f29_arg1, f29_arg2 )
				return {
					models = {
						displayText = f29_arg0
					},
					properties = {
						action = f29_arg1,
						selectIndex = f29_arg2
					}
				}
			end
			
			local f28_local3 = function ( f30_arg0, f30_arg1, f30_arg2, f30_arg3, f30_arg4 )
				if CheckIfFeatureIsBanned( f30_arg2, LuaEnums.FEATURE_BAN.PRESTIGE ) then
					LuaUtils.UI_ShowErrorMessageDialog( f30_arg2, GetFeatureBanInfo( f30_arg2, LuaEnums.FEATURE_BAN.PRESTIGE ) )
					return 
				elseif CoD.PrestigeUtility.GetPrestigeGameMode() == Enum.eModes.MODE_ZOMBIES then
					CoD.PrestigeUtility.EnterPrestigeActionZM( f30_arg0, f30_arg2, f30_arg4 )
				else
					CoD.PrestigeUtility.EnterPrestigeActionMP( f30_arg0, f30_arg2, f30_arg4 )
				end
			end
			
			local f28_local4 = function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3, f31_arg4 )
				GoBack( f31_arg4, f31_arg2 )
			end
			
			table.insert( f28_local0, f28_local2( Engine.Localize( "MENU_PRESTIGE_ENTER_LEVEL", f28_local1 ), f28_local3, false ) )
			table.insert( f28_local0, f28_local2( "MENU_CANCEL", f28_local4, true ) )
			return f28_local0
		end, true )
		return "UnlockTokenMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
CoD.OverlayUtility.AddSystemOverlay( "PrestigeFanfare", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.systemOverlay_PrestigeFanfare",
	title = function ( f32_arg0 )
		return Engine.Localize( "MPUI_PRESTIGE_N", CoD.PrestigeUtility.GetCurrentPLevel( f32_arg0 ) )
	end,
	description = function ( f33_arg0 )
		return Engine.Localize( "MENU_PRESTIGE_FANFARE_DESC", CoD.PrestigeUtility.GetCurrentPLevel( f33_arg0 ) )
	end,
	image = function ( f34_arg0 )
		return GetRankIconLarge( Engine.GetRankIcon( 0, CoD.PrestigeUtility.GetCurrentPLevel( f34_arg0 ), CoD.PrestigeUtility.GetPrestigeGameMode() ) )
	end,
	backgroundId = function ( f35_arg0 )
		return CoD.PrestigeUtility.GetBackgroundIdByPLevel( f35_arg0, CoD.PrestigeUtility.GetCurrentPLevel( f35_arg0 ) )
	end,
	[CoD.OverlayUtility.ContinuePropertyName] = function ()
		return function ( f37_arg0, f37_arg1, f37_arg2, f37_arg3 )
			CoD.PrestigeUtility.CreatePermanentUnlockTokenModel( f37_arg2 )
			GoBackAndUpdateStateOnPreviousMenu( f37_arg3, f37_arg2 )
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
	listDatasource = function ( f38_arg0 )
		DataSources.UnlockTokenMenuList = DataSourceHelpers.ListSetup( "UnlockTokenMenuList", function ( f39_arg0 )
			local f39_local0 = {}
			local f39_local1 = function ( f40_arg0, f40_arg1, f40_arg2 )
				return {
					models = {
						displayText = f40_arg0
					},
					properties = {
						action = f40_arg1,
						selectIndex = f40_arg2
					}
				}
			end
			
			local f39_local2 = function ( f41_arg0, f41_arg1, f41_arg2, f41_arg3, f41_arg4 )
				if CheckIfFeatureIsBanned( f41_arg2, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) then
					LuaUtils.UI_ShowErrorMessageDialog( f41_arg2, GetFeatureBanInfo( f41_arg2, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) )
					return 
				else
					local f41_local0 = Engine.GetFirstSelectedHeroLoadout( f41_arg2, Enum.CACType.CAC_TYPE_MP_PUBLIC )
					Engine.ExecNow( f41_arg2, "PrestigeRespec " .. tostring( CoD.PrestigeUtility.GetPrestigeGameMode() ) )
					Engine.ExecNow( f41_arg2, "exec gamedata/configs/mp/mp_reset_class_sets.cfg" )
					CoD.PrestigeUtility.ResetToFirstSelectedCharacterLoadout( f41_arg2, f41_local0.characterType, f41_local0.loadoutSlot )
					CoD.PrestigeUtility.ResetChallengeDatasources( f41_arg2 )
					SaveLoadout( f41_arg0, f41_arg2 )
					Engine.Exec( f41_arg2, "uploadstats " .. tostring( CoD.PrestigeUtility.GetPrestigeGameMode() ) )
					Engine.Exec( f41_arg2, "savegamerprofilestats" )
					SetFocusToElement( GoBackAndUpdateStateOnPreviousMenu( f41_arg4, f41_arg2 ), "RefundButton", f41_arg2 )
				end
			end
			
			local f39_local3 = function ( f42_arg0, f42_arg1, f42_arg2, f42_arg3, f42_arg4 )
				GoBack( f42_arg4, f42_arg2 )
			end
			
			table.insert( f39_local0, f39_local1( Engine.Localize( "MENU_USE_REFUND" ), f39_local2, false ) )
			table.insert( f39_local0, f39_local1( "MENU_CANCEL", f39_local3, true ) )
			return f39_local0
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
	listDatasource = function ( f44_arg0 )
		DataSources.UnlockTokenMenuList = DataSourceHelpers.ListSetup( "UnlockTokenMenuList", function ( f45_arg0 )
			local f45_local0 = {}
			local f45_local1 = function ( f46_arg0, f46_arg1, f46_arg2 )
				return {
					models = {
						displayText = f46_arg0
					},
					properties = {
						action = f46_arg1,
						selectIndex = f46_arg2
					}
				}
			end
			
			local f45_local2 = function ( f47_arg0, f47_arg1, f47_arg2, f47_arg3, f47_arg4 )
				if CheckIfFeatureIsBanned( f47_arg2, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) then
					LuaUtils.UI_ShowErrorMessageDialog( f47_arg2, GetFeatureBanInfo( f47_arg2, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) )
					return 
				else
					OpenSystemOverlay( f47_arg0, GoBack( f47_arg4, f47_arg2 ), f47_arg2, "PrestigeFreshStart2", nil )
				end
			end
			
			local f45_local3 = function ( f48_arg0, f48_arg1, f48_arg2, f48_arg3, f48_arg4 )
				GoBack( f48_arg4, f48_arg2 )
			end
			
			table.insert( f45_local0, f45_local1( Engine.Localize( "MENU_USE_FRESH_START" ), f45_local2, false ) )
			table.insert( f45_local0, f45_local1( "MENU_CANCEL", f45_local3, true ) )
			return f45_local0
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
	listDatasource = function ( f50_arg0 )
		DataSources.UnlockTokenMenuList = DataSourceHelpers.ListSetup( "UnlockTokenMenuList", function ( f51_arg0 )
			local f51_local0 = {}
			local f51_local1 = function ( f52_arg0, f52_arg1, f52_arg2 )
				return {
					models = {
						displayText = f52_arg0,
						itemIndex = itemIndex
					},
					properties = {
						action = f52_arg1,
						selectIndex = f52_arg2
					}
				}
			end
			
			local f51_local2 = function ( f53_arg0, f53_arg1, f53_arg2, f53_arg3, f53_arg4 )
				if CheckIfFeatureIsBanned( f53_arg2, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) then
					LuaUtils.UI_ShowErrorMessageDialog( f53_arg2, GetFeatureBanInfo( f53_arg2, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) )
					return 
				elseif CoD.PrestigeUtility.GetPrestigeGameMode() == Enum.eModes.MODE_ZOMBIES then
					CoD.PrestigeUtility.FreshStartActionZM( f53_arg0, f53_arg2, f53_arg4 )
				else
					CoD.PrestigeUtility.FreshStartActionMP( f53_arg0, f53_arg2, f53_arg4 )
				end
			end
			
			local f51_local3 = function ( f54_arg0, f54_arg1, f54_arg2, f54_arg3, f54_arg4 )
				GoBack( f54_arg4, f54_arg2 )
			end
			
			table.insert( f51_local0, f51_local1( Engine.Localize( "MENU_USE_FRESH_START" ), f51_local2, false ) )
			table.insert( f51_local0, f51_local1( "MENU_CANCEL", f51_local3, true ) )
			return f51_local0
		end, true )
		return "UnlockTokenMenuList"
	end,
	[CoD.OverlayUtility.GoBackPropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
CoD.OverlayUtility.AddSystemOverlay( "PermanentUnlockClassItem", {
	menuName = "SystemOverlay_Full",
	frameWidget = "CoD.Prestige_PermanentUnlockConfirmationOverlay",
	title = Engine.Localize( "MENU_CONFIRM_PERMANENT_UNLOCK_CAPS" ),
	description = function ( f55_arg0, f55_arg1, f55_arg2, f55_arg3 )
		return Engine.Localize( "MPUI_PERMANENT_UNLOCK_ITEM", Engine.GetItemName( f55_arg1, CoD.PrestigeUtility.GetPermanentUnlockMode() ) )
	end,
	supportText = function ( f56_arg0, f56_arg1, f56_arg2, f56_arg3 )
		return Engine.Localize( Engine.GetItemName( f56_arg1, CoD.PrestigeUtility.GetPermanentUnlockMode() ) )
	end,
	image = function ( f57_arg0, f57_arg1, f57_arg2, f57_arg3 )
		local f57_local0 = CoD.PrestigeUtility.GetPermanentUnlockMode()
		local f57_local1 = CoD.perController[f57_arg0].weaponCategory
		local f57_local2 = ""
		if f57_local1 == "specialist" then
			return Engine.GetItemImage( f57_arg1, CoD.CCUtility.customizationMode )
		elseif f57_local1 and LUI.startswith( f57_local1, "killstreak" ) then
			f57_local2 = "_menu_large"
		elseif not (not f57_local1 or not LUI.startswith( f57_local1, "specialty" )) or f57_local1 == "primarygadget" or f57_local1 == "secondarygadget" then
			f57_local2 = "_256"
		end
		return Engine.GetItemImage( f57_arg1, f57_local0 ) .. f57_local2
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.Unlock,
	listDatasource = function ( f58_arg0, f58_arg1, f58_arg2, f58_arg3 )
		DataSources.UnlockTokenMenuList = DataSourceHelpers.ListSetup( "UnlockTokenMenuList", function ( f59_arg0 )
			local f59_local0 = {}
			local f59_local1 = CoD.perController[f59_arg0].weaponCategory
			local f59_local2 = function ( f60_arg0, f60_arg1, f60_arg2 )
				return {
					models = {
						displayText = f60_arg0,
						itemIndex = f58_arg1
					},
					properties = {
						action = f60_arg1,
						selectIndex = f60_arg2
					}
				}
			end
			
			local f59_local3 = function ( f61_arg0, f61_arg1, f61_arg2, f61_arg3, f61_arg4 )
				if CheckIfFeatureIsBanned( f61_arg2, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) then
					LuaUtils.UI_ShowErrorMessageDialog( f61_arg2, GetFeatureBanInfo( f61_arg2, LuaEnums.FEATURE_BAN.PRESTIGE_EXTRAS ) )
					return 
				else
					PermanentlyUnlockItem( f61_arg4, f61_arg1, f61_arg2 )
					f61_arg4:dispatchEventToRoot( {
						name = "used_permanent_unlock_token",
						controller = f61_arg2
					} )
					GoBackAndUpdateStateOnPreviousMenu( f61_arg4, f61_arg2 )
				end
			end
			
			local f59_local4 = function ( f62_arg0, f62_arg1, f62_arg2, f62_arg3, f62_arg4 )
				GoBack( f62_arg4, f62_arg2 )
			end
			
			table.insert( f59_local0, f59_local2( "MENU_PERMANENTLY_UNLOCK", f59_local3, false ) )
			table.insert( f59_local0, f59_local2( "MENU_CANCEL", f59_local4, true ) )
			return f59_local0
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
	image = function ( f64_arg0 )
		local f64_local0 = Enum.eModes.MODE_MULTIPLAYER
		if CoD.isZombie == true then
			f64_local0 = Enum.eModes.MODE_ZOMBIES
		end
		return GetRankIconLarge( Engine.GetRankIcon( 0, Engine.GetPrestigeCap( f64_local0 ), f64_local0 ) )
	end,
	categoryType = CoD.OverlayUtility.OverlayTypes.GenericMessage,
	listDatasource = nil,
	[CoD.OverlayUtility.ContinuePropertyName] = CoD.OverlayUtility.DefaultGoBack
} )
