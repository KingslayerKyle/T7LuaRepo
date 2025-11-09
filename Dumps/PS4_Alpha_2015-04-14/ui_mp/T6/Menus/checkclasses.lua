require( "ui.T6.CoDBase" )

CoD.CheckClasses = {}
CoD.CheckClasses.checkGameModeMastery = function ( playerStats, controller, gameMode )
	local uploadStats = false
	local challengeInfo = Engine.GetChallengeInfoForImages( controller, gameMode )
	local challengeInfoCount = #challengeInfo
	local masteryChallengeItemIndex, masteryChallengeStatName = nil
	local masteryChallengeCurrStatValue = 0
	local unlockedChallengeCount = 0
	for key, currInfo in ipairs( challengeInfo ) do
		local challengeRow = currInfo.challengeRow
		local tableNumber = currInfo.tableNum
		local isLocked = currInfo.isLocked
		local tableName, unlocalizedString = nil
		if challengeRow ~= nil then
			if Engine.TableLookupGetColumnValueForRow( "mp/statsmilestones" .. tableNumber + 1 .. ".csv", challengeRow, 5 ) == "CHALLENGE_MASTERY_GAMEMODE" then
				masteryChallengeItemIndex = currInfo.currentChallengeRow
				masteryChallengeCurrStatValue = currInfo.currChallengeStatValue
				masteryChallengeStatName = currInfo.challengeStatName
			end
			if isLocked == false then
				unlockedChallengeCount = unlockedChallengeCount + 1
			end
		end
	end
	if masteryChallengeStatName ~= nil and masteryChallengeCurrStatValue ~= unlockedChallengeCount then
		playerStats.PlayerStatsByGameType[gameMode][masteryChallengeStatName].challengeValue:set( unlockedChallengeCount )
		uploadStats = true
	end
	return uploadStats
end

CoD.CheckClasses.CheckChallenges = function ( playerStats, controller )
	local uploadStats = false
	local groupMapping = {
		{
			"weapon_assault",
			"primary_mastery",
			135,
			0
		},
		{
			"weapon_pistol",
			"secondary_mastery",
			75,
			0
		},
		{
			"weapon_smg",
			"primary_mastery",
			90,
			0
		},
		{
			"weapon_lmg",
			"primary_mastery",
			60,
			0
		},
		{
			"weapon_sniper",
			"primary_mastery",
			60,
			0
		},
		{
			"weapon_cqb",
			"primary_mastery",
			60,
			0
		},
		{
			"weapon_launcher",
			"secondary_mastery",
			45,
			0
		},
		{
			"weapon_special",
			"secondary_mastery",
			60,
			0
		}
	}
	local masteryMapping = {
		{
			"primary_mastery",
			0
		},
		{
			"secondary_mastery",
			0
		}
	}
	local maxRankXP = CoD.MAX_RANKXP
	local maxPrestige = tonumber( CoD.MAX_PRESTIGE )
	local oldRankXP = playerStats.playerStatsList.RANKXP.statValue
	local oldPrestige = playerStats.playerStatsList.PLEVEL.statValue
	local oldRankXPValue = oldRankXP:get()
	local oldRankPrestigeValue = oldPrestige:get()
	oldRankXP:set( maxRankXP )
	oldPrestige:set( maxPrestige )
	for itemIndex = 0, 84, 1 do
		local challengeValue = playerStats.itemStats[itemIndex].stats.challenges.challengeValue
		local currentVal = challengeValue:get()
		if challengeValue:get() > 0 then
			local numCamos = 0
			for optionIndex = 1, 14, 1 do
				if not Engine.GetItemOptionLocked( controller, itemIndex, optionIndex ) then
					numCamos = numCamos + 1
				end
			end
			if numCamos == 14 then
				numCamos = 15
			end
			if numCamos ~= challengeValue:get() then
				challengeValue:set( numCamos )
				uploadStats = true
			end
			local pakName = Engine.GetDLCNameForItem( itemIndex )
			if numCamos > 0 and not pakName then
				local itemGroup = Engine.GetItemGroup( itemIndex )
				if itemGroup and itemGroup ~= "" then
					for index, groupRow in ipairs( groupMapping ) do
						if string.lower( itemGroup ) == groupRow[1] then
							groupRow[4] = groupRow[4] + numCamos
							if groupRow[3] <= groupRow[4] then
								for masteryIndex, masteryRow in ipairs( masteryMapping ) do
									if string.lower( masteryRow[1] ) == groupRow[2] then
										masteryRow[2] = masteryRow[2] + 1
									end
								end
							end
						end
					end
				end
			end
		end
	end
	for index, groupRow in ipairs( groupMapping ) do
		local groupStats = playerStats.groupStats[groupRow[1]].stats.challenges.challengeValue
		local groupStatValue = groupStats:get()
		if groupStats:get() ~= groupRow[4] then
			groupStats:set( groupRow[4] )
			uploadStats = true
		end
	end
	for masteryIndex, groupRow in ipairs( masteryMapping ) do
		local masteryStat = playerStats.playerStatsList[groupRow[1]].challengeValue
		local masteryStatValue = masteryStat:get()
		if masteryStat:get() ~= groupRow[2] then
			masteryStat:set( groupRow[2] )
			uploadStats = true
		end
	end
	oldRankXP:set( oldRankXPValue )
	oldPrestige:set( oldRankPrestigeValue )
	return CoD.CheckClasses.checkGameModeMastery( playerStats, controller, "sd" ) or CoD.CheckClasses.checkGameModeMastery( playerStats, controller, "dem" ) or uploadStats
