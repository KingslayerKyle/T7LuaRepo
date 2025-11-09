CoD.CCUtility = {}
CoD.CCUtility.Heroes = {}
CoD.CCUtility.Heroes.SmallCategory = 0
CoD.CCUtility.Heroes.LargeCategory = 1
CoD.CCUtility.Heroes.HeroIndexForEdits = nil
CoD.CCUtility.Heroes.heroCustomizationTable = nil
CoD.CCUtility.Heroes.selectionTable = nil
CoD.CCUtility.Heroes.edittingLoadoutForWidget = nil
CoD.CCUtility.Heroes.loadoutListItemWidget = nil
CoD.CCUtility.Heroes.heroUpdateEvent = "updateHero"
CoD.CCUtility.Heroes.lastHeroSelectAlias = nil
CoD.CCUtility.FirstTimeFlowState = LuaEnums.createEnum( "None", "Overview", "SelectionChanged", "Complete" )
CoD.CCUtility.CreatePersonalizeColorDatasource = function ( controller, datasourceName, colorTable, customPropertiesFn )
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

local GetHeaderForLoadoutSlot = function ( slot )
	if slot == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON then
		return "HEROES_HERO_WEAPON_CAPS"
	elseif slot == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET then
		return "HEROES_HERO_ABILITY_CAPS"
	else
		return nil
	end
end

local GetHintTextForLoadoutSlot = function ( slot )
	if slot == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON then
		return "HEROES_HERO_WEAPON_HINT"
	elseif slot == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET then
		return "HEROES_HERO_ABILITY_HINT"
	else
		return nil
	end
end

