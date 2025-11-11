CoD.ChallengesUtility = {}
CoD.ChallengesUtility.NearCompletionMaxNumChallengesShown = 10
CoD.ChallengesUtility.NearCompletionLists = {}
CoD.ChallengesUtility.GameModeIcons = {}
CoD.ChallengesUtility.GameModeIcons.CP = "uie_t7_menu_frontend_iconmodecp"
CoD.ChallengesUtility.GameModeIcons.MP = "uie_t7_menu_frontend_iconmodemp"
CoD.ChallengesUtility.GameModeIcons.ZM = "uie_t7_menu_frontend_iconmodezm"
CoD.ChallengesUtility.IndexCol = 0
CoD.ChallengesUtility.TierIdCol = 1
CoD.ChallengesUtility.TargetValCol = 2
CoD.ChallengesUtility.StatTypeCol = 3
CoD.ChallengesUtility.StatsNameCol = 4
CoD.ChallengesUtility.NameStringCol = 5
CoD.ChallengesUtility.XpEarnedCol = 6
CoD.ChallengesUtility.ChallengeStatNameCol = 10
CoD.ChallengesUtility.UnlockRankCol = 11
CoD.ChallengesUtility.UnlockPLevelCol = 14
CoD.ChallengesUtility.CategoryCol = 16
CoD.ChallengesUtility.IsMasteryCol = 18
CoD.ChallengesUtility.VialsEarnedCol = 24
CoD.ChallengesUtility.ChallengeCategoryTable = {
	cp = {},
	mp = {
		operations = {
			"bootcamp",
			"killer",
			"humiliation",
			"career",
			"gamevictories",
			"gameheroics"
		},
		specialist = {
			"weapons",
			"abilities",
			"killjoys"
		},
		scorestreaks = {
			"airassault",
			"groundassault",
			"support",
			"returnfire"
		},
		prestige = {
			"combathandling",
			"combatefficiency",
			"perks1",
			"perks2",
			"perks3",
			"lethals",
			"tacticals",
			"wildcards"
		}
	},
	zm = {}
}
CoD.ChallengesUtility.ChallengeCategoryValues = {
	[Enum.eModes.MODE_CAMPAIGN] = {
		missions = 0,
		tott = 1,
		career = 2
	},
	[Enum.eModes.MODE_MULTIPLAYER] = {
		bootcamp = 0,
		killer = 1,
		humiliation = 2,
		career = 3,
		gamevictories = 4,
		gameheroics = 5,
		darkops = 6,
		weapons = 7,
		abilities = 8,
		killjoys = 9,
		airassault = 10,
		groundassault = 11,
		support = 12,
		returnfire = 13,
		combathandling = 14,
		combatefficiency = 15,
		perks1 = 16,
		perks2 = 17,
		perks3 = 18,
		lethals = 19,
		tacticals = 20,
		wildcards = 21
	},
	[Enum.eModes.MODE_ZOMBIES] = {
		zombiehunter = 0,
		survivalist = 1,
		gumgobbler = 2,
		darkops = 3
	}
}
CoD.ChallengesUtility.AnimatedCallingCards = {
	t7_callingcard_zm_hunter_master = "CallingCards_ZMHunterWidget"
}
CoD.ChallengesUtility.IsLegendaryCallingCard = function ( backgroundID )
	return CoD.BlackMarketUtility.GetRarityTypeForLootItemFromName( backgroundID ) == "legendary"
end

CoD.ChallengesUtility.SetCallingCardForWidget = function ( element, backgroundID, menuID )
	if CoD[backgroundID] and CoD[backgroundID].new and menuID ~= "Menu.PersonalDataVaultMenu" then
		element:changeFrameWidget( CoD[backgroundID] )
	else
		if Engine.IsInGame() and (CoD.isCampaign or CoD.isZombie) then
			local imageCol = 3
			local masterImageCol = 11
			local masterImage = Engine.TableLookup( CoD.backgroundsTable, masterImageCol, imageCol, backgroundID )
			if masterImage and masterImage ~= "" then
				backgroundID = masterImage
			end
		end
		if CoD.ChallengesUtility.IsLegendaryCallingCard( backgroundID ) then
			element:changeFrameWidget( CoD.CallingCards_LegendaryImage )
		else
			element:changeFrameWidget( CoD.CallingCards_BasicImage )
		end
		element.framedWidget.CardIcon:setImage( RegisterImage( backgroundID ) )
	end
end

CoD.ChallengesUtility.IsBackgroundLockByChallenge = function ( controller, mode )
	local currentBackgroundId = Engine.GetEmblemBackgroundId()
	local challengeInfo = Engine.GetChallengeInfoByEmblemOrBackingId( controller, currentBackgroundId, 1, mode )
	if not challengeInfo then
		return false
	else
		return challengeInfo[1].isLocked
	end
end

CoD.ChallengesUtility.ResetCategoryStats = function ( controller )
	DataSources.ChallengesCPCategoryStats.init( controller )
	DataSources.ChallengesMPCategoryStats.init( controller )
	DataSources.ChallengesZMCategoryStats.init( controller )
end

CoD.ChallengesUtility.ResetNearCompletion = function ( controller )
	for tableIndex, modeTable in pairs( CoD.ChallengesUtility.NearCompletionLists ) do
		for challengeIndex, _ in pairs( modeTable ) do
			modeTable[challengeIndex] = nil
		end
		CoD.ChallengesUtility.NearCompletionLists[tableIndex] = nil
	end
	DataSources.ChallengesCPNearCompletion.init( controller )
	DataSources.ChallengesMPNearCompletion.init( controller )
	DataSources.ChallengesZMNearCompletion.init( controller )
end