end

CoD.CheckClasses.IsItemValid = function ( controller, itemIndex, checkPurchased, rankXP )
	if 0 < itemIndex and Engine.ItemIndexValid( itemIndex ) == false then
		return false
	elseif checkPurchased and (Engine.IsItemPurchased( controller, itemIndex ) == 0 or rankXP == 0) then
		return false
	else
		return true
	end
end

CoD.CheckClasses.ClearWeapon = function ( currentClass, slotName )
	currentClass[slotName .. "attachment1"]:set( 0 )
	currentClass[slotName .. "attachment2"]:set( 0 )
	currentClass[slotName .. "attachment3"]:set( 0 )
	currentClass[slotName .. "emblem"]:set( 0 )
	currentClass[slotName .. "camo"]:set( 0 )
	currentClass[slotName .. "tag"]:set( 0 )
	currentClass[slotName .. "reticle"]:set( 0 )
end

CoD.CheckClasses.ClearSlot = function ( currentClass, slotName )
	currentClass[slotName]:set( 0 )
end

CoD.CheckClasses.GetEquippedBonusCards = function ( playerStats, cacRoot, classNum )
	local classRoot = cacRoot.customclass
	local currentClass = classRoot[classNum]
	if currentClass == nil then
		return false
	end
	local equippedBonusCards = {}
	for bonusCardIndex = 1, 3, 1 do
		local itemIndex = currentClass["bonuscard" .. bonusCardIndex]:get()
		local ref = Engine.GetItemRef( itemIndex )
		if itemIndex > 0 then
			equippedBonusCards[ref] = true
		end
	end
	return equippedBonusCards
end

