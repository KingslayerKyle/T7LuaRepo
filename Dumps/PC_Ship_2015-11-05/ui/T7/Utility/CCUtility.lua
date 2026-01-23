if not CoD.CCUtility then
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
	CoD.CCUtility.Heroes.DefaultHelmetBodyOption = 1
	CoD.CCUtility.customizationMode = nil
	CoD.CCUtility.FirstTimeFlowState = LuaEnums.createEnum( "None", "Overview", "SelectionChanged", "Complete" )
	CoD.CCUtility.PersonalizeHeroData = {}
	CoD.CCUtility.PersonalizeHeroData.Modes = LuaEnums.createEnum( "ExploringOptions", "EdittingOption" )
	CoD.CCUtility.PersonalizeHeroData.EdittingArea = nil
	CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex = nil
	CoD.CCUtility.PersonalizeHeroData.EdittingElement = nil
	CoD.CCUtility.PersonalizeHeroData.CurrentColors = nil
	CoD.CCUtility.PersonalizeHeroData.MaxWeaponAttachments = 8
	CoD.CCUtility.PersonalizeHeroData.SpecialistEpicItemIndex = 9
	CoD.CCUtility.PersonalizeHeroData.CompletionEpicItemIndex = 10
	CoD.CCUtility.PersonalizeHeroData.SpacerRows = {}
	CoD.CCUtility.ShowcaseWeaponCategoryIndex = Enum.CharacterItemType.CHARACTER_ITEM_TYPE_COUNT
	CoD.CCUtility.TauntCategoryIndex = Enum.CharacterItemType.CHARACTER_ITEM_TYPE_COUNT + 1
	CoD.CCUtility.TauntsData = {}
	CoD.CCUtility.TauntsData.EdittingTauntOrGestureType = nil
