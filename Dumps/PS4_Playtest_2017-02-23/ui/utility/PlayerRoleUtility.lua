CoD.PlayerRoleUtility = {}
CoD.PlayerRoleUtility.Heroes = {}
CoD.PlayerRoleUtility.Heroes.SmallCategory = 0
CoD.PlayerRoleUtility.Heroes.LargeCategory = 1
CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits = nil
CoD.PlayerRoleUtility.Heroes.heroCustomizationTable = nil
CoD.PlayerRoleUtility.Heroes.selectionTable = nil
CoD.PlayerRoleUtility.Heroes.edittingLoadoutForWidget = nil
CoD.PlayerRoleUtility.Heroes.loadoutListItemWidget = nil
CoD.PlayerRoleUtility.Heroes.heroUpdateEvent = "updateHero"
CoD.PlayerRoleUtility.Heroes.DefaultHelmetBodyOption = 1
CoD.PlayerRoleUtility.Heroes.HeroList = {}
CoD.PlayerRoleUtility.customizationMode = nil
CoD.PlayerRoleUtility.FirstTimeFlowState = LuaEnum.createEnum( "None", "Overview", "SelectionChanged", "Complete" )
CoD.PlayerRoleUtility.PersonalizeHeroData = {}
CoD.PlayerRoleUtility.PersonalizeHeroData.Modes = LuaEnum.createEnum( "ExploringOptions", "EdittingOption" )
CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea = nil
CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingAreaItemIndex = nil
CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingElement = nil
CoD.PlayerRoleUtility.PersonalizeHeroData.CurrentColors = nil
CoD.PlayerRoleUtility.PersonalizeHeroData.MaxWeaponAttachments = 8
CoD.PlayerRoleUtility.PersonalizeHeroData.SpecialistEpicItemIndex = 9
CoD.PlayerRoleUtility.PersonalizeHeroData.CompletionEpicItemIndex = 10
CoD.PlayerRoleUtility.PersonalizeHeroData.SpacerRows = {}
CoD.PlayerRoleUtility.ShowcaseWeaponCategoryIndex = Enum.CharacterItemType.CHARACTER_ITEM_TYPE_COUNT
CoD.PlayerRoleUtility.TauntCategoryIndex = Enum.CharacterItemType.CHARACTER_ITEM_TYPE_COUNT + 1
CoD.PlayerRoleUtility.TauntsData = {}
CoD.PlayerRoleUtility.TauntsData.EdittingTauntOrGestureType = nil
CoD.PlayerRoleUtility.TauntsData.Modes = LuaEnum.createEnum( "ExploringTaunts", "EdittingTaunt", "EdittingGesture" )
CoD.PlayerRoleUtility.TauntsData.GestureTypeAWINames = {
	"GoodGame",
	"Threaten",
	"Boast"
}
CoD.PlayerRoleUtility.TauntsData.GestureTypeDisplayNames = {
	"HEROES_GESTURES_GOOD_GAME",
	"HEROES_GESTURES_THREATEN",
	"HEROES_GESTURES_BOAST"
}
if #CoD.PlayerRoleUtility.TauntsData.GestureTypeAWINames ~= Enum.CharacterGestureTypes.GESTURE_TYPE_COUNT then
	error( "Need gesture type names to match gesture type enums ( " .. #CoD.PlayerRoleUtility.TauntsData.GestureTypeAWINames .. " ~= " .. Enum.CharacterGestureTypes.GESTURE_TYPE_COUNT .. " )" )
end
CoD.PlayerRoleUtility.TauntsData.TauntTypeAWINames = {
	"FirstPlace"
}
if #CoD.PlayerRoleUtility.TauntsData.TauntTypeAWINames ~= Enum.CharacterTauntTypes.TAUNT_TYPE_COUNT then
	error( "Need taunt type names to match taunt type enums ( " .. #CoD.PlayerRoleUtility.TauntsData.TauntTypeAWINames .. " ~= " .. Enum.CharacterGestureTypes.TAUNT_TYPE_COUNT .. " )" )
end
CoD.PlayerRoleUtility.CompletionEpicComplete = function ( controller, heroTable )
	if CoD.isCampaign then
		return false
	end
	local mode = CoD.PrestigeUtility.GetPermanentUnlockMode()
	for _, hero in ipairs( heroTable ) do
		local heroIndex = hero.bodyIndex
		if Engine.IsCharacterCustomizationItemLocked( controller, heroIndex, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY, CoD.PlayerRoleUtility.PersonalizeHeroData.SpecialistEpicItemIndex, mode ) or Engine.IsCharacterCustomizationItemLocked( controller, heroIndex, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET, CoD.PlayerRoleUtility.PersonalizeHeroData.SpecialistEpicItemIndex, mode ) then
			return false
		end
	end
	return true
end

CoD.PlayerRoleUtility.SetEdittingHero = function ( controller, heroIndex )
	if CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits ~= heroIndex then
		CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits = heroIndex
		if heroIndex ~= nil then
			MarkCACPaintshopDataDirtyForEdittingSpecialist( controller )
		end
	end
end

CoD.PlayerRoleUtility.CreatePersonalizeColorDatasource = function ( controller, datasourceName, colorTable, customPropertiesFn )
	DataSources[datasourceName] = DataSourceHelpers.ListSetup( datasourceName, function ( controller )
		local infoTable = {}
		for index, color in ipairs( DataSources[datasourceName].colorTable ) do
			local newItem = {
				models = {
					color = color.red .. " " .. color.green .. " " .. color.blue,
					icon = color.icon or "$white",
					xOfY = Engine.Localize( "MENU_X_OF_Y", index, #DataSources[datasourceName].colorTable )
				},
				properties = {
					optionIndex = index
				}
			}
			if customPropertiesFn then
				local customProperties = customPropertiesFn( index )
				for k, v in pairs( customProperties ) do
					newItem.properties[k] = v
				end
			end
			table.insert( infoTable, newItem )
		end
		return infoTable
	end, true )
	DataSources[datasourceName].colorTable = colorTable
	return datasourceName
end

CoD.PlayerRoleUtility.GetHeaderForLoadoutSlot = function ( slot )
	if slot == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON then
		return "HEROES_HERO_WEAPON_CAPS"
	elseif slot == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET then
		return "HEROES_HERO_ABILITY_CAPS"
	else
		return nil
	end
end

CoD.PlayerRoleUtility.GetHintTextForLoadoutSlot = function ( slot )
	if slot == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON then
		return "HEROES_HERO_WEAPON_HINT"
	elseif slot == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET then
		return "HEROES_HERO_ABILITY_HINT"
	else
		return nil
	end
end

CoD.PlayerRoleUtility.CreateCarouselItemLoadoutDatasource = function ( infoTable, mode, controller )
	local datasourceName = "HeroCarouselItemLoadoutList" .. infoTable.properties.heroIndex
	DataSources[datasourceName] = DataSourceHelpers.ListSetup( datasourceName, function ( controller )
		local dataTable = {}
		local selectedSlot = Engine.GetLoadoutTypeForHero( controller, infoTable.properties.heroIndex )
		for i = 0, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_COUNT - 1, 1 do
			local loadoutSlotInfo = Engine.GetLoadoutInfoForHero( mode, infoTable.properties.heroIndex, i )
			local isLocked = false
			if IsProgressionEnabled( controller ) or IsLive() and IsFirstTimeSetup( controller, Enum.eModes.MODE_MULTIPLAYER ) then
				if loadoutSlotInfo ~= nil then
					isLocked = Engine.IsItemLocked( controller, loadoutSlotInfo.itemIndex, Enum.eModes.MODE_MULTIPLAYER )
				else
					isLocked = false
				end
			end
			if loadoutSlotInfo then
				table.insert( dataTable, {
					models = {
						name = loadoutSlotInfo.itemName,
						gameImageOff = loadoutSlotInfo.gameImageOff,
						gameImageOn = loadoutSlotInfo.gameImageOn,
						description = loadoutSlotInfo.itemDesc,
						header = CoD.PlayerRoleUtility.GetHeaderForLoadoutSlot( i ),
						equippedSlot = i,
						itemIndex = loadoutSlotInfo.itemIndex,
						disabled = isLocked,
						itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM
					},
					properties = {
						equippedSlot = i,
						hintText = CoD.PlayerRoleUtility.GetHintTextForLoadoutSlot( i ),
						selectIndex = selectedSlot == i,
						heroIndex = infoTable.properties.heroIndex
					}
				} )
			end
		end
		return dataTable
	end, true )
	return datasourceName
end

CoD.PlayerRoleUtility.GetTransmissionNewStatPath = function ( heroIndex, transmissionIndex )
	return "specialiststats." .. heroIndex .. ".transmissionIsOld." .. transmissionIndex
end

CoD.PlayerRoleUtility.IsTransmissionNew = function ( controller, heroIndex, transmissionIndex )
	return IsStorageValueEqualTo( controller, "stats_mp", CoD.PlayerRoleUtility.GetTransmissionNewStatPath( heroIndex, transmissionIndex ), 0 )
end

CoD.PlayerRoleUtility.GetTransmissionNewCount = function ( controller, heroIndex, heroData )
	local transmissionCount = heroData.transmissions or 0
	local newCount = 0
	for i = 0, transmissionCount - 1, 1 do
		local transmissionLocked, transmissionLockedByChallenge = Engine.IsSpecialistTransmissionLocked( controller, heroIndex, i + 1 )
		if transmissionLocked then
			break
		elseif CoD.PlayerRoleUtility.IsTransmissionNew( controller, heroIndex, i ) then
			newCount = newCount + 1
		end
	end
	return newCount
end

CoD.PlayerRoleUtility.CreateCarouselCardBackDatasource = function ( infoTable, heroInfo, mode, controller, bundleData, completionEpicComplete )
	local datasourceName = "HeroCarouselCardBackList" .. infoTable.properties.heroIndex
	DataSources[datasourceName] = DataSourceHelpers.ListSetup( datasourceName, function ( controller )
		local dataTable = {}
		local getNewListItem = function ( title, image, additionalModelFields, additionalPropertyFields )
			local newItem = {
				models = {
					text = title,
					icon = image
				},
				properties = {}
			}
			if additionalModelFields then
				for k, v in pairs( additionalModelFields ) do
					newItem.models[k] = v
				end
			end
			newItem.models.alias = newItem.models.alias or ""
			if additionalPropertyFields then
				for k, v in pairs( additionalPropertyFields ) do
					newItem.properties[k] = v
				end
			end
			return newItem
		end
		
		local getIndexString = function ( primaryIndex, secondaryIndex, displayString )
			return Engine.Localize( "HEROES_CARD_BACK_ENTRY", primaryIndex, secondaryIndex, displayString or "" )
		end
		
		local primaryIndex = 1
		local weapon = Engine.GetLoadoutInfoForHero( mode, infoTable.properties.heroIndex, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
		local ability = Engine.GetLoadoutInfoForHero( mode, infoTable.properties.heroIndex, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET )
		if IsProgressionEnabled( controller ) then
			local statsItem = getNewListItem( getIndexString( primaryIndex, 1, "HEROES_SIMULATION" ), "t7_hud_hero_icon_filetype_stats", {
				cardBackIcon = heroInfo.cardBackIcon,
				realName = heroInfo.realName,
				age = heroInfo.age,
				genderString = heroInfo.genderString,
				frameWidget = "CoD.ChooseCharacterLoadout_CardBack_Stats"
			}, nil )
			if weapon then
				statsItem.models.weaponName = weapon.itemName
				statsItem.models.weaponKills = CombatRecordGetItemStatForItemIndex( controller, "kills", weapon.itemIndex )
				statsItem.models.weaponKillsPerUse = CombatRecordGetTwoStatRatioForItemIndex( controller, "kills", "used", weapon.itemIndex )
				statsItem.models.weaponKillsPerDeath = CombatRecordGetTwoStatRatioForItemIndex( controller, "kills", "deathsDuringUse", weapon.itemIndex )
			end
			if ability then
				statsItem.models.abilityName = ability.itemName
				statsItem.models.abilityKills = CombatRecordGetItemStatForItemIndex( controller, "combatRecordStat", ability.itemIndex )
				statsItem.models.abilityKillsLabel = ability.itemName .. "_KILL_TYPE"
				statsItem.models.abilityKillsPerUse = CombatRecordGetTwoStatRatioForItemIndex( controller, "combatRecordStat", "used", ability.itemIndex )
				statsItem.models.abilityKillsPerUseLabel = ability.itemName .. "_KILL_TYPE_PER_USE"
			end
			table.insert( dataTable, statsItem )
			primaryIndex = primaryIndex + 1
		end
		table.insert( dataTable, getNewListItem( getIndexString( primaryIndex, 1, "HEROES_BIO" ), "t7_hud_hero_icon_filetype_text", {
			cardBackIcon = heroInfo.cardBackIcon,
			realName = heroInfo.realName,
			age = heroInfo.age,
			genderString = heroInfo.genderString,
			bio = heroInfo.bio,
			frameWidget = "CoD.ChooseCharacterLoadout_CardBack_Bio"
		}, nil ) )
		primaryIndex = primaryIndex + 1
		if weapon then
			table.insert( dataTable, getNewListItem( getIndexString( primaryIndex, 1, weapon.itemName ), "t7_hud_hero_icon_filetype_details", {
				weaponSubItem = getIndexString( primaryIndex, 3, heroInfo.weaponSubItemDesc ),
				weaponCardBackIcon = heroInfo.weaponCardBackIcon or "blacktransparent",
				weaponCardBackSubIcon = heroInfo.weaponCardBackSubIcon or "blacktransparent",
				weaponDesc = heroInfo.weaponCardBackDesc,
				weaponSchemaTitle = getIndexString( primaryIndex, 2, "HEROES_SCHEMA" ),
				weaponSchema = heroInfo.weaponSchema,
				frameWidget = "CoD.ChooseCharacterLoadout_CardBack_Weapon"
			}, nil ) )
		end
		primaryIndex = primaryIndex + 1
		if ability then
			table.insert( dataTable, getNewListItem( getIndexString( primaryIndex, 1, ability.itemName ), "t7_hud_hero_icon_filetype_details", {
				abilitySubItem = getIndexString( primaryIndex, 3, heroInfo.abilitySubItemDesc ),
				abilityCardBackIcon = heroInfo.abilityCardBackIcon or "blacktransparent",
				abilityCardBackSubIcon = heroInfo.abilityCardBackSubIcon or "blacktransparent",
				abilityDesc = heroInfo.abilityCardBackDesc,
				abilitySchemaTitle = getIndexString( primaryIndex, 2, "HEROES_SCHEMA" ),
				abilitySchema = heroInfo.abilitySchema,
				frameWidget = "CoD.ChooseCharacterLoadout_CardBack_Ability"
			}, nil ) )
		end
		primaryIndex = primaryIndex + 1
		if IsProgressionEnabled( controller ) then
			local createTransmissionContactDataSource = function ( heroIndex, transmissionIndex, primaryIndex, secondaryIndexStart )
				local dName = "TransmissionContactList_" .. heroIndex .. "_" .. transmissionIndex
				DataSources[dName] = DataSourceHelpers.ListSetup( dName, function ( controller )
					local contacts = {}
					local contactCount = bundleData["transmission" .. transmissionIndex .. "ContactsCount"] or 0
					for i = 0, contactCount - 1, 1 do
						table.insert( contacts, {
							models = {
								contactIcon = bundleData["transmission" .. transmissionIndex .. "Contact" .. i .. "Image"],
								contactName = Engine.Localize( "HEROES_CONTACT_X", primaryIndex, secondaryIndexStart + i, bundleData["transmission" .. transmissionIndex .. "Contact" .. i .. "Name"] )
							}
						} )
					end
					return contacts
				end )
				return dName
			end
			
			local transmissionCount = bundleData.transmissions or 0
			for i = 0, transmissionCount - 1, 1 do
				local transmissionLocked, transmissionLockedByChallenge = nil
				if Dvar.allItemsUnlocked:get() then
					transmissionLocked = false
				else
					transmissionLocked, transmissionLockedByChallenge = Engine.IsSpecialistTransmissionLocked( controller, infoTable.properties.heroIndex, i + 1 )
				end
				if not transmissionLocked then
					local icon, transmissionFrequency = nil
					if i == 4 then
						transmissionFrequency = bundleData["transmission" .. i .. "ID"] or ""
						icon = "t7_menu_hero_bio_headshot_unknown"
					else
						transmissionFrequency = (bundleData.characterFrequency or "") .. "." .. (bundleData["transmission" .. i .. "ID"] or "")
						icon = heroInfo.cardBackIcon
					end
					table.insert( dataTable, getNewListItem( getIndexString( primaryIndex, 1, "HEROES_TRANSMISSION" ), "t7_hud_hero_icon_filetype_audio", {
						cardBackIcon = icon,
						transmissionName = Engine.Localize( "HEROES_TRANSMISSION_X", primaryIndex, 1, bundleData["transmission" .. i .. "Name"] or "" ),
						contactsListDatasource = createTransmissionContactDataSource( infoTable.properties.heroIndex, i, primaryIndex, 2 ),
						transmissionSynopsis = bundleData["transmission" .. i .. "Synopsis"] or "",
						transmissionFrequency = transmissionFrequency,
						alias = bundleData["transmission" .. i .. "Alias"],
						frameWidget = "CoD.ChooseCharacterLoadout_CardBack_Transmission",
						playingSound = false,
						isNew = CoD.PlayerRoleUtility.IsTransmissionNew( controller, heroInfo.bodyIndex, i )
					}, {
						transmissionIndex = i,
						heroIndex = heroInfo.bodyIndex
					} ) )
				elseif transmissionLockedByChallenge then
					local assignmentAccessString = "HEROES_COMPLETE_ASSIGNMENT_FOR_TRANSMISSION"
					local assignment = ""
					local assignmentProgress = ""
					local assignmentProgressString = ""
					local tableName = CoD.getStatsMilestoneTable( transmissionLockedByChallenge.challengeTable + 1, CoD.PrestigeUtility.GetPermanentUnlockMode() )
					if i == 0 then
					
					elseif i == 4 or i == 3 and not completionEpicComplete then
						assignmentAccessString = "HEROES_ASSIGNMENT_CLASSIFIED"
					else
						assignment = Engine.Localize( Engine.TableLookupGetColumnValueForRow( tableName, transmissionLockedByChallenge.challengeRow, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_STRING ), transmissionLockedByChallenge.targetValue, heroInfo.displayName )
					end
					assignment = Engine.Localize( Engine.TableLookupGetColumnValueForRow( tableName, transmissionLockedByChallenge.challengeRow, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_STRING ) .. "_DESC", transmissionLockedByChallenge.targetValue, heroInfo.displayName )
					assignmentProgress = transmissionLockedByChallenge.currentValue / transmissionLockedByChallenge.targetValue
					assignmentProgressString = Engine.Localize( "MENU_X_SLASH_Y", transmissionLockedByChallenge.currentValue, transmissionLockedByChallenge.targetValue )
				end
				primaryIndex = primaryIndex + 1
			end
		end
		return dataTable
	end, true )
	return datasourceName
end

CoD.PlayerRoleUtility.CreateSelectedItemModel = function ( controller, customizationTable, equippedInfo, heroIndex, itemSlot )
	local categoryName = ""
	local selectionName = ""
	local colorTable = ""
	if itemSlot == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
		categoryName = "HEROES_BODY"
		local bodyInfo = customizationTable.bodies[equippedInfo.selectedBody + 1]
		if bodyInfo then
			selectionName = bodyInfo.name
			local selectedColorTable = {}
			for index, colorIndex in ipairs( equippedInfo.bodyColors ) do
				table.insert( selectedColorTable, bodyInfo.accents[index][colorIndex + 1] )
			end
			colorTable = CoD.PlayerRoleUtility.CreatePersonalizeColorDatasource( controller, "PersonalizeListSelection_" .. heroIndex .. "_" .. itemSlot, selectedColorTable, nil )
		end
	elseif itemSlot == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
		categoryName = "HEROES_HEAD"
		local helmetInfo = customizationTable.helmets[equippedInfo.selectedHelmet + 1]
		if helmetInfo then
			selectionName = helmetInfo.name
			local selectedColorTable = {}
			for index, colorIndex in ipairs( equippedInfo.helmetColors ) do
				table.insert( selectedColorTable, helmetInfo.accents[index][colorIndex + 1] )
			end
			colorTable = CoD.PlayerRoleUtility.CreatePersonalizeColorDatasource( controller, "PersonalizeListSelection_" .. heroIndex .. "_" .. itemSlot, selectedColorTable, nil )
		end
	else
		return nil
	end
	return {
		categoryName = categoryName,
		currentSelectionName = selectionName,
		colorListDatasource = colorTable
	}
end

CoD.PlayerRoleUtility.GetHeroEquippedSlot = function ( controller, itemIndex )
	local mode = CoD.PlayerRoleUtility.customizationMode
	local heroIndex = CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits
	local equippedSlot = nil
	for i = 0, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_COUNT - 1, 1 do
		local loadoutSlotInfo = Engine.GetLoadoutInfoForHero( mode, heroIndex, i )
		if loadoutSlotInfo.itemIndex == itemIndex then
			equippedSlot = i
			break
		end
	end
	return equippedSlot
end

CoD.PlayerRoleUtility.GetHeroList = function ( mode )
	if not mode then
		mode = CoD.PlayerRoleUtility.customizationMode
	end
	if not CoD.PlayerRoleUtility.Heroes.HeroList[mode] then
		CoD.PlayerRoleUtility.Heroes.HeroList[mode] = Engine.GetHeroList( mode )
	end
	return CoD.PlayerRoleUtility.Heroes.HeroList[mode]
end

CoD.PlayerRoleUtility.GetFirstHeroFromHeroList = function ( mode )
	if not CoD.PlayerRoleUtility.FirstHeroCharacterIndex then
		local heroList = CoD.PlayerRoleUtility.GetHeroList( mode )
		CoD.PlayerRoleUtility.FirstHeroCharacterIndex = heroList[1].bodyIndex
	end
	return CoD.PlayerRoleUtility.FirstHeroCharacterIndex
end

CoD.PlayerRoleUtility.PersonalizeHeroData.HeroCustomizationTabCategories = {
	"standard",
	"loot"
}
DataSources.HeroCustomizationTabs = DataSourceHelpers.ListSetup( "HeroCustomizationTabs", function ( controller )
	local tabList = {}
	local addModeTab = function ( tabName, isBlackMarket, filterName )
		table.insert( tabList, {
			models = {
				tabName = tabName,
				tabIcon = "",
				breadcrumbCount = 0
			},
			properties = {
				isBlackMarket = isBlackMarket,
				selectIndex = not isBlackMarket,
				filterName = filterName
			}
		} )
	end
	
	table.insert( tabList, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	addModeTab( "MPUI_STANDARD_CAPS", false, CoD.PlayerRoleUtility.PersonalizeHeroData.HeroCustomizationTabCategories[1] )
	if IsLive() then
		addModeTab( "MENU_BLACK_MARKET", true, CoD.PlayerRoleUtility.PersonalizeHeroData.HeroCustomizationTabCategories[2] )
	end
	table.insert( tabList, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return tabList
end, false )
CoD.PlayerRoleUtility.PersonalizeHeroData.StandardFilter = function ( itemModel )
	local isBMItem = CoD.SafeGetModelValue( itemModel, "isBMItem" )
	return isBMItem == nil
end

CoD.PlayerRoleUtility.PersonalizeHeroData.BlackMarketFilter = function ( itemModel )
	local isBMItem = CoD.SafeGetModelValue( itemModel, "isBMItem" )
	local f25_local0
	if isBMItem == nil or isBMItem ~= true then
		f25_local0 = false
	else
		f25_local0 = true
	end
	return f25_local0
end

CoD.PlayerRoleUtility.PersonalizeCharacterListPrepare = function ( controller )
	local infoTable = {}
	CoD.PlayerRoleUtility.PersonalizeHeroData.SpacerRows = {}
	local getPrimaryItemRow = function ( area, categoryName, currentSelectionName, currentSelectionVariantName, categoryDesc, categoryImage, disabled )
		local currentSelectionNameAlpha = 0
		if currentSelectionName then
			currentSelectionNameAlpha = 1
		end
		local currentSelectionVariantNameAlpha = 0
		if currentSelectionVariantName then
			currentSelectionVariantNameAlpha = 1
		end
		return {
			models = {
				categoryName = categoryName,
				categoryImage = categoryImage,
				fullCategoryName = categoryName,
				categoryDesc = categoryDesc or "",
				currentSelectionName = currentSelectionName or "",
				currentSelectionVariantName = currentSelectionVariantName or "",
				colorListDatasource = "",
				currentSelectionNameAlpha = currentSelectionNameAlpha,
				currentSelectionVariantNameAlpha = currentSelectionVariantNameAlpha
			},
			properties = {
				customizationArea = area,
				colorRow = false,
				disabled = disabled
			}
		}
	end
	
	local getColorItemRow = function ( area, categoryName, currentSelectionName, currentSelectionVariantName, categoryDesc, fullCategoryName )
		local updateColors = function ( element )
			local colorTable = {}
			if CoD.PlayerRoleUtility.Heroes.heroCustomizationTable and CoD.PlayerRoleUtility.Heroes.selectionTable then
				local item, selectionTable = nil
				if area == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
					item = CoD.PlayerRoleUtility.Heroes.heroCustomizationTable.bodies[CoD.PlayerRoleUtility.Heroes.selectionTable.selectedBody + 1]
					selectionTable = CoD.PlayerRoleUtility.Heroes.selectionTable.bodyColors
				elseif area == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
					item = CoD.PlayerRoleUtility.Heroes.heroCustomizationTable.helmets[CoD.PlayerRoleUtility.Heroes.selectionTable.selectedHelmet + 1]
					selectionTable = CoD.PlayerRoleUtility.Heroes.selectionTable.helmetColors
				end
				if item then
					for index, selection in ipairs( selectionTable ) do
						table.insert( colorTable, item.accents[index][selection + 1] )
					end
				end
			end
			local datasourceName = "PersonalizeCharacterColors_" .. area
			if DataSources[datasourceName] then
				DataSources[datasourceName].colorTable = colorTable
				if element then
					element:updateDatasource()
				end
				return datasourceName
			else
				return CoD.PlayerRoleUtility.CreatePersonalizeColorDatasource( controller, datasourceName, colorTable )
			end
		end
		
		local currentSelectionNameAlpha = 0
		if currentSelectionName then
			currentSelectionNameAlpha = 1
		end
		local currentSelectionVariantNameAlpha = 0
		if currentSelectionVariantName then
			currentSelectionVariantNameAlpha = 1
		end
		local colorTable = {}
		local selectedColorList = nil
		return {
			models = {
				categoryName = categoryName,
				categoryImage = "",
				fullCategoryName = fullCategoryName,
				colorListDatasource = updateColors(),
				categoryDesc = categoryDesc or "",
				currentSelectionName = currentSelectionName or "",
				currentSelectionVariantName = currentSelectionVariantName or "",
				currentSelectionNameAlpha = currentSelectionNameAlpha,
				currentSelectionVariantNameAlpha = currentSelectionVariantNameAlpha
			},
			properties = {
				customizationArea = area,
				colorRow = true,
				updateColors = updateColors
			}
		}
	end
	
	local GetShowcaseWeaponName = function ( controller )
		local mode = CoD.PlayerRoleUtility.customizationMode
		local heroIndex = CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits
		local weaponNameInfo = {}
		local weaponIndex = Engine.GetHeroShowcaseWeaponAttribute( controller, mode, heroIndex, "weaponIndex" )
		weaponNameInfo.baseWeaponName = Engine.Localize( Engine.GetItemName( weaponIndex ) )
		weaponNameInfo.variantName = Engine.GetHeroShowcaseWeaponVariantName( controller, mode, heroIndex )
		return weaponNameInfo
	end
	
	if CoD.PlayerRoleUtility.Heroes.heroCustomizationTable and CoD.PlayerRoleUtility.Heroes.selectionTable then
		local head = CoD.PlayerRoleUtility.Heroes.heroCustomizationTable.helmets[CoD.PlayerRoleUtility.Heroes.selectionTable.selectedHelmet + 1]
		if head then
			local f26_local0 = CoD.PlayerRoleUtility.customizationMode
			local f26_local1 = Enum.eModes.MODE_CAMPAIGN
			local f26_local2 = "HEROES_HELMET"
			local headString = "HEROES_HEAD"
			local primaryItemRow = getPrimaryItemRow( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET, REG19 and f26_local2 or headString, head.name, nil, nil, "uie_t7_menu_mp_hero_graphic_head" )
			local newItemCountTable = Engine.CharacterCustomizationNewItemCount( controller, CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET )
			primaryItemRow.models.breadcrumbCount = newItemCountTable.total
			table.insert( infoTable, primaryItemRow )
			if #CoD.PlayerRoleUtility.Heroes.selectionTable.helmetColors >= 1 and #head.accents[1] > 1 then
				local variant = head.accents[1][CoD.PlayerRoleUtility.Heroes.selectionTable.helmetColors[1] + 1]
				table.insert( infoTable, getColorItemRow( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET, "HEROES_COLORS", variant.name, nil, nil, "HEROES_HELMET_COLORS" ) )
			end
			CoD.PlayerRoleUtility.PersonalizeHeroData.SpacerRows[#infoTable] = true
		end
		local body = CoD.PlayerRoleUtility.Heroes.heroCustomizationTable.bodies[CoD.PlayerRoleUtility.Heroes.selectionTable.selectedBody + 1]
		if body then
			local primaryItemRow = getPrimaryItemRow( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY, "HEROES_BODY", body.name, nil, nil, "uie_t7_menu_mp_hero_graphic_body" )
			local newItemCountTable = Engine.CharacterCustomizationNewItemCount( controller, CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY )
			primaryItemRow.models.breadcrumbCount = newItemCountTable.total
			table.insert( infoTable, primaryItemRow )
			if #CoD.PlayerRoleUtility.Heroes.selectionTable.bodyColors >= 1 and #body.accents[1] > 1 then
				local variant = body.accents[1][CoD.PlayerRoleUtility.Heroes.selectionTable.bodyColors[1] + 1]
				table.insert( infoTable, getColorItemRow( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY, "HEROES_COLORS", variant.name, nil, nil, "HEROES_BODY_COLORS" ) )
			end
			CoD.PlayerRoleUtility.PersonalizeHeroData.SpacerRows[#infoTable] = true
		end
		if CoD.PlayerRoleUtility.customizationMode == Enum.eModes.MODE_MULTIPLAYER then
			local weaponNameInfo = GetShowcaseWeaponName( controller )
			local showcaseWeaponDesc = Engine.Localize( "HEROES_SHOWCASE_WEAPON_DESC", Engine.Localize( Engine.GetHeroName( CoD.PlayerRoleUtility.customizationMode, CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits ) ) )
			table.insert( infoTable, getPrimaryItemRow( CoD.PlayerRoleUtility.ShowcaseWeaponCategoryIndex, "HEROES_SHOWCASE_WEAPON", weaponNameInfo.baseWeaponName, weaponNameInfo.variantName, showcaseWeaponDesc, "uie_t7_menu_mp_hero_graphic_showcase" ) )
			CoD.PlayerRoleUtility.PersonalizeHeroData.SpacerRows[#infoTable] = true
			local heroData = Engine.GetHeroBundleInfo( CoD.PlayerRoleUtility.customizationMode, CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits )
			local f26_local3 = getPrimaryItemRow
			local f26_local4 = CoD.PlayerRoleUtility.TauntCategoryIndex
			local f26_local5 = "HEROES_TAUNTS_AND_GESTURES"
			local f26_local6, f26_local7, f26_local8 = nil
			local f26_local9 = "uie_t7_menu_mp_hero_graphic_taunt"
			local f26_local10
			if not CoD.PlayerRoleUtility.TauntsData.CharacterHasAnyGestures( heroData ) then
				f26_local10 = not CoD.PlayerRoleUtility.TauntsData.CharacterHasAnyTaunts( heroData )
			else
				f26_local10 = false
			end
			local primaryItemRow = f26_local3( f26_local4, f26_local5, f26_local6, f26_local7, f26_local8, f26_local9, f26_local10 )
			primaryItemRow.models.breadcrumbCount = CoD.PlayerRoleUtility.GetTauntsAndGesturesNewCount( controller, CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits, heroData, CoD.PlayerRoleUtility.customizationMode )
			table.insert( infoTable, primaryItemRow )
		end
	end
	if CoD.PlayerRoleUtility.customizationMode == Enum.eModes.MODE_CAMPAIGN then
		local getHeadItemRow = function ( categoryName, categoryImage, disabled )
			return {
				models = {
					categoryName = categoryName,
					categoryImage = categoryImage,
					fullCategoryName = "",
					categoryDesc = "",
					currentSelectionName = "",
					colorListDatasource = "",
					currentSelectionNameAlpha = 0,
					currentSelectionVariantNameAlpha = 0
				},
				properties = {
					colorRow = false,
					headItem = true,
					disabled = disabled
				}
			}
		end
		
		table.insert( infoTable, getHeadItemRow( "HEROES_CHANGE_CHARACTER", "uie_t7_menu_mp_hero_graphic_face" ) )
		CoD.PlayerRoleUtility.PersonalizeHeroData.SpacerRows[#infoTable] = true
	end
	return infoTable
end

local PersonalizeCharacter_CustomListFns = {
	getSpacerAfterRow = function ( list, row, height )
		if CoD.PlayerRoleUtility.PersonalizeHeroData.SpacerRows[row] then
			return 7
		else
			
		end
	end
}
CoD.PlayerRoleUtility.getBasePersonalizationItemModels = function ( index, name, image, color )
	return {
		models = {
			name = name,
			image = image or "$white",
			color = color,
			optionIndex = index
		},
		properties = {}
	}
end

DataSources.CharacterCustomizationButtonList = DataSourceHelpers.ListSetup( "CharacterCustomizationButtonList", CoD.PlayerRoleUtility.PersonalizeCharacterListPrepare, true, PersonalizeCharacter_CustomListFns )
CoD.PlayerRoleUtility.IsMissionCompleted = function ( controller, missionName )
	local currentStats = Engine.GetPlayerStats( controller, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_CAMPAIGN )
	return currentStats.PlayerStatsByMap[missionName].hasBeenCompleted:get() ~= 0
end

CoD.PlayerRoleUtility.IsBodyOrHelmetAccessible = function ( controller, styleType, index, totalItemCount )
	if CoD.PlayerRoleUtility.customizationMode == Enum.eModes.MODE_CAMPAIGN or Engine.IsCampaignGame() then
		local statsMilestones2 = CoD.getStatsMilestoneTable( 2, Enum.eModes.MODE_CAMPAIGN )
		local styleTypeCol = 1
		local itemIndexCol = 2
		local missionNameCol = 3
		local rows = Engine.TableFindRows( statsMilestones2, styleTypeCol, styleType )
		if rows ~= nil then
			for rowIndex, row in ipairs( rows ) do
				local itemIndex = Engine.TableLookupGetColumnValueForRow( statsMilestones2, row, itemIndexCol )
				local missionName = Engine.TableLookupGetColumnValueForRow( statsMilestones2, row, missionNameCol )
				if itemIndex + 1 == index and (missionName == "none" or CoD.PlayerRoleUtility.IsMissionCompleted( controller, missionName )) then
					return true
				end
			end
		end
		return false
	elseif CoD.PlayerRoleUtility.customizationMode == Enum.eModes.MODE_MULTIPLAYER then
		if IsProgressionEnabled( controller ) then
			if index == CoD.PlayerRoleUtility.PersonalizeHeroData.CompletionEpicItemIndex then
				local characterIndex = CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits
				local characterItemType = CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea
				return not Engine.IsCharacterCustomizationItemLocked( controller, characterIndex, characterItemType, CoD.PlayerRoleUtility.PersonalizeHeroData.SpecialistEpicItemIndex )
			else
				return true
			end
		else
			local f35_local3
			if index == CoD.PlayerRoleUtility.PersonalizeHeroData.SpecialistEpicItemIndex or index == CoD.PlayerRoleUtility.PersonalizeHeroData.CompletionEpicItemIndex then
				f35_local3 = false
			else
				f35_local3 = true
			end
		end
		return f35_local3
	else
		return true
	end
end

CoD.PlayerRoleUtility.HeroOptionsListPrepare = function ( controller )
	local infoTable = {}
	local heroTable = Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER )
	local completionEpicLockedNotClassified = CoD.PlayerRoleUtility.CompletionEpicComplete( controller, heroTable )
	local getItemInfo = function ( index, name, icon, color, selected )
		local item = CoD.PlayerRoleUtility.getBasePersonalizationItemModels( index, name, icon or "$white", color or "255 255 255" )
		item.properties.optionIndex = index
		item.properties.isColorOption = color ~= nil
		item.models.isColorOption = color ~= nil
		item.properties.selectIndex = selected
		if not item.properties.isColorOption then
			item.models.itemExtraCamInfo = "" .. CoD.PlayerRoleUtility.customizationMode .. ":" .. CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits .. ":" .. CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea .. ":" .. index - 1 .. ":" .. controller
		else
			item.models.itemExtraCamInfo = ""
		end
		local characterIndex = CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits
		local characterItemType = CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea
		if IsProgressionEnabled( controller ) and CoD.PlayerRoleUtility.Heroes.DefaultHelmetBodyOption < index then
			local isLocked = false
			if not item.properties.isColorOption then
				isLocked = Engine.IsCharacterCustomizationItemLocked( controller, characterIndex, characterItemType, index )
			end
			item.models.isLocked = isLocked
			item.models.isClassified = false
			if not IsCampaign() and index == CoD.PlayerRoleUtility.PersonalizeHeroData.CompletionEpicItemIndex then
				item.models.isClassified = not completionEpicLockedNotClassified
				if item.models.isClassified == true then
					item.models.name = "MENU_CLASSIFIED"
				end
			end
			if not item.models.isClassified then
				local unlockInfoTable = Engine.GetCharacterCustomizationItemUnlockInfo( controller, characterIndex, characterItemType, index )
				if unlockInfoTable then
					item.models.unlockDescription = unlockInfoTable.unlockDescription
					item.models.unlockReward = unlockInfoTable.unlockReward
					item.models.unlockProgressAndTarget = unlockInfoTable.unlockProgressAndTarget
				end
			end
		end
		if CoD.PlayerRoleUtility.customizationMode == Enum.eModes.MODE_MULTIPLAYER and CoD.PlayerRoleUtility.PersonalizeHeroData.CompletionEpicItemIndex < index then
			local heroList = Engine.GetHeroList( CoD.PlayerRoleUtility.customizationMode )
			local heroName = ""
			for _, hero in ipairs( heroList ) do
				if hero.bodyIndex == CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits then
					heroName = hero.assetName
				end
			end
			f37_local0 = Engine.GetHeroItemInfo( CoD.PlayerRoleUtility.customizationMode, characterIndex, characterItemType, index - 1 )
			local assetName = f37_local0.assetName
			local lootItemName = assetName .. ";" .. heroName
			if CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( lootItemName ) then
				return nil
			end
			item.models.isBMItem = true
			item.models.isBMClassified = CoD.BlackMarketUtility.IsItemLocked( controller, lootItemName )
			if item.models.isBMClassified then
				item.models.name = CoD.BlackMarketUtility.ClassifiedName()
				item.models.rarityType = {
					rarity = "",
					duplicateCount = 0
				}
			end
			item.models.rarityType = {
				rarity = CoD.BlackMarketUtility.GetRarityForLootItemFromName( lootItemName ),
				duplicateCount = CoD.BlackMarketUtility.GetItemQuantity( controller, lootItemName )
			}
		else
			item.models.rarityType = {
				rarity = "",
				duplicateCount = 0
			}
		end
		return item
	end
	
	if CoD.PlayerRoleUtility.Heroes.heroCustomizationTable and CoD.PlayerRoleUtility.Heroes.selectionTable and CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea and CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingElement then
		local baseTable, selectedBaseItem, selectedColorIndex, styleType = nil
		if Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY == CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea then
			baseTable = CoD.PlayerRoleUtility.Heroes.heroCustomizationTable.bodies
			styleType = "bodystyle"
			selectedBaseItem = CoD.PlayerRoleUtility.Heroes.selectionTable.selectedBody + 1
			if CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingAreaItemIndex then
				selectedColorIndex = CoD.PlayerRoleUtility.Heroes.selectionTable.bodyColors[CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingAreaItemIndex] + 1
			end
		elseif Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET == CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea then
			baseTable = CoD.PlayerRoleUtility.Heroes.heroCustomizationTable.helmets
			styleType = "helmetstyle"
			selectedBaseItem = CoD.PlayerRoleUtility.Heroes.selectionTable.selectedHelmet + 1
			if CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingAreaItemIndex then
				selectedColorIndex = CoD.PlayerRoleUtility.Heroes.selectionTable.helmetColors[CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingAreaItemIndex] + 1
			end
		end
		if baseTable then
			if CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingAreaItemIndex then
				local accentTable = baseTable[selectedBaseItem].accents[CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingAreaItemIndex]
				if accentTable then
					for index, item in ipairs( accentTable ) do
						table.insert( infoTable, getItemInfo( index, item.name, item.icon, item.red .. " " .. item.green .. " " .. item.blue, index == selectedColorIndex ) )
					end
				end
			else
				for index, item in ipairs( baseTable ) do
					if item.name and CoD.PlayerRoleUtility.IsBodyOrHelmetAccessible( controller, styleType, index, #baseTable ) then
						local itemInfo = getItemInfo( index, item.name, item.icon, nil, selectedBaseItem == index )
						if itemInfo ~= nil then
							table.insert( infoTable, itemInfo )
						end
					end
				end
			end
		end
	end
	return infoTable
end

DataSources.HeroChooseOptionButtonList = DataSourceHelpers.ListSetup( "HeroCustomizationOptionList", CoD.PlayerRoleUtility.HeroOptionsListPrepare, true )
CoD.PlayerRoleUtility.CharacterCustomizationColorSetListPrepare = function ( controller )
	local infoTable = {}
	local getItemInfo = function ( index, name, icon, color )
		local item = CoD.PlayerRoleUtility.getBasePersonalizationItemModels( index, name, icon or "$white", color or "255 255 255" )
		item.properties.optionIndex = index
		item.properties.isColorOption = color ~= nil
		return item
	end
	
	if CoD.PlayerRoleUtility.Heroes.heroCustomizationTable and CoD.PlayerRoleUtility.Heroes.selectionTable and CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea and CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingElement then
		local baseTable, selectedBaseItem, selectionColors = nil
		if CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
			baseTable = CoD.PlayerRoleUtility.Heroes.heroCustomizationTable.bodies
			selectedBaseItem = CoD.PlayerRoleUtility.Heroes.selectionTable.selectedBody + 1
			selectionColors = CoD.PlayerRoleUtility.Heroes.selectionTable.bodyColors
		elseif CoD.PlayerRoleUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
			baseTable = CoD.PlayerRoleUtility.Heroes.heroCustomizationTable.helmets
			selectedBaseItem = CoD.PlayerRoleUtility.Heroes.selectionTable.selectedHelmet + 1
			selectionColors = CoD.PlayerRoleUtility.Heroes.selectionTable.helmetColors
		end
		if baseTable then
			local accentTable = baseTable[selectedBaseItem].accents
			for index, accentColors in ipairs( accentTable ) do
				local customColorProperties = table.insert( infoTable, {
					models = {
						colorIndex = index,
						colorListDatasource = CoD.PlayerRoleUtility.CreatePersonalizeColorDatasource( controller, "PersonalizeCharacterColorOptions_" .. index, accentColors, function ()
							return {
								colorTableIndex = index
							}
						end
						 ),
						selectedColor = selectionColors[index] + 1
					}
				} )
			end
		end
	end
	return infoTable
end

DataSources.CharacterCustomizationColorSetList = DataSourceHelpers.ListSetup( "CharacterCustomizationColorSetList", CoD.PlayerRoleUtility.CharacterCustomizationColorSetListPrepare, true )
CoD.PlayerRoleUtility.PersonalizeHeroData.SetHeroShowcaseWeapon = function ( controller, weaponIndex, variantName, attachmentTable, attachmentVariantTable, camoIndex, paintjobSlot, paintjobIndex )
	local mode = CoD.PlayerRoleUtility.customizationMode
	local heroIndex = CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits
	if not variantName then
		variantName = ""
	end
	if not attachmentTable or #attachmentTable == 0 then
		attachmentTable = {}
		for i = 1, CoD.PlayerRoleUtility.PersonalizeHeroData.MaxWeaponAttachments, 1 do
			attachmentTable[i] = 0
		end
	end
	if not attachmentVariantTable or #attachmentVariantTable == 0 then
		attachmentVariantTable = {}
		for i = 1, CoD.PlayerRoleUtility.PersonalizeHeroData.MaxWeaponAttachments, 1 do
			attachmentVariantTable[i] = 0
		end
	end
	if not camoIndex then
		camoIndex = 0
	end
	if not paintjobSlot then
		paintjobSlot = Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT
	end
	if not paintjobIndex then
		paintjobIndex = Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX
	end
	Engine.SetHeroShowcaseWeaponVariantName( controller, mode, heroIndex, variantName )
	Engine.SetHeroShowcaseWeaponAttribute( controller, mode, heroIndex, "weaponIndex", weaponIndex )
	for i = 1, CoD.PlayerRoleUtility.PersonalizeHeroData.MaxWeaponAttachments, 1 do
		Engine.SetHeroShowcaseWeaponAttribute( controller, mode, heroIndex, "attachment", attachmentTable[i], i - 1 )
	end
	for i = 1, CoD.PlayerRoleUtility.PersonalizeHeroData.MaxWeaponAttachments, 1 do
		Engine.SetHeroShowcaseWeaponAttribute( controller, mode, heroIndex, "attachmentVariant", attachmentVariantTable[i], i - 1 )
	end
	Engine.SetHeroShowcaseWeaponAttribute( controller, mode, heroIndex, "camoIndex", camoIndex )
	Engine.SetHeroShowcaseWeaponAttribute( controller, mode, heroIndex, "paintjobSlot", paintjobSlot )
	Engine.SetHeroShowcaseWeaponAttribute( controller, mode, heroIndex, "paintjobIndex", paintjobIndex )
end

CoD.PlayerRoleUtility.PersonalizeHeroData.GetHeroShowcaseWeaponName = function ( weaponIndex, attachmentTable )
	local weaponName = Engine.GetItemRef( weaponIndex ) .. "_" .. CoD.gameMode:lower()
	for _, attachmentIndex in ipairs( attachmentTable ) do
		local tempAttachmentName = Engine.GetAttachmentRef( weaponIndex, attachmentIndex )
		weaponName = weaponName .. "+" .. tempAttachmentName
	end
	return weaponName
end

CoD.PlayerRoleUtility.PersonalizeHeroData.GetHeroShowcaseWeaponRenderOptions = function ( camoIndex, paintjobSlot, paintjobIndex )
	return camoIndex .. "," .. paintjobSlot .. "," .. paintjobIndex
end

CoD.PlayerRoleUtility.PersonalizeHeroData.IsDualWieldWeapon = function ( weaponIndex, attachmentTable )
	local mode = CoD.PlayerRoleUtility.customizationMode
	local weaponName = Engine.GetItemRef( weaponIndex )
	local dualWieldIndex = Engine.GetItemIndexFromReference( weaponName .. "_dw", mode )
	if dualWieldIndex == -1 then
		return false
	end
	for _, attachmentIndex in ipairs( attachmentTable ) do
		local attachmentName = Engine.GetAttachmentRef( weaponIndex, attachmentIndex )
		if attachmentName == "dw" then
			return true
		end
	end
	return false
end

CoD.PlayerRoleUtility.PersonalizeHeroData.GetDualWieldVersionOfWeapon = function ( controller, weaponIndex )
	local mode = CoD.PlayerRoleUtility.customizationMode
	local weaponName = Engine.GetItemRef( weaponIndex )
	return Engine.GetItemIndexFromReference( weaponName .. "_dw", mode )
end

CoD.PlayerRoleUtility.TauntsData.GetGestureXAnim = function ( heroData, gestureType, gestureIndex )
	return heroData["gestureAnim" .. CoD.PlayerRoleUtility.TauntsData.GestureTypeAWINames[gestureType + 1] .. gestureIndex] or ""
end

CoD.PlayerRoleUtility.TauntsData.GetGestureDisplayName = function ( heroData, gestureType, gestureIndex )
	return heroData["gestureName" .. CoD.PlayerRoleUtility.TauntsData.GestureTypeAWINames[gestureType + 1] .. gestureIndex] or ""
end

CoD.PlayerRoleUtility.TauntsData.GetGestureCount = function ( heroData, gestureType )
	return heroData["gestureCount" .. CoD.PlayerRoleUtility.TauntsData.GestureTypeAWINames[gestureType + 1]] or 0
end

CoD.PlayerRoleUtility.TauntsData.GetGestureAnimFromEvent = function ( event )
	local heroData = Engine.GetHeroBundleInfo( event.sessionMode, event.characterIndex )
	if heroData then
		return CoD.PlayerRoleUtility.TauntsData.GetGestureXAnim( heroData, event.gestureType, event.gestureIndex )
	else
		return ""
	end
end

CoD.PlayerRoleUtility.TauntsData.CharacterHasAnyGestures = function ( heroData )
	for i = 0, Enum.CharacterGestureTypes.GESTURE_TYPE_COUNT - 1, 1 do
		if 0 < CoD.PlayerRoleUtility.TauntsData.GetGestureCount( heroData, i ) then
			return true
		end
	end
	return false
end

CoD.PlayerRoleUtility.GetTauntsAndGesturesNewCount = function ( controller, heroIndex, heroData, mode )
	local count = 0
	return count + CoD.PlayerRoleUtility.GetTauntNewCount( controller, heroIndex, heroData, mode ) + CoD.PlayerRoleUtility.GetGestureNewCount( controller, heroIndex, heroData, mode )
end

CoD.PlayerRoleUtility.GetTauntNewCount = function ( controller, heroIndex, heroData, mode )
	local count = 0
	local heroName = ""
	for _, hero in ipairs( heroList ) do
		if hero.bodyIndex == heroIndex then
			heroName = hero.assetName
			break
		end
	end
	for tauntType = 0, Enum.CharacterTauntTypes.TAUNT_TYPE_COUNT - 1, 1 do
		for i = 0, CoD.PlayerRoleUtility.TauntsData.GetTauntCount( heroData, tauntType ) - 1, 1 do
			local XAnimName = CoD.PlayerRoleUtility.TauntsData.GetTauntXAnim( heroData, tauntType, i )
			if Engine.IsTauntNew( controller, mode, heroIndex, tauntType, i, XAnimName ) then
				count = count + 1
			end
		end
	end
	return count
end

CoD.PlayerRoleUtility.GetGestureNewCount = function ( controller, heroIndex, heroData, mode )
	local count = 0
	local heroName = ""
	for _, hero in ipairs( heroList ) do
		if hero.bodyIndex == CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits then
			heroName = hero.assetName
			break
		end
	end
	for gestureType = 0, Enum.CharacterGestureTypes.GESTURE_TYPE_COUNT - 1, 1 do
		for i = 0, CoD.PlayerRoleUtility.TauntsData.GetGestureCount( heroData, gestureType ) - 1, 1 do
			local XAnimName = CoD.PlayerRoleUtility.TauntsData.GetGestureXAnim( heroData, gestureType, i )
			if XAnimName ~= "" and Engine.IsGestureNew( controller, mode, heroIndex, gestureType, i, XAnimName .. ";" .. heroName ) then
				count = count + 1
			end
		end
	end
	return count
end

CoD.PlayerRoleUtility.GestureTypeOptionsListCreate = function ( heroData, gestureType, selectedGesture )
	local name = "GestureTypeOptions" .. gestureType
	DataSources[name] = DataSourceHelpers.ListSetup( name, function ( controller )
		local infoTable = {}
		for i = 0, CoD.PlayerRoleUtility.TauntsData.GetGestureCount( heroData, gestureType ) - 1, 1 do
			local XAnimName = CoD.PlayerRoleUtility.TauntsData.GetGestureXAnim( heroData, gestureType, i )
			local heroList = Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER )
			local heroName = ""
			for _, hero in ipairs( heroList ) do
				if hero.bodyIndex == CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits then
					heroName = hero.assetName
					break
				end
			end
			local lootItemName = XAnimName .. ";" .. heroName
			local isBMClassified = false
			if XAnimName ~= "" and i ~= 0 then
				isBMClassified = CoD.BlackMarketUtility.IsItemLocked( controller, lootItemName )
			end
			local itemName = CoD.PlayerRoleUtility.TauntsData.GetGestureDisplayName( heroData, gestureType, i )
			if isBMClassified then
				itemName = CoD.BlackMarketUtility.ClassifiedName()
			end
			table.insert( infoTable, {
				models = {
					itemName = itemName,
					isBMClassified = isBMClassified,
					canPreview = XAnimName ~= "",
					rarityType = {
						rarity = CoD.BlackMarketUtility.GetRarityForLootItemFromName( lootItemName ),
						isBMClassified = isBMClassified,
						duplicateCount = CoD.BlackMarketUtility.GetItemQuantity( controller, lootItemName )
					}
				},
				properties = {
					index = i,
					xanim = XAnimName,
					heroName = heroName,
					gestureType = gestureType,
					selectIndex = i == selectedGesture
				}
			} )
		end
		table.sort( infoTable, CoD.BlackMarketUtility.SortUnlocksPropertyIndex )
		return infoTable
	end, true )
	return name
end

CoD.PlayerRoleUtility.GestureTypesListPrepare = function ( controller )
	local infoTable = {}
	local heroData = Engine.GetHeroBundleInfo( CoD.PlayerRoleUtility.customizationMode, CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits )
	local addGestureType = function ( gestureType, displayString )
		if CoD.PlayerRoleUtility.TauntsData.GetGestureCount( heroData, gestureType ) > 0 then
			local selectedGesture = Engine.GetSelectedGestureForHero( controller, CoD.PlayerRoleUtility.customizationMode, CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits, gestureType )
			local selectedXAnim = CoD.PlayerRoleUtility.TauntsData.GetGestureXAnim( heroData, gestureType, selectedGesture )
			table.insert( infoTable, {
				models = {
					categoryName = displayString,
					selectedItem = CoD.PlayerRoleUtility.TauntsData.GetGestureDisplayName( heroData, gestureType, selectedGesture ),
					optionsDatasource = CoD.PlayerRoleUtility.GestureTypeOptionsListCreate( heroData, gestureType, selectedGesture ),
					canPreview = selectedXAnim ~= ""
				},
				properties = {
					gestureType = gestureType,
					xanim = selectedXAnim
				}
			} )
		end
	end
	
	addGestureType( Enum.CharacterGestureTypes.GESTURE_TYPE_GOOD_GAME, "HEROES_GESTURES_GOOD_GAME" )
	addGestureType( Enum.CharacterGestureTypes.GESTURE_TYPE_THREATEN, "HEROES_GESTURES_THREATEN" )
	addGestureType( Enum.CharacterGestureTypes.GESTURE_TYPE_BOAST, "HEROES_GESTURES_BOAST" )
	return infoTable
end

DataSources.GestureTypesList = DataSourceHelpers.ListSetup( "GestureTypesList", CoD.PlayerRoleUtility.GestureTypesListPrepare, true )
CoD.PlayerRoleUtility.TauntsData.GetTauntXAnim = function ( heroData, tauntType, tauntIndex )
	return heroData["tauntAnim" .. CoD.PlayerRoleUtility.TauntsData.TauntTypeAWINames[tauntType + 1] .. tauntIndex] or ""
end

CoD.PlayerRoleUtility.TauntsData.GetTauntDisplayName = function ( heroData, tauntType, tauntIndex )
	return heroData["tauntName" .. CoD.PlayerRoleUtility.TauntsData.TauntTypeAWINames[tauntType + 1] .. tauntIndex] or ""
end

CoD.PlayerRoleUtility.TauntsData.GetTauntCount = function ( heroData, tauntType )
	return heroData["tauntCount" .. CoD.PlayerRoleUtility.TauntsData.TauntTypeAWINames[tauntType + 1]] or 0
end

CoD.PlayerRoleUtility.TauntsData.GetTauntAnimFromEvent = function ( event )
	local heroData = Engine.GetHeroBundleInfo( event.sessionMode, event.characterIndex )
	if heroData then
		return CoD.PlayerRoleUtility.TauntsData.GetTauntXAnim( heroData, event.tauntType, event.tauntIndex )
	else
		return ""
	end
end

CoD.PlayerRoleUtility.TauntsData.CharacterHasAnyTaunts = function ( heroData )
	for i = 0, Enum.CharacterTauntTypes.TAUNT_TYPE_COUNT - 1, 1 do
		if 0 < CoD.PlayerRoleUtility.TauntsData.GetTauntCount( heroData, i ) then
			return true
		end
	end
	return false
end

CoD.PlayerRoleUtility.TauntTypeOptionsListCreate = function ( heroData, tauntType, selectedTaunt )
	local name = "TauntTypeOptions" .. tauntType
	DataSources[name] = DataSourceHelpers.ListSetup( name, function ( controller )
		local infoTable = {}
		for i = 0, CoD.PlayerRoleUtility.TauntsData.GetTauntCount( heroData, tauntType ) - 1, 1 do
			local XAnimName = CoD.PlayerRoleUtility.TauntsData.GetTauntXAnim( heroData, tauntType, i )
			local isBMClassified = false
			if XAnimName ~= "" and i ~= 0 then
				isBMClassified = CoD.BlackMarketUtility.IsItemLocked( controller, XAnimName )
			end
			local itemName = CoD.PlayerRoleUtility.TauntsData.GetTauntDisplayName( heroData, tauntType, i )
			if isBMClassified then
				itemName = CoD.BlackMarketUtility.ClassifiedName()
			end
			table.insert( infoTable, {
				models = {
					itemName = itemName,
					isBMClassified = isBMClassified,
					canPreview = XAnimName ~= "",
					rarityType = {
						rarity = CoD.BlackMarketUtility.GetRarityForLootItemFromName( XAnimName ),
						isBMClassified = isBMClassified,
						duplicateCount = CoD.BlackMarketUtility.GetItemQuantity( controller, XAnimName )
					}
				},
				properties = {
					index = i,
					xanim = XAnimName,
					tauntType = tauntType,
					selectIndex = i == selectedTaunt
				}
			} )
		end
		table.sort( infoTable, CoD.BlackMarketUtility.SortUnlocksPropertyIndex )
		return infoTable
	end, true )
	return name
end

CoD.PlayerRoleUtility.TauntTypesListPrepare = function ( controller )
	local infoTable = {}
	local heroData = Engine.GetHeroBundleInfo( CoD.PlayerRoleUtility.customizationMode, CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits )
	local addTauntType = function ( tauntType, displayString )
		if CoD.PlayerRoleUtility.TauntsData.GetTauntCount( heroData, tauntType ) > 0 then
			local selectedTaunt = Engine.GetSelectedTauntForHero( controller, CoD.PlayerRoleUtility.customizationMode, CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits, tauntType )
			local selectedXAnim = CoD.PlayerRoleUtility.TauntsData.GetTauntXAnim( heroData, tauntType, selectedTaunt )
			table.insert( infoTable, {
				models = {
					categoryName = displayString,
					selectedItem = CoD.PlayerRoleUtility.TauntsData.GetTauntDisplayName( heroData, tauntType, selectedTaunt ),
					optionsDatasource = CoD.PlayerRoleUtility.TauntTypeOptionsListCreate( heroData, tauntType, selectedTaunt ),
					canPreview = selectedXAnim ~= ""
				},
				properties = {
					tauntType = tauntType,
					xanim = CoD.PlayerRoleUtility.TauntsData.GetTauntXAnim( heroData, tauntType, selectedTaunt )
				}
			} )
		end
	end
	
	addTauntType( Enum.CharacterTauntTypes.TAUNT_TYPE_FIRST_PLACE, "HEROES_1ST_PLACE_TAUNT" )
	return infoTable
end

DataSources.TauntTypesList = DataSourceHelpers.ListSetup( "TauntTypesList", CoD.PlayerRoleUtility.TauntTypesListPrepare, true )
CoD.PlayerRoleUtility.GetDisplayNameForTaunt = function ( mode, taunt )
	local heroList = Engine.GetHeroList( mode )
	for _, hero in ipairs( heroList ) do
		local heroInfo = Engine.GetHeroBundleInfo( mode, hero.bodyIndex )
		for tauntIndex, tauntType in ipairs( CoD.PlayerRoleUtility.TauntsData.TauntTypeAWINames ) do
			local tauntCount = CoD.PlayerRoleUtility.TauntsData.GetTauntCount( heroInfo, tauntIndex - 1 )
			for f67_local3 = 0, tauntCount - 1, 1 do
				if CoD.PlayerRoleUtility.TauntsData.GetTauntXAnim( heroInfo, tauntIndex - 1, f67_local3 ) == taunt then
					return CoD.PlayerRoleUtility.TauntsData.GetTauntDisplayName( heroInfo, tauntIndex - 1, f67_local3 )
				end
			end
		end
	end
	return ""
end

CoD.PlayerRoleUtility.GetHeroDisplayNameAndIndexForTaunt = function ( mode, taunt )
	local heroList = Engine.GetHeroList( mode )
	for _, hero in ipairs( heroList ) do
		local heroInfo = Engine.GetHeroBundleInfo( mode, hero.bodyIndex )
		for tauntIndex, tauntType in ipairs( CoD.PlayerRoleUtility.TauntsData.TauntTypeAWINames ) do
			local tauntCount = CoD.PlayerRoleUtility.TauntsData.GetTauntCount( heroInfo, tauntIndex - 1 )
			for f68_local3 = 0, tauntCount - 1, 1 do
				if CoD.PlayerRoleUtility.TauntsData.GetTauntXAnim( heroInfo, tauntIndex - 1, f68_local3 ) == taunt then
					return hero.displayName, hero.bodyIndex
				end
			end
		end
	end
	return ""
end

CoD.PlayerRoleUtility.GetTypeIndexAndIndexForTaunt = function ( mode, taunt )
	local heroList = Engine.GetHeroList( mode )
	for _, hero in ipairs( heroList ) do
		local heroInfo = Engine.GetHeroBundleInfo( mode, hero.bodyIndex )
		for tauntIndex, tauntType in ipairs( CoD.PlayerRoleUtility.TauntsData.TauntTypeAWINames ) do
			local tauntCount = CoD.PlayerRoleUtility.TauntsData.GetTauntCount( heroInfo, tauntIndex - 1 )
			for f69_local3 = 0, tauntCount - 1, 1 do
				if CoD.PlayerRoleUtility.TauntsData.GetTauntXAnim( heroInfo, tauntIndex - 1, f69_local3 ) == taunt then
					return tauntIndex - 1, f69_local3
				end
			end
		end
	end
	return nil, nil
end

CoD.PlayerRoleUtility.GetTypeNameForGesture = function ( mode, heroId, gesture )
	local heroList = Engine.GetHeroList( mode )
	for _, hero in ipairs( heroList ) do
		local heroInfo = Engine.GetHeroBundleInfo( mode, hero.bodyIndex )
		if hero.assetName == heroId then
			for gestureIndex, gestureType in ipairs( CoD.PlayerRoleUtility.TauntsData.GestureTypeAWINames ) do
				local gestureCount = CoD.PlayerRoleUtility.TauntsData.GetGestureCount( heroInfo, gestureIndex - 1 )
				for f70_local6 = 0, gestureCount - 1, 1 do
					if CoD.PlayerRoleUtility.TauntsData.GetGestureXAnim( heroInfo, gestureIndex - 1, f70_local6 ) == gesture then
						return CoD.PlayerRoleUtility.TauntsData.GestureTypeDisplayNames[gestureIndex]
					end
				end
			end
		end
	end
	return ""
end

CoD.PlayerRoleUtility.GetTypeIndexAndIndexForGesture = function ( mode, heroId, gesture )
	local heroList = Engine.GetHeroList( mode )
	for _, hero in ipairs( heroList ) do
		local heroInfo = Engine.GetHeroBundleInfo( mode, hero.bodyIndex )
		if hero.assetName == heroId then
			for gestureIndex, gestureType in ipairs( CoD.PlayerRoleUtility.TauntsData.GestureTypeAWINames ) do
				local gestureCount = CoD.PlayerRoleUtility.TauntsData.GetGestureCount( heroInfo, gestureIndex - 1 )
				for f71_local6 = 0, gestureCount - 1, 1 do
					if CoD.PlayerRoleUtility.TauntsData.GetGestureXAnim( heroInfo, gestureIndex - 1, f71_local6 ) == gesture then
						return gestureIndex - 1, f71_local6
					end
				end
			end
		end
	end
	return nil, nil
end

CoD.PlayerRoleUtility.GetDisplayNameForGesture = function ( mode, heroId, gesture )
	local heroList = Engine.GetHeroList( mode )
	for _, hero in ipairs( heroList ) do
		local heroInfo = Engine.GetHeroBundleInfo( mode, hero.bodyIndex )
		if hero.assetName == heroId then
			for gestureIndex, gestureType in ipairs( CoD.PlayerRoleUtility.TauntsData.GestureTypeAWINames ) do
				local gestureCount = CoD.PlayerRoleUtility.TauntsData.GetGestureCount( heroInfo, gestureIndex - 1 )
				for f72_local6 = 0, gestureCount - 1, 1 do
					if CoD.PlayerRoleUtility.TauntsData.GetGestureXAnim( heroInfo, gestureIndex - 1, f72_local6 ) == gesture then
						return CoD.PlayerRoleUtility.TauntsData.GetGestureDisplayName( heroInfo, gestureIndex - 1, f72_local6 )
					end
				end
			end
		end
	end
	return ""
end

CoD.PlayerRoleUtility.GetHeroDisplayNameAndIndex = function ( mode, heroId )
	local heroList = Engine.GetHeroList( mode )
	for _, hero in ipairs( heroList ) do
		local heroInfo = Engine.GetHeroBundleInfo( mode, hero.bodyIndex )
		if hero.assetName == heroId then
			return hero.displayName, hero.bodyIndex
		end
	end
	return ""
end

CoD.PlayerRoleUtility.Heroes.GetHeroUnlockInfo = function ( controller, bodyIndex, mode, unlockString )
	local unlockDesc = ""
	local isLocked = true
	for f74_local0 = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_FIRST, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_COUNT - 1, 1 do
		local itemIndex = Engine.GetLoadoutItemIndexForHero( mode or CoD.PlayerRoleUtility.customizationMode, bodyIndex, f74_local0 )
		if IsLive() and IsFirstTimeSetup( controller, Enum.eModes.MODE_MULTIPLAYER ) then
			if isLocked then
				isLocked = Engine.IsItemLocked( controller, itemIndex, Enum.eModes.MODE_MULTIPLAYER )
			end
		end
		if IsProgressionEnabled( controller ) then
			if isLocked then
				if not CoD.PrestigeUtility.isInPermanentUnlockMenu then
					isLocked = Engine.IsItemLocked( controller, itemIndex, mode or CoD.PlayerRoleUtility.customizationMode )
				else
					isLocked = false
				end
			end
			unlockDesc = CoD.GetUnlockRankAndLevelForItemIndex( controller, itemIndex, unlockString or "MENU_UNLOCKED_AT", mode or CoD.PlayerRoleUtility.customizationMode )
		end
	end
	if not IsProgressionEnabled( controller ) then
		isLocked = false
	end
	return isLocked, unlockDesc
end

CoD.PlayerRoleUtility.Heroes.GetPersonalizationNewCount = function ( controller, heroIndex )
	local mode = CoD.PlayerRoleUtility.customizationMode
	local newItemCount = 0
	if heroIndex then
		local heroData = Engine.GetHeroBundleInfo( mode, heroIndex )
		for itemType = 0, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_COUNT - 1, 1 do
			local newItemCountTable = Engine.CharacterCustomizationNewItemCount( controller, heroIndex, itemType, mode )
			newItemCount = newItemCount + newItemCountTable.total
		end
		newItemCount = newItemCount + CoD.PlayerRoleUtility.GetTauntsAndGesturesNewCount( controller, heroIndex, heroData, mode )
	end
	return newItemCount
end

CoD.PlayerRoleUtility.GetHeroModels = function ( heroInfo, index, controller, completionEpicComplete )
	local equippedInfo = Engine.GetEquippedInfoForHero( controller, CoD.PlayerRoleUtility.customizationMode, heroInfo.bodyIndex )
	local customizationTable = Engine.GetHeroCustomizationTable( CoD.PlayerRoleUtility.customizationMode, heroInfo.bodyIndex )
	local isHeroLocked, unlockDesc = CoD.PlayerRoleUtility.Heroes.GetHeroUnlockInfo( controller, heroInfo.bodyIndex )
	local f76_local0 = CoD.PlayerRoleUtility.Heroes.HeroIndexForEdits
	if not f76_local0 then
		local selectHero = Engine.GetEquippedHero( controller, CoD.PlayerRoleUtility.customizationMode )
	end
	local bundleData = Engine.GetHeroBundleInfo( CoD.PlayerRoleUtility.customizationMode, heroInfo.bodyIndex ) or {}
	local infoTable = {
		models = {
			backgroundWithCharacter = heroInfo.backgroundWithCharacter or "blacktransparent",
			lockedBackgroundWithCharacter = heroInfo.background,
			name = heroInfo.displayName,
			unlockDescription = unlockDesc,
			level = 1,
			unlockedCharacterSliver = heroInfo.frozenMomentRender or "blacktransparent",
			lockedCharacterSliver = bundleData.lockedSliverRender or "blacktransparent",
			disabled = heroInfo.disabled or isHeroLocked,
			equippedSlot = Engine.GetLoadoutTypeForHero( controller, heroInfo.bodyIndex ),
			selectedHeadInfo = CoD.PlayerRoleUtility.CreateSelectedItemModel( controller, customizationTable, equippedInfo, heroInfo.bodyIndex, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET ),
			selectedBodyInfo = CoD.PlayerRoleUtility.CreateSelectedItemModel( controller, customizationTable, equippedInfo, heroInfo.bodyIndex, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY ),
			selectedShowcaseWeaponInfo = nil,
			selectedTauntInfo = nil,
			itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM,
			heroIndex = heroInfo.bodyIndex,
			breadcrumbCount = CoD.PlayerRoleUtility.Heroes.GetPersonalizationNewCount( controller, heroInfo.bodyIndex )
		},
		properties = {
			heroIndex = heroInfo.bodyIndex,
			selectIndex = heroInfo.bodyIndex == f76_local0
		}
	}
	if CoDShared.IsLootHero( heroInfo ) then
		local dvarIfExistsOrDefault = function ( dvar, default )
			if dvar:exists() then
				return tonumber( dvar:get() )
			else
				return default
			end
		end
		
		local allUnlocked = Dvar.ui_enableAllHeroes:get()
		local f76_local1 = infoTable.models
		local f76_local2 = dvarIfExistsOrDefault
		local f76_local3 = Dvar.ui_blackjack_contracts
		local f76_local4
		if allUnlocked then
			f76_local4 = 1
			if not f76_local4 then
			
			else
				f76_local1.contractsRemaining = f76_local2( f76_local3, f76_local4 )
				infoTable.models.isActivated = dvarIfExistsOrDefault( Dvar.ui_blackjack_active, 1 ) == 1
				infoTable.models.activeTimeRemaining = dvarIfExistsOrDefault( Dvar.ui_blackjack_remainingTime, 29754 )
				infoTable.properties.customWidgetOverride = CoD.ChooseContractCharacterLoadoutCarouselItem
			end
		end
		f76_local4 = 0
	end
	if not infoTable.models.disabled then
		infoTable.models.loadoutDatasource = CoD.PlayerRoleUtility.CreateCarouselItemLoadoutDatasource( infoTable, CoD.PlayerRoleUtility.customizationMode, controller )
		infoTable.models.cardBackDatasource = CoD.PlayerRoleUtility.CreateCarouselCardBackDatasource( infoTable, heroInfo, CoD.PlayerRoleUtility.customizationMode, controller, bundleData, completionEpicComplete )
		infoTable.models.newTransmissions = CoD.PlayerRoleUtility.GetTransmissionNewCount( controller, heroInfo.bodyIndex, bundleData )
	end
	return infoTable
end

CoD.PlayerRoleUtility.HeroesListPrepare = function ( controller )
	local heroTable = Engine.GetHeroList( CoD.PlayerRoleUtility.customizationMode )
	local infoTable = {}
	local genderFilter = Enum.CharacterGenderTypes.CHARACTER_GENDER_TYPE_ANY
	if CoD.PlayerRoleUtility.customizationMode == Enum.eModes.MODE_CAMPAIGN then
		genderFilter = Engine.GetEquippedGender( controller, Enum.eModes.MODE_CAMPAIGN )
	end
	local completionEpicComplete = CoD.PlayerRoleUtility.CompletionEpicComplete( controller, heroTable )
	for _, heroInfo in ipairs( heroTable ) do
		local index = heroInfo.bodyIndex
		if genderFilter == Enum.CharacterGenderTypes.CHARACTER_GENDER_TYPE_ANY or heroInfo.gender == genderFilter then
			local newHero = CoD.PlayerRoleUtility.GetHeroModels( heroInfo, index, controller, completionEpicComplete )
			if CoDShared.IsLootHero( heroInfo ) then
				if not IsInPermanentUnlockMenu( controller ) and not IsFirstTimeSetup( controller, Enum.eModes.MODE_MULTIPLAYER ) then
					table.insert( infoTable, 1, newHero )
				end
			end
			table.insert( infoTable, newHero )
		end
	end
	for index, heroInfo in ipairs( infoTable ) do
		heroInfo.models.count = Engine.Localize( "MENU_X_OF_Y", index, #infoTable )
	end
	return infoTable
end

DataSources.HeroesList = DataSourceHelpers.ListSetup( "HeroesList", CoD.PlayerRoleUtility.HeroesListPrepare, true )
CoD.PlayerRoleUtility.GenderListPrepare = function ( controller )
	local getGenderButton = function ( gender, name )
		local bundleData = Engine.GetHeroBundleInfo( Enum.eModes.MODE_CAMPAIGN, gender )
		return {
			models = {
				name = name,
				image = bundleData["cprender_" .. Engine.Team( controller, "faction" )]
			},
			properties = {
				gender = gender
			}
		}
	end
	
	local f79_local0 = {}
	local f79_local1 = getGenderButton( Enum.CharacterGenderTypes.CHARACTER_GENDER_TYPE_MALE, "EM_MALE" )
	local f79_local2 = getGenderButton( Enum.CharacterGenderTypes.CHARACTER_GENDER_TYPE_FEMALE, "EM_FEMALE" )
	return f79_local1
end

DataSources.GendersList = DataSourceHelpers.ListSetup( "GendersList", CoD.PlayerRoleUtility.GenderListPrepare, true )
CoD.PlayerRoleUtility.HeadListPrepare = function ( controller )
	local mode = CoD.PlayerRoleUtility.customizationMode
	local completeHeadTable = Engine.GetHeadList( mode, Engine.GetEquippedGender( controller, mode ) )
	local infoTable = {}
	for index, headTable in ipairs( completeHeadTable ) do
		table.insert( infoTable, {
			models = {
				name = headTable.displayName,
				headExtraCamInfo = "" .. CoD.PlayerRoleUtility.customizationMode .. ";" .. headTable.headIndex .. ";" .. controller
			},
			properties = {
				headIndex = headTable.headIndex
			}
		} )
	end
	return infoTable
end

DataSources.HeroFaceButtonList = DataSourceHelpers.ListSetup( "HeroFaceButtonList", CoD.PlayerRoleUtility.HeadListPrepare, true )
CoD.PlayerRoleUtility.loadoutTypesDSourceMap = {
	[CoD.CACUtility.loadoutSlotNames.primaryWeapon] = "possiblePrimaries",
	[CoD.CACUtility.loadoutSlotNames.secondaryWeapon] = "possibleSecondaries",
	[CoD.CACUtility.loadoutSlotNames.primaryGrenade] = "possibleLethals"
}
CoD.PlayerRoleUtility.CreateInventoryAttachmentDataSource = function ( controller, dataSourceName, itemInfo )
	DataSources[dataSourceName] = DataSourceHelpers.ListSetup( dataSourceName, function ( controller )
		local dataTable = {}
		if itemInfo.attachments then
			for _, attachmentIndex in pairs( itemInfo.attachments ) do
				local newItem = {
					models = {
						name = Engine.GetAttachmentName( itemInfo.itemIndex, attachmentIndex ),
						image = Engine.GetAttachmentImage( itemInfo.itemIndex, attachmentIndex ) .. "_wv_icon"
					}
				}
				table.insert( dataTable, newItem )
			end
		end
		return dataTable
	end, false, nil, nil )
	return dataSourceName
end

CoD.PlayerRoleUtility.GetPositionInventoryWeaponAttachments = function ( mode, characterIndex )
	local characterInventoryItems = Engine.GetPostionRoleInventoryInfo( Enum.eModes.MODE_MULTIPLAYER, characterIndex )
	local kvpItems = Engine.GetPostionRoleBundleInfo( mode, characterIndex )
	for key, item in pairs( kvpItems ) do
		if LUI.startswith( key, "primary" ) or LUI.startswith( key, "secondary" ) then
			local keySplit = LUI.splitString( key, "_" )
			local loadout = keySplit[1]
			local weaponInventoryIndex = tonumber( keySplit[2] )
			local loadoutInventoryInfo = characterInventoryItems[loadout]
			if #loadoutInventoryInfo > 0 and weaponInventoryIndex <= #loadoutInventoryInfo then
				local loadoutInventoryWeaponInfo = characterInventoryItems[loadout][weaponInventoryIndex]
				loadoutInventoryWeaponInfo.attachments = {}
				local attachmentListForSlot = CoD.CACUtility.GetAttachmentListForSlot( loadout )
				local attachmentList = LUI.splitString( item, "+" )
				local attachmentItemListIndex = 1
				for i, attachmentLoadoutSlot in ipairs( attachmentListForSlot ) do
					local attachmentName = attachmentList[attachmentItemListIndex]
					if not attachmentName then
						
					end
					local attachmentTableIndex = Engine.GetAttachmentIndexByRef( attachmentName )
					local attachmentIndex = Engine.GetAttachmentIndexByAttachmentTableIndex( loadoutInventoryWeaponInfo.itemIndex, attachmentTableIndex, mode )
					if attachmentIndex > CoD.CACUtility.EmptyItemIndex and (i ~= 1 or Engine.IsOpticByAttachmentIndex( attachmentTableIndex )) then
						loadoutInventoryWeaponInfo.attachments[attachmentLoadoutSlot] = attachmentIndex
						attachmentItemListIndex = attachmentItemListIndex + 1
					end
				end
			end
			local characterID = characterIndex
			local heroData = Engine.GetHeroInfo( CoD.PlayerRoleUtility.customizationMode, characterIndex )
			if heroData then
				characterID = Engine.Localize( heroData.displayName )
			end
			DebugPrint( "Position Inventory: weaponItemInventory '" .. weaponInventoryIndex .. "' not found loadoutSlot '" .. loadout .. "' for character (name or index) '" .. characterID .. "'." )
		end
	end
	return characterInventoryItems
end

DataSources.PositionLoadoutList = {
	prepare = function ( controller, list, filter )
		list.models = {}
		local f85_local0 = Engine.GetModelForController( controller )
		list.baseModel = f85_local0:create( "PositionLoadouts" )
		f85_local0 = function ( self, element, controller, actionParam, menu )
			local classModel = self:getModel()
			local classNum = classModel.classNum:get()
			local f86_local0 = element:getModel()
			local weaponItemIndex = f86_local0.itemIndex:get()
			CoD.perController[controller].weaponCategory = actionParam
			SetClassItem( self, element, controller )
			if element.attachments and (element.weaponCategory == "primary" or element.weaponCategory == "secondary") then
				for attachmentSlotName, attachmentIndex in pairs( element.attachments ) do
					CoD.CACUtility.SetClassItem( controller, classNum, attachmentSlotName, attachmentIndex )
				end
				CoD.CACUtility.GetCustomClassModel( controller, classNum, classModel )
			end
		end
		
		local roleCategories = Engine.GetPositionRoleCategories( Enum.eModes.MODE_MULTIPLAYER )
		local RoleCategorySort = function ( a, b )
			return roleCategories[a].sortOrder < roleCategories[b].sortOrder
		end
		
		for sortIndex, category in LUI.IterateTableBySortedKeys( roleCategories, RoleCategorySort, nil ) do
			local CharacterSort = function ( a, b )
				return category.characters[a].index < category.characters[b].index
			end
			
			if category.enabled == 1 then
				for index, character in LUI.IterateTableBySortedKeys( category.characters, CharacterSort, nil ) do
					local characterModel = list.baseModel:create( character.index )
					local f85_local10 = characterModel:create( "name" )
					f85_local10:set( character.name )
					f85_local10 = characterModel:create( "icon" )
					f85_local10:set( character.icon )
					f85_local10 = characterModel:create( "characterIndex" )
					f85_local10:set( character.index )
					f85_local10 = characterModel:create( "characterTraitSummary" )
					f85_local10:set( CoD.PlayerRoleUtility.GetCharacterTraitSummary( Engine.CurrentSessionMode(), character.index ) )
					f85_local10 = characterModel:create( "characterTraitsDatasource" )
					f85_local10:set( CoD.PlayerRoleUtility.CreateCharacterTraitsDatasource( controller, character.index ) )
					local classModel = characterModel:create( "classModel" )
					local classIndex = Engine.GetPostionRoleCustomClassIndex( Engine.CurrentSessionMode(), character.index )
					CoD.CACUtility.GetCustomClassModel( controller, classIndex, classModel )
					local characterInventoryItems = CoD.PlayerRoleUtility.GetPositionInventoryWeaponAttachments( Enum.eModes.MODE_MULTIPLAYER, character.index )
					local loadoutTypeDataSources = {
						[character.index] = {}
					}
					for slot, dsource in pairs( CoD.PlayerRoleUtility.loadoutTypesDSourceMap ) do
						local baseSlot = CoD.CACUtility.GetBaseWeaponLoadoutSlotName( slot )
						loadoutTypeDataSources[character.index][slot] = "PositionLoadouts_" .. slot .. "_" .. character.index
						local dsourceSetup = function ( controller )
							local results = {}
							if characterInventoryItems[baseSlot] then
								for i, itemInfo in ipairs( characterInventoryItems[baseSlot] ) do
									local f89_local3 = ""
									if baseSlot ~= "primary" and baseSlot ~= "primarygrenade" then
										if itemInfo.unlockIngameLevel > 1 then
											f89_local3 = Engine.Localize( "MENU_ESCALATION_LEVEL_UNLOCK_DESC", itemInfo.unlockIngameLevel )
										elseif itemInfo.cost == 0 then
											f89_local3 = Engine.Localize( "MENU_FREE" )
										end
									end
									local item = {
										models = {},
										properties = {}
									}
									item.models.itemIndex = itemInfo.itemIndex
									item.models.name = itemInfo.name
									item.models.image = itemInfo.image
									item.models.desc = itemInfo.desc
									item.models.count = itemInfo.count
									item.models.cost = itemInfo.cost
									item.models.levelUnlockDescription = f89_local3
									item.properties.ref = itemInfo.ref
									item.properties.action = f85_local0
									item.properties.actionParam = slot
									item.properties.weaponCategory = itemInfo.weaponCategory
									item.properties.attachments = itemInfo.attachments
									if baseSlot == "primary" or baseSlot == "secondary" then
										item.models.attachmentDataSource = CoD.PlayerRoleUtility.CreateInventoryAttachmentDataSource( controller, "PositionLoadouts_" .. baseSlot .. "_attachments_" .. i, itemInfo )
									end
									table.insert( results, item )
								end
							end
							return results
						end
						
						DataSources[loadoutTypeDataSources[character.index][slot]] = DataSourceHelpers.ListSetup( "PositionLoadouts_" .. slot, dsourceSetup, false )
					end
					for slot, dsource in pairs( CoD.PlayerRoleUtility.loadoutTypesDSourceMap ) do
						local baseSlot = characterModel:create( dsource )
						baseSlot:set( loadoutTypeDataSources[character.index][slot] )
					end
					CoD.CACUtility.CreateContextualWeaponAttachmentsDataSources( "PositionLoadouts_" .. character.index, controller, classModel )
					table.insert( list.models, characterModel )
				end
			end
		end
	end,
	getItem = function ( controller, list, index )
		return list.models[index]
	end,
	getCount = function ( list )
		return #list.models
	end,
	cleanup = function ( list, controller )
		if list.baseModel then
			if LUI.DEV then
				local f92_local0 = LUI.DEV.ErrorIfModelsDoNotMatch
				local f92_local1 = list.baseModel
				local f92_local2 = Engine.GetModelForController( controller )
				local modelsAreDifferent = f92_local0( f92_local1, f92_local2:create( "PositionLoadouts" ) )
			end
			Engine.UnsubscribeAndFreeModel( list.baseModel )
		end
		list.baseModel = nil
	end,
	getSpacerAfterColumn = function ( list, column, widgetWidth )
		if column % 2 == 0 then
			return 70
		else
			
		end
	end,
	getCustomPropertiesForItem = function ( list, index )
		local classNum = list.models[index].classModel.classNum:get()
		local characterIndex = list.models[index].characterIndex:get()
		return {
			characterIndex = characterIndex,
			classNum = classNum
		}
	end
}
DataSourceHelpers.PerControllerDataSourceSetup( "PositionEditLoadout", "PositionEditLoadout", function ( rootModel, controller )
	local characterIndex = nil
	if InFrontend() then
		local f95_local0 = Engine.GetModelForController( controller )
		characterIndex = f95_local0["PositionEditLoadout.SelectedCharacterIndex"].get( f95_local0["PositionEditLoadout.SelectedCharacterIndex"] )
	else
		characterIndex = GetCharacterIndexForClientNum( controller, Engine.GetClientNum( controller ) )
	end
	local f95_local0 = rootModel:create( "characterIndex" )
	f95_local0:set( characterIndex )
	f95_local0 = rootModel:create( "name" )
	f95_local0:set( GetCharacterDisplayNameByIndex( characterIndex ) )
	local classIndex = Engine.GetPostionRoleCustomClassIndex( Engine.CurrentSessionMode(), characterIndex )
	local classModel = rootModel:create( "classModel" )
	CoD.CACUtility.GetCustomClassModel( controller, classIndex, classModel )
	CoD.perController[controller].classModel = classModel
	local itemSelectionAction = function ( self, element, controller, actionParam, menu )
		local classModel = self:getModel()
		local classNum = classModel.classNum:get()
		local slotNameList = CoD.CACUtility.GetSlotListWithSlot( element.weaponCategory )
		local newSlot = element.weaponCategory
		CoD.perController[controller].classModel = classModel
		CoD.perController[controller].classNum = classNum
		CoD.perController[controller].weaponCategory = newSlot
		SetClassItem( self, element, controller )
		if element.attachments and (element.weaponCategory == "primary" or element.weaponCategory == "secondary") then
			for attachmentSlotName, attachmentIndex in pairs( element.attachments ) do
				CoD.CACUtility.SetClassItem( controller, classNum, attachmentSlotName, attachmentIndex )
			end
			CoD.CACUtility.GetCustomClassModel( controller, classNum, classModel )
		end
		if IsInPrematchPeriod( controller ) ~= true then
			local f96_local0 = element:getModel()
			local itemName = f96_local0.name:get()
			Engine.SendMenuResponse( controller, "PositionDraft", "weapon_updated," .. itemName )
		end
	end
	
	local characterInventoryItems = CoD.PlayerRoleUtility.GetPositionInventoryWeaponAttachments( Enum.eModes.MODE_MULTIPLAYER, characterIndex )
	local loadoutTypeDataSources = {}
	for slot, dsource in pairs( CoD.PlayerRoleUtility.loadoutTypesDSourceMap ) do
		local baseSlot = CoD.CACUtility.GetBaseWeaponLoadoutSlotName( slot )
		loadoutTypeDataSources[slot] = "PositionEditLoadout_" .. slot .. "_" .. characterIndex
		local dsourceSetup = function ( controller )
			local results = {}
			if characterInventoryItems[baseSlot] then
				for i, itemInfo in ipairs( characterInventoryItems[baseSlot] ) do
					if not itemInfo.shouldHideInMenu then
						local levelUnlockDescription = ""
						if baseSlot ~= "primary" and baseSlot ~= "primarygrenade" then
							if itemInfo.unlockIngameLevel > 1 then
								levelUnlockDescription = Engine.Localize( "MENU_ESCALATION_LEVEL_UNLOCK_DESC", itemInfo.unlockIngameLevel )
							elseif itemInfo.cost == 0 then
								levelUnlockDescription = Engine.Localize( "MENU_FREE" )
							end
						end
						local item = {
							models = {},
							properties = {}
						}
						item.models.itemIndex = itemInfo.itemIndex
						item.models.name = itemInfo.name
						item.models.image = itemInfo.image
						item.models.desc = itemInfo.desc
						item.models.count = itemInfo.count
						item.models.cost = itemInfo.cost
						item.models.levelUnlockDescription = levelUnlockDescription
						item.properties.ref = itemInfo.ref
						item.properties.action = itemSelectionAction
						item.properties.actionParam = slot
						item.properties.weaponCategory = itemInfo.loadoutSlot
						item.properties.attachments = itemInfo.attachments
						if baseSlot == "primary" or baseSlot == "secondary" then
							item.models.attachmentDataSource = CoD.PlayerRoleUtility.CreateInventoryAttachmentDataSource( controller, "PositionEditLoadout_" .. baseSlot .. "_attachments_" .. i, itemInfo )
						end
						table.insert( results, item )
					end
				end
			end
			return results
		end
		
		DataSources[loadoutTypeDataSources[slot]] = DataSourceHelpers.ListSetup( "PositionEditLoadout_" .. slot, dsourceSetup, false )
		local f95_local4 = rootModel:create( dsource )
		f95_local4:set( loadoutTypeDataSources[slot] )
	end
	CoD.CACUtility.CreateContextualWeaponAttachmentsDataSources( "PositionLoadouts_" .. characterIndex, controller, classModel )
end )
DataSourceHelpers.GlobalDataSourceSetup( "PositionLoadoutDraftCategories", "positionLoadoutDraftCategories", function ( rootModel, controller )
	local roleCategories = Engine.GetPositionRoleCategories( Enum.eModes.MODE_MULTIPLAYER )
	local RoleCategorySort = function ( a, b )
		return roleCategories[a].sortOrder < roleCategories[b].sortOrder
	end
	
	for index, category in LUI.IterateTableBySortedKeys( roleCategories, RoleCategorySort, nil ) do
		local baseModel = rootModel:create( category.sortOrder )
		local f98_local3 = baseModel:create( "name" )
		f98_local3:set( category.displayName )
		f98_local3 = baseModel:create( "description" )
		f98_local3:set( category.description )
		f98_local3 = baseModel:create( "icon" )
		f98_local3:set( category.icon )
	end
end )
CoD.PlayerRoleUtility.GetCharacterTraits = function ( mode, characterIndex )
	local kvpItems = Engine.GetPostionRoleBundleInfo( mode, characterIndex )
	local result = {}
	for key, item in pairs( kvpItems ) do
		if LUI.startswith( key, "trait" ) and key ~= "trait_summary" then
			table.insert( result, item )
		end
	end
	return result
end

CoD.PlayerRoleUtility.GetCharacterTraitSummary = function ( mode, characterIndex )
	local kvpItems = Engine.GetPostionRoleBundleInfo( mode, characterIndex )
	local key = "trait_summary"
	local result = ""
	if kvpItems[key] ~= nil then
		result = kvpItems[key]
	end
	return result
end

CoD.PlayerRoleUtility.CreateCharacterTraitsDatasource = function ( controller, index )
	local dataSourceName = "CharacterTrait" .. tostring( index )
	DataSources[dataSourceName] = DataSourceHelpers.ListSetup( dataSourceName, function ( controller )
		local dataTable = {}
		local traits = CoD.PlayerRoleUtility.GetCharacterTraits( Engine.CurrentSessionMode(), index )
		for index, trait in ipairs( traits ) do
			table.insert( dataTable, {
				models = {
					name = trait
				},
				properties = {}
			} )
		end
		return dataTable
	end, nil, nil, nil )
	return dataSourceName
end

CoD.PlayerRoleUtility.GoBackUpdatePositionsLoadout = function ( self, controller )
	local previousMenu = GoBack( self, controller )
	SaveCurrentListSelection( previousMenu.positions )
end

CoD.PlayerRoleUtility.SetPositionDraftSelectedCharacterIndex = function ( controller )
	local characterIndex = 0
	local renderOptions = Engine.GetCharacterRenderOptionsForClientNum( controller, Engine.GetClientNum( controller ) )
	if renderOptions then
		characterIndex = renderOptions.characterIndex
	end
	CoD.BaseUtility.InitControllerModel( controller, "PositionEditLoadout.SelectedCharacterIndex", characterIndex )
end

CoD.PlayerRoleUtility.IsClientHealthAtMax = function ( controller )
	local clientNum = Engine.GetClientNum( controller )
	local f106_local0 = Engine.GetModel( Engine.GetModelForClient( clientNum ), "health" )
	local health = f106_local0:get()
	if health then
		local renderOptions = Engine.GetCharacterRenderOptionsForClientNum( controller, clientNum )
		local f106_local1 = renderOptions
		local traits = Engine.GetPlayerRoleTraits( controller, clientNum, Engine.CurrentSessionMode(), renderOptions.characterIndex )
		local f106_local2 = f106_local1 and traits
		if f106_local2 then
			return f106_local2.spawnHealth <= health
		end
	end
	return false
end

