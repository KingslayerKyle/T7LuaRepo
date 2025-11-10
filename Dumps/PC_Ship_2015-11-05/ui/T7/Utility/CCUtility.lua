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
CoD.CCUtility.customizationMode = nil
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
			if IsProgressionEnabled( f6_arg0 ) or IsLive() and IsFirstTimeSetup( f6_arg0, Enum.eModes.MODE_MULTIPLAYER ) then
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

local f0_local3 = function ( f7_arg0, f7_arg1, f7_arg2, f7_arg3 )
	local f7_local0 = "HeroCarouselCardBackList" .. f7_arg0.properties.heroIndex
	DataSources[f7_local0] = DataSourceHelpers.ListSetup( f7_local0, function ( f8_arg0 )
		local f8_local0 = {}
		local f8_local1 = function ( f9_arg0, f9_arg1, f9_arg2, f9_arg3 )
			local f9_local0 = {
				models = {
					text = f9_arg0,
					icon = f9_arg1
				},
				properties = {}
			}
			if f9_arg2 then
				for f9_local4, f9_local5 in pairs( f9_arg2 ) do
					f9_local0.models[f9_local4] = f9_local5
				end
			end
			if f9_arg3 then
				for f9_local4, f9_local5 in pairs( f9_arg3 ) do
					f9_local0.properties[f9_local4] = f9_local5
				end
			end
			return f9_local0
		end
		
		local f8_local2 = function ( f10_arg0, f10_arg1, f10_arg2 )
			return Engine.Localize( "HEROES_CARD_BACK_ENTRY", f10_arg0, f10_arg1, f10_arg2 or "" )
		end
		
		local f8_local3 = 1
		table.insert( f8_local0, f8_local1( f8_local2( f8_local3, 1, "HEROES_BIO" ), "t7_hud_hero_icon_filetype_text", {
			cardBackIcon = f7_arg1.cardBackIcon,
			realName = f7_arg1.realName,
			age = f7_arg1.age,
			genderString = f7_arg1.genderString,
			bio = f7_arg1.bio,
			frameWidget = "CoD.ChooseCharacterLoadout_CardBack_Bio"
		}, nil ) )
		f8_local3 = f8_local3 + 1
		local f8_local4 = Engine.GetLoadoutInfoForHero( f7_arg2, f7_arg0.properties.heroIndex, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
		if f8_local4 then
			table.insert( f8_local0, f8_local1( f8_local2( f8_local3, 1, f8_local4.itemName ), "t7_hud_hero_icon_filetype_details", {
				weaponSubItem = f8_local2( f8_local3, 3, f7_arg1.weaponSubItemDesc ),
				weaponCardBackIcon = f7_arg1.weaponCardBackIcon or "blacktransparent",
				weaponCardBackSubIcon = f7_arg1.weaponCardBackSubIcon or "blacktransparent",
				weaponDesc = f7_arg1.weaponCardBackDesc,
				weaponSchemaTitle = f8_local2( f8_local3, 2, "HEROES_SCHEMA" ),
				weaponSchema = f7_arg1.weaponSchema,
				frameWidget = "CoD.ChooseCharacterLoadout_CardBack_Weapon"
			}, nil ) )
		end
		f8_local3 = f8_local3 + 1
		local f8_local5 = Engine.GetLoadoutInfoForHero( f7_arg2, f7_arg0.properties.heroIndex, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET )
		if f8_local5 then
			table.insert( f8_local0, f8_local1( f8_local2( f8_local3, 1, f8_local5.itemName ), "t7_hud_hero_icon_filetype_details", {
				abilitySubItem = f8_local2( f8_local3, 3, f7_arg1.abilitySubItemDesc ),
				abilityCardBackIcon = f7_arg1.abilityCardBackIcon or "blacktransparent",
				abilityCardBackSubIcon = f7_arg1.abilityCardBackSubIcon or "blacktransparent",
				abilityDesc = f7_arg1.abilityCardBackDesc,
				abilitySchemaTitle = f8_local2( f8_local3, 2, "HEROES_SCHEMA" ),
				abilitySchema = f7_arg1.abilitySchema,
				frameWidget = "CoD.ChooseCharacterLoadout_CardBack_Ability"
			}, nil ) )
		end
		f8_local3 = f8_local3 + 1
		return f8_local0
	end, true )
	return f7_local0
end

local f0_local4 = function ( f11_arg0, f11_arg1, f11_arg2, f11_arg3, f11_arg4 )
	local f11_local0 = ""
	local f11_local1 = ""
	local f11_local2 = ""
	if f11_arg4 == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
		f11_local0 = "HEROES_BODY"
		local f11_local3 = f11_arg1.bodies[f11_arg2.selectedBody + 1]
		if f11_local3 then
			f11_local1 = f11_local3.name
			local f11_local4 = {}
			for f11_local8, f11_local9 in ipairs( f11_arg2.bodyColors ) do
				table.insert( f11_local4, f11_local3.accents[f11_local8][f11_local9 + 1] )
			end
			f11_local2 = CoD.CCUtility.CreatePersonalizeColorDatasource( f11_arg0, "PersonalizeListSelection_" .. f11_arg3 .. "_" .. f11_arg4, f11_local4, nil )
		end
	elseif f11_arg4 == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
		f11_local0 = "HEROES_HEAD"
		local f11_local3 = f11_arg1.helmets[f11_arg2.selectedHelmet + 1]
		if f11_local3 then
			f11_local1 = f11_local3.name
			local f11_local4 = {}
			for f11_local8, f11_local9 in ipairs( f11_arg2.helmetColors ) do
				table.insert( f11_local4, f11_local3.accents[f11_local8][f11_local9 + 1] )
			end
			f11_local2 = CoD.CCUtility.CreatePersonalizeColorDatasource( f11_arg0, "PersonalizeListSelection_" .. f11_arg3 .. "_" .. f11_arg4, f11_local4, nil )
		end
	else
		return nil
	end
	return {
		categoryName = f11_local0,
		currentSelectionName = f11_local1,
		colorListDatasource = f11_local2
	}
end

CoD.CCUtility.GetHeroEquippedSlot = function ( f12_arg0, f12_arg1 )
	local f12_local0 = CoD.CCUtility.customizationMode
	local f12_local1 = CoD.CCUtility.Heroes.HeroIndexForEdits
	local f12_local2 = nil
	for f12_local3 = 0, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_COUNT - 1, 1 do
		local f12_local6 = Engine.GetLoadoutInfoForHero( f12_local0, f12_local1, f12_local3 )
		if f12_local6.itemIndex == f12_arg1 then
			f12_local2 = f12_local3
			break
		end
	end
	return f12_local2
end

CoD.CCUtility.PersonalizeHeroData = {}
CoD.CCUtility.PersonalizeHeroData.Modes = LuaEnums.createEnum( "ExploringOptions", "EdittingOption" )
CoD.CCUtility.PersonalizeHeroData.EdittingArea = nil
CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex = nil
CoD.CCUtility.PersonalizeHeroData.EdittingElement = nil
CoD.CCUtility.PersonalizeHeroData.CurrentColors = nil
CoD.CCUtility.PersonalizeHeroData.MaxWeaponAttachments = 8
CoD.CCUtility.PersonalizeHeroData.SpacerRows = {}
local f0_local5 = function ( f13_arg0 )
	local f13_local0 = {}
	CoD.CCUtility.PersonalizeHeroData.SpacerRows = {}
	local f13_local1 = function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3, f14_arg4, f14_arg5, f14_arg6 )
		local f14_local0 = 0
		if f14_arg2 then
			f14_local0 = 1
		end
		local f14_local1 = 0
		if f14_arg3 then
			f14_local1 = 1
		end
		return {
			models = {
				categoryName = f14_arg1,
				categoryImage = f14_arg5,
				fullCategoryName = f14_arg1,
				categoryDesc = f14_arg4 or "",
				currentSelectionName = f14_arg2 or "",
				currentSelectionVariantName = f14_arg3 or "",
				colorListDatasource = "",
				currentSelectionNameAlpha = f14_local0,
				currentSelectionVariantNameAlpha = f14_local1
			},
			properties = {
				customizationArea = f14_arg0,
				colorRow = false,
				disabled = f14_arg6
			}
		}
	end
	
	local f13_local2 = function ( f15_arg0, f15_arg1, f15_arg2, f15_arg3, f15_arg4, f15_arg5 )
		local f15_local0 = function ( f16_arg0 )
			local f16_local0 = {}
			if CoD.CCUtility.Heroes.heroCustomizationTable and CoD.CCUtility.Heroes.selectionTable then
				local f16_local1, f16_local2 = nil
				if f15_arg0 == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
					f16_local1 = CoD.CCUtility.Heroes.heroCustomizationTable.bodies[CoD.CCUtility.Heroes.selectionTable.selectedBody + 1]
					f16_local2 = CoD.CCUtility.Heroes.selectionTable.bodyColors
				elseif f15_arg0 == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
					f16_local1 = CoD.CCUtility.Heroes.heroCustomizationTable.helmets[CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1]
					f16_local2 = CoD.CCUtility.Heroes.selectionTable.helmetColors
				end
				if f16_local1 then
					for f16_local6, f16_local7 in ipairs( f16_local2 ) do
						table.insert( f16_local0, f16_local1.accents[f16_local6][f16_local7 + 1] )
					end
				end
			end
			local f16_local1 = "PersonalizeCharacterColors_" .. f15_arg0
			if DataSources[f16_local1] then
				DataSources[f16_local1].colorTable = f16_local0
				if f16_arg0 then
					f16_arg0:updateDatasource()
				end
				return f16_local1
			else
				return CoD.CCUtility.CreatePersonalizeColorDatasource( f13_arg0, f16_local1, f16_local0 )
			end
		end
		
		local f15_local1 = 0
		if f15_arg2 then
			f15_local1 = 1
		end
		local f15_local2 = 0
		if f15_arg3 then
			f15_local2 = 1
		end
		local f15_local3 = {}
		local f15_local4 = nil
		return {
			models = {
				categoryName = f15_arg1,
				categoryImage = "",
				fullCategoryName = f15_arg5,
				colorListDatasource = f15_local0(),
				categoryDesc = f15_arg4 or "",
				currentSelectionName = f15_arg2 or "",
				currentSelectionVariantName = f15_arg3 or "",
				currentSelectionNameAlpha = f15_local1,
				currentSelectionVariantNameAlpha = f15_local2
			},
			properties = {
				customizationArea = f15_arg0,
				colorRow = true,
				updateColors = f15_local0
			}
		}
	end
	
	local f13_local3 = function ( f17_arg0 )
		local f17_local0 = CoD.CCUtility.customizationMode
		local f17_local1 = CoD.CCUtility.Heroes.HeroIndexForEdits
		return {
			baseWeaponName = Engine.Localize( Engine.GetItemName( Engine.GetHeroShowcaseWeaponAttribute( f17_arg0, f17_local0, f17_local1, "weaponIndex" ) ) ),
			variantName = Engine.GetHeroShowcaseWeaponVariantName( f17_arg0, f17_local0, f17_local1 )
		}
	end
	
	if CoD.CCUtility.Heroes.heroCustomizationTable and CoD.CCUtility.Heroes.selectionTable then
		local f13_local4 = CoD.CCUtility.Heroes.heroCustomizationTable.helmets[CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1]
		if f13_local4 then
			local f13_local5 = CoD.CCUtility.customizationMode
			local f13_local6 = Enum.eModes.MODE_CAMPAIGN
			table.insert( f13_local0, f13_local1( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET, REG19 and "HEROES_HELMET" or "HEROES_HEAD", f13_local4.name, nil, nil, "uie_t7_menu_mp_hero_graphic_head" ) )
			if #CoD.CCUtility.Heroes.selectionTable.helmetColors > 0 and Dvar.cg_development:get() then
				table.insert( f13_local0, f13_local2( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET, "HEROES_COLORS", f13_local4.accents[1][CoD.CCUtility.Heroes.selectionTable.helmetColors[1] + 1].name, nil, nil, "HEROES_HELMET_COLORS" ) )
			end
			CoD.CCUtility.PersonalizeHeroData.SpacerRows[#f13_local0] = true
		end
		local f13_local5 = CoD.CCUtility.Heroes.heroCustomizationTable.bodies[CoD.CCUtility.Heroes.selectionTable.selectedBody + 1]
		if f13_local5 then
			table.insert( f13_local0, f13_local1( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY, "HEROES_BODY", f13_local5.name, nil, nil, "uie_t7_menu_mp_hero_graphic_body" ) )
			if #CoD.CCUtility.Heroes.selectionTable.bodyColors > 0 and Dvar.cg_development:get() then
				table.insert( f13_local0, f13_local2( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY, "HEROES_COLORS", f13_local5.accents[1][CoD.CCUtility.Heroes.selectionTable.bodyColors[1] + 1].name, nil, nil, "HEROES_BODY_COLORS" ) )
			end
			CoD.CCUtility.PersonalizeHeroData.SpacerRows[#f13_local0] = true
		end
		if CoD.CCUtility.customizationMode == Enum.eModes.MODE_MULTIPLAYER then
			local f13_local6 = f13_local3( f13_arg0 )
			table.insert( f13_local0, f13_local1( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_COUNT, "HEROES_SHOWCASE_WEAPON", f13_local6.baseWeaponName, f13_local6.variantName, Engine.Localize( "HEROES_SHOWCASE_WEAPON_DESC", Engine.Localize( Engine.GetHeroName( CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits ) ) ), "uie_t7_menu_mp_hero_graphic_showcase" ) )
			CoD.CCUtility.PersonalizeHeroData.SpacerRows[#f13_local0] = true
			if TauntsEnabled() then
				table.insert( f13_local0, f13_local1( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_COUNT + 1, "HEROES_TAUNTS", nil, nil, nil, "uie_t7_menu_mp_hero_graphic_taunt", true ) )
			end
		end
	end
	if CoD.CCUtility.customizationMode == Enum.eModes.MODE_CAMPAIGN then
		local f13_local4 = function ( f18_arg0, f18_arg1, f18_arg2 )
			return {
				models = {
					categoryName = f18_arg0,
					categoryImage = f18_arg1,
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
					disabled = f18_arg2
				}
			}
		end
		
		table.insert( f13_local0, f13_local4( "HEROES_CHANGE_CHARACTER", "uie_t7_menu_mp_hero_graphic_face" ) )
		CoD.CCUtility.PersonalizeHeroData.SpacerRows[#f13_local0] = true
	end
	return f13_local0
end

local f0_local6 = {
	getSpacerAfterRow = function ( f19_arg0, f19_arg1, f19_arg2 )
		if CoD.CCUtility.PersonalizeHeroData.SpacerRows[f19_arg1] then
			return 7
		else
			
		end
	end
}
local f0_local7 = function ( f20_arg0, f20_arg1, f20_arg2, f20_arg3 )
	return {
		models = {
			name = f20_arg1,
			image = f20_arg2 or "$white",
			color = f20_arg3,
			optionIndex = f20_arg0
		},
		properties = {}
	}
end

DataSources.CharacterCustomizationButtonList = DataSourceHelpers.ListSetup( "CharacterCustomizationButtonList", f0_local5, true, f0_local6 )
local f0_local8 = function ( f21_arg0, f21_arg1 )
	local f21_local0 = Engine.GetPlayerStats( f21_arg0, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_CAMPAIGN )
	return f21_local0.PlayerStatsByMap[f21_arg1].hasBeenCompleted:get() ~= 0
end

local f0_local9 = function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3 )
	if CoD.CCUtility.customizationMode == Enum.eModes.MODE_CAMPAIGN or Engine.IsCampaignGame() then
		local f22_local0 = "gamedata/stats/cp/statsmilestones2.csv"
		local f22_local1 = 1
		local f22_local2 = 2
		local f22_local3 = 3
		local f22_local4 = Engine.TableFindRows( f22_local0, f22_local1, f22_arg1 )
		if f22_local4 ~= nil then
			for f22_local8, f22_local9 in ipairs( f22_local4 ) do
				local f22_local10 = Engine.TableLookupGetColumnValueForRow( f22_local0, f22_local9, f22_local2 )
				local f22_local11 = Engine.TableLookupGetColumnValueForRow( f22_local0, f22_local9, f22_local3 )
				if f22_local10 + 1 == f22_arg2 and (f22_local11 == "none" or f0_local8( f22_arg0, f22_local11 )) then
					return true
				end
			end
		end
		return false
	elseif CoD.CCUtility.customizationMode == Enum.eModes.MODE_MULTIPLAYER and not Dvar.cg_development:get() then
		return f22_arg2 <= f22_arg3 - 2
	else
		return true
	end
end

DataSources.HeroChooseOptionButtonList = DataSourceHelpers.ListSetup( "HeroCustomizationOptionList", function ( f23_arg0 )
	local f23_local0 = {}
	local f23_local1 = function ( f24_arg0, f24_arg1, f24_arg2, f24_arg3, f24_arg4 )
		local f24_local0 = f0_local7( f24_arg0, f24_arg1, f24_arg2 or "$white", f24_arg3 or "255 255 255" )
		f24_local0.properties.optionIndex = f24_arg0
		f24_local0.properties.isColorOption = f24_arg3 ~= nil
		f24_local0.properties.selectIndex = f24_arg4
		if not f24_local0.properties.isColorOption then
			f24_local0.models.itemExtraCamInfo = "" .. CoD.CCUtility.customizationMode .. ";" .. CoD.CCUtility.Heroes.HeroIndexForEdits .. ";" .. CoD.CCUtility.PersonalizeHeroData.EdittingArea .. ";" .. f24_arg0 - 1
		else
			f24_local0.models.itemExtraCamInfo = ""
		end
		return f24_local0
	end
	
	if CoD.CCUtility.Heroes.heroCustomizationTable and CoD.CCUtility.Heroes.selectionTable and CoD.CCUtility.PersonalizeHeroData.EdittingArea and CoD.CCUtility.PersonalizeHeroData.EdittingElement then
		local f23_local2, f23_local3, f23_local4, f23_local5 = nil
		if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
			f23_local2 = CoD.CCUtility.Heroes.heroCustomizationTable.bodies
			f23_local5 = "bodystyle"
			f23_local3 = CoD.CCUtility.Heroes.selectionTable.selectedBody + 1
			if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
				f23_local4 = CoD.CCUtility.Heroes.selectionTable.bodyColors[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex] + 1
			end
		elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
			f23_local2 = CoD.CCUtility.Heroes.heroCustomizationTable.helmets
			f23_local5 = "helmetstyle"
			f23_local3 = CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1
			if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
				f23_local4 = CoD.CCUtility.Heroes.selectionTable.helmetColors[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex] + 1
			end
		end
		if f23_local2 then
			if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
				local f23_local6 = f23_local2[f23_local3].accents[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex]
				if f23_local6 then
					for f23_local10, f23_local11 in ipairs( f23_local6 ) do
						table.insert( f23_local0, f23_local1( f23_local10, f23_local11.name, f23_local11.icon, f23_local11.red .. " " .. f23_local11.green .. " " .. f23_local11.blue, f23_local10 == f23_local4 ) )
					end
				end
			else
				for f23_local9, f23_local10 in ipairs( f23_local2 ) do
					if f23_local10.name and f0_local9( f23_arg0, f23_local5, f23_local9, #f23_local2 ) then
						table.insert( f23_local0, f23_local1( f23_local9, f23_local10.name, f23_local10.icon, nil, f23_local3 == f23_local9 ) )
					end
				end
			end
		end
	end
	return f23_local0
end, true )
DataSources.CharacterCustomizationColorSetList = DataSourceHelpers.ListSetup( "CharacterCustomizationColorSetList", function ( f25_arg0 )
	local f25_local0 = {}
	local f25_local1 = function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3 )
		local f26_local0 = f0_local7( f26_arg0, f26_arg1, f26_arg2 or "$white", f26_arg3 or "255 255 255" )
		f26_local0.properties.optionIndex = f26_arg0
		f26_local0.properties.isColorOption = f26_arg3 ~= nil
		return f26_local0
	end
	
	if CoD.CCUtility.Heroes.heroCustomizationTable and CoD.CCUtility.Heroes.selectionTable and CoD.CCUtility.PersonalizeHeroData.EdittingArea and CoD.CCUtility.PersonalizeHeroData.EdittingElement then
		local f25_local2, f25_local3, f25_local4 = nil
		if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
			f25_local2 = CoD.CCUtility.Heroes.heroCustomizationTable.bodies
			f25_local3 = CoD.CCUtility.Heroes.selectionTable.selectedBody + 1
			f25_local4 = CoD.CCUtility.Heroes.selectionTable.bodyColors
		elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
			f25_local2 = CoD.CCUtility.Heroes.heroCustomizationTable.helmets
			f25_local3 = CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1
			f25_local4 = CoD.CCUtility.Heroes.selectionTable.helmetColors
		end
		if f25_local2 then
			for f25_local8, f25_local9 in ipairs( f25_local2[f25_local3].accents ) do
				local f25_local10 = table.insert( f25_local0, {
					models = {
						colorIndex = f25_local8,
						colorListDatasource = CoD.CCUtility.CreatePersonalizeColorDatasource( f25_arg0, "PersonalizeCharacterColorOptions_" .. f25_local8, f25_local9, function ()
							return {
								colorTableIndex = f25_local8
							}
						end
						 ),
						selectedColor = f25_local4[f25_local8] + 1
					}
				} )
			end
		end
	end
	return f25_local0
end, true )
CoD.CCUtility.PersonalizeHeroData.SetHeroShowcaseWeapon = function ( f28_arg0, f28_arg1, f28_arg2, f28_arg3, f28_arg4, f28_arg5, f28_arg6, f28_arg7 )
	local f28_local0 = CoD.CCUtility.customizationMode
	local f28_local1 = CoD.CCUtility.Heroes.HeroIndexForEdits
	if not f28_arg2 then
		f28_arg2 = ""
	end
	if not f28_arg3 or #f28_arg3 == 0 then
		f28_arg3 = {}
		for f28_local2 = 1, CoD.CCUtility.PersonalizeHeroData.MaxWeaponAttachments, 1 do
			f28_arg3[f28_local2] = 0
		end
	end
	if not f28_arg4 or #f28_arg4 == 0 then
		f28_arg4 = {}
		for f28_local2 = 1, CoD.CCUtility.PersonalizeHeroData.MaxWeaponAttachments, 1 do
			f28_arg4[f28_local2] = 0
		end
	end
	if not f28_arg5 then
		f28_arg5 = 0
	end
	if not f28_arg6 then
		f28_arg6 = Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT
	end
	if not f28_arg7 then
		f28_arg7 = Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX
	end
	Engine.SetHeroShowcaseWeaponVariantName( f28_arg0, f28_local0, f28_local1, f28_arg2 )
	Engine.SetHeroShowcaseWeaponAttribute( f28_arg0, f28_local0, f28_local1, "weaponIndex", f28_arg1 )
	for f28_local2 = 1, CoD.CCUtility.PersonalizeHeroData.MaxWeaponAttachments, 1 do
		Engine.SetHeroShowcaseWeaponAttribute( f28_arg0, f28_local0, f28_local1, "attachment", f28_arg3[f28_local2], f28_local2 - 1 )
	end
	for f28_local2 = 1, CoD.CCUtility.PersonalizeHeroData.MaxWeaponAttachments, 1 do
		Engine.SetHeroShowcaseWeaponAttribute( f28_arg0, f28_local0, f28_local1, "attachmentVariant", f28_arg4[f28_local2], f28_local2 - 1 )
	end
	Engine.SetHeroShowcaseWeaponAttribute( f28_arg0, f28_local0, f28_local1, "camoIndex", f28_arg5 )
	Engine.SetHeroShowcaseWeaponAttribute( f28_arg0, f28_local0, f28_local1, "paintjobSlot", f28_arg6 )
	Engine.SetHeroShowcaseWeaponAttribute( f28_arg0, f28_local0, f28_local1, "paintjobIndex", f28_arg7 )
end

CoD.CCUtility.PersonalizeHeroData.GetHeroShowcaseWeaponName = function ( f29_arg0, f29_arg1 )
	local f29_local0 = Engine.GetItemRef( f29_arg0 ) .. "_" .. CoD.gameMode:lower()
	for f29_local4, f29_local5 in ipairs( f29_arg1 ) do
		f29_local0 = f29_local0 .. "+" .. Engine.GetAttachmentRef( f29_arg0, f29_local5 )
	end
	return f29_local0
end

CoD.CCUtility.PersonalizeHeroData.GetHeroShowcaseWeaponRenderOptions = function ( f30_arg0, f30_arg1, f30_arg2 )
	return f30_arg0 .. "," .. f30_arg1 .. "," .. f30_arg2
end

CoD.CCUtility.PersonalizeHeroData.IsDualWieldWeapon = function ( f31_arg0, f31_arg1 )
	local f31_local0 = Engine.GetItemIndexFromReference( "pistol_standard", mode )
	local f31_local1 = Engine.GetItemIndexFromReference( "pistol_burst", mode )
	local f31_local2 = Engine.GetItemIndexFromReference( "pistol_fullauto", mode )
	if f31_arg0 ~= f31_local0 and f31_arg0 ~= f31_local0 and f31_arg0 ~= f31_local0 then
		return false
	end
	for f31_local6, f31_local7 in ipairs( f31_arg1 ) do
		if Engine.GetAttachmentRef( f31_arg0, f31_local7 ) == "dw" then
			return true
		end
	end
	return false
end

CoD.CCUtility.PersonalizeHeroData.GetDualWieldVersionOfWeapon = function ( f32_arg0, f32_arg1 )
	return Engine.GetItemIndexFromReference( Engine.GetItemRef( f32_arg1 ) .. "_dw", CoD.CCUtility.customizationMode )
end

local f0_local10 = function ( f33_arg0, f33_arg1 )
	local f33_local0 = Engine.GetLoadoutItemIndexForHero( CoD.CCUtility.customizationMode, f33_arg1, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_FIRST )
	local f33_local1 = ""
	local f33_local2 = false
	if IsLive() and IsFirstTimeSetup( f33_arg0, Enum.eModes.MODE_MULTIPLAYER ) then
		f33_local2 = Engine.IsItemLocked( f33_arg0, f33_local0, Enum.eModes.MODE_MULTIPLAYER )
	elseif IsProgressionEnabled( f33_arg0 ) then
		f33_local2 = Engine.IsItemLocked( f33_arg0, f33_local0 )
		f33_local1 = CoD.GetUnlockRankAndLevelForItemIndex( f33_arg0, f33_local0, "MENU_UNLOCKED_AT" )
	end
	return f33_local2, f33_local1
end

local f0_local11 = function ( f34_arg0, f34_arg1, f34_arg2, f34_arg3 )
	local f34_local0 = Engine.GetEquippedInfoForHero( f34_arg3, CoD.CCUtility.customizationMode, f34_arg0.bodyIndex )
	local f34_local1 = Engine.GetHeroCustomizationTable( CoD.CCUtility.customizationMode, f34_arg0.bodyIndex )
	local f34_local2, f34_local3 = f0_local10( f34_arg3, f34_arg0.bodyIndex )
	local f34_local4 = CoD.CCUtility.Heroes.HeroIndexForEdits
	if not f34_local4 then
		f34_local4 = Engine.GetEquippedHero( f34_arg3, CoD.CCUtility.customizationMode )
	end
	local f34_local5 = {
		models = {
			background = f34_arg0.background,
			backgroundWithCharacter = f34_arg0.backgroundWithCharacter or "blacktransparent",
			lockedImage = f34_arg0.lockedImage or "blacktransparent",
			name = f34_arg0.displayName,
			unlockDescription = f34_local3,
			level = 1,
			count = Engine.Localize( "MENU_X_OF_Y", f34_arg1, f34_arg2 ),
			extraCamRender = f34_arg0.bodyIndex,
			personalizeRender = f34_arg0.personalizeRender or "blacktransparent",
			frozenMomentRender = f34_arg0.frozenMomentRender or "blacktransparent",
			frozenMomentOverlay = f34_arg0.frozenMomentOverlay or "blacktransparent",
			disabled = f34_arg0.disabled or f34_local2,
			equippedSlot = Engine.GetLoadoutTypeForHero( f34_arg3, f34_arg0.bodyIndex ),
			selectedHeadInfo = f0_local4( f34_arg3, f34_local1, f34_local0, f34_arg0.bodyIndex, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET ),
			selectedBodyInfo = f0_local4( f34_arg3, f34_local1, f34_local0, f34_arg0.bodyIndex, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY ),
			selectedShowcaseWeaponInfo = nil,
			selectedTauntInfo = nil,
			itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM
		},
		properties = {
			heroIndex = f34_arg0.bodyIndex,
			selectIndex = f34_arg0.bodyIndex == f34_local4
		}
	}
	if not f34_arg0.disabled then
		f34_local5.models.loadoutDatasource = f0_local2( f34_local5, CoD.CCUtility.customizationMode, f34_arg3 )
		if IsLuaCodeVersionAtLeast( 5 ) then
			f34_local5.models.cardBackDatasource = f0_local3( f34_local5, f34_arg0, CoD.CCUtility.customizationMode, f34_arg3 )
		end
	end
	return f34_local5
end

DataSources.HeroesList = DataSourceHelpers.ListSetup( "HeroesList", function ( f35_arg0 )
	local f35_local0 = Engine.GetHeroList( CoD.CCUtility.customizationMode )
	local f35_local1 = {}
	local f35_local2 = Enum.CharacterGenderTypes.CHARACTER_GENDER_TYPE_ANY
	if CoD.CCUtility.customizationMode == Enum.eModes.MODE_CAMPAIGN then
		f35_local2 = Engine.GetEquippedGender( f35_arg0, Enum.eModes.MODE_CAMPAIGN )
	end
	for f35_local6, f35_local7 in ipairs( f35_local0 ) do
		if f35_local2 == Enum.CharacterGenderTypes.CHARACTER_GENDER_TYPE_ANY or f35_local7.gender == f35_local2 then
			table.insert( f35_local1, f0_local11( f35_local7, f35_local6, #f35_local0, f35_arg0 ) )
		end
	end
	return f35_local1
end, true )
DataSources.GendersList = DataSourceHelpers.ListSetup( "GendersList", function ( f36_arg0 )
	return {
		{
			models = {
				image = "t7_menu_cp_silhouette_male",
				unfocused_image = "uie_cp_genderselection_male_notinfocus"
			},
			properties = {
				gender = Enum.CharacterGenderTypes.CHARACTER_GENDER_TYPE_MALE
			}
		},
		{
			models = {
				image = "blacktransparent",
				unfocused_image = "blacktransparent"
			},
			properties = {
				gender = Enum.CharacterGenderTypes.CHARACTER_GENDER_TYPE_INVALID,
				selectIndex = true
			}
		},
		{
			models = {
				image = "t7_menu_cp_silhouette_female",
				unfocused_image = "uie_cp_genderselection_female_notinfocus"
			},
			properties = {
				gender = Enum.CharacterGenderTypes.CHARACTER_GENDER_TYPE_FEMALE
			}
		}
	}
end, true )
DataSources.HeroFaceButtonList = DataSourceHelpers.ListSetup( "HeroFaceButtonList", function ( f37_arg0 )
	local f37_local0 = CoD.CCUtility.customizationMode
	local f37_local1 = Engine.GetHeadList( f37_local0, Engine.GetEquippedGender( f37_arg0, f37_local0 ) )
	local f37_local2 = {}
	for f37_local6, f37_local7 in ipairs( f37_local1 ) do
		table.insert( f37_local2, {
			models = {
				name = f37_local7.displayName,
				headExtraCamInfo = "" .. CoD.CCUtility.customizationMode .. ";" .. f37_local7.headIndex
			},
			properties = {
				headIndex = f37_local7.headIndex
			}
		} )
	end
	return f37_local2
end, true )