CoD.ChallengesUtility.GetGameModeInfo = function ()
	local challengeGameModeModel = Engine.GetModel( Engine.GetGlobalModel(), "challengeGameMode" )
	if not challengeGameModeModel then
		return nil
	end
	local challengeGameMode = Engine.GetModelValue( challengeGameModeModel )
	if challengeGameMode ~= "cp" and challengeGameMode ~= "mp" and challengeGameMode ~= "zm" then
		return nil
	end
	local gameModeInfo = {
		name = challengeGameMode,
		index = Enum.eModes.MODE_INVALID
	}
	if challengeGameMode == "cp" then
		gameModeInfo.index = Enum.eModes.MODE_CAMPAIGN
	elseif challengeGameMode == "mp" then
		gameModeInfo.index = Enum.eModes.MODE_MULTIPLAYER
	elseif challengeGameMode == "zm" then
		gameModeInfo.index = Enum.eModes.MODE_ZOMBIES
	end
	return gameModeInfo
end

CoD.ChallengesUtility.GetLocalizedNameAndDescriptionForChallengeInfo = function ( challengeInfo )
	local gameModeName = "mp"
	if challengeInfo.mode == Enum.eModes.MODE_CAMPAIGN then
		gameModeName = "cp"
	elseif challengeInfo.mode == Enum.eModes.MODE_ZOMBIES then
		gameModeName = "zm"
	end
	local tableName = "gamedata/stats/" .. gameModeName .. "/statsmilestones" .. challengeInfo.tableNum + 1 .. ".csv"
	local nameStringRef = Engine.TableLookupGetColumnValueForRow( tableName, challengeInfo.challengeRow, CoD.ChallengesUtility.NameStringCol )
	local descStringRef = nameStringRef .. "_DESC"
	local itemName = ""
	if challengeInfo.challengeType == Enum.statsMilestoneTypes_t.MILESTONE_WEAPON then
		itemName = Engine.Localize( Engine.GetItemName( challengeInfo.itemIndex, challengeInfo.mode ) )
	elseif challengeInfo.challengeType == Enum.statsMilestoneTypes_t.MILESTONE_GROUP then
		itemName = Engine.Localize( "CHALLENGE_TYPE_" .. Engine.GetItemGroupByIndex( challengeInfo.itemIndex ) )
	elseif challengeInfo.challengeType == Enum.statsMilestoneTypes_t.MILESTONE_ATTACHMENTS then
		itemName = Engine.Localize( Engine.GetAttachmentNameByIndex( challengeInfo.itemIndex ) )
	elseif challengeInfo.challengeType == Enum.statsMilestoneTypes_t.MILESTONE_GAMEMODE then
		itemName = Engine.Localize( "CHALLENGE_TYPE_" .. Engine.GetGametypeName( challengeInfo.itemIndex ) )
	end
	local localizedTierText = CoD.GetLocalizedTierText( tableName, challengeInfo.challengeRow )
	local targetVal = Engine.TableLookupGetColumnValueForRow( tableName, challengeInfo.challengeRow, CoD.ChallengesUtility.TargetValCol )
	local localizedName = Engine.Localize( nameStringRef, "", itemName, localizedTierText )
	local localizedDesc = Engine.Localize( descStringRef, targetVal, itemName )
	return localizedName, localizedDesc
end

