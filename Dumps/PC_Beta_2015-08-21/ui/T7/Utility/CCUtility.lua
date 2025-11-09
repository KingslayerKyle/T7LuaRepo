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
CoD.CCUtility.CreatePersonalizeColorDatasource = function ( f1_arg0, f1_arg1, f1_arg2, f1_arg3 )
	DataSources[f1_arg1] = DataSourceHelpers.ListSetup( f1_arg1, function ( f2_arg0 )
		local f2_local0 = {}
		for f2_local9, f2_local10 in ipairs( DataSources[f1_arg1].colorTable ) do
			local f2_local11 = {
				models = {
					color = f2_local10.red .. " " .. f2_local10.green .. " " .. f2_local10.blue,
					icon = f2_local10.icon or "$white",
					xOfY = Engine.Localize( "MENU_X_OF_Y", f2_local9, #DataSources[f1_arg1].colorTable )
				},
				properties = {
					optionIndex = f2_local9
				}
			}
			if f1_arg3 then
				for f2_local7, f2_local8 in pairs( f1_arg3( f2_local9 ) ) do
					f2_local11.properties[f2_local7] = f2_local8
				end
			end
			table.insert( f2_local0, f2_local11 )
		end
		return f2_local0
	end, true )
	DataSources[f1_arg1].colorTable = f1_arg2
	return f1_arg1
end

local f0_local0 = function ( f3_arg0 )
	if f3_arg0 == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON then
		return "HEROES_HERO_WEAPON_CAPS"
	elseif f3_arg0 == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET then
		return "HEROES_HERO_ABILITY_CAPS"
	else
		return nil
	end
end

local f0_local1 = function ( f4_arg0 )
	if f4_arg0 == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON then
		return "HEROES_HERO_WEAPON_HINT"
	elseif f4_arg0 == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET then
		return "HEROES_HERO_ABILITY_HINT"
	else
		return nil
	end
end

local f0_local2 = function ( f5_arg0, f5_arg1, f5_arg2 )
	local f5_local0 = "HeroCarouselItemLoadoutList" .. f5_arg0.properties.heroIndex
	DataSources[f5_local0] = DataSourceHelpers.ListSetup( f5_local0, function ( f6_arg0 )
		local f6_local0 = {}
		local f6_local1 = Engine.GetLoadoutTypeForHero( f6_arg0, f5_arg0.properties.heroIndex )
		for f6_local2 = 0, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_COUNT - 1, 1 do
			local f6_local5 = Engine.GetLoadoutInfoForHero( f5_arg1, f5_arg0.properties.heroIndex, f6_local2 )
			local f6_local6 = false
			if IsProgressionEnabled() or IsLive() and IsFirstTimeSetup( f6_arg0, Enum.eModes.MODE_MULTIPLAYER ) then
				f6_local6 = Engine.IsItemLocked( f6_arg0, f6_local5.itemIndex, Enum.eModes.MODE_MULTIPLAYER )
			end
			if f6_local5 then
				table.insert( f6_local0, {
					models = {
						name = f6_local5.itemName,
						gameImageOff = f6_local5.gameImageOff,
						gameImageOn = f6_local5.gameImageOn,
						description = f6_local5.itemDesc,
						header = f0_local0( f6_local2 ),
						equippedSlot = f6_local2,
						itemIndex = f6_local5.itemIndex,
						disabled = f6_local6,
						itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM
					},
					properties = {
						equippedSlot = f6_local2,
						hintText = f0_local1( f6_local2 ),
						selectIndex = f6_local1 == f6_local2,
						heroIndex = f5_arg0.properties.heroIndex
					}
				} )
			end
		end
		return f6_local0
	end, true )
	return f5_local0
end

local f0_local3 = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3, f7_arg4 )
	local f7_local0 = ""
	local f7_local1 = ""
	local f7_local2 = ""
	if f7_arg4 == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
		f7_local0 = "HEROES_BODY"
		local f7_local3 = f7_arg1.bodies[f7_arg2.selectedBody + 1]
		if f7_local3 then
			f7_local1 = f7_local3.name
			local f7_local4 = {}
			for f7_local8, f7_local9 in ipairs( f7_arg2.bodyColors ) do
				table.insert( f7_local4, f7_local3.accents[f7_local8][f7_local9 + 1] )
			end
			f7_local2 = CoD.CCUtility.CreatePersonalizeColorDatasource( f7_arg0, "PersonalizeListSelection_" .. f7_arg3 .. "_" .. f7_arg4, f7_local4, nil )
		end
	elseif f7_arg4 == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
		f7_local0 = "HEROES_HEAD"
		local f7_local3 = f7_arg1.helmets[f7_arg2.selectedHelmet + 1]
		if f7_local3 then
			f7_local1 = f7_local3.name
			local f7_local4 = {}
			for f7_local8, f7_local9 in ipairs( f7_arg2.helmetColors ) do
				table.insert( f7_local4, f7_local3.accents[f7_local8][f7_local9 + 1] )
			end
			f7_local2 = CoD.CCUtility.CreatePersonalizeColorDatasource( f7_arg0, "PersonalizeListSelection_" .. f7_arg3 .. "_" .. f7_arg4, f7_local4, nil )
		end
	else
		return nil
	end
	return {
		categoryName = f7_local0,
		currentSelectionName = f7_local1,
		colorListDatasource = f7_local2
	}