local CreateCarouselItemLoadoutDatasource = function ( infoTable, mode, controller )
	local datasourceName = "HeroCarouselItemLoadoutList" .. infoTable.properties.heroIndex
	DataSources[datasourceName] = DataSourceHelpers.ListSetup( datasourceName, function ( controller )
		local dataTable = {}
		local selectedSlot = Engine.GetLoadoutTypeForHero( controller, infoTable.properties.heroIndex )
		for i = 0, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_COUNT - 1, 1 do
			local loadoutSlotInfo = Engine.GetLoadoutInfoForHero( mode, infoTable.properties.heroIndex, i )
			local isLocked = false
			if IsProgressionEnabled() or IsLive() and IsFirstTimeSetup( controller, Enum.eModes.MODE_MULTIPLAYER ) then
				isLocked = Engine.IsItemLocked( controller, loadoutSlotInfo.itemIndex, Enum.eModes.MODE_MULTIPLAYER )
			end
			if loadoutSlotInfo then
				table.insert( dataTable, {
					models = {
						name = loadoutSlotInfo.itemName,
						gameImageOff = loadoutSlotInfo.gameImageOff,
						gameImageOn = loadoutSlotInfo.gameImageOn,
						description = loadoutSlotInfo.itemDesc,
						header = GetHeaderForLoadoutSlot( i ),
						equippedSlot = i,
						itemIndex = loadoutSlotInfo.itemIndex,
						disabled = isLocked,
						itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM
					},
					properties = {
						equippedSlot = i,
						hintText = GetHintTextForLoadoutSlot( i ),
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

local CreateSelectedItemModel = function ( controller, customizationTable, equippedInfo, heroIndex, itemSlot )
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
			colorTable = CoD.CCUtility.CreatePersonalizeColorDatasource( controller, "PersonalizeListSelection_" .. heroIndex .. "_" .. itemSlot, selectedColorTable, nil )
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
			colorTable = CoD.CCUtility.CreatePersonalizeColorDatasource( controller, "PersonalizeListSelection_" .. heroIndex .. "_" .. itemSlot, selectedColorTable, nil )
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

CoD.CCUtility.GetHeroEquippedSlot = function ( controller, itemIndex )
	local mode = CoD.perController[controller].customizationMode
	local heroIndex = CoD.CCUtility.Heroes.HeroIndexForEdits
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

CoD.CCUtility.PersonalizeHeroData = {}
CoD.CCUtility.PersonalizeHeroData.Modes = LuaEnums.createEnum( "ExploringOptions", "EdittingOption", "EdittingColor", "EdittingHead" )
CoD.CCUtility.PersonalizeHeroData.EdittingArea = nil
CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex = nil
CoD.CCUtility.PersonalizeHeroData.EdittingElement = nil
CoD.CCUtility.PersonalizeHeroData.CurrentColors = nil
CoD.CCUtility.PersonalizeHeroData.SpacerRows = {}
local PersonalizeCharacterListPrepare = function ( controller )
	local infoTable = {}
	CoD.CCUtility.PersonalizeHeroData.SpacerRows = {}
	local getPrimaryItemRow = function ( area, categoryName, currentSelectionName, categoryImage, disabled )
		return {
			models = {
				categoryName = categoryName,
				categoryImage = categoryImage,
				fullCategoryName = categoryName,
				currentSelectionName = currentSelectionName or "",
				colorListDatasource = ""
			},
			properties = {
				customizationArea = area,
				colorRow = false,
				disabled = disabled
			}
		}
	end
	
	local getColorItemRow = function ( area, categoryName, fullCategoryName )
		local updateColors = function ( element )
			local colorTable = {}
			if CoD.CCUtility.Heroes.heroCustomizationTable and CoD.CCUtility.Heroes.selectionTable then
				local item, selectionTable = nil
				if area == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
					item = CoD.CCUtility.Heroes.heroCustomizationTable.bodies[CoD.CCUtility.Heroes.selectionTable.selectedBody + 1]
					selectionTable = CoD.CCUtility.Heroes.selectionTable.bodyColors
				elseif area == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
					item = CoD.CCUtility.Heroes.heroCustomizationTable.helmets[CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1]
					selectionTable = CoD.CCUtility.Heroes.selectionTable.helmetColors
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
				return CoD.CCUtility.CreatePersonalizeColorDatasource( controller, datasourceName, colorTable )
			end
		end
		
		local colorTable = {}
		local selectedColorList = nil
		return {
			models = {
				categoryName = categoryName,
				categoryImage = "",
				fullCategoryName = fullCategoryName,
				colorListDatasource = updateColors(),
				currentSelectionName = ""
			},
			properties = {
				customizationArea = area,
				colorRow = true,
				updateColors = updateColors
			}
		}
	end
	
	if CoD.CCUtility.Heroes.heroCustomizationTable and CoD.CCUtility.Heroes.selectionTable then
		local head = CoD.CCUtility.Heroes.heroCustomizationTable.helmets[CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1]
		if head then
			local f9_local0 = CoD.perController[controller].customizationMode
			local f9_local1 = Enum.eModes.MODE_CAMPAIGN
			local f9_local2 = "HEROES_HELMET"
			local headString = "HEROES_HEAD"
			table.insert( infoTable, getPrimaryItemRow( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET, REG14 and f9_local2 or headString, head.name, "uie_t7_menu_mp_hero_graphic_head" ) )
			if #CoD.CCUtility.Heroes.selectionTable.helmetColors > 0 then
				table.insert( infoTable, getColorItemRow( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET, "HEROES_COLORS", "HEROES_HELMET_COLORS" ) )
			end
			CoD.CCUtility.PersonalizeHeroData.SpacerRows[#infoTable] = true
		end
		local body = CoD.CCUtility.Heroes.heroCustomizationTable.bodies[CoD.CCUtility.Heroes.selectionTable.selectedBody + 1]
		if body then
			table.insert( infoTable, getPrimaryItemRow( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY, "HEROES_BODY", body.name, "uie_t7_menu_mp_hero_graphic_body" ) )
			if #CoD.CCUtility.Heroes.selectionTable.bodyColors > 0 then
				table.insert( infoTable, getColorItemRow( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY, "HEROES_COLORS", "HEROES_BODY_COLORS" ) )
			end
			CoD.CCUtility.PersonalizeHeroData.SpacerRows[#infoTable] = true
		end
		if CoD.perController[controller].customizationMode == Enum.eModes.MODE_MULTIPLAYER then
			table.insert( infoTable, getPrimaryItemRow( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_COUNT, "HEROES_SHOWCASE_WEAPON", nil, "uie_t7_menu_mp_hero_graphic_showcase", true ) )
			CoD.CCUtility.PersonalizeHeroData.SpacerRows[#infoTable] = true
			table.insert( infoTable, getPrimaryItemRow( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_COUNT + 1, "HEROES_TAUNTS", nil, "uie_t7_menu_mp_hero_graphic_taunt", true ) )
		end
	end
	if CoD.perController[controller].customizationMode == Enum.eModes.MODE_CAMPAIGN then
		local getHeadItemRow = function ( categoryName, categoryImage, disabled )
			return {
				models = {
					categoryName = categoryName,
					categoryImage = categoryImage,
					fullCategoryName = "",
					currentSelectionName = "",
					colorListDatasource = ""
				},
				properties = {
					colorRow = false,
					headItem = true,
					disabled = disabled
				}
			}
		end
		
		table.insert( infoTable, getHeadItemRow( "HEROES_CHANGE_CHARACTER", "uie_t7_menu_mp_hero_graphic_face" ) )
		CoD.CCUtility.PersonalizeHeroData.SpacerRows[#infoTable] = true
	end
	return infoTable
end

local PersonalizeCharacter_CustomListFns = {
	getSpacerAfterRow = function ( list, row, height )
		if CoD.CCUtility.PersonalizeHeroData.SpacerRows[row] then
			return 7
		else
			
		end
	end
}
local getBasePersonalizationItemModels = function ( index, name, image, color )
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

DataSources.CharacterCustomizationButtonList = DataSourceHelpers.ListSetup( "CharacterCustomizationButtonList", PersonalizeCharacterListPrepare, true, PersonalizeCharacter_CustomListFns )
local IsMissionCompleted = function ( controller, missionName )
	local currentStats = Engine.GetPlayerStats( controller, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_CAMPAIGN )
	return currentStats.PlayerStatsByMap[missionName].hasBeenCompleted:get() ~= 0
end

local IsBodyOrHelmetAccessible = function ( controller, styleType, index )
	if CoD.perController[controller].customizationMode == Enum.eModes.MODE_CAMPAIGN or Engine.IsCampaignGame() then
		local statsMilestones2 = "gamedata/stats/cp/statsmilestones2.csv"
		local styleTypeCol = 1
		local itemIndexCol = 2
		local missionNameCol = 3
		local rows = Engine.TableFindRows( statsMilestones2, styleTypeCol, styleType )
		if rows ~= nil then
			for rowIndex, row in ipairs( rows ) do
				local itemIndex = Engine.TableLookupGetColumnValueForRow( statsMilestones2, row, itemIndexCol )
				local missionName = Engine.TableLookupGetColumnValueForRow( statsMilestones2, row, missionNameCol )
				if itemIndex + 1 == index and (missionName == "none" or IsMissionCompleted( controller, missionName )) then
					return true
				end
			end
		end
		return false
	else
		return true
	end
end

local HeroOptionsListPrepare = function ( controller )
	local infoTable = {}
	local getItemInfo = function ( index, name, icon, color )
		local item = getBasePersonalizationItemModels( index, name, icon or "$white", color or "255 255 255" )
		item.properties.optionIndex = index
		item.properties.isColorOption = color ~= nil
		return item
	end
	
	if CoD.CCUtility.Heroes.heroCustomizationTable and CoD.CCUtility.Heroes.selectionTable and CoD.CCUtility.PersonalizeHeroData.EdittingArea and CoD.CCUtility.PersonalizeHeroData.EdittingElement then
		local baseTable, selectedBaseItem, styleType = nil
		if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
			baseTable = CoD.CCUtility.Heroes.heroCustomizationTable.bodies
			styleType = "bodystyle"
			selectedBaseItem = CoD.CCUtility.Heroes.selectionTable.selectedBody + 1
		elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
			baseTable = CoD.CCUtility.Heroes.heroCustomizationTable.helmets
			styleType = "helmetstyle"
			selectedBaseItem = CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1
		end
		if baseTable then
			if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
				local accentTable = baseTable[selectedBaseItem].accents[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex]
				if accentTable then
					for index, item in ipairs( accentTable ) do
						table.insert( infoTable, getItemInfo( index, item.name, nil, colorTableToString( item ) ) )
					end
				end
			else
				for index, item in ipairs( baseTable ) do
					if item.name and IsBodyOrHelmetAccessible( controller, styleType, index ) then
						table.insert( infoTable, getItemInfo( index, item.name, item.icon ) )
					end
				end
			end
		end
	end
	return infoTable
end

DataSources.HeroChooseOptionButtonList = DataSourceHelpers.ListSetup( "HeroCustomizationOptionList", HeroOptionsListPrepare, true )
local CharacterCustomizationColorSetListPrepare = function ( controller )
	local infoTable = {}
	local getItemInfo = function ( index, name, icon, color )
		local item = getBasePersonalizationItemModels( index, name, icon or "$white", color or "255 255 255" )
		item.properties.optionIndex = index
		item.properties.isColorOption = color ~= nil
		return item
	end
	
	if CoD.CCUtility.Heroes.heroCustomizationTable and CoD.CCUtility.Heroes.selectionTable and CoD.CCUtility.PersonalizeHeroData.EdittingArea and CoD.CCUtility.PersonalizeHeroData.EdittingElement then
		local baseTable, selectedBaseItem, selectionColors = nil
		if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
			baseTable = CoD.CCUtility.Heroes.heroCustomizationTable.bodies
			selectedBaseItem = CoD.CCUtility.Heroes.selectionTable.selectedBody + 1
			selectionColors = CoD.CCUtility.Heroes.selectionTable.bodyColors
		elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
			baseTable = CoD.CCUtility.Heroes.heroCustomizationTable.helmets
			selectedBaseItem = CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1
			selectionColors = CoD.CCUtility.Heroes.selectionTable.helmetColors
		end
		if baseTable then
			local accentTable = baseTable[selectedBaseItem].accents
			for index, accentColors in ipairs( accentTable ) do
				local customColorProperties = table.insert( infoTable, {
					models = {
						colorIndex = index,
						colorListDatasource = CoD.CCUtility.CreatePersonalizeColorDatasource( controller, "PersonalizeCharacterColorOptions_" .. index, accentColors, function ()
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

DataSources.CharacterCustomizationColorSetList = DataSourceHelpers.ListSetup( "CharacterCustomizationColorSetList", CharacterCustomizationColorSetListPrepare, true )
local GetHeroUnlockInfo = function ( controller, heroInfo )
	local loadoutType = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_FIRST
	local itemIndex = Engine.GetLoadoutItemIndexForHero( CoD.perController[controller].customizationMode, heroInfo.bodyIndex, loadoutType )
	local unlockDesc = ""
	local isLocked = false
	if IsLive() and IsFirstTimeSetup( controller, Enum.eModes.MODE_MULTIPLAYER ) then
		isLocked = Engine.IsItemLocked( controller, itemIndex, Enum.eModes.MODE_MULTIPLAYER )
	elseif heroInfo.disabled then
		isLocked = true
	elseif IsProgressionEnabled() then
		isLocked = Engine.IsItemLocked( controller, itemIndex )
		unlockDesc = CoD.GetUnlockRankAndLevelForItemIndex( controller, itemIndex, "MENU_UNLOCKED_AT" )
	end
	return isLocked, unlockDesc
end

local GetHeroModels = function ( heroInfo, index, count, controller )
	local equippedInfo = Engine.GetEquippedInfoForHero( controller, CoD.perController[controller].customizationMode, heroInfo.bodyIndex )
	local customizationTable = Engine.GetHeroCustomizationTable( CoD.perController[controller].customizationMode, heroInfo.bodyIndex )
	local isHeroLocked, unlockDesc = GetHeroUnlockInfo( controller, heroInfo )
	local f24_local0 = CoD.CCUtility.Heroes.HeroIndexForEdits
	if not f24_local0 then
		local selectHero = Engine.GetEquippedHero( controller, CoD.perController[controller].customizationMode )
	end
	local infoTable = {
		models = {
			background = heroInfo.background,
			backgroundWithCharacter = heroInfo.backgroundWithCharacter or "blacktransparent",
			name = heroInfo.displayName,
			unlockDescription = unlockDesc,
			level = 1,
			count = Engine.Localize( "MENU_X_OF_Y", index, count ),
			extraCamRender = heroInfo.bodyIndex,
			personalizeRender = heroInfo.personalizeRender or "blacktransparent",
			frozenMomentRender = heroInfo.frozenMomentRender or "blacktransparent",
			frozenMomentOverlay = heroInfo.frozenMomentOverlay or "blacktransparent",
			disabled = heroInfo.disabled or isHeroLocked,
			equippedSlot = Engine.GetLoadoutTypeForHero( controller, heroInfo.bodyIndex ),
			selectedHeadInfo = CreateSelectedItemModel( controller, customizationTable, equippedInfo, heroInfo.bodyIndex, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET ),
			selectedBodyInfo = CreateSelectedItemModel( controller, customizationTable, equippedInfo, heroInfo.bodyIndex, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY ),
			selectedShowcaseWeaponInfo = nil,
			selectedTauntInfo = nil,
			itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM
		},
		properties = {
			heroIndex = heroInfo.bodyIndex,
			selectIndex = heroInfo.bodyIndex == f24_local0
		}
	}
	if not heroInfo.disabled then
		infoTable.models.loadoutDatasource = CreateCarouselItemLoadoutDatasource( infoTable, CoD.perController[controller].customizationMode, controller )
	end
	return infoTable
end

local HeroesListPrepare = function ( controller )
	local heroTable = Engine.GetHeroList( CoD.perController[controller].customizationMode )
	local infoTable = {}
	local genderFilter = Enum.CharacterGenderTypes.CHARACTER_GENDER_TYPE_ANY
	if CoD.perController[controller].customizationMode == Enum.eModes.MODE_CAMPAIGN then
		genderFilter = Engine.GetEquippedGender( controller )
	end
	for index, heroInfo in ipairs( heroTable ) do
		if genderFilter == Enum.CharacterGenderTypes.CHARACTER_GENDER_TYPE_ANY or heroInfo.gender == genderFilter then
			table.insert( infoTable, GetHeroModels( heroInfo, index, #heroTable, controller ) )
		end
	end
	return infoTable
end

DataSources.HeroesList = DataSourceHelpers.ListSetup( "HeroesList", HeroesListPrepare, true )
local GenderListPrepare = function ( controller )
	local equippedGender = Engine.GetEquippedGender( controller )
	return {
		{
			models = {
				image = "t7_menu_cp_silhouette_male"
			},
			properties = {
				gender = Enum.CharacterGenderTypes.CHARACTER_GENDER_TYPE_MALE
			}
		},
		{
			models = {
				image = ""
			},
			properties = {
				gender = Enum.CharacterGenderTypes.CHARACTER_GENDER_TYPE_INVALID,
				selectIndex = true
			}
		},
		{
			models = {
				image = "t7_menu_cp_silhouette_female"
			},
			properties = {
				gender = Enum.CharacterGenderTypes.CHARACTER_GENDER_TYPE_FEMALE
			}
		}
	}
end

DataSources.GendersList = DataSourceHelpers.ListSetup( "GendersList", GenderListPrepare, true )
local HeadListPrepare = function ( controller )
	local completeHeadTable = Engine.GetHeadList( CoD.perController[controller].customizationMode, Engine.GetEquippedGender( controller ) )
	local infoTable = {}
	for index, headTable in ipairs( completeHeadTable ) do
		table.insert( infoTable, {
			models = {
				name = headTable.displayName,
				image = headTable.icon
			},
			properties = {
				headIndex = headTable.headIndex
			}
		} )
	end
	return infoTable
end

DataSources.HeroFaceButtonList = DataSourceHelpers.ListSetup( "HeroFaceButtonList", HeadListPrepare, true )
