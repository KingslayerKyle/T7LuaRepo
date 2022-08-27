-- b60ab737c4c0e4cf1376201df421eddd
-- This hash is used for caching, delete to decompile the file again

require( "ui_mp.T6.GameOptions" )

CoD.GameSettingsUtility = {}
CoD.GameSettingsUtility.GetRestrictionOptions = function ()
	return {
		{
			option = "MENU_BAN_PROTECT",
			desc = "MENU_ITEM_BAN_PROTECT_DESC",
			value = Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_NONE,
			default = true
		},
		{
			option = "MENU_RESTRICTED",
			desc = "MENU_ITEM_RESTRICTED_DESC",
			value = Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_RESTRICTED
		},
		{
			option = "MENU_BAN_ONLY",
			desc = "MENU_ITEM_BAN_ONLY_DESC",
			value = Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_BANONLY
		},
		{
			option = "MENU_PROTECTED",
			desc = "MENU_ITEM_PROTECTED_DESC",
			value = Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_PROTECTED
		}
	}
end

CoD.GameSettingsUtility.GetGroupRestrictionOptions = function ()
	return {
		{
			option = "MENU_CUSTOM",
			desc = "",
			value = nil
		},
		{
			option = "MENU_BAN_PROTECT",
			desc = "MENU_ITEM_BAN_PROTECT_DESC",
			value = Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_NONE,
			default = true
		},
		{
			option = "MENU_RESTRICTED",
			desc = "MENU_ITEM_RESTRICTED_DESC",
			value = Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_RESTRICTED
		},
		{
			option = "MENU_BAN_ONLY",
			desc = "MENU_ITEM_BAN_ONLY_DESC",
			value = Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_BANONLY
		},
		{
			option = "MENU_PROTECTED",
			desc = "MENU_ITEM_PROTECTED_DESC",
			value = Enum.ItemRestrictionState.ITEM_RESTRICTION_STATE_PROTECTED
		}
	}
end

CoD.GameSettingsUtility.MaxSplitscreenBots = 12
CoD.GameSettingsUtility.GetMaxBotsCount = function ()
	if Engine.GetLobbyLocalClientCount( Enum.LobbyType.LOBBY_TYPE_PRIVATE ) > 1 then
		return CoD.GameSettingsUtility.MaxSplitscreenBots
	else
		return LuaEnums.MAX_CLIENTS
	end
end

CoD.GameSettingsUtility.UpdateBreadCrumbNodes = function ( f4_arg0 )
	local f4_local0 = CoD.GameSettingsUtility[f4_arg0]
	if f4_local0 == nil then
		return true
	end
	local f4_local1 = f4_local0.children
	local f4_local2 = true
	for f4_local6, f4_local7 in ipairs( f4_local1 ) do
		f4_local2 = CoD.GameSettingsUtility.UpdateBreadCrumbNodes( f4_local7 )
		if not f4_local2 then
			break
		end
	end
	if f4_local0.defaultFunc then
		f4_local0.default = f4_local0.defaultFunc()
		return f4_local0.default
	end
	f4_local3, f4_local4 = nil
	if f4_local2 and f4_local0.settingsFunction then
		for f4_local10, f4_local9 in ipairs( f4_local0.settingsFunction() ) do
			local f4_local11 = CoD.GameOptions.GameSettings[f4_local9]
			if f4_local11 then
				f4_local9 = f4_local11.setting or f4_local9
			end
			f4_local2 = Engine.GetGametypeSetting( f4_local9 ) == Engine.GetGametypeSetting( f4_local9, true )
			if not f4_local2 then
				break
			end
		end
	end
	f4_local0.default = f4_local2
	return f4_local2
end