CoD.ChallengesUtility.GetChallengeTable = function ( controller, gameModeIndex, gameModeName, challengeCategory, challengeRowSortFn )
	local challengeTable = {}
	local challengeInfo = Engine.GetChallengeInfoForImages( controller, challengeCategory, gameModeIndex )
	if not challengeInfo then
		return challengeTable
	end
	local currentStats = Engine.GetPlayerStats( controller, CoD.STATS_LOCATION_NORMAL, gameModeIndex )
	local rank = currentStats.PlayerStatsList.RANK.StatValue:get()
	local plevel = currentStats.PlayerStatsList.PLEVEL.StatValue:get()
	if challengeRowSortFn then
		table.sort( challengeInfo, challengeRowSortFn )
	end
	for _, currInfo in ipairs( challengeInfo ) do
		local challengeRow = currInfo.challengeRow
		local currentChallengeRow = currInfo.currentChallengeRow
		local currentChallengeCategory = currInfo.challengeCategory
		local tableNumber = currInfo.tableNum
		local isLockedByChallenge = currInfo.isLocked
		local isMastery = currInfo.isMastery
		local challengeType = currInfo.challengeType
		local currentVal = currInfo.currChallengeStatValue
		local imageId = currInfo.imageID
		local f8_local3 = 0
		local f8_local4 = 0
		local f8_local9 = 0
		local f8_local5 = ""
		local tierText, f8_local6, f8_local7, f8_local10, f8_local8 = nil
		if challengeRow ~= nil then
			local tableName = "gamedata/stats/" .. gameModeName .. "/statsmilestones" .. tableNumber + 1 .. ".csv"
			local maxChallengeTier = tonumber( Engine.TableLookupGetColumnValueForRow( tableName, challengeRow, CoD.ChallengesUtility.TierIdCol ) )
			local targetVal = Engine.TableLookupGetColumnValueForRow( tableName, challengeRow, CoD.ChallengesUtility.TargetValCol )
			local challengeNameStringRef = Engine.TableLookupGetColumnValueForRow( tableName, challengeRow, CoD.ChallengesUtility.NameStringCol )
			local challengeDescStringRef = Engine.TableLookupGetColumnValueForRow( tableName, challengeRow, CoD.ChallengesUtility.NameStringCol ) .. "_DESC"
			local xpReward = Engine.TableLookupGetColumnValueForRow( tableName, challengeRow, CoD.ChallengesUtility.XpEarnedCol )
			local unlockRankStr = Engine.TableLookupGetColumnValueForRow( tableName, challengeRow, CoD.ChallengesUtility.UnlockRankCol )
			local unlockPLevelStr = Engine.TableLookupGetColumnValueForRow( tableName, challengeRow, CoD.ChallengesUtility.UnlockPLevelCol )
			local localizedTierText = CoD.GetLocalizedTierText( tableName, challengeRow )
			if unlockRankStr ~= "" then
				f8_local3 = tonumber( unlockRankStr )
			end
			if unlockPLevelStr ~= "" then
				f8_local4 = tonumber( unlockPLevelStr )
			end
			if challengeType == Enum.statsMilestoneTypes_t.MILESTONE_WEAPON then
				f8_local5 = Engine.Localize( Engine.GetItemName( currInfo.itemIndex, gameModeIndex ) )
			elseif challengeType == Enum.statsMilestoneTypes_t.MILESTONE_GROUP then
				f8_local5 = Engine.Localize( "CHALLENGE_TYPE_" .. Engine.GetItemGroupByIndex( currInfo.itemIndex ) )
			elseif challengeType == Enum.statsMilestoneTypes_t.MILESTONE_ATTACHMENTS then
				f8_local5 = Engine.Localize( Engine.GetAttachmentNameByIndex( currInfo.itemIndex ) )
			elseif challengeType == Enum.statsMilestoneTypes_t.MILESTONE_GAMEMODE then
				f8_local5 = Engine.Localize( "CHALLENGE_TYPE_" .. Engine.GetGametypeName( currInfo.itemIndex ) )
			end
			if localizedTierText ~= "" then
				f8_local6 = true
			end
			if not isMastery then
				if plevel < f8_local4 then
					f8_local7 = true
					f8_local8 = Engine.Localize( "CLASS_PRESTIGE_UNLOCK_DESC", f8_local4 )
				elseif plevel == 0 and rank < f8_local3 then
					f8_local7 = true
					local rankName = CoD.GetRankName( f8_local3, 0, gameModeIndex )
					f8_local8 = Engine.Localize( "MENU_UNLOCKED_AT", rankName, f8_local3 + 1 )
				end
			end
			if f8_local6 and f8_local7 then
				localizedTierText = Engine.Localize( "CHALLENGE_TIER_" .. 0 )
			end
			local currentChallengeRow = currInfo.currentChallengeRow
			if currentChallengeRow then
				challengeDescStringRef = Engine.TableLookupGetColumnValueForRow( tableName, currentChallengeRow, CoD.ChallengesUtility.NameStringCol ) .. "_DESC"
				if f8_local6 then
					f8_local9 = tonumber( Engine.TableLookupGetColumnValueForRow( tableName, currentChallengeRow, CoD.ChallengesUtility.TierIdCol ) )
					targetVal = Engine.TableLookupGetColumnValueForRow( tableName, currentChallengeRow, CoD.ChallengesUtility.TargetValCol )
					xpReward = Engine.TableLookupGetColumnValueForRow( tableName, currentChallengeRow, CoD.ChallengesUtility.XpEarnedCol )
					localizedTierText = CoD.GetLocalizedTierText( tableName, currentChallengeRow )
				end
			end
			f8_local10 = Engine.Localize( challengeNameStringRef, "", f8_local5, localizedTierText )
			if not f8_local8 then
				f8_local8 = Engine.Localize( challengeDescStringRef, targetVal, f8_local5 )
			end
			if currentChallengeCategory == "darkops" and isLockedByChallenge then
				f8_local10 = Engine.Localize( "MENU_CLASSIFIED" )
				f8_local8 = Engine.Localize( "MENU_CHALLENGES_DARKOPS_LOCKED_DESC" )
			end
			table.insert( challengeTable, {
				models = {
					title = f8_local10,
					description = f8_local8,
					iconId = imageId,
					maxTier = maxChallengeTier,
					currentTier = f8_local9,
					statPercent = currentVal / targetVal,
					statFractionText = Engine.Localize( "MPUI_X_SLASH_Y", currentVal, targetVal ),
					tierStatus = Engine.Localize( "CHALLENGE_TIER_STATUS", f8_local9 + 1, maxChallengeTier + 1 ),
					xp = xpReward,
					percentComplete = currentVal / targetVal,
					isLocked = isLockedByChallenge
				},
				properties = {
					isMastery = isMastery,
					isDarkOps = currentChallengeCategory == "darkops"
				}
			} )
		end
	end
	return challengeTable
end

