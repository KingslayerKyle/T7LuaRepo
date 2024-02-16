-- 39c8c003cc11c5a290da430be4d88f72
-- This hash is used for caching, delete to decompile the file again

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
CoD.CCUtility.TauntsData.TauntTypeStatArray = {
	"first_place"
}
if #CoD.CCUtility.TauntsData.TauntTypeStatArray ~= Enum.CharacterTauntTypes.TAUNT_TYPE_COUNT then
	error( "Need taunt stat names to match taunt type enums ( " .. #CoD.CCUtility.TauntsData.TauntTypeAWINames .. " ~= " .. Enum.CharacterGestureTypes.TAUNT_TYPE_COUNT .. " )" )
end
CoD.CCUtility.SpecialistAbilityIcons = {
	"t7_hud_mp_ability_hero_ironskin_available",
	"t7_hud_mp_ability_hero_opticcamo_available",
	"t7_hud_mp_ability_hero_clone_available",
	"t7_hud_mp_ability_hero_combatefficiency_available",
	"t7_hud_mp_ability_hero_flashback_available",
	"t7_hud_mp_ability_hero_heat_wave_available",
	"t7_hud_mp_ability_hero_resurrect_available",
	"t7_hud_mp_ability_hero_speedburst_available",
	"t7_hud_mp_ability_hero_visionpulse_available"
}
CoD.CCUtility.SpecialistWeaponIcons = {
	"t7_hud_mp_weapon_hero_gravityspikes_available",
	"t7_hud_mp_weapon_hero_bowlauncher_available",
	"t7_hud_mp_weapon_hero_lightninggun_available",
	"t7_hud_mp_weapon_hero_pineapplegun_available",
	"t7_hud_mp_weapon_hero_annihilator_available",
	"t7_hud_mp_weapon_hero_chemgun_available",
	"t7_hud_mp_weapon_hero_minigun_available",
	"t7_hud_mp_weapon_hero_armblade_available",
	"t7_hud_mp_weapon_hero_flamethrower_available"
}
CoD.CCUtility.CompletionEpicComplete = function ( f1_arg0, f1_arg1 )
	if CoD.isCampaign then
		return false
	end
	local f1_local0 = CoD.PrestigeUtility.GetPermanentUnlockMode()
	for f1_local1 = 1, #f1_arg1, 1 do
		if Engine.IsCharacterCustomizationItemLocked( f1_arg0, f1_local1, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY, CoD.CCUtility.PersonalizeHeroData.SpecialistEpicItemIndex, f1_local0 ) or Engine.IsCharacterCustomizationItemLocked( f1_arg0, f1_local1, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET, CoD.CCUtility.PersonalizeHeroData.SpecialistEpicItemIndex, f1_local0 ) then
			return false
		end
	end
	return true
end

CoD.CCUtility.SetEdittingHero = function ( f2_arg0, f2_arg1 )
	if CoD.CCUtility.Heroes.HeroIndexForEdits ~= f2_arg1 then
		CoD.CCUtility.Heroes.HeroIndexForEdits = f2_arg1
		if f2_arg1 ~= nil then
			MarkCACPaintshopDataDirtyForEdittingSpecialist( f2_arg0 )
		end
	end
end

CoD.CCUtility.CreatePersonalizeColorDatasource = function ( f3_arg0, f3_arg1, f3_arg2, f3_arg3 )
	DataSources[f3_arg1] = DataSourceHelpers.ListSetup( f3_arg1, function ( f4_arg0 )
		local f4_local0 = {}
		for f4_local9, f4_local10 in ipairs( DataSources[f3_arg1].colorTable ) do
			local f4_local11 = {
				models = {
					color = f4_local10.red .. " " .. f4_local10.green .. " " .. f4_local10.blue,
					icon = f4_local10.icon or "$white",
					xOfY = Engine.Localize( "MENU_X_OF_Y", f4_local9, #DataSources[f3_arg1].colorTable )
				},
				properties = {
					optionIndex = f4_local9
				}
			}
			if f3_arg3 then
				for f4_local7, f4_local8 in pairs( f3_arg3( f4_local9 ) ) do
					f4_local11.properties[f4_local7] = f4_local8
				end
			end
			table.insert( f4_local0, f4_local11 )
		end
		return f4_local0
	end, true )
	DataSources[f3_arg1].colorTable = f3_arg2
	return f3_arg1
end

CoD.CCUtility.GetHeaderForLoadoutSlot = function ( f5_arg0 )
	if f5_arg0 == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON then
		return "HEROES_HERO_WEAPON_CAPS"
	elseif f5_arg0 == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET then
		return "HEROES_HERO_ABILITY_CAPS"
	else
		return nil
	end
end

CoD.CCUtility.GetHintTextForLoadoutSlot = function ( f6_arg0 )
	if f6_arg0 == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON then
		return "HEROES_HERO_WEAPON_HINT"
	elseif f6_arg0 == Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET then
		return "HEROES_HERO_ABILITY_HINT"
	else
		return nil
	end
end

CoD.CCUtility.CreateCarouselItemLoadoutDatasource = function ( f7_arg0, f7_arg1, f7_arg2 )
	local f7_local0 = "HeroCarouselItemLoadoutList" .. f7_arg0.properties.heroIndex
	DataSources[f7_local0] = DataSourceHelpers.ListSetup( f7_local0, function ( f8_arg0 )
		local f8_local0 = {}
		local f8_local1 = Engine.GetLoadoutTypeForHero( f8_arg0, f7_arg0.properties.heroIndex )
		for f8_local2 = 0, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_COUNT - 1, 1 do
			local f8_local5 = Engine.GetLoadoutInfoForHero( f7_arg1, f7_arg0.properties.heroIndex, f8_local2 )
			local f8_local6 = false
			if IsProgressionEnabled( f8_arg0 ) or IsLive() and IsFirstTimeSetup( f8_arg0, Enum.eModes.MODE_MULTIPLAYER ) then
				f8_local6 = Engine.IsItemLocked( f8_arg0, f8_local5.itemIndex, Enum.eModes.MODE_MULTIPLAYER )
			end
			if f8_local5 then
				table.insert( f8_local0, {
					models = {
						name = f8_local5.itemName,
						gameImageOff = f8_local5.gameImageOff,
						gameImageOn = f8_local5.gameImageOn,
						description = f8_local5.itemDesc,
						header = CoD.CCUtility.GetHeaderForLoadoutSlot( f8_local2 ),
						equippedSlot = f8_local2,
						itemIndex = f8_local5.itemIndex,
						disabled = f8_local6,
						itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM
					},
					properties = {
						equippedSlot = f8_local2,
						hintText = CoD.CCUtility.GetHintTextForLoadoutSlot( f8_local2 ),
						selectIndex = f8_local1 == f8_local2,
						heroIndex = f7_arg0.properties.heroIndex
					}
				} )
			end
		end
		return f8_local0
	end, true )
	return f7_local0
end

CoD.CCUtility.GetTransmissionNewStatPath = function ( f9_arg0, f9_arg1 )
	return "specialiststats." .. f9_arg0 .. ".transmissionIsOld." .. f9_arg1
end

CoD.CCUtility.IsTransmissionNew = function ( f10_arg0, f10_arg1, f10_arg2 )
	return IsStorageValueEqualTo( f10_arg0, "stats_mp", CoD.CCUtility.GetTransmissionNewStatPath( f10_arg1, f10_arg2 ), 0 )
end

CoD.CCUtility.GetTransmissionNewCount = function ( f11_arg0, f11_arg1, f11_arg2 )
	local f11_local0 = f11_arg2.transmissions or 0
	local f11_local1 = 0
	for f11_local2 = 0, f11_local0 - 1, 1 do
		local f11_local5, f11_local6 = Engine.IsSpecialistTransmissionLocked( f11_arg0, f11_arg1, f11_local2 + 1 )
		if f11_local5 then
			break
		elseif CoD.CCUtility.IsTransmissionNew( f11_arg0, f11_arg1, f11_local2 ) then
			f11_local1 = f11_local1 + 1
		end
	end
	return f11_local1
end

CoD.CCUtility.CreateCarouselCardBackDatasource = function ( f12_arg0, f12_arg1, f12_arg2, f12_arg3, f12_arg4, f12_arg5 )
	local f12_local0 = "HeroCarouselCardBackList" .. f12_arg0.properties.heroIndex
	DataSources[f12_local0] = DataSourceHelpers.ListSetup( f12_local0, function ( f13_arg0 )
		local f13_local0 = {}
		local f13_local1 = function ( f14_arg0, f14_arg1, f14_arg2, f14_arg3 )
			local f14_local0 = {
				models = {
					text = f14_arg0,
					icon = f14_arg1
				},
				properties = {}
			}
			if f14_arg2 then
				for f14_local4, f14_local5 in pairs( f14_arg2 ) do
					f14_local0.models[f14_local4] = f14_local5
				end
			end
			f14_local0.models.alias = f14_local0.models.alias or ""
			if f14_arg3 then
				for f14_local4, f14_local5 in pairs( f14_arg3 ) do
					f14_local0.properties[f14_local4] = f14_local5
				end
			end
			return f14_local0
		end
		
		local f13_local2 = function ( f15_arg0, f15_arg1, f15_arg2 )
			return Engine.Localize( "HEROES_CARD_BACK_ENTRY", f15_arg0, f15_arg1, f15_arg2 or "" )
		end
		
		local f13_local3 = 1
		local f13_local4 = Engine.GetLoadoutInfoForHero( f12_arg2, f12_arg0.properties.heroIndex, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_WEAPON )
		local f13_local5 = Engine.GetLoadoutInfoForHero( f12_arg2, f12_arg0.properties.heroIndex, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_GADGET )
		if IsProgressionEnabled( f13_arg0 ) then
			local f13_local6 = f13_local1( f13_local2( f13_local3, 1, "HEROES_SIMULATION" ), "t7_hud_hero_icon_filetype_stats", {
				cardBackIcon = f12_arg1.cardBackIcon,
				realName = f12_arg1.realName,
				age = f12_arg1.age,
				genderString = f12_arg1.genderString,
				frameWidget = "CoD.ChooseCharacterLoadout_CardBack_Stats"
			}, nil )
			if CoDShared.IsLootHero( f12_arg1 ) then
				if f13_local4 then
					f13_local6.models.weaponName = f13_local4.itemName
					local f13_local7 = "specialiststats." .. f12_arg0.properties.heroIndex .. ".stats.kills_weapon"
					f13_local6.models.weaponKills = CoD.CACUtility.CombatRecordGetFullNameStat( f13_arg0, f13_local7 )
					f13_local6.models.weaponKillsPerUse = CombatRecordGetTwoStatRatioForItemIndexAndSpecificNumerator( f13_arg0, f13_local7, "used", f13_local4.itemIndex )
					f13_local6.models.weaponKillsPerDeath = CombatRecordGetTwoStatRatioForItemIndexAndSpecificNumerator( f13_arg0, f13_local7, "deathsDuringUse", f13_local4.itemIndex )
				end
				if f13_local5 then
					f13_local6.models.abilityName = f13_local5.itemName
					local f13_local7 = "specialiststats." .. f12_arg0.properties.heroIndex .. ".stats.kills_ability"
					f13_local6.models.abilityKills = CoD.CACUtility.CombatRecordGetFullNameStat( f13_arg0, f13_local7 )
					f13_local6.models.abilityKillsLabel = f13_local5.itemName .. "_KILL_TYPE"
					f13_local6.models.abilityKillsPerUse = CombatRecordGetTwoStatRatioForItemIndexAndSpecificNumerator( f13_arg0, f13_local7, "used", f13_local5.itemIndex )
					f13_local6.models.abilityKillsPerUseLabel = f13_local5.itemName .. "_KILL_TYPE_PER_USE"
				end
			else
				if f13_local4 then
					f13_local6.models.weaponName = f13_local4.itemName
					f13_local6.models.weaponKills = CombatRecordGetItemStatForItemIndex( f13_arg0, "kills", f13_local4.itemIndex )
					f13_local6.models.weaponKillsPerUse = CombatRecordGetTwoStatRatioForItemIndex( f13_arg0, "kills", "used", f13_local4.itemIndex )
					f13_local6.models.weaponKillsPerDeath = CombatRecordGetTwoStatRatioForItemIndex( f13_arg0, "kills", "deathsDuringUse", f13_local4.itemIndex )
				end
				if f13_local5 then
					f13_local6.models.abilityName = f13_local5.itemName
					f13_local6.models.abilityKills = CombatRecordGetItemStatForItemIndex( f13_arg0, "combatRecordStat", f13_local5.itemIndex )
					f13_local6.models.abilityKillsLabel = f13_local5.itemName .. "_KILL_TYPE"
					f13_local6.models.abilityKillsPerUse = CombatRecordGetTwoStatRatioForItemIndex( f13_arg0, "combatRecordStat", "used", f13_local5.itemIndex )
					f13_local6.models.abilityKillsPerUseLabel = f13_local5.itemName .. "_KILL_TYPE_PER_USE"
				end
			end
			table.insert( f13_local0, f13_local6 )
			f13_local3 = f13_local3 + 1
		end
		table.insert( f13_local0, f13_local1( f13_local2( f13_local3, 1, "HEROES_BIO" ), "t7_hud_hero_icon_filetype_text", {
			cardBackIcon = f12_arg1.cardBackIcon,
			realName = f12_arg1.realName,
			age = f12_arg1.age,
			genderString = f12_arg1.genderString,
			bio = f12_arg1.bio,
			frameWidget = "CoD.ChooseCharacterLoadout_CardBack_Bio"
		}, nil ) )
		f13_local3 = f13_local3 + 1
		if f13_local4 then
			table.insert( f13_local0, f13_local1( f13_local2( f13_local3, 1, f13_local4.itemName ), "t7_hud_hero_icon_filetype_details", {
				weaponSubItem = f13_local2( f13_local3, 3, f12_arg1.weaponSubItemDesc ),
				weaponCardBackIcon = f12_arg1.weaponCardBackIcon or "blacktransparent",
				weaponCardBackSubIcon = f12_arg1.weaponCardBackSubIcon or "blacktransparent",
				weaponDesc = f12_arg1.weaponCardBackDesc,
				weaponSchemaTitle = f13_local2( f13_local3, 2, "HEROES_SCHEMA" ),
				weaponSchema = f12_arg1.weaponSchema,
				frameWidget = "CoD.ChooseCharacterLoadout_CardBack_Weapon"
			}, nil ) )
		end
		f13_local3 = f13_local3 + 1
		if f13_local5 then
			table.insert( f13_local0, f13_local1( f13_local2( f13_local3, 1, f13_local5.itemName ), "t7_hud_hero_icon_filetype_details", {
				abilitySubItem = f13_local2( f13_local3, 3, f12_arg1.abilitySubItemDesc ),
				abilityCardBackIcon = f12_arg1.abilityCardBackIcon or "blacktransparent",
				abilityCardBackSubIcon = f12_arg1.abilityCardBackSubIcon or "blacktransparent",
				abilityDesc = f12_arg1.abilityCardBackDesc,
				abilitySchemaTitle = f13_local2( f13_local3, 2, "HEROES_SCHEMA" ),
				abilitySchema = f12_arg1.abilitySchema,
				frameWidget = "CoD.ChooseCharacterLoadout_CardBack_Ability"
			}, nil ) )
		end
		f13_local3 = f13_local3 + 1
		if IsProgressionEnabled( f13_arg0 ) then
			local f13_local6 = function ( f16_arg0, f16_arg1, f16_arg2, f16_arg3 )
				local f16_local0 = "TransmissionContactList_" .. f16_arg0 .. "_" .. f16_arg1
				DataSources[f16_local0] = DataSourceHelpers.ListSetup( f16_local0, function ( f17_arg0 )
					local f17_local0 = {}
					local f17_local1 = f12_arg4["transmission" .. f16_arg1 .. "ContactsCount"] or 0
					for f17_local2 = 0, f17_local1 - 1, 1 do
						table.insert( f17_local0, {
							models = {
								contactIcon = f12_arg4["transmission" .. f16_arg1 .. "Contact" .. f17_local2 .. "Image"],
								contactName = Engine.Localize( "HEROES_CONTACT_X", f16_arg2, f16_arg3 + f17_local2, f12_arg4["transmission" .. f16_arg1 .. "Contact" .. f17_local2 .. "Name"] )
							}
						} )
					end
					return f17_local0
				end, true )
				return f16_local0
			end
			
			local f13_local7 = f12_arg4.transmissions or 0
			for f13_local8 = 0, f13_local7 - 1, 1 do
				local f13_local11, f13_local12 = nil
				if Dvar.allItemsUnlocked:get() then
					f13_local11 = false
				else
					f13_local11, f13_local12 = Engine.IsSpecialistTransmissionLocked( f13_arg0, f12_arg0.properties.heroIndex, f13_local8 + 1 )
				end
				if not f13_local11 then
					local f13_local13, f13_local14 = nil
					if f13_local8 == 4 then
						f13_local14 = f12_arg4["transmission" .. f13_local8 .. "ID"] or ""
						f13_local13 = "t7_menu_hero_bio_headshot_unknown"
					else
						f13_local14 = (f12_arg4.characterFrequency or "") .. "." .. (f12_arg4["transmission" .. f13_local8 .. "ID"] or "")
						f13_local13 = f12_arg1.cardBackIcon
					end
					table.insert( f13_local0, f13_local1( f13_local2( f13_local3, 1, "HEROES_TRANSMISSION" ), "t7_hud_hero_icon_filetype_audio", {
						cardBackIcon = f13_local13,
						transmissionName = Engine.Localize( "HEROES_TRANSMISSION_X", f13_local3, 1, f12_arg4["transmission" .. f13_local8 .. "Name"] or "" ),
						contactsListDatasource = f13_local6( f12_arg0.properties.heroIndex, f13_local8, f13_local3, 2 ),
						transmissionSynopsis = f12_arg4["transmission" .. f13_local8 .. "Synopsis"] or "",
						transmissionFrequency = f13_local14,
						alias = f12_arg4["transmission" .. f13_local8 .. "Alias"],
						frameWidget = "CoD.ChooseCharacterLoadout_CardBack_Transmission",
						playingSound = false,
						isNew = CoD.CCUtility.IsTransmissionNew( f13_arg0, f12_arg1.bodyIndex, f13_local8 )
					}, {
						transmissionIndex = f13_local8,
						heroIndex = f12_arg1.bodyIndex
					} ) )
				elseif f13_local12 then
					local f13_local13 = "HEROES_COMPLETE_ASSIGNMENT_FOR_TRANSMISSION"
					local f13_local14 = ""
					local f13_local15 = ""
					local f13_local16 = ""
					local f13_local17 = CoD.getStatsMilestoneTable( f13_local12.challengeTable + 1, CoD.PrestigeUtility.GetPermanentUnlockMode() )
					if f13_local8 == 0 then
					
					elseif f13_local8 == 4 or f13_local8 == 3 and not f12_arg5 then
						f13_local13 = "HEROES_ASSIGNMENT_CLASSIFIED"
					else
						f13_local14 = Engine.Localize( Engine.TableLookupGetColumnValueForRow( f13_local17, f13_local12.challengeRow, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_STRING ), f13_local12.targetValue, f12_arg1.displayName )
					end
					f13_local14 = Engine.Localize( Engine.TableLookupGetColumnValueForRow( f13_local17, f13_local12.challengeRow, Enum.milestoneTableColumns_t.MILESTONE_COLUMN_STRING ) .. "_DESC", f13_local12.targetValue, f12_arg1.displayName )
					f13_local15 = f13_local12.currentValue / f13_local12.targetValue
					f13_local16 = Engine.Localize( "MENU_X_SLASH_Y", f13_local12.currentValue, f13_local12.targetValue )
				end
				f13_local3 = f13_local3 + 1
			end
		end
		return f13_local0
	end, true )
	return f12_local0
end

CoD.CCUtility.CreateSelectedItemModel = function ( f18_arg0, f18_arg1, f18_arg2, f18_arg3, f18_arg4 )
	local f18_local0 = ""
	local f18_local1 = ""
	local f18_local2 = ""
	if f18_arg4 == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
		f18_local0 = "HEROES_BODY"
		local f18_local3 = f18_arg1.bodies[f18_arg2.selectedBody + 1]
		if f18_local3 then
			f18_local1 = f18_local3.name
			local f18_local4 = {}
			for f18_local8, f18_local9 in ipairs( f18_arg2.bodyColors ) do
				table.insert( f18_local4, f18_local3.accents[f18_local8][f18_local9 + 1] )
			end
			f18_local2 = CoD.CCUtility.CreatePersonalizeColorDatasource( f18_arg0, "PersonalizeListSelection_" .. f18_arg3 .. "_" .. f18_arg4, f18_local4, nil )
		end
	elseif f18_arg4 == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
		f18_local0 = "HEROES_HEAD"
		local f18_local3 = f18_arg1.helmets[f18_arg2.selectedHelmet + 1]
		if f18_local3 then
			f18_local1 = f18_local3.name
			local f18_local4 = {}
			for f18_local8, f18_local9 in ipairs( f18_arg2.helmetColors ) do
				table.insert( f18_local4, f18_local3.accents[f18_local8][f18_local9 + 1] )
			end
			f18_local2 = CoD.CCUtility.CreatePersonalizeColorDatasource( f18_arg0, "PersonalizeListSelection_" .. f18_arg3 .. "_" .. f18_arg4, f18_local4, nil )
		end
	else
		return nil
	end
	return {
		categoryName = f18_local0,
		currentSelectionName = f18_local1,
		colorListDatasource = f18_local2
	}
end

CoD.CCUtility.GetHeroEquippedSlot = function ( f19_arg0, f19_arg1 )
	local f19_local0 = CoD.CCUtility.customizationMode
	local f19_local1 = CoD.CCUtility.Heroes.HeroIndexForEdits
	local f19_local2 = nil
	for f19_local3 = 0, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_COUNT - 1, 1 do
		local f19_local6 = Engine.GetLoadoutInfoForHero( f19_local0, f19_local1, f19_local3 )
		if f19_local6.itemIndex == f19_arg1 then
			f19_local2 = f19_local3
			break
		end
	end
	return f19_local2
end

CoD.CCUtility.GetBlackjackHeroIndex = function ()
	return LuaUtils.GetBlackjackHeroIndex( CoD.CCUtility.customizationMode )
end

CoD.CCUtility.PersonalizeHeroData.HeroCustomizationTabCategories = {
	"standard",
	"loot"
}
DataSources.HeroCustomizationTabs = DataSourceHelpers.ListSetup( "HeroCustomizationTabs", function ( f21_arg0 )
	local f21_local0 = {}
	local f21_local1 = function ( f22_arg0, f22_arg1, f22_arg2 )
		table.insert( f21_local0, {
			models = {
				tabName = f22_arg0,
				tabIcon = "",
				breadcrumbCount = 0
			},
			properties = {
				isBlackMarket = f22_arg1,
				selectIndex = not f22_arg1,
				filterName = f22_arg2
			}
		} )
	end
	
	table.insert( f21_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderl
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	f21_local1( "MPUI_STANDARD_CAPS", false, CoD.CCUtility.PersonalizeHeroData.HeroCustomizationTabCategories[1] )
	if IsLive() then
		f21_local1( "MENU_BLACK_MARKET", true, CoD.CCUtility.PersonalizeHeroData.HeroCustomizationTabCategories[2] )
	end
	table.insert( f21_local0, {
		models = {
			tabIcon = CoD.buttonStrings.shoulderr
		},
		properties = {
			m_mouseDisabled = true
		}
	} )
	return f21_local0
end, false )
CoD.CCUtility.PersonalizeHeroData.StandardFilter = function ( f23_arg0 )
	return CoD.SafeGetModelValue( f23_arg0, "isBMItem" ) == nil
end

CoD.CCUtility.PersonalizeHeroData.BlackMarketFilter = function ( f24_arg0 )
	local f24_local0 = CoD.SafeGetModelValue( f24_arg0, "isBMItem" )
	local f24_local1
	if f24_local0 == nil or f24_local0 ~= true then
		f24_local1 = false
	else
		f24_local1 = true
	end
	return f24_local1
end

CoD.CCUtility.PersonalizeCharacterListPrepare = function ( f25_arg0 )
	local f25_local0 = {}
	CoD.CCUtility.PersonalizeHeroData.SpacerRows = {}
	local f25_local1 = function ( f26_arg0, f26_arg1, f26_arg2, f26_arg3, f26_arg4, f26_arg5, f26_arg6 )
		local f26_local0 = 0
		if f26_arg2 then
			f26_local0 = 1
		end
		local f26_local1 = 0
		if f26_arg3 then
			f26_local1 = 1
		end
		return {
			models = {
				categoryName = f26_arg1,
				categoryImage = f26_arg5,
				fullCategoryName = f26_arg1,
				categoryDesc = f26_arg4 or "",
				currentSelectionName = f26_arg2 or "",
				currentSelectionVariantName = f26_arg3 or "",
				colorListDatasource = "",
				currentSelectionNameAlpha = f26_local0,
				currentSelectionVariantNameAlpha = f26_local1
			},
			properties = {
				customizationArea = f26_arg0,
				colorRow = false,
				disabled = f26_arg6
			}
		}
	end
	
	local f25_local2 = function ( f27_arg0, f27_arg1, f27_arg2, f27_arg3, f27_arg4, f27_arg5 )
		local f27_local0 = function ( f28_arg0 )
			local f28_local0 = {}
			if CoD.CCUtility.Heroes.heroCustomizationTable and CoD.CCUtility.Heroes.selectionTable then
				local f28_local1, f28_local2 = nil
				if f27_arg0 == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
					f28_local1 = CoD.CCUtility.Heroes.heroCustomizationTable.bodies[CoD.CCUtility.Heroes.selectionTable.selectedBody + 1]
					f28_local2 = CoD.CCUtility.Heroes.selectionTable.bodyColors
				elseif f27_arg0 == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
					f28_local1 = CoD.CCUtility.Heroes.heroCustomizationTable.helmets[CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1]
					f28_local2 = CoD.CCUtility.Heroes.selectionTable.helmetColors
				end
				if f28_local1 then
					for f28_local6, f28_local7 in ipairs( f28_local2 ) do
						table.insert( f28_local0, f28_local1.accents[f28_local6][f28_local7 + 1] )
					end
				end
			end
			local f28_local1 = "PersonalizeCharacterColors_" .. f27_arg0
			if DataSources[f28_local1] then
				DataSources[f28_local1].colorTable = f28_local0
				if f28_arg0 then
					f28_arg0:updateDatasource()
				end
				return f28_local1
			else
				return CoD.CCUtility.CreatePersonalizeColorDatasource( f25_arg0, f28_local1, f28_local0 )
			end
		end
		
		local f27_local1 = 0
		if f27_arg2 then
			f27_local1 = 1
		end
		local f27_local2 = 0
		if f27_arg3 then
			f27_local2 = 1
		end
		local f27_local3 = {}
		local f27_local4 = nil
		return {
			models = {
				categoryName = f27_arg1,
				categoryImage = "",
				fullCategoryName = f27_arg5,
				colorListDatasource = f27_local0(),
				categoryDesc = f27_arg4 or "",
				currentSelectionName = f27_arg2 or "",
				currentSelectionVariantName = f27_arg3 or "",
				currentSelectionNameAlpha = f27_local1,
				currentSelectionVariantNameAlpha = f27_local2
			},
			properties = {
				customizationArea = f27_arg0,
				colorRow = true,
				updateColors = f27_local0
			}
		}
	end
	
	local f25_local3 = function ( f29_arg0 )
		local f29_local0 = CoD.CCUtility.customizationMode
		local f29_local1 = CoD.CCUtility.Heroes.HeroIndexForEdits
		return {
			baseWeaponName = Engine.Localize( Engine.GetItemName( Engine.GetHeroShowcaseWeaponAttribute( f29_arg0, f29_local0, f29_local1, "weaponIndex" ) ) ),
			variantName = Engine.GetHeroShowcaseWeaponVariantName( f29_arg0, f29_local0, f29_local1 )
		}
	end
	
	if CoD.CCUtility.Heroes.heroCustomizationTable and CoD.CCUtility.Heroes.selectionTable then
		local f25_local4 = CoD.CCUtility.Heroes.heroCustomizationTable.helmets[CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1]
		if f25_local4 then
			local f25_local5 = CoD.CCUtility.customizationMode
			local f25_local6 = Enum.eModes.MODE_CAMPAIGN
			f25_local6 = f25_local1( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET, REG19 and "HEROES_HELMET" or "HEROES_HEAD", f25_local4.name, nil, nil, "uie_t7_menu_mp_hero_graphic_head" )
			local f25_local7 = Engine.CharacterCustomizationNewItemCount( f25_arg0, CoD.CCUtility.Heroes.HeroIndexForEdits, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET )
			f25_local6.models.breadcrumbCount = f25_local7.total
			table.insert( f25_local0, f25_local6 )
			if #CoD.CCUtility.Heroes.selectionTable.helmetColors >= 1 and #f25_local4.accents[1] > 1 then
				table.insert( f25_local0, f25_local2( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET, "HEROES_COLORS", f25_local4.accents[1][CoD.CCUtility.Heroes.selectionTable.helmetColors[1] + 1].name, nil, nil, "HEROES_HELMET_COLORS" ) )
			end
			CoD.CCUtility.PersonalizeHeroData.SpacerRows[#f25_local0] = true
		end
		local f25_local5 = CoD.CCUtility.Heroes.heroCustomizationTable.bodies[CoD.CCUtility.Heroes.selectionTable.selectedBody + 1]
		if f25_local5 then
			local f25_local6 = f25_local1( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY, "HEROES_BODY", f25_local5.name, nil, nil, "uie_t7_menu_mp_hero_graphic_body" )
			local f25_local7 = Engine.CharacterCustomizationNewItemCount( f25_arg0, CoD.CCUtility.Heroes.HeroIndexForEdits, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY )
			f25_local6.models.breadcrumbCount = f25_local7.total
			table.insert( f25_local0, f25_local6 )
			if #CoD.CCUtility.Heroes.selectionTable.bodyColors >= 1 and #f25_local5.accents[1] > 1 then
				table.insert( f25_local0, f25_local2( Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY, "HEROES_COLORS", f25_local5.accents[1][CoD.CCUtility.Heroes.selectionTable.bodyColors[1] + 1].name, nil, nil, "HEROES_BODY_COLORS" ) )
			end
			CoD.CCUtility.PersonalizeHeroData.SpacerRows[#f25_local0] = true
		end
		if CoD.CCUtility.customizationMode == Enum.eModes.MODE_MULTIPLAYER then
			local f25_local6 = f25_local3( f25_arg0 )
			table.insert( f25_local0, f25_local1( CoD.CCUtility.ShowcaseWeaponCategoryIndex, "HEROES_SHOWCASE_WEAPON", f25_local6.baseWeaponName, f25_local6.variantName, Engine.Localize( "HEROES_SHOWCASE_WEAPON_DESC", Engine.Localize( Engine.GetHeroName( CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits ) ) ), "uie_t7_menu_mp_hero_graphic_showcase" ) )
			CoD.CCUtility.PersonalizeHeroData.SpacerRows[#f25_local0] = true
			local f25_local8 = Engine.GetHeroBundleInfo( CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits )
			local f25_local9 = f25_local1
			local f25_local10 = CoD.CCUtility.TauntCategoryIndex
			local f25_local11 = "HEROES_TAUNTS_AND_GESTURES"
			local f25_local12, f25_local13, f25_local14 = nil
			local f25_local15 = "uie_t7_menu_mp_hero_graphic_taunt"
			local f25_local16
			if not CoD.CCUtility.TauntsData.CharacterHasAnyGestures( f25_local8 ) then
				f25_local16 = not CoD.CCUtility.TauntsData.CharacterHasAnyTaunts( f25_local8 )
			else
				f25_local16 = false
			end
			f25_local9 = f25_local9( f25_local10, f25_local11, f25_local12, f25_local13, f25_local14, f25_local15, f25_local16 )
			f25_local9.models.breadcrumbCount = CoD.CCUtility.GetTauntsAndGesturesNewCount( f25_arg0, CoD.CCUtility.Heroes.HeroIndexForEdits, f25_local8, CoD.CCUtility.customizationMode )
			table.insert( f25_local0, f25_local9 )
		end
	end
	if CoD.CCUtility.customizationMode == Enum.eModes.MODE_CAMPAIGN then
		local f25_local4 = function ( f30_arg0, f30_arg1, f30_arg2 )
			return {
				models = {
					categoryName = f30_arg0,
					categoryImage = f30_arg1,
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
					disabled = f30_arg2
				}
			}
		end
		
		table.insert( f25_local0, f25_local4( "HEROES_CHANGE_CHARACTER", "uie_t7_menu_mp_hero_graphic_face" ) )
		CoD.CCUtility.PersonalizeHeroData.SpacerRows[#f25_local0] = true
	end
	return f25_local0
end

local f0_local0 = {
	getSpacerAfterRow = function ( f31_arg0, f31_arg1, f31_arg2 )
		if CoD.CCUtility.PersonalizeHeroData.SpacerRows[f31_arg1] then
			return 7
		else
			
		end
	end
}
CoD.CCUtility.getBasePersonalizationItemModels = function ( f32_arg0, f32_arg1, f32_arg2, f32_arg3 )
	return {
		models = {
			name = f32_arg1,
			image = f32_arg2 or "$white",
			color = f32_arg3,
			optionIndex = f32_arg0,
			isBMPurchasable = false
		},
		properties = {}
	}
end

DataSources.CharacterCustomizationButtonList = DataSourceHelpers.ListSetup( "CharacterCustomizationButtonList", CoD.CCUtility.PersonalizeCharacterListPrepare, true, f0_local0 )
CoD.CCUtility.IsMissionCompleted = function ( f33_arg0, f33_arg1 )
	local f33_local0 = Engine.GetPlayerStats( f33_arg0, CoD.STATS_LOCATION_NORMAL, Enum.eModes.MODE_CAMPAIGN )
	return f33_local0.PlayerStatsByMap[f33_arg1].hasBeenCompleted:get() ~= 0
end

CoD.CCUtility.IsBodyOrHelmetAccessible = function ( f34_arg0, f34_arg1, f34_arg2, f34_arg3 )
	if CoD.CCUtility.customizationMode == Enum.eModes.MODE_CAMPAIGN or Engine.IsCampaignGame() then
		local f34_local0 = CoD.getStatsMilestoneTable( 2, Enum.eModes.MODE_CAMPAIGN )
		local f34_local1 = 1
		local f34_local2 = 2
		local f34_local3 = 3
		local f34_local4 = Engine.TableFindRows( f34_local0, f34_local1, f34_arg1 )
		if f34_local4 ~= nil then
			for f34_local8, f34_local9 in ipairs( f34_local4 ) do
				local f34_local10 = Engine.TableLookupGetColumnValueForRow( f34_local0, f34_local9, f34_local2 )
				local f34_local11 = Engine.TableLookupGetColumnValueForRow( f34_local0, f34_local9, f34_local3 )
				if f34_local10 + 1 == f34_arg2 and (f34_local11 == "none" or CoD.CCUtility.IsMissionCompleted( f34_arg0, f34_local11 )) then
					return true
				end
			end
		end
		return false
	elseif CoD.CCUtility.customizationMode == Enum.eModes.MODE_MULTIPLAYER then
		if IsProgressionEnabled( f34_arg0 ) then
			if f34_arg2 == CoD.CCUtility.PersonalizeHeroData.CompletionEpicItemIndex then
				return not Engine.IsCharacterCustomizationItemLocked( f34_arg0, CoD.CCUtility.Heroes.HeroIndexForEdits, CoD.CCUtility.PersonalizeHeroData.EdittingArea, CoD.CCUtility.PersonalizeHeroData.SpecialistEpicItemIndex )
			else
				return true
			end
		else
			local f34_local0
			if f34_arg2 == CoD.CCUtility.PersonalizeHeroData.SpecialistEpicItemIndex or f34_arg2 == CoD.CCUtility.PersonalizeHeroData.CompletionEpicItemIndex then
				f34_local0 = false
			else
				f34_local0 = true
			end
		end
		return f34_local0
	else
		return true
	end
end

CoD.CCUtility.HeroOptionsListPrepare = function ( f35_arg0 )
	local f35_local0 = {}
	local f35_local1 = CoD.CCUtility.CompletionEpicComplete( f35_arg0, Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER ) )
	local f35_local2 = function ( f36_arg0, f36_arg1, f36_arg2, f36_arg3, f36_arg4 )
		local f36_local0 = CoD.CCUtility.getBasePersonalizationItemModels( f36_arg0, f36_arg1, f36_arg2 or "$white", f36_arg3 or "255 255 255" )
		f36_local0.properties.optionIndex = f36_arg0
		f36_local0.properties.isColorOption = f36_arg3 ~= nil
		f36_local0.models.isColorOption = f36_arg3 ~= nil
		f36_local0.properties.selectIndex = f36_arg4
		if not f36_local0.properties.isColorOption then
			f36_local0.models.itemExtraCamInfo = "" .. CoD.CCUtility.customizationMode .. ":" .. CoD.CCUtility.Heroes.HeroIndexForEdits .. ":" .. CoD.CCUtility.PersonalizeHeroData.EdittingArea .. ":" .. f36_arg0 - 1 .. ":" .. f35_arg0
		else
			f36_local0.models.itemExtraCamInfo = ""
		end
		local f36_local1 = CoD.CCUtility.Heroes.HeroIndexForEdits
		local f36_local2 = CoD.CCUtility.PersonalizeHeroData.EdittingArea
		if IsProgressionEnabled( f35_arg0 ) and CoD.CCUtility.Heroes.DefaultHelmetBodyOption < f36_arg0 then
			local f36_local3 = false
			if not f36_local0.properties.isColorOption then
				f36_local3 = Engine.IsCharacterCustomizationItemLocked( f35_arg0, f36_local1, f36_local2, f36_arg0 )
			end
			f36_local0.models.isLocked = f36_local3
			f36_local0.models.isClassified = false
			if not IsCampaign() and f36_arg0 == CoD.CCUtility.PersonalizeHeroData.CompletionEpicItemIndex then
				f36_local0.models.isClassified = not f35_local1
				if f36_local0.models.isClassified == true then
					f36_local0.models.name = "MENU_CLASSIFIED"
				end
			end
			if not f36_local0.models.isClassified then
				local f36_local4 = Engine.GetCharacterCustomizationItemUnlockInfo( f35_arg0, f36_local1, f36_local2, f36_arg0 )
				if f36_local4 then
					f36_local0.models.unlockDescription = f36_local4.unlockDescription
					f36_local0.models.unlockReward = f36_local4.unlockReward
					f36_local0.models.unlockProgressAndTarget = f36_local4.unlockProgressAndTarget
				end
			end
		end
		if CoD.CCUtility.customizationMode == Enum.eModes.MODE_MULTIPLAYER and CoD.CCUtility.PersonalizeHeroData.CompletionEpicItemIndex < f36_arg0 then
			local f36_local3 = Engine.GetHeroList( CoD.CCUtility.customizationMode )
			f36_local3 = f36_local3[CoD.CCUtility.Heroes.HeroIndexForEdits + 1].assetName
			local f36_local4 = Engine.GetHeroItemInfo( CoD.CCUtility.customizationMode, f36_local1, f36_local2, f36_arg0 - 1 )
			local f36_local5 = f36_local4.assetName .. ";" .. f36_local3
			if CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( f36_local5 ) then
				return nil
			end
			f36_local0.models.isBMItem = true
			f36_local0.models.isBMClassified = CoD.BlackMarketUtility.IsItemLocked( f35_arg0, f36_local5 )
			f36_local0.models.isBMPurchasable = false
			f36_local0.models.insertTop = false
			local f36_local6 = false
			for f36_local10, f36_local11 in ipairs( CoD.BlackMarketUtility.UniqueSpecialistOutfits ) do
				if f36_local11.body == f36_local5 then
					f36_local0.models.rarityType = {
						rarity = "MPUI_BM_LEGENDARY",
						duplicateCount = 0
					}
					f36_local0.models.insertTop = true
					f36_local6 = true
					if Engine.GetInventoryItemQuantity( f35_arg0, f36_local11.bodyId ) <= 0 then
						f36_local0.models.isBMPurchasable = true
						break
					end
				elseif f36_local11.head == f36_local5 then
					f36_local0.models.rarityType = {
						rarity = "MPUI_BM_LEGENDARY",
						duplicateCount = 0
					}
					f36_local0.models.insertTop = true
					f36_local6 = true
					if Engine.GetInventoryItemQuantity( f35_arg0, f36_local11.headId ) <= 0 then
						f36_local0.models.isBMPurchasable = true
						break
					end
				end
			end
			if f36_local0.models.isBMClassified and not f36_local6 then
				f36_local0.models.name = CoD.BlackMarketUtility.ClassifiedName()
				f36_local0.models.rarityType = {
					rarity = "",
					duplicateCount = 0
				}
			elseif not f36_local6 then
				f36_local0.models.rarityType = {
					rarity = CoD.BlackMarketUtility.GetRarityForLootItemFromName( f36_local5 ),
					duplicateCount = CoD.BlackMarketUtility.GetItemQuantity( f35_arg0, f36_local5 )
				}
			end
		else
			f36_local0.models.rarityType = {
				rarity = "",
				duplicateCount = 0
			}
		end
		return f36_local0
	end
	
	if CoD.CCUtility.Heroes.heroCustomizationTable and CoD.CCUtility.Heroes.selectionTable and CoD.CCUtility.PersonalizeHeroData.EdittingArea and CoD.CCUtility.PersonalizeHeroData.EdittingElement then
		local f35_local3, f35_local4, f35_local5, f35_local6 = nil
		if Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY == CoD.CCUtility.PersonalizeHeroData.EdittingArea then
			f35_local3 = CoD.CCUtility.Heroes.heroCustomizationTable.bodies
			f35_local6 = "bodystyle"
			f35_local4 = CoD.CCUtility.Heroes.selectionTable.selectedBody + 1
			if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
				f35_local5 = CoD.CCUtility.Heroes.selectionTable.bodyColors[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex] + 1
			end
		elseif Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET == CoD.CCUtility.PersonalizeHeroData.EdittingArea then
			f35_local3 = CoD.CCUtility.Heroes.heroCustomizationTable.helmets
			f35_local6 = "helmetstyle"
			f35_local4 = CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1
			if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
				f35_local5 = CoD.CCUtility.Heroes.selectionTable.helmetColors[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex] + 1
			end
		end
		if f35_local3 then
			if CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex then
				local f35_local7 = f35_local3[f35_local4].accents[CoD.CCUtility.PersonalizeHeroData.EdittingAreaItemIndex]
				if f35_local7 then
					for f35_local11, f35_local12 in ipairs( f35_local7 ) do
						table.insert( f35_local0, f35_local2( f35_local11, f35_local12.name, f35_local12.icon, f35_local12.red .. " " .. f35_local12.green .. " " .. f35_local12.blue, f35_local11 == f35_local5 ) )
					end
				end
			else
				for f35_local10, f35_local11 in ipairs( f35_local3 ) do
					if f35_local11.name and CoD.CCUtility.IsBodyOrHelmetAccessible( f35_arg0, f35_local6, f35_local10, #f35_local3 ) then
						local f35_local12 = f35_local2( f35_local10, f35_local11.name, f35_local11.icon, nil, f35_local4 == f35_local10 )
						if f35_local12 ~= nil then
							if f35_local12.models.insertTop then
								table.insert( f35_local0, 1, f35_local12 )
							else
								table.insert( f35_local0, f35_local12 )
							end
						end
					end
				end
			end
		end
	end
	return f35_local0
end

DataSources.HeroChooseOptionButtonList = DataSourceHelpers.ListSetup( "HeroCustomizationOptionList", CoD.CCUtility.HeroOptionsListPrepare, true )
CoD.CCUtility.CharacterCustomizationColorSetListPrepare = function ( f37_arg0 )
	local f37_local0 = {}
	local f37_local1 = function ( f38_arg0, f38_arg1, f38_arg2, f38_arg3 )
		local f38_local0 = CoD.CCUtility.getBasePersonalizationItemModels( f38_arg0, f38_arg1, f38_arg2 or "$white", f38_arg3 or "255 255 255" )
		f38_local0.properties.optionIndex = f38_arg0
		f38_local0.properties.isColorOption = f38_arg3 ~= nil
		return f38_local0
	end
	
	if CoD.CCUtility.Heroes.heroCustomizationTable and CoD.CCUtility.Heroes.selectionTable and CoD.CCUtility.PersonalizeHeroData.EdittingArea and CoD.CCUtility.PersonalizeHeroData.EdittingElement then
		local f37_local2, f37_local3, f37_local4 = nil
		if CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY then
			f37_local2 = CoD.CCUtility.Heroes.heroCustomizationTable.bodies
			f37_local3 = CoD.CCUtility.Heroes.selectionTable.selectedBody + 1
			f37_local4 = CoD.CCUtility.Heroes.selectionTable.bodyColors
		elseif CoD.CCUtility.PersonalizeHeroData.EdittingArea == Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET then
			f37_local2 = CoD.CCUtility.Heroes.heroCustomizationTable.helmets
			f37_local3 = CoD.CCUtility.Heroes.selectionTable.selectedHelmet + 1
			f37_local4 = CoD.CCUtility.Heroes.selectionTable.helmetColors
		end
		if f37_local2 then
			for f37_local8, f37_local9 in ipairs( f37_local2[f37_local3].accents ) do
				local f37_local10 = table.insert( f37_local0, {
					models = {
						colorIndex = f37_local8,
						colorListDatasource = CoD.CCUtility.CreatePersonalizeColorDatasource( f37_arg0, "PersonalizeCharacterColorOptions_" .. f37_local8, f37_local9, function ()
							return {
								colorTableIndex = f37_local8
							}
						end
						 ),
						selectedColor = f37_local4[f37_local8] + 1
					}
				} )
			end
		end
	end
	return f37_local0
end

DataSources.CharacterCustomizationColorSetList = DataSourceHelpers.ListSetup( "CharacterCustomizationColorSetList", CoD.CCUtility.CharacterCustomizationColorSetListPrepare, true )
CoD.CCUtility.PersonalizeHeroData.SetHeroShowcaseWeapon = function ( f40_arg0, f40_arg1, f40_arg2, f40_arg3, f40_arg4, f40_arg5, f40_arg6, f40_arg7 )
	local f40_local0 = CoD.CCUtility.customizationMode
	local f40_local1 = CoD.CCUtility.Heroes.HeroIndexForEdits
	if not f40_arg2 then
		f40_arg2 = ""
	end
	if not f40_arg3 or #f40_arg3 == 0 then
		f40_arg3 = {}
		for f40_local2 = 1, CoD.CCUtility.PersonalizeHeroData.MaxWeaponAttachments, 1 do
			f40_arg3[f40_local2] = 0
		end
	end
	if not f40_arg4 or #f40_arg4 == 0 then
		f40_arg4 = {}
		for f40_local2 = 1, CoD.CCUtility.PersonalizeHeroData.MaxWeaponAttachments, 1 do
			f40_arg4[f40_local2] = 0
		end
	end
	if not f40_arg5 then
		f40_arg5 = 0
	end
	if not f40_arg6 then
		f40_arg6 = Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_SLOT
	end
	if not f40_arg7 then
		f40_arg7 = Enum.CustomizationPaintjobInvalidID.CUSTOMIZATION_INVALID_PAINTJOB_INDEX
	end
	Engine.SetHeroShowcaseWeaponVariantName( f40_arg0, f40_local0, f40_local1, f40_arg2 )
	Engine.SetHeroShowcaseWeaponAttribute( f40_arg0, f40_local0, f40_local1, "weaponIndex", f40_arg1 )
	for f40_local2 = 1, CoD.CCUtility.PersonalizeHeroData.MaxWeaponAttachments, 1 do
		Engine.SetHeroShowcaseWeaponAttribute( f40_arg0, f40_local0, f40_local1, "attachment", f40_arg3[f40_local2], f40_local2 - 1 )
	end
	for f40_local2 = 1, CoD.CCUtility.PersonalizeHeroData.MaxWeaponAttachments, 1 do
		Engine.SetHeroShowcaseWeaponAttribute( f40_arg0, f40_local0, f40_local1, "attachmentVariant", f40_arg4[f40_local2], f40_local2 - 1 )
	end
	Engine.SetHeroShowcaseWeaponAttribute( f40_arg0, f40_local0, f40_local1, "camoIndex", f40_arg5 )
	Engine.SetHeroShowcaseWeaponAttribute( f40_arg0, f40_local0, f40_local1, "paintjobSlot", f40_arg6 )
	Engine.SetHeroShowcaseWeaponAttribute( f40_arg0, f40_local0, f40_local1, "paintjobIndex", f40_arg7 )
end

CoD.CCUtility.PersonalizeHeroData.GetHeroShowcaseWeaponName = function ( f41_arg0, f41_arg1 )
	local f41_local0 = Engine.GetItemRef( f41_arg0 ) .. "_" .. CoD.gameMode:lower()
	for f41_local4, f41_local5 in ipairs( f41_arg1 ) do
		f41_local0 = f41_local0 .. "+" .. Engine.GetAttachmentRef( f41_arg0, f41_local5 )
	end
	return f41_local0
end

CoD.CCUtility.PersonalizeHeroData.GetHeroShowcaseWeaponRenderOptions = function ( f42_arg0, f42_arg1, f42_arg2 )
	return f42_arg0 .. "," .. f42_arg1 .. "," .. f42_arg2
end

CoD.CCUtility.PersonalizeHeroData.IsDualWieldWeapon = function ( f43_arg0, f43_arg1 )
	if Engine.GetItemIndexFromReference( Engine.GetItemRef( f43_arg0 ) .. "_dw", CoD.CCUtility.customizationMode ) == -1 then
		return false
	end
	for f43_local3, f43_local4 in ipairs( f43_arg1 ) do
		if Engine.GetAttachmentRef( f43_arg0, f43_local4 ) == "dw" then
			return true
		end
	end
	return false
end

CoD.CCUtility.PersonalizeHeroData.GetDualWieldVersionOfWeapon = function ( f44_arg0, f44_arg1 )
	return Engine.GetItemIndexFromReference( Engine.GetItemRef( f44_arg1 ) .. "_dw", CoD.CCUtility.customizationMode )
end

CoD.CCUtility.TauntsData.GetGestureXAnim = function ( f45_arg0, f45_arg1, f45_arg2 )
	return f45_arg0["gestureAnim" .. CoD.CCUtility.TauntsData.GestureTypeAWINames[f45_arg1 + 1] .. f45_arg2] or ""
end

CoD.CCUtility.TauntsData.GetGestureDisplayName = function ( f46_arg0, f46_arg1, f46_arg2 )
	return f46_arg0["gestureName" .. CoD.CCUtility.TauntsData.GestureTypeAWINames[f46_arg1 + 1] .. f46_arg2] or ""
end

CoD.CCUtility.TauntsData.GetGestureCount = function ( f47_arg0, f47_arg1 )
	return f47_arg0["gestureCount" .. CoD.CCUtility.TauntsData.GestureTypeAWINames[f47_arg1 + 1]] or 0
end

CoD.CCUtility.TauntsData.GetGestureAnimFromEvent = function ( f48_arg0 )
	local f48_local0 = Engine.GetHeroBundleInfo( f48_arg0.sessionMode, f48_arg0.characterIndex )
	if f48_local0 then
		return CoD.CCUtility.TauntsData.GetGestureXAnim( f48_local0, f48_arg0.gestureType, f48_arg0.gestureIndex )
	else
		return ""
	end
end

CoD.CCUtility.TauntsData.CharacterHasAnyGestures = function ( f49_arg0 )
	for f49_local0 = 0, Enum.CharacterGestureTypes.GESTURE_TYPE_COUNT - 1, 1 do
		if 0 < CoD.CCUtility.TauntsData.GetGestureCount( f49_arg0, f49_local0 ) then
			return true
		end
	end
	return false
end

CoD.CCUtility.GetTauntsAndGesturesNewCount = function ( f50_arg0, f50_arg1, f50_arg2, f50_arg3 )
	local f50_local0 = 0
	if f50_arg1 == LuaUtils.GetBlackjackHeroIndex( f50_arg3 ) then
		return 0
	else
		local f50_local1, f50_local2 = CoD.CCUtility.Heroes.GetHeroUnlockInfo( f50_arg0, f50_arg1, f50_arg3 )
		if f50_local1 then
			return 0
		else
			return f50_local0 + CoD.CCUtility.GetTauntNewCount( f50_arg0, f50_arg1, f50_arg2, f50_arg3 ) + CoD.CCUtility.GetGestureNewCount( f50_arg0, f50_arg1, f50_arg2, f50_arg3 )
		end
	end
end

CoD.CCUtility.GetTauntNewCount = function ( f51_arg0, f51_arg1, f51_arg2, f51_arg3 )
	local f51_local0 = 0
	local f51_local1 = Engine.GetHeroList( f51_arg3 )
	f51_local1 = f51_local1[f51_arg1 + 1].assetName
	for f51_local2 = 0, Enum.CharacterTauntTypes.TAUNT_TYPE_COUNT - 1, 1 do
		for f51_local5 = 0, CoD.CCUtility.TauntsData.GetTauntCount( f51_arg2, f51_local2 ) - 1, 1 do
			if Engine.IsTauntNew( f51_arg0, f51_arg3, f51_arg1, f51_local2, f51_local5, CoD.CCUtility.TauntsData.GetTauntXAnim( f51_arg2, f51_local2, f51_local5 ) ) then
				f51_local0 = f51_local0 + 1
			end
		end
	end
	return f51_local0
end

CoD.CCUtility.GetGestureNewCount = function ( f52_arg0, f52_arg1, f52_arg2, f52_arg3 )
	local f52_local0 = 0
	local f52_local1 = Engine.GetHeroList( f52_arg3 )
	f52_local1 = f52_local1[f52_arg1 + 1].assetName
	for f52_local2 = 0, Enum.CharacterGestureTypes.GESTURE_TYPE_COUNT - 1, 1 do
		for f52_local5 = 0, CoD.CCUtility.TauntsData.GetGestureCount( f52_arg2, f52_local2 ) - 1, 1 do
			local f52_local8 = CoD.CCUtility.TauntsData.GetGestureXAnim( f52_arg2, f52_local2, f52_local5 )
			if f52_local8 ~= "" and Engine.IsGestureNew( f52_arg0, f52_arg3, f52_arg1, f52_local2, f52_local5, f52_local8 .. ";" .. f52_local1 ) then
				f52_local0 = f52_local0 + 1
			end
		end
	end
	return f52_local0
end

CoD.CCUtility.GestureTypeOptionsListCreate = function ( f53_arg0, f53_arg1, f53_arg2 )
	local f53_local0 = "GestureTypeOptions" .. f53_arg1
	DataSources[f53_local0] = DataSourceHelpers.ListSetup( f53_local0, function ( f54_arg0 )
		local f54_local0 = {}
		for f54_local1 = 0, CoD.CCUtility.TauntsData.GetGestureCount( f53_arg0, f53_arg1 ) - 1, 1 do
			local f54_local4 = CoD.CCUtility.TauntsData.GetGestureXAnim( f53_arg0, f53_arg1, f54_local1 )
			local f54_local5 = Engine.GetHeroList( Enum.eModes.MODE_MULTIPLAYER )
			f54_local5 = f54_local5[CoD.CCUtility.Heroes.HeroIndexForEdits + 1].assetName
			local f54_local6 = f54_local4 .. ";" .. f54_local5
			local f54_local7 = false
			if f54_local4 ~= "" and f54_local1 ~= 0 then
				f54_local7 = CoD.BlackMarketUtility.IsItemLocked( f54_arg0, f54_local6 )
			end
			local f54_local8 = CoD.CCUtility.TauntsData.GetGestureDisplayName( f53_arg0, f53_arg1, f54_local1 )
			if f54_local7 then
				f54_local8 = CoD.BlackMarketUtility.ClassifiedName()
			end
			if not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( f54_local6 ) then
				table.insert( f54_local0, {
					models = {
						itemName = f54_local8,
						isBMClassified = f54_local7,
						canPreview = f54_local4 ~= "",
						rarityType = {
							rarity = CoD.BlackMarketUtility.GetRarityForLootItemFromName( f54_local6 ),
							isBMClassified = f54_local7,
							duplicateCount = CoD.BlackMarketUtility.GetItemQuantity( f54_arg0, f54_local6 )
						}
					},
					properties = {
						index = f54_local1,
						xanim = f54_local4,
						heroName = f54_local5,
						gestureType = f53_arg1,
						selectIndex = f54_local1 == f53_arg2
					}
				} )
			end
		end
		table.sort( f54_local0, CoD.BlackMarketUtility.SortUnlocksPropertyIndex )
		return f54_local0
	end, true )
	return f53_local0
end

CoD.CCUtility.GestureTypesListPrepare = function ( f55_arg0 )
	local f55_local0 = {}
	local f55_local1 = Engine.GetHeroBundleInfo( CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits )
	local f55_local2 = function ( f56_arg0, f56_arg1 )
		if CoD.CCUtility.TauntsData.GetGestureCount( f55_local1, f56_arg0 ) > 0 then
			local f56_local0 = Engine.GetSelectedGestureForHero( f55_arg0, CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits, f56_arg0 )
			local f56_local1 = CoD.CCUtility.TauntsData.GetGestureXAnim( f55_local1, f56_arg0, f56_local0 )
			table.insert( f55_local0, {
				models = {
					categoryName = f56_arg1,
					selectedItem = CoD.CCUtility.TauntsData.GetGestureDisplayName( f55_local1, f56_arg0, f56_local0 ),
					optionsDatasource = CoD.CCUtility.GestureTypeOptionsListCreate( f55_local1, f56_arg0, f56_local0 ),
					canPreview = f56_local1 ~= ""
				},
				properties = {
					gestureType = f56_arg0,
					xanim = f56_local1
				}
			} )
		end
	end
	
	f55_local2( Enum.CharacterGestureTypes.GESTURE_TYPE_GOOD_GAME, "HEROES_GESTURES_GOOD_GAME" )
	f55_local2( Enum.CharacterGestureTypes.GESTURE_TYPE_THREATEN, "HEROES_GESTURES_THREATEN" )
	f55_local2( Enum.CharacterGestureTypes.GESTURE_TYPE_BOAST, "HEROES_GESTURES_BOAST" )
	return f55_local0
end

DataSources.GestureTypesList = DataSourceHelpers.ListSetup( "GestureTypesList", CoD.CCUtility.GestureTypesListPrepare, true )
CoD.CCUtility.TauntsData.GetTauntXAnim = function ( f57_arg0, f57_arg1, f57_arg2 )
	return f57_arg0["tauntAnim" .. CoD.CCUtility.TauntsData.TauntTypeAWINames[f57_arg1 + 1] .. f57_arg2] or ""
end

CoD.CCUtility.TauntsData.GetTauntDisplayName = function ( f58_arg0, f58_arg1, f58_arg2 )
	return f58_arg0["tauntName" .. CoD.CCUtility.TauntsData.TauntTypeAWINames[f58_arg1 + 1] .. f58_arg2] or ""
end

CoD.CCUtility.TauntsData.GetTauntCount = function ( f59_arg0, f59_arg1 )
	return f59_arg0["tauntCount" .. CoD.CCUtility.TauntsData.TauntTypeAWINames[f59_arg1 + 1]] or 0
end

CoD.CCUtility.TauntsData.GetTauntAnimFromEvent = function ( f60_arg0 )
	local f60_local0 = Engine.GetHeroBundleInfo( f60_arg0.sessionMode, f60_arg0.characterIndex )
	if f60_local0 then
		return CoD.CCUtility.TauntsData.GetTauntXAnim( f60_local0, f60_arg0.tauntType, f60_arg0.tauntIndex )
	else
		return ""
	end
end

CoD.CCUtility.TauntsData.CharacterHasAnyTaunts = function ( f61_arg0 )
	for f61_local0 = 0, Enum.CharacterTauntTypes.TAUNT_TYPE_COUNT - 1, 1 do
		if 0 < CoD.CCUtility.TauntsData.GetTauntCount( f61_arg0, f61_local0 ) then
			return true
		end
	end
	return false
end

CoD.CCUtility.TauntTypeOptionsListCreate = function ( f62_arg0, f62_arg1, f62_arg2 )
	local f62_local0 = "TauntTypeOptions" .. f62_arg1
	DataSources[f62_local0] = DataSourceHelpers.ListSetup( f62_local0, function ( f63_arg0 )
		local f63_local0 = {}
		for f63_local1 = 0, CoD.CCUtility.TauntsData.GetTauntCount( f62_arg0, f62_arg1 ) - 1, 1 do
			local f63_local4 = CoD.CCUtility.TauntsData.GetTauntXAnim( f62_arg0, f62_arg1, f63_local1 )
			local f63_local5 = false
			if f63_local4 ~= "" and f63_local1 ~= 0 then
				f63_local5 = CoD.BlackMarketUtility.IsItemLocked( f63_arg0, f63_local4 )
			end
			local f63_local6 = CoD.CCUtility.TauntsData.GetTauntDisplayName( f62_arg0, f62_arg1, f63_local1 )
			if f63_local5 then
				f63_local6 = CoD.BlackMarketUtility.ClassifiedName()
			end
			if not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( f63_local4 ) then
				table.insert( f63_local0, {
					models = {
						itemName = f63_local6,
						isBMClassified = f63_local5,
						canPreview = f63_local4 ~= "",
						rarityType = {
							rarity = CoD.BlackMarketUtility.GetRarityForLootItemFromName( f63_local4 ),
							isBMClassified = f63_local5,
							duplicateCount = CoD.BlackMarketUtility.GetItemQuantity( f63_arg0, f63_local4 )
						}
					},
					properties = {
						index = f63_local1,
						xanim = f63_local4,
						tauntType = f62_arg1,
						selectIndex = f63_local1 == f62_arg2
					}
				} )
			end
		end
		table.sort( f63_local0, CoD.BlackMarketUtility.SortUnlocksPropertyIndex )
		return f63_local0
	end, true )
	return f62_local0
end

CoD.CCUtility.TauntTypesListPrepare = function ( f64_arg0 )
	local f64_local0 = {}
	local f64_local1 = Engine.GetHeroBundleInfo( CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits )
	local f64_local2 = function ( f65_arg0, f65_arg1 )
		if CoD.CCUtility.TauntsData.GetTauntCount( f64_local1, f65_arg0 ) > 0 then
			local f65_local0 = Engine.GetSelectedTauntForHero( f64_arg0, CoD.CCUtility.customizationMode, CoD.CCUtility.Heroes.HeroIndexForEdits, f65_arg0 )
			table.insert( f64_local0, {
				models = {
					categoryName = f65_arg1,
					selectedItem = CoD.CCUtility.TauntsData.GetTauntDisplayName( f64_local1, f65_arg0, f65_local0 ),
					optionsDatasource = CoD.CCUtility.TauntTypeOptionsListCreate( f64_local1, f65_arg0, f65_local0 ),
					canPreview = CoD.CCUtility.TauntsData.GetTauntXAnim( f64_local1, f65_arg0, f65_local0 ) ~= ""
				},
				properties = {
					tauntType = f65_arg0,
					xanim = CoD.CCUtility.TauntsData.GetTauntXAnim( f64_local1, f65_arg0, f65_local0 )
				}
			} )
		end
	end
	
	f64_local2( Enum.CharacterTauntTypes.TAUNT_TYPE_FIRST_PLACE, "HEROES_1ST_PLACE_TAUNT" )
	return f64_local0
end

DataSources.TauntTypesList = DataSourceHelpers.ListSetup( "TauntTypesList", CoD.CCUtility.TauntTypesListPrepare, true )
CoD.CCUtility.GetDisplayNameForTaunt = function ( f66_arg0, f66_arg1 )
	for f66_local10, f66_local11 in ipairs( Engine.GetHeroList( f66_arg0 ) ) do
		local f66_local12 = Engine.GetHeroBundleInfo( f66_arg0, f66_local11.bodyIndex )
		for f66_local4, f66_local5 in ipairs( CoD.CCUtility.TauntsData.TauntTypeAWINames ) do
			local f66_local7 = CoD.CCUtility.TauntsData.GetTauntCount( f66_local12, f66_local4 - 1 )
			for f66_local3 = 0, f66_local7 - 1, 1 do
				if CoD.CCUtility.TauntsData.GetTauntXAnim( f66_local12, f66_local4 - 1, f66_local3 ) == f66_arg1 then
					return CoD.CCUtility.TauntsData.GetTauntDisplayName( f66_local12, f66_local4 - 1, f66_local3 )
				end
			end
		end
	end
	return ""
end

CoD.CCUtility.GetHeroDisplayNameAndIndexForTaunt = function ( f67_arg0, f67_arg1 )
	for f67_local10, f67_local11 in ipairs( Engine.GetHeroList( f67_arg0 ) ) do
		local f67_local12 = Engine.GetHeroBundleInfo( f67_arg0, f67_local11.bodyIndex )
		for f67_local4, f67_local5 in ipairs( CoD.CCUtility.TauntsData.TauntTypeAWINames ) do
			local f67_local7 = CoD.CCUtility.TauntsData.GetTauntCount( f67_local12, f67_local4 - 1 )
			for f67_local3 = 0, f67_local7 - 1, 1 do
				if CoD.CCUtility.TauntsData.GetTauntXAnim( f67_local12, f67_local4 - 1, f67_local3 ) == f67_arg1 then
					return f67_local11.displayName, f67_local11.bodyIndex
				end
			end
		end
	end
	return ""
end

CoD.CCUtility.GetTypeIndexAndIndexForTaunt = function ( f68_arg0, f68_arg1 )
	for f68_local10, f68_local11 in ipairs( Engine.GetHeroList( f68_arg0 ) ) do
		local f68_local12 = Engine.GetHeroBundleInfo( f68_arg0, f68_local11.bodyIndex )
		for f68_local4, f68_local5 in ipairs( CoD.CCUtility.TauntsData.TauntTypeAWINames ) do
			local f68_local7 = CoD.CCUtility.TauntsData.GetTauntCount( f68_local12, f68_local4 - 1 )
			for f68_local3 = 0, f68_local7 - 1, 1 do
				if CoD.CCUtility.TauntsData.GetTauntXAnim( f68_local12, f68_local4 - 1, f68_local3 ) == f68_arg1 then
					return f68_local4 - 1, f68_local3
				end
			end
		end
	end
	return nil, nil
end

CoD.CCUtility.GetTypeNameForGesture = function ( f69_arg0, f69_arg1, f69_arg2 )
	for f69_local12, f69_local13 in ipairs( Engine.GetHeroList( f69_arg0 ) ) do
		local f69_local14 = Engine.GetHeroBundleInfo( f69_arg0, f69_local13.bodyIndex )
		if f69_local13.assetName == f69_arg1 then
			for f69_local7, f69_local8 in ipairs( CoD.CCUtility.TauntsData.GestureTypeAWINames ) do
				local f69_local9 = CoD.CCUtility.TauntsData.GetGestureCount( f69_local14, f69_local7 - 1 )
				for f69_local6 = 0, f69_local9 - 1, 1 do
					if CoD.CCUtility.TauntsData.GetGestureXAnim( f69_local14, f69_local7 - 1, f69_local6 ) == f69_arg2 then
						return CoD.CCUtility.TauntsData.GestureTypeDisplayNames[f69_local7]
					end
				end
			end
		end
	end
	return ""
end

CoD.CCUtility.GetTypeIndexAndIndexForGesture = function ( f70_arg0, f70_arg1, f70_arg2 )
	for f70_local12, f70_local13 in ipairs( Engine.GetHeroList( f70_arg0 ) ) do
		local f70_local14 = Engine.GetHeroBundleInfo( f70_arg0, f70_local13.bodyIndex )
		if f70_local13.assetName == f70_arg1 then
			for f70_local7, f70_local8 in ipairs( CoD.CCUtility.TauntsData.GestureTypeAWINames ) do
				local f70_local9 = CoD.CCUtility.TauntsData.GetGestureCount( f70_local14, f70_local7 - 1 )
				for f70_local6 = 0, f70_local9 - 1, 1 do
					if CoD.CCUtility.TauntsData.GetGestureXAnim( f70_local14, f70_local7 - 1, f70_local6 ) == f70_arg2 then
						return f70_local7 - 1, f70_local6
					end
				end
			end
		end
	end
	return nil, nil
end

CoD.CCUtility.GetDisplayNameForGesture = function ( f71_arg0, f71_arg1, f71_arg2 )
	for f71_local12, f71_local13 in ipairs( Engine.GetHeroList( f71_arg0 ) ) do
		local f71_local14 = Engine.GetHeroBundleInfo( f71_arg0, f71_local13.bodyIndex )
		if f71_local13.assetName == f71_arg1 then
			for f71_local7, f71_local8 in ipairs( CoD.CCUtility.TauntsData.GestureTypeAWINames ) do
				local f71_local9 = CoD.CCUtility.TauntsData.GetGestureCount( f71_local14, f71_local7 - 1 )
				for f71_local6 = 0, f71_local9 - 1, 1 do
					if CoD.CCUtility.TauntsData.GetGestureXAnim( f71_local14, f71_local7 - 1, f71_local6 ) == f71_arg2 then
						return CoD.CCUtility.TauntsData.GetGestureDisplayName( f71_local14, f71_local7 - 1, f71_local6 )
					end
				end
			end
		end
	end
	return ""
end

CoD.CCUtility.GetHeroDisplayNameAndIndex = function ( f72_arg0, f72_arg1 )
	for f72_local3, f72_local4 in ipairs( Engine.GetHeroList( f72_arg0 ) ) do
		local f72_local5 = Engine.GetHeroBundleInfo( f72_arg0, f72_local4.bodyIndex )
		if f72_local4.assetName == f72_arg1 then
			return f72_local4.displayName, f72_local4.bodyIndex
		end
	end
	return ""
end

CoD.CCUtility.Heroes.GetHeroUnlockInfo = function ( f73_arg0, f73_arg1, f73_arg2, f73_arg3 )
	local f73_local0 = ""
	local f73_local1 = true
	for f73_local2 = Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_FIRST, Enum.heroLoadoutTypes_e.HERO_LOADOUT_TYPE_COUNT - 1, 1 do
		local f73_local5 = Engine.GetLoadoutItemIndexForHero( f73_arg2 or CoD.CCUtility.customizationMode, f73_arg1, f73_local2 )
		if IsLive() and IsFirstTimeSetup( f73_arg0, Enum.eModes.MODE_MULTIPLAYER ) then
			if f73_local1 then
				f73_local1 = Engine.IsItemLocked( f73_arg0, f73_local5, Enum.eModes.MODE_MULTIPLAYER )
			end
		end
		if IsProgressionEnabled( f73_arg0 ) then
			if f73_local1 then
				if not CoD.PrestigeUtility.isInPermanentUnlockMenu then
					f73_local1 = Engine.IsItemLocked( f73_arg0, f73_local5, f73_arg2 or CoD.CCUtility.customizationMode )
				else
					f73_local1 = false
				end
			end
			f73_local0 = CoD.GetUnlockRankAndLevelForItemIndex( f73_arg0, f73_local5, f73_arg3 or "MENU_UNLOCKED_AT", f73_arg2 or CoD.CCUtility.customizationMode )
		end
	end
	if not IsProgressionEnabled( f73_arg0 ) then
		f73_local1 = false
	end
	return f73_local1, f73_local0
end

CoD.CCUtility.Heroes.GetPersonalizationNewCount = function ( f74_arg0, f74_arg1 )
	local f74_local0 = CoD.CCUtility.customizationMode
	local f74_local1 = 0
	if f74_arg1 then
		local f74_local2 = Engine.GetHeroBundleInfo( f74_local0, f74_arg1 )
		for f74_local3 = 0, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_COUNT - 1, 1 do
			local f74_local6 = Engine.CharacterCustomizationNewItemCount( f74_arg0, f74_arg1, f74_local3, f74_local0 )
			f74_local1 = f74_local1 + f74_local6.total
		end
		f74_local1 = f74_local1 + CoD.CCUtility.GetTauntsAndGesturesNewCount( f74_arg0, f74_arg1, f74_local2, f74_local0 )
	end
	return f74_local1
end

CoD.CCUtility.GetHeroModels = function ( f75_arg0, f75_arg1, f75_arg2, f75_arg3 )
	local f75_local0 = Engine.GetEquippedInfoForHero( f75_arg2, CoD.CCUtility.customizationMode, f75_arg0.bodyIndex )
	local f75_local1 = Engine.GetHeroCustomizationTable( CoD.CCUtility.customizationMode, f75_arg0.bodyIndex )
	local f75_local2, f75_local3 = CoD.CCUtility.Heroes.GetHeroUnlockInfo( f75_arg2, f75_arg0.bodyIndex )
	local f75_local4 = CoD.CCUtility.Heroes.HeroIndexForEdits
	if not f75_local4 then
		f75_local4 = Engine.GetEquippedHero( f75_arg2, CoD.CCUtility.customizationMode )
	end
	local f75_local5 = Engine.GetHeroBundleInfo( CoD.CCUtility.customizationMode, f75_arg0.bodyIndex ) or {}
	local f75_local6 = {
		models = {
			backgroundWithCharacter = f75_arg0.backgroundWithCharacter or "blacktransparent",
			lockedBackgroundWithCharacter = f75_arg0.background,
			name = f75_arg0.displayName,
			unlockDescription = f75_local3,
			level = 1,
			unlockedCharacterSliver = f75_arg0.frozenMomentRender or "blacktransparent",
			lockedCharacterSliver = f75_local5.lockedSliverRender or "blacktransparent",
			disabled = f75_arg0.disabled or f75_local2,
			equippedSlot = Engine.GetLoadoutTypeForHero( f75_arg2, f75_arg0.bodyIndex ),
			selectedHeadInfo = CoD.CCUtility.CreateSelectedItemModel( f75_arg2, f75_local1, f75_local0, f75_arg0.bodyIndex, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_HELMET ),
			selectedBodyInfo = CoD.CCUtility.CreateSelectedItemModel( f75_arg2, f75_local1, f75_local0, f75_arg0.bodyIndex, Enum.CharacterItemType.CHARACTER_ITEM_TYPE_BODY ),
			selectedShowcaseWeaponInfo = nil,
			selectedTauntInfo = nil,
			itemType = Enum.VoteItemType.VOTE_ITEM_TYPE_ITEM,
			heroIndex = f75_arg0.bodyIndex,
			breadcrumbCount = CoD.CCUtility.Heroes.GetPersonalizationNewCount( f75_arg2, f75_arg0.bodyIndex )
		},
		properties = {
			heroIndex = f75_arg0.bodyIndex,
			selectIndex = f75_arg0.bodyIndex == f75_local4
		}
	}
	if CoDShared.IsLootHero( f75_arg0 ) then
		local f75_local7 = function ( f76_arg0, f76_arg1 )
			if f76_arg0:exists() then
				return tonumber( f76_arg0:get() )
			else
				return f76_arg1
			end
		end
		
		f75_local6.models.contractsRemaining = 0
		f75_local6.models.isActivated = false
		f75_local6.models.activeTimeRemaining = 0
		local f75_local8 = Dvar.ui_enableAllHeroes:get()
		if f75_local8 then
			local f75_local9 = f75_local6.models
			local f75_local10 = f75_local7
			local f75_local11 = Dvar.ui_blackjack_contracts
			local f75_local12
			if f75_local8 then
				f75_local12 = 1
				if not f75_local12 then
				
				else
					f75_local9.contractsRemaining = f75_local10( f75_local11, f75_local12 )
					f75_local6.models.isActivated = f75_local7( Dvar.ui_blackjack_active, 1 ) == 1
					f75_local6.models.activeTimeRemaining = f75_local7( Dvar.ui_blackjack_remainingTime, 29754 )
				end
			end
			f75_local12 = 0
		else
			local f75_local9 = Engine.StorageGetBuffer( f75_arg2, Enum.StorageFileType.STORAGE_MP_STATS_ONLINE )
			if f75_local9 and f75_local9.TenthSpecialistContract then
				f75_local6.models.contractsRemaining = f75_local9.blackjack_contract_count:get()
			end
			local f75_local10 = Engine.ConsumableGet( f75_arg2, "blackjack", "awarded" ) - Engine.ConsumableGet( f75_arg2, "blackjack", "consumed" )
			f75_local6.models.isActivated = f75_local10 > 0
			f75_local6.models.activeTimeRemaining = f75_local10 * 1000
		end
		f75_local6.models.breadcrumbCount = 0
		f75_local6.properties.customWidgetOverride = CoD.ChooseContractCharacterLoadoutCarouselItem
	end
	if not f75_local6.models.disabled then
		f75_local6.models.loadoutDatasource = CoD.CCUtility.CreateCarouselItemLoadoutDatasource( f75_local6, CoD.CCUtility.customizationMode, f75_arg2 )
		f75_local6.models.cardBackDatasource = CoD.CCUtility.CreateCarouselCardBackDatasource( f75_local6, f75_arg0, CoD.CCUtility.customizationMode, f75_arg2, f75_local5, f75_arg3 )
		f75_local6.models.newTransmissions = CoD.CCUtility.GetTransmissionNewCount( f75_arg2, f75_arg0.bodyIndex, f75_local5 )
	end
	return f75_local6
end

CoD.CCUtility.HeroesListPrepare = function ( f77_arg0 )
	local f77_local0 = Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "autoevents" ), "cycled" )
	local f77_local1 = Engine.GetHeroList( CoD.CCUtility.customizationMode )
	local f77_local2 = {}
	local f77_local3 = Enum.CharacterGenderTypes.CHARACTER_GENDER_TYPE_ANY
	if CoD.CCUtility.customizationMode == Enum.eModes.MODE_CAMPAIGN then
		f77_local3 = Engine.GetEquippedGender( f77_arg0, Enum.eModes.MODE_CAMPAIGN )
	end
	local f77_local4 = CoD.CCUtility.CompletionEpicComplete( f77_arg0, f77_local1 )
	local f77_local5 = 0
	for f77_local11, f77_local12 in ipairs( f77_local1 ) do
		if f77_local3 == Enum.CharacterGenderTypes.CHARACTER_GENDER_TYPE_ANY or f77_local12.gender == f77_local3 then
			local f77_local9 = false
			if CoDShared.IsLootHero( f77_local12 ) then
				f77_local9 = not AllowLootHero( f77_arg0 )
			end
			if not f77_local9 then
				local f77_local10 = CoD.CCUtility.GetHeroModels( f77_local12, f77_local11, f77_arg0, f77_local4 )
				if CoDShared.IsLootHero( f77_local12 ) then
					table.insert( f77_local2, 1, f77_local10 )
					f77_local10.shouldIgnoreWhenCounting = true
					f77_local5 = f77_local5 + 1
				else
					table.insert( f77_local2, f77_local10 )
				end
			end
		end
	end
	if CoD.isPC then
		for f77_local11, f77_local12 in ipairs( f77_local2 ) do
			f77_local12.properties.carouselPos = f77_local11
		end
	end
	f77_local6 = 1
	for f77_local12, f77_local9 in ipairs( f77_local2 ) do
		if not f77_local9.shouldIgnoreWhenCounting then
			f77_local9.models.count = Engine.Localize( "MENU_X_OF_Y", f77_local6, #f77_local2 - f77_local5 )
			f77_local6 = f77_local6 + 1
		end
	end
	return f77_local2
end

DataSources.HeroesList = DataSourceHelpers.ListSetup( "HeroesList", CoD.CCUtility.HeroesListPrepare, true )
CoD.CCUtility.GenderListPrepare = function ( f78_arg0 )
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
end

DataSources.GendersList = DataSourceHelpers.ListSetup( "GendersList", CoD.CCUtility.GenderListPrepare, true )
CoD.CCUtility.HeadListPrepare = function ( f79_arg0 )
	local f79_local0 = CoD.CCUtility.customizationMode
	local f79_local1 = Engine.GetHeadList( f79_local0, Engine.GetEquippedGender( f79_arg0, f79_local0 ) )
	local f79_local2 = {}
	for f79_local6, f79_local7 in ipairs( f79_local1 ) do
		table.insert( f79_local2, {
			models = {
				name = f79_local7.displayName,
				headExtraCamInfo = "" .. CoD.CCUtility.customizationMode .. ";" .. f79_local7.headIndex .. ";" .. f79_arg0
			},
			properties = {
				headIndex = f79_local7.headIndex
			}
		} )
	end
	return f79_local2
end

DataSources.HeroFaceButtonList = DataSourceHelpers.ListSetup( "HeroFaceButtonList", CoD.CCUtility.HeadListPrepare, true )