end
CoD.CCUtility.TauntsData.Modes = LuaEnums.createEnum( "ExploringTaunts", "EdittingTaunt", "EdittingGesture" )
CoD.CCUtility.TauntsData.GestureTypeAWINames = {
	"GoodGame",
	"Threaten",
	"Boast"
}
CoD.CCUtility.TauntsData.GestureTypeDisplayNames = {
	"HEROES_GESTURES_GOOD_GAME",
	"HEROES_GESTURES_THREATEN",
	"HEROES_GESTURES_BOAST"
}
if #CoD.CCUtility.TauntsData.GestureTypeAWINames ~= Enum.CharacterGestureTypes.GESTURE_TYPE_COUNT then
	error( "Need gesture type names to match gesture type enums ( " .. #CoD.CCUtility.TauntsData.GestureTypeAWINames .. " ~= " .. Enum.CharacterGestureTypes.GESTURE_TYPE_COUNT .. " )" )
end
CoD.CCUtility.TauntsData.TauntTypeAWINames = {
	"FirstPlace"
}
if #CoD.CCUtility.TauntsData.TauntTypeAWINames ~= Enum.CharacterTauntTypes.TAUNT_TYPE_COUNT then
	error( "Need taunt type names to match taunt type enums ( " .. #CoD.CCUtility.TauntsData.TauntTypeAWINames .. " ~= " .. Enum.CharacterGestureTypes.TAUNT_TYPE_COUNT .. " )" )
end
local f0_local0 = function ( f1_arg0, f1_arg1 )
	for f1_local0 = 1, #f1_arg1, 1 do
		if Engine.IsCharacterCustomizationItemLocked( f1_arg0, f1_local0, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY, CoD.CCUtility.PersonalizeHeroData.SpecialistEpicItemIndex ) and Engine.IsCharacterCustomizationItemLocked( f1_arg0, f1_local0, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET, CoD.CCUtility.PersonalizeHeroData.SpecialistEpicItemIndex ) then
			return false
		end
	end
	return true
end

CoD.CCUtility.CreatePersonalizeColorDatasource = function ( f2_arg0, f2_arg1, f2_arg2, f2_arg3 )
	DataSources[f2_arg1] = DataSourceHelpers.ListSetup( f2_arg1, function ( f3_arg0 )
		local f3_local0 = {}
		for f3_local9, f3_local10 in ipairs( DataSources[f2_arg1].colorTable ) do
			local f3_local11 = {
				models = {
					color = f3_local10.red .. " " .. f3_local10.green .. " " .. f3_local10.blue,
					icon = f3_local10.icon or "$white",
					xOfY = Engine.Localize( "MENU_X_OF_Y", f3_local9, #DataSources[f2_arg1].colorTable )
				},
				properties = {
					optionIndex = f3_local9
				}
			}
			if f2_arg3 then
				for f3_local7, f3_local8 in pairs( f2_arg3( f3_local9 ) ) do
					f3_local11.properties[f3_local7] = f3_local8
				end
			end
			table.insert( f3_local0, f3_local11 )
		end
		return f3_local0
	end, true )
	DataSources[f2_arg1].colorTable = f2_arg2
	return f2_arg1
end

local f0_local1 = function ( f4_arg0 )
	if f4_arg0 == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON then
		return "HEROES_HERO_WEAPON_CAPS"
	elseif f4_arg0 == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET then
		return "HEROES_HERO_ABILITY_CAPS"
	else
		return nil
	end
end

local f0_local2 = function ( f5_arg0 )
	if f5_arg0 == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON then
		return "HEROES_HERO_WEAPON_HINT"
	elseif f5_arg0 == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET then
		return "HEROES_HERO_ABILITY_HINT"
	else
		return nil
	end
end

local f0_local3 = function ( f6_arg0, f6_arg1, f6_arg2 )
	local f6_local0 = "HeroCarouselItemLoadoutList" .. f6_arg0.properties.heroIndex
	DataSources[f6_local0] = DataSourceHelpers.ListSetup( f6_local0, function ( f7_arg0 )
		local f7_local0 = {}
		local f7_local1 = Engine.GetLoadoutTypeForHero( f7_arg0, f6_arg0.properties.heroIndex )
		for f7_local2 = 0, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_COUNT - 1, 1 do
			local f7_local5 = Engine.GetLoadoutInfoForHero( f6_arg1, f6_arg0.properties.heroIndex, f7_local2 )
			local f7_local6 = false
			if IsProgressionEnabled( f7_arg0 ) or IsLive() and IsFirstTimeSetup( f7_arg0, Enum.eModes.MODE_MULTIPLAYER ) then
				f7_local6 = Engine.IsItemLocked( f7_arg0, f7_local5.itemIndex, Enum.eModes.MODE_MULTIPLAYER )
			end
			if f7_local5 then
				table.insert( f7_local0, {
					models = {
						name = f7_local5.itemName,
						gameImageOff = f7_local5.gameImageOff,
						gameImageOn = f7_local5.gameImageOn,
						description = f7_local5.itemDesc,
						header = f0_local1( f7_local2 ),
						equippedSlot = f7_local2,
						itemIndex = f7_local5.itemIndex,
						disabled = f7_local6,
						itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM
					},
					properties = {
						equippedSlot = f7_local2,
						hintText = f0_local2( f7_local2 ),
						selectIndex = f7_local1 == f7_local2,
						heroIndex = f6_arg0.properties.heroIndex
					}
				} )
			end
		end
		return f7_local0
	end, true )
	return f6_local0
end

local f0_local4 = function ( f8_arg0, f8_arg1, f8_arg2, f8_arg3, f8_arg4, f8_arg5 )
	local f8_local0 = "HeroCarouselCardBackList" .. f8_arg0.properties.heroIndex
	DataSources[f8_local0] = DataSourceHelpers.ListSetup( f8_local0, function ( f9_arg0 )
		local f9_local0 = {}
		local f9_local1 = function ( f10_arg0, f10_arg1, f10_arg2, f10_arg3 )
			local f10_local0 = {
				models = {
					text = f10_arg0,
					icon = f10_arg1
				},
				properties = {}
			}
			if f10_arg2 then
				for f10_local4, f10_local5 in pairs( f10_arg2 ) do
					f10_local0.models[f10_local4] = f10_local5
				end
			end
			f10_local0.models.alias = f10_local0.models.alias or ""
			if f10_arg3 then
				for f10_local4, f10_local5 in pairs( f10_arg3 ) do
					f10_local0.properties[f10_local4] = f10_local5
				end
			end
			return f10_local0
		end
		
		local f9_local2 = function ( f11_arg0, f11_arg1, f11_arg2 )
			return Engine.Localize( "HEROES_CARD_BACK_ENTRY", f11_arg0, f11_arg1, f11_arg2 or "" )
		end
		
		local f9_local3 = 1
		table.insert( f9_local0, f9_local1( f9_local2( f9_local3, 1, "HEROES_BIO" ), "t7_hud_hero_icon_filetype_text", {
			cardBackIcon = f8_arg1.cardBackIcon,
			realName = f8_arg1.realName,
			age = f8_arg1.age,
			genderString = f8_arg1.genderString,
			bio = f8_arg1.bio,
			frameWidget = "CoD.ChooseCharacterLoadout_CardBack_Bio"
		}, nil ) )
		f9_local3 = f9_local3 + 1
		local f9_local4 = Engine.GetLoadoutInfoForHero( f8_arg2, f8_arg0.properties.heroIndex, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
		if f9_local4 then
			table.insert( f9_local0, f9_local1( f9_local2( f9_local3, 1, f9_local4.itemName ), "t7_hud_hero_icon_filetype_details", {
				weaponSubItem = f9_local2( f9_local3, 3, f8_arg1.weaponSubItemDesc ),
				weaponCardBackIcon = f8_arg1.weaponCardBackIcon or "blacktransparent",
				weaponCardBackSubIcon = f8_arg1.weaponCardBackSubIcon or "blacktransparent",
				weaponDesc = f8_arg1.weaponCardBackDesc,
				weaponSchemaTitle = f9_local2( f9_local3, 2, "HEROES_SCHEMA" ),
				weaponSchema = f8_arg1.weaponSchema,
				frameWidget = "CoD.ChooseCharacterLoadout_CardBack_Weapon"
			}, nil ) )
		end
		f9_local3 = f9_local3 + 1
		local f9_local5 = Engine.GetLoadoutInfoForHero( f8_arg2, f8_arg0.properties.heroIndex, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET )
		if f9_local5 then
			table.insert( f9_local0, f9_local1( f9_local2( f9_local3, 1, f9_local5.itemName ), "t7_hud_hero_icon_filetype_details", {
				abilitySubItem = f9_local2( f9_local3, 3, f8_arg1.abilitySubItemDesc ),
				abilityCardBackIcon = f8_arg1.abilityCardBackIcon or "blacktransparent",
				abilityCardBackSubIcon = f8_arg1.abilityCardBackSubIcon or "blacktransparent",
				abilityDesc = f8_arg1.abilityCardBackDesc,
				abilitySchemaTitle = f9_local2( f9_local3, 2, "HEROES_SCHEMA" ),
				abilitySchema = f8_arg1.abilitySchema,
				frameWidget = "CoD.ChooseCharacterLoadout_CardBack_Ability"
			}, nil ) )
		end
		f9_local3 = f9_local3 + 1
		if IsProgressionEnabled( f9_arg0 ) then
			local f9_local6 = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3 )
				local f12_local0 = "TransmissionContactList_" .. f12_arg0 .. "_" .. f12_arg1
				DataSources[f12_local0] = DataSourceHelpers.ListSetup( f12_local0, function ( f13_arg0 )
					local f13_local0 = {}
					local f13_local1 = f8_arg4["transmission" .. f12_arg1 .. "ContactsCount"] or 0
					for f13_local2 = 0, f13_local1 - 1, 1 do
						table.insert( f13_local0, {
							models = {
								contactIcon = f8_arg4["transmission" .. f12_arg1 .. "Contact" .. f13_local2 .. "Image"],
								contactName = Engine.Localize( "HEROES_CONTACT_X", f12_arg2, f12_arg3 + f13_local2, f8_arg4["transmission" .. f12_arg1 .. "Contact" .. f13_local2 .. "Name"] )
							}
						} )
					end
					return f13_local0
				end )
				return f12_local0
			end
			
			local f9_local7 = f8_arg4.transmissions or 0
			for f9_local8 = 0, f9_local7 - 1, 1 do
				local f9_local11, f9_local12 = nil
				if Dvar.allItemsUnlocked:get() then
					f9_local11 = false
				else
					f9_local11, f9_local12 = Engine.IsSpecialistTransmissionLocked( f9_arg0, f8_arg0.properties.heroIndex, f9_local8 + 1 )
				end
				if not f9_local11 then
					local f9_local13, f9_local14 = nil
					if f9_local8 == 4 then
						f9_local14 = f8_arg4["transmission" .. f9_local8 .. "ID"] or ""
						f9_local13 = "t7_menu_hero_bio_headshot_unknown"
					else
						f9_local14 = (f8_arg4.characterFrequency or "") .. "." .. (f8_arg4["transmission" .. f9_local8 .. "ID"] or "")
						f9_local13 = f8_arg1.cardBackIcon
					end
					table.insert( f9_local0, f9_local1( f9_local2( f9_local3, 1, "HEROES_TRANSMISSION" ), "t7_hud_hero_icon_filetype_audio", {
						cardBackIcon = f9_local13,
						transmissionName = Engine.Localize( "HEROES_TRANSMISSION_X", f9_local3, 1, f8_arg4["transmission" .. f9_local8 .. "Name"] or "" ),
						contactsListDatasource = f9_local6( f8_arg0.properties.heroIndex, f9_local8, f9_local3, 2 ),
						transmissionSynopsis = f8_arg4["transmission" .. f9_local8 .. "Synopsis"] or "",
						transmissionFrequency = f9_local14,
						alias = f8_arg4["transmission" .. f9_local8 .. "Alias"],
						frameWidget = "CoD.ChooseCharacterLoadout_CardBack_Transmission",
						playingSound = false
					}, nil ) )
				elseif f9_local12 then
					local f9_local13 = "HEROES_COMPLETE_ASSIGNMENT_FOR_TRANSMISSION"
					local f9_local14 = ""
					local f9_local15 = ""
					local f9_local16 = ""
					local f9_local17 = CoD.getStatsMilestoneTable( f9_local12.challengeTable + 1 )
					if f9_local8 == 0 then
						f9_local14 = Engine.Localize( Engine.TableLookupGetColumnValueForRow( f9_local17, f9_local12.challengeRow, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_STRING ), f9_local12.targetValue, f8_arg1.displayName )
						f9_local15 = f9_local12.currentValue / f9_local12.targetValue
						f9_local16 = Engine.Localize( "MENU_X_SLASH_Y", f9_local12.currentValue, f9_local12.targetValue )
					elseif f9_local8 == 4 or f9_local8 == 3 and not f8_arg5 then
						f9_local13 = "HEROES_ASSIGNMENT_CLASSIFIED"
					else
						f9_local14 = Engine.Localize( Engine.TableLookupGetColumnValueForRow( f9_local17, f9_local12.challengeRow, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_STRING ), f9_local12.targetValue, f8_arg1.displayName )
					end
					table.insert( f9_local0, f9_local1( f9_local2( f9_local3, 1, "MENU_CLASSIFIED" ), "t7_hud_hero_icon_filetype_audio", {
						cardBackIcon = f8_arg1.cardBackIcon,
						transmissionName = Engine.Localize( "HEROES_TRANSMISSION_X", f9_local3, 1, "MENU_CLASSIFIED" ),
						assignmentAccessString = f9_local13,
						assignment = f9_local14,
						assignmentProgress = f9_local15,
						assignmentProgressString = f9_local16,
						frameWidget = "CoD.ChooseCharacterLoadout_CardBack_LockedTransmission"
					}, nil ) )
				end
				f9_local3 = f9_local3 + 1
			end
		end
		return f9_local0
	end, true )
	return f8_local0
end

local f0_local5 = function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3, f14_arg4 )
	local f14_local0 = ""
	local f14_local1 = ""
	local f14_local2 = ""
	if f14_arg4 == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
		f14_local0 = "HEROES_BODY"
		local f14_local3 = f14_arg1.bodies[f14_arg2.selectedBody + 1]
		if f14_local3 then
			f14_local1 = f14_local3.name
			local f14_local4 = {}
			for f14_local8, f14_local9 in ipairs( f14_arg2.bodyColors ) do
				table.insert( f14_local4, f14_local3.accents[f14_local8][f14_local9 + 1] )
			end
			f14_local2 = CoD.CCUtility.CreatePersonalizeColorDatasource( f14_arg0, "PersonalizeListSelection_" .. f14_arg3 .. "_" .. f14_arg4, f14_local4, nil )
		end
	elseif f14_arg4 == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
		f14_local0 = "HEROES_HEAD"
		local f14_local3 = f14_arg1.helmets[f14_arg2.selectedHelmet + 1]
		if f14_local3 then
			f14_local1 = f14_local3.name
			local f14_local4 = {}
			for f14_local8, f14_local9 in ipairs( f14_arg2.helmetColors ) do
				table.insert( f14_local4, f14_local3.accents[f14_local8][f14_local9 + 1] )
			end
			f14_local2 = CoD.CCUtility.CreatePersonalizeColorDatasource( f14_arg0, "PersonalizeListSelection_" .. f14_arg3 .. "_" .. f14_arg4, f14_local4, nil )
		end
	else
		return nil
	end
	return {
		categoryName = f14_local0,
		currentSelectionName = f14_local1,
		colorListDatasource = f14_local2
	}
end

CoD.CCUtility.GetHeroEquippedSlot = function ( f15_arg0, f15_arg1 )
	local f15_local0 = CoD.CCUtility.customizationMode
	local f15_local1 = CoD.CCUtility.Heroes.HeroIndexForEdits
	local f15_local2 = nil
	for f15_local3 = 0, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_COUNT - 1, 1 do
		local f15_local6 = Engine.GetLoadoutInfoForHero( f15_local0, f15_local1, f15_local3 )
		if f15_local6.itemIndex == f15_arg1 then
			f15_local2 = f15_local3
			break
		end
	end
	return f15_local2
end

CoD.CCUtility.PersonalizeHeroData.HeroCustomizationTabCategories = {
	"standard",
	"loot"
}
DataSources.HeroCustomizationTabs = DataSourceHelpers.ListSetup( "HeroCustomizationTabs", function ( f16_arg0 )
	local f16_local0 = {}
	local f16_local1 = function ( f17_arg0, f17_arg1, f17_arg2 )
		table.insert( f16_local0, {
			models = {
				tabName = f17_arg0,
				tabIcon = "",
				breadcrumbCount = 0
			},
			properties = {
				isBlackMarket = f17_arg1,
				selectIndex = not f17_arg1,
				filterName = f17_arg2
			}
		} )
	end
	
	table.insert( f16_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	f16_local1( "MPUI_STANDARD_CAPS", false, CoD.CCUtility.PersonalizeHeroData.HeroCustomizationTabCategories[1] )
	if IsLive() then
		f16_local1( "MENU_BLACK_MARKET", true, CoD.CCUtility.PersonalizeHeroData.HeroCustomizationTabCategories[2] )
	end
	table.insert( f16_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f16_local0
end, false )
CoD.CCUtility.PersonalizeHeroData.StandardFilter = function ( f18_arg0 )
	return CoD.SafeGetModelValue( f18_arg0, "isBMItem" ) == nil
end

CoD.CCUtility.PersonalizeHeroData.BlackMarketFilter = function ( f19_arg0 )
	local f19_local0 = CoD.SafeGetModelValue( f19_arg0, "isBMItem" )
	local f19_local1
	if f19_local0 == nil or f19_local0 ~= true then
		f19_local1 = false
	else
		f19_local1 = true
	end
	return f19_local1
end

local f0_local6 = function ( f20_arg0 )
	local f20_local0 = {}
	CoD.CCUtility.PersonalizeHeroData.SpacerRows = {}
	local f20_local1 = function ( f21_arg0, f21_arg1, f21_arg2, f21_arg3, f21_arg4, f21_arg5, f21_arg6 )
		local f21_local0 = 0
		if f21_arg2 then
			f21_local0 = 1
		end
		local f21_local1 = 0
		if f21_arg3 then
			f21_local1 = 1
		end
		return {
			models = {
				categoryName = f21_arg1,
				categoryImage = f21_arg5,
				fullCategoryName = f21_arg1,
				categoryDesc = f21_arg4 or "",
				currentSelectionName = f21_arg2 or "",
				currentSelectionVariantName = f21_arg3 or "",
				colorListDatasource = "",
				currentSelectionNameAlpha = f21_local0,
				currentSelectionVariantNameAlpha = f21_local1
			},
			properties = {
				customizationArea = f21_arg0,
				colorRow = false,
				disabled = f21_arg6
			}
		}
	end
	
	local f20_local2 = function ( f22_arg0, f22_arg1, f22_arg2, f22_arg3, f22_arg4, f22_arg5 )
		local f22_local0 = function ( f23_arg0 )
			local f23_local0 = {}
			if CoD.CCUtility.Heroes.heroCustomizationTable and CoD.CCUtility.Heroes.selectionTable then
				local f23_local1, f23_local2 = nil
				if f22_arg0 == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
					f23_local1 = CoD.CCUtility.Heroes.heroCustomizationTable.bodies[CoD.CCUtility.Heroes.selectionTable.selectedBody + 1]
					f23_local2 = CoD.CCUtility.Heroes.selectionTable.bodyColors
				elseif f22_arg0 == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
					f23_local1 = CoD.CCUtility.Heroes.heroCustomizationTable.helmets[CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1]
					f23_local2 = CoD.CCUtility.Heroes.selectionTable.helmetColors
				end
				if f23_local1 then
					for f23_local6, f23_local7 in ipairs( f23_local2 ) do
						table.insert( f23_local0, f23_local1.accents[f23_local6][f23_local7 + 1] )
					end
				end
			end
			local f23_local1 = "PersonalizeCharacterColors_" .. f22_arg0
			if DataSources[f23_local1] then
				DataSources[f23_local1].colorTable = f23_local0
				if f23_arg0 then
					f23_arg0:updateDatasource()
				end
				return f23_local1
			else
				return CoD.CCUtility.CreatePersonalizeColorDatasource( f20_arg0, f23_local1, f23_local0 )
			end
		end
		
		local f22_local1 = 0
		if f22_arg2 then
			f22_local1 = 1
		end
		local f22_local2 = 0
		if f22_arg3 then
			f22_local2 = 1
		end
		local f22_local3 = {}
		local f22_local4 = nil
		return {
			models = {
				categoryName = f22_arg1,
				categoryImage = "",
				fullCategoryName = f22_arg5,
				colorListDatasource = f22_local0(),
				categoryDesc = f22_arg4 or "",
				currentSelectionName = f22_arg2 or "",
				currentSelectionVariantName = f22_arg3 or "",
				currentSelectionNameAlpha = f22_local1,
				currentSelectionVariantNameAlpha = f22_local2
			},
			properties = {
				customizationArea = f22_arg0,
				colorRow = true,
				updateColors = f22_local0
			}
		}
	end
	
	local f20_local3 = function ( f24_arg0 )
		local f24_local0 = CoD.CCUtility.customizationMode
		local f24_local1 = CoD.CCUtility.Heroes.HeroIndexForEdits
		return {
			baseWeaponName = Engine.Localize( Engine.GetItemName( Engine.GetHeroShowcaseWeaponAttribute( f24_arg0, f24_local0, f24_local1, "weaponIndex" ) ) ),
			variantName = Engine.GetHeroShowcaseWeaponVariantName( f24_arg0, f24_local0, f24_local1 )
		}
	end
	
	if CoD.CCUtility.Heroes.heroCustomizationTable and CoD.CCUtility.Heroes.selectionTable then
		local f20_local4 = CoD.CCUtility.Heroes.heroCustomizationTable.helmets[CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1]
		if f20_local4 then
			local f20_local5 = CoD.CCUtility.customizationMode
			local f20_local6 = Enum.eModes.MODE_CAMPAIGN
			f20_local6 = f20_local1( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET, REG19 and "HEROES_HELMET" or "HEROES_HEAD", f20_local4.name, nil, nil, "uie_t7_menu_mp_hero_graphic_head" )
			local f20_local7 = Engine.CharacterCustomizationNewItemCount( f20_arg0, CoD.CCUtility.Heroes.HeroIndexForEdits, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET )
			f20_local6.models.breadcrumbCount = type( f20_local7 ) and f20_local7.total or 0
			table.insert( f20_local0, f20_local6 )
			if #CoD.CCUtility.Heroes.selectionTable.helmetColors >= 1 and #f20_local4.accents[1] > 1 then
				table.insert( f20_local0, f20_local2( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET, "HEROES_COLORS", f20_local4.accents[1][CoD.CCUtility.Heroes.selectionTable.helmetColors[1] + 1].name, nil, nil, "HEROES_HELMET_COLORS" ) )
			end
			CoD.CCUtility.PersonalizeHeroData.SpacerRows[#f20_local0] = true
		end
		local f20_local5 = CoD.CCUtility.Heroes.heroCustomizationTable.bodies[CoD.CCUtility.Heroes.selectionTable.selectedBody + 1]
		if f20_local5 then
			local f20_local6 = f20_local1( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY, "HEROES_BODY", f20_local5.name, nil, nil, "uie_t7_menu_mp_hero_graphic_body" )
			local f20_local7 = Engine.CharacterCustomizationNewItemCount( f20_arg0, CoD.CCUtility.Heroes.HeroIndexForEdits, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY )
			f20_local6.models.breadcrumbCount = type( f20_local7 ) and f20_local7.total or 0
			table.insert( f20_local0, f20_local6 )
			if #CoD.CCUtility.Heroes.selectionTable.bodyColors >= 1 and #f20_local5.accents[1] > 1 then
				table.insert( f20_local0, f20_local2( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY, "HEROES_COLORS", f20_local5.accents[1][CoD.CCUtility.Heroes.selectionTable.bodyColors[1] + 1].name, nil, nil, "HEROES_BODY_COLORS" ) )
			end
			CoD.CCUtility.PersonalizeHeroData.SpacerRows[#f20_local0] = true
		end
		if CoD.CCUtility.customizationMode == Enum.eModes.MODE_MULTIPLAYER then
			local f20_local6 = f20_local3( f20_arg0 )
			table.insert( f20_local0, f20_local1( CoD.CCUtility.ShowcaseWeaponCategoryIndex, "HEROES_SHOWCASE_WEAPON", f20_local6.baseWeaponName, f20_local6.variantName, Engine.Localize( "HEROES_SHOWCASE_WEAPON_DESC", Engine.Localize( Engine.GetHeroName( CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits ) ) ), "uie_t7_menu_mp_hero_graphic_showcase" ) )
			CoD.CCUtility.PersonalizeHeroData.SpacerRows[#f20_local0] = true
			local f20_local8 = Engine.GetHeroBundleInfo( CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits )
			local f20_local9 = f20_local1
			local f20_local10 = CoD.CCUtility.TauntCategoryIndex
			local f20_local11 = "HEROES_TAUNTS_AND_GESTURES"
			local f20_local12, f20_local13, f20_local14 = nil
			local f20_local15 = "uie_t7_menu_mp_hero_graphic_taunt"
			local f20_local16
			if not CoD.CCUtility.TauntsData.CharacterHasAnyGestures( f20_local8 ) then
				f20_local16 = not CoD.CCUtility.TauntsData.CharacterHasAnyTaunts( f20_local8 )
			else
				f20_local16 = false
			end
			f20_local9 = f20_local9( f20_local10, f20_local11, f20_local12, f20_local13, f20_local14, f20_local15, f20_local16 )
			f20_local9.models.breadcrumbCount = CoD.CCUtility.GetTauntsAndGesturesNewCount( f20_arg0, CoD.CCUtility.Heroes.HeroIndexForEdits, f20_local8, CoD.CCUtility.customizationMode )
			table.insert( f20_local0, f20_local9 )
		end
	end
	if CoD.CCUtility.customizationMode == Enum.eModes.MODE_CAMPAIGN then
		local f20_local4 = function ( f25_arg0, f25_arg1, f25_arg2 )
			return {
				models = {
					categoryName = f25_arg0,
					categoryImage = f25_arg1,
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
					disabled = f25_arg2
				}
			}
		end
		
		table.insert( f20_local0, f20_local4( "HEROES_CHANGE_CHARACTER", "uie_t7_menu_mp_hero_graphic_face" ) )
		CoD.CCUtility.PersonalizeHeroData.SpacerRows[#f20_local0] = true
	end
	return f20_local0
end

local f0_local7 = {
	getSpacerAfterRow = function ( f26_arg0, f26_arg1, f26_arg2 )
		if CoD.CCUtility.PersonalizeHeroData.SpacerRows[f26_arg1] then
			return 7
		else
			
		end
	end
}
local f0_local8 = function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3 )
	return {
		models = {
			name = f27_arg1,
			image = f27_arg2 or "$white",
			color = f27_arg3,
			optionIndex = f27_arg0
		},
		properties = {}
	}
end

DataSources.CharacterCustomizationButtonList = DataSourceHelpers.ListSetup( "CharacterCustomizationButtonList", f0_local6, true, f0_local7 )
local f0_local9 = function ( f28_arg0, f28_arg1 )
	local f28_local0 = Engine.GetPlayerStats( f28_arg0, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_CAMPAIGN )
	return f28_local0.PlayerStatsByMap[f28_arg1].hasBeenCompleted:get() ~= 0
end

local f0_local10 = function ( f29_arg0, f29_arg1, f29_arg2, f29_arg3 )
	if CoD.CCUtility.customizationMode == Enum.eModes.MODE_CAMPAIGN or Engine.IsCampaignGame() then
		local f29_local0 = CoD.getStatsMilestoneTable( 2, Enum.eModes.MODE_CAMPAIGN )
		local f29_local1 = 1
		local f29_local2 = 2
		local f29_local3 = 3
		local f29_local4 = Engine.TableFindRows( f29_local0, f29_local1, f29_arg1 )
		if f29_local4 ~= nil then
			for f29_local8, f29_local9 in ipairs( f29_local4 ) do
				local f29_local10 = Engine.TableLookupGetColumnValueForRow( f29_local0, f29_local9, f29_local2 )
				local f29_local11 = Engine.TableLookupGetColumnValueForRow( f29_local0, f29_local9, f29_local3 )
				if f29_local10 + 1 == f29_arg2 and (f29_local11 == "none" or f0_local9( f29_arg0, f29_local11 )) then
					return true
				end
			end
		end
		return false
	elseif CoD.CCUtility.customizationMode == Enum.eModes.MODE_MULTIPLAYER then
		if IsProgressionEnabled( f29_arg0 ) then
			if f29_arg2 == CoD.CCUtility.PersonalizeHeroData.CompletionEpicItemIndex then
				return not Engine.IsCharacterCustomizationItemLocked( f29_arg0, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.PersonalizeHeroData.EdittingArea, CoD.CCUtility.PersonalizeHeroData.SpecialistEpicItemIndex )
			else
				return true
			end
		else
			local f29_local0
			if f29_arg2 == CoD.CCUtility.PersonalizeHeroData.SpecialistEpicItemIndex or f29_arg2 == CoD.CCUtility.PersonalizeHeroData.CompletionEpicItemIndex then
				f29_local0 = false
			else
				f29_local0 = true
			end
		end
		return f29_local0
	else
		return true
	end
end

DataSources.HeroChooseOptionButtonList = DataSourceHelpers.ListSetup( "HeroCustomizationOptionList", function ( f30_arg0 )
	local f30_local0 = {}
	local f30_local1 = f0_local0( f30_arg0, Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER ) )
	local f30_local2 = function ( f31_arg0, f31_arg1, f31_arg2, f31_arg3, f31_arg4 )
		local f31_local0 = f0_local8( f31_arg0, f31_arg1, f31_arg2 or "$white", f31_arg3 or "255 255 255" )
		f31_local0.properties.optionIndex = f31_arg0
		f31_local0.properties.isColorOption = f31_arg3 ~= nil
		f31_local0.models.isColorOption = f31_arg3 ~= nil
		f31_local0.properties.selectIndex = f31_arg4
		if not f31_local0.properties.isColorOption then
			f31_local0.models.itemExtraCamInfo = "" .. CoD.CCUtility.customizationMode .. ":" .. CoD.CCUtility.Heroes.HeroIndexForEdits .. ":" .. CoD.CCUtility.PersonalizeHeroData.EdittingArea .. ":" .. f31_arg0 - 1 .. ":" .. f30_arg0
		else
			f31_local0.models.itemExtraCamInfo = ""
		end
		local f31_local1 = CoD.CCUtility.Heroes.HeroIndexForEdits
		local f31_local2 = CoD.CCUtility.PersonalizeHeroData.EdittingArea
		if IsProgressionEnabled( f30_arg0 ) and f31_arg0 > CoD.CCUtility.Heroes.DefaultHelmetBodyOption then
			local f31_local3 = false
			if not f31_local0.properties.isColorOption then
				f31_local3 = Engine.IsCharacterCustomizationItemLocked( f30_arg0, f31_local1, f31_local2, f31_arg0 )
			end
			f31_local0.models.isLocked = f31_local3
			f31_local0.models.isClassified = false
			if f31_arg0 == CoD.CCUtility.PersonalizeHeroData.CompletionEpicItemIndex then
				f31_local0.models.isClassified = not f30_local1
			end
			if not f31_local0.models.isClassified then
				local f31_local4 = Engine.GetCharacterCustomizationItemUnlockInfo( f30_arg0, f31_local1, f31_local2, f31_arg0 )
				if f31_local4 then
					f31_local0.models.unlockDescription = f31_local4.unlockDescription
					f31_local0.models.unlockReward = f31_local4.unlockReward
					f31_local0.models.unlockProgressAndTarget = f31_local4.unlockProgressAndTarget
				end
			end
		end
		if CoD.CCUtility.customizationMode == Enum.eModes.MODE_MULTIPLAYER and f31_arg0 > CoD.CCUtility.PersonalizeHeroData.CompletionEpicItemIndex then
			local f31_local3 = Engine.GetHeroList( CoD.CCUtility.customizationMode )
			f31_local3 = f31_local3[CoD.CCUtility.Heroes.HeroIndexForEdits + 1].assetName
			local f31_local4 = Engine.GetHeroItemInfo( CoD.CCUtility.customizationMode, f31_local1, f31_local2, f31_arg0 - 1 )
			f31_local4 = f31_local4.assetName
			f31_local0.models.isBMItem = true
			f31_local0.models.isBMClassified = CoD.BlackMarketUtility.IsItemLocked( f30_arg0, f31_local4 .. ";" .. f31_local3 )
			if f31_local0.models.isBMClassified then
				f31_local0.models.name = CoD.BlackMarketUtility.ClassifiedName()
			end
		end
		return f31_local0
	end
	
	if CoD.CCUtility.Heroes.heroCustomizationTable and CoD.CCUtility.Heroes.selectionTable and CoD.CCUtility.PersonalizeHeroData.EdittingArea and CoD.CCUtility.PersonalizeHeroData.EdittingElement then
		local f30_local3, f30_local4, f30_local5, f30_local6 = nil
		if Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY == CoD.CCUtility.PersonalizeHeroData.EdittingArea then
			f30_local3 = CoD.CCUtility.Heroes.heroCustomizationTable.bodies
			f30_local6 = "bodystyle"
			f30_local4 = CoD.CCUtility.Heroes.selectionTable.selectedBody + 1
			if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
				f30_local5 = CoD.CCUtility.Heroes.selectionTable.bodyColors[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex] + 1
			end
		elseif Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET == CoD.CCUtility.PersonalizeHeroData.EdittingArea then
			f30_local3 = CoD.CCUtility.Heroes.heroCustomizationTable.helmets
			f30_local6 = "helmetstyle"
			f30_local4 = CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1
			if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
				f30_local5 = CoD.CCUtility.Heroes.selectionTable.helmetColors[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex] + 1
			end
		end
		if f30_local3 then
			if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
				local f30_local7 = f30_local3[f30_local4].accents[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex]
				if f30_local7 then
					for f30_local11, f30_local12 in ipairs( f30_local7 ) do
						table.insert( f30_local0, f30_local2( f30_local11, f30_local12.name, f30_local12.icon, f30_local12.red .. " " .. f30_local12.green .. " " .. f30_local12.blue, f30_local11 == f30_local5 ) )
					end
				end
			else
				for f30_local10, f30_local11 in ipairs( f30_local3 ) do
					if f30_local11.name and f0_local10( f30_arg0, f30_local6, f30_local10, #f30_local3 ) then
						table.insert( f30_local0, f30_local2( f30_local10, f30_local11.name, f30_local11.icon, nil, f30_local4 == f30_local10 ) )
					end
				end
			end
		end
	end
	return f30_local0
end, true )
DataSources.CharacterCustomizationColorSetList = DataSourceHelpers.ListSetup( "CharacterCustomizationColorSetList", function ( f32_arg0 )
	local f32_local0 = {}
	local f32_local1 = function ( f33_arg0, f33_arg1, f33_arg2, f33_arg3 )
		local f33_local0 = f0_local8( f33_arg0, f33_arg1, f33_arg2 or "$white", f33_arg3 or "255 255 255" )
		f33_local0.properties.optionIndex = f33_arg0
		f33_local0.properties.isColorOption = f33_arg3 ~= nil
		return f33_local0
	end
	
	if CoD.CCUtility.Heroes.heroCustomizationTable and CoD.CCUtility.Heroes.selectionTable and CoD.CCUtility.PersonalizeHeroData.EdittingArea and CoD.CCUtility.PersonalizeHeroData.EdittingElement then
		local f32_local2, f32_local3, f32_local4 = nil
		if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
			f32_local2 = CoD.CCUtility.Heroes.heroCustomizationTable.bodies
			f32_local3 = CoD.CCUtility.Heroes.selectionTable.selectedBody + 1
			f32_local4 = CoD.CCUtility.Heroes.selectionTable.bodyColors
		elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
			f32_local2 = CoD.CCUtility.Heroes.heroCustomizationTable.helmets
			f32_local3 = CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1
			f32_local4 = CoD.CCUtility.Heroes.selectionTable.helmetColors
		end
		if f32_local2 then
			for f32_local8, f32_local9 in ipairs( f32_local2[f32_local3].accents ) do
				local f32_local10 = table.insert( f32_local0, {
					models = {
						colorIndex = f32_local8,
						colorListDatasource = CoD.CCUtility.CreatePersonalizeColorDatasource( f32_arg0, "PersonalizeCharacterColorOptions_" .. f32_local8, f32_local9, function ()
							return {
								colorTableIndex = f32_local8
							}
						end
						 ),
						selectedColor = f32_local4[f32_local8] + 1
					}
				} )
			end
		end
	end
	return f32_local0
end, true )
CoD.CCUtility.PersonalizeHeroData.SetHeroShowcaseWeapon = function ( f35_arg0, f35_arg1, f35_arg2, f35_arg3, f35_arg4, f35_arg5, f35_arg6, f35_arg7 )
	local f35_local0 = CoD.CCUtility.customizationMode
	local f35_local1 = CoD.CCUtility.Heroes.HeroIndexForEdits
	if not f35_arg2 then
		f35_arg2 = ""
	end
	if not f35_arg3 or #f35_arg3 == 0 then
		f35_arg3 = {}
		for f35_local2 = 1, CoD.CCUtility.PersonalizeHeroData.MaxWeaponAttachments, 1 do
			f35_arg3[f35_local2] = 0
		end
	end
	if not f35_arg4 or #f35_arg4 == 0 then
		f35_arg4 = {}
		for f35_local2 = 1, CoD.CCUtility.PersonalizeHeroData.MaxWeaponAttachments, 1 do
			f35_arg4[f35_local2] = 0
		end
	end
	if not f35_arg5 then
		f35_arg5 = 0
	end
	if not f35_arg6 then
		f35_arg6 = Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT
	end
	if not f35_arg7 then
		f35_arg7 = Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX
	end
	Engine.SetHeroShowcaseWeaponVariantName( f35_arg0, f35_local0, f35_local1, f35_arg2 )
	Engine.SetHeroShowcaseWeaponAttribute( f35_arg0, f35_local0, f35_local1, "weaponIndex", f35_arg1 )
	for f35_local2 = 1, CoD.CCUtility.PersonalizeHeroData.MaxWeaponAttachments, 1 do
		Engine.SetHeroShowcaseWeaponAttribute( f35_arg0, f35_local0, f35_local1, "attachment", f35_arg3[f35_local2], f35_local2 - 1 )
	end
	for f35_local2 = 1, CoD.CCUtility.PersonalizeHeroData.MaxWeaponAttachments, 1 do
		Engine.SetHeroShowcaseWeaponAttribute( f35_arg0, f35_local0, f35_local1, "attachmentVariant", f35_arg4[f35_local2], f35_local2 - 1 )
	end
	Engine.SetHeroShowcaseWeaponAttribute( f35_arg0, f35_local0, f35_local1, "camoIndex", f35_arg5 )
	Engine.SetHeroShowcaseWeaponAttribute( f35_arg0, f35_local0, f35_local1, "paintjobSlot", f35_arg6 )
	Engine.SetHeroShowcaseWeaponAttribute( f35_arg0, f35_local0, f35_local1, "paintjobIndex", f35_arg7 )
end

CoD.CCUtility.PersonalizeHeroData.GetHeroShowcaseWeaponName = function ( f36_arg0, f36_arg1 )
	local f36_local0 = Engine.GetItemRef( f36_arg0 ) .. "_" .. CoD.gameMode:lower()
	for f36_local4, f36_local5 in ipairs( f36_arg1 ) do
		f36_local0 = f36_local0 .. "+" .. Engine.GetAttachmentRef( f36_arg0, f36_local5 )
	end
	return f36_local0
end

CoD.CCUtility.PersonalizeHeroData.GetHeroShowcaseWeaponRenderOptions = function ( f37_arg0, f37_arg1, f37_arg2 )
	return f37_arg0 .. "," .. f37_arg1 .. "," .. f37_arg2
end

CoD.CCUtility.PersonalizeHeroData.IsDualWieldWeapon = function ( f38_arg0, f38_arg1 )
	if Engine.GetItemIndexFromReference( Engine.GetItemRef( f38_arg0 ) .. "_dw", CoD.CCUtility.customizationMode ) == -1 then
		return false
	end
	for f38_local3, f38_local4 in ipairs( f38_arg1 ) do
		if Engine.GetAttachmentRef( f38_arg0, f38_local4 ) == "dw" then
			return true
		end
	end
	return false
end

CoD.CCUtility.PersonalizeHeroData.GetDualWieldVersionOfWeapon = function ( f39_arg0, f39_arg1 )
	return Engine.GetItemIndexFromReference( Engine.GetItemRef( f39_arg1 ) .. "_dw", CoD.CCUtility.customizationMode )
end

CoD.CCUtility.TauntsData.GetGestureXAnim = function ( f40_arg0, f40_arg1, f40_arg2 )
	return f40_arg0["gestureAnim" .. CoD.CCUtility.TauntsData.GestureTypeAWINames[f40_arg1 + 1] .. f40_arg2] or ""
end

CoD.CCUtility.TauntsData.GetGestureDisplayName = function ( f41_arg0, f41_arg1, f41_arg2 )
	return f41_arg0["gestureName" .. CoD.CCUtility.TauntsData.GestureTypeAWINames[f41_arg1 + 1] .. f41_arg2] or ""
end

CoD.CCUtility.TauntsData.GetGestureCount = function ( f42_arg0, f42_arg1 )
	return f42_arg0["gestureCount" .. CoD.CCUtility.TauntsData.GestureTypeAWINames[f42_arg1 + 1]] or 0
end

CoD.CCUtility.TauntsData.GetGestureAnimFromEvent = function ( f43_arg0 )
	local f43_local0 = Engine.GetHeroBundleInfo( f43_arg0.sessionMode, f43_arg0.characterIndex )
	if f43_local0 then
		return CoD.CCUtility.TauntsData.GetGestureXAnim( f43_local0, f43_arg0.gestureType, f43_arg0.gestureIndex )
	else
		return ""
	end
end

CoD.CCUtility.TauntsData.CharacterHasAnyGestures = function ( f44_arg0 )
	for f44_local0 = 0, Enum.CharacterGestureTypes.GESTURE_TYPE_COUNT - 1, 1 do
		if 0 < CoD.CCUtility.TauntsData.GetGestureCount( f44_arg0, f44_local0 ) then
			return true
		end
	end
	return false
end

CoD.CCUtility.GetTauntsAndGesturesNewCount = function ( f45_arg0, f45_arg1, f45_arg2, f45_arg3 )
	return 0 + CoD.CCUtility.GetTauntNewCount( f45_arg0, f45_arg1, f45_arg2, f45_arg3 ) + CoD.CCUtility.GetGestureNewCount( f45_arg0, f45_arg1, f45_arg2, f45_arg3 )
end

CoD.CCUtility.GetTauntNewCount = function ( f46_arg0, f46_arg1, f46_arg2, f46_arg3 )
	local f46_local0 = 0
	local f46_local1 = Engine.GetHeroList( f46_arg3 )
	local f46_local2 = CoD.BlackMarketUtility.GetSpecialistNameForHeroAssetName( f46_local1[f46_arg1 + 1].assetName )
	for f46_local3 = 0, Enum.CharacterTauntTypes.TAUNT_TYPE_COUNT - 1, 1 do
		for f46_local6 = 0, CoD.CCUtility.TauntsData.GetTauntCount( f46_arg2, f46_local3 ) - 1, 1 do
			if Engine.IsTauntNew( f46_arg0, f46_arg3, f46_arg1, f46_local3, f46_local6, CoD.CCUtility.TauntsData.GetTauntXAnim( f46_arg2, f46_local3, f46_local6 ) ) then
				f46_local0 = f46_local0 + 1
			end
		end
	end
	return f46_local0
end

CoD.CCUtility.GetGestureNewCount = function ( f47_arg0, f47_arg1, f47_arg2, f47_arg3 )
	local f47_local0 = 0
	local f47_local1 = Engine.GetHeroList( f47_arg3 )
	local f47_local2 = CoD.BlackMarketUtility.GetSpecialistNameForHeroAssetName( f47_local1[f47_arg1 + 1].assetName )
	for f47_local3 = 0, Enum.CharacterGestureTypes.GESTURE_TYPE_COUNT - 1, 1 do
		for f47_local6 = 0, CoD.CCUtility.TauntsData.GetGestureCount( f47_arg2, f47_local3 ) - 1, 1 do
			local f47_local9 = CoD.CCUtility.TauntsData.GetGestureXAnim( f47_arg2, f47_local3, f47_local6 )
			if f47_local9 ~= "" and Engine.IsGestureNew( f47_arg0, f47_arg3, f47_arg1, f47_local3, f47_local6, f47_local9 .. ";" .. f47_local2 ) then
				f47_local0 = f47_local0 + 1
			end
		end
	end
	return f47_local0
end

local f0_local11 = function ( f48_arg0, f48_arg1, f48_arg2 )
	local f48_local0 = "GestureTypeOptions" .. f48_arg1
	DataSources[f48_local0] = DataSourceHelpers.ListSetup( f48_local0, function ( f49_arg0 )
		local f49_local0 = {}
		for f49_local1 = 0, CoD.CCUtility.TauntsData.GetGestureCount( f48_arg0, f48_arg1 ) - 1, 1 do
			local f49_local4 = CoD.CCUtility.TauntsData.GetGestureXAnim( f48_arg0, f48_arg1, f49_local1 )
			local f49_local5 = Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER )
			local f49_local6 = CoD.BlackMarketUtility.GetSpecialistNameForHeroAssetName( f49_local5[CoD.CCUtility.Heroes.HeroIndexForEdits + 1].assetName )
			local f49_local7 = false
			if f49_local4 ~= "" and f49_local1 ~= 0 then
				f49_local7 = CoD.BlackMarketUtility.IsItemLocked( f49_arg0, f49_local4 .. ";" .. f49_local6 )
			end
			local f49_local8 = CoD.CCUtility.TauntsData.GetGestureDisplayName( f48_arg0, f48_arg1, f49_local1 )
			if f49_local7 then
				f49_local8 = CoD.BlackMarketUtility.ClassifiedName()
			end
			table.insert( f49_local0, {
				models = {
					itemName = f49_local8,
					isBMClassified = f49_local7,
					canPreview = f49_local4 ~= ""
				},
				properties = {
					index = f49_local1,
					xanim = f49_local4,
					heroName = f49_local6,
					gestureType = f48_arg1,
					selectIndex = f49_local1 == f48_arg2
				}
			} )
		end
		table.sort( f49_local0, CoD.BlackMarketUtility.SortUnlocksPropertyIndex )
		return f49_local0
	end, true )
	return f48_local0
end

DataSources.GestureTypesList = DataSourceHelpers.ListSetup( "GestureTypesList", function ( f50_arg0 )
	local f50_local0 = {}
	local f50_local1 = Engine.GetHeroBundleInfo( CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits )
	local f50_local2 = function ( f51_arg0, f51_arg1 )
		if CoD.CCUtility.TauntsData.GetGestureCount( f50_local1, f51_arg0 ) > 0 then
			local f51_local0 = Engine.GetSelectedGestureForHero( f50_arg0, CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits, f51_arg0 )
			local f51_local1 = CoD.CCUtility.TauntsData.GetGestureXAnim( f50_local1, f51_arg0, f51_local0 )
			table.insert( f50_local0, {
				models = {
					categoryName = f51_arg1,
					selectedItem = CoD.CCUtility.TauntsData.GetGestureDisplayName( f50_local1, f51_arg0, f51_local0 ),
					optionsDatasource = f0_local11( f50_local1, f51_arg0, f51_local0 ),
					canPreview = f51_local1 ~= ""
				},
				properties = {
					gestureType = f51_arg0,
					xanim = f51_local1
				}
			} )
		end
	end
	
	f50_local2( Enum.CharacterGestureTypes.GESTURE_TYPE_GOOD_GAME, "HEROES_GESTURES_GOOD_GAME" )
	f50_local2( Enum.CharacterGestureTypes.GESTURE_TYPE_THREATEN, "HEROES_GESTURES_THREATEN" )
	f50_local2( Enum.CharacterGestureTypes.GESTURE_TYPE_BOAST, "HEROES_GESTURES_BOAST" )
	return f50_local0
end, true )
CoD.CCUtility.TauntsData.GetTauntXAnim = function ( f52_arg0, f52_arg1, f52_arg2 )
	return f52_arg0["tauntAnim" .. CoD.CCUtility.TauntsData.TauntTypeAWINames[f52_arg1 + 1] .. f52_arg2] or ""
end

CoD.CCUtility.TauntsData.GetTauntDisplayName = function ( f53_arg0, f53_arg1, f53_arg2 )
	return f53_arg0["tauntName" .. CoD.CCUtility.TauntsData.TauntTypeAWINames[f53_arg1 + 1] .. f53_arg2] or ""
end

CoD.CCUtility.TauntsData.GetTauntCount = function ( f54_arg0, f54_arg1 )
	return f54_arg0["tauntCount" .. CoD.CCUtility.TauntsData.TauntTypeAWINames[f54_arg1 + 1]] or 0
end

CoD.CCUtility.TauntsData.GetTauntAnimFromEvent = function ( f55_arg0 )
	local f55_local0 = Engine.GetHeroBundleInfo( f55_arg0.sessionMode, f55_arg0.characterIndex )
	if f55_local0 then
		return CoD.CCUtility.TauntsData.GetTauntXAnim( f55_local0, f55_arg0.tauntType, f55_arg0.tauntIndex )
	else
		return ""
	end
end

CoD.CCUtility.TauntsData.CharacterHasAnyTaunts = function ( f56_arg0 )
	for f56_local0 = 0, Enum.CharacterTauntTypes.TAUNT_TYPE_COUNT - 1, 1 do
		if 0 < CoD.CCUtility.TauntsData.GetTauntCount( f56_arg0, f56_local0 ) then
			return true
		end
	end
	return false
end

local f0_local12 = function ( f57_arg0, f57_arg1, f57_arg2 )
	local f57_local0 = "TauntTypeOptions" .. f57_arg1
	DataSources[f57_local0] = DataSourceHelpers.ListSetup( f57_local0, function ( f58_arg0 )
		local f58_local0 = {}
		for f58_local1 = 0, CoD.CCUtility.TauntsData.GetTauntCount( f57_arg0, f57_arg1 ) - 1, 1 do
			local f58_local4 = CoD.CCUtility.TauntsData.GetTauntXAnim( f57_arg0, f57_arg1, f58_local1 )
			local f58_local5 = false
			if f58_local4 ~= "" and f58_local1 ~= 0 then
				f58_local5 = CoD.BlackMarketUtility.IsItemLocked( f58_arg0, f58_local4 )
			end
			local f58_local6 = CoD.CCUtility.TauntsData.GetTauntDisplayName( f57_arg0, f57_arg1, f58_local1 )
			if f58_local5 then
				f58_local6 = CoD.BlackMarketUtility.ClassifiedName()
			end
			table.insert( f58_local0, {
				models = {
					itemName = f58_local6,
					isBMClassified = f58_local5,
					canPreview = f58_local4 ~= ""
				},
				properties = {
					index = f58_local1,
					xanim = f58_local4,
					tauntType = f57_arg1,
					selectIndex = f58_local1 == f57_arg2
				}
			} )
		end
		table.sort( f58_local0, CoD.BlackMarketUtility.SortUnlocksPropertyIndex )
		return f58_local0
	end, true )
	return f57_local0
end

DataSources.TauntTypesList = DataSourceHelpers.ListSetup( "TauntTypesList", function ( f59_arg0 )
	local f59_local0 = {}
	local f59_local1 = Engine.GetHeroBundleInfo( CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits )
	local f59_local2 = function ( f60_arg0, f60_arg1 )
		if CoD.CCUtility.TauntsData.GetTauntCount( f59_local1, f60_arg0 ) > 0 then
			local f60_local0 = Engine.GetSelectedTauntForHero( f59_arg0, CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits, f60_arg0 )
			table.insert( f59_local0, {
				models = {
					categoryName = f60_arg1,
					selectedItem = CoD.CCUtility.TauntsData.GetTauntDisplayName( f59_local1, f60_arg0, f60_local0 ),
					optionsDatasource = f0_local12( f59_local1, f60_arg0, f60_local0 ),
					canPreview = CoD.CCUtility.TauntsData.GetTauntXAnim( f59_local1, f60_arg0, f60_local0 ) ~= ""
				},
				properties = {
					tauntType = f60_arg0,
					xanim = CoD.CCUtility.TauntsData.GetTauntXAnim( f59_local1, f60_arg0, f60_local0 )
				}
			} )
		end
	end
	
	f59_local2( Enum.CharacterTauntTypes.TAUNT_TYPE_FIRST_PLACE, "HEROES_1ST_PLACE_TAUNT" )
	return f59_local0
end, true )
CoD.CCUtility.GetDisplayNameForTaunt = function ( f61_arg0, f61_arg1 )
	for f61_local10, f61_local11 in ipairs( Engine.GetHeroList( f61_arg0 ) ) do
		local f61_local12 = Engine.GetHeroBundleInfo( f61_arg0, f61_local11.bodyIndex )
		for f61_local4, f61_local5 in ipairs( CoD.CCUtility.TauntsData.TauntTypeAWINames ) do
			local f61_local7 = CoD.CCUtility.TauntsData.GetTauntCount( f61_local12, f61_local4 - 1 )
			for f61_local3 = 0, f61_local7 - 1, 1 do
				if CoD.CCUtility.TauntsData.GetTauntXAnim( f61_local12, f61_local4 - 1, f61_local3 ) == f61_arg1 then
					return CoD.CCUtility.TauntsData.GetTauntDisplayName( f61_local12, f61_local4 - 1, f61_local3 )
				end
			end
		end
	end
	return ""
end

CoD.CCUtility.GetHeroDisplayNameAndIndexForTaunt = function ( f62_arg0, f62_arg1 )
	for f62_local10, f62_local11 in ipairs( Engine.GetHeroList( f62_arg0 ) ) do
		local f62_local12 = Engine.GetHeroBundleInfo( f62_arg0, f62_local11.bodyIndex )
		for f62_local4, f62_local5 in ipairs( CoD.CCUtility.TauntsData.TauntTypeAWINames ) do
			local f62_local7 = CoD.CCUtility.TauntsData.GetTauntCount( f62_local12, f62_local4 - 1 )
			for f62_local3 = 0, f62_local7 - 1, 1 do
				if CoD.CCUtility.TauntsData.GetTauntXAnim( f62_local12, f62_local4 - 1, f62_local3 ) == f62_arg1 then
					return f62_local11.displayName, f62_local11.bodyIndex
				end
			end
		end
	end
	return ""
end

CoD.CCUtility.GetTypeNameForGesture = function ( f63_arg0, f63_arg1, f63_arg2 )
	for f63_local12, f63_local13 in ipairs( Engine.GetHeroList( f63_arg0 ) ) do
		local f63_local14 = Engine.GetHeroBundleInfo( f63_arg0, f63_local13.bodyIndex )
		if f63_local13.assetName == f63_arg1 then
			for f63_local7, f63_local8 in ipairs( CoD.CCUtility.TauntsData.GestureTypeAWINames ) do
				local f63_local9 = CoD.CCUtility.TauntsData.GetGestureCount( f63_local14, f63_local7 - 1 )
				for f63_local6 = 0, f63_local9 - 1, 1 do
					if CoD.CCUtility.TauntsData.GetGestureXAnim( f63_local14, f63_local7 - 1, f63_local6 ) == f63_arg2 then
						return CoD.CCUtility.TauntsData.GestureTypeDisplayNames[f63_local7]
					end
				end
			end
		end
	end
	return ""
end

CoD.CCUtility.GetDisplayNameForGesture = function ( f64_arg0, f64_arg1, f64_arg2 )
	for f64_local12, f64_local13 in ipairs( Engine.GetHeroList( f64_arg0 ) ) do
		local f64_local14 = Engine.GetHeroBundleInfo( f64_arg0, f64_local13.bodyIndex )
		if f64_local13.assetName == f64_arg1 then
			for f64_local7, f64_local8 in ipairs( CoD.CCUtility.TauntsData.GestureTypeAWINames ) do
				local f64_local9 = CoD.CCUtility.TauntsData.GetGestureCount( f64_local14, f64_local7 - 1 )
				for f64_local6 = 0, f64_local9 - 1, 1 do
					if CoD.CCUtility.TauntsData.GetGestureXAnim( f64_local14, f64_local7 - 1, f64_local6 ) == f64_arg2 then
						return CoD.CCUtility.TauntsData.GetGestureDisplayName( f64_local14, f64_local7 - 1, f64_local6 )
					end
				end
			end
		end
	end
	return ""
end

CoD.CCUtility.GetHeroDisplayNameAndIndex = function ( f65_arg0, f65_arg1 )
	for f65_local3, f65_local4 in ipairs( Engine.GetHeroList( f65_arg0 ) ) do
		local f65_local5 = Engine.GetHeroBundleInfo( f65_arg0, f65_local4.bodyIndex )
		if f65_local4.assetName == f65_arg1 then
			return f65_local4.displayName, f65_local4.bodyIndex
		end
	end
	return ""
end

CoD.CCUtility.Heroes.GetHeroUnlockInfo = function ( f66_arg0, f66_arg1, f66_arg2, f66_arg3 )
	local f66_local0 = ""
	local f66_local1 = true
	for f66_local2 = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_FIRST, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_COUNT - 1, 1 do
		local f66_local5 = Engine.GetLoadoutItemIndexForHero( f66_arg2 or CoD.CCUtility.customizationMode, f66_arg1, f66_local2 )
		if IsLive() and IsFirstTimeSetup( f66_arg0, Enum.eModes.MODE_MULTIPLAYER ) then
			if f66_local1 then
				f66_local1 = Engine.IsItemLocked( f66_arg0, f66_local5, Enum.eModes.MODE_MULTIPLAYER )
			end
		end
		if IsProgressionEnabled( f66_arg0 ) then
			if f66_local1 then
				if not CoD.PrestigeUtility.isInPermanentUnlockMenu then
					f66_local1 = Engine.IsItemLocked( f66_arg0, f66_local5, f66_arg2 or CoD.CCUtility.customizationMode )
				else
					f66_local1 = false
				end
			end
			f66_local0 = CoD.GetUnlockRankAndLevelForItemIndex( f66_arg0, f66_local5, f66_arg3 or "MENU_UNLOCKED_AT", f66_arg2 or CoD.CCUtility.customizationMode )
		end
	end
	if not IsProgressionEnabled( f66_arg0 ) then
		f66_local1 = false
	end
	return f66_local1, f66_local0
end

CoD.CCUtility.Heroes.GetPersonalizationNewCount = function ( f67_arg0, f67_arg1 )
	local f67_local0 = CoD.CCUtility.customizationMode
	local f67_local1 = 0
	if f67_arg1 then
		local f67_local2 = Engine.GetHeroBundleInfo( f67_local0, f67_arg1 )
		for f67_local3 = 0, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_COUNT - 1, 1 do
			local f67_local6 = Engine.CharacterCustomizationNewItemCount( f67_arg0, f67_arg1, f67_local3 )
			f67_local1 = f67_local1 + (type( f67_local6 ) and f67_local6.total or 0)
		end
		f67_local1 = f67_local1 + CoD.CCUtility.GetTauntsAndGesturesNewCount( f67_arg0, f67_arg1, f67_local2, f67_local0 )
	end
	return f67_local1
end

local f0_local13 = function ( f68_arg0, f68_arg1, f68_arg2, f68_arg3, f68_arg4 )
	local f68_local0 = Engine.GetEquippedInfoForHero( f68_arg3, CoD.CCUtility.customizationMode, f68_arg0.bodyIndex )
	local f68_local1 = Engine.GetHeroCustomizationTable( CoD.CCUtility.customizationMode, f68_arg0.bodyIndex )
	local f68_local2, f68_local3 = CoD.CCUtility.Heroes.GetHeroUnlockInfo( f68_arg3, f68_arg0.bodyIndex )
	local f68_local4 = CoD.CCUtility.Heroes.HeroIndexForEdits
	if not f68_local4 then
		f68_local4 = Engine.GetEquippedHero( f68_arg3, CoD.CCUtility.customizationMode )
	end
	local f68_local5 = Engine.GetHeroBundleInfo( CoD.CCUtility.customizationMode, f68_arg0.bodyIndex ) or {}
	local f68_local6 = {
		models = {
			backgroundWithCharacter = f68_arg0.backgroundWithCharacter or "blacktransparent",
			lockedBackgroundWithCharacter = f68_arg0.background,
			name = f68_arg0.displayName,
			unlockDescription = f68_local3,
			level = 1,
			count = Engine.Localize( "MENU_X_OF_Y", f68_arg1, f68_arg2 ),
			unlockedCharacterSliver = f68_arg0.frozenMomentRender or "blacktransparent",
			lockedCharacterSliver = f68_local5.lockedSliverRender or "blacktransparent",
			disabled = f68_arg0.disabled or f68_local2,
			equippedSlot = Engine.GetLoadoutTypeForHero( f68_arg3, f68_arg0.bodyIndex ),
			selectedHeadInfo = f0_local5( f68_arg3, f68_local1, f68_local0, f68_arg0.bodyIndex, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET ),
			selectedBodyInfo = f0_local5( f68_arg3, f68_local1, f68_local0, f68_arg0.bodyIndex, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY ),
			selectedShowcaseWeaponInfo = nil,
			selectedTauntInfo = nil,
			itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM,
			heroIndex = f68_arg0.bodyIndex,
			breadcrumbCount = CoD.CCUtility.Heroes.GetPersonalizationNewCount( f68_arg3, f68_arg0.bodyIndex )
		},
		properties = {
			heroIndex = f68_arg0.bodyIndex,
			selectIndex = f68_arg0.bodyIndex == f68_local4
		}
	}
	if not f68_arg0.disabled then
		f68_local6.models.loadoutDatasource = f0_local3( f68_local6, CoD.CCUtility.customizationMode, f68_arg3 )
		if IsLuaCodeVersionAtLeast( 5 ) then
			f68_local6.models.cardBackDatasource = f0_local4( f68_local6, f68_arg0, CoD.CCUtility.customizationMode, f68_arg3, f68_local5, f68_arg4 )
		end
	end
	return f68_local6
end

DataSources.HeroesList = DataSourceHelpers.ListSetup( "HeroesList", function ( f69_arg0 )
	local f69_local0 = Engine.GetHeroList( CoD.CCUtility.customizationMode )
	local f69_local1 = {}
	local f69_local2 = Enum.CharacterGenderTypes.CHARACTER_GENDER_TYPE_ANY
	if CoD.CCUtility.customizationMode == Enum.eModes.MODE_CAMPAIGN then
		f69_local2 = Engine.GetEquippedGender( f69_arg0, Enum.eModes.MODE_CAMPAIGN )
	end
	local f69_local3 = f0_local0( f69_arg0, f69_local0 )
	for f69_local7, f69_local8 in ipairs( f69_local0 ) do
		if f69_local2 == Enum.CharacterGenderTypes.CHARACTER_GENDER_TYPE_ANY or f69_local8.gender == f69_local2 then
			table.insert( f69_local1, f0_local13( f69_local8, f69_local7, #f69_local0, f69_arg0, f69_local3 ) )
		end
	end
	return f69_local1
end, true )
DataSources.GendersList = DataSourceHelpers.ListSetup( "GendersList", function ( f70_arg0 )
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
DataSources.HeroFaceButtonList = DataSourceHelpers.ListSetup( "HeroFaceButtonList", function ( f71_arg0 )
	local f71_local0 = CoD.CCUtility.customizationMode
	local f71_local1 = Engine.GetHeadList( f71_local0, Engine.GetEquippedGender( f71_arg0, f71_local0 ) )
	local f71_local2 = {}
	for f71_local6, f71_local7 in ipairs( f71_local1 ) do
		table.insert( f71_local2, {
			models = {
				name = f71_local7.displayName,
				headExtraCamInfo = "" .. CoD.CCUtility.customizationMode .. ";" .. f71_local7.headIndex .. ";" .. f71_arg0
			},
			properties = {
				headIndex = f71_local7.headIndex
			}
		} )
	end
	return f71_local2
end, true )