CoD.ChallengesUtility.GetDailyChallenge = function ( controller, gameModeEnum, challengeIndex )
	local gameModeName = "zm"
	if gameModeEnum == Enum.eModes.MODE_MULTIPLAYER then
		gameModeName = "mp"
	end
	if not IsLive() then
		return nil
	end
	local currentStats = Engine.GetPlayerStats( controller, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_ZOMBIES )
	local currentDailyChallengeIndex = currentStats.PlayerStatsList.ZM_CURRENT_DAILY_CHALLENGE.statValue:get()
	if challengeIndex then
		currentDailyChallengeIndex = challengeIndex
	end
	local dailyChallengeInfo = Engine.GetDailyChallengeInfo( controller, gameModeEnum, currentDailyChallengeIndex )
	if dailyChallengeInfo[1] ~= nil then
		local challengeRow = dailyChallengeInfo[1].challengeRow
		local tableName = "gamedata/stats/" .. gameModeName .. "/statsmilestones" .. dailyChallengeInfo[1].tableNum + 1 .. ".csv"
		local maxChallengeTier = tonumber( Engine.TableLookupGetColumnValueForRow( tableName, challengeRow, CoD.ChallengesUtility.TierIdCol ) )
		local targetVal = Engine.TableLookupGetColumnValueForRow( tableName, challengeRow, CoD.ChallengesUtility.TargetValCol )
		local challengeNameRef = Engine.TableLookupGetColumnValueForRow( tableName, challengeRow, CoD.ChallengesUtility.NameStringCol )
		local challengeDescRef = Engine.TableLookupGetColumnValueForRow( tableName, challengeRow, CoD.ChallengesUtility.NameStringCol ) .. "_DESC"
		local xpReward = Engine.TableLookupGetColumnValueForRow( tableName, challengeRow, CoD.ChallengesUtility.XpEarnedCol )
		local vialReward = Engine.TableLookupGetColumnValueForRow( tableName, challengeRow, CoD.ChallengesUtility.VialsEarnedCol )
		local percentComplete = dailyChallengeInfo[1].currChallengeStatValue / targetVal
		dailyChallengeInfo[1].maxChallengeTier = maxChallengeTier
		dailyChallengeInfo[1].targetVal = tonumber( targetVal )
		dailyChallengeInfo[1].challengeName = Engine.Localize( challengeNameRef )
		dailyChallengeInfo[1].challengeDescription = Engine.Localize( challengeDescRef, targetVal )
		dailyChallengeInfo[1].xpReward = xpReward
		dailyChallengeInfo[1].vialReward = vialReward
		dailyChallengeInfo[1].percentComplete = percentComplete
		if vialReward and vialReward ~= "" then
			dailyChallengeInfo[1].image = "uie_t7_hud_zm_vial_256"
			dailyChallengeInfo[1].rewardText = Engine.Localize( "ZMUI_BGB_TOKENS_GAINED_REWARD", dailyChallengeInfo[1].vialReward )
		else
			dailyChallengeInfo[1].image = "t7_hud_mp_notifications_xp_blue"
			dailyChallengeInfo[1].rewardText = Engine.Localize( "CHALLENGE_UNLOCK_REWARD", dailyChallengeInfo[1].xpReward )
		end
		return dailyChallengeInfo[1]
	end
	return nil
end

CoD.ChallengesUtility.UpdateDailyChallengeModel = function ( controller, parentModel, gameModeEnum, challengeIndex )
	local dailyChallengeInfo = CoD.ChallengesUtility.GetDailyChallenge( controller, gameModeEnum, challengeIndex )
	if not dailyChallengeInfo then
		Engine.SetModelValue( Engine.CreateModel( parentModel, "description" ), "" )
		Engine.SetModelValue( Engine.CreateModel( parentModel, "fractionText" ), "0/1" )
		Engine.SetModelValue( Engine.CreateModel( parentModel, "image" ), "" )
		Engine.SetModelValue( Engine.CreateModel( parentModel, "progressPercentage" ), 0 )
		Engine.SetModelValue( Engine.CreateModel( parentModel, "rewardText" ), "" )
		Engine.SetModelValue( Engine.CreateModel( parentModel, "title" ), "" )
		return 
	else
		Engine.SetModelValue( Engine.CreateModel( parentModel, "description" ), dailyChallengeInfo.challengeDescription )
		Engine.SetModelValue( Engine.CreateModel( parentModel, "fractionText" ), Engine.Localize( "MPUI_X_SLASH_Y", dailyChallengeInfo.currChallengeStatValue, dailyChallengeInfo.targetVal ) )
		Engine.SetModelValue( Engine.CreateModel( parentModel, "image" ), dailyChallengeInfo.image )
		Engine.SetModelValue( Engine.CreateModel( parentModel, "progressPercentage" ), dailyChallengeInfo.percentComplete )
		Engine.SetModelValue( Engine.CreateModel( parentModel, "rewardText" ), dailyChallengeInfo.rewardText )
		Engine.SetModelValue( Engine.CreateModel( parentModel, "title" ), dailyChallengeInfo.challengeName )
	end
end