CoD.CheckClasses.CheckItems = function ( playerStats, controller, cacRoot, endClassNum, checkPurchased )
	local defaultClassNames = {
		"class_custom_assault",
		"class_custom_smg",
		"class_custom_lmg",
		"class_custom_cqb",
		"class_custom_sniper"
	}
	local shouldUpload = false
	local loadoutSlotNames = CoD.CACUtility.loadoutSlotNames
	local classRoot = cacRoot.customclass
	local rankXP = playerStats.playerStatsList.RANKXP.statValue:get()
	local maxWeaponIndex = 59
	local minGrenadeIndex = 63
	local maxGrenadeIndex = 78
	for classNum = 0, endClassNum, 1 do
		local currentClass = classRoot[classNum]
		if currentClass == nil then
			break
		end
		local equippedBonusCards = CoD.CheckClasses.GetEquippedBonusCards( playerStats, cacRoot, classNum )
		for key, slotName in pairs( loadoutSlotNames ) do
			local f7_local5 = nil
			if string.find( slotName, "killstreak" ) then
				f7_local5 = cacRoot[slotName]
			else
				f7_local5 = currentClass[slotName]
			end
			if f7_local5 then
				local itemIndex = f7_local5:get()
				if not CoD.CheckClasses.IsItemValid( controller, itemIndex, checkPurchased, rankXP ) then
					local defaultClass = defaultClassNames[classNum % 5 + 1]
					local defaultItem = tonumber( Engine.GetDefaultClassSlot( defaultClass, slotName ) )
					if defaultItem ~= itemIndex then
						shouldUpload = true
						f7_local5:set( defaultItem )
						if slotName == "primary" or slotName == "secondary" then
							CoD.CheckClasses.ClearWeapon( currentClass, slotName )
						end
					end
				elseif slotName == "primary" or slotName == "secondary" then
					if itemIndex == 0 then
						CoD.CheckClasses.ClearWeapon( currentClass, slotName )
					elseif maxWeaponIndex < itemIndex then
						local defaultClass = defaultClassNames[classNum % 5 + 1]
						local defaultItem = tonumber( Engine.GetDefaultClassSlot( defaultClass, slotName ) )
						if defaultItem ~= itemIndex then
							shouldUpload = true
							f7_local5:set( defaultItem )
							CoD.CheckClasses.ClearWeapon( currentClass, slotName )
						end
					else
						local maxAttachments = Engine.GetNumAttachments( itemIndex )
						for i = 0, 2, 1 do
							local attachmentStat = currentClass[slotName .. "attachment" .. i + 1]
							local attachmentIndex = attachmentStat:get()
							if maxAttachments < attachmentIndex or checkPurchased and Engine.GetItemAttachmentLocked( controller, itemIndex, attachmentIndex ) ~= 0 then
								attachmentStat:set( 0 )
							end
						end
						local camoStat = currentClass[slotName .. "camo"]
						local camoStatValue = camoStat:get()
						if camoStatValue > 0 and Engine.GetItemOptionLocked( controller, itemIndex, camoStatValue ) then
							camoStat:set( 0 )
						end
					end
				elseif slotName == "primarygrenade" or slotName == "specialgrenade" then
					local countStat = currentClass[slotName .. "count"]
					local countStatValue = countStat:get()
					if countStatValue == 0 then
						currentClass[slotName]:set( 0 )
					elseif countStatValue > 2 then
						countStat:set( 2 )
					end
					if itemIndex ~= 0 and (maxGrenadeIndex < itemIndex or itemIndex < minGrenadeIndex) then
						CoD.CheckClasses.ClearSlot( currentClass, slotName )
						shouldUpload = true
					end
				end
				if slotName == "primarygrenade" then
					if Engine.GetLoadoutSlotForItem( itemIndex ) == "specialgrenade" then
						if equippedBonusCards.bonuscard_two_tacticals ~= true then
							CoD.CheckClasses.ClearSlot( currentClass, slotName )
							shouldUpload = true
						end
					end
					local countStatValue = currentClass[slotName .. "count"]:get()
					if countStatValue == 2 and equippedBonusCards.bonuscard_danger_close ~= true then
						CoD.CheckClasses.ClearSlot( currentClass, slotName )
						shouldUpload = true
					end
				end
				if slotName == "specialty4" then
					if itemIndex > 0 and equippedBonusCards.bonuscard_perk_1_greed ~= true then
						CoD.CheckClasses.ClearSlot( currentClass, slotName )
						shouldUpload = true
					end
				end
				if slotName == "specialty5" then
					if itemIndex > 0 and equippedBonusCards.bonuscard_perk_2_greed ~= true then
						CoD.CheckClasses.ClearSlot( currentClass, slotName )
						shouldUpload = true
					end
				end
				if slotName == "specialty6" then
					if itemIndex > 0 and equippedBonusCards.bonuscard_perk_3_greed ~= true then
						CoD.CheckClasses.ClearSlot( currentClass, slotName )
						shouldUpload = true
					end
				end
				if slotName == "primary" then
					local thirdAttachmentIndex = currentClass[slotName .. "attachment3"]:get()
					if thirdAttachmentIndex > 0 and equippedBonusCards.bonuscard_primary_gunfighter ~= true then
						CoD.CheckClasses.ClearSlot( currentClass, slotName .. "attachment3" )
						shouldUpload = true
					end
				end
				if slotName == "secondary" then
					if Engine.GetLoadoutSlotForItem( itemIndex ) == "primary" and equippedBonusCards.bonuscard_overkill ~= true then
						CoD.CheckClasses.ClearSlot( currentClass, slotName )
						shouldUpload = true
					end
					local secondAttachmentIndex = currentClass[slotName .. "attachment2"]:get()
					if secondAttachmentIndex > 0 and equippedBonusCards.bonuscard_secondary_gunfighter ~= true then
						CoD.CheckClasses.ClearSlot( currentClass, slotName .. "attachment2" )
						shouldUpload = true
					end
				end
			end
		end
	end
	return shouldUpload