end

CoD.CCUtility.GetHeroEquippedSlot = function ( f8_arg0, f8_arg1 )
	local f8_local0 = CoD.perController[f8_arg0].customizationMode
	local f8_local1 = CoD.CCUtility.Heroes.HeroIndexForEdits
	local f8_local2 = nil
	for f8_local3 = 0, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_COUNT - 1, 1 do
		local f8_local6 = Engine.GetLoadoutInfoForHero( f8_local0, f8_local1, f8_local3 )
		if f8_local6.itemIndex == f8_arg1 then
			f8_local2 = f8_local3
			break
		end
	end
	return f8_local2
end

CoD.CCUtility.PersonalizeHeroData = {}
CoD.CCUtility.PersonalizeHeroData.Modes = LuaEnums.createEnum( "ExploringOptions", "EdittingOption", "EdittingColor", "EdittingHead" )
CoD.CCUtility.PersonalizeHeroData.EdittingArea = nil
CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex = nil
CoD.CCUtility.PersonalizeHeroData.EdittingElement = nil
CoD.CCUtility.PersonalizeHeroData.CurrentColors = nil
CoD.CCUtility.PersonalizeHeroData.SpacerRows = {}
local f0_local4 = function ( f9_arg0 )
	local f9_local0 = {}
	CoD.CCUtility.PersonalizeHeroData.SpacerRows = {}
	local f9_local1 = function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3, f10_arg4 )
		return {
			models = {
				categoryName = f10_arg1,
				categoryImage = f10_arg3,
				fullCategoryName = f10_arg1,
				currentSelectionName = f10_arg2 or "",
				colorListDatasource = ""
			},
			properties = {
				customizationArea = f10_arg0,
				colorRow = false,
				disabled = f10_arg4
			}
		}
	end
	
	local f9_local2 = function ( f11_arg0, f11_arg1, f11_arg2 )
		local f11_local0 = function ( f12_arg0 )
			local f12_local0 = {}
			if CoD.CCUtility.Heroes.heroCustomizationTable and CoD.CCUtility.Heroes.selectionTable then
				local f12_local1, f12_local2 = nil
				if f11_arg0 == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
					f12_local1 = CoD.CCUtility.Heroes.heroCustomizationTable.bodies[CoD.CCUtility.Heroes.selectionTable.selectedBody + 1]
					f12_local2 = CoD.CCUtility.Heroes.selectionTable.bodyColors
				elseif f11_arg0 == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
					f12_local1 = CoD.CCUtility.Heroes.heroCustomizationTable.helmets[CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1]
					f12_local2 = CoD.CCUtility.Heroes.selectionTable.helmetColors
				end
				if f12_local1 then
					for f12_local6, f12_local7 in ipairs( f12_local2 ) do
						table.insert( f12_local0, f12_local1.accents[f12_local6][f12_local7 + 1] )
					end
				end
			end
			local f12_local1 = "PersonalizeCharacterColors_" .. f11_arg0
			if DataSources[f12_local1] then
				DataSources[f12_local1].colorTable = f12_local0
				if f12_arg0 then
					f12_arg0:updateDatasource()
				end
				return f12_local1
			else
				return CoD.CCUtility.CreatePersonalizeColorDatasource( f9_arg0, f12_local1, f12_local0 )
			end
		end
		
		local f11_local1 = {}
		local f11_local2 = nil
		return {
			models = {
				categoryName = f11_arg1,
				categoryImage = "",
				fullCategoryName = f11_arg2,
				colorListDatasource = f11_local0(),
				currentSelectionName = ""
			},
			properties = {
				customizationArea = f11_arg0,
				colorRow = true,
				updateColors = f11_local0
			}
		}
	end
	
	if CoD.CCUtility.Heroes.heroCustomizationTable and CoD.CCUtility.Heroes.selectionTable then
		local f9_local3 = CoD.CCUtility.Heroes.heroCustomizationTable.helmets[CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1]
		if f9_local3 then
			local f9_local4 = CoD.perController[f9_arg0].customizationMode
			local f9_local5 = Enum.eModes.MODE_CAMPAIGN
			table.insert( f9_local0, f9_local1( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET, REG14 and "HEROES_HELMET" or "HEROES_HEAD", f9_local3.name, "uie_t7_menu_mp_hero_graphic_head" ) )
			if #CoD.CCUtility.Heroes.selectionTable.helmetColors > 0 then
				table.insert( f9_local0, f9_local2( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET, "HEROES_COLORS", "HEROES_HELMET_COLORS" ) )
			end
			CoD.CCUtility.PersonalizeHeroData.SpacerRows[#f9_local0] = true
		end
		local f9_local4 = CoD.CCUtility.Heroes.heroCustomizationTable.bodies[CoD.CCUtility.Heroes.selectionTable.selectedBody + 1]
		if f9_local4 then
			table.insert( f9_local0, f9_local1( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY, "HEROES_BODY", f9_local4.name, "uie_t7_menu_mp_hero_graphic_body" ) )
			if #CoD.CCUtility.Heroes.selectionTable.bodyColors > 0 then
				table.insert( f9_local0, f9_local2( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY, "HEROES_COLORS", "HEROES_BODY_COLORS" ) )
			end
			CoD.CCUtility.PersonalizeHeroData.SpacerRows[#f9_local0] = true
		end
		if CoD.perController[f9_arg0].customizationMode == Enum.eModes.MODE_MULTIPLAYER then
			table.insert( f9_local0, f9_local1( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_COUNT, "HEROES_SHOWCASE_WEAPON", nil, "uie_t7_menu_mp_hero_graphic_showcase", true ) )
			CoD.CCUtility.PersonalizeHeroData.SpacerRows[#f9_local0] = true
			table.insert( f9_local0, f9_local1( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_COUNT + 1, "HEROES_TAUNTS", nil, "uie_t7_menu_mp_hero_graphic_taunt", true ) )
		end
	end
	if CoD.perController[f9_arg0].customizationMode == Enum.eModes.MODE_CAMPAIGN then
		local f9_local3 = function ( f13_arg0, f13_arg1, f13_arg2 )
			return {
				models = {
					categoryName = f13_arg0,
					categoryImage = f13_arg1,
					fullCategoryName = "",
					currentSelectionName = "",
					colorListDatasource = ""
				},
				properties = {
					colorRow = false,
					headItem = true,
					disabled = f13_arg2
				}
			}
		end
		
		table.insert( f9_local0, f9_local3( "HEROES_CHANGE_CHARACTER", "uie_t7_menu_mp_hero_graphic_face" ) )
		CoD.CCUtility.PersonalizeHeroData.SpacerRows[#f9_local0] = true
	end
	return f9_local0
end

local f0_local5 = {
	getSpacerAfterRow = function ( f14_arg0, f14_arg1, f14_arg2 )
		if CoD.CCUtility.PersonalizeHeroData.SpacerRows[f14_arg1] then
			return 7
		else
			
		end
	end
}
local f0_local6 = function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3 )
	return {
		models = {
			name = f15_arg1,
			image = f15_arg2 or "$white",
			color = f15_arg3,
			optionIndex = f15_arg0
		},
		properties = {}
	}
end

DataSources.CharacterCustomizationButtonList = DataSourceHelpers.ListSetup( "CharacterCustomizationButtonList", f0_local4, true, f0_local5 )
local f0_local7 = function ( f16_arg0, f16_arg1 )
	local f16_local0 = Engine.GetPlayerStats( f16_arg0, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_CAMPAIGN )
	return f16_local0.PlayerStatsByMap[f16_arg1].hasBeenCompleted:get() ~= 0
end

local f0_local8 = function ( f17_arg0, f17_arg1, f17_arg2 )
	if CoD.perController[f17_arg0].customizationMode == Enum.eModes.MODE_CAMPAIGN or Engine.IsCampaignGame() then
		local f17_local0 = "gamedata/stats/cp/statsmilestones2.csv"
		local f17_local1 = 1
		local f17_local2 = 2
		local f17_local3 = 3
		local f17_local4 = Engine.TableFindRows( f17_local0, f17_local1, f17_arg1 )
		if f17_local4 ~= nil then
			for f17_local8, f17_local9 in ipairs( f17_local4 ) do
				local f17_local10 = Engine.TableLookupGetColumnValueForRow( f17_local0, f17_local9, f17_local2 )
				local f17_local11 = Engine.TableLookupGetColumnValueForRow( f17_local0, f17_local9, f17_local3 )
				if f17_local10 + 1 == f17_arg2 and (f17_local11 == "none" or f0_local7( f17_arg0, f17_local11 )) then
					return true
				end
			end
		end
		return false
	else
		return true
	end
end

DataSources.HeroChooseOptionButtonList = DataSourceHelpers.ListSetup( "HeroCustomizationOptionList", function ( f18_arg0 )
	local f18_local0 = {}
	local f18_local1 = function ( f19_arg0, f19_arg1, f19_arg2, f19_arg3 )
		local f19_local0 = f0_local6( f19_arg0, f19_arg1, f19_arg2 or "$white", f19_arg3 or "255 255 255" )
		f19_local0.properties.optionIndex = f19_arg0
		f19_local0.properties.isColorOption = f19_arg3 ~= nil
		return f19_local0
	end
	
	if CoD.CCUtility.Heroes.heroCustomizationTable and CoD.CCUtility.Heroes.selectionTable and CoD.CCUtility.PersonalizeHeroData.EdittingArea and CoD.CCUtility.PersonalizeHeroData.EdittingElement then
		local f18_local2, f18_local3, f18_local4 = nil
		if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
			f18_local2 = CoD.CCUtility.Heroes.heroCustomizationTable.bodies
			f18_local4 = "bodystyle"
			f18_local3 = CoD.CCUtility.Heroes.selectionTable.selectedBody + 1
		elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
			f18_local2 = CoD.CCUtility.Heroes.heroCustomizationTable.helmets
			f18_local4 = "helmetstyle"
			f18_local3 = CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1
		end
		if f18_local2 then
			if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
				local f18_local5 = f18_local2[f18_local3].accents[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex]
				if f18_local5 then
					for f18_local9, f18_local10 in ipairs( f18_local5 ) do
						table.insert( f18_local0, f18_local1( f18_local9, f18_local10.name, nil, colorTableToString( f18_local10 ) ) )
					end
				end
			else
				for f18_local8, f18_local9 in ipairs( f18_local2 ) do
					if f18_local9.name and f0_local8( f18_arg0, f18_local4, f18_local8 ) then
						table.insert( f18_local0, f18_local1( f18_local8, f18_local9.name, f18_local9.icon ) )
					end
				end
			end
		end
	end
	return f18_local0
end, true )
DataSources.CharacterCustomizationColorSetList = DataSourceHelpers.ListSetup( "CharacterCustomizationColorSetList", function ( f20_arg0 )
	local f20_local0 = {}
	local f20_local1 = function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3 )
		local f21_local0 = f0_local6( f21_arg0, f21_arg1, f21_arg2 or "$white", f21_arg3 or "255 255 255" )
		f21_local0.properties.optionIndex = f21_arg0
		f21_local0.properties.isColorOption = f21_arg3 ~= nil
		return f21_local0
	end
	
	if CoD.CCUtility.Heroes.heroCustomizationTable and CoD.CCUtility.Heroes.selectionTable and CoD.CCUtility.PersonalizeHeroData.EdittingArea and CoD.CCUtility.PersonalizeHeroData.EdittingElement then
		local f20_local2, f20_local3, f20_local4 = nil
		if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
			f20_local2 = CoD.CCUtility.Heroes.heroCustomizationTable.bodies
			f20_local3 = CoD.CCUtility.Heroes.selectionTable.selectedBody + 1
			f20_local4 = CoD.CCUtility.Heroes.selectionTable.bodyColors
		elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
			f20_local2 = CoD.CCUtility.Heroes.heroCustomizationTable.helmets
			f20_local3 = CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1
			f20_local4 = CoD.CCUtility.Heroes.selectionTable.helmetColors
		end
		if f20_local2 then
			for f20_local8, f20_local9 in ipairs( f20_local2[f20_local3].accents ) do
				local f20_local10 = table.insert( f20_local0, {
					models = {
						colorIndex = f20_local8,
						colorListDatasource = CoD.CCUtility.CreatePersonalizeColorDatasource( f20_arg0, "PersonalizeCharacterColorOptions_" .. f20_local8, f20_local9, function ()
							return {
								colorTableIndex = f20_local8
							}
						end
						 ),
						selectedColor = f20_local4[f20_local8] + 1
					}
				} )
			end
		end
	end
	return f20_local0
end, true )
local f0_local9 = function ( f23_arg0, f23_arg1 )
	local f23_local0 = Engine.GetLoadoutItemIndexForHero( CoD.perController[f23_arg0].customizationMode, f23_arg1.bodyIndex, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_FIRST )
	local f23_local1 = ""
	local f23_local2 = false
	if IsLive() and IsFirstTimeSetup( f23_arg0, Enum.eModes.MODE_MULTIPLAYER ) then
		f23_local2 = Engine.IsItemLocked( f23_arg0, f23_local0, Enum.eModes.MODE_MULTIPLAYER )
	elseif f23_arg1.disabled then
		f23_local2 = true
	elseif IsProgressionEnabled() then
		f23_local2 = Engine.IsItemLocked( f23_arg0, f23_local0 )
		f23_local1 = CoD.GetUnlockRankAndLevelForItemIndex( f23_arg0, f23_local0, "MENU_UNLOCKED_AT" )
	end
	return f23_local2, f23_local1
end

local f0_local10 = function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3 )
	local f24_local0 = Engine.GetEquippedInfoForHero( f24_arg3, CoD.perController[f24_arg3].customizationMode, f24_arg0.bodyIndex )
	local f24_local1 = Engine.GetHeroCustomizationTable( CoD.perController[f24_arg3].customizationMode, f24_arg0.bodyIndex )
	local f24_local2, f24_local3 = f0_local9( f24_arg3, f24_arg0 )
	local f24_local4 = CoD.CCUtility.Heroes.HeroIndexForEdits
	if not f24_local4 then
		f24_local4 = Engine.GetEquippedHero( f24_arg3, CoD.perController[f24_arg3].customizationMode )
	end
	local f24_local5 = {
		models = {
			background = f24_arg0.background,
			backgroundWithCharacter = f24_arg0.backgroundWithCharacter or "blacktransparent",
			name = f24_arg0.displayName,
			unlockDescription = f24_local3,
			level = 1,
			count = Engine.Localize( "MENU_X_OF_Y", f24_arg1, f24_arg2 ),
			extraCamRender = f24_arg0.bodyIndex,
			personalizeRender = f24_arg0.personalizeRender or "blacktransparent",
			frozenMomentRender = f24_arg0.frozenMomentRender or "blacktransparent",
			frozenMomentOverlay = f24_arg0.frozenMomentOverlay or "blacktransparent",
			disabled = f24_arg0.disabled or f24_local2,
			equippedSlot = Engine.GetLoadoutTypeForHero( f24_arg3, f24_arg0.bodyIndex ),
			selectedHeadInfo = f0_local3( f24_arg3, f24_local1, f24_local0, f24_arg0.bodyIndex, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET ),
			selectedBodyInfo = f0_local3( f24_arg3, f24_local1, f24_local0, f24_arg0.bodyIndex, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY ),
			selectedShowcaseWeaponInfo = nil,
			selectedTauntInfo = nil,
			itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM
		},
		properties = {
			heroIndex = f24_arg0.bodyIndex,
			selectIndex = f24_arg0.bodyIndex == f24_local4
		}
	}
	if not f24_arg0.disabled then
		f24_local5.models.loadoutDatasource = f0_local2( f24_local5, CoD.perController[f24_arg3].customizationMode, f24_arg3 )
	end
	return f24_local5
end

DataSources.HeroesList = DataSourceHelpers.ListSetup( "HeroesList", function ( f25_arg0 )
	local f25_local0 = Engine.GetHeroList( CoD.perController[f25_arg0].customizationMode )
	local f25_local1 = {}
	local f25_local2 = Enum.CharacterGenderTypes.CHARACTER_GENDER_TYPE_ANY
	if CoD.perController[f25_arg0].customizationMode == Enum.eModes.MODE_CAMPAIGN then
		f25_local2 = Engine.GetEquippedGender( f25_arg0 )
	end
	for f25_local6, f25_local7 in ipairs( f25_local0 ) do
		if f25_local2 == Enum.CharacterGenderTypes.CHARACTER_GENDER_TYPE_ANY or f25_local7.gender == f25_local2 then
			table.insert( f25_local1, f0_local10( f25_local7, f25_local6, #f25_local0, f25_arg0 ) )
		end
	end
	return f25_local1
end, true )
DataSources.GendersList = DataSourceHelpers.ListSetup( "GendersList", function ( f26_arg0 )
	local f26_local0 = Engine.GetEquippedGender( f26_arg0 )
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
end, true )
DataSources.HeroFaceButtonList = DataSourceHelpers.ListSetup( "HeroFaceButtonList", function ( f27_arg0 )
	local f27_local0 = Engine.GetHeadList( CoD.perController[f27_arg0].customizationMode, Engine.GetEquippedGender( f27_arg0 ) )
	local f27_local1 = {}
	for f27_local5, f27_local6 in ipairs( f27_local0 ) do
		table.insert( f27_local1, {
			models = {
				name = f27_local6.displayName,
				image = f27_local6.icon
			},
			properties = {
				headIndex = f27_local6.headIndex
			}
		} )
	end
	return f27_local1
end, true )
