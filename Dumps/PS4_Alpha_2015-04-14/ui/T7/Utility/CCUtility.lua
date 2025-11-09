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
CoD.CCUtility.CreatePersonalizeColorDatasource = function ( controller, datasourceName, colorTable, customPropertiesFn )
	DataSources[datasourceName] = DataSourceHelpers.ListSetup( datasourceName, function ( controller )
		local infoTable = {}
		for index, color in ipairs( DataSources[datasourceName].colorTable ) do
			local newItem = {
				models = {
					color = color.red .. " " .. color.green .. " " .. color.blue,
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

local CreateCarouselItemLoadoutDatasource = function ( infoTable, controller )
	local datasourceName = "HeroCarouselItemLoadoutList" .. infoTable.properties.heroIndex
	DataSources[datasourceName] = DataSourceHelpers.ListSetup( datasourceName, function ( controller )
		local dataTable = {}
		local selectedSlot = Engine.GetLoadoutTypeForHero( controller, infoTable.properties.heroIndex )
		for i = 0, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_COUNT - 1, 1 do
			local loadoutSlotInfo = Engine.GetLoadoutInfoForHero( infoTable.properties.heroIndex, i )
			if loadoutSlotInfo then
				table.insert( dataTable, {
					models = {
						name = loadoutSlotInfo.itemName,
						gameImageOff = loadoutSlotInfo.gameImageOff,
						gameImageOn = loadoutSlotInfo.gameImageOn,
						description = loadoutSlotInfo.itemDesc,
						header = GetHeaderForLoadoutSlot( i ),
						equippedSlot = i,
						disabled = loadoutSlotInfo.devOnly
					},
					properties = {
						equippedSlot = i,
						hintText = GetHintTextForLoadoutSlot( i ),
						selectIndex = selectedSlot == i
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

CoD.CCUtility.PersonalizeHeroData = {}
CoD.CCUtility.PersonalizeHeroData.Modes = {}
CoD.CCUtility.PersonalizeHeroData.Modes.ExploringOptions = 1
CoD.CCUtility.PersonalizeHeroData.Modes.EdittingOption = 2
CoD.CCUtility.PersonalizeHeroData.Modes.EdittingColor = 3
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
			table.insert( infoTable, getPrimaryItemRow( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET, "HEROES_HEAD", head.name, "uie_t7_menu_mp_hero_graphic_head" ) )
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
		if not CoD.isCampaign then
			table.insert( infoTable, getPrimaryItemRow( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_COUNT, "HEROES_SHOWCASE_WEAPON", nil, "uie_t7_menu_mp_hero_graphic_showcase", true ) )
			CoD.CCUtility.PersonalizeHeroData.SpacerRows[#infoTable] = true
			table.insert( infoTable, getPrimaryItemRow( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_COUNT + 1, "HEROES_TAUNTS", nil, "uie_t7_menu_mp_hero_graphic_taunt", true ) )
		end
	end
	return infoTable
end

local PersonalizeCharacter_CustomListFns = {
	getSpacerAfterRow = function ( list, row, height )
		if CoD.CCUtility.PersonalizeHeroData.SpacerRows[row] then
			return 10
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
local HeroOptionsListPrepare = function ( controller )
	local infoTable = {}
	local getItemInfo = function ( index, name, icon, color )
		local item = getBasePersonalizationItemModels( index, name, icon or "$white", color or "255 255 255" )
		item.properties.optionIndex = index
		item.properties.isColorOption = color ~= nil
		return item
	end
	
	if CoD.CCUtility.Heroes.heroCustomizationTable and CoD.CCUtility.Heroes.selectionTable and CoD.CCUtility.PersonalizeHeroData.EdittingArea and CoD.CCUtility.PersonalizeHeroData.EdittingElement then
		local baseTable, selectedBaseItem = nil
		if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
			baseTable = CoD.CCUtility.Heroes.heroCustomizationTable.bodies
			selectedBaseItem = CoD.CCUtility.Heroes.selectionTable.selectedBody + 1
		elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
			baseTable = CoD.CCUtility.Heroes.heroCustomizationTable.helmets
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
					if item.name then
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
local GetHeroModels = function ( heroInfo, index, count, controller )
	local equippedInfo = Engine.GetEquippedInfoForHero( controller, heroInfo.bodyIndex )
	local customizationTable = Engine.GetHeroCustomizationTable( heroInfo.bodyIndex )
	local infoTable = {
		models = {
			background = heroInfo.background,
			name = heroInfo.displayName,
			level = 1,
			count = Engine.Localize( "MENU_X_OF_Y", index, count ),
			extraCamRender = heroInfo.bodyIndex,
			personalizeRender = heroInfo.personalizeRender or "blacktransparent",
			frozenMomentRender = heroInfo.frozenMomentRender or "blacktransparent",
			disabled = heroInfo.disabled,
			equippedSlot = Engine.GetLoadoutTypeForHero( controller, heroInfo.bodyIndex ),
			selectedHeadInfo = CreateSelectedItemModel( controller, customizationTable, equippedInfo, heroInfo.bodyIndex, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET ),
			selectedBodyInfo = CreateSelectedItemModel( controller, customizationTable, equippedInfo, heroInfo.bodyIndex, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY ),
			selectedShowcaseWeaponInfo = nil,
			selectedTauntInfo = nil
		},
		properties = {
			heroIndex = heroInfo.bodyIndex,
			selectIndex = heroInfo.bodyIndex == Engine.GetEquippedHero( controller )
		}
	}
	if not heroInfo.disabled then
		infoTable.models.loadoutDatasource = CreateCarouselItemLoadoutDatasource( infoTable, controller )
	end
	return infoTable
end

local HeroesListPrepare = function ( controller )
	local heroTable = Engine.GetHeroList( Engine.GetEquippedGender( controller ) )
	local infoTable = {}
	for index, heroInfo in ipairs( heroTable ) do
		table.insert( infoTable, GetHeroModels( heroInfo, index, #heroTable, controller ) )
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
				gender = Enum.CharacterGenderTypes.CHARACTER_GENDER_TYPE_MALE,
				selectIndex = equippedGender == Enum.CharacterGenderTypes.CHARACTER_GENDER_TYPE_MALE
			}
		},
		{
			models = {
				image = "t7_menu_cp_silhouette_female"
			},
			properties = {
				gender = Enum.CharacterGenderTypes.CHARACTER_GENDER_TYPE_FEMALE,
				selectIndex = equippedGender == Enum.CharacterGenderTypes.CHARACTER_GENDER_TYPE_FEMALE
			}
		}
	}
end

DataSources.GendersList = DataSourceHelpers.ListSetup( "GendersList", GenderListPrepare, true )
local HeadListPrepare = function ( controller )
	local completeHeadTable = Engine.GetHeadList( Engine.GetEquippedGender( controller ) )
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