DataSources.CallingCards = DataSourceHelpers.ListSetup( "CallingCards", function ( controller )
	local returnTable = {}
	local challengeCategoryModel = Engine.GetModel( Engine.GetGlobalModel(), "challengeCategory" )
	if not challengeCategoryModel then
		return returnTable
	end
	local challengeCategory = Engine.GetModelValue( challengeCategoryModel )
	if not challengeCategory then
		return returnTable
	end
	local gameModeInfo = CoD.ChallengesUtility.GetGameModeInfo()
	if not gameModeInfo then
		return returnTable
	end
	local challengeRowSortFn = function ( a, b )
		return tonumber( a.imageID ) < tonumber( b.imageID )
	end
	
	local challengeTable = CoD.ChallengesUtility.GetChallengeTable( controller, gameModeInfo.index, gameModeInfo.name, challengeCategory, challengeRowSortFn )
	local cardsComplete = 0
	local cardsTotal = 0
	local masteryChallenge = nil
	for _, challenge in ipairs( challengeTable ) do
		local model = challenge.models
		if challenge.properties.isMastery then
			masteryChallenge = challenge
		end
		table.insert( returnTable, challenge )
		cardsTotal = cardsTotal + 1
		if not model.isLocked then
			cardsComplete = cardsComplete + 1
		end
	end
	if masteryChallenge then
		local model = masteryChallenge.models
		DataSources.MasterCallingCard.setModelValues( controller, model.title, model.description, model.iconId, cardsComplete / cardsTotal )
	end
	return returnTable
end )
DataSources.CallingCardsSorted = DataSourceHelpers.ListSetup( "CallingCardsSorted", function ( controller )
	local returnTable = {}
	local gameModeInfo = CoD.ChallengesUtility.GetGameModeInfo()
	if not gameModeInfo then
		return returnTable
	end
	local challengeCategoryTable = CoD.ChallengesUtility.ChallengeCategoryValues[gameModeInfo.index]
	local challengeRowSortFn = function ( a, b )
		if a.isLocked ~= b.isLocked then
			return b.isLocked
		elseif a.challengeCategory ~= b.challengeCategory then
			if challengeCategoryTable[a.challengeCategory] and challengeCategoryTable[b.challengeCategory] then
				return challengeCategoryTable[a.challengeCategory] < challengeCategoryTable[b.challengeCategory]
			else
				return challengeCategoryTable[a.challengeCategory] ~= nil
			end
		else
			return tonumber( a.imageID ) < tonumber( b.imageID )
		end
	end
	
	if gameModeInfo.index ~= Enum.eModes.MODE_MULTIPLAYER and gameModeInfo.index ~= Enum.eModes.MODE_ZOMBIES then
		local f13_local0 = false
	else
		local isAddingPrestige = true
	end
	local hasAddedPrestige = false
	local challengeTable = CoD.ChallengesUtility.GetChallengeTable( controller, gameModeInfo.index, gameModeInfo.name, nil, challengeRowSortFn )
	for _, challenge in ipairs( challengeTable ) do
		local properties = challenge.properties
		if f13_local0 and not hasAddedPrestige and challenge.models.isLocked then
			CoD.PrestigeUtility.AddPrestigeCallingCards( controller, gameModeInfo.index, returnTable )
			hasAddedPrestige = true
		end
		if not properties.isMastery and (not properties.isDarkOps or challenge.models.statPercent >= 1) then
			table.insert( returnTable, challenge )
		end
	end
	return returnTable
end )
DataSources.ChallengesNearCompletionList = DataSourceHelpers.ListSetup( "ChallengesNearCompletionList", function ( controller )
	local returnTable = {}
	local gameModeInfo = CoD.ChallengesUtility.GetGameModeInfo()
	if not gameModeInfo then
		return returnTable
	end
	local challengeRowSortFn = function ( a, b )
		return tonumber( a.imageID ) < tonumber( b.imageID )
	end
	
	if CoD.ChallengesUtility.NearCompletionLists[gameModeInfo.index] ~= nil then
		return CoD.ChallengesUtility.NearCompletionLists[gameModeInfo.index]
	end
	local challengeTable = CoD.ChallengesUtility.GetChallengeTable( controller, gameModeInfo.index, gameModeInfo.name, nil, challengeRowSortFn )
	table.sort( challengeTable, function ( a, b )
		if a.models.statPercent ~= b.models.statPercent then
			return b.models.statPercent < a.models.statPercent
		else
			return a.models.iconId < b.models.iconId
		end
	end )
	for _, challenge in ipairs( challengeTable ) do
		if not challenge.properties.isMastery and not challenge.properties.isDarkOps and challenge.models.statPercent < 1 then
			table.insert( returnTable, challenge )
			if CoD.ChallengesUtility.NearCompletionMaxNumChallengesShown <= #returnTable then
				break
			end
		end
	end
	CoD.ChallengesUtility.NearCompletionLists[gameModeInfo.index] = returnTable
	return returnTable
end )
DataSources.DarkOpsCallingCards = DataSourceHelpers.ListSetup( "DarkOpsCallingCards", function ( controller )
	local returnTable = {}
	local challengeRowSortFn = function ( a, b )
		return tonumber( a.imageID ) < tonumber( b.imageID )
	end
	
	return CoD.ChallengesUtility.GetChallengeTable( controller, Enum.eModes.MODE_MULTIPLAYER, "mp", "darkops", challengeRowSortFn )
end )
DataSources.DarkOpsCallingCardsZM = DataSourceHelpers.ListSetup( "DarkOpsCallingCardsZM", function ( controller )
	local returnTable = {}
	local challengeRowSortFn = function ( a, b )
		return tonumber( a.imageID ) < tonumber( b.imageID )
	end
	
	return CoD.ChallengesUtility.GetChallengeTable( controller, Enum.eModes.MODE_ZOMBIES, "zm", "darkops", challengeRowSortFn )
end )
CoD.ChallengesUtility.GetEmblemBackgroundImageText = function ( challengeID, itemIndex )
	local imageID, isEmblem = Engine.GetChallengeUnlockEmblemInfo( challengeID, itemIndex )
	if imageID < 0 then
		return isEmblem
	end
	local text = "MENU_CALLING_CARD"
	local tableName = CoD.backgroundsTable
	local imageColumns = {
		11,
		3
	}
	if isEmblem then
		tableName = CoD.emblemIconsTable
		text = "MENU_EMBLEM"
		imageColumns = {
			3
		}
	end
	local image = ""
	for _, imageNameColumn in ipairs( imageColumns ) do
		image = Engine.TableLookupGetColumnValueForRow( tableName, imageID, imageNameColumn )
		if image ~= "" then
			break
		end
	end
	return isEmblem, image, text
end

CoD.ChallengesUtility.IsSpecialistTransmissionChallenge = function ( challengeType, tableNumber, row )
	if challengeType == Enum.statsMilestoneTypes_t.MILESTONE_SPECIALIST then
		local statname = Engine.TableLookupGetColumnValueForRow( CoD.getStatsMilestoneTable( tableNumber + 1 ), row, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_STATNAME )
		if LUI.startswith( statname, "transmission" ) then
			return true
		end
	elseif challengeType == Enum.statsMilestoneTypes_t.MILESTONE_GLOBAL then
		local statname = Engine.TableLookupGetColumnValueForRow( CoD.getStatsMilestoneTable( tableNumber + 1 ), row, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_STATNAME )
		if statname == "specialist_transmissions" or statname == "hero_transmissions" then
			return true
		end
	end
	return false
end

CoD.ChallengesUtility.IsTerribleKnifeChallenge = function ( challengeType, tableNumber, row )
	if challengeType == Enum.statsMilestoneTypes_t.MILESTONE_GROUP then
		local includeName = Engine.TableLookupGetColumnValueForRow( CoD.getStatsMilestoneTable( tableNumber + 1 ), row, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_INCLUDE )
		if includeName == "weapon_knife" then
			return true
		end
	end
	return false
end