end

CoD.CheckClasses.UpdateTrackerLeaderboard = function ( controller )
	Engine.ExecNow( controller, "trackerupdate super_offensive 1" )
end

CoD.CheckClasses.CheckMTXPurchased = function ( controller, playerStats, cacRoot )
	local ownedMTX = {}
	local mtxTableName = "mp/mtxitems.csv"
	local mtxTableRowCount = Engine.GetTableRowCount( mtxTableName )
	local mtxIDRowIndex = 0
	local mtxNameRowIndex = 1
	local attachmentTableName = "mp/attachmentTable.csv"
	local attachmentTableNameRow = 16
	local attachmentIndexRow = 0
	local uploadStats = false
	for mtxTableRow = 0, mtxTableRowCount, 1 do
		local mtxItemName = Engine.TableLookupGetColumnValueForRow( mtxTableName, mtxTableRow, mtxNameRowIndex )
		if string.len( mtxItemName ) > 0 then
			local attachmentTableRows = Engine.TableFindRows( attachmentTableName, attachmentTableNameRow, mtxItemName )
			if attachmentTableRows ~= nil then
				for key, value in pairs( attachmentTableRows ) do
					local attachmentIndex = Engine.TableLookupGetColumnValueForRow( attachmentTableName, value, attachmentIndexRow )
					ownedMTX[attachmentIndex] = Engine.HasMTX( controller, mtxItemName )
				end
			end
		end
	end
	local lastClassToCheck = 9
	local classRoot = cacRoot.customclass
	for classNum = 0, lastClassToCheck, 1 do
		local currentClass = classRoot[classNum]
		if currentClass == nil then
			break
		elseif CoD.CheckClasses.CheckMTXItem( currentClass, "primarycamo", ownedMTX ) then
			uploadStats = true
		end
		if CoD.CheckClasses.CheckMTXItem( currentClass, "primaryreticle", ownedMTX ) then
			uploadStats = true
		end
		if CoD.CheckClasses.CheckMTXItem( currentClass, "secondarycamo", ownedMTX ) then
			uploadStats = true
		end
		if CoD.CheckClasses.CheckMTXItem( currentClass, "secondaryreticle", ownedMTX ) then
			uploadStats = true
		end
		if CoD.CheckClasses.CheckMTXItem( currentClass, "knifecamo", ownedMTX ) then
			uploadStats = true
		end
	end
	if uploadStats then
		CoD.CheckClasses.UpdateTrackerLeaderboard( controller )
	end
	return uploadStats
end