CoD.GameSettingsUtility.GameSettings_Main = {
	parent = nil,
	default = true,
	settingsFunction = function ()
		return {}
	end,
	children = {
		"GameSettings_GameModeRules",
		"GameSettings_GlobalSettings"
	}
}
CoD.GameSettingsUtility.GameSettings_GameModeRules = {
	parent = "GameSettings_Main",
	default = true,
	settingsFunction = function ()
		local f6_local0 = CoD.GameOptions.TopLevelGametypeSettings[Dvar.ui_gametype:get()]
		local f6_local1 = CoD.GameOptions.GlobalTopLevelGametypeSettings
		local f6_local2 = {}
		for f6_local6, f6_local7 in ipairs( f6_local0 ) do
			f6_local2[#f6_local2 + 1] = CoD.GameOptions.GameSettings[f6_local7].setting or f6_local7
		end
		for f6_local6, f6_local7 in ipairs( f6_local1 ) do
			f6_local2[#f6_local2 + 1] = CoD.GameOptions.GameSettings[f6_local7].setting or f6_local7
		end
		return f6_local2
	end,
	children = {
		"GameSettings_EditModeSpecificOptions",
		"GameSettings_GeneralSettings",
		"GameSettings_SpawnSettings",
		"GameSettings_HealthAndDamageSettings",
		"GameSettings_Competitive",
		"GameSettings_CreateAClassSettings"
	}
}
CoD.GameSettingsUtility.GameSettings_GlobalSettings = {
	parent = "GameSettings_Main",
	default = true,
	settingsFunction = function ()
		return CoD.GameOptions.GlobalSettings
	end,
	children = {}
}
CoD.GameSettingsUtility.GameSettings_EditModeSpecificOptions = {
	parent = "GameSettings_GameModeRules",
	default = true,
	settingsFunction = function ()
		return CoD.GameOptions.SubLevelGametypeSettings[Dvar.ui_gametype:get()]
	end,
	children = {}
}
CoD.GameSettingsUtility.GameSettings_GeneralSettings = {
	parent = "GameSettings_GameModeRules",
	default = true,
	settingsFunction = function ()
		return CoD.GameOptions.GeneralSettings
	end,
	children = {}
}
CoD.GameSettingsUtility.GameSettings_SpawnSettings = {
	parent = "GameSettings_GameModeRules",
	default = true,
	settingsFunction = function ()
		return CoD.GameOptions.SpawnSettings
	end,
	children = {}
}
CoD.GameSettingsUtility.GameSettings_HealthAndDamageSettings = {
	parent = "GameSettings_GameModeRules",
	default = true,
	settingsFunction = function ()
		return CoD.GameOptions.HealthAndDamageSettings
	end,
	children = {}
}
CoD.GameSettingsUtility.GameSettings_Competitive = {
	parent = "GameSettings_GameModeRules",
	default = true,
	settingsFunction = function ()
		return {}
	end,
	children = {
		"GameSettings_CompetitiveSettings",
		"GameSettings_CompetitiveAdvancedSettings"
	}
}
CoD.GameSettingsUtility.GameSettings_CompetitiveSettings = {
	parent = "GameSettings_Competitive",
	default = true,
	settingsFunction = function ()
		return {
			"pregameItemVoteEnabled",
			"pregameDraftEnabled"
		}
	end,
	children = {
		"Competitive_Settings_Weapons",
		"Competitive_Settings_Attachments",
		"Competitive_Settings_Perks",
		"Competitive_Settings_Equipment",
		"Competitive_Settings_Wildcards",
		"Competitive_Settings_Specialists",
		"Competitive_Settings_Scorestreaks"
	}
}
CoD.GameSettingsUtility.Competitive_Settings_Weapons = {
	parent = "GameSettings_GameModeRules",
	default = true,
	defaultFunc = function ()
		for f14_local0 = 0, 255, 1 do
			local f14_local3 = CoD.statsTable
			if f14_local3 then
				f14_local3 = CoD.CACUtility.GetIdForItemRef( f14_local0 )
			end
			if Engine.ItemIndexValid( f14_local0 ) and not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( f14_local3 ) then
				local f14_local4 = Engine.GetUnlockableInfoByIndex( f14_local0 )
				if 0 <= f14_local4.allocation and (f14_local4.loadoutSlot == "primary" or f14_local4.loadoutSlot == "secondary") and Engine.GetItemRestrictionState( f14_local0 ) ~= Engine.GetItemRestrictionState( f14_local0, true ) then
					return false
				end
			end
		end
		return true
	end,
	children = {}
}
CoD.GameSettingsUtility.Competitive_Settings_Weapons_SMG = {
	parent = "Competitive_Settings_Weapons",
	default = true,
	defaultFunc = function ()
		for f15_local0 = 0, 255, 1 do
			local f15_local3 = CoD.statsTable
			if f15_local3 then
				f15_local3 = CoD.CACUtility.GetIdForItemRef( f15_local0 )
			end
			if Engine.ItemIndexValid( f15_local0 ) and not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( f15_local3 ) then
				local f15_local4 = Engine.GetUnlockableInfoByIndex( f15_local0 )
				if 0 <= f15_local4.allocation and f15_local4.loadoutSlot == "primary" and f15_local4.groupIndex == Enum.itemGroup_t.ITEMGROUP_SMG and Engine.GetItemRestrictionState( f15_local0 ) ~= Engine.GetItemRestrictionState( f15_local0, true ) then
					return false
				end
			end
		end
		return true
	end,
	children = {}
}
CoD.GameSettingsUtility.Competitive_Settings_Weapons_AR = {
	parent = "Competitive_Settings_Weapons",
	default = true,
	defaultFunc = function ()
		for f16_local0 = 0, 255, 1 do
			local f16_local3 = CoD.statsTable
			if f16_local3 then
				f16_local3 = CoD.CACUtility.GetIdForItemRef( f16_local0 )
			end
			if Engine.ItemIndexValid( f16_local0 ) and not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( f16_local3 ) then
				local f16_local4 = Engine.GetUnlockableInfoByIndex( f16_local0 )
				if 0 <= f16_local4.allocation and f16_local4.loadoutSlot == "primary" and f16_local4.groupIndex == Enum.itemGroup_t.ITEMGROUP_ASSAULT and Engine.GetItemRestrictionState( f16_local0 ) ~= Engine.GetItemRestrictionState( f16_local0, true ) then
					return false
				end
			end
		end
		return true
	end,
	children = {}
}
CoD.GameSettingsUtility.Competitive_Settings_Weapons_CQB = {
	parent = "Competitive_Settings_Weapons",
	default = true,
	defaultFunc = function ()
		for f17_local0 = 0, 255, 1 do
			local f17_local3 = CoD.statsTable
			if f17_local3 then
				f17_local3 = CoD.CACUtility.GetIdForItemRef( f17_local0 )
			end
			if Engine.ItemIndexValid( f17_local0 ) and not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( f17_local3 ) then
				local f17_local4 = Engine.GetUnlockableInfoByIndex( f17_local0 )
				if 0 <= f17_local4.allocation and f17_local4.loadoutSlot == "primary" and f17_local4.groupIndex == Enum.itemGroup_t.ITEMGROUP_CQB and Engine.GetItemRestrictionState( f17_local0 ) ~= Engine.GetItemRestrictionState( f17_local0, true ) then
					return false
				end
			end
		end
		return true
	end,
	children = {}
}
CoD.GameSettingsUtility.Competitive_Settings_Weapons_LMG = {
	parent = "Competitive_Settings_Weapons",
	default = true,
	defaultFunc = function ()
		for f18_local0 = 0, 255, 1 do
			local f18_local3 = CoD.statsTable
			if f18_local3 then
				f18_local3 = CoD.CACUtility.GetIdForItemRef( f18_local0 )
			end
			if Engine.ItemIndexValid( f18_local0 ) and not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( f18_local3 ) then
				local f18_local4 = Engine.GetUnlockableInfoByIndex( f18_local0 )
				if 0 <= f18_local4.allocation and f18_local4.loadoutSlot == "primary" and f18_local4.groupIndex == Enum.itemGroup_t.ITEMGROUP_LMG and Engine.GetItemRestrictionState( f18_local0 ) ~= Engine.GetItemRestrictionState( f18_local0, true ) then
					return false
				end
			end
		end
		return true
	end,
	children = {}
}
CoD.GameSettingsUtility.Competitive_Settings_Weapons_SNIPER = {
	parent = "Competitive_Settings_Weapons",
	default = true,
	defaultFunc = function ()
		for f19_local0 = 0, 255, 1 do
			local f19_local3 = CoD.statsTable
			if f19_local3 then
				f19_local3 = CoD.CACUtility.GetIdForItemRef( f19_local0 )
			end
			if Engine.ItemIndexValid( f19_local0 ) and not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( f19_local3 ) then
				local f19_local4 = Engine.GetUnlockableInfoByIndex( f19_local0 )
				if 0 <= f19_local4.allocation and f19_local4.loadoutSlot == "primary" and f19_local4.groupIndex == Enum.itemGroup_t.ITEMGROUP_SNIPER and Engine.GetItemRestrictionState( f19_local0 ) ~= Engine.GetItemRestrictionState( f19_local0, true ) then
					return false
				end
			end
		end
		return true
	end,
	children = {}
}
CoD.GameSettingsUtility.Competitive_Settings_Weapons_SECONDARY = {
	parent = "Competitive_Settings_Weapons",
	default = true,
	defaultFunc = function ()
		for f20_local0 = 0, 255, 1 do
			local f20_local3 = CoD.statsTable
			if f20_local3 then
				f20_local3 = CoD.CACUtility.GetIdForItemRef( f20_local0 )
			end
			if Engine.ItemIndexValid( f20_local0 ) and not CoD.BlackMarketUtility.IsUnreleasedBlackMarketItem( f20_local3 ) then
				local f20_local4 = Engine.GetUnlockableInfoByIndex( f20_local0 )
				if 0 <= f20_local4.allocation and f20_local4.loadoutSlot == "secondary" and Engine.GetItemRestrictionState( f20_local0 ) ~= Engine.GetItemRestrictionState( f20_local0, true ) then
					return false
				end
			end
		end
		return true
	end,
	children = {}
}
CoD.GameSettingsUtility.Competitive_Settings_Attachments = {
	parent = "GameSettings_GameModeRules",
	default = true,
	defaultFunc = function ()
		return not Engine.AnyAttachmentRestrictionStateChanged()
	end,
	children = {}
}
CoD.GameSettingsUtility.Competitive_Settings_Perks = {
	parent = "GameSettings_GameModeRules",
	default = true,
	defaultFunc = function ()
		for f22_local0 = 0, 255, 1 do
			if Engine.ItemIndexValid( f22_local0 ) then
				local f22_local3 = Engine.GetUnlockableInfoByIndex( f22_local0 )
				if 0 <= f22_local3.allocation and LUI.startswith( f22_local3.loadoutSlot, "specialty" ) and Engine.GetItemRestrictionState( f22_local0 ) ~= Engine.GetItemRestrictionState( f22_local0, true ) then
					return false
				end
			end
		end
		return true
	end,
	children = {}
}
CoD.GameSettingsUtility.Competitive_Settings_Equipment = {
	parent = "GameSettings_GameModeRules",
	default = true,
	defaultFunc = function ()
		for f23_local0 = 0, 255, 1 do
			if Engine.ItemIndexValid( f23_local0 ) then
				local f23_local3 = Engine.GetUnlockableInfoByIndex( f23_local0 )
				if 0 <= f23_local3.allocation and (f23_local3.loadoutSlot == "primarygadget" or f23_local3.loadoutSlot == "secondarygadget") and Engine.GetItemRestrictionState( f23_local0 ) ~= Engine.GetItemRestrictionState( f23_local0, true ) then
					return false
				end
			end
		end
		return true
	end,
	children = {}
}
CoD.GameSettingsUtility.Competitive_Settings_Wildcards = {
	parent = "GameSettings_GameModeRules",
	default = true,
	defaultFunc = function ()
		for f24_local0 = 0, 255, 1 do
			if Engine.ItemIndexValid( f24_local0 ) then
				local f24_local3 = Engine.GetUnlockableInfoByIndex( f24_local0 )
				if 0 <= f24_local3.allocation and LUI.startswith( f24_local3.loadoutSlot, "bonuscard" ) and Engine.GetItemRestrictionState( f24_local0 ) ~= Engine.GetItemRestrictionState( f24_local0, true ) then
					return false
				end
			end
		end
		return true
	end,
	children = {}
}
CoD.GameSettingsUtility.Competitive_Settings_Specialists = {
	parent = "GameSettings_GameModeRules",
	default = true,
	defaultFunc = function ()
		for f25_local0 = 0, 255, 1 do
			if Engine.ItemIndexValid( f25_local0 ) then
				local f25_local3 = Engine.GetUnlockableInfoByIndex( f25_local0 )
				if 0 <= f25_local3.allocation and (LuaUtils.StartsWith( f25_local3.loadoutSlot, "hero" ) or f25_local3.loadoutSlot == "specialgadget") and Engine.GetItemRestrictionState( f25_local0 ) ~= Engine.GetItemRestrictionState( f25_local0, true ) then
					return false
				end
			end
		end
		return true
	end,
	children = {}
}
CoD.GameSettingsUtility.Competitive_Settings_Scorestreaks = {
	parent = "GameSettings_GameModeRules",
	default = true,
	defaultFunc = function ()
		for f26_local0 = 0, 255, 1 do
			if Engine.ItemIndexValid( f26_local0 ) then
				local f26_local3 = Engine.GetUnlockableInfoByIndex( f26_local0 )
				if 0 <= f26_local3.allocation and LuaUtils.StartsWith( f26_local3.loadoutSlot, "killstreak" ) and Engine.GetItemRestrictionState( f26_local0 ) ~= Engine.GetItemRestrictionState( f26_local0, true ) then
					return false
				end
			end
		end
		return true
	end,
	children = {}
}
CoD.GameSettingsUtility.GameSettings_CompetitiveAdvancedSettings = {
	parent = "GameSettings_Competitive",
	default = true,
	settingsFunction = function ()
		return {
			"pregamePreStageTime",
			"pregamePostRoundTime",
			"pregamePostStageTime",
			"pregameAlwaysShowCACEdit",
			"pregameAlwaysShowStreakEdit",
			"pregamePositionSortType",
			"pregamePositionShuffleMethod"
		}
	end,
	children = {}
}
CoD.GameSettingsUtility.GameSettings_CreateAClassSettings = {
	parent = "GameSettings_GameModeRules",
	default = true,
	settingsFunction = function ()
		return {
			"disableCAC",
			"maxAllocation",
			"presetClassesPerTeam"
		}
	end,
	children = {}
}
CoD.OptionsUtility = {}
CoD.OptionsUtility.ItemSelectedFunction = function ( f29_arg0, f29_arg1, f29_arg2, f29_arg3, f29_arg4 )
	if f29_arg3 then
		Engine.SetProfileVar( f29_arg2, f29_arg3, f29_arg1.value )
	end
end

CoD.OptionsUtility.GetCustomProfileSelection = function ( f30_arg0, f30_arg1, f30_arg2 )
	for f30_local3, f30_local4 in ipairs( f30_arg1 ) do
		if f30_arg1[f30_local3].value == f30_arg2 then
			return f30_local3
		end
	end
end

CoD.OptionsUtility.GetProfileSelection = function ( f31_arg0, f31_arg1, f31_arg2 )
	return CoD.OptionsUtility.GetCustomProfileSelection( f31_arg0, f31_arg1, tonumber( Engine.ProfileValueAsString( f31_arg0, f31_arg2 ) ) )
end

CoD.OptionsUtility.CreateOptionDataSource = function ( f32_arg0, f32_arg1, f32_arg2, f32_arg3 )
	DataSources[f32_arg1] = DataSourceHelpers.ListSetup( f32_arg1, function ( f33_arg0 )
		local f33_local0 = {}
		for f33_local9, f33_local10 in ipairs( f32_arg2 ) do
			local f33_local11 = {
				models = {
					text = f33_local10.name
				},
				properties = {
					value = f33_local10.value,
					actionParam = f32_arg3,
					action = CoD.OptionsUtility.ItemSelectedFunction,
					loopEdges = #f32_arg2 <= 2
				}
			}
			if f33_local10.customModels then
				for f33_local7, f33_local8 in pairs( f33_local10.customModels ) do
					f33_local11.models[f33_local7] = f33_local8
				end
			end
			table.insert( f33_local0, f33_local11 )
		end
		f33_local0[1].properties.first = true
		f33_local0[#f32_arg2].properties.last = true
		return f33_local0
	end, true )
	return f32_arg1
end

CoD.OptionsUtility.CustomItemSelectedFunction = function ( f34_arg0, f34_arg1, f34_arg2, f34_arg3, f34_arg4 )
	if f34_arg3 then
		Engine.SetProfileVar( f34_arg2, f34_arg3, f34_arg1.value )
	end
	f34_arg1.valueChangedCallback( f34_arg1.value, f34_arg2 )
end

CoD.OptionsUtility.CreateCustomOptionDataSource = function ( f35_arg0, f35_arg1, f35_arg2, f35_arg3, f35_arg4, f35_arg5, f35_arg6 )
	DataSources[f35_arg1] = DataSourceHelpers.ListSetup( f35_arg1, function ( f36_arg0 )
		local f36_local0 = {}
		if not f35_arg5 then
			f35_arg5 = CoD.OptionsUtility.CustomItemSelectedFunction
		end
		for f36_local4, f36_local5 in ipairs( f35_arg2 ) do
			table.insert( f36_local0, {
				models = {
					text = f35_arg2[f36_local4].name
				},
				properties = {
					value = f35_arg2[f36_local4].value,
					options = f35_arg2,
					actionParam = f35_arg3,
					action = f35_arg5,
					valueChangedCallback = f35_arg4,
					revertAction = f35_arg6
				}
			} )
		end
		f36_local0[1].properties.first = true
		f36_local0[#f35_arg2].properties.last = true
		return f36_local0
	end, true )
	return f35_arg1
end

CoD.OptionsUtility.GametypeSettingsItemSelectedFunction = function ( f37_arg0, f37_arg1, f37_arg2, f37_arg3, f37_arg4 )
	local f37_local0 = f37_arg3
	local f37_local1 = Engine.GetGametypeSetting( f37_local0, false )
	UpdateInfoModels( f37_arg1 )
	if f37_arg1.value == f37_local1 then
		return 
	elseif f37_local0 == "hardcoreMode" then
		CoD.GameOptions.HardcoreSettingChanged( f37_arg1.value, f37_arg2 )
	end
	print( "Setting GametypeSetting: " .. f37_arg3 .. " to: " .. f37_arg1.value )
	Engine.SetGametypeSetting( f37_arg3, f37_arg1.value )
	Engine.SetModelValue( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" ), f37_arg3 ), f37_arg1.value )
	Engine.LobbyHostSessionSetDirty( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionDirty.SESSION_DIRTY_UI )
end

CoD.OptionsUtility.CreateGametypeSettingsDataSource = function ( f38_arg0, f38_arg1, f38_arg2, f38_arg3, f38_arg4 )
	local f38_local0 = tonumber( Engine.GetGametypeSetting( f38_arg3 ) )
	if f38_local0 == nil then
		f38_local0 = 0
	end
	DataSources[f38_arg1] = DataSourceHelpers.ListSetup( f38_arg1, function ( f39_arg0 )
		local f39_local0 = {}
		for f39_local4, f39_local5 in ipairs( f38_arg2 ) do
			table.insert( f39_local0, {
				models = {
					text = f38_arg2[f39_local4].name
				},
				properties = {
					title = f38_arg2[f39_local4].title,
					desc = f38_arg2[f39_local4].desc,
					image = f38_arg2[f39_local4].image,
					value = f38_arg2[f39_local4].value,
					actionParam = f38_arg3,
					action = CoD.OptionsUtility.GametypeSettingsItemSelectedFunction,
					selectIndex = f38_arg2[f39_local4].value == f38_local0,
					loopEdges = f38_arg4,
					revert = function ( f40_arg0 )
						Engine.SetGametypeSetting( f38_arg3, Engine.GetGametypeSetting( f38_arg3, true ) )
					end
				}
			} )
		end
		f39_local0[1].properties.first = true
		f39_local0[#f38_arg2].properties.last = true
		return f39_local0
	end, nil, nil, nil )
	return f38_arg1
end

CoD.OptionsUtility.CreateEnabledDisabledProfileVar = function ( f41_arg0, f41_arg1, f41_arg2, f41_arg3, f41_arg4 )
	local f41_local0 = {
		{
			name = Engine.Localize( "MENU_ENABLED" ),
			value = 1,
			title = f41_arg1,
			desc = f41_arg2
		},
		{
			name = Engine.Localize( "MENU_DISABLED" ),
			value = 0,
			title = f41_arg1,
			desc = f41_arg2
		}
	}
	return {
		models = {
			name = Engine.Localize( f41_arg1 ),
			desc = Engine.Localize( f41_arg2 ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateOptionDataSource( f41_arg0, f41_arg4, f41_local0, f41_arg3 ),
			currentSelection = CoD.OptionsUtility.GetProfileSelection( f41_arg0, f41_local0, f41_arg3 )
		},
		properties = {}
	}
end

CoD.OptionsUtility.CreateEnabledDisabledOptions = function ( f42_arg0, f42_arg1, f42_arg2, f42_arg3, f42_arg4 )
	return {
		models = {
			name = Engine.Localize( f42_arg1 ),
			desc = Engine.Localize( f42_arg2 ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateGametypeSettingsDataSource( f42_arg0, f42_arg4, {
				{
					name = Engine.Localize( "MENU_ENABLED" ),
					value = 1,
					title = f42_arg1,
					desc = f42_arg2
				},
				{
					name = Engine.Localize( "MENU_DISABLED" ),
					value = 0,
					title = f42_arg1,
					desc = f42_arg2
				}
			}, f42_arg3, true ),
			setting = f42_arg3
		},
		properties = {
			revert = function ( f43_arg0 )
				Engine.SetGametypeSetting( f42_arg3, Engine.GetGametypeSetting( f42_arg3, true ) )
			end
			
		}
	}
end

CoD.OptionsUtility.CreateListOptions = function ( f44_arg0, f44_arg1, f44_arg2, f44_arg3, f44_arg4, f44_arg5 )
	local f44_local0 = f44_arg4.setting or f44_arg3
	local f44_local1 = {}
	local f44_local2 = Engine.GetDecimalDelimiter()
	for f44_local9, f44_local10 in ipairs( f44_arg4.values ) do
		local f44_local6 = f44_local10
		if tonumber( f44_local10 ) then
			f44_local6 = string.gsub( f44_local6, "%.", f44_local2, 1 )
		end
		local f44_local7 = f44_local6
		if f44_arg4.labels then
			if f44_arg4.labels[f44_local9] then
				f44_local7 = f44_arg4.labels[f44_local9]
			else
				f44_local7 = f44_arg4.labels[#f44_arg4.labels]
			end
		end
		local f44_local8 = ""
		if f44_arg2 then
			if f44_arg2[f44_local9] then
				f44_local8 = f44_arg2[f44_local9]
			else
				f44_local8 = f44_arg2[#f44_arg2]
			end
		end
		f44_local1[#f44_local1 + 1] = {
			name = Engine.Localize( f44_local7, f44_local6 ),
			value = f44_local10,
			title = f44_arg1,
			desc = f44_local8
		}
	end
	return {
		models = {
			name = Engine.Localize( f44_arg1 ),
			image = RegisterMaterial( "" ),
			optionsDatasource = CoD.OptionsUtility.CreateGametypeSettingsDataSource( f44_arg0, f44_arg5, f44_local1, f44_local0, true ),
			setting = f44_local0
		},
		properties = {
			revert = function ( f45_arg0 )
				Engine.SetGametypeSetting( f44_local0, Engine.GetGametypeSetting( f44_local0, true ) )
			end
			
		}
	}
end

CoD.OptionsUtility.CreateDvarSettingsDataSource = function ( f46_arg0, f46_arg1, f46_arg2, f46_arg3, f46_arg4, f46_arg5 )
	local f46_local0 = Engine.DvarInt( nil, f46_arg3 )
	if f46_local0 == nil then
		f46_local0 = 0
	end
	DataSources[f46_arg1] = DataSourceHelpers.ListSetup( f46_arg1, function ( f47_arg0 )
		local f47_local0 = {}
		for f47_local4, f47_local5 in ipairs( f46_arg2 ) do
			table.insert( f47_local0, {
				models = {
					text = f46_arg2[f47_local4].name
				},
				properties = {
					title = f46_arg2[f47_local4].title,
					desc = f46_arg2[f47_local4].desc,
					image = f46_arg2[f47_local4].image,
					value = f46_arg2[f47_local4].value,
					default = f46_arg2[f47_local4].default,
					actionParam = f46_arg3,
					action = f46_arg5,
					selectIndex = f46_arg2[f47_local4].value == f46_local0,
					loopEdges = f46_arg4,
					showChangeIndicator = function ( f48_arg0, f48_arg1, f48_arg2 )
						return f48_arg0.default ~= true
					end
				}
			} )
		end
		f47_local0[1].properties.first = true
		f47_local0[#f46_arg2].properties.last = true
		return f47_local0
	end, nil, nil, nil )
	return f46_arg1
end

CoD.OptionsUtility.CreateDvarSettings = function ( f49_arg0, f49_arg1, f49_arg2, f49_arg3, f49_arg4, f49_arg5, f49_arg6, f49_arg7 )
	local f49_local0 = {}
	local f49_local1 = nil
	for f49_local5, f49_local6 in ipairs( f49_arg5 ) do
		if f49_local6.default == true then
			f49_local1 = f49_local6.value
		end
		table.insert( f49_local0, {
			name = f49_local6.option,
			value = f49_local6.value,
			title = f49_arg1,
			desc = f49_arg2,
			default = f49_local6.default
		} )
	end
	return {
		models = {
			name = Engine.Localize( f49_arg1 ),
			desc = Engine.Localize( f49_arg2 ),
			image = f49_arg6,
			optionsDatasource = CoD.OptionsUtility.CreateDvarSettingsDataSource( f49_arg0, f49_arg3, f49_local0, f49_arg4, false, f49_arg7 )
		},
		properties = {
			revert = function ( f50_arg0 )
				Engine.SetDvar( f49_arg4, f49_local1 )
			end
			
		}
	}
end

CoD.OptionsUtility.CreateNamedSettings = function ( f51_arg0, f51_arg1, f51_arg2, f51_arg3, f51_arg4, f51_arg5, f51_arg6 )
	local f51_local0 = {}
	for f51_local4, f51_local5 in ipairs( f51_arg5 ) do
		table.insert( f51_local0, {
			name = f51_local5.option,
			value = f51_local5.value,
			title = f51_arg1,
			desc = f51_arg2
		} )
	end
	return {
		models = {
			name = Engine.Localize( f51_arg1 ),
			desc = Engine.Localize( f51_arg2 ),
			image = f51_arg6,
			optionsDatasource = CoD.OptionsUtility.CreateGametypeSettingsDataSource( f51_arg0, f51_arg3, f51_local0, f51_arg4 ),
			setting = f51_arg4
		},
		properties = {
			revert = function ( f52_arg0 )
				Engine.SetGametypeSetting( f51_arg4, Engine.GetGametypeSetting( f51_arg4, true ) )
			end
			
		}
	}
end

function UpdateInfoModels( f53_arg0 )
	local f53_local0 = f53_arg0.title
	local f53_local1 = f53_arg0.desc
	local f53_local2 = f53_arg0.image
	local f53_local3 = Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" )
	Engine.SetModelValue( Engine.CreateModel( f53_local3, "title" ), f53_local0 )
	Engine.SetModelValue( Engine.CreateModel( f53_local3, "description" ), f53_local1 )
	Engine.SetModelValue( Engine.CreateModel( f53_local3, "image" ), f53_local2 )
end

CoD.OptionsUtility.GametypeSettingsSetItemRestrictionState = function ( f54_arg0, f54_arg1, f54_arg2, f54_arg3, f54_arg4 )
	local f54_local0 = f54_arg1.value
	local f54_local1 = f54_arg3.itemIndex
	UpdateInfoModels( f54_arg1 )
	if f54_local1 then
		if f54_local0 == Engine.GetItemRestrictionState( f54_local1, false ) then
			return 
		end
		Engine.SetItemRestrictionState( f54_local1, f54_local0 )
		print( "Setting Item Restriction: Item: " .. f54_local1 .. " State: " .. f54_local0 )
		local f54_local2 = f54_arg1:getParent()
		f54_local2 = f54_local2:getParent()
		f54_local2 = f54_local2:getParent()
		f54_local2:processEvent( {
			name = "update_state",
			controller = f54_arg2
		} )
		Engine.LobbyHostSessionSetDirty( Enum.LobbyType.LOBBY_TYPE_GAME, Enum.SessionDirty.SESSION_DIRTY_UI )
	end
end

CoD.OptionsUtility.GametypeSettingsSetAttachmentRestrictionState = function ( f55_arg0, f55_arg1, f55_arg2, f55_arg3, f55_arg4 )
	local f55_local0 = f55_arg3.attachmentIndex
	local f55_local1 = f55_arg1.value
	UpdateInfoModels( f55_arg1 )
	if not f55_local1 then
		return 
	end
	local f55_local2, f55_local3 = CoD.CACUtility.GetAllItems()
	for f55_local7, f55_local8 in pairs( f55_local2 ) do
		if f55_local8.attachments and f55_local8.attachments[f55_local0] and f55_local1 ~= Engine.GetAttachmentRestrictionState( f55_local0, f55_local7, false ) then
			Engine.SetAttachmentRestrictionState( f55_local0, f55_local7, f55_local1 )
			print( "Setting Weapon Attachment Restriction: Attachment: " .. f55_local0 .. " Weapon: " .. f55_local7 .. " State: " .. f55_local1 )
		end
	end
end

CoD.OptionsUtility.GametypeSettingsSetAttachmentRestrictionStateForGroup = function ( f56_arg0, f56_arg1, f56_arg2, f56_arg3, f56_arg4 )
	local f56_local0 = f56_arg3.attachmentIndex
	local f56_local1 = f56_arg3.weaponGroups
	local f56_local2 = f56_arg1.value
	UpdateInfoModels( f56_arg1 )
	if not f56_local2 then
		return 
	end
	local f56_local3, f56_local4 = CoD.CACUtility.GetAllItems()
	for f56_local8, f56_local9 in pairs( f56_local3 ) do
		if f56_local9.attachments and f56_local9.attachments[f56_local0] and f56_local1[f56_local9.groupIndex] and f56_local2 ~= Engine.GetAttachmentRestrictionState( f56_local0, f56_local8, false ) then
			Engine.SetAttachmentRestrictionState( f56_local0, f56_local8, f56_local2 )
			print( "Setting Weapon Attachment Restriction: Attachment: " .. f56_local0 .. " Weapon: " .. f56_local8 .. " State: " .. f56_local2 )
		end
	end
	Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" ), "updateWeaponList" ) )
	f56_local7 = f56_arg1:getParent()
	if f56_local7 then
		f56_local7 = f56_local7:getParent()
		if f56_local7 then
			f56_local7 = f56_local7:getParent()
			if f56_local7 then
				f56_local7:processEvent( {
					name = "update_state",
					controller = f56_arg2
				} )
			end
		end
	end
end

CoD.OptionsUtility.GametypeSettingsSetAttachmentRestrictionStateForWeapon = function ( f57_arg0, f57_arg1, f57_arg2, f57_arg3, f57_arg4 )
	local f57_local0 = f57_arg3.attachmentIndex
	local f57_local1 = f57_arg3.weaponIndex
	local f57_local2 = f57_arg1.value
	UpdateInfoModels( f57_arg1 )
	if f57_local2 == Engine.GetAttachmentRestrictionState( f57_local0, f57_local1, false ) then
		return 
	else
		Engine.SetAttachmentRestrictionState( f57_local0, f57_local1, f57_local2 )
		print( "Setting Weapon Attachment Restriction: Attachment: " .. f57_local0 .. " Weapon: " .. f57_local1 .. " State: " .. f57_local2 )
		Engine.ForceNotifyModelSubscriptions( Engine.CreateModel( Engine.CreateModel( Engine.GetGlobalModel(), "GametypeSettings" ), "updateWeaponGroup" ) )
		local f57_local3 = f57_arg1:getParent()
		f57_local3 = f57_local3:getParent()
		f57_local3 = f57_local3:getParent()
		f57_local3:processEvent( {
			name = "update_state",
			controller = f57_arg2
		} )
	end
end

CoD.OptionsUtility.CreateItemRestrictionSettings = function ( f58_arg0, f58_arg1, f58_arg2, f58_arg3, f58_arg4, f58_arg5, f58_arg6, f58_arg7, f58_arg8, f58_arg9 )
	local f58_local0 = {}
	for f58_local4, f58_local5 in ipairs( f58_arg4 ) do
		table.insert( f58_local0, {
			name = f58_local5.option,
			value = f58_local5.value,
			title = f58_arg1,
			desc = f58_local5.desc,
			image = f58_arg5,
			disabled = f58_local5.disabled,
			default = f58_local5.default
		} )
	end
	DataSources[f58_arg3] = DataSourceHelpers.ListSetup( f58_arg3, function ( f59_arg0 )
		local f59_local0 = {}
		for f59_local4, f59_local5 in ipairs( f58_local0 ) do
			table.insert( f59_local0, {
				models = {
					text = f58_local0[f59_local4].name
				},
				properties = {
					title = f58_local0[f59_local4].title,
					desc = f58_local0[f59_local4].desc,
					image = f58_local0[f59_local4].image,
					value = f58_local0[f59_local4].value,
					default = f58_local0[f59_local4].default,
					actionParam = f58_arg7,
					action = f58_arg6,
					selectIndex = f58_local0[f59_local4].value == f58_arg8( f58_arg7 ),
					loopEdges = false,
					showChangeIndicator = function ( f60_arg0, f60_arg1, f60_arg2 )
						return f60_arg0.default ~= true
					end,
					revert = function ( f61_arg0 )
						f58_arg9( f61_arg0 )
					end
				}
			} )
		end
		f59_local0[1].properties.first = true
		f59_local0[#f58_local0].properties.last = true
		return f59_local0
	end, nil, nil, nil )
	return {
		models = {
			name = Engine.Localize( f58_arg1 ),
			desc = Engine.Localize( f58_arg2 ),
			image = f58_arg5,
			optionsDatasource = f58_arg3,
			itemIndex = f58_arg7.itemIndex,
			attachmentIndex = f58_arg7.attachmentIndex,
			weaponIndex = f58_arg7.weaponIndex,
			weaponGroups = f58_arg7.weaponGroups
		},
		properties = {
			itemIndex = f58_arg7.itemIndex,
			attachmentIndex = f58_arg7.attachmentIndex,
			weaponIndex = f58_arg7.weaponIndex,
			weaponGroups = f58_arg7.weaponGroups,
			revert = function ( f62_arg0 )
				f58_arg9( f62_arg0 )
			end
			
		}
	}
end

CoD.OptionsUtility.REGULATION_FETCH_IDLE = 0
CoD.OptionsUtility.REGULATION_FETCH_IN_PROGRESS = 1
CoD.OptionsUtility.REGULATION_FETCH_COMPLETE = 2
CoD.OptionsUtility.REGULATION_FETCH_FAILED = 3
CoD.OptionsUtility.REGULATION_GET_PREFERENCE_FETCH_IDLE = 0
CoD.OptionsUtility.REGULATION_GET_PREFERENCE_FETCH_IN_PROGRESS = 1
CoD.OptionsUtility.REGULATION_GET_PREFERENCE_FETCH_COMPLETE = 2
CoD.OptionsUtility.REGULATION_GET_PREFERENCE_FETCH_FAILED = 3
CoD.OptionsUtility.REGULATION_SET_PREFERENCE_TASK_STATE_IDLE = 0
CoD.OptionsUtility.REGULATION_SET_PREFERENCE_TASK_STATE_IN_PROGRESS = 1
CoD.OptionsUtility.REGULATION_SET_PREFERENCE_TASK_STATE_COMPLETE = 2
CoD.OptionsUtility.REGULATION_SET_PREFERENCE_TASK_STATE_FAILED = 3
CoD.OptionsUtility.PrivacySettingsList = {
	{
		privacySettingRef = "ccpa",
		versionList = {
			{
				buttonLabel = "MENU_PRIVACY_CCPA_BUTTON_LABEL",
				inverseOptIn = true,
				defaultCheckBoxOn = false,
				descEntryList = {
					{
						descEntry = "MENU_PRIVACY_CCPA_DESC"
					}
				}
			}
		}
	}
}
CoD.OptionsUtility.RefetchRegulations = function ( f63_arg0, f63_arg1 )
	local f63_local0 = Engine.GetModel( DataSources.PrivacySettingManagementForm.getModel( f63_arg0 ), "updateProgressState" )
	f63_arg1._refetchRegulationsModelSubscription = f63_arg1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f63_arg0 ), "Regulation.getRegulationTaskState" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue ~= CoD.OptionsUtility.REGULATION_FETCH_IDLE and modelValue ~= CoD.OptionsUtility.REGULATION_FETCH_IN_PROGRESS then
			if f63_arg1._refetchRegulationsModelSubscription then
				f63_arg1:removeSubscription( f63_arg1._refetchRegulationsModelSubscription )
				f63_arg1._refetchRegulationsModelSubscription = nil
			end
			if modelValue == CoD.OptionsUtility.REGULATION_FETCH_COMPLETE then
				if f63_arg1._updatePrivacySettingsTimeOutTimer then
					f63_arg1._updatePrivacySettingsTimeOutTimer:close()
					f63_arg1._updatePrivacySettingsTimeOutTimer = nil
				end
				Engine.SetModelValue( f63_local0, CoD.OptionsUtility.REGULATION_SET_PREFERENCE_TASK_STATE_COMPLETE )
			elseif modelValue == CoD.OptionsUtility.REGULATION_FETCH_FAILED then
				Engine.SetModelValue( f63_local0, CoD.OptionsUtility.REGULATION_SET_PREFERENCE_TASK_STATE_FAILED )
			end
		end
	end, false )
	Engine.RefetchRegulation( f63_arg0 )
end

CoD.OptionsUtility.RefetchUserRegulationPreferences = function ( f65_arg0, f65_arg1 )
	local f65_local0 = Engine.GetModel( DataSources.PrivacySettingManagementForm.getModel( f65_arg0 ), "updateProgressState" )
	f65_arg1._refetchRegulationPreferencesModelSubscription = f65_arg1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f65_arg0 ), "Regulation.getRegulationUserPreferenceTaskState" ), function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue ~= CoD.OptionsUtility.REGULATION_GET_PREFERENCE_FETCH_IDLE and modelValue ~= CoD.OptionsUtility.REGULATION_GET_PREFERENCE_FETCH_IN_PROGRESS then
			if f65_arg1._refetchRegulationPreferencesModelSubscription then
				f65_arg1:removeSubscription( f65_arg1._refetchRegulationPreferencesModelSubscription )
				f65_arg1._refetchRegulationPreferencesModelSubscription = nil
			end
			if modelValue == CoD.OptionsUtility.REGULATION_GET_PREFERENCE_FETCH_COMPLETE then
				CoD.OptionsUtility.RefetchRegulations( f65_arg0, f65_arg1 )
			elseif modelValue == CoD.OptionsUtility.REGULATION_GET_PREFERENCE_FETCH_FAILED then
				Engine.SetModelValue( f65_local0, CoD.OptionsUtility.REGULATION_SET_PREFERENCE_TASK_STATE_FAILED )
			end
		end
	end, false )
	Engine.RefetchUserRegulationPreference( f65_arg0 )
end

CoD.OptionsUtility.DelaySetNextUserRegulationPreference = function ( f67_arg0, f67_arg1, f67_arg2 )
	f67_arg1._delaySetNextUserRegulationPreferenceTimer = LUI.UITimer.newElementTimer( f67_arg2, true, function ()
		if f67_arg1._delaySetNextUserRegulationPreferenceTimer then
			f67_arg1._delaySetNextUserRegulationPreferenceTimer:close()
			f67_arg1._delaySetNextUserRegulationPreferenceTimer = nil
		end
		CoD.OptionsUtility.SetNextUserRegulationPreference( f67_arg0, f67_arg1 )
	end )
	f67_arg1:addElement( f67_arg1._delaySetNextUserRegulationPreferenceTimer )
end

CoD.OptionsUtility.SetNextUserRegulationPreference = function ( f69_arg0, f69_arg1 )
	local f69_local0 = Engine.GetModel( DataSources.PrivacySettingManagementForm.getModel( f69_arg0 ), "updateProgressState" )
	if #f69_arg1._regulationPreferencesToSet < f69_arg1._regultionIndex then
		CoD.OptionsUtility.RefetchUserRegulationPreferences( f69_arg0, f69_arg1 )
	else
		f69_arg1._setRegulationPreferenceModelSubscription = f69_arg1:subscribeToModel( Engine.GetModel( Engine.GetModelForController( f69_arg0 ), "Regulation.updateRegulationTaskState" ), function ( model )
			local modelValue = Engine.GetModelValue( model )
			if modelValue ~= CoD.OptionsUtility.REGULATION_SET_PREFERENCE_TASK_STATE_IDLE and modelValue ~= CoD.OptionsUtility.REGULATION_SET_PREFERENCE_TASK_STATE_IN_PROGRESS then
				if f69_arg1._setRegulationPreferenceModelSubscription then
					f69_arg1:removeSubscription( f69_arg1._setRegulationPreferenceModelSubscription )
					f69_arg1._setRegulationPreferenceModelSubscription = nil
				end
				if modelValue == CoD.OptionsUtility.REGULATION_SET_PREFERENCE_TASK_STATE_COMPLETE then
					f69_arg1._regultionIndex = f69_arg1._regultionIndex + 1
					CoD.OptionsUtility.DelaySetNextUserRegulationPreference( f69_arg0, f69_arg1, 250 )
				elseif modelValue == CoD.OptionsUtility.REGULATION_SET_PREFERENCE_TASK_STATE_FAILED then
					Engine.SetModelValue( f69_local0, CoD.OptionsUtility.REGULATION_SET_PREFERENCE_TASK_STATE_FAILED )
				end
			end
		end, false )
		local f69_local1 = f69_arg1._regulationPreferencesToSet[f69_arg1._regultionIndex]
		Engine.Exec( f69_arg0, "setUserRegulationPreference " .. f69_local1.regulationName .. " " .. f69_local1.versionNumber .. " " .. (f69_local1.selected and "1" or "0") )
	end
end

CoD.OptionsUtility.ApplyPrivacySettingUpdates = function ( f71_arg0, f71_arg1, f71_arg2 )
	local f71_local0 = Engine.GetModel( Engine.GetModelForController( f71_arg1 ), "Regulation" )
	local f71_local1 = Engine.GetModel( DataSources.PrivacySettingManagementForm.getModel( f71_arg1 ), "updateProgressState" )
	Engine.SetModelValue( f71_local1, CoD.OptionsUtility.REGULATION_SET_PREFERENCE_TASK_STATE_IN_PROGRESS )
	f71_arg2 = OpenPopup( f71_arg2, "StartMenu_Options_PrivacySettings_UpdatePopup", f71_arg1 )
	f71_arg2._regultionIndex = 1
	f71_arg2._regulationPreferencesToSet = {}
	if f71_arg0.PrivacySettingOptionList then
		for f71_local6, f71_local7 in ipairs( f71_arg0.PrivacySettingOptionList ) do
			local f71_local8 = f71_local7.properties.privacySettingProperties
			if f71_local8 then
				local f71_local5 = Engine.GetModelValue( Engine.GetModel( f71_local7.model, "selected" ) )
				if f71_local8.inverseOptIn then
					f71_local5 = not f71_local5
				end
				table.insert( f71_arg2._regulationPreferencesToSet, {
					regulationName = f71_local8.regulationName,
					versionNumber = f71_local8.versionNumber,
					selected = f71_local5
				} )
			end
		end
	end
	f71_arg2._updatePrivacySettingsTimeOutTimer = LUI.UITimer.newElementTimer( 30000, true, function ()
		if f71_arg2._updatePrivacySettingsTimeOutTimer then
			f71_arg2._updatePrivacySettingsTimeOutTimer:close()
			f71_arg2._updatePrivacySettingsTimeOutTimer = nil
		end
		Engine.SetModelValue( f71_local1, CoD.OptionsUtility.REGULATION_SET_PREFERENCE_TASK_STATE_FAILED )
	end )
	f71_arg2:addElement( f71_arg2._updatePrivacySettingsTimeOutTimer )
	CoD.OptionsUtility.SetNextUserRegulationPreference( f71_arg1, f71_arg2 )
end

DataSources.PrivacySettingOptionList = DataSourceHelpers.ListSetup( "PrivacySettingOptionList", function ( f73_arg0 )
	local f73_local0 = {}
	local f73_local1 = {}
	local f73_local2 = function ( f74_arg0, f74_arg1, f74_arg2, f74_arg3, f74_arg4 )
		local f74_local0 = Engine.GetModel( f74_arg1:getModel(), "selected" )
		Engine.SetModelValue( f74_local0, not Engine.GetModelValue( f74_local0 ) )
	end
	
	local f73_local3 = function ( f75_arg0, f75_arg1, f75_arg2, f75_arg3, f75_arg4 )
		if f75_arg1.gridInfoTable and f75_arg1.gridInfoTable.parentGrid then
			CoD.OptionsUtility.ApplyPrivacySettingUpdates( f75_arg1.gridInfoTable.parentGrid, f75_arg2, f75_arg4 )
		end
	end
	
	local f73_local4 = function ( f76_arg0, f76_arg1, f76_arg2, f76_arg3, f76_arg4, f76_arg5 )
		local f76_local0 = table.insert
		local f76_local1 = f73_local0
		local f76_local2 = {
			models = {
				displayText = f76_arg0,
				selected = f76_arg1,
				isUpdateButton = f76_arg5
			}
		}
		local f76_local3 = {
			descTextList = f76_arg2,
			privacySettingProperties = f76_arg3,
			sortIndex = f76_arg4
		}
		local f76_local4
		if f76_arg5 then
			f76_local4 = f73_local3
			if not f76_local4 then
			
			else
				f76_local3.action = f76_local4
				f76_local2.properties = f76_local3
				f76_local0( f76_local1, f76_local2 )
			end
		end
		f76_local4 = f73_local2
	end
	
	for f73_local8, f73_local9 in ipairs( Engine.GetUserRegulationPreference( f73_arg0 ) ) do
		f73_local1[f73_local9.name] = f73_local9
	end
	for f73_local9, f73_local10 in ipairs( Engine.GetRegulations( f73_arg0 ) ) do
		if not f73_local1[f73_local10.name] then
			f73_local1[f73_local10.name] = f73_local10
		end
	end
	for f73_local9, f73_local10 in ipairs( CoD.OptionsUtility.PrivacySettingsList ) do
		local f73_local24 = f73_local1[f73_local10.privacySettingRef]
		if f73_local10.versionList and f73_local24 then
			local f73_local11 = f73_local10.versionList[#f73_local10.versionList]
			if f73_local11.descEntryList then
				local f73_local12 = f73_local11.descEntryList[1]
				local f73_local13 = f73_local11.descEntryList[1].descEntry
			end
			local f73_local14 = f73_local12 and f73_local13 or ""
			local f73_local15
			if #f73_local10.versionList > 0 then
				f73_local15 = #f73_local10.versionList - 1
				if not f73_local15 then
				
				else
					local f73_local16 = f73_local11.inverseOptIn == true
					local f73_local17 = f73_local24.optin
					if f73_local17 == nil then
						f73_local17 = f73_local11.defaultCheckBoxOn == 1
					elseif f73_local16 then
						f73_local17 = not f73_local17
					end
					local f73_local18 = {}
					for f73_local22, f73_local23 in ipairs( f73_local11.descEntryList ) do
						table.insert( f73_local18, f73_local23.descEntry )
					end
					f73_local4( f73_local11.buttonLabel, f73_local17, f73_local18, {
						regulationName = f73_local10.privacySettingRef,
						versionNumber = f73_local15,
						inverseOptIn = f73_local16
					}, f73_local9, false )
				end
			end
			f73_local15 = 0
		end
	end
	f73_local4( "MENU_PRIVACY_SETTINGS_UPDATE_PROMPT", false, {
		"MENU_PRIVACY_SETTINGS_UPDATE_DESC"
	}, nil, 1000, true )
	table.sort( f73_local0, function ( f77_arg0, f77_arg1 )
		return f77_arg0.properties.sortIndex < f77_arg1.properties.sortIndex
	end )
	return f73_local0
end )
DataSources.PrivacySettingManagementForm = {
	getModel = function ( f78_arg0 )
		local f78_local0 = Engine.GetModel( Engine.GetModelForController( f78_arg0 ), "PrivacySettingManagementForm" )
		if f78_local0 == nil then
			f78_local0 = Engine.CreateModel( Engine.GetModelForController( f78_arg0 ), "PrivacySettingManagementForm" )
			Engine.SetModelValue( Engine.CreateModel( f78_local0, "descText" ), "" )
			Engine.SetModelValue( Engine.CreateModel( f78_local0, "currentPage" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f78_local0, "lastPage" ), 0 )
			Engine.SetModelValue( Engine.CreateModel( f78_local0, "updateProgressState" ), CoD.OptionsUtility.REGULATION_SET_PREFERENCE_TASK_STATE_IDLE )
		end
		return f78_local0
	end
}