CoD.ChallengesUtility.IsHiddenPostShipChallenge = function ( challengeType, tableNumber, row )
	local lootWeapons = {
		"melee_knuckles",
		"melee_butterfly",
		"melee_wrench",
		"pistol_shotgun",
		"melee_crowbar",
		"melee_sword",
		"ar_garand",
		"special_crossbow"
	}
	local suffixes = {
		"_gold",
		"_for_diamond"
	}
	local statName = Engine.TableLookupGetColumnValueForRow( CoD.getStatsMilestoneTable( tableNumber + 1 ), row, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_CHALLENGESTATNAME )
	for _, weaponName in ipairs( lootWeapons ) do
		for __, suffix in ipairs( suffixes ) do
			if statName == weaponName .. suffix then
				return true
			end
		end
	end
	local includeItems = Engine.TableLookupGetColumnValueForRow( CoD.getStatsMilestoneTable( tableNumber + 1 ), row, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_INCLUDE )
	if statName == "weapons_mastery" and includeItems ~= "knife_loadout" then
		return true
	elseif statName == "secondary_mastery" and includeItems ~= "weapon_knife" then
		return true
	else
		return false
	end
end

CoD.ChallengesUtility.SpecialistRewardTiers = LuaEnum.createEnum( "Default", "Epic", "CompletionEpic" )
CoD.ChallengesUtility.CamoRewardTiers = LuaEnum.createEnum( "Default", "Gold", "Diamond", "DarkMatter" )
CoD.ChallengesUtility.EmblemRewardTiers = LuaEnum.createEnum( "Default", "Mastery" )
CoD.ChallengesUtility.DefaultRewardTiers = LuaEnum.createEnum( "Default" )
CoD.ChallengesUtility.GetChallengeRewardDisplayTier = function ( rewardInfo )
	local tier = CoD.ChallengesUtility.DefaultRewardTiers.Default
	local type = ""
	if IsMultiplayer() then
		if rewardInfo.specialistInfo then
			type = "specialist"
			if rewardInfo.specialistInfo.unlockItemIndex == 9 then
				tier = CoD.ChallengesUtility.SpecialistRewardTiers.CompletionEpic
			elseif rewardInfo.specialistInfo.unlockItemIndex == 8 then
				tier = CoD.ChallengesUtility.SpecialistRewardTiers.Epic
			else
				tier = CoD.ChallengesUtility.SpecialistRewardTiers.Default
			end
		elseif rewardInfo.camoInfo then
			type = "camo"
			if rewardInfo.camoInfo.camoRef == "camo_darkmatter" then
				tier = CoD.ChallengesUtility.CamoRewardTiers.DarkMatter
			elseif rewardInfo.camoInfo.camoRef == "camo_diamond" then
				tier = CoD.ChallengesUtility.CamoRewardTiers.Diamond
			elseif rewardInfo.camoInfo.camoRef == "camo_gold" then
				tier = CoD.ChallengesUtility.CamoRewardTiers.Gold
			else
				tier = CoD.ChallengesUtility.CamoRewardTiers.Default
			end
		elseif rewardInfo.reticleInfo then
			type = "reticle"
		elseif rewardInfo.emblemInfo then
			type = "emblem"
			if rewardInfo.emblemInfo.isMastery then
				tier = CoD.ChallengesUtility.EmblemRewardTiers.Mastery
			else
				tier = CoD.ChallengesUtility.EmblemRewardTiers.Default
			end
		end
	end
	return tier, type
end