CoD.CheckClasses.CheckMTXItem = function ( currentClass, fullSlotName, ownedMTX )
	local itemStat = currentClass[fullSlotName]
	local itemValue = itemStat:get()
	local mtxIsOwned = ownedMTX[tostring( itemValue )]
	local statsModified = false
	if mtxIsOwned ~= nil and mtxIsOwned == false then
		itemStat:set( 0 )
		statsModified = true
	end
	return statsModified
end

CoD.CheckClasses.CheckProbation = function ( controller, playerStats, cacRoot )
	local statsModified = false
	local maxProbationTimePublic = Dvar.probation_public_probationTime:get() * 60
	local maxProbationTimeLeague = Dvar.probation_league_probationTime:get() * 60
	local currentProbationTimePublic = Engine.GetProbationTime( controller, CoD.GAMEMODE_PUBLIC_MATCH )
	local currentProbationTimeLeague = Engine.GetProbationTime( controller, CoD.GAMEMODE_LEAGUE_MATCH )
	if currentProbationTimePublic < 0 or maxProbationTimePublic < currentProbationTimePublic then
		statsModified = true
		playerStats.probation.PUBLICMATCH.timeWhenProbationIsDone:set( 0 )
		playerStats.probation.PUBLICMATCH.count:set( 0 )
	end
	if currentProbationTimeLeague < 0 or maxProbationTimeLeague < currentProbationTimeLeague then
		statsModified = true
		playerStats.probation.LEAGUEMATCH.timeWhenProbationIsDone:set( 0 )
		playerStats.probation.LEAGUEMATCH.count:set( 0 )
	end
	return statsModified
end

CoD.CheckClasses.CheckClasses = function ( self, event )
	local maxControllerCount = Engine.GetMaxControllerCount() - 1
	for controller = 0, maxControllerCount, 1 do
		if Engine.AreStatsFetched( controller ) == 1 then
			local playerStats = CoD.GetPlayerStats( controller )
			local statsModified = false
			if playerStats then
				local rating = playerStats.skill_rating:get()
				if rating >= 20 or rating <= -20 then
					playerStats.skill_rating:set( 0 )
					playerStats.skill_variance:set( 1 )
				end
				local cacRoot = playerStats.cacLoadouts
				cacRoot.iamacheater:set( 0 )
				if CoD.CheckClasses.CheckChallenges( playerStats, controller ) then
					statsModified = true
				end
				if CoD.CheckClasses.CheckItems( playerStats, controller, cacRoot, 9, true ) then
					statsModified = true
				end
				if CoD.CheckClasses.CheckMTXPurchased( controller, playerStats, cacRoot ) then
					statsModified = true
				end
				cacRoot = playerStats.customMatchCacLoadouts
				if CoD.CheckClasses.CheckItems( playerStats, controller, cacRoot, 5, false ) then
					statsModified = true
				end
				if CoD.CheckClasses.CheckMTXPurchased( controller, playerStats, cacRoot ) then
					statsModified = true
				end
				cacRoot = playerStats.leagueCacLoadouts
				if CoD.CheckClasses.CheckItems( playerStats, controller, cacRoot, 5, false ) then
					statsModified = true
				end
				if CoD.CheckClasses.CheckMTXPurchased( controller, playerStats, cacRoot ) then
					statsModified = true
				end
				if CoD.CheckClasses.CheckProbation( controller, playerStats, cacRoot ) then
					statsModified = true
				end
				if statsModified then
					Engine.Exec( controller, "uploadstats" )
				end
			end
		end
	end
end

if not CoD.statsChecker then
	CoD.statsChecker = LUI.UIElement.new()
	LUI.roots.UIRootFull:addElement( CoD.statsChecker )
end
CoD.statsChecker:registerEventHandler( "stats_downloaded", CoD.CheckClasses.CheckClasses )
CoD.statsChecker:registerEventHandler( "class_sets_downloaded", CoD.CheckClasses.CheckClasses )
CoD.statsChecker:registerEventHandler( "elite_cac_import_popup_closed", CoD.CheckClasses.CheckClasses )
CoD.CheckClasses.CheckClasses()