CoD.ChallengesUtility.GetChallengeRewardInfo = function ( controller, tableNumber, row, challengeType, itemIndex, specialistIndex )
	local tableName = CoD.getStatsMilestoneTable( tableNumber + 1 )
	local challengeString = Engine.TableLookupGetColumnValueForRow( tableName, row, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_STRING )
	local challengeTier = tonumber( Engine.TableLookupGetColumnValueForRow( tableName, row, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_TIERID ) )
	local challengeTierNext = tonumber( Engine.TableLookupGetColumnValueForRow( tableName, row + 1, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_TIERID ) )
	local targetValue = tonumber( Engine.TableLookupGetColumnValueForRow( tableName, row, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_TARGETVALUE ) ) or 0
	local unlockItem = Engine.TableLookupGetColumnValueForRow( tableName, row, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_UNLOCKITEM )
	local unlockImage = Engine.TableLookupGetColumnValueForRow( tableName, row, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_UNLOCKIMAGE )
	local unlockHeroItem = Engine.TableLookupGetColumnValueForRow( tableName, row, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_UNLOCKHEROITEM )
	local challengeUnlock = Engine.TableLookupGetColumnValueForRow( tableName, row, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_CHALLENGESTATNAME )
	local isTieredChallenge = false
	local category = Engine.TableLookupGetColumnValueForRow( tableName, row, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_CATEGORY )
	local rewardXp = tonumber( Engine.TableLookupGetColumnValueForRow( tableName, row, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_XPEARNED ) )
	local rewardVials = tonumber( Engine.TableLookupGetColumnValueForRow( tableName, row, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_VIALSEARNED ) )
	if challengeTier and challengeTier > 0 then
		isTieredChallenge = true
	elseif challengeTierNext and challengeTierNext == 1 then
		isTieredChallenge = true
	end
	local challengeAwardString = ""
	if unlockItem ~= "" then
		challengeAwardString = challengeString .. "_AWARD"
	else
		challengeAwardString = challengeString
	end
	local tierText = nil
	local localizedTierText = ""
	if isTieredChallenge == true then
		localizedTierText = Engine.Localize( "CHALLENGE_TIER_" .. challengeTier )
		local newRow = row + 1
		local lastTier = challengeTier
		while not category or category == "" do
			local tier = tonumber( Engine.TableLookupGetColumnValueForRow( tableName, newRow, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_TIERID ) ) or -1
			if tier <= lastTier then
				break
			end
			category = Engine.TableLookupGetColumnValueForRow( tableName, newRow, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_CATEGORY )
			tier = lastTier
			newRow = newRow + 1
		end
		if not category then
			category = ""
		end
	end
	local titleText, subtitleText = nil
	local icon = "blacktransparent"
	if CoD.isMultiplayer then
		icon = "t7_icons_challenges_mp_" .. category
	end
	if CoD.isZombie == true then
		if challengeType == Enum.statsMilestoneTypes_t.MILESTONE_DAILY then
			icon = "uie_t7_menu_challenges_complete_icon"
		elseif category == "darkops" then
			icon = "t7_icons_challenges_mp_darkops"
		else
			icon = "t7_icons_challenges_zm_" .. category
		end
	end
	local reticleInfo = nil
	if challengeType == Enum.statsMilestoneTypes_t.MILESTONE_GLOBAL then
		titleText = Engine.Localize( challengeAwardString, targetValue, "", localizedTierText )
		subtitleText = Engine.Localize( challengeString .. "_DESC", targetValue, "", localizedTierText )
	elseif challengeType == Enum.statsMilestoneTypes_t.MILESTONE_DAILY then
		titleText = Engine.Localize( challengeString )
		subtitleText = "MENU_DAILY_CHALLENGE_COMPLETED"
	elseif challengeType == Enum.statsMilestoneTypes_t.MILESTONE_GROUP then
		local groupName = Engine.Localize( "CHALLENGE_TYPE_" .. Engine.GetItemGroupByIndex( itemIndex ) )
		titleText = Engine.Localize( challengeString, targetValue, groupName, localizedTierText )
		subtitleText = Engine.Localize( challengeString .. "_DESC", targetValue, groupName, localizedTierText )
	elseif challengeType == Enum.statsMilestoneTypes_t.MILESTONE_GAMEMODE then
		local gameTypeString = Engine.GetCurrentGameType()
		if 0 ~= Dvar.scr_hardcore:get() then
			gameTypeString = "hc" .. gameTypeString
		end
		local gameTypeLocString = Engine.Localize( "CHALLENGE_TYPE_" .. gameTypeString )
		titleText = Engine.Localize( challengeAwardString, targetValue, gameTypeLocString, localizedTierText )
		subtitleText = Engine.Localize( challengeString .. "_DESC", targetValue, gameTypeLocString, localizedTierText )
	elseif challengeType == Enum.statsMilestoneTypes_t.MILESTONE_WEAPON then
		local weaponName = Engine.GetItemName( itemIndex )
		titleText = Engine.Localize( challengeAwardString, targetValue, weaponName, localizedTierText )
		subtitleText = Engine.Localize( challengeString .. "_DESC", targetValue, weaponName, localizedTierText )
	elseif challengeType == Enum.statsMilestoneTypes_t.MILESTONE_ATTACHMENTS then
		local attachmentName = Engine.GetAttachmentNameByIndex( itemIndex )
		titleText = Engine.Localize( challengeAwardString, targetValue, attachmentName, localizedTierText )
		subtitleText = Engine.Localize( challengeString .. "_DESC", targetValue, attachmentName, localizedTierText )
		if unlockItem and unlockItem ~= "" then
			icon = "cac_mods_" .. Engine.GetAttachmentRefByIndex( itemIndex )
			local reticleIndex = string.sub( unlockItem, string.len( "reticle_" ) + 1 )
			local attachmentRef = Engine.TableLookup( CoD.attachmentTable, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_REFERENCE, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_NAME, attachmentName )
			reticleInfo = {
				displayString = Engine.Localize( "MPUI_RETICLE_" .. attachmentRef .. "_" .. reticleIndex ),
				image = attachmentRef .. "_" .. reticleIndex
			}
		end
	elseif challengeType == Enum.statsMilestoneTypes_t.MILESTONE_SPECIALIST then
		local specialistInfo = Engine.GetHeroInfo( Engine.CurrentSessionMode(), specialistIndex )
		local bundleInfo = Engine.GetHeroBundleInfo( Engine.CurrentSessionMode(), specialistIndex )
		titleText = Engine.Localize( challengeAwardString, "", specialistInfo.displayName )
		icon = bundleInfo.challengeSpecialist
		subtitleText = Engine.Localize( challengeString .. "_DESC", targetValue, specialistInfo.displayName, localizedTierText )
	end
	local camoInfo = nil
	if LUI.startswith( unlockItem, "camo_" ) then
		local unlockItemString = Engine.TableLookup( CoD.attachmentTable, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_NAME, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_REFERENCE, unlockItem )
		titleText = Engine.Localize( challengeAwardString, unlockItemString )
		if challengeType == Enum.statsMilestoneTypes_t.MILESTONE_GLOBAL then
			local includeItems = Engine.TableLookupGetColumnValueForRow( tableName, row, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_INCLUDE )
			if includeItems == "ar_garand" then
				icon = "t7_icon_weapon_assault_" .. unlockItem
			elseif includeItems == "pistol_shotgun" then
				icon = "t7_icon_weapon_pistol_" .. unlockItem
			else
				icon = "t7_icon_weapon_" .. unlockItem
			end
		elseif challengeType == Enum.statsMilestoneTypes_t.MILESTONE_GROUP then
			icon = "t7_icon_" .. Engine.GetItemGroupByIndex( itemIndex ) .. "_" .. unlockItem
		else
			icon = Engine.GetItemImage( itemIndex ) .. "_" .. unlockItem
		end
		camoInfo = {
			displayString = Engine.Localize( unlockItemString ),
			image = Engine.TableLookup( CoD.attachmentTable, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_IMAGE, Enum.attachmentTableColumn_e.ATTACHMENTTABLE_COLUMN_REFERENCE, unlockItem ),
			camoRef = unlockItem
		}
	end
	local isMastery = function ( tableName, row )
		local f28_local0
		if Engine.TableLookupGetColumnValueForRow( tableName, row, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_ISMASTERY ) ~= "1" and Engine.TableLookupGetColumnValueForRow( tableName, row, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_ISEXPERT ) ~= "1" then
			f28_local0 = false
		else
			f28_local0 = true
		end
		return f28_local0
	end
	
	local emblemInfo = nil
	if itemIndex then
		local isEmblem, unlockImageRef, emblemBackgroundText = CoD.ChallengesUtility.GetEmblemBackgroundImageText( tonumber( Engine.TableLookupGetColumnValueForRow( tableName, row, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_INDEX ) ), itemIndex )
		if isEmblem then
			local f27_local0 = ""
			if not f27_local0 then
			
			elseif unlockImageRef then
				emblemInfo = {
					displayString = Engine.Localize( emblemBackgroundText ),
					image = unlockImageRef,
					rewardSize = f27_local0,
					isMastery = isMastery( tableName, row )
				}
			end
		end
		local rewardSize = "CallingCard"
	end
	local f27_local1 = unlockItem
	local f27_local2 = unlockImage
	local possibleEmblem = ""
	local f27_local3 = f27_local2 or f27_local1 or possibleEmblem
	if not emblemInfo and LUI.startswith( f27_local3, "EM_" ) then
		local possibleTables = {
			{
				table = CoD.backgroundsTable,
				title = "MENU_CALLING_CARD",
				descriptionColumn = 4,
				imageNameColumn = {
					11,
					3
				},
				rewardSize = "CallingCard"
			},
			{
				table = CoD.emblemIconsTable,
				title = "MENU_EMBLEM",
				descriptionColumn = 4,
				imageNameColumn = {
					3
				},
				rewardSize = ""
			}
		}
		for _, tableItem in ipairs( possibleTables ) do
			local f27_local6 = nil
			for _, columnNumber in ipairs( tableItem.imageNameColumn ) do
				f27_local6 = Engine.TableLookup( tableItem.table, columnNumber, tableItem.descriptionColumn, f27_local3 )
				if f27_local6 and f27_local6 ~= "" then
					break
				end
			end
			if f27_local6 and f27_local6 ~= "" then
				emblemInfo = {
					displayString = Engine.Localize( f27_local3 ),
					image = f27_local6,
					rewardSize = tableItem.rewardSize,
					isMastery = isMastery( tableName, row )
				}
			end
		end
	end
	local specialistInfo = nil
	local specialistPrefixes = {
		{
			prefix = "body_",
			type = Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY,
			locString = "HEROES_X_BODY"
		},
		{
			prefix = "helmet_",
			type = Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET,
			locString = "HEROES_X_HELMET"
		}
	}
	if unlockHeroItem and unlockHeroItem ~= "" then
		local f27_local9 = specialistIndex
		local useSpecialistIndex = Engine.GetEquippedHero( controller, Engine.CurrentSessionMode() )
		local f27_local0 = f27_local9 or useSpecialistIndex
		for _, f27_local7 in ipairs( specialistPrefixes ) do
			if LUI.startswith( unlockHeroItem, f27_local7.prefix ) then
				local unlockItemIndex = tonumber( unlockHeroItem:sub( f27_local7.prefix:len() + 1 ) ) - 1
				local itemInfo = Engine.GetHeroItemInfo( Engine.CurrentSessionMode(), f27_local0, f27_local7.type, unlockItemIndex )
				if itemInfo then
					specialistInfo = {
						displayString = Engine.Localize( f27_local7.locString, itemInfo.name ),
						image = itemInfo.icon,
						unlockItemIndex = unlockItemIndex
					}
					break
				end
			end
		end
	end
	local transmissionInfo = nil
	local transmissionPrefix = "transmission"
	if challengeUnlock and challengeUnlock ~= "" and LUI.startswith( challengeUnlock, transmissionPrefix ) then
		local f27_local11 = specialistIndex
		local useSpecialistIndex = Engine.GetEquippedHero( controller, Engine.CurrentSessionMode() )
		local f27_local10 = f27_local11 or useSpecialistIndex
		local transmissionIndex = tonumber( challengeUnlock:sub( transmissionPrefix:len() + 1 ) )
		local transmissionLocked, f27_local7 = Engine.IsSpecialistTransmissionLocked( controller, f27_local10, transmissionIndex )
		if not transmissionLocked then
			transmissionInfo = {
				displayString = Engine.Localize( "CHALLENGE_TRANSMISSION_N_FOR_X", transmissionIndex, Engine.GetHeroName( Engine.CurrentSessionMode(), specialistIndex ) ),
				image = "t7_hud_hero_icon_filetype_audio"
			}
		end
	end
	local xpInfo = nil
	if rewardXp and rewardXp > 0 then
		xpInfo = {
			displayString = Engine.Localize( "RANK_XP", rewardXp ),
			image = "t7_hud_mp_notifications_xp_blue"
		}
	end
	local vialInfo = nil
	if rewardVials and rewardVials > 0 then
		vialInfo = {
			displayString = Engine.Localize( "ZMUI_BGB_TOKENS_GAINED_REWARD", rewardVials ),
			image = "t7_hud_zm_vial_256"
		}
	end
	return {
		challengeString = challengeString,
		challengeAwardString = challengeAwardString,
		localizedTierText = localizedTierText,
		titleText = titleText,
		subtitleText = subtitleText,
		icon = icon,
		reticleInfo = reticleInfo,
		camoInfo = camoInfo,
		emblemInfo = emblemInfo,
		specialistInfo = specialistInfo,
		transmissionInfo = transmissionInfo,
		xpInfo = xpInfo,
		vialInfo = vialInfo
	}
end

